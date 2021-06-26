
	thumb_func_start ov108_021E5900
ov108_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #5
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x5f
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _021E5944 @ =0x000184EC
	adds r0, r4, #0
	movs r2, #0x5f
	bl FUN_02007280
	ldr r2, _021E5944 @ =0x000184EC
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x5f
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov108_021E59E4
	movs r1, #0
	movs r0, #0x43
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5944: .4byte 0x000184EC
	thumb_func_end ov108_021E5900

	thumb_func_start ov108_021E5948
ov108_021E5948: @ 0x021E5948
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r6, r0, #0
	bl ov108_021E5A48
	ldr r2, _021E5974 @ =0x000184EC
	ldr r4, [r6]
	adds r0, r6, #0
	movs r1, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_02007294
	adds r0, r4, #0
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E5974: .4byte 0x000184EC
	thumb_func_end ov108_021E5948

	thumb_func_start ov108_021E5978
ov108_021E5978: @ 0x021E5978
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #7
	bhi _021E59DE
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5992: @ jump table
	.2byte _021E59A2 - _021E5992 - 2 @ case 0
	.2byte _021E59AA - _021E5992 - 2 @ case 1
	.2byte _021E59B2 - _021E5992 - 2 @ case 2
	.2byte _021E59BA - _021E5992 - 2 @ case 3
	.2byte _021E59C2 - _021E5992 - 2 @ case 4
	.2byte _021E59CA - _021E5992 - 2 @ case 5
	.2byte _021E59D2 - _021E5992 - 2 @ case 6
	.2byte _021E59DA - _021E5992 - 2 @ case 7
_021E59A2:
	bl ov108_021E5A78
	str r0, [r4]
	b _021E59DE
_021E59AA:
	bl ov108_021E5A8C
	str r0, [r4]
	b _021E59DE
_021E59B2:
	bl ov108_021E5AA0
	str r0, [r4]
	b _021E59DE
_021E59BA:
	bl ov108_021E5AF0
	str r0, [r4]
	b _021E59DE
_021E59C2:
	bl ov108_021E5B48
	str r0, [r4]
	b _021E59DE
_021E59CA:
	bl ov108_021E5B98
	str r0, [r4]
	b _021E59DE
_021E59D2:
	bl ov108_021E5BFC
	str r0, [r4]
	b _021E59DE
_021E59DA:
	movs r0, #1
	pop {r4, pc}
_021E59DE:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E5978

	thumb_func_start ov108_021E59E4
ov108_021E59E4: @ 0x021E59E4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	bl FUN_0202F57C
	adds r2, r5, #0
	str r0, [r5, #0x18]
	movs r1, #0
	adds r2, #0x1c
	bl FUN_0202F658
	ldr r0, [r4]
	bl FUN_02028EA8
	adds r6, r0, #0
	bl FUN_0202AD20
	ldr r1, _021E5A38 @ =0x000184DC
	strb r0, [r5, r1]
	adds r0, r6, #0
	bl FUN_0202ADCC
	ldr r1, _021E5A3C @ =0x000184DD
	strb r0, [r5, r1]
	ldr r0, [r4, #4]
	bl FUN_020183F0
	str r0, [r5, #0x10]
	ldr r0, _021E5A40 @ =0x000184E8
	movs r1, #0
	str r1, [r5, r0]
	str r4, [r5, #0x14]
	ldr r0, [r5, #0x18]
	bl FUN_0202F720
	cmp r0, #0
	beq _021E5A36
	ldr r0, _021E5A44 @ =0x000184E3
	movs r1, #1
	strb r1, [r5, r0]
_021E5A36:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E5A38: .4byte 0x000184DC
_021E5A3C: .4byte 0x000184DD
_021E5A40: .4byte 0x000184E8
_021E5A44: .4byte 0x000184E3
	thumb_func_end ov108_021E59E4

	thumb_func_start ov108_021E5A48
ov108_021E5A48: @ 0x021E5A48
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	ldr r0, [r4, #0x18]
	movs r1, #0
	adds r2, #0x1c
	bl FUN_0202F680
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	bl FUN_020503D0
	ldr r1, _021E5A74 @ =0x000184E8
	ldr r1, [r4, r1]
	bl FUN_02066A64
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	ldr r0, [r0, #4]
	bl FUN_02018410
	pop {r4, pc}
	.align 2, 0
_021E5A74: .4byte 0x000184E8
	thumb_func_end ov108_021E5A48

	thumb_func_start ov108_021E5A78
ov108_021E5A78: @ 0x021E5A78
	push {r3, lr}
	bl ov108_021E5C54
	cmp r0, #0
	beq _021E5A86
	movs r0, #5
	pop {r3, pc}
_021E5A86:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov108_021E5A78

	thumb_func_start ov108_021E5A8C
ov108_021E5A8C: @ 0x021E5A8C
	push {r3, lr}
	bl ov108_021E5D0C
	cmp r0, #0
	beq _021E5A9A
	movs r0, #7
	pop {r3, pc}
_021E5A9A:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov108_021E5A8C

	thumb_func_start ov108_021E5AA0
ov108_021E5AA0: @ 0x021E5AA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5AE4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5AB6: @ jump table
	.2byte _021E5AC0 - _021E5AB6 - 2 @ case 0
	.2byte _021E5AC8 - _021E5AB6 - 2 @ case 1
	.2byte _021E5AD0 - _021E5AB6 - 2 @ case 2
	.2byte _021E5AE4 - _021E5AB6 - 2 @ case 3
	.2byte _021E5AD8 - _021E5AB6 - 2 @ case 4
_021E5AC0:
	bl ov108_021E5D90
	str r0, [r4, #4]
	b _021E5AE4
_021E5AC8:
	bl ov108_021E5DB8
	str r0, [r4, #4]
	b _021E5AE4
_021E5AD0:
	bl ov108_021E5E68
	str r0, [r4, #4]
	b _021E5AE4
_021E5AD8:
	movs r1, #0
	str r1, [r4, #4]
	bl ov108_021E846C
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E5AE4:
	adds r0, r4, #0
	bl ov108_021E846C
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E5AA0

	thumb_func_start ov108_021E5AF0
ov108_021E5AF0: @ 0x021E5AF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5B3C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5B06: @ jump table
	.2byte _021E5B10 - _021E5B06 - 2 @ case 0
	.2byte _021E5B18 - _021E5B06 - 2 @ case 1
	.2byte _021E5B20 - _021E5B06 - 2 @ case 2
	.2byte _021E5B28 - _021E5B06 - 2 @ case 3
	.2byte _021E5B30 - _021E5B06 - 2 @ case 4
_021E5B10:
	bl ov108_021E5F10
	str r0, [r4, #4]
	b _021E5B3C
_021E5B18:
	bl ov108_021E5F38
	str r0, [r4, #4]
	b _021E5B3C
_021E5B20:
	bl ov108_021E5E68
	str r0, [r4, #4]
	b _021E5B3C
_021E5B28:
	bl ov108_021E6010
	str r0, [r4, #4]
	b _021E5B3C
_021E5B30:
	movs r1, #0
	str r1, [r4, #4]
	bl ov108_021E846C
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E5B3C:
	adds r0, r4, #0
	bl ov108_021E846C
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E5AF0

	thumb_func_start ov108_021E5B48
ov108_021E5B48: @ 0x021E5B48
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5B8C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5B5E: @ jump table
	.2byte _021E5B68 - _021E5B5E - 2 @ case 0
	.2byte _021E5B8C - _021E5B5E - 2 @ case 1
	.2byte _021E5B70 - _021E5B5E - 2 @ case 2
	.2byte _021E5B78 - _021E5B5E - 2 @ case 3
	.2byte _021E5B80 - _021E5B5E - 2 @ case 4
_021E5B68:
	bl ov108_021E6068
	str r0, [r4, #4]
	b _021E5B8C
_021E5B70:
	bl ov108_021E5E68
	str r0, [r4, #4]
	b _021E5B8C
_021E5B78:
	bl ov108_021E6090
	str r0, [r4, #4]
	b _021E5B8C
_021E5B80:
	movs r1, #0
	str r1, [r4, #4]
	bl ov108_021E846C
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E5B8C:
	adds r0, r4, #0
	bl ov108_021E846C
	movs r0, #4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E5B48

	thumb_func_start ov108_021E5B98
ov108_021E5B98: @ 0x021E5B98
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E5BAA
	cmp r0, #1
	beq _021E5BD8
	b _021E5BF0
_021E5BAA:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E5BF0
_021E5BD8:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5BF0
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov108_021E846C
	add sp, #0xc
	movs r0, #2
	pop {r3, r4, pc}
_021E5BF0:
	adds r0, r4, #0
	bl ov108_021E846C
	movs r0, #5
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov108_021E5B98

	thumb_func_start ov108_021E5BFC
ov108_021E5BFC: @ 0x021E5BFC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E5C0E
	cmp r0, #1
	beq _021E5C2E
	b _021E5C46
_021E5C0E:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E5C46
_021E5C2E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5C46
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov108_021E846C
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E5C46:
	adds r0, r4, #0
	bl ov108_021E846C
	movs r0, #6
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E5BFC

	thumb_func_start ov108_021E5C54
ov108_021E5C54: @ 0x021E5C54
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5C68
	cmp r1, #1
	beq _021E5CB8
	cmp r1, #2
	beq _021E5CE2
	b _021E5CF6
_021E5C68:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5D00 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5D04 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	b _021E5CF6
_021E5CB8:
	bl ov108_021E6C68
	adds r0, r4, #0
	bl ov108_021E6D80
	adds r0, r4, #0
	bl ov108_021E6F74
	adds r0, r4, #0
	bl ov108_021E7080
	adds r0, r4, #0
	bl ov108_021E7224
	adds r0, r4, #0
	bl ov108_021E72CC
	adds r0, r4, #0
	bl ov108_021E733C
	b _021E5CF6
_021E5CE2:
	bl ov108_021E7BFC
	ldr r0, _021E5D08 @ =ov108_021E6BA0
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E5CF6:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E5D00: .4byte 0xFFFFE0FF
_021E5D04: .4byte 0x04001000
_021E5D08: .4byte ov108_021E6BA0
	thumb_func_end ov108_021E5C54

	thumb_func_start ov108_021E5D0C
ov108_021E5D0C: @ 0x021E5D0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E5D1C
	cmp r0, #2
	beq _021E5D54
	b _021E5D7C
_021E5D1C:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r0, r4, #0
	bl ov108_021E7510
	adds r0, r4, #0
	bl ov108_021E730C
	adds r0, r4, #0
	bl ov108_021E72A4
	adds r0, r4, #0
	bl ov108_021E71EC
	adds r0, r4, #0
	bl ov108_021E7014
	adds r0, r4, #0
	bl ov108_021E6F58
	adds r0, r4, #0
	bl ov108_021E6D24
	b _021E5D7C
_021E5D54:
	bl FUN_02021238
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5D88 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5D8C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E5D7C:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	nop
_021E5D88: .4byte 0xFFFFE0FF
_021E5D8C: .4byte 0x04001000
	thumb_func_end ov108_021E5D0C

	thumb_func_start ov108_021E5D90
ov108_021E5D90: @ 0x021E5D90
	push {r4, lr}
	adds r4, r0, #0
	bl ov108_021E6240
	cmp r0, #0
	beq _021E5DA0
	movs r0, #0
	pop {r4, pc}
_021E5DA0:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E5DAE
	adds r0, r4, #0
	bl ov108_021E62B4
	pop {r4, pc}
_021E5DAE:
	adds r0, r4, #0
	bl ov108_021E63B8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E5D90

	thumb_func_start ov108_021E5DB8
ov108_021E5DB8: @ 0x021E5DB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021E5E5C @ =0x000004BC
	ldr r0, [r5, r0]
	bl FUN_020186A4
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _021E5DD2
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E5DD2:
	ldr r0, _021E5E5C @ =0x000004BC
	ldr r0, [r5, r0]
	adds r1, r0, #0
	adds r1, #0x27
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x19
	bl FUN_02018680
	ldr r0, [r5, #0x10]
	cmp r4, r0
	beq _021E5DFC
	cmp r4, #0
	bne _021E5DF6
	adds r0, r5, #0
	bl ov108_021E61E8
	b _021E5DFC
_021E5DF6:
	adds r0, r5, #0
	bl ov108_021E6238
_021E5DFC:
	str r4, [r5, #0x10]
	cmp r6, #0
	beq _021E5E0A
	cmp r6, #1
	beq _021E5E14
	cmp r6, #2
	b _021E5E40
_021E5E0A:
	ldr r0, _021E5E60 @ =0x000184E0
	movs r1, #0
	strb r1, [r5, r0]
	movs r0, #2
	pop {r4, r5, r6, pc}
_021E5E14:
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E79A8
	movs r2, #0
	adds r0, r5, #0
	movs r1, #4
	adds r3, r2, #0
	bl ov108_021E79A8
	ldr r0, _021E5E64 @ =0x000184DF
	ldrb r1, [r5, r0]
	adds r0, r0, #1
	strb r1, [r5, r0]
	adds r0, r5, #0
	bl ov108_021E6804
	movs r0, #4
	str r0, [r5, #0xc]
	pop {r4, r5, r6, pc}
_021E5E40:
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E79A8
	movs r2, #0
	adds r0, r5, #0
	movs r1, #4
	adds r3, r2, #0
	bl ov108_021E79A8
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E5E5C: .4byte 0x000004BC
_021E5E60: .4byte 0x000184E0
_021E5E64: .4byte 0x000184DF
	thumb_func_end ov108_021E5DB8

	thumb_func_start ov108_021E5E68
ov108_021E5E68: @ 0x021E5E68
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5E78
	cmp r1, #1
	beq _021E5E84
	b _021E5E94
_021E5E78:
	bl ov108_021E7F7C
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021E5EF6
_021E5E84:
	bl ov108_021E80F4
	cmp r0, #0
	beq _021E5EF6
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021E5EF6
_021E5E94:
	ldr r3, _021E5EFC @ =0x04001000
	ldr r1, _021E5F00 @ =0xFFFF1FFF
	ldr r2, [r3]
	ands r1, r2
	str r1, [r3]
	ldr r2, _021E5F04 @ =0x000184E1
	movs r1, #0
	strb r1, [r4, r2]
	str r1, [r4, #8]
	adds r2, r2, #1
	ldrb r2, [r4, r2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1b
	bne _021E5ED2
	movs r2, #3
	str r2, [r4, #0xc]
	movs r2, #1
	adds r3, r2, #0
	bl ov108_021E7700
	adds r0, r4, #0
	bl ov108_021E7EB0
	ldr r1, _021E5F08 @ =0x000184E2
	movs r0, #0xf8
	ldrb r2, [r4, r1]
	bics r2, r0
	movs r0, #8
	orrs r0, r2
	strb r0, [r4, r1]
	b _021E5EF2
_021E5ED2:
	movs r2, #2
	str r2, [r4, #0xc]
	adds r2, r1, #0
	movs r3, #1
	bl ov108_021E7700
	ldr r1, _021E5F0C @ =0x000184DF
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E7CD8
	ldr r1, _021E5F08 @ =0x000184E2
	movs r0, #0xf8
	ldrb r2, [r4, r1]
	bics r2, r0
	strb r2, [r4, r1]
_021E5EF2:
	movs r0, #4
	pop {r4, pc}
_021E5EF6:
	movs r0, #2
	pop {r4, pc}
	nop
_021E5EFC: .4byte 0x04001000
_021E5F00: .4byte 0xFFFF1FFF
_021E5F04: .4byte 0x000184E1
_021E5F08: .4byte 0x000184E2
_021E5F0C: .4byte 0x000184DF
	thumb_func_end ov108_021E5E68

	thumb_func_start ov108_021E5F10
ov108_021E5F10: @ 0x021E5F10
	push {r4, lr}
	adds r4, r0, #0
	bl ov108_021E6240
	cmp r0, #0
	beq _021E5F20
	movs r0, #0
	pop {r4, pc}
_021E5F20:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E5F2E
	adds r0, r4, #0
	bl ov108_021E64C0
	pop {r4, pc}
_021E5F2E:
	adds r0, r4, #0
	bl ov108_021E66AC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E5F10

	thumb_func_start ov108_021E5F38
ov108_021E5F38: @ 0x021E5F38
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x13
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E5F50
	cmp r0, #2
	beq _021E5F88
	b _021E5F9E
_021E5F50:
	ldr r1, _021E6008 @ =0x000184E0
	movs r4, #1
	subs r2, r1, #2
	ldrb r3, [r5, r2]
	ldrb r0, [r5, r1]
	movs r2, #6
	muls r2, r3, r2
	adds r0, r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	subs r0, r1, #1
	ldrb r3, [r5, r0]
	movs r0, #0x7a
	muls r0, r3, r0
	adds r0, r5, r0
	ldrb r0, [r0, #0x1c]
	cmp r2, r0
	beq _021E5FA2
	adds r0, r1, #0
	adds r0, #8
	str r4, [r5, r0]
	subs r1, r1, #1
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	adds r0, #0x1c
	bl FUN_0202F91C
	b _021E5FA2
_021E5F88:
	ldr r0, _021E600C @ =0x000184DF
	movs r2, #0x7a
	ldrb r1, [r5, r0]
	adds r0, r5, #0
	muls r2, r1, r2
	adds r2, r5, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	movs r4, #0
	b _021E5FA2
_021E5F9E:
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E5FA2:
	movs r0, #0x13
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_020169C0
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	cmp r6, r0
	beq _021E5FC6
	cmp r6, #0
	bne _021E5FC0
	adds r0, r5, #0
	bl ov108_021E61E8
	b _021E5FC6
_021E5FC0:
	adds r0, r5, #0
	bl ov108_021E6238
_021E5FC6:
	movs r0, #0x13
	str r6, [r5, #0x10]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_020169CC
	movs r0, #0xf1
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D8C8
	adds r0, r5, #0
	movs r1, #0
	bl ov108_021E767C
	movs r2, #1
	adds r0, r5, #0
	movs r1, #0
	adds r3, r2, #0
	bl ov108_021E7700
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E79A8
	cmp r4, #0
	beq _021E6004
	movs r0, #2
	pop {r4, r5, r6, pc}
_021E6004:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6008: .4byte 0x000184E0
_021E600C: .4byte 0x000184DF
	thumb_func_end ov108_021E5F38

	thumb_func_start ov108_021E6010
ov108_021E6010: @ 0x021E6010
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E6020
	cmp r1, #1
	beq _021E602C
	b _021E603C
_021E6020:
	bl ov108_021E81A8
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021E6060
_021E602C:
	bl ov108_021E8270
	cmp r0, #0
	beq _021E6060
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	b _021E6060
_021E603C:
	ldr r2, _021E6064 @ =0x000184E2
	movs r1, #4
	ldrb r3, [r4, r2]
	adds r0, r3, #0
	bics r0, r1
	lsls r1, r3, #0x1d
	lsrs r3, r1, #0x1f
	movs r1, #1
	eors r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1d
	orrs r0, r1
	strb r0, [r4, r2]
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
_021E6060:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_021E6064: .4byte 0x000184E2
	thumb_func_end ov108_021E6010

	thumb_func_start ov108_021E6068
ov108_021E6068: @ 0x021E6068
	push {r4, lr}
	adds r4, r0, #0
	bl ov108_021E6240
	cmp r0, #0
	beq _021E6078
	movs r0, #0
	pop {r4, pc}
_021E6078:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E6086
	adds r0, r4, #0
	bl ov108_021E6894
	pop {r4, pc}
_021E6086:
	adds r0, r4, #0
	bl ov108_021E69A0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E6068

	thumb_func_start ov108_021E6090
ov108_021E6090: @ 0x021E6090
	push {r3, r4, r5, lr}
	ldr r2, _021E61D8 @ =0x000184E2
	adds r5, r0, #0
	ldrb r1, [r5, r2]
	lsls r1, r1, #0x1d
	lsrs r3, r1, #0x1f
	movs r1, #6
	adds r4, r3, #0
	muls r4, r1, r4
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _021E60B2
	cmp r1, #1
	beq _021E60EE
	cmp r1, #2
	beq _021E6174
	b _021E61BA
_021E60B2:
	subs r0, r2, #3
	ldrb r0, [r5, r0]
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DD54
	ldr r0, _021E61DC @ =0x000184E0
	ldrb r0, [r5, r0]
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DD54
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	b _021E61D2
_021E60EE:
	movs r1, #0
	bl ov108_021E82E0
	cmp r0, #0
	beq _021E61D2
	ldr r2, _021E61E0 @ =0x000184E8
	movs r0, #1
	adds r1, r2, #0
	str r0, [r5, r2]
	subs r1, #9
	subs r2, #8
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r2]
	adds r0, #0x1c
	bl FUN_0202F8D4
	ldr r0, _021E61E4 @ =0x000184DF
	movs r3, #0x7a
	ldrb r2, [r5, r0]
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r1, r2, r4
	muls r3, r2, r3
	adds r2, r5, r3
	lsls r1, r1, #0x18
	ldrb r2, [r2, #0x1c]
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl ov108_021E84F8
	ldr r0, _021E61E4 @ =0x000184DF
	movs r2, #0x7a
	ldrb r1, [r5, r0]
	adds r0, r5, #0
	muls r2, r1, r2
	adds r2, r5, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	ldr r0, _021E61DC @ =0x000184E0
	movs r3, #0x7a
	ldrb r2, [r5, r0]
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r1, r2, r4
	muls r3, r2, r3
	adds r2, r5, r3
	lsls r1, r1, #0x18
	ldrb r2, [r2, #0x1c]
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl ov108_021E84F8
	ldr r0, _021E61DC @ =0x000184E0
	movs r2, #0x7a
	ldrb r1, [r5, r0]
	adds r0, r5, #0
	muls r2, r1, r2
	adds r2, r5, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	b _021E61D2
_021E6174:
	movs r1, #1
	bl ov108_021E82E0
	cmp r0, #0
	beq _021E61D2
	ldr r0, _021E61E4 @ =0x000184DF
	ldrb r0, [r5, r0]
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_0200DD54
	ldr r0, _021E61DC @ =0x000184E0
	ldrb r0, [r5, r0]
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_0200DD54
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r5, #8]
	adds r0, r0, #1
	str r0, [r5, #8]
	b _021E61D2
_021E61BA:
	subs r1, r2, #2
	ldrb r3, [r5, r1]
	subs r1, r2, #3
	strb r3, [r5, r1]
	bl ov108_021E6850
	movs r0, #0
	str r0, [r5, #8]
	movs r0, #2
	str r0, [r5, #0xc]
	movs r0, #4
	pop {r3, r4, r5, pc}
_021E61D2:
	movs r0, #3
	pop {r3, r4, r5, pc}
	nop
_021E61D8: .4byte 0x000184E2
_021E61DC: .4byte 0x000184E0
_021E61E0: .4byte 0x000184E8
_021E61E4: .4byte 0x000184DF
	thumb_func_end ov108_021E6090

	thumb_func_start ov108_021E61E8
ov108_021E61E8: @ 0x021E61E8
	push {r4, lr}
	ldr r2, _021E6230 @ =0x000184E2
	adds r4, r0, #0
	ldrb r1, [r4, r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1b
	beq _021E6200
	cmp r1, #1
	beq _021E620C
	cmp r1, #2
	beq _021E6224
	pop {r4, pc}
_021E6200:
	subs r2, r2, #3
	ldrb r2, [r4, r2]
	movs r1, #0
	bl ov108_021E78F4
	pop {r4, pc}
_021E620C:
	subs r2, r2, #2
	ldrb r2, [r4, r2]
	movs r1, #1
	bl ov108_021E78F4
	ldr r2, _021E6234 @ =0x000184DF
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #2
	bl ov108_021E78F4
	pop {r4, pc}
_021E6224:
	subs r2, r2, #2
	ldrb r2, [r4, r2]
	movs r1, #0
	bl ov108_021E78F4
	pop {r4, pc}
	.align 2, 0
_021E6230: .4byte 0x000184E2
_021E6234: .4byte 0x000184DF
	thumb_func_end ov108_021E61E8

	thumb_func_start ov108_021E6238
ov108_021E6238: @ 0x021E6238
	ldr r3, _021E623C @ =ov108_021E61E8
	bx r3
	.align 2, 0
_021E623C: .4byte ov108_021E61E8
	thumb_func_end ov108_021E6238

	thumb_func_start ov108_021E6240
ov108_021E6240: @ 0x021E6240
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _021E6276
	bl FUN_0202534C
	cmp r0, #0
	beq _021E6256
	movs r0, #0
	pop {r4, pc}
_021E6256:
	ldr r0, _021E62A8 @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E62A4
	ldr r0, _021E62AC @ =0x000004C4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E626A
	adds r0, r4, #0
	blx r1
_021E626A:
	adds r0, r4, #0
	bl ov108_021E61E8
	movs r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
_021E6276:
	ldr r0, _021E62A8 @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E6282
	movs r0, #0
	pop {r4, pc}
_021E6282:
	bl FUN_0202534C
	cmp r0, #0
	beq _021E62A4
	ldr r0, _021E62B0 @ =0x000004C8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E6296
	adds r0, r4, #0
	blx r1
_021E6296:
	adds r0, r4, #0
	bl ov108_021E6238
	movs r0, #1
	str r0, [r4, #0x10]
	movs r0, #0
	pop {r4, pc}
_021E62A4:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E62A8: .4byte 0x021D110C
_021E62AC: .4byte 0x000004C4
_021E62B0: .4byte 0x000004C8
	thumb_func_end ov108_021E6240

	thumb_func_start ov108_021E62B4
ov108_021E62B4: @ 0x021E62B4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _021E63A8 @ =0x021D110C
	ldr r4, [r0, #0x48]
	movs r0, #2
	tst r0, r4
	beq _021E62D0
	ldr r0, _021E63AC @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [r5, #0xc]
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E62D0:
	movs r0, #1
	tst r0, r4
	beq _021E62FA
	ldr r0, _021E63B0 @ =0x000184DF
	ldrb r0, [r5, r0]
	cmp r0, #6
	ldr r0, _021E63AC @ =0x000005DC
	blo _021E62EC
	bl FUN_0200604C
	movs r0, #6
	str r0, [r5, #0xc]
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E62EC:
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov108_021E6A58
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E62FA:
	movs r0, #0xf0
	tst r0, r4
	bne _021E6304
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6304:
	ldr r0, _021E63B0 @ =0x000184DF
	movs r1, #3
	ldrb r6, [r5, r0]
	adds r0, r6, #0
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bhs _021E634A
	movs r0, #0x10
	tst r0, r4
	beq _021E6338
	adds r0, r7, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	b _021E634A
_021E6338:
	movs r0, #0x20
	tst r0, r4
	beq _021E634A
	adds r0, r7, #2
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
_021E634A:
	movs r0, #0x40
	tst r0, r4
	beq _021E635E
	adds r0, r6, #2
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E6370
_021E635E:
	movs r0, #0x80
	tst r0, r4
	beq _021E6370
	adds r0, r6, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
_021E6370:
	lsls r0, r6, #1
	adds r0, r6, r0
	adds r1, r7, r0
	ldr r0, _021E63B0 @ =0x000184DF
	cmp r6, #2
	strb r1, [r5, r0]
	blo _021E6388
	ldr r0, _021E63A8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xc0
	tst r0, r1
	beq _021E638E
_021E6388:
	ldr r0, _021E63B4 @ =0x000005E5
	bl FUN_0200604C
_021E638E:
	ldr r2, _021E63B0 @ =0x000184DF
	adds r0, r5, #0
	ldrb r2, [r5, r2]
	movs r1, #0
	bl ov108_021E78F4
	ldr r1, _021E63B0 @ =0x000184DF
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov108_021E7CD8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E63A8: .4byte 0x021D110C
_021E63AC: .4byte 0x000005DC
_021E63B0: .4byte 0x000184DF
_021E63B4: .4byte 0x000005E5
	thumb_func_end ov108_021E62B4

	thumb_func_start ov108_021E63B8
ov108_021E63B8: @ 0x021E63B8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _021E643C @ =0x021EA760
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E63D2
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E63D2:
	cmp r0, #6
	bne _021E640C
	ldr r1, _021E6440 @ =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E6444 @ =0x021D114C
	movs r0, #0xd
	lsls r0, r0, #6
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_0201F2CC
	cmp r0, #0
	bne _021E63FC
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E63FC:
	ldr r0, _021E6448 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [r4, #0xc]
	add sp, #8
	movs r0, #4
	pop {r4, pc}
_021E640C:
	ldr r2, _021E644C @ =0x000184DF
	movs r1, #0
	strb r0, [r4, r2]
	adds r0, r2, #1
	strb r1, [r4, r0]
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	bl ov108_021E78F4
	ldr r1, _021E644C @ =0x000184DF
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E7CD8
	ldr r0, _021E6448 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov108_021E6A58
	movs r0, #1
	add sp, #8
	pop {r4, pc}
	nop
_021E643C: .4byte 0x021EA760
_021E6440: .4byte 0x0000FFFE
_021E6444: .4byte 0x021D114C
_021E6448: .4byte 0x000005DC
_021E644C: .4byte 0x000184DF
	thumb_func_end ov108_021E63B8

	thumb_func_start ov108_021E6450
ov108_021E6450: @ 0x021E6450
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E64B4 @ =0x000005DC
	bl FUN_0200604C
	ldr r1, _021E64B8 @ =0x000184E3
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _021E646C
	adds r0, r4, #0
	bl ov108_021E6B00
	movs r0, #1
	pop {r4, pc}
_021E646C:
	subs r0, r1, #3
	ldrb r3, [r4, r0]
	subs r0, r1, #5
	ldrb r2, [r4, r0]
	movs r0, #6
	muls r0, r2, r0
	adds r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r1, #5
	movs r3, #1
	str r3, [r4, r0]
	subs r1, r1, #4
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	adds r0, #0x1c
	bl FUN_0202F91C
	ldr r0, _021E64BC @ =0x000184DF
	movs r2, #0x7a
	ldrb r1, [r4, r0]
	adds r0, r4, #0
	muls r2, r1, r2
	adds r2, r4, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	movs r2, #0
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E79A8
	movs r0, #2
	pop {r4, pc}
	nop
_021E64B4: .4byte 0x000005DC
_021E64B8: .4byte 0x000184E3
_021E64BC: .4byte 0x000184DF
	thumb_func_end ov108_021E6450

	thumb_func_start ov108_021E64C0
ov108_021E64C0: @ 0x021E64C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _021E6694 @ =0x000184E0
	adds r5, r0, #0
	ldrb r2, [r5, r1]
	str r2, [sp]
	ldr r2, _021E6698 @ =0x021D110C
	ldr r7, [r2, #0x48]
	movs r2, #2
	tst r2, r7
	beq _021E64E2
	ldr r0, _021E669C @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021E64E2:
	movs r2, #1
	tst r2, r7
	beq _021E6526
	ldr r2, [sp]
	cmp r2, #6
	blo _021E64FA
	ldr r0, _021E669C @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021E64FA:
	subs r2, r1, #2
	ldrb r3, [r5, r2]
	subs r1, r1, #1
	movs r2, #6
	adds r4, r3, #0
	ldrb r3, [r5, r1]
	movs r1, #0x7a
	muls r4, r2, r4
	muls r1, r3, r1
	adds r1, r5, r1
	ldr r2, [sp]
	ldrb r1, [r1, #0x1c]
	adds r2, r2, r4
	cmp r2, r1
	bne _021E651E
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E651E:
	bl ov108_021E6450
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E6526:
	movs r0, #0xf0
	tst r0, r7
	bne _021E6532
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6532:
	ldr r0, [sp]
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [sp]
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x10
	tst r0, r7
	beq _021E65B6
	cmp r4, #2
	bhs _021E65B6
	cmp r6, #2
	bne _021E65A8
	cmp r4, #0
	bne _021E6576
	movs r0, #1
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E6644
_021E6576:
	cmp r4, #2
	bhs _021E6644
	ldr r1, _021E66A0 @ =0x000184DE
	ldrb r0, [r5, r1]
	cmp r0, #1
	bhs _021E6644
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r1, #4
	ldrb r2, [r5, r0]
	movs r0, #2
	bics r2, r0
	adds r0, r1, #4
	strb r2, [r5, r0]
	ldr r0, [sp, #4]
	movs r1, #3
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #1
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E6644
_021E65A8:
	adds r0, r6, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E6644
_021E65B6:
	movs r0, #0x20
	tst r0, r7
	beq _021E661E
	cmp r4, #2
	bhs _021E661E
	cmp r6, #0
	bne _021E6610
	cmp r4, #1
	bne _021E65DE
	movs r0, #1
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #2
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E6644
_021E65DE:
	cmp r4, #2
	bhs _021E6644
	ldr r1, _021E66A0 @ =0x000184DE
	ldrb r0, [r5, r1]
	cmp r0, #0
	beq _021E6644
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r1, #4
	ldrb r2, [r5, r0]
	movs r0, #2
	orrs r2, r0
	adds r0, r1, #4
	strb r2, [r5, r0]
	ldr r0, [sp, #4]
	movs r1, #3
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #2
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E6644
_021E6610:
	adds r0, r6, #2
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E6644
_021E661E:
	movs r0, #0x40
	tst r0, r7
	beq _021E6632
	adds r0, r4, #2
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	b _021E6644
_021E6632:
	movs r0, #0x80
	tst r0, r7
	beq _021E6644
	adds r0, r4, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
_021E6644:
	lsls r0, r4, #1
	adds r0, r4, r0
	ldr r2, _021E6694 @ =0x000184E0
	adds r0, r6, r0
	strb r0, [r5, r2]
	ldrb r2, [r5, r2]
	adds r0, r5, #0
	movs r1, #1
	bl ov108_021E78F4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021E6676
	ldr r0, _021E66A4 @ =0x000005E1
	bl FUN_0200604C
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E78C0
	add sp, #8
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_021E6676:
	ldr r0, _021E6694 @ =0x000184E0
	ldrb r1, [r5, r0]
	ldr r0, [sp]
	cmp r0, r1
	beq _021E6686
	ldr r0, _021E66A8 @ =0x000005E5
	bl FUN_0200604C
_021E6686:
	adds r0, r5, #0
	bl ov108_021E7EB0
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6694: .4byte 0x000184E0
_021E6698: .4byte 0x021D110C
_021E669C: .4byte 0x000005DC
_021E66A0: .4byte 0x000184DE
_021E66A4: .4byte 0x000005E1
_021E66A8: .4byte 0x000005E5
	thumb_func_end ov108_021E64C0

	thumb_func_start ov108_021E66AC
ov108_021E66AC: @ 0x021E66AC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _021E67E8 @ =0x021EA7D0
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E66C6
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E66C6:
	cmp r0, #6
	beq _021E66D4
	cmp r0, #7
	beq _021E670C
	cmp r0, #8
	beq _021E675A
	b _021E67A6
_021E66D4:
	ldr r1, _021E67EC @ =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E67F0 @ =0x021D114C
	movs r0, #0xd
	lsls r0, r0, #6
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_0201F2CC
	cmp r0, #0
	bne _021E66FA
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E66FA:
	ldr r0, _021E67F4 @ =0x000184E0
	movs r1, #6
	strb r1, [r4, r0]
	ldr r0, _021E67F8 @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	movs r0, #2
	pop {r4, pc}
_021E670C:
	ldr r1, _021E67FC @ =0x000184DE
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _021E671A
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E671A:
	adds r0, r1, #4
	ldrb r2, [r4, r0]
	movs r0, #2
	orrs r2, r0
	adds r0, r1, #4
	strb r2, [r4, r0]
	adds r0, r1, #2
	movs r2, #5
	strb r2, [r4, r0]
	movs r2, #0
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E78C0
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	ldr r0, _021E6800 @ =0x000005E1
	bl FUN_0200604C
	add sp, #8
	movs r0, #3
	pop {r4, pc}
_021E675A:
	ldr r1, _021E67FC @ =0x000184DE
	ldrb r0, [r4, r1]
	cmp r0, #1
	bne _021E6768
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E6768:
	adds r0, r1, #4
	ldrb r2, [r4, r0]
	movs r0, #2
	bics r2, r0
	adds r0, r1, #4
	strb r2, [r4, r0]
	movs r2, #0
	adds r0, r1, #2
	strb r2, [r4, r0]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E78C0
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024964
	ldr r0, _021E6800 @ =0x000005E1
	bl FUN_0200604C
	add sp, #8
	movs r0, #3
	pop {r4, pc}
_021E67A6:
	ldr r2, _021E67F4 @ =0x000184E0
	movs r1, #1
	strb r0, [r4, r2]
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	bl ov108_021E78F4
	adds r0, r4, #0
	bl ov108_021E7EB0
	ldr r1, _021E67F4 @ =0x000184E0
	subs r0, r1, #2
	ldrb r2, [r4, r0]
	ldrb r3, [r4, r1]
	movs r0, #6
	muls r0, r2, r0
	subs r1, r1, #1
	ldrb r2, [r4, r1]
	movs r1, #0x7a
	adds r0, r3, r0
	muls r1, r2, r1
	adds r1, r4, r1
	ldrb r1, [r1, #0x1c]
	cmp r0, r1
	bne _021E67DE
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E67DE:
	adds r0, r4, #0
	bl ov108_021E6450
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021E67E8: .4byte 0x021EA7D0
_021E67EC: .4byte 0x0000FFFE
_021E67F0: .4byte 0x021D114C
_021E67F4: .4byte 0x000184E0
_021E67F8: .4byte 0x000005DC
_021E67FC: .4byte 0x000184DE
_021E6800: .4byte 0x000005E1
	thumb_func_end ov108_021E66AC

	thumb_func_start ov108_021E6804
ov108_021E6804: @ 0x021E6804
	push {r4, lr}
	ldr r2, _021E6848 @ =0x000184E2
	adds r4, r0, #0
	ldrb r3, [r4, r2]
	movs r1, #0xf8
	bics r3, r1
	movs r1, #0x10
	orrs r1, r3
	strb r1, [r4, r2]
	subs r2, r2, #2
	ldrb r2, [r4, r2]
	movs r1, #0
	bl ov108_021E78F4
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DD3C
	ldr r2, _021E684C @ =0x000184DF
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #3
	bl ov108_021E78F4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	movs r3, #1
	bl ov108_021E7700
	pop {r4, pc}
	nop
_021E6848: .4byte 0x000184E2
_021E684C: .4byte 0x000184DF
	thumb_func_end ov108_021E6804

	thumb_func_start ov108_021E6850
ov108_021E6850: @ 0x021E6850
	push {r4, lr}
	ldr r2, _021E6890 @ =0x000184E2
	adds r4, r0, #0
	ldrb r3, [r4, r2]
	movs r1, #0xf8
	bics r3, r1
	strb r3, [r4, r2]
	subs r2, r2, #3
	ldrb r2, [r4, r2]
	movs r1, #0
	bl ov108_021E78F4
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0200DD3C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #3
	adds r3, r2, #0
	bl ov108_021E78C0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #1
	bl ov108_021E7700
	pop {r4, pc}
	nop
_021E6890: .4byte 0x000184E2
	thumb_func_end ov108_021E6850

	thumb_func_start ov108_021E6894
ov108_021E6894: @ 0x021E6894
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021E698C @ =0x021D110C
	adds r5, r0, #0
	ldr r4, [r1, #0x48]
	movs r1, #2
	tst r1, r4
	beq _021E68B4
	bl ov108_021E6850
	movs r0, #2
	str r0, [r5, #0xc]
	ldr r0, _021E6990 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E68B4:
	movs r0, #1
	tst r0, r4
	beq _021E68E8
	ldr r0, _021E6994 @ =0x000184E0
	ldrb r1, [r5, r0]
	cmp r1, #6
	bhs _021E68CA
	subs r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r0, r1
	bne _021E68DE
_021E68CA:
	adds r0, r5, #0
	bl ov108_021E6850
	movs r0, #2
	str r0, [r5, #0xc]
	ldr r0, _021E6990 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E68DE:
	ldr r0, _021E6998 @ =0x0000069C
	bl FUN_0200604C
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_021E68E8:
	movs r0, #0xf0
	tst r0, r4
	bne _021E68F2
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E68F2:
	ldr r0, _021E6994 @ =0x000184E0
	movs r1, #3
	ldrb r6, [r5, r0]
	adds r0, r6, #0
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	bhs _021E6938
	movs r0, #0x10
	tst r0, r4
	beq _021E6926
	adds r0, r7, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
	b _021E6938
_021E6926:
	movs r0, #0x20
	tst r0, r4
	beq _021E6938
	adds r0, r7, #2
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r7, r0, #0x18
_021E6938:
	movs r0, #0x40
	tst r0, r4
	beq _021E694C
	adds r0, r6, #2
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
	b _021E695E
_021E694C:
	movs r0, #0x80
	tst r0, r4
	beq _021E695E
	adds r0, r6, #1
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r6, r0, #0x18
_021E695E:
	lsls r0, r6, #1
	adds r0, r6, r0
	adds r1, r7, r0
	ldr r0, _021E6994 @ =0x000184E0
	cmp r6, #2
	strb r1, [r5, r0]
	blo _021E6976
	ldr r0, _021E698C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0xc0
	tst r0, r1
	beq _021E697C
_021E6976:
	ldr r0, _021E699C @ =0x000005E5
	bl FUN_0200604C
_021E697C:
	ldr r2, _021E6994 @ =0x000184E0
	adds r0, r5, #0
	ldrb r2, [r5, r2]
	movs r1, #0
	bl ov108_021E78F4
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E698C: .4byte 0x021D110C
_021E6990: .4byte 0x000005DC
_021E6994: .4byte 0x000184E0
_021E6998: .4byte 0x0000069C
_021E699C: .4byte 0x000005E5
	thumb_func_end ov108_021E6894

	thumb_func_start ov108_021E69A0
ov108_021E69A0: @ 0x021E69A0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _021E6A3C @ =0x021EA760
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E69BA
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E69BA:
	cmp r0, #6
	bne _021E6A00
	ldr r1, _021E6A40 @ =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E6A44 @ =0x021D114C
	movs r0, #0xd
	lsls r0, r0, #6
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r4, r0]
	movs r1, #3
	bl FUN_0201F2CC
	cmp r0, #0
	bne _021E69E4
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_021E69E4:
	ldr r0, _021E6A48 @ =0x000184E0
	movs r1, #6
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov108_021E6850
	movs r0, #2
	str r0, [r4, #0xc]
	ldr r0, _021E6A4C @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	movs r0, #4
	pop {r4, pc}
_021E6A00:
	ldr r2, _021E6A50 @ =0x000184DF
	ldrb r1, [r4, r2]
	cmp r1, r0
	bne _021E6A1E
	adds r0, r4, #0
	bl ov108_021E6850
	movs r0, #2
	str r0, [r4, #0xc]
	ldr r0, _021E6A4C @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	movs r0, #4
	pop {r4, pc}
_021E6A1E:
	adds r1, r2, #1
	strb r0, [r4, r1]
	adds r2, r2, #1
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	movs r1, #0
	bl ov108_021E78F4
	ldr r0, _021E6A54 @ =0x0000069C
	bl FUN_0200604C
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_021E6A3C: .4byte 0x021EA760
_021E6A40: .4byte 0x0000FFFE
_021E6A44: .4byte 0x021D114C
_021E6A48: .4byte 0x000184E0
_021E6A4C: .4byte 0x000005DC
_021E6A50: .4byte 0x000184DF
_021E6A54: .4byte 0x0000069C
	thumb_func_end ov108_021E69A0

	thumb_func_start ov108_021E6A58
ov108_021E6A58: @ 0x021E6A58
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r0, #0
	add r0, sp, #0xc
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	ldr r0, _021E6AE8 @ =_021EA720
	add r2, sp, #0xc
	ldrh r3, [r0, #0xc]
	ldr r5, _021E6AEC @ =0x021EA748
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #0xe]
	strh r3, [r2, #2]
	ldrh r3, [r0, #0x10]
	strh r3, [r2, #4]
	ldrh r3, [r0, #0x12]
	strh r3, [r2, #6]
	ldrh r3, [r0, #0x14]
	ldrh r0, [r0, #0x16]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r0, _021E6AF0 @ =0x000004B4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r3, [r4, r0]
	adds r0, r0, #4
	str r3, [sp, #0x1c]
	movs r3, #3
	strb r3, [r2, #0x14]
	ldr r2, _021E6AF4 @ =0x000184DF
	ldrb r2, [r4, r2]
	lsls r3, r2, #2
	ldr r2, _021E6AF8 @ =0x021EA74A
	ldrh r2, [r2, r3]
	ldrh r3, [r5, r3]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldr r2, [r4, #0x10]
	lsls r3, r3, #0x18
	lsls r2, r2, #0x18
	ldr r0, [r4, r0]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_020185FC
	ldr r1, _021E6AFC @ =0x000004BC
	ldr r2, _021E6AF4 @ =0x000184DF
	str r0, [r4, r1]
	movs r1, #1
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	adds r3, r1, #0
	bl ov108_021E79A8
	ldr r2, _021E6AF4 @ =0x000184DF
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #4
	movs r3, #1
	bl ov108_021E79A8
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_021E6AE8: .4byte _021EA720
_021E6AEC: .4byte 0x021EA748
_021E6AF0: .4byte 0x000004B4
_021E6AF4: .4byte 0x000184DF
_021E6AF8: .4byte 0x021EA74A
_021E6AFC: .4byte 0x000004BC
	thumb_func_end ov108_021E6A58

	thumb_func_start ov108_021E6B00
ov108_021E6B00: @ 0x021E6B00
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r0, #0x39
	str r1, [sp]
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0xd
	str r1, [sp, #4]
	str r0, [sp, #0xc]
	movs r0, #0x1a
	add r2, sp, #0
	strb r0, [r2, #0x10]
	movs r0, #0x10
	strb r0, [r2, #0x11]
	ldrb r0, [r2, #0x12]
	movs r1, #0xf
	bics r0, r1
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r1, #0xf
	ands r1, r3
	orrs r0, r1
	strb r0, [r2, #0x12]
	ldrb r1, [r2, #0x12]
	movs r0, #0xf0
	bics r1, r0
	movs r0, #0x13
	strb r1, [r2, #0x12]
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl FUN_020166FC
	ldr r2, _021E6B98 @ =0x000184E0
	movs r1, #1
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	adds r3, r1, #0
	bl ov108_021E79A8
	ldr r3, _021E6B9C @ =0x000184DF
	adds r0, r4, #0
	adds r2, r3, #1
	ldrb r1, [r4, r3]
	subs r3, r3, #1
	ldrb r5, [r4, r3]
	movs r3, #6
	ldrb r2, [r4, r2]
	muls r3, r5, r3
	adds r2, r2, r3
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl ov108_021E7BB4
	adds r0, r4, #0
	movs r1, #1
	bl ov108_021E767C
	movs r1, #1
	adds r0, r4, #0
	movs r2, #3
	adds r3, r1, #0
	bl ov108_021E7700
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_021E6B98: .4byte 0x000184E0
_021E6B9C: .4byte 0x000184DF
	thumb_func_end ov108_021E6B00

	thumb_func_start ov108_021E6BA0
ov108_021E6BA0: @ 0x021E6BA0
	push {r4, lr}
	adds r4, r0, #0
	bl ov108_021E8490
	ldr r3, _021E6C34 @ =0x000184E2
	ldrb r0, [r4, r3]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	beq _021E6C16
	movs r0, #0xd
	adds r3, r3, #2
	lsls r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	movs r1, #1
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _021E6C38 @ =0x000184E4
	movs r0, #0xd
	lsls r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _021E6C3C @ =0x000184E6
	movs r0, #0xd
	lsls r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	movs r1, #4
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _021E6C3C @ =0x000184E6
	movs r0, #0xd
	lsls r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	movs r1, #6
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _021E6C3C @ =0x000184E6
	movs r0, #0xd
	lsls r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	movs r1, #5
	movs r2, #3
	bl FUN_0201BC8C
	ldr r1, _021E6C34 @ =0x000184E2
	movs r0, #1
	ldrb r2, [r4, r1]
	bics r2, r0
	strb r2, [r4, r1]
_021E6C16:
	bl FUN_0202061C
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0201EEB4
	ldr r3, _021E6C40 @ =0x027E0000
	ldr r1, _021E6C44 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E6C34: .4byte 0x000184E2
_021E6C38: .4byte 0x000184E4
_021E6C3C: .4byte 0x000184E6
_021E6C40: .4byte 0x027E0000
_021E6C44: .4byte 0x00003FF8
	thumb_func_end ov108_021E6BA0

	thumb_func_start ov108_021E6C48
ov108_021E6C48: @ 0x021E6C48
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6C64 @ =0x021EA780
	add r3, sp, #0
	movs r2, #5
_021E6C52:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6C52
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E6C64: .4byte 0x021EA780
	thumb_func_end ov108_021E6C48

	thumb_func_start ov108_021E6C68
ov108_021E6C68: @ 0x021E6C68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xf4
	adds r5, r0, #0
	bl ov108_021E6C48
	ldr r2, _021E6D0C @ =0x04000304
	ldr r0, _021E6D10 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r5]
	bl FUN_0201AC88
	movs r1, #0xd
	lsls r1, r1, #6
	add r3, sp, #4
	ldr r4, _021E6D14 @ =0x021EA738
	str r0, [r5, r1]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E6D18 @ =0x021EA898
	add r3, sp, #0x14
	movs r2, #0x1c
_021E6CA2:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6CA2
	movs r4, #0
	adds r7, r4, #0
	add r6, sp, #0x14
_021E6CB0:
	movs r0, #0xd
	lsls r0, r0, #6
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0xd
	lsls r0, r0, #6
	lsls r1, r4, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	lsls r0, r4, #0x18
	ldr r3, [r5]
	lsrs r0, r0, #0x18
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	adds r7, r7, #1
	adds r4, r4, #1
	adds r6, #0x1c
	cmp r7, #8
	blt _021E6CB0
	movs r0, #4
	str r0, [sp]
	movs r2, #0x1c
	ldr r0, _021E6D1C @ =0x04000050
	movs r1, #2
	adds r3, r2, #0
	blx FUN_020CF15C
	movs r0, #4
	str r0, [sp]
	ldr r0, _021E6D20 @ =0x04001050
	movs r1, #1
	movs r2, #0x1e
	movs r3, #0x1c
	blx FUN_020CF15C
	add sp, #0xf4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E6D0C: .4byte 0x04000304
_021E6D10: .4byte 0xFFFF7FFF
_021E6D14: .4byte 0x021EA738
_021E6D18: .4byte 0x021EA898
_021E6D1C: .4byte 0x04000050
_021E6D20: .4byte 0x04001050
	thumb_func_end ov108_021E6C68

	thumb_func_start ov108_021E6D24
ov108_021E6D24: @ 0x021E6D24
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r1, #0
	adds r5, r0, #0
	ldr r0, _021E6D74 @ =0x04000050
	adds r2, r1, #0
	movs r3, #0x1f
	str r1, [sp]
	blx FUN_020CF15C
	movs r1, #0
	ldr r0, _021E6D78 @ =0x04001050
	adds r2, r1, #0
	movs r3, #0x1f
	str r1, [sp]
	blx FUN_020CF15C
	movs r6, #0xd
	movs r4, #0
	lsls r6, r6, #6
_021E6D4C:
	lsls r1, r4, #0x18
	ldr r0, [r5, r6]
	lsrs r1, r1, #0x18
	bl FUN_0201BB4C
	adds r4, r4, #1
	cmp r4, #8
	blt _021E6D4C
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	ldr r2, _021E6D7C @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E6D74: .4byte 0x04000050
_021E6D78: .4byte 0x04001050
_021E6D7C: .4byte 0x04000304
	thumb_func_end ov108_021E6D24

	thumb_func_start ov108_021E6D80
ov108_021E6D80: @ 0x021E6D80
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xa6
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	movs r0, #6
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	movs r0, #1
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	movs r0, #5
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	movs r1, #0
	str r1, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0xd
	str r1, [sp, #0x10]
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	movs r0, #7
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	movs r0, #4
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	ldr r0, _021E6F4C @ =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6EA4
	movs r0, #1
	b _021E6EA6
_021E6EA4:
	movs r0, #0
_021E6EA6:
	adds r0, r0, #2
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	adds r2, r4, #0
	movs r3, #0xa6
	bl FUN_0208820C
	ldr r0, [r5]
	ldr r3, _021E6F50 @ =0x000004D8
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x4d
	lsls r3, r3, #4
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, r3, #4
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	ldr r1, _021E6F54 @ =0x000004CC
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200770C
	adds r0, r5, #0
	bl ov108_021E7ADC
	adds r0, r5, #0
	movs r1, #0xff
	movs r2, #0
	bl ov108_021E7BB4
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0201EFBC
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0201EFBC
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0201EFBC
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_0201EFBC
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #7
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_021E6F4C: .4byte 0x000184E3
_021E6F50: .4byte 0x000004D8
_021E6F54: .4byte 0x000004CC
	thumb_func_end ov108_021E6D80

	thumb_func_start ov108_021E6F58
ov108_021E6F58: @ 0x021E6F58
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E6F70 @ =0x000004CC
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
_021E6F70: .4byte 0x000004CC
	thumb_func_end ov108_021E6F58

	thumb_func_start ov108_021E6F74
ov108_021E6F74: @ 0x021E6F74
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02002CEC
	ldr r2, _021E7010 @ =0x000001AD
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	movs r1, #0xc1
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [r5]
	movs r0, #1
	movs r1, #0x11
	bl FUN_0200BD18
	movs r1, #0xc2
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [r5]
	movs r0, #0x51
	bl FUN_02026354
	movs r1, #0xc3
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #8
	ldr r0, [r5, r1]
	movs r1, #9
	bl FUN_0200BBA0
	movs r1, #0xcd
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x30
	ldr r0, [r5, r1]
	movs r1, #0xf
	bl FUN_0200BBA0
	movs r1, #0xce
	lsls r1, r1, #2
	adds r7, r1, #0
	str r0, [r5, r1]
	movs r4, #0
	adds r6, r5, #0
	subs r7, #0x28
_021E6FD8:
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #4
	bl FUN_0200BBA0
	str r0, [r6, r7]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #5
	blt _021E6FD8
	movs r7, #0xc9
	movs r4, #0
	adds r6, r5, #0
	lsls r7, r7, #2
_021E6FF6:
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200BBA0
	str r0, [r6, r7]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #4
	blt _021E6FF6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7010: .4byte 0x000001AD
	thumb_func_end ov108_021E6F74

	thumb_func_start ov108_021E7014
ov108_021E7014: @ 0x021E7014
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0xc9
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_021E7020:
	ldr r0, [r5, r7]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E7020
	movs r7, #0x31
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #4
_021E7036:
	ldr r0, [r4, r7]
	bl FUN_02026380
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #5
	blt _021E7036
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02026380
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02026380
	movs r0, #0xc3
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02026380
	movs r0, #0xc2
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200BDA0
	movs r0, #0xc1
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov108_021E7014

	thumb_func_start ov108_021E7080
ov108_021E7080: @ 0x021E7080
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r7, r0, #0
	movs r0, #0xed
	lsls r0, r0, #2
	ldr r4, _021E71D8 @ =0x021EA7A8
	movs r6, #0
	adds r5, r7, r0
_021E7090:
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r7, r0]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #4
	ble _021E7090
	movs r0, #5
	str r0, [sp, #0x24]
	movs r0, #1
	ldr r4, _021E71DC @ =0x000003A6
	str r0, [sp, #0x20]
	adds r0, r4, #0
	adds r0, #0xe
	movs r5, #0
	adds r6, r7, r0
_021E70C2:
	ldr r0, [sp, #0x20]
	movs r2, #7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
	asrs r0, r5, #1
	lsrs r0, r0, #0x1e
	adds r0, r5, r0
	asrs r1, r0, #2
	movs r0, #1
	eors r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	lsls r0, r0, #1
	adds r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x16
	muls r1, r0, r1
	str r1, [sp, #0x1c]
	subs r4, r4, r1
	ldr r1, [sp, #0x24]
	movs r3, #1
	lsls r1, r1, #4
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r1, [sp]
	movs r1, #0x16
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r1, [sp, #0x2c]
	ldr r0, [r7, r0]
	adds r1, r6, r1
	bl FUN_0201D40C
	lsrs r2, r5, #0x1f
	lsls r1, r5, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r1, r0, #2
	ldr r0, _021E71E0 @ =0x021EA724
	ldr r0, [r0, r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	lsls r1, r1, #0x18
	adds r0, r6, r0
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x28]
	subs r4, r4, r0
	ldr r0, [sp, #0x24]
	movs r2, #7
	adds r0, r0, #1
	lsls r0, r0, #4
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x18]
	movs r3, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #5
	str r0, [sp, #0xc]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r1, [sp, #0x30]
	ldr r0, [r7, r0]
	adds r1, r6, r1
	bl FUN_0201D40C
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x30]
	lsls r1, r1, #0x18
	adds r0, r6, r0
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	ldr r0, [sp, #0x24]
	adds r5, r5, #1
	adds r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	subs r4, #0xa
	adds r0, r0, #4
	str r0, [sp, #0x20]
	cmp r5, #5
	blt _021E70C2
	ldr r0, _021E71E4 @ =0x000004A4
	adds r0, r7, r0
	bl FUN_0201D3C4
	ldr r1, _021E71E8 @ =0x000002E1
	movs r0, #0
	str r1, [sp]
	adds r1, #0x5f
	str r0, [sp, #4]
	ldr r0, [r7, r1]
	ldr r1, _021E71E4 @ =0x000004A4
	movs r2, #6
	adds r1, r7, r1
	movs r3, #2
	bl FUN_0201D494
	ldr r0, _021E71E4 @ =0x000004A4
	movs r1, #0
	adds r0, r7, r0
	bl FUN_0201D9B0
	ldr r0, [r7]
	bl FUN_0201660C
	movs r1, #0x13
	lsls r1, r1, #6
	str r0, [r7, r1]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E71D8: .4byte 0x021EA7A8
_021E71DC: .4byte 0x000003A6
_021E71E0: .4byte 0x021EA724
_021E71E4: .4byte 0x000004A4
_021E71E8: .4byte 0x000002E1
	thumb_func_end ov108_021E7080

	thumb_func_start ov108_021E71EC
ov108_021E71EC: @ 0x021E71EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x13
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_02016624
	ldr r0, _021E7220 @ =0x000004A4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0xed
	lsls r0, r0, #2
	movs r4, #0
	adds r5, r5, r0
_021E720A:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xf
	blt _021E720A
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7220: .4byte 0x000004A4
	thumb_func_end ov108_021E71EC

	thumb_func_start ov108_021E7224
ov108_021E7224: @ 0x021E7224
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #3
	bl FUN_02014918
	ldr r1, _021E729C @ =0x000004B4
	str r0, [r4, r1]
	ldr r1, [r4]
	movs r0, #2
	bl FUN_02014918
	ldr r1, _021E72A0 @ =0x000004B8
	movs r2, #7
	str r0, [r4, r1]
	subs r0, r1, #4
	movs r1, #0xc1
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r3, #0
	bl FUN_02014960
	ldr r0, _021E729C @ =0x000004B4
	movs r1, #0xc1
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #1
	bl FUN_02014960
	ldr r0, _021E729C @ =0x000004B4
	movs r1, #0xc1
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #6
	movs r3, #2
	bl FUN_02014960
	ldr r0, _021E72A0 @ =0x000004B8
	movs r1, #0xc1
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #5
	movs r3, #0
	bl FUN_02014960
	ldr r0, _021E72A0 @ =0x000004B8
	movs r1, #0xc1
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #6
	movs r3, #1
	bl FUN_02014960
	pop {r4, pc}
	.align 2, 0
_021E729C: .4byte 0x000004B4
_021E72A0: .4byte 0x000004B8
	thumb_func_end ov108_021E7224

	thumb_func_start ov108_021E72A4
ov108_021E72A4: @ 0x021E72A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E72C4 @ =0x000004B8
	ldr r0, [r4, r0]
	bl FUN_02014950
	ldr r0, _021E72C8 @ =0x000004B4
	ldr r0, [r4, r0]
	bl FUN_02014950
	ldr r0, _021E72C8 @ =0x000004B4
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_021E72C4: .4byte 0x000004B8
_021E72C8: .4byte 0x000004B4
	thumb_func_end ov108_021E72A4

	thumb_func_start ov108_021E72CC
ov108_021E72CC: @ 0x021E72CC
	push {r4, lr}
	adds r4, r0, #0
	bl ov108_021E838C
	ldr r0, [r4]
	movs r1, #0xc
	movs r2, #1
	movs r3, #2
	bl ov108_021E84A4
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov108_021E83F0
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02018424
	movs r1, #0xd1
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4]
	movs r0, #1
	bl FUN_02013534
	movs r1, #0xe7
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E72CC

	thumb_func_start ov108_021E730C
ov108_021E730C: @ 0x021E730C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020135AC
	movs r0, #0xd1
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02018474
	adds r0, r4, #0
	bl ov108_021E844C
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov108_021E84DC
	adds r0, r4, #0
	bl ov108_021E83C8
	pop {r4, pc}
	thumb_func_end ov108_021E730C

	thumb_func_start ov108_021E733C
ov108_021E733C: @ 0x021E733C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r4, #0
	adds r7, r5, #0
	adds r6, r5, #0
_021E7348:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	str r1, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	adds r3, r0, #0
	movs r0, #0x80
	str r0, [sp]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldrb r0, [r7, #0x1c]
	ldr r2, [sp, #0x10]
	movs r1, #0x48
	muls r1, r2, r1
	str r0, [sp, #8]
	movs r0, #1
	movs r2, #0x48
	muls r2, r3, r2
	str r0, [sp, #0xc]
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r1, #0x38
	adds r2, #0x38
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	movs r3, #2
	bl ov108_021E8540
	movs r1, #0xdb
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r4, r4, #1
	adds r7, #0x7a
	adds r6, r6, #4
	cmp r4, #6
	blt _021E7348
	movs r4, #0
	adds r6, r5, #0
_021E73A4:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	adds r7, r1, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	adds r2, r0, #0
	movs r0, #0x80
	str r0, [sp]
	adds r0, r4, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, _021E74FC @ =0x000184DE
	movs r3, #0x48
	ldrb r1, [r5, r0]
	movs r0, #6
	muls r3, r2, r3
	muls r0, r1, r0
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0x50
	str r0, [sp, #0xc]
	movs r0, #0xd2
	muls r1, r7, r1
	lsls r0, r0, #2
	adds r1, #0x30
	adds r3, #0x38
	lsls r2, r3, #0x10
	lsls r1, r1, #0x10
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	movs r3, #3
	bl ov108_021E8540
	movs r1, #0xe1
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #6
	blt _021E73A4
	subs r1, #0x38
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021E7500 @ =0x021EA7F8
	bl FUN_0200D2B4
	movs r1, #0xd5
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #8
	subs r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7500 @ =0x021EA7F8
	bl FUN_0200D2B4
	movs r1, #0xd6
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0xc
	subs r1, #8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7500 @ =0x021EA7F8
	bl FUN_0200D2B4
	movs r1, #0x36
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x14
	subs r1, #0x10
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7504 @ =0x021EA820
	bl FUN_0200D2B4
	movs r1, #0xd7
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x10
	subs r1, #0xc
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7508 @ =0x021EA848
	bl FUN_0200D2B4
	movs r1, #0xd9
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x18
	subs r1, #0x14
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E750C @ =0x021EA870
	bl FUN_0200D2B4
	movs r1, #0xda
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x10
	ldr r0, [r5, r1]
	movs r1, #3
	bl FUN_0200DD3C
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200DD3C
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200DD3C
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DD3C
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_0200DD60
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE0
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE0
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE0
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE0
	adds r0, r5, #0
	bl ov108_021E756C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E74FC: .4byte 0x000184DE
_021E7500: .4byte 0x021EA7F8
_021E7504: .4byte 0x021EA820
_021E7508: .4byte 0x021EA848
_021E750C: .4byte 0x021EA870
	thumb_func_end ov108_021E733C

	thumb_func_start ov108_021E7510
ov108_021E7510: @ 0x021E7510
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov108_021E7650
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D018
	movs r0, #0xd6
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D018
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D018
	movs r0, #0x36
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0200D018
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D018
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D018
	movs r6, #0xdb
	movs r4, #0
	lsls r6, r6, #2
_021E755A:
	ldr r0, [r5, r6]
	bl ov108_021E8674
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xc
	blt _021E755A
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov108_021E7510

	thumb_func_start ov108_021E756C
ov108_021E756C: @ 0x021E756C
	push {r4, r5, r6, lr}
	sub sp, #0x40
	adds r5, r0, #0
	ldr r0, _021E7648 @ =0x000004A4
	ldr r1, [r5]
	adds r0, r5, r0
	bl FUN_02013910
	movs r1, #0x3a
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_02013948
	adds r6, r0, #0
	ldr r0, _021E7648 @ =0x000004A4
	adds r0, r5, r0
	bl FUN_0201EE90
	movs r1, #0x31
	lsls r1, r1, #4
	adds r4, r0, #0
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r1, r4, #3
	subs r0, r1, r0
	movs r1, #0
	lsrs r3, r0, #1
	movs r2, #0x31
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E764C @ =0x000B0600
	lsls r2, r2, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _021E7648 @ =0x000004A4
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	movs r1, #0xe7
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, #0x4c
	str r0, [sp, #0x10]
	ldr r0, _021E7648 @ =0x000004A4
	adds r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, [r5, r1]
	bl FUN_0200E2B0
	str r0, [sp, #0x18]
	movs r0, #0x35
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200D934
	str r0, [sp, #0x1c]
	movs r0, #3
	str r0, [sp, #0x30]
	movs r0, #0x80
	str r0, [sp, #0x34]
	movs r0, #0xc8
	movs r2, #1
	str r0, [sp, #0x28]
	movs r0, #0xac
	movs r3, #0xea
	lsls r3, r3, #2
	str r2, [sp, #0x38]
	str r0, [sp, #0x2c]
	ldr r0, [r5]
	movs r1, #0
	str r0, [sp, #0x3c]
	adds r0, r6, #0
	adds r3, r5, r3
	bl FUN_02021AC8
	movs r1, #0xeb
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, #0xc
	str r0, [sp, #0x24]
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r1, [r5, r1]
	add r0, sp, #0x10
	bl FUN_02013950
	movs r1, #0xe9
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_020137C0
	movs r0, #0xe9
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	bl FUN_02013850
	add sp, #0x40
	pop {r4, r5, r6, pc}
	nop
_021E7648: .4byte 0x000004A4
_021E764C: .4byte 0x000B0600
	thumb_func_end ov108_021E756C

	thumb_func_start ov108_021E7650
ov108_021E7650: @ 0x021E7650
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xe9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020139C8
	movs r0, #0xea
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02021B5C
	movs r0, #0xe9
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02013938
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E7650

	thumb_func_start ov108_021E767C
ov108_021E767C: @ 0x021E767C
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	movs r0, #0xd
	lsls r0, r0, #6
	adds r4, r1, #0
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	ldr r0, _021E76FC @ =0x000004D8
	lsls r3, r4, #1
	adds r2, r4, r3
	lsls r2, r2, #0x18
	ldr r0, [r5, r0]
	movs r1, #0x18
	str r1, [sp]
	adds r1, r3, #3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	movs r4, #0x15
	subs r3, r4, r3
	lsls r3, r3, #0x18
	str r1, [sp, #0xc]
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	adds r2, r1, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0201C4EC
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_021E76FC: .4byte 0x000004D8
	thumb_func_end ov108_021E767C

	thumb_func_start ov108_021E7700
ov108_021E7700: @ 0x021E7700
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	lsls r5, r0, #4
	movs r0, #0xed
	lsls r0, r0, #2
	adds r4, r7, r0
	adds r0, r4, r5
	bl FUN_0201EE90
	lsls r0, r0, #0x1b
	lsrs r6, r0, #0x18
	adds r0, r4, r5
	bl FUN_0201EE94
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	ldr r0, _021E77CC @ =0x00030102
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	cmp r0, #2
	beq _021E778A
	movs r0, #0xc9
	lsls r0, r0, #2
	adds r0, r7, r0
	str r0, [sp, #0x24]
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r7, #4
	cmp r0, #1
	bhi _021E7780
	ldr r0, _021E77D0 @ =0x000D0C0E
	movs r1, #0xe
	str r0, [sp, #0x18]
	adds r0, r4, r5
	bl FUN_0201D978
	movs r2, #0
	str r6, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r4, r5
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201DA74
	str r6, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r3, [sp, #0x1c]
	adds r0, r4, r5
	subs r3, r3, #2
	lsls r3, r3, #0x10
	movs r1, #6
	movs r2, #0
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	b _021E77AC
_021E7780:
	adds r0, r4, r5
	movs r1, #2
	bl FUN_0201D978
	b _021E77AC
_021E778A:
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r7, r0
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x24]
	lsls r2, r1, #2
	ldr r1, [sp, #0x24]
	movs r0, #0
	ldr r1, [r1, r2]
	adds r2, r0, #0
	bl FUN_02002F30
	subs r0, r6, r0
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	movs r7, #4
_021E77AC:
	str r7, [sp]
	movs r1, #0
	ldr r0, [sp, #0x18]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x14]
	adds r0, r4, r5
	lsls r3, r2, #2
	ldr r2, [sp, #0x24]
	ldr r2, [r2, r3]
	ldr r3, [sp, #0x20]
	bl FUN_020200FC
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E77CC: .4byte 0x00030102
_021E77D0: .4byte 0x000D0C0E
	thumb_func_end ov108_021E7700

	thumb_func_start ov108_021E77D4
ov108_021E77D4: @ 0x021E77D4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #2
	bl FUN_0201D978
	movs r3, #1
	str r3, [sp]
	movs r0, #0xc2
	ldr r2, _021E78B8 @ =0x000184DE
	str r3, [sp, #4]
	ldrb r2, [r5, r2]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r2, #0xc2
	lsls r2, r2, #2
	adds r1, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x2c
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201EE90
	movs r1, #0xc3
	lsls r1, r1, #2
	adds r4, r0, #0
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r1, r4, #3
	subs r0, r1, r0
	movs r1, #0
	lsrs r3, r0, #1
	str r1, [sp]
	movs r2, #0xf9
	ldr r0, _021E78BC @ =0x00030102
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsls r2, r2, #2
	adds r0, r5, r2
	str r1, [sp, #0xc]
	subs r2, #0xd8
	ldr r2, [r5, r2]
	bl FUN_020200FC
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0201EFBC
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, _021E78B8 @ =0x000184DE
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E7878
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
	b _021E7884
_021E7878:
	movs r0, #0xd9
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	bl FUN_020248F0
_021E7884:
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, _021E78B8 @ =0x000184DE
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021E78A8
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #7
	bl FUN_020248F0
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E78A8:
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_020248F0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E78B8: .4byte 0x000184DE
_021E78BC: .4byte 0x00030102
	thumb_func_end ov108_021E77D4

	thumb_func_start ov108_021E78C0
ov108_021E78C0: @ 0x021E78C0
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	cmp r3, #0
	bne _021E78DA
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	pop {r4, r5, r6, pc}
_021E78DA:
	movs r2, #0xd5
	lsls r2, r2, #2
	lsls r4, r1, #2
	adds r5, r0, r2
	ldr r0, [r5, r4]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, r4]
	adds r1, r6, #0
	bl FUN_020248F0
	pop {r4, r5, r6, pc}
	thumb_func_end ov108_021E78C0

	thumb_func_start ov108_021E78F4
ov108_021E78F4: @ 0x021E78F4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #0
	cmp r7, #6
	blo _021E790C
	movs r0, #0xe0
	str r0, [sp]
	movs r2, #0xb4
	movs r6, #1
	b _021E7984
_021E790C:
	cmp r4, #1
	beq _021E795E
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	movs r0, #0x48
	muls r0, r1, r0
	adds r0, #0x38
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	movs r1, #0x48
	muls r1, r0, r1
	adds r1, #0x38
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
	cmp r4, #2
	bne _021E7942
	adds r2, #0xc0
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	b _021E7984
_021E7942:
	cmp r4, #3
	bne _021E794A
	movs r6, #2
	b _021E7984
_021E794A:
	cmp r4, #0
	bne _021E7984
	ldr r0, _021E79A4 @ =0x000184E2
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	cmp r0, #2
	bne _021E7984
	movs r6, #3
	b _021E7984
_021E795E:
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, #0x30
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	movs r1, #0x48
	muls r1, r0, r1
	adds r1, #0x38
	lsls r0, r1, #0x10
	asrs r2, r0, #0x10
_021E7984:
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xd5
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [sp]
	bl FUN_0200DD88
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl ov108_021E78C0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E79A4: .4byte 0x000184E2
	thumb_func_end ov108_021E78F4

	thumb_func_start ov108_021E79A8
ov108_021E79A8: @ 0x021E79A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	cmp r3, #0
	bne _021E79D0
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0201CAE0
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0201EFBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_021E79D0:
	ldr r0, _021E7AD4 @ =0x000004D4
	movs r2, #0x20
	ldr r0, [r5, r0]
	movs r6, #0x18
	str r2, [sp]
	adds r2, r0, #0
	str r6, [sp, #4]
	adds r2, #0xc
	str r2, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r2, [r0]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	adds r2, r3, #0
	ldr r3, _021E7AD8 @ =0x000184E2
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldrb r3, [r5, r3]
	movs r0, #0xd
	lsls r0, r0, #6
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x1b
	muls r6, r3, r6
	lsls r3, r6, #0x18
	ldr r0, [r5, r0]
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	ldr r0, _021E7AD8 @ =0x000184E2
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1b
	bne _021E7A80
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #3
	adds r0, r1, r0
	adds r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r1, r0, #3
	adds r0, r0, r1
	adds r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r4, #4
	bne _021E7AA6
	ldr r0, _021E7AD4 @ =0x000004D4
	movs r1, #0x20
	ldr r0, [r5, r0]
	movs r2, #0
	str r1, [sp]
	movs r1, #3
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	movs r3, #0x15
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	adds r1, r4, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0201C4EC
	b _021E7AA6
_021E7A80:
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	movs r0, #0xa
	muls r0, r1, r0
	adds r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #3
	blx FUN_020F2998
	lsls r1, r0, #3
	adds r0, r0, r1
	adds r0, #0x1b
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_021E7AA6:
	str r6, [sp]
	movs r0, #8
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0201C8C4
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0201EFBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7AD4: .4byte 0x000004D4
_021E7AD8: .4byte 0x000184E2
	thumb_func_end ov108_021E79A8

	thumb_func_start ov108_021E7ADC
ov108_021E7ADC: @ 0x021E7ADC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #0x10]
	movs r0, #0
	movs r5, #1
	str r0, [sp, #0x1c]
_021E7AE8:
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	movs r1, #3
	blx FUN_020F2998
	lsls r1, r0, #3
	adds r0, r0, r1
	adds r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #3
	blx FUN_020F2998
	lsls r0, r1, #3
	adds r0, r1, r0
	adds r0, r0, #3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_021E7B12:
	ldr r0, [sp, #0x14]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_021E7B1A:
	str r6, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x11
	lsls r2, r5, #0x10
	str r0, [sp, #0xc]
	movs r0, #0xd
	adds r3, r7, r4
	lsls r3, r3, #0x18
	ldr r1, [sp, #0x10]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	movs r1, #5
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	adds r5, r5, #1
	bl FUN_0201C8C4
	adds r4, r4, #1
	cmp r4, #8
	blt _021E7B1A
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #8
	blt _021E7B12
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #6
	blt _021E7AE8
	movs r1, #0xd
	ldr r0, [sp, #0x10]
	lsls r1, r1, #6
	ldr r0, [r0, r1]
	movs r1, #5
	bl FUN_0201EFBC
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov108_021E7ADC

	thumb_func_start ov108_021E7B74
ov108_021E7B74: @ 0x021E7B74
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	adds r3, #0x12
	adds r4, r2, #0
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r3, #0
	movs r2, #0
	add r3, sp, #4
	bl FUN_02007C10
	adds r6, r0, #0
	lsls r0, r4, #6
	adds r0, r0, #1
	str r0, [sp]
	movs r0, #0xd
	ldr r2, [sp, #4]
	lsls r0, r0, #6
	movs r3, #1
	ldr r0, [r5, r0]
	ldr r2, [r2, #0x14]
	movs r1, #5
	lsls r3, r3, #0xc
	bl FUN_0201C0C0
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov108_021E7B74

	thumb_func_start ov108_021E7BB4
ov108_021E7BB4: @ 0x021E7BB4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, [r6]
	movs r0, #0xa6
	adds r5, r2, #0
	bl FUN_02007688
	adds r7, r0, #0
	cmp r4, #6
	blo _021E7BE6
	movs r4, #0
	adds r5, r6, #0
_021E7BCE:
	ldrb r3, [r5, #0x1c]
	lsls r2, r4, #0x18
	adds r0, r6, #0
	adds r1, r7, #0
	lsrs r2, r2, #0x18
	bl ov108_021E7B74
	adds r4, r4, #1
	adds r5, #0x7a
	cmp r4, #6
	blt _021E7BCE
	b _021E7BF2
_021E7BE6:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl ov108_021E7B74
_021E7BF2:
	adds r0, r7, #0
	bl FUN_0200770C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov108_021E7BB4

	thumb_func_start ov108_021E7BFC
ov108_021E7BFC: @ 0x021E7BFC
	push {r4, lr}
	adds r4, r0, #0
	bl ov108_021E7C5C
	ldr r1, _021E7C54 @ =0x000184DF
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E7CD8
	adds r0, r4, #0
	movs r1, #0
	bl ov108_021E767C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #1
	bl ov108_021E7700
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E7C30
	adds r0, r4, #0
	bl ov108_021E61E8
	b _021E7C36
_021E7C30:
	adds r0, r4, #0
	bl ov108_021E6238
_021E7C36:
	ldr r0, _021E7C58 @ =0x000184E4
	movs r2, #0
	strh r2, [r4, r0]
	subs r2, #0xc0
	adds r1, r0, #2
	strh r2, [r4, r1]
	subs r1, r0, #2
	ldrb r2, [r4, r1]
	movs r1, #1
	subs r0, r0, #2
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_021E7C54: .4byte 0x000184DF
_021E7C58: .4byte 0x000184E4
	thumb_func_end ov108_021E7BFC

	thumb_func_start ov108_021E7C5C
ov108_021E7C5C: @ 0x021E7C5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _021E7CD0 @ =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E7CCC
	movs r0, #0xed
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r4, #0
	movs r6, #5
	str r0, [sp, #0x10]
_021E7C76:
	movs r0, #0xc1
	movs r2, #0xc3
	lsls r0, r0, #2
	lsls r2, r2, #2
	adds r1, r4, #0
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	adds r1, #0xa
	lsls r7, r6, #4
	bl FUN_0200BB6C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	lsrs r2, r4, #0x1f
	lsls r1, r4, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r1, r0, #2
	ldr r0, _021E7CD4 @ =0x021EA724
	movs r2, #0xc3
	ldr r0, [r0, r1]
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, r0, r7
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	adds r0, r0, r7
	bl FUN_0201D578
	adds r4, r4, #1
	adds r6, r6, #2
	cmp r4, #5
	blt _021E7C76
_021E7CCC:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7CD0: .4byte 0x000184E3
_021E7CD4: .4byte 0x021EA724
	thumb_func_end ov108_021E7C5C

	thumb_func_start ov108_021E7CD8
ov108_021E7CD8: @ 0x021E7CD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	cmp r1, #6
	blo _021E7D3E
	ldr r0, _021E7EA4 @ =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E7D24
	movs r0, #0xed
	lsls r0, r0, #2
	movs r6, #0
	movs r4, #6
	adds r7, r5, r0
_021E7CF4:
	lsrs r3, r6, #0x1f
	lsls r2, r6, #0x1f
	subs r2, r2, r3
	movs r1, #0x1f
	rors r2, r1
	adds r1, r3, r2
	lsls r2, r1, #2
	ldr r1, _021E7EA8 @ =0x021EA724
	lsls r0, r4, #4
	ldr r1, [r1, r2]
	str r0, [sp, #0x20]
	lsls r1, r1, #0x18
	adds r0, r7, r0
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	ldr r0, [sp, #0x20]
	adds r0, r7, r0
	bl FUN_0201D5C8
	adds r6, r6, #1
	adds r4, r4, #2
	cmp r6, #5
	blt _021E7CF4
_021E7D24:
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xc
	bl FUN_0201D978
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_021E7D3E:
	adds r3, r5, #0
	movs r6, #0xfd
	movs r0, #0x7a
	adds r2, r1, #0
	adds r3, #0x1c
	muls r2, r0, r2
	adds r0, r3, r2
	ldrb r1, [r3, r2]
	lsls r6, r6, #2
	str r0, [sp, #0x1c]
	adds r0, r6, #0
	adds r2, r6, #0
	subs r0, #0xf0
	subs r2, #0xe8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	adds r1, #0x10
	bl FUN_0200BB6C
	adds r0, r5, r6
	bl FUN_0201EE90
	adds r1, r6, #0
	subs r1, #0xe8
	adds r4, r0, #0
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r1, r4, #3
	subs r0, r1, r0
	lsls r0, r0, #0x17
	lsrs r4, r0, #0x18
	adds r0, r5, r6
	movs r1, #0xc
	bl FUN_0201D978
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7EAC @ =0x00080B0C
	adds r2, r6, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	subs r2, #0xe8
	ldr r2, [r5, r2]
	adds r0, r5, r6
	adds r3, r4, #0
	bl FUN_020200FC
	adds r0, r5, r6
	bl FUN_0201D5C8
	ldr r0, _021E7EA4 @ =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E7E9E
	add r0, sp, #0x24
	adds r0, #3
	movs r1, #0
	movs r2, #5
	blx FUN_020D4994
	ldr r0, [sp, #0x1c]
	movs r4, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	ble _021E7E02
	ldr r6, [sp, #0x1c]
	add r7, sp, #0x24
_021E7DD0:
	ldrb r1, [r6, #2]
	add r0, sp, #0x24
	movs r2, #2
	bl FUN_02097268
	ldrb r1, [r7, #2]
	cmp r1, #0
	bne _021E7DE8
	ldrb r0, [r7, #7]
	adds r0, r0, #1
	strb r0, [r7, #7]
	b _021E7DF6
_021E7DE8:
	add r0, sp, #0x24
	adds r0, #3
	adds r0, r0, r1
	subs r0, r0, #1
	ldrb r1, [r0]
	adds r1, r1, #1
	strb r1, [r0]
_021E7DF6:
	ldr r0, [sp, #0x1c]
	adds r4, r4, #1
	ldrb r0, [r0, #1]
	adds r6, r6, #4
	cmp r4, r0
	blt _021E7DD0
_021E7E02:
	movs r0, #6
	str r0, [sp, #0x18]
	add r0, sp, #0x24
	adds r0, #3
	str r0, [sp, #0x14]
	movs r0, #0xed
	lsls r0, r0, #2
	movs r7, #0
	adds r6, r5, r0
_021E7E14:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x14]
	lsls r4, r0, #4
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xc2
	lsls r0, r0, #2
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #0xc2
	movs r1, #0xc3
	movs r2, #0xce
	lsls r0, r0, #2
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	lsrs r2, r7, #0x1f
	lsls r1, r7, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	lsls r1, r0, #2
	ldr r0, _021E7EA8 @ =0x021EA724
	ldr r0, [r0, r1]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, r6, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	movs r2, #0xc3
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	lsls r2, r2, #2
	movs r1, #0
	ldr r2, [r5, r2]
	adds r0, r6, r4
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r6, r4
	bl FUN_0201D5C8
	ldr r0, [sp, #0x18]
	adds r7, r7, #1
	adds r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r7, #5
	blt _021E7E14
_021E7E9E:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7EA4: .4byte 0x000184E3
_021E7EA8: .4byte 0x021EA724
_021E7EAC: .4byte 0x00080B0C
	thumb_func_end ov108_021E7CD8

	thumb_func_start ov108_021E7EB0
ov108_021E7EB0: @ 0x021E7EB0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	movs r4, #0xfd
	adds r5, r0, #0
	lsls r4, r4, #2
	adds r0, r5, r4
	movs r1, #0xc
	bl FUN_0201D978
	ldr r1, _021E7F70 @ =0x000184DF
	adds r2, r4, #0
	ldrb r3, [r5, r1]
	movs r1, #0x7a
	subs r2, #0xf0
	muls r1, r3, r1
	adds r1, r5, r1
	ldrb r1, [r1, #0x1c]
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	adds r1, #0x10
	bl FUN_0200BB6C
	adds r1, r4, #0
	subs r1, #0xe8
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x60
	subs r0, r1, r0
	lsls r0, r0, #0x17
	lsrs r3, r0, #0x18
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7F74 @ =0x00080B0C
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	subs r2, #0xe8
	ldr r2, [r5, r2]
	adds r0, r5, r4
	bl FUN_020200FC
	ldr r3, _021E7F78 @ =0x000184E0
	ldrb r1, [r5, r3]
	cmp r1, #6
	bhs _021E7F66
	subs r3, r3, #2
	adds r2, r4, #0
	ldrb r6, [r5, r3]
	subs r2, #0xf0
	ldr r0, [r5, r2]
	movs r3, #6
	adds r2, #8
	adds r1, #0x10
	muls r3, r6, r3
	ldr r2, [r5, r2]
	adds r1, r1, r3
	bl FUN_0200BB6C
	adds r1, r4, #0
	subs r1, #0xe8
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x60
	subs r0, r1, r0
	lsls r0, r0, #0x17
	lsrs r3, r0, #0x18
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7F74 @ =0x00080B0C
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	subs r2, #0xe8
	ldr r2, [r5, r2]
	adds r0, r5, r4
	adds r3, #0x90
	bl FUN_020200FC
_021E7F66:
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7F70: .4byte 0x000184DF
_021E7F74: .4byte 0x00080B0C
_021E7F78: .4byte 0x000184E0
	thumb_func_end ov108_021E7EB0

	thumb_func_start ov108_021E7F7C
ov108_021E7F7C: @ 0x021E7F7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r1, _021E80DC @ =0x000184E2
	adds r6, r0, #0
	ldrb r1, [r6, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1b
	bne _021E7FF4
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	movs r0, #0xd
	lsls r0, r0, #6
	movs r2, #0
	ldr r0, [r6, r0]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_0201EFBC
	movs r0, #0xbf
	ldr r2, _021E80E0 @ =0x000184E6
	mvns r0, r0
	strh r0, [r6, r2]
	subs r0, r2, #4
	ldrb r3, [r6, r0]
	movs r0, #1
	movs r1, #1
	bics r3, r0
	orrs r3, r1
	subs r0, r2, #4
	strb r3, [r6, r0]
	subs r0, r2, #6
	movs r3, #0
	strb r3, [r6, r0]
	subs r2, r2, #6
	ldrb r2, [r6, r2]
	adds r0, r6, #0
	bl ov108_021E78F4
	ldr r2, _021E80E4 @ =0x000184DF
	adds r0, r6, #0
	ldrb r2, [r6, r2]
	movs r1, #2
	bl ov108_021E78F4
	adds r0, r6, #0
	bl ov108_021E77D4
	b _021E807E
_021E7FF4:
	movs r1, #1
	movs r2, #0xff
	movs r3, #0
	bl ov108_021E79A8
	movs r2, #0
	adds r0, r6, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov108_021E78C0
	ldr r0, _021E80DC @ =0x000184E2
	movs r4, #0
	ldrb r0, [r6, r0]
	adds r7, r6, #0
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1f
	movs r0, #6
	muls r0, r1, r0
	str r0, [sp, #0x14]
	lsls r0, r0, #2
	adds r5, r6, r0
_021E8020:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	str r1, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	adds r3, r0, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	movs r1, #0x48
	muls r1, r2, r1
	movs r2, #0x48
	muls r2, r3, r2
	adds r1, #0x38
	subs r2, #0x88
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	bl FUN_0200DD54
	ldr r1, [sp, #0x14]
	movs r0, #0xd2
	lsls r0, r0, #2
	adds r1, r4, r1
	lsls r1, r1, #0x18
	ldrb r2, [r7, #0x1c]
	ldr r0, [r6, r0]
	lsrs r1, r1, #0x18
	bl ov108_021E84F8
	adds r4, r4, #1
	adds r5, r5, #4
	adds r7, #0x7a
	cmp r4, #6
	blt _021E8020
_021E807E:
	ldr r0, _021E80E8 @ =0x000184E1
	movs r1, #0
	strb r1, [r6, r0]
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r6, r0
	movs r1, #0xc
	bl FUN_0201D978
	movs r0, #0xfd
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D5C8
	ldr r0, _021E80EC @ =0x04001040
	movs r1, #0xf0
	strh r1, [r0]
	movs r1, #0x10
	adds r4, r0, #0
	strh r1, [r0, #4]
	adds r4, #8
	ldrh r3, [r4]
	movs r2, #0x3f
	movs r1, #0xf
	bics r3, r2
	orrs r1, r3
	movs r3, #0x20
	orrs r1, r3
	strh r1, [r4]
	adds r4, r0, #0
	adds r4, #0xa
	ldrh r5, [r4]
	movs r1, #0x1f
	subs r0, #0x40
	bics r5, r2
	orrs r1, r5
	orrs r1, r3
	strh r1, [r4]
	ldr r2, [r0]
	ldr r1, _021E80F0 @ =0xFFFF1FFF
	ands r2, r1
	lsls r1, r3, #8
	orrs r1, r2
	str r1, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E80DC: .4byte 0x000184E2
_021E80E0: .4byte 0x000184E6
_021E80E4: .4byte 0x000184DF
_021E80E8: .4byte 0x000184E1
_021E80EC: .4byte 0x04001040
_021E80F0: .4byte 0xFFFF1FFF
	thumb_func_end ov108_021E7F7C

	thumb_func_start ov108_021E80F4
ov108_021E80F4: @ 0x021E80F4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _021E81A0 @ =0x000184E2
	ldrb r1, [r5, r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1b
	bne _021E811A
	adds r1, r0, #2
	ldrsh r2, [r5, r1]
	movs r7, #0x17
	mvns r7, r7
	adds r2, #0x18
	strh r2, [r5, r1]
	adds r1, r0, #4
	ldrsh r1, [r5, r1]
	adds r0, r0, #4
	adds r1, #0x18
	strh r1, [r5, r0]
	b _021E812E
_021E811A:
	adds r1, r0, #2
	ldrsh r2, [r5, r1]
	movs r7, #0x18
	subs r2, #0x18
	strh r2, [r5, r1]
	adds r1, r0, #4
	ldrsh r1, [r5, r1]
	adds r0, r0, #4
	subs r1, #0x18
	strh r1, [r5, r0]
_021E812E:
	ldr r1, _021E81A0 @ =0x000184E2
	movs r0, #1
	ldrb r2, [r5, r1]
	movs r4, #0
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	strb r0, [r5, r1]
	lsls r0, r7, #0x10
	asrs r6, r0, #0x10
_021E8142:
	ldr r0, _021E81A0 @ =0x000184E2
	adds r2, r6, #0
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1f
	movs r0, #6
	muls r0, r1, r0
	adds r0, r4, r0
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	adds r4, r4, #1
	cmp r4, #6
	blt _021E8142
	movs r0, #0xd5
	lsls r0, r0, #2
	lsls r2, r7, #0x10
	ldr r0, [r5, r0]
	movs r1, #0
	asrs r2, r2, #0x10
	bl FUN_0200DEA0
	movs r0, #0xd7
	lsls r0, r0, #2
	lsls r2, r7, #0x10
	ldr r0, [r5, r0]
	movs r1, #0
	asrs r2, r2, #0x10
	bl FUN_0200DEA0
	ldr r0, _021E81A4 @ =0x000184E1
	ldrb r1, [r5, r0]
	adds r1, r1, #1
	strb r1, [r5, r0]
	ldrb r0, [r5, r0]
	cmp r0, #8
	blo _021E819A
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E819A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E81A0: .4byte 0x000184E2
_021E81A4: .4byte 0x000184E1
	thumb_func_end ov108_021E80F4

	thumb_func_start ov108_021E81A8
ov108_021E81A8: @ 0x021E81A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _021E8264 @ =0x000184E2
	adds r6, r0, #0
	ldrb r0, [r6, r1]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E81CA
	subs r0, r1, #4
	ldrb r0, [r6, r0]
	adds r2, r0, #1
	subs r0, r1, #4
	strb r2, [r6, r0]
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	b _021E81DA
_021E81CA:
	subs r0, r1, #4
	ldrb r0, [r6, r0]
	subs r2, r0, #1
	subs r0, r1, #4
	strb r2, [r6, r0]
	movs r0, #0xff
	mvns r0, r0
	str r0, [sp]
_021E81DA:
	ldr r0, _021E8264 @ =0x000184E2
	movs r4, #0
	ldrb r0, [r6, r0]
	lsls r0, r0, #0x1d
	lsrs r1, r0, #0x1f
	movs r0, #6
	muls r0, r1, r0
	str r0, [sp, #4]
	lsls r0, r0, #2
	adds r5, r6, r0
_021E81EE:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	adds r7, r1, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	movs r1, #0x50
	muls r1, r7, r1
	adds r2, r0, #0
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r3, [sp]
	adds r1, #0x30
	adds r1, r3, r1
	movs r3, #0x48
	muls r3, r2, r3
	adds r3, #0x38
	lsls r1, r1, #0x10
	lsls r2, r3, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r2, _021E8268 @ =0x000184DE
	ldr r1, [sp, #4]
	ldrb r3, [r6, r2]
	movs r2, #6
	movs r0, #0xd2
	muls r2, r3, r2
	lsls r0, r0, #2
	adds r1, r4, r1
	adds r2, r4, r2
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, [r6, r0]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl ov108_021E84F8
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _021E81EE
	ldr r0, _021E826C @ =0x000184E1
	movs r1, #0
	strb r1, [r6, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8264: .4byte 0x000184E2
_021E8268: .4byte 0x000184DE
_021E826C: .4byte 0x000184E1
	thumb_func_end ov108_021E81A8

	thumb_func_start ov108_021E8270
ov108_021E8270: @ 0x021E8270
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _021E82D8 @ =0x000184E2
	ldrb r0, [r7, r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E8284
	movs r0, #0x1f
	mvns r0, r0
	b _021E8286
_021E8284:
	movs r0, #0x20
_021E8286:
	lsls r0, r0, #0x10
	movs r4, #0
	adds r5, r7, #0
	asrs r6, r0, #0x10
_021E828E:
	movs r0, #0xdb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	movs r2, #0
	bl FUN_0200DED0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xc
	blt _021E828E
	ldr r2, _021E82DC @ =0x000184E1
	ldrb r0, [r7, r2]
	adds r0, r0, #1
	strb r0, [r7, r2]
	ldrb r0, [r7, r2]
	cmp r0, #8
	blo _021E82D2
	movs r0, #0
	strb r0, [r7, r2]
	subs r2, r2, #1
	ldrb r2, [r7, r2]
	adds r0, r7, #0
	movs r1, #1
	bl ov108_021E78F4
	adds r0, r7, #0
	bl ov108_021E7EB0
	adds r0, r7, #0
	bl ov108_021E77D4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E82D2:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E82D8: .4byte 0x000184E2
_021E82DC: .4byte 0x000184E1
	thumb_func_end ov108_021E8270

	thumb_func_start ov108_021E82E0
ov108_021E82E0: @ 0x021E82E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp]
	ldr r1, _021E837C @ =0x000184E2
	adds r6, r0, #0
	ldrb r0, [r6, r1]
	add r3, sp, #8
	lsls r0, r0, #0x1d
	lsrs r2, r0, #0x1f
	movs r0, #6
	muls r0, r2, r0
	subs r2, r1, #3
	ldrb r2, [r6, r2]
	adds r2, r2, r0
	strb r2, [r3, #2]
	subs r2, r1, #2
	ldrb r2, [r6, r2]
	adds r0, r2, r0
	strb r0, [r3, #3]
	subs r0, r1, #3
	ldrb r0, [r6, r0]
	movs r1, #3
	blx FUN_020F2998
	add r1, sp, #8
	strb r0, [r1]
	ldr r0, _021E8380 @ =0x000184E0
	movs r1, #3
	ldrb r0, [r6, r0]
	blx FUN_020F2998
	add r1, sp, #8
	strb r0, [r1, #1]
	ldr r0, [sp]
	add r5, sp, #8
	ldr r1, _021E8384 @ =_021EA720
	lsls r0, r0, #1
	adds r0, r1, r0
	movs r7, #0
	add r4, sp, #8
	adds r5, #2
	str r0, [sp, #4]
_021E8334:
	ldrb r3, [r4]
	ldrb r0, [r5]
	ldr r2, [sp, #4]
	ldrsb r3, [r2, r3]
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0xdb
	movs r2, #0xc
	lsls r0, r0, #2
	muls r2, r3, r2
	ldr r0, [r1, r0]
	lsls r2, r2, #0x10
	movs r1, #0
	asrs r2, r2, #0x10
	bl FUN_0200DED0
	adds r7, r7, #1
	adds r4, r4, #1
	adds r5, r5, #1
	cmp r7, #2
	blt _021E8334
	ldr r0, _021E8388 @ =0x000184E1
	ldrb r1, [r6, r0]
	adds r1, r1, #1
	strb r1, [r6, r0]
	ldrb r1, [r6, r0]
	cmp r1, #8
	blo _021E8376
	movs r1, #0
	strb r1, [r6, r0]
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E8376:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E837C: .4byte 0x000184E2
_021E8380: .4byte 0x000184E0
_021E8384: .4byte _021EA720
_021E8388: .4byte 0x000184E1
	thumb_func_end ov108_021E82E0

	thumb_func_start ov108_021E838C
ov108_021E838C: @ 0x021E838C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	movs r1, #0xd3
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _021E83C0 @ =0x021EA9A0
	ldr r2, _021E83C4 @ =0x021EA98C
	movs r3, #4
	bl FUN_0200CF70
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	pop {r4, pc}
	nop
_021E83C0: .4byte 0x021EA9A0
_021E83C4: .4byte 0x021EA98C
	thumb_func_end ov108_021E838C

	thumb_func_start ov108_021E83C8
ov108_021E83C8: @ 0x021E83C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D108
	movs r0, #0xd3
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	pop {r4, pc}
	thumb_func_end ov108_021E83C8

	thumb_func_start ov108_021E83F0
ov108_021E83F0: @ 0x021E83F0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xd3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E8442
	bl FUN_0200CF38
	movs r1, #0x35
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x8c
	bl FUN_0200CFF4
	movs r1, #0xd3
	movs r0, #0
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _021E8448 @ =0x021EA97C
	movs r3, #2
	bl FUN_0200D2A4
	movs r0, #0x35
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200E2B0
	adds r1, r0, #0
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov108_021E853C
_021E8442:
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E8448: .4byte 0x021EA97C
	thumb_func_end ov108_021E83F0

	thumb_func_start ov108_021E844C
ov108_021E844C: @ 0x021E844C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x35
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E846A
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200D0E4
	movs r0, #0x35
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r4, r0]
_021E846A:
	pop {r4, pc}
	thumb_func_end ov108_021E844C

	thumb_func_start ov108_021E846C
ov108_021E846C: @ 0x021E846C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E847E
	bl ov108_021E852C
_021E847E:
	movs r0, #0x35
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E848C
	bl FUN_0200D020
_021E848C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E846C

	thumb_func_start ov108_021E8490
ov108_021E8490: @ 0x021E8490
	push {r3, lr}
	movs r1, #0xd3
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _021E84A0
	bl FUN_0200D034
_021E84A0:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov108_021E8490

	thumb_func_start ov108_021E84A4
ov108_021E84A4: @ 0x021E84A4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	movs r1, #0x59
	lsls r1, r1, #2
	adds r5, r0, #0
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	movs r2, #0x59
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	str r5, [r4]
	movs r0, #4
	strh r0, [r4, #0xa]
	strh r6, [r4, #0xc]
	ldr r0, [sp]
	strh r7, [r4, #0xe]
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov108_021E867C
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov108_021E84A4

	thumb_func_start ov108_021E84DC
ov108_021E84DC: @ 0x021E84DC
	push {r4, lr}
	adds r4, r0, #0
	bl ov108_021E8718
	movs r2, #0x59
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov108_021E84DC

	thumb_func_start ov108_021E84F8
ov108_021E84F8: @ 0x021E84F8
	push {r4, lr}
	sub sp, #8
	adds r3, r2, #0
	movs r2, #0x55
	lsls r2, r2, #2
	ldr r4, [r0, r2]
	lsls r1, r1, #2
	ldr r4, [r4]
	subs r2, #0x10
	ldr r4, [r4, r1]
	movs r1, #0
	str r1, [sp]
	ldr r1, [r0]
	adds r3, #0x12
	str r1, [sp, #4]
	ldr r0, [r0, r2]
	adds r1, r4, #0
	movs r2, #0xa6
	bl FUN_0200A2E4
	adds r0, r4, #0
	bl FUN_0200AE8C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E84F8

	thumb_func_start ov108_021E852C
ov108_021E852C: @ 0x021E852C
	push {r3, lr}
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _021E8538
	bl FUN_0202457C
_021E8538:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov108_021E852C

	thumb_func_start ov108_021E853C
ov108_021E853C: @ 0x021E853C
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov108_021E853C

	thumb_func_start ov108_021E8540
ov108_021E8540: @ 0x021E8540
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	adds r5, r0, #0
	str r3, [sp, #0x2c]
	adds r6, r1, #0
	ldr r0, [r5]
	movs r1, #0x10
	adds r7, r2, #0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x10
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r5]
	movs r1, #8
	bl FUN_0201AA8C
	str r0, [r4, #8]
	ldr r0, [r5]
	movs r1, #0x24
	bl FUN_0201AA8C
	ldr r1, [r4, #8]
	movs r3, #0xe
	str r0, [r1]
	ldr r0, [r4, #8]
	lsls r3, r3, #0xc
	ldr r0, [r0]
	movs r1, #0
	str r0, [r4, #4]
	movs r0, #0
	str r3, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x10]
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	str r2, [sp, #0x14]
	adds r2, r0, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r0, #0
	adds r2, #8
	ldr r2, [r5, r2]
	adds r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	adds r2, r3, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	add r1, sp, #0x68
	ldrb r1, [r1, #0x14]
	ldr r0, [r4, #4]
	adds r1, r1, r3
	bl FUN_02009D48
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _021E85C8
	str r0, [sp, #0x30]
	b _021E85CC
_021E85C8:
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x30]
_021E85CC:
	ldr r0, [r4, #4]
	cmp r6, #0
	str r0, [sp, #0x34]
	beq _021E85E6
	lsls r0, r6, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E85F4
_021E85E6:
	lsls r0, r6, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E85F4:
	blx FUN_020F2104
	str r0, [sp, #0x38]
	cmp r7, #0
	beq _021E8610
	lsls r0, r7, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E861E
_021E8610:
	lsls r0, r7, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E861E:
	blx FUN_020F2104
	movs r1, #0
	str r1, [sp, #0x40]
	ldr r1, [sp, #0x84]
	str r0, [sp, #0x3c]
	cmp r1, #2
	bne _021E8636
	movs r1, #3
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [sp, #0x3c]
_021E8636:
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	movs r1, #0
	add r0, sp, #0x30
	add r2, sp, #0x68
	strh r1, [r0, #0x20]
	ldrb r0, [r2, #0x10]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x84]
	str r0, [sp, #0x58]
	ldr r0, [r5]
	str r0, [sp, #0x5c]
	ldrb r1, [r2, #0x14]
	ldrb r2, [r2, #0x18]
	adds r0, r5, #0
	bl ov108_021E84F8
	add r0, sp, #0x30
	bl FUN_02024624
	str r0, [r4]
	cmp r0, #0
	bne _021E866E
	bl FUN_0202551C
_021E866E:
	adds r0, r4, #0
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov108_021E8540

	thumb_func_start ov108_021E8674
ov108_021E8674: @ 0x021E8674
	ldr r3, _021E8678 @ =FUN_0200D9DC
	bx r3
	.align 2, 0
_021E8678: .4byte FUN_0200D9DC
	thumb_func_end ov108_021E8674

	thumb_func_start ov108_021E867C
ov108_021E867C: @ 0x021E867C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _021E8714 @ =0x021EA978
	str r0, [sp]
	ldrb r2, [r1]
	add r0, sp, #8
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	ldrb r1, [r1, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr r0, [sp]
	ldr r2, [sp]
	ldr r1, [sp]
	ldrh r0, [r0, #0xc]
	ldr r2, [r2]
	adds r1, #0x18
	bl FUN_02009F40
	ldr r1, [sp]
	movs r6, #0x55
	str r0, [r1, #0x10]
	movs r0, #0
	str r0, [sp, #4]
	add r7, sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	lsls r6, r6, #2
_021E86B8:
	ldr r2, [sp]
	ldrb r0, [r7]
	ldr r1, [sp, #4]
	ldr r2, [r2]
	bl FUN_0200A090
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [sp]
	ldrb r0, [r7]
	ldr r1, [r1]
	bl FUN_0200A6F0
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	movs r1, #0
	ldr r0, [r3, #4]
	cmp r0, #0
	bls _021E86FA
	adds r2, r1, #0
_021E86EA:
	ldr r0, [r3]
	adds r1, r1, #1
	str r4, [r0, r2]
	ldr r3, [r5, r6]
	adds r2, r2, #4
	ldr r0, [r3, #4]
	cmp r1, r0
	blo _021E86EA
_021E86FA:
	ldr r0, [sp, #4]
	adds r7, r7, #1
	adds r0, r0, #1
	adds r5, r5, #4
	str r0, [sp, #4]
	cmp r0, #4
	blo _021E86B8
	ldr r0, [sp]
	bl ov108_021E8758
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E8714: .4byte 0x021EA978
	thumb_func_end ov108_021E867C

	thumb_func_start ov108_021E8718
ov108_021E8718: @ 0x021E8718
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	bl FUN_02024504
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AED4
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200B0CC
	movs r7, #0x55
	lsls r7, r7, #2
	adds r6, r7, #0
	movs r4, #0
	subs r6, #0x10
_021E8740:
	ldr r0, [r5, r7]
	bl FUN_0200A714
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _021E8740
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov108_021E8718

	thumb_func_start ov108_021E8758
ov108_021E8758: @ 0x021E8758
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x55
	lsls r0, r0, #2
	movs r7, #0
	ldr r6, [r5, r0]
	adds r4, r7, #0
_021E8768:
	movs r0, #0xe
	lsls r0, r0, #0xc
	adds r0, r7, r0
	str r0, [sp]
	ldrh r0, [r5, #0xe]
	adds r2, r7, #0
	movs r1, #0xa6
	str r0, [sp, #4]
	ldr r0, [r5]
	adds r2, #0x12
	str r0, [sp, #8]
	movs r0, #0x51
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #0
	bl FUN_0200A1D8
	ldr r1, [r6]
	str r0, [r1, r4]
	ldr r0, [r6]
	ldr r0, [r0, r4]
	cmp r0, #0
	bne _021E879A
	bl FUN_0202551C
_021E879A:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E87A8
	cmp r0, #1
	beq _021E87B2
	cmp r0, #2
	b _021E87BC
_021E87A8:
	ldr r0, [r6]
	ldr r0, [r0, r4]
	bl FUN_0200ADA4
	b _021E87C4
_021E87B2:
	ldr r0, [r6]
	ldr r0, [r0, r4]
	bl FUN_0200AE18
	b _021E87C4
_021E87BC:
	ldr r0, [r6]
	ldr r0, [r0, r4]
	bl FUN_0200AD64
_021E87C4:
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #0xc
	blt _021E8768
	movs r4, #0
	adds r6, r5, #0
_021E87D0:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r7, [r6, r0]
	movs r0, #0xe
	lsls r0, r0, #0xc
	str r0, [sp]
	adds r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0xa6
	adds r2, #0x10
	movs r3, #0
	bl FUN_0200A294
	ldr r1, [r7]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8806
	bl FUN_0202551C
_021E8806:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #2
	blt _021E87D0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	movs r1, #0xe
	lsls r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r5, #0xe]
	subs r0, #0x10
	movs r2, #0xf
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	ldr r1, [r5]
	movs r3, #0
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	movs r1, #0xa6
	bl FUN_0200A234
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8844
	bl FUN_0202551C
_021E8844:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0200B00C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov108_021E8758

	thumb_func_start ov108_021E8850
ov108_021E8850: @ 0x021E8850
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0
	beq _021E8862
	cmp r1, #1
	beq _021E88B0
	b _021E88C0
_021E8862:
	bl ov108_021E8AD4
	movs r2, #0x12
	movs r0, #3
	movs r1, #0x5f
	lsls r2, r2, #0xe
	bl FUN_0201A910
	adds r0, r4, #0
	bl FUN_020072A4
	movs r1, #0x53
	adds r6, r0, #0
	adds r0, r4, #0
	lsls r1, r1, #4
	movs r2, #0x5f
	bl FUN_02007280
	movs r2, #0x53
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0x5f
	str r0, [r4]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov108_021E8968
	movs r1, #0
	movs r0, #0x43
	adds r2, r1, #0
	bl FUN_02004EC4
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E88C0
_021E88B0:
	bl FUN_02007290
	bl ov108_021E929C
	cmp r0, #0
	beq _021E88C0
	movs r0, #1
	pop {r4, r5, r6, pc}
_021E88C0:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov108_021E8850

	thumb_func_start ov108_021E88C4
ov108_021E88C4: @ 0x021E88C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov108_021E9304
	cmp r0, #0
	bne _021E88DA
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E88DA:
	bl ov108_021E8AD4
	adds r0, r4, #0
	bl ov108_021E8A88
	movs r2, #0x53
	ldr r5, [r4]
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	adds r0, r6, #0
	bl FUN_02007294
	adds r0, r5, #0
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov108_021E88C4

	thumb_func_start ov108_021E8904
ov108_021E8904: @ 0x021E8904
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _021E894E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E8920: @ jump table
	.2byte _021E892A - _021E8920 - 2 @ case 0
	.2byte _021E8932 - _021E8920 - 2 @ case 1
	.2byte _021E893A - _021E8920 - 2 @ case 2
	.2byte _021E8942 - _021E8920 - 2 @ case 3
	.2byte _021E894A - _021E8920 - 2 @ case 4
_021E892A:
	bl ov108_021E8BC0
	str r0, [r4]
	b _021E894E
_021E8932:
	bl ov108_021E8B24
	str r0, [r4]
	b _021E894E
_021E893A:
	bl ov108_021E8B68
	str r0, [r4]
	b _021E894E
_021E8942:
	bl ov108_021E8C18
	str r0, [r4]
	b _021E894E
_021E894A:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E894E:
	movs r0, #0x11
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200D020
	movs r0, #0xce
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov108_021E8E10
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov108_021E8904

	thumb_func_start ov108_021E8968
ov108_021E8968: @ 0x021E8968
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	bl FUN_0202F57C
	adds r2, r5, #0
	str r0, [r5, #0x20]
	movs r1, #0
	adds r2, #0x24
	bl FUN_0202F658
	ldr r0, [r4]
	bl FUN_02028EA8
	adds r6, r0, #0
	bl FUN_0202AD20
	strb r0, [r5, #0x18]
	adds r0, r6, #0
	bl FUN_0202ADCC
	strb r0, [r5, #0x19]
	ldr r0, [r4, #4]
	bl FUN_020183F0
	str r0, [r5, #0x10]
	str r4, [r5, #0x1c]
	ldr r0, [r4, #0x20]
	movs r1, #6
	ldrb r0, [r0]
	blx FUN_020F2998
	ldr r0, _021E8A74 @ =0x00000431
	strb r1, [r5, r0]
	ldr r0, [r5, #0x1c]
	movs r1, #6
	ldr r0, [r0, #0x20]
	ldrb r0, [r0]
	blx FUN_020F2998
	movs r1, #0x43
	lsls r1, r1, #4
	strb r0, [r5, r1]
	ldr r0, [r4]
	bl FUN_02028E9C
	adds r6, r0, #0
	ldr r0, [r5, #0x20]
	bl FUN_0202F720
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_02028F84
	str r0, [sp, #4]
	adds r0, r6, #0
	bl FUN_02028F94
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [r5]
	ldr r3, _021E8A78 @ =0x0000042D
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r1, r7, #0
	adds r3, r5, r3
	bl ov108_021EA63C
	movs r1, #0xcd
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldrb r0, [r4, #0x19]
	strb r0, [r5, #0x1a]
	cmp r0, #5
	bls _021E8A06
	movs r0, #0
	strb r0, [r5, #0x1a]
_021E8A06:
	ldrb r1, [r5, #0x1a]
	movs r0, #0x7a
	muls r0, r1, r0
	adds r0, r5, r0
	adds r0, #0x25
	ldrb r1, [r0]
	movs r0, #0x1e
	subs r1, r0, r1
	ldr r0, _021E8A7C @ =0x00000435
	strb r1, [r5, r0]
	subs r0, #8
	ldrb r0, [r5, r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r1, _021E8A80 @ =0x0000042E
	strb r0, [r5, r1]
	subs r0, r1, #1
	ldrb r0, [r5, r0]
	movs r1, #6
	blx FUN_020F2998
	cmp r1, #0
	ble _021E8A3E
	ldr r0, _021E8A80 @ =0x0000042E
	ldrb r1, [r5, r0]
	adds r1, r1, #1
	strb r1, [r5, r0]
_021E8A3E:
	movs r0, #0x43
	lsls r0, r0, #4
	subs r1, r0, #2
	ldrb r2, [r5, r0]
	ldrb r1, [r5, r1]
	cmp r2, r1
	blo _021E8A50
	movs r1, #0
	strb r1, [r5, r0]
_021E8A50:
	ldr r0, [r5, #0x1c]
	movs r1, #0xff
	strh r1, [r0, #0x1c]
	ldr r0, [r4]
	bl FUN_02028D3C
	ldr r0, [r0, #0x14]
	bl FUN_02014844
	ldr r1, _021E8A84 @ =0x0000042C
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r0, #4
	bne _021E8A70
	movs r0, #3
	strb r0, [r5, r1]
_021E8A70:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8A74: .4byte 0x00000431
_021E8A78: .4byte 0x0000042D
_021E8A7C: .4byte 0x00000435
_021E8A80: .4byte 0x0000042E
_021E8A84: .4byte 0x0000042C
	thumb_func_end ov108_021E8968

	thumb_func_start ov108_021E8A88
ov108_021E8A88: @ 0x021E8A88
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r2, r4, #0
	ldr r0, [r4, #0x20]
	movs r1, #0
	adds r2, #0x24
	bl FUN_0202F680
	ldr r0, _021E8AD0 @ =0x00000431
	ldrb r1, [r4, r0]
	cmp r1, #6
	blo _021E8AAE
	movs r1, #5
	strb r1, [r4, r0]
_021E8AAE:
	ldr r0, _021E8AD0 @ =0x00000431
	ldrb r2, [r4, r0]
	subs r0, r0, #1
	ldrb r1, [r4, r0]
	movs r0, #6
	muls r0, r1, r0
	adds r1, r2, r0
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0x20]
	strb r1, [r0]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x10]
	ldr r0, [r0, #4]
	bl FUN_02018410
	pop {r4, pc}
	nop
_021E8AD0: .4byte 0x00000431
	thumb_func_end ov108_021E8A88

	thumb_func_start ov108_021E8AD4
ov108_021E8AD4: @ 0x021E8AD4
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E8B1C @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E8B20 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	pop {r3, pc}
	.align 2, 0
_021E8B1C: .4byte 0xFFFFE0FF
_021E8B20: .4byte 0x04001000
	thumb_func_end ov108_021E8AD4

	thumb_func_start ov108_021E8B24
ov108_021E8B24: @ 0x021E8B24
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #3
	bhi _021E8B62
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E8B3A: @ jump table
	.2byte _021E8B42 - _021E8B3A - 2 @ case 0
	.2byte _021E8B4A - _021E8B3A - 2 @ case 1
	.2byte _021E8B52 - _021E8B3A - 2 @ case 2
	.2byte _021E8B5A - _021E8B3A - 2 @ case 3
_021E8B42:
	bl ov108_021E9388
	str r0, [r4, #4]
	b _021E8B62
_021E8B4A:
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #2
	pop {r4, pc}
_021E8B52:
	bl ov108_021E93A8
	str r0, [r4, #4]
	b _021E8B62
_021E8B5A:
	movs r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E8B62:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E8B24

	thumb_func_start ov108_021E8B68
ov108_021E8B68: @ 0x021E8B68
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021E8B78
	cmp r1, #1
	beq _021E8B8C
	b _021E8BAE
_021E8B78:
	movs r1, #1
	bl ov108_021E940C
	adds r0, r4, #0
	bl ov108_021E9488
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E8BBC
_021E8B8C:
	bl ov108_021E94E8
	cmp r0, #0
	blt _021E8BBC
	cmp r0, #1
	bne _021E8BA6
	adds r0, r4, #0
	bl ov108_021E8C64
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #3
	pop {r4, pc}
_021E8BA6:
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E8BBC
_021E8BAE:
	movs r1, #0
	bl ov108_021E940C
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #1
	pop {r4, pc}
_021E8BBC:
	movs r0, #2
	pop {r4, pc}
	thumb_func_end ov108_021E8B68

	thumb_func_start ov108_021E8BC0
ov108_021E8BC0: @ 0x021E8BC0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E8BD2
	cmp r0, #1
	beq _021E8C00
	b _021E8C12
_021E8BD2:
	movs r0, #6
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E8C12
_021E8C00:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E8C12
	movs r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_021E8C12:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov108_021E8BC0

	thumb_func_start ov108_021E8C18
ov108_021E8C18: @ 0x021E8C18
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E8C2A
	cmp r0, #1
	beq _021E8C4A
	b _021E8C5C
_021E8C2A:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _021E8C5C
_021E8C4A:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E8C5C
	movs r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	movs r0, #4
	pop {r3, r4, pc}
_021E8C5C:
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov108_021E8C18

	thumb_func_start ov108_021E8C64
ov108_021E8C64: @ 0x021E8C64
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #4
	blx FUN_020D4994
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, #0xfe
	ldrb r1, [r4, r0]
	movs r5, #0x1b
	lsls r0, r1, #2
	adds r0, r1, r0
	adds r1, r2, r0
	ldrb r2, [r2, r0]
	add r0, sp, #0
	strb r2, [r0]
	ldrb r2, [r1, #1]
	ldr r3, [r4, #0x1c]
	lsls r2, r2, #2
	adds r2, r3, r2
	ldrb r2, [r2, #9]
	lsrs r3, r2, #0x1f
	lsls r2, r2, #0x1b
	subs r2, r2, r3
	rors r2, r5
	adds r2, r3, r2
	strb r2, [r0, #1]
	ldrb r1, [r1, #1]
	ldr r2, [r4, #0x1c]
	lsls r1, r1, #2
	adds r1, r2, r1
	ldrb r1, [r1, #0xb]
	lsrs r2, r1, #0x1f
	lsls r1, r1, #0x1b
	subs r1, r1, r2
	rors r1, r5
	adds r1, r2, r1
	strb r1, [r0, #3]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	ldrb r1, [r1, #0x1a]
	strb r1, [r0, #2]
	ldr r1, [r4, #0x1c]
	adds r0, r4, #0
	ldrb r1, [r1, #0x19]
	adds r0, #0x24
	bl FUN_0202F930
	add r0, sp, #0
	ldrb r1, [r0]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov108_021E8C64

	thumb_func_start ov108_021E8CD4
ov108_021E8CD4: @ 0x021E8CD4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r1, #0
	adds r4, r2, #0
	movs r1, #0
	movs r2, #0xf4
	adds r5, r0, #0
	blx FUN_020D4994
	blx FUN_020C2698
	blx FUN_020CF564
	blx FUN_020CF704
	ldr r0, _021E8DF4 @ =0x04000060
	ldr r1, _021E8DF8 @ =0xFFFFCFFD
	ldrh r2, [r0]
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021E8DFC @ =0x0000CFFB
	ands r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #8
	orrs r2, r3
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	ands r2, r1
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _021E8E00 @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _021E8E04 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _021E8E08 @ =0xBFFF0000
	str r0, [r1, #0x40]
	adds r0, r5, #0
	str r4, [r5, #0x14]
	adds r0, #0xf1
	strb r6, [r0]
	movs r0, #0x80
	blx FUN_020B67B4
	adds r6, r0, #0
	ldr r0, [r5, #0x14]
	adds r1, r6, #0
	bl FUN_0201AA8C
	adds r1, r5, #0
	adds r1, #0xec
	str r0, [r1]
	movs r0, #1
	adds r2, r5, #0
	str r0, [sp]
	adds r2, #0xec
	ldr r2, [r2]
	lsls r0, r0, #0x11
	movs r1, #0
	adds r3, r6, #0
	bl FUN_02026FE8
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020B6B14
	adds r6, r0, #0
	ldr r0, [r5, #0x14]
	adds r1, r6, #0
	bl FUN_0201AA8C
	adds r1, r5, #0
	adds r1, #0xe8
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xe8
	movs r0, #1
	ldr r1, [r1]
	lsls r0, r0, #0xe
	adds r2, r6, #0
	movs r3, #1
	bl FUN_02026FF8
	adds r0, r5, #4
	adds r1, r4, #0
	movs r2, #0x20
	bl FUN_0201AC14
	movs r0, #0x28
	adds r1, r4, #0
	bl FUN_02007688
	str r0, [r5, #0x18]
	movs r0, #0x6b
	adds r1, r4, #0
	bl FUN_02007688
	str r0, [r5, #0x1c]
	movs r0, #0x6a
	adds r1, r4, #0
	bl FUN_02007688
	str r0, [r5, #0x20]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov108_021E9230
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _021E8E0C @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E8DF4: .4byte 0x04000060
_021E8DF8: .4byte 0xFFFFCFFD
_021E8DFC: .4byte 0x0000CFFB
_021E8E00: .4byte 0x00007FFF
_021E8E04: .4byte 0x04000540
_021E8E08: .4byte 0xBFFF0000
_021E8E0C: .4byte 0x04000008
	thumb_func_end ov108_021E8CD4

	thumb_func_start ov108_021E8E10
ov108_021E8E10: @ 0x021E8E10
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02026E48
	bl FUN_02023154
	blx FUN_020C23F4
	ldr r2, _021E8E58 @ =0x04000440
	movs r3, #0
	adds r1, r2, #0
	str r3, [r2]
	adds r1, #0x14
	str r3, [r1]
	movs r0, #2
	str r0, [r2]
	adds r0, r4, #0
	str r3, [r1]
	adds r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E8E4E
	adds r0, r4, #0
	adds r0, #0xd8
	ldrh r0, [r0]
	cmp r0, #0
	beq _021E8E4E
	adds r4, #0x24
	adds r0, r4, #0
	bl ov108_021E9144
_021E8E4E:
	ldr r0, _021E8E5C @ =0x04000540
	movs r1, #1
	str r1, [r0]
	pop {r4, pc}
	nop
_021E8E58: .4byte 0x04000440
_021E8E5C: .4byte 0x04000540
	thumb_func_end ov108_021E8E10

	thumb_func_start ov108_021E8E60
ov108_021E8E60: @ 0x021E8E60
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0xd8
	ldrh r1, [r1]
	cmp r1, #0
	beq _021E8E76
	adds r1, r4, #0
	adds r1, #0x24
	bl ov108_021E90C4
_021E8E76:
	ldr r0, [r4]
	bl FUN_02023120
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r0, #0xec
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x20]
	bl FUN_0200770C
	ldr r0, [r4, #0x1c]
	bl FUN_0200770C
	ldr r0, [r4, #0x18]
	bl FUN_0200770C
	pop {r4, pc}
	thumb_func_end ov108_021E8E60

	thumb_func_start ov108_021E8EA4
ov108_021E8EA4: @ 0x021E8EA4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r1, r5, #0
	adds r1, #0xd8
	ldrh r1, [r1]
	adds r4, r2, #0
	cmp r1, #0
	beq _021E8EBE
	adds r1, r5, #0
	adds r1, #0x24
	bl ov108_021E90C4
_021E8EBE:
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xf0
	strb r1, [r0]
	cmp r4, #0
	beq _021E8ED4
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov108_021E8F00
_021E8ED4:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov108_021E8EA4

	thumb_func_start ov108_021E8ED8
ov108_021E8ED8: @ 0x021E8ED8
	push {r3, lr}
	adds r2, r0, #0
	adds r2, #0xf0
	strb r1, [r2]
	adds r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E8EFA
	bl FUN_02026E48
	bl FUN_02023154
	blx FUN_020C23F4
	ldr r0, _021E8EFC @ =0x04000540
	movs r1, #1
	str r1, [r0]
_021E8EFA:
	pop {r3, pc}
	.align 2, 0
_021E8EFC: .4byte 0x04000540
	thumb_func_end ov108_021E8ED8

	thumb_func_start ov108_021E8F00
ov108_021E8F00: @ 0x021E8F00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #4]
	adds r4, r2, #0
	movs r2, #0
	adds r5, r0, #0
	str r2, [sp]
	ldr r3, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4]
	ldr r0, [r0, #0x18]
	ldr r3, [r3, #0x14]
	adds r5, #0x24
	bl FUN_02007C98
	ldr r1, [sp, #4]
	str r0, [r1, #0x24]
	blx FUN_020C3B40
	str r0, [r5, #4]
	cmp r0, #0
	beq _021E8F4C
	adds r2, r0, #0
	adds r2, #8
	beq _021E8F40
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _021E8F40
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _021E8F42
_021E8F40:
	movs r1, #0
_021E8F42:
	cmp r1, #0
	beq _021E8F4C
	ldr r1, [r1]
	adds r0, r0, r1
	b _021E8F4E
_021E8F4C:
	movs r0, #0
_021E8F4E:
	str r0, [r5, #8]
	ldr r0, [r5]
	blx FUN_020C3B50
	str r0, [r5, #0xc]
	cmp r0, #0
	beq _021E8F68
	bl FUN_0201F668
	ldr r0, [r5]
	ldr r1, [r5, #0xc]
	bl FUN_0201F64C
_021E8F68:
	adds r0, r5, #0
	ldr r1, [r5, #8]
	adds r0, #0x10
	blx FUN_020BE120
	blx FUN_020D2828
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xb4
	strh r1, [r0]
	ldr r0, [sp, #4]
	ldrb r1, [r4]
	ldr r0, [r0, #0x1c]
	add r2, sp, #0x10
	bl FUN_0200778C
	add r0, sp, #0x10
	ldrb r1, [r0]
	cmp r1, #0
	beq _021E8FEC
	ldrb r0, [r0, #1]
	cmp r0, #8
	beq _021E8FEC
	movs r0, #0
	adds r6, r5, #0
	adds r7, r5, #0
	str r0, [sp, #0xc]
	add r4, sp, #0x10
	adds r6, #0x64
	adds r7, #0xb6
_021E8FA6:
	ldr r1, [r4, #8]
	movs r0, #0
	mvns r0, r0
	mov ip, r1
	cmp r1, r0
	beq _021E8FEC
	adds r2, r5, #0
	adds r2, #0xb6
	ldrh r3, [r2]
	movs r2, #0x14
	ldr r0, [sp, #4]
	muls r2, r3, r2
	adds r1, r5, #0
	adds r2, r6, r2
	mov r3, ip
	bl ov108_021E9198
	adds r1, r5, #0
	adds r1, #0xb6
	ldrh r2, [r1]
	movs r1, #0x14
	adds r0, r5, #0
	muls r1, r2, r1
	adds r1, r6, r1
	bl ov108_021E91F8
	ldrh r0, [r7]
	adds r4, r4, #4
	adds r0, r0, #1
	strh r0, [r7]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _021E8FA6
_021E8FEC:
	ldr r0, [sp, #8]
	ldr r1, _021E90C0 @ =0x021EA9E4
	lsls r0, r0, #3
	adds r4, r1, r0
	movs r0, #2
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E900E
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E901C
_021E900E:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E901C:
	blx FUN_020F2104
	ldr r1, [sp, #4]
	adds r1, #0xdc
	str r0, [r1]
	movs r0, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E9040
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E904E
_021E9040:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E904E:
	blx FUN_020F2104
	ldr r1, [sp, #4]
	adds r1, #0xe0
	str r0, [r1]
	movs r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E9072
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E9080
_021E9072:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E9080:
	blx FUN_020F2104
	ldr r1, [sp, #4]
	adds r1, #0xe4
	str r0, [r1]
	ldrh r0, [r4]
	cmp r0, #0
	beq _021E90A2
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E90B0
_021E90A2:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E90B0:
	blx FUN_020F2104
	ldr r1, [sp, #4]
	ldr r1, [r1]
	bl FUN_020235D4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E90C0: .4byte 0x021EA9E4
	thumb_func_end ov108_021E8F00

	thumb_func_start ov108_021E90C4
ov108_021E90C4: @ 0x021E90C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r7, r0, #0
	adds r0, r6, #0
	adds r0, #0xb6
	ldrh r0, [r0]
	movs r4, #0
	cmp r0, #0
	ble _021E90FA
	adds r5, r6, #0
	adds r5, #0x64
_021E90DC:
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov108_021E9204
	adds r0, r7, #0
	adds r1, r5, #0
	bl ov108_021E91D4
	adds r0, r6, #0
	adds r0, #0xb6
	ldrh r0, [r0]
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, r0
	blt _021E90DC
_021E90FA:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _021E9124
	add r1, sp, #4
	add r2, sp, #0
	blx FUN_020BE4D0
	ldr r1, _021E913C @ =0x02110928
	ldr r0, [sp, #4]
	ldr r1, [r1]
	blx r1
	ldr r1, _021E913C @ =0x02110928
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	ldr r0, [r6, #0xc]
	blx FUN_020BE588
	ldr r1, _021E9140 @ =0x02110930
	ldr r1, [r1]
	blx r1
_021E9124:
	ldr r0, [r6]
	cmp r0, #0
	beq _021E912E
	bl FUN_0201AB0C
_021E912E:
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xb8
	blx FUN_020D4994
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E913C: .4byte 0x02110928
_021E9140: .4byte 0x02110930
	thumb_func_end ov108_021E90C4

	thumb_func_start ov108_021E9144
ov108_021E9144: @ 0x021E9144
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	adds r6, r0, #0
	adds r0, #0xb6
	ldrh r0, [r0]
	movs r4, #0
	cmp r0, #0
	ble _021E916C
	adds r5, r6, #0
	adds r5, #0x64
_021E9158:
	adds r0, r5, #0
	bl ov108_021E9210
	adds r0, r6, #0
	adds r0, #0xb6
	ldrh r0, [r0]
	adds r4, r4, #1
	adds r5, #0x14
	cmp r4, r0
	blt _021E9158
_021E916C:
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x18
	blx FUN_020CAFEC
	adds r6, #0x10
	adds r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #0x18
	add r3, sp, #0
	bl FUN_0201F554
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov108_021E9144

	thumb_func_start ov108_021E9198
ov108_021E9198: @ 0x021E9198
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r2, #0
	movs r2, #0
	adds r6, r1, #0
	adds r5, r0, #0
	str r2, [sp]
	adds r1, r3, #0
	ldr r0, [r5, #0x20]
	ldr r3, [r5, #0x14]
	bl FUN_02007C98
	str r0, [r4]
	movs r1, #0
	blx FUN_020C3B90
	str r0, [r4, #4]
	ldr r1, [r4, #4]
	ldr r2, [r6, #8]
	adds r0, r5, #4
	blx FUN_020C2B7C
	str r0, [r4, #8]
	ldr r1, [r4, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0xc]
	blx FUN_020BE008
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov108_021E9198

	thumb_func_start ov108_021E91D4
ov108_021E91D4: @ 0x021E91D4
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _021E91F6
	ldr r1, [r4, #8]
	adds r0, r0, #4
	blx FUN_020C2BA0
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
_021E91F6:
	pop {r4, pc}
	thumb_func_end ov108_021E91D4

	thumb_func_start ov108_021E91F8
ov108_021E91F8: @ 0x021E91F8
	ldr r3, _021E9200 @ =FUN_020BE294
	adds r0, #0x10
	ldr r1, [r1, #8]
	bx r3
	.align 2, 0
_021E9200: .4byte FUN_020BE294
	thumb_func_end ov108_021E91F8

	thumb_func_start ov108_021E9204
ov108_021E9204: @ 0x021E9204
	ldr r3, _021E920C @ =FUN_020BE388
	adds r0, #0x10
	ldr r1, [r1, #8]
	bx r3
	.align 2, 0
_021E920C: .4byte FUN_020BE388
	thumb_func_end ov108_021E9204

	thumb_func_start ov108_021E9210
ov108_021E9210: @ 0x021E9210
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	ldr r1, [r4, #0xc]
	lsls r0, r0, #0xc
	adds r0, r1, r0
	ldr r1, [r4, #8]
	ldr r1, [r1, #8]
	ldrh r1, [r1, #4]
	lsls r1, r1, #0xc
	blx FUN_020F2998
	str r1, [r4, #0xc]
	ldr r0, [r4, #8]
	str r1, [r0]
	pop {r4, pc}
	thumb_func_end ov108_021E9210

	thumb_func_start ov108_021E9230
ov108_021E9230: @ 0x021E9230
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_02023114
	str r0, [r4]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xdc
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe0
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe4
	str r1, [r0]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r1, _021E928C @ =0x0015B000
	str r0, [sp, #8]
	adds r0, r4, #0
	ldr r2, _021E9290 @ =0x021EA9C4
	ldr r3, _021E9294 @ =0x000005C1
	adds r0, #0xdc
	bl FUN_02023254
	ldr r0, [r4]
	bl FUN_0202313C
	movs r0, #0x19
	movs r1, #0x4b
	ldr r2, [r4]
	lsls r0, r0, #0xe
	lsls r1, r1, #0x10
	bl FUN_02023240
	ldr r0, _021E9298 @ =0x021EA9D8
	ldr r1, [r4]
	bl FUN_02023514
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E928C: .4byte 0x0015B000
_021E9290: .4byte 0x021EA9C4
_021E9294: .4byte 0x000005C1
_021E9298: .4byte 0x021EA9D8
	thumb_func_end ov108_021E9230

	thumb_func_start ov108_021E929C
ov108_021E929C: @ 0x021E929C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E92AC
	cmp r1, #1
	beq _021E92D6
	b _021E92F4
_021E92AC:
	bl ov108_021E9850
	adds r0, r4, #0
	bl ov108_021E9A60
	adds r0, r4, #0
	bl ov108_021E9C14
	adds r0, r4, #0
	bl ov108_021E9C3C
	adds r0, r4, #0
	bl ov108_021E9D30
	adds r0, r4, #0
	bl ov108_021E9E10
	adds r0, r4, #0
	bl ov108_021E9EB8
	b _021E92F4
_021E92D6:
	bl ov108_021EA50C
	ldr r0, _021E9300 @ =ov108_021E979C
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E92F4:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	nop
_021E9300: .4byte ov108_021E979C
	thumb_func_end ov108_021E929C

	thumb_func_start ov108_021E9304
ov108_021E9304: @ 0x021E9304
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E9314
	cmp r0, #2
	beq _021E934C
	b _021E9374
_021E9314:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	adds r0, r4, #0
	bl ov108_021E9F04
	adds r0, r4, #0
	bl ov108_021E9E80
	adds r0, r4, #0
	bl ov108_021E9DE0
	adds r0, r4, #0
	bl ov108_021E9CD0
	adds r0, r4, #0
	bl ov108_021E9C2C
	adds r0, r4, #0
	bl ov108_021E9BD4
	adds r0, r4, #0
	bl ov108_021E9A08
	b _021E9374
_021E934C:
	bl FUN_02021238
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E9380 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E9384 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r0, #0
	str r0, [r4, #8]
	movs r0, #1
	pop {r4, pc}
_021E9374:
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	movs r0, #0
	pop {r4, pc}
	nop
_021E9380: .4byte 0xFFFFE0FF
_021E9384: .4byte 0x04001000
	thumb_func_end ov108_021E9304

	thumb_func_start ov108_021E9388
ov108_021E9388: @ 0x021E9388
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	str r1, [sp]
	add r1, sp, #0
	adds r4, r0, #0
	bl ov108_021E96FC
	ldr r1, [sp]
	cmp r1, #0
	bne _021E93A4
	adds r0, r4, #0
	bl ov108_021E95AC
_021E93A4:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov108_021E9388

	thumb_func_start ov108_021E93A8
ov108_021E93A8: @ 0x021E93A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	bl FUN_02025358
	cmp r0, #0
	beq _021E93BC
	movs r4, #1
	str r4, [r5, #0x10]
	b _021E93D6
_021E93BC:
	ldr r0, _021E93FC @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _021E9400 @ =0x00000CF3
	tst r0, r1
	beq _021E93CA
	adds r0, r4, #0
	str r0, [r5, #0x10]
_021E93CA:
	ldr r0, _021E93FC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _021E93D6
	movs r4, #1
_021E93D6:
	cmp r4, #0
	beq _021E93F6
	ldr r0, _021E9404 @ =0x000005E5
	bl FUN_0200604C
	ldr r0, _021E9408 @ =0x00000464
	movs r1, #1
	adds r0, r5, r0
	bl FUN_0200E9BC
	ldr r0, _021E9408 @ =0x00000464
	adds r0, r5, r0
	bl FUN_0201D8E4
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E93F6:
	movs r0, #2
	pop {r3, r4, r5, pc}
	nop
_021E93FC: .4byte 0x021D110C
_021E9400: .4byte 0x00000CF3
_021E9404: .4byte 0x000005E5
_021E9408: .4byte 0x00000464
	thumb_func_end ov108_021E93A8

	thumb_func_start ov108_021E940C
ov108_021E940C: @ 0x021E940C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #1
	bne _021E9434
	movs r1, #1
	bl ov108_021E9F94
	adds r0, r5, #0
	movs r1, #2
	bl ov108_021E9F20
	adds r0, r5, #0
	bl ov108_021EA260
	adds r0, r5, #0
	movs r1, #0
	bl ov108_021EA334
	movs r4, #0
	b _021E945A
_021E9434:
	movs r1, #0
	bl ov108_021E9F94
	ldr r0, _021E947C @ =0x00000494
	adds r0, r5, r0
	bl FUN_0201D8E4
	adds r0, r5, #0
	movs r1, #0
	bl ov108_021E9F20
	adds r0, r5, #0
	bl ov108_021EA040
	adds r0, r5, #0
	movs r1, #2
	bl ov108_021EA334
	movs r4, #1
_021E945A:
	ldr r0, _021E9480 @ =0x0000044C
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	movs r0, #0x45
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024830
	ldr r0, _021E9484 @ =0x00000444
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E947C: .4byte 0x00000494
_021E9480: .4byte 0x0000044C
_021E9484: .4byte 0x00000444
	thumb_func_end ov108_021E940C

	thumb_func_start ov108_021E9488
ov108_021E9488: @ 0x021E9488
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, _021E94E4 @ =0x00000438
	movs r3, #4
	ldr r1, [r4, r0]
	movs r2, #0x1a
	str r1, [sp]
	adds r1, r0, #0
	subs r1, #0x92
	str r1, [sp, #8]
	movs r1, #0xe
	str r1, [sp, #0xc]
	str r3, [sp, #4]
	add r1, sp, #0
	strb r2, [r1, #0x10]
	strb r3, [r1, #0x11]
	ldrb r2, [r1, #0x12]
	movs r3, #0xf
	adds r0, #0xdc
	bics r2, r3
	ldr r3, [r4, #0x10]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	movs r3, #0xf
	ands r3, r5
	orrs r2, r3
	strb r2, [r1, #0x12]
	ldrb r3, [r1, #0x12]
	movs r2, #0xf0
	bics r3, r2
	strb r3, [r1, #0x12]
	movs r2, #0
	strb r2, [r1, #0x13]
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl FUN_02016704
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_021E94E4: .4byte 0x00000438
	thumb_func_end ov108_021E9488

	thumb_func_start ov108_021E94E8
ov108_021E94E8: @ 0x021E94E8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E9524 @ =0x00000514
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021E94FE
	cmp r0, #2
	beq _021E9502
	b _021E9506
_021E94FE:
	movs r4, #1
	b _021E950C
_021E9502:
	movs r4, #0
	b _021E950C
_021E9506:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021E950C:
	ldr r0, _021E9524 @ =0x00000514
	ldr r0, [r5, r0]
	bl FUN_020169C0
	str r0, [r5, #0x10]
	ldr r0, _021E9524 @ =0x00000514
	ldr r0, [r5, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9524: .4byte 0x00000514
	thumb_func_end ov108_021E94E8

	thumb_func_start ov108_021E9528
ov108_021E9528: @ 0x021E9528
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	cmp r1, #6
	blo _021E9544
	ldr r0, _021E95A0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov108_021E9F20
	movs r0, #3
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_021E9544:
	ldr r2, _021E95A4 @ =0x00000431
	subs r3, r2, #1
	ldrb r5, [r4, r3]
	ldrb r1, [r4, r2]
	movs r3, #6
	muls r3, r5, r3
	adds r3, r1, r3
	adds r1, r2, #1
	strb r3, [r4, r1]
	subs r2, r2, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	cmp r1, r2
	blo _021E9564
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E9564:
	bl ov108_021EA52C
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	beq _021E9580
	ldr r0, _021E95A8 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r4, #0
	subs r1, r5, #1
	bl ov108_021EA418
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E9580:
	ldr r0, _021E95A0 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0xcd
	lsls r1, r1, #2
	adds r0, r1, #0
	adds r0, #0xfe
	ldrb r2, [r4, r0]
	ldr r3, [r4, r1]
	adds r1, #0xff
	lsls r0, r2, #2
	adds r0, r2, r0
	ldrb r0, [r3, r0]
	strb r0, [r4, r1]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E95A0: .4byte 0x000005DC
_021E95A4: .4byte 0x00000431
_021E95A8: .4byte 0x000005F3
	thumb_func_end ov108_021E9528

	thumb_func_start ov108_021E95AC
ov108_021E95AC: @ 0x021E95AC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _021E96EC @ =0x021D110C
	movs r1, #0
	ldr r2, [r0, #0x48]
	ldr r0, _021E96F0 @ =0x00000CF3
	tst r0, r2
	beq _021E95BE
	str r1, [r4, #0x10]
_021E95BE:
	ldr r0, _021E96EC @ =0x021D110C
	ldr r6, [r0, #0x48]
	movs r0, #2
	tst r0, r6
	beq _021E95D2
	adds r0, r4, #0
	movs r1, #6
	bl ov108_021E9528
	pop {r3, r4, r5, r6, r7, pc}
_021E95D2:
	movs r0, #1
	tst r0, r6
	beq _021E95E4
	ldr r1, _021E96F4 @ =0x00000431
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E9528
	pop {r3, r4, r5, r6, r7, pc}
_021E95E4:
	movs r0, #0xf0
	tst r0, r6
	bne _021E95EE
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E95EE:
	ldr r0, _021E96F4 @ =0x00000431
	movs r2, #0x1f
	ldrb r5, [r4, r0]
	lsrs r3, r5, #0x1f
	lsls r7, r5, #0x1f
	subs r7, r7, r3
	rors r7, r2
	adds r2, r3, r7
	lsls r3, r5, #0x17
	lsls r2, r2, #0x18
	movs r5, #0x10
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	tst r5, r6
	beq _021E9644
	cmp r3, #3
	bne _021E9614
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9614:
	cmp r2, #1
	bne _021E963C
	subs r5, r0, #3
	subs r1, r0, #1
	ldrb r5, [r4, r5]
	ldrb r1, [r4, r1]
	subs r5, r5, #1
	cmp r1, r5
	bge _021E9638
	cmp r3, #3
	bhs _021E9638
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	adds r1, r1, #1
	strb r1, [r4, r0]
	movs r1, #2
	b _021E96AE
_021E9638:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E963C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _021E96AE
_021E9644:
	movs r5, #0x20
	tst r5, r6
	beq _021E967C
	cmp r3, #3
	bne _021E9652
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9652:
	cmp r2, #0
	bne _021E9674
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021E9670
	cmp r3, #3
	bhs _021E9670
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	subs r1, r1, #1
	strb r1, [r4, r0]
	movs r1, #1
	b _021E96AE
_021E9670:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9674:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _021E96AE
_021E967C:
	movs r0, #0x40
	tst r0, r6
	beq _021E9696
	adds r0, r3, #3
	lsrs r5, r0, #0x1f
	lsls r3, r0, #0x1e
	subs r3, r3, r5
	movs r0, #0x1e
	rors r3, r0
	adds r0, r5, r3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _021E96AE
_021E9696:
	movs r0, #0x80
	tst r0, r6
	beq _021E96AE
	adds r0, r3, #1
	lsrs r5, r0, #0x1f
	lsls r3, r0, #0x1e
	subs r3, r3, r5
	movs r0, #0x1e
	rors r3, r0
	adds r0, r5, r3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_021E96AE:
	lsls r0, r3, #1
	adds r2, r2, r0
	ldr r0, _021E96F4 @ =0x00000431
	cmp r1, #0
	strb r2, [r4, r0]
	beq _021E96D0
	subs r1, r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0x18
	adds r4, #0x14
	lsrs r1, r1, #0x18
	adds r2, r4, #0
	movs r3, #0
	bl ov108_021EA584
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E96D0:
	ldr r0, _021E96F8 @ =0x000005E5
	bl FUN_0200604C
	ldr r1, _021E96F4 @ =0x00000431
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021EA2EC
	adds r0, r4, #0
	bl ov108_021EA47C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E96EC: .4byte 0x021D110C
_021E96F0: .4byte 0x00000CF3
_021E96F4: .4byte 0x00000431
_021E96F8: .4byte 0x000005E5
	thumb_func_end ov108_021E95AC

	thumb_func_start ov108_021E96FC
ov108_021E96FC: @ 0x021E96FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E9794 @ =0x021EABF0
	adds r4, r1, #0
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E9716
	movs r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E9716:
	cmp r0, #7
	bne _021E973E
	movs r0, #0x43
	lsls r0, r0, #4
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _021E973A
	subs r1, r1, #1
	strb r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #0
	adds r5, #0x14
	adds r2, r5, #0
	adds r3, r1, #0
	bl ov108_021EA584
	movs r0, #1
	str r0, [r4]
_021E973A:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E973E:
	cmp r0, #8
	bne _021E976C
	movs r0, #0x43
	lsls r0, r0, #4
	subs r1, r0, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r0]
	subs r1, r1, #1
	cmp r2, r1
	bge _021E9768
	adds r1, r2, #1
	strb r1, [r5, r0]
	adds r0, r5, #0
	adds r5, #0x14
	movs r1, #1
	adds r2, r5, #0
	movs r3, #0
	bl ov108_021EA584
	movs r0, #1
	str r0, [r4]
_021E9768:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E976C:
	ldr r1, _021E9798 @ =0x00000431
	ldrb r2, [r5, r1]
	cmp r0, r2
	beq _021E9784
	strb r0, [r5, r1]
	ldrb r1, [r5, r1]
	adds r0, r5, #0
	bl ov108_021EA2EC
	adds r0, r5, #0
	bl ov108_021EA47C
_021E9784:
	movs r0, #1
	str r0, [r4]
	ldr r1, _021E9798 @ =0x00000431
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov108_021E9528
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9794: .4byte 0x021EABF0
_021E9798: .4byte 0x00000431
	thumb_func_end ov108_021E96FC

	thumb_func_start ov108_021E979C
ov108_021E979C: @ 0x021E979C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E981C @ =0x00000434
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _021E97F4
	subs r2, r0, #4
	subs r1, r0, #3
	ldrb r3, [r4, r2]
	movs r2, #6
	ldrb r1, [r4, r1]
	muls r2, r3, r2
	adds r2, r1, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r1, #6
	bhs _021E97C6
	subs r0, r0, #7
	ldrb r0, [r4, r0]
	cmp r2, r0
	blo _021E97D6
_021E97C6:
	movs r0, #0xce
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0x18
	movs r2, #0
	bl ov108_021E8EA4
	b _021E97EE
_021E97D6:
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	lsls r3, r2, #2
	adds r3, r2, r3
	adds r2, r1, r3
	adds r0, r0, #4
	ldrb r1, [r1, r3]
	adds r0, r4, r0
	adds r2, r2, #2
	bl ov108_021E8EA4
_021E97EE:
	ldr r0, _021E981C @ =0x00000434
	movs r1, #0
	strb r1, [r4, r0]
_021E97F4:
	ldr r0, _021E9820 @ =0x0000043C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E9800
	bl FUN_0200D034
_021E9800:
	bl FUN_0202061C
	ldr r0, _021E9824 @ =0x00000438
	ldr r0, [r4, r0]
	bl FUN_0201EEB4
	ldr r3, _021E9828 @ =0x027E0000
	ldr r1, _021E982C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E981C: .4byte 0x00000434
_021E9820: .4byte 0x0000043C
_021E9824: .4byte 0x00000438
_021E9828: .4byte 0x027E0000
_021E982C: .4byte 0x00003FF8
	thumb_func_end ov108_021E979C

	thumb_func_start ov108_021E9830
ov108_021E9830: @ 0x021E9830
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E984C @ =0x021EABC8
	add r3, sp, #0
	movs r2, #5
_021E983A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E983A
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E984C: .4byte 0x021EABC8
	thumb_func_end ov108_021E9830

	thumb_func_start ov108_021E9850
ov108_021E9850: @ 0x021E9850
	push {r4, r5, lr}
	sub sp, #0xd4
	adds r4, r0, #0
	bl ov108_021E9830
	ldr r2, _021E99E0 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	ldr r0, [r4]
	bl FUN_0201AC88
	ldr r1, _021E99E4 @ =0x00000438
	add r3, sp, #0xc4
	ldr r5, _021E99E8 @ =0x021EAAC0
	str r0, [r4, r1]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E99EC @ =0x021EAB54
	add r3, sp, #0xa8
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #1
	str r0, [r3]
	ldr r0, _021E99E4 @ =0x00000438
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E99F0 @ =0x021EAB1C
	add r3, sp, #0x8c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #2
	str r0, [r3]
	ldr r0, _021E99E4 @ =0x00000438
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E99F4 @ =0x021EAB38
	add r3, sp, #0x70
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #3
	str r0, [r3]
	ldr r0, _021E99E4 @ =0x00000438
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E99F8 @ =0x021EAB8C
	add r3, sp, #0x54
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #4
	ldr r0, [r4, r0]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #4
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E99FC @ =0x021EAAE4
	add r3, sp, #0x38
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #5
	str r0, [r3]
	ldr r0, _021E99E4 @ =0x00000438
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #5
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E9A00 @ =0x021EAB00
	add r3, sp, #0x1c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #6
	str r0, [r3]
	ldr r0, _021E99E4 @ =0x00000438
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r5, _021E9A04 @ =0x021EAB70
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #7
	str r0, [r3]
	ldr r0, _021E99E4 @ =0x00000438
	movs r3, #0
	ldr r0, [r4, r0]
	bl FUN_0201B1E4
	ldr r0, _021E99E4 @ =0x00000438
	movs r1, #7
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	add sp, #0xd4
	pop {r4, r5, pc}
	nop
_021E99E0: .4byte 0x04000304
_021E99E4: .4byte 0x00000438
_021E99E8: .4byte 0x021EAAC0
_021E99EC: .4byte 0x021EAB54
_021E99F0: .4byte 0x021EAB1C
_021E99F4: .4byte 0x021EAB38
_021E99F8: .4byte 0x021EAB8C
_021E99FC: .4byte 0x021EAAE4
_021E9A00: .4byte 0x021EAB00
_021E9A04: .4byte 0x021EAB70
	thumb_func_end ov108_021E9850

	thumb_func_start ov108_021E9A08
ov108_021E9A08: @ 0x021E9A08
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E9A5C @ =0x00000438
	movs r1, #7
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E9A5C @ =0x00000438
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E9A5C @ =0x00000438
	movs r1, #5
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E9A5C @ =0x00000438
	movs r1, #4
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E9A5C @ =0x00000438
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E9A5C @ =0x00000438
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E9A5C @ =0x00000438
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E9A5C @ =0x00000438
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
_021E9A5C: .4byte 0x00000438
	thumb_func_end ov108_021E9A08

	thumb_func_start ov108_021E9A60
ov108_021E9A60: @ 0x021E9A60
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xe1
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	ldr r2, _021E9BC0 @ =0x00000438
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r1, #1
	movs r3, #3
	adds r4, r0, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 @ =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #5
	movs r3, #7
	bl FUN_02007B44
	movs r1, #0
	str r1, [sp]
	ldr r0, [r5]
	adds r2, r1, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	movs r1, #4
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_02007B8C
	movs r1, #0x1a
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #4
	bl FUN_0200304C
	movs r1, #0x1a
	ldr r2, [r5]
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 @ =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 @ =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #3
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 @ =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #6
	movs r3, #7
	bl FUN_02007B68
	ldr r0, [r5]
	ldr r3, _021E9BC4 @ =0x0000051C
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	ldr r3, _021E9BC8 @ =0x00000518
	movs r1, #6
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, #0xc
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	movs r3, #0x52
	lsls r3, r3, #4
	str r0, [r5, r3]
	ldr r0, [r5]
	adds r3, #0xc
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	adds r3, r5, r3
	bl FUN_02007C2C
	ldr r1, _021E9BCC @ =0x00000528
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200770C
	ldrb r0, [r5, #0x19]
	ldr r2, _021E9BC0 @ =0x00000438
	movs r1, #4
	str r0, [sp]
	ldr r0, [r5]
	movs r3, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	subs r2, #0x56
	bl FUN_0200E644
	movs r1, #0x1a
	ldr r2, [r5]
	movs r0, #0
	lsls r1, r1, #4
	bl FUN_0200304C
	ldr r0, _021E9BC0 @ =0x00000438
	movs r1, #7
	ldr r0, [r5, r0]
	bl FUN_0201EFBC
	ldr r0, _021E9BC0 @ =0x00000438
	movs r1, #3
	ldr r0, [r5, r0]
	bl FUN_0201EFBC
	movs r0, #4
	str r0, [sp]
	ldr r0, _021E9BD0 @ =0x04000050
	movs r1, #1
	movs r2, #0x1e
	movs r3, #0x1c
	blx FUN_020CF15C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9BC0: .4byte 0x00000438
_021E9BC4: .4byte 0x0000051C
_021E9BC8: .4byte 0x00000518
_021E9BCC: .4byte 0x00000528
_021E9BD0: .4byte 0x04000050
	thumb_func_end ov108_021E9A60

	thumb_func_start ov108_021E9BD4
ov108_021E9BD4: @ 0x021E9BD4
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	adds r4, r0, #0
	ldr r0, _021E9C08 @ =0x04000050
	adds r2, r1, #0
	movs r3, #0x1f
	str r1, [sp]
	blx FUN_020CF15C
	ldr r0, _021E9C0C @ =0x00000528
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x52
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E9C10 @ =0x00000518
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9C08: .4byte 0x04000050
_021E9C0C: .4byte 0x00000528
_021E9C10: .4byte 0x00000518
	thumb_func_end ov108_021E9BD4

	thumb_func_start ov108_021E9C14
ov108_021E9C14: @ 0x021E9C14
	movs r1, #0xce
	adds r2, r0, #0
	lsls r1, r1, #2
	adds r0, r2, r1
	adds r1, #0xf4
	ldrb r1, [r2, r1]
	ldr r3, _021E9C28 @ =ov108_021E8CD4
	ldr r2, [r2]
	bx r3
	nop
_021E9C28: .4byte ov108_021E8CD4
	thumb_func_end ov108_021E9C14

	thumb_func_start ov108_021E9C2C
ov108_021E9C2C: @ 0x021E9C2C
	movs r1, #0xce
	lsls r1, r1, #2
	ldr r3, _021E9C38 @ =ov108_021E8E60
	adds r0, r0, r1
	bx r3
	nop
_021E9C38: .4byte ov108_021E8E60
	thumb_func_end ov108_021E9C2C

	thumb_func_start ov108_021E9C3C
ov108_021E9C3C: @ 0x021E9C3C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #4
	bl FUN_02002CEC
	ldr r2, _021E9CCC @ =0x000001AE
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	movs r1, #0xc3
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [r5]
	movs r0, #2
	movs r1, #0x10
	bl FUN_0200BD18
	movs r1, #0x31
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #8
	bl FUN_02026354
	movs r1, #0xc5
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #8
	bl FUN_02026354
	movs r1, #0xc6
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	movs r1, #0xc
	bl FUN_0200BBA0
	movs r1, #0xcb
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x20
	ldr r0, [r5, r1]
	movs r1, #8
	bl FUN_0200BBA0
	movs r1, #0x33
	lsls r1, r1, #4
	adds r7, r1, #0
	str r0, [r5, r1]
	movs r6, #0
	adds r4, r5, #0
	subs r7, #0x14
_021E9CB2:
	movs r0, #0xc3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200BBA0
	str r0, [r4, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _021E9CB2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9CCC: .4byte 0x000001AE
	thumb_func_end ov108_021E9C3C

	thumb_func_start ov108_021E9CD0
ov108_021E9CD0: @ 0x021E9CD0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0xc7
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_021E9CDC:
	ldr r0, [r5, r7]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E9CDC
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_02026380
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02026380
	movs r0, #0xc6
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02026380
	movs r0, #0xc5
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_02026380
	movs r0, #0x31
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200BDA0
	movs r0, #0xc3
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov108_021E9CD0

	thumb_func_start ov108_021E9D30
ov108_021E9D30: @ 0x021E9D30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	ldr r0, _021E9DCC @ =0x00000454
	ldr r4, _021E9DD0 @ =0x021EAC18
	movs r6, #0
	adds r5, r7, r0
_021E9D3E:
	ldr r0, _021E9DD4 @ =0x00000438
	adds r1, r5, #0
	ldr r0, [r7, r0]
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #5
	ble _021E9D3E
	ldr r0, _021E9DCC @ =0x00000454
	ldr r6, _021E9DD8 @ =0x000002E2
	adds r0, r7, r0
	movs r4, #0
	str r0, [sp, #0x14]
_021E9D66:
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r1, r0, #1
	lsls r0, r1, #2
	adds r0, r1, r0
	lsrs r3, r4, #0x1f
	str r3, [sp, #0x18]
	adds r0, r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	adds r1, r4, #6
	lsls r2, r1, #4
	ldr r1, [sp, #0x14]
	ldr r5, [sp, #0x18]
	lsls r3, r4, #0x1f
	subs r3, r3, r5
	movs r5, #0x1f
	rors r3, r5
	ldr r5, [sp, #0x18]
	adds r1, r1, r2
	adds r3, r5, r3
	lsls r3, r3, #4
	adds r3, r3, #1
	lsls r3, r3, #0x18
	ldr r0, _021E9DD4 @ =0x00000438
	str r6, [sp, #0x10]
	ldr r0, [r7, r0]
	movs r2, #5
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	subs r6, #0x1c
	lsls r0, r6, #0x10
	adds r4, r4, #1
	lsrs r6, r0, #0x10
	cmp r4, #6
	blt _021E9D66
	ldr r0, [r7]
	bl FUN_0201660C
	ldr r1, _021E9DDC @ =0x00000514
	str r0, [r7, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E9DCC: .4byte 0x00000454
_021E9DD0: .4byte 0x021EAC18
_021E9DD4: .4byte 0x00000438
_021E9DD8: .4byte 0x000002E2
_021E9DDC: .4byte 0x00000514
	thumb_func_end ov108_021E9D30

	thumb_func_start ov108_021E9DE0
ov108_021E9DE0: @ 0x021E9DE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E9E08 @ =0x00000514
	ldr r0, [r5, r0]
	bl FUN_02016624
	ldr r0, _021E9E0C @ =0x00000454
	movs r4, #0
	adds r5, r5, r0
_021E9DF2:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xc
	blt _021E9DF2
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9E08: .4byte 0x00000514
_021E9E0C: .4byte 0x00000454
	thumb_func_end ov108_021E9DE0

	thumb_func_start ov108_021E9E10
ov108_021E9E10: @ 0x021E9E10
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #0x20
	bl FUN_0202055C
	ldr r0, [r4]
	bl FUN_0200CF18
	ldr r1, _021E9E70 @ =0x0000043C
	ldr r2, _021E9E74 @ =0x021EAAD0
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _021E9E78 @ =0x021EABA8
	movs r3, #1
	bl FUN_0200CF70
	ldr r0, _021E9E70 @ =0x0000043C
	ldr r0, [r4, r0]
	bl FUN_0200CF38
	movs r1, #0x11
	lsls r1, r1, #6
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #4
	bl FUN_0200CFF4
	movs r3, #0
	ldr r1, _021E9E70 @ =0x0000043C
	str r3, [sp]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _021E9E7C @ =0x021EAAB0
	bl FUN_0200D2A4
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E9E70: .4byte 0x0000043C
_021E9E74: .4byte 0x021EAAD0
_021E9E78: .4byte 0x021EABA8
_021E9E7C: .4byte 0x021EAAB0
	thumb_func_end ov108_021E9E10

	thumb_func_start ov108_021E9E80
ov108_021E9E80: @ 0x021E9E80
	push {r4, lr}
	ldr r1, _021E9EB4 @ =0x0000043C
	adds r4, r0, #0
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D0E4
	ldr r0, _021E9EB4 @ =0x0000043C
	ldr r0, [r4, r0]
	bl FUN_0200D108
	ldr r0, _021E9EB4 @ =0x0000043C
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	bl FUN_020205AC
	ldr r0, [r4]
	bl FUN_0200B2E0
	ldr r0, [r4]
	bl FUN_0200B2E8
	pop {r4, pc}
	.align 2, 0
_021E9EB4: .4byte 0x0000043C
	thumb_func_end ov108_021E9E80

	thumb_func_start ov108_021E9EB8
ov108_021E9EB8: @ 0x021E9EB8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r4, _021E9EF8 @ =0x021EAC48
	movs r7, #0
	adds r5, r6, #0
_021E9EC2:
	ldr r0, _021E9EFC @ =0x0000043C
	movs r1, #0x11
	lsls r1, r1, #6
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	adds r2, r4, #0
	bl FUN_0200D2B4
	ldr r1, _021E9F00 @ =0x00000444
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	adds r7, r7, #1
	adds r4, #0x28
	adds r5, r5, #4
	cmp r7, #4
	blt _021E9EC2
	ldr r0, _021E9F00 @ =0x00000444
	movs r1, #1
	ldr r0, [r6, r0]
	bl FUN_0200DD3C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9EF8: .4byte 0x021EAC48
_021E9EFC: .4byte 0x0000043C
_021E9F00: .4byte 0x00000444
	thumb_func_end ov108_021E9EB8

	thumb_func_start ov108_021E9F04
ov108_021E9F04: @ 0x021E9F04
	push {r4, r5, r6, lr}
	ldr r6, _021E9F1C @ =0x00000444
	adds r5, r0, #0
	movs r4, #0
_021E9F0C:
	ldr r0, [r5, r6]
	bl FUN_0200D018
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E9F0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E9F1C: .4byte 0x00000444
	thumb_func_end ov108_021E9F04

	thumb_func_start ov108_021E9F20
ov108_021E9F20: @ 0x021E9F20
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _021E9F88 @ =0x00000448
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r1, r4, #2
	bl FUN_020248F0
	ldr r0, _021E9F88 @ =0x00000448
	ldr r0, [r5, r0]
	bl FUN_02024964
	ldr r0, _021E9F8C @ =0x00000474
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0201D978
	movs r1, #0x33
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #4
	adds r3, r0, #0
	lsls r2, r4, #2
	movs r4, #0x30
	subs r3, r4, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E9F90 @ =0x021EAAA4
	lsrs r3, r3, #1
	ldr r0, [r0, r2]
	movs r2, #0x33
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _021E9F8C @ =0x00000474
	lsls r2, r2, #4
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	ldr r0, _021E9F8C @ =0x00000474
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9F88: .4byte 0x00000448
_021E9F8C: .4byte 0x00000474
_021E9F90: .4byte 0x021EAAA4
	thumb_func_end ov108_021E9F20

	thumb_func_start ov108_021E9F94
ov108_021E9F94: @ 0x021E9F94
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	cmp r1, #0
	bne _021E9FA2
	ldr r0, _021EA034 @ =0x00000524
	b _021E9FA4
_021E9FA2:
	ldr r0, _021EA038 @ =0x0000052C
_021E9FA4:
	ldr r4, [r5, r0]
	movs r1, #5
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, _021EA03C @ =0x00000438
	movs r2, #0
	ldr r0, [r5, r0]
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r0, #5
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, _021EA03C @ =0x00000438
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xc
	movs r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r0, [r4]
	movs r1, #7
	adds r3, r2, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r4, #2]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, _021EA03C @ =0x00000438
	ldr r0, [r5, r0]
	bl FUN_0201C4EC
	ldr r0, _021EA03C @ =0x00000438
	movs r1, #5
	ldr r0, [r5, r0]
	bl FUN_0201EFBC
	ldr r0, _021EA03C @ =0x00000438
	movs r1, #6
	ldr r0, [r5, r0]
	bl FUN_0201EFBC
	ldr r0, _021EA03C @ =0x00000438
	movs r1, #7
	ldr r0, [r5, r0]
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_021EA034: .4byte 0x00000524
_021EA038: .4byte 0x0000052C
_021EA03C: .4byte 0x00000438
	thumb_func_end ov108_021E9F94

	thumb_func_start ov108_021EA040
ov108_021EA040: @ 0x021EA040
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, _021EA244 @ =0x00000438
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, _021EA248 @ =0x00000454
	movs r4, #0
	adds r7, r5, r0
_021EA06A:
	movs r0, #0x43
	lsls r0, r0, #4
	ldrb r1, [r5, r0]
	movs r0, #6
	muls r0, r1, r0
	adds r0, r4, r0
	str r0, [sp, #0x1c]
	adds r0, r4, #6
	lsls r0, r0, #4
	str r0, [sp, #0x20]
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _021EA24C @ =0x0000042D
	ldrb r1, [r5, r0]
	ldr r0, [sp, #0x1c]
	cmp r0, r1
	blt _021EA09A
	ldr r0, [sp, #0x20]
	adds r0, r7, r0
	bl FUN_0201D5C8
	b _021EA168
_021EA09A:
	ldr r1, [sp, #0x1c]
	adds r0, r5, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov108_021EA52C
	cmp r0, #0
	ble _021EA0AE
	movs r0, #1
	b _021EA0B0
_021EA0AE:
	movs r0, #0
_021EA0B0:
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _021EA250 @ =0x0000051C
	lsls r1, r1, #0x1c
	ldr r0, [r5, r0]
	movs r2, #0x10
	str r2, [sp]
	movs r2, #4
	str r2, [sp, #4]
	adds r2, r0, #0
	adds r2, #0xc
	str r2, [sp, #8]
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsrs r3, r4, #0x1f
	lsls r6, r4, #0x1f
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	subs r6, r6, r3
	movs r2, #0x1f
	rors r6, r2
	adds r2, r3, r6
	adds r3, r4, r3
	lsls r0, r0, #0x15
	asrs r3, r3, #1
	lsrs r0, r0, #0x18
	adds r6, r3, #1
	str r0, [sp, #0x18]
	ldr r0, _021EA244 @ =0x00000438
	lsls r3, r6, #2
	adds r3, r6, r3
	lsls r2, r2, #0x1c
	lsls r3, r3, #0x18
	ldr r0, [r5, r0]
	movs r1, #6
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201C4EC
	movs r1, #0xcd
	ldr r2, [sp, #0x1c]
	lsls r1, r1, #2
	lsls r3, r2, #2
	movs r0, #0xc3
	lsls r0, r0, #2
	ldr r1, [r5, r1]
	adds r2, r2, r3
	ldrb r1, [r1, r2]
	movs r2, #0xc6
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	adds r1, #0xe
	bl FUN_0200BB6C
	movs r1, #0xc6
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0x70
	subs r3, r1, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA254 @ =0x00010200
	movs r2, #0xc6
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	lsls r2, r2, #2
	lsrs r6, r3, #0x1f
	adds r6, r3, r6
	ldr r2, [r5, r2]
	adds r0, r7, r0
	movs r1, #4
	asrs r3, r6, #1
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	adds r0, r7, r0
	bl FUN_0201D5C8
_021EA168:
	adds r4, r4, #1
	cmp r4, #6
	bge _021EA170
	b _021EA06A
_021EA170:
	ldr r0, _021EA258 @ =0x00000484
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0201D978
	movs r3, #1
	str r3, [sp]
	movs r2, #0x43
	movs r0, #0x31
	str r3, [sp, #4]
	lsls r2, r2, #4
	ldrb r2, [r5, r2]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r1, #1
	str r1, [sp]
	movs r0, #0x31
	ldr r2, _021EA25C @ =0x0000042E
	str r1, [sp, #4]
	lsls r0, r0, #4
	ldrb r2, [r5, r2]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	bl FUN_0200BFCC
	movs r2, #0x31
	lsls r2, r2, #4
	adds r1, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x1c
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0
	movs r2, #0xc5
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	ldr r0, _021EA258 @ =0x00000484
	str r1, [sp, #0xc]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, r5, r0
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, _021EA258 @ =0x00000484
	adds r0, r5, r0
	bl FUN_0201D5C8
	ldr r0, _021EA244 @ =0x00000438
	movs r1, #5
	ldr r0, [r5, r0]
	bl FUN_0201EFBC
	ldr r0, _021EA244 @ =0x00000438
	movs r1, #6
	ldr r0, [r5, r0]
	bl FUN_0201EFBC
	movs r0, #0x43
	lsls r0, r0, #4
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _021EA20E
	adds r0, #0x1c
	ldr r0, [r5, r0]
	movs r1, #7
	bl FUN_020248F0
	b _021EA218
_021EA20E:
	adds r0, #0x1c
	ldr r0, [r5, r0]
	movs r1, #5
	bl FUN_020248F0
_021EA218:
	movs r0, #0x43
	lsls r0, r0, #4
	subs r1, r0, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r0]
	subs r1, r1, #1
	cmp r2, r1
	bne _021EA236
	adds r0, #0x20
	ldr r0, [r5, r0]
	movs r1, #0xa
	bl FUN_020248F0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_021EA236:
	adds r0, #0x20
	ldr r0, [r5, r0]
	movs r1, #8
	bl FUN_020248F0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EA244: .4byte 0x00000438
_021EA248: .4byte 0x00000454
_021EA24C: .4byte 0x0000042D
_021EA250: .4byte 0x0000051C
_021EA254: .4byte 0x00010200
_021EA258: .4byte 0x00000484
_021EA25C: .4byte 0x0000042E
	thumb_func_end ov108_021EA040

	thumb_func_start ov108_021EA260
ov108_021EA260: @ 0x021EA260
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _021EA2DC @ =0x00000494
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	ldr r3, _021EA2E0 @ =0x00000432
	movs r2, #0xc3
	lsls r2, r2, #2
	ldrb r5, [r4, r3]
	adds r1, r2, #0
	adds r1, #0x28
	lsls r3, r5, #2
	ldr r0, [r4, r2]
	adds r2, #0xc
	ldr r1, [r4, r1]
	adds r3, r5, r3
	ldrb r1, [r1, r3]
	ldr r2, [r4, r2]
	adds r1, #0xe
	bl FUN_0200BB6C
	movs r1, #0xc6
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0x70
	subs r3, r1, r0
	movs r1, #0
	movs r2, #0xc6
	lsrs r5, r3, #0x1f
	adds r5, r3, r5
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA2E4 @ =0x00010200
	lsls r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _021EA2DC @ =0x00000494
	ldr r2, [r4, r2]
	adds r0, r4, r0
	movs r1, #4
	asrs r3, r5, #1
	bl FUN_020200FC
	ldr r0, _021EA2DC @ =0x00000494
	adds r0, r4, r0
	bl FUN_0201D5C8
	ldr r0, _021EA2E8 @ =0x00000484
	adds r0, r4, r0
	bl FUN_0201D8E4
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021EA2DC: .4byte 0x00000494
_021EA2E0: .4byte 0x00000432
_021EA2E4: .4byte 0x00010200
_021EA2E8: .4byte 0x00000484
	thumb_func_end ov108_021EA260

	thumb_func_start ov108_021EA2EC
ov108_021EA2EC: @ 0x021EA2EC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	cmp r1, #6
	blo _021EA2FC
	movs r3, #0xe0
	movs r2, #0xb4
	movs r5, #1
	b _021EA31A
_021EA2FC:
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1f
	subs r2, r2, r3
	movs r0, #0x1f
	rors r2, r0
	adds r0, r3, r2
	lsls r0, r0, #0x17
	asrs r3, r0, #0x10
	lsrs r0, r1, #1
	adds r1, r0, #1
	movs r0, #0x28
	muls r0, r1, r0
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	movs r5, #0
_021EA31A:
	ldr r0, _021EA330 @ =0x00000444
	adds r1, r3, #0
	ldr r0, [r4, r0]
	bl FUN_0200DD88
	ldr r0, _021EA330 @ =0x00000444
	adds r1, r5, #0
	ldr r0, [r4, r0]
	bl FUN_020248F0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EA330: .4byte 0x00000444
	thumb_func_end ov108_021EA2EC

	thumb_func_start ov108_021EA334
ov108_021EA334: @ 0x021EA334
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _021EA40C @ =0x00000454
	movs r6, #0
	adds r4, r1, #0
	adds r0, r5, r0
	adds r1, r6, #0
	bl FUN_0201D978
	cmp r4, #0
	beq _021EA352
	cmp r4, #2
	beq _021EA382
	b _021EA3A4
_021EA352:
	ldr r1, _021EA410 @ =0x00000433
	movs r2, #0xc3
	lsls r2, r2, #2
	ldrb r1, [r5, r1]
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	adds r1, #0xe
	bl FUN_0200BB6C
	adds r1, r6, #0
	movs r2, #0x31
	str r1, [sp]
	movs r0, #2
	lsls r2, r2, #4
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	adds r2, r2, #4
	ldr r2, [r5, r2]
	movs r3, #1
	bl FUN_0200BE3C
	movs r6, #1
	b _021EA3A4
_021EA382:
	ldr r0, _021EA414 @ =0x00000435
	ldrb r2, [r5, r0]
	cmp r2, #0
	bne _021EA38E
	movs r4, #3
	b _021EA3A4
_021EA38E:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x31
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r6, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r6, #1
_021EA3A4:
	cmp r6, #0
	beq _021EA3CE
	movs r2, #0xc3
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	adds r1, r4, #0
	bl FUN_0200BB6C
	movs r2, #0x31
	lsls r2, r2, #4
	adds r1, r2, #0
	ldr r0, [r5, r2]
	adds r1, #8
	adds r2, r2, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	b _021EA3DE
_021EA3CE:
	movs r2, #0xc3
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0xc
	ldr r2, [r5, r2]
	adds r1, r4, #0
	bl FUN_0200BB6C
_021EA3DE:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	movs r2, #0xc6
	ldr r0, _021EA40C @ =0x00000454
	str r1, [sp, #0xc]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, r5, r0
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, _021EA40C @ =0x00000454
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EA40C: .4byte 0x00000454
_021EA410: .4byte 0x00000433
_021EA414: .4byte 0x00000435
	thumb_func_end ov108_021EA334

	thumb_func_start ov108_021EA418
ov108_021EA418: @ 0x021EA418
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _021EA474 @ =0x00000464
	adds r4, r1, #0
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r2, #0xc3
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0xc
	ldr r2, [r5, r2]
	adds r1, r4, #4
	bl FUN_0200BB6C
	ldr r2, _021EA474 @ =0x00000464
	movs r1, #1
	adds r0, r5, r2
	subs r2, #0x82
	movs r3, #0xc
	bl FUN_0200E998
	movs r3, #0
	movs r2, #0xc6
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA478 @ =0x0001020F
	lsls r2, r2, #2
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, _021EA474 @ =0x00000464
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200FC
	ldr r0, _021EA474 @ =0x00000464
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021EA474: .4byte 0x00000464
_021EA478: .4byte 0x0001020F
	thumb_func_end ov108_021EA418

	thumb_func_start ov108_021EA47C
ov108_021EA47C: @ 0x021EA47C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl ov108_021EA624
	ldr r0, _021EA500 @ =0x000004A4
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	ldr r2, _021EA504 @ =0x00000431
	subs r1, r2, #1
	ldrb r3, [r4, r1]
	movs r1, #6
	ldrb r0, [r4, r2]
	muls r1, r3, r1
	adds r1, r0, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #6
	bhs _021EA4AE
	subs r0, r2, #4
	ldrb r0, [r4, r0]
	cmp r1, r0
	blo _021EA4BA
_021EA4AE:
	ldr r0, _021EA500 @ =0x000004A4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021EA4BA:
	movs r3, #0xc3
	lsls r3, r3, #2
	adds r2, r3, #0
	adds r2, #0x28
	ldr r5, [r4, r2]
	lsls r2, r1, #2
	adds r1, r1, r2
	ldrb r1, [r5, r1]
	ldr r0, [r4, r3]
	adds r3, #0xc
	ldr r2, [r4, r3]
	adds r1, #0x26
	bl FUN_0200BB6C
	movs r1, #0
	movs r2, #0xc6
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA508 @ =0x00010200
	lsls r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _021EA500 @ =0x000004A4
	ldr r2, [r4, r2]
	adds r0, r4, r0
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, _021EA500 @ =0x000004A4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EA500: .4byte 0x000004A4
_021EA504: .4byte 0x00000431
_021EA508: .4byte 0x00010200
	thumb_func_end ov108_021EA47C

	thumb_func_start ov108_021EA50C
ov108_021EA50C: @ 0x021EA50C
	push {r4, lr}
	movs r1, #0
	adds r4, r0, #0
	bl ov108_021E940C
	ldr r1, _021EA528 @ =0x00000431
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021EA2EC
	adds r0, r4, #0
	bl ov108_021EA47C
	pop {r4, pc}
	.align 2, 0
_021EA528: .4byte 0x00000431
	thumb_func_end ov108_021EA50C

	thumb_func_start ov108_021EA52C
ov108_021EA52C: @ 0x021EA52C
	push {r3, r4}
	ldr r2, _021EA580 @ =0x00000435
	ldrb r2, [r0, r2]
	cmp r2, #0
	bne _021EA53C
	movs r0, #4
	pop {r3, r4}
	bx lr
_021EA53C:
	lsls r2, r1, #2
	adds r4, r1, r2
	movs r1, #0xcd
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	ldr r3, [r0, #0x1c]
	adds r1, r1, r4
	ldrb r0, [r1, #3]
	ldrb r2, [r3, #0x18]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r2, r0
	beq _021EA566
	cmp r2, #0
	bne _021EA560
	movs r0, #2
	pop {r3, r4}
	bx lr
_021EA560:
	movs r0, #3
	pop {r3, r4}
	bx lr
_021EA566:
	ldrb r0, [r1, #1]
	lsls r0, r0, #2
	adds r0, r3, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _021EA578
	movs r0, #1
	pop {r3, r4}
	bx lr
_021EA578:
	movs r0, #0
	pop {r3, r4}
	bx lr
	nop
_021EA580: .4byte 0x00000435
	thumb_func_end ov108_021EA52C

	thumb_func_start ov108_021EA584
ov108_021EA584: @ 0x021EA584
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r3, [sp]
	adds r6, r1, #0
	ldr r0, [r5]
	movs r1, #0x14
	adds r7, r2, #0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x14
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r6, #2
	str r5, [r4, #4]
	lsls r0, r0, #2
	str r7, [r4]
	adds r1, r5, r0
	ldr r0, _021EA5D8 @ =0x00000444
	strb r6, [r4, #8]
	ldr r0, [r1, r0]
	lsls r1, r6, #1
	adds r1, r6, r1
	adds r1, r1, #6
	bl FUN_020248F0
	ldr r0, _021EA5DC @ =0x000005E1
	bl FUN_0200604C
	ldr r1, [r4]
	cmp r1, #0
	beq _021EA5CC
	ldr r0, [r1]
	adds r0, r0, #1
	str r0, [r1]
_021EA5CC:
	ldr r0, _021EA5E0 @ =ov108_021EA5E4
	ldr r2, [sp]
	adds r1, r4, #0
	bl FUN_0200E320
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA5D8: .4byte 0x00000444
_021EA5DC: .4byte 0x000005E1
_021EA5E0: .4byte ov108_021EA5E4
	thumb_func_end ov108_021EA584

	thumb_func_start ov108_021EA5E4
ov108_021EA5E4: @ 0x021EA5E4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r1, [r4, #9]
	adds r5, r0, #0
	adds r0, r1, #1
	strb r0, [r4, #9]
	cmp r1, #2
	blo _021EA61E
	ldr r0, [r4, #4]
	bl ov108_021EA040
	ldr r0, [r4, #4]
	bl ov108_021EA47C
	ldr r0, [r4, #4]
	ldr r1, _021EA620 @ =0x00000431
	ldrb r1, [r0, r1]
	bl ov108_021EA2EC
	ldr r1, [r4]
	ldr r0, [r1]
	subs r0, r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_021EA61E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EA620: .4byte 0x00000431
	thumb_func_end ov108_021EA5E4

	thumb_func_start ov108_021EA624
ov108_021EA624: @ 0x021EA624
	ldr r1, _021EA634 @ =0x00000434
	movs r2, #1
	strb r2, [r0, r1]
	subs r1, #0xfc
	adds r0, r0, r1
	ldr r3, _021EA638 @ =ov108_021E8ED8
	movs r1, #0
	bx r3
	.align 2, 0
_021EA634: .4byte 0x00000434
_021EA638: .4byte ov108_021E8ED8
	thumb_func_end ov108_021EA624

	thumb_func_start ov108_021EA63C
ov108_021EA63C: @ 0x021EA63C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	movs r6, #0
	movs r1, #0xa
	str r2, [sp, #4]
	str r3, [sp, #8]
	adds r4, r6, #0
	blx FUN_020F2BA4
	ldr r2, _021EA6F8 @ =0x021EAD28
	lsls r0, r1, #2
	adds r0, r2, r0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	mov ip, r0
	ldr r0, [sp]
	cmp r0, #0
	ble _021EA69C
	movs r7, #1
_021EA664:
	ldr r1, [sp, #0xc]
	mov r0, ip
	ldrb r0, [r1, r0]
	movs r2, #0
	lsls r1, r0, #3
	ldr r0, _021EA6FC @ =0x021EAD08
	ldrb r5, [r0, r1]
	adds r3, r0, r1
	cmp r5, #0
	ble _021EA690
	ldr r3, [r3, #4]
_021EA67A:
	ldrb r0, [r3]
	adds r1, r7, #0
	adds r2, r2, #1
	lsls r1, r0
	adds r0, r6, #1
	lsls r0, r0, #0x18
	orrs r4, r1
	lsrs r6, r0, #0x18
	adds r3, r3, #1
	cmp r2, r5
	blt _021EA67A
_021EA690:
	mov r0, ip
	adds r1, r0, #1
	ldr r0, [sp]
	mov ip, r1
	cmp r1, r0
	blt _021EA664
_021EA69C:
	lsls r5, r6, #2
	ldr r0, [sp, #0x28]
	adds r1, r6, r5
	bl FUN_0201AA8C
	movs r1, #0
	adds r2, r6, r5
	str r0, [sp, #0x10]
	blx FUN_020D4994
	movs r7, #0
	adds r6, r7, #0
_021EA6B4:
	movs r0, #1
	tst r0, r4
	beq _021EA6E4
	lsls r0, r7, #2
	adds r1, r7, r0
	ldr r0, [sp, #0x10]
	strb r6, [r0, r1]
	adds r5, r0, r1
	ldr r2, [sp, #4]
	adds r0, r5, #2
	adds r1, r6, #0
	bl FUN_02097268
	ldrb r1, [r5, #3]
	lsls r0, r1, #0x1c
	lsls r1, r1, #0x19
	lsrs r0, r0, #0x1d
	lsrs r1, r1, #0x1d
	bl ov108_021EA700
	strb r0, [r5, #1]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_021EA6E4:
	adds r6, r6, #1
	lsrs r4, r4, #1
	cmp r6, #0x18
	blt _021EA6B4
	ldr r0, [sp, #8]
	strb r7, [r0]
	ldr r0, [sp, #0x10]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EA6F8: .4byte 0x021EAD28
_021EA6FC: .4byte 0x021EAD08
	thumb_func_end ov108_021EA63C

	thumb_func_start ov108_021EA700
ov108_021EA700: @ 0x021EA700
	cmp r0, #1
	bne _021EA714
	cmp r1, #1
	beq _021EA70C
	movs r0, #1
	b _021EA70E
_021EA70C:
	movs r0, #0
_021EA70E:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
_021EA714:
	cmp r1, #1
	bne _021EA71C
	movs r0, #2
	bx lr
_021EA71C:
	movs r0, #3
	bx lr
	thumb_func_end ov108_021EA700

	.rodata

_021EA720:
	.byte 0xFF, 0x01, 0x01, 0xFF, 0x08, 0x0A, 0x0B, 0x00, 0x09, 0x0A, 0x0B, 0x00, 0x03, 0x00, 0x00, 0x0F
	.byte 0x00, 0x00, 0xB5, 0x03, 0xE5, 0x03, 0x30, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x15, 0x00, 0x02, 0x00
	.byte 0x0A, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x15, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x09, 0x00
	.byte 0x18, 0x58, 0x18, 0x58, 0x18, 0x58, 0x60, 0xA0, 0x18, 0x58, 0xA8, 0xE8, 0x60, 0xA0, 0x18, 0x58
	.byte 0x60, 0xA0, 0x60, 0xA0, 0x60, 0xA0, 0xA8, 0xE8, 0xA8, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x15, 0x16, 0x03, 0x04, 0x37, 0x03
	.byte 0x00, 0x01, 0x13, 0x16, 0x05, 0x04, 0x0B, 0x03, 0x03, 0x19, 0x15, 0x06, 0x03, 0x0C, 0xF9, 0x02
	.byte 0x03, 0x0D, 0x00, 0x06, 0x02, 0x0C, 0xED, 0x02, 0x07, 0x01, 0x15, 0x1E, 0x03, 0x05, 0xA6, 0x03
	.byte 0x18, 0x58, 0x10, 0x50, 0x18, 0x58, 0x60, 0xA0, 0x18, 0x58, 0xB0, 0xF0, 0x60, 0xA0, 0x10, 0x50
	.byte 0x60, 0xA0, 0x60, 0xA0, 0x60, 0xA0, 0xB0, 0xF0, 0xA8, 0xC0, 0xC0, 0x00, 0x06, 0x1A, 0x40, 0x60
	.byte 0x06, 0x1A, 0xA0, 0xC0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x1A, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x18, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x1A, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x01, 0x01, 0x01, 0x3A, 0x00, 0x3B, 0x00
	.byte 0x39, 0x00, 0x38, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x56, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0xB0, 0x15, 0x00, 0x62, 0xDD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x15, 0x01, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x47, 0x01, 0x00, 0x00
	.byte 0x14, 0x00, 0x14, 0x00, 0x47, 0x01, 0x00, 0x00, 0x14, 0x00, 0x14, 0x00, 0x90, 0x01, 0x00, 0x00
	.byte 0xFB, 0xFF, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x01, 0x00, 0x00
	.byte 0xFB, 0xFF, 0x00, 0x00, 0x5B, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x79, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5B, 0x01, 0x00, 0x00
	.byte 0xF9, 0xFF, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0xFD, 0xFF, 0x0A, 0x00, 0x5C, 0x01, 0x00, 0x00
	.byte 0xFD, 0xFF, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0xFA, 0xFF, 0x00, 0x00, 0xED, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xED, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x01, 0x00, 0x00, 0xF3, 0xFF, 0x00, 0x00, 0x56, 0x01, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x89, 0x01, 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0xA4, 0x01, 0x07, 0x00
	.byte 0x05, 0x00, 0xFF, 0xFF, 0x3B, 0x01, 0x01, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x7A, 0x01, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x7A, 0x01, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x5B, 0x01, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x07, 0x00, 0x00, 0x0F, 0x07, 0x00, 0x00, 0x02, 0x01, 0x00
	.byte 0x3E, 0x00, 0x3F, 0x00, 0x3D, 0x00, 0x3C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x57, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x28, 0x48, 0x00, 0x80, 0x28, 0x48, 0x80, 0x00, 0x50, 0x70, 0x00, 0x80, 0x50, 0x70, 0x80, 0x00
	.byte 0x78, 0x98, 0x00, 0x80, 0x78, 0x98, 0x80, 0x00, 0xA8, 0xC0, 0xC0, 0x00, 0xA4, 0xBC, 0x09, 0x37
	.byte 0xA4, 0xBC, 0x31, 0x5F, 0xFF, 0x00, 0x00, 0x00, 0x04, 0x02, 0x01, 0x1C, 0x02, 0x04, 0x6E, 0x03
	.byte 0x04, 0x02, 0x15, 0x1B, 0x02, 0x0D, 0x38, 0x03, 0x05, 0x19, 0x15, 0x06, 0x03, 0x0D, 0x26, 0x03
	.byte 0x05, 0x0D, 0x15, 0x06, 0x02, 0x04, 0x1A, 0x03, 0x05, 0x09, 0x08, 0x0E, 0x02, 0x04, 0xFE, 0x02
	.byte 0x01, 0x02, 0x12, 0x1C, 0x06, 0x01, 0x58, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB4, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x08, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x13, 0x14, 0x0C, 0x00, 0x00
	.byte 0x09, 0x0A, 0x0B, 0x0F, 0x10, 0x12, 0x00, 0x00, 0x06, 0x07, 0x08, 0x15, 0x16, 0x17, 0x00, 0x00
	.byte 0x03, 0x04, 0x05, 0x0D, 0x0E, 0x11, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xE8, 0xAC, 0x1E, 0x02
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0xAD, 0x1E, 0x02, 0x06, 0x00, 0x00, 0x00, 0xF8, 0xAC, 0x1E, 0x02
	.byte 0x06, 0x00, 0x00, 0x00, 0xF0, 0xAC, 0x1E, 0x02, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03
	.byte 0x00, 0x01, 0x02, 0x03, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00
	.byte 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02
	@ 0x021EAD50
