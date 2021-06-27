
	thumb_func_start ov44_02229EE0
ov44_02229EE0: @ 0x02229EE0
	push {r3, lr}
	movs r1, #0x16
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_020503D0
	movs r1, #2
	movs r2, #0x1b
	bl FUN_02066930
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_02229EE0

	thumb_func_start ov44_02229EF8
ov44_02229EF8: @ 0x02229EF8
	movs r0, #0
	bx lr
	thumb_func_end ov44_02229EF8

	thumb_func_start ov44_02229EFC
ov44_02229EFC: @ 0x02229EFC
	movs r0, #1
	bx lr
	thumb_func_end ov44_02229EFC

	thumb_func_start ov44_02229F00
ov44_02229F00: @ 0x02229F00
	push {r3, r4, r5, lr}
	ldrb r4, [r1, #0x1b]
	adds r5, r0, #0
	adds r1, r4, #0
	subs r1, #0x14
	cmp r1, #1
	bhi _02229F18
	bl ov44_02229EE0
	cmp r0, #0
	bne _02229F18
	movs r4, #0x1d
_02229F18:
	adds r0, r4, #0
	subs r0, #0x16
	cmp r0, #5
	bhi _02229F2C
	adds r0, r5, #0
	bl ov44_02229EFC
	cmp r0, #0
	bne _02229F2C
	movs r4, #0x1d
_02229F2C:
	adds r0, r4, #0
	subs r0, #0x12
	cmp r0, #1
	bhi _02229F40
	adds r0, r5, #0
	bl ov44_02229EF8
	cmp r0, #0
	bne _02229F40
	movs r4, #0x1d
_02229F40:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02229F00

	thumb_func_start ov44_02229F44
ov44_02229F44: @ 0x02229F44
	subs r0, #0x12
	cmp r0, #9
	bhi _02229F6E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02229F56: @ jump table
	.2byte _02229F6A - _02229F56 - 2 @ case 0
	.2byte _02229F6A - _02229F56 - 2 @ case 1
	.2byte _02229F6E - _02229F56 - 2 @ case 2
	.2byte _02229F6E - _02229F56 - 2 @ case 3
	.2byte _02229F6A - _02229F56 - 2 @ case 4
	.2byte _02229F6A - _02229F56 - 2 @ case 5
	.2byte _02229F6A - _02229F56 - 2 @ case 6
	.2byte _02229F6A - _02229F56 - 2 @ case 7
	.2byte _02229F6A - _02229F56 - 2 @ case 8
	.2byte _02229F6A - _02229F56 - 2 @ case 9
_02229F6A:
	movs r0, #1
	bx lr
_02229F6E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov44_02229F44

	thumb_func_start ov44_02229F74
ov44_02229F74: @ 0x02229F74
	push {r3, lr}
	subs r0, #0x12
	cmp r0, #9
	bhi _02229FAC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02229F88: @ jump table
	.2byte _02229F9C - _02229F88 - 2 @ case 0
	.2byte _02229F9C - _02229F88 - 2 @ case 1
	.2byte _02229FAC - _02229F88 - 2 @ case 2
	.2byte _02229FAC - _02229F88 - 2 @ case 3
	.2byte _02229FA0 - _02229F88 - 2 @ case 4
	.2byte _02229FA0 - _02229F88 - 2 @ case 5
	.2byte _02229FA8 - _02229F88 - 2 @ case 6
	.2byte _02229FA8 - _02229F88 - 2 @ case 7
	.2byte _02229FA4 - _02229F88 - 2 @ case 8
	.2byte _02229FA4 - _02229F88 - 2 @ case 9
_02229F9C:
	movs r0, #0xb
	pop {r3, pc}
_02229FA0:
	movs r0, #0xd
	pop {r3, pc}
_02229FA4:
	movs r0, #0xf
	pop {r3, pc}
_02229FA8:
	movs r0, #0xe
	pop {r3, pc}
_02229FAC:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov44_02229F74

	thumb_func_start ov44_02229FB4
ov44_02229FB4: @ 0x02229FB4
	subs r0, #9
	cmp r0, #5
	bhi _02229FD6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02229FC6: @ jump table
	.2byte _02229FD2 - _02229FC6 - 2 @ case 0
	.2byte _02229FD2 - _02229FC6 - 2 @ case 1
	.2byte _02229FD2 - _02229FC6 - 2 @ case 2
	.2byte _02229FD2 - _02229FC6 - 2 @ case 3
	.2byte _02229FD2 - _02229FC6 - 2 @ case 4
	.2byte _02229FD2 - _02229FC6 - 2 @ case 5
_02229FD2:
	movs r0, #1
	bx lr
_02229FD6:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov44_02229FB4

	thumb_func_start ov44_02229FDC
ov44_02229FDC: @ 0x02229FDC
	push {r4, lr}
	adds r4, r0, #0
	bl ov44_02229FB4
	cmp r0, #0
	beq _02229FEC
	movs r0, #1
	pop {r4, pc}
_02229FEC:
	subs r4, #0xf
	cmp r4, #0xc
	bhi _0222A01C
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02229FFE: @ jump table
	.2byte _0222A018 - _02229FFE - 2 @ case 0
	.2byte _0222A01C - _02229FFE - 2 @ case 1
	.2byte _0222A01C - _02229FFE - 2 @ case 2
	.2byte _0222A01C - _02229FFE - 2 @ case 3
	.2byte _0222A018 - _02229FFE - 2 @ case 4
	.2byte _0222A01C - _02229FFE - 2 @ case 5
	.2byte _0222A018 - _02229FFE - 2 @ case 6
	.2byte _0222A01C - _02229FFE - 2 @ case 7
	.2byte _0222A018 - _02229FFE - 2 @ case 8
	.2byte _0222A01C - _02229FFE - 2 @ case 9
	.2byte _0222A018 - _02229FFE - 2 @ case 10
	.2byte _0222A01C - _02229FFE - 2 @ case 11
	.2byte _0222A018 - _02229FFE - 2 @ case 12
_0222A018:
	movs r0, #1
	pop {r4, pc}
_0222A01C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov44_02229FDC

	thumb_func_start ov44_0222A020
ov44_0222A020: @ 0x0222A020
	cmp r0, #7
	bhi _0222A044
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A030: @ jump table
	.2byte _0222A044 - _0222A030 - 2 @ case 0
	.2byte _0222A044 - _0222A030 - 2 @ case 1
	.2byte _0222A040 - _0222A030 - 2 @ case 2
	.2byte _0222A040 - _0222A030 - 2 @ case 3
	.2byte _0222A040 - _0222A030 - 2 @ case 4
	.2byte _0222A040 - _0222A030 - 2 @ case 5
	.2byte _0222A040 - _0222A030 - 2 @ case 6
	.2byte _0222A040 - _0222A030 - 2 @ case 7
_0222A040:
	movs r0, #1
	bx lr
_0222A044:
	movs r0, #0
	bx lr
	thumb_func_end ov44_0222A020

	thumb_func_start ov44_0222A048
ov44_0222A048: @ 0x0222A048
	push {r4, lr}
	adds r4, r0, #0
	bl ov44_0222A020
	cmp r0, #0
	beq _0222A058
	movs r0, #1
	pop {r4, pc}
_0222A058:
	cmp r4, #8
	bgt _0222A064
	bge _0222A088
	cmp r4, #1
	beq _0222A088
	b _0222A08C
_0222A064:
	subs r4, #0x12
	cmp r4, #8
	bhi _0222A08C
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A076: @ jump table
	.2byte _0222A088 - _0222A076 - 2 @ case 0
	.2byte _0222A08C - _0222A076 - 2 @ case 1
	.2byte _0222A088 - _0222A076 - 2 @ case 2
	.2byte _0222A08C - _0222A076 - 2 @ case 3
	.2byte _0222A088 - _0222A076 - 2 @ case 4
	.2byte _0222A08C - _0222A076 - 2 @ case 5
	.2byte _0222A088 - _0222A076 - 2 @ case 6
	.2byte _0222A08C - _0222A076 - 2 @ case 7
	.2byte _0222A088 - _0222A076 - 2 @ case 8
_0222A088:
	movs r0, #1
	pop {r4, pc}
_0222A08C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0222A048

	thumb_func_start ov44_0222A090
ov44_0222A090: @ 0x0222A090
	subs r0, #0xc
	cmp r0, #3
	bhi _0222A0AE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A0A2: @ jump table
	.2byte _0222A0AA - _0222A0A2 - 2 @ case 0
	.2byte _0222A0AA - _0222A0A2 - 2 @ case 1
	.2byte _0222A0AA - _0222A0A2 - 2 @ case 2
	.2byte _0222A0AA - _0222A0A2 - 2 @ case 3
_0222A0AA:
	movs r0, #1
	bx lr
_0222A0AE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov44_0222A090

	thumb_func_start ov44_0222A0B4
ov44_0222A0B4: @ 0x0222A0B4
	movs r1, #0x1d
	cmp r0, #0x1b
	bhi _0222A164
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A0C6: @ jump table
	.2byte _0222A164 - _0222A0C6 - 2 @ case 0
	.2byte _0222A162 - _0222A0C6 - 2 @ case 1
	.2byte _0222A14A - _0222A0C6 - 2 @ case 2
	.2byte _0222A14E - _0222A0C6 - 2 @ case 3
	.2byte _0222A152 - _0222A0C6 - 2 @ case 4
	.2byte _0222A156 - _0222A0C6 - 2 @ case 5
	.2byte _0222A15A - _0222A0C6 - 2 @ case 6
	.2byte _0222A15E - _0222A0C6 - 2 @ case 7
	.2byte _0222A146 - _0222A0C6 - 2 @ case 8
	.2byte _0222A116 - _0222A0C6 - 2 @ case 9
	.2byte _0222A11A - _0222A0C6 - 2 @ case 10
	.2byte _0222A11E - _0222A0C6 - 2 @ case 11
	.2byte _0222A122 - _0222A0C6 - 2 @ case 12
	.2byte _0222A126 - _0222A0C6 - 2 @ case 13
	.2byte _0222A12A - _0222A0C6 - 2 @ case 14
	.2byte _0222A112 - _0222A0C6 - 2 @ case 15
	.2byte _0222A12E - _0222A0C6 - 2 @ case 16
	.2byte _0222A164 - _0222A0C6 - 2 @ case 17
	.2byte _0222A132 - _0222A0C6 - 2 @ case 18
	.2byte _0222A0FE - _0222A0C6 - 2 @ case 19
	.2byte _0222A136 - _0222A0C6 - 2 @ case 20
	.2byte _0222A102 - _0222A0C6 - 2 @ case 21
	.2byte _0222A13A - _0222A0C6 - 2 @ case 22
	.2byte _0222A106 - _0222A0C6 - 2 @ case 23
	.2byte _0222A142 - _0222A0C6 - 2 @ case 24
	.2byte _0222A10E - _0222A0C6 - 2 @ case 25
	.2byte _0222A13E - _0222A0C6 - 2 @ case 26
	.2byte _0222A10A - _0222A0C6 - 2 @ case 27
_0222A0FE:
	movs r1, #0x12
	b _0222A164
_0222A102:
	movs r1, #0x14
	b _0222A164
_0222A106:
	movs r1, #0x16
	b _0222A164
_0222A10A:
	movs r1, #0x1a
	b _0222A164
_0222A10E:
	movs r1, #0x18
	b _0222A164
_0222A112:
	movs r1, #8
	b _0222A164
_0222A116:
	movs r1, #2
	b _0222A164
_0222A11A:
	movs r1, #3
	b _0222A164
_0222A11E:
	movs r1, #4
	b _0222A164
_0222A122:
	movs r1, #5
	b _0222A164
_0222A126:
	movs r1, #6
	b _0222A164
_0222A12A:
	movs r1, #7
	b _0222A164
_0222A12E:
	movs r1, #1
	b _0222A164
_0222A132:
	movs r1, #0x13
	b _0222A164
_0222A136:
	movs r1, #0x15
	b _0222A164
_0222A13A:
	movs r1, #0x17
	b _0222A164
_0222A13E:
	movs r1, #0x1b
	b _0222A164
_0222A142:
	movs r1, #0x19
	b _0222A164
_0222A146:
	movs r1, #0xf
	b _0222A164
_0222A14A:
	movs r1, #9
	b _0222A164
_0222A14E:
	movs r1, #0xa
	b _0222A164
_0222A152:
	movs r1, #0xb
	b _0222A164
_0222A156:
	movs r1, #0xc
	b _0222A164
_0222A15A:
	movs r1, #0xd
	b _0222A164
_0222A15E:
	movs r1, #0xe
	b _0222A164
_0222A162:
	movs r1, #0x10
_0222A164:
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222A0B4

	thumb_func_start ov44_0222A168
ov44_0222A168: @ 0x0222A168
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x16
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_02074904
	str r0, [sp]
	bl FUN_02074640
	movs r5, #0
	adds r7, r0, #0
	adds r4, r5, #0
	cmp r7, #0
	ble _0222A1B0
_0222A184:
	ldr r0, [sp]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0xa3
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0222A1AA
	adds r0, r6, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0222A1AA
	adds r5, r5, #1
_0222A1AA:
	adds r4, r4, #1
	cmp r4, r7
	blt _0222A184
_0222A1B0:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222A168

	thumb_func_start ov44_0222A1B4
ov44_0222A1B4: @ 0x0222A1B4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	subs r1, #0x12
	cmp r1, #1
	bhi _0222A1C6
	bl FUN_02039AF8
	pop {r4, pc}
_0222A1C6:
	bl ov44_02229F44
	cmp r0, #0
	beq _0222A1D4
	bl FUN_02039B18
	pop {r4, pc}
_0222A1D4:
	cmp r4, #0x10
	bne _0222A1DE
	bl FUN_02039B58
	pop {r4, pc}
_0222A1DE:
	subs r4, #0x14
	cmp r4, #1
	bhi _0222A1F0
	movs r0, #0
	bl FUN_020378E4
	bl FUN_02039E9C
	pop {r4, pc}
_0222A1F0:
	movs r0, #1
	bl FUN_020378E4
	bl FUN_02039B7C
	pop {r4, pc}
	thumb_func_end ov44_0222A1B4

	thumb_func_start ov44_0222A1FC
ov44_0222A1FC: @ 0x0222A1FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0222A3E8 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0222A3EC @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	movs r0, #0x58
	movs r1, #0x35
	bl FUN_02007688
	str r0, [sp, #0x20]
	movs r0, #0x35
	bl FUN_0201AC88
	movs r2, #0x57
	ldr r1, [sp, #4]
	lsls r2, r2, #2
	str r0, [r1, r2]
	movs r0, #0x35
	bl FUN_0200BD08
	movs r2, #0x59
	ldr r1, [sp, #4]
	lsls r2, r2, #2
	str r0, [r1, r2]
	ldr r2, _0222A3F0 @ =0x0000030A
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x35
	bl FUN_0200BAF8
	movs r2, #0x5a
	ldr r1, [sp, #4]
	lsls r2, r2, #2
	str r0, [r1, r2]
	movs r2, #0x32
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #4
	movs r3, #0x35
	bl FUN_0200BAF8
	movs r2, #0x5b
	ldr r1, [sp, #4]
	lsls r2, r2, #2
	str r0, [r1, r2]
	bl ov44_0222A830
	movs r1, #0x57
	ldr r0, [sp, #4]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl ov44_0222A850
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	bl ov44_0222AEC0
	movs r2, #0x33
	ldr r1, _0222A3F4 @ =0x00000D68
	ldr r0, [sp, #4]
	lsls r2, r2, #4
	adds r0, r0, r1
	movs r1, #0
	blx FUN_020D4994
	ldr r0, [sp, #0x20]
	movs r1, #5
	add r2, sp, #0x2c
	movs r3, #0x35
	bl FUN_02007C48
	adds r4, r0, #0
	ldr r0, [sp, #0x2c]
	movs r2, #0xd7
	ldr r1, [sp, #4]
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020D47B8
	ldr r0, [sp, #0x2c]
	movs r2, #0xdf
	ldr r1, [sp, #4]
	lsls r2, r2, #4
	adds r1, r1, r2
	ldr r0, [r0, #0xc]
	movs r2, #0x80
	blx FUN_020D47B8
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	movs r1, #0xdf
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	subs r1, #0x80
	adds r0, r0, r1
	str r0, [sp, #8]
_0222A2FA:
	movs r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	lsls r1, r0, #5
	ldr r0, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #0x24]
_0222A30C:
	ldr r0, [sp, #0x18]
	cmp r0, #0x15
	blt _0222A316
	bl GF_AssertFail
_0222A316:
	ldr r0, [sp, #0x24]
	movs r7, #1
	adds r4, r0, #2
	ldr r0, [sp, #0xc]
	adds r6, r0, #2
	ldr r0, [sp, #8]
	adds r5, r0, #2
	ldr r0, [sp, #0x14]
	asrs r0, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x28]
_0222A32E:
	movs r0, #0xd7
	lsls r0, r0, #4
	ldrh r0, [r4, r0]
	ldr r3, [sp, #0x28]
	adds r1, r6, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	bl FUN_02003DE8
	adds r7, r7, #1
	adds r4, r4, #2
	adds r6, r6, #2
	adds r5, r5, #2
	cmp r7, #0x10
	blt _0222A32E
	ldr r0, [sp, #0xc]
	adds r0, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	beq _0222A37A
	movs r0, #3
	ldr r1, [sp, #0x14]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _0222A30C
	str r0, [sp, #0x14]
	movs r0, #1
	str r0, [sp, #0x10]
	b _0222A30C
_0222A37A:
	ldr r0, [sp, #8]
	adds r0, #0x20
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #3
	blt _0222A2FA
	movs r1, #0xdf
	ldr r0, [sp, #4]
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #0x2a
	lsls r1, r1, #4
	blx DC_FlushRange
	ldr r1, _0222A3F8 @ =0x00000D6C
	ldr r0, [sp, #4]
	movs r2, #1
	str r2, [r0, r1]
	ldr r2, _0222A3FC @ =0x00001094
	movs r3, #0
	str r3, [r0, r2]
	subs r2, r1, #4
	ldr r1, [sp, #4]
	ldr r0, _0222A400 @ =ov44_0222A40C
	adds r1, r1, r2
	movs r2, #0x14
	bl FUN_0200E33C
	ldr r2, _0222A3F4 @ =0x00000D68
	ldr r1, [sp, #4]
	str r0, [r1, r2]
	ldr r0, _0222A404 @ =ov44_0222A7F8
	bl FUN_0201A0FC
	bl ov44_0222AFE8
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	bl ov44_0222B030
	ldr r0, [sp, #4]
	bl ov44_0222B0A4
	ldr r0, _0222A408 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	ldr r0, [sp, #0x20]
	bl FUN_0200770C
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A3E8: .4byte 0xFFFFE0FF
_0222A3EC: .4byte 0x04001000
_0222A3F0: .4byte 0x0000030A
_0222A3F4: .4byte 0x00000D68
_0222A3F8: .4byte 0x00000D6C
_0222A3FC: .4byte 0x00001094
_0222A400: .4byte ov44_0222A40C
_0222A404: .4byte ov44_0222A7F8
_0222A408: .4byte 0x021D116C
	thumb_func_end ov44_0222A1FC

	thumb_func_start ov44_0222A40C
ov44_0222A40C: @ 0x0222A40C
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222A4AA
	ldr r1, _0222A4AC @ =0x0000032B
	movs r0, #1
	ldrb r2, [r4, r1]
	eors r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _0222A4AA
	adds r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _0222A442
	subs r0, r1, #3
	ldrsh r0, [r4, r0]
	adds r2, r4, #0
	adds r2, #0x88
	lsls r0, r0, #5
	adds r0, r2, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFC6C
_0222A442:
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222A450
	cmp r0, #2
	bne _0222A466
_0222A450:
	movs r0, #0xca
	lsls r0, r0, #2
	ldrsh r0, [r4, r0]
	adds r1, r4, #0
	adds r1, #0x88
	lsls r0, r0, #5
	adds r0, r1, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFCC0
_0222A466:
	ldr r0, _0222A4B0 @ =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _0222A48E
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	adds r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _0222A4AA
	movs r2, #0x13
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	movs r1, #1
	eors r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_0222A48E:
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _0222A4AA
	movs r2, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eors r1, r2
	strb r1, [r4, r0]
_0222A4AA:
	pop {r4, pc}
	.align 2, 0
_0222A4AC: .4byte 0x0000032B
_0222A4B0: .4byte 0x0000032A
	thumb_func_end ov44_0222A40C

	thumb_func_start ov44_0222A4B4
ov44_0222A4B4: @ 0x0222A4B4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	ldr r1, [r6]
	adds r5, r0, #0
	cmp r1, #0
	beq _0222A4CA
	cmp r1, #1
	bne _0222A4C8
	b _0222A5F2
_0222A4C8:
	b _0222A600
_0222A4CA:
	bl FUN_020072A4
	adds r4, r0, #0
	bl FUN_02039998
	cmp r0, #0
	beq _0222A510
	ldr r0, [r4, #4]
	cmp r0, #0xc
	bhi _0222A51A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A4EA: @ jump table
	.2byte _0222A51A - _0222A4EA - 2 @ case 0
	.2byte _0222A504 - _0222A4EA - 2 @ case 1
	.2byte _0222A504 - _0222A4EA - 2 @ case 2
	.2byte _0222A504 - _0222A4EA - 2 @ case 3
	.2byte _0222A504 - _0222A4EA - 2 @ case 4
	.2byte _0222A504 - _0222A4EA - 2 @ case 5
	.2byte _0222A504 - _0222A4EA - 2 @ case 6
	.2byte _0222A504 - _0222A4EA - 2 @ case 7
	.2byte _0222A504 - _0222A4EA - 2 @ case 8
	.2byte _0222A504 - _0222A4EA - 2 @ case 9
	.2byte _0222A504 - _0222A4EA - 2 @ case 10
	.2byte _0222A51A - _0222A4EA - 2 @ case 11
	.2byte _0222A504 - _0222A4EA - 2 @ case 12
_0222A504:
	movs r1, #0x80
	movs r0, #3
	lsls r2, r1, #9
	bl FUN_0201A910
	b _0222A51A
_0222A510:
	movs r1, #0x80
	movs r0, #3
	lsls r2, r1, #9
	bl FUN_0201A910
_0222A51A:
	ldr r0, _0222A608 @ =0x0000002A
	movs r1, #2
	bl FUN_02006FF8
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0222A536
	movs r2, #7
	movs r0, #3
	movs r1, #0x35
	lsls r2, r2, #0x10
	bl FUN_0201A910
	b _0222A542
_0222A536:
	movs r2, #0xa
	movs r0, #3
	movs r1, #0x35
	lsls r2, r2, #0x10
	bl FUN_0201A910
_0222A542:
	movs r1, #0x43
	adds r0, r5, #0
	lsls r1, r1, #6
	movs r2, #0x35
	bl FUN_02007280
	movs r2, #0x43
	movs r1, #0
	lsls r2, r2, #6
	adds r5, r0, #0
	blx FUN_020D4994
	movs r0, #0x20
	movs r1, #0x35
	bl FUN_0202055C
	movs r1, #6
	movs r0, #8
	lsls r1, r1, #6
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r2, [r4]
	subs r0, #0x20
	subs r1, #0x20
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl FUN_0202C6F4
	str r0, [r5]
	movs r1, #0xd5
	ldr r0, [r4, #4]
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	movs r2, #8
	subs r0, #8
	str r2, [r5, r0]
	subs r2, #9
	adds r1, #0x1c
	str r2, [r5, r1]
	movs r0, #0xf
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xf
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r5, #0
	bl ov44_0222ADF8
	adds r0, r5, #0
	bl ov44_0222A1FC
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	bl FUN_02039998
	cmp r0, #0
	beq _0222A5D2
	bl FUN_0203A880
	b _0222A5DC
_0222A5D2:
	bl FUN_020915B0
	movs r0, #0x35
	bl FUN_02039FD8
_0222A5DC:
	movs r0, #4
	bl FUN_02021148
	cmp r0, #1
	beq _0222A5EA
	bl GF_AssertFail
_0222A5EA:
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _0222A600
_0222A5F2:
	bl FUN_02007290
	movs r0, #0
	str r0, [r6]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, r5, r6, pc}
_0222A600:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0222A608: .4byte 0x0000002A
	thumb_func_end ov44_0222A4B4

	thumb_func_start ov44_0222A60C
ov44_0222A60C: @ 0x0222A60C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl FUN_02007290
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #0
	beq _0222A626
	cmp r1, #1
	beq _0222A634
	cmp r1, #2
	beq _0222A64E
	b _0222A65A
_0222A626:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222A65A
	movs r0, #1
	str r0, [r5]
	b _0222A65A
_0222A634:
	movs r2, #0xd2
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	ldr r3, _0222A684 @ =0x0223676C
	lsls r6, r2, #2
	ldr r6, [r3, r6]
	cmp r6, #0
	beq _0222A65A
	ldr r3, _0222A688 @ =0x022368A0
	str r2, [r3]
	blx r6
	str r0, [r5]
	b _0222A65A
_0222A64E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222A65A
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222A65A:
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222A668
	bl FUN_0202457C
_0222A668:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231BB0
	cmp r0, #1
	bne _0222A680
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231C60
_0222A680:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A684: .4byte 0x0223676C
_0222A688: .4byte 0x022368A0
	thumb_func_end ov44_0222A60C

	thumb_func_start ov44_0222A68C
ov44_0222A68C: @ 0x0222A68C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldr r0, _0222A74C @ =0x00000D68
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222A6AE
	bl FUN_0200E390
	ldr r0, _0222A74C @ =0x00000D68
	movs r1, #0
	str r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r5, r0]
_0222A6AE:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #1
	bne _0222A6C6
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231B4C
_0222A6C6:
	adds r0, r5, #0
	bl ov44_0222F98C
	cmp r0, #1
	bne _0222A6D6
	adds r0, r5, #0
	bl ov44_0222FA28
_0222A6D6:
	ldr r0, _0222A750 @ =0x00000B0C
	adds r0, r5, r0
	bl ov44_0222ABB8
	movs r0, #0xb3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020135AC
	movs r7, #0xaf
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_0222A6F0:
	ldr r0, [r4, r7]
	bl FUN_0200A0D0
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _0222A6F0
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	adds r0, r5, #0
	bl ov44_0222B164
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov44_0222AE74
	movs r0, #0x5b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200BB44
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200BDA0
	ldr r0, _0222A754 @ =0x0000002A
	bl FUN_02006F7C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A74C: .4byte 0x00000D68
_0222A750: .4byte 0x00000B0C
_0222A754: .4byte 0x0000002A
	thumb_func_end ov44_0222A68C

	thumb_func_start ov44_0222A758
ov44_0222A758: @ 0x0222A758
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov44_0222A68C
	adds r0, r5, #0
	bl FUN_020072A4
	adds r6, r0, #0
	movs r0, #0xd3
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	str r1, [r6, #4]
	ldr r0, [r4, r0]
	cmp r0, #8
	beq _0222A780
	cmp r0, #0xa
	bne _0222A78C
_0222A780:
	bl FUN_020915C0
	movs r0, #0
	bl FUN_02002B8C
	b _0222A792
_0222A78C:
	bl FUN_021E6EBC
	str r0, [r6, #8]
_0222A792:
	adds r0, r4, #0
	bl ov44_0222AE44
	adds r0, r5, #0
	bl FUN_02007294
	bl FUN_02021238
	bl FUN_020205AC
	movs r0, #0x35
	bl FUN_0201A9C4
	movs r0, #0xd3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0xc
	bhi _0222A7E2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A7C2: @ jump table
	.2byte _0222A7E2 - _0222A7C2 - 2 @ case 0
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 1
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 2
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 3
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 4
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 5
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 6
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 7
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 8
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 9
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 10
	.2byte _0222A7E2 - _0222A7C2 - 2 @ case 11
	.2byte _0222A7DC - _0222A7C2 - 2 @ case 12
_0222A7DC:
	movs r0, #0x80
	bl FUN_0201A9C4
_0222A7E2:
	bl ov44_0222E074
	cmp r0, #1
	bne _0222A7F2
	movs r0, #0
	movs r1, #0x78
	bl FUN_0200542C
_0222A7F2:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_0222A758

	thumb_func_start ov44_0222A7F8
ov44_0222A7F8: @ 0x0222A7F8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r0, _0222A82C @ =0x000010BC
	ldrh r0, [r4, r0]
	cmp r0, #1
	bne _0222A828
	movs r0, #0
	bl FUN_0200FBE8
	movs r0, #1
	bl FUN_0200FBE8
	ldr r0, _0222A82C @ =0x000010BC
	movs r1, #0
	strh r1, [r4, r0]
_0222A828:
	pop {r4, pc}
	nop
_0222A82C: .4byte 0x000010BC
	thumb_func_end ov44_0222A7F8

	thumb_func_start ov44_0222A830
ov44_0222A830: @ 0x0222A830
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0222A84C @ =0x02235548
	add r3, sp, #0
	movs r2, #5
_0222A83A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222A83A
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0222A84C: .4byte 0x02235548
	thumb_func_end ov44_0222A830

	thumb_func_start ov44_0222A850
ov44_0222A850: @ 0x0222A850
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	ldr r5, _0222AA68 @ =0x022353B0
	add r3, sp, #0xe0
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0222AA6C @ =0x022353E8
	add r3, sp, #0xc4
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #0
	str r0, [r3]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0222AA70 @ =0x02235404
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0222AA74 @ =0x02235490
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0222AA78 @ =0x02235420
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _0222AA7C @ =0x0223543C
	add r3, sp, #0x54
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	movs r1, #4
	str r0, [r3]
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _0222AA80 @ =0x02235458
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _0222AA84 @ =0x02235474
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _0222AA88 @ =0x022354AC
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x35
	bl FUN_0201C1C4
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	ldr r0, _0222AA8C @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0222AA90 @ =0x04001050
	strh r1, [r0]
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222AA68: .4byte 0x022353B0
_0222AA6C: .4byte 0x022353E8
_0222AA70: .4byte 0x02235404
_0222AA74: .4byte 0x02235490
_0222AA78: .4byte 0x02235420
_0222AA7C: .4byte 0x0223543C
_0222AA80: .4byte 0x02235458
_0222AA84: .4byte 0x02235474
_0222AA88: .4byte 0x022354AC
_0222AA8C: .4byte 0x04000050
_0222AA90: .4byte 0x04001050
	thumb_func_end ov44_0222A850

	thumb_func_start ov44_0222AA94
ov44_0222AA94: @ 0x0222AA94
	push {r3, r4, r5, lr}
	ldr r2, _0222AABC @ =0x00000A88
	movs r4, #0
	adds r5, r0, #0
_0222AA9C:
	ldr r3, [r5, r2]
	cmp r3, #0
	bne _0222AAAC
	lsls r2, r4, #2
	adds r2, r0, r2
	ldr r0, _0222AABC @ =0x00000A88
	str r1, [r2, r0]
	pop {r3, r4, r5, pc}
_0222AAAC:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x21
	blt _0222AA9C
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_0222AABC: .4byte 0x00000A88
	thumb_func_end ov44_0222AA94

	thumb_func_start ov44_0222AAC0
ov44_0222AAC0: @ 0x0222AAC0
	push {r3, r4, r5, lr}
	ldr r2, _0222AAE8 @ =0x00000A88
	movs r4, #0
	adds r5, r0, #0
_0222AAC8:
	ldr r3, [r5, r2]
	cmp r3, r1
	bne _0222AADA
	lsls r1, r4, #2
	adds r1, r0, r1
	ldr r0, _0222AAE8 @ =0x00000A88
	movs r2, #0
	str r2, [r1, r0]
	pop {r3, r4, r5, pc}
_0222AADA:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x21
	blt _0222AAC8
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222AAE8: .4byte 0x00000A88
	thumb_func_end ov44_0222AAC0

	thumb_func_start ov44_0222AAEC
ov44_0222AAEC: @ 0x0222AAEC
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0222AB20 @ =0x00000A88
	str r0, [sp]
	adds r6, r1, #0
	movs r4, #0
	adds r5, r0, #0
_0222AAF8:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0222AB12
	bl ov44_02231EF4
	cmp r6, r0
	bne _0222AB12
	ldr r0, [sp]
	lsls r1, r4, #2
	adds r1, r0, r1
	ldr r0, _0222AB20 @ =0x00000A88
	ldr r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222AB12:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x21
	blt _0222AAF8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222AB20: .4byte 0x00000A88
	thumb_func_end ov44_0222AAEC

	thumb_func_start ov44_0222AB24
ov44_0222AB24: @ 0x0222AB24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r2, #0
	adds r4, r3, #0
	movs r0, #0x40
	str r0, [sp]
	movs r3, #0xe
	adds r5, r1, #0
	adds r1, r3, #0
	adds r0, r6, #0
	movs r2, #0
	adds r3, #0xf2
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0x40
	str r0, [sp]
	movs r3, #0x1a
	adds r0, r6, #0
	movs r1, #0xe
	movs r2, #4
	lsls r3, r3, #4
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #0xd
	adds r2, r7, #0
	movs r3, #1
	str r4, [sp, #0xc]
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0xd
	adds r2, r7, #0
	movs r3, #6
	bl FUN_02007B44
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0222AB9C
	adds r3, r5, #0
	adds r0, r6, #0
	movs r1, #0xd
	movs r2, #0
	adds r3, #0xc
	str r4, [sp]
	bl FUN_02007C10
	str r0, [r5, #8]
_0222AB9C:
	ldr r0, [r5]
	cmp r0, #0
	bne _0222ABB2
	adds r0, r6, #0
	movs r1, #0xf
	movs r2, #0
	adds r3, r5, #4
	str r4, [sp]
	bl FUN_02007C2C
	str r0, [r5]
_0222ABB2:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_0222AB24

	thumb_func_start ov44_0222ABB8
ov44_0222ABB8: @ 0x0222ABB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222ABCA
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
_0222ABCA:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0222ABD8
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #8]
_0222ABD8:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222ABB8

	thumb_func_start ov44_0222ABDC
ov44_0222ABDC: @ 0x0222ABDC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	ldr r1, [r1, #4]
	adds r4, r2, #0
	movs r2, #2
	str r2, [sp]
	str r2, [sp, #4]
	adds r2, r1, #0
	adds r2, #0xc
	str r2, [sp, #8]
	ldr r2, [sp, #0x34]
	adds r6, r3, #0
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	ldrh r2, [r1]
	add r3, sp, #0x20
	adds r5, r0, #0
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r1, [r1, #2]
	adds r2, r6, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	lsls r1, r4, #0x18
	ldrb r3, [r3, #0x10]
	lsrs r1, r1, #0x18
	bl FUN_0201C4EC
	adds r0, r4, #0
	bl ov44_0222ADC4
	movs r1, #2
	str r1, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x38]
	add r3, sp, #0x20
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r1, r4, #0x18
	ldrb r3, [r3, #0x10]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	bl FUN_0201CA4C
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_0222ABDC

	thumb_func_start ov44_0222AC54
ov44_0222AC54: @ 0x0222AC54
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r5, [sp, #0x24]
	movs r4, #0
	cmp r5, #0x1d
	bhi _0222ACD4
	adds r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	add pc, r5
_0222AC6C: @ jump table
	.2byte _0222ACCC - _0222AC6C - 2 @ case 0
	.2byte _0222ACA8 - _0222AC6C - 2 @ case 1
	.2byte _0222ACAE - _0222AC6C - 2 @ case 2
	.2byte _0222ACAE - _0222AC6C - 2 @ case 3
	.2byte _0222ACAE - _0222AC6C - 2 @ case 4
	.2byte _0222ACAE - _0222AC6C - 2 @ case 5
	.2byte _0222ACAE - _0222AC6C - 2 @ case 6
	.2byte _0222ACAE - _0222AC6C - 2 @ case 7
	.2byte _0222ACB4 - _0222AC6C - 2 @ case 8
	.2byte _0222ACAC - _0222AC6C - 2 @ case 9
	.2byte _0222ACAC - _0222AC6C - 2 @ case 10
	.2byte _0222ACAC - _0222AC6C - 2 @ case 11
	.2byte _0222ACAC - _0222AC6C - 2 @ case 12
	.2byte _0222ACAC - _0222AC6C - 2 @ case 13
	.2byte _0222ACAC - _0222AC6C - 2 @ case 14
	.2byte _0222ACB2 - _0222AC6C - 2 @ case 15
	.2byte _0222ACC8 - _0222AC6C - 2 @ case 16
	.2byte _0222ACD4 - _0222AC6C - 2 @ case 17
	.2byte _0222ACBE - _0222AC6C - 2 @ case 18
	.2byte _0222ACBE - _0222AC6C - 2 @ case 19
	.2byte _0222ACC4 - _0222AC6C - 2 @ case 20
	.2byte _0222ACC2 - _0222AC6C - 2 @ case 21
	.2byte _0222ACBA - _0222AC6C - 2 @ case 22
	.2byte _0222ACB8 - _0222AC6C - 2 @ case 23
	.2byte _0222ACBA - _0222AC6C - 2 @ case 24
	.2byte _0222ACB8 - _0222AC6C - 2 @ case 25
	.2byte _0222ACBA - _0222AC6C - 2 @ case 26
	.2byte _0222ACB8 - _0222AC6C - 2 @ case 27
	.2byte _0222ACD0 - _0222AC6C - 2 @ case 28
	.2byte _0222ACD0 - _0222AC6C - 2 @ case 29
_0222ACA8:
	movs r5, #3
	b _0222ACD6
_0222ACAC:
	movs r4, #1
_0222ACAE:
	movs r5, #6
	b _0222ACD6
_0222ACB2:
	movs r4, #1
_0222ACB4:
	movs r5, #7
	b _0222ACD6
_0222ACB8:
	movs r4, #1
_0222ACBA:
	movs r5, #0xa
	b _0222ACD6
_0222ACBE:
	movs r5, #5
	b _0222ACD6
_0222ACC2:
	movs r4, #1
_0222ACC4:
	movs r5, #0xb
	b _0222ACD6
_0222ACC8:
	movs r5, #4
	b _0222ACD6
_0222ACCC:
	movs r5, #8
	b _0222ACD6
_0222ACD0:
	movs r5, #5
	b _0222ACD6
_0222ACD4:
	movs r5, #5
_0222ACD6:
	add r6, sp, #0x10
	ldrb r6, [r6, #0x10]
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	bl ov44_0222ABDC
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_0222AC54

	thumb_func_start ov44_0222ACE8
ov44_0222ACE8: @ 0x0222ACE8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r1, [r1, #0xc]
	adds r4, r0, #0
	ldrh r5, [r1, #2]
	lsls r5, r5, #0x13
	lsrs r5, r5, #0x10
	str r5, [sp]
	ldrh r5, [r1]
	lsls r5, r5, #0x13
	lsrs r5, r5, #0x10
	str r5, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	movs r2, #0x10
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r2, [sp, #0x28]
	ldr r1, [r1, #0x14]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x10
	movs r3, #0
	bl FUN_0201D9D8
	ldrb r0, [r4, #4]
	bl ov44_0222ADC4
	adds r2, r0, #0
	ldr r1, [sp, #0x2c]
	adds r0, r4, #0
	adds r1, r2, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0201EEB0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222ACE8

	thumb_func_start ov44_0222AD34
ov44_0222AD34: @ 0x0222AD34
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r5, [sp, #0x18]
	movs r4, #0
	cmp r5, #0x1d
	bhi _0222ADB4
	adds r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	add pc, r5
_0222AD4C: @ jump table
	.2byte _0222ADAC - _0222AD4C - 2 @ case 0
	.2byte _0222AD88 - _0222AD4C - 2 @ case 1
	.2byte _0222AD8E - _0222AD4C - 2 @ case 2
	.2byte _0222AD8E - _0222AD4C - 2 @ case 3
	.2byte _0222AD8E - _0222AD4C - 2 @ case 4
	.2byte _0222AD8E - _0222AD4C - 2 @ case 5
	.2byte _0222AD8E - _0222AD4C - 2 @ case 6
	.2byte _0222AD8E - _0222AD4C - 2 @ case 7
	.2byte _0222AD94 - _0222AD4C - 2 @ case 8
	.2byte _0222AD8C - _0222AD4C - 2 @ case 9
	.2byte _0222AD8C - _0222AD4C - 2 @ case 10
	.2byte _0222AD8C - _0222AD4C - 2 @ case 11
	.2byte _0222AD8C - _0222AD4C - 2 @ case 12
	.2byte _0222AD8C - _0222AD4C - 2 @ case 13
	.2byte _0222AD8C - _0222AD4C - 2 @ case 14
	.2byte _0222AD92 - _0222AD4C - 2 @ case 15
	.2byte _0222ADA8 - _0222AD4C - 2 @ case 16
	.2byte _0222ADB4 - _0222AD4C - 2 @ case 17
	.2byte _0222AD9E - _0222AD4C - 2 @ case 18
	.2byte _0222AD9E - _0222AD4C - 2 @ case 19
	.2byte _0222ADA4 - _0222AD4C - 2 @ case 20
	.2byte _0222ADA2 - _0222AD4C - 2 @ case 21
	.2byte _0222AD9A - _0222AD4C - 2 @ case 22
	.2byte _0222AD98 - _0222AD4C - 2 @ case 23
	.2byte _0222AD9A - _0222AD4C - 2 @ case 24
	.2byte _0222AD98 - _0222AD4C - 2 @ case 25
	.2byte _0222AD9A - _0222AD4C - 2 @ case 26
	.2byte _0222AD98 - _0222AD4C - 2 @ case 27
	.2byte _0222ADB0 - _0222AD4C - 2 @ case 28
	.2byte _0222ADB0 - _0222AD4C - 2 @ case 29
_0222AD88:
	movs r5, #3
	b _0222ADB6
_0222AD8C:
	movs r4, #1
_0222AD8E:
	movs r5, #6
	b _0222ADB6
_0222AD92:
	movs r4, #1
_0222AD94:
	movs r5, #7
	b _0222ADB6
_0222AD98:
	movs r4, #1
_0222AD9A:
	movs r5, #0xa
	b _0222ADB6
_0222AD9E:
	movs r5, #5
	b _0222ADB6
_0222ADA2:
	movs r4, #1
_0222ADA4:
	movs r5, #0xb
	b _0222ADB6
_0222ADA8:
	movs r5, #4
	b _0222ADB6
_0222ADAC:
	movs r5, #8
	b _0222ADB6
_0222ADB0:
	movs r5, #5
	b _0222ADB6
_0222ADB4:
	movs r5, #5
_0222ADB6:
	str r5, [sp]
	str r4, [sp, #4]
	bl ov44_0222ACE8
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222AD34

	thumb_func_start ov44_0222ADC4
ov44_0222ADC4: @ 0x0222ADC4
	cmp r0, #4
	bhs _0222ADCC
	movs r0, #8
	bx lr
_0222ADCC:
	movs r0, #0xd
	bx lr
	thumb_func_end ov44_0222ADC4

	thumb_func_start ov44_0222ADD0
ov44_0222ADD0: @ 0x0222ADD0
	push {lr}
	sub sp, #0xc
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	bl ov44_0222E030
	movs r0, #0x12
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov44_0222ADD0

	thumb_func_start ov44_0222ADF8
ov44_0222ADF8: @ 0x0222ADF8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5f
	lsls r0, r0, #2
	movs r1, #0x35
	bl FUN_02026354
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r1, #8
	adds r0, r1, #0
	movs r1, #0x35
	bl FUN_02026354
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	movs r1, #0x35
	bl FUN_02026354
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0xb4
	movs r1, #0x35
	bl FUN_02026354
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xd2
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222ADF8

	thumb_func_start ov44_0222AE44
ov44_0222AE44: @ 0x0222AE44
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x5f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222AE44

	thumb_func_start ov44_0222AE74
ov44_0222AE74: @ 0x0222AE74
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #7
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222AE74

	thumb_func_start ov44_0222AEC0
ov44_0222AEC0: @ 0x0222AEC0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r4, [r6, r0]
	movs r0, #1
	adds r5, r1, #0
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r2, #0
	str r2, [sp]
	movs r0, #0x35
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	movs r0, #0x35
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #4
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x35
	bl FUN_0200304C
	movs r1, #6
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x35
	bl FUN_0200304C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x35
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x35
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #6
	adds r2, r4, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x35
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #0xb
	adds r2, r4, #0
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x35
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #0xc
	adds r2, r4, #0
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x35
	str r0, [sp, #4]
	ldr r2, _0222AFE0 @ =0x000001E2
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0xa
	bl FUN_0200E644
	movs r0, #0
	str r0, [sp]
	movs r0, #0x35
	str r0, [sp, #4]
	ldr r2, _0222AFE4 @ =0x000001D9
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	movs r0, #0x35
	str r0, [sp, #4]
	ldr r2, _0222AFE4 @ =0x000001D9
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E3DC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0222AFE0: .4byte 0x000001E2
_0222AFE4: .4byte 0x000001D9
	thumb_func_end ov44_0222AEC0

	thumb_func_start ov44_0222AFE8
ov44_0222AFE8: @ 0x0222AFE8
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0222B028 @ =0x022353C0
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	ldr r1, _0222B02C @ =0x00200010
	movs r2, #0x10
	bl FUN_020215C0
	movs r0, #0x14
	movs r1, #0x35
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	ldr r1, _0222B02C @ =0x00200010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	add sp, #0x10
	pop {r4, pc}
	nop
_0222B028: .4byte 0x022353C0
_0222B02C: .4byte 0x00200010
	thumb_func_end ov44_0222AFE8

	thumb_func_start ov44_0222B030
ov44_0222B030: @ 0x0222B030
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x35
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	movs r1, #0x65
	lsls r1, r1, #2
	movs r0, #8
	adds r1, r6, r1
	movs r2, #0x35
	bl FUN_02009F40
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [r6, r1]
	adds r0, r1, #4
	movs r2, #1
	adds r0, r6, r0
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0xaf
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #2
_0222B07C:
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x35
	bl FUN_0200A090
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222B07C
	movs r0, #1
	movs r1, #0x35
	bl FUN_02013534
	movs r1, #0xb3
	lsls r1, r1, #2
	str r0, [r6, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_0222B030

	thumb_func_start ov44_0222B0A4
ov44_0222B0A4: @ 0x0222B0A4
	ldr r3, _0222B0AC @ =FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bx r3
	.align 2, 0
_0222B0AC: .4byte FUN_02022C60
	thumb_func_end ov44_0222B0A4

	thumb_func_start ov44_0222B0B0
ov44_0222B0B0: @ 0x0222B0B0
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222B0DA
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222B0DA:
	movs r0, #1
	str r0, [sp]
	movs r0, #0x16
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0222B15C @ =0x000001CA
	movs r1, #0x2f
	str r0, [sp, #0x10]
	subs r0, #0x6e
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #3
	movs r3, #5
	bl FUN_0201D40C
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	adds r2, #0x10
	ldr r2, [r4, r2]
	movs r1, #0x15
	bl FUN_0200BB6C
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r4, r1]
	adds r2, r0, #0
	movs r3, #0xb0
	bl FUN_020030A0
	movs r1, #0
	adds r3, r0, #0
	movs r2, #0x2f
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222B160 @ =0x000F0E00
	lsls r2, r2, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, r2
	lsrs r2, r2, #1
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200FC
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0222B15C: .4byte 0x000001CA
_0222B160: .4byte 0x000F0E00
	thumb_func_end ov44_0222B0B0

	thumb_func_start ov44_0222B164
ov44_0222B164: @ 0x0222B164
	push {r4, lr}
	adds r4, r0, #0
	bl ov44_0222F7BC
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222B184
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222B184:
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222B19C
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222B19C:
	movs r0, #0x33
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222B1B4
	movs r0, #0x33
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222B1B4:
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222B1CC
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222B1CC:
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222B1E4
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222B1E4:
	movs r0, #0x15
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B1F6
	movs r1, #0
	adds r2, r1, #0
	bl FUN_02001434
_0222B1F6:
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B20C
	bl FUN_02014950
	movs r0, #0x53
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0222B20C:
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222B224
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r4, r0
	bl FUN_0201D520
_0222B224:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222B164

	thumb_func_start ov44_0222B228
ov44_0222B228: @ 0x0222B228
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02039998
	cmp r0, #0
	beq _0222B2CA
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	bl FUN_020398C8
	str r0, [r5, #4]
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	cmp r0, #8
	beq _0222B278
	cmp r0, #0x12
	beq _0222B278
	cmp r0, #0x14
	beq _0222B278
	cmp r0, #0x16
	beq _0222B278
	cmp r0, #0x17
	beq _0222B278
	cmp r0, #0x18
	beq _0222B278
	cmp r0, #0x19
	beq _0222B278
	cmp r0, #0x1a
	beq _0222B278
	cmp r0, #0x1b
	beq _0222B278
	cmp r0, #0x13
	bne _0222B2A8
_0222B278:
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_020343E4
	bl FUN_02039378
	bl FUN_020398C8
	adds r1, r0, #0
	str r0, [r5, #4]
	adds r1, #0x22
	ldrb r1, [r1]
	adds r0, #0x21
	strb r1, [r0]
	movs r0, #0xd7
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x41
	subs r0, #0x14
	str r1, [r5, r0]
	b _0222B360
_0222B2A8:
	adds r0, r5, #0
	movs r1, #0x4d
	movs r2, #0
	bl ov44_0222F510
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #0x10
	bl FUN_02037AC0
	movs r0, #0xd2
	movs r1, #0x3d
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B360
_0222B2CA:
	ldr r1, _0222B364 @ =0x0000047D
	movs r0, #0xb
	movs r2, #1
	bl FUN_02004EC4
	adds r0, r5, #0
	bl ov44_0222B0B0
	ldr r0, [r5]
	bl FUN_0202C08C
	blx FUN_020A0100
	cmp r0, #0
	bne _0222B32E
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #1
	bl FUN_0201BB68
	adds r0, r5, #0
	movs r1, #0x12
	bl ov44_0222F66C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B368 @ =0x02235384
	movs r2, #0
	bl ov44_02231A28
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B360
_0222B32E:
	ldr r0, [r5]
	bl FUN_0202C08C
	blx FUN_020A0130
	cmp r0, #0
	bne _0222B34E
	adds r0, r5, #0
	movs r1, #0x14
	bl ov44_0222F66C
	movs r0, #0xd2
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B360
_0222B34E:
	adds r0, r5, #0
	movs r1, #0x11
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222B360:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B364: .4byte 0x0000047D
_0222B368: .4byte 0x02235384
	thumb_func_end ov44_0222B228

	thumb_func_start ov44_0222B36C
ov44_0222B36C: @ 0x0222B36C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222B3A0
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B3A4 @ =0x0223537C
	movs r2, #0
	bl ov44_02231A28
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222B3A0:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B3A4: .4byte 0x0223537C
	thumb_func_end ov44_0222B36C

	thumb_func_start ov44_0222B3A8
ov44_0222B3A8: @ 0x0222B3A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_020168F4
	cmp r0, #1
	bne _0222B408
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222B428 @ =0x000004A4
	bl FUN_020396FC
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r1, #0x17
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222B3EC
	bl GF_AssertFail
_0222B3EC:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0xe
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B424
_0222B408:
	cmp r0, #2
	bne _0222B420
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #0xd2
	movs r1, #0x22
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B424
_0222B420:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B424:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B428: .4byte 0x000004A4
	thumb_func_end ov44_0222B3A8

	thumb_func_start ov44_0222B42C
ov44_0222B42C: @ 0x0222B42C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222B48C @ =0x021D110C
	adds r4, r1, #0
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222B444
	bl FUN_02025358
	cmp r0, #1
	bne _0222B488
_0222B444:
	adds r0, r5, #0
	movs r1, #0x15
	bl ov44_0222F66C
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B490 @ =0x02235384
	movs r2, #1
	bl ov44_02231A28
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #4
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222B488:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B48C: .4byte 0x021D110C
_0222B490: .4byte 0x02235384
	thumb_func_end ov44_0222B42C

	thumb_func_start ov44_0222B494
ov44_0222B494: @ 0x0222B494
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_020168F4
	cmp r0, #1
	bne _0222B4EE
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
	adds r0, r5, #0
	movs r1, #0x16
	bl ov44_0222F66C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B524 @ =0x02235384
	movs r2, #1
	bl ov44_02231A28
	movs r1, #0x62
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #5
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B520
_0222B4EE:
	cmp r0, #2
	bne _0222B51C
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0xd2
	movs r1, #0x22
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B520
_0222B51C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B520:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B524: .4byte 0x02235384
	thumb_func_end ov44_0222B494

	thumb_func_start ov44_0222B528
ov44_0222B528: @ 0x0222B528
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_020168F4
	cmp r0, #1
	bne _0222B5EA
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, [r5]
	bl FUN_0202C03C
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x1f
	bl FUN_020272C8
	bl FUN_02031710
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0203107C
	bl FUN_02031188
	movs r0, #0xd2
	movs r1, #0xe
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222B648 @ =0x000004A4
	bl FUN_020396FC
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r1, #0x17
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222B5CE
	bl GF_AssertFail
_0222B5CE:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xda
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B644
_0222B5EA:
	cmp r0, #2
	bne _0222B640
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
	adds r0, r5, #0
	movs r1, #0x14
	bl ov44_0222F66C
	movs r0, #0xd2
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B644
_0222B640:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B644:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B648: .4byte 0x000004A4
	thumb_func_end ov44_0222B528

	thumb_func_start ov44_0222B64C
ov44_0222B64C: @ 0x0222B64C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_020168F4
	cmp r0, #1
	bne _0222B6EA
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0xd2
	movs r1, #0xe
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222B740 @ =0x000004A4
	bl FUN_020396FC
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r1, #0x17
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222B6CE
	bl GF_AssertFail
_0222B6CE:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xda
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B73C
_0222B6EA:
	cmp r0, #2
	bne _0222B738
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0xd2
	movs r1, #0x22
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222B73C
_0222B738:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B73C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B740: .4byte 0x000004A4
	thumb_func_end ov44_0222B64C

	thumb_func_start ov44_0222B744
ov44_0222B744: @ 0x0222B744
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #0xd2
	movs r1, #0xf
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222B744

	thumb_func_start ov44_0222B778
ov44_0222B778: @ 0x0222B778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	str r1, [sp]
	bl FUN_02028E9C
	str r0, [sp, #0x14]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0202A634
	str r0, [sp, #0x10]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02074904
	str r0, [sp, #0xc]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0202CA44
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	bl FUN_02074640
	movs r6, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0222B7F0
	adds r4, r6, #0
_0222B7C0:
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	ldr r1, [r5, #4]
	movs r2, #0
	strh r0, [r1, r4]
	adds r0, r7, #0
	movs r1, #6
	bl FUN_0206E540
	ldr r1, [r5, #4]
	adds r6, r6, #1
	adds r1, r1, r4
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	adds r4, r4, #2
	cmp r6, r0
	blt _0222B7C0
_0222B7F0:
	ldr r0, [sp, #0x14]
	bl FUN_0202907C
	ldr r1, [r5, #4]
	strb r0, [r1, #0x18]
	ldr r0, [sp, #0x14]
	bl FUN_02029088
	ldr r1, [r5, #4]
	strb r0, [r1, #0x19]
	ldr r0, [sp, #0x10]
	bl FUN_0202A55C
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1a]
	ldr r0, [r5, #4]
	movs r1, #0x1d
	strb r1, [r0, #0x1b]
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov44_0222F830
	ldr r0, [r5, #4]
	movs r1, #0
	strb r1, [r0, #0x1c]
	ldr r0, [sp, #0x14]
	bl FUN_0202903C
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1d]
	ldr r0, [sp, #0x14]
	bl FUN_02028F94
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1e]
	ldr r0, [sp, #8]
	bl FUN_0202CA8C
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1f]
	ldr r0, [sp, #8]
	bl FUN_0202CA90
	ldr r1, [r5, #4]
	adds r1, #0x20
	strb r0, [r1]
	ldr r0, [r5, #4]
	movs r1, #1
	adds r0, #0x21
	strb r1, [r0]
	ldr r0, [r5, #4]
	adds r0, #0x22
	strb r1, [r0]
	ldr r0, [r5, #4]
	movs r1, #0x24
	bl FUN_021E6D60
	ldr r0, [r5, #4]
	movs r1, #0x24
	adds r0, #0x24
	bl FUN_021E6CCC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222B778

	thumb_func_start ov44_0222B870
ov44_0222B870: @ 0x0222B870
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0
	adds r5, r0, #0
	adds r4, r6, #0
_0222B878:
	adds r1, r5, r4
	movs r0, #0
	strb r0, [r1, #0xc]
	ldr r0, _0222B8DC @ =0x000010BE
	ldrh r0, [r5, r0]
	cmp r0, r4
	ble _0222B8D2
	adds r0, r4, #0
	bl ov44_02231974
	cmp r0, #0
	beq _0222B8D2
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02231958
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov44_02229F00
	cmp r0, #0
	beq _0222B8BA
	cmp r0, #0x1c
	beq _0222B8BA
	ldrb r1, [r7, #0x1d]
	cmp r1, #0
	beq _0222B8BA
	adds r0, r5, r6
	adds r1, r4, #1
	strb r1, [r0, #0xc]
	adds r6, r6, #1
	b _0222B8D2
_0222B8BA:
	cmp r0, #0x1c
	bne _0222B8D2
	adds r0, r5, #0
	adds r1, r4, #1
	bl ov44_02230048
	cmp r0, #0
	beq _0222B8D2
	adds r0, r5, #0
	adds r1, r4, #1
	bl ov44_02230028
_0222B8D2:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _0222B878
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B8DC: .4byte 0x000010BE
	thumb_func_end ov44_0222B870

	thumb_func_start ov44_0222B8E0
ov44_0222B8E0: @ 0x0222B8E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp, #0xc]
	adds r6, r5, #0
_0222B8EC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02231958
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov44_02229F00
	ldr r1, [r6, #0x4c]
	str r0, [sp]
	cmp r0, r1
	bne _0222B916
	adds r0, r7, #0
	adds r0, #0x21
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xcc
	ldr r0, [r0]
	cmp r1, r0
	beq _0222B992
_0222B916:
	adds r0, r5, #0
	adds r1, r4, #1
	bl ov44_0222AAEC
	str r0, [sp, #4]
	cmp r0, #0
	beq _0222B992
	ldr r0, [r6, #0x4c]
	bl ov44_02229FDC
	str r0, [sp, #8]
	ldr r0, [sp]
	bl ov44_02229FDC
	ldr r1, [sp, #8]
	cmp r1, #1
	bne _0222B94C
	cmp r0, #0
	bne _0222B94C
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r1, [sp, #4]
	adds r0, r5, r0
	movs r2, #0
	bl ov44_02231FA8
	b _0222B964
_0222B94C:
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _0222B964
	cmp r0, #1
	bne _0222B964
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r1, [sp, #4]
	adds r0, r5, r0
	movs r2, #1
	bl ov44_02231FA8
_0222B964:
	ldr r0, [sp]
	movs r2, #7
	str r0, [r6, #0x4c]
	adds r0, r7, #0
	adds r0, #0x21
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0xcc
	str r1, [r0]
	ldrb r3, [r7, #0x1d]
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_0202C190
	ldrb r3, [r7, #0x1e]
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #8
	bl FUN_0202C190
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
_0222B992:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #0x20
	blt _0222B8EC
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222B8E0

	thumb_func_start ov44_0222B9A0
ov44_0222B9A0: @ 0x0222B9A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	bl FUN_020392D8
	adds r7, r0, #0
	ldr r6, [r7]
	ldr r1, [r7, #4]
	adds r0, r6, #0
	bl FUN_021E6A70
	adds r5, r0, #0
	cmp r5, #0xb
	beq _0222B9C0
	cmp r6, #0x19
	bne _0222B9D0
_0222B9C0:
	ldr r0, [r7, #4]
	cmp r0, #2
	beq _0222B9CA
	movs r7, #0xe
	b _0222B9CC
_0222B9CA:
	movs r7, #0xb
_0222B9CC:
	movs r5, #0xb
	b _0222B9E4
_0222B9D0:
	cmp r6, #0x1a
	bne _0222B9DA
	movs r7, #0xd
	movs r5, #0xc
	b _0222B9E4
_0222B9DA:
	cmp r5, #0
	blt _0222B9E2
	adds r7, r5, #0
	b _0222B9E4
_0222B9E2:
	movs r7, #0xb
_0222B9E4:
	adds r0, r4, #0
	bl ov44_0222F7BC
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	adds r2, r6, #0
	movs r3, #5
	bl FUN_0200BFCC
	movs r0, #0xd7
	movs r1, #0x1e
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov44_0222F66C
	cmp r5, #0xb
	bhi _0222BA5E
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222BA22: @ jump table
	.2byte _0222BA5E - _0222BA22 - 2 @ case 0
	.2byte _0222BA3A - _0222BA22 - 2 @ case 1
	.2byte _0222BA5E - _0222BA22 - 2 @ case 2
	.2byte _0222BA5E - _0222BA22 - 2 @ case 3
	.2byte _0222BA3A - _0222BA22 - 2 @ case 4
	.2byte _0222BA3A - _0222BA22 - 2 @ case 5
	.2byte _0222BA46 - _0222BA22 - 2 @ case 6
	.2byte _0222BA46 - _0222BA22 - 2 @ case 7
	.2byte _0222BA46 - _0222BA22 - 2 @ case 8
	.2byte _0222BA46 - _0222BA22 - 2 @ case 9
	.2byte _0222BA52 - _0222BA22 - 2 @ case 10
	.2byte _0222BA3A - _0222BA22 - 2 @ case 11
_0222BA3A:
	movs r0, #0xd2
	movs r1, #0xa
	lsls r0, r0, #2
	add sp, #8
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA46:
	movs r0, #0xd2
	movs r1, #0xa
	lsls r0, r0, #2
	add sp, #8
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA52:
	movs r0, #0xd2
	movs r1, #0xa
	lsls r0, r0, #2
	add sp, #8
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA5E:
	movs r0, #0xd2
	movs r1, #0x23
	lsls r0, r0, #2
	str r1, [r4, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_0222B9A0

	thumb_func_start ov44_0222BA6C
ov44_0222BA6C: @ 0x0222BA6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222BAB4 @ =0x021D110C
	adds r4, r1, #0
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222BA84
	bl FUN_02025358
	cmp r0, #1
	bne _0222BAB0
_0222BA84:
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222BAA8
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
_0222BAA8:
	movs r0, #0xd2
	movs r1, #8
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222BAB0:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222BAB4: .4byte 0x021D110C
	thumb_func_end ov44_0222BA6C

	thumb_func_start ov44_0222BAB8
ov44_0222BAB8: @ 0x0222BAB8
	movs r2, #0xd2
	movs r3, #9
	lsls r2, r2, #2
	str r3, [r0, r2]
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222BAB8

	thumb_func_start ov44_0222BAC4
ov44_0222BAC4: @ 0x0222BAC4
	movs r2, #0xd2
	movs r3, #0xb
	lsls r2, r2, #2
	str r3, [r0, r2]
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222BAC4

	thumb_func_start ov44_0222BAD0
ov44_0222BAD0: @ 0x0222BAD0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0222BAE8
	subs r1, r1, #1
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BAE8:
	ldr r0, _0222BB34 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222BAFA
	bl FUN_02025358
	cmp r0, #1
	bne _0222BB30
_0222BAFA:
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222BB1E
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
_0222BB1E:
	adds r0, r5, #0
	movs r1, #0x58
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0xb
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222BB30:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222BB34: .4byte 0x021D110C
	thumb_func_end ov44_0222BAD0

	thumb_func_start ov44_0222BB38
ov44_0222BB38: @ 0x0222BB38
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222BB92
	ldr r0, _0222BB98 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222BB76
	movs r2, #0x57
	movs r0, #0x35
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222BB9C @ =0x0223538C
	adds r2, #0x7d
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x61
	b _0222BB86
_0222BB76:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222BBA0 @ =0x02235374
	movs r2, #0
	bl ov44_02231A28
	movs r1, #0x62
_0222BB86:
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222BB92:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222BB98: .4byte 0x04000304
_0222BB9C: .4byte 0x0223538C
_0222BBA0: .4byte 0x02235374
	thumb_func_end ov44_0222BB38

	thumb_func_start ov44_0222BBA4
ov44_0222BBA4: @ 0x0222BBA4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222BC74 @ =0x04000304
	adds r4, r1, #0
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222BC0A
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222BBD0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BBD0:
	cmp r0, #0
	bne _0222BBEA
	bl FUN_02039330
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	movs r0, #0xd2
	movs r1, #0xd
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222BC6A
_0222BBEA:
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039330
	bl FUN_020343E4
	movs r0, #0xd3
	movs r1, #8
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x22
	subs r0, r0, #4
	str r1, [r5, r0]
	b _0222BC6A
_0222BC0A:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	bne _0222BC38
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	bl FUN_02039330
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	movs r0, #0xd2
	movs r1, #0xd
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222BC6A
_0222BC38:
	cmp r0, #2
	bne _0222BC66
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039330
	bl FUN_020343E4
	movs r0, #0xd3
	movs r1, #8
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x22
	subs r0, r0, #4
	str r1, [r5, r0]
	b _0222BC6A
_0222BC66:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BC6A:
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222BC74: .4byte 0x04000304
	thumb_func_end ov44_0222BBA4

	thumb_func_start ov44_0222BC78
ov44_0222BC78: @ 0x0222BC78
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02034DB8
	cmp r0, #0
	beq _0222BC88
	b _0222BE22
_0222BC88:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #1
	bne _0222BCCE
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231B4C
	movs r2, #0
	ldr r0, _0222BE28 @ =0x00000A88
	adds r3, r5, #0
	adds r1, r2, #0
_0222BCB8:
	adds r2, r2, #1
	str r1, [r3, r0]
	adds r3, r3, #4
	cmp r2, #0x21
	blt _0222BCB8
	movs r0, #0x35
	bl FUN_0200B2E0
	movs r0, #0x35
	bl FUN_0200B2E8
_0222BCCE:
	adds r0, r5, #0
	bl ov44_0222F98C
	cmp r0, #1
	bne _0222BCDE
	adds r0, r5, #0
	bl ov44_0222FA28
_0222BCDE:
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222BD02
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
_0222BD02:
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222BD1A
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
_0222BD1A:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #0x58
	movs r1, #0x35
	bl FUN_02007688
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0222AEC0
	adds r0, r6, #0
	bl FUN_0200770C
	ldr r0, _0222BE2C @ =0x00000D6C
	movs r1, #1
	str r1, [r5, r0]
	ldr r0, _0222BE30 @ =0x021D116C
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r1, #0
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201BC8C
	movs r0, #0x57
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r5, r0]
	movs r2, #3
	adds r3, r1, #0
	bl FUN_0201BC8C
	ldr r0, _0222BE34 @ =0x000010BC
	movs r1, #1
	strh r1, [r5, r0]
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222BDAC
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x15
	lsls r0, r0, #4
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02001434
	movs r0, #0x15
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	subs r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02014950
	movs r0, #0x53
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222BDAC:
	adds r0, r5, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x20
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0x2c
	movs r1, #0
	movs r2, #0x20
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	movs r2, #0x80
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0xcc
	movs r1, #0
	movs r2, #0x80
	blx FUN_020D4994
	adds r0, r5, #0
	bl ov44_0222B0B0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222BE38 @ =0x000004A4
	bl FUN_020396FC
	str r0, [r5, #4]
	adds r0, r5, #0
	movs r1, #0x17
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222BE08
	bl GF_AssertFail
_0222BE08:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0xe
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222BE22:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0222BE28: .4byte 0x00000A88
_0222BE2C: .4byte 0x00000D6C
_0222BE30: .4byte 0x021D116C
_0222BE34: .4byte 0x000010BC
_0222BE38: .4byte 0x000004A4
	thumb_func_end ov44_0222BC78

	thumb_func_start ov44_0222BE3C
ov44_0222BE3C: @ 0x0222BE3C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222BE58
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BE58:
	bl FUN_021E7314
	cmp r0, #0
	beq _0222BE92
	movs r0, #0xd2
	movs r1, #0x45
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #0x1e
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222BE80
	bl GF_AssertFail
_0222BE80:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
_0222BE92:
	bl FUN_02039274
	cmp r0, #0
	beq _0222BEC6
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222BEAC
	movs r1, #0x10
	subs r0, #0x20
	str r1, [r5, r0]
	b _0222BEDC
_0222BEAC:
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222B778
	adds r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
	b _0222BEDC
_0222BEC6:
	bl FUN_020393C8
	cmp r0, #0
	bne _0222BED6
	bl FUN_020390C4
	cmp r0, #3
	bne _0222BEDC
_0222BED6:
	adds r0, r5, #0
	bl ov44_0222B9A0
_0222BEDC:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222BE3C

	thumb_func_start ov44_0222BEE0
ov44_0222BEE0: @ 0x0222BEE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222BEFC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BEFC:
	bl FUN_021E7314
	cmp r0, #0
	beq _0222BF1C
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02027550
	movs r0, #0xd2
	movs r1, #0x47
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BF1C:
	bl FUN_02039274
	cmp r0, #0
	beq _0222BF50
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222BF36
	movs r1, #0x10
	subs r0, #0x20
	str r1, [r5, r0]
	b _0222BF66
_0222BF36:
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222B778
	adds r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
	b _0222BF66
_0222BF50:
	bl FUN_020393C8
	cmp r0, #0
	bne _0222BF60
	bl FUN_020390C4
	cmp r0, #3
	bne _0222BF66
_0222BF60:
	adds r0, r5, #0
	bl ov44_0222B9A0
_0222BF66:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222BEE0

	thumb_func_start ov44_0222BF6C
ov44_0222BF6C: @ 0x0222BF6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_021E7314
	cmp r0, #0
	beq _0222BFA0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02027564
	cmp r0, #0
	beq _0222BF9C
	cmp r0, #1
	beq _0222BF9C
	bl FUN_021E7328
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020274D8
	b _0222BFA0
_0222BF9C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BFA0:
	bl FUN_02039274
	cmp r0, #0
	beq _0222BFD4
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222BFBA
	movs r1, #0x10
	subs r0, #0x20
	str r1, [r5, r0]
	b _0222BFEA
_0222BFBA:
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222B778
	adds r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
	b _0222BFEA
_0222BFD4:
	bl FUN_020393C8
	cmp r0, #0
	bne _0222BFE4
	bl FUN_020390C4
	cmp r0, #3
	bne _0222BFEA
_0222BFE4:
	adds r0, r5, #0
	bl ov44_0222B9A0
_0222BFEA:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222BF6C

	thumb_func_start ov44_0222BFF0
ov44_0222BFF0: @ 0x0222BFF0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0222C008
	subs r1, r1, #1
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222C008:
	bl FUN_020392A0
	cmp r0, #0
	beq _0222C01C
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
	b _0222C05C
_0222C01C:
	bl FUN_020393C8
	cmp r0, #0
	bne _0222C02C
	bl FUN_020390C4
	cmp r0, #3
	bne _0222C034
_0222C02C:
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222C05C
_0222C034:
	bl FUN_020390C4
	cmp r0, #4
	bge _0222C04E
	bl FUN_02039264
	cmp r0, #0
	bne _0222C04E
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #0
	bne _0222C05C
_0222C04E:
	bl FUN_02039358
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
_0222C05C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222BFF0

	thumb_func_start ov44_0222C060
ov44_0222C060: @ 0x0222C060
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #0x13
	bl ov44_0222F66C
	movs r0, #0xd2
	movs r1, #0x11
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0
	adds r0, #0x20
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C060

	thumb_func_start ov44_0222C084
ov44_0222C084: @ 0x0222C084
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222C11C @ =0x021D110C
	adds r4, r1, #0
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222C09C
	bl FUN_02025358
	cmp r0, #1
	bne _0222C118
_0222C09C:
	movs r1, #0xd5
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _0222C0BA
	adds r0, r1, #0
	movs r2, #0xa
	subs r0, #8
	str r2, [r5, r0]
	movs r0, #0x22
	subs r1, #0xc
	str r0, [r5, r1]
	bl FUN_02039330
	b _0222C118
_0222C0BA:
	ldr r0, [r5]
	bl FUN_0202C2F8
	cmp r0, #0
	bne _0222C0DE
	adds r0, r5, #0
	movs r1, #0x1a
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x3b
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #1
	adds r0, #0x14
	str r1, [r5, r0]
	b _0222C118
_0222C0DE:
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222B778
	adds r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0x48
	adds r0, r5, r1
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222C118
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
_0222C118:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222C11C: .4byte 0x021D110C
	thumb_func_end ov44_0222C084

	thumb_func_start ov44_0222C120
ov44_0222C120: @ 0x0222C120
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02028E9C
	movs r1, #0x35
	adds r6, r0, #0
	bl FUN_02028F68
	adds r4, r0, #0
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	bne _0222C152
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_0222C152:
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _0222C16C
	ldr r0, _0222C280 @ =0x00050600
	b _0222C170
_0222C16C:
	movs r0, #0xc1
	lsls r0, r0, #0xa
_0222C170:
	str r0, [sp, #0x10]
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r3, #0x20
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	add r1, sp, #0x10
	adds r4, r0, #0
	bl ov44_0223120C
	adds r6, r0, #0
	cmp r4, #1
	bne _0222C204
	bl FUN_021E6EBC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222C1C8
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	adds r1, r6, #0
	bl FUN_0200BB6C
	b _0222C214
_0222C1C8:
	bl FUN_021E6EBC
	adds r1, r0, #0
	ldr r0, [r5]
	movs r2, #8
	bl FUN_0202C090
	cmp r0, #0
	bne _0222C1E0
	ldr r0, _0222C280 @ =0x00050600
	str r0, [sp, #0x10]
	b _0222C1EA
_0222C1E0:
	cmp r0, #1
	bne _0222C1EA
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #0x10]
_0222C1EA:
	bl FUN_021E6EBC
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_0202C254
	adds r1, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020269A0
	b _0222C214
_0222C204:
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	adds r1, r6, #0
	bl FUN_0200BB6C
_0222C214:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	movs r2, #0x2e
	str r0, [sp, #8]
	lsls r2, r2, #4
	adds r0, r5, r2
	str r1, [sp, #0xc]
	lsrs r2, r2, #1
	ldr r2, [r5, r2]
	movs r3, #0x66
	bl FUN_020200FC
	movs r2, #1
	str r2, [sp]
	movs r0, #0x57
	ldr r1, _0222C284 @ =0x00000B0C
	str r4, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r3, #2
	bl ov44_0222AC54
	ldr r0, [r5, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222C256
	movs r0, #8
	b _0222C258
_0222C256:
	movs r0, #1
_0222C258:
	movs r2, #1
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r1, _0222C284 @ =0x00000B0C
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r3, #0x1a
	bl ov44_0222ABDC
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222C280: .4byte 0x00050600
_0222C284: .4byte 0x00000B0C
	thumb_func_end ov44_0222C120

	thumb_func_start ov44_0222C288
ov44_0222C288: @ 0x0222C288
	push {r3, lr}
	cmp r2, #0
	bne _0222C294
	ldr r0, _0222C298 @ =0x000005DC
	bl FUN_0200604C
_0222C294:
	pop {r3, pc}
	nop
_0222C298: .4byte 0x000005DC
	thumb_func_end ov44_0222C288

	thumb_func_start ov44_0222C29C
ov44_0222C29C: @ 0x0222C29C
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222C2BA
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222C2BA:
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222C2DE
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222C2DE:
	movs r3, #1
	str r3, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0222C350 @ =0x00000192
	movs r1, #0x2e
	str r0, [sp, #0x10]
	subs r0, #0x36
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #3
	bl FUN_0201D40C
	movs r2, #1
	movs r1, #0x2f
	lsls r1, r1, #4
	str r2, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0222C354 @ =0x000001A1
	adds r1, r4, r1
	str r0, [sp, #0x10]
	subs r0, #0x45
	ldr r0, [r4, r0]
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r2, _0222C358 @ =0x000001D9
	adds r0, r4, r0
	movs r1, #0
	movs r3, #0xb
	bl FUN_0200E580
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0222C350: .4byte 0x00000192
_0222C354: .4byte 0x000001A1
_0222C358: .4byte 0x000001D9
	thumb_func_end ov44_0222C29C

	thumb_func_start ov44_0222C35C
ov44_0222C35C: @ 0x0222C35C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0222C372
	add sp, #0xc
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0222C372:
	bl FUN_020393C8
	cmp r0, #0
	bne _0222C388
	bl FUN_020392A0
	cmp r0, #0
	bne _0222C388
	add sp, #0xc
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0222C388:
	ldr r0, _0222C4D8 @ =0x02078D25
	bl FUN_021E5CBC
	ldr r0, _0222C4DC @ =0x00000D6C
	movs r1, #0
	str r1, [r5, r0]
	movs r0, #0x58
	movs r1, #0x35
	bl FUN_02007688
	adds r6, r0, #0
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r1, _0222C4E0 @ =0x00000B0C
	ldr r0, [r5, r0]
	adds r1, r5, r1
	adds r2, r6, #0
	movs r3, #0x35
	bl ov44_0222AB24
	adds r0, r5, #0
	bl ov44_0222F8F0
	adds r0, r5, #0
	bl ov44_0222F7BC
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222C402
	movs r0, #0x31
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x15
	lsls r0, r0, #4
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02001434
	movs r0, #0x15
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r5, r0]
	subs r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02014950
	movs r0, #0x53
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222C402:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #0
	bne _0222C456
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	bne _0222C41C
	movs r4, #0
	b _0222C41E
_0222C41C:
	movs r4, #0x61
_0222C41E:
	ldr r0, [r5]
	bl FUN_0202C318
	ldr r1, _0222C4E4 @ =0x000010BE
	movs r3, #0x57
	strh r0, [r5, r1]
	str r4, [sp]
	ldrh r0, [r5, r1]
	lsls r3, r3, #2
	movs r1, #0x35
	str r0, [sp, #4]
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r3, [r5, r3]
	adds r0, r5, r0
	adds r2, r6, #0
	bl ov44_02231A7C
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	bl ov44_02231D9C
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222AA94
_0222C456:
	adds r0, r5, #0
	bl ov44_0222F98C
	cmp r0, #0
	bne _0222C46A
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x35
	bl ov44_0222F9A0
_0222C46A:
	adds r0, r5, #0
	movs r1, #0x35
	bl ov44_02230060
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	bl ov44_0222B870
	adds r0, r5, #0
	bl ov44_0222C29C
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039B58
	movs r1, #0
	movs r0, #0x37
	mvns r1, r1
	lsls r0, r0, #4
	str r1, [r5, r0]
	adds r0, r6, #0
	bl FUN_0200770C
	ldr r0, _0222C4E8 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_020398D4
	adds r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0222C4D8: .4byte 0x02078D25
_0222C4DC: .4byte 0x00000D6C
_0222C4E0: .4byte 0x00000B0C
_0222C4E4: .4byte 0x000010BE
_0222C4E8: .4byte 0x021D116C
	thumb_func_end ov44_0222C35C

	thumb_func_start ov44_0222C4EC
ov44_0222C4EC: @ 0x0222C4EC
	push {r3, lr}
	bl FUN_020390C4
	cmp r0, #1
	bne _0222C4FA
	movs r0, #1
	pop {r3, pc}
_0222C4FA:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_0222C4EC

	thumb_func_start ov44_0222C500
ov44_0222C500: @ 0x0222C500
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_021E709C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222C51E
	ldr r0, [r4, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl FUN_021E70B8
	movs r0, #1
	pop {r4, pc}
_0222C51E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222C500

	thumb_func_start ov44_0222C524
ov44_0222C524: @ 0x0222C524
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl ov44_0222B870
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r5, #0
	str r0, [sp, #4]
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0xc
	adds r1, #0x2c
	movs r2, #0x20
	blx FUN_020E5BB0
	cmp r0, #0
	bne _0222C54A
	b _0222C64C
_0222C54A:
	movs r4, #0
_0222C54C:
	adds r7, r5, r4
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	movs r2, #0
	adds r0, r2, #0
_0222C558:
	adds r3, r5, r0
	ldrb r3, [r3, #0xc]
	cmp r3, r1
	bne _0222C564
	movs r2, #1
	b _0222C56A
_0222C564:
	adds r0, r0, #1
	cmp r0, #0x20
	blt _0222C558
_0222C56A:
	cmp r2, #0
	bne _0222C5AE
	cmp r1, #0
	beq _0222C5AE
	adds r0, r5, #0
	bl ov44_0222AAEC
	adds r6, r0, #0
	beq _0222C5AE
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov44_02231E94
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0222AAC0
	adds r1, r5, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov44_02230028
	adds r1, r5, r4
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #0x35
	bl ov44_0222F970
	movs r0, #1
	str r0, [sp]
_0222C5AE:
	ldrb r0, [r7, #0xc]
	movs r1, #0
	adds r2, r1, #0
_0222C5B4:
	adds r3, r5, r2
	adds r3, #0x2c
	ldrb r3, [r3]
	cmp r0, r3
	bne _0222C5C2
	movs r1, #1
	b _0222C5C8
_0222C5C2:
	adds r2, r2, #1
	cmp r2, #0x20
	blt _0222C5B4
_0222C5C8:
	cmp r1, #0
	bne _0222C618
	ldrb r1, [r7, #0xc]
	cmp r1, #0
	beq _0222C618
	adds r0, r5, #0
	subs r1, r1, #1
	bl ov44_02231958
	adds r1, r0, #0
	adds r6, r5, r4
	movs r0, #0xe3
	lsls r0, r0, #2
	ldrb r1, [r1, #0x1d]
	ldrb r2, [r6, #0xc]
	adds r0, r5, r0
	bl ov44_02231E08
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _0222C60A
	ldrb r1, [r7, #0xc]
	adds r0, r5, #0
	movs r2, #2
	bl ov44_0222FFF4
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	bl ov44_0222AA94
	movs r0, #1
	str r0, [sp, #4]
	b _0222C618
_0222C60A:
	ldrb r1, [r6, #0xc]
	adds r0, r5, #0
	movs r2, #1
	bl ov44_0222FFF4
	movs r0, #0
	strb r0, [r6, #0xc]
_0222C618:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _0222C54C
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x2c
	adds r1, #0xc
	movs r2, #0x20
	blx FUN_020E5AD8
	adds r0, r5, #0
	bl ov44_02230080
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0222C640
	ldr r0, _0222C654 @ =0x0000064E
	bl FUN_0200604C
	b _0222C64C
_0222C640:
	ldr r0, [sp]
	cmp r0, #1
	bne _0222C64C
	ldr r0, _0222C654 @ =0x0000064E
	bl FUN_0200604C
_0222C64C:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C654: .4byte 0x0000064E
	thumb_func_end ov44_0222C524

	thumb_func_start ov44_0222C658
ov44_0222C658: @ 0x0222C658
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222B8E0
	cmp r0, #0
	ble _0222C66E
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02230060
_0222C66E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C658

	thumb_func_start ov44_0222C670
ov44_0222C670: @ 0x0222C670
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222C524
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222C658
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C670

	thumb_func_start ov44_0222C684
ov44_0222C684: @ 0x0222C684
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r7, #0
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0222C698
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C698:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222C6AA
	adds r0, r4, #0
	bl ov44_0222B9A0
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C6AA:
	bl FUN_020390C4
	cmp r0, #4
	bne _0222C6E0
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov44_0222F780
	adds r0, r4, #0
	movs r1, #0x12
	adds r2, r7, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039358
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C6E0:
	adds r0, r4, #0
	movs r1, #0x35
	bl ov44_0222C670
	adds r0, r4, #0
	bl ov44_0222FBA0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02232008
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231D98
	cmp r0, #0
	bne _0222C79A
	bl FUN_021E709C
	subs r1, r7, #1
	cmp r0, r1
	bne _0222C75C
	ldr r0, _0222C9A0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	lsls r0, r0, #0xa
	tst r0, r1
	beq _0222C75C
	adds r0, r4, #0
	bl ov44_0222F8C0
	cmp r0, #0
	beq _0222C732
	adds r0, r4, #0
	movs r1, #0x5a
	adds r2, r7, #0
	bl ov44_0222F510
	b _0222C73C
_0222C732:
	adds r0, r4, #0
	movs r1, #0x5b
	adds r2, r7, #0
	bl ov44_0222F510
_0222C73C:
	ldr r0, _0222C9A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov44_0222C120
	movs r0, #0xd2
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x35
	bl ov44_0222F950
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C75C:
	adds r0, r4, #0
	movs r1, #0x35
	bl ov44_0222FA80
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov44_0222AAEC
	adds r1, r0, #0
	cmp r6, #0
	beq _0222C790
	cmp r1, #0
	beq _0222C784
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231D48
	b _0222C79A
_0222C784:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231D8C
	b _0222C79A
_0222C790:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231D8C
_0222C79A:
	adds r0, r4, #0
	bl ov44_0222C4EC
	cmp r0, #0
	beq _0222C7C4
	movs r0, #0x37
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C7C4
	ldr r0, _0222C9A8 @ =0x00000623
	bl FUN_0200604C
	movs r0, #0xd2
	movs r1, #0x30
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C7C4:
	movs r0, #0x37
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _0222C80E
	bl FUN_021E709C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222C80E
	bl FUN_021E709C
	movs r1, #0x37
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov44_0222F780
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0
	bl ov44_0222F510
	ldr r0, [r4, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl FUN_021E70B8
	movs r0, #0xd1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0222C854
_0222C80E:
	movs r0, #0x37
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C854
	bl FUN_021E709C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222C854
	movs r0, #0
	bl FUN_021E70B8
	movs r1, #0x37
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov44_0222F780
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	bl FUN_02039358
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C854:
	bl FUN_021E7080
	cmp r0, #1
	bne _0222C86E
	bl FUN_021E709C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222C86E
	movs r0, #0
	bl FUN_021E70B8
_0222C86E:
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl ov44_02229F00
	movs r1, #0x37
	lsls r1, r1, #4
	ldr r2, [r4, r1]
	movs r1, #0
	mvns r1, r1
	adds r6, r0, #0
	cmp r2, r1
	bne _0222C8C8
	ldr r1, _0222C9A0 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #2
	tst r1, r2
	beq _0222C8B2
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C8B2
	ldr r0, _0222C9A4 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0xd2
	movs r1, #0x27
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x35
	bl ov44_0222F950
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C8B2:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231BB4
	adds r7, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02232018
_0222C8C8:
	cmp r7, #3
	bhi _0222C998
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222C8D8: @ jump table
	.2byte _0222C8E0 - _0222C8D8 - 2 @ case 0
	.2byte _0222C8E4 - _0222C8D8 - 2 @ case 1
	.2byte _0222C970 - _0222C8D8 - 2 @ case 2
	.2byte _0222C922 - _0222C8D8 - 2 @ case 3
_0222C8E0:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C8E4:
	ldr r0, _0222C9A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r6, #0
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C8FE
	movs r0, #0xd2
	movs r1, #0x27
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0222C916
_0222C8FE:
	movs r0, #0xd3
	movs r1, #8
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0x39
	subs r0, r0, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	bl ov44_0222F510
_0222C916:
	adds r0, r4, #0
	movs r1, #0x35
	bl ov44_0222F950
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C922:
	ldr r0, _0222C9A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r6, #0
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C946
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231FCC
	movs r0, #0xd2
	movs r1, #0x27
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0222C964
_0222C946:
	cmp r6, #0x10
	bne _0222C964
	bl FUN_020392A0
	cmp r0, #1
	bne _0222C964
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231FCC
	movs r0, #0xd2
	movs r1, #0x24
	lsls r0, r0, #2
	str r1, [r4, r0]
_0222C964:
	adds r0, r4, #0
	movs r1, #0x35
	bl ov44_0222F950
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C970:
	ldr r0, _0222C9A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r6, #0
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C984
	movs r1, #0x27
	b _0222C986
_0222C984:
	movs r1, #0x2a
_0222C986:
	movs r0, #0xd2
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0x35
	bl ov44_0222F950
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C998:
	bl GF_AssertFail
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C9A0: .4byte 0x021D110C
_0222C9A4: .4byte 0x000005DD
_0222C9A8: .4byte 0x00000623
	thumb_func_end ov44_0222C684

	thumb_func_start ov44_0222C9AC
ov44_0222C9AC: @ 0x0222C9AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222C9CA
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_022319EC
	b _0222C9F0
_0222C9CA:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222C9F0
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_022319EC
	adds r0, r5, #0
	bl ov44_0222F7BC
_0222C9F0:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C9AC

	thumb_func_start ov44_0222C9F4
ov44_0222C9F4: @ 0x0222C9F4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r1, _0222CB30 @ =0x00000382
	adds r5, r0, #0
	ldrh r1, [r5, r1]
	subs r1, r1, #1
	bl ov44_02231958
	adds r1, r0, #0
	adds r0, #0x21
	ldrb r4, [r0]
	adds r0, r5, #0
	bl ov44_02229F00
	adds r6, r0, #0
	movs r0, #0xd
	lsls r0, r0, #6
	ldr r1, [r5, r0]
	subs r1, r1, #1
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	cmp r1, #0
	bge _0222CA2A
	movs r1, #0x46
	adds r0, #8
	str r1, [r5, r0]
	b _0222CB2C
_0222CA2A:
	bl FUN_020390C4
	cmp r0, #5
	bne _0222CA52
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CA52:
	bl FUN_020390C4
	cmp r0, #3
	bne _0222CA7A
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CA7A:
	bl FUN_020390C4
	cmp r0, #4
	beq _0222CA8A
	bl FUN_02039264
	cmp r0, #0
	beq _0222CAAA
_0222CA8A:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x13
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CAAA:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222CABA
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222CB2C
_0222CABA:
	cmp r4, #0
	bne _0222CADE
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CADE:
	cmp r6, #0x10
	beq _0222CB02
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CB02:
	bl FUN_020390C4
	cmp r0, #1
	bne _0222CB2C
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #1
	bl ov44_0222F818
	movs r1, #0xd2
	movs r0, #0x18
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r1, #0x3a
	ldrh r1, [r5, r1]
	ldr r0, [r5]
	subs r1, r1, #1
	bl FUN_0202C4B0
_0222CB2C:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222CB30: .4byte 0x00000382
	thumb_func_end ov44_0222C9F4

	thumb_func_start ov44_0222CB34
ov44_0222CB34: @ 0x0222CB34
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0
	bl ov44_0222F510
	adds r0, r5, #0
	movs r1, #1
	bl ov44_0222F818
	movs r0, #0xd2
	movs r1, #0x17
	lsls r0, r0, #2
	str r1, [r5, r0]
	bl FUN_021E6EBC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222CB78
	bl FUN_021E6EBC
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_0202C4B0
_0222CB78:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222CB34

	thumb_func_start ov44_0222CB7C
ov44_0222CB7C: @ 0x0222CB7C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020393C8
	cmp r0, #0
	beq _0222CB94
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CB94:
	bl FUN_021E6EBC
	cmp r0, #0
	bge _0222CBB2
	adds r0, r5, #0
	movs r1, #0x13
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CBB2:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_02231958
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_02229F00
	cmp r0, #0x10
	beq _0222CBF0
	cmp r0, #1
	beq _0222CBF0
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CBF0:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222CC2C
	ldr r0, _0222CC30 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222CC14
	bl FUN_02025358
	cmp r0, #1
	bne _0222CC24
_0222CC14:
	adds r0, r5, #0
	bl ov44_0222F7BC
	movs r0, #0xd2
	movs r1, #0x18
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CC2C
_0222CC24:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222CC34
_0222CC2C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222CC30: .4byte 0x021D110C
	thumb_func_end ov44_0222CB7C

	thumb_func_start ov44_0222CC34
ov44_0222CC34: @ 0x0222CC34
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	bl FUN_021E6EBC
	cmp r0, #0
	bge _0222CC5C
	adds r0, r5, #0
	movs r1, #0x13
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	add sp, #0xc
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_0222CC5C:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_02231958
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_02229F00
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x35
	bl ov44_0222C670
	adds r0, r5, #0
	bl ov44_0222FBA0
	bl FUN_020390C4
	cmp r0, #5
	bne _0222CCA8
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CCA8:
	bl FUN_020390C4
	cmp r0, #3
	bne _0222CCD0
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CCD0:
	bl FUN_020390C4
	cmp r0, #4
	beq _0222CCE0
	bl FUN_02039264
	cmp r0, #0
	beq _0222CD00
_0222CCE0:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x13
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CD00:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222CD10
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222CD9C
_0222CD10:
	cmp r4, #0x10
	beq _0222CD38
	cmp r4, #1
	beq _0222CD38
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CD38:
	ldr r0, _0222CDA4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222CD4A
	bl FUN_02025358
	cmp r0, #1
	bne _0222CD5E
_0222CD4A:
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x19
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CD5E:
	bl FUN_021E7078
	cmp r0, #0
	ldr r1, _0222CDA8 @ =0x00000B0C
	beq _0222CD82
	movs r2, #1
	str r2, [sp]
	movs r3, #2
	str r3, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, r1
	bl ov44_0222ABDC
	b _0222CD9C
_0222CD82:
	movs r2, #1
	str r2, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r3, #2
	bl ov44_0222ABDC
_0222CD9C:
	adds r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0222CDA4: .4byte 0x021D110C
_0222CDA8: .4byte 0x00000B0C
	thumb_func_end ov44_0222CC34

	thumb_func_start ov44_0222CDAC
ov44_0222CDAC: @ 0x0222CDAC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020393C8
	cmp r0, #0
	beq _0222CDC4
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CDC4:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222CE30
	bl FUN_021E6EBC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222CDEE
	bl FUN_021E6EBC
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_0202C4B0
_0222CDEE:
	ldr r0, _0222CE34 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222CE14
	movs r2, #0x57
	movs r0, #0x35
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222CE38 @ =0x0223538C
	adds r2, #0x7d
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x61
	b _0222CE24
_0222CE14:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222CE3C @ =0x02235374
	movs r2, #0
	bl ov44_02231A14
	movs r1, #0x62
_0222CE24:
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0x1a
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222CE30:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222CE34: .4byte 0x04000304
_0222CE38: .4byte 0x0223538C
_0222CE3C: .4byte 0x02235374
	thumb_func_end ov44_0222CDAC

	thumb_func_start ov44_0222CE40
ov44_0222CE40: @ 0x0222CE40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222CFDC @ =0x04000304
	adds r4, r1, #0
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222CF0C
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222CEC8
	bl FUN_020390C4
	cmp r0, #4
	bge _0222CE82
	bl FUN_02039264
	cmp r0, #0
	bne _0222CE82
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #0
	bne _0222CEB6
_0222CE82:
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FFC
	movs r0, #0
	movs r1, #0x37
	mvns r0, r0
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	movs r2, #0x14
	subs r0, #0x14
	str r2, [r5, r0]
	movs r0, #0x41
	subs r1, #0x28
	str r0, [r5, r1]
	b _0222CEC4
_0222CEB6:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222CEC4
	adds r0, r5, #0
	bl ov44_0222B9A0
_0222CEC4:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CEC8:
	cmp r0, #0
	bne _0222CF02
	bl FUN_020393C8
	cmp r0, #0
	bne _0222CEFA
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_020393B4
	movs r0, #0
	movs r1, #0x37
	mvns r0, r0
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	movs r2, #0x14
	subs r0, #0x14
	str r2, [r5, r0]
	movs r0, #0x41
	subs r1, #0x28
	str r0, [r5, r1]
	b _0222CFD0
_0222CEFA:
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222CFD0
_0222CF02:
	movs r0, #0xd2
	movs r1, #0x18
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CFD0
_0222CF0C:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	bne _0222CF5A
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	bl FUN_020393C8
	cmp r0, #0
	bne _0222CF52
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_020393B4
	movs r0, #0
	movs r1, #0x37
	mvns r0, r0
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	movs r2, #0x14
	subs r0, #0x14
	str r2, [r5, r0]
	movs r0, #0x41
	subs r1, #0x28
	str r0, [r5, r1]
	b _0222CFD0
_0222CF52:
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222CFD0
_0222CF5A:
	cmp r0, #2
	bne _0222CF72
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #0xd2
	movs r1, #0x18
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222CFD0
_0222CF72:
	bl FUN_020390C4
	cmp r0, #4
	bge _0222CF8C
	bl FUN_02039264
	cmp r0, #0
	bne _0222CF8C
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #0
	bne _0222CFBE
_0222CF8C:
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	movs r0, #0
	movs r1, #0x37
	mvns r0, r0
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	movs r2, #0x14
	subs r0, #0x14
	str r2, [r5, r0]
	movs r0, #0x41
	subs r1, #0x28
	str r0, [r5, r1]
	b _0222CFCC
_0222CFBE:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222CFCC
	adds r0, r5, #0
	bl ov44_0222B9A0
_0222CFCC:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CFD0:
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222CFDC: .4byte 0x04000304
	thumb_func_end ov44_0222CE40

	thumb_func_start ov44_0222CFE0
ov44_0222CFE0: @ 0x0222CFE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020393C8
	cmp r0, #0
	beq _0222CFF8
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CFF8:
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	cmp r0, #0x10
	beq _0222D00C
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
_0222D00C:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222D02A
	movs r0, #0xd7
	movs r1, #0x1e
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D02A:
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	subs r1, r1, #1
	str r1, [r5, r0]
	ldr r1, _0222D0A0 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #3
	tst r1, r2
	bne _0222D04C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222D04C
	bl FUN_02025358
	cmp r0, #1
	bne _0222D09A
_0222D04C:
	adds r0, r5, #0
	bl ov44_0222F7BC
	bl FUN_02039358
	bl FUN_02039B58
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #0
	bne _0222D078
	movs r0, #0xd7
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x41
	subs r0, #0x14
	str r1, [r5, r0]
	b _0222D09A
_0222D078:
	adds r0, r5, #0
	bl ov44_0222F8F0
	adds r0, r5, #0
	bl ov44_0222C120
	movs r1, #0
	movs r0, #0x37
	mvns r1, r1
	lsls r0, r0, #4
	str r1, [r5, r0]
	movs r1, #0x13
	subs r0, #0x28
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_022319EC
_0222D09A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222D0A0: .4byte 0x021D110C
	thumb_func_end ov44_0222CFE0

	thumb_func_start ov44_0222D0A4
ov44_0222D0A4: @ 0x0222D0A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020393C8
	cmp r0, #0
	beq _0222D0BC
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D0BC:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222D0D2
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D0D2:
	ldr r0, _0222D108 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222D0E4
	bl FUN_02025358
	cmp r0, #1
	bne _0222D104
_0222D0E4:
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039358
	movs r0, #0xd7
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x41
	subs r0, #0x14
	str r1, [r5, r0]
_0222D104:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D108: .4byte 0x021D110C
	thumb_func_end ov44_0222D0A4

	thumb_func_start ov44_0222D10C
ov44_0222D10C: @ 0x0222D10C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020393C8
	cmp r0, #0
	beq _0222D124
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D124:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222D142
	movs r0, #0xd7
	movs r1, #0x1e
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D142:
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	subs r1, r1, #1
	str r1, [r5, r0]
	ldr r1, _0222D1B8 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #3
	tst r1, r2
	bne _0222D164
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222D164
	bl FUN_02025358
	cmp r0, #1
	bne _0222D1B2
_0222D164:
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039B58
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #0
	bne _0222D190
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
	b _0222D1B2
_0222D190:
	adds r0, r5, #0
	bl ov44_0222F8F0
	adds r0, r5, #0
	bl ov44_0222C120
	movs r1, #0
	movs r0, #0x37
	mvns r1, r1
	lsls r0, r0, #4
	str r1, [r5, r0]
	movs r1, #0x13
	subs r0, #0x28
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_022319EC
_0222D1B2:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222D1B8: .4byte 0x021D110C
	thumb_func_end ov44_0222D10C

	thumb_func_start ov44_0222D1BC
ov44_0222D1BC: @ 0x0222D1BC
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222D1BC

	thumb_func_start ov44_0222D1C0
ov44_0222D1C0: @ 0x0222D1C0
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222D1C0

	thumb_func_start ov44_0222D1C4
ov44_0222D1C4: @ 0x0222D1C4
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222D1C4

	thumb_func_start ov44_0222D1C8
ov44_0222D1C8: @ 0x0222D1C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0222D1E0
	subs r1, r1, #1
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D1E0:
	ldr r0, _0222D210 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222D1F2
	bl FUN_02025358
	cmp r0, #1
	bne _0222D20A
_0222D1F2:
	adds r0, r5, #0
	movs r1, #0x1a
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x3b
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #1
	adds r0, #0x14
	str r1, [r5, r0]
_0222D20A:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222D210: .4byte 0x021D110C
	thumb_func_end ov44_0222D1C8

	thumb_func_start ov44_0222D214
ov44_0222D214: @ 0x0222D214
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r4, r1, #0
	bl ov44_02232018
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x28
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222D214

	thumb_func_start ov44_0222D23C
ov44_0222D23C: @ 0x0222D23C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r4, r1, #0
	bl ov44_02232018
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222D2A0
	ldr r0, _0222D2A4 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222D284
	movs r2, #0x57
	movs r0, #0x35
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222D2A8 @ =0x0223538C
	adds r2, #0x7d
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x61
	b _0222D294
_0222D284:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222D2AC @ =0x02235374
	movs r2, #0
	bl ov44_02231A14
	movs r1, #0x62
_0222D294:
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0x29
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222D2A0:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D2A4: .4byte 0x04000304
_0222D2A8: .4byte 0x0223538C
_0222D2AC: .4byte 0x02235374
	thumb_func_end ov44_0222D23C

	thumb_func_start ov44_0222D2B0
ov44_0222D2B0: @ 0x0222D2B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0222D3D8 @ =0x04000304
	adds r6, r1, #0
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222D34A
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x35
	bl FUN_02001FDC
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02232018
	movs r0, #0x37
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _0222D316
	bl FUN_021E709C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222D316
	ldr r0, [r4, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl FUN_021E70B8
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0222D314
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x35
	bl FUN_02001FFC
_0222D314:
	movs r5, #1
_0222D316:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0222D322
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_0222D322:
	cmp r5, #0
	bne _0222D33A
	adds r0, r4, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039B58
	adds r0, r4, #0
	bl ov44_022319EC
	b _0222D3CA
_0222D33A:
	adds r0, r4, #0
	bl ov44_022319EC
	adds r0, r4, #0
	movs r1, #1
	bl ov44_022319BC
	b _0222D3CA
_0222D34A:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020168F4
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02232018
	movs r0, #0x37
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _0222D386
	bl FUN_021E709C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222D386
	ldr r0, [r4, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl FUN_021E70B8
	movs r5, #2
_0222D386:
	cmp r5, #1
	bne _0222D3A8
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	adds r0, r4, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039B58
	adds r0, r4, #0
	bl ov44_022319EC
	b _0222D3CA
_0222D3A8:
	cmp r5, #2
	bne _0222D3C6
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	adds r0, r4, #0
	bl ov44_022319EC
	adds r0, r4, #0
	movs r1, #1
	bl ov44_022319BC
	b _0222D3CA
_0222D3C6:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_0222D3CA:
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0222D3D8: .4byte 0x04000304
	thumb_func_end ov44_0222D2B0

	thumb_func_start ov44_0222D3DC
ov44_0222D3DC: @ 0x0222D3DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r3, _0222D584 @ =0x022366FC
	add r2, sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x14]
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r5, #0
	movs r7, #3
	ldr r4, _0222D588 @ =0x0223671C
	bl ov44_02229EF8
	cmp r0, #1
	bne _0222D424
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	adds r7, r7, #1
	ldr r2, _0222D58C @ =0x02236660
	adds r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	adds r1, r1, #1
	strh r1, [r0, #0x12]
	subs r0, r7, #1
	lsls r1, r0, #3
	ldm r2, {r0, r2}
	adds r3, r4, r1
	str r0, [r4, r1]
	str r2, [r3, #4]
_0222D424:
	adds r0, r5, #0
	bl ov44_02229EE0
	cmp r0, #1
	bne _0222D44E
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	adds r7, r7, #1
	ldr r2, _0222D58C @ =0x02236660
	adds r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	adds r1, r1, #1
	strh r1, [r0, #0x12]
	subs r0, r7, #1
	lsls r1, r0, #3
	ldr r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	adds r3, r4, r1
	str r0, [r4, r1]
	str r2, [r3, #4]
_0222D44E:
	adds r0, r5, #0
	bl ov44_02229EFC
	cmp r0, #1
	bne _0222D478
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	adds r7, r7, #1
	ldr r2, _0222D58C @ =0x02236660
	adds r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	adds r1, r1, #1
	strh r1, [r0, #0x12]
	subs r0, r7, #1
	lsls r1, r0, #3
	ldr r0, [r2, #8]
	ldr r2, [r2, #0xc]
	adds r3, r4, r1
	str r0, [r4, r1]
	str r2, [r3, #4]
_0222D478:
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	ldr r2, _0222D58C @ =0x02236660
	adds r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	adds r1, r1, #1
	strh r1, [r0, #0x12]
	ldr r0, [r2, #0x10]
	lsls r1, r7, #3
	str r0, [r4, r1]
	adds r3, r4, r1
	ldr r2, [r2, #0x14]
	adds r0, r7, #1
	movs r1, #0x35
	str r2, [r3, #4]
	bl FUN_02014918
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r7, #1
	movs r6, #0
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _0222D4CA
_0222D4AC:
	movs r0, #0x55
	movs r1, #0x5a
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl FUN_02014960
	ldr r0, [sp, #0x18]
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r0
	blt _0222D4AC
_0222D4CA:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222D4EE
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
_0222D4EE:
	adds r0, r7, #1
	movs r1, #3
	str r1, [sp]
	movs r1, #0xf
	lsls r0, r0, #1
	str r1, [sp, #4]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	movs r1, #0x3b
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0x57
	lsls r0, r0, #2
	movs r1, #0x32
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r2, #2
	movs r3, #0x10
	bl FUN_0201D40C
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r2, _0222D590 @ =0x000001D9
	adds r0, r5, r0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0x32
	lsls r2, r2, #4
	str r0, [sp, #0x1c]
	adds r0, r5, r2
	str r0, [sp, #0x28]
	adds r2, #0x54
	ldrh r2, [r5, r2]
	add r0, sp, #0x1c
	movs r1, #0
	movs r3, #0x35
	bl FUN_020011DC
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r5, #0
	movs r1, #8
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02232018
	movs r0, #0xd2
	movs r1, #0x25
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0222D584: .4byte 0x022366FC
_0222D588: .4byte 0x0223671C
_0222D58C: .4byte 0x02236660
_0222D590: .4byte 0x000001D9
	thumb_func_end ov44_0222D3DC

	thumb_func_start ov44_0222D594
ov44_0222D594: @ 0x0222D594
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	bl ov44_0222A168
	str r0, [sp]
	adds r0, r5, #0
	bl ov44_0222E02C
	adds r6, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02232018
	bl FUN_020393C8
	cmp r0, #0
	beq _0222D5FC
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x56
	lsls r0, r0, #2
	movs r2, #0xdd
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r5, r2
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D5FC:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222D65A
	adds r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222D656
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	subs r0, #0x28
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x56
	lsls r0, r0, #2
	movs r2, #0xdd
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r5, r2
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	adds r0, r5, #0
	bl ov44_0222F7BC
_0222D656:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D65A:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02001338
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222D674
	movs r4, #1
	mvns r4, r4
_0222D674:
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0222D686
	adds r0, r0, #1
	cmp r4, r0
	bne _0222D69C
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D686:
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_0222F7BC
	ldr r0, _0222D820 @ =0x000005DD
	bl FUN_0200604C
	b _0222D7E8
_0222D69C:
	ldr r0, _0222D820 @ =0x000005DD
	bl FUN_0200604C
	cmp r4, #0x13
	bne _0222D6DE
	cmp r6, #0
	beq _0222D6DE
	cmp r6, #1
	bne _0222D6BA
	adds r0, r5, #0
	movs r1, #0x68
	movs r2, #0
	bl ov44_0222F510
	b _0222D6D4
_0222D6BA:
	cmp r6, #3
	bne _0222D6CA
	adds r0, r5, #0
	movs r1, #0x6a
	movs r2, #0
	bl ov44_0222F510
	b _0222D6D4
_0222D6CA:
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl ov44_0222F510
_0222D6D4:
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222D782
_0222D6DE:
	cmp r4, #0xf
	bne _0222D6FC
	ldr r0, [sp]
	cmp r0, #2
	bge _0222D6FC
	adds r0, r5, #0
	movs r1, #0x59
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222D782
_0222D6FC:
	cmp r4, #1
	bne _0222D71A
	ldr r0, [sp]
	cmp r0, #2
	bge _0222D71A
	adds r0, r5, #0
	movs r1, #0x67
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222D782
_0222D71A:
	cmp r4, #0
	beq _0222D726
	cmp r4, #1
	beq _0222D726
	cmp r4, #0x1d
	bne _0222D76C
_0222D726:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x56
	lsls r0, r0, #2
	movs r2, #0xdd
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r5, r2
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222D8B0
	movs r0, #0xd2
	movs r1, #0x26
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D76C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222F818
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_0222F7BC
_0222D782:
	adds r0, r4, #0
	movs r6, #1
	bl ov44_02229F44
	cmp r0, #0
	beq _0222D7C4
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0x13
	bne _0222D7C4
	movs r1, #0x44
	str r1, [r5, r0]
	adds r0, r5, #0
	subs r1, #0x45
	adds r2, r4, #0
	bl ov44_0223197C
	adds r0, r4, #0
	bl ov44_0222A1B4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222F818
	adds r0, r4, #0
	bl ov44_02229F74
	movs r1, #0xd3
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r6, #0
	b _0222D7D6
_0222D7C4:
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	adds r2, r4, #0
	bl ov44_0223197C
	adds r0, r4, #0
	bl ov44_0222A1B4
_0222D7D6:
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0x13
	bne _0222D7E8
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_022319BC
_0222D7E8:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x56
	lsls r0, r0, #2
	movs r2, #0xdd
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r5, r2
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D820: .4byte 0x000005DD
	thumb_func_end ov44_0222D594

	thumb_func_start ov44_0222D824
ov44_0222D824: @ 0x0222D824
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020393C8
	cmp r0, #0
	beq _0222D840
	adds r0, r5, #0
	bl ov44_0222B9A0
	add sp, #0xc
	adds r0, r4, #0
	pop {r4, r5, pc}
_0222D840:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02232018
	adds r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222D85C
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222D85C:
	bl FUN_020392A0
	cmp r0, #0
	beq _0222D8AA
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	movs r0, #0
	bl FUN_020378E4
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xe1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02034354
	bl FUN_02034434
	bl FUN_0203769C
	bl FUN_0203476C
	movs r4, #2
_0222D8AA:
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov44_0222D824

	thumb_func_start ov44_0222D8B0
ov44_0222D8B0: @ 0x0222D8B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	cmp r1, #0
	beq _0222D8C4
	cmp r1, #1
	beq _0222D8E6
	cmp r1, #0x1d
	beq _0222D908
	b _0222D928
_0222D8C4:
	movs r0, #0xdf
	movs r1, #1
	lsls r0, r0, #2
	ldr r3, _0222DA4C @ =0x02235508
	strh r1, [r5, r0]
	add r2, sp, #0x14
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r4, _0222DA50 @ =0x022366BC
	movs r7, #4
	stm r2!, {r0, r1}
	b _0222D928
_0222D8E6:
	movs r0, #0xdf
	movs r1, #0
	lsls r0, r0, #2
	ldr r3, _0222DA4C @ =0x02235508
	strh r1, [r5, r0]
	add r2, sp, #0x14
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r4, _0222DA54 @ =0x022366DC
	movs r7, #4
	stm r2!, {r0, r1}
	b _0222D928
_0222D908:
	ldr r3, _0222DA58 @ =0x02235528
	add r2, sp, #0x14
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0xdf
	ldr r4, _0222DA5C @ =0x0223669C
	movs r1, #2
	lsls r0, r0, #2
	movs r7, #4
	strh r1, [r5, r0]
_0222D928:
	adds r0, r7, #0
	movs r1, #0x35
	bl FUN_02014918
	movs r1, #0x55
	lsls r1, r1, #2
	movs r6, #0
	str r0, [r5, r1]
	cmp r7, #0
	ble _0222D9A6
_0222D93C:
	ldr r2, [r4]
	cmp r2, #0x47
	beq _0222D956
	movs r0, #0x55
	movs r1, #0x5a
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r4, #4]
	bl FUN_02014960
	b _0222D99E
_0222D956:
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r6, #0
	bl FUN_0200C74C
	movs r0, #0x5a
	movs r2, #0x17
	lsls r0, r0, #2
	lsls r2, r2, #4
	ldr r0, [r5, r0]
	ldr r1, [r4]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r0, #0x59
	movs r1, #0x5e
	movs r2, #0x17
	lsls r0, r0, #2
	lsls r1, r1, #2
	lsls r2, r2, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0x55
	movs r1, #0x5e
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4, #4]
	bl FUN_02014980
_0222D99E:
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r7
	blt _0222D93C
_0222D9A6:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222D9CA
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
_0222D9CA:
	movs r1, #9
	str r1, [sp]
	movs r1, #0xf
	lsls r0, r7, #1
	str r1, [sp, #4]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	movs r1, #0x3b
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0x57
	lsls r0, r0, #2
	movs r1, #0x32
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r2, #2
	movs r3, #0x10
	bl FUN_0201D40C
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r2, _0222DA60 @ =0x000001D9
	adds r0, r5, r0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #0x32
	lsls r3, r3, #4
	str r0, [sp, #0x14]
	adds r0, r5, r3
	adds r2, r3, #0
	str r0, [sp, #0x20]
	adds r2, #0x5c
	ldrh r2, [r5, r2]
	adds r3, #0x56
	add r0, sp, #0x14
	lsls r2, r2, #1
	adds r2, r5, r2
	ldrh r2, [r2, r3]
	movs r1, #0
	movs r3, #0x35
	bl FUN_020011DC
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	movs r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222DA4C: .4byte 0x02235508
_0222DA50: .4byte 0x022366BC
_0222DA54: .4byte 0x022366DC
_0222DA58: .4byte 0x02235528
_0222DA5C: .4byte 0x0223669C
_0222DA60: .4byte 0x000001D9
	thumb_func_end ov44_0222D8B0

	thumb_func_start ov44_0222DA64
ov44_0222DA64: @ 0x0222DA64
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r6, r1, #0
	bl ov44_02232018
	bl FUN_020393C8
	cmp r0, #0
	beq _0222DAC4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r3, _0222DC10 @ =0x00000376
	movs r0, #0x56
	adds r2, r5, r3
	adds r3, r3, #6
	ldrh r3, [r5, r3]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r3, r3, #1
	movs r1, #0
	adds r2, r2, r3
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DAC4:
	adds r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222DB16
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	subs r0, #0x28
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r3, _0222DC10 @ =0x00000376
	movs r0, #0x56
	adds r2, r5, r3
	adds r3, r3, #6
	ldrh r3, [r5, r3]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r3, r3, #1
	movs r1, #0
	adds r2, r2, r3
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DB16:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222DB2C
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DB2C:
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02001338
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0222DB4A
	adds r0, r0, #1
	cmp r4, r0
	bne _0222DB5A
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DB4A:
	ldr r0, _0222DC14 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0xd2
	movs r1, #0x24
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222DB76
_0222DB5A:
	ldr r0, _0222DC14 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222F818
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_0222F7BC
_0222DB76:
	movs r0, #0xd2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0x13
	bne _0222DBD2
	adds r0, r4, #0
	movs r7, #1
	bl ov44_02229F44
	cmp r0, #0
	beq _0222DBBC
	movs r0, #0xd2
	movs r1, #0x44
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	subs r1, #0x45
	adds r2, r4, #0
	bl ov44_0223197C
	adds r0, r4, #0
	bl ov44_0222A1B4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222F818
	adds r0, r4, #0
	bl ov44_02229F74
	movs r1, #0xd3
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r7, #0
	b _0222DBCA
_0222DBBC:
	adds r0, r5, #0
	subs r1, r7, #2
	adds r2, r4, #0
	bl ov44_0223197C
	bl FUN_02039B7C
_0222DBCA:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov44_022319BC
_0222DBD2:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r3, _0222DC10 @ =0x00000376
	movs r0, #0x56
	adds r2, r5, r3
	adds r3, r3, #6
	ldrh r3, [r5, r3]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r3, r3, #1
	movs r1, #0
	adds r2, r2, r3
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DC10: .4byte 0x00000376
_0222DC14: .4byte 0x000005DD
	thumb_func_end ov44_0222DA64

	thumb_func_start ov44_0222DC18
ov44_0222DC18: @ 0x0222DC18
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r6, r1, #0
	bl ov44_02231C70
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl ov44_0222AAEC
	adds r7, r0, #0
	bne _0222DC3A
	bl GF_AssertFail
_0222DC3A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov44_0222AAEC
	str r0, [sp]
	cmp r0, #0
	bne _0222DC66
	adds r0, r4, #0
	subs r1, r5, #1
	bl ov44_0222F780
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DC66:
	adds r0, r7, #0
	bl ov44_02231F04
	adds r2, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r1, [sp]
	adds r0, r4, r0
	bl ov44_02231F14
	subs r7, r5, #1
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov44_02231958
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov44_02229F00
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0222DD60 @ =0x0000037E
	adds r1, r7, #0
	strh r5, [r4, r0]
	adds r0, r4, #0
	bl ov44_0222F780
	cmp r5, #0xf
	bne _0222DCA4
	movs r1, #3
	b _0222DD4C
_0222DCA4:
	cmp r5, #0x13
	bne _0222DCAC
	movs r1, #4
	b _0222DD4C
_0222DCAC:
	cmp r5, #0x12
	bne _0222DCB4
	movs r1, #0x53
	b _0222DD4C
_0222DCB4:
	cmp r5, #0x15
	bne _0222DCBC
	movs r1, #5
	b _0222DD4C
_0222DCBC:
	cmp r5, #0x14
	bne _0222DCC4
	movs r1, #0x54
	b _0222DD4C
_0222DCC4:
	cmp r5, #0x17
	bne _0222DCDA
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	movs r2, #0
	bl FUN_0200C74C
	movs r1, #6
	b _0222DD4C
_0222DCDA:
	cmp r5, #0x16
	bne _0222DCE2
	movs r1, #0x55
	b _0222DD4C
_0222DCE2:
	cmp r5, #0x19
	bne _0222DCF8
	movs r0, #0x59
	lsls r0, r0, #2
	movs r1, #1
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl FUN_0200C74C
	movs r1, #6
	b _0222DD4C
_0222DCF8:
	cmp r5, #0x18
	bne _0222DD00
	movs r1, #0x55
	b _0222DD4C
_0222DD00:
	cmp r5, #0x1b
	bne _0222DD16
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	movs r2, #2
	bl FUN_0200C74C
	movs r1, #6
	b _0222DD4C
_0222DD16:
	cmp r5, #0x1a
	bne _0222DD1E
	movs r1, #0x55
	b _0222DD4C
_0222DD1E:
	adds r0, r5, #0
	bl ov44_02229FB4
	cmp r0, #0
	beq _0222DD2C
	movs r1, #2
	b _0222DD4C
_0222DD2C:
	cmp r5, #8
	bne _0222DD34
	movs r1, #0x52
	b _0222DD4C
_0222DD34:
	adds r0, r5, #0
	bl ov44_0222A020
	cmp r0, #0
	beq _0222DD42
	movs r1, #0x51
	b _0222DD4C
_0222DD42:
	cmp r5, #1
	bne _0222DD4A
	movs r1, #0x56
	b _0222DD4C
_0222DD4A:
	movs r1, #7
_0222DD4C:
	adds r0, r4, #0
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x2b
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222DD60: .4byte 0x0000037E
	thumb_func_end ov44_0222DC18

	thumb_func_start ov44_0222DD64
ov44_0222DD64: @ 0x0222DD64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r5, r0, #0
	str r1, [sp, #0x14]
	bl FUN_020393C8
	cmp r0, #0
	beq _0222DD80
	adds r0, r5, #0
	bl ov44_0222B9A0
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DD80:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231C70
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222AAEC
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222DDC0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov44_02231F88
	adds r0, r5, #0
	bl ov44_0222F7BC
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DDC0:
	cmp r6, #0
	bne _0222DDFE
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov44_02231F88
	movs r0, #0x56
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02001434
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DDFE:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_02231958
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_02229F00
	ldr r1, _0222DFDC @ =0x0000037E
	ldrh r2, [r5, r1]
	cmp r2, r0
	beq _0222DE40
	adds r1, #0xe
	adds r0, r5, r1
	adds r1, r6, #0
	bl ov44_02231F88
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DE40:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222DE58
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DE58:
	ldr r3, _0222DFE0 @ =0x022354C8
	movs r0, #2
	str r0, [sp, #0x1c]
	add r2, sp, #0x24
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231C70
	adds r1, r0, #0
	adds r0, r5, #0
	subs r1, r1, #1
	bl ov44_02231958
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_02229F00
	adds r6, #0x21
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xe
	ldrb r1, [r6]
	lsls r0, r0, #6
	strh r1, [r5, r0]
	ldr r0, [r5, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	movs r0, #2
	movs r1, #0x35
	bl FUN_02014918
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	ldr r6, _0222DFE4 @ =0x022353A0
	str r0, [sp, #0x20]
	add r7, sp, #0x24
_0222DEC0:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0222DF3A
	adds r0, r4, #0
	bl ov44_0222A048
	cmp r0, #0
	bne _0222DEDC
	cmp r4, #0
	beq _0222DEDC
	cmp r4, #0x1c
	beq _0222DEDC
	cmp r4, #0x1d
	blo _0222DEF0
_0222DEDC:
	ldrh r0, [r7, #0x12]
	subs r0, r0, #1
	strh r0, [r7, #0x12]
	ldrh r0, [r7, #0x10]
	subs r0, r0, #1
	strh r0, [r7, #0x10]
	ldr r0, [sp, #0x1c]
	subs r0, r0, #1
	str r0, [sp, #0x1c]
	b _0222DF4E
_0222DEF0:
	cmp r4, #0x10
	bne _0222DF24
	ldr r0, [sp, #0x18]
	cmp r0, #2
	bne _0222DF10
	movs r0, #0x55
	movs r1, #0x5a
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r6, #4]
	movs r2, #0x24
	bl FUN_02014960
	b _0222DF4E
_0222DF10:
	ldrh r0, [r7, #0x12]
	subs r0, r0, #1
	strh r0, [r7, #0x12]
	ldrh r0, [r7, #0x10]
	subs r0, r0, #1
	strh r0, [r7, #0x10]
	ldr r0, [sp, #0x1c]
	subs r0, r0, #1
	str r0, [sp, #0x1c]
	b _0222DF4E
_0222DF24:
	movs r0, #0x55
	movs r1, #0x5a
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r6]
	ldr r3, [r6, #4]
	bl FUN_02014960
	b _0222DF4E
_0222DF3A:
	movs r0, #0x55
	movs r1, #0x5a
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r6]
	ldr r3, [r6, #4]
	bl FUN_02014960
_0222DF4E:
	ldr r0, [sp, #0x20]
	adds r6, #8
	adds r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #2
	blo _0222DEC0
	ldr r0, [sp, #0x1c]
	movs r1, #3
	subs r0, r1, r0
	lsls r0, r0, #1
	adds r0, #0xb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	movs r1, #0x32
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x3b
	str r0, [sp, #0x10]
	movs r0, #0x57
	lsls r0, r0, #2
	lsls r1, r1, #4
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r2, #2
	movs r3, #0x10
	bl FUN_0201D40C
	movs r0, #0x32
	lsls r0, r0, #4
	ldr r2, _0222DFE8 @ =0x000001D9
	adds r0, r5, r0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	str r0, [sp, #0x24]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	adds r2, r1, #0
	movs r3, #0x35
	bl FUN_020011DC
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	movs r0, #0xd2
	movs r1, #0x2c
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222DFDC: .4byte 0x0000037E
_0222DFE0: .4byte 0x022354C8
_0222DFE4: .4byte 0x022353A0
_0222DFE8: .4byte 0x000001D9
	thumb_func_end ov44_0222DD64

	thumb_func_start ov44_0222DFEC
ov44_0222DFEC: @ 0x0222DFEC
	push {r4, r5}
	ldr r2, _0222E028 @ =0x000001EF
	movs r5, #0
	adds r1, r2, #0
	adds r1, #0x29
	adds r3, r2, #0
_0222DFF8:
	ldrh r4, [r0]
	cmp r4, r3
	bne _0222E004
	movs r0, #0
	pop {r4, r5}
	bx lr
_0222E004:
	cmp r4, r2
	bls _0222E00E
	movs r0, #0
	pop {r4, r5}
	bx lr
_0222E00E:
	ldrh r4, [r0, #0xc]
	cmp r4, r1
	bls _0222E01A
	movs r0, #0
	pop {r4, r5}
	bx lr
_0222E01A:
	adds r5, r5, #1
	adds r0, r0, #2
	cmp r5, #6
	blt _0222DFF8
	movs r0, #1
	pop {r4, r5}
	bx lr
	.align 2, 0
_0222E028: .4byte 0x000001EF
	thumb_func_end ov44_0222DFEC

	thumb_func_start ov44_0222E02C
ov44_0222E02C: @ 0x0222E02C
	movs r0, #3
	bx lr
	thumb_func_end ov44_0222E02C

	thumb_func_start ov44_0222E030
ov44_0222E030: @ 0x0222E030
	push {r4, lr}
	movs r0, #0
	bl FUN_021E70B8
	bl ov44_0222E074
	cmp r0, #0
	bne _0222E056
	bl FUN_02014804
	movs r0, #0
	bl FUN_02004AD8
	ldr r1, _0222E070 @ =0x00000427
	movs r0, #0xb
	movs r2, #1
	bl FUN_02004EC4
	pop {r4, pc}
_0222E056:
	bl FUN_02004A90
	adds r4, r0, #0
	bl FUN_02004A90
	bl FUN_02005498
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_020054AC
	pop {r4, pc}
	nop
_0222E070: .4byte 0x00000427
	thumb_func_end ov44_0222E030

	thumb_func_start ov44_0222E074
ov44_0222E074: @ 0x0222E074
	push {r3, lr}
	bl FUN_02004A90
	ldr r1, _0222E08C @ =0x00000427
	cmp r0, r1
	beq _0222E086
	beq _0222E086
	movs r0, #0
	pop {r3, pc}
_0222E086:
	movs r0, #1
	pop {r3, pc}
	nop
_0222E08C: .4byte 0x00000427
	thumb_func_end ov44_0222E074

	thumb_func_start ov44_0222E090
ov44_0222E090: @ 0x0222E090
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	str r1, [sp]
	movs r6, #0
	bl FUN_02001338
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222E0B2
	subs r7, r6, #2
_0222E0B2:
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231C70
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222AAEC
	str r0, [sp, #0x14]
	bl FUN_020393C8
	cmp r0, #0
	beq _0222E11C
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x56
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0222E110
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r1, [sp, #0x14]
	adds r0, r5, r0
	bl ov44_02231F88
_0222E110:
	adds r0, r5, #0
	bl ov44_0222B9A0
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0222E11C:
	movs r0, #1
	mvns r0, r0
	cmp r7, r0
	beq _0222E1B0
	adds r0, r0, #1
	cmp r7, r0
	bne _0222E1C0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222E15C
	movs r0, #0x56
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02001434
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E15C:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_02231958
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_02229F00
	ldr r1, _0222E450 @ =0x0000037E
	adds r6, #0x21
	ldrh r1, [r5, r1]
	ldrb r6, [r6]
	cmp r1, r0
	bne _0222E18C
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E1AA
	movs r0, #0xe
	lsls r0, r0, #6
	ldrh r0, [r5, r0]
	cmp r0, r6
	beq _0222E1AA
_0222E18C:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E1AA:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0222E1B0:
	ldr r0, _0222E454 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E3FE
_0222E1C0:
	ldr r0, _0222E454 @ =0x000005DD
	bl FUN_0200604C
	cmp r7, #1
	beq _0222E1CC
	b _0222E3F2
_0222E1CC:
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, #0x3a
	strh r4, [r5, r0]
	cmp r4, #0
	bne _0222E1DE
	b _0222E3FE
_0222E1DE:
	adds r0, r5, #0
	bl ov44_0222A168
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov44_0222E02C
	str r0, [sp, #0xc]
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_02231958
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	adds r0, r5, #0
	bl ov44_02229F00
	ldr r1, [sp, #8]
	adds r7, r0, #0
	adds r1, #0x21
	ldrb r1, [r1]
	str r1, [sp, #4]
	ldr r1, _0222E450 @ =0x0000037E
	ldrh r1, [r5, r1]
	cmp r1, r7
	bne _0222E226
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E244
	movs r0, #0xe
	lsls r0, r0, #6
	ldrh r1, [r5, r0]
	ldr r0, [sp, #4]
	cmp r1, r0
	beq _0222E244
_0222E226:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E244:
	ldr r0, [sp, #8]
	bl ov44_0222DFEC
	cmp r0, #0
	bne _0222E26C
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E26C:
	adds r0, r7, #0
	bl ov44_0222A090
	cmp r0, #0
	beq _0222E2A2
	ldr r0, [sp, #0x10]
	cmp r0, #2
	bge _0222E2A2
	cmp r7, #0xf
	bne _0222E28C
	adds r0, r5, #0
	movs r1, #0x59
	movs r2, #0
	bl ov44_0222F510
	b _0222E296
_0222E28C:
	adds r0, r5, #0
	movs r1, #0x67
	movs r2, #0
	bl ov44_0222F510
_0222E296:
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E2A2:
	cmp r7, #0x13
	bne _0222E2E2
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0222E2E2
	cmp r0, #1
	bne _0222E2BC
	adds r0, r5, #0
	movs r1, #0x68
	movs r2, #0
	bl ov44_0222F510
	b _0222E2D6
_0222E2BC:
	cmp r0, #3
	bne _0222E2CC
	adds r0, r5, #0
	movs r1, #0x6a
	movs r2, #0
	bl ov44_0222F510
	b _0222E2D6
_0222E2CC:
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl ov44_0222F510
_0222E2D6:
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E2E2:
	adds r0, r7, #0
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E32C
	ldr r0, [r5, #4]
	adds r0, #0x21
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _0222E32C
	cmp r0, #0
	beq _0222E308
	adds r0, r5, #0
	movs r1, #0x86
	movs r2, #0
	bl ov44_0222F510
	b _0222E312
_0222E308:
	adds r0, r5, #0
	movs r1, #0x87
	movs r2, #0
	bl ov44_0222F510
_0222E312:
	adds r0, r7, #0
	bl ov44_0222A0B4
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F818
	movs r0, #0xd2
	movs r1, #0x3f
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E32C:
	adds r0, r7, #0
	bl ov44_0222A0B4
	adds r7, r0, #0
	cmp r7, #0x1d
	beq _0222E3FE
	subs r0, r4, #1
	bl ov44_02231974
	cmp r0, #6
	bne _0222E3D4
	adds r0, r5, #0
	subs r1, r4, #1
	adds r2, r7, #0
	bl ov44_0223197C
	cmp r0, #0
	beq _0222E3B6
	movs r0, #0xd
	ldr r1, _0222E458 @ =0x00000708
	lsls r0, r0, #6
	str r1, [r5, r0]
	adds r0, r7, #0
	bl ov44_0222A1B4
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov44_0222F818
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x11
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222E386
	bl GF_AssertFail
_0222E386:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	cmp r7, #1
	beq _0222E3A4
	movs r0, #0xd2
	movs r1, #0x2d
	lsls r0, r0, #2
	b _0222E3B0
_0222E3A4:
	movs r0, #0xd
	ldr r1, _0222E458 @ =0x00000708
	lsls r0, r0, #6
	str r1, [r5, r0]
	movs r1, #0x15
	adds r0, #8
_0222E3B0:
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E3B6:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E3D4:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r6, #1
	b _0222E3FE
_0222E3F2:
	cmp r7, #2
	bne _0222E3FE
	movs r0, #0xd2
	movs r1, #0x36
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222E3FE:
	cmp r6, #0
	bne _0222E408
	adds r0, r5, #0
	bl ov44_0222F7BC
_0222E408:
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x32
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x56
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02001434
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0222E448
	movs r0, #0xe3
	lsls r0, r0, #2
	ldr r1, [sp, #0x14]
	adds r0, r5, r0
	bl ov44_02231F88
_0222E448:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E450: .4byte 0x0000037E
_0222E454: .4byte 0x000005DD
_0222E458: .4byte 0x00000708
	thumb_func_end ov44_0222E090

	thumb_func_start ov44_0222E45C
ov44_0222E45C: @ 0x0222E45C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0xd
	lsls r0, r0, #6
	adds r4, r1, #0
	ldr r1, [r5, r0]
	subs r1, r1, #1
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	cmp r1, #0
	bge _0222E47C
	movs r1, #0x46
	adds r0, #8
	str r1, [r5, r0]
	b _0222E5D0
_0222E47C:
	bl FUN_020390C4
	cmp r0, #3
	bne _0222E4A4
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E4A4:
	bl FUN_020390C4
	cmp r0, #5
	bne _0222E4CC
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E4CC:
	bl FUN_020390C4
	cmp r0, #4
	beq _0222E4DC
	bl FUN_02039264
	cmp r0, #0
	beq _0222E4FC
_0222E4DC:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E4FC:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222E50C
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222E5D0
_0222E50C:
	bl FUN_020390C4
	cmp r0, #1
	bne _0222E5D0
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	adds r6, r0, #0
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E54A
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_0222F7BC
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02034354
	movs r0, #0xd7
	movs r1, #0x1e
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E54A:
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #1
	bne _0222E5AA
	adds r0, r5, #0
	bl ov44_0222F7BC
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02034354
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	adds r0, r6, #0
	bl ov44_0222A1B4
	adds r0, r6, #0
	bl ov44_02229F74
	movs r1, #0xd3
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	bl FUN_020378E4
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xe1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r4, #2
	b _0222E5D0
_0222E5AA:
	bl FUN_02037880
	cmp r0, #1
	bne _0222E5D0
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222E5D0:
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_0222E45C

	thumb_func_start ov44_0222E5D8
ov44_0222E5D8: @ 0x0222E5D8
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E5D8

	thumb_func_start ov44_0222E5DC
ov44_0222E5DC: @ 0x0222E5DC
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E5DC

	thumb_func_start ov44_0222E5E0
ov44_0222E5E0: @ 0x0222E5E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020393C8
	cmp r0, #0
	beq _0222E5F8
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222E5F8:
	adds r0, r5, #0
	bl ov44_0222F8F0
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039358
	movs r1, #0
	movs r0, #0x37
	mvns r1, r1
	lsls r0, r0, #4
	str r1, [r5, r0]
	movs r1, #0x13
	subs r0, #0x28
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_022319EC
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222E5E0

	thumb_func_start ov44_0222E62C
ov44_0222E62C: @ 0x0222E62C
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E62C

	thumb_func_start ov44_0222E630
ov44_0222E630: @ 0x0222E630
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E630

	thumb_func_start ov44_0222E634
ov44_0222E634: @ 0x0222E634
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_02231958
	adds r7, r0, #0
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov44_02229F00
	ldr r1, [r5, #4]
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r4, #0xc
	bne _0222E672
	cmp r0, #5
	bne _0222E672
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E672:
	cmp r4, #0xd
	bne _0222E684
	cmp r0, #6
	bne _0222E684
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E684:
	cmp r4, #0xe
	bne _0222E696
	cmp r0, #7
	bne _0222E696
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E696:
	cmp r4, #9
	bne _0222E6A8
	cmp r0, #2
	bne _0222E6A8
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6A8:
	cmp r4, #0xa
	bne _0222E6BA
	cmp r0, #3
	bne _0222E6BA
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6BA:
	cmp r4, #0xb
	bne _0222E6CC
	cmp r0, #4
	bne _0222E6CC
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6CC:
	cmp r4, #0xf
	bne _0222E6DE
	cmp r0, #8
	bne _0222E6DE
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6DE:
	cmp r4, #0x13
	bne _0222E6F0
	cmp r0, #0x12
	bne _0222E6F0
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6F0:
	cmp r4, #0x15
	bne _0222E702
	cmp r0, #0x14
	bne _0222E702
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E702:
	cmp r4, #0x17
	bne _0222E714
	cmp r0, #0x16
	bne _0222E714
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E714:
	cmp r4, #0x19
	bne _0222E726
	cmp r0, #0x18
	bne _0222E726
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E726:
	cmp r4, #0x1b
	bne _0222E738
	cmp r0, #0x1a
	bne _0222E738
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E738:
	cmp r4, #0x10
	bne _0222E750
	cmp r0, #1
	bne _0222E750
	cmp r1, #0
	ble _0222E750
	movs r0, #0xd2
	movs r1, #0x16
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E750:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222E762
	adds r0, r5, #0
	bl ov44_0222B9A0
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E762:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	bl FUN_02039358
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E790:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0xb
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02034354
	movs r0, #0xd2
	movs r1, #0x31
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x1e
	adds r0, #0x14
	str r1, [r5, r0]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222E634

	thumb_func_start ov44_0222E7C4
ov44_0222E7C4: @ 0x0222E7C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_020390C4
	cmp r0, #3
	blt _0222E7F0
	movs r1, #0x37
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E852
_0222E7F0:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222E800
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222E852
_0222E800:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_02231958
	adds r6, r0, #0
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_02229F00
	adds r6, r0, #0
	bl ov44_0222A0B4
	cmp r4, r0
	beq _0222E84E
	cmp r4, r6
	beq _0222E84E
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E852
_0222E84E:
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222E852:
	movs r0, #0xe1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_0222E7C4

	thumb_func_start ov44_0222E860
ov44_0222E860: @ 0x0222E860
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020390C4
	cmp r0, #4
	bge _0222E880
	bl FUN_02039264
	cmp r0, #0
	bne _0222E880
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #0
	bne _0222E8BA
_0222E880:
	movs r1, #0xe1
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _0222E896
	adds r0, r5, #0
	movs r1, #0x65
	movs r2, #0
	bl ov44_0222F510
	b _0222E8AA
_0222E896:
	subs r1, #0x14
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
_0222E8AA:
	movs r0, #0xe1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x1b
	subs r0, #0x3c
	str r1, [r5, r0]
	b _0222E902
_0222E8BA:
	adds r0, r5, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E902
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0222E8F2
	movs r0, #0xd
	bl FUN_02037B38
	cmp r0, #0
	beq _0222E902
	bl FUN_02037BEC
	movs r0, #0xe
	bl FUN_02037AC0
	movs r0, #0xe1
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x32
	subs r0, #0x3c
	str r1, [r5, r0]
	b _0222E902
_0222E8F2:
	subs r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0222E902
	movs r0, #0xd
	bl FUN_02037AC0
_0222E902:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222E860

	thumb_func_start ov44_0222E908
ov44_0222E908: @ 0x0222E908
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E942
	movs r0, #0xe
	bl FUN_02037B38
	cmp r0, #0
	beq _0222E942
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	add r1, sp, #0
	strh r0, [r1]
	bl FUN_0203769C
	add r1, sp, #0
	bl FUN_02037C0C
	cmp r0, #0
	beq _0222E942
	movs r0, #0xd2
	movs r1, #0x33
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222E942:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222E908

	thumb_func_start ov44_0222E948
ov44_0222E948: @ 0x0222E948
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _0222E95A
	movs r0, #1
	b _0222E95C
_0222E95A:
	movs r0, #0
_0222E95C:
	bl FUN_02037C44
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E9BE
	cmp r4, #0
	beq _0222E9BE
	ldr r1, [r5, #4]
	adds r0, r5, #0
	bl ov44_02229F00
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r6, #0
	bl ov44_0222A0B4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4]
	cmp r0, r1
	beq _0222E990
	cmp r0, r6
	bne _0222E9A0
_0222E990:
	movs r0, #0xf
	bl FUN_02037AC0
	movs r0, #0xd2
	movs r1, #0x34
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222E9BE
_0222E9A0:
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1b
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222E9BE:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_0222E948

	thumb_func_start ov44_0222E9C4
ov44_0222E9C4: @ 0x0222E9C4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E9F6
	movs r0, #0xf
	bl FUN_02037B38
	cmp r0, #0
	beq _0222E9F6
	bl FUN_02034434
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #0x12
	bl FUN_02037AC0
	movs r0, #0xd2
	movs r1, #0x35
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222E9F6:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222E9C4

	thumb_func_start ov44_0222E9FC
ov44_0222E9FC: @ 0x0222E9FC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222EA16
	movs r0, #1
	pop {r4, pc}
_0222EA16:
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	bne _0222EA28
	movs r0, #1
	pop {r4, pc}
_0222EA28:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0222E9FC

	thumb_func_start ov44_0222EA2C
ov44_0222EA2C: @ 0x0222EA2C
	push {r4, r5, lr}
	sub sp, #0x2c
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222EA50
	movs r0, #0x12
	bl FUN_02037B38
	cmp r0, #0
	beq _0222EA50
	adds r0, r4, #0
	bl ov44_0222E9FC
	cmp r0, #1
	beq _0222EA52
_0222EA50:
	b _0222EB88
_0222EA52:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0xc
	movs r2, #0x35
	bl FUN_0203A1C4
	adds r0, r4, #0
	bl ov44_0222F7BC
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov44_02231958
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov44_02229F00
	adds r1, r0, #0
	cmp r1, #0xf
	beq _0222EA84
	cmp r1, #8
	bne _0222EA90
_0222EA84:
	movs r0, #0xd3
	movs r2, #7
	lsls r0, r0, #2
	movs r1, #8
	str r2, [r4, r0]
	b _0222EB68
_0222EA90:
	subs r0, #0x12
	cmp r0, #1
	bhi _0222EAA2
	movs r0, #0xd3
	movs r2, #0xb
	lsls r0, r0, #2
	movs r1, #0x12
	str r2, [r4, r0]
	b _0222EB68
_0222EAA2:
	adds r0, r1, #0
	subs r0, #0x14
	cmp r0, #1
	bhi _0222EAB6
	movs r0, #0xd3
	movs r2, #0xc
	lsls r0, r0, #2
	movs r1, #0x14
	str r2, [r4, r0]
	b _0222EB68
_0222EAB6:
	adds r0, r1, #0
	subs r0, #0x16
	cmp r0, #1
	bhi _0222EACA
	movs r0, #0xd3
	movs r2, #0xd
	lsls r0, r0, #2
	movs r1, #0x16
	str r2, [r4, r0]
	b _0222EB68
_0222EACA:
	adds r0, r1, #0
	subs r0, #0x18
	cmp r0, #1
	bhi _0222EADE
	movs r0, #0xd3
	movs r2, #0xe
	lsls r0, r0, #2
	movs r1, #0x18
	str r2, [r4, r0]
	b _0222EB68
_0222EADE:
	adds r0, r1, #0
	subs r0, #0x1a
	cmp r0, #1
	bhi _0222EAF2
	movs r0, #0xd3
	movs r2, #0xf
	lsls r0, r0, #2
	movs r1, #0x1a
	str r2, [r4, r0]
	b _0222EB68
_0222EAF2:
	cmp r1, #9
	beq _0222EAFA
	cmp r1, #2
	bne _0222EB06
_0222EAFA:
	movs r0, #0xd3
	movs r2, #1
	lsls r0, r0, #2
	movs r1, #2
	str r2, [r4, r0]
	b _0222EB68
_0222EB06:
	cmp r1, #0xa
	beq _0222EB0E
	cmp r1, #3
	bne _0222EB1A
_0222EB0E:
	movs r0, #0xd3
	movs r2, #2
	lsls r0, r0, #2
	movs r1, #3
	str r2, [r4, r0]
	b _0222EB68
_0222EB1A:
	cmp r1, #0xb
	beq _0222EB22
	cmp r1, #4
	bne _0222EB2E
_0222EB22:
	movs r0, #0xd3
	movs r2, #3
	lsls r0, r0, #2
	movs r1, #4
	str r2, [r4, r0]
	b _0222EB68
_0222EB2E:
	cmp r1, #0xc
	beq _0222EB36
	cmp r1, #5
	bne _0222EB42
_0222EB36:
	movs r0, #0xd3
	movs r2, #4
	lsls r0, r0, #2
	movs r1, #5
	str r2, [r4, r0]
	b _0222EB68
_0222EB42:
	cmp r1, #0xd
	beq _0222EB4A
	cmp r1, #6
	bne _0222EB56
_0222EB4A:
	movs r0, #0xd3
	movs r2, #5
	lsls r0, r0, #2
	movs r1, #6
	str r2, [r4, r0]
	b _0222EB68
_0222EB56:
	cmp r1, #0xe
	beq _0222EB5E
	cmp r1, #7
	bne _0222EB68
_0222EB5E:
	movs r0, #0xd3
	movs r2, #6
	lsls r0, r0, #2
	movs r1, #7
	str r2, [r4, r0]
_0222EB68:
	adds r0, r4, #0
	bl ov44_0222F818
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r5, #2
_0222EB88:
	adds r0, r5, #0
	add sp, #0x2c
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222EA2C

	thumb_func_start ov44_0222EB90
ov44_0222EB90: @ 0x0222EB90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x57
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r0, [r5, r0]
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #0xd9
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r5, r0]
	bl ov44_0222ADD0
	movs r1, #0xd2
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222EB90

	thumb_func_start ov44_0222EBB8
ov44_0222EBB8: @ 0x0222EBB8
	movs r2, #0xd2
	movs r3, #0x37
	lsls r2, r2, #2
	str r3, [r0, r2]
	adds r0, r1, #0
	bx lr
	thumb_func_end ov44_0222EBB8

	thumb_func_start ov44_0222EBC4
ov44_0222EBC4: @ 0x0222EBC4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222EBE0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EBE0:
	adds r0, r5, #0
	bl ov44_0222C4EC
	cmp r0, #0
	beq _0222EBF2
	movs r0, #0xd2
	movs r1, #0x38
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222EBF2:
	ldr r0, _0222EC10 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222EC04
	bl FUN_02025358
	cmp r0, #1
	bne _0222EC0C
_0222EC04:
	movs r0, #0xd2
	movs r1, #0x38
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222EC0C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222EC10: .4byte 0x021D110C
	thumb_func_end ov44_0222EBC4

	thumb_func_start ov44_0222EC14
ov44_0222EC14: @ 0x0222EC14
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222F7BC
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222EC14

	thumb_func_start ov44_0222EC2C
ov44_0222EC2C: @ 0x0222EC2C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222EC86
	ldr r0, _0222EC8C @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222EC6A
	movs r2, #0x57
	movs r0, #0x35
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222EC90 @ =0x0223538C
	adds r2, #0x7d
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x61
	b _0222EC7A
_0222EC6A:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222EC94 @ =0x02235374
	movs r2, #0
	bl ov44_02231A14
	movs r1, #0x62
_0222EC7A:
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0x3a
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222EC86:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222EC8C: .4byte 0x04000304
_0222EC90: .4byte 0x0223538C
_0222EC94: .4byte 0x02235374
	thumb_func_end ov44_0222EC2C

	thumb_func_start ov44_0222EC98
ov44_0222EC98: @ 0x0222EC98
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0222EDB4 @ =0x04000304
	adds r6, r1, #0
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222ED32
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x35
	bl FUN_02001FDC
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222ECD0
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_0222ECD0:
	adds r0, r4, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222ECF2
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0222ECEE
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x35
	bl FUN_02001FFC
_0222ECEE:
	movs r5, #1
	mvns r5, r5
_0222ECF2:
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0222ECFE
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_0222ECFE:
	cmp r5, #0
	bne _0222ED1C
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x3b
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #1
	adds r0, #0x14
	str r1, [r4, r0]
	b _0222EDB0
_0222ED1C:
	adds r0, r4, #0
	bl ov44_0222F7BC
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov44_022319EC
	b _0222EDB0
_0222ED32:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020168F4
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222ED54
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_0222ED54:
	adds r0, r4, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222ED60
	movs r5, #2
_0222ED60:
	cmp r5, #1
	bne _0222ED88
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x3b
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #1
	adds r0, #0x14
	str r1, [r4, r0]
	b _0222EDB0
_0222ED88:
	cmp r5, #2
	bne _0222EDAC
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	adds r0, r4, #0
	bl ov44_0222F7BC
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov44_022319EC
	b _0222EDB0
_0222EDAC:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_0222EDB0:
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222EDB4: .4byte 0x04000304
	thumb_func_end ov44_0222EC98

	thumb_func_start ov44_0222EDB8
ov44_0222EDB8: @ 0x0222EDB8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222EDD4
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EDD4:
	movs r0, #0xd7
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #1
	bne _0222EDE6
	movs r1, #0
	str r1, [r5, r0]
	bl FUN_02039330
_0222EDE6:
	bl FUN_02037D78
	cmp r0, #0
	bne _0222EE0C
	ldr r0, [r5]
	bl FUN_0202C46C
	adds r0, r5, #0
	movs r1, #0x1b
	movs r2, #1
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x3c
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x1e
	adds r0, #0x14
	str r1, [r5, r0]
_0222EE0C:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222EDB8

	thumb_func_start ov44_0222EE10
ov44_0222EE10: @ 0x0222EE10
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222EE2C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EE2C:
	movs r1, #0xd7
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _0222EE50
	adds r0, r1, #0
	movs r2, #8
	subs r0, #0x10
	str r2, [r5, r0]
	movs r0, #0x22
	subs r1, #0x14
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov44_0222F7BC
_0222EE50:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222EE10

	thumb_func_start ov44_0222EE54
ov44_0222EE54: @ 0x0222EE54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x10
	adds r4, r1, #0
	bl FUN_02037B38
	cmp r0, #0
	bne _0222EE68
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EE68:
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222EEC4
	ldr r0, _0222EEC8 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222EEA8
	movs r2, #0x57
	movs r0, #0x35
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222EECC @ =0x0223538C
	adds r2, #0x7d
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x61
	b _0222EEB8
_0222EEA8:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222EED0 @ =0x02235374
	movs r2, #0
	bl ov44_02231A28
	movs r1, #0x62
_0222EEB8:
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0x3e
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222EEC4:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222EEC8: .4byte 0x04000304
_0222EECC: .4byte 0x0223538C
_0222EED0: .4byte 0x02235374
	thumb_func_end ov44_0222EE54

	thumb_func_start ov44_0222EED4
ov44_0222EED4: @ 0x0222EED4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222EEF0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EEF0:
	bl FUN_02039274
	cmp r0, #0
	bne _0222EF08
	bl FUN_02039264
	cmp r0, #0
	bne _0222EF08
	bl FUN_020390C4
	cmp r0, #3
	blt _0222EF42
_0222EF08:
	ldr r0, _0222F0A8 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222EF24
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FFC
	b _0222EF2E
_0222EF24:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
_0222EF2E:
	adds r0, r5, #0
	movs r1, #0x65
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1c
	lsls r0, r0, #2
	str r1, [r5, r0]
	b _0222F0A4
_0222EF42:
	bl FUN_020393C8
	cmp r0, #0
	ldr r0, _0222F0A8 @ =0x04000304
	beq _0222EF78
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222EF66
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FFC
	b _0222EF70
_0222EF66:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
_0222EF70:
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222F0A4
_0222EF78:
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222F000
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222EF9C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EF9C:
	cmp r0, #0
	bne _0222EFE2
	adds r0, r5, #0
	movs r1, #0x8a
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222EFB8
	bl GF_AssertFail
_0222EFB8:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0xe1
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	movs r2, #0x31
	subs r0, #0x3c
	str r2, [r5, r0]
	movs r0, #0x1e
	subs r1, #0x28
	str r0, [r5, r1]
	b _0222F08A
_0222EFE2:
	adds r0, r5, #0
	bl ov44_0222F7BC
	bl FUN_020343E4
	bl FUN_020393B4
	movs r0, #0xd7
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x41
	subs r0, #0x14
	str r1, [r5, r0]
	b _0222F08A
_0222F000:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	bne _0222F05A
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	adds r0, r5, #0
	movs r1, #0x8a
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F030
	bl GF_AssertFail
_0222F030:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0xe1
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	movs r2, #0x31
	subs r0, #0x3c
	str r2, [r5, r0]
	movs r0, #0x1e
	subs r1, #0x28
	str r0, [r5, r1]
	b _0222F08A
_0222F05A:
	cmp r0, #2
	bne _0222F086
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	adds r0, r5, #0
	bl ov44_0222F7BC
	bl FUN_020343E4
	bl FUN_020393B4
	movs r0, #0xd7
	movs r1, #0x14
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r1, #0x41
	subs r0, #0x14
	str r1, [r5, r0]
	b _0222F08A
_0222F086:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
_0222F08A:
	movs r0, #0xe1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0222F0A4
	bl FUN_020398C8
	adds r1, r0, #0
	str r0, [r5, #4]
	adds r1, #0x22
	ldrb r1, [r1]
	adds r0, #0x21
	strb r1, [r0]
_0222F0A4:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222F0A8: .4byte 0x04000304
	thumb_func_end ov44_0222EED4

	thumb_func_start ov44_0222F0AC
ov44_0222F0AC: @ 0x0222F0AC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r6, r1, #0
	bl ov44_02231C70
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_0222AAEC
	cmp r0, #0
	bne _0222F0E8
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F0E8:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_02231958
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov44_02229F00
	ldr r2, _0222F184 @ =0x0000037E
	adds r7, #0x21
	ldrh r3, [r5, r2]
	ldrb r1, [r7]
	cmp r3, r0
	bne _0222F10E
	adds r0, r2, #2
	ldrh r0, [r5, r0]
	cmp r0, r1
	beq _0222F12C
_0222F10E:
	adds r0, r5, #0
	subs r1, r4, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F12C:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0222F180
	ldr r0, _0222F188 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222F164
	movs r2, #0x57
	movs r0, #0x35
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222F18C @ =0x0223538C
	adds r2, #0x7d
	movs r3, #0xb
	bl FUN_02001FC8
	movs r1, #0x61
	b _0222F174
_0222F164:
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222F190 @ =0x02235374
	movs r2, #0
	bl ov44_02231A14
	movs r1, #0x62
_0222F174:
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0xd2
	movs r1, #0x40
	lsls r0, r0, #2
	str r1, [r5, r0]
_0222F180:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F184: .4byte 0x0000037E
_0222F188: .4byte 0x04000304
_0222F18C: .4byte 0x0223538C
_0222F190: .4byte 0x02235374
	thumb_func_end ov44_0222F0AC

	thumb_func_start ov44_0222F194
ov44_0222F194: @ 0x0222F194
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r4, r1, #0
	bl ov44_02231C70
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0222AAEC
	cmp r0, #0
	bne _0222F1F6
	ldr r0, _0222F4D0 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222F1CE
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FFC
	b _0222F1D8
_0222F1CE:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
_0222F1D8:
	adds r0, r5, #0
	subs r1, r6, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F1F6:
	adds r0, r5, #0
	subs r1, r6, #1
	bl ov44_02231958
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov44_02229F00
	ldr r2, _0222F4D4 @ =0x0000037E
	adds r7, #0x21
	ldrh r3, [r5, r2]
	ldrb r1, [r7]
	cmp r3, r0
	bne _0222F21C
	adds r0, r2, #2
	ldrh r0, [r5, r0]
	cmp r0, r1
	beq _0222F260
_0222F21C:
	ldr r0, _0222F4D0 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222F238
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FFC
	b _0222F242
_0222F238:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
_0222F242:
	adds r0, r5, #0
	subs r1, r6, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F260:
	bl FUN_020393C8
	cmp r0, #0
	beq _0222F296
	ldr r0, _0222F4D0 @ =0x04000304
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222F284
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FFC
	b _0222F28E
_0222F284:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
_0222F28E:
	adds r0, r5, #0
	bl ov44_0222B9A0
	b _0222F4CC
_0222F296:
	bl FUN_020390C4
	cmp r0, #3
	ldr r0, _0222F4D0 @ =0x04000304
	blt _0222F2DE
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222F2BA
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FFC
	b _0222F2C4
_0222F2BA:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
_0222F2C4:
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #0
	bl ov44_0222F510
	bl FUN_02039358
	movs r0, #0xd2
	movs r1, #0x1d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F2DE:
	ldrh r1, [r0]
	lsrs r0, r0, #0xb
	ands r0, r1
	asrs r0, r0, #0xf
	cmp r0, #1
	bne _0222F3D4
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x35
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222F302
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F302:
	cmp r0, #0
	bne _0222F3AE
	ldr r0, _0222F4D4 @ =0x0000037E
	ldrh r0, [r5, r0]
	bl ov44_0222A0B4
	adds r6, r0, #0
	cmp r6, #0x1d
	beq _0222F3AE
	ldr r0, _0222F4D8 @ =0x00000382
	ldrh r0, [r5, r0]
	subs r0, r0, #1
	bl ov44_02231974
	cmp r0, #6
	bne _0222F3AE
	adds r0, r5, #0
	bl ov44_0222F89C
	ldr r1, _0222F4D8 @ =0x00000382
	adds r0, r5, #0
	ldrh r1, [r5, r1]
	adds r2, r6, #0
	subs r1, r1, #1
	bl ov44_0223197C
	cmp r0, #0
	beq _0222F3AE
	movs r0, #0xd
	ldr r1, _0222F4DC @ =0x00000708
	lsls r0, r0, #6
	str r1, [r5, r0]
	adds r0, r6, #0
	bl ov44_0222A1B4
	movs r0, #0
	bl FUN_020378E4
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0222F818
	ldr r1, _0222F4D8 @ =0x00000382
	adds r0, r5, #0
	ldrh r1, [r5, r1]
	subs r1, r1, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x11
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F37A
	bl GF_AssertFail
_0222F37A:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	cmp r6, #1
	beq _0222F39C
	movs r0, #0xd2
	movs r1, #0x2d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F39C:
	movs r0, #0xd
	ldr r1, _0222F4DC @ =0x00000708
	lsls r0, r0, #6
	str r1, [r5, r0]
	movs r1, #0x15
	adds r0, #8
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F3AE:
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	adds r0, r5, #0
	bl ov44_0222F8F0
	adds r0, r5, #0
	bl ov44_0222C120
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F3D4:
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	bne _0222F494
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	ldr r0, _0222F4D4 @ =0x0000037E
	ldrh r0, [r5, r0]
	bl ov44_0222A0B4
	adds r6, r0, #0
	cmp r6, #0x1d
	beq _0222F4CC
	ldr r0, _0222F4D8 @ =0x00000382
	ldrh r0, [r5, r0]
	subs r0, r0, #1
	bl ov44_02231974
	cmp r0, #6
	bne _0222F4CC
	adds r0, r5, #0
	bl ov44_0222F89C
	ldr r1, _0222F4D8 @ =0x00000382
	adds r0, r5, #0
	ldrh r1, [r5, r1]
	adds r2, r6, #0
	subs r1, r1, #1
	bl ov44_0223197C
	cmp r0, #0
	beq _0222F4CC
	movs r0, #0xd
	ldr r1, _0222F4DC @ =0x00000708
	lsls r0, r0, #6
	str r1, [r5, r0]
	adds r0, r6, #0
	bl ov44_0222A1B4
	movs r0, #0
	bl FUN_020378E4
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0222F818
	ldr r1, _0222F4D8 @ =0x00000382
	adds r0, r5, #0
	ldrh r1, [r5, r1]
	subs r1, r1, #1
	bl ov44_0222F780
	adds r0, r5, #0
	movs r1, #0x11
	movs r2, #0
	bl ov44_0222F510
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F460
	bl GF_AssertFail
_0222F460:
	movs r1, #0x2d
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0xee
	bl FUN_0200F0AC
	movs r1, #0x63
	lsls r1, r1, #2
	str r0, [r5, r1]
	cmp r6, #1
	beq _0222F482
	movs r0, #0xd2
	movs r1, #0x2d
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F482:
	movs r0, #0xd
	ldr r1, _0222F4DC @ =0x00000708
	lsls r0, r0, #6
	str r1, [r5, r0]
	movs r1, #0x15
	adds r0, #8
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F494:
	cmp r0, #2
	bne _0222F4C8
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02016624
	adds r0, r5, #0
	bl ov44_0222F7BC
	adds r0, r5, #0
	movs r1, #0x10
	bl ov44_0222F818
	adds r0, r5, #0
	bl ov44_0222F8F0
	adds r0, r5, #0
	bl ov44_0222C120
	movs r0, #0xd2
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F4C8:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F4CC:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F4D0: .4byte 0x04000304
_0222F4D4: .4byte 0x0000037E
_0222F4D8: .4byte 0x00000382
_0222F4DC: .4byte 0x00000708
	thumb_func_end ov44_0222F194

	thumb_func_start ov44_0222F4E0
ov44_0222F4E0: @ 0x0222F4E0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	bl FUN_02037D78
	cmp r0, #0
	bne _0222F508
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x35
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r4, #2
_0222F508:
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222F4E0

	thumb_func_start ov44_0222F510
ov44_0222F510: @ 0x0222F510
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	beq _0222F520
	movs r0, #1
	b _0222F52E
_0222F520:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02028EA8
	bl FUN_0202AD3C
_0222F52E:
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	bl ov44_0222F910
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222F55C
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
_0222F55C:
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222F580
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
_0222F580:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	cmp r0, #8
	beq _0222F5AC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222F5AC
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
	movs r0, #6
	movs r1, #8
	lsls r0, r0, #6
	str r1, [r5, r0]
_0222F5AC:
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, _0222F668 @ =0x0000012D
	movs r1, #0x2d
	str r0, [sp, #0x10]
	adds r0, #0x2f
	lsls r1, r1, #4
	movs r2, #2
	ldr r0, [r5, r0]
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201D40C
	cmp r7, #0
	beq _0222F5E8
	movs r2, #0x5b
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, r2, #4
	ldr r2, [r5, r2]
	adds r1, r6, #0
	bl FUN_0200BB6C
	b _0222F5F8
_0222F5E8:
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	adds r1, r6, #0
	bl FUN_0200BB6C
_0222F5F8:
	movs r2, #0x59
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r0, [r5, r2]
	adds r1, #0x10
	adds r2, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r2, #0x2d
	lsls r2, r2, #4
	adds r0, r5, r2
	movs r1, #1
	subs r2, #0xee
	movs r3, #0xa
	bl FUN_0200E998
	movs r0, #1
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #1
	bl FUN_02002B8C
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	movs r2, #0x5d
	movs r0, #0x2d
	lsls r0, r0, #4
	str r3, [sp, #8]
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222F668: .4byte 0x0000012D
	thumb_func_end ov44_0222F510

	thumb_func_start ov44_0222F66C
ov44_0222F66C: @ 0x0222F66C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222F910
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222F69C
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	bl FUN_0201D520
_0222F69C:
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222F6C0
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D520
_0222F6C0:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	cmp r0, #8
	beq _0222F6EC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222F6EC
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
	movs r0, #6
	movs r1, #8
	lsls r0, r0, #6
	str r1, [r5, r0]
_0222F6EC:
	movs r3, #4
	str r3, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r1, #0xc
	str r1, [sp, #0xc]
	movs r0, #0x69
	str r0, [sp, #0x10]
	adds r0, #0xf3
	lsls r1, r1, #6
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r2, #2
	bl FUN_0201D40C
	movs r2, #0x5b
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, r2, #4
	ldr r2, [r5, r2]
	adds r1, r4, #0
	bl FUN_0200BB6C
	movs r2, #0x59
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r0, [r5, r2]
	adds r1, #0x10
	adds r2, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #3
	lsls r0, r0, #8
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #3
	lsls r0, r0, #8
	ldr r2, _0222F77C @ =0x000001D9
	adds r0, r5, r0
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	movs r3, #0
	movs r0, #3
	lsls r0, r0, #8
	str r3, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	str r3, [sp, #8]
	adds r2, #0x75
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r5, r1]
	lsls r0, r1, #1
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0222F77C: .4byte 0x000001D9
	thumb_func_end ov44_0222F66C

	thumb_func_start ov44_0222F780
ov44_0222F780: @ 0x0222F780
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r6, r1, #0
	mvns r0, r0
	cmp r6, r0
	beq _0222F7BA
	movs r0, #0x35
	bl FUN_02028ED0
	adds r4, r0, #0
	ldr r0, [r5]
	adds r1, r6, #0
	bl FUN_0202C254
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02028F24
	movs r0, #0x59
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200BE48
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222F7BA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_0222F780

	thumb_func_start ov44_0222F7BC
ov44_0222F7BC: @ 0x0222F7BC
	push {r4, lr}
	adds r4, r0, #0
	bl ov44_0222F910
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #8
	beq _0222F7F0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	beq _0222F7F0
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020200A0
	movs r0, #6
	movs r1, #8
	lsls r0, r0, #6
	str r1, [r4, r0]
_0222F7F0:
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222F814
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222F814:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0222F7BC

	thumb_func_start ov44_0222F818
ov44_0222F818: @ 0x0222F818
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #4]
	cmp r2, #0
	beq _0222F82E
	bl ov44_0222F830
	ldr r0, [r4, #4]
	movs r1, #0x24
	bl FUN_021E6D60
_0222F82E:
	pop {r4, pc}
	thumb_func_end ov44_0222F818

	thumb_func_start ov44_0222F830
ov44_0222F830: @ 0x0222F830
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0222F89A
	bl ov44_02229F00
	cmp r0, r4
	beq _0222F894
	ldr r0, [r5, #4]
	strb r4, [r0, #0x1b]
	adds r0, r4, #0
	bl ov44_0222A020
	cmp r0, #0
	bne _0222F894
	cmp r4, #8
	beq _0222F894
	cmp r4, #0x14
	beq _0222F894
	cmp r4, #0x16
	beq _0222F894
	cmp r4, #0x18
	beq _0222F894
	cmp r4, #0x1a
	beq _0222F894
	cmp r4, #0x12
	beq _0222F894
	cmp r4, #1
	bne _0222F878
	movs r0, #0
	movs r1, #0x1e
	bl FUN_02005F50
	b _0222F894
_0222F878:
	cmp r4, #0x10
	bne _0222F894
	movs r0, #0
	bl FUN_021E70B8
	bl ov44_0222E074
	cmp r0, #1
	bne _0222F894
	movs r0, #0x78
	movs r1, #0x1e
	movs r2, #1
	bl FUN_02005F10
_0222F894:
	adds r0, r5, #0
	bl ov44_0222C120
_0222F89A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222F830

	thumb_func_start ov44_0222F89C
ov44_0222F89C: @ 0x0222F89C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #4]
	adds r0, r2, #0
	adds r0, #0x21
	ldrb r1, [r0]
	movs r0, #1
	adds r2, #0x21
	subs r0, r0, r1
	strb r0, [r2]
	ldr r0, [r4, #4]
	movs r1, #0x24
	bl FUN_021E6D60
	ldr r0, [r4, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov44_0222F89C

	thumb_func_start ov44_0222F8C0
ov44_0222F8C0: @ 0x0222F8C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #4]
	adds r0, r2, #0
	adds r0, #0x22
	ldrb r1, [r0]
	movs r0, #1
	adds r2, #0x22
	subs r0, r0, r1
	strb r0, [r2]
	ldr r1, [r4, #4]
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0x24
	bl FUN_021E6D60
	ldr r0, [r4, #4]
	adds r0, #0x22
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov44_0222F8C0

	thumb_func_start ov44_0222F8F0
ov44_0222F8F0: @ 0x0222F8F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0x24
	bl FUN_021E6D60
	ldr r0, [r4, #4]
	adds r0, #0x22
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov44_0222F8F0

	thumb_func_start ov44_0222F910
ov44_0222F910: @ 0x0222F910
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222F94E
	bl FUN_0200F478
	movs r0, #0x63
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D3F0
	cmp r0, #0
	beq _0222F94E
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x2d
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D520
_0222F94E:
	pop {r4, pc}
	thumb_func_end ov44_0222F910

	thumb_func_start ov44_0222F950
ov44_0222F950: @ 0x0222F950
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_0222FC0C
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231D8C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02230060
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0222F950

	thumb_func_start ov44_0222F970
ov44_0222F970: @ 0x0222F970
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov44_0222FC00
	cmp r4, r0
	bne _0222F988
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0222F950
_0222F988:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_0222F970

	thumb_func_start ov44_0222F98C
ov44_0222F98C: @ 0x0222F98C
	ldr r1, _0222F99C @ =0x00000B68
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222F998
	movs r0, #1
	bx lr
_0222F998:
	movs r0, #0
	bx lr
	.align 2, 0
_0222F99C: .4byte 0x00000B68
	thumb_func_end ov44_0222F98C

	thumb_func_start ov44_0222F9A0
ov44_0222F9A0: @ 0x0222F9A0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0222FA14 @ =0x00000B1C
	adds r4, r2, #0
	movs r2, #0x92
	adds r6, r1, #0
	adds r0, r5, r0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	ldr r0, _0222FA18 @ =0x022354E8
	ldr r2, _0222FA1C @ =ov44_0222FC84
	movs r1, #8
	adds r3, r5, #0
	str r4, [sp]
	bl FUN_02026C44
	ldr r1, _0222FA20 @ =0x00000B68
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200BD08
	ldr r1, _0222FA14 @ =0x00000B1C
	adds r2, r4, #0
	str r0, [r5, r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0222FCBC
	ldr r0, _0222FA24 @ =0x00000B94
	movs r1, #1
	str r1, [r5, r0]
	adds r0, r5, #0
	bl ov44_02230090
	adds r0, r5, #0
	bl ov44_022300C8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222FA14: .4byte 0x00000B1C
_0222FA18: .4byte 0x022354E8
_0222FA1C: .4byte ov44_0222FC84
_0222FA20: .4byte 0x00000B68
_0222FA24: .4byte 0x00000B94
	thumb_func_end ov44_0222F9A0

	thumb_func_start ov44_0222FA28
ov44_0222FA28: @ 0x0222FA28
	push {r4, lr}
	adds r4, r0, #0
	bl ov44_0222F98C
	cmp r0, #0
	beq _0222FA76
	adds r0, r4, #0
	bl ov44_0222FF30
	ldr r0, _0222FA78 @ =0x00000B68
	ldr r0, [r4, r0]
	bl FUN_02026CAC
	ldr r0, _0222FA78 @ =0x00000B68
	movs r1, #0
	str r1, [r4, r0]
	subs r0, #0x4c
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	ldr r0, _0222FA7C @ =0x00000B1C
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	adds r1, r0, #0
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
_0222FA76:
	pop {r4, pc}
	.align 2, 0
_0222FA78: .4byte 0x00000B68
_0222FA7C: .4byte 0x00000B1C
	thumb_func_end ov44_0222FA28

	thumb_func_start ov44_0222FA80
ov44_0222FA80: @ 0x0222FA80
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r6, r1, #0
	bl ov44_02231C8C
	adds r5, r0, #0
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov44_02231CE8
	cmp r0, #3
	blo _0222FAA6
	cmp r0, #6
	bhi _0222FAA6
	adds r5, r0, #0
_0222FAA6:
	cmp r5, #3
	blo _0222FAD0
	cmp r5, #6
	bhi _0222FAD0
	ldr r0, _0222FB88 @ =0x00000B8C
	subs r1, r5, #3
	ldrb r2, [r4, r0]
	cmp r2, r1
	beq _0222FAD0
	strb r1, [r4, r0]
	ldr r0, _0222FB8C @ =0x000005E1
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov44_02230090
	ldr r0, _0222FB90 @ =0x00000B91
	movs r1, #1
	strb r1, [r4, r0]
	adds r0, r0, #3
	str r1, [r4, r0]
_0222FAD0:
	ldr r0, _0222FB94 @ =0x00000B8F
	ldrb r1, [r4, r0]
	cmp r1, #1
	bne _0222FAF0
	movs r1, #2
	strb r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #1
	strb r1, [r4, r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov44_02230234
	adds r0, r4, #0
	bl ov44_02231720
_0222FAF0:
	ldr r0, _0222FB94 @ =0x00000B8F
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _0222FB1A
	subs r0, #0x27
	ldr r0, [r4, r0]
	bl FUN_02026CC4
	adds r0, r4, #0
	bl ov44_022313C8
	ldr r0, _0222FB90 @ =0x00000B91
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0222FB1A
	adds r0, r4, #0
	bl ov44_022300C8
	ldr r0, _0222FB90 @ =0x00000B91
	movs r1, #0
	strb r1, [r4, r0]
_0222FB1A:
	ldr r0, _0222FB94 @ =0x00000B8F
	ldrb r0, [r4, r0]
	adds r0, #0xfe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0222FB82
	adds r0, r4, #0
	bl ov44_02231788
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov44_0222FBC8
	cmp r0, #1
	bne _0222FB68
	ldr r1, _0222FB98 @ =0x00000B8D
	movs r3, #1
	ldrb r2, [r4, r1]
	adds r0, r1, #6
	strb r2, [r4, r0]
	movs r0, #0
	strb r0, [r4, r1]
	adds r2, r1, #1
	strb r0, [r4, r2]
	adds r2, r1, #4
	strb r3, [r4, r2]
	adds r2, r1, #7
	str r3, [r4, r2]
	adds r1, r1, #2
	strb r0, [r4, r1]
	adds r0, r4, #0
	bl ov44_02231754
	ldr r0, _0222FB9C @ =0x000005DD
	bl FUN_0200604C
	b _0222FB82
_0222FB68:
	cmp r5, #0
	beq _0222FB82
	ldr r0, _0222FB9C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov44_0222FC3C
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov44_02230234
_0222FB82:
	ldr r0, _0222FB98 @ =0x00000B8D
	ldrb r0, [r4, r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222FB88: .4byte 0x00000B8C
_0222FB8C: .4byte 0x000005E1
_0222FB90: .4byte 0x00000B91
_0222FB94: .4byte 0x00000B8F
_0222FB98: .4byte 0x00000B8D
_0222FB9C: .4byte 0x000005DD
	thumb_func_end ov44_0222FA80

	thumb_func_start ov44_0222FBA0
ov44_0222FBA0: @ 0x0222FBA0
	push {r4, lr}
	ldr r1, _0222FBC0 @ =0x00000B8F
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	bne _0222FBBE
	adds r1, r1, #2
	ldrb r1, [r4, r1]
	cmp r1, #1
	bne _0222FBBE
	bl ov44_022300C8
	ldr r0, _0222FBC4 @ =0x00000B91
	movs r1, #0
	strb r1, [r4, r0]
_0222FBBE:
	pop {r4, pc}
	.align 2, 0
_0222FBC0: .4byte 0x00000B8F
_0222FBC4: .4byte 0x00000B91
	thumb_func_end ov44_0222FBA0

	thumb_func_start ov44_0222FBC8
ov44_0222FBC8: @ 0x0222FBC8
	ldr r2, _0222FBF4 @ =0x00000B8F
	ldrb r0, [r0, r2]
	cmp r0, #3
	bne _0222FBD4
	movs r0, #0
	bx lr
_0222FBD4:
	ldr r2, _0222FBF8 @ =0x021D110C
	movs r0, #0xf0
	ldr r3, [r2, #0x44]
	tst r0, r3
	bne _0222FBEA
	ldr r2, [r2, #0x48]
	ldr r0, _0222FBFC @ =0x00000403
	tst r0, r2
	bne _0222FBEA
	cmp r1, #2
	bne _0222FBEE
_0222FBEA:
	movs r0, #1
	bx lr
_0222FBEE:
	movs r0, #0
	bx lr
	nop
_0222FBF4: .4byte 0x00000B8F
_0222FBF8: .4byte 0x021D110C
_0222FBFC: .4byte 0x00000403
	thumb_func_end ov44_0222FBC8

	thumb_func_start ov44_0222FC00
ov44_0222FC00: @ 0x0222FC00
	ldr r1, _0222FC08 @ =0x00000B8D
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222FC08: .4byte 0x00000B8D
	thumb_func_end ov44_0222FC00

	thumb_func_start ov44_0222FC0C
ov44_0222FC0C: @ 0x0222FC0C
	push {r4, lr}
	adds r4, r0, #0
	bl ov44_0222F98C
	cmp r0, #1
	bne _0222FC36
	ldr r0, _0222FC38 @ =0x00000B8D
	movs r2, #0
	strb r2, [r4, r0]
	adds r1, r0, #1
	strb r2, [r4, r1]
	adds r1, r0, #2
	strb r2, [r4, r1]
	adds r1, r0, #4
	movs r2, #1
	strb r2, [r4, r1]
	adds r0, r0, #7
	str r2, [r4, r0]
	adds r0, r4, #0
	bl ov44_02231754
_0222FC36:
	pop {r4, pc}
	.align 2, 0
_0222FC38: .4byte 0x00000B8D
	thumb_func_end ov44_0222FC0C

	thumb_func_start ov44_0222FC3C
ov44_0222FC3C: @ 0x0222FC3C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov44_02229EE0
	cmp r0, #1
	bne _0222FC4E
	movs r1, #7
	b _0222FC50
_0222FC4E:
	movs r1, #2
_0222FC50:
	cmp r5, #3
	bne _0222FC68
	movs r0, #0xb9
	lsls r0, r0, #4
	ldrsb r0, [r4, r0]
	adds r0, r0, #1
	blx FUN_020F2BA4
	movs r0, #0xb9
	lsls r0, r0, #4
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0222FC68:
	movs r2, #0xb9
	lsls r2, r2, #4
	ldrsb r3, [r4, r2]
	adds r0, r4, r2
	subs r3, r3, #1
	strb r3, [r0]
	ldrsb r2, [r4, r2]
	cmp r2, #0
	bge _0222FC82
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, r2, r1
	strb r1, [r0]
_0222FC82:
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222FC3C

	thumb_func_start ov44_0222FC84
ov44_0222FC84: @ 0x0222FC84
	push {r3, r4, r5, lr}
	ldr r4, _0222FCB4 @ =0x00000B8C
	ldrb r3, [r2, r4]
	lsls r3, r3, #3
	adds r0, r0, r3
	adds r3, r4, #0
	adds r5, r2, r0
	subs r3, #0x20
	ldrb r3, [r5, r3]
	cmp r3, #2
	bne _0222FCB2
	adds r3, r4, #1
	ldrb r3, [r2, r3]
	cmp r3, #0
	bne _0222FCB2
	cmp r1, #0
	bne _0222FCB2
	adds r1, r0, #1
	adds r0, r4, #1
	strb r1, [r2, r0]
	ldr r0, _0222FCB8 @ =0x000005DD
	bl FUN_0200604C
_0222FCB2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222FCB4: .4byte 0x00000B8C
_0222FCB8: .4byte 0x000005DD
	thumb_func_end ov44_0222FC84

	thumb_func_start ov44_0222FCBC
ov44_0222FCBC: @ 0x0222FCBC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r7, r0, #0
	movs r0, #0x57
	lsls r0, r0, #2
	str r1, [sp, #0x14]
	ldr r0, [r7, r0]
	movs r1, #4
	str r2, [sp, #0x18]
	bl FUN_0201CAE0
	movs r0, #0x80
	str r0, [sp]
	ldr r0, [sp, #0x18]
	movs r1, #0x11
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0xa0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	movs r1, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	movs r2, #4
	movs r3, #0x80
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	movs r2, #0x57
	str r0, [sp, #0xc]
	lsls r2, r2, #2
	ldr r0, [sp, #0x14]
	ldr r2, [r7, r2]
	movs r1, #0x10
	movs r3, #4
	bl FUN_02007B44
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	movs r2, #0x57
	str r0, [sp, #0xc]
	lsls r2, r2, #2
	ldr r0, [sp, #0x14]
	ldr r2, [r7, r2]
	movs r1, #0x13
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	movs r2, #0x57
	str r0, [sp, #0xc]
	lsls r2, r2, #2
	ldr r0, [sp, #0x14]
	ldr r2, [r7, r2]
	movs r1, #0x12
	movs r3, #4
	bl FUN_02007B68
	ldr r0, [sp, #0x18]
	ldr r3, _0222FF18 @ =0x00000B24
	str r0, [sp]
	ldr r0, [sp, #0x14]
	movs r1, #0x15
	movs r2, #0
	adds r3, r7, r3
	bl FUN_02007C2C
	movs r1, #0xb2
	lsls r1, r1, #4
	str r0, [r7, r1]
	adds r0, r1, #4
	ldr r0, [r7, r0]
	movs r1, #0x30
	bl ov44_0222FFB4
	ldr r0, _0222FF1C @ =0x00000B44
	movs r6, #0
	adds r5, r7, r0
	adds r4, r7, #0
_0222FD7A:
	ldr r0, [sp, #0x18]
	adds r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	adds r1, #0x16
	movs r2, #0
	adds r3, r5, #0
	bl FUN_02007C2C
	ldr r1, _0222FF20 @ =0x00000B28
	str r0, [r4, r1]
	adds r0, r1, #0
	adds r0, #0x1c
	ldr r0, [r4, r0]
	movs r1, #0x30
	bl ov44_0222FFB4
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, r4, #4
	cmp r6, #7
	blt _0222FD7A
	ldr r0, [sp, #0x18]
	ldr r3, _0222FF24 @ =0x00000B64
	str r0, [sp]
	ldr r0, [sp, #0x14]
	movs r1, #0x1d
	movs r2, #0
	adds r3, r7, r3
	bl FUN_02007C2C
	movs r1, #0xb6
	lsls r1, r1, #4
	str r0, [r7, r1]
	adds r0, r1, #4
	ldr r0, [r7, r0]
	movs r1, #0x30
	bl ov44_0222FFB4
	movs r1, #0x1e
	ldr r2, [sp, #0x18]
	movs r0, #4
	lsls r1, r1, #4
	bl FUN_0200304C
	movs r0, #0
	ldr r1, _0222FF28 @ =0x00000B98
	str r0, [sp, #0x1c]
	adds r0, r7, r1
	str r0, [sp, #0x30]
	movs r0, #1
	adds r1, #0x80
	str r0, [sp, #0x2c]
	adds r0, r7, r1
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x24]
_0222FDEC:
	ldr r0, [sp, #0x30]
	bl FUN_0201D3C4
	ldr r0, [sp, #0x1c]
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r1, r2, r1
	movs r0, #6
	muls r0, r1, r0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	movs r2, #5
	asrs r0, r0, #1
	lsrs r1, r0, #0x1e
	ldr r0, [sp, #0x1c]
	adds r1, r0, r1
	asrs r0, r1, #2
	lsls r5, r0, #4
	ldr r0, [sp, #0x20]
	adds r3, r5, #4
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	lsls r3, r3, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x30]
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r0, [sp, #0x30]
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x30]
	bl FUN_0201D5C8
	ldr r0, [sp, #0x20]
	ldr r4, [sp, #0x28]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	adds r5, r5, #1
	str r0, [sp, #0x34]
_0222FE64:
	adds r0, r4, #0
	bl FUN_0201D3C4
	ldr r0, [sp, #0x34]
	lsls r3, r5, #0x18
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	movs r2, #5
	adds r1, r6, r0
	movs r0, #6
	muls r0, r1, r0
	adds r0, #0xda
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r1, r4, #0
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0xc
	cmp r6, #2
	blt _0222FE64
	ldr r0, [sp, #0x30]
	adds r0, #0x10
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x2c]
	adds r0, #0x1b
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	adds r0, #0x20
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	adds r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blt _0222FDEC
	movs r3, #1
	str r3, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #0x15
	str r0, [sp, #8]
	movs r0, #0xf
	str r0, [sp, #0xc]
	movs r0, #0x57
	ldr r1, _0222FF2C @ =0x00000D18
	str r3, [sp, #0x10]
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r1, r7, r1
	movs r2, #7
	bl FUN_0201D40C
	ldr r0, _0222FF2C @ =0x00000D18
	movs r1, #0
	adds r0, r7, r0
	bl FUN_0201D978
	ldr r0, _0222FF2C @ =0x00000D18
	adds r0, r7, r0
	bl FUN_0201D5C8
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	adds r0, r7, #0
	bl ov44_02231420
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222FF18: .4byte 0x00000B24
_0222FF1C: .4byte 0x00000B44
_0222FF20: .4byte 0x00000B28
_0222FF24: .4byte 0x00000B64
_0222FF28: .4byte 0x00000B98
_0222FF2C: .4byte 0x00000D18
	thumb_func_end ov44_0222FCBC

	thumb_func_start ov44_0222FF30
ov44_0222FF30: @ 0x0222FF30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	bl ov44_022316B0
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _0222FFA8 @ =0x00000B98
	ldr r0, [sp]
	adds r7, r0, r1
	adds r1, #0x80
	adds r6, r0, r1
_0222FF48:
	adds r0, r7, #0
	bl FUN_0201D520
	movs r4, #0
	adds r5, r6, #0
_0222FF52:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blt _0222FF52
	ldr r0, [sp, #4]
	adds r7, #0x10
	adds r0, r0, #1
	adds r6, #0x20
	str r0, [sp, #4]
	cmp r0, #8
	blt _0222FF48
	ldr r1, _0222FFAC @ =0x00000D18
	ldr r0, [sp]
	adds r0, r0, r1
	bl FUN_0201D520
	movs r1, #0xb2
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_0201AB0C
	ldr r4, [sp]
	ldr r6, _0222FFB0 @ =0x00000B28
	movs r5, #0
_0222FF8A:
	ldr r0, [r4, r6]
	bl FUN_0201AB0C
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #7
	blt _0222FF8A
	movs r1, #0xb6
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222FFA8: .4byte 0x00000B98
_0222FFAC: .4byte 0x00000D18
_0222FFB0: .4byte 0x00000B28
	thumb_func_end ov44_0222FF30

	thumb_func_start ov44_0222FFB4
ov44_0222FFB4: @ 0x0222FFB4
	push {r4, r5, r6, r7}
	adds r5, r1, #0
	adds r1, r0, #0
	adds r1, #0xc
	mov ip, r1
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	lsrs r2, r1, #3
	lsrs r7, r0, #3
	movs r0, #0
	cmp r7, #0
	ble _0222FFF0
	adds r3, r0, #0
_0222FFCE:
	movs r1, #0
	cmp r2, #0
	ble _0222FFE8
	lsls r6, r3, #1
	mov r4, ip
	adds r4, r4, r6
_0222FFDA:
	ldrh r6, [r4]
	adds r1, r1, #1
	adds r6, r6, r5
	strh r6, [r4]
	adds r4, r4, #2
	cmp r1, r2
	blt _0222FFDA
_0222FFE8:
	adds r0, r0, #1
	adds r3, r3, r2
	cmp r0, r7
	blt _0222FFCE
_0222FFF0:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov44_0222FFB4

	thumb_func_start ov44_0222FFF4
ov44_0222FFF4: @ 0x0222FFF4
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r6, #0
	bne _02230004
	bl GF_AssertFail
_02230004:
	cmp r4, #0
	bne _0223000C
	bl GF_AssertFail
_0223000C:
	cmp r4, #3
	blo _02230014
	bl GF_AssertFail
_02230014:
	ldr r0, _02230024 @ =0x00000B6B
	adds r1, r5, r6
	strb r4, [r1, r0]
	movs r1, #1
	adds r0, #0x26
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
	nop
_02230024: .4byte 0x00000B6B
	thumb_func_end ov44_0222FFF4

	thumb_func_start ov44_02230028
ov44_02230028: @ 0x02230028
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bne _02230034
	bl GF_AssertFail
_02230034:
	ldr r0, _02230044 @ =0x00000B6B
	movs r2, #0
	adds r1, r5, r4
	strb r2, [r1, r0]
	movs r1, #1
	adds r0, #0x26
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230044: .4byte 0x00000B6B
	thumb_func_end ov44_02230028

	thumb_func_start ov44_02230048
ov44_02230048: @ 0x02230048
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bne _02230054
	bl GF_AssertFail
_02230054:
	ldr r0, _0223005C @ =0x00000B6B
	adds r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223005C: .4byte 0x00000B6B
	thumb_func_end ov44_02230048

	thumb_func_start ov44_02230060
ov44_02230060: @ 0x02230060
	push {r3, lr}
	ldr r2, _0223007C @ =0x00000B8F
	ldrb r3, [r0, r2]
	cmp r3, #0
	beq _02230070
	bl ov44_02230234
	pop {r3, pc}
_02230070:
	movs r3, #1
	adds r1, r2, #5
	str r3, [r0, r1]
	bl ov44_022300C8
	pop {r3, pc}
	.align 2, 0
_0223007C: .4byte 0x00000B8F
	thumb_func_end ov44_02230060

	thumb_func_start ov44_02230080
ov44_02230080: @ 0x02230080
	ldr r1, _0223008C @ =0x00000B94
	movs r2, #1
	str r2, [r0, r1]
	subs r1, r1, #3
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_0223008C: .4byte 0x00000B94
	thumb_func_end ov44_02230080

	thumb_func_start ov44_02230090
ov44_02230090: @ 0x02230090
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	ldr r0, _022300C4 @ =0x00000B8C
	movs r2, #0
	ldrb r0, [r4, r0]
	movs r1, #4
	adds r3, r2, #0
	str r0, [sp, #8]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201CA4C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_022300C4: .4byte 0x00000B8C
	thumb_func_end ov44_02230090

	thumb_func_start ov44_022300C8
ov44_022300C8: @ 0x022300C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r6, r0, #0
	ldr r0, _02230220 @ =0x00000B94
	ldr r1, [r6, r0]
	cmp r1, #1
	bne _022300FA
	movs r2, #0
	str r2, [r6, r0]
	movs r0, #1
	str r0, [sp, #0x18]
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x57
	str r2, [sp, #0xc]
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201C8C4
	b _022300FE
_022300FA:
	movs r0, #0
	str r0, [sp, #0x18]
_022300FE:
	ldr r1, _02230224 @ =0x00000B98
	movs r7, #0
	adds r0, r6, r1
	adds r1, #0x80
	str r0, [sp, #0x14]
	adds r0, r6, r1
	str r0, [sp, #0x10]
_0223010C:
	ldr r0, _02230228 @ =0x00000B8C
	ldrb r1, [r6, r0]
	subs r0, #0x21
	lsls r1, r1, #3
	adds r1, r7, r1
	adds r4, r1, #1
	adds r1, r6, r4
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0223013A
	ldr r0, [r6]
	subs r1, r4, #1
	movs r2, #8
	bl FUN_0202C090
	cmp r0, #0
	bne _02230134
	movs r0, #1
	str r0, [sp, #0x1c]
	b _0223013E
_02230134:
	movs r0, #0
	str r0, [sp, #0x1c]
	b _0223013E
_0223013A:
	movs r0, #2
	str r0, [sp, #0x1c]
_0223013E:
	asrs r0, r7, #1
	lsrs r0, r0, #0x1e
	adds r0, r7, r0
	asrs r2, r0, #2
	lsrs r3, r7, #0x1f
	lsls r1, r7, #0x1e
	subs r1, r1, r3
	movs r0, #0x1e
	rors r1, r0
	adds r0, r3, r1
	ldr r1, _0223022C @ =0x00000B8D
	mov ip, r0
	ldrb r0, [r6, r1]
	cmp r4, r0
	bne _02230162
	adds r1, r1, #1
	ldrb r5, [r6, r1]
	b _02230164
_02230162:
	movs r5, #0
_02230164:
	cmp r4, r0
	beq _02230170
	ldr r0, _02230230 @ =0x00000B93
	ldrb r0, [r6, r0]
	cmp r4, r0
	bne _02230174
_02230170:
	movs r1, #1
	b _02230176
_02230174:
	movs r1, #0
_02230176:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _02230180
	cmp r1, #1
	bne _022301EC
_02230180:
	lsls r1, r2, #0x1c
	movs r3, #6
	mov r2, ip
	muls r3, r2, r3
	lsls r2, r3, #0x18
	ldr r3, [sp, #0x1c]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	lsls r3, r3, #0x18
	str r0, [sp]
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov44_02231148
	ldr r0, [sp, #0x1c]
	cmp r0, #2
	beq _022301C4
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	str r7, [sp]
	bl ov44_022312B8
	ldr r1, [sp, #0x10]
	adds r0, r6, #0
	adds r2, r4, #0
	adds r3, r5, #0
	str r7, [sp]
	bl ov44_02231344
	b _022301EC
_022301C4:
	ldr r0, [sp, #0x14]
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	bl FUN_0201D5C8
	ldr r5, [sp, #0x10]
	movs r4, #0
_022301D6:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blt _022301D6
_022301EC:
	ldr r0, [sp, #0x14]
	adds r7, r7, #1
	adds r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #0x20
	str r0, [sp, #0x10]
	cmp r7, #8
	blt _0223010C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #6
	bl FUN_0201EFBC
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230220: .4byte 0x00000B94
_02230224: .4byte 0x00000B98
_02230228: .4byte 0x00000B8C
_0223022C: .4byte 0x00000B8D
_02230230: .4byte 0x00000B93
	thumb_func_end ov44_022300C8

	thumb_func_start ov44_02230234
ov44_02230234: @ 0x02230234
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r1, _022302F4 @ =0x00000B8D
	ldr r0, [r5]
	ldrb r1, [r5, r1]
	movs r2, #8
	subs r1, r1, #1
	bl FUN_0202C090
	cmp r0, #1
	bne _02230252
	movs r4, #7
	b _02230254
_02230252:
	movs r4, #8
_02230254:
	movs r0, #0xb9
	lsls r0, r0, #4
	ldrsb r1, [r5, r0]
	subs r0, #0x4c
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r3, [r1, r0]
	movs r0, #0x57
	adds r2, r3, #0
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x57
	lsls r0, r0, #2
	movs r2, #0
	ldr r0, [r5, r0]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201CA4C
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #7
	bl FUN_0201CAE0
	adds r0, r5, #0
	bl ov44_02229EE0
	cmp r0, #0
	bne _022302AE
	adds r0, r5, #0
	bl ov44_02230FE8
_022302AE:
	ldr r0, _022302F8 @ =0x00000D18
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0201D978
	movs r2, #0xb9
	lsls r2, r2, #4
	ldrsb r2, [r5, r2]
	adds r0, r5, #0
	adds r1, r6, #0
	lsls r3, r2, #2
	ldr r2, _022302FC @ =0x02236680
	ldr r2, [r2, r3]
	blx r2
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_0201EFBC
	ldr r0, _022302F8 @ =0x00000D18
	adds r0, r5, r0
	bl FUN_0201D5C8
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_022302F4: .4byte 0x00000B8D
_022302F8: .4byte 0x00000D18
_022302FC: .4byte 0x02236680
	thumb_func_end ov44_02230234

	thumb_func_start ov44_02230300
ov44_02230300: @ 0x02230300
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, _02230694 @ =0x00000B8D
	movs r2, #8
	ldrb r0, [r5, r0]
	subs r4, r0, #1
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_0202C090
	cmp r0, #0
	bne _0223031E
	ldr r0, _02230698 @ =0x00050600
	b _02230322
_0223031E:
	movs r0, #0xc1
	lsls r0, r0, #0xa
_02230322:
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02231918
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x2a
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _0223069C @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #8
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, [sp, #0x14]
	adds r2, #0x79
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _022306A0 @ =0x00000D18
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	movs r3, #0x20
	bl FUN_020200FC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02231958
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	bl ov44_02229F00
	add r1, sp, #0x14
	adds r7, r0, #0
	bl ov44_0223120C
	movs r2, #0x5a
	lsls r2, r2, #2
	adds r1, r0, #0
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r0, #8
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, [sp, #0x14]
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x71
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #0x68
	bl FUN_020200FC
	movs r0, #0x35
	bl FUN_02028ED0
	adds r6, r0, #0
	ldr r0, [r5]
	adds r1, r4, #0
	bl FUN_0202C298
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_02028F24
	ldr r0, _0223069C @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl FUN_0200BE48
	adds r0, r6, #0
	bl FUN_0201AB0C
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x2b
	bl FUN_0200BB6C
	movs r0, #0x20
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r1, #0x96
	movs r0, #0x5a
	adds r2, r1, #0
	lsls r0, r0, #2
	adds r2, #0xda
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _0223069C @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe8
	subs r3, r1, r0
	movs r0, #0x20
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x2c
	bl FUN_0200BB6C
	movs r0, #0x38
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0202C090
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	movs r3, #4
	bl FUN_0200BFCC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x2d
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _0223069C @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0x38
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #0x78
	bl FUN_020200FC
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #2
	bl FUN_0202C090
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	movs r3, #4
	bl FUN_0200BFCC
	movs r0, #0x5a
	movs r1, #0x2e
	lsls r0, r0, #2
	lsls r2, r1, #3
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _0223069C @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe8
	subs r3, r1, r0
	movs r0, #0x38
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	movs r0, #0x5a
	movs r1, #0x2f
	lsls r0, r0, #2
	lsls r2, r1, #3
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r0, #0x50
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #3
	bl FUN_0202C090
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	movs r3, #4
	bl FUN_0200BFCC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x30
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _0223069C @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe8
	subs r3, r1, r0
	movs r0, #0x50
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	adds r0, r5, #0
	bl ov44_02229EF8
	cmp r0, #1
	bne _022306B4
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x31
	bl FUN_0200BB6C
	movs r0, #0x68
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #9
	bl FUN_0202C090
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	movs r3, #4
	bl FUN_0200BFCC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x32
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _0223069C @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe8
	subs r3, r1, r0
	movs r0, #0x68
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 @ =0x00000D18
	b _022306A8
	nop
_02230694: .4byte 0x00000B8D
_02230698: .4byte 0x00050600
_0223069C: .4byte 0x00000B1C
_022306A0: .4byte 0x00000D18
_022306A4: .4byte 0x00010200
_022306A8:
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
_022306B4:
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x33
	bl FUN_0200BB6C
	movs r0, #0x80
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022307D0 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022307D4 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #6
	bl FUN_0202C090
	adds r2, r0, #0
	beq _02230788
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _022307D8 @ =0x00000B1C
	movs r1, #2
	ldr r0, [r5, r0]
	adds r3, r1, #0
	bl FUN_0200BFCC
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #4
	bl FUN_0202C090
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _022307D8 @ =0x00000B1C
	movs r3, #4
	ldr r0, [r5, r0]
	bl FUN_0200BFCC
	ldr r0, [r5]
	adds r1, r4, #0
	movs r2, #5
	bl FUN_0202C090
	adds r2, r0, #0
	ldr r0, _022307D8 @ =0x00000B1C
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_0200CB1C
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x4a
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _022307D8 @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe8
	subs r3, r1, r0
	movs r0, #0x80
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022307D0 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022307D4 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
_02230788:
	movs r3, #2
	str r3, [sp]
	movs r0, #0x57
	ldr r1, _022307DC @ =0x00000B0C
	str r7, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r2, #6
	bl ov44_0222AC54
	ldr r0, [sp, #0x10]
	adds r0, #0x21
	str r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r0, #0
	beq _022307AE
	movs r1, #8
	b _022307B0
_022307AE:
	movs r1, #1
_022307B0:
	movs r0, #2
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r1, _022307DC @ =0x00000B0C
	ldr r0, [r5, r0]
	adds r1, r5, r1
	movs r2, #6
	movs r3, #0x1c
	bl ov44_0222ABDC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022307D0: .4byte 0x00010200
_022307D4: .4byte 0x00000D18
_022307D8: .4byte 0x00000B1C
_022307DC: .4byte 0x00000B0C
	thumb_func_end ov44_02230300

	thumb_func_start ov44_022307E0
ov44_022307E0: @ 0x022307E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _022308A0 @ =0x00000B8D
	movs r2, #0x5a
	ldrb r0, [r5, r0]
	lsls r2, r2, #2
	movs r1, #0x34
	subs r4, r0, #1
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022308A4 @ =0x000F0E00
	adds r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _022308A8 @ =0x00000D18
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #0
	adds r3, r4, #0
	bl ov44_02231084
	movs r0, #0x18
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022308AC @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022308A8 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x78
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x71
	adds r3, r4, #0
	bl ov44_02231054
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3b
	bl FUN_0200BB6C
	movs r0, #0x30
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022308AC @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _022308A8 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x78
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x70
	adds r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_022308A0: .4byte 0x00000B8D
_022308A4: .4byte 0x000F0E00
_022308A8: .4byte 0x00000D18
_022308AC: .4byte 0x00010200
	thumb_func_end ov44_022307E0

	thumb_func_start ov44_022308B0
ov44_022308B0: @ 0x022308B0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _02230B1C @ =0x00000B8D
	movs r2, #0x5a
	ldrb r0, [r5, r0]
	lsls r2, r2, #2
	movs r1, #0x35
	subs r4, r0, #1
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B20 @ =0x000F0E00
	adds r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230B24 @ =0x00000D18
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3c
	bl FUN_0200BB6C
	movs r0, #0x18
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3e
	bl FUN_0200BB6C
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe8
	subs r3, r1, r0
	movs r0, #0x18
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #1
	adds r3, r4, #0
	bl ov44_02231084
	movs r0, #0x30
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x73
	adds r3, r4, #0
	bl ov44_02231054
	movs r0, #0xd4
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x42
	movs r2, #0x75
	adds r3, r4, #0
	bl ov44_02231054
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3b
	bl FUN_0200BB6C
	movs r0, #0x40
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x72
	adds r3, r4, #0
	bl ov44_02231054
	movs r0, #0xd4
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x42
	movs r2, #0x74
	adds r3, r4, #0
	bl ov44_02231054
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3d
	bl FUN_0200BB6C
	movs r0, #0x58
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3e
	bl FUN_0200BB6C
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe8
	subs r3, r1, r0
	movs r0, #0x58
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #2
	adds r3, r4, #0
	bl ov44_02231084
	movs r0, #0x70
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x70
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x77
	adds r3, r4, #0
	bl ov44_02231054
	movs r0, #0xd4
	str r0, [sp]
	movs r0, #0x70
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x42
	movs r2, #0x79
	adds r3, r4, #0
	bl ov44_02231054
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3b
	bl FUN_0200BB6C
	movs r0, #0x80
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x76
	adds r3, r4, #0
	bl ov44_02231054
	movs r0, #0xd4
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x42
	movs r2, #0x78
	adds r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230B1C: .4byte 0x00000B8D
_02230B20: .4byte 0x000F0E00
_02230B24: .4byte 0x00000D18
_02230B28: .4byte 0x00010200
	thumb_func_end ov44_022308B0

	thumb_func_start ov44_02230B2C
ov44_02230B2C: @ 0x02230B2C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _02230C58 @ =0x00000B8D
	movs r2, #0x5a
	ldrb r0, [r5, r0]
	lsls r2, r2, #2
	movs r1, #0x36
	subs r4, r0, #1
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C5C @ =0x000F0E00
	adds r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230C60 @ =0x00000D18
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3f
	bl FUN_0200BB6C
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r0, r0, #1
	lsrs r1, r0, #1
	movs r0, #0xb4
	subs r3, r0, r1
	movs r0, #0x18
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C64 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230C60 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #3
	adds r3, r4, #0
	bl ov44_02231084
	movs r0, #0x30
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C64 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230C60 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x44
	movs r2, #0x87
	adds r3, r4, #0
	bl ov44_02231054
	movs r0, #0xd4
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x43
	movs r2, #0x88
	adds r3, r4, #0
	bl ov44_02231054
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3b
	bl FUN_0200BB6C
	movs r0, #0x50
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C64 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230C60 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x44
	movs r2, #0x86
	adds r3, r4, #0
	bl ov44_02231054
	movs r0, #0xd4
	str r0, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x43
	movs r2, #0x8a
	adds r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02230C58: .4byte 0x00000B8D
_02230C5C: .4byte 0x000F0E00
_02230C60: .4byte 0x00000D18
_02230C64: .4byte 0x00010200
	thumb_func_end ov44_02230B2C

	thumb_func_start ov44_02230C68
ov44_02230C68: @ 0x02230C68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r6, r1, #0
	bl FUN_0203107C
	adds r7, r0, #0
	ldr r0, _02230D7C @ =0x00000B8D
	movs r2, #0x5a
	ldrb r0, [r5, r0]
	lsls r2, r2, #2
	movs r1, #0x37
	subs r4, r0, #1
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230D80 @ =0x000F0E00
	adds r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230D84 @ =0x00000D18
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	adds r0, r7, #0
	movs r1, #0x7c
	adds r2, r4, #0
	bl FUN_020310BC
	adds r1, r6, #0
	bl FUN_0200BCDC
	adds r6, r0, #0
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r0, r0, #1
	lsrs r1, r0, #1
	movs r0, #0x21
	subs r3, r0, r1
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02230D88 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230D84 @ =0x00000D18
	adds r2, r6, #0
	adds r0, r5, r0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #4
	adds r3, r4, #0
	bl ov44_02231084
	movs r0, #0x30
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230D88 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230D84 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x6c
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x7b
	adds r3, r4, #0
	bl ov44_02231054
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3b
	bl FUN_0200BB6C
	movs r0, #0x50
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230D88 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230D84 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x6c
	str r0, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #0x7a
	adds r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230D7C: .4byte 0x00000B8D
_02230D80: .4byte 0x000F0E00
_02230D84: .4byte 0x00000D18
_02230D88: .4byte 0x00010200
	thumb_func_end ov44_02230C68

	thumb_func_start ov44_02230D8C
ov44_02230D8C: @ 0x02230D8C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _02230E4C @ =0x00000B8D
	movs r2, #0x5a
	ldrb r0, [r5, r0]
	lsls r2, r2, #2
	movs r1, #0x38
	subs r4, r0, #1
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230E50 @ =0x000F0E00
	adds r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230E54 @ =0x00000D18
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r1, #0x5e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #5
	adds r3, r4, #0
	bl ov44_02231084
	movs r0, #0x18
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230E58 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230E54 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x70
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x45
	movs r2, #0x8f
	adds r3, r4, #0
	bl ov44_02231054
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0x3b
	bl FUN_0200BB6C
	movs r0, #0x30
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230E58 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230E54 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	movs r0, #0x70
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x45
	movs r2, #0x8e
	adds r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230E4C: .4byte 0x00000B8D
_02230E50: .4byte 0x000F0E00
_02230E54: .4byte 0x00000D18
_02230E58: .4byte 0x00010200
	thumb_func_end ov44_02230D8C

	thumb_func_start ov44_02230E5C
ov44_02230E5C: @ 0x02230E5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0202C6F4
	adds r6, r0, #0
	ldr r0, _02230FD4 @ =0x00000B8D
	movs r2, #0x5a
	ldrb r0, [r5, r0]
	lsls r2, r2, #2
	movs r1, #0x46
	subs r4, r0, #1
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FD8 @ =0x000F0E00
	adds r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230FDC @ =0x00000D18
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	ldr r0, _02230FE0 @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_0200C74C
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x47
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _02230FE0 @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0x18
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FE4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230FDC @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xa
	bl FUN_0202C090
	adds r2, r0, #0
	movs r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x48
	movs r3, #0xa4
	bl ov44_022310C8
	ldr r0, _02230FE0 @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	movs r2, #1
	bl FUN_0200C74C
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x47
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _02230FE0 @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0x30
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FE4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230FDC @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xb
	bl FUN_0202C090
	adds r2, r0, #0
	movs r0, #0x30
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x48
	movs r3, #0xa4
	bl ov44_022310C8
	ldr r0, _02230FE0 @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	movs r2, #2
	bl FUN_0200C74C
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x47
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _02230FE0 @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0x48
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FE4 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02230FDC @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #8
	bl FUN_020200FC
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0xc
	bl FUN_0202C090
	adds r2, r0, #0
	movs r1, #0x48
	adds r0, r5, #0
	movs r3, #0xa4
	str r1, [sp]
	bl ov44_022310C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_02230FD4: .4byte 0x00000B8D
_02230FD8: .4byte 0x000F0E00
_02230FDC: .4byte 0x00000D18
_02230FE0: .4byte 0x00000B1C
_02230FE4: .4byte 0x00010200
	thumb_func_end ov44_02230E5C

	thumb_func_start ov44_02230FE8
ov44_02230FE8: @ 0x02230FE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	movs r4, #0
	adds r5, r0, #0
	movs r7, #1
	adds r6, r4, #0
_02230FF4:
	ldr r0, _02231050 @ =0x00000B64
	adds r2, r4, #0
	ldr r0, [r5, r0]
	adds r2, #0x1a
	str r7, [sp]
	adds r1, r0, #0
	str r7, [sp, #4]
	adds r1, #0xc
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	str r6, [sp, #0x10]
	ldrh r1, [r0]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r1, #6
	adds r3, r6, #0
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0201C4EC
	adds r4, r4, #1
	cmp r4, #5
	blt _02230FF4
	movs r0, #5
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #6
	movs r0, #0x57
	str r1, [sp, #8]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0x1a
	movs r3, #0
	bl FUN_0201CA4C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02231050: .4byte 0x00000B64
	thumb_func_end ov44_02230FE8

	thumb_func_start ov44_02231054
ov44_02231054: @ 0x02231054
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r6, r2, #0
	adds r7, r3, #0
	adds r4, r1, #0
	bl FUN_0203107C
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_020310BC
	adds r2, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_022310C8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02231054

	thumb_func_start ov44_02231084
ov44_02231084: @ 0x02231084
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r3, #0
	cmp r4, #6
	blo _02231096
	bl GF_AssertFail
_02231096:
	movs r0, #0x16
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0203107C
	ldr r1, _022310C4 @ =0x022353D0
	lsls r2, r4, #2
	ldr r1, [r1, r2]
	adds r2, r7, #0
	bl FUN_020310BC
	cmp r0, #0
	bne _022310B4
	movs r1, #0x39
	b _022310B6
_022310B4:
	movs r1, #0x3a
_022310B6:
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl FUN_0200BB6C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022310C4: .4byte 0x022353D0
	thumb_func_end ov44_02231084

	thumb_func_start ov44_022310C8
ov44_022310C8: @ 0x022310C8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223113C @ =0x00000B1C
	adds r6, r1, #0
	adds r4, r3, #0
	ldr r0, [r5, r0]
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	adds r1, r6, #0
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _0223113C @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0x5e
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r0, r0, #1
	lsrs r0, r0, #1
	subs r3, r4, r0
	ldr r0, [sp, #0x20]
	movs r2, #0xff
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, _02231140 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r0, _02231144 @ =0x00000D18
	str r1, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r5, r0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223113C: .4byte 0x00000B1C
_02231140: .4byte 0x00010200
_02231144: .4byte 0x00000D18
	thumb_func_end ov44_022310C8

	thumb_func_start ov44_02231148
ov44_02231148: @ 0x02231148
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r2, [sp, #0x1c]
	ldr r4, [sp, #0x38]
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r3, #0
	cmp r4, #4
	blo _0223115E
	bl GF_AssertFail
_0223115E:
	cmp r4, #3
	bne _02231164
	movs r4, #1
_02231164:
	cmp r4, #2
	bhs _022311A8
	movs r0, #0x10
	str r0, [sp]
	movs r1, #6
	ldr r0, _02231208 @ =0x00000B24
	str r1, [sp, #4]
	ldr r0, [r5, r0]
	adds r2, r7, #0
	adds r0, #0xc
	str r0, [sp, #8]
	lsls r0, r4, #0x14
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	adds r0, r6, #0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	movs r0, #0x20
	str r0, [sp, #0x14]
	movs r0, #0x12
	str r0, [sp, #0x18]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	bl FUN_0201C4EC
	b _022311E4
_022311A8:
	movs r0, #0x10
	str r0, [sp]
	movs r1, #6
	ldr r2, _02231208 @ =0x00000B24
	str r1, [sp, #4]
	ldr r3, [r5, r2]
	movs r2, #0x12
	adds r3, #0xc
	lsls r2, r2, #6
	adds r2, r3, r2
	str r2, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	adds r2, r6, #0
	muls r2, r1, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0x12
	str r0, [sp, #0x18]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	adds r2, r7, #0
	bl FUN_0201C4EC
_022311E4:
	movs r0, #0x10
	str r0, [sp]
	adds r0, r6, #4
	movs r1, #6
	lsls r0, r0, #0x18
	str r1, [sp, #4]
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	adds r2, r7, #0
	bl FUN_0201CA4C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231208: .4byte 0x00000B24
	thumb_func_end ov44_02231148

	thumb_func_start ov44_0223120C
ov44_0223120C: @ 0x0223120C
	ldr r2, _022312B0 @ =0x00010200
	cmp r0, #0x1b
	str r2, [r1]
	bhi _022312AC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02231220: @ jump table
	.2byte _022312AC - _02231220 - 2 @ case 0
	.2byte _02231258 - _02231220 - 2 @ case 1
	.2byte _02231260 - _02231220 - 2 @ case 2
	.2byte _02231260 - _02231220 - 2 @ case 3
	.2byte _02231260 - _02231220 - 2 @ case 4
	.2byte _02231260 - _02231220 - 2 @ case 5
	.2byte _02231260 - _02231220 - 2 @ case 6
	.2byte _02231260 - _02231220 - 2 @ case 7
	.2byte _02231280 - _02231220 - 2 @ case 8
	.2byte _02231268 - _02231220 - 2 @ case 9
	.2byte _0223126C - _02231220 - 2 @ case 10
	.2byte _02231270 - _02231220 - 2 @ case 11
	.2byte _02231274 - _02231220 - 2 @ case 12
	.2byte _02231278 - _02231220 - 2 @ case 13
	.2byte _0223127C - _02231220 - 2 @ case 14
	.2byte _02231288 - _02231220 - 2 @ case 15
	.2byte _022312A8 - _02231220 - 2 @ case 16
	.2byte _022312AC - _02231220 - 2 @ case 17
	.2byte _0223128C - _02231220 - 2 @ case 18
	.2byte _0223128C - _02231220 - 2 @ case 19
	.2byte _02231290 - _02231220 - 2 @ case 20
	.2byte _02231298 - _02231220 - 2 @ case 21
	.2byte _0223129C - _02231220 - 2 @ case 22
	.2byte _022312A4 - _02231220 - 2 @ case 23
	.2byte _0223129C - _02231220 - 2 @ case 24
	.2byte _022312A4 - _02231220 - 2 @ case 25
	.2byte _0223129C - _02231220 - 2 @ case 26
	.2byte _022312A4 - _02231220 - 2 @ case 27
_02231258:
	ldr r2, _022312B4 @ =0x00020E00
	movs r0, #0x24
	str r2, [r1]
	bx lr
_02231260:
	ldr r2, _022312B4 @ =0x00020E00
	movs r0, #0x1b
	str r2, [r1]
	bx lr
_02231268:
	movs r0, #0x60
	bx lr
_0223126C:
	movs r0, #0x61
	bx lr
_02231270:
	movs r0, #0x5f
	bx lr
_02231274:
	movs r0, #0x63
	bx lr
_02231278:
	movs r0, #0x64
	bx lr
_0223127C:
	movs r0, #0x62
	bx lr
_02231280:
	ldr r2, _022312B4 @ =0x00020E00
	movs r0, #0x1d
	str r2, [r1]
	bx lr
_02231288:
	movs r0, #0x1c
	bx lr
_0223128C:
	movs r0, #0x5c
	bx lr
_02231290:
	ldr r2, _022312B4 @ =0x00020E00
	movs r0, #0x21
	str r2, [r1]
	bx lr
_02231298:
	movs r0, #0x20
	bx lr
_0223129C:
	ldr r2, _022312B4 @ =0x00020E00
	movs r0, #0x23
	str r2, [r1]
	bx lr
_022312A4:
	movs r0, #0x22
	bx lr
_022312A8:
	movs r0, #0x4f
	bx lr
_022312AC:
	movs r0, #0x5c
	bx lr
	.align 2, 0
_022312B0: .4byte 0x00010200
_022312B4: .4byte 0x00020E00
	thumb_func_end ov44_0223120C

	thumb_func_start ov44_022312B8
ov44_022312B8: @ 0x022312B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #0
	str r2, [sp, #0x10]
	adds r4, r3, #0
	bl FUN_0201D978
	ldr r0, _02231338 @ =0x02235364
	movs r2, #8
	ldrb r7, [r0, r4]
	ldr r0, [sp, #0x10]
	subs r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [r5]
	ldr r1, [sp, #0x14]
	bl FUN_0202C090
	cmp r0, #0
	bne _022312E8
	ldr r4, _0223133C @ =0x00050600
	b _022312EC
_022312E8:
	movs r4, #0xc1
	lsls r4, r4, #0xa
_022312EC:
	ldr r1, [sp, #0x14]
	adds r0, r5, #0
	bl ov44_02231918
	movs r2, #0x5a
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	movs r1, #0x2a
	bl FUN_0200BB6C
	movs r2, #0x5e
	ldr r0, _02231340 @ =0x00000B1C
	lsls r2, r2, #2
	ldr r1, [r5, r2]
	subs r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	str r7, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	str r4, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	adds r2, #0x79
	ldr r2, [r5, r2]
	adds r0, r6, #0
	movs r1, #1
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231338: .4byte 0x02235364
_0223133C: .4byte 0x00050600
_02231340: .4byte 0x00000B1C
	thumb_func_end ov44_022312B8

	thumb_func_start ov44_02231344
ov44_02231344: @ 0x02231344
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	subs r1, r2, #1
	adds r6, r0, #0
	adds r4, r3, #0
	bl ov44_02231958
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	adds r0, r6, #0
	bl ov44_02229F00
	str r0, [sp, #8]
	ldr r0, _022313C0 @ =0x02235364
	ldrb r0, [r0, r4]
	movs r4, #0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_0223136A:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	cmp r4, #0
	bne _0223138A
	ldr r0, [sp, #8]
	ldr r1, _022313C4 @ =0x00000B0C
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, r1
	movs r2, #0
	adds r3, r7, #0
	bl ov44_0222AD34
	b _022313AE
_0223138A:
	ldr r0, [sp, #0xc]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _02231398
	movs r0, #8
	b _0223139A
_02231398:
	movs r0, #1
_0223139A:
	ldr r1, _022313C4 @ =0x00000B0C
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, r1
	movs r2, #0
	adds r3, r7, #0
	bl ov44_0222ACE8
_022313AE:
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blt _0223136A
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022313C0: .4byte 0x02235364
_022313C4: .4byte 0x00000B0C
	thumb_func_end ov44_02231344

	thumb_func_start ov44_022313C8
ov44_022313C8: @ 0x022313C8
	push {r3, r4}
	ldr r1, _02231418 @ =0x00000B8D
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _02231414
	adds r2, r1, #5
	ldrb r2, [r0, r2]
	adds r3, r2, #1
	adds r2, r1, #5
	strb r3, [r0, r2]
	ldrb r4, [r0, r2]
	adds r2, r1, #1
	ldrb r3, [r0, r2]
	ldr r2, _0223141C @ =0x02235368
	ldrb r2, [r2, r3]
	cmp r4, r2
	blo _02231414
	movs r3, #0
	adds r2, r1, #5
	strb r3, [r0, r2]
	adds r2, r1, #1
	ldrb r2, [r0, r2]
	adds r4, r2, #1
	adds r2, r1, #1
	strb r4, [r0, r2]
	movs r2, #1
	adds r4, r1, #4
	strb r2, [r0, r4]
	adds r4, r1, #1
	ldrb r4, [r0, r4]
	cmp r4, #4
	blo _02231414
	adds r4, r1, #5
	strb r3, [r0, r4]
	adds r4, r1, #1
	strb r3, [r0, r4]
	adds r1, r1, #2
	strb r2, [r0, r1]
_02231414:
	pop {r3, r4}
	bx lr
	.align 2, 0
_02231418: .4byte 0x00000B8D
_0223141C: .4byte 0x02235368
	thumb_func_end ov44_022313C8

	thumb_func_start ov44_02231420
ov44_02231420: @ 0x02231420
	push {r4, r5, r6, r7, lr}
	sub sp, #0x12c
	ldr r6, _02231684 @ =0x02235570
	str r2, [sp, #0x2c]
	adds r5, r0, #0
	adds r4, r1, #0
	add r3, sp, #0x9c
	movs r2, #0x12
_02231430:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02231430
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r4, #0
	str r0, [sp, #8]
	movs r0, #0xaf
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0x2b
	movs r3, #0
	bl FUN_0200A3C8
	ldr r1, _02231688 @ =0x00000D28
	movs r2, #0x2c
	str r0, [r5, r1]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	adds r1, r4, #0
	str r0, [sp, #0xc]
	movs r0, #0xb
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r3, #0
	bl FUN_0200A480
	ldr r1, _0223168C @ =0x00000D2C
	movs r2, #0x29
	str r0, [r5, r1]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r4, #0
	str r0, [sp, #8]
	movs r0, #0xb1
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0xd3
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r4, #0
	str r0, [sp, #8]
	movs r0, #0xb2
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #0x2a
	movs r3, #0
	bl FUN_0200A540
	ldr r1, _02231690 @ =0x00000D34
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	bl FUN_0200AE18
	cmp r0, #0
	bne _022314D6
	bl GF_AssertFail
_022314D6:
	ldr r0, _0223168C @ =0x00000D2C
	ldr r0, [r5, r0]
	bl FUN_0200B00C
	cmp r0, #0
	bne _022314E6
	bl GF_AssertFail
_022314E6:
	ldr r0, _02231688 @ =0x00000D28
	ldr r0, [r5, r0]
	bl FUN_0200A740
	ldr r0, _0223168C @ =0x00000D2C
	ldr r0, [r5, r0]
	bl FUN_0200A740
	movs r1, #0x1e
	adds r0, r1, #0
	movs r3, #0xaf
	str r1, [sp]
	subs r0, #0x1f
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r3, r3, #2
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r5, r2]
	adds r3, #0xc
	str r2, [sp, #0x1c]
	ldr r2, [r5, r3]
	adds r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x78
	adds r2, r1, #0
	bl FUN_02009D48
	movs r0, #0
	add r4, sp, #0x9c
	ldr r7, _02231694 @ =0x0223535C
	str r0, [sp, #0x34]
	str r4, [sp, #0x30]
	adds r6, r5, #0
_0223153E:
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [r4]
	add r0, sp, #0x78
	str r0, [r4, #4]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #0x30]
	bl FUN_02024624
	ldr r1, _02231698 @ =0x00000D38
	str r0, [r6, r1]
	adds r0, r1, #0
	ldrb r1, [r7]
	ldr r0, [r6, r0]
	bl FUN_020248F0
	ldr r0, [sp, #0x30]
	adds r4, #0x30
	adds r0, #0x30
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	adds r6, r6, #4
	adds r0, r0, #1
	adds r7, r7, #1
	str r0, [sp, #0x34]
	cmp r0, #3
	blt _0223153E
	ldr r1, [sp, #0x2c]
	movs r0, #2
	bl FUN_02002CEC
	add r0, sp, #0x68
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x57
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x68
	movs r2, #8
	movs r3, #2
	bl FUN_0201D494
	ldr r1, [sp, #0x2c]
	movs r0, #0x40
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #0x5a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x49
	adds r2, r4, #0
	bl FUN_0200BB6C
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x40
	bl FUN_020030A0
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223169C @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0x68
	movs r1, #2
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	ldr r1, [sp, #0x2c]
	add r0, sp, #0x68
	bl FUN_02013910
	movs r1, #2
	adds r4, r0, #0
	bl FUN_02013948
	ldr r3, _022316A0 @ =0x00000D44
	movs r1, #1
	movs r2, #2
	adds r3, r5, r3
	bl FUN_02021AC8
	cmp r0, #0
	bne _02231604
	bl GF_AssertFail
_02231604:
	movs r0, #0xb3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	str r0, [sp, #0x38]
	add r0, sp, #0x68
	str r0, [sp, #0x3c]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x40]
	ldr r0, _0223168C @ =0x00000D2C
	ldr r0, [r5, r0]
	bl FUN_0200B0F8
	str r0, [sp, #0x44]
	ldr r0, _022316A4 @ =0x00000D3C
	ldr r1, [r5, r0]
	adds r0, #0xc
	str r1, [sp, #0x48]
	ldr r0, [r5, r0]
	adds r1, r4, #0
	str r0, [sp, #0x4c]
	movs r0, #0x1f
	mvns r0, r0
	str r0, [sp, #0x50]
	adds r0, #0x18
	str r0, [sp, #0x54]
	movs r0, #0
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	movs r0, #2
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x64]
	add r0, sp, #0x38
	bl FUN_02013950
	movs r1, #0xd5
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_02013938
	add r0, sp, #0x68
	bl FUN_0201D520
	movs r0, #2
	bl FUN_02002DB4
	ldr r0, [sp, #0x2c]
	ldr r2, _022316A8 @ =ov44_022317F0
	str r0, [sp]
	ldr r0, _022316AC @ =0x02235394
	movs r1, #3
	adds r3, r5, #0
	bl FUN_02026C44
	movs r1, #0xd6
	lsls r1, r1, #4
	str r0, [r5, r1]
	add sp, #0x12c
	pop {r4, r5, r6, r7, pc}
	nop
_02231684: .4byte 0x02235570
_02231688: .4byte 0x00000D28
_0223168C: .4byte 0x00000D2C
_02231690: .4byte 0x00000D34
_02231694: .4byte 0x0223535C
_02231698: .4byte 0x00000D38
_0223169C: .4byte 0x00010200
_022316A0: .4byte 0x00000D44
_022316A4: .4byte 0x00000D3C
_022316A8: .4byte ov44_022317F0
_022316AC: .4byte 0x02235394
	thumb_func_end ov44_02231420

	thumb_func_start ov44_022316B0
ov44_022316B0: @ 0x022316B0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xd6
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02026CAC
	movs r0, #0xd5
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_020139C8
	ldr r0, _02231710 @ =0x00000D44
	adds r0, r5, r0
	bl FUN_02021B5C
	ldr r7, _02231714 @ =0x00000D38
	movs r6, #0
	adds r4, r5, #0
_022316D6:
	ldr r0, [r4, r7]
	bl FUN_02024758
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #3
	blt _022316D6
	ldr r0, _02231718 @ =0x00000D28
	ldr r0, [r5, r0]
	bl FUN_0200AEB0
	ldr r0, _0223171C @ =0x00000D2C
	ldr r0, [r5, r0]
	bl FUN_0200B0A8
	movs r7, #0xaf
	ldr r6, _02231718 @ =0x00000D28
	movs r4, #0
	lsls r7, r7, #2
_022316FC:
	ldr r0, [r5, r7]
	ldr r1, [r5, r6]
	bl FUN_0200A75C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022316FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231710: .4byte 0x00000D44
_02231714: .4byte 0x00000D38
_02231718: .4byte 0x00000D28
_0223171C: .4byte 0x00000D2C
	thumb_func_end ov44_022316B0

	thumb_func_start ov44_02231720
ov44_02231720: @ 0x02231720
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _02231748 @ =0x00000D54
	movs r1, #1
	str r1, [r5, r0]
	movs r0, #0x10
	bl FUN_02022CC8
	ldr r0, _0223174C @ =0x00000D58
	movs r4, #0
	ldr r6, _02231750 @ =0x00000B1C
	str r4, [r5, r0]
_02231738:
	adds r0, r5, r6
	adds r1, r4, #0
	bl ov44_02231800
	adds r4, r4, #1
	cmp r4, #3
	blt _02231738
	pop {r4, r5, r6, pc}
	.align 2, 0
_02231748: .4byte 0x00000D54
_0223174C: .4byte 0x00000D58
_02231750: .4byte 0x00000B1C
	thumb_func_end ov44_02231720

	thumb_func_start ov44_02231754
ov44_02231754: @ 0x02231754
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02231784 @ =0x00000D54
	ldr r1, [r4, r0]
	cmp r1, #2
	bne _02231776
	subs r0, #0x18
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xd5
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020137C0
_02231776:
	ldr r0, _02231784 @ =0x00000D54
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #0x10
	bl FUN_02022CC8
	pop {r4, pc}
	.align 2, 0
_02231784: .4byte 0x00000D54
	thumb_func_end ov44_02231754

	thumb_func_start ov44_02231788
ov44_02231788: @ 0x02231788
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _022317E0 @ =0x00000D54
	adds r5, r0, #0
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _02231798
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02231798:
	movs r2, #3
	adds r0, r1, #4
	str r2, [r5, r0]
	adds r0, r1, #0
	movs r2, #0xff
	adds r0, #8
	adds r1, #0xc
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl FUN_02026CC4
	ldr r6, _022317E4 @ =0x00000B1C
	ldr r7, _022317E0 @ =0x00000D54
	movs r4, #0
_022317B4:
	ldr r0, [r5, r7]
	cmp r0, #2
	bne _022317BE
	cmp r4, #1
	beq _022317D6
_022317BE:
	ldr r2, _022317E8 @ =0x00000D58
	ldr r3, _022317EC @ =0x00000D5C
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	adds r0, r5, r6
	adds r1, r4, #0
	bl ov44_0223183C
	cmp r0, #1
	bne _022317D6
	adds r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_022317D6:
	adds r4, r4, #1
	cmp r4, #3
	blt _022317B4
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022317E0: .4byte 0x00000D54
_022317E4: .4byte 0x00000B1C
_022317E8: .4byte 0x00000D58
_022317EC: .4byte 0x00000D5C
	thumb_func_end ov44_02231788

	thumb_func_start ov44_022317F0
ov44_022317F0: @ 0x022317F0
	ldr r3, _022317FC @ =0x00000D58
	str r0, [r2, r3]
	adds r0, r3, #4
	str r1, [r2, r0]
	bx lr
	nop
_022317FC: .4byte 0x00000D58
	thumb_func_end ov44_022317F0

	thumb_func_start ov44_02231800
ov44_02231800: @ 0x02231800
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r0, #0x87
	ldr r1, _02231838 @ =0x0223535C
	lsls r0, r0, #2
	adds r6, r5, r0
	lsls r7, r4, #2
	ldrb r1, [r1, r4]
	ldr r0, [r6, r7]
	bl FUN_020248F0
	ldr r0, [r6, r7]
	movs r1, #4
	bl FUN_020249D4
	cmp r4, #1
	bne _02231836
	movs r0, #0x8d
	movs r1, #0x1f
	lsls r0, r0, #2
	mvns r1, r1
	adds r2, r1, #0
	ldr r0, [r5, r0]
	adds r2, #0x18
	bl FUN_020136B4
_02231836:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231838: .4byte 0x0223535C
	thumb_func_end ov44_02231800

	thumb_func_start ov44_0223183C
ov44_0223183C: @ 0x0223183C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	movs r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	str r0, [sp, #8]
	cmp r2, r5
	bne _022318BE
	movs r1, #0x87
	ldr r0, [sp]
	lsls r1, r1, #2
	lsls r4, r5, #2
	adds r7, r0, r1
	ldr r0, [r7, r4]
	bl FUN_020249F8
	str r0, [sp, #4]
	cmp r6, #0
	beq _02231868
	cmp r6, #2
	bne _022318B0
_02231868:
	cmp r6, #0
	bne _02231876
	ldr r1, _0223190C @ =0x02235360
	ldr r0, [r7, r4]
	ldrb r1, [r1, r5]
	bl FUN_020248F0
_02231876:
	ldr r0, [sp, #4]
	cmp r0, #3
	bhs _02231904
	movs r1, #2
	ldr r0, [r7, r4]
	lsls r1, r1, #0xc
	bl FUN_020249B0
	ldr r0, [r7, r4]
	bl FUN_020249F8
	adds r4, r0, #0
	cmp r5, #1
	bne _022318A6
	ldr r2, _02231910 @ =0x0223536C
	movs r1, #0x8d
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0x1f
	ldrsb r2, [r2, r4]
	mvns r1, r1
	bl FUN_020136B4
_022318A6:
	cmp r4, #3
	blo _02231904
	movs r0, #1
	str r0, [sp, #8]
	b _02231904
_022318B0:
	cmp r6, #1
	bne _02231904
	cmp r0, #3
	bhs _02231904
	movs r0, #1
	str r0, [sp, #8]
	b _02231904
_022318BE:
	movs r1, #0x87
	ldr r0, [sp]
	lsls r1, r1, #2
	lsls r4, r5, #2
	adds r6, r0, r1
	ldr r0, [r6, r4]
	bl FUN_020249A8
	adds r7, r0, #0
	ldr r0, [r6, r4]
	bl FUN_020249F8
	str r0, [sp, #0xc]
	ldr r0, _0223190C @ =0x02235360
	ldrb r0, [r0, r5]
	cmp r7, r0
	bne _022318FA
	ldr r1, _02231914 @ =0x0223535C
	ldr r0, [r6, r4]
	ldrb r1, [r1, r5]
	bl FUN_020248F0
	ldr r1, [sp, #0xc]
	movs r2, #4
	subs r1, r2, r1
	lsls r1, r1, #0x10
	ldr r0, [r6, r4]
	lsrs r1, r1, #0x10
	bl FUN_020249D4
_022318FA:
	movs r1, #2
	ldr r0, [r6, r4]
	lsls r1, r1, #0xc
	bl FUN_020249B0
_02231904:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223190C: .4byte 0x02235360
_02231910: .4byte 0x0223536C
_02231914: .4byte 0x0223535C
	thumb_func_end ov44_0223183C

	thumb_func_start ov44_02231918
ov44_02231918: @ 0x02231918
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r6, r1, #0
	mvns r0, r0
	cmp r6, r0
	beq _02231950
	movs r0, #0x35
	bl FUN_02028ED0
	adds r4, r0, #0
	ldr r0, [r5]
	adds r1, r6, #0
	bl FUN_0202C254
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02028F24
	ldr r0, _02231954 @ =0x00000B1C
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl FUN_0200BE48
	adds r0, r4, #0
	bl FUN_0201AB0C
_02231950:
	pop {r4, r5, r6, pc}
	nop
_02231954: .4byte 0x00000B1C
	thumb_func_end ov44_02231918

	thumb_func_start ov44_02231958
ov44_02231958: @ 0x02231958
	cmp r1, #0x20
	blo _02231962
	ldr r1, _02231970 @ =0x00001098
	adds r0, r0, r1
	bx lr
_02231962:
	ldr r2, [r0, #4]
	movs r0, #0x24
	adds r2, #0x24
	muls r0, r1, r0
	adds r0, r2, r0
	bx lr
	nop
_02231970: .4byte 0x00001098
	thumb_func_end ov44_02231958

	thumb_func_start ov44_02231974
ov44_02231974: @ 0x02231974
	ldr r3, _02231978 @ =FUN_021E6D68
	bx r3
	.align 2, 0
_02231978: .4byte FUN_021E6D68
	thumb_func_end ov44_02231974

	thumb_func_start ov44_0223197C
ov44_0223197C: @ 0x0223197C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xf
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_020379A0
	ldr r0, [r5, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl FUN_021E70B8
	adds r0, r6, #0
	bl ov44_02229F44
	cmp r0, #1
	bne _022319A8
	movs r0, #1
	movs r1, #0x80
	bl FUN_021E714C
	b _022319B0
_022319A8:
	movs r0, #0
	movs r1, #0x80
	bl FUN_021E714C
_022319B0:
	bl FUN_02097214
	adds r0, r4, #0
	bl FUN_02039080
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_0223197C

	thumb_func_start ov44_022319BC
ov44_022319BC: @ 0x022319BC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _022319E8 @ =0x00000D64
	adds r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _022319E6
	movs r1, #1
	str r1, [r5, r0]
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov44_02231D94
	cmp r4, #1
	bne _022319E6
	adds r0, r5, #0
	movs r1, #9
	movs r2, #0
	bl ov44_0222F510
_022319E6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022319E8: .4byte 0x00000D64
	thumb_func_end ov44_022319BC

	thumb_func_start ov44_022319EC
ov44_022319EC: @ 0x022319EC
	push {r4, lr}
	ldr r1, _02231A10 @ =0x00000D64
	adds r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #1
	bne _02231A0C
	movs r2, #0
	str r2, [r4, r1]
	bl ov44_0222F7BC
	movs r0, #0xe3
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	bl ov44_02231D94
_02231A0C:
	pop {r4, pc}
	nop
_02231A10: .4byte 0x00000D64
	thumb_func_end ov44_022319EC

	thumb_func_start ov44_02231A14
ov44_02231A14: @ 0x02231A14
	push {r4, lr}
	bl ov44_02231A28
	movs r1, #1
	adds r4, r0, #0
	bl FUN_020169F4
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02231A14

	thumb_func_start ov44_02231A28
ov44_02231A28: @ 0x02231A28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x35
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_0201660C
	str r5, [sp]
	ldrb r1, [r4]
	adds r7, r0, #0
	str r1, [sp, #4]
	ldrh r1, [r4, #6]
	str r1, [sp, #8]
	ldrb r1, [r4, #5]
	str r1, [sp, #0xc]
	ldrb r2, [r4, #1]
	add r1, sp, #0
	strb r2, [r1, #0x10]
	ldrb r2, [r4, #2]
	strb r2, [r1, #0x11]
	ldrb r3, [r1, #0x12]
	movs r2, #0xf
	bics r3, r2
	strb r3, [r1, #0x12]
	ldrb r2, [r1, #0x12]
	movs r3, #0xf0
	bics r2, r3
	lsls r3, r6, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x18
	orrs r2, r3
	strb r2, [r1, #0x12]
	movs r2, #0
	strb r2, [r1, #0x13]
	add r1, sp, #0
	bl FUN_020166FC
	adds r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov44_02231A28

	thumb_func_start ov44_02231A7C
ov44_02231A7C: @ 0x02231A7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r2, #0
	adds r4, r1, #0
	ldr r2, _02231B3C @ =0x000006FC
	movs r1, #0
	adds r5, r0, #0
	str r3, [sp]
	blx FUN_020E5B44
	ldr r0, [sp, #0x24]
	str r4, [r5, #4]
	subs r0, r0, #1
	lsrs r7, r0, #3
	ldr r0, [sp]
	adds r2, r6, #0
	str r0, [r5, #0x10]
	adds r0, r5, #0
	ldr r1, [r5, #4]
	adds r0, #0x14
	bl ov44_02232298
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl ov44_02232334
	adds r0, r7, #0
	bl ov44_02232E90
	add r2, sp, #4
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	strh r0, [r2, #4]
	ldrh r1, [r2, #2]
	strh r1, [r2, #6]
	ldrh r0, [r2, #4]
	adds r2, r4, #0
	bl FUN_02227EE0
	ldr r1, _02231B40 @ =0x000006E4
	str r0, [r5, r1]
	adds r0, r7, #0
	bl ov44_02232E9C
	adds r1, r0, #0
	ldr r0, _02231B40 @ =0x000006E4
	ldr r0, [r5, r0]
	bl FUN_02227F48
	movs r0, #0x30
	adds r1, r4, #0
	bl FUN_02228010
	ldr r1, _02231B44 @ =0x000006E8
	adds r2, r4, #0
	str r0, [r5, r1]
	ldr r1, [sp, #0x20]
	adds r0, r5, #0
	bl ov44_02232204
	movs r0, #0x6f
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_02229394
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov44_02232248
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_0223233C
	movs r1, #0x6d
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r5, r1
	adds r2, r6, #0
	bl ov44_02232CCC
	movs r0, #0x80
	adds r1, r4, #0
	bl FUN_02229A40
	ldr r1, _02231B48 @ =0x000006F8
	str r0, [r5, r1]
	movs r0, #1
	str r0, [r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02231B3C: .4byte 0x000006FC
_02231B40: .4byte 0x000006E4
_02231B44: .4byte 0x000006E8
_02231B48: .4byte 0x000006F8
	thumb_func_end ov44_02231A7C

	thumb_func_start ov44_02231B4C
ov44_02231B4C: @ 0x02231B4C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02231BA0 @ =0x000006F8
	ldr r0, [r4, r0]
	bl FUN_02229A78
	adds r0, r4, #0
	bl ov44_02232288
	movs r1, #0x6d
	lsls r1, r1, #4
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov44_02232D08
	adds r0, r4, #0
	bl ov44_02232028
	adds r0, r4, #0
	bl ov44_02232238
	ldr r0, _02231BA4 @ =0x000006E8
	ldr r0, [r4, r0]
	bl FUN_02228050
	ldr r0, _02231BA8 @ =0x000006E4
	ldr r0, [r4, r0]
	bl FUN_02227F28
	adds r0, r4, #0
	adds r0, #0x14
	bl ov44_022322E8
	ldr r0, [r4, #0x10]
	bl ov44_02232338
	ldr r2, _02231BAC @ =0x000006FC
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020E5B44
	pop {r4, pc}
	.align 2, 0
_02231BA0: .4byte 0x000006F8
_02231BA4: .4byte 0x000006E8
_02231BA8: .4byte 0x000006E4
_02231BAC: .4byte 0x000006FC
	thumb_func_end ov44_02231B4C

	thumb_func_start ov44_02231BB0
ov44_02231BB0: @ 0x02231BB0
	ldr r0, [r0]
	bx lr
	thumb_func_end ov44_02231BB0

	thumb_func_start ov44_02231BB4
ov44_02231BB4: @ 0x02231BB4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02231C50 @ =0x000006E8
	ldr r0, [r4, r0]
	bl FUN_0222807C
	adds r0, r4, #0
	bl ov44_02232158
	adds r0, r4, #0
	bl ov44_02232104
	movs r1, #0x6f
	lsls r1, r1, #4
	adds r0, r4, r1
	subs r1, #0x24
	ldr r1, [r4, r1]
	ldr r1, [r1]
	bl FUN_02229358
	ldr r1, _02231C54 @ =0x000006F4
	ldr r0, [r4, r1]
	subs r1, r1, #4
	adds r1, r4, r1
	bl FUN_02229420
	ldr r0, _02231C58 @ =0x000006EC
	ldr r0, [r4, r0]
	bl FUN_022290DC
	adds r0, r4, #0
	bl ov44_02232194
	adds r0, r4, #0
	bl ov44_02232594
	adds r0, r4, #0
	bl ov44_02232050
	cmp r0, #1
	bne _02231C4A
	adds r0, r4, #0
	bl ov44_02232604
	cmp r0, #1
	bne _02231C24
	adds r0, r4, #0
	bl ov44_0223254C
	ldr r0, _02231C5C @ =0x021D110C
	ldr r1, [r0, #0x44]
	movs r0, #0x80
	tst r0, r1
	beq _02231C24
	movs r0, #1
	pop {r4, pc}
_02231C24:
	ldr r0, _02231C5C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02231C4A
	adds r0, r4, #0
	bl ov44_02231C70
	cmp r0, #0
	beq _02231C3C
	movs r0, #2
	pop {r4, pc}
_02231C3C:
	adds r0, r4, #0
	bl ov44_02232070
	cmp r0, #1
	bne _02231C4A
	movs r0, #3
	pop {r4, pc}
_02231C4A:
	movs r0, #0
	pop {r4, pc}
	nop
_02231C50: .4byte 0x000006E8
_02231C54: .4byte 0x000006F4
_02231C58: .4byte 0x000006EC
_02231C5C: .4byte 0x021D110C
	thumb_func_end ov44_02231BB4

	thumb_func_start ov44_02231C60
ov44_02231C60: @ 0x02231C60
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _02231C6E
	ldr r0, [r0, #0x14]
	bl FUN_0202457C
_02231C6E:
	pop {r3, pc}
	thumb_func_end ov44_02231C60

	thumb_func_start ov44_02231C70
ov44_02231C70: @ 0x02231C70
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02231C88 @ =0x000006CC
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02231C80
	bl GF_AssertFail
_02231C80:
	ldr r0, _02231C88 @ =0x000006CC
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0xa]
	pop {r4, pc}
	.align 2, 0
_02231C88: .4byte 0x000006CC
	thumb_func_end ov44_02231C70

	thumb_func_start ov44_02231C8C
ov44_02231C8C: @ 0x02231C8C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _02231CE0 @ =0x000006CC
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02231C9E
	bl GF_AssertFail
_02231C9E:
	ldr r0, _02231CE0 @ =0x000006CC
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl FUN_022282DC
	add r2, sp, #0
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	movs r1, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	ldrsh r3, [r2, r1]
	ldr r0, _02231CE4 @ =0x000006E4
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	movs r3, #6
	ldrsh r3, [r2, r3]
	lsls r1, r1, #0xc
	ldr r0, [r4, r0]
	asrs r2, r3, #3
	lsrs r2, r2, #0x1c
	adds r2, r3, r2
	lsls r2, r2, #0xc
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl FUN_02227FDC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02231CE0: .4byte 0x000006CC
_02231CE4: .4byte 0x000006E4
	thumb_func_end ov44_02231C8C

	thumb_func_start ov44_02231CE8
ov44_02231CE8: @ 0x02231CE8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _02231D40 @ =0x000006CC
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02231CFA
	bl GF_AssertFail
_02231CFA:
	ldr r0, _02231D40 @ =0x000006CC
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl FUN_022282DC
	add r2, sp, #0
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	movs r1, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	ldrsh r3, [r2, r1]
	ldr r0, _02231D44 @ =0x000006E4
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	movs r3, #6
	ldrsh r3, [r2, r3]
	lsls r1, r1, #0xc
	ldr r0, [r4, r0]
	asrs r2, r3, #3
	lsrs r2, r2, #0x1c
	adds r2, r3, r2
	asrs r2, r2, #4
	adds r2, r2, #1
	lsls r2, r2, #0x10
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl FUN_02227FDC
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_02231D40: .4byte 0x000006CC
_02231D44: .4byte 0x000006E4
	thumb_func_end ov44_02231CE8

	thumb_func_start ov44_02231D48
ov44_02231D48: @ 0x02231D48
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r5]
	bl FUN_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r0, [r5, #4]
	bl FUN_0222920C
	adds r2, r0, #0
	add r1, sp, #0
	adds r0, r4, #0
	mov r4, sp
	ldrh r3, [r1, #4]
	subs r4, r4, #4
	subs r2, r2, #2
	strh r3, [r4]
	ldrh r1, [r1, #6]
	strh r1, [r4, #2]
	ldr r1, [r4]
	bl ov44_022325A4
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_02231D48

	thumb_func_start ov44_02231D8C
ov44_02231D8C: @ 0x02231D8C
	ldr r3, _02231D90 @ =ov44_022325F4
	bx r3
	.align 2, 0
_02231D90: .4byte ov44_022325F4
	thumb_func_end ov44_02231D8C

	thumb_func_start ov44_02231D94
ov44_02231D94: @ 0x02231D94
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov44_02231D94

	thumb_func_start ov44_02231D98
ov44_02231D98: @ 0x02231D98
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov44_02231D98

	thumb_func_start ov44_02231D9C
ov44_02231D9C: @ 0x02231D9C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	bl ov44_02232798
	adds r4, r0, #0
	ldr r0, _02231E00 @ =0x000006CC
	add r1, sp, #0xc
	str r4, [r5, r0]
	adds r0, r5, #0
	bl ov44_02232724
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0xc
	str r3, [sp, #8]
	bl ov44_02232800
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02232864
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov44_022327C8
	movs r1, #0x6f
	lsls r1, r1, #4
	adds r0, r5, r1
	subs r1, #0x24
	ldr r1, [r5, r1]
	ldr r1, [r1]
	bl FUN_02229358
	ldr r1, _02231E04 @ =0x000006F4
	ldr r0, [r5, r1]
	subs r1, r1, #4
	adds r1, r5, r1
	bl FUN_02229420
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_02231E00: .4byte 0x000006CC
_02231E04: .4byte 0x000006F4
	thumb_func_end ov44_02231D9C

	thumb_func_start ov44_02231E08
ov44_02231E08: @ 0x02231E08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r1, #0
	bl ov44_02232798
	adds r4, r0, #0
	adds r0, r5, #0
	add r1, sp, #0x14
	subs r2, r6, #1
	bl ov44_02232680
	ldr r0, _02231E90 @ =0x000006CC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02231E5E
	ldr r0, [r0]
	bl FUN_022282DC
	add r1, sp, #0xc
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	movs r2, #8
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	movs r0, #4
	ldrsh r0, [r1, r0]
	ldrsh r2, [r1, r2]
	cmp r0, r2
	bne _02231E5E
	movs r0, #6
	movs r2, #0xa
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _02231E5E
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02231E5E:
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #0x14
	adds r3, r6, #0
	bl ov44_02232800
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02232884
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov44_022327C8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231E90: .4byte 0x000006CC
	thumb_func_end ov44_02231E08

	thumb_func_start ov44_02231E94
ov44_02231E94: @ 0x02231E94
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	movs r1, #6
	bl FUN_02228188
	ldr r0, _02231ECC @ =ov44_02232BCC
	movs r1, #0
	str r0, [r4, #0x10]
	ldr r0, _02231ED0 @ =ov44_02232914
	str r0, [r4, #0x18]
	movs r0, #2
	strh r0, [r4, #0xc]
	strh r1, [r4, #8]
	ldr r0, [r4, #4]
	bl FUN_0222919C
	ldr r0, [r4, #4]
	bl FUN_022291A0
	adds r0, r5, #0
	movs r1, #4
	adds r2, r4, #0
	bl ov44_02232C6C
	pop {r3, r4, r5, pc}
	nop
_02231ECC: .4byte ov44_02232BCC
_02231ED0: .4byte ov44_02232914
	thumb_func_end ov44_02231E94

	thumb_func_start ov44_02231ED4
ov44_02231ED4: @ 0x02231ED4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl FUN_022290C4
	ldr r0, [r4]
	bl FUN_02228100
	movs r1, #0x1c
	movs r0, #0
_02231EE8:
	strb r0, [r4]
	adds r4, r4, #1
	subs r1, r1, #1
	bne _02231EE8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02231ED4

	thumb_func_start ov44_02231EF4
ov44_02231EF4: @ 0x02231EF4
	push {r3, lr}
	ldr r0, [r0]
	movs r1, #4
	bl FUN_02228188
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end ov44_02231EF4

	thumb_func_start ov44_02231F04
ov44_02231F04: @ 0x02231F04
	push {r3, lr}
	ldr r0, [r0]
	movs r1, #6
	bl FUN_02228188
	bl FUN_022282A4
	pop {r3, pc}
	thumb_func_end ov44_02231F04

	thumb_func_start ov44_02231F14
ov44_02231F14: @ 0x02231F14
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	adds r4, r2, #0
	str r0, [r5, #0x14]
	ldr r0, _02231F84 @ =ov44_02232C48
	movs r1, #4
	str r0, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	movs r0, #5
	strh r0, [r5, #0xc]
	ldr r0, [r5]
	bl FUN_02228188
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl ov44_02232C4C
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_0222919C
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl FUN_02229218
	ldr r0, [r5]
	movs r1, #0
	bl FUN_02228188
	add r1, sp, #0
	strh r0, [r1]
	ldr r0, [r5]
	movs r1, #1
	bl FUN_02228188
	add r1, sp, #0
	strh r0, [r1, #2]
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r5, #4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_022291D8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02231F84: .4byte ov44_02232C48
	thumb_func_end ov44_02231F14

	thumb_func_start ov44_02231F88
ov44_02231F88: @ 0x02231F88
	push {r3, lr}
	cmp r1, #0
	beq _02231FA6
	ldr r0, [r1, #0x14]
	cmp r0, #0
	beq _02231FA6
	str r0, [r1, #0x10]
	movs r0, #0
	str r0, [r1, #0x14]
	ldrh r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	ldr r0, [r1, #4]
	movs r1, #1
	bl FUN_0222919C
_02231FA6:
	pop {r3, pc}
	thumb_func_end ov44_02231F88

	thumb_func_start ov44_02231FA8
ov44_02231FA8: @ 0x02231FA8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r4, r2, #0
	bl ov44_02232C94
	cmp r0, #0
	bne _02231FBE
	strb r4, [r5, #0xb]
	pop {r4, r5, r6, pc}
_02231FBE:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov44_02232CA8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02231FA8

	thumb_func_start ov44_02231FCC
ov44_02231FCC: @ 0x02231FCC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov44_02232070
	cmp r0, #1
	bne _02232002
	adds r0, r5, #0
	bl ov44_02231CE8
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r0, #3
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	bmi _02231FEE
	cmp r4, #4
	blt _02231FF2
_02231FEE:
	bl GF_AssertFail
_02231FF2:
	movs r0, #0x6d
	lsls r0, r0, #4
	lsls r1, r4, #0x18
	adds r0, r5, r0
	lsrs r1, r1, #0x18
	bl ov44_02232E5C
	pop {r3, r4, r5, pc}
_02232002:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02231FCC

	thumb_func_start ov44_02232008
ov44_02232008: @ 0x02232008
	movs r1, #0x6d
	lsls r1, r1, #4
	ldr r3, _02232014 @ =ov44_02232E80
	adds r0, r0, r1
	bx r3
	nop
_02232014: .4byte ov44_02232E80
	thumb_func_end ov44_02232008

	thumb_func_start ov44_02232018
ov44_02232018: @ 0x02232018
	movs r1, #0x6d
	lsls r1, r1, #4
	ldr r3, _02232024 @ =ov44_02232D20
	adds r1, r0, r1
	bx r3
	nop
_02232024: .4byte ov44_02232D20
	thumb_func_end ov44_02232018

	thumb_func_start ov44_02232028
ov44_02232028: @ 0x02232028
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x63
	lsls r0, r0, #2
	movs r6, #0
	adds r4, r5, r0
	adds r7, r0, #0
_02232036:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02232042
	adds r0, r4, #0
	bl ov44_02231ED4
_02232042:
	adds r6, r6, #1
	adds r5, #0x1c
	adds r4, #0x1c
	cmp r6, #0x30
	blt _02232036
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02232028

	thumb_func_start ov44_02232050
ov44_02232050: @ 0x02232050
	push {r3, lr}
	ldr r1, _0223206C @ =0x000006CC
	ldr r0, [r0, r1]
	movs r1, #5
	ldr r0, [r0]
	bl FUN_02228188
	cmp r0, #0
	bne _02232066
	movs r0, #1
	pop {r3, pc}
_02232066:
	movs r0, #0
	pop {r3, pc}
	nop
_0223206C: .4byte 0x000006CC
	thumb_func_end ov44_02232050

	thumb_func_start ov44_02232070
ov44_02232070: @ 0x02232070
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _022320FC @ =0x000006CC
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsrs r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldr r0, _022320FC @ =0x000006CC
	movs r1, #6
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_02228188
	adds r4, r0, #0
	add r0, sp, #0
	mov r2, sp
	ldrh r1, [r0, #0xc]
	subs r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #0xe]
	adds r1, r4, #0
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
	ldr r0, _02232100 @ =0x000006E4
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	movs r3, #0xa
	ldrsh r3, [r2, r3]
	lsls r1, r1, #0xc
	ldr r0, [r5, r0]
	asrs r2, r3, #3
	lsrs r2, r2, #0x1c
	adds r2, r3, r2
	lsls r2, r2, #0xc
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl FUN_02227FDC
	cmp r4, #0
	bne _022320F6
	cmp r0, #2
	bne _022320F6
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, pc}
_022320F6:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_022320FC: .4byte 0x000006CC
_02232100: .4byte 0x000006E4
	thumb_func_end ov44_02232070

	thumb_func_start ov44_02232104
ov44_02232104: @ 0x02232104
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0223214C @ =0x000006F8
	add r1, sp, #8
	ldr r0, [r5, r0]
	bl FUN_02229AC8
	cmp r0, #1
	bne _02232148
	ldr r7, _02232150 @ =0x000006E8
	add r6, sp, #0
	add r4, sp, #8
_0223211E:
	ldr r0, _02232154 @ =0x000006E4
	ldr r1, [r5, r7]
	ldr r0, [r5, r0]
	adds r2, r4, #0
	adds r3, r6, #0
	bl FUN_02228C80
	cmp r0, #1
	bne _0223213A
	ldr r0, _02232150 @ =0x000006E8
	adds r1, r6, #0
	ldr r0, [r5, r0]
	bl FUN_02228068
_0223213A:
	ldr r0, _0223214C @ =0x000006F8
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_02229AC8
	cmp r0, #1
	beq _0223211E
_02232148:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223214C: .4byte 0x000006F8
_02232150: .4byte 0x000006E8
_02232154: .4byte 0x000006E4
	thumb_func_end ov44_02232104

	thumb_func_start ov44_02232158
ov44_02232158: @ 0x02232158
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x63
	lsls r0, r0, #2
	movs r6, #0
	adds r4, r7, #0
	adds r5, r7, r0
_02232166:
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02232186
	movs r2, #0x67
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	adds r0, r7, #0
	adds r1, r5, #0
	blx r2
	cmp r0, #1
	bne _02232186
	adds r0, r5, #0
	bl ov44_02231ED4
_02232186:
	adds r6, r6, #1
	adds r4, #0x1c
	adds r5, #0x1c
	cmp r6, #0x30
	blt _02232166
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02232158

	thumb_func_start ov44_02232194
ov44_02232194: @ 0x02232194
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x63
	lsls r0, r0, #2
	movs r6, #0
	adds r4, r7, #0
	adds r5, r7, r0
_022321A2:
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022321B8
	movs r2, #0x69
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	adds r0, r7, #0
	adds r1, r5, #0
	blx r2
_022321B8:
	adds r6, r6, #1
	adds r4, #0x1c
	adds r5, #0x1c
	cmp r6, #0x30
	blt _022321A2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02232194

	thumb_func_start ov44_022321C4
ov44_022321C4: @ 0x022321C4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r1]
	ldr r1, _02232200 @ =0x000006E8
	ldr r1, [r4, r1]
	bl FUN_022283BC
	cmp r0, #0
	beq _022321FA
	movs r2, #0x63
	movs r1, #0
	adds r5, r4, #0
	lsls r2, r2, #2
_022321DE:
	ldr r3, [r5, r2]
	cmp r3, r0
	bne _022321F2
	movs r0, #0x63
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #0x1c
	muls r0, r1, r0
	adds r0, r2, r0
	pop {r3, r4, r5, pc}
_022321F2:
	adds r1, r1, #1
	adds r5, #0x1c
	cmp r1, #0x30
	blt _022321DE
_022321FA:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02232200: .4byte 0x000006E8
	thumb_func_end ov44_022321C4

	thumb_func_start ov44_02232204
ov44_02232204: @ 0x02232204
	push {r4, r5, lr}
	sub sp, #0xc
	adds r3, r1, #0
	movs r1, #0
	adds r5, r0, #0
	adds r4, r2, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r5, #0x14]
	movs r2, #0x30
	bl FUN_02228F24
	ldr r1, _02232234 @ =0x000006EC
	adds r2, r4, #0
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #2
	bl FUN_02229028
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02232234: .4byte 0x000006EC
	thumb_func_end ov44_02232204

	thumb_func_start ov44_02232238
ov44_02232238: @ 0x02232238
	ldr r1, _02232240 @ =0x000006EC
	ldr r3, _02232244 @ =FUN_02228F94
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_02232240: .4byte 0x000006EC
_02232244: .4byte FUN_02228F94
	thumb_func_end ov44_02232238

	thumb_func_start ov44_02232248
ov44_02232248: @ 0x02232248
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _02232280 @ =0x02235604
	adds r4, r1, #0
	adds r5, r0, #0
	add r2, sp, #0
	movs r1, #0xb
_02232256:
	ldrb r0, [r6]
	adds r6, r6, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02232256
	add r0, sp, #0
	ldrb r1, [r0, #9]
	add r2, sp, #0
	adds r1, r1, r3
	strb r1, [r0, #9]
	adds r0, r5, #0
	ldr r1, [r5, #0x10]
	adds r0, #0x18
	adds r3, r4, #0
	bl FUN_022293B8
	ldr r1, _02232284 @ =0x000006F4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02232280: .4byte 0x02235604
_02232284: .4byte 0x000006F4
	thumb_func_end ov44_02232248

	thumb_func_start ov44_02232288
ov44_02232288: @ 0x02232288
	ldr r1, _02232290 @ =0x000006F4
	ldr r3, _02232294 @ =FUN_0222940C
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_02232290: .4byte 0x000006F4
_02232294: .4byte FUN_0222940C
	thumb_func_end ov44_02232288

	thumb_func_start ov44_02232298
ov44_02232298: @ 0x02232298
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	str r2, [sp]
	movs r0, #0x60
	adds r1, r7, #4
	adds r2, r6, #0
	bl FUN_02009F40
	movs r2, #0x32
	str r0, [r7]
	adds r0, r7, #4
	movs r1, #0
	lsls r2, r2, #0x10
	bl FUN_02009FC8
	movs r4, #0
	adds r5, r7, #0
_022322BC:
	movs r0, #0x10
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200A090
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022322BC
	ldr r2, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov44_02232314
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov44_02232324
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02232298

	thumb_func_start ov44_022322E8
ov44_022322E8: @ 0x022322E8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl ov44_0223232C
	adds r0, r7, #0
	bl ov44_0223231C
	movs r6, #0x4b
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #2
_022322FE:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022322FE
	ldr r0, [r7]
	bl FUN_02024504
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_022322E8

	thumb_func_start ov44_02232314
ov44_02232314: @ 0x02232314
	ldr r3, _02232318 @ =ov44_0223237C
	bx r3
	.align 2, 0
_02232318: .4byte ov44_0223237C
	thumb_func_end ov44_02232314

	thumb_func_start ov44_0223231C
ov44_0223231C: @ 0x0223231C
	ldr r3, _02232320 @ =ov44_0223247C
	bx r3
	.align 2, 0
_02232320: .4byte ov44_0223247C
	thumb_func_end ov44_0223231C

	thumb_func_start ov44_02232324
ov44_02232324: @ 0x02232324
	ldr r3, _02232328 @ =ov44_022324B0
	bx r3
	.align 2, 0
_02232328: .4byte ov44_022324B0
	thumb_func_end ov44_02232324

	thumb_func_start ov44_0223232C
ov44_0223232C: @ 0x0223232C
	ldr r3, _02232330 @ =ov44_02232530
	bx r3
	.align 2, 0
_02232330: .4byte ov44_02232530
	thumb_func_end ov44_0223232C

	thumb_func_start ov44_02232334
ov44_02232334: @ 0x02232334
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232334

	thumb_func_start ov44_02232338
ov44_02232338: @ 0x02232338
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232338

	thumb_func_start ov44_0223233C
ov44_0223233C: @ 0x0223233C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r0, #1
	adds r4, r2, #0
	lsls r0, r0, #8
	movs r2, #0
	adds r5, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x1f
	adds r3, r2, #0
	str r5, [sp, #4]
	bl FUN_02007B8C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	movs r1, #0x1e
	adds r2, r6, #0
	str r5, [sp, #0xc]
	bl FUN_02007B44
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_0223233C

	thumb_func_start ov44_0223237C
ov44_0223237C: @ 0x0223237C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	movs r1, #0x32
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r6, r2, #0
	str r4, [sp, #8]
	adds r1, #0xfa
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0x26
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r1, #0x32
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	adds r1, #0xfe
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0x25
	movs r3, #0
	bl FUN_0200A480
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0x32
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	subs r1, #0xc
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0x27
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x32
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r4, [sp, #8]
	subs r1, #0xc
	ldr r0, [r5, r1]
	adds r1, r6, #0
	movs r2, #0x28
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #0xc
	ldr r0, [r5, r1]
	bl FUN_0200ADA4
	cmp r0, #1
	beq _02232410
	bl GF_AssertFail
_02232410:
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200B00C
	cmp r0, #1
	beq _02232422
	bl GF_AssertFail
_02232422:
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200A740
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200A740
	movs r1, #0x32
	adds r0, r1, #0
	str r1, [sp]
	subs r0, #0x33
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	movs r3, #0x4d
	str r0, [sp, #0xc]
	movs r2, #2
	str r2, [sp, #0x10]
	adds r2, r1, #0
	adds r2, #0xfa
	ldr r2, [r5, r2]
	lsls r3, r3, #2
	str r2, [sp, #0x14]
	adds r2, r1, #0
	adds r2, #0xfe
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	ldr r2, [r5, r3]
	str r2, [sp, #0x1c]
	adds r2, r3, #4
	ldr r2, [r5, r2]
	adds r3, #0x18
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r5, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_0223237C

	thumb_func_start ov44_0223247C
ov44_0223247C: @ 0x0223247C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200AEB0
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200B0A8
	movs r7, #0x4b
	lsls r7, r7, #2
	adds r6, r7, #0
	movs r4, #0
	adds r6, #0x10
_0223249E:
	ldr r0, [r5, r7]
	ldr r1, [r5, r6]
	bl FUN_0200A75C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0223249E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0223247C

	thumb_func_start ov44_022324B0
ov44_022324B0: @ 0x022324B0
	push {r3, r4, r5, lr}
	sub sp, #0x30
	adds r4, r0, #0
	add r2, sp, #0
	movs r0, #0
	adds r3, r1, #0
	adds r5, r2, #0
	adds r1, r0, #0
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	stm r5!, {r0, r1}
	ldr r1, [r4]
	str r1, [sp]
	movs r1, #0x53
	lsls r1, r1, #2
	adds r1, r4, r1
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #0x28]
	lsls r1, r1, #0xc
	str r0, [sp, #0x24]
	adds r0, r2, #0
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	str r3, [sp, #0x2c]
	bl FUN_02024624
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r4, r1]
	add r0, sp, #0
	bl FUN_02024624
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_020248F0
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_022324B0

	thumb_func_start ov44_02232530
ov44_02232530: @ 0x02232530
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x17
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r0, #0x5d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02024758
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02232530

	thumb_func_start ov44_0223254C
ov44_0223254C: @ 0x0223254C
	push {r4, lr}
	sub sp, #0x10
	add r1, sp, #0
	adds r4, r0, #0
	bl ov44_02232724
	add r2, sp, #0
	movs r0, #0
	ldrsh r1, [r2, r0]
	adds r1, #8
	strh r1, [r2]
	movs r1, #2
	ldrsh r3, [r2, r1]
	adds r3, #0x20
	strh r3, [r2, #2]
	ldrsh r0, [r2, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	ldrsh r0, [r2, r1]
	add r1, sp, #4
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020247D4
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0223254C

	thumb_func_start ov44_02232594
ov44_02232594: @ 0x02232594
	movs r1, #0x61
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _022325A0 @ =FUN_02024830
	movs r1, #0
	bx r3
	.align 2, 0
_022325A0: .4byte FUN_02024830
	thumb_func_end ov44_02232594

	thumb_func_start ov44_022325A4
ov44_022325A4: @ 0x022325A4
	push {r0, r1, r2, r3}
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	add r1, sp, #0x18
	movs r0, #4
	ldrsh r0, [r1, r0]
	adds r4, r2, #0
	adds r0, #8
	lsls r0, r0, #0x10
	asrs r0, r0, #4
	str r0, [sp]
	movs r0, #6
	ldrsh r0, [r1, r0]
	add r1, sp, #0
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020247D4
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02024ADC
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	add sp, #0xc
	pop {r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
	thumb_func_end ov44_022325A4

	thumb_func_start ov44_022325F4
ov44_022325F4: @ 0x022325F4
	movs r1, #0x62
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _02232600 @ =FUN_02024830
	movs r1, #0
	bx r3
	.align 2, 0
_02232600: .4byte FUN_02024830
	thumb_func_end ov44_022325F4

	thumb_func_start ov44_02232604
ov44_02232604: @ 0x02232604
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _02232678 @ =0x000006CC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02232618
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, pc}
_02232618:
	ldr r0, [r0]
	bl FUN_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r0, _02232678 @ =0x000006CC
	movs r1, #6
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_02228188
	adds r4, r0, #0
	ldr r0, _0223267C @ =0x000006E4
	add r2, sp, #0
	movs r1, #4
	ldrsh r3, [r2, r1]
	ldr r0, [r5, r0]
	asrs r1, r3, #3
	lsrs r1, r1, #0x1c
	adds r1, r3, r1
	movs r3, #6
	ldrsh r3, [r2, r3]
	lsls r1, r1, #0xc
	lsrs r1, r1, #0x10
	asrs r2, r3, #3
	lsrs r2, r2, #0x1c
	adds r2, r3, r2
	lsls r2, r2, #0xc
	lsrs r2, r2, #0x10
	bl FUN_02227FDC
	cmp r0, #0xf
	bne _02232670
	cmp r4, #1
	bne _02232670
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_02232670:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02232678: .4byte 0x000006CC
_0223267C: .4byte 0x000006E4
	thumb_func_end ov44_02232604

	thumb_func_start ov44_02232680
ov44_02232680: @ 0x02232680
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #7
	adds r4, r2, #0
	ands r4, r0
	ldr r0, _02232720 @ =0x000006E4
	str r1, [sp]
	ldr r0, [r5, r0]
	lsrs r7, r2, #3
	bl FUN_02227F40
	adds r6, r0, #0
	ldr r0, _02232720 @ =0x000006E4
	ldr r0, [r5, r0]
	bl FUN_02227F44
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	cmp r0, #0
	bls _02232718
	adds r0, r7, #3
	str r0, [sp, #0x14]
	adds r0, r4, #7
	str r0, [sp, #0xc]
_022326B6:
	movs r4, #0
	cmp r6, #0
	bls _0223270C
	ldr r0, [sp, #8]
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_022326CC:
	ldr r0, _02232720 @ =0x000006E4
	lsls r1, r4, #0x10
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x10
	adds r2, r7, #0
	bl FUN_02227FDC
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _02232706
	ldr r0, _02232720 @ =0x000006E4
	lsls r1, r4, #0x10
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	lsrs r1, r1, #0x10
	bl FUN_02227FDC
	ldr r1, [sp, #0x14]
	cmp r0, r1
	bne _02232706
	ldr r0, [sp]
	lsls r1, r4, #4
	strh r1, [r0]
	ldr r0, [sp, #8]
	lsls r1, r0, #4
	ldr r0, [sp]
	add sp, #0x18
	strh r1, [r0, #2]
	pop {r3, r4, r5, r6, r7, pc}
_02232706:
	adds r4, r4, #1
	cmp r4, r6
	blo _022326CC
_0223270C:
	ldr r0, [sp, #8]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blo _022326B6
_02232718:
	bl GF_AssertFail
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02232720: .4byte 0x000006E4
	thumb_func_end ov44_02232680

	thumb_func_start ov44_02232724
ov44_02232724: @ 0x02232724
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, _02232794 @ =0x000006E4
	str r1, [sp]
	ldr r0, [r7, r0]
	bl FUN_02227F40
	adds r5, r0, #0
	ldr r0, _02232794 @ =0x000006E4
	ldr r0, [r7, r0]
	bl FUN_02227F44
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	cmp r0, #0
	bls _0223278C
_0223274A:
	movs r4, #0
	cmp r5, #0
	bls _02232780
	ldr r0, [sp, #8]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_02232756:
	ldr r0, _02232794 @ =0x000006E4
	lsls r1, r4, #0x10
	ldr r0, [r7, r0]
	lsrs r1, r1, #0x10
	adds r2, r6, #0
	bl FUN_02227FDC
	cmp r0, #0xf
	bne _0223277A
	ldr r0, [sp]
	lsls r1, r4, #4
	strh r1, [r0]
	ldr r0, [sp, #8]
	lsls r1, r0, #4
	ldr r0, [sp]
	add sp, #0xc
	strh r1, [r0, #2]
	pop {r4, r5, r6, r7, pc}
_0223277A:
	adds r4, r4, #1
	cmp r4, r5
	blo _02232756
_02232780:
	ldr r0, [sp, #8]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blo _0223274A
_0223278C:
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02232794: .4byte 0x000006E4
	thumb_func_end ov44_02232724

	thumb_func_start ov44_02232798
ov44_02232798: @ 0x02232798
	push {r4, lr}
	movs r2, #0x63
	movs r1, #0
	adds r4, r0, #0
	lsls r2, r2, #2
_022327A2:
	ldr r3, [r4, r2]
	cmp r3, #0
	bne _022327B6
	movs r2, #0x63
	lsls r2, r2, #2
	adds r2, r0, r2
	movs r0, #0x1c
	muls r0, r1, r0
	adds r0, r2, r0
	pop {r4, pc}
_022327B6:
	adds r1, r1, #1
	adds r4, #0x1c
	cmp r1, #0x30
	blt _022327A2
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02232798

	thumb_func_start ov44_022327C8
ov44_022327C8: @ 0x022327C8
	push {r3, r4, r5, lr}
	adds r3, r0, #0
	ldr r0, _022327FC @ =0x000006EC
	adds r5, r1, #0
	ldr r0, [r3, r0]
	ldr r1, [r5]
	ldr r3, [r3, #4]
	adds r4, r2, #0
	bl FUN_0222903C
	str r0, [r5, #4]
	cmp r4, #0
	bne _022327F8
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_0222919C
	ldr r0, [r5, #4]
	bl FUN_022291A0
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_02229200
_022327F8:
	pop {r3, r4, r5, pc}
	nop
_022327FC: .4byte 0x000006EC
	thumb_func_end ov44_022327C8

	thumb_func_start ov44_02232800
ov44_02232800: @ 0x02232800
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	movs r1, #0
	ldrsh r1, [r2, r1]
	add r5, sp, #0
	strh r1, [r5]
	movs r1, #2
	ldrsh r1, [r2, r1]
	strh r1, [r5, #2]
	ldr r1, [sp, #0x20]
	strh r3, [r5, #4]
	strh r1, [r5, #6]
	add r1, sp, #8
	ldrb r2, [r1, #0x14]
	strh r2, [r5, #8]
	ldrh r1, [r1, #0x10]
	strh r1, [r5, #0xa]
	ldr r1, _02232834 @ =0x000006E8
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl FUN_022280B8
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_02232834: .4byte 0x000006E8
	thumb_func_end ov44_02232800

	thumb_func_start ov44_02232838
ov44_02232838: @ 0x02232838
	ldrh r0, [r0, #0xc]
	cmp r0, #5
	bhi _0223285E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223284A: @ jump table
	.2byte _02232856 - _0223284A - 2 @ case 0
	.2byte _0223285A - _0223284A - 2 @ case 1
	.2byte _0223285A - _0223284A - 2 @ case 2
	.2byte _02232856 - _0223284A - 2 @ case 3
	.2byte _02232856 - _0223284A - 2 @ case 4
	.2byte _0223285A - _0223284A - 2 @ case 5
_02232856:
	movs r0, #1
	bx lr
_0223285A:
	movs r0, #0
	bx lr
_0223285E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232838

	thumb_func_start ov44_02232864
ov44_02232864: @ 0x02232864
	adds r2, r1, #0
	ldr r1, _02232878 @ =ov44_02232A60
	ldr r3, _0223287C @ =ov44_02232C6C
	str r1, [r2, #0x10]
	ldr r1, _02232880 @ =ov44_02232910
	str r1, [r2, #0x18]
	movs r1, #0
	strh r1, [r2, #0xc]
	bx r3
	nop
_02232878: .4byte ov44_02232A60
_0223287C: .4byte ov44_02232C6C
_02232880: .4byte ov44_02232910
	thumb_func_end ov44_02232864

	thumb_func_start ov44_02232884
ov44_02232884: @ 0x02232884
	ldr r0, _02232898 @ =ov44_02232B74
	str r0, [r1, #0x10]
	ldr r0, _0223289C @ =ov44_02232914
	str r0, [r1, #0x18]
	movs r0, #0x2d
	strh r0, [r1, #8]
	movs r0, #1
	strh r0, [r1, #0xc]
	bx lr
	nop
_02232898: .4byte ov44_02232B74
_0223289C: .4byte ov44_02232914
	thumb_func_end ov44_02232884

	thumb_func_start ov44_022328A0
ov44_022328A0: @ 0x022328A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _022328D8 @ =ov44_02232BE4
	adds r4, r1, #0
	str r0, [r4, #0x10]
	ldr r0, _022328DC @ =ov44_02232910
	str r0, [r4, #0x18]
	bl FUN_0201FDB8
	ldr r1, _022328E0 @ =0x000003FF
	adds r2, r4, #0
	ands r1, r0
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r1, r0
	strh r0, [r4, #8]
	movs r0, #3
	strh r0, [r4, #0xc]
	adds r0, r5, #0
	movs r1, #0
	bl ov44_02232C6C
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0222919C
	pop {r3, r4, r5, pc}
	nop
_022328D8: .4byte ov44_02232BE4
_022328DC: .4byte ov44_02232910
_022328E0: .4byte 0x000003FF
	thumb_func_end ov44_022328A0

	thumb_func_start ov44_022328E4
ov44_022328E4: @ 0x022328E4
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _02232908 @ =ov44_02232C30
	adds r2, r4, #0
	str r1, [r4, #0x10]
	ldr r1, _0223290C @ =ov44_022329B0
	str r1, [r4, #0x18]
	movs r1, #0x1c
	strh r1, [r4, #8]
	movs r1, #4
	strh r1, [r4, #0xc]
	bl ov44_02232C6C
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0222919C
	pop {r4, pc}
	.align 2, 0
_02232908: .4byte ov44_02232C30
_0223290C: .4byte ov44_022329B0
	thumb_func_end ov44_022328E4

	thumb_func_start ov44_02232910
ov44_02232910: @ 0x02232910
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232910

	thumb_func_start ov44_02232914
ov44_02232914: @ 0x02232914
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r0, [r4, #4]
	bl FUN_022291AC
	ldr r0, [r4, #4]
	bl FUN_022291F4
	cmp r0, #0
	bne _02232932
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02229200
_02232932:
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02228188
	add r1, sp, #0
	strh r0, [r1, #4]
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02228188
	add r1, sp, #0
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1]
	ldrh r0, [r1, #6]
	strh r0, [r1, #2]
	ldrh r0, [r4, #8]
	bl FUN_0201FBB8
	ldr r2, _022329AC @ =0xFFF40000
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x14
	blx FUN_020F2948
	movs r5, #2
	movs r6, #0
	lsls r5, r5, #0xa
	movs r3, #6
	add r2, sp, #0
	adds r5, r0, r5
	adcs r1, r6
	lsls r0, r1, #0x14
	lsrs r1, r5, #0xc
	orrs r1, r0
	ldrsh r3, [r2, r3]
	asrs r0, r1, #0xc
	adds r0, r3, r0
	strh r0, [r2, #6]
	mov r3, sp
	ldrh r1, [r2, #4]
	ldr r0, [r4, #4]
	subs r3, r3, #4
	strh r1, [r3]
	ldrh r1, [r2, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_022291D8
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r4, #4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_02229258
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_022329AC: .4byte 0xFFF40000
	thumb_func_end ov44_02232914

	thumb_func_start ov44_022329B0
ov44_022329B0: @ 0x022329B0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02228188
	add r1, sp, #0
	strh r0, [r1, #4]
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02228188
	add r1, sp, #0
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1]
	ldrh r0, [r1, #6]
	strh r0, [r1, #2]
	movs r0, #8
	ldrsh r0, [r4, r0]
	subs r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	ble _02232A26
	movs r1, #6
	blx FUN_020F2998
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	movs r0, #0xb4
	muls r0, r1, r0
	movs r1, #6
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	add r1, sp, #0
	movs r2, #6
	ldrsh r3, [r1, r2]
	asrs r2, r0, #0x1f
	lsrs r5, r0, #0x12
	lsls r2, r2, #0xe
	lsls r6, r0, #0xe
	movs r0, #2
	orrs r2, r5
	movs r5, #0
	lsls r0, r0, #0xa
	adds r6, r6, r0
	adcs r2, r5
	lsls r0, r2, #0x14
	lsrs r2, r6, #0xc
	orrs r2, r0
	asrs r0, r2, #0xc
	subs r0, r3, r0
	strh r0, [r1, #6]
_02232A26:
	add r1, sp, #0
	ldrh r2, [r1, #4]
	mov r3, sp
	ldr r0, [r4, #4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_022291D8
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r4, #4]
	subs r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl FUN_02229258
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02229218
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_022329B0

	thumb_func_start ov44_02232A60
ov44_02232A60: @ 0x02232A60
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	ldr r0, [r6]
	movs r1, #6
	bl FUN_02228188
	adds r4, r0, #0
	ldr r0, [r6]
	movs r1, #4
	bl FUN_02228188
	adds r7, r0, #0
	ldr r0, [r6]
	movs r1, #5
	bl FUN_02228188
	cmp r0, #0
	beq _02232A8A
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02232A8A:
	ldr r0, _02232B70 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02232AC4
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov44_022321C4
	str r0, [sp]
	cmp r0, #0
	beq _02232AC0
	bl ov44_02232838
	cmp r0, #1
	bne _02232ABA
	ldr r0, [sp]
	movs r1, #4
	ldr r0, [r0]
	bl FUN_02228188
	strb r0, [r6, #0xa]
	b _02232AC4
_02232ABA:
	movs r0, #0
	strb r0, [r6, #0xa]
	b _02232AC4
_02232AC0:
	movs r0, #0
	strb r0, [r6, #0xa]
_02232AC4:
	ldr r0, [r5, #0xc]
	cmp r0, #1
	bne _02232ACE
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02232ACE:
	ldr r0, _02232B70 @ =0x021D110C
	movs r1, #2
	ldr r0, [r0, #0x44]
	adds r2, r0, #0
	tst r2, r1
	beq _02232ADC
	movs r1, #3
_02232ADC:
	movs r2, #0x40
	tst r2, r0
	beq _02232B00
	cmp r4, #0
	bne _02232AF2
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232AF2:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	adds r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B00:
	movs r2, #0x80
	tst r2, r0
	beq _02232B24
	cmp r4, #1
	bne _02232B16
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B16:
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B24:
	movs r2, #0x20
	tst r2, r0
	beq _02232B48
	cmp r4, #2
	bne _02232B3A
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B3A:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #2
	adds r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B48:
	movs r2, #0x10
	tst r0, r2
	beq _02232B6A
	cmp r4, #3
	bne _02232B5E
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B5E:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	adds r3, r7, #0
	bl ov44_02232C4C
_02232B6A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232B70: .4byte 0x021D110C
	thumb_func_end ov44_02232A60

	thumb_func_start ov44_02232B74
ov44_02232B74: @ 0x02232B74
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #8
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02232BC4
	ldr r0, [r4, #4]
	bl FUN_022291B8
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0222919C
	ldr r0, _02232BC8 @ =0x000006CC
	movs r1, #4
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_02228188
	adds r6, r0, #0
	ldr r0, [r4]
	movs r1, #4
	bl FUN_02228188
	cmp r0, r6
	bne _02232BBA
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02232864
	b _02232BC4
_02232BBA:
	ldrb r2, [r4, #0xb]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02232CA8
_02232BC4:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02232BC8: .4byte 0x000006CC
	thumb_func_end ov44_02232B74

	thumb_func_start ov44_02232BCC
ov44_02232BCC: @ 0x02232BCC
	movs r0, #8
	ldrsh r2, [r1, r0]
	adds r2, r2, #1
	strh r2, [r1, #8]
	ldrsh r0, [r1, r0]
	cmp r0, #0x2d
	ble _02232BDE
	movs r0, #1
	bx lr
_02232BDE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232BCC

	thumb_func_start ov44_02232BE4
ov44_02232BE4: @ 0x02232BE4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #8
	ldrsh r1, [r5, r0]
	subs r1, r1, #1
	strh r1, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _02232C26
	bl FUN_0201FDB8
	ldr r1, _02232C2C @ =0x000003FF
	ands r1, r0
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r1, r0
	strh r0, [r5, #8]
	bl FUN_0201FDB8
	adds r4, r0, #0
	movs r1, #3
	ands r4, r1
	ldr r0, [r5]
	movs r1, #4
	bl FUN_02228188
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl ov44_02232C4C
_02232C26:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_02232C2C: .4byte 0x000003FF
	thumb_func_end ov44_02232BE4

	thumb_func_start ov44_02232C30
ov44_02232C30: @ 0x02232C30
	movs r0, #8
	ldrsh r2, [r1, r0]
	subs r2, r2, #1
	strh r2, [r1, #8]
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _02232C42
	movs r0, #0x1c
	strh r0, [r1, #8]
_02232C42:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232C30

	thumb_func_start ov44_02232C48
ov44_02232C48: @ 0x02232C48
	movs r0, #0
	bx lr
	thumb_func_end ov44_02232C48

	thumb_func_start ov44_02232C4C
ov44_02232C4C: @ 0x02232C4C
	push {r3, r4, lr}
	sub sp, #4
	add r4, sp, #0
	strh r1, [r4]
	strb r2, [r4, #2]
	ldr r1, _02232C68 @ =0x000006F8
	strb r3, [r4, #3]
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl FUN_02229A8C
	add sp, #4
	pop {r3, r4, pc}
	nop
_02232C68: .4byte 0x000006F8
	thumb_func_end ov44_02232C4C

	thumb_func_start ov44_02232C6C
ov44_02232C6C: @ 0x02232C6C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, [r4]
	movs r1, #6
	bl FUN_02228188
	adds r7, r0, #0
	ldr r0, [r4]
	movs r1, #4
	bl FUN_02228188
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov44_02232C4C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02232C6C

	thumb_func_start ov44_02232C94
ov44_02232C94: @ 0x02232C94
	ldr r1, [r0, #0x18]
	ldr r0, _02232CA4 @ =ov44_02232914
	cmp r1, r0
	beq _02232CA0
	movs r0, #1
	bx lr
_02232CA0:
	movs r0, #0
	bx lr
	.align 2, 0
_02232CA4: .4byte ov44_02232914
	thumb_func_end ov44_02232C94

	thumb_func_start ov44_02232CA8
ov44_02232CA8: @ 0x02232CA8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	beq _02232CB6
	cmp r4, #1
	beq _02232CBC
	b _02232CC2
_02232CB6:
	bl ov44_022328A0
	b _02232CC6
_02232CBC:
	bl ov44_022328E4
	b _02232CC6
_02232CC2:
	bl GF_AssertFail
_02232CC6:
	strb r4, [r5, #0xb]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_02232CA8

	thumb_func_start ov44_02232CCC
ov44_02232CCC: @ 0x02232CCC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r3, r0, #0
	adds r5, r4, #0
	movs r1, #0x14
	movs r0, #0
_02232CD8:
	strb r0, [r5]
	adds r5, r5, #1
	subs r1, r1, #1
	bne _02232CD8
	ldr r3, [r3, #4]
	adds r0, r2, #0
	movs r1, #0x20
	adds r2, r4, #4
	bl FUN_02007C48
	str r0, [r4]
	movs r0, #0xf
	strb r0, [r4, #8]
	movs r0, #0
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	lsls r1, r0, #1
	ldr r0, _02232D04 @ =0x02235600
	ldrh r0, [r0, r1]
	strh r0, [r4, #0xa]
	pop {r3, r4, r5, pc}
	nop
_02232D04: .4byte 0x02235600
	thumb_func_end ov44_02232CCC

	thumb_func_start ov44_02232D08
ov44_02232D08: @ 0x02232D08
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	movs r1, #0x14
	movs r0, #0
_02232D16:
	strb r0, [r4]
	adds r4, r4, #1
	subs r1, r1, #1
	bne _02232D16
	pop {r4, pc}
	thumb_func_end ov44_02232D08

	thumb_func_start ov44_02232D20
ov44_02232D20: @ 0x02232D20
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl ov44_02232D34
	adds r0, r4, #0
	bl ov44_02232DA0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02232D20

	thumb_func_start ov44_02232D34
ov44_02232D34: @ 0x02232D34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	subs r1, r1, #1
	strh r1, [r5, #0xa]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _02232D9A
	ldrb r0, [r5, #9]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r5, #9]
	ldrb r0, [r5, #9]
	lsls r1, r0, #1
	ldr r0, _02232D9C @ =0x02235600
	ldrh r0, [r0, r1]
	strh r0, [r5, #0xa]
	ldrb r0, [r5, #9]
	cmp r0, #1
	bne _02232D6C
	movs r6, #2
	b _02232D6E
_02232D6C:
	movs r6, #1
_02232D6E:
	movs r4, #0
	movs r7, #1
_02232D72:
	adds r0, r7, #0
	ldrb r1, [r5, #8]
	lsls r0, r4
	tst r0, r1
	beq _02232D94
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_02232E2C
	adds r1, r4, #1
	lsls r1, r1, #1
	adds r2, r0, #0
	movs r0, #0xf
	adds r1, #0xe0
	movs r3, #2
	bl FUN_020205D8
_02232D94:
	adds r4, r4, #1
	cmp r4, #4
	blt _02232D72
_02232D9A:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02232D9C: .4byte 0x02235600
	thumb_func_end ov44_02232D34

	thumb_func_start ov44_02232DA0
ov44_02232DA0: @ 0x02232DA0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrb r3, [r4, #0xd]
	movs r0, #0
	adds r1, r0, #0
	lsls r5, r3, #2
	ldr r3, _02232E1C @ =0x0223560F
	adds r2, r0, #0
	ldrb r3, [r3, r5]
	cmp r3, #1
	bne _02232DC8
	movs r3, #0xe
	ldrsh r5, [r4, r3]
	subs r5, r5, #1
	strh r5, [r4, #0xe]
	ldrsh r3, [r4, r3]
	cmp r3, #0
	bgt _02232DD2
	movs r2, #1
	b _02232DD2
_02232DC8:
	ldrb r3, [r4, #0x10]
	cmp r3, #0
	beq _02232DD2
	strb r0, [r4, #0x10]
	movs r2, #1
_02232DD2:
	cmp r2, #0
	beq _02232DFE
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #8
	blo _02232DEA
	adds r0, r4, #0
	bl ov44_02232E38
	pop {r3, r4, r5, pc}
_02232DEA:
	lsls r1, r0, #2
	ldr r0, _02232E20 @ =0x02235610
	ldrb r0, [r0, r1]
	ldr r1, _02232E24 @ =0x02235612
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0xd]
	lsls r2, r0, #2
	ldr r0, _02232E28 @ =0x02235611
	ldrb r1, [r1, r2]
	ldrb r0, [r0, r2]
_02232DFE:
	cmp r0, #0
	beq _02232E1A
	adds r0, r4, #0
	bl ov44_02232E2C
	ldrb r1, [r4, #0xc]
	adds r2, r0, #0
	movs r0, #0xf
	adds r1, r1, #1
	lsls r1, r1, #1
	adds r1, #0xe0
	movs r3, #2
	bl FUN_020205D8
_02232E1A:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02232E1C: .4byte 0x0223560F
_02232E20: .4byte 0x02235610
_02232E24: .4byte 0x02235612
_02232E28: .4byte 0x02235611
	thumb_func_end ov44_02232DA0

	thumb_func_start ov44_02232E2C
ov44_02232E2C: @ 0x02232E2C
	ldr r0, [r0, #4]
	ldr r2, [r0, #0xc]
	adds r0, r1, #1
	lsls r0, r0, #1
	adds r0, r2, r0
	bx lr
	thumb_func_end ov44_02232E2C

	thumb_func_start ov44_02232E38
ov44_02232E38: @ 0x02232E38
	ldrb r1, [r0, #0xc]
	ldrb r3, [r0, #8]
	movs r2, #1
	lsls r2, r1
	adds r1, r3, #0
	orrs r1, r2
	strb r1, [r0, #8]
	movs r1, #0
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	strh r1, [r0, #0xe]
	strb r1, [r0, #0x10]
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232E38

	thumb_func_start ov44_02232E54
ov44_02232E54: @ 0x02232E54
	movs r1, #1
	strb r1, [r0, #0x10]
	bx lr
	.align 2, 0
	thumb_func_end ov44_02232E54

	thumb_func_start ov44_02232E5C
ov44_02232E5C: @ 0x02232E5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #0xd]
	cmp r1, #0
	beq _02232E6C
	bl ov44_02232E38
_02232E6C:
	movs r0, #1
	ldrb r1, [r5, #8]
	lsls r0, r4
	eors r0, r1
	strb r0, [r5, #8]
	adds r0, r5, #0
	strb r4, [r5, #0xc]
	bl ov44_02232E54
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02232E5C

	thumb_func_start ov44_02232E80
ov44_02232E80: @ 0x02232E80
	push {r3, lr}
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _02232E8C
	bl ov44_02232E54
_02232E8C:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_02232E80

	thumb_func_start ov44_02232E90
ov44_02232E90: @ 0x02232E90
	lsls r1, r0, #2
	ldr r0, _02232E98 @ =0x02235630
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02232E98: .4byte 0x02235630
	thumb_func_end ov44_02232E90

	thumb_func_start ov44_02232E9C
ov44_02232E9C: @ 0x02232E9C
	lsls r1, r0, #2
	ldr r0, _02232EA4 @ =0x0223688C
	ldr r0, [r0, r1]
	bx lr
	.align 2, 0
_02232EA4: .4byte 0x0223688C
	thumb_func_end ov44_02232E9C

	thumb_func_start ov44_02232EA8
ov44_02232EA8: @ 0x02232EA8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	ldr r0, _02232F5C @ =0x0000002A
	movs r1, #2
	bl FUN_02006FF8
	bl FUN_02039998
	cmp r0, #1
	beq _02232EC6
	bl GF_AssertFail
_02232EC6:
	movs r0, #3
	movs r1, #0x67
	lsls r2, r0, #0xf
	bl FUN_0201A910
	movs r2, #0xa
	movs r0, #3
	movs r1, #0x68
	lsls r2, r2, #0xc
	bl FUN_0201A910
	movs r1, #0x8a
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x67
	bl FUN_02007280
	movs r2, #0x8a
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #1
	movs r2, #4
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #1
	movs r2, #4
	blx FUN_020D4994
	movs r0, #0x10
	movs r1, #0x67
	bl FUN_0202055C
	bl FUN_020398C8
	adds r1, r0, #0
	str r0, [r4]
	adds r1, #0x22
	ldrb r1, [r1]
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r4, #0
	bl ov44_022331B0
	strb r0, [r4, #4]
	movs r0, #0xff
	strb r0, [r4, #6]
	adds r0, r4, #0
	bl FUN_020971F8
	adds r0, r4, #0
	bl ov44_02234028
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x67
	bl ov44_022331C4
	ldr r0, _02232F60 @ =ov44_0223319C
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_0203A880
	movs r0, #1
	adds r4, #0x27
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02232F5C: .4byte 0x0000002A
_02232F60: .4byte ov44_0223319C
	thumb_func_end ov44_02232EA8

	thumb_func_start ov44_02232F64
ov44_02232F64: @ 0x02232F64
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_020072A4
	adds r7, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bls _02232F82
	b _0223308A
_02232F82:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02232F8E: @ jump table
	.2byte _02232F98 - _02232F8E - 2 @ case 0
	.2byte _02232FB6 - _02232F8E - 2 @ case 1
	.2byte _02232FC6 - _02232F8E - 2 @ case 2
	.2byte _0223305C - _02232F8E - 2 @ case 3
	.2byte _0223307C - _02232F8E - 2 @ case 4
_02232F98:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x67
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0223308A
_02232FB6:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223308A
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0223308A
_02232FC6:
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	beq _02232FDA
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x67
	bl ov44_02233D8C
_02232FDA:
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _0223300C
	bl FUN_02034420
	cmp r0, #1
	bne _02232FF8
	adds r0, r4, #0
	bl ov44_0223438C
	bl FUN_02034638
	adds r0, r4, #0
	bl ov44_02234248
_02232FF8:
	ldrb r3, [r4, #5]
	adds r0, r4, #0
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _022330A0 @ =0x022365B8
	movs r2, #0x67
	ldr r3, [r3, r6]
	blx r3
	adds r6, r0, #0
	b _0223302E
_0223300C:
	ldrb r3, [r4, #5]
	adds r0, r4, #0
	adds r1, r7, #0
	lsls r6, r3, #2
	ldr r3, _022330A4 @ =0x02236540
	movs r2, #0x67
	ldr r3, [r3, r6]
	blx r3
	adds r6, r0, #0
	bl FUN_02034420
	cmp r0, #1
	bne _0223302E
	adds r0, r4, #0
	movs r1, #0x67
	bl ov44_0223427C
_0223302E:
	adds r0, r4, #0
	bl ov44_0223407C
	cmp r0, #0
	beq _02233042
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0x67
	bl ov44_02233A50
_02233042:
	adds r0, r4, #0
	bl ov44_022341C0
	cmp r6, #1
	bne _0223308A
	ldrb r0, [r4, #7]
	strb r0, [r7, #3]
	ldrb r0, [r4, #0x11]
	strb r0, [r7, #4]
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0223308A
_0223305C:
	movs r0, #6
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x67
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _0223308A
_0223307C:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223308A
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0223308A:
	adds r0, r4, #0
	adds r0, #0x30
	bl ov44_02233CCC
	ldr r0, [r4, #0x48]
	bl FUN_0202457C
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022330A0: .4byte 0x022365B8
_022330A4: .4byte 0x02236540
	thumb_func_end ov44_02232F64

	thumb_func_start ov44_022330A8
ov44_022330A8: @ 0x022330A8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_020072A4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov44_02234038
	adds r0, r4, #0
	bl ov44_02234204
	adds r0, r4, #0
	bl ov44_02233F20
	adds r0, r4, #0
	movs r1, #0x67
	bl ov44_02233214
	bl FUN_020205AC
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x68
	bl FUN_0201A9C4
	movs r0, #0x67
	bl FUN_0201A9C4
	ldr r0, _022330FC @ =0x0000002A
	bl FUN_02006F7C
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_022330FC: .4byte 0x0000002A
	thumb_func_end ov44_022330A8

	thumb_func_start ov44_02233100
ov44_02233100: @ 0x02233100
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #4]
	adds r4, r1, #0
	cmp r0, #0
	bne _0223315E
	ldrh r6, [r4]
	bl FUN_0203769C
	cmp r6, r0
	ldr r0, [r4, #4]
	bne _02233138
	cmp r0, #0
	beq _0223312C
	cmp r0, #1
	beq _02233126
	cmp r0, #2
	beq _02233132
	pop {r4, r5, r6, pc}
_02233126:
	movs r0, #1
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_0223312C:
	movs r0, #2
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_02233132:
	movs r0, #3
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_02233138:
	cmp r0, #0
	beq _02233150
	cmp r0, #1
	beq _02233146
	cmp r0, #2
	beq _02233150
	pop {r4, r5, r6, pc}
_02233146:
	adds r0, r5, r6
	movs r1, #1
	adds r0, #0x28
	strb r1, [r0]
	pop {r4, r5, r6, pc}
_02233150:
	bl FUN_02034420
	cmp r0, #1
	bne _0223315E
	ldrh r0, [r4]
	bl FUN_020346E8
_0223315E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_02233100

	thumb_func_start ov44_02233160
ov44_02233160: @ 0x02233160
	push {r3, lr}
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #0
	bne _02233178
	movs r1, #1
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xd
	bl FUN_02037AC0
_02233178:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_02233160

	thumb_func_start ov44_0223317C
ov44_0223317C: @ 0x0223317C
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _02233198
	ldrb r2, [r1]
	adds r3, r0, #0
	adds r0, #0x20
	strb r2, [r0]
	ldrb r0, [r1, #1]
	adds r3, #0x20
	strb r0, [r3, #1]
	ldrb r0, [r1, #2]
	strb r0, [r3, #2]
	ldrb r0, [r1, #3]
	strb r0, [r3, #3]
_02233198:
	bx lr
	.align 2, 0
	thumb_func_end ov44_0223317C

	thumb_func_start ov44_0223319C
ov44_0223319C: @ 0x0223319C
	push {r3, lr}
	ldr r0, [r0, #0x30]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_0223319C

	thumb_func_start ov44_022331B0
ov44_022331B0: @ 0x022331B0
	push {r3, lr}
	bl FUN_0203769C
	cmp r0, #0
	bne _022331BE
	movs r0, #1
	pop {r3, pc}
_022331BE:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_022331B0

	thumb_func_start ov44_022331C4
ov44_022331C4: @ 0x022331C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov44_0223323C
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r6, #0
	bl ov44_0223325C
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_02233444
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_0223362C
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_02233698
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_02233A50
	adds r5, #0x30
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov44_0223376C
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022331C4

	thumb_func_start ov44_02233214
ov44_02233214: @ 0x02233214
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x30
	adds r4, r1, #0
	bl ov44_02233820
	adds r0, r5, #0
	adds r0, #0x30
	bl ov44_02233678
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	bl ov44_022335AC
	adds r5, #0x30
	adds r0, r5, #0
	bl ov44_0223340C
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02233214

	thumb_func_start ov44_0223323C
ov44_0223323C: @ 0x0223323C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02233258 @ =0x022364E8
	add r3, sp, #0
	movs r2, #5
_02233246:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02233246
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_02233258: .4byte 0x022364E8
	thumb_func_end ov44_0223323C

	thumb_func_start ov44_0223325C
ov44_0223325C: @ 0x0223325C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x74
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0201AC88
	add r3, sp, #0x64
	ldr r6, _022333FC @ =0x02236474
	str r0, [r5]
	adds r2, r3, #0
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r6, _02233400 @ =0x022364B0
	add r3, sp, #0x48
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #0
	str r0, [r3]
	ldr r0, [r5]
	adds r3, r1, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r6, _02233404 @ =0x02236494
	add r3, sp, #0x2c
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #1
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r6, _02233408 @ =0x022364CC
	add r3, sp, #0x10
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #2
	str r0, [r3]
	ldr r0, [r5]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	adds r3, r4, #0
	bl FUN_0201C1C4
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201CAE0
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
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
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x58
	adds r1, r4, #0
	bl FUN_02007688
	movs r1, #0x20
	str r1, [sp]
	movs r1, #0xe
	movs r2, #0
	movs r3, #0xa0
	adds r6, r0, #0
	str r4, [sp, #4]
	bl FUN_02007B8C
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0xd
	movs r3, #2
	bl FUN_02007B44
	movs r3, #0x79
	lsls r3, r3, #2
	adds r0, r6, #0
	movs r1, #0xf
	movs r2, #0
	adds r3, r5, r3
	str r4, [sp]
	bl FUN_02007C2C
	movs r2, #0x1e
	lsls r2, r2, #4
	str r0, [r5, r2]
	adds r2, #0x10
	adds r0, r6, #0
	movs r1, #0x2d
	adds r2, r5, r2
	adds r3, r4, #0
	bl FUN_02007C48
	movs r1, #0x7b
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0x2e
	bl FUN_02007B44
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r1, #0x2f
	bl FUN_02007B68
	adds r0, r5, #0
	movs r1, #0
	bl ov44_02233D08
	movs r0, #0x7d
	movs r1, #3
	lsls r0, r0, #2
	strh r1, [r5, r0]
	movs r1, #1
	adds r0, r0, #2
	strh r1, [r5, r0]
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x74
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022333FC: .4byte 0x02236474
_02233400: .4byte 0x022364B0
_02233404: .4byte 0x02236494
_02233408: .4byte 0x022364CC
	thumb_func_end ov44_0223325C

	thumb_func_start ov44_0223340C
ov44_0223340C: @ 0x0223340C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r4]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov44_0223340C

	thumb_func_start ov44_02233444
ov44_02233444: @ 0x02233444
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0
	movs r1, #0x20
	adds r4, r2, #0
	bl FUN_0200304C
	ldr r0, [r6, #8]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	movs r1, #1
	ldr r0, [r5]
	adds r2, r1, #0
	movs r3, #2
	bl FUN_0200E644
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5]
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5]
	movs r1, #2
	movs r2, #0x30
	movs r3, #4
	bl FUN_0200E3DC
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r2, #1
	movs r1, #0x63
	lsls r1, r1, #2
	str r2, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r5, r1
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x63
	lsls r0, r0, #2
	movs r1, #1
	adds r0, r5, r0
	adds r2, r1, #0
	movs r3, #2
	bl FUN_0200E998
	movs r2, #1
	movs r1, #0x67
	lsls r1, r1, #2
	str r2, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	movs r1, #0xca
	str r1, [sp, #0x10]
	adds r1, #0xe2
	ldr r0, [r5]
	adds r1, r5, r1
	bl FUN_0201D40C
	movs r0, #0x6b
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #5
	str r0, [sp]
	movs r0, #0x14
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r2, #1
	movs r1, #0x6f
	lsls r1, r1, #2
	str r2, [sp, #0xc]
	adds r0, #0xfa
	str r0, [sp, #0x10]
	ldr r0, [r5]
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r1, #5
	str r1, [sp]
	movs r0, #7
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r2, #1
	ldr r1, _022335A8 @ =0x000001A2
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, #0x2a
	ldr r0, [r5]
	adds r1, r5, r1
	movs r3, #0x17
	bl FUN_0201D40C
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022335A8: .4byte 0x000001A2
	thumb_func_end ov44_02233444

	thumb_func_start ov44_022335AC
ov44_022335AC: @ 0x022335AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov44_02233954
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x6b
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0200E5D4
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D520
	movs r0, #0x77
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02233628
	adds r1, r4, #0
	bl FUN_02001FFC
_02233628:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_022335AC

	thumb_func_start ov44_0223362C
ov44_0223362C: @ 0x0223362C
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r4, r1, #0
	bl FUN_0200BD08
	str r0, [r5, #4]
	ldr r2, _02233674 @ =0x0000030A
	movs r0, #0
	movs r1, #0x1b
	adds r3, r6, #0
	bl FUN_0200BAF8
	str r0, [r5, #8]
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0xc]
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0x10]
	movs r0, #0xff
	strb r0, [r5, #0x14]
	ldr r0, [r4, #8]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	strh r0, [r5, #0x16]
	pop {r4, r5, r6, pc}
	.align 2, 0
_02233674: .4byte 0x0000030A
	thumb_func_end ov44_0223362C

	thumb_func_start ov44_02233678
ov44_02233678: @ 0x02233678
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02026380
	ldr r0, [r4, #0xc]
	bl FUN_02026380
	ldr r0, [r4, #8]
	bl FUN_0200BB44
	ldr r0, [r4, #4]
	bl FUN_0200BDA0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02233678

	thumb_func_start ov44_02233698
ov44_02233698: @ 0x02233698
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #3
	bhi _022336DC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022336B2: @ jump table
	.2byte _022336DC - _022336B2 - 2 @ case 0
	.2byte _022336BA - _022336B2 - 2 @ case 1
	.2byte _022336C6 - _022336B2 - 2 @ case 2
	.2byte _022336D2 - _022336B2 - 2 @ case 3
_022336BA:
	movs r1, #0
	ldr r0, [r4, #4]
	adds r2, r1, #0
	bl FUN_0200C74C
	b _022336DC
_022336C6:
	ldr r0, [r4, #4]
	movs r1, #0
	movs r2, #1
	bl FUN_0200C74C
	b _022336DC
_022336D2:
	ldr r0, [r4, #4]
	movs r1, #0
	movs r2, #2
	bl FUN_0200C74C
_022336DC:
	ldrb r2, [r5]
	ldr r1, _02233760 @ =0x0223689C
	ldr r0, [r4, #8]
	ldrb r1, [r1, r2]
	ldr r2, [r4, #0x10]
	bl FUN_0200BB6C
	ldr r0, [r4, #4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233764 @ =0x0001020F
	adds r2, #0x9d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, r2
	ldr r2, [r4, #0xc]
	adds r3, r1, #0
	bl FUN_020200FC
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	ldr r0, [r4, #8]
	ldr r2, [r4, #0xc]
	movs r1, #0x80
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233768 @ =0x00010200
	adds r2, #0xad
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, r2
	ldr r2, [r4, #0xc]
	adds r3, r1, #0
	bl FUN_020200FC
	movs r0, #0x6b
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02233760: .4byte 0x0223689C
_02233764: .4byte 0x0001020F
_02233768: .4byte 0x00010200
	thumb_func_end ov44_02233698

	thumb_func_start ov44_0223376C
ov44_0223376C: @ 0x0223376C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r7, r0, #0
	adds r6, r1, #0
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
	ldr r4, _02233818 @ =0x02236484
	add r3, sp, #0x14
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	ldr r1, _0223381C @ =0x00200010
	movs r2, #0x10
	str r6, [sp, #0x20]
	bl FUN_020215C0
	movs r0, #4
	adds r1, r6, #0
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	ldr r1, _0223381C @ =0x00200010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	adds r1, r7, #0
	movs r0, #4
	adds r1, #0x1c
	adds r2, r6, #0
	bl FUN_02009F40
	str r0, [r7, #0x18]
	movs r4, #0
	adds r5, r7, #0
_022337D8:
	movs r0, #4
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200A090
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022337D8
	movs r0, #4
	adds r1, r6, #0
	bl FUN_02228010
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r7, r1]
	str r6, [sp]
	ldr r0, [r7, #0x18]
	movs r1, #0
	movs r2, #4
	movs r3, #1
	bl FUN_02228EDC
	movs r1, #0x56
	lsls r1, r1, #2
	str r0, [r7, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02233818: .4byte 0x02236484
_0223381C: .4byte 0x00200010
	thumb_func_end ov44_0223376C

	thumb_func_start ov44_02233820
ov44_02233820: @ 0x02233820
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x56
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02228F94
	movs r0, #0x55
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02228050
	ldr r0, [r5, #0x18]
	bl FUN_02024504
	movs r6, #0x51
	movs r4, #0
	lsls r6, r6, #2
_02233844:
	ldr r0, [r5, r6]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02233844
	bl FUN_0202168C
	bl FUN_02022608
	bl FUN_0200B244
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_02233820

	thumb_func_start ov44_02233860
ov44_02233860: @ 0x02233860
	push {r3, lr}
	str r3, [sp]
	movs r3, #0
	bl ov44_0223386C
	pop {r3, pc}
	thumb_func_end ov44_02233860

	thumb_func_start ov44_0223386C
ov44_0223386C: @ 0x0223386C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldrb r0, [r5, #0x14]
	adds r4, r1, #0
	adds r6, r3, #0
	str r2, [sp, #0x10]
	cmp r0, #0xff
	beq _02233890
	bl FUN_02020094
	cmp r0, #0
	beq _02233890
	ldrb r0, [r5, #0x14]
	bl FUN_020200A0
	movs r0, #0xff
	strb r0, [r5, #0x14]
_02233890:
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #1
	ldr r1, [sp, #0x28]
	lsls r0, r0, #8
	bl FUN_02026354
	adds r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x10]
	adds r2, r7, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	ldr r1, [r5, #0xc]
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	ldrh r0, [r5, #0x16]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, _02233910 @ =0x0001020F
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0x63
	lsls r0, r0, #2
	ldr r2, [r5, #0xc]
	adds r0, r5, r0
	bl FUN_020200FC
	strb r0, [r5, #0x14]
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, [r4, #8]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x28]
	movs r1, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	adds r2, r1, #0
	movs r3, #2
	bl FUN_0200E644
	strb r6, [r5, #0x15]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02233910: .4byte 0x0001020F
	thumb_func_end ov44_0223386C

	thumb_func_start ov44_02233914
ov44_02233914: @ 0x02233914
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	bne _0223392C
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _0223393E
	subs r0, r0, #1
	strb r0, [r4, #0x15]
	movs r0, #0
	pop {r4, pc}
_0223392C:
	bl FUN_02020094
	cmp r0, #0
	bne _0223393E
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	beq _0223393E
	movs r0, #0xff
	strb r0, [r4, #0x14]
_0223393E:
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	bne _0223394E
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0223394E
	movs r0, #1
	pop {r4, pc}
_0223394E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02233914

	thumb_func_start ov44_02233954
ov44_02233954: @ 0x02233954
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	beq _02233970
	bl FUN_02020094
	cmp r0, #0
	beq _0223396C
	ldrb r0, [r4, #0x14]
	bl FUN_020200A0
_0223396C:
	movs r0, #0xff
	strb r0, [r4, #0x14]
_02233970:
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	movs r0, #0
	strb r0, [r4, #0x15]
	pop {r4, pc}
	thumb_func_end ov44_02233954

	thumb_func_start ov44_0223398C
ov44_0223398C: @ 0x0223398C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #1
	adds r4, r3, #0
	str r1, [sp, #0x10]
	lsls r0, r0, #8
	adds r1, r4, #0
	str r2, [sp, #0x14]
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r4, #0
	bl FUN_02026354
	adds r7, r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0
	str r4, [sp]
	bl ov44_02233C88
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	str r4, [sp]
	adds r0, r5, #0
	movs r3, #1
	bl ov44_02233CA0
	ldr r0, [r5, #8]
	movs r1, #0x83
	adds r2, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_0200CBBC
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #0xf
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233A30 @ =0x0001020F
	adds r2, #0xcd
	str r0, [sp, #8]
	adds r0, r5, r2
	adds r2, r7, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	movs r2, #0x1f
	movs r3, #3
	bl FUN_0200E580
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02233A30: .4byte 0x0001020F
	thumb_func_end ov44_0223398C

	thumb_func_start ov44_02233A34
ov44_02233A34: @ 0x02233A34
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200E5D4
	movs r0, #0x73
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	pop {r4, pc}
	thumb_func_end ov44_02233A34

	thumb_func_start ov44_02233A50
ov44_02233A50: @ 0x02233A50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	adds r7, r1, #0
	adds r5, r2, #0
	bl FUN_02034420
	cmp r0, #0
	beq _02233AB2
	ldr r6, [sp, #4]
	movs r4, #0
	adds r6, #0x30
_02233A68:
	cmp r4, #0
	bne _02233A86
	adds r0, r4, #0
	bl FUN_02034730
	cmp r0, #1
	bne _02233A86
	ldr r0, [sp, #4]
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r4, #0
	str r5, [sp]
	bl ov44_02233AB8
	b _02233AAC
_02233A86:
	adds r0, r4, #0
	bl FUN_02034750
	cmp r0, #1
	bne _02233AA0
	ldr r0, [sp, #4]
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r4, #0
	str r5, [sp]
	bl ov44_02233AB8
	b _02233AAC
_02233AA0:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl ov44_02233C18
_02233AAC:
	adds r4, r4, #1
	cmp r4, #4
	blt _02233A68
_02233AB2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02233A50

	thumb_func_start ov44_02233AB8
ov44_02233AB8: @ 0x02233AB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r7, [sp, #0x40]
	str r0, [sp, #0x1c]
	movs r0, #1
	adds r5, r1, #0
	lsls r0, r0, #8
	adds r1, r7, #0
	str r2, [sp, #0x20]
	adds r4, r3, #0
	bl FUN_02026354
	str r0, [sp, #0x28]
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r7, #0
	bl FUN_02026354
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	str r7, [sp]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov44_02233C88
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x28]
	movs r1, #0x81
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl FUN_0200CBBC
	movs r0, #0xa0
	str r0, [sp]
	movs r0, #0x10
	lsls r6, r4, #4
	str r0, [sp, #4]
	movs r0, #0x6f
	lsls r0, r0, #2
	lsls r3, r6, #0x10
	adds r0, r5, r0
	movs r1, #0xf
	movs r2, #0
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	movs r1, #0
	str r6, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233C14 @ =0x0001020F
	adds r2, #0xbd
	str r0, [sp, #8]
	adds r0, r5, r2
	ldr r2, [sp, #0x24]
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r1, [sp, #0x20]
	str r7, [sp]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl ov44_02233CA0
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x28]
	movs r1, #0x82
	bl FUN_0200BB6C
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl FUN_0200CBBC
	str r6, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233C14 @ =0x0001020F
	adds r2, #0xbd
	str r0, [sp, #8]
	adds r0, r5, r2
	movs r1, #0
	ldr r2, [sp, #0x24]
	movs r3, #0x48
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	bl FUN_0203769C
	cmp r4, r0
	bne _02233B98
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _02233B94
	movs r2, #2
	b _02233BAA
_02233B94:
	movs r2, #1
	b _02233BAA
_02233B98:
	ldr r0, [sp, #0x1c]
	adds r0, r0, r4
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02233BA8
	movs r2, #2
	b _02233BAA
_02233BA8:
	movs r2, #1
_02233BAA:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	lsls r1, r4, #1
	adds r4, r1, #5
	movs r1, #2
	str r1, [sp]
	adds r3, r0, #0
	lsls r2, r2, #0x19
	str r1, [sp, #4]
	adds r3, #0xc
	str r3, [sp, #8]
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0x12
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl FUN_0201C4EC
	movs r1, #2
	str r1, [sp]
	lsls r3, r4, #0x18
	str r1, [sp, #4]
	movs r0, #5
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r2, #0x12
	lsrs r3, r3, #0x18
	bl FUN_0201CA4C
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	ldr r0, [sp, #0x28]
	bl FUN_02026380
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02233C14: .4byte 0x0001020F
	thumb_func_end ov44_02233AB8

	thumb_func_start ov44_02233C18
ov44_02233C18: @ 0x02233C18
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	movs r0, #0xa0
	adds r4, r2, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0x6f
	lsls r0, r0, #2
	lsls r3, r4, #0x14
	adds r0, r5, r0
	movs r1, #0xf
	movs r2, #0
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #2
	str r1, [sp]
	adds r2, r0, #0
	lsls r3, r4, #1
	adds r3, r3, #5
	lsls r3, r3, #0x18
	str r1, [sp, #4]
	adds r2, #0xc
	str r2, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0x12
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl FUN_0201C4EC
	ldr r0, [r5]
	movs r1, #2
	bl FUN_0201EFBC
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov44_02233C18

	thumb_func_start ov44_02233C88
ov44_02233C88: @ 0x02233C88
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl FUN_0200BE48
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02233C88

	thumb_func_start ov44_02233CA0
ov44_02233CA0: @ 0x02233CA0
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r2, #0
	adds r4, r3, #0
	bl FUN_02034818
	bl FUN_02028F88
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	adds r1, r4, #0
	movs r3, #5
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_02233CA0

	thumb_func_start ov44_02233CCC
ov44_02233CCC: @ 0x02233CCC
	push {r4, lr}
	movs r1, #0x7d
	adds r4, r0, #0
	lsls r1, r1, #2
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bgt _02233CFC
	adds r1, r1, #2
	ldrsh r1, [r4, r1]
	bl ov44_02233D08
	movs r0, #0x7d
	movs r1, #3
	lsls r0, r0, #2
	strh r1, [r4, r0]
	adds r0, r0, #2
	ldrsh r0, [r4, r0]
	movs r1, #0x12
	adds r0, r0, #1
	blx FUN_020F2998
	ldr r0, _02233D04 @ =0x000001F6
	strh r1, [r4, r0]
	pop {r4, pc}
_02233CFC:
	subs r0, r2, #1
	strh r0, [r4, r1]
	pop {r4, pc}
	nop
_02233D04: .4byte 0x000001F6
	thumb_func_end ov44_02233CCC

	thumb_func_start ov44_02233D08
ov44_02233D08: @ 0x02233D08
	push {r4, lr}
	movs r2, #0x1f
	adds r3, r0, #0
	lsls r2, r2, #4
	ldr r2, [r3, r2]
	adds r4, r1, #0
	ldr r3, [r2, #0xc]
	ldr r2, _02233D34 @ =0x0223663C
	movs r0, #0xf
	ldrb r2, [r2, r4]
	movs r1, #0
	lsls r2, r2, #5
	adds r2, r3, r2
	movs r3, #0x20
	bl FUN_020205D8
	cmp r0, #0
	bne _02233D30
	bl GF_AssertFail
_02233D30:
	pop {r4, pc}
	nop
_02233D34: .4byte 0x0223663C
	thumb_func_end ov44_02233D08

	thumb_func_start ov44_02233D38
ov44_02233D38: @ 0x02233D38
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x22
	ldrb r1, [r0]
	movs r0, #1
	adds r2, #0x22
	subs r0, r0, r1
	strb r0, [r2]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl FUN_021E70B8
	ldr r0, [r4]
	movs r1, #0x24
	bl FUN_021E6D60
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02233D7C
	adds r0, r4, #0
	bl ov44_02233F3C
	b _02233D82
_02233D7C:
	adds r0, r4, #0
	bl ov44_02233F50
_02233D82:
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02233D38

	thumb_func_start ov44_02233D8C
ov44_02233D8C: @ 0x02233D8C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #4]
	cmp r0, #0
	ldrb r0, [r4, #5]
	beq _02233DC0
	adds r0, #0xe5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _02233E44
	bl FUN_020390C4
	cmp r0, #2
	bgt _02233DD6
	adds r0, r4, #0
	bl ov44_02233F64
	cmp r0, #1
	bgt _02233DD6
	adds r0, r4, #0
	bl ov44_02233E6C
	cmp r0, #0
	bne _02233DD6
	pop {r3, r4, r5, r6, r7, pc}
_02233DC0:
	cmp r0, #0xf
	beq _02233E44
	cmp r0, #0x10
	beq _02233E44
	cmp r0, #0x11
	beq _02233E44
	adds r0, #0xfa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _02233E44
_02233DD6:
	adds r0, r4, #0
	bl ov44_02234458
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov44_02234044
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov44_02233F64
	adds r5, r0, #0
	bl FUN_02037454
	cmp r5, r0
	ble _02233DFA
	movs r5, #1
	b _02233DFC
_02233DFA:
	movs r5, #0
_02233DFC:
	bl FUN_020390C4
	cmp r0, #3
	bge _02233E34
	bl FUN_020393C8
	cmp r0, #0
	bne _02233E34
	bl FUN_02039264
	cmp r0, #0
	bne _02233E34
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #0
	beq _02233E34
	adds r0, r4, #0
	bl ov44_02233E6C
	cmp r0, #0
	beq _02233E34
	cmp r5, #1
	beq _02233E34
	cmp r6, #1
	beq _02233E34
	cmp r7, #1
	bne _02233E44
_02233E34:
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _02233E40
	movs r0, #0x1b
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, r7, pc}
_02233E40:
	movs r0, #0xf
	strb r0, [r4, #5]
_02233E44:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02233D8C

	thumb_func_start ov44_02233E48
ov44_02233E48: @ 0x02233E48
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_020390C4
	cmp r0, #3
	bgt _02233E64
	bl FUN_02039264
	cmp r0, #0
	bne _02233E64
	bl FUN_020393C8
	cmp r0, #0
	beq _02233E68
_02233E64:
	movs r0, #0xf
	strb r0, [r4, #5]
_02233E68:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02233E48

	thumb_func_start ov44_02233E6C
ov44_02233E6C: @ 0x02233E6C
	push {r3, lr}
	bl FUN_02037454
	cmp r0, #0
	ble _02233E7A
	movs r0, #1
	pop {r3, pc}
_02233E7A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_02233E6C

	thumb_func_start ov44_02233E80
ov44_02233E80: @ 0x02233E80
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02039080
	adds r5, r0, #0
	cmp r5, #1
	bne _02233EB0
	cmp r4, #3
	bhi _02233EB0
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02233E9E: @ jump table
	.2byte _02233EA6 - _02233E9E - 2 @ case 0
	.2byte _02233EAC - _02233E9E - 2 @ case 1
	.2byte _02233EAC - _02233E9E - 2 @ case 2
	.2byte _02233EAC - _02233E9E - 2 @ case 3
_02233EA6:
	bl FUN_02039AF8
	b _02233EB0
_02233EAC:
	bl FUN_02039B18
_02233EB0:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02233E80

	thumb_func_start ov44_02233EB4
ov44_02233EB4: @ 0x02233EB4
	ldrb r1, [r1]
	cmp r1, #3
	bhi _02233EEC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02233EC6: @ jump table
	.2byte _02233ECE - _02233EC6 - 2 @ case 0
	.2byte _02233ED6 - _02233EC6 - 2 @ case 1
	.2byte _02233EDE - _02233EC6 - 2 @ case 2
	.2byte _02233EE6 - _02233EC6 - 2 @ case 3
_02233ECE:
	ldr r1, [r0]
	movs r2, #0x12
	strb r2, [r1, #0x1b]
	b _02233EEC
_02233ED6:
	ldr r1, [r0]
	movs r2, #0x16
	strb r2, [r1, #0x1b]
	b _02233EEC
_02233EDE:
	ldr r1, [r0]
	movs r2, #0x18
	strb r2, [r1, #0x1b]
	b _02233EEC
_02233EE6:
	ldr r1, [r0]
	movs r2, #0x1a
	strb r2, [r1, #0x1b]
_02233EEC:
	ldr r3, _02233EF4 @ =FUN_021E6D60
	ldr r0, [r0]
	movs r1, #0x24
	bx r3
	.align 2, 0
_02233EF4: .4byte FUN_021E6D60
	thumb_func_end ov44_02233EB4

	thumb_func_start ov44_02233EF8
ov44_02233EF8: @ 0x02233EF8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x11]
	cmp r1, #1
	bne _02233F06
	movs r0, #0
	pop {r4, pc}
_02233F06:
	bl ov44_02233E6C
	cmp r0, #1
	bne _02233F1A
	movs r0, #0x68
	bl FUN_021E69A8
	movs r0, #1
	strb r0, [r4, #0x11]
	pop {r4, pc}
_02233F1A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02233EF8

	thumb_func_start ov44_02233F20
ov44_02233F20: @ 0x02233F20
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _02233F2E
	movs r0, #0
	pop {r4, pc}
_02233F2E:
	bl FUN_021E6A4C
	movs r0, #0
	strb r0, [r4, #0x11]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02233F20

	thumb_func_start ov44_02233F3C
ov44_02233F3C: @ 0x02233F3C
	push {r3, lr}
	bl ov44_02233EF8
	cmp r0, #0
	beq _02233F4E
	bl FUN_02004A90
	bl FUN_02005448
_02233F4E:
	pop {r3, pc}
	thumb_func_end ov44_02233F3C

	thumb_func_start ov44_02233F50
ov44_02233F50: @ 0x02233F50
	push {r3, lr}
	bl ov44_02233F20
	cmp r0, #0
	beq _02233F62
	movs r0, #0
	movs r1, #0x78
	bl FUN_0200542C
_02233F62:
	pop {r3, pc}
	thumb_func_end ov44_02233F50

	thumb_func_start ov44_02233F64
ov44_02233F64: @ 0x02233F64
	ldr r3, _02233F68 @ =FUN_020347A0
	bx r3
	.align 2, 0
_02233F68: .4byte FUN_020347A0
	thumb_func_end ov44_02233F64

	thumb_func_start ov44_02233F6C
ov44_02233F6C: @ 0x02233F6C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #1
	bl FUN_0203769C
	subs r4, r0, #1
	bmi _02233FA2
_02233F7C:
	adds r0, r4, #0
	bl FUN_02034714
	cmp r0, #1
	bne _02233F92
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022340BC
	b _02233F9E
_02233F92:
	adds r0, r4, #0
	bl FUN_02034750
	cmp r0, #0
	bne _02233F9E
	movs r7, #0
_02233F9E:
	subs r4, r4, #1
	bpl _02233F7C
_02233FA2:
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02233F6C

	thumb_func_start ov44_02233FA8
ov44_02233FA8: @ 0x02233FA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #1
	movs r6, #0x16
	add r7, sp, #0
	add r4, sp, #0
_02233FB8:
	adds r0, r5, #0
	bl FUN_02034714
	cmp r0, #1
	bne _02233FDC
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #8
	strh r5, [r4]
	bl FUN_02037030
	cmp r0, #1
	beq _02233FD6
	bl GF_AssertFail
_02233FD6:
	adds r0, r5, #0
	bl FUN_020346E8
_02233FDC:
	adds r5, r5, #1
	cmp r5, #4
	blt _02233FB8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02233FA8

	thumb_func_start ov44_02233FE8
ov44_02233FE8: @ 0x02233FE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #1
	movs r6, #0x16
	add r7, sp, #0
	add r4, sp, #0
_02233FF8:
	adds r0, r5, #0
	bl FUN_02034730
	cmp r0, #1
	bne _0223401C
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #8
	strh r5, [r4]
	bl FUN_02037030
	cmp r0, #1
	beq _02234016
	bl GF_AssertFail
_02234016:
	adds r0, r5, #0
	bl FUN_020346E8
_0223401C:
	adds r5, r5, #1
	cmp r5, #4
	blt _02233FF8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_02233FE8

	thumb_func_start ov44_02234028
ov44_02234028: @ 0x02234028
	ldr r3, _02234030 @ =FUN_021E5CA0
	adds r1, r0, #0
	ldr r0, _02234034 @ =ov44_02234070
	bx r3
	.align 2, 0
_02234030: .4byte FUN_021E5CA0
_02234034: .4byte ov44_02234070
	thumb_func_end ov44_02234028

	thumb_func_start ov44_02234038
ov44_02234038: @ 0x02234038
	ldr r3, _02234040 @ =FUN_021E5CA0
	movs r0, #0
	adds r1, r0, #0
	bx r3
	.align 2, 0
_02234040: .4byte FUN_021E5CA0
	thumb_func_end ov44_02234038

	thumb_func_start ov44_02234044
ov44_02234044: @ 0x02234044
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0
	adds r6, r0, #0
	adds r4, r7, #0
_0223404C:
	adds r5, r6, r4
	ldrb r0, [r5, #0x14]
	cmp r0, #1
	bne _02234066
	ldrb r0, [r5, #0x18]
	bl FUN_02034750
	cmp r0, #1
	bne _02234060
	movs r7, #1
_02234060:
	movs r0, #0
	strb r0, [r5, #0x14]
	strb r0, [r5, #0x18]
_02234066:
	adds r4, r4, #1
	cmp r4, #4
	blt _0223404C
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02234044

	thumb_func_start ov44_02234070
ov44_02234070: @ 0x02234070
	movs r2, #1
	adds r1, r1, r0
	strb r2, [r1, #0x14]
	strb r0, [r1, #0x18]
	bx lr
	.align 2, 0
	thumb_func_end ov44_02234070

	thumb_func_start ov44_0223407C
ov44_0223407C: @ 0x0223407C
	push {r3, r4, r5, r6}
	movs r4, #0
	adds r3, r4, #0
	movs r2, #1
_02234084:
	adds r6, r0, r3
	adds r1, r6, #0
	adds r1, #0x20
	ldrb r5, [r1]
	ldrb r1, [r6, #0x1c]
	cmp r1, r5
	beq _02234094
	adds r4, r2, #0
_02234094:
	adds r3, r3, #1
	strb r5, [r6, #0x1c]
	cmp r3, #4
	blt _02234084
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0
	beq _022340AE
	movs r1, #0
	adds r0, #0x24
	strb r1, [r0]
	movs r4, #1
_022340AE:
	adds r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov44_0223407C

	thumb_func_start ov44_022340B4
ov44_022340B4: @ 0x022340B4
	movs r1, #1
	adds r0, #0x24
	strb r1, [r0]
	bx lr
	thumb_func_end ov44_022340B4

	thumb_func_start ov44_022340BC
ov44_022340BC: @ 0x022340BC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	bl FUN_02034750
	cmp r0, #0
	bne _022340EA
	adds r0, r4, #0
	bl FUN_0203476C
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022340EC
	adds r0, r5, #0
	bl ov44_022340B4
_022340EA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022340BC

	thumb_func_start ov44_022340EC
ov44_022340EC: @ 0x022340EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r1, #0
	adds r5, r0, #0
	movs r0, #0xc
	adds r4, r6, #0
	muls r4, r0, r4
	movs r0, #0x63
	lsls r0, r0, #2
	adds r7, r5, r0
	ldr r0, [r7, r4]
	str r2, [sp]
	cmp r0, #0
	bne _022341B8
	ldr r1, _022341BC @ =0x02236510
	ldrh r2, [r1, r4]
	adds r0, r1, r4
	add r1, sp, #4
	strh r2, [r1]
	ldrh r2, [r0, #2]
	strh r2, [r1, #2]
	ldrh r2, [r0, #4]
	strh r2, [r1, #4]
	ldrh r2, [r0, #6]
	strh r2, [r1, #6]
	ldrh r2, [r0, #8]
	strh r2, [r1, #8]
	ldrh r0, [r0, #0xa]
	strh r0, [r1, #0xa]
	bl FUN_0203769C
	cmp r6, r0
	beq _02234148
	adds r0, r6, #0
	bl FUN_02034818
	adds r6, r0, #0
	bne _0223413C
	bl GF_AssertFail
_0223413C:
	adds r0, r6, #0
	bl FUN_0202903C
	add r1, sp, #4
	strh r0, [r1, #0xa]
	b _0223415C
_02234148:
	ldr r0, [r5]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	add r0, sp, #4
	bne _02234158
	movs r1, #0
	strh r1, [r0, #0xa]
	b _0223415C
_02234158:
	movs r1, #0x61
	strh r1, [r0, #0xa]
_0223415C:
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #4
	bl FUN_022280B8
	str r0, [r7, r4]
	movs r0, #0x62
	add r1, sp, #4
	lsls r0, r0, #2
	ldrh r1, [r1, #0xa]
	ldr r0, [r5, r0]
	bl FUN_02229010
	cmp r0, #0
	bne _0223418E
	movs r0, #0x62
	add r1, sp, #4
	lsls r0, r0, #2
	ldrh r1, [r1, #0xa]
	ldr r0, [r5, r0]
	ldr r3, [sp]
	movs r2, #2
	bl FUN_02228FE0
_0223418E:
	movs r0, #0x19
	lsls r0, r0, #4
	adds r6, r5, r0
	subs r0, #8
	ldr r0, [r5, r0]
	ldr r1, [r7, r4]
	ldr r3, [sp]
	movs r2, #0
	bl FUN_0222903C
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	movs r1, #0
	bl FUN_02229200
	movs r0, #0x65
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1, r4]
	adds r0, r0, #1
	strh r0, [r1, r4]
_022341B8:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022341BC: .4byte 0x02236510
	thumb_func_end ov44_022340EC

	thumb_func_start ov44_022341C0
ov44_022341C0: @ 0x022341C0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x63
	lsls r0, r0, #2
	movs r6, #0
	adds r4, r7, r0
	adds r5, r7, #0
_022341CE:
	movs r2, #0x65
	lsls r2, r2, #2
	ldrh r2, [r5, r2]
	adds r0, r7, #0
	adds r1, r4, #0
	lsls r3, r2, #2
	ldr r2, _02234200 @ =0x02236464
	ldr r2, [r2, r3]
	blx r2
	adds r6, r6, #1
	adds r4, #0xc
	adds r5, #0xc
	cmp r6, #4
	blt _022341CE
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_0222807C
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_022290DC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02234200: .4byte 0x02236464
	thumb_func_end ov44_022341C0

	thumb_func_start ov44_02234204
ov44_02234204: @ 0x02234204
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0222901C
	movs r0, #0x63
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0x30
	blx FUN_020E5B44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234204

	thumb_func_start ov44_02234224
ov44_02234224: @ 0x02234224
	push {r3, lr}
	sub sp, #8
	add r0, sp, #0
	strh r1, [r0]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x16
	add r1, sp, #0
	movs r2, #8
	bl FUN_02037030
	cmp r0, #1
	beq _02234242
	bl GF_AssertFail
_02234242:
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov44_02234224

	thumb_func_start ov44_02234248
ov44_02234248: @ 0x02234248
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0223424E:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r0, r0, #1
	cmp r0, r4
	bge _02234272
	adds r0, r4, #0
	bl FUN_02034714
	cmp r0, #1
	bne _02234272
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02234224
	adds r0, r4, #0
	bl FUN_020346E8
_02234272:
	adds r4, r4, #1
	cmp r4, #4
	blt _0223424E
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_02234248

	thumb_func_start ov44_0223427C
ov44_0223427C: @ 0x0223427C
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r4, #0
_02234286:
	adds r0, r5, r4
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _022342AE
	adds r0, r4, #0
	bl FUN_02034730
	cmp r0, #1
	bne _022342AE
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022340BC
	adds r0, r5, r4
	adds r0, #0x28
	strb r7, [r0]
	movs r0, #1
	strb r0, [r5, #0x12]
_022342AE:
	adds r4, r4, #1
	cmp r4, #4
	blt _02234286
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov44_0223427C

	thumb_func_start ov44_022342B8
ov44_022342B8: @ 0x022342B8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022342CA
	bl GF_AssertFail
_022342CA:
	movs r0, #0x6f
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200F0AC
	movs r1, #0x86
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_022342B8

	thumb_func_start ov44_022342E0
ov44_022342E0: @ 0x022342E0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x86
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #0
	beq _0223431E
	bl FUN_0200F450
	movs r0, #0x86
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r4, #8]
	bl FUN_02028EA8
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r6, [sp, #4]
	movs r1, #1
	ldr r0, [r5, #0x30]
	adds r2, r1, #0
	movs r3, #2
	bl FUN_0200E644
_0223431E:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_022342E0

	thumb_func_start ov44_02234324
ov44_02234324: @ 0x02234324
	bx lr
	.align 2, 0
	thumb_func_end ov44_02234324

	thumb_func_start ov44_02234328
ov44_02234328: @ 0x02234328
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0222919C
	ldr r0, [r4, #4]
	bl FUN_022291A0
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02229200
	movs r0, #2
	strh r0, [r4, #8]
	ldr r0, [r4]
	movs r1, #6
	bl FUN_02228188
	ldr r1, _02234358 @ =0x02236458
	ldrb r0, [r1, r0]
	adds r0, #0x10
	strh r0, [r4, #0xa]
	pop {r4, pc}
	.align 2, 0
_02234358: .4byte 0x02236458
	thumb_func_end ov44_02234328

	thumb_func_start ov44_0223435C
ov44_0223435C: @ 0x0223435C
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	bl FUN_022291AC
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, #0xa]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02234386
	ldr r0, [r4, #4]
	bl FUN_022291B8
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0222919C
	movs r0, #3
	strh r0, [r4, #8]
_02234386:
	pop {r4, pc}
	thumb_func_end ov44_0223435C

	thumb_func_start ov44_02234388
ov44_02234388: @ 0x02234388
	bx lr
	.align 2, 0
	thumb_func_end ov44_02234388

	thumb_func_start ov44_0223438C
ov44_0223438C: @ 0x0223438C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	bl FUN_02034420
	cmp r0, #0
	beq _02234428
	bl FUN_020347A0
	adds r7, r0, #0
	bl FUN_020346D4
	cmp r0, #0
	beq _022343BA
	movs r0, #5
	bl FUN_02037824
	cmp r0, #0
	bne _022343BA
	movs r0, #1
	str r0, [sp]
_022343BA:
	movs r4, #0
	cmp r7, #0
	ble _02234402
_022343C0:
	cmp r4, #0
	bne _022343CC
	ldr r0, [r5]
	adds r0, #0x21
	ldrb r0, [r0]
	b _022343E8
_022343CC:
	adds r0, r4, #0
	bl FUN_02034870
	adds r6, r0, #0
	cmp r6, #0x20
	bne _022343DC
	bl GF_AssertFail
_022343DC:
	movs r0, #0x24
	ldr r1, [r5]
	muls r0, r6, r0
	adds r0, r1, r0
	adds r0, #0x45
	ldrb r0, [r0]
_022343E8:
	adds r1, r5, r4
	adds r1, #0x20
	ldrb r1, [r1]
	cmp r0, r1
	beq _022343F6
	movs r1, #1
	str r1, [sp]
_022343F6:
	adds r1, r5, r4
	adds r1, #0x20
	adds r4, r4, #1
	strb r0, [r1]
	cmp r4, r7
	blt _022343C0
_02234402:
	ldr r0, [sp]
	cmp r0, #1
	bne _02234428
	adds r2, r5, #0
	adds r5, #0x20
	ldrb r0, [r5]
	add r1, sp, #4
	adds r2, #0x20
	strb r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #1]
	ldrb r0, [r2, #2]
	strb r0, [r1, #2]
	ldrb r0, [r2, #3]
	movs r2, #4
	strb r0, [r1, #3]
	movs r0, #0x18
	bl FUN_02037030
_02234428:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0223438C

	thumb_func_start ov44_0223442C
ov44_0223442C: @ 0x0223442C
	push {r3, lr}
	movs r0, #0xd
	bl FUN_02037B38
	cmp r0, #0
	beq _0223443C
	movs r0, #1
	pop {r3, pc}
_0223443C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov44_0223442C

	thumb_func_start ov44_02234440
ov44_02234440: @ 0x02234440
	movs r1, #1
	strb r1, [r0, #0x10]
	ldr r1, _0223444C @ =0x00000708
	str r1, [r0, #0xc]
	bx lr
	nop
_0223444C: .4byte 0x00000708
	thumb_func_end ov44_02234440

	thumb_func_start ov44_02234450
ov44_02234450: @ 0x02234450
	movs r1, #0
	strb r1, [r0, #0x10]
	bx lr
	.align 2, 0
	thumb_func_end ov44_02234450

	thumb_func_start ov44_02234458
ov44_02234458: @ 0x02234458
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _02234462
	movs r0, #0
	bx lr
_02234462:
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ble _02234470
	subs r1, r1, #1
	str r1, [r0, #0xc]
	movs r0, #0
	bx lr
_02234470:
	movs r0, #1
	bx lr
	thumb_func_end ov44_02234458

	thumb_func_start ov44_02234474
ov44_02234474: @ 0x02234474
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	adds r4, r2, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r1, #1
	bne _02234488
	bl ov44_02233F3C
_02234488:
	movs r0, #0
	bl FUN_021E7220
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	bl FUN_0203769C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov44_022340EC
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02234474

	thumb_func_start ov44_022344AC
ov44_022344AC: @ 0x022344AC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x6b
	bl ov44_02233860
	movs r0, #2
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_022344AC

	thumb_func_start ov44_022344C4
ov44_022344C4: @ 0x022344C4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x30
	adds r6, r1, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022344DC
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_022344DC:
	adds r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #1
	bne _02234522
	bl FUN_02034780
	adds r4, r0, #0
	cmp r4, #0xff
	beq _02234522
	ldrb r1, [r5, #6]
	cmp r1, #0
	beq _02234522
	bl FUN_02034870
	cmp r0, #0x20
	bne _02234520
	add r0, sp, #0
	strh r4, [r0]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	bl FUN_020346E8
	movs r0, #0x16
	add r1, sp, #0
	movs r2, #8
	bl FUN_02037030
	cmp r0, #1
	beq _02234522
	bl GF_AssertFail
	b _02234522
_02234520:
	strb r4, [r5, #6]
_02234522:
	ldr r0, _02234598 @ =0x021D110C
	movs r1, #1
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0223455A
	ldr r0, _0223459C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #0
	bne _02234542
	movs r0, #6
	strb r0, [r5, #5]
	b _02234590
_02234542:
	adds r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r6, #1]
	cmp r1, r0
	bgt _02234554
	movs r0, #8
	strb r0, [r5, #5]
	b _02234590
_02234554:
	movs r0, #6
	strb r0, [r5, #5]
	b _02234590
_0223455A:
	movs r1, #2
	adds r2, r0, #0
	tst r2, r1
	beq _0223456E
	ldr r0, _0223459C @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x16
	strb r0, [r5, #5]
	b _02234590
_0223456E:
	ldrb r2, [r5, #6]
	cmp r2, #0xff
	beq _02234580
	ldr r0, _0223459C @ =0x000005DD
	bl FUN_0200604C
	movs r0, #3
	strb r0, [r5, #5]
	b _02234590
_02234580:
	lsls r1, r1, #9
	tst r0, r1
	beq _02234590
	movs r0, #0x1e
	strb r0, [r5, #5]
	ldr r0, _0223459C @ =0x000005DD
	bl FUN_0200604C
_02234590:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02234598: .4byte 0x021D110C
_0223459C: .4byte 0x000005DD
	thumb_func_end ov44_022344C4

	thumb_func_start ov44_022345A0
ov44_022345A0: @ 0x022345A0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	ldrb r2, [r5, #6]
	adds r0, #0x30
	adds r3, r6, #0
	adds r4, r1, #0
	bl ov44_0223398C
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	movs r2, #0x6c
	adds r3, r6, #0
	bl ov44_02233860
	movs r0, #4
	strb r0, [r5, #5]
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022345A0

	thumb_func_start ov44_022345C8
ov44_022345C8: @ 0x022345C8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	adds r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022345DC
	movs r0, #0
	pop {r3, r4, r5, pc}
_022345DC:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _022345F8 @ =0x0223645C
	movs r2, #0x30
	movs r3, #4
	bl FUN_02001FC8
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #5
	strb r0, [r4, #5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_022345F8: .4byte 0x0223645C
	thumb_func_end ov44_022345C8

	thumb_func_start ov44_022345FC
ov44_022345FC: @ 0x022345FC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	adds r6, r2, #0
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02234694
	ldrb r2, [r5, #6]
	add r1, sp, #0
	cmp r0, #0
	strh r2, [r1]
	bne _02234660
	movs r0, #1
	str r0, [sp, #4]
	ldrb r1, [r5, #6]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov44_022340BC
	ldr r0, [r5]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234648
	adds r0, r5, #0
	bl ov44_02233F20
	adds r0, r5, #0
	bl ov44_02233F3C
_02234648:
	adds r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _0223465A
	movs r0, #8
	strb r0, [r5, #5]
	b _0223466E
_0223465A:
	movs r0, #1
	strb r0, [r5, #5]
	b _0223466E
_02234660:
	movs r0, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	bl FUN_020346E8
	movs r0, #1
	strb r0, [r5, #5]
_0223466E:
	movs r0, #0x16
	add r1, sp, #0
	movs r2, #8
	bl FUN_02037030
	cmp r0, #1
	beq _02234680
	bl GF_AssertFail
_02234680:
	movs r0, #0xff
	strb r0, [r5, #6]
	adds r0, r5, #0
	adds r0, #0x30
	bl ov44_02233A34
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_02234694:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_022345FC

	thumb_func_start ov44_0223469C
ov44_0223469C: @ 0x0223469C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x77
	bl ov44_02233860
	movs r0, #7
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0223469C

	thumb_func_start ov44_022346B4
ov44_022346B4: @ 0x022346B4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _022346C6
	movs r0, #0
	pop {r4, pc}
_022346C6:
	movs r0, #0x13
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_022346B4

	thumb_func_start ov44_022346D0
ov44_022346D0: @ 0x022346D0
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x6f
	bl ov44_02233860
	movs r0, #9
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_022346D0

	thumb_func_start ov44_022346E8
ov44_022346E8: @ 0x022346E8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	adds r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022346FC
	movs r0, #0
	pop {r3, r4, r5, pc}
_022346FC:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _02234718 @ =0x0223645C
	movs r2, #0x30
	movs r3, #4
	bl FUN_02001FC8
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xa
	strb r0, [r4, #5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02234718: .4byte 0x0223645C
	thumb_func_end ov44_022346E8

	thumb_func_start ov44_0223471C
ov44_0223471C: @ 0x0223471C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r1, r2, #0
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0223475E
	cmp r0, #0
	bne _02234740
	movs r0, #0xb
	strb r0, [r5, #5]
	b _02234756
_02234740:
	adds r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _02234752
	movs r0, #0x13
	strb r0, [r5, #5]
	b _02234756
_02234752:
	movs r0, #1
	strb r0, [r5, #5]
_02234756:
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_0223475E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0223471C

	thumb_func_start ov44_02234764
ov44_02234764: @ 0x02234764
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0x1e
	adds r6, r2, #0
	str r1, [r5, #8]
	bl ov44_02233FA8
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	movs r2, #0x66
	adds r3, r6, #0
	bl ov44_02233860
	adds r0, r5, #0
	bl ov44_022342B8
	adds r0, r5, #0
	bl ov44_02234440
	movs r0, #0xc
	strb r0, [r5, #5]
	bl FUN_021E7130
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234764

	thumb_func_start ov44_0223479C
ov44_0223479C: @ 0x0223479C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_02037454
	adds r5, r0, #0
	bl FUN_020347A0
	cmp r5, r0
	beq _022347B8
	adds r0, r4, #0
	bl ov44_02233FA8
	movs r0, #0
	pop {r3, r4, r5, pc}
_022347B8:
	bl FUN_021E70F4
	cmp r0, #0
	bne _022347C4
	movs r0, #0
	pop {r3, r4, r5, pc}
_022347C4:
	movs r0, #1
	bl FUN_021E7220
	movs r0, #0xd
	strb r0, [r4, #5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_0223479C

	thumb_func_start ov44_022347D4
ov44_022347D4: @ 0x022347D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _022347F2
	movs r1, #0
	movs r0, #0x17
	adds r2, r1, #0
	bl FUN_02037030
	cmp r0, #0
	beq _022347F6
	movs r0, #0xe
	strb r0, [r4, #5]
	b _022347F6
_022347F2:
	subs r0, r0, #1
	str r0, [r4, #8]
_022347F6:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_022347D4

	thumb_func_start ov44_022347FC
ov44_022347FC: @ 0x022347FC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xd
	adds r5, r1, #0
	bl FUN_02037B38
	cmp r0, #0
	beq _02234822
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov44_02233EB4
	bl FUN_02037BEC
	movs r0, #0xe
	bl FUN_02037AC0
	movs r0, #0xf
	strb r0, [r4, #5]
_02234822:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_022347FC

	thumb_func_start ov44_02234828
ov44_02234828: @ 0x02234828
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xe
	bl FUN_02037B38
	cmp r0, #0
	beq _02234852
	ldr r0, [r4]
	ldrb r1, [r0, #0x1b]
	add r0, sp, #0
	strh r1, [r0]
	bl FUN_0203769C
	add r1, sp, #0
	bl FUN_02037C0C
	cmp r0, #1
	bne _02234852
	movs r0, #0x10
	strb r0, [r4, #5]
_02234852:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov44_02234828

	thumb_func_start ov44_02234858
ov44_02234858: @ 0x02234858
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl ov44_02233F64
	adds r7, r0, #0
	bl FUN_0203769C
	movs r5, #0
	adds r4, r5, #0
	str r0, [sp]
	cmp r7, #0
	ble _0223489C
_02234870:
	ldr r0, [sp]
	cmp r0, r4
	beq _02234894
	adds r0, r4, #0
	bl FUN_02037C44
	cmp r0, #0
	beq _02234896
	ldrh r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	cmp r1, r0
	bne _0223488E
	adds r5, r5, #1
	b _02234896
_0223488E:
	movs r0, #0x1b
	strb r0, [r6, #5]
	b _02234896
_02234894:
	adds r5, r5, #1
_02234896:
	adds r4, r4, #1
	cmp r4, r7
	blt _02234870
_0223489C:
	cmp r5, r7
	bne _022348A4
	movs r0, #0x11
	strb r0, [r6, #5]
_022348A4:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02234858

	thumb_func_start ov44_022348A8
ov44_022348A8: @ 0x022348A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #0x12
	bl FUN_02037AC0
	movs r0, #0x12
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_022348A8

	thumb_func_start ov44_022348C4
ov44_022348C4: @ 0x022348C4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x12
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_02037B38
	cmp r0, #0
	beq _022348E8
	movs r0, #1
	strb r0, [r5, #7]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022342E0
	movs r0, #1
	pop {r4, r5, r6, pc}
_022348E8:
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022348C4

	thumb_func_start ov44_022348EC
ov44_022348EC: @ 0x022348EC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x78
	bl ov44_02233860
	movs r0, #0x14
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_022348EC

	thumb_func_start ov44_02234904
ov44_02234904: @ 0x02234904
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x30
	adds r4, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _0223491C
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223491C:
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5, #0x30]
	ldr r1, _02234940 @ =0x0223645C
	movs r2, #0x30
	movs r3, #4
	bl FUN_02001F20
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x15
	strb r0, [r5, #5]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02234940: .4byte 0x0223645C
	thumb_func_end ov44_02234904

	thumb_func_start ov44_02234944
ov44_02234944: @ 0x02234944
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r1, r2, #0
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02234996
	cmp r0, #0
	bne _02234968
	movs r0, #0x16
	strb r0, [r5, #5]
	b _0223498E
_02234968:
	adds r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #0
	beq _0223498A
	adds r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _02234984
	movs r0, #8
	strb r0, [r5, #5]
	b _0223498E
_02234984:
	movs r0, #1
	strb r0, [r5, #5]
	b _0223498E
_0223498A:
	movs r0, #1
	strb r0, [r5, #5]
_0223498E:
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_02234996:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_02234944

	thumb_func_start ov44_0223499C
ov44_0223499C: @ 0x0223499C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x79
	bl ov44_02233860
	movs r0, #0x17
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_0223499C

	thumb_func_start ov44_022349B4
ov44_022349B4: @ 0x022349B4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x30
	adds r4, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022349CC
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, pc}
_022349CC:
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5, #0x30]
	ldr r1, _022349F0 @ =0x0223645C
	movs r2, #0x30
	movs r3, #4
	bl FUN_02001F20
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x18
	strb r0, [r5, #5]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_022349F0: .4byte 0x0223645C
	thumb_func_end ov44_022349B4

	thumb_func_start ov44_022349F4
ov44_022349F4: @ 0x022349F4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r0, [r5, r0]
	adds r1, r2, #0
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02234A46
	cmp r0, #0
	bne _02234A18
	movs r0, #0x19
	strb r0, [r5, #5]
	b _02234A3E
_02234A18:
	adds r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #0
	beq _02234A3A
	adds r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _02234A34
	movs r0, #8
	strb r0, [r5, #5]
	b _02234A3E
_02234A34:
	movs r0, #1
	strb r0, [r5, #5]
	b _02234A3E
_02234A3A:
	movs r0, #1
	strb r0, [r5, #5]
_02234A3E:
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_02234A46:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_022349F4

	thumb_func_start ov44_02234A4C
ov44_02234A4C: @ 0x02234A4C
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x7a
	bl ov44_02233860
	movs r0, #0x1e
	str r0, [r4, #8]
	movs r0, #0x1a
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234A4C

	thumb_func_start ov44_02234A68
ov44_02234A68: @ 0x02234A68
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234A7A
	movs r0, #0
	pop {r4, pc}
_02234A7A:
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0
	ble _02234A88
	movs r0, #0
	pop {r4, pc}
_02234A88:
	movs r0, #0
	strb r0, [r4, #7]
	bl FUN_02039358
	adds r0, r4, #0
	bl ov44_02233FE8
	bl FUN_02039B58
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234A68

	thumb_func_start ov44_02234AA8
ov44_02234AA8: @ 0x02234AA8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r0, #0
	beq _02234AC8
	adds r1, r4, #0
	bl FUN_02001FFC
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_02234AC8:
	adds r0, r5, #0
	adds r0, #0x30
	bl ov44_02233A34
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov44_022342E0
	movs r0, #0x1c
	strb r0, [r5, #5]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234AA8

	thumb_func_start ov44_02234AE4
ov44_02234AE4: @ 0x02234AE4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x76
	adds r4, r1, #0
	bl ov44_02233860
	movs r0, #0x1d
	strb r0, [r5, #5]
	adds r0, r5, #0
	bl ov44_02233FE8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02233EB4
	bl FUN_020390C4
	subs r0, r0, #4
	cmp r0, #1
	bhi _02234B14
	blx FUN_021EDB1C
_02234B14:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02234AE4

	thumb_func_start ov44_02234B18
ov44_02234B18: @ 0x02234B18
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_020390C4
	subs r0, r0, #4
	cmp r0, #1
	bhi _02234B2A
	blx FUN_021EDB1C
_02234B2A:
	adds r0, r4, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234B3A
	movs r0, #0
	pop {r4, pc}
_02234B3A:
	bl FUN_02039358
	bl FUN_02039B58
	adds r0, r4, #0
	bl ov44_02233FE8
	movs r0, #0
	movs r1, #1
	strb r0, [r4, #7]
	bl FUN_020398D4
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234B18

	thumb_func_start ov44_02234B58
ov44_02234B58: @ 0x02234B58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	adds r3, r2, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234B6C
	movs r2, #0x7d
	b _02234B6E
_02234B6C:
	movs r2, #0x7c
_02234B6E:
	adds r0, r4, #0
	adds r0, #0x30
	bl ov44_02233860
	movs r0, #0x1f
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234B58

	thumb_func_start ov44_02234B80
ov44_02234B80: @ 0x02234B80
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	adds r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _02234B94
	movs r0, #0
	pop {r3, r4, r5, pc}
_02234B94:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _02234BB0 @ =0x0223645C
	movs r2, #0x30
	movs r3, #4
	bl FUN_02001FC8
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x20
	strb r0, [r4, #5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02234BB0: .4byte 0x0223645C
	thumb_func_end ov44_02234B80

	thumb_func_start ov44_02234BB4
ov44_02234BB4: @ 0x02234BB4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	adds r4, r2, #0
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02234BEC
	cmp r0, #0
	bne _02234BE0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02233D38
	adds r0, r5, #0
	bl ov44_022340B4
_02234BE0:
	movs r0, #1
	strb r0, [r5, #5]
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_02234BEC:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02234BB4

	thumb_func_start ov44_02234BF0
ov44_02234BF0: @ 0x02234BF0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02034434
	movs r0, #0
	movs r1, #1
	bl FUN_020398D4
	adds r0, r4, #0
	bl ov44_02234440
	movs r0, #1
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234BF0

	thumb_func_start ov44_02234C10
ov44_02234C10: @ 0x02234C10
	push {r4, lr}
	adds r1, r2, #0
	adds r4, r0, #0
	bl ov44_02233F6C
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #0
	bne _02234C30
	adds r0, r4, #0
	bl ov44_02234450
	movs r0, #0xf
	strb r0, [r4, #5]
	b _02234C44
_02234C30:
	movs r0, #0
	bl FUN_02034750
	cmp r0, #0
	beq _02234C44
	adds r0, r4, #0
	bl ov44_02234450
	movs r0, #2
	strb r0, [r4, #5]
_02234C44:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov44_02234C10

	thumb_func_start ov44_02234C48
ov44_02234C48: @ 0x02234C48
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	bl ov44_02233F6C
	adds r0, r5, #0
	movs r2, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r3, r2, #0
	str r6, [sp]
	bl ov44_02233C88
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	movs r2, #0x72
	adds r3, r6, #0
	bl ov44_02233860
	adds r0, r5, #0
	bl ov44_022342B8
	movs r0, #3
	strb r0, [r5, #5]
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234C48

	thumb_func_start ov44_02234C88
ov44_02234C88: @ 0x02234C88
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	bl ov44_02233F6C
	adds r0, r5, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234CA6
	movs r0, #0
	pop {r4, r5, r6, pc}
_02234CA6:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02234CE2
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022342E0
	ldrb r0, [r5, #0x13]
	cmp r0, #1
	beq _02234CC6
	cmp r0, #2
	beq _02234CCC
	cmp r0, #3
	beq _02234CD8
	b _02234CE2
_02234CC6:
	movs r0, #4
	strb r0, [r5, #5]
	b _02234CE2
_02234CCC:
	movs r0, #6
	strb r0, [r5, #5]
	movs r0, #0x74
	adds r5, #0x2d
	strb r0, [r5]
	b _02234CE2
_02234CD8:
	movs r0, #6
	strb r0, [r5, #5]
	movs r0, #0x84
	adds r5, #0x2d
	strb r0, [r5]
_02234CE2:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234C88

	thumb_func_start ov44_02234CE8
ov44_02234CE8: @ 0x02234CE8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r2, #0
	movs r2, #0
	adds r5, r0, #0
	adds r0, #0x30
	adds r3, r2, #0
	adds r6, r1, #0
	str r4, [sp]
	bl ov44_02233C88
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r6, #0
	movs r2, #0x73
	movs r3, #0x1e
	str r4, [sp]
	bl ov44_0223386C
	movs r0, #5
	strb r0, [r5, #5]
	bl FUN_0203769C
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x67
	bl ov44_022340BC
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234CE8

	thumb_func_start ov44_02234D28
ov44_02234D28: @ 0x02234D28
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r2, #0
	bl ov44_02233F6C
	adds r0, r4, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234D42
	movs r0, #0
	pop {r4, pc}
_02234D42:
	movs r0, #8
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234D28

	thumb_func_start ov44_02234D4C
ov44_02234D4C: @ 0x02234D4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r2, #0
	movs r2, #0
	adds r5, r0, #0
	adds r0, #0x30
	adds r3, r2, #0
	adds r4, r1, #0
	str r6, [sp]
	bl ov44_02233C88
	adds r2, r5, #0
	adds r2, #0x2d
	adds r0, r5, #0
	ldrb r2, [r2]
	adds r0, #0x30
	adds r1, r4, #0
	adds r3, r6, #0
	bl ov44_02233860
	movs r0, #7
	strb r0, [r5, #5]
	bl FUN_02039358
	bl FUN_02039B58
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234D4C

	thumb_func_start ov44_02234D88
ov44_02234D88: @ 0x02234D88
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234D9A
	movs r0, #0
	pop {r4, pc}
_02234D9A:
	movs r0, #0
	movs r1, #1
	strb r0, [r4, #7]
	bl FUN_020398D4
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov44_02234D88

	thumb_func_start ov44_02234DA8
ov44_02234DA8: @ 0x02234DA8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	bl ov44_02233F6C
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	movs r2, #0x7b
	adds r3, r6, #0
	bl ov44_02233860
	adds r0, r5, #0
	bl ov44_022342B8
	movs r0, #9
	strb r0, [r5, #5]
	ldr r0, [r5]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234DDE
	adds r0, r5, #0
	bl ov44_02233F3C
_02234DDE:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234DA8

	thumb_func_start ov44_02234DE4
ov44_02234DE4: @ 0x02234DE4
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r2, #0
	bl ov44_02233F6C
	adds r0, r4, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234DFE
	movs r0, #0
	pop {r4, pc}
_02234DFE:
	movs r0, #0xa
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234DE4

	thumb_func_start ov44_02234E08
ov44_02234E08: @ 0x02234E08
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	bl ov44_02233F6C
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	beq _02234E3C
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, [r5]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234E36
	adds r0, r5, #0
	bl ov44_02233F20
	adds r0, r5, #0
	bl ov44_02233F3C
_02234E36:
	adds r0, r5, #0
	bl ov44_022340B4
_02234E3C:
	adds r0, r5, #0
	bl ov44_0223442C
	cmp r0, #1
	bne _02234E80
	bl FUN_02037BEC
	movs r0, #0xe
	bl FUN_02037AC0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022342E0
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	movs r2, #0x66
	adds r3, r6, #0
	bl ov44_02233860
	adds r0, r5, #0
	bl ov44_02234440
	movs r0, #0x4b
	lsls r0, r0, #2
	str r0, [r5, #8]
	adds r0, r5, #0
	bl ov44_022342B8
	movs r0, #0xb
	strb r0, [r5, #5]
	b _02234E9A
_02234E80:
	ldr r0, _02234EA0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	lsls r0, r0, #0xa
	tst r0, r1
	beq _02234E9A
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022342E0
	movs r0, #0x12
	strb r0, [r5, #5]
_02234E9A:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_02234EA0: .4byte 0x021D110C
	thumb_func_end ov44_02234E08

	thumb_func_start ov44_02234EA4
ov44_02234EA4: @ 0x02234EA4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xe
	bl FUN_02037B38
	cmp r0, #0
	beq _02234EEE
	ldr r0, [r4]
	ldrb r1, [r0, #0x1b]
	add r0, sp, #0
	strh r1, [r0]
	adds r0, r4, #0
	bl ov44_02233F64
	adds r5, r0, #0
	bl FUN_02037454
	cmp r5, r0
	beq _02234EDC
	ldr r0, [r4, #8]
	subs r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0
	bgt _02234ED8
	movs r0, #0xf
	strb r0, [r4, #5]
_02234ED8:
	movs r0, #0
	pop {r3, r4, r5, pc}
_02234EDC:
	bl FUN_0203769C
	add r1, sp, #0
	bl FUN_02037C0C
	cmp r0, #1
	bne _02234EEE
	movs r0, #0xc
	strb r0, [r4, #5]
_02234EEE:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_02234EA4

	thumb_func_start ov44_02234EF4
ov44_02234EF4: @ 0x02234EF4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl ov44_02233F64
	adds r7, r0, #0
	bl FUN_0203769C
	movs r5, #0
	adds r4, r5, #0
	str r0, [sp]
	cmp r7, #0
	ble _02234F38
_02234F0C:
	ldr r0, [sp]
	cmp r0, r4
	beq _02234F30
	adds r0, r4, #0
	bl FUN_02037C44
	cmp r0, #0
	beq _02234F32
	ldrh r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	cmp r1, r0
	bne _02234F2A
	adds r5, r5, #1
	b _02234F32
_02234F2A:
	movs r0, #0xf
	strb r0, [r6, #5]
	b _02234F32
_02234F30:
	adds r5, r5, #1
_02234F32:
	adds r4, r4, #1
	cmp r4, r7
	blt _02234F0C
_02234F38:
	cmp r5, r7
	bne _02234F40
	movs r0, #0xd
	strb r0, [r6, #5]
_02234F40:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02234EF4

	thumb_func_start ov44_02234F44
ov44_02234F44: @ 0x02234F44
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	movs r0, #0x12
	bl FUN_02037AC0
	movs r0, #0xe
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234F44

	thumb_func_start ov44_02234F60
ov44_02234F60: @ 0x02234F60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x12
	adds r4, r1, #0
	adds r6, r2, #0
	bl FUN_02037B38
	cmp r0, #0
	beq _02234F82
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov44_022342E0
	movs r0, #1
	strb r0, [r5, #7]
	pop {r4, r5, r6, pc}
_02234F82:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234F60

	thumb_func_start ov44_02234F88
ov44_02234F88: @ 0x02234F88
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r6, r1, #0
	adds r4, r2, #0
	cmp r0, #0
	beq _02234FA8
	adds r1, r4, #0
	bl FUN_02001FFC
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_02234FA8:
	adds r0, r5, #0
	adds r0, #0x30
	bl ov44_02233A34
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov44_022342E0
	movs r0, #0x10
	strb r0, [r5, #5]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02234F88

	thumb_func_start ov44_02234FC4
ov44_02234FC4: @ 0x02234FC4
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x76
	bl ov44_02233860
	movs r0, #0x11
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02234FC4

	thumb_func_start ov44_02234FDC
ov44_02234FDC: @ 0x02234FDC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234FEE
	movs r0, #0
	pop {r4, pc}
_02234FEE:
	bl FUN_02039358
	bl FUN_02039B58
	movs r0, #0
	movs r1, #1
	strb r0, [r4, #7]
	bl FUN_020398D4
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov44_02234FDC

	thumb_func_start ov44_02235004
ov44_02235004: @ 0x02235004
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	bl ov44_02233F6C
	ldr r0, [r5]
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02235020
	movs r2, #0x7d
	b _02235022
_02235020:
	movs r2, #0x7c
_02235022:
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r3, r6, #0
	bl ov44_02233860
	movs r0, #0x13
	strb r0, [r5, #5]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02235004

	thumb_func_start ov44_02235038
ov44_02235038: @ 0x02235038
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r4, r0, #0
	adds r1, r5, #0
	bl ov44_02233F6C
	adds r0, r4, #0
	bl ov44_0223442C
	cmp r0, #1
	bne _0223505E
	movs r0, #0xa
	strb r0, [r4, #5]
	adds r4, #0x30
	adds r0, r4, #0
	bl ov44_02233954
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223505E:
	adds r0, r4, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _0223506E
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223506E:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _0223508C @ =0x0223645C
	movs r2, #0x30
	movs r3, #4
	bl FUN_02001FC8
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x14
	strb r0, [r4, #5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223508C: .4byte 0x0223645C
	thumb_func_end ov44_02235038

	thumb_func_start ov44_02235090
ov44_02235090: @ 0x02235090
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r1, r4, #0
	bl ov44_02233F6C
	adds r0, r5, #0
	bl ov44_0223442C
	cmp r0, #1
	bne _022350C8
	movs r0, #0xa
	strb r0, [r5, #5]
	adds r0, r5, #0
	adds r0, #0x30
	bl ov44_02233954
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02001FFC
	movs r1, #0x83
	movs r0, #0
	lsls r1, r1, #2
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
_022350C8:
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _022350FA
	cmp r0, #0
	bne _022350EE
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02233D38
	adds r0, r5, #0
	bl ov44_022340B4
_022350EE:
	movs r0, #8
	strb r0, [r5, #5]
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
_022350FA:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov44_02235090

	thumb_func_start ov44_02235100
ov44_02235100: @ 0x02235100
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_02034870
	adds r1, r5, #0
	adds r1, #0x26
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _02235124
	bl GF_AssertFail
_02235124:
	adds r0, r5, #0
	movs r2, #0
	adds r0, #0x30
	adds r1, r6, #0
	adds r3, r2, #0
	str r4, [sp]
	bl ov44_02233C88
	bl FUN_02039358
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x27
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r6, #0
	movs r2, #0x84
	adds r3, r4, #0
	bl ov44_02233860
	movs r0, #0x16
	strb r0, [r5, #5]
	movs r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_02235100

	thumb_func_start ov44_02235158
ov44_02235158: @ 0x02235158
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	adds r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _0223516C
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223516C:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _02235188 @ =0x0223645C
	movs r2, #0x30
	movs r3, #4
	bl FUN_02001FC8
	movs r1, #0x83
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x17
	strb r0, [r4, #5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02235188: .4byte 0x0223645C
	thumb_func_end ov44_02235158

	thumb_func_start ov44_0223518C
ov44_0223518C: @ 0x0223518C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x83
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r2, #0
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _022351B8
	cmp r0, #0
	bne _022351AC
	movs r0, #0x18
	b _022351AE
_022351AC:
	movs r0, #0x1d
_022351AE:
	strb r0, [r4, #5]
	movs r0, #0x83
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_022351B8:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0223518C

	thumb_func_start ov44_022351BC
ov44_022351BC: @ 0x022351BC
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r2, #0
	adds r0, #0x30
	movs r2, #0x11
	bl ov44_02233860
	adds r0, r4, #0
	bl ov44_022342B8
	movs r0, #0x5a
	str r0, [r4, #8]
	movs r0, #0x19
	strb r0, [r4, #5]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov44_022351BC

	thumb_func_start ov44_022351DC
ov44_022351DC: @ 0x022351DC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	adds r4, r1, #0
	cmp r0, #0
	ble _022351F0
	subs r0, r0, #1
	str r0, [r5, #8]
	movs r0, #0
	pop {r3, r4, r5, pc}
_022351F0:
	adds r0, r5, #0
	adds r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02235200
	movs r0, #0
	pop {r3, r4, r5, pc}
_02235200:
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r0, [r0]
	ldrb r1, [r4]
	bl ov44_02233E80
	cmp r0, #0
	beq _02235214
	movs r0, #0x1a
	strb r0, [r5, #5]
_02235214:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_022351DC

	thumb_func_start ov44_02235218
ov44_02235218: @ 0x02235218
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl ov44_02233E48
	bl FUN_020390C4
	cmp r0, #1
	bne _02235262
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #1
	bne _02235262
	movs r0, #0
	bl FUN_020378E4
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov44_022342E0
	movs r1, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	str r4, [sp, #8]
	bl FUN_0200FA24
	movs r0, #0x1b
	strb r0, [r5, #5]
_02235262:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_02235218

	thumb_func_start ov44_02235268
ov44_02235268: @ 0x02235268
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _02235324
	ldr r0, [r6, #8]
	movs r1, #0
	bl FUN_02034354
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x27
	strb r1, [r0]
	adds r0, r5, #0
	bl ov44_02234204
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov44_02233214
	adds r0, r5, #0
	movs r2, #0x7e
	adds r0, #0x30
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	adds r0, r5, #0
	bl ov44_02234028
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov44_022331C4
	bl FUN_0203A880
	movs r1, #0
	strb r1, [r5, #0x12]
	strb r1, [r5, #0x13]
	adds r0, r5, #0
	adds r0, #0x14
	strb r1, [r5, #0x14]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	adds r0, r5, #0
	adds r0, #0x18
	strb r1, [r5, #0x18]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	adds r0, r5, #0
	adds r0, #0x1c
	movs r1, #1
	movs r2, #4
	blx FUN_020D4994
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #1
	movs r2, #4
	blx FUN_020D4994
	adds r0, r5, #0
	adds r1, r5, #0
	movs r3, #0
	adds r0, #0x24
	strb r3, [r0]
	adds r0, r5, #0
	adds r0, #0x26
	strb r3, [r0]
	adds r0, r5, #0
	adds r0, #0x28
	strb r3, [r0]
	adds r1, #0x28
	strb r3, [r1, #1]
	strb r3, [r1, #2]
	strb r3, [r1, #3]
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #3
	adds r2, r1, #0
	str r4, [sp, #8]
	bl FUN_0200FA24
	movs r0, #0x1c
	strb r0, [r5, #5]
_02235324:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov44_02235268

	thumb_func_start ov44_0223532C
ov44_0223532C: @ 0x0223532C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223533C
	movs r0, #0
	strb r0, [r4, #5]
_0223533C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0223532C

	thumb_func_start ov44_02235340
ov44_02235340: @ 0x02235340
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02039358
	bl FUN_02039B58
	movs r0, #0
	movs r1, #1
	strb r0, [r4, #7]
	bl FUN_020398D4
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov44_02235340

	.rodata

_0223535C:
	.byte 0x01, 0x03, 0x05, 0x00
	.byte 0x00, 0x02, 0x04, 0x00, 0x08, 0x07, 0x05, 0x07, 0x00, 0x01, 0x02, 0x01, 0xF8, 0xF7, 0xF6, 0xF6
	.byte 0xF7, 0x00, 0x00, 0x00, 0x02, 0x19, 0x0A, 0x06, 0x08, 0x0E, 0x51, 0x00, 0x02, 0x19, 0x0A, 0x06
	.byte 0x08, 0x0E, 0x51, 0x00, 0x01, 0x19, 0x10, 0x06, 0x08, 0x0E, 0x89, 0x01, 0x02, 0x19, 0x0D, 0x06
	.byte 0x04, 0x0D, 0x51, 0x00, 0xA0, 0xC0, 0x08, 0x40, 0xA0, 0xC0, 0x50, 0xB0, 0xA0, 0xC0, 0xC0, 0xF8
	.byte 0x27, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x06, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x89, 0xC2, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x08, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x77, 0x30, 0x5F, 0x00, 0x77
	.byte 0x60, 0x8F, 0x00, 0x77, 0x90, 0xBF, 0x00, 0x77, 0x00, 0x2F, 0x80, 0xFF, 0x30, 0x5F, 0x80, 0xFF
	.byte 0x60, 0x8F, 0x80, 0xFF, 0x90, 0xBF, 0x80, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x89, 0xC2, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x08, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x89, 0xC2, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x08, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0xC0, 0x1A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0xC0, 0x1A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0xC0, 0x1A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x58, 0x21, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x01, 0x02, 0x01, 0x00, 0x01, 0x04, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x01, 0x02, 0x01, 0x01, 0x01, 0x04, 0x01, 0x00, 0x01, 0x03, 0x01, 0x01, 0x00
	.byte 0x10, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x0B, 0x00, 0x16, 0x00, 0x0B, 0x00, 0x1C, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x04, 0x0C, 0x02, 0x19, 0x0D, 0x05
	.byte 0x04, 0x01, 0x39, 0x00, 0x25, 0x43, 0x23, 0x02, 0x29, 0x43, 0x23, 0x02, 0x5D, 0x43, 0x23, 0x02
	.byte 0x89, 0x43, 0x23, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x48, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x60, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x48, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0xF1, 0x4B, 0x23, 0x02, 0x11, 0x4C, 0x23, 0x02, 0x49, 0x4C, 0x23, 0x02, 0x89, 0x4C, 0x23, 0x02
	.byte 0xE9, 0x4C, 0x23, 0x02, 0x29, 0x4D, 0x23, 0x02, 0x4D, 0x4D, 0x23, 0x02, 0x89, 0x4D, 0x23, 0x02
	.byte 0xA9, 0x4D, 0x23, 0x02, 0xE5, 0x4D, 0x23, 0x02, 0x09, 0x4E, 0x23, 0x02, 0xA5, 0x4E, 0x23, 0x02
	.byte 0xF5, 0x4E, 0x23, 0x02, 0x45, 0x4F, 0x23, 0x02, 0x61, 0x4F, 0x23, 0x02, 0x89, 0x4F, 0x23, 0x02
	.byte 0xC5, 0x4F, 0x23, 0x02, 0xDD, 0x4F, 0x23, 0x02, 0x05, 0x50, 0x23, 0x02, 0x39, 0x50, 0x23, 0x02
	.byte 0x91, 0x50, 0x23, 0x02, 0x01, 0x51, 0x23, 0x02, 0x59, 0x51, 0x23, 0x02, 0x8D, 0x51, 0x23, 0x02
	.byte 0xBD, 0x51, 0x23, 0x02, 0xDD, 0x51, 0x23, 0x02, 0x19, 0x52, 0x23, 0x02, 0x69, 0x52, 0x23, 0x02
	.byte 0x2D, 0x53, 0x23, 0x02, 0x41, 0x53, 0x23, 0x02, 0x75, 0x44, 0x23, 0x02, 0xAD, 0x44, 0x23, 0x02
	.byte 0xC5, 0x44, 0x23, 0x02, 0xA1, 0x45, 0x23, 0x02, 0xC9, 0x45, 0x23, 0x02, 0xFD, 0x45, 0x23, 0x02
	.byte 0x9D, 0x46, 0x23, 0x02, 0xB5, 0x46, 0x23, 0x02, 0xD1, 0x46, 0x23, 0x02, 0xE9, 0x46, 0x23, 0x02
	.byte 0x1D, 0x47, 0x23, 0x02, 0x65, 0x47, 0x23, 0x02, 0x9D, 0x47, 0x23, 0x02, 0xD5, 0x47, 0x23, 0x02
	.byte 0xFD, 0x47, 0x23, 0x02, 0x29, 0x48, 0x23, 0x02, 0x59, 0x48, 0x23, 0x02, 0xA9, 0x48, 0x23, 0x02
	.byte 0xC5, 0x48, 0x23, 0x02, 0xED, 0x48, 0x23, 0x02, 0x05, 0x49, 0x23, 0x02, 0x45, 0x49, 0x23, 0x02
	.byte 0x9D, 0x49, 0x23, 0x02, 0xB5, 0x49, 0x23, 0x02, 0xF5, 0x49, 0x23, 0x02, 0x4D, 0x4A, 0x23, 0x02
	.byte 0x69, 0x4A, 0x23, 0x02, 0xA9, 0x4A, 0x23, 0x02, 0xE5, 0x4A, 0x23, 0x02, 0x19, 0x4B, 0x23, 0x02
	.byte 0x59, 0x4B, 0x23, 0x02, 0x81, 0x4B, 0x23, 0x02, 0xB5, 0x4B, 0x23, 0x02, 0x05, 0x04, 0x03, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x05, 0x05, 0x05, 0x00, 0x00

	.data

_02236660:
	.byte 0x1E, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, 0x20, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x01, 0x03, 0x23, 0x02, 0x5D, 0x0E, 0x23, 0x02, 0xE1, 0x07, 0x23, 0x02, 0xB1, 0x08, 0x23, 0x02
	.byte 0x2D, 0x0B, 0x23, 0x02, 0x69, 0x0C, 0x23, 0x02, 0x8D, 0x0D, 0x23, 0x02, 0x47, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, 0x5F, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, 0x62, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x89, 0xC2, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0xB2, 0x22, 0x02
	.byte 0x6D, 0xB3, 0x22, 0x02, 0xA9, 0xB3, 0x22, 0x02, 0x2D, 0xB4, 0x22, 0x02, 0x95, 0xB4, 0x22, 0x02
	.byte 0x29, 0xB5, 0x22, 0x02, 0x4D, 0xB6, 0x22, 0x02, 0x6D, 0xBA, 0x22, 0x02, 0xB9, 0xBA, 0x22, 0x02
	.byte 0xC5, 0xBA, 0x22, 0x02, 0xD1, 0xBA, 0x22, 0x02, 0x39, 0xBB, 0x22, 0x02, 0xA5, 0xBB, 0x22, 0x02
	.byte 0x79, 0xBC, 0x22, 0x02, 0x45, 0xB7, 0x22, 0x02, 0x3D, 0xBE, 0x22, 0x02, 0x61, 0xC0, 0x22, 0x02
	.byte 0x85, 0xC0, 0x22, 0x02, 0x5D, 0xC3, 0x22, 0x02, 0x85, 0xC6, 0x22, 0x02, 0xAD, 0xC9, 0x22, 0x02
	.byte 0xF5, 0xC9, 0x22, 0x02, 0x35, 0xCB, 0x22, 0x02, 0x7D, 0xCB, 0x22, 0x02, 0x35, 0xCC, 0x22, 0x02
	.byte 0xAD, 0xCD, 0x22, 0x02, 0x41, 0xCE, 0x22, 0x02, 0xE1, 0xCF, 0x22, 0x02, 0xA5, 0xD0, 0x22, 0x02
	.byte 0x0D, 0xD1, 0x22, 0x02, 0xBD, 0xD1, 0x22, 0x02, 0xC1, 0xD1, 0x22, 0x02, 0xC5, 0xD1, 0x22, 0x02
	.byte 0x91, 0xEB, 0x22, 0x02, 0xE1, 0xF4, 0x22, 0x02, 0xC9, 0xD1, 0x22, 0x02, 0xDD, 0xD3, 0x22, 0x02
	.byte 0x95, 0xD5, 0x22, 0x02, 0x65, 0xDA, 0x22, 0x02, 0x15, 0xD2, 0x22, 0x02, 0x3D, 0xD2, 0x22, 0x02
	.byte 0xB1, 0xD2, 0x22, 0x02, 0x19, 0xDC, 0x22, 0x02, 0x65, 0xDD, 0x22, 0x02, 0x91, 0xE0, 0x22, 0x02
	.byte 0x5D, 0xE4, 0x22, 0x02, 0x2D, 0xE6, 0x22, 0x02, 0x31, 0xE6, 0x22, 0x02, 0x35, 0xE6, 0x22, 0x02
	.byte 0x61, 0xE8, 0x22, 0x02, 0x09, 0xE9, 0x22, 0x02, 0x49, 0xE9, 0x22, 0x02, 0xC5, 0xE9, 0x22, 0x02
	.byte 0x2D, 0xEA, 0x22, 0x02, 0xB9, 0xEB, 0x22, 0x02, 0xC5, 0xEB, 0x22, 0x02, 0x15, 0xEC, 0x22, 0x02
	.byte 0x2D, 0xEC, 0x22, 0x02, 0x99, 0xEC, 0x22, 0x02, 0xB9, 0xED, 0x22, 0x02, 0x11, 0xEE, 0x22, 0x02
	.byte 0x55, 0xEE, 0x22, 0x02, 0xD5, 0xEE, 0x22, 0x02, 0xAD, 0xF0, 0x22, 0x02, 0x95, 0xF1, 0x22, 0x02
	.byte 0xF1, 0xBF, 0x22, 0x02, 0xD9, 0xE5, 0x22, 0x02, 0xDD, 0xE5, 0x22, 0x02, 0x25, 0xD8, 0x22, 0x02
	.byte 0xE1, 0xBE, 0x22, 0x02, 0xE1, 0xE5, 0x22, 0x02, 0x6D, 0xBF, 0x22, 0x02, 0x40, 0x56, 0x23, 0x02
	.byte 0x00, 0x59, 0x23, 0x02, 0xC0, 0x5B, 0x23, 0x02, 0x88, 0x5F, 0x23, 0x02, 0x7E, 0x7F, 0x7F, 0x7F

	.bss

_022368A0:
	.space 0x20
