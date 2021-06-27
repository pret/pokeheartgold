
	thumb_func_start ov62_021E5900
ov62_021E5900: @ 0x021E5900
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x62
	lsls r2, r0, #0x10
	bl FUN_0201A910
	movs r1, #0x4f
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x62
	bl FUN_02007280
	movs r2, #0x4f
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r1, #0x62
	adds r0, r1, #0
	adds r0, #0xd6
	str r1, [r4, r0]
	adds r1, #0xd6
	ldr r0, [r4, r1]
	bl ov62_021E5C34
	bl ov62_021E5CB8
	ldr r0, _021E59B4 @ =ov62_021E5CC8
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #4
	movs r1, #0x62
	bl FUN_02002CEC
	movs r1, #0x4e
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xb8
	bl ov62_021E5FD4
	movs r1, #0x4e
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xb8
	bl ov62_021E604C
	movs r1, #0x4e
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0xb8
	bl ov62_021E60E4
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov62_021E5CF4
	adds r0, r4, #0
	bl ov62_021E5D88
	movs r1, #0x4e
	lsls r1, r1, #2
	adds r0, r4, #0
	ldr r1, [r4, r1]
	ldr r2, _021E59B8 @ =ov62_021E62B8
	adds r0, #0xf0
	adds r3, r4, #0
	bl ov62_021E61AC
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r2, _021E59BC @ =ov62_021E5A9C
	adds r0, r4, r0
	adds r1, r4, #0
	bl ov62_021E5A5C
	movs r0, #0
	movs r1, #0xa
	bl FUN_02005F50
	movs r0, #1
	pop {r4, pc}
	nop
_021E59B4: .4byte ov62_021E5CC8
_021E59B8: .4byte ov62_021E62B8
_021E59BC: .4byte ov62_021E5A9C
	thumb_func_end ov62_021E5900

	thumb_func_start ov62_021E59C0
ov62_021E59C0: @ 0x021E59C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	adds r0, #0xf0
	bl ov62_021E61FC
	adds r0, r4, #0
	bl ov62_021E5FA0
	adds r0, r4, #0
	bl ov62_021E5D54
	adds r0, r4, #0
	adds r0, #0xb8
	bl ov62_021E6178
	adds r0, r4, #0
	adds r0, #0xb8
	bl ov62_021E6024
	bl ov62_021E5C80
	movs r0, #4
	bl FUN_02002DB4
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201A9C4
	ldr r0, _021E5A14 @ =0x0000003C
	ldr r1, _021E5A18 @ =0x021EAFE0
	bl FUN_02000EF4
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5A14: .4byte 0x0000003C
_021E5A18: .4byte 0x021EAFE0
	thumb_func_end ov62_021E59C0

	thumb_func_start ov62_021E5A1C
ov62_021E5A1C: @ 0x021E5A1C
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov62_021E5A90
	cmp r0, #0
	beq _021E5A36
	movs r0, #1
	pop {r4, pc}
_021E5A36:
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov62_021E5A6C
	adds r0, r4, #0
	bl ov62_021E5D64
	adds r0, r4, #0
	adds r0, #0xb8
	bl ov62_021E6048
	adds r4, #0xf0
	adds r0, r4, #0
	bl ov62_021E620C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov62_021E5A1C

	thumb_func_start ov62_021E5A5C
ov62_021E5A5C: @ 0x021E5A5C
	ldr r3, _021E5A68 @ =ov62_021E5A84
	str r1, [r0]
	movs r1, #0
	str r1, [r0, #0xc]
	adds r1, r2, #0
	bx r3
	.align 2, 0
_021E5A68: .4byte ov62_021E5A84
	thumb_func_end ov62_021E5A5C

	thumb_func_start ov62_021E5A6C
ov62_021E5A6C: @ 0x021E5A6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov62_021E5A90
	cmp r0, #0
	bne _021E5A82
	adds r1, r4, #0
	ldr r2, [r4, #4]
	adds r0, r4, #0
	adds r1, #8
	blx r2
_021E5A82:
	pop {r4, pc}
	thumb_func_end ov62_021E5A6C

	thumb_func_start ov62_021E5A84
ov62_021E5A84: @ 0x021E5A84
	str r1, [r0, #4]
	movs r1, #0
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov62_021E5A84

	thumb_func_start ov62_021E5A8C
ov62_021E5A8C: @ 0x021E5A8C
	ldr r0, [r0]
	bx lr
	thumb_func_end ov62_021E5A8C

	thumb_func_start ov62_021E5A90
ov62_021E5A90: @ 0x021E5A90
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov62_021E5A90

	thumb_func_start ov62_021E5A94
ov62_021E5A94: @ 0x021E5A94
	movs r1, #1
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0
	thumb_func_end ov62_021E5A94

	thumb_func_start ov62_021E5A9C
ov62_021E5A9C: @ 0x021E5A9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5AB8
	cmp r1, #1
	beq _021E5ADA
	cmp r1, #2
	beq _021E5AEA
	b _021E5AF6
_021E5AB8:
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	movs r2, #0x4e
	str r1, [sp, #4]
	lsls r2, r2, #2
	ldr r0, [r0, r2]
	adds r2, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5ADA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5AFA
	movs r0, #2
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5AEA:
	ldr r1, _021E5B00 @ =ov62_021E5B04
	adds r0, r5, #0
	bl ov62_021E5A84
	add sp, #0xc
	pop {r4, r5, pc}
_021E5AF6:
	bl GF_AssertFail
_021E5AFA:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E5B00: .4byte ov62_021E5B04
	thumb_func_end ov62_021E5A9C

	thumb_func_start ov62_021E5B04
ov62_021E5B04: @ 0x021E5B04
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #3
	bhi _021E5B5E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E5B20: @ jump table
	.2byte _021E5B28 - _021E5B20 - 2 @ case 0
	.2byte _021E5B34 - _021E5B20 - 2 @ case 1
	.2byte _021E5B48 - _021E5B20 - 2 @ case 2
	.2byte _021E5B54 - _021E5B20 - 2 @ case 3
_021E5B28:
	adds r0, #0xf0
	bl ov62_021E625C
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B34:
	bl ov62_021E6630
	cmp r0, #0
	beq _021E5B62
	ldr r0, _021E5B64 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B48:
	adds r0, #0xf0
	bl ov62_021E6278
	movs r0, #3
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B54:
	ldr r1, _021E5B68 @ =ov62_021E5B6C
	adds r0, r5, #0
	bl ov62_021E5A84
	pop {r3, r4, r5, pc}
_021E5B5E:
	bl GF_AssertFail
_021E5B62:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5B64: .4byte 0x000005DC
_021E5B68: .4byte ov62_021E5B6C
	thumb_func_end ov62_021E5B04

	thumb_func_start ov62_021E5B6C
ov62_021E5B6C: @ 0x021E5B6C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5B86
	cmp r1, #1
	beq _021E5B94
	cmp r1, #2
	beq _021E5BA4
	b _021E5BAE
_021E5B86:
	ldr r0, [r0, #0x14]
	movs r1, #1
	bl FUN_0200DC4C
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5B94:
	ldr r0, [r0, #0x14]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021E5BB2
	movs r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E5BA4:
	ldr r1, _021E5BB4 @ =ov62_021E5BB8
	adds r0, r5, #0
	bl ov62_021E5A84
	pop {r3, r4, r5, pc}
_021E5BAE:
	bl GF_AssertFail
_021E5BB2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5BB4: .4byte ov62_021E5BB8
	thumb_func_end ov62_021E5B6C

	thumb_func_start ov62_021E5BB8
ov62_021E5BB8: @ 0x021E5BB8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	bl ov62_021E5A8C
	ldr r1, [r4]
	cmp r1, #0
	beq _021E5BD4
	cmp r1, #1
	beq _021E5BF8
	cmp r1, #2
	beq _021E5C08
	b _021E5C14
_021E5BD4:
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #1
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5BF8:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5C18
	movs r0, #2
	add sp, #0xc
	str r0, [r4]
	pop {r4, r5, pc}
_021E5C08:
	ldr r1, _021E5C1C @ =ov62_021E5C20
	adds r0, r5, #0
	bl ov62_021E5A84
	add sp, #0xc
	pop {r4, r5, pc}
_021E5C14:
	bl GF_AssertFail
_021E5C18:
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E5C1C: .4byte ov62_021E5C20
	thumb_func_end ov62_021E5BB8

	thumb_func_start ov62_021E5C20
ov62_021E5C20: @ 0x021E5C20
	push {r4, lr}
	adds r4, r0, #0
	bl ov62_021E5A8C
	bl ov62_021E6600
	adds r0, r4, #0
	bl ov62_021E5A94
	pop {r4, pc}
	thumb_func_end ov62_021E5C20

	thumb_func_start ov62_021E5C34
ov62_021E5C34: @ 0x021E5C34
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5C78 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5C7C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	movs r0, #0x20
	adds r1, r4, #0
	bl FUN_0202055C
	pop {r4, pc}
	nop
_021E5C78: .4byte 0xFFFFE0FF
_021E5C7C: .4byte 0x04001000
	thumb_func_end ov62_021E5C34

	thumb_func_start ov62_021E5C80
ov62_021E5C80: @ 0x021E5C80
	push {r3, lr}
	bl FUN_020205AC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5CB0 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5CB4 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_021E5CB0: .4byte 0xFFFFE0FF
_021E5CB4: .4byte 0x04001000
	thumb_func_end ov62_021E5C80

	thumb_func_start ov62_021E5CB8
ov62_021E5CB8: @ 0x021E5CB8
	ldr r3, _021E5CC0 @ =FUN_02022BE8
	ldr r0, _021E5CC4 @ =0x021E66D0
	bx r3
	nop
_021E5CC0: .4byte FUN_02022BE8
_021E5CC4: .4byte 0x021E66D0
	thumb_func_end ov62_021E5CB8

	thumb_func_start ov62_021E5CC8
ov62_021E5CC8: @ 0x021E5CC8
	push {r4, lr}
	adds r4, r0, #0
	blx FUN_020B62EC
	adds r0, r4, #0
	bl ov62_021E5FC4
	adds r4, #0xb8
	adds r0, r4, #0
	bl ov62_021E60D4
	ldr r3, _021E5CEC @ =0x027E0000
	ldr r1, _021E5CF0 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E5CEC: .4byte 0x027E0000
_021E5CF0: .4byte 0x00003FF8
	thumb_func_end ov62_021E5CC8

	thumb_func_start ov62_021E5CF4
ov62_021E5CF4: @ 0x021E5CF4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0200CF18
	ldr r1, _021E5D48 @ =0x021E66B0
	ldr r2, _021E5D4C @ =0x021E6668
	movs r3, #0x20
	str r0, [r5]
	bl FUN_0200CF70
	adds r0, r4, #0
	bl FUN_0200B2E0
	adds r0, r4, #0
	bl FUN_0200B2E8
	ldr r0, [r5]
	bl FUN_0200CF38
	str r0, [r5, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r2, #7
	bl FUN_0200CFF4
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, _021E5D50 @ =0x021E667C
	bl FUN_0200D3F8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r3, r4, r5, pc}
	nop
_021E5D48: .4byte 0x021E66B0
_021E5D4C: .4byte 0x021E6668
_021E5D50: .4byte 0x021E667C
	thumb_func_end ov62_021E5CF4

	thumb_func_start ov62_021E5D54
ov62_021E5D54: @ 0x021E5D54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0200D108
	movs r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov62_021E5D54

	thumb_func_start ov62_021E5D64
ov62_021E5D64: @ 0x021E5D64
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E5D6A:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #8]
	bl FUN_0200DC18
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	blo _021E5D6A
	ldr r0, [r5, #4]
	bl FUN_0200D020
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov62_021E5D64

	thumb_func_start ov62_021E5D88
ov62_021E5D88: @ 0x021E5D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021E5F58 @ =0x00000A03
	movs r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #6
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F5C @ =0x00000A02
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #8
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F60 @ =0x00000A04
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #9
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021E5F64 @ =0x00000A01
	movs r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #7
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021E5F68 @ =0x00000B03
	movs r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0xa
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F6C @ =0x00000B02
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0xc
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F70 @ =0x00000B04
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0xd
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021E5F74 @ =0x00000B01
	movs r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0xb
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021E5F78 @ =0x00000D03
	movs r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0x12
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F7C @ =0x00000D02
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0x14
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F80 @ =0x00000D04
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0x15
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021E5F84 @ =0x00000D01
	movs r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0x13
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021E5F88 @ =0x00000C03
	movs r2, #0xb0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0xe
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F8C @ =0x00000C02
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0x10
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5F90 @ =0x00000C04
	movs r2, #0xb0
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0x11
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021E5F94 @ =0x00000C01
	movs r2, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	movs r3, #0xf
	bl FUN_0200D4A4
	ldr r7, _021E5F98 @ =0x021E67C8
	movs r4, #0
_021E5EFC:
	ldr r2, _021E5F9C @ =0x021E6694
	lsls r3, r4, #2
	adds r6, r5, r3
	ldr r3, [r2, r3]
	movs r2, #0x34
	muls r2, r3, r2
	ldr r0, [r5]
	ldr r1, [r5, #4]
	adds r2, r7, r2
	bl FUN_0200D734
	movs r1, #1
	str r0, [r6, #8]
	bl FUN_0200DC78
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	blo _021E5EFC
	movs r4, #0
	adds r6, r4, #0
_021E5F28:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x18]
	adds r1, r6, #0
	bl FUN_0200DCE8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	blo _021E5F28
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_0200E0C0
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0200DD54
	movs r0, #0xa
	adds r5, #0xb4
	str r0, [r5]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E5F58: .4byte 0x00000A03
_021E5F5C: .4byte 0x00000A02
_021E5F60: .4byte 0x00000A04
_021E5F64: .4byte 0x00000A01
_021E5F68: .4byte 0x00000B03
_021E5F6C: .4byte 0x00000B02
_021E5F70: .4byte 0x00000B04
_021E5F74: .4byte 0x00000B01
_021E5F78: .4byte 0x00000D03
_021E5F7C: .4byte 0x00000D02
_021E5F80: .4byte 0x00000D04
_021E5F84: .4byte 0x00000D01
_021E5F88: .4byte 0x00000C03
_021E5F8C: .4byte 0x00000C02
_021E5F90: .4byte 0x00000C04
_021E5F94: .4byte 0x00000C01
_021E5F98: .4byte 0x021E67C8
_021E5F9C: .4byte 0x021E6694
	thumb_func_end ov62_021E5D88

	thumb_func_start ov62_021E5FA0
ov62_021E5FA0: @ 0x021E5FA0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_021E5FA8:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021E5FB2
	bl FUN_0200D9DC
_021E5FB2:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _021E5FA8
	ldr r0, [r6]
	ldr r1, [r6, #4]
	bl FUN_0200D998
	pop {r4, r5, r6, pc}
	thumb_func_end ov62_021E5FA0

	thumb_func_start ov62_021E5FC4
ov62_021E5FC4: @ 0x021E5FC4
	push {r3, lr}
	ldr r0, [r0]
	cmp r0, #0
	beq _021E5FD0
	bl FUN_0200D034
_021E5FD0:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov62_021E5FC4

	thumb_func_start ov62_021E5FD4
ov62_021E5FD4: @ 0x021E5FD4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, r1, #0
	str r1, [sp]
	bl FUN_0201AC88
	str r0, [r6]
	ldr r0, _021E601C @ =0x021E6658
	bl FUN_0201ACB0
	ldr r4, _021E6020 @ =0x021E6728
	movs r7, #0
	adds r5, r4, #0
_021E5FEE:
	ldrb r1, [r4, #0x1c]
	ldrb r3, [r4, #0x1d]
	ldr r0, [r6]
	adds r2, r5, #0
	bl FUN_0201B1E4
	ldrb r1, [r4, #0x1c]
	ldr r0, [r6]
	bl FUN_0201CAE0
	ldrb r0, [r4, #0x1c]
	ldr r3, [sp]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	adds r7, r7, #1
	adds r4, #0x20
	adds r5, #0x20
	cmp r7, #5
	blo _021E5FEE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E601C: .4byte 0x021E6658
_021E6020: .4byte 0x021E6728
	thumb_func_end ov62_021E5FD4

	thumb_func_start ov62_021E6024
ov62_021E6024: @ 0x021E6024
	push {r4, r5, r6, lr}
	ldr r5, _021E6044 @ =0x021E6728
	adds r6, r0, #0
	movs r4, #0
_021E602C:
	ldrb r1, [r5, #0x1c]
	ldr r0, [r6]
	bl FUN_0201BB4C
	adds r4, r4, #1
	adds r5, #0x20
	cmp r4, #5
	blo _021E602C
	ldr r0, [r6]
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6044: .4byte 0x021E6728
	thumb_func_end ov62_021E6024

	thumb_func_start ov62_021E6048
ov62_021E6048: @ 0x021E6048
	bx lr
	.align 2, 0
	thumb_func_end ov62_021E6048

	thumb_func_start ov62_021E604C
ov62_021E604C: @ 0x021E604C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xb0
	adds r2, r1, #0
	adds r3, r1, #0
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	movs r0, #0xb0
	movs r1, #4
	movs r3, #5
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #5
	ldr r2, [r5]
	movs r0, #0xb0
	adds r3, r1, #0
	bl FUN_02007914
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xb0
	movs r1, #1
	movs r2, #4
	movs r3, #0
	str r4, [sp, #4]
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	movs r0, #0xb0
	movs r1, #2
	movs r3, #1
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	movs r0, #0xb0
	movs r1, #3
	movs r3, #1
	bl FUN_02007914
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov62_021E604C

	thumb_func_start ov62_021E60D4
ov62_021E60D4: @ 0x021E60D4
	push {r3, lr}
	ldr r0, [r0]
	cmp r0, #0
	beq _021E60E0
	bl FUN_0201EEB4
_021E60E0:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov62_021E60D4

	thumb_func_start ov62_021E60E4
ov62_021E60E4: @ 0x021E60E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	adds r3, r1, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xea
	bl FUN_0200BAF8
	ldr r1, [sp, #0x14]
	ldr r4, _021E6174 @ =0x021E66F8
	str r0, [r1, #0x34]
	adds r0, r1, #0
	movs r6, #0
	adds r5, r0, #4
_021E6102:
	ldrb r0, [r4, #2]
	adds r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0]
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D634
	ldr r0, [sp, #0x14]
	adds r1, r6, #0
	ldr r0, [r0, #0x34]
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	adds r2, r7, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r1, [r4, #8]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0201D578
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #3
	blt _021E6102
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6174: .4byte 0x021E66F8
	thumb_func_end ov62_021E60E4

	thumb_func_start ov62_021E6178
ov62_021E6178: @ 0x021E6178
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	adds r5, r7, #4
	adds r6, r4, #0
_021E6182:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D634
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _021E6182
	ldr r0, [r7, #0x34]
	bl FUN_0200BB44
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov62_021E6178

	thumb_func_start ov62_021E61AC
ov62_021E61AC: @ 0x021E61AC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #8
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201A4BC
	movs r1, #0x12
	adds r0, r4, #0
	lsls r1, r1, #4
	bl FUN_0201AA8C
	movs r2, #0x12
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	str r4, [r5, #0x1c]
	movs r0, #0
	str r0, [r5]
	adds r4, #0x1f
	movs r0, #0x1f
	bics r4, r0
	movs r0, #1
	str r4, [r5, #4]
	lsls r0, r0, #8
	str r0, [r5, #8]
	movs r0, #0x41
	lsls r0, r0, #6
	str r0, [r5, #0xc]
	movs r0, #1
	str r0, [r5, #0x10]
	str r6, [r5, #0x14]
	str r7, [r5, #0x18]
	bl FUN_02005518
	str r0, [r5, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov62_021E61AC

	thumb_func_start ov62_021E61FC
ov62_021E61FC: @ 0x021E61FC
	push {r3, lr}
	ldr r0, [r0, #0x1c]
	bl FUN_0201AB0C
	movs r0, #8
	bl FUN_0201A4CC
	pop {r3, pc}
	thumb_func_end ov62_021E61FC

	thumb_func_start ov62_021E620C
ov62_021E620C: @ 0x021E620C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02005518
	adds r4, r0, #0
	beq _021E621E
	ldr r0, [r5, #0x34]
	cmp r0, #0
	bne _021E6256
_021E621E:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _021E6238
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _021E6234
	adds r0, r5, #0
	bl ov62_021E6278
	movs r0, #1
	str r0, [r5, #0x2c]
_021E6234:
	movs r0, #1
	str r0, [r5, #0x30]
_021E6238:
	cmp r4, #0
	beq _021E6256
	ldr r0, [r5, #0x34]
	cmp r0, #0
	bne _021E6256
	movs r0, #0
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _021E6256
	adds r0, r5, #0
	bl ov62_021E625C
	movs r0, #0
	str r0, [r5, #0x2c]
_021E6256:
	str r4, [r5, #0x34]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov62_021E620C

	thumb_func_start ov62_021E625C
ov62_021E625C: @ 0x021E625C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	cmp r1, #0
	bne _021E6270
	bl FUN_02005520
	movs r0, #1
	str r0, [r4, #0x28]
	pop {r4, pc}
_021E6270:
	movs r0, #1
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov62_021E625C

	thumb_func_start ov62_021E6278
ov62_021E6278: @ 0x021E6278
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02005550
	movs r0, #0
	str r0, [r4, #0x28]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov62_021E6278

	thumb_func_start ov62_021E6288
ov62_021E6288: @ 0x021E6288
	push {r3, r4, r5, lr}
	ldr r1, [r0, #8]
	movs r2, #0
	subs r1, r1, #1
	adds r4, r2, #0
	ldr r5, [r0, #4]
	cmp r1, #0
	ble _021E62AE
	movs r0, #1
	lsls r0, r0, #8
_021E629C:
	ldrb r3, [r5, r4]
	cmp r3, #0x80
	bhs _021E62A6
	subs r3, r0, r3
	b _021E62A6
_021E62A6:
	adds r4, r4, #1
	adds r2, r2, r3
	cmp r4, r1
	blt _021E629C
_021E62AE:
	adds r0, r2, #0
	blx FUN_020F2998
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov62_021E6288

	thumb_func_start ov62_021E62B8
ov62_021E62B8: @ 0x021E62B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	cmp r0, #0
	bne _021E638A
	adds r4, r5, #0
	adds r4, #0xf0
	adds r0, r4, #0
	bl ov62_021E6288
	adds r7, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, r7
	bge _021E62E4
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl ov62_021E6390
	adds r6, r0, #0
	str r7, [r4, #0x20]
	movs r0, #1
	str r0, [r4, #0x24]
	b _021E62F4
_021E62E4:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov62_021E6390
	adds r6, r0, #0
	ldr r0, [r4, #0x20]
	subs r0, r0, #2
	str r0, [r4, #0x20]
_021E62F4:
	cmp r6, #0
	beq _021E6368
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _021E630A
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_0200DC4C
	movs r0, #0
	str r0, [r4, #0x24]
_021E630A:
	adds r0, r5, #0
	bl ov62_021E63D0
	cmp r0, #0
	beq _021E6326
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #0x80
	movs r3, #0x40
	bl ov62_021E63E8
	b _021E6356
_021E6326:
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xb4
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6356
	movs r1, #0x4e
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #0x80
	movs r3, #0x40
	bl ov62_021E63E8
	adds r0, r5, #0
	movs r1, #0xa
	adds r0, #0xb4
	str r1, [r0]
_021E6356:
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_0200DC4C
	ldr r0, [r5, #0xc]
	adds r1, r6, #0
	bl FUN_0200DC4C
	b _021E6382
_021E6368:
	bne _021E6382
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_0200DC4C
	ldr r0, [r5, #8]
	movs r1, #0
	bl FUN_0200DC4C
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_0200DC4C
_021E6382:
	ldr r0, _021E638C @ =0x021E68E0
	ldr r1, [r0]
	adds r1, r1, #1
	str r1, [r0]
_021E638A:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E638C: .4byte 0x021E68E0
	thumb_func_end ov62_021E62B8

	thumb_func_start ov62_021E6390
ov62_021E6390: @ 0x021E6390
	push {r4, lr}
	cmp r0, #0x8c
	bhi _021E639A
	movs r4, #0
	b _021E63CA
_021E639A:
	cmp r0, #0x8d
	blo _021E63A6
	cmp r0, #0x98
	bhi _021E63A6
	movs r4, #1
	b _021E63CA
_021E63A6:
	cmp r0, #0x99
	blo _021E63B2
	cmp r0, #0xa6
	bhi _021E63B2
	movs r4, #2
	b _021E63CA
_021E63B2:
	cmp r0, #0xa7
	blo _021E63BE
	cmp r0, #0xbb
	bhi _021E63BE
	movs r4, #3
	b _021E63CA
_021E63BE:
	cmp r0, #0xbc
	blo _021E63C6
	movs r4, #4
	b _021E63CA
_021E63C6:
	bl GF_AssertFail
_021E63CA:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov62_021E6390

	thumb_func_start ov62_021E63D0
ov62_021E63D0: @ 0x021E63D0
	movs r2, #0
_021E63D2:
	ldr r1, [r0, #0x50]
	cmp r1, #0
	beq _021E63DC
	movs r0, #0
	bx lr
_021E63DC:
	adds r2, r2, #1
	adds r0, #0x30
	cmp r2, #3
	blt _021E63D2
	movs r0, #1
	bx lr
	thumb_func_end ov62_021E63D0

	thumb_func_start ov62_021E63E8
ov62_021E63E8: @ 0x021E63E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	movs r4, #0
	str r3, [sp, #0x10]
	adds r7, r2, #0
	str r4, [sp, #0x14]
	adds r1, r4, #0
	adds r3, r0, #0
_021E63F8:
	ldr r2, [r3, #0x50]
	cmp r2, #0
	bne _021E6414
	movs r2, #0x30
	muls r2, r1, r2
	adds r1, r1, #4
	adds r3, r0, #0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0, #8]
	adds r3, #0x24
	adds r4, r3, r2
	str r0, [sp, #0x14]
	b _021E641C
_021E6414:
	adds r1, r1, #1
	adds r3, #0x30
	cmp r1, #3
	blt _021E63F8
_021E641C:
	cmp r4, #0
	beq _021E6472
	bl FUN_0201FD44
	ldr r1, _021E6478 @ =0x00001002
	muls r1, r0, r1
	asrs r0, r1, #0xf
	lsrs r0, r0, #0x10
	adds r0, r1, r0
	asrs r1, r0, #0x10
	ldr r0, _021E647C @ =0x00001333
	adds r6, r1, r0
	bl FUN_0201FD44
	movs r1, #0x3e
	muls r1, r0, r1
	asrs r0, r1, #0xf
	lsrs r0, r0, #0x10
	adds r0, r1, r0
	asrs r5, r0, #0x10
	adds r5, #0x3c
	bl FUN_0201FD44
	lsls r1, r0, #4
	asrs r0, r1, #0xf
	lsrs r0, r0, #0x10
	adds r0, r1, r0
	asrs r0, r0, #0x10
	str r6, [sp]
	adds r0, r0, #6
	str r5, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov62_021E6480
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6472:
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6478: .4byte 0x00001002
_021E647C: .4byte 0x00001333
	thumb_func_end ov62_021E63E8

	thumb_func_start ov62_021E6480
ov62_021E6480: @ 0x021E6480
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r2, #0
	ldr r0, _021E656C @ =ov62_021E6570
	adds r4, r1, #0
	movs r2, #0
	adds r6, r3, #0
	bl FUN_0200E320
	str r0, [r4, #0x2c]
	bl FUN_0201F988
	adds r4, r0, #0
	ldr r0, [sp, #0x24]
	str r7, [r4]
	str r0, [r4, #4]
	cmp r5, #0
	ble _021E64B6
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E64C4
_021E64B6:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E64C4:
	blx FUN_020F2104
	str r0, [r4, #8]
	cmp r6, #0
	ble _021E64E0
	lsls r0, r6, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021E64EE
_021E64E0:
	lsls r0, r6, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021E64EE:
	blx FUN_020F2104
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x1c]
	adds r0, #0x5a
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	adds r2, r0, #0
	ldr r0, [sp, #0x18]
	asrs r3, r2, #0x1f
	asrs r7, r0, #0x1f
	adds r1, r7, #0
	str r0, [sp]
	blx FUN_020F2948
	adds r2, r0, #0
	movs r0, #2
	movs r3, #0
	lsls r0, r0, #0xa
	adds r0, r2, r0
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	adds r2, r0, #0
	ldr r0, [sp]
	adds r1, r7, #0
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r3, #2
	movs r2, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r2
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	rsbs r0, r1, #0
	str r0, [r4, #0x18]
	str r2, [r4, #0x1c]
	movs r0, #6
	str r2, [r4, #0x20]
	lsls r0, r0, #0xc
	str r0, [r4, #0x24]
	ldr r0, [sp, #0x20]
	adds r1, r5, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	adds r2, r6, #0
	bl FUN_0200DDB8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E656C: .4byte ov62_021E6570
	thumb_func_end ov62_021E6480

	thumb_func_start ov62_021E6570
ov62_021E6570: @ 0x021E6570
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E658C
	subs r0, r0, #1
	str r0, [r5, #4]
	bne _021E65FC
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
_021E658C:
	adds r0, r5, #0
	adds r0, #8
	adds r1, #0x14
	adds r2, r0, #0
	blx FUN_020CCD78
	ldr r0, [r5, #8]
	ldr r2, [r5, #0x20]
	lsls r0, r0, #4
	asrs r6, r0, #0x10
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x24]
	lsls r0, r0, #4
	adds r3, r2, r1
	movs r1, #0x5a
	asrs r4, r0, #0x10
	adds r0, r5, #0
	lsls r1, r1, #0xe
	adds r0, #0x20
	str r3, [r5, #0x20]
	cmp r3, r1
	ble _021E65C6
	adds r2, r1, #0
_021E65BA:
	ldr r3, [r0]
	subs r3, r3, r1
	str r3, [r0]
	ldr r3, [r5, #0x20]
	cmp r3, r2
	bgt _021E65BA
_021E65C6:
	lsls r0, r3, #4
	lsrs r0, r0, #0x10
	bl FUN_0201FBB8
	ldr r1, [r5, #0x28]
	adds r2, r4, #0
	muls r0, r1, r0
	asrs r0, r0, #0xc
	adds r0, r6, r0
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r0, [r5]
	bl FUN_0200DDB8
	movs r0, #0xf
	mvns r0, r0
	cmp r4, r0
	bge _021E65FC
	ldr r0, [r5]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r7, #0
	bl FUN_0200E390
	movs r0, #0
	str r0, [r5, #0x2c]
_021E65FC:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov62_021E6570

	thumb_func_start ov62_021E6600
ov62_021E6600: @ 0x021E6600
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
_021E6608:
	ldr r0, [r5, #0x50]
	cmp r0, #0
	beq _021E6614
	bl FUN_0200E390
	str r6, [r5, #0x50]
_021E6614:
	adds r4, r4, #1
	adds r5, #0x30
	cmp r4, #3
	blt _021E6608
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov62_021E6600

	thumb_func_start ov62_021E6620
ov62_021E6620: @ 0x021E6620
	ldr r3, _021E6628 @ =FUN_02025224
	ldr r0, _021E662C @ =_021E6650
	bx r3
	nop
_021E6628: .4byte FUN_02025224
_021E662C: .4byte _021E6650
	thumb_func_end ov62_021E6620

	thumb_func_start ov62_021E6630
ov62_021E6630: @ 0x021E6630
	push {r3, lr}
	bl ov62_021E6620
	cmp r0, #0
	beq _021E6644
	ldr r0, _021E664C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _021E6648
_021E6644:
	movs r0, #1
	pop {r3, pc}
_021E6648:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021E664C: .4byte 0x021D110C
	thumb_func_end ov62_021E6630

	.rodata

_021E6650:
	.byte 0xA0, 0xC0, 0xB8, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x09, 0x03, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0x04, 0x05, 0x08, 0x16, 0x05, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x0F, 0x00, 0x04, 0x18, 0x15, 0x06, 0x02, 0x00, 0x6F, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x40, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x0A, 0x00, 0x00
	.byte 0x03, 0x0A, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x04, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x0A, 0x00, 0x00, 0x03, 0x0A, 0x00, 0x00, 0x02, 0x0A, 0x00, 0x00, 0x04, 0x0A, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x0B, 0x00, 0x00, 0x03, 0x0B, 0x00, 0x00, 0x02, 0x0B, 0x00, 0x00
	.byte 0x04, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD8, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x0D, 0x00, 0x00, 0x03, 0x0D, 0x00, 0x00
	.byte 0x02, 0x0D, 0x00, 0x00, 0x04, 0x0D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x0C, 0x00, 0x00
	.byte 0x03, 0x0C, 0x00, 0x00, 0x02, 0x0C, 0x00, 0x00, 0x04, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x59, 0x1E, 0x02
	.byte 0x1D, 0x5A, 0x1E, 0x02, 0xC1, 0x59, 0x1E, 0x02, 0xFF, 0xFF, 0xFF, 0xFF

	.bss

_021E68E0:
	.space 0x20
