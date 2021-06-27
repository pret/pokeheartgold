
	thumb_func_start ov08_0221BE20
ov08_0221BE20: @ 0x0221BE20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x11]
	cmp r0, #5
	bls _0221BE2E
	movs r0, #0
	strb r0, [r5, #0x11]
_0221BE2E:
	ldr r0, _0221BE88 @ =ov08_0221BE98
	ldr r1, _0221BE8C @ =0x00002090
	ldr r3, [r5, #0xc]
	movs r2, #0
	bl FUN_02007200
	bl FUN_0201F988
	ldr r2, _0221BE8C @ =0x00002090
	adds r4, r0, #0
	movs r1, #0
	blx FUN_020E5B44
	str r5, [r4]
	ldr r0, [r5, #8]
	bl FUN_0223A7D4
	movs r1, #0x79
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #8]
	bl FUN_0223A938
	movs r1, #0x7a
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0221BE90 @ =0x00002078
	movs r1, #0
	strb r1, [r4, r0]
	ldrb r2, [r5, #0x11]
	subs r1, r0, #2
	strb r2, [r4, r1]
	subs r1, r0, #1
	ldrb r2, [r4, r1]
	movs r1, #0xf0
	subs r0, r0, #1
	bics r2, r1
	strb r2, [r4, r0]
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x28]
	bl FUN_0223AB0C
	ldr r1, _0221BE94 @ =0x0000208F
	strb r0, [r4, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221BE88: .4byte ov08_0221BE98
_0221BE8C: .4byte 0x00002090
_0221BE90: .4byte 0x00002078
_0221BE94: .4byte 0x0000208F
	thumb_func_end ov08_0221BE20

	thumb_func_start ov08_0221BE98
ov08_0221BE98: @ 0x0221BE98
	push {r4, lr}
	ldr r2, _0221C040 @ =0x00002078
	adds r4, r1, #0
	ldrb r2, [r4, r2]
	cmp r2, #0x1a
	bls _0221BEA6
	b _0221C028
_0221BEA6:
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0221BEB2: @ jump table
	.2byte _0221BEE8 - _0221BEB2 - 2 @ case 0
	.2byte _0221BEF4 - _0221BEB2 - 2 @ case 1
	.2byte _0221BF00 - _0221BEB2 - 2 @ case 2
	.2byte _0221BF0C - _0221BEB2 - 2 @ case 3
	.2byte _0221BF18 - _0221BEB2 - 2 @ case 4
	.2byte _0221BF24 - _0221BEB2 - 2 @ case 5
	.2byte _0221BF30 - _0221BEB2 - 2 @ case 6
	.2byte _0221BF3C - _0221BEB2 - 2 @ case 7
	.2byte _0221BF48 - _0221BEB2 - 2 @ case 8
	.2byte _0221BF54 - _0221BEB2 - 2 @ case 9
	.2byte _0221BF60 - _0221BEB2 - 2 @ case 10
	.2byte _0221BF6C - _0221BEB2 - 2 @ case 11
	.2byte _0221BF78 - _0221BEB2 - 2 @ case 12
	.2byte _0221BF84 - _0221BEB2 - 2 @ case 13
	.2byte _0221BF90 - _0221BEB2 - 2 @ case 14
	.2byte _0221BF9C - _0221BEB2 - 2 @ case 15
	.2byte _0221BFA8 - _0221BEB2 - 2 @ case 16
	.2byte _0221BFB4 - _0221BEB2 - 2 @ case 17
	.2byte _0221BFC0 - _0221BEB2 - 2 @ case 18
	.2byte _0221BFCC - _0221BEB2 - 2 @ case 19
	.2byte _0221BFD8 - _0221BEB2 - 2 @ case 20
	.2byte _0221BFE4 - _0221BEB2 - 2 @ case 21
	.2byte _0221BFF0 - _0221BEB2 - 2 @ case 22
	.2byte _0221BFFC - _0221BEB2 - 2 @ case 23
	.2byte _0221C008 - _0221BEB2 - 2 @ case 24
	.2byte _0221C014 - _0221BEB2 - 2 @ case 25
	.2byte _0221C020 - _0221BEB2 - 2 @ case 26
_0221BEE8:
	adds r0, r4, #0
	bl ov08_0221C048
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BEF4:
	adds r0, r4, #0
	bl ov08_0221C14C
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF00:
	adds r0, r4, #0
	bl ov08_0221C318
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF0C:
	adds r0, r4, #0
	bl ov08_0221C3C8
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF18:
	adds r0, r4, #0
	bl ov08_0221C488
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF24:
	adds r0, r4, #0
	bl ov08_0221C58C
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF30:
	adds r0, r4, #0
	bl ov08_0221C918
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF3C:
	adds r0, r4, #0
	bl ov08_0221C924
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF48:
	adds r0, r4, #0
	bl ov08_0221C930
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF54:
	adds r0, r4, #0
	bl ov08_0221C93C
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF60:
	adds r0, r4, #0
	bl ov08_0221C948
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF6C:
	adds r0, r4, #0
	bl ov08_0221C954
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF78:
	adds r0, r4, #0
	bl ov08_0221C978
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF84:
	adds r0, r4, #0
	bl ov08_0221C9A4
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF90:
	adds r0, r4, #0
	bl ov08_0221C9C8
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BF9C:
	adds r0, r4, #0
	bl ov08_0221CA08
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFA8:
	adds r0, r4, #0
	bl ov08_0221CA20
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFB4:
	adds r0, r4, #0
	bl ov08_0221CA34
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFC0:
	adds r0, r4, #0
	bl ov08_0221CA50
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFCC:
	adds r0, r4, #0
	bl ov08_0221C604
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFD8:
	adds r0, r4, #0
	bl ov08_0221C6F8
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFE4:
	adds r0, r4, #0
	bl ov08_0221C814
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFF0:
	adds r0, r4, #0
	bl ov08_0221CA78
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221BFFC:
	adds r0, r4, #0
	bl ov08_0221CA90
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221C008:
	adds r0, r4, #0
	bl ov08_0221CC38
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221C014:
	adds r0, r4, #0
	bl ov08_0221CD64
	ldr r1, _0221C040 @ =0x00002078
	strb r0, [r4, r1]
	b _0221C028
_0221C020:
	bl ov08_0221CD90
	cmp r0, #1
	beq _0221C03C
_0221C028:
	adds r0, r4, #0
	bl ov08_0222145C
	ldr r0, _0221C044 @ =0x00001FB4
	ldr r0, [r4, r0]
	bl FUN_0200D020
	adds r0, r4, #0
	bl ov08_022220FC
_0221C03C:
	pop {r4, pc}
	nop
_0221C040: .4byte 0x00002078
_0221C044: .4byte 0x00001FB4
	thumb_func_end ov08_0221BE98

	thumb_func_start ov08_0221C048
ov08_0221C048: @ 0x0221C048
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0221C13C @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5]
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #3
	ldr r0, _0221C140 @ =0x0000207A
	bne _0221C068
	movs r1, #6
	strb r1, [r5, r0]
	movs r4, #0x13
	b _0221C06C
_0221C068:
	strb r1, [r5, r0]
	movs r4, #1
_0221C06C:
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl ov08_02224B64
	ldr r1, _0221C144 @ =0x00002088
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov08_0221D184
	adds r0, r5, #0
	bl ov08_0221CDF8
	adds r0, r5, #0
	bl ov08_0221CF38
	adds r0, r5, #0
	bl ov08_0221D0F4
	ldr r1, [r5]
	movs r0, #4
	ldr r1, [r1, #0xc]
	bl FUN_02002CEC
	ldr r1, _0221C140 @ =0x0000207A
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0221D8B0
	ldr r1, _0221C140 @ =0x0000207A
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_022221CC
	ldr r1, _0221C140 @ =0x0000207A
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_02222524
	adds r0, r5, #0
	bl ov08_022205E0
	ldr r1, _0221C140 @ =0x0000207A
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_02220C5C
	adds r0, r5, #0
	bl ov08_0221DC00
	ldr r1, _0221C140 @ =0x0000207A
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0221DD70
	ldr r0, [r5]
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221C0EC
	ldr r0, _0221C144 @ =0x00002088
	movs r1, #1
	ldr r0, [r5, r0]
	bl ov08_02224B90
_0221C0EC:
	ldr r0, _0221C140 @ =0x0000207A
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0221C106
	adds r0, r5, #0
	movs r1, #0
	bl ov08_0221DB24
	cmp r0, #1
	bne _0221C106
	ldr r0, [r5]
	movs r1, #1
	strb r1, [r0, #0x11]
_0221C106:
	ldr r1, _0221C140 @ =0x0000207A
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0222171C
	ldr r1, _0221C140 @ =0x0000207A
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov08_0221D6CC
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x7a
	lsls r0, r0, #2
	movs r1, #0xa
	adds r3, r1, #0
	ldr r0, [r5, r0]
	ldr r2, _0221C148 @ =0x0000FFFF
	subs r3, #0x12
	bl FUN_02003370
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0221C13C: .4byte 0x04001050
_0221C140: .4byte 0x0000207A
_0221C144: .4byte 0x00002088
_0221C148: .4byte 0x0000FFFF
	thumb_func_end ov08_0221C048

	thumb_func_start ov08_0221C14C
ov08_0221C14C: @ 0x0221C14C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0221C162
	movs r0, #1
	pop {r4, pc}
_0221C162:
	adds r0, r4, #0
	bl ov08_0221D438
	cmp r0, #1
	bne _0221C1BA
	ldr r1, [r4]
	ldrb r0, [r1, #0x11]
	cmp r0, #6
	bne _0221C18E
	adds r1, #0x35
	ldrb r0, [r1]
	cmp r0, #1
	beq _0221C1BA
	ldr r0, _0221C1C0 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov08_022220AC
	movs r0, #0x19
	pop {r4, pc}
_0221C18E:
	ldr r0, _0221C1C0 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, [r4]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	bl ov08_022220AC
	ldr r0, [r4]
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #2
	bne _0221C1B0
	adds r0, r4, #0
	bl ov08_0221C1C8
	pop {r4, pc}
_0221C1B0:
	ldr r0, _0221C1C4 @ =0x00002079
	movs r1, #7
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C1BA:
	movs r0, #1
	pop {r4, pc}
	nop
_0221C1C0: .4byte 0x000005DD
_0221C1C4: .4byte 0x00002079
	thumb_func_end ov08_0221C14C

	thumb_func_start ov08_0221C1C8
ov08_0221C1C8: @ 0x0221C1C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldrb r1, [r4, #0x11]
	cmp r1, #0
	bne _0221C1DA
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0221C1E4
_0221C1DA:
	cmp r1, #1
	bne _0221C200
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0221C200
_0221C1E4:
	adds r0, r5, #0
	bl ov08_0222057C
	adds r0, r5, #0
	bl ov08_022201C0
	ldr r0, [r5]
	movs r1, #6
	strb r1, [r0, #0x11]
	ldr r0, _0221C30C @ =0x00002079
	movs r1, #0x19
	strb r1, [r5, r0]
	movs r0, #0x11
	pop {r3, r4, r5, pc}
_0221C200:
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	movs r1, #0x24
	bl FUN_02077D88
	cmp r0, #0
	beq _0221C236
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	movs r1, #0x25
	bl FUN_02077D88
	cmp r0, #0
	bne _0221C236
	ldrb r1, [r4, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r5, r0
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0221C236
	ldr r0, _0221C30C @ =0x00002079
	movs r1, #0xd
	strb r1, [r5, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C236:
	ldrh r0, [r4, #0x22]
	movs r3, #0
	str r0, [sp]
	ldrb r2, [r4, #0x11]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x28]
	adds r2, r4, r2
	adds r2, #0x2c
	ldrb r2, [r2]
	bl FUN_0223AC20
	cmp r0, #1
	bne _0221C2E6
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	movs r1, #0x25
	bl FUN_02077D88
	cmp r0, #0
	beq _0221C266
	ldr r0, _0221C30C @ =0x00002079
	movs r1, #0xd
	strb r1, [r5, r0]
	b _0221C2DC
_0221C266:
	ldrb r1, [r4, #0x11]
	adds r0, r5, #0
	bl ov08_0221D5DC
	cmp r0, #1
	bne _0221C2D6
	ldrh r0, [r4, #0x22]
	ldr r2, [r4, #0xc]
	movs r1, #0x17
	bl FUN_02077D88
	cmp r0, #0
	bne _0221C2D6
	adds r2, r4, #0
	adds r2, #0x33
	ldrh r1, [r4, #0x22]
	ldrb r2, [r2]
	ldr r0, [r4, #8]
	ldr r3, [r4, #0xc]
	bl ov08_0221DBCC
	ldrb r2, [r4, #0x11]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x28]
	adds r2, r4, r2
	adds r2, #0x2c
	ldrb r2, [r2]
	bl FUN_0223A880
	ldrb r2, [r4, #0x11]
	movs r1, #0x50
	adds r3, r2, #0
	muls r3, r1, r3
	adds r2, r5, r3
	str r0, [r2, #4]
	ldrb r0, [r4, #0x11]
	movs r2, #0
	muls r1, r0, r1
	adds r0, r5, r1
	ldr r0, [r0, #4]
	movs r1, #0xa3
	bl FUN_0206E540
	strh r0, [r4, #0x20]
	ldrb r1, [r4, #0x11]
	movs r0, #0x50
	ldrh r2, [r4, #0x20]
	muls r0, r1, r0
	adds r0, r5, r0
	ldrh r0, [r0, #0x14]
	movs r1, #0x19
	subs r0, r2, r0
	strh r0, [r4, #0x20]
	ldr r0, _0221C30C @ =0x00002079
	strb r1, [r5, r0]
	b _0221C2DC
_0221C2D6:
	ldr r0, _0221C30C @ =0x00002079
	movs r1, #0x17
	strb r1, [r5, r0]
_0221C2DC:
	ldr r0, _0221C310 @ =0x0000207C
	movs r1, #0
	strb r1, [r5, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C2E6:
	ldr r2, _0221C314 @ =0x00001FA8
	movs r1, #0x51
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	adds r0, r5, #0
	bl ov08_022201C0
	ldr r0, [r5]
	movs r1, #6
	strb r1, [r0, #0x11]
	ldr r0, _0221C30C @ =0x00002079
	movs r1, #0x19
	strb r1, [r5, r0]
	movs r0, #0x11
	pop {r3, r4, r5, pc}
	nop
_0221C30C: .4byte 0x00002079
_0221C310: .4byte 0x0000207C
_0221C314: .4byte 0x00001FA8
	thumb_func_end ov08_0221C1C8

	thumb_func_start ov08_0221C318
ov08_0221C318: @ 0x0221C318
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_0221D4B0
	cmp r0, #3
	bhi _0221C3BA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221C330: @ jump table
	.2byte _0221C338 - _0221C330 - 2 @ case 0
	.2byte _0221C35E - _0221C330 - 2 @ case 1
	.2byte _0221C380 - _0221C330 - 2 @ case 2
	.2byte _0221C3A2 - _0221C330 - 2 @ case 3
_0221C338:
	ldr r0, _0221C3C0 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	bl ov08_022220AC
	adds r0, r4, #0
	bl ov08_0221D91C
	cmp r0, #1
	bne _0221C354
	movs r0, #0x19
	pop {r4, pc}
_0221C354:
	ldr r0, _0221C3C4 @ =0x00002079
	movs r1, #0xf
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C35E:
	adds r0, r4, #0
	bl ov08_0221DAC4
	cmp r0, #1
	beq _0221C3BA
	ldr r0, _0221C3C0 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #8
	bl ov08_022220AC
	ldr r0, _0221C3C4 @ =0x00002079
	movs r1, #8
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C380:
	adds r0, r4, #0
	bl ov08_0221DAC4
	cmp r0, #1
	beq _0221C3BA
	ldr r0, _0221C3C0 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	bl ov08_022220AC
	ldr r0, _0221C3C4 @ =0x00002079
	movs r1, #9
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C3A2:
	ldr r0, _0221C3C0 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov08_022220AC
	ldr r0, _0221C3C4 @ =0x00002079
	movs r1, #6
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C3BA:
	movs r0, #2
	pop {r4, pc}
	nop
_0221C3C0: .4byte 0x000005DD
_0221C3C4: .4byte 0x00002079
	thumb_func_end ov08_0221C318

	thumb_func_start ov08_0221C3C8
ov08_0221C3C8: @ 0x0221C3C8
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_0221D4F8
	cmp r0, #3
	bhi _0221C478
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221C3E0: @ jump table
	.2byte _0221C3E8 - _0221C3E0 - 2 @ case 0
	.2byte _0221C416 - _0221C3E0 - 2 @ case 1
	.2byte _0221C442 - _0221C3E0 - 2 @ case 2
	.2byte _0221C45A - _0221C3E0 - 2 @ case 3
_0221C3E8:
	ldr r1, [r4]
	movs r2, #0
	ldrb r1, [r1, #0x11]
	adds r0, r4, #0
	mvns r2, r2
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C478
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C47C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	bl ov08_022220AC
	ldr r0, _0221C480 @ =0x00002079
	movs r1, #0xe
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C416:
	ldr r1, [r4]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	movs r2, #1
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C478
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C47C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xd
	bl ov08_022220AC
	ldr r0, _0221C480 @ =0x00002079
	movs r1, #0xe
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C442:
	ldr r0, _0221C47C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xb
	bl ov08_022220AC
	ldr r0, _0221C480 @ =0x00002079
	movs r1, #9
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C45A:
	ldr r0, _0221C47C @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov08_022220AC
	ldr r0, _0221C484 @ =0x0000208C
	movs r1, #1
	strb r1, [r4, r0]
	movs r1, #7
	subs r0, #0x13
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r4, pc}
_0221C478:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0221C47C: .4byte 0x000005DD
_0221C480: .4byte 0x00002079
_0221C484: .4byte 0x0000208C
	thumb_func_end ov08_0221C3C8

	thumb_func_start ov08_0221C488
ov08_0221C488: @ 0x0221C488
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov08_0221D540
	adds r5, r0, #0
	cmp r5, #7
	bhi _0221C57A
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221C4A2: @ jump table
	.2byte _0221C4B2 - _0221C4A2 - 2 @ case 0
	.2byte _0221C4B2 - _0221C4A2 - 2 @ case 1
	.2byte _0221C4B2 - _0221C4A2 - 2 @ case 2
	.2byte _0221C4B2 - _0221C4A2 - 2 @ case 3
	.2byte _0221C4EA - _0221C4A2 - 2 @ case 4
	.2byte _0221C518 - _0221C4A2 - 2 @ case 5
	.2byte _0221C544 - _0221C4A2 - 2 @ case 6
	.2byte _0221C55C - _0221C4A2 - 2 @ case 7
_0221C4B2:
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r1, r4, r0
	lsls r0, r5, #3
	adds r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221C57A
	ldr r0, _0221C580 @ =0x000005DD
	bl FUN_0200604C
	adds r1, r5, #0
	adds r1, #0xe
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov08_022220AC
	ldr r0, [r4]
	movs r1, #0xa
	adds r0, #0x34
	strb r5, [r0]
	ldr r0, _0221C584 @ =0x00002079
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C4EA:
	ldr r1, [r4]
	movs r2, #0
	ldrb r1, [r1, #0x11]
	adds r0, r4, #0
	mvns r2, r2
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C57A
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C580 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	bl ov08_022220AC
	ldr r0, _0221C584 @ =0x00002079
	movs r1, #0xe
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C518:
	ldr r1, [r4]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	movs r2, #1
	bl ov08_0221D614
	cmp r0, #0xff
	beq _0221C57A
	ldr r1, [r4]
	strb r0, [r1, #0x11]
	ldr r0, _0221C580 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xd
	bl ov08_022220AC
	ldr r0, _0221C584 @ =0x00002079
	movs r1, #0xe
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C544:
	ldr r0, _0221C580 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #9
	bl ov08_022220AC
	ldr r0, _0221C584 @ =0x00002079
	movs r1, #8
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C55C:
	ldr r0, _0221C580 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov08_022220AC
	ldr r0, _0221C588 @ =0x0000208C
	movs r1, #2
	strb r1, [r4, r0]
	movs r1, #7
	subs r0, #0x13
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C57A:
	movs r0, #4
	pop {r3, r4, r5, pc}
	nop
_0221C580: .4byte 0x000005DD
_0221C584: .4byte 0x00002079
_0221C588: .4byte 0x0000208C
	thumb_func_end ov08_0221C488

	thumb_func_start ov08_0221C58C
ov08_0221C58C: @ 0x0221C58C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov08_0221D588
	adds r5, r0, #0
	cmp r5, #4
	bhi _0221C5F6
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221C5A6: @ jump table
	.2byte _0221C5B0 - _0221C5A6 - 2 @ case 0
	.2byte _0221C5B0 - _0221C5A6 - 2 @ case 1
	.2byte _0221C5B0 - _0221C5A6 - 2 @ case 2
	.2byte _0221C5B0 - _0221C5A6 - 2 @ case 3
	.2byte _0221C5DE - _0221C5A6 - 2 @ case 4
_0221C5B0:
	ldr r1, [r4]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, r5
	beq _0221C5CE
	ldrb r1, [r1, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r1, r4, r0
	lsls r0, r5, #3
	adds r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221C5F6
_0221C5CE:
	ldr r0, _0221C5FC @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4]
	adds r0, #0x34
	strb r5, [r0]
	movs r0, #0xa
	pop {r3, r4, r5, pc}
_0221C5DE:
	ldr r0, _0221C5FC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov08_022220AC
	ldr r0, _0221C600 @ =0x00002079
	movs r1, #9
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C5F6:
	movs r0, #5
	pop {r3, r4, r5, pc}
	nop
_0221C5FC: .4byte 0x000005DD
_0221C600: .4byte 0x00002079
	thumb_func_end ov08_0221C58C

	thumb_func_start ov08_0221C604
ov08_0221C604: @ 0x0221C604
	push {r3, r4, r5, lr}
	ldr r1, _0221C6E0 @ =0x02224F3C
	adds r4, r0, #0
	bl ov08_0221D5D0
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0221C62E
	ldr r0, _0221C6E4 @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224C94
	adds r5, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bne _0221C634
	movs r5, #6
	b _0221C634
_0221C62E:
	adds r0, r4, #0
	bl ov08_022217C8
_0221C634:
	cmp r5, #6
	bhi _0221C6DC
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221C644: @ jump table
	.2byte _0221C652 - _0221C644 - 2 @ case 0
	.2byte _0221C652 - _0221C644 - 2 @ case 1
	.2byte _0221C652 - _0221C644 - 2 @ case 2
	.2byte _0221C652 - _0221C644 - 2 @ case 3
	.2byte _0221C652 - _0221C644 - 2 @ case 4
	.2byte _0221C67C - _0221C644 - 2 @ case 5
	.2byte _0221C6BC - _0221C644 - 2 @ case 6
_0221C652:
	lsls r0, r5, #0x18
	lsrs r1, r0, #0x18
	ldr r0, [r4]
	adds r0, #0x34
	strb r1, [r0]
	ldr r0, _0221C6E8 @ =0x0000208D
	strb r1, [r4, r0]
	ldr r0, _0221C6EC @ =0x000005DD
	bl FUN_0200604C
	adds r5, #0x17
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov08_022220AC
	ldr r0, _0221C6F0 @ =0x00002079
	movs r1, #0xc
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C67C:
	ldr r0, _0221C6F4 @ =0x00002077
	ldrb r3, [r4, r0]
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x1c
	beq _0221C6DC
	movs r2, #0xf
	adds r1, r3, #0
	bics r1, r2
	lsls r2, r3, #0x1c
	lsrs r3, r2, #0x1c
	movs r2, #1
	eors r2, r3
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0xf
	ands r2, r3
	orrs r1, r2
	strb r1, [r4, r0]
	adds r0, #0x16
	strb r5, [r4, r0]
	ldr r0, _0221C6EC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x12
	bl ov08_022220AC
	ldr r0, _0221C6F0 @ =0x00002079
	movs r1, #0xb
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C6BC:
	ldr r0, [r4]
	movs r1, #4
	adds r0, #0x34
	strb r1, [r0]
	ldr r0, _0221C6EC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov08_022220AC
	ldr r0, _0221C6F0 @ =0x00002079
	movs r1, #0x19
	strb r1, [r4, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C6DC:
	movs r0, #0x13
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C6E0: .4byte 0x02224F3C
_0221C6E4: .4byte 0x00002088
_0221C6E8: .4byte 0x0000208D
_0221C6EC: .4byte 0x000005DD
_0221C6F0: .4byte 0x00002079
_0221C6F4: .4byte 0x00002077
	thumb_func_end ov08_0221C604

	thumb_func_start ov08_0221C6F8
ov08_0221C6F8: @ 0x0221C6F8
	push {r3, r4, r5, lr}
	ldr r1, _0221C7FC @ =0x02224E44
	adds r5, r0, #0
	bl ov08_0221D5D0
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0221C722
	ldr r0, _0221C800 @ =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _0221C728
	movs r4, #2
	b _0221C728
_0221C722:
	adds r0, r5, #0
	bl ov08_022217C8
_0221C728:
	cmp r4, #0
	beq _0221C736
	cmp r4, #1
	beq _0221C792
	cmp r4, #2
	beq _0221C7D8
	b _0221C7F6
_0221C736:
	ldr r0, _0221C804 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _0221C808 @ =0x00002077
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bne _0221C750
	adds r0, r5, #0
	movs r1, #0x1c
	bl ov08_022220AC
	b _0221C758
_0221C750:
	adds r0, r5, #0
	movs r1, #0x1d
	bl ov08_022220AC
_0221C758:
	adds r0, r5, #0
	bl ov08_0221DB54
	cmp r0, #1
	bne _0221C788
	adds r0, r5, #0
	bl ov08_0221F220
	ldr r0, _0221C808 @ =0x00002077
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bne _0221C77A
	adds r0, r5, #0
	bl ov08_0221DB7C
	b _0221C780
_0221C77A:
	adds r0, r5, #0
	bl ov08_0221DBB4
_0221C780:
	ldr r0, _0221C80C @ =0x00002079
	movs r1, #0x14
	strb r1, [r5, r0]
	b _0221C78E
_0221C788:
	ldr r0, _0221C80C @ =0x00002079
	movs r1, #0x19
	strb r1, [r5, r0]
_0221C78E:
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C792:
	ldr r0, _0221C808 @ =0x00002077
	ldrb r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	beq _0221C7F6
	ldr r0, _0221C804 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0x12
	bl ov08_022220AC
	ldr r2, _0221C808 @ =0x00002077
	movs r1, #0xf
	ldrb r3, [r5, r2]
	adds r0, r3, #0
	bics r0, r1
	lsls r1, r3, #0x1c
	lsrs r3, r1, #0x1c
	movs r1, #1
	eors r1, r3
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r1, #0xf
	ands r1, r3
	orrs r0, r1
	strb r0, [r5, r2]
	adds r0, r2, #0
	adds r0, #0x17
	strb r4, [r5, r0]
	movs r1, #0xc
	adds r0, r2, #2
	strb r1, [r5, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C7D8:
	ldr r0, _0221C804 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #6
	bl ov08_022220AC
	ldr r0, _0221C810 @ =0x0000208E
	movs r1, #0
	strb r1, [r5, r0]
	movs r1, #0xb
	subs r0, #0x15
	strb r1, [r5, r0]
	movs r0, #0x16
	pop {r3, r4, r5, pc}
_0221C7F6:
	movs r0, #0x14
	pop {r3, r4, r5, pc}
	nop
_0221C7FC: .4byte 0x02224E44
_0221C800: .4byte 0x00002088
_0221C804: .4byte 0x000005DD
_0221C808: .4byte 0x00002077
_0221C80C: .4byte 0x00002079
_0221C810: .4byte 0x0000208E
	thumb_func_end ov08_0221C6F8

	thumb_func_start ov08_0221C814
ov08_0221C814: @ 0x0221C814
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _0221C900 @ =0x02224E94
	adds r4, r0, #0
	ldr r6, [r4]
	bl ov08_0221D5D0
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0221C842
	ldr r0, _0221C904 @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224C94
	adds r5, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bne _0221C848
	movs r5, #4
	b _0221C848
_0221C842:
	adds r0, r4, #0
	bl ov08_022217C8
_0221C848:
	cmp r5, #4
	bhi _0221C8FA
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221C858: @ jump table
	.2byte _0221C862 - _0221C858 - 2 @ case 0
	.2byte _0221C862 - _0221C858 - 2 @ case 1
	.2byte _0221C862 - _0221C858 - 2 @ case 2
	.2byte _0221C862 - _0221C858 - 2 @ case 3
	.2byte _0221C8E0 - _0221C858 - 2 @ case 4
_0221C862:
	ldrb r1, [r6, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r1, r4, r0
	lsls r0, r5, #3
	adds r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221C8FA
	ldr r0, [r4]
	adds r0, #0x34
	strb r5, [r0]
	ldr r0, _0221C908 @ =0x000005DD
	bl FUN_0200604C
	adds r1, r5, #0
	adds r1, #0x13
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov08_022220AC
	ldrh r0, [r6, #0x22]
	adds r3, r5, #0
	str r0, [sp]
	ldrb r2, [r6, #0x11]
	ldr r0, [r6, #8]
	ldr r1, [r6, #0x28]
	adds r2, r6, r2
	adds r2, #0x2c
	ldrb r2, [r2]
	bl FUN_0223AC20
	cmp r0, #1
	bne _0221C8BA
	ldr r0, _0221C90C @ =0x0000207C
	movs r1, #0
	strb r1, [r4, r0]
	movs r1, #0x17
	subs r0, r0, #3
	strb r1, [r4, r0]
	add sp, #4
	movs r0, #0x16
	pop {r3, r4, r5, r6, pc}
_0221C8BA:
	ldr r2, _0221C910 @ =0x00001FA8
	movs r1, #0x51
	ldr r0, [r4, r2]
	adds r2, #8
	ldr r2, [r4, r2]
	bl FUN_0200BB6C
	adds r0, r4, #0
	bl ov08_022201C0
	ldr r0, [r4]
	movs r1, #6
	strb r1, [r0, #0x11]
	ldr r0, _0221C914 @ =0x00002079
	movs r1, #0x19
	strb r1, [r4, r0]
	add sp, #4
	movs r0, #0x11
	pop {r3, r4, r5, r6, pc}
_0221C8E0:
	ldr r0, _0221C908 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	bl ov08_022220AC
	ldr r0, _0221C914 @ =0x00002079
	movs r1, #6
	strb r1, [r4, r0]
	add sp, #4
	movs r0, #0x16
	pop {r3, r4, r5, r6, pc}
_0221C8FA:
	movs r0, #0x15
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0221C900: .4byte 0x02224E94
_0221C904: .4byte 0x00002088
_0221C908: .4byte 0x000005DD
_0221C90C: .4byte 0x0000207C
_0221C910: .4byte 0x00001FA8
_0221C914: .4byte 0x00002079
	thumb_func_end ov08_0221C814

	thumb_func_start ov08_0221C918
ov08_0221C918: @ 0x0221C918
	push {r3, lr}
	movs r1, #0
	bl ov08_0221D840
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov08_0221C918

	thumb_func_start ov08_0221C924
ov08_0221C924: @ 0x0221C924
	push {r3, lr}
	movs r1, #1
	bl ov08_0221D840
	movs r0, #2
	pop {r3, pc}
	thumb_func_end ov08_0221C924

	thumb_func_start ov08_0221C930
ov08_0221C930: @ 0x0221C930
	push {r3, lr}
	movs r1, #2
	bl ov08_0221D840
	movs r0, #3
	pop {r3, pc}
	thumb_func_end ov08_0221C930

	thumb_func_start ov08_0221C93C
ov08_0221C93C: @ 0x0221C93C
	push {r3, lr}
	movs r1, #3
	bl ov08_0221D840
	movs r0, #4
	pop {r3, pc}
	thumb_func_end ov08_0221C93C

	thumb_func_start ov08_0221C948
ov08_0221C948: @ 0x0221C948
	push {r3, lr}
	movs r1, #4
	bl ov08_0221D840
	movs r0, #5
	pop {r3, pc}
	thumb_func_end ov08_0221C948

	thumb_func_start ov08_0221C954
ov08_0221C954: @ 0x0221C954
	push {r3, lr}
	ldr r1, _0221C974 @ =0x00002077
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bne _0221C968
	movs r1, #6
	bl ov08_0221D840
	b _0221C96E
_0221C968:
	movs r1, #8
	bl ov08_0221D840
_0221C96E:
	movs r0, #0x13
	pop {r3, pc}
	nop
_0221C974: .4byte 0x00002077
	thumb_func_end ov08_0221C954

	thumb_func_start ov08_0221C978
ov08_0221C978: @ 0x0221C978
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_022213C8
	ldr r0, _0221C9A0 @ =0x00002077
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bne _0221C994
	adds r0, r4, #0
	movs r1, #7
	bl ov08_0221D840
	b _0221C99C
_0221C994:
	adds r0, r4, #0
	movs r1, #9
	bl ov08_0221D840
_0221C99C:
	movs r0, #0x14
	pop {r4, pc}
	.align 2, 0
_0221C9A0: .4byte 0x00002077
	thumb_func_end ov08_0221C978

	thumb_func_start ov08_0221C9A4
ov08_0221C9A4: @ 0x0221C9A4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #5
	bl ov08_0221D840
	ldr r2, [r4]
	movs r1, #0x25
	ldrh r0, [r2, #0x22]
	ldr r2, [r2, #0xc]
	bl FUN_02077D88
	cmp r0, #0
	beq _0221C9C2
	movs r0, #0x18
	pop {r4, pc}
_0221C9C2:
	movs r0, #0x15
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_0221C9A4

	thumb_func_start ov08_0221C9C8
ov08_0221C9C8: @ 0x0221C9C8
	push {r4, lr}
	ldr r1, _0221CA04 @ =0x0000207A
	adds r4, r0, #0
	ldrb r1, [r4, r1]
	bl ov08_02220C5C
	ldr r1, _0221CA04 @ =0x0000207A
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_0221DD70
	ldr r1, _0221CA04 @ =0x0000207A
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_022221CC
	ldr r1, _0221CA04 @ =0x0000207A
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_0221D6CC
	ldr r0, _0221CA04 @ =0x0000207A
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _0221C9FE
	movs r0, #3
	pop {r4, pc}
_0221C9FE:
	movs r0, #4
	pop {r4, pc}
	nop
_0221CA04: .4byte 0x0000207A
	thumb_func_end ov08_0221C9C8

	thumb_func_start ov08_0221CA08
ov08_0221CA08: @ 0x0221CA08
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_022201C0
	ldr r0, _0221CA1C @ =0x00002079
	movs r1, #0x10
	strb r1, [r4, r0]
	movs r0, #0x11
	pop {r4, pc}
	nop
_0221CA1C: .4byte 0x00002079
	thumb_func_end ov08_0221CA08

	thumb_func_start ov08_0221CA20
ov08_0221CA20: @ 0x0221CA20
	push {r3, lr}
	ldr r1, _0221CA30 @ =0x00002060
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #2
	pop {r3, pc}
	.align 2, 0
_0221CA30: .4byte 0x00002060
	thumb_func_end ov08_0221CA20

	thumb_func_start ov08_0221CA34
ov08_0221CA34: @ 0x0221CA34
	push {r3, lr}
	ldr r1, _0221CA4C @ =0x0000207B
	ldrb r0, [r0, r1]
	bl FUN_02020094
	cmp r0, #0
	bne _0221CA46
	movs r0, #0x12
	pop {r3, pc}
_0221CA46:
	movs r0, #0x11
	pop {r3, pc}
	nop
_0221CA4C: .4byte 0x0000207B
	thumb_func_end ov08_0221CA34

	thumb_func_start ov08_0221CA50
ov08_0221CA50: @ 0x0221CA50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221CA70 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0221CA66
	bl FUN_02025358
	cmp r0, #1
	bne _0221CA6C
_0221CA66:
	ldr r0, _0221CA74 @ =0x00002079
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0221CA6C:
	movs r0, #0x12
	pop {r4, pc}
	.align 2, 0
_0221CA70: .4byte 0x021D110C
_0221CA74: .4byte 0x00002079
	thumb_func_end ov08_0221CA50

	thumb_func_start ov08_0221CA78
ov08_0221CA78: @ 0x0221CA78
	ldr r1, _0221CA8C @ =0x00001FA3
	ldrb r2, [r0, r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1f
	bne _0221CA88
	adds r1, #0xd6
	ldrb r0, [r0, r1]
	bx lr
_0221CA88:
	movs r0, #0x16
	bx lr
	.align 2, 0
_0221CA8C: .4byte 0x00001FA3
	thumb_func_end ov08_0221CA78

	thumb_func_start ov08_0221CA90
ov08_0221CA90: @ 0x0221CA90
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0221CC28 @ =0x0000207C
	adds r4, r0, #0
	ldrb r1, [r4, r7]
	ldr r5, [r4]
	cmp r1, #4
	bls _0221CAA0
	b _0221CC24
_0221CAA0:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221CAAC: @ jump table
	.2byte _0221CAB6 - _0221CAAC - 2 @ case 0
	.2byte _0221CB7A - _0221CAAC - 2 @ case 1
	.2byte _0221CBA2 - _0221CAAC - 2 @ case 2
	.2byte _0221CBDA - _0221CAAC - 2 @ case 3
	.2byte _0221CBFA - _0221CAAC - 2 @ case 4
_0221CAB6:
	ldrb r2, [r5, #0x11]
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x28]
	adds r2, r5, r2
	adds r2, #0x2c
	ldrb r2, [r2]
	bl FUN_0223A880
	ldrb r2, [r5, #0x11]
	movs r1, #0x50
	muls r1, r2, r1
	adds r1, r4, r1
	str r0, [r1, #4]
	adds r0, r4, #0
	bl ov08_02220224
	subs r0, r7, #2
	ldrb r0, [r4, r0]
	ldrb r1, [r5, #0x11]
	cmp r0, #5
	bne _0221CB00
	movs r0, #0x50
	muls r0, r1, r0
	adds r5, #0x34
	ldrb r1, [r5]
	adds r0, r4, r0
	ldr r0, [r0, #4]
	adds r1, #0x3a
	movs r2, #0
	bl FUN_0206E540
	adds r1, r7, #4
	strh r0, [r4, r1]
	movs r2, #2
	subs r0, r1, #4
	strb r2, [r4, r0]
	b _0221CB72
_0221CB00:
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r4, r0
	ldr r0, [r0, #4]
	bl FUN_0208AD64
	adds r6, r0, #0
	ldrb r0, [r5, #0x11]
	adds r3, r4, #0
	movs r7, #0x50
	adds r2, r0, #0
	adds r3, #0x1b
	muls r2, r7, r2
	ldrb r1, [r3, r2]
	movs r0, #0x78
	bics r1, r0
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x19
	orrs r0, r1
	strb r0, [r3, r2]
	ldrb r0, [r5, #0x11]
	adds r1, r0, #0
	muls r1, r7, r1
	adds r1, r4, r1
	ldrb r1, [r1, #0x1b]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1c
	cmp r1, #7
	bne _0221CB56
	adds r0, #0xd
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _0221CC2C @ =0x00001FB8
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldrb r1, [r5, #0x11]
	adds r0, r4, #0
	bl ov08_0221F5B0
_0221CB56:
	ldrb r1, [r5, #0x11]
	movs r0, #0x50
	movs r2, #0
	muls r0, r1, r0
	adds r0, r4, r0
	ldr r0, [r0, #4]
	movs r1, #0xa3
	bl FUN_0206E540
	ldr r1, _0221CC30 @ =0x0000207E
	movs r2, #4
	strh r0, [r4, r1]
	subs r0, r1, #2
	strb r2, [r4, r0]
_0221CB72:
	ldr r0, _0221CC34 @ =0x000005EC
	bl FUN_0200604C
	b _0221CC24
_0221CB7A:
	ldrb r1, [r5, #0x11]
	adds r6, r4, #0
	movs r2, #0x50
	adds r3, r1, #0
	adds r6, #0x14
	muls r3, r2, r3
	adds r1, r7, #2
	ldrh r2, [r4, r1]
	ldrh r1, [r6, r3]
	cmp r2, r1
	beq _0221CB9C
	adds r1, r1, #1
	strh r1, [r6, r3]
	ldrb r1, [r5, #0x11]
	bl ov08_0221F550
	b _0221CC24
_0221CB9C:
	movs r0, #3
	strb r0, [r4, r7]
	b _0221CC24
_0221CBA2:
	ldrb r3, [r5, #0x11]
	adds r1, r4, #0
	movs r2, #0x50
	adds r1, #0x36
	muls r2, r3, r2
	adds r6, r1, r2
	adds r1, r5, #0
	adds r1, #0x34
	ldrb r1, [r1]
	lsls r3, r1, #3
	adds r1, r7, #4
	ldrh r2, [r4, r1]
	ldrb r1, [r6, r3]
	cmp r2, r1
	beq _0221CBD4
	adds r1, r1, #1
	strb r1, [r6, r3]
	adds r5, #0x34
	ldrb r2, [r5]
	adds r1, r2, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ov08_02220064
	b _0221CC24
_0221CBD4:
	movs r0, #3
	strb r0, [r4, r7]
	b _0221CC24
_0221CBDA:
	adds r2, r5, #0
	adds r2, #0x33
	ldrh r1, [r5, #0x22]
	ldrb r2, [r2]
	ldr r0, [r5, #8]
	ldr r3, [r5, #0xc]
	bl ov08_0221DBCC
	adds r0, r4, #0
	bl ov08_022201C0
	movs r1, #0x19
	subs r0, r7, #3
	strb r1, [r4, r0]
	movs r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_0221CBFA:
	ldrb r1, [r5, #0x11]
	adds r3, r4, #0
	movs r2, #0x50
	muls r2, r1, r2
	adds r1, r7, #2
	adds r3, #0x14
	ldrh r6, [r4, r1]
	ldrh r1, [r3, r2]
	cmp r6, r1
	beq _0221CC1E
	adds r1, r1, #1
	strh r1, [r3, r2]
	ldrb r1, [r5, #0x11]
	bl ov08_0221F550
	adds r0, r4, #0
	bl ov08_022225A4
_0221CC1E:
	ldr r0, _0221CC28 @ =0x0000207C
	movs r1, #1
	strb r1, [r4, r0]
_0221CC24:
	movs r0, #0x17
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221CC28: .4byte 0x0000207C
_0221CC2C: .4byte 0x00001FB8
_0221CC30: .4byte 0x0000207E
_0221CC34: .4byte 0x000005EC
	thumb_func_end ov08_0221CA90

	thumb_func_start ov08_0221CC38
ov08_0221CC38: @ 0x0221CC38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	str r0, [sp, #4]
	ldr r0, _0221CD58 @ =0x0000207C
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _0221CC54
	cmp r0, #1
	beq _0221CCBE
	cmp r0, #2
	beq _0221CD28
	b _0221CD50
_0221CC54:
	ldr r2, [sp, #4]
	ldr r0, [sp, #4]
	ldrb r3, [r2, #0x11]
	ldr r1, [sp, #4]
	ldr r0, [r0, #8]
	adds r2, r2, r3
	adds r2, #0x2c
	ldrb r2, [r2]
	ldr r1, [r1, #0x28]
	bl FUN_0223A880
	ldr r1, [sp, #4]
	movs r7, #0
	ldrb r2, [r1, #0x11]
	movs r1, #0x50
	adds r6, r7, #0
	muls r1, r2, r1
	adds r1, r5, r1
	str r0, [r1, #4]
	adds r4, r5, #0
_0221CC7C:
	ldr r0, [sp, #4]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r1, r5, r0
	adds r0, r1, r6
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _0221CCA0
	ldr r0, [r1, #4]
	adds r1, r7, #0
	adds r1, #0x3a
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x82
	lsls r1, r1, #6
	strh r0, [r4, r1]
_0221CCA0:
	adds r7, r7, #1
	adds r6, #8
	adds r4, r4, #2
	cmp r7, #4
	blo _0221CC7C
	adds r0, r5, #0
	bl ov08_02220224
	ldr r0, _0221CD5C @ =0x000005EC
	bl FUN_0200604C
	ldr r0, _0221CD58 @ =0x0000207C
	movs r1, #1
	strb r1, [r5, r0]
	b _0221CD50
_0221CCBE:
	movs r6, #0
	adds r4, r6, #0
	str r6, [sp]
	adds r7, r5, #0
_0221CCC6:
	ldr r0, [sp, #4]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r1, r5, r0
	ldr r0, [sp]
	adds r1, r1, r0
	ldrh r0, [r1, #0x34]
	cmp r0, #0
	bne _0221CCDE
	adds r6, r6, #1
	b _0221CD0E
_0221CCDE:
	movs r0, #0x82
	adds r2, r1, #0
	lsls r0, r0, #6
	adds r2, #0x36
	ldrh r0, [r7, r0]
	ldrb r2, [r2]
	cmp r0, r2
	beq _0221CD0C
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r2, r4, #0x10
	adds r1, #0x36
	adds r0, r0, #1
	strb r0, [r1]
	adds r1, r4, #1
	lsls r1, r1, #0x10
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov08_02220064
	b _0221CD0E
_0221CD0C:
	adds r6, r6, #1
_0221CD0E:
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, #8
	adds r7, r7, #2
	str r0, [sp]
	cmp r4, #4
	blo _0221CCC6
	cmp r6, #4
	bne _0221CD50
	ldr r0, _0221CD58 @ =0x0000207C
	movs r1, #2
	strb r1, [r5, r0]
	b _0221CD50
_0221CD28:
	ldr r2, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [sp, #4]
	adds r2, #0x33
	ldr r3, [sp, #4]
	ldrh r1, [r1, #0x22]
	ldrb r2, [r2]
	ldr r0, [r0, #8]
	ldr r3, [r3, #0xc]
	bl ov08_0221DBCC
	adds r0, r5, #0
	bl ov08_022201C0
	ldr r0, _0221CD60 @ =0x00002079
	movs r1, #0x19
	strb r1, [r5, r0]
	add sp, #8
	movs r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_0221CD50:
	movs r0, #0x18
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CD58: .4byte 0x0000207C
_0221CD5C: .4byte 0x000005EC
_0221CD60: .4byte 0x00002079
	thumb_func_end ov08_0221CC38

	thumb_func_start ov08_0221CD64
ov08_0221CD64: @ 0x0221CD64
	push {lr}
	sub sp, #0xc
	movs r2, #0
	str r2, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x7a
	str r2, [sp, #8]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0xa
	adds r3, r1, #0
	ldr r2, _0221CD8C @ =0x0000FFFF
	subs r3, #0x12
	bl FUN_02003370
	movs r0, #0x1a
	add sp, #0xc
	pop {pc}
	nop
_0221CD8C: .4byte 0x0000FFFF
	thumb_func_end ov08_0221CD64

	thumb_func_start ov08_0221CD90
ov08_0221CD90: @ 0x0221CD90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x7a
	adds r4, r1, #0
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02003B44
	cmp r0, #0
	beq _0221CDA8
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221CDA8:
	adds r0, r4, #0
	bl ov08_0221D14C
	adds r0, r4, #0
	bl ov08_02220A50
	adds r0, r4, #0
	bl ov08_0221DD40
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov08_0221CF08
	ldr r0, _0221CDF4 @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B8C
	ldr r1, [r4]
	adds r1, #0x32
	strb r0, [r1]
	ldr r0, _0221CDF4 @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B7C
	movs r0, #4
	bl FUN_02002DB4
	ldr r0, [r4]
	movs r1, #1
	adds r0, #0x36
	strb r1, [r0]
	adds r0, r5, #0
	bl FUN_02007234
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221CDF4: .4byte 0x00002088
	thumb_func_end ov08_0221CD90

	thumb_func_start ov08_0221CDF8
ov08_0221CDF8: @ 0x0221CDF8
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0221CEF4 @ =0x02224E34
	add r3, sp, #0x70
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	movs r1, #1
	bl FUN_0201ACE8
	ldr r5, _0221CEF8 @ =0x02224EAC
	add r3, sp, #0x54
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
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _0221CEFC @ =0x02224EE4
	add r3, sp, #0x38
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
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _0221CF00 @ =0x02224F00
	add r3, sp, #0x1c
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
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _0221CF04 @ =0x02224EC8
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
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #5
	ldr r3, [r3, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #4
	ldr r3, [r3, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #5
	bl FUN_0201EFBC
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221CEF4: .4byte 0x02224E34
_0221CEF8: .4byte 0x02224EAC
_0221CEFC: .4byte 0x02224EE4
_0221CF00: .4byte 0x02224F00
_0221CF04: .4byte 0x02224EC8
	thumb_func_end ov08_0221CDF8

	thumb_func_start ov08_0221CF08
ov08_0221CF08: @ 0x0221CF08
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_0221CF08

	thumb_func_start ov08_0221CF38
ov08_0221CF38: @ 0x0221CF38
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x47
	ldr r1, [r1, #0xc]
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	movs r2, #0x79
	ldr r1, [r1, #0xc]
	lsls r2, r2, #2
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r1, #0x16
	movs r3, #7
	adds r4, r0, #0
	bl FUN_02007B44
	ldr r2, [r5]
	adds r0, r4, #0
	ldr r2, [r2, #0xc]
	movs r1, #0x14
	bl FUN_0200771C
	add r1, sp, #0x10
	adds r6, r0, #0
	blx FUN_020B71D8
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r1, #0xc
	bl ov08_022217F0
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldr r2, [r5]
	adds r0, r4, #0
	ldr r2, [r2, #0xc]
	movs r1, #0x15
	bl FUN_0200771C
	add r1, sp, #0x10
	adds r6, r0, #0
	blx FUN_020B71D8
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r1, #0xc
	bl ov08_02221B1C
	adds r0, r6, #0
	bl FUN_0201AB0C
	movs r0, #1
	str r0, [sp]
	lsls r0, r0, #9
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x7a
	ldr r3, [r5]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	movs r1, #0x47
	movs r2, #0x17
	bl FUN_02003200
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200335C
	adds r2, r0, #0
	ldr r0, _0221D0F0 @ =0x00001F60
	movs r1, #6
	lsls r1, r1, #6
	adds r1, r2, r1
	adds r0, r5, r0
	movs r2, #0x40
	blx FUN_020E5AD8
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	movs r0, #0x7a
	ldr r3, [r5]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	movs r1, #0x10
	movs r2, #7
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xf0
	str r0, [sp, #8]
	ldr r3, [r5]
	adds r0, #0xf8
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	movs r1, #0x10
	movs r2, #8
	bl FUN_02003200
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223B708
	adds r4, r0, #0
	bl FUN_0200E63C
	adds r1, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r2, #0x79
	ldr r0, [r0, #0xc]
	lsls r2, r2, #2
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	movs r0, #0x26
	movs r3, #4
	bl FUN_020078F0
	adds r0, r4, #0
	bl FUN_0200E640
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	movs r0, #0x7a
	ldr r3, [r5]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #0xc]
	movs r1, #0x26
	bl FUN_02003200
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200335C
	adds r6, r0, #0
	ldr r0, [r5]
	movs r1, #0x20
	ldr r0, [r0, #0xc]
	bl FUN_0201AA8C
	movs r1, #0x1a
	lsls r1, r1, #4
	adds r1, r6, r1
	movs r2, #0x20
	adds r4, r0, #0
	blx FUN_020E5AD8
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r3, [r1]
	adds r2, r4, #0
	adds r2, #0xe
	strb r3, [r4, #0xe]
	ldrb r3, [r1, #1]
	strb r3, [r2, #1]
	ldrb r3, [r1, #2]
	strb r3, [r2, #2]
	ldrb r1, [r1, #3]
	movs r3, #0xd0
	strb r1, [r2, #3]
	adds r2, r0, #4
	adds r1, r0, #4
	ldrb r2, [r6, r2]
	adds r1, r6, r1
	adds r0, #0xb4
	strb r2, [r4, #6]
	ldrb r2, [r1, #1]
	strb r2, [r4, #7]
	ldrb r2, [r1, #2]
	strb r2, [r4, #8]
	ldrb r1, [r1, #3]
	movs r2, #1
	strb r1, [r4, #9]
	movs r1, #0x20
	str r1, [sp]
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200316C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0221D0F0: .4byte 0x00001F60
	thumb_func_end ov08_0221CF38

	thumb_func_start ov08_0221D0F4
ov08_0221D0F4: @ 0x0221D0F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	movs r0, #0
	ldr r3, [r3, #0xc]
	movs r1, #0x1b
	movs r2, #6
	bl FUN_0200BAF8
	ldr r1, _0221D13C @ =0x00001FA8
	movs r2, #0
	str r0, [r4, r1]
	ldr r3, [r4]
	movs r0, #0xf
	ldr r3, [r3, #0xc]
	movs r1, #0xe
	bl FUN_0200CC74
	ldr r1, _0221D140 @ =0x00001FA4
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl FUN_0200BD08
	ldr r1, _0221D144 @ =0x00001FAC
	str r0, [r4, r1]
	ldr r1, [r4]
	movs r0, #2
	ldr r1, [r1, #0xc]
	lsls r0, r0, #8
	bl FUN_02026354
	ldr r1, _0221D148 @ =0x00001FB0
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0221D13C: .4byte 0x00001FA8
_0221D140: .4byte 0x00001FA4
_0221D144: .4byte 0x00001FAC
_0221D148: .4byte 0x00001FB0
	thumb_func_end ov08_0221D0F4

	thumb_func_start ov08_0221D14C
ov08_0221D14C: @ 0x0221D14C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221D174 @ =0x00001FA8
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	ldr r0, _0221D178 @ =0x00001FA4
	ldr r0, [r4, r0]
	bl FUN_0200CD94
	ldr r0, _0221D17C @ =0x00001FAC
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	ldr r0, _0221D180 @ =0x00001FB0
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	nop
_0221D174: .4byte 0x00001FA8
_0221D178: .4byte 0x00001FA4
_0221D17C: .4byte 0x00001FAC
_0221D180: .4byte 0x00001FB0
	thumb_func_end ov08_0221D14C

	thumb_func_start ov08_0221D184
ov08_0221D184: @ 0x0221D184
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02074640
	cmp r0, #0
	bgt _0221D19E
	b _0221D432
_0221D19E:
	ldr r0, [sp, #8]
	movs r1, #0x50
	muls r1, r0, r1
	ldr r0, [sp]
	str r1, [sp, #4]
	adds r4, r0, r1
	ldr r0, [r0]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	bl FUN_02074644
	str r0, [r4, #4]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #0
	bne _0221D1C8
	b _0221D416
_0221D1C8:
	ldr r0, [sp, #8]
	movs r1, #0x50
	adds r5, r0, #0
	muls r5, r1, r5
	ldr r0, [sp]
	movs r1, #0xa5
	adds r4, r0, r5
	ldr r0, [r4, #4]
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0xa]
	ldr r0, [r4, #4]
	movs r1, #0xa6
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0xc]
	ldr r0, [r4, #4]
	movs r1, #0xa7
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0xe]
	ldr r0, [r4, #4]
	movs r1, #0xa8
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0x10]
	ldr r0, [r4, #4]
	movs r1, #0xa9
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0x12]
	ldr r0, [r4, #4]
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0x14]
	ldr r0, [r4, #4]
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r4, #0x18]
	ldr r0, [r4, #4]
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	ldr r6, [sp]
	strb r0, [r4, #0x19]
	ldr r0, [r4, #4]
	adds r6, #0x1a
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	ldrb r1, [r6, r5]
	movs r2, #0x7f
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	movs r1, #0xb0
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #1
	ldrb r1, [r6, r5]
	bne _0221D278
	movs r0, #0x80
	bics r1, r0
	strb r1, [r6, r5]
	b _0221D27E
_0221D278:
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r6, r5]
_0221D27E:
	ldr r0, [sp]
	adds r4, r0, r5
	adds r6, r0, #0
	ldr r0, [r4, #4]
	adds r6, #0x1b
	bl FUN_0206FF88
	ldrb r1, [r6, r5]
	movs r2, #7
	bics r1, r2
	movs r2, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	bl FUN_0208AD64
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1c
	ldrb r1, [r6, r5]
	movs r2, #0x78
	lsrs r0, r0, #0x19
	bics r1, r2
	orrs r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r6, r5]
	movs r2, #0x80
	lsrs r0, r0, #0x18
	bics r1, r2
	orrs r0, r1
	strb r0, [r6, r5]
	ldr r0, [r4, #4]
	movs r1, #0xa
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4, #0x1e]
	ldr r0, [r4, #4]
	movs r1, #8
	movs r2, #0
	bl FUN_0206E540
	ldr r6, [sp]
	str r0, [r4, #0x20]
	adds r6, #0x1a
	ldrb r1, [r6, r5]
	ldrh r0, [r4, #8]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	bl FUN_0206FD00
	str r0, [r4, #0x24]
	ldrb r0, [r6, r5]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x19
	cmp r1, #0x64
	bne _0221D316
	ldr r0, [sp]
	adds r4, r0, r5
	ldr r0, [r4, #0x24]
	b _0221D322
_0221D316:
	ldr r0, [sp]
	adds r1, r1, #1
	adds r4, r0, r5
	ldrh r0, [r4, #8]
	bl FUN_0206FD00
_0221D322:
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	movs r1, #0x13
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r1, #0x2c
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0x14
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r1, #0x2d
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0x15
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0x16
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0x17
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	adds r1, r4, #0
	adds r1, #0x31
	strb r0, [r1]
	ldr r0, [r4, #4]
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r4, #0x32
	strb r0, [r4]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	adds r1, #0x34
	adds r7, r1, r0
	ldr r1, [sp]
	movs r4, #0
	adds r6, r1, r0
_0221D3A0:
	lsls r0, r4, #3
	adds r1, r4, #0
	str r0, [sp, #0xc]
	adds r5, r7, r0
	ldr r0, [r6, #4]
	adds r1, #0x36
	movs r2, #0
	bl FUN_0206E540
	ldr r1, [sp, #0xc]
	strh r0, [r7, r1]
	adds r0, r1, #0
	ldrh r0, [r7, r0]
	cmp r0, #0
	beq _0221D40C
	adds r1, r4, #0
	ldr r0, [r6, #4]
	adds r1, #0x3a
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #2]
	adds r1, r4, #0
	ldr r0, [r6, #4]
	adds r1, #0x3e
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #3]
	ldrh r0, [r5]
	ldrb r1, [r5, #3]
	bl FUN_0207332C
	strb r0, [r5, #3]
	ldrh r0, [r5]
	movs r1, #3
	bl FUN_02073314
	strb r0, [r5, #4]
	ldrh r0, [r5]
	movs r1, #1
	bl FUN_02073314
	strb r0, [r5, #5]
	ldrh r0, [r5]
	movs r1, #4
	bl FUN_02073314
	strb r0, [r5, #6]
	ldrh r0, [r5]
	movs r1, #2
	bl FUN_02073314
	strb r0, [r5, #7]
_0221D40C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _0221D3A0
_0221D416:
	ldr r0, [sp, #8]
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02074640
	ldr r1, [sp, #8]
	cmp r1, r0
	bge _0221D432
	b _0221D19E
_0221D432:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_0221D184

	thumb_func_start ov08_0221D438
ov08_0221D438: @ 0x0221D438
	push {r3, r4, r5, lr}
	ldr r1, _0221D4A8 @ =0x02224F1C
	adds r4, r0, #0
	bl ov08_0221D5D0
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0221D484
	ldr r0, _0221D4AC @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224C94
	adds r5, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bne _0221D462
	movs r5, #6
	b _0221D46C
_0221D462:
	adds r0, r0, #1
	cmp r5, r0
	bne _0221D46C
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221D46C:
	cmp r5, #6
	beq _0221D47C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D4A2
_0221D47C:
	ldr r0, [r4]
	strb r5, [r0, #0x11]
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221D484:
	cmp r5, #6
	beq _0221D494
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D4A2
_0221D494:
	ldr r0, [r4]
	strb r5, [r0, #0x11]
	adds r0, r4, #0
	bl ov08_022217C8
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221D4A2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221D4A8: .4byte 0x02224F1C
_0221D4AC: .4byte 0x00002088
	thumb_func_end ov08_0221D438

	thumb_func_start ov08_0221D4B0
ov08_0221D4B0: @ 0x0221D4B0
	push {r3, r4, r5, lr}
	ldr r1, _0221D4F0 @ =0x02224E54
	adds r5, r0, #0
	bl ov08_0221D5D0
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0221D4E4
	ldr r0, _0221D4F4 @ =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _0221D4DA
	movs r4, #3
	b _0221D4EA
_0221D4DA:
	adds r0, r0, #1
	cmp r4, r0
	bne _0221D4EA
	movs r0, #0xff
	pop {r3, r4, r5, pc}
_0221D4E4:
	adds r0, r5, #0
	bl ov08_022217C8
_0221D4EA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D4F0: .4byte 0x02224E54
_0221D4F4: .4byte 0x00002088
	thumb_func_end ov08_0221D4B0

	thumb_func_start ov08_0221D4F8
ov08_0221D4F8: @ 0x0221D4F8
	push {r3, r4, r5, lr}
	ldr r1, _0221D538 @ =0x02224E68
	adds r5, r0, #0
	bl ov08_0221D5D0
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0221D52C
	ldr r0, _0221D53C @ =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _0221D522
	movs r4, #3
	b _0221D532
_0221D522:
	adds r0, r0, #1
	cmp r4, r0
	bne _0221D532
	movs r0, #0xff
	pop {r3, r4, r5, pc}
_0221D52C:
	adds r0, r5, #0
	bl ov08_022217C8
_0221D532:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D538: .4byte 0x02224E68
_0221D53C: .4byte 0x00002088
	thumb_func_end ov08_0221D4F8

	thumb_func_start ov08_0221D540
ov08_0221D540: @ 0x0221D540
	push {r3, r4, r5, lr}
	ldr r1, _0221D580 @ =0x02224F5C
	adds r5, r0, #0
	bl ov08_0221D5D0
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0221D574
	ldr r0, _0221D584 @ =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _0221D56A
	movs r4, #7
	b _0221D57A
_0221D56A:
	adds r0, r0, #1
	cmp r4, r0
	bne _0221D57A
	movs r0, #0xff
	pop {r3, r4, r5, pc}
_0221D574:
	adds r0, r5, #0
	bl ov08_022217C8
_0221D57A:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D580: .4byte 0x02224F5C
_0221D584: .4byte 0x00002088
	thumb_func_end ov08_0221D540

	thumb_func_start ov08_0221D588
ov08_0221D588: @ 0x0221D588
	push {r3, r4, r5, lr}
	ldr r1, _0221D5C8 @ =0x02224E7C
	adds r5, r0, #0
	bl ov08_0221D5D0
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0221D5BC
	ldr r0, _0221D5CC @ =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224C94
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _0221D5B2
	movs r4, #4
	b _0221D5C2
_0221D5B2:
	adds r0, r0, #1
	cmp r4, r0
	bne _0221D5C2
	movs r0, #0xff
	pop {r3, r4, r5, pc}
_0221D5BC:
	adds r0, r5, #0
	bl ov08_022217C8
_0221D5C2:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D5C8: .4byte 0x02224E7C
_0221D5CC: .4byte 0x00002088
	thumb_func_end ov08_0221D588

	thumb_func_start ov08_0221D5D0
ov08_0221D5D0: @ 0x0221D5D0
	ldr r3, _0221D5D8 @ =FUN_02025224
	adds r0, r1, #0
	bx r3
	nop
_0221D5D8: .4byte FUN_02025224
	thumb_func_end ov08_0221D5D0

	thumb_func_start ov08_0221D5DC
ov08_0221D5DC: @ 0x0221D5DC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x50
	adds r5, r0, #0
	muls r1, r4, r1
	adds r1, r5, r1
	ldrh r1, [r1, #8]
	cmp r1, #0
	bne _0221D5F2
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221D5F2:
	cmp r4, #0
	beq _0221D60C
	bl ov08_0221DAE4
	cmp r0, #0
	bne _0221D608
	adds r0, r5, #0
	bl ov08_0221DB04
	cmp r0, #0
	beq _0221D610
_0221D608:
	cmp r4, #1
	bne _0221D610
_0221D60C:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0221D610:
	movs r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_0221D5DC

	thumb_func_start ov08_0221D614
ov08_0221D614: @ 0x0221D614
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	adds r7, r2, #0
	adds r6, r4, #0
	bl ov08_0221DB04
	cmp r0, #1
	bne _0221D68C
	ldr r2, _0221D6C8 @ =_02224E2C
	add r1, sp, #0
	ldrb r3, [r2]
	add r0, sp, #0
	movs r4, #0
	strb r3, [r1]
	ldrb r3, [r2, #1]
	strb r3, [r1, #1]
	ldrb r3, [r2, #2]
	strb r3, [r1, #2]
	ldrb r3, [r2, #3]
	strb r3, [r1, #3]
	ldrb r3, [r2, #4]
	ldrb r2, [r2, #5]
	strb r3, [r1, #4]
	strb r2, [r1, #5]
_0221D648:
	ldrb r1, [r0]
	cmp r6, r1
	beq _0221D656
	adds r4, r4, #1
	adds r0, r0, #1
	cmp r4, #6
	blt _0221D648
_0221D656:
	adds r4, r4, r7
	bpl _0221D65E
	movs r4, #5
	b _0221D664
_0221D65E:
	cmp r4, #6
	blt _0221D664
	movs r4, #0
_0221D664:
	add r0, sp, #0
	ldrb r1, [r0, r4]
	cmp r6, r1
	beq _0221D6C0
	adds r0, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D656
	add r0, sp, #0
	ldrb r0, [r0, r4]
	movs r1, #0x50
	muls r1, r0, r1
	adds r1, r5, r1
	ldrb r1, [r1, #0x1b]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	bne _0221D656
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0221D68C:
	adds r4, r4, r7
	bpl _0221D694
	movs r4, #5
	b _0221D69A
_0221D694:
	cmp r4, #6
	blt _0221D69A
	movs r4, #0
_0221D69A:
	cmp r6, r4
	beq _0221D6C0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_0221D5DC
	cmp r0, #0
	beq _0221D68C
	movs r0, #0x50
	muls r0, r4, r0
	adds r0, r5, r0
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0221D68C
	lsls r0, r4, #0x18
	add sp, #8
	lsrs r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0221D6C0:
	movs r0, #0xff
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D6C8: .4byte _02224E2C
	thumb_func_end ov08_0221D614

	thumb_func_start ov08_0221D6CC
ov08_0221D6CC: @ 0x0221D6CC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	cmp r1, #2
	bne _0221D74A
	ldr r0, [r6]
	adds r2, r6, #4
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r2, r0
	ldrb r1, [r0, #0x16]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	cmp r1, #0x64
	bhs _0221D6F6
	ldr r2, [r0, #0x20]
	ldr r1, [r0, #0x24]
	ldr r0, [r0, #0x1c]
	subs r1, r1, r2
	subs r0, r0, r2
	b _0221D6FA
_0221D6F6:
	movs r1, #0
	adds r0, r1, #0
_0221D6FA:
	movs r2, #0x40
	bl FUN_02088068
	adds r4, r0, #0
	movs r5, #0
	movs r7, #0x1e
_0221D706:
	cmp r4, #8
	blo _0221D70E
	adds r1, r7, #0
	b _0221D716
_0221D70E:
	adds r0, r4, #0
	adds r0, #0x16
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0221D716:
	adds r2, r5, #0
	adds r2, #0xa
	lsls r2, r2, #0x10
	adds r0, r6, #0
	lsrs r2, r2, #0x10
	movs r3, #8
	bl ov08_0221D74C
	cmp r4, #8
	bhs _0221D72E
	movs r4, #0
	b _0221D734
_0221D72E:
	subs r4, #8
	lsls r0, r4, #0x18
	lsrs r4, r0, #0x18
_0221D734:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #8
	blo _0221D706
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #7
	bl FUN_0201EFBC
_0221D74A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_0221D6CC

	thumb_func_start ov08_0221D74C
ov08_0221D74C: @ 0x0221D74C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	adds r4, r2, #0
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0x79
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	lsls r3, r4, #0x18
	movs r1, #7
	adds r2, r5, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov08_0221D74C

	thumb_func_start ov08_0221D77C
ov08_0221D77C: @ 0x0221D77C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0xe
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	lsls r6, r2, #1
	adds r4, r1, #0
	str r0, [sp, #0xc]
	movs r0, #0x79
	adds r7, r6, #2
	lsls r0, r0, #2
	lsls r3, r7, #0x18
	ldr r0, [r5, r0]
	movs r1, #7
	adds r2, r4, #0
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	movs r0, #0xe
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x79
	adds r6, r6, #3
	lsls r0, r0, #2
	adds r2, r4, #1
	lsls r2, r2, #0x10
	lsls r3, r6, #0x18
	ldr r0, [r5, r0]
	movs r1, #7
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	movs r0, #0xf
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x79
	adds r2, r4, #0
	lsls r0, r0, #2
	adds r2, #0x20
	lsls r2, r2, #0x10
	lsls r3, r7, #0x18
	ldr r0, [r5, r0]
	movs r1, #7
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	movs r0, #0xf
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x79
	lsls r0, r0, #2
	adds r4, #0x21
	lsls r2, r4, #0x10
	lsls r3, r6, #0x18
	ldr r0, [r5, r0]
	movs r1, #7
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_0221D77C

	thumb_func_start ov08_0221D81C
ov08_0221D81C: @ 0x0221D81C
	push {r4, r5, r6, lr}
	ldr r6, _0221D83C @ =0x00000125
	adds r5, r0, #0
	movs r4, #0
_0221D824:
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	bl ov08_0221D77C
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #6
	blo _0221D824
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221D83C: .4byte 0x00000125
	thumb_func_end ov08_0221D81C

	thumb_func_start ov08_0221D840
ov08_0221D840: @ 0x0221D840
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov08_0221D8B0
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	movs r2, #0
	bl FUN_0201CB28
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	movs r2, #0
	bl FUN_0201CB28
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02220C5C
	adds r0, r5, #0
	bl ov08_0221DD28
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_0221DC3C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_0221DD70
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_0221D6CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_0222171C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_022221CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02222524
	ldr r0, _0221D8AC @ =0x0000207A
	strb r4, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0221D8AC: .4byte 0x0000207A
	thumb_func_end ov08_0221D840

	thumb_func_start ov08_0221D8B0
ov08_0221D8B0: @ 0x0221D8B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0221D918 @ =0x02224F80
	adds r5, r0, #0
	lsls r0, r1, #3
	movs r4, #0
	adds r6, r2, r0
_0221D8BE:
	ldr r2, [r5]
	ldr r1, [r6]
	ldr r2, [r2, #0xc]
	movs r0, #0x47
	bl FUN_02007524
	add r1, sp, #0xc
	adds r7, r0, #0
	blx FUN_020B71D8
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x79
	lsls r0, r0, #2
	adds r1, r4, #6
	ldr r2, [sp, #0xc]
	lsls r1, r1, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	adds r2, #0xc
	movs r3, #0
	bl FUN_0201C4C4
	movs r0, #0x79
	lsls r0, r0, #2
	adds r1, r4, #6
	lsls r1, r1, #0x18
	ldr r0, [r5, r0]
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	adds r0, r7, #0
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #2
	blo _0221D8BE
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D918: .4byte 0x02224F80
	thumb_func_end ov08_0221D8B0

	thumb_func_start ov08_0221D91C
ov08_0221D91C: @ 0x0221D91C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r2, #0x50
	ldrb r1, [r1, #0x11]
	adds r3, r5, #4
	muls r2, r1, r2
	adds r4, r3, r2
	bl ov08_0221DB24
	cmp r0, #1
	bne _0221D978
	ldr r0, _0221DAB8 @ =0x00001FA8
	movs r1, #0x50
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	adds r4, r0, #0
	ldr r0, [r1, #8]
	ldr r1, [r1, #0x28]
	bl FUN_0223AB6C
	adds r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223A9F4
	adds r2, r0, #0
	ldr r0, _0221DABC @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200C3E8
	ldr r1, _0221DABC @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221D978:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	bne _0221D9B4
	ldr r0, _0221DAB8 @ =0x00001FA8
	movs r1, #0x4d
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r4]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _0221DABC @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _0221DABC @ =0x00001FAC
	adds r2, r6, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221D9B4:
	ldr r2, [r5]
	ldrb r0, [r2, #0x11]
	adds r0, r2, r0
	adds r0, #0x2c
	ldrb r1, [r0]
	ldrb r0, [r2, #0x14]
	cmp r0, r1
	beq _0221D9CA
	ldrb r0, [r2, #0x15]
	cmp r0, r1
	bne _0221DA00
_0221D9CA:
	ldr r0, _0221DAB8 @ =0x00001FA8
	movs r1, #0x4c
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r4]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _0221DABC @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _0221DABC @ =0x00001FAC
	adds r2, r6, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DA00:
	adds r0, r5, #0
	bl ov08_0221DAC4
	cmp r0, #1
	bne _0221DA1C
	ldr r2, _0221DAB8 @ =0x00001FA8
	movs r1, #0x4f
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DA1C:
	ldr r2, [r5]
	ldrb r1, [r2, #0x12]
	cmp r1, #6
	beq _0221DA6C
	ldrb r4, [r2, #0x11]
	adds r0, r2, r4
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r1, r0
	bne _0221DA6C
	ldr r0, _0221DAB8 @ =0x00001FA8
	movs r1, #0x5d
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #0x50
	muls r0, r4, r0
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _0221DABC @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _0221DABC @ =0x00001FAC
	adds r2, r6, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DA6C:
	ldrh r0, [r2, #0x24]
	cmp r0, #0
	beq _0221DAB4
	ldr r1, _0221DAC0 @ =0x00002076
	movs r0, #0x50
	ldrb r2, [r5, r1]
	subs r1, #0xce
	adds r4, r5, #4
	adds r6, r2, #0
	muls r6, r0, r6
	ldr r0, [r5, r1]
	movs r1, #0x4e
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r0, [r4, r6]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _0221DABC @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _0221DABC @ =0x00001FAC
	adds r2, r7, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DAB4:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221DAB8: .4byte 0x00001FA8
_0221DABC: .4byte 0x00001FAC
_0221DAC0: .4byte 0x00002076
	thumb_func_end ov08_0221D91C

	thumb_func_start ov08_0221DAC4
ov08_0221DAC4: @ 0x0221DAC4
	ldr r1, [r0]
	ldrb r2, [r1, #0x11]
	movs r1, #0x50
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _0221DADA
	movs r0, #1
	b _0221DADC
_0221DADA:
	movs r0, #0
_0221DADC:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
	thumb_func_end ov08_0221DAC4

	thumb_func_start ov08_0221DAE4
ov08_0221DAE4: @ 0x0221DAE4
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl FUN_0223A7E0
	cmp r0, #0x4a
	beq _0221DB00
	cmp r0, #0x4b
	beq _0221DB00
	movs r1, #0x12
	tst r0, r1
	beq _0221DB00
	movs r0, #1
	pop {r3, pc}
_0221DB00:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov08_0221DAE4

	thumb_func_start ov08_0221DB04
ov08_0221DB04: @ 0x0221DB04
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl FUN_0223A7E0
	cmp r0, #0x4a
	beq _0221DB20
	cmp r0, #0x4b
	beq _0221DB20
	movs r1, #8
	tst r0, r1
	beq _0221DB20
	movs r0, #1
	pop {r3, pc}
_0221DB20:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov08_0221DB04

	thumb_func_start ov08_0221DB24
ov08_0221DB24: @ 0x0221DB24
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov08_0221DB04
	cmp r0, #1
	bne _0221DB4C
	ldr r0, _0221DB50 @ =0x0000208F
	ldrb r0, [r5, r0]
	cmp r0, #2
	bne _0221DB44
	movs r0, #1
	adds r1, r4, #0
	tst r1, r0
	beq _0221DB4C
	pop {r3, r4, r5, pc}
_0221DB44:
	movs r0, #1
	adds r1, r4, #0
	tst r1, r0
	beq _0221DB4E
_0221DB4C:
	movs r0, #0
_0221DB4E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221DB50: .4byte 0x0000208F
	thumb_func_end ov08_0221DB24

	thumb_func_start ov08_0221DB54
ov08_0221DB54: @ 0x0221DB54
	ldr r2, [r0]
	adds r1, r2, #0
	adds r1, #0x34
	ldrb r3, [r1]
	cmp r3, #4
	bne _0221DB64
	ldrh r0, [r2, #0x24]
	b _0221DB72
_0221DB64:
	ldrb r2, [r2, #0x11]
	movs r1, #0x50
	muls r1, r2, r1
	adds r1, r0, r1
	lsls r0, r3, #3
	adds r0, r1, r0
	ldrh r0, [r0, #0x34]
_0221DB72:
	ldr r3, _0221DB78 @ =FUN_02078024
	bx r3
	nop
_0221DB78: .4byte FUN_02078024
	thumb_func_end ov08_0221DB54

	thumb_func_start ov08_0221DB7C
ov08_0221DB7C: @ 0x0221DB7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221DBAC @ =0x00002020
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200DCE8
	ldr r0, _0221DBB0 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, #0xa0
	bl FUN_0201D8E4
	ldr r0, _0221DBB0 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, #0x60
	bl FUN_0201D8E4
	ldr r0, _0221DBB0 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, #0x70
	bl FUN_0201D8E4
	pop {r4, pc}
	nop
_0221DBAC: .4byte 0x00002020
_0221DBB0: .4byte 0x00002070
	thumb_func_end ov08_0221DB7C

	thumb_func_start ov08_0221DBB4
ov08_0221DBB4: @ 0x0221DBB4
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_0221D81C
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #7
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_0221DBB4

	thumb_func_start ov08_0221DBCC
ov08_0221DBCC: @ 0x0221DBCC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0x41
	beq _0221DBF0
	cmp r4, #0x43
	beq _0221DBF0
	cmp r4, #0x42
	beq _0221DBF0
	bl FUN_0223AA80
	adds r1, r4, #0
	movs r2, #1
	adds r3, r7, #0
	bl FUN_02078434
_0221DBF0:
	adds r0, r5, #0
	bl FUN_0223AA84
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_02078828
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_0221DBCC

	thumb_func_start ov08_0221DC00
ov08_0221DC00: @ 0x0221DC00
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0221DC30 @ =0x00002050
	ldr r4, _0221DC34 @ =0x02224FD0
	movs r6, #0
	adds r5, r7, r0
_0221DC0C:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #2
	blo _0221DC0C
	ldr r1, _0221DC38 @ =0x0000207A
	adds r0, r7, #0
	ldrb r1, [r7, r1]
	bl ov08_0221DC3C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221DC30: .4byte 0x00002050
_0221DC34: .4byte 0x02224FD0
_0221DC38: .4byte 0x0000207A
	thumb_func_end ov08_0221DC00

	thumb_func_start ov08_0221DC3C
ov08_0221DC3C: @ 0x0221DC3C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	cmp r1, #9
	bhi _0221DCBC
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221DC50: @ jump table
	.2byte _0221DC64 - _0221DC50 - 2 @ case 0
	.2byte _0221DC6E - _0221DC50 - 2 @ case 1
	.2byte _0221DC78 - _0221DC50 - 2 @ case 2
	.2byte _0221DC82 - _0221DC50 - 2 @ case 3
	.2byte _0221DC8C - _0221DC50 - 2 @ case 4
	.2byte _0221DC96 - _0221DC50 - 2 @ case 5
	.2byte _0221DCA0 - _0221DC50 - 2 @ case 6
	.2byte _0221DCAA - _0221DC50 - 2 @ case 7
	.2byte _0221DCA0 - _0221DC50 - 2 @ case 8
	.2byte _0221DCB4 - _0221DC50 - 2 @ case 9
_0221DC64:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #6
	ldr r6, _0221DD00 @ =0x02225084
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC6E:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #4
	ldr r6, _0221DD04 @ =0x0222500C
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC78:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #0x23
	ldr r6, _0221DD08 @ =0x0222522C
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC82:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #0xb
	ldr r6, _0221DD0C @ =0x022250EC
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC8C:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #0x11
	ldr r6, _0221DD10 @ =0x022251A4
	strb r1, [r4, r0]
	b _0221DCBC
_0221DC96:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #5
	ldr r6, _0221DD14 @ =0x0222502C
	strb r1, [r4, r0]
	b _0221DCBC
_0221DCA0:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #6
	ldr r6, _0221DD18 @ =0x02225054
	strb r1, [r4, r0]
	b _0221DCBC
_0221DCAA:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #0xc
	ldr r6, _0221DD1C @ =0x02225144
	strb r1, [r4, r0]
	b _0221DCBC
_0221DCB4:
	ldr r0, _0221DCFC @ =0x00002074
	movs r1, #7
	ldr r6, _0221DD20 @ =0x022250B4
	strb r1, [r4, r0]
_0221DCBC:
	ldr r1, _0221DCFC @ =0x00002074
	ldr r0, [r4]
	ldrb r1, [r4, r1]
	ldr r0, [r0, #0xc]
	bl FUN_0201D39C
	ldr r1, _0221DD24 @ =0x00002070
	movs r5, #0
	str r0, [r4, r1]
	adds r0, r1, #4
	ldrb r0, [r4, r0]
	cmp r0, #0
	bls _0221DCFA
	adds r7, r1, #4
_0221DCD8:
	ldr r1, _0221DD24 @ =0x00002070
	movs r0, #0x79
	ldr r2, [r4, r1]
	lsls r0, r0, #2
	lsls r1, r5, #4
	adds r1, r2, r1
	lsls r2, r5, #3
	ldr r0, [r4, r0]
	adds r2, r6, r2
	bl FUN_0201D4F8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldrb r0, [r4, r7]
	cmp r5, r0
	blo _0221DCD8
_0221DCFA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221DCFC: .4byte 0x00002074
_0221DD00: .4byte 0x02225084
_0221DD04: .4byte 0x0222500C
_0221DD08: .4byte 0x0222522C
_0221DD0C: .4byte 0x022250EC
_0221DD10: .4byte 0x022251A4
_0221DD14: .4byte 0x0222502C
_0221DD18: .4byte 0x02225054
_0221DD1C: .4byte 0x02225144
_0221DD20: .4byte 0x022250B4
_0221DD24: .4byte 0x00002070
	thumb_func_end ov08_0221DC3C

	thumb_func_start ov08_0221DD28
ov08_0221DD28: @ 0x0221DD28
	ldr r1, _0221DD38 @ =0x00002070
	adds r2, r0, #0
	ldr r0, [r2, r1]
	adds r1, r1, #4
	ldr r3, _0221DD3C @ =FUN_0201D54C
	ldrb r1, [r2, r1]
	bx r3
	nop
_0221DD38: .4byte 0x00002070
_0221DD3C: .4byte FUN_0201D54C
	thumb_func_end ov08_0221DD28

	thumb_func_start ov08_0221DD40
ov08_0221DD40: @ 0x0221DD40
	push {r3, r4, r5, lr}
	ldr r1, _0221DD68 @ =0x00002070
	adds r5, r0, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldrb r1, [r5, r1]
	bl FUN_0201D54C
	ldr r0, _0221DD6C @ =0x00002050
	movs r4, #0
	adds r5, r5, r0
_0221DD56:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blo _0221DD56
	pop {r3, r4, r5, pc}
	nop
_0221DD68: .4byte 0x00002070
_0221DD6C: .4byte 0x00002050
	thumb_func_end ov08_0221DD40

	thumb_func_start ov08_0221DD70
ov08_0221DD70: @ 0x0221DD70
	push {r3, lr}
	cmp r1, #9
	bhi _0221DDCA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221DD82: @ jump table
	.2byte _0221DD96 - _0221DD82 - 2 @ case 0
	.2byte _0221DD9C - _0221DD82 - 2 @ case 1
	.2byte _0221DDA2 - _0221DD82 - 2 @ case 2
	.2byte _0221DDA8 - _0221DD82 - 2 @ case 3
	.2byte _0221DDAE - _0221DD82 - 2 @ case 4
	.2byte _0221DDB4 - _0221DD82 - 2 @ case 5
	.2byte _0221DDBA - _0221DD82 - 2 @ case 6
	.2byte _0221DDC0 - _0221DD82 - 2 @ case 7
	.2byte _0221DDBA - _0221DD82 - 2 @ case 8
	.2byte _0221DDC6 - _0221DD82 - 2 @ case 9
_0221DD96:
	bl ov08_0221F4A4
	pop {r3, pc}
_0221DD9C:
	bl ov08_0221F5D0
	pop {r3, pc}
_0221DDA2:
	bl ov08_0221F900
	pop {r3, pc}
_0221DDA8:
	bl ov08_0221F7C0
	pop {r3, pc}
_0221DDAE:
	bl ov08_0221FB18
	pop {r3, pc}
_0221DDB4:
	bl ov08_0221FF70
	pop {r3, pc}
_0221DDBA:
	bl ov08_0221FC7C
	pop {r3, pc}
_0221DDC0:
	bl ov08_0221FDA4
	pop {r3, pc}
_0221DDC6:
	bl ov08_02220084
_0221DDCA:
	pop {r3, pc}
	thumb_func_end ov08_0221DD70

	thumb_func_start ov08_0221DDCC
ov08_0221DDCC: @ 0x0221DDCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r6, r0, #0
	ldr r0, _0221DF5C @ =0x00002070
	str r3, [sp, #0x14]
	ldr r5, [r6, r0]
	lsls r4, r1, #4
	ldr r0, [sp, #0x14]
	movs r1, #0x50
	muls r1, r0, r1
	adds r7, r6, #4
	adds r0, r7, r1
	str r1, [sp, #0x24]
	ldr r1, [r6]
	str r0, [sp, #0x20]
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	str r2, [sp, #0x10]
	bl FUN_02026354
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x1c]
	ldr r0, _0221DF60 @ =0x00001FA8
	lsls r2, r1, #2
	ldr r1, _0221DF64 @ =0x02224FF4
	ldr r0, [r6, r0]
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	ldr r0, [r7, r0]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _0221DF68 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r6, r0]
	bl FUN_0200BF8C
	ldr r0, _0221DF68 @ =0x00001FAC
	ldr r1, [sp, #0x1c]
	ldr r0, [r6, r0]
	ldr r2, [sp, #0x18]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x10]
	add r3, sp, #0x38
	cmp r0, #0
	bne _0221DE4E
	ldrb r7, [r3, #0x14]
	movs r0, #0xff
	ldr r1, [sp, #0x10]
	str r7, [sp]
	str r0, [sp, #4]
	ldr r0, _0221DF6C @ =0x000F0E00
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	adds r0, r5, r4
	bl FUN_020200FC
	b _0221DE6A
_0221DE4E:
	ldrb r7, [r3, #0x14]
	movs r0, #0xff
	ldr r1, [sp, #0x10]
	str r7, [sp]
	str r0, [sp, #4]
	ldr r0, _0221DF70 @ =0x00070809
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	adds r0, r5, r4
	bl FUN_020200FC
_0221DE6A:
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, [sp, #0x20]
	ldrb r0, [r0, #0x16]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0221DF50
	ldr r0, [sp, #0x20]
	ldrb r0, [r0, #0x17]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1f
	bne _0221DF50
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	bne _0221DEEE
	ldr r0, _0221DF60 @ =0x00001FA8
	movs r1, #0x10
	ldr r0, [r6, r0]
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r5, r4
	bl FUN_0201EE90
	str r0, [sp, #0x28]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	ldr r1, [sp, #0x28]
	str r7, [sp]
	lsls r1, r1, #3
	subs r3, r1, r0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0221DED2
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221DF74 @ =0x00070800
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _0221DEE6
_0221DED2:
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221DF78 @ =0x000A0B00
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
_0221DEE6:
	adds r0, r6, #0
	bl FUN_02026380
	b _0221DF50
_0221DEEE:
	cmp r0, #1
	bne _0221DF50
	ldr r0, _0221DF60 @ =0x00001FA8
	movs r1, #0x11
	ldr r0, [r6, r0]
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r5, r4
	bl FUN_0201EE90
	str r0, [sp, #0x2c]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	ldr r1, [sp, #0x2c]
	str r7, [sp]
	lsls r1, r1, #3
	subs r3, r1, r0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0221DF36
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0xc1
	lsls r0, r0, #0xa
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r5, r4
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _0221DF4A
_0221DF36:
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221DF7C @ =0x000C0D00
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
_0221DF4A:
	adds r0, r6, #0
	bl FUN_02026380
_0221DF50:
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DF5C: .4byte 0x00002070
_0221DF60: .4byte 0x00001FA8
_0221DF64: .4byte 0x02224FF4
_0221DF68: .4byte 0x00001FAC
_0221DF6C: .4byte 0x000F0E00
_0221DF70: .4byte 0x00070809
_0221DF74: .4byte 0x00070800
_0221DF78: .4byte 0x000A0B00
_0221DF7C: .4byte 0x000C0D00
	thumb_func_end ov08_0221DDCC

	thumb_func_start ov08_0221DF80
ov08_0221DF80: @ 0x0221DF80
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221DFC4 @ =0x00002070
	lsls r4, r1, #4
	ldr r1, [r5, r0]
	adds r3, #8
	adds r1, r1, r4
	str r1, [sp, #4]
	str r3, [sp, #8]
	add r1, sp, #0x10
	ldrb r1, [r1, #0x10]
	movs r3, #0x50
	muls r3, r2, r3
	str r1, [sp, #0xc]
	adds r2, r5, r3
	ldrb r2, [r2, #0x1a]
	subs r0, #0xcc
	ldr r0, [r5, r0]
	lsls r2, r2, #0x19
	movs r1, #1
	lsrs r2, r2, #0x19
	movs r3, #3
	bl FUN_0200CE7C
	ldr r0, _0221DFC4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221DFC4: .4byte 0x00002070
	thumb_func_end ov08_0221DF80

	thumb_func_start ov08_0221DFC8
ov08_0221DFC8: @ 0x0221DFC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x50
	adds r7, r3, #0
	muls r0, r2, r0
	adds r3, r5, #4
	adds r0, r3, r0
	str r0, [sp, #0xc]
	add r0, sp, #0x18
	ldrb r6, [r0, #0x10]
	ldr r0, _0221E040 @ =0x00002070
	lsls r4, r1, #4
	ldr r1, [r5, r0]
	subs r0, #0xcc
	adds r1, r1, r4
	str r1, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r0, [r5, r0]
	ldrh r1, [r1, #0x10]
	movs r2, #3
	movs r3, #1
	bl FUN_0200CDF0
	adds r3, r7, #0
	ldr r2, _0221E044 @ =0x00001FA4
	str r6, [sp]
	ldr r0, [r5, r2]
	adds r2, #0xcc
	ldr r2, [r5, r2]
	movs r1, #0
	adds r2, r2, r4
	adds r3, #0x18
	bl FUN_0200CDAC
	ldr r0, _0221E040 @ =0x00002070
	adds r7, #0x20
	ldr r1, [r5, r0]
	subs r0, #0xcc
	adds r1, r1, r4
	str r1, [sp]
	str r7, [sp, #4]
	str r6, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r0, [r5, r0]
	ldrh r1, [r1, #0x12]
	movs r2, #3
	movs r3, #0
	bl FUN_0200CDF0
	ldr r0, _0221E040 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E040: .4byte 0x00002070
_0221E044: .4byte 0x00001FA4
	thumb_func_end ov08_0221DFC8

	thumb_func_start ov08_0221E048
ov08_0221E048: @ 0x0221E048
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x50
	str r1, [sp, #8]
	muls r0, r2, r0
	adds r1, r4, #4
	str r3, [sp, #0xc]
	adds r5, r1, r0
	ldrh r0, [r5, #0x10]
	ldrh r1, [r5, #0x12]
	movs r2, #0x30
	movs r7, #1
	bl FUN_02088068
	str r0, [sp, #0x14]
	ldrh r0, [r5, #0x10]
	ldrh r1, [r5, #0x12]
	movs r2, #0x30
	bl FUN_020880B0
	cmp r0, #4
	bhi _0221E0A6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E082: @ jump table
	.2byte _0221E08C - _0221E082 - 2 @ case 0
	.2byte _0221E0A4 - _0221E082 - 2 @ case 1
	.2byte _0221E0A0 - _0221E082 - 2 @ case 2
	.2byte _0221E09E - _0221E082 - 2 @ case 3
	.2byte _0221E09E - _0221E082 - 2 @ case 4
_0221E08C:
	ldr r0, _0221E11C @ =0x00002070
	ldr r1, [r4, r0]
	ldr r0, [sp, #8]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0221E09E:
	b _0221E0A6
_0221E0A0:
	movs r7, #3
	b _0221E0A6
_0221E0A4:
	movs r7, #5
_0221E0A6:
	add r0, sp, #0x20
	ldrb r6, [r0, #0x10]
	adds r0, r7, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	lsls r5, r0, #4
	ldr r0, [sp, #0x14]
	adds r3, r6, #1
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E11C @ =0x00002070
	lsls r1, r1, #0x18
	ldr r0, [r4, r0]
	lsls r3, r3, #0x10
	ldr r2, [sp, #0xc]
	adds r0, r0, r5
	lsrs r1, r1, #0x18
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	ldr r0, [sp, #0x14]
	adds r3, r6, #2
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _0221E11C @ =0x00002070
	lsls r3, r3, #0x10
	ldr r0, [r4, r0]
	ldr r2, [sp, #0xc]
	adds r0, r0, r5
	adds r1, r7, #0
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E11C @ =0x00002070
	adds r3, r6, #4
	ldr r0, [r4, r0]
	lsls r1, r1, #0x18
	lsls r3, r3, #0x10
	ldr r2, [sp, #0xc]
	adds r0, r0, r5
	lsrs r1, r1, #0x18
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	ldr r0, _0221E11C @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, r0, r5
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E11C: .4byte 0x00002070
	thumb_func_end ov08_0221E048

	thumb_func_start ov08_0221E120
ov08_0221E120: @ 0x0221E120
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5]
	movs r0, #0x10
	ldr r1, [r1, #0xc]
	adds r7, r2, #0
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, _0221E198 @ =0x00001FA8
	movs r1, #8
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r2, #0x50
	muls r2, r7, r2
	str r0, [sp, #0x10]
	ldr r0, _0221E19C @ =0x00001FAC
	adds r2, r5, r2
	ldrh r2, [r2, #0x1c]
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200C060
	ldr r0, _0221E19C @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E1A0 @ =0x000F0E00
	lsls r4, r4, #4
	str r0, [sp, #8]
	ldr r0, _0221E1A4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r2, r6, #0
	adds r0, r0, r4
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E1A4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E198: .4byte 0x00001FA8
_0221E19C: .4byte 0x00001FAC
_0221E1A0: .4byte 0x000F0E00
_0221E1A4: .4byte 0x00002070
	thumb_func_end ov08_0221E120

	thumb_func_start ov08_0221E1A8
ov08_0221E1A8: @ 0x0221E1A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x50
	adds r7, r1, #0
	adds r1, r4, #4
	muls r0, r2, r0
	adds r5, r1, r0
	ldrh r0, [r5, #0x1a]
	cmp r0, #0
	bne _0221E1CC
	ldr r0, _0221E234 @ =0x00001FA8
	movs r1, #0x14
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	adds r6, r0, #0
	b _0221E202
_0221E1CC:
	ldr r1, [r4]
	movs r0, #0x12
	ldr r1, [r1, #0xc]
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, _0221E234 @ =0x00001FA8
	movs r1, #9
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	ldr r0, _0221E238 @ =0x00001FAC
	ldrh r2, [r5, #0x1a]
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200C0CC
	ldr r0, _0221E238 @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r4, r0]
	adds r1, r6, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
_0221E202:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E23C @ =0x000F0E00
	lsls r5, r7, #4
	str r0, [sp, #8]
	ldr r0, _0221E240 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	adds r2, r6, #0
	adds r0, r0, r5
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E240 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, r0, r5
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E234: .4byte 0x00001FA8
_0221E238: .4byte 0x00001FAC
_0221E23C: .4byte 0x000F0E00
_0221E240: .4byte 0x00002070
	thumb_func_end ov08_0221E1A8

	thumb_func_start ov08_0221E244
ov08_0221E244: @ 0x0221E244
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, _0221E2DC @ =0x00002070
	ldr r1, [r1, #0xc]
	ldr r4, [r5, r0]
	movs r0, #0x10
	str r3, [sp, #0x14]
	lsls r6, r2, #4
	bl FUN_02026354
	adds r7, r0, #0
	ldr r0, _0221E2E0 @ =0x00001FA8
	ldr r1, [sp, #0x14]
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	ldr r0, _0221E2E4 @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200BFF0
	ldr r0, _0221E2E4 @ =0x00001FAC
	ldr r2, [sp, #0x18]
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200CBBC
	add r0, sp, #0x20
	ldrh r0, [r0, #0x10]
	cmp r0, #4
	bne _0221E2A8
	adds r0, r4, r6
	bl FUN_0201EE90
	adds r5, r0, #0
	add r0, sp, #0x20
	ldrh r0, [r0, #0x10]
	adds r1, r7, #0
	movs r2, #0
	bl FUN_02002F30
	lsls r1, r5, #3
	subs r0, r1, r0
	lsrs r3, r0, #1
	b _0221E2AA
_0221E2A8:
	movs r3, #0
_0221E2AA:
	add r1, sp, #0x20
	ldrh r0, [r1, #0x14]
	adds r2, r7, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r1, [r1, #0x10]
	adds r0, r4, r6
	bl FUN_020200FC
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E2DC: .4byte 0x00002070
_0221E2E0: .4byte 0x00001FA8
_0221E2E4: .4byte 0x00001FAC
	thumb_func_end ov08_0221E244

	thumb_func_start ov08_0221E2E8
ov08_0221E2E8: @ 0x0221E2E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _0221E334 @ =0x00001FA8
	str r2, [sp, #0x10]
	adds r5, r1, #0
	ldr r0, [r4, r0]
	adds r6, r3, #0
	movs r1, #0xe
	bl FUN_0200BBA0
	adds r7, r0, #0
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E338 @ =0x000F0E00
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0221E33C @ =0x00002070
	lsls r5, r5, #4
	ldr r0, [r4, r0]
	ldr r3, [sp, #0x10]
	adds r0, r0, r5
	adds r2, r7, #0
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, _0221E33C @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, r0, r5
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221E334: .4byte 0x00001FA8
_0221E338: .4byte 0x000F0E00
_0221E33C: .4byte 0x00002070
	thumb_func_end ov08_0221E2E8

	thumb_func_start ov08_0221E340
ov08_0221E340: @ 0x0221E340
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0221E398 @ =0x00002050
	adds r5, r1, #0
	movs r1, #1
	adds r0, r4, r0
	adds r2, r1, #0
	movs r3, #0xe
	bl FUN_0200E998
	ldr r0, _0221E398 @ =0x00002050
	movs r1, #0xf
	adds r0, r4, r0
	bl FUN_0201D978
	ldr r0, _0221E39C @ =0x00001FA8
	adds r1, r5, #0
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E3A0 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	ldr r0, _0221E398 @ =0x00002050
	adds r2, r5, #0
	adds r0, r4, r0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, _0221E398 @ =0x00002050
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221E398: .4byte 0x00002050
_0221E39C: .4byte 0x00001FA8
_0221E3A0: .4byte 0x00010200
	thumb_func_end ov08_0221E340

	thumb_func_start ov08_0221E3A4
ov08_0221E3A4: @ 0x0221E3A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r3, _0221E400 @ =0x00002070
	lsls r4, r1, #4
	ldr r5, [r0, r3]
	subs r3, #0xc8
	ldr r0, [r0, r3]
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #4
	adds r1, r7, #0
	movs r2, #0
	bl FUN_02002F30
	adds r6, r0, #0
	adds r0, r5, r4
	bl FUN_0201EE90
	adds r3, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E404 @ =0x00070809
	lsls r3, r3, #3
	str r0, [sp, #8]
	movs r0, #0
	subs r3, r3, r6
	str r0, [sp, #0xc]
	adds r0, r5, r4
	movs r1, #4
	adds r2, r7, #0
	lsrs r3, r3, #1
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E400: .4byte 0x00002070
_0221E404: .4byte 0x00070809
	thumb_func_end ov08_0221E3A4

	thumb_func_start ov08_0221E408
ov08_0221E408: @ 0x0221E408
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	movs r0, #0x50
	muls r0, r1, r0
	adds r2, r5, #4
	adds r4, r2, r0
	ldr r1, _0221E5C4 @ =0x00002075
	movs r0, #0x16
	ldrb r2, [r5, r1]
	subs r1, #0xcd
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0x17
	bl FUN_0200BBA0
	movs r1, #0
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221E5C8 @ =0x000F0E00
	adds r0, #0x31
	str r2, [sp, #8]
	ldr r2, _0221E5CC @ =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r3, r1, #0
	adds r0, r2, r0
	adds r2, r7, #0
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, _0221E5D0 @ =0x00001FA8
	movs r1, #0x18
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x18]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	str r0, [sp, #0x1c]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldrb r2, [r4, #0x16]
	ldr r0, _0221E5D4 @ =0x00001FAC
	movs r3, #3
	lsls r2, r2, #0x19
	ldr r0, [r5, r0]
	lsrs r2, r2, #0x19
	bl FUN_0200BFCC
	ldr r0, _0221E5D4 @ =0x00001FAC
	ldr r1, [sp, #0x1c]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x18]
	bl FUN_0200CBBC
	movs r1, #0
	adds r0, r6, #0
	adds r0, #0xb
	lsls r7, r0, #4
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E5C8 @ =0x000F0E00
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	ldr r0, _0221E5CC @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	adds r0, r0, r7
	bl FUN_020200FC
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, _0221E5D0 @ =0x00001FA8
	movs r1, #0x19
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r1, #0
	str r0, [sp, #0x20]
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221E5C8 @ =0x000F0E00
	adds r0, #0x41
	str r2, [sp, #8]
	ldr r2, _0221E5CC @ =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r3, r1, #0
	adds r0, r2, r0
	ldr r2, [sp, #0x20]
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	ldr r0, _0221E5D0 @ =0x00001FA8
	movs r1, #0x1a
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	movs r0, #0xe
	bl FUN_02026354
	str r0, [sp, #0x10]
	ldrb r0, [r4, #0x16]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0x64
	bhs _0221E528
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221E5D4 @ =0x00001FAC
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x1c]
	ldr r0, [r5, r0]
	subs r2, r2, r3
	movs r1, #0
	movs r3, #6
	bl FUN_0200BFCC
	b _0221E53C
_0221E528:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221E5D4 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	movs r3, #6
	bl FUN_0200BFCC
_0221E53C:
	ldr r0, _0221E5D4 @ =0x00001FAC
	ldr r1, [sp, #0x10]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x14]
	bl FUN_0200CBBC
	ldr r0, _0221E5CC @ =0x00002070
	adds r6, #0xc
	ldr r0, [r5, r0]
	lsls r4, r6, #4
	adds r0, r0, r4
	bl FUN_0201EE90
	adds r6, r0, #0
	movs r0, #0
	ldr r1, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r1, r6, #3
	subs r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E5D8 @ =0x00010200
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, _0221E5CC @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	ldr r0, _0221E5CC @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221E5CC @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r7
	bl FUN_0201D5C8
	ldr r0, _0221E5CC @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221E5CC @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E5C4: .4byte 0x00002075
_0221E5C8: .4byte 0x000F0E00
_0221E5CC: .4byte 0x00002070
_0221E5D0: .4byte 0x00001FA8
_0221E5D4: .4byte 0x00001FAC
_0221E5D8: .4byte 0x00010200
	thumb_func_end ov08_0221E408

	thumb_func_start ov08_0221E5DC
ov08_0221E5DC: @ 0x0221E5DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	adds r5, r0, #0
	ldr r1, _0221E6C0 @ =0x00002075
	movs r0, #0x16
	ldrb r2, [r5, r1]
	subs r1, #0xcd
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0x20
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E6C4 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E6C8 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	adds r0, #0xe0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E6CC @ =0x00001FA8
	movs r1, #0x21
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	movs r2, #0x50
	adds r6, r0, #0
	muls r2, r7, r2
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E6D0 @ =0x00001FAC
	adds r2, r5, r2
	ldrh r2, [r2, #0xa]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221E6D0 @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #5
	lsls r4, r0, #4
	ldr r0, _0221E6C8 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsls r0, r0, #0x18
	movs r1, #0
	lsrs r3, r0, #0x18
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E6D4 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E6C8 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E6C8 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0xe0
	bl FUN_0201D5C8
	ldr r0, _0221E6C8 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221E6C0: .4byte 0x00002075
_0221E6C4: .4byte 0x000F0E00
_0221E6C8: .4byte 0x00002070
_0221E6CC: .4byte 0x00001FA8
_0221E6D0: .4byte 0x00001FAC
_0221E6D4: .4byte 0x00010200
	thumb_func_end ov08_0221E5DC

	thumb_func_start ov08_0221E6D8
ov08_0221E6D8: @ 0x0221E6D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	adds r5, r0, #0
	ldr r1, _0221E7BC @ =0x00002075
	movs r0, #0x16
	ldrb r2, [r5, r1]
	subs r1, #0xcd
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0x22
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E7C0 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E7C4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	adds r0, #0xf0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E7C8 @ =0x00001FA8
	movs r1, #0x23
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	movs r2, #0x50
	adds r6, r0, #0
	muls r2, r7, r2
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E7CC @ =0x00001FAC
	adds r2, r5, r2
	ldrh r2, [r2, #0xc]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221E7CC @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #6
	lsls r4, r0, #4
	ldr r0, _0221E7C4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsls r0, r0, #0x18
	movs r1, #0
	lsrs r3, r0, #0x18
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E7D0 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E7C4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E7C4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0xf0
	bl FUN_0201D5C8
	ldr r0, _0221E7C4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221E7BC: .4byte 0x00002075
_0221E7C0: .4byte 0x000F0E00
_0221E7C4: .4byte 0x00002070
_0221E7C8: .4byte 0x00001FA8
_0221E7CC: .4byte 0x00001FAC
_0221E7D0: .4byte 0x00010200
	thumb_func_end ov08_0221E6D8

	thumb_func_start ov08_0221E7D4
ov08_0221E7D4: @ 0x0221E7D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	adds r5, r0, #0
	ldr r1, _0221E8BC @ =0x00002075
	movs r0, #0x16
	ldrb r2, [r5, r1]
	subs r1, #0xcd
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0x28
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0221E8C0 @ =0x000F0E00
	adds r2, r2, #1
	str r0, [sp, #8]
	ldr r0, _0221E8C4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	adds r0, r0, r2
	adds r2, r6, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E8C8 @ =0x00001FA8
	movs r1, #0x29
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	movs r2, #0x50
	adds r6, r0, #0
	muls r2, r7, r2
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E8CC @ =0x00001FAC
	adds r2, r5, r2
	ldrh r2, [r2, #0xe]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221E8CC @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #7
	lsls r4, r0, #4
	ldr r0, _0221E8C4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsls r0, r0, #0x18
	movs r1, #0
	lsrs r3, r0, #0x18
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E8D0 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E8C4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E8C4 @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221E8C4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E8BC: .4byte 0x00002075
_0221E8C0: .4byte 0x000F0E00
_0221E8C4: .4byte 0x00002070
_0221E8C8: .4byte 0x00001FA8
_0221E8CC: .4byte 0x00001FAC
_0221E8D0: .4byte 0x00010200
	thumb_func_end ov08_0221E7D4

	thumb_func_start ov08_0221E8D4
ov08_0221E8D4: @ 0x0221E8D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	adds r4, r0, #0
	ldr r1, _0221E9BC @ =0x00002075
	movs r0, #0x16
	ldrb r2, [r4, r1]
	subs r1, #0xcd
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, r1]
	movs r1, #0x24
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221E9C0 @ =0x000F0E00
	adds r0, #0x11
	str r2, [sp, #8]
	ldr r2, _0221E9C4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	adds r3, r1, #0
	adds r0, r2, r0
	adds r2, r6, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E9C8 @ =0x00001FA8
	movs r1, #0x25
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	ldr r1, [r4]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	movs r2, #0x50
	adds r6, r0, #0
	muls r2, r7, r2
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E9CC @ =0x00001FAC
	adds r2, r4, r2
	ldrh r2, [r2, #0x10]
	ldr r0, [r4, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221E9CC @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r4, r0]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0221E9C4 @ =0x00002070
	adds r5, #8
	ldr r0, [r4, r0]
	lsls r5, r5, #4
	adds r0, r0, r5
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsls r0, r0, #0x18
	movs r1, #0
	lsrs r3, r0, #0x18
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E9D0 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221E9C4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	adds r0, r0, r5
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221E9C4 @ =0x00002070
	ldr r1, [r4, r0]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221E9C4 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, r0, r5
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221E9BC: .4byte 0x00002075
_0221E9C0: .4byte 0x000F0E00
_0221E9C4: .4byte 0x00002070
_0221E9C8: .4byte 0x00001FA8
_0221E9CC: .4byte 0x00001FAC
_0221E9D0: .4byte 0x00010200
	thumb_func_end ov08_0221E8D4

	thumb_func_start ov08_0221E9D4
ov08_0221E9D4: @ 0x0221E9D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	adds r4, r0, #0
	ldr r1, _0221EABC @ =0x00002075
	movs r0, #0x16
	ldrb r2, [r4, r1]
	subs r1, #0xcd
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, [r4, r1]
	movs r1, #0x26
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r2, _0221EAC0 @ =0x000F0E00
	adds r0, #0x21
	str r2, [sp, #8]
	ldr r2, _0221EAC4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r2, [r4, r2]
	adds r3, r1, #0
	adds r0, r2, r0
	adds r2, r6, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221EAC8 @ =0x00001FA8
	movs r1, #0x27
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	ldr r1, [r4]
	str r0, [sp, #0x10]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	movs r2, #0x50
	adds r6, r0, #0
	muls r2, r7, r2
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EACC @ =0x00001FAC
	adds r2, r4, r2
	ldrh r2, [r2, #0x12]
	ldr r0, [r4, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221EACC @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r4, r0]
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r6, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0221EAC4 @ =0x00002070
	adds r5, #9
	ldr r0, [r4, r0]
	lsls r5, r5, #4
	adds r0, r0, r5
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsls r0, r0, #0x18
	movs r1, #0
	lsrs r3, r0, #0x18
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EAD0 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221EAC4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r4, r0]
	adds r0, r0, r5
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221EAC4 @ =0x00002070
	ldr r1, [r4, r0]
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221EAC4 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, r0, r5
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221EABC: .4byte 0x00002075
_0221EAC0: .4byte 0x000F0E00
_0221EAC4: .4byte 0x00002070
_0221EAC8: .4byte 0x00001FA8
_0221EACC: .4byte 0x00001FAC
_0221EAD0: .4byte 0x00010200
	thumb_func_end ov08_0221E9D4

	thumb_func_start ov08_0221EAD4
ov08_0221EAD4: @ 0x0221EAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	movs r0, #0x50
	muls r0, r1, r0
	adds r2, r5, #4
	adds r7, r2, r0
	ldr r1, _0221EC54 @ =0x00002075
	movs r0, #0x16
	ldrb r2, [r5, r1]
	subs r1, #0xcd
	muls r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5, r1]
	movs r1, #0x1c
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC58 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221EC5C @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	adds r0, #0xd0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _0221EC60 @ =0x00001FA8
	movs r1, #0x1f
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_02002F30
	str r0, [sp, #0x14]
	ldr r0, _0221EC5C @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201EE90
	lsls r1, r0, #3
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	subs r0, r1, r0
	lsls r0, r0, #0xf
	lsrs r6, r0, #0x10
	adds r0, r4, #4
	movs r1, #0
	lsls r4, r0, #4
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC64 @ =0x00010200
	adds r3, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221EC5C @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	ldr r0, _0221EC60 @ =0x00001FA8
	movs r1, #0x1d
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x18]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	str r0, [sp, #0x1c]
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EC68 @ =0x00001FAC
	ldrh r2, [r7, #0x10]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221EC68 @ =0x00001FAC
	ldr r1, [sp, #0x1c]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x18]
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x1c]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC64 @ =0x00010200
	ldr r2, [sp, #0x1c]
	str r0, [sp, #8]
	ldr r0, _0221EC5C @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	subs r3, r6, r3
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, _0221EC60 @ =0x00001FA8
	movs r1, #0x1e
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x20]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	str r0, [sp, #0x24]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EC68 @ =0x00001FAC
	ldrh r2, [r7, #0x12]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221EC68 @ =0x00001FAC
	ldr r1, [sp, #0x24]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x20]
	bl FUN_0200CBBC
	movs r1, #0
	ldr r3, [sp, #0x14]
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC64 @ =0x00010200
	ldr r2, [sp, #0x24]
	str r0, [sp, #8]
	ldr r0, _0221EC5C @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r6, r3
	adds r0, r0, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	ldr r0, _0221EC5C @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0xd0
	bl FUN_0201D5C8
	ldr r0, _0221EC5C @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221EC54: .4byte 0x00002075
_0221EC58: .4byte 0x000F0E00
_0221EC5C: .4byte 0x00002070
_0221EC60: .4byte 0x00001FA8
_0221EC64: .4byte 0x00010200
_0221EC68: .4byte 0x00001FAC
	thumb_func_end ov08_0221EAD4

	thumb_func_start ov08_0221EC6C
ov08_0221EC6C: @ 0x0221EC6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0221ECD8 @ =0x00002075
	adds r6, r1, #0
	ldrb r1, [r5, r0]
	ldr r3, [r5]
	movs r0, #0x16
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r2, _0221ECDC @ =0x000002D2
	ldr r3, [r3, #0xc]
	movs r0, #1
	movs r1, #0x1b
	bl FUN_0200BAF8
	movs r1, #0x50
	muls r1, r6, r1
	adds r1, r5, r1
	ldrh r1, [r1, #0x1c]
	adds r7, r0, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r1, #0
	adds r0, r4, #2
	lsls r4, r0, #4
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ECE0 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	ldr r0, _0221ECE4 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	adds r0, r0, r4
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	ldr r0, _0221ECE4 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221ECD8: .4byte 0x00002075
_0221ECDC: .4byte 0x000002D2
_0221ECE0: .4byte 0x00010200
_0221ECE4: .4byte 0x00002070
	thumb_func_end ov08_0221EC6C

	thumb_func_start ov08_0221ECE8
ov08_0221ECE8: @ 0x0221ECE8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r2, _0221ED28 @ =0x00002070
	lsls r4, r1, #4
	ldr r5, [r0, r2]
	subs r2, #0xc8
	ldr r0, [r0, r2]
	movs r1, #0x33
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ED2C @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221ED28: .4byte 0x00002070
_0221ED2C: .4byte 0x000F0E00
	thumb_func_end ov08_0221ECE8

	thumb_func_start ov08_0221ED30
ov08_0221ED30: @ 0x0221ED30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r2, [sp, #0x10]
	adds r5, r0, #0
	ldr r2, _0221EE0C @ =0x00002070
	ldr r0, [sp, #0x10]
	lsls r6, r1, #4
	ldr r4, [r5, r2]
	cmp r0, #0
	bne _0221ED8A
	subs r2, #0xc8
	ldr r0, [r5, r2]
	movs r1, #0x32
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, r6
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r5
	lsls r0, r0, #0x10
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE10 @ =0x00010200
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r4, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	b _0221EE00
_0221ED8A:
	subs r2, #0xc8
	ldr r0, [r5, r2]
	movs r1, #0x34
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EE14 @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221EE14 @ =0x00001FAC
	ldr r2, [sp, #0x14]
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, r6
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r5
	lsls r0, r0, #0x10
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE10 @ =0x00010200
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r4, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
_0221EE00:
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221EE0C: .4byte 0x00002070
_0221EE10: .4byte 0x00010200
_0221EE14: .4byte 0x00001FAC
	thumb_func_end ov08_0221ED30

	thumb_func_start ov08_0221EE18
ov08_0221EE18: @ 0x0221EE18
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r2, _0221EE58 @ =0x00002070
	lsls r4, r1, #4
	ldr r5, [r0, r2]
	subs r2, #0xc8
	ldr r0, [r0, r2]
	movs r1, #0x30
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE5C @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221EE58: .4byte 0x00002070
_0221EE5C: .4byte 0x000F0E00
	thumb_func_end ov08_0221EE18

	thumb_func_start ov08_0221EE60
ov08_0221EE60: @ 0x0221EE60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r2, [sp, #0x10]
	adds r5, r0, #0
	ldr r2, _0221EF3C @ =0x00002070
	ldr r0, [sp, #0x10]
	lsls r6, r1, #4
	ldr r4, [r5, r2]
	cmp r0, #1
	bhi _0221EEBA
	subs r2, #0xc8
	ldr r0, [r5, r2]
	movs r1, #0x32
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, r6
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r5
	lsls r0, r0, #0x10
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EF40 @ =0x00010200
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r4, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	b _0221EF30
_0221EEBA:
	subs r2, #0xc8
	ldr r0, [r5, r2]
	movs r1, #0x31
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	movs r0, #8
	bl FUN_02026354
	movs r1, #0
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EF44 @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221EF44 @ =0x00001FAC
	ldr r2, [sp, #0x14]
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, r6
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r5
	lsls r0, r0, #0x10
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EF40 @ =0x00010200
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r4, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
_0221EF30:
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221EF3C: .4byte 0x00002070
_0221EF40: .4byte 0x00010200
_0221EF44: .4byte 0x00001FAC
	thumb_func_end ov08_0221EE60

	thumb_func_start ov08_0221EF48
ov08_0221EF48: @ 0x0221EF48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r3, r0, #0
	ldr r0, _0221EF9C @ =0x00002070
	adds r6, r2, #0
	ldr r5, [r3, r0]
	ldr r3, [r3]
	lsls r4, r1, #4
	ldr r2, _0221EFA0 @ =0x000002ED
	ldr r3, [r3, #0xc]
	movs r0, #1
	movs r1, #0x1b
	bl FUN_0200BAF8
	adds r1, r6, #0
	adds r7, r0, #0
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EFA4 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221EF9C: .4byte 0x00002070
_0221EFA0: .4byte 0x000002ED
_0221EFA4: .4byte 0x00010200
	thumb_func_end ov08_0221EF48

	thumb_func_start ov08_0221EFA8
ov08_0221EFA8: @ 0x0221EFA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r2, _0221F004 @ =0x00002070
	lsls r4, r1, #4
	ldr r5, [r0, r2]
	subs r2, #0xc8
	ldr r0, [r0, r2]
	movs r1, #0x35
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r5, r4
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r1, r0, r6
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0xf
	movs r1, #0
	lsrs r3, r0, #0x10
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F008 @ =0x000F0E00
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F004: .4byte 0x00002070
_0221F008: .4byte 0x000F0E00
	thumb_func_end ov08_0221EFA8

	thumb_func_start ov08_0221F00C
ov08_0221F00C: @ 0x0221F00C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r3, _0221F074 @ =0x00002070
	lsls r4, r1, #4
	ldr r5, [r0, r3]
	cmp r2, #0
	beq _0221F024
	cmp r2, #1
	beq _0221F032
	cmp r2, #2
	beq _0221F040
	b _0221F04C
_0221F024:
	subs r3, #0xc8
	ldr r0, [r0, r3]
	movs r1, #0x36
	bl FUN_0200BBA0
	adds r6, r0, #0
	b _0221F04C
_0221F032:
	subs r3, #0xc8
	ldr r0, [r0, r3]
	movs r1, #0x38
	bl FUN_0200BBA0
	adds r6, r0, #0
	b _0221F04C
_0221F040:
	subs r3, #0xc8
	ldr r0, [r0, r3]
	movs r1, #0x37
	bl FUN_0200BBA0
	adds r6, r0, #0
_0221F04C:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F078 @ =0x00010200
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221F074: .4byte 0x00002070
_0221F078: .4byte 0x00010200
	thumb_func_end ov08_0221F00C

	thumb_func_start ov08_0221F07C
ov08_0221F07C: @ 0x0221F07C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r0, #0
	ldr r0, _0221F1A0 @ =0x00002070
	lsls r6, r1, #4
	ldr r4, [r5, r0]
	subs r0, #0xc8
	ldr r0, [r5, r0]
	movs r1, #0x2e
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	str r0, [sp, #0x1c]
	adds r0, r4, r6
	bl FUN_0201EE90
	lsls r1, r0, #3
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x18]
	subs r0, r1, r0
	lsrs r7, r0, #1
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F1A4 @ =0x000F0E00
	adds r3, r7, #0
	str r0, [sp, #8]
	adds r0, r4, r6
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, _0221F1A8 @ =0x00001FA8
	movs r1, #0x2c
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x20]
	ldr r1, [r1, #0xc]
	movs r0, #6
	bl FUN_02026354
	movs r1, #0
	str r0, [sp, #0x24]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221F1AC @ =0x00001FAC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221F1AC @ =0x00001FAC
	ldr r1, [sp, #0x24]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x20]
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x24]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F1A4 @ =0x000F0E00
	ldr r2, [sp, #0x24]
	str r0, [sp, #8]
	adds r0, r4, r6
	subs r3, r7, r3
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	ldr r0, _0221F1A8 @ =0x00001FA8
	movs r1, #0x2d
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	ldr r1, [r5]
	str r0, [sp, #0x28]
	ldr r1, [r1, #0xc]
	movs r0, #6
	bl FUN_02026354
	movs r1, #0
	str r0, [sp, #0x2c]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221F1AC @ =0x00001FAC
	ldr r2, [sp, #0x14]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, _0221F1AC @ =0x00001FAC
	ldr r1, [sp, #0x2c]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x28]
	bl FUN_0200CBBC
	movs r1, #0
	ldr r3, [sp, #0x1c]
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F1A4 @ =0x000F0E00
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	adds r0, r4, r6
	adds r3, r7, r3
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x28]
	bl FUN_02026380
	ldr r0, [sp, #0x2c]
	bl FUN_02026380
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F1A0: .4byte 0x00002070
_0221F1A4: .4byte 0x000F0E00
_0221F1A8: .4byte 0x00001FA8
_0221F1AC: .4byte 0x00001FAC
	thumb_func_end ov08_0221F07C

	thumb_func_start ov08_0221F1B0
ov08_0221F1B0: @ 0x0221F1B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r4, r1, #4
	ldr r1, [r0]
	ldr r2, _0221F218 @ =0x00002070
	adds r1, #0x34
	ldrb r1, [r1]
	ldr r5, [r0, r2]
	cmp r1, #4
	bne _0221F1D0
	subs r2, #0xc8
	ldr r0, [r0, r2]
	movs r1, #0x3b
	bl FUN_0200BBA0
	b _0221F1DA
_0221F1D0:
	subs r2, #0xc8
	ldr r0, [r0, r2]
	movs r1, #0x3a
	bl FUN_0200BBA0
_0221F1DA:
	adds r6, r0, #0
	movs r0, #4
	adds r1, r6, #0
	movs r2, #0
	bl FUN_02002F30
	adds r7, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F21C @ =0x00070809
	movs r3, #0x60
	str r0, [sp, #8]
	movs r0, #0
	subs r3, r3, r7
	str r0, [sp, #0xc]
	adds r0, r5, r4
	movs r1, #4
	adds r2, r6, #0
	lsrs r3, r3, #1
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F218: .4byte 0x00002070
_0221F21C: .4byte 0x00070809
	thumb_func_end ov08_0221F1B0

	thumb_func_start ov08_0221F220
ov08_0221F220: @ 0x0221F220
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, _0221F278 @ =0x0000207A
	ldrb r1, [r4, r0]
	cmp r1, #7
	bne _0221F236
	subs r0, #0xa
	ldr r5, [r4, r0]
	adds r5, #0x80
	b _0221F23C
_0221F236:
	subs r0, #0xa
	ldr r5, [r4, r0]
	adds r5, #0x50
_0221F23C:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221F27C @ =0x00001FA8
	movs r1, #0x3c
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F280 @ =0x00010200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221F278: .4byte 0x0000207A
_0221F27C: .4byte 0x00001FA8
_0221F280: .4byte 0x00010200
	thumb_func_end ov08_0221F220

	thumb_func_start ov08_0221F284
ov08_0221F284: @ 0x0221F284
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	str r1, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, _0221F3C0 @ =0x00002070
	ldr r1, [r1, #0xc]
	ldr r4, [r5, r0]
	movs r0, #6
	lsls r6, r2, #4
	bl FUN_02026354
	adds r7, r0, #0
	ldr r0, _0221F3C4 @ =0x00001FA8
	movs r1, #0x2b
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	str r0, [sp, #0x14]
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 @ =0x000F0E00
	ldr r2, [sp, #0x14]
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r4, r6
	movs r3, #0x28
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	ldr r0, _0221F3C4 @ =0x00001FA8
	movs r1, #0x2e
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	str r0, [sp, #0x1c]
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 @ =0x000F0E00
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r4, r6
	movs r3, #0x50
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, _0221F3C4 @ =0x00001FA8
	movs r1, #0x2d
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r1, #0
	str r0, [sp, #0x20]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, _0221F3CC @ =0x00001FAC
	ldrb r2, [r2, #3]
	ldr r0, [r5, r0]
	movs r3, #2
	bl FUN_0200BFCC
	ldr r0, _0221F3CC @ =0x00001FAC
	ldr r2, [sp, #0x20]
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200CBBC
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 @ =0x000F0E00
	ldr r3, [sp, #0x1c]
	str r0, [sp, #8]
	movs r1, #0
	adds r3, #0x50
	adds r0, r4, r6
	adds r2, r7, #0
	str r1, [sp, #0xc]
	str r3, [sp, #0x1c]
	bl FUN_020200FC
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	ldr r0, _0221F3C4 @ =0x00001FA8
	movs r1, #0x2c
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r1, #0
	str r0, [sp, #0x24]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, _0221F3CC @ =0x00001FAC
	ldrb r2, [r2, #2]
	ldr r0, [r5, r0]
	movs r3, #2
	bl FUN_0200BFCC
	ldr r0, _0221F3CC @ =0x00001FAC
	ldr r2, [sp, #0x24]
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r5, r0, #0
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F3C8 @ =0x000F0E00
	movs r3, #0x50
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r4, r6
	adds r2, r7, #0
	subs r3, r3, r5
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F3C0: .4byte 0x00002070
_0221F3C4: .4byte 0x00001FA8
_0221F3C8: .4byte 0x000F0E00
_0221F3CC: .4byte 0x00001FAC
	thumb_func_end ov08_0221F284

	thumb_func_start ov08_0221F3D0
ov08_0221F3D0: @ 0x0221F3D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp, #0x10]
	ldr r1, [r5]
	ldr r0, _0221F494 @ =0x00002070
	ldr r1, [r1, #0xc]
	ldr r4, [r5, r0]
	movs r0, #6
	lsls r6, r2, #4
	bl FUN_02026354
	str r0, [sp, #0x14]
	ldr r0, _0221F498 @ =0x00001FA8
	movs r1, #0x2b
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	movs r0, #0
	ldr r1, [sp, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r7, r0, #0
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	adds r7, #0x28
	movs r0, #0x50
	subs r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x10
	lsls r2, r7, #0x10
	str r0, [sp, #4]
	adds r0, r4, r6
	movs r1, #0
	lsrs r2, r2, #0x10
	movs r3, #0x18
	bl FUN_0201DA74
	ldr r0, _0221F498 @ =0x00001FA8
	movs r1, #0x2c
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r1, #0
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	ldr r0, _0221F49C @ =0x00001FAC
	ldrb r2, [r2, #2]
	ldr r0, [r5, r0]
	movs r3, #2
	bl FUN_0200BFCC
	ldr r0, _0221F49C @ =0x00001FAC
	ldr r1, [sp, #0x14]
	ldr r0, [r5, r0]
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x14]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r5, r0, #0
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F4A0 @ =0x000F0E00
	movs r3, #0x50
	str r0, [sp, #8]
	movs r1, #0
	ldr r2, [sp, #0x14]
	adds r0, r4, r6
	subs r3, r3, r5
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0221F494: .4byte 0x00002070
_0221F498: .4byte 0x00001FA8
_0221F49C: .4byte 0x00001FAC
_0221F4A0: .4byte 0x000F0E00
	thumb_func_end ov08_0221F3D0

	thumb_func_start ov08_0221F4A4
ov08_0221F4A4: @ 0x0221F4A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5]
	movs r4, #0
	ldr r0, [r0]
	bl FUN_02074640
	cmp r0, #0
	ble _0221F52A
	adds r0, r4, #0
	adds r7, r5, #0
	str r0, [sp, #8]
	adds r6, r5, #0
	adds r7, #0x1b
_0221F4C2:
	ldr r0, _0221F54C @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #8]
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldrh r0, [r6, #8]
	cmp r0, #0
	beq _0221F512
	movs r0, #0x20
	str r0, [sp]
	movs r0, #7
	lsls r3, r4, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #4
	lsrs r3, r3, #0x10
	bl ov08_0221DDCC
	ldrb r0, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0221F4FE
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov08_0221F550
_0221F4FE:
	ldr r0, [r6, #4]
	bl FUN_0208AD64
	cmp r0, #7
	bne _0221F512
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl ov08_0221F5B0
_0221F512:
	ldr r0, [sp, #8]
	adds r6, #0x50
	adds r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r5]
	adds r7, #0x50
	ldr r0, [r0]
	adds r4, r4, #1
	bl FUN_02074640
	cmp r4, r0
	blt _0221F4C2
_0221F52A:
	ldr r0, [r5]
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #2
	bne _0221F540
	adds r0, r5, #0
	movs r1, #7
	bl ov08_0221E340
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221F540:
	adds r0, r5, #0
	movs r1, #6
	bl ov08_0221E340
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221F54C: .4byte 0x00002070
	thumb_func_end ov08_0221F4A4

	thumb_func_start ov08_0221F550
ov08_0221F550: @ 0x0221F550
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x18
	str r0, [sp]
	movs r0, #8
	adds r6, r1, #0
	str r0, [sp, #4]
	ldr r0, _0221F5AC @ =0x00002070
	lsls r4, r6, #4
	ldr r0, [r5, r0]
	movs r1, #0
	adds r0, r0, r4
	movs r2, #0x38
	movs r3, #0x20
	bl FUN_0201DA74
	movs r2, #0x40
	str r2, [sp]
	movs r0, #8
	str r0, [sp, #4]
	ldr r0, _0221F5AC @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	movs r3, #0x18
	adds r0, r0, r4
	bl FUN_0201DA74
	movs r0, #0x20
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r6, #0
	movs r3, #0x38
	bl ov08_0221DFC8
	movs r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r6, #0
	movs r3, #0x40
	bl ov08_0221E048
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221F5AC: .4byte 0x00002070
	thumb_func_end ov08_0221F550

	thumb_func_start ov08_0221F5B0
ov08_0221F5B0: @ 0x0221F5B0
	push {r3, lr}
	movs r2, #0x50
	muls r2, r1, r2
	adds r2, r0, r2
	ldrb r2, [r2, #0x1b]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1f
	bne _0221F5CC
	movs r2, #0x20
	str r2, [sp]
	adds r2, r1, #0
	movs r3, #0
	bl ov08_0221DF80
_0221F5CC:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov08_0221F5B0

	thumb_func_start ov08_0221F5D0
ov08_0221F5D0: @ 0x0221F5D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0221F654 @ =0x00002070
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0201D978
	ldr r0, _0221F654 @ =0x00002070
	movs r1, #0
	ldr r0, [r4, r0]
	adds r0, #0x10
	bl FUN_0201D978
	ldr r0, _0221F654 @ =0x00002070
	movs r1, #0
	ldr r0, [r4, r0]
	adds r0, #0x20
	bl FUN_0201D978
	ldr r0, _0221F654 @ =0x00002070
	movs r1, #0
	ldr r0, [r4, r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r1, [r4]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221F658
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xf
	bl ov08_0221E3A4
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r4, r0
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0221F63E
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x12
	bl ov08_0221E3A4
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x13
	bl ov08_0221E3A4
	pop {r4, pc}
_0221F63E:
	ldr r0, _0221F654 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, #0x20
	bl FUN_0201D5C8
	ldr r0, _0221F654 @ =0x00002070
	ldr r0, [r4, r0]
	adds r0, #0x30
	bl FUN_0201D5C8
	pop {r4, pc}
	.align 2, 0
_0221F654: .4byte 0x00002070
	thumb_func_end ov08_0221F5D0

	thumb_func_start ov08_0221F658
ov08_0221F658: @ 0x0221F658
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r0, _0221F7A4 @ =0x00002070
	adds r6, r1, #0
	ldr r0, [r4, r0]
	ldr r1, [r4]
	str r0, [sp, #0x18]
	movs r0, #0x50
	adds r7, r6, #0
	adds r5, r4, #4
	muls r7, r0, r7
	adds r0, r5, r7
	str r0, [sp, #0x14]
	ldr r1, [r1, #0xc]
	movs r0, #0xc
	bl FUN_02026354
	str r0, [sp, #0x10]
	ldr r0, _0221F7A8 @ =0x00001FA8
	ldr r1, _0221F7AC @ =0x02224FF4
	lsls r2, r6, #2
	ldr r0, [r4, r0]
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, r7]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _0221F7B0 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200BF8C
	ldr r0, _0221F7B0 @ =0x00001FAC
	ldr r1, [sp, #0x10]
	ldr r0, [r4, r0]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	movs r5, #0
	ldrb r0, [r0, #0x16]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0221F6EC
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x17]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1f
	bne _0221F6EC
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	bne _0221F6DC
	ldr r0, _0221F7A8 @ =0x00001FA8
	movs r1, #0x10
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	adds r5, r0, #0
	b _0221F6EC
_0221F6DC:
	cmp r0, #1
	bne _0221F6EC
	ldr r0, _0221F7A8 @ =0x00001FA8
	movs r1, #0x11
	ldr r0, [r4, r0]
	bl FUN_0200BBA0
	adds r5, r0, #0
_0221F6EC:
	ldr r1, [sp, #0x10]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r5, #0
	bne _0221F704
	movs r7, #0
	adds r4, r7, #0
	b _0221F714
_0221F704:
	movs r0, #0
	adds r1, r5, #0
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #8
_0221F714:
	ldr r0, [sp, #0x18]
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r6
	subs r0, r0, r7
	subs r1, r0, r4
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0x17
	lsrs r7, r0, #0x18
	movs r0, #7
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F7B4 @ =0x00070809
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	movs r1, #4
	adds r3, r7, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	cmp r5, #0
	beq _0221F79A
	ldr r0, [sp, #0x14]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	bne _0221F778
	movs r0, #8
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F7B8 @ =0x000A0B00
	adds r3, r7, r6
	str r0, [sp, #8]
	movs r1, #0
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	adds r3, r4, r3
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _0221F794
_0221F778:
	movs r0, #8
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F7BC @ =0x000C0D00
	adds r3, r7, r6
	str r0, [sp, #8]
	movs r1, #0
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	adds r3, r4, r3
	str r1, [sp, #0xc]
	bl FUN_020200FC
_0221F794:
	adds r0, r5, #0
	bl FUN_02026380
_0221F79A:
	ldr r0, [sp, #0x18]
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221F7A4: .4byte 0x00002070
_0221F7A8: .4byte 0x00001FA8
_0221F7AC: .4byte 0x02224FF4
_0221F7B0: .4byte 0x00001FAC
_0221F7B4: .4byte 0x00070809
_0221F7B8: .4byte 0x000A0B00
_0221F7BC: .4byte 0x000C0D00
	thumb_func_end ov08_0221F658

	thumb_func_start ov08_0221F7C0
ov08_0221F7C0: @ 0x0221F7C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	ldr r0, _0221F8F0 @ =0x00002075
	movs r1, #6
	ldrb r2, [r5, r0]
	subs r0, r0, #5
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r1, [r5, r0]
	lsls r0, r6, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #1
	lsls r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x18]
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #2
	lsls r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x14]
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #3
	lsls r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x10]
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #4
	lsls r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0xc]
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221F8F4 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x50
	bl FUN_0201D978
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r3, [r5]
	adds r0, r5, #0
	ldrb r3, [r3, #0x11]
	adds r1, r6, #0
	bl ov08_0221DDCC
	adds r0, r5, #0
	str r0, [sp, #0x1c]
	adds r0, #0x34
	movs r4, #0
	adds r7, r6, #1
	str r0, [sp, #0x1c]
_0221F85A:
	ldr r0, [r5]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x1c]
	lsls r1, r4, #3
	adds r0, r0, r2
	str r1, [sp, #0x20]
	ldrh r1, [r0, r1]
	str r0, [sp, #0x24]
	cmp r1, #0
	beq _0221F89C
	movs r0, #4
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	ldr r0, _0221F8F8 @ =0x00070809
	ldr r3, _0221F8FC @ =0x02224FE0
	lsls r6, r4, #2
	str r0, [sp, #8]
	ldr r3, [r3, r6]
	adds r0, r5, #0
	adds r2, r7, r4
	bl ov08_0221E244
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	adds r0, r5, #0
	adds r1, r1, r2
	adds r2, r7, r4
	bl ov08_0221F284
_0221F89C:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _0221F85A
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0x12
	bl ov08_0221E3A4
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x18]
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x14]
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0x10]
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r0, _0221F8F4 @ =0x00002070
	ldr r1, [r5, r0]
	ldr r0, [sp, #0xc]
	adds r0, r1, r0
	bl FUN_0201D5C8
	ldr r1, _0221F8F0 @ =0x00002075
	movs r0, #1
	ldrb r2, [r5, r1]
	eors r0, r2
	strb r0, [r5, r1]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F8F0: .4byte 0x00002075
_0221F8F4: .4byte 0x00002070
_0221F8F8: .4byte 0x00070809
_0221F8FC: .4byte 0x02224FE0
	thumb_func_end ov08_0221F7C0

	thumb_func_start ov08_0221F900
ov08_0221F900: @ 0x0221F900
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0221FB10 @ =0x00002075
	movs r1, #0x16
	ldrb r2, [r5, r0]
	subs r0, r0, #5
	adds r4, r2, #0
	muls r4, r1, r4
	ldr r1, [r5, r0]
	movs r0, #0x13
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0xe0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0xf0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #0x12
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0xd0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	movs r0, #0x15
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	lsls r0, r4, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #0
	adds r0, #0xa
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #0
	adds r0, #0xb
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #0
	adds r0, #0xc
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #5
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #6
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #7
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #0
	adds r0, #8
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #0
	adds r0, #9
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #4
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #1
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #2
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FB14 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #3
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r3, [r5]
	adds r0, r5, #0
	ldrb r3, [r3, #0x11]
	adds r1, r4, #0
	bl ov08_0221DDCC
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221EAD4
	movs r3, #0
	str r3, [sp]
	ldr r2, [r5]
	adds r1, r4, #0
	ldrb r2, [r2, #0x11]
	adds r0, r5, #0
	adds r1, #0xa
	bl ov08_0221E048
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E408
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E5DC
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E6D8
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E7D4
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E8D4
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221E9D4
	ldr r2, [r5]
	adds r0, r5, #0
	ldrb r2, [r2, #0x11]
	adds r1, r4, #1
	bl ov08_0221E120
	ldr r2, [r5]
	adds r0, r5, #0
	ldrb r2, [r2, #0x11]
	adds r1, r4, #3
	bl ov08_0221E1A8
	ldr r1, [r5]
	adds r0, r5, #0
	ldrb r1, [r1, #0x11]
	bl ov08_0221EC6C
	adds r0, r5, #0
	movs r1, #0x15
	movs r2, #0x13
	bl ov08_0221E3A4
	ldr r1, _0221FB10 @ =0x00002075
	movs r0, #1
	ldrb r2, [r5, r1]
	eors r0, r2
	strb r0, [r5, r1]
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221FB10: .4byte 0x00002075
_0221FB14: .4byte 0x00002070
	thumb_func_end ov08_0221F900

	thumb_func_start ov08_0221FB18
ov08_0221FB18: @ 0x0221FB18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0221FC6C @ =0x00002075
	movs r1, #0xb
	ldrb r2, [r5, r0]
	subs r0, r0, #5
	ldr r0, [r5, r0]
	adds r4, r2, #0
	muls r4, r1, r4
	adds r0, #0x60
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x70
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x80
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x90
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0xa0
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #1
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	ldr r1, [r5, r0]
	lsls r0, r4, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #2
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #3
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #5
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _0221FC70 @ =0x00002070
	ldr r1, [r5, r0]
	adds r0, r4, #4
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r5]
	adds r2, r5, #0
	ldrb r3, [r0, #0x11]
	adds r0, #0x34
	ldrb r0, [r0]
	movs r1, #0x50
	adds r2, #0x34
	muls r1, r3, r1
	adds r1, r2, r1
	lsls r0, r0, #3
	adds r7, r1, r0
	movs r2, #0
	str r2, [sp]
	adds r0, r5, #0
	movs r1, #6
	str r2, [sp, #4]
	bl ov08_0221DDCC
	movs r2, #0
	adds r0, r5, #0
	movs r1, #7
	adds r3, r2, #0
	bl ov08_0221E2E8
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221FC74 @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldrh r1, [r7]
	adds r3, #0x34
	ldrb r3, [r3]
	adds r0, r5, #0
	lsls r6, r3, #2
	ldr r3, _0221FC78 @ =0x02224FE0
	ldr r3, [r3, r6]
	bl ov08_0221E244
	adds r0, r5, #0
	movs r1, #8
	bl ov08_0221ECE8
	ldrb r2, [r7, #6]
	adds r0, r5, #0
	adds r1, r4, #2
	bl ov08_0221ED30
	adds r0, r5, #0
	movs r1, #9
	bl ov08_0221EE18
	ldrb r2, [r7, #7]
	adds r0, r5, #0
	adds r1, r4, #3
	bl ov08_0221EE60
	ldrh r2, [r7]
	adds r0, r5, #0
	adds r1, r4, #4
	bl ov08_0221EF48
	adds r0, r5, #0
	movs r1, #0xa
	bl ov08_0221EFA8
	ldrb r2, [r7, #5]
	adds r0, r5, #0
	adds r1, r4, #5
	bl ov08_0221F00C
	ldrb r2, [r7, #2]
	ldrb r3, [r7, #3]
	adds r0, r5, #0
	adds r1, r4, #1
	bl ov08_0221F07C
	ldr r1, _0221FC6C @ =0x00002075
	movs r0, #1
	ldrb r2, [r5, r1]
	eors r0, r2
	strb r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221FC6C: .4byte 0x00002075
_0221FC70: .4byte 0x00002070
_0221FC74: .4byte 0x000F0E00
_0221FC78: .4byte 0x02224FE0
	thumb_func_end ov08_0221FB18

	thumb_func_start ov08_0221FC7C
ov08_0221FC7C: @ 0x0221FC7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, _0221FD98 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0201D978
	ldr r0, _0221FD98 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x10
	bl FUN_0201D978
	ldr r0, _0221FD98 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x20
	bl FUN_0201D978
	ldr r0, _0221FD98 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r0, _0221FD98 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201D978
	ldr r0, _0221FD98 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x50
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	adds r0, r5, #0
	ldrb r3, [r3, #0x11]
	adds r2, r1, #0
	bl ov08_0221DDCC
	adds r0, r5, #0
	movs r6, #0
	str r0, [sp, #0x10]
	adds r0, #0x34
	ldr r7, _0221FD9C @ =0x02224FE0
	adds r4, r6, #0
	str r0, [sp, #0x10]
_0221FCE8:
	ldr r0, [r5]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x10]
	adds r0, r0, r2
	ldrh r1, [r0, r4]
	str r0, [sp, #0xc]
	cmp r1, #0
	beq _0221FD20
	movs r0, #4
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	ldr r0, _0221FDA0 @ =0x00070809
	adds r2, r6, #1
	str r0, [sp, #8]
	ldr r3, [r7]
	adds r0, r5, #0
	bl ov08_0221E244
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r1, r4
	adds r2, r6, #1
	bl ov08_0221F284
_0221FD20:
	adds r6, r6, #1
	adds r4, #8
	adds r7, r7, #4
	cmp r6, #4
	blo _0221FCE8
	movs r0, #4
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	ldr r0, _0221FDA0 @ =0x00070809
	movs r2, #5
	str r0, [sp, #8]
	ldr r1, [r5]
	adds r0, r5, #0
	ldrh r1, [r1, #0x24]
	movs r3, #0x49
	bl ov08_0221E244
	ldr r0, [r5]
	movs r1, #5
	ldrh r0, [r0, #0x24]
	bl FUN_02073314
	add r1, sp, #0x14
	strb r0, [r1, #2]
	ldrb r0, [r1, #2]
	movs r2, #5
	strb r0, [r1, #3]
	adds r0, r5, #0
	add r1, sp, #0x14
	bl ov08_0221F284
	ldr r0, _0221FD98 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x10
	bl FUN_0201D5C8
	ldr r0, _0221FD98 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x20
	bl FUN_0201D5C8
	ldr r0, _0221FD98 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x30
	bl FUN_0201D5C8
	ldr r0, _0221FD98 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201D5C8
	ldr r0, _0221FD98 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x50
	bl FUN_0201D5C8
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0221FD98: .4byte 0x00002070
_0221FD9C: .4byte 0x02224FE0
_0221FDA0: .4byte 0x00070809
	thumb_func_end ov08_0221FC7C

	thumb_func_start ov08_0221FDA4
ov08_0221FDA4: @ 0x0221FDA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x20
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x10
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x60
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x50
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x70
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x90
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0xa0
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x80
	bl FUN_0201D978
	ldr r0, _0221FF64 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0xb0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	adds r0, r5, #0
	ldrb r3, [r3, #0x11]
	adds r2, r1, #0
	bl ov08_0221DDCC
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov08_0221E2E8
	adds r0, r5, #0
	movs r1, #4
	bl ov08_0221ECE8
	adds r0, r5, #0
	movs r1, #5
	bl ov08_0221EE18
	adds r0, r5, #0
	movs r1, #9
	bl ov08_0221EFA8
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r3, [r0]
	cmp r3, #4
	bhs _0221FEE0
	ldrb r1, [r1, #0x11]
	adds r2, r5, #0
	movs r0, #0x50
	adds r2, #0x34
	muls r0, r1, r0
	adds r7, r2, r0
	lsls r0, r3, #3
	str r0, [sp, #0xc]
	adds r4, r7, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221FF68 @ =0x000F0E00
	lsls r6, r3, #2
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _0221FF6C @ =0x02224FE0
	ldrh r1, [r7, r1]
	ldr r3, [r3, r6]
	adds r0, r5, #0
	movs r2, #1
	bl ov08_0221E244
	ldrb r2, [r4, #6]
	adds r0, r5, #0
	movs r1, #6
	bl ov08_0221ED30
	ldrb r2, [r4, #7]
	adds r0, r5, #0
	movs r1, #7
	bl ov08_0221EE60
	ldr r2, [sp, #0xc]
	adds r0, r5, #0
	ldrh r2, [r7, r2]
	movs r1, #8
	bl ov08_0221EF48
	ldrb r2, [r4, #5]
	adds r0, r5, #0
	movs r1, #0xa
	bl ov08_0221F00C
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	adds r0, r5, #0
	movs r1, #3
	bl ov08_0221F07C
	b _0221FF56
_0221FEE0:
	ldrh r0, [r1, #0x24]
	movs r1, #5
	bl FUN_02073314
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221FF68 @ =0x000F0E00
	movs r2, #1
	str r0, [sp, #8]
	ldr r1, [r5]
	adds r0, r5, #0
	ldrh r1, [r1, #0x24]
	movs r3, #0x49
	bl ov08_0221E244
	ldr r2, [r5]
	adds r0, r5, #0
	ldrh r2, [r2, #0x24]
	movs r1, #8
	bl ov08_0221EF48
	ldr r0, [r5]
	movs r1, #4
	ldrh r0, [r0, #0x24]
	bl FUN_02073314
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #6
	bl ov08_0221ED30
	ldr r0, [r5]
	movs r1, #2
	ldrh r0, [r0, #0x24]
	bl FUN_02073314
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #7
	bl ov08_0221EE60
	ldr r0, [r5]
	movs r1, #1
	ldrh r0, [r0, #0x24]
	bl FUN_02073314
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl ov08_0221F00C
	adds r0, r5, #0
	movs r1, #3
	adds r2, r4, #0
	adds r3, r4, #0
	bl ov08_0221F07C
_0221FF56:
	adds r0, r5, #0
	movs r1, #0xb
	bl ov08_0221F1B0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221FF64: .4byte 0x00002070
_0221FF68: .4byte 0x000F0E00
_0221FF6C: .4byte 0x02224FE0
	thumb_func_end ov08_0221FDA4

	thumb_func_start ov08_0221FF70
ov08_0221FF70: @ 0x0221FF70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _02220058 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0201D978
	ldr r0, _02220058 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x10
	bl FUN_0201D978
	ldr r0, _02220058 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x20
	bl FUN_0201D978
	ldr r0, _02220058 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r0, _02220058 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	adds r0, r5, #0
	ldrb r3, [r3, #0x11]
	adds r2, r1, #0
	bl ov08_0221DDCC
	adds r0, r5, #0
	movs r6, #0
	str r0, [sp, #0x10]
	adds r0, #0x34
	ldr r7, _0222005C @ =0x02224FE0
	adds r4, r6, #0
	str r0, [sp, #0x10]
_0221FFD0:
	ldr r0, [r5]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x10]
	adds r0, r0, r2
	ldrh r1, [r0, r4]
	str r0, [sp, #0xc]
	cmp r1, #0
	beq _02220008
	movs r0, #4
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	ldr r0, _02220060 @ =0x00070809
	adds r2, r6, #1
	str r0, [sp, #8]
	ldr r3, [r7]
	adds r0, r5, #0
	bl ov08_0221E244
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	adds r1, r1, r4
	adds r2, r6, #1
	bl ov08_0221F284
_02220008:
	adds r6, r6, #1
	adds r4, #8
	adds r7, r7, #4
	cmp r6, #4
	blo _0221FFD0
	ldr r2, [r5]
	movs r1, #0x25
	ldrh r0, [r2, #0x22]
	ldr r2, [r2, #0xc]
	bl FUN_02077D88
	cmp r0, #0
	bne _0222002A
	adds r0, r5, #0
	movs r1, #0x5e
	bl ov08_0221E340
_0222002A:
	ldr r0, _02220058 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x10
	bl FUN_0201D5C8
	ldr r0, _02220058 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x20
	bl FUN_0201D5C8
	ldr r0, _02220058 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x30
	bl FUN_0201D5C8
	ldr r0, _02220058 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02220058: .4byte 0x00002070
_0222005C: .4byte 0x02224FE0
_02220060: .4byte 0x00070809
	thumb_func_end ov08_0221FF70

	thumb_func_start ov08_02220064
ov08_02220064: @ 0x02220064
	push {r3, r4, r5, lr}
	ldr r4, [r0]
	adds r3, r1, #0
	ldrb r5, [r4, #0x11]
	adds r1, r0, #0
	movs r4, #0x50
	adds r1, #0x34
	muls r4, r5, r4
	adds r4, r1, r4
	lsls r1, r2, #3
	adds r1, r4, r1
	adds r2, r3, #0
	bl ov08_0221F3D0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov08_02220064

	thumb_func_start ov08_02220084
ov08_02220084: @ 0x02220084
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _022201B0 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0201D978
	ldr r0, _022201B0 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x20
	bl FUN_0201D978
	ldr r0, _022201B0 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r0, _022201B0 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x10
	bl FUN_0201D978
	ldr r0, _022201B0 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201D978
	ldr r0, _022201B0 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x50
	bl FUN_0201D978
	ldr r0, _022201B0 @ =0x00002070
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x60
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r3, [r5]
	adds r0, r5, #0
	ldrb r3, [r3, #0x11]
	adds r2, r1, #0
	bl ov08_0221DDCC
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl ov08_0221E2E8
	ldr r0, _022201B4 @ =0x00001FA8
	movs r1, #0x39
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022201B8 @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _022201B0 @ =0x00002070
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	adds r3, r1, #0
	adds r0, #0x40
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, _022201B0 @ =0x00002070
	ldr r0, [r5, r0]
	adds r0, #0x40
	bl FUN_0201D5C8
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r3, [r0]
	cmp r3, #4
	bhs _02220176
	ldrb r1, [r1, #0x11]
	adds r2, r5, #0
	movs r0, #0x50
	muls r0, r1, r0
	adds r2, #0x34
	adds r2, r2, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _022201B8 @ =0x000F0E00
	lsls r1, r3, #3
	str r0, [sp, #8]
	lsls r6, r3, #2
	ldr r3, _022201BC @ =0x02224FE0
	adds r4, r2, r1
	ldrh r1, [r2, r1]
	ldr r3, [r3, r6]
	adds r0, r5, #0
	movs r2, #1
	bl ov08_0221E244
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	adds r0, r5, #0
	movs r1, #3
	bl ov08_0221F07C
	b _022201A4
_02220176:
	ldrh r0, [r1, #0x24]
	movs r1, #5
	bl FUN_02073314
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _022201B8 @ =0x000F0E00
	movs r2, #1
	str r0, [sp, #8]
	ldr r1, [r5]
	adds r0, r5, #0
	ldrh r1, [r1, #0x24]
	movs r3, #0x49
	bl ov08_0221E244
	adds r0, r5, #0
	movs r1, #3
	adds r2, r4, #0
	adds r3, r4, #0
	bl ov08_0221F07C
_022201A4:
	adds r0, r5, #0
	movs r1, #6
	bl ov08_0221F1B0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_022201B0: .4byte 0x00002070
_022201B4: .4byte 0x00001FA8
_022201B8: .4byte 0x000F0E00
_022201BC: .4byte 0x02224FE0
	thumb_func_end ov08_02220084

	thumb_func_start ov08_022201C0
ov08_022201C0: @ 0x022201C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _022201E4 @ =0x00002060
	movs r1, #1
	adds r0, r4, r0
	adds r2, r1, #0
	movs r3, #0xe
	bl FUN_0200E998
	ldr r0, _022201E4 @ =0x00002060
	movs r1, #0xf
	adds r0, r4, r0
	bl FUN_0201D978
	adds r0, r4, #0
	bl ov08_022201E8
	pop {r4, pc}
	.align 2, 0
_022201E4: .4byte 0x00002060
	thumb_func_end ov08_022201C0

	thumb_func_start ov08_022201E8
ov08_022201E8: @ 0x022201E8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	bl FUN_02002B34
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl FUN_0223B718
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, _0222021C @ =0x00002060
	str r3, [sp, #8]
	adds r0, r4, r2
	subs r2, #0xb0
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _02220220 @ =0x0000207B
	strb r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0222021C: .4byte 0x00002060
_02220220: .4byte 0x0000207B
	thumb_func_end ov08_022201E8

	thumb_func_start ov08_02220224
ov08_02220224: @ 0x02220224
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	movs r1, #0
	str r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	ldrh r0, [r0, #0x22]
	ldr r2, [r2, #0xc]
	bl FUN_02077CE8
	ldr r2, [sp, #0xc]
	adds r6, r0, #0
	ldrb r3, [r2, #0x11]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	adds r2, r2, r3
	adds r2, #0x2c
	ldrb r2, [r2]
	ldr r0, [r0, #8]
	ldr r1, [r1, #0x28]
	bl FUN_0223A880
	movs r1, #0xa3
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #0xf
	movs r4, #0
	bl FUN_02077DAC
	cmp r0, #0
	beq _02220278
	movs r0, #1
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_02220278:
	adds r0, r6, #0
	movs r1, #0x10
	bl FUN_02077DAC
	cmp r0, #0
	beq _0222028C
	movs r0, #2
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0222028C:
	adds r0, r6, #0
	movs r1, #0x11
	bl FUN_02077DAC
	cmp r0, #0
	beq _022202A0
	movs r0, #4
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_022202A0:
	adds r0, r6, #0
	movs r1, #0x12
	bl FUN_02077DAC
	cmp r0, #0
	beq _022202B4
	movs r0, #8
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_022202B4:
	adds r0, r6, #0
	movs r1, #0x13
	bl FUN_02077DAC
	cmp r0, #0
	beq _022202C8
	movs r0, #0x10
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_022202C8:
	adds r0, r6, #0
	movs r1, #0x14
	bl FUN_02077DAC
	cmp r0, #0
	beq _022202DC
	movs r0, #0x20
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_022202DC:
	adds r0, r6, #0
	movs r1, #0x15
	bl FUN_02077DAC
	cmp r0, #0
	beq _022202F0
	movs r0, #0x40
	orrs r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_022202F0:
	ldr r0, [sp, #0xc]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r5, r0
	ldrh r1, [r0, #0x14]
	cmp r1, #0
	bne _0222033A
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0222033A
	ldr r0, _02220574 @ =0x00001FA8
	movs r1, #0x58
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_0222033A:
	ldr r0, [sp, #8]
	cmp r0, r1
	beq _02220396
	ldr r0, _02220574 @ =0x00001FA8
	movs r1, #0x52
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	ldr r2, [sp, #0xc]
	str r1, [sp, #4]
	ldrb r3, [r2, #0x11]
	movs r2, #0x50
	ldr r0, _02220578 @ =0x00001FAC
	muls r2, r3, r2
	adds r2, r5, r2
	ldrh r3, [r2, #0x14]
	ldr r2, [sp, #8]
	ldr r0, [r5, r0]
	subs r2, r2, r3
	movs r3, #3
	bl FUN_0200BFCC
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_02220396:
	adds r0, r6, #0
	movs r1, #0x24
	bl FUN_02077DAC
	cmp r0, #0
	bne _022203AE
	adds r0, r6, #0
	movs r1, #0x25
	bl FUN_02077DAC
	cmp r0, #0
	beq _022203BE
_022203AE:
	ldr r2, _02220574 @ =0x00001FA8
	movs r1, #0x57
	ldr r0, [r5, r2]
	adds r2, #8
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	b _0222056A
_022203BE:
	cmp r4, #1
	ldr r0, _02220574 @ =0x00001FA8
	bne _022203F6
	ldr r0, [r5, r0]
	movs r1, #0x5c
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_022203F6:
	cmp r4, #2
	bne _0222042C
	ldr r0, [r5, r0]
	movs r1, #0x53
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_0222042C:
	cmp r4, #4
	bne _02220462
	ldr r0, [r5, r0]
	movs r1, #0x55
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_02220462:
	cmp r4, #8
	bne _02220498
	ldr r0, [r5, r0]
	movs r1, #0x56
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_02220498:
	cmp r4, #0x10
	bne _022204CE
	ldr r0, [r5, r0]
	movs r1, #0x54
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_022204CE:
	cmp r4, #0x20
	bne _02220504
	ldr r0, [r5, r0]
	movs r1, #0x5a
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_02220504:
	cmp r4, #0x40
	bne _0222053A
	ldr r0, [r5, r0]
	movs r1, #0x5b
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	b _0222056A
_0222053A:
	ldr r0, [r5, r0]
	movs r1, #0x59
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _02220578 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _02220578 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
_0222056A:
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02220574: .4byte 0x00001FA8
_02220578: .4byte 0x00001FAC
	thumb_func_end ov08_02220224

	thumb_func_start ov08_0222057C
ov08_0222057C: @ 0x0222057C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r3, [r5]
	ldrb r2, [r3, #0x11]
	ldr r0, [r3, #8]
	ldr r1, [r3, #0x28]
	adds r2, r3, r2
	adds r2, #0x2c
	ldrb r2, [r2]
	bl FUN_0223A880
	adds r6, r0, #0
	ldr r0, _022205D4 @ =0x00001FA8
	movs r1, #0x5f
	ldr r0, [r5, r0]
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _022205D8 @ =0x00001FAC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r0, _022205D8 @ =0x00001FAC
	ldr r2, _022205DC @ =0x00000175
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200BFF0
	ldr r1, _022205D8 @ =0x00001FAC
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	pop {r4, r5, r6, pc}
	.align 2, 0
_022205D4: .4byte 0x00001FA8
_022205D8: .4byte 0x00001FAC
_022205DC: .4byte 0x00000175
	thumb_func_end ov08_0222057C

	thumb_func_start ov08_022205E0
ov08_022205E0: @ 0x022205E0
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_0222061C
	adds r0, r4, #0
	bl ov08_02220668
	adds r0, r4, #0
	bl ov08_02220750
	adds r0, r4, #0
	bl ov08_02220800
	adds r0, r4, #0
	bl ov08_02220878
	adds r0, r4, #0
	bl ov08_02220928
	adds r0, r4, #0
	bl ov08_02220A28
	adds r0, r4, #0
	bl ov08_0222162C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r4, pc}
	thumb_func_end ov08_022205E0

	thumb_func_start ov08_0222061C
ov08_0222061C: @ 0x0222061C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02220660 @ =0x0222541C
	add r2, sp, #0
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	adds r4, r0, #0
	bl FUN_0200CF38
	ldr r1, _02220664 @ =0x00001FB4
	movs r2, #0x2b
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	bl FUN_0200CFF4
	ldr r1, _02220664 @ =0x00001FB4
	adds r0, r4, #0
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl FUN_0200D3F8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02220660: .4byte 0x0222541C
_02220664: .4byte 0x00001FB4
	thumb_func_end ov08_0222061C

	thumb_func_start ov08_02220668
ov08_02220668: @ 0x02220668
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	ldr r1, [r6]
	movs r0, #0x14
	ldr r1, [r1, #0xc]
	bl FUN_02007688
	adds r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	str r0, [sp, #0x18]
	bl FUN_02074490
	str r7, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #3
	str r1, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _02220748 @ =0x0000B007
	ldr r3, _0222074C @ =0x00001FB4
	str r0, [sp, #0x14]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	ldr r2, [sp, #0x18]
	ldr r3, [r6, r3]
	bl FUN_0200D68C
	bl FUN_02074498
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _02220748 @ =0x0000B007
	ldr r1, _0222074C @ =0x00001FB4
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl FUN_0200D6EC
	bl FUN_020744A4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _02220748 @ =0x0000B007
	ldr r1, _0222074C @ =0x00001FB4
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl FUN_0200D71C
	movs r4, #0
	adds r5, r6, #0
_022206E4:
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _0222070E
	ldr r0, [r5, #4]
	bl FUN_020741B0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02220748 @ =0x0000B007
	ldr r1, _0222074C @ =0x00001FB4
	adds r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl FUN_0200D504
	b _02220734
_0222070E:
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_020741BC
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02220748 @ =0x0000B007
	ldr r1, _0222074C @ =0x00001FB4
	adds r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl FUN_0200D504
_02220734:
	adds r4, r4, #1
	adds r5, #0x50
	cmp r4, #6
	blo _022206E4
	adds r0, r7, #0
	bl FUN_0200770C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02220748: .4byte 0x0000B007
_0222074C: .4byte 0x00001FB4
	thumb_func_end ov08_02220668

	thumb_func_start ov08_02220750
ov08_02220750: @ 0x02220750
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	ldr r1, [r5]
	adds r4, r0, #0
	ldr r1, [r1, #0xc]
	movs r0, #0x27
	bl FUN_02007688
	adds r6, r0, #0
	bl FUN_0208AD58
	str r6, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022207F4 @ =0x0000B008
	ldr r3, _022207F8 @ =0x00001FB4
	str r0, [sp, #0x14]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	movs r1, #3
	adds r2, r4, #0
	bl FUN_0200D68C
	bl FUN_0208AD5C
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _022207F4 @ =0x0000B008
	ldr r1, _022207F8 @ =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	adds r2, r6, #0
	bl FUN_0200D6EC
	bl FUN_0208AD60
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _022207F4 @ =0x0000B008
	ldr r1, _022207F8 @ =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	adds r2, r6, #0
	bl FUN_0200D71C
	bl FUN_0208AD54
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _022207FC @ =0x0000B00D
	ldr r1, _022207F8 @ =0x00001FB4
	str r0, [sp, #8]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	adds r2, r6, #0
	bl FUN_0200D504
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_022207F4: .4byte 0x0000B008
_022207F8: .4byte 0x00001FB4
_022207FC: .4byte 0x0000B00D
	thumb_func_end ov08_02220750

	thumb_func_start ov08_02220800
ov08_02220800: @ 0x02220800
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	adds r6, r0, #0
	movs r0, #2
	str r0, [sp]
	ldr r0, _02220868 @ =0x0000B009
	ldr r3, _0222086C @ =0x00001FB4
	str r0, [sp, #4]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	movs r1, #3
	adds r2, r6, #0
	bl FUN_02077720
	ldr r1, _0222086C @ =0x00001FB4
	ldr r2, _02220868 @ =0x0000B009
	ldr r1, [r5, r1]
	adds r0, r6, #0
	adds r3, r2, #0
	bl FUN_0207775C
	ldr r4, _02220870 @ =0x0000B00E
	adds r7, r4, #6
_0222083C:
	ldr r1, _0222086C @ =0x00001FB4
	str r4, [sp]
	ldr r1, [r5, r1]
	adds r0, r6, #0
	movs r2, #2
	movs r3, #0
	bl FUN_020776B8
	adds r4, r4, #1
	cmp r4, r7
	bls _0222083C
	ldr r0, _02220874 @ =0x0000B015
	ldr r1, _0222086C @ =0x00001FB4
	str r0, [sp]
	ldr r1, [r5, r1]
	adds r0, r6, #0
	movs r2, #2
	movs r3, #0
	bl FUN_02077834
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02220868: .4byte 0x0000B009
_0222086C: .4byte 0x00001FB4
_02220870: .4byte 0x0000B00E
_02220874: .4byte 0x0000B015
	thumb_func_end ov08_02220800

	thumb_func_start ov08_02220878
ov08_02220878: @ 0x02220878
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x15
	ldr r1, [r1, #0xc]
	bl FUN_02007688
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	adds r6, r0, #0
	bl FUN_0207CAA0
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0222091C @ =0x0000B00A
	ldr r3, _02220920 @ =0x00001FB4
	str r0, [sp, #0x14]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	movs r1, #3
	adds r2, r6, #0
	bl FUN_0200D68C
	bl FUN_0207CAA4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0222091C @ =0x0000B00A
	ldr r1, _02220920 @ =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl FUN_0200D6EC
	bl FUN_0207CAA8
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0222091C @ =0x0000B00A
	ldr r1, _02220920 @ =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl FUN_0200D71C
	bl FUN_0207CA9C
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02220924 @ =0x0000B016
	ldr r1, _02220920 @ =0x00001FB4
	str r0, [sp, #8]
	ldr r1, [r5, r1]
	adds r0, r6, #0
	adds r2, r4, #0
	bl FUN_0200D504
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0222091C: .4byte 0x0000B00A
_02220920: .4byte 0x00001FB4
_02220924: .4byte 0x0000B016
	thumb_func_end ov08_02220878

	thumb_func_start ov08_02220928
ov08_02220928: @ 0x02220928
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	adds r4, r0, #0
	movs r0, #0x47
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r0, _022209AC @ =0x0000B00B
	ldr r3, _022209B0 @ =0x00001FB4
	str r0, [sp, #0x14]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	movs r1, #3
	adds r2, r4, #0
	bl FUN_0200D644
	movs r0, #0
	str r0, [sp]
	ldr r0, _022209AC @ =0x0000B00B
	ldr r1, _022209B0 @ =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	movs r2, #0x47
	movs r3, #0x19
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _022209AC @ =0x0000B00B
	ldr r1, _022209B0 @ =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	movs r2, #0x47
	movs r3, #0x18
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _022209B4 @ =0x0000B017
	ldr r1, _022209B0 @ =0x00001FB4
	str r0, [sp, #8]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	movs r2, #0x47
	movs r3, #0x1a
	bl FUN_0200D4A4
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_022209AC: .4byte 0x0000B00B
_022209B0: .4byte 0x00001FB4
_022209B4: .4byte 0x0000B017
	thumb_func_end ov08_02220928

	thumb_func_start ov08_022209B8
ov08_022209B8: @ 0x022209B8
	push {r4, r5, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	movs r2, #0
	add r1, sp, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	movs r1, #0x14
	ldr r3, _02220A10 @ =0x02225654
	muls r1, r4, r1
	ldr r3, [r3, r1]
	str r2, [sp, #0xc]
	str r3, [sp, #8]
	movs r3, #2
	str r3, [sp, #0x10]
	ldr r3, _02220A14 @ =0x02225644
	str r2, [sp, #0x30]
	ldr r3, [r3, r1]
	add r2, sp, #0
	str r3, [sp, #0x14]
	ldr r3, _02220A18 @ =0x02225648
	ldr r3, [r3, r1]
	str r3, [sp, #0x18]
	ldr r3, _02220A1C @ =0x0222564C
	ldr r3, [r3, r1]
	str r3, [sp, #0x1c]
	ldr r3, _02220A20 @ =0x02225650
	ldr r1, [r3, r1]
	str r1, [sp, #0x20]
	movs r1, #1
	str r1, [sp, #0x2c]
	ldr r1, _02220A24 @ =0x00001FB4
	ldr r1, [r5, r1]
	bl FUN_0200D734
	add sp, #0x34
	pop {r4, r5, pc}
	.align 2, 0
_02220A10: .4byte 0x02225654
_02220A14: .4byte 0x02225644
_02220A18: .4byte 0x02225648
_02220A1C: .4byte 0x0222564C
_02220A20: .4byte 0x02225650
_02220A24: .4byte 0x00001FB4
	thumb_func_end ov08_022209B8

	thumb_func_start ov08_02220A28
ov08_02220A28: @ 0x02220A28
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _02220A4C @ =0x00001FB8
	movs r4, #0
	adds r5, r6, #0
_02220A32:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov08_022209B8
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x26
	blo _02220A32
	adds r0, r6, #0
	bl ov08_02220AAC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02220A4C: .4byte 0x00001FB8
	thumb_func_end ov08_02220A28

	thumb_func_start ov08_02220A50
ov08_02220A50: @ 0x02220A50
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	ldr r6, _02220A84 @ =0x00001FB8
	str r0, [sp]
	movs r4, #0
	adds r5, r7, #0
_02220A64:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x26
	blo _02220A64
	adds r0, r7, #0
	bl ov08_02221698
	ldr r1, _02220A88 @ =0x00001FB4
	ldr r0, [sp]
	ldr r1, [r7, r1]
	bl FUN_0200D998
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02220A84: .4byte 0x00001FB8
_02220A88: .4byte 0x00001FB4
	thumb_func_end ov08_02220A50

	thumb_func_start ov08_02220A8C
ov08_02220A8C: @ 0x02220A8C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	movs r1, #1
	adds r6, r0, #0
	bl FUN_0200DCE8
	lsls r1, r5, #0x10
	lsls r2, r4, #0x10
	adds r0, r6, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov08_02220A8C

	thumb_func_start ov08_02220AAC
ov08_02220AAC: @ 0x02220AAC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	movs r7, #0
	adds r4, #0x1b
	adds r6, r5, #0
_02220AB8:
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _02220AD8
	adds r1, r5, #0
	ldrb r2, [r4]
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1f
	bl FUN_02074364
	adds r1, r0, #0
	ldr r0, _02220AE8 @ =0x00001FD4
	ldr r0, [r6, r0]
	bl FUN_0200DD10
_02220AD8:
	adds r7, r7, #1
	adds r5, #0x50
	adds r4, #0x50
	adds r6, r6, #4
	cmp r7, #6
	blt _02220AB8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220AE8: .4byte 0x00001FD4
	thumb_func_end ov08_02220AAC

	thumb_func_start ov08_02220AEC
ov08_02220AEC: @ 0x02220AEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r3, #0
	ldr r0, [r0, #8]
	adds r7, r1, #0
	adds r4, r2, #0
	bl FUN_0223A8E4
	str r0, [sp, #8]
	bl FUN_020776B4
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl FUN_02077678
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r1, _02220B38 @ =0x00001FB4
	str r4, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0xc]
	bl FUN_0200E248
	adds r0, r6, #0
	bl FUN_0207769C
	adds r1, r0, #0
	adds r0, r7, #0
	adds r1, r1, #4
	bl FUN_0200DD10
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220B38: .4byte 0x00001FB4
	thumb_func_end ov08_02220AEC

	thumb_func_start ov08_02220B3C
ov08_02220B3C: @ 0x02220B3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r2, #0
	ldr r0, [r0, #8]
	adds r6, r1, #0
	bl FUN_0223A8E4
	adds r7, r0, #0
	bl FUN_02077830
	str r0, [sp, #8]
	adds r0, r4, #0
	bl FUN_02077800
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, _02220B88 @ =0x0000B015
	ldr r1, _02220B8C @ =0x00001FB4
	str r0, [sp, #4]
	ldr r1, [r5, r1]
	ldr r2, [sp, #8]
	adds r0, r7, #0
	bl FUN_0200E248
	adds r0, r4, #0
	bl FUN_02077818
	adds r1, r0, #0
	adds r0, r6, #0
	adds r1, r1, #4
	bl FUN_0200DD10
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02220B88: .4byte 0x0000B015
_02220B8C: .4byte 0x00001FB4
	thumb_func_end ov08_02220B3C

	thumb_func_start ov08_02220B90
ov08_02220B90: @ 0x02220B90
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r7, r3, #0
	cmp r6, #7
	beq _02220BB0
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_0200DC4C
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov08_02220A8C
_02220BB0:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_02220B90

	thumb_func_start ov08_02220BB4
ov08_02220BB4: @ 0x02220BB4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r1, _02220BF8 @ =0x00002004
	adds r5, r0, #0
	adds r6, r2, #0
	ldrb r3, [r4, #0x14]
	ldr r1, [r5, r1]
	ldr r2, _02220BFC @ =0x0000B00E
	bl ov08_02220AEC
	ldr r0, _02220BF8 @ =0x00002004
	ldr r1, [r6]
	ldr r0, [r5, r0]
	ldr r2, [r6, #4]
	bl ov08_02220A8C
	ldrb r3, [r4, #0x15]
	ldrb r0, [r4, #0x14]
	cmp r0, r3
	beq _02220BF4
	ldr r1, _02220C00 @ =0x00002008
	ldr r2, _02220C04 @ =0x0000B00F
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov08_02220AEC
	ldr r0, _02220C00 @ =0x00002008
	ldr r1, [r6, #8]
	ldr r0, [r5, r0]
	ldr r2, [r6, #0xc]
	bl ov08_02220A8C
_02220BF4:
	pop {r4, r5, r6, pc}
	nop
_02220BF8: .4byte 0x00002004
_02220BFC: .4byte 0x0000B00E
_02220C00: .4byte 0x00002008
_02220C04: .4byte 0x0000B00F
	thumb_func_end ov08_02220BB4

	thumb_func_start ov08_02220C08
ov08_02220C08: @ 0x02220C08
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _02220C38
	bl FUN_02078068
	cmp r0, #1
	bne _02220C26
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0200DC4C
	b _02220C2E
_02220C26:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200DC4C
_02220C2E:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov08_02220A8C
_02220C38:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov08_02220C08

	thumb_func_start ov08_02220C3C
ov08_02220C3C: @ 0x02220C3C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #0
	beq _02220C5A
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0200DC4C
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov08_02220A8C
_02220C5A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov08_02220C3C

	thumb_func_start ov08_02220C5C
ov08_02220C5C: @ 0x02220C5C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, _02220CF0 @ =0x00001FB8
	str r1, [sp]
	movs r5, #0
	adds r4, r6, #0
_02220C68:
	ldr r0, [r4, r7]
	movs r1, #0
	bl FUN_0200DCE8
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #0x26
	blo _02220C68
	ldr r0, [sp]
	cmp r0, #9
	bhi _02220CEC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02220C8A: @ jump table
	.2byte _02220C9E - _02220C8A - 2 @ case 0
	.2byte _02220CA6 - _02220C8A - 2 @ case 1
	.2byte _02220CAE - _02220C8A - 2 @ case 2
	.2byte _02220CB6 - _02220C8A - 2 @ case 3
	.2byte _02220CBE - _02220C8A - 2 @ case 4
	.2byte _02220CC6 - _02220C8A - 2 @ case 5
	.2byte _02220CCE - _02220C8A - 2 @ case 6
	.2byte _02220CD6 - _02220C8A - 2 @ case 7
	.2byte _02220CDE - _02220C8A - 2 @ case 8
	.2byte _02220CE6 - _02220C8A - 2 @ case 9
_02220C9E:
	adds r0, r6, #0
	bl ov08_02220CF4
	pop {r3, r4, r5, r6, r7, pc}
_02220CA6:
	adds r0, r6, #0
	bl ov08_02220D90
	pop {r3, r4, r5, r6, r7, pc}
_02220CAE:
	adds r0, r6, #0
	bl ov08_02220DE8
	pop {r3, r4, r5, r6, r7, pc}
_02220CB6:
	adds r0, r6, #0
	bl ov08_02220E80
	pop {r3, r4, r5, r6, r7, pc}
_02220CBE:
	adds r0, r6, #0
	bl ov08_02220F58
	pop {r3, r4, r5, r6, r7, pc}
_02220CC6:
	adds r0, r6, #0
	bl ov08_0222114C
	pop {r3, r4, r5, r6, r7, pc}
_02220CCE:
	adds r0, r6, #0
	bl ov08_0222101C
	pop {r3, r4, r5, r6, r7, pc}
_02220CD6:
	adds r0, r6, #0
	bl ov08_02221088
	pop {r3, r4, r5, r6, r7, pc}
_02220CDE:
	adds r0, r6, #0
	bl ov08_02221230
	pop {r3, r4, r5, r6, r7, pc}
_02220CE6:
	adds r0, r6, #0
	bl ov08_022211B8
_02220CEC:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220CF0: .4byte 0x00001FB8
	thumb_func_end ov08_02220C5C

	thumb_func_start ov08_02220CF4
ov08_02220CF4: @ 0x02220CF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	str r0, [sp]
	adds r0, #0x1b
	ldr r4, _02220D78 @ =0x02225534
	ldr r7, _02220D7C @ =0x02225564
	adds r5, r6, #0
	str r0, [sp]
_02220D0C:
	ldrh r0, [r6, #8]
	cmp r0, #0
	beq _02220D5A
	ldr r0, _02220D80 @ =0x00001FD4
	ldr r1, [r4]
	ldr r0, [r5, r0]
	ldr r2, [r4, #4]
	bl ov08_02220A8C
	ldr r0, [sp]
	ldr r1, _02220D84 @ =0x00001FEC
	ldrb r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [r7]
	lsls r0, r0, #0x19
	ldr r3, [r7, #4]
	lsrs r0, r0, #0x1c
	bl ov08_02220B90
	ldr r1, _02220D88 @ =0x00001FB8
	ldr r2, [r4]
	ldr r3, [r4, #4]
	ldrh r0, [r6, #0x1e]
	ldr r1, [r5, r1]
	adds r2, #8
	adds r3, #8
	bl ov08_02220C08
	adds r0, r6, #0
	adds r0, #0x31
	ldr r1, _02220D8C @ =0x00002038
	ldr r2, [r4]
	ldr r3, [r4, #4]
	ldrb r0, [r0]
	ldr r1, [r5, r1]
	adds r2, #0x10
	adds r3, #8
	bl ov08_02220C3C
_02220D5A:
	ldr r0, [sp]
	adds r6, #0x50
	adds r0, #0x50
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r4, #8
	adds r0, r0, #1
	adds r5, r5, #4
	adds r7, #8
	str r0, [sp, #4]
	cmp r0, #6
	blt _02220D0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02220D78: .4byte 0x02225534
_02220D7C: .4byte 0x02225564
_02220D80: .4byte 0x00001FD4
_02220D84: .4byte 0x00001FEC
_02220D88: .4byte 0x00001FB8
_02220D8C: .4byte 0x00002038
	thumb_func_end ov08_02220CF4

	thumb_func_start ov08_02220D90
ov08_02220D90: @ 0x02220D90
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02220DE4 @ =0x00001FB8
	movs r2, #0x48
	ldr r0, [r1, r0]
	movs r1, #0x80
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x50
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02220DE4 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x88
	bl ov08_02220C08
	ldr r1, [r5]
	adds r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	movs r3, #0x50
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02220DE4 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x90
	bl ov08_02220C3C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02220DE4: .4byte 0x00001FB8
	thumb_func_end ov08_02220D90

	thumb_func_start ov08_02220DE8
ov08_02220DE8: @ 0x02220DE8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02220E74 @ =0x00001FB8
	movs r2, #0xc
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrb r0, [r4, #0x17]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r0, r0, #0x19
	adds r1, #0xd
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02220E74 @ =0x00001FB8
	lsrs r0, r0, #0x1c
	ldr r1, [r2, r1]
	movs r2, #0xc6
	bl ov08_02220B90
	ldr r2, _02220E78 @ =0x022253F4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02220E74 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02220E74 @ =0x00001FB8
	movs r3, #0x14
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	ldr r1, _02220E7C @ =0x00001FD0
	ldrh r0, [r4, #0x1a]
	ldr r1, [r5, r1]
	movs r2, #0x14
	movs r3, #0x84
	bl ov08_02220C08
	pop {r3, r4, r5, pc}
	nop
_02220E74: .4byte 0x00001FB8
_02220E78: .4byte 0x022253F4
_02220E7C: .4byte 0x00001FD0
	thumb_func_end ov08_02220DE8

	thumb_func_start ov08_02220E80
ov08_02220E80: @ 0x02220E80
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0]
	ldrb r2, [r0, #0x11]
	ldr r0, [sp]
	adds r1, r0, #4
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r1, r0, #2
	ldr r0, [sp]
	movs r2, #0xc
	adds r1, r0, r1
	ldr r0, _02220F44 @ =0x00001FB8
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r1, [sp]
	ldrb r0, [r4, #0x17]
	ldr r1, [r1]
	movs r3, #0x14
	ldrb r1, [r1, #0x11]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1c
	adds r1, #0xd
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r2, r1, r2
	ldr r1, _02220F44 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0xc6
	bl ov08_02220B90
	ldr r0, [sp]
	ldr r2, _02220F48 @ =0x022253D4
	adds r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [sp]
	ldrh r0, [r4, #0x1a]
	ldr r1, [r1]
	movs r3, #0x14
	ldrb r1, [r1, #0x11]
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r2, r1, r2
	ldr r1, _02220F44 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [sp]
	adds r0, r4, #0
	ldr r1, [r1]
	adds r0, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r0]
	movs r3, #0x14
	adds r1, #0x20
	lsls r2, r1, #2
	ldr r1, [sp]
	adds r2, r1, r2
	ldr r1, _02220F44 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	ldr r5, [sp]
	ldr r6, _02220F4C @ =0x02225454
	movs r7, #0
_02220F10:
	ldrh r0, [r4, #0x30]
	cmp r0, #0
	beq _02220F36
	adds r3, r4, #0
	ldr r1, _02220F50 @ =0x0000200C
	adds r3, #0x34
	ldr r2, _02220F54 @ =0x0000B010
	ldrb r3, [r3]
	ldr r0, [sp]
	ldr r1, [r5, r1]
	adds r2, r7, r2
	bl ov08_02220AEC
	ldr r0, _02220F50 @ =0x0000200C
	ldr r1, [r6]
	ldr r0, [r5, r0]
	ldr r2, [r6, #4]
	bl ov08_02220A8C
_02220F36:
	adds r7, r7, #1
	adds r4, #8
	adds r5, r5, #4
	adds r6, #8
	cmp r7, #4
	blo _02220F10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02220F44: .4byte 0x00001FB8
_02220F48: .4byte 0x022253D4
_02220F4C: .4byte 0x02225454
_02220F50: .4byte 0x0000200C
_02220F54: .4byte 0x0000B010
	thumb_func_end ov08_02220E80

	thumb_func_start ov08_02220F58
ov08_02220F58: @ 0x02220F58
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02221010 @ =0x00001FB8
	movs r2, #0xc
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrb r0, [r4, #0x17]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r0, r0, #0x19
	adds r1, #0xd
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221010 @ =0x00001FB8
	lsrs r0, r0, #0x1c
	ldr r1, [r2, r1]
	movs r2, #0xc6
	bl ov08_02220B90
	ldr r2, _02221014 @ =0x022253E4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02220BB4
	ldr r0, [r5]
	movs r2, #0x30
	adds r0, #0x34
	ldrb r0, [r0]
	adds r0, #0x15
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02221010 @ =0x00001FB8
	ldr r0, [r1, r0]
	movs r1, #0x88
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221010 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221010 @ =0x00001FB8
	movs r3, #0x14
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	ldr r2, [r5]
	ldr r1, _02221018 @ =0x00002020
	adds r2, #0x34
	ldrb r2, [r2]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	lsls r2, r2, #3
	adds r2, r4, r2
	adds r2, #0x35
	ldrb r2, [r2]
	bl ov08_02220B3C
	ldr r0, _02221018 @ =0x00002020
	movs r1, #0x18
	ldr r0, [r5, r0]
	movs r2, #0x58
	bl ov08_02220A8C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221010: .4byte 0x00001FB8
_02221014: .4byte 0x022253E4
_02221018: .4byte 0x00002020
	thumb_func_end ov08_02220F58

	thumb_func_start ov08_0222101C
ov08_0222101C: @ 0x0222101C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02221080 @ =0x00001FB8
	movs r2, #0xc
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r2, _02221084 @ =0x022253C4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221080 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	adds r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	movs r3, #0x14
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221080 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	adds r0, r5, #0
	bl ov08_022213C8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221080: .4byte 0x00001FB8
_02221084: .4byte 0x022253C4
	thumb_func_end ov08_0222101C

	thumb_func_start ov08_02221088
ov08_02221088: @ 0x02221088
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02221140 @ =0x00001FB8
	movs r2, #0xc
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r2, _02221144 @ =0x022253B4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02220BB4
	ldr r0, [r5]
	movs r2, #0x30
	adds r0, #0x34
	ldrb r0, [r0]
	adds r0, #0x15
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02221140 @ =0x00001FB8
	ldr r0, [r1, r0]
	movs r1, #0x88
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221140 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221140 @ =0x00001FB8
	movs r3, #0x14
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r2, [r0]
	cmp r2, #4
	bhs _0222111E
	lsls r2, r2, #3
	adds r2, r4, r2
	ldr r1, _02221148 @ =0x00002020
	adds r2, #0x35
	ldrb r2, [r2]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov08_02220B3C
	b _02221132
_0222111E:
	ldrh r0, [r1, #0x24]
	movs r1, #1
	bl FUN_02073314
	ldr r1, _02221148 @ =0x00002020
	adds r2, r0, #0
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov08_02220B3C
_02221132:
	ldr r0, _02221148 @ =0x00002020
	movs r1, #0x18
	ldr r0, [r5, r0]
	movs r2, #0x58
	bl ov08_02220A8C
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221140: .4byte 0x00001FB8
_02221144: .4byte 0x022253B4
_02221148: .4byte 0x00002020
	thumb_func_end ov08_02221088

	thumb_func_start ov08_0222114C
ov08_0222114C: @ 0x0222114C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _022211B0 @ =0x00001FB8
	movs r2, #0xc
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r2, _022211B4 @ =0x022253C4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02220BB4
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _022211B0 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	adds r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	movs r3, #0x14
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _022211B0 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	adds r0, r5, #0
	bl ov08_022213C8
	pop {r3, r4, r5, pc}
	.align 2, 0
_022211B0: .4byte 0x00001FB8
_022211B4: .4byte 0x022253C4
	thumb_func_end ov08_0222114C

	thumb_func_start ov08_022211B8
ov08_022211B8: @ 0x022211B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _0222122C @ =0x00001FB8
	movs r2, #0xc
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r0, [r5]
	movs r2, #0x48
	adds r0, #0x34
	ldrb r0, [r0]
	adds r0, #0x15
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _0222122C @ =0x00001FB8
	ldr r0, [r1, r0]
	movs r1, #0x88
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _0222122C @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	adds r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	movs r3, #0x14
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _0222122C @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	adds r0, r5, #0
	bl ov08_02221500
	pop {r3, r4, r5, pc}
	nop
_0222122C: .4byte 0x00001FB8
	thumb_func_end ov08_022211B8

	thumb_func_start ov08_02221230
ov08_02221230: @ 0x02221230
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r1, r5, #4
	ldrb r2, [r0, #0x11]
	movs r0, #0x50
	muls r0, r2, r0
	adds r4, r1, r0
	adds r0, r2, #7
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _02221290 @ =0x00001FB8
	movs r2, #0xc
	ldr r0, [r1, r0]
	movs r1, #0x18
	bl ov08_02220A8C
	ldr r1, [r5]
	ldrh r0, [r4, #0x1a]
	ldrb r1, [r1, #0x11]
	movs r3, #0x14
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221290 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x20
	bl ov08_02220C08
	ldr r1, [r5]
	adds r4, #0x2d
	ldrb r1, [r1, #0x11]
	ldrb r0, [r4]
	movs r3, #0x14
	adds r1, #0x20
	lsls r1, r1, #2
	adds r2, r5, r1
	ldr r1, _02221290 @ =0x00001FB8
	ldr r1, [r2, r1]
	movs r2, #0x28
	bl ov08_02220C3C
	adds r0, r5, #0
	bl ov08_022213C8
	adds r0, r5, #0
	bl ov08_02221500
	pop {r3, r4, r5, pc}
	.align 2, 0
_02221290: .4byte 0x00001FB8
	thumb_func_end ov08_02221230

	thumb_func_start ov08_02221294
ov08_02221294: @ 0x02221294
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	adds r2, r6, #4
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	movs r4, #0
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp]
_022212A8:
	ldr r0, [sp]
	lsls r5, r4, #3
	adds r3, r0, r5
	ldrh r0, [r3, #0x30]
	cmp r0, #0
	beq _022212DC
	lsls r0, r4, #2
	adds r3, #0x34
	adds r7, r6, r0
	ldr r1, _02221314 @ =0x0000200C
	ldr r2, _02221318 @ =0x0000B010
	ldrb r3, [r3]
	ldr r1, [r7, r1]
	adds r0, r6, #0
	adds r2, r4, r2
	bl ov08_02220AEC
	ldr r0, _0222131C @ =0x0222550C
	ldr r1, _0222131C @ =0x0222550C
	adds r2, r0, r5
	ldr r0, _02221314 @ =0x0000200C
	ldr r1, [r1, r5]
	ldr r0, [r7, r0]
	ldr r2, [r2, #4]
	bl ov08_02220A8C
_022212DC:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _022212A8
	ldr r0, [r6]
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _02221312
	movs r1, #3
	bl FUN_02073314
	adds r3, r0, #0
	ldr r1, _02221320 @ =0x0000201C
	lsls r3, r3, #0x18
	ldr r1, [r6, r1]
	ldr r2, _02221324 @ =0x0000B014
	adds r0, r6, #0
	lsrs r3, r3, #0x18
	bl ov08_02220AEC
	ldr r0, _02221320 @ =0x0000201C
	movs r1, #0x58
	ldr r0, [r6, r0]
	movs r2, #0xb0
	bl ov08_02220A8C
_02221312:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221314: .4byte 0x0000200C
_02221318: .4byte 0x0000B010
_0222131C: .4byte 0x0222550C
_02221320: .4byte 0x0000201C
_02221324: .4byte 0x0000B014
	thumb_func_end ov08_02221294

	thumb_func_start ov08_02221328
ov08_02221328: @ 0x02221328
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	adds r2, r7, #4
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	movs r4, #0
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp]
_0222133C:
	ldr r0, [sp]
	lsls r5, r4, #3
	adds r0, r0, r5
	ldrh r0, [r0, #0x30]
	cmp r0, #0
	beq _0222137A
	lsls r1, r4, #2
	adds r6, r7, r1
	movs r1, #0xb
	bl FUN_02073314
	adds r3, r0, #0
	ldr r1, _022213B4 @ =0x0000200C
	ldr r2, _022213B8 @ =0x0000B010
	adds r3, #0x12
	lsls r3, r3, #0x18
	ldr r1, [r6, r1]
	adds r0, r7, #0
	adds r2, r4, r2
	lsrs r3, r3, #0x18
	bl ov08_02220AEC
	ldr r0, _022213BC @ =0x0222550C
	ldr r1, _022213BC @ =0x0222550C
	adds r2, r0, r5
	ldr r0, _022213B4 @ =0x0000200C
	ldr r1, [r1, r5]
	ldr r0, [r6, r0]
	ldr r2, [r2, #4]
	bl ov08_02220A8C
_0222137A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _0222133C
	ldr r0, [r7]
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _022213B2
	movs r1, #0xb
	bl FUN_02073314
	adds r3, r0, #0
	ldr r1, _022213C0 @ =0x0000201C
	adds r3, #0x12
	lsls r3, r3, #0x18
	ldr r1, [r7, r1]
	ldr r2, _022213C4 @ =0x0000B014
	adds r0, r7, #0
	lsrs r3, r3, #0x18
	bl ov08_02220AEC
	ldr r0, _022213C0 @ =0x0000201C
	movs r1, #0x58
	ldr r0, [r7, r0]
	movs r2, #0xb0
	bl ov08_02220A8C
_022213B2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022213B4: .4byte 0x0000200C
_022213B8: .4byte 0x0000B010
_022213BC: .4byte 0x0222550C
_022213C0: .4byte 0x0000201C
_022213C4: .4byte 0x0000B014
	thumb_func_end ov08_02221328

	thumb_func_start ov08_022213C8
ov08_022213C8: @ 0x022213C8
	push {r3, lr}
	ldr r1, _022213E0 @ =0x00002077
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bne _022213DA
	bl ov08_02221294
	pop {r3, pc}
_022213DA:
	bl ov08_02221328
	pop {r3, pc}
	.align 2, 0
_022213E0: .4byte 0x00002077
	thumb_func_end ov08_022213C8

	thumb_func_start ov08_022213E4
ov08_022213E4: @ 0x022213E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0200DC64
	cmp r4, r0
	beq _02221402
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200DCC0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200DC4C
_02221402:
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_022213E4

	thumb_func_start ov08_02221404
ov08_02221404: @ 0x02221404
	push {r3, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x10]
	cmp r0, #0
	bne _02221412
	movs r0, #0
	pop {r3, pc}
_02221412:
	ldrb r1, [r2, #0x17]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1c
	cmp r1, #7
	beq _02221424
	cmp r1, #6
	beq _02221424
	movs r0, #5
	pop {r3, pc}
_02221424:
	ldrh r1, [r2, #0x12]
	movs r2, #0x30
	bl FUN_020880B0
	cmp r0, #4
	bhi _02221456
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222143C: @ jump table
	.2byte _02221456 - _0222143C - 2 @ case 0
	.2byte _02221452 - _0222143C - 2 @ case 1
	.2byte _0222144E - _0222143C - 2 @ case 2
	.2byte _0222144A - _0222143C - 2 @ case 3
	.2byte _02221446 - _0222143C - 2 @ case 4
_02221446:
	movs r0, #1
	pop {r3, pc}
_0222144A:
	movs r0, #2
	pop {r3, pc}
_0222144E:
	movs r0, #3
	pop {r3, pc}
_02221452:
	movs r0, #4
	pop {r3, pc}
_02221456:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov08_02221404

	thumb_func_start ov08_0222145C
ov08_0222145C: @ 0x0222145C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r4, #0
	ldr r0, [r0]
	bl FUN_02074640
	cmp r0, #0
	ble _022214B4
	adds r7, r5, #4
_02221470:
	movs r0, #0x50
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r5, r1
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _022214A2
	adds r0, r7, r1
	bl ov08_02221404
	adds r1, r0, #0
	lsls r0, r4, #2
	adds r6, r5, r0
	ldr r0, _022214B8 @ =0x00001FD4
	lsls r1, r1, #0x18
	ldr r0, [r6, r0]
	lsrs r1, r1, #0x18
	bl ov08_022213E4
	ldr r0, _022214B8 @ =0x00001FD4
	movs r1, #1
	ldr r0, [r6, r0]
	lsls r1, r1, #0xc
	bl FUN_0200DC34
_022214A2:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02074640
	cmp r4, r0
	blt _02221470
_022214B4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022214B8: .4byte 0x00001FD4
	thumb_func_end ov08_0222145C

	thumb_func_start ov08_022214BC
ov08_022214BC: @ 0x022214BC
	push {r4, lr}
	adds r4, r2, #0
	cmp r4, r1
	ble _022214E2
	adds r0, #0x2c
	subs r1, r4, r1
	muls r1, r0, r1
	lsls r0, r1, #0x10
	movs r1, #0x4b
	lsls r1, r1, #2
	blx FUN_020F2BA4
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	subs r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4, pc}
_022214E2:
	adds r0, #0x2c
	subs r1, r1, r4
	muls r1, r0, r1
	lsls r0, r1, #0x10
	movs r1, #0x4b
	lsls r1, r1, #2
	blx FUN_020F2BA4
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	pop {r4, pc}
	thumb_func_end ov08_022214BC

	thumb_func_start ov08_02221500
ov08_02221500: @ 0x02221500
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	adds r5, r6, #4
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	adds r4, r1, #0
	muls r4, r0, r4
	ldr r0, _02221618 @ =0x00002024
	movs r1, #0
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _0222161C @ =0x00002028
	movs r1, #1
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _02221620 @ =0x0000202C
	movs r1, #3
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _02221624 @ =0x00002030
	movs r1, #4
	ldr r0, [r6, r0]
	bl ov08_022213E4
	ldr r0, _02221628 @ =0x00002034
	movs r1, #2
	ldr r0, [r6, r0]
	bl ov08_022213E4
	adds r0, r5, r4
	adds r0, #0x28
	movs r1, #0x90
	ldrb r0, [r0]
	adds r2, r1, #0
	bl ov08_022214BC
	adds r7, r0, #0
	adds r0, r5, r4
	adds r0, #0x28
	ldrb r0, [r0]
	movs r1, #2
	movs r2, #0x18
	bl ov08_022214BC
	adds r2, r0, #0
	ldr r0, _02221618 @ =0x00002024
	adds r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	adds r0, r5, r4
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #0xa4
	movs r2, #0x90
	bl ov08_022214BC
	adds r7, r0, #0
	adds r0, r5, r4
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #0x10
	movs r2, #0x18
	bl ov08_022214BC
	adds r2, r0, #0
	ldr r0, _0222161C @ =0x00002028
	adds r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	adds r0, r5, r4
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #0x9c
	movs r2, #0x90
	bl ov08_022214BC
	adds r7, r0, #0
	adds r0, r5, r4
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r1, #0x29
	movs r2, #0x18
	bl ov08_022214BC
	adds r2, r0, #0
	ldr r0, _02221620 @ =0x0000202C
	adds r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	adds r0, r5, r4
	adds r0, #0x2b
	ldrb r0, [r0]
	movs r1, #0x83
	movs r2, #0x8f
	bl ov08_022214BC
	adds r7, r0, #0
	adds r0, r5, r4
	adds r0, #0x2b
	ldrb r0, [r0]
	movs r1, #0x29
	movs r2, #0x18
	bl ov08_022214BC
	adds r2, r0, #0
	ldr r0, _02221624 @ =0x00002030
	adds r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	adds r0, r5, r4
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7b
	movs r2, #0x8f
	bl ov08_022214BC
	adds r7, r0, #0
	adds r0, r5, r4
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x10
	movs r2, #0x18
	bl ov08_022214BC
	adds r2, r0, #0
	ldr r0, _02221628 @ =0x00002034
	adds r1, r7, #0
	ldr r0, [r6, r0]
	bl ov08_02220A8C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02221618: .4byte 0x00002024
_0222161C: .4byte 0x00002028
_02221620: .4byte 0x0000202C
_02221624: .4byte 0x00002030
_02221628: .4byte 0x00002034
	thumb_func_end ov08_02221500

	thumb_func_start ov08_0222162C
ov08_0222162C: @ 0x0222162C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0223A8E4
	ldr r1, _02221688 @ =0x0000B018
	movs r2, #0x7a
	str r1, [sp]
	subs r1, #0xc
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r1, _0222168C @ =0x00001FB4
	ldr r3, [r5]
	lsls r2, r2, #2
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r3, [r3, #0xc]
	adds r4, r0, #0
	bl FUN_0226B8FC
	ldr r3, _02221690 @ =0x0000B00C
	movs r0, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r1, _0222168C @ =0x00001FB4
	ldr r2, [r5]
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	adds r0, r4, #0
	adds r3, #0xc
	bl FUN_0226B9A4
	adds r1, r0, #0
	ldr r0, _02221694 @ =0x00002088
	ldr r0, [r5, r0]
	bl ov08_02224B94
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_02221688: .4byte 0x0000B018
_0222168C: .4byte 0x00001FB4
_02221690: .4byte 0x0000B00C
_02221694: .4byte 0x00002088
	thumb_func_end ov08_0222162C

	thumb_func_start ov08_02221698
ov08_02221698: @ 0x02221698
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _022216C0 @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B84
	bl FUN_0226BA28
	ldr r2, _022216C4 @ =0x0000B00C
	ldr r0, _022216C8 @ =0x00001FB4
	str r2, [sp]
	adds r1, r2, #0
	ldr r0, [r4, r0]
	adds r1, #0xc
	adds r3, r2, #0
	bl FUN_0226B97C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_022216C0: .4byte 0x00002088
_022216C4: .4byte 0x0000B00C
_022216C8: .4byte 0x00001FB4
	thumb_func_end ov08_02221698

	thumb_func_start ov08_022216CC
ov08_022216CC: @ 0x022216CC
	push {r3, lr}
	ldr r1, _022216F0 @ =0x00002077
	ldrb r2, [r0, r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	bne _022216E4
	adds r1, #0x11
	ldr r0, [r0, r1]
	movs r1, #0x5f
	bl ov08_02224BF8
	pop {r3, pc}
_022216E4:
	adds r1, #0x11
	ldr r0, [r0, r1]
	movs r1, #0x7f
	bl ov08_02224BF8
	pop {r3, pc}
	.align 2, 0
_022216F0: .4byte 0x00002077
	thumb_func_end ov08_022216CC

	thumb_func_start ov08_022216F4
ov08_022216F4: @ 0x022216F4
	push {r3, lr}
	ldr r1, _02221718 @ =0x00002077
	ldrb r2, [r0, r1]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	bne _0222170C
	adds r1, #0x11
	ldr r0, [r0, r1]
	movs r1, #5
	bl ov08_02224BF8
	pop {r3, pc}
_0222170C:
	adds r1, #0x11
	ldr r0, [r0, r1]
	movs r1, #7
	bl ov08_02224BF8
	pop {r3, pc}
	.align 2, 0
_02221718: .4byte 0x00002077
	thumb_func_end ov08_022216F4

	thumb_func_start ov08_0222171C
ov08_0222171C: @ 0x0222171C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, _022217BC @ =0x00002088
	ldr r1, _022217C0 @ =0x022254BC
	lsls r2, r5, #2
	ldr r0, [r4, r0]
	ldr r1, [r1, r2]
	bl ov08_02224BCC
	cmp r5, #9
	bhi _022217BA
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02221740: @ jump table
	.2byte _02221754 - _02221740 - 2 @ case 0
	.2byte _0222176E - _02221740 - 2 @ case 1
	.2byte _022217BA - _02221740 - 2 @ case 2
	.2byte _02221784 - _02221740 - 2 @ case 3
	.2byte _02221784 - _02221740 - 2 @ case 4
	.2byte _022217BA - _02221740 - 2 @ case 5
	.2byte _02221794 - _02221740 - 2 @ case 6
	.2byte _022217A8 - _02221740 - 2 @ case 7
	.2byte _02221794 - _02221740 - 2 @ case 8
	.2byte _022217A8 - _02221740 - 2 @ case 9
_02221754:
	ldr r1, [r4]
	ldr r0, _022217BC @ =0x00002088
	ldrb r1, [r1, #0x11]
	ldr r0, [r4, r0]
	bl ov08_02224B98
	ldr r0, _022217C4 @ =0x0000208C
	movs r1, #0
	strb r1, [r4, r0]
	ldr r0, [r4]
	adds r0, #0x34
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_0222176E:
	ldr r1, _022217BC @ =0x00002088
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldrb r1, [r4, r1]
	bl ov08_02224B98
	ldr r0, [r4]
	movs r1, #0
	adds r0, #0x34
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02221784:
	ldr r1, [r4]
	ldr r0, _022217BC @ =0x00002088
	adds r1, #0x34
	ldrb r1, [r1]
	ldr r0, [r4, r0]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
_02221794:
	adds r0, r4, #0
	bl ov08_022216CC
	ldr r1, _022217BC @ =0x00002088
	ldr r0, [r4, r1]
	adds r1, r1, #5
	ldrb r1, [r4, r1]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
_022217A8:
	adds r0, r4, #0
	bl ov08_022216F4
	ldr r1, _022217BC @ =0x00002088
	ldr r0, [r4, r1]
	adds r1, r1, #6
	ldrb r1, [r4, r1]
	bl ov08_02224B98
_022217BA:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022217BC: .4byte 0x00002088
_022217C0: .4byte 0x022254BC
_022217C4: .4byte 0x0000208C
	thumb_func_end ov08_0222171C

	thumb_func_start ov08_022217C8
ov08_022217C8: @ 0x022217C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _022217EC @ =0x00002088
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov08_02224B90
	ldr r0, _022217EC @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224BC0
	ldr r0, _022217EC @ =0x00002088
	ldr r0, [r4, r0]
	bl ov08_02224B84
	bl FUN_0226BB68
	pop {r4, pc}
	.align 2, 0
_022217EC: .4byte 0x00002088
	thumb_func_end ov08_022217C8

	thumb_func_start ov08_022217F0
ov08_022217F0: @ 0x022217F0
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x7b
	lsls r0, r0, #2
	movs r2, #0
	adds r0, r5, r0
	adds r3, r2, #0
	adds r4, r1, #0
	bl ov08_02221BD0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xab
	lsls r0, r0, #2
	movs r3, #6
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	str r3, [sp, #4]
	bl ov08_02221BD0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0xdb
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0xc
	bl ov08_02221BD0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, _02221AB0 @ =0x0000042C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x12
	bl ov08_02221BD0
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, _02221AB4 @ =0x000004EC
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0
	bl ov08_02221BD0
	ldr r0, _02221AB8 @ =0x000005AC
	movs r2, #0x10
	str r2, [sp]
	movs r3, #6
	adds r0, r5, r0
	adds r1, r4, #0
	str r3, [sp, #4]
	bl ov08_02221BD0
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, _02221ABC @ =0x0000066C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0xc
	bl ov08_02221BD0
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, _02221AC0 @ =0x0000072C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0x12
	bl ov08_02221BD0
	movs r0, #0xd
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _02221AC4 @ =0x000007EC
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x27
	bl ov08_02221BD0
	movs r0, #0xd
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _02221AC8 @ =0x0000086E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x2c
	bl ov08_02221BD0
	movs r2, #0xd
	str r2, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #0x8f
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x27
	bl ov08_02221BD0
	movs r2, #0xd
	str r2, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _02221ACC @ =0x00000972
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0x2c
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AD0 @ =0x000009F4
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x31
	bl ov08_02221BD0
	ldr r0, _02221AD4 @ =0x00000A26
	movs r2, #5
	str r2, [sp]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x31
	str r2, [sp, #4]
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AD8 @ =0x00000A58
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xa
	movs r3, #0x31
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221ADC @ =0x00000A8A
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xf
	movs r3, #0x31
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AE0 @ =0x00000ABC
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x36
	bl ov08_02221BD0
	ldr r0, _02221AE4 @ =0x00000AEE
	movs r2, #5
	str r2, [sp]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x36
	str r2, [sp, #4]
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xb2
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0xa
	movs r3, #0x36
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AE8 @ =0x00000B52
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xf
	movs r3, #0x36
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AEC @ =0x00000B84
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1a
	movs r3, #0x18
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AF0 @ =0x00000BB6
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1a
	movs r3, #0x1d
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AF4 @ =0x00000BE8
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1a
	movs r3, #0x22
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02221AF8 @ =0x00000C1A
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1a
	movs r3, #0x27
	bl ov08_02221BD0
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #0x6d
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x18
	bl ov08_02221BD0
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _02221AFC @ =0x00001C44
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x1d
	bl ov08_02221BD0
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _02221B00 @ =0x00001D48
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x22
	bl ov08_02221BD0
	movs r0, #9
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02221B04 @ =0x00001E4C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x14
	movs r3, #0x31
	bl ov08_02221BD0
	movs r0, #9
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02221B08 @ =0x00001E94
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x14
	movs r3, #0x35
	bl ov08_02221BD0
	movs r0, #9
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02221B0C @ =0x00001EDC
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x14
	movs r3, #0x39
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02221B10 @ =0x00001F24
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x3b
	bl ov08_02221BD0
	movs r2, #5
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02221B14 @ =0x00001F38
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0x3b
	bl ov08_02221BD0
	movs r0, #5
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _02221B18 @ =0x00001F4C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xa
	movs r3, #0x3b
	bl ov08_02221BD0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02221AB0: .4byte 0x0000042C
_02221AB4: .4byte 0x000004EC
_02221AB8: .4byte 0x000005AC
_02221ABC: .4byte 0x0000066C
_02221AC0: .4byte 0x0000072C
_02221AC4: .4byte 0x000007EC
_02221AC8: .4byte 0x0000086E
_02221ACC: .4byte 0x00000972
_02221AD0: .4byte 0x000009F4
_02221AD4: .4byte 0x00000A26
_02221AD8: .4byte 0x00000A58
_02221ADC: .4byte 0x00000A8A
_02221AE0: .4byte 0x00000ABC
_02221AE4: .4byte 0x00000AEE
_02221AE8: .4byte 0x00000B52
_02221AEC: .4byte 0x00000B84
_02221AF0: .4byte 0x00000BB6
_02221AF4: .4byte 0x00000BE8
_02221AF8: .4byte 0x00000C1A
_02221AFC: .4byte 0x00001C44
_02221B00: .4byte 0x00001D48
_02221B04: .4byte 0x00001E4C
_02221B08: .4byte 0x00001E94
_02221B0C: .4byte 0x00001EDC
_02221B10: .4byte 0x00001F24
_02221B14: .4byte 0x00001F38
_02221B18: .4byte 0x00001F4C
	thumb_func_end ov08_022217F0

	thumb_func_start ov08_02221B1C
ov08_02221B1C: @ 0x02221B1C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	ldr r0, _02221BC4 @ =0x00000C4C
	movs r2, #0
	adds r0, r5, r0
	adds r3, r2, #0
	adds r4, r1, #0
	bl ov08_02221BD0
	movs r0, #0x1e
	str r0, [sp]
	ldr r0, _02221BC8 @ =0x00001048
	movs r3, #0x11
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	str r3, [sp, #4]
	bl ov08_02221BD0
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0x11
	str r0, [sp, #4]
	ldr r0, _02221BCC @ =0x00001444
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x22
	bl ov08_02221BD0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x61
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x33
	bl ov08_02221BD0
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x19
	lsls r0, r0, #8
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x33
	bl ov08_02221BD0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x67
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x39
	bl ov08_02221BD0
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0x6a
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x39
	bl ov08_02221BD0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02221BC4: .4byte 0x00000C4C
_02221BC8: .4byte 0x00001048
_02221BCC: .4byte 0x00001444
	thumb_func_end ov08_02221B1C

	thumb_func_start ov08_02221BD0
ov08_02221BD0: @ 0x02221BD0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r0, sp, #8
	mov lr, r3
	ldrb r3, [r0, #0x14]
	movs r6, #0
	mov ip, r3
	cmp r3, #0
	ble _02221C1C
	ldrb r3, [r0, #0x10]
	lsls r2, r2, #1
	adds r7, r1, r2
_02221BE8:
	movs r2, #0
	cmp r3, #0
	ble _02221C10
	mov r0, lr
	adds r0, r0, r6
	lsls r0, r0, #6
	adds r5, r7, r0
	adds r0, r6, #0
	muls r0, r3, r0
	lsls r1, r0, #1
	ldr r0, [sp]
	adds r4, r0, r1
_02221C00:
	lsls r1, r2, #1
	ldrh r0, [r5, r1]
	strh r0, [r4, r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _02221C00
_02221C10:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, ip
	cmp r6, r0
	blt _02221BE8
_02221C1C:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_02221BD0

	thumb_func_start ov08_02221C20
ov08_02221C20: @ 0x02221C20
	cmp r1, #0x21
	bhi _02221D06
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02221C30: @ jump table
	.2byte _02221C74 - _02221C30 - 2 @ case 0
	.2byte _02221C74 - _02221C30 - 2 @ case 1
	.2byte _02221C74 - _02221C30 - 2 @ case 2
	.2byte _02221C74 - _02221C30 - 2 @ case 3
	.2byte _02221C74 - _02221C30 - 2 @ case 4
	.2byte _02221C74 - _02221C30 - 2 @ case 5
	.2byte _02221C92 - _02221C30 - 2 @ case 6
	.2byte _02221C9E - _02221C30 - 2 @ case 7
	.2byte _02221CAC - _02221C30 - 2 @ case 8
	.2byte _02221CAC - _02221C30 - 2 @ case 9
	.2byte _02221CAC - _02221C30 - 2 @ case 10
	.2byte _02221CAC - _02221C30 - 2 @ case 11
	.2byte _02221CB8 - _02221C30 - 2 @ case 12
	.2byte _02221CC4 - _02221C30 - 2 @ case 13
	.2byte _02221CD0 - _02221C30 - 2 @ case 14
	.2byte _02221CD0 - _02221C30 - 2 @ case 15
	.2byte _02221CD0 - _02221C30 - 2 @ case 16
	.2byte _02221CD0 - _02221C30 - 2 @ case 17
	.2byte _02221CEE - _02221C30 - 2 @ case 18
	.2byte _02221CD0 - _02221C30 - 2 @ case 19
	.2byte _02221CD0 - _02221C30 - 2 @ case 20
	.2byte _02221CD0 - _02221C30 - 2 @ case 21
	.2byte _02221CD0 - _02221C30 - 2 @ case 22
	.2byte _02221CD0 - _02221C30 - 2 @ case 23
	.2byte _02221CD0 - _02221C30 - 2 @ case 24
	.2byte _02221CD0 - _02221C30 - 2 @ case 25
	.2byte _02221CD0 - _02221C30 - 2 @ case 26
	.2byte _02221CD0 - _02221C30 - 2 @ case 27
	.2byte _02221CDE - _02221C30 - 2 @ case 28
	.2byte _02221CDE - _02221C30 - 2 @ case 29
	.2byte _02221CFA - _02221C30 - 2 @ case 30
	.2byte _02221CFA - _02221C30 - 2 @ case 31
	.2byte _02221CFA - _02221C30 - 2 @ case 32
	.2byte _02221CFA - _02221C30 - 2 @ case 33
_02221C74:
	cmp r3, #0
	bne _02221C86
	movs r1, #0x7b
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xc0
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221C86:
	ldr r1, _02221D0C @ =0x000004EC
	adds r1, r0, r1
	movs r0, #0xc0
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221C92:
	ldr r1, _02221D10 @ =0x00000B84
	adds r1, r0, r1
	movs r0, #0x32
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221C9E:
	ldr r1, _02221D14 @ =0x00000C4C
	adds r1, r0, r1
	movs r0, #0xff
	lsls r0, r0, #2
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221CAC:
	ldr r1, _02221D18 @ =0x000007EC
	adds r1, r0, r1
	movs r0, #0x82
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221CB8:
	ldr r1, _02221D1C @ =0x000009F4
	adds r1, r0, r1
	movs r0, #0x32
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221CC4:
	ldr r1, _02221D20 @ =0x00000ABC
	adds r1, r0, r1
	movs r0, #0x32
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221CD0:
	movs r1, #0x61
	lsls r1, r1, #6
	adds r1, r0, r1
	movs r0, #0xc0
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221CDE:
	movs r1, #0x6d
	lsls r1, r1, #6
	adds r1, r0, r1
	lsls r0, r2, #6
	adds r0, r2, r0
	lsls r0, r0, #2
	adds r0, r1, r0
	bx lr
_02221CEE:
	ldr r1, _02221D24 @ =0x00001E4C
	adds r1, r0, r1
	movs r0, #0x48
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221CFA:
	ldr r1, _02221D28 @ =0x00001F24
	adds r1, r0, r1
	movs r0, #0x14
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02221D06:
	movs r0, #0
	bx lr
	nop
_02221D0C: .4byte 0x000004EC
_02221D10: .4byte 0x00000B84
_02221D14: .4byte 0x00000C4C
_02221D18: .4byte 0x000007EC
_02221D1C: .4byte 0x000009F4
_02221D20: .4byte 0x00000ABC
_02221D24: .4byte 0x00001E4C
_02221D28: .4byte 0x00001F24
	thumb_func_end ov08_02221C20

	thumb_func_start ov08_02221D2C
ov08_02221D2C: @ 0x02221D2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r2, #0
	adds r2, r3, #0
	add r3, sp, #0x10
	adds r4, r1, #0
	ldrb r3, [r3, #0x10]
	adds r1, r7, #0
	str r0, [sp]
	bl ov08_02221C20
	adds r1, r0, #0
	ldr r2, _02221E60 @ =0x02225A56
	lsls r0, r7, #2
	ldrb r6, [r2, r0]
	ldr r2, _02221E64 @ =0x02225A57
	ldrb r0, [r2, r0]
	adds r5, r6, #0
	muls r5, r0, r5
	adds r0, r4, #0
	lsls r2, r5, #1
	blx FUN_020E5AD8
	cmp r7, #5
	bgt _02221D7A
	cmp r7, #0
	blt _02221E5C
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02221D6E: @ jump table
	.2byte _02221D82 - _02221D6E - 2 @ case 0
	.2byte _02221D82 - _02221D6E - 2 @ case 1
	.2byte _02221D82 - _02221D6E - 2 @ case 2
	.2byte _02221D82 - _02221D6E - 2 @ case 3
	.2byte _02221D82 - _02221D6E - 2 @ case 4
	.2byte _02221D82 - _02221D6E - 2 @ case 5
_02221D7A:
	cmp r7, #0x1b
	beq _02221E3C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221D82:
	movs r0, #0x50
	adds r1, r7, #0
	muls r1, r0, r1
	ldr r0, [sp]
	adds r0, r0, r1
	ldrh r1, [r0, #8]
	cmp r1, #0
	beq _02221E5C
	ldrb r1, [r0, #0x1b]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	beq _02221DE2
	lsls r2, r6, #1
	adds r0, r2, #5
	lsls r0, r0, #1
	ldrh r1, [r4, r0]
	add r0, sp, #4
	strh r1, [r0]
	adds r1, r6, r2
	adds r1, r1, #5
	lsls r1, r1, #1
	ldrh r1, [r4, r1]
	strh r1, [r0, #2]
	movs r1, #0
	add r0, sp, #4
_02221DB4:
	adds r5, r1, #2
	lsls r3, r1, #1
	adds r7, r5, #0
	muls r7, r6, r7
	lsls r5, r7, #1
	ldrh r3, [r0, r3]
	movs r2, #0
	adds r5, r4, r5
_02221DC4:
	lsls r7, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #0x18
	adds r7, r5, r7
	lsrs r2, r2, #0x18
	strh r3, [r7, #0xc]
	cmp r2, #9
	blo _02221DC4
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #2
	blo _02221DB4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221DE2:
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	bne _02221E0C
	movs r1, #0
	cmp r5, #0
	ble _02221E5C
	movs r3, #2
	ldr r2, _02221E68 @ =0x00000FFF
	lsls r3, r3, #0xc
_02221DF4:
	lsls r0, r1, #1
	ldrh r6, [r4, r0]
	ands r6, r2
	orrs r6, r3
	strh r6, [r4, r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r5
	blt _02221DF4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221E0C:
	lsls r1, r7, #0x18
	ldr r0, [sp]
	lsrs r1, r1, #0x18
	bl ov08_0221DB24
	cmp r0, #1
	bne _02221E5C
	movs r1, #0
	cmp r5, #0
	ble _02221E5C
	ldr r2, _02221E68 @ =0x00000FFF
	adds r3, r2, #1
_02221E24:
	lsls r0, r1, #1
	ldrh r6, [r4, r0]
	ands r6, r2
	orrs r6, r3
	strh r6, [r4, r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r5
	blt _02221E24
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02221E3C:
	movs r1, #0
	cmp r5, #0
	ble _02221E5C
	movs r3, #0xa
	ldr r2, _02221E68 @ =0x00000FFF
	lsls r3, r3, #0xc
_02221E48:
	lsls r0, r1, #1
	ldrh r6, [r4, r0]
	ands r6, r2
	orrs r6, r3
	strh r6, [r4, r0]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r5
	blt _02221E48
_02221E5C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221E60: .4byte 0x02225A56
_02221E64: .4byte 0x02225A57
_02221E68: .4byte 0x00000FFF
	thumb_func_end ov08_02221D2C

	thumb_func_start ov08_02221E6C
ov08_02221E6C: @ 0x02221E6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	lsls r4, r0, #2
	ldr r0, _02221ED8 @ =0x02225A57
	ldrb r7, [r0, r4]
	ldr r0, _02221EDC @ =0x02225A56
	ldrb r6, [r0, r4]
	ldr r0, [r5]
	adds r1, r6, #0
	muls r1, r7, r1
	ldr r0, [r0, #0xc]
	lsls r1, r1, #1
	bl FUN_0201AA8C
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	bl ov08_02221D2C
	ldr r0, _02221EE0 @ =0x02225A55
	ldr r3, _02221EE4 @ =0x02225A54
	ldrb r0, [r0, r4]
	ldrb r3, [r3, r4]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	str r6, [sp, #4]
	movs r0, #0x79
	str r7, [sp, #8]
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_0201C4C4
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_0201EFBC
	ldr r0, [sp, #0x18]
	bl FUN_0201AB0C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02221ED8: .4byte 0x02225A57
_02221EDC: .4byte 0x02225A56
_02221EE0: .4byte 0x02225A55
_02221EE4: .4byte 0x02225A54
	thumb_func_end ov08_02221E6C

	thumb_func_start ov08_02221EE8
ov08_02221EE8: @ 0x02221EE8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02221F88 @ =0x022259CC
	lsls r3, r1, #2
	ldr r6, [r0, r3]
	cmp r6, #0
	beq _02221F86
	cmp r1, #5
	bhi _02221F02
	ldr r0, _02221F8C @ =0x022259BC
	ldrb r0, [r0, r2]
	str r0, [sp]
	b _02221F08
_02221F02:
	ldr r0, _02221F90 @ =0x022259AC
	ldrb r0, [r0, r2]
	str r0, [sp]
_02221F08:
	cmp r2, #0
	beq _02221F16
	cmp r2, #1
	beq _02221F1A
	cmp r2, #2
	beq _02221F1E
	b _02221F20
_02221F16:
	movs r7, #1
	b _02221F20
_02221F1A:
	movs r7, #0
	b _02221F20
_02221F1E:
	movs r7, #1
_02221F20:
	cmp r1, #0xe
	blo _02221F54
	cmp r1, #0x11
	bhi _02221F54
	ldr r1, _02221F94 @ =0x00002070
	ldr r2, [sp]
	ldr r0, [r5, r1]
	adds r1, r1, #5
	ldrb r1, [r5, r1]
	movs r3, #0
	ldrb r1, [r6, r1]
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r1, r7, #0
	bl FUN_0201EC48
	ldr r1, _02221F94 @ =0x00002070
	ldr r0, [r5, r1]
	adds r1, r1, #5
	ldrb r1, [r5, r1]
	ldrb r1, [r6, r1]
	lsls r1, r1, #4
	adds r0, r0, r1
	bl FUN_0201D5C8
	pop {r3, r4, r5, r6, r7, pc}
_02221F54:
	movs r4, #0
_02221F56:
	ldrb r2, [r6, r4]
	cmp r2, #0xff
	beq _02221F86
	ldr r0, _02221F94 @ =0x00002070
	movs r3, #0
	ldr r1, [r5, r0]
	lsls r0, r2, #4
	adds r0, r1, r0
	ldr r2, [sp]
	adds r1, r7, #0
	bl FUN_0201EC48
	ldr r0, _02221F94 @ =0x00002070
	ldr r1, [r5, r0]
	ldrb r0, [r6, r4]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #8
	blo _02221F56
_02221F86:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02221F88: .4byte 0x022259CC
_02221F8C: .4byte 0x022259BC
_02221F90: .4byte 0x022259AC
_02221F94: .4byte 0x00002070
	thumb_func_end ov08_02221EE8

	thumb_func_start ov08_02221F98
ov08_02221F98: @ 0x02221F98
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x1b
	bhi _0222209C
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02221FAE: @ jump table
	.2byte _02221FE6 - _02221FAE - 2 @ case 0
	.2byte _02221FE6 - _02221FAE - 2 @ case 1
	.2byte _02221FE6 - _02221FAE - 2 @ case 2
	.2byte _02221FE6 - _02221FAE - 2 @ case 3
	.2byte _02221FE6 - _02221FAE - 2 @ case 4
	.2byte _02221FE6 - _02221FAE - 2 @ case 5
	.2byte _0222209C - _02221FAE - 2 @ case 6
	.2byte _02222024 - _02221FAE - 2 @ case 7
	.2byte _0222209C - _02221FAE - 2 @ case 8
	.2byte _0222209C - _02221FAE - 2 @ case 9
	.2byte _0222209C - _02221FAE - 2 @ case 10
	.2byte _0222209C - _02221FAE - 2 @ case 11
	.2byte _0222209C - _02221FAE - 2 @ case 12
	.2byte _0222209C - _02221FAE - 2 @ case 13
	.2byte _02222056 - _02221FAE - 2 @ case 14
	.2byte _02222056 - _02221FAE - 2 @ case 15
	.2byte _02222056 - _02221FAE - 2 @ case 16
	.2byte _02222056 - _02221FAE - 2 @ case 17
	.2byte _0222209C - _02221FAE - 2 @ case 18
	.2byte _0222206E - _02221FAE - 2 @ case 19
	.2byte _0222206E - _02221FAE - 2 @ case 20
	.2byte _0222206E - _02221FAE - 2 @ case 21
	.2byte _0222206E - _02221FAE - 2 @ case 22
	.2byte _02222086 - _02221FAE - 2 @ case 23
	.2byte _02222086 - _02221FAE - 2 @ case 24
	.2byte _02222086 - _02221FAE - 2 @ case 25
	.2byte _02222086 - _02221FAE - 2 @ case 26
	.2byte _02222086 - _02221FAE - 2 @ case 27
_02221FE6:
	ldr r0, _022220A0 @ =0x022259C6
	lsls r1, r2, #1
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	adds r0, #0xd
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	adds r2, r6, #0
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	lsls r0, r5, #2
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	adds r2, r6, #0
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	adds r0, r5, #7
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	adds r2, r6, #0
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	pop {r4, r5, r6, pc}
_02222024:
	ldr r0, _022220A8 @ =0x022259C0
	lsls r1, r2, #1
	ldrsh r5, [r0, r1]
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r2, r5, #0
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	ldr r0, [r4]
	adds r2, r5, #0
	ldrb r0, [r0, #0x11]
	adds r0, r0, #7
	lsls r0, r0, #2
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	pop {r4, r5, r6, pc}
_02222056:
	adds r0, r5, #7
	lsls r0, r0, #2
	lsls r3, r2, #1
	ldr r2, _022220A8 @ =0x022259C0
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	ldrsh r2, [r2, r3]
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	pop {r4, r5, r6, pc}
_0222206E:
	adds r0, r5, #2
	lsls r0, r0, #2
	lsls r3, r2, #1
	ldr r2, _022220A8 @ =0x022259C0
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	ldrsh r2, [r2, r3]
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
	pop {r4, r5, r6, pc}
_02222086:
	subs r0, r5, #2
	lsls r0, r0, #2
	lsls r3, r2, #1
	ldr r2, _022220A8 @ =0x022259C0
	adds r1, r4, r0
	ldr r0, _022220A4 @ =0x00001FB8
	ldrsh r2, [r2, r3]
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DED0
_0222209C:
	pop {r4, r5, r6, pc}
	nop
_022220A0: .4byte 0x022259C6
_022220A4: .4byte 0x00001FB8
_022220A8: .4byte 0x022259C0
	thumb_func_end ov08_02221F98

	thumb_func_start ov08_022220AC
ov08_022220AC: @ 0x022220AC
	push {r4, r5, r6, lr}
	ldr r3, _022220F4 @ =0x00001FA3
	adds r5, r0, #0
	ldrb r6, [r5, r3]
	movs r2, #0x70
	adds r4, r1, #0
	bics r6, r2
	strb r6, [r5, r3]
	cmp r4, #5
	bhi _022220D6
	bl ov08_0221D5DC
	cmp r0, #2
	bne _022220D6
	ldr r1, _022220F4 @ =0x00001FA3
	movs r0, #0x70
	ldrb r2, [r5, r1]
	bics r2, r0
	movs r0, #0x10
	orrs r0, r2
	strb r0, [r5, r1]
_022220D6:
	ldr r0, _022220F8 @ =0x00001FA0
	movs r2, #0
	strb r2, [r5, r0]
	adds r1, r0, #1
	strb r2, [r5, r1]
	adds r1, r0, #2
	strb r4, [r5, r1]
	adds r1, r0, #3
	ldrb r2, [r5, r1]
	movs r1, #0x80
	adds r0, r0, #3
	orrs r1, r2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
	nop
_022220F4: .4byte 0x00001FA3
_022220F8: .4byte 0x00001FA0
	thumb_func_end ov08_022220AC

	thumb_func_start ov08_022220FC
ov08_022220FC: @ 0x022220FC
	push {r4, lr}
	ldr r2, _022221C0 @ =0x00001FA3
	adds r4, r0, #0
	ldrb r3, [r4, r2]
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x1f
	beq _022221BC
	subs r1, r2, #3
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0222211C
	cmp r1, #1
	beq _02222150
	cmp r1, #2
	beq _02222184
	pop {r4, pc}
_0222211C:
	subs r1, r2, #1
	ldrb r1, [r4, r1]
	lsls r3, r3, #0x19
	movs r2, #1
	lsrs r3, r3, #0x1d
	bl ov08_02221E6C
	ldr r1, _022221C4 @ =0x00001FA2
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	movs r2, #1
	bl ov08_02221EE8
	ldr r1, _022221C4 @ =0x00001FA2
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	movs r2, #1
	bl ov08_02221F98
	ldr r0, _022221C8 @ =0x00001FA1
	movs r1, #0
	strb r1, [r4, r0]
	movs r1, #1
	subs r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_02222150:
	subs r1, r2, #1
	ldrb r1, [r4, r1]
	lsls r3, r3, #0x19
	movs r2, #2
	lsrs r3, r3, #0x1d
	bl ov08_02221E6C
	ldr r1, _022221C4 @ =0x00001FA2
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	movs r2, #2
	bl ov08_02221EE8
	ldr r1, _022221C4 @ =0x00001FA2
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	movs r2, #2
	bl ov08_02221F98
	ldr r0, _022221C8 @ =0x00001FA1
	movs r1, #0
	strb r1, [r4, r0]
	movs r1, #2
	subs r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_02222184:
	subs r1, r2, #1
	ldrb r1, [r4, r1]
	lsls r3, r3, #0x19
	movs r2, #0
	lsrs r3, r3, #0x1d
	bl ov08_02221E6C
	ldr r1, _022221C4 @ =0x00001FA2
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	movs r2, #0
	bl ov08_02221EE8
	ldr r1, _022221C4 @ =0x00001FA2
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	movs r2, #0
	bl ov08_02221F98
	ldr r0, _022221C8 @ =0x00001FA1
	movs r1, #0
	strb r1, [r4, r0]
	adds r1, r0, #2
	ldrb r2, [r4, r1]
	movs r1, #0x80
	adds r0, r0, #2
	bics r2, r1
	strb r2, [r4, r0]
_022221BC:
	pop {r4, pc}
	nop
_022221C0: .4byte 0x00001FA3
_022221C4: .4byte 0x00001FA2
_022221C8: .4byte 0x00001FA1
	thumb_func_end ov08_022220FC

	thumb_func_start ov08_022221CC
ov08_022221CC: @ 0x022221CC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	cmp r1, #9
	bls _022221D6
	b _0222251E
_022221D6:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022221E2: @ jump table
	.2byte _022221F6 - _022221E2 - 2 @ case 0
	.2byte _0222226E - _022221E2 - 2 @ case 1
	.2byte _022222CA - _022221E2 - 2 @ case 2
	.2byte _0222231E - _022221E2 - 2 @ case 3
	.2byte _022223BC - _022221E2 - 2 @ case 4
	.2byte _02222408 - _022221E2 - 2 @ case 5
	.2byte _02222460 - _022221E2 - 2 @ case 6
	.2byte _022224C0 - _022221E2 - 2 @ case 7
	.2byte _02222460 - _022221E2 - 2 @ case 8
	.2byte _022224F0 - _022221E2 - 2 @ case 9
_022221F6:
	movs r5, #0
	movs r6, #3
	movs r7, #1
_022221FC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov08_0221D5DC
	cmp r0, #0
	bne _02222218
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov08_02221E6C
	b _0222223E
_02222218:
	cmp r0, #1
	bne _0222222C
	lsls r1, r5, #0x18
	movs r2, #0
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl ov08_02221E6C
	b _0222223E
_0222222C:
	cmp r0, #2
	bne _0222223E
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	movs r3, #1
	bl ov08_02221E6C
_0222223E:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #6
	blo _022221FC
	ldr r0, [r4]
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222260
	adds r0, r4, #0
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_02222260:
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_0222226E:
	movs r2, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #7
	adds r3, r2, #0
	bl ov08_02221E6C
	ldr r0, [r4]
	ldrb r1, [r0, #0x11]
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, r4, r0
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _022222B0
	adds r0, r4, #0
	movs r1, #8
	movs r2, #3
	movs r3, #0
	bl ov08_02221E6C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #3
	movs r3, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022222B0:
	movs r2, #0
	adds r0, r4, #0
	movs r1, #8
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0xa
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022222CA:
	bl ov08_02222564
	cmp r0, #1
	bne _022222EC
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0xc
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0xd
	adds r3, r2, #0
	bl ov08_02221E6C
	b _02222304
_022222EC:
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #3
	movs r3, #0
	bl ov08_02221E6C
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl ov08_02221E6C
_02222304:
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0xb
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_0222231E:
	bl ov08_02222564
	cmp r0, #1
	bne _02222340
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0xc
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0xd
	adds r3, r2, #0
	bl ov08_02221E6C
	b _02222358
_02222340:
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #3
	movs r3, #0
	bl ov08_02221E6C
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #3
	movs r3, #0
	bl ov08_02221E6C
_02222358:
	movs r5, #0
	movs r7, #3
	movs r6, #0x50
_0222235E:
	ldr r0, [r4]
	lsls r1, r5, #3
	ldrb r0, [r0, #0x11]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r0, r4, r2
	adds r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _02222386
	adds r1, r5, #0
	adds r1, #0xe
	lsls r1, r1, #0x18
	movs r2, #0
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl ov08_02221E6C
	b _02222398
_02222386:
	adds r1, r5, #0
	adds r1, #0xe
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r2, r7, #0
	movs r3, #0
	bl ov08_02221E6C
_02222398:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	blo _0222235E
	movs r2, #0
	adds r0, r4, #0
	movs r1, #9
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022223BC:
	movs r2, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r5, #0
	movs r6, #2
	adds r7, r5, #0
_022223CC:
	ldr r0, [r4]
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r0, r5
	bne _022223EA
	adds r1, r5, #0
	adds r1, #0x1e
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov08_02221E6C
	b _022223FC
_022223EA:
	adds r1, r5, #0
	adds r1, #0x1e
	lsls r1, r1, #0x18
	movs r2, #0
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl ov08_02221E6C
_022223FC:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	blo _022223CC
	pop {r3, r4, r5, r6, r7, pc}
_02222408:
	movs r5, #0
	movs r7, #3
	movs r6, #0x50
_0222240E:
	ldr r0, [r4]
	lsls r1, r5, #3
	ldrb r0, [r0, #0x11]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r0, r4, r2
	adds r0, r1, r0
	ldrh r0, [r0, #0x34]
	cmp r0, #0
	beq _02222436
	adds r1, r5, #0
	adds r1, #0x13
	lsls r1, r1, #0x18
	movs r2, #0
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl ov08_02221E6C
	b _02222448
_02222436:
	adds r1, r5, #0
	adds r1, #0x13
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	adds r2, r7, #0
	movs r3, #0
	bl ov08_02221E6C
_02222448:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #4
	blo _0222240E
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_02222460:
	movs r2, #0
	movs r1, #0x17
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x18
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x19
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x1a
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x1b
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	ldr r0, _02222520 @ =0x00002077
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	bne _0222251E
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x12
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022224C0:
	movs r2, #0
	movs r1, #0x1c
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	ldr r0, _02222520 @ =0x00002077
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	bne _0222251E
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x12
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r3, r4, r5, r6, r7, pc}
_022224F0:
	movs r2, #0
	movs r1, #0x1d
	adds r3, r2, #0
	bl ov08_02221E6C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #6
	adds r3, r2, #0
	bl ov08_02221E6C
	ldr r0, _02222520 @ =0x00002077
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	bne _0222251E
	movs r2, #0
	adds r0, r4, #0
	movs r1, #0x12
	adds r3, r2, #0
	bl ov08_02221E6C
_0222251E:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02222520: .4byte 0x00002077
	thumb_func_end ov08_022221CC

	thumb_func_start ov08_02222524
ov08_02222524: @ 0x02222524
	push {r3, lr}
	adds r2, r0, #0
	cmp r1, #3
	bne _02222546
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	movs r1, #0x7e
	lsls r1, r1, #6
	ldr r0, [r2, r0]
	adds r1, r2, r1
	movs r2, #1
	movs r3, #0xc0
	bl FUN_0200316C
	pop {r3, pc}
_02222546:
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r1, _02222560 @ =0x00001F60
	ldr r0, [r2, r0]
	adds r1, r2, r1
	movs r2, #1
	movs r3, #0xc0
	bl FUN_0200316C
	pop {r3, pc}
	nop
_02222560: .4byte 0x00001F60
	thumb_func_end ov08_02222524

	thumb_func_start ov08_02222564
ov08_02222564: @ 0x02222564
	push {r4, r5}
	movs r2, #0
	adds r1, r2, #0
	movs r3, #0x50
_0222256C:
	adds r4, r1, #0
	muls r4, r3, r4
	adds r5, r0, r4
	ldrh r4, [r5, #8]
	cmp r4, #0
	beq _02222586
	ldrb r4, [r5, #0x1b]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x1f
	bne _02222586
	adds r2, r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
_02222586:
	adds r1, r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #6
	blo _0222256C
	cmp r2, #2
	blo _02222598
	movs r0, #1
	b _0222259A
_02222598:
	movs r0, #0
_0222259A:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov08_02222564

	thumb_func_start ov08_022225A4
ov08_022225A4: @ 0x022225A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	ldrb r1, [r1, #0x11]
	bl ov08_0221D5DC
	cmp r0, #2
	bne _022225C4
	ldr r1, [r4]
	adds r0, r4, #0
	ldrb r1, [r1, #0x11]
	movs r2, #0
	movs r3, #1
	bl ov08_02221E6C
	pop {r4, pc}
_022225C4:
	ldr r1, [r4]
	movs r2, #0
	ldrb r1, [r1, #0x11]
	adds r0, r4, #0
	adds r3, r2, #0
	bl ov08_02221E6C
	pop {r4, pc}
	thumb_func_end ov08_022225A4

	thumb_func_start ov08_022225D4
ov08_022225D4: @ 0x022225D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _02222664 @ =ov08_02222670
	ldr r1, _02222668 @ =0x0000115C
	ldr r3, [r5, #0xc]
	movs r2, #0x64
	bl FUN_02007200
	bl FUN_0201F988
	ldr r2, _02222668 @ =0x0000115C
	adds r4, r0, #0
	movs r1, #0
	blx FUN_020E5B44
	str r5, [r4]
	ldr r0, [r5]
	bl FUN_0223A7D4
	str r0, [r4, #4]
	ldr r0, [r5]
	bl FUN_0223A938
	str r0, [r4, #8]
	ldr r0, _0222266C @ =0x0000114A
	movs r1, #0
	strb r1, [r4, r0]
	ldr r0, [r5]
	bl FUN_0223AA84
	adds r6, r0, #0
	movs r5, #0
_02222614:
	ldr r3, [r4]
	adds r0, r6, #0
	adds r2, r3, #0
	adds r2, #0x27
	adds r3, #0x2c
	adds r1, r5, #0
	adds r2, r2, r5
	adds r3, r3, r5
	bl FUN_020787E4
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #5
	blo _02222614
	adds r0, r6, #0
	bl FUN_020787F0
	ldr r1, [r4]
	strh r0, [r1, #0x20]
	adds r0, r6, #0
	bl FUN_020787F4
	ldr r1, [r4]
	strb r0, [r1, #0x1f]
	adds r0, r4, #0
	bl ov08_02223B78
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0223A7E0
	movs r1, #1
	lsls r1, r1, #0xa
	tst r0, r1
	beq _02222662
	ldr r0, [r4]
	movs r1, #1
	str r1, [r0, #0x14]
_02222662:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02222664: .4byte ov08_02222670
_02222668: .4byte 0x0000115C
_0222266C: .4byte 0x0000114A
	thumb_func_end ov08_022225D4

	thumb_func_start ov08_02222670
ov08_02222670: @ 0x02222670
	push {r4, lr}
	ldr r2, _02222768 @ =0x0000114A
	adds r4, r1, #0
	ldrb r2, [r4, r2]
	cmp r2, #0xe
	bhi _02222756
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02222688: @ jump table
	.2byte _022226A6 - _02222688 - 2 @ case 0
	.2byte _022226B2 - _02222688 - 2 @ case 1
	.2byte _022226BE - _02222688 - 2 @ case 2
	.2byte _022226CA - _02222688 - 2 @ case 3
	.2byte _022226D6 - _02222688 - 2 @ case 4
	.2byte _022226E2 - _02222688 - 2 @ case 5
	.2byte _022226EE - _02222688 - 2 @ case 6
	.2byte _022226FA - _02222688 - 2 @ case 7
	.2byte _02222706 - _02222688 - 2 @ case 8
	.2byte _02222712 - _02222688 - 2 @ case 9
	.2byte _0222271E - _02222688 - 2 @ case 10
	.2byte _0222272A - _02222688 - 2 @ case 11
	.2byte _02222736 - _02222688 - 2 @ case 12
	.2byte _02222742 - _02222688 - 2 @ case 13
	.2byte _0222274E - _02222688 - 2 @ case 14
_022226A6:
	adds r0, r4, #0
	bl ov08_0222276C
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226B2:
	adds r0, r4, #0
	bl ov08_02222840
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226BE:
	adds r0, r4, #0
	bl ov08_02222918
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226CA:
	adds r0, r4, #0
	bl ov08_02222AF0
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226D6:
	adds r0, r4, #0
	bl ov08_02222D78
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226E2:
	adds r0, r4, #0
	bl ov08_02222D84
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226EE:
	adds r0, r4, #0
	bl ov08_02222D90
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_022226FA:
	adds r0, r4, #0
	bl ov08_02222A78
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222706:
	adds r0, r4, #0
	bl ov08_02222D9C
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222712:
	adds r0, r4, #0
	bl ov08_02222DAC
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_0222271E:
	adds r0, r4, #0
	bl ov08_02222DC4
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_0222272A:
	adds r0, r4, #0
	bl ov08_02222DEC
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222736:
	adds r0, r4, #0
	bl ov08_02222EC4
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_02222742:
	adds r0, r4, #0
	bl ov08_02222E04
	ldr r1, _02222768 @ =0x0000114A
	strb r0, [r4, r1]
	b _02222756
_0222274E:
	bl ov08_02222E2C
	cmp r0, #1
	beq _02222766
_02222756:
	adds r0, r4, #0
	bl ov08_02224974
	movs r0, #0xc3
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D020
_02222766:
	pop {r4, pc}
	.align 2, 0
_02222768: .4byte 0x0000114A
	thumb_func_end ov08_02222670

	thumb_func_start ov08_0222276C
ov08_0222276C: @ 0x0222276C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _02222830 @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl ov08_02224B64
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl ov08_02223000
	adds r0, r4, #0
	bl ov08_022230F4
	adds r0, r4, #0
	bl ov08_022231E8
	ldr r1, [r4]
	movs r0, #4
	ldr r1, [r1, #0xc]
	bl FUN_02002CEC
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0223AA84
	bl FUN_020787F8
	ldr r1, _02222834 @ =0x0000114D
	strb r0, [r4, r1]
	adds r0, r4, #0
	bl ov08_02223BF4
	ldr r1, _02222838 @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02224A50
	adds r0, r4, #0
	bl ov08_022233B8
	ldr r1, _02222838 @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02223480
	adds r0, r4, #0
	bl ov08_02223D08
	ldr r1, _02222838 @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02223F94
	ldr r0, [r4]
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _022227F0
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov08_02224B90
_022227F0:
	ldr r1, _02222838 @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02224134
	ldr r1, _02222838 @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_0222421C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0xa
	str r0, [sp, #8]
	adds r3, r1, #0
	ldr r0, [r4, #8]
	ldr r2, _0222283C @ =0x0000FFFF
	subs r3, #0x12
	bl FUN_02003370
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _0222282A
	add sp, #0xc
	movs r0, #0xc
	pop {r3, r4, pc}
_0222282A:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02222830: .4byte 0x04001050
_02222834: .4byte 0x0000114D
_02222838: .4byte 0x0000114C
_0222283C: .4byte 0x0000FFFF
	thumb_func_end ov08_0222276C

	thumb_func_start ov08_02222840
ov08_02222840: @ 0x02222840
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02003B44
	cmp r0, #0
	beq _02222852
	movs r0, #1
	pop {r3, r4, r5, pc}
_02222852:
	ldr r1, _0222290C @ =0x02225B4C
	adds r0, r4, #0
	bl ov08_02223368
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _02222878
	ldr r0, [r4, #0x34]
	bl ov08_02224C94
	adds r5, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	bne _0222287E
	movs r5, #5
	b _0222287E
_02222878:
	adds r0, r4, #0
	bl ov08_0222417C
_0222287E:
	cmp r5, #5
	bhi _02222908
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222288E: @ jump table
	.2byte _0222289A - _0222288E - 2 @ case 0
	.2byte _0222289A - _0222288E - 2 @ case 1
	.2byte _0222289A - _0222288E - 2 @ case 2
	.2byte _0222289A - _0222288E - 2 @ case 3
	.2byte _022228BA - _0222288E - 2 @ case 4
	.2byte _022228EA - _0222288E - 2 @ case 5
_0222289A:
	ldr r0, _02222910 @ =0x000005DD
	bl FUN_0200604C
	lsls r0, r5, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _02222914 @ =0x0000114D
	movs r2, #5
	strb r1, [r4, r0]
	subs r0, r0, #2
	strb r2, [r4, r0]
	adds r0, r4, #0
	movs r2, #0
	bl ov08_02224938
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_022228BA:
	ldr r0, [r4]
	ldrh r0, [r0, #0x20]
	cmp r0, #0
	beq _02222908
	ldr r0, _02222910 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4]
	ldrb r1, [r0, #0x1f]
	ldr r0, _02222914 @ =0x0000114D
	strb r1, [r4, r0]
	movs r1, #6
	subs r0, r0, #2
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl ov08_02223BA8
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl ov08_02224938
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_022228EA:
	ldr r0, _02222910 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4]
	movs r2, #0
	strh r2, [r0, #0x1c]
	ldr r0, [r4]
	movs r1, #4
	strb r1, [r0, #0x1e]
	adds r0, r4, #0
	movs r1, #5
	bl ov08_02224938
	movs r0, #0xd
	pop {r3, r4, r5, pc}
_02222908:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222290C: .4byte 0x02225B4C
_02222910: .4byte 0x000005DD
_02222914: .4byte 0x0000114D
	thumb_func_end ov08_02222840

	thumb_func_start ov08_02222918
ov08_02222918: @ 0x02222918
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02222A64 @ =0x02225B68
	adds r4, r0, #0
	bl ov08_02223368
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0222298C
	ldr r0, [r4, #0x34]
	bl ov08_02224B8C
	adds r6, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224B88
	adds r7, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224C94
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224B88
	movs r1, #1
	mvns r1, r1
	cmp r5, r1
	bne _02222956
	movs r5, #6
	b _02222992
_02222956:
	cmp r6, #1
	bne _02222992
	cmp r7, r0
	bne _02222992
	ldr r1, _02222A68 @ =0x021D110C
	movs r2, #0x20
	ldr r1, [r1, #0x4c]
	tst r2, r1
	beq _02222976
	cmp r0, #0
	beq _02222974
	cmp r0, #2
	beq _02222974
	cmp r0, #4
	bne _02222976
_02222974:
	movs r5, #7
_02222976:
	movs r2, #0x10
	tst r1, r2
	beq _02222992
	cmp r0, #1
	beq _02222988
	cmp r0, #3
	beq _02222988
	cmp r0, #5
	bne _02222992
_02222988:
	movs r5, #8
	b _02222992
_0222298C:
	adds r0, r4, #0
	bl ov08_0222417C
_02222992:
	cmp r5, #8
	bhi _02222A60
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022229A2: @ jump table
	.2byte _022229B4 - _022229A2 - 2 @ case 0
	.2byte _022229B4 - _022229A2 - 2 @ case 1
	.2byte _022229B4 - _022229A2 - 2 @ case 2
	.2byte _022229B4 - _022229A2 - 2 @ case 3
	.2byte _022229B4 - _022229A2 - 2 @ case 4
	.2byte _022229B4 - _022229A2 - 2 @ case 5
	.2byte _022229EA - _022229A2 - 2 @ case 6
	.2byte _02222A04 - _022229A2 - 2 @ case 7
	.2byte _02222A32 - _022229A2 - 2 @ case 8
_022229B4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov08_02223CD4
	cmp r0, #0
	beq _02222A60
	ldr r0, _02222A6C @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _02222A70 @ =0x0000114D
	ldr r2, [r4]
	ldrb r1, [r4, r0]
	subs r0, r0, #2
	adds r1, r2, r1
	adds r1, #0x27
	strb r5, [r1]
	movs r1, #6
	strb r1, [r4, r0]
	adds r1, r5, #6
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov08_02224938
	movs r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_022229EA:
	ldr r0, _02222A6C @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _02222A74 @ =0x0000114B
	movs r1, #4
	strb r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0
	bl ov08_02224938
	movs r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_02222A04:
	ldr r0, _02222A70 @ =0x0000114D
	ldrb r1, [r4, r0]
	adds r0, r0, #7
	adds r1, r4, r1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02222A60
	ldr r0, _02222A6C @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _02222A74 @ =0x0000114B
	movs r1, #7
	strb r1, [r4, r0]
	subs r1, #8
	adds r0, r0, #3
	strb r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0
	bl ov08_02224938
	movs r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_02222A32:
	ldr r0, _02222A70 @ =0x0000114D
	ldrb r1, [r4, r0]
	adds r0, r0, #7
	adds r1, r4, r1
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02222A60
	ldr r0, _02222A6C @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _02222A74 @ =0x0000114B
	movs r1, #7
	strb r1, [r4, r0]
	movs r1, #1
	adds r0, r0, #3
	strb r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0
	bl ov08_02224938
	movs r0, #0xb
	pop {r3, r4, r5, r6, r7, pc}
_02222A60:
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02222A64: .4byte 0x02225B68
_02222A68: .4byte 0x021D110C
_02222A6C: .4byte 0x000005DD
_02222A70: .4byte 0x0000114D
_02222A74: .4byte 0x0000114B
	thumb_func_end ov08_02222918

	thumb_func_start ov08_02222A78
ov08_02222A78: @ 0x02222A78
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _02222AE8 @ =0x0000114D
	ldr r1, [r4]
	ldrb r2, [r4, r0]
	movs r3, #0
	adds r5, r1, r2
	movs r1, #0x2c
	ldrsb r2, [r5, r1]
	adds r5, #0x27
	adds r1, r0, #1
	strb r3, [r5]
	ldrsb r1, [r4, r1]
	adds r1, r2, r1
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	ldrb r1, [r4, r0]
	adds r0, r0, #7
	adds r5, r4, r1
	ldrb r5, [r5, r0]
	cmp r2, r5
	ble _02222AAE
	ldr r0, [r4]
	adds r0, r0, r1
	adds r0, #0x2c
	strb r3, [r0]
	b _02222AC2
_02222AAE:
	cmp r2, #0
	ldr r0, [r4]
	bge _02222ABC
	adds r0, r0, r1
	adds r0, #0x2c
	strb r5, [r0]
	b _02222AC2
_02222ABC:
	adds r0, r0, r1
	adds r0, #0x2c
	strb r2, [r0]
_02222AC2:
	adds r0, r4, #0
	bl ov08_0222377C
	adds r0, r4, #0
	bl ov08_022237C4
	ldr r1, _02222AEC @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02223F94
	ldr r1, _02222AEC @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_02224A50
	movs r0, #2
	pop {r3, r4, r5, pc}
	nop
_02222AE8: .4byte 0x0000114D
_02222AEC: .4byte 0x0000114C
	thumb_func_end ov08_02222A78

	thumb_func_start ov08_02222AF0
ov08_02222AF0: @ 0x02222AF0
	push {r3, r4, r5, lr}
	ldr r1, _02222B7C @ =0x02225ADC
	adds r5, r0, #0
	bl ov08_02223368
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _02222B18
	ldr r0, [r5, #0x34]
	bl ov08_02224C94
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _02222B1E
	movs r4, #1
	b _02222B1E
_02222B18:
	adds r0, r5, #0
	bl ov08_0222417C
_02222B1E:
	cmp r4, #0
	beq _02222B28
	cmp r4, #1
	beq _02222B5E
	b _02222B78
_02222B28:
	ldr r0, _02222B80 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, _02222B84 @ =0x0000114D
	ldr r2, [r5]
	ldrb r1, [r5, r1]
	adds r0, r5, #0
	adds r1, r2, r1
	adds r1, #0x27
	ldrb r1, [r1]
	bl ov08_02223CD4
	ldr r1, [r5]
	movs r2, #0
	strh r0, [r1, #0x1c]
	ldr r0, _02222B84 @ =0x0000114D
	ldrb r1, [r5, r0]
	ldr r0, [r5]
	strb r1, [r0, #0x1e]
	adds r0, r5, #0
	movs r1, #0xf
	bl ov08_02224938
	adds r0, r5, #0
	bl ov08_02222B8C
	pop {r3, r4, r5, pc}
_02222B5E:
	ldr r0, _02222B80 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _02222B88 @ =0x0000114B
	movs r1, #5
	strb r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	bl ov08_02224938
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_02222B78:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_02222B7C: .4byte 0x02225ADC
_02222B80: .4byte 0x000005DD
_02222B84: .4byte 0x0000114D
_02222B88: .4byte 0x0000114B
	thumb_func_end ov08_02222AF0

	thumb_func_start ov08_02222B8C
ov08_02222B8C: @ 0x02222B8C
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02222D6C @ =0x0000114D
	adds r5, r0, #0
	ldrb r1, [r5, r1]
	ldr r4, [r5]
	cmp r1, #3
	beq _02222B9C
	b _02222CB6
_02222B9C:
	bl ov08_02223374
	adds r7, r0, #0
	ldrh r0, [r4, #0x1c]
	ldr r2, [r4, #0xc]
	movs r1, #7
	bl FUN_02077D88
	adds r6, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02222C0E
	ldrh r0, [r4, #0x1c]
	cmp r0, #0x37
	beq _02222C0E
	cmp r6, #3
	beq _02222C0E
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	adds r2, r7, #0
	bl FUN_0223A880
	adds r6, r0, #0
	ldr r0, [r5, #0x10]
	movs r1, #0x2e
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_0200BF8C
	ldr r0, [r5, #0x14]
	ldr r2, _02222D70 @ =0x00000175
	movs r1, #1
	bl FUN_0200BFF0
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 @ =0x0000114B
	movs r1, #8
	strb r1, [r5, r0]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222C0E:
	ldrh r0, [r4, #0x1c]
	adds r2, r7, #0
	movs r3, #0
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl FUN_0223AC20
	cmp r0, #1
	bne _02222C34
	ldr r2, _02222D6C @ =0x0000114D
	ldrh r1, [r4, #0x1c]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	ldr r3, [r4, #0xc]
	bl ov08_02223390
	movs r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_02222C34:
	cmp r6, #3
	bne _02222C9C
	ldr r0, [r4]
	bl FUN_0223A7E0
	movs r1, #1
	tst r0, r1
	bne _02222C56
	ldr r2, _02222D6C @ =0x0000114D
	ldrh r1, [r4, #0x1c]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	ldr r3, [r4, #0xc]
	bl ov08_02223390
	movs r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
_02222C56:
	ldr r3, [r4, #0xc]
	adds r0, r1, #0
	movs r1, #0x1b
	movs r2, #0x28
	bl FUN_0200BAF8
	movs r1, #0x25
	adds r7, r0, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, #0x14]
	ldr r2, [r4, #4]
	movs r1, #0
	bl FUN_0200BE48
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 @ =0x0000114B
	movs r1, #8
	strb r1, [r5, r0]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222C9C:
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	movs r1, #0x22
	bl FUN_0200BB6C
	adds r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 @ =0x0000114B
	movs r1, #8
	strb r1, [r5, r0]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222CB6:
	cmp r1, #2
	bne _02222D66
	adds r0, r4, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222CDE
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	movs r1, #0x2c
	bl FUN_0200BB6C
	adds r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 @ =0x0000114B
	movs r1, #8
	strb r1, [r5, r0]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222CDE:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222D02
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	movs r1, #0x2f
	bl FUN_0200BB6C
	adds r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 @ =0x0000114B
	movs r1, #8
	strb r1, [r5, r0]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222D02:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _02222D26
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	movs r1, #0x30
	bl FUN_0200BB6C
	adds r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 @ =0x0000114B
	movs r1, #8
	strb r1, [r5, r0]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222D26:
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl FUN_0223A7F4
	adds r6, r0, #0
	ldr r0, [r4]
	bl FUN_0223AB3C
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_02074640
	cmp r0, #6
	bne _02222D66
	adds r0, r4, #0
	bl FUN_02073D54
	cmp r0, #0x12
	bne _02222D66
	ldr r0, [r5, #0x10]
	ldr r2, [r5, #0x18]
	movs r1, #0x2d
	bl FUN_0200BB6C
	adds r0, r5, #0
	bl ov08_02223B20
	ldr r0, _02222D74 @ =0x0000114B
	movs r1, #8
	strb r1, [r5, r0]
	movs r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_02222D66:
	movs r0, #0xd
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222D6C: .4byte 0x0000114D
_02222D70: .4byte 0x00000175
_02222D74: .4byte 0x0000114B
	thumb_func_end ov08_02222B8C

	thumb_func_start ov08_02222D78
ov08_02222D78: @ 0x02222D78
	push {r3, lr}
	movs r1, #0
	bl ov08_02223300
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov08_02222D78

	thumb_func_start ov08_02222D84
ov08_02222D84: @ 0x02222D84
	push {r3, lr}
	movs r1, #1
	bl ov08_02223300
	movs r0, #2
	pop {r3, pc}
	thumb_func_end ov08_02222D84

	thumb_func_start ov08_02222D90
ov08_02222D90: @ 0x02222D90
	push {r3, lr}
	movs r1, #2
	bl ov08_02223300
	movs r0, #3
	pop {r3, pc}
	thumb_func_end ov08_02222D90

	thumb_func_start ov08_02222D9C
ov08_02222D9C: @ 0x02222D9C
	push {r3, lr}
	adds r0, #0x1c
	movs r1, #0
	bl FUN_0200E9BC
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov08_02222D9C

	thumb_func_start ov08_02222DAC
ov08_02222DAC: @ 0x02222DAC
	push {r3, lr}
	adds r0, #0x32
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _02222DBE
	movs r0, #0xa
	pop {r3, pc}
_02222DBE:
	movs r0, #9
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov08_02222DAC

	thumb_func_start ov08_02222DC4
ov08_02222DC4: @ 0x02222DC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02222DE4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _02222DDA
	bl FUN_02025358
	cmp r0, #1
	bne _02222DE0
_02222DDA:
	ldr r0, _02222DE8 @ =0x0000114B
	ldrb r0, [r4, r0]
	pop {r4, pc}
_02222DE0:
	movs r0, #0xa
	pop {r4, pc}
	.align 2, 0
_02222DE4: .4byte 0x021D110C
_02222DE8: .4byte 0x0000114B
	thumb_func_end ov08_02222DC4

	thumb_func_start ov08_02222DEC
ov08_02222DEC: @ 0x02222DEC
	ldr r1, _02222E00 @ =0x0000113E
	ldrb r2, [r0, r1]
	cmp r2, #2
	bne _02222DFA
	adds r1, #0xd
	ldrb r0, [r0, r1]
	bx lr
_02222DFA:
	movs r0, #0xb
	bx lr
	nop
_02222E00: .4byte 0x0000113E
	thumb_func_end ov08_02222DEC

	thumb_func_start ov08_02222E04
ov08_02222E04: @ 0x02222E04
	push {lr}
	sub sp, #0xc
	movs r2, #0
	str r2, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	str r2, [sp, #8]
	movs r1, #0xa
	adds r3, r1, #0
	ldr r0, [r0, #8]
	ldr r2, _02222E28 @ =0x0000FFFF
	subs r3, #0x12
	bl FUN_02003370
	movs r0, #0xe
	add sp, #0xc
	pop {pc}
	nop
_02222E28: .4byte 0x0000FFFF
	thumb_func_end ov08_02222E04

	thumb_func_start ov08_02222E2C
ov08_02222E2C: @ 0x02222E2C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02003B44
	cmp r0, #0
	beq _02222E40
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02222E40:
	adds r0, r5, #0
	bl ov08_02223F34
	adds r0, r5, #0
	bl ov08_02223464
	adds r0, r5, #0
	bl ov08_02223228
	ldr r0, [r5, #4]
	bl ov08_022230CC
	ldr r0, [r5, #0x34]
	bl ov08_02224B8C
	ldr r1, [r5]
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, [r5, #0x34]
	bl ov08_02224B7C
	movs r0, #4
	bl FUN_02002DB4
	ldr r1, [r5]
	ldrh r0, [r1, #0x1c]
	cmp r0, #0
	beq _02222EAC
	ldr r0, [r1]
	bl FUN_0223AA84
	adds r6, r0, #0
	movs r4, #0
_02222E82:
	ldr r3, [r5]
	adds r0, r6, #0
	adds r2, r3, r4
	adds r3, r3, r4
	adds r2, #0x27
	adds r3, #0x2c
	ldrb r2, [r2]
	ldrb r3, [r3]
	adds r1, r4, #0
	bl FUN_020787FC
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	blo _02222E82
	ldr r1, _02222EC0 @ =0x0000114D
	adds r0, r6, #0
	ldrb r1, [r5, r1]
	bl FUN_02078830
_02222EAC:
	ldr r0, [r5]
	movs r1, #1
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r7, #0
	bl FUN_02007234
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222EC0: .4byte 0x0000114D
	thumb_func_end ov08_02222E2C

	thumb_func_start ov08_02222EC4
ov08_02222EC4: @ 0x02222EC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02003B44
	cmp r0, #0
	beq _02222ED6
	movs r0, #0xc
	pop {r4, pc}
_02222ED6:
	ldr r0, _02222FF0 @ =0x00001159
	ldrb r0, [r4, r0]
	cmp r0, #4
	bls _02222EE0
	b _02222FEA
_02222EE0:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02222EEC: @ jump table
	.2byte _02222EF6 - _02222EEC - 2 @ case 0
	.2byte _02222F38 - _02222EEC - 2 @ case 1
	.2byte _02222F48 - _02222EEC - 2 @ case 2
	.2byte _02222F92 - _02222EEC - 2 @ case 3
	.2byte _02222FA2 - _02222EEC - 2 @ case 4
_02222EF6:
	ldr r0, [r4, #0x38]
	bl FUN_0226BD50
	cmp r0, #1
	bne _02222F2E
	ldr r0, _02222FF4 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _02222FF8 @ =0x0000114D
	movs r1, #2
	strb r1, [r4, r0]
	movs r2, #0xc
	subs r0, r0, #2
	strb r2, [r4, r0]
	adds r0, r4, #0
	movs r2, #0
	bl ov08_02224938
	ldr r0, _02222FFC @ =0x0000115A
	movs r1, #0
	strb r1, [r4, r0]
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	adds r1, r1, #1
	strb r1, [r4, r0]
	movs r0, #0xb
	pop {r4, pc}
_02222F2E:
	ldr r0, _02222FFC @ =0x0000115A
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222F38:
	adds r0, r4, #0
	bl ov08_02222D84
	ldr r0, _02222FF0 @ =0x00001159
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222F48:
	ldr r0, [r4, #0x38]
	bl FUN_0226BD50
	cmp r0, #1
	bne _02222F88
	ldr r0, _02222FF4 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, _02222FF8 @ =0x0000114D
	ldr r3, [r4]
	ldrb r1, [r4, r0]
	movs r2, #0
	subs r0, r0, #2
	adds r1, r3, r1
	adds r1, #0x27
	strb r2, [r1]
	movs r1, #0xc
	strb r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #6
	bl ov08_02224938
	ldr r0, _02222FFC @ =0x0000115A
	movs r1, #0
	strb r1, [r4, r0]
	subs r1, r0, #1
	ldrb r1, [r4, r1]
	subs r0, r0, #1
	adds r1, r1, #1
	strb r1, [r4, r0]
	movs r0, #0xb
	pop {r4, pc}
_02222F88:
	ldr r0, _02222FFC @ =0x0000115A
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222F92:
	adds r0, r4, #0
	bl ov08_02222D90
	ldr r0, _02222FF0 @ =0x00001159
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _02222FEA
_02222FA2:
	ldr r0, [r4, #0x38]
	bl FUN_0226BD50
	cmp r0, #1
	bne _02222FE2
	ldr r0, _02222FF4 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, _02222FF8 @ =0x0000114D
	ldr r2, [r4]
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	adds r1, r2, r1
	adds r1, #0x27
	ldrb r1, [r1]
	bl ov08_02223CD4
	ldr r1, [r4]
	movs r2, #0
	strh r0, [r1, #0x1c]
	ldr r0, _02222FF8 @ =0x0000114D
	ldrb r1, [r4, r0]
	ldr r0, [r4]
	strb r1, [r0, #0x1e]
	adds r0, r4, #0
	movs r1, #0xf
	bl ov08_02224938
	adds r0, r4, #0
	bl ov08_02222B8C
	pop {r4, pc}
_02222FE2:
	ldr r0, _02222FFC @ =0x0000115A
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
_02222FEA:
	movs r0, #0xc
	pop {r4, pc}
	nop
_02222FF0: .4byte 0x00001159
_02222FF4: .4byte 0x000005DD
_02222FF8: .4byte 0x0000114D
_02222FFC: .4byte 0x0000115A
	thumb_func_end ov08_02222EC4

	thumb_func_start ov08_02223000
ov08_02223000: @ 0x02223000
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _022230BC @ =0x02225AE8
	add r3, sp, #0x54
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	movs r1, #1
	bl FUN_0201ACE8
	ldr r5, _022230C0 @ =0x02225B30
	add r3, sp, #0x38
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
	ldr r0, [r4, #4]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _022230C4 @ =0x02225B14
	add r3, sp, #0x1c
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
	ldr r0, [r4, #4]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #4]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _022230C8 @ =0x02225AF8
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
	ldr r0, [r4, #4]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #4]
	movs r1, #4
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #5
	ldr r3, [r3, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #4
	ldr r3, [r3, #0xc]
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r0, [r4, #4]
	movs r1, #5
	bl FUN_0201EFBC
	ldr r0, [r4, #4]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #0x64
	pop {r4, r5, pc}
	.align 2, 0
_022230BC: .4byte 0x02225AE8
_022230C0: .4byte 0x02225B30
_022230C4: .4byte 0x02225B14
_022230C8: .4byte 0x02225AF8
	thumb_func_end ov08_02223000

	thumb_func_start ov08_022230CC
ov08_022230CC: @ 0x022230CC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x17
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_022230CC

	thumb_func_start ov08_022230F4
ov08_022230F4: @ 0x022230F4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0x4d
	ldr r1, [r1, #0xc]
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	movs r3, #6
	ldr r1, [r1, #0xc]
	adds r4, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r5, #4]
	movs r1, #2
	bl FUN_02007B44
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5]
	movs r3, #6
	ldr r0, [r0, #0xc]
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	bl FUN_02007B68
	ldr r2, [r5]
	adds r0, r4, #0
	ldr r2, [r2, #0xc]
	movs r1, #1
	bl FUN_0200771C
	add r1, sp, #0x10
	adds r6, r0, #0
	blx FUN_020B71D8
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r1, #0xc
	bl ov08_02224254
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #1
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	movs r1, #0x4d
	movs r2, #3
	bl FUN_02003200
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xf0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	movs r1, #0x10
	movs r2, #8
	bl FUN_02003200
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0223B708
	adds r4, r0, #0
	bl FUN_0200E63C
	adds r1, r0, #0
	ldr r0, _022231E4 @ =0x000003E2
	movs r3, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	movs r0, #0x26
	bl FUN_020078F0
	adds r0, r4, #0
	bl FUN_0200E640
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	movs r1, #0x26
	bl FUN_02003200
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022231E4: .4byte 0x000003E2
	thumb_func_end ov08_022230F4

	thumb_func_start ov08_022231E8
ov08_022231E8: @ 0x022231E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	movs r0, #0
	ldr r3, [r3, #0xc]
	movs r1, #0x1b
	movs r2, #5
	bl FUN_0200BAF8
	str r0, [r4, #0x10]
	ldr r3, [r4]
	movs r0, #0xf
	ldr r3, [r3, #0xc]
	movs r1, #0xe
	movs r2, #0
	bl FUN_0200CC74
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl FUN_0200BD08
	str r0, [r4, #0x14]
	ldr r1, [r4]
	movs r0, #2
	ldr r1, [r1, #0xc]
	lsls r0, r0, #8
	bl FUN_02026354
	str r0, [r4, #0x18]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_022231E8

	thumb_func_start ov08_02223228
ov08_02223228: @ 0x02223228
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_0200BB44
	ldr r0, [r4, #0xc]
	bl FUN_0200CD94
	ldr r0, [r4, #0x14]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x18]
	bl FUN_02026380
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_02223228

	thumb_func_start ov08_02223248
ov08_02223248: @ 0x02223248
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _0222325A
	cmp r1, #1
	beq _02223274
	cmp r1, #2
	beq _02223290
	pop {r4, pc}
_0222325A:
	movs r2, #0
	ldr r0, [r4, #4]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201F238
	ldr r0, [r4, #4]
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	pop {r4, pc}
_02223274:
	movs r1, #6
	adds r3, r1, #0
	ldr r0, [r4, #4]
	movs r2, #0
	adds r3, #0xfa
	bl FUN_0201F238
	ldr r0, [r4, #4]
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	pop {r4, pc}
_02223290:
	movs r2, #0
	ldr r0, [r4, #4]
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #4]
	movs r1, #6
	adds r3, #0xfd
	bl FUN_0201F238
	pop {r4, pc}
	thumb_func_end ov08_02223248

	thumb_func_start ov08_022232AC
ov08_022232AC: @ 0x022232AC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r1, #2
	bne _022232F6
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _022232FC @ =0x0000114D
	movs r1, #6
	ldrb r0, [r4, r0]
	movs r2, #2
	movs r3, #0x23
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl FUN_0201CA4C
	movs r0, #0x1c
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	ldr r0, _022232FC @ =0x0000114D
	movs r1, #6
	ldrb r0, [r4, r0]
	movs r2, #2
	movs r3, #0x28
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl FUN_0201CA4C
_022232F6:
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_022232FC: .4byte 0x0000114D
	thumb_func_end ov08_022232AC

	thumb_func_start ov08_02223300
ov08_02223300: @ 0x02223300
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov08_022232AC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02223248
	ldr r0, [r5, #4]
	movs r1, #4
	movs r2, #0
	bl FUN_0201CB28
	ldr r0, [r5, #4]
	movs r1, #5
	movs r2, #0
	bl FUN_0201CB28
	adds r0, r5, #0
	bl ov08_02223454
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_022233DC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02223480
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02224A50
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02224134
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_0222421C
	ldr r1, _02223364 @ =0x0000114C
	adds r0, r5, #0
	strb r4, [r5, r1]
	ldrb r1, [r5, r1]
	bl ov08_02223F94
	pop {r3, r4, r5, pc}
	nop
_02223364: .4byte 0x0000114C
	thumb_func_end ov08_02223300

	thumb_func_start ov08_02223368
ov08_02223368: @ 0x02223368
	ldr r3, _02223370 @ =FUN_02025224
	adds r0, r1, #0
	bx r3
	nop
_02223370: .4byte FUN_02025224
	thumb_func_end ov08_02223368

	thumb_func_start ov08_02223374
ov08_02223374: @ 0x02223374
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl FUN_0223A7E4
	adds r1, r0, #0
	ldr r0, [r5]
	ldr r3, [r4, #0x10]
	ldr r0, [r0]
	movs r2, #2
	bl FUN_022581D4
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_02223374

	thumb_func_start ov08_02223390
ov08_02223390: @ 0x02223390
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r4, r3, #0
	adds r6, r0, #0
	adds r7, r2, #0
	bl FUN_0223AA80
	adds r1, r5, #0
	movs r2, #1
	adds r3, r4, #0
	bl FUN_02078434
	adds r0, r6, #0
	bl FUN_0223AA84
	adds r1, r5, #0
	adds r2, r7, #0
	bl FUN_02078828
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_02223390

	thumb_func_start ov08_022233B8
ov08_022233B8: @ 0x022233B8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	ldr r0, [r4, #4]
	ldr r2, _022233D4 @ =0x02225B90
	adds r1, #0x1c
	bl FUN_0201D4F8
	ldr r1, _022233D8 @ =0x0000114C
	adds r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov08_022233DC
	pop {r4, pc}
	.align 2, 0
_022233D4: .4byte 0x02225B90
_022233D8: .4byte 0x0000114C
	thumb_func_end ov08_022233B8

	thumb_func_start ov08_022233DC
ov08_022233DC: @ 0x022233DC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	cmp r1, #0
	beq _022233EE
	cmp r1, #1
	beq _022233F8
	cmp r1, #2
	beq _02223402
	b _0222340A
_022233EE:
	movs r1, #5
	adds r0, #0x30
	ldr r6, _02223448 @ =0x02225BB8
	strb r1, [r0]
	b _0222340A
_022233F8:
	movs r1, #0x1a
	adds r0, #0x30
	ldr r6, _0222344C @ =0x02225C10
	strb r1, [r0]
	b _0222340A
_02223402:
	ldr r6, _02223450 @ =0x02225B98
	movs r1, #4
	adds r0, #0x30
	strb r1, [r0]
_0222340A:
	adds r1, r5, #0
	ldr r0, [r5]
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r0, [r0, #0xc]
	bl FUN_0201D39C
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r4, #0
	cmp r0, #0
	bls _02223446
_02223426:
	ldr r2, [r5, #0x2c]
	lsls r1, r4, #4
	adds r1, r2, r1
	lsls r2, r4, #3
	ldr r0, [r5, #4]
	adds r2, r6, r2
	bl FUN_0201D4F8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r4, r0
	blo _02223426
_02223446:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02223448: .4byte 0x02225BB8
_0222344C: .4byte 0x02225C10
_02223450: .4byte 0x02225B98
	thumb_func_end ov08_022233DC

	thumb_func_start ov08_02223454
ov08_02223454: @ 0x02223454
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	adds r1, #0x30
	ldr r3, _02223460 @ =FUN_0201D54C
	ldrb r1, [r1]
	bx r3
	.align 2, 0
_02223460: .4byte FUN_0201D54C
	thumb_func_end ov08_02223454

	thumb_func_start ov08_02223464
ov08_02223464: @ 0x02223464
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r0, [r4, #0x2c]
	bl FUN_0201D54C
	adds r4, #0x1c
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_02223464

	thumb_func_start ov08_02223480
ov08_02223480: @ 0x02223480
	push {r3, lr}
	cmp r1, #0
	beq _02223490
	cmp r1, #1
	beq _02223496
	cmp r1, #2
	beq _0222349C
	pop {r3, pc}
_02223490:
	bl ov08_022234FC
	pop {r3, pc}
_02223496:
	bl ov08_022239B4
	pop {r3, pc}
_0222349C:
	bl ov08_02223AA0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov08_02223480

	thumb_func_start ov08_022234A4
ov08_022234A4: @ 0x022234A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r5, [r0, #0x2c]
	lsls r4, r1, #4
	ldr r0, [r0, #0x10]
	adds r1, r2, #0
	adds r6, r3, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, r6, #0
	movs r2, #0
	bl FUN_02002F30
	adds r7, r0, #0
	adds r0, r5, r4
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsrs r3, r0, #1
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	adds r1, r6, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r5, r4
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_022234A4

	thumb_func_start ov08_022234FC
ov08_022234FC: @ 0x022234FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r6, #0
	adds r5, r0, #0
	adds r4, r6, #0
	adds r7, r6, #0
_02223508:
	ldr r0, [r5, #0x2c]
	adds r1, r7, #0
	adds r0, r0, r4
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #5
	blo _02223508
	movs r0, #7
	str r0, [sp]
	ldr r0, _022235D0 @ =0x00030201
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #4
	bl ov08_022234A4
	movs r0, #0x17
	str r0, [sp]
	ldr r0, _022235D0 @ =0x00030201
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl ov08_022234A4
	movs r0, #7
	str r0, [sp]
	ldr r0, _022235D0 @ =0x00030201
	movs r1, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #4
	bl ov08_022234A4
	movs r0, #0x17
	str r0, [sp]
	ldr r0, _022235D0 @ =0x00030201
	movs r1, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #3
	movs r3, #4
	bl ov08_022234A4
	movs r2, #7
	ldr r0, _022235D0 @ =0x00030201
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #2
	movs r3, #4
	bl ov08_022234A4
	movs r0, #7
	str r0, [sp]
	ldr r0, _022235D0 @ =0x00030201
	movs r1, #3
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #6
	movs r3, #4
	bl ov08_022234A4
	ldr r0, [r5]
	ldrh r0, [r0, #0x20]
	cmp r0, #0
	beq _022235CC
	ldr r0, [r5, #0x10]
	movs r1, #8
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #5
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022235D0 @ =0x00030201
	movs r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	movs r1, #4
	adds r0, #0x40
	adds r2, r4, #0
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [r5, #0x2c]
	adds r0, #0x40
	bl FUN_0201D5C8
_022235CC:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022235D0: .4byte 0x00030201
	thumb_func_end ov08_022234FC

	thumb_func_start ov08_022235D4
ov08_022235D4: @ 0x022235D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	lsls r6, r3, #4
	adds r7, r1, #0
	adds r0, r4, r6
	movs r1, #0
	str r2, [sp, #0x10]
	bl FUN_0201D978
	ldr r0, _02223670 @ =0x0000114D
	lsls r7, r7, #2
	ldrb r1, [r5, r0]
	movs r0, #0x90
	muls r0, r1, r0
	adds r0, r5, r0
	adds r0, r0, r7
	ldrh r0, [r0, #0x3c]
	cmp r0, #0
	beq _02223666
	ldr r1, [sp, #0x10]
	ldr r0, [r5, #0x10]
	lsls r2, r1, #3
	ldr r1, _02223674 @ =0x02225BE0
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	ldr r2, _02223670 @ =0x0000114D
	str r0, [sp, #0x14]
	ldrb r3, [r5, r2]
	movs r2, #0x90
	ldr r0, [r5, #0x14]
	muls r2, r3, r2
	adds r2, r5, r2
	adds r2, r2, r7
	ldrh r2, [r2, #0x3c]
	movs r1, #0
	bl FUN_0200C0CC
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [sp, #0x14]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x30]
	ldr r1, [r5, #0x18]
	movs r2, #0
	bl FUN_02002F30
	adds r7, r0, #0
	adds r0, r4, r6
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsrs r3, r0, #1
	movs r0, #7
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x30]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, r6
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
_02223666:
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223670: .4byte 0x0000114D
_02223674: .4byte 0x02225BE0
	thumb_func_end ov08_022235D4

	thumb_func_start ov08_02223678
ov08_02223678: @ 0x02223678
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r4, [r5, #0x2c]
	lsls r7, r3, #4
	adds r6, r1, #0
	adds r0, r4, r7
	movs r1, #0
	str r2, [sp, #0x10]
	bl FUN_0201D978
	ldr r0, _02223704 @ =0x0000114D
	lsls r6, r6, #2
	ldrb r1, [r5, r0]
	movs r0, #0x90
	muls r0, r1, r0
	adds r0, r5, r0
	adds r0, r0, r6
	ldrh r0, [r0, #0x3e]
	cmp r0, #0
	beq _022236FA
	ldr r1, [sp, #0x10]
	ldr r0, [r5, #0x10]
	lsls r2, r1, #3
	ldr r1, _02223708 @ =0x02225BE4
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	movs r1, #0
	str r0, [sp, #0x14]
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, _02223704 @ =0x0000114D
	ldr r0, [r5, #0x14]
	ldrb r3, [r5, r2]
	movs r2, #0x90
	muls r2, r3, r2
	adds r2, r5, r2
	adds r2, r2, r6
	ldrh r2, [r2, #0x3e]
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [sp, #0x14]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x34]
	movs r3, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x30]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, r7
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
_022236FA:
	adds r0, r4, r7
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223704: .4byte 0x0000114D
_02223708: .4byte 0x02225BE4
	thumb_func_end ov08_02223678

	thumb_func_start ov08_0222370C
ov08_0222370C: @ 0x0222370C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, _02223770 @ =0x0000114D
	adds r5, r1, #0
	ldrb r0, [r6, r0]
	ldr r1, [r6]
	adds r0, r1, r0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #6
	muls r0, r1, r0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _02223734
	movs r4, #0
	b _02223736
_02223734:
	movs r4, #0xc
_02223736:
	movs r0, #4
	str r0, [sp]
	ldr r0, _02223774 @ =0x00030201
	ldr r1, [sp, #0xc]
	lsls r7, r5, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, r1
	adds r2, r5, #0
	adds r3, r4, r7
	bl ov08_022235D4
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, _02223778 @ =0x00010200
	ldr r1, [sp, #0xc]
	adds r3, r4, #1
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, r1
	adds r2, r5, #0
	adds r3, r3, r7
	bl ov08_02223678
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223770: .4byte 0x0000114D
_02223774: .4byte 0x00030201
_02223778: .4byte 0x00010200
	thumb_func_end ov08_0222370C

	thumb_func_start ov08_0222377C
ov08_0222377C: @ 0x0222377C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r2, #0
	adds r4, r0, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x13
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201C8C4
	movs r5, #0
_0222379E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov08_0222370C
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #6
	blo _0222379E
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r0, #1
	adds r4, #0x31
	eors r0, r1
	strb r0, [r4]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov08_0222377C

	thumb_func_start ov08_022237C4
ov08_022237C4: @ 0x022237C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0x19
	ldr r1, [r5, #0x2c]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r5, #0x10]
	movs r1, #0x1c
	ldr r4, [r5, #0x2c]
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	movs r0, #0
	ldr r1, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r7, r0, #0
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, r0, r7
	lsrs r6, r0, #1
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022238EC @ =0x00010200
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	movs r0, #0x19
	lsls r0, r0, #4
	movs r1, #0
	adds r0, r4, r0
	adds r3, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	ldr r0, [r5, #0x10]
	movs r1, #0x1d
	bl FUN_0200BBA0
	movs r1, #0
	str r0, [sp, #0x14]
	ldr r3, _022238F0 @ =0x0000114D
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, _022238F0 @ =0x0000114D
	adds r3, r3, #7
	ldrb r2, [r5, r2]
	ldr r0, [r5, #0x14]
	adds r2, r5, r2
	ldrb r2, [r2, r3]
	movs r3, #2
	adds r2, r2, #1
	bl FUN_0200BFCC
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [sp, #0x14]
	bl FUN_0200CBBC
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022238EC @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r2, [r5, #0x18]
	adds r0, r4, r0
	adds r3, r6, r7
	bl FUN_020200FC
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	ldr r0, [r5, #0x10]
	movs r1, #0x1e
	bl FUN_0200BBA0
	movs r1, #0
	adds r7, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r3, _022238F0 @ =0x0000114D
	ldr r2, [r5]
	ldrb r3, [r5, r3]
	ldr r0, [r5, #0x14]
	adds r2, r2, r3
	adds r2, #0x2c
	ldrb r2, [r2]
	movs r3, #2
	adds r2, r2, #1
	bl FUN_0200BFCC
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [r5, #0x18]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022238EC @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r2, [r5, #0x18]
	adds r0, r4, r0
	subs r3, r6, r3
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #0x19
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022238EC: .4byte 0x00010200
_022238F0: .4byte 0x0000114D
	thumb_func_end ov08_022237C4

	thumb_func_start ov08_022238F4
ov08_022238F4: @ 0x022238F4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #6
	ldr r1, [r4, #0x2c]
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, _022239AC @ =0x0000114D
	ldrb r0, [r4, r0]
	cmp r0, #3
	bhi _022239A8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222391C: @ jump table
	.2byte _02223924 - _0222391C - 2 @ case 0
	.2byte _02223950 - _0222391C - 2 @ case 1
	.2byte _0222397C - _0222391C - 2 @ case 2
	.2byte _02223994 - _0222391C - 2 @ case 3
_02223924:
	movs r0, #4
	str r0, [sp]
	ldr r0, _022239B0 @ =0x00010200
	movs r1, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x16
	movs r3, #0
	bl ov08_022234A4
	movs r0, #0x14
	str r0, [sp]
	ldr r0, _022239B0 @ =0x00010200
	movs r1, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x17
	movs r3, #0
	bl ov08_022234A4
	add sp, #8
	pop {r4, pc}
_02223950:
	movs r0, #4
	str r0, [sp]
	ldr r0, _022239B0 @ =0x00010200
	movs r1, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0
	bl ov08_022234A4
	movs r0, #0x14
	str r0, [sp]
	ldr r0, _022239B0 @ =0x00010200
	movs r1, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x19
	movs r3, #0
	bl ov08_022234A4
	add sp, #8
	pop {r4, pc}
_0222397C:
	movs r0, #0xc
	str r0, [sp]
	ldr r0, _022239B0 @ =0x00010200
	movs r1, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1a
	movs r3, #0
	bl ov08_022234A4
	add sp, #8
	pop {r4, pc}
_02223994:
	movs r0, #0xc
	str r0, [sp]
	ldr r0, _022239B0 @ =0x00010200
	movs r1, #0x18
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1b
	movs r3, #0
	bl ov08_022234A4
_022239A8:
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_022239AC: .4byte 0x0000114D
_022239B0: .4byte 0x00010200
	thumb_func_end ov08_022238F4

	thumb_func_start ov08_022239B4
ov08_022239B4: @ 0x022239B4
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_0222377C
	adds r0, r4, #0
	bl ov08_022238F4
	adds r0, r4, #0
	bl ov08_022237C4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_022239B4

	thumb_func_start ov08_022239CC
ov08_022239CC: @ 0x022239CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r6, r1, #0
	movs r1, #9
	ldr r4, [r5, #0x2c]
	bl FUN_0200BBA0
	ldr r2, _02223A34 @ =0x0000114D
	adds r7, r0, #0
	ldrb r3, [r5, r2]
	movs r2, #0x90
	ldr r0, [r5, #0x14]
	muls r2, r3, r2
	adds r2, r5, r2
	lsls r3, r6, #2
	adds r2, r2, r3
	ldrh r2, [r2, #0x3c]
	movs r1, #0
	bl FUN_0200C0CC
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	adds r2, r7, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02223A38 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223A34: .4byte 0x0000114D
_02223A38: .4byte 0x00010200
	thumb_func_end ov08_022239CC

	thumb_func_start ov08_02223A3C
ov08_02223A3C: @ 0x02223A3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, [r5]
	ldr r4, [r5, #0x2c]
	ldr r1, [r1, #0xc]
	movs r0, #0x82
	adds r4, #0x20
	bl FUN_02026354
	ldr r1, _02223A98 @ =0x0000114D
	adds r7, r0, #0
	ldrb r2, [r5, r1]
	movs r1, #0x90
	muls r1, r2, r1
	adds r2, r5, r1
	lsls r1, r6, #2
	adds r1, r2, r1
	ldr r2, [r5]
	ldrh r1, [r1, #0x3c]
	ldr r2, [r2, #0xc]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl FUN_02077D64
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02223A9C @ =0x00010200
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r3, #4
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223A98: .4byte 0x0000114D
_02223A9C: .4byte 0x00010200
	thumb_func_end ov08_02223A3C

	thumb_func_start ov08_02223AA0
ov08_02223AA0: @ 0x02223AA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r6, #0
	adds r5, r0, #0
	adds r4, r6, #0
	adds r7, r6, #0
_02223AAC:
	ldr r0, [r5, #0x2c]
	adds r1, r7, #0
	adds r0, r0, r4
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #4
	blo _02223AAC
	ldr r0, _02223B14 @ =0x0000114D
	ldr r1, [r5]
	ldrb r2, [r5, r0]
	adds r0, r1, r2
	adds r0, #0x27
	ldrb r4, [r0]
	adds r0, r1, r2
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #6
	adds r6, r1, #0
	muls r6, r0, r6
	adds r0, r5, #0
	adds r1, r4, r6
	bl ov08_022239CC
	movs r2, #0
	str r2, [sp]
	ldr r0, _02223B18 @ =0x00010200
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r4, r6
	movs r3, #1
	bl ov08_02223678
	adds r0, r5, #0
	adds r1, r4, r6
	bl ov08_02223A3C
	movs r0, #5
	str r0, [sp]
	ldr r0, _02223B1C @ =0x00030201
	movs r1, #3
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1f
	movs r3, #4
	bl ov08_022234A4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02223B14: .4byte 0x0000114D
_02223B18: .4byte 0x00010200
_02223B1C: .4byte 0x00030201
	thumb_func_end ov08_02223AA0

	thumb_func_start ov08_02223B20
ov08_02223B20: @ 0x02223B20
	push {r4, lr}
	ldr r2, _02223B44 @ =0x000003E2
	adds r4, r0, #0
	adds r0, #0x1c
	movs r1, #1
	movs r3, #0xe
	bl FUN_0200E998
	adds r0, r4, #0
	adds r0, #0x1c
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	bl ov08_02223B48
	pop {r4, pc}
	nop
_02223B44: .4byte 0x000003E2
	thumb_func_end ov08_02223B20

	thumb_func_start ov08_02223B48
ov08_02223B48: @ 0x02223B48
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	bl FUN_02002B34
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0223B718
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x18]
	adds r0, #0x1c
	movs r1, #1
	bl FUN_020200A8
	adds r4, #0x32
	strb r0, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov08_02223B48

	thumb_func_start ov08_02223B78
ov08_02223B78: @ 0x02223B78
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	ldrh r1, [r3, #0x20]
	cmp r1, #0
	bne _02223B88
	movs r0, #0
	pop {r4, pc}
_02223B88:
	ldr r0, [r3, #8]
	ldr r3, [r3, #0xc]
	movs r2, #1
	bl FUN_020784B0
	cmp r0, #0
	bne _02223BA2
	ldr r1, [r4]
	movs r0, #0
	strh r0, [r1, #0x20]
	ldr r1, [r4]
	strb r0, [r1, #0x1f]
	pop {r4, pc}
_02223BA2:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_02223B78

	thumb_func_start ov08_02223BA8
ov08_02223BA8: @ 0x02223BA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _02223BF0 @ =0x0000114D
	ldr r6, [r5]
	ldrb r7, [r5, r0]
	movs r0, #0x90
	ldrh r2, [r6, #0x20]
	muls r0, r7, r0
	movs r4, #0
	adds r1, r5, r0
_02223BBC:
	ldrh r0, [r1, #0x3c]
	cmp r2, r0
	bne _02223BE6
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2BA4
	adds r0, r6, r7
	adds r0, #0x27
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2BA4
	ldr r1, _02223BF0 @ =0x0000114D
	ldr r2, [r5]
	ldrb r1, [r5, r1]
	adds r1, r2, r1
	adds r1, #0x2c
	strb r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
_02223BE6:
	adds r4, r4, #1
	adds r1, r1, #4
	cmp r4, #0x24
	blo _02223BBC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02223BF0: .4byte 0x0000114D
	thumb_func_end ov08_02223BA8

	thumb_func_start ov08_02223BF4
ov08_02223BF4: @ 0x02223BF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #4]
_02223BFE:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
_02223C0A:
	ldr r0, [r4]
	ldr r2, [sp]
	ldr r0, [r0, #8]
	lsls r2, r2, #0x10
	ldr r1, [sp, #8]
	lsrs r2, r2, #0x10
	bl FUN_02078724
	adds r5, r0, #0
	beq _02223C7C
	ldrh r0, [r5]
	cmp r0, #0
	beq _02223C74
	ldrh r1, [r5, #2]
	cmp r1, #0
	beq _02223C74
	ldr r2, [r4]
	movs r1, #0xd
	ldr r2, [r2, #0xc]
	bl FUN_02077D88
	adds r7, r0, #0
	ldr r1, _02223CC8 @ =0x02225CE0
	movs r0, #0
_02223C3A:
	movs r2, #1
	lsls r2, r0
	tst r2, r7
	beq _02223C6C
	ldrb r2, [r1]
	movs r3, #0x90
	adds r6, r2, #0
	muls r6, r3, r6
	adds r3, r4, r2
	ldr r2, _02223CCC @ =0x0000114F
	ldrb r2, [r3, r2]
	adds r3, r4, r6
	lsls r2, r2, #2
	adds r2, r2, r3
	ldrh r3, [r5]
	strh r3, [r2, #0x3c]
	ldrh r3, [r5, #2]
	strh r3, [r2, #0x3e]
	ldrb r2, [r1]
	adds r6, r4, r2
	ldr r2, _02223CCC @ =0x0000114F
	ldrb r2, [r6, r2]
	adds r3, r2, #1
	ldr r2, _02223CCC @ =0x0000114F
	strb r3, [r6, r2]
_02223C6C:
	adds r0, r0, #1
	adds r1, r1, #1
	cmp r0, #5
	blo _02223C3A
_02223C74:
	ldr r0, [sp]
	adds r0, r0, #1
	str r0, [sp]
	b _02223C0A
_02223C7C:
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #8
	blo _02223BFE
	movs r5, #0
	adds r7, r5, #0
_02223C8A:
	ldr r0, _02223CCC @ =0x0000114F
	adds r6, r4, r5
	ldrb r0, [r6, r0]
	cmp r0, #0
	bne _02223C9A
	ldr r0, _02223CD0 @ =0x00001154
	strb r7, [r6, r0]
	b _02223CA6
_02223C9A:
	subs r0, r0, #1
	movs r1, #6
	blx FUN_020F2998
	ldr r1, _02223CD0 @ =0x00001154
	strb r0, [r6, r1]
_02223CA6:
	ldr r1, [r4]
	ldr r0, _02223CD0 @ =0x00001154
	adds r2, r1, r5
	adds r2, #0x2c
	ldrb r0, [r6, r0]
	ldrb r2, [r2]
	cmp r0, r2
	bhs _02223CBC
	adds r1, r1, r5
	adds r1, #0x2c
	strb r0, [r1]
_02223CBC:
	adds r5, r5, #1
	cmp r5, #5
	blo _02223C8A
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02223CC8: .4byte 0x02225CE0
_02223CCC: .4byte 0x0000114F
_02223CD0: .4byte 0x00001154
	thumb_func_end ov08_02223BF4

	thumb_func_start ov08_02223CD4
ov08_02223CD4: @ 0x02223CD4
	push {r3, r4}
	ldr r2, _02223D04 @ =0x0000114D
	ldr r3, [r0]
	ldrb r2, [r0, r2]
	adds r3, r3, r2
	adds r3, #0x2c
	ldrb r4, [r3]
	movs r3, #6
	muls r3, r4, r3
	adds r1, r1, r3
	lsls r3, r1, #2
	movs r1, #0x90
	muls r1, r2, r1
	adds r0, r0, r1
	adds r1, r0, r3
	ldrh r0, [r1, #0x3c]
	cmp r0, #0
	beq _02223CFE
	ldrh r1, [r1, #0x3e]
	cmp r1, #0
	bne _02223D00
_02223CFE:
	movs r0, #0
_02223D00:
	pop {r3, r4}
	bx lr
	.align 2, 0
_02223D04: .4byte 0x0000114D
	thumb_func_end ov08_02223CD4

	thumb_func_start ov08_02223D08
ov08_02223D08: @ 0x02223D08
	push {r4, lr}
	adds r4, r0, #0
	bl ov08_02223D34
	adds r0, r4, #0
	bl ov08_02223D80
	adds r0, r4, #0
	bl ov08_02223F14
	adds r0, r4, #0
	bl ov08_022240A8
	adds r0, r4, #0
	bl ov08_0222419C
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_02223D08

	thumb_func_start ov08_02223D34
ov08_02223D34: @ 0x02223D34
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r3, _02223D7C @ =0x02225D14
	add r2, sp, #0
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0223A8E4
	adds r4, r0, #0
	bl FUN_0200CF38
	movs r1, #0xc3
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	adds r0, r4, #0
	movs r2, #0xc
	bl FUN_0200CFF4
	movs r1, #0xc3
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r4, #0
	add r2, sp, #0
	bl FUN_0200D3F8
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_02223D7C: .4byte 0x02225D14
	thumb_func_end ov08_02223D34

	thumb_func_start ov08_02223D80
ov08_02223D80: @ 0x02223D80
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	ldr r1, [r6]
	movs r0, #0x12
	ldr r1, [r1, #0xc]
	bl FUN_02007688
	adds r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_0223A8E4
	str r0, [sp, #0x18]
	movs r4, #0
_02223D9E:
	ldr r0, _02223E38 @ =0x0000B4B7
	adds r5, r4, r0
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0xc3
	str r5, [sp, #8]
	lsls r1, r1, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl FUN_0200D504
	movs r0, #1
	movs r1, #2
	bl FUN_02077C18
	str r7, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	movs r3, #0xc3
	str r5, [sp, #0x14]
	lsls r3, r3, #2
	ldr r0, [r6, #8]
	ldr r2, [sp, #0x18]
	ldr r3, [r6, r3]
	movs r1, #3
	bl FUN_0200D68C
	adds r4, r4, #1
	cmp r4, #6
	blo _02223D9E
	bl FUN_02077CE0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _02223E38 @ =0x0000B4B7
	movs r1, #0xc3
	str r0, [sp, #4]
	lsls r1, r1, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl FUN_0200D6EC
	bl FUN_02077CE4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _02223E38 @ =0x0000B4B7
	movs r1, #0xc3
	str r0, [sp, #4]
	lsls r1, r1, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r6, r1]
	adds r2, r7, #0
	bl FUN_0200D71C
	adds r0, r7, #0
	bl FUN_0200770C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02223E38: .4byte 0x0000B4B7
	thumb_func_end ov08_02223D80

	thumb_func_start ov08_02223E3C
ov08_02223E3C: @ 0x02223E3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	ldr r0, [r0]
	adds r4, r2, #0
	bl FUN_0223A8E4
	adds r7, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc3
	str r4, [sp, #4]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r7, #0
	movs r2, #0x12
	bl FUN_0200E248
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_02223E3C

	thumb_func_start ov08_02223E74
ov08_02223E74: @ 0x02223E74
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	movs r1, #2
	adds r4, r2, #0
	bl FUN_02077C18
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r4, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r3, [r5]
	ldr r0, [r5, #8]
	ldr r3, [r3, #0xc]
	movs r1, #0x12
	bl FUN_02003200
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov08_02223E74

	thumb_func_start ov08_02223EA4
ov08_02223EA4: @ 0x02223EA4
	push {r4, r5, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	ldr r0, [r0]
	bl FUN_0223A8E4
	movs r2, #0
	add r1, sp, #0
	strh r2, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	strh r2, [r1, #6]
	movs r1, #0x14
	ldr r3, _02223F00 @ =0x02225DEC
	muls r1, r4, r1
	ldr r3, [r3, r1]
	str r2, [sp, #0xc]
	str r3, [sp, #8]
	movs r3, #2
	str r3, [sp, #0x10]
	ldr r3, _02223F04 @ =0x02225DDC
	str r2, [sp, #0x30]
	ldr r3, [r3, r1]
	add r2, sp, #0
	str r3, [sp, #0x14]
	ldr r3, _02223F08 @ =0x02225DE0
	ldr r3, [r3, r1]
	str r3, [sp, #0x18]
	ldr r3, _02223F0C @ =0x02225DE4
	ldr r3, [r3, r1]
	str r3, [sp, #0x1c]
	ldr r3, _02223F10 @ =0x02225DE8
	ldr r1, [r3, r1]
	str r1, [sp, #0x20]
	movs r1, #1
	str r1, [sp, #0x2c]
	movs r1, #0xc3
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	bl FUN_0200D734
	add sp, #0x34
	pop {r4, r5, pc}
	nop
_02223F00: .4byte 0x02225DEC
_02223F04: .4byte 0x02225DDC
_02223F08: .4byte 0x02225DE0
_02223F0C: .4byte 0x02225DE4
_02223F10: .4byte 0x02225DE8
	thumb_func_end ov08_02223EA4

	thumb_func_start ov08_02223F14
ov08_02223F14: @ 0x02223F14
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0x31
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #4
_02223F20:
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov08_02223EA4
	str r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _02223F20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_02223F14

	thumb_func_start ov08_02223F34
ov08_02223F34: @ 0x02223F34
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_0223A8E4
	movs r6, #0x31
	str r0, [sp]
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #4
_02223F4A:
	ldr r0, [r5, r6]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _02223F4A
	adds r0, r7, #0
	bl ov08_02224108
	adds r0, r7, #0
	bl ov08_022241F4
	movs r1, #0xc3
	lsls r1, r1, #2
	ldr r0, [sp]
	ldr r1, [r7, r1]
	bl FUN_0200D998
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_02223F34

	thumb_func_start ov08_02223F74
ov08_02223F74: @ 0x02223F74
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	movs r1, #1
	adds r6, r0, #0
	bl FUN_0200DCE8
	lsls r1, r5, #0x10
	lsls r2, r4, #0x10
	adds r0, r6, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov08_02223F74

	thumb_func_start ov08_02223F94
ov08_02223F94: @ 0x02223F94
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0x31
	str r0, [sp]
	adds r7, r1, #0
	movs r4, #0
	adds r5, r0, #0
	lsls r6, r6, #4
_02223FA2:
	ldr r0, [r5, r6]
	movs r1, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _02223FA2
	cmp r7, #0
	beq _02223FC0
	cmp r7, #1
	beq _02223FC8
	cmp r7, #2
	beq _02223FD0
	pop {r3, r4, r5, r6, r7, pc}
_02223FC0:
	ldr r0, [sp]
	bl ov08_02223FD8
	pop {r3, r4, r5, r6, r7, pc}
_02223FC8:
	ldr r0, [sp]
	bl ov08_0222400C
	pop {r3, r4, r5, r6, r7, pc}
_02223FD0:
	ldr r0, [sp]
	bl ov08_02224064
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov08_02223F94

	thumb_func_start ov08_02223FD8
ov08_02223FD8: @ 0x02223FD8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	ldrh r1, [r1, #0x20]
	cmp r1, #0
	beq _02224006
	ldr r2, _02224008 @ =0x0000B4B7
	bl ov08_02223E3C
	ldr r1, [r4]
	ldr r3, _02224008 @ =0x0000B4B7
	ldrh r1, [r1, #0x20]
	adds r0, r4, #0
	movs r2, #0
	bl ov08_02223E74
	movs r0, #0x31
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x18
	movs r2, #0xb2
	bl ov08_02223F74
_02224006:
	pop {r4, pc}
	.align 2, 0
_02224008: .4byte 0x0000B4B7
	thumb_func_end ov08_02223FD8

	thumb_func_start ov08_0222400C
ov08_0222400C: @ 0x0222400C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, _0222405C @ =0x02225D74
	movs r4, #0
	adds r7, r5, #0
_02224016:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02223CD4
	str r0, [sp]
	cmp r0, #0
	beq _0222404E
	ldr r2, _02224060 @ =0x0000B4B7
	ldr r1, [sp]
	adds r0, r5, #0
	adds r2, r4, r2
	bl ov08_02223E3C
	ldr r3, _02224060 @ =0x0000B4B7
	lsls r2, r4, #0x10
	ldr r1, [sp]
	adds r0, r5, #0
	lsrs r2, r2, #0x10
	adds r3, r4, r3
	bl ov08_02223E74
	movs r0, #0x31
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	ldr r1, [r6]
	ldr r2, [r6, #4]
	bl ov08_02223F74
_0222404E:
	adds r4, r4, #1
	adds r6, #8
	adds r7, r7, #4
	cmp r4, #6
	blo _02224016
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222405C: .4byte 0x02225D74
_02224060: .4byte 0x0000B4B7
	thumb_func_end ov08_0222400C

	thumb_func_start ov08_02224064
ov08_02224064: @ 0x02224064
	push {r3, r4, r5, lr}
	ldr r1, _022240A0 @ =0x0000114D
	adds r4, r0, #0
	ldrb r1, [r4, r1]
	ldr r2, [r4]
	adds r1, r2, r1
	adds r1, #0x27
	ldrb r1, [r1]
	bl ov08_02223CD4
	adds r5, r0, #0
	ldr r2, _022240A4 @ =0x0000B4B7
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov08_02223E3C
	ldr r3, _022240A4 @ =0x0000B4B7
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	bl ov08_02223E74
	movs r0, #0x31
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x28
	movs r2, #0x2c
	bl ov08_02223F74
	pop {r3, r4, r5, pc}
	.align 2, 0
_022240A0: .4byte 0x0000114D
_022240A4: .4byte 0x0000B4B7
	thumb_func_end ov08_02224064

	thumb_func_start ov08_022240A8
ov08_022240A8: @ 0x022240A8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0223A8E4
	ldr r1, _02224104 @ =0x0000B4BE
	adds r4, r0, #0
	str r1, [sp]
	str r1, [sp, #4]
	subs r1, r1, #5
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r1, #0xc3
	ldr r3, [r5]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r5, #8]
	ldr r3, [r3, #0xc]
	bl FUN_0226B8FC
	ldr r3, _02224104 @ =0x0000B4BE
	movs r1, #0xc3
	str r3, [sp]
	subs r0, r3, #5
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r2, [r5]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	adds r0, r4, #0
	bl FUN_0226B9A4
	adds r1, r0, #0
	ldr r0, [r5, #0x34]
	bl ov08_02224B94
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02224104: .4byte 0x0000B4BE
	thumb_func_end ov08_022240A8

	thumb_func_start ov08_02224108
ov08_02224108: @ 0x02224108
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov08_02224B84
	bl FUN_0226BA28
	ldr r3, _02224130 @ =0x0000B4B9
	movs r0, #0xc3
	adds r1, r3, #5
	str r3, [sp]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl FUN_0226B97C
	add sp, #4
	pop {r3, r4, pc}
	nop
_02224130: .4byte 0x0000B4B9
	thumb_func_end ov08_02224108

	thumb_func_start ov08_02224134
ov08_02224134: @ 0x02224134
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, _02224174 @ =0x02225CF8
	lsls r2, r4, #2
	ldr r0, [r5, #0x34]
	ldr r1, [r1, r2]
	bl ov08_02224BCC
	cmp r4, #0
	beq _02224152
	cmp r4, #1
	beq _0222415E
	cmp r4, #2
	pop {r3, r4, r5, pc}
_02224152:
	ldr r1, _02224178 @ =0x0000114D
	ldr r0, [r5, #0x34]
	ldrb r1, [r5, r1]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
_0222415E:
	ldr r1, _02224178 @ =0x0000114D
	ldr r2, [r5]
	ldrb r1, [r5, r1]
	ldr r0, [r5, #0x34]
	adds r1, r2, r1
	adds r1, #0x27
	ldrb r1, [r1]
	bl ov08_02224B98
	pop {r3, r4, r5, pc}
	nop
_02224174: .4byte 0x02225CF8
_02224178: .4byte 0x0000114D
	thumb_func_end ov08_02224134

	thumb_func_start ov08_0222417C
ov08_0222417C: @ 0x0222417C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov08_02224B90
	ldr r0, [r4, #0x34]
	bl ov08_02224BC0
	ldr r0, [r4, #0x34]
	bl ov08_02224B84
	bl FUN_0226BB68
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov08_0222417C

	thumb_func_start ov08_0222419C
ov08_0222419C: @ 0x0222419C
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0223A8E4
	ldr r1, _022241F0 @ =0x0000B4BD
	adds r4, r0, #0
	str r1, [sp]
	str r1, [sp, #4]
	subs r1, r1, #5
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r1, #0xc3
	ldr r2, [r5]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	ldr r3, [r5, #8]
	bl FUN_0226BBC4
	ldr r3, _022241F0 @ =0x0000B4BD
	movs r1, #0xc3
	str r3, [sp]
	subs r0, r3, #5
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r2, [r5]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	ldr r2, [r2, #0xc]
	adds r0, r4, #0
	bl FUN_0226BC68
	str r0, [r5, #0x38]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_022241F0: .4byte 0x0000B4BD
	thumb_func_end ov08_0222419C

	thumb_func_start ov08_022241F4
ov08_022241F4: @ 0x022241F4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	bl FUN_0226BCE4
	ldr r3, _02224218 @ =0x0000B4B8
	movs r0, #0xc3
	adds r1, r3, #5
	str r3, [sp]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl FUN_0226BC40
	add sp, #4
	pop {r3, r4, pc}
	nop
_02224218: .4byte 0x0000B4B8
	thumb_func_end ov08_022241F4

	thumb_func_start ov08_0222421C
ov08_0222421C: @ 0x0222421C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x14]
	cmp r0, #1
	bne _02224242
	lsls r3, r1, #3
	ldr r1, _0222424C @ =0x02225D2C
	ldr r2, _02224250 @ =0x02225D30
	ldr r0, [r4, #0x38]
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	bl FUN_0226BD2C
	ldr r0, [r4, #0x38]
	movs r1, #0x3c
	bl FUN_0226BD4C
	pop {r4, pc}
_02224242:
	ldr r0, [r4, #0x38]
	bl FUN_0226BD38
	pop {r4, pc}
	nop
_0222424C: .4byte 0x02225D2C
_02224250: .4byte 0x02225D30
	thumb_func_end ov08_0222421C

	thumb_func_start ov08_02224254
ov08_02224254: @ 0x02224254
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #0xca
	lsls r0, r0, #2
	movs r2, #0
	adds r0, r5, r0
	adds r3, r2, #0
	adds r4, r1, #0
	bl ov08_0222458C
	movs r0, #0x10
	str r0, [sp]
	ldr r0, _02224510 @ =0x00000448
	movs r3, #9
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	str r3, [sp, #4]
	bl ov08_0222458C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	ldr r0, _02224514 @ =0x00000568
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x12
	bl ov08_0222458C
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _02224518 @ =0x00000688
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x1b
	bl ov08_0222458C
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _0222451C @ =0x0000078C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x20
	bl ov08_0222458C
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #0x89
	lsls r0, r0, #4
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x25
	bl ov08_0222458C
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	ldr r0, _02224520 @ =0x00000994
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x2a
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224524 @ =0x00000A98
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x39
	bl ov08_0222458C
	ldr r0, _02224528 @ =0x00000ACA
	movs r2, #5
	str r2, [sp]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x39
	str r2, [sp, #4]
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222452C @ =0x00000AFC
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xa
	movs r3, #0x39
	bl ov08_0222458C
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, _02224530 @ =0x00000B2E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0
	bl ov08_0222458C
	ldr r0, _02224534 @ =0x00000BEE
	movs r2, #0x10
	str r2, [sp]
	movs r3, #6
	adds r0, r5, r0
	adds r1, r4, #0
	str r3, [sp, #4]
	bl ov08_0222458C
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, _02224538 @ =0x00000CAE
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0xc
	bl ov08_0222458C
	movs r2, #0x10
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, _0222453C @ =0x00000D6E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r3, #0x12
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224540 @ =0x00000E2E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x2f
	bl ov08_0222458C
	movs r0, #0xe6
	movs r2, #5
	lsls r0, r0, #4
	str r2, [sp]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x2f
	str r2, [sp, #4]
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224544 @ =0x00000E92
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xa
	movs r3, #0x2f
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224548 @ =0x00000EC4
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xf
	movs r3, #0x2f
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222454C @ =0x00000EF6
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0
	movs r3, #0x34
	bl ov08_0222458C
	ldr r0, _02224550 @ =0x00000F28
	movs r2, #5
	str r2, [sp]
	adds r0, r5, r0
	adds r1, r4, #0
	movs r3, #0x34
	str r2, [sp, #4]
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224554 @ =0x00000F5A
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xa
	movs r3, #0x34
	bl ov08_0222458C
	movs r0, #5
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224558 @ =0x00000F8C
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0xf
	movs r3, #0x34
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222455C @ =0x00000FBE
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x14
	movs r3, #0x2f
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224560 @ =0x00000FDE
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x18
	movs r3, #0x2f
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224564 @ =0x00000FFE
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1c
	movs r3, #0x2f
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224568 @ =0x0000101E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x14
	movs r3, #0x33
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222456C @ =0x0000103E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x18
	movs r3, #0x33
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224570 @ =0x0000105E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1c
	movs r3, #0x33
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224574 @ =0x0000107E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x14
	movs r3, #0x37
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224578 @ =0x0000109E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x18
	movs r3, #0x37
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0222457C @ =0x000010BE
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1c
	movs r3, #0x37
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224580 @ =0x000010DE
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x14
	movs r3, #0x3b
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224584 @ =0x000010FE
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x18
	movs r3, #0x3b
	bl ov08_0222458C
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02224588 @ =0x0000111E
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #0x1c
	movs r3, #0x3b
	bl ov08_0222458C
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_02224510: .4byte 0x00000448
_02224514: .4byte 0x00000568
_02224518: .4byte 0x00000688
_0222451C: .4byte 0x0000078C
_02224520: .4byte 0x00000994
_02224524: .4byte 0x00000A98
_02224528: .4byte 0x00000ACA
_0222452C: .4byte 0x00000AFC
_02224530: .4byte 0x00000B2E
_02224534: .4byte 0x00000BEE
_02224538: .4byte 0x00000CAE
_0222453C: .4byte 0x00000D6E
_02224540: .4byte 0x00000E2E
_02224544: .4byte 0x00000E92
_02224548: .4byte 0x00000EC4
_0222454C: .4byte 0x00000EF6
_02224550: .4byte 0x00000F28
_02224554: .4byte 0x00000F5A
_02224558: .4byte 0x00000F8C
_0222455C: .4byte 0x00000FBE
_02224560: .4byte 0x00000FDE
_02224564: .4byte 0x00000FFE
_02224568: .4byte 0x0000101E
_0222456C: .4byte 0x0000103E
_02224570: .4byte 0x0000105E
_02224574: .4byte 0x0000107E
_02224578: .4byte 0x0000109E
_0222457C: .4byte 0x000010BE
_02224580: .4byte 0x000010DE
_02224584: .4byte 0x000010FE
_02224588: .4byte 0x0000111E
	thumb_func_end ov08_02224254

	thumb_func_start ov08_0222458C
ov08_0222458C: @ 0x0222458C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r0, sp, #8
	mov lr, r3
	ldrb r3, [r0, #0x14]
	movs r6, #0
	mov ip, r3
	cmp r3, #0
	ble _022245D8
	ldrb r3, [r0, #0x10]
	lsls r2, r2, #1
	adds r7, r1, r2
_022245A4:
	movs r2, #0
	cmp r3, #0
	ble _022245CC
	mov r0, lr
	adds r0, r0, r6
	lsls r0, r0, #6
	adds r5, r7, r0
	adds r0, r6, #0
	muls r0, r3, r0
	lsls r1, r0, #1
	ldr r0, [sp]
	adds r4, r0, r1
_022245BC:
	lsls r1, r2, #1
	ldrh r0, [r5, r1]
	strh r0, [r4, r1]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r3
	blt _022245BC
_022245CC:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, ip
	cmp r6, r0
	blt _022245A4
_022245D8:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_0222458C

	thumb_func_start ov08_022245DC
ov08_022245DC: @ 0x022245DC
	cmp r1, #0x10
	bhi _0222466A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022245EC: @ jump table
	.2byte _0222460E - _022245EC - 2 @ case 0
	.2byte _0222460E - _022245EC - 2 @ case 1
	.2byte _0222460E - _022245EC - 2 @ case 2
	.2byte _0222460E - _022245EC - 2 @ case 3
	.2byte _0222461E - _022245EC - 2 @ case 4
	.2byte _0222462C - _022245EC - 2 @ case 5
	.2byte _02224638 - _022245EC - 2 @ case 6
	.2byte _02224638 - _022245EC - 2 @ case 7
	.2byte _02224638 - _022245EC - 2 @ case 8
	.2byte _02224638 - _022245EC - 2 @ case 9
	.2byte _02224638 - _022245EC - 2 @ case 10
	.2byte _02224638 - _022245EC - 2 @ case 11
	.2byte _02224644 - _022245EC - 2 @ case 12
	.2byte _02224650 - _022245EC - 2 @ case 13
	.2byte _0222462C - _022245EC - 2 @ case 14
	.2byte _0222465C - _022245EC - 2 @ case 15
	.2byte _0222462C - _022245EC - 2 @ case 16
_0222460E:
	movs r1, #0xca
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x12
	lsls r0, r0, #4
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_0222461E:
	ldr r1, _02224670 @ =0x00000688
	adds r1, r0, r1
	lsls r0, r2, #6
	adds r0, r2, r0
	lsls r0, r0, #2
	adds r0, r1, r0
	bx lr
_0222462C:
	ldr r1, _02224674 @ =0x00000A98
	adds r1, r0, r1
	movs r0, #0x32
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02224638:
	ldr r1, _02224678 @ =0x00000B2E
	adds r1, r0, r1
	movs r0, #0xc0
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02224644:
	ldr r1, _0222467C @ =0x00000E2E
	adds r1, r0, r1
	movs r0, #0x32
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_02224650:
	ldr r1, _02224680 @ =0x00000EF6
	adds r1, r0, r1
	movs r0, #0x32
	muls r0, r2, r0
	adds r0, r1, r0
	bx lr
_0222465C:
	ldr r1, _02224670 @ =0x00000688
	adds r1, r0, r1
	lsls r0, r2, #6
	adds r0, r2, r0
	lsls r0, r0, #2
	adds r0, r1, r0
	bx lr
_0222466A:
	movs r0, #0
	bx lr
	nop
_02224670: .4byte 0x00000688
_02224674: .4byte 0x00000A98
_02224678: .4byte 0x00000B2E
_0222467C: .4byte 0x00000E2E
_02224680: .4byte 0x00000EF6
	thumb_func_end ov08_022245DC

	thumb_func_start ov08_02224684
ov08_02224684: @ 0x02224684
	cmp r2, #3
	bne _0222468C
	movs r0, #5
	bx lr
_0222468C:
	cmp r1, #0x10
	bhi _022246EA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222469C: @ jump table
	.2byte _022246BE - _0222469C - 2 @ case 0
	.2byte _022246BE - _0222469C - 2 @ case 1
	.2byte _022246BE - _0222469C - 2 @ case 2
	.2byte _022246BE - _0222469C - 2 @ case 3
	.2byte _022246C2 - _0222469C - 2 @ case 4
	.2byte _022246C6 - _0222469C - 2 @ case 5
	.2byte _022246CA - _0222469C - 2 @ case 6
	.2byte _022246CA - _0222469C - 2 @ case 7
	.2byte _022246CA - _0222469C - 2 @ case 8
	.2byte _022246CA - _0222469C - 2 @ case 9
	.2byte _022246CA - _0222469C - 2 @ case 10
	.2byte _022246CA - _0222469C - 2 @ case 11
	.2byte _022246C6 - _0222469C - 2 @ case 12
	.2byte _022246C6 - _0222469C - 2 @ case 13
	.2byte _022246C6 - _0222469C - 2 @ case 14
	.2byte _022246D6 - _0222469C - 2 @ case 15
	.2byte _022246C6 - _0222469C - 2 @ case 16
_022246BE:
	movs r0, #0
	bx lr
_022246C2:
	movs r0, #3
	bx lr
_022246C6:
	movs r0, #2
	bx lr
_022246CA:
	ldr r1, _022246F0 @ =0x0000114D
	ldrb r0, [r0, r1]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
_022246D6:
	cmp r3, #2
	bne _022246E6
	ldr r1, _022246F0 @ =0x0000114D
	ldrb r0, [r0, r1]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
_022246E6:
	movs r0, #1
	bx lr
_022246EA:
	movs r0, #0
	bx lr
	nop
_022246F0: .4byte 0x0000114D
	thumb_func_end ov08_02224684

	thumb_func_start ov08_022246F4
ov08_022246F4: @ 0x022246F4
	push {r4, r5, r6, r7}
	cmp r2, #0
	bne _02224704
	ldr r2, _02224758 @ =0x00000FBE
	adds r2, r0, r2
	lsls r0, r3, #5
	adds r0, r2, r0
	b _0222472C
_02224704:
	cmp r2, #1
	bne _02224712
	ldr r2, _0222475C @ =0x0000101E
	adds r2, r0, r2
	lsls r0, r3, #5
	adds r0, r2, r0
	b _0222472C
_02224712:
	cmp r2, #2
	bne _02224720
	ldr r2, _02224760 @ =0x0000107E
	adds r2, r0, r2
	lsls r0, r3, #5
	adds r0, r2, r0
	b _0222472C
_02224720:
	cmp r2, #3
	bne _02224754
	ldr r2, _02224764 @ =0x000010DE
	adds r2, r0, r2
	lsls r0, r3, #5
	adds r0, r2, r0
_0222472C:
	movs r2, #0
_0222472E:
	lsls r4, r2, #3
	lsls r5, r2, #5
	movs r3, #0
	adds r4, r0, r4
	adds r5, r1, r5
_02224738:
	lsls r6, r3, #1
	ldrh r7, [r4, r6]
	adds r3, r3, #1
	lsls r3, r3, #0x10
	adds r6, r5, r6
	lsrs r3, r3, #0x10
	strh r7, [r6, #0xc]
	cmp r3, #4
	blo _02224738
	adds r2, r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #4
	blo _0222472E
_02224754:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_02224758: .4byte 0x00000FBE
_0222475C: .4byte 0x0000101E
_02224760: .4byte 0x0000107E
_02224764: .4byte 0x000010DE
	thumb_func_end ov08_022246F4

	thumb_func_start ov08_02224768
ov08_02224768: @ 0x02224768
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r2, [sp, #4]
	str r3, [sp, #8]
	adds r5, r1, #0
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	str r0, [sp]
	bl ov08_022245DC
	add r3, sp, #0x10
	adds r4, r0, #0
	ldrb r3, [r3, #0x10]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ov08_02224684
	lsls r0, r0, #0x1c
	lsrs r2, r0, #0x10
	ldr r0, [sp, #4]
	ldr r6, _022247D4 @ =0x02225E9F
	lsls r3, r0, #2
	ldr r0, _022247D8 @ =0x02225E9E
	ldrb r6, [r6, r3]
	ldrb r0, [r0, r3]
	movs r1, #0
	muls r6, r0, r6
	cmp r6, #0
	ble _022247C4
	ldr r0, _022247DC @ =0x02225E9C
	ldr r7, _022247E0 @ =0x00000FFF
	adds r3, r0, r3
_022247AA:
	lsls r0, r1, #1
	ldrh r6, [r4, r0]
	ands r6, r7
	orrs r6, r2
	strh r6, [r5, r0]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrb r6, [r3, #2]
	ldrb r0, [r3, #3]
	muls r0, r6, r0
	cmp r1, r0
	blt _022247AA
_022247C4:
	ldr r0, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r1, r5, #0
	bl ov08_022246F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022247D4: .4byte 0x02225E9F
_022247D8: .4byte 0x02225E9E
_022247DC: .4byte 0x02225E9C
_022247E0: .4byte 0x00000FFF
	thumb_func_end ov08_02224768

	thumb_func_start ov08_022247E4
ov08_022247E4: @ 0x022247E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	adds r5, r0, #0
	ldr r0, [sp, #0xc]
	lsls r4, r0, #2
	ldr r0, _02224848 @ =0x02225E9F
	ldrb r7, [r0, r4]
	ldr r0, _0222484C @ =0x02225E9E
	ldrb r6, [r0, r4]
	ldr r0, [r5]
	adds r1, r6, #0
	muls r1, r7, r1
	ldr r0, [r0, #0xc]
	lsls r1, r1, #1
	bl FUN_0201AA8C
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	adds r0, r5, #0
	bl ov08_02224768
	ldr r0, _02224850 @ =0x02225E9D
	ldr r3, _02224854 @ =0x02225E9C
	ldrb r0, [r0, r4]
	ldrb r3, [r3, r4]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r5, #4]
	movs r1, #6
	bl FUN_0201C4C4
	ldr r0, [r5, #4]
	movs r1, #6
	bl FUN_0201EFBC
	ldr r0, [sp, #0x18]
	bl FUN_0201AB0C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02224848: .4byte 0x02225E9F
_0222484C: .4byte 0x02225E9E
_02224850: .4byte 0x02225E9D
_02224854: .4byte 0x02225E9C
	thumb_func_end ov08_022247E4

	thumb_func_start ov08_02224858
ov08_02224858: @ 0x02224858
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	cmp r1, #6
	blo _02224876
	cmp r1, #0xb
	bhi _02224876
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _02224876
	adds r1, #0xb
	ldr r0, _022248CC @ =0x02225EE0
	lsls r1, r1, #2
	ldr r4, [r0, r1]
	b _0222487C
_02224876:
	ldr r0, _022248CC @ =0x02225EE0
	lsls r1, r1, #2
	ldr r4, [r0, r1]
_0222487C:
	cmp r4, #0
	beq _022248C8
	cmp r2, #0
	beq _0222488C
	cmp r2, #1
	beq _02224894
	cmp r2, #2
	bne _0222489A
_0222488C:
	movs r0, #1
	str r0, [sp]
	movs r7, #2
	b _0222489A
_02224894:
	movs r0, #0
	str r0, [sp]
	movs r7, #4
_0222489A:
	movs r5, #0
_0222489C:
	ldrb r0, [r4, r5]
	cmp r0, #0xff
	beq _022248C8
	ldr r1, [r6, #0x2c]
	lsls r0, r0, #4
	adds r0, r1, r0
	ldr r1, [sp]
	adds r2, r7, #0
	movs r3, #0
	bl FUN_0201EC48
	ldrb r0, [r4, r5]
	ldr r1, [r6, #0x2c]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D5C8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #8
	blo _0222489C
_022248C8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022248CC: .4byte 0x02225EE0
	thumb_func_end ov08_02224858

	thumb_func_start ov08_022248D0
ov08_022248D0: @ 0x022248D0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r2, [sp]
	cmp r1, #6
	blo _022248EC
	cmp r1, #0xb
	bhi _022248EC
	subs r0, r1, #6
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x31
	lsls r0, r0, #4
	ldr r6, [r1, r0]
	b _02224910
_022248EC:
	cmp r1, #4
	bne _02224934
	movs r7, #0x31
	movs r4, #0
	lsls r7, r7, #4
_022248F6:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r6, [r0, r7]
	adds r0, r6, #0
	bl FUN_0200DCFC
	cmp r0, #0
	bne _02224910
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	blo _022248F6
_02224910:
	ldr r0, [sp]
	cmp r0, #0
	beq _0222491E
	cmp r0, #1
	beq _0222492A
	cmp r0, #2
	bne _02224934
_0222491E:
	adds r0, r6, #0
	movs r1, #0
	movs r2, #2
	bl FUN_0200DED0
	pop {r3, r4, r5, r6, r7, pc}
_0222492A:
	movs r1, #0
	adds r0, r6, #0
	subs r2, r1, #4
	bl FUN_0200DED0
_02224934:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov08_022248D0

	thumb_func_start ov08_02224938
ov08_02224938: @ 0x02224938
	push {r4, r5}
	ldr r3, _02224970 @ =0x0000113E
	movs r5, #0
	strb r5, [r0, r3]
	adds r4, r3, #1
	strb r5, [r0, r4]
	adds r4, r3, #2
	strb r1, [r0, r4]
	adds r1, r3, #3
	ldrb r4, [r0, r1]
	movs r1, #0xf0
	bics r4, r1
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x18
	adds r2, r4, #0
	orrs r2, r1
	adds r1, r3, #3
	strb r2, [r0, r1]
	ldrb r2, [r0, r1]
	movs r1, #0xf
	bics r2, r1
	movs r1, #1
	orrs r2, r1
	adds r1, r3, #3
	strb r2, [r0, r1]
	pop {r4, r5}
	bx lr
	nop
_02224970: .4byte 0x0000113E
	thumb_func_end ov08_02224938

	thumb_func_start ov08_02224974
ov08_02224974: @ 0x02224974
	push {r4, lr}
	ldr r3, _02224A48 @ =0x00001141
	adds r4, r0, #0
	ldrb r1, [r4, r3]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	beq _02224A44
	subs r1, r3, #3
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _02224994
	cmp r1, #1
	beq _022249CC
	cmp r1, #2
	beq _02224A04
	pop {r4, pc}
_02224994:
	subs r1, r3, #1
	adds r3, #0xb
	ldrb r1, [r4, r1]
	ldrb r3, [r4, r3]
	movs r2, #1
	bl ov08_022247E4
	movs r1, #0x45
	lsls r1, r1, #6
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	bl ov08_02224858
	movs r1, #0x45
	lsls r1, r1, #6
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #1
	bl ov08_022248D0
	ldr r0, _02224A4C @ =0x0000113F
	movs r1, #0
	strb r1, [r4, r0]
	movs r1, #1
	subs r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_022249CC:
	subs r1, r3, #1
	adds r3, #0xb
	ldrb r1, [r4, r1]
	ldrb r3, [r4, r3]
	movs r2, #2
	bl ov08_022247E4
	movs r1, #0x45
	lsls r1, r1, #6
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #2
	bl ov08_02224858
	movs r1, #0x45
	lsls r1, r1, #6
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #2
	bl ov08_022248D0
	ldr r0, _02224A4C @ =0x0000113F
	movs r1, #0
	strb r1, [r4, r0]
	movs r1, #2
	subs r0, r0, #1
	strb r1, [r4, r0]
	pop {r4, pc}
_02224A04:
	subs r1, r3, #1
	adds r3, #0xb
	ldrb r1, [r4, r1]
	ldrb r3, [r4, r3]
	movs r2, #0
	bl ov08_022247E4
	movs r1, #0x45
	lsls r1, r1, #6
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0
	bl ov08_02224858
	movs r1, #0x45
	lsls r1, r1, #6
	ldrb r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0
	bl ov08_022248D0
	ldr r0, _02224A4C @ =0x0000113F
	movs r2, #0
	strb r2, [r4, r0]
	subs r1, r0, #1
	strb r2, [r4, r1]
	adds r1, r0, #2
	ldrb r2, [r4, r1]
	movs r1, #0xf
	adds r0, r0, #2
	bics r2, r1
	strb r2, [r4, r0]
_02224A44:
	pop {r4, pc}
	nop
_02224A48: .4byte 0x00001141
_02224A4C: .4byte 0x0000113F
	thumb_func_end ov08_02224974

	thumb_func_start ov08_02224A50
ov08_02224A50: @ 0x02224A50
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	beq _02224A62
	cmp r6, #1
	beq _02224AC0
	cmp r6, #2
	beq _02224B46
	pop {r3, r4, r5, r6, r7, pc}
_02224A62:
	movs r1, #0
	adds r2, r1, #0
	adds r3, r6, #0
	bl ov08_022247E4
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	ldr r0, [r5]
	ldrh r0, [r0, #0x20]
	cmp r0, #0
	bne _02224AA6
	adds r0, r5, #0
	movs r1, #4
	movs r2, #3
	adds r3, r6, #0
	bl ov08_022247E4
	b _02224AB2
_02224AA6:
	adds r0, r5, #0
	movs r1, #4
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
_02224AB2:
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	pop {r3, r4, r5, r6, r7, pc}
_02224AC0:
	movs r4, #0
	movs r7, #3
_02224AC4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov08_02223CD4
	cmp r0, #0
	bne _02224AE2
	adds r1, r4, #6
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	adds r2, r7, #0
	adds r3, r6, #0
	bl ov08_022247E4
	b _02224AF2
_02224AE2:
	adds r1, r4, #6
	lsls r1, r1, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
_02224AF2:
	adds r4, r4, #1
	cmp r4, #6
	blo _02224AC4
	ldr r0, _02224B60 @ =0x0000114D
	ldrb r1, [r5, r0]
	adds r0, r0, #7
	adds r1, r5, r1
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _02224B20
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #3
	adds r3, r6, #0
	bl ov08_022247E4
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #3
	adds r3, r6, #0
	bl ov08_022247E4
	b _02224B38
_02224B20:
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
_02224B38:
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	pop {r3, r4, r5, r6, r7, pc}
_02224B46:
	movs r1, #0xf
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0
	adds r3, r6, #0
	bl ov08_022247E4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224B60: .4byte 0x0000114D
	thumb_func_end ov08_02224A50

	thumb_func_start ov08_02224B64
ov08_02224B64: @ 0x02224B64
	push {r3, lr}
	movs r1, #0x10
	bl FUN_0201AA8C
	adds r3, r0, #0
	movs r2, #0x10
	movs r1, #0
_02224B72:
	strb r1, [r3]
	adds r3, r3, #1
	subs r2, r2, #1
	bne _02224B72
	pop {r3, pc}
	thumb_func_end ov08_02224B64

	thumb_func_start ov08_02224B7C
ov08_02224B7C: @ 0x02224B7C
	ldr r3, _02224B80 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_02224B80: .4byte FUN_0201AB0C
	thumb_func_end ov08_02224B7C

	thumb_func_start ov08_02224B84
ov08_02224B84: @ 0x02224B84
	ldr r0, [r0]
	bx lr
	thumb_func_end ov08_02224B84

	thumb_func_start ov08_02224B88
ov08_02224B88: @ 0x02224B88
	ldrb r0, [r0, #9]
	bx lr
	thumb_func_end ov08_02224B88

	thumb_func_start ov08_02224B8C
ov08_02224B8C: @ 0x02224B8C
	ldrb r0, [r0, #8]
	bx lr
	thumb_func_end ov08_02224B8C

	thumb_func_start ov08_02224B90
ov08_02224B90: @ 0x02224B90
	strb r1, [r0, #8]
	bx lr
	thumb_func_end ov08_02224B90

	thumb_func_start ov08_02224B94
ov08_02224B94: @ 0x02224B94
	str r1, [r0]
	bx lr
	thumb_func_end ov08_02224B94

	thumb_func_start ov08_02224B98
ov08_02224B98: @ 0x02224B98
	push {r3, r4, lr}
	sub sp, #4
	strb r1, [r0, #9]
	ldrb r1, [r0, #8]
	cmp r1, #1
	bne _02224BBC
	ldrb r1, [r0, #9]
	ldr r2, [r0, #4]
	lsls r4, r1, #3
	adds r3, r2, r4
	ldrb r1, [r3, #3]
	str r1, [sp]
	ldrb r1, [r2, r4]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #1]
	ldr r0, [r0]
	bl FUN_0226BAFC
_02224BBC:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov08_02224B98

	thumb_func_start ov08_02224BC0
ov08_02224BC0: @ 0x02224BC0
	movs r1, #0
	strb r1, [r0, #9]
	movs r1, #0xff
	strb r1, [r0, #0xa]
	bx lr
	.align 2, 0
	thumb_func_end ov08_02224BC0

	thumb_func_start ov08_02224BCC
ov08_02224BCC: @ 0x02224BCC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov08_02224BC0
	movs r0, #0
	str r5, [r4, #4]
	mvns r0, r0
	str r0, [r4, #0xc]
	ldrb r0, [r4, #8]
	cmp r0, #1
	bne _02224BF6
	ldr r3, [r4, #4]
	ldrb r0, [r3, #3]
	str r0, [sp]
	ldrb r1, [r3]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #1]
	ldr r0, [r4]
	bl FUN_0226BAFC
_02224BF6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov08_02224BCC

	thumb_func_start ov08_02224BF8
ov08_02224BF8: @ 0x02224BF8
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov08_02224BF8

	thumb_func_start ov08_02224BFC
ov08_02224BFC: @ 0x02224BFC
	push {r3, r4, lr}
	sub sp, #4
	ldrb r1, [r0, #8]
	cmp r1, #1
	bne _02224C0C
	add sp, #4
	movs r0, #1
	pop {r3, r4, pc}
_02224C0C:
	ldr r1, _02224C40 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #0xf3
	tst r1, r2
	beq _02224C38
	movs r1, #1
	strb r1, [r0, #8]
	ldrb r1, [r0, #9]
	ldr r2, [r0, #4]
	lsls r4, r1, #3
	adds r3, r2, r4
	ldrb r1, [r3, #3]
	str r1, [sp]
	ldrb r1, [r2, r4]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #1]
	ldr r0, [r0]
	bl FUN_0226BAFC
	ldr r0, _02224C44 @ =0x000005DC
	bl FUN_0200604C
_02224C38:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_02224C40: .4byte 0x021D110C
_02224C44: .4byte 0x000005DC
	thumb_func_end ov08_02224BFC

	thumb_func_start ov08_02224C48
ov08_02224C48: @ 0x02224C48
	cmp r1, #3
	bhi _02224C90
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02224C58: @ jump table
	.2byte _02224C60 - _02224C58 - 2 @ case 0
	.2byte _02224C6C - _02224C58 - 2 @ case 1
	.2byte _02224C78 - _02224C58 - 2 @ case 2
	.2byte _02224C84 - _02224C58 - 2 @ case 3
_02224C60:
	ldrb r1, [r0, #5]
	movs r0, #0x80
	tst r0, r1
	beq _02224C90
	movs r0, #1
	bx lr
_02224C6C:
	ldrb r1, [r0, #4]
	movs r0, #0x80
	tst r0, r1
	beq _02224C90
	movs r0, #1
	bx lr
_02224C78:
	ldrb r1, [r0, #7]
	movs r0, #0x80
	tst r0, r1
	beq _02224C90
	movs r0, #1
	bx lr
_02224C84:
	ldrb r1, [r0, #6]
	movs r0, #0x80
	tst r0, r1
	beq _02224C90
	movs r0, #1
	bx lr
_02224C90:
	movs r0, #0
	bx lr
	thumb_func_end ov08_02224C48

	thumb_func_start ov08_02224C94
ov08_02224C94: @ 0x02224C94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ov08_02224BFC
	cmp r0, #0
	bne _02224CAA
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02224CAA:
	ldr r0, _02224E20 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02224CCE
	movs r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	adds r2, r1, #0
	adds r3, r1, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	bl FUN_02020A24
	adds r4, r0, #0
	movs r6, #0
	b _02224D36
_02224CCE:
	movs r1, #0x80
	tst r1, r0
	beq _02224CF0
	movs r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	adds r2, r1, #0
	adds r3, r1, #0
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl FUN_02020A24
	adds r4, r0, #0
	movs r6, #1
	b _02224D36
_02224CF0:
	movs r1, #0x20
	tst r1, r0
	beq _02224D12
	movs r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	adds r2, r1, #0
	adds r3, r1, #0
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl FUN_02020A24
	adds r4, r0, #0
	movs r6, #2
	b _02224D36
_02224D12:
	movs r1, #0x10
	tst r0, r1
	beq _02224D34
	movs r1, #0
	str r1, [sp]
	ldrb r0, [r5, #9]
	adds r2, r1, #0
	adds r3, r1, #0
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl FUN_02020A24
	adds r4, r0, #0
	movs r6, #3
	b _02224D36
_02224D34:
	movs r4, #0xff
_02224D36:
	cmp r4, #0xff
	beq _02224DF6
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x80
	adds r1, r4, #0
	tst r1, r0
	beq _02224D56
	ldrb r1, [r5, #0xa]
	cmp r1, #0xff
	beq _02224D50
	adds r4, r1, #0
	b _02224D56
_02224D50:
	eors r0, r4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_02224D56:
	movs r7, #0
_02224D58:
	movs r0, #1
	ldr r1, [r5, #0xc]
	lsls r0, r4
	tst r0, r1
	bne _02224D90
	str r7, [sp, #0xc]
	str r7, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #4]
	adds r1, r7, #0
	adds r2, r7, #0
	adds r3, r7, #0
	bl FUN_02020A24
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, r4
	beq _02224D88
	ldrb r0, [r5, #9]
	cmp r1, r0
	bne _02224D8C
_02224D88:
	ldrb r4, [r5, #9]
	b _02224D90
_02224D8C:
	adds r4, r1, #0
	b _02224D58
_02224D90:
	ldrb r0, [r5, #9]
	cmp r0, r4
	beq _02224DEE
	ldr r0, [r5, #4]
	lsls r7, r4, #3
	add r1, sp, #0x10
	add r2, sp, #0x10
	adds r0, r0, r7
	adds r1, #3
	adds r2, #2
	bl FUN_02020A0C
	ldr r0, [r5, #4]
	add r1, sp, #0x10
	adds r0, r0, r7
	adds r1, #1
	add r2, sp, #0x10
	bl FUN_02020A18
	ldr r0, [r5, #4]
	adds r1, r6, #0
	adds r0, r0, r7
	bl ov08_02224C48
	cmp r0, #1
	bne _02224DD0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02224DD0
	ldrb r0, [r5, #9]
	strb r0, [r5, #0xa]
	b _02224DD4
_02224DD0:
	movs r0, #0xff
	strb r0, [r5, #0xa]
_02224DD4:
	strb r4, [r5, #9]
	add r3, sp, #0x10
	ldrb r0, [r3]
	str r0, [sp]
	ldrb r1, [r3, #3]
	ldrb r2, [r3, #1]
	ldrb r3, [r3, #2]
	ldr r0, [r5]
	bl FUN_0226BAFC
	ldr r0, _02224E24 @ =0x000005DC
	bl FUN_0200604C
_02224DEE:
	movs r0, #0
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02224DF6:
	ldr r0, _02224E20 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02224E06
	add sp, #0x14
	ldrb r0, [r5, #9]
	pop {r4, r5, r6, r7, pc}
_02224E06:
	movs r0, #2
	tst r1, r0
	beq _02224E1A
	ldr r0, _02224E28 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #1
	add sp, #0x14
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_02224E1A:
	subs r0, r0, #3
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02224E20: .4byte 0x021D110C
_02224E24: .4byte 0x000005DC
_02224E28: .4byte 0x000005DD
	thumb_func_end ov08_02224C94

	.rodata

_02224E2C:
	.byte 0x00, 0x02, 0x04, 0x01
	.byte 0x03, 0x05, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x98, 0xBF, 0x00, 0xCF, 0x00, 0x27, 0xB8, 0xFF, 0x98, 0xBF, 0xD8, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x08, 0x8F, 0x08, 0xF7, 0x98, 0xBF, 0x00, 0x67, 0x98, 0xBF, 0x68, 0xCF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x98, 0xBF, 0x00, 0x27, 0x98, 0xBF, 0x28, 0x4F
	.byte 0x98, 0xBF, 0x60, 0xC7, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x98, 0xA7, 0x58, 0x7F
	.byte 0x98, 0xA7, 0x80, 0xA7, 0xA8, 0xB7, 0x58, 0x7F, 0xA8, 0xB7, 0x80, 0xA7, 0x98, 0xBF, 0xD8, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x30, 0x5F, 0x00, 0x7F, 0x30, 0x5F, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F
	.byte 0x60, 0x8F, 0x80, 0xFF, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x7F
	.byte 0x08, 0x37, 0x80, 0xFF, 0x30, 0x5F, 0x00, 0x7F, 0x38, 0x67, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F
	.byte 0x68, 0x97, 0x80, 0xFF, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x30, 0x5F, 0x00, 0x7F
	.byte 0x30, 0x5F, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F, 0x60, 0x8F, 0x80, 0xFF, 0x90, 0xBF, 0x40, 0xBF
	.byte 0x00, 0x27, 0xB8, 0xFF, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x30, 0x5F, 0x00, 0x7F
	.byte 0x30, 0x5F, 0x80, 0xFF, 0x60, 0x8F, 0x00, 0x7F, 0x60, 0x8F, 0x80, 0xFF, 0x98, 0xBF, 0x00, 0x27
	.byte 0x98, 0xBF, 0x28, 0x4F, 0x98, 0xBF, 0x60, 0xC7, 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x04, 0x02, 0x15, 0x16, 0x02, 0x0F, 0x1F, 0x00, 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0F, 0x1F, 0x00
	.byte 0x3D, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x0A, 0x04, 0x0C
	.byte 0x03, 0x09, 0x01, 0x00, 0x05, 0x0B, 0x0C, 0x0A, 0x03, 0x09, 0x25, 0x00, 0x05, 0x01, 0x14, 0x0B
	.byte 0x03, 0x09, 0x43, 0x00, 0x05, 0x0E, 0x14, 0x0B, 0x03, 0x09, 0x64, 0x00, 0x04, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x8B, 0x00, 0x04, 0x01, 0x06, 0x0E, 0x05, 0x09, 0x9D, 0x00, 0x04, 0x11, 0x06, 0x0E
	.byte 0x05, 0x09, 0xE3, 0x00, 0x04, 0x01, 0x0C, 0x0E, 0x05, 0x09, 0x29, 0x01, 0x04, 0x11, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x6F, 0x01, 0x04, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x85, 0x00, 0x04, 0x01, 0x06, 0x0E
	.byte 0x05, 0x09, 0x97, 0x00, 0x04, 0x11, 0x06, 0x0E, 0x05, 0x09, 0xDD, 0x00, 0x04, 0x01, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x23, 0x01, 0x04, 0x11, 0x0C, 0x0E, 0x05, 0x09, 0x69, 0x01, 0x04, 0x09, 0x12, 0x0E
	.byte 0x05, 0x09, 0xAF, 0x01, 0x05, 0x00, 0x00, 0x0F, 0x05, 0x09, 0x85, 0x00, 0x05, 0x10, 0x01, 0x0F
	.byte 0x05, 0x09, 0xD0, 0x00, 0x05, 0x00, 0x06, 0x0F, 0x05, 0x09, 0x1B, 0x01, 0x05, 0x10, 0x07, 0x0F
	.byte 0x05, 0x09, 0x66, 0x01, 0x05, 0x00, 0x0C, 0x0F, 0x05, 0x09, 0xB1, 0x01, 0x05, 0x10, 0x0D, 0x0F
	.byte 0x05, 0x09, 0xFC, 0x01, 0x05, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x01, 0x00, 0x05, 0x04, 0x08, 0x0B
	.byte 0x02, 0x0D, 0x13, 0x00, 0x05, 0x14, 0x08, 0x02, 0x02, 0x0D, 0x29, 0x00, 0x05, 0x17, 0x08, 0x05
	.byte 0x02, 0x0D, 0x2D, 0x00, 0x05, 0x02, 0x0B, 0x0C, 0x02, 0x0D, 0x45, 0x01, 0x05, 0x10, 0x0B, 0x0F
	.byte 0x06, 0x0D, 0x5D, 0x01, 0x05, 0x07, 0x14, 0x0C, 0x03, 0x09, 0x37, 0x00, 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x25, 0x01, 0x05, 0x01, 0x06, 0x0E, 0x05, 0x09, 0x49, 0x01, 0x05, 0x11, 0x06, 0x0E
	.byte 0x05, 0x09, 0x8F, 0x01, 0x05, 0x01, 0x0C, 0x0E, 0x05, 0x09, 0xD5, 0x01, 0x05, 0x11, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x1B, 0x02, 0x05, 0x0D, 0x14, 0x0B, 0x03, 0x09, 0x04, 0x01, 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x37, 0x01, 0x05, 0x01, 0x06, 0x0E, 0x05, 0x09, 0x61, 0x02, 0x05, 0x11, 0x06, 0x0E
	.byte 0x05, 0x09, 0xA7, 0x02, 0x05, 0x01, 0x0C, 0x0E, 0x05, 0x09, 0xED, 0x02, 0x05, 0x11, 0x0C, 0x0E
	.byte 0x05, 0x09, 0x33, 0x03, 0x05, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x01, 0x00, 0x05, 0x04, 0x05, 0x0B
	.byte 0x02, 0x0D, 0x13, 0x00, 0x05, 0x14, 0x05, 0x02, 0x02, 0x0D, 0x29, 0x00, 0x05, 0x17, 0x05, 0x05
	.byte 0x02, 0x0D, 0x2D, 0x00, 0x05, 0x01, 0x10, 0x08, 0x02, 0x0D, 0x5B, 0x00, 0x05, 0x01, 0x0D, 0x08
	.byte 0x02, 0x0D, 0x6B, 0x00, 0x05, 0x0A, 0x10, 0x03, 0x02, 0x0D, 0x7B, 0x00, 0x05, 0x0A, 0x0D, 0x03
	.byte 0x02, 0x0D, 0x81, 0x00, 0x05, 0x10, 0x08, 0x0F, 0x0A, 0x0D, 0x87, 0x00, 0x05, 0x01, 0x08, 0x0C
	.byte 0x02, 0x0D, 0x1D, 0x01, 0x05, 0x06, 0x0A, 0x08, 0x02, 0x0D, 0x35, 0x01, 0x05, 0x07, 0x14, 0x0C
	.byte 0x03, 0x09, 0x37, 0x00, 0x04, 0x04, 0x05, 0x0B, 0x02, 0x0D, 0x9D, 0x00, 0x04, 0x17, 0x05, 0x05
	.byte 0x02, 0x0D, 0xB7, 0x00, 0x04, 0x0A, 0x10, 0x03, 0x02, 0x0D, 0xE1, 0x00, 0x04, 0x0A, 0x0D, 0x03
	.byte 0x02, 0x0D, 0xE7, 0x00, 0x04, 0x10, 0x08, 0x0F, 0x0A, 0x0D, 0xED, 0x00, 0x04, 0x06, 0x0A, 0x08
	.byte 0x02, 0x0D, 0x9B, 0x01, 0x04, 0x05, 0x01, 0x09, 0x02, 0x0D, 0x8B, 0x00, 0x04, 0x14, 0x05, 0x02
	.byte 0x02, 0x0D, 0xB3, 0x00, 0x04, 0x01, 0x10, 0x08, 0x02, 0x0D, 0xC1, 0x00, 0x04, 0x01, 0x0D, 0x08
	.byte 0x02, 0x0D, 0xD1, 0x00, 0x04, 0x01, 0x08, 0x0C, 0x02, 0x0D, 0x83, 0x01, 0x04, 0x04, 0x05, 0x0B
	.byte 0x02, 0x0D, 0xAB, 0x01, 0x04, 0x17, 0x05, 0x05, 0x02, 0x0D, 0xC1, 0x01, 0x04, 0x0A, 0x10, 0x03
	.byte 0x02, 0x0D, 0xCB, 0x01, 0x04, 0x0A, 0x0D, 0x03, 0x02, 0x0D, 0xD1, 0x01, 0x04, 0x10, 0x08, 0x0F
	.byte 0x0A, 0x0D, 0xD7, 0x01, 0x04, 0x06, 0x0A, 0x08, 0x02, 0x0D, 0x6D, 0x02, 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x25, 0x01, 0x05, 0x01, 0x09, 0x0B, 0x02, 0x0D, 0x49, 0x01, 0x05, 0x01, 0x0B, 0x12
	.byte 0x04, 0x0D, 0x5F, 0x01, 0x05, 0x04, 0x10, 0x0C, 0x02, 0x0D, 0xA7, 0x01, 0x05, 0x18, 0x04, 0x07
	.byte 0x02, 0x0D, 0xBF, 0x01, 0x05, 0x1C, 0x07, 0x03, 0x02, 0x0D, 0xCD, 0x01, 0x05, 0x1C, 0x09, 0x03
	.byte 0x02, 0x0D, 0xD3, 0x01, 0x05, 0x1C, 0x0F, 0x03, 0x02, 0x0D, 0xD9, 0x01, 0x05, 0x1C, 0x0B, 0x03
	.byte 0x02, 0x0D, 0xDF, 0x01, 0x05, 0x1C, 0x0D, 0x03, 0x02, 0x0D, 0xE5, 0x01, 0x05, 0x19, 0x06, 0x06
	.byte 0x01, 0x09, 0xEB, 0x01, 0x05, 0x05, 0x04, 0x03, 0x02, 0x0D, 0xF1, 0x01, 0x05, 0x0D, 0x06, 0x06
	.byte 0x02, 0x0D, 0xF7, 0x01, 0x05, 0x15, 0x04, 0x02, 0x02, 0x0D, 0x85, 0x00, 0x05, 0x15, 0x07, 0x06
	.byte 0x02, 0x0D, 0x89, 0x00, 0x05, 0x15, 0x09, 0x06, 0x02, 0x0D, 0x95, 0x00, 0x05, 0x15, 0x0F, 0x06
	.byte 0x02, 0x0D, 0xA1, 0x00, 0x05, 0x15, 0x0B, 0x06, 0x02, 0x0D, 0xAD, 0x00, 0x05, 0x15, 0x0D, 0x06
	.byte 0x02, 0x0D, 0xB9, 0x00, 0x05, 0x01, 0x04, 0x04, 0x02, 0x0D, 0xC5, 0x00, 0x05, 0x01, 0x06, 0x0B
	.byte 0x02, 0x0D, 0xCD, 0x00, 0x05, 0x0D, 0x14, 0x0B, 0x03, 0x09, 0xE3, 0x00, 0x05, 0x05, 0x01, 0x09
	.byte 0x02, 0x0D, 0x37, 0x01, 0x05, 0x01, 0x09, 0x0B, 0x02, 0x0D, 0x61, 0x02, 0x05, 0x01, 0x0B, 0x12
	.byte 0x04, 0x0D, 0x77, 0x02, 0x05, 0x04, 0x10, 0x0C, 0x02, 0x0D, 0xBF, 0x02, 0x05, 0x18, 0x04, 0x07
	.byte 0x02, 0x0D, 0xD7, 0x02, 0x05, 0x1C, 0x07, 0x03, 0x02, 0x0D, 0xE5, 0x02, 0x05, 0x1C, 0x09, 0x03
	.byte 0x02, 0x0D, 0xEB, 0x02, 0x05, 0x1C, 0x0F, 0x03, 0x02, 0x0D, 0xF1, 0x02, 0x05, 0x1C, 0x0B, 0x03
	.byte 0x02, 0x0D, 0xF7, 0x02, 0x05, 0x1C, 0x0D, 0x03, 0x02, 0x0D, 0xFD, 0x02, 0x05, 0x19, 0x06, 0x06
	.byte 0x01, 0x09, 0x03, 0x03, 0x05, 0x05, 0x04, 0x03, 0x02, 0x0D, 0x09, 0x03, 0x05, 0x0D, 0x06, 0x06
	.byte 0x02, 0x0D, 0x0F, 0x03, 0x18, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x08, 0xA0, 0xC8, 0xB8, 0x01, 0x00, 0x00, 0x02, 0xC0, 0x08, 0xF8, 0x18
	.byte 0x01, 0x82, 0x00, 0x01, 0xE0, 0xA0, 0xF8, 0xB8, 0x01, 0x02, 0x00, 0x02, 0x12, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0xA0, 0x20, 0xB8, 0x00, 0x00, 0x00, 0x01, 0x30, 0xA0, 0x48, 0xB8
	.byte 0x01, 0x01, 0x00, 0x02, 0x68, 0xA0, 0xC0, 0xB8, 0x02, 0x02, 0x01, 0x03, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x03, 0x03, 0x02, 0x03, 0x18, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x10, 0x10, 0xF0, 0x88, 0x00, 0x81, 0x00, 0x00, 0x08, 0xA0, 0x60, 0xB8
	.byte 0x00, 0x01, 0x01, 0x02, 0x70, 0xA0, 0xC8, 0xB8, 0x00, 0x02, 0x01, 0x03, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x00, 0x03, 0x02, 0x03, 0x5C, 0x9D, 0x7C, 0xA5, 0x00, 0x02, 0x00, 0x01, 0x84, 0x9D, 0xA4, 0xA5
	.byte 0x01, 0x03, 0x00, 0x04, 0x5C, 0xAD, 0x7C, 0xB5, 0x00, 0x02, 0x02, 0x03, 0x84, 0xAD, 0xA4, 0xB5
	.byte 0x01, 0x03, 0x02, 0x04, 0xE0, 0xA0, 0xF8, 0xB8, 0x04, 0x04, 0x83, 0x04, 0x94, 0x55, 0x22, 0x02
	.byte 0x74, 0x54, 0x22, 0x02, 0x34, 0x54, 0x22, 0x02, 0x04, 0x56, 0x22, 0x02, 0x94, 0x54, 0x22, 0x02
	.byte 0xE4, 0x54, 0x22, 0x02, 0xCC, 0x55, 0x22, 0x02, 0x04, 0x54, 0x22, 0x02, 0xCC, 0x55, 0x22, 0x02
	.byte 0x04, 0x54, 0x22, 0x02, 0x08, 0x38, 0x78, 0x58, 0x00, 0x02, 0x00, 0x01, 0x88, 0x38, 0xF8, 0x58
	.byte 0x01, 0x03, 0x00, 0x01, 0x08, 0x68, 0x78, 0x88, 0x00, 0x04, 0x02, 0x03, 0x88, 0x68, 0xF8, 0x88
	.byte 0x01, 0x04, 0x02, 0x03, 0xE0, 0xA0, 0xF8, 0xB8, 0x83, 0x04, 0x04, 0x04, 0x18, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00
	.byte 0xB0, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x08, 0x08, 0x78, 0x28, 0x06, 0x02, 0x06, 0x01, 0x88, 0x10, 0xF8, 0x30
	.byte 0x04, 0x03, 0x00, 0x02, 0x08, 0x38, 0x78, 0x58, 0x00, 0x04, 0x01, 0x03, 0x88, 0x40, 0xF8, 0x60
	.byte 0x01, 0x05, 0x02, 0x04, 0x08, 0x68, 0x78, 0x88, 0x02, 0x01, 0x03, 0x05, 0x88, 0x70, 0xF8, 0x90
	.byte 0x03, 0x06, 0x04, 0x06, 0xE0, 0xA0, 0xF8, 0xB8, 0x05, 0x00, 0x05, 0x00, 0x08, 0x38, 0x78, 0x58
	.byte 0x05, 0x02, 0x00, 0x01, 0x88, 0x38, 0xF8, 0x58, 0x05, 0x03, 0x00, 0x01, 0x08, 0x68, 0x78, 0x88
	.byte 0x00, 0x04, 0x02, 0x03, 0x88, 0x68, 0xF8, 0x88, 0x01, 0x06, 0x02, 0x03, 0x48, 0x98, 0xB8, 0xB8
	.byte 0x02, 0x04, 0x04, 0x06, 0xC0, 0x08, 0xF8, 0x18, 0x05, 0x81, 0x00, 0x05, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x03, 0x06, 0x04, 0x06, 0x08, 0x38, 0x78, 0x58, 0x00, 0x02, 0x00, 0x01, 0x88, 0x38, 0xF8, 0x58
	.byte 0x01, 0x03, 0x00, 0x01, 0x08, 0x68, 0x78, 0x88, 0x00, 0x84, 0x02, 0x03, 0x88, 0x68, 0xF8, 0x88
	.byte 0x01, 0x87, 0x02, 0x03, 0x08, 0xA0, 0x20, 0xB8, 0x02, 0x04, 0x04, 0x05, 0x30, 0xA0, 0x48, 0xB8
	.byte 0x02, 0x05, 0x04, 0x06, 0x68, 0xA0, 0xC0, 0xB8, 0x03, 0x06, 0x05, 0x07, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x03, 0x07, 0x06, 0x07, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0C, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00, 0x07, 0xB0, 0x00, 0x00
	.byte 0x07, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0xB0, 0x00, 0x00
	.byte 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x08, 0xB0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0E, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0xB0, 0x00, 0x00
	.byte 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x09, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x17, 0xB0, 0x00, 0x00
	.byte 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00, 0x0B, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0xB0, 0x00, 0x00
	.byte 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x0A, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0xFF, 0x00, 0x00, 0x03, 0xFF, 0x00, 0x00, 0x04, 0xFF, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x00
	.byte 0x01, 0xFF, 0x00, 0x00, 0x0B, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x03, 0xFF, 0x00, 0x00
	.byte 0x05, 0xFF, 0x00, 0x00, 0x02, 0xFF, 0x00, 0x00, 0x06, 0xFF, 0x00, 0x00, 0x04, 0xFF, 0x00, 0x00
	.byte 0x03, 0xFF, 0x00, 0x00, 0x02, 0xFF, 0x00, 0x00, 0x05, 0xFF, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x00
	.byte 0x04, 0xFF, 0x00, 0x00, 0x02, 0xFF, 0x00, 0x00, 0x03, 0xFF, 0x00, 0x00, 0x05, 0xFF, 0x00, 0x00
	.byte 0x15, 0xFF, 0x00, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x07, 0x01, 0xFF, 0x00, 0x02, 0x04, 0x02, 0x00
	.byte 0x08, 0x02, 0xFF, 0x00, 0x09, 0x03, 0xFF, 0x00, 0x0A, 0x04, 0xFF, 0x00, 0x02, 0x03, 0x01, 0x00
	.byte 0x02, 0x00, 0xFC, 0xFF, 0x02, 0x00, 0x02, 0x00, 0xFD, 0xFF, 0x01, 0x00, 0x68, 0x59, 0x22, 0x02
	.byte 0x60, 0x59, 0x22, 0x02, 0x94, 0x59, 0x22, 0x02, 0x6C, 0x59, 0x22, 0x02, 0x58, 0x59, 0x22, 0x02
	.byte 0x70, 0x59, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0xA4, 0x59, 0x22, 0x02, 0x50, 0x59, 0x22, 0x02
	.byte 0x9C, 0x59, 0x22, 0x02, 0x54, 0x59, 0x22, 0x02, 0xA0, 0x59, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xA8, 0x59, 0x22, 0x02, 0xB0, 0x59, 0x22, 0x02, 0xB4, 0x59, 0x22, 0x02
	.byte 0xB8, 0x59, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x8C, 0x59, 0x22, 0x02, 0x84, 0x59, 0x22, 0x02
	.byte 0x80, 0x59, 0x22, 0x02, 0x7C, 0x59, 0x22, 0x02, 0x5C, 0x59, 0x22, 0x02, 0x74, 0x59, 0x22, 0x02
	.byte 0x98, 0x59, 0x22, 0x02, 0x90, 0x59, 0x22, 0x02, 0x88, 0x59, 0x22, 0x02, 0x64, 0x59, 0x22, 0x02
	.byte 0x78, 0x59, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x06, 0x10, 0x01, 0x10, 0x06, 0x00, 0x06, 0x10, 0x06
	.byte 0x10, 0x07, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0D, 0x10, 0x06, 0x1B, 0x13, 0x05, 0x05
	.byte 0x01, 0x01, 0x1E, 0x11, 0x00, 0x13, 0x0D, 0x05, 0x0C, 0x13, 0x0D, 0x05, 0x0D, 0x13, 0x0D, 0x05
	.byte 0x0C, 0x13, 0x0D, 0x05, 0x00, 0x13, 0x05, 0x05, 0x05, 0x13, 0x05, 0x05, 0x00, 0x06, 0x10, 0x06
	.byte 0x10, 0x06, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0C, 0x10, 0x06, 0x17, 0x00, 0x09, 0x04
	.byte 0x00, 0x06, 0x10, 0x06, 0x10, 0x06, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0C, 0x10, 0x06
	.byte 0x00, 0x06, 0x10, 0x06, 0x10, 0x06, 0x10, 0x06, 0x00, 0x0C, 0x10, 0x06, 0x10, 0x0C, 0x10, 0x06
	.byte 0x08, 0x12, 0x10, 0x06, 0x00, 0x13, 0x1A, 0x05, 0x00, 0x13, 0x1A, 0x05, 0x0B, 0x13, 0x05, 0x02
	.byte 0x10, 0x13, 0x05, 0x02, 0x0B, 0x15, 0x05, 0x02, 0x10, 0x15, 0x05, 0x02, 0x98, 0xBF, 0x00, 0xCF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x1A, 0x00, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x4F, 0x00, 0x7F
	.byte 0x50, 0x97, 0x00, 0x7F, 0x08, 0x4F, 0x80, 0xFF, 0x50, 0x97, 0x80, 0xFF, 0x98, 0xBF, 0x00, 0xCF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x08, 0x37, 0x00, 0x7F, 0x08, 0x37, 0x80, 0xFF
	.byte 0x38, 0x67, 0x00, 0x7F, 0x38, 0x67, 0x80, 0xFF, 0x68, 0x97, 0x00, 0x7F, 0x68, 0x97, 0x80, 0xFF
	.byte 0x98, 0xBF, 0xD8, 0xFF, 0x98, 0xBF, 0x00, 0x27, 0x98, 0xBF, 0x28, 0x4F, 0xFF, 0x00, 0x00, 0x00
	.byte 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0F, 0x76, 0x03, 0x05, 0x07, 0x04, 0x0C, 0x02, 0x04, 0xC7, 0x02
	.byte 0x05, 0x14, 0x04, 0x04, 0x02, 0x04, 0xDF, 0x02, 0x05, 0x02, 0x09, 0x1C, 0x06, 0x04, 0xE7, 0x02
	.byte 0x05, 0x08, 0x14, 0x0A, 0x03, 0x00, 0x8F, 0x03, 0x04, 0x02, 0x04, 0x0C, 0x05, 0x00, 0xCE, 0x02
	.byte 0x04, 0x02, 0x0D, 0x0C, 0x05, 0x00, 0x0A, 0x03, 0x04, 0x12, 0x05, 0x0C, 0x03, 0x00, 0x86, 0x02
	.byte 0x04, 0x12, 0x0E, 0x0C, 0x03, 0x00, 0xAA, 0x02, 0x04, 0x05, 0x14, 0x14, 0x03, 0x00, 0x4A, 0x02
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x05, 0x01, 0x01, 0x0E, 0x03, 0x00, 0x01, 0x00, 0x05, 0x08, 0x04, 0x04, 0x03, 0x04, 0x2B, 0x00
	.byte 0x05, 0x11, 0x01, 0x0E, 0x03, 0x00, 0x37, 0x00, 0x05, 0x18, 0x04, 0x04, 0x03, 0x04, 0x61, 0x00
	.byte 0x05, 0x01, 0x07, 0x0E, 0x03, 0x00, 0x6D, 0x00, 0x05, 0x08, 0x0A, 0x04, 0x03, 0x04, 0x97, 0x00
	.byte 0x05, 0x11, 0x07, 0x0E, 0x03, 0x00, 0xA3, 0x00, 0x05, 0x18, 0x0A, 0x04, 0x03, 0x04, 0xCD, 0x00
	.byte 0x05, 0x01, 0x0D, 0x0E, 0x03, 0x00, 0xD9, 0x00, 0x05, 0x08, 0x10, 0x04, 0x03, 0x04, 0x03, 0x01
	.byte 0x05, 0x11, 0x0D, 0x0E, 0x03, 0x00, 0x0F, 0x01, 0x05, 0x18, 0x10, 0x04, 0x03, 0x04, 0x39, 0x01
	.byte 0x05, 0x01, 0x01, 0x0E, 0x03, 0x00, 0x45, 0x01, 0x05, 0x08, 0x04, 0x04, 0x03, 0x04, 0x6F, 0x01
	.byte 0x05, 0x11, 0x01, 0x0E, 0x03, 0x00, 0x7B, 0x01, 0x05, 0x18, 0x04, 0x04, 0x03, 0x04, 0xA5, 0x01
	.byte 0x05, 0x01, 0x07, 0x0E, 0x03, 0x00, 0xB1, 0x01, 0x05, 0x08, 0x0A, 0x04, 0x03, 0x04, 0xDB, 0x01
	.byte 0x05, 0x11, 0x07, 0x0E, 0x03, 0x00, 0xE7, 0x01, 0x05, 0x18, 0x0A, 0x04, 0x03, 0x04, 0x11, 0x02
	.byte 0x05, 0x01, 0x0D, 0x0E, 0x03, 0x00, 0x1D, 0x02, 0x05, 0x08, 0x10, 0x04, 0x03, 0x04, 0x47, 0x02
	.byte 0x05, 0x11, 0x0D, 0x0E, 0x03, 0x00, 0x53, 0x02, 0x05, 0x18, 0x10, 0x04, 0x03, 0x04, 0x7D, 0x02
	.byte 0x05, 0x0B, 0x13, 0x0A, 0x05, 0x04, 0x89, 0x02, 0x05, 0x16, 0x14, 0x04, 0x03, 0x04, 0xBB, 0x02
	.byte 0x02, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0xB2, 0x00, 0x00, 0x00, 0x44, 0x5D, 0x22, 0x02, 0xA4, 0x5D, 0x22, 0x02
	.byte 0x04, 0x5D, 0x22, 0x02, 0x08, 0xA0, 0xC8, 0xB8, 0x00, 0x00, 0x00, 0x01, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x01, 0x01, 0x00, 0x01, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00
	.byte 0x98, 0x00, 0x00, 0x00, 0x08, 0x10, 0x78, 0x48, 0x00, 0x01, 0x00, 0x02, 0x08, 0x58, 0x78, 0x90
	.byte 0x00, 0x04, 0x01, 0x03, 0x88, 0x10, 0xF8, 0x48, 0x02, 0x03, 0x00, 0x02, 0x88, 0x58, 0xF8, 0x90
	.byte 0x02, 0x05, 0x01, 0x03, 0x08, 0xA0, 0xC8, 0xB8, 0x01, 0x04, 0x04, 0x05, 0xE0, 0xA0, 0xF8, 0xB8
	.byte 0x83, 0x05, 0x04, 0x05, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00
	.byte 0x2D, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00
	.byte 0x8D, 0x00, 0x00, 0x00, 0x08, 0x10, 0x78, 0x30, 0x00, 0x02, 0x00, 0x01, 0x88, 0x10, 0xF8, 0x30
	.byte 0x01, 0x03, 0x00, 0x01, 0x08, 0x40, 0x78, 0x60, 0x00, 0x04, 0x02, 0x03, 0x88, 0x40, 0xF8, 0x60
	.byte 0x01, 0x05, 0x02, 0x03, 0x08, 0x70, 0x78, 0x90, 0x02, 0x06, 0x04, 0x05, 0x88, 0x70, 0xF8, 0x90
	.byte 0x03, 0x06, 0x04, 0x05, 0xE0, 0xA0, 0xF8, 0xB8, 0x85, 0x06, 0x06, 0x06, 0xB7, 0xB4, 0x00, 0x00
	.byte 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xB8, 0xB4, 0x00, 0x00, 0xB8, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xB9, 0xB4, 0x00, 0x00, 0xB9, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00
	.byte 0xB7, 0xB4, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBA, 0xB4, 0x00, 0x00, 0xBA, 0xB4, 0x00, 0x00
	.byte 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xBB, 0xB4, 0x00, 0x00
	.byte 0xBB, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xBC, 0xB4, 0x00, 0x00, 0xBC, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00, 0xB7, 0xB4, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x03, 0xFF, 0x00, 0x00, 0x03, 0xFF, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x00
	.byte 0x04, 0xFF, 0x00, 0x00, 0x02, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x0E, 0x0F, 0xFF, 0x00
	.byte 0x10, 0x11, 0xFF, 0x00, 0x16, 0x17, 0xFF, 0x00, 0x06, 0x07, 0xFF, 0x00, 0x04, 0x05, 0xFF, 0x00
	.byte 0x02, 0x03, 0xFF, 0x00, 0x00, 0x01, 0xFF, 0x00, 0x08, 0x09, 0xFF, 0x00, 0x12, 0x13, 0xFF, 0x00
	.byte 0x0A, 0x0B, 0xFF, 0x00, 0x0C, 0x0D, 0xFF, 0x00, 0x14, 0x15, 0xFF, 0x00, 0x00, 0x01, 0x10, 0x09
	.byte 0x00, 0x0A, 0x10, 0x09, 0x10, 0x01, 0x10, 0x09, 0x10, 0x0A, 0x10, 0x09, 0x00, 0x13, 0x1A, 0x05
	.byte 0x1B, 0x13, 0x05, 0x05, 0x20, 0x01, 0x10, 0x06, 0x30, 0x01, 0x10, 0x06, 0x20, 0x07, 0x10, 0x06
	.byte 0x30, 0x07, 0x10, 0x06, 0x20, 0x0D, 0x10, 0x06, 0x30, 0x0D, 0x10, 0x06, 0x20, 0x13, 0x05, 0x05
	.byte 0x25, 0x13, 0x05, 0x05, 0x3B, 0x13, 0x05, 0x05, 0x00, 0x33, 0x1A, 0x05, 0x1B, 0x33, 0x05, 0x05
	.byte 0x68, 0x5E, 0x22, 0x02, 0x5C, 0x5E, 0x22, 0x02, 0x64, 0x5E, 0x22, 0x02, 0x54, 0x5E, 0x22, 0x02
	.byte 0x60, 0x5E, 0x22, 0x02, 0x00, 0x00, 0x00, 0x00, 0x84, 0x5E, 0x22, 0x02, 0x80, 0x5E, 0x22, 0x02
	.byte 0x7C, 0x5E, 0x22, 0x02, 0x78, 0x5E, 0x22, 0x02, 0x88, 0x5E, 0x22, 0x02, 0x90, 0x5E, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x5E, 0x22, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x94, 0x5E, 0x22, 0x02, 0x6C, 0x5E, 0x22, 0x02, 0x70, 0x5E, 0x22, 0x02
	.byte 0x8C, 0x5E, 0x22, 0x02, 0x98, 0x5E, 0x22, 0x02, 0x74, 0x5E, 0x22, 0x02
