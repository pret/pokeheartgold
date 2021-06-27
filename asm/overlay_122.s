
	thumb_func_start ov122_021E5900
ov122_021E5900: @ 0x021E5900
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #6
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x18]
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	adds r6, r0, #0
	ldr r0, [r5, #8]
	bl FUN_0202C950
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl ov122_021E6B6C
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl ov122_021E6B6C
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r5, #0
	bl ov122_021E7540
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E5900

	thumb_func_start ov122_021E5974
ov122_021E5974: @ 0x021E5974
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #8
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	adds r3, r4, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #8
	adds r3, #0xc4
	bl ov122_021E767C
	movs r1, #0
	adds r3, r4, #0
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #0xb
	adds r3, #0xd4
	str r1, [sp, #4]
	bl ov122_021E767C
	movs r1, #0
	adds r3, r4, #0
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #0xc
	adds r3, #0xe4
	str r1, [sp, #4]
	bl ov122_021E767C
	movs r1, #0
	adds r0, r4, #0
	adds r4, #0xf4
	str r1, [sp]
	movs r2, #0xd
	adds r3, r4, #0
	str r1, [sp, #4]
	bl ov122_021E767C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E5974

	thumb_func_start ov122_021E59EC
ov122_021E59EC: @ 0x021E59EC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #7
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	movs r3, #4
	bl FUN_02007B68
	movs r2, #9
	adds r3, r2, #0
	movs r1, #0
	adds r3, #0xfb
	str r1, [sp]
	adds r0, r4, #0
	adds r3, r4, r3
	str r1, [sp, #4]
	bl ov122_021E767C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov122_021E59EC

	thumb_func_start ov122_021E5A2C
ov122_021E5A2C: @ 0x021E5A2C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #9
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0
	movs r3, #0x45
	str r0, [sp]
	lsls r3, r3, #2
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #6
	adds r3, r4, r3
	bl ov122_021E767C
	movs r3, #0x49
	movs r1, #0
	lsls r3, r3, #2
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #0xa
	adds r3, r4, r3
	str r1, [sp, #4]
	bl ov122_021E767C
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E5A2C

	thumb_func_start ov122_021E5A9C
ov122_021E5A9C: @ 0x021E5A9C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5AB2
	cmp r0, #1
	beq _021E5ACE
	b _021E5ADC
_021E5AB2:
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7888
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov122_021E7770
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E5ADC
_021E5ACE:
	adds r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5ADC
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E5ADC:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E5A9C

	thumb_func_start ov122_021E5AE0
ov122_021E5AE0: @ 0x021E5AE0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5AFC
	cmp r0, #1
	beq _021E5B1A
	cmp r0, #2
	beq _021E5B44
	b _021E5B52
_021E5AFC:
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r1, [r4]
	movs r3, #0
	str r1, [sp, #8]
	movs r1, #0x14
	adds r2, r1, #0
	bl FUN_0200FA24
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E5B56
_021E5B1A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B56
	adds r0, r4, #0
	blx r6
	movs r0, #4
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r1, [r4]
	movs r3, #0
	str r1, [sp, #8]
	movs r1, #0x15
	adds r2, r1, #0
	bl FUN_0200FA24
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E5B56
_021E5B44:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5B56
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_021E5B52:
	bl GF_AssertFail
_021E5B56:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov122_021E5AE0

	thumb_func_start ov122_021E5B5C
ov122_021E5B5C: @ 0x021E5B5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5B70
	cmp r0, #1
	beq _021E5B8C
	b _021E5B9E
_021E5B70:
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5B7E
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5B7E:
	adds r0, r4, #0
	bl ov122_021E71A8
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E5BA2
_021E5B8C:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021E5BA2
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5B9E:
	bl GF_AssertFail
_021E5BA2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E5B5C

	thumb_func_start ov122_021E5BA8
ov122_021E5BA8: @ 0x021E5BA8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0202C950
	ldr r1, _021E5BDC @ =0x0000C350
	cmp r0, r1
	blo _021E5BCE
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #1
	bl ov122_021E7770
	ldr r1, _021E5BE0 @ =0x0000FFFE
	adds r0, r5, #0
	bl ov122_021E8488
	b _021E5BD6
_021E5BCE:
	adds r0, r5, #0
	movs r1, #1
	bl ov122_021E8488
_021E5BD6:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5BDC: .4byte 0x0000C350
_021E5BE0: .4byte 0x0000FFFE
	thumb_func_end ov122_021E5BA8

	thumb_func_start ov122_021E5BE4
ov122_021E5BE4: @ 0x021E5BE4
	push {r3, lr}
	adds r0, r1, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5BF4
	movs r0, #1
	pop {r3, pc}
_021E5BF4:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E5BE4

	thumb_func_start ov122_021E5BF8
ov122_021E5BF8: @ 0x021E5BF8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x91
	adds r5, r1, #0
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8504
	adds r0, r4, #0
	movs r1, #2
	bl ov122_021E8488
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _021E5C22
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E5C22:
	adds r0, #0x14
	ldr r0, [r5, r0]
	bl ov122_021E87A0
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov122_021E7854
	movs r1, #0
	str r1, [sp]
	adds r3, r5, #0
	ldr r0, _021E5CA0 @ =0x000F0100
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, #0x64
	bl ov122_021E769C
	ldr r0, [r5, #0x18]
	movs r1, #5
	bl FUN_0201BF7C
	movs r1, #0
	movs r0, #0x40
	adds r2, r1, #0
	bl FUN_02004EC4
	cmp r4, #0
	beq _021E5C98
	ble _021E5C7E
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov122_021E7888
	adds r0, r5, #0
	movs r1, #0x29
	movs r2, #1
	bl ov122_021E7770
	ldr r0, _021E5CA4 @ =0x00000938
	bl FUN_0200604C
	b _021E5C98
_021E5C7E:
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov122_021E7888
	adds r0, r5, #0
	movs r1, #0x2b
	movs r2, #1
	bl ov122_021E7770
	ldr r0, _021E5CA8 @ =0x0000093A
	bl FUN_0200604C
_021E5C98:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E5CA0: .4byte 0x000F0100
_021E5CA4: .4byte 0x00000938
_021E5CA8: .4byte 0x0000093A
	thumb_func_end ov122_021E5BF8

	thumb_func_start ov122_021E5CAC
ov122_021E5CAC: @ 0x021E5CAC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	movs r1, #0x23
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _021E5CC4
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5CC4:
	cmp r0, #0
	beq _021E5CCE
	cmp r0, #1
	beq _021E5D0C
	b _021E5D1A
_021E5CCE:
	adds r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5D1E
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E87A0
	cmp r0, #0
	ble _021E5D08
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E5CF4
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5CF4:
	movs r2, #1
	str r2, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x2a
	bl ov122_021E7770
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E5D1E
_021E5D08:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5D0C:
	adds r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5D1E
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5D1A:
	bl GF_AssertFail
_021E5D1E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E5CAC

	thumb_func_start ov122_021E5D24
ov122_021E5D24: @ 0x021E5D24
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5D38
	cmp r0, #1
	beq _021E5D46
	b _021E5D68
_021E5D38:
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201CAE0
	adds r0, r5, #0
	bl ov122_021E84C8
_021E5D46:
	ldr r0, _021E5D70 @ =0x00000938
	bl FUN_02006184
	cmp r0, #0
	beq _021E5D5A
	ldr r0, _021E5D74 @ =0x00000939
	bl FUN_02006184
	cmp r0, #0
	bne _021E5D6C
_021E5D5A:
	movs r1, #0
	movs r0, #0x46
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5D68:
	bl GF_AssertFail
_021E5D6C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5D70: .4byte 0x00000938
_021E5D74: .4byte 0x00000939
	thumb_func_end ov122_021E5D24

	thumb_func_start ov122_021E5D78
ov122_021E5D78: @ 0x021E5D78
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	bne _021E5D90
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7888
_021E5D90:
	adds r0, r4, #0
	movs r1, #0
	bl ov122_021E7854
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5DA6
	movs r2, #0x10
	b _021E5DA8
_021E5DA6:
	movs r2, #0xf
_021E5DA8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov122_021E5A9C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E5D78

	thumb_func_start ov122_021E5DB4
ov122_021E5DB4: @ 0x021E5DB4
	push {r3, lr}
	adds r0, r1, #0
	movs r1, #0
	bl ov122_021E7488
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov122_021E5DB4

	thumb_func_start ov122_021E5DC4
ov122_021E5DC4: @ 0x021E5DC4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov122_021E7514
	adds r0, r0, #2
	cmp r0, #4
	bhi _021E5E1A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5DE2: @ jump table
	.2byte _021E5E0E - _021E5DE2 - 2 @ case 0
	.2byte _021E5E1E - _021E5DE2 - 2 @ case 1
	.2byte _021E5DEC - _021E5DE2 - 2 @ case 2
	.2byte _021E5E02 - _021E5DE2 - 2 @ case 3
	.2byte _021E5E0E - _021E5DE2 - 2 @ case 4
_021E5DEC:
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov122_021E78B4
	adds r0, r4, #0
	movs r1, #7
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5E02:
	adds r0, r4, #0
	movs r1, #3
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5E0E:
	ldr r1, _021E5E24 @ =0x0000FFFE
	adds r0, r4, #0
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5E1A:
	bl GF_AssertFail
_021E5E1E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E5E24: .4byte 0x0000FFFE
	thumb_func_end ov122_021E5DC4

	thumb_func_start ov122_021E5E28
ov122_021E5E28: @ 0x021E5E28
	ldr r3, _021E5E30 @ =ov122_021E5A9C
	movs r2, #0x14
	bx r3
	nop
_021E5E30: .4byte ov122_021E5A9C
	thumb_func_end ov122_021E5E28

	thumb_func_start ov122_021E5E34
ov122_021E5E34: @ 0x021E5E34
	push {r3, lr}
	adds r0, r1, #0
	movs r1, #1
	bl ov122_021E7488
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov122_021E5E34

	thumb_func_start ov122_021E5E44
ov122_021E5E44: @ 0x021E5E44
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov122_021E7514
	adds r0, r0, #2
	cmp r0, #5
	bhi _021E5E9C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5E60: @ jump table
	.2byte _021E5E90 - _021E5E60 - 2 @ case 0
	.2byte _021E5EA0 - _021E5E60 - 2 @ case 1
	.2byte _021E5E6C - _021E5E60 - 2 @ case 2
	.2byte _021E5E78 - _021E5E60 - 2 @ case 3
	.2byte _021E5E84 - _021E5E60 - 2 @ case 4
	.2byte _021E5E90 - _021E5E60 - 2 @ case 5
_021E5E6C:
	adds r0, r4, #0
	movs r1, #4
	bl ov122_021E8488
	movs r0, #1
	pop {r4, pc}
_021E5E78:
	adds r0, r4, #0
	movs r1, #5
	bl ov122_021E8488
	movs r0, #1
	pop {r4, pc}
_021E5E84:
	adds r0, r4, #0
	movs r1, #6
	bl ov122_021E8488
	movs r0, #1
	pop {r4, pc}
_021E5E90:
	adds r0, r4, #0
	movs r1, #2
	bl ov122_021E8488
	movs r0, #1
	pop {r4, pc}
_021E5E9C:
	bl GF_AssertFail
_021E5EA0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E5E44

	thumb_func_start ov122_021E5EA4
ov122_021E5EA4: @ 0x021E5EA4
	ldr r3, _021E5EAC @ =ov122_021E5AE0
	ldr r2, _021E5EB0 @ =ov122_021E5974
	bx r3
	nop
_021E5EAC: .4byte ov122_021E5AE0
_021E5EB0: .4byte ov122_021E5974
	thumb_func_end ov122_021E5EA4

	thumb_func_start ov122_021E5EB4
ov122_021E5EB4: @ 0x021E5EB4
	ldr r3, _021E5EBC @ =ov122_021E5A9C
	movs r2, #0x19
	bx r3
	nop
_021E5EBC: .4byte ov122_021E5A9C
	thumb_func_end ov122_021E5EB4

	thumb_func_start ov122_021E5EC0
ov122_021E5EC0: @ 0x021E5EC0
	ldr r3, _021E5EC8 @ =ov122_021E5AE0
	ldr r2, _021E5ECC @ =ov122_021E59EC
	bx r3
	nop
_021E5EC8: .4byte ov122_021E5AE0
_021E5ECC: .4byte ov122_021E59EC
	thumb_func_end ov122_021E5EC0

	thumb_func_start ov122_021E5ED0
ov122_021E5ED0: @ 0x021E5ED0
	ldr r3, _021E5ED8 @ =ov122_021E5A9C
	movs r2, #0x1a
	bx r3
	nop
_021E5ED8: .4byte ov122_021E5A9C
	thumb_func_end ov122_021E5ED0

	thumb_func_start ov122_021E5EDC
ov122_021E5EDC: @ 0x021E5EDC
	ldr r3, _021E5EE4 @ =ov122_021E5AE0
	ldr r2, _021E5EE8 @ =ov122_021E5A2C
	bx r3
	nop
_021E5EE4: .4byte ov122_021E5AE0
_021E5EE8: .4byte ov122_021E5A2C
	thumb_func_end ov122_021E5EDC

	thumb_func_start ov122_021E5EEC
ov122_021E5EEC: @ 0x021E5EEC
	ldr r3, _021E5EF4 @ =ov122_021E5A9C
	movs r2, #0x1b
	bx r3
	nop
_021E5EF4: .4byte ov122_021E5A9C
	thumb_func_end ov122_021E5EEC

	thumb_func_start ov122_021E5EF8
ov122_021E5EF8: @ 0x021E5EF8
	push {r4, lr}
	ldr r2, _021E5F18 @ =ov122_021E5900
	adds r4, r0, #0
	bl ov122_021E5AE0
	cmp r0, #0
	beq _021E5F12
	adds r0, r4, #0
	movs r1, #3
	bl ov122_021E8488
	movs r0, #1
	pop {r4, pc}
_021E5F12:
	movs r0, #0
	pop {r4, pc}
	nop
_021E5F18: .4byte ov122_021E5900
	thumb_func_end ov122_021E5EF8

	thumb_func_start ov122_021E5F1C
ov122_021E5F1C: @ 0x021E5F1C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201CAE0
	adds r0, r4, #0
	bl ov122_021E7094
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov122_021E8D8C
	adds r0, r5, #0
	movs r1, #8
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E5F1C

	thumb_func_start ov122_021E5F48
ov122_021E5F48: @ 0x021E5F48
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #9
	adds r4, r1, #0
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D74
	cmp r0, #4
	bhi _021E5FF4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5F68: @ jump table
	.2byte _021E5FF8 - _021E5F68 - 2 @ case 0
	.2byte _021E5F72 - _021E5F68 - 2 @ case 1
	.2byte _021E5FD6 - _021E5F68 - 2 @ case 2
	.2byte _021E5FD6 - _021E5F68 - 2 @ case 3
	.2byte _021E5FA0 - _021E5F68 - 2 @ case 4
_021E5F72:
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	adds r1, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8630
	cmp r0, #0
	beq _021E5F94
	ldr r0, _021E5FFC @ =0x000005F3
	bl FUN_0200604C
	b _021E5FF8
_021E5F94:
	adds r0, r5, #0
	movs r1, #9
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5FA0:
	ldr r0, _021E6000 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #6
	bl FUN_0200DC4C
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E70
	cmp r0, #0
	beq _021E5FCA
	adds r0, r5, #0
	movs r1, #0xd
	bl ov122_021E8488
	b _021E5FD2
_021E5FCA:
	adds r0, r5, #0
	movs r1, #0xe
	bl ov122_021E8488
_021E5FD2:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5FD6:
	ldr r0, _021E6004 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_0200DC4C
	adds r0, r5, #0
	movs r1, #0xf
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E5FF4:
	bl GF_AssertFail
_021E5FF8:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5FFC: .4byte 0x000005F3
_021E6000: .4byte 0x000005DC
_021E6004: .4byte 0x000005DD
	thumb_func_end ov122_021E5F48

	thumb_func_start ov122_021E6008
ov122_021E6008: @ 0x021E6008
	push {r3, lr}
	adds r0, r1, #0
	bl ov122_021E7F70
	cmp r0, #0
	beq _021E6018
	movs r0, #1
	pop {r3, pc}
_021E6018:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E6008

	thumb_func_start ov122_021E601C
ov122_021E601C: @ 0x021E601C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	adds r5, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E6032
	cmp r0, #1
	beq _021E6116
	b _021E612E
_021E6032:
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8DF0
	movs r1, #5
	adds r4, r0, #0
	blx FUN_020F2998
	lsls r0, r1, #0x10
	asrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8784
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8778
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r6, #0x18
	ldr r0, [r5, r0]
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov122_021E86E0
	adds r7, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov122_021E86E0
	str r0, [sp, #4]
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r6, #0x18
	ldr r0, [r5, r0]
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov122_021E86A8
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov122_021E86A8
	cmp r7, #0
	beq _021E610E
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021E610E
	bl FUN_0201FDB8
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r6, #0x18
	ldr r0, [r5, r0]
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov122_021E871C
	adds r6, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov122_021E871C
	adds r4, r0, #0
	movs r0, #0x64
	movs r1, #5
	muls r0, r7, r0
	subs r1, r1, r6
	blx FUN_020F2998
	cmp r0, #0x4b
	bge _021E6100
	ldr r1, [sp, #4]
	movs r0, #0x64
	muls r0, r1, r0
	movs r1, #5
	subs r1, r1, r4
	blx FUN_020F2998
	cmp r0, #0x4b
	blt _021E610E
_021E6100:
	adds r0, r5, #0
	movs r1, #0x1d
	bl ov122_021E76F4
	ldr r0, _021E6134 @ =0x000004B4
	bl FUN_02006B24
_021E610E:
	ldr r0, [sp]
	bl ov122_021E84C8
	b _021E612E
_021E6116:
	ldr r0, _021E6138 @ =0x00000927
	bl FUN_02006184
	cmp r0, #0
	bne _021E612E
	bl FUN_02006BCC
	cmp r0, #0
	bne _021E612E
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E612E:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6134: .4byte 0x000004B4
_021E6138: .4byte 0x00000927
	thumb_func_end ov122_021E601C

	thumb_func_start ov122_021E613C
ov122_021E613C: @ 0x021E613C
	push {r4, lr}
	movs r0, #9
	adds r4, r1, #0
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	adds r1, r0, #0
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r2, #0
	adds r3, r4, #0
	bl ov122_021E70B8
	ldr r0, _021E6164 @ =0x0000092C
	bl FUN_0200604C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021E6164: .4byte 0x0000092C
	thumb_func_end ov122_021E613C

	thumb_func_start ov122_021E6168
ov122_021E6168: @ 0x021E6168
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #4
	bls _021E617A
	b _021E6342
_021E617A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E6186: @ jump table
	.2byte _021E6190 - _021E6186 - 2 @ case 0
	.2byte _021E61A8 - _021E6186 - 2 @ case 1
	.2byte _021E62C8 - _021E6186 - 2 @ case 2
	.2byte _021E62D8 - _021E6186 - 2 @ case 3
	.2byte _021E6314 - _021E6186 - 2 @ case 4
_021E6190:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7168
	cmp r0, #0
	bne _021E61A0
	b _021E6346
_021E61A0:
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E61A8:
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	adds r6, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r6, #0
	bl ov122_021E8668
	adds r7, r0, #0
	adds r0, r6, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r1, #2
	adds r0, r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r0, #0xc
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r0, #2
	adds r0, r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r0, #0xc
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r6, #0
	bl ov122_021E85F4
	cmp r7, #4
	bne _021E6230
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	bl FUN_0200DDB8
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DC4C
	ldr r0, _021E634C @ =0x00000929
	bl FUN_0200604C
	b _021E62C0
_021E6230:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	adds r6, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r7, #0
	bl ov122_021E8594
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	movs r1, #0
	str r0, [sp, #0x10]
	movs r0, #0x61
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r7, #0
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r0, #0x61
	str r1, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	movs r3, #5
	bl FUN_0200BFCC
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	bl FUN_0200DDB8
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DC4C
	cmp r6, #0
	bne _021E62A6
	adds r0, r4, #0
	movs r1, #0x1e
	bl ov122_021E76F4
	b _021E62C0
_021E62A6:
	adds r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #1
	ble _021E62BA
	adds r0, r4, #0
	movs r1, #0x1f
	bl ov122_021E76F4
	b _021E62C0
_021E62BA:
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E62C0:
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E62C8:
	bl FUN_02006198
	cmp r0, #0
	bne _021E6346
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E62D8:
	adds r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #4
	bne _021E6302
	ldr r0, _021E6350 @ =0x000004B5
	bl FUN_02006B24
	adds r0, r4, #0
	movs r1, #0x20
	bl ov122_021E76F4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov122_021E6B6C
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E6302:
	adds r0, r4, #0
	bl ov122_021E69EC
	cmp r0, #0
	beq _021E6346
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E6314:
	adds r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #4
	bne _021E632C
	bl FUN_02006BCC
	cmp r0, #0
	bne _021E6346
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E632C:
	bl FUN_02025358
	cmp r0, #0
	bne _021E633C
	ldr r0, _021E6354 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _021E6346
_021E633C:
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E6342:
	bl GF_AssertFail
_021E6346:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E634C: .4byte 0x00000929
_021E6350: .4byte 0x000004B5
_021E6354: .4byte 0x021D110C
	thumb_func_end ov122_021E6168

	thumb_func_start ov122_021E6358
ov122_021E6358: @ 0x021E6358
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #4
	bne _021E637E
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	bl ov122_021E858C
	adds r0, r5, #0
	movs r1, #0xc
	bl ov122_021E8488
	b _021E639E
_021E637E:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E863C
	cmp r0, #0
	beq _021E6396
	adds r0, r5, #0
	movs r1, #0xa
	bl ov122_021E8488
	b _021E639E
_021E6396:
	adds r0, r5, #0
	movs r1, #8
	bl ov122_021E8488
_021E639E:
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E6358

	thumb_func_start ov122_021E63AC
ov122_021E63AC: @ 0x021E63AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E63C0
	cmp r0, #1
	beq _021E63E0
	b _021E640A
_021E63C0:
	adds r0, r4, #0
	movs r1, #0x21
	movs r2, #1
	bl ov122_021E7770
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7888
	ldr r0, _021E6414 @ =0x000004B3
	bl FUN_02006B24
	adds r0, r5, #0
	bl ov122_021E84C8
_021E63E0:
	bl FUN_02006BCC
	cmp r0, #0
	bne _021E640E
	adds r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E640E
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl ov122_021E858C
	adds r0, r5, #0
	movs r1, #0xb
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E640A:
	bl GF_AssertFail
_021E640E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6414: .4byte 0x000004B3
	thumb_func_end ov122_021E63AC

	thumb_func_start ov122_021E6418
ov122_021E6418: @ 0x021E6418
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E6432
	cmp r0, #1
	beq _021E648A
	cmp r0, #2
	beq _021E649C
	b _021E64D8
_021E6432:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #5
	bl FUN_0200BFCC
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, #0x10]
	movs r1, #1
	bl FUN_0200BE48
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #1
	bl ov122_021E7770
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7888
	movs r1, #0
	movs r0, #0x40
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r0, _021E64E4 @ =0x0000092A
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov122_021E84C8
_021E648A:
	adds r0, r4, #0
	bl ov122_021E6A64
	cmp r0, #0
	beq _021E64DC
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E64DC
_021E649C:
	bl FUN_02006198
	cmp r0, #0
	bne _021E64DC
	adds r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E64DC
	movs r1, #0
	movs r0, #0x46
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E78B4
	adds r0, r5, #0
	movs r1, #0xc
	bl ov122_021E8488
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E64D8:
	bl GF_AssertFail
_021E64DC:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021E64E4: .4byte 0x0000092A
	thumb_func_end ov122_021E6418

	thumb_func_start ov122_021E64E8
ov122_021E64E8: @ 0x021E64E8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #3
	bhi _021E6584
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E6502: @ jump table
	.2byte _021E650A - _021E6502 - 2 @ case 0
	.2byte _021E6528 - _021E6502 - 2 @ case 1
	.2byte _021E653E - _021E6502 - 2 @ case 2
	.2byte _021E6566 - _021E6502 - 2 @ case 3
_021E650A:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	movs r2, #1
	adds r3, r4, #0
	bl ov122_021E70B8
	ldr r0, _021E658C @ =0x0000092C
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6588
_021E6528:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7168
	cmp r0, #0
	beq _021E6588
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6588
_021E653E:
	bl FUN_02025358
	cmp r0, #0
	bne _021E654E
	ldr r0, _021E6590 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _021E6588
_021E654E:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	movs r2, #2
	adds r3, r4, #0
	bl ov122_021E70B8
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6588
_021E6566:
	movs r0, #0x92
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7168
	cmp r0, #0
	beq _021E6588
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov122_021E8488
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6584:
	bl GF_AssertFail
_021E6588:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E658C: .4byte 0x0000092C
_021E6590: .4byte 0x021D110C
	thumb_func_end ov122_021E64E8

	thumb_func_start ov122_021E6594
ov122_021E6594: @ 0x021E6594
	push {r4, r5, r6, lr}
	movs r0, #0x91
	adds r5, r1, #0
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8528
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl ov122_021E8D8C
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8E40
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	adds r6, r0, #0
	ldr r0, [r5, #8]
	bl FUN_0202C950
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl ov122_021E6B6C
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl ov122_021E6B6C
	adds r0, r5, #0
	bl ov122_021E7094
	movs r1, #0x23
	movs r0, #1
	lsls r1, r1, #4
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov122_021E6594

	thumb_func_start ov122_021E65F4
ov122_021E65F4: @ 0x021E65F4
	ldr r3, _021E65F8 @ =ov122_021E5B5C
	bx r3
	.align 2, 0
_021E65F8: .4byte ov122_021E5B5C
	thumb_func_end ov122_021E65F4

	thumb_func_start ov122_021E65FC
ov122_021E65FC: @ 0x021E65FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #9
	adds r4, r1, #0
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D74
	adds r5, r0, #0
	cmp r5, #8
	bhi _021E66BA
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E661E: @ jump table
	.2byte _021E66B2 - _021E661E - 2 @ case 0
	.2byte _021E6630 - _021E661E - 2 @ case 1
	.2byte _021E6674 - _021E661E - 2 @ case 2
	.2byte _021E6650 - _021E661E - 2 @ case 3
	.2byte _021E6650 - _021E661E - 2 @ case 4
	.2byte _021E6698 - _021E661E - 2 @ case 5
	.2byte _021E6698 - _021E661E - 2 @ case 6
	.2byte _021E6698 - _021E661E - 2 @ case 7
	.2byte _021E6698 - _021E661E - 2 @ case 8
_021E6630:
	ldr r0, _021E66C4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E70
	cmp r0, #0
	bne _021E66BE
	adds r0, r6, #0
	movs r1, #0xe
	bl ov122_021E8488
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E6650:
	ldr r0, _021E66C4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x8e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0xe4
	ldr r0, [r4, r0]
	movs r1, #6
	bl FUN_0200DC4C
	adds r0, r6, #0
	movs r1, #8
	bl ov122_021E8488
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E6674:
	ldr r0, _021E66C8 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x8e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0xe0
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_0200DC4C
	adds r0, r6, #0
	movs r1, #0xf
	bl ov122_021E8488
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E6698:
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	subs r2, r5, #5
	lsls r2, r2, #0x18
	adds r1, r0, #0
	adds r0, r4, #0
	lsrs r2, r2, #0x18
	bl ov122_021E7340
	b _021E66BE
_021E66B2:
	adds r0, r4, #0
	bl ov122_021E72D0
	b _021E66BE
_021E66BA:
	bl GF_AssertFail
_021E66BE:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E66C4: .4byte 0x000005DC
_021E66C8: .4byte 0x000005DD
	thumb_func_end ov122_021E65FC

	thumb_func_start ov122_021E66CC
ov122_021E66CC: @ 0x021E66CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	bne _021E66F0
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E78DC
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov122_021E8DC8
_021E66F0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov122_021E5B5C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E66CC

	thumb_func_start ov122_021E66FC
ov122_021E66FC: @ 0x021E66FC
	movs r0, #1
	bx lr
	thumb_func_end ov122_021E66FC

	thumb_func_start ov122_021E6700
ov122_021E6700: @ 0x021E6700
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #9
	adds r4, r1, #0
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D74
	cmp r0, #4
	bhi _021E67C8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E6720: @ jump table
	.2byte _021E67C0 - _021E6720 - 2 @ case 0
	.2byte _021E672A - _021E6720 - 2 @ case 1
	.2byte _021E679C - _021E6720 - 2 @ case 2
	.2byte _021E677E - _021E6720 - 2 @ case 3
	.2byte _021E675A - _021E6720 - 2 @ case 4
_021E672A:
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	adds r6, r0, #0
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E0C
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov122_021E7340
	cmp r0, #0
	beq _021E67CC
	adds r0, r5, #0
	movs r1, #0xd
	bl ov122_021E8488
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E675A:
	ldr r0, _021E67D0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x8e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0xe4
	ldr r0, [r4, r0]
	movs r1, #6
	bl FUN_0200DC4C
	adds r0, r5, #0
	movs r1, #8
	bl ov122_021E8488
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E677E:
	ldr r0, _021E67D4 @ =0x000005E5
	bl FUN_0200604C
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x11
	bl FUN_0200DC4C
	adds r0, r5, #0
	movs r1, #0xd
	bl ov122_021E8488
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E679C:
	ldr r0, _021E67D8 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x8e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0xe0
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_0200DC4C
	adds r0, r5, #0
	movs r1, #0xf
	bl ov122_021E8488
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E67C0:
	adds r0, r4, #0
	bl ov122_021E72D0
	b _021E67CC
_021E67C8:
	bl GF_AssertFail
_021E67CC:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E67D0: .4byte 0x000005DC
_021E67D4: .4byte 0x000005E5
_021E67D8: .4byte 0x000005DD
	thumb_func_end ov122_021E6700

	thumb_func_start ov122_021E67DC
ov122_021E67DC: @ 0x021E67DC
	movs r0, #1
	bx lr
	thumb_func_end ov122_021E67DC

	thumb_func_start ov122_021E67E0
ov122_021E67E0: @ 0x021E67E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #3
	bhi _021E6884
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E67FA: @ jump table
	.2byte _021E6802 - _021E67FA - 2 @ case 0
	.2byte _021E680E - _021E67FA - 2 @ case 1
	.2byte _021E684A - _021E67FA - 2 @ case 2
	.2byte _021E6866 - _021E67FA - 2 @ case 3
_021E6802:
	adds r0, r4, #0
	bl ov122_021E72D0
	adds r0, r5, #0
	bl ov122_021E84C8
_021E680E:
	adds r0, r4, #0
	bl ov122_021E7F70
	cmp r0, #0
	beq _021E6888
	adds r0, r5, #0
	bl ov122_021E84B0
	cmp r0, #0xe
	bne _021E6842
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E58
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov122_021E8DC8
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E7904
_021E6842:
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6888
_021E684A:
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E6862
	adds r0, r4, #0
	bl ov122_021E7214
	adds r0, r5, #0
	bl ov122_021E84C8
	b _021E6888
_021E6862:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6866:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021E6888
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6884:
	bl GF_AssertFail
_021E6888:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E67E0

	thumb_func_start ov122_021E688C
ov122_021E688C: @ 0x021E688C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E68A2
	cmp r0, #1
	beq _021E68E6
	b _021E68F6
_021E68A2:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	adds r2, r0, #0
	bne _021E68B4
	movs r4, #0x25
	b _021E68CA
_021E68B4:
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #5
	movs r4, #0x22
	bl FUN_0200BFCC
_021E68CA:
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov122_021E7888
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov122_021E7770
	adds r0, r6, #0
	bl ov122_021E84C8
	b _021E68FA
_021E68E6:
	adds r0, r5, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E68FA
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E68F6:
	bl GF_AssertFail
_021E68FA:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E688C

	thumb_func_start ov122_021E6900
ov122_021E6900: @ 0x021E6900
	push {r3, r4, lr}
	sub sp, #0x14
	add r2, sp, #0
	movs r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [r1, #0x18]
	add r3, sp, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x1f
	str r0, [sp, #8]
	movs r0, #9
	str r0, [sp, #0xc]
	movs r0, #0x19
	strb r0, [r3, #0x10]
	movs r0, #0xa
	strb r0, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	movs r0, #0xf0
	bics r4, r0
	movs r0, #0x4f
	strb r4, [r3, #0x12]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r2, #0
	bl FUN_020166FC
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E6900

	thumb_func_start ov122_021E6948
ov122_021E6948: @ 0x021E6948
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x4f
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E6962
	cmp r0, #2
	beq _021E69A6
	b _021E69D8
_021E6962:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	adds r6, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov122_021E858C
	cmp r6, #0
	bne _021E699A
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E78B4
	adds r0, r5, #0
	movs r1, #0xc
	bl ov122_021E8488
	b _021E69A2
_021E699A:
	adds r0, r5, #0
	movs r1, #0xb
	bl ov122_021E8488
_021E69A2:
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E69A6:
	ldr r0, [r4, #0x18]
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #0x97
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov122_021E78B4
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E69CC
	adds r0, r5, #0
	movs r1, #0xd
	bl ov122_021E8488
	b _021E69D4
_021E69CC:
	adds r0, r5, #0
	movs r1, #8
	bl ov122_021E8488
_021E69D4:
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E69D8:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E6948

	thumb_func_start ov122_021E69DC
ov122_021E69DC: @ 0x021E69DC
	push {r3, lr}
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_020169CC
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov122_021E69DC

	thumb_func_start ov122_021E69EC
ov122_021E69EC: @ 0x021E69EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	adds r4, r0, #0
	bl FUN_02025358
	cmp r0, #0
	bne _021E6A0C
	ldr r0, _021E6A5C @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _021E6A18
_021E6A0C:
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl ov122_021E6B6C
	b _021E6A56
_021E6A18:
	movs r0, #0x8b
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r4, r0
	bls _021E6A4C
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	bne _021E6A36
	ldr r0, _021E6A60 @ =0x0000091E
	bl FUN_0200604C
_021E6A36:
	movs r2, #0x8b
	lsls r2, r2, #2
	ldrh r0, [r5, r2]
	movs r1, #1
	adds r0, r0, #1
	strh r0, [r5, r2]
	ldrh r2, [r5, r2]
	adds r0, r5, #0
	bl ov122_021E6B6C
	b _021E6A56
_021E6A4C:
	ldr r0, _021E6A60 @ =0x0000091E
	bl FUN_0200604C
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6A56:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6A5C: .4byte 0x021D110C
_021E6A60: .4byte 0x0000091E
	thumb_func_end ov122_021E69EC

	thumb_func_start ov122_021E6A64
ov122_021E6A64: @ 0x021E6A64
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_0202C950
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	adds r4, r0, #0
	bl FUN_02025358
	cmp r0, #0
	bne _021E6A94
	ldr r0, _021E6B28 @ =0x021D110C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _021E6A94
	ldr r0, _021E6B2C @ =0x0000C350
	cmp r6, r0
	blo _021E6ACE
_021E6A94:
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl ov122_021E8610
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_0202C954
	ldr r0, _021E6B2C @ =0x0000C350
	adds r7, r6, r4
	cmp r7, r0
	ble _021E6AB4
	adds r7, r0, #0
_021E6AB4:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov122_021E6B6C
	lsls r2, r7, #0x10
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r2, #0x10
	bl ov122_021E6B6C
	movs r0, #0
	b _021E6ADA
_021E6ACE:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl ov122_021E8610
_021E6ADA:
	cmp r0, #0
	beq _021E6B18
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_0202C954
	subs r2, r4, #1
	lsls r2, r2, #0x10
	adds r0, r5, #0
	movs r1, #1
	lsrs r2, r2, #0x10
	bl ov122_021E6B6C
	adds r2, r6, #1
	lsls r2, r2, #0x10
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r2, #0x10
	bl ov122_021E6B6C
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	bne _021E6B22
	ldr r0, _021E6B30 @ =0x0000092A
	bl FUN_0200604C
	b _021E6B22
_021E6B18:
	ldr r0, _021E6B34 @ =0x0000092B
	bl FUN_0200604C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6B22:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6B28: .4byte 0x021D110C
_021E6B2C: .4byte 0x0000C350
_021E6B30: .4byte 0x0000092A
_021E6B34: .4byte 0x0000092B
	thumb_func_end ov122_021E6A64

	thumb_func_start ov122_021E6B38
ov122_021E6B38: @ 0x021E6B38
	push {r4, r5, r6, r7}
	movs r1, #0
	movs r6, #0x62
	adds r3, r1, #0
	lsls r6, r6, #2
_021E6B42:
	ldr r4, _021E6B68 @ =0x021E92A0
	movs r2, #0
	adds r5, r0, #0
_021E6B48:
	ldrh r7, [r4]
	adds r2, r2, #1
	adds r4, r4, #2
	adds r7, r7, r3
	strh r7, [r5, r6]
	adds r5, r5, #2
	cmp r2, #8
	blt _021E6B48
	adds r1, r1, #1
	adds r3, r3, #2
	adds r0, #0x10
	cmp r1, #0xa
	blt _021E6B42
	pop {r4, r5, r6, r7}
	bx lr
	nop
_021E6B68: .4byte 0x021E92A0
	thumb_func_end ov122_021E6B38

	thumb_func_start ov122_021E6B6C
ov122_021E6B6C: @ 0x021E6B6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp, #0xc]
	adds r7, r0, #0
	ldr r1, _021E6C28 @ =0x00002710
	adds r0, r2, #0
	str r2, [sp, #0x10]
	blx FUN_020F2998
	add r1, sp, #0x18
	strb r0, [r1]
	movs r1, #0xfa
	ldr r0, [sp, #0x10]
	lsls r1, r1, #2
	blx FUN_020F2998
	movs r1, #0xa
	blx FUN_020F2998
	add r0, sp, #0x18
	strb r1, [r0, #1]
	ldr r0, [sp, #0x10]
	movs r1, #0x64
	blx FUN_020F2998
	movs r1, #0xa
	blx FUN_020F2998
	add r0, sp, #0x18
	strb r1, [r0, #2]
	ldr r0, [sp, #0x10]
	movs r1, #0xa
	blx FUN_020F2998
	movs r1, #0xa
	blx FUN_020F2998
	add r0, sp, #0x18
	strb r1, [r0, #3]
	ldr r0, [sp, #0x10]
	movs r1, #0xa
	blx FUN_020F2998
	add r0, sp, #0x18
	strb r1, [r0, #4]
	movs r0, #0x62
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r6, #0
	movs r4, #0x15
	add r5, sp, #0x18
	str r0, [sp, #0x14]
_021E6BD4:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _021E6BDE
	movs r0, #0x13
	b _021E6BE0
_021E6BDE:
	movs r0, #0xe
_021E6BE0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldrb r2, [r5]
	ldr r0, [r7, #0x18]
	movs r1, #4
	lsls r3, r2, #4
	ldr r2, [sp, #0x14]
	adds r2, r2, r3
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	adds r6, r6, #1
	adds r4, r4, #2
	adds r5, r5, #1
	cmp r6, #5
	blt _021E6BD4
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _021E6C1A
	movs r1, #0x8b
	ldr r0, [sp, #0x10]
	lsls r1, r1, #2
	strh r0, [r7, r1]
_021E6C1A:
	ldr r0, [r7, #0x18]
	movs r1, #4
	bl FUN_0201BF7C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6C28: .4byte 0x00002710
	thumb_func_end ov122_021E6B6C

	thumb_func_start ov122_021E6C2C
ov122_021E6C2C: @ 0x021E6C2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x10]
	adds r0, r2, #0
	str r2, [sp, #0x14]
	bl ov122_021E7FC4
	adds r4, r0, #0
	movs r1, #0xc
	muls r4, r1, r4
	ldr r0, [sp, #0x10]
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r1, #2
	adds r1, r0, #1
	ldr r0, _021E6CC4 @ =0x021E9344
	ldr r0, [r0, r4]
	adds r7, r1, r0
	ldr r0, [sp, #0x10]
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r0, #2
	adds r1, r0, #1
	ldr r0, _021E6CC8 @ =0x021E9348
	ldr r2, [sp, #0x14]
	ldr r0, [r0, r4]
	adds r6, r1, r0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x10]
	bl ov122_021E8674
	cmp r0, #0
	beq _021E6C9C
	ldr r0, _021E6CCC @ =0x021E934C
	lsls r3, r7, #0x18
	ldr r1, [r0, r4]
	add r0, sp, #0x18
	strh r1, [r0]
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	movs r1, #2
	add r2, sp, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	b _021E6CB8
_021E6C9C:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	lsls r3, r7, #0x18
	ldr r0, [r5, #0x18]
	movs r1, #2
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
_021E6CB8:
	ldr r0, [r5, #0x18]
	movs r1, #2
	bl FUN_0201BF7C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E6CC4: .4byte 0x021E9344
_021E6CC8: .4byte 0x021E9348
_021E6CCC: .4byte 0x021E934C
	thumb_func_end ov122_021E6C2C

	thumb_func_start ov122_021E6CD0
ov122_021E6CD0: @ 0x021E6CD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r6, #0
	movs r4, #2
	add r7, sp, #0xc
_021E6CDC:
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r6, #0x18
	ldr r0, [r5, r0]
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov122_021E86E0
	adds r1, r0, #0
	adds r1, #0xcb
	strh r1, [r7, #4]
	adds r0, #0xeb
	strh r0, [r7, #6]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	movs r1, #2
	add r2, sp, #0x10
	movs r3, #0x17
	bl FUN_0201C4C4
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #5
	blt _021E6CDC
	movs r4, #0
	movs r6, #3
	add r7, sp, #0xc
_021E6D1E:
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov122_021E86E0
	adds r1, r0, #0
	adds r1, #0xcb
	strh r1, [r7]
	adds r0, #0xeb
	strh r0, [r7, #2]
	movs r0, #0x16
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	lsls r3, r6, #0x18
	ldr r0, [r5, #0x18]
	movs r1, #2
	add r2, sp, #0xc
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #5
	blt _021E6D1E
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E6CD0

	thumb_func_start ov122_021E6D60
ov122_021E6D60: @ 0x021E6D60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r6, #0
	movs r4, #1
_021E6D6A:
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r6, #0x18
	ldr r0, [r5, r0]
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov122_021E86A8
	movs r1, #0xa
	adds r7, r0, #0
	blx FUN_020F2998
	adds r1, r0, #1
	add r0, sp, #0xc
	strh r1, [r0, #4]
	adds r0, r7, #0
	movs r1, #0xa
	blx FUN_020F2998
	adds r1, r1, #1
	add r0, sp, #0xc
	strh r1, [r0, #6]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	movs r1, #2
	add r2, sp, #0x10
	movs r3, #0x16
	bl FUN_0201C4C4
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #5
	blt _021E6D6A
	movs r4, #0
	movs r6, #2
_021E6DBC:
	movs r0, #0x91
	lsls r0, r0, #2
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov122_021E86A8
	movs r1, #0xa
	adds r7, r0, #0
	blx FUN_020F2998
	adds r1, r0, #1
	add r0, sp, #0xc
	strh r1, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	blx FUN_020F2998
	lsls r3, r6, #0x18
	adds r1, r1, #1
	add r0, sp, #0xc
	strh r1, [r0, #2]
	movs r0, #0x15
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	movs r1, #2
	add r2, sp, #0xc
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #5
	blt _021E6DBC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E6D60

	thumb_func_start ov122_021E6E10
ov122_021E6E10: @ 0x021E6E10
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #2
	blo _021E6E1E
	bl GF_AssertFail
_021E6E1E:
	cmp r5, #5
	blo _021E6E26
	bl GF_AssertFail
_021E6E26:
	ldr r0, _021E6E30 @ =0x021E9278
	lsls r1, r5, #1
	adds r0, r0, r1
	ldrb r0, [r4, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6E30: .4byte 0x021E9278
	thumb_func_end ov122_021E6E10

	thumb_func_start ov122_021E6E34
ov122_021E6E34: @ 0x021E6E34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r4, #0
_021E6E3C:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	adds r6, r1, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r0, #5
	adds r0, r7, r0
	adds r0, r6, r0
	strh r0, [r5]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #9
	blt _021E6E3C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E6E34

	thumb_func_start ov122_021E6E60
ov122_021E6E60: @ 0x021E6E60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r2, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #5
	adds r4, r3, #0
	blx FUN_020F2998
	lsls r0, r1, #2
	adds r7, r0, #1
	adds r0, r5, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r0, #2
	adds r6, r0, #1
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	bl ov122_021E8668
	cmp r4, #3
	bhi _021E6EE0
	adds r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6E9C: @ jump table
	.2byte _021E6EA4 - _021E6E9C - 2 @ case 0
	.2byte _021E6EAE - _021E6E9C - 2 @ case 1
	.2byte _021E6EB8 - _021E6E9C - 2 @ case 2
	.2byte _021E6ECC - _021E6E9C - 2 @ case 3
_021E6EA4:
	add r0, sp, #0x14
	movs r1, #0x77
	bl ov122_021E6E34
	b _021E6EE4
_021E6EAE:
	add r0, sp, #0x14
	movs r1, #0x1a
	bl ov122_021E6E34
	b _021E6EE4
_021E6EB8:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl ov122_021E6E10
	adds r1, r0, #0
	add r0, sp, #0x14
	bl ov122_021E6E34
	b _021E6EE4
_021E6ECC:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	bl ov122_021E6E10
	adds r1, r0, #0
	add r0, sp, #0x14
	bl ov122_021E6E34
	b _021E6EE4
_021E6EE0:
	bl GF_AssertFail
_021E6EE4:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsls r3, r7, #0x18
	ldr r0, [sp, #0xc]
	movs r1, #0
	add r2, sp, #0x14
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E6E60

	thumb_func_start ov122_021E6F04
ov122_021E6F04: @ 0x021E6F04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r2, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #5
	adds r4, r3, #0
	blx FUN_020F2998
	lsls r0, r1, #2
	adds r7, r0, #1
	adds r0, r5, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r0, #2
	adds r6, r0, #1
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	bl ov122_021E8668
	cmp r4, #3
	bhi _021E6F7A
	adds r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E6F40: @ jump table
	.2byte _021E6F48 - _021E6F40 - 2 @ case 0
	.2byte _021E6F5C - _021E6F40 - 2 @ case 1
	.2byte _021E6F66 - _021E6F40 - 2 @ case 2
	.2byte _021E6F70 - _021E6F40 - 2 @ case 3
_021E6F48:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	bl ov122_021E6E10
	adds r1, r0, #0
	add r0, sp, #0x14
	bl ov122_021E6E34
	b _021E6F7E
_021E6F5C:
	add r0, sp, #0x14
	movs r1, #0x1a
	bl ov122_021E6E34
	b _021E6F7E
_021E6F66:
	add r0, sp, #0x14
	movs r1, #0x77
	bl ov122_021E6E34
	b _021E6F7E
_021E6F70:
	add r0, sp, #0x14
	movs r1, #0x17
	bl ov122_021E6E34
	b _021E6F7E
_021E6F7A:
	bl GF_AssertFail
_021E6F7E:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsls r3, r7, #0x18
	ldr r0, [sp, #0xc]
	movs r1, #0
	add r2, sp, #0x14
	lsrs r3, r3, #0x18
	bl FUN_0201C4C4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E6F04

	thumb_func_start ov122_021E6F9C
ov122_021E6F9C: @ 0x021E6F9C
	push {r3, lr}
	adds r3, r0, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldrb r2, [r3, #0x11]
	ldrb r3, [r3, #0x10]
	bl ov122_021E6E60
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov122_021E6F9C

	thumb_func_start ov122_021E6FB0
ov122_021E6FB0: @ 0x021E6FB0
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0
	adds r5, r0, #0
	adds r4, r6, #0
	movs r7, #1
_021E6FBA:
	lsls r1, r4, #0x18
	ldr r0, [r5, #4]
	lsrs r1, r1, #0x18
	bl ov122_021E8630
	cmp r0, #0
	bne _021E6FD8
	ldrb r3, [r5, #0x10]
	lsls r2, r4, #0x18
	ldr r0, [r5]
	ldr r1, [r5, #4]
	lsrs r2, r2, #0x18
	adds r6, r7, #0
	bl ov122_021E6E60
_021E6FD8:
	adds r4, r4, #1
	cmp r4, #0x19
	blt _021E6FBA
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E6FB0

	thumb_func_start ov122_021E6FE4
ov122_021E6FE4: @ 0x021E6FE4
	push {r4, r5, r6, lr}
	movs r6, #0
	adds r5, r0, #0
	adds r4, r6, #0
_021E6FEC:
	ldrb r2, [r5, #0x13]
	ldrb r3, [r5, #0x10]
	ldr r0, [r5]
	adds r2, r2, r4
	lsls r2, r2, #0x18
	ldr r1, [r5, #4]
	lsrs r2, r2, #0x18
	bl ov122_021E6F04
	adds r6, r6, #1
	adds r4, r4, #5
	cmp r6, #5
	blt _021E6FEC
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E6FE4

	thumb_func_start ov122_021E7008
ov122_021E7008: @ 0x021E7008
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0
	adds r5, r0, #0
	adds r4, r6, #0
	movs r7, #1
_021E7012:
	lsls r1, r4, #0x18
	ldr r0, [r5, #4]
	lsrs r1, r1, #0x18
	bl ov122_021E8630
	cmp r0, #0
	bne _021E7030
	ldrb r3, [r5, #0x10]
	lsls r2, r4, #0x18
	ldr r0, [r5]
	ldr r1, [r5, #4]
	lsrs r2, r2, #0x18
	adds r6, r7, #0
	bl ov122_021E6F04
_021E7030:
	adds r4, r4, #1
	cmp r4, #0x19
	blt _021E7012
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E7008

	thumb_func_start ov122_021E703C
ov122_021E703C: @ 0x021E703C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	movs r5, #1
	cmp r1, #3
	bhi _021E7076
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E7054: @ jump table
	.2byte _021E705C - _021E7054 - 2 @ case 0
	.2byte _021E7062 - _021E7054 - 2 @ case 1
	.2byte _021E706A - _021E7054 - 2 @ case 2
	.2byte _021E7070 - _021E7054 - 2 @ case 3
_021E705C:
	bl ov122_021E6F9C
	b _021E7076
_021E7062:
	bl ov122_021E6FB0
	adds r5, r0, #0
	b _021E7076
_021E706A:
	bl ov122_021E6FE4
	b _021E7076
_021E7070:
	bl ov122_021E7008
	adds r5, r0, #0
_021E7076:
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _021E7086
	cmp r5, #0
	beq _021E7086
	ldr r0, _021E7090 @ =0x0000092C
	bl FUN_0200604C
_021E7086:
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201BF7C
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7090: .4byte 0x0000092C
	thumb_func_end ov122_021E703C

	thumb_func_start ov122_021E7094
ov122_021E7094: @ 0x021E7094
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0201CAE0
	adds r0, r4, #0
	bl ov122_021E6CD0
	adds r0, r4, #0
	bl ov122_021E6D60
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0201BF7C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E7094

	thumb_func_start ov122_021E70B8
ov122_021E70B8: @ 0x021E70B8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r3, #0
	adds r5, r2, #0
	ldr r2, [r4, #0x18]
	str r2, [r0]
	movs r2, #9
	lsls r2, r2, #6
	ldr r3, [r4, r2]
	adds r2, r2, #4
	str r3, [r0, #8]
	ldr r2, [r4, r2]
	str r2, [r0, #4]
	str r5, [r0, #0xc]
	strb r1, [r0, #0x11]
	movs r2, #0
	strb r2, [r0, #0x10]
	movs r1, #5
	strb r2, [r0, #0x12]
	strb r1, [r0, #0x13]
	cmp r5, #3
	bhi _021E7160
	adds r3, r5, r5
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_021E70F0: @ jump table
	.2byte _021E70F8 - _021E70F0 - 2 @ case 0
	.2byte _021E713A - _021E70F0 - 2 @ case 1
	.2byte _021E715A - _021E70F0 - 2 @ case 2
	.2byte _021E7164 - _021E70F0 - 2 @ case 3
_021E70F8:
	ldrb r6, [r0, #0x11]
	adds r0, r6, #0
	blx FUN_020F2998
	adds r5, r1, #0
	adds r0, r6, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r0, #2
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	lsls r3, r5, #2
	adds r3, r3, #1
	lsls r3, r3, #0x18
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x18]
	movs r1, #2
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E713A:
	movs r3, #1
	str r3, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0201C8C4
	ldr r0, [r4, #0x18]
	movs r1, #2
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E715A:
	strb r2, [r0, #0x13]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E7160:
	bl GF_AssertFail
_021E7164:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E70B8

	thumb_func_start ov122_021E7168
ov122_021E7168: @ 0x021E7168
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x12]
	movs r1, #3
	blx FUN_020F2998
	cmp r1, #0
	beq _021E719E
	adds r0, r4, #0
	bl ov122_021E703C
	ldrb r0, [r4, #0x10]
	adds r0, r0, #1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x10]
	cmp r0, #4
	blo _021E719E
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x13]
	adds r0, r0, #1
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0x13]
	cmp r0, #5
	blo _021E719E
	movs r0, #1
	pop {r4, pc}
_021E719E:
	ldrb r0, [r4, #0x12]
	adds r0, r0, #1
	strb r0, [r4, #0x12]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E7168

	thumb_func_start ov122_021E71A8
ov122_021E71A8: @ 0x021E71A8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E71BC
	bl GF_AssertFail
_021E71BC:
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E58
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov122_021E8DAC
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x14
	bl FUN_0200DC4C
	movs r0, #0
	str r0, [sp]
	adds r3, r4, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #7
	adds r3, #0x44
	bl ov122_021E767C
	movs r0, #0x8e
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E7210 @ =0x000005FF
	bl FUN_0200604C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021E7210: .4byte 0x000005FF
	thumb_func_end ov122_021E71A8

	thumb_func_start ov122_021E7214
ov122_021E7214: @ 0x021E7214
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7228
	bl GF_AssertFail
_021E7228:
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov122_021E8DAC
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E58
	adds r0, r4, #0
	movs r1, #0
	bl ov122_021E7274
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x15
	bl FUN_0200DC4C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r4, #0x44
	movs r1, #4
	movs r2, #6
	adds r3, r4, #0
	bl ov122_021E767C
	ldr r0, _021E7270 @ =0x000005FF
	bl FUN_0200604C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021E7270: .4byte 0x000005FF
	thumb_func_end ov122_021E7214

	thumb_func_start ov122_021E7274
ov122_021E7274: @ 0x021E7274
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0200DCE8
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DCE8
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DCE8
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DCE8
	cmp r4, #0
	beq _021E72C0
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E84B0
	cmp r0, #0xe
	bne _021E72BE
	movs r4, #1
	b _021E72C0
_021E72BE:
	movs r4, #0
_021E72C0:
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E7274

	thumb_func_start ov122_021E72D0
ov122_021E72D0: @ 0x021E72D0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8DF0
	str r0, [sp]
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8E28
	cmp r0, #0
	beq _021E7330
	ldr r4, _021E733C @ =0x021E92B0
	movs r6, #0
_021E72F2:
	ldrb r0, [r4, #2]
	cmp r0, #0xd
	blo _021E72FC
	bl GF_AssertFail
_021E72FC:
	ldrb r0, [r4, #2]
	ldrb r2, [r4, #3]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r7, [r1, r0]
	adds r0, #0xf8
	ldr r0, [r5, r0]
	ldr r1, [sp]
	bl ov122_021E8674
	adds r1, r0, #0
	ldrb r1, [r4, r1]
	adds r0, r7, #0
	bl FUN_0200DC4C
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _021E72F2
	adds r0, r5, #0
	movs r1, #1
	bl ov122_021E7274
	pop {r3, r4, r5, r6, r7, pc}
_021E7330:
	adds r0, r5, #0
	movs r1, #0
	bl ov122_021E7274
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E733C: .4byte 0x021E92B0
	thumb_func_end ov122_021E72D0

	thumb_func_start ov122_021E7340
ov122_021E7340: @ 0x021E7340
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r5, r1, #0
	adds r6, r2, #0
	bl ov122_021E8630
	cmp r0, #0
	beq _021E7360
	ldr r0, _021E73F4 @ =0x000005F3
	bl FUN_0200604C
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E7360:
	ldr r0, _021E73F8 @ =0x000005EA
	bl FUN_0200604C
	cmp r6, #4
	bhi _021E73EC
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E7376: @ jump table
	.2byte _021E7384 - _021E7376 - 2 @ case 0
	.2byte _021E739E - _021E7376 - 2 @ case 1
	.2byte _021E73B8 - _021E7376 - 2 @ case 2
	.2byte _021E73D2 - _021E7376 - 2 @ case 3
	.2byte _021E7380 - _021E7376 - 2 @ case 4
_021E7380:
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E7384:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #1
	bl ov122_021E868C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov122_021E6C2C
	b _021E73F0
_021E739E:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #2
	bl ov122_021E868C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov122_021E6C2C
	b _021E73F0
_021E73B8:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #4
	bl ov122_021E868C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov122_021E6C2C
	b _021E73F0
_021E73D2:
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #8
	bl ov122_021E868C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	bl ov122_021E6C2C
	b _021E73F0
_021E73EC:
	bl GF_AssertFail
_021E73F0:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E73F4: .4byte 0x000005F3
_021E73F8: .4byte 0x000005EA
	thumb_func_end ov122_021E7340

	thumb_func_start ov122_021E73FC
ov122_021E73FC: @ 0x021E73FC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	movs r1, #0
	bl FUN_02018424
	str r0, [r7, #0x1c]
	movs r0, #0
	ldr r5, _021E7458 @ =0x021E9290
	str r0, [sp]
	adds r6, r7, #0
_021E7412:
	ldr r0, [r5, #4]
	ldr r1, [r7]
	bl FUN_02014918
	movs r1, #0x4d
	lsls r1, r1, #2
	str r0, [r6, r1]
	ldr r0, [r5, #4]
	movs r4, #0
	cmp r0, #0
	ble _021E7446
_021E7428:
	ldr r2, [r5]
	movs r0, #0x4d
	movs r1, #6
	lsls r0, r0, #2
	lsls r1, r1, #6
	ldrb r2, [r2, r4]
	ldr r0, [r6, r0]
	ldr r1, [r7, r1]
	adds r3, r4, #0
	bl FUN_02014960
	ldr r0, [r5, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _021E7428
_021E7446:
	ldr r0, [sp]
	adds r5, #8
	adds r0, r0, #1
	adds r6, r6, #4
	str r0, [sp]
	cmp r0, #2
	blt _021E7412
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7458: .4byte 0x021E9290
	thumb_func_end ov122_021E73FC

	thumb_func_start ov122_021E745C
ov122_021E745C: @ 0x021E745C
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r7, #0x4d
	str r0, [sp]
	adds r5, r0, #0
	adds r6, r4, #0
	lsls r7, r7, #2
_021E746A:
	movs r0, #0x4d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	str r6, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E746A
	ldr r0, [sp]
	ldr r0, [r0, #0x1c]
	bl FUN_02018474
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E745C

	thumb_func_start ov122_021E7488
ov122_021E7488: @ 0x021E7488
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r0, #0
	adds r6, r1, #0
	add r1, sp, #0xc
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	str r0, [r1, #0x14]
	ldr r1, _021E750C @ =0x021E9290
	lsls r0, r6, #3
	adds r4, r1, r0
	ldr r0, [r5, #0x18]
	cmp r0, #0
	bne _021E74B0
	bl GF_AssertFail
_021E74B0:
	ldr r2, _021E7510 @ =0x021E9278
	add r0, sp, #0xc
	ldrh r3, [r2, #0xa]
	add r1, sp, #0xc
	strh r3, [r0]
	ldrh r3, [r2, #0xc]
	strh r3, [r0, #2]
	ldrh r3, [r2, #0xe]
	strh r3, [r0, #4]
	ldrh r3, [r2, #0x10]
	strh r3, [r0, #6]
	ldrh r3, [r2, #0x12]
	ldrh r2, [r2, #0x14]
	strh r3, [r0, #8]
	strh r2, [r0, #0xa]
	lsls r2, r6, #2
	adds r3, r5, r2
	movs r2, #0x4d
	lsls r2, r2, #2
	ldr r3, [r3, r2]
	adds r2, #0xf4
	str r3, [sp, #0x18]
	ldr r3, [r5, #0x18]
	str r3, [sp, #0x1c]
	ldr r3, [r4, #4]
	strb r3, [r0, #0x14]
	ldr r3, [r4, #4]
	lsls r0, r3, #1
	adds r0, r3, r0
	movs r3, #0x11
	subs r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldrb r2, [r5, r2]
	ldr r0, [r5, #0x1c]
	bl FUN_020185FC
	str r0, [r5, #0x20]
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	nop
_021E750C: .4byte 0x021E9290
_021E7510: .4byte 0x021E9278
	thumb_func_end ov122_021E7488

	thumb_func_start ov122_021E7514
ov122_021E7514: @ 0x021E7514
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x20]
	bl FUN_020186A4
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021E753C
	ldr r0, [r5, #0x20]
	bl FUN_02018674
	movs r1, #0x8a
	lsls r1, r1, #2
	strb r0, [r5, r1]
	ldr r0, [r5, #0x20]
	bl FUN_02018680
	adds r0, r4, #0
_021E753C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E7514

	thumb_func_start ov122_021E7540
ov122_021E7540: @ 0x021E7540
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r1, #0
	str r1, [sp]
	adds r3, r4, #0
	str r1, [sp, #4]
	movs r1, #4
	movs r2, #6
	adds r3, #0x44
	bl ov122_021E767C
	movs r0, #0
	str r0, [sp]
	adds r3, r4, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #8
	adds r3, #0x54
	bl ov122_021E767C
	ldr r0, [r4, #0x18]
	movs r1, #1
	bl FUN_0201BF7C
	movs r1, #0
	movs r2, #1
	str r1, [sp]
	movs r0, #0x61
	str r2, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r3, r2, #0
	bl FUN_0200BFCC
	movs r1, #0
	str r1, [sp]
	adds r3, r4, #0
	ldr r0, _021E7624 @ =0x000F0100
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, #0x64
	bl ov122_021E769C
	movs r1, #0
	str r1, [sp]
	adds r3, r4, #0
	ldr r0, _021E7624 @ =0x000F0100
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r2, #1
	adds r3, #0x74
	bl ov122_021E769C
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, #0x10]
	movs r1, #0
	bl FUN_0200BE48
	movs r1, #0
	adds r3, r4, #0
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7624 @ =0x000F0100
	movs r2, #2
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r3, #0x84
	bl ov122_021E769C
	movs r1, #0
	adds r3, r4, #0
	str r1, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7624 @ =0x000F0100
	movs r2, #3
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r3, #0x94
	bl ov122_021E769C
	movs r1, #0
	adds r3, r4, #0
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #4
	adds r3, #0xa4
	str r1, [sp, #4]
	bl ov122_021E767C
	movs r1, #0
	str r1, [sp]
	adds r3, r4, #0
	str r1, [sp, #4]
	adds r0, r4, #0
	movs r2, #5
	adds r3, #0xb4
	bl ov122_021E767C
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201BF7C
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E7624: .4byte 0x000F0100
	thumb_func_end ov122_021E7540

	thumb_func_start ov122_021E7628
ov122_021E7628: @ 0x021E7628
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _021E7658 @ =0x021E93DC
	movs r6, #0
	adds r5, #0x24
_021E7634:
	ldr r0, [r7, #0x18]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #0x11
	blt _021E7634
	adds r0, r7, #0
	bl ov122_021E7540
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7658: .4byte 0x021E93DC
	thumb_func_end ov122_021E7628

	thumb_func_start ov122_021E765C
ov122_021E765C: @ 0x021E765C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x24
_021E7664:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x11
	blt _021E7664
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E765C

	thumb_func_start ov122_021E767C
ov122_021E767C: @ 0x021E767C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, sp, #8
	ldrb r5, [r4, #0x10]
	str r5, [sp]
	ldrb r4, [r4, #0x14]
	str r4, [sp, #4]
	ldr r4, _021E7698 @ =0x00010200
	str r4, [sp, #8]
	bl ov122_021E769C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E7698: .4byte 0x00010200
	thumb_func_end ov122_021E767C

	thumb_func_start ov122_021E769C
ov122_021E769C: @ 0x021E769C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r3, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r7, #0
	movs r1, #0
	adds r6, r2, #0
	bl FUN_0201D978
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, [r5]
	adds r2, r6, #0
	bl FUN_0200BC4C
	adds r5, r0, #0
	add r3, sp, #0x18
	ldrb r0, [r3, #0x14]
	adds r1, r4, #0
	adds r2, r5, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	adds r0, r7, #0
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E769C

	thumb_func_start ov122_021E76F4
ov122_021E76F4: @ 0x021E76F4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x34
	adds r6, r1, #0
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, [r5]
	adds r2, r6, #0
	bl FUN_0200BC4C
	adds r6, r0, #0
	movs r0, #0x14
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #4
	movs r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x18]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0xd
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #8]
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [r5, #0x18]
	movs r1, #3
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov122_021E76F4

	thumb_func_start ov122_021E7770
ov122_021E7770: @ 0x021E7770
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #5
	lsls r0, r0, #6
	adds r4, r5, #0
	ldr r0, [r5, r0]
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, #0x24
	cmp r0, #0
	beq _021E778C
	bl GF_AssertFail
_021E778C:
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	cmp r6, #0x19
	bne _021E77A6
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200BBA0
	b _021E77B8
_021E77A6:
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, [r5]
	adds r2, r6, #0
	bl FUN_0200BC4C
_021E77B8:
	adds r6, r0, #0
	cmp r7, #0
	beq _021E77E4
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #6
	movs r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x18]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0xd
	bl FUN_0200E998
_021E77E4:
	movs r3, #0
	ldr r0, _021E7818 @ =0x0000022A
	str r3, [sp]
	ldrb r0, [r5, r0]
	movs r1, #1
	adds r2, r6, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	str r3, [sp, #8]
	bl FUN_020200A8
	ldr r1, _021E781C @ =0x0000022B
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r0, #0xff
	bne _021E7808
	bl GF_AssertFail
_021E7808:
	adds r0, r4, #0
	bl FUN_0201D5C8
	movs r0, #5
	lsls r0, r0, #6
	str r6, [r5, r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7818: .4byte 0x0000022A
_021E781C: .4byte 0x0000022B
	thumb_func_end ov122_021E7770

	thumb_func_start ov122_021E7820
ov122_021E7820: @ 0x021E7820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E7850 @ =0x0000022B
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021E784A
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7846
	bl FUN_02026380
	movs r0, #5
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
_021E7846:
	movs r0, #1
	pop {r4, pc}
_021E784A:
	movs r0, #0
	pop {r4, pc}
	nop
_021E7850: .4byte 0x0000022B
	thumb_func_end ov122_021E7820

	thumb_func_start ov122_021E7854
ov122_021E7854: @ 0x021E7854
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl ov122_021E8794
	movs r1, #8
	subs r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	movs r0, #0x61
	str r3, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E7854

	thumb_func_start ov122_021E7888
ov122_021E7888: @ 0x021E7888
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _021E78B0
	movs r0, #1
	bl FUN_0200B554
	movs r0, #1
	str r0, [sp]
	movs r0, #4
	adds r1, r0, #0
	subs r1, #0xc
	movs r2, #0
	movs r3, #0x37
	bl FUN_0200B484
	movs r0, #1
	strb r0, [r4]
_021E78B0:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov122_021E7888

	thumb_func_start ov122_021E78B4
ov122_021E78B4: @ 0x021E78B4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	bl FUN_0200B554
	movs r1, #0
	movs r0, #1
	adds r2, r1, #0
	str r0, [sp]
	movs r0, #4
	subs r2, #8
	movs r3, #0x37
	bl FUN_0200B484
	movs r0, #0
	strb r0, [r4]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E78B4

	thumb_func_start ov122_021E78DC
ov122_021E78DC: @ 0x021E78DC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _021E7900
	movs r0, #1
	bl FUN_0200B554
	movs r0, #1
	subs r1, r0, #7
	movs r2, #0
	movs r3, #0x21
	str r0, [sp]
	bl FUN_0200B484
	movs r0, #1
	strb r0, [r4]
_021E7900:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov122_021E78DC

	thumb_func_start ov122_021E7904
ov122_021E7904: @ 0x021E7904
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	bl FUN_0200B554
	movs r1, #0
	movs r0, #1
	subs r2, r1, #6
	movs r3, #0x21
	str r0, [sp]
	bl FUN_0200B484
	movs r0, #0
	strb r0, [r4]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E7904

	thumb_func_start ov122_021E7928
ov122_021E7928: @ 0x021E7928
	push {r4, r5, r6, r7, lr}
	sub sp, #0xbc
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0201AC88
	add r3, sp, #4
	ldr r4, _021E7998 @ =0x021E92C0
	str r0, [r5, #0x18]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E799C @ =0x021E9464
	add r3, sp, #0x14
	movs r2, #0x15
_021E7950:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7950
	ldr r4, _021E79A0 @ =0x021E9270
	movs r7, #0
	add r6, sp, #0x14
_021E795E:
	ldrb r1, [r4]
	ldr r0, [r5, #0x18]
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldrb r1, [r4]
	ldr r0, [r5, #0x18]
	bl FUN_0201CAE0
	movs r0, #0
	str r0, [sp]
	ldrb r1, [r4]
	ldr r0, [r5, #0x18]
	movs r2, #0
	movs r3, #1
	bl FUN_0201C1F4
	ldrb r0, [r4]
	movs r1, #1
	bl FUN_0201BC28
	adds r7, r7, #1
	adds r6, #0x1c
	adds r4, r4, #1
	cmp r7, #6
	blt _021E795E
	add sp, #0xbc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7998: .4byte 0x021E92C0
_021E799C: .4byte 0x021E9464
_021E79A0: .4byte 0x021E9270
	thumb_func_end ov122_021E7928

	thumb_func_start ov122_021E79A4
ov122_021E79A4: @ 0x021E79A4
	push {r4, r5, r6, lr}
	ldr r5, _021E79CC @ =0x021E9270
	adds r6, r0, #0
	movs r4, #0
_021E79AC:
	ldrb r1, [r5]
	ldr r0, [r6, #0x18]
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #6
	blt _021E79AC
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [r6, #0x18]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	nop
_021E79CC: .4byte 0x021E9270
	thumb_func_end ov122_021E79A4

	thumb_func_start ov122_021E79D0
ov122_021E79D0: @ 0x021E79D0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #4
	bl FUN_02002CEC
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E79E8
	bl GF_AssertFail
_021E79E8:
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r3, #7
	str r0, [sp, #4]
	movs r0, #0x10
	movs r1, #9
	movs r2, #0
	lsls r3, r3, #6
	bl FUN_02007938
	movs r1, #6
	ldr r2, [r4]
	movs r0, #0
	lsls r1, r1, #6
	bl FUN_0200304C
	movs r1, #6
	ldr r2, [r4]
	movs r0, #4
	lsls r1, r1, #6
	bl FUN_02003030
	movs r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	movs r3, #0x1a
	str r0, [sp, #4]
	movs r0, #0x10
	movs r1, #9
	movs r2, #4
	lsls r3, r3, #4
	bl FUN_02007938
	ldr r0, _021E7AE8 @ =0x00000229
	movs r1, #3
	ldrb r0, [r4, r0]
	movs r2, #1
	movs r3, #0xd
	str r0, [sp]
	ldr r0, [r4]
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	bl FUN_0200E644
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	adds r3, r1, #0
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	ldr r0, [r4]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	movs r2, #4
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #3
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #6
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	movs r3, #4
	bl FUN_02007B68
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E7AE8: .4byte 0x00000229
	thumb_func_end ov122_021E79D0

	thumb_func_start ov122_021E7AEC
ov122_021E7AEC: @ 0x021E7AEC
	push {r3, r4, lr}
	sub sp, #0x4c
	ldr r3, _021E7B88 @ =0x021E92E4
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x34
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _021E7B8C @ =0x021E92FC
	add r2, sp, #0x14
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _021E7B90 @ =0x021E92D0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #0x80
	str r0, [sp]
	ldr r0, [r4]
	bl FUN_0200CF18
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0200CF38
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x14
	add r2, sp, #0
	movs r3, #0x20
	bl FUN_0200CF70
	movs r1, #0x51
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x80
	bl FUN_0200CFF4
	movs r1, #0x51
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl FUN_0200D3F8
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200CF6C
	movs r2, #0x83
	movs r1, #0
	lsls r2, r2, #0xe
	bl FUN_02009FC8
	add sp, #0x4c
	pop {r3, r4, pc}
	.align 2, 0
_021E7B88: .4byte 0x021E92E4
_021E7B8C: .4byte 0x021E92FC
_021E7B90: .4byte 0x021E92D0
	thumb_func_end ov122_021E7AEC

	thumb_func_start ov122_021E7B94
ov122_021E7B94: @ 0x021E7B94
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E7BA6
	bl GF_AssertFail
_021E7BA6:
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E7BB4
	bl GF_AssertFail
_021E7BB4:
	adds r0, r4, #0
	bl ov122_021E7F48
	movs r1, #0x51
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D998
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D108
	pop {r4, pc}
	thumb_func_end ov122_021E7B94

	thumb_func_start ov122_021E7BD4
ov122_021E7BD4: @ 0x021E7BD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _021E7BE4
	bl GF_AssertFail
_021E7BE4:
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r6, [r5, r0]
	adds r0, r0, #4
	ldr r4, [r5, r0]
	movs r1, #0
	str r1, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r7, #1
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0xa
	bl FUN_0200D5D4
	adds r0, r7, #0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0xb
	bl FUN_0200D504
	adds r0, r7, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0xc
	bl FUN_0200D6EC
	adds r0, r7, #0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0xd
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r7, #2
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0xe
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0xf
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x10
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r3, #0x11
	bl FUN_0200D71C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E7BD4

	thumb_func_start ov122_021E7C9C
ov122_021E7C9C: @ 0x021E7C9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r6, _021E7D00 @ =0x021E9374
	adds r7, r2, #0
	str r3, [sp]
	adds r5, r0, #0
	adds r4, r1, #0
	add r3, sp, #4
	movs r2, #6
_021E7CAE:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7CAE
	ldr r0, [r6]
	cmp r5, #0
	str r0, [r3]
	bne _021E7CC2
	bl GF_AssertFail
_021E7CC2:
	cmp r4, #0
	bne _021E7CCA
	bl GF_AssertFail
_021E7CCA:
	add r1, sp, #4
	strh r7, [r1]
	ldr r0, [sp]
	movs r3, #0x83
	strh r0, [r1, #2]
	add r0, sp, #0x40
	ldrh r2, [r0, #0x10]
	lsls r3, r3, #0xe
	strh r2, [r1, #6]
	ldrh r0, [r0, #0x14]
	adds r1, r4, #0
	add r2, sp, #4
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl FUN_0200D740
	adds r4, r0, #0
	movs r1, #1
	bl FUN_0200DC78
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7D00: .4byte 0x021E9374
	thumb_func_end ov122_021E7C9C

	thumb_func_start ov122_021E7D04
ov122_021E7D04: @ 0x021E7D04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r6, _021E7D68 @ =0x021E93A8
	adds r7, r2, #0
	str r3, [sp]
	adds r5, r0, #0
	adds r4, r1, #0
	add r3, sp, #4
	movs r2, #6
_021E7D16:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7D16
	ldr r0, [r6]
	cmp r5, #0
	str r0, [r3]
	bne _021E7D2A
	bl GF_AssertFail
_021E7D2A:
	cmp r4, #0
	bne _021E7D32
	bl GF_AssertFail
_021E7D32:
	add r1, sp, #4
	strh r7, [r1]
	ldr r0, [sp]
	movs r3, #0x83
	strh r0, [r1, #2]
	add r0, sp, #0x40
	ldrh r2, [r0, #0x10]
	lsls r3, r3, #0xe
	strh r2, [r1, #6]
	ldrh r0, [r0, #0x14]
	adds r1, r4, #0
	add r2, sp, #4
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl FUN_0200D740
	adds r4, r0, #0
	movs r1, #1
	bl FUN_0200DC78
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7D68: .4byte 0x021E93A8
	thumb_func_end ov122_021E7D04

	thumb_func_start ov122_021E7D6C
ov122_021E7D6C: @ 0x021E7D6C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x12
	movs r1, #0x51
	str r0, [sp]
	movs r0, #1
	movs r2, #0
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl ov122_021E7C9C
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r2, #0
	adds r0, r1, #0
	str r2, [sp]
	str r2, [sp, #4]
	subs r0, #8
	subs r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl ov122_021E7C9C
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #5
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0xc
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xe0
	movs r3, #0x28
	bl ov122_021E7C9C
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x10
	subs r1, #0xc
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xe0
	movs r3, #0xb0
	bl ov122_021E7C9C
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x14
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x14
	subs r1, #0x10
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x80
	movs r3, #0x60
	bl ov122_021E7C9C
	movs r1, #0x57
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x18
	subs r1, #0x14
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xc8
	movs r3, #0x50
	bl ov122_021E7C9C
	movs r1, #0x16
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x1c
	subs r1, #0x18
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xe0
	movs r3, #0x50
	bl ov122_021E7C9C
	movs r1, #0x59
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xe
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x20
	subs r1, #0x1c
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xc8
	movs r3, #0x68
	bl ov122_021E7C9C
	movs r1, #0x5a
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xd
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x24
	subs r1, #0x20
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xe0
	movs r3, #0x68
	bl ov122_021E7C9C
	movs r1, #0x5b
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x28
	subs r1, #0x24
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xe0
	movs r3, #0x80
	bl ov122_021E7C9C
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0x12
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x2c
	subs r1, #0x28
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0xc8
	movs r3, #0x50
	bl ov122_021E7C9C
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x30
	subs r1, #0x2c
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x48
	movs r3, #0x38
	bl ov122_021E7D04
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	subs r0, #0x34
	subs r1, #0x30
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x88
	movs r3, #0x28
	bl ov122_021E7D04
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #2
	ldr r0, [r0]
	lsls r1, r1, #0x10
	bl ov122_021E7F64
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DD54
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_0200DD10
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov122_021E7D6C

	thumb_func_start ov122_021E7F48
ov122_021E7F48: @ 0x021E7F48
	push {r4, r5, r6, lr}
	movs r6, #0x53
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021E7F52:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xd
	blt _021E7F52
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov122_021E7F48

	thumb_func_start ov122_021E7F64
ov122_021E7F64: @ 0x021E7F64
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02024CB8
	str r4, [r0, #0x10]
	pop {r4, pc}
	thumb_func_end ov122_021E7F64

	thumb_func_start ov122_021E7F70
ov122_021E7F70: @ 0x021E7F70
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021E7FA2
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021E7FA2
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021E7FA2
	movs r0, #1
	pop {r4, pc}
_021E7FA2:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E7F70

	thumb_func_start ov122_021E7FA8
ov122_021E7FA8: @ 0x021E7FA8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	adds r1, r0, #0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8668
	pop {r4, pc}
	thumb_func_end ov122_021E7FA8

	thumb_func_start ov122_021E7FC4
ov122_021E7FC4: @ 0x021E7FC4
	push {r3, lr}
	cmp r0, #8
	bhi _021E7FF8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E7FD6: @ jump table
	.2byte _021E7FF8 - _021E7FD6 - 2 @ case 0
	.2byte _021E7FE8 - _021E7FD6 - 2 @ case 1
	.2byte _021E7FEC - _021E7FD6 - 2 @ case 2
	.2byte _021E7FF8 - _021E7FD6 - 2 @ case 3
	.2byte _021E7FF0 - _021E7FD6 - 2 @ case 4
	.2byte _021E7FF8 - _021E7FD6 - 2 @ case 5
	.2byte _021E7FF8 - _021E7FD6 - 2 @ case 6
	.2byte _021E7FF8 - _021E7FD6 - 2 @ case 7
	.2byte _021E7FF4 - _021E7FD6 - 2 @ case 8
_021E7FE8:
	movs r0, #0
	pop {r3, pc}
_021E7FEC:
	movs r0, #1
	pop {r3, pc}
_021E7FF0:
	movs r0, #2
	pop {r3, pc}
_021E7FF4:
	movs r0, #3
	pop {r3, pc}
_021E7FF8:
	bl GF_AssertFail
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E7FC4

	thumb_func_start ov122_021E8004
ov122_021E8004: @ 0x021E8004
	push {r4, lr}
	adds r4, r0, #0
	bne _021E800E
	bl GF_AssertFail
_021E800E:
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E801C
	bl GF_AssertFail
_021E801C:
	movs r0, #0x52
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
	bl FUN_0200D034
	ldr r0, [r4, #0x18]
	bl FUN_0201EEB4
	ldr r3, _021E8040 @ =0x027E0000
	ldr r1, _021E8044 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E8040: .4byte 0x027E0000
_021E8044: .4byte 0x00003FF8
	thumb_func_end ov122_021E8004

	thumb_func_start ov122_021E8048
ov122_021E8048: @ 0x021E8048
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E8064 @ =0x021E931C
	add r3, sp, #0
	movs r2, #5
_021E8052:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E8052
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E8064: .4byte 0x021E931C
	thumb_func_end ov122_021E8048

	thumb_func_start ov122_021E8068
ov122_021E8068: @ 0x021E8068
	push {r3, lr}
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E808C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E8090 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_021E808C: .4byte 0xFFFFE0FF
_021E8090: .4byte 0x04001000
	thumb_func_end ov122_021E8068

	thumb_func_start ov122_021E8094
ov122_021E8094: @ 0x021E8094
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	bne _021E80A4
	bl GF_AssertFail
_021E80A4:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldr r2, _021E820C @ =0x04000304
	ldr r0, _021E8210 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	bl ov122_021E8068
	bl ov122_021E8048
	movs r1, #0xa0
	movs r0, #3
	lsls r2, r1, #0xb
	bl FUN_0201A910
	movs r1, #0x26
	adds r0, r4, #0
	lsls r1, r1, #4
	movs r2, #0xa0
	bl FUN_02007280
	movs r2, #0x26
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0xa0
	str r0, [r4]
	ldr r0, [r5]
	str r0, [r4, #4]
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #8]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl FUN_020183F0
	movs r1, #0x8a
	lsls r1, r1, #2
	strb r0, [r4, r1]
	ldr r0, [r4, #4]
	bl FUN_0202ADCC
	ldr r1, _021E8214 @ =0x00000229
	strb r0, [r4, r1]
	ldr r0, [r4, #4]
	bl FUN_0202AD3C
	ldr r1, _021E8218 @ =0x0000022A
	strb r0, [r4, r1]
	ldr r0, _021E821C @ =0x0000010A
	ldr r1, [r4]
	bl FUN_02007688
	str r0, [r4, #0x14]
	ldr r3, [r4]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x27
	bl FUN_0200BAF8
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4]
	bl FUN_0200BD08
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl FUN_0201660C
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov122_021E7928
	adds r0, r4, #0
	bl ov122_021E79D0
	adds r0, r4, #0
	bl ov122_021E7628
	adds r0, r4, #0
	bl ov122_021E73FC
	adds r0, r4, #0
	bl ov122_021E6B38
	ldr r0, [r4, #8]
	bl FUN_0202C950
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r4, #0
	movs r1, #0
	bl ov122_021E6B6C
	adds r0, r4, #0
	bl ov122_021E7AEC
	adds r0, r4, #0
	bl ov122_021E7BD4
	adds r0, r4, #0
	bl ov122_021E7D6C
	ldr r0, [r4]
	ldr r1, _021E8220 @ =0x021E950C
	movs r2, #0x10
	adds r3, r4, #0
	bl ov122_021E837C
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r1, r2, #0
	str r0, [r4, r2]
	subs r1, #0xf0
	subs r2, #0xc8
	ldr r0, [r4]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov122_021E8CFC
	movs r1, #9
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4]
	bl ov122_021E84E0
	movs r1, #0x91
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov122_021E7094
	movs r1, #0
	movs r0, #0x46
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_02002B34
	movs r0, #1
	bl FUN_02002B8C
	ldr r0, _021E8224 @ =ov122_021E8004
	adds r1, r4, #0
	bl FUN_0201A0FC
	ldr r0, [r5, #0x10]
	bl FUN_0202CF54
	movs r1, #6
	bl FUN_0202D1C0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E820C: .4byte 0x04000304
_021E8210: .4byte 0xFFFF7FFF
_021E8214: .4byte 0x00000229
_021E8218: .4byte 0x0000022A
_021E821C: .4byte 0x0000010A
_021E8220: .4byte 0x021E950C
_021E8224: .4byte ov122_021E8004
	thumb_func_end ov122_021E8094

	thumb_func_start ov122_021E8228
ov122_021E8228: @ 0x021E8228
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E84FC
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D58
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E83A8
	adds r0, r4, #0
	bl ov122_021E7B94
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	adds r0, r4, #0
	bl ov122_021E745C
	adds r0, r4, #0
	bl ov122_021E765C
	adds r0, r4, #0
	bl ov122_021E79A4
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	ldr r0, [r4, #0x14]
	bl FUN_0200770C
	bl ov122_021E8068
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0xa0
	bl FUN_0201A9C4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E8228

	thumb_func_start ov122_021E82A8
ov122_021E82A8: @ 0x021E82A8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _021E82BE
	cmp r1, #1
	beq _021E82CA
	cmp r1, #2
	beq _021E82EE
	b _021E82FC
_021E82BE:
	bl ov122_021E8094
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E8300
_021E82CA:
	bl FUN_02007290
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	movs r1, #0x15
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E8300
_021E82EE:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E8300
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E82FC:
	bl GF_AssertFail
_021E8300:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E82A8

	thumb_func_start ov122_021E8308
ov122_021E8308: @ 0x021E8308
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #0
	beq _021E8320
	cmp r1, #1
	beq _021E8340
	b _021E8354
_021E8320:
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	movs r1, #0x14
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E8358
_021E8340:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E8358
	adds r0, r5, #0
	bl ov122_021E8228
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, pc}
_021E8354:
	bl GF_AssertFail
_021E8358:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E8308

	thumb_func_start ov122_021E8360
ov122_021E8360: @ 0x021E8360
	push {r3, lr}
	bl FUN_02007290
	movs r1, #0x8f
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl ov122_021E83B0
	cmp r0, #0
	beq _021E8378
	movs r0, #1
	pop {r3, pc}
_021E8378:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E8360

	thumb_func_start ov122_021E837C
ov122_021E837C: @ 0x021E837C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r1, #0x10
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	str r5, [r4]
	strb r6, [r4, #0xc]
	ldr r0, _021E83A4 @ =0x0000FFFF
	str r7, [r4, #4]
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E83A4: .4byte 0x0000FFFF
	thumb_func_end ov122_021E837C

	thumb_func_start ov122_021E83A8
ov122_021E83A8: @ 0x021E83A8
	ldr r3, _021E83AC @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_021E83AC: .4byte FUN_0201AB0C
	thumb_func_end ov122_021E83A8

	thumb_func_start ov122_021E83B0
ov122_021E83B0: @ 0x021E83B0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #8]
	movs r1, #0x14
	ldr r3, [r4]
	muls r1, r2, r1
	adds r5, r3, r1
	ldrb r1, [r4, #0xd]
	cmp r1, #4
	bhi _021E847A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E83D0: @ jump table
	.2byte _021E83DA - _021E83D0 - 2 @ case 0
	.2byte _021E83F8 - _021E83D0 - 2 @ case 1
	.2byte _021E8408 - _021E83D0 - 2 @ case 2
	.2byte _021E8434 - _021E83D0 - 2 @ case 3
	.2byte _021E8452 - _021E83D0 - 2 @ case 4
_021E83DA:
	ldr r2, [r5]
	cmp r2, #0
	bne _021E83E6
	movs r0, #1
	strb r0, [r4, #0xd]
	b _021E83F8
_021E83E6:
	ldr r1, [r4, #4]
	blx r2
	cmp r0, #0
	beq _021E847E
	movs r0, #0
	strb r0, [r4, #0xe]
	movs r0, #1
	strb r0, [r4, #0xd]
	b _021E847E
_021E83F8:
	ldr r2, [r5, #4]
	cmp r2, #0
	beq _021E8404
	ldr r1, [r4, #4]
	adds r0, r4, #0
	blx r2
_021E8404:
	movs r0, #2
	strb r0, [r4, #0xd]
_021E8408:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _021E8412
	bl GF_AssertFail
_021E8412:
	ldr r1, [r4, #4]
	ldr r2, [r5, #8]
	adds r0, r4, #0
	blx r2
	cmp r0, #0
	beq _021E847E
	movs r0, #0
	strb r0, [r4, #0xe]
	ldr r2, [r5, #0xc]
	cmp r2, #0
	beq _021E842E
	ldr r1, [r4, #4]
	adds r0, r4, #0
	blx r2
_021E842E:
	movs r0, #3
	strb r0, [r4, #0xd]
	b _021E847E
_021E8434:
	ldr r2, [r5, #0x10]
	cmp r2, #0
	bne _021E8440
	movs r0, #4
	strb r0, [r4, #0xd]
	b _021E8452
_021E8440:
	ldr r1, [r4, #4]
	blx r2
	cmp r0, #0
	beq _021E847E
	movs r0, #0
	strb r0, [r4, #0xe]
	movs r0, #4
	strb r0, [r4, #0xd]
	b _021E847E
_021E8452:
	ldrh r1, [r4, #0xa]
	ldr r0, _021E8484 @ =0x0000FFFF
	cmp r1, r0
	bne _021E845E
	bl GF_AssertFail
_021E845E:
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #8]
	ldr r0, _021E8484 @ =0x0000FFFF
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	subs r0, r0, #1
	cmp r1, r0
	bne _021E8472
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E8472:
	movs r0, #0
	strb r0, [r4, #0xd]
	strb r0, [r4, #0xe]
	b _021E847E
_021E847A:
	bl GF_AssertFail
_021E847E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E8484: .4byte 0x0000FFFF
	thumb_func_end ov122_021E83B0

	thumb_func_start ov122_021E8488
ov122_021E8488: @ 0x021E8488
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _021E8496
	bl GF_AssertFail
_021E8496:
	ldr r0, _021E84AC @ =0x0000FFFE
	cmp r4, r0
	beq _021E84A6
	ldrb r0, [r5, #0xc]
	cmp r4, r0
	blt _021E84A6
	bl GF_AssertFail
_021E84A6:
	strh r4, [r5, #0xa]
	pop {r3, r4, r5, pc}
	nop
_021E84AC: .4byte 0x0000FFFE
	thumb_func_end ov122_021E8488

	thumb_func_start ov122_021E84B0
ov122_021E84B0: @ 0x021E84B0
	ldrh r0, [r0, #8]
	bx lr
	thumb_func_end ov122_021E84B0

	thumb_func_start ov122_021E84B4
ov122_021E84B4: @ 0x021E84B4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _021E84C2
	bl GF_AssertFail
_021E84C2:
	ldrb r0, [r4, #0xe]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E84B4

	thumb_func_start ov122_021E84C8
ov122_021E84C8: @ 0x021E84C8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _021E84D6
	bl GF_AssertFail
_021E84D6:
	ldrb r0, [r4, #0xe]
	adds r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E84C8

	thumb_func_start ov122_021E84E0
ov122_021E84E0: @ 0x021E84E0
	push {r4, lr}
	movs r1, #0x5f
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x5f
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E84E0

	thumb_func_start ov122_021E84FC
ov122_021E84FC: @ 0x021E84FC
	ldr r3, _021E8500 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_021E8500: .4byte FUN_0201AB0C
	thumb_func_end ov122_021E84FC

	thumb_func_start ov122_021E8504
ov122_021E8504: @ 0x021E8504
	push {r4, lr}
	adds r4, r0, #0
	bl ov122_021E8910
	adds r0, r4, #0
	bl ov122_021E8C34
	adds r0, r4, #0
	bl ov122_021E8968
	adds r0, r4, #0
	bl ov122_021E8A60
	adds r0, r4, #0
	bl ov122_021E8AA8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E8504

	thumb_func_start ov122_021E8528
ov122_021E8528: @ 0x021E8528
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r7, r0, #0
	bl ov122_021E87B8
	movs r0, #0x55
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r7, #0
	add r6, sp, #4
	adds r1, r0, #4
_021E853E:
	ldr r3, [r5, r0]
	ldr r2, [r5, r1]
	adds r4, r4, #1
	str r3, [r6]
	str r2, [r6, #4]
	adds r5, #8
	adds r6, #8
	cmp r4, #5
	blt _021E853E
	ldr r2, _021E8588 @ =0x0000014F
	movs r1, #0
	ldrb r0, [r7, r2]
	adds r2, #0x2d
	str r0, [sp]
	adds r0, r7, #0
	blx FUN_020D4994
	movs r0, #0x55
	lsls r0, r0, #2
	movs r6, #0
	add r4, sp, #4
	adds r5, r7, #0
	adds r1, r0, #4
_021E856C:
	ldr r3, [r4]
	ldr r2, [r4, #4]
	adds r6, r6, #1
	str r3, [r5, r0]
	str r2, [r5, r1]
	adds r4, #8
	adds r5, #8
	cmp r6, #5
	blt _021E856C
	ldr r1, _021E8588 @ =0x0000014F
	ldr r0, [sp]
	strb r0, [r7, r1]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E8588: .4byte 0x0000014F
	thumb_func_end ov122_021E8528

	thumb_func_start ov122_021E858C
ov122_021E858C: @ 0x021E858C
	movs r2, #5
	lsls r2, r2, #6
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov122_021E858C

	thumb_func_start ov122_021E8594
ov122_021E8594: @ 0x021E8594
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov122_021E8828
	adds r4, r0, #0
	cmp r4, #4
	blo _021E85AA
	bl GF_AssertFail
_021E85AA:
	cmp r4, #0
	bne _021E85B4
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_021E85B4:
	movs r1, #0x53
	lsls r1, r1, #2
	ldrb r0, [r5, r1]
	adds r0, r0, #1
	strb r0, [r5, r1]
	subs r0, r6, #2
	cmp r0, #1
	bhi _021E85CE
	subs r0, r1, #2
	ldrh r0, [r5, r0]
	adds r2, r0, #1
	subs r0, r1, #2
	strh r2, [r5, r0]
_021E85CE:
	movs r0, #0x51
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	cmp r1, #0
	bne _021E85DC
	strh r4, [r5, r0]
	pop {r4, r5, r6, pc}
_021E85DC:
	adds r2, r1, #0
	ldr r0, _021E85F0 @ =0x0000C350
	muls r2, r4, r2
	cmp r2, r0
	ble _021E85E8
	adds r2, r0, #0
_021E85E8:
	movs r0, #0x51
	lsls r0, r0, #2
	strh r2, [r5, r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E85F0: .4byte 0x0000C350
	thumb_func_end ov122_021E8594

	thumb_func_start ov122_021E85F4
ov122_021E85F4: @ 0x021E85F4
	push {r4, lr}
	bl ov122_021E8CB8
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E8606
	bl GF_AssertFail
_021E8606:
	movs r0, #1
	str r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	thumb_func_end ov122_021E85F4

	thumb_func_start ov122_021E8610
ov122_021E8610: @ 0x021E8610
	movs r2, #0x51
	lsls r2, r2, #2
	ldrh r2, [r0, r2]
	cmp r2, #0
	beq _021E862A
	subs r2, r2, r1
	bpl _021E8620
	movs r2, #0
_021E8620:
	movs r1, #0x51
	lsls r1, r1, #2
	strh r2, [r0, r1]
	movs r0, #1
	bx lr
_021E862A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov122_021E8610

	thumb_func_start ov122_021E8630
ov122_021E8630: @ 0x021E8630
	push {r3, lr}
	bl ov122_021E8CB8
	ldr r0, [r0, #8]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov122_021E8630

	thumb_func_start ov122_021E863C
ov122_021E863C: @ 0x021E863C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x51
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	adds r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r1, r0
	bls _021E8652
	bl GF_AssertFail
_021E8652:
	movs r0, #0x51
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	adds r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r1, r0
	bne _021E8664
	movs r0, #1
	pop {r4, pc}
_021E8664:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E863C

	thumb_func_start ov122_021E8668
ov122_021E8668: @ 0x021E8668
	push {r3, lr}
	bl ov122_021E8CB8
	ldr r0, [r0]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov122_021E8668

	thumb_func_start ov122_021E8674
ov122_021E8674: @ 0x021E8674
	push {r4, lr}
	adds r4, r2, #0
	bl ov122_021E8CB8
	ldr r0, [r0, #4]
	ands r0, r4
	cmp r4, r0
	bne _021E8688
	movs r0, #1
	pop {r4, pc}
_021E8688:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E8674

	thumb_func_start ov122_021E868C
ov122_021E868C: @ 0x021E868C
	push {r4, lr}
	adds r4, r2, #0
	bl ov122_021E8CB8
	ldr r1, [r0, #4]
	adds r2, r1, #0
	tst r2, r4
	beq _021E86A2
	subs r1, r1, r4
	str r1, [r0, #4]
	pop {r4, pc}
_021E86A2:
	orrs r1, r4
	str r1, [r0, #4]
	pop {r4, pc}
	thumb_func_end ov122_021E868C

	thumb_func_start ov122_021E86A8
ov122_021E86A8: @ 0x021E86A8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r6, #5
	blo _021E86B8
	bl GF_AssertFail
_021E86B8:
	cmp r4, #0
	beq _021E86C2
	cmp r4, #1
	beq _021E86CC
	b _021E86D4
_021E86C2:
	movs r0, #0x4b
	adds r1, r5, r6
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E86CC:
	ldr r0, _021E86DC @ =0x00000131
	adds r1, r5, r6
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E86D4:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E86DC: .4byte 0x00000131
	thumb_func_end ov122_021E86A8

	thumb_func_start ov122_021E86E0
ov122_021E86E0: @ 0x021E86E0
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r6, #5
	blo _021E86F0
	bl GF_AssertFail
_021E86F0:
	cmp r4, #0
	beq _021E86FA
	cmp r4, #1
	beq _021E8702
	b _021E870A
_021E86FA:
	ldr r0, _021E8714 @ =0x00000136
	adds r1, r5, r6
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E8702:
	ldr r0, _021E8718 @ =0x0000013B
	adds r1, r5, r6
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E870A:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E8714: .4byte 0x00000136
_021E8718: .4byte 0x0000013B
	thumb_func_end ov122_021E86E0

	thumb_func_start ov122_021E871C
ov122_021E871C: @ 0x021E871C
	push {r4, lr}
	movs r4, #0
	cmp r1, #0
	beq _021E872A
	cmp r1, #1
	beq _021E8748
	b _021E8766
_021E872A:
	movs r3, #0xc
	muls r3, r2, r3
	adds r1, r4, #0
	adds r2, r0, r3
_021E8732:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _021E873E
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_021E873E:
	adds r1, r1, #1
	adds r2, #0x3c
	cmp r1, #5
	blt _021E8732
	b _021E876A
_021E8748:
	movs r3, #0x3c
	muls r3, r2, r3
	adds r1, r4, #0
	adds r2, r0, r3
_021E8750:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _021E875C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_021E875C:
	adds r1, r1, #1
	adds r2, #0xc
	cmp r1, #5
	blt _021E8750
	b _021E876A
_021E8766:
	bl GF_AssertFail
_021E876A:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E871C

	thumb_func_start ov122_021E8770
ov122_021E8770: @ 0x021E8770
	movs r1, #0x51
	lsls r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov122_021E8770

	thumb_func_start ov122_021E8778
ov122_021E8778: @ 0x021E8778
	movs r1, #0x52
	lsls r1, r1, #2
	ldrh r0, [r0, r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	thumb_func_end ov122_021E8778

	thumb_func_start ov122_021E8784
ov122_021E8784: @ 0x021E8784
	ldr r1, _021E8790 @ =0x0000014A
	ldrh r0, [r0, r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	nop
_021E8790: .4byte 0x0000014A
	thumb_func_end ov122_021E8784

	thumb_func_start ov122_021E8794
ov122_021E8794: @ 0x021E8794
	ldr r1, _021E879C @ =0x0000014E
	ldrb r0, [r0, r1]
	bx lr
	nop
_021E879C: .4byte 0x0000014E
	thumb_func_end ov122_021E8794

	thumb_func_start ov122_021E87A0
ov122_021E87A0: @ 0x021E87A0
	push {r4, lr}
	adds r4, r0, #0
	bl ov122_021E8808
	ldrb r1, [r0, #6]
	ldr r0, _021E87B4 @ =0x0000014E
	ldrb r0, [r4, r0]
	subs r0, r1, r0
	pop {r4, pc}
	nop
_021E87B4: .4byte 0x0000014E
	thumb_func_end ov122_021E87A0

	thumb_func_start ov122_021E87B8
ov122_021E87B8: @ 0x021E87B8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021E8804 @ =0x0000014F
	ldrb r0, [r4, r0]
	cmp r0, #5
	blo _021E87C8
	bl GF_AssertFail
_021E87C8:
	movs r2, #0x55
	lsls r2, r2, #2
	subs r1, r2, #5
	ldrb r1, [r4, r1]
	adds r3, r2, #0
	subs r3, #0x14
	ldr r3, [r4, r3]
	adds r0, r4, r2
	lsls r5, r1, #3
	adds r1, r0, r5
	str r3, [r0, r5]
	adds r0, r2, #0
	subs r0, #8
	ldrb r0, [r4, r0]
	strb r0, [r1, #4]
	subs r0, r2, #7
	ldrb r0, [r4, r0]
	strb r0, [r1, #5]
	subs r0, r2, #6
	ldrb r0, [r4, r0]
	strb r0, [r1, #6]
	subs r0, r2, #5
	ldrb r0, [r4, r0]
	movs r1, #5
	adds r0, r0, #1
	blx FUN_020F2998
	ldr r0, _021E8804 @ =0x0000014F
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8804: .4byte 0x0000014F
	thumb_func_end ov122_021E87B8

	thumb_func_start ov122_021E8808
ov122_021E8808: @ 0x021E8808
	ldr r1, _021E8824 @ =0x0000014F
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021E8814
	movs r2, #4
	b _021E8816
_021E8814:
	subs r2, r1, #1
_021E8816:
	movs r1, #0x55
	lsls r1, r1, #2
	adds r1, r0, r1
	lsls r0, r2, #3
	adds r0, r1, r0
	bx lr
	nop
_021E8824: .4byte 0x0000014F
	thumb_func_end ov122_021E8808

	thumb_func_start ov122_021E8828
ov122_021E8828: @ 0x021E8828
	cmp r0, #1
	beq _021E8836
	cmp r0, #2
	beq _021E883A
	cmp r0, #3
	beq _021E883E
	b _021E8842
_021E8836:
	movs r0, #1
	bx lr
_021E883A:
	movs r0, #2
	bx lr
_021E883E:
	movs r0, #3
	bx lr
_021E8842:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov122_021E8828

	thumb_func_start ov122_021E8848
ov122_021E8848: @ 0x021E8848
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov122_021E8808
	ldr r2, [r0]
	cmp r2, #2
	bne _021E8860
	ldrb r1, [r0, #5]
	cmp r1, #0x46
	blo _021E8860
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E8860:
	ldrb r1, [r0, #5]
	cmp r1, #0x28
	blo _021E888A
	movs r3, #0x55
	lsls r3, r3, #2
	movs r5, #0
	adds r4, r4, r3
_021E886E:
	ldrb r3, [r4, #4]
	cmp r3, #8
	blo _021E8882
	ldr r3, [r4]
	cmp r3, #3
	beq _021E8882
	adds r5, r5, #1
	adds r4, #8
	cmp r5, #5
	blt _021E886E
_021E8882:
	cmp r5, #5
	bne _021E888A
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E888A:
	cmp r1, #0x3c
	blo _021E8894
	ldrb r3, [r0, #4]
	cmp r3, #7
	bhs _021E889C
_021E8894:
	cmp r1, #0x32
	blo _021E88A0
	cmp r2, #2
	bne _021E88A0
_021E889C:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E88A0:
	cmp r1, #0x32
	blo _021E88AA
	ldrb r3, [r0, #4]
	cmp r3, #6
	bhs _021E88B2
_021E88AA:
	cmp r1, #0x28
	blo _021E88B6
	cmp r2, #2
	bne _021E88B6
_021E88B2:
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E88B6:
	cmp r1, #0x28
	blo _021E88C0
	ldrb r3, [r0, #4]
	cmp r3, #5
	bhs _021E88C8
_021E88C0:
	cmp r1, #0x1e
	blo _021E88CC
	cmp r2, #2
	bne _021E88CC
_021E88C8:
	movs r0, #3
	pop {r3, r4, r5, pc}
_021E88CC:
	cmp r1, #0x1e
	blo _021E88D6
	ldrb r3, [r0, #4]
	cmp r3, #4
	bhs _021E88DE
_021E88D6:
	cmp r1, #0x14
	blo _021E88E2
	cmp r2, #2
	bne _021E88E2
_021E88DE:
	movs r0, #4
	pop {r3, r4, r5, pc}
_021E88E2:
	cmp r1, #0x14
	blo _021E88EC
	ldrb r3, [r0, #4]
	cmp r3, #3
	bhs _021E88F4
_021E88EC:
	cmp r1, #0xa
	blo _021E88F8
	cmp r2, #2
	bne _021E88F8
_021E88F4:
	movs r0, #5
	pop {r3, r4, r5, pc}
_021E88F8:
	cmp r1, #0xa
	blo _021E8902
	ldrb r0, [r0, #4]
	cmp r0, #2
	bhs _021E8906
_021E8902:
	cmp r2, #2
	bne _021E890A
_021E8906:
	movs r0, #6
	pop {r3, r4, r5, pc}
_021E890A:
	movs r0, #7
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E8848

	thumb_func_start ov122_021E8910
ov122_021E8910: @ 0x021E8910
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl FUN_0201FDB8
	movs r1, #0x64
	blx FUN_020F2BA4
	adds r0, r7, #0
	adds r6, r1, #0
	bl ov122_021E8848
	str r0, [sp]
	cmp r0, #8
	blt _021E8930
	bl GF_AssertFail
_021E8930:
	ldr r0, [sp]
	movs r1, #0x50
	ldr r2, _021E8960 @ =0x021E978C
	muls r1, r0, r1
	movs r4, #0
	adds r5, r2, r1
_021E893C:
	ldrb r0, [r5]
	cmp r6, r0
	blt _021E8952
	cmp r4, #0x50
	blt _021E894A
	bl GF_AssertFail
_021E894A:
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r4, #0x50
	blt _021E893C
_021E8952:
	ldr r1, _021E8964 @ =0x0000014E
	ldr r0, [sp]
	strb r0, [r7, r1]
	subs r0, r1, #1
	strb r4, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8960: .4byte 0x021E978C
_021E8964: .4byte 0x0000014E
	thumb_func_end ov122_021E8910

	thumb_func_start ov122_021E8968
ov122_021E8968: @ 0x021E8968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp]
	ldr r7, _021E89F4 @ =0x00000131
	str r0, [sp, #8]
_021E8978:
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	ldr r5, [sp, #8]
	adds r4, r1, r0
	movs r1, #0
	ldr r0, _021E89F4 @ =0x00000131
	adds r6, r1, #0
	strb r1, [r4, r0]
_021E8988:
	ldr r0, [r5]
	bl ov122_021E8828
	ldrb r1, [r4, r7]
	adds r6, r6, #1
	adds r5, #0xc
	adds r0, r1, r0
	strb r0, [r4, r7]
	cmp r6, #5
	blt _021E8988
	ldr r0, [sp, #8]
	adds r0, #0x3c
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _021E8978
	movs r0, #0
	movs r7, #0x4b
	str r0, [sp, #4]
	str r0, [sp, #0xc]
	lsls r7, r7, #2
_021E89B6:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	adds r4, r1, r0
	movs r0, #0x4b
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
	adds r6, r1, #0
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	adds r5, r1, r0
_021E89CC:
	ldr r0, [r5]
	bl ov122_021E8828
	ldrb r1, [r4, r7]
	adds r6, r6, #1
	adds r5, #0x3c
	adds r0, r1, r0
	strb r0, [r4, r7]
	cmp r6, #5
	blt _021E89CC
	ldr r0, [sp, #0xc]
	adds r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _021E89B6
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E89F4: .4byte 0x00000131
	thumb_func_end ov122_021E8968

	thumb_func_start ov122_021E89F8
ov122_021E89F8: @ 0x021E89F8
	push {r4, r5, r6, r7}
	ldr r1, _021E8A58 @ =0x0000013B
	movs r3, #0
	adds r5, r0, #0
_021E8A00:
	ldr r4, _021E8A58 @ =0x0000013B
	adds r2, r0, r3
	movs r6, #0
	strb r6, [r2, r4]
	adds r4, r6, #0
	adds r6, r5, #0
_021E8A0C:
	ldr r7, [r6]
	cmp r7, #4
	bne _021E8A18
	ldrb r7, [r2, r1]
	adds r7, r7, #1
	strb r7, [r2, r1]
_021E8A18:
	adds r4, r4, #1
	adds r6, #0xc
	cmp r4, #5
	blt _021E8A0C
	adds r3, r3, #1
	adds r5, #0x3c
	cmp r3, #5
	blt _021E8A00
	movs r6, #0
	ldr r1, _021E8A5C @ =0x00000136
	adds r3, r6, #0
_021E8A2E:
	ldr r4, _021E8A5C @ =0x00000136
	adds r2, r0, r6
	movs r5, #0
	strb r5, [r2, r4]
	adds r4, r0, r3
_021E8A38:
	ldr r7, [r4]
	cmp r7, #4
	bne _021E8A44
	ldrb r7, [r2, r1]
	adds r7, r7, #1
	strb r7, [r2, r1]
_021E8A44:
	adds r5, r5, #1
	adds r4, #0x3c
	cmp r5, #5
	blt _021E8A38
	adds r6, r6, #1
	adds r3, #0xc
	cmp r6, #5
	blt _021E8A2E
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_021E8A58: .4byte 0x0000013B
_021E8A5C: .4byte 0x00000136
	thumb_func_end ov122_021E89F8

	thumb_func_start ov122_021E8A60
ov122_021E8A60: @ 0x021E8A60
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r5, #1
	movs r4, #0
_021E8A68:
	lsls r1, r4, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl ov122_021E8CB8
	adds r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	bne _021E8A7E
	bl GF_AssertFail
_021E8A7E:
	ldr r0, [r6]
	cmp r0, #4
	beq _021E8A8C
	bl ov122_021E8828
	muls r0, r5, r0
	adds r5, r0, #0
_021E8A8C:
	adds r4, r4, #1
	cmp r4, #0x19
	blt _021E8A68
	ldr r0, _021E8AA0 @ =0x0000C350
	cmp r5, r0
	ble _021E8A9A
	adds r5, r0, #0
_021E8A9A:
	ldr r0, _021E8AA4 @ =0x00000146
	strh r5, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8AA0: .4byte 0x0000C350
_021E8AA4: .4byte 0x00000146
	thumb_func_end ov122_021E8A60

	thumb_func_start ov122_021E8AA8
ov122_021E8AA8: @ 0x021E8AA8
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x52
	adds r5, r0, #0
	movs r4, #0
	lsls r7, r7, #2
_021E8AB2:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov122_021E8CB8
	adds r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	bne _021E8AC8
	bl GF_AssertFail
_021E8AC8:
	ldr r0, [r6]
	subs r0, r0, #2
	cmp r0, #1
	bhi _021E8AD6
	ldrh r0, [r5, r7]
	adds r0, r0, #1
	strh r0, [r5, r7]
_021E8AD6:
	adds r4, r4, #1
	cmp r4, #0x19
	blt _021E8AB2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E8AA8

	thumb_func_start ov122_021E8AE0
ov122_021E8AE0: @ 0x021E8AE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r6, #0
	adds r7, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	adds r5, r3, #0
	adds r4, r6, #0
	cmp r7, #0
	ble _021E8B2E
_021E8AF4:
	cmp r5, #0
	beq _021E8B06
	bl FUN_0201FDB8
	movs r1, #0x19
	blx FUN_020F2BA4
	lsls r0, r1, #0x18
	b _021E8B08
_021E8B06:
	lsls r0, r4, #0x18
_021E8B08:
	lsrs r1, r0, #0x18
	ldr r0, [sp]
	bl ov122_021E8CB8
	ldr r1, [r0]
	cmp r1, #1
	beq _021E8B1A
	cmp r5, #0
	bne _021E8B20
_021E8B1A:
	ldr r1, [sp, #4]
	str r1, [r0]
	b _021E8B28
_021E8B20:
	adds r6, r6, #1
	cmp r6, #0x64
	bge _021E8B2E
	subs r4, r4, #1
_021E8B28:
	adds r4, r4, #1
	cmp r4, r7
	blt _021E8AF4
_021E8B2E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov122_021E8AE0

	thumb_func_start ov122_021E8B34
ov122_021E8B34: @ 0x021E8B34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	movs r1, #0
	add r0, sp, #0x10
	str r1, [sp]
	adds r0, #1
	strb r1, [r0]
	ldr r1, [sp]
	strb r1, [r0, #1]
	ldr r1, [sp]
	strb r1, [r0, #2]
	ldr r1, [sp]
	strb r1, [r0, #3]
	ldr r1, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp]
	add r0, sp, #0xc
	strb r1, [r0]
	ldr r1, [sp]
	strb r1, [r0, #1]
	ldr r1, [sp]
	strb r1, [r0, #2]
	ldr r1, [sp]
	strb r1, [r0, #3]
	ldr r1, [sp]
	strb r1, [r0, #4]
	ldr r0, _021E8C2C @ =0x0000014D
	ldr r1, _021E8C30 @ =0x021E964C
	ldrb r0, [r7, r0]
	ldr r4, [sp]
	lsls r0, r0, #2
	adds r0, r1, r0
	str r0, [sp, #4]
_021E8B78:
	lsls r1, r4, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl ov122_021E8CB8
	ldr r0, [r0]
	subs r0, r0, #2
	cmp r0, #1
	bhi _021E8BE4
	adds r0, r4, #0
	movs r1, #5
	blx FUN_020F2998
	adds r5, r1, #0
	adds r0, r4, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r2, r5, #0x18
	adds r6, r0, #0
	adds r0, r7, #0
	movs r1, #0
	lsrs r2, r2, #0x18
	bl ov122_021E86E0
	lsls r2, r6, #0x18
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #1
	lsrs r2, r2, #0x18
	bl ov122_021E86E0
	cmp r0, #0
	beq _021E8BC2
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _021E8BE4
_021E8BC2:
	add r0, sp, #0x10
	adds r0, #1
	ldrb r0, [r0, r5]
	adds r1, r0, #1
	add r0, sp, #0x10
	adds r0, #1
	strb r1, [r0, r5]
	add r0, sp, #0xc
	ldrb r0, [r0, r6]
	adds r1, r0, #1
	add r0, sp, #0xc
	strb r1, [r0, r6]
	ldr r0, [sp]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
_021E8BE4:
	adds r4, r4, #1
	cmp r4, #0x19
	blt _021E8B78
	ldr r0, [sp, #4]
	ldrb r1, [r0, #3]
	lsls r0, r1, #0x18
	lsrs r2, r0, #0x1c
	ldr r0, [sp]
	cmp r2, r0
	bhi _021E8BFE
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E8BFE:
	add r2, sp, #0x10
	lsls r0, r1, #0x1c
	movs r4, #0
	adds r2, #1
	add r3, sp, #0xc
	lsrs r1, r0, #0x1c
_021E8C0A:
	ldrb r0, [r2]
	cmp r1, r0
	bls _021E8C16
	ldrb r0, [r3]
	cmp r1, r0
	bhi _021E8C1C
_021E8C16:
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E8C1C:
	adds r4, r4, #1
	adds r2, r2, #1
	adds r3, r3, #1
	cmp r4, #5
	blt _021E8C0A
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8C2C: .4byte 0x0000014D
_021E8C30: .4byte 0x021E964C
	thumb_func_end ov122_021E8B34

	thumb_func_start ov122_021E8C34
ov122_021E8C34: @ 0x021E8C34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _021E8CA8 @ =0x0000014D
	ldrb r0, [r5, r0]
	cmp r0, #0x50
	blo _021E8C44
	bl GF_AssertFail
_021E8C44:
	ldr r0, _021E8CA8 @ =0x0000014D
	movs r4, #0
	ldrb r0, [r5, r0]
	lsls r1, r0, #2
	ldr r0, _021E8CAC @ =0x021E964C
	ldrb r0, [r0, r1]
	str r0, [sp]
	ldr r0, _021E8CB0 @ =0x021E964D
	ldrb r7, [r0, r1]
	ldr r0, _021E8CB4 @ =0x021E964E
	ldrb r6, [r0, r1]
_021E8C5A:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x19
	movs r3, #0
	bl ov122_021E8AE0
	ldr r2, [sp]
	adds r0, r5, #0
	movs r1, #4
	movs r3, #1
	bl ov122_021E8AE0
	adds r0, r5, #0
	movs r1, #2
	adds r2, r7, #0
	movs r3, #1
	bl ov122_021E8AE0
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	movs r3, #1
	bl ov122_021E8AE0
	adds r0, r5, #0
	bl ov122_021E89F8
	adds r0, r5, #0
	bl ov122_021E8B34
	cmp r0, #0
	beq _021E8CA4
	movs r0, #0xfa
	adds r4, r4, #1
	lsls r0, r0, #2
	cmp r4, r0
	blt _021E8C5A
_021E8CA4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8CA8: .4byte 0x0000014D
_021E8CAC: .4byte 0x021E964C
_021E8CB0: .4byte 0x021E964D
_021E8CB4: .4byte 0x021E964E
	thumb_func_end ov122_021E8C34

	thumb_func_start ov122_021E8CB8
ov122_021E8CB8: @ 0x021E8CB8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	cmp r5, #0x19
	blo _021E8CC6
	bl GF_AssertFail
_021E8CC6:
	adds r0, r5, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	movs r1, #5
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	cmp r4, #5
	blo _021E8CE6
	bl GF_AssertFail
_021E8CE6:
	cmp r5, #5
	blo _021E8CEE
	bl GF_AssertFail
_021E8CEE:
	movs r0, #0x3c
	muls r0, r4, r0
	adds r1, r6, r0
	movs r0, #0xc
	muls r0, r5, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E8CB8

	thumb_func_start ov122_021E8CFC
ov122_021E8CFC: @ 0x021E8CFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r0, #0
	adds r7, r2, #0
	cmp r5, #0
	bne _021E8D0E
	bl GF_AssertFail
_021E8D0E:
	adds r0, r6, #0
	movs r1, #0x10
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	str r5, [r4]
	str r7, [r4, #4]
	movs r0, #1
	str r0, [sp]
	ldrb r0, [r4, #0xd]
	ldr r1, _021E8D4C @ =0x021E9AAC
	ldr r2, _021E8D50 @ =0x021E9A0C
	str r0, [sp, #4]
	ldr r0, _021E8D54 @ =0x021E9A3C
	str r6, [sp, #8]
	adds r3, r4, #0
	bl FUN_02019BA4
	str r0, [r4, #8]
	adds r0, r4, #0
	movs r1, #0
	bl ov122_021E9108
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E8D4C: .4byte 0x021E9AAC
_021E8D50: .4byte 0x021E9A0C
_021E8D54: .4byte 0x021E9A3C
	thumb_func_end ov122_021E8CFC

	thumb_func_start ov122_021E8D58
ov122_021E8D58: @ 0x021E8D58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E8D66
	bl GF_AssertFail
_021E8D66:
	ldr r0, [r4, #8]
	bl FUN_02019BDC
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov122_021E8D58

	thumb_func_start ov122_021E8D74
ov122_021E8D74: @ 0x021E8D74
	push {r3, lr}
	ldrb r1, [r0, #0xf]
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	beq _021E8D84
	bl ov122_021E8F6C
	pop {r3, pc}
_021E8D84:
	bl ov122_021E9020
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov122_021E8D74

	thumb_func_start ov122_021E8D8C
ov122_021E8D8C: @ 0x021E8D8C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	ldr r0, [r4]
	beq _021E8D9E
	movs r1, #1
	bl FUN_0200DCE8
	pop {r4, pc}
_021E8D9E:
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0
	strb r0, [r4, #0xd]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E8D8C

	thumb_func_start ov122_021E8DAC
ov122_021E8DAC: @ 0x021E8DAC
	ldrb r2, [r0, #0xf]
	movs r3, #1
	lsls r1, r1, #0x18
	bics r2, r3
	lsrs r3, r1, #0x18
	movs r1, #1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, #0xf]
	ldr r3, _021E8DC4 @ =ov122_021E9154
	ldrb r1, [r0, #0xd]
	bx r3
	.align 2, 0
_021E8DC4: .4byte ov122_021E9154
	thumb_func_end ov122_021E8DAC

	thumb_func_start ov122_021E8DC8
ov122_021E8DC8: @ 0x021E8DC8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #0xf]
	movs r2, #2
	bics r1, r2
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1e
	orrs r1, r2
	strb r1, [r5, #0xf]
	ldrb r1, [r5, #0xd]
	bl ov122_021E9154
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E8DC8

	thumb_func_start ov122_021E8DF0
ov122_021E8DF0: @ 0x021E8DF0
	push {r4, lr}
	adds r4, r0, #0
	bne _021E8DFA
	bl GF_AssertFail
_021E8DFA:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E8E04
	bl GF_AssertFail
_021E8E04:
	ldr r0, [r4, #8]
	bl FUN_02019F74
	pop {r4, pc}
	thumb_func_end ov122_021E8DF0

	thumb_func_start ov122_021E8E0C
ov122_021E8E0C: @ 0x021E8E0C
	push {r4, lr}
	adds r4, r0, #0
	bne _021E8E16
	bl GF_AssertFail
_021E8E16:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E8E20
	bl GF_AssertFail
_021E8E20:
	ldrb r0, [r4, #0xe]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	pop {r4, pc}
	thumb_func_end ov122_021E8E0C

	thumb_func_start ov122_021E8E28
ov122_021E8E28: @ 0x021E8E28
	push {r3, lr}
	ldr r0, [r0, #8]
	bl FUN_02019F74
	cmp r0, #0x19
	beq _021E8E3C
	cmp r0, #0x1a
	beq _021E8E3C
	movs r0, #1
	pop {r3, pc}
_021E8E3C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E8E28

	thumb_func_start ov122_021E8E40
ov122_021E8E40: @ 0x021E8E40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0
	bl ov122_021E9108
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov122_021E8E40

	thumb_func_start ov122_021E8E58
ov122_021E8E58: @ 0x021E8E58
	ldrb r2, [r0, #0xe]
	movs r1, #0xf
	ldr r3, _021E8E6C @ =ov122_021E9134
	bics r2, r1
	strb r2, [r0, #0xe]
	ldrb r2, [r0, #0xe]
	movs r1, #0xf0
	bics r2, r1
	strb r2, [r0, #0xe]
	bx r3
	.align 2, 0
_021E8E6C: .4byte ov122_021E9134
	thumb_func_end ov122_021E8E58

	thumb_func_start ov122_021E8E70
ov122_021E8E70: @ 0x021E8E70
	ldrb r0, [r0, #0xf]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	bx lr
	thumb_func_end ov122_021E8E70

	thumb_func_start ov122_021E8E78
ov122_021E8E78: @ 0x021E8E78
	push {r4, lr}
	adds r1, r0, #0
	ldrb r3, [r1, #0xe]
	ldr r2, _021E8F50 @ =0x021D110C
	movs r4, #0x80
	lsls r0, r3, #0x1c
	ldr r2, [r2, #0x4c]
	lsrs r0, r0, #0x1c
	tst r4, r2
	beq _021E8EA8
	adds r4, r0, #2
	cmp r4, #4
	ble _021E8E94
	movs r4, #4
_021E8E94:
	ldrb r2, [r1, #0xe]
	movs r3, #0xf
	bics r2, r3
	lsls r3, r4, #0x18
	lsrs r4, r3, #0x18
	movs r3, #0xf
	ands r3, r4
	orrs r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8EA8:
	movs r4, #0x20
	tst r4, r2
	beq _021E8EC8
	subs r4, r0, #1
	bpl _021E8EB4
	movs r4, #0
_021E8EB4:
	ldrb r2, [r1, #0xe]
	movs r3, #0xf
	bics r2, r3
	lsls r3, r4, #0x18
	lsrs r4, r3, #0x18
	movs r3, #0xf
	ands r3, r4
	orrs r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8EC8:
	movs r4, #0x40
	tst r4, r2
	beq _021E8F0A
	cmp r0, #4
	bne _021E8EF0
	lsls r2, r3, #0x18
	lsrs r2, r2, #0x1c
	adds r4, r2, #0
	adds r4, #0xfe
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #1
	bhi _021E8EF0
	movs r4, #0xf
	bics r3, r4
	movs r4, #0xf
	ands r2, r4
	orrs r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8EF0:
	subs r4, r0, #2
	bpl _021E8EF6
	movs r4, #0
_021E8EF6:
	ldrb r2, [r1, #0xe]
	movs r3, #0xf
	bics r2, r3
	lsls r3, r4, #0x18
	lsrs r4, r3, #0x18
	movs r3, #0xf
	ands r3, r4
	orrs r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8F0A:
	movs r3, #0x10
	tst r2, r3
	beq _021E8F2A
	adds r4, r0, #1
	cmp r4, #4
	ble _021E8F18
	movs r4, #4
_021E8F18:
	ldrb r2, [r1, #0xe]
	movs r3, #0xf
	bics r2, r3
	lsls r3, r4, #0x18
	lsrs r4, r3, #0x18
	movs r3, #0xf
	ands r3, r4
	orrs r2, r3
	strb r2, [r1, #0xe]
_021E8F2A:
	ldrb r3, [r1, #0xe]
	lsls r2, r3, #0x1c
	lsrs r2, r2, #0x1c
	cmp r0, r2
	beq _021E8F4C
	movs r2, #0xf0
	lsls r0, r0, #0x1c
	bics r3, r2
	lsrs r0, r0, #0x18
	orrs r0, r3
	strb r0, [r1, #0xe]
	adds r0, r1, #0
	bl ov122_021E9134
	ldr r0, _021E8F54 @ =0x000005DC
	bl FUN_0200604C
_021E8F4C:
	pop {r4, pc}
	nop
_021E8F50: .4byte 0x021D110C
_021E8F54: .4byte 0x000005DC
	thumb_func_end ov122_021E8E78

	thumb_func_start ov122_021E8F58
ov122_021E8F58: @ 0x021E8F58
	ldrb r2, [r0, #0xe]
	movs r1, #0xf
	ldr r3, _021E8F68 @ =ov122_021E9134
	bics r2, r1
	movs r1, #4
	orrs r1, r2
	strb r1, [r0, #0xe]
	bx r3
	.align 2, 0
_021E8F68: .4byte ov122_021E9134
	thumb_func_end ov122_021E8F58

	thumb_func_start ov122_021E8F6C
ov122_021E8F6C: @ 0x021E8F6C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r2, [r4, #0xf]
	movs r1, #4
	bics r2, r1
	strb r2, [r4, #0xf]
	ldr r1, _021E9018 @ =0x021D110C
	movs r2, #1
	ldr r1, [r1, #0x48]
	lsls r2, r2, #0xa
	tst r2, r1
	beq _021E8F88
	movs r0, #4
	pop {r4, pc}
_021E8F88:
	movs r2, #2
	tst r2, r1
	beq _021E8F96
	bl ov122_021E8F58
	movs r0, #3
	pop {r4, pc}
_021E8F96:
	movs r2, #1
	tst r1, r2
	beq _021E8FB2
	ldrb r1, [r4, #0xe]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	cmp r1, #4
	bne _021E8FAE
	bl ov122_021E8F58
	movs r0, #3
	pop {r4, pc}
_021E8FAE:
	adds r0, r2, #0
	pop {r4, pc}
_021E8FB2:
	bl ov122_021E8E78
	ldrb r1, [r4, #0xf]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4, #0xf]
	ldr r0, _021E901C @ =0x021E9A1C
	bl FUN_02025224
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bhs _021E9012
	cmp r0, #4
	beq _021E8FDA
	cmp r0, #5
	beq _021E8FF2
	cmp r0, #6
	beq _021E8FF6
	b _021E8FFA
_021E8FDA:
	ldrb r2, [r4, #0xe]
	movs r1, #0xf
	bics r2, r1
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	bl ov122_021E9134
	movs r0, #3
	pop {r4, pc}
_021E8FF2:
	movs r0, #4
	pop {r4, pc}
_021E8FF6:
	movs r0, #2
	pop {r4, pc}
_021E8FFA:
	ldrb r2, [r4, #0xe]
	movs r1, #0xf
	bics r2, r1
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #0xe]
	adds r0, r4, #0
	bl ov122_021E9134
	movs r0, #1
	pop {r4, pc}
_021E9012:
	movs r0, #0
	pop {r4, pc}
	nop
_021E9018: .4byte 0x021D110C
_021E901C: .4byte 0x021E9A1C
	thumb_func_end ov122_021E8F6C

	thumb_func_start ov122_021E9020
ov122_021E9020: @ 0x021E9020
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02019F74
	adds r6, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02019D18
	adds r5, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02019F74
	cmp r5, #0x1c
	bhs _021E9082
	bl FUN_02025358
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r4, #0xf]
	movs r2, #4
	lsrs r0, r0, #0x1d
	bics r1, r2
	orrs r0, r1
	strb r0, [r4, #0xf]
	cmp r5, #0x19
	bne _021E9076
	ldrb r0, [r4, #0xf]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	beq _021E906C
	strb r6, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #8]
	bl FUN_02019F7C
	b _021E9072
_021E906C:
	adds r0, r4, #0
	bl ov122_021E8E40
_021E9072:
	movs r0, #4
	pop {r4, r5, r6, pc}
_021E9076:
	cmp r5, #0x1a
	bne _021E907E
	movs r0, #2
	pop {r4, r5, r6, pc}
_021E907E:
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E9082:
	ldrb r1, [r4, #0xf]
	movs r0, #4
	bics r1, r0
	ldr r0, _021E9100 @ =0x021D110C
	strb r1, [r4, #0xf]
	ldr r1, [r0, #0x48]
	movs r0, #1
	lsls r0, r0, #0xa
	tst r0, r1
	beq _021E90AC
	ldrb r0, [r4, #0xd]
	adds r0, #0xe7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _021E90A8
	adds r0, r4, #0
	bl ov122_021E8E40
_021E90A8:
	movs r0, #4
	pop {r4, r5, r6, pc}
_021E90AC:
	movs r0, #2
	tst r0, r1
	beq _021E90B6
	movs r0, #3
	pop {r4, r5, r6, pc}
_021E90B6:
	ldrb r0, [r4, #0xf]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E90FA
	ldrb r0, [r4, #0xd]
	cmp r0, #0x19
	beq _021E90FA
	cmp r0, #0x1a
	beq _021E90FA
	ldr r0, _021E9104 @ =0x021E9A1C
	bl FUN_02025224
	cmp r0, #8
	bhs _021E90FA
	cmp r0, #3
	bhi _021E90FA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E90E2: @ jump table
	.2byte _021E90EA - _021E90E2 - 2 @ case 0
	.2byte _021E90EE - _021E90E2 - 2 @ case 1
	.2byte _021E90F2 - _021E90E2 - 2 @ case 2
	.2byte _021E90F6 - _021E90E2 - 2 @ case 3
_021E90EA:
	movs r0, #5
	pop {r4, r5, r6, pc}
_021E90EE:
	movs r0, #6
	pop {r4, r5, r6, pc}
_021E90F2:
	movs r0, #7
	pop {r4, r5, r6, pc}
_021E90F6:
	movs r0, #8
	pop {r4, r5, r6, pc}
_021E90FA:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E9100: .4byte 0x021D110C
_021E9104: .4byte 0x021E9A1C
	thumb_func_end ov122_021E9020

	thumb_func_start ov122_021E9108
ov122_021E9108: @ 0x021E9108
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov122_021E9154
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	add r2, sp, #0
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5]
	bl FUN_0200DDB8
	strb r4, [r5, #0xd]
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E9108

	thumb_func_start ov122_021E9134
ov122_021E9134: @ 0x021E9134
	ldrb r1, [r0, #0xe]
	ldr r2, _021E9148 @ =0x021E9BA1
	ldr r0, [r0, #4]
	lsls r1, r1, #0x1c
	lsrs r3, r1, #0x1b
	ldr r1, _021E914C @ =0x021E9BA0
	ldrb r2, [r2, r3]
	ldrb r1, [r1, r3]
	ldr r3, _021E9150 @ =FUN_0200DDB8
	bx r3
	.align 2, 0
_021E9148: .4byte 0x021E9BA1
_021E914C: .4byte 0x021E9BA0
_021E9150: .4byte FUN_0200DDB8
	thumb_func_end ov122_021E9134

	thumb_func_start ov122_021E9154
ov122_021E9154: @ 0x021E9154
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #0x19
	bge _021E9176
	ldrb r0, [r5, #0xf]
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	beq _021E9168
	movs r4, #0x18
	b _021E9188
_021E9168:
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E9172
	movs r4, #0x17
	b _021E9188
_021E9172:
	movs r4, #0x12
	b _021E9188
_021E9176:
	bne _021E917C
	movs r4, #7
	b _021E9188
_021E917C:
	cmp r1, #0x1a
	bne _021E9184
	movs r4, #4
	b _021E9188
_021E9184:
	bl GF_AssertFail
_021E9188:
	ldrb r0, [r5, #0xf]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	ldr r0, [r5]
	beq _021E919A
	movs r1, #4
	bl FUN_0200DD10
	b _021E91A0
_021E919A:
	movs r1, #2
	bl FUN_0200DD10
_021E91A0:
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_0200DC58
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov122_021E9154

	thumb_func_start ov122_021E91AC
ov122_021E91AC: @ 0x021E91AC
	push {r3, lr}
	cmp r3, #0
	beq _021E91B6
	cmp r1, #0x19
	beq _021E91C8
_021E91B6:
	cmp r1, r2
	beq _021E91C8
	cmp r1, #0x1c
	bhs _021E91C8
	bl ov122_021E9108
	ldr r0, _021E91CC @ =0x000005DC
	bl FUN_0200604C
_021E91C8:
	pop {r3, pc}
	nop
_021E91CC: .4byte 0x000005DC
	thumb_func_end ov122_021E91AC

	thumb_func_start ov122_021E91D0
ov122_021E91D0: @ 0x021E91D0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r5, #8]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov122_021E9108
	ldr r0, _021E91F0 @ =0x000005DC
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E91F0: .4byte 0x000005DC
	thumb_func_end ov122_021E91D0

	thumb_func_start ov122_021E91F4
ov122_021E91F4: @ 0x021E91F4
	bx lr
	.align 2, 0
	thumb_func_end ov122_021E91F4

	thumb_func_start ov122_021E91F8
ov122_021E91F8: @ 0x021E91F8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x1b
	bne _021E9220
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #2
	adds r0, r1, r0
	adds r4, r0, #4
	cmp r4, #0x19
	blt _021E9214
	bl GF_AssertFail
_021E9214:
	lsls r1, r4, #0x18
	ldr r0, [r5, #8]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	b _021E923C
_021E9220:
	cmp r4, #0x1c
	bne _021E923C
	ldrb r1, [r5, #0xc]
	lsls r0, r1, #2
	adds r4, r1, r0
	cmp r4, #0x19
	blt _021E9232
	bl GF_AssertFail
_021E9232:
	lsls r1, r4, #0x18
	ldr r0, [r5, #8]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
_021E923C:
	cmp r4, #0x19
	beq _021E924E
	cmp r4, #0x1a
	beq _021E924E
	adds r0, r4, #0
	movs r1, #5
	blx FUN_020F2998
	strb r0, [r5, #0xc]
_021E924E:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl ov122_021E91AC
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E91F8

	thumb_func_start ov122_021E925C
ov122_021E925C: @ 0x021E925C
	push {r3, lr}
	movs r3, #1
	bl ov122_021E91AC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov122_021E925C

	.rodata

_021E9268:
	.byte 0x11, 0x12, 0x13, 0x00, 0x15, 0x16, 0x17, 0x18
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x00, 0x00, 0x77, 0x17, 0x74, 0x14, 0x71, 0x11, 0x6E, 0x0E
	.byte 0x6B, 0x0B, 0x03, 0x00, 0x03, 0x0B, 0x00, 0x00, 0x3A, 0x00, 0x1F, 0x00, 0x68, 0x00, 0x00, 0x00
	.byte 0x68, 0x92, 0x1E, 0x02, 0x03, 0x00, 0x00, 0x00, 0x6C, 0x92, 0x1E, 0x02, 0x04, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0xA1, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xE0, 0x00, 0xE1, 0x00, 0x00, 0x01, 0x01, 0x01
	.byte 0x0C, 0x08, 0x05, 0x01, 0x0F, 0x0B, 0x06, 0x02, 0x0E, 0x0A, 0x07, 0x04, 0x0D, 0x09, 0x08, 0x08
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x7E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x7E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x02, 0x13, 0x1B
	.byte 0x04, 0x0C, 0xA2, 0x00, 0x03, 0x02, 0x15, 0x1B, 0x02, 0x0C, 0xA2, 0x00, 0x01, 0x19, 0x04, 0x06
	.byte 0x06, 0x0E, 0x0E, 0x01, 0x01, 0x19, 0x15, 0x06, 0x02, 0x0E, 0x32, 0x01, 0x05, 0x01, 0x01, 0x1E
	.byte 0x02, 0x0C, 0x01, 0x00, 0x05, 0x01, 0x03, 0x1E, 0x02, 0x0C, 0x3D, 0x00, 0x05, 0x0D, 0x06, 0x12
	.byte 0x03, 0x0C, 0x79, 0x00, 0x05, 0x0D, 0x0A, 0x12, 0x03, 0x0C, 0xAF, 0x00, 0x05, 0x01, 0x0E, 0x13
	.byte 0x04, 0x0C, 0xE5, 0x00, 0x05, 0x01, 0x13, 0x13, 0x04, 0x0C, 0x31, 0x01, 0x05, 0x01, 0x0F, 0x07
	.byte 0x02, 0x0D, 0x01, 0x00, 0x05, 0x01, 0x05, 0x1E, 0x06, 0x0C, 0x0F, 0x00, 0x05, 0x0A, 0x0E, 0x15
	.byte 0x04, 0x0C, 0xC3, 0x00, 0x05, 0x0A, 0x13, 0x15, 0x04, 0x0C, 0x17, 0x01, 0x05, 0x01, 0x11, 0x1E
	.byte 0x06, 0x0C, 0x01, 0x00, 0x05, 0x02, 0x07, 0x06, 0x06, 0x0D, 0x01, 0x00, 0x05, 0x01, 0x0F, 0x1E
	.byte 0x08, 0x0C, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA9, 0x5B, 0x1E, 0x02, 0xE5, 0x5B, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF9, 0x5B, 0x1E, 0x02, 0xAD, 0x5C, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x25, 0x5D, 0x1E, 0x02, 0x79, 0x5D, 0x1E, 0x02, 0xB5, 0x5D, 0x1E, 0x02, 0xC5, 0x5D, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x5E, 0x1E, 0x02, 0x35, 0x5E, 0x1E, 0x02
	.byte 0x45, 0x5E, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA5, 0x5E, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xB5, 0x5E, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0xF9, 0x5E, 0x1E, 0x02
	.byte 0xC1, 0x5E, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0xD1, 0x5E, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xF9, 0x5E, 0x1E, 0x02, 0xDD, 0x5E, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0xED, 0x5E, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xF9, 0x5E, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1D, 0x5F, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x49, 0x5F, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x09, 0x60, 0x1E, 0x02
	.byte 0x1D, 0x60, 0x1E, 0x02, 0x3D, 0x61, 0x1E, 0x02, 0x69, 0x61, 0x1E, 0x02, 0x59, 0x63, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAD, 0x63, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x19, 0x64, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE9, 0x64, 0x1E, 0x02, 0x95, 0x65, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xF5, 0x65, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0xFD, 0x65, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xE1, 0x67, 0x1E, 0x02, 0xCD, 0x66, 0x1E, 0x02, 0xFD, 0x66, 0x1E, 0x02, 0x01, 0x67, 0x1E, 0x02
	.byte 0xDD, 0x67, 0x1E, 0x02, 0xE1, 0x67, 0x1E, 0x02, 0x8D, 0x68, 0x1E, 0x02, 0x01, 0x69, 0x1E, 0x02
	.byte 0x49, 0x69, 0x1E, 0x02, 0xDD, 0x69, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x06, 0x03, 0x01, 0x33
	.byte 0x06, 0x00, 0x03, 0x22, 0x06, 0x05, 0x00, 0x43, 0x06, 0x02, 0x02, 0x33, 0x06, 0x04, 0x01, 0x43
	.byte 0x06, 0x03, 0x01, 0x33, 0x06, 0x00, 0x03, 0x22, 0x06, 0x05, 0x00, 0x43, 0x06, 0x02, 0x02, 0x33
	.byte 0x06, 0x04, 0x01, 0x43, 0x07, 0x01, 0x03, 0x32, 0x07, 0x06, 0x00, 0x43, 0x07, 0x03, 0x02, 0x32
	.byte 0x07, 0x00, 0x04, 0x32, 0x07, 0x05, 0x01, 0x43, 0x07, 0x01, 0x03, 0x22, 0x07, 0x06, 0x00, 0x33
	.byte 0x07, 0x03, 0x02, 0x22, 0x07, 0x00, 0x04, 0x22, 0x07, 0x05, 0x01, 0x33, 0x08, 0x02, 0x03, 0x32
	.byte 0x08, 0x07, 0x00, 0x43, 0x08, 0x04, 0x02, 0x43, 0x08, 0x01, 0x04, 0x32, 0x08, 0x06, 0x01, 0x34
	.byte 0x08, 0x02, 0x03, 0x22, 0x08, 0x07, 0x00, 0x33, 0x08, 0x04, 0x02, 0x33, 0x08, 0x01, 0x04, 0x22
	.byte 0x08, 0x06, 0x01, 0x33, 0x08, 0x03, 0x03, 0x34, 0x08, 0x00, 0x05, 0x32, 0x0A, 0x08, 0x00, 0x54
	.byte 0x0A, 0x05, 0x02, 0x43, 0x0A, 0x02, 0x04, 0x43, 0x08, 0x03, 0x03, 0x33, 0x08, 0x00, 0x05, 0x22
	.byte 0x0A, 0x08, 0x00, 0x44, 0x0A, 0x05, 0x02, 0x33, 0x0A, 0x02, 0x04, 0x33, 0x0A, 0x07, 0x01, 0x54
	.byte 0x0A, 0x04, 0x03, 0x43, 0x0A, 0x01, 0x05, 0x43, 0x0A, 0x09, 0x00, 0x54, 0x0A, 0x06, 0x02, 0x54
	.byte 0x0A, 0x07, 0x01, 0x44, 0x0A, 0x04, 0x03, 0x33, 0x0A, 0x01, 0x05, 0x33, 0x0A, 0x09, 0x00, 0x44
	.byte 0x0A, 0x06, 0x02, 0x44, 0x0A, 0x03, 0x04, 0x43, 0x0A, 0x00, 0x06, 0x43, 0x0A, 0x08, 0x01, 0x54
	.byte 0x0A, 0x05, 0x03, 0x54, 0x0A, 0x02, 0x05, 0x43, 0x0A, 0x03, 0x04, 0x33, 0x0A, 0x00, 0x06, 0x33
	.byte 0x0A, 0x08, 0x01, 0x44, 0x0A, 0x05, 0x03, 0x44, 0x0A, 0x02, 0x05, 0x33, 0x0A, 0x07, 0x02, 0x54
	.byte 0x0A, 0x04, 0x04, 0x54, 0x0D, 0x01, 0x06, 0x43, 0x0D, 0x09, 0x01, 0x65, 0x0A, 0x06, 0x03, 0x54
	.byte 0x0A, 0x07, 0x02, 0x44, 0x0A, 0x04, 0x04, 0x44, 0x0D, 0x01, 0x06, 0x33, 0x0D, 0x09, 0x01, 0x55
	.byte 0x0A, 0x06, 0x03, 0x44, 0x0A, 0x00, 0x07, 0x43, 0x0A, 0x08, 0x02, 0x65, 0x0A, 0x05, 0x04, 0x54
	.byte 0x0A, 0x02, 0x06, 0x54, 0x0A, 0x07, 0x03, 0x65, 0x0A, 0x00, 0x07, 0x33, 0x0A, 0x08, 0x02, 0x55
	.byte 0x0A, 0x05, 0x04, 0x44, 0x0A, 0x02, 0x06, 0x44, 0x0A, 0x07, 0x03, 0x55, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50
	.byte 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14
	.byte 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C
	.byte 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28
	.byte 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD1, 0x91, 0x1E, 0x02
	.byte 0xF5, 0x91, 0x1E, 0x02, 0xF9, 0x91, 0x1E, 0x02, 0x5D, 0x92, 0x1E, 0x02, 0x50, 0x68, 0xC8, 0xE0
	.byte 0x50, 0x68, 0xE0, 0xF8, 0x68, 0x80, 0xC8, 0xE0, 0x68, 0x80, 0xE0, 0xF8, 0x80, 0x98, 0xE0, 0xF8
	.byte 0x08, 0x48, 0xC0, 0x00, 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x08, 0x20, 0x08, 0x20
	.byte 0x08, 0x20, 0x28, 0x40, 0x08, 0x20, 0x48, 0x60, 0x08, 0x20, 0x68, 0x80, 0x08, 0x20, 0x88, 0xA0
	.byte 0x28, 0x40, 0x08, 0x20, 0x28, 0x40, 0x28, 0x40, 0x28, 0x40, 0x48, 0x60, 0x28, 0x40, 0x68, 0x80
	.byte 0x28, 0x40, 0x88, 0xA0, 0x48, 0x60, 0x08, 0x20, 0x48, 0x60, 0x28, 0x40, 0x48, 0x60, 0x48, 0x60
	.byte 0x48, 0x60, 0x68, 0x80, 0x48, 0x60, 0x88, 0xA0, 0x68, 0x80, 0x08, 0x20, 0x68, 0x80, 0x28, 0x40
	.byte 0x68, 0x80, 0x48, 0x60, 0x68, 0x80, 0x68, 0x80, 0x68, 0x80, 0x88, 0xA0, 0x88, 0xA0, 0x08, 0x20
	.byte 0x88, 0xA0, 0x28, 0x40, 0x88, 0xA0, 0x48, 0x60, 0x88, 0xA0, 0x68, 0x80, 0x88, 0xA0, 0x88, 0xA0
	.byte 0x08, 0x48, 0xC0, 0x00, 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x08, 0x08, 0x18, 0x18
	.byte 0x14, 0x05, 0x19, 0x01, 0x28, 0x08, 0x18, 0x18, 0x15, 0x06, 0x00, 0x02, 0x48, 0x08, 0x18, 0x18
	.byte 0x16, 0x07, 0x01, 0x03, 0x68, 0x08, 0x18, 0x18, 0x17, 0x08, 0x02, 0x04, 0x88, 0x08, 0x18, 0x18
	.byte 0x18, 0x09, 0x03, 0x19, 0x08, 0x28, 0x18, 0x18, 0x00, 0x0A, 0x19, 0x06, 0x28, 0x28, 0x18, 0x18
	.byte 0x01, 0x0B, 0x05, 0x07, 0x48, 0x28, 0x18, 0x18, 0x02, 0x0C, 0x06, 0x08, 0x68, 0x28, 0x18, 0x18
	.byte 0x03, 0x0D, 0x07, 0x09, 0x88, 0x28, 0x18, 0x18, 0x04, 0x0E, 0x08, 0x19, 0x08, 0x48, 0x18, 0x18
	.byte 0x05, 0x0F, 0x19, 0x0B, 0x28, 0x48, 0x18, 0x18, 0x06, 0x10, 0x0A, 0x0C, 0x48, 0x48, 0x18, 0x18
	.byte 0x07, 0x11, 0x0B, 0x0D, 0x68, 0x48, 0x18, 0x18, 0x08, 0x12, 0x0C, 0x0E, 0x88, 0x48, 0x18, 0x18
	.byte 0x09, 0x13, 0x0D, 0x19, 0x08, 0x68, 0x18, 0x18, 0x0A, 0x14, 0x1A, 0x10, 0x28, 0x68, 0x18, 0x18
	.byte 0x0B, 0x15, 0x0F, 0x11, 0x48, 0x68, 0x18, 0x18, 0x0C, 0x16, 0x10, 0x12, 0x68, 0x68, 0x18, 0x18
	.byte 0x0D, 0x17, 0x11, 0x13, 0x88, 0x68, 0x18, 0x18, 0x0E, 0x18, 0x12, 0x1A, 0x08, 0x88, 0x18, 0x18
	.byte 0x0F, 0x00, 0x1A, 0x15, 0x28, 0x88, 0x18, 0x18, 0x10, 0x01, 0x14, 0x16, 0x48, 0x88, 0x18, 0x18
	.byte 0x11, 0x02, 0x15, 0x17, 0x68, 0x88, 0x18, 0x18, 0x12, 0x03, 0x16, 0x18, 0x88, 0x88, 0x18, 0x18
	.byte 0x13, 0x04, 0x17, 0x1A, 0xE0, 0x28, 0x00, 0x00, 0x19, 0x1A, 0x1B, 0x1C, 0xE0, 0xB0, 0x00, 0x00
	.byte 0x19, 0x1A, 0x1B, 0x1C

	.data

_021E9BA0:
	.byte 0xC8, 0x50, 0xE0, 0x50, 0xC8, 0x68, 0xE0, 0x68, 0xE0, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021E9BC0
