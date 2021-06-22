
	thumb_func_start ov05_0221BA00
ov05_0221BA00: @ 0x0221BA00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0221BA5C @ =ov05_0221BA70
	ldr r1, _0221BA60 @ =0x00000BD4
	ldr r3, [r5, #0x24]
	movs r2, #0x64
	bl FUN_02007200
	bl FUN_0201F988
	ldr r2, _0221BA60 @ =0x00000BD4
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, _0221BA64 @ =0x00000B7F
	str r5, [r4]
	movs r1, #0
	strb r1, [r4, r0]
	bl FUN_020304B4
	ldr r1, _0221BA68 @ =0x00000BC8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0221BA58
	ldr r0, [r4]
	ldr r1, [r0]
	cmp r1, #0
	beq _0221BA58
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0221BA58
	bl FUN_0207879C
	ldr r1, _0221BA6C @ =0x000001D1
	ldr r3, [r5, #0x24]
	movs r2, #1
	bl FUN_020784B0
	ldr r1, _0221BA68 @ =0x00000BC8
	str r0, [r4, r1]
_0221BA58:
	pop {r3, r4, r5, pc}
	nop
_0221BA5C: .4byte ov05_0221BA70
_0221BA60: .4byte 0x00000BD4
_0221BA64: .4byte 0x00000B7F
_0221BA68: .4byte 0x00000BC8
_0221BA6C: .4byte 0x000001D1
	thumb_func_end ov05_0221BA00

	thumb_func_start ov05_0221BA70
ov05_0221BA70: @ 0x0221BA70
	push {r4, r5, r6, lr}
	ldr r2, _0221BAF8 @ =0x00000B7F
	adds r5, r1, #0
	ldrb r2, [r5, r2]
	cmp r2, #0
	beq _0221BA86
	cmp r2, #1
	beq _0221BA92
	cmp r2, #2
	beq _0221BAC4
	b _0221BACC
_0221BA86:
	adds r0, r5, #0
	bl ov05_0221BD28
	ldr r1, _0221BAF8 @ =0x00000B7F
	strb r0, [r5, r1]
	b _0221BACC
_0221BA92:
	movs r4, #0x2e
	lsls r4, r4, #6
	adds r6, r4, #0
_0221BA98:
	ldrb r1, [r5, r6]
	ldr r2, [r5, #4]
	adds r0, r5, #0
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	blx r1
	cmp r0, #0
	beq _0221BAAE
	ldrb r1, [r5, r4]
	adds r1, r1, #1
	strb r1, [r5, r4]
_0221BAAE:
	cmp r0, #2
	beq _0221BA98
	ldr r0, [r5]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #2
	bne _0221BACC
	adds r0, r5, #0
	bl ov05_0221BB30
	b _0221BACC
_0221BAC4:
	bl ov05_0221CC74
	cmp r0, #1
	beq _0221BAF6
_0221BACC:
	movs r0, #0x2e
	lsls r0, r0, #6
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _0221BAE6
	adds r0, r5, #0
	bl ov05_0221CE50
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D020
_0221BAE6:
	ldr r0, [r5]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221BAF6
	ldr r0, _0221BAFC @ =0x04000540
	movs r1, #1
	str r1, [r0]
_0221BAF6:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221BAF8: .4byte 0x00000B7F
_0221BAFC: .4byte 0x04000540
	thumb_func_end ov05_0221BA70

	thumb_func_start ov05_0221BB00
ov05_0221BB00: @ 0x0221BB00
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0221BB2C @ =0x0221EC00
	add r3, sp, #0
	movs r2, #5
_0221BB0A:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0221BB0A
	add r0, sp, #0
	bl FUN_02022BE8
	movs r1, #6
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x12
	blx FUN_020D47EC
	add sp, #0x28
	pop {r4, pc}
	nop
_0221BB2C: .4byte 0x0221EC00
	thumb_func_end ov05_0221BB00

	thumb_func_start ov05_0221BB30
ov05_0221BB30: @ 0x0221BB30
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov05_0221E9F8
	cmp r0, #0
	bne _0221BB40
	b _0221BD08
_0221BB40:
	ldr r2, _0221BD0C @ =0x00000BBC
	ldr r0, [r4, r2]
	cmp r0, #8
	bhi _0221BBBA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221BB54: @ jump table
	.2byte _0221BD08 - _0221BB54 - 2 @ case 0
	.2byte _0221BB66 - _0221BB54 - 2 @ case 1
	.2byte _0221BBA6 - _0221BB54 - 2 @ case 2
	.2byte _0221BBC4 - _0221BB54 - 2 @ case 3
	.2byte _0221BC5C - _0221BB54 - 2 @ case 4
	.2byte _0221BC98 - _0221BB54 - 2 @ case 5
	.2byte _0221BD08 - _0221BB54 - 2 @ case 6
	.2byte _0221BCD8 - _0221BB54 - 2 @ case 7
	.2byte _0221BD08 - _0221BB54 - 2 @ case 8
_0221BB66:
	adds r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221BD10 @ =0x00000BAC
	movs r1, #0
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	ldr r2, _0221BD14 @ =0x00000B88
	str r3, [sp, #4]
	adds r0, r4, r2
	str r3, [sp, #8]
	adds r2, #0x2c
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0221BD18 @ =0x00000BB8
	str r0, [r4, r1]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, _0221BD0C @ =0x00000BBC
	movs r1, #2
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BBA6:
	adds r0, r2, #0
	adds r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0221BBBA
	ldr r0, _0221BD1C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _0221BBBC
_0221BBBA:
	b _0221BD08
_0221BBBC:
	movs r0, #3
	add sp, #0xc
	str r0, [r4, r2]
	pop {r3, r4, pc}
_0221BBC4:
	adds r0, r2, #0
	adds r0, #0x10
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0221BBE0
	adds r0, r2, #0
	subs r0, #0x10
	subs r2, #8
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	movs r1, #2
	bl FUN_0200BB6C
	b _0221BBF0
_0221BBE0:
	adds r0, r2, #0
	subs r0, #0x10
	subs r2, #8
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_0200BB6C
_0221BBF0:
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _0221BD20 @ =0x00000B98
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _0221BD20 @ =0x00000B98
	movs r1, #0
	adds r0, r4, r0
	movs r2, #1
	movs r3, #0xf
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	ldr r2, _0221BD20 @ =0x00000B98
	str r3, [sp, #4]
	adds r0, r4, r2
	str r3, [sp, #8]
	adds r2, #0x1c
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0221BD18 @ =0x00000BB8
	movs r2, #0x1f
	str r0, [r4, r1]
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, _0221BD24 @ =0x0221EA58
	ldr r0, [r0, #0x24]
	movs r3, #0xe
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl FUN_02001F20
	movs r1, #0x2f
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, _0221BD0C @ =0x00000BBC
	movs r1, #4
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BC5C:
	ldr r1, [r4]
	adds r0, r2, #4
	ldr r0, [r4, r0]
	ldr r1, [r1, #0x24]
	bl FUN_02001FDC
	cmp r0, #0
	beq _0221BC78
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _0221BC88
	add sp, #0xc
	pop {r3, r4, pc}
_0221BC78:
	ldr r0, _0221BD0C @ =0x00000BBC
	movs r1, #5
	str r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #4
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BC88:
	ldr r0, _0221BD0C @ =0x00000BBC
	movs r1, #1
	str r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #4
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BC98:
	adds r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221BD10 @ =0x00000BAC
	movs r1, #5
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	ldr r2, _0221BD14 @ =0x00000B88
	str r3, [sp, #4]
	adds r0, r4, r2
	str r3, [sp, #8]
	adds r2, #0x2c
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0221BD18 @ =0x00000BB8
	str r0, [r4, r1]
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, _0221BD0C @ =0x00000BBC
	movs r1, #6
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BCD8:
	adds r0, r2, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221BCF0
	ldr r1, [r4]
	ldr r1, [r1, #0x24]
	bl FUN_02001FFC
	movs r0, #0x2f
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
_0221BCF0:
	ldr r0, _0221BD14 @ =0x00000B88
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, _0221BD0C @ =0x00000BBC
	movs r1, #8
	str r1, [r4, r0]
_0221BD08:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0221BD0C: .4byte 0x00000BBC
_0221BD10: .4byte 0x00000BAC
_0221BD14: .4byte 0x00000B88
_0221BD18: .4byte 0x00000BB8
_0221BD1C: .4byte 0x021D110C
_0221BD20: .4byte 0x00000B98
_0221BD24: .4byte 0x0221EA58
	thumb_func_end ov05_0221BB30

	thumb_func_start ov05_0221BD28
ov05_0221BD28: @ 0x0221BD28
	push {r3, r4, r5, lr}
	ldr r1, _0221BDE0 @ =0x04000050
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r1]
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r1, #1
	lsls r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _0221BDE4 @ =0xFFFFE0FF
	ldr r5, _0221BDE8 @ =0x04000304
	ands r0, r2
	str r0, [r1]
	ldr r0, _0221BDEC @ =0x04001000
	adds r1, #0x50
	ldr r3, [r0]
	ands r2, r3
	str r2, [r0]
	ldrh r3, [r5]
	lsrs r2, r5, #0xb
	adds r0, #0x50
	orrs r2, r3
	strh r2, [r5]
	movs r2, #0
	strh r2, [r1]
	strh r2, [r0]
	bl ov05_0221BB00
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AC88
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	bl FUN_020030E8
	str r0, [r4, #8]
	ldr r3, [r4]
	movs r1, #0
	ldr r3, [r3, #0x24]
	lsrs r2, r5, #0x11
	bl FUN_02003120
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	ldr r0, _0221BDF0 @ =0x00000B82
	movs r3, #0
	strb r3, [r4, r0]
	subs r1, r0, #1
	movs r2, #8
	strb r2, [r4, r1]
	subs r0, r0, #2
	strb r3, [r4, r0]
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221BDBE
	cmp r0, #1
	beq _0221BDC4
	cmp r0, #2
	beq _0221BDCA
	b _0221BDDC
_0221BDBE:
	ldr r0, _0221BDF4 @ =0x0221EAC0
	str r0, [r4, #4]
	b _0221BDDC
_0221BDC4:
	ldr r0, _0221BDF8 @ =0x0221EA98
	str r0, [r4, #4]
	b _0221BDDC
_0221BDCA:
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #3
	bne _0221BDD8
	ldr r0, _0221BDFC @ =0x0221EC28
	str r0, [r4, #4]
	b _0221BDDC
_0221BDD8:
	ldr r0, _0221BE00 @ =0x0221EC98
	str r0, [r4, #4]
_0221BDDC:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221BDE0: .4byte 0x04000050
_0221BDE4: .4byte 0xFFFFE0FF
_0221BDE8: .4byte 0x04000304
_0221BDEC: .4byte 0x04001000
_0221BDF0: .4byte 0x00000B82
_0221BDF4: .4byte 0x0221EAC0
_0221BDF8: .4byte 0x0221EA98
_0221BDFC: .4byte 0x0221EC28
_0221BE00: .4byte 0x0221EC98
	thumb_func_end ov05_0221BD28

	thumb_func_start ov05_0221BE04
ov05_0221BE04: @ 0x0221BE04
	push {r4, lr}
	ldr r1, _0221BE78 @ =0x00000B82
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _0221BE1A
	cmp r2, #1
	beq _0221BE26
	cmp r2, #2
	beq _0221BE32
	b _0221BE6C
_0221BE1A:
	bl ov05_0221DB94
	adds r0, r4, #0
	bl ov05_0221DC60
	b _0221BE6C
_0221BE26:
	bl ov05_0221E07C
	adds r0, r4, #0
	bl ov05_0221E274
	b _0221BE6C
_0221BE32:
	movs r2, #0
	strb r2, [r4, r1]
	movs r2, #0x20
	subs r1, r1, #1
	strb r2, [r4, r1]
	bl ov05_0221DD08
	adds r0, r4, #0
	bl ov05_0221E5E4
	adds r0, r4, #0
	bl ov05_0221E944
	adds r0, r4, #0
	bl ov05_0221DE38
	bl FUN_0203A880
	ldr r1, [r4]
	movs r0, #0
	ldr r1, [r1, #0x24]
	bl FUN_020880CC
	ldr r0, _0221BE7C @ =ov05_0221CE88
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #1
	pop {r4, pc}
_0221BE6C:
	ldr r0, _0221BE78 @ =0x00000B82
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0221BE78: .4byte 0x00000B82
_0221BE7C: .4byte ov05_0221CE88
	thumb_func_end ov05_0221BE04

	thumb_func_start ov05_0221BE80
ov05_0221BE80: @ 0x0221BE80
	push {r4, lr}
	ldr r1, _0221BF00 @ =0x00000B82
	adds r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0221BE96
	cmp r1, #1
	beq _0221BEAA
	cmp r1, #2
	beq _0221BEC4
	b _0221BEF2
_0221BE96:
	movs r1, #1
	movs r2, #0
	bl ov05_0221CEB8
	adds r0, r4, #0
	bl ov05_0221D094
	bl ov05_0221D228
	b _0221BEF2
_0221BEAA:
	movs r1, #0
	adds r2, r1, #0
	bl ov05_0221D6C4
	adds r0, r4, #0
	bl ov05_0221D240
	bl FUN_0203A880
	adds r0, r4, #0
	bl ov05_0221D9F0
	b _0221BEF2
_0221BEC4:
	ldr r1, [r4]
	movs r0, #0
	ldr r1, [r1, #0x24]
	bl FUN_020880CC
	ldr r0, _0221BF04 @ =ov05_0221CE88
	adds r1, r4, #0
	bl FUN_0201A0FC
	ldr r1, _0221BF00 @ =0x00000B82
	movs r0, #0
	strb r0, [r4, r1]
	movs r2, #8
	subs r0, r1, #6
	strb r2, [r4, r0]
	subs r0, r1, #5
	movs r2, #4
	strb r2, [r4, r0]
	movs r0, #0x10
	subs r1, #0xe
	str r0, [r4, r1]
	movs r0, #1
	pop {r4, pc}
_0221BEF2:
	ldr r0, _0221BF00 @ =0x00000B82
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	movs r0, #0
	pop {r4, pc}
	nop
_0221BF00: .4byte 0x00000B82
_0221BF04: .4byte ov05_0221CE88
	thumb_func_end ov05_0221BE80

	thumb_func_start ov05_0221BF08
ov05_0221BF08: @ 0x0221BF08
	push {r3, r4, r5, lr}
	ldr r1, _0221C000 @ =0x00000B82
	adds r5, r0, #0
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _0221BF1E
	cmp r1, #1
	beq _0221BF7A
	cmp r1, #2
	beq _0221BF92
	b _0221BFF2
_0221BF1E:
	movs r1, #0
	movs r2, #1
	bl ov05_0221CEB8
	adds r0, r5, #0
	bl ov05_0221D094
	adds r0, r5, #0
	bl ov05_0221D140
	bl ov05_0221D228
	ldr r2, [r5]
	movs r0, #7
	ldr r1, [r2]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	ldr r1, [r2, #0x24]
	add r2, sp, #0
	movs r3, #0
	bl FUN_0202FD28
	ldr r1, [sp]
	ldr r0, _0221C004 @ =0x00000BCC
	movs r4, #0
	str r1, [r5, r0]
	adds r0, r0, #4
	str r4, [r5, r0]
_0221BF56:
	adds r0, r4, #0
	bl FUN_02034818
	cmp r0, #0
	beq _0221BF72
	bl FUN_0202907C
	cmp r0, #0
	bne _0221BF72
	movs r0, #0xbd
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r5, r0]
	b _0221BFF2
_0221BF72:
	adds r4, r4, #1
	cmp r4, #8
	blt _0221BF56
	b _0221BFF2
_0221BF7A:
	movs r1, #0x1f
	mvns r1, r1
	adds r2, r1, #0
	adds r2, #0x10
	bl ov05_0221D6C4
	adds r0, r5, #0
	bl ov05_0221D7AC
	bl FUN_0203A880
	b _0221BFF2
_0221BF92:
	ldr r1, [r5]
	movs r0, #0
	ldr r1, [r1, #0x24]
	bl FUN_020880CC
	ldr r0, _0221C008 @ =ov05_0221CE88
	adds r1, r5, #0
	bl FUN_0201A0FC
	ldr r2, _0221C000 @ =0x00000B82
	movs r0, #0
	strb r0, [r5, r2]
	movs r3, #4
	subs r1, r2, #6
	strb r3, [r5, r1]
	subs r1, r2, #5
	movs r3, #2
	strb r3, [r5, r1]
	movs r1, #0xc
	subs r2, #0xe
	str r1, [r5, r2]
	ldr r3, [r5]
	ldr r2, _0221C00C @ =0x0000027E
	ldr r3, [r3, #0x24]
	movs r1, #0x1b
	bl FUN_0200BAF8
	ldr r1, _0221C010 @ =0x00000BAC
	str r0, [r5, r1]
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl FUN_0200BD08
	movs r1, #0xbb
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r1, [r5]
	movs r0, #5
	ldr r1, [r1, #0x24]
	lsls r0, r0, #6
	bl FUN_02026354
	ldr r1, _0221C014 @ =0x00000BB4
	str r0, [r5, r1]
	movs r0, #1
	adds r1, #8
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
_0221BFF2:
	ldr r0, _0221C000 @ =0x00000B82
	ldrb r1, [r5, r0]
	adds r1, r1, #1
	strb r1, [r5, r0]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221C000: .4byte 0x00000B82
_0221C004: .4byte 0x00000BCC
_0221C008: .4byte ov05_0221CE88
_0221C00C: .4byte 0x0000027E
_0221C010: .4byte 0x00000BAC
_0221C014: .4byte 0x00000BB4
	thumb_func_end ov05_0221BF08

	thumb_func_start ov05_0221C018
ov05_0221C018: @ 0x0221C018
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0221C028
	movs r0, #0
	pop {r4, pc}
_0221C028:
	ldr r1, _0221C04C @ =0x00000B81
	adds r0, r1, #1
	ldrb r2, [r4, r1]
	ldrb r0, [r4, r0]
	cmp r2, r0
	bne _0221C03E
	movs r2, #0
	adds r0, r1, #1
	strb r2, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0221C03E:
	adds r0, r1, #1
	ldrb r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #1
	strb r2, [r4, r0]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0221C04C: .4byte 0x00000B81
	thumb_func_end ov05_0221C018

	thumb_func_start ov05_0221C050
ov05_0221C050: @ 0x0221C050
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_0201BDF4
	cmp r0, #0x18
	bgt _0221C0EC
	ldr r1, _0221C214 @ =0x00000B82
	movs r2, #0
	adds r0, r1, #0
	strb r2, [r4, r1]
	subs r0, #0xa
	strh r2, [r4, r0]
	subs r1, #8
	strh r2, [r4, r1]
	ldr r0, [r4, #0xc]
	movs r1, #3
	movs r3, #0x18
	bl FUN_0201F238
	movs r2, #0
	adds r3, r2, #0
	ldr r0, [r4, #0xc]
	movs r1, #2
	subs r3, #0x18
	bl FUN_0201F238
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov05_0221D3AC
	movs r2, #0
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov05_0221D3AC
	movs r2, #0
	adds r0, r4, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov05_0221D3AC
	movs r2, #0
	adds r0, r4, #0
	movs r1, #3
	adds r3, r2, #0
	bl ov05_0221D3AC
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov05_0221D664
	movs r2, #0
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov05_0221D664
	movs r2, #0
	adds r0, r4, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov05_0221D664
	movs r2, #0
	adds r0, r4, #0
	movs r1, #3
	adds r3, r2, #0
	bl ov05_0221D664
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221C0EC:
	ldr r3, _0221C218 @ =0x00000B74
	ldr r0, [r4, #0xc]
	ldr r3, [r4, r3]
	movs r1, #3
	movs r2, #2
	bl FUN_0201F238
	ldr r3, _0221C218 @ =0x00000B74
	ldr r0, [r4, #0xc]
	ldr r3, [r4, r3]
	movs r1, #2
	movs r2, #1
	bl FUN_0201F238
	ldr r3, _0221C214 @ =0x00000B82
	movs r1, #0
	ldrb r0, [r4, r3]
	adds r2, r3, #0
	subs r2, #0xe
	adds r0, r0, #1
	strb r0, [r4, r3]
	ldr r5, [r4, r2]
	ldrb r2, [r4, r3]
	adds r3, r5, #0
	adds r0, r4, #0
	muls r3, r2, r3
	movs r2, #1
	lsls r2, r2, #8
	subs r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r3, r1, #0
	bl ov05_0221D3AC
	ldr r2, _0221C218 @ =0x00000B74
	movs r1, #1
	ldr r3, [r4, r2]
	adds r2, #0xe
	adds r5, r3, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #0
	muls r5, r2, r5
	adds r2, r1, #0
	adds r2, #0xff
	subs r2, r5, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C218 @ =0x00000B74
	movs r1, #2
	ldr r3, [r4, r2]
	adds r2, #0xe
	adds r5, r3, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #0
	muls r5, r2, r5
	adds r2, r1, #0
	adds r2, #0xfe
	subs r2, r2, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C218 @ =0x00000B74
	movs r1, #3
	ldr r3, [r4, r2]
	adds r2, #0xe
	adds r5, r3, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #0
	muls r5, r2, r5
	adds r2, r1, #0
	adds r2, #0xfd
	subs r2, r2, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C218 @ =0x00000B74
	movs r1, #0
	ldr r3, [r4, r2]
	adds r2, #0xe
	adds r5, r3, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	adds r3, r1, #0
	muls r5, r2, r5
	movs r2, #1
	lsls r2, r2, #8
	subs r2, r5, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C218 @ =0x00000B74
	movs r1, #1
	ldr r3, [r4, r2]
	adds r2, #0xe
	adds r5, r3, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #0
	muls r5, r2, r5
	adds r2, r1, #0
	adds r2, #0xff
	subs r2, r5, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C218 @ =0x00000B74
	movs r1, #2
	ldr r3, [r4, r2]
	adds r2, #0xe
	adds r5, r3, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	movs r3, #0
	muls r5, r2, r5
	adds r2, r1, #0
	adds r2, #0xfe
	subs r2, r2, r5
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C218 @ =0x00000B74
	adds r0, r4, #0
	ldr r3, [r4, r2]
	adds r2, #0xe
	ldrb r2, [r4, r2]
	adds r4, r3, #0
	movs r1, #3
	muls r4, r2, r4
	adds r2, r1, #0
	adds r2, #0xfd
	subs r2, r2, r4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl ov05_0221D664
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C214: .4byte 0x00000B82
_0221C218: .4byte 0x00000B74
	thumb_func_end ov05_0221C050

	thumb_func_start ov05_0221C21C
ov05_0221C21C: @ 0x0221C21C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov05_0221DAE0
	cmp r0, #0
	bne _0221C238
	ldr r0, _0221C418 @ =0x00000B82
	ldrb r1, [r5, r0]
	cmp r1, #0x18
	bls _0221C238
	movs r1, #0
	strb r1, [r5, r0]
	movs r0, #1
	pop {r4, r5, r6, pc}
_0221C238:
	ldr r0, _0221C418 @ =0x00000B82
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0221C258
	ldr r0, [r5]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221C252
	ldr r0, _0221C41C @ =0x00000715
	bl FUN_0200604C
	b _0221C258
_0221C252:
	ldr r0, _0221C420 @ =0x00000852
	bl FUN_0200604C
_0221C258:
	ldr r0, _0221C418 @ =0x00000B82
	ldrb r1, [r5, r0]
	cmp r1, #0x18
	bne _0221C2F4
	ldr r0, [r5, #0xc]
	movs r1, #3
	movs r2, #0
	movs r3, #0x18
	bl FUN_0201F238
	movs r2, #0
	adds r3, r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #2
	subs r3, #0x18
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201F238
	ldr r0, [r5, #0xc]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov05_0221D3AC
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov05_0221D3AC
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov05_0221D3AC
	movs r2, #0
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl ov05_0221D3AC
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov05_0221D664
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl ov05_0221D664
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov05_0221D664
	movs r2, #0
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl ov05_0221D664
	b _0221C40C
_0221C2F4:
	blo _0221C2F8
	b _0221C40C
_0221C2F8:
	subs r0, r0, #6
	ldrsb r4, [r5, r0]
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldr r0, _0221C424 @ =0x00000B7D
	ldrsb r4, [r5, r0]
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r6, #0
	bge _0221C338
	ldr r0, _0221C428 @ =0x00000B78
	ldrsh r0, [r5, r0]
	cmp r0, #0
	blt _0221C344
_0221C338:
	cmp r6, #0
	ble _0221C34E
	ldr r0, _0221C428 @ =0x00000B78
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _0221C34E
_0221C344:
	movs r0, #0
	mvns r0, r0
	muls r0, r6, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
_0221C34E:
	cmp r4, #0
	bge _0221C35A
	ldr r0, _0221C42C @ =0x00000B7A
	ldrsh r0, [r5, r0]
	cmp r0, #0
	blt _0221C366
_0221C35A:
	cmp r4, #0
	ble _0221C370
	ldr r0, _0221C42C @ =0x00000B7A
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _0221C370
_0221C366:
	movs r0, #0
	mvns r0, r0
	muls r0, r4, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_0221C370:
	adds r3, r6, #0
	ldr r0, [r5, #0xc]
	movs r1, #3
	movs r2, #0
	adds r3, #0x18
	bl FUN_0201F238
	adds r3, r6, #0
	ldr r0, [r5, #0xc]
	movs r1, #2
	movs r2, #0
	subs r3, #0x18
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r5, #0xc]
	adds r2, r1, #0
	adds r3, r4, #0
	bl FUN_0201F238
	ldr r0, [r5, #0xc]
	movs r1, #2
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201F238
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D3AC
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D3AC
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D3AC
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D3AC
	adds r0, r5, #0
	movs r1, #0
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D664
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D664
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D664
	adds r0, r5, #0
	movs r1, #3
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov05_0221D664
	ldr r0, _0221C428 @ =0x00000B78
	strh r6, [r5, r0]
	adds r0, r0, #2
	strh r4, [r5, r0]
_0221C40C:
	ldr r0, _0221C418 @ =0x00000B82
	ldrb r1, [r5, r0]
	adds r1, r1, #1
	strb r1, [r5, r0]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221C418: .4byte 0x00000B82
_0221C41C: .4byte 0x00000715
_0221C420: .4byte 0x00000852
_0221C424: .4byte 0x00000B7D
_0221C428: .4byte 0x00000B78
_0221C42C: .4byte 0x00000B7A
	thumb_func_end ov05_0221C21C

	thumb_func_start ov05_0221C430
ov05_0221C430: @ 0x0221C430
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _0221C548 @ =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #8
	bne _0221C458
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r3, _0221C54C @ =0x00007FFF
	ldr r0, [r0, #0x24]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
_0221C458:
	ldr r0, _0221C548 @ =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #8
	blo _0221C474
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0221C474
	ldr r0, _0221C550 @ =0x00000B7F
	movs r1, #2
	strb r1, [r4, r0]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0221C474:
	ldr r0, _0221C548 @ =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C482
	ldr r0, _0221C554 @ =0x00000719
	bl FUN_0200604C
_0221C482:
	ldr r0, [r4, #0xc]
	movs r1, #3
	movs r2, #1
	movs r3, #0x10
	bl FUN_0201F238
	movs r1, #2
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	movs r3, #0x10
	bl FUN_0201F238
	ldr r2, _0221C548 @ =0x00000B82
	movs r1, #0
	ldrb r0, [r4, r2]
	adds r3, r1, #0
	adds r0, r0, #1
	strb r0, [r4, r2]
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	lsls r2, r2, #4
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #1
	movs r3, #0
	lsls r2, r2, #4
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #2
	movs r3, #0
	lsls r2, r2, #0x14
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #3
	movs r3, #0
	lsls r2, r2, #0x14
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 @ =0x00000B82
	movs r1, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	adds r3, r1, #0
	lsls r2, r2, #4
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C548 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #1
	movs r3, #0
	lsls r2, r2, #4
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C548 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #2
	movs r3, #0
	lsls r2, r2, #0x14
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C548 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #3
	movs r3, #0
	lsls r2, r2, #0x14
	asrs r2, r2, #0x10
	bl ov05_0221D664
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0221C548: .4byte 0x00000B82
_0221C54C: .4byte 0x00007FFF
_0221C550: .4byte 0x00000B7F
_0221C554: .4byte 0x00000719
	thumb_func_end ov05_0221C430

	thumb_func_start ov05_0221C558
ov05_0221C558: @ 0x0221C558
	ldr r1, _0221C564 @ =0x00000B81
	movs r2, #0x10
	strb r2, [r0, r1]
	movs r0, #2
	bx lr
	nop
_0221C564: .4byte 0x00000B81
	thumb_func_end ov05_0221C558

	thumb_func_start ov05_0221C568
ov05_0221C568: @ 0x0221C568
	push {r4, lr}
	adds r4, r0, #0
	bl ov05_0221CCF4
	cmp r0, #1
	ldr r0, [r4]
	bne _0221C58C
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	ldr r0, _0221C5A4 @ =0x00000B7E
	bne _0221C586
	movs r1, #0
	strb r1, [r4, r0]
	b _0221C5A0
_0221C586:
	movs r1, #1
	strb r1, [r4, r0]
	b _0221C5A0
_0221C58C:
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	ldr r0, _0221C5A4 @ =0x00000B7E
	bne _0221C59C
	movs r1, #1
	strb r1, [r4, r0]
	b _0221C5A0
_0221C59C:
	movs r1, #0
	strb r1, [r4, r0]
_0221C5A0:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_0221C5A4: .4byte 0x00000B7E
	thumb_func_end ov05_0221C568

	thumb_func_start ov05_0221C5A8
ov05_0221C5A8: @ 0x0221C5A8
	push {r3, lr}
	ldr r1, _0221C5C0 @ =0x00000B7E
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _0221C5B8
	bl ov05_0221C5C4
	pop {r3, pc}
_0221C5B8:
	bl ov05_0221C6C8
	pop {r3, pc}
	nop
_0221C5C0: .4byte 0x00000B7E
	thumb_func_end ov05_0221C5A8

	thumb_func_start ov05_0221C5C4
ov05_0221C5C4: @ 0x0221C5C4
	push {r3, r4, r5, lr}
	ldr r3, _0221C6B8 @ =0x00000B82
	adds r4, r0, #0
	ldrb r3, [r4, r3]
	movs r1, #2
	ldr r0, [r4, #0xc]
	lsls r5, r3, #1
	ldr r3, _0221C6BC @ =0x0221EA6C
	adds r2, r1, #0
	ldrb r3, [r3, r5]
	bl FUN_0201F238
	ldr r3, _0221C6B8 @ =0x00000B82
	ldr r0, [r4, #0xc]
	ldrb r3, [r4, r3]
	movs r1, #3
	movs r2, #2
	lsls r5, r3, #1
	ldr r3, _0221C6BC @ =0x0221EA6C
	ldrb r3, [r3, r5]
	bl FUN_0201F238
	ldr r2, _0221C6B8 @ =0x00000B82
	movs r1, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	adds r3, r1, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #1
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #2
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #3
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 @ =0x00000B82
	movs r1, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	adds r3, r1, #0
	bl ov05_0221D664
	ldr r2, _0221C6B8 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #1
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	bl ov05_0221D664
	ldr r2, _0221C6B8 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #2
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	bl ov05_0221D664
	ldr r2, _0221C6B8 @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #3
	lsls r3, r2, #1
	ldr r2, _0221C6C0 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	bl ov05_0221D664
	ldr r0, _0221C6B8 @ =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C69E
	ldr r0, _0221C6C4 @ =0x00000853
	bl FUN_0200604C
_0221C69E:
	ldr r0, _0221C6B8 @ =0x00000B82
	ldrb r1, [r4, r0]
	cmp r1, #5
	bne _0221C6AE
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221C6AE:
	adds r1, r1, #1
	strb r1, [r4, r0]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221C6B8: .4byte 0x00000B82
_0221C6BC: .4byte 0x0221EA6C
_0221C6C0: .4byte 0x0221EA6D
_0221C6C4: .4byte 0x00000853
	thumb_func_end ov05_0221C5C4

	thumb_func_start ov05_0221C6C8
ov05_0221C6C8: @ 0x0221C6C8
	push {r3, r4, r5, lr}
	ldr r3, _0221C7EC @ =0x00000B82
	adds r4, r0, #0
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0xc]
	movs r1, #2
	lsls r5, r3, #1
	ldr r3, _0221C7F0 @ =0x0221EA6C
	movs r2, #1
	ldrb r3, [r3, r5]
	bl FUN_0201F238
	ldr r3, _0221C7EC @ =0x00000B82
	ldr r0, [r4, #0xc]
	ldrb r3, [r4, r3]
	movs r1, #3
	movs r2, #1
	lsls r5, r3, #1
	ldr r3, _0221C7F0 @ =0x0221EA6C
	ldrb r3, [r3, r5]
	bl FUN_0201F238
	ldr r2, _0221C7EC @ =0x00000B82
	movs r1, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	adds r3, r1, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #1
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #2
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #3
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC @ =0x00000B82
	movs r1, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	adds r3, r1, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C7EC @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #1
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C7EC @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #2
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C7EC @ =0x00000B82
	adds r0, r4, #0
	ldrb r2, [r4, r2]
	movs r1, #3
	lsls r3, r2, #1
	ldr r2, _0221C7F4 @ =0x0221EA6D
	ldrb r2, [r2, r3]
	movs r3, #0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl ov05_0221D664
	ldr r0, _0221C7EC @ =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C7D2
	ldr r0, _0221C7F8 @ =0x00000853
	bl FUN_0200604C
_0221C7D2:
	ldr r0, _0221C7EC @ =0x00000B82
	ldrb r1, [r4, r0]
	cmp r1, #5
	bne _0221C7E2
	movs r1, #0
	strb r1, [r4, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221C7E2:
	adds r1, r1, #1
	strb r1, [r4, r0]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221C7EC: .4byte 0x00000B82
_0221C7F0: .4byte 0x0221EA6C
_0221C7F4: .4byte 0x0221EA6D
_0221C7F8: .4byte 0x00000853
	thumb_func_end ov05_0221C6C8

	thumb_func_start ov05_0221C7FC
ov05_0221C7FC: @ 0x0221C7FC
	ldr r1, _0221C808 @ =0x00000B81
	movs r2, #0x10
	strb r2, [r0, r1]
	movs r0, #2
	bx lr
	nop
_0221C808: .4byte 0x00000B81
	thumb_func_end ov05_0221C7FC

	thumb_func_start ov05_0221C80C
ov05_0221C80C: @ 0x0221C80C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _0221C894 @ =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C850
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #1
	lsls r0, r0, #0x1a
	adds r3, r0, #0
	ldr r2, [r0]
	ldr r1, _0221C898 @ =0xFFFF1FFF
	adds r3, #0x48
	ands r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	str r1, [r0]
	ldrh r5, [r3]
	movs r2, #0x3f
	movs r1, #0x1f
	bics r5, r2
	orrs r5, r1
	movs r1, #0x20
	orrs r1, r5
	strh r1, [r3]
	adds r0, #0x4a
	ldrh r3, [r0]
	movs r1, #0x1d
	bics r3, r2
	orrs r1, r3
	strh r1, [r0]
_0221C850:
	ldr r3, _0221C894 @ =0x00000B82
	ldrb r1, [r4, r3]
	cmp r1, #0x10
	bne _0221C870
	movs r0, #0
	movs r1, #0x20
	strb r0, [r4, r3]
	subs r0, r3, #1
	strb r1, [r4, r0]
	lsls r2, r1, #0x15
	ldr r1, [r2]
	ldr r0, _0221C898 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	movs r0, #1
	pop {r4, r5, r6, pc}
_0221C870:
	movs r2, #0x47
	subs r2, r2, r1
	adds r1, #0x48
	lsls r1, r1, #0x18
	movs r6, #0xff
	ldr r0, _0221C89C @ =0x04000040
	lsls r5, r2, #8
	lsls r2, r6, #8
	ands r2, r5
	lsrs r1, r1, #0x18
	strh r6, [r0]
	orrs r1, r2
	strh r1, [r0, #4]
	ldrb r0, [r4, r3]
	adds r0, r0, #1
	strb r0, [r4, r3]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221C894: .4byte 0x00000B82
_0221C898: .4byte 0xFFFF1FFF
_0221C89C: .4byte 0x04000040
	thumb_func_end ov05_0221C80C

	thumb_func_start ov05_0221C8A0
ov05_0221C8A0: @ 0x0221C8A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221C8D8 @ =0x0000071A
	bl FUN_0200604C
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DC4C
	ldr r0, _0221C8DC @ =0x00000B81
	movs r1, #0x20
	strb r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0221C8D8: .4byte 0x0000071A
_0221C8DC: .4byte 0x00000B81
	thumb_func_end ov05_0221C8A0

	thumb_func_start ov05_0221C8E0
ov05_0221C8E0: @ 0x0221C8E0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221C900 @ =0x0000071A
	bl FUN_0200604C
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, _0221C904 @ =0x00000B81
	movs r1, #0x40
	strb r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0221C900: .4byte 0x0000071A
_0221C904: .4byte 0x00000B81
	thumb_func_end ov05_0221C8E0

	thumb_func_start ov05_0221C908
ov05_0221C908: @ 0x0221C908
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov05_0221E9F8
	cmp r0, #0
	bne _0221C920
	ldr r1, _0221CA9C @ =0x00000B81
	movs r0, #1
	add sp, #0xc
	strb r0, [r4, r1]
	pop {r3, r4, pc}
_0221C920:
	movs r0, #0xbd
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0221C938
	subs r0, #0x10
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221C938
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0221C938:
	ldr r0, _0221CAA0 @ =0x00000BBC
	ldr r1, [r4, r0]
	cmp r1, #5
	bne _0221C946
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0221C946:
	cmp r1, #6
	beq _0221C960
	cmp r1, #5
	beq _0221C960
	cmp r1, #7
	beq _0221C960
	cmp r1, #8
	beq _0221C960
	movs r1, #7
	str r1, [r4, r0]
	movs r1, #0xff
	subs r0, #0x3a
	strb r1, [r4, r0]
_0221C960:
	ldr r0, _0221CAA4 @ =0x00000B82
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0221C972
	cmp r1, #1
	beq _0221C9B0
	cmp r1, #2
	beq _0221CA4A
	b _0221CA68
_0221C972:
	adds r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221CAA8 @ =0x00000BAC
	movs r1, #8
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	ldr r2, _0221CAAC @ =0x00000B88
	str r3, [sp, #4]
	adds r0, r4, r2
	str r3, [sp, #8]
	adds r2, #0x2c
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0221CAB0 @ =0x00000BB8
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov05_0221EA18
	ldr r0, _0221CAA4 @ =0x00000B82
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _0221CA8C
_0221C9B0:
	adds r2, r0, #2
	adds r0, r0, #4
	ldr r1, [r4]
	adds r2, r4, r2
	str r2, [sp]
	adds r0, r4, r0
	str r0, [sp, #4]
	ldr r2, [r1]
	movs r0, #7
	adds r1, #0x2c
	lsls r0, r0, #6
	ldr r0, [r2, r0]
	movs r2, #0
	ldrb r1, [r1]
	adds r3, r2, #0
	bl FUN_0202FE14
	cmp r0, #2
	bne _0221C9EC
	ldr r2, _0221CAA8 @ =0x00000BAC
	movs r1, #6
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
	ldr r0, _0221CAB4 @ =0x0000061A
	bl FUN_0200604C
	b _0221C9FE
_0221C9EC:
	cmp r0, #3
	bne _0221CA8C
	ldr r2, _0221CAA8 @ =0x00000BAC
	movs r1, #7
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
_0221C9FE:
	adds r0, r4, #0
	bl ov05_0221EA38
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _0221CAAC @ =0x00000B88
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	movs r3, #0
	str r3, [sp]
	ldr r2, _0221CAAC @ =0x00000B88
	str r3, [sp, #4]
	adds r0, r4, r2
	str r3, [sp, #8]
	adds r2, #0x2c
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0221CAB0 @ =0x00000BB8
	movs r2, #0
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x37
	strb r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0x36
	ldrb r0, [r4, r0]
	subs r1, #0x36
	adds r0, r0, #1
	strb r0, [r4, r1]
	b _0221CA8C
_0221CA4A:
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	adds r2, r1, #1
	subs r1, r0, #1
	strb r2, [r4, r1]
	ldrb r1, [r4, r1]
	cmp r1, #0x1e
	bls _0221CA8C
	movs r2, #0
	subs r1, r0, #1
	strb r2, [r4, r1]
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _0221CA8C
_0221CA68:
	adds r0, r0, #6
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0200E9BC
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, _0221CAA4 @ =0x00000B82
	movs r1, #0
	strb r1, [r4, r0]
	movs r1, #0x15
	subs r0, r0, #1
	strb r1, [r4, r0]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0221CA8C:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201EFBC
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0221CA9C: .4byte 0x00000B81
_0221CAA0: .4byte 0x00000BBC
_0221CAA4: .4byte 0x00000B82
_0221CAA8: .4byte 0x00000BAC
_0221CAAC: .4byte 0x00000B88
_0221CAB0: .4byte 0x00000BB8
_0221CAB4: .4byte 0x0000061A
	thumb_func_end ov05_0221C908

	thumb_func_start ov05_0221CAB8
ov05_0221CAB8: @ 0x0221CAB8
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _0221CB5C @ =0x00000B82
	adds r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0221CACC
	cmp r1, #1
	beq _0221CB34
	b _0221CB4A
_0221CACC:
	bl ov05_0221E9F8
	cmp r0, #0
	bne _0221CADC
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
_0221CADC:
	adds r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221CB60 @ =0x00000BAC
	movs r1, #9
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	ldr r2, _0221CB64 @ =0x00000B88
	str r3, [sp, #4]
	adds r0, r4, r2
	str r3, [sp, #8]
	adds r2, #0x2c
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _0221CB68 @ =0x00000BB8
	str r0, [r4, r1]
	movs r0, #0x3e
	bl FUN_02037AC0
	ldr r0, _0221CB6C @ =0x00000BC8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221CB2A
	adds r0, r4, #0
	bl ov05_0221E9F8
	cmp r0, #1
	bne _0221CB2A
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
_0221CB2A:
	ldr r0, _0221CB5C @ =0x00000B82
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _0221CB4E
_0221CB34:
	movs r0, #0x3e
	bl FUN_02037B38
	cmp r0, #0
	beq _0221CB4E
	ldr r0, _0221CB5C @ =0x00000B82
	movs r1, #0
	strb r1, [r4, r0]
	add sp, #0xc
	movs r0, #1
	pop {r3, r4, pc}
_0221CB4A:
	bl FUN_0202551C
_0221CB4E:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201EFBC
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0221CB5C: .4byte 0x00000B82
_0221CB60: .4byte 0x00000BAC
_0221CB64: .4byte 0x00000B88
_0221CB68: .4byte 0x00000BB8
_0221CB6C: .4byte 0x00000BC8
	thumb_func_end ov05_0221CAB8

	thumb_func_start ov05_0221CB70
ov05_0221CB70: @ 0x0221CB70
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ov05_0221CCF4
	cmp r0, #1
	ldr r0, [r4]
	bne _0221CBB2
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221CB9E
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, [r4, #8]
	movs r2, #0x40
	adds r3, r1, #0
	bl FUN_02003318
	b _0221CBE2
_0221CB9E:
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r2, #0x40
	adds r3, r1, #0
	bl FUN_02003318
	b _0221CBE2
_0221CBB2:
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221CBCE
	movs r1, #0
	str r1, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	movs r2, #0x40
	adds r3, r1, #0
	bl FUN_02003318
	b _0221CBE2
_0221CBCE:
	movs r0, #0x30
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, [r4, #8]
	movs r2, #0x40
	adds r3, r1, #0
	bl FUN_02003318
_0221CBE2:
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_02003B74
	ldr r0, _0221CBFC @ =0x0000071B
	bl FUN_0200604C
	ldr r0, _0221CC00 @ =0x00000B81
	movs r1, #0x40
	strb r1, [r4, r0]
	movs r0, #1
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0221CBFC: .4byte 0x0000071B
_0221CC00: .4byte 0x00000B81
	thumb_func_end ov05_0221CB70

	thumb_func_start ov05_0221CC04
ov05_0221CC04: @ 0x0221CC04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221CC50 @ =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221CC16
	ldr r0, _0221CC54 @ =0x00000719
	bl FUN_0200604C
_0221CC16:
	ldr r1, _0221CC50 @ =0x00000B82
	ldrb r0, [r4, r1]
	cmp r0, #0x10
	bne _0221CC2C
	movs r0, #0
	strb r0, [r4, r1]
	movs r2, #0x40
	subs r0, r1, #1
	strb r2, [r4, r0]
	movs r0, #1
	pop {r4, pc}
_0221CC2C:
	adds r0, r0, #1
	strb r0, [r4, r1]
	ldrb r2, [r4, r1]
	movs r1, #0x10
	adds r0, r4, #0
	subs r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl ov05_0221E564
	ldr r1, _0221CC50 @ =0x00000B82
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov05_0221DE6C
	movs r0, #0
	pop {r4, pc}
	nop
_0221CC50: .4byte 0x00000B82
_0221CC54: .4byte 0x00000719
	thumb_func_end ov05_0221CC04

	thumb_func_start ov05_0221CC58
ov05_0221CC58: @ 0x0221CC58
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #1
	ldr r1, [r1, #0x24]
	bl FUN_020880CC
	ldr r0, _0221CC70 @ =0x00000B7F
	movs r1, #2
	strb r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0221CC70: .4byte 0x00000B7F
	thumb_func_end ov05_0221CC58

	thumb_func_start ov05_0221CC74
ov05_0221CC74: @ 0x0221CC74
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0221CC86
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221CC86:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov05_0221EA38
	ldr r0, [r4]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CCBE
	adds r0, r4, #0
	bl ov05_0221CFF0
	adds r0, r4, #0
	bl ov05_0221D020
	adds r0, r4, #0
	bl ov05_0221D054
	adds r0, r4, #0
	bl ov05_0221DB18
	adds r0, r4, #0
	bl ov05_0221D690
	b _0221CCCA
_0221CCBE:
	adds r0, r4, #0
	bl ov05_0221DC34
	adds r0, r4, #0
	bl ov05_0221E60C
_0221CCCA:
	adds r0, r4, #0
	bl ov05_0221CE0C
	bl FUN_020205AC
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02003150
	ldr r0, [r4, #8]
	bl FUN_02003104
	ldr r0, [r4]
	movs r1, #1
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, r5, #0
	bl FUN_02007234
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov05_0221CC74

	thumb_func_start ov05_0221CCF4
ov05_0221CCF4: @ 0x0221CCF4
	push {r3, lr}
	bl FUN_0203769C
	bl FUN_020378AC
	cmp r0, #3
	bhi _0221CD1E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221CD0E: @ jump table
	.2byte _0221CD16 - _0221CD0E - 2 @ case 0
	.2byte _0221CD1A - _0221CD0E - 2 @ case 1
	.2byte _0221CD16 - _0221CD0E - 2 @ case 2
	.2byte _0221CD1A - _0221CD0E - 2 @ case 3
_0221CD16:
	movs r0, #1
	pop {r3, pc}
_0221CD1A:
	movs r0, #0
	pop {r3, pc}
_0221CD1E:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov05_0221CCF4

	thumb_func_start ov05_0221CD24
ov05_0221CD24: @ 0x0221CD24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	adds r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	movs r0, #0x40
	ldr r1, [r1, #0x24]
	adds r4, r2, #0
	bl FUN_0202055C
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl FUN_0200CF18
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl FUN_0200CF38
	movs r1, #0x65
	lsls r1, r1, #2
	add r2, sp, #0x18
	ldr r3, _0221CDBC @ =0x0221EBE0
	str r0, [r5, r1]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _0221CDC0 @ =0x0221EAAC
	add r2, sp, #4
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r6, #0
	str r0, [r2]
	movs r0, #0x65
	lsls r0, r0, #2
	str r4, [sp, #4]
	subs r0, r0, #4
	ldr r0, [r5, r0]
	adds r2, r7, #0
	movs r3, #0x10
	bl FUN_0200CF70
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CFF4
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [sp]
	bl FUN_0200D3F8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CDBC: .4byte 0x0221EBE0
_0221CDC0: .4byte 0x0221EAAC
	thumb_func_end ov05_0221CD24

	thumb_func_start ov05_0221CDC4
ov05_0221CDC4: @ 0x0221CDC4
	push {lr}
	sub sp, #0x34
	adds r2, r0, #0
	movs r0, #0
	add r3, sp, #0
	strh r0, [r3]
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	strh r0, [r3, #6]
	ldr r3, [r1, #0x14]
	str r3, [sp, #8]
	ldr r3, [r1, #0x18]
	str r3, [sp, #0xc]
	movs r3, #1
	str r3, [sp, #0x10]
	ldr r3, [r1]
	str r3, [sp, #0x14]
	ldr r3, [r1, #4]
	str r3, [sp, #0x18]
	ldr r3, [r1, #8]
	str r3, [sp, #0x1c]
	ldr r3, [r1, #0xc]
	str r3, [sp, #0x20]
	ldr r1, [r1, #0x10]
	str r1, [sp, #0x2c]
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0x30]
	ldr r0, [r2, r1]
	adds r1, r1, #4
	ldr r1, [r2, r1]
	add r2, sp, #0
	bl FUN_0200D734
	add sp, #0x34
	pop {pc}
	thumb_func_end ov05_0221CDC4

	thumb_func_start ov05_0221CE0C
ov05_0221CE0C: @ 0x0221CE0C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r4, #0
	cmp r0, #0
	bls _0221CE36
	movs r7, #0x21
	adds r5, r6, #0
	lsls r7, r7, #4
_0221CE22:
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D9DC
	ldr r0, [r6, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blo _0221CE22
_0221CE36:
	movs r1, #0x19
	lsls r1, r1, #4
	ldr r0, [r6, r1]
	adds r1, r1, #4
	ldr r1, [r6, r1]
	bl FUN_0200D998
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221CE0C

	thumb_func_start ov05_0221CE50
ov05_0221CE50: @ 0x0221CE50
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x21
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r4, #0
	cmp r0, #0
	bls _0221CE84
	movs r7, #0x66
	lsls r7, r7, #2
	adds r6, r7, #0
	adds r6, #0x78
_0221CE68:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r7]
	movs r1, #1
	ldr r0, [r0]
	lsls r1, r1, #0xc
	bl FUN_020249B0
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5, r6]
	cmp r4, r0
	blo _0221CE68
_0221CE84:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov05_0221CE50

	thumb_func_start ov05_0221CE88
ov05_0221CE88: @ 0x0221CE88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_0201EEB4
	ldr r0, [r4, #8]
	bl FUN_0200398C
	bl FUN_0202061C
	bl FUN_0200D034
	ldr r3, _0221CEB0 @ =0x027E0000
	ldr r1, _0221CEB4 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0221CEB0: .4byte 0x027E0000
_0221CEB4: .4byte 0x00003FF8
	thumb_func_end ov05_0221CE88

	thumb_func_start ov05_0221CEB8
ov05_0221CEB8: @ 0x0221CEB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	adds r5, r0, #0
	ldr r0, _0221CFD4 @ =0x00000BA8
	adds r4, r1, #0
	ldr r6, _0221CFD8 @ =0x0221EA78
	str r4, [r5, r0]
	add r3, sp, #0x70
	adds r7, r2, #0
	adds r2, r3, #0
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	str r4, [sp, #0x7c]
	bl FUN_0201ACB0
	ldr r6, _0221CFDC @ =0x0221EB1C
	add r3, sp, #0x54
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #3
	str r0, [r3]
	ldr r0, [r5, #0xc]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0xc]
	movs r1, #3
	bl FUN_0201CAE0
	movs r1, #3
	adds r3, r1, #0
	ldr r0, [r5, #0xc]
	movs r2, #0
	adds r3, #0xfd
	bl FUN_0201F238
	ldr r6, _0221CFE0 @ =0x0221EB54
	add r3, sp, #0x38
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
	ldr r0, [r5, #0xc]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl FUN_0201CAE0
	movs r3, #0xff
	ldr r0, [r5, #0xc]
	movs r1, #2
	movs r2, #0
	mvns r3, r3
	bl FUN_0201F238
	ldr r6, _0221CFE4 @ =0x0221EB70
	add r3, sp, #0x1c
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
	ldr r0, [r5, #0xc]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_0201CAE0
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	cmp r7, #1
	bne _0221CF88
	ldr r0, [r5, #0xc]
	movs r1, #1
	movs r2, #3
	movs r3, #0x18
	bl FUN_0201BC8C
_0221CF88:
	cmp r4, #0
	bne _0221CFD0
	ldr r4, _0221CFE8 @ =0x0221EBA8
	add r3, sp, #0
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0
	str r0, [r3]
	ldr r0, [r5, #0xc]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_0201CAE0
	ldr r0, _0221CFEC @ =0x00000BC8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0221CFC8
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
_0221CFC8:
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
_0221CFD0:
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221CFD4: .4byte 0x00000BA8
_0221CFD8: .4byte 0x0221EA78
_0221CFDC: .4byte 0x0221EB1C
_0221CFE0: .4byte 0x0221EB54
_0221CFE4: .4byte 0x0221EB70
_0221CFE8: .4byte 0x0221EBA8
_0221CFEC: .4byte 0x00000BC8
	thumb_func_end ov05_0221CEB8

	thumb_func_start ov05_0221CFF0
ov05_0221CFF0: @ 0x0221CFF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221D018 @ =0x00000B94
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0221D004
	subs r0, #0xc
	adds r0, r4, r0
	bl FUN_0201D520
_0221D004:
	ldr r0, _0221D01C @ =0x00000BA4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0221D014
	subs r0, #0xc
	adds r0, r4, r0
	bl FUN_0201D520
_0221D014:
	pop {r4, pc}
	nop
_0221D018: .4byte 0x00000B94
_0221D01C: .4byte 0x00000BA4
	thumb_func_end ov05_0221CFF0

	thumb_func_start ov05_0221D020
ov05_0221D020: @ 0x0221D020
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221D04C @ =0x00000BB4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D030
	bl FUN_02026380
_0221D030:
	movs r0, #0xbb
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D03E
	bl FUN_0200BDA0
_0221D03E:
	ldr r0, _0221D050 @ =0x00000BAC
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D04A
	bl FUN_0200BB44
_0221D04A:
	pop {r4, pc}
	.align 2, 0
_0221D04C: .4byte 0x00000BB4
_0221D050: .4byte 0x00000BAC
	thumb_func_end ov05_0221D020

	thumb_func_start ov05_0221D054
ov05_0221D054: @ 0x0221D054
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, _0221D090 @ =0x00000BA8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221D088
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_0201BB4C
_0221D088:
	ldr r0, [r4, #0xc]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
_0221D090: .4byte 0x00000BA8
	thumb_func_end ov05_0221D054

	thumb_func_start ov05_0221D094
ov05_0221D094: @ 0x0221D094
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x68
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r5]
	movs r3, #1
	ldr r2, [r2, #0x24]
	adds r4, r0, #0
	str r2, [sp, #0xc]
	ldr r2, [r5, #0xc]
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #4
	ldr r0, [r0, #0x24]
	movs r3, #1
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #2
	ldr r0, [r0, #0x24]
	adds r3, r1, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #3
	ldr r0, [r0, #0x24]
	adds r3, r1, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	bl FUN_02007B68
	movs r2, #0
	str r2, [sp]
	ldr r0, [r5]
	movs r1, #1
	ldr r0, [r0, #0x24]
	adds r3, r2, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	bl FUN_02007B8C
	movs r1, #0
	ldr r0, [r5, #8]
	adds r2, r1, #0
	movs r3, #0xa0
	bl FUN_020032A4
	ldr r1, _0221D13C @ =0x000018C6
	movs r0, #1
	bl FUN_0201C2D8
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D13C: .4byte 0x000018C6
	thumb_func_end ov05_0221D094

	thumb_func_start ov05_0221D140
ov05_0221D140: @ 0x0221D140
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _0221D21C @ =0x00000BA8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221D164
	ldr r0, [r4]
	cmp r0, #0
	beq _0221D164
	ldr r1, [r0]
	cmp r1, #0
	beq _0221D164
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0221D168
_0221D164:
	bl FUN_0202551C
_0221D168:
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	movs r2, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	movs r3, #0xf
	bl FUN_0200E644
	ldr r0, [r4, #8]
	movs r1, #0
	movs r2, #0xf0
	movs r3, #0x20
	bl FUN_020032A4
	movs r1, #0
	str r1, [sp]
	ldr r0, [r4]
	movs r2, #0x1f
	ldr r0, [r0, #0x24]
	movs r3, #0xe
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl FUN_0200E3DC
	ldr r0, [r4, #8]
	movs r1, #0
	movs r2, #0xe0
	movs r3, #0x20
	bl FUN_020032A4
	ldr r2, [r4]
	movs r1, #0x1a
	ldr r2, [r2, #0x24]
	movs r0, #0
	lsls r1, r1, #4
	bl FUN_02003030
	ldr r0, [r4, #8]
	movs r1, #0
	movs r2, #0xd0
	movs r3, #0x20
	bl FUN_020032A4
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	ldr r1, _0221D220 @ =0x00000B88
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xc]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	ldr r1, _0221D224 @ =0x00000B98
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xc]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0221D21C: .4byte 0x00000BA8
_0221D220: .4byte 0x00000B88
_0221D224: .4byte 0x00000B98
	thumb_func_end ov05_0221D140

	thumb_func_start ov05_0221D228
ov05_0221D228: @ 0x0221D228
	push {r3, lr}
	ldr r0, _0221D23C @ =0x04000050
	movs r3, #8
	movs r1, #2
	movs r2, #0x1c
	str r3, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	nop
_0221D23C: .4byte 0x04000050
	thumb_func_end ov05_0221D228

	thumb_func_start ov05_0221D240
ov05_0221D240: @ 0x0221D240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, _0221D310 @ =0x0221EB04
	add r3, sp, #0
	adds r6, r0, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	adds r0, r6, #0
	movs r2, #0x15
	bl ov05_0221CD24
	adds r0, r6, #0
	bl ov05_0221D318
	ldr r4, _0221D314 @ =0x0221EDA4
	movs r7, #0
	adds r5, r6, #0
_0221D26E:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov05_0221CDC4
	movs r1, #0x66
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r7, r7, #1
	adds r4, #0x1c
	adds r5, r5, #4
	cmp r7, #0xc
	blo _0221D26E
	movs r1, #0
	movs r2, #0xff
	adds r0, r6, #0
	mvns r2, r2
	adds r3, r1, #0
	bl ov05_0221D3AC
	movs r2, #0xff
	adds r0, r6, #0
	movs r1, #1
	mvns r2, r2
	movs r3, #0
	bl ov05_0221D3AC
	movs r1, #2
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfe
	movs r3, #0
	bl ov05_0221D3AC
	movs r1, #3
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfd
	movs r3, #0
	bl ov05_0221D3AC
	adds r0, r6, #0
	bl ov05_0221D4D0
	movs r0, #0x21
	movs r1, #0xc
	lsls r0, r0, #4
	str r1, [r6, r0]
	adds r0, r6, #0
	bl ov05_0221D5DC
	movs r1, #0
	movs r2, #0xff
	adds r0, r6, #0
	mvns r2, r2
	adds r3, r1, #0
	bl ov05_0221D664
	movs r2, #0xff
	adds r0, r6, #0
	movs r1, #1
	mvns r2, r2
	movs r3, #0
	bl ov05_0221D664
	movs r1, #2
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfe
	movs r3, #0
	bl ov05_0221D664
	movs r1, #3
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfd
	movs r3, #0
	bl ov05_0221D664
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D310: .4byte 0x0221EB04
_0221D314: .4byte 0x0221EDA4
	thumb_func_end ov05_0221D240

	thumb_func_start ov05_0221D318
ov05_0221D318: @ 0x0221D318
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #8
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221D3A8 @ =0x0000B807
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0xd0
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _0221D3A8 @ =0x0000B807
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x68
	movs r3, #8
	bl FUN_0200D564
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221D3A8 @ =0x0000B807
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0xcf
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221D3A8 @ =0x0000B807
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0xd1
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221D3A8: .4byte 0x0000B807
	thumb_func_end ov05_0221D318

	thumb_func_start ov05_0221D3AC
ov05_0221D3AC: @ 0x0221D3AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _0221D408 @ =_0221EA54
	str r2, [sp]
	ldrb r5, [r4]
	str r3, [sp, #4]
	add r3, sp, #8
	strb r5, [r3]
	ldrb r5, [r4, #1]
	add r2, sp, #8
	movs r7, #0
	strb r5, [r3, #1]
	ldrb r5, [r4, #2]
	ldrb r4, [r4, #3]
	adds r6, r0, r1
	strb r5, [r3, #2]
	strb r4, [r3, #3]
	ldrb r2, [r2, r1]
	adds r4, r7, #0
	lsls r2, r2, #2
	adds r5, r0, r2
_0221D3D6:
	ldr r1, _0221D40C @ =0x00000B64
	movs r0, #0x66
	ldrb r1, [r6, r1]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r1, r4
	ldr r1, [sp]
	adds r1, r1, r2
	ldr r2, _0221D410 @ =0x00000B68
	lsls r1, r1, #0x10
	ldrb r3, [r6, r2]
	ldr r2, [sp, #4]
	asrs r1, r1, #0x10
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r7, r7, #1
	adds r4, #0x13
	adds r5, r5, #4
	cmp r7, #3
	blo _0221D3D6
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221D408: .4byte _0221EA54
_0221D40C: .4byte 0x00000B64
_0221D410: .4byte 0x00000B68
	thumb_func_end ov05_0221D3AC

	thumb_func_start ov05_0221D414
ov05_0221D414: @ 0x0221D414
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r0, r1, #0
	str r1, [sp]
	str r2, [sp, #4]
	adds r7, r3, #0
	bl FUN_02074640
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r5, #0
	ldr r0, [sp, #4]
	adds r4, r5, #0
	cmp r0, #0
	ble _0221D4CC
	lsls r0, r7, #2
	adds r6, r6, r0
_0221D43A:
	lsls r0, r4, #2
	adds r1, r6, r0
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DC4C
	ldr r0, [sp, #8]
	cmp r0, r4
	bls _0221D4C0
	ldr r0, [sp]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0221D4C0
	adds r0, r7, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0221D4C0
	adds r0, r7, #0
	bl FUN_0208AD64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _0221D494
	lsls r0, r5, #2
	adds r1, r6, r0
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #3
	bl FUN_0200DC4C
	b _0221D4BA
_0221D494:
	cmp r0, #7
	beq _0221D4AA
	lsls r0, r5, #2
	adds r1, r6, r0
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_0200DC4C
	b _0221D4BA
_0221D4AA:
	lsls r0, r5, #2
	adds r1, r6, r0
	movs r0, #0x66
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200DC4C
_0221D4BA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0221D4C0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _0221D43A
_0221D4CC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221D414

	thumb_func_start ov05_0221D4D0
ov05_0221D4D0: @ 0x0221D4D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4]
	adds r1, r2, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	ldr r1, [r2, #4]
	bne _0221D4FA
	movs r2, #6
	movs r3, #0
	bl ov05_0221D414
	ldr r1, [r4]
	movs r2, #6
	ldr r1, [r1, #8]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov05_0221D414
	pop {r4, pc}
_0221D4FA:
	movs r2, #3
	movs r3, #0
	bl ov05_0221D414
	ldr r1, [r4]
	movs r2, #3
	ldr r1, [r1, #0xc]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov05_0221D414
	ldr r1, [r4]
	adds r0, r4, #0
	ldr r1, [r1, #8]
	movs r2, #3
	movs r3, #6
	bl ov05_0221D414
	ldr r1, [r4]
	adds r0, r4, #0
	ldr r1, [r1, #0x10]
	movs r2, #3
	movs r3, #9
	bl ov05_0221D414
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov05_0221D4D0

	thumb_func_start ov05_0221D530
ov05_0221D530: @ 0x0221D530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r4, r0, #0
	movs r0, #0
	adds r5, r4, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r7, r2, #0
	adds r5, #0x10
	adds r6, r1, #0
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	movs r2, #8
	movs r3, #2
	bl FUN_0201D494
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r7, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, _0221D5D0 @ =0x00000B44
	ldr r0, [r4, r0]
	str r0, [sp, #0x10]
	movs r0, #0x65
	str r5, [sp, #0x14]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E2B0
	str r0, [sp, #0x18]
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, _0221D5D4 @ =0x0000B807
	bl FUN_0200D934
	movs r1, #0x3e
	lsls r2, r6, #4
	lsls r1, r1, #4
	subs r1, r1, r2
	lsls r1, r1, #5
	str r0, [sp, #0x1c]
	movs r0, #0
	str r1, [sp, #0x24]
	movs r1, #2
	str r0, [sp, #0x20]
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x34]
	movs r0, #1
	str r1, [sp, #0x30]
	str r0, [sp, #0x38]
	ldr r0, [r4]
	lsls r6, r6, #2
	ldr r0, [r0, #0x24]
	str r0, [sp, #0x3c]
	ldr r0, _0221D5D8 @ =0x00000B48
	adds r4, r4, r0
	add r0, sp, #0x10
	bl FUN_020135D8
	str r0, [r4, r6]
	ldr r0, [r4, r6]
	movs r1, #0
	bl FUN_02013850
	adds r0, r5, #0
	bl FUN_0201D520
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221D5D0: .4byte 0x00000B44
_0221D5D4: .4byte 0x0000B807
_0221D5D8: .4byte 0x00000B48
	thumb_func_end ov05_0221D530

	thumb_func_start ov05_0221D5DC
ov05_0221D5DC: @ 0x0221D5DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	movs r0, #8
	ldr r1, [r1, #0x24]
	bl FUN_02013534
	ldr r1, _0221D658 @ =0x00000B44
	str r0, [r4, r1]
	ldr r2, [r4]
	adds r0, r4, #0
	ldr r2, [r2, #0x14]
	movs r1, #0
	bl ov05_0221D530
	ldr r2, [r4]
	adds r0, r4, #0
	ldr r2, [r2, #0x18]
	movs r1, #2
	bl ov05_0221D530
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221D62A
	ldr r2, [r2, #0x1c]
	adds r0, r4, #0
	movs r1, #1
	bl ov05_0221D530
	ldr r2, [r4]
	adds r0, r4, #0
	ldr r2, [r2, #0x20]
	movs r1, #3
	bl ov05_0221D530
	pop {r4, pc}
_0221D62A:
	ldr r2, [r2, #0x14]
	adds r0, r4, #0
	movs r1, #1
	bl ov05_0221D530
	ldr r2, [r4]
	adds r0, r4, #0
	ldr r2, [r2, #0x18]
	movs r1, #3
	bl ov05_0221D530
	ldr r0, _0221D65C @ =0x00000B4C
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_020137C0
	ldr r0, _0221D660 @ =0x00000B54
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_020137C0
	pop {r4, pc}
	nop
_0221D658: .4byte 0x00000B44
_0221D65C: .4byte 0x00000B4C
_0221D660: .4byte 0x00000B54
	thumb_func_end ov05_0221D5DC

	thumb_func_start ov05_0221D664
ov05_0221D664: @ 0x0221D664
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	adds r4, r0, #0
	lsls r0, r5, #2
	adds r0, r4, r0
	ldr r3, _0221D68C @ =0x00000B48
	adds r4, r4, r5
	adds r5, r3, #0
	ldr r0, [r0, r3]
	adds r5, #0x24
	adds r3, #0x28
	ldrb r5, [r4, r5]
	ldrb r3, [r4, r3]
	adds r1, r1, r5
	adds r2, r2, r3
	bl FUN_020136B4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D68C: .4byte 0x00000B48
	thumb_func_end ov05_0221D664

	thumb_func_start ov05_0221D690
ov05_0221D690: @ 0x0221D690
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221D6BA
	ldr r6, _0221D6BC @ =0x00000B48
	movs r4, #0
	adds r5, r7, #0
_0221D6A4:
	ldr r0, [r5, r6]
	bl FUN_02013660
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _0221D6A4
	ldr r0, _0221D6C0 @ =0x00000B44
	ldr r0, [r7, r0]
	bl FUN_020135AC
_0221D6BA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221D6BC: .4byte 0x00000B48
_0221D6C0: .4byte 0x00000B44
	thumb_func_end ov05_0221D690

	thumb_func_start ov05_0221D6C4
ov05_0221D6C4: @ 0x0221D6C4
	push {r3, r4, r5, r6}
	ldr r3, [r0]
	adds r3, #0x29
	ldrb r3, [r3]
	cmp r3, #1
	ldr r3, _0221D7A8 @ =0x00000B64
	bne _0221D74E
	movs r4, #0x14
	adds r5, r1, #0
	strb r4, [r0, r3]
	adds r5, #0x92
	adds r4, r3, #4
	strb r5, [r0, r4]
	movs r5, #0x51
	adds r4, r3, #1
	strb r5, [r0, r4]
	adds r5, r1, #0
	adds r5, #0xa2
	adds r4, r3, #5
	strb r5, [r0, r4]
	movs r5, #0x80
	adds r4, r3, #2
	strb r5, [r0, r4]
	adds r5, r2, #0
	adds r5, #0x2c
	adds r4, r3, #6
	strb r5, [r0, r4]
	movs r5, #0xbd
	adds r4, r3, #3
	strb r5, [r0, r4]
	adds r5, r2, #0
	adds r5, #0x3c
	adds r4, r3, #7
	strb r5, [r0, r4]
	adds r4, r3, #0
	movs r5, #0xb
	adds r4, #8
	strb r5, [r0, r4]
	adds r5, r1, #0
	adds r4, r3, #0
	adds r5, #0x78
	adds r4, #0xc
	strb r5, [r0, r4]
	adds r4, r3, #0
	movs r5, #0x4c
	adds r4, #9
	strb r5, [r0, r4]
	adds r4, r3, #0
	adds r1, #0x88
	adds r4, #0xd
	strb r1, [r0, r4]
	adds r1, r3, #0
	movs r4, #0x77
	adds r1, #0xa
	strb r4, [r0, r1]
	adds r4, r2, #0
	adds r1, r3, #0
	adds r4, #0x12
	adds r1, #0xe
	strb r4, [r0, r1]
	adds r1, r3, #0
	movs r4, #0xb8
	adds r1, #0xb
	strb r4, [r0, r1]
	adds r2, #0x22
	adds r3, #0xf
	strb r2, [r0, r3]
	pop {r3, r4, r5, r6}
	bx lr
_0221D74E:
	movs r4, #0x18
	strb r4, [r0, r3]
	adds r4, r1, #0
	adds r4, #0xa0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r5, r3, #4
	strb r4, [r0, r5]
	movs r6, #0x51
	adds r5, r3, #1
	strb r6, [r0, r5]
	adds r5, r3, #5
	strb r4, [r0, r5]
	movs r5, #0x88
	adds r4, r3, #2
	strb r5, [r0, r4]
	adds r4, r2, #0
	adds r4, #0x30
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r5, r3, #6
	strb r4, [r0, r5]
	movs r6, #0xc1
	adds r5, r3, #3
	strb r6, [r0, r5]
	adds r5, r3, #7
	strb r4, [r0, r5]
	adds r4, r3, #0
	movs r5, #0xf
	adds r4, #8
	strb r5, [r0, r4]
	adds r4, r3, #0
	adds r1, #0x86
	adds r4, #0xc
	strb r1, [r0, r4]
	adds r1, r3, #0
	movs r4, #0x80
	adds r1, #0xa
	strb r4, [r0, r1]
	adds r2, #0x16
	adds r3, #0xe
	strb r2, [r0, r3]
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0221D7A8: .4byte 0x00000B64
	thumb_func_end ov05_0221D6C4

	thumb_func_start ov05_0221D7AC
ov05_0221D7AC: @ 0x0221D7AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, _0221D888 @ =0x0221EAD4
	add r3, sp, #0
	adds r6, r0, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	adds r0, r6, #0
	movs r2, #0x17
	bl ov05_0221CD24
	adds r0, r6, #0
	bl ov05_0221D318
	adds r0, r6, #0
	bl ov05_0221D890
	ldr r4, _0221D88C @ =0x0221EDA4
	movs r7, #0
	adds r5, r6, #0
_0221D7E0:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov05_0221CDC4
	movs r1, #0x66
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r7, r7, #1
	adds r4, #0x1c
	adds r5, r5, #4
	cmp r7, #0xe
	blo _0221D7E0
	movs r1, #0
	movs r2, #0xff
	adds r0, r6, #0
	mvns r2, r2
	adds r3, r1, #0
	bl ov05_0221D3AC
	movs r2, #0xff
	adds r0, r6, #0
	movs r1, #1
	mvns r2, r2
	movs r3, #0
	bl ov05_0221D3AC
	movs r1, #2
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfe
	movs r3, #0
	bl ov05_0221D3AC
	movs r1, #3
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfd
	movs r3, #0
	bl ov05_0221D3AC
	adds r0, r6, #0
	bl ov05_0221D4D0
	adds r0, r6, #0
	bl ov05_0221D904
	adds r0, r6, #0
	bl ov05_0221D5DC
	movs r1, #0
	movs r2, #0xff
	adds r0, r6, #0
	mvns r2, r2
	adds r3, r1, #0
	bl ov05_0221D664
	movs r2, #0xff
	adds r0, r6, #0
	movs r1, #1
	mvns r2, r2
	movs r3, #0
	bl ov05_0221D664
	movs r1, #2
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfe
	movs r3, #0
	bl ov05_0221D664
	movs r1, #3
	adds r2, r1, #0
	adds r0, r6, #0
	adds r2, #0xfd
	movs r3, #0
	bl ov05_0221D664
	movs r0, #0x21
	movs r1, #0xe
	lsls r0, r0, #4
	str r1, [r6, r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D888: .4byte 0x0221EAD4
_0221D88C: .4byte 0x0221EDA4
	thumb_func_end ov05_0221D7AC

	thumb_func_start ov05_0221D890
ov05_0221D890: @ 0x0221D890
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x68
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221D900 @ =0x0000B808
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #5
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221D900 @ =0x0000B808
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #6
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221D900 @ =0x0000B808
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #7
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0221D900: .4byte 0x0000B808
	thumb_func_end ov05_0221D890

	thumb_func_start ov05_0221D904
ov05_0221D904: @ 0x0221D904
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4]
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	bne _0221D946
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x80
	movs r2, #0x48
	bl FUN_0200DDB8
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0200DC4C
	pop {r4, pc}
_0221D946:
	bl ov05_0221CCF4
	cmp r0, #1
	ldr r0, [r4]
	bne _0221D994
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221D976
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x30
	movs r2, #0x48
	bl FUN_0200DDB8
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd0
	movs r2, #0x48
	bl FUN_0200DDB8
	b _0221D9D6
_0221D976:
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd0
	movs r2, #0x48
	bl FUN_0200DDB8
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x30
	movs r2, #0x48
	bl FUN_0200DDB8
	b _0221D9D6
_0221D994:
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221D9BA
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd0
	movs r2, #0x48
	bl FUN_0200DDB8
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x30
	movs r2, #0x48
	bl FUN_0200DDB8
	b _0221D9D6
_0221D9BA:
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x30
	movs r2, #0x48
	bl FUN_0200DDB8
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd0
	movs r2, #0x48
	bl FUN_0200DDB8
_0221D9D6:
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DC4C
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DC4C
	pop {r4, pc}
	thumb_func_end ov05_0221D904

	thumb_func_start ov05_0221D9F0
ov05_0221D9F0: @ 0x0221D9F0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	movs r2, #4
	ldr r0, [r0, #0x24]
	adds r3, r1, #0
	bl FUN_02026EB4
	ldr r1, _0221DAC8 @ =0x00000B58
	ldr r2, _0221DACC @ =0x04000060
	str r0, [r4, r1]
	ldrh r1, [r2]
	ldr r0, _0221DAD0 @ =0xFFFFCFFF
	ands r1, r0
	movs r0, #8
	orrs r0, r1
	strh r0, [r2]
	bl FUN_02014DA0
	ldr r0, [r4]
	movs r1, #0x12
	ldr r0, [r0, #0x24]
	lsls r1, r1, #0xa
	bl FUN_0201AA8C
	movs r2, #0xb6
	lsls r2, r2, #4
	str r0, [r4, r2]
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4]
	movs r3, #0x12
	ldr r0, [r0, #0x24]
	ldr r1, _0221DAD4 @ =ov05_0221DB70
	str r0, [sp, #4]
	ldr r0, _0221DAD8 @ =ov05_0221DB4C
	ldr r2, [r4, r2]
	lsls r3, r3, #0xa
	bl FUN_02014DB4
	ldr r1, _0221DADC @ =0x00000B5C
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_02015524
	adds r2, r0, #0
	movs r0, #1
	movs r1, #0xe1
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	ldr r2, [r4]
	movs r0, #0x3b
	ldr r2, [r2, #0x24]
	movs r1, #2
	bl FUN_02015264
	adds r1, r0, #0
	ldr r0, _0221DADC @ =0x00000B5C
	movs r2, #0xa
	ldr r0, [r4, r0]
	movs r3, #1
	bl FUN_0201526C
	movs r1, #0
	ldr r0, _0221DADC @ =0x00000B5C
	adds r2, r1, #0
	ldr r0, [r4, r0]
	adds r3, r1, #0
	bl FUN_02015494
	ldr r0, _0221DADC @ =0x00000B5C
	movs r2, #0
	ldr r0, [r4, r0]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02015494
	ldr r0, _0221DADC @ =0x00000B5C
	movs r2, #0
	ldr r0, [r4, r0]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_02015494
	ldr r0, _0221DADC @ =0x00000B5C
	movs r2, #0
	ldr r0, [r4, r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_02015494
	ldr r0, _0221DADC @ =0x00000B5C
	movs r2, #0
	ldr r0, [r4, r0]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_02015494
	add sp, #8
	pop {r4, pc}
	nop
_0221DAC8: .4byte 0x00000B58
_0221DACC: .4byte 0x04000060
_0221DAD0: .4byte 0xFFFFCFFF
_0221DAD4: .4byte ov05_0221DB70
_0221DAD8: .4byte ov05_0221DB4C
_0221DADC: .4byte 0x00000B5C
	thumb_func_end ov05_0221D9F0

	thumb_func_start ov05_0221DAE0
ov05_0221DAE0: @ 0x0221DAE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	beq _0221DAF2
	movs r0, #0
	pop {r4, pc}
_0221DAF2:
	bl FUN_02026E48
	ldr r0, _0221DB14 @ =0x00000B5C
	ldr r0, [r4, r0]
	bl FUN_020154B0
	cmp r0, #0
	bne _0221DB06
	movs r0, #0
	pop {r4, pc}
_0221DB06:
	bl FUN_0201543C
	bl FUN_02015460
	movs r0, #1
	pop {r4, pc}
	nop
_0221DB14: .4byte 0x00000B5C
	thumb_func_end ov05_0221DAE0

	thumb_func_start ov05_0221DB18
ov05_0221DB18: @ 0x0221DB18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221DB40
	ldr r0, _0221DB44 @ =0x00000B5C
	ldr r0, [r4, r0]
	bl FUN_02014EBC
	movs r0, #0xb6
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _0221DB48 @ =0x00000B58
	ldr r0, [r4, r0]
	bl FUN_02026F54
_0221DB40:
	pop {r4, pc}
	nop
_0221DB44: .4byte 0x00000B5C
_0221DB48: .4byte 0x00000B58
	thumb_func_end ov05_0221DB18

	thumb_func_start ov05_0221DB4C
ov05_0221DB4C: @ 0x0221DB4C
	push {r4, lr}
	ldr r3, _0221DB6C @ =0x02110924
	movs r2, #0
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bl FUN_02015354
	cmp r4, #0
	bne _0221DB64
	bl FUN_0202551C
_0221DB64:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_0221DB6C: .4byte 0x02110924
	thumb_func_end ov05_0221DB4C

	thumb_func_start ov05_0221DB70
ov05_0221DB70: @ 0x0221DB70
	push {r4, lr}
	ldr r3, _0221DB90 @ =0x0211092C
	movs r2, #1
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bl FUN_02015394
	cmp r4, #0
	bne _0221DB88
	bl FUN_0202551C
_0221DB88:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_0221DB90: .4byte 0x0211092C
	thumb_func_end ov05_0221DB70

	thumb_func_start ov05_0221DB94
ov05_0221DB94: @ 0x0221DB94
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _0221DC24 @ =0x0221EA88
	add r3, sp, #0x54
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0221DC28 @ =0x0221EB8C
	add r3, sp, #0x38
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0221DC2C @ =0x0221EB38
	add r3, sp, #0x1c
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0221DC30 @ =0x0221EBC4
	add r3, sp, #0
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	bl FUN_0201B1E4
	add sp, #0x64
	pop {r4, r5, pc}
	nop
_0221DC24: .4byte 0x0221EA88
_0221DC28: .4byte 0x0221EB8C
_0221DC2C: .4byte 0x0221EB38
_0221DC30: .4byte 0x0221EBC4
	thumb_func_end ov05_0221DB94

	thumb_func_start ov05_0221DC34
ov05_0221DC34: @ 0x0221DC34
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1e
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov05_0221DC34

	thumb_func_start ov05_0221DC60
ov05_0221DC60: @ 0x0221DC60
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x15
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	movs r3, #3
	ldr r1, [r1, #0x24]
	adds r4, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	movs r1, #0xf
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0x11
	ldr r0, [r0, #0x24]
	movs r3, #3
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	bl FUN_02007B68
	ldr r2, [r5]
	adds r0, r4, #0
	ldr r2, [r2, #0x24]
	movs r1, #0x10
	bl FUN_0200771C
	add r1, sp, #0x10
	adds r6, r0, #0
	blx FUN_020B7140
	ldr r2, [sp, #0x10]
	movs r0, #3
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #8]
	movs r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl FUN_0201C260
	ldr r1, [sp, #0x10]
	ldr r0, _0221DD00 @ =0x000004E4
	ldr r1, [r1, #0xc]
	adds r0, r5, r0
	adds r1, #0x60
	movs r2, #0x60
	blx FUN_020E5AD8
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldr r0, [r5]
	movs r2, #0xa9
	lsls r2, r2, #2
	ldr r3, _0221DD04 @ =0x00000424
	adds r1, r5, r2
	adds r2, #0xc0
	ldr r0, [r0, #0x24]
	adds r2, r5, r2
	adds r3, r5, r3
	bl FUN_0207CAAC
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0221DD00: .4byte 0x000004E4
_0221DD04: .4byte 0x00000424
	thumb_func_end ov05_0221DC60

	thumb_func_start ov05_0221DD08
ov05_0221DD08: @ 0x0221DD08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r6, _0221DDDC @ =0x0221EA60
	movs r4, #0
	adds r7, r5, #0
_0221DD14:
	cmp r4, #0
	beq _0221DD1C
	cmp r4, #3
	bne _0221DD24
_0221DD1C:
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r1, r5, r0
	b _0221DD3A
_0221DD24:
	movs r0, #0x86
	lsls r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #0
	bne _0221DD34
	ldr r0, _0221DDE0 @ =0x00000424
	adds r1, r5, r0
	b _0221DD3A
_0221DD34:
	movs r0, #0xd9
	lsls r0, r0, #2
	adds r1, r5, r0
_0221DD3A:
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0x10
	str r0, [sp, #0x14]
	movs r0, #6
	str r0, [sp, #0x18]
	ldrb r2, [r6]
	ldrb r3, [r6, #1]
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl FUN_0201C4EC
	movs r0, #0x86
	lsls r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #0
	beq _0221DDC6
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldrb r2, [r6]
	ldrb r3, [r6, #1]
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl FUN_0201CA4C
	cmp r4, #3
	bhs _0221DD92
	ldr r0, [r5]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0221DDA0
_0221DD92:
	cmp r4, #3
	blo _0221DDB4
	ldr r0, [r5]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221DDB4
_0221DDA0:
	ldr r1, _0221DDE4 @ =0x00000504
	adds r3, r4, #3
	lsls r3, r3, #0x15
	movs r0, #2
	adds r1, r5, r1
	movs r2, #0x20
	lsrs r3, r3, #0x10
	bl FUN_0201C260
	b _0221DDC6
_0221DDB4:
	ldr r1, _0221DDE8 @ =0x000004E4
	adds r3, r4, #3
	lsls r3, r3, #0x15
	movs r0, #2
	adds r1, r5, r1
	movs r2, #0x20
	lsrs r3, r3, #0x10
	bl FUN_0201C260
_0221DDC6:
	adds r4, r4, #1
	adds r7, #0x18
	adds r6, r6, #2
	cmp r4, #6
	blo _0221DD14
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221DDDC: .4byte 0x0221EA60
_0221DDE0: .4byte 0x00000424
_0221DDE4: .4byte 0x00000504
_0221DDE8: .4byte 0x000004E4
	thumb_func_end ov05_0221DD08

	thumb_func_start ov05_0221DDEC
ov05_0221DDEC: @ 0x0221DDEC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	str r1, [sp]
	adds r1, r2, #0
	bl FUN_0201CC08
	adds r6, r0, #0
	ldr r0, [r4]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221DE0A
	movs r7, #0x10
	b _0221DE0C
_0221DE0A:
	movs r7, #0
_0221DE0C:
	movs r5, #0
_0221DE0E:
	lsls r0, r5, #5
	adds r0, r7, r0
	lsls r4, r0, #1
	ldr r0, [sp]
	lsls r1, r5, #5
	adds r0, r0, r1
	adds r1, r6, r4
	movs r2, #0x20
	blx FUN_020E5AD8
	adds r0, r6, r4
	movs r1, #0
	movs r2, #0x20
	blx FUN_020E5B44
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x18
	blo _0221DE0E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221DDEC

	thumb_func_start ov05_0221DE38
ov05_0221DE38: @ 0x0221DE38
	push {r4, lr}
	ldr r1, _0221DE64 @ =0x00000544
	adds r4, r0, #0
	adds r1, r4, r1
	movs r2, #1
	bl ov05_0221DDEC
	ldr r1, _0221DE68 @ =0x00000844
	adds r0, r4, #0
	adds r1, r4, r1
	movs r2, #2
	bl ov05_0221DDEC
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_0201EFBC
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
_0221DE64: .4byte 0x00000544
_0221DE68: .4byte 0x00000844
	thumb_func_end ov05_0221DE38

	thumb_func_start ov05_0221DE6C
ov05_0221DE6C: @ 0x0221DE6C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221DECC
	movs r0, #0x20
	subs r6, r0, r4
	ldr r1, _0221DF30 @ =0x00000544
	str r4, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r1, r5, r1
	str r1, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	lsls r2, r6, #0x18
	str r3, [sp, #0x10]
	movs r1, #0x10
	str r1, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	movs r1, #1
	lsrs r2, r2, #0x18
	bl FUN_0201C4EC
	ldr r0, _0221DF34 @ =0x00000844
	lsls r2, r6, #0x18
	str r4, [sp]
	movs r1, #0x18
	str r1, [sp, #4]
	adds r0, r5, r0
	str r0, [sp, #8]
	movs r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r0, #0x10
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5, #0xc]
	movs r1, #2
	lsrs r2, r2, #0x18
	bl FUN_0201C4EC
	b _0221DF1A
_0221DECC:
	ldr r2, _0221DF30 @ =0x00000544
	movs r0, #0x10
	str r4, [sp]
	movs r1, #0x18
	subs r6, r0, r4
	str r1, [sp, #4]
	adds r2, r5, r2
	str r2, [sp, #8]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	movs r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5, #0xc]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201C4EC
	ldr r1, _0221DF34 @ =0x00000844
	movs r2, #0
	str r4, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r1, r5, r1
	str r1, [sp, #8]
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	movs r1, #0x10
	str r1, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201C4EC
_0221DF1A:
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_0201EFBC
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_0221DF30: .4byte 0x00000544
_0221DF34: .4byte 0x00000844
	thumb_func_end ov05_0221DE6C

	thumb_func_start ov05_0221DF38
ov05_0221DF38: @ 0x0221DF38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r1, #0
	str r1, [sp]
	adds r5, r2, #0
	bl FUN_02074640
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x18
	muls r0, r5, r0
	adds r0, r4, r0
	movs r6, #0
	str r0, [sp, #4]
_0221DF58:
	ldr r0, [sp, #8]
	cmp r0, r6
	bhi _0221DF7A
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_020741BC
	movs r1, #0x18
	adds r2, r6, #0
	muls r2, r1, r2
	ldr r1, [sp, #4]
	adds r2, r1, r2
	movs r1, #0x85
	lsls r1, r1, #2
	str r0, [r2, r1]
	b _0221E054
_0221DF7A:
	ldr r0, [sp]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #0x18
	adds r2, r6, #0
	muls r2, r1, r2
	ldr r1, [sp, #4]
	adds r4, r0, #0
	adds r7, r1, r2
	bl FUN_020741B0
	movs r1, #0x85
	lsls r1, r1, #2
	str r0, [r7, r1]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x86
	lsls r1, r1, #2
	strh r0, [r7, r1]
	adds r0, r1, #0
	ldrh r0, [r7, r0]
	cmp r0, #0
	beq _0221E054
	movs r0, #0x18
	adds r1, r6, #0
	muls r1, r0, r1
	ldr r0, [sp, #4]
	movs r2, #0
	adds r5, r0, r1
	adds r0, r4, #0
	movs r1, #0x4c
	bl FUN_0206E540
	ldr r1, _0221E064 @ =0x00000223
	movs r2, #0
	strb r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0xa3
	bl FUN_0206E540
	ldr r1, _0221E068 @ =0x0000021A
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0xa4
	bl FUN_0206E540
	movs r1, #0x87
	lsls r1, r1, #2
	strh r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x22
	lsls r1, r1, #4
	strb r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _0221E06C @ =0x0000021E
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0xa2
	bl FUN_0206E540
	movs r1, #0x89
	lsls r1, r1, #2
	strb r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _0221E070 @ =0x00000225
	movs r2, #0
	strb r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0xb0
	bl FUN_0206E540
	cmp r0, #1
	bne _0221E034
	movs r1, #0
	b _0221E036
_0221E034:
	movs r1, #1
_0221E036:
	ldr r0, _0221E074 @ =0x00000222
	strb r1, [r7, r0]
	adds r0, r4, #0
	bl FUN_0206FF88
	ldr r1, _0221E078 @ =0x00000221
	strb r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_0208AD64
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0x8a
	lsls r0, r0, #2
	str r1, [r5, r0]
_0221E054:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #3
	bhs _0221E060
	b _0221DF58
_0221E060:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E064: .4byte 0x00000223
_0221E068: .4byte 0x0000021A
_0221E06C: .4byte 0x0000021E
_0221E070: .4byte 0x00000225
_0221E074: .4byte 0x00000222
_0221E078: .4byte 0x00000221
	thumb_func_end ov05_0221DF38

	thumb_func_start ov05_0221E07C
ov05_0221E07C: @ 0x0221E07C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x85
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #0
	movs r2, #0x90
	blx FUN_020E5B44
	ldr r1, [r4]
	adds r0, r4, #0
	ldr r1, [r1, #4]
	movs r2, #0
	bl ov05_0221DF38
	ldr r1, [r4]
	adds r0, r4, #0
	ldr r1, [r1, #0xc]
	movs r2, #3
	bl ov05_0221DF38
	pop {r4, pc}
	thumb_func_end ov05_0221E07C

	thumb_func_start ov05_0221E0A8
ov05_0221E0A8: @ 0x0221E0A8
	push {r4, lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0x18
	muls r2, r0, r2
	ldr r1, _0221E10C @ =0x0000021A
	adds r4, r3, r2
	ldrh r0, [r4, r1]
	cmp r0, #0
	bne _0221E0C0
	movs r0, #0
	pop {r4, pc}
_0221E0C0:
	adds r1, #0xe
	ldr r1, [r4, r1]
	cmp r1, #7
	beq _0221E0D0
	cmp r1, #0
	beq _0221E0D0
	movs r0, #5
	pop {r4, pc}
_0221E0D0:
	movs r1, #0x87
	adds r2, r3, r2
	lsls r1, r1, #2
	ldrh r1, [r2, r1]
	movs r2, #0x30
	bl FUN_020880B0
	cmp r0, #4
	bhi _0221E108
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E0EE: @ jump table
	.2byte _0221E108 - _0221E0EE - 2 @ case 0
	.2byte _0221E104 - _0221E0EE - 2 @ case 1
	.2byte _0221E100 - _0221E0EE - 2 @ case 2
	.2byte _0221E0FC - _0221E0EE - 2 @ case 3
	.2byte _0221E0F8 - _0221E0EE - 2 @ case 4
_0221E0F8:
	movs r0, #1
	pop {r4, pc}
_0221E0FC:
	movs r0, #2
	pop {r4, pc}
_0221E100:
	movs r0, #3
	pop {r4, pc}
_0221E104:
	movs r0, #4
	pop {r4, pc}
_0221E108:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0221E10C: .4byte 0x0000021A
	thumb_func_end ov05_0221E0A8

	thumb_func_start ov05_0221E110
ov05_0221E110: @ 0x0221E110
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	str r1, [sp]
	adds r0, r1, #0
	lsls r1, r0, #2
	ldr r0, [sp]
	ldr r2, _0221E268 @ =0x0221EC5C
	adds r7, r0, r1
	lsls r0, r7, #2
	adds r4, r5, r0
	ldr r0, [sp]
	movs r1, #0xa
	muls r1, r0, r1
	str r4, [sp, #4]
	adds r6, r2, r1
_0221E134:
	movs r1, #0x1c
	adds r2, r7, #0
	muls r2, r1, r2
	ldr r1, _0221E26C @ =0x0221EF2C
	adds r0, r5, #0
	adds r1, r1, r2
	bl ov05_0221CDC4
	movs r1, #0x66
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldrb r1, [r6]
	ldrb r2, [r6, #1]
	ldr r0, [r4, r0]
	bl FUN_0200DDB8
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r0, r0, #1
	adds r4, r4, #4
	adds r6, r6, #2
	str r0, [sp, #8]
	cmp r0, #5
	blo _0221E134
	ldr r0, [sp]
	movs r2, #0x86
	movs r1, #0x18
	adds r6, r0, #0
	muls r6, r1, r6
	adds r3, r5, r6
	lsls r2, r2, #2
	ldrh r0, [r3, r2]
	cmp r0, #0
	bne _0221E19C
	movs r5, #0
	adds r4, r2, #0
	adds r6, r5, #0
	subs r4, #0x80
_0221E182:
	ldr r0, [sp, #4]
	adds r1, r6, #0
	ldr r0, [r0, r4]
	bl FUN_0200DCE8
	ldr r0, [sp, #4]
	adds r5, r5, #1
	adds r0, r0, #4
	str r0, [sp, #4]
	cmp r5, #5
	blo _0221E182
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221E19C:
	ldr r1, [sp]
	movs r4, #0x14
	muls r4, r1, r4
	adds r1, r2, #0
	subs r1, #0x80
	adds r7, r5, r1
	adds r1, r2, #0
	adds r1, #0xd
	adds r2, #0xb
	ldrb r1, [r3, r1]
	ldrb r2, [r3, r2]
	bl FUN_02074364
	adds r1, r0, #0
	ldr r0, [r7, r4]
	bl FUN_0200DD10
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov05_0221E0A8
	adds r1, r0, #0
	ldr r0, [r7, r4]
	bl FUN_0200DC4C
	ldr r1, _0221E270 @ =0x0000021E
	adds r0, r5, r6
	ldrh r0, [r0, r1]
	cmp r0, #0
	bne _0221E1E6
	adds r0, r5, r4
	subs r1, #0x82
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0200DCE8
	b _0221E20C
_0221E1E6:
	bl FUN_02078068
	cmp r0, #1
	bne _0221E1FE
	movs r0, #0x67
	adds r1, r5, r4
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200DC4C
	b _0221E20C
_0221E1FE:
	movs r0, #0x67
	adds r1, r5, r4
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DC4C
_0221E20C:
	movs r0, #0x89
	adds r1, r5, r6
	lsls r0, r0, #2
	ldrb r1, [r1, r0]
	cmp r1, #0
	bne _0221E226
	adds r1, r5, r4
	subs r0, #0x84
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DCE8
	b _0221E232
_0221E226:
	adds r1, r5, r4
	subs r0, #0x84
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_0200DC4C
_0221E232:
	movs r3, #0x8a
	adds r0, r5, r6
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	cmp r0, #7
	bne _0221E24E
	adds r0, r5, r4
	subs r3, #0x84
	ldr r0, [r0, r3]
	movs r1, #0
	bl FUN_0200DCE8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221E24E:
	adds r0, r3, #0
	adds r1, r5, r4
	subs r0, #0x84
	ldr r0, [r1, r0]
	ldr r1, [sp, #8]
	movs r2, #0x18
	muls r2, r1, r2
	adds r1, r5, r2
	ldr r1, [r1, r3]
	bl FUN_0200DC4C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E268: .4byte 0x0221EC5C
_0221E26C: .4byte 0x0221EF2C
_0221E270: .4byte 0x0000021E
	thumb_func_end ov05_0221E110

	thumb_func_start ov05_0221E274
ov05_0221E274: @ 0x0221E274
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r5, _0221E2D4 @ =0x0221EAEC
	add r3, sp, #0
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r1, r2, #0
	adds r0, r4, #0
	movs r2, #0x1f
	bl ov05_0221CD24
	adds r0, r4, #0
	bl ov05_0221E2D8
	adds r0, r4, #0
	bl ov05_0221E390
	adds r0, r4, #0
	bl ov05_0221E42C
	adds r0, r4, #0
	bl ov05_0221E4C8
	movs r5, #0
_0221E2B0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov05_0221E110
	adds r5, r5, #1
	cmp r5, #6
	blo _0221E2B0
	adds r0, r4, #0
	movs r1, #0x10
	bl ov05_0221E564
	movs r0, #0x21
	movs r1, #0x1e
	lsls r0, r0, #4
	str r1, [r4, r0]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0221E2D4: .4byte 0x0221EAEC
	thumb_func_end ov05_0221E274

	thumb_func_start ov05_0221E2D8
ov05_0221E2D8: @ 0x0221E2D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x14
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	adds r7, r0, #0
	bl FUN_02074490
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _0221E388 @ =0x0000B808
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r7, #0
	bl FUN_0200D5D4
	bl FUN_02074498
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E38C @ =0x0000B809
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r7, #0
	bl FUN_0200D6EC
	bl FUN_020744A4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E38C @ =0x0000B809
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r7, #0
	bl FUN_0200D71C
	movs r4, #0
	adds r6, r5, #0
_0221E350:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E38C @ =0x0000B809
	movs r1, #0x65
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r0, #0x19
	movs r3, #0x85
	lsls r0, r0, #4
	lsls r1, r1, #2
	lsls r3, r3, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r6, r3]
	adds r2, r7, #0
	bl FUN_0200D504
	adds r4, r4, #1
	adds r6, #0x18
	cmp r4, #6
	blo _0221E350
	adds r0, r7, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E388: .4byte 0x0000B808
_0221E38C: .4byte 0x0000B809
	thumb_func_end ov05_0221E2D8

	thumb_func_start ov05_0221E390
ov05_0221E390: @ 0x0221E390
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x15
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E420 @ =0x0000B80F
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x14
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221E424 @ =0x0000B809
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x15
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E428 @ =0x0000B80A
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x13
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E428 @ =0x0000B80A
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x12
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221E420: .4byte 0x0000B80F
_0221E424: .4byte 0x0000B809
_0221E428: .4byte 0x0000B80A
	thumb_func_end ov05_0221E390

	thumb_func_start ov05_0221E42C
ov05_0221E42C: @ 0x0221E42C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x27
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E4BC @ =0x0000B810
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x40
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221E4C0 @ =0x0000B80A
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x41
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E4C4 @ =0x0000B80B
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x3f
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E4C4 @ =0x0000B80B
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x3e
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221E4BC: .4byte 0x0000B810
_0221E4C0: .4byte 0x0000B80A
_0221E4C4: .4byte 0x0000B80B
	thumb_func_end ov05_0221E42C

	thumb_func_start ov05_0221E4C8
ov05_0221E4C8: @ 0x0221E4C8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x15
	ldr r1, [r1, #0x24]
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E558 @ =0x0000B811
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #2
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _0221E55C @ =0x0000B80B
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #8
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E560 @ =0x0000B80C
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #1
	bl FUN_0200D6EC
	movs r3, #0
	movs r1, #0x19
	ldr r0, _0221E560 @ =0x0000B80C
	str r3, [sp]
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221E558: .4byte 0x0000B811
_0221E55C: .4byte 0x0000B80B
_0221E560: .4byte 0x0000B80C
	thumb_func_end ov05_0221E4C8

	thumb_func_start ov05_0221E564
ov05_0221E564: @ 0x0221E564
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0]
	adds r7, r1, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221E57E
	movs r0, #3
	str r0, [sp, #8]
	lsls r0, r7, #0x13
	b _0221E588
_0221E57E:
	movs r0, #0
	str r0, [sp, #8]
	lsls r0, r7, #3
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
_0221E588:
	asrs r7, r0, #0x10
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	movs r1, #0xa
	ldr r2, _0221E5E0 @ =0x0221EC5C
	muls r1, r0, r1
	adds r0, r2, r1
	str r0, [sp, #4]
_0221E59A:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r4, [sp, #4]
	adds r1, r1, r0
	lsls r0, r1, #2
	adds r0, r1, r0
	lsls r1, r0, #2
	ldr r0, [sp]
	movs r6, #0
	adds r5, r0, r1
_0221E5AE:
	ldrb r1, [r4]
	movs r0, #0x66
	lsls r0, r0, #2
	adds r1, r7, r1
	lsls r1, r1, #0x10
	ldrb r2, [r4, #1]
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	adds r6, r6, #1
	adds r4, r4, #2
	adds r5, r5, #4
	cmp r6, #5
	blt _0221E5AE
	ldr r0, [sp, #4]
	adds r0, #0xa
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _0221E59A
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E5E0: .4byte 0x0221EC5C
	thumb_func_end ov05_0221E564

	thumb_func_start ov05_0221E5E4
ov05_0221E5E4: @ 0x0221E5E4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _0221E608 @ =0x0221ECE4
	movs r6, #0
	adds r5, #0x10
_0221E5F0:
	ldr r0, [r7, #0xc]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #0x18
	blo _0221E5F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E608: .4byte 0x0221ECE4
	thumb_func_end ov05_0221E5E4

	thumb_func_start ov05_0221E60C
ov05_0221E60C: @ 0x0221E60C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x10
_0221E614:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x18
	blo _0221E614
	pop {r3, r4, r5, pc}
	thumb_func_end ov05_0221E60C

	thumb_func_start ov05_0221E624
ov05_0221E624: @ 0x0221E624
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r4, [sp, #0x3c]
	adds r5, r0, #0
	adds r7, r5, #0
	lsls r0, r4, #6
	adds r7, #0x10
	str r0, [sp, #0x1c]
	str r1, [sp, #0x10]
	str r3, [sp, #0x14]
	ldr r6, [sp, #0x38]
	cmp r4, #3
	ldr r0, [r5]
	bhs _0221E64C
	ldr r0, [r0, #4]
	adds r1, r4, #0
	bl FUN_02074644
	str r0, [sp, #0x18]
	b _0221E656
_0221E64C:
	ldr r0, [r0, #0xc]
	subs r1, r4, #3
	bl FUN_02074644
	str r0, [sp, #0x18]
_0221E656:
	adds r1, r4, #0
	ldr r0, [sp, #0x10]
	adds r1, #8
	bl FUN_0200BBA0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [sp, #0x14]
	movs r1, #0
	bl FUN_0200BF8C
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x20]
	adds r1, r6, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E708 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	adds r3, r1, #0
	adds r0, r7, r0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	movs r0, #0x18
	muls r0, r4, r0
	adds r2, r5, r0
	ldr r0, _0221E70C @ =0x00000222
	ldrb r1, [r2, r0]
	cmp r1, #0
	bne _0221E704
	subs r0, r0, #1
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _0221E6DC
	ldr r0, [sp, #0x10]
	movs r1, #0x1b
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	adds r2, r6, #0
	adds r0, r7, r0
	movs r3, #0x40
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0221E6DC:
	cmp r0, #1
	bne _0221E704
	ldr r0, [sp, #0x10]
	movs r1, #0x1c
	adds r2, r6, #0
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E710 @ =0x00050600
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	movs r3, #0x40
	adds r0, r7, r0
	str r1, [sp, #0xc]
	bl FUN_020200FC
_0221E704:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E708: .4byte 0x000F0E00
_0221E70C: .4byte 0x00000222
_0221E710: .4byte 0x00050600
	thumb_func_end ov05_0221E624

	thumb_func_start ov05_0221E714
ov05_0221E714: @ 0x0221E714
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, [sp, #0x24]
	adds r4, r0, #0
	lsls r5, r3, #2
	adds r5, r5, #1
	movs r1, #0
	adds r0, #0x10
	lsls r5, r5, #4
	str r1, [sp]
	adds r0, r0, r5
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r2, #0x18
	muls r2, r3, r2
	adds r3, r4, r2
	movs r2, #0x22
	lsls r2, r2, #4
	ldrb r2, [r3, r2]
	movs r1, #1
	movs r3, #3
	bl FUN_0200CE7C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov05_0221E714

	thumb_func_start ov05_0221E74C
ov05_0221E74C: @ 0x0221E74C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, [sp, #0x24]
	adds r5, r0, #0
	lsls r0, r1, #2
	adds r7, r2, #0
	adds r2, r5, #0
	adds r0, r0, #2
	adds r6, r1, #0
	adds r2, #0x10
	lsls r0, r0, #4
	adds r4, r2, r0
	movs r0, #0x18
	muls r6, r0, r6
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r1, _0221E7B4 @ =0x0000021A
	adds r2, r5, r6
	ldrh r1, [r2, r1]
	adds r0, r7, #0
	movs r2, #3
	movs r3, #1
	bl FUN_0200CDF0
	movs r0, #2
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #0x18
	bl FUN_0200CDAC
	movs r1, #0x87
	str r4, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r2, r5, r6
	lsls r1, r1, #2
	ldrh r1, [r2, r1]
	adds r0, r7, #0
	movs r2, #3
	movs r3, #0
	bl FUN_0200CDF0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221E7B4: .4byte 0x0000021A
	thumb_func_end ov05_0221E74C

	thumb_func_start ov05_0221E7B8
ov05_0221E7B8: @ 0x0221E7B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r0, r1, #2
	adds r2, r5, #0
	adds r0, r0, #3
	adds r2, #0x10
	lsls r0, r0, #4
	adds r4, r2, r0
	movs r0, #0x18
	adds r6, r1, #0
	muls r6, r0, r6
	movs r0, #0x87
	lsls r0, r0, #2
	adds r7, r5, r0
	subs r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #8]
	ldrh r0, [r0, r6]
	ldrh r1, [r7, r6]
	movs r2, #0x30
	bl FUN_020880B0
	cmp r0, #4
	bhi _0221E846
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E7F6: @ jump table
	.2byte _0221E846 - _0221E7F6 - 2 @ case 0
	.2byte _0221E830 - _0221E7F6 - 2 @ case 1
	.2byte _0221E818 - _0221E7F6 - 2 @ case 2
	.2byte _0221E800 - _0221E7F6 - 2 @ case 3
	.2byte _0221E800 - _0221E7F6 - 2 @ case 4
_0221E800:
	ldrb r3, [r4, #9]
	ldr r1, _0221E89C @ =0x000004F6
	movs r0, #1
	lsls r3, r3, #4
	adds r3, #9
	lsls r3, r3, #0x11
	adds r1, r5, r1
	movs r2, #4
	lsrs r3, r3, #0x10
	bl FUN_0201C260
	b _0221E846
_0221E818:
	ldrb r3, [r4, #9]
	ldr r1, _0221E8A0 @ =0x00000516
	movs r0, #1
	lsls r3, r3, #4
	adds r3, #9
	lsls r3, r3, #0x11
	adds r1, r5, r1
	movs r2, #4
	lsrs r3, r3, #0x10
	bl FUN_0201C260
	b _0221E846
_0221E830:
	ldrb r3, [r4, #9]
	ldr r1, _0221E8A4 @ =0x00000536
	movs r0, #1
	lsls r3, r3, #4
	adds r3, #9
	lsls r3, r3, #0x11
	adds r1, r5, r1
	movs r2, #4
	lsrs r3, r3, #0x10
	bl FUN_0201C260
_0221E846:
	ldr r0, [sp, #8]
	ldrh r1, [r7, r6]
	ldrh r0, [r0, r6]
	movs r2, #0x30
	bl FUN_02088068
	adds r5, r0, #0
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	movs r3, #2
	bl FUN_0201DA74
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0
	movs r3, #3
	bl FUN_0201DA74
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	movs r3, #5
	bl FUN_0201DA74
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221E89C: .4byte 0x000004F6
_0221E8A0: .4byte 0x00000516
_0221E8A4: .4byte 0x00000536
	thumb_func_end ov05_0221E7B8

	thumb_func_start ov05_0221E8A8
ov05_0221E8A8: @ 0x0221E8A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r6, [sp, #0x2c]
	adds r5, r7, #0
	str r1, [sp, #8]
	adds r5, #0x10
	lsls r4, r6, #6
	adds r0, r5, r4
	movs r1, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl FUN_0201D978
	adds r0, r5, r4
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, r4
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, r4
	adds r0, #0x30
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, r7, #0
	str r6, [sp, #4]
	bl ov05_0221E624
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, r7, #0
	str r6, [sp, #4]
	bl ov05_0221E714
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, r7, #0
	str r6, [sp, #4]
	bl ov05_0221E74C
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov05_0221E7B8
	adds r0, r5, r4
	bl FUN_0201D5C8
	adds r0, r5, r4
	adds r0, #0x10
	bl FUN_0201D5C8
	adds r0, r5, r4
	adds r0, #0x20
	bl FUN_0201D5C8
	adds r0, r5, r4
	adds r0, #0x30
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov05_0221E8A8

	thumb_func_start ov05_0221E944
ov05_0221E944: @ 0x0221E944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r3, [r6]
	movs r2, #0x4b
	ldr r3, [r3, #0x24]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #2
	bl FUN_0200BAF8
	ldr r3, [r6]
	str r0, [sp, #0x10]
	ldr r3, [r3, #0x24]
	movs r0, #0xf
	movs r1, #0xe
	movs r2, #0
	bl FUN_0200CC74
	str r0, [sp, #0xc]
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl FUN_0200BD08
	ldr r1, [r6]
	str r0, [sp, #8]
	ldr r1, [r1, #0x24]
	movs r0, #0x20
	bl FUN_02026354
	adds r7, r0, #0
	movs r4, #0
	adds r5, r6, #0
_0221E986:
	movs r0, #0x86
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0221E9A0
	ldr r1, [sp, #0x10]
	str r7, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	adds r0, r6, #0
	str r4, [sp, #4]
	bl ov05_0221E8A8
_0221E9A0:
	adds r4, r4, #1
	adds r5, #0x18
	cmp r4, #6
	blo _0221E986
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, [sp, #0x10]
	bl FUN_0200BB44
	ldr r0, [sp, #0xc]
	bl FUN_0200CD94
	ldr r0, [sp, #8]
	bl FUN_0200BDA0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221E944

	thumb_func_start ov05_0221E9C4
ov05_0221E9C4: @ 0x0221E9C4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _0221E9F4 @ =0x00000B88
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _0221E9F4 @ =0x00000B88
	movs r1, #0
	adds r0, r4, r0
	movs r2, #1
	movs r3, #0xf
	bl FUN_0200E998
	add sp, #8
	pop {r4, pc}
	nop
_0221E9F4: .4byte 0x00000B88
	thumb_func_end ov05_0221E9C4

	thumb_func_start ov05_0221E9F8
ov05_0221E9F8: @ 0x0221E9F8
	push {r3, lr}
	ldr r0, [r0]
	ldr r1, [r0]
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0221EA10
	bl FUN_0202FC48
	cmp r0, #0
	bne _0221EA14
_0221EA10:
	movs r0, #0
	pop {r3, pc}
_0221EA14:
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov05_0221E9F8

	thumb_func_start ov05_0221EA18
ov05_0221EA18: @ 0x0221EA18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221EA34 @ =0x00000BC4
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0221EA32
	subs r0, #0x3c
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200F0AC
	ldr r1, _0221EA34 @ =0x00000BC4
	str r0, [r4, r1]
_0221EA32:
	pop {r4, pc}
	.align 2, 0
_0221EA34: .4byte 0x00000BC4
	thumb_func_end ov05_0221EA18

	thumb_func_start ov05_0221EA38
ov05_0221EA38: @ 0x0221EA38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221EA50 @ =0x00000BC4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221EA4E
	bl FUN_0200F450
	ldr r0, _0221EA50 @ =0x00000BC4
	movs r1, #0
	str r1, [r4, r0]
_0221EA4E:
	pop {r4, pc}
	.align 2, 0
_0221EA50: .4byte 0x00000BC4
	thumb_func_end ov05_0221EA38

	.rodata

_0221EA54:
	.byte 0x00, 0x03, 0x06, 0x09, 0x00, 0x19, 0x0D, 0x06, 0x04, 0x0D, 0x94, 0x00
	.byte 0x00, 0x00, 0x00, 0x06, 0x00, 0x0C, 0x10, 0x01, 0x10, 0x07, 0x10, 0x0D, 0x06, 0x06, 0x00, 0x06
	.byte 0x00, 0x06, 0x04, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0xBE, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02
	.byte 0x51, 0xC0, 0x21, 0x02, 0x1D, 0xC2, 0x21, 0x02, 0x31, 0xC4, 0x21, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x05, 0xBE, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02, 0x05, 0xCC, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02
	.byte 0x59, 0xCC, 0x21, 0x02, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1E, 0x04
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1C, 0x04, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x09, 0xBF, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02
	.byte 0x51, 0xC0, 0x21, 0x02, 0x1D, 0xC2, 0x21, 0x02, 0xFD, 0xC7, 0x21, 0x02, 0x0D, 0xC8, 0x21, 0x02
	.byte 0x19, 0xC0, 0x21, 0x02, 0xE1, 0xC8, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02, 0x09, 0xC9, 0x21, 0x02
	.byte 0x19, 0xC0, 0x21, 0x02, 0xB9, 0xCA, 0x21, 0x02, 0x59, 0xCC, 0x21, 0x02, 0x1E, 0x10, 0x26, 0x18
	.byte 0x2E, 0x18, 0x24, 0x2C, 0x10, 0x0E, 0x1E, 0x40, 0x26, 0x48, 0x2E, 0x48, 0x24, 0x5C, 0x10, 0x3E
	.byte 0x1E, 0x70, 0x26, 0x78, 0x2E, 0x78, 0x24, 0x8C, 0x10, 0x6E, 0x9E, 0x18, 0xA6, 0x20, 0xAE, 0x20
	.byte 0xA4, 0x34, 0x90, 0x16, 0x9E, 0x48, 0xA6, 0x50, 0xAE, 0x50, 0xA4, 0x64, 0x90, 0x46, 0x9E, 0x78
	.byte 0xA6, 0x80, 0xAE, 0x80, 0xA4, 0x94, 0x90, 0x76, 0x09, 0xBF, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02
	.byte 0x51, 0xC0, 0x21, 0x02, 0x1D, 0xC2, 0x21, 0x02, 0x59, 0xC5, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02
	.byte 0x69, 0xC5, 0x21, 0x02, 0xA9, 0xC5, 0x21, 0x02, 0xFD, 0xC7, 0x21, 0x02, 0x0D, 0xC8, 0x21, 0x02
	.byte 0x19, 0xC0, 0x21, 0x02, 0xA1, 0xC8, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02, 0x71, 0xCB, 0x21, 0x02
	.byte 0x19, 0xC0, 0x21, 0x02, 0x09, 0xC9, 0x21, 0x02, 0x19, 0xC0, 0x21, 0x02, 0xB9, 0xCA, 0x21, 0x02
	.byte 0x59, 0xCC, 0x21, 0x02, 0x01, 0x06, 0x01, 0x09, 0x02, 0x00, 0x01, 0x00, 0x01, 0x01, 0x04, 0x05
	.byte 0x02, 0x00, 0x13, 0x00, 0x01, 0x07, 0x04, 0x08, 0x02, 0x00, 0x1D, 0x00, 0x01, 0x08, 0x03, 0x06
	.byte 0x01, 0x03, 0x2D, 0x00, 0x01, 0x06, 0x07, 0x09, 0x02, 0x00, 0x33, 0x00, 0x01, 0x01, 0x0A, 0x05
	.byte 0x02, 0x00, 0x45, 0x00, 0x01, 0x07, 0x0A, 0x08, 0x02, 0x00, 0x4F, 0x00, 0x01, 0x08, 0x09, 0x06
	.byte 0x01, 0x04, 0x5F, 0x00, 0x01, 0x06, 0x0D, 0x09, 0x02, 0x00, 0x65, 0x00, 0x01, 0x01, 0x10, 0x05
	.byte 0x02, 0x00, 0x77, 0x00, 0x01, 0x07, 0x10, 0x08, 0x02, 0x00, 0x81, 0x00, 0x01, 0x08, 0x0F, 0x06
	.byte 0x01, 0x05, 0x91, 0x00, 0x01, 0x16, 0x02, 0x09, 0x02, 0x00, 0x97, 0x00, 0x01, 0x11, 0x05, 0x05
	.byte 0x02, 0x00, 0xA9, 0x00, 0x01, 0x17, 0x05, 0x08, 0x02, 0x00, 0xB3, 0x00, 0x01, 0x18, 0x04, 0x06
	.byte 0x01, 0x06, 0xC3, 0x00, 0x01, 0x16, 0x08, 0x09, 0x02, 0x00, 0xC9, 0x00, 0x01, 0x11, 0x0B, 0x05
	.byte 0x02, 0x00, 0xDB, 0x00, 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00, 0xE5, 0x00, 0x01, 0x18, 0x0A, 0x06
	.byte 0x01, 0x07, 0xF5, 0x00, 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00, 0xFB, 0x00, 0x01, 0x11, 0x11, 0x05
	.byte 0x02, 0x00, 0x0D, 0x01, 0x01, 0x17, 0x11, 0x08, 0x02, 0x00, 0x17, 0x01, 0x01, 0x18, 0x10, 0x06
	.byte 0x01, 0x08, 0x27, 0x01, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0xB8, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	@ 0x0221F280
