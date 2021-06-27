
	thumb_func_start ov49_02258800
ov49_02258800: @ 0x02258800
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r2, r2, #0xc
	str r2, [r1]
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #0xc
	str r0, [r1, #8]
	str r3, [r1, #4]
	bx lr
	thumb_func_end ov49_02258800

	thumb_func_start ov49_02258814
ov49_02258814: @ 0x02258814
	ldr r3, [r0]
	asrs r2, r3, #0xb
	lsrs r2, r2, #0x14
	adds r2, r3, r2
	asrs r2, r2, #0xc
	strh r2, [r1]
	ldr r2, [r0, #8]
	asrs r0, r2, #0xb
	lsrs r0, r0, #0x14
	adds r0, r2, r0
	asrs r0, r0, #0xc
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
	thumb_func_end ov49_02258814

	thumb_func_start ov49_02258830
ov49_02258830: @ 0x02258830
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	adds r7, r3, #0
	bl FUN_02007C98
	adds r4, r0, #0
	blx FUN_020C3B50
	adds r6, r0, #0
	bl FUN_0201F668
	adds r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #8
	blx FUN_020BE4D0
	adds r0, r6, #0
	blx FUN_020BE588
	str r0, [sp, #4]
	adds r0, r4, #0
	bl FUN_02025ACC
	adds r6, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0201AA8C
	str r0, [r5]
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020E5AD8
	ldr r0, [r5]
	blx FUN_020C3B50
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	adds r5, r0, #0
	blx FUN_020BE404
	ldr r1, [sp, #4]
	adds r0, r5, #0
	blx FUN_020BE530
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02258830

	thumb_func_start ov49_022588A0
ov49_022588A0: @ 0x022588A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r5, #0
	add r1, sp, #0x54
	add r2, sp, #0x58
	add r3, sp, #0x5c
	bl FUN_020182B0
	adds r0, r5, #0
	add r1, sp, #0x48
	add r2, sp, #0x4c
	add r3, sp, #0x50
	bl FUN_020182CC
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182EC
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020182EC
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #2
	bl FUN_020182EC
	adds r5, r0, #0
	add r0, sp, #0x24
	blx FUN_020CAFEC
	asrs r0, r6, #4
	lsls r3, r0, #1
	lsls r1, r3, #1
	ldr r2, _02258954 @ =0x021094DC
	adds r3, r3, #1
	lsls r3, r3, #1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, sp, #0
	bl FUN_020CB0D0
	add r1, sp, #0x24
	add r0, sp, #0
	adds r2, r1, #0
	blx FUN_020CB410
	asrs r0, r5, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	ldr r3, _02258954 @ =0x021094DC
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB108
	add r1, sp, #0x24
	add r0, sp, #0
	adds r2, r1, #0
	blx FUN_020CB410
	asrs r0, r7, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	ldr r3, _02258954 @ =0x021094DC
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB0EC
	add r1, sp, #0x24
	add r0, sp, #0
	adds r2, r1, #0
	blx FUN_020CB410
	ldr r0, [r4, #8]
	add r1, sp, #0x54
	add r2, sp, #0x24
	add r3, sp, #0x48
	bl FUN_0201F990
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02258954: .4byte 0x021094DC
	thumb_func_end ov49_022588A0

	thumb_func_start ov49_02258958
ov49_02258958: @ 0x02258958
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #4
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0x23
	movs r1, #0x2a
	adds r2, r5, #0
	bl FUN_02227EE0
	str r0, [r4]
	movs r0, #1
	movs r1, #0
	str r0, [sp]
	movs r0, #0xca
	adds r2, r1, #0
	adds r3, r5, #0
	bl FUN_02007A44
	adds r5, r0, #0
	ldr r0, [r4]
	adds r1, r5, #0
	bl FUN_02227F48
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02258958

	thumb_func_start ov49_02258994
ov49_02258994: @ 0x02258994
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02227F28
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_02258994

	thumb_func_start ov49_022589A8
ov49_022589A8: @ 0x022589A8
	movs r0, #0x23
	bx lr
	thumb_func_end ov49_022589A8

	thumb_func_start ov49_022589AC
ov49_022589AC: @ 0x022589AC
	ldr r3, _022589B4 @ =FUN_02227FA4
	ldr r0, [r0]
	bx r3
	nop
_022589B4: .4byte FUN_02227FA4
	thumb_func_end ov49_022589AC

	thumb_func_start ov49_022589B8
ov49_022589B8: @ 0x022589B8
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_02227FDC
	lsrs r0, r0, #0xf
	pop {r3, pc}
	thumb_func_end ov49_022589B8

	thumb_func_start ov49_022589C4
ov49_022589C4: @ 0x022589C4
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_02227FDC
	ldr r1, _022589D4 @ =0x00007FFF
	ands r0, r1
	pop {r3, pc}
	nop
_022589D4: .4byte 0x00007FFF
	thumb_func_end ov49_022589C4

	thumb_func_start ov49_022589D8
ov49_022589D8: @ 0x022589D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r5, #0
	ldr r7, [sp, #0x28]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r5, [sp, #0x10]
_022589EA:
	ldr r0, [sp, #0x10]
	movs r4, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_022589F2:
	lsls r1, r4, #0x10
	ldr r0, [sp]
	lsrs r1, r1, #0x10
	adds r2, r6, #0
	bl ov49_022589B8
	ldr r1, [sp, #4]
	cmp r0, r1
	bne _02258A1A
	cmp r5, r7
	blo _02258A18
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	strh r4, [r0]
	ldr r0, [sp, #0xc]
	add sp, #0x14
	strh r1, [r0]
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02258A18:
	adds r5, r5, #1
_02258A1A:
	adds r4, r4, #1
	cmp r4, #0x23
	blt _022589F2
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0x2a
	blt _022589EA
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_022589D8

	thumb_func_start ov49_02258A30
ov49_02258A30: @ 0x02258A30
	ldr r3, _02258A4C @ =0x02269634
	movs r2, #0
_02258A34:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A3E
	movs r0, #1
	bx lr
_02258A3E:
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, #0x20
	blo _02258A34
	movs r0, #0
	bx lr
	nop
_02258A4C: .4byte 0x02269634
	thumb_func_end ov49_02258A30

	thumb_func_start ov49_02258A50
ov49_02258A50: @ 0x02258A50
	ldr r3, _02258A6C @ =_02269624
	movs r2, #0
_02258A54:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A5E
	movs r0, #1
	bx lr
_02258A5E:
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, #3
	blo _02258A54
	movs r0, #0
	bx lr
	nop
_02258A6C: .4byte _02269624
	thumb_func_end ov49_02258A50

	thumb_func_start ov49_02258A70
ov49_02258A70: @ 0x02258A70
	ldr r3, _02258A8C @ =0x0226962C
	movs r2, #0
_02258A74:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A7E
	movs r0, #1
	bx lr
_02258A7E:
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, #7
	blo _02258A74
	movs r0, #0
	bx lr
	nop
_02258A8C: .4byte 0x0226962C
	thumb_func_end ov49_02258A70

	thumb_func_start ov49_02258A90
ov49_02258A90: @ 0x02258A90
	ldr r3, _02258AAC @ =0x02269628
	movs r2, #0
_02258A94:
	ldrb r1, [r3]
	cmp r0, r1
	bne _02258A9E
	movs r0, #1
	bx lr
_02258A9E:
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r2, #4
	blo _02258A94
	movs r0, #0
	bx lr
	nop
_02258AAC: .4byte 0x02269628
	thumb_func_end ov49_02258A90

	thumb_func_start ov49_02258AB0
ov49_02258AB0: @ 0x02258AB0
	ldr r0, [r0]
	bx lr
	thumb_func_end ov49_02258AB0

	thumb_func_start ov49_02258AB4
ov49_02258AB4: @ 0x02258AB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r3, #0
	movs r1, #0x28
	str r2, [sp]
	str r3, [sp, #4]
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x28
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r1, [sp, #4]
	adds r0, r5, #0
	bl FUN_02228010
	str r0, [r4]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0x20]
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02230498
	str r0, [r4, #4]
	ldr r1, [sp, #4]
	movs r0, #0x20
	bl FUN_02229A40
	str r0, [r4, #0x10]
	movs r0, #0x28
	adds r7, r5, #0
	muls r7, r0, r7
	ldr r0, [sp, #4]
	adds r1, r7, #0
	strh r5, [r4, #0xc]
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r7, #0
	str r0, [r4, #8]
	blx FUN_020E5B44
	ldr r0, [sp]
	str r0, [r4, #0x14]
	adds r0, r4, #0
	strh r6, [r4, #0xe]
	bl ov49_022591D8
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02258AB4

	thumb_func_start ov49_02258B20
ov49_02258B20: @ 0x02258B20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x10]
	bl FUN_02229A78
	ldr r0, [r4, #4]
	bl FUN_02230638
	ldr r0, [r4]
	bl FUN_02228050
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov49_02258B20

	thumb_func_start ov49_02258B44
ov49_02258B44: @ 0x02258B44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0222807C
	adds r0, r4, #0
	ldr r1, [r4, #4]
	adds r0, #0x18
	bl ov49_02259A54
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_02258B44

	thumb_func_start ov49_02258B5C
ov49_02258B5C: @ 0x02258B5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5, #0xc]
	movs r6, #0
	cmp r0, #0
	ble _02258B8C
	adds r4, r6, #0
_02258B6C:
	ldr r0, [r5, #8]
	adds r0, r0, r4
	bl ov49_022593FC
	cmp r0, #0
	bne _02258B82
	ldr r0, [r5, #8]
	adds r1, r5, #0
	adds r0, r0, r4
	ldr r2, [r0, #0x24]
	blx r2
_02258B82:
	ldrh r0, [r5, #0xc]
	adds r6, r6, #1
	adds r4, #0x28
	cmp r6, r0
	blt _02258B6C
_02258B8C:
	ldr r0, [r5, #0x14]
	bl ov49_02258AB0
	adds r4, r0, #0
	ldr r0, [r5, #0x10]
	add r1, sp, #8
	bl FUN_02229AC8
	cmp r0, #1
	bne _02258BC8
	add r7, sp, #0
	add r6, sp, #8
_02258BA4:
	ldr r1, [r5]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_02228C80
	cmp r0, #1
	bne _02258BBC
	ldr r0, [r5]
	adds r1, r7, #0
	bl FUN_02228068
_02258BBC:
	ldr r0, [r5, #0x10]
	adds r1, r6, #0
	bl FUN_02229AC8
	cmp r0, #1
	beq _02258BA4
_02258BC8:
	ldr r0, [r5, #4]
	bl FUN_02230680
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02258B5C

	thumb_func_start ov49_02258BD4
ov49_02258BD4: @ 0x02258BD4
	ldr r3, _02258BDC @ =FUN_022306B4
	ldr r0, [r0, #4]
	bx r3
	nop
_02258BDC: .4byte FUN_022306B4
	thumb_func_end ov49_02258BD4

	thumb_func_start ov49_02258BE0
ov49_02258BE0: @ 0x02258BE0
	ldr r3, _02258BE8 @ =FUN_022306F4
	ldr r0, [r0, #4]
	bx r3
	nop
_02258BE8: .4byte FUN_022306F4
	thumb_func_end ov49_02258BE0

	thumb_func_start ov49_02258BEC
ov49_02258BEC: @ 0x02258BEC
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r1, [r3, #4]
	lsls r3, r2, #2
	ldr r2, _02258C00 @ =0x02269660
	adds r0, #0x18
	ldr r2, [r2, r3]
	ldr r3, _02258C04 @ =ov49_02259A20
	bx r3
	nop
_02258C00: .4byte 0x02269660
_02258C04: .4byte ov49_02259A20
	thumb_func_end ov49_02258BEC

	thumb_func_start ov49_02258C08
ov49_02258C08: @ 0x02258C08
	lsls r2, r1, #2
	ldr r1, _02258C14 @ =0x02269660
	ldr r3, _02258C18 @ =ov49_02259A3C
	adds r0, #0x18
	ldr r1, [r1, r2]
	bx r3
	.align 2, 0
_02258C14: .4byte 0x02269660
_02258C18: .4byte ov49_02259A3C
	thumb_func_end ov49_02258C08

	thumb_func_start ov49_02258C1C
ov49_02258C1C: @ 0x02258C1C
	ldr r3, _02258C24 @ =FUN_02229A8C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_02258C24: .4byte FUN_02229A8C
	thumb_func_end ov49_02258C1C

	thumb_func_start ov49_02258C28
ov49_02258C28: @ 0x02258C28
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	add r2, sp, #4
	adds r4, r1, #0
	ldr r0, [r5, #0x14]
	movs r1, #3
	adds r2, #2
	add r3, sp, #4
	bl ov49_022589D8
	cmp r0, #0
	bne _02258C4A
	bl GF_AssertFail
_02258C4A:
	add r3, sp, #4
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02258C5C
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02258C28

	thumb_func_start ov49_02258C5C
ov49_02258C5C: @ 0x02258C5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	str r3, [sp]
	bl ov49_022593C0
	adds r4, r0, #0
	lsls r0, r7, #4
	add r1, sp, #4
	strh r0, [r1]
	ldr r0, [sp]
	movs r2, #0
	lsls r0, r0, #4
	strh r0, [r1, #2]
	strh r6, [r1, #4]
	strh r2, [r1, #6]
	strh r2, [r1, #8]
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	bne _02258C8C
	strh r2, [r1, #0xa]
	b _02258C90
_02258C8C:
	movs r0, #0x61
	strh r0, [r1, #0xa]
_02258C90:
	ldr r0, [r5]
	add r1, sp, #4
	bl FUN_022280B8
	str r0, [r4]
	ldr r0, [r5, #4]
	ldr r1, [r4]
	bl FUN_0223070C
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	str r4, [r5, #0x20]
	bl ov49_02258EEC
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02258C5C

	thumb_func_start ov49_02258CB8
ov49_02258CB8: @ 0x02258CB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r7, r1, #0
	str r2, [sp, #4]
	bl ov49_022593C0
	movs r6, #0
	str r0, [sp, #8]
	adds r4, r6, #0
_02258CCC:
	str r4, [sp]
	add r2, sp, #0xc
	ldr r0, [r5, #0x14]
	adds r1, r7, #4
	adds r2, #2
	add r3, sp, #0xc
	bl ov49_022589D8
	cmp r0, #0
	bne _02258CE6
	add sp, #0x1c
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02258CE6:
	adds r0, r5, #0
	bl ov49_02258DAC
	cmp r0, #0
	bne _02258CF4
	movs r6, #1
	b _02258D06
_02258CF4:
	add r1, sp, #0xc
	add r2, sp, #0xc
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	bl ov49_02258FDC
	cmp r0, #0
	bne _02258D06
	movs r6, #1
_02258D06:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r6, #0
	beq _02258CCC
	add r1, sp, #0xc
	ldrh r0, [r1, #2]
	lsls r0, r0, #4
	strh r0, [r1, #4]
	ldrh r0, [r1]
	lsls r0, r0, #4
	strh r0, [r1, #6]
	strh r7, [r1, #8]
	movs r0, #0
	strh r0, [r1, #0xa]
	movs r0, #1
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	strh r0, [r1, #0xe]
	ldr r0, [r5]
	add r1, sp, #0x10
	bl FUN_022280B8
	ldr r1, [sp, #8]
	str r0, [r1]
	ldr r0, [r5, #4]
	ldr r1, [r1]
	bl FUN_0223070C
	ldr r1, [sp, #8]
	movs r2, #0
	str r0, [r1, #4]
	adds r0, r5, #0
	bl ov49_02258EEC
	ldr r0, [sp, #8]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02258CB8

	thumb_func_start ov49_02258D54
ov49_02258D54: @ 0x02258D54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl FUN_02230884
	ldr r0, [r4]
	bl FUN_02228100
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x28
	blx FUN_020E5B44
	pop {r4, pc}
	thumb_func_end ov49_02258D54

	thumb_func_start ov49_02258D70
ov49_02258D70: @ 0x02258D70
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xc]
	adds r7, r1, #0
	movs r6, #0
	cmp r0, #0
	ble _02258DA6
	adds r4, r6, #0
_02258D80:
	ldr r0, [r5, #8]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _02258D9C
	movs r1, #4
	bl FUN_02228188
	cmp r0, r7
	bne _02258D9C
	movs r0, #0x28
	ldr r1, [r5, #8]
	muls r0, r6, r0
	adds r0, r1, r0
	pop {r3, r4, r5, r6, r7, pc}
_02258D9C:
	ldrh r0, [r5, #0xc]
	adds r6, r6, #1
	adds r4, #0x28
	cmp r6, r0
	blt _02258D80
_02258DA6:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02258D70

	thumb_func_start ov49_02258DAC
ov49_02258DAC: @ 0x02258DAC
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov49_02258DAC

	thumb_func_start ov49_02258DB0
ov49_02258DB0: @ 0x02258DB0
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end ov49_02258DB0

	thumb_func_start ov49_02258DB4
ov49_02258DB4: @ 0x02258DB4
	push {r0, r1, r2, r3}
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02258DC4
	bl GF_AssertFail
_02258DC4:
	add r1, sp, #8
	ldrh r2, [r1, #4]
	mov r3, sp
	ldr r0, [r4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_0222839C
	add r1, sp, #8
	mov r3, sp
	ldrh r2, [r1, #4]
	ldr r0, [r4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_022283AC
	ldr r0, [r4]
	movs r1, #5
	movs r2, #0
	bl FUN_022281F8
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov49_02258DB4

	thumb_func_start ov49_02258E04
ov49_02258E04: @ 0x02258E04
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r1, sp, #0x10
	adds r4, r2, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	subs r3, r3, #4
	adds r5, r0, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258DB4
	ldr r0, [r5]
	movs r1, #6
	adds r2, r4, #0
	bl FUN_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov49_02258E04

	thumb_func_start ov49_02258E34
ov49_02258E34: @ 0x02258E34
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _02258E44
	bl GF_AssertFail
_02258E44:
	ldr r0, [r4]
	bl FUN_022282F4
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1, #2]
	ldrh r0, [r1]
	lsls r1, r2, #0x10
	orrs r0, r1
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_02258E34

	thumb_func_start ov49_02258E60
ov49_02258E60: @ 0x02258E60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	cmp r0, #0
	bne _02258E70
	bl GF_AssertFail
_02258E70:
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_02228188
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_02258E60

	thumb_func_start ov49_02258E7C
ov49_02258E7C: @ 0x02258E7C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #5
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02228188
	cmp r0, #0
	beq _02258E96
	bl GF_AssertFail
_02258E96:
	ldr r0, [r4]
	movs r1, #4
	bl FUN_02228188
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02258E7C

	thumb_func_start ov49_02258EAC
ov49_02258EAC: @ 0x02258EAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	strh r6, [r1, #8]
	strb r7, [r1, #0xa]
	ldr r0, [r4]
	movs r1, #4
	bl FUN_02228188
	add r1, sp, #0
	strb r0, [r1, #0xb]
	ldr r0, [r5]
	add r1, sp, #4
	bl FUN_02228068
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02258EAC

	thumb_func_start ov49_02258EEC
ov49_02258EEC: @ 0x02258EEC
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r4, #0xa
	blt _02258EFC
	bl GF_AssertFail
_02258EFC:
	ldrb r0, [r5, #0xb]
	lsls r1, r0, #2
	ldr r0, _02258F30 @ =0x02269698
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02258F0E
	adds r0, r5, #0
	adds r1, r6, #0
	blx r2
_02258F0E:
	movs r2, #0
	strh r2, [r5, #8]
	strb r2, [r5, #0xa]
	adds r1, r5, #0
	strb r4, [r5, #0xb]
	adds r1, #0xc
	movs r0, #0x18
_02258F1C:
	strb r2, [r1]
	adds r1, r1, #1
	subs r0, r0, #1
	bne _02258F1C
	ldr r0, _02258F34 @ =0x022696C0
	lsls r1, r4, #2
	ldr r0, [r0, r1]
	str r0, [r5, #0x24]
	pop {r4, r5, r6, pc}
	nop
_02258F30: .4byte 0x02269698
_02258F34: .4byte 0x022696C0
	thumb_func_end ov49_02258EEC

	thumb_func_start ov49_02258F38
ov49_02258F38: @ 0x02258F38
	ldrb r0, [r0, #0xa]
	bx lr
	thumb_func_end ov49_02258F38

	thumb_func_start ov49_02258F3C
ov49_02258F3C: @ 0x02258F3C
	ldrb r0, [r0, #0xb]
	bx lr
	thumb_func_end ov49_02258F3C

	thumb_func_start ov49_02258F40
ov49_02258F40: @ 0x02258F40
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #6
	bl FUN_02228188
	adds r2, r0, #0
	ldr r0, [r4]
	ldr r1, [r5]
	bl FUN_022283BC
	cmp r0, #0
	bne _02258F60
	movs r0, #0
	pop {r3, r4, r5, pc}
_02258F60:
	movs r1, #4
	bl FUN_02228188
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_02258D70
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02258F40

	thumb_func_start ov49_02258F70
ov49_02258F70: @ 0x02258F70
	ldr r3, _02258F78 @ =FUN_022308B8
	ldr r0, [r0, #4]
	bx r3
	nop
_02258F78: .4byte FUN_022308B8
	thumb_func_end ov49_02258F70

	thumb_func_start ov49_02258F7C
ov49_02258F7C: @ 0x02258F7C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r0, r1, #4
	add r1, sp, #0
	strh r0, [r1]
	lsls r0, r2, #4
	strh r0, [r1, #2]
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_022284A4
	cmp r0, #0
	bne _02258FAA
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_02258FAA:
	ldrh r2, [r4, #0xc]
	movs r1, #0
	cmp r2, #0
	ble _02258FD0
	ldr r3, [r4, #8]
_02258FB4:
	ldr r2, [r3]
	cmp r2, r0
	bne _02258FC6
	movs r0, #0x28
	ldr r2, [r4, #8]
	muls r0, r1, r0
	add sp, #4
	adds r0, r2, r0
	pop {r3, r4, pc}
_02258FC6:
	ldrh r2, [r4, #0xc]
	adds r1, r1, #1
	adds r3, #0x28
	cmp r1, r2
	blt _02258FB4
_02258FD0:
	bl GF_AssertFail
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_02258F7C

	thumb_func_start ov49_02258FDC
ov49_02258FDC: @ 0x02258FDC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsrs r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldr r0, [r5]
	bl FUN_022282E8
	add r2, sp, #0
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	movs r1, #0xc
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r1, [r2, r1]
	lsls r0, r6, #4
	cmp r1, r0
	bne _0225902C
	movs r1, #0xe
	ldrsh r2, [r2, r1]
	lsls r1, r4, #4
	cmp r2, r1
	bne _0225902C
	add sp, #0x10
	movs r0, #1
	pop {r4, r5, r6, pc}
_0225902C:
	add r2, sp, #0
	movs r1, #8
	ldrsh r1, [r2, r1]
	cmp r1, r0
	bne _02259046
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	lsls r0, r4, #4
	cmp r1, r0
	bne _02259046
	add sp, #0x10
	movs r0, #1
	pop {r4, r5, r6, pc}
_02259046:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_02258FDC

	thumb_func_start ov49_0225904C
ov49_0225904C: @ 0x0225904C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r6, r0, #0
	ldr r0, [r1]
	str r2, [sp]
	str r3, [sp, #4]
	bl FUN_022282DC
	add r4, sp, #0x1c
	strh r0, [r4, #4]
	lsrs r0, r0, #0x10
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	mov r5, sp
	ldr r7, _0225912C @ =0x02269654
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #6]
	subs r5, r5, #4
	strh r0, [r4, #0xe]
	movs r0, #0
	str r0, [sp, #0x10]
	ldrh r0, [r4, #0xc]
	str r0, [sp, #0x14]
	ldrh r0, [r4, #0xe]
	str r0, [sp, #0x18]
_0225907E:
	ldr r0, [sp, #0x14]
	strh r0, [r5]
	ldr r0, [sp, #0x18]
	strh r0, [r5, #2]
	ldrb r1, [r7]
	ldr r0, [r5]
	bl FUN_02228270
	strh r0, [r4]
	lsrs r0, r0, #0x10
	strh r0, [r4, #2]
	ldrh r0, [r4]
	strh r0, [r4, #8]
	ldrh r0, [r4, #2]
	strh r0, [r4, #0xa]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	str r0, [sp, #0xc]
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r2, [sp, #0xc]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	lsls r2, r2, #0x10
	lsls r1, r1, #0x10
	ldr r0, [r6, #0x14]
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov49_022589AC
	cmp r0, #1
	beq _02259118
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r6, #0x14]
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov49_022589C4
	cmp r0, #0
	beq _022590E8
	cmp r0, #0x2a
	bne _02259118
_022590E8:
	ldrh r1, [r4, #8]
	ldr r0, [r6]
	strh r1, [r5]
	ldrh r1, [r4, #0xa]
	strh r1, [r5, #2]
	ldr r1, [r5]
	bl FUN_022284A4
	cmp r0, #0
	bne _02259118
	ldr r1, _0225912C @ =0x02269654
	ldr r0, [sp, #0x10]
	ldrb r1, [r1, r0]
	ldr r0, [sp]
	str r1, [r0]
	add r1, sp, #0x1c
	ldr r0, [sp, #4]
	ldrh r2, [r1, #8]
	add sp, #0x2c
	strh r2, [r0]
	ldrh r1, [r1, #0xa]
	strh r1, [r0, #2]
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02259118:
	ldr r0, [sp, #0x10]
	adds r7, r7, #1
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0225907E
	movs r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0225912C: .4byte 0x02269654
	thumb_func_end ov49_0225904C

	thumb_func_start ov49_02259130
ov49_02259130: @ 0x02259130
	ldr r3, _02259138 @ =FUN_0223089C
	ldr r0, [r0, #4]
	bx r3
	nop
_02259138: .4byte FUN_0223089C
	thumb_func_end ov49_02259130

	thumb_func_start ov49_0225913C
ov49_0225913C: @ 0x0225913C
	ldr r3, _02259144 @ =FUN_022308C0
	ldr r0, [r0, #4]
	bx r3
	nop
_02259144: .4byte FUN_022308C0
	thumb_func_end ov49_0225913C

	thumb_func_start ov49_02259148
ov49_02259148: @ 0x02259148
	ldr r3, _02259150 @ =FUN_022308E4
	ldr r0, [r0, #4]
	bx r3
	nop
_02259150: .4byte FUN_022308E4
	thumb_func_end ov49_02259148

	thumb_func_start ov49_02259154
ov49_02259154: @ 0x02259154
	ldr r3, _0225915C @ =FUN_02230908
	ldr r0, [r0, #4]
	bx r3
	nop
_0225915C: .4byte FUN_02230908
	thumb_func_end ov49_02259154

	thumb_func_start ov49_02259160
ov49_02259160: @ 0x02259160
	ldr r3, _02259168 @ =FUN_02230920
	ldr r0, [r0, #4]
	bx r3
	nop
_02259168: .4byte FUN_02230920
	thumb_func_end ov49_02259160

	thumb_func_start ov49_0225916C
ov49_0225916C: @ 0x0225916C
	push {r3, lr}
	cmp r1, #0
	ldr r0, [r0, #4]
	beq _0225917C
	movs r1, #1
	bl FUN_0223093C
	pop {r3, pc}
_0225917C:
	bl FUN_02230968
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225916C

	thumb_func_start ov49_02259184
ov49_02259184: @ 0x02259184
	push {r3, lr}
	cmp r1, #0
	ldr r0, [r0, #4]
	beq _02259194
	movs r1, #0
	bl FUN_0223093C
	pop {r3, pc}
_02259194:
	bl FUN_02230968
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02259184

	thumb_func_start ov49_0225919C
ov49_0225919C: @ 0x0225919C
	push {r3, lr}
	cmp r1, #0
	ldr r0, [r0, #4]
	beq _022591AC
	movs r1, #2
	bl FUN_0223093C
	pop {r3, pc}
_022591AC:
	bl FUN_02230968
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225919C

	thumb_func_start ov49_022591B4
ov49_022591B4: @ 0x022591B4
	ldr r3, _022591BC @ =FUN_022308B0
	ldr r0, [r0, #4]
	bx r3
	nop
_022591BC: .4byte FUN_022308B0
	thumb_func_end ov49_022591B4

	thumb_func_start ov49_022591C0
ov49_022591C0: @ 0x022591C0
	ldr r3, _022591C8 @ =FUN_02230978
	ldr r0, [r0, #4]
	bx r3
	nop
_022591C8: .4byte FUN_02230978
	thumb_func_end ov49_022591C0

	thumb_func_start ov49_022591CC
ov49_022591CC: @ 0x022591CC
	ldr r3, _022591D4 @ =FUN_02230994
	ldr r0, [r0, #4]
	bx r3
	nop
_022591D4: .4byte FUN_02230994
	thumb_func_end ov49_022591CC

	thumb_func_start ov49_022591D8
ov49_022591D8: @ 0x022591D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0
	ldr r4, _02259278 @ =0x02269678
	str r0, [sp, #8]
_022591E4:
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp]
	ldrb r1, [r4]
	add r2, sp, #0xc
	ldr r0, [r5, #0x14]
	adds r2, #2
	add r3, sp, #0xc
	bl ov49_022589D8
	cmp r0, #1
	bne _02259266
	add r7, sp, #0xc
_022591FE:
	adds r0, r5, #0
	bl ov49_022593C0
	adds r6, r0, #0
	ldrh r0, [r7, #2]
	add r1, sp, #0x10
	lsls r0, r0, #4
	strh r0, [r7, #4]
	ldrh r0, [r7]
	lsls r0, r0, #4
	strh r0, [r7, #6]
	ldrb r0, [r4, #4]
	strh r0, [r7, #8]
	movs r0, #0
	strh r0, [r7, #0xa]
	ldrb r0, [r4, #1]
	strh r0, [r7, #0xc]
	ldrh r0, [r4, #2]
	strh r0, [r7, #0xe]
	ldr r0, [r5]
	bl FUN_022280B8
	adds r1, r0, #0
	str r1, [r6]
	ldr r0, [r5, #4]
	bl FUN_0223070C
	str r0, [r6, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov49_02258EEC
	ldrb r0, [r4]
	cmp r0, #0x61
	bne _02259248
	str r6, [r5, #0x24]
_02259248:
	ldr r0, [sp, #4]
	add r2, sp, #0xc
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	str r0, [sp]
	ldrb r1, [r4]
	ldr r0, [r5, #0x14]
	adds r2, #2
	add r3, sp, #0xc
	bl ov49_022589D8
	cmp r0, #1
	beq _022591FE
_02259266:
	ldr r0, [sp, #8]
	adds r4, #8
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	blo _022591E4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02259278: .4byte 0x02269678
	thumb_func_end ov49_022591D8

	thumb_func_start ov49_0225927C
ov49_0225927C: @ 0x0225927C
	push {r3, r4, lr}
	sub sp, #4
	add r4, sp, #0
	strh r1, [r4]
	strb r2, [r4, #2]
	add r1, sp, #0
	strb r3, [r4, #3]
	bl ov49_02258C1C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225927C

	thumb_func_start ov49_02259294
ov49_02259294: @ 0x02259294
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_0201FDB8
	adds r1, r4, #0
	blx FUN_020F2BA4
	ldrb r0, [r5, r1]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02259294

	thumb_func_start ov49_022592A8
ov49_022592A8: @ 0x022592A8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r1]
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_022282DC
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
	adds r1, r6, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl FUN_02228270
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
	ldr r0, [r5, #0x14]
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
	bl ov49_022589B8
	cmp r0, r4
	bne _02259318
	add sp, #0x10
	movs r0, #1
	pop {r4, r5, r6, pc}
_02259318:
	movs r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_022592A8

	thumb_func_start ov49_02259320
ov49_02259320: @ 0x02259320
	str r1, [r0]
	str r1, [r0, #4]
	subs r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0xc]
	bx lr
	thumb_func_end ov49_02259320

	thumb_func_start ov49_0225932C
ov49_0225932C: @ 0x0225932C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r6, [r5, #8]
	beq _02259348
	lsls r0, r4, #0xc
	blx FUN_020F21C0
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02259356
_02259348:
	lsls r0, r4, #0xc
	blx FUN_020F21C0
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02259356:
	blx FUN_020F2104
	adds r2, r0, #0
	asrs r1, r6, #0x1f
	adds r0, r6, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r6, r2, #0xc
	orrs r6, r0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0225938E
	lsls r0, r0, #0xc
	blx FUN_020F21C0
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225939C
_0225938E:
	lsls r0, r0, #0xc
	blx FUN_020F21C0
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225939C:
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020CCBA0
	ldr r1, [r5, #4]
	adds r0, r0, r1
	str r0, [r5]
	ldr r0, [r5, #0xc]
	cmp r4, r0
	blo _022593B8
	movs r0, #1
	pop {r4, r5, r6, pc}
_022593B8:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225932C

	thumb_func_start ov49_022593BC
ov49_022593BC: @ 0x022593BC
	ldr r0, [r0]
	bx lr
	thumb_func_end ov49_022593BC

	thumb_func_start ov49_022593C0
ov49_022593C0: @ 0x022593C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xc]
	movs r6, #0
	cmp r0, #0
	ble _022593EE
	adds r4, r6, #0
_022593CE:
	ldr r0, [r5, #8]
	adds r0, r0, r4
	bl ov49_022593FC
	cmp r0, #0
	beq _022593E4
	movs r0, #0x28
	ldr r1, [r5, #8]
	muls r0, r6, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
_022593E4:
	ldrh r0, [r5, #0xc]
	adds r6, r6, #1
	adds r4, #0x28
	cmp r6, r0
	blt _022593CE
_022593EE:
	bl GF_AssertFail
	movs r0, #0x28
	ldr r1, [r5, #8]
	muls r0, r6, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_022593C0

	thumb_func_start ov49_022593FC
ov49_022593FC: @ 0x022593FC
	ldr r0, [r0]
	cmp r0, #0
	bne _02259406
	movs r0, #1
	bx lr
_02259406:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_022593FC

	thumb_func_start ov49_0225940C
ov49_0225940C: @ 0x0225940C
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225940C

	thumb_func_start ov49_02259410
ov49_02259410: @ 0x02259410
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	adds r5, r1, #0
	movs r1, #6
	bl FUN_02228188
	adds r4, r0, #0
	ldr r0, [r7]
	movs r1, #4
	bl FUN_02228188
	adds r6, r0, #0
	ldr r0, [r7]
	movs r1, #5
	bl FUN_02228188
	cmp r0, #0
	bne _022594D2
	ldr r0, _022594D4 @ =0x021D110C
	movs r1, #2
	ldr r0, [r0, #0x44]
	adds r2, r0, #0
	tst r2, r1
	beq _02259444
	movs r1, #3
_02259444:
	movs r2, #0x40
	tst r2, r0
	beq _02259468
	cmp r4, #0
	bne _0225945A
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_0225945A:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	adds r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_02259468:
	movs r2, #0x80
	tst r2, r0
	beq _0225948C
	cmp r4, #1
	bne _0225947E
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_0225947E:
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_0225948C:
	movs r2, #0x20
	tst r2, r0
	beq _022594B0
	cmp r4, #2
	bne _022594A2
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_022594A2:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #2
	adds r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_022594B0:
	movs r2, #0x10
	tst r0, r2
	beq _022594D2
	cmp r4, #3
	bne _022594C6
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r6, #0
	bl ov49_0225927C
	pop {r3, r4, r5, r6, r7, pc}
_022594C6:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	adds r3, r6, #0
	bl ov49_0225927C
_022594D2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022594D4: .4byte 0x021D110C
	thumb_func_end ov49_02259410

	thumb_func_start ov49_022594D8
ov49_022594D8: @ 0x022594D8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	adds r5, r1, #0
	cmp r0, #4
	bhi _022595C0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022594F0: @ jump table
	.2byte _022594FA - _022594F0 - 2 @ case 0
	.2byte _0225950C - _022594F0 - 2 @ case 1
	.2byte _02259522 - _022594F0 - 2 @ case 2
	.2byte _0225958E - _022594F0 - 2 @ case 3
	.2byte _022595B0 - _022594F0 - 2 @ case 4
_022594FA:
	ldr r0, _022595C4 @ =0x02269658
	movs r1, #4
	bl ov49_02259294
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225950C:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, #0xc]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _022595C0
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02259522:
	ldr r0, [r4]
	movs r1, #4
	bl FUN_02228188
	adds r6, r0, #0
	ldr r0, [r4]
	movs r1, #6
	bl FUN_02228188
	adds r7, r0, #0
	ldr r0, _022595C8 @ =0x0226965C
	movs r1, #4
	bl ov49_02259294
	strh r0, [r4, #0xe]
	movs r2, #0xe
	ldrsh r2, [r4, r2]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r6, #4
	bl ov49_022592A8
	cmp r0, #1
	bne _0225957A
	movs r0, #0xe
	ldrsh r3, [r4, r0]
	cmp r7, r3
	bne _0225956A
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ov49_02258E7C
	movs r0, #4
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225956A:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov49_02258E7C
	movs r0, #3
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225957A:
	movs r3, #0xe
	ldrsh r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov49_02258E7C
	movs r0, #4
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0225958E:
	ldr r0, [r4]
	movs r1, #5
	bl FUN_02228188
	cmp r0, #0
	bne _022595C0
	movs r3, #0xe
	ldrsh r3, [r4, r3]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ov49_02258E7C
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022595B0:
	ldr r0, [r4]
	movs r1, #5
	bl FUN_02228188
	cmp r0, #0
	bne _022595C0
	movs r0, #0
	strh r0, [r4, #8]
_022595C0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022595C4: .4byte 0x02269658
_022595C8: .4byte 0x0226965C
	thumb_func_end ov49_022594D8

	thumb_func_start ov49_022595CC
ov49_022595CC: @ 0x022595CC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	cmp r0, #3
	bhi _02259672
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022595E4: @ jump table
	.2byte _022595EC - _022595E4 - 2 @ case 0
	.2byte _02259616 - _022595E4 - 2 @ case 1
	.2byte _02259632 - _022595E4 - 2 @ case 2
	.2byte _02259672 - _022595E4 - 2 @ case 3
_022595EC:
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0223089C
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0223093C
	adds r0, r4, #0
	movs r2, #0x7d
	adds r0, #0xc
	movs r1, #0
	lsls r2, r2, #0xe
	movs r3, #0x18
	bl ov49_02259320
	movs r0, #0x20
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
_02259616:
	ldr r0, [r4, #0x1c]
	subs r0, r0, #1
	str r0, [r4, #0x1c]
	bne _02259672
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0x1c]
	ldr r0, _02259678 @ =0x0000064E
	bl FUN_0200604C
	add sp, #0xc
	pop {r4, r5, pc}
_02259632:
	adds r0, r4, #0
	ldr r1, [r4, #0x1c]
	adds r0, #0xc
	bl ov49_0225932C
	adds r5, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, sp, #0
	adds r0, r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	bl FUN_02230908
	adds r0, r4, #0
	adds r0, #0xc
	bl ov49_022593BC
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl FUN_022308E4
	cmp r5, #1
	bne _02259672
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, [r4, #4]
	bl FUN_02230968
	movs r0, #1
	strb r0, [r4, #0xa]
_02259672:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02259678: .4byte 0x0000064E
	thumb_func_end ov49_022595CC

	thumb_func_start ov49_0225967C
ov49_0225967C: @ 0x0225967C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	cmp r0, #3
	bhi _0225972A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02259694: @ jump table
	.2byte _0225969C - _02259694 - 2 @ case 0
	.2byte _022596CC - _02259694 - 2 @ case 1
	.2byte _0225970A - _02259694 - 2 @ case 2
	.2byte _0225972A - _02259694 - 2 @ case 3
_0225969C:
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0223089C
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0223093C
	adds r0, r4, #0
	movs r1, #0x7d
	adds r0, #0xc
	lsls r1, r1, #0xe
	movs r2, #0
	movs r3, #0x18
	bl ov49_02259320
	movs r0, #0
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, _02259730 @ =0x0000064E
	bl FUN_0200604C
_022596CC:
	adds r0, r4, #0
	ldr r1, [r4, #0x1c]
	adds r0, #0xc
	bl ov49_0225932C
	adds r5, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, sp, #0
	adds r0, r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	bl FUN_02230908
	adds r0, r4, #0
	adds r0, #0xc
	bl ov49_022593BC
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl FUN_022308E4
	cmp r5, #1
	bne _0225972A
	movs r0, #0x20
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	add sp, #0xc
	adds r0, r0, #1
	strh r0, [r4, #8]
	pop {r4, r5, pc}
_0225970A:
	ldr r0, [r4, #0x1c]
	subs r0, r0, #1
	str r0, [r4, #0x1c]
	bne _0225972A
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, [r4, #4]
	bl FUN_02230968
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0223089C
	movs r0, #1
	strb r0, [r4, #0xa]
_0225972A:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02259730: .4byte 0x0000064E
	thumb_func_end ov49_0225967C

	thumb_func_start ov49_02259734
ov49_02259734: @ 0x02259734
	ldr r3, _0225973C @ =ov49_02259764
	movs r2, #2
	bx r3
	nop
_0225973C: .4byte ov49_02259764
	thumb_func_end ov49_02259734

	thumb_func_start ov49_02259740
ov49_02259740: @ 0x02259740
	ldr r3, _02259748 @ =ov49_02259764
	movs r2, #3
	bx r3
	nop
_02259748: .4byte ov49_02259764
	thumb_func_end ov49_02259740

	thumb_func_start ov49_0225974C
ov49_0225974C: @ 0x0225974C
	ldr r3, _02259754 @ =ov49_02259764
	movs r2, #0
	bx r3
	nop
_02259754: .4byte ov49_02259764
	thumb_func_end ov49_0225974C

	thumb_func_start ov49_02259758
ov49_02259758: @ 0x02259758
	ldr r3, _02259760 @ =ov49_02259764
	movs r2, #1
	bx r3
	nop
_02259760: .4byte ov49_02259764
	thumb_func_end ov49_02259758

	thumb_func_start ov49_02259764
ov49_02259764: @ 0x02259764
	push {r4, r5, r6, lr}
	sub sp, #0x28
	adds r4, r0, #0
	ldrh r0, [r4, #8]
	adds r5, r2, #0
	cmp r0, #3
	bls _02259774
	b _02259916
_02259774:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02259780: @ jump table
	.2byte _02259788 - _02259780 - 2 @ case 0
	.2byte _022597E4 - _02259780 - 2 @ case 1
	.2byte _0225989E - _02259780 - 2 @ case 2
	.2byte _02259916 - _02259780 - 2 @ case 3
_02259788:
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0223089C
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0223093C
	ldr r0, [r4, #4]
	movs r1, #2
	bl FUN_02230974
	adds r0, r4, #0
	movs r2, #1
	adds r0, #0xc
	movs r1, #0
	lsls r2, r2, #0x10
	movs r3, #4
	bl ov49_02259320
	ldr r0, [r4, #4]
	add r1, sp, #0x1c
	bl FUN_02230908
	cmp r5, #3
	bhi _022597DA
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022597C8: @ jump table
	.2byte _022597D0 - _022597C8 - 2 @ case 0
	.2byte _022597D0 - _022597C8 - 2 @ case 1
	.2byte _022597D6 - _022597C8 - 2 @ case 2
	.2byte _022597D6 - _022597C8 - 2 @ case 3
_022597D0:
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x20]
	b _022597DA
_022597D6:
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x20]
_022597DA:
	movs r0, #0
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
_022597E4:
	adds r0, r4, #0
	ldr r1, [r4, #0x1c]
	adds r0, #0xc
	bl ov49_0225932C
	adds r6, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, sp, #0x10
	adds r0, r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	bl FUN_02230908
	cmp r5, #3
	bhi _02259854
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225980E: @ jump table
	.2byte _02259816 - _0225980E - 2 @ case 0
	.2byte _02259826 - _0225980E - 2 @ case 1
	.2byte _02259836 - _0225980E - 2 @ case 2
	.2byte _02259846 - _0225980E - 2 @ case 3
_02259816:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	subs r0, r1, r0
	str r0, [sp, #0x18]
	b _02259854
_02259826:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	adds r0, r1, r0
	str r0, [sp, #0x18]
	b _02259854
_02259836:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	subs r0, r1, r0
	str r0, [sp, #0x10]
	b _02259854
_02259846:
	adds r0, r4, #0
	adds r0, #0xc
	bl ov49_022593BC
	ldr r1, [r4, #0x20]
	adds r0, r1, r0
	str r0, [sp, #0x10]
_02259854:
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	bl FUN_022308E4
	cmp r6, #1
	bne _02259916
	adds r0, r5, #0
	bl FUN_022282A4
	movs r1, #4
	str r1, [r4, #0x1c]
	cmp r0, #3
	bhi _02259894
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225987A: @ jump table
	.2byte _02259888 - _0225987A - 2 @ case 0
	.2byte _02259894 - _0225987A - 2 @ case 1
	.2byte _0225988E - _0225987A - 2 @ case 2
	.2byte _02259882 - _0225987A - 2 @ case 3
_02259882:
	ldr r0, [r4, #0x1c]
	adds r0, r0, #2
	str r0, [r4, #0x1c]
_02259888:
	ldr r0, [r4, #0x1c]
	adds r0, r0, #2
	str r0, [r4, #0x1c]
_0225988E:
	ldr r0, [r4, #0x1c]
	adds r0, r0, #2
	str r0, [r4, #0x1c]
_02259894:
	ldrh r0, [r4, #8]
	add sp, #0x28
	adds r0, r0, #1
	strh r0, [r4, #8]
	pop {r4, r5, r6, pc}
_0225989E:
	ldr r0, [r4, #0x1c]
	subs r0, r0, #1
	str r0, [r4, #0x1c]
	bne _02259916
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldr r0, [r4]
	bl FUN_022282DC
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
	bl FUN_02228270
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #8]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0xa]
	adds r0, r5, #0
	bl FUN_022282A4
	add r1, sp, #0
	mov r5, sp
	adds r2, r0, #0
	ldrh r3, [r1, #8]
	subs r5, r5, #4
	adds r0, r4, #0
	strh r3, [r5]
	ldrh r1, [r1, #0xa]
	strh r1, [r5, #2]
	ldr r1, [r5]
	bl ov49_02258E04
	ldr r0, [r4, #4]
	bl FUN_02230968
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0223089C
	movs r0, #1
	strb r0, [r4, #0xa]
_02259916:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_02259764

	thumb_func_start ov49_0225991C
ov49_0225991C: @ 0x0225991C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _02259930
	cmp r0, #1
	beq _02259950
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02259930:
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_0223089C
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #0x10
	bl FUN_02230908
	movs r0, #0x1c
	str r0, [r5, #0xc]
	ldrh r0, [r5, #8]
	add sp, #0xc
	adds r0, r0, #1
	strh r0, [r5, #8]
	pop {r3, r4, r5, r6, pc}
_02259950:
	ldr r0, [r5, #0xc]
	subs r0, r0, #1
	str r0, [r5, #0xc]
	bpl _0225995C
	movs r0, #0x1c
	str r0, [r5, #0xc]
_0225995C:
	adds r3, r5, #0
	adds r3, #0x10
	ldm r3!, {r0, r1}
	add r2, sp, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r5, #0xc]
	subs r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	ble _022599DE
	movs r1, #6
	blx FUN_020F2998
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	movs r0, #0xb4
	muls r0, r1, r0
	movs r1, #6
	blx FUN_020F2998
	adds r4, r0, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	ldr r2, _022599F4 @ =0xFFFFE000
	asrs r1, r0, #0x1f
	asrs r3, r2, #0xd
	blx FUN_020F2948
	movs r3, #2
	movs r6, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r6
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [sp, #8]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [sp, #8]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	movs r2, #0xa
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xc
	adds r3, r6, #0
	blx FUN_020F2948
	movs r3, #2
	adds r4, r6, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r4
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [sp, #4]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [sp, #4]
_022599DE:
	ldr r0, [r5, #4]
	add r1, sp, #0
	bl FUN_022308E4
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_02230920
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_022599F4: .4byte 0xFFFFE000
	thumb_func_end ov49_0225991C

	thumb_func_start ov49_022599F8
ov49_022599F8: @ 0x022599F8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0223089C
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl FUN_02230908
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl FUN_022308E4
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_022599F8

	thumb_func_start ov49_02259A20
ov49_02259A20: @ 0x02259A20
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	movs r3, #0
	strb r3, [r0, #3]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strb r3, [r0]
	adds r0, r1, #0
	ldr r3, _02259A38 @ =FUN_02230700
	adds r1, r2, #0
	bx r3
	nop
_02259A38: .4byte FUN_02230700
	thumb_func_end ov49_02259A20

	thumb_func_start ov49_02259A3C
ov49_02259A3C: @ 0x02259A3C
	movs r2, #1
	strb r2, [r0]
	ldrb r2, [r0, #1]
	strb r2, [r0, #2]
	ldrb r2, [r0, #1]
	subs r1, r1, r2
	strb r1, [r0, #3]
	movs r1, #0
	strh r1, [r0, #4]
	movs r1, #0x3c
	strh r1, [r0, #6]
	bx lr
	thumb_func_end ov49_02259A3C

	thumb_func_start ov49_02259A54
ov49_02259A54: @ 0x02259A54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5]
	adds r4, r1, #0
	cmp r0, #0
	bne _02259A64
	movs r0, #1
	pop {r3, r4, r5, pc}
_02259A64:
	movs r0, #4
	ldrsh r1, [r5, r0]
	adds r1, r1, #1
	strh r1, [r5, #4]
	ldrsh r1, [r5, r0]
	movs r0, #6
	ldrsh r0, [r5, r0]
	cmp r1, r0
	blt _02259A7A
	movs r0, #0
	strb r0, [r5]
_02259A7A:
	movs r0, #4
	ldrsh r1, [r5, r0]
	movs r0, #3
	ldrsb r0, [r5, r0]
	muls r0, r1, r0
	movs r1, #6
	ldrsh r1, [r5, r1]
	blx FUN_020F2998
	strb r0, [r5, #1]
	movs r0, #2
	ldrb r1, [r5, #1]
	ldrsb r0, [r5, r0]
	adds r0, r1, r0
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	adds r0, r4, #0
	bl FUN_02230700
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02259A54

	thumb_func_start ov49_02259AA4
ov49_02259AA4: @ 0x02259AA4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #0x3a
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x77
	lsls r2, r2, #0xc
	bl FUN_0201A910
	movs r2, #0x3d
	movs r0, #3
	movs r1, #0x78
	lsls r2, r2, #0xc
	bl FUN_0201A910
	movs r1, #0xfe
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x77
	bl FUN_02007280
	movs r2, #0xfe
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	adds r0, #0xc
	str r0, [r4, #0x38]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x34]
	bl FUN_0222A53C
	strb r0, [r4, #2]
	ldr r0, [r4, #0x34]
	bl FUN_0222A53C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02259B02
	bl GF_AssertFail
_02259B02:
	movs r0, #1
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, [r5]
	bl FUN_02028E9C
	movs r1, #0xfd
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	ldr r1, [r5]
	adds r0, #0x3c
	movs r2, #0x77
	bl ov49_0225A5EC
	movs r0, #0x77
	bl ov49_02258958
	movs r1, #0xfa
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r1, #0xc
	ldr r0, [r4, r1]
	bl FUN_02028F94
	adds r1, r0, #0
	movs r0, #0x78
	movs r2, #0xfa
	str r0, [sp]
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	movs r0, #0x18
	movs r3, #0x77
	bl ov49_02258AB4
	movs r2, #0x3e
	lsls r2, r2, #4
	str r0, [r4, r2]
	movs r0, #0x78
	str r0, [sp]
	adds r2, #8
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r4, r2]
	movs r3, #0x77
	bl ov49_0225DF18
	movs r1, #0xf9
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x77
	bl ov49_0225CB78
	movs r1, #0xfb
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0xf4
	adds r0, r4, r1
	adds r1, r4, #0
	ldr r2, [r5]
	adds r1, #0x3c
	movs r3, #0x77
	bl ov49_0225AAC8
	movs r0, #0xc6
	lsls r0, r0, #2
	adds r1, r4, #0
	ldr r2, [r5]
	adds r0, r4, r0
	adds r1, #0x3c
	movs r3, #0x77
	bl ov49_0225ACA8
	movs r0, #0xce
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x3c
	movs r2, #0x77
	bl ov49_0225AD20
	movs r0, #0x39
	lsls r0, r0, #4
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x3c
	movs r2, #0x77
	bl ov49_0225B214
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x3c
	movs r2, #0x77
	bl ov49_0225B0D4
	movs r0, #0xb7
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x77
	bl ov49_0225B308
	movs r1, #0x3a
	lsls r1, r1, #4
	adds r0, r4, r1
	subs r1, #0xc4
	adds r1, r4, r1
	movs r2, #0x77
	bl ov49_0225B198
	movs r0, #0x77
	str r0, [sp]
	movs r3, #0xfd
	movs r0, #0x61
	lsls r3, r3, #2
	lsls r0, r0, #2
	adds r2, r4, #0
	ldr r1, [r4, #0x38]
	ldr r3, [r4, r3]
	adds r0, r4, r0
	adds r2, #0x3c
	bl ov49_0225B450
	ldr r0, [r4, #0x34]
	bl FUN_0222A5C0
	adds r5, r0, #0
	bl FUN_0222AADC
	cmp r0, #1
	bne _02259C2E
	movs r0, #0x61
	movs r2, #0xb7
	lsls r0, r0, #2
	adds r1, r4, #0
	lsls r2, r2, #2
	adds r0, r4, r0
	adds r1, #0x3c
	adds r2, r4, r2
	movs r3, #0x77
	str r5, [sp]
	bl ov49_0225B9AC
_02259C2E:
	adds r0, r4, #0
	movs r1, #0x77
	bl ov49_0225EEAC
	movs r1, #0x3f
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov49_0225F1A8
	adds r0, r4, #0
	bl ov49_0225F1F0
	movs r0, #0x77
	str r0, [sp]
	movs r0, #0x78
	movs r3, #0xfa
	str r0, [sp, #4]
	lsls r3, r3, #2
	adds r2, r3, #4
	ldr r1, [r4, r3]
	subs r3, #8
	ldr r0, [r4, #0x34]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	bl ov49_022652E8
	movs r1, #0xf5
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x77
	adds r1, r4, #0
	bl ov49_02268764
	movs r1, #0xf7
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _02259C8C @ =ov49_0225A5C8
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02259C8C: .4byte ov49_0225A5C8
	thumb_func_end ov49_02259AA4

	thumb_func_start ov49_02259C90
ov49_02259C90: @ 0x02259C90
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	ldr r0, [r5]
	cmp r0, #8
	bhi _02259D58
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02259CB6: @ jump table
	.2byte _02259CC8 - _02259CB6 - 2 @ case 0
	.2byte _02259CEA - _02259CB6 - 2 @ case 1
	.2byte _02259CFE - _02259CB6 - 2 @ case 2
	.2byte _02259D7A - _02259CB6 - 2 @ case 3
	.2byte _02259DF8 - _02259CB6 - 2 @ case 4
	.2byte _02259E08 - _02259CB6 - 2 @ case 5
	.2byte _02259E58 - _02259CB6 - 2 @ case 6
	.2byte _02259E76 - _02259CB6 - 2 @ case 7
	.2byte _02259ED0 - _02259CB6 - 2 @ case 8
_02259CC8:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x77
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	strb r0, [r4, #3]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259CEA:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02259D58
	movs r0, #0
	strb r0, [r4, #3]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259CFE:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #1
	bne _02259D26
	bl FUN_0222D844
	cmp r0, #1
	beq _02259D1A
	ldr r0, [r4, #0x34]
	bl FUN_0222A1FC
	cmp r0, #0
	beq _02259D26
_02259D1A:
	ldrb r1, [r4, #4]
	movs r0, #0xf0
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4, #4]
_02259D26:
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _02259D42
	ldr r0, [r4, #0x34]
	bl FUN_0222A33C
	cmp r0, #1
	bne _02259D42
	movs r0, #1
	strb r0, [r4, #6]
	adds r0, r4, #0
	movs r1, #8
	bl ov49_0225A038
_02259D42:
	ldrb r0, [r4]
	cmp r0, #1
	beq _02259D5A
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _02259D5A
	ldrb r0, [r4, #6]
	cmp r0, #1
	beq _02259D5A
_02259D58:
	b _02259EE2
_02259D5A:
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	beq _02259D68
	movs r0, #3
	str r0, [r5]
	b _02259EE2
_02259D68:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bne _02259D74
	movs r0, #5
	str r0, [r5]
	b _02259EE2
_02259D74:
	movs r0, #7
	str r0, [r5]
	b _02259EE2
_02259D7A:
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225AC74
	movs r0, #0xce
	lsls r0, r0, #2
	movs r1, #0
	adds r0, r4, r0
	adds r2, r1, #0
	bl ov49_0225B014
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225B124
	movs r0, #0x3a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov49_0225B200
	bl FUN_020393C8
	cmp r0, #0
	beq _02259DBE
	movs r1, #0x39
	lsls r1, r1, #4
	adds r0, r4, r1
	subs r1, #0xb4
	adds r1, r4, r1
	bl ov49_0225B284
	b _02259DF2
_02259DBE:
	bl FUN_020397FC
	cmp r0, #0
	beq _02259DDC
	bl FUN_0222E7CC
	movs r1, #0x39
	lsls r1, r1, #4
	adds r2, r0, #0
	adds r0, r4, r1
	subs r1, #0xb4
	adds r1, r4, r1
	bl ov49_0225B2C0
	b _02259DF2
_02259DDC:
	ldr r0, [r4, #0x34]
	bl FUN_0222A1FC
	movs r1, #0x39
	lsls r1, r1, #4
	adds r2, r0, #0
	adds r0, r4, r1
	subs r1, #0xb4
	adds r1, r4, r1
	bl ov49_0225B2F0
_02259DF2:
	movs r0, #4
	str r0, [r5]
	b _02259EE2
_02259DF8:
	ldr r0, _02259EF4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02259EE2
	movs r0, #7
	str r0, [r5]
	b _02259EE2
_02259E08:
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225AC74
	movs r0, #0xce
	lsls r0, r0, #2
	movs r1, #0
	adds r0, r4, r0
	adds r2, r1, #0
	bl ov49_0225B014
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225B124
	movs r0, #0x3a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov49_0225B200
	movs r0, #0xb7
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	movs r2, #0x46
	bl ov49_0225B388
	adds r1, r0, #0
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225AB44
	movs r0, #6
	str r0, [r5]
	movs r0, #0x3c
	str r0, [r4, #8]
	b _02259EE2
_02259E58:
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225AC5C
	cmp r0, #0
	beq _02259EE2
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0
	bgt _02259EE2
	movs r0, #7
	str r0, [r5]
	b _02259EE2
_02259E76:
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225B898
	cmp r0, #5
	bne _02259EA8
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x77
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	strb r0, [r4, #3]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259EA8:
	cmp r0, #0
	bne _02259EE2
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x77
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	strb r0, [r4, #3]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _02259EE2
_02259ED0:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _02259EE2
	movs r0, #0
	strb r0, [r4, #3]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02259EE2:
	adds r0, r4, #0
	bl ov49_0225A98C
	adds r0, r4, #0
	bl ov49_0225AA2C
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02259EF4: .4byte 0x021D110C
	thumb_func_end ov49_02259C90

	thumb_func_start ov49_02259EF8
ov49_02259EF8: @ 0x02259EF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	ldrb r1, [r4, #1]
	str r1, [r0, #0x18]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02268850
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0226535C
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_0225EEF8
	movs r0, #0x61
	movs r1, #0xc6
	lsls r0, r0, #2
	lsls r1, r1, #2
	adds r2, r4, #0
	adds r0, r4, r0
	adds r1, r4, r1
	adds r2, #0x3c
	bl ov49_0225B4E4
	movs r0, #0xb7
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225B35C
	movs r0, #0xbe
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225AB14
	movs r0, #0xc6
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225ACBC
	movs r0, #0xce
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0x3c
	bl ov49_0225AE4C
	movs r0, #0x39
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov49_0225B244
	movs r0, #0x3a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov49_0225B200
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225B0D8
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225CBDC
	movs r0, #0xf9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E2B4
	movs r0, #0x3e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258B20
	movs r0, #0xfa
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02258994
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov49_0225A7D0
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0x77
	bl FUN_0201A9C4
	movs r0, #0x78
	bl FUN_0201A9C4
	movs r0, #0
	bl FUN_0200616C
	movs r0, #0
	bl FUN_02006300
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_02259EF8

	thumb_func_start ov49_02259FE8
ov49_02259FE8: @ 0x02259FE8
	ldr r0, [r0, #0x34]
	bx lr
	thumb_func_end ov49_02259FE8

	thumb_func_start ov49_02259FEC
ov49_02259FEC: @ 0x02259FEC
	ldr r0, [r0, #0x38]
	bx lr
	thumb_func_end ov49_02259FEC

	thumb_func_start ov49_02259FF0
ov49_02259FF0: @ 0x02259FF0
	movs r1, #0x3e
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_02259FF0

	thumb_func_start ov49_02259FF8
ov49_02259FF8: @ 0x02259FF8
	movs r1, #0xf9
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_02259FF8

	thumb_func_start ov49_0225A000
ov49_0225A000: @ 0x0225A000
	movs r1, #0xfa
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225A000

	thumb_func_start ov49_0225A008
ov49_0225A008: @ 0x0225A008
	movs r1, #0xfb
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225A008

	thumb_func_start ov49_0225A010
ov49_0225A010: @ 0x0225A010
	movs r1, #0x3f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225A010

	thumb_func_start ov49_0225A018
ov49_0225A018: @ 0x0225A018
	ldrb r3, [r0, #4]
	movs r2, #0xf
	lsls r1, r1, #0x18
	bics r3, r2
	lsrs r2, r1, #0x18
	movs r1, #0xf
	ands r1, r2
	orrs r1, r3
	strb r1, [r0, #4]
	bx lr
	thumb_func_end ov49_0225A018

	thumb_func_start ov49_0225A02C
ov49_0225A02C: @ 0x0225A02C
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end ov49_0225A02C

	thumb_func_start ov49_0225A030
ov49_0225A030: @ 0x0225A030
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end ov49_0225A030

	thumb_func_start ov49_0225A034
ov49_0225A034: @ 0x0225A034
	strb r1, [r0]
	bx lr
	thumb_func_end ov49_0225A034

	thumb_func_start ov49_0225A038
ov49_0225A038: @ 0x0225A038
	strb r1, [r0, #1]
	bx lr
	thumb_func_end ov49_0225A038

	thumb_func_start ov49_0225A03C
ov49_0225A03C: @ 0x0225A03C
	strb r1, [r0, #5]
	bx lr
	thumb_func_end ov49_0225A03C

	thumb_func_start ov49_0225A040
ov49_0225A040: @ 0x0225A040
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end ov49_0225A040

	thumb_func_start ov49_0225A044
ov49_0225A044: @ 0x0225A044
	movs r1, #1
	strb r1, [r0, #7]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225A044

	thumb_func_start ov49_0225A04C
ov49_0225A04C: @ 0x0225A04C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x14
	blo _0225A05C
	bl GF_AssertFail
_0225A05C:
	adds r0, r5, r4
	strb r6, [r0, #0xc]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225A04C

	thumb_func_start ov49_0225A064
ov49_0225A064: @ 0x0225A064
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225A064

	thumb_func_start ov49_0225A06C
ov49_0225A06C: @ 0x0225A06C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x14
	blo _0225A07C
	bl GF_AssertFail
_0225A07C:
	adds r0, r5, r4
	adds r0, #0x20
	strb r6, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225A06C

	thumb_func_start ov49_0225A084
ov49_0225A084: @ 0x0225A084
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov49_0225A084

	thumb_func_start ov49_0225A08C
ov49_0225A08C: @ 0x0225A08C
	movs r2, #0xbe
	lsls r2, r2, #2
	ldr r3, _0225A098 @ =ov49_0225AB44
	adds r0, r0, r2
	bx r3
	nop
_0225A098: .4byte ov49_0225AB44
	thumb_func_end ov49_0225A08C

	thumb_func_start ov49_0225A09C
ov49_0225A09C: @ 0x0225A09C
	movs r2, #0xbe
	lsls r2, r2, #2
	ldr r3, _0225A0A8 @ =ov49_0225ABA4
	adds r0, r0, r2
	bx r3
	nop
_0225A0A8: .4byte ov49_0225ABA4
	thumb_func_end ov49_0225A09C

	thumb_func_start ov49_0225A0AC
ov49_0225A0AC: @ 0x0225A0AC
	movs r1, #0xbe
	lsls r1, r1, #2
	ldr r3, _0225A0B8 @ =ov49_0225AC5C
	adds r0, r0, r1
	bx r3
	nop
_0225A0B8: .4byte ov49_0225AC5C
	thumb_func_end ov49_0225A0AC

	thumb_func_start ov49_0225A0BC
ov49_0225A0BC: @ 0x0225A0BC
	movs r1, #0xbe
	lsls r1, r1, #2
	ldr r3, _0225A0C8 @ =ov49_0225AC08
	adds r0, r0, r1
	bx r3
	nop
_0225A0C8: .4byte ov49_0225AC08
	thumb_func_end ov49_0225A0BC

	thumb_func_start ov49_0225A0CC
ov49_0225A0CC: @ 0x0225A0CC
	movs r1, #0xbe
	lsls r1, r1, #2
	ldr r3, _0225A0D8 @ =ov49_0225AC24
	adds r0, r0, r1
	bx r3
	nop
_0225A0D8: .4byte ov49_0225AC24
	thumb_func_end ov49_0225A0CC

	thumb_func_start ov49_0225A0DC
ov49_0225A0DC: @ 0x0225A0DC
	movs r1, #0xbe
	lsls r1, r1, #2
	ldr r3, _0225A0E8 @ =ov49_0225AC4C
	adds r0, r0, r1
	bx r3
	nop
_0225A0E8: .4byte ov49_0225AC4C
	thumb_func_end ov49_0225A0DC

	thumb_func_start ov49_0225A0EC
ov49_0225A0EC: @ 0x0225A0EC
	movs r1, #0xbe
	lsls r1, r1, #2
	ldr r3, _0225A0F8 @ =ov49_0225AC74
	adds r0, r0, r1
	bx r3
	nop
_0225A0F8: .4byte ov49_0225AC74
	thumb_func_end ov49_0225A0EC

	thumb_func_start ov49_0225A0FC
ov49_0225A0FC: @ 0x0225A0FC
	movs r2, #0xc6
	lsls r2, r2, #2
	ldr r3, _0225A108 @ =ov49_0225ACC4
	adds r0, r0, r2
	bx r3
	nop
_0225A108: .4byte ov49_0225ACC4
	thumb_func_end ov49_0225A0FC

	thumb_func_start ov49_0225A10C
ov49_0225A10C: @ 0x0225A10C
	push {r3, lr}
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r2, #0x78
	movs r3, #0
	bl ov49_0225AEA8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225A10C

	thumb_func_start ov49_0225A120
ov49_0225A120: @ 0x0225A120
	push {r3, lr}
	adds r3, r2, #0
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r0, r2
	movs r2, #0x78
	bl ov49_0225AEA8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225A120

	thumb_func_start ov49_0225A134
ov49_0225A134: @ 0x0225A134
	movs r1, #0xce
	lsls r1, r1, #2
	ldr r3, _0225A140 @ =ov49_0225AEE0
	adds r0, r0, r1
	bx r3
	nop
_0225A140: .4byte ov49_0225AEE0
	thumb_func_end ov49_0225A134

	thumb_func_start ov49_0225A144
ov49_0225A144: @ 0x0225A144
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0225A150 @ =ov49_0225AEF8
	bx r3
	nop
_0225A150: .4byte ov49_0225AEF8
	thumb_func_end ov49_0225A144

	thumb_func_start ov49_0225A154
ov49_0225A154: @ 0x0225A154
	movs r1, #0xce
	lsls r1, r1, #2
	ldr r3, _0225A160 @ =ov49_0225AF04
	adds r0, r0, r1
	bx r3
	nop
_0225A160: .4byte ov49_0225AF04
	thumb_func_end ov49_0225A154

	thumb_func_start ov49_0225A164
ov49_0225A164: @ 0x0225A164
	movs r2, #0xce
	lsls r2, r2, #2
	ldr r3, _0225A170 @ =ov49_0225AF08
	adds r0, r0, r2
	bx r3
	nop
_0225A170: .4byte ov49_0225AF08
	thumb_func_end ov49_0225A164

	thumb_func_start ov49_0225A174
ov49_0225A174: @ 0x0225A174
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	str r3, [sp]
	movs r0, #0x77
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	movs r0, #0xce
	lsls r0, r0, #2
	adds r4, r2, #0
	adds r0, r5, r0
	adds r5, #0x3c
	adds r2, r5, #0
	adds r3, r4, #0
	bl ov49_0225AF30
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225A174

	thumb_func_start ov49_0225A1A4
ov49_0225A1A4: @ 0x0225A1A4
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	str r3, [sp]
	movs r0, #0x77
	str r0, [sp, #4]
	adds r4, r2, #0
	add r0, sp, #0x10
	ldrb r2, [r0, #0x10]
	adds r3, r4, #0
	str r2, [sp, #8]
	ldrb r2, [r0, #0x14]
	str r2, [sp, #0xc]
	ldrb r0, [r0, #0x18]
	str r0, [sp, #0x10]
	movs r0, #0xce
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r5, #0x3c
	adds r2, r5, #0
	bl ov49_0225AF30
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov49_0225A1A4

	thumb_func_start ov49_0225A1D4
ov49_0225A1D4: @ 0x0225A1D4
	movs r1, #0xce
	lsls r1, r1, #2
	ldr r3, _0225A1E0 @ =ov49_0225AFD8
	adds r0, r0, r1
	bx r3
	nop
_0225A1E0: .4byte ov49_0225AFD8
	thumb_func_end ov49_0225A1D4

	thumb_func_start ov49_0225A1E4
ov49_0225A1E4: @ 0x0225A1E4
	movs r3, #0xce
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0225A1F0 @ =ov49_0225B014
	bx r3
	nop
_0225A1F0: .4byte ov49_0225B014
	thumb_func_end ov49_0225A1E4

	thumb_func_start ov49_0225A1F4
ov49_0225A1F4: @ 0x0225A1F4
	movs r2, #0xce
	lsls r2, r2, #2
	ldr r3, _0225A200 @ =ov49_0225B06C
	adds r0, r0, r2
	bx r3
	nop
_0225A200: .4byte ov49_0225B06C
	thumb_func_end ov49_0225A1F4

	thumb_func_start ov49_0225A204
ov49_0225A204: @ 0x0225A204
	push {r4, r5, lr}
	sub sp, #0xc
	str r2, [sp]
	adds r5, r0, #0
	str r3, [sp, #4]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	adds r4, r1, #0
	movs r2, #0x77
	str r0, [sp, #8]
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r5, #0x3c
	adds r1, r5, #0
	adds r3, r4, #0
	bl ov49_0225B0E0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov49_0225A204

	thumb_func_start ov49_0225A22C
ov49_0225A22C: @ 0x0225A22C
	movs r1, #0xf1
	lsls r1, r1, #2
	ldr r3, _0225A238 @ =ov49_0225B124
	adds r0, r0, r1
	bx r3
	nop
_0225A238: .4byte ov49_0225B124
	thumb_func_end ov49_0225A22C

	thumb_func_start ov49_0225A23C
ov49_0225A23C: @ 0x0225A23C
	push {r4, lr}
	movs r4, #0xf1
	lsls r4, r4, #2
	adds r0, r0, r4
	bl ov49_0225B148
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225A23C

	thumb_func_start ov49_0225A24C
ov49_0225A24C: @ 0x0225A24C
	push {r3, r4, lr}
	sub sp, #4
	add r4, sp, #0
	ldrh r4, [r4, #0x10]
	str r4, [sp]
	movs r4, #0xf1
	lsls r4, r4, #2
	adds r0, r0, r4
	bl ov49_0225B178
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225A24C

	thumb_func_start ov49_0225A264
ov49_0225A264: @ 0x0225A264
	push {lr}
	sub sp, #0x14
	movs r3, #0
	adds r2, r0, #0
	str r3, [sp]
	movs r0, #0x77
	str r0, [sp, #4]
	movs r0, #0x19
	str r0, [sp, #8]
	movs r0, #0xd
	movs r1, #0xce
	str r0, [sp, #0xc]
	movs r0, #6
	lsls r1, r1, #2
	str r0, [sp, #0x10]
	adds r0, r2, r1
	adds r1, #0x6c
	adds r1, r2, r1
	adds r2, #0x3c
	bl ov49_0225AF30
	add sp, #0x14
	pop {pc}
	.align 2, 0
	thumb_func_end ov49_0225A264

	thumb_func_start ov49_0225A294
ov49_0225A294: @ 0x0225A294
	push {lr}
	sub sp, #0x14
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x77
	str r0, [sp, #4]
	movs r0, #0x19
	str r0, [sp, #8]
	movs r0, #0xd
	movs r1, #0xce
	str r0, [sp, #0xc]
	movs r0, #6
	lsls r1, r1, #2
	str r0, [sp, #0x10]
	adds r0, r2, r1
	adds r1, #0x6c
	adds r1, r2, r1
	adds r2, #0x3c
	movs r3, #0
	bl ov49_0225AF30
	add sp, #0x14
	pop {pc}
	thumb_func_end ov49_0225A294

	thumb_func_start ov49_0225A2C4
ov49_0225A2C4: @ 0x0225A2C4
	push {r3, lr}
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r0, r1
	bl ov49_0225AFD8
	cmp r0, #0
	beq _0225A2EA
	cmp r0, #1
	beq _0225A2E6
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _0225A2EE
	ldr r0, _0225A2F4 @ =0x000005DC
	bl FUN_0200604C
_0225A2E6:
	movs r0, #1
	pop {r3, pc}
_0225A2EA:
	movs r0, #0
	pop {r3, pc}
_0225A2EE:
	movs r0, #2
	pop {r3, pc}
	nop
_0225A2F4: .4byte 0x000005DC
	thumb_func_end ov49_0225A2C4

	thumb_func_start ov49_0225A2F8
ov49_0225A2F8: @ 0x0225A2F8
	movs r1, #0xce
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldr r3, _0225A308 @ =ov49_0225B014
	adds r2, r1, #0
	bx r3
	nop
_0225A308: .4byte ov49_0225B014
	thumb_func_end ov49_0225A2F8

	thumb_func_start ov49_0225A30C
ov49_0225A30C: @ 0x0225A30C
	movs r3, #0xb7
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0225A318 @ =ov49_0225B388
	bx r3
	nop
_0225A318: .4byte ov49_0225B388
	thumb_func_end ov49_0225A30C

	thumb_func_start ov49_0225A31C
ov49_0225A31C: @ 0x0225A31C
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	movs r4, #0xb7
	lsls r4, r4, #2
	adds r0, r0, r4
	bl ov49_0225B3A8
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225A31C

	thumb_func_start ov49_0225A334
ov49_0225A334: @ 0x0225A334
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x77
	adds r4, r1, #0
	adds r7, r2, #0
	bl FUN_02028ED0
	adds r6, r0, #0
	ldr r0, [r5, #0x34]
	bl FUN_0222A53C
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bne _0225A356
	bl FUN_0222A5C0
	b _0225A35C
_0225A356:
	adds r1, r4, #0
	bl FUN_0222A578
_0225A35C:
	adds r1, r6, #0
	movs r2, #0x77
	bl FUN_0222A844
	movs r0, #0xb7
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov49_0225B3C8
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225A334

	thumb_func_start ov49_0225A37C
ov49_0225A37C: @ 0x0225A37C
	movs r3, #0xb7
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0225A388 @ =ov49_0225B3D8
	bx r3
	nop
_0225A388: .4byte ov49_0225B3D8
	thumb_func_end ov49_0225A37C

	thumb_func_start ov49_0225A38C
ov49_0225A38C: @ 0x0225A38C
	movs r3, #0xb7
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0225A398 @ =ov49_0225B3E8
	bx r3
	nop
_0225A398: .4byte ov49_0225B3E8
	thumb_func_end ov49_0225A38C

	thumb_func_start ov49_0225A39C
ov49_0225A39C: @ 0x0225A39C
	movs r3, #0xb7
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0225A3A8 @ =ov49_0225B3F8
	bx r3
	nop
_0225A3A8: .4byte ov49_0225B3F8
	thumb_func_end ov49_0225A39C

	thumb_func_start ov49_0225A3AC
ov49_0225A3AC: @ 0x0225A3AC
	movs r3, #0xb7
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3B8 @ =FUN_0200C7F4
	bx r3
	nop
_0225A3B8: .4byte FUN_0200C7F4
	thumb_func_end ov49_0225A3AC

	thumb_func_start ov49_0225A3BC
ov49_0225A3BC: @ 0x0225A3BC
	movs r3, #0xb7
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3C8 @ =FUN_0200C82C
	bx r3
	nop
_0225A3C8: .4byte FUN_0200C82C
	thumb_func_end ov49_0225A3BC

	thumb_func_start ov49_0225A3CC
ov49_0225A3CC: @ 0x0225A3CC
	movs r3, #0xb7
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3D8 @ =FUN_0200C864
	bx r3
	nop
_0225A3D8: .4byte FUN_0200C864
	thumb_func_end ov49_0225A3CC

	thumb_func_start ov49_0225A3DC
ov49_0225A3DC: @ 0x0225A3DC
	movs r3, #0xb7
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3E8 @ =FUN_0200C89C
	bx r3
	nop
_0225A3E8: .4byte FUN_0200C89C
	thumb_func_end ov49_0225A3DC

	thumb_func_start ov49_0225A3EC
ov49_0225A3EC: @ 0x0225A3EC
	movs r3, #0xb7
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A3F8 @ =FUN_0200C8D4
	bx r3
	nop
_0225A3F8: .4byte FUN_0200C8D4
	thumb_func_end ov49_0225A3EC

	thumb_func_start ov49_0225A3FC
ov49_0225A3FC: @ 0x0225A3FC
	movs r3, #0xb7
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _0225A408 @ =FUN_0200C90C
	bx r3
	nop
_0225A408: .4byte FUN_0200C90C
	thumb_func_end ov49_0225A3FC

	thumb_func_start ov49_0225A40C
ov49_0225A40C: @ 0x0225A40C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r2, #0
	adds r4, r1, #0
	bl FUN_0222D7C0
	adds r2, r0, #0
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200C19C
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225A40C

	thumb_func_start ov49_0225A428
ov49_0225A428: @ 0x0225A428
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov49_0225B8F8
	cmp r4, r0
	bne _0225A468
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov49_0225B8FC
	cmp r0, #1
	bne _0225A468
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov49_0225B934
	cmp r0, #0
	bne _0225A468
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov49_0225B928
	cmp r6, r0
	beq _0225A476
_0225A468:
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov49_0225B89C
_0225A476:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225A428

	thumb_func_start ov49_0225A478
ov49_0225A478: @ 0x0225A478
	push {r3, lr}
	adds r3, r0, #0
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r3, r0
	adds r3, #0x3c
	adds r2, r1, #0
	adds r1, r3, #0
	movs r3, #0x77
	bl ov49_0225B8A8
	pop {r3, pc}
	thumb_func_end ov49_0225A478

	thumb_func_start ov49_0225A490
ov49_0225A490: @ 0x0225A490
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225B8FC
	cmp r0, #0
	beq _0225A4CC
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225B8F8
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	bl FUN_0222A578
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [sp]
	adds r0, r4, r1
	adds r1, #8
	adds r1, r4, r1
	adds r4, #0x3c
	adds r2, r4, #0
	movs r3, #0x77
	bl ov49_0225BEA0
_0225A4CC:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225A490

	thumb_func_start ov49_0225A4D0
ov49_0225A4D0: @ 0x0225A4D0
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r3, _0225A4DC @ =ov49_0225B8E0
	adds r0, r0, r1
	bx r3
	nop
_0225A4DC: .4byte ov49_0225B8E0
	thumb_func_end ov49_0225A4D0

	thumb_func_start ov49_0225A4E0
ov49_0225A4E0: @ 0x0225A4E0
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r3, _0225A4EC @ =ov49_0225B8F8
	adds r0, r0, r1
	bx r3
	nop
_0225A4EC: .4byte ov49_0225B8F8
	thumb_func_end ov49_0225A4E0

	thumb_func_start ov49_0225A4F0
ov49_0225A4F0: @ 0x0225A4F0
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r3, _0225A4FC @ =ov49_0225B8FC
	adds r0, r0, r1
	bx r3
	nop
_0225A4FC: .4byte ov49_0225B8FC
	thumb_func_end ov49_0225A4F0

	thumb_func_start ov49_0225A500
ov49_0225A500: @ 0x0225A500
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r3, _0225A50C @ =ov49_0225B914
	adds r0, r0, r1
	bx r3
	nop
_0225A50C: .4byte ov49_0225B914
	thumb_func_end ov49_0225A500

	thumb_func_start ov49_0225A510
ov49_0225A510: @ 0x0225A510
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r3, _0225A51C @ =ov49_0225B8EC
	adds r0, r0, r1
	bx r3
	nop
_0225A51C: .4byte ov49_0225B8EC
	thumb_func_end ov49_0225A510

	thumb_func_start ov49_0225A520
ov49_0225A520: @ 0x0225A520
	movs r2, #0xf7
	lsls r2, r2, #2
	ldr r0, [r0, r2]
	ldr r3, _0225A52C @ =ov49_02268968
	movs r2, #1
	bx r3
	.align 2, 0
_0225A52C: .4byte ov49_02268968
	thumb_func_end ov49_0225A520

	thumb_func_start ov49_0225A530
ov49_0225A530: @ 0x0225A530
	ldr r1, _0225A538 @ =0x0000018A
	movs r2, #1
	strh r2, [r0, r1]
	bx lr
	.align 2, 0
_0225A538: .4byte 0x0000018A
	thumb_func_end ov49_0225A530

	thumb_func_start ov49_0225A53C
ov49_0225A53C: @ 0x0225A53C
	movs r2, #0x61
	lsls r2, r2, #2
	ldr r3, _0225A548 @ =ov49_0225BA34
	adds r0, r0, r2
	bx r3
	nop
_0225A548: .4byte ov49_0225BA34
	thumb_func_end ov49_0225A53C

	thumb_func_start ov49_0225A54C
ov49_0225A54C: @ 0x0225A54C
	movs r1, #0xa6
	lsls r1, r1, #2
	ldr r3, _0225A558 @ =ov49_0225CB68
	adds r0, r0, r1
	bx r3
	nop
_0225A558: .4byte ov49_0225CB68
	thumb_func_end ov49_0225A54C

	thumb_func_start ov49_0225A55C
ov49_0225A55C: @ 0x0225A55C
	movs r1, #0xf6
	lsls r1, r1, #2
	ldr r3, [r0, r1]
	movs r2, #0
	str r2, [r0, r1]
	adds r0, r3, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225A55C

	thumb_func_start ov49_0225A56C
ov49_0225A56C: @ 0x0225A56C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0225A57A
	bl GF_AssertFail
_0225A57A:
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	bl FUN_0222A578
	bl FUN_0222AAC8
	adds r6, r0, #0
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov49_022653C0
	ldr r0, [r5, #0x34]
	bl FUN_0222A53C
	cmp r4, r0
	bne _0225A5A8
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	bl FUN_0222AD70
_0225A5A8:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225A56C

	thumb_func_start ov49_0225A5AC
ov49_0225A5AC: @ 0x0225A5AC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0225A5BA
	bl GF_AssertFail
_0225A5BA:
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl ov49_022653F0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225A5AC

	thumb_func_start ov49_0225A5C8
ov49_0225A5C8: @ 0x0225A5C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xf9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E3AC
	movs r0, #0x3e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258BE0
	adds r4, #0x3c
	adds r0, r4, #0
	bl ov49_0225A840
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225A5C8

	thumb_func_start ov49_0225A5EC
ov49_0225A5EC: @ 0x0225A5EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x14]
	ldr r0, _0225A798 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0225A79C @ =0x04001050
	adds r6, r2, #0
	strh r1, [r0]
	movs r0, #0x20
	adds r1, r6, #0
	bl FUN_0202055C
	ldr r0, _0225A7A0 @ =0x022697CC
	bl FUN_02022BE8
	ldr r0, _0225A7A4 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	ldr r0, _0225A7A8 @ =0x02269724
	bl FUN_0201ACB0
	adds r0, r6, #0
	bl FUN_0201AC88
	str r0, [r5]
	movs r0, #0
	ldr r7, _0225A7AC @ =0x0226981C
	ldr r4, _0225A7B0 @ =0x02269734
	str r0, [sp, #0x18]
_0225A636:
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r2, r7, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4]
	movs r1, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201C1C4
	ldr r1, [r4]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	ldr r0, [sp, #0x18]
	adds r7, #0x1c
	adds r0, r0, #1
	adds r4, r4, #4
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _0225A636
	ldr r0, [sp, #0x14]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	movs r1, #0xa0
	adds r2, r6, #0
	bl FUN_02003030
	movs r0, #0
	movs r1, #0x80
	adds r2, r6, #0
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0x55
	movs r3, #3
	bl FUN_0200E3DC
	movs r1, #1
	str r4, [sp]
	str r6, [sp, #4]
	ldr r0, [r5]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200E644
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0x1f
	movs r3, #2
	bl FUN_0200EC0C
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xd1
	movs r1, #0x5a
	movs r2, #0
	movs r3, #0x40
	str r6, [sp, #4]
	bl FUN_02007938
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x1f
	str r3, [sp, #0xc]
	adds r2, r0, #0
	str r6, [sp, #0x10]
	bl FUN_0200B150
	ldr r0, _0225A7B4 @ =0x02269744
	ldr r2, _0225A7B8 @ =0x00100010
	movs r1, #0x10
	bl FUN_020215C0
	movs r0, #0x18
	adds r1, r6, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	bl FUN_0203A880
	adds r1, r5, #0
	movs r0, #0x18
	adds r1, #8
	adds r2, r6, #0
	bl FUN_02009F40
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r2, #1
	adds r0, #8
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0
	adds r4, r5, #0
_0225A742:
	movs r0, #0x18
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200A090
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #4
	blt _0225A742
	movs r0, #0x18
	adds r1, r6, #0
	bl FUN_02020654
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	str r0, [sp]
	ldr r0, _0225A7BC @ =ov49_0225A854
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #2
	adds r3, r1, #0
	bl FUN_02026EB4
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225A798: .4byte 0x04000050
_0225A79C: .4byte 0x04001050
_0225A7A0: .4byte 0x022697CC
_0225A7A4: .4byte 0x021D116C
_0225A7A8: .4byte 0x02269724
_0225A7AC: .4byte 0x0226981C
_0225A7B0: .4byte 0x02269734
_0225A7B4: .4byte 0x02269744
_0225A7B8: .4byte 0x00100010
_0225A7BC: .4byte ov49_0225A854
	thumb_func_end ov49_0225A5EC

	thumb_func_start ov49_0225A7C0
ov49_0225A7C0: @ 0x0225A7C0
	push {r3, lr}
	ldr r0, [r0, #4]
	bl FUN_0202457C
	bl FUN_02020674
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225A7C0

	thumb_func_start ov49_0225A7D0
ov49_0225A7D0: @ 0x0225A7D0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl FUN_020205AC
	ldr r5, _0225A83C @ =0x02269734
	movs r4, #0
_0225A7DC:
	ldr r1, [r5]
	ldr r0, [r6]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225A7DC
	ldr r0, [r6]
	bl FUN_0201AB0C
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	bl FUN_0202067C
	movs r0, #5
	lsls r0, r0, #6
	movs r4, #0
	adds r7, r0, #0
	str r4, [r6, r0]
	adds r5, r6, #0
	subs r7, #0x10
_0225A80E:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225A80E
	ldr r0, [r6, #4]
	bl FUN_02024504
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02026F54
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225A83C: .4byte 0x02269734
	thumb_func_end ov49_0225A7D0

	thumb_func_start ov49_0225A840
ov49_0225A840: @ 0x0225A840
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0201EEB4
	bl FUN_0200B224
	bl FUN_0202061C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225A840

	thumb_func_start ov49_0225A854
ov49_0225A854: @ 0x0225A854
	push {r3, r4, lr}
	sub sp, #0xc
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _0225A964 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _0225A968 @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0225A96C @ =0x0000CFFB
	ands r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	ldr r0, _0225A970 @ =0x02269754
	blx FUN_020CF8E4
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r1, #0
	ldr r0, _0225A974 @ =0x00006B5A
	ldr r2, _0225A978 @ =0x00007FFF
	movs r3, #0x3f
	str r1, [sp]
	blx FUN_020CF910
	ldr r1, _0225A97C @ =0xBFFF0000
	ldr r0, _0225A980 @ =0x04000580
	ldr r2, _0225A984 @ =0xFFFFF224
	str r1, [r0]
	ldr r1, _0225A988 @ =0xFFFFF805
	movs r0, #0
	movs r3, #0x6e
	blx FUN_020BF034
	movs r1, #0
	add r0, sp, #4
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #1
	lsls r1, r1, #0xc
	strh r1, [r0, #4]
	add r0, sp, #4
	adds r1, r0, #0
	blx FUN_020CD0F8
	add r4, sp, #4
	movs r1, #0
	movs r2, #2
	movs r3, #4
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	movs r0, #1
	blx FUN_020BF034
	movs r1, #0
	adds r0, r4, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #1
	lsls r1, r1, #0xc
	strh r1, [r0, #4]
	add r0, sp, #4
	adds r1, r0, #0
	blx FUN_020CD0F8
	movs r0, #2
	movs r1, #0
	movs r3, #4
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r0]
	ldrsh r3, [r4, r3]
	blx FUN_020BF034
	ldr r1, _0225A978 @ =0x00007FFF
	movs r0, #2
	blx FUN_020BF070
	movs r1, #0
	adds r0, r4, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	movs r1, #1
	lsls r1, r1, #0xc
	strh r1, [r0, #4]
	add r0, sp, #4
	adds r1, r0, #0
	blx FUN_020CD0F8
	movs r1, #0
	movs r2, #2
	movs r3, #4
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	movs r0, #3
	blx FUN_020BF034
	ldr r1, _0225A978 @ =0x00007FFF
	movs r0, #3
	blx FUN_020BF070
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0225A964: .4byte 0x04000008
_0225A968: .4byte 0xFFFFCFFD
_0225A96C: .4byte 0x0000CFFB
_0225A970: .4byte 0x02269754
_0225A974: .4byte 0x00006B5A
_0225A978: .4byte 0x00007FFF
_0225A97C: .4byte 0xBFFF0000
_0225A980: .4byte 0x04000580
_0225A984: .4byte 0xFFFFF224
_0225A988: .4byte 0xFFFFF805
	thumb_func_end ov49_0225A854

	thumb_func_start ov49_0225A98C
ov49_0225A98C: @ 0x0225A98C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258B44
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	bne _0225A9B2
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0225A9B2
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_0225EF24
_0225A9B2:
	movs r0, #0xf9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E318
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	bne _0225A9E8
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _0225A9E8
	movs r0, #0x3e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258B5C
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_0225EF30
	movs r0, #0xf7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02268870
_0225A9E8:
	adds r0, r4, #0
	bl ov49_0225AA70
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0225AA1E
	ldrb r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _0225AA0A
	ldrb r0, [r4, #6]
	cmp r0, #1
	beq _0225AA0A
	ldrb r0, [r4]
	cmp r0, #1
	bne _0225AA0E
_0225AA0A:
	movs r2, #1
	b _0225AA10
_0225AA0E:
	movs r2, #0
_0225AA10:
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r4, #0
	movs r3, #0x77
	bl ov49_0225B518
_0225AA1E:
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02265378
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225A98C

	thumb_func_start ov49_0225AA2C
ov49_0225AA2C: @ 0x0225AA2C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	movs r0, #0xfb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225CBF4
	movs r0, #0xf9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225E3A0
	movs r0, #0x3e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov49_02258BD4
	movs r0, #0xf5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_02265398
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	adds r4, #0x3c
	adds r0, r4, #0
	bl ov49_0225A7C0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225AA2C

	thumb_func_start ov49_0225AA70
ov49_0225AA70: @ 0x0225AA70
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x34]
	bl FUN_0222A394
	str r0, [sp, #8]
	movs r4, #0
_0225AA80:
	adds r0, r4, #0
	bl FUN_0222F274
	adds r6, r0, #0
	cmp r6, #1
	bne _0225AA9E
	adds r0, r4, #0
	bl FUN_0222F294
	cmp r0, #0
	bne _0225AA9A
	movs r5, #1
	b _0225AAA0
_0225AA9A:
	movs r5, #0
	b _0225AAA0
_0225AA9E:
	movs r5, #0
_0225AAA0:
	adds r0, r4, #0
	bl FUN_0222F314
	adds r2, r0, #0
	ldr r0, [sp, #8]
	str r5, [sp]
	str r0, [sp, #4]
	movs r0, #0xf9
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r1, r4, #0
	adds r3, r6, #0
	bl ov49_0225E8C4
	adds r4, r4, #1
	cmp r4, #3
	blt _0225AA80
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225AA70

	thumb_func_start ov49_0225AAC8
ov49_0225AAC8: @ 0x0225AAC8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x5e
	str r0, [sp, #0x10]
	ldr r0, [r1]
	adds r4, r2, #0
	adds r6, r3, #0
	adds r1, r5, #0
	movs r2, #1
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #6
	lsls r0, r0, #6
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0x18]
	adds r0, r4, #0
	bl FUN_02028EA8
	bl FUN_0202AD3C
	str r0, [r5, #0x14]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov49_0225AAC8

	thumb_func_start ov49_0225AB14
ov49_0225AB14: @ 0x0225AB14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0225AB30
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_0225AB30:
	adds r0, r4, #0
	bl ov49_0225AC38
	ldr r0, [r4, #0x18]
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	thumb_func_end ov49_0225AB14

	thumb_func_start ov49_0225AB44
ov49_0225AB44: @ 0x0225AB44
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0225AB64
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_0225AB64:
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	bl FUN_020263D4
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x14]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, _0225ABA0 @ =0x0001020F
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r5, #0
	bl FUN_020200FC
	movs r1, #1
	str r0, [r5, #0x10]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200E998
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225ABA0: .4byte 0x0001020F
	thumb_func_end ov49_0225AB44

	thumb_func_start ov49_0225ABA4
ov49_0225ABA4: @ 0x0225ABA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0225ABC4
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_0225ABC4:
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	bl FUN_020263D4
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225AC04 @ =0x0001020F
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r5, #0
	bl FUN_020200FC
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200E998
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0225AC04: .4byte 0x0001020F
	thumb_func_end ov49_0225ABA4

	thumb_func_start ov49_0225AC08
ov49_0225AC08: @ 0x0225AC08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225AC16
	bl GF_AssertFail
_0225AC16:
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0200F0AC
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225AC08

	thumb_func_start ov49_0225AC24
ov49_0225AC24: @ 0x0225AC24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225AC36
	bl FUN_0200F450
	movs r0, #0
	str r0, [r4, #0x1c]
_0225AC36:
	pop {r4, pc}
	thumb_func_end ov49_0225AC24

	thumb_func_start ov49_0225AC38
ov49_0225AC38: @ 0x0225AC38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0225AC4A
	bl FUN_0200F478
	movs r0, #0
	str r0, [r4, #0x1c]
_0225AC4A:
	pop {r4, pc}
	thumb_func_end ov49_0225AC38

	thumb_func_start ov49_0225AC4C
ov49_0225AC4C: @ 0x0225AC4C
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0225AC56
	movs r0, #1
	bx lr
_0225AC56:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225AC4C

	thumb_func_start ov49_0225AC5C
ov49_0225AC5C: @ 0x0225AC5C
	push {r3, lr}
	ldr r0, [r0, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0225AC70
	movs r0, #1
	pop {r3, pc}
_0225AC70:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov49_0225AC5C

	thumb_func_start ov49_0225AC74
ov49_0225AC74: @ 0x0225AC74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0225AC90
	ldr r0, [r4, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_0225AC90:
	adds r0, r4, #0
	bl ov49_0225AC38
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225AC74

	thumb_func_start ov49_0225ACA8
ov49_0225ACA8: @ 0x0225ACA8
	push {r4, lr}
	adds r4, r0, #0
	bl ov49_0225AAC8
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201EEB0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225ACA8

	thumb_func_start ov49_0225ACBC
ov49_0225ACBC: @ 0x0225ACBC
	ldr r3, _0225ACC0 @ =ov49_0225AB14
	bx r3
	.align 2, 0
_0225ACC0: .4byte ov49_0225AB14
	thumb_func_end ov49_0225ACBC

	thumb_func_start ov49_0225ACC4
ov49_0225ACC4: @ 0x0225ACC4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0225ACE4
	ldr r0, [r5, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
_0225ACE4:
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5, #0x18]
	adds r1, r4, #0
	bl FUN_020263D4
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5, #0x14]
	movs r1, #1
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x18]
	adds r0, r5, #0
	bl FUN_020200A8
	str r0, [r5, #0x10]
	movs r0, #3
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #2
	bl FUN_0200F004
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225ACC4

	thumb_func_start ov49_0225AD20
ov49_0225AD20: @ 0x0225AD20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	adds r5, r2, #0
	adds r7, r0, #0
	adds r4, r1, #0
	movs r0, #0x3c
	adds r1, r5, #0
	bl FUN_02007688
	adds r6, r0, #0
	ldr r0, _0225AE44 @ =0x00001388
	adds r1, r6, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x13
	str r5, [sp, #8]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r2, #4
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r7, #0x40]
	ldr r0, _0225AE44 @ =0x00001388
	adds r1, r6, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x4d
	str r5, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #0xa
	movs r3, #0
	bl FUN_0200A480
	str r0, [r7, #0x44]
	ldr r1, _0225AE44 @ =0x00001388
	movs r0, #2
	str r1, [sp]
	str r0, [sp, #4]
	lsrs r0, r1, #4
	str r5, [sp, #8]
	ldr r0, [r4, r0]
	adds r1, r6, #0
	movs r2, #5
	movs r3, #0
	bl FUN_0200A540
	str r0, [r7, #0x48]
	ldr r0, _0225AE44 @ =0x00001388
	adds r1, r6, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x4f
	str r5, [sp, #8]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r2, #6
	movs r3, #0
	bl FUN_0200A540
	str r0, [r7, #0x4c]
	adds r0, r6, #0
	bl FUN_0200770C
	ldr r0, [r7, #0x40]
	bl FUN_0200ADA4
	ldr r0, [r7, #0x44]
	bl FUN_0200B00C
	ldr r1, _0225AE44 @ =0x00001388
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r0, #0x13
	str r2, [sp, #0x10]
	lsls r0, r0, #4
	ldr r3, [r4, r0]
	str r3, [sp, #0x14]
	adds r3, r0, #4
	ldr r3, [r4, r3]
	str r3, [sp, #0x18]
	adds r3, r0, #0
	adds r3, #8
	ldr r3, [r4, r3]
	adds r0, #0xc
	str r3, [sp, #0x1c]
	ldr r0, [r4, r0]
	adds r3, r1, #0
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x4c
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r4, #4]
	movs r6, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	movs r0, #1
	str r0, [sp, #0x44]
	movs r0, #3
	lsls r0, r0, #0x12
	str r5, [sp, #0x48]
	ldr r4, _0225AE48 @ =0x022696E8
	str r6, [sp, #0x40]
	str r0, [sp, #0x34]
	adds r5, r7, #0
_0225AE0E:
	ldrb r0, [r4]
	lsls r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl FUN_02024714
	str r0, [r5, #0x50]
	adds r1, r6, #0
	bl FUN_020248F0
	ldr r0, [r5, #0x50]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r5, #0x50]
	movs r1, #0
	bl FUN_02024830
	adds r6, r6, #1
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r6, #2
	blt _0225AE0E
	movs r0, #0
	str r0, [r7, #0x3c]
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225AE44: .4byte 0x00001388
_0225AE48: .4byte 0x022696E8
	thumb_func_end ov49_0225AD20

	thumb_func_start ov49_0225AE4C
ov49_0225AE4C: @ 0x0225AE4C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, [r5, #0x34]
	cmp r1, #0
	beq _0225AE5C
	bl ov49_0225AEE0
_0225AE5C:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _0225AE6C
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225B014
_0225AE6C:
	movs r7, #0
	adds r4, r5, #0
_0225AE70:
	ldr r0, [r4, #0x50]
	bl FUN_02024758
	movs r0, #0
	str r0, [r4, #0x50]
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #2
	blt _0225AE70
	ldr r0, [r5, #0x40]
	bl FUN_0200AEB0
	ldr r0, [r5, #0x44]
	bl FUN_0200B0A8
	movs r7, #0x13
	movs r4, #0
	lsls r7, r7, #4
_0225AE94:
	ldr r0, [r6, r7]
	ldr r1, [r5, #0x40]
	bl FUN_0200A75C
	adds r4, r4, #1
	adds r5, r5, #4
	adds r6, r6, #4
	cmp r4, #4
	blt _0225AE94
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225AE4C

	thumb_func_start ov49_0225AEA8
ov49_0225AEA8: @ 0x0225AEA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _0225AEBC
	bl GF_AssertFail
_0225AEBC:
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02014918
	str r0, [r5, #0x34]
	movs r1, #0
	strh r4, [r5, #0x38]
	cmp r4, #0
	bls _0225AEDE
	adds r2, r1, #0
_0225AED0:
	ldr r0, [r5, #0x34]
	adds r1, r1, #1
	adds r0, r0, r2
	str r6, [r0, #4]
	adds r2, #8
	cmp r1, r4
	blo _0225AED0
_0225AEDE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225AEA8

	thumb_func_start ov49_0225AEE0
ov49_0225AEE0: @ 0x0225AEE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0225AEF4
	bl FUN_02014950
	movs r0, #0
	str r0, [r4, #0x34]
	strh r0, [r4, #0x38]
_0225AEF4:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225AEE0

	thumb_func_start ov49_0225AEF8
ov49_0225AEF8: @ 0x0225AEF8
	ldr r3, _0225AF00 @ =FUN_02014980
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0225AF00: .4byte FUN_02014980
	thumb_func_end ov49_0225AEF8

	thumb_func_start ov49_0225AF04
ov49_0225AF04: @ 0x0225AF04
	ldr r0, [r0, #0x34]
	bx lr
	thumb_func_end ov49_0225AF04

	thumb_func_start ov49_0225AF08
ov49_0225AF08: @ 0x0225AF08
	push {r3, r4}
	ldrh r2, [r0, #0x38]
	movs r3, #0
	cmp r2, #0
	ble _0225AF2A
	ldr r4, [r0, #0x34]
_0225AF14:
	ldr r2, [r4, #4]
	cmp r1, r2
	bne _0225AF20
	movs r0, #1
	pop {r3, r4}
	bx lr
_0225AF20:
	ldrh r2, [r0, #0x38]
	adds r3, r3, #1
	adds r4, #8
	cmp r3, r2
	blt _0225AF14
_0225AF2A:
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_0225AF08

	thumb_func_start ov49_0225AF30
ov49_0225AF30: @ 0x0225AF30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r0, #0
	beq _0225AF46
	bl GF_AssertFail
_0225AF46:
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #1
	cmp r0, #0x12
	blt _0225AF52
	bl GF_AssertFail
_0225AF52:
	adds r3, r4, #0
	adds r2, r5, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r1, r5, #0
	adds r1, #0x20
	str r1, [r5, #0xc]
	ldrh r0, [r4, #0x10]
	add r3, sp, #0x18
	movs r2, #1
	strh r0, [r5, #0x3a]
	ldr r0, _0225AFD4 @ =ov49_0225B058
	str r0, [r5, #4]
	ldrb r0, [r3, #0x1c]
	str r0, [sp]
	add r0, sp, #0x38
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldrh r0, [r4, #0x12]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0xca
	str r0, [sp, #0x10]
	ldrb r3, [r3, #0x18]
	ldr r0, [r6]
	bl FUN_0201D40C
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #1
	movs r2, #0x55
	movs r3, #3
	bl FUN_0200E580
	add r2, sp, #0x18
	ldr r3, [sp, #0x2c]
	ldrh r2, [r2, #0x10]
	lsls r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r7, #0
	lsrs r3, r3, #0x18
	bl FUN_020011DC
	str r0, [r5, #0x30]
	adds r5, #0x20
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225AFD4: .4byte ov49_0225B058
	thumb_func_end ov49_0225AF30

	thumb_func_start ov49_0225AFD8
ov49_0225AFD8: @ 0x0225AFD8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _0225AFE8
	movs r0, #1
	mvns r0, r0
	pop {r3, r4, r5, pc}
_0225AFE8:
	bl FUN_02001338
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0225AFFC
	adds r0, r0, #1
	cmp r4, r0
	bne _0225B004
_0225AFFC:
	adds r0, r5, #0
	bl ov49_0225B070
	b _0225B00A
_0225B004:
	ldr r0, _0225B010 @ =0x000005DC
	bl FUN_0200604C
_0225B00A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0225B010: .4byte 0x000005DC
	thumb_func_end ov49_0225AFD8

	thumb_func_start ov49_0225B014
ov49_0225B014: @ 0x0225B014
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _0225B056
	bl FUN_02001434
	movs r0, #0
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r5, #0
	adds r0, #0x20
	bl FUN_0201D8E4
	adds r0, r5, #0
	adds r0, #0x20
	bl FUN_0201D520
	movs r4, #0
	str r4, [r5, #0x3c]
	adds r6, r4, #0
_0225B046:
	ldr r0, [r5, #0x50]
	adds r1, r6, #0
	bl FUN_02024830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0225B046
_0225B056:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225B014

	thumb_func_start ov49_0225B058
ov49_0225B058: @ 0x0225B058
	push {r3, lr}
	cmp r2, #0
	bne _0225B064
	ldr r0, _0225B068 @ =0x000005DC
	bl FUN_0200604C
_0225B064:
	pop {r3, pc}
	nop
_0225B068: .4byte 0x000005DC
	thumb_func_end ov49_0225B058

	thumb_func_start ov49_0225B06C
ov49_0225B06C: @ 0x0225B06C
	str r1, [r0, #0x3c]
	bx lr
	thumb_func_end ov49_0225B06C

	thumb_func_start ov49_0225B070
ov49_0225B070: @ 0x0225B070
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0225B090
	ldr r0, [r4, #0x50]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x54]
	movs r1, #0
	bl FUN_02024830
	add sp, #4
	pop {r3, r4, pc}
_0225B090:
	ldr r0, [r4, #0x30]
	add r1, sp, #0
	movs r2, #0
	bl FUN_020014E8
	add r0, sp, #0
	ldrh r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #0x50]
	bne _0225B0AC
	movs r1, #0
	bl FUN_02024830
	b _0225B0B2
_0225B0AC:
	movs r1, #1
	bl FUN_02024830
_0225B0B2:
	add r0, sp, #0
	ldrh r1, [r0]
	ldrh r0, [r4, #0x3a]
	subs r0, r0, #7
	cmp r1, r0
	ldr r0, [r4, #0x54]
	blt _0225B0CA
	movs r1, #0
	bl FUN_02024830
	add sp, #4
	pop {r3, r4, pc}
_0225B0CA:
	movs r1, #1
	bl FUN_02024830
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225B070

	thumb_func_start ov49_0225B0D4
ov49_0225B0D4: @ 0x0225B0D4
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225B0D4

	thumb_func_start ov49_0225B0D8
ov49_0225B0D8: @ 0x0225B0D8
	ldr r3, _0225B0DC @ =ov49_0225B124
	bx r3
	.align 2, 0
_0225B0DC: .4byte ov49_0225B124
	thumb_func_end ov49_0225B0D8

	thumb_func_start ov49_0225B0E0
ov49_0225B0E0: @ 0x0225B0E0
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0x10
	ldrb r2, [r0, #0x10]
	str r2, [sp]
	ldrb r2, [r0, #0x14]
	str r2, [sp, #4]
	ldrb r0, [r0, #0x18]
	movs r2, #1
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0xca
	str r0, [sp, #0x10]
	ldr r0, [r1]
	adds r1, r4, #0
	bl FUN_0201D40C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x55
	movs r3, #3
	bl FUN_0200E580
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov49_0225B0E0

	thumb_func_start ov49_0225B124
ov49_0225B124: @ 0x0225B124
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0201D3F0
	cmp r0, #1
	bne _0225B144
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	bl FUN_0201D8E4
	adds r0, r4, #0
	bl FUN_0201D520
_0225B144:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225B124

	thumb_func_start ov49_0225B148
ov49_0225B148: @ 0x0225B148
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	str r3, [sp]
	adds r5, r2, #0
	movs r1, #0xff
	str r1, [sp, #4]
	ldr r1, _0225B174 @ =0x0001020F
	adds r4, r0, #0
	str r1, [sp, #8]
	movs r1, #0
	adds r2, r6, #0
	adds r3, r5, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0225B174: .4byte 0x0001020F
	thumb_func_end ov49_0225B148

	thumb_func_start ov49_0225B178
ov49_0225B178: @ 0x0225B178
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	str r3, [sp]
	add r1, sp, #8
	adds r4, r2, #0
	ldrh r1, [r1, #0x10]
	adds r2, r5, #0
	adds r3, r4, #0
	str r1, [sp, #4]
	movs r1, #0xf
	bl FUN_0201DA74
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225B178

	thumb_func_start ov49_0225B198
ov49_0225B198: @ 0x0225B198
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #0
	beq _0225B1AA
	bl GF_AssertFail
_0225B1AA:
	movs r0, #2
	adds r1, r6, #0
	bl FUN_02014918
	str r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x43
	bl ov49_0225B388
	adds r1, r0, #0
	ldr r0, [r5]
	movs r2, #0
	bl FUN_02014980
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x42
	bl ov49_0225B388
	adds r1, r0, #0
	ldr r0, [r5]
	movs r2, #1
	bl FUN_02014980
	ldr r3, _0225B1FC @ =0x022697AC
	adds r2, r5, #4
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #2
	strh r0, [r5, #0x14]
	ldr r0, [r5]
	str r0, [r5, #4]
	pop {r4, r5, r6, pc}
	nop
_0225B1FC: .4byte 0x022697AC
	thumb_func_end ov49_0225B198

	thumb_func_start ov49_0225B200
ov49_0225B200: @ 0x0225B200
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0225B212
	bl FUN_02014950
	movs r0, #0
	str r0, [r4]
_0225B212:
	pop {r4, pc}
	thumb_func_end ov49_0225B200

	thumb_func_start ov49_0225B214
ov49_0225B214: @ 0x0225B214
	push {r3, r4, lr}
	sub sp, #0x14
	movs r3, #4
	adds r4, r0, #0
	str r3, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	movs r0, #0x5e
	str r0, [sp, #0x10]
	ldr r0, [r1]
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0201D40C
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov49_0225B214

	thumb_func_start ov49_0225B244
ov49_0225B244: @ 0x0225B244
	ldr r3, _0225B248 @ =FUN_0201D520
	bx r3
	.align 2, 0
_0225B248: .4byte FUN_0201D520
	thumb_func_end ov49_0225B244

	thumb_func_start ov49_0225B24C
ov49_0225B24C: @ 0x0225B24C
	push {r4, lr}
	sub sp, #0x10
	adds r2, r1, #0
	movs r1, #0
	str r1, [sp]
	movs r3, #0xff
	str r3, [sp, #4]
	ldr r3, _0225B280 @ =0x0001020F
	adds r4, r0, #0
	str r3, [sp, #8]
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x55
	movs r3, #3
	bl FUN_0200E580
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_0225B280: .4byte 0x0001020F
	thumb_func_end ov49_0225B24C

	thumb_func_start ov49_0225B284
ov49_0225B284: @ 0x0225B284
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_020392D8
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl FUN_0222D7CC
	adds r7, r0, #0
	movs r0, #2
	str r0, [sp]
	ldr r1, [r4]
	adds r0, r5, #0
	movs r2, #5
	movs r3, #0
	bl ov49_0225B3A8
	adds r0, r5, #0
	movs r1, #2
	adds r2, r7, #0
	bl ov49_0225B388
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov49_0225B24C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225B284

	thumb_func_start ov49_0225B2C0
ov49_0225B2C0: @ 0x0225B2C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r2, #0
	adds r4, r1, #0
	bl FUN_0222E7FC
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #5
	movs r3, #0
	bl ov49_0225B3A8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x20
	bl ov49_0225B388
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225B24C
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225B2C0

	thumb_func_start ov49_0225B2F0
ov49_0225B2F0: @ 0x0225B2F0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #2
	movs r2, #0xe
	bl ov49_0225B388
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225B24C
	pop {r4, pc}
	thumb_func_end ov49_0225B2F0

	thumb_func_start ov49_0225B308
ov49_0225B308: @ 0x0225B308
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	str r0, [sp]
	movs r0, #8
	movs r1, #0x40
	adds r2, r7, #0
	bl FUN_0200BD18
	ldr r1, [sp]
	ldr r4, _0225B358 @ =0x02269714
	str r0, [r1]
	movs r6, #0
	adds r5, r1, #0
_0225B322:
	ldr r2, [r4]
	movs r0, #1
	movs r1, #0x1b
	adds r3, r7, #0
	bl FUN_0200BAF8
	str r0, [r5, #4]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #4
	blt _0225B322
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r1, r7, #0
	bl FUN_02026354
	ldr r1, [sp]
	str r0, [r1, #0x14]
	movs r0, #0x1e
	lsls r0, r0, #4
	adds r1, r7, #0
	bl FUN_02026354
	ldr r1, [sp]
	str r0, [r1, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225B358: .4byte 0x02269714
	thumb_func_end ov49_0225B308

	thumb_func_start ov49_0225B35C
ov49_0225B35C: @ 0x0225B35C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	bl FUN_0200BDA0
	movs r4, #0
	adds r5, r6, #0
_0225B36A:
	ldr r0, [r5, #4]
	bl FUN_0200BB44
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225B36A
	ldr r0, [r6, #0x14]
	bl FUN_02026380
	ldr r0, [r6, #0x18]
	bl FUN_02026380
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225B35C

	thumb_func_start ov49_0225B388
ov49_0225B388: @ 0x0225B388
	push {r4, lr}
	adds r4, r0, #0
	lsls r0, r1, #2
	adds r0, r4, r0
	adds r1, r2, #0
	ldr r0, [r0, #4]
	ldr r2, [r4, #0x18]
	bl FUN_0200BB6C
	ldr r0, [r4]
	ldr r1, [r4, #0x14]
	ldr r2, [r4, #0x18]
	bl FUN_0200CBBC
	ldr r0, [r4, #0x14]
	pop {r4, pc}
	thumb_func_end ov49_0225B388

	thumb_func_start ov49_0225B3A8
ov49_0225B3A8: @ 0x0225B3A8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r1, [sp, #0x18]
	adds r4, r2, #0
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r1, r3, #0
	ldr r0, [r0]
	adds r2, r5, #0
	adds r3, r4, #0
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225B3A8

	thumb_func_start ov49_0225B3C8
ov49_0225B3C8: @ 0x0225B3C8
	adds r3, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _0225B3D4 @ =FUN_0200BE48
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0225B3D4: .4byte FUN_0200BE48
	thumb_func_end ov49_0225B3C8

	thumb_func_start ov49_0225B3D8
ov49_0225B3D8: @ 0x0225B3D8
	adds r3, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _0225B3E4 @ =FUN_0200C74C
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0225B3E4: .4byte FUN_0200C74C
	thumb_func_end ov49_0225B3D8

	thumb_func_start ov49_0225B3E8
ov49_0225B3E8: @ 0x0225B3E8
	adds r3, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _0225B3F4 @ =FUN_0200C784
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0225B3F4: .4byte FUN_0200C784
	thumb_func_end ov49_0225B3E8

	thumb_func_start ov49_0225B3F8
ov49_0225B3F8: @ 0x0225B3F8
	adds r3, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _0225B404 @ =FUN_0200C7BC
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0225B404: .4byte FUN_0200C7BC
	thumb_func_end ov49_0225B3F8

	thumb_func_start ov49_0225B408
ov49_0225B408: @ 0x0225B408
	adds r3, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _0225B414 @ =FUN_0200C4B0
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0225B414: .4byte FUN_0200C4B0
	thumb_func_end ov49_0225B408

	thumb_func_start ov49_0225B418
ov49_0225B418: @ 0x0225B418
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, [r0]
	adds r2, r5, #0
	adds r3, r4, #0
	bl FUN_0200C4E8
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225B418

	thumb_func_start ov49_0225B42C
ov49_0225B42C: @ 0x0225B42C
	ldr r3, _0225B434 @ =FUN_0200C528
	ldr r0, [r0]
	bx r3
	nop
_0225B434: .4byte FUN_0200C528
	thumb_func_end ov49_0225B42C

	thumb_func_start ov49_0225B438
ov49_0225B438: @ 0x0225B438
	ldr r3, _0225B440 @ =FUN_0200CC50
	ldr r0, [r0]
	bx r3
	nop
_0225B440: .4byte FUN_0200CC50
	thumb_func_end ov49_0225B438

	thumb_func_start ov49_0225B444
ov49_0225B444: @ 0x0225B444
	movs r1, #0xf6
	movs r2, #1
	lsls r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225B444

	thumb_func_start ov49_0225B450
ov49_0225B450: @ 0x0225B450
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, [sp, #0x20]
	adds r5, r0, #0
	adds r0, r3, #0
	adds r7, r1, #0
	adds r6, r2, #0
	bl FUN_02028F94
	str r0, [sp, #4]
	movs r0, #0xd1
	adds r1, r4, #0
	bl FUN_02007688
	movs r2, #0x53
	lsls r2, r2, #2
	str r0, [r5, r2]
	str r4, [sp]
	ldr r2, [r5, r2]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov49_0225BABC
	movs r2, #0x53
	lsls r2, r2, #2
	adds r0, r5, #0
	ldr r2, [r5, r2]
	adds r0, #8
	adds r1, r6, #0
	adds r3, r4, #0
	bl ov49_0225BB84
	movs r2, #0x45
	lsls r2, r2, #2
	adds r0, r5, r2
	adds r2, #0x38
	ldr r2, [r5, r2]
	adds r1, r6, #0
	adds r3, r4, #0
	bl ov49_0225C844
	movs r1, #0
	strb r1, [r5, #2]
	strb r1, [r5, #1]
	ldrh r0, [r7, #6]
	cmp r0, #0
	bne _0225B4DC
	movs r0, #4
	strb r1, [r5]
	bl FUN_0201C2D8
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0225B4DC:
	movs r0, #5
	strb r0, [r5]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225B450

	thumb_func_start ov49_0225B4E4
ov49_0225B4E4: @ 0x0225B4E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r6, r1, #0
	adds r4, r2, #0
	bl ov49_0225C8A8
	adds r0, r5, #0
	adds r0, #8
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov49_0225BBA8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225BB10
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200770C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225B4E4

	thumb_func_start ov49_0225B518
ov49_0225B518: @ 0x0225B518
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r5, #0
	str r0, [sp, #0x38]
	adds r0, #0x3c
	str r0, [sp, #0x38]
	movs r0, #0xb7
	lsls r0, r0, #2
	ldrb r1, [r4]
	adds r7, r3, #0
	ldr r6, [r5, #0x34]
	str r0, [sp, #0x3c]
	cmp r1, #0xa
	bhi _0225B5FA
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225B544: @ jump table
	.2byte _0225B55A - _0225B544 - 2 @ case 0
	.2byte _0225B568 - _0225B544 - 2 @ case 1
	.2byte _0225B586 - _0225B544 - 2 @ case 2
	.2byte _0225B5D4 - _0225B544 - 2 @ case 3
	.2byte _0225B5F2 - _0225B544 - 2 @ case 4
	.2byte _0225B606 - _0225B544 - 2 @ case 5
	.2byte _0225B6E2 - _0225B544 - 2 @ case 6
	.2byte _0225B700 - _0225B544 - 2 @ case 7
	.2byte _0225B748 - _0225B544 - 2 @ case 8
	.2byte _0225B84E - _0225B544 - 2 @ case 9
	.2byte _0225B880 - _0225B544 - 2 @ case 10
_0225B55A:
	ldrh r0, [r4, #6]
	cmp r0, #1
	bne _0225B5FA
	adds r0, r1, #1
	add sp, #0x50
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B568:
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0
	ldr r3, _0225B890 @ =0x00007FFF
	str r7, [sp, #8]
	adds r2, r1, #0
	bl FUN_0200FA24
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B586:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225B5FA
	adds r0, r6, #0
	bl FUN_0222A5C0
	movs r2, #0xb7
	lsls r2, r2, #2
	str r0, [sp]
	ldr r1, [sp, #0x38]
	adds r0, r4, #0
	adds r2, r5, r2
	adds r3, r7, #0
	bl ov49_0225B9AC
	movs r0, #4
	strb r0, [r4, #1]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B5D4:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r3, _0225B890 @ =0x00007FFF
	str r7, [sp, #8]
	movs r0, #4
	adds r2, r1, #0
	bl FUN_0200FA24
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B5F2:
	bl FUN_0200FB5C
	cmp r0, #1
	beq _0225B5FC
_0225B5FA:
	b _0225B88C
_0225B5FC:
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B606:
	cmp r2, #1
	beq _0225B708
	ldrb r0, [r4, #1]
	cmp r0, #4
	bhi _0225B6D2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225B61C: @ jump table
	.2byte _0225B6D2 - _0225B61C - 2 @ case 0
	.2byte _0225B626 - _0225B61C - 2 @ case 1
	.2byte _0225B6C2 - _0225B61C - 2 @ case 2
	.2byte _0225B642 - _0225B61C - 2 @ case 3
	.2byte _0225B6D2 - _0225B61C - 2 @ case 4
_0225B626:
	movs r2, #0x45
	lsls r2, r2, #2
	adds r0, r4, r2
	adds r2, #0x38
	ldr r1, [sp, #0x38]
	ldr r2, [r4, r2]
	bl ov49_0225C8D4
	cmp r0, #1
	bne _0225B6D2
	adds r0, r5, #0
	bl ov49_0225B444
	b _0225B6D2
_0225B642:
	ldr r2, _0225B894 @ =0x00000153
	ldrb r0, [r4, r2]
	cmp r0, #0
	beq _0225B66E
	subs r1, r2, #3
	movs r0, #0xf7
	subs r2, r2, #1
	lsls r0, r0, #2
	ldrh r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldr r0, [r5, r0]
	bl ov49_02268968
	cmp r0, #0
	bne _0225B66E
	ldr r0, _0225B894 @ =0x00000153
	movs r1, #0
	strb r1, [r4, r0]
	subs r0, #0x3f
	adds r0, r4, r0
	bl ov49_0225CB68
_0225B66E:
	movs r2, #0x45
	lsls r2, r2, #2
	adds r0, r4, r2
	adds r2, #0x38
	ldr r1, [sp, #0x38]
	ldr r2, [r4, r2]
	adds r3, r7, #0
	bl ov49_0225C8D4
	cmp r0, #1
	bne _0225B6D2
	adds r0, r6, #0
	bl FUN_0222A53C
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_0222ADD8
	adds r0, r6, #0
	bl FUN_0222AE54
	adds r0, r6, #0
	bl FUN_0222A53C
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_0222ADA8
	add r1, sp, #0x4c
	add r2, sp, #0x48
	bl FUN_0222AE08
	ldr r0, _0225B894 @ =0x00000153
	movs r1, #1
	strb r1, [r4, r0]
	subs r1, r0, #3
	ldr r2, [sp, #0x4c]
	subs r0, r0, #1
	strh r2, [r4, r1]
	ldr r1, [sp, #0x48]
	strb r1, [r4, r0]
	b _0225B6D2
_0225B6C2:
	ldr r1, [sp, #0x3c]
	adds r0, r4, #0
	adds r1, #0x3c
	str r1, [sp, #0x3c]
	adds r0, #8
	adds r1, r5, r1
	bl ov49_0225BBCC
_0225B6D2:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0225B708
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B6E2:
	movs r0, #3
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r2, #0
	str r7, [sp, #8]
	movs r0, #4
	adds r3, r2, #0
	bl FUN_0200FA24
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B700:
	bl FUN_0200FB5C
	cmp r0, #1
	beq _0225B70A
_0225B708:
	b _0225B88C
_0225B70A:
	ldrb r0, [r4, #1]
	cmp r0, #4
	bhi _0225B73E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225B71C: @ jump table
	.2byte _0225B73E - _0225B71C - 2 @ case 0
	.2byte _0225B726 - _0225B71C - 2 @ case 1
	.2byte _0225B730 - _0225B71C - 2 @ case 2
	.2byte _0225B726 - _0225B71C - 2 @ case 3
	.2byte _0225B726 - _0225B71C - 2 @ case 4
_0225B726:
	ldr r1, [sp, #0x38]
	adds r0, r4, #0
	bl ov49_0225BA20
	b _0225B73E
_0225B730:
	movs r1, #0xc6
	lsls r1, r1, #2
	ldr r2, [sp, #0x38]
	adds r0, r4, #0
	adds r1, r5, r1
	bl ov49_0225B99C
_0225B73E:
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B748:
	ldrb r0, [r4, #2]
	cmp r0, #4
	bhi _0225B840
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225B75A: @ jump table
	.2byte _0225B840 - _0225B75A - 2 @ case 0
	.2byte _0225B764 - _0225B75A - 2 @ case 1
	.2byte _0225B77E - _0225B75A - 2 @ case 2
	.2byte _0225B810 - _0225B75A - 2 @ case 3
	.2byte _0225B764 - _0225B75A - 2 @ case 4
_0225B764:
	adds r0, r6, #0
	bl FUN_0222A5C0
	movs r2, #0xb7
	lsls r2, r2, #2
	str r0, [sp]
	ldr r1, [sp, #0x38]
	adds r0, r4, #0
	adds r2, r5, r2
	adds r3, r7, #0
	bl ov49_0225B9AC
	b _0225B840
_0225B77E:
	adds r0, r6, #0
	bl FUN_0222A5C0
	str r0, [sp, #0x28]
	ldrb r0, [r4, #3]
	str r0, [sp, #0x24]
	adds r0, r6, #0
	bl FUN_0222A53C
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _0225B7A4
	adds r0, r6, #0
	bl FUN_0222A5C0
	str r0, [sp, #0x20]
	movs r0, #1
	str r0, [sp, #0x2c]
	b _0225B7B0
_0225B7A4:
	adds r0, r6, #0
	bl FUN_0222A578
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x2c]
_0225B7B0:
	ldrb r1, [r4, #3]
	adds r0, r6, #0
	bl FUN_0222AB28
	str r0, [sp, #0x34]
	ldrh r0, [r4, #4]
	cmp r0, #1
	bne _0225B7DC
	ldrb r1, [r4, #3]
	adds r0, r6, #0
	bl FUN_0222AB48
	str r0, [sp, #0x30]
	ldrb r1, [r4, #3]
	adds r0, r6, #0
	bl FUN_0222AB58
	cmp r0, #0
	bne _0225B7E0
	movs r1, #0
	str r1, [sp, #0x30]
	b _0225B7E0
_0225B7DC:
	movs r0, #0
	str r0, [sp, #0x30]
_0225B7E0:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x3c]
	str r1, [sp]
	ldr r1, [sp, #0x20]
	str r7, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x38]
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x34]
	adds r3, r5, r3
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x30]
	str r1, [sp, #0x14]
	movs r1, #0xc6
	str r0, [sp, #0x18]
	movs r0, #1
	lsls r1, r1, #2
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	adds r1, r5, r1
	bl ov49_0225B944
	b _0225B840
_0225B810:
	adds r0, r6, #0
	bl FUN_0222A53C
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_0222ADA8
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0225B82C
	bl GF_AssertFail
	movs r0, #0
_0225B82C:
	add r1, sp, #0x44
	add r2, sp, #0x40
	bl FUN_0222AE08
	ldr r1, [sp, #0x38]
	ldr r3, [sp, #0x40]
	adds r0, r4, #0
	adds r2, r7, #0
	bl ov49_0225B9F0
_0225B840:
	movs r0, #0
	strb r0, [r4, #2]
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B84E:
	movs r0, #3
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	str r7, [sp, #8]
	movs r0, #4
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #1]
	cmp r0, #2
	bne _0225B876
	movs r1, #0xc6
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r0, #8
	adds r1, r5, r1
	bl ov49_0225BBCC
_0225B876:
	ldrb r0, [r4]
	add sp, #0x50
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225B880:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0225B88C
	movs r0, #5
	strb r0, [r4]
_0225B88C:
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225B890: .4byte 0x00007FFF
_0225B894: .4byte 0x00000153
	thumb_func_end ov49_0225B518

	thumb_func_start ov49_0225B898
ov49_0225B898: @ 0x0225B898
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov49_0225B898

	thumb_func_start ov49_0225B89C
ov49_0225B89C: @ 0x0225B89C
	movs r3, #2
	strb r3, [r0, #2]
	strb r1, [r0, #3]
	strh r2, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225B89C

	thumb_func_start ov49_0225B8A8
ov49_0225B8A8: @ 0x0225B8A8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r3, #0
	cmp r4, #0x1b
	blo _0225B8BA
	bl GF_AssertFail
_0225B8BA:
	ldrb r0, [r5, #1]
	cmp r0, #2
	beq _0225B8C4
	bl GF_AssertFail
_0225B8C4:
	ldrb r0, [r5, #1]
	cmp r0, #2
	bne _0225B8DE
	movs r2, #0x53
	str r4, [sp]
	lsls r2, r2, #2
	adds r0, r5, #0
	ldr r2, [r5, r2]
	adds r0, #8
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov49_0225BFC4
_0225B8DE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225B8A8

	thumb_func_start ov49_0225B8E0
ov49_0225B8E0: @ 0x0225B8E0
	ldrb r1, [r0, #1]
	cmp r1, #1
	beq _0225B8EA
	movs r1, #1
	strb r1, [r0, #2]
_0225B8EA:
	bx lr
	thumb_func_end ov49_0225B8E0

	thumb_func_start ov49_0225B8EC
ov49_0225B8EC: @ 0x0225B8EC
	ldrb r1, [r0, #1]
	cmp r1, #3
	beq _0225B8F6
	movs r1, #3
	strb r1, [r0, #2]
_0225B8F6:
	bx lr
	thumb_func_end ov49_0225B8EC

	thumb_func_start ov49_0225B8F8
ov49_0225B8F8: @ 0x0225B8F8
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end ov49_0225B8F8

	thumb_func_start ov49_0225B8FC
ov49_0225B8FC: @ 0x0225B8FC
	ldrb r1, [r0, #2]
	cmp r1, #2
	bne _0225B906
	movs r0, #1
	bx lr
_0225B906:
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0225B910
	movs r0, #1
	bx lr
_0225B910:
	movs r0, #0
	bx lr
	thumb_func_end ov49_0225B8FC

	thumb_func_start ov49_0225B914
ov49_0225B914: @ 0x0225B914
	ldrb r1, [r0, #2]
	cmp r1, #0
	bne _0225B924
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0225B924
	movs r0, #1
	bx lr
_0225B924:
	movs r0, #0
	bx lr
	thumb_func_end ov49_0225B914

	thumb_func_start ov49_0225B928
ov49_0225B928: @ 0x0225B928
	ldr r3, _0225B930 @ =ov49_0225BFEC
	adds r0, #8
	bx r3
	nop
_0225B930: .4byte ov49_0225BFEC
	thumb_func_end ov49_0225B928

	thumb_func_start ov49_0225B934
ov49_0225B934: @ 0x0225B934
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _0225B93E
	movs r0, #1
	bx lr
_0225B93E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225B934

	thumb_func_start ov49_0225B944
ov49_0225B944: @ 0x0225B944
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	adds r4, r3, #0
	ldrb r3, [r5, #1]
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r3, #2
	bne _0225B95A
	bl ov49_0225B99C
_0225B95A:
	ldr r0, [sp, #0x40]
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	adds r1, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x48]
	adds r2, #8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x4c]
	adds r3, r7, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x24]
	adds r0, r5, #0
	bl ov49_0225BBD0
	movs r0, #2
	strb r0, [r5, #1]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225B944

	thumb_func_start ov49_0225B99C
ov49_0225B99C: @ 0x0225B99C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #8
	bl ov49_0225BF80
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
	thumb_func_end ov49_0225B99C

	thumb_func_start ov49_0225B9AC
ov49_0225B9AC: @ 0x0225B9AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5, #1]
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	cmp r0, #1
	beq _0225B9C8
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0225B9D0
_0225B9C8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225BA20
_0225B9D0:
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	subs r0, #0x38
	str r1, [sp]
	ldr r3, [sp, #0x20]
	adds r0, r5, r0
	adds r1, r4, #0
	adds r2, r7, #0
	str r6, [sp, #4]
	bl ov49_0225C970
	movs r0, #1
	strb r0, [r5, #1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225B9AC

	thumb_func_start ov49_0225B9F0
ov49_0225B9F0: @ 0x0225B9F0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	ldrb r2, [r5, #1]
	adds r6, r1, #0
	adds r7, r3, #0
	cmp r2, #3
	bne _0225BA04
	bl ov49_0225BA20
_0225BA04:
	movs r3, #0x45
	lsls r3, r3, #2
	adds r0, r5, r3
	str r4, [sp]
	adds r3, #0x38
	ldr r3, [r5, r3]
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov49_0225CA30
	movs r0, #3
	strb r0, [r5, #1]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225B9F0

	thumb_func_start ov49_0225BA20
ov49_0225BA20: @ 0x0225BA20
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x45
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov49_0225CAA8
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
	thumb_func_end ov49_0225BA20

	thumb_func_start ov49_0225BA34
ov49_0225BA34: @ 0x0225BA34
	ldr r2, _0225BA3C @ =0x0000011A
	strh r1, [r0, r2]
	bx lr
	nop
_0225BA3C: .4byte 0x0000011A
	thumb_func_end ov49_0225BA34

	thumb_func_start ov49_0225BA40
ov49_0225BA40: @ 0x0225BA40
	adds r1, r0, #0
	movs r0, #0x55
	lsls r0, r0, #2
	strh r2, [r1, r0]
	adds r0, r0, #2
	strh r3, [r1, r0]
	ldr r3, _0225BA54 @ =FUN_0200E374
	ldr r0, _0225BA58 @ =ov49_0225BA5C
	movs r2, #0
	bx r3
	.align 2, 0
_0225BA54: .4byte FUN_0200E374
_0225BA58: .4byte ov49_0225BA5C
	thumb_func_end ov49_0225BA40

	thumb_func_start ov49_0225BA5C
ov49_0225BA5C: @ 0x0225BA5C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	movs r3, #0
	ldr r1, _0225BAB8 @ =0x00000156
	str r3, [sp]
	adds r5, r0, #0
	ldrh r0, [r4, r1]
	movs r2, #4
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r1, r1, #2
	subs r0, #0xa
	ldrh r1, [r4, r1]
	ldr r0, [r4, r0]
	bl FUN_02007B8C
	movs r1, #0xa0
	adds r2, r1, #0
	adds r2, #0xb6
	ldrh r2, [r4, r2]
	movs r0, #4
	bl FUN_02003030
	bl FUN_020776B4
	adds r6, r0, #0
	bl FUN_02077690
	adds r1, r0, #0
	movs r0, #0x60
	str r0, [sp]
	adds r0, #0xf6
	ldrh r0, [r4, r0]
	movs r3, #0x16
	movs r2, #4
	str r0, [sp, #4]
	adds r0, r6, #0
	lsls r3, r3, #4
	bl FUN_02007938
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225BAB8: .4byte 0x00000156
	thumb_func_end ov49_0225BA5C

	thumb_func_start ov49_0225BABC
ov49_0225BABC: @ 0x0225BABC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r4, [sp, #0x20]
	cmp r3, #0
	bne _0225BADC
	movs r3, #0
	str r3, [sp]
	adds r0, r5, #0
	movs r1, #0x56
	movs r2, #4
	str r4, [sp, #4]
	bl FUN_02007B8C
	b _0225BAEC
_0225BADC:
	movs r3, #0
	str r3, [sp]
	adds r0, r5, #0
	movs r1, #0x57
	movs r2, #4
	str r4, [sp, #4]
	bl FUN_02007B8C
_0225BAEC:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r6]
	adds r0, r5, #0
	movs r1, #0x36
	movs r3, #4
	bl FUN_02007B44
	movs r0, #4
	movs r1, #0xa0
	adds r2, r4, #0
	bl FUN_02003030
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225BABC

	thumb_func_start ov49_0225BB10
ov49_0225BB10: @ 0x0225BB10
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225BB10

	thumb_func_start ov49_0225BB14
ov49_0225BB14: @ 0x0225BB14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [sp, #0x2c]
	adds r6, r3, #0
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	add r3, sp, #0xc
	ldr r4, [sp, #0x28]
	bl FUN_02007C2C
	ldr r2, [sp, #0xc]
	adds r7, r0, #0
	ldr r0, [r2, #8]
	adds r2, #0xc
	lsrs r1, r0, #1
	movs r0, #0
	cmp r1, #0
	ble _0225BB4C
_0225BB3E:
	ldrh r3, [r2]
	adds r0, r0, #1
	adds r3, r3, r4
	strh r3, [r2]
	adds r2, r2, #2
	cmp r0, r1
	blt _0225BB3E
_0225BB4C:
	ldr r2, [sp, #0xc]
	movs r3, #0
	str r3, [sp]
	ldrh r0, [r2]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	adds r2, #0xc
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5]
	bl FUN_0201C4C4
	lsls r1, r6, #0x18
	ldr r0, [r5]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225BB14

	thumb_func_start ov49_0225BB84
ov49_0225BB84: @ 0x0225BB84
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _0225BBA4 @ =0x022697F4
	adds r7, r1, #0
	movs r6, #0
	adds r5, r0, #4
_0225BB8E:
	ldr r0, [r7]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #5
	blt _0225BB8E
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225BBA4: .4byte 0x022697F4
	thumb_func_end ov49_0225BB84

	thumb_func_start ov49_0225BBA8
ov49_0225BBA8: @ 0x0225BBA8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0x54]
	cmp r3, #0
	beq _0225BBB6
	bl ov49_0225BF80
_0225BBB6:
	movs r5, #0
	adds r4, r4, #4
_0225BBBA:
	adds r0, r4, #0
	bl FUN_0201D520
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #5
	blt _0225BBBA
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225BBA8

	thumb_func_start ov49_0225BBCC
ov49_0225BBCC: @ 0x0225BBCC
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225BBCC

	thumb_func_start ov49_0225BBD0
ov49_0225BBD0: @ 0x0225BBD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	ldr r4, [sp, #0x28]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	adds r5, r2, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	adds r6, r3, #0
	str r0, [sp, #0x38]
	adds r0, r4, #0
	bl ov49_0225B438
	ldr r0, [sp, #0x38]
	bl FUN_0222A9CC
	cmp r0, #0
	bne _0225BC1C
	ldr r0, [sp, #0x40]
	ldr r7, _0225BE98 @ =0x00070800
	cmp r0, #0
	bne _0225BC0E
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	adds r1, r6, #0
	movs r2, #0x56
	bl ov49_0225BA40
	b _0225BC40
_0225BC0E:
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	adds r1, r6, #0
	movs r2, #0x58
	bl ov49_0225BA40
	b _0225BC40
_0225BC1C:
	ldr r0, [sp, #0x40]
	movs r7, #0xc1
	lsls r7, r7, #0xa
	cmp r0, #0
	bne _0225BC34
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	adds r1, r6, #0
	movs r2, #0x57
	bl ov49_0225BA40
	b _0225BC40
_0225BC34:
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x34]
	adds r1, r6, #0
	movs r2, #0x58
	bl ov49_0225BA40
_0225BC40:
	ldr r0, [r6]
	movs r1, #4
	movs r2, #0
	bl FUN_0201CB28
	ldr r0, [r6]
	movs r1, #5
	movs r2, #0
	bl FUN_0201CB28
	ldr r0, [r6]
	movs r1, #6
	movs r2, #0
	bl FUN_0201CB28
	adds r0, r5, #0
	bl ov49_0225C3C0
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x30]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0x5c
	movs r3, #4
	bl ov49_0225BB14
	ldr r0, [sp, #0x34]
	bl FUN_02028ED0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	bl FUN_0222A844
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0x2c
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r0, [sp, #0x10]
	bl FUN_02028F88
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #5
	movs r3, #0
	bl ov49_0225B3A8
	movs r0, #0x7a
	str r0, [sp]
	movs r2, #0
	ldr r0, _0225BE9C @ =0x00010200
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0x31
	bl ov49_0225C414
	movs r2, #0
	str r2, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0x2d
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225C470
	movs r0, #0x7a
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0225BE9C @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #0x32
	bl ov49_0225C414
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225C460
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0x2e
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r0, [sp, #0x38]
	bl FUN_0222AA84
	cmp r0, #0
	bne _0225BD3E
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0225BE9C @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x37
	bl ov49_0225C3DC
	b _0225BD60
_0225BD3E:
	ldr r2, [sp, #0x38]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225C480
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0225BE9C @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x33
	bl ov49_0225C3DC
_0225BD60:
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225C460
	ldr r0, [sp, #0x44]
	cmp r0, #0
	beq _0225BE06
	movs r0, #1
	str r0, [r5]
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225C470
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #4
	movs r3, #0x38
	str r7, [sp, #8]
	bl ov49_0225C3DC
	ldr r2, [sp, #0x48]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225C4B0
	movs r0, #6
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	ldr r0, _0225BE9C @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #0x3b
	bl ov49_0225C3DC
	movs r0, #0x5a
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	ldr r0, _0225BE9C @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #0x3c
	bl ov49_0225C3DC
	movs r0, #6
	str r0, [sp]
	movs r0, #0x2c
	str r0, [sp, #4]
	ldr r0, _0225BE9C @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #0x3d
	bl ov49_0225C3DC
	movs r0, #0x5a
	str r0, [sp]
	movs r0, #0x2c
	str r0, [sp, #4]
	ldr r0, _0225BE9C @ =0x00010200
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #0x3e
	bl ov49_0225C3DC
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225C460
	b _0225BE3A
_0225BE06:
	movs r1, #0
	str r1, [r5]
	movs r0, #8
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #4
	movs r3, #0x30
	str r7, [sp, #8]
	bl ov49_0225C3DC
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225C460
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x30]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r3, [sp, #0x34]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov49_0225C4CC
_0225BE3A:
	ldr r0, [sp, #0x38]
	bl FUN_0222AAC8
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	ldr r2, [sp, #0x30]
	str r0, [sp, #4]
	ldr r3, [sp, #0x34]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov49_0225BFF0
	ldr r0, [sp, #0x2c]
	cmp r0, #1
	bne _0225BE6A
	ldr r0, [sp, #0x38]
	bl FUN_0222A9CC
	cmp r0, #1
	bne _0225BE66
	movs r0, #0x61
	b _0225BE70
_0225BE66:
	movs r0, #0
	b _0225BE70
_0225BE6A:
	ldr r0, [sp, #0x38]
	bl FUN_0222AA5C
_0225BE70:
	ldr r2, [sp, #0x30]
	str r0, [sp]
	ldr r3, [sp, #0x34]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov49_0225C180
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x34]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225BEA0
	ldr r0, [sp, #0x10]
	bl FUN_0201AB0C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225BE98: .4byte 0x00070800
_0225BE9C: .4byte 0x00010200
	thumb_func_end ov49_0225BBD0

	thumb_func_start ov49_0225BEA0
ov49_0225BEA0: @ 0x0225BEA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r0, [sp, #0x48]
	ldr r6, _0225BF78 @ =0x0226978C
	str r0, [sp, #0x48]
	movs r0, #0
	str r0, [sp, #0x24]
	ldr r0, _0225BF7C @ =0x022696F8
	adds r5, r2, #0
	str r3, [sp, #0x1c]
	str r0, [sp, #0x20]
	movs r4, #2
_0225BEB8:
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x24]
	bl FUN_0222AAEC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	beq _0225BF60
	bl FUN_0222D7C0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	bl FUN_020776B4
	str r0, [sp, #0x28]
	adds r0, r7, #0
	bl FUN_02077678
	adds r1, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	movs r2, #1
	bl FUN_02007A44
	add r1, sp, #0x30
	str r0, [sp, #0x2c]
	blx FUN_020B70A8
	ldr r0, [sp, #0x20]
	movs r1, #6
	ldrh r0, [r0]
	adds r3, r1, #0
	adds r3, #0xfa
	str r0, [sp]
	ldr r2, [sp, #0x30]
	ldr r0, [r5]
	ldr r2, [r2, #0x14]
	bl FUN_0201C0C0
	ldr r0, [sp, #0x2c]
	bl FUN_0201AB0C
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	lsls r3, r4, #0x18
	str r6, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x14]
	movs r0, #2
	str r0, [sp, #0x18]
	ldr r0, [r5]
	movs r1, #6
	movs r2, #0x1a
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	adds r0, r7, #0
	bl FUN_0207769C
	movs r1, #4
	adds r0, #0xb
	str r1, [sp]
	movs r1, #2
	lsls r0, r0, #0x18
	str r1, [sp, #4]
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r3, r4, #0x18
	ldr r0, [r5]
	movs r1, #6
	movs r2, #0x1a
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	ldr r0, [r5]
	movs r1, #6
	bl FUN_0201EFBC
_0225BF60:
	ldr r0, [sp, #0x20]
	adds r6, #0x10
	adds r0, r0, #2
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	adds r4, r4, #2
	adds r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #2
	blt _0225BEB8
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225BF78: .4byte 0x0226978C
_0225BF7C: .4byte 0x022696F8
	thumb_func_end ov49_0225BEA0

	thumb_func_start ov49_0225BF80
ov49_0225BF80: @ 0x0225BF80
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	adds r4, r2, #0
	cmp r1, #1
	bne _0225BF92
	movs r0, #0
	str r0, [r5]
	b _0225BF98
_0225BF92:
	adds r1, r4, #0
	bl ov49_0225C78C
_0225BF98:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225C148
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225C328
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201CAE0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225BF80

	thumb_func_start ov49_0225BFC4
ov49_0225BFC4: @ 0x0225BFC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov49_0225C148
	ldr r0, [sp, #0x20]
	adds r1, r4, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov49_0225BFF0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225BFC4

	thumb_func_start ov49_0225BFEC
ov49_0225BFEC: @ 0x0225BFEC
	ldr r0, [r0]
	bx lr
	thumb_func_end ov49_0225BFEC

	thumb_func_start ov49_0225BFF0
ov49_0225BFF0: @ 0x0225BFF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	adds r5, r0, #0
	ldr r0, [sp, #0x90]
	adds r4, r1, #0
	adds r6, r3, #0
	str r2, [sp, #0x2c]
	cmp r0, #0x1b
	blo _0225C006
	bl GF_AssertFail
_0225C006:
	ldr r0, [r5, #0x54]
	cmp r0, #0
	beq _0225C010
	bl GF_AssertFail
_0225C010:
	ldr r0, [sp, #0x90]
	movs r1, #3
	blx FUN_020F2BA4
	adds r7, r0, #0
	ldr r0, [sp, #0x90]
	movs r1, #3
	blx FUN_020F2BA4
	str r1, [sp, #0x30]
	lsls r0, r7, #1
	str r0, [sp, #0x34]
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	str r6, [sp, #8]
	adds r1, #0xcc
	ldr r0, [r4, r1]
	adds r2, r7, r2
	ldr r1, [sp, #0x2c]
	adds r2, #0x3d
	movs r3, #0
	bl FUN_0200A3C8
	str r0, [r5, #0x58]
	bl FUN_0200ADA4
	cmp r0, #0
	bne _0225C052
	bl GF_AssertFail
_0225C052:
	ldr r0, [r5, #0x58]
	bl FUN_0200A740
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	adds r1, #0xd0
	ldr r0, [r4, r1]
	ldr r1, [sp, #0x2c]
	movs r2, #0x59
	movs r3, #0
	bl FUN_0200A480
	str r0, [r5, #0x5c]
	bl FUN_0200B00C
	cmp r0, #0
	bne _0225C082
	bl GF_AssertFail
_0225C082:
	ldr r0, [r5, #0x5c]
	bl FUN_0200A740
	movs r1, #0x64
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	str r6, [sp, #8]
	adds r1, #0xd4
	ldr r0, [r4, r1]
	adds r2, r7, r2
	ldr r1, [sp, #0x2c]
	adds r2, #0x3c
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0x60]
	movs r1, #0x64
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r2, [sp, #0x34]
	str r6, [sp, #8]
	adds r1, #0xd8
	ldr r0, [r4, r1]
	adds r2, r7, r2
	ldr r1, [sp, #0x2c]
	adds r2, #0x3b
	movs r3, #0
	bl FUN_0200A540
	str r0, [r5, #0x64]
	movs r0, #0
	add r2, sp, #0x38
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	movs r1, #0x64
	adds r2, r1, #0
	str r1, [sp]
	subs r2, #0x65
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	adds r2, r1, #0
	str r0, [sp, #0x10]
	adds r2, #0xcc
	ldr r2, [r4, r2]
	adds r3, r1, #0
	str r2, [sp, #0x14]
	adds r2, r1, #0
	adds r2, #0xd0
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	adds r2, r1, #0
	adds r2, #0xd4
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	adds r2, r1, #0
	adds r2, #0xd8
	ldr r2, [r4, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x58
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r4, #4]
	str r0, [sp, #0x38]
	add r0, sp, #0x58
	str r0, [sp, #0x3c]
	movs r0, #0x10
	str r0, [sp, #0x4c]
	movs r0, #2
	str r0, [sp, #0x50]
	movs r0, #0xd
	lsls r0, r0, #0x10
	str r0, [sp, #0x40]
	movs r0, #0x66
	lsls r0, r0, #0xe
	str r0, [sp, #0x44]
	add r0, sp, #0x38
	str r6, [sp, #0x54]
	bl FUN_02024714
	ldr r1, [sp, #0x30]
	str r0, [r5, #0x54]
	bl FUN_020248F0
	ldr r0, [r5, #0x54]
	ldr r1, [sp, #0x94]
	bl FUN_02024830
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225BFF0

	thumb_func_start ov49_0225C148
ov49_0225C148: @ 0x0225C148
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	adds r4, r1, #0
	bl FUN_02024758
	movs r0, #0
	str r0, [r5, #0x54]
	ldr r0, [r5, #0x58]
	bl FUN_0200AEB0
	ldr r0, [r5, #0x5c]
	bl FUN_0200B0A8
	movs r7, #0x13
	movs r6, #0
	lsls r7, r7, #4
_0225C16A:
	ldr r0, [r4, r7]
	ldr r1, [r5, #0x58]
	bl FUN_0200A75C
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, r4, #4
	cmp r6, #4
	blt _0225C16A
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225C148

	thumb_func_start ov49_0225C180
ov49_0225C180: @ 0x0225C180
	push {r4, r5, r6, r7, lr}
	sub sp, #0x94
	adds r6, r0, #0
	ldr r0, [r6, #0x68]
	adds r5, r1, #0
	str r3, [sp, #0x2c]
	ldr r4, [sp, #0xa8]
	cmp r0, #0
	beq _0225C196
	bl GF_AssertFail
_0225C196:
	ldr r1, _0225C324 @ =0x0226988C
	movs r0, #0
_0225C19A:
	ldrh r2, [r1]
	cmp r4, r2
	bne _0225C1AA
	ldrh r2, [r1, #2]
	str r2, [sp, #0x34]
	ldrh r2, [r1, #4]
	str r2, [sp, #0x30]
	ldrh r7, [r1, #6]
_0225C1AA:
	adds r0, r0, #1
	adds r1, #8
	cmp r0, #0x12
	blo _0225C19A
	ldr r0, [sp, #0x34]
	movs r1, #2
	add r2, sp, #0x7c
	bl FUN_02070D84
	movs r1, #0x65
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, #0xcb
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x80]
	movs r3, #0
	bl FUN_0200A1D8
	str r0, [r6, #0x6c]
	bl FUN_0200ADA4
	cmp r0, #0
	bne _0225C1E4
	bl GF_AssertFail
_0225C1E4:
	movs r1, #0x65
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	adds r1, #0xcf
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x84]
	movs r3, #0
	bl FUN_0200A234
	str r0, [r6, #0x70]
	bl FUN_0200A828
	bl ov49_0225C368
	ldr r0, [r6, #0x70]
	bl FUN_0200B00C
	cmp r0, #0
	bne _0225C21A
	bl GF_AssertFail
_0225C21A:
	ldr r0, [r6, #0x70]
	bl FUN_0200A740
	movs r1, #0x65
	str r1, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, #0xd3
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x88]
	movs r3, #0
	bl FUN_0200A294
	str r0, [r6, #0x74]
	movs r1, #0x65
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, #0xd7
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x7c]
	ldr r2, [sp, #0x8c]
	movs r3, #0
	bl FUN_0200A294
	str r0, [r6, #0x78]
	movs r0, #0
	add r2, sp, #0x38
	adds r1, r0, #0
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	stm r2!, {r0, r1}
	movs r1, #0x65
	adds r2, r1, #0
	str r1, [sp]
	subs r2, #0x66
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	movs r2, #3
	str r2, [sp, #0x10]
	adds r2, r1, #0
	adds r2, #0xcb
	ldr r2, [r5, r2]
	adds r3, r1, #0
	str r2, [sp, #0x14]
	adds r2, r1, #0
	adds r2, #0xcf
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r1, #0
	adds r2, #0xd3
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	adds r2, r1, #0
	adds r2, #0xd7
	ldr r2, [r5, r2]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x58
	adds r2, r1, #0
	bl FUN_02009D48
	ldr r0, [r5, #4]
	str r0, [sp, #0x38]
	add r0, sp, #0x58
	str r0, [sp, #0x3c]
	movs r0, #0x20
	str r0, [sp, #0x4c]
	movs r0, #2
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _0225C2D4
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C2E2
_0225C2D4:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C2E2:
	blx FUN_020F2104
	str r0, [sp, #0x40]
	cmp r7, #0
	beq _0225C2FE
	lsls r0, r7, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C30C
_0225C2FE:
	lsls r0, r7, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C30C:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #0x44]
	add r0, sp, #0x38
	bl FUN_02024714
	str r0, [r6, #0x68]
	add sp, #0x94
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225C324: .4byte 0x0226988C
	thumb_func_end ov49_0225C180

	thumb_func_start ov49_0225C328
ov49_0225C328: @ 0x0225C328
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x68]
	adds r4, r1, #0
	bl FUN_02024B1C
	bl FUN_02021A50
	ldr r0, [r5, #0x68]
	bl FUN_02024758
	movs r0, #0
	str r0, [r5, #0x68]
	ldr r0, [r5, #0x6c]
	bl FUN_0200AEB0
	ldr r0, [r5, #0x70]
	bl FUN_0200B0A8
	movs r7, #0x13
	movs r6, #0
	lsls r7, r7, #4
_0225C354:
	ldr r0, [r4, r7]
	ldr r1, [r5, #0x6c]
	bl FUN_0200A75C
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, r4, #4
	cmp r6, #4
	blt _0225C354
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225C328

	thumb_func_start ov49_0225C368
ov49_0225C368: @ 0x0225C368
	push {r4, r5, r6, r7}
	ldr r1, [r0, #8]
	ldr r4, [r0, #0xc]
	lsrs r3, r1, #1
	movs r2, #0
	cmp r3, #0
	ble _0225C3BC
	movs r5, #0xc8
_0225C378:
	ldrh r6, [r4]
	movs r0, #0x1f
	adds r2, r2, #1
	adds r1, r6, #0
	asrs r7, r6, #5
	ands r1, r0
	ands r0, r7
	asrs r7, r6, #0xa
	movs r6, #0x1f
	ands r6, r7
	movs r7, #0x1d
	muls r7, r6, r7
	movs r6, #0x4c
	muls r6, r1, r6
	movs r1, #0x97
	muls r1, r0, r1
	adds r0, r6, r1
	adds r0, r7, r0
	asrs r6, r0, #8
	lsls r0, r6, #8
	adds r7, r6, #0
	asrs r1, r0, #8
	lsls r0, r6, #7
	muls r7, r5, r7
	asrs r0, r0, #8
	asrs r6, r7, #8
	lsls r0, r0, #0xa
	lsls r6, r6, #5
	orrs r0, r6
	orrs r0, r1
	strh r0, [r4]
	adds r4, r4, #2
	cmp r2, r3
	blt _0225C378
_0225C3BC:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov49_0225C368

	thumb_func_start ov49_0225C3C0
ov49_0225C3C0: @ 0x0225C3C0
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #4
	adds r6, r4, #0
_0225C3C8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #5
	blt _0225C3C8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225C3C0

	thumb_func_start ov49_0225C3DC
ov49_0225C3DC: @ 0x0225C3DC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r2, #0
	adds r0, r1, #0
	movs r1, #1
	adds r2, r3, #0
	bl ov49_0225B388
	add r3, sp, #0x10
	adds r2, r0, #0
	ldrb r0, [r3, #0x14]
	movs r1, #0
	adds r5, r5, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsls r0, r4, #4
	ldrb r3, [r3, #0x10]
	adds r0, r5, r0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225C3DC

	thumb_func_start ov49_0225C414
ov49_0225C414: @ 0x0225C414
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r2, #0
	adds r0, r1, #0
	movs r1, #1
	adds r2, r3, #0
	bl ov49_0225B388
	adds r6, r0, #0
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	subs r3, r1, r0
	bpl _0225C43C
	movs r3, #0
_0225C43C:
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	adds r2, r5, #4
	movs r1, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	lsls r0, r4, #4
	adds r0, r2, r0
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225C414

	thumb_func_start ov49_0225C460
ov49_0225C460: @ 0x0225C460
	ldr r3, _0225C46C @ =FUN_0201D5C8
	adds r2, r0, #4
	lsls r0, r1, #4
	adds r0, r2, r0
	bx r3
	nop
_0225C46C: .4byte FUN_0201D5C8
	thumb_func_end ov49_0225C460

	thumb_func_start ov49_0225C470
ov49_0225C470: @ 0x0225C470
	ldr r3, _0225C47C @ =ov49_0225B3C8
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	bx r3
	nop
_0225C47C: .4byte ov49_0225B3C8
	thumb_func_end ov49_0225C470

	thumb_func_start ov49_0225C480
ov49_0225C480: @ 0x0225C480
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r0, r6, #0
	adds r5, r1, #0
	bl FUN_0222AA84
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0222AAA8
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_0225B408
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl ov49_0225B418
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225C480

	thumb_func_start ov49_0225C4B0
ov49_0225C4B0: @ 0x0225C4B0
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r2, #0
	movs r4, #0
_0225C4B8:
	ldrh r2, [r5]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov49_0225B42C
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #4
	blt _0225C4B8
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225C4B0

	thumb_func_start ov49_0225C4CC
ov49_0225C4CC: @ 0x0225C4CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r7, r0, #0
	ldr r0, [sp, #0xb0]
	adds r5, r1, #0
	str r0, [sp, #0xb0]
	movs r0, #0xd7
	adds r1, r3, #0
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	bl FUN_02007688
	str r0, [sp, #0x50]
	ldr r0, [sp, #0xb4]
	bl FUN_0222A99C
	str r0, [sp, #0x44]
	ldr r0, [sp, #0xb4]
	bl FUN_0222A9CC
	str r0, [sp, #0x4c]
	ldr r0, _0225C77C @ =0x02269774
	movs r6, #0
	str r0, [sp, #0x40]
	ldr r0, _0225C780 @ =0x02269704
	adds r4, r7, #0
	str r0, [sp, #0x3c]
	ldr r0, _0225C784 @ =0x022696FC
	str r0, [sp, #0x38]
_0225C506:
	cmp r6, #2
	bne _0225C526
	ldr r0, [sp, #0x4c]
	cmp r0, #1
	bne _0225C546
	adds r1, r4, #0
	adds r1, #0xac
	movs r0, #0
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xec
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xfc
	str r0, [r1]
	b _0225C5EC
_0225C526:
	cmp r6, #3
	bne _0225C546
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	bne _0225C546
	adds r1, r4, #0
	adds r1, #0xac
	movs r0, #0
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xec
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xfc
	str r0, [r1]
	b _0225C5EC
_0225C546:
	ldr r0, [sp, #0x40]
	ldrh r0, [r0]
	cmp r0, #0xd7
	bne _0225C554
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x34]
	b _0225C558
_0225C554:
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x34]
_0225C558:
	adds r0, r6, #0
	adds r0, #0x96
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	ldr r2, [sp, #0x40]
	ldrh r0, [r0, #4]
	ldr r1, [sp, #0x34]
	movs r3, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	movs r0, #0x4d
	lsls r0, r0, #2
	ldrh r2, [r2, #2]
	ldr r0, [r5, r0]
	bl FUN_0200A480
	adds r1, r4, #0
	adds r1, #0xac
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200B00C
	cmp r0, #0
	bne _0225C596
	bl GF_AssertFail
_0225C596:
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0200A740
	adds r0, r6, #0
	adds r0, #0x96
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x3c]
	str r0, [sp, #8]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x34]
	movs r3, #0
	bl FUN_0200A540
	adds r1, r4, #0
	adds r1, #0xec
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0x96
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x38]
	str r0, [sp, #8]
	movs r0, #0x4f
	lsls r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x34]
	movs r3, #0
	bl FUN_0200A540
	adds r1, r4, #0
	adds r1, #0xfc
	str r0, [r1]
_0225C5EC:
	ldr r0, [sp, #0x40]
	adds r6, r6, #1
	adds r0, r0, #6
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	adds r4, r4, #4
	adds r0, r0, #2
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	adds r0, r0, #2
	str r0, [sp, #0x38]
	cmp r6, #4
	bge _0225C608
	b _0225C506
_0225C608:
	ldr r0, _0225C788 @ =0x0226991C
	movs r6, #0
	str r0, [sp, #0x48]
_0225C60E:
	ldr r0, [sp, #0xb0]
	adds r1, r6, #0
	bl FUN_0222A92C
	adds r4, r0, #0
	ldr r0, [sp, #0xb0]
	adds r1, r6, #0
	bl FUN_0222A964
	adds r1, r0, #0
	cmp r4, #0x18
	bne _0225C632
	adds r1, r7, #0
	adds r1, #0xbc
	movs r0, #0
	str r0, [r1]
	str r0, [r7, #0x7c]
	b _0225C760
_0225C632:
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x4c]
	adds r0, r4, #0
	bl ov49_0225C828
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #1
	bne _0225C648
	ldr r1, [sp, #0x2c]
	b _0225C64A
_0225C648:
	ldr r1, [sp, #0x50]
_0225C64A:
	adds r0, r6, #0
	adds r0, #0x96
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	movs r3, #0
	str r0, [sp, #8]
	movs r0, #0x13
	lsls r0, r0, #4
	ldrh r2, [r4, #2]
	ldr r0, [r5, r0]
	bl FUN_0200A3C8
	adds r1, r7, #0
	adds r1, #0xbc
	str r0, [r1]
	adds r0, r7, #0
	adds r0, #0xbc
	ldr r0, [r0]
	bl FUN_0200ADA4
	cmp r0, #0
	bne _0225C67E
	bl GF_AssertFail
_0225C67E:
	adds r0, r7, #0
	adds r0, #0xbc
	ldr r0, [r0]
	bl FUN_0200A740
	ldrb r2, [r4]
	movs r0, #0
	mvns r0, r0
	adds r2, #0x96
	str r2, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r6, #0
	str r0, [sp, #0x14]
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, #0x96
	str r0, [sp, #0x18]
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r3, r2, #0
	str r0, [sp, #0x1c]
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x54
	bl FUN_02009D48
	ldr r0, [r5, #4]
	ldr r2, [sp, #0x48]
	str r0, [sp, #0x78]
	add r0, sp, #0x54
	str r0, [sp, #0x7c]
	movs r0, #0
	str r0, [sp, #0x8c]
	movs r0, #2
	str r0, [sp, #0x90]
	ldr r0, [sp, #0x30]
	add r3, sp, #0x80
	str r0, [sp, #0x94]
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	movs r0, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0225C708
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C716
_0225C708:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C716:
	blx FUN_020F2104
	ldr r1, [sp, #0x80]
	adds r0, r1, r0
	str r0, [sp, #0x80]
	movs r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0225C73A
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225C748
_0225C73A:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225C748:
	blx FUN_020F2104
	ldr r1, [sp, #0x84]
	adds r0, r1, r0
	str r0, [sp, #0x84]
	add r0, sp, #0x78
	bl FUN_02024714
	str r0, [r7, #0x7c]
	ldrb r1, [r4, #1]
	bl FUN_02024AA8
_0225C760:
	ldr r0, [sp, #0x48]
	adds r6, r6, #1
	adds r0, #0xc
	adds r7, r7, #4
	str r0, [sp, #0x48]
	cmp r6, #0xc
	bge _0225C770
	b _0225C60E
_0225C770:
	ldr r0, [sp, #0x50]
	bl FUN_0200770C
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225C77C: .4byte 0x02269774
_0225C780: .4byte 0x02269704
_0225C784: .4byte 0x022696FC
_0225C788: .4byte 0x0226991C
	thumb_func_end ov49_0225C4CC

	thumb_func_start ov49_0225C78C
ov49_0225C78C: @ 0x0225C78C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #0
	adds r4, r5, #0
_0225C796:
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, #0
	beq _0225C7CC
	ldr r0, [r4, #0x7c]
	bl FUN_02024758
	movs r0, #0
	str r0, [r4, #0x7c]
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	bl FUN_0200AEB0
	movs r0, #0x13
	adds r1, r4, #0
	lsls r0, r0, #4
	adds r1, #0xbc
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl FUN_0200A75C
	adds r1, r4, #0
	adds r1, #0xbc
	movs r0, #0
	str r0, [r1]
_0225C7CC:
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #0xc
	blt _0225C796
	movs r4, #0
	adds r7, r4, #0
_0225C7D8:
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _0225C81C
	bl FUN_0200B0A8
	movs r0, #0x4d
	adds r1, r5, #0
	lsls r0, r0, #2
	adds r1, #0xac
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl FUN_0200A75C
	movs r0, #0x4e
	adds r1, r5, #0
	lsls r0, r0, #2
	adds r1, #0xec
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl FUN_0200A75C
	movs r0, #0x4f
	adds r1, r5, #0
	lsls r0, r0, #2
	adds r1, #0xfc
	ldr r0, [r6, r0]
	ldr r1, [r1]
	bl FUN_0200A75C
	adds r0, r5, #0
	adds r0, #0xac
	str r7, [r0]
_0225C81C:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0225C7D8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225C78C

	thumb_func_start ov49_0225C828
ov49_0225C828: @ 0x0225C828
	cmp r1, r2
	bne _0225C834
	ldr r1, _0225C83C @ =0x02269764
	lsls r0, r3, #3
	adds r0, r1, r0
	bx lr
_0225C834:
	ldr r1, _0225C840 @ =0x022699AC
	lsls r0, r0, #3
	adds r0, r1, r0
	bx lr
	.align 2, 0
_0225C83C: .4byte 0x02269764
_0225C840: .4byte 0x022699AC
	thumb_func_end ov49_0225C828

	thumb_func_start ov49_0225C844
ov49_0225C844: @ 0x0225C844
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r0, [r1]
	ldr r1, [sp, #4]
	str r2, [sp, #8]
	ldr r2, _0225C89C @ =0x0226970C
	adds r1, #0xc
	adds r7, r3, #0
	bl FUN_0201D4F8
	ldr r4, [sp, #4]
	ldr r5, [sp, #4]
	movs r6, #0
	adds r4, #0x2c
_0225C862:
	adds r1, r6, #0
	ldr r0, [sp, #8]
	adds r1, #0x38
	movs r2, #0
	adds r3, r4, #0
	str r7, [sp]
	bl FUN_02007C2C
	str r0, [r5, #0x20]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #3
	blt _0225C862
	ldr r0, _0225C8A0 @ =0x022696F4
	ldr r2, _0225C8A4 @ =ov49_0225CB50
	ldr r3, [sp, #4]
	movs r1, #1
	str r7, [sp]
	bl FUN_02026C44
	ldr r1, [sp, #4]
	str r0, [r1, #0x1c]
	ldr r0, [sp, #4]
	movs r1, #1
	strh r1, [r0, #6]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225C89C: .4byte 0x0226970C
_0225C8A0: .4byte 0x022696F4
_0225C8A4: .4byte ov49_0225CB50
	thumb_func_end ov49_0225C844

	thumb_func_start ov49_0225C8A8
ov49_0225C8A8: @ 0x0225C8A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x1c]
	bl FUN_02026CAC
	adds r0, r6, #0
	adds r0, #0xc
	bl FUN_0201D520
	movs r4, #0
	adds r5, r6, #0
_0225C8BE:
	ldr r0, [r5, #0x20]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0225C8BE
	movs r0, #0
	strb r0, [r6, #2]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225C8A8

	thumb_func_start ov49_0225C8D4
ov49_0225C8D4: @ 0x0225C8D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	ldrh r0, [r5, #6]
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r0, #0
	bne _0225C8F2
	ldr r0, [r5, #0x1c]
	bl FUN_02026CC4
	b _0225C8F6
_0225C8F2:
	movs r0, #1
	strb r0, [r5, #3]
_0225C8F6:
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _0225C912
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0225C912
	strb r2, [r5, #2]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	str r4, [sp]
	bl ov49_0225CAD4
_0225C912:
	ldrb r1, [r5, #3]
	ldrh r0, [r5, #4]
	cmp r1, r0
	beq _0225C968
	strh r1, [r5, #4]
	ldrb r0, [r5, #3]
	cmp r0, #2
	bne _0225C932
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	adds r3, r7, #0
	str r4, [sp]
	bl ov49_0225CAD4
	b _0225C954
_0225C932:
	ldrb r0, [r5, #2]
	cmp r0, #0
	str r4, [sp]
	bne _0225C948
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	adds r3, r7, #0
	bl ov49_0225CAD4
	b _0225C954
_0225C948:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	adds r3, r7, #0
	bl ov49_0225CAD4
_0225C954:
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _0225C968
	ldrb r0, [r5, #3]
	cmp r0, #2
	bne _0225C968
	movs r0, #1
	strb r0, [r5, #2]
	str r0, [sp, #4]
	strh r0, [r5]
_0225C968:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225C8D4

	thumb_func_start ov49_0225C970
ov49_0225C970: @ 0x0225C970
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r6, r1, #0
	ldr r4, [sp, #0x34]
	str r0, [sp, #8]
	ldr r7, [sp, #0x30]
	str r3, [sp, #0x14]
	str r4, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r2, [r6]
	adds r0, r7, #0
	movs r1, #0x37
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0
	strh r0, [r5, #8]
	ldr r0, [sp, #0x14]
	bl FUN_0222AAC8
	strh r0, [r5, #0xa]
	movs r0, #5
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldrh r1, [r5, #0xa]
	ldr r2, [r6]
	adds r0, r7, #0
	movs r3, #6
	bl FUN_02007B44
	movs r0, #5
	lsls r0, r0, #6
	str r0, [sp]
	str r4, [sp, #4]
	ldrh r2, [r5, #0xa]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, #0x1b
	movs r3, #6
	bl ov49_0225BB14
	ldr r0, [sp, #0x10]
	movs r1, #1
	movs r2, #0x3f
	bl ov49_0225B388
	str r0, [sp, #0x18]
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #0
	bl FUN_0201D978
	movs r0, #4
	str r0, [sp]
	movs r1, #0
	ldr r0, _0225CA2C @ =0x000F0E00
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	ldr r2, [sp, #0x18]
	str r1, [sp, #0xc]
	adds r0, #0xc
	adds r3, r1, #0
	bl FUN_020200FC
	ldrb r0, [r5, #2]
	cmp r0, #0
	str r4, [sp]
	bne _0225CA1A
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	adds r3, r7, #0
	bl ov49_0225CAD4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0225CA1A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	adds r3, r7, #0
	bl ov49_0225CAD4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225CA2C: .4byte 0x000F0E00
	thumb_func_end ov49_0225C970

	thumb_func_start ov49_0225CA30
ov49_0225CA30: @ 0x0225CA30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	str r3, [sp, #0x10]
	ldr r4, [sp, #0x28]
	cmp r7, #3
	blo _0225CA46
	bl GF_AssertFail
_0225CA46:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r6]
	movs r1, #0x37
	movs r3, #4
	bl FUN_02007B68
	movs r0, #1
	strh r0, [r5, #8]
	movs r0, #5
	strh r7, [r5, #0xa]
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldrh r1, [r5, #0xa]
	ldr r0, [sp, #0x10]
	ldr r2, [r6]
	adds r1, #0x5d
	movs r3, #6
	bl FUN_02007B44
	ldrb r0, [r5, #2]
	cmp r0, #0
	str r4, [sp]
	bne _0225CA96
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov49_0225CAD4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0225CA96:
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl ov49_0225CAD4
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225CA30

	thumb_func_start ov49_0225CAA8
ov49_0225CAA8: @ 0x0225CAA8
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201CAE0
	ldr r0, [r4]
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225CAA8

	thumb_func_start ov49_0225CAD4
ov49_0225CAD4: @ 0x0225CAD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0x20
	adds r4, r1, #0
	adds r6, r2, #0
	str r0, [sp]
	movs r1, #0x15
	str r1, [sp, #4]
	lsls r1, r6, #2
	adds r1, r5, r1
	ldr r1, [r1, #0x2c]
	adds r7, r3, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	movs r3, #3
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201C4EC
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	ldrh r0, [r5, #8]
	cmp r0, #1
	bne _0225CB34
	movs r0, #5
	lsls r0, r0, #6
	str r0, [sp]
	ldr r0, [sp, #0x30]
	ldr r2, _0225CB48 @ =0x022696EC
	str r0, [sp, #4]
	ldrh r3, [r5, #0xa]
	ldrb r2, [r2, r6]
	adds r0, r4, #0
	lsls r3, r3, #1
	adds r2, r2, r3
	adds r1, r7, #0
	adds r2, #0x60
	movs r3, #6
	bl ov49_0225BB14
_0225CB34:
	ldr r3, _0225CB4C @ =0x022696F0
	ldr r0, [r4]
	ldrsb r3, [r3, r6]
	movs r1, #6
	movs r2, #3
	bl FUN_0201F238
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0225CB48: .4byte 0x022696EC
_0225CB4C: .4byte 0x022696F0
	thumb_func_end ov49_0225CAD4

	thumb_func_start ov49_0225CB50
ov49_0225CB50: @ 0x0225CB50
	strb r1, [r2, #3]
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _0225CB5E
	movs r0, #2
	strb r0, [r2, #3]
	bx lr
_0225CB5E:
	cmp r0, #3
	bne _0225CB66
	movs r0, #1
	strb r0, [r2, #3]
_0225CB66:
	bx lr
	thumb_func_end ov49_0225CB50

	thumb_func_start ov49_0225CB68
ov49_0225CB68: @ 0x0225CB68
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225CB68

	thumb_func_start ov49_0225CB70
ov49_0225CB70: @ 0x0225CB70
	movs r1, #0xc3
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225CB70

	thumb_func_start ov49_0225CB78
ov49_0225CB78: @ 0x0225CB78
	push {r4, r5, lr}
	sub sp, #0xc
	movs r1, #0x14
	adds r5, r0, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x14
	movs r0, #0
_0225CB8C:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0225CB8C
	adds r0, r5, #0
	bl FUN_02023114
	str r0, [r4]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r1, _0225CBD0 @ =0x0029AEC1
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r2, _0225CBD4 @ =0x02269A6C
	ldr r3, _0225CBD8 @ =0x000005C1
	adds r0, #8
	bl FUN_02023254
	ldr r0, [r4]
	bl FUN_0202313C
	movs r0, #0x96
	movs r1, #0xe1
	ldr r2, [r4]
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0225CBD0: .4byte 0x0029AEC1
_0225CBD4: .4byte 0x02269A6C
_0225CBD8: .4byte 0x000005C1
	thumb_func_end ov49_0225CB78

	thumb_func_start ov49_0225CBDC
ov49_0225CBDC: @ 0x0225CBDC
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02023148
	ldr r0, [r4]
	bl FUN_02023120
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225CBDC

	thumb_func_start ov49_0225CBF4
ov49_0225CBF4: @ 0x0225CBF4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225CC18
	adds r1, r4, #0
	adds r1, #8
	bl ov49_02259154
	movs r0, #2
	ldr r1, [r4, #8]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [r4, #8]
	ldr r1, [r4, #0x10]
	lsls r0, r0, #2
	subs r0, r1, r0
	str r0, [r4, #0x10]
_0225CC18:
	bl FUN_02023154
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225CBF4

	thumb_func_start ov49_0225CC20
ov49_0225CC20: @ 0x0225CC20
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225CC20

	thumb_func_start ov49_0225CC28
ov49_0225CC28: @ 0x0225CC28
	push {r3, r4}
	movs r4, #2
	lsls r4, r4, #0xe
	adds r1, r1, r4
	str r1, [r0, #8]
	lsls r1, r4, #2
	str r2, [r0, #0xc]
	subs r1, r3, r1
	str r1, [r0, #0x10]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225CC28

	thumb_func_start ov49_0225CC40
ov49_0225CC40: @ 0x0225CC40
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov49_0225CC40

	thumb_func_start ov49_0225CC44
ov49_0225CC44: @ 0x0225CC44
	movs r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225CC44

	thumb_func_start ov49_0225CC4C
ov49_0225CC4C: @ 0x0225CC4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r1, _0225CCBC @ =0x000004A4
	adds r0, r2, #0
	str r2, [sp]
	bl FUN_0201AA8C
	ldr r2, _0225CCBC @ =0x000004A4
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0xb4
	muls r0, r5, r0
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl FUN_0201AA8C
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xe4
	adds r7, r6, #0
	muls r7, r0, r7
	ldr r0, [sp]
	adds r1, r7, #0
	bl FUN_0201AA8C
	movs r1, #0x12
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r2, [sp, #4]
	movs r1, #0
	blx FUN_020E5B44
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	adds r2, r7, #0
	blx FUN_020E5B44
	movs r0, #0x49
	lsls r0, r0, #2
	strb r5, [r4, r0]
	adds r0, r0, #1
	strb r6, [r4, r0]
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CCBC: .4byte 0x000004A4
	thumb_func_end ov49_0225CC4C

	thumb_func_start ov49_0225CCC0
ov49_0225CCC0: @ 0x0225CCC0
	push {r4, lr}
	movs r1, #0x4a
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0225CCD2
	bl ov49_0225CE88
_0225CCD2:
	movs r0, #0x47
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225CCC0

	thumb_func_start ov49_0225CCF0
ov49_0225CCF0: @ 0x0225CCF0
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x4b
	adds r5, r0, #0
	lsls r1, r1, #2
	adds r1, r5, r1
	bl ov49_0225D7B8
	movs r0, #0x49
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	movs r4, #0
	cmp r0, #0
	ble _0225CD2C
	movs r7, #0x71
	adds r6, r4, #0
	lsls r7, r7, #2
_0225CD10:
	movs r0, #0x47
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, r7
	adds r0, r0, r6
	bl ov49_0225DA70
	movs r0, #0x49
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	adds r4, r4, #1
	adds r6, #0xb4
	cmp r4, r0
	blt _0225CD10
_0225CD2C:
	ldr r0, _0225CD54 @ =0x00000125
	movs r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225CD52
	ldr r7, _0225CD54 @ =0x00000125
	adds r4, r6, #0
_0225CD3A:
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, r1, r4
	bl ov49_0225DD68
	ldrb r0, [r5, r7]
	adds r6, r6, #1
	adds r4, #0xe4
	cmp r6, r0
	blt _0225CD3A
_0225CD52:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225CD54: .4byte 0x00000125
	thumb_func_end ov49_0225CCF0

	thumb_func_start ov49_0225CD58
ov49_0225CD58: @ 0x0225CD58
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bne _0225CD62
	bl GF_AssertFail
_0225CD62:
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225CD70
	bl GF_AssertFail
_0225CD70:
	movs r0, #0x47
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225CD7E
	bl GF_AssertFail
_0225CD7E:
	movs r1, #0x4b
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov49_0225D804
	ldr r0, _0225CDE4 @ =0x00000125
	movs r4, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225CDB4
	movs r7, #0xa7
	adds r6, r4, #0
	lsls r7, r7, #2
_0225CD9A:
	movs r1, #0x12
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, r7
	adds r1, r1, r6
	bl ov49_0225DD0C
	ldr r0, _0225CDE4 @ =0x00000125
	adds r4, r4, #1
	ldrb r0, [r5, r0]
	adds r6, #0xe4
	cmp r4, r0
	blt _0225CD9A
_0225CDB4:
	movs r0, #0x49
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	movs r4, #0
	cmp r0, #0
	ble _0225CDE2
	movs r7, #0x71
	adds r6, r4, #0
	lsls r7, r7, #2
_0225CDC6:
	movs r0, #0x47
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, r7
	adds r0, r0, r6
	bl ov49_0225DAFC
	movs r0, #0x49
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	adds r4, r4, #1
	adds r6, #0xb4
	cmp r4, r0
	blt _0225CDC6
_0225CDE2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225CDE4: .4byte 0x00000125
	thumb_func_end ov49_0225CD58

	thumb_func_start ov49_0225CDE8
ov49_0225CDE8: @ 0x0225CDE8
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225CDE8

	thumb_func_start ov49_0225CDEC
ov49_0225CDEC: @ 0x0225CDEC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225CE80 @ =0x00000127
	adds r7, r3, #0
	strb r2, [r5, r0]
	subs r0, r0, #1
	strb r1, [r5, r0]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r7, #0
	ldr r4, [sp, #0x18]
	bl ov49_0225D4FC
	adds r6, r0, #0
	movs r0, #0xcb
	adds r1, r7, #0
	bl FUN_02007688
	adds r7, r0, #0
	ldr r0, _0225CE84 @ =0x00000494
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #4
	bl FUN_0201AC14
	ldr r0, _0225CE84 @ =0x00000494
	adds r1, r7, #0
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov49_0225D5FC
	movs r0, #0xa7
	ldr r2, _0225CE84 @ =0x00000494
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r7, #0
	adds r2, r5, r2
	adds r3, r6, #0
	str r4, [sp]
	bl ov49_0225DC2C
	movs r0, #0x71
	ldr r2, _0225CE84 @ =0x00000494
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r7, #0
	adds r2, r5, r2
	adds r3, r6, #0
	str r4, [sp]
	bl ov49_0225D854
	adds r0, r7, #0
	bl FUN_0200770C
	adds r0, r6, #0
	bl ov49_0225D520
	movs r1, #0x4b
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r1, r5, r1
	bl ov49_0225D6F0
	movs r0, #0x4a
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225CE80: .4byte 0x00000127
_0225CE84: .4byte 0x00000494
	thumb_func_end ov49_0225CDEC

	thumb_func_start ov49_0225CE88
ov49_0225CE88: @ 0x0225CE88
	push {r4, lr}
	movs r1, #0x4b
	adds r4, r0, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	bl ov49_0225D76C
	movs r0, #0x4b
	ldr r1, _0225CECC @ =0x00000494
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov49_0225D6AC
	movs r0, #0xa7
	ldr r1, _0225CECC @ =0x00000494
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov49_0225DCBC
	movs r0, #0x71
	ldr r1, _0225CECC @ =0x00000494
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov49_0225D9D0
	movs r0, #0x4a
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_0225CECC: .4byte 0x00000494
	thumb_func_end ov49_0225CE88

	thumb_func_start ov49_0225CED0
ov49_0225CED0: @ 0x0225CED0
	push {r3, lr}
	movs r2, #7
	adds r1, r0, #0
	lsls r2, r2, #6
	ldr r0, [r1, r2]
	cmp r0, #1
	bne _0225CEFA
	adds r0, r2, #0
	subs r0, #0xbc
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0225CEFA
	adds r0, r2, #0
	movs r3, #1
	subs r0, #0xbc
	str r3, [r1, r0]
	subs r2, #0x24
	adds r0, r1, #4
	adds r1, r1, r2
	bl FUN_020181D4
_0225CEFA:
	pop {r3, pc}
	thumb_func_end ov49_0225CED0

	thumb_func_start ov49_0225CEFC
ov49_0225CEFC: @ 0x0225CEFC
	push {r4, lr}
	movs r1, #7
	adds r4, r0, #0
	lsls r1, r1, #6
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0225CF26
	adds r0, r1, #0
	subs r0, #0xbc
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225CF26
	subs r1, #0x24
	adds r0, r4, #4
	adds r1, r4, r1
	bl FUN_020181E0
	movs r0, #0x41
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225CF26:
	pop {r4, pc}
	thumb_func_end ov49_0225CEFC

	thumb_func_start ov49_0225CF28
ov49_0225CF28: @ 0x0225CF28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r7, r0, #0
	adds r6, r2, #0
	str r3, [sp]
	cmp r5, #2
	ble _0225CF3C
	bl GF_AssertFail
_0225CF3C:
	cmp r6, #3
	ble _0225CF44
	bl GF_AssertFail
_0225CF44:
	adds r0, r7, #0
	bl ov49_0225D820
	movs r1, #0x71
	lsls r1, r1, #2
	adds r4, r0, #0
	adds r2, r7, r1
	lsls r1, r5, #4
	adds r0, r4, #4
	adds r1, r2, r1
	bl FUN_020181B0
	adds r0, r4, #4
	movs r1, #1
	bl FUN_020182A0
	ldr r1, [sp]
	adds r0, r4, #0
	bl ov49_0225CFA8
	add r1, sp, #4
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	adds r0, r4, #0
	bl ov49_0225CFEC
	strb r6, [r4, #1]
	adds r0, r4, #0
	strb r5, [r4, #2]
	movs r1, #1
	strb r1, [r4]
	str r1, [r4, #0x7c]
	adds r0, #0x84
	str r1, [r0]
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225CF28

	thumb_func_start ov49_0225CF94
ov49_0225CF94: @ 0x0225CF94
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r4, #4
	movs r1, #0
	bl FUN_020182A0
	movs r0, #0
	strb r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225CF94

	thumb_func_start ov49_0225CFA8
ov49_0225CFA8: @ 0x0225CFA8
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	adds r2, #0x9c
	stm r2!, {r0, r1}
	ldr r0, [r4]
	adds r1, r3, #0
	str r0, [r2]
	adds r1, #0x9c
	ldr r2, [r1]
	adds r1, r3, #0
	adds r1, #0xa8
	ldr r1, [r1]
	adds r0, r3, #4
	adds r1, r2, r1
	adds r2, r3, #0
	adds r2, #0xa0
	ldr r4, [r2]
	adds r2, r3, #0
	adds r2, #0xac
	ldr r2, [r2]
	adds r2, r4, r2
	adds r4, r3, #0
	adds r4, #0xa4
	adds r3, #0xb0
	ldr r4, [r4]
	ldr r3, [r3]
	adds r3, r4, r3
	bl FUN_020182A8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225CFA8

	thumb_func_start ov49_0225CFEC
ov49_0225CFEC: @ 0x0225CFEC
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	adds r2, #0xa8
	stm r2!, {r0, r1}
	ldr r0, [r4]
	adds r1, r3, #0
	str r0, [r2]
	adds r1, #0x9c
	ldr r2, [r1]
	adds r1, r3, #0
	adds r1, #0xa8
	ldr r1, [r1]
	adds r0, r3, #4
	adds r1, r2, r1
	adds r2, r3, #0
	adds r2, #0xa0
	ldr r4, [r2]
	adds r2, r3, #0
	adds r2, #0xac
	ldr r2, [r2]
	adds r2, r4, r2
	adds r4, r3, #0
	adds r4, #0xa4
	adds r3, #0xb0
	ldr r4, [r4]
	ldr r3, [r3]
	adds r3, r4, r3
	bl FUN_020182A8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225CFEC

	thumb_func_start ov49_0225D030
ov49_0225D030: @ 0x0225D030
	push {r3, lr}
	adds r3, r1, #0
	adds r0, r0, #4
	adds r2, r1, #4
	adds r3, #8
	bl FUN_020182B0
	pop {r3, pc}
	thumb_func_end ov49_0225D030

	thumb_func_start ov49_0225D040
ov49_0225D040: @ 0x0225D040
	ldr r3, _0225D048 @ =FUN_020182A0
	adds r0, r0, #4
	bx r3
	nop
_0225D048: .4byte FUN_020182A0
	thumb_func_end ov49_0225D040

	thumb_func_start ov49_0225D04C
ov49_0225D04C: @ 0x0225D04C
	adds r1, r0, #0
	adds r1, #0x80
	ldr r1, [r1]
	cmp r1, #0
	bne _0225D060
	movs r1, #1
	adds r0, #0x80
	str r1, [r0]
	adds r0, r1, #0
	bx lr
_0225D060:
	movs r0, #0
	bx lr
	thumb_func_end ov49_0225D04C

	thumb_func_start ov49_0225D064
ov49_0225D064: @ 0x0225D064
	adds r1, r0, #0
	adds r1, #0x88
	ldr r1, [r1]
	cmp r1, #0
	bne _0225D078
	movs r1, #1
	adds r0, #0x88
	str r1, [r0]
	adds r0, r1, #0
	bx lr
_0225D078:
	movs r0, #0
	bx lr
	thumb_func_end ov49_0225D064

	thumb_func_start ov49_0225D07C
ov49_0225D07C: @ 0x0225D07C
	ldr r3, _0225D084 @ =FUN_020182E0
	adds r0, r0, #4
	movs r2, #0
	bx r3
	.align 2, 0
_0225D084: .4byte FUN_020182E0
	thumb_func_end ov49_0225D07C

	thumb_func_start ov49_0225D088
ov49_0225D088: @ 0x0225D088
	adds r0, #0x80
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225D088

	thumb_func_start ov49_0225D090
ov49_0225D090: @ 0x0225D090
	adds r0, #0x88
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225D090

	thumb_func_start ov49_0225D098
ov49_0225D098: @ 0x0225D098
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl ov49_0225DBF8
	movs r1, #0xa7
	lsls r1, r1, #2
	adds r2, r7, r1
	ldr r1, [sp]
	str r0, [sp, #0xc]
	lsls r1, r1, #4
	adds r0, r0, #4
	adds r1, r2, r1
	bl FUN_020181B0
	ldr r5, [sp, #0xc]
	ldr r0, [sp]
	movs r1, #0xc
	muls r1, r0, r1
	movs r0, #0xa7
	lsls r0, r0, #2
	adds r0, r7, r0
	str r0, [sp, #0x10]
	ldr r0, [sp]
	movs r6, #0
	lsls r0, r0, #4
	adds r4, r7, r1
	adds r5, #0x7c
	str r0, [sp, #0x14]
_0225D0D8:
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _0225D0F2
	ldr r3, [sp, #0x10]
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r3, r1
	ldr r3, _0225D15C @ =0x00000494
	adds r3, r7, r3
	bl FUN_020180E8
_0225D0F2:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x14
	cmp r6, #3
	blt _0225D0D8
	ldr r0, [sp, #0xc]
	movs r1, #1
	adds r0, r0, #4
	bl FUN_020182A0
	ldr r0, [sp, #4]
	add r1, sp, #0x18
	lsls r0, r0, #4
	strh r0, [r1]
	ldr r0, [sp, #8]
	mov r3, sp
	lsls r0, r0, #4
	strh r0, [r1, #2]
	ldrh r2, [r1]
	subs r3, r3, #4
	ldr r0, [sp, #0xc]
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_0225D1C4
	ldr r0, [sp, #0xc]
	movs r2, #1
	ldr r1, [sp]
	strh r2, [r0]
	strh r1, [r0, #2]
	movs r1, #0x14
	adds r0, #0xcc
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	lsls r1, r2, #0xc
	adds r0, #0xdc
	str r1, [r0]
	ldr r0, [sp, #0xc]
	movs r1, #0
	adds r0, #0xe0
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	movs r1, #0x1f
	adds r0, #0xe1
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #0xe2
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225D15C: .4byte 0x00000494
	thumb_func_end ov49_0225D098

	thumb_func_start ov49_0225D160
ov49_0225D160: @ 0x0225D160
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp]
	adds r0, r1, #4
	movs r1, #0
	bl FUN_020182A0
	movs r0, #0xa7
	ldr r5, [sp]
	lsls r0, r0, #2
	movs r7, #0
	adds r0, r6, r0
	adds r4, r7, #0
	adds r5, #0x7c
	str r0, [sp, #4]
_0225D180:
	ldr r0, [sp]
	ldrh r1, [r0, #2]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r6, r0
	adds r2, r4, r0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r2, [r2, r0]
	cmp r2, #0
	beq _0225D1A6
	lsls r3, r1, #4
	ldr r1, [sp, #4]
	adds r0, r5, #0
	adds r1, r1, r3
	ldr r3, _0225D1BC @ =0x00000494
	adds r3, r6, r3
	bl FUN_020180E8
_0225D1A6:
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, #0x14
	cmp r7, #3
	blt _0225D180
	ldr r0, [sp]
	movs r1, #0
	strh r1, [r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D1BC: .4byte 0x00000494
	thumb_func_end ov49_0225D160

	thumb_func_start ov49_0225D1C0
ov49_0225D1C0: @ 0x0225D1C0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end ov49_0225D1C0

	thumb_func_start ov49_0225D1C4
ov49_0225D1C4: @ 0x0225D1C4
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	add r0, sp, #0x1c
	add r1, sp, #0
	bl ov49_02258800
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #4
	bl FUN_020182A8
	add sp, #0xc
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov49_0225D1C4

	thumb_func_start ov49_0225D1EC
ov49_0225D1EC: @ 0x0225D1EC
	push {r3, lr}
	sub sp, #0x10
	adds r0, r0, #4
	add r1, sp, #4
	add r2, sp, #8
	add r3, sp, #0xc
	bl FUN_020182B0
	add r0, sp, #4
	add r1, sp, #0
	bl ov49_02258814
	add r0, sp, #0
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	lsls r1, r1, #0x10
	orrs r0, r1
	add sp, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225D1EC

	thumb_func_start ov49_0225D214
ov49_0225D214: @ 0x0225D214
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #0
	str r4, [sp]
	bl ov49_0225D224
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov49_0225D214

	thumb_func_start ov49_0225D224
ov49_0225D224: @ 0x0225D224
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r2, #0
	str r0, [sp]
	adds r4, r1, #0
	adds r7, r3, #0
	cmp r5, #3
	blt _0225D238
	bl GF_AssertFail
_0225D238:
	cmp r7, #7
	blt _0225D240
	bl GF_AssertFail
_0225D240:
	ldrh r0, [r4, #2]
	cmp r0, #0x12
	blo _0225D24A
	bl GF_AssertFail
_0225D24A:
	ldrh r0, [r4, #2]
	movs r1, #0xc
	lsls r6, r5, #2
	muls r1, r0, r1
	ldr r0, [sp]
	adds r0, r0, r1
	adds r1, r0, r6
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225D324
	adds r0, r4, #0
	str r0, [sp, #4]
	adds r0, #0xb8
	str r0, [sp, #4]
	ldrb r0, [r0, r5]
	cmp r0, #0
	bne _0225D280
	adds r2, r4, #0
	movs r1, #0x14
	adds r2, #0x7c
	muls r1, r5, r1
	adds r0, r4, #4
	adds r1, r2, r1
	bl FUN_020181D4
_0225D280:
	ldr r0, [sp, #4]
	movs r1, #1
	strb r1, [r0, r5]
	adds r0, r4, r5
	adds r0, #0xbc
	strb r7, [r0]
	adds r0, r4, r6
	ldr r1, [sp, #0x20]
	adds r0, #0xd0
	str r1, [r0]
	adds r0, r4, #0
	str r0, [sp, #8]
	adds r0, #0xcd
	str r0, [sp, #8]
	movs r0, #0
	ldr r1, [sp, #8]
	cmp r7, #6
	strb r0, [r1, r5]
	bhi _0225D310
	adds r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225D2B2: @ jump table
	.2byte _0225D2C0 - _0225D2B2 - 2 @ case 0
	.2byte _0225D2C0 - _0225D2B2 - 2 @ case 1
	.2byte _0225D2C0 - _0225D2B2 - 2 @ case 2
	.2byte _0225D2C8 - _0225D2B2 - 2 @ case 3
	.2byte _0225D2C8 - _0225D2B2 - 2 @ case 4
	.2byte _0225D2DE - _0225D2B2 - 2 @ case 5
	.2byte _0225D2F8 - _0225D2B2 - 2 @ case 6
_0225D2C0:
	adds r1, r4, r6
	adds r1, #0xc0
	str r0, [r1]
	b _0225D310
_0225D2C8:
	adds r1, r4, #0
	movs r0, #0x14
	adds r1, #0x7c
	muls r0, r5, r0
	adds r0, r1, r0
	bl FUN_020181A4
	adds r1, r4, r6
	adds r1, #0xc0
	str r0, [r1]
	b _0225D310
_0225D2DE:
	adds r1, r4, r6
	adds r1, #0xc0
	str r0, [r1]
	bl FUN_0201FDB8
	adds r1, r4, #0
	adds r1, #0xcc
	ldrb r1, [r1]
	blx FUN_020F2BA4
	ldr r0, [sp, #8]
	strb r1, [r0, r5]
	b _0225D310
_0225D2F8:
	adds r1, r4, r6
	adds r1, #0xc0
	str r0, [r1]
	bl FUN_0201FDB8
	adds r1, r4, #0
	adds r1, #0xcc
	ldrb r1, [r1]
	blx FUN_020F2BA4
	ldr r0, [sp, #8]
	strb r1, [r0, r5]
_0225D310:
	adds r1, r4, #0
	movs r0, #0x14
	adds r1, #0x7c
	muls r0, r5, r0
	adds r0, r1, r0
	adds r1, r4, r6
	adds r1, #0xc0
	ldr r1, [r1]
	bl FUN_02018198
_0225D324:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D224

	thumb_func_start ov49_0225D328
ov49_0225D328: @ 0x0225D328
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r4, #3
	blt _0225D338
	bl GF_AssertFail
_0225D338:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D342
	bl GF_AssertFail
_0225D342:
	ldrh r1, [r5, #2]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r6, r0
	lsls r0, r4, #2
	adds r1, r1, r0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225D390
	adds r6, r5, #0
	adds r6, #0xb8
	ldrb r0, [r6, r4]
	cmp r0, #1
	bne _0225D390
	adds r2, r5, #0
	movs r1, #0x14
	adds r2, #0x7c
	muls r1, r4, r1
	adds r0, r5, #4
	adds r1, r2, r1
	bl FUN_020181E0
	lsls r2, r4, #2
	movs r0, #0
	adds r1, r5, r2
	strb r0, [r6, r4]
	adds r1, #0xc0
	str r0, [r1]
	adds r1, r5, r4
	adds r1, #0xbc
	strb r0, [r1]
	adds r1, r5, r4
	adds r1, #0xcd
	strb r0, [r1]
	adds r1, r5, r2
	adds r1, #0xd0
	str r0, [r1]
_0225D390:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225D328

	thumb_func_start ov49_0225D394
ov49_0225D394: @ 0x0225D394
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r4, #0
_0225D39C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225D450
	cmp r0, #1
	bne _0225D3B2
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov49_0225D328
_0225D3B2:
	adds r4, r4, #1
	cmp r4, #3
	blt _0225D39C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225D394

	thumb_func_start ov49_0225D3BC
ov49_0225D3BC: @ 0x0225D3BC
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r4, #3
	blt _0225D3CC
	bl GF_AssertFail
_0225D3CC:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D3D6
	bl GF_AssertFail
_0225D3D6:
	ldrh r1, [r5, #2]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r6, r0
	lsls r0, r4, #2
	adds r1, r1, r0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0225D3F4
	adds r0, r5, r4
	adds r0, #0xb8
	ldrb r0, [r0]
	pop {r4, r5, r6, pc}
_0225D3F4:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225D3BC

	thumb_func_start ov49_0225D3F8
ov49_0225D3F8: @ 0x0225D3F8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r3, #0
	cmp r4, #3
	blt _0225D40A
	bl GF_AssertFail
_0225D40A:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D414
	bl GF_AssertFail
_0225D414:
	ldrh r1, [r5, #2]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r6, r0
	lsls r0, r4, #2
	adds r1, r1, r0
	movs r0, #0xef
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0225D42E
	bl GF_AssertFail
_0225D42E:
	adds r0, r5, r4
	adds r0, #0xbc
	ldrb r0, [r0]
	cmp r0, #2
	bne _0225D44E
	adds r2, r5, #0
	movs r0, #0x14
	adds r2, #0xc0
	lsls r1, r4, #2
	str r7, [r2, r1]
	adds r5, #0x7c
	muls r0, r4, r0
	ldr r1, [r2, r1]
	adds r0, r5, r0
	bl FUN_02018198
_0225D44E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D3F8

	thumb_func_start ov49_0225D450
ov49_0225D450: @ 0x0225D450
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #3
	blt _0225D45E
	bl GF_AssertFail
_0225D45E:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D468
	bl GF_AssertFail
_0225D468:
	adds r0, r5, r4
	adds r0, #0xb8
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D450

	thumb_func_start ov49_0225D470
ov49_0225D470: @ 0x0225D470
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #3
	blt _0225D47E
	bl GF_AssertFail
_0225D47E:
	ldrh r0, [r5, #2]
	cmp r0, #0x12
	blo _0225D488
	bl GF_AssertFail
_0225D488:
	lsls r0, r4, #2
	adds r0, r5, r0
	adds r0, #0xc0
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225D470

	thumb_func_start ov49_0225D494
ov49_0225D494: @ 0x0225D494
	ldr r3, _0225D49C @ =FUN_020182A0
	adds r0, r0, #4
	bx r3
	nop
_0225D49C: .4byte FUN_020182A0
	thumb_func_end ov49_0225D494

	thumb_func_start ov49_0225D4A0
ov49_0225D4A0: @ 0x0225D4A0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrh r0, [r4, #2]
	adds r6, r2, #0
	cmp r0, #0x12
	blo _0225D4B2
	bl GF_AssertFail
_0225D4B2:
	ldrh r0, [r4, #2]
	lsls r0, r0, #4
	adds r1, r5, r0
	movs r0, #0xa9
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r6, #0
	blx FUN_020C3598
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225D4A0

	thumb_func_start ov49_0225D4C8
ov49_0225D4C8: @ 0x0225D4C8
	adds r0, #0xdc
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225D4C8

	thumb_func_start ov49_0225D4D0
ov49_0225D4D0: @ 0x0225D4D0
	push {r3, r4}
	adds r3, r0, #0
	movs r4, #1
	adds r3, #0xe0
	strb r4, [r3]
	adds r3, r0, #0
	adds r3, #0xe1
	strb r1, [r3]
	adds r0, #0xe2
	strb r2, [r0]
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_0225D4D0

	thumb_func_start ov49_0225D4E8
ov49_0225D4E8: @ 0x0225D4E8
	movs r1, #0
	adds r0, #0xe0
	strb r1, [r0]
	bx lr
	thumb_func_end ov49_0225D4E8

	thumb_func_start ov49_0225D4F0
ov49_0225D4F0: @ 0x0225D4F0
	push {r3, lr}
	adds r0, r0, #4
	bl FUN_020182C4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_0225D4F0

	thumb_func_start ov49_0225D4FC
ov49_0225D4FC: @ 0x0225D4FC
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	lsls r2, r1, #2
	adds r1, r1, r2
	adds r4, r0, r1
	cmp r4, #0x19
	blo _0225D50E
	bl GF_AssertFail
_0225D50E:
	movs r0, #1
	str r0, [sp]
	movs r0, #0xca
	adds r1, r4, #1
	movs r2, #0
	adds r3, r5, #0
	bl FUN_02007A44
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D4FC

	thumb_func_start ov49_0225D520
ov49_0225D520: @ 0x0225D520
	ldr r3, _0225D524 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_0225D524: .4byte FUN_0201AB0C
	thumb_func_end ov49_0225D520

	thumb_func_start ov49_0225D528
ov49_0225D528: @ 0x0225D528
	push {r4, lr}
	adds r4, r0, #0
	bl ov49_02258830
	ldr r0, [r4]
	blx FUN_020C3B40
	str r0, [r4, #4]
	cmp r0, #0
	beq _0225D55C
	adds r2, r0, #0
	adds r2, #8
	beq _0225D550
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0225D550
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _0225D552
_0225D550:
	movs r1, #0
_0225D552:
	cmp r1, #0
	beq _0225D55C
	ldr r1, [r1]
	adds r0, r0, r1
	b _0225D55E
_0225D55C:
	movs r0, #0
_0225D55E:
	str r0, [r4, #8]
	ldr r0, [r4]
	blx FUN_020C3B50
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl FUN_0201F64C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225D528

	thumb_func_start ov49_0225D574
ov49_0225D574: @ 0x0225D574
	ldr r3, _0225D578 @ =FUN_02018068
	bx r3
	.align 2, 0
_0225D578: .4byte FUN_02018068
	thumb_func_end ov49_0225D574

	thumb_func_start ov49_0225D57C
ov49_0225D57C: @ 0x0225D57C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	bl FUN_020181A4
	adds r1, r0, #0
	ldr r0, [r5]
	adds r0, r0, r4
	cmp r0, r1
	bge _0225D596
	str r0, [r5]
	pop {r3, r4, r5, pc}
_0225D596:
	blx FUN_020F2998
	str r1, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225D57C

	thumb_func_start ov49_0225D5A0
ov49_0225D5A0: @ 0x0225D5A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	bl FUN_020181A4
	ldr r1, [r5]
	adds r1, r1, r4
	cmp r1, r0
	bge _0225D5BA
	str r1, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225D5BA:
	movs r1, #2
	lsls r1, r1, #0xa
	subs r0, r0, r1
	str r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225D5A0

	thumb_func_start ov49_0225D5C8
ov49_0225D5C8: @ 0x0225D5C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	bl FUN_020181A4
	ldr r1, [r5]
	subs r1, r1, r4
	bmi _0225D5DE
	str r1, [r5]
	pop {r3, r4, r5, pc}
_0225D5DE:
	adds r0, r0, r1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D5C8

	thumb_func_start ov49_0225D5E4
ov49_0225D5E4: @ 0x0225D5E4
	ldr r1, [r0]
	subs r1, r1, r2
	cmp r1, #0
	ble _0225D5F2
	str r1, [r0]
	movs r0, #0
	bx lr
_0225D5F2:
	movs r1, #0
	str r1, [r0]
	movs r0, #1
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225D5E4

	thumb_func_start ov49_0225D5FC
ov49_0225D5FC: @ 0x0225D5FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	movs r7, #6
	ldr r5, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r0, [sp, #0x30]
	movs r6, #0
	adds r4, r2, #0
	lsls r7, r7, #6
_0225D616:
	ldr r1, [sp, #0xc]
	ldr r2, [r4, r7]
	ldr r3, [sp, #0x14]
	adds r0, r5, #0
	bl ov49_0225D528
	ldr r0, [r5]
	bl FUN_0222D740
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x10
	cmp r6, #2
	blt _0225D616
	ldr r6, [sp, #8]
	ldr r4, [sp, #0x10]
	adds r0, r6, #0
	adds r5, r6, #0
	str r0, [sp, #0x18]
	adds r0, #0x10
	movs r7, #0
	adds r5, #0x20
	str r0, [sp, #0x18]
_0225D644:
	movs r0, #6
	ldr r1, [sp, #0x10]
	lsls r0, r0, #6
	ldr r1, [r1, r0]
	adds r0, #0xc
	ldr r0, [r4, r0]
	cmp r1, r0
	bne _0225D65E
	adds r1, r6, #0
	adds r1, #0x84
	movs r0, #0
	str r0, [r1]
	b _0225D69C
_0225D65E:
	adds r1, r6, #0
	adds r1, #0x84
	movs r0, #1
	str r0, [r1]
	cmp r7, #3
	beq _0225D684
	ldr r0, [sp, #0x14]
	movs r3, #0x63
	str r0, [sp]
	ldr r0, [sp, #0x30]
	lsls r3, r3, #2
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [r4, r3]
	adds r0, r5, #0
	bl FUN_020180BC
	b _0225D69C
_0225D684:
	ldr r0, [sp, #0x14]
	movs r3, #0x63
	str r0, [sp]
	ldr r0, [sp, #0x30]
	lsls r3, r3, #2
	str r0, [sp, #4]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0xc]
	ldr r3, [r4, r3]
	adds r0, r5, #0
	bl FUN_020180BC
_0225D69C:
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, #4
	adds r5, #0x14
	cmp r7, #5
	blt _0225D644
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D5FC

	thumb_func_start ov49_0225D6AC
ov49_0225D6AC: @ 0x0225D6AC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	str r1, [sp]
	movs r7, #0
	adds r4, r6, #0
	adds r5, #0x20
_0225D6BA:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D6D4
	ldr r1, [sp]
	adds r0, r5, #0
	bl FUN_020180F8
	adds r1, r4, #0
	adds r1, #0x84
	movs r0, #0
	str r0, [r1]
_0225D6D4:
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, #0x14
	cmp r7, #5
	blt _0225D6BA
	movs r4, #0
_0225D6E0:
	adds r0, r6, #0
	bl ov49_0225D574
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #2
	blt _0225D6E0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D6AC

	thumb_func_start ov49_0225D6F0
ov49_0225D6F0: @ 0x0225D6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #1
	adds r7, r1, #0
	str r0, [r6]
	movs r0, #0
	str r0, [sp]
	adds r4, r7, #0
	adds r5, r6, #4
_0225D704:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_020181B0
	adds r0, r5, #0
	movs r1, #1
	bl FUN_020182A0
	ldr r0, [sp]
	adds r4, #0x10
	adds r0, r0, #1
	adds r5, #0x78
	str r0, [sp]
	cmp r0, #2
	blt _0225D704
	adds r0, r6, #0
	str r0, [sp, #8]
	adds r0, #0x7c
	adds r4, r7, #0
	str r0, [sp, #8]
	adds r0, r6, #4
	movs r5, #0
	adds r4, #0x20
	str r0, [sp, #4]
_0225D734:
	adds r0, r7, #0
	adds r0, #0x84
	ldr r0, [r0]
	cmp r0, #1
	bne _0225D75C
	adds r1, r6, #0
	adds r1, #0xf4
	movs r0, #1
	str r0, [r1]
	cmp r5, #3
	beq _0225D754
	ldr r0, [sp, #4]
	adds r1, r4, #0
	bl FUN_020181D4
	b _0225D75C
_0225D754:
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl FUN_020181D4
_0225D75C:
	adds r5, r5, #1
	adds r7, r7, #4
	adds r6, r6, #4
	adds r4, #0x14
	cmp r5, #4
	blt _0225D734
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D6F0

	thumb_func_start ov49_0225D76C
ov49_0225D76C: @ 0x0225D76C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	str r0, [sp]
	adds r0, #0x7c
	movs r6, #0
	adds r4, r7, #0
	adds r5, #0x20
	str r0, [sp]
_0225D77E:
	adds r0, r4, #0
	adds r0, #0xf4
	ldr r0, [r0]
	cmp r0, #1
	bne _0225D7A6
	adds r1, r4, #0
	adds r1, #0xf4
	movs r0, #0
	str r0, [r1]
	cmp r6, #3
	beq _0225D79E
	adds r0, r7, #4
	adds r1, r5, #0
	bl FUN_020181E0
	b _0225D7A6
_0225D79E:
	ldr r0, [sp]
	adds r1, r5, #0
	bl FUN_020181E0
_0225D7A6:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x14
	cmp r6, #4
	blt _0225D77E
	movs r0, #0
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225D76C

	thumb_func_start ov49_0225D7B8
ov49_0225D7B8: @ 0x0225D7B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	adds r4, r1, #0
	movs r0, #0x42
	adds r4, #0x20
	lsls r0, r0, #2
	adds r6, r5, r0
	adds r7, r4, #0
_0225D7CC:
	adds r0, r5, #0
	adds r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	beq _0225D7EE
	movs r2, #1
	adds r0, r6, #0
	adds r1, r4, #0
	lsls r2, r2, #0xc
	bl ov49_0225D57C
	movs r1, #0x42
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r7, #0
	bl FUN_02018198
_0225D7EE:
	ldr r0, [sp]
	adds r5, r5, #4
	adds r0, r0, #1
	adds r4, #0x14
	adds r6, r6, #4
	adds r7, #0x14
	str r0, [sp]
	cmp r0, #5
	blt _0225D7CC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225D7B8

	thumb_func_start ov49_0225D804
ov49_0225D804: @ 0x0225D804
	push {r3, r4, r5, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _0225D81E
	movs r4, #0
	adds r5, r0, #4
_0225D810:
	adds r0, r5, #0
	bl FUN_020181EC
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #2
	blt _0225D810
_0225D81E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225D804

	thumb_func_start ov49_0225D820
ov49_0225D820: @ 0x0225D820
	push {r4, lr}
	movs r1, #0x49
	lsls r1, r1, #2
	ldrb r4, [r0, r1]
	movs r2, #0
	cmp r4, #0
	ble _0225D84A
	subs r1, #8
	ldr r3, [r0, r1]
	adds r1, r3, #0
_0225D834:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0225D842
	movs r0, #0xb4
	muls r0, r2, r0
	adds r0, r3, r0
	pop {r4, pc}
_0225D842:
	adds r2, r2, #1
	adds r1, #0xb4
	cmp r2, r4
	blt _0225D834
_0225D84A:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225D820

	thumb_func_start ov49_0225D854
ov49_0225D854: @ 0x0225D854
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #8]
	ldr r0, [sp, #0x58]
	movs r7, #0x4a
	str r0, [sp, #0x58]
	movs r0, #0
	str r0, [sp, #0x40]
	adds r0, r3, #0
	str r0, [sp, #0x24]
	ldr r0, [sp, #8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x20]
	adds r0, #0x20
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r0, [sp, #0x20]
	lsls r7, r7, #2
_0225D878:
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x20]
	movs r6, #0
_0225D87E:
	ldr r1, [sp, #0xc]
	ldr r2, [r4, r7]
	ldr r3, [sp, #0x58]
	adds r0, r5, #0
	bl ov49_02258830
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #3
	blt _0225D87E
	ldr r0, [sp, #0x24]
	adds r0, #0xc
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, #0xc
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x40]
	adds r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, #2
	blt _0225D878
	ldr r4, [sp, #8]
	ldr r6, [sp, #0x14]
	movs r7, #0
	adds r5, r4, #0
_0225D8B2:
	movs r0, #0
	movs r1, #0x12
	str r0, [sp]
	lsls r1, r1, #4
	ldr r0, [sp, #0xc]
	ldr r1, [r6, r1]
	ldr r3, [sp, #0x58]
	movs r2, #0
	bl FUN_02007C98
	str r0, [r4]
	blx FUN_020C3B40
	str r0, [r4, #4]
	cmp r0, #0
	beq _0225D8F2
	adds r1, r0, #0
	adds r1, #8
	beq _0225D8E6
	ldrb r2, [r0, #9]
	cmp r2, #0
	bls _0225D8E6
	ldrh r2, [r0, #0xe]
	adds r1, r1, r2
	adds r1, r1, #4
	b _0225D8E8
_0225D8E6:
	movs r1, #0
_0225D8E8:
	cmp r1, #0
	beq _0225D8F2
	ldr r1, [r1]
	adds r0, r0, r1
	b _0225D8F4
_0225D8F2:
	movs r0, #0
_0225D8F4:
	str r0, [r4, #8]
	ldr r0, [r5, #0x20]
	blx FUN_020C3B50
	str r0, [r4, #0xc]
	adds r7, r7, #1
	adds r6, r6, #4
	adds r4, #0x10
	adds r5, #0xc
	cmp r7, #2
	blt _0225D8B2
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	ldr r7, [sp, #0x14]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #8]
	str r0, [sp, #0x38]
	adds r0, #0x38
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x34]
	ldr r0, [sp, #8]
	str r0, [sp, #0x30]
_0225D924:
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x3c]
	ldr r6, [sp, #0x34]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x38]
	ldr r5, [sp, #0x30]
	str r0, [sp, #0x28]
_0225D934:
	movs r0, #5
	ldr r1, [sp, #0x2c]
	lsls r0, r0, #6
	ldr r3, [r1, r0]
	ldr r1, [sp, #0x14]
	subs r0, #0x20
	ldr r0, [r1, r0]
	cmp r0, r3
	beq _0225D988
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	bl FUN_020180BC
	ldr r0, [sp, #0x18]
	cmp r0, #1
	blt _0225D988
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	movs r4, #0
	cmp r0, #0
	bls _0225D988
_0225D96A:
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r4, r0
	beq _0225D97C
	ldr r0, [r5, #0x40]
	adds r1, r4, #0
	blx FUN_020BE0E4
_0225D97C:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	adds r4, r4, #1
	cmp r4, r0
	blo _0225D96A
_0225D988:
	ldr r0, [sp, #0x2c]
	adds r6, r6, #4
	adds r0, r0, #4
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	adds r5, #0x14
	adds r0, #0x14
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _0225D934
	ldr r0, [sp, #0x3c]
	adds r7, r7, #4
	adds r0, #0x10
	str r0, [sp, #0x3c]
	ldr r0, [sp, #8]
	adds r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	adds r0, #0x50
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x34]
	adds r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x30]
	adds r0, #0x50
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #2
	blt _0225D924
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225D854

	thumb_func_start ov49_0225D9D0
ov49_0225D9D0: @ 0x0225D9D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	ldr r7, [sp]
	movs r0, #0
	adds r6, r1, #0
	str r0, [sp, #8]
	adds r7, #0x38
_0225D9E0:
	movs r4, #0
	adds r5, r7, #0
_0225D9E4:
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_020180F8
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, #4
	blt _0225D9E4
	ldr r0, [sp, #8]
	adds r7, #0x50
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #2
	blt _0225D9E0
	ldr r4, [sp]
	movs r5, #0
_0225DA04:
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #2
	blt _0225DA04
	movs r0, #0
	ldr r7, _0225DA68 @ =0x02110928
	str r0, [sp, #4]
_0225DA18:
	ldr r4, [sp]
	movs r5, #0
_0225DA1C:
	ldr r0, [r4, #0x20]
	blx FUN_020C3B50
	add r1, sp, #0x10
	add r2, sp, #0xc
	adds r6, r0, #0
	blx FUN_020BE4D0
	ldr r0, [sp, #0x10]
	ldr r1, [r7]
	blx r1
	ldr r0, [sp, #0xc]
	ldr r1, [r7]
	blx r1
	adds r0, r6, #0
	blx FUN_020BE588
	ldr r1, _0225DA6C @ =0x02110930
	ldr r1, [r1]
	blx r1
	ldr r0, [r4, #0x20]
	bl FUN_0201AB0C
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #3
	blt _0225DA1C
	ldr r0, [sp]
	adds r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #2
	blt _0225DA18
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225DA68: .4byte 0x02110928
_0225DA6C: .4byte 0x02110930
	thumb_func_end ov49_0225D9D0

	thumb_func_start ov49_0225DA70
ov49_0225DA70: @ 0x0225DA70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r7, #0
	str r0, [sp]
	adds r4, r0, #0
	adds r0, r1, #0
	str r1, [sp, #4]
	adds r0, #0x38
	adds r6, r7, #0
	adds r5, #0x8c
	str r0, [sp, #4]
_0225DA88:
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _0225DAEC
	cmp r7, #3
	bhi _0225DAE8
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225DA9E: @ jump table
	.2byte _0225DAA6 - _0225DA9E - 2 @ case 0
	.2byte _0225DAC0 - _0225DA9E - 2 @ case 1
	.2byte _0225DAA6 - _0225DA9E - 2 @ case 2
	.2byte _0225DAC0 - _0225DA9E - 2 @ case 3
_0225DAA6:
	ldr r1, [sp]
	movs r2, #0x50
	ldrb r1, [r1, #2]
	adds r0, r5, #0
	muls r2, r1, r2
	ldr r1, [sp, #4]
	adds r1, r1, r2
	movs r2, #1
	adds r1, r1, r6
	lsls r2, r2, #0xc
	bl ov49_0225D57C
	b _0225DAEC
_0225DAC0:
	ldr r1, [sp]
	movs r2, #0x50
	ldrb r1, [r1, #2]
	adds r0, r5, #0
	muls r2, r1, r2
	ldr r1, [sp, #4]
	adds r1, r1, r2
	movs r2, #1
	adds r1, r1, r6
	lsls r2, r2, #0xc
	bl ov49_0225D5A0
	cmp r0, #1
	bne _0225DAEC
	movs r0, #0
	adds r1, r4, #0
	str r0, [r4, #0x7c]
	adds r1, #0x8c
	str r0, [r1]
	b _0225DAEC
_0225DAE8:
	bl GF_AssertFail
_0225DAEC:
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, #0x14
	adds r5, r5, #4
	cmp r7, #4
	blt _0225DA88
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225DA70

	thumb_func_start ov49_0225DAFC
ov49_0225DAFC: @ 0x0225DAFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrb r0, [r5]
	str r1, [sp]
	cmp r0, #0
	beq _0225DBF2
	ldrb r0, [r5, #2]
	lsls r1, r0, #4
	ldr r0, [sp]
	adds r0, r0, r1
	adds r1, r5, #4
	bl ov49_022588A0
	cmp r0, #0
	beq _0225DBF2
	ldrb r0, [r5, #1]
	cmp r0, #3
	blo _0225DB26
	bl GF_AssertFail
_0225DB26:
	ldrb r0, [r5, #2]
	cmp r0, #2
	blo _0225DB30
	bl GF_AssertFail
_0225DB30:
	ldrb r1, [r5, #2]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp]
	adds r1, r0, r2
	ldrb r0, [r5, #1]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r0, [r0, #0x20]
	blx FUN_020C3B50
	ldrb r1, [r5, #2]
	lsls r2, r1, #4
	ldr r1, [sp]
	adds r1, r1, r2
	str r0, [r1, #0xc]
	ldrb r0, [r5, #2]
	lsls r1, r0, #4
	ldr r0, [sp]
	adds r1, r0, r1
	ldr r0, [r1, #4]
	ldr r1, [r1, #0xc]
	blx FUN_020BED00
	cmp r0, #0
	bne _0225DB6A
	bl GF_AssertFail
_0225DB6A:
	ldr r7, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r6, r5, #0
	adds r4, r0, #0
	adds r7, #0x38
_0225DB76:
	ldr r0, [r6, #0x7c]
	cmp r0, #0
	beq _0225DBA0
	ldrb r2, [r5, #2]
	movs r1, #0x50
	adds r0, r5, #4
	muls r1, r2, r1
	adds r1, r7, r1
	adds r1, r1, r4
	bl FUN_020181D4
	ldrb r1, [r5, #2]
	movs r0, #0x50
	muls r0, r1, r0
	adds r1, r6, #0
	adds r1, #0x8c
	adds r0, r7, r0
	ldr r1, [r1]
	adds r0, r0, r4
	bl FUN_02018198
_0225DBA0:
	ldr r0, [sp, #4]
	adds r6, r6, #4
	adds r0, r0, #1
	adds r4, #0x14
	str r0, [sp, #4]
	cmp r0, #4
	blt _0225DB76
	adds r0, r5, #4
	bl FUN_020181EC
	ldr r0, [sp]
	movs r7, #0
	str r0, [sp, #8]
	adds r0, #0x38
	adds r6, r5, #0
	adds r4, r7, #0
	str r0, [sp, #8]
_0225DBC2:
	ldr r0, [r6, #0x7c]
	cmp r0, #0
	beq _0225DBDA
	ldrb r1, [r5, #2]
	movs r2, #0x50
	adds r0, r5, #4
	muls r2, r1, r2
	ldr r1, [sp, #8]
	adds r1, r1, r2
	adds r1, r1, r4
	bl FUN_020181E0
_0225DBDA:
	adds r7, r7, #1
	adds r6, r6, #4
	adds r4, #0x14
	cmp r7, #4
	blt _0225DBC2
	ldrb r0, [r5, #2]
	lsls r1, r0, #4
	ldr r0, [sp]
	adds r0, r0, r1
	ldr r0, [r0, #4]
	blx FUN_020BEDB0
_0225DBF2:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225DAFC

	thumb_func_start ov49_0225DBF8
ov49_0225DBF8: @ 0x0225DBF8
	push {r4, lr}
	ldr r3, _0225DC28 @ =0x00000125
	movs r1, #0
	ldrb r2, [r0, r3]
	cmp r2, #0
	ble _0225DC20
	subs r3, r3, #5
	ldr r4, [r0, r3]
	adds r3, r4, #0
_0225DC0A:
	ldrh r0, [r3]
	cmp r0, #0
	bne _0225DC18
	movs r0, #0xe4
	muls r0, r1, r0
	adds r0, r4, r0
	pop {r4, pc}
_0225DC18:
	adds r1, r1, #1
	adds r3, #0xe4
	cmp r1, r2
	blt _0225DC0A
_0225DC20:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0225DC28: .4byte 0x00000125
	thumb_func_end ov49_0225DBF8

	thumb_func_start ov49_0225DC2C
ov49_0225DC2C: @ 0x0225DC2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	adds r7, r3, #0
	str r0, [sp, #0x30]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r7, [sp, #0x10]
	str r0, [sp, #0xc]
_0225DC44:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [r7]
	ldr r3, [sp, #0x30]
	bl ov49_0225D528
	ldr r0, [sp, #0x14]
	cmp r0, #0xb
	beq _0225DC62
	cmp r0, #0xc
	beq _0225DC62
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl FUN_0222D740
_0225DC62:
	ldr r4, [sp, #0x10]
	ldr r5, [sp, #0xc]
	movs r6, #0
_0225DC68:
	ldr r1, [r4, #0x48]
	ldr r0, [r7]
	cmp r0, r1
	beq _0225DC86
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0x30]
	movs r2, #0
	bl FUN_02007C98
	movs r1, #0x12
	lsls r1, r1, #4
	str r0, [r5, r1]
	b _0225DC8E
_0225DC86:
	movs r0, #0x12
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
_0225DC8E:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #3
	blt _0225DC68
	ldr r0, [sp, #4]
	adds r7, r7, #4
	adds r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0x12
	blt _0225DC44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225DC2C

	thumb_func_start ov49_0225DCBC
ov49_0225DCBC: @ 0x0225DCBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	movs r7, #0x12
	str r0, [sp, #4]
	movs r6, #0
	lsls r7, r7, #4
_0225DCD0:
	ldr r5, [sp]
	movs r4, #0
_0225DCD4:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0225DCE4
	bl FUN_0201AB0C
	movs r0, #0x12
	lsls r0, r0, #4
	str r6, [r5, r0]
_0225DCE4:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _0225DCD4
	ldr r0, [sp, #4]
	bl ov49_0225D574
	ldr r0, [sp]
	adds r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #0x12
	blt _0225DCD0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225DCBC

	thumb_func_start ov49_0225DD0C
ov49_0225DD0C: @ 0x0225DD0C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225DD64
	ldrh r0, [r4, #2]
	adds r1, r4, #4
	lsls r0, r0, #4
	adds r0, r5, r0
	bl ov49_022588A0
	cmp r0, #0
	beq _0225DD64
	adds r0, r4, #0
	adds r0, #0xe0
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225DD44
	ldrh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0xe1
	lsls r0, r0, #4
	adds r0, r5, r0
	ldrb r1, [r1]
	ldr r0, [r0, #8]
	blx FUN_020C3698
_0225DD44:
	adds r0, r4, #4
	bl FUN_020181EC
	adds r0, r4, #0
	adds r0, #0xe0
	ldrb r0, [r0]
	cmp r0, #1
	bne _0225DD64
	ldrh r0, [r4, #2]
	adds r4, #0xe2
	ldrb r1, [r4]
	lsls r0, r0, #4
	adds r0, r5, r0
	ldr r0, [r0, #8]
	blx FUN_020C3698
_0225DD64:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225DD0C

	thumb_func_start ov49_0225DD68
ov49_0225DD68: @ 0x0225DD68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	str r0, [sp, #0xc]
	adds r0, #0x7c
	adds r7, r4, #0
	movs r5, #0
	str r0, [sp, #0xc]
	adds r7, #0xc0
	adds r6, r4, #0
	str r0, [sp, #8]
_0225DD82:
	adds r0, r4, r5
	adds r0, #0xb8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225DDEE
	adds r0, r4, r5
	adds r0, #0xbc
	ldrb r0, [r0]
	cmp r0, #6
	bhi _0225DDEE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225DDA2: @ jump table
	.2byte _0225DDB0 - _0225DDA2 - 2 @ case 0
	.2byte _0225DDCC - _0225DDA2 - 2 @ case 1
	.2byte _0225DEFC - _0225DDA2 - 2 @ case 2
	.2byte _0225DE12 - _0225DDA2 - 2 @ case 3
	.2byte _0225DE2E - _0225DDA2 - 2 @ case 4
	.2byte _0225DE72 - _0225DDA2 - 2 @ case 5
	.2byte _0225DEC8 - _0225DDA2 - 2 @ case 6
_0225DDB0:
	adds r2, r4, #0
	adds r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	adds r0, r7, #0
	bl ov49_0225D57C
	adds r1, r6, #0
	adds r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl FUN_02018198
	b _0225DEFC
_0225DDCC:
	adds r2, r4, #0
	adds r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	adds r0, r7, #0
	bl ov49_0225D5A0
	adds r1, r6, #0
	adds r1, #0xc0
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl FUN_02018198
	ldr r0, [sp, #0x14]
	cmp r0, #1
	beq _0225DDF0
_0225DDEE:
	b _0225DEFC
_0225DDF0:
	adds r0, r6, #0
	adds r0, #0xd0
	ldr r0, [r0]
	adds r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [sp]
	adds r2, r5, #0
	bl ov49_0225D328
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0225DEFC
	ldr r0, [sp]
	ldr r2, [sp, #0x10]
	adds r1, r4, #0
	blx r2
	b _0225DEFC
_0225DE12:
	adds r2, r4, #0
	adds r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	adds r0, r7, #0
	bl ov49_0225D5C8
	adds r1, r6, #0
	adds r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl FUN_02018198
	b _0225DEFC
_0225DE2E:
	adds r2, r4, #0
	adds r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	adds r0, r7, #0
	bl ov49_0225D5E4
	adds r1, r6, #0
	adds r1, #0xc0
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl FUN_02018198
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225DEFC
	adds r0, r6, #0
	adds r0, #0xd0
	ldr r0, [r0]
	adds r1, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r2, r5, #0
	bl ov49_0225D328
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _0225DEFC
	ldr r0, [sp]
	ldr r2, [sp, #4]
	adds r1, r4, #0
	blx r2
	b _0225DEFC
_0225DE72:
	adds r0, r4, r5
	adds r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225DE8C
	adds r0, r4, r5
	adds r0, #0xcd
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, r5
	adds r0, #0xcd
	strb r1, [r0]
	b _0225DEFC
_0225DE8C:
	adds r2, r4, #0
	adds r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	adds r0, r7, #0
	bl ov49_0225D5A0
	cmp r0, #1
	bne _0225DEBA
	bl FUN_0201FDB8
	adds r1, r4, #0
	adds r1, #0xcc
	ldrb r1, [r1]
	blx FUN_020F2BA4
	adds r0, r4, r5
	adds r0, #0xcd
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0xc0
	movs r0, #0
	str r0, [r1]
_0225DEBA:
	adds r1, r6, #0
	adds r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl FUN_02018198
	b _0225DEFC
_0225DEC8:
	adds r0, r4, r5
	adds r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225DEE2
	adds r0, r4, r5
	adds r0, #0xcd
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, r5
	adds r0, #0xcd
	strb r1, [r0]
	b _0225DEFC
_0225DEE2:
	adds r2, r4, #0
	adds r2, #0xdc
	ldr r1, [sp, #0xc]
	ldr r2, [r2]
	adds r0, r7, #0
	bl ov49_0225D57C
	adds r1, r6, #0
	adds r1, #0xc0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	bl FUN_02018198
_0225DEFC:
	ldr r0, [sp, #0xc]
	adds r5, r5, #1
	adds r0, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r7, r7, #4
	adds r0, #0x14
	adds r6, r6, #4
	str r0, [sp, #8]
	cmp r5, #3
	bge _0225DF14
	b _0225DD82
_0225DF14:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225DD68

	thumb_func_start ov49_0225DF18
ov49_0225DF18: @ 0x0225DF18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r1, _0225E284 @ =0x00000614
	adds r0, r3, #0
	adds r7, r2, #0
	str r3, [sp, #4]
	bl FUN_0201AA8C
	ldr r2, _0225E284 @ =0x00000614
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x61
	str r7, [r4]
	lsls r0, r0, #4
	strb r5, [r4, r0]
	adds r0, r0, #1
	strb r6, [r4, r0]
	ldr r2, [sp, #4]
	ldr r3, [sp, #0x48]
	movs r0, #9
	movs r1, #0x80
	bl ov49_0225CC4C
	str r0, [r4, #4]
	ldr r0, [sp, #0x48]
	ldr r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r4, #4]
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov49_0225CDEC
	movs r0, #0
	ldr r5, _0225E288 @ =0x02269AAC
	str r0, [sp, #0xc]
_0225DF66:
	movs r0, #0
	str r0, [sp]
	ldrh r1, [r5]
	str r0, [sp, #8]
	add r2, sp, #0x1c
	ldr r0, [r4]
	adds r2, #2
	add r3, sp, #0x1c
	bl ov49_022589D8
	cmp r0, #1
	beq _0225DF80
	b _0225E234
_0225DF80:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [sp, #0x10]
	movs r0, #0xda
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [sp, #0x14]
	ldr r0, _0225E28C @ =0x000004E8
	mov r7, sp
	adds r0, r4, r0
	str r0, [sp, #0x18]
	subs r7, r7, #4
	add r6, sp, #0x1c
_0225DF9C:
	ldrh r1, [r5, #2]
	ldrh r2, [r6, #2]
	ldrh r3, [r6]
	ldr r0, [r4, #4]
	bl ov49_0225D098
	ldr r1, _0225E290 @ =0x00000612
	ldrb r1, [r4, r1]
	lsls r1, r1, #2
	adds r1, r4, r1
	str r0, [r1, #8]
	ldrh r0, [r5, #2]
	cmp r0, #0x10
	bls _0225DFBA
	b _0225E20E
_0225DFBA:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225DFC6: @ jump table
	.2byte _0225E014 - _0225DFC6 - 2 @ case 0
	.2byte _0225E20E - _0225DFC6 - 2 @ case 1
	.2byte _0225E20E - _0225DFC6 - 2 @ case 2
	.2byte _0225E20E - _0225DFC6 - 2 @ case 3
	.2byte _0225E20E - _0225DFC6 - 2 @ case 4
	.2byte _0225E20E - _0225DFC6 - 2 @ case 5
	.2byte _0225DFE8 - _0225DFC6 - 2 @ case 6
	.2byte _0225DFE8 - _0225DFC6 - 2 @ case 7
	.2byte _0225DFE8 - _0225DFC6 - 2 @ case 8
	.2byte _0225E20E - _0225DFC6 - 2 @ case 9
	.2byte _0225E052 - _0225DFC6 - 2 @ case 10
	.2byte _0225E07E - _0225DFC6 - 2 @ case 11
	.2byte _0225E07E - _0225DFC6 - 2 @ case 12
	.2byte _0225E094 - _0225DFC6 - 2 @ case 13
	.2byte _0225E0F2 - _0225DFC6 - 2 @ case 14
	.2byte _0225E150 - _0225DFC6 - 2 @ case 15
	.2byte _0225E18C - _0225DFC6 - 2 @ case 16
_0225DFE8:
	ldr r1, _0225E290 @ =0x00000612
	movs r2, #0
	ldrb r1, [r4, r1]
	ldr r0, [r4, #4]
	adds r3, r2, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r0, _0225E290 @ =0x00000612
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r2, [r0, #8]
	ldrh r0, [r5, #2]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x85
	lsls r0, r0, #2
	str r2, [r1, r0]
	b _0225E20E
_0225E014:
	ldr r1, _0225E290 @ =0x00000612
	movs r2, #0
	ldrb r1, [r4, r1]
	ldr r0, [r4, #4]
	adds r3, r2, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r1, _0225E290 @ =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	movs r2, #1
	movs r3, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r1, _0225E290 @ =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	movs r2, #2
	movs r3, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	b _0225E20E
_0225E052:
	ldr r1, _0225E290 @ =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	movs r2, #0
	movs r3, #2
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	ldr r0, _0225E290 @ =0x00000612
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r2, [r0, #8]
	ldrh r0, [r5]
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x45
	lsls r0, r0, #2
	str r2, [r1, r0]
	b _0225E20E
_0225E07E:
	ldr r1, _0225E290 @ =0x00000612
	ldr r0, [r4, #4]
	ldrb r1, [r4, r1]
	movs r2, #0
	movs r3, #2
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225D214
	b _0225E20E
_0225E094:
	ldr r0, _0225E294 @ =0x00000608
	movs r1, #0xc
	ldrb r0, [r4, r0]
	muls r1, r0, r1
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	ldr r1, _0225E290 @ =0x00000612
	ldrb r1, [r4, r1]
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225EB00
	ldr r0, _0225E294 @ =0x00000608
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	ldr r0, _0225E294 @ =0x00000608
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E0C2
	bl GF_AssertFail
_0225E0C2:
	ldr r0, _0225E290 @ =0x00000612
	movs r1, #0
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	ldrh r1, [r5]
	ldr r0, _0225E298 @ =0x0000FFA4
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0225E0E2
	b _0225E20E
_0225E0E2:
	ldr r0, _0225E290 @ =0x00000612
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225EE4C
	b _0225E20E
_0225E0F2:
	ldr r0, _0225E29C @ =0x00000609
	movs r1, #0xc
	ldrb r0, [r4, r0]
	muls r1, r0, r1
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	ldr r1, _0225E290 @ =0x00000612
	ldrb r1, [r4, r1]
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225EB00
	ldr r0, _0225E29C @ =0x00000609
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	ldr r0, _0225E29C @ =0x00000609
	strb r1, [r4, r0]
	subs r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E122
	bl GF_AssertFail
_0225E122:
	ldr r0, _0225E290 @ =0x00000612
	movs r1, #0
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	ldrh r1, [r5]
	ldr r0, _0225E298 @ =0x0000FFA4
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0225E20E
	ldr r0, _0225E290 @ =0x00000612
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225EE4C
	b _0225E20E
_0225E150:
	ldr r0, _0225E290 @ =0x00000612
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r2, [r0, #8]
	ldr r0, _0225E2A0 @ =0x0000060A
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _0225E2A4 @ =0x00000488
	str r2, [r1, r0]
	ldr r0, _0225E2A0 @ =0x0000060A
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	ldr r0, _0225E2A0 @ =0x0000060A
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E17A
	bl GF_AssertFail
_0225E17A:
	ldr r0, _0225E290 @ =0x00000612
	movs r1, #0
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	b _0225E20E
_0225E18C:
	ldr r0, _0225E2A8 @ =0x0000060B
	movs r1, #0xc
	ldrb r0, [r4, r0]
	muls r1, r0, r1
	ldr r0, [sp, #0x18]
	adds r0, r0, r1
	ldr r1, _0225E290 @ =0x00000612
	ldrb r1, [r4, r1]
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #8]
	bl ov49_0225EB00
	ldr r0, _0225E2A8 @ =0x0000060B
	ldrb r0, [r4, r0]
	adds r1, r0, #1
	ldr r0, _0225E2A8 @ =0x0000060B
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x18
	bls _0225E1BA
	bl GF_AssertFail
_0225E1BA:
	ldr r0, _0225E290 @ =0x00000612
	movs r1, #0
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D494
	ldr r0, _0225E290 @ =0x00000612
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	bl ov49_0225D1EC
	strh r0, [r6, #4]
	lsrs r0, r0, #0x10
	strh r0, [r6, #6]
	ldrh r0, [r6, #4]
	strh r0, [r6, #8]
	ldrh r0, [r6, #6]
	strh r0, [r6, #0xa]
	movs r0, #8
	ldrsh r0, [r6, r0]
	adds r0, #8
	strh r0, [r6, #8]
	movs r0, #0xa
	ldrsh r0, [r6, r0]
	adds r0, #0x14
	strh r0, [r6, #0xa]
	ldr r0, _0225E290 @ =0x00000612
	ldrh r1, [r6, #8]
	ldrb r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	strh r1, [r7]
	ldrh r1, [r6, #0xa]
	strh r1, [r7, #2]
	ldr r1, [r7]
	bl ov49_0225D1C4
_0225E20E:
	ldr r0, _0225E290 @ =0x00000612
	add r2, sp, #0x1c
	ldrb r0, [r4, r0]
	adds r2, #2
	add r3, sp, #0x1c
	adds r1, r0, #1
	ldr r0, _0225E290 @ =0x00000612
	strb r1, [r4, r0]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp]
	str r0, [sp, #8]
	ldrh r1, [r5]
	ldr r0, [r4]
	bl ov49_022589D8
	cmp r0, #1
	bne _0225E234
	b _0225DF9C
_0225E234:
	ldr r0, [sp, #0xc]
	adds r5, r5, #4
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x23
	bhs _0225E242
	b _0225DF66
_0225E242:
	movs r0, #0xa
	movs r7, #0
	lsls r0, r0, #0xe
	ldr r6, _0225E2AC @ =0x02269A88
	str r7, [sp, #0x28]
	str r0, [sp, #0x30]
	str r7, [sp, #0x2c]
	adds r5, r4, #0
_0225E252:
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	ldr r0, [r4, #4]
	add r3, sp, #0x28
	bl ov49_0225CF28
	movs r1, #0x82
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov49_0225D040
	adds r7, r7, #1
	adds r6, r6, #4
	adds r5, r5, #4
	cmp r7, #9
	blt _0225E252
	ldr r0, _0225E2B0 @ =0x00000613
	movs r1, #9
	strb r1, [r4, r0]
	adds r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225E284: .4byte 0x00000614
_0225E288: .4byte 0x02269AAC
_0225E28C: .4byte 0x000004E8
_0225E290: .4byte 0x00000612
_0225E294: .4byte 0x00000608
_0225E298: .4byte 0x0000FFA4
_0225E29C: .4byte 0x00000609
_0225E2A0: .4byte 0x0000060A
_0225E2A4: .4byte 0x00000488
_0225E2A8: .4byte 0x0000060B
_0225E2AC: .4byte 0x02269A88
_0225E2B0: .4byte 0x00000613
	thumb_func_end ov49_0225DF18

	thumb_func_start ov49_0225E2B4
ov49_0225E2B4: @ 0x0225E2B4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225E310 @ =0x00000613
	movs r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E2DA
	ldr r7, _0225E310 @ =0x00000613
	adds r4, r5, #0
_0225E2C6:
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov49_0225CF94
	ldrb r0, [r5, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _0225E2C6
_0225E2DA:
	ldr r0, _0225E314 @ =0x00000612
	movs r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E2FA
	ldr r7, _0225E314 @ =0x00000612
	adds r4, r5, #0
_0225E2E8:
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	bl ov49_0225D160
	ldrb r0, [r5, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _0225E2E8
_0225E2FA:
	ldr r0, [r5, #4]
	bl ov49_0225CE88
	ldr r0, [r5, #4]
	bl ov49_0225CCC0
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E310: .4byte 0x00000613
_0225E314: .4byte 0x00000612
	thumb_func_end ov49_0225E2B4

	thumb_func_start ov49_0225E318
ov49_0225E318: @ 0x0225E318
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225E390 @ =0x00000608
	movs r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E340
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r7, _0225E390 @ =0x00000608
	adds r4, r5, r0
_0225E32E:
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl ov49_0225EB08
	ldrb r0, [r5, r7]
	adds r6, r6, #1
	adds r4, #0xc
	cmp r6, r0
	blt _0225E32E
_0225E340:
	ldr r0, _0225E394 @ =0x00000609
	movs r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E364
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r7, _0225E394 @ =0x00000609
	adds r4, r5, r0
_0225E352:
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl ov49_0225ECF0
	ldrb r0, [r5, r7]
	adds r6, r6, #1
	adds r4, #0xc
	cmp r6, r0
	blt _0225E352
_0225E364:
	ldr r0, _0225E398 @ =0x0000060B
	movs r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E386
	ldr r0, _0225E39C @ =0x000004E8
	ldr r7, _0225E398 @ =0x0000060B
	adds r4, r5, r0
_0225E374:
	ldr r1, [r5, #4]
	adds r0, r4, #0
	bl ov49_0225ED98
	ldrb r0, [r5, r7]
	adds r6, r6, #1
	adds r4, #0xc
	cmp r6, r0
	blt _0225E374
_0225E386:
	ldr r0, [r5, #4]
	bl ov49_0225CCF0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E390: .4byte 0x00000608
_0225E394: .4byte 0x00000609
_0225E398: .4byte 0x0000060B
_0225E39C: .4byte 0x000004E8
	thumb_func_end ov49_0225E318

	thumb_func_start ov49_0225E3A0
ov49_0225E3A0: @ 0x0225E3A0
	ldr r3, _0225E3A8 @ =ov49_0225CD58
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E3A8: .4byte ov49_0225CD58
	thumb_func_end ov49_0225E3A0

	thumb_func_start ov49_0225E3AC
ov49_0225E3AC: @ 0x0225E3AC
	ldr r3, _0225E3B4 @ =ov49_0225CDE8
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E3B4: .4byte ov49_0225CDE8
	thumb_func_end ov49_0225E3AC

	thumb_func_start ov49_0225E3B8
ov49_0225E3B8: @ 0x0225E3B8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0225E3F0 @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	adds r6, r2, #0
	cmp r0, r4
	bhi _0225E3CE
	bl GF_AssertFail
_0225E3CE:
	movs r0, #0xa
	lsls r0, r0, #0xe
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	str r6, [sp]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	bl ov49_0225CFA8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0225E3F0: .4byte 0x00000613
	thumb_func_end ov49_0225E3B8

	thumb_func_start ov49_0225E3F4
ov49_0225E3F4: @ 0x0225E3F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0225E41C @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	adds r6, r2, #0
	cmp r0, r4
	bhi _0225E408
	bl GF_AssertFail
_0225E408:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r6, #0
	bl ov49_0225CFEC
	pop {r4, r5, r6, pc}
	nop
_0225E41C: .4byte 0x00000613
	thumb_func_end ov49_0225E3F4

	thumb_func_start ov49_0225E420
ov49_0225E420: @ 0x0225E420
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225E470 @ =0x00000613
	adds r6, r1, #0
	ldrb r0, [r5, r0]
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r0, r6
	bhi _0225E436
	bl GF_AssertFail
_0225E436:
	cmp r7, #3
	blo _0225E43E
	bl GF_AssertFail
_0225E43E:
	lsls r0, r6, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r4, #0
	bl ov49_0225D030
	ldr r1, _0225E474 @ =0x02269A7C
	lsls r0, r7, #2
	ldrsh r1, [r1, r0]
	ldr r2, [r4]
	lsls r1, r1, #0xc
	adds r1, r2, r1
	str r1, [r4]
	ldr r1, _0225E478 @ =0x02269A7E
	ldr r2, [r4, #8]
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0xc
	adds r0, r2, r0
	str r0, [r4, #8]
	movs r0, #0xa
	lsls r0, r0, #0xe
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E470: .4byte 0x00000613
_0225E474: .4byte 0x02269A7C
_0225E478: .4byte 0x02269A7E
	thumb_func_end ov49_0225E420

	thumb_func_start ov49_0225E47C
ov49_0225E47C: @ 0x0225E47C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225E4A0 @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E48E
	bl GF_AssertFail
_0225E48E:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D04C
	pop {r3, r4, r5, pc}
	nop
_0225E4A0: .4byte 0x00000613
	thumb_func_end ov49_0225E47C

	thumb_func_start ov49_0225E4A4
ov49_0225E4A4: @ 0x0225E4A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225E4C8 @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E4B6
	bl GF_AssertFail
_0225E4B6:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D064
	pop {r3, r4, r5, pc}
	nop
_0225E4C8: .4byte 0x00000613
	thumb_func_end ov49_0225E4A4

	thumb_func_start ov49_0225E4CC
ov49_0225E4CC: @ 0x0225E4CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0225E4F4 @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	adds r6, r2, #0
	cmp r0, r4
	bhi _0225E4E0
	bl GF_AssertFail
_0225E4E0:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r6, #0
	bl ov49_0225D040
	pop {r4, r5, r6, pc}
	nop
_0225E4F4: .4byte 0x00000613
	thumb_func_end ov49_0225E4CC

	thumb_func_start ov49_0225E4F8
ov49_0225E4F8: @ 0x0225E4F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0225E520 @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	adds r6, r2, #0
	cmp r0, r4
	bhi _0225E50C
	bl GF_AssertFail
_0225E50C:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r6, #0
	bl ov49_0225D07C
	pop {r4, r5, r6, pc}
	nop
_0225E520: .4byte 0x00000613
	thumb_func_end ov49_0225E4F8

	thumb_func_start ov49_0225E524
ov49_0225E524: @ 0x0225E524
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225E548 @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E536
	bl GF_AssertFail
_0225E536:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D088
	pop {r3, r4, r5, pc}
	nop
_0225E548: .4byte 0x00000613
	thumb_func_end ov49_0225E524

	thumb_func_start ov49_0225E54C
ov49_0225E54C: @ 0x0225E54C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0225E570 @ =0x00000613
	adds r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bhi _0225E55E
	bl GF_AssertFail
_0225E55E:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl ov49_0225D090
	pop {r3, r4, r5, pc}
	nop
_0225E570: .4byte 0x00000613
	thumb_func_end ov49_0225E54C

	thumb_func_start ov49_0225E574
ov49_0225E574: @ 0x0225E574
	ldr r3, _0225E57C @ =ov49_0225CED0
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E57C: .4byte ov49_0225CED0
	thumb_func_end ov49_0225E574

	thumb_func_start ov49_0225E580
ov49_0225E580: @ 0x0225E580
	ldr r3, _0225E588 @ =ov49_0225CEFC
	ldr r0, [r0, #4]
	bx r3
	nop
_0225E588: .4byte ov49_0225CEFC
	thumb_func_end ov49_0225E580

	thumb_func_start ov49_0225E58C
ov49_0225E58C: @ 0x0225E58C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0225E61C @ =0x00000612
	str r1, [sp]
	ldrb r0, [r5, r0]
	movs r6, #0
	cmp r0, #0
	ble _0225E616
	ldr r1, [sp]
	subs r0, r2, #1
	subs r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r0, #0x18
	adds r4, r5, #0
	str r1, [sp, #4]
	lsrs r7, r0, #0x18
_0225E5B0:
	ldr r0, [r4, #8]
	ldr r1, [sp, #4]
	adds r2, r7, #0
	bl ov49_0225E9D0
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	ldr r1, [sp]
	adds r2, r7, #0
	bl ov49_0225E9D0
	ldr r1, [sp, #8]
	cmp r1, #1
	beq _0225E5D0
	cmp r0, #1
	bne _0225E60A
_0225E5D0:
	ldr r0, [r4, #8]
	bl ov49_0225D1C0
	cmp r0, #4
	bhi _0225E60A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E5E6: @ jump table
	.2byte _0225E60A - _0225E5E6 - 2 @ case 0
	.2byte _0225E5F0 - _0225E5E6 - 2 @ case 1
	.2byte _0225E5F0 - _0225E5E6 - 2 @ case 2
	.2byte _0225E5F0 - _0225E5E6 - 2 @ case 3
	.2byte _0225E5F0 - _0225E5E6 - 2 @ case 4
_0225E5F0:
	ldr r0, _0225E620 @ =0x00000611
	ldrb r0, [r5, r0]
	cmp r0, #4
	bne _0225E602
	ldr r1, [r4, #8]
	adds r0, r5, #0
	bl ov49_0225EAB4
	b _0225E60A
_0225E602:
	ldr r1, [r4, #8]
	adds r0, r5, #0
	bl ov49_0225EA70
_0225E60A:
	ldr r0, _0225E61C @ =0x00000612
	adds r6, r6, #1
	ldrb r0, [r5, r0]
	adds r4, r4, #4
	cmp r6, r0
	blt _0225E5B0
_0225E616:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225E61C: .4byte 0x00000612
_0225E620: .4byte 0x00000611
	thumb_func_end ov49_0225E58C

	thumb_func_start ov49_0225E624
ov49_0225E624: @ 0x0225E624
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225E6DC @ =0x00000612
	adds r7, r1, #0
	ldrb r0, [r5, r0]
	movs r6, #0
	cmp r0, #0
	ble _0225E6DA
	adds r4, r5, #0
_0225E636:
	ldr r0, [r4, #8]
	bl ov49_0225D1C0
	cmp r0, #4
	bhi _0225E656
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0225E64C: @ jump table
	.2byte _0225E6CE - _0225E64C - 2 @ case 0
	.2byte _0225E65C - _0225E64C - 2 @ case 1
	.2byte _0225E65C - _0225E64C - 2 @ case 2
	.2byte _0225E65C - _0225E64C - 2 @ case 3
	.2byte _0225E65C - _0225E64C - 2 @ case 4
_0225E656:
	cmp r0, #0xf
	beq _0225E66C
	b _0225E6CE
_0225E65C:
	cmp r7, #1
	bne _0225E6CE
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #1
	bl ov49_0225D4A0
	b _0225E6CE
_0225E66C:
	cmp r7, #1
	bne _0225E6A8
	movs r1, #2
	ldr r0, [r4, #8]
	lsls r1, r1, #0xa
	bl ov49_0225D4C8
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #0
	movs r3, #6
	bl ov49_0225D214
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #1
	movs r3, #6
	bl ov49_0225D214
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #2
	movs r3, #6
	bl ov49_0225D214
	ldr r0, [r4, #8]
	movs r1, #1
	bl ov49_0225D494
	b _0225E6CE
_0225E6A8:
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #0
	bl ov49_0225D328
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #1
	bl ov49_0225D328
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #2
	bl ov49_0225D328
	ldr r0, [r4, #8]
	movs r1, #0
	bl ov49_0225D494
_0225E6CE:
	ldr r0, _0225E6DC @ =0x00000612
	adds r6, r6, #1
	ldrb r0, [r5, r0]
	adds r4, r4, #4
	cmp r6, r0
	blt _0225E636
_0225E6DA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E6DC: .4byte 0x00000612
	thumb_func_end ov49_0225E624

	thumb_func_start ov49_0225E6E0
ov49_0225E6E0: @ 0x0225E6E0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0225E70C @ =0x0000060B
	adds r7, r1, #0
	ldrb r0, [r6, r0]
	movs r4, #0
	cmp r0, #0
	ble _0225E708
	ldr r0, _0225E710 @ =0x000004E8
	adds r5, r6, r0
_0225E6F4:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov49_0225ECD4
	ldr r0, _0225E70C @ =0x0000060B
	adds r4, r4, #1
	ldrb r0, [r6, r0]
	adds r5, #0xc
	cmp r4, r0
	blt _0225E6F4
_0225E708:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E70C: .4byte 0x0000060B
_0225E710: .4byte 0x000004E8
	thumb_func_end ov49_0225E6E0

	thumb_func_start ov49_0225E714
ov49_0225E714: @ 0x0225E714
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225E75C @ =0x00000612
	movs r6, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _0225E75A
	ldr r7, _0225E75C @ =0x00000612
	adds r4, r5, #0
_0225E726:
	ldr r0, [r4, #8]
	bl ov49_0225D1C0
	cmp r0, #4
	bhi _0225E750
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E73C: @ jump table
	.2byte _0225E750 - _0225E73C - 2 @ case 0
	.2byte _0225E746 - _0225E73C - 2 @ case 1
	.2byte _0225E746 - _0225E73C - 2 @ case 2
	.2byte _0225E746 - _0225E73C - 2 @ case 3
	.2byte _0225E746 - _0225E73C - 2 @ case 4
_0225E746:
	ldr r0, [r5, #4]
	ldr r1, [r4, #8]
	movs r2, #1
	bl ov49_0225D4A0
_0225E750:
	ldrb r0, [r5, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _0225E726
_0225E75A:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E75C: .4byte 0x00000612
	thumb_func_end ov49_0225E714

	thumb_func_start ov49_0225E760
ov49_0225E760: @ 0x0225E760
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0225E818 @ =0x00000612
	adds r7, r1, #0
	ldrb r0, [r4, r0]
	movs r6, #0
	cmp r0, #0
	ble _0225E816
	adds r5, r4, #0
_0225E772:
	ldr r0, [r5, #8]
	bl ov49_0225D1C0
	cmp r0, #0xb
	beq _0225E780
	cmp r0, #0xc
	bne _0225E80A
_0225E780:
	cmp r7, #3
	bhi _0225E80A
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225E790: @ jump table
	.2byte _0225E798 - _0225E790 - 2 @ case 0
	.2byte _0225E7AE - _0225E790 - 2 @ case 1
	.2byte _0225E7C8 - _0225E790 - 2 @ case 2
	.2byte _0225E7EC - _0225E790 - 2 @ case 3
_0225E798:
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	movs r2, #0
	movs r3, #2
	bl ov49_0225D214
	movs r0, #0x91
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225E80A
_0225E7AE:
	ldr r0, _0225E81C @ =ov49_0225EA10
	movs r2, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	movs r3, #1
	bl ov49_0225D224
	movs r0, #0x91
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225E80A
_0225E7C8:
	ldr r0, _0225E820 @ =ov49_0225EA40
	movs r2, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	movs r3, #4
	bl ov49_0225D224
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	movs r2, #1
	bl ov49_0225D328
	movs r0, #0x91
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0225E80A
_0225E7EC:
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	movs r2, #1
	movs r3, #0
	bl ov49_0225D214
	ldr r0, [r4, #4]
	ldr r1, [r5, #8]
	movs r2, #0
	bl ov49_0225D328
	movs r0, #0x91
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
_0225E80A:
	ldr r0, _0225E818 @ =0x00000612
	adds r6, r6, #1
	ldrb r0, [r4, r0]
	adds r5, r5, #4
	cmp r6, r0
	blt _0225E772
_0225E816:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E818: .4byte 0x00000612
_0225E81C: .4byte ov49_0225EA10
_0225E820: .4byte ov49_0225EA40
	thumb_func_end ov49_0225E760

	thumb_func_start ov49_0225E824
ov49_0225E824: @ 0x0225E824
	movs r1, #0x91
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov49_0225E824

	thumb_func_start ov49_0225E82C
ov49_0225E82C: @ 0x0225E82C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0225E858 @ =0x00000608
	adds r6, r1, #0
	ldrb r0, [r5, r0]
	adds r7, r2, #0
	movs r4, #0
	cmp r0, #0
	ble _0225E854
_0225E83E:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov49_0225E85C
	ldr r0, _0225E858 @ =0x00000608
	adds r4, r4, #1
	ldrb r0, [r5, r0]
	cmp r4, r0
	blt _0225E83E
_0225E854:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E858: .4byte 0x00000608
	thumb_func_end ov49_0225E82C

	thumb_func_start ov49_0225E85C
ov49_0225E85C: @ 0x0225E85C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0225E890 @ =0x00000608
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _0225E88C
	movs r0, #0x92
	lsls r0, r0, #2
	adds r5, r4, r0
	movs r0, #0xc
	muls r0, r1, r0
	cmp r2, #0
	beq _0225E882
	ldr r1, [r4, #4]
	adds r0, r5, r0
	adds r2, r3, #0
	bl ov49_0225EB54
	b _0225E888
_0225E882:
	adds r0, r5, r0
	bl ov49_0225EB84
_0225E888:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225E88C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225E890: .4byte 0x00000608
	thumb_func_end ov49_0225E85C

	thumb_func_start ov49_0225E894
ov49_0225E894: @ 0x0225E894
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0225E8C0 @ =0x00000609
	adds r7, r1, #0
	ldrb r0, [r6, r0]
	movs r4, #0
	cmp r0, #0
	ble _0225E8BE
	movs r0, #0xda
	lsls r0, r0, #2
	adds r5, r6, r0
_0225E8AA:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov49_0225ECD4
	ldr r0, _0225E8C0 @ =0x00000609
	adds r4, r4, #1
	ldrb r0, [r6, r0]
	adds r5, #0xc
	cmp r4, r0
	blt _0225E8AA
_0225E8BE:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225E8C0: .4byte 0x00000609
	thumb_func_end ov49_0225E894

	thumb_func_start ov49_0225E8C4
ov49_0225E8C4: @ 0x0225E8C4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r0, r1, #2
	adds r1, r5, r0
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r6, [r1, r0]
	adds r0, #0xc
	ldr r7, [r1, r0]
	ldr r0, [sp, #0x18]
	adds r4, r2, #0
	cmp r0, #1
	beq _0225E8E2
	cmp r3, #1
	bne _0225E992
_0225E8E2:
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225D450
	cmp r0, #0
	bne _0225E8FA
	ldr r0, [r5, #4]
	adds r1, r6, #0
	movs r2, #1
	movs r3, #0
	bl ov49_0225D214
_0225E8FA:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225E938
	adds r0, r4, #4
	lsls r1, r0, #2
	beq _0225E918
	lsls r0, r0, #0xe
	blx FUN_020F21C0
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225E926
_0225E918:
	lsls r0, r0, #0xe
	blx FUN_020F21C0
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225E926:
	blx FUN_020F2104
	adds r3, r0, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
_0225E938:
	ldr r0, _0225E9CC @ =0x0000060C
	movs r1, #0x1c
	ldr r0, [r5, r0]
	adds r0, r0, #1
	blx FUN_020F2BA4
	ldr r0, _0225E9CC @ =0x0000060C
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0xe
	bhs _0225E984
	lsls r0, r4, #2
	beq _0225E964
	lsls r0, r4, #0xe
	blx FUN_020F21C0
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0225E972
_0225E964:
	lsls r0, r4, #0xe
	blx FUN_020F21C0
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0225E972:
	blx FUN_020F2104
	adds r3, r0, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
_0225E984:
	movs r2, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	adds r3, r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
_0225E992:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	ldr r0, [r5, #4]
	beq _0225E9B4
	adds r1, r6, #0
	bl ov49_0225D394
	ldr r0, [r5, #4]
	adds r1, r7, #0
	bl ov49_0225D394
	ldr r0, [r5, #4]
	adds r1, r6, #0
	movs r2, #1
	bl ov49_0225D4A0
	pop {r3, r4, r5, r6, r7, pc}
_0225E9B4:
	adds r1, r6, #0
	movs r2, #1
	bl ov49_0225D328
	movs r2, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	adds r3, r2, #0
	bl ov49_0225D3F8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E9CC: .4byte 0x0000060C
	thumb_func_end ov49_0225E8C4

	thumb_func_start ov49_0225E9D0
ov49_0225E9D0: @ 0x0225E9D0
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	lsls r1, r2, #0x14
	asrs r4, r1, #0x10
	bl ov49_0225D1EC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #4
	ldrsh r2, [r1, r0]
	lsls r0, r5, #0x14
	asrs r0, r0, #0x10
	cmp r2, r0
	bne _0225EA08
	movs r0, #6
	ldrsh r0, [r1, r0]
	cmp r0, r4
	bne _0225EA08
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225EA08:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225E9D0

	thumb_func_start ov49_0225EA10
ov49_0225EA10: @ 0x0225EA10
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov49_0225D1C0
	adds r4, r0, #0
	cmp r4, #0xb
	beq _0225EA2A
	cmp r4, #0xc
	beq _0225EA2A
	bl GF_AssertFail
_0225EA2A:
	subs r4, #0xb
	cmp r4, #1
	bhi _0225EA3C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	movs r3, #0
	bl ov49_0225D214
_0225EA3C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225EA10

	thumb_func_start ov49_0225EA40
ov49_0225EA40: @ 0x0225EA40
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov49_0225D1C0
	adds r4, r0, #0
	cmp r4, #0xb
	beq _0225EA5A
	cmp r4, #0xc
	beq _0225EA5A
	bl GF_AssertFail
_0225EA5A:
	subs r4, #0xb
	cmp r4, #1
	bhi _0225EA6C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0
	movs r3, #2
	bl ov49_0225D214
_0225EA6C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225EA40

	thumb_func_start ov49_0225EA70
ov49_0225EA70: @ 0x0225EA70
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, [r6, #4]
	adds r2, r4, #0
	adds r5, r1, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225EA88
	movs r4, #1
	b _0225EA9A
_0225EA88:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225D470
	movs r1, #2
	lsls r1, r1, #0xc
	cmp r0, r1
	ble _0225EA9A
	movs r4, #1
_0225EA9A:
	cmp r4, #1
	bne _0225EAAC
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov49_0225EAE0
	ldr r0, _0225EAB0 @ =0x000005BC
	bl FUN_0200604C
_0225EAAC:
	pop {r4, r5, r6, pc}
	nop
_0225EAB0: .4byte 0x000005BC
	thumb_func_end ov49_0225EA70

	thumb_func_start ov49_0225EAB4
ov49_0225EAB4: @ 0x0225EAB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, [r5, #4]
	adds r2, r4, #0
	adds r6, r1, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225EACA
	movs r4, #1
_0225EACA:
	cmp r4, #1
	bne _0225EADE
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov49_0225EAE0
	movs r0, #0x17
	lsls r0, r0, #6
	bl FUN_0200604C
_0225EADE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225EAB4

	thumb_func_start ov49_0225EAE0
ov49_0225EAE0: @ 0x0225EAE0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	movs r7, #1
_0225EAEA:
	ldr r0, [r5, #4]
	adds r1, r6, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov49_0225D214
	adds r4, r4, #1
	cmp r4, #3
	blt _0225EAEA
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225EAE0

	thumb_func_start ov49_0225EB00
ov49_0225EB00: @ 0x0225EB00
	str r1, [r0]
	movs r1, #0
	strh r1, [r0, #4]
	bx lr
	thumb_func_end ov49_0225EB00

	thumb_func_start ov49_0225EB08
ov49_0225EB08: @ 0x0225EB08
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #4]
	adds r5, r1, #0
	cmp r2, #4
	bhi _0225EB52
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225EB20: @ jump table
	.2byte _0225EB52 - _0225EB20 - 2 @ case 0
	.2byte _0225EB2A - _0225EB20 - 2 @ case 1
	.2byte _0225EB52 - _0225EB20 - 2 @ case 2
	.2byte _0225EB34 - _0225EB20 - 2 @ case 3
	.2byte _0225EB3E - _0225EB20 - 2 @ case 4
_0225EB2A:
	bl ov49_0225EBA8
	movs r0, #2
	strh r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0225EB34:
	bl ov49_0225EC28
	movs r0, #4
	strh r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0225EB3E:
	bl ov49_0225EC30
	cmp r0, #1
	bne _0225EB52
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_0225EBE4
	movs r0, #0
	strh r0, [r4, #4]
_0225EB52:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225EB08

	thumb_func_start ov49_0225EB54
ov49_0225EB54: @ 0x0225EB54
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	ldrh r2, [r5, #4]
	ldr r3, _0225EB80 @ =0x0000FFFF
	adds r6, r2, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	cmp r6, #1
	bls _0225EB7E
	subs r3, r3, #2
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #1
	bhi _0225EB78
	bl ov49_0225EBE4
_0225EB78:
	movs r0, #1
	strh r0, [r5, #4]
	str r4, [r5, #8]
_0225EB7E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225EB80: .4byte 0x0000FFFF
	thumb_func_end ov49_0225EB54

	thumb_func_start ov49_0225EB84
ov49_0225EB84: @ 0x0225EB84
	ldrh r2, [r0, #4]
	ldr r1, _0225EBA4 @ =0x0000FFFD
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bls _0225EBA0
	cmp r2, #1
	bhi _0225EB9C
	movs r1, #0
	strh r1, [r0, #4]
	bx lr
_0225EB9C:
	movs r1, #3
	strh r1, [r0, #4]
_0225EBA0:
	bx lr
	nop
_0225EBA4: .4byte 0x0000FFFD
	thumb_func_end ov49_0225EB84

	thumb_func_start ov49_0225EBA8
ov49_0225EBA8: @ 0x0225EBA8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov49_0225D4C8
	movs r2, #0
	ldr r1, [r5]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov49_0225D214
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl ov49_0225D214
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #0
	bl ov49_0225D214
	ldr r0, [r5]
	movs r1, #1
	bl ov49_0225D494
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225EBA8

	thumb_func_start ov49_0225EBE4
ov49_0225EBE4: @ 0x0225EBE4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225D328
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #1
	bl ov49_0225D328
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #2
	bl ov49_0225D328
	ldr r0, [r5]
	movs r1, #0
	bl ov49_0225D494
	ldr r0, [r5]
	bl ov49_0225D4E8
	movs r1, #1
	lsls r1, r1, #0xc
	ldr r0, [r5]
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov49_0225D4F0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225EBE4

	thumb_func_start ov49_0225EC28
ov49_0225EC28: @ 0x0225EC28
	movs r1, #0
	strh r1, [r0, #6]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225EC28

	thumb_func_start ov49_0225EC30
ov49_0225EC30: @ 0x0225EC30
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #6
	ldrsh r1, [r4, r0]
	cmp r1, #0xa
	bge _0225ECCC
	adds r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #8]
	lsls r0, r0, #0xc
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
	movs r1, #0xa
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	adds r2, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4]
	adds r1, r2, r1
	bl ov49_0225D4C8
	movs r0, #6
	ldrsh r1, [r4, r0]
	movs r0, #0x1f
	muls r0, r1, r0
	movs r1, #0xa
	blx FUN_020F2998
	movs r2, #0x1f
	subs r1, r2, r0
	lsls r1, r1, #0x18
	ldr r0, [r4]
	lsrs r1, r1, #0x18
	bl ov49_0225D4D0
	movs r0, #6
	ldrsh r0, [r4, r0]
	ldr r2, _0225ECD0 @ =0x000002E1
	movs r3, #0
	lsls r0, r0, #0xc
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	movs r1, #0xa
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	movs r3, #1
	adds r5, r0, #0
	lsls r3, r3, #0xc
	adds r1, r5, r3
	ldr r0, [r4]
	adds r2, r1, #0
	adds r3, r5, r3
	bl ov49_0225D4F0
	movs r0, #0
	pop {r3, r4, r5, pc}
_0225ECCC:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225ECD0: .4byte 0x000002E1
	thumb_func_end ov49_0225EC30

	thumb_func_start ov49_0225ECD4
ov49_0225ECD4: @ 0x0225ECD4
	ldrh r3, [r0, #4]
	ldr r2, _0225ECEC @ =0x0000FFFF
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #1
	bls _0225ECE8
	movs r2, #1
	strh r2, [r0, #4]
	str r1, [r0, #8]
_0225ECE8:
	bx lr
	nop
_0225ECEC: .4byte 0x0000FFFF
	thumb_func_end ov49_0225ECD4

	thumb_func_start ov49_0225ECF0
ov49_0225ECF0: @ 0x0225ECF0
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #4]
	cmp r2, #4
	bhi _0225ED62
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225ED06: @ jump table
	.2byte _0225ED66 - _0225ED06 - 2 @ case 0
	.2byte _0225ED10 - _0225ED06 - 2 @ case 1
	.2byte _0225ED1A - _0225ED06 - 2 @ case 2
	.2byte _0225ED2E - _0225ED06 - 2 @ case 3
	.2byte _0225ED38 - _0225ED06 - 2 @ case 4
_0225ED10:
	bl ov49_0225ED68
	movs r0, #2
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED1A:
	adds r0, r1, #0
	ldr r1, [r4]
	movs r2, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225ED66
	movs r0, #3
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED2E:
	bl ov49_0225EC28
	movs r0, #4
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED38:
	bl ov49_0225EC30
	cmp r0, #1
	bne _0225ED66
	ldr r0, [r4]
	movs r1, #0
	bl ov49_0225D494
	ldr r0, [r4]
	bl ov49_0225D4E8
	movs r1, #1
	lsls r1, r1, #0xc
	ldr r0, [r4]
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov49_0225D4F0
	movs r0, #0
	strh r0, [r4, #4]
	pop {r4, pc}
_0225ED62:
	bl GF_AssertFail
_0225ED66:
	pop {r4, pc}
	thumb_func_end ov49_0225ECF0

	thumb_func_start ov49_0225ED68
ov49_0225ED68: @ 0x0225ED68
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov49_0225D4C8
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #1
	bl ov49_0225D214
	movs r2, #1
	ldr r1, [r5]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov49_0225D214
	ldr r0, [r5]
	movs r1, #1
	bl ov49_0225D494
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225ED68

	thumb_func_start ov49_0225ED98
ov49_0225ED98: @ 0x0225ED98
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #4]
	cmp r2, #4
	bhi _0225EE0A
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0225EDAE: @ jump table
	.2byte _0225EE0E - _0225EDAE - 2 @ case 0
	.2byte _0225EDB8 - _0225EDAE - 2 @ case 1
	.2byte _0225EDC2 - _0225EDAE - 2 @ case 2
	.2byte _0225EDD6 - _0225EDAE - 2 @ case 3
	.2byte _0225EDE0 - _0225EDAE - 2 @ case 4
_0225EDB8:
	bl ov49_0225EE10
	movs r0, #2
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EDC2:
	adds r0, r1, #0
	ldr r1, [r4]
	movs r2, #0
	bl ov49_0225D3BC
	cmp r0, #0
	bne _0225EE0E
	movs r0, #3
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EDD6:
	bl ov49_0225EC28
	movs r0, #4
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EDE0:
	bl ov49_0225EC30
	cmp r0, #1
	bne _0225EE0E
	ldr r0, [r4]
	movs r1, #0
	bl ov49_0225D494
	ldr r0, [r4]
	bl ov49_0225D4E8
	movs r1, #1
	lsls r1, r1, #0xc
	ldr r0, [r4]
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov49_0225D4F0
	movs r0, #0
	strh r0, [r4, #4]
	pop {r4, pc}
_0225EE0A:
	bl GF_AssertFail
_0225EE0E:
	pop {r4, pc}
	thumb_func_end ov49_0225ED98

	thumb_func_start ov49_0225EE10
ov49_0225EE10: @ 0x0225EE10
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl ov49_0225D4C8
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #1
	bl ov49_0225D214
	movs r2, #1
	ldr r1, [r5]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov49_0225D214
	ldr r1, [r5]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #1
	bl ov49_0225D214
	ldr r0, [r5]
	movs r1, #1
	bl ov49_0225D494
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0225EE10

	thumb_func_start ov49_0225EE4C
ov49_0225EE4C: @ 0x0225EE4C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x5c
	beq _0225EE60
	cmp r4, #0x5d
	beq _0225EE60
	bl GF_AssertFail
_0225EE60:
	adds r0, r5, #0
	bl ov49_0225D1EC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	subs r4, #0x5c
	lsls r2, r4, #2
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #4
	ldrsh r3, [r1, r0]
	ldr r0, _0225EEA8 @ =0x02269A74
	ldr r0, [r0, r2]
	adds r0, r3, r0
	strh r0, [r1, #4]
	movs r0, #6
	ldrsh r0, [r1, r0]
	mov r3, sp
	subs r3, r3, #4
	subs r0, #0xa
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_0225D1C4
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0225EEA8: .4byte 0x02269A74
	thumb_func_end ov49_0225EE4C

	thumb_func_start ov49_0225EEAC
ov49_0225EEAC: @ 0x0225EEAC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	movs r1, #0xbf
	adds r4, r0, #0
	adds r0, r6, #0
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0xbf
	movs r1, #0
	lsls r2, r2, #2
	adds r7, r0, #0
	blx FUN_020E5B44
	str r6, [r7]
	adds r5, r7, #0
	str r4, [r7, #4]
	movs r4, #0
	adds r5, #8
_0225EED2:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov49_0225F068
	adds r4, r4, #1
	adds r5, #0x24
	cmp r4, #0x14
	blt _0225EED2
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0
	adds r2, r6, #0
	bl ov49_0225F068
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225EEAC

	thumb_func_start ov49_0225EEF8
ov49_0225EEF8: @ 0x0225EEF8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #8
_0225EF02:
	adds r0, r5, #0
	bl ov49_0225F074
	adds r4, r4, #1
	adds r5, #0x24
	cmp r4, #0x14
	blt _0225EF02
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r6, r0
	bl ov49_0225F074
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225EEF8

	thumb_func_start ov49_0225EF24
ov49_0225EF24: @ 0x0225EF24
	ldr r3, _0225EF2C @ =ov49_0225F018
	movs r1, #0
	bx r3
	nop
_0225EF2C: .4byte ov49_0225F018
	thumb_func_end ov49_0225EF24

	thumb_func_start ov49_0225EF30
ov49_0225EF30: @ 0x0225EF30
	ldr r3, _0225EF38 @ =ov49_0225F018
	movs r1, #1
	bx r3
	nop
_0225EF38: .4byte ov49_0225F018
	thumb_func_end ov49_0225EF30

	thumb_func_start ov49_0225EF3C
ov49_0225EF3C: @ 0x0225EF3C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov49_0225EF3C

	thumb_func_start ov49_0225EF40
ov49_0225EF40: @ 0x0225EF40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	adds r4, r1, #0
	cmp r0, #0
	beq _0225EF50
	bl GF_AssertFail
_0225EF50:
	ldrh r0, [r5]
	adds r1, r4, #0
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r4, #0
	str r0, [r5, #8]
	blx FUN_020E5B44
	ldr r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225EF40

	thumb_func_start ov49_0225EF68
ov49_0225EF68: @ 0x0225EF68
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0225EF76
	bl GF_AssertFail
_0225EF76:
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225EF68

	thumb_func_start ov49_0225EF84
ov49_0225EF84: @ 0x0225EF84
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov49_0225EF84

	thumb_func_start ov49_0225EF88
ov49_0225EF88: @ 0x0225EF88
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225EF88

	thumb_func_start ov49_0225EF8C
ov49_0225EF8C: @ 0x0225EF8C
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225EF8C

	thumb_func_start ov49_0225EF90
ov49_0225EF90: @ 0x0225EF90
	ldr r1, [r0, #0x10]
	adds r1, r1, #1
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov49_0225EF90

	thumb_func_start ov49_0225EF98
ov49_0225EF98: @ 0x0225EF98
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _0225EFAA
	bl GF_AssertFail
_0225EFAA:
	cmp r4, #0x14
	blo _0225EFB2
	bl GF_AssertFail
_0225EFB2:
	movs r0, #0x24
	adds r5, #8
	muls r0, r4, r0
	adds r0, r5, r0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov49_0225F0D8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225EF98

	thumb_func_start ov49_0225EFC4
ov49_0225EFC4: @ 0x0225EFC4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _0225EFD6
	bl GF_AssertFail
_0225EFD6:
	cmp r4, #0x14
	blo _0225EFDE
	bl GF_AssertFail
_0225EFDE:
	movs r0, #0x24
	adds r5, #8
	muls r0, r4, r0
	adds r0, r5, r0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov49_0225F110
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225EFC4

	thumb_func_start ov49_0225EFF0
ov49_0225EFF0: @ 0x0225EFF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _0225F000
	bl GF_AssertFail
_0225F000:
	cmp r4, #0x14
	blo _0225F008
	bl GF_AssertFail
_0225F008:
	movs r0, #0x24
	adds r5, #8
	muls r0, r4, r0
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov49_0225F10C
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_0225EFF0

	thumb_func_start ov49_0225F018
ov49_0225F018: @ 0x0225F018
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xb6
	lsls r0, r0, #2
	adds r0, r7, r0
	str r1, [sp]
	bl ov49_0225F180
	cmp r0, #1
	bne _0225F03E
	movs r0, #0xb6
	lsls r0, r0, #2
	ldr r2, [sp]
	adds r0, r7, r0
	adds r1, r7, #0
	movs r3, #0
	bl ov49_0225F098
	pop {r3, r4, r5, r6, r7, pc}
_0225F03E:
	adds r6, r7, #0
	adds r6, #8
	movs r4, #0
	adds r5, r6, #0
_0225F046:
	adds r0, r6, #0
	bl ov49_0225F180
	cmp r0, #1
	bne _0225F05C
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	adds r3, r4, #0
	bl ov49_0225F098
_0225F05C:
	adds r4, r4, #1
	adds r6, #0x24
	adds r5, #0x24
	cmp r4, #0x14
	blt _0225F046
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F018

	thumb_func_start ov49_0225F068
ov49_0225F068: @ 0x0225F068
	strh r2, [r0]
	movs r2, #1
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225F068

	thumb_func_start ov49_0225F074
ov49_0225F074: @ 0x0225F074
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0225F082
	bl FUN_0201AB0C
_0225F082:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0225F08C
	bl FUN_0201AB0C
_0225F08C:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x24
	blx FUN_020E5B44
	pop {r4, pc}
	thumb_func_end ov49_0225F074

	thumb_func_start ov49_0225F098
ov49_0225F098: @ 0x0225F098
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #2]
	adds r6, r1, #0
	adds r7, r3, #0
	cmp r0, #0
	beq _0225F0D6
	cmp r2, #0
	beq _0225F0B0
	cmp r2, #1
	beq _0225F0B6
	b _0225F0BC
_0225F0B0:
	ldr r0, [r5, #4]
	ldr r4, [r0]
	b _0225F0C0
_0225F0B6:
	ldr r0, [r5, #4]
	ldr r4, [r0, #4]
	b _0225F0C0
_0225F0BC:
	bl GF_AssertFail
_0225F0C0:
	cmp r4, #0
	beq _0225F0D6
	ldr r1, [r6, #4]
	adds r0, r5, #0
	adds r2, r7, #0
	blx r4
	cmp r0, #1
	bne _0225F0D6
	adds r0, r5, #0
	bl ov49_0225F148
_0225F0D6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F098

	thumb_func_start ov49_0225F0D8
ov49_0225F0D8: @ 0x0225F0D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov49_0225F170
	cmp r0, #1
	beq _0225F0EE
	bl GF_AssertFail
_0225F0EE:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0225F0F8
	bl GF_AssertFail
_0225F0F8:
	movs r3, #0
	adds r0, r5, #4
	adds r1, r4, #0
	adds r2, r6, #0
	str r3, [sp]
	bl ov49_0225F190
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225F0D8

	thumb_func_start ov49_0225F10C
ov49_0225F10C: @ 0x0225F10C
	strb r1, [r0, #2]
	bx lr
	thumb_func_end ov49_0225F10C

	thumb_func_start ov49_0225F110
ov49_0225F110: @ 0x0225F110
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov49_0225F170
	cmp r0, #1
	beq _0225F126
	bl GF_AssertFail
_0225F126:
	adds r2, r5, #0
	adds r3, r5, #4
	adds r2, #0x14
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r3, #0
	adds r0, r5, #4
	adds r1, r4, #0
	adds r2, r6, #0
	str r3, [sp]
	bl ov49_0225F190
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_0225F110

	thumb_func_start ov49_0225F148
ov49_0225F148: @ 0x0225F148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0225F156
	bl GF_AssertFail
_0225F156:
	adds r3, r4, #0
	adds r3, #0x14
	adds r2, r4, #4
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r4, #0x14
	adds r0, r4, #0
	bl ov49_0225F19C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225F148

	thumb_func_start ov49_0225F170
ov49_0225F170: @ 0x0225F170
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0225F17A
	movs r0, #1
	bx lr
_0225F17A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225F170

	thumb_func_start ov49_0225F180
ov49_0225F180: @ 0x0225F180
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0225F18A
	movs r0, #1
	bx lr
_0225F18A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225F180

	thumb_func_start ov49_0225F190
ov49_0225F190: @ 0x0225F190
	str r1, [r0]
	ldr r1, [sp]
	str r3, [r0, #0xc]
	str r1, [r0, #4]
	str r2, [r0, #8]
	bx lr
	thumb_func_end ov49_0225F190

	thumb_func_start ov49_0225F19C
ov49_0225F19C: @ 0x0225F19C
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #0xc]
	str r1, [r0, #4]
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov49_0225F19C

	thumb_func_start ov49_0225F1A8
ov49_0225F1A8: @ 0x0225F1A8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov49_02259FEC
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_0225A010
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov49_0225A02C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov49_02259FE8
	movs r1, #1
	bl FUN_0222A5E8
	ldrh r0, [r4, #6]
	cmp r0, #4
	blo _0225F1D8
	bl GF_AssertFail
_0225F1D8:
	ldrh r2, [r4, #6]
	ldr r3, _0225F1EC @ =0x02269BE0
	adds r0, r7, #0
	lsls r2, r2, #3
	adds r2, r3, r2
	adds r1, r6, #0
	movs r3, #0
	bl ov49_0225EF98
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225F1EC: .4byte 0x02269BE0
	thumb_func_end ov49_0225F1A8

	thumb_func_start ov49_0225F1F0
ov49_0225F1F0: @ 0x0225F1F0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl ov49_0225A02C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_0225A010
	ldr r7, _0225F220 @ =0x02269B78
	adds r6, r0, #0
	movs r4, #0
_0225F206:
	cmp r5, r4
	beq _0225F216
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r3, #0
	bl ov49_0225EF98
_0225F216:
	adds r4, r4, #1
	cmp r4, #0x14
	blt _0225F206
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F220: .4byte 0x02269B78
	thumb_func_end ov49_0225F1F0

	thumb_func_start ov49_0225F224
ov49_0225F224: @ 0x0225F224
	cmp r0, #3
	bhi _0225F24A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F234: @ jump table
	.2byte _0225F23C - _0225F234 - 2 @ case 0
	.2byte _0225F240 - _0225F234 - 2 @ case 1
	.2byte _0225F244 - _0225F234 - 2 @ case 2
	.2byte _0225F248 - _0225F234 - 2 @ case 3
_0225F23C:
	movs r1, #0x40
	b _0225F24A
_0225F240:
	movs r1, #0x80
	b _0225F24A
_0225F244:
	movs r1, #0x20
	b _0225F24A
_0225F248:
	movs r1, #0x10
_0225F24A:
	ldr r0, _0225F25C @ =0x021D110C
	ldr r0, [r0, #0x44]
	tst r0, r1
	beq _0225F256
	movs r0, #1
	bx lr
_0225F256:
	movs r0, #0
	bx lr
	nop
_0225F25C: .4byte 0x021D110C
	thumb_func_end ov49_0225F224

	thumb_func_start ov49_0225F260
ov49_0225F260: @ 0x0225F260
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	adds r7, r0, #0
	str r2, [sp, #4]
	adds r4, r3, #0
	ldr r5, [sp, #0x28]
	bl ov49_0225EF84
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl ov49_0225A010
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	movs r2, #0
	cmp r0, #3
	beq _0225F2F4
	adds r6, r4, #0
	adds r1, r2, #0
_0225F288:
	adds r3, r1, #0
_0225F28A:
	ldrb r0, [r6, r3]
	cmp r0, #0xff
	beq _0225F2EA
	cmp r5, r0
	bne _0225F2E4
	movs r0, #0x18
	adds r5, r2, #0
	muls r5, r0, r5
	adds r6, r4, r5
	ldr r0, [r6, #8]
	cmp r0, #0
	beq _0225F2AA
	cmp r0, #1
	beq _0225F2C2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225F2AA:
	adds r0, r7, #0
	bl ov49_0225EF68
	adds r2, r6, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r2, #0xc
	movs r3, #0
	bl ov49_0225EF98
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225F2C2:
	ldr r7, [r6, #0x14]
	cmp r7, #0
	beq _0225F2D2
	ldrb r3, [r3, r6]
	ldr r0, [sp, #0xc]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	blx r7
_0225F2D2:
	adds r2, r4, r5
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r2, #0xc
	movs r3, #0
	bl ov49_0225EFC4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225F2E4:
	adds r3, r3, #1
	cmp r3, #8
	blt _0225F28A
_0225F2EA:
	adds r6, #0x18
	ldr r0, [r6, #8]
	adds r2, r2, #1
	cmp r0, #3
	bne _0225F288
_0225F2F4:
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F260

	thumb_func_start ov49_0225F2FC
ov49_0225F2FC: @ 0x0225F2FC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov49_02259FF0
	adds r1, r4, #0
	bl ov49_02258C28
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_0225A008
	adds r5, r0, #0
	adds r0, r4, #0
	add r1, sp, #0
	bl ov49_02259154
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r5, #0
	bl ov49_0225CC28
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_0225F2FC

	thumb_func_start ov49_0225F334
ov49_0225F334: @ 0x0225F334
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	bl ov49_02259FF0
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_0225A008
	str r0, [sp, #4]
	ldr r3, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov49_02258C5C
	adds r5, r0, #0
	ldr r3, [sp, #0x20]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02258E7C
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl ov49_0225CC40
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_0225F334

	thumb_func_start ov49_0225F374
ov49_0225F374: @ 0x0225F374
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4]
	strb r0, [r4, #4]
	movs r0, #1
	strb r0, [r4, #5]
	bl FUN_0201FDB8
	movs r1, #3
	ands r0, r1
	strb r0, [r4, #6]
	movs r0, #1
	strb r0, [r4, #7]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_0225F374

	thumb_func_start ov49_0225F394
ov49_0225F394: @ 0x0225F394
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0225F3A8
	cmp r0, #1
	beq _0225F3AE
	cmp r0, #2
	beq _0225F3C0
	b _0225F422
_0225F3A8:
	movs r0, #0
	str r0, [r4]
	b _0225F422
_0225F3AE:
	ldrb r0, [r4, #6]
	subs r0, r0, #1
	cmp r0, #0
	ble _0225F3BA
	strb r0, [r4, #6]
	b _0225F422
_0225F3BA:
	movs r0, #2
	strb r0, [r4, #5]
	b _0225F422
_0225F3C0:
	movs r0, #4
	ldrsb r1, [r4, r0]
	movs r3, #0
	adds r1, r1, #1
	strb r1, [r4, #4]
	ldrsb r1, [r4, r0]
	ldr r0, _0225F428 @ =0x00007FFF
	adds r2, r1, #0
	muls r2, r0, r2
	asrs r0, r2, #1
	lsrs r0, r0, #0x1e
	adds r0, r2, r0
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0225F42C @ =0x021094DC
	movs r2, #6
	ldrsh r0, [r0, r1]
	lsls r2, r2, #0xc
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r4]
	movs r0, #4
	ldrsb r0, [r4, r0]
	cmp r0, #4
	blt _0225F422
	ldrb r0, [r4, #7]
	cmp r0, #1
	bne _0225F420
	strb r3, [r4, #4]
	movs r0, #1
	strb r0, [r4, #5]
	bl FUN_0201FDB8
	movs r1, #3
	ands r0, r1
	strb r0, [r4, #6]
	b _0225F422
_0225F420:
	strb r3, [r4, #5]
_0225F422:
	ldr r0, [r4]
	pop {r4, pc}
	nop
_0225F428: .4byte 0x00007FFF
_0225F42C: .4byte 0x021094DC
	thumb_func_end ov49_0225F394

	thumb_func_start ov49_0225F430
ov49_0225F430: @ 0x0225F430
	movs r1, #0
	strb r1, [r0, #7]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225F430

	thumb_func_start ov49_0225F438
ov49_0225F438: @ 0x0225F438
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0225F442
	movs r0, #1
	bx lr
_0225F442:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_0225F438

	thumb_func_start ov49_0225F448
ov49_0225F448: @ 0x0225F448
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r6, r0, #0
	adds r4, r2, #0
	adds r0, r5, #0
	bl ov49_02259FF0
	adds r1, r4, #0
	adds r7, r0, #0
	bl ov49_02258D70
	str r0, [sp]
	adds r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #4]
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _0225F47E
	cmp r0, #1
	beq _0225F4A2
	cmp r0, #2
	beq _0225F4B8
	b _0225F510
_0225F47E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225A56C
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225EF8C
	ldr r0, [sp, #4]
	bl FUN_0222A53C
	cmp r4, r0
	bne _0225F510
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A53C
	b _0225F510
_0225F4A2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_0225A5AC
	cmp r0, #1
	bne _0225F510
	adds r0, r6, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _0225F510
_0225F4B8:
	ldr r0, [sp, #4]
	bl FUN_0222A53C
	cmp r4, r0
	bne _0225F4CE
	ldr r1, [sp]
	adds r0, r7, #0
	movs r2, #1
	bl ov49_02258EEC
	b _0225F504
_0225F4CE:
	adds r0, r5, #0
	bl ov49_0225A4F0
	cmp r0, #1
	bne _0225F4EE
	adds r0, r5, #0
	bl ov49_0225A4E0
	cmp r4, r0
	beq _0225F4F8
	ldr r1, [sp]
	adds r0, r7, #0
	movs r2, #2
	bl ov49_02258EEC
	b _0225F4F8
_0225F4EE:
	ldr r1, [sp]
	adds r0, r7, #0
	movs r2, #2
	bl ov49_02258EEC
_0225F4F8:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov49_0225A04C
_0225F504:
	adds r0, r5, #0
	bl ov49_0225A54C
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F510:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0225F448

	thumb_func_start ov49_0225F518
ov49_0225F518: @ 0x0225F518
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	str r2, [sp]
	bl ov49_02259FE8
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov49_02259FF0
	str r0, [sp, #8]
	bl ov49_02258DAC
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov49_0225EF84
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x16
	bhi _0225F602
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225F556: @ jump table
	.2byte _0225F584 - _0225F556 - 2 @ case 0
	.2byte _0225F5C4 - _0225F556 - 2 @ case 1
	.2byte _0225F5FA - _0225F556 - 2 @ case 2
	.2byte _0225F614 - _0225F556 - 2 @ case 3
	.2byte _0225F62E - _0225F556 - 2 @ case 4
	.2byte _0225F648 - _0225F556 - 2 @ case 5
	.2byte _0225F662 - _0225F556 - 2 @ case 6
	.2byte _0225F67C - _0225F556 - 2 @ case 7
	.2byte _0225F692 - _0225F556 - 2 @ case 8
	.2byte _0225F6B2 - _0225F556 - 2 @ case 9
	.2byte _0225F6E4 - _0225F556 - 2 @ case 10
	.2byte _0225F758 - _0225F556 - 2 @ case 11
	.2byte _0225F79E - _0225F556 - 2 @ case 12
	.2byte _0225F7D0 - _0225F556 - 2 @ case 13
	.2byte _0225F9FA - _0225F556 - 2 @ case 14
	.2byte _0225F844 - _0225F556 - 2 @ case 15
	.2byte _0225F88A - _0225F556 - 2 @ case 16
	.2byte _0225F8E2 - _0225F556 - 2 @ case 17
	.2byte _0225F902 - _0225F556 - 2 @ case 18
	.2byte _0225F950 - _0225F556 - 2 @ case 19
	.2byte _0225F97A - _0225F556 - 2 @ case 20
	.2byte _0225F9AE - _0225F556 - 2 @ case 21
	.2byte _0225F9C2 - _0225F556 - 2 @ case 22
_0225F584:
	adds r0, r6, #0
	movs r1, #0x2c
	bl ov49_0225EF40
	adds r1, r5, #0
	adds r4, r0, #0
	bl ov49_022614CC
	ldr r0, [sp, #4]
	bl FUN_0222A4D0
	ldr r0, [sp, #4]
	bl FUN_0222B1B4
	strh r0, [r4, #2]
	ldrh r1, [r4, #2]
	ldr r0, [sp, #4]
	bl FUN_0222A72C
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov49_0225F2FC
	adds r1, r0, #0
	ldr r0, [sp, #8]
	movs r2, #4
	bl ov49_02258EEC
	adds r0, r6, #0
	bl ov49_0225EF90
	b _0225F9FA
_0225F5C4:
	adds r0, r5, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225F602
	adds r0, r7, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _0225F602
	ldr r0, [sp, #8]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_02258EEC
	adds r0, r5, #0
	bl ov49_0225A008
	adds r1, r7, #0
	bl ov49_0225CC40
	movs r0, #0x10
	str r0, [r4, #4]
	adds r0, r6, #0
	bl ov49_0225EF90
	b _0225F9FA
_0225F5FA:
	ldr r0, [r4, #4]
	subs r0, r0, #1
	str r0, [r4, #4]
	beq _0225F604
_0225F602:
	b _0225F9FA
_0225F604:
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A018
	adds r0, r6, #0
	bl ov49_0225EF90
	b _0225F9FA
_0225F614:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	movs r2, #2
	movs r3, #0
	bl ov49_02258E7C
	movs r0, #4
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F62E:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	movs r2, #2
	movs r3, #0
	bl ov49_02258E7C
	movs r0, #5
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F648:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	movs r2, #1
	movs r3, #3
	bl ov49_02258E7C
	movs r0, #6
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F662:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	movs r2, #2
	movs r3, #3
	bl ov49_02258E7C
	movs r0, #8
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _0225F9FA
_0225F67C:
	adds r0, r7, #0
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225F766
	ldrh r1, [r4]
	adds r0, r6, #0
	bl ov49_0225EF8C
	b _0225F9FA
_0225F692:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x10
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F6B2:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #5
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r4, #8
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A1F4
	adds r0, r6, #0
	movs r1, #0xa
	bl ov49_0225EF8C
	b _0225F9FA
_0225F6E4:
	adds r0, r5, #0
	movs r7, #0
	bl ov49_0225A1D4
	adds r2, r0, #0
	beq _0225F704
	subs r0, r7, #2
	cmp r2, r0
	beq _0225F6FE
	adds r0, r0, #1
	cmp r2, r0
	beq _0225F718
	b _0225F70C
_0225F6FE:
	ldr r0, _0225FA00 @ =0x000005DC
	bl FUN_0200604C
_0225F704:
	movs r0, #0
	strh r0, [r4, #0x28]
	movs r7, #1
	b _0225F718
_0225F70C:
	adds r0, r5, #0
	movs r1, #0
	strh r2, [r4, #0x28]
	movs r7, #1
	bl ov49_0225A40C
_0225F718:
	cmp r7, #1
	bne _0225F766
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _0225F74E
	adds r0, r5, #0
	movs r1, #1
	movs r2, #8
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A264
	adds r0, r6, #0
	movs r1, #0xb
	bl ov49_0225EF8C
	b _0225F9FA
_0225F74E:
	adds r0, r6, #0
	movs r1, #0x11
	bl ov49_0225EF8C
	b _0225F9FA
_0225F758:
	adds r0, r5, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _0225F768
	cmp r0, #1
	beq _0225F78E
_0225F766:
	b _0225F9FA
_0225F768:
	adds r0, r5, #0
	bl ov49_0225A2F8
	adds r0, r6, #0
	movs r1, #0xc
	bl ov49_0225EF8C
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x2a]
	ldr r0, [sp, #4]
	bl FUN_0222A770
	adds r0, r5, #0
	bl ov49_0225A490
	ldr r0, _0225FA04 @ =0x000005E5
	bl FUN_0200604C
	b _0225F9FA
_0225F78E:
	adds r0, r5, #0
	bl ov49_0225A2F8
	adds r0, r6, #0
	movs r1, #9
	bl ov49_0225EF8C
	b _0225F9FA
_0225F79E:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xa
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r4, #8
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A1F4
	adds r0, r6, #0
	movs r1, #0xd
	bl ov49_0225EF8C
	b _0225F9FA
_0225F7D0:
	adds r0, r5, #0
	movs r7, #0
	bl ov49_0225A1D4
	adds r2, r0, #0
	beq _0225F7F0
	subs r0, r7, #2
	cmp r2, r0
	beq _0225F7EA
	adds r0, r0, #1
	cmp r2, r0
	beq _0225F804
	b _0225F7F8
_0225F7EA:
	ldr r0, _0225FA00 @ =0x000005DC
	bl FUN_0200604C
_0225F7F0:
	movs r0, #0
	strh r0, [r4, #0x2a]
	movs r7, #1
	b _0225F804
_0225F7F8:
	adds r0, r5, #0
	movs r1, #0
	strh r2, [r4, #0x2a]
	movs r7, #1
	bl ov49_0225A40C
_0225F804:
	cmp r7, #1
	bne _0225F852
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	ldrh r0, [r4, #0x2a]
	cmp r0, #0
	beq _0225F83A
	adds r0, r5, #0
	movs r1, #1
	movs r2, #8
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A264
	adds r0, r6, #0
	movs r1, #0xf
	bl ov49_0225EF8C
	b _0225F9FA
_0225F83A:
	adds r0, r6, #0
	movs r1, #0x13
	bl ov49_0225EF8C
	b _0225F9FA
_0225F844:
	adds r0, r5, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _0225F854
	cmp r0, #1
	beq _0225F87A
_0225F852:
	b _0225F9FA
_0225F854:
	adds r0, r5, #0
	bl ov49_0225A2F8
	adds r0, r6, #0
	movs r1, #0x14
	bl ov49_0225EF8C
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x2a]
	ldr r0, [sp, #4]
	bl FUN_0222A770
	adds r0, r5, #0
	bl ov49_0225A490
	ldr r0, _0225FA04 @ =0x000005E5
	bl FUN_0200604C
	b _0225F9FA
_0225F87A:
	adds r0, r5, #0
	bl ov49_0225A2F8
	adds r0, r6, #0
	movs r1, #0xc
	bl ov49_0225EF8C
	b _0225F9FA
_0225F88A:
	ldr r0, _0225FA08 @ =0x000005BF
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov49_0225A530
	ldr r1, [sp]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrh r1, [r4, #2]
	adds r0, r5, #0
	movs r2, #1
	bl ov49_0225A39C
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl FUN_0222AB28
	cmp r0, #0
	bne _0225F8C2
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A30C
	b _0225F8CC
_0225F8C2:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x7c
	bl ov49_0225A30C
_0225F8CC:
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x12
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F8E2:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #2
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x16
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F902:
	ldr r0, _0225FA08 @ =0x000005BF
	bl FUN_02006184
	cmp r0, #0
	bne _0225F9FA
	ldr r0, _0225FA0C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0225F9FA
	ldr r0, _0225FA00 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #4
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #9
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x2a]
	ldr r0, [sp, #4]
	bl FUN_0222A770
	ldr r1, [sp]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A428
	b _0225F9FA
_0225F950:
	ldrh r2, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A40C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xc
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x11
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F97A:
	ldrh r2, [r4, #0x28]
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A40C
	ldrh r2, [r4, #0x2a]
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A40C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0xb
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x11
	strh r0, [r4]
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	b _0225F9FA
_0225F9AE:
	adds r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225F9FA
	ldrh r1, [r4]
	adds r0, r6, #0
	bl ov49_0225EF8C
	b _0225F9FA
_0225F9C2:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r5, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02261540
	adds r0, r6, #0
	bl ov49_0225EF68
	adds r0, r5, #0
	bl ov49_0225A010
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_0225A02C
	adds r1, r0, #0
	ldr r2, _0225FA10 @ =0x02269B38
	adds r0, r4, #0
	movs r3, #0
	bl ov49_0225EF98
_0225F9FA:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225FA00: .4byte 0x000005DC
_0225FA04: .4byte 0x000005E5
_0225FA08: .4byte 0x000005BF
_0225FA0C: .4byte 0x021D110C
_0225FA10: .4byte 0x02269B38
	thumb_func_end ov49_0225F518

	thumb_func_start ov49_0225FA14
ov49_0225FA14: @ 0x0225FA14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	str r2, [sp, #4]
	bl ov49_02259FE8
	str r0, [sp, #8]
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bls _0225FA48
	b _0225FB52
_0225FA48:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225FA54: @ jump table
	.2byte _0225FA60 - _0225FA54 - 2 @ case 0
	.2byte _0225FA8C - _0225FA54 - 2 @ case 1
	.2byte _0225FAC2 - _0225FA54 - 2 @ case 2
	.2byte _0225FAF2 - _0225FA54 - 2 @ case 3
	.2byte _0225FB16 - _0225FA54 - 2 @ case 4
	.2byte _0225FB2E - _0225FA54 - 2 @ case 5
_0225FA60:
	movs r0, #1
	str r0, [sp]
	ldrh r2, [r6]
	ldrh r3, [r6, #2]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov49_0225F334
	bl FUN_0222D844
	cmp r0, #0
	bne _0225FA7C
	bl FUN_0222EB94
_0225FA7C:
	ldr r0, [sp, #8]
	movs r1, #0
	bl FUN_0222A520
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FA8C:
	bl FUN_0222D844
	cmp r0, #0
	bne _0225FA9C
	bl FUN_0222EBC4
	cmp r0, #0
	beq _0225FB52
_0225FA9C:
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225FB52
	adds r0, r5, #0
	bl ov49_0225EF90
	ldrh r3, [r6, #4]
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	movs r2, #2
	bl ov49_02258EAC
	b _0225FB52
_0225FAC2:
	adds r0, r7, #0
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225FB52
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A018
	ldr r0, [sp, #8]
	bl FUN_0222A4B8
	cmp r0, #1
	bne _0225FAE8
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FAE8:
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _0225FB52
_0225FAF2:
	ldrh r1, [r6, #8]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x15
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FB16:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225FB52
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FB52
_0225FB2E:
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r4, #0
	bl ov49_0225A010
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_0225A02C
	adds r1, r0, #0
	ldr r2, _0225FB58 @ =0x02269B38
	adds r0, r5, #0
	movs r3, #0
	bl ov49_0225EF98
_0225FB52:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FB58: .4byte 0x02269B38
	thumb_func_end ov49_0225FA14

	thumb_func_start ov49_0225FB5C
ov49_0225FB5C: @ 0x0225FB5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	str r2, [sp, #4]
	bl ov49_0225A010
	str r0, [sp, #8]
	adds r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp, #0x10]
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bls _0225FB98
	b _0225FC9A
_0225FB98:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225FBA4: @ jump table
	.2byte _0225FBB0 - _0225FBA4 - 2 @ case 0
	.2byte _0225FBE2 - _0225FBA4 - 2 @ case 1
	.2byte _0225FC08 - _0225FBA4 - 2 @ case 2
	.2byte _0225FC3A - _0225FBA4 - 2 @ case 3
	.2byte _0225FC5E - _0225FBA4 - 2 @ case 4
	.2byte _0225FC76 - _0225FBA4 - 2 @ case 5
_0225FBB0:
	movs r0, #1
	str r0, [sp]
	ldrh r2, [r6]
	ldrh r3, [r6, #2]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov49_0225F334
	adds r0, r5, #0
	bl ov49_0225EF90
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, _0225FCA0 @ =0x02269B68
	movs r3, #0
	bl ov49_0225EFC4
	ldr r0, [sp, #0x10]
	movs r1, #0
	bl FUN_0222A4C8
	ldr r0, [sp, #0x10]
	bl FUN_0222A4D0
	b _0225FC9A
_0225FBE2:
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225FC9A
	adds r0, r5, #0
	bl ov49_0225EF90
	ldrh r3, [r6, #4]
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	movs r2, #2
	bl ov49_02258EAC
	b _0225FC9A
_0225FC08:
	adds r0, r7, #0
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225FC9A
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A018
	ldr r0, [sp, #0x10]
	bl FUN_0222A424
	cmp r0, #1
	bne _0225FC30
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _0225FC9A
_0225FC30:
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _0225FC9A
_0225FC3A:
	ldrh r1, [r6, #8]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #8
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FC9A
_0225FC5E:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225FC9A
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FC9A
_0225FC76:
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r4, #0
	bl ov49_0225A010
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_0225A02C
	adds r1, r0, #0
	ldr r2, _0225FCA4 @ =0x02269B38
	adds r0, r5, #0
	movs r3, #0
	bl ov49_0225EF98
_0225FC9A:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225FCA0: .4byte 0x02269B68
_0225FCA4: .4byte 0x02269B38
	thumb_func_end ov49_0225FB5C

	thumb_func_start ov49_0225FCA8
ov49_0225FCA8: @ 0x0225FCA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	str r2, [sp, #4]
	bl ov49_02259FE8
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov49_02259FEC
	str r0, [sp, #8]
	adds r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bhi _0225FDC2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225FCE6: @ jump table
	.2byte _0225FCF2 - _0225FCE6 - 2 @ case 0
	.2byte _0225FD16 - _0225FCE6 - 2 @ case 1
	.2byte _0225FD3C - _0225FCE6 - 2 @ case 2
	.2byte _0225FD6C - _0225FCE6 - 2 @ case 3
	.2byte _0225FD86 - _0225FCE6 - 2 @ case 4
	.2byte _0225FD9E - _0225FCE6 - 2 @ case 5
_0225FCF2:
	movs r0, #1
	str r0, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #8]
	ldrh r2, [r2]
	ldrh r3, [r3, #2]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov49_0225F334
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0222A520
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD16:
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov49_0225A030
	cmp r0, #0
	bne _0225FDC2
	adds r0, r5, #0
	bl ov49_0225EF90
	ldrh r3, [r7, #4]
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	movs r2, #2
	bl ov49_02258EAC
	b _0225FDC2
_0225FD3C:
	adds r0, r6, #0
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _0225FDC2
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A018
	adds r0, r7, #0
	bl FUN_0222A4B8
	cmp r0, #1
	bne _0225FD62
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD62:
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _0225FDC2
_0225FD6C:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x5b
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD86:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _0225FDC2
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0225FDC2
_0225FD9E:
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r4, #0
	bl ov49_0225A010
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_0225A02C
	adds r1, r0, #0
	ldr r2, _0225FDC8 @ =0x02269B38
	adds r0, r5, #0
	movs r3, #0
	bl ov49_0225EF98
_0225FDC2:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225FDC8: .4byte 0x02269B38
	thumb_func_end ov49_0225FCA8

	thumb_func_start ov49_0225FDCC
ov49_0225FDCC: @ 0x0225FDCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	str r0, [sp, #4]
	adds r5, r1, #0
	adds r7, r2, #0
	bl ov49_0225EF84
	str r0, [sp, #0x30]
	ldr r0, [sp, #4]
	bl ov49_0225EF88
	cmp r0, #0
	beq _0225FDEC
	cmp r0, #1
	beq _0225FDFC
	b _0226020A
_0225FDEC:
	ldr r0, [sp, #4]
	movs r1, #4
	bl ov49_0225EF40
	ldr r0, [sp, #4]
	bl ov49_0225EF90
	b _0226020A
_0225FDFC:
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A53C
	adds r0, r5, #0
	bl ov49_0225A010
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl ov49_02259FF0
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_0225A000
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl ov49_02259FF8
	str r0, [sp, #0x20]
	adds r0, r4, #0
	bl ov49_02258DB0
	adds r6, r0, #0
	beq _0225FE7E
	ldr r0, [sp, #0x18]
	bl FUN_0222A330
	cmp r0, #0
	bne _0225FE6A
	ldr r0, [sp, #0x18]
	bl FUN_0222A3A0
	cmp r0, #1
	bne _0225FE6A
	ldr r0, [sp, #0x18]
	bl FUN_0222A2F8
	cmp r0, #0
	bne _0225FE6A
	adds r0, r6, #0
	bl ov49_02258F3C
	cmp r0, #9
	beq _0225FE7E
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #9
	bl ov49_02258EEC
	b _0225FE7E
_0225FE6A:
	adds r0, r6, #0
	bl ov49_02258F3C
	cmp r0, #0
	beq _0225FE7E
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl ov49_02258EEC
_0225FE7E:
	adds r0, r4, #0
	bl ov49_02258DAC
	str r0, [sp, #0x28]
	movs r1, #5
	bl ov49_02258E60
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	movs r1, #6
	bl ov49_02258E60
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	bl ov49_02258E34
	add r1, sp, #0x40
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
	ldr r1, [sp, #8]
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl FUN_02228270
	add r2, sp, #0x40
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	movs r1, #0xc
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r1, [r2, r1]
	ldr r0, [sp, #0x1c]
	asrs r3, r1, #3
	lsrs r3, r3, #0x1c
	adds r3, r1, r3
	lsls r1, r3, #0xc
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	lsrs r1, r1, #0x10
	asrs r3, r2, #3
	lsrs r3, r3, #0x1c
	adds r3, r2, r3
	lsls r2, r3, #0xc
	lsrs r2, r2, #0x10
	bl ov49_022589C4
	str r0, [sp, #0x24]
	add r0, sp, #0x40
	movs r1, #0xa
	ldrsh r2, [r0, r1]
	asrs r1, r2, #3
	lsrs r1, r1, #0x1c
	adds r1, r2, r1
	asrs r1, r1, #4
	str r1, [sp, #0x10]
	movs r1, #8
	ldrsh r1, [r0, r1]
	ldr r2, [sp, #0x10]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	lsls r2, r2, #0x10
	lsls r1, r1, #0x10
	ldr r0, [sp, #0x1c]
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov49_022589C4
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov49_0225A4E0
	adds r1, r0, #0
	cmp r1, r7
	beq _0225FF48
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov49_0225A084
	cmp r0, #0
	beq _0225FF48
	adds r0, r5, #0
	bl ov49_0225A4D0
_0225FF48:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _0225FF94
	adds r0, r5, #0
	bl ov49_0225A500
	cmp r0, #1
	bne _0225FF60
	ldr r0, [sp, #0x2c]
	subs r0, r0, #1
	cmp r0, #2
	bls _0225FF62
_0225FF60:
	b _0226020A
_0225FF62:
	adds r0, r5, #0
	bl ov49_0225A4E0
	adds r1, r0, #0
	cmp r1, r7
	beq _0225FF8C
	adds r0, r4, #0
	bl ov49_02258D70
	adds r6, r0, #0
	beq _0225FF8C
	bl ov49_02258F3C
	cmp r0, #0
	bne _0225FF8C
	ldr r2, [sp, #0x30]
	adds r0, r4, #0
	ldr r2, [r2]
	adds r1, r6, #0
	bl ov49_02258EEC
_0225FF8C:
	adds r0, r5, #0
	bl ov49_0225A4D0
	b _0226020A
_0225FF94:
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A53C
	ldr r0, [sp, #0x24]
	bl ov49_02258A30
	cmp r0, #1
	bne _0225FFDA
	ldr r0, [sp, #0x24]
	ldr r3, _02260210 @ =0x02269D20
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r7, #0
	bl ov49_0225F260
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_02258EEC
	ldr r1, [sp, #0x24]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov49_0225A03C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225FFDA:
	adds r0, r5, #0
	bl ov49_0225A55C
	cmp r0, #1
	bne _02260008
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_02258EEC
	ldr r0, [sp, #0x14]
	ldr r2, _02260214 @ =0x02269B80
	adds r1, r7, #0
	movs r3, #0
	bl ov49_0225EFC4
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260008:
	ldr r0, [sp, #0x18]
	bl FUN_0222B00C
	cmp r0, #0
	beq _02260036
	ldr r0, [sp, #0x14]
	ldr r2, _02260218 @ =0x02269B70
	adds r1, r7, #0
	movs r3, #0
	bl ov49_0225EFC4
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_02258EEC
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260036:
	ldr r0, _0226021C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02260120
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	bl ov49_02258F40
	str r0, [sp, #0x34]
	cmp r0, #0
	beq _022600A6
	movs r1, #5
	bl ov49_02258E60
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x34]
	movs r1, #4
	bl ov49_02258E60
	adds r1, r0, #0
	cmp r1, #0xfe
	beq _022600A6
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov49_0225A064
	ldr r1, [sp, #0x38]
	cmp r1, #0
	bne _022600A6
	cmp r0, #0
	bne _022600A6
	ldr r0, [sp, #0x14]
	ldr r2, _02260220 @ =0x02269B60
	adds r1, r7, #0
	movs r3, #0
	bl ov49_0225EFC4
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_02258EEC
	ldr r1, [sp, #0x34]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_02258EEC
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022600A6:
	adds r0, r6, #0
	bl ov49_02258A90
	cmp r0, #1
	bne _022600E6
	ldr r0, [sp, #0x28]
	movs r1, #6
	bl ov49_02258E60
	cmp r0, #0
	bne _022600E6
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, [sp, #0x20]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov49_0225E58C
	lsls r1, r6, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov49_0225A03C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022600E6:
	adds r0, r6, #0
	bl ov49_02258A70
	cmp r0, #1
	bne _02260120
	ldr r0, [sp, #4]
	ldr r3, _02260224 @ =0x02269C90
	adds r1, r5, #0
	adds r2, r7, #0
	str r6, [sp]
	bl ov49_0225F260
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r6, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov49_0225A03C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02260120:
	ldr r0, [sp, #8]
	bl ov49_0225F224
	cmp r0, #1
	bne _022601C0
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0226016A
	adds r0, r6, #0
	bl ov49_02258A50
	cmp r0, #1
	bne _0226016A
	ldr r0, [sp, #4]
	ldr r3, _02260228 @ =0x02269C60
	adds r1, r5, #0
	adds r2, r7, #0
	str r6, [sp]
	bl ov49_0225F260
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r6, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov49_0225A03C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A53C
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0226016A:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	bl ov49_02258F40
	str r0, [sp, #0x3c]
	cmp r0, #0
	beq _022601C0
	movs r1, #4
	bl ov49_02258E60
	adds r6, r0, #0
	cmp r6, #0xfe
	beq _022601C0
	adds r0, r5, #0
	bl ov49_0225A4F0
	cmp r0, #0
	bne _022601C0
	lsls r1, r6, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov49_0225A084
	cmp r0, #0
	bne _022601C0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov49_0225A428
	ldr r0, [sp, #0x3c]
	bl ov49_02258F3C
	ldr r1, [sp, #0x30]
	movs r2, #0
	str r0, [r1]
	ldr r1, [sp, #0x3c]
	adds r0, r4, #0
	bl ov49_02258EEC
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022601C0:
	ldr r0, _0226021C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	lsls r0, r0, #0xa
	tst r0, r1
	beq _0226020A
	adds r0, r5, #0
	bl ov49_0225A4F0
	cmp r0, #0
	bne _022601EE
	ldr r0, [sp, #0x18]
	bl FUN_0222A53C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A428
	ldr r0, _0226022C @ =0x000005DC
	bl FUN_0200604C
	b _02260204
_022601EE:
	adds r0, r5, #0
	bl ov49_0225A4E0
	cmp r0, r7
	bne _02260204
	adds r0, r5, #0
	bl ov49_0225A4D0
	ldr r0, _0226022C @ =0x000005DC
	bl FUN_0200604C
_02260204:
	add sp, #0x50
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0226020A:
	movs r0, #0
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260210: .4byte 0x02269D20
_02260214: .4byte 0x02269B80
_02260218: .4byte 0x02269B70
_0226021C: .4byte 0x021D110C
_02260220: .4byte 0x02269B60
_02260224: .4byte 0x02269C90
_02260228: .4byte 0x02269C60
_0226022C: .4byte 0x000005DC
	thumb_func_end ov49_0225FDCC

	thumb_func_start ov49_02260230
ov49_02260230: @ 0x02260230
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl ov49_02259FF0
	bl ov49_02258DAC
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	beq _02260250
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A53C
_02260250:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov49_02260230

	thumb_func_start ov49_02260254
ov49_02260254: @ 0x02260254
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	bl ov49_0225EF88
	cmp r0, #9
	bhi _022602FC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260270: @ jump table
	.2byte _02260284 - _02260270 - 2 @ case 0
	.2byte _022602C6 - _02260270 - 2 @ case 1
	.2byte _022602D8 - _02260270 - 2 @ case 2
	.2byte _022602F2 - _02260270 - 2 @ case 3
	.2byte _02260306 - _02260270 - 2 @ case 4
	.2byte _02260314 - _02260270 - 2 @ case 5
	.2byte _02260350 - _02260270 - 2 @ case 6
	.2byte _02260384 - _02260270 - 2 @ case 7
	.2byte _022603B6 - _02260270 - 2 @ case 8
	.2byte _022603D6 - _02260270 - 2 @ case 9
_02260284:
	adds r0, r4, #0
	bl ov49_02259FF0
	adds r6, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0
	bl ov49_02258EEC
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #0xb
	bl FUN_0222A5E8
	ldr r0, _02260420 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x41
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022602C6:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _022602FC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022602D8:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x19
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022602F2:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	beq _022602FE
_022602FC:
	b _0226041A
_022602FE:
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_02260306:
	adds r0, r4, #0
	bl ov49_0225A294
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_02260314:
	adds r0, r4, #0
	movs r6, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _02260328
	cmp r0, #1
	beq _02260334
	cmp r0, #2
	b _0226033E
_02260328:
	adds r0, r5, #0
	movs r1, #6
	bl ov49_0225EF8C
	movs r6, #1
	b _0226033E
_02260334:
	adds r0, r5, #0
	movs r1, #8
	bl ov49_0225EF8C
	movs r6, #1
_0226033E:
	cmp r6, #1
	bne _0226041A
	adds r0, r4, #0
	bl ov49_0225A2F8
	adds r0, r4, #0
	bl ov49_0225A0EC
	b _0226041A
_02260350:
	adds r0, r4, #0
	movs r1, #0
	bl ov49_0225A018
	adds r0, r4, #0
	bl ov49_02259FF0
	adds r6, r0, #0
	bl ov49_02258DAC
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov49_0225A008
	bl ov49_0225CC44
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #3
	bl ov49_02258EEC
	adds r0, r5, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _0226041A
_02260384:
	adds r0, r4, #0
	bl ov49_02259FF0
	bl ov49_02258DAC
	bl ov49_02258F38
	cmp r0, #1
	bne _0226041A
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A034
	adds r0, r4, #0
	movs r1, #0
	bl ov49_0225A038
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #0xb
	bl FUN_0222A5E8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022603B6:
	adds r0, r4, #0
	bl ov49_02259FF0
	adds r4, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #2
	movs r3, #0
	bl ov49_02258EAC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _0226041A
_022603D6:
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #1
	bl FUN_0222A5E8
	adds r0, r4, #0
	bl ov49_02259FF0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_0225A010
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_02258DAC
	movs r1, #5
	adds r6, r0, #0
	bl ov49_02258E60
	cmp r0, #0
	bne _0226041A
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov49_02258EEC
	ldr r2, _02260424 @ =0x02269B38
	adds r0, r4, #0
	adds r1, r7, #0
	movs r3, #0
	bl ov49_0225EF98
_0226041A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260420: .4byte 0x000005DD
_02260424: .4byte 0x02269B38
	thumb_func_end ov49_02260254

	thumb_func_start ov49_02260428
ov49_02260428: @ 0x02260428
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r4, r1, #0
	adds r5, r0, #0
	str r2, [sp, #0x10]
	adds r0, r4, #0
	bl ov49_02259FF0
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x28]
	bl ov49_02258D70
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov49_0225A040
	str r0, [sp, #0x20]
	adds r0, r5, #0
	bl ov49_0225EF84
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp, #0x24]
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #8
	bls _02260466
	b _022607B8
_02260466:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260472: @ jump table
	.2byte _02260484 - _02260472 - 2 @ case 0
	.2byte _02260544 - _02260472 - 2 @ case 1
	.2byte _022605E2 - _02260472 - 2 @ case 2
	.2byte _022606B0 - _02260472 - 2 @ case 3
	.2byte _02260702 - _02260472 - 2 @ case 4
	.2byte _0226071A - _02260472 - 2 @ case 5
	.2byte _02260740 - _02260472 - 2 @ case 6
	.2byte _0226075A - _02260472 - 2 @ case 7
	.2byte _02260788 - _02260472 - 2 @ case 8
_02260484:
	adds r0, r5, #0
	movs r1, #0xc
	bl ov49_0225EF40
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	bl ov49_02260C58
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _022604C8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022604A8: @ jump table
	.2byte _022604B0 - _022604A8 - 2 @ case 0
	.2byte _022604B6 - _022604A8 - 2 @ case 1
	.2byte _022604BC - _022604A8 - 2 @ case 2
	.2byte _022604C2 - _022604A8 - 2 @ case 3
_022604B0:
	movs r0, #3
	str r0, [r4, #8]
	b _022604D0
_022604B6:
	movs r0, #4
	str r0, [r4, #8]
	b _022604D0
_022604BC:
	movs r0, #5
	str r0, [r4, #8]
	b _022604D0
_022604C2:
	movs r0, #6
	str r0, [r4, #8]
	b _022604D0
_022604C8:
	bl GF_AssertFail
	movs r0, #5
	str r0, [r4, #8]
_022604D0:
	ldr r0, [sp, #0x24]
	bl FUN_0222A330
	cmp r0, #1
	bne _022604EC
	movs r0, #0x16
	strh r0, [r4, #4]
	movs r0, #0
	strh r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _022607B8
_022604EC:
	ldr r0, [sp, #0x24]
	bl FUN_0222A208
	cmp r0, #1
	bne _02260508
	movs r0, #0x48
	strh r0, [r4, #4]
	movs r0, #1
	strh r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _022607B8
_02260508:
	ldr r0, [sp, #0x20]
	bl ov49_02260C58
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r6, #0
	bl FUN_0222EBF0
	cmp r0, #0
	bne _0226052E
	movs r0, #0x14
	strh r0, [r4, #4]
	movs r0, #0
	strh r0, [r4, #6]
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _022607B8
_0226052E:
	adds r0, r6, #0
	bl FUN_0222EB38
	cmp r0, #0
	bne _0226053C
	bl GF_AssertFail
_0226053C:
	adds r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260544:
	bl FUN_0222EB74
	cmp r0, #1
	bne _022605CA
	adds r0, r5, #0
	movs r1, #2
	bl ov49_0225EF8C
	add r1, sp, #0x40
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	adds r0, r4, #0
	bl ov49_02259FE8
	adds r7, r0, #0
	bl FUN_0222AB68
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	ldr r0, [r6, #8]
	subs r0, r0, #5
	cmp r0, #1
	bhi _022605A4
	movs r5, #0
	adds r4, r5, #0
_0226057E:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0222AB78
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0226059C
	cmp r5, #4
	bhs _02260596
	add r1, sp, #0x40
	strb r0, [r1, r5]
_02260596:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0226059C:
	adds r4, r4, #1
	cmp r4, #4
	blt _0226057E
	b _022605AA
_022605A4:
	ldr r0, [sp, #0x10]
	add r1, sp, #0x38
	strb r0, [r1, #8]
_022605AA:
	add r3, sp, #0x38
	ldrb r0, [r3, #9]
	str r0, [sp]
	ldrb r0, [r3, #0xa]
	str r0, [sp, #4]
	ldrb r0, [r3, #0xb]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #8]
	ldr r1, [r6, #8]
	ldr r2, [sp, #0x1c]
	adds r0, r7, #0
	bl FUN_0222AC14
	b _022607B8
_022605CA:
	cmp r0, #2
	beq _022605D0
	b _022607B8
_022605D0:
	movs r0, #0x14
	strh r0, [r6, #4]
	movs r0, #0
	strh r0, [r6, #6]
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _022607B8
_022605E2:
	ldr r0, [sp, #0x20]
	bl ov49_02260CC0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x20]
	bl ov49_02260D28
	str r0, [sp, #0x30]
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A034
	ldr r1, [sp, #0x2c]
	adds r0, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov49_0225A038
	adds r0, r4, #0
	bl ov49_02259FE8
	ldr r1, [sp, #0x30]
	bl FUN_0222A5E8
	ldr r0, [r6, #8]
	cmp r0, #6
	bhi _02260644
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260624: @ jump table
	.2byte _02260644 - _02260624 - 2 @ case 0
	.2byte _02260644 - _02260624 - 2 @ case 1
	.2byte _02260644 - _02260624 - 2 @ case 2
	.2byte _02260632 - _02260624 - 2 @ case 3
	.2byte _02260632 - _02260624 - 2 @ case 4
	.2byte _02260638 - _02260624 - 2 @ case 5
	.2byte _0226063E - _02260624 - 2 @ case 6
_02260632:
	movs r0, #5
	str r0, [sp, #0x18]
	b _02260648
_02260638:
	movs r0, #3
	str r0, [sp, #0x18]
	b _02260648
_0226063E:
	movs r0, #4
	str r0, [sp, #0x18]
	b _02260648
_02260644:
	bl GF_AssertFail
_02260648:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x18]
	bl FUN_0222B118
	adds r0, r7, #0
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	str r0, [sp, #0x34]
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r4, r0, #0
	adds r0, r7, #0
	bl ov49_02258E34
	add r1, sp, #0x38
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #1
	strh r0, [r4, #6]
	movs r0, #4
	ldrsh r2, [r1, r0]
	asrs r0, r2, #3
	lsrs r0, r0, #0x1c
	adds r0, r2, r0
	asrs r0, r0, #4
	strh r0, [r4]
	movs r0, #6
	ldrsh r1, [r1, r0]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	strh r0, [r4, #2]
	ldr r0, [sp, #0x34]
	strh r0, [r4, #4]
	ldr r0, [r6, #8]
	strh r0, [r4, #8]
	adds r0, r5, #0
	bl ov49_0225EF68
	add sp, #0x44
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_022606B0:
	adds r0, r7, #0
	movs r1, #6
	bl ov49_02258E60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _022606EC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022606CC: @ jump table
	.2byte _022606D4 - _022606CC - 2 @ case 0
	.2byte _022606DA - _022606CC - 2 @ case 1
	.2byte _022606E0 - _022606CC - 2 @ case 2
	.2byte _022606E6 - _022606CC - 2 @ case 3
_022606D4:
	movs r0, #6
	str r0, [sp, #0x14]
	b _022606F0
_022606DA:
	movs r0, #5
	str r0, [sp, #0x14]
	b _022606F0
_022606E0:
	movs r0, #8
	str r0, [sp, #0x14]
	b _022606F0
_022606E6:
	movs r0, #7
	str r0, [sp, #0x14]
	b _022606F0
_022606EC:
	bl GF_AssertFail
_022606F0:
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x14]
	adds r1, r7, #0
	bl ov49_02258EEC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260702:
	adds r0, r7, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _022607B8
	movs r0, #8
	str r0, [r6]
	adds r0, r5, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _022607B8
_0226071A:
	adds r0, r7, #0
	movs r1, #6
	bl ov49_02258E60
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_022282A4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [sp, #0x28]
	adds r1, r7, #0
	movs r2, #2
	bl ov49_02258EAC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260740:
	adds r0, r7, #0
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _022607B8
	movs r0, #8
	str r0, [r6]
	adds r0, r5, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _022607B8
_0226075A:
	ldr r0, [r6]
	subs r0, r0, #1
	str r0, [r6]
	cmp r0, #0
	bgt _022607B8
	ldr r1, [r6, #8]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A37C
	ldrh r1, [r6, #6]
	ldrh r2, [r6, #4]
	adds r0, r4, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _022607B8
_02260788:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _022607B8
	adds r0, r5, #0
	bl ov49_0225EF68
	ldr r0, [sp, #0x28]
	adds r1, r7, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	bl ov49_0225A010
	ldr r1, [sp, #0x10]
	ldr r2, _022607C0 @ =0x02269B38
	movs r3, #0
	bl ov49_0225EF98
_022607B8:
	movs r0, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_022607C0: .4byte 0x02269B38
	thumb_func_end ov49_02260428

	thumb_func_start ov49_022607C4
ov49_022607C4: @ 0x022607C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r4, r1, #0
	adds r6, r0, #0
	str r2, [sp]
	bl ov49_0225EF84
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov49_0225A010
	str r0, [sp, #0x14]
	adds r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0x18]
	bl ov49_02258DAC
	str r0, [sp, #0x10]
	adds r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #7
	bls _022607FE
	b _02260A5A
_022607FE:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0226080A: @ jump table
	.2byte _0226081A - _0226080A - 2 @ case 0
	.2byte _0226088E - _0226080A - 2 @ case 1
	.2byte _022608A8 - _0226080A - 2 @ case 2
	.2byte _0226095E - _0226080A - 2 @ case 3
	.2byte _0226097E - _0226080A - 2 @ case 4
	.2byte _02260992 - _0226080A - 2 @ case 5
	.2byte _02260A16 - _0226080A - 2 @ case 6
	.2byte _02260A2E - _0226080A - 2 @ case 7
_0226081A:
	adds r0, r6, #0
	movs r1, #4
	bl ov49_0225EF40
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	movs r2, #0
	bl ov49_02258EEC
	adds r0, r6, #0
	bl ov49_0225EF90
	movs r0, #0
	strb r0, [r5]
	adds r0, r4, #0
	bl ov49_0225A040
	cmp r0, #0x1e
	beq _0226084C
	cmp r0, #0x1f
	beq _02260858
	cmp r0, #0x20
	beq _02260864
	b _02260870
_0226084C:
	movs r0, #0
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	movs r0, #2
	strb r0, [r5, #3]
	b _02260874
_02260858:
	movs r0, #1
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	movs r0, #3
	strb r0, [r5, #3]
	b _02260874
_02260864:
	movs r0, #2
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	movs r0, #4
	strb r0, [r5, #3]
	b _02260874
_02260870:
	bl GF_AssertFail
_02260874:
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #0xc
	bl FUN_0222A5E8
	ldr r0, [sp, #0x14]
	ldr r1, [sp]
	ldr r2, _02260A60 @ =0x02269B88
	adds r3, r5, #0
	bl ov49_0225EFC4
	b _02260A5A
_0226088E:
	ldrb r0, [r7]
	cmp r0, #8
	bne _0226089E
	adds r0, r6, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _02260A5A
_0226089E:
	adds r0, r6, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _02260A5A
_022608A8:
	adds r0, r4, #0
	bl ov49_0225A040
	cmp r0, #0x1e
	beq _022608BC
	cmp r0, #0x1f
	beq _022608C4
	cmp r0, #0x20
	beq _022608CC
	b _022608D2
_022608BC:
	movs r0, #0
	movs r5, #3
	str r0, [sp, #8]
	b _022608D2
_022608C4:
	movs r0, #1
	movs r5, #4
	str r0, [sp, #8]
	b _022608D2
_022608CC:
	movs r0, #2
	movs r5, #5
	str r0, [sp, #8]
_022608D2:
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A034
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov49_0225A038
	ldr r0, [sp, #0xc]
	bl FUN_0222B108
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl FUN_0222B118
	ldr r0, [sp, #0x10]
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r5, r0, #0
	ldr r0, [sp, #0x10]
	bl ov49_02258E34
	add r1, sp, #0x20
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #2
	strh r0, [r5, #6]
	movs r0, #4
	ldrsh r0, [r1, r0]
	asrs r2, r0, #3
	lsrs r2, r2, #0x1c
	adds r2, r0, r2
	asrs r0, r2, #4
	strh r0, [r5]
	movs r0, #6
	ldrsh r1, [r1, r0]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	strh r0, [r5, #2]
	ldr r0, [sp, #0x1c]
	strh r0, [r5, #4]
	ldrb r0, [r7, #2]
	strh r0, [r5, #8]
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #1
	bl FUN_0222A4C8
	adds r0, r6, #0
	bl ov49_0225EF68
	add sp, #0x28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0226095E:
	ldr r0, [sp, #0x10]
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	adds r3, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	movs r2, #2
	bl ov49_02258EAC
	adds r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_0226097E:
	ldr r0, [sp, #0x10]
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _02260A5A
	adds r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_02260992:
	movs r0, #1
	str r0, [sp, #4]
	ldrb r0, [r7]
	cmp r0, #7
	bhi _022609E8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022609A8: @ jump table
	.2byte _022609B8 - _022609A8 - 2 @ case 0
	.2byte _022609C6 - _022609A8 - 2 @ case 1
	.2byte _022609CA - _022609A8 - 2 @ case 2
	.2byte _022609D8 - _022609A8 - 2 @ case 3
	.2byte _022609DC - _022609A8 - 2 @ case 4
	.2byte _022609E8 - _022609A8 - 2 @ case 5
	.2byte _022609E0 - _022609A8 - 2 @ case 6
	.2byte _022609E4 - _022609A8 - 2 @ case 7
_022609B8:
	ldrb r1, [r7, #2]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A37C
	movs r5, #4
	b _022609EC
_022609C6:
	movs r5, #5
	b _022609EC
_022609CA:
	ldrb r1, [r7, #2]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A37C
	movs r5, #6
	b _022609EC
_022609D8:
	movs r5, #0x13
	b _022609EC
_022609DC:
	movs r5, #0x11
	b _022609EC
_022609E0:
	movs r5, #0x1d
	b _022609EC
_022609E4:
	movs r5, #7
	b _022609EC
_022609E8:
	movs r0, #0
	str r0, [sp, #4]
_022609EC:
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02260A0C
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_02260A0C:
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _02260A5A
_02260A16:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02260A5A
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r6, #0
	bl ov49_0225EF90
	b _02260A5A
_02260A2E:
	adds r0, r6, #0
	bl ov49_0225EF68
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #1
	bl FUN_0222A5E8
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r4, #0
	bl ov49_0225A010
	ldr r1, [sp]
	ldr r2, _02260A64 @ =0x02269B38
	movs r3, #0
	bl ov49_0225EF98
_02260A5A:
	movs r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260A60: .4byte 0x02269B88
_02260A64: .4byte 0x02269B38
	thumb_func_end ov49_022607C4

	thumb_func_start ov49_02260A68
ov49_02260A68: @ 0x02260A68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r1, #0
	adds r5, r0, #0
	str r2, [sp]
	bl ov49_0225EF84
	str r0, [sp, #8]
	adds r0, r4, #0
	bl ov49_0225A010
	adds r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	bl ov49_02258DAC
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov49_02259FE8
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #6
	bls _02260AA0
	b _02260C4A
_02260AA0:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260AAC: @ jump table
	.2byte _02260ABA - _02260AAC - 2 @ case 0
	.2byte _02260B1E - _02260AAC - 2 @ case 1
	.2byte _02260BB4 - _02260AAC - 2 @ case 2
	.2byte _02260BD4 - _02260AAC - 2 @ case 3
	.2byte _02260BE8 - _02260AAC - 2 @ case 4
	.2byte _02260C04 - _02260AAC - 2 @ case 5
	.2byte _02260C1C - _02260AAC - 2 @ case 6
_02260ABA:
	adds r0, r5, #0
	movs r1, #0xc
	bl ov49_0225EF40
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #0xd
	bl FUN_0222A5E8
	adds r0, r7, #0
	bl FUN_0222A330
	cmp r0, #1
	bne _02260AE8
	movs r0, #0x7a
	strh r0, [r6]
	adds r0, r5, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _02260C4E
_02260AE8:
	adds r0, r7, #0
	bl FUN_0222A3A0
	cmp r0, #1
	bne _02260AF8
	movs r0, #0xa
	strh r0, [r6, #2]
	b _02260B14
_02260AF8:
	adds r0, r7, #0
	bl FUN_0222A2E0
	cmp r0, #1
	bne _02260B10
	movs r0, #0x62
	strh r0, [r6]
	adds r0, r5, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _02260C4E
_02260B10:
	movs r0, #9
	strh r0, [r6, #2]
_02260B14:
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02260C4E
_02260B1E:
	ldr r0, [sp, #8]
	ldrh r0, [r0, #2]
	cmp r0, #9
	bne _02260B2C
	movs r0, #9
	str r0, [sp, #4]
	b _02260B36
_02260B2C:
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r7, #0
	bl FUN_0222A310
_02260B36:
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A034
	ldr r1, [sp, #4]
	adds r0, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov49_0225A038
	movs r1, #0x17
	adds r2, r1, #0
	adds r0, r7, #0
	subs r2, #0x18
	bl FUN_0222A704
	adds r0, r6, #0
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov49_02259FEC
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov49_02258E34
	add r1, sp, #0x10
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #3
	strh r0, [r4, #6]
	movs r0, #4
	ldrsh r2, [r1, r0]
	asrs r0, r2, #3
	lsrs r0, r0, #0x1c
	adds r0, r2, r0
	asrs r0, r0, #4
	strh r0, [r4]
	movs r0, #6
	ldrsh r1, [r1, r0]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	strh r0, [r4, #2]
	strh r7, [r4, #4]
	movs r0, #0
	strh r0, [r4, #8]
	adds r0, r5, #0
	bl ov49_0225EF68
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02260BB4:
	adds r0, r6, #0
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	adds r3, r0, #0
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	movs r2, #2
	bl ov49_02258EAC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260BD4:
	adds r0, r6, #0
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	bne _02260C4E
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260BE8:
	ldr r2, [sp, #8]
	adds r0, r4, #0
	ldrh r2, [r2]
	movs r1, #1
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260C04:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02260C4E
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02260C4E
_02260C1C:
	adds r0, r5, #0
	bl ov49_0225EF68
	adds r0, r4, #0
	bl ov49_02259FE8
	movs r1, #1
	bl FUN_0222A5E8
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r4, #0
	bl ov49_0225A010
	ldr r1, [sp]
	ldr r2, _02260C54 @ =0x02269B38
	movs r3, #0
	bl ov49_0225EF98
	b _02260C4E
_02260C4A:
	bl GF_AssertFail
_02260C4E:
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260C54: .4byte 0x02269B38
	thumb_func_end ov49_02260A68

	thumb_func_start ov49_02260C58
ov49_02260C58: @ 0x02260C58
	push {r3, lr}
	cmp r0, #0x1d
	bhi _02260CB6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260C6A: @ jump table
	.2byte _02260CB6 - _02260C6A - 2 @ case 0
	.2byte _02260CB6 - _02260C6A - 2 @ case 1
	.2byte _02260CB6 - _02260C6A - 2 @ case 2
	.2byte _02260CB6 - _02260C6A - 2 @ case 3
	.2byte _02260CB6 - _02260C6A - 2 @ case 4
	.2byte _02260CB6 - _02260C6A - 2 @ case 5
	.2byte _02260CAE - _02260C6A - 2 @ case 6
	.2byte _02260CAE - _02260C6A - 2 @ case 7
	.2byte _02260CAE - _02260C6A - 2 @ case 8
	.2byte _02260CAE - _02260C6A - 2 @ case 9
	.2byte _02260CAE - _02260C6A - 2 @ case 10
	.2byte _02260CAE - _02260C6A - 2 @ case 11
	.2byte _02260CAE - _02260C6A - 2 @ case 12
	.2byte _02260CAE - _02260C6A - 2 @ case 13
	.2byte _02260CB2 - _02260C6A - 2 @ case 14
	.2byte _02260CB2 - _02260C6A - 2 @ case 15
	.2byte _02260CB2 - _02260C6A - 2 @ case 16
	.2byte _02260CB2 - _02260C6A - 2 @ case 17
	.2byte _02260CB2 - _02260C6A - 2 @ case 18
	.2byte _02260CB2 - _02260C6A - 2 @ case 19
	.2byte _02260CB2 - _02260C6A - 2 @ case 20
	.2byte _02260CB2 - _02260C6A - 2 @ case 21
	.2byte _02260CA6 - _02260C6A - 2 @ case 22
	.2byte _02260CA6 - _02260C6A - 2 @ case 23
	.2byte _02260CA6 - _02260C6A - 2 @ case 24
	.2byte _02260CA6 - _02260C6A - 2 @ case 25
	.2byte _02260CAA - _02260C6A - 2 @ case 26
	.2byte _02260CAA - _02260C6A - 2 @ case 27
	.2byte _02260CAA - _02260C6A - 2 @ case 28
	.2byte _02260CAA - _02260C6A - 2 @ case 29
_02260CA6:
	movs r0, #2
	pop {r3, pc}
_02260CAA:
	movs r0, #3
	pop {r3, pc}
_02260CAE:
	movs r0, #0
	pop {r3, pc}
_02260CB2:
	movs r0, #1
	pop {r3, pc}
_02260CB6:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02260C58

	thumb_func_start ov49_02260CC0
ov49_02260CC0: @ 0x02260CC0
	push {r3, lr}
	cmp r0, #0x1d
	bhi _02260D1E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260CD2: @ jump table
	.2byte _02260D1E - _02260CD2 - 2 @ case 0
	.2byte _02260D1E - _02260CD2 - 2 @ case 1
	.2byte _02260D1E - _02260CD2 - 2 @ case 2
	.2byte _02260D1E - _02260CD2 - 2 @ case 3
	.2byte _02260D1E - _02260CD2 - 2 @ case 4
	.2byte _02260D1E - _02260CD2 - 2 @ case 5
	.2byte _02260D16 - _02260CD2 - 2 @ case 6
	.2byte _02260D16 - _02260CD2 - 2 @ case 7
	.2byte _02260D16 - _02260CD2 - 2 @ case 8
	.2byte _02260D16 - _02260CD2 - 2 @ case 9
	.2byte _02260D16 - _02260CD2 - 2 @ case 10
	.2byte _02260D16 - _02260CD2 - 2 @ case 11
	.2byte _02260D16 - _02260CD2 - 2 @ case 12
	.2byte _02260D16 - _02260CD2 - 2 @ case 13
	.2byte _02260D1A - _02260CD2 - 2 @ case 14
	.2byte _02260D1A - _02260CD2 - 2 @ case 15
	.2byte _02260D1A - _02260CD2 - 2 @ case 16
	.2byte _02260D1A - _02260CD2 - 2 @ case 17
	.2byte _02260D1A - _02260CD2 - 2 @ case 18
	.2byte _02260D1A - _02260CD2 - 2 @ case 19
	.2byte _02260D1A - _02260CD2 - 2 @ case 20
	.2byte _02260D1A - _02260CD2 - 2 @ case 21
	.2byte _02260D0E - _02260CD2 - 2 @ case 22
	.2byte _02260D0E - _02260CD2 - 2 @ case 23
	.2byte _02260D0E - _02260CD2 - 2 @ case 24
	.2byte _02260D0E - _02260CD2 - 2 @ case 25
	.2byte _02260D12 - _02260CD2 - 2 @ case 26
	.2byte _02260D12 - _02260CD2 - 2 @ case 27
	.2byte _02260D12 - _02260CD2 - 2 @ case 28
	.2byte _02260D12 - _02260CD2 - 2 @ case 29
_02260D0E:
	movs r0, #1
	pop {r3, pc}
_02260D12:
	movs r0, #2
	pop {r3, pc}
_02260D16:
	movs r0, #6
	pop {r3, pc}
_02260D1A:
	movs r0, #7
	pop {r3, pc}
_02260D1E:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02260CC0

	thumb_func_start ov49_02260D28
ov49_02260D28: @ 0x02260D28
	push {r3, lr}
	cmp r0, #0x1d
	bhi _02260D86
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260D3A: @ jump table
	.2byte _02260D86 - _02260D3A - 2 @ case 0
	.2byte _02260D86 - _02260D3A - 2 @ case 1
	.2byte _02260D86 - _02260D3A - 2 @ case 2
	.2byte _02260D86 - _02260D3A - 2 @ case 3
	.2byte _02260D86 - _02260D3A - 2 @ case 4
	.2byte _02260D86 - _02260D3A - 2 @ case 5
	.2byte _02260D7E - _02260D3A - 2 @ case 6
	.2byte _02260D7E - _02260D3A - 2 @ case 7
	.2byte _02260D7E - _02260D3A - 2 @ case 8
	.2byte _02260D7E - _02260D3A - 2 @ case 9
	.2byte _02260D7E - _02260D3A - 2 @ case 10
	.2byte _02260D7E - _02260D3A - 2 @ case 11
	.2byte _02260D7E - _02260D3A - 2 @ case 12
	.2byte _02260D7E - _02260D3A - 2 @ case 13
	.2byte _02260D82 - _02260D3A - 2 @ case 14
	.2byte _02260D82 - _02260D3A - 2 @ case 15
	.2byte _02260D82 - _02260D3A - 2 @ case 16
	.2byte _02260D82 - _02260D3A - 2 @ case 17
	.2byte _02260D82 - _02260D3A - 2 @ case 18
	.2byte _02260D82 - _02260D3A - 2 @ case 19
	.2byte _02260D82 - _02260D3A - 2 @ case 20
	.2byte _02260D82 - _02260D3A - 2 @ case 21
	.2byte _02260D76 - _02260D3A - 2 @ case 22
	.2byte _02260D76 - _02260D3A - 2 @ case 23
	.2byte _02260D76 - _02260D3A - 2 @ case 24
	.2byte _02260D76 - _02260D3A - 2 @ case 25
	.2byte _02260D7A - _02260D3A - 2 @ case 26
	.2byte _02260D7A - _02260D3A - 2 @ case 27
	.2byte _02260D7A - _02260D3A - 2 @ case 28
	.2byte _02260D7A - _02260D3A - 2 @ case 29
_02260D76:
	movs r0, #7
	pop {r3, pc}
_02260D7A:
	movs r0, #8
	pop {r3, pc}
_02260D7E:
	movs r0, #5
	pop {r3, pc}
_02260D82:
	movs r0, #6
	pop {r3, pc}
_02260D86:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02260D28

	thumb_func_start ov49_02260D90
ov49_02260D90: @ 0x02260D90
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02260DA4
	cmp r0, #1
	beq _02260DFA
	b _02260E24
_02260DA4:
	adds r0, r4, #0
	bl ov49_02259FE8
	adds r6, r0, #0
	bl FUN_0222A330
	cmp r0, #1
	bne _02260DC2
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02260DE6
_02260DC2:
	adds r0, r6, #0
	bl FUN_0222A374
	cmp r0, #1
	bne _02260DDA
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4e
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02260DE6
_02260DDA:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #2
	bl ov49_0225A30C
	adds r1, r0, #0
_02260DE6:
	adds r0, r4, #0
	bl ov49_0225A08C
	ldr r0, _02260E28 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02260E24
_02260DFA:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _02260E24
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	bl ov49_02259FF0
	adds r4, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov49_02258EEC
	movs r0, #1
	pop {r4, r5, r6, pc}
_02260E24:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02260E28: .4byte 0x000005DC
	thumb_func_end ov49_02260D90

	thumb_func_start ov49_02260E2C
ov49_02260E2C: @ 0x02260E2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	str r2, [sp]
	bl ov49_02259FF0
	str r0, [sp, #8]
	adds r0, r5, #0
	bl ov49_02259FF8
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov49_0225A008
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #4]
	adds r0, r6, #0
	bl ov49_0225EF84
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0xf
	bls _02260E6A
	b _022611C0
_02260E6A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02260E76: @ jump table
	.2byte _02260E96 - _02260E76 - 2 @ case 0
	.2byte _02260EDE - _02260E76 - 2 @ case 1
	.2byte _02260F52 - _02260E76 - 2 @ case 2
	.2byte _02260FE2 - _02260E76 - 2 @ case 3
	.2byte _02261016 - _02260E76 - 2 @ case 4
	.2byte _02261046 - _02260E76 - 2 @ case 5
	.2byte _02261082 - _02260E76 - 2 @ case 6
	.2byte _02261098 - _02260E76 - 2 @ case 7
	.2byte _022610B0 - _02260E76 - 2 @ case 8
	.2byte _022610D0 - _02260E76 - 2 @ case 9
	.2byte _022610F0 - _02260E76 - 2 @ case 10
	.2byte _02261110 - _02260E76 - 2 @ case 11
	.2byte _02261124 - _02260E76 - 2 @ case 12
	.2byte _02261134 - _02260E76 - 2 @ case 13
	.2byte _02261180 - _02260E76 - 2 @ case 14
	.2byte _02261196 - _02260E76 - 2 @ case 15
_02260E96:
	adds r0, r6, #0
	movs r1, #0x18
	bl ov49_0225EF40
	adds r4, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp]
	bl ov49_02258D70
	str r0, [r4, #0xc]
	adds r0, r5, #0
	bl ov49_0225A040
	cmp r0, #0x21
	beq _02260EBE
	cmp r0, #0x22
	beq _02260EC4
	cmp r0, #0x23
	beq _02260ECA
	b _02260ED0
_02260EBE:
	movs r0, #2
	strh r0, [r4, #6]
	b _02260ED4
_02260EC4:
	movs r0, #1
	strh r0, [r4, #6]
	b _02260ED4
_02260ECA:
	movs r0, #0
	strh r0, [r4, #6]
	b _02260ED4
_02260ED0:
	bl GF_AssertFail
_02260ED4:
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _022611C0
_02260EDE:
	ldr r0, [sp, #4]
	bl FUN_0222A374
	cmp r0, #0
	bne _02260EF6
	movs r0, #8
	strh r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #6
	bl ov49_0225EF8C
	b _022611C0
_02260EF6:
	ldr r0, [sp, #4]
	bl FUN_0222A330
	cmp r0, #1
	bne _02260F0E
	movs r0, #0xa
	strh r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #6
	bl ov49_0225EF8C
	b _022611C0
_02260F0E:
	ldrh r2, [r4, #6]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl FUN_0222ADB8
	movs r1, #0
	mvns r1, r1
	str r0, [r4]
	cmp r0, r1
	beq _02260F44
	adds r0, r6, #0
	movs r1, #2
	bl ov49_0225EF8C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1f
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
	b _022611C0
_02260F44:
	movs r0, #9
	strh r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #6
	bl ov49_0225EF8C
	b _022611C0
_02260F52:
	ldr r0, _022611C8 @ =0x021D110C
	movs r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	bne _02260F62
	movs r1, #0x80
	tst r0, r1
	beq _02260F82
_02260F62:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl FUN_0222ADC8
	adds r0, r5, #0
	bl ov49_0225A0CC
	movs r0, #6
	strb r0, [r4, #0xa]
	movs r0, #0xf
	strh r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #0xc
	bl ov49_0225EF8C
	b _022611C0
_02260F82:
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov49_022611F4
	cmp r0, #1
	beq _02260F90
	b _022611C0
_02260F90:
	adds r0, r5, #0
	bl ov49_0225A0CC
	ldr r0, [sp, #4]
	bl FUN_0222AE44
	movs r0, #0
	strh r0, [r4, #8]
	adds r0, r5, #0
	bl ov49_02259FE8
	movs r1, #0xa
	bl FUN_0222A5E8
	adds r0, r5, #0
	bl ov49_0225A044
	ldr r0, [sp, #0xc]
	bl ov49_0225CC44
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov49_02259130
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl ov49_0225916C
	ldr r0, _022611CC @ =0x000005C1
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov49_0225A510
	movs r0, #3
	strb r0, [r4, #0xa]
	adds r0, r6, #0
	movs r1, #0xc
	bl ov49_0225EF8C
	b _022611C0
_02260FE2:
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov49_02261234
	cmp r0, #1
	bne _022610A4
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov49_0225916C
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl ov49_02259160
	ldr r0, [r4, #0xc]
	movs r1, #8
	bl ov49_022591B4
	adds r0, r6, #0
	movs r1, #4
	bl ov49_0225EF8C
	movs r0, #0
	strh r0, [r4, #8]
	b _022611C0
_02261016:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02261434
	ldr r1, [sp, #0xc]
	adds r0, r4, #0
	bl ov49_022611D4
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov49_022613AC
	cmp r0, #1
	bne _022610A4
	adds r0, r6, #0
	movs r1, #5
	bl ov49_0225EF8C
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A53C
	b _022611C0
_02261046:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02261434
	ldr r1, [sp, #0xc]
	adds r0, r4, #0
	bl ov49_022611D4
	ldr r0, [r4, #0xc]
	add r1, sp, #0x10
	bl ov49_02259154
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02261460
	movs r0, #6
	ldr r1, [sp, #0x10]
	lsls r0, r0, #0x10
	cmp r1, r0
	bge _022610A4
	movs r0, #0
	strb r0, [r4, #0xb]
	adds r0, r6, #0
	movs r1, #0xd
	bl ov49_0225EF8C
	b _022611C0
_02261082:
	ldr r0, [sp, #8]
	ldr r1, [r4, #0xc]
	movs r2, #2
	movs r3, #1
	bl ov49_02258EAC
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	b _022611C0
_02261098:
	ldr r0, [r4, #0xc]
	movs r1, #5
	bl ov49_02258E60
	cmp r0, #0
	beq _022610A6
_022610A4:
	b _022611C0
_022610A6:
	ldrh r1, [r4, #4]
	adds r0, r6, #0
	bl ov49_0225EF8C
	b _022611C0
_022610B0:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1e
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0xf
	strh r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #0xb
	bl ov49_0225EF8C
	b _022611C0
_022610D0:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0xf
	strh r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #0xb
	bl ov49_0225EF8C
	b _022611C0
_022610F0:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x21
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0xf
	strh r0, [r4, #4]
	adds r0, r6, #0
	movs r1, #0xb
	bl ov49_0225EF8C
	b _022611C0
_02261110:
	adds r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _022611C0
	ldrh r1, [r4, #4]
	adds r0, r6, #0
	bl ov49_0225EF8C
	b _022611C0
_02261124:
	adds r0, r5, #0
	bl ov49_0225A0EC
	ldrb r1, [r4, #0xa]
	adds r0, r6, #0
	bl ov49_0225EF8C
	b _022611C0
_02261134:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02261434
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02261460
	ldrb r0, [r4, #0xb]
	adds r0, r0, #1
	strb r0, [r4, #0xb]
	ldrb r0, [r4, #0xb]
	cmp r0, #0x78
	bls _022611C0
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225A034
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A038
	adds r0, r5, #0
	bl ov49_0225A0EC
	adds r0, r5, #0
	bl ov49_02259FE8
	movs r1, #0xb
	bl FUN_0222A5E8
	adds r0, r6, #0
	movs r1, #0xe
	bl ov49_0225EF8C
	b _022611C0
_02261180:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02261434
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02261460
	b _022611C0
_02261196:
	adds r0, r5, #0
	bl ov49_0225A010
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov49_0225A0EC
	ldr r0, [sp, #8]
	ldr r1, [r4, #0xc]
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r6, #0
	bl ov49_0225EF68
	ldr r1, [sp]
	ldr r2, _022611D0 @ =0x02269B38
	adds r0, r7, #0
	movs r3, #0
	bl ov49_0225EF98
_022611C0:
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022611C8: .4byte 0x021D110C
_022611CC: .4byte 0x000005C1
_022611D0: .4byte 0x02269B38
	thumb_func_end ov49_02260E2C

	thumb_func_start ov49_022611D4
ov49_022611D4: @ 0x022611D4
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r0, [r0, #0xc]
	adds r4, r1, #0
	add r1, sp, #0
	bl ov49_02259154
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl ov49_0225CC20
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_022611D4

	thumb_func_start ov49_022611F4
ov49_022611F4: @ 0x022611F4
	push {r3, r4, r5, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	add r1, sp, #4
	add r2, sp, #0
	bl FUN_0222AE08
	ldr r1, [sp, #4]
	ldr r2, [sp]
	adds r0, r4, #0
	add r3, sp, #8
	bl ov49_0225E420
	ldr r0, [r5, #0xc]
	add r1, sp, #0x14
	bl ov49_02259154
	movs r0, #1
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _0226122E
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, pc}
_0226122E:
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_022611F4

	thumb_func_start ov49_02261234
ov49_02261234: @ 0x02261234
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #8
	adds r6, r1, #0
	ldrsh r1, [r5, r0]
	adds r7, r2, #0
	adds r1, r1, #1
	strh r1, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0x18
	bge _02261250
	movs r4, #0
	b _02261256
_02261250:
	movs r0, #0x18
	strh r0, [r5, #8]
	movs r4, #1
_02261256:
	ldr r0, [r5]
	add r1, sp, #0xc
	add r2, sp, #8
	bl FUN_0222AE08
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	adds r0, r6, #0
	add r3, sp, #0x1c
	bl ov49_0225E420
	ldr r0, [r5, #0xc]
	bl ov49_02258E34
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1]
	add r0, sp, #4
	strh r2, [r1, #4]
	ldrh r2, [r1, #2]
	strh r2, [r1, #6]
	add r1, sp, #0x28
	bl ov49_02258800
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	subs r6, r1, r0
	movs r0, #8
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _022612AE
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022612BC
_022612AE:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022612BC:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	movs r1, #6
	lsls r1, r1, #0xe
	blx FUN_020CCBA0
	str r0, [sp, #0x14]
	movs r0, #8
	ldrsh r2, [r5, r0]
	cmp r2, #4
	blt _02261342
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x30]
	subs r6, r1, r0
	subs r0, r2, #4
	cmp r0, #0
	ble _0226130A
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02261318
_0226130A:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02261318:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	movs r1, #5
	lsls r1, r1, #0xe
	blx FUN_020CCBA0
	str r0, [sp, #0x18]
	b _02261346
_02261342:
	movs r0, #0
	str r0, [sp, #0x18]
_02261346:
	add r0, sp, #0x10
	add r1, sp, #0x28
	adds r2, r0, #0
	blx FUN_020CCD78
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	adds r0, r7, #0
	bl ov49_0225CC20
	movs r0, #8
	ldrsh r1, [r5, r0]
	ldr r0, _022613A4 @ =0x00007FFF
	muls r0, r1, r0
	movs r1, #0x18
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #2
	ldr r0, _022613A8 @ =0x021094DC
	ldr r1, [sp, #0x14]
	ldrsh r3, [r0, r2]
	asrs r0, r3, #0x1f
	lsrs r2, r3, #0x10
	lsls r0, r0, #0x10
	orrs r0, r2
	movs r2, #2
	lsls r6, r3, #0x10
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r6, r2
	adcs r0, r3
	lsls r0, r0, #0x14
	lsrs r2, r2, #0xc
	orrs r2, r0
	adds r0, r1, r2
	str r0, [sp, #0x14]
	ldr r0, [r5, #0xc]
	add r1, sp, #0x10
	bl ov49_02259148
	adds r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022613A4: .4byte 0x00007FFF
_022613A8: .4byte 0x021094DC
	thumb_func_end ov49_02261234

	thumb_func_start ov49_022613AC
ov49_022613AC: @ 0x022613AC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #8
	ldrsh r1, [r5, r0]
	adds r1, r1, #1
	strh r1, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0x10
	bge _022613C4
	movs r6, #0
	b _022613CA
_022613C4:
	movs r0, #0x10
	strh r0, [r5, #8]
	movs r6, #1
_022613CA:
	movs r0, #8
	ldrsh r0, [r5, r0]
	movs r3, #0
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1d
	subs r1, r1, r2
	movs r0, #0x1d
	rors r1, r0
	adds r1, r2, r1
	ldr r0, _0226142C @ =0x00007FFF
	adds r2, r1, #0
	muls r2, r0, r2
	asrs r0, r2, #2
	lsrs r0, r0, #0x1d
	adds r0, r2, r0
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _02261430 @ =0x021094DC
	movs r2, #3
	ldrsh r0, [r0, r1]
	lsls r2, r2, #0xc
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r4, r2, #0xc
	orrs r4, r0
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, [sp, #4]
	add r1, sp, #0
	adds r0, r0, r4
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	bl ov49_02259148
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0226142C: .4byte 0x00007FFF
_02261430: .4byte 0x021094DC
	thumb_func_end ov49_022613AC

	thumb_func_start ov49_02261434
ov49_02261434: @ 0x02261434
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	add r1, sp, #0
	add r2, sp, #4
	bl FUN_0222AE08
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r4, #0
	add r3, sp, #8
	bl ov49_0225E420
	ldr r0, [r5, #0xc]
	add r1, sp, #8
	bl ov49_02259148
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_02261434

	thumb_func_start ov49_02261460
ov49_02261460: @ 0x02261460
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r2, #0
	add r1, sp, #4
	add r2, sp, #0
	bl FUN_0222AE08
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl ov49_0225A520
	cmp r0, #1
	bne _02261494
	adds r0, r5, #0
	adds r0, #0x10
	bl ov49_0225F438
	cmp r0, #0
	bne _022614A8
	adds r0, r5, #0
	adds r0, #0x10
	bl ov49_0225F374
	b _022614A8
_02261494:
	adds r0, r5, #0
	adds r0, #0x10
	bl ov49_0225F438
	cmp r0, #1
	bne _022614A8
	adds r0, r5, #0
	adds r0, #0x10
	bl ov49_0225F430
_022614A8:
	adds r0, r5, #0
	adds r0, #0x10
	bl ov49_0225F394
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	add r1, sp, #8
	bl ov49_02259154
	ldr r0, [sp, #0xc]
	add r1, sp, #8
	adds r0, r0, r4
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	bl ov49_02259148
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov49_02261460

	thumb_func_start ov49_022614CC
ov49_022614CC: @ 0x022614CC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x12
	bl ov49_0225A10C
	movs r4, #1
	movs r6, #0
	adds r7, r4, #0
_022614E0:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov49_0225A40C
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #6
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov49_0225A144
	adds r4, r4, #1
	cmp r4, #0x12
	blt _022614E0
	adds r0, r5, #0
	movs r1, #1
	movs r2, #7
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A144
	ldr r2, [sp]
	ldr r3, _0226153C @ =0x02269C00
	adds r2, #8
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1, #8]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226153C: .4byte 0x02269C00
	thumb_func_end ov49_022614CC

	thumb_func_start ov49_02261540
ov49_02261540: @ 0x02261540
	ldr r3, _02261548 @ =ov49_0225A134
	adds r0, r1, #0
	bx r3
	nop
_02261548: .4byte ov49_0225A134
	thumb_func_end ov49_02261540

	thumb_func_start ov49_0226154C
ov49_0226154C: @ 0x0226154C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r4, r2, #0
	bl ov49_02259FE8
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ov49_02259FF0
	adds r1, r4, #0
	str r0, [sp, #0xc]
	bl ov49_02258D70
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF84
	str r0, [sp, #0x10]
	adds r0, r6, #0
	bl ov49_0225A010
	str r0, [sp, #0x14]
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bhi _02261606
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261594: @ jump table
	.2byte _022615A0 - _02261594 - 2 @ case 0
	.2byte _022615B0 - _02261594 - 2 @ case 1
	.2byte _022615D4 - _02261594 - 2 @ case 2
	.2byte _02261618 - _02261594 - 2 @ case 3
	.2byte _022616CA - _02261594 - 2 @ case 4
	.2byte _022616DC - _02261594 - 2 @ case 5
_022615A0:
	adds r0, r5, #0
	movs r1, #8
	bl ov49_0225EF40
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
_022615B0:
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl FUN_0222A230
	adds r6, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl FUN_0222A550
	cmp r6, #1
	beq _022615CA
	cmp r0, #1
	bne _02261606
_022615CA:
	adds r0, r5, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _02261710
_022615D4:
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl FUN_0222A578
	adds r6, r0, #0
	bne _022615EA
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02261710
_022615EA:
	bl FUN_0222AADC
	cmp r0, #1
	bne _02261606
	adds r0, r6, #0
	bl FUN_0222AA5C
	adds r2, r0, #0
	ldr r0, [sp, #0xc]
	adds r1, r4, #0
	bl ov49_02258CB8
	cmp r0, #0
	bne _02261608
_02261606:
	b _02261710
_02261608:
	movs r1, #0
	bl ov49_022591C0
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _02261710
_02261618:
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl FUN_0222A578
	cmp r0, #0
	bne _02261638
	cmp r7, #0
	beq _0226162E
	adds r0, r7, #0
	bl ov49_02258D54
_0226162E:
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02261710
_02261638:
	bl FUN_0222A920
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #8]
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov49_02261DBC
	cmp r0, #0
	beq _02261696
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A06C
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A04C
	adds r0, r7, #0
	movs r1, #0
	bl ov49_02259130
	ldr r0, [sp, #0x14]
	ldr r2, _02261718 @ =0x02269B58
	ldr r3, [sp, #0x10]
	adds r1, r4, #0
	bl ov49_0225EFC4
	b _02261710
_02261696:
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	movs r2, #4
	bl ov49_02258EEC
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225EF8C
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A04C
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A06C
	adds r0, r7, #0
	movs r1, #1
	bl ov49_022591C0
	b _02261710
_022616CA:
	adds r0, r7, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _02261710
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02261710
_022616DC:
	adds r0, r5, #0
	bl ov49_0225EF68
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	movs r2, #2
	bl ov49_02258EEC
	ldr r0, [sp, #0x14]
	ldr r2, _0226171C @ =0x02269B40
	adds r1, r4, #0
	movs r3, #0
	bl ov49_0225EF98
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov49_0225A04C
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov49_0225A06C
_02261710:
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261718: .4byte 0x02269B58
_0226171C: .4byte 0x02269B40
	thumb_func_end ov49_0226154C

	thumb_func_start ov49_02261720
ov49_02261720: @ 0x02261720
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r4, r2, #0
	bl ov49_02259FE8
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov49_02259FF0
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov49_0225A010
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r1, r4, #0
	bl ov49_02258D70
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	bl ov49_02258DAC
	ldr r0, [sp, #8]
	bl ov49_0225EF84
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	bl ov49_0225EF88
	cmp r0, #0
	beq _0226176A
	cmp r0, #1
	beq _0226177C
	b _022618AA
_0226176A:
	ldr r0, [sp, #8]
	movs r1, #8
	bl ov49_0225EF40
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	movs r1, #1
	bl ov49_0225EF8C
_0226177C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0222A25C
	cmp r0, #0
	beq _022617BE
	ldr r0, [sp, #8]
	bl ov49_0225EF68
	ldr r0, [sp, #0x10]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A06C
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A04C
	ldr r0, [sp, #0xc]
	ldr r2, _022618B0 @ =0x02269B48
	adds r1, r4, #0
	movs r3, #0
	bl ov49_0225EF98
	b _022618AA
_022617BE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0222A2A0
	adds r0, r6, #0
	bl FUN_0222A374
	cmp r0, #1
	bne _0226181E
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0222ADA8
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0226181E
	ldr r0, [sp, #0x10]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A06C
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A04C
	adds r0, r7, #0
	movs r1, #0
	bl ov49_02259130
	ldr r0, [sp, #8]
	bl ov49_0225EF68
	ldr r0, [sp, #0xc]
	ldr r2, _022618B4 @ =0x02269B50
	ldr r3, [sp, #0x14]
	adds r1, r4, #0
	bl ov49_0225EF98
	b _022618AA
_0226181E:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0222A578
	bl FUN_0222A920
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r7, #0
	bl ov49_02261DBC
	cmp r0, #0
	beq _0226187C
	ldr r0, [sp, #0x10]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A06C
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A04C
	adds r0, r7, #0
	movs r1, #0
	bl ov49_02259130
	ldr r0, [sp, #0xc]
	ldr r2, _022618B8 @ =0x02269B58
	ldr r3, [sp, #0x14]
	adds r1, r4, #0
	bl ov49_0225EFC4
	b _022618AA
_0226187C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0222AD58
	cmp r0, #1
	bne _022618AA
	ldr r0, [sp, #0x10]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A04C
	ldr r0, [sp, #0xc]
	ldr r2, _022618BC @ =0x02269B80
	adds r1, r4, #0
	movs r3, #0
	bl ov49_0225EFC4
_022618AA:
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022618B0: .4byte 0x02269B48
_022618B4: .4byte 0x02269B50
_022618B8: .4byte 0x02269B58
_022618BC: .4byte 0x02269B80
	thumb_func_end ov49_02261720

	thumb_func_start ov49_022618C0
ov49_022618C0: @ 0x022618C0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	str r2, [sp]
	adds r0, r6, #0
	bl ov49_02259FF0
	ldr r1, [sp]
	adds r7, r0, #0
	bl ov49_02258D70
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _022618EC
	cmp r0, #1
	beq _022618FE
	cmp r0, #2
	beq _02261910
	b _02261926
_022618EC:
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #3
	bl ov49_02258EEC
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02261926
_022618FE:
	adds r0, r4, #0
	bl ov49_02258F38
	cmp r0, #0
	beq _02261926
	adds r0, r5, #0
	bl ov49_0225EF90
	b _02261926
_02261910:
	adds r0, r4, #0
	bl ov49_02258D54
	adds r0, r6, #0
	bl ov49_0225A010
	ldr r1, [sp]
	ldr r2, _0226192C @ =0x02269B78
	movs r3, #0
	bl ov49_0225EF98
_02261926:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226192C: .4byte 0x02269B78
	thumb_func_end ov49_022618C0

	thumb_func_start ov49_02261930
ov49_02261930: @ 0x02261930
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r7, r2, #0
	bl ov49_02259FE8
	str r0, [sp]
	adds r0, r6, #0
	bl ov49_02259FF0
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ov49_02259FF8
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov49_0225EF84
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #4
	bhi _022619CE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261970: @ jump table
	.2byte _0226197A - _02261970 - 2 @ case 0
	.2byte _022619C4 - _02261970 - 2 @ case 1
	.2byte _02261A2A - _02261970 - 2 @ case 2
	.2byte _02261AD8 - _02261970 - 2 @ case 3
	.2byte _02261B48 - _02261970 - 2 @ case 4
_0226197A:
	adds r0, r5, #0
	movs r1, #0x20
	bl ov49_0225EF40
	adds r4, r0, #0
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl ov49_02258D70
	str r0, [r4]
	ldr r0, [sp]
	adds r1, r7, #0
	bl FUN_0222ADA8
	movs r1, #0
	mvns r1, r1
	str r0, [r4, #4]
	cmp r0, r1
	bne _022619A4
	bl GF_AssertFail
_022619A4:
	adds r2, r4, #0
	ldr r0, [r4, #4]
	adds r1, r4, #4
	adds r2, #8
	bl FUN_0222AE08
	ldr r0, [sp, #8]
	ldr r1, [r4]
	movs r2, #3
	bl ov49_02258EEC
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02261B64
_022619C4:
	ldr r0, [r4]
	bl ov49_02258F38
	cmp r0, #0
	bne _022619D0
_022619CE:
	b _02261B64
_022619D0:
	ldr r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r3, sp, #0x34
	bl ov49_0225E420
	movs r0, #1
	ldr r1, [sp, #0x34]
	lsls r0, r0, #0x10
	subs r0, r1, r0
	str r0, [r4, #0x10]
	ldr r0, [r4]
	add r1, sp, #0x34
	bl ov49_02259154
	ldr r0, [sp, #0x38]
	mov r3, sp
	str r0, [r4, #0xc]
	movs r1, #0
	str r1, [r4, #0x14]
	add r0, sp, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	add r1, sp, #0xc
	ldrh r2, [r1]
	ldr r0, [r4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258DB4
	ldr r0, _02261B6C @ =0x0000064E
	bl FUN_0200604C
	ldr r0, [r4]
	movs r1, #1
	bl ov49_02259184
	adds r0, r5, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _02261B64
_02261A2A:
	ldr r0, [r4, #0x14]
	movs r6, #0
	adds r0, r0, #1
	str r0, [r4, #0x14]
	cmp r0, #0x18
	blt _02261A3C
	movs r0, #0x18
	str r0, [r4, #0x14]
	movs r6, #1
_02261A3C:
	ldr r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r3, sp, #0x28
	bl ov49_0225E420
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	str r0, [sp, #0x24]
	ldr r0, [r4, #0x10]
	str r0, [sp, #0x1c]
	ldr r0, [r4, #0xc]
	subs r7, r1, r0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	ble _02261A6E
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02261A7C
_02261A6E:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02261A7C:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r7, #0x1f
	adds r2, r7, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	movs r1, #6
	lsls r1, r1, #0xe
	blx FUN_020CCBA0
	str r0, [sp, #0x20]
	ldr r1, [r4, #0xc]
	adds r0, r0, r1
	str r0, [sp, #0x20]
	ldr r0, [r4]
	add r1, sp, #0x1c
	bl ov49_02259148
	cmp r6, #1
	bne _02261B64
	ldr r0, [r4]
	movs r1, #0
	bl ov49_02259184
	ldr r0, [r4]
	movs r1, #8
	bl ov49_022591B4
	ldr r0, [r4]
	movs r1, #2
	bl ov49_02259160
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _02261B64
_02261AD8:
	ldr r1, [r4, #4]
	adds r0, r6, #0
	bl ov49_0225A520
	cmp r0, #1
	bne _02261AFA
	adds r0, r4, #0
	adds r0, #0x18
	bl ov49_0225F438
	cmp r0, #0
	bne _02261B0E
	adds r0, r4, #0
	adds r0, #0x18
	bl ov49_0225F374
	b _02261B0E
_02261AFA:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov49_0225F438
	cmp r0, #1
	bne _02261B0E
	adds r0, r4, #0
	adds r0, #0x18
	bl ov49_0225F430
_02261B0E:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov49_0225F394
	adds r6, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r3, sp, #0x10
	bl ov49_0225E420
	ldr r0, [sp, #0x14]
	add r1, sp, #0x10
	adds r0, r0, r6
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov49_02259148
	ldr r0, [sp]
	ldr r1, [r4, #4]
	bl FUN_0222AD80
	cmp r0, #2
	bne _02261B64
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225EF8C
	b _02261B64
_02261B48:
	ldr r0, [r4]
	bl ov49_02258D54
	adds r0, r5, #0
	bl ov49_0225EF68
	adds r0, r6, #0
	bl ov49_0225A010
	ldr r2, _02261B70 @ =0x02269B78
	adds r1, r7, #0
	movs r3, #0
	bl ov49_0225EF98
_02261B64:
	movs r0, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261B6C: .4byte 0x0000064E
_02261B70: .4byte 0x02269B78
	thumb_func_end ov49_02261930

	thumb_func_start ov49_02261B74
ov49_02261B74: @ 0x02261B74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp]
	adds r7, r0, #0
	adds r4, r2, #0
	bl ov49_0225EF3C
	adds r6, r0, #0
	ldr r0, [sp]
	bl ov49_02259FE8
	str r0, [sp, #8]
	ldr r0, [sp]
	bl ov49_02259FF0
	str r0, [sp, #0xc]
	adds r1, r4, #0
	bl ov49_02258D70
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	bl ov49_02258DAC
	str r0, [sp, #0x10]
	adds r0, r7, #0
	bl ov49_0225EF88
	cmp r0, #0xa
	bhi _02261C58
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261BBA: @ jump table
	.2byte _02261BD0 - _02261BBA - 2 @ case 0
	.2byte _02261BE8 - _02261BBA - 2 @ case 1
	.2byte _02261BFA - _02261BBA - 2 @ case 2
	.2byte _02261C0C - _02261BBA - 2 @ case 3
	.2byte _02261C4E - _02261BBA - 2 @ case 4
	.2byte _02261C84 - _02261BBA - 2 @ case 5
	.2byte _02261D2E - _02261BBA - 2 @ case 6
	.2byte _02261BFA - _02261BBA - 2 @ case 7
	.2byte _02261D40 - _02261BBA - 2 @ case 8
	.2byte _02261BFA - _02261BBA - 2 @ case 9
	.2byte _02261D8E - _02261BBA - 2 @ case 10
_02261BD0:
	ldrb r0, [r6, #4]
	cmp r0, #0
	bne _02261BDE
	adds r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261BDE:
	adds r0, r7, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _02261DB6
_02261BE8:
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #3
	bl ov49_02258EEC
	adds r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261BFA:
	adds r0, r5, #0
	bl ov49_02258F38
	cmp r0, #1
	bne _02261C58
	adds r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261C0C:
	adds r0, r5, #0
	bl ov49_02258E34
	add r2, sp, #0x14
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	add r1, sp, #0x1c
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	adds r0, r5, #0
	bl ov49_0225913C
	adds r0, r5, #0
	bl ov49_022591CC
	cmp r0, #0
	bne _02261C3C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_022591C0
_02261C3C:
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #4
	bl ov49_02258EEC
	adds r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261C4E:
	adds r0, r5, #0
	bl ov49_02258F38
	cmp r0, #1
	beq _02261C5A
_02261C58:
	b _02261DB6
_02261C5A:
	adds r0, r7, #0
	bl ov49_0225EF90
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02258EEC
	lsls r1, r4, #0x18
	ldr r0, [sp]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov49_0225A04C
	lsls r1, r4, #0x18
	ldr r0, [sp]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov49_0225A06C
	b _02261DB6
_02261C84:
	movs r0, #0
	str r0, [sp, #4]
	ldrb r0, [r6, #3]
	cmp r0, #1
	bne _02261CC4
	ldr r0, [sp, #8]
	bl FUN_0222B0B0
	cmp r0, #0
	bne _02261CC4
	ldr r0, [sp, #8]
	bl FUN_0222A5C0
	bl FUN_0222A920
	cmp r0, #9
	bne _02261CC4
	ldr r0, [sp, #8]
	bl FUN_0222B0A4
	adds r0, r5, #0
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	adds r3, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	movs r2, #0
	bl ov49_02258EAC
_02261CC4:
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl FUN_0222A578
	adds r5, r0, #0
	bne _02261CD6
	movs r0, #1
	str r0, [sp, #4]
	b _02261D08
_02261CD6:
	ldrb r0, [r6, #3]
	cmp r0, #1
	bne _02261CEC
	ldr r0, [sp, #8]
	bl FUN_0222AFF8
	cmp r0, #0
	bne _02261CEC
	movs r0, #1
	str r0, [sp, #4]
	b _02261D08
_02261CEC:
	ldr r0, [sp, #8]
	adds r1, r4, #0
	bl FUN_0222A2A0
	cmp r0, #0
	beq _02261D08
	adds r0, r5, #0
	bl FUN_0222A920
	ldrb r1, [r6, #2]
	cmp r0, r1
	beq _02261D08
	movs r0, #1
	str r0, [sp, #4]
_02261D08:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02261DB6
	adds r0, r7, #0
	bl ov49_0225EF90
	lsls r1, r4, #0x18
	ldr r0, [sp]
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A04C
	lsls r1, r4, #0x18
	ldr r0, [sp]
	lsrs r1, r1, #0x18
	movs r2, #1
	bl ov49_0225A06C
	b _02261DB6
_02261D2E:
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #3
	bl ov49_02258EEC
	adds r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261D40:
	ldr r0, [sp, #0xc]
	bl ov49_02258DAC
	ldrb r1, [r6]
	ldrb r2, [r6, #1]
	bl ov49_02258FDC
	cmp r0, #0
	bne _02261DB6
	ldrb r0, [r6]
	mov r3, sp
	add r1, sp, #0x14
	lsls r0, r0, #4
	strh r0, [r1, #4]
	ldrb r0, [r6, #1]
	subs r3, r3, #4
	lsls r0, r0, #4
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258DB4
	adds r0, r5, #0
	add r1, sp, #0x18
	bl ov49_0225913C
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #4
	bl ov49_02258EEC
	adds r0, r7, #0
	bl ov49_0225EF90
	b _02261DB6
_02261D8E:
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	movs r2, #2
	bl ov49_02258EEC
	lsls r1, r4, #0x18
	ldr r0, [sp]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov49_0225A04C
	lsls r1, r4, #0x18
	ldr r0, [sp]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov49_0225A06C
	add sp, #0x20
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02261DB6:
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02261B74

	thumb_func_start ov49_02261DBC
ov49_02261DBC: @ 0x02261DBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r6, r2, #0
	adds r4, r0, #0
	adds r0, r6, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r7, #0
	bl ov49_02259FF0
	adds r5, r0, #0
	bl ov49_02258DAC
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl ov49_0225A000
	adds r6, r0, #0
	ldr r0, [sp, #8]
	movs r1, #4
	bl ov49_02258E60
	str r0, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x20]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x10]
	cmp r0, #0xe
	bls _02261DF8
	b _02261F42
_02261DF8:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02261E04: @ jump table
	.2byte _02261F42 - _02261E04 - 2 @ case 0
	.2byte _02261F42 - _02261E04 - 2 @ case 1
	.2byte _02261E22 - _02261E04 - 2 @ case 2
	.2byte _02261E3E - _02261E04 - 2 @ case 3
	.2byte _02261E58 - _02261E04 - 2 @ case 4
	.2byte _02261E72 - _02261E04 - 2 @ case 5
	.2byte _02261E90 - _02261E04 - 2 @ case 6
	.2byte _02261EAE - _02261E04 - 2 @ case 7
	.2byte _02261ECC - _02261E04 - 2 @ case 8
	.2byte _02261EF0 - _02261E04 - 2 @ case 9
	.2byte _02261EEA - _02261E04 - 2 @ case 10
	.2byte _02261F42 - _02261E04 - 2 @ case 11
	.2byte _02261F42 - _02261E04 - 2 @ case 12
	.2byte _02261F42 - _02261E04 - 2 @ case 13
	.2byte _02261F42 - _02261E04 - 2 @ case 14
_02261E22:
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FA4 @ =0x02269B90
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	beq _02261E38
	b _02261F48
_02261E38:
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E3E:
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FA8 @ =0x02269BC0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E58:
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FAC @ =0x02269BA0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E72:
	adds r0, r7, #0
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FB0 @ =0x02269C20
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #8
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261E90:
	adds r0, r7, #0
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FB4 @ =0x02269C40
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #8
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261EAE:
	movs r0, #3
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FB8 @ =0x02269BB0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261ECC:
	adds r0, r7, #0
	str r0, [sp, #0x20]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r2, _02261FBC @ =0x02269BD0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #4
	bl ov49_02261FC0
	cmp r0, #0
	bne _02261F48
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261EEA:
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261EF0:
	ldr r0, [sp, #4]
	bl FUN_0222AFF8
	cmp r0, #0
	bne _02261F00
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261F00:
	ldr r0, [sp, #4]
	bl FUN_0222B00C
	cmp r0, #0
	bne _02261F10
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261F10:
	ldr r0, [sp, #4]
	bl FUN_0222B020
	ldr r1, [sp, #0x10]
	cmp r1, r0
	beq _02261F22
	add sp, #0x24
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02261F22:
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	add r2, sp, #0x20
	add r3, sp, #0x1c
	bl ov49_0225904C
	cmp r0, #1
	beq _02261F36
	bl GF_AssertFail
_02261F36:
	ldr r0, [sp, #0x20]
	bl FUN_022282A4
	str r0, [sp, #0x20]
	movs r7, #1
	b _02261F48
_02261F42:
	add sp, #0x24
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_02261F48:
	ldr r0, [sp, #8]
	bl ov49_02258E34
	add r1, sp, #0x14
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	subs r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #8]
	ldr r0, [sp, #8]
	strh r2, [r3]
	ldrh r1, [r1, #0xa]
	strh r1, [r3, #2]
	ldr r1, [r3]
	ldr r2, [sp, #0x20]
	bl ov49_02258E04
	add r1, sp, #0x14
	movs r0, #4
	ldrsh r2, [r1, r0]
	asrs r0, r2, #3
	lsrs r0, r0, #0x1c
	adds r0, r2, r0
	asrs r0, r0, #4
	strb r0, [r4]
	movs r0, #6
	ldrsh r1, [r1, r0]
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	asrs r0, r0, #4
	strb r0, [r4, #1]
	add r0, sp, #0x28
	ldrb r0, [r0, #0x10]
	strb r0, [r4, #2]
	ldr r0, [sp, #0x3c]
	strb r7, [r4, #3]
	strb r0, [r4, #4]
	movs r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02261FA4: .4byte 0x02269B90
_02261FA8: .4byte 0x02269BC0
_02261FAC: .4byte 0x02269BA0
_02261FB0: .4byte 0x02269C20
_02261FB4: .4byte 0x02269C40
_02261FB8: .4byte 0x02269BB0
_02261FBC: .4byte 0x02269BD0
	thumb_func_end ov49_02261DBC

	thumb_func_start ov49_02261FC0
ov49_02261FC0: @ 0x02261FC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [sp, #0x20]
	adds r5, r2, #0
	str r1, [sp, #4]
	adds r6, r3, #0
	str r0, [sp, #0x20]
	ldr r4, _02262024 @ =0x00000000
	beq _0226201C
_02261FD4:
	movs r0, #0
	str r0, [sp]
	add r2, sp, #8
	ldr r1, [r5]
	adds r0, r7, #0
	adds r2, #2
	add r3, sp, #8
	bl ov49_022589D8
	cmp r0, #1
	bne _02262014
	add r1, sp, #8
	add r2, sp, #8
	ldrh r1, [r1, #2]
	ldrh r2, [r2]
	ldr r0, [sp, #4]
	bl ov49_02258F7C
	cmp r0, #0
	bne _02262014
	add r1, sp, #8
	ldrh r0, [r1, #2]
	lsls r2, r0, #4
	ldr r0, [sp, #0x20]
	strh r2, [r0]
	ldrh r0, [r1]
	lsls r1, r0, #4
	ldr r0, [sp, #0x20]
	add sp, #0xc
	strh r1, [r0, #2]
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02262014:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r6
	blo _02261FD4
_0226201C:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02262024: .4byte 0x00000000
	thumb_func_end ov49_02261FC0

	thumb_func_start ov49_02262028
ov49_02262028: @ 0x02262028
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x10]
	adds r5, r1, #0
	str r2, [sp, #0x14]
	bl ov49_0225EF3C
	adds r6, r0, #0
	ldr r0, [sp, #0x10]
	bl ov49_0225EF84
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov49_02259FE8
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x10]
	bl ov49_0225EF88
	cmp r0, #0x1b
	bhi _02262140
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0226205E: @ jump table
	.2byte _02262140 - _0226205E - 2 @ case 0
	.2byte _02262140 - _0226205E - 2 @ case 1
	.2byte _02262140 - _0226205E - 2 @ case 2
	.2byte _02262140 - _0226205E - 2 @ case 3
	.2byte _02262140 - _0226205E - 2 @ case 4
	.2byte _02262140 - _0226205E - 2 @ case 5
	.2byte _02262140 - _0226205E - 2 @ case 6
	.2byte _02262114 - _0226205E - 2 @ case 7
	.2byte _022620DE - _0226205E - 2 @ case 8
	.2byte _02262096 - _0226205E - 2 @ case 9
	.2byte _02262096 - _0226205E - 2 @ case 10
	.2byte _02262096 - _0226205E - 2 @ case 11
	.2byte _02262096 - _0226205E - 2 @ case 12
	.2byte _02262096 - _0226205E - 2 @ case 13
	.2byte _02262096 - _0226205E - 2 @ case 14
	.2byte _02262140 - _0226205E - 2 @ case 15
	.2byte _02262140 - _0226205E - 2 @ case 16
	.2byte _02262114 - _0226205E - 2 @ case 17
	.2byte _02262114 - _0226205E - 2 @ case 18
	.2byte _02262114 - _0226205E - 2 @ case 19
	.2byte _02262114 - _0226205E - 2 @ case 20
	.2byte _02262114 - _0226205E - 2 @ case 21
	.2byte _02262114 - _0226205E - 2 @ case 22
	.2byte _02262140 - _0226205E - 2 @ case 23
	.2byte _02262140 - _0226205E - 2 @ case 24
	.2byte _02262140 - _0226205E - 2 @ case 25
	.2byte _02262096 - _0226205E - 2 @ case 26
	.2byte _02262096 - _0226205E - 2 @ case 27
_02262096:
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	ldrh r1, [r4, #8]
	cmp r1, r0
	bls _022620B0
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620B0:
	bl FUN_02037454
	ldrh r1, [r4, #8]
	cmp r1, r0
	ble _022620C8
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620C8:
	bl FUN_0203988C
	cmp r0, #0
	bne _022620DE
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620DE:
	bl FUN_0222F464
	cmp r0, #1
	bne _022620FE
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	cmp r0, #1
	bhi _022620FE
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_022620FE:
	ldr r0, [r4, #0x10]
	subs r0, r0, #1
	str r0, [r4, #0x10]
	bpl _02262114
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262140
_02262114:
	bl FUN_020390C4
	cmp r0, #5
	bhi _02262140
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02262128: @ jump table
	.2byte _02262140 - _02262128 - 2 @ case 0
	.2byte _02262140 - _02262128 - 2 @ case 1
	.2byte _02262134 - _02262128 - 2 @ case 2
	.2byte _02262134 - _02262128 - 2 @ case 3
	.2byte _02262134 - _02262128 - 2 @ case 4
	.2byte _02262134 - _02262128 - 2 @ case 5
_02262134:
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
_02262140:
	ldr r0, [sp, #0x10]
	bl ov49_0225EF88
	cmp r0, #0x1c
	bls _0226214E
	bl _02262AB8
_0226214E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0226215A: @ jump table
	.2byte _02262194 - _0226215A - 2 @ case 0
	.2byte _022621A6 - _0226215A - 2 @ case 1
	.2byte _022621EA - _0226215A - 2 @ case 2
	.2byte _02262208 - _0226215A - 2 @ case 3
	.2byte _0226222E - _0226215A - 2 @ case 4
	.2byte _02262292 - _0226215A - 2 @ case 5
	.2byte _022622B2 - _0226215A - 2 @ case 6
	.2byte _0226239C - _0226215A - 2 @ case 7
	.2byte _02262556 - _0226215A - 2 @ case 8
	.2byte _022625DC - _0226215A - 2 @ case 9
	.2byte _02262630 - _0226215A - 2 @ case 10
	.2byte _0226265C - _0226215A - 2 @ case 11
	.2byte _022626D4 - _0226215A - 2 @ case 12
	.2byte _02262702 - _0226215A - 2 @ case 13
	.2byte _0226273C - _0226215A - 2 @ case 14
	.2byte _02262806 - _0226215A - 2 @ case 15
	.2byte _02262856 - _0226215A - 2 @ case 16
	.2byte _0226287C - _0226215A - 2 @ case 17
	.2byte _022628A4 - _0226215A - 2 @ case 18
	.2byte _022628B4 - _0226215A - 2 @ case 19
	.2byte _0226290C - _0226215A - 2 @ case 20
	.2byte _0226296C - _0226215A - 2 @ case 21
	.2byte _022629BE - _0226215A - 2 @ case 22
	.2byte _02262A08 - _0226215A - 2 @ case 23
	.2byte _02262A1A - _0226215A - 2 @ case 24
	.2byte _02262A2C - _0226215A - 2 @ case 25
	.2byte _02262A40 - _0226215A - 2 @ case 26
	.2byte _02262A64 - _0226215A - 2 @ case 27
	.2byte _02262A8E - _0226215A - 2 @ case 28
_02262194:
	ldr r0, [sp, #0x10]
	movs r1, #0x44
	bl ov49_0225EF40
	ldr r0, [sp, #0x10]
	bl ov49_0225EF90
	bl _02262AB8
_022621A6:
	ldr r0, [sp, #0x30]
	bl FUN_0222A414
	cmp r0, #0
	beq _022621C0
	movs r0, #7
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	bl ov49_0225EF8C
	bl _02262AB8
_022621C0:
	ldr r0, [sp, #0x30]
	bl FUN_0222A394
	cmp r0, #0
	beq _022621DA
	movs r0, #2
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	bl ov49_0225EF8C
	bl _02262AB8
_022621DA:
	ldr r0, _022624F4 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [sp, #0x10]
	bl ov49_0225EF90
	bl _02262AB8
_022621EA:
	ldrb r1, [r6, #2]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A37C
	movs r0, #3
	str r0, [sp]
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #0
	bl ov49_02262BF8
	bl _02262AB8
_02262208:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	movs r3, #1
	bl ov49_02262C38
	adds r4, #0x18
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov49_0225A174
	ldr r0, [sp, #0x10]
	movs r1, #4
	bl ov49_0225EF8C
	bl _02262AB8
_0226222E:
	adds r0, r5, #0
	movs r7, #0
	bl ov49_0225A1D4
	cmp r0, #2
	bhi _02262248
	cmp r0, #0
	beq _0226226A
	cmp r0, #1
	beq _0226225E
	cmp r0, #2
	beq _0226224E
	b _02262274
_02262248:
	subs r1, r7, #2
	cmp r0, r1
	bne _02262274
_0226224E:
	movs r0, #5
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	bl ov49_0225EF8C
	movs r7, #1
	b _02262274
_0226225E:
	ldr r0, [sp, #0x10]
	movs r1, #5
	bl ov49_0225EF8C
	movs r7, #1
	b _02262274
_0226226A:
	ldr r0, [sp, #0x10]
	movs r1, #6
	bl ov49_0225EF8C
	movs r7, #1
_02262274:
	cmp r7, #1
	beq _0226227C
	bl _02262AB8
_0226227C:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02262CA8
	bl _02262AB8
_02262292:
	ldrb r1, [r6, #2]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A37C
	movs r0, #2
	str r0, [sp]
	ldrb r3, [r6, #2]
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	adds r2, r5, #0
	adds r3, #0x22
	bl ov49_02262BF8
	bl _02262AB8
_022622B2:
	ldr r0, [sp, #0x30]
	bl FUN_0222A394
	cmp r0, #0
	beq _022622CA
	movs r0, #2
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_022622CA:
	ldrb r0, [r6, #1]
	bl FUN_0222F274
	cmp r0, #1
	bne _0226230E
	ldrb r0, [r6, #1]
	bl FUN_0222F2D4
	cmp r0, #0
	beq _022622E8
	ldrb r0, [r6, #1]
	bl FUN_0222F294
	cmp r0, #0
	bne _022622F6
_022622E8:
	movs r0, #1
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_022622F6:
	ldrb r0, [r6, #1]
	bl FUN_0222F3E8
	cmp r0, #0
	bne _0226230E
	movs r0, #7
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_0226230E:
	ldrb r0, [r6, #1]
	bl FUN_0222F3E8
	strh r0, [r4]
	movs r0, #0xe1
	lsls r0, r0, #2
	str r0, [r4, #0x10]
	movs r1, #0
	ldrsh r2, [r4, r1]
	ldr r0, _022624F8 @ =0x0000014A
	cmp r2, r0
	ble _02262330
	adds r0, r5, #0
	movs r2, #0xa
	bl ov49_0225A30C
	b _0226233C
_02262330:
	movs r0, #1
	str r0, [r4, #0x14]
	adds r0, r5, #0
	movs r2, #0xb
	bl ov49_0225A30C
_0226233C:
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
	ldrb r0, [r6, #1]
	bl FUN_0203981C
	bl FUN_0222F464
	cmp r0, #1
	bne _02262372
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r6, #2]
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x14]
	movs r2, #1
	bl FUN_0222AC14
	movs r0, #1
	strb r0, [r4, #7]
_02262372:
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r1, r5, #0
	movs r3, #1
	str r0, [sp]
	ldrb r2, [r6, #2]
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov49_02262D70
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov49_02262E04
	ldr r0, [sp, #0x10]
	movs r1, #7
	bl ov49_0225EF8C
	b _02262AB8
_0226239C:
	bl FUN_0203988C
	str r0, [sp, #0x2c]
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	adds r7, r0, #0
	ldrb r0, [r6, #1]
	bl FUN_0222F3E8
	strh r0, [r4]
	movs r1, #0
	adds r0, r4, #0
	ldrsh r1, [r4, r1]
	adds r0, #0x3c
	bl ov49_02262DD4
	movs r0, #0
	ldrsh r1, [r4, r0]
	ldr r0, _022624F8 @ =0x0000014A
	cmp r1, r0
	bgt _022623F0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _022623F0
	adds r0, r5, #0
	bl ov49_0225A0CC
	movs r0, #1
	str r0, [r4, #0x14]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xb
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
_022623F0:
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _02262410
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262410:
	cmp r0, #2
	bne _02262462
	movs r0, #8
	strb r0, [r6]
	cmp r7, #4
	bne _02262420
	movs r6, #0x10
	b _02262422
_02262420:
	movs r6, #0x12
_02262422:
	adds r0, r5, #0
	bl ov49_0225A0CC
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
	ldr r0, [sp, #0x10]
	movs r1, #9
	bl ov49_0225EF8C
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	strh r7, [r4, #8]
	bl ov49_02262DD4
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	b _02262AB8
_02262462:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _022624A8
	ldr r0, _022624FC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _022624A8
	ldr r0, _02262500 @ =0x000005DC
	bl FUN_0200604C
	bl FUN_0222F464
	cmp r0, #0
	bne _02262494
	movs r0, #6
	strb r0, [r6]
	adds r0, r5, #0
	bl ov49_0225A0CC
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262494:
	movs r0, #6
	strb r0, [r6]
	adds r0, r5, #0
	bl ov49_0225A0CC
	ldr r0, [sp, #0x10]
	movs r1, #0x10
	bl ov49_0225EF8C
	b _02262AB8
_022624A8:
	bl FUN_0222F464
	cmp r0, #1
	bne _02262504
	ldrb r0, [r4, #7]
	cmp r0, r7
	beq _022624D2
	strb r7, [r4, #7]
	cmp r7, #4
	beq _022624D2
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r6, #2]
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x14]
	adds r2, r7, #0
	bl FUN_0222AC14
_022624D2:
	movs r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _02262504
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	cmp r0, #1
	bhi _02262504
	movs r0, #3
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
	nop
_022624F4: .4byte 0x000005DD
_022624F8: .4byte 0x0000014A
_022624FC: .4byte 0x021D110C
_02262500: .4byte 0x000005DC
_02262504:
	ldrb r0, [r6, #1]
	bl FUN_0222F274
	cmp r0, #1
	bne _02262526
	ldrb r0, [r6, #1]
	bl FUN_0222F294
	cmp r0, #0
	bne _02262526
	movs r0, #0
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262526:
	movs r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _022625CC
	ldr r0, [sp, #0x10]
	movs r1, #8
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x12
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
	b _02262AB8
_02262556:
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	bl FUN_0203988C
	adds r5, r0, #0
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	adds r7, r0, #0
	bl FUN_020390C4
	cmp r0, #3
	beq _02262586
	cmp r0, #4
	bne _02262592
_02262586:
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
_02262592:
	cmp r5, #0
	bne _022625A4
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_022625A4:
	cmp r5, #2
	bne _022625B8
	movs r0, #8
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #9
	bl ov49_0225EF8C
	strh r7, [r4, #8]
	b _02262AB8
_022625B8:
	ldrb r0, [r6, #1]
	bl FUN_0222F274
	cmp r0, #1
	bne _022625CC
	ldrb r0, [r6, #1]
	bl FUN_0222F294
	cmp r0, #0
	beq _022625CE
_022625CC:
	b _02262AB8
_022625CE:
	movs r0, #0
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_022625DC:
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	adds r0, r5, #0
	bl ov49_02259FE8
	ldrb r1, [r6, #3]
	bl FUN_0222A5E8
	bl FUN_02039B38
	adds r0, r5, #0
	bl ov49_02259FE8
	bl FUN_0222A2C8
	movs r1, #0
	bl FUN_02034354
	ldr r0, [sp, #0x30]
	bl FUN_0222AB1C
	bl FUN_02034B00
	movs r0, #0
	bl FUN_020378E4
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #0x11
	bl ov49_02262C20
	b _02262AB8
_02262630:
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	bl FUN_02034434
	bl FUN_0203769C
	bl FUN_0203476C
	ldr r0, [sp, #0x10]
	movs r1, #0xb
	bl ov49_0225EF8C
	b _02262AB8
_0226265C:
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	bl FUN_02034780
	cmp r0, #0xff
	beq _02262686
_0226267A:
	bl FUN_0203476C
	bl FUN_02034780
	cmp r0, #0xff
	bne _0226267A
_02262686:
	bl FUN_020347A0
	adds r5, r0, #0
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	cmp r5, r0
	blo _022626BE
	bl FUN_0222F464
	cmp r0, #1
	bne _022626AC
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _022626AC
	bl FUN_0222F1BC
	movs r0, #1
	strh r0, [r4, #2]
_022626AC:
	bl FUN_0222F218
	cmp r0, #1
	bne _02262730
	ldr r0, [sp, #0x10]
	movs r1, #0xc
	bl ov49_0225EF8C
	b _02262AB8
_022626BE:
	bl FUN_0222F218
	cmp r0, #1
	bne _02262730
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_022626D4:
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	bl FUN_02037BEC
	ldr r0, [sp, #0x30]
	bl FUN_0222A43C
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	movs r2, #0xd
	movs r3, #0xe
	bl ov49_02262C20
	b _02262AB8
_02262702:
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	ldr r0, [sp, #0x30]
	bl FUN_0222A548
	str r0, [r4, #0xc]
	bl FUN_0203769C
	adds r4, #0xc
	adds r1, r4, #0
	bl FUN_02037C0C
	cmp r0, #1
	beq _02262732
_02262730:
	b _02262AB8
_02262732:
	ldr r0, [sp, #0x10]
	movs r1, #0xe
	bl ov49_0225EF8C
	b _02262AB8
_0226273C:
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262DF8
	movs r0, #0
	str r0, [sp, #0x18]
	bl FUN_020347A0
	str r0, [sp, #0x28]
	bl FUN_0203769C
	movs r7, #0
	str r0, [sp, #0x24]
	str r7, [sp, #0x20]
	bl FUN_0222F430
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	adds r4, r7, #0
	cmp r0, #0
	ble _022627DC
_02262774:
	ldr r0, [sp, #0x24]
	cmp r0, r4
	beq _022627BE
	adds r0, r4, #0
	bl FUN_02037C44
	adds r5, r0, #0
	beq _022627D4
	ldr r0, [r5]
	bl FUN_0222EC68
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _022627A4
	movs r0, #1
	str r0, [sp, #0x18]
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022627DC
_022627A4:
	ldr r0, [sp, #0x30]
	ldr r1, [r5]
	adds r2, r4, #0
	bl FUN_0222A450
	ldr r1, [r5]
	ldr r0, [sp, #0x1c]
	cmp r1, r0
	bne _022627BA
	movs r0, #1
	str r0, [sp, #0x20]
_022627BA:
	adds r7, r7, #1
	b _022627D4
_022627BE:
	ldr r0, [sp, #0x30]
	adds r1, r4, #0
	bl FUN_0222A480
	bl FUN_0222F464
	cmp r0, #1
	bne _022627D2
	movs r0, #1
	str r0, [sp, #0x20]
_022627D2:
	adds r7, r7, #1
_022627D4:
	ldr r0, [sp, #0x28]
	adds r4, r4, #1
	cmp r4, r0
	blt _02262774
_022627DC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _022628C6
	ldr r0, [sp, #0x28]
	cmp r7, r0
	bne _022628C6
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _022627F8
	ldr r0, [sp, #0x10]
	movs r1, #0xf
	bl ov49_0225EF8C
	b _02262AB8
_022627F8:
	movs r0, #4
	strb r0, [r6]
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	b _02262AB8
_02262806:
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	bl FUN_0222F464
	cmp r0, #1
	bne _02262842
	ldr r0, [sp, #0x30]
	add r1, sp, #0x34
	bl FUN_0222A498
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	add r3, sp, #0x34
	adds r2, r0, #0
	ldrb r0, [r3, #1]
	str r0, [sp]
	ldrb r0, [r3, #2]
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldrb r1, [r6, #2]
	ldrb r3, [r3]
	ldr r0, [sp, #0x30]
	bl FUN_0222AC14
_02262842:
	adds r0, r5, #0
	bl ov49_0225A0CC
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	movs r2, #0x1c
	movs r3, #0x12
	bl ov49_02262C20
	b _02262AB8
_02262856:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x1a
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	ldr r0, [sp, #0x10]
	movs r1, #0x11
	bl ov49_0225EF8C
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02262DB8
	b _02262AB8
_0226287C:
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_02262CB4
	cmp r0, #0
	bne _022628C6
	adds r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _022628C6
	ldr r0, [sp, #0x10]
	movs r1, #0x12
	bl ov49_0225EF8C
	b _02262AB8
_022628A4:
	adds r0, r5, #0
	bl ov49_0225A294
	ldr r0, [sp, #0x10]
	movs r1, #0x13
	bl ov49_0225EF8C
	b _02262AB8
_022628B4:
	adds r0, r5, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _022628C8
	cmp r0, #1
	beq _022628DE
	cmp r0, #2
	beq _022628EE
_022628C6:
	b _02262AB8
_022628C8:
	adds r0, r5, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #0x10]
	movs r1, #0x17
	bl ov49_0225EF8C
	ldr r0, [sp, #0x30]
	bl FUN_0222A404
	b _02262AB8
_022628DE:
	adds r0, r5, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #0x10]
	movs r1, #0x14
	bl ov49_0225EF8C
	b _02262AB8
_022628EE:
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_02262CB4
	cmp r0, #1
	beq _02262904
	b _02262AB8
_02262904:
	adds r0, r5, #0
	bl ov49_0225A2F8
	b _02262AB8
_0226290C:
	ldrb r0, [r6, #1]
	bl FUN_0222F3E8
	strh r0, [r4]
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r1, r5, #0
	movs r3, #1
	str r0, [sp]
	adds r0, r4, #0
	ldrb r2, [r6, #2]
	adds r0, #0x3c
	bl ov49_02262D70
	adds r0, r4, #0
	adds r0, #0x3c
	adds r1, r5, #0
	movs r2, #1
	bl ov49_02262E04
	movs r1, #0
	ldrsh r2, [r4, r1]
	ldr r0, _02262AC0 @ =0x0000014A
	cmp r2, r0
	ble _02262948
	adds r0, r5, #0
	movs r2, #0xa
	bl ov49_0225A30C
	b _02262954
_02262948:
	movs r0, #1
	str r0, [r4, #0x14]
	adds r0, r5, #0
	movs r2, #0xb
	bl ov49_0225A30C
_02262954:
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
	ldr r0, [sp, #0x10]
	movs r1, #7
	bl ov49_0225EF8C
	b _02262AB8
_0226296C:
	ldrb r0, [r6, #1]
	bl FUN_0222F314
	movs r1, #8
	strb r1, [r6]
	cmp r0, #4
	bne _0226297E
	movs r2, #0x10
	b _02262980
_0226297E:
	movs r2, #0x12
_02262980:
	adds r0, r5, #0
	movs r1, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
	ldr r0, [sp, #0x10]
	movs r1, #9
	bl ov49_0225EF8C
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	ldrb r2, [r6, #2]
	adds r0, #0x3c
	adds r1, r5, #0
	movs r3, #1
	bl ov49_02262D70
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov49_02262E04
	b _02262AB8
_022629BE:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x12
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A09C
	adds r0, r5, #0
	bl ov49_0225A0BC
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	ldrb r2, [r6, #2]
	adds r0, #0x3c
	adds r1, r5, #0
	movs r3, #1
	bl ov49_02262D70
	adds r0, r4, #0
	adds r0, #0x3c
	movs r1, #0
	bl ov49_02262DD4
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov49_02262DF8
	ldr r0, [sp, #0x10]
	movs r1, #8
	bl ov49_0225EF8C
	b _02262AB8
_02262A08:
	bl FUN_020343E4
	bl FUN_0203986C
	ldr r0, [sp, #0x10]
	movs r1, #0x18
	bl ov49_0225EF8C
	b _02262AB8
_02262A1A:
	bl FUN_0203988C
	cmp r0, #0
	bne _02262AB8
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	bl ov49_0225EF8C
	b _02262AB8
_02262A2C:
	adds r0, r5, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02262AB8
	ldrb r1, [r4, #4]
	ldr r0, [sp, #0x10]
	bl ov49_0225EF8C
	b _02262AB8
_02262A40:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02262A4C
	subs r0, r0, #1
	strb r0, [r4, #5]
_02262A4C:
	movs r0, #5
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _02262AB8
	ldrb r0, [r4, #6]
	bl FUN_02037AC0
	ldr r0, [sp, #0x10]
	movs r1, #0x1b
	bl ov49_0225EF8C
	b _02262AB8
_02262A64:
	ldrh r0, [r4, #0xa]
	adds r0, r0, #1
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	cmp r0, #0x96
	blo _02262A7A
	ldrb r0, [r4, #6]
	bl FUN_02037AC0
	movs r0, #0
	strh r0, [r4, #0xa]
_02262A7A:
	ldrb r0, [r4, #6]
	bl FUN_02037B38
	cmp r0, #0
	beq _02262AB8
	ldrb r1, [r4, #4]
	ldr r0, [sp, #0x10]
	bl ov49_0225EF8C
	b _02262AB8
_02262A8E:
	adds r0, r5, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02262CA8
	adds r4, #0x3c
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02262DB8
	adds r0, r5, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #0x10]
	bl ov49_0225EF68
	add sp, #0x38
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262AB8:
	movs r0, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262AC0: .4byte 0x0000014A
	thumb_func_end ov49_02262028

	thumb_func_start ov49_02262AC4
ov49_02262AC4: @ 0x02262AC4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02262AD8
	cmp r0, #1
	beq _02262B02
	b _02262B0E
_02262AD8:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_020398D4
	bl FUN_020392A0
	cmp r0, #0
	bne _02262AF0
	bl FUN_020343E4
	bl FUN_0203986C
_02262AF0:
	adds r0, r4, #0
	movs r1, #1
	bl ov49_0225A018
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02262B0E
_02262B02:
	bl FUN_020392A0
	cmp r0, #1
	bne _02262B0E
	movs r0, #1
	pop {r3, r4, r5, pc}
_02262B0E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_02262AC4

	thumb_func_start ov49_02262B14
ov49_02262B14: @ 0x02262B14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov49_0225EF84
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02262B32
	cmp r0, #1
	beq _02262BA8
	b _02262BEC
_02262B32:
	adds r0, r6, #0
	movs r1, #8
	bl ov49_0225EF40
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov49_0225A040
	cmp r0, #0x27
	beq _02262B50
	cmp r0, #0x28
	beq _02262B56
	cmp r0, #0x29
	beq _02262B5C
	b _02262B62
_02262B50:
	movs r7, #0x2a
	movs r4, #0
	b _02262B6C
_02262B56:
	movs r7, #0x29
	movs r4, #1
	b _02262B6C
_02262B5C:
	movs r7, #0x2b
	movs r4, #2
	b _02262B6C
_02262B62:
	bl GF_AssertFail
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262B6C:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r5, #0
	movs r1, #1
	adds r2, r7, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A0FC
	movs r3, #0
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r4, #0
	str r3, [sp]
	bl ov49_02262D70
	ldr r0, [sp, #4]
	adds r1, r5, #0
	movs r2, #1
	bl ov49_02262E04
	adds r0, r6, #0
	bl ov49_0225EF90
	b _02262BEC
_02262BA8:
	ldr r0, _02262BF4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xf3
	tst r0, r1
	beq _02262BE2
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02262DB8
	adds r0, r5, #0
	bl ov49_0225A0EC
	adds r0, r5, #0
	bl ov49_02259FF0
	adds r4, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r6, #0
	bl ov49_0225EF68
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02262BE2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov49_02262E04
_02262BEC:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262BF4: .4byte 0x021D110C
	thumb_func_end ov49_02262B14

	thumb_func_start ov49_02262BF8
ov49_02262BF8: @ 0x02262BF8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r3, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r6, #0
	bl ov49_0225A08C
	ldr r0, [sp, #0x10]
	movs r1, #0x19
	strb r0, [r5, #4]
	adds r0, r4, #0
	bl ov49_0225EF8C
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_02262BF8

	thumb_func_start ov49_02262C20
ov49_02262C20: @ 0x02262C20
	strb r2, [r0, #4]
	strb r3, [r0, #6]
	movs r2, #0
	strb r2, [r0, #5]
	strh r2, [r0, #0xa]
	adds r0, r1, #0
	ldr r3, _02262C34 @ =ov49_0225EF8C
	movs r1, #0x1a
	bx r3
	nop
_02262C34: .4byte ov49_0225EF8C
	thumb_func_end ov49_02262C20

	thumb_func_start ov49_02262C38
ov49_02262C38: @ 0x02262C38
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r2, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r7, r3, #0
	bl ov49_0225A10C
	ldr r0, [sp]
	movs r4, #0
	str r6, [r0, #0x38]
	cmp r6, #0
	bls _02262C6E
_02262C54:
	adds r0, r5, #0
	movs r1, #0
	adds r2, r7, r4
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov49_0225A144
	adds r4, r4, #1
	cmp r4, r6
	blo _02262C54
_02262C6E:
	ldr r2, [sp]
	ldr r3, _02262CA4 @ =0x02269DFC
	adds r2, #0x18
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [sp]
	ldr r1, [r0, #0x38]
	strh r1, [r0, #0x28]
	ldr r1, [r0, #0x38]
	ldrh r0, [r0, #0x2a]
	cmp r0, r1
	bls _02262C96
	ldr r0, [sp]
	strh r1, [r0, #0x2a]
_02262C96:
	adds r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02262CA4: .4byte 0x02269DFC
	thumb_func_end ov49_02262C38

	thumb_func_start ov49_02262CA8
ov49_02262CA8: @ 0x02262CA8
	ldr r3, _02262CB0 @ =ov49_0225A134
	adds r0, r1, #0
	bx r3
	nop
_02262CB0: .4byte ov49_0225A134
	thumb_func_end ov49_02262CA8

	thumb_func_start ov49_02262CB4
ov49_02262CB4: @ 0x02262CB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r2, #0
	adds r0, r1, #0
	adds r6, r3, #0
	bl ov49_02259FE8
	str r0, [sp, #0x10]
	bl FUN_0203988C
	adds r7, r0, #0
	ldrb r0, [r4, #1]
	bl FUN_0222F314
	adds r2, r0, #0
	cmp r7, #0
	bne _02262CEA
	movs r0, #4
	strb r0, [r4]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02262CEA:
	cmp r7, #2
	bne _02262CFE
	adds r0, r6, #0
	movs r1, #0x15
	strh r2, [r5, #8]
	bl ov49_0225EF8C
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02262CFE:
	ldrb r0, [r5, #7]
	cmp r0, r2
	beq _02262D1E
	strb r2, [r5, #7]
	cmp r2, #4
	beq _02262D1E
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrb r1, [r4, #2]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x28]
	bl FUN_0222AC14
_02262D1E:
	ldrb r0, [r4, #1]
	bl FUN_0222F3E8
	strh r0, [r5]
	movs r0, #0
	ldrsh r2, [r5, r0]
	cmp r2, #0
	bne _02262D58
	ldrb r0, [r4, #1]
	bl FUN_0222F314
	cmp r0, #1
	bhi _02262D4A
	movs r0, #3
	strb r0, [r4]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02262D4A:
	adds r0, r6, #0
	movs r1, #0x16
	bl ov49_0225EF8C
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02262D58:
	ldr r1, _02262D6C @ =0x0000014A
	cmp r2, r1
	bgt _02262D68
	adds r0, r6, #0
	movs r1, #0x14
	bl ov49_0225EF8C
	movs r0, #1
_02262D68:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02262D6C: .4byte 0x0000014A
	thumb_func_end ov49_02262CB4

	thumb_func_start ov49_02262D70
ov49_02262D70: @ 0x02262D70
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r3, #0
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	cmp r4, #2
	blo _02262D82
	bl GF_AssertFail
_02262D82:
	movs r0, #0
	strb r0, [r5]
	strb r0, [r5, #1]
	strb r0, [r5, #2]
	strb r0, [r5, #3]
	strb r0, [r5, #4]
	strb r0, [r5, #5]
	strb r0, [r5, #6]
	strb r0, [r5, #7]
	strb r4, [r5, #6]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	strb r6, [r5, #3]
	bl ov49_02262DD4
	ldr r0, _02262DB4 @ =0x02269DF8
	movs r1, #0x12
	ldrb r0, [r0, r4]
	movs r2, #3
	movs r3, #0xd
	str r0, [sp]
	adds r0, r7, #0
	bl ov49_0225A204
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02262DB4: .4byte 0x02269DF8
	thumb_func_end ov49_02262D70

	thumb_func_start ov49_02262DB8
ov49_02262DB8: @ 0x02262DB8
	movs r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	ldr r3, _02262DD0 @ =ov49_0225A22C
	adds r0, r1, #0
	bx r3
	.align 2, 0
_02262DD0: .4byte ov49_0225A22C
	thumb_func_end ov49_02262DB8

	thumb_func_start ov49_02262DD4
ov49_02262DD4: @ 0x02262DD4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #0x1e
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #4
	ldrsh r0, [r4, r0]
	cmp r1, r0
	beq _02262DF6
	strh r1, [r4, #4]
	ldrb r1, [r4, #7]
	movs r0, #8
	orrs r0, r1
	strb r0, [r4, #7]
_02262DF6:
	pop {r4, pc}
	thumb_func_end ov49_02262DD4

	thumb_func_start ov49_02262DF8
ov49_02262DF8: @ 0x02262DF8
	push {r3, lr}
	movs r3, #0
	bl ov49_02262E10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02262DF8

	thumb_func_start ov49_02262E04
ov49_02262E04: @ 0x02262E04
	push {r3, lr}
	movs r3, #1
	bl ov49_02262E10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02262E04

	thumb_func_start ov49_02262E10
ov49_02262E10: @ 0x02262E10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	str r3, [sp, #4]
	cmp r2, #0
	beq _02262E22
	movs r0, #0xff
	strb r0, [r5, #7]
_02262E22:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _02262E32
	cmp r0, #1
	beq _02262E36
	cmp r0, #2
	beq _02262E3A
	b _02262E3E
_02262E32:
	movs r6, #0
	b _02262E44
_02262E36:
	movs r6, #1
	b _02262E44
_02262E3A:
	movs r6, #2
	b _02262E44
_02262E3E:
	bl GF_AssertFail
	movs r6, #2
_02262E44:
	adds r0, r6, #0
	bl FUN_0222F274
	adds r7, r0, #0
	ldrb r0, [r5]
	cmp r0, r7
	beq _02262E5A
	ldrb r1, [r5, #7]
	movs r0, #4
	orrs r0, r1
	strb r0, [r5, #7]
_02262E5A:
	strb r7, [r5]
	adds r0, r6, #0
	bl FUN_0222F294
	ldrb r1, [r5, #2]
	cmp r1, r0
	beq _02262E70
	ldrb r2, [r5, #7]
	movs r1, #4
	orrs r1, r2
	strb r1, [r5, #7]
_02262E70:
	strb r0, [r5, #2]
	cmp r7, #1
	bne _02262E7E
	adds r0, r6, #0
	bl FUN_0222F2D4
	b _02262E80
_02262E7E:
	movs r0, #4
_02262E80:
	ldrb r1, [r5, #1]
	cmp r1, r0
	beq _02262E8E
	ldrb r2, [r5, #7]
	movs r1, #2
	orrs r1, r2
	strb r1, [r5, #7]
_02262E8E:
	strb r0, [r5, #1]
	ldrb r1, [r5, #7]
	movs r0, #1
	tst r0, r1
	beq _02262EC8
	movs r0, #0x10
	movs r1, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x68
	bl ov49_0225A24C
	ldrb r1, [r5, #3]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x36
	bl ov49_0225A30C
	movs r2, #0
	adds r1, r0, #0
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov49_0225A23C
_02262EC8:
	ldrb r1, [r5, #7]
	movs r0, #4
	tst r0, r1
	beq _02262F18
	movs r2, #0x10
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0x68
	str r2, [sp]
	bl ov49_0225A24C
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02262F18
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _02262F18
	ldrb r0, [r5]
	cmp r0, #1
	bne _02262F18
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x45
	bl ov49_0225A30C
	adds r6, r0, #0
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x68
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0x10
	bl ov49_0225A23C
_02262F18:
	ldrb r1, [r5, #7]
	movs r0, #2
	tst r0, r1
	beq _02262F68
	movs r2, #0x20
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0x68
	str r2, [sp]
	bl ov49_0225A24C
	movs r0, #2
	str r0, [sp]
	movs r2, #1
	ldrb r1, [r5, #1]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov49_0225A31C
	movs r0, #2
	str r0, [sp]
	ldrb r2, [r5, #1]
	movs r1, #4
	adds r0, r4, #0
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0
	bl ov49_0225A31C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x44
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0x20
	bl ov49_0225A23C
_02262F68:
	ldrb r0, [r5, #6]
	cmp r0, #1
	bne _02262FAC
	ldrb r1, [r5, #7]
	movs r0, #8
	tst r0, r1
	beq _02262FAC
	movs r0, #0x10
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x40
	movs r3, #0x68
	bl ov49_0225A24C
	movs r2, #2
	str r2, [sp]
	movs r1, #4
	ldrsh r1, [r5, r1]
	adds r0, r4, #0
	movs r3, #0
	bl ov49_0225A31C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xf
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0x40
	bl ov49_0225A23C
_02262FAC:
	movs r0, #0
	strb r0, [r5, #7]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02262E10

	thumb_func_start ov49_02262FB4
ov49_02262FB4: @ 0x02262FB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	str r2, [sp, #0xc]
	bl ov49_02259FE8
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov49_0225A010
	str r0, [sp, #0x24]
	adds r0, r6, #0
	bl ov49_0225EF84
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_0222B034
	str r0, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_0222B040
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	bl FUN_0222B06C
	cmp r0, #0
	beq _0226300C
	cmp r4, #0
	beq _0226300C
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _0226300C
	adds r0, r6, #0
	movs r1, #0x20
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	movs r0, #0
	strh r0, [r4, #0xa]
_0226300C:
	cmp r4, #0
	beq _0226302E
	adds r0, r7, #0
	bl FUN_0222A5C0
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0226302A
	ldrb r1, [r4, #3]
	adds r0, r7, #0
	bl FUN_0222A578
	str r0, [sp, #0x14]
	b _0226302E
_0226302A:
	movs r0, #0
	str r0, [sp, #0x14]
_0226302E:
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02263056
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _02263056
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _02263056
	adds r0, r6, #0
	movs r1, #0x20
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	movs r0, #0
	strh r0, [r4, #0xa]
_02263056:
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x26
	bls _02263064
	bl _02263B5E
_02263064:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02263070: @ jump table
	.2byte _022630BE - _02263070 - 2 @ case 0
	.2byte _02263184 - _02263070 - 2 @ case 1
	.2byte _022631A8 - _02263070 - 2 @ case 2
	.2byte _022631F0 - _02263070 - 2 @ case 3
	.2byte _02263226 - _02263070 - 2 @ case 4
	.2byte _02263256 - _02263070 - 2 @ case 5
	.2byte _022632C8 - _02263070 - 2 @ case 6
	.2byte _022632F6 - _02263070 - 2 @ case 7
	.2byte _02263326 - _02263070 - 2 @ case 8
	.2byte _0226335E - _02263070 - 2 @ case 9
	.2byte _0226338C - _02263070 - 2 @ case 10
	.2byte _022633BA - _02263070 - 2 @ case 11
	.2byte _022633EA - _02263070 - 2 @ case 12
	.2byte _02263466 - _02263070 - 2 @ case 13
	.2byte _02263524 - _02263070 - 2 @ case 14
	.2byte _02263554 - _02263070 - 2 @ case 15
	.2byte _022635CC - _02263070 - 2 @ case 16
	.2byte _02263618 - _02263070 - 2 @ case 17
	.2byte _02263628 - _02263070 - 2 @ case 18
	.2byte _02263696 - _02263070 - 2 @ case 19
	.2byte _022636A8 - _02263070 - 2 @ case 20
	.2byte _022636E8 - _02263070 - 2 @ case 21
	.2byte _0226372A - _02263070 - 2 @ case 22
	.2byte _0226375C - _02263070 - 2 @ case 23
	.2byte _0226378A - _02263070 - 2 @ case 24
	.2byte _022637E2 - _02263070 - 2 @ case 25
	.2byte _02263828 - _02263070 - 2 @ case 26
	.2byte _02263870 - _02263070 - 2 @ case 27
	.2byte _022638B6 - _02263070 - 2 @ case 28
	.2byte _02263914 - _02263070 - 2 @ case 29
	.2byte _0226397C - _02263070 - 2 @ case 30
	.2byte _022639AA - _02263070 - 2 @ case 31
	.2byte _022639D8 - _02263070 - 2 @ case 32
	.2byte _02263A42 - _02263070 - 2 @ case 33
	.2byte _02263A74 - _02263070 - 2 @ case 34
	.2byte _02263A9C - _02263070 - 2 @ case 35
	.2byte _02263AD0 - _02263070 - 2 @ case 36
	.2byte _02263ADA - _02263070 - 2 @ case 37
	.2byte _02263AE6 - _02263070 - 2 @ case 38
_022630BE:
	adds r0, r6, #0
	movs r1, #0x50
	bl ov49_0225EF40
	adds r4, r0, #0
	movs r1, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x38
	str r1, [r4, #0x48]
	bl ov49_0226526C
	adds r0, r5, #0
	bl ov49_02259FF0
	str r0, [sp, #0x28]
	bl ov49_02258DAC
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	bl ov49_02258F40
	str r0, [sp, #0x30]
	cmp r0, #0
	bne _0226310A
	movs r0, #0
	strh r0, [r4, #0xa]
	adds r0, r6, #0
	movs r1, #0x26
	bl ov49_0225EF8C
	bl _02263B5E
_0226310A:
	movs r1, #4
	bl ov49_02258E60
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x2c]
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	str r0, [sp, #0x38]
	adds r0, r7, #0
	bl FUN_0222AE64
	ldr r2, [sp, #0x34]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov49_02264CA8
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x30]
	movs r1, #0
	str r0, [r4, #0x10]
	bl ov49_02259130
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x38]
	bl ov49_02259160
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x34]
	movs r2, #0
	bl ov49_0225EFF0
	ldr r0, _022634A0 @ =0x000005E4
	bl FUN_0200604C
	adds r0, r7, #0
	movs r1, #9
	bl FUN_0222A5E8
	ldr r0, [sp, #0x3c]
	cmp r0, #1
	bne _02263178
	ldr r1, [sp, #0x34]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A428
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225EF8C
	bl _02263B5E
_02263178:
	adds r0, r6, #0
	movs r1, #0x22
	bl ov49_0225EF8C
	bl _02263B5E
_02263184:
	ldrb r1, [r4, #3]
	adds r0, r7, #0
	bl FUN_0222AE74
	cmp r0, #1
	bne _0226319C
	adds r0, r6, #0
	movs r1, #2
	bl ov49_0225EF8C
	bl _02263B5E
_0226319C:
	adds r0, r6, #0
	movs r1, #0x22
	bl ov49_0225EF8C
	bl _02263B5E
_022631A8:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _022631E4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022631BA: @ jump table
	.2byte _022631D8 - _022631BA - 2 @ case 0
	.2byte _02263B5E - _022631BA - 2 @ case 1
	.2byte _022631C4 - _022631BA - 2 @ case 2
	.2byte _022631E4 - _022631BA - 2 @ case 3
	.2byte _022631E4 - _022631BA - 2 @ case 4
_022631C4:
	ldrb r1, [r4, #3]
	adds r0, r7, #0
	bl FUN_0222B0E8
	adds r0, r6, #0
	movs r1, #3
	bl ov49_0225EF8C
	bl _02263B5E
_022631D8:
	adds r0, r6, #0
	movs r1, #0x22
	bl ov49_0225EF8C
	bl _02263B5E
_022631E4:
	adds r0, r6, #0
	movs r1, #0x20
	bl ov49_0225EF8C
	bl _02263B5E
_022631F0:
	adds r0, r7, #0
	bl FUN_0222B0F8
	adds r0, r7, #0
	movs r1, #7
	bl FUN_0222B118
	ldr r0, [sp, #0x18]
	adds r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #4]
	adds r0, r4, #0
	bl ov49_02264D4C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #4
	adds r3, r6, #0
	bl ov49_02264CFC
	bl _02263B5E
_02263226:
	ldr r0, [sp, #0x14]
	adds r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #5]
	adds r0, r4, #0
	bl ov49_02264D4C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #5
	adds r3, r6, #0
	bl ov49_02264CFC
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0222AED8
	bl _02263B5E
_02263256:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _022632B6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02263268: @ jump table
	.2byte _022632B6 - _02263268 - 2 @ case 0
	.2byte _022632B6 - _02263268 - 2 @ case 1
	.2byte _02263272 - _02263268 - 2 @ case 2
	.2byte _0226329A - _02263268 - 2 @ case 3
	.2byte _022632B6 - _02263268 - 2 @ case 4
_02263272:
	adds r0, r5, #0
	bl ov49_0225A0CC
	adds r0, r7, #0
	bl FUN_0222B028
	cmp r0, #0
	beq _0226328E
	adds r0, r6, #0
	movs r1, #6
	bl ov49_0225EF8C
	bl _02263B5E
_0226328E:
	adds r0, r6, #0
	movs r1, #8
	bl ov49_0225EF8C
	bl _02263B5E
_0226329A:
	adds r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _022632AA
	adds r0, r5, #0
	bl ov49_0225A0BC
_022632AA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264EC8
	bl _02263B5E
_022632B6:
	adds r0, r6, #0
	movs r1, #0x20
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	bl _02263B5E
_022632C8:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02264E20
	cmp r0, #1
	bne _022632EA
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #7
	adds r3, r6, #0
	bl ov49_02264CFC
	bl _02263B5E
_022632EA:
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	bl _02263B5E
_022632F6:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x28
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #9
	adds r3, r6, #0
	bl ov49_02264CFC
	bl _02263B5E
_02263326:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrh r1, [r4, #8]
	adds r0, r5, #0
	movs r2, #1
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldrh r2, [r4, #8]
	adds r0, r5, #0
	bl ov49_02264C50
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #9
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226335E:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x2e
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xb
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226338C:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x36
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xb
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_022633BA:
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	ldr r3, _022634A4 @ =0x00000203
	adds r0, #0x14
	adds r1, r5, #0
	movs r2, #3
	bl ov49_02264F9C
	adds r1, r4, #0
	movs r2, #0
	adds r0, r5, #0
	adds r1, #0x14
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r4, #0
	bl ov49_02264F10
	adds r0, r6, #0
	movs r1, #0xc
	bl ov49_0225EF8C
	b _02263B5E
_022633EA:
	adds r0, r5, #0
	bl ov49_0225A1D4
	cmp r0, #0
	beq _022633FE
	cmp r0, #1
	beq _0226340A
	cmp r0, #2
	beq _02263428
	b _0226343A
_022633FE:
	adds r0, r6, #0
	movs r1, #0xd
	bl ov49_0225EF8C
	movs r0, #1
	b _02263444
_0226340A:
	adds r0, r6, #0
	movs r1, #0x13
	bl ov49_0225EF8C
	ldr r0, [r4, #0x10]
	movs r1, #4
	bl ov49_02258E60
	adds r2, r0, #0
	ldr r1, [sp, #0xc]
	adds r0, r7, #0
	bl FUN_0222AB94
	movs r0, #1
	b _02263444
_02263428:
	adds r0, r7, #0
	bl FUN_0222AF80
	adds r0, r6, #0
	movs r1, #0x21
	bl ov49_0225EF8C
	movs r0, #1
	b _02263444
_0226343A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264F24
	movs r0, #0
_02263444:
	cmp r0, #1
	beq _0226344A
	b _02263B5E
_0226344A:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	bl ov49_02265260
	adds r0, r4, #0
	bl ov49_02264F1C
	b _02263B5E
_02263466:
	ldr r0, [sp, #0x18]
	bl FUN_0222AAC8
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x14]
	bl FUN_0222AAC8
	ldr r1, [sp, #0x40]
	cmp r1, r0
	bne _022634D4
	movs r0, #1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #1
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _022634A8 @ =0x000001FB
	b _022634AC
	nop
_022634A0: .4byte 0x000005E4
_022634A4: .4byte 0x00000203
_022634A8: .4byte 0x000001FB
_022634AC:
	adds r0, r5, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x12
	adds r3, r6, #0
	bl ov49_02264CFC
	adds r0, r7, #0
	movs r1, #4
	bl FUN_0222AED8
	b _02263B5E
_022634D4:
	movs r2, #0
	strb r2, [r4, #0xc]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	bl ov49_0225A334
	movs r3, #1
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	str r3, [sp]
	bl ov49_02264E90
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #2
	bl ov49_02264E90
	movs r2, #0x7f
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	lsls r2, r2, #2
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xe
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263524:
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	ldr r3, _02263858 @ =0x00000206
	adds r0, #0x14
	adds r1, r5, #0
	movs r2, #2
	bl ov49_02264F9C
	adds r1, r4, #0
	movs r2, #0
	adds r0, r5, #0
	adds r1, #0x14
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r4, #0
	bl ov49_02264F10
	adds r0, r6, #0
	movs r1, #0xf
	bl ov49_0225EF8C
	b _02263B5E
_02263554:
	adds r0, r5, #0
	bl ov49_0225A1D4
	cmp r0, #0
	beq _02263564
	cmp r0, #1
	beq _02263594
	b _022635A0
_02263564:
	adds r0, r7, #0
	movs r1, #3
	bl FUN_0222AED8
	adds r0, r6, #0
	movs r1, #0x10
	bl ov49_0225EF8C
	ldr r0, [r4, #0x10]
	movs r1, #4
	bl ov49_02258E60
	adds r6, r0, #0
	ldr r0, [sp, #0x14]
	bl FUN_0222AAC8
	adds r3, r0, #0
	ldr r1, [sp, #0xc]
	adds r0, r7, #0
	adds r2, r6, #0
	bl FUN_0222ABD0
	movs r0, #1
	b _022635AA
_02263594:
	adds r0, r6, #0
	movs r1, #0xa
	bl ov49_0225EF8C
	movs r0, #1
	b _022635AA
_022635A0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264F24
	movs r0, #0
_022635AA:
	cmp r0, #1
	beq _022635B0
	b _02263B5E
_022635B0:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	bl ov49_02265260
	adds r0, r4, #0
	bl ov49_02264F1C
	b _02263B5E
_022635CC:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	movs r3, #1
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _0226385C @ =0x000001FE
	adds r0, r5, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x11
	adds r3, r6, #0
	bl ov49_02264CFC
	ldr r0, [sp, #0x14]
	bl FUN_0222AAC8
	adds r1, r0, #0
	adds r0, r7, #0
	bl FUN_0222A72C
	b _02263B5E
_02263618:
	ldr r0, _02263860 @ =0x000005BF
	bl FUN_0200604C
	adds r0, r6, #0
	movs r1, #0x12
	bl ov49_0225EF8C
	b _02263B5E
_02263628:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _02263686
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0226363A: @ jump table
	.2byte _02263686 - _0226363A - 2 @ case 0
	.2byte _02263686 - _0226363A - 2 @ case 1
	.2byte _02263644 - _0226363A - 2 @ case 2
	.2byte _0226366C - _0226363A - 2 @ case 3
	.2byte _02263686 - _0226363A - 2 @ case 4
_02263644:
	ldr r1, [sp, #0x14]
	adds r0, r4, #0
	bl ov49_02264F78
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _0226365C
	adds r0, r6, #0
	movs r1, #0x21
	bl ov49_0225EF8C
	b _02263664
_0226365C:
	adds r0, r6, #0
	movs r1, #0xa
	bl ov49_0225EF8C
_02263664:
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_0226366C:
	adds r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _0226367C
	adds r0, r5, #0
	bl ov49_0225A0BC
_0226367C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264EC8
	b _02263B5E
_02263686:
	adds r0, r6, #0
	movs r1, #0x20
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_02263696:
	adds r0, r7, #0
	movs r1, #5
	bl FUN_0222AED8
	adds r0, r6, #0
	movs r1, #0x14
	bl ov49_0225EF8C
	b _02263B5E
_022636A8:
	ldr r0, _02263864 @ =0x00000207
	adds r1, r5, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x14
	movs r2, #0x1e
	movs r3, #4
	bl ov49_02265044
	movs r0, #8
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x17
	adds r1, r4, #0
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, #0x14
	adds r3, r2, #0
	bl ov49_0225A1A4
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	adds r0, r4, #0
	bl ov49_02264F10
	b _02263B5E
_022636E8:
	adds r0, r5, #0
	bl ov49_0225A1D4
	movs r1, #1
	mvns r1, r1
	str r0, [sp, #0x44]
	cmp r0, r1
	beq _022636FE
	adds r1, r1, #1
	cmp r0, r1
	bne _02263708
_022636FE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264F24
	b _02263B5E
_02263708:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	bl ov49_02265260
	ldr r0, [sp, #0x44]
	movs r1, #0x16
	strb r0, [r4]
	adds r0, r6, #0
	bl ov49_0225EF8C
	b _02263B5E
_0226372A:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r3, [r4]
	ldr r2, _02263868 @ =0x000001DD
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, r3, r2
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x17
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226375C:
	movs r0, #0
	str r0, [sp]
	ldrb r3, [r4]
	adds r0, r4, #0
	adds r0, #0x14
	lsls r3, r3, #2
	adds r1, r5, #0
	movs r2, #4
	adds r3, #0x73
	bl ov49_02264F9C
	adds r1, r4, #0
	movs r2, #0
	adds r0, r5, #0
	adds r1, #0x14
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r6, #0
	movs r1, #0x18
	bl ov49_0225EF8C
	b _02263B5E
_0226378A:
	adds r0, r5, #0
	bl ov49_0225A1D4
	str r0, [sp, #0x48]
	cmp r0, #3
	bhi _022637D8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022637A2: @ jump table
	.2byte _022637AA - _022637A2 - 2 @ case 0
	.2byte _022637AA - _022637A2 - 2 @ case 1
	.2byte _022637AA - _022637A2 - 2 @ case 2
	.2byte _022637AA - _022637A2 - 2 @ case 3
_022637AA:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	bl ov49_02265260
	adds r0, r4, #0
	bl ov49_02264F1C
	ldrb r0, [r4]
	lsls r1, r0, #2
	ldr r0, [sp, #0x48]
	adds r0, r0, r1
	strb r0, [r4, #1]
	adds r0, r6, #0
	movs r1, #0x19
	bl ov49_0225EF8C
	b _02263B5E
_022637D8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264F24
	b _02263B5E
_022637E2:
	ldrb r2, [r4, #1]
	adds r0, r4, #0
	adds r0, #0x38
	adds r2, r2, #6
	lsls r2, r2, #0x10
	adds r1, r7, #0
	lsrs r2, r2, #0x10
	movs r3, #2
	bl ov49_02265274
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r3, [r4, #1]
	ldr r2, _0226386C @ =0x00000165
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, r3, r2
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x1a
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263828:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r2, [r4]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, #0x55
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x1b
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
	.align 2, 0
_02263858: .4byte 0x00000206
_0226385C: .4byte 0x000001FE
_02263860: .4byte 0x000005BF
_02263864: .4byte 0x00000207
_02263868: .4byte 0x000001DD
_0226386C: .4byte 0x00000165
_02263870:
	adds r0, r4, #0
	adds r0, #0x38
	bl ov49_022652D0
	cmp r0, #1
	bne _022638A2
	adds r0, r4, #0
	adds r0, #0x38
	bl ov49_022652E0
	cmp r0, #2
	bne _02263892
	adds r0, r6, #0
	movs r1, #0x1c
	bl ov49_0225EF8C
	b _02263B5E
_02263892:
	adds r0, r6, #0
	movs r1, #0x20
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_022638A2:
	adds r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	beq _022638AE
	b _02263B5E
_022638AE:
	adds r0, r5, #0
	bl ov49_0225A0BC
	b _02263B5E
_022638B6:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bhi _02263904
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022638C8: @ jump table
	.2byte _02263904 - _022638C8 - 2 @ case 0
	.2byte _02263904 - _022638C8 - 2 @ case 1
	.2byte _022638D2 - _022638C8 - 2 @ case 2
	.2byte _022638EA - _022638C8 - 2 @ case 3
	.2byte _02263904 - _022638C8 - 2 @ case 4
_022638D2:
	ldr r1, [sp, #0x14]
	adds r0, r4, #0
	bl ov49_02264F78
	adds r0, r6, #0
	movs r1, #0x1d
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_022638EA:
	adds r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _022638FA
	adds r0, r5, #0
	bl ov49_0225A0BC
_022638FA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264EC8
	b _02263B5E
_02263904:
	adds r0, r6, #0
	movs r1, #0x20
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _02263B5E
_02263914:
	ldr r0, [sp, #0x1c]
	subs r0, r0, #6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	cmp r0, #0x7e
	bhs _02263928
	cmp r0, #6
	bhs _02263932
_02263928:
	adds r0, r6, #0
	movs r1, #0x23
	bl ov49_0225EF8C
	b _02263B5E
_02263932:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldr r2, [sp, #0x10]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, #0xec
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	ldrb r1, [r4, #1]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bne _0226396A
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x1e
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226396A:
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x1f
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_0226397C:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x33
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xa
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_022639AA:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x32
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x25
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xa
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_022639D8:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	bl ov49_02265260
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x2d
	bl ov49_02264C04
	str r0, [sp, #0x4c]
	ldr r1, [sp, #0x4c]
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x4c]
	bl FUN_02026800
	str r0, [sp, #0x50]
	adds r0, r5, #0
	bl ov49_0225CB70
	ldr r1, [sp, #0x50]
	muls r0, r1, r0
	lsrs r1, r0, #1
	adds r1, #0x3c
	cmp r1, #0x80
	bhs _02263A22
	movs r1, #0x80
	b _02263A28
_02263A22:
	cmp r1, #0xff
	bls _02263A28
	movs r1, #0xff
_02263A28:
	movs r0, #0x24
	lsls r1, r1, #0x18
	str r0, [sp]
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	movs r2, #0x26
	adds r3, r6, #0
	bl ov49_02264CFC
	adds r0, r7, #0
	bl FUN_0222AFC4
	b _02263B5E
_02263A42:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x2b
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #0x24
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x26
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263A74:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x2a
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #0x24
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x26
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263A9C:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	movs r2, #0x59
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	lsls r2, r2, #2
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #0x24
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x26
	adds r3, r6, #0
	bl ov49_02264CFC
	b _02263B5E
_02263AD0:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov49_02264D14
	b _02263B5E
_02263ADA:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov49_02264D30
	b _02263B5E
_02263AE6:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	bne _02263AFE
	adds r1, r4, #0
	adds r1, #0x46
	ldrh r1, [r1]
	ldr r2, [r4, #0x48]
	adds r0, r7, #0
	bl FUN_0222A704
_02263AFE:
	adds r0, r7, #0
	bl FUN_0222AE64
	adds r0, r5, #0
	bl ov49_0225A0EC
	adds r0, r7, #0
	movs r1, #1
	bl FUN_0222A5E8
	adds r0, r5, #0
	bl ov49_02259FF0
	adds r7, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r7, #0
	movs r2, #1
	bl ov49_02258EEC
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02263B4C
	movs r1, #1
	bl ov49_02259130
	ldr r0, [r4, #0x10]
	movs r1, #4
	bl ov49_02258E60
	adds r1, r0, #0
	ldr r0, [sp, #0x24]
	movs r2, #1
	bl ov49_0225EFF0
	adds r0, r5, #0
	bl ov49_0225A4D0
_02263B4C:
	adds r0, r4, #0
	bl ov49_02264CF8
	adds r0, r6, #0
	bl ov49_0225EF68
	add sp, #0x54
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02263B5E:
	adds r0, r4, #0
	bl ov49_02264F60
	adds r4, #0x38
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov49_0226529C
	movs r0, #0
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_02262FB4

	thumb_func_start ov49_02263B74
ov49_02263B74: @ 0x02263B74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov49_02259FE8
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov49_0225EF84
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_0222B034
	str r0, [sp, #0x14]
	adds r0, r7, #0
	bl FUN_0222B040
	str r0, [sp, #0x10]
	adds r0, r7, #0
	bl FUN_0222B06C
	cmp r0, #0
	beq _02263BC2
	cmp r4, #0
	beq _02263BC2
	ldrh r0, [r4, #0xa]
	cmp r0, #1
	bne _02263BC2
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	movs r0, #0
	strh r0, [r4, #0xa]
_02263BC2:
	cmp r4, #0
	beq _02263BD8
	adds r0, r7, #0
	bl FUN_0222A5C0
	str r0, [sp, #0xc]
	ldrb r1, [r4, #3]
	adds r0, r7, #0
	bl FUN_0222A578
	str r0, [sp, #8]
_02263BD8:
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02263C00
	ldrh r0, [r4, #0xa]
	cmp r0, #1
	bne _02263C00
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02263C00
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	movs r0, #0
	strh r0, [r4, #0xa]
_02263C00:
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x1f
	bhi _02263CCA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02263C16: @ jump table
	.2byte _02263C56 - _02263C16 - 2 @ case 0
	.2byte _02263CC0 - _02263C16 - 2 @ case 1
	.2byte _02263CF4 - _02263C16 - 2 @ case 2
	.2byte _02263D28 - _02263C16 - 2 @ case 3
	.2byte _02263D9A - _02263C16 - 2 @ case 4
	.2byte _02263DC4 - _02263C16 - 2 @ case 5
	.2byte _02263DF2 - _02263C16 - 2 @ case 6
	.2byte _02263E2A - _02263C16 - 2 @ case 7
	.2byte _02263E58 - _02263C16 - 2 @ case 8
	.2byte _02263E86 - _02263C16 - 2 @ case 9
	.2byte _02263F4C - _02263C16 - 2 @ case 10
	.2byte _02263F88 - _02263C16 - 2 @ case 11
	.2byte _02263FD0 - _02263C16 - 2 @ case 12
	.2byte _0226400C - _02263C16 - 2 @ case 13
	.2byte _0226405A - _02263C16 - 2 @ case 14
	.2byte _0226409E - _02263C16 - 2 @ case 15
	.2byte _022640CC - _02263C16 - 2 @ case 16
	.2byte _0226412C - _02263C16 - 2 @ case 17
	.2byte _0226417A - _02263C16 - 2 @ case 18
	.2byte _022641AA - _02263C16 - 2 @ case 19
	.2byte _022641DA - _02263C16 - 2 @ case 20
	.2byte _0226420C - _02263C16 - 2 @ case 21
	.2byte _02264240 - _02263C16 - 2 @ case 22
	.2byte _022642CE - _02263C16 - 2 @ case 23
	.2byte _0226431A - _02263C16 - 2 @ case 24
	.2byte _02264364 - _02263C16 - 2 @ case 25
	.2byte _02264392 - _02263C16 - 2 @ case 26
	.2byte _022643FC - _02263C16 - 2 @ case 27
	.2byte _0226442E - _02263C16 - 2 @ case 28
	.2byte _0226445C - _02263C16 - 2 @ case 29
	.2byte _02264466 - _02263C16 - 2 @ case 30
	.2byte _02264472 - _02263C16 - 2 @ case 31
_02263C56:
	adds r0, r6, #0
	movs r1, #0x50
	bl ov49_0225EF40
	adds r4, r0, #0
	movs r1, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x46
	strh r1, [r0]
	adds r0, r7, #0
	str r1, [r4, #0x48]
	bl FUN_0222B020
	str r0, [sp, #0x18]
	ldr r2, [sp, #0x18]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov49_02264CA8
	str r0, [sp, #0x1c]
	ldr r0, _02263FC8 @ =0x000005E4
	bl FUN_0200604C
	adds r0, r7, #0
	movs r1, #9
	bl FUN_0222A5E8
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _02263CB4
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A428
	ldr r1, [sp, #0x18]
	adds r0, r7, #0
	bl FUN_0222B0E8
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225EF8C
	bl _022644DA
_02263CB4:
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	bl _022644DA
_02263CC0:
	adds r0, r7, #0
	bl FUN_0222B0B0
	cmp r0, #0
	bne _02263CCE
_02263CCA:
	bl _022644DA
_02263CCE:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #5]
	adds r0, r4, #0
	bl ov49_02264D4C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #2
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263CF4:
	adds r0, r7, #0
	bl FUN_0222B0F8
	adds r0, r7, #0
	movs r1, #7
	bl FUN_0222B118
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r2, r5, #0
	str r0, [sp, #4]
	ldrb r3, [r4, #4]
	adds r0, r4, #0
	bl ov49_02264D4C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #3
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263D28:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bhi _02263D8A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02263D3A: @ jump table
	.2byte _02263D8A - _02263D3A - 2 @ case 0
	.2byte _02263D8A - _02263D3A - 2 @ case 1
	.2byte _02263D70 - _02263D3A - 2 @ case 2
	.2byte _02263D44 - _02263D3A - 2 @ case 3
	.2byte _02263D8A - _02263D3A - 2 @ case 4
_02263D44:
	adds r0, r5, #0
	bl ov49_0225A0CC
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0222AED8
	adds r0, r7, #0
	bl FUN_0222B028
	cmp r0, #0
	beq _02263D66
	adds r0, r6, #0
	movs r1, #4
	bl ov49_0225EF8C
	b _022644DA
_02263D66:
	adds r0, r6, #0
	movs r1, #6
	bl ov49_0225EF8C
	b _022644DA
_02263D70:
	adds r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _02263D80
	adds r0, r5, #0
	bl ov49_0225A0BC
_02263D80:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264EC8
	b _022644DA
_02263D8A:
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263D9A:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02264E20
	cmp r0, #1
	bne _02263DBA
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #5
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263DBA:
	adds r0, r6, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _022644DA
_02263DC4:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x28
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #7
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263DF2:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrh r1, [r4, #8]
	adds r0, r5, #0
	movs r2, #1
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldrh r2, [r4, #8]
	adds r0, r5, #0
	bl ov49_02264C50
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #7
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263E2A:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x2f
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #9
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263E58:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x35
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #9
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263E86:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bhi _02263F3C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02263E98: @ jump table
	.2byte _02263F2C - _02263E98 - 2 @ case 0
	.2byte _02263F3C - _02263E98 - 2 @ case 1
	.2byte _02263F12 - _02263E98 - 2 @ case 2
	.2byte _02263EA2 - _02263E98 - 2 @ case 3
	.2byte _02263F3C - _02263E98 - 2 @ case 4
_02263EA2:
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _02263EB2
	cmp r0, #4
	beq _02263ECE
	cmp r0, #5
	beq _02263EEA
	b _02263EFC
_02263EB2:
	adds r0, r6, #0
	movs r1, #0xa
	bl ov49_0225EF8C
	adds r0, r7, #0
	bl FUN_0222B0BC
	movs r0, #1
	str r0, [r4, #0x4c]
	ldr r1, [sp, #8]
	adds r0, r4, #0
	bl ov49_02264F78
	b _02263F0A
_02263ECE:
	adds r0, r6, #0
	movs r1, #0xe
	bl ov49_0225EF8C
	adds r0, r7, #0
	bl FUN_0222B0BC
	movs r0, #1
	str r0, [r4, #0x4c]
	ldr r1, [sp, #8]
	adds r0, r4, #0
	bl ov49_02264F78
	b _02263F0A
_02263EEA:
	adds r0, r7, #0
	movs r1, #1
	bl FUN_0222AED8
	adds r0, r6, #0
	movs r1, #0xf
	bl ov49_0225EF8C
	b _02263F0A
_02263EFC:
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
_02263F0A:
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263F12:
	adds r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _02263F22
	adds r0, r5, #0
	bl ov49_0225A0BC
_02263F22:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264EC8
	b _022644DA
_02263F2C:
	adds r0, r6, #0
	movs r1, #0x1b
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263F3C:
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_02263F4C:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	movs r3, #1
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _02263FCC @ =0x000001FF
	adds r0, r5, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xb
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02263F88:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	movs r3, #1
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02264E90
	movs r2, #2
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	lsls r2, r2, #8
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xc
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
	nop
_02263FC8: .4byte 0x000005E4
_02263FCC: .4byte 0x000001FF
_02263FD0:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	movs r3, #1
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _02264348 @ =0x00000201
	adds r0, r5, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0xd
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226400C:
	ldr r0, _0226434C @ =0x000005BF
	bl FUN_0200604C
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldr r2, _02264350 @ =0x00000202
	adds r0, r5, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #8
	adds r3, r6, #0
	bl ov49_02264CFC
	adds r0, r7, #0
	movs r1, #2
	bl FUN_0222AED8
	adds r0, r7, #0
	bl FUN_0222A5C0
	bl FUN_0222AAC8
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A478
	b _022644DA
_0226405A:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	movs r3, #1
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov49_02264E90
	ldrb r1, [r4, #3]
	ldr r2, _02264354 @ =0x000001FB
	adds r0, r5, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x1b
	adds r3, r6, #0
	bl ov49_02264CFC
	adds r0, r7, #0
	movs r1, #2
	bl FUN_0222AED8
	b _022644DA
_0226409E:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	ldr r2, _02264358 @ =0x000002AF
	adds r0, r5, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x10
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_022640CC:
	ldr r0, [sp, #0x14]
	cmp r0, #4
	bhi _0226411C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022640DE: @ jump table
	.2byte _0226411C - _022640DE - 2 @ case 0
	.2byte _0226411C - _022640DE - 2 @ case 1
	.2byte _02264102 - _022640DE - 2 @ case 2
	.2byte _022640E8 - _022640DE - 2 @ case 3
	.2byte _0226411C - _022640DE - 2 @ case 4
_022640E8:
	adds r0, r6, #0
	movs r1, #0x11
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	adds r0, r7, #0
	bl FUN_0222B0BC
	movs r0, #1
	str r0, [r4, #0x4c]
	b _022644DA
_02264102:
	adds r0, r5, #0
	bl ov49_0225A0DC
	cmp r0, #0
	bne _02264112
	adds r0, r5, #0
	bl ov49_0225A0BC
_02264112:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264EC8
	b _022644DA
_0226411C:
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	adds r0, r5, #0
	bl ov49_0225A0CC
	b _022644DA
_0226412C:
	ldr r0, [sp, #0x10]
	cmp r0, #6
	blo _02264136
	cmp r0, #0x7e
	blo _02264140
_02264136:
	adds r0, r6, #0
	movs r1, #0x1a
	bl ov49_0225EF8C
	b _022644DA
_02264140:
	subs r0, r0, #6
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	movs r2, #0
	lsrs r0, r0, #2
	strb r0, [r4]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	bl ov49_0225A334
	ldrb r2, [r4]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, #0x37
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x12
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226417A:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r2, [r4]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, #0x55
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x13
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_022641AA:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r2, [r4, #2]
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, #0xec
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x14
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_022641DA:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r3, [r4]
	ldr r2, _0226435C @ =0x000001DD
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, r3, r2
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x15
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226420C:
	movs r0, #2
	str r0, [sp]
	ldrb r3, [r4]
	adds r0, r4, #0
	adds r0, #0x14
	lsls r3, r3, #2
	adds r1, r5, #0
	movs r2, #5
	adds r3, #0x73
	bl ov49_02264F9C
	adds r1, r4, #0
	movs r2, #0
	adds r0, r5, #0
	adds r1, #0x14
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r4, #0
	bl ov49_02264F10
	adds r0, r6, #0
	movs r1, #0x16
	bl ov49_0225EF8C
	b _022644DA
_02264240:
	adds r0, r5, #0
	bl ov49_0225A1D4
	cmp r0, #4
	bhi _0226429A
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02264256: @ jump table
	.2byte _02264260 - _02264256 - 2 @ case 0
	.2byte _02264260 - _02264256 - 2 @ case 1
	.2byte _02264260 - _02264256 - 2 @ case 2
	.2byte _02264260 - _02264256 - 2 @ case 3
	.2byte _02264282 - _02264256 - 2 @ case 4
_02264260:
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r0, r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	adds r1, r1, #6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl FUN_0222AED8
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	movs r0, #1
	b _022642A4
_02264282:
	movs r0, #0x7e
	strb r0, [r4, #1]
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	bl FUN_0222AED8
	adds r0, r6, #0
	movs r1, #0x1c
	bl ov49_0225EF8C
	movs r0, #1
	b _022642A4
_0226429A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02264F24
	movs r0, #0
_022642A4:
	cmp r0, #0
	bne _022642AA
	b _022644DA
_022642AA:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	bl ov49_02265260
	adds r0, r4, #0
	bl ov49_02264F1C
	ldr r1, [sp, #8]
	adds r0, r4, #0
	bl ov49_02264F78
	b _022644DA
_022642CE:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r3, [r4, #1]
	ldr r2, _02264360 @ =0x00000165
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	adds r2, r3, r2
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	ldrb r1, [r4, #2]
	ldrb r0, [r4, #1]
	cmp r1, r0
	bne _02264308
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x18
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02264308:
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x19
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226431A:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x33
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x19
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
	.align 2, 0
_02264348: .4byte 0x00000201
_0226434C: .4byte 0x000005BF
_02264350: .4byte 0x00000202
_02264354: .4byte 0x000001FB
_02264358: .4byte 0x000002AF
_0226435C: .4byte 0x000001DD
_02264360: .4byte 0x00000165
_02264364:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x34
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #8
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_02264392:
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	bl ov49_02265260
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x2d
	bl ov49_02264C04
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x20]
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x20]
	bl FUN_02026800
	str r0, [sp, #0x24]
	adds r0, r5, #0
	bl ov49_0225CB70
	ldr r1, [sp, #0x24]
	muls r0, r1, r0
	lsrs r1, r0, #1
	adds r1, #0x3c
	cmp r1, #0x80
	bhs _022643DC
	movs r1, #0x80
	b _022643E2
_022643DC:
	cmp r1, #0xff
	bls _022643E2
	movs r1, #0xff
_022643E2:
	movs r0, #0x1d
	lsls r1, r1, #0x18
	str r0, [sp]
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	movs r2, #0x1f
	adds r3, r6, #0
	bl ov49_02264CFC
	adds r0, r7, #0
	bl FUN_0222AFC4
	b _022644DA
_022643FC:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x2b
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #0x1d
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x1f
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226442E:
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r4, #3]
	adds r0, r5, #0
	movs r2, #0x31
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x1b
	adds r3, r6, #0
	bl ov49_02264CFC
	b _022644DA
_0226445C:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov49_02264D14
	b _022644DA
_02264466:
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov49_02264D30
	b _022644DA
_02264472:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	cmp r0, #1
	bne _0226448A
	adds r1, r4, #0
	adds r1, #0x46
	ldrh r1, [r1]
	ldr r2, [r4, #0x48]
	adds r0, r7, #0
	bl FUN_0222A704
_0226448A:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _02264498
	ldrb r1, [r4, #3]
	adds r0, r7, #0
	bl FUN_0222B0D8
_02264498:
	adds r0, r7, #0
	bl FUN_0222AE64
	adds r0, r5, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	bl ov49_02264CF8
	adds r0, r6, #0
	bl ov49_0225EF68
	adds r0, r7, #0
	movs r1, #1
	bl FUN_0222A5E8
	adds r0, r5, #0
	bl ov49_02259FF0
	adds r4, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r5, #0
	bl ov49_0225A4D0
	add sp, #0x28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022644DA:
	adds r0, r4, #0
	bl ov49_02264F60
	movs r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02263B74

	thumb_func_start ov49_022644E8
ov49_022644E8: @ 0x022644E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r6, r0, #0
	bl ov49_0225EF84
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_02259FE8
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov49_0225EF88
	cmp r0, #0x18
	bls _0226450A
	b _022649EA
_0226450A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02264516: @ jump table
	.2byte _02264548 - _02264516 - 2 @ case 0
	.2byte _02264588 - _02264516 - 2 @ case 1
	.2byte _022645A8 - _02264516 - 2 @ case 2
	.2byte _022645C8 - _02264516 - 2 @ case 3
	.2byte _022645E8 - _02264516 - 2 @ case 4
	.2byte _02264608 - _02264516 - 2 @ case 5
	.2byte _02264632 - _02264516 - 2 @ case 6
	.2byte _022646E0 - _02264516 - 2 @ case 7
	.2byte _02264700 - _02264516 - 2 @ case 8
	.2byte _0226471E - _02264516 - 2 @ case 9
	.2byte _02264796 - _02264516 - 2 @ case 10
	.2byte _022647C0 - _02264516 - 2 @ case 11
	.2byte _022647EA - _02264516 - 2 @ case 12
	.2byte _02264814 - _02264516 - 2 @ case 13
	.2byte _02264834 - _02264516 - 2 @ case 14
	.2byte _02264854 - _02264516 - 2 @ case 15
	.2byte _02264874 - _02264516 - 2 @ case 16
	.2byte _02264898 - _02264516 - 2 @ case 17
	.2byte _0226490E - _02264516 - 2 @ case 18
	.2byte _0226492E - _02264516 - 2 @ case 19
	.2byte _0226494E - _02264516 - 2 @ case 20
	.2byte _0226496E - _02264516 - 2 @ case 21
	.2byte _0226498E - _02264516 - 2 @ case 22
	.2byte _022649AE - _02264516 - 2 @ case 23
	.2byte _022649C2 - _02264516 - 2 @ case 24
_02264548:
	adds r0, r6, #0
	movs r1, #0x28
	bl ov49_0225EF40
	ldr r0, _02264894 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r7, #0
	bl FUN_0222A330
	cmp r0, #1
	bne _0226456A
	adds r0, r6, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _022649EA
_0226456A:
	adds r0, r7, #0
	bl FUN_0222A374
	cmp r0, #1
	bne _0226457E
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _022649EA
_0226457E:
	adds r0, r6, #0
	movs r1, #3
	bl ov49_0225EF8C
	b _022649EA
_02264588:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4e
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #0x18
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022645A8:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #0x18
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022645C8:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xf
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022645E8:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x10
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #5
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264608:
	adds r0, r5, #4
	adds r1, r4, #0
	bl ov49_02265110
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xf
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #4
	adds r3, r2, #0
	bl ov49_0225A1A4
	adds r0, r6, #0
	movs r1, #6
	bl ov49_0225EF8C
	b _022649EA
_02264632:
	adds r0, r4, #0
	movs r7, #0
	bl ov49_0225A1D4
	cmp r0, #7
	bhi _0226465A
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0226464A: @ jump table
	.2byte _02264664 - _0226464A - 2 @ case 0
	.2byte _02264670 - _0226464A - 2 @ case 1
	.2byte _0226467C - _0226464A - 2 @ case 2
	.2byte _02264688 - _0226464A - 2 @ case 3
	.2byte _02264694 - _0226464A - 2 @ case 4
	.2byte _022646A0 - _0226464A - 2 @ case 5
	.2byte _022646AC - _0226464A - 2 @ case 6
	.2byte _022646BE - _0226464A - 2 @ case 7
_0226465A:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _022646B8
	b _022646C8
_02264664:
	adds r0, r6, #0
	movs r1, #7
	bl ov49_0225EF8C
	movs r7, #1
	b _022646C8
_02264670:
	adds r0, r6, #0
	movs r1, #8
	bl ov49_0225EF8C
	movs r7, #1
	b _022646C8
_0226467C:
	adds r0, r6, #0
	movs r1, #0xd
	bl ov49_0225EF8C
	movs r7, #1
	b _022646C8
_02264688:
	adds r0, r6, #0
	movs r1, #0xe
	bl ov49_0225EF8C
	movs r7, #1
	b _022646C8
_02264694:
	adds r0, r6, #0
	movs r1, #0xf
	bl ov49_0225EF8C
	movs r7, #1
	b _022646C8
_022646A0:
	adds r0, r6, #0
	movs r1, #0x15
	bl ov49_0225EF8C
	movs r7, #1
	b _022646C8
_022646AC:
	adds r0, r6, #0
	movs r1, #0x10
	bl ov49_0225EF8C
	movs r7, #1
	b _022646C8
_022646B8:
	ldr r0, _02264894 @ =0x000005DC
	bl FUN_0200604C
_022646BE:
	adds r0, r6, #0
	movs r1, #0x16
	bl ov49_0225EF8C
	movs r7, #1
_022646C8:
	cmp r7, #1
	bne _02264780
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r5, #4
	adds r1, r4, #0
	bl ov49_02265260
	b _022649EA
_022646E0:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x17
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264700:
	adds r0, r5, #4
	adds r1, r4, #0
	bl ov49_022651E8
	movs r2, #0
	adds r0, r4, #0
	adds r1, r5, #4
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r6, #0
	movs r1, #9
	bl ov49_0225EF8C
	b _022649EA
_0226471E:
	adds r0, r4, #0
	movs r7, #0
	bl ov49_0225A1D4
	cmp r0, #3
	bhi _0226473E
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02264736: @ jump table
	.2byte _02264748 - _02264736 - 2 @ case 0
	.2byte _02264754 - _02264736 - 2 @ case 1
	.2byte _02264760 - _02264736 - 2 @ case 2
	.2byte _02264772 - _02264736 - 2 @ case 3
_0226473E:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _0226476C
	b _0226477C
_02264748:
	adds r0, r6, #0
	movs r1, #0xa
	bl ov49_0225EF8C
	movs r7, #1
	b _0226477C
_02264754:
	adds r0, r6, #0
	movs r1, #0xb
	bl ov49_0225EF8C
	movs r7, #1
	b _0226477C
_02264760:
	adds r0, r6, #0
	movs r1, #0xc
	bl ov49_0225EF8C
	movs r7, #1
	b _0226477C
_0226476C:
	ldr r0, _02264894 @ =0x000005DC
	bl FUN_0200604C
_02264772:
	adds r0, r6, #0
	movs r1, #4
	bl ov49_0225EF8C
	movs r7, #1
_0226477C:
	cmp r7, #1
	beq _02264782
_02264780:
	b _022649EA
_02264782:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r5, #4
	adds r1, r4, #0
	bl ov49_02265260
	b _022649EA
_02264796:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x18
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022647C0:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x19
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022647EA:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1a
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264814:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x12
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264834:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x13
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264854:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x14
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_02264874:
	adds r0, r5, #4
	adds r1, r4, #0
	bl ov49_02265170
	movs r2, #0
	adds r0, r4, #0
	adds r1, r5, #4
	adds r3, r2, #0
	bl ov49_0225A174
	adds r0, r6, #0
	movs r1, #0x11
	bl ov49_0225EF8C
	b _022649EA
	nop
_02264894: .4byte 0x000005DC
_02264898:
	adds r0, r4, #0
	movs r7, #0
	bl ov49_0225A1D4
	cmp r0, #3
	bhi _022648B8
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022648B0: @ jump table
	.2byte _022648C2 - _022648B0 - 2 @ case 0
	.2byte _022648CE - _022648B0 - 2 @ case 1
	.2byte _022648DA - _022648B0 - 2 @ case 2
	.2byte _022648EC - _022648B0 - 2 @ case 3
_022648B8:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _022648E6
	b _022648F6
_022648C2:
	adds r0, r6, #0
	movs r1, #0x12
	bl ov49_0225EF8C
	movs r7, #1
	b _022648F6
_022648CE:
	adds r0, r6, #0
	movs r1, #0x13
	bl ov49_0225EF8C
	movs r7, #1
	b _022648F6
_022648DA:
	adds r0, r6, #0
	movs r1, #0x14
	bl ov49_0225EF8C
	movs r7, #1
	b _022648F6
_022648E6:
	ldr r0, _022649F0 @ =0x000005DC
	bl FUN_0200604C
_022648EC:
	adds r0, r6, #0
	movs r1, #4
	bl ov49_0225EF8C
	movs r7, #1
_022648F6:
	cmp r7, #1
	bne _022649EA
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov49_0225A1E4
	adds r0, r5, #4
	adds r1, r4, #0
	bl ov49_02265260
	b _022649EA
_0226490E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1b
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226492E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1c
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226494E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1d
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226496E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x1e
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_0226498E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x16
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	movs r0, #0x18
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #0x17
	bl ov49_0225EF8C
	b _022649EA
_022649AE:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _022649EA
	ldr r1, [r5]
	adds r0, r6, #0
	bl ov49_0225EF8C
	b _022649EA
_022649C2:
	adds r0, r6, #0
	bl ov49_0225EF68
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	bl ov49_02259FF0
	adds r4, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov49_02258EEC
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_022649EA:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022649F0: .4byte 0x000005DC
	thumb_func_end ov49_022644E8

	thumb_func_start ov49_022649F4
ov49_022649F4: @ 0x022649F4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov49_0225EF84
	adds r0, r4, #0
	bl ov49_02259FE8
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #0
	beq _02264A1E
	cmp r0, #1
	bne _02264A16
	b _02264B56
_02264A16:
	cmp r0, #2
	bne _02264A1C
	b _02264B6A
_02264A1C:
	b _02264B8A
_02264A1E:
	ldr r0, _02264B90 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r6, #0
	bl FUN_0222A330
	cmp r0, #0
	bne _02264A54
	adds r0, r6, #0
	bl FUN_0222A374
	cmp r0, #1
	bne _02264A70
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4e
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02264B8A
_02264A54:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02264B8A
_02264A70:
	adds r0, r6, #0
	bl FUN_0222B134
	cmp r0, #8
	bhi _02264B3A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02264A86: @ jump table
	.2byte _02264A98 - _02264A86 - 2 @ case 0
	.2byte _02264AB0 - _02264A86 - 2 @ case 1
	.2byte _02264AC8 - _02264A86 - 2 @ case 2
	.2byte _02264AE0 - _02264A86 - 2 @ case 3
	.2byte _02264AF8 - _02264A86 - 2 @ case 4
	.2byte _02264B10 - _02264A86 - 2 @ case 5
	.2byte _02264B1E - _02264A86 - 2 @ case 6
	.2byte _02264B2C - _02264A86 - 2 @ case 7
	.2byte _02264B3A - _02264A86 - 2 @ case 8
_02264A98:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x49
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264AB0:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x49
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264AC8:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x49
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264AE0:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4d
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264AF8:
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl ov49_0225A37C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4d
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264B10:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4a
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264B1E:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4f
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264B2C:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4b
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264B46
_02264B3A:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x4c
	bl ov49_0225A30C
	adds r1, r0, #0
_02264B46:
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #1
	bl ov49_0225EF8C
	b _02264B8A
_02264B56:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _02264B8A
	adds r0, r5, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _02264B8A
_02264B6A:
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	bl ov49_02259FF0
	adds r4, r0, #0
	bl ov49_02258DAC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov49_02258EEC
	movs r0, #1
	pop {r4, r5, r6, pc}
_02264B8A:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_02264B90: .4byte 0x000005DC
	thumb_func_end ov49_022649F4

	thumb_func_start ov49_02264B94
ov49_02264B94: @ 0x02264B94
	push {r3, lr}
	sub sp, #8
	bl FUN_0222A9C8
	str r0, [sp]
	str r0, [sp, #4]
	add r0, sp, #0
	ldrb r0, [r0, #4]
	cmp r0, #0x18
	bhi _02264BF8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02264BB4: @ jump table
	.2byte _02264BF2 - _02264BB4 - 2 @ case 0
	.2byte _02264BF2 - _02264BB4 - 2 @ case 1
	.2byte _02264BF2 - _02264BB4 - 2 @ case 2
	.2byte _02264BF2 - _02264BB4 - 2 @ case 3
	.2byte _02264BE6 - _02264BB4 - 2 @ case 4
	.2byte _02264BE6 - _02264BB4 - 2 @ case 5
	.2byte _02264BE6 - _02264BB4 - 2 @ case 6
	.2byte _02264BE6 - _02264BB4 - 2 @ case 7
	.2byte _02264BE6 - _02264BB4 - 2 @ case 8
	.2byte _02264BE6 - _02264BB4 - 2 @ case 9
	.2byte _02264BE6 - _02264BB4 - 2 @ case 10
	.2byte _02264BEC - _02264BB4 - 2 @ case 11
	.2byte _02264BEC - _02264BB4 - 2 @ case 12
	.2byte _02264BEC - _02264BB4 - 2 @ case 13
	.2byte _02264BEC - _02264BB4 - 2 @ case 14
	.2byte _02264BEC - _02264BB4 - 2 @ case 15
	.2byte _02264BEC - _02264BB4 - 2 @ case 16
	.2byte _02264BEC - _02264BB4 - 2 @ case 17
	.2byte _02264BEC - _02264BB4 - 2 @ case 18
	.2byte _02264BF2 - _02264BB4 - 2 @ case 19
	.2byte _02264BF2 - _02264BB4 - 2 @ case 20
	.2byte _02264BF2 - _02264BB4 - 2 @ case 21
	.2byte _02264BF2 - _02264BB4 - 2 @ case 22
	.2byte _02264BF2 - _02264BB4 - 2 @ case 23
	.2byte _02264BF2 - _02264BB4 - 2 @ case 24
_02264BE6:
	add sp, #8
	movs r0, #0
	pop {r3, pc}
_02264BEC:
	add sp, #8
	movs r0, #1
	pop {r3, pc}
_02264BF2:
	add sp, #8
	movs r0, #2
	pop {r3, pc}
_02264BF8:
	bl GF_AssertFail
	movs r0, #1
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02264B94

	thumb_func_start ov49_02264C04
ov49_02264C04: @ 0x02264C04
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov49_02259FE8
	adds r1, r6, #0
	bl FUN_0222AB28
	cmp r0, #1
	bne _02264C36
	ldr r3, _02264C44 @ =0x02269EC4
	ldr r0, _02264C48 @ =0x00000163
	movs r2, #0
_02264C20:
	ldrh r1, [r3]
	cmp r4, r1
	bne _02264C2E
	ldr r0, _02264C4C @ =0x02269EC6
	lsls r1, r2, #2
	ldrh r4, [r0, r1]
	b _02264C36
_02264C2E:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, r0
	blo _02264C20
_02264C36:
	adds r0, r5, #0
	movs r1, #3
	adds r2, r4, #0
	bl ov49_0225A30C
	pop {r4, r5, r6, pc}
	nop
_02264C44: .4byte 0x02269EC4
_02264C48: .4byte 0x00000163
_02264C4C: .4byte 0x02269EC6
	thumb_func_end ov49_02264C04

	thumb_func_start ov49_02264C50
ov49_02264C50: @ 0x02264C50
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, r2, #0
	bl ov49_02259FE8
	adds r7, r0, #0
	adds r1, r5, #0
	bl FUN_0222AB28
	adds r5, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_0222AB28
	movs r2, #0x29
	cmp r5, #1
	bne _02264C7C
	cmp r0, #1
	bne _02264C7C
	ldr r2, _02264C9C @ =0x000002AA
	b _02264C92
_02264C7C:
	cmp r5, #1
	bne _02264C88
	cmp r0, #0
	bne _02264C88
	ldr r2, _02264CA0 @ =0x00000226
	b _02264C92
_02264C88:
	cmp r5, #0
	bne _02264C92
	cmp r0, #1
	bne _02264C92
	ldr r2, _02264CA4 @ =0x000002A9
_02264C92:
	adds r0, r4, #0
	movs r1, #3
	bl ov49_0225A30C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02264C9C: .4byte 0x000002AA
_02264CA0: .4byte 0x00000226
_02264CA4: .4byte 0x000002A9
	thumb_func_end ov49_02264C50

	thumb_func_start ov49_02264CA8
ov49_02264CA8: @ 0x02264CA8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r6, r2, #0
	mvns r0, r0
	adds r4, r1, #0
	cmp r6, r0
	bne _02264CBC
	bl GF_AssertFail
_02264CBC:
	strb r6, [r5, #3]
	adds r0, r4, #0
	bl FUN_0222A53C
	strh r0, [r5, #8]
	movs r0, #1
	strh r0, [r5, #0xa]
	adds r0, r4, #0
	bl FUN_0222A5C0
	adds r6, r0, #0
	ldrb r1, [r5, #3]
	adds r0, r4, #0
	bl FUN_0222A578
	adds r4, r0, #0
	bne _02264CE2
	movs r0, #0
	pop {r4, r5, r6, pc}
_02264CE2:
	adds r0, r6, #0
	bl ov49_02264B94
	strb r0, [r5, #4]
	adds r0, r4, #0
	bl ov49_02264B94
	strb r0, [r5, #5]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_02264CA8

	thumb_func_start ov49_02264CF8
ov49_02264CF8: @ 0x02264CF8
	bx lr
	.align 2, 0
	thumb_func_end ov49_02264CF8

	thumb_func_start ov49_02264CFC
ov49_02264CFC: @ 0x02264CFC
	strb r1, [r0, #6]
	ldr r1, _02264D0C @ =0xFFFFFFF0
	strb r2, [r0, #7]
	adds r0, r3, #0
	add r1, sp
	ldr r3, _02264D10 @ =ov49_0225EF8C
	ldrb r1, [r1, #0x10]
	bx r3
	.align 2, 0
_02264D0C: .4byte 0xFFFFFFF0
_02264D10: .4byte ov49_0225EF8C
	thumb_func_end ov49_02264CFC

	thumb_func_start ov49_02264D14
ov49_02264D14: @ 0x02264D14
	push {r3, lr}
	adds r2, r0, #0
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _02264D24
	subs r0, r0, #1
	strb r0, [r2, #6]
	pop {r3, pc}
_02264D24:
	adds r0, r1, #0
	ldrb r1, [r2, #7]
	bl ov49_0225EF8C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_02264D14

	thumb_func_start ov49_02264D30
ov49_02264D30: @ 0x02264D30
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r2, #0
	adds r4, r1, #0
	bl ov49_0225A0AC
	cmp r0, #0
	beq _02264D48
	ldrb r1, [r5, #7]
	adds r0, r4, #0
	bl ov49_0225EF8C
_02264D48:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov49_02264D30

	thumb_func_start ov49_02264D4C
ov49_02264D4C: @ 0x02264D4C
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl ov49_02264D9C
	ldr r3, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl ov49_02264D9C
	ldr r0, [sp, #0x10]
	bl FUN_0222AA10
	adds r4, r0, #0
	ldr r0, [sp, #0x14]
	bl FUN_0222AA10
	adds r3, r0, #0
	ldr r2, _02264D98 @ =0x02269E44
	lsls r4, r4, #4
	lsls r3, r3, #1
	adds r2, r2, r4
	ldrh r2, [r3, r2]
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov49_0225A08C
	pop {r3, r4, r5, pc}
	nop
_02264D98: .4byte 0x02269E44
	thumb_func_end ov49_02264D4C

	thumb_func_start ov49_02264D9C
ov49_02264D9C: @ 0x02264D9C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r3, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_0222AA10
	cmp r0, #7
	bhi _02264E12
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02264DBA: @ jump table
	.2byte _02264E12 - _02264DBA - 2 @ case 0
	.2byte _02264DCA - _02264DBA - 2 @ case 1
	.2byte _02264DD6 - _02264DBA - 2 @ case 2
	.2byte _02264DE2 - _02264DBA - 2 @ case 3
	.2byte _02264DEE - _02264DBA - 2 @ case 4
	.2byte _02264DFA - _02264DBA - 2 @ case 5
	.2byte _02264E12 - _02264DBA - 2 @ case 6
	.2byte _02264E06 - _02264DBA - 2 @ case 7
_02264DCA:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225A3AC
	pop {r4, r5, r6, pc}
_02264DD6:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225A3BC
	pop {r4, r5, r6, pc}
_02264DE2:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225A3CC
	pop {r4, r5, r6, pc}
_02264DEE:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225A3DC
	pop {r4, r5, r6, pc}
_02264DFA:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225A3EC
	pop {r4, r5, r6, pc}
_02264E06:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225A3FC
	pop {r4, r5, r6, pc}
_02264E12:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_0225A3BC
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_02264D9C

	thumb_func_start ov49_02264E20
ov49_02264E20: @ 0x02264E20
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r7, r2, #0
	bl FUN_0222A5C0
	str r0, [sp]
	ldrb r1, [r5, #3]
	adds r0, r6, #0
	bl FUN_0222A578
	adds r6, r0, #0
	ldr r0, [sp]
	bl FUN_0222AA28
	cmp r0, #0
	bne _02264E48
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02264E48:
	adds r0, r6, #0
	bl FUN_0222AA28
	cmp r0, #0
	bne _02264E56
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02264E56:
	ldrb r1, [r5, #5]
	ldrb r0, [r5, #4]
	cmp r0, r1
	beq _02264E8C
	cmp r1, #0
	beq _02264E6C
	cmp r1, #1
	beq _02264E70
	cmp r1, #2
	beq _02264E74
	b _02264E76
_02264E6C:
	movs r4, #0x27
	b _02264E76
_02264E70:
	movs r4, #0x25
	b _02264E76
_02264E74:
	movs r4, #0x26
_02264E76:
	adds r0, r7, #0
	movs r1, #3
	adds r2, r4, #0
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r7, #0
	bl ov49_0225A08C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02264E8C:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02264E20

	thumb_func_start ov49_02264E90
ov49_02264E90: @ 0x02264E90
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0222A5C0
	str r0, [sp]
	ldrb r1, [r5, #3]
	adds r0, r4, #0
	bl FUN_0222A578
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _02264EB6
	bl FUN_0222AAC8
	b _02264EBC
_02264EB6:
	ldr r0, [sp]
	bl FUN_0222AAC8
_02264EBC:
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r7, #0
	bl ov49_0225A39C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02264E90

	thumb_func_start ov49_02264EC8
ov49_02264EC8: @ 0x02264EC8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_02259FE8
	bl FUN_0222B094
	ldr r1, _02264F0C @ =0x000001C2
	cmp r0, r1
	bne _02264F08
	adds r0, r4, #0
	bl ov49_0225A0CC
	ldrb r1, [r5, #3]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A334
	movs r2, #0xab
	ldrb r1, [r5, #3]
	adds r0, r4, #0
	lsls r2, r2, #2
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r4, #0
	bl ov49_0225A0BC
_02264F08:
	pop {r3, r4, r5, pc}
	nop
_02264F0C: .4byte 0x000001C2
	thumb_func_end ov49_02264EC8

	thumb_func_start ov49_02264F10
ov49_02264F10: @ 0x02264F10
	movs r1, #0
	strh r1, [r0, #0xe]
	movs r1, #1
	strb r1, [r0, #0xd]
	bx lr
	.align 2, 0
	thumb_func_end ov49_02264F10

	thumb_func_start ov49_02264F1C
ov49_02264F1C: @ 0x02264F1C
	movs r1, #0
	strh r1, [r0, #0xe]
	strb r1, [r0, #0xd]
	bx lr
	thumb_func_end ov49_02264F1C

	thumb_func_start ov49_02264F24
ov49_02264F24: @ 0x02264F24
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0xd]
	adds r4, r1, #0
	cmp r0, #1
	bne _02264F56
	movs r0, #0xe
	ldrsh r1, [r5, r0]
	ldr r0, _02264F58 @ =0x000001C2
	cmp r1, r0
	bne _02264F56
	ldrb r1, [r5, #3]
	adds r0, r4, #0
	movs r2, #0
	bl ov49_0225A334
	ldrb r1, [r5, #3]
	ldr r2, _02264F5C @ =0x000002AB
	adds r0, r4, #0
	bl ov49_02264C04
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov49_0225A08C
_02264F56:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02264F58: .4byte 0x000001C2
_02264F5C: .4byte 0x000002AB
	thumb_func_end ov49_02264F24

	thumb_func_start ov49_02264F60
ov49_02264F60: @ 0x02264F60
	ldrb r1, [r0, #0xd]
	cmp r1, #1
	bne _02264F76
	movs r1, #0xe
	ldrsh r2, [r0, r1]
	movs r1, #0xe1
	lsls r1, r1, #2
	cmp r2, r1
	bgt _02264F76
	adds r1, r2, #1
	strh r1, [r0, #0xe]
_02264F76:
	bx lr
	thumb_func_end ov49_02264F60

	thumb_func_start ov49_02264F78
ov49_02264F78: @ 0x02264F78
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0222A9A4
	adds r1, r5, #0
	movs r2, #1
	adds r1, #0x44
	strh r2, [r1]
	adds r1, r5, #0
	adds r1, #0x46
	strh r0, [r1]
	adds r0, r4, #0
	bl FUN_0222A99C
	str r0, [r5, #0x48]
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02264F78

	thumb_func_start ov49_02264F9C
ov49_02264F9C: @ 0x02264F9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r7, r2, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	str r3, [sp, #4]
	ldr r6, [sp, #0x20]
	bl ov49_0225A10C
	ldr r0, [sp]
	movs r4, #0
	str r7, [r0, #0x20]
	cmp r7, #0
	bls _02265006
	subs r0, r7, #1
	str r0, [sp, #8]
_02264FC0:
	cmp r6, #0
	beq _02264FEA
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02264FEA
	cmp r6, #1
	bne _02264FDC
	ldr r2, _0226503C @ =0x00000205
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264FF8
_02264FDC:
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xeb
	bl ov49_0225A30C
	adds r1, r0, #0
	b _02264FF8
_02264FEA:
	ldr r2, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	adds r2, r2, r4
	bl ov49_0225A30C
	adds r1, r0, #0
_02264FF8:
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov49_0225A144
	adds r4, r4, #1
	cmp r4, r7
	blo _02264FC0
_02265006:
	ldr r3, _02265040 @ =0x02269E24
	ldr r2, [sp]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [sp]
	ldr r1, [r0, #0x20]
	strh r1, [r0, #0x10]
	ldr r1, [r0, #0x20]
	ldrh r0, [r0, #0x12]
	cmp r0, r1
	bls _0226502C
	ldr r0, [sp]
	strh r1, [r0, #0x12]
_0226502C:
	adds r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226503C: .4byte 0x00000205
_02265040: .4byte 0x02269E24
	thumb_func_end ov49_02264F9C

	thumb_func_start ov49_02265044
ov49_02265044: @ 0x02265044
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [sp, #0x20]
	adds r5, r1, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	str r3, [sp, #4]
	str r0, [sp, #0x24]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r4, r2, #0
	bl ov49_0225A120
	ldr r1, [sp, #4]
	ldr r0, [sp]
	movs r7, #0
	str r1, [r0, #0x20]
	adds r0, r1, #0
	beq _022650D4
	subs r0, r0, #1
	str r0, [sp, #8]
_02265070:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _022650A0
	ldr r0, [sp, #8]
	cmp r7, r0
	bne _022650A0
	ldr r0, [sp, #0x24]
	adds r6, r4, #0
	cmp r0, #1
	bne _02265092
	ldr r2, _02265108 @ =0x00000205
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225A30C
	adds r1, r0, #0
	b _022650C4
_02265092:
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xeb
	bl ov49_0225A30C
	adds r1, r0, #0
	b _022650C4
_022650A0:
	bl FUN_0201FDB8
	adds r1, r4, #0
	blx FUN_020F2BA4
	adds r0, r5, #0
	adds r6, r1, #0
	bl ov49_0225A164
	cmp r0, #1
	beq _022650A0
	ldr r2, [sp, #0x20]
	adds r0, r5, #0
	movs r1, #3
	adds r2, r2, r6
	bl ov49_0225A30C
	adds r1, r0, #0
_022650C4:
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov49_0225A144
	ldr r0, [sp, #4]
	adds r7, r7, #1
	cmp r7, r0
	blo _02265070
_022650D4:
	ldr r3, _0226510C @ =0x02269E24
	ldr r2, [sp]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [sp]
	ldr r1, [r0, #0x20]
	strh r1, [r0, #0x10]
	ldr r1, [r0, #0x20]
	ldrh r0, [r0, #0x12]
	cmp r0, r1
	bls _022650FA
	ldr r0, [sp]
	strh r1, [r0, #0x12]
_022650FA:
	adds r0, r5, #0
	bl ov49_0225A154
	ldr r1, [sp]
	str r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02265108: .4byte 0x00000205
_0226510C: .4byte 0x02269E24
	thumb_func_end ov49_02265044

	thumb_func_start ov49_02265110
ov49_02265110: @ 0x02265110
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r0, #0
	adds r0, r6, #0
	movs r1, #8
	bl ov49_0225A10C
	movs r0, #8
	ldr r5, _02265168 @ =0x02269E1C
	str r0, [r7, #0x20]
	movs r4, #0
_02265126:
	ldrb r2, [r5]
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r4, #0
	bl ov49_0225A144
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #8
	blt _02265126
	ldr r3, _0226516C @ =0x02269E24
	adds r2, r7, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r7, #0x20]
	strh r0, [r7, #0x10]
	ldr r0, [r7, #0x20]
	strh r0, [r7, #0x12]
	adds r0, r6, #0
	bl ov49_0225A154
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02265168: .4byte 0x02269E1C
_0226516C: .4byte 0x02269E24
	thumb_func_end ov49_02265110

	thumb_func_start ov49_02265170
ov49_02265170: @ 0x02265170
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225A10C
	movs r0, #4
	movs r4, #0
	str r0, [r6, #0x20]
	adds r7, r4, #0
_02265186:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov49_0225A38C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x27
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov49_0225A144
	adds r4, r4, #1
	cmp r4, #3
	blt _02265186
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x25
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #3
	bl ov49_0225A144
	ldr r3, _022651E4 @ =0x02269E24
	adds r2, r6, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x10]
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x12]
	adds r0, r5, #0
	bl ov49_0225A154
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022651E4: .4byte 0x02269E24
	thumb_func_end ov49_02265170

	thumb_func_start ov49_022651E8
ov49_022651E8: @ 0x022651E8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225A10C
	movs r0, #4
	movs r4, #0
	str r0, [r6, #0x20]
	adds r7, r4, #0
_022651FE:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov49_0225A37C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x26
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov49_0225A144
	adds r4, r4, #1
	cmp r4, #3
	blt _022651FE
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x25
	bl ov49_0225A30C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #3
	bl ov49_0225A144
	ldr r3, _0226525C @ =0x02269E24
	adds r2, r6, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x10]
	ldr r0, [r6, #0x20]
	strh r0, [r6, #0x12]
	adds r0, r5, #0
	bl ov49_0225A154
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0226525C: .4byte 0x02269E24
	thumb_func_end ov49_022651E8

	thumb_func_start ov49_02265260
ov49_02265260: @ 0x02265260
	ldr r3, _02265268 @ =ov49_0225A134
	adds r0, r1, #0
	bx r3
	nop
_02265268: .4byte ov49_0225A134
	thumb_func_end ov49_02265260

	thumb_func_start ov49_0226526C
ov49_0226526C: @ 0x0226526C
	movs r1, #0
	strh r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov49_0226526C

	thumb_func_start ov49_02265274
ov49_02265274: @ 0x02265274
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5]
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _02265288
	bl GF_AssertFail
_02265288:
	movs r0, #1
	strh r0, [r5]
	strh r4, [r5, #2]
	adds r0, r7, #0
	strh r6, [r5, #4]
	bl FUN_0222B034
	strh r0, [r5, #6]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02265274

	thumb_func_start ov49_0226529C
ov49_0226529C: @ 0x0226529C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5]
	adds r4, r1, #0
	cmp r0, #0
	beq _022652CE
	adds r0, r4, #0
	bl FUN_0222B034
	str r0, [r5, #8]
	ldrh r1, [r5, #4]
	cmp r0, r1
	bne _022652C4
	ldrh r1, [r5, #2]
	adds r0, r4, #0
	bl FUN_0222AED8
	movs r0, #0
	strh r0, [r5]
	pop {r3, r4, r5, pc}
_022652C4:
	ldrh r1, [r5, #6]
	cmp r0, r1
	beq _022652CE
	movs r0, #0
	strh r0, [r5]
_022652CE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_0226529C

	thumb_func_start ov49_022652D0
ov49_022652D0: @ 0x022652D0
	ldrh r0, [r0]
	cmp r0, #1
	beq _022652DA
	movs r0, #1
	bx lr
_022652DA:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_022652D0

	thumb_func_start ov49_022652E0
ov49_022652E0: @ 0x022652E0
	ldr r0, [r0, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	thumb_func_end ov49_022652E0

	thumb_func_start ov49_022652E8
ov49_022652E8: @ 0x022652E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x20]
	ldr r1, _02265354 @ =0x0001082C
	str r2, [sp]
	str r3, [sp, #4]
	ldr r5, [sp, #0x24]
	bl FUN_0201AA8C
	ldr r2, _02265354 @ =0x0001082C
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, [sp, #4]
	str r6, [r4]
	str r0, [r4, #4]
	ldr r0, [sp]
	ldr r1, [sp, #0x20]
	str r0, [r4, #8]
	movs r0, #0xd1
	str r7, [r4, #0xc]
	bl FUN_02007688
	adds r6, r0, #0
	ldr r0, _02265358 @ =0x0001081C
	adds r1, r5, #0
	adds r0, r4, r0
	movs r2, #4
	bl FUN_0201AC14
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov49_02265698
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov49_02265738
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov49_022657B4
	adds r0, r6, #0
	bl FUN_0200770C
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02265354: .4byte 0x0001082C
_02265358: .4byte 0x0001081C
	thumb_func_end ov49_022652E8

	thumb_func_start ov49_0226535C
ov49_0226535C: @ 0x0226535C
	push {r4, lr}
	adds r4, r0, #0
	bl ov49_0226571C
	adds r0, r4, #0
	bl ov49_02265760
	adds r0, r4, #0
	bl ov49_02265858
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov49_0226535C

	thumb_func_start ov49_02265378
ov49_02265378: @ 0x02265378
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	movs r7, #0xd1
	movs r4, #0
	adds r5, #0x10
	lsls r7, r7, #4
_02265386:
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov49_022658E4
	adds r4, r4, #1
	adds r5, r5, r7
	cmp r4, #0x14
	blt _02265386
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02265378

	thumb_func_start ov49_02265398
ov49_02265398: @ 0x02265398
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #4]
	bl ov49_02258DAC
	adds r5, r6, #0
	movs r7, #0xd1
	movs r4, #0
	adds r5, #0x10
	lsls r7, r7, #4
_022653AC:
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov49_02265920
	adds r4, r4, #1
	adds r5, r5, r7
	cmp r4, #0x14
	blt _022653AC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02265398

	thumb_func_start ov49_022653C0
ov49_022653C0: @ 0x022653C0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x14
	blo _022653D0
	bl GF_AssertFail
_022653D0:
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl ov49_02258D70
	adds r2, r0, #0
	beq _022653EE
	movs r1, #0xd1
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r5, #0x10
	muls r1, r4, r1
	adds r1, r5, r1
	adds r3, r6, #0
	bl ov49_02265890
_022653EE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_022653C0

	thumb_func_start ov49_022653F0
ov49_022653F0: @ 0x022653F0
	push {r3, lr}
	movs r2, #0xd1
	lsls r2, r2, #4
	adds r0, #0x10
	muls r2, r1, r2
	adds r0, r0, r2
	bl ov49_02265958
	cmp r0, #1
	beq _02265408
	movs r0, #1
	pop {r3, pc}
_02265408:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov49_022653F0

	thumb_func_start ov49_0226540C
ov49_0226540C: @ 0x0226540C
	push {r3, r4}
	ldr r4, [sp, #0x14]
	subs r2, r2, r1
	str r4, [r0]
	str r1, [r0, #4]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	ldr r1, [sp, #8]
	str r3, [r0, #8]
	subs r1, r1, r3
	str r1, [r0, #0x18]
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r3, [r0, #0x1c]
	str r2, [r0, #0xc]
	subs r1, r1, r2
	str r1, [r0, #0x20]
	str r2, [r0, #0x24]
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_0226540C

	thumb_func_start ov49_02265434
ov49_02265434: @ 0x02265434
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	movs r7, #0
	cmp r4, r0
	ble _02265448
	adds r4, r0, #0
	movs r7, #1
_02265448:
	ldr r6, [r5, #0x10]
	cmp r6, #0
	beq _022654CC
	cmp r0, #0
	ble _02265466
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #8]
	b _02265476
_02265466:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #8]
_02265476:
	cmp r4, #0
	ble _0226548C
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0226549A
_0226548C:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0226549A:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r6, r2, #0xc
	orrs r6, r0
	ldr r0, [sp, #8]
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020CCBA0
	ldr r1, [r5, #0x14]
	adds r0, r1, r0
	str r0, [r5, #4]
_022654CC:
	ldr r6, [r5, #0x18]
	cmp r6, #0
	beq _02265552
	ldr r0, [r5]
	cmp r0, #0
	ble _022654EC
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #4]
	b _022654FC
_022654EC:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #4]
_022654FC:
	cmp r4, #0
	ble _02265512
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02265520
_02265512:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02265520:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r6, r2, #0xc
	orrs r6, r0
	ldr r0, [sp, #4]
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020CCBA0
	ldr r1, [r5, #0x1c]
	adds r0, r1, r0
	str r0, [r5, #8]
_02265552:
	ldr r6, [r5, #0x20]
	cmp r6, #0
	beq _022655D8
	ldr r0, [r5]
	cmp r0, #0
	ble _02265572
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp]
	b _02265582
_02265572:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp]
_02265582:
	cmp r4, #0
	ble _02265598
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022655A6
_02265598:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022655A6:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r6, #0x1f
	adds r2, r6, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r4, r2, #0xc
	orrs r4, r0
	ldr r0, [sp]
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020CCBA0
	ldr r1, [r5, #0x24]
	adds r0, r1, r0
	str r0, [r5, #0xc]
_022655D8:
	adds r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02265434

	thumb_func_start ov49_022655E0
ov49_022655E0: @ 0x022655E0
	push {r3, r4}
	ldr r4, [r0, #4]
	str r4, [r1]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r3]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov49_022655E0

	thumb_func_start ov49_022655F4
ov49_022655F4: @ 0x022655F4
	push {r4, lr}
	adds r4, r0, #0
	strh r1, [r4]
	asrs r0, r1, #4
	lsls r1, r0, #2
	ldr r0, _02265624 @ =0x021094DC
	strh r2, [r4, #2]
	ldrsh r0, [r0, r1]
	adds r2, r3, #0
	str r3, [r4, #4]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r4, #8]
	pop {r4, pc}
	.align 2, 0
_02265624: .4byte 0x021094DC
	thumb_func_end ov49_022655F4

	thumb_func_start ov49_02265628
ov49_02265628: @ 0x02265628
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4]
	ldrh r0, [r4, #2]
	adds r0, r1, r0
	strh r0, [r4]
	ldrh r0, [r4]
	ldr r2, [r4, #4]
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0226565C @ =0x021094DC
	asrs r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asrs r1, r0, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [r4, #8]
	pop {r4, pc}
	.align 2, 0
_0226565C: .4byte 0x021094DC
	thumb_func_end ov49_02265628

	thumb_func_start ov49_02265660
ov49_02265660: @ 0x02265660
	ldr r0, [r0, #8]
	str r0, [r1]
	bx lr
	.align 2, 0
	thumb_func_end ov49_02265660

	thumb_func_start ov49_02265668
ov49_02265668: @ 0x02265668
	push {r3, r4, r5, lr}
	ldr r0, [r0, #4]
	ldr r4, [r1, #8]
	adds r5, r2, #0
	bl ov49_02258DAC
	cmp r4, r0
	bne _02265684
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl FUN_0200606C
	pop {r3, r4, r5, pc}
_02265684:
	adds r0, r4, #0
	bl ov49_02258F70
	cmp r0, #0
	bne _02265696
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
_02265696:
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02265668

	thumb_func_start ov49_02265698
ov49_02265698: @ 0x02265698
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	movs r4, #0
_022656A2:
	movs r0, #0
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r6, #0
	adds r1, #0x81
	movs r2, #0
	adds r3, r7, #0
	bl FUN_02007C98
	ldr r1, _0226570C @ =0x00010550
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	blx FUN_020C3B40
	ldr r1, _02265710 @ =0x00010554
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _022656EC
	adds r0, r1, #0
	adds r0, #8
	beq _022656E0
	ldrb r2, [r1, #9]
	cmp r2, #0
	bls _022656E0
	ldrh r2, [r1, #0xe]
	adds r0, r0, r2
	adds r0, r0, #4
	b _022656E2
_022656E0:
	movs r0, #0
_022656E2:
	cmp r0, #0
	beq _022656EC
	ldr r0, [r0]
	adds r1, r1, r0
	b _022656EE
_022656EC:
	movs r1, #0
_022656EE:
	ldr r0, _02265714 @ =0x00010558
	str r1, [r5, r0]
	movs r1, #0
	adds r0, r0, #4
	str r1, [r5, r0]
	ldr r0, _02265714 @ =0x00010558
	ldr r1, _02265718 @ =0x00007FFF
	ldr r0, [r5, r0]
	blx FUN_020C3558
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xf
	blt _022656A2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0226570C: .4byte 0x00010550
_02265710: .4byte 0x00010554
_02265714: .4byte 0x00010558
_02265718: .4byte 0x00007FFF
	thumb_func_end ov49_02265698

	thumb_func_start ov49_0226571C
ov49_0226571C: @ 0x0226571C
	push {r4, r5, r6, lr}
	ldr r6, _02265734 @ =0x00010550
	adds r5, r0, #0
	movs r4, #0
_02265724:
	ldr r0, [r5, r6]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xf
	blt _02265724
	pop {r4, r5, r6, pc}
	.align 2, 0
_02265734: .4byte 0x00010550
	thumb_func_end ov49_0226571C

	thumb_func_start ov49_02265738
ov49_02265738: @ 0x02265738
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r1, _0226575C @ =0x00010640
	adds r7, r2, #0
	movs r4, #0
	adds r5, r0, r1
_02265744:
	adds r2, r4, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, #0x90
	adds r3, r7, #0
	bl ov49_02258830
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x27
	blt _02265744
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0226575C: .4byte 0x00010640
	thumb_func_end ov49_02265738

	thumb_func_start ov49_02265760
ov49_02265760: @ 0x02265760
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r7, _022657A8 @ =0x02110928
	adds r5, r0, #0
	movs r4, #0
_0226576A:
	ldr r0, _022657AC @ =0x00010640
	ldr r0, [r5, r0]
	blx FUN_020C3B50
	add r1, sp, #4
	add r2, sp, #0
	adds r6, r0, #0
	blx FUN_020BE4D0
	ldr r0, [sp, #4]
	ldr r1, [r7]
	blx r1
	ldr r0, [sp]
	ldr r1, [r7]
	blx r1
	adds r0, r6, #0
	blx FUN_020BE588
	ldr r1, _022657B0 @ =0x02110930
	ldr r1, [r1]
	blx r1
	ldr r0, _022657AC @ =0x00010640
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x27
	blt _0226576A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022657A8: .4byte 0x02110928
_022657AC: .4byte 0x00010640
_022657B0: .4byte 0x02110930
	thumb_func_end ov49_02265760

	thumb_func_start ov49_022657B4
ov49_022657B4: @ 0x022657B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0
	ldr r4, _02265840 @ =0x0226A70C
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
_022657C4:
	ldr r0, _02265844 @ =0x0001081C
	movs r6, #0
	adds r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, _02265848 @ =0x000106DC
	adds r0, r5, r0
	str r0, [sp, #0x18]
	ldr r0, _0226584C @ =0x00010550
	adds r0, r5, r0
	str r0, [sp, #0x1c]
_022657D8:
	adds r7, r4, r6
	ldrb r1, [r7, #2]
	cmp r1, #0x11
	beq _0226582A
	movs r0, #0x14
	muls r0, r1, r0
	adds r1, r5, r0
	ldr r0, _02265848 @ =0x000106DC
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0226582A
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02265850 @ =0x00010640
	ldr r0, [r1, r0]
	blx FUN_020C3B50
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r2, r5, r1
	ldr r1, _02265854 @ =0x0001055C
	str r0, [r2, r1]
	ldrb r3, [r7, #2]
	ldr r0, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r1, r3, #0
	str r0, [sp, #4]
	movs r0, #0x14
	muls r1, r0, r1
	ldr r0, [sp, #0x18]
	adds r3, #0xb7
	adds r0, r0, r1
	ldrb r1, [r4]
	lsls r2, r1, #4
	ldr r1, [sp, #0x1c]
	adds r1, r1, r2
	ldr r2, [sp, #8]
	bl FUN_020180BC
_0226582A:
	adds r6, r6, #1
	cmp r6, #2
	blt _022657D8
	ldr r0, [sp, #0x10]
	adds r4, r4, #4
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0x27
	blt _022657C4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02265840: .4byte 0x0226A70C
_02265844: .4byte 0x0001081C
_02265848: .4byte 0x000106DC
_0226584C: .4byte 0x00010550
_02265850: .4byte 0x00010640
_02265854: .4byte 0x0001055C
	thumb_func_end ov49_022657B4

	thumb_func_start ov49_02265858
ov49_02265858: @ 0x02265858
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02265888 @ =0x000106DC
	movs r6, #0
	adds r4, r5, r0
	ldr r0, _0226588C @ =0x0001081C
	adds r7, r5, r0
_02265866:
	ldr r0, _02265888 @ =0x000106DC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0226587C
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_020180F8
	ldr r0, _02265888 @ =0x000106DC
	movs r1, #0
	str r1, [r5, r0]
_0226587C:
	adds r6, r6, #1
	adds r5, #0x14
	adds r4, #0x14
	cmp r6, #0x10
	blt _02265866
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02265888: .4byte 0x000106DC
_0226588C: .4byte 0x0001081C
	thumb_func_end ov49_02265858

	thumb_func_start ov49_02265890
ov49_02265890: @ 0x02265890
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r3, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r7, #0x1b
	blo _022658A2
	bl GF_AssertFail
_022658A2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02265948
	str r6, [r4, #8]
	adds r0, r6, #0
	movs r1, #5
	strb r7, [r4]
	bl ov49_02258E60
	adds r0, #0x28
	str r0, [r4, #4]
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r4, #0
	lsls r3, r2, #2
	ldr r2, _022658DC @ =0x0226A5A4
	ldr r2, [r2, r3]
	blx r2
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r4, #0
	lsls r3, r2, #2
	ldr r2, _022658E0 @ =0x0226A610
	ldr r2, [r2, r3]
	bl ov49_02265668
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022658DC: .4byte 0x0226A5A4
_022658E0: .4byte 0x0226A610
	thumb_func_end ov49_02265890

	thumb_func_start ov49_022658E4
ov49_022658E4: @ 0x022658E4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_02265958
	cmp r0, #0
	beq _02265918
	ldrb r0, [r4]
	cmp r0, #0x1b
	blo _022658FE
	bl GF_AssertFail
_022658FE:
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r1, r4, #0
	lsls r3, r2, #2
	ldr r2, _0226591C @ =0x0226A538
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #1
	bne _02265918
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02265948
_02265918:
	pop {r3, r4, r5, pc}
	nop
_0226591C: .4byte 0x0226A538
	thumb_func_end ov49_022658E4

	thumb_func_start ov49_02265920
ov49_02265920: @ 0x02265920
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov49_02265958
	cmp r0, #0
	bne _02265934
	movs r0, #0
	pop {r3, r4, r5, pc}
_02265934:
	ldrb r0, [r4]
	cmp r0, #0x1b
	blo _0226593E
	bl GF_AssertFail
_0226593E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02266AF0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02265920

	thumb_func_start ov49_02265948
ov49_02265948: @ 0x02265948
	ldr r3, _02265954 @ =FUN_020E5B44
	movs r2, #0xd1
	adds r0, r1, #0
	movs r1, #0
	lsls r2, r2, #4
	bx r3
	.align 2, 0
_02265954: .4byte FUN_020E5B44
	thumb_func_end ov49_02265948

	thumb_func_start ov49_02265958
ov49_02265958: @ 0x02265958
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02265962
	movs r0, #1
	bx lr
_02265962:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov49_02265958

	thumb_func_start ov49_02265968
ov49_02265968: @ 0x02265968
	lsls r1, r1, #2
	adds r1, r0, r1
	ldr r0, _0226597C @ =0x0000087C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02265978
	movs r0, #1
	bx lr
_02265978:
	movs r0, #0
	bx lr
	.align 2, 0
_0226597C: .4byte 0x0000087C
	thumb_func_end ov49_02265968

	thumb_func_start ov49_02265980
ov49_02265980: @ 0x02265980
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r2, #0
	str r0, [sp]
	adds r5, r1, #0
	adds r6, r3, #0
	cmp r4, #0x12
	blo _02265994
	bl GF_AssertFail
_02265994:
	ldr r0, _022659C8 @ =0x0000087C
	adds r7, r5, r0
	lsls r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _022659A6
	bl GF_AssertFail
_022659A6:
	ldr r0, [sp, #4]
	ldr r2, _022659CC @ =0x00010550
	ldr r1, [sp]
	str r6, [r7, r0]
	adds r2, r1, r2
	ldrb r1, [r6]
	movs r0, #0x78
	adds r5, #0xc
	muls r0, r4, r0
	lsls r1, r1, #4
	adds r0, r5, r0
	adds r1, r2, r1
	bl FUN_020181B0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022659C8: .4byte 0x0000087C
_022659CC: .4byte 0x00010550
	thumb_func_end ov49_02265980

	thumb_func_start ov49_022659D0
ov49_022659D0: @ 0x022659D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r2, #0
	str r0, [sp]
	lsls r7, r5, #2
	adds r0, r1, #0
	str r1, [sp, #4]
	adds r1, r0, r7
	ldr r0, _02265B04 @ =0x0000087C
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _022659EC
	bl GF_AssertFail
_022659EC:
	movs r0, #0x78
	adds r6, r5, #0
	muls r6, r0, r6
	ldr r0, [sp, #4]
	adds r0, #0xc
	adds r0, r0, r6
	bl FUN_020182A4
	cmp r0, #0
	beq _02265AFE
	ldr r0, [sp, #4]
	adds r1, r0, r7
	ldr r0, _02265B04 @ =0x0000087C
	ldr r2, [r1, r0]
	ldr r0, _02265B08 @ =0x00010550
	ldrb r3, [r2]
	ldr r1, [sp]
	adds r1, r1, r0
	lsls r3, r3, #4
	adds r1, r1, r3
	str r1, [sp, #0xc]
	ldrb r1, [r2, #1]
	adds r0, #0xf0
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r1, r1, r2
	ldr r0, [r1, r0]
	blx FUN_020C3B50
	ldr r1, [sp, #0xc]
	movs r2, #0
	str r0, [r1, #0xc]
	adds r0, r1, #0
	ldr r0, [r0, #8]
	ldr r1, [r1, #0xc]
	adds r3, r2, #0
	blx FUN_020BE890
	cmp r0, #0
	bne _02265A40
	bl GF_AssertFail
_02265A40:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	movs r2, #0
	ldr r0, [r0, #8]
	ldr r1, [r1, #0xc]
	adds r3, r2, #0
	blx FUN_020BEBB4
	cmp r0, #0
	bne _02265A58
	bl GF_AssertFail
_02265A58:
	ldr r0, [sp, #4]
	lsls r1, r5, #3
	adds r5, r0, r1
	adds r0, r0, r7
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, _02265B0C @ =0x000106DC
	str r0, [sp, #0x10]
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp]
	movs r4, #0
	adds r7, r0, r1
_02265A72:
	ldr r1, [sp, #8]
	ldr r0, _02265B04 @ =0x0000087C
	ldr r0, [r1, r0]
	adds r0, r0, r4
	ldrb r1, [r0, #2]
	cmp r1, #0x11
	beq _02265AA6
	movs r0, #0x14
	muls r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	adds r0, r0, r6
	adds r1, r7, r1
	bl FUN_020181D4
	ldr r1, _02265B10 @ =0x000008C4
	ldr r0, [sp, #0x14]
	ldr r1, [r5, r1]
	adds r0, r7, r0
	bl FUN_02018198
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02265A72
_02265AA6:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldr r0, [r0, #8]
	ldr r1, [r1, #4]
	blx FUN_020C3658
	ldr r0, [sp, #4]
	adds r0, #0xc
	str r0, [sp, #4]
	adds r0, r0, r6
	bl FUN_020181EC
	ldr r1, _02265B0C @ =0x000106DC
	ldr r0, [sp]
	ldr r7, _02265B04 @ =0x0000087C
	movs r4, #0
	adds r5, r0, r1
_02265AC8:
	ldr r0, [sp, #8]
	ldr r0, [r0, r7]
	adds r0, r0, r4
	ldrb r1, [r0, #2]
	cmp r1, #0x11
	beq _02265AE8
	ldr r0, [sp, #4]
	movs r2, #0x14
	muls r2, r1, r2
	adds r0, r0, r6
	adds r1, r5, r2
	bl FUN_020181E0
	adds r4, r4, #1
	cmp r4, #2
	blt _02265AC8
_02265AE8:
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #8]
	blx FUN_020BE940
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #8]
	blx FUN_020BEC7C
	ldr r0, [sp, #0xc]
	movs r1, #0
	str r1, [r0, #0xc]
_02265AFE:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02265B04: .4byte 0x0000087C
_02265B08: .4byte 0x00010550
_02265B0C: .4byte 0x000106DC
_02265B10: .4byte 0x000008C4
	thumb_func_end ov49_022659D0

	thumb_func_start ov49_02265B14
ov49_02265B14: @ 0x02265B14
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #2
	lsls r4, r4, #0xc
	str r4, [sp]
	bl ov49_02265B3C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_02265B14

	thumb_func_start ov49_02265B28
ov49_02265B28: @ 0x02265B28
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #2
	lsls r4, r4, #0xc
	str r4, [sp]
	bl ov49_02265B94
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov49_02265B28

	thumb_func_start ov49_02265B3C
ov49_02265B3C: @ 0x02265B3C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r1, _02265B88 @ =0x000106DC
	adds r6, r2, #0
	adds r0, r0, r1
	lsls r1, r6, #2
	adds r2, r4, r1
	ldr r1, _02265B8C @ =0x0000087C
	adds r5, r3, #0
	ldr r1, [r2, r1]
	adds r1, r1, r5
	ldrb r2, [r1, #2]
	movs r1, #0x14
	muls r1, r2, r1
	adds r0, r0, r1
	bl FUN_020181A4
	adds r1, r0, #0
	ldr r0, _02265B90 @ =0x000008C4
	lsls r2, r6, #3
	adds r0, r4, r0
	adds r4, r0, r2
	lsls r5, r5, #2
	ldr r2, [r4, r5]
	ldr r0, [sp, #0x10]
	adds r0, r0, r2
	cmp r0, r1
	bge _02265B78
	str r0, [r4, r5]
	pop {r4, r5, r6, pc}
_02265B78:
	movs r0, #2
	lsls r0, r0, #0xc
	adds r0, r2, r0
	blx FUN_020F2998
	str r1, [r4, r5]
	pop {r4, r5, r6, pc}
	nop
_02265B88: .4byte 0x000106DC
_02265B8C: .4byte 0x0000087C
_02265B90: .4byte 0x000008C4
	thumb_func_end ov49_02265B3C

	thumb_func_start ov49_02265B94
ov49_02265B94: @ 0x02265B94
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, _02265BDC @ =0x000106DC
	adds r4, r2, #0
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r2, r5, r1
	ldr r1, _02265BE0 @ =0x0000087C
	adds r6, r3, #0
	ldr r1, [r2, r1]
	adds r1, r1, r6
	ldrb r2, [r1, #2]
	movs r1, #0x14
	muls r1, r2, r1
	adds r0, r0, r1
	bl FUN_020181A4
	ldr r3, _02265BE4 @ =0x000008C4
	lsls r1, r4, #3
	adds r2, r5, r3
	adds r2, r2, r1
	lsls r1, r6, #2
	ldr r5, [sp, #0x10]
	ldr r4, [r2, r1]
	adds r4, r5, r4
	cmp r4, r0
	bge _02265BD0
	str r4, [r2, r1]
	movs r0, #0
	pop {r4, r5, r6, pc}
_02265BD0:
	subs r3, #0xc4
	subs r0, r0, r3
	str r0, [r2, r1]
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_02265BDC: .4byte 0x000106DC
_02265BE0: .4byte 0x0000087C
_02265BE4: .4byte 0x000008C4
	thumb_func_end ov49_02265B94

	thumb_func_start ov49_02265BE8
ov49_02265BE8: @ 0x02265BE8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, _02265C34 @ =0x000106DC
	adds r4, r2, #0
	adds r0, r0, r1
	lsls r1, r4, #2
	adds r2, r5, r1
	ldr r1, _02265C38 @ =0x0000087C
	adds r6, r3, #0
	ldr r1, [r2, r1]
	adds r1, r1, r6
	ldrb r2, [r1, #2]
	movs r1, #0x14
	muls r1, r2, r1
	adds r0, r0, r1
	bl FUN_020181A4
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bge _02265C24
	movs r1, #2
	lsls r2, r4, #3
	lsls r1, r1, #0xa
	adds r3, r5, r2
	lsls r2, r6, #2
	subs r0, r0, r1
	adds r2, r3, r2
	adds r1, #0xc4
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
_02265C24:
	lsls r0, r4, #3
	adds r2, r5, r0
	lsls r0, r6, #2
	adds r2, r2, r0
	ldr r0, _02265C3C @ =0x000008C4
	str r1, [r2, r0]
	pop {r4, r5, r6, pc}
	nop
_02265C34: .4byte 0x000106DC
_02265C38: .4byte 0x0000087C
_02265C3C: .4byte 0x000008C4
	thumb_func_end ov49_02265BE8

	thumb_func_start ov49_02265C40
ov49_02265C40: @ 0x02265C40
	push {r4, lr}
	lsls r2, r2, #2
	adds r2, r1, r2
	ldr r1, _02265C60 @ =0x0000087C
	ldr r4, _02265C64 @ =0x000106DC
	ldr r1, [r2, r1]
	adds r0, r0, r4
	adds r1, r1, r3
	ldrb r2, [r1, #2]
	movs r1, #0x14
	muls r1, r2, r1
	adds r0, r0, r1
	bl FUN_020181A0
	pop {r4, pc}
	nop
_02265C60: .4byte 0x0000087C
_02265C64: .4byte 0x000106DC
	thumb_func_end ov49_02265C40

	thumb_func_start ov49_02265C68
ov49_02265C68: @ 0x02265C68
	ldr r3, _02265C70 @ =ov49_02267A84
	movs r2, #1
	bx r3
	nop
_02265C70: .4byte ov49_02267A84
	thumb_func_end ov49_02265C68

	thumb_func_start ov49_02265C74
ov49_02265C74: @ 0x02265C74
	ldr r3, _02265C7C @ =ov49_02267A84
	movs r2, #2
	bx r3
	nop
_02265C7C: .4byte ov49_02267A84
	thumb_func_end ov49_02265C74

	thumb_func_start ov49_02265C80
ov49_02265C80: @ 0x02265C80
	ldr r3, _02265C88 @ =ov49_02267A84
	movs r2, #3
	bx r3
	nop
_02265C88: .4byte ov49_02267A84
	thumb_func_end ov49_02265C80

	thumb_func_start ov49_02265C8C
ov49_02265C8C: @ 0x02265C8C
	ldr r3, _02265C94 @ =ov49_02267C20
	movs r2, #1
	bx r3
	nop
_02265C94: .4byte ov49_02267C20
	thumb_func_end ov49_02265C8C

	thumb_func_start ov49_02265C98
ov49_02265C98: @ 0x02265C98
	ldr r3, _02265CA0 @ =ov49_02267C20
	movs r2, #2
	bx r3
	nop
_02265CA0: .4byte ov49_02267C20
	thumb_func_end ov49_02265C98

	thumb_func_start ov49_02265CA4
ov49_02265CA4: @ 0x02265CA4
	ldr r3, _02265CAC @ =ov49_02267C20
	movs r2, #3
	bx r3
	nop
_02265CAC: .4byte ov49_02267C20
	thumb_func_end ov49_02265CA4

	thumb_func_start ov49_02265CB0
ov49_02265CB0: @ 0x02265CB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r1, #0
	adds r5, r7, #0
	str r0, [sp]
	movs r4, #0
	adds r5, #0xc
_02265CBE:
	adds r3, r4, #3
	lsls r6, r3, #2
	ldr r3, _02265D08 @ =0x0226A70C
	ldr r0, [sp]
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	ldr r0, [r7, #8]
	add r1, sp, #4
	bl ov49_02259154
	movs r0, #2
	ldr r1, [sp, #8]
	lsls r0, r0, #0xe
	adds r2, r1, r0
	ldr r1, [sp, #4]
	ldr r3, [sp, #0xc]
	adds r0, r5, #0
	str r2, [sp, #8]
	bl FUN_020182A8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182A0
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, #3
	blt _02265CBE
	ldr r0, _02265D0C @ =0x00000954
	movs r1, #0xff
	str r1, [r7, r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02265D08: .4byte 0x0226A70C
_02265D0C: .4byte 0x00000954
	thumb_func_end ov49_02265CB0

	thumb_func_start ov49_02265D10
ov49_02265D10: @ 0x02265D10
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02265E40 @ =0x0226A730
	movs r2, #1
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov49_02265980
	ldr r3, _02265E44 @ =0x0226A73C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_02265980
	adds r0, r4, #0
	adds r0, #0x84
	movs r1, #0
	bl FUN_020182A0
	ldr r0, [r4, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	movs r2, #1
	ldr r0, [sp, #0x10]
	lsls r2, r2, #0x10
	adds r0, r0, r2
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	lsrs r0, r2, #1
	adds r0, r1, r0
	add r5, sp, #0xc
	str r0, [sp, #0xc]
	ldm r5!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #8
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r0, r0, r2
	str r0, [sp, #4]
	ldr r0, _02265E48 @ =0x00000958
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	movs r1, #6
	bl ov49_02258E60
	cmp r0, #3
	bhi _02265E20
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02265D80: @ jump table
	.2byte _02265D88 - _02265D80 - 2 @ case 0
	.2byte _02265DA8 - _02265D80 - 2 @ case 1
	.2byte _02265DCA - _02265D80 - 2 @ case 2
	.2byte _02265DF6 - _02265D80 - 2 @ case 3
_02265D88:
	movs r0, #7
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0xe
	subs r1, r1, r0
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	lsrs r0, r0, #1
	subs r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02265E4C @ =0x0000BFFF
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	b _02265E20
_02265DA8:
	movs r0, #6
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x14]
	movs r0, #0xb
	ldr r1, [sp, #8]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02265E50 @ =0x00003FFF
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	b _02265E20
_02265DCA:
	movs r0, #0x17
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #8]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x84
	movs r1, #0
	movs r2, #1
	bl FUN_020182E0
	b _02265E20
_02265DF6:
	movs r0, #0x17
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp]
	movs r1, #2
	ldr r0, [sp, #8]
	lsls r1, r1, #0xe
	adds r0, r0, r1
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x84
	subs r1, r1, #1
	movs r2, #1
	bl FUN_020182E0
_02265E20:
	adds r0, r4, #0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0x84
	bl FUN_020182A8
	adds r4, #0xc
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl FUN_020182A8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02265E40: .4byte 0x0226A730
_02265E44: .4byte 0x0226A73C
_02265E48: .4byte 0x00000958
_02265E4C: .4byte 0x0000BFFF
_02265E50: .4byte 0x00003FFF
	thumb_func_end ov49_02265D10

	thumb_func_start ov49_02265E54
ov49_02265E54: @ 0x02265E54
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02266058 @ =0x0226A730
	movs r2, #1
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov49_02265980
	ldr r3, _0226605C @ =0x0226A73C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_02265980
	ldr r3, _02266060 @ =0x0226A734
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ov49_02265980
	adds r0, r4, #0
	adds r0, #0x84
	movs r1, #0
	bl FUN_020182A0
	ldr r0, [r4, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	movs r2, #1
	ldr r0, [sp, #0x10]
	lsls r2, r2, #0x10
	adds r0, r0, r2
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	lsrs r0, r2, #1
	adds r0, r1, r0
	add r5, sp, #0xc
	str r0, [sp, #0xc]
	ldm r5!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #8
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r0, r0, r2
	str r0, [sp, #4]
	ldr r0, _02266064 @ =0x00000958
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	movs r1, #6
	bl ov49_02258E60
	cmp r0, #3
	bls _02265ECA
	b _02266046
_02265ECA:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02265ED6: @ jump table
	.2byte _02265EDE - _02265ED6 - 2 @ case 0
	.2byte _02265F32 - _02265ED6 - 2 @ case 1
	.2byte _02265F88 - _02265ED6 - 2 @ case 2
	.2byte _02265FE8 - _02265ED6 - 2 @ case 3
_02265EDE:
	movs r0, #7
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0xe
	subs r1, r1, r0
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	lsrs r0, r0, #1
	subs r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266068 @ =0x0000A38D
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _0226606C @ =0x0000DC70
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	adds r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0x84
	bl FUN_020182A8
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	subs r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0xfc
	bl FUN_020182A8
	b _02266046
_02265F32:
	movs r0, #6
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x14]
	movs r0, #0xb
	ldr r1, [sp, #8]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266070 @ =0x0000238E
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _02266074 @ =0x00005C71
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	subs r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0x84
	bl FUN_020182A8
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	adds r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0xfc
	bl FUN_020182A8
	b _02266046
_02265F88:
	movs r0, #0x17
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #8]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266078 @ =0x0000E38F
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _0226607C @ =0x00001C71
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0x84
	subs r3, r5, r3
	bl FUN_020182A8
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xfc
	adds r3, r5, r3
	bl FUN_020182A8
	b _02266046
_02265FE8:
	movs r0, #0x17
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #8]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266080 @ =0x0000638D
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _02266084 @ =0x00009C71
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0x84
	adds r3, r5, r3
	bl FUN_020182A8
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xfc
	subs r3, r5, r3
	bl FUN_020182A8
_02266046:
	adds r4, #0xc
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl FUN_020182A8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02266058: .4byte 0x0226A730
_0226605C: .4byte 0x0226A73C
_02266060: .4byte 0x0226A734
_02266064: .4byte 0x00000958
_02266068: .4byte 0x0000A38D
_0226606C: .4byte 0x0000DC70
_02266070: .4byte 0x0000238E
_02266074: .4byte 0x00005C71
_02266078: .4byte 0x0000E38F
_0226607C: .4byte 0x00001C71
_02266080: .4byte 0x0000638D
_02266084: .4byte 0x00009C71
	thumb_func_end ov49_02265E54

	thumb_func_start ov49_02266088
ov49_02266088: @ 0x02266088
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02266314 @ =0x0226A730
	movs r2, #1
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov49_02265980
	ldr r3, _02266318 @ =0x0226A73C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_02265980
	ldr r3, _0226631C @ =0x0226A734
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ov49_02265980
	ldr r3, _02266320 @ =0x0226A738
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #3
	bl ov49_02265980
	adds r0, r4, #0
	adds r0, #0x84
	movs r1, #0
	bl FUN_020182A0
	ldr r1, _02266324 @ =0x00000958
	movs r2, #8
	str r2, [r4, r1]
	adds r0, r1, #4
	str r2, [r4, r0]
	adds r1, #8
	str r2, [r4, r1]
	ldr r0, [r4, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	movs r2, #1
	ldr r0, [sp, #0x10]
	lsls r2, r2, #0x10
	adds r0, r0, r2
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	lsrs r0, r2, #1
	adds r0, r1, r0
	add r5, sp, #0xc
	str r0, [sp, #0xc]
	ldm r5!, {r0, r1}
	add r3, sp, #0
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #6
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r0, r0, r2
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	bl ov49_02258E60
	cmp r0, #3
	bls _0226610E
	b _02266302
_0226610E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0226611A: @ jump table
	.2byte _02266122 - _0226611A - 2 @ case 0
	.2byte _02266194 - _0226611A - 2 @ case 1
	.2byte _02266208 - _0226611A - 2 @ case 2
	.2byte _02266286 - _0226611A - 2 @ case 3
_02266122:
	movs r0, #7
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0xe
	subs r1, r1, r0
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	lsrs r0, r0, #1
	subs r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266328 @ =0x0000A38D
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _0226632C @ =0x0000DC70
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, _02266330 @ =0x0000BFFF
	adds r0, r4, r0
	movs r2, #1
	bl FUN_020182E0
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	adds r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0x84
	bl FUN_020182A8
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	subs r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0xfc
	bl FUN_020182A8
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r4, r0
	bl FUN_020182A8
	b _02266302
_02266194:
	movs r0, #6
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x14]
	movs r0, #0xb
	ldr r1, [sp, #8]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266334 @ =0x0000238E
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _02266338 @ =0x00005C71
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, _0226633C @ =0x00003FFF
	adds r0, r4, r0
	movs r2, #1
	bl FUN_020182E0
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	subs r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0x84
	bl FUN_020182A8
	movs r1, #2
	adds r0, r4, #0
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0xe
	adds r1, r2, r1
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, #0xfc
	bl FUN_020182A8
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r4, r0
	bl FUN_020182A8
	b _02266302
_02266208:
	movs r0, #0x17
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #8]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266340 @ =0x0000E38F
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _02266344 @ =0x00001C71
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r0, #0x5d
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	movs r2, #1
	bl FUN_020182E0
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0x84
	subs r3, r5, r3
	bl FUN_020182A8
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xfc
	adds r3, r5, r3
	bl FUN_020182A8
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r4, r0
	bl FUN_020182A8
	b _02266302
_02266286:
	movs r0, #0x17
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #0xc]
	movs r0, #7
	ldr r1, [sp]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #2
	ldr r1, [sp, #8]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r1, _02266348 @ =0x0000638D
	adds r0, #0x84
	movs r2, #1
	bl FUN_020182E0
	adds r0, r4, #0
	ldr r1, _0226634C @ =0x00009C71
	adds r0, #0xfc
	movs r2, #1
	bl FUN_020182E0
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, _02266350 @ =0x00007FFF
	adds r0, r4, r0
	movs r2, #1
	bl FUN_020182E0
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0x84
	adds r3, r5, r3
	bl FUN_020182A8
	movs r3, #2
	adds r0, r4, #0
	ldr r5, [sp, #0x14]
	lsls r3, r3, #0xe
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xfc
	subs r3, r5, r3
	bl FUN_020182A8
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r4, r0
	bl FUN_020182A8
_02266302:
	adds r4, #0xc
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r4, #0
	bl FUN_020182A8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_02266314: .4byte 0x0226A730
_02266318: .4byte 0x0226A73C
_0226631C: .4byte 0x0226A734
_02266320: .4byte 0x0226A738
_02266324: .4byte 0x00000958
_02266328: .4byte 0x0000A38D
_0226632C: .4byte 0x0000DC70
_02266330: .4byte 0x0000BFFF
_02266334: .4byte 0x0000238E
_02266338: .4byte 0x00005C71
_0226633C: .4byte 0x00003FFF
_02266340: .4byte 0x0000E38F
_02266344: .4byte 0x00001C71
_02266348: .4byte 0x0000638D
_0226634C: .4byte 0x00009C71
_02266350: .4byte 0x00007FFF
	thumb_func_end ov49_02266088

	thumb_func_start ov49_02266354
ov49_02266354: @ 0x02266354
	ldr r3, _0226635C @ =ov49_02266B28
	movs r2, #1
	bx r3
	nop
_0226635C: .4byte ov49_02266B28
	thumb_func_end ov49_02266354

	thumb_func_start ov49_02266360
ov49_02266360: @ 0x02266360
	ldr r3, _02266368 @ =ov49_02266B28
	movs r2, #2
	bx r3
	nop
_02266368: .4byte ov49_02266B28
	thumb_func_end ov49_02266360

	thumb_func_start ov49_0226636C
ov49_0226636C: @ 0x0226636C
	ldr r3, _02266374 @ =ov49_02266B28
	movs r2, #3
	bx r3
	nop
_02266374: .4byte ov49_02266B28
	thumb_func_end ov49_0226636C

	thumb_func_start ov49_02266378
ov49_02266378: @ 0x02266378
	ldr r3, _02266380 @ =ov49_02267908
	movs r2, #1
	bx r3
	nop
_02266380: .4byte ov49_02267908
	thumb_func_end ov49_02266378

	thumb_func_start ov49_02266384
ov49_02266384: @ 0x02266384
	ldr r3, _0226638C @ =ov49_02267908
	movs r2, #2
	bx r3
	nop
_0226638C: .4byte ov49_02267908
	thumb_func_end ov49_02266384

	thumb_func_start ov49_02266390
ov49_02266390: @ 0x02266390
	ldr r3, _02266398 @ =ov49_02267908
	movs r2, #4
	bx r3
	nop
_02266398: .4byte ov49_02267908
	thumb_func_end ov49_02266390

	thumb_func_start ov49_0226639C
ov49_0226639C: @ 0x0226639C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _022663DC @ =0x0226A7A8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_022663A8:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _022663E0 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _022663A8
	movs r0, #0
	str r0, [sp]
	ldr r0, _022663E4 @ =0x00000954
	ldr r1, _022663E8 @ =0x0226A454
	adds r0, r7, r0
	movs r2, #2
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022663DC: .4byte 0x0226A7A8
_022663E0: .4byte 0x0226A70C
_022663E4: .4byte 0x00000954
_022663E8: .4byte 0x0226A454
	thumb_func_end ov49_0226639C

	thumb_func_start ov49_022663EC
ov49_022663EC: @ 0x022663EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226642C @ =0x0226A7B8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_022663F8:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _02266430 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _022663F8
	movs r0, #0
	str r0, [sp]
	ldr r0, _02266434 @ =0x00000954
	ldr r1, _02266438 @ =0x0226A46C
	adds r0, r7, r0
	movs r2, #2
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226642C: .4byte 0x0226A7B8
_02266430: .4byte 0x0226A70C
_02266434: .4byte 0x00000954
_02266438: .4byte 0x0226A46C
	thumb_func_end ov49_022663EC

	thumb_func_start ov49_0226643C
ov49_0226643C: @ 0x0226643C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226647C @ =0x0226A7C8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_02266448:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _02266480 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _02266448
	movs r0, #0
	str r0, [sp]
	ldr r0, _02266484 @ =0x00000954
	ldr r1, _02266488 @ =0x0226A4B4
	adds r0, r7, r0
	movs r2, #3
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226647C: .4byte 0x0226A7C8
_02266480: .4byte 0x0226A70C
_02266484: .4byte 0x00000954
_02266488: .4byte 0x0226A4B4
	thumb_func_end ov49_0226643C

	thumb_func_start ov49_0226648C
ov49_0226648C: @ 0x0226648C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _022664CC @ =0x0226A7A8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_02266498:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _022664D0 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _02266498
	movs r0, #1
	str r0, [sp]
	ldr r0, _022664D4 @ =0x00000954
	ldr r1, _022664D8 @ =0x0226A464
	adds r0, r7, r0
	movs r2, #2
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022664CC: .4byte 0x0226A7A8
_022664D0: .4byte 0x0226A70C
_022664D4: .4byte 0x00000954
_022664D8: .4byte 0x0226A464
	thumb_func_end ov49_0226648C

	thumb_func_start ov49_022664DC
ov49_022664DC: @ 0x022664DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226651C @ =0x0226A7B8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_022664E8:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _02266520 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _022664E8
	movs r0, #1
	str r0, [sp]
	ldr r0, _02266524 @ =0x00000954
	ldr r1, _02266528 @ =0x0226A49C
	adds r0, r7, r0
	movs r2, #3
	movs r3, #0x29
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226651C: .4byte 0x0226A7B8
_02266520: .4byte 0x0226A70C
_02266524: .4byte 0x00000954
_02266528: .4byte 0x0226A49C
	thumb_func_end ov49_022664DC

	thumb_func_start ov49_0226652C
ov49_0226652C: @ 0x0226652C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0226656C @ =0x0226A7C8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_02266538:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _02266570 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _02266538
	movs r0, #1
	str r0, [sp]
	ldr r0, _02266574 @ =0x00000954
	ldr r1, _02266578 @ =0x0226A4C0
	adds r0, r7, r0
	movs r2, #3
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0226656C: .4byte 0x0226A7C8
_02266570: .4byte 0x0226A70C
_02266574: .4byte 0x00000954
_02266578: .4byte 0x0226A4C0
	thumb_func_end ov49_0226652C

	thumb_func_start ov49_0226657C
ov49_0226657C: @ 0x0226657C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _022665C0 @ =0x0226A7A8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_02266588:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _022665C4 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _02266588
	ldr r0, _022665C8 @ =0x00000954
	movs r2, #2
	str r2, [sp]
	ldr r1, _022665CC @ =0x0226A47C
	adds r0, r7, r0
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl ov49_02267C8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022665C0: .4byte 0x0226A7A8
_022665C4: .4byte 0x0226A70C
_022665C8: .4byte 0x00000954
_022665CC: .4byte 0x0226A47C
	thumb_func_end ov49_0226657C

	thumb_func_start ov49_022665D0
ov49_022665D0: @ 0x022665D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _02266614 @ =0x0226A7B8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_022665DC:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _02266618 @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _022665DC
	ldr r0, _0226661C @ =0x00000954
	movs r2, #2
	str r2, [sp]
	ldr r1, _02266620 @ =0x0226A45C
	adds r0, r7, r0
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl ov49_02267C8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02266614: .4byte 0x0226A7B8
_02266618: .4byte 0x0226A70C
_0226661C: .4byte 0x00000954
_02266620: .4byte 0x0226A45C
	thumb_func_end ov49_022665D0

	thumb_func_start ov49_02266624
ov49_02266624: @ 0x02266624
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _02266668 @ =0x0226A7C8
	str r0, [sp, #8]
	adds r7, r1, #0
	movs r4, #0
_02266630:
	ldrb r3, [r5]
	ldr r0, [sp, #8]
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _0226666C @ =0x0226A70C
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x10
	blt _02266630
	ldr r0, _02266670 @ =0x00000954
	movs r2, #2
	str r2, [sp]
	ldr r1, _02266674 @ =0x0226A474
	adds r0, r7, r0
	movs r3, #0x21
	str r7, [sp, #4]
	bl ov49_02267D98
	ldr r0, [sp, #8]
	adds r1, r7, #0
	bl ov49_02267C8C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02266668: .4byte 0x0226A7C8
_0226666C: .4byte 0x0226A70C
_02266670: .4byte 0x00000954
_02266674: .4byte 0x0226A474
	thumb_func_end ov49_02266624

	thumb_func_start ov49_02266678
ov49_02266678: @ 0x02266678
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	adds r5, r1, #0
	movs r0, #2
	ldrsh r0, [r5, r0]
	adds r0, r0, #1
	cmp r0, #0x36
	bgt _0226668C
	strh r0, [r5, #2]
_0226668C:
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #6
	muls r0, r1, r0
	movs r1, #0x36
	blx FUN_020F2998
	adds r6, r0, #0
	ldr r0, _02266740 @ =0x00000955
	ldrsb r4, [r5, r0]
	cmp r4, r6
	bhs _022666CA
	adds r7, r5, #0
	adds r7, #0xc
_022666A8:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	ldr r0, _02266744 @ =0x00000954
	ldrsb r0, [r5, r0]
	cmp r1, r0
	bhs _022666C4
	movs r0, #0x78
	muls r0, r1, r0
	adds r0, r7, r0
	movs r1, #1
	bl FUN_020182A0
_022666C4:
	adds r4, r4, #1
	cmp r4, r6
	blo _022666A8
_022666CA:
	ldr r1, _02266740 @ =0x00000955
	movs r0, #1
	str r0, [sp, #8]
	strb r6, [r5, r1]
	subs r0, r1, #1
	ldrsb r0, [r5, r0]
	movs r4, #0
	cmp r0, #0
	ble _02266724
	adds r7, r5, #0
	adds r7, #0xc
	adds r6, r7, #0
_022666E2:
	adds r0, r7, #0
	bl FUN_020182A4
	cmp r0, #1
	bne _02266716
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov49_02265B28
	str r0, [sp, #8]
	cmp r0, #0
	beq _02266716
	adds r0, r6, #0
	movs r1, #0
	bl FUN_020182A0
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov49_02265BE8
_02266716:
	ldr r0, _02266744 @ =0x00000954
	adds r4, r4, #1
	ldrsb r0, [r5, r0]
	adds r7, #0x78
	adds r6, #0x78
	cmp r4, r0
	blt _022666E2
_02266724:
	ldr r0, _02266740 @ =0x00000955
	ldrsb r0, [r5, r0]
	cmp r0, #6
	blt _02266738
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02266738
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02266738:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02266740: .4byte 0x00000955
_02266744: .4byte 0x00000954
	thumb_func_end ov49_02266678

	thumb_func_start ov49_02266748
ov49_02266748: @ 0x02266748
	ldr r3, _02266750 @ =ov49_02267AF0
	movs r2, #0
	bx r3
	nop
_02266750: .4byte ov49_02267AF0
	thumb_func_end ov49_02266748

	thumb_func_start ov49_02266754
ov49_02266754: @ 0x02266754
	ldr r3, _0226675C @ =ov49_02267AF0
	movs r2, #1
	bx r3
	nop
_0226675C: .4byte ov49_02267AF0
	thumb_func_end ov49_02266754

	thumb_func_start ov49_02266760
ov49_02266760: @ 0x02266760
	ldr r3, _02266768 @ =ov49_02267AF0
	movs r2, #2
	bx r3
	nop
_02266768: .4byte ov49_02267AF0
	thumb_func_end ov49_02266760

	thumb_func_start ov49_0226676C
ov49_0226676C: @ 0x0226676C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	lsls r0, r1, #1
	adds r1, r1, r0
	asrs r0, r1, #4
	lsrs r0, r0, #0x1b
	adds r0, r1, r0
	asrs r4, r0, #5
	ldr r0, _02266818 @ =0x00000954
	ldrsh r1, [r5, r0]
	cmp r4, r1
	beq _022667BA
	strh r4, [r5, r0]
	adds r0, r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, r4
	bls _022667BA
	cmp r4, #0
	beq _022667AA
	adds r2, r5, #0
	subs r1, r4, #1
	movs r0, #0x78
	muls r0, r1, r0
	adds r2, #0xc
	adds r0, r2, r0
	movs r1, #0
	bl FUN_020182A0
_022667AA:
	adds r1, r5, #0
	movs r0, #0x78
	adds r1, #0xc
	muls r0, r4, r0
	adds r0, r1, r0
	movs r1, #1
	bl FUN_020182A0
_022667BA:
	movs r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, #0x20
	bge _022667C6
	adds r0, r0, #1
	strh r0, [r5, #2]
_022667C6:
	ldr r0, _0226681C @ =0x00000956
	movs r4, #0
	ldrsh r0, [r5, r0]
	str r4, [sp]
	cmp r0, #0
	ble _02266812
	adds r6, r5, #0
	adds r6, #0xc
_022667D6:
	adds r0, r6, #0
	bl FUN_020182A4
	cmp r0, #0
	beq _02266806
	ldr r0, _0226681C @ =0x00000956
	ldrsh r0, [r5, r0]
	subs r0, r0, #1
	cmp r4, r0
	bne _022667FA
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov49_02265B28
	str r0, [sp]
	b _02266806
_022667FA:
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov49_02265B14
_02266806:
	ldr r0, _0226681C @ =0x00000956
	adds r4, r4, #1
	ldrsh r0, [r5, r0]
	adds r6, #0x78
	cmp r4, r0
	blt _022667D6
_02266812:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266818: .4byte 0x00000954
_0226681C: .4byte 0x00000956
	thumb_func_end ov49_0226676C

	thumb_func_start ov49_02266820
ov49_02266820: @ 0x02266820
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r0, _02266968 @ =0x0000087C
	adds r5, r1, #0
	ldr r0, [r5, r0]
	ldrb r0, [r0, #2]
	cmp r0, #0x11
	bne _02266836
	bl GF_AssertFail
_02266836:
	ldr r0, _0226696C @ =0x00000954
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0226684E
	subs r1, r1, #1
	str r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #0
	bl FUN_020182A0
	b _022668AA
_0226684E:
	movs r0, #2
	ldrsh r1, [r5, r0]
	cmp r1, #3
	bge _022668AA
	adds r0, r5, #0
	adds r1, r1, #1
	bl ov49_02265968
	cmp r0, #1
	bne _022668AA
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #1
	bl FUN_020182A0
	movs r2, #0
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r3, r2, #0
	bl ov49_02265B28
	cmp r0, #1
	bne _022668AA
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r2, #3
	adds r0, r0, #1
	strh r0, [r5, #2]
	ldr r0, _0226696C @ =0x00000954
	str r2, [r5, r0]
	ldrsh r0, [r5, r1]
	cmp r0, #3
	bge _022668A0
	movs r2, #0
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r3, r2, #0
	str r2, [sp]
	bl ov49_02265BE8
	b _022668AA
_022668A0:
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #0
	bl FUN_020182A0
_022668AA:
	adds r7, r5, #0
	movs r4, #1
	adds r7, #0xc
	str r4, [sp, #8]
	adds r7, #0x78
	adds r6, r5, #4
_022668B6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02265968
	cmp r0, #1
	bne _02266956
	movs r0, #2
	ldrsh r1, [r5, r0]
	subs r0, r4, #1
	cmp r1, r0
	ble _02266952
	adds r0, r7, #0
	movs r1, #1
	bl FUN_020182A0
	movs r0, #0xa
	lsls r0, r0, #0xa
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov49_02265B94
	cmp r0, #0
	bne _022668F0
	movs r0, #0
	str r0, [sp, #8]
	b _02266956
_022668F0:
	subs r0, r4, #1
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02266970 @ =0x00000958
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0226691E
	adds r0, r7, #0
	movs r1, #0
	bl FUN_020182A0
	ldr r0, _02266968 @ =0x0000087C
	ldr r0, [r6, r0]
	ldrb r0, [r0]
	lsls r1, r0, #4
	ldr r0, [sp, #4]
	adds r1, r0, r1
	ldr r0, _02266974 @ =0x00010558
	ldr r0, [r1, r0]
	movs r1, #0x1f
	blx FUN_020C3698
	b _02266956
_0226691E:
	ldr r0, _02266970 @ =0x00000958
	ldr r0, [r1, r0]
	subs r2, r0, #1
	ldr r0, _02266970 @ =0x00000958
	str r2, [r1, r0]
	subs r0, #0xdc
	ldr r0, [r6, r0]
	ldrb r0, [r0]
	lsls r2, r0, #4
	ldr r0, [sp, #4]
	adds r2, r0, r2
	ldr r0, _02266974 @ =0x00010558
	ldr r0, [r2, r0]
	ldr r2, _02266970 @ =0x00000958
	ldr r1, [r1, r2]
	movs r2, #0x14
	muls r2, r1, r2
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	asrs r1, r1, #3
	blx FUN_020C3698
	movs r0, #0
	str r0, [sp, #8]
	b _02266956
_02266952:
	movs r0, #0
	str r0, [sp, #8]
_02266956:
	adds r4, r4, #1
	adds r7, #0x78
	adds r6, r6, #4
	cmp r4, #3
	ble _022668B6
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02266968: .4byte 0x0000087C
_0226696C: .4byte 0x00000954
_02266970: .4byte 0x00000958
_02266974: .4byte 0x00010558
	thumb_func_end ov49_02266820

	thumb_func_start ov49_02266978
ov49_02266978: @ 0x02266978
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r2, [r4, #1]
	adds r5, r0, #0
	cmp r2, #0
	beq _0226698A
	cmp r2, #1
	beq _022669A0
	b _022669AC
_0226698A:
	bl ov49_02266D60
	cmp r0, #0
	beq _022669AC
	movs r0, #1
	strb r0, [r4, #1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02266EF8
	b _022669AC
_022669A0:
	bl ov49_022670B8
	cmp r0, #0
	beq _022669AC
	movs r0, #1
	pop {r3, r4, r5, pc}
_022669AC:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02266978

	thumb_func_start ov49_022669B0
ov49_022669B0: @ 0x022669B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r1, _02266A7C @ =0x00000955
	str r0, [sp]
	adds r0, r1, #1
	ldrsb r2, [r5, r1]
	ldrb r0, [r5, r0]
	cmp r2, r0
	bge _02266A1C
	subs r0, r1, #1
	ldrsb r0, [r5, r0]
	adds r2, r0, #1
	subs r0, r1, #1
	strb r2, [r5, r0]
	ldrsb r0, [r5, r0]
	cmp r0, #8
	blt _022669E0
	movs r2, #0
	subs r0, r1, #1
	strb r2, [r5, r0]
	ldrsb r0, [r5, r1]
	adds r0, r0, #1
	strb r0, [r5, r1]
_022669E0:
	ldr r0, _02266A80 @ =0x00000954
	ldrsb r1, [r5, r0]
	lsls r2, r1, #2
	asrs r1, r2, #2
	lsrs r1, r1, #0x1d
	adds r1, r2, r1
	asrs r2, r1, #3
	adds r1, r0, #1
	ldrsb r1, [r5, r1]
	adds r0, r0, #3
	ldrb r6, [r5, r0]
	lsls r1, r1, #2
	adds r7, r2, r1
	cmp r6, r7
	bhs _02266A18
	adds r1, r5, #0
	movs r0, #0x78
	adds r1, #0xc
	muls r0, r6, r0
	adds r4, r1, r0
_02266A08:
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020182A0
	adds r6, r6, #1
	adds r4, #0x78
	cmp r6, r7
	blo _02266A08
_02266A18:
	ldr r0, _02266A84 @ =0x00000957
	strb r7, [r5, r0]
_02266A1C:
	ldr r0, _02266A84 @ =0x00000957
	movs r4, #0
	ldrb r0, [r5, r0]
	cmp r0, #0
	ble _02266A5C
	adds r7, r5, #0
	adds r7, #0xc
	adds r6, r7, #0
_02266A2C:
	adds r0, r7, #0
	bl FUN_020182A4
	cmp r0, #1
	bne _02266A4E
	ldr r0, [sp]
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov49_02267A1C
	str r0, [sp, #4]
	cmp r0, #1
	bne _02266A4E
	adds r0, r6, #0
	movs r1, #0
	bl FUN_020182A0
_02266A4E:
	ldr r0, _02266A84 @ =0x00000957
	adds r4, r4, #1
	ldrb r0, [r5, r0]
	adds r7, #0x78
	adds r6, #0x78
	cmp r4, r0
	blt _02266A2C
_02266A5C:
	ldr r0, _02266A7C @ =0x00000955
	ldrsb r1, [r5, r0]
	adds r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r1, r0
	bne _02266A74
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _02266A74
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02266A74:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266A7C: .4byte 0x00000955
_02266A80: .4byte 0x00000954
_02266A84: .4byte 0x00000957
	thumb_func_end ov49_022669B0

	thumb_func_start ov49_02266A88
ov49_02266A88: @ 0x02266A88
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #2
	ldr r0, _02266AAC @ =0x00000954
	ldrsh r1, [r4, r1]
	adds r0, r4, r0
	bl ov49_02267E18
	movs r1, #2
	ldrsh r1, [r4, r1]
	adds r1, r1, #1
	strh r1, [r4, #2]
	cmp r0, #2
	bne _02266AA8
	movs r0, #1
	pop {r4, pc}
_02266AA8:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02266AAC: .4byte 0x00000954
	thumb_func_end ov49_02266A88

	thumb_func_start ov49_02266AB0
ov49_02266AB0: @ 0x02266AB0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #2
	adds r6, r0, #0
	ldr r0, _02266AEC @ =0x00000954
	ldrsh r1, [r5, r1]
	adds r0, r5, r0
	bl ov49_02267E18
	adds r4, r0, #0
	movs r0, #2
	ldrsh r0, [r5, r0]
	adds r0, r0, #1
	strh r0, [r5, #2]
	cmp r4, #1
	bne _02266AD8
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov49_02267D00
_02266AD8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov49_02267D34
	cmp r4, #2
	bne _02266AE8
	movs r0, #1
	pop {r4, r5, r6, pc}
_02266AE8:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02266AEC: .4byte 0x00000954
	thumb_func_end ov49_02266AB0

	thumb_func_start ov49_02266AF0
ov49_02266AF0: @ 0x02266AF0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #8]
	bl ov49_02258F70
	cmp r0, #1
	bne _02266B04
	movs r0, #0
	pop {r4, r5, r6, pc}
_02266B04:
	movs r4, #0
_02266B06:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02265968
	cmp r0, #1
	bne _02266B1C
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov49_022659D0
_02266B1C:
	adds r4, r4, #1
	cmp r4, #0x12
	blt _02266B06
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov49_02266AF0

	thumb_func_start ov49_02266B28
ov49_02266B28: @ 0x02266B28
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov49_02258DAC
	ldr r1, [r4, #8]
	cmp r1, r0
	bne _02266B44
	ldr r0, [r5, #8]
	bl ov49_0225CC44
_02266B44:
	ldr r0, [r4, #8]
	bl ov49_02258E34
	add r2, sp, #0
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	movs r1, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	ldrsh r1, [r2, r1]
	ldr r0, [r5, #0xc]
	asrs r3, r1, #3
	lsrs r3, r3, #0x1c
	adds r3, r1, r3
	lsls r1, r3, #0xc
	movs r3, #6
	ldrsh r2, [r2, r3]
	lsrs r1, r1, #0x10
	asrs r3, r2, #3
	lsrs r3, r3, #0x1c
	adds r3, r2, r3
	lsls r2, r3, #0xc
	lsrs r2, r2, #0x10
	bl ov49_022589C4
	cmp r0, #0x2a
	bne _02266B84
	movs r1, #1
	b _02266B86
_02266B84:
	movs r1, #0
_02266B86:
	ldr r0, _02266C58 @ =0x00000965
	cmp r6, #1
	strb r1, [r4, r0]
	beq _02266B96
	cmp r6, #2
	beq _02266BB0
	cmp r6, #3
	b _02266BE2
_02266B96:
	ldr r3, _02266C5C @ =0x0226A74C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_02265980
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov49_0226786C
	b _02266C2A
_02266BB0:
	ldr r3, _02266C5C @ =0x0226A74C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_02265980
	ldr r3, _02266C60 @ =0x0226A750
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov49_02265980
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #2
	bl ov49_0226786C
	movs r2, #1
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov49_0226786C
	b _02266C2A
_02266BE2:
	ldr r3, _02266C5C @ =0x0226A74C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov49_02265980
	ldr r3, _02266C60 @ =0x0226A750
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov49_02265980
	ldr r3, _02266C64 @ =0x0226A754
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ov49_02265980
	movs r2, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov49_0226786C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #2
	bl ov49_0226786C
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	movs r3, #1
	bl ov49_0226786C
_02266C2A:
	ldr r0, _02266C68 @ =0x00000955
	movs r1, #0
	strb r6, [r4, r0]
	ldr r0, [r4, #8]
	bl ov49_02259130
	ldr r0, _02266C58 @ =0x00000965
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _02266C4A
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02266C6C
	add sp, #8
	pop {r4, r5, r6, pc}
_02266C4A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02266D04
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02266C58: .4byte 0x00000965
_02266C5C: .4byte 0x0226A74C
_02266C60: .4byte 0x0226A750
_02266C64: .4byte 0x0226A754
_02266C68: .4byte 0x00000955
	thumb_func_end ov49_02266B28

	thumb_func_start ov49_02266C6C
ov49_02266C6C: @ 0x02266C6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	ldr r0, [r5, #8]
	add r1, sp, #0x10
	bl ov49_02259154
	ldr r0, _02266CEC @ =0x00000955
	ldrsb r0, [r5, r0]
	subs r1, r0, #1
	ldr r0, _02266CF0 @ =0x0226A450
	ldrb r0, [r0, r1]
	cmp r0, #0
	beq _02266C9A
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02266CA8
_02266C9A:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02266CA8:
	ldr r6, [sp, #0x14]
	ldr r4, [sp, #0x18]
	ldr r7, [sp, #0x10]
	blx FUN_020F2104
	adds r0, r6, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6c
	str r0, [sp, #0xc]
	ldr r0, _02266CF4 @ =0x00000A04
	adds r1, r7, #0
	adds r0, r5, r0
	adds r2, r7, #0
	adds r3, r6, #0
	bl ov49_0226540C
	ldr r0, _02266CF8 @ =0x00000A2C
	movs r3, #2
	ldr r2, _02266CFC @ =0x0000071C
	adds r0, r5, r0
	movs r1, #0
	lsls r3, r3, #0xe
	bl ov49_022655F4
	adds r0, r5, #0
	bl ov49_0226747C
	ldr r0, _02266D00 @ =0x00000956
	movs r1, #0
	strh r1, [r5, r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02266CEC: .4byte 0x00000955
_02266CF0: .4byte 0x0226A450
_02266CF4: .4byte 0x00000A04
_02266CF8: .4byte 0x00000A2C
_02266CFC: .4byte 0x0000071C
_02266D00: .4byte 0x00000956
	thumb_func_end ov49_02266C6C

	thumb_func_start ov49_02266D04
ov49_02266D04: @ 0x02266D04
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	ldr r0, [r4, #8]
	add r1, sp, #0x10
	bl ov49_02259154
	movs r0, #2
	ldr r3, [sp, #0x14]
	lsls r0, r0, #0xc
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x10]
	adds r0, r3, r0
	str r0, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldr r0, _02266D50 @ =0x00000A04
	adds r2, r1, #0
	adds r0, r4, r0
	bl ov49_0226540C
	ldr r0, _02266D54 @ =0x00000A2C
	movs r1, #0
	ldr r2, _02266D58 @ =0x0000071C
	adds r0, r4, r0
	adds r3, r1, #0
	bl ov49_022655F4
	adds r0, r4, #0
	bl ov49_02267674
	ldr r0, _02266D5C @ =0x00000956
	movs r1, #0
	strh r1, [r4, r0]
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_02266D50: .4byte 0x00000A04
_02266D54: .4byte 0x00000A2C
_02266D58: .4byte 0x0000071C
_02266D5C: .4byte 0x00000956
	thumb_func_end ov49_02266D04

	thumb_func_start ov49_02266D60
ov49_02266D60: @ 0x02266D60
	push {r3, lr}
	ldr r2, _02266D78 @ =0x00000965
	ldrb r2, [r1, r2]
	cmp r2, #0
	bne _02266D70
	bl ov49_02266D7C
	pop {r3, pc}
_02266D70:
	bl ov49_02266E78
	pop {r3, pc}
	nop
_02266D78: .4byte 0x00000965
	thumb_func_end ov49_02266D60

	thumb_func_start ov49_02266D7C
ov49_02266D7C: @ 0x02266D7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	ldr r1, _02266E64 @ =0x00000A04
	adds r6, r0, #0
	adds r0, r5, r1
	subs r1, #0xae
	ldrsh r1, [r5, r1]
	bl ov49_02265434
	str r0, [sp]
	ldr r0, _02266E68 @ =0x00000A2C
	adds r0, r5, r0
	bl ov49_02265628
	ldr r0, _02266E6C @ =0x00000956
	ldrsh r1, [r5, r0]
	adds r1, r1, #1
	strh r1, [r5, r0]
	ldr r0, [r5, #8]
	add r1, sp, #0xc
	bl ov49_02259154
	ldr r0, _02266E64 @ =0x00000A04
	add r1, sp, #0xc
	adds r0, r5, r0
	add r2, sp, #0x10
	add r3, sp, #0x14
	bl ov49_022655E0
	ldr r0, _02266E68 @ =0x00000A2C
	add r1, sp, #8
	adds r0, r5, r0
	bl ov49_02265660
	ldr r0, [sp]
	cmp r0, #0
	bne _02266DD0
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #0xc]
_02266DD0:
	ldr r0, [r5, #8]
	add r1, sp, #0xc
	bl ov49_02259148
	adds r0, r5, #0
	bl ov49_0226747C
	ldr r0, _02266E70 @ =0x00000955
	movs r4, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _02266DFC
	ldr r7, _02266E70 @ =0x00000955
_02266DEA:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov49_0226789C
	ldrsb r0, [r5, r7]
	adds r4, r4, #1
	cmp r4, r0
	blt _02266DEA
_02266DFC:
	ldr r0, [r6, #4]
	ldr r7, [r5, #8]
	bl ov49_02258DAC
	cmp r7, r0
	bne _02266E5E
	ldr r0, _02266E74 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	movs r4, #4
	tst r1, r0
	beq _02266E16
	movs r4, #0
_02266E16:
	movs r1, #0x80
	tst r1, r0
	beq _02266E1E
	movs r4, #1
_02266E1E:
	movs r1, #0x10
	tst r1, r0
	beq _02266E26
	movs r4, #3
_02266E26:
	movs r1, #0x20
	tst r0, r1
	beq _02266E2E
	movs r4, #2
_02266E2E:
	cmp r4, #4
	beq _02266E5E
	adds r0, r7, #0
	adds r1, r4, #0
	bl ov49_02259160
	ldr r0, [r5, #8]
	bl ov49_02258E34
	add r1, sp, #4
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r5, #8]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	adds r2, r4, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov49_02258E04
_02266E5E:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02266E64: .4byte 0x00000A04
_02266E68: .4byte 0x00000A2C
_02266E6C: .4byte 0x00000956
_02266E70: .4byte 0x00000955
_02266E74: .4byte 0x021D110C
	thumb_func_end ov49_02266D7C

	thumb_func_start ov49_02266E78
ov49_02266E78: @ 0x02266E78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, _02266EE8 @ =0x00000A04
	adds r6, r0, #0
	adds r0, r5, r1
	subs r1, #0xae
	ldrsh r1, [r5, r1]
	bl ov49_02265434
	str r0, [sp]
	ldr r0, _02266EEC @ =0x00000A2C
	adds r0, r5, r0
	bl ov49_02265628
	ldr r0, _02266EF0 @ =0x00000956
	ldrsh r1, [r5, r0]
	adds r1, r1, #1
	strh r1, [r5, r0]
	ldr r0, [r5, #8]
	add r1, sp, #4
	bl ov49_02259154
	ldr r0, _02266EE8 @ =0x00000A04
	add r1, sp, #4
	adds r0, r5, r0
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov49_022655E0
	ldr r0, [r5, #8]
	add r1, sp, #4
	bl ov49_02259148
	adds r0, r5, #0
	bl ov49_02267674
	ldr r0, _02266EF4 @ =0x00000955
	movs r4, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _02266EE0
	ldr r7, _02266EF4 @ =0x00000955
_02266ECE:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov49_0226789C
	ldrsb r0, [r5, r7]
	adds r4, r4, #1
	cmp r4, r0
	blt _02266ECE
_02266EE0:
	ldr r0, [sp]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266EE8: .4byte 0x00000A04
_02266EEC: .4byte 0x00000A2C
_02266EF0: .4byte 0x00000956
_02266EF4: .4byte 0x00000955
	thumb_func_end ov49_02266E78

	thumb_func_start ov49_02266EF8
ov49_02266EF8: @ 0x02266EF8
	push {r3, lr}
	ldr r2, _02266F10 @ =0x00000965
	ldrb r2, [r1, r2]
	cmp r2, #0
	bne _02266F08
	bl ov49_02266F14
	pop {r3, pc}
_02266F08:
	bl ov49_02267074
	pop {r3, pc}
	nop
_02266F10: .4byte 0x00000965
	thumb_func_end ov49_02266EF8

	thumb_func_start ov49_02266F14
ov49_02266F14: @ 0x02266F14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r1, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	add r1, sp, #0x24
	bl ov49_02259154
	ldr r0, _0226705C @ =0x00000955
	ldrsb r0, [r5, r0]
	subs r1, r0, #1
	ldr r0, _02267060 @ =0x0226A450
	ldrb r0, [r0, r1]
	cmp r0, #0
	beq _02266F44
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02266F52
_02266F44:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02266F52:
	ldr r6, [sp, #0x28]
	ldr r4, [sp, #0x2c]
	ldr r7, [sp, #0x24]
	blx FUN_020F2104
	subs r0, r6, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r0, _02267064 @ =0x00000A04
	adds r1, r7, #0
	adds r0, r5, r0
	adds r2, r7, #0
	adds r3, r6, #0
	bl ov49_0226540C
	ldr r1, _02267068 @ =0x00000956
	movs r4, #0
	strh r4, [r5, r1]
	subs r0, r1, #2
	strb r4, [r5, r0]
	subs r0, r1, #1
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _02267052
	adds r0, r5, #0
	str r0, [sp, #0x14]
	adds r0, #0xc
	str r0, [sp, #0x14]
	adds r0, r1, #0
	adds r0, #0x36
	adds r1, #0x12
	adds r7, r5, r0
	adds r6, r5, r1
_02266F9A:
	ldr r0, [sp, #0x14]
	add r1, sp, #0x24
	add r2, sp, #0x28
	add r3, sp, #0x2c
	bl FUN_020182B0
	movs r0, #0x96
	adds r1, r5, r4
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02266FBC
	cmp r0, #1
	beq _02266FD6
	cmp r0, #2
	beq _02266FF0
	b _02267008
_02266FBC:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [sp, #0x20]
	movs r0, #1
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	movs r0, #1
	ldr r1, [sp, #0x2c]
	lsls r0, r0, #0x12
	subs r0, r1, r0
	str r0, [sp, #0x18]
	b _02267008
_02266FD6:
	movs r0, #1
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x20]
	movs r0, #1
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
	b _02267008
_02266FF0:
	movs r0, #1
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x12
	subs r0, r1, r0
	str r0, [sp, #0x20]
	movs r0, #1
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x18]
_02267008:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	movs r0, #0x1a
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	adds r0, r7, #0
	bl ov49_0226540C
	movs r3, #6
	ldr r2, _0226706C @ =0x00000AAA
	adds r0, r6, #0
	movs r1, #0
	lsls r3, r3, #0xc
	bl ov49_022655F4
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #3
	bl ov49_0226786C
	ldr r0, [sp, #0x14]
	adds r4, r4, #1
	adds r0, #0x78
	str r0, [sp, #0x14]
	ldr r0, _0226705C @ =0x00000955
	adds r7, #0x28
	ldrsb r0, [r5, r0]
	adds r6, #0xc
	cmp r4, r0
	blt _02266F9A
_02267052:
	ldr r0, _02267070 @ =0x00000964
	movs r1, #0
	strb r1, [r5, r0]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0226705C: .4byte 0x00000955
_02267060: .4byte 0x0226A450
_02267064: .4byte 0x00000A04
_02267068: .4byte 0x00000956
_0226706C: .4byte 0x00000AAA
_02267070: .4byte 0x00000964
	thumb_func_end ov49_02266F14

	thumb_func_start ov49_02267074
ov49_02267074: @ 0x02267074
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	ldr r0, [r4, #8]
	add r1, sp, #0x10
	bl ov49_02259154
	movs r0, #2
	ldr r3, [sp, #0x14]
	lsls r0, r0, #0xc
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x10]
	subs r0, r3, r0
	str r0, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _022670B0 @ =0x00000A04
	adds r2, r1, #0
	adds r0, r4, r0
	bl ov49_0226540C
	ldr r0, _022670B4 @ =0x00000956
	movs r1, #0
	strh r1, [r4, r0]
	subs r0, r0, #2
	strb r1, [r4, r0]
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
_022670B0: .4byte 0x00000A04
_022670B4: .4byte 0x00000956
	thumb_func_end ov49_02267074

	thumb_func_start ov49_022670B8
ov49_022670B8: @ 0x022670B8
	push {r3, lr}
	ldr r2, _022670D0 @ =0x00000965
	ldrb r2, [r1, r2]
	cmp r2, #0
	bne _022670C8
	bl ov49_022670D4
	pop {r3, pc}
_022670C8:
	bl ov49_02267328
	pop {r3, pc}
	nop
_022670D0: .4byte 0x00000965
	thumb_func_end ov49_022670B8

	thumb_func_start ov49_022670D4
ov49_022670D4: @ 0x022670D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r1, #0
	ldr r1, _02267300 @ =0x00000954
	adds r6, r0, #0
	ldrsb r0, [r4, r1]
	cmp r0, #4
	bhi _0226710A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022670F0: @ jump table
	.2byte _022670FA - _022670F0 - 2 @ case 0
	.2byte _02267112 - _022670F0 - 2 @ case 1
	.2byte _02267128 - _022670F0 - 2 @ case 2
	.2byte _0226715E - _022670F0 - 2 @ case 3
	.2byte _022671B6 - _022670F0 - 2 @ case 4
_022670FA:
	adds r0, r1, #2
	ldrsh r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #8
	bge _0226710C
_0226710A:
	b _02267230
_0226710C:
	movs r0, #1
	strb r0, [r4, r1]
	b _02267230
_02267112:
	ldr r0, [r4, #8]
	movs r1, #1
	bl ov49_0225919C
	ldr r0, _02267304 @ =0x00000956
	movs r1, #0x10
	strh r1, [r4, r0]
	movs r1, #2
	subs r0, r0, #2
	strb r1, [r4, r0]
	b _02267230
_02267128:
	adds r0, r1, #2
	ldrsh r0, [r4, r0]
	subs r2, r0, #1
	adds r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02267230
	ldr r0, [r4, #8]
	movs r1, #0
	bl ov49_0225919C
	ldr r0, _02267300 @ =0x00000954
	movs r1, #3
	strb r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	movs r1, #6
	bl ov49_02258E60
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov49_02259160
	b _02267230
_0226715E:
	adds r0, r1, #0
	adds r1, r1, #2
	adds r0, #0xb0
	ldrsh r1, [r4, r1]
	adds r0, r4, r0
	bl ov49_02265434
	adds r5, r0, #0
	ldr r0, _02267304 @ =0x00000956
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	add r1, sp, #0x30
	bl ov49_02259154
	ldr r0, _02267308 @ =0x00000A04
	add r1, sp, #0x30
	adds r0, r4, r0
	add r2, sp, #0x34
	add r3, sp, #0x38
	bl ov49_022655E0
	ldr r0, [r4, #8]
	add r1, sp, #0x30
	bl ov49_02259148
	cmp r5, #1
	bne _02267230
	ldr r0, _02267300 @ =0x00000954
	movs r1, #4
	strb r1, [r4, r0]
	adds r1, r0, #2
	movs r2, #0
	strh r2, [r4, r1]
	ldr r1, [sp, #0x34]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r2, _0226730C @ =0x000005C2
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov49_02265668
	b _02267230
_022671B6:
	adds r0, r1, #2
	ldrsh r1, [r4, r0]
	ldr r0, _02267310 @ =0x00007FFF
	muls r0, r1, r0
	movs r1, #0xa
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _02267314 @ =0x021094DC
	ldrsh r2, [r0, r1]
	asrs r0, r2, #0x1f
	lsrs r1, r2, #0x11
	lsls r0, r0, #0xf
	orrs r0, r1
	movs r1, #2
	lsls r3, r2, #0xf
	movs r2, #0
	lsls r1, r1, #0xa
	adds r1, r3, r1
	adcs r0, r2
	lsrs r5, r1, #0xc
	lsls r0, r0, #0x14
	orrs r5, r0
	ldr r0, [r4, #8]
	add r1, sp, #0x24
	bl ov49_02259154
	ldr r0, _02267318 @ =0x00000958
	add r1, sp, #0x24
	ldr r0, [r4, r0]
	adds r0, r0, r5
	str r0, [sp, #0x28]
	ldr r0, [r4, #8]
	bl ov49_02259148
	ldr r0, _02267304 @ =0x00000956
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	cmp r1, #0xa
	ble _0226722E
	ldr r0, [r4, #8]
	movs r1, #1
	bl ov49_02259130
	ldr r0, [r6, #4]
	ldr r4, [r4, #8]
	bl ov49_02258DAC
	cmp r4, r0
	bne _02267228
	ldr r0, [r6, #8]
	adds r1, r4, #0
	bl ov49_0225CC40
_02267228:
	add sp, #0x3c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0226722E:
	strh r1, [r4, r0]
_02267230:
	ldr r1, _0226731C @ =0x00000964
	movs r5, #0
	ldrb r0, [r4, r1]
	adds r0, r0, #1
	strb r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0xf
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _022672F8
	adds r0, r1, #0
	adds r0, #0x28
	adds r7, r4, r0
	adds r0, r1, #4
	adds r0, r4, r0
	str r0, [sp, #0x10]
	adds r0, r4, #0
	str r0, [sp, #0xc]
	adds r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	str r7, [sp, #8]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	str r0, [sp]
_02267262:
	ldr r1, _0226731C @ =0x00000964
	adds r0, r7, #0
	ldrb r1, [r4, r1]
	bl ov49_02265434
	cmp r0, #0
	bne _022672AA
	ldr r0, [sp, #0x10]
	bl ov49_02265628
	ldr r0, [sp, #0xc]
	add r1, sp, #0x18
	add r2, sp, #0x1c
	add r3, sp, #0x20
	bl FUN_020182B0
	ldr r0, [sp, #8]
	add r1, sp, #0x18
	add r2, sp, #0x1c
	add r3, sp, #0x20
	bl ov49_022655E0
	ldr r0, [sp, #4]
	add r1, sp, #0x14
	bl ov49_02265660
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x1c]
	adds r1, r1, r0
	ldr r0, [sp]
	ldr r3, [sp, #0x20]
	str r1, [sp, #0x18]
	bl FUN_020182A8
	b _022672C4
_022672AA:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl ov49_0226786C
	cmp r0, #1
	bne _022672C4
	ldr r2, _02267320 @ =0x000005A8
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov49_02265668
_022672C4:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov49_0226789C
	ldr r0, [sp, #0x10]
	adds r5, r5, #1
	adds r0, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r7, #0x28
	adds r0, #0x78
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x28
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r0, #0x78
	str r0, [sp]
	ldr r0, _02267324 @ =0x00000955
	ldrsb r0, [r4, r0]
	cmp r5, r0
	blt _02267262
_022672F8:
	movs r0, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_02267300: .4byte 0x00000954
_02267304: .4byte 0x00000956
_02267308: .4byte 0x00000A04
_0226730C: .4byte 0x000005C2
_02267310: .4byte 0x00007FFF
_02267314: .4byte 0x021094DC
_02267318: .4byte 0x00000958
_0226731C: .4byte 0x00000964
_02267320: .4byte 0x000005A8
_02267324: .4byte 0x00000955
	thumb_func_end ov49_022670D4

	thumb_func_start ov49_02267328
ov49_02267328: @ 0x02267328
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, _02267464 @ =0x00000955
	adds r4, r1, #0
	ldrsb r0, [r4, r0]
	movs r5, #0
	cmp r0, #0
	ble _0226734E
	ldr r7, _02267464 @ =0x00000955
_0226733C:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov49_0226789C
	ldrsb r0, [r4, r7]
	adds r5, r5, #1
	cmp r5, r0
	blt _0226733C
_0226734E:
	ldr r1, _02267468 @ =0x00000954
	ldrsb r0, [r4, r1]
	cmp r0, #3
	bls _02267358
	b _0226745C
_02267358:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02267364: @ jump table
	.2byte _0226736C - _02267364 - 2 @ case 0
	.2byte _0226739E - _02267364 - 2 @ case 1
	.2byte _022673B4 - _02267364 - 2 @ case 2
	.2byte _022673EA - _02267364 - 2 @ case 3
_0226736C:
	ldr r2, _0226746C @ =0x000005A8
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov49_02265668
	ldr r0, _02267464 @ =0x00000955
	movs r5, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02267396
	ldr r7, _02267464 @ =0x00000955
_02267382:
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #4
	bl ov49_0226786C
	ldrsb r0, [r4, r7]
	adds r5, r5, #1
	cmp r5, r0
	blt _02267382
_02267396:
	ldr r0, _02267468 @ =0x00000954
	movs r1, #1
	strb r1, [r4, r0]
	b _0226745C
_0226739E:
	ldr r0, [r4, #8]
	movs r1, #1
	bl ov49_0225919C
	ldr r0, _02267470 @ =0x00000956
	movs r1, #8
	strh r1, [r4, r0]
	movs r1, #2
	subs r0, r0, #2
	strb r1, [r4, r0]
	b _0226745C
_022673B4:
	adds r0, r1, #2
	ldrsh r0, [r4, r0]
	subs r2, r0, #1
	adds r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _0226745C
	ldr r0, [r4, #8]
	movs r1, #0
	bl ov49_0225919C
	ldr r0, _02267468 @ =0x00000954
	movs r1, #3
	strb r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	movs r1, #6
	bl ov49_02258E60
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl ov49_02259160
	b _0226745C
_022673EA:
	adds r0, r1, #0
	adds r1, r1, #2
	adds r0, #0xb0
	ldrsh r1, [r4, r1]
	adds r0, r4, r0
	bl ov49_02265434
	adds r5, r0, #0
	ldr r0, _02267470 @ =0x00000956
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, _02267474 @ =0x00000A04
	add r1, sp, #0
	adds r0, r4, r0
	add r2, sp, #4
	add r3, sp, #8
	bl ov49_022655E0
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl ov49_02259148
	cmp r5, #1
	bne _0226745C
	ldr r0, _02267470 @ =0x00000956
	movs r1, #0
	strh r1, [r4, r0]
	ldr r1, [sp, #4]
	adds r0, r0, #2
	str r1, [r4, r0]
	ldr r2, _02267478 @ =0x000005C2
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov49_02265668
	ldr r0, [r4, #8]
	movs r1, #1
	bl ov49_02259130
	ldr r0, [r6, #4]
	ldr r4, [r4, #8]
	bl ov49_02258DAC
	cmp r4, r0
	bne _02267456
	ldr r0, [r6, #8]
	adds r1, r4, #0
	bl ov49_0225CC40
_02267456:
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0226745C:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02267464: .4byte 0x00000955
_02267468: .4byte 0x00000954
_0226746C: .4byte 0x000005A8
_02267470: .4byte 0x00000956
_02267474: .4byte 0x00000A04
_02267478: .4byte 0x000005C2
	thumb_func_end ov49_02267328

	thumb_func_start ov49_0226747C
ov49_0226747C: @ 0x0226747C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #8]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, _02267670 @ =0x00000955
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _0226749A
	cmp r0, #2
	beq _022674EA
	cmp r0, #3
	b _02267586
_0226749A:
	movs r0, #0xf
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r3, r0, #0
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #1
	adds r5, #0xc
	ldr r4, [sp, #8]
	lsls r3, r3, #0xc
	adds r0, r5, #0
	adds r3, r4, r3
	bl FUN_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_022674EA:
	movs r0, #0xe
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	adds r3, r0, #0
	ldr r2, [sp, #4]
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #1
	adds r0, r5, #0
	ldr r4, [sp, #8]
	lsls r3, r3, #0xc
	adds r0, #0xc
	adds r3, r4, r3
	bl FUN_020182A8
	movs r0, #0xe
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #0xe
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r3, r0, #0
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #1
	adds r5, #0x84
	ldr r4, [sp, #8]
	lsls r3, r3, #0xc
	adds r0, r5, #0
	adds r3, r4, r3
	bl FUN_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02267586:
	movs r0, #0xf
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	adds r3, r0, #0
	ldr r2, [sp, #4]
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #1
	adds r0, r5, #0
	ldr r4, [sp, #8]
	lsls r3, r3, #0xc
	adds r0, #0xc
	adds r3, r4, r3
	bl FUN_020182A8
	movs r0, #0xe
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	adds r3, r0, #0
	ldr r2, [sp, #4]
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #1
	adds r0, r5, #0
	ldr r4, [sp, #8]
	lsls r3, r3, #0xc
	adds r0, #0x84
	adds r3, r4, r3
	bl FUN_020182A8
	movs r0, #0xe
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #0xe
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r3, r0, #0
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #1
	adds r5, #0xfc
	ldr r4, [sp, #8]
	lsls r3, r3, #0xc
	adds r0, r5, #0
	adds r3, r4, r3
	bl FUN_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02267670: .4byte 0x00000955
	thumb_func_end ov49_0226747C

	thumb_func_start ov49_02267674
ov49_02267674: @ 0x02267674
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #8]
	add r1, sp, #0
	bl ov49_02259154
	ldr r0, _02267868 @ =0x00000955
	ldrsb r0, [r5, r0]
	cmp r0, #1
	beq _02267692
	cmp r0, #2
	beq _022676E2
	cmp r0, #3
	b _0226777E
_02267692:
	movs r0, #3
	lsls r0, r0, #0x10
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r3, r0, #0
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #2
	adds r5, #0xc
	ldr r4, [sp, #8]
	lsls r3, r3, #0xe
	adds r0, r5, #0
	subs r3, r4, r3
	bl FUN_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_022676E2:
	movs r0, #0xb
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	adds r3, r0, #0
	ldr r2, [sp, #4]
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #2
	adds r0, r5, #0
	ldr r4, [sp, #8]
	lsls r3, r3, #0xe
	adds r0, #0xc
	subs r3, r4, r3
	bl FUN_020182A8
	movs r0, #0xb
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #0xe
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r3, r0, #0
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #2
	adds r5, #0x84
	ldr r4, [sp, #8]
	lsls r3, r3, #0xe
	adds r0, r5, #0
	subs r3, r4, r3
	bl FUN_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0226777E:
	movs r0, #3
	lsls r0, r0, #0x10
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	adds r3, r0, #0
	ldr r2, [sp, #4]
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #2
	adds r0, r5, #0
	ldr r4, [sp, #8]
	lsls r3, r3, #0xe
	adds r0, #0xc
	subs r3, r4, r3
	bl FUN_020182A8
	movs r0, #0xb
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #2
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	adds r3, r0, #0
	ldr r2, [sp, #4]
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #2
	adds r0, r5, #0
	ldr r4, [sp, #8]
	lsls r3, r3, #0xe
	adds r0, #0x84
	subs r3, r4, r3
	bl FUN_020182A8
	movs r0, #0xb
	lsls r0, r0, #0xe
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	adds r6, r0, #0
	movs r0, #0xe
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020F2104
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r3, r0, #0
	adds r1, r1, r4
	adds r2, r2, r3
	movs r3, #2
	adds r5, #0xfc
	ldr r4, [sp, #8]
	lsls r3, r3, #0xe
	adds r0, r5, #0
	subs r3, r4, r3
	bl FUN_020182A8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02267868: .4byte 0x00000955
	thumb_func_end ov49_02267674

	thumb_func_start ov49_0226786C
ov49_0226786C: @ 0x0226786C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0x96
	lsls r6, r6, #4
	adds r5, r1, r6
	adds r4, r3, #0
	ldrb r3, [r5, r2]
	cmp r4, r3
	beq _02267896
	strb r4, [r5, r2]
	movs r3, #0
	adds r5, r1, r2
	subs r6, r6, #4
	strb r3, [r5, r6]
	lsls r4, r4, #0xd
	str r4, [sp]
	bl ov49_02265BE8
	add sp, #4
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_02267896:
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov49_0226786C

	thumb_func_start ov49_0226789C
ov49_0226789C: @ 0x0226789C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r3, #0x96
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r7, r5
	lsls r3, r3, #4
	ldrb r6, [r4, r3]
	subs r3, r3, #4
	adds r4, r7, r3
	ldrb r3, [r4, r5]
	str r0, [sp, #4]
	cmp r3, #0
	bne _022678FC
	movs r3, #0
	bl ov49_02265C40
	lsls r1, r6, #0xd
	str r0, [sp, #8]
	cmp r0, r1
	bne _022678D0
	movs r0, #1
	lsls r0, r0, #0xc
	adds r0, r1, r0
	str r0, [sp, #8]
	b _022678E8
_022678D0:
	cmp r6, #4
	beq _022678D8
	str r1, [sp, #8]
	b _022678E8
_022678D8:
	adds r1, r7, #0
	movs r0, #0x78
	adds r1, #0xc
	muls r0, r5, r0
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
_022678E8:
	ldr r0, [sp, #8]
	adds r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r2, r5, #0
	movs r3, #0
	bl ov49_02265BE8
	movs r0, #8
	strb r0, [r4, r5]
_022678FC:
	ldrb r0, [r4, r5]
	subs r0, r0, #1
	strb r0, [r4, r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_0226789C

	thumb_func_start ov49_02267908
ov49_02267908: @ 0x02267908
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r0, [sp, #0x10]
	adds r0, r1, #0
	str r1, [sp, #0x14]
	ldr r0, [r0, #8]
	add r1, sp, #0x50
	str r2, [sp, #0x18]
	bl ov49_02259154
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bls _022679E6
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x1c]
_0226792A:
	ldr r1, [sp, #0x20]
	adds r1, #0xd
	cmp r1, #0xf
	bls _02267934
	movs r1, #0xf
_02267934:
	ldr r0, _02267A04 @ =0x0226A4D8
	ldr r7, _02267A08 @ =0x0226A508
	str r0, [sp, #0x34]
	lsls r0, r1, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	ldr r1, _02267A0C @ =0x00000968
	str r0, [sp, #0x28]
	adds r0, #0xc
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	movs r4, #0
	adds r0, r0, r1
	str r0, [sp, #0x30]
_02267950:
	ldr r0, [sp, #0x1c]
	ldr r6, _02267A10 @ =0x0226A70C
	adds r5, r4, r0
	ldr r3, [sp, #0x24]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	adds r2, r5, #0
	adds r3, r6, r3
	bl ov49_02265980
	ldr r1, [sp, #0x34]
	add r0, sp, #0x50
	add r2, sp, #0x44
	blx FUN_020CCD78
	add r0, sp, #0x44
	adds r1, r7, #0
	add r2, sp, #0x38
	blx FUN_020CCD78
	movs r0, #0x78
	muls r0, r5, r0
	ldr r1, [sp, #0x28]
	str r0, [sp, #0x2c]
	adds r0, r1, r0
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	bl FUN_020182A8
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	adds r0, r1, r0
	movs r1, #0
	bl FUN_020182A0
	ldr r0, [sp, #0x14]
	movs r1, #0
	adds r2, r0, r5
	ldr r0, _02267A14 @ =0x00000958
	strb r1, [r2, r0]
	ldr r0, [sp, #0x3c]
	adds r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	movs r0, #0x28
	muls r1, r0, r1
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x38]
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	ldr r3, [sp, #0x48]
	bl ov49_0226540C
	ldr r0, [sp, #0x34]
	adds r4, r4, #1
	adds r0, #0xc
	adds r7, #0xc
	str r0, [sp, #0x34]
	cmp r4, #4
	blt _02267950
	ldr r0, [sp, #0x1c]
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x20]
	cmp r1, r0
	blo _0226792A
_022679E6:
	ldr r2, _02267A18 @ =0x00000956
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	subs r3, r2, #1
	strb r1, [r0, r2]
	ldr r1, [sp, #0x14]
	movs r0, #0
	strb r0, [r1, r3]
	subs r3, r2, #2
	strb r0, [r1, r3]
	adds r2, r2, #1
	strb r0, [r1, r2]
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02267A04: .4byte 0x0226A4D8
_02267A08: .4byte 0x0226A508
_02267A0C: .4byte 0x00000968
_02267A10: .4byte 0x0226A70C
_02267A14: .4byte 0x00000958
_02267A18: .4byte 0x00000956
	thumb_func_end ov49_02267908

	thumb_func_start ov49_02267A1C
ov49_02267A1C: @ 0x02267A1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r2, #0
	ldr r2, _02267A7C @ =0x00000958
	adds r5, r1, #0
	adds r1, r5, r2
	adds r7, r0, #0
	ldrsb r0, [r1, r4]
	adds r6, r4, #0
	adds r2, #0x10
	adds r0, r0, #1
	strb r0, [r1, r4]
	movs r0, #0x28
	muls r6, r0, r6
	adds r0, r5, r2
	ldrsb r1, [r1, r4]
	adds r0, r0, r6
	bl ov49_02265434
	str r0, [sp]
	ldr r0, _02267A80 @ =0x00000968
	add r1, sp, #4
	adds r0, r5, r0
	adds r0, r0, r6
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov49_022655E0
	adds r1, r5, #0
	movs r0, #0x78
	adds r1, #0xc
	muls r0, r4, r0
	adds r0, r1, r0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl FUN_020182A8
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov49_02265B14
	ldr r0, [sp]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02267A7C: .4byte 0x00000958
_02267A80: .4byte 0x00000968
	thumb_func_end ov49_02267A1C

	thumb_func_start ov49_02267A84
ov49_02267A84: @ 0x02267A84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	adds r7, r1, #0
	movs r6, #0
	str r2, [sp, #4]
	adds r0, r2, #0
	beq _02267ADE
	adds r5, r7, #0
	ldr r4, _02267AE8 @ =0x0226A70C
	adds r5, #0xc
_02267A9A:
	ldr r0, [sp]
	adds r1, r7, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov49_02265980
	ldr r0, [r7, #8]
	add r1, sp, #8
	bl ov49_02259154
	movs r0, #2
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xe
	adds r2, r1, r0
	movs r0, #6
	ldr r1, [sp, #0x10]
	lsls r0, r0, #0xc
	adds r3, r1, r0
	ldr r1, [sp, #8]
	adds r0, r5, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl FUN_020182A8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182A0
	ldr r0, [sp, #4]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x78
	cmp r6, r0
	blo _02267A9A
_02267ADE:
	ldr r1, _02267AEC @ =0x00000954
	ldr r0, [sp, #4]
	strb r0, [r7, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02267AE8: .4byte 0x0226A70C
_02267AEC: .4byte 0x00000954
	thumb_func_end ov49_02267A84

	thumb_func_start ov49_02267AF0
ov49_02267AF0: @ 0x02267AF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #4]
	adds r5, r1, #0
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xc
	adds r6, r2, #0
	muls r0, r1, r0
	movs r1, #0x30
	blx FUN_020F2998
	adds r4, r0, #0
	ldr r0, _02267C14 @ =0x00000954
	ldr r1, [r5, r0]
	cmp r4, r1
	beq _02267BF4
	str r4, [r5, r0]
	cmp r4, #0
	beq _02267B42
	movs r0, #0x30
	adds r2, r6, #0
	muls r2, r0, r2
	ldr r0, _02267C18 @ =0x0226A678
	lsls r1, r4, #2
	adds r0, r0, r2
	adds r2, r1, r0
	ldrh r0, [r1, r0]
	add r1, sp, #8
	strh r0, [r1, #4]
	ldrh r0, [r2, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	adds r0, r5, #0
	movs r1, #0x78
	adds r0, #0xc
	muls r1, r2, r1
	adds r0, r0, r1
	movs r1, #0
	bl FUN_020182A0
_02267B42:
	movs r0, #0x30
	adds r2, r6, #0
	muls r2, r0, r2
	ldr r0, _02267C1C @ =0x0226A67C
	lsls r1, r4, #2
	adds r0, r0, r2
	adds r2, r1, r0
	ldrh r1, [r1, r0]
	add r0, sp, #8
	strh r1, [r0]
	ldrh r4, [r2, #2]
	strh r4, [r0, #2]
	cmp r4, #0
	beq _02267BE2
	beq _02267B74
	lsls r7, r4, #0xc
	adds r0, r7, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02267B84
_02267B74:
	lsls r7, r4, #0xc
	adds r0, r7, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02267B84:
	add r1, sp, #8
	ldrh r6, [r1]
	blx FUN_020F2104
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl ov49_02265BE8
	cmp r4, #0
	beq _02267BB0
	adds r0, r7, #0
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02267BBE
_02267BB0:
	adds r0, r7, #0
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02267BBE:
	blx FUN_020F2104
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #1
	bl ov49_02265BE8
	adds r1, r5, #0
	movs r0, #0x78
	adds r1, #0xc
	muls r0, r6, r0
	adds r0, r1, r0
	movs r1, #1
	bl FUN_020182A0
	b _02267BF4
_02267BE2:
	ldrh r1, [r0]
	adds r2, r5, #0
	movs r0, #0x78
	muls r0, r1, r0
	adds r2, #0xc
	adds r0, r2, r0
	movs r1, #0
	bl FUN_020182A0
_02267BF4:
	movs r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, #0x30
	bge _02267C00
	adds r0, r0, #1
	strh r0, [r5, #2]
_02267C00:
	movs r0, #2
	ldrsh r0, [r5, r0]
	cmp r0, #0x30
	blt _02267C0E
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02267C0E:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02267C14: .4byte 0x00000954
_02267C18: .4byte 0x0226A678
_02267C1C: .4byte 0x0226A67C
	thumb_func_end ov49_02267AF0

	thumb_func_start ov49_02267C20
ov49_02267C20: @ 0x02267C20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	adds r7, r1, #0
	movs r4, #0
	str r2, [sp, #4]
	adds r0, r2, #0
	beq _02267C74
	adds r5, r7, #0
	adds r5, #0xc
_02267C34:
	adds r3, r4, #6
	lsls r6, r3, #2
	ldr r3, _02267C84 @ =0x0226A70C
	ldr r0, [sp]
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r3, r6
	bl ov49_02265980
	ldr r0, [r7, #8]
	add r1, sp, #8
	bl ov49_02259154
	movs r0, #2
	ldr r1, [sp, #0xc]
	lsls r0, r0, #0xe
	adds r2, r1, r0
	ldr r1, [sp, #8]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	str r2, [sp, #0xc]
	bl FUN_020182A8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020182A0
	ldr r0, [sp, #4]
	adds r4, r4, #1
	adds r5, #0x78
	cmp r4, r0
	blo _02267C34
_02267C74:
	ldr r0, _02267C88 @ =0x00000954
	movs r1, #0xff
	strh r1, [r7, r0]
	adds r1, r0, #2
	ldr r0, [sp, #4]
	strh r0, [r7, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02267C84: .4byte 0x0226A70C
_02267C88: .4byte 0x00000954
	thumb_func_end ov49_02267C20

	thumb_func_start ov49_02267C8C
ov49_02267C8C: @ 0x02267C8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	ldr r0, [r1, #8]
	str r1, [sp, #4]
	add r1, sp, #8
	bl ov49_02259154
	movs r0, #0xa
	ldr r7, [sp, #4]
	movs r4, #0
	ldr r1, [sp, #0x10]
	lsls r0, r0, #0xc
	subs r0, r1, r0
	str r0, [sp, #0x10]
	movs r0, #1
	ldr r1, [sp, #8]
	lsls r0, r0, #0xe
	subs r1, r1, r0
	str r1, [sp, #8]
	ldr r1, [sp, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [sp, #0xc]
	adds r5, r4, #0
	adds r7, #0xc
_02267CC0:
	adds r3, r4, #0
	adds r3, #0x25
	lsls r6, r3, #2
	ldr r3, _02267CFC @ =0x0226A70C
	adds r2, r4, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, #0x10
	adds r3, r3, r6
	bl ov49_02265980
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x78
	muls r0, r1, r0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, r7, r0
	adds r1, r1, r5
	bl FUN_020182A8
	movs r0, #6
	lsls r0, r0, #0xe
	adds r4, r4, #1
	adds r5, r5, r0
	cmp r4, #2
	blt _02267CC0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02267CFC: .4byte 0x0226A70C
	thumb_func_end ov49_02267C8C

	thumb_func_start ov49_02267D00
ov49_02267D00: @ 0x02267D00
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02267D30 @ =0x00000D0C
	movs r2, #1
	strh r2, [r1, r0]
	adds r4, r1, #0
	movs r5, #0
	adds r0, r0, #2
	strh r5, [r1, r0]
	adds r4, #0xc
	adds r7, r2, #0
	movs r6, #0x78
_02267D16:
	adds r0, r5, #0
	adds r0, #0x10
	adds r1, r0, #0
	muls r1, r6, r1
	adds r0, r4, r1
	adds r1, r7, #0
	bl FUN_020182A0
	adds r5, r5, #1
	cmp r5, #2
	blt _02267D16
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02267D30: .4byte 0x00000D0C
	thumb_func_end ov49_02267D00

	thumb_func_start ov49_02267D34
ov49_02267D34: @ 0x02267D34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	ldr r1, _02267D90 @ =0x00000D0C
	adds r7, r0, #0
	ldrh r0, [r5, r1]
	cmp r0, #0
	beq _02267D8E
	adds r0, r1, #2
	ldrh r0, [r5, r0]
	cmp r0, #0xd
	bhs _02267D56
	adds r0, r1, #2
	ldrh r0, [r5, r0]
	adds r2, r0, #1
	adds r0, r1, #2
	strh r2, [r5, r0]
	b _02267D5A
_02267D56:
	movs r0, #0
	strh r0, [r5, r1]
_02267D5A:
	adds r6, r5, #0
	movs r4, #0
	adds r6, #0xc
_02267D60:
	ldr r0, _02267D94 @ =0x00000D0E
	ldrh r0, [r5, r0]
	cmp r0, #0xd
	bhs _02267D78
	adds r2, r4, #0
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, #0x10
	movs r3, #0
	bl ov49_02265B14
	b _02267D88
_02267D78:
	adds r1, r4, #0
	adds r1, #0x10
	movs r0, #0x78
	muls r0, r1, r0
	adds r0, r6, r0
	movs r1, #0
	bl FUN_020182A0
_02267D88:
	adds r4, r4, #1
	cmp r4, #2
	blt _02267D60
_02267D8E:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02267D90: .4byte 0x00000D0C
_02267D94: .4byte 0x00000D0E
	thumb_func_end ov49_02267D34

	thumb_func_start ov49_02267D98
ov49_02267D98: @ 0x02267D98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [sp, #0x30]
	movs r7, #2
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	movs r6, #1
	str r0, [sp, #0x34]
	movs r0, #0x3b
	lsls r0, r0, #4
	str r1, [r5, r0]
	adds r1, r0, #4
	ldr r4, [sp, #0x34]
	strh r2, [r5, r1]
	adds r0, r0, #6
	strh r3, [r5, r0]
	movs r0, #0
	str r0, [sp, #0x14]
	movs r0, #3
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r4, #0xc
	str r0, [sp, #0xc]
_02267DC8:
	ldr r1, [sp, #0x10]
	movs r0, #0x78
	muls r0, r1, r0
	adds r0, r4, r0
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0xc]
	ldr r0, [r0, #8]
	movs r1, #0x78
	muls r1, r2, r1
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	movs r2, #0x78
	movs r3, #0x78
	muls r2, r6, r2
	muls r3, r7, r3
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r4, r1
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov49_02267EBC
	ldr r0, [sp, #0x10]
	adds r7, r7, #4
	adds r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r6, r6, #4
	adds r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	adds r5, #0xec
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02267DC8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02267D98

	thumb_func_start ov49_02267E18
ov49_02267E18: @ 0x02267E18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0xed
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	str r1, [sp]
	cmp r0, #0
	ble _02267E86
	ldr r4, [sp, #8]
	add r6, sp, #0x10
_02267E34:
	movs r0, #0x3b
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r0, r4
	ldrh r0, [r0, r4]
	strh r0, [r6]
	ldrh r0, [r1, #2]
	strh r0, [r6, #2]
	ldrh r1, [r6]
	ldr r0, [sp]
	cmp r1, r0
	bne _02267E72
	ldrb r7, [r6, #2]
	cmp r7, #4
	blo _02267E56
	bl GF_AssertFail
_02267E56:
	ldrb r0, [r6, #3]
	str r0, [sp, #4]
	cmp r0, #4
	bls _02267E62
	bl GF_AssertFail
_02267E62:
	movs r0, #0xec
	muls r0, r7, r0
	ldr r1, [sp, #4]
	adds r0, r5, r0
	bl ov49_02267EF8
	movs r0, #1
	str r0, [sp, #8]
_02267E72:
	ldr r0, [sp, #0xc]
	adds r4, r4, #4
	adds r0, r0, #1
	str r0, [sp, #0xc]
	movs r0, #0xed
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blt _02267E34
_02267E86:
	movs r7, #1
	movs r6, #0
	adds r4, r5, #0
_02267E8C:
	adds r0, r4, #0
	bl ov49_02267F40
	cmp r0, #0
	bne _02267E98
	movs r7, #0
_02267E98:
	adds r6, r6, #1
	adds r4, #0xec
	cmp r6, #4
	blt _02267E8C
	ldr r0, _02267EB8 @ =0x000003B6
	ldrh r1, [r5, r0]
	ldr r0, [sp]
	cmp r1, r0
	bhi _02267EB2
	cmp r7, #1
	bne _02267EB2
	movs r0, #2
	str r0, [sp, #8]
_02267EB2:
	ldr r0, [sp, #8]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02267EB8: .4byte 0x000003B6
	thumb_func_end ov49_02267E18

	thumb_func_start ov49_02267EBC
ov49_02267EBC: @ 0x02267EBC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [sp, #0x20]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r0, #3
	blo _02267ED0
	bl GF_AssertFail
_02267ED0:
	adds r0, r5, #0
	adds r0, #0xd8
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0xdc
	str r6, [r0]
	adds r0, r5, #0
	adds r0, #0xe0
	str r7, [r0]
	adds r0, r5, #0
	ldr r1, [sp, #0x18]
	adds r0, #0xe4
	str r1, [r0]
	adds r0, r5, #0
	ldr r1, [sp, #0x1c]
	adds r0, #0xe8
	str r1, [r0]
	ldr r0, [sp, #0x20]
	strh r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02267EBC

	thumb_func_start ov49_02267EF8
ov49_02267EF8: @ 0x02267EF8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r4, _02267F38 @ =0x00000000
	beq _02267F18
	adds r5, r7, #0
_02267F04:
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_020182A0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r6
	blo _02267F04
_02267F18:
	movs r0, #0
	strh r0, [r7]
	movs r0, #1
	strb r0, [r7, #6]
	strh r6, [r7, #4]
	ldrh r2, [r7, #2]
	adds r1, r7, #0
	adds r1, #0xe8
	lsls r3, r2, #2
	ldr r2, _02267F3C @ =0x0226A4CC
	ldr r1, [r1]
	ldr r2, [r2, r3]
	adds r0, r7, #0
	blx r2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02267F38: .4byte 0x00000000
_02267F3C: .4byte 0x0226A4CC
	thumb_func_end ov49_02267EF8

	thumb_func_start ov49_02267F40
ov49_02267F40: @ 0x02267F40
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r1, [r5, #6]
	cmp r1, #0
	bne _02267F4E
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02267F4E:
	ldrh r1, [r5, #2]
	lsls r2, r1, #2
	ldr r1, _02267F90 @ =0x0226A484
	ldr r1, [r1, r2]
	blx r1
	movs r6, #0
	str r0, [sp]
	ldrsh r0, [r5, r6]
	adds r0, r0, #1
	strh r0, [r5]
	ldr r0, [sp]
	cmp r0, #1
	bne _02267F8C
	ldrh r0, [r5, #4]
	cmp r0, #0
	ble _02267F88
	adds r4, r5, #0
	adds r7, r6, #0
_02267F72:
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r0, [r0]
	adds r1, r7, #0
	bl FUN_020182A0
	ldrh r0, [r5, #4]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blt _02267F72
_02267F88:
	movs r0, #0
	strb r0, [r5, #6]
_02267F8C:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02267F90: .4byte 0x0226A484
	thumb_func_end ov49_02267F40

	thumb_func_start ov49_02267F94
ov49_02267F94: @ 0x02267F94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #0x10]
	adds r0, r1, #0
	add r1, sp, #0x24
	bl ov49_02259154
	movs r1, #2
	ldr r0, [sp, #0x24]
	lsls r1, r1, #0xe
	adds r0, r0, r1
	str r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	lsls r0, r1, #1
	adds r0, r2, r0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	movs r4, #0
	subs r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ble _022680A8
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x1c]
	adds r0, #8
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x18]
	adds r0, #0xa8
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x14]
_02267FD8:
	cmp r4, #3
	bhi _02268056
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02267FE8: @ jump table
	.2byte _02267FF0 - _02267FE8 - 2 @ case 0
	.2byte _02268008 - _02267FE8 - 2 @ case 1
	.2byte _02268020 - _02267FE8 - 2 @ case 2
	.2byte _0226803C - _02267FE8 - 2 @ case 3
_02267FF0:
	movs r0, #3
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	subs r7, r1, r0
	movs r0, #1
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0x10
	adds r6, r1, r0
	ldr r5, [sp, #0x2c]
	movs r0, #0
	str r0, [sp, #0x20]
	b _02268056
_02268008:
	movs r0, #3
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	adds r7, r1, r0
	movs r0, #1
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0x10
	adds r6, r1, r0
	ldr r5, [sp, #0x2c]
	ldr r0, _022680AC @ =0x00007FFF
	str r0, [sp, #0x20]
	b _02268056
_02268020:
	movs r0, #2
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	subs r7, r1, r0
	ldr r1, [sp, #0x28]
	lsls r0, r0, #1
	adds r6, r1, r0
	movs r0, #6
	ldr r1, [sp, #0x2c]
	lsls r0, r0, #0xc
	subs r5, r1, r0
	ldr r0, _022680AC @ =0x00007FFF
	str r0, [sp, #0x20]
	b _02268056
_0226803C:
	movs r0, #2
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0xe
	adds r7, r1, r0
	ldr r1, [sp, #0x28]
	lsls r0, r0, #1
	adds r6, r1, r0
	movs r0, #6
	ldr r1, [sp, #0x2c]
	lsls r0, r0, #0xc
	subs r5, r1, r0
	movs r0, #0
	str r0, [sp, #0x20]
_02268056:
	str r6, [sp]
	ldr r0, [sp, #0x2c]
	adds r2, r7, #0
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x12
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl ov49_0226540C
	movs r3, #6
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r2, _022680B0 @ =0x00000CCC
	lsls r3, r3, #0xc
	bl ov49_022655F4
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	adds r0, #0xd8
	ldr r0, [r0]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	bl FUN_020182A8
	ldr r0, [sp, #0x1c]
	adds r4, r4, #1
	adds r0, #0x28
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r0, #0xc
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r4, r0
	blt _02267FD8
_022680A8:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022680AC: .4byte 0x00007FFF
_022680B0: .4byte 0x00000CCC
	thumb_func_end ov49_02267F94

	thumb_func_start ov49_022680B4
ov49_022680B4: @ 0x022680B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ble _02268134
	ldr r0, [sp]
	ldr r6, [sp]
	str r0, [sp, #4]
	adds r0, #0xa8
	adds r6, #8
	ldr r5, [sp]
	str r0, [sp, #4]
	adds r4, r0, #0
	adds r7, r6, #0
_022680D8:
	ldr r0, [sp, #4]
	bl ov49_02265628
	ldr r2, [sp]
	movs r1, #0
	ldrsh r1, [r2, r1]
	adds r0, r6, #0
	bl ov49_02265434
	str r0, [sp, #8]
	adds r0, r4, #0
	add r1, sp, #0x10
	bl ov49_02265660
	adds r0, r7, #0
	add r1, sp, #0x14
	add r2, sp, #0x18
	add r3, sp, #0x1c
	bl ov49_022655E0
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x18]
	adds r1, r1, r0
	adds r0, r5, #0
	str r1, [sp, #0x14]
	adds r0, #0xd8
	ldr r0, [r0]
	ldr r3, [sp, #0x1c]
	bl FUN_020182A8
	ldr r0, [sp, #4]
	adds r6, #0x28
	adds r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r4, #0xc
	adds r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	adds r7, #0x28
	ldrh r1, [r0, #4]
	ldr r0, [sp, #0xc]
	adds r5, r5, #4
	cmp r0, r1
	blt _022680D8
_02268134:
	ldr r0, [sp, #8]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_022680B4

	thumb_func_start ov49_0226813C
ov49_0226813C: @ 0x0226813C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x10]
	adds r0, r1, #0
	add r1, sp, #0x1c
	bl ov49_02259154
	movs r0, #2
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0xe
	adds r1, r1, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	movs r4, #0
	adds r1, r1, r0
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x24]
	subs r0, r1, r0
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ble _0226821E
	ldr r1, [sp, #0x10]
	str r1, [sp, #0x18]
	adds r1, #8
	str r1, [sp, #0x18]
	ldr r1, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r1, #0xa8
	str r1, [sp, #0x14]
_0226817A:
	cmp r4, #3
	bhi _022681E2
	adds r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0226818A: @ jump table
	.2byte _02268192 - _0226818A - 2 @ case 0
	.2byte _022681A2 - _0226818A - 2 @ case 1
	.2byte _022681B2 - _0226818A - 2 @ case 2
	.2byte _022681D4 - _0226818A - 2 @ case 3
_02268192:
	movs r0, #1
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	subs r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	adds r5, r1, r0
	b _022681E2
_022681A2:
	movs r0, #1
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	adds r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	adds r5, r1, r0
	b _022681E2
_022681B2:
	cmp r0, #3
	bne _022681C4
	movs r0, #2
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x10
	ldr r7, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	subs r5, r1, r0
	b _022681E2
_022681C4:
	movs r0, #1
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	subs r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	subs r5, r1, r0
	b _022681E2
_022681D4:
	movs r0, #1
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	adds r7, r1, r0
	ldr r1, [sp, #0x24]
	ldr r6, [sp, #0x20]
	subs r5, r1, r0
_022681E2:
	str r6, [sp]
	ldr r0, [sp, #0x24]
	adds r2, r7, #0
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x13
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	bl ov49_0226540C
	movs r3, #2
	ldr r0, [sp, #0x14]
	ldr r1, _02268228 @ =0x00001555
	ldr r2, _0226822C @ =0x0000071C
	lsls r3, r3, #0x10
	bl ov49_022655F4
	ldr r0, [sp, #0x18]
	adds r4, r4, #1
	adds r0, #0x28
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, #0xc
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldrh r0, [r0, #4]
	cmp r4, r0
	blt _0226817A
_0226821E:
	ldr r0, [sp, #0x10]
	bl ov49_02268230
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02268228: .4byte 0x00001555
_0226822C: .4byte 0x0000071C
	thumb_func_end ov49_0226813C

	thumb_func_start ov49_02268230
ov49_02268230: @ 0x02268230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldrh r0, [r5, #4]
	cmp r0, #0
	ble _022682C2
	adds r4, r5, #0
	adds r0, r5, #0
	adds r4, #0xa8
	str r0, [sp, #4]
	adds r0, #8
	str r0, [sp, #4]
	str r4, [sp]
	adds r6, r0, #0
	adds r7, r5, #0
_02268252:
	movs r0, #0
	ldrsh r0, [r5, r0]
	cmp r0, #0xe
	bne _0226826A
	movs r3, #3
	ldr r2, _022682D0 @ =0x00000E38
	adds r0, r4, #0
	movs r1, #0
	lsls r3, r3, #0xe
	bl ov49_022655F4
	b _02268270
_0226826A:
	adds r0, r4, #0
	bl ov49_02265628
_02268270:
	movs r1, #0
	ldrsh r1, [r5, r1]
	ldr r0, [sp, #4]
	bl ov49_02265434
	ldr r0, [sp]
	add r1, sp, #0xc
	bl ov49_02265660
	adds r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #0x14
	add r3, sp, #0x18
	bl ov49_022655E0
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x18]
	adds r2, r1, r0
	adds r0, r7, #0
	str r2, [sp, #0x14]
	adds r0, #0xd8
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	bl FUN_020182A8
	ldr r0, [sp, #4]
	ldrh r1, [r5, #4]
	adds r0, #0x28
	str r0, [sp, #4]
	ldr r0, [sp]
	adds r4, #0xc
	adds r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r6, #0x28
	adds r0, r0, #1
	adds r7, r7, #4
	str r0, [sp, #8]
	cmp r0, r1
	blt _02268252
_022682C2:
	movs r0, #0
	ldrsh r1, [r5, r0]
	cmp r1, #0x16
	blt _022682CC
	movs r0, #1
_022682CC:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022682D0: .4byte 0x00000E38
	thumb_func_end ov49_02268230

	thumb_func_start ov49_022682D4
ov49_022682D4: @ 0x022682D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r0, r1, #0
	add r1, sp, #0x10
	bl ov49_02259154
	movs r1, #2
	ldr r0, [sp, #0x10]
	lsls r1, r1, #0xe
	adds r0, r0, r1
	str r0, [sp, #0x10]
	movs r0, #5
	ldr r2, [sp, #0x14]
	lsls r0, r0, #0xe
	adds r0, r2, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r4, #0
	subs r0, r0, r1
	str r0, [sp, #0x18]
	ldrh r0, [r5, #4]
	cmp r0, #0
	ble _02268330
	movs r6, #5
	movs r7, #7
	lsls r6, r6, #0xc
	lsls r7, r7, #0xc
_0226830C:
	str r6, [sp]
	movs r0, #0xe
	movs r3, #0xd
	str r7, [sp, #4]
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x10
	lsls r3, r3, #0xc
	bl ov49_022683FC
	ldrh r0, [r5, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _0226830C
_02268330:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_022682D4

	thumb_func_start ov49_02268334
ov49_02268334: @ 0x02268334
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldrh r0, [r5, #4]
	movs r6, #0
	cmp r0, #0
	ble _022683D6
	adds r4, r5, #0
	str r4, [sp, #0x10]
	adds r4, #8
	str r4, [sp, #0x10]
	adds r7, r5, #0
_0226834C:
	movs r1, #0
	ldrsh r1, [r5, r1]
	ldr r0, [sp, #0x10]
	bl ov49_02265434
	str r0, [sp, #0x14]
	adds r0, r4, #0
	add r1, sp, #0x18
	add r2, sp, #0x1c
	add r3, sp, #0x20
	bl ov49_022655E0
	adds r0, r7, #0
	adds r0, #0xd8
	ldr r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	bl FUN_020182A8
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _022683C4
	ldrb r0, [r5, #7]
	add r2, sp, #0x18
	cmp r0, #0
	bne _022683A2
	movs r0, #1
	lsls r0, r0, #0xe
	str r0, [sp]
	ldr r0, _022683F8 @ =0xFFFFD000
	ldr r3, _022683F8 @ =0xFFFFD000
	str r0, [sp, #4]
	movs r0, #3
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov49_022683FC
	b _022683C4
_022683A2:
	movs r0, #5
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #0xa
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	movs r0, #4
	movs r3, #0xa
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r6, #0
	lsls r3, r3, #0xc
	bl ov49_022683FC
_022683C4:
	ldr r0, [sp, #0x10]
	adds r6, r6, #1
	adds r0, #0x28
	str r0, [sp, #0x10]
	ldrh r0, [r5, #4]
	adds r4, #0x28
	adds r7, r7, #4
	cmp r6, r0
	blt _0226834C
_022683D6:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _022683F2
	ldrb r0, [r5, #7]
	adds r0, r0, #1
	cmp r0, #3
	bge _022683EC
	strb r0, [r5, #7]
	movs r0, #0
	strh r0, [r5]
	b _022683F2
_022683EC:
	add sp, #0x24
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_022683F2:
	movs r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022683F8: .4byte 0xFFFFD000
	thumb_func_end ov49_02268334

	thumb_func_start ov49_022683FC
ov49_022683FC: @ 0x022683FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r7, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r5, #3
	bhi _0226845A
	adds r3, r5, r5
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_02268418: @ jump table
	.2byte _02268420 - _02268418 - 2 @ case 0
	.2byte _0226842E - _02268418 - 2 @ case 1
	.2byte _0226843C - _02268418 - 2 @ case 2
	.2byte _0226844C - _02268418 - 2 @ case 3
_02268420:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	subs r2, r0, r6
	ldr r0, [sp, #0x28]
	adds r0, r1, r0
	ldr r1, [r4, #8]
	b _0226845A
_0226842E:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	adds r2, r0, r6
	ldr r0, [sp, #0x28]
	adds r0, r1, r0
	ldr r1, [r4, #8]
	b _0226845A
_0226843C:
	ldr r1, [r4]
	ldr r0, [sp, #0x2c]
	subs r2, r1, r0
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x30]
	adds r0, r1, r0
	ldr r1, [r4, #8]
	b _0226845A
_0226844C:
	ldr r1, [r4]
	ldr r0, [sp, #0x2c]
	adds r2, r1, r0
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x30]
	adds r0, r1, r0
	ldr r1, [r4, #8]
_0226845A:
	str r0, [sp]
	ldr r0, [r4, #8]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x34]
	adds r1, r7, #0
	str r0, [sp, #0xc]
	movs r0, #0x28
	adds r1, #8
	muls r0, r5, r0
	adds r0, r1, r0
	ldr r1, [r4]
	ldr r3, [r4, #4]
	bl ov49_0226540C
	lsls r0, r5, #2
	adds r0, r7, r0
	adds r0, #0xd8
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r3, [r4, #8]
	bl FUN_020182A8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_022683FC

	thumb_func_start ov49_02268490
ov49_02268490: @ 0x02268490
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x60
	adds r6, r2, #0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x60
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r1, #0xa
	ldr r2, _022684EC @ =0x0226A7E0
	muls r1, r5, r1
	adds r0, r4, #0
	adds r1, r2, r1
	bl ov49_022686C0
	ldr r2, _022684F0 @ =0x0226A7D8
	lsls r1, r6, #1
	adds r0, r4, #0
	adds r1, r2, r1
	bl ov49_022686E4
	movs r1, #0
	adds r2, r4, #0
	movs r0, #0x3c
_022684C6:
	adds r1, r1, #1
	str r0, [r2, #0x48]
	adds r2, r2, #4
	cmp r1, #2
	blt _022684C6
	movs r2, #0
	adds r1, r4, #0
	movs r0, #0x3c
_022684D6:
	adds r2, r2, #1
	str r0, [r1, #0x50]
	adds r1, r1, #4
	cmp r2, #4
	blt _022684D6
	adds r0, r4, #0
	bl ov49_022686F0
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_022684EC: .4byte 0x0226A7E0
_022684F0: .4byte 0x0226A7D8
	thumb_func_end ov49_02268490

	thumb_func_start ov49_022684F4
ov49_022684F4: @ 0x022684F4
	ldr r3, _022684F8 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_022684F8: .4byte FUN_0201AB0C
	thumb_func_end ov49_022684F4

	thumb_func_start ov49_022684FC
ov49_022684FC: @ 0x022684FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r4, [sp, #4]
	movs r0, #0
	adds r6, r4, #0
	adds r5, r4, #0
	adds r7, r0, #0
	adds r6, #0x30
	adds r5, #0x18
_02268510:
	ldr r1, [r4, #0x48]
	adds r1, r1, #1
	cmp r1, #0x3c
	bgt _0226852C
	str r1, [r4, #0x48]
	movs r0, #0x3c
	str r0, [sp]
	ldr r3, [r4, #0x48]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov49_02268664
	movs r0, #1
_0226852C:
	adds r7, r7, #1
	adds r4, r4, #4
	adds r6, r6, #4
	adds r5, r5, #4
	cmp r7, #2
	blt _02268510
	ldr r4, [sp, #4]
	movs r1, #0
	adds r7, r4, #0
	adds r6, r4, #0
	adds r5, r4, #0
	str r1, [sp, #8]
	adds r7, #8
	adds r6, #0x38
	adds r5, #0x20
_0226854A:
	ldr r1, [r4, #0x50]
	adds r1, r1, #1
	cmp r1, #0x3c
	bgt _02268566
	str r1, [r4, #0x50]
	movs r0, #0x3c
	str r0, [sp]
	ldr r3, [r4, #0x50]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov49_02268664
	movs r0, #1
_02268566:
	ldr r1, [sp, #8]
	adds r4, r4, #4
	adds r1, r1, #1
	adds r7, r7, #4
	adds r6, r6, #4
	adds r5, r5, #4
	str r1, [sp, #8]
	cmp r1, #4
	blt _0226854A
	cmp r0, #0
	beq _02268582
	ldr r0, [sp, #4]
	bl ov49_022686F0
_02268582:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_022684FC

	thumb_func_start ov49_02268588
ov49_02268588: @ 0x02268588
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5]
	ldr r2, _022685F4 @ =0x0226A7E0
	strb r0, [r5, #0x18]
	ldrb r0, [r5, #1]
	strb r0, [r5, #0x19]
	ldrb r0, [r5, #2]
	strb r0, [r5, #0x1a]
	ldrb r0, [r5, #3]
	strb r0, [r5, #0x1b]
	movs r0, #0
	str r0, [r5, #0x48]
	movs r0, #0xa
	muls r0, r1, r0
	adds r4, r2, r0
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	bl ov49_02268640
	adds r6, r4, #2
	adds r4, r5, #0
	movs r7, #0
	adds r4, #0x38
_022685BA:
	ldrb r1, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r5, #0
	ldrb r1, [r5, #9]
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r5, #0
	ldrb r1, [r5, #0xa]
	adds r0, #0x22
	strb r1, [r0]
	adds r0, r5, #0
	ldrb r1, [r5, #0xb]
	adds r0, #0x23
	strb r1, [r0]
	movs r0, #0
	str r0, [r5, #0x50]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov49_02268640
	adds r7, r7, #1
	adds r5, r5, #4
	adds r6, r6, #2
	adds r4, r4, #4
	cmp r7, #4
	blt _022685BA
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022685F4: .4byte 0x0226A7E0
	thumb_func_end ov49_02268588

	thumb_func_start ov49_022685F8
ov49_022685F8: @ 0x022685F8
	ldrb r2, [r0, #4]
	ldr r3, _02268618 @ =ov49_02268640
	lsls r1, r1, #1
	strb r2, [r0, #0x1c]
	ldrb r2, [r0, #5]
	strb r2, [r0, #0x1d]
	ldrb r2, [r0, #6]
	strb r2, [r0, #0x1e]
	ldrb r2, [r0, #7]
	strb r2, [r0, #0x1f]
	movs r2, #0
	str r2, [r0, #0x4c]
	ldr r2, _0226861C @ =0x0226A7D8
	adds r0, #0x34
	adds r1, r2, r1
	bx r3
	.align 2, 0
_02268618: .4byte ov49_02268640
_0226861C: .4byte 0x0226A7D8
	thumb_func_end ov49_022685F8

	thumb_func_start ov49_02268620
ov49_02268620: @ 0x02268620
	bx lr
	.align 2, 0
	thumb_func_end ov49_02268620

	thumb_func_start ov49_02268624
ov49_02268624: @ 0x02268624
	push {r3, r4}
	movs r3, #0
	movs r2, #2
	ldrsb r4, [r0, r3]
	ldrsb r2, [r0, r2]
	movs r3, #1
	ldrsb r0, [r0, r3]
	lsls r2, r2, #0xa
	lsls r0, r0, #5
	orrs r0, r4
	orrs r0, r2
	strh r0, [r1]
	pop {r3, r4}
	bx lr
	thumb_func_end ov49_02268624

	thumb_func_start ov49_02268640
ov49_02268640: @ 0x02268640
	push {r3, r4}
	ldrh r3, [r1]
	movs r2, #0x1f
	ands r3, r2
	strb r3, [r0]
	ldrh r4, [r1]
	lsls r3, r2, #5
	ands r3, r4
	asrs r3, r3, #5
	strb r3, [r0, #1]
	ldrh r3, [r1]
	lsls r1, r2, #0xa
	ands r1, r3
	asrs r1, r1, #0xa
	strb r1, [r0, #2]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov49_02268640

	thumb_func_start ov49_02268664
ov49_02268664: @ 0x02268664
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	adds r4, r2, #0
	ldrsb r2, [r1, r0]
	ldrsb r0, [r5, r0]
	adds r6, r3, #0
	subs r0, r2, r0
	str r0, [sp, #4]
	movs r0, #2
	ldrsb r2, [r1, r0]
	ldrsb r0, [r5, r0]
	subs r0, r2, r0
	str r0, [sp]
	movs r0, #0
	ldrsb r7, [r5, r0]
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x20]
	subs r0, r0, r7
	muls r0, r6, r0
	blx FUN_020F2998
	adds r0, r7, r0
	strb r0, [r4]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	muls r0, r6, r0
	blx FUN_020F2998
	movs r1, #1
	ldrsb r1, [r5, r1]
	adds r0, r1, r0
	strb r0, [r4, #1]
	ldr r0, [sp]
	ldr r1, [sp, #0x20]
	muls r0, r6, r0
	blx FUN_020F2998
	movs r1, #2
	ldrsb r1, [r5, r1]
	adds r0, r1, r0
	strb r0, [r4, #2]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02268664

	thumb_func_start ov49_022686C0
ov49_022686C0: @ 0x022686C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov49_02268640
	movs r6, #0
	adds r4, r4, #2
	adds r5, #8
_022686D0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02268640
	adds r6, r6, #1
	adds r4, r4, #2
	adds r5, r5, #4
	cmp r6, #4
	blt _022686D0
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_022686C0

	thumb_func_start ov49_022686E4
ov49_022686E4: @ 0x022686E4
	ldr r3, _022686EC @ =ov49_02268640
	adds r0, r0, #4
	bx r3
	nop
_022686EC: .4byte ov49_02268640
	thumb_func_end ov49_022686E4

	thumb_func_start ov49_022686F0
ov49_022686F0: @ 0x022686F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, sp, #4
	str r0, [sp]
	movs r4, #0
	adds r5, r0, #0
	adds r7, #2
	add r6, sp, #4
_02268700:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov49_02268624
	ldrh r1, [r6, #2]
	adds r0, r4, #0
	blx FUN_020BF070
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02268700
	ldr r0, [sp]
	add r1, sp, #4
	adds r0, #8
	adds r1, #2
	bl ov49_02268624
	ldr r0, [sp]
	add r1, sp, #4
	adds r0, #0xc
	bl ov49_02268624
	add r1, sp, #4
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	movs r2, #0
	blx FUN_020BF084
	ldr r0, [sp]
	add r1, sp, #4
	adds r0, #0x10
	adds r1, #2
	bl ov49_02268624
	ldr r0, [sp]
	add r1, sp, #4
	adds r0, #0x14
	str r0, [sp]
	bl ov49_02268624
	add r1, sp, #4
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	movs r2, #0
	blx FUN_020BF0A8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_022686F0

	thumb_func_start ov49_02268764
ov49_02268764: @ 0x02268764
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	movs r1, #0x1c
	adds r6, r0, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x1c
	movs r0, #0
_0226877A:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0226877A
	str r5, [r4]
	adds r0, r5, #0
	bl ov49_02259FE8
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov49_02259FF8
	str r0, [r4, #8]
	adds r0, r5, #0
	bl ov49_02259FF0
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	bl FUN_0222A3BC
	bl ov49_02268974
	adds r7, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0222A3D4
	bl ov49_022689A0
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	bl FUN_0222A3EC
	bl ov49_022689D4
	adds r3, r0, #0
	ldr r2, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov49_02268490
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov49_02268FAC
	str r0, [r4, #0x14]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	adds r2, r6, #0
	bl ov49_02268A0C
	str r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	adds r1, r7, #0
	bl ov49_02258BEC
	ldr r0, [r4, #4]
	bl FUN_0222A35C
	adds r5, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0222A324
	ldr r0, [r4, #4]
	bl FUN_0222A374
	str r0, [sp]
	ldr r0, [r4, #4]
	bl FUN_0222A3A0
	adds r7, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0222A330
	adds r6, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0222A394
	cmp r5, #2
	bne _02268820
	ldr r0, [r4, #8]
	bl ov49_0225E714
_02268820:
	cmp r5, #1
	beq _02268834
	cmp r5, #0
	bne _02268834
	cmp r7, #1
	bne _02268834
	ldr r0, [r4, #8]
	movs r1, #3
	bl ov49_0225E760
_02268834:
	ldr r0, [sp]
	cmp r0, #1
	bne _02268840
	ldr r0, [r4, #8]
	bl ov49_0225E574
_02268840:
	cmp r6, #1
	bne _0226884A
	adds r0, r4, #0
	bl ov49_02268A00
_0226884A:
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02268764

	thumb_func_start ov49_02268850
ov49_02268850: @ 0x02268850
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	bl ov49_02268A6C
	ldr r0, [r4, #0x14]
	bl ov49_02269090
	ldr r0, [r4, #0x10]
	bl ov49_022684F4
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_02268850

	thumb_func_start ov49_02268870
ov49_02268870: @ 0x02268870
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_0222A288
	cmp r0, #0
	beq _0226889C
	ldr r0, [r5, #4]
	bl FUN_0222A3BC
	bl ov49_02268974
	adds r4, r0, #0
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl ov49_02268588
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	bl ov49_02258C08
_0226889C:
	ldr r0, [r5, #4]
	movs r1, #2
	bl FUN_0222A288
	cmp r0, #0
	beq _022688BA
	ldr r0, [r5, #4]
	bl FUN_0222A3D4
	bl ov49_022689A0
	adds r1, r0, #0
	ldr r0, [r5, #0x10]
	bl ov49_022685F8
_022688BA:
	ldr r0, [r5, #4]
	movs r1, #3
	bl FUN_0222A288
	cmp r0, #0
	beq _022688D8
	ldr r0, [r5, #4]
	bl FUN_0222A3EC
	bl ov49_022689D4
	adds r1, r0, #0
	ldr r0, [r5, #0x10]
	bl ov49_02268620
_022688D8:
	ldr r0, [r5, #4]
	bl FUN_0222A3A0
	cmp r0, #1
	bne _022688FE
	ldr r0, [r5, #4]
	bl FUN_0222A35C
	cmp r0, #0
	bne _022688FE
	ldr r0, [r5, #8]
	bl ov49_0225E824
	cmp r0, #0
	bne _022688FE
	ldr r0, [r5, #8]
	movs r1, #1
	bl ov49_0225E760
_022688FE:
	ldr r0, [r5, #4]
	movs r1, #5
	bl FUN_0222A288
	cmp r0, #0
	beq _02268922
	ldr r0, [r5, #4]
	bl FUN_0222A35C
	cmp r0, #1
	bne _02268922
	ldr r0, [r5, #8]
	bl ov49_0225E714
	ldr r0, [r5, #8]
	movs r1, #2
	bl ov49_0225E760
_02268922:
	ldr r0, [r5, #4]
	movs r1, #6
	bl FUN_0222A288
	cmp r0, #0
	beq _0226893E
	ldr r0, [r5, #4]
	bl FUN_0222A374
	cmp r0, #1
	bne _0226893E
	ldr r0, [r5, #8]
	bl ov49_0225E574
_0226893E:
	ldr r0, [r5, #4]
	bl FUN_0222A330
	cmp r0, #1
	bne _02268954
	ldr r0, [r5, #8]
	bl ov49_0225E580
	adds r0, r5, #0
	bl ov49_02268A00
_02268954:
	ldr r0, [r5, #0x10]
	bl ov49_022684FC
	ldr r0, [r5, #0x14]
	bl ov49_02269098
	ldr r0, [r5, #0x18]
	bl ov49_02268A7C
	pop {r3, r4, r5, pc}
	thumb_func_end ov49_02268870

	thumb_func_start ov49_02268968
ov49_02268968: @ 0x02268968
	ldr r3, _02268970 @ =ov49_02269154
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02268970: .4byte ov49_02269154
	thumb_func_end ov49_02268968

	thumb_func_start ov49_02268974
ov49_02268974: @ 0x02268974
	push {r3, lr}
	cmp r0, #6
	bhi _02268998
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02268986: @ jump table
	.2byte _02268998 - _02268986 - 2 @ case 0
	.2byte _02268994 - _02268986 - 2 @ case 1
	.2byte _02268994 - _02268986 - 2 @ case 2
	.2byte _02268994 - _02268986 - 2 @ case 3
	.2byte _02268994 - _02268986 - 2 @ case 4
	.2byte _02268994 - _02268986 - 2 @ case 5
	.2byte _02268994 - _02268986 - 2 @ case 6
_02268994:
	subs r0, r0, #1
	pop {r3, pc}
_02268998:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov49_02268974

	thumb_func_start ov49_022689A0
ov49_022689A0: @ 0x022689A0
	push {r3, lr}
	cmp r0, #0xa
	bhi _022689CC
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022689B2: @ jump table
	.2byte _022689CC - _022689B2 - 2 @ case 0
	.2byte _022689CC - _022689B2 - 2 @ case 1
	.2byte _022689CC - _022689B2 - 2 @ case 2
	.2byte _022689CC - _022689B2 - 2 @ case 3
	.2byte _022689CC - _022689B2 - 2 @ case 4
	.2byte _022689CC - _022689B2 - 2 @ case 5
	.2byte _022689CC - _022689B2 - 2 @ case 6
	.2byte _022689C8 - _022689B2 - 2 @ case 7
	.2byte _022689C8 - _022689B2 - 2 @ case 8
	.2byte _022689C8 - _022689B2 - 2 @ case 9
	.2byte _022689C8 - _022689B2 - 2 @ case 10
_022689C8:
	subs r0, r0, #7
	pop {r3, pc}
_022689CC:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov49_022689A0

	thumb_func_start ov49_022689D4
ov49_022689D4: @ 0x022689D4
	push {r3, lr}
	adds r1, r0, #0
	subs r1, #0xb
	cmp r1, #3
	bhi _022689F6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022689EA: @ jump table
	.2byte _022689F2 - _022689EA - 2 @ case 0
	.2byte _022689F2 - _022689EA - 2 @ case 1
	.2byte _022689F2 - _022689EA - 2 @ case 2
	.2byte _022689F2 - _022689EA - 2 @ case 3
_022689F2:
	subs r0, #0xb
	pop {r3, pc}
_022689F6:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_022689D4

	thumb_func_start ov49_02268A00
ov49_02268A00: @ 0x02268A00
	ldr r3, _02268A08 @ =FUN_020BF070
	movs r0, #2
	movs r1, #0
	bx r3
	.align 2, 0
_02268A08: .4byte FUN_020BF070
	thumb_func_end ov49_02268A00

	thumb_func_start ov49_02268A0C
ov49_02268A0C: @ 0x02268A0C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	movs r1, #0x10
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x10
	movs r0, #0
_02268A22:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02268A22
	str r5, [r4]
	adds r0, r5, #0
	str r6, [r4, #4]
	bl FUN_0222B1DC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0222A35C
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _02268A66
	cmp r7, #0
	beq _02268A66
	adds r0, r6, #0
	movs r1, #1
	bl ov49_0225E624
	adds r0, r4, #0
	bl ov49_02268D94
	adds r0, r5, #0
	bl FUN_0222B1EC
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov49_02268C74
_02268A66:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02268A0C

	thumb_func_start ov49_02268A6C
ov49_02268A6C: @ 0x02268A6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov49_02268DB0
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov49_02268A6C

	thumb_func_start ov49_02268A7C
ov49_02268A7C: @ 0x02268A7C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0222B1DC
	adds r4, r0, #0
	ldr r0, [r5]
	bl FUN_0222B1EC
	adds r7, r0, #0
	ldr r0, [r5]
	bl FUN_0222A35C
	adds r6, r0, #0
	ldrh r0, [r5, #0xa]
	cmp r0, r6
	beq _02268ABC
	strh r6, [r5, #0xa]
	cmp r6, #1
	bne _02268ABC
	ldr r0, [r5, #4]
	movs r1, #1
	bl ov49_0225E624
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov49_02268C74
	adds r0, r5, #0
	bl ov49_02268D94
_02268ABC:
	cmp r6, #0
	beq _02268ADA
	ldrb r0, [r5, #8]
	cmp r0, r4
	beq _02268AD0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov49_02268C74
_02268AD0:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov49_02268ADC
_02268ADA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02268A7C

	thumb_func_start ov49_02268ADC
ov49_02268ADC: @ 0x02268ADC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #6
	blo _02268AEC
	bl GF_AssertFail
_02268AEC:
	cmp r4, #6
	bhs _02268AFC
	ldr r2, _02268B00 @ =0x0226A84C
	lsls r3, r4, #2
	ldr r2, [r2, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	blx r2
_02268AFC:
	pop {r4, r5, r6, pc}
	nop
_02268B00: .4byte 0x0226A84C
	thumb_func_end ov49_02268ADC

	thumb_func_start ov49_02268B04
ov49_02268B04: @ 0x02268B04
	bx lr
	.align 2, 0
	thumb_func_end ov49_02268B04

	thumb_func_start ov49_02268B08
ov49_02268B08: @ 0x02268B08
	bx lr
	.align 2, 0
	thumb_func_end ov49_02268B08

	thumb_func_start ov49_02268B0C
ov49_02268B0C: @ 0x02268B0C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, r1, #0
	movs r1, #0xe
	blx FUN_020F2BA4
	cmp r1, #0
	bne _02268B86
	ldr r5, _02268B88 @ =0x0226A8B4
	movs r4, #0
_02268B20:
	ldr r0, [r7, #0xc]
	adds r1, r4, #0
	lsls r2, r0, #3
	ldr r0, _02268B8C @ =0x0226A894
	movs r6, #0
	adds r3, r0, r2
	movs r0, #3
	ands r1, r0
	ldr r0, _02268B8C @ =0x0226A894
	ldr r0, [r0, r2]
	cmp r1, r0
	bne _02268B40
	movs r0, #1
	str r0, [sp]
	adds r6, r0, #0
	b _02268B4C
_02268B40:
	ldr r0, [r3, #4]
	cmp r1, r0
	bne _02268B4C
	adds r0, r6, #0
	str r0, [sp]
	movs r6, #1
_02268B4C:
	cmp r6, #1
	bne _02268B72
	cmp r4, #0x11
	bhs _02268B6E
	ldrb r1, [r5]
	movs r3, #1
	ldr r0, [r7, #4]
	ldr r2, [sp]
	lsls r3, r3, #0xc
	bl ov49_0225E85C
	adds r6, r0, #0
	cmp r6, #1
	beq _02268B74
	bl GF_AssertFail
	b _02268B74
_02268B6E:
	movs r6, #0
	b _02268B74
_02268B72:
	movs r6, #1
_02268B74:
	adds r5, r5, #1
	adds r4, r4, #1
	cmp r6, #1
	beq _02268B20
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	movs r0, #3
	ands r0, r1
	str r0, [r7, #0xc]
_02268B86:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02268B88: .4byte 0x0226A8B4
_02268B8C: .4byte 0x0226A894
	thumb_func_end ov49_02268B0C

	thumb_func_start ov49_02268B90
ov49_02268B90: @ 0x02268B90
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #6
	blx FUN_020F2BA4
	cmp r1, #0
	bne _02268C20
	ldr r0, [r5, #0xc]
	lsls r1, r0, #1
	ldr r0, _02268C24 @ =0x0226A83C
	ldrb r0, [r0, r1]
	str r0, [sp]
	ldr r0, _02268C28 @ =0x0226A83D
	ldrb r0, [r0, r1]
	add r1, sp, #4
	bl ov49_02268D0C
	ldr r0, [sp, #8]
	movs r4, #0
	cmp r0, #0
	bls _02268BE2
	movs r7, #1
	adds r6, r4, #0
	lsls r7, r7, #0xc
_02268BC4:
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	ldrb r1, [r1, r4]
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov49_0225E85C
	cmp r0, #1
	beq _02268BDA
	bl GF_AssertFail
_02268BDA:
	ldr r0, [sp, #8]
	adds r4, r4, #1
	cmp r4, r0
	blo _02268BC4
_02268BE2:
	ldr r0, [sp]
	add r1, sp, #4
	bl ov49_02268D0C
	ldr r0, [sp, #8]
	movs r4, #0
	cmp r0, #0
	bls _02268C14
	movs r6, #1
	lsls r7, r6, #0xc
_02268BF6:
	ldr r1, [sp, #4]
	ldr r0, [r5, #4]
	ldrb r1, [r1, r4]
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov49_0225E85C
	cmp r0, #1
	beq _02268C0C
	bl GF_AssertFail
_02268C0C:
	ldr r0, [sp, #8]
	adds r4, r4, #1
	cmp r4, r0
	blo _02268BF6
_02268C14:
	ldr r0, [r5, #0xc]
	movs r1, #7
	adds r0, r0, #1
	blx FUN_020F2BA4
	str r1, [r5, #0xc]
_02268C20:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02268C24: .4byte 0x0226A83C
_02268C28: .4byte 0x0226A83D
	thumb_func_end ov49_02268B90

	thumb_func_start ov49_02268C2C
ov49_02268C2C: @ 0x02268C2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhs _02268C64
	lsls r2, r0, #3
	ldr r0, _02268C68 @ =0x0226A864
	ldr r0, [r0, r2]
	cmp r0, r1
	bhs _02268C64
	ldr r1, _02268C6C @ =0x0226A868
	ldr r0, [r4, #4]
	ldr r1, [r1, r2]
	bl ov49_0225E894
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #4]
	lsls r2, r1, #3
	ldr r1, _02268C6C @ =0x0226A868
	ldr r1, [r1, r2]
	bl ov49_0225E6E0
	ldr r0, _02268C70 @ =0x000005B4
	bl FUN_0200604C
	ldr r0, [r4, #0xc]
	adds r0, r0, #1
	str r0, [r4, #0xc]
_02268C64:
	pop {r4, pc}
	nop
_02268C68: .4byte 0x0226A864
_02268C6C: .4byte 0x0226A868
_02268C70: .4byte 0x000005B4
	thumb_func_end ov49_02268C2C

	thumb_func_start ov49_02268C74
ov49_02268C74: @ 0x02268C74
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #6
	blo _02268C84
	bl GF_AssertFail
_02268C84:
	cmp r4, #6
	bhs _02268CA4
	adds r1, r5, #0
	movs r0, #0
	adds r1, #0xc
	strb r0, [r5, #0xc]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	ldr r2, _02268CA8 @ =0x0226A87C
	lsls r3, r4, #2
	ldr r2, [r2, r3]
	adds r0, r5, #0
	adds r1, r6, #0
	blx r2
	strb r4, [r5, #8]
_02268CA4:
	pop {r4, r5, r6, pc}
	nop
_02268CA8: .4byte 0x0226A87C
	thumb_func_end ov49_02268C74

	thumb_func_start ov49_02268CAC
ov49_02268CAC: @ 0x02268CAC
	ldr r3, _02268CB8 @ =ov49_0225E82C
	movs r2, #1
	ldr r0, [r0, #4]
	movs r1, #0
	lsls r2, r2, #0xc
	bx r3
	.align 2, 0
_02268CB8: .4byte ov49_0225E82C
	thumb_func_end ov49_02268CAC

	thumb_func_start ov49_02268CBC
ov49_02268CBC: @ 0x02268CBC
	ldr r3, _02268CC8 @ =ov49_0225E82C
	movs r1, #1
	ldr r0, [r0, #4]
	lsls r2, r1, #0xc
	bx r3
	nop
_02268CC8: .4byte ov49_0225E82C
	thumb_func_end ov49_02268CBC

	thumb_func_start ov49_02268CCC
ov49_02268CCC: @ 0x02268CCC
	ldr r3, _02268CD8 @ =ov49_0225E82C
	movs r2, #1
	ldr r0, [r0, #4]
	movs r1, #0
	lsls r2, r2, #0xc
	bx r3
	.align 2, 0
_02268CD8: .4byte ov49_0225E82C
	thumb_func_end ov49_02268CCC

	thumb_func_start ov49_02268CDC
ov49_02268CDC: @ 0x02268CDC
	ldr r3, _02268CE8 @ =ov49_0225E82C
	movs r2, #1
	ldr r0, [r0, #4]
	movs r1, #0
	lsls r2, r2, #0xc
	bx r3
	.align 2, 0
_02268CE8: .4byte ov49_0225E82C
	thumb_func_end ov49_02268CDC

	thumb_func_start ov49_02268CEC
ov49_02268CEC: @ 0x02268CEC
	push {r4, lr}
	adds r4, r0, #0
	bl ov49_02268DB0
	movs r2, #1
	ldr r0, [r4, #4]
	movs r1, #0
	lsls r2, r2, #0xc
	bl ov49_0225E82C
	ldr r0, [r4, #4]
	movs r1, #0
	bl ov49_0225E624
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_02268CEC

	thumb_func_start ov49_02268D0C
ov49_02268D0C: @ 0x02268D0C
	push {r3, lr}
	cmp r0, #6
	bhi _02268D72
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02268D1E: @ jump table
	.2byte _02268D2C - _02268D1E - 2 @ case 0
	.2byte _02268D36 - _02268D1E - 2 @ case 1
	.2byte _02268D40 - _02268D1E - 2 @ case 2
	.2byte _02268D4A - _02268D1E - 2 @ case 3
	.2byte _02268D54 - _02268D1E - 2 @ case 4
	.2byte _02268D5E - _02268D1E - 2 @ case 5
	.2byte _02268D68 - _02268D1E - 2 @ case 6
_02268D2C:
	movs r0, #6
	str r0, [r1, #4]
	ldr r0, _02268D78 @ =0x0226A834
	str r0, [r1]
	pop {r3, pc}
_02268D36:
	movs r0, #2
	str r0, [r1, #4]
	ldr r0, _02268D7C @ =0x0226A82C
	str r0, [r1]
	pop {r3, pc}
_02268D40:
	movs r0, #2
	str r0, [r1, #4]
	ldr r0, _02268D80 @ =0x0226A824
	str r0, [r1]
	pop {r3, pc}
_02268D4A:
	movs r0, #1
	str r0, [r1, #4]
	ldr r0, _02268D84 @ =0x0226A81C
	str r0, [r1]
	pop {r3, pc}
_02268D54:
	movs r0, #1
	str r0, [r1, #4]
	ldr r0, _02268D88 @ =0x0226A820
	str r0, [r1]
	pop {r3, pc}
_02268D5E:
	movs r0, #2
	str r0, [r1, #4]
	ldr r0, _02268D8C @ =0x0226A828
	str r0, [r1]
	pop {r3, pc}
_02268D68:
	movs r0, #3
	str r0, [r1, #4]
	ldr r0, _02268D90 @ =0x0226A830
	str r0, [r1]
	pop {r3, pc}
_02268D72:
	bl GF_AssertFail
	pop {r3, pc}
	.align 2, 0
_02268D78: .4byte 0x0226A834
_02268D7C: .4byte 0x0226A82C
_02268D80: .4byte 0x0226A824
_02268D84: .4byte 0x0226A81C
_02268D88: .4byte 0x0226A820
_02268D8C: .4byte 0x0226A828
_02268D90: .4byte 0x0226A830
	thumb_func_end ov49_02268D0C

	thumb_func_start ov49_02268D94
ov49_02268D94: @ 0x02268D94
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _02268DA8
	ldr r0, _02268DAC @ =0x000005B5
	bl FUN_0200604C
	movs r0, #1
	strb r0, [r4, #9]
_02268DA8:
	pop {r4, pc}
	nop
_02268DAC: .4byte 0x000005B5
	thumb_func_end ov49_02268D94

	thumb_func_start ov49_02268DB0
ov49_02268DB0: @ 0x02268DB0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _02268DC6
	ldr r0, _02268DC8 @ =0x000005B5
	movs r1, #0
	bl FUN_02006154
	movs r0, #0
	strb r0, [r4, #9]
_02268DC6:
	pop {r4, pc}
	.align 2, 0
_02268DC8: .4byte 0x000005B5
	thumb_func_end ov49_02268DB0

	thumb_func_start ov49_02268DCC
ov49_02268DCC: @ 0x02268DCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov49_0225EF84
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov49_02259FE8
	str r0, [sp]
	adds r0, r4, #0
	bl ov49_02259FF0
	str r0, [sp, #4]
	bl ov49_02258DB0
	adds r7, r0, #0
	ldr r0, [sp, #4]
	bl ov49_02258DAC
	str r0, [sp, #8]
	adds r0, r5, #0
	bl ov49_0225EF88
	cmp r0, #5
	bls _02268E04
	b _02268F9E
_02268E04:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02268E10: @ jump table
	.2byte _02268E1C - _02268E10 - 2 @ case 0
	.2byte _02268EF2 - _02268E10 - 2 @ case 1
	.2byte _02268F02 - _02268E10 - 2 @ case 2
	.2byte _02268F34 - _02268E10 - 2 @ case 3
	.2byte _02268F54 - _02268E10 - 2 @ case 4
	.2byte _02268F8A - _02268E10 - 2 @ case 5
_02268E1C:
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225EF40
	adds r6, r0, #0
	ldr r0, _02268FA8 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [sp, #8]
	movs r1, #6
	bl ov49_02258E60
	bl FUN_022282A4
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	adds r1, r7, #0
	movs r2, #0
	bl ov49_02258EEC
	adds r0, r7, #0
	movs r1, #0
	bl ov49_02259130
	ldr r1, [sp, #0xc]
	adds r0, r7, #0
	bl ov49_02259160
	ldr r0, [sp]
	bl FUN_0222A330
	cmp r0, #0
	beq _02268E7E
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	bl ov49_0225A30C
	adds r1, r0, #0
	movs r0, #4
	str r0, [r6]
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268E7E:
	ldr r0, [sp]
	bl FUN_0222A3A0
	cmp r0, #1
	bne _02268EA8
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x58
	bl ov49_0225A30C
	adds r1, r0, #0
	movs r0, #4
	str r0, [r6]
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268EA8:
	ldr r0, [sp]
	bl FUN_0222A2E0
	cmp r0, #1
	bne _02268ED2
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x57
	bl ov49_0225A30C
	adds r1, r0, #0
	movs r0, #4
	str r0, [r6]
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268ED2:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x51
	bl ov49_0225A30C
	adds r1, r0, #0
	movs r0, #1
	str r0, [r6]
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268EF2:
	adds r0, r4, #0
	bl ov49_0225A264
	adds r0, r5, #0
	movs r1, #2
	bl ov49_0225EF8C
	b _02268FA2
_02268F02:
	adds r0, r4, #0
	bl ov49_0225A2C4
	cmp r0, #0
	beq _02268F14
	cmp r0, #1
	beq _02268F24
	cmp r0, #2
	b _02268FA2
_02268F14:
	adds r0, r5, #0
	movs r1, #3
	bl ov49_0225EF8C
	adds r0, r4, #0
	bl ov49_0225A2F8
	b _02268FA2
_02268F24:
	adds r0, r5, #0
	movs r1, #4
	bl ov49_0225EF8C
	adds r0, r4, #0
	bl ov49_0225A2F8
	b _02268FA2
_02268F34:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x55
	bl ov49_0225A30C
	adds r1, r0, #0
	movs r0, #4
	str r0, [r6]
	adds r0, r4, #0
	bl ov49_0225A08C
	adds r0, r5, #0
	movs r1, #5
	bl ov49_0225EF8C
	b _02268FA2
_02268F54:
	adds r0, r4, #0
	bl ov49_0225A0EC
	adds r0, r4, #0
	bl ov49_0225A2F8
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	movs r2, #1
	bl ov49_02258EEC
	adds r0, r5, #0
	bl ov49_0225EF68
	adds r0, r7, #0
	movs r1, #1
	bl ov49_02259130
	ldr r0, [sp, #4]
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	bl ov49_02258EAC
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02268F8A:
	adds r0, r4, #0
	bl ov49_0225A0AC
	cmp r0, #1
	bne _02268FA2
	ldr r1, [r6]
	adds r0, r5, #0
	bl ov49_0225EF8C
	b _02268FA2
_02268F9E:
	bl GF_AssertFail
_02268FA2:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02268FA8: .4byte 0x000005DC
	thumb_func_end ov49_02268DCC

	thumb_func_start ov49_02268FAC
ov49_02268FAC: @ 0x02268FAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #0xc4
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0xc4
	blx FUN_020E5B44
	str r5, [r4]
	adds r0, r5, #0
	bl ov49_02259FE8
	str r0, [r4, #4]
	adds r0, r5, #0
	bl ov49_02259FF8
	str r0, [r4, #8]
	adds r0, r5, #0
	bl ov49_0225A000
	str r0, [r4, #0xc]
	bl ov49_022589A8
	adds r1, r0, #6
	adds r0, r4, #0
	adds r0, #0xbc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r1, [r0]
	movs r0, #7
	mvns r0, r0
	subs r1, r0, r1
	adds r0, r4, #0
	adds r0, #0xc0
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	ldr r6, _0226908C @ =0x0226A8C8
	lsls r1, r0, #0x10
	adds r0, r4, #0
	adds r0, #0xbc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r7, #0
	lsls r1, r0, #0x10
	adds r0, r4, #0
	adds r0, #0xc0
	str r1, [r0]
	adds r5, r4, #0
_0226901E:
	movs r0, #0
	str r0, [sp]
	ldrb r1, [r6]
	add r2, sp, #4
	ldr r0, [r4, #0xc]
	adds r2, #2
	add r3, sp, #4
	bl ov49_022589D8
	add r0, sp, #4
	ldrh r0, [r0, #2]
	adds r7, r7, #1
	adds r6, r6, #1
	lsls r1, r0, #4
	adds r0, r5, #0
	adds r0, #0xaa
	strh r1, [r0]
	add r0, sp, #4
	ldrh r0, [r0]
	lsls r1, r0, #4
	adds r0, r5, #0
	adds r0, #0xac
	adds r5, r5, #4
	strh r1, [r0]
	cmp r7, #3
	blt _0226901E
	movs r5, #0
_02269054:
	adds r2, r4, #0
	adds r2, #0xbc
	ldr r0, [r4, #8]
	ldr r2, [r2]
	adds r1, r5, #0
	bl ov49_0225E3B8
	ldr r0, [r4, #4]
	adds r1, r5, #0
	bl FUN_0222AD80
	cmp r0, #1
	bne _0226907E
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_02269178
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov49_022695C4
_0226907E:
	adds r5, r5, #1
	cmp r5, #9
	blt _02269054
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226908C: .4byte 0x0226A8C8
	thumb_func_end ov49_02268FAC

	thumb_func_start ov49_02269090
ov49_02269090: @ 0x02269090
	ldr r3, _02269094 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_02269094: .4byte FUN_0201AB0C
	thumb_func_end ov49_02269090

	thumb_func_start ov49_02269098
ov49_02269098: @ 0x02269098
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_0222A53C
	adds r1, r0, #0
	ldr r0, [r5, #4]
	bl FUN_0222ADA8
	movs r1, #0
	mvns r1, r1
	str r0, [sp, #8]
	cmp r0, r1
	bne _022690BA
	movs r6, #0
	b _022690C4
_022690BA:
	add r1, sp, #8
	add r2, sp, #4
	bl FUN_0222AE08
	movs r6, #1
_022690C4:
	movs r4, #0
_022690C6:
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl FUN_0222AD80
	cmp r0, #1
	ldr r0, [r5, #8]
	bne _0226910E
	adds r1, r4, #0
	movs r2, #1
	bl ov49_0225E4CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_02269178
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov49_022695C4
	cmp r6, #0
	beq _022690FC
	ldr r0, [sp, #8]
	cmp r0, r4
	bne _022690FA
	movs r7, #1
	b _022690FC
_022690FA:
	movs r7, #0
_022690FC:
	ldr r0, [sp, #4]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov49_02269240
	b _02269116
_0226910E:
	adds r1, r4, #0
	movs r2, #0
	bl ov49_0225E4CC
_02269116:
	adds r4, r4, #1
	cmp r4, #9
	blt _022690C6
	adds r7, r5, #0
	movs r6, #0
	adds r4, r5, #0
	adds r7, #0x2c
_02269124:
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl ov49_0225E524
	strb r0, [r4, #0x10]
	ldr r1, [r5, #8]
	adds r0, r7, #0
	adds r2, r6, #0
	bl ov49_02269430
	strb r0, [r4, #0x11]
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl ov49_0225E54C
	strb r0, [r4, #0x12]
	adds r6, r6, #1
	adds r4, r4, #3
	adds r7, #0xe
	cmp r6, #9
	blt _02269124
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov49_02269098

	thumb_func_start ov49_02269154
ov49_02269154: @ 0x02269154
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r4, r2, #0
	cmp r5, #9
	blo _02269164
	bl GF_AssertFail
_02269164:
	cmp r4, #3
	blt _0226916C
	bl GF_AssertFail
_0226916C:
	lsls r0, r5, #1
	adds r0, r5, r0
	adds r0, r6, r0
	adds r0, r0, r4
	ldrb r0, [r0, #0x10]
	pop {r4, r5, r6, pc}
	thumb_func_end ov49_02269154

	thumb_func_start ov49_02269178
ov49_02269178: @ 0x02269178
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	str r1, [sp]
	bl FUN_0222AD90
	adds r4, r0, #0
	ldr r0, [r5, #4]
	bl FUN_0222ADA0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	movs r1, #2
	ldr r0, [r0]
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	adds r7, r0, #0
	cmp r6, #0
	ble _022691B4
	lsls r0, r6, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022691C2
_022691B4:
	lsls r0, r6, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022691C2:
	adds r6, r0, #0
	cmp r4, #0
	ble _022691DA
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _022691E8
_022691DA:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_022691E8:
	blx FUN_020F2104
	asrs r1, r0, #0x1f
	asrs r3, r7, #0x1f
	adds r2, r7, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r4, r2, #0xc
	orrs r4, r0
	adds r0, r6, #0
	blx FUN_020F2104
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020CCBA0
	asrs r2, r0, #0x1f
	lsls r3, r2, #0xd
	lsrs r1, r0, #0x13
	lsls r2, r0, #0xd
	movs r0, #2
	orrs r3, r1
	movs r1, #0
	lsls r0, r0, #0xa
	adds r2, r2, r0
	adcs r3, r1
	lsls r0, r3, #0x14
	lsrs r3, r2, #0xc
	orrs r3, r0
	adds r0, r5, #0
	adds r0, #0xbc
	ldr r2, [r0]
	ldr r0, [r5, #8]
	ldr r1, [sp]
	adds r2, r3, r2
	bl ov49_0225E3B8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov49_02269178

	thumb_func_start ov49_02269240
ov49_02269240: @ 0x02269240
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	ldr r0, [sp, #0x30]
	str r1, [sp]
	str r0, [sp, #0x30]
	ldr r0, [r7, #4]
	str r2, [sp, #4]
	adds r5, r3, #0
	bl FUN_0222AD3C
	adds r6, r0, #0
	ldr r0, [r7, #4]
	bl FUN_0222AD2C
	ldr r0, [sp]
	movs r4, #0
	lsls r1, r0, #1
	adds r0, r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp]
	movs r1, #3
	blx FUN_020F2BA4
	str r1, [sp, #8]
	movs r0, #0xc
	ldr r1, _02269398 @ =0x0226A8DC
	muls r0, r6, r0
	adds r0, r1, r0
	str r0, [sp, #0xc]
	adds r0, r7, #0
	str r0, [sp, #0x14]
	adds r0, #0x2c
	str r0, [sp, #0x14]
	ldr r0, [sp]
	movs r1, #0xe
	muls r1, r0, r1
	str r1, [sp, #0x18]
_0226928C:
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r4, r1
	bl FUN_0222ADE8
	movs r6, #0
	cmp r5, #1
	bne _022692A4
	ldr r1, [sp, #0x30]
	cmp r4, r1
	bne _022692A4
	movs r6, #1
_022692A4:
	cmp r0, #1
	bne _0226938A
	cmp r4, #0
	beq _022692B6
	cmp r4, #1
	beq _0226931A
	cmp r4, #2
	beq _02269350
	b _0226938A
_022692B6:
	ldr r0, [r7, #8]
	ldr r1, [sp]
	bl ov49_0225E47C
	cmp r0, #1
	bne _0226938A
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _022692EC
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3, #2]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_022693D4
	ldr r0, [sp, #0xc]
	ldrh r3, [r0, #8]
	ldr r0, _0226939C @ =0x0000FFFE
	cmp r3, r0
	beq _0226930E
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_022693A4
	b _0226930E
_022692EC:
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_022693D4
	ldr r0, [sp, #0xc]
	ldrh r3, [r0, #4]
	ldr r0, _0226939C @ =0x0000FFFE
	cmp r3, r0
	beq _0226930E
	ldr r0, [sp, #4]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_022693A4
_0226930E:
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r4, r1
	bl FUN_0222ADF8
	b _0226938A
_0226931A:
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _02269324
	movs r1, #1
	b _02269326
_02269324:
	movs r1, #0
_02269326:
	ldr r2, [sp, #0x14]
	ldr r0, [sp, #0x18]
	ldr r3, [sp]
	adds r0, r2, r0
	ldr r2, [r7, #8]
	bl ov49_022693F8
	cmp r0, #1
	bne _0226938A
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r4, r1
	bl FUN_0222ADF8
	ldr r0, [sp, #4]
	ldr r3, _022693A0 @ =0x000005C6
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_022693A4
	b _0226938A
_02269350:
	ldr r0, [r7, #8]
	ldr r1, [sp]
	bl ov49_0225E4A4
	cmp r0, #1
	bne _0226938A
	ldr r1, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r4, r1
	bl FUN_0222ADF8
	ldr r0, [sp, #8]
	cmp r0, #2
	bne _0226937C
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3, #0xa]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_022693A4
	b _0226938A
_0226937C:
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldrh r3, [r3, #6]
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov49_022693A4
_0226938A:
	adds r4, r4, #1
	cmp r4, #3
	bge _02269392
	b _0226928C
_02269392:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02269398: .4byte 0x0226A8DC
_0226939C: .4byte 0x0000FFFE
_022693A0: .4byte 0x000005C6
	thumb_func_end ov49_02269240

	thumb_func_start ov49_022693A4
ov49_022693A4: @ 0x022693A4
	push {r3, lr}
	cmp r0, #0
	beq _022693C8
	cmp r1, #0
	beq _022693D0
	cmp r2, #0
	beq _022693BE
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	movs r1, #5
	bl FUN_0200606C
	pop {r3, pc}
_022693BE:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
	pop {r3, pc}
_022693C8:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0200604C
_022693D0:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_022693A4

	thumb_func_start ov49_022693D4
ov49_022693D4: @ 0x022693D4
	push {r3, lr}
	cmp r0, #0
	beq _022693EA
	cmp r1, #0
	beq _022693F4
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl FUN_02006218
	pop {r3, pc}
_022693EA:
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl FUN_02006218
_022693F4:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov49_022693D4

	thumb_func_start ov49_022693F8
ov49_022693F8: @ 0x022693F8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #2
	blo _0226940A
	bl GF_AssertFail
_0226940A:
	ldrh r0, [r5]
	cmp r0, #1
	bne _02269414
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02269414:
	ldr r3, _0226942C @ =0x0226A8D4
	strh r4, [r5, #2]
	lsls r4, r4, #2
	movs r0, #1
	strh r0, [r5]
	ldr r3, [r3, r4]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	blx r3
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0226942C: .4byte 0x0226A8D4
	thumb_func_end ov49_022693F8

	thumb_func_start ov49_02269430
ov49_02269430: @ 0x02269430
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrh r3, [r4]
	cmp r3, #0
	beq _0226946A
	ldrh r3, [r4, #2]
	lsls r5, r3, #2
	ldr r3, _02269470 @ =0x0226A8CC
	ldr r3, [r3, r5]
	blx r3
	cmp r0, #1
	bne _02269466
	movs r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	strb r0, [r4, #0xc]
	strb r0, [r4, #0xd]
_02269466:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0226946A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02269470: .4byte 0x0226A8CC
	thumb_func_end ov49_02269430

	thumb_func_start ov49_02269474
ov49_02269474: @ 0x02269474
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #4]
	movs r0, #8
	strh r0, [r4, #6]
	movs r0, #5
	bl FUN_0201FD00
	strh r0, [r4, #8]
	movs r0, #2
	strh r0, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_02269474

	thumb_func_start ov49_02269494
ov49_02269494: @ 0x02269494
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #4]
	movs r0, #0x10
	strh r0, [r4, #6]
	movs r0, #0xa
	bl FUN_0201FD00
	strh r0, [r4, #8]
	movs r0, #4
	strh r0, [r4, #0xa]
	movs r0, #2
	strh r0, [r4, #0xc]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov49_02269494

	thumb_func_start ov49_022694B4
ov49_022694B4: @ 0x022694B4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	add r0, sp, #0x10
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	movs r0, #4
	ldrsh r0, [r5, r0]
	str r1, [sp]
	str r2, [sp, #4]
	adds r1, r0, #1
	movs r0, #6
	ldrsh r0, [r5, r0]
	cmp r1, r0
	bge _022694DA
	strh r1, [r5, #4]
	b _022694EC
_022694DA:
	strh r4, [r5, #4]
	movs r0, #0xc
	ldrsh r0, [r5, r0]
	subs r0, r0, #1
	cmp r0, #0
	ble _022694EA
	strh r0, [r5, #0xc]
	b _022694EC
_022694EA:
	movs r4, #1
_022694EC:
	movs r0, #4
	ldrsh r1, [r5, r0]
	ldr r0, _022695BC @ =0x0000FFFF
	muls r0, r1, r0
	movs r1, #6
	ldrsh r1, [r5, r1]
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _02269518
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02269526
_02269518:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02269526:
	blx FUN_020F2104
	adds r2, r0, #0
	asrs r0, r6, #4
	lsls r1, r0, #2
	ldr r0, _022695C0 @ =0x021094DC
	asrs r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	str r0, [sp, #8]
	asrs r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	lsls r0, r1, #4
	lsrs r6, r0, #0x10
	movs r0, #0xa
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _02269572
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02269580
_02269572:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02269580:
	blx FUN_020F2104
	adds r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r2, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r2, #0xc
	orrs r1, r0
	str r1, [sp, #0x14]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, r6, #0
	bl ov49_0225E4F8
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, sp, #0x10
	bl ov49_0225E3F4
	adds r0, r4, #0
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022695BC: .4byte 0x0000FFFF
_022695C0: .4byte 0x021094DC
	thumb_func_end ov49_022694B4

	thumb_func_start ov49_022695C4
ov49_022695C4: @ 0x022695C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	str r1, [sp]
	adds r0, r1, #0
	lsls r1, r0, #1
	ldr r0, [sp]
	movs r6, #0
	adds r0, r0, r1
	str r0, [sp, #4]
_022695D8:
	ldr r1, [sp, #4]
	ldr r0, [r7, #4]
	adds r1, r6, r1
	bl FUN_0222AE34
	adds r4, r0, #0
	ldr r0, [r7, #8]
	ldr r1, [sp]
	adds r2, r6, #0
	add r3, sp, #8
	bl ov49_0225E420
	cmp r4, #3
	bge _0226961A
	lsls r0, r4, #2
	adds r5, r7, r0
_022695F8:
	movs r0, #0xaa
	ldrsh r0, [r5, r0]
	adds r0, #0x10
	lsls r1, r0, #0xc
	ldr r0, [sp, #8]
	cmp r1, r0
	ble _02269612
	ldr r1, [sp, #4]
	ldr r0, [r7, #4]
	adds r1, r6, r1
	adds r2, r4, #0
	bl FUN_0222AE24
_02269612:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _022695F8
_0226961A:
	adds r6, r6, #1
	cmp r6, #3
	blt _022695D8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov49_022695C4

	.rodata

_02269624:
	.byte 0x27, 0x28, 0x29, 0x00, 0x02, 0x03, 0x04, 0x05, 0x24, 0x25, 0x26, 0x27
	.byte 0x28, 0x29, 0x2B, 0x00, 0x01, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10
	.byte 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F, 0x20
	.byte 0x21, 0x22, 0x23, 0x2C, 0x03, 0x02, 0x01, 0x00, 0x20, 0x40, 0x80, 0x90, 0x00, 0x01, 0x02, 0x03
	.byte 0x10, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x02, 0x1E, 0x01, 0xFF, 0x00, 0x00, 0x00
	.byte 0x41, 0x01, 0x1E, 0x01, 0xFF, 0x00, 0x00, 0x00, 0x42, 0x01, 0x1D, 0x01, 0xFF, 0x00, 0x00, 0x00
	.byte 0x61, 0x01, 0x1D, 0x01, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF9, 0x99, 0x25, 0x02
	.byte 0x0D, 0x94, 0x25, 0x02, 0x11, 0x94, 0x25, 0x02, 0xD9, 0x94, 0x25, 0x02, 0xCD, 0x95, 0x25, 0x02
	.byte 0x7D, 0x96, 0x25, 0x02, 0x4D, 0x97, 0x25, 0x02, 0x59, 0x97, 0x25, 0x02, 0x35, 0x97, 0x25, 0x02
	.byte 0x41, 0x97, 0x25, 0x02, 0x1D, 0x99, 0x25, 0x02, 0x14, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x09, 0x06, 0x00, 0x20, 0xA0, 0x28, 0xD8, 0xE4, 0x02, 0xEC, 0x02, 0x03, 0x00, 0x69, 0x00
	.byte 0x34, 0x00, 0x38, 0x00, 0x02, 0x00, 0x68, 0x00, 0x33, 0x00, 0x37, 0x00, 0x05, 0x01, 0x00, 0x18
	.byte 0x03, 0x05, 0xD0, 0x01, 0x08, 0x03, 0x00, 0x00, 0x09, 0x03, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00
	.byte 0xFE, 0x02, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x02, 0x00, 0x32, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x03, 0x00, 0x36, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0xD7, 0x00, 0x00, 0x00, 0x08, 0x00, 0xD1, 0x00, 0x66, 0x00, 0x02, 0x00
	.byte 0xD7, 0x00, 0x31, 0x00, 0x01, 0x00, 0xD7, 0x00, 0x35, 0x00, 0x01, 0x00, 0xE4, 0x02, 0xE5, 0x02
	.byte 0xE6, 0x02, 0xE7, 0x02, 0xE8, 0x02, 0xE9, 0x02, 0xEA, 0x02, 0xEB, 0x02, 0xEC, 0x02, 0xED, 0x02
	.byte 0xEE, 0x02, 0xEF, 0x02, 0xF0, 0x02, 0xF1, 0x02, 0xF2, 0x02, 0xF3, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x06, 0x08, 0x02, 0x10, 0x04, 0x05, 0x40, 0x01, 0x06, 0x01, 0x07, 0x1E
	.byte 0x06, 0x05, 0x80, 0x01, 0x06, 0x01, 0x0E, 0x13, 0x04, 0x05, 0x34, 0x02, 0x06, 0x01, 0x13, 0x13
	.byte 0x04, 0x05, 0x80, 0x02, 0x06, 0x00, 0x0E, 0x16, 0x08, 0x05, 0x34, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x21, 0x00, 0x23, 0x00, 0x61, 0x00, 0x01, 0x00, 0x26, 0x00, 0x24, 0x00, 0x03, 0x00, 0x3C, 0x00
	.byte 0x26, 0x00, 0x19, 0x00, 0x05, 0x00, 0x06, 0x00, 0x2C, 0x00, 0x20, 0x00, 0x0B, 0x00, 0x18, 0x00
	.byte 0x26, 0x00, 0x2C, 0x00, 0x1F, 0x00, 0x39, 0x00, 0x28, 0x00, 0x28, 0x00, 0x32, 0x00, 0x30, 0x00
	.byte 0x2C, 0x00, 0x1A, 0x00, 0x33, 0x00, 0x0E, 0x00, 0x2C, 0x00, 0x25, 0x00, 0x3E, 0x00, 0x20, 0x00
	.byte 0x1D, 0x00, 0x28, 0x00, 0x46, 0x00, 0x31, 0x00, 0x2A, 0x00, 0x2C, 0x00, 0x06, 0x00, 0x03, 0x00
	.byte 0x27, 0x00, 0x22, 0x00, 0x07, 0x00, 0x0A, 0x00, 0x28, 0x00, 0x24, 0x00, 0x0D, 0x00, 0x24, 0x00
	.byte 0x26, 0x00, 0x29, 0x00, 0x0E, 0x00, 0x19, 0x00, 0x24, 0x00, 0x2A, 0x00, 0x23, 0x00, 0x55, 0x00
	.byte 0x26, 0x00, 0x26, 0x00, 0x25, 0x00, 0x23, 0x00, 0x26, 0x00, 0x27, 0x00, 0x2A, 0x00, 0x12, 0x00
	.byte 0x26, 0x00, 0x23, 0x00, 0x3F, 0x00, 0x21, 0x00, 0x28, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x19, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x06, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x09, 0x00, 0x00, 0x00, 0x19, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x03, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x06, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x09, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x06, 0x04, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x01, 0x07, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x02, 0x0A, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x06, 0x0D, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x05, 0x10, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x03, 0x13, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x04, 0x16, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x00, 0x19, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x07, 0x1C, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x04, 0x1F, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x01, 0x22, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x05, 0x25, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x05, 0x28, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x02, 0x2B, 0x00
	.byte 0xF8, 0xFF, 0xFA, 0xFF, 0x00, 0x03, 0x2E, 0x00, 0xF8, 0xFF, 0xFA, 0xFF, 0x01, 0x00, 0x67, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x6A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x6D, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x76, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x73, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x79, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xD6, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF5, 0xFF, 0xFF, 0xFF, 0x0C, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x0A, 0x00
	.byte 0x0E, 0x00, 0x0A, 0x00, 0x1E, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x01, 0x00, 0x1A, 0x00, 0x02, 0x00, 0x1B, 0x00, 0x03, 0x00, 0x1B, 0x00, 0x03, 0x00
	.byte 0x1C, 0x00, 0x04, 0x00, 0x21, 0x00, 0x05, 0x00, 0x46, 0x00, 0x06, 0x00, 0x47, 0x00, 0x07, 0x00
	.byte 0x48, 0x00, 0x08, 0x00, 0x4C, 0x00, 0x09, 0x00, 0x49, 0x00, 0x0A, 0x00, 0x4A, 0x00, 0x0A, 0x00
	.byte 0x4B, 0x00, 0x0A, 0x00, 0x4D, 0x00, 0x0B, 0x00, 0x4E, 0x00, 0x0C, 0x00, 0x4D, 0x00, 0x0D, 0x00
	.byte 0x4E, 0x00, 0x0D, 0x00, 0x4D, 0x00, 0x0E, 0x00, 0x4E, 0x00, 0x0E, 0x00, 0x19, 0x00, 0x0F, 0x00
	.byte 0x1A, 0x00, 0x0F, 0x00, 0x1B, 0x00, 0x0F, 0x00, 0x1B, 0x00, 0x0F, 0x00, 0x1C, 0x00, 0x0F, 0x00
	.byte 0x19, 0x00, 0x10, 0x00, 0x1A, 0x00, 0x10, 0x00, 0x1B, 0x00, 0x10, 0x00, 0x1B, 0x00, 0x10, 0x00
	.byte 0x1C, 0x00, 0x10, 0x00, 0x5C, 0x00, 0x0D, 0x00, 0x5D, 0x00, 0x0D, 0x00, 0x5C, 0x00, 0x0E, 0x00
	.byte 0x5D, 0x00, 0x0E, 0x00, 0x62, 0x00, 0x11, 0x00, 0xCD, 0xFD, 0x25, 0x02, 0x31, 0x02, 0x26, 0x02
	.byte 0x21, 0x17, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x18, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x31, 0x19, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x75, 0x1B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xB5, 0x2F, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0xC5, 0x2A, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x75, 0x3B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x4D, 0x15, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x49, 0xF4, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x29, 0x20, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00
	.byte 0x57, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00, 0x54, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00
	.byte 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00
	.byte 0x19, 0xF5, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x15, 0xFA, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x5D, 0xFB, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0xA9, 0xFC, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x07, 0x00, 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00
	.byte 0x27, 0x28, 0x29, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x15, 0x2B, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x24, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x91, 0x0D, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xE9, 0x44, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x26, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xF5, 0x49, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x27, 0x28, 0x29, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x15, 0x2B, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2B, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCD, 0x8D, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x02, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x17, 0x18, 0x19, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x29, 0x04, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x1B, 0x1C, 0x1D, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x04, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D
	.byte 0x00, 0x00, 0x00, 0x00, 0x29, 0x04, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x00, 0x00, 0x00, 0x00, 0x29, 0x04, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x22, 0x23, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x2D, 0x0E, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1E, 0x1F, 0x20, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC5, 0x07, 0x26, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2C, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x69, 0x0A, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x20, 0x21, 0x22
	.byte 0x23, 0x28, 0x24, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x05, 0x00, 0x07, 0x00
	.byte 0x01, 0x00, 0x09, 0x00, 0x20, 0x00, 0x02, 0x00, 0x20, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0F, 0x00
	.byte 0x20, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x0C, 0x00, 0x21, 0x00, 0x13, 0x00, 0x15, 0x00
	.byte 0x0C, 0x00, 0x17, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x0E, 0x00, 0x14, 0x00, 0x22, 0x00, 0x19, 0x00
	.byte 0x0E, 0x00, 0x1B, 0x00, 0x10, 0x00, 0x08, 0x00, 0x10, 0x00, 0x16, 0x00, 0x1A, 0x00, 0x23, 0x00
	.byte 0x10, 0x00, 0x1D, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x12, 0x00, 0x0A, 0x00, 0x12, 0x00, 0x18, 0x00, 0x1C, 0x00, 0x1E, 0x00
	.byte 0x12, 0x00, 0x24, 0x00, 0x28, 0x00, 0x25, 0x02, 0x29, 0x00, 0x26, 0x02, 0x2B, 0x00, 0x27, 0x02
	.byte 0x2C, 0x00, 0x28, 0x02, 0x2E, 0x00, 0x2A, 0x02, 0x2F, 0x00, 0x2B, 0x02, 0x30, 0x00, 0x2C, 0x02
	.byte 0x31, 0x00, 0x2D, 0x02, 0x32, 0x00, 0x2E, 0x02, 0x33, 0x00, 0x2F, 0x02, 0x34, 0x00, 0x30, 0x02
	.byte 0x35, 0x00, 0x31, 0x02, 0x36, 0x00, 0x32, 0x02, 0x37, 0x00, 0x33, 0x02, 0x38, 0x00, 0x34, 0x02
	.byte 0x39, 0x00, 0x35, 0x02, 0x3A, 0x00, 0x36, 0x02, 0x3B, 0x00, 0x37, 0x02, 0x3C, 0x00, 0x38, 0x02
	.byte 0x3D, 0x00, 0x39, 0x02, 0x3E, 0x00, 0x3A, 0x02, 0x3F, 0x00, 0x3B, 0x02, 0x40, 0x00, 0x3C, 0x02
	.byte 0x55, 0x00, 0x3D, 0x02, 0x56, 0x00, 0x3E, 0x02, 0x57, 0x00, 0x3F, 0x02, 0x58, 0x00, 0x40, 0x02
	.byte 0x59, 0x00, 0x41, 0x02, 0x5A, 0x00, 0x42, 0x02, 0x5B, 0x00, 0x43, 0x02, 0x5C, 0x00, 0x44, 0x02
	.byte 0x5D, 0x00, 0x45, 0x02, 0x5E, 0x00, 0x46, 0x02, 0xEC, 0x00, 0x47, 0x02, 0xED, 0x00, 0x48, 0x02
	.byte 0xEE, 0x00, 0x49, 0x02, 0xEF, 0x00, 0x4A, 0x02, 0xF0, 0x00, 0x4B, 0x02, 0xF1, 0x00, 0x4C, 0x02
	.byte 0xF2, 0x00, 0x4D, 0x02, 0xF3, 0x00, 0x4E, 0x02, 0xF4, 0x00, 0x4F, 0x02, 0xF5, 0x00, 0x50, 0x02
	.byte 0xF6, 0x00, 0x51, 0x02, 0xF7, 0x00, 0x52, 0x02, 0xF8, 0x00, 0x53, 0x02, 0xF9, 0x00, 0x54, 0x02
	.byte 0xFA, 0x00, 0x55, 0x02, 0xFB, 0x00, 0x56, 0x02, 0xFC, 0x00, 0x57, 0x02, 0xFD, 0x00, 0x58, 0x02
	.byte 0xFE, 0x00, 0x59, 0x02, 0xFF, 0x00, 0x5A, 0x02, 0x00, 0x01, 0x5B, 0x02, 0x01, 0x01, 0x5C, 0x02
	.byte 0x02, 0x01, 0x5D, 0x02, 0x03, 0x01, 0x5E, 0x02, 0x04, 0x01, 0x5F, 0x02, 0x05, 0x01, 0x60, 0x02
	.byte 0x06, 0x01, 0x61, 0x02, 0x07, 0x01, 0x62, 0x02, 0x08, 0x01, 0x63, 0x02, 0x09, 0x01, 0x64, 0x02
	.byte 0x0A, 0x01, 0x65, 0x02, 0x0B, 0x01, 0x66, 0x02, 0x0C, 0x01, 0x67, 0x02, 0x0D, 0x01, 0x68, 0x02
	.byte 0x0E, 0x01, 0x69, 0x02, 0x0F, 0x01, 0x6A, 0x02, 0x10, 0x01, 0x6B, 0x02, 0x11, 0x01, 0x6C, 0x02
	.byte 0x12, 0x01, 0x6D, 0x02, 0x13, 0x01, 0x6E, 0x02, 0x64, 0x01, 0x6F, 0x02, 0x65, 0x01, 0x70, 0x02
	.byte 0x66, 0x01, 0x71, 0x02, 0x67, 0x01, 0x72, 0x02, 0x68, 0x01, 0x73, 0x02, 0x69, 0x01, 0x74, 0x02
	.byte 0x6A, 0x01, 0x75, 0x02, 0x6B, 0x01, 0x76, 0x02, 0x6C, 0x01, 0x77, 0x02, 0x6D, 0x01, 0x78, 0x02
	.byte 0x6E, 0x01, 0x79, 0x02, 0x6F, 0x01, 0x7A, 0x02, 0x70, 0x01, 0x7B, 0x02, 0x71, 0x01, 0x7C, 0x02
	.byte 0x72, 0x01, 0x7D, 0x02, 0x73, 0x01, 0x7E, 0x02, 0x74, 0x01, 0x7F, 0x02, 0x75, 0x01, 0x80, 0x02
	.byte 0x76, 0x01, 0x81, 0x02, 0x77, 0x01, 0x82, 0x02, 0x78, 0x01, 0x83, 0x02, 0x79, 0x01, 0x84, 0x02
	.byte 0x7A, 0x01, 0x85, 0x02, 0x7B, 0x01, 0x86, 0x02, 0x7C, 0x01, 0x87, 0x02, 0x7D, 0x01, 0x88, 0x02
	.byte 0x7E, 0x01, 0x89, 0x02, 0x7F, 0x01, 0x8A, 0x02, 0x80, 0x01, 0x8B, 0x02, 0x81, 0x01, 0x8C, 0x02
	.byte 0x82, 0x01, 0x8D, 0x02, 0x83, 0x01, 0x8E, 0x02, 0x84, 0x01, 0x8F, 0x02, 0x85, 0x01, 0x90, 0x02
	.byte 0x86, 0x01, 0x91, 0x02, 0x87, 0x01, 0x92, 0x02, 0x88, 0x01, 0x93, 0x02, 0x89, 0x01, 0x94, 0x02
	.byte 0x8A, 0x01, 0x95, 0x02, 0x8B, 0x01, 0x96, 0x02, 0x8C, 0x01, 0x97, 0x02, 0xDD, 0x01, 0x98, 0x02
	.byte 0xDE, 0x01, 0x99, 0x02, 0xDF, 0x01, 0x9A, 0x02, 0xE0, 0x01, 0x9B, 0x02, 0xE1, 0x01, 0x9C, 0x02
	.byte 0xE2, 0x01, 0x9D, 0x02, 0xE3, 0x01, 0x9E, 0x02, 0xE4, 0x01, 0x9F, 0x02, 0xE5, 0x01, 0xA0, 0x02
	.byte 0xE6, 0x01, 0xA1, 0x02, 0xFB, 0x01, 0xA2, 0x02, 0xFC, 0x01, 0xA3, 0x02, 0xFD, 0x01, 0xA4, 0x02
	.byte 0xFE, 0x01, 0xA5, 0x02, 0xFF, 0x01, 0xA6, 0x02, 0x00, 0x02, 0xA7, 0x02, 0x01, 0x02, 0x8D, 0x03
	.byte 0x02, 0x02, 0xA8, 0x02, 0xAB, 0x02, 0xAD, 0x02, 0xAC, 0x02, 0xAE, 0x02, 0xAF, 0x02, 0xB0, 0x02
	.byte 0x41, 0x00, 0xB1, 0x02, 0x42, 0x00, 0xB2, 0x02, 0x43, 0x00, 0xB3, 0x02, 0x44, 0x00, 0xB4, 0x02
	.byte 0x45, 0x00, 0xB5, 0x02, 0x46, 0x00, 0xB6, 0x02, 0x47, 0x00, 0xB7, 0x02, 0x48, 0x00, 0xB8, 0x02
	.byte 0x49, 0x00, 0xB9, 0x02, 0x4A, 0x00, 0xBA, 0x02, 0x4B, 0x00, 0xBB, 0x02, 0x4C, 0x00, 0xBC, 0x02
	.byte 0x4D, 0x00, 0xBD, 0x02, 0x4E, 0x00, 0xBE, 0x02, 0x4F, 0x00, 0xBF, 0x02, 0x50, 0x00, 0xC0, 0x02
	.byte 0x51, 0x00, 0xC1, 0x02, 0x52, 0x00, 0xC2, 0x02, 0x53, 0x00, 0xC3, 0x02, 0x54, 0x00, 0xC4, 0x02
	.byte 0x5F, 0x00, 0xC5, 0x02, 0x60, 0x00, 0xC6, 0x02, 0x61, 0x00, 0xC7, 0x02, 0x62, 0x00, 0xC8, 0x02
	.byte 0x63, 0x00, 0xC9, 0x02, 0x64, 0x00, 0xCA, 0x02, 0x65, 0x00, 0xCB, 0x02, 0x66, 0x00, 0xCC, 0x02
	.byte 0x67, 0x00, 0xCD, 0x02, 0x68, 0x00, 0xCE, 0x02, 0x69, 0x00, 0xCF, 0x02, 0x6A, 0x00, 0xD0, 0x02
	.byte 0x6B, 0x00, 0xD1, 0x02, 0x6C, 0x00, 0xD2, 0x02, 0x6D, 0x00, 0xD3, 0x02, 0x6E, 0x00, 0xD4, 0x02
	.byte 0x6F, 0x00, 0xD5, 0x02, 0x70, 0x00, 0xD6, 0x02, 0x71, 0x00, 0xD7, 0x02, 0x72, 0x00, 0xD8, 0x02
	.byte 0x14, 0x01, 0xD9, 0x02, 0x15, 0x01, 0xDA, 0x02, 0x16, 0x01, 0xDB, 0x02, 0x17, 0x01, 0xDC, 0x02
	.byte 0x18, 0x01, 0xDD, 0x02, 0x19, 0x01, 0xDE, 0x02, 0x1A, 0x01, 0xDF, 0x02, 0x1B, 0x01, 0xE0, 0x02
	.byte 0x1C, 0x01, 0xE1, 0x02, 0x1D, 0x01, 0xE2, 0x02, 0x1E, 0x01, 0xE3, 0x02, 0x1F, 0x01, 0xE4, 0x02
	.byte 0x20, 0x01, 0xE5, 0x02, 0x21, 0x01, 0xE6, 0x02, 0x22, 0x01, 0xE7, 0x02, 0x23, 0x01, 0xE8, 0x02
	.byte 0x24, 0x01, 0xE9, 0x02, 0x25, 0x01, 0xEA, 0x02, 0x26, 0x01, 0xEB, 0x02, 0x27, 0x01, 0xEC, 0x02
	.byte 0x28, 0x01, 0xED, 0x02, 0x29, 0x01, 0xEE, 0x02, 0x2A, 0x01, 0xEF, 0x02, 0x2B, 0x01, 0xF0, 0x02
	.byte 0x2C, 0x01, 0xF1, 0x02, 0x2D, 0x01, 0xF2, 0x02, 0x2E, 0x01, 0xF3, 0x02, 0x2F, 0x01, 0xF4, 0x02
	.byte 0x30, 0x01, 0xF5, 0x02, 0x31, 0x01, 0xF6, 0x02, 0x32, 0x01, 0xF7, 0x02, 0x33, 0x01, 0xF8, 0x02
	.byte 0x34, 0x01, 0xF9, 0x02, 0x35, 0x01, 0xFA, 0x02, 0x36, 0x01, 0xFB, 0x02, 0x37, 0x01, 0xFC, 0x02
	.byte 0x38, 0x01, 0xFD, 0x02, 0x39, 0x01, 0xFE, 0x02, 0x3A, 0x01, 0xFF, 0x02, 0x3B, 0x01, 0x00, 0x03
	.byte 0x3C, 0x01, 0x01, 0x03, 0x3D, 0x01, 0x02, 0x03, 0x3E, 0x01, 0x03, 0x03, 0x3F, 0x01, 0x04, 0x03
	.byte 0x40, 0x01, 0x05, 0x03, 0x41, 0x01, 0x06, 0x03, 0x42, 0x01, 0x07, 0x03, 0x43, 0x01, 0x08, 0x03
	.byte 0x44, 0x01, 0x09, 0x03, 0x45, 0x01, 0x0A, 0x03, 0x46, 0x01, 0x0B, 0x03, 0x47, 0x01, 0x0C, 0x03
	.byte 0x48, 0x01, 0x0D, 0x03, 0x49, 0x01, 0x0E, 0x03, 0x4A, 0x01, 0x0F, 0x03, 0x4B, 0x01, 0x10, 0x03
	.byte 0x4C, 0x01, 0x11, 0x03, 0x4D, 0x01, 0x12, 0x03, 0x4E, 0x01, 0x13, 0x03, 0x4F, 0x01, 0x14, 0x03
	.byte 0x50, 0x01, 0x15, 0x03, 0x51, 0x01, 0x16, 0x03, 0x52, 0x01, 0x17, 0x03, 0x53, 0x01, 0x18, 0x03
	.byte 0x54, 0x01, 0x19, 0x03, 0x55, 0x01, 0x1A, 0x03, 0x56, 0x01, 0x1B, 0x03, 0x57, 0x01, 0x1C, 0x03
	.byte 0x58, 0x01, 0x1D, 0x03, 0x59, 0x01, 0x1E, 0x03, 0x5A, 0x01, 0x1F, 0x03, 0x5B, 0x01, 0x20, 0x03
	.byte 0x5C, 0x01, 0x21, 0x03, 0x5D, 0x01, 0x22, 0x03, 0x5E, 0x01, 0x23, 0x03, 0x5F, 0x01, 0x24, 0x03
	.byte 0x60, 0x01, 0x25, 0x03, 0x61, 0x01, 0x26, 0x03, 0x62, 0x01, 0x27, 0x03, 0x63, 0x01, 0x28, 0x03
	.byte 0x8D, 0x01, 0x29, 0x03, 0x8E, 0x01, 0x2A, 0x03, 0x8F, 0x01, 0x2B, 0x03, 0x90, 0x01, 0x2C, 0x03
	.byte 0x91, 0x01, 0x2D, 0x03, 0x92, 0x01, 0x2E, 0x03, 0x93, 0x01, 0x2F, 0x03, 0x94, 0x01, 0x30, 0x03
	.byte 0x95, 0x01, 0x31, 0x03, 0x96, 0x01, 0x32, 0x03, 0x97, 0x01, 0x33, 0x03, 0x98, 0x01, 0x34, 0x03
	.byte 0x99, 0x01, 0x35, 0x03, 0x9A, 0x01, 0x36, 0x03, 0x9B, 0x01, 0x37, 0x03, 0x9C, 0x01, 0x38, 0x03
	.byte 0x9D, 0x01, 0x39, 0x03, 0x9E, 0x01, 0x3A, 0x03, 0x9F, 0x01, 0x3B, 0x03, 0xA0, 0x01, 0x3C, 0x03
	.byte 0xA1, 0x01, 0x3D, 0x03, 0xA2, 0x01, 0x3E, 0x03, 0xA3, 0x01, 0x3F, 0x03, 0xA4, 0x01, 0x40, 0x03
	.byte 0xA5, 0x01, 0x41, 0x03, 0xA6, 0x01, 0x42, 0x03, 0xA7, 0x01, 0x43, 0x03, 0xA8, 0x01, 0x44, 0x03
	.byte 0xA9, 0x01, 0x45, 0x03, 0xAA, 0x01, 0x46, 0x03, 0xAB, 0x01, 0x47, 0x03, 0xAC, 0x01, 0x48, 0x03
	.byte 0xAD, 0x01, 0x49, 0x03, 0xAE, 0x01, 0x4A, 0x03, 0xAF, 0x01, 0x4B, 0x03, 0xB0, 0x01, 0x4C, 0x03
	.byte 0xB1, 0x01, 0x4D, 0x03, 0xB2, 0x01, 0x4E, 0x03, 0xB3, 0x01, 0x4F, 0x03, 0xB4, 0x01, 0x50, 0x03
	.byte 0xB5, 0x01, 0x51, 0x03, 0xB6, 0x01, 0x52, 0x03, 0xB7, 0x01, 0x53, 0x03, 0xB8, 0x01, 0x54, 0x03
	.byte 0xB9, 0x01, 0x55, 0x03, 0xBA, 0x01, 0x56, 0x03, 0xBB, 0x01, 0x57, 0x03, 0xBC, 0x01, 0x58, 0x03
	.byte 0xBD, 0x01, 0x59, 0x03, 0xBE, 0x01, 0x5A, 0x03, 0xBF, 0x01, 0x5B, 0x03, 0xC0, 0x01, 0x5C, 0x03
	.byte 0xC1, 0x01, 0x5D, 0x03, 0xC2, 0x01, 0x5E, 0x03, 0xC3, 0x01, 0x5F, 0x03, 0xC4, 0x01, 0x60, 0x03
	.byte 0xC5, 0x01, 0x61, 0x03, 0xC6, 0x01, 0x62, 0x03, 0xC7, 0x01, 0x63, 0x03, 0xC8, 0x01, 0x64, 0x03
	.byte 0xC9, 0x01, 0x65, 0x03, 0xCA, 0x01, 0x66, 0x03, 0xCB, 0x01, 0x67, 0x03, 0xCC, 0x01, 0x68, 0x03
	.byte 0xCD, 0x01, 0x69, 0x03, 0xCE, 0x01, 0x6A, 0x03, 0xCF, 0x01, 0x6B, 0x03, 0xD0, 0x01, 0x6C, 0x03
	.byte 0xD1, 0x01, 0x6D, 0x03, 0xD2, 0x01, 0x6E, 0x03, 0xD3, 0x01, 0x6F, 0x03, 0xD4, 0x01, 0x70, 0x03
	.byte 0xD5, 0x01, 0x71, 0x03, 0xD6, 0x01, 0x72, 0x03, 0xD7, 0x01, 0x73, 0x03, 0xD8, 0x01, 0x74, 0x03
	.byte 0xD9, 0x01, 0x75, 0x03, 0xDA, 0x01, 0x76, 0x03, 0xDB, 0x01, 0x77, 0x03, 0xDC, 0x01, 0x78, 0x03
	.byte 0xE7, 0x01, 0x79, 0x03, 0xE8, 0x01, 0x7A, 0x03, 0xE9, 0x01, 0x7B, 0x03, 0xEA, 0x01, 0x7C, 0x03
	.byte 0xEB, 0x01, 0x7D, 0x03, 0xEC, 0x01, 0x7E, 0x03, 0xED, 0x01, 0x7F, 0x03, 0xEE, 0x01, 0x80, 0x03
	.byte 0xEF, 0x01, 0x81, 0x03, 0xF0, 0x01, 0x82, 0x03, 0xF1, 0x01, 0x83, 0x03, 0xF2, 0x01, 0x84, 0x03
	.byte 0xF3, 0x01, 0x85, 0x03, 0xF4, 0x01, 0x86, 0x03, 0xF5, 0x01, 0x87, 0x03, 0xF6, 0x01, 0x88, 0x03
	.byte 0xF7, 0x01, 0x89, 0x03, 0xF8, 0x01, 0x8A, 0x03, 0xF9, 0x01, 0x8B, 0x03, 0xFA, 0x01, 0x8C, 0x03
	.byte 0x30, 0x54, 0x80, 0x00, 0x00, 0x00, 0x00, 0x02, 0x18, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02
	.byte 0x18, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x18, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00, 0x03
	.byte 0x18, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00, 0x04, 0x14, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00, 0x02
	.byte 0x18, 0x00, 0x01, 0x02, 0xB5, 0x80, 0x26, 0x02, 0x31, 0x82, 0x26, 0x02, 0x35, 0x83, 0x26, 0x02
	.byte 0x02, 0x00, 0x38, 0x00, 0x0E, 0x00, 0x38, 0x00, 0x08, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x00, 0x03
	.byte 0x10, 0x00, 0x02, 0x03, 0x28, 0x00, 0x00, 0x03, 0x02, 0x00, 0x2C, 0x00, 0x0E, 0x00, 0x2C, 0x00
	.byte 0x08, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x04, 0x10, 0x00, 0x02, 0x04, 0x20, 0x00, 0x00, 0x04
	.byte 0x00, 0x00, 0x00, 0x04, 0x10, 0x00, 0x02, 0x04, 0x23, 0x00, 0x00, 0x04, 0x95, 0x7F, 0x26, 0x02
	.byte 0x3D, 0x81, 0x26, 0x02, 0xD5, 0x82, 0x26, 0x02, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0xFF, 0xFF
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0xE0, 0xFE, 0xFF, 0x00, 0xE0, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF, 0xFF
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x80, 0xFF, 0xFF
	.byte 0x00, 0x80, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x89, 0x6A, 0x26, 0x02, 0x89, 0x6A, 0x26, 0x02
	.byte 0x89, 0x6A, 0x26, 0x02, 0x89, 0x6A, 0x26, 0x02, 0x89, 0x6A, 0x26, 0x02, 0x89, 0x6A, 0x26, 0x02
	.byte 0xB1, 0x6A, 0x26, 0x02, 0xB1, 0x6A, 0x26, 0x02, 0xB1, 0x6A, 0x26, 0x02, 0x79, 0x66, 0x26, 0x02
	.byte 0x79, 0x66, 0x26, 0x02, 0x79, 0x66, 0x26, 0x02, 0x49, 0x67, 0x26, 0x02, 0x55, 0x67, 0x26, 0x02
	.byte 0x61, 0x67, 0x26, 0x02, 0x6D, 0x67, 0x26, 0x02, 0x6D, 0x67, 0x26, 0x02, 0x6D, 0x67, 0x26, 0x02
	.byte 0x21, 0x68, 0x26, 0x02, 0x21, 0x68, 0x26, 0x02, 0x21, 0x68, 0x26, 0x02, 0xB1, 0x69, 0x26, 0x02
	.byte 0xB1, 0x69, 0x26, 0x02, 0xB1, 0x69, 0x26, 0x02, 0x79, 0x69, 0x26, 0x02, 0x79, 0x69, 0x26, 0x02
	.byte 0x79, 0x69, 0x26, 0x02, 0x9D, 0x63, 0x26, 0x02, 0xED, 0x63, 0x26, 0x02, 0x3D, 0x64, 0x26, 0x02
	.byte 0x8D, 0x64, 0x26, 0x02, 0xDD, 0x64, 0x26, 0x02, 0x2D, 0x65, 0x26, 0x02, 0x7D, 0x65, 0x26, 0x02
	.byte 0xD1, 0x65, 0x26, 0x02, 0x25, 0x66, 0x26, 0x02, 0x69, 0x5C, 0x26, 0x02, 0x75, 0x5C, 0x26, 0x02
	.byte 0x81, 0x5C, 0x26, 0x02, 0xB1, 0x5C, 0x26, 0x02, 0xB1, 0x5C, 0x26, 0x02, 0xB1, 0x5C, 0x26, 0x02
	.byte 0x8D, 0x5C, 0x26, 0x02, 0x99, 0x5C, 0x26, 0x02, 0xA5, 0x5C, 0x26, 0x02, 0x11, 0x5D, 0x26, 0x02
	.byte 0x55, 0x5E, 0x26, 0x02, 0x89, 0x60, 0x26, 0x02, 0x79, 0x63, 0x26, 0x02, 0x85, 0x63, 0x26, 0x02
	.byte 0x91, 0x63, 0x26, 0x02, 0x55, 0x63, 0x26, 0x02, 0x61, 0x63, 0x26, 0x02, 0x6D, 0x63, 0x26, 0x02
	.byte 0x9C, 0x05, 0x00, 0x00, 0x9D, 0x05, 0x00, 0x00, 0x9E, 0x05, 0x00, 0x00, 0xA2, 0x05, 0x00, 0x00
	.byte 0xA3, 0x05, 0x00, 0x00, 0xA4, 0x05, 0x00, 0x00, 0x9F, 0x05, 0x00, 0x00, 0xA0, 0x05, 0x00, 0x00
	.byte 0xA1, 0x05, 0x00, 0x00, 0xAA, 0x05, 0x00, 0x00, 0xAB, 0x05, 0x00, 0x00, 0xAC, 0x05, 0x00, 0x00
	.byte 0xB0, 0x05, 0x00, 0x00, 0xB1, 0x05, 0x00, 0x00, 0xB2, 0x05, 0x00, 0x00, 0xA5, 0x05, 0x00, 0x00
	.byte 0xA6, 0x05, 0x00, 0x00, 0xA7, 0x05, 0x00, 0x00, 0xB6, 0x05, 0x00, 0x00, 0xB7, 0x05, 0x00, 0x00
	.byte 0xB8, 0x05, 0x00, 0x00, 0xB9, 0x05, 0x00, 0x00, 0xBA, 0x05, 0x00, 0x00, 0xBB, 0x05, 0x00, 0x00
	.byte 0xA9, 0x05, 0x00, 0x00, 0xA9, 0x05, 0x00, 0x00, 0xA9, 0x05, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x11
	.byte 0x00, 0x01, 0x00, 0x11, 0x00, 0x02, 0x00, 0x11, 0x01, 0x03, 0x01, 0x02, 0x01, 0x04, 0x01, 0x02
	.byte 0x01, 0x05, 0x01, 0x02, 0x01, 0x06, 0x03, 0x11, 0x01, 0x07, 0x03, 0x11, 0x01, 0x08, 0x03, 0x11
	.byte 0x05, 0x0B, 0x06, 0x11, 0x03, 0x09, 0x04, 0x11, 0x04, 0x0A, 0x05, 0x11, 0x06, 0x0C, 0x07, 0x11
	.byte 0x07, 0x0D, 0x08, 0x11, 0x08, 0x0E, 0x09, 0x11, 0x09, 0x0F, 0x0A, 0x11, 0x0A, 0x10, 0x0B, 0x11
	.byte 0x0B, 0x11, 0x0C, 0x11, 0x0C, 0x12, 0x0D, 0x11, 0x02, 0x13, 0x11, 0x11, 0x02, 0x14, 0x11, 0x11
	.byte 0x02, 0x15, 0x11, 0x11, 0x02, 0x16, 0x11, 0x11, 0x02, 0x17, 0x11, 0x11, 0x02, 0x18, 0x11, 0x11
	.byte 0x02, 0x19, 0x11, 0x11, 0x02, 0x1A, 0x11, 0x11, 0x02, 0x1B, 0x11, 0x11, 0x02, 0x1C, 0x11, 0x11
	.byte 0x02, 0x1D, 0x11, 0x11, 0x02, 0x1E, 0x11, 0x11, 0x02, 0x1F, 0x11, 0x11, 0x02, 0x20, 0x11, 0x11
	.byte 0x02, 0x21, 0x11, 0x11, 0x02, 0x22, 0x11, 0x11, 0x02, 0x23, 0x11, 0x11, 0x02, 0x24, 0x11, 0x11
	.byte 0x0D, 0x25, 0x0E, 0x11, 0x0E, 0x26, 0x0F, 0x11, 0x13, 0x14, 0x13, 0x14, 0x13, 0x14, 0x13, 0x14
	.byte 0x13, 0x14, 0x13, 0x14, 0x13, 0x14, 0x13, 0x14, 0x13, 0x14, 0x15, 0x13, 0x1C, 0x1D, 0x1B, 0x19
	.byte 0x19, 0x1D, 0x14, 0x13, 0x1D, 0x1B, 0x17, 0x13, 0x13, 0x14, 0x1F, 0x23, 0x20, 0x22, 0x1B, 0x1E
	.byte 0x24, 0x1D, 0x18, 0x21, 0x1E, 0x15, 0x22, 0x1F, 0xCE, 0x39, 0x94, 0x52, 0xFF, 0x7F, 0x08, 0x21
	.byte 0xF7, 0x66, 0x10, 0x42, 0xCE, 0x39, 0x94, 0x52, 0x10, 0x42, 0x4A, 0x41, 0x10, 0x42, 0xCE, 0x39
	.byte 0x94, 0x52, 0x10, 0x42, 0x08, 0x31, 0x10, 0x42, 0xCE, 0x39, 0x94, 0x52, 0x10, 0x42, 0xA5, 0x20
	.byte 0x10, 0x42, 0xAD, 0x39, 0x94, 0x52, 0x10, 0x42, 0x63, 0x1C, 0x10, 0x42, 0x4A, 0x31, 0x94, 0x52
	.byte 0xCE, 0x41, 0x00, 0x18, 0x10, 0x42, 0x08, 0x29, 0x94, 0x52, 0x8C, 0x41, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x00, 0x00, 0x09, 0x0A, 0x00, 0x00, 0x0B, 0x0C, 0x00, 0x00
	.byte 0x01, 0x02, 0x00, 0x00, 0x05, 0x0D, 0x06, 0x07, 0x0E, 0x08, 0x00, 0x00, 0x00, 0x05, 0x01, 0x06
	.byte 0x02, 0x00, 0x03, 0x01, 0x04, 0x02, 0x05, 0x03, 0x06, 0x04, 0x00, 0x00, 0x05, 0x8B, 0x26, 0x02
	.byte 0x05, 0x8B, 0x26, 0x02, 0x09, 0x8B, 0x26, 0x02, 0x0D, 0x8B, 0x26, 0x02, 0x91, 0x8B, 0x26, 0x02
	.byte 0x2D, 0x8C, 0x26, 0x02, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0xAD, 0x8C, 0x26, 0x02
	.byte 0xAD, 0x8C, 0x26, 0x02, 0xBD, 0x8C, 0x26, 0x02, 0xCD, 0x8C, 0x26, 0x02, 0xDD, 0x8C, 0x26, 0x02
	.byte 0xED, 0x8C, 0x26, 0x02, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x0D, 0x05, 0x0B, 0x07, 0x0E, 0x08, 0x0C, 0x01, 0x00, 0x02, 0x0A
	.byte 0x10, 0x09, 0x04, 0x03, 0x0F, 0x00, 0x00, 0x00, 0x3F, 0x3E, 0x3D, 0x00, 0xB5, 0x94, 0x26, 0x02
	.byte 0xB5, 0x94, 0x26, 0x02, 0x75, 0x94, 0x26, 0x02, 0x95, 0x94, 0x26, 0x02, 0xFF, 0x00, 0x06, 0x00
	.byte 0xFE, 0xFF, 0xCB, 0x05, 0xCE, 0x05, 0xC5, 0x05, 0x89, 0x01, 0x82, 0x00, 0xCB, 0x05, 0xCD, 0x05
	.byte 0xCF, 0x05, 0xCB, 0x05, 0x19, 0x00, 0xCE, 0x01, 0xFE, 0xFF, 0xCB, 0x05, 0xFE, 0xFF, 0xD0, 0x05
	.byte 0x01, 0x00, 0xC7, 0x01, 0xD1, 0x05, 0xCC, 0x05, 0xC5, 0x05, 0xCB, 0x05, 0x97, 0x00, 0x97, 0x00
	.byte 0xFE, 0xFF, 0xCB, 0x05, 0xD2, 0x05, 0xCB, 0x05
	@ 0x0226A918
