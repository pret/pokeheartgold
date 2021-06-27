
	thumb_func_start ov82_0223DD60
ov82_0223DD60: @ 0x0223DD60
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, _0223DE1C @ =0x00000050
	movs r1, #2
	bl FUN_02006FF8
	bl ov82_0223E9B0
	movs r2, #2
	movs r0, #3
	movs r1, #0x69
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0xa1
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x69
	bl FUN_02007280
	movs r2, #0xa1
	movs r1, #0
	lsls r2, r2, #2
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0x69
	bl FUN_0201AC88
	str r0, [r5, #0x48]
	adds r0, r4, #0
	str r4, [r5]
	bl FUN_020072A4
	adds r4, r0, #0
	adds r0, r5, #0
	ldr r1, [r4]
	adds r0, #0xa0
	str r1, [r0]
	ldrb r0, [r4, #4]
	adds r1, r4, #6
	strb r0, [r5, #9]
	movs r0, #0x21
	lsls r0, r0, #4
	str r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_02028EA8
	adds r1, r5, #0
	adds r1, #0x9c
	str r0, [r1]
	movs r1, #0x85
	ldr r0, [r4, #0xc]
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [r4, #8]
	adds r0, r1, #4
	str r2, [r5, r0]
	adds r0, r1, #0
	ldr r2, [r4, #0x14]
	adds r0, #8
	str r2, [r5, r0]
	ldrh r0, [r4, #0x18]
	adds r1, #0x68
	adds r0, r0, #1
	strh r0, [r5, #0x1c]
	ldrb r0, [r4, #5]
	strb r0, [r5, #0xd]
	movs r0, #0xff
	strb r0, [r5, r1]
	strb r0, [r5, #0x18]
	movs r0, #0x75
	strb r0, [r5, #0x1f]
	adds r0, r5, #0
	bl ov82_0223E9E8
	ldrb r0, [r5, #9]
	bl FUN_0223792C
	cmp r0, #1
	bne _0223DE0E
	adds r0, r5, #0
	bl FUN_02096910
_0223DE0E:
	movs r0, #0
	str r0, [r6]
	movs r0, #1
	bl FUN_02002B8C
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223DE1C: .4byte 0x00000050
	thumb_func_end ov82_0223DD60

	thumb_func_start ov82_0223DE20
ov82_0223DE20: @ 0x0223DE20
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldrb r1, [r4, #0x18]
	cmp r1, #0xff
	beq _0223DE4A
	ldr r1, [r5]
	cmp r1, #2
	bne _0223DE4A
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	bne _0223DE4A
	bl ov82_0223F834
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov82_0223F2F8
_0223DE4A:
	ldr r0, [r5]
	cmp r0, #6
	bls _0223DE52
	b _0223DF68
_0223DE52:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223DE5E: @ jump table
	.2byte _0223DE86 - _0223DE5E - 2 @ case 0
	.2byte _0223DE6C - _0223DE5E - 2 @ case 1
	.2byte _0223DE9C - _0223DE5E - 2 @ case 2
	.2byte _0223DEEE - _0223DE5E - 2 @ case 3
	.2byte _0223DF30 - _0223DE5E - 2 @ case 4
	.2byte _0223DF46 - _0223DE5E - 2 @ case 5
	.2byte _0223DF54 - _0223DE5E - 2 @ case 6
_0223DE6C:
	adds r0, r4, #0
	bl ov82_0223E2A4
	cmp r0, #1
	bne _0223DE82
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov82_0223F2F8
	b _0223DE86
_0223DE82:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223DE86:
	adds r0, r4, #0
	bl ov82_0223DFBC
	cmp r0, #1
	bne _0223DF68
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov82_0223F2F8
	b _0223DF68
_0223DE9C:
	adds r0, r4, #0
	bl ov82_0223E2EC
	cmp r0, #1
	bne _0223DF68
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0223DEB8
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #3
	bl ov82_0223F2F8
	b _0223DF68
_0223DEB8:
	ldrb r0, [r4, #0xb]
	cmp r0, #1
	bne _0223DECC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov82_0223F2F8
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223DECC:
	ldrb r0, [r4, #9]
	bl FUN_0223792C
	cmp r0, #1
	bne _0223DEE2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov82_0223F2F8
	b _0223DF68
_0223DEE2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl ov82_0223F2F8
	b _0223DF68
_0223DEEE:
	adds r0, r4, #0
	bl ov82_0223E5D4
	cmp r0, #1
	bne _0223DF68
	ldrb r0, [r4, #0x19]
	cmp r0, #1
	bne _0223DF0E
	movs r0, #0
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ov82_0223F2F8
	b _0223DF68
_0223DF0E:
	ldrb r0, [r4, #9]
	bl FUN_0223792C
	cmp r0, #1
	bne _0223DF24
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov82_0223F2F8
	b _0223DF68
_0223DF24:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl ov82_0223F2F8
	b _0223DF68
_0223DF30:
	adds r0, r4, #0
	bl ov82_0223E7E8
	cmp r0, #1
	bne _0223DF68
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #5
	bl ov82_0223F2F8
	b _0223DF68
_0223DF46:
	adds r0, r4, #0
	bl ov82_0223E820
	cmp r0, #1
	bne _0223DF68
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223DF54:
	adds r0, r4, #0
	bl ov82_0223E888
	cmp r0, #1
	bne _0223DF68
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #4
	bl ov82_0223F2F8
_0223DF68:
	adds r4, #0xa8
	ldr r0, [r4]
	bl FUN_0202457C
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov82_0223DE20

	thumb_func_start ov82_0223DF74
ov82_0223DF74: @ 0x0223DF74
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	movs r1, #0x21
	lsls r1, r1, #4
	ldrb r2, [r0, #0xd]
	ldr r1, [r0, r1]
	strh r2, [r1]
	bl ov82_0223E8C4
	adds r0, r4, #0
	bl FUN_02007294
	ldr r2, _0223DFB4 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x69
	bl FUN_0201A9C4
	ldr r0, _0223DFB8 @ =0x00000050
	bl FUN_02006F7C
	movs r0, #1
	pop {r4, pc}
	nop
_0223DFB4: .4byte 0x04000304
_0223DFB8: .4byte 0x00000050
	thumb_func_end ov82_0223DF74

	thumb_func_start ov82_0223DFBC
ov82_0223DFBC: @ 0x0223DFBC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #3
	bhi _0223E068
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223DFD4: @ jump table
	.2byte _0223DFDC - _0223DFD4 - 2 @ case 0
	.2byte _0223DFFE - _0223DFD4 - 2 @ case 1
	.2byte _0223E030 - _0223DFD4 - 2 @ case 2
	.2byte _0223E05A - _0223DFD4 - 2 @ case 3
_0223DFDC:
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	bne _0223DFF6
	ldrb r0, [r4, #9]
	bl FUN_0223792C
	cmp r0, #1
	bne _0223DFF6
	bl FUN_02037BEC
	movs r0, #0x70
	bl FUN_02037AC0
_0223DFF6:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E068
_0223DFFE:
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	bne _0223E028
	ldrb r0, [r4, #9]
	bl FUN_0223792C
	cmp r0, #1
	bne _0223E028
	movs r0, #0x70
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E068
	bl FUN_02037BEC
	movs r0, #1
	strh r0, [r4, #0x12]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E068
_0223E028:
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E068
_0223E030:
	bl ov82_0223E070
	adds r0, r4, #0
	bl ov82_0223E0B0
	movs r0, #6
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E068
_0223E05A:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223E068
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223E068:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov82_0223DFBC

	thumb_func_start ov82_0223E070
ov82_0223E070: @ 0x0223E070
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	str r1, [sp]
	adds r4, r0, #0
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r1, #0x6c
	movs r2, #1
	movs r3, #2
	bl ov82_0223F040
	adds r1, r4, #0
	adds r0, r4, #0
	adds r1, #0x6c
	bl ov82_0223F134
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r2, #0
	adds r0, r4, #0
	adds r4, #0x5c
	str r2, [sp, #8]
	adds r1, r4, #0
	adds r3, r2, #0
	str r2, [sp, #0xc]
	bl ov82_0223EFCC
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov82_0223E070

	thumb_func_start ov82_0223E0B0
ov82_0223E0B0: @ 0x0223E0B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r0, #0x7c
	bl FUN_0201EE98
	subs r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	adds r0, r5, #0
	adds r0, #0x7c
	bl FUN_0201EE9C
	subs r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x7c
	bl FUN_0201EE90
	adds r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x7c
	bl FUN_0201EE94
	adds r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x7c
	bl FUN_0201EE8C
	str r0, [sp, #0x14]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xf
	movs r2, #0
	str r0, [sp, #8]
	adds r1, r5, #0
	adds r0, r5, #0
	adds r1, #0x7c
	adds r3, r2, #0
	str r2, [sp, #0xc]
	bl ov82_0223F1AC
	adds r0, r5, #0
	movs r1, #4
	bl ov82_0223EECC
	str r6, [sp]
	str r4, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x48]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	adds r3, r7, #0
	bl ov82_0223E140
	ldr r0, [r5, #0x48]
	ldr r1, [sp, #0x14]
	bl FUN_0201EFBC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov82_0223E0B0

	thumb_func_start ov82_0223E140
ov82_0223E140: @ 0x0223E140
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r5, [sp, #0x4c]
	adds r6, r3, #0
	str r6, [sp]
	movs r2, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	add r2, sp, #0x30
	ldrh r2, [r2, #0x18]
	ldr r3, [sp, #0x18]
	str r0, [sp, #0x10]
	bl FUN_0201C8C4
	add r1, sp, #0x30
	ldrh r4, [r1, #0x18]
	ldrb r7, [r1, #0x10]
	ldr r0, [sp, #0x18]
	adds r2, r4, #2
	adds r0, r0, r7
	subs r0, r0, #1
	str r0, [sp, #0x20]
	ldr r3, [sp, #0x20]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	str r6, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	add r0, sp, #0x30
	ldrb r0, [r0, #0x14]
	adds r2, r4, #6
	lsls r2, r2, #0x10
	str r0, [sp, #0x28]
	adds r0, r6, r0
	subs r0, r0, #1
	str r0, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x18]
	lsrs r2, r2, #0x10
	bl FUN_0201C8C4
	ldr r0, [sp, #0x24]
	adds r2, r4, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x20]
	adds r2, #8
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	subs r0, r7, #2
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r2, r4, #1
	adds r7, r0, #1
	ldr r0, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsls r0, r0, #0x18
	lsls r3, r7, #0x18
	str r6, [sp]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [sp, #0x24]
	adds r2, r4, #7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	lsls r2, r2, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	lsls r3, r7, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	ldr r0, [sp, #0x28]
	adds r6, r6, #1
	subs r7, r0, #2
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	adds r2, r4, #3
	lsls r2, r2, #0x10
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x18]
	lsrs r2, r2, #0x10
	bl FUN_0201C8C4
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x20]
	adds r2, r4, #5
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov82_0223E140

	thumb_func_start ov82_0223E2A4
ov82_0223E2A4: @ 0x0223E2A4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0223E2E8
	ldr r0, [r4, #4]
	bl FUN_020072A8
	cmp r0, #1
	bne _0223E2E8
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	movs r0, #0x83
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r4, #0
	bl ov82_0223E974
	movs r0, #0
	strh r0, [r4, #0x10]
	movs r0, #1
	pop {r4, pc}
_0223E2E8:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov82_0223E2A4

	thumb_func_start ov82_0223E2EC
ov82_0223E2EC: @ 0x0223E2EC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #7
	bhi _0223E33A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223E304: @ jump table
	.2byte _0223E314 - _0223E304 - 2 @ case 0
	.2byte _0223E31E - _0223E304 - 2 @ case 1
	.2byte _0223E3EE - _0223E304 - 2 @ case 2
	.2byte _0223E448 - _0223E304 - 2 @ case 3
	.2byte _0223E4AA - _0223E304 - 2 @ case 4
	.2byte _0223E4E4 - _0223E304 - 2 @ case 5
	.2byte _0223E532 - _0223E304 - 2 @ case 6
	.2byte _0223E58A - _0223E304 - 2 @ case 7
_0223E314:
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	strb r0, [r4, #8]
	b _0223E5B6
_0223E31E:
	ldr r1, _0223E5BC @ =0x021D110C
	ldr r1, [r1, #0x48]
	bl ov82_0223F300
	adds r0, r4, #0
	bl ov82_0223F53C
	cmp r0, #0
	bne _0223E33C
	adds r0, r4, #0
	bl ov82_0223F488
	cmp r0, #0
	bne _0223E33C
_0223E33A:
	b _0223E5B6
_0223E33C:
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	bne _0223E36E
	ldr r0, _0223E5C0 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	strh r0, [r4, #0x10]
	movs r0, #7
	strb r0, [r4, #8]
	b _0223E5B6
_0223E36E:
	adds r0, r4, #0
	bl ov82_0223F6E4
	cmp r0, #1
	ldrb r0, [r4, #0xd]
	bne _0223E38E
	bl FUN_02237920
	cmp r0, #9
	beq _0223E3C2
	ldr r0, _0223E5C4 @ =0x000005F3
	bl FUN_0200604C
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223E38E:
	bl ov82_0223F6C4
	movs r1, #0x86
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	bl FUN_02030BD0
	cmp r0, #0xa
	blo _0223E3AC
	ldr r0, _0223E5C4 @ =0x000005F3
	bl FUN_0200604C
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223E3AC:
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #9
	bne _0223E3C2
	ldr r0, _0223E5C4 @ =0x000005F3
	bl FUN_0200604C
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223E3C2:
	ldr r0, _0223E5C0 @ =0x000005DD
	bl FUN_0200604C
	ldrb r0, [r4, #9]
	bl FUN_0223792C
	cmp r0, #0
	bne _0223E3E4
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #0x48]
	movs r2, #1
	bl ov82_0223F5E0
	ldr r0, [r4, #0x48]
	movs r1, #3
	bl FUN_0201EFBC
_0223E3E4:
	movs r0, #0
	strh r0, [r4, #0x14]
	movs r0, #2
	strb r0, [r4, #8]
	b _0223E5B6
_0223E3EE:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, #0x14]
	ldrsh r0, [r4, r0]
	rsbs r0, r0, #0
	bl ov82_0223F948
	movs r0, #0x14
	ldrsh r0, [r4, r0]
	cmp r0, #8
	bne _0223E45C
	ldrb r0, [r4, #9]
	bl FUN_0223792C
	cmp r0, #0
	bne _0223E41C
	adds r0, r4, #0
	bl ov82_0223F84C
	movs r0, #3
	strb r0, [r4, #8]
	b _0223E5B6
_0223E41C:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x4c
	bl ov82_0223FD78
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov82_0223EF7C
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #0xd]
	add sp, #0x18
	strb r0, [r4, #0x1a]
	movs r0, #1
	strb r0, [r4, #0x17]
	pop {r3, r4, r5, pc}
_0223E448:
	adds r0, #0x8c
	ldr r0, [r0]
	bl ov82_0223FE18
	cmp r0, #0
	beq _0223E45C
	cmp r0, #1
	beq _0223E45E
	cmp r0, #2
	beq _0223E49E
_0223E45C:
	b _0223E5B6
_0223E45E:
	adds r0, r4, #0
	bl ov82_0223F834
	adds r0, r4, #0
	bl ov82_0223F6CC
	cmp r0, #1
	bne _0223E482
	adds r0, r4, #0
	bl ov82_0223F6E4
	cmp r0, #0
	bne _0223E482
	ldrb r0, [r4, #0xd]
	strb r0, [r4, #0x1f]
	movs r0, #5
	strb r0, [r4, #8]
	b _0223E5B6
_0223E482:
	ldr r0, _0223E5C8 @ =0x000005DC
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0223E5CC @ =0x00000623
	bl FUN_0200604C
	ldrb r0, [r4, #0x1f]
	cmp r0, #0x75
	beq _0223E498
	strb r0, [r4, #0xd]
_0223E498:
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223E49E:
	adds r0, r4, #0
	bl ov82_0223F834
	movs r0, #4
	strb r0, [r4, #8]
	b _0223E5B6
_0223E4AA:
	movs r0, #0x14
	ldrsh r1, [r4, r0]
	subs r1, r1, #1
	strh r1, [r4, #0x14]
	ldrsh r0, [r4, r0]
	rsbs r0, r0, #0
	bl ov82_0223F948
	movs r0, #0x14
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _0223E5B6
	adds r0, r4, #0
	bl ov82_0223F8E4
	ldrb r0, [r4, #0x1e]
	cmp r0, #1
	bne _0223E4D4
	movs r0, #0
	strb r0, [r4, #8]
	b _0223E5B6
_0223E4D4:
	cmp r0, #0
	bne _0223E4DE
	movs r0, #1
	strb r0, [r4, #8]
	b _0223E5B6
_0223E4DE:
	bl GF_AssertFail
	b _0223E5B6
_0223E4E4:
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x4c
	bl ov82_0223FD78
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	movs r3, #1
	str r3, [sp]
	str r0, [sp, #4]
	adds r1, r4, #0
	str r3, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	movs r0, #0xf
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	adds r0, r4, #0
	adds r1, #0x4c
	movs r2, #0x20
	bl ov82_0223EF1C
	strb r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x4c
	bl FUN_0201D578
	movs r0, #6
	strb r0, [r4, #8]
	b _0223E5B6
_0223E532:
	ldrb r0, [r4, #0xa]
	bl FUN_02020094
	cmp r0, #0
	bne _0223E5B6
	movs r0, #1
	strb r0, [r4, #0x1e]
	adds r0, r4, #0
	bl ov82_0223F90C
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov82_0223FCFC
	ldr r0, [r4, #0x48]
	movs r1, #0x13
	movs r2, #0
	bl ov82_0223F5E0
	ldr r1, [r4, #0x48]
	adds r0, r4, #0
	bl ov82_0223F580
	movs r0, #0x13
	strb r0, [r4, #0xd]
	adds r0, r4, #0
	bl ov82_0223F558
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov82_0223F570
	adds r2, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl ov82_0223FCBC
	movs r0, #4
	strb r0, [r4, #8]
	b _0223E5B6
_0223E58A:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223E5B6
	adds r0, r4, #0
	bl ov82_0223F224
	adds r0, r4, #0
	bl ov82_0223E8C4
	adds r1, r4, #0
	adds r1, #0xa4
	ldr r0, _0223E5D0 @ =0x02103A1C
	ldr r1, [r1]
	movs r2, #0x69
	bl FUN_0200724C
	str r0, [r4, #4]
	movs r0, #1
	add sp, #0x18
	strb r0, [r4, #0xb]
	pop {r3, r4, r5, pc}
_0223E5B6:
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223E5BC: .4byte 0x021D110C
_0223E5C0: .4byte 0x000005DD
_0223E5C4: .4byte 0x000005F3
_0223E5C8: .4byte 0x000005DC
_0223E5CC: .4byte 0x00000623
_0223E5D0: .4byte 0x02103A1C
	thumb_func_end ov82_0223E2EC

	thumb_func_start ov82_0223E5D4
ov82_0223E5D4: @ 0x0223E5D4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #9
	bhi _0223E632
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223E5EA: @ jump table
	.2byte _0223E5FE - _0223E5EA - 2 @ case 0
	.2byte _0223E620 - _0223E5EA - 2 @ case 1
	.2byte _0223E708 - _0223E5EA - 2 @ case 2
	.2byte _0223E666 - _0223E5EA - 2 @ case 3
	.2byte _0223E6C2 - _0223E5EA - 2 @ case 4
	.2byte _0223E726 - _0223E5EA - 2 @ case 5
	.2byte _0223E762 - _0223E5EA - 2 @ case 6
	.2byte _0223E772 - _0223E5EA - 2 @ case 7
	.2byte _0223E7AA - _0223E5EA - 2 @ case 8
	.2byte _0223E7BA - _0223E5EA - 2 @ case 9
_0223E5FE:
	ldrb r0, [r4, #0x1a]
	bl ov82_0223F6C4
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #5
	bl ov82_0223F6E8
	cmp r0, #1
	bne _0223E632
	movs r0, #0
	strb r0, [r4, #0x1b]
	strb r0, [r4, #0x1a]
	strb r0, [r4, #0x17]
	movs r0, #1
	strb r0, [r4, #8]
	b _0223E7D6
_0223E620:
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _0223E62C
	subs r0, r0, #1
	strb r0, [r4, #0x1b]
	b _0223E7D6
_0223E62C:
	ldrb r0, [r4, #0x16]
	cmp r0, #2
	bhs _0223E634
_0223E632:
	b _0223E7D6
_0223E634:
	movs r0, #0
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x18]
	cmp r0, #0x14
	bhs _0223E652
	bl FUN_0203769C
	cmp r0, #0
	bne _0223E64C
	movs r0, #2
	strb r0, [r4, #8]
	b _0223E7D6
_0223E64C:
	movs r0, #3
	strb r0, [r4, #8]
	b _0223E7D6
_0223E652:
	bl FUN_0203769C
	cmp r0, #0
	bne _0223E660
	movs r0, #3
	strb r0, [r4, #8]
	b _0223E7D6
_0223E660:
	movs r0, #2
	strb r0, [r4, #8]
	b _0223E7D6
_0223E666:
	movs r0, #0
	bl ov82_0223F948
	movs r1, #0
	movs r0, #0x82
	strh r1, [r4, #0x14]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov82_0223FCB0
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x4c
	bl ov82_0223FD78
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_0222A7CC
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #1
	bl ov82_0223EF7C
	strb r0, [r4, #0xa]
	movs r0, #0xa
	movs r1, #0x9f
	strb r0, [r4, #0x1b]
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0x48]
	movs r2, #2
	bl ov82_0223F5E0
	ldr r0, [r4, #0x48]
	movs r1, #3
	bl FUN_0201EFBC
	movs r0, #4
	strb r0, [r4, #8]
	b _0223E7D6
_0223E6C2:
	ldr r1, _0223E7DC @ =0x0000027D
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _0223E73A
	cmp r2, #1
	bne _0223E6D8
	subs r0, r1, #1
	ldrb r0, [r4, r0]
	strb r0, [r4, #0xd]
	movs r0, #1
	pop {r4, pc}
_0223E6D8:
	bl ov82_0223F90C
	movs r1, #0x9f
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0x48]
	movs r2, #0
	bl ov82_0223F5E0
	ldr r0, [r4, #0x48]
	movs r1, #3
	bl FUN_0201EFBC
	movs r0, #0x9f
	movs r2, #0xff
	lsls r0, r0, #2
	strb r2, [r4, r0]
	movs r1, #0
	adds r0, r0, #1
	strb r1, [r4, r0]
	strb r2, [r4, #0x18]
	movs r0, #1
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0223E708:
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #0x48]
	movs r2, #1
	bl ov82_0223F5E0
	ldr r0, [r4, #0x48]
	movs r1, #3
	bl FUN_0201EFBC
	adds r0, r4, #0
	bl ov82_0223F84C
	movs r0, #5
	strb r0, [r4, #8]
	b _0223E7D6
_0223E726:
	adds r0, #0x8c
	ldr r0, [r0]
	bl ov82_0223FE18
	cmp r0, #0
	beq _0223E7D6
	cmp r0, #1
	beq _0223E73C
	cmp r0, #2
	beq _0223E756
_0223E73A:
	b _0223E7D6
_0223E73C:
	ldr r0, _0223E7E0 @ =0x000005DC
	movs r1, #0
	bl FUN_02006154
	ldr r0, _0223E7E4 @ =0x00000623
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov82_0223F834
	movs r0, #6
	strb r0, [r4, #8]
	b _0223E7D6
_0223E756:
	adds r0, r4, #0
	bl ov82_0223F834
	movs r0, #7
	strb r0, [r4, #8]
	b _0223E7D6
_0223E762:
	movs r1, #6
	movs r2, #1
	bl ov82_0223F6E8
	cmp r0, #1
	bne _0223E7D6
	movs r0, #1
	pop {r4, pc}
_0223E772:
	movs r1, #0x14
	ldrsh r2, [r4, r1]
	cmp r2, #0
	ble _0223E788
	subs r0, r2, #1
	strh r0, [r4, #0x14]
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	bl ov82_0223F948
	b _0223E7D6
_0223E788:
	movs r1, #6
	movs r2, #2
	bl ov82_0223F6E8
	cmp r0, #1
	bne _0223E7D6
	adds r0, r4, #0
	bl ov82_0223F8E4
	movs r0, #0x9f
	movs r1, #0xff
	lsls r0, r0, #2
	strb r1, [r4, r0]
	strb r1, [r4, #0x18]
	movs r0, #1
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0223E7AA:
	bl FUN_02037BEC
	movs r0, #0x68
	bl FUN_02037AC0
	movs r0, #9
	strb r0, [r4, #8]
	b _0223E7D6
_0223E7BA:
	movs r0, #0x68
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E7D6
	bl FUN_02037BEC
	movs r0, #0x69
	bl FUN_020379A0
	movs r0, #0xff
	strb r0, [r4, #0x18]
	movs r0, #1
	pop {r4, pc}
_0223E7D6:
	movs r0, #0
	pop {r4, pc}
	nop
_0223E7DC: .4byte 0x0000027D
_0223E7E0: .4byte 0x000005DC
_0223E7E4: .4byte 0x00000623
	thumb_func_end ov82_0223E5D4

	thumb_func_start ov82_0223E7E8
ov82_0223E7E8: @ 0x0223E7E8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #8]
	cmp r0, #0
	beq _0223E7F8
	cmp r0, #1
	beq _0223E80A
	b _0223E81C
_0223E7F8:
	bl FUN_02037BEC
	movs r0, #0x68
	bl FUN_02037AC0
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E81C
_0223E80A:
	movs r0, #0x68
	bl FUN_02037B38
	cmp r0, #1
	bne _0223E81C
	bl FUN_02037BEC
	movs r0, #1
	pop {r4, pc}
_0223E81C:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov82_0223E7E8

	thumb_func_start ov82_0223E820
ov82_0223E820: @ 0x0223E820
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223E836
	cmp r1, #1
	beq _0223E842
	cmp r1, #2
	beq _0223E872
	b _0223E880
_0223E836:
	movs r0, #0xa
	strb r0, [r4, #0x1b]
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E880
_0223E842:
	ldrb r1, [r4, #0x1b]
	subs r1, r1, #1
	strb r1, [r4, #0x1b]
	ldrb r1, [r4, #0x1b]
	cmp r1, #0
	bne _0223E880
	bl ov82_0223F90C
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E880
_0223E872:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0223E880
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0223E880:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov82_0223E820

	thumb_func_start ov82_0223E888
ov82_0223E888: @ 0x0223E888
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	cmp r1, #0
	beq _0223E898
	cmp r1, #1
	beq _0223E8BA
	b _0223E8BE
_0223E898:
	bl ov82_0223F834
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov82_0223FCB0
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	bl FUN_0200E9BC
	ldrb r0, [r4, #8]
	adds r0, r0, #1
	strb r0, [r4, #8]
	b _0223E8BE
_0223E8BA:
	movs r0, #1
	pop {r4, pc}
_0223E8BE:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov82_0223E888

	thumb_func_start ov82_0223E8C4
ov82_0223E8C4: @ 0x0223E8C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223E8D6
	bl ov82_0223FC9C
_0223E8D6:
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0223E8E4
	bl ov82_0223FC9C
_0223E8E4:
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl ov82_0223FDC0
	bl FUN_0203A914
	adds r0, r6, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #2
	bl FUN_02003150
	adds r0, r6, #0
	adds r0, #0x94
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02003150
	adds r0, r6, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_02003104
	adds r0, r6, #0
	movs r1, #0
	adds r0, #0x94
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0xa8
	bl ov82_0223FBBC
	ldr r0, [r6, #0x20]
	bl FUN_0200BB44
	ldr r0, [r6, #0x24]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x28]
	bl FUN_02026380
	ldr r0, [r6, #0x2c]
	bl FUN_02026380
	adds r0, r6, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl FUN_0200CD94
	movs r4, #0
	adds r5, r6, #0
_0223E94A:
	ldr r0, [r5, #0x30]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _0223E94A
	adds r0, r6, #0
	adds r0, #0x4c
	bl ov82_0223FD5C
	ldr r0, [r6, #0x48]
	bl ov82_0223EBB8
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200770C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov82_0223E8C4

	thumb_func_start ov82_0223E974
ov82_0223E974: @ 0x0223E974
	push {r4, lr}
	adds r4, r0, #0
	bl ov82_0223E9B0
	movs r0, #0x69
	bl FUN_0201AC88
	str r0, [r4, #0x48]
	adds r0, r4, #0
	bl ov82_0223E9E8
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	bne _0223E9AE
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl ov82_0223FCFC
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x80
	movs r2, #0xa8
	bl ov82_0223FCBC
_0223E9AE:
	pop {r4, pc}
	thumb_func_end ov82_0223E974

	thumb_func_start ov82_0223E9B0
ov82_0223E9B0: @ 0x0223E9B0
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0223E9E0 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0223E9E4 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_0223E9E0: .4byte 0xFFFFE0FF
_0223E9E4: .4byte 0x04001000
	thumb_func_end ov82_0223E9B0

	thumb_func_start ov82_0223E9E8
ov82_0223E9E8: @ 0x0223E9E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0xb7
	movs r1, #0x69
	bl FUN_02007688
	movs r1, #0x22
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov82_0223EB3C
	adds r0, r5, #0
	bl ov82_0223EB9C
	ldr r2, _0223EB2C @ =0x000001B9
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x69
	bl FUN_0200BAF8
	str r0, [r5, #0x20]
	movs r0, #0x69
	bl FUN_0200BD08
	str r0, [r5, #0x24]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x69
	bl FUN_02026354
	str r0, [r5, #0x28]
	movs r0, #0x96
	lsls r0, r0, #2
	movs r1, #0x69
	bl FUN_02026354
	str r0, [r5, #0x2c]
	movs r6, #0
	adds r4, r5, #0
	movs r7, #0x20
_0223EA3C:
	adds r0, r7, #0
	movs r1, #0x69
	bl FUN_02026354
	str r0, [r4, #0x30]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #2
	blt _0223EA3C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x69
	bl FUN_02003030
	movs r1, #6
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x69
	bl FUN_0200304C
	movs r0, #4
	movs r1, #0x40
	movs r2, #0x69
	bl FUN_02003030
	movs r0, #0xf
	movs r1, #0xe
	movs r2, #0
	movs r3, #0x69
	bl FUN_0200CC74
	adds r1, r5, #0
	adds r1, #0x98
	str r0, [r1]
	adds r1, r5, #0
	ldr r0, [r5, #0x48]
	adds r1, #0x4c
	bl ov82_0223FD2C
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov82_0223F580
	ldr r2, _0223EB30 @ =0x04000304
	ldr r0, _0223EB34 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	bl FUN_02022D24
	adds r0, r5, #0
	bl ov82_0223F558
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov82_0223F570
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xa8
	movs r2, #1
	adds r3, r4, #0
	str r1, [sp, #4]
	bl ov82_0223FC48
	movs r1, #0x81
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #0xa0
	movs r1, #1
	str r3, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xa8
	adds r2, r1, #0
	bl ov82_0223FC48
	movs r1, #0x82
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r1, #0xc
	ldr r0, [r5, r1]
	movs r1, #0
	bl FUN_02074644
	adds r1, r0, #0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov82_0223FD18
	bl FUN_02037474
	cmp r0, #0
	beq _0223EB12
	movs r0, #1
	movs r1, #0x10
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	bl FUN_0203A880
_0223EB12:
	movs r0, #0x69
	bl ov82_0223FDB8
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	ldr r0, _0223EB38 @ =ov82_0223EC0C
	adds r1, r5, #0
	bl FUN_0201A0FC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223EB2C: .4byte 0x000001B9
_0223EB30: .4byte 0x04000304
_0223EB34: .4byte 0xFFFF7FFF
_0223EB38: .4byte ov82_0223EC0C
	thumb_func_end ov82_0223E9E8

	thumb_func_start ov82_0223EB3C
ov82_0223EB3C: @ 0x0223EB3C
	push {r4, lr}
	adds r4, r0, #0
	bl ov82_0223EC48
	ldr r0, [r4, #0x48]
	bl ov82_0223EC68
	adds r0, r4, #0
	bl ov82_0223ED94
	movs r0, #0x69
	bl FUN_020030E8
	adds r1, r4, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x94
	movs r1, #2
	ldr r0, [r0]
	lsls r2, r1, #8
	movs r3, #0x69
	bl FUN_02003120
	adds r0, r4, #0
	adds r0, #0x94
	movs r2, #2
	ldr r0, [r0]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x69
	bl FUN_02003120
	adds r0, r4, #0
	movs r1, #3
	bl ov82_0223EDF0
	bl ov82_0223EE38
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #5
	bl ov82_0223EE6C
	pop {r4, pc}
	thumb_func_end ov82_0223EB3C

	thumb_func_start ov82_0223EB9C
ov82_0223EB9C: @ 0x0223EB9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02074644
	adds r4, #0xa8
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov82_0223F95C
	pop {r4, pc}
	thumb_func_end ov82_0223EB9C

	thumb_func_start ov82_0223EBB8
ov82_0223EBB8: @ 0x0223EBB8
	push {r4, lr}
	movs r2, #1
	lsls r2, r2, #0x1a
	adds r4, r0, #0
	ldr r1, [r2]
	ldr r0, _0223EC08 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
_0223EC08: .4byte 0xFFFF1FFF
	thumb_func_end ov82_0223EBB8

	thumb_func_start ov82_0223EC0C
ov82_0223EC0C: @ 0x0223EC0C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0223EC3E
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _0223EC24
	bl FUN_0200398C
_0223EC24:
	ldr r0, [r4, #0x48]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _0223EC40 @ =0x027E0000
	ldr r1, _0223EC44 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
_0223EC3E:
	pop {r4, pc}
	.align 2, 0
_0223EC40: .4byte 0x027E0000
_0223EC44: .4byte 0x00003FF8
	thumb_func_end ov82_0223EC0C

	thumb_func_start ov82_0223EC48
ov82_0223EC48: @ 0x0223EC48
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0223EC64 @ =0x0223FEC4
	add r3, sp, #0
	movs r2, #5
_0223EC52:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0223EC52
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_0223EC64: .4byte 0x0223FEC4
	thumb_func_end ov82_0223EC48

	thumb_func_start ov82_0223EC68
ov82_0223EC68: @ 0x0223EC68
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _0223ED78 @ =0x0223FE28
	add r3, sp, #0x8c
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0223ED7C @ =0x0223FE54
	add r3, sp, #0x70
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
	movs r3, #0x69
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0223ED80 @ =0x0223FE70
	add r3, sp, #0x54
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
	movs r3, #0x69
	bl FUN_0201C1C4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0223ED84 @ =0x0223FE8C
	add r3, sp, #0x38
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
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	ldr r5, _0223ED88 @ =0x0223FEA8
	add r3, sp, #0x1c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	adds r0, r4, #0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _0223ED8C @ =0x0223FE38
	add r3, sp, #0
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
	ldr r1, _0223ED90 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	strh r2, [r1]
	adds r1, r0, #0
	bl FUN_02022C60
	add sp, #0x9c
	pop {r4, r5, pc}
	.align 2, 0
_0223ED78: .4byte 0x0223FE28
_0223ED7C: .4byte 0x0223FE54
_0223ED80: .4byte 0x0223FE70
_0223ED84: .4byte 0x0223FE8C
_0223ED88: .4byte 0x0223FEA8
_0223ED8C: .4byte 0x0223FE38
_0223ED90: .4byte 0x04000008
	thumb_func_end ov82_0223EC68

	thumb_func_start ov82_0223ED94
ov82_0223ED94: @ 0x0223ED94
	push {r3, r4, r5, lr}
	ldrb r0, [r0, #9]
	bl FUN_0223792C
	cmp r0, #0
	beq _0223EDEA
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r1, [r0]
	ldr r3, _0223EDEC @ =0xFFFF1FFF
	adds r4, r0, #0
	ands r1, r3
	str r1, [r0]
	adds r4, #0x48
	ldrh r5, [r4]
	movs r1, #0x3f
	movs r2, #0x1f
	bics r5, r1
	orrs r5, r2
	strh r5, [r4]
	adds r4, r0, #0
	adds r4, #0x4a
	ldrh r5, [r4]
	bics r5, r1
	orrs r2, r5
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r4]
	movs r2, #0xf
	adds r1, r0, #0
	lsls r2, r2, #0xc
	adds r1, #0x40
	strh r2, [r1]
	adds r1, r0, #0
	movs r4, #0x10
	adds r1, #0x44
	strh r4, [r1]
	ldr r1, [r0]
	adds r2, r1, #0
	ands r2, r3
	lsls r1, r4, #9
	orrs r1, r2
	str r1, [r0]
_0223EDEA:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223EDEC: .4byte 0xFFFF1FFF
	thumb_func_end ov82_0223ED94

	thumb_func_start ov82_0223EDF0
ov82_0223EDF0: @ 0x0223EDF0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x69
	str r0, [sp, #0xc]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x48]
	movs r1, #0x17
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x69
	str r0, [sp, #0xc]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x48]
	movs r1, #0x18
	adds r3, r4, #0
	bl FUN_02007B68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov82_0223EDF0

	thumb_func_start ov82_0223EE38
ov82_0223EE38: @ 0x0223EE38
	push {r3, r4, lr}
	sub sp, #4
	movs r0, #0xb7
	movs r1, #0x99
	add r2, sp, #0
	movs r3, #0x69
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp]
	movs r1, #0xc0
	ldr r0, [r0, #0xc]
	blx DC_FlushRange
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #0xc]
	movs r2, #0xc0
	blx FUN_020CFC6C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov82_0223EE38

	thumb_func_start ov82_0223EE6C
ov82_0223EE6C: @ 0x0223EE6C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0x69
	str r0, [sp, #0xc]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x48]
	movs r1, #0x81
	adds r3, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x69
	str r0, [sp, #0xc]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x48]
	movs r1, #0x82
	adds r3, r4, #0
	bl FUN_02007B68
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x69
	str r0, [sp, #4]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0xbe
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov82_0223EE6C

	thumb_func_start ov82_0223EECC
ov82_0223EECC: @ 0x0223EECC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x69
	bl FUN_0201C1C4
	movs r1, #1
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x69
	str r0, [sp, #0xc]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x48]
	movs r1, #0x85
	adds r3, r4, #0
	bl FUN_02007B44
	movs r3, #0x20
	str r3, [sp]
	movs r0, #0x69
	str r0, [sp, #4]
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0xc0
	movs r2, #4
	bl FUN_02007B8C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov82_0223EECC

	thumb_func_start ov82_0223EF1C
ov82_0223EF1C: @ 0x0223EF1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	add r1, sp, #0x38
	ldrb r1, [r1]
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x2c]
	adds r1, r6, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x28]
	add r2, sp, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r3, r7, #0
	str r0, [sp, #4]
	add r0, sp, #0x38
	ldrb r1, [r0]
	ldrb r0, [r2, #0x18]
	ldrb r2, [r2, #0x1c]
	lsls r0, r0, #0x18
	lsls r2, r2, #0x18
	lsrs r0, r0, #8
	lsrs r2, r2, #0x10
	orrs r0, r2
	orrs r0, r1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	ldr r2, [r5, #0x28]
	adds r0, r4, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov82_0223EF1C

	thumb_func_start ov82_0223EF7C
ov82_0223EF7C: @ 0x0223EF7C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	movs r3, #1
	adds r4, r1, #0
	str r3, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	movs r1, #0xf
	str r1, [sp, #0x10]
	adds r5, r0, #0
	adds r1, r5, #0
	str r2, [sp, #0x14]
	adds r1, #0x4c
	adds r2, r4, #0
	bl ov82_0223EF1C
	adds r5, #0x4c
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0201D578
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov82_0223EF7C

	thumb_func_start ov82_0223EFB4
ov82_0223EFB4: @ 0x0223EFB4
	push {r3, lr}
	sub sp, #8
	movs r3, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x24]
	movs r3, #2
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov82_0223EFB4

	thumb_func_start ov82_0223EFCC
ov82_0223EFCC: @ 0x0223EFCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r1, #0
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_02074644
	movs r1, #0xb3
	add r2, sp, #0x10
	bl FUN_0206E540
	add r1, sp, #0x30
	ldrb r1, [r1, #0x18]
	adds r0, r5, #0
	bl FUN_0201D978
	movs r0, #0xb
	movs r1, #0x69
	bl FUN_02026354
	add r1, sp, #0x10
	adds r6, r0, #0
	bl FUN_020269A0
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	add r2, sp, #0x30
	ldrb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	ldrb r1, [r2, #0x18]
	lsls r0, r0, #0x18
	lsls r3, r3, #0x18
	lsrs r0, r0, #8
	lsrs r3, r3, #0x10
	orrs r0, r3
	orrs r0, r1
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldrb r1, [r2, #0x1c]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov82_0223EFCC

	thumb_func_start ov82_0223F040
ov82_0223F040: @ 0x0223F040
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r1, [sp, #0x10]
	adds r0, r1, #0
	add r1, sp, #0x30
	ldrb r1, [r1, #0x10]
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0201D978
	ldr r2, _0223F108 @ =0x000002DF
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x69
	bl FUN_0200BAF8
	str r0, [sp, #0x24]
	movs r0, #0xb
	movs r1, #0x69
	bl FUN_02026354
	adds r5, r0, #0
	movs r0, #0
	lsls r2, r4, #0x18
	lsrs r3, r2, #8
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x10
	str r0, [sp, #0x28]
	str r0, [sp, #0x20]
	movs r0, #0x10
	add r1, sp, #0x30
	str r0, [sp, #0x14]
	ldrb r0, [r1, #0x10]
	orrs r2, r3
	orrs r0, r2
	str r0, [sp, #0x1c]
	ldrb r0, [r1, #0x14]
	str r0, [sp, #0x18]
_0223F08C:
	movs r4, #0
	movs r6, #1
_0223F090:
	ldr r0, [sp, #0x20]
	adds r7, r4, r0
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02237920
	cmp r0, #0xfe
	beq _0223F0D4
	adds r0, r5, #0
	bl FUN_020263AC
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02237920
	adds r1, r0, #0
	ldr r0, [sp, #0x24]
	adds r2, r5, #0
	bl FUN_0200BB6C
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	adds r2, r5, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r3, r6, #0
	bl FUN_020200FC
_0223F0D4:
	adds r4, r4, #1
	adds r6, #0x40
	cmp r4, #4
	blt _0223F090
	ldr r0, [sp, #0x20]
	adds r0, r0, #4
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	adds r0, #0x24
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #5
	blt _0223F08C
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [sp, #0x24]
	bl FUN_0200BB44
	ldr r0, [sp, #0x10]
	bl FUN_0201D578
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223F108: .4byte 0x000002DF
	thumb_func_end ov82_0223F040

	thumb_func_start ov82_0223F10C
ov82_0223F10C: @ 0x0223F10C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	str r4, [sp]
	str r3, [sp, #4]
	ldr r1, [sp, #0x18]
	adds r0, #0x98
	str r1, [sp, #8]
	adds r1, r2, #0
	ldr r0, [r0]
	movs r2, #2
	movs r3, #0
	bl FUN_0200CDF0
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov82_0223F10C

	thumb_func_start ov82_0223F134
ov82_0223F134: @ 0x0223F134
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r0, #4
	str r1, [sp, #4]
	str r0, [sp, #8]
_0223F146:
	movs r4, #0
	movs r5, #0x12
_0223F14A:
	ldr r0, [sp, #0xc]
	adds r7, r4, r0
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02237920
	cmp r0, #0xfe
	beq _0223F18A
	cmp r0, #9
	beq _0223F18A
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl ov82_0223F6C4
	movs r1, #0x86
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	bl FUN_02030BD0
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xa
	bls _0223F17C
	movs r2, #0xa
_0223F17C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	str r0, [sp]
	adds r0, r6, #0
	adds r3, r5, #0
	bl ov82_0223F10C
_0223F18A:
	adds r4, r4, #1
	adds r5, #0x40
	cmp r4, #4
	blt _0223F14A
	ldr r0, [sp, #0xc]
	adds r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x24
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _0223F146
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov82_0223F134

	thumb_func_start ov82_0223F1AC
ov82_0223F1AC: @ 0x0223F1AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r1, #0
	add r1, sp, #0x18
	ldrb r1, [r1, #0x18]
	adds r0, r5, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_0201D978
	ldr r2, _0223F220 @ =0x000001B9
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x69
	bl FUN_0200BAF8
	movs r1, #0x25
	str r0, [sp, #0x10]
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0201D978
	str r4, [sp]
	movs r4, #0
	str r4, [sp, #4]
	add r2, sp, #0x18
	ldrb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	ldrb r1, [r2, #0x18]
	lsls r0, r0, #0x18
	lsls r3, r3, #0x18
	lsrs r0, r0, #8
	lsrs r3, r3, #0x10
	orrs r0, r3
	orrs r0, r1
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldrb r1, [r2, #0x1c]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [sp, #0x10]
	bl FUN_0200BB44
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223F220: .4byte 0x000001B9
	thumb_func_end ov82_0223F1AC

	thumb_func_start ov82_0223F224
ov82_0223F224: @ 0x0223F224
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x69
	movs r1, #0x3c
	bl FUN_0201AA8C
	adds r1, r4, #0
	adds r1, #0xa4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020E5B44
	movs r0, #0x85
	adds r1, r4, #0
	lsls r0, r0, #2
	adds r1, #0xa4
	ldr r2, [r4, r0]
	ldr r1, [r1]
	str r2, [r1]
	adds r2, r4, #0
	adds r2, #0xa4
	ldr r2, [r2]
	movs r1, #1
	strb r1, [r2, #0x11]
	adds r2, r4, #0
	adds r2, #0x9c
	ldr r3, [r2]
	adds r2, r4, #0
	adds r2, #0xa4
	ldr r2, [r2]
	str r3, [r2, #4]
	adds r2, r4, #0
	adds r2, #0xa4
	ldr r2, [r2]
	strb r1, [r2, #0x12]
	ldr r0, [r4, r0]
	bl FUN_02074640
	adds r1, r4, #0
	adds r1, #0xa4
	ldr r1, [r1]
	strb r0, [r1, #0x13]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0
	strb r1, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	strh r1, [r0, #0x18]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_02074910
	adds r1, r4, #0
	adds r1, #0xa4
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_02088288
	adds r1, r4, #0
	adds r1, #0xa4
	ldr r1, [r1]
	str r0, [r1, #0x2c]
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_0202D95C
	adds r1, r4, #0
	adds r1, #0xa4
	ldr r1, [r1]
	str r0, [r1, #0x20]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0
	str r1, [r0, #0x34]
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	ldr r1, _0223F2F4 @ =_0223FE20
	bl FUN_02089D40
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_02028E9C
	adds r4, #0xa4
	adds r1, r0, #0
	ldr r0, [r4]
	bl FUN_0208AD34
	pop {r4, pc}
	.align 2, 0
_0223F2F4: .4byte _0223FE20
	thumb_func_end ov82_0223F224

	thumb_func_start ov82_0223F2F8
ov82_0223F2F8: @ 0x0223F2F8
	movs r3, #0
	strb r3, [r0, #8]
	str r2, [r1]
	bx lr
	thumb_func_end ov82_0223F2F8

	thumb_func_start ov82_0223F300
ov82_0223F300: @ 0x0223F300
	push {r3, r4, r5, lr}
	ldr r1, _0223F480 @ =0x021D110C
	adds r4, r0, #0
	ldr r2, [r1, #0x48]
	movs r1, #0x20
	movs r0, #0
	tst r1, r2
	beq _0223F34A
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	beq _0223F31E
	ldrb r0, [r4, #0xd]
	strb r0, [r4, #0xc]
_0223F31E:
	ldrb r0, [r4, #0xd]
	movs r1, #0x1e
	lsrs r3, r0, #0x1f
	lsls r2, r0, #0x1e
	subs r2, r2, r3
	rors r2, r1
	adds r1, r3, r2
	bne _0223F334
	adds r0, r0, #3
	strb r0, [r4, #0xd]
	b _0223F348
_0223F334:
	bl FUN_02237920
	cmp r0, #0xfe
	bne _0223F342
	movs r0, #0x10
	strb r0, [r4, #0xd]
	b _0223F348
_0223F342:
	ldrb r0, [r4, #0xd]
	subs r0, r0, #1
	strb r0, [r4, #0xd]
_0223F348:
	movs r0, #1
_0223F34A:
	ldr r1, _0223F480 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0x10
	tst r1, r2
	beq _0223F390
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	beq _0223F362
	ldrb r0, [r4, #0xd]
	strb r0, [r4, #0xc]
_0223F362:
	ldrb r0, [r4, #0xd]
	movs r1, #0x1e
	lsrs r3, r0, #0x1f
	lsls r2, r0, #0x1e
	subs r2, r2, r3
	rors r2, r1
	adds r1, r3, r2
	cmp r1, #3
	bne _0223F37A
	subs r0, r0, #3
	strb r0, [r4, #0xd]
	b _0223F38E
_0223F37A:
	bl FUN_02237920
	cmp r0, #0xfe
	bne _0223F388
	movs r0, #0x13
	strb r0, [r4, #0xd]
	b _0223F38E
_0223F388:
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
_0223F38E:
	movs r0, #1
_0223F390:
	ldr r1, _0223F480 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0x40
	tst r1, r2
	beq _0223F3FC
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	beq _0223F3A8
	ldrb r0, [r4, #0xd]
	strb r0, [r4, #0xc]
_0223F3A8:
	ldrb r0, [r4, #0xd]
	cmp r0, #4
	bhs _0223F3B4
	adds r0, #0x10
	strb r0, [r4, #0xd]
	b _0223F3FA
_0223F3B4:
	bl FUN_02237920
	cmp r0, #0xfe
	bne _0223F3F4
	ldrb r0, [r4, #0xc]
	cmp r0, #0x10
	bne _0223F3C8
	movs r0, #0xd
	strb r0, [r4, #0xd]
	b _0223F3FA
_0223F3C8:
	cmp r0, #0x13
	bne _0223F3D2
	movs r0, #0xe
	strb r0, [r4, #0xd]
	b _0223F3FA
_0223F3D2:
	cmp r0, #0xd
	beq _0223F3DA
	cmp r0, #1
	bne _0223F3E0
_0223F3DA:
	movs r0, #0xd
	strb r0, [r4, #0xd]
	b _0223F3FA
_0223F3E0:
	cmp r0, #0xe
	beq _0223F3E8
	cmp r0, #2
	bne _0223F3EE
_0223F3E8:
	movs r0, #0xe
	strb r0, [r4, #0xd]
	b _0223F3FA
_0223F3EE:
	movs r0, #0xd
	strb r0, [r4, #0xd]
	b _0223F3FA
_0223F3F4:
	ldrb r0, [r4, #0xd]
	subs r0, r0, #4
	strb r0, [r4, #0xd]
_0223F3FA:
	movs r0, #1
_0223F3FC:
	ldr r1, _0223F480 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0x80
	tst r1, r2
	beq _0223F424
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	beq _0223F414
	ldrb r0, [r4, #0xd]
	strb r0, [r4, #0xc]
_0223F414:
	ldrb r0, [r4, #0xd]
	cmp r0, #0x10
	blo _0223F41E
	subs r0, #0x10
	b _0223F420
_0223F41E:
	adds r0, r0, #4
_0223F420:
	strb r0, [r4, #0xd]
	movs r0, #1
_0223F424:
	cmp r0, #1
	bne _0223F44A
	ldr r0, _0223F484 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov82_0223F558
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov82_0223F570
	adds r2, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl ov82_0223FCBC
_0223F44A:
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	bne _0223F470
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl ov82_0223FCFC
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x80
	movs r2, #0xa8
	bl ov82_0223FCBC
	pop {r3, r4, r5, pc}
_0223F470:
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov82_0223FCFC
	pop {r3, r4, r5, pc}
	nop
_0223F480: .4byte 0x021D110C
_0223F484: .4byte 0x000005DC
	thumb_func_end ov82_0223F300

	thumb_func_start ov82_0223F488
ov82_0223F488: @ 0x0223F488
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, _0223F538 @ =0x021D114C
	ldrh r1, [r0, #0x24]
	cmp r1, #0
	beq _0223F532
	ldrh r4, [r0, #0x20]
	ldrh r5, [r0, #0x22]
	movs r7, #0
	movs r3, #3
_0223F49C:
	adds r2, r3, #0
	adds r2, #0x23
	movs r1, #0
	movs r6, #1
_0223F4A4:
	adds r0, r6, #0
	adds r0, #0x3f
	cmp r6, r4
	bgt _0223F522
	cmp r4, r0
	bgt _0223F522
	cmp r3, r5
	bgt _0223F522
	cmp r5, r2
	bgt _0223F522
	lsls r0, r7, #2
	adds r1, r1, r0
	ldr r0, [sp]
	strb r1, [r0, #0xd]
	bl ov82_0223F558
	adds r4, r0, #0
	ldr r0, [sp]
	bl ov82_0223F570
	adds r2, r0, #0
	movs r1, #0x81
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	adds r1, r4, #0
	bl ov82_0223FCBC
	ldr r0, [sp]
	ldrb r0, [r0, #0xd]
	bl FUN_02237920
	cmp r0, #0xfe
	bne _0223F508
	movs r1, #0x81
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #2
	bl ov82_0223FCFC
	movs r1, #0x81
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0x80
	movs r2, #0xa8
	bl ov82_0223FCBC
	b _0223F516
_0223F508:
	movs r1, #0x81
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #1
	bl ov82_0223FCFC
_0223F516:
	ldr r1, [sp]
	movs r0, #1
	adds r1, #0x90
	strb r0, [r1]
	str r1, [sp]
	pop {r3, r4, r5, r6, r7, pc}
_0223F522:
	adds r1, r1, #1
	adds r6, #0x40
	cmp r1, #4
	blt _0223F4A4
	adds r7, r7, #1
	adds r3, #0x24
	cmp r7, #5
	blt _0223F49C
_0223F532:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F538: .4byte 0x021D114C
	thumb_func_end ov82_0223F488

	thumb_func_start ov82_0223F53C
ov82_0223F53C: @ 0x0223F53C
	ldr r1, _0223F554 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #1
	tst r2, r1
	beq _0223F550
	movs r2, #0
	adds r0, #0x90
	strb r2, [r0]
	adds r0, r1, #0
	bx lr
_0223F550:
	movs r0, #0
	bx lr
	.align 2, 0
_0223F554: .4byte 0x021D110C
	thumb_func_end ov82_0223F53C

	thumb_func_start ov82_0223F558
ov82_0223F558: @ 0x0223F558
	ldrb r0, [r0, #0xd]
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	lsls r0, r0, #6
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	thumb_func_end ov82_0223F558

	thumb_func_start ov82_0223F570
ov82_0223F570: @ 0x0223F570
	ldrb r0, [r0, #0xd]
	lsrs r1, r0, #2
	movs r0, #0x24
	muls r0, r1, r0
	adds r0, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	thumb_func_end ov82_0223F570

	thumb_func_start ov82_0223F580
ov82_0223F580: @ 0x0223F580
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov82_0223F6E4
	cmp r0, #1
	bne _0223F5A6
	movs r4, #0
	movs r6, #3
_0223F592:
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	bl ov82_0223F5E0
	adds r4, r4, #1
	cmp r4, #0x11
	blt _0223F592
	b _0223F5D6
_0223F5A6:
	movs r7, #0x86
	movs r4, #0
	lsls r7, r7, #2
_0223F5AC:
	lsls r0, r4, #0x18
	ldr r1, [r6, r7]
	lsrs r0, r0, #0x18
	bl FUN_02030BD0
	cmp r0, #0xa
	blo _0223F5C6
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #3
	bl ov82_0223F5E0
_0223F5C6:
	adds r4, r4, #1
	cmp r4, #0x11
	blt _0223F5AC
	adds r0, r5, #0
	movs r1, #0x13
	movs r2, #3
	bl ov82_0223F5E0
_0223F5D6:
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0201EFBC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov82_0223F580

	thumb_func_start ov82_0223F5E0
ov82_0223F5E0: @ 0x0223F5E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	bne _0223F5F0
	movs r1, #0
	b _0223F602
_0223F5F0:
	cmp r5, #1
	bne _0223F5F8
	movs r1, #5
	b _0223F602
_0223F5F8:
	cmp r5, #2
	bne _0223F600
	movs r1, #4
	b _0223F602
_0223F600:
	movs r1, #3
_0223F602:
	lsrs r3, r4, #0x1f
	lsls r2, r4, #0x1e
	subs r2, r2, r3
	movs r0, #0x1e
	rors r2, r0
	adds r0, r3, r2
	lsls r0, r0, #3
	str r0, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r2, r4, #0x1d
	mov ip, r0
	subs r2, r2, r3
	movs r0, #0x1d
	rors r2, r0
	adds r6, r3, r2
	cmp r6, #4
	bge _0223F62A
	movs r2, #5
	b _0223F62C
_0223F62A:
	movs r2, #4
_0223F62C:
	cmp r4, #4
	bhs _0223F634
	movs r3, #0
	b _0223F64E
_0223F634:
	cmp r4, #8
	bhs _0223F63C
	movs r3, #5
	b _0223F64E
_0223F63C:
	cmp r4, #0xc
	bhs _0223F644
	movs r3, #9
	b _0223F64E
_0223F644:
	cmp r4, #0x10
	bhs _0223F64C
	movs r3, #0xe
	b _0223F64E
_0223F64C:
	movs r3, #0x12
_0223F64E:
	movs r0, #8
	str r0, [sp]
	str r2, [sp, #4]
	str r1, [sp, #8]
	adds r0, r7, #0
	movs r1, #3
	mov r2, ip
	bl FUN_0201CA4C
	cmp r5, #0
	bne _0223F6C0
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r6, #4
	bge _0223F672
	movs r1, #2
	b _0223F674
_0223F672:
	movs r1, #3
_0223F674:
	cmp r4, #4
	bhs _0223F67C
	movs r3, #2
	b _0223F696
_0223F67C:
	cmp r4, #8
	bhs _0223F684
	movs r3, #6
	b _0223F696
_0223F684:
	cmp r4, #0xc
	bhs _0223F68C
	movs r3, #0xb
	b _0223F696
_0223F68C:
	cmp r4, #0x10
	bhs _0223F694
	movs r3, #0xf
	b _0223F696
_0223F694:
	movs r3, #0x14
_0223F696:
	cmp r4, #9
	bhs _0223F6AE
	movs r0, #1
	str r0, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #3
	bl FUN_0201CA4C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0223F6AE:
	movs r0, #1
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r7, #0
	movs r1, #3
	bl FUN_0201CA4C
_0223F6C0:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov82_0223F5E0

	thumb_func_start ov82_0223F6C4
ov82_0223F6C4: @ 0x0223F6C4
	cmp r0, #0x11
	blo _0223F6CA
	movs r0, #0x11
_0223F6CA:
	bx lr
	thumb_func_end ov82_0223F6C4

	thumb_func_start ov82_0223F6CC
ov82_0223F6CC: @ 0x0223F6CC
	ldrb r1, [r0, #9]
	cmp r1, #0
	bne _0223F6E0
	ldrh r0, [r0, #0x1c]
	cmp r0, #0x32
	beq _0223F6DC
	cmp r0, #0xaa
	bne _0223F6E0
_0223F6DC:
	movs r0, #1
	bx lr
_0223F6E0:
	movs r0, #0
	bx lr
	thumb_func_end ov82_0223F6CC

	thumb_func_start ov82_0223F6E4
ov82_0223F6E4: @ 0x0223F6E4
	ldrb r0, [r0, #0x1e]
	bx lr
	thumb_func_end ov82_0223F6E4

	thumb_func_start ov82_0223F6E8
ov82_0223F6E8: @ 0x0223F6E8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #9]
	adds r4, r1, #0
	adds r7, r2, #0
	bl FUN_0223792C
	cmp r0, #0
	bne _0223F6FE
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223F6FE:
	cmp r4, #4
	beq _0223F70C
	cmp r4, #5
	beq _0223F718
	cmp r4, #6
	beq _0223F726
	b _0223F732
_0223F70C:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r6, #0x27
	bl ov82_0223F74C
	b _0223F732
_0223F718:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r6, #0x28
	bl ov82_0223F770
	b _0223F732
_0223F726:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	movs r6, #0x29
	bl ov82_0223F808
_0223F732:
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r6, #0
	adds r1, r5, r1
	movs r2, #0x2c
	bl FUN_02037030
	cmp r0, #1
	bne _0223F748
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223F748:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov82_0223F6E8

	thumb_func_start ov82_0223F74C
ov82_0223F74C: @ 0x0223F74C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xa0
	ldr r0, [r0]
	adds r4, r1, #0
	bl FUN_02028E9C
	movs r0, #0x89
	lsls r0, r0, #2
	strh r4, [r5, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov82_0223F74C

	thumb_func_start ov82_0223F764
ov82_0223F764: @ 0x0223F764
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203769C
	cmp r4, r0
	pop {r4, pc}
	thumb_func_end ov82_0223F764

	thumb_func_start ov82_0223F770
ov82_0223F770: @ 0x0223F770
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x89
	lsls r0, r0, #2
	strh r1, [r5, r0]
	adds r4, r2, #0
	adds r0, r0, #2
	strh r4, [r5, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _0223F790
	ldrb r0, [r5, #0x18]
	cmp r0, #0xff
	bne _0223F790
	strb r4, [r5, #0x18]
_0223F790:
	ldrb r1, [r5, #0x18]
	movs r0, #0x8a
	lsls r0, r0, #2
	strh r1, [r5, r0]
	subs r0, #0x14
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _0223F7B0 @ =0x0000022A
	strh r0, [r5, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223F7B0: .4byte 0x0000022A
	thumb_func_end ov82_0223F770

	thumb_func_start ov82_0223F7B4
ov82_0223F7B4: @ 0x0223F7B4
	push {r4, r5, r6, lr}
	adds r4, r3, #0
	adds r6, r0, #0
	ldrb r0, [r4, #0x16]
	adds r5, r2, #0
	adds r0, r0, #1
	strb r0, [r4, #0x16]
	bl FUN_0203769C
	cmp r6, r0
	beq _0223F804
	ldrh r1, [r5, #2]
	movs r0, #0x9f
	lsls r0, r0, #2
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _0223F7F6
	ldrb r0, [r4, #0x18]
	cmp r0, #0xff
	beq _0223F7EA
	movs r0, #0x9f
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
	b _0223F7FA
_0223F7EA:
	movs r0, #0x9f
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	adds r0, #0x14
	strb r0, [r4, #0x18]
	b _0223F7FA
_0223F7F6:
	ldrh r0, [r5, #4]
	strb r0, [r4, #0x18]
_0223F7FA:
	movs r0, #0x87
	lsls r0, r0, #2
	ldrh r1, [r5, #6]
	ldr r0, [r4, r0]
	strh r1, [r0]
_0223F804:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov82_0223F7B4

	thumb_func_start ov82_0223F808
ov82_0223F808: @ 0x0223F808
	movs r3, #0x89
	lsls r3, r3, #2
	strh r1, [r0, r3]
	adds r1, r3, #2
	strh r2, [r0, r1]
	bx lr
	thumb_func_end ov82_0223F808

	thumb_func_start ov82_0223F814
ov82_0223F814: @ 0x0223F814
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_0203769C
	cmp r5, r0
	beq _0223F82E
	ldrh r1, [r4, #2]
	cmp r1, #0
	beq _0223F82E
	ldr r0, _0223F830 @ =0x0000027D
	strb r1, [r6, r0]
_0223F82E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223F830: .4byte 0x0000027D
	thumb_func_end ov82_0223F814

	thumb_func_start ov82_0223F834
ov82_0223F834: @ 0x0223F834
	push {r3, lr}
	ldrb r1, [r0, #0xf]
	cmp r1, #1
	bne _0223F848
	movs r1, #0
	strb r1, [r0, #0xf]
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_020169CC
_0223F848:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov82_0223F834

	thumb_func_start ov82_0223F84C
ov82_0223F84C: @ 0x0223F84C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov82_0223FCB0
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0202ADCC
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x4c
	bl ov82_0223FD78
	ldrb r0, [r4, #0xd]
	bl FUN_02237920
	adds r2, r0, #0
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl FUN_0200C19C
	ldrb r0, [r4, #0xd]
	bl ov82_0223F6C4
	movs r1, #0x86
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	bl FUN_02030BD0
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xa
	bls _0223F89C
	movs r2, #0xa
_0223F89C:
	adds r0, r4, #0
	movs r1, #1
	bl ov82_0223EFB4
	adds r0, r4, #0
	bl ov82_0223F6E4
	cmp r0, #1
	bne _0223F8B2
	movs r1, #0x1f
	b _0223F8B4
_0223F8B2:
	movs r1, #0x18
_0223F8B4:
	adds r0, r4, #0
	movs r2, #1
	bl ov82_0223EF7C
	strb r0, [r4, #0xa]
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov82_0223FCFC
	adds r2, r4, #0
	adds r0, r4, #0
	adds r2, #0x90
	adds r0, #0x8c
	ldrb r2, [r2]
	ldr r0, [r0]
	ldr r1, [r4, #0x48]
	bl ov82_0223FDC8
	movs r0, #1
	strb r0, [r4, #0xf]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov82_0223F84C

	thumb_func_start ov82_0223F8E4
ov82_0223F8E4: @ 0x0223F8E4
	push {r4, lr}
	adds r4, r0, #0
	bl ov82_0223F90C
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #0x48]
	movs r2, #0
	bl ov82_0223F5E0
	ldr r0, [r4, #0x48]
	movs r1, #3
	bl FUN_0201EFBC
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov82_0223FCFC
	pop {r4, pc}
	thumb_func_end ov82_0223F8E4

	thumb_func_start ov82_0223F90C
ov82_0223F90C: @ 0x0223F90C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov82_0223FCB0
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r2, #0
	adds r0, r4, #0
	adds r4, #0x5c
	str r2, [sp, #8]
	adds r1, r4, #0
	adds r3, r2, #0
	str r2, [sp, #0xc]
	bl ov82_0223EFCC
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov82_0223F90C

	thumb_func_start ov82_0223F948
ov82_0223F948: @ 0x0223F948
	ldr r3, _0223F954 @ =FUN_020CF178
	adds r2, r0, #0
	ldr r0, _0223F958 @ =0x04000050
	movs r1, #0x1e
	bx r3
	nop
_0223F954: .4byte FUN_020CF178
_0223F958: .4byte 0x04000050
	thumb_func_end ov82_0223F948

	thumb_func_start ov82_0223F95C
ov82_0223F95C: @ 0x0223F95C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x14]
	bl ov82_0223FC14
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x69
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	movs r0, #2
	adds r1, r5, #4
	movs r2, #0x69
	bl FUN_02009F40
	ldr r4, _0223FB04 @ =0x0223FEEC
	str r0, [r5]
	movs r7, #0
	adds r6, r5, #0
_0223F996:
	ldrb r0, [r4]
	adds r1, r7, #0
	movs r2, #0x69
	bl FUN_0200A090
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r6, r1]
	adds r7, r7, #1
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r7, #4
	blt _0223F996
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	adds r0, #0xc3
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0xc
	bl FUN_0200A1D8
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x69
	str r0, [sp, #0xc]
	adds r0, #0xc7
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0x36
	bl FUN_0200A234
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	adds r0, #0xcb
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0xe
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	adds r0, #0xcf
	ldr r0, [r5, r0]
	movs r1, #0xb8
	movs r2, #0xd
	movs r3, #1
	bl FUN_0200A294
	movs r1, #0x52
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x14
	movs r1, #0x69
	bl FUN_02007688
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	bl FUN_020741B0
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	adds r0, #0xc3
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x18]
	movs r3, #0
	bl FUN_0200A3C8
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_02074490
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x69
	str r0, [sp, #0xc]
	adds r0, #0xc7
	ldr r0, [r5, r0]
	movs r1, #0x14
	movs r3, #0
	bl FUN_0200A234
	movs r1, #0x15
	lsls r1, r1, #4
	str r0, [r5, r1]
	bl FUN_02074498
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	adds r0, #0xcb
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x18]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x55
	lsls r1, r1, #2
	str r0, [r5, r1]
	bl FUN_020744A4
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x69
	str r0, [sp, #8]
	adds r0, #0xcf
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x18]
	movs r3, #0
	bl FUN_0200A540
	movs r1, #0x56
	lsls r1, r1, #2
	adds r7, r1, #0
	adds r6, r1, #0
	str r0, [r5, r1]
	movs r4, #0
	subs r7, #0x1c
	subs r6, #0x18
_0223FAD4:
	ldr r0, [r5, r7]
	bl FUN_0200ACF0
	ldr r0, [r5, r6]
	bl FUN_0200AF94
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blt _0223FAD4
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223FB04: .4byte 0x0223FEEC
	thumb_func_end ov82_0223F95C

	thumb_func_start ov82_0223FB08
ov82_0223FB08: @ 0x0223FB08
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r5, r0, #0
	movs r0, #0
	str r1, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	adds r4, r3, #0
	str r0, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x4b
	lsls r0, r0, #2
	adds r6, r2, #0
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
	adds r2, r1, #0
	str r0, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	add r0, sp, #0x5c
	adds r3, r1, #0
	bl FUN_02009D48
	ldr r0, [r5]
	movs r1, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x34]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r1, [r0, #0x20]
	str r4, [sp, #0x50]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _0223FB7C
	movs r0, #1
	str r0, [sp, #0x54]
	b _0223FB80
_0223FB7C:
	movs r0, #2
	str r0, [sp, #0x54]
_0223FB80:
	movs r0, #0x69
	str r0, [sp, #0x58]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x10]
	cmp r0, #1
	bne _0223FB96
	movs r0, #3
	ldr r1, [sp, #0x38]
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x38]
_0223FB96:
	add r0, sp, #0x2c
	bl FUN_02024624
	movs r1, #1
	adds r4, r0, #0
	bl FUN_0202484C
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl FUN_02024868
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020248F0
	adds r0, r4, #0
	add sp, #0x80
	pop {r4, r5, r6, pc}
	thumb_func_end ov82_0223FB08

	thumb_func_start ov82_0223FBBC
ov82_0223FBBC: @ 0x0223FBBC
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #5
	adds r5, r0, #0
	movs r4, #0
	lsls r7, r7, #6
_0223FBC6:
	lsls r0, r4, #4
	adds r6, r5, r0
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	ldr r0, [r6, r7]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _0223FBC6
	movs r6, #0x4b
	movs r4, #0
	lsls r6, r6, #2
_0223FBEA:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0223FBEA
	ldr r0, [r5]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov82_0223FBBC

	thumb_func_start ov82_0223FC14
ov82_0223FC14: @ 0x0223FC14
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0223FC44 @ =0x0223FEF0
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	movs r1, #0x10
	adds r0, r2, #0
	adds r2, r1, #0
	bl FUN_020215C0
	movs r0, #4
	movs r1, #0x69
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0223FC44: .4byte 0x0223FEF0
	thumb_func_end ov82_0223FC14

	thumb_func_start ov82_0223FC48
ov82_0223FC48: @ 0x0223FC48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r7, r1, #0
	movs r0, #0x69
	movs r1, #0x14
	str r2, [sp, #4]
	adds r5, r3, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x14
	movs r0, #0
_0223FC64:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0223FC64
	ldr r0, [sp, #0x2c]
	movs r3, #0
	str r0, [r4, #0xc]
	ldr r2, [sp, #4]
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov82_0223FB08
	str r0, [r4, #0x10]
	lsls r0, r5, #0xc
	str r0, [sp, #8]
	add r0, sp, #0x18
	ldrh r0, [r0, #0x10]
	add r1, sp, #8
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x10]
	bl FUN_020247D4
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov82_0223FC48

	thumb_func_start ov82_0223FC9C
ov82_0223FC9C: @ 0x0223FC9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02024758
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov82_0223FC9C

	thumb_func_start ov82_0223FCB0
ov82_0223FCB0: @ 0x0223FCB0
	ldr r3, _0223FCB8 @ =FUN_02024830
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0223FCB8: .4byte FUN_02024830
	thumb_func_end ov82_0223FCB0

	thumb_func_start ov82_0223FCBC
ov82_0223FCBC: @ 0x0223FCBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0xc]
	adds r6, r2, #0
	cmp r1, #0
	beq _0223FCD4
	ldrb r1, [r1]
	ldr r0, [r5, #0x10]
	bl FUN_02024950
_0223FCD4:
	ldr r0, [r5, #0x10]
	bl FUN_020248AC
	adds r3, r0, #0
	add r2, sp, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r7, #0
	str r0, [r2]
	lsls r0, r4, #0xc
	str r0, [sp]
	lsls r0, r6, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov82_0223FCBC

	thumb_func_start ov82_0223FCFC
ov82_0223FCFC: @ 0x0223FCFC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #1
	ldr r0, [r5, #0x10]
	lsls r1, r1, #0xc
	bl FUN_02024868
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	bl FUN_02024950
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov82_0223FCFC

	thumb_func_start ov82_0223FD18
ov82_0223FD18: @ 0x0223FD18
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_02074484
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_02024AA8
	pop {r4, pc}
	thumb_func_end ov82_0223FD18

	thumb_func_start ov82_0223FD2C
ov82_0223FD2C: @ 0x0223FD2C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r4, #0
_0223FD34:
	ldr r2, _0223FD58 @ =0x0223FF00
	lsls r6, r4, #4
	lsls r3, r4, #3
	adds r0, r7, #0
	adds r1, r5, r6
	adds r2, r2, r3
	bl FUN_0201D4F8
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _0223FD34
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223FD58: .4byte 0x0223FF00
	thumb_func_end ov82_0223FD2C

	thumb_func_start ov82_0223FD5C
ov82_0223FD5C: @ 0x0223FD5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0223FD62:
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_0201D520
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _0223FD62
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov82_0223FD5C

	thumb_func_start ov82_0223FD78
ov82_0223FD78: @ 0x0223FD78
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	bl FUN_0201EE8C
	adds r1, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x69
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _0223FDB4 @ =0x000003D9
	movs r3, #0xa
	bl FUN_0200E644
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, _0223FDB4 @ =0x000003D9
	adds r0, r4, #0
	movs r1, #0
	movs r3, #0xa
	bl FUN_0200E998
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223FDB4: .4byte 0x000003D9
	thumb_func_end ov82_0223FD78

	thumb_func_start ov82_0223FDB8
ov82_0223FDB8: @ 0x0223FDB8
	ldr r3, _0223FDBC @ =FUN_0201660C
	bx r3
	.align 2, 0
_0223FDBC: .4byte FUN_0201660C
	thumb_func_end ov82_0223FDB8

	thumb_func_start ov82_0223FDC0
ov82_0223FDC0: @ 0x0223FDC0
	ldr r3, _0223FDC4 @ =FUN_02016624
	bx r3
	.align 2, 0
_0223FDC4: .4byte FUN_02016624
	thumb_func_end ov82_0223FDC0

	thumb_func_start ov82_0223FDC8
ov82_0223FDC8: @ 0x0223FDC8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #0x6d
	movs r2, #0
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	str r5, [sp]
	str r2, [sp, #4]
	movs r1, #0x18
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r1, #0xa
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	movs r3, #0xf
	bics r1, r3
	movs r3, #0xf
	ands r3, r4
	orrs r1, r3
	strb r1, [r0, #0x12]
	ldrb r3, [r0, #0x12]
	movs r1, #0xf0
	bics r3, r1
	strb r3, [r0, #0x12]
	strb r2, [r0, #0x13]
	adds r0, r6, #0
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov82_0223FDC8

	thumb_func_start ov82_0223FE18
ov82_0223FE18: @ 0x0223FE18
	ldr r3, _0223FE1C @ =FUN_020168F4
	bx r3
	.align 2, 0
_0223FE1C: .4byte FUN_020168F4
	thumb_func_end ov82_0223FE18

	.rodata

_0223FE20:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x02, 0x02, 0x02, 0x02
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00, 0x00, 0x0A, 0x14, 0x09, 0x02, 0x0D, 0x89, 0x00
	.byte 0x01, 0x01, 0x00, 0x1F, 0x16, 0x0D, 0x01, 0x00, 0x04, 0x02, 0x13, 0x1B, 0x04, 0x02, 0x0A, 0x00
	@ 0x0223FF20
