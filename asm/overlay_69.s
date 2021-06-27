
	thumb_func_start ov69_021E5900
ov69_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r4, r0, #0
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
	ldr r0, _021E5A08 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5A0C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #3
	movs r1, #0x31
	lsls r2, r2, #7
	bl FUN_0201A910
	ldr r1, _021E5A10 @ =0x0000C33C
	adds r0, r4, #0
	movs r2, #0x31
	bl FUN_02007280
	ldr r2, _021E5A10 @ =0x0000C33C
	movs r1, #0
	adds r5, r0, #0
	blx FUN_020E5B44
	movs r0, #0x31
	str r0, [r5]
	ldr r0, _021E5A14 @ =0x020F5670
	ldrb r0, [r0]
	cmp r0, #1
	bne _021E595E
	movs r1, #1
	b _021E5960
_021E595E:
	movs r1, #0
_021E5960:
	movs r0, #0xc3
	lsls r0, r0, #8
	str r1, [r5, r0]
	adds r0, r4, #0
	bl FUN_020072A4
	adds r4, r0, #0
	bl FUN_0202CA44
	str r0, [r5, #4]
	bl FUN_0202CA8C
	ldr r1, _021E5A18 @ =0x0000C324
	str r0, [r5, r1]
	ldr r0, [r5, #4]
	bl FUN_0202CA90
	ldr r1, _021E5A1C @ =0x0000C328
	str r0, [r5, r1]
	ldr r0, [r5, #4]
	bl FUN_0202CB5C
	ldr r1, _021E5A20 @ =0x0000C334
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_02028EA8
	str r0, [r5, #8]
	bl ov69_021E60F8
	bl ov69_021E6118
	ldr r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0201F590
	ldr r0, [r5]
	bl FUN_0201AC88
	ldr r1, _021E5A24 @ =0x0000C010
	str r0, [r5, r1]
	bl FUN_02022D24
	bl FUN_02020080
	ldr r2, [r5]
	movs r0, #8
	movs r1, #0x40
	bl FUN_0200BD18
	ldr r1, _021E5A28 @ =0x0000C080
	str r0, [r5, r1]
	ldr r0, [r5]
	bl FUN_02023114
	ldr r1, _021E5A2C @ =0x0000C2DC
	str r0, [r5, r1]
	movs r0, #0
	adds r1, #0x1c
	str r0, [r5, r1]
	ldr r0, _021E5A30 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	movs r0, #1
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	adds r0, r5, #0
	bl ov69_021E6138
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5A08: .4byte 0xFFFFE0FF
_021E5A0C: .4byte 0x04001000
_021E5A10: .4byte 0x0000C33C
_021E5A14: .4byte 0x020F5670
_021E5A18: .4byte 0x0000C324
_021E5A1C: .4byte 0x0000C328
_021E5A20: .4byte 0x0000C334
_021E5A24: .4byte 0x0000C010
_021E5A28: .4byte 0x0000C080
_021E5A2C: .4byte 0x0000C2DC
_021E5A30: .4byte 0x021D116C
	thumb_func_end ov69_021E5900

	thumb_func_start ov69_021E5A34
ov69_021E5A34: @ 0x021E5A34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	cmp r0, #0xe
	beq _021E5A60
	cmp r0, #0xf
	beq _021E5A60
	cmp r0, #0x10
	beq _021E5A60
	bl FUN_02025358
	cmp r0, #0
	beq _021E5A60
	ldr r0, _021E5D7C @ =0x021D110C
	movs r1, #1
	str r1, [r0, #0x5c]
_021E5A60:
	ldr r0, [r5]
	cmp r0, #0x12
	bls _021E5A68
	b _021E6028
_021E5A68:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5A74: @ jump table
	.2byte _021E5A9A - _021E5A74 - 2 @ case 0
	.2byte _021E5B0A - _021E5A74 - 2 @ case 1
	.2byte _021E5B18 - _021E5A74 - 2 @ case 2
	.2byte _021E5B3A - _021E5A74 - 2 @ case 3
	.2byte _021E5B60 - _021E5A74 - 2 @ case 4
	.2byte _021E5BAC - _021E5A74 - 2 @ case 5
	.2byte _021E5BD6 - _021E5A74 - 2 @ case 6
	.2byte _021E5C10 - _021E5A74 - 2 @ case 7
	.2byte _021E5C4C - _021E5A74 - 2 @ case 8
	.2byte _021E5CA8 - _021E5A74 - 2 @ case 9
	.2byte _021E5CF8 - _021E5A74 - 2 @ case 10
	.2byte _021E5D54 - _021E5A74 - 2 @ case 11
	.2byte _021E5D68 - _021E5A74 - 2 @ case 12
	.2byte _021E5DE0 - _021E5A74 - 2 @ case 13
	.2byte _021E5E30 - _021E5A74 - 2 @ case 14
	.2byte _021E5EB4 - _021E5A74 - 2 @ case 15
	.2byte _021E5FCC - _021E5A74 - 2 @ case 16
	.2byte _021E5FDC - _021E5A74 - 2 @ case 17
	.2byte _021E5FFE - _021E5A74 - 2 @ case 18
_021E5A9A:
	ldr r3, [r4]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xba
	bl FUN_0200BAF8
	ldr r1, _021E5D80 @ =0x0000C070
	str r0, [r4, r1]
	ldr r1, [r4]
	movs r0, #0x7b
	bl FUN_02007688
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov69_021E6E88
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov69_021E64CC
	adds r0, r6, #0
	bl FUN_0200770C
	movs r0, #0
	ldr r1, _021E5D84 @ =0x0000C2FC
	adds r3, r0, #0
	str r0, [r4, r1]
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r2, [r4]
	str r2, [sp, #8]
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #1
	str r0, [r5]
	b _021E6028
_021E5B0A:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5BEC
	movs r0, #2
	str r0, [r5]
	b _021E6028
_021E5B18:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5BEC
	ldr r0, _021E5D88 @ =0x0000C324
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E5B34
	movs r0, #3
	str r0, [r5]
	b _021E6028
_021E5B34:
	movs r0, #0xe
	str r0, [r5]
	b _021E6028
_021E5B3A:
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5BEC
	ldr r0, _021E5D8C @ =0x021E7698
	ldr r1, _021E5D90 @ =0x0000C024
	str r0, [sp]
	ldr r2, _021E5D94 @ =_021E7644
	ldr r3, _021E5D98 @ =0x021E76E8
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov69_021E68EC
	movs r0, #4
	str r0, [r5]
	b _021E6028
_021E5B60:
	ldr r0, _021E5D9C @ =0x0000C064
	ldr r0, [r4, r0]
	bl FUN_02001338
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021E5BEC
	adds r0, r4, #0
	bl ov69_021E6A54
	ldr r0, _021E5DA0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r6, #2
	cmp r0, #4
	bhi _021E5B9A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5B90: @ jump table
	.2byte _021E5BA6 - _021E5B90 - 2 @ case 0
	.2byte _021E5B9A - _021E5B90 - 2 @ case 1
	.2byte _021E5B9A - _021E5B90 - 2 @ case 2
	.2byte _021E5BA0 - _021E5B90 - 2 @ case 3
	.2byte _021E5BA6 - _021E5B90 - 2 @ case 4
_021E5B9A:
	movs r0, #0xe
	str r0, [r5]
	b _021E6028
_021E5BA0:
	movs r0, #5
	str r0, [r5]
	b _021E6028
_021E5BA6:
	movs r0, #0x11
	str r0, [r5]
	b _021E6028
_021E5BAC:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5BEC
	ldr r0, [r4]
	ldr r1, _021E5DA4 @ =0x021E7664
	str r0, [sp]
	ldr r0, _021E5DA8 @ =0x0000C010
	ldr r2, _021E5DAC @ =0x000001D9
	ldr r0, [r4, r0]
	movs r3, #7
	bl FUN_02001FC8
	ldr r1, _021E5DB0 @ =0x0000C06C
	str r0, [r4, r1]
	movs r0, #6
	str r0, [r5]
	b _021E6028
_021E5BD6:
	ldr r0, _021E5DB0 @ =0x0000C06C
	ldr r1, [r4]
	ldr r0, [r4, r0]
	bl FUN_02001FDC
	cmp r0, #0
	beq _021E5BEE
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _021E5C0A
_021E5BEC:
	b _021E6028
_021E5BEE:
	movs r0, #0xc3
	lsls r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _021E5C04
	movs r1, #0x67
	adds r0, #0x2c
	str r1, [r4, r0]
	movs r0, #9
	str r0, [r5]
	b _021E6028
_021E5C04:
	movs r0, #7
	str r0, [r5]
	b _021E6028
_021E5C0A:
	movs r0, #3
	str r0, [r5]
	b _021E6028
_021E5C10:
	adds r0, r4, #0
	movs r1, #3
	movs r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5CB6
	ldr r1, _021E5DB4 @ =0x0000C32C
	movs r0, #0
	str r0, [r4, r1]
	bl FUN_02091714
	adds r6, r0, #0
	movs r0, #0
	bl FUN_02091730
	ldr r1, _021E5DB8 @ =0x0000031E
	ldr r2, _021E5DBC @ =0x021E7674
	str r1, [sp]
	ldr r1, _021E5D90 @ =0x0000C024
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r3, _021E5DC0 @ =0x021E7708
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov69_021E6994
	movs r0, #8
	str r0, [r5]
	b _021E6028
_021E5C4C:
	ldr r0, _021E5D9C @ =0x0000C064
	ldr r0, [r4, r0]
	bl FUN_02001338
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021E5CB6
	adds r0, r4, #0
	bl ov69_021E6A54
	ldr r0, _021E5DA0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	cmp r6, r0
	beq _021E5C7A
	movs r0, #0
	bl FUN_02091714
	ldrb r6, [r0, r6]
_021E5C7A:
	movs r0, #1
	mvns r0, r0
	cmp r6, r0
	beq _021E5CA2
	ldr r0, _021E5DB4 @ =0x0000C32C
	str r6, [r4, r0]
	ldr r0, [r4, r0]
	bl ov69_021E758C
	cmp r0, #1
	bne _021E5C96
	movs r0, #9
	str r0, [r5]
	b _021E6028
_021E5C96:
	ldr r0, _021E5DC4 @ =0x0000C330
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #0xb
	str r0, [r5]
	b _021E6028
_021E5CA2:
	movs r0, #3
	str r0, [r5]
	b _021E6028
_021E5CA8:
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	bl ov69_021E6810
	cmp r0, #1
	beq _021E5CB8
_021E5CB6:
	b _021E6028
_021E5CB8:
	ldr r0, _021E5DC4 @ =0x0000C330
	movs r1, #0
	str r1, [r4, r0]
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02091668
	adds r6, r0, #0
	bl FUN_020916C0
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_02091714
	str r0, [sp, #0x10]
	adds r0, r6, #0
	bl FUN_02091730
	ldr r1, [sp, #0x10]
	str r7, [sp]
	str r1, [sp, #4]
	ldr r1, _021E5D90 @ =0x0000C024
	str r0, [sp, #8]
	ldr r2, _021E5DBC @ =0x021E7674
	ldr r3, _021E5DC0 @ =0x021E7708
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov69_021E6994
	movs r0, #0xa
	str r0, [r5]
	b _021E6028
_021E5CF8:
	ldr r0, _021E5D9C @ =0x0000C064
	ldr r0, [r4, r0]
	bl FUN_02001338
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021E5DF6
	adds r0, r4, #0
	bl ov69_021E6A54
	ldr r0, _021E5DA0 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	cmp r6, r0
	beq _021E5D2C
	ldr r0, _021E5DB4 @ =0x0000C32C
	ldr r0, [r4, r0]
	bl FUN_02091668
	bl FUN_02091714
	ldrb r6, [r0, r6]
_021E5D2C:
	movs r0, #1
	mvns r0, r0
	cmp r6, r0
	beq _021E5D3E
	ldr r0, _021E5DC4 @ =0x0000C330
	str r6, [r4, r0]
	movs r0, #0xb
	str r0, [r5]
	b _021E6028
_021E5D3E:
	movs r0, #0xc3
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E5D4E
	movs r0, #3
	str r0, [r5]
	b _021E6028
_021E5D4E:
	movs r0, #7
	str r0, [r5]
	b _021E6028
_021E5D54:
	ldr r2, _021E5DB4 @ =0x0000C32C
	adds r0, r4, #0
	ldr r1, [r4, r2]
	adds r2, r2, #4
	ldr r2, [r4, r2]
	bl ov69_021E6B5C
	movs r0, #0xc
	str r0, [r5]
	b _021E6028
_021E5D68:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5DF6
	ldr r0, [r4]
	ldr r1, _021E5DA4 @ =0x021E7664
	b _021E5DC8
	.align 2, 0
_021E5D7C: .4byte 0x021D110C
_021E5D80: .4byte 0x0000C070
_021E5D84: .4byte 0x0000C2FC
_021E5D88: .4byte 0x0000C324
_021E5D8C: .4byte 0x021E7698
_021E5D90: .4byte 0x0000C024
_021E5D94: .4byte _021E7644
_021E5D98: .4byte 0x021E76E8
_021E5D9C: .4byte 0x0000C064
_021E5DA0: .4byte 0x000005DC
_021E5DA4: .4byte 0x021E7664
_021E5DA8: .4byte 0x0000C010
_021E5DAC: .4byte 0x000001D9
_021E5DB0: .4byte 0x0000C06C
_021E5DB4: .4byte 0x0000C32C
_021E5DB8: .4byte 0x0000031E
_021E5DBC: .4byte 0x021E7674
_021E5DC0: .4byte 0x021E7708
_021E5DC4: .4byte 0x0000C330
_021E5DC8:
	str r0, [sp]
	ldr r0, _021E6034 @ =0x0000C010
	ldr r2, _021E6038 @ =0x000001D9
	ldr r0, [r4, r0]
	movs r3, #7
	bl FUN_02001FC8
	ldr r1, _021E603C @ =0x0000C06C
	str r0, [r4, r1]
	movs r0, #0xd
	str r0, [r5]
	b _021E6028
_021E5DE0:
	ldr r0, _021E603C @ =0x0000C06C
	ldr r1, [r4]
	ldr r0, [r4, r0]
	bl FUN_02001FDC
	cmp r0, #0
	beq _021E5DF8
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _021E5E24
_021E5DF6:
	b _021E6028
_021E5DF8:
	adds r0, r4, #0
	bl ov69_021E6C14
	ldr r2, _021E6040 @ =0x0000C32C
	ldr r0, [r4, #4]
	ldr r1, [r4, r2]
	adds r2, r2, #4
	ldr r2, [r4, r2]
	bl FUN_0202CA58
	ldr r0, _021E6040 @ =0x0000C32C
	adds r1, r0, #0
	ldr r2, [r4, r0]
	subs r1, #8
	str r2, [r4, r1]
	adds r1, r0, #4
	ldr r1, [r4, r1]
	subs r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0xe
	str r0, [r5]
	b _021E6028
_021E5E24:
	adds r0, r4, #0
	bl ov69_021E6C14
	movs r0, #3
	str r0, [r5]
	b _021E6028
_021E5E30:
	movs r1, #0xc3
	lsls r1, r1, #8
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _021E5E4C
	adds r0, r1, #0
	adds r0, #0x34
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E5E4C
	movs r2, #0
	adds r0, r1, #4
	strh r2, [r4, r0]
	b _021E5E52
_021E5E4C:
	ldr r0, _021E6044 @ =0x0000C304
	movs r1, #1
	strh r1, [r4, r0]
_021E5E52:
	adds r0, r4, #0
	bl ov69_021E6F8C
	adds r0, r4, #0
	bl ov69_021E62B0
	adds r0, r4, #0
	bl ov69_021E6FE8
	adds r0, r4, #0
	bl ov69_021E706C
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E6048 @ =0x0000C014
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E604C @ =0x0000C034
	ldr r2, _021E6038 @ =0x000001D9
	adds r0, r4, r0
	movs r1, #0
	movs r3, #7
	bl FUN_0200E580
	ldr r0, _021E6050 @ =0x0000C324
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5E9C
	adds r0, r4, #0
	bl ov69_021E6A8C
_021E5E9C:
	adds r0, r4, #0
	bl ov69_021E6D5C
	ldr r0, _021E6054 @ =0x0000C338
	movs r1, #0
	str r1, [r4, r0]
	movs r1, #1
	subs r0, #0x40
	str r1, [r4, r0]
	movs r0, #0xf
	str r0, [r5]
	b _021E6028
_021E5EB4:
	ldr r0, _021E6058 @ =0x0000C2E8
	ldrh r6, [r4, r0]
	adds r0, r4, #0
	bl ov69_021E6308
	adds r0, r4, #0
	add r1, sp, #0x14
	bl ov69_021E6C30
	cmp r0, #0
	ldr r0, _021E605C @ =0x0000C044
	beq _021E5EDA
	ldr r2, _021E6038 @ =0x000001D9
	adds r0, r4, r0
	movs r1, #0
	movs r3, #7
	bl FUN_0200E580
	b _021E5EE2
_021E5EDA:
	adds r0, r4, r0
	movs r1, #0
	bl FUN_0200E5D4
_021E5EE2:
	ldr r0, _021E6060 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	adds r2, r1, #0
	tst r2, r0
	bne _021E5EF8
	ldr r2, _021E6064 @ =0x0000C308
	ldr r2, [r4, r2]
	adds r3, r2, #0
	tst r3, r0
	beq _021E5F48
_021E5EF8:
	ldr r0, _021E604C @ =0x0000C034
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E5D4
	ldr r0, _021E605C @ =0x0000C044
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E5D4
	ldr r0, _021E6068 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E6048 @ =0x0000C014
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E6050 @ =0x0000C324
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _021E5F3C
	movs r1, #2
	subs r0, #0x2c
	str r1, [r4, r0]
	movs r0, #3
	str r0, [r5]
	b _021E6028
_021E5F3C:
	adds r0, r4, #0
	bl ov69_021E6C14
	movs r0, #0x11
	str r0, [r5]
	b _021E6028
_021E5F48:
	lsls r3, r0, #9
	tst r3, r1
	bne _021E5F54
	lsls r0, r0, #9
	tst r0, r2
	beq _021E5F76
_021E5F54:
	ldr r0, _021E6054 @ =0x0000C338
	ldr r3, [r4, r0]
	cmp r3, #0
	bne _021E5F76
	movs r1, #1
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov69_021E6D5C
	ldr r0, _021E6054 @ =0x0000C338
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E6028
	ldr r0, _021E6068 @ =0x000005DD
	bl FUN_0200604C
	b _021E6028
_021E5F76:
	ldr r0, _021E606C @ =0x00000403
	adds r3, r1, #0
	tst r3, r0
	bne _021E5F84
	subs r0, r0, #3
	tst r0, r2
	beq _021E5F98
_021E5F84:
	ldr r0, _021E6054 @ =0x0000C338
	ldr r2, [r4, r0]
	cmp r2, #1
	bne _021E5F98
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov69_021E6D5C
	b _021E6028
_021E5F98:
	ldr r2, _021E6060 @ =0x021D110C
	adds r0, r4, #0
	ldr r2, [r2, #0x44]
	bl ov69_021E7198
	cmp r0, #1
	bne _021E5FB8
	ldr r0, _021E6054 @ =0x0000C338
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _021E5FB8
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov69_021E6D5C
_021E5FB8:
	ldr r0, _021E6058 @ =0x0000C2E8
	ldrh r0, [r4, r0]
	cmp r6, r0
	beq _021E6028
	movs r0, #0x10
	str r0, [r5]
	ldr r0, _021E6070 @ =0x000005D9
	bl FUN_0200604C
	b _021E6028
_021E5FCC:
	adds r0, r4, #0
	bl ov69_021E737C
	cmp r0, #1
	bne _021E6028
	movs r0, #0xf
	str r0, [r5]
	b _021E6028
_021E5FDC:
	ldr r1, _021E6074 @ =0x0000C2FC
	movs r0, #0
	str r0, [r4, r1]
	movs r1, #6
	str r1, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r1, [r4]
	adds r2, r0, #0
	str r1, [sp, #8]
	adds r1, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x12
	str r0, [r5]
	b _021E6028
_021E5FFE:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E6028
	ldr r0, _021E6078 @ =0x0000C2F8
	movs r1, #1
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov69_021E67B8
	adds r0, r4, #0
	bl ov69_021E6F48
	ldr r0, _021E607C @ =0x0000C070
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0
	str r0, [r5]
	movs r0, #1
	str r0, [sp, #0xc]
_021E6028:
	adds r0, r4, #0
	bl ov69_021E7408
	ldr r0, [sp, #0xc]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6034: .4byte 0x0000C010
_021E6038: .4byte 0x000001D9
_021E603C: .4byte 0x0000C06C
_021E6040: .4byte 0x0000C32C
_021E6044: .4byte 0x0000C304
_021E6048: .4byte 0x0000C014
_021E604C: .4byte 0x0000C034
_021E6050: .4byte 0x0000C324
_021E6054: .4byte 0x0000C338
_021E6058: .4byte 0x0000C2E8
_021E605C: .4byte 0x0000C044
_021E6060: .4byte 0x021D110C
_021E6064: .4byte 0x0000C308
_021E6068: .4byte 0x000005DD
_021E606C: .4byte 0x00000403
_021E6070: .4byte 0x000005D9
_021E6074: .4byte 0x0000C2FC
_021E6078: .4byte 0x0000C2F8
_021E607C: .4byte 0x0000C070
	thumb_func_end ov69_021E5A34

	thumb_func_start ov69_021E6080
ov69_021E6080: @ 0x021E6080
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	movs r0, #4
	movs r1, #0
	ldr r5, [r4]
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	ldr r0, _021E60E8 @ =0x0000C2DC
	ldr r0, [r4, r0]
	bl FUN_02023120
	ldr r0, _021E60EC @ =0x0000C080
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	bl FUN_0201F63C
	ldr r0, _021E60F0 @ =0x0000C010
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	bl FUN_02007294
	adds r0, r5, #0
	bl FUN_0201A9C4
	ldr r0, _021E60F4 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E60E8: .4byte 0x0000C2DC
_021E60EC: .4byte 0x0000C080
_021E60F0: .4byte 0x0000C010
_021E60F4: .4byte 0x021D116C
	thumb_func_end ov69_021E6080

	thumb_func_start ov69_021E60F8
ov69_021E60F8: @ 0x021E60F8
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6114 @ =0x021E77B8
	add r3, sp, #0
	movs r2, #5
_021E6102:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6102
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E6114: .4byte 0x021E77B8
	thumb_func_end ov69_021E60F8

	thumb_func_start ov69_021E6118
ov69_021E6118: @ 0x021E6118
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E6134 @ =0x021E7688
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E6134: .4byte 0x021E7688
	thumb_func_end ov69_021E6118

	thumb_func_start ov69_021E6138
ov69_021E6138: @ 0x021E6138
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	movs r0, #0x62
	ldr r1, [r1]
	bl FUN_02007688
	ldr r1, [sp, #8]
	movs r2, #0
	str r2, [r1, #0xc]
	str r2, [sp]
	add r1, sp, #0x24
	str r1, [sp, #4]
	ldr r3, [sp, #8]
	movs r1, #0x12
	ldr r3, [r3]
	str r0, [sp, #0x1c]
	bl FUN_02007CAC
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	movs r1, #6
	blx FUN_020F2BA4
	adds r7, r0, #0
	ldr r0, [sp, #0x18]
	movs r5, #1
	adds r4, r0, #6
	cmp r7, #1
	ble _021E61AA
	ldr r6, [sp, #8]
	adds r6, #0xc
_021E617A:
	ldrh r0, [r4]
	cmp r0, #2
	beq _021E61A2
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	movs r2, #2
	movs r3, #4
	adds r1, r0, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov69_021E623C
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_021E61A2:
	adds r5, r5, #1
	adds r4, r4, #6
	cmp r5, r7
	blt _021E617A
_021E61AA:
	ldr r0, [sp, #0x18]
	bl FUN_0201AB0C
	movs r7, #1
	bl FUN_02091664
	str r0, [sp, #0x10]
	cmp r0, #1
	ble _021E6232
	ldr r6, [sp, #8]
	adds r6, #0xc
_021E61C0:
	adds r0, r7, #0
	bl FUN_020916F8
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	ldr r0, [sp, #0x1c]
	ldr r3, [r3]
	movs r2, #0
	bl FUN_02007CAC
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	movs r5, #1
	lsrs r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	adds r4, r0, #4
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _021E6224
_021E61F0:
	adds r0, r7, #0
	bl FUN_020916DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	movs r2, #0
	movs r3, #2
	adds r1, r0, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov69_021E623C
	ldr r0, [r6]
	adds r5, r5, #1
	adds r0, r0, #1
	str r0, [r6]
	ldr r0, [sp, #0xc]
	adds r4, r4, #4
	cmp r5, r0
	blt _021E61F0
_021E6224:
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x10]
	adds r7, r7, #1
	cmp r7, r0
	blt _021E61C0
_021E6232:
	ldr r0, [sp, #0x1c]
	bl FUN_0200770C
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov69_021E6138

	thumb_func_start ov69_021E623C
ov69_021E623C: @ 0x021E623C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r5, _021E62AC @ =0x021E7770
	adds r7, r2, #0
	adds r6, r3, #0
	adds r4, r0, #0
	mov ip, r1
	add r3, sp, #0xc
	movs r2, #4
_021E624E:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E624E
	ldr r0, [r5]
	movs r1, #0x30
	str r0, [r3]
	mov r0, ip
	adds r5, r0, #0
	muls r5, r1, r5
	adds r0, r4, r5
	strh r7, [r0, #0x10]
	strh r6, [r0, #0x12]
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r1, sp, #0
	str r7, [sp]
	str r6, [sp, #4]
	bl ov69_021E7120
	adds r3, r4, r5
	add r6, sp, #0xc
	adds r3, #0x14
	movs r2, #4
_021E6280:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6280
	ldr r0, [r6]
	add r2, sp, #0x38
	str r0, [r3]
	ldrh r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	ldr r0, [r4, #4]
	bl FUN_0202CA94
	adds r2, r4, r5
	strh r0, [r2, #0x38]
	add r0, sp, #0x38
	ldrh r1, [r0, #0x10]
	strh r1, [r2, #0x3a]
	ldrh r0, [r0, #0x14]
	strh r0, [r2, #0x3c]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E62AC: .4byte 0x021E7770
	thumb_func_end ov69_021E623C

	thumb_func_start ov69_021E62B0
ov69_021E62B0: @ 0x021E62B0
	push {r4, r5, r6, r7}
	ldr r1, [r0, #0xc]
	movs r4, #0
	cmp r1, #0
	bls _021E62EE
	ldr r1, _021E62F4 @ =0x0000C328
	adds r5, r0, #0
	movs r3, #3
	subs r2, r1, #4
_021E62C2:
	ldrh r6, [r5, #0x3a]
	ldr r7, [r0, r2]
	cmp r7, r6
	bne _021E62E4
	ldrh r6, [r5, #0x3c]
	ldr r7, [r0, r1]
	cmp r7, r6
	bne _021E62E4
	strh r3, [r5, #0x38]
	movs r6, #0x10
	ldrsh r7, [r5, r6]
	ldr r6, _021E62F8 @ =0x0000C2C4
	str r7, [r0, r6]
	movs r6, #0x12
	ldrsh r7, [r5, r6]
	ldr r6, _021E62FC @ =0x0000C2C8
	str r7, [r0, r6]
_021E62E4:
	ldr r6, [r0, #0xc]
	adds r4, r4, #1
	adds r5, #0x30
	cmp r4, r6
	blo _021E62C2
_021E62EE:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_021E62F4: .4byte 0x0000C328
_021E62F8: .4byte 0x0000C2C4
_021E62FC: .4byte 0x0000C2C8
	thumb_func_end ov69_021E62B0

	thumb_func_start ov69_021E6300
ov69_021E6300: @ 0x021E6300
	ldr r3, _021E6304 @ =FUN_02091668
	bx r3
	.align 2, 0
_021E6304: .4byte FUN_02091668
	thumb_func_end ov69_021E6300

	thumb_func_start ov69_021E6308
ov69_021E6308: @ 0x021E6308
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r0, _021E6448 @ =0x0000C308
	movs r3, #0
	ldr r1, _021E644C @ =0x021D114C
	str r3, [r4, r0]
	ldrh r2, [r1, #0x20]
	cmp r2, #0xc0
	blo _021E6332
	movs r0, #1
	lsls r0, r0, #8
	cmp r2, r0
	bhi _021E6332
	ldrh r0, [r1, #0x22]
	cmp r0, #0xa0
	blo _021E6332
	cmp r0, #0xb8
	bhi _021E6332
	movs r3, #2
	b _021E6346
_021E6332:
	cmp r2, #0x40
	bhi _021E6346
	ldr r0, _021E644C @ =0x021D114C
	ldrh r0, [r0, #0x22]
	cmp r0, #0xa0
	blo _021E6346
	cmp r0, #0xb8
	bhi _021E6346
	movs r3, #1
	lsls r3, r3, #0xa
_021E6346:
	ldr r1, _021E644C @ =0x021D114C
	ldrh r0, [r1, #0x24]
	cmp r0, #0
	beq _021E638A
	cmp r3, #0
	beq _021E635A
	ldr r0, _021E6448 @ =0x0000C308
	add sp, #0x18
	str r3, [r4, r0]
	pop {r3, r4, r5, pc}
_021E635A:
	ldr r0, _021E6450 @ =0x0000C30C
	movs r2, #0
	adds r5, r0, #0
	str r2, [r4, r0]
	adds r5, #0xc
	str r2, [r4, r5]
	adds r5, r0, #0
	adds r5, #0x10
	str r2, [r4, r5]
	adds r5, r0, #0
	adds r5, #0x14
	str r2, [r4, r5]
	subs r5, r0, #4
	str r2, [r4, r5]
	ldrh r5, [r1, #0x20]
	adds r2, r0, #4
	str r5, [r4, r2]
	ldrh r2, [r1, #0x22]
	adds r1, r0, #0
	adds r1, #8
	str r2, [r4, r1]
	movs r1, #4
	adds r0, #0x14
	str r1, [r4, r0]
_021E638A:
	ldr r0, _021E644C @ =0x021D114C
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _021E6408
	ldr r1, _021E6450 @ =0x0000C30C
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _021E63A2
	cmp r2, #1
	beq _021E63BE
	add sp, #0x18
	pop {r3, r4, r5, pc}
_021E63A2:
	adds r0, r1, #0
	adds r0, #0x14
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E63B2
	adds r0, r2, #1
	str r0, [r4, r1]
	b _021E63BE
_021E63B2:
	adds r0, r1, #0
	adds r0, #0x14
	ldr r0, [r4, r0]
	adds r1, #0x14
	subs r0, r0, #1
	str r0, [r4, r1]
_021E63BE:
	cmp r3, #0
	bne _021E6442
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	ldr r1, _021E6454 @ =0x0000C310
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl ov69_021E645C
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	orrs r0, r1
	ldr r1, _021E6448 @ =0x0000C308
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r2, [sp, #0x10]
	adds r0, #0x10
	str r2, [r4, r0]
	ldr r2, [sp, #8]
	adds r0, r1, #0
	adds r0, #0x14
	str r2, [r4, r0]
	adds r0, r1, #0
	ldr r2, _021E644C @ =0x021D114C
	adds r0, #8
	ldrh r3, [r2, #0x20]
	adds r1, #0xc
	add sp, #0x18
	str r3, [r4, r0]
	ldrh r0, [r2, #0x22]
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
_021E6408:
	cmp r3, #0
	bne _021E642C
	ldr r1, _021E6458 @ =0x0000C320
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _021E642C
	adds r0, r1, #0
	subs r0, #8
	ldr r0, [r4, r0]
	cmp r0, #4
	bge _021E642C
	subs r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #4
	bge _021E642C
	movs r0, #1
	subs r1, #0x18
	str r0, [r4, r1]
_021E642C:
	ldr r1, _021E6450 @ =0x0000C30C
	movs r2, #0
	adds r0, r1, #0
	str r2, [r4, r1]
	adds r0, #0xc
	str r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x10
	str r2, [r4, r0]
	adds r1, #0x14
	str r2, [r4, r1]
_021E6442:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E6448: .4byte 0x0000C308
_021E644C: .4byte 0x021D114C
_021E6450: .4byte 0x0000C30C
_021E6454: .4byte 0x0000C310
_021E6458: .4byte 0x0000C320
	thumb_func_end ov69_021E6308

	thumb_func_start ov69_021E645C
ov69_021E645C: @ 0x021E645C
	push {r3, r4, r5, r6, r7, lr}
	mov lr, r0
	ldr r0, _021E64C4 @ =0x021D114C
	mov ip, r1
	ldrh r5, [r0, #0x20]
	movs r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r0, _021E64C8 @ =0x0000FFFF
	adds r2, r1, #0
	adds r3, r1, #0
	adds r4, r1, #0
	cmp r5, r0
	beq _021E648C
	mov r0, lr
	subs r3, r5, r0
	bpl _021E6486
	subs r0, r1, #1
	eors r3, r0
	movs r1, #0x10
	b _021E648C
_021E6486:
	cmp r3, #0
	ble _021E648C
	movs r1, #0x20
_021E648C:
	str r1, [r7]
	movs r1, #0x3f
	adds r0, r3, #0
	ands r0, r1
	str r0, [r6]
	ldr r0, _021E64C4 @ =0x021D114C
	ldrh r3, [r0, #0x22]
	ldr r0, _021E64C8 @ =0x0000FFFF
	cmp r3, r0
	beq _021E64B4
	mov r0, ip
	subs r4, r3, r0
	bpl _021E64AE
	subs r1, #0x40
	eors r4, r1
	movs r2, #0x80
	b _021E64B4
_021E64AE:
	cmp r4, #0
	ble _021E64B4
	movs r2, #0x40
_021E64B4:
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	str r2, [r0]
	movs r0, #0x3f
	ands r1, r0
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E64C4: .4byte 0x021D114C
_021E64C8: .4byte 0x0000FFFF
	thumb_func_end ov69_021E645C

	thumb_func_start ov69_021E64CC
ov69_021E64CC: @ 0x021E64CC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r0, _021E676C @ =0x0000C010
	ldr r2, _021E6770 @ =0x021E76B0
	adds r5, r1, #0
	ldr r0, [r4, r0]
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, _021E676C @ =0x0000C010
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r0, _021E676C @ =0x0000C010
	ldr r2, _021E6774 @ =0x021E76CC
	ldr r0, [r4, r0]
	movs r1, #7
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E676C @ =0x0000C010
	str r0, [sp, #0xc]
	ldr r2, [r4, r2]
	adds r0, r5, #0
	movs r1, #5
	movs r3, #7
	bl FUN_02007B44
	movs r0, #0x80
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #6
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #7
	str r0, [sp, #0xc]
	ldr r2, _021E676C @ =0x0000C010
	adds r0, r5, #0
	ldr r2, [r4, r2]
	adds r3, r1, #0
	bl FUN_02007B68
	ldr r0, [r4, #8]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	movs r1, #6
	str r0, [sp, #4]
	ldr r0, _021E676C @ =0x0000C010
	ldr r2, _021E6778 @ =0x000001E2
	ldr r0, [r4, r0]
	adds r3, r1, #0
	bl FUN_0200E644
	movs r0, #0
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, _021E677C @ =0x000001D9
	str r0, [sp, #4]
	ldr r0, _021E676C @ =0x0000C010
	movs r1, #6
	ldr r0, [r4, r0]
	movs r3, #7
	bl FUN_0200E3DC
	ldr r2, [r4]
	movs r0, #4
	movs r1, #0x80
	bl FUN_02003030
	ldr r3, [r4]
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r1, _021E6780 @ =0x00004753
	movs r0, #6
	bl FUN_0201C2D8
	ldr r1, _021E676C @ =0x0000C010
	ldr r2, _021E6784 @ =0x021E766C
	ldr r0, [r4, r1]
	adds r1, r1, #4
	adds r1, r4, r1
	bl FUN_0201D4F8
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E6788 @ =0x0000C014
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E6788 @ =0x0000C014
	ldr r2, _021E6778 @ =0x000001E2
	adds r0, r4, r0
	movs r1, #0
	movs r3, #6
	bl FUN_0200E998
	ldr r0, _021E678C @ =0x0000C074
	movs r3, #0
	str r3, [r4, r0]
	subs r0, #0x64
	ldr r0, [r4, r0]
	ldr r2, _021E6770 @ =0x021E76B0
	movs r1, #2
	bl FUN_0201B1E4
	ldr r0, _021E676C @ =0x0000C010
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0201CAE0
	ldr r0, _021E676C @ =0x0000C010
	ldr r2, _021E6774 @ =0x021E76CC
	ldr r0, [r4, r0]
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E676C @ =0x0000C010
	str r0, [sp, #0xc]
	ldr r2, [r4, r2]
	adds r0, r5, #0
	movs r1, #5
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0x80
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #6
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E676C @ =0x0000C010
	str r0, [sp, #0xc]
	ldr r2, [r4, r2]
	adds r0, r5, #0
	movs r1, #7
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, _021E677C @ =0x000001D9
	str r0, [sp, #4]
	ldr r0, _021E676C @ =0x0000C010
	movs r1, #2
	ldr r0, [r4, r0]
	movs r3, #7
	bl FUN_0200E3DC
	ldr r2, [r4]
	movs r0, #0
	movs r1, #0x80
	bl FUN_02003030
	movs r1, #0x1e
	ldr r2, [r4]
	movs r0, #0
	lsls r1, r1, #4
	bl FUN_02003030
	ldr r3, [r4]
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	movs r0, #2
	movs r1, #0
	bl FUN_0201C2D8
	ldr r1, [r4]
	movs r0, #0x10
	bl FUN_02026354
	adds r5, r0, #0
	ldr r1, [r4]
	movs r0, #4
	bl FUN_02002CEC
	ldr r2, _021E6790 @ =0x00007FFF
	add r0, sp, #0x10
	ldr r1, _021E6794 @ =0x00001CE7
	strh r2, [r0, #6]
	strh r1, [r0, #4]
	ldr r1, _021E6798 @ =0x00004E72
	ldr r3, _021E6778 @ =0x000001E2
	strh r1, [r0, #2]
	strh r2, [r0]
	movs r0, #2
	add r1, sp, #0x14
	adds r1, #2
	adds r2, r0, #0
	bl FUN_0201C260
	movs r0, #2
	movs r3, #0x79
	add r1, sp, #0x14
	adds r2, r0, #0
	lsls r3, r3, #2
	bl FUN_0201C260
	movs r0, #2
	add r1, sp, #0x10
	ldr r3, _021E679C @ =0x000001E6
	adds r1, #2
	adds r2, r0, #0
	bl FUN_0201C260
	movs r0, #2
	ldr r3, _021E67A0 @ =0x000001FE
	add r1, sp, #0x10
	adds r2, r0, #0
	bl FUN_0201C260
	ldr r1, _021E676C @ =0x0000C010
	ldr r2, _021E67A4 @ =0x021E765C
	ldr r0, [r4, r1]
	adds r1, #0x24
	adds r1, r4, r1
	bl FUN_0201D4F8
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E67A8 @ =0x0000C034
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E67AC @ =0x0000C070
	movs r1, #0x10
	ldr r0, [r4, r0]
	adds r2, r5, #0
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E67A8 @ =0x0000C034
	movs r1, #4
	adds r0, r4, r0
	adds r2, r5, #0
	str r3, [sp, #8]
	bl FUN_020200A8
	ldr r1, _021E676C @ =0x0000C010
	ldr r2, _021E67B0 @ =0x021E7654
	ldr r0, [r4, r1]
	adds r1, #0x34
	adds r1, r4, r1
	bl FUN_0201D4F8
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E67B4 @ =0x0000C044
	movs r2, #0
	adds r0, r4, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E67AC @ =0x0000C070
	movs r1, #0xd
	ldr r0, [r4, r0]
	adds r2, r5, #0
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E67B4 @ =0x0000C044
	movs r1, #4
	adds r0, r4, r0
	adds r2, r5, #0
	str r3, [sp, #8]
	bl FUN_020200A8
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #4
	bl FUN_02002DB4
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E676C: .4byte 0x0000C010
_021E6770: .4byte 0x021E76B0
_021E6774: .4byte 0x021E76CC
_021E6778: .4byte 0x000001E2
_021E677C: .4byte 0x000001D9
_021E6780: .4byte 0x00004753
_021E6784: .4byte 0x021E766C
_021E6788: .4byte 0x0000C014
_021E678C: .4byte 0x0000C074
_021E6790: .4byte 0x00007FFF
_021E6794: .4byte 0x00001CE7
_021E6798: .4byte 0x00004E72
_021E679C: .4byte 0x000001E6
_021E67A0: .4byte 0x000001FE
_021E67A4: .4byte 0x021E765C
_021E67A8: .4byte 0x0000C034
_021E67AC: .4byte 0x0000C070
_021E67B0: .4byte 0x021E7654
_021E67B4: .4byte 0x0000C044
	thumb_func_end ov69_021E64CC

	thumb_func_start ov69_021E67B8
ov69_021E67B8: @ 0x021E67B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6800 @ =0x0000C034
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _021E6804 @ =0x0000C044
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _021E6808 @ =0x0000C014
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _021E680C @ =0x0000C010
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E680C @ =0x0000C010
	movs r1, #6
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E680C @ =0x0000C010
	movs r1, #3
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	ldr r0, _021E680C @ =0x0000C010
	movs r1, #7
	ldr r0, [r4, r0]
	bl FUN_0201BB4C
	pop {r4, pc}
	nop
_021E6800: .4byte 0x0000C034
_021E6804: .4byte 0x0000C044
_021E6808: .4byte 0x0000C014
_021E680C: .4byte 0x0000C010
	thumb_func_end ov69_021E67B8

	thumb_func_start ov69_021E6810
ov69_021E6810: @ 0x021E6810
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _021E68C4 @ =0x0000C074
	adds r6, r1, #0
	ldr r1, [r5, r0]
	movs r4, #0
	cmp r1, #0
	beq _021E682C
	cmp r1, #1
	beq _021E6886
	cmp r1, #2
	beq _021E68A6
	b _021E68BC
_021E682C:
	movs r1, #0xd8
	str r1, [sp]
	movs r1, #0x20
	subs r0, #0x60
	str r1, [sp, #4]
	adds r0, r5, r0
	movs r1, #0xf
	adds r2, r4, #0
	adds r3, r4, #0
	bl FUN_0201DA74
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #0xa
	bl FUN_02026354
	ldr r2, _021E68C8 @ =0x0000C07C
	adds r1, r6, #0
	str r0, [r5, r2]
	adds r0, r2, #0
	subs r0, #0xc
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	ldr r0, [r5, #8]
	bl FUN_0202AD3C
	adds r3, r4, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, _021E68CC @ =0x0000C014
	str r3, [sp, #8]
	adds r0, r5, r2
	adds r2, #0x68
	ldr r2, [r5, r2]
	movs r1, #1
	bl FUN_020200A8
	ldr r1, _021E68D0 @ =0x0000C078
	movs r2, #1
	str r0, [r5, r1]
	subs r0, r1, #4
	str r2, [r5, r0]
	b _021E68BC
_021E6886:
	adds r0, r0, #4
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _021E68BC
	ldr r0, _021E68C8 @ =0x0000C07C
	ldr r0, [r5, r0]
	bl FUN_02026380
	ldr r0, _021E68C4 @ =0x0000C074
	movs r1, #2
	str r1, [r5, r0]
	b _021E68BC
_021E68A6:
	cmp r2, #0
	bne _021E68B4
	ldr r0, _021E68D4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021E68BC
_021E68B4:
	ldr r0, _021E68C4 @ =0x0000C074
	movs r1, #0
	str r1, [r5, r0]
	movs r4, #1
_021E68BC:
	adds r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E68C4: .4byte 0x0000C074
_021E68C8: .4byte 0x0000C07C
_021E68CC: .4byte 0x0000C014
_021E68D0: .4byte 0x0000C078
_021E68D4: .4byte 0x021D110C
	thumb_func_end ov69_021E6810

	thumb_func_start ov69_021E68D8
ov69_021E68D8: @ 0x021E68D8
	push {r3, lr}
	cmp r2, #0
	bne _021E68E4
	ldr r0, _021E68E8 @ =0x000005DC
	bl FUN_0200604C
_021E68E4:
	pop {r3, pc}
	nop
_021E68E8: .4byte 0x000005DC
	thumb_func_end ov69_021E68D8

	thumb_func_start ov69_021E68EC
ov69_021E68EC: @ 0x021E68EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldr r0, _021E697C @ =0x0000C010
	adds r6, r3, #0
	ldr r0, [r5, r0]
	str r1, [sp]
	bl FUN_0201D4F8
	ldrh r0, [r6, #0x10]
	ldr r1, [r5]
	bl FUN_02014918
	ldr r1, _021E6980 @ =0x0000C068
	movs r7, #0
	str r0, [r5, r1]
	ldrh r0, [r6, #0x10]
	cmp r0, #0
	ble _021E692E
	ldr r4, [sp, #0x38]
_021E6914:
	ldr r0, _021E6980 @ =0x0000C068
	ldr r1, _021E6984 @ =0x0000C070
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl FUN_02014960
	ldrh r0, [r6, #0x10]
	adds r7, r7, #1
	adds r4, #8
	cmp r7, r0
	blt _021E6914
_021E692E:
	add r3, sp, #4
	adds r2, r3, #0
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, _021E6980 @ =0x0000C068
	movs r1, #0
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [sp]
	str r0, [sp, #0x10]
	ldr r0, _021E6988 @ =ov69_021E68D8
	str r0, [sp, #8]
	ldr r3, [r5]
	adds r0, r2, #0
	lsls r3, r3, #0x18
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl FUN_020011DC
	ldr r1, _021E698C @ =0x0000C064
	ldr r2, _021E6990 @ =0x000001D9
	str r0, [r5, r1]
	ldr r0, [sp, #0x10]
	movs r1, #1
	movs r3, #7
	bl FUN_0200E580
	ldr r0, [sp]
	bl FUN_0201D578
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_021E697C: .4byte 0x0000C010
_021E6980: .4byte 0x0000C068
_021E6984: .4byte 0x0000C070
_021E6988: .4byte ov69_021E68D8
_021E698C: .4byte 0x0000C064
_021E6990: .4byte 0x000001D9
	thumb_func_end ov69_021E68EC

	thumb_func_start ov69_021E6994
ov69_021E6994: @ 0x021E6994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r0, _021E6A40 @ =0x0000C010
	str r1, [sp]
	ldr r0, [r5, r0]
	str r3, [sp, #4]
	ldr r7, [sp, #0x44]
	ldr r6, [sp, #0x48]
	bl FUN_0201D4F8
	ldr r2, [sp, #0x40]
	ldr r3, [r5]
	movs r0, #0
	movs r1, #0x1b
	bl FUN_0200BAF8
	str r0, [sp, #8]
	ldr r1, [r5]
	adds r0, r6, #0
	bl FUN_02014918
	ldr r1, _021E6A44 @ =0x0000C068
	movs r4, #0
	str r0, [r5, r1]
	cmp r6, #0
	bls _021E69DE
_021E69CA:
	ldr r0, _021E6A44 @ =0x0000C068
	ldrb r2, [r7, r4]
	ldr r0, [r5, r0]
	ldr r1, [sp, #8]
	adds r3, r4, #0
	bl FUN_02014960
	adds r4, r4, #1
	cmp r4, r6
	blo _021E69CA
_021E69DE:
	ldr r0, [sp, #8]
	bl FUN_0200BB44
	ldr r4, [sp, #4]
	add r3, sp, #0xc
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	str r4, [sp, #4]
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	str r4, [sp, #4]
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	str r4, [sp, #4]
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, _021E6A44 @ =0x0000C068
	movs r1, #0
	ldr r0, [r5, r0]
	str r4, [sp, #4]
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	strh r6, [r0, #0x10]
	ldr r0, [sp]
	str r0, [sp, #0x18]
	ldr r0, _021E6A48 @ =ov69_021E68D8
	str r0, [sp, #0x10]
	ldr r3, [r5]
	adds r0, r2, #0
	lsls r3, r3, #0x18
	adds r2, r1, #0
	lsrs r3, r3, #0x18
	bl FUN_020011DC
	ldr r1, _021E6A4C @ =0x0000C064
	ldr r2, _021E6A50 @ =0x000001D9
	str r0, [r5, r1]
	ldr r0, [sp, #0x18]
	movs r1, #1
	movs r3, #7
	bl FUN_0200E580
	ldr r0, [sp]
	bl FUN_0201D578
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6A40: .4byte 0x0000C010
_021E6A44: .4byte 0x0000C068
_021E6A48: .4byte ov69_021E68D8
_021E6A4C: .4byte 0x0000C064
_021E6A50: .4byte 0x000001D9
	thumb_func_end ov69_021E6994

	thumb_func_start ov69_021E6A54
ov69_021E6A54: @ 0x021E6A54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6A80 @ =0x0000C024
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E5D4
	ldr r0, _021E6A80 @ =0x0000C024
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _021E6A84 @ =0x0000C064
	movs r1, #0
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl FUN_02001434
	ldr r0, _021E6A88 @ =0x0000C068
	ldr r0, [r4, r0]
	bl FUN_02014950
	pop {r4, pc}
	.align 2, 0
_021E6A80: .4byte 0x0000C024
_021E6A84: .4byte 0x0000C064
_021E6A88: .4byte 0x0000C068
	thumb_func_end ov69_021E6A54

	thumb_func_start ov69_021E6A8C
ov69_021E6A8C: @ 0x021E6A8C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #0xa
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #0xa
	bl FUN_02026354
	ldr r1, _021E6B40 @ =0x0000C010
	adds r6, r0, #0
	ldr r0, [r5, r1]
	adds r1, #0x44
	ldr r2, _021E6B44 @ =0x021E764C
	adds r1, r5, r1
	bl FUN_0201D4F8
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6B48 @ =0x0000C054
	movs r2, #0
	adds r0, r5, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E6B48 @ =0x0000C054
	ldr r2, _021E6B4C @ =0x000001D9
	adds r0, r5, r0
	movs r1, #0
	movs r3, #7
	bl FUN_0200E580
	ldr r0, _021E6B50 @ =0x0000C080
	ldr r2, _021E6B54 @ =0x0000C324
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	movs r1, #0
	bl FUN_0200C4B0
	ldr r3, _021E6B54 @ =0x0000C324
	ldr r0, _021E6B50 @ =0x0000C080
	ldr r2, [r5, r3]
	adds r3, r3, #4
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	movs r1, #1
	bl FUN_0200C4E8
	ldr r0, _021E6B58 @ =0x0000C070
	movs r1, #0xe
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl FUN_0200BB6C
	ldr r0, _021E6B50 @ =0x0000C080
	adds r1, r4, #0
	ldr r0, [r5, r0]
	adds r2, r6, #0
	bl FUN_0200CBBC
	movs r1, #0
	ldr r0, _021E6B48 @ =0x0000C054
	str r1, [sp]
	str r1, [sp, #4]
	adds r0, r5, r0
	adds r2, r4, #0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, _021E6B48 @ =0x0000C054
	adds r0, r5, r0
	bl FUN_0201D578
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E6B40: .4byte 0x0000C010
_021E6B44: .4byte 0x021E764C
_021E6B48: .4byte 0x0000C054
_021E6B4C: .4byte 0x000001D9
_021E6B50: .4byte 0x0000C080
_021E6B54: .4byte 0x0000C324
_021E6B58: .4byte 0x0000C070
	thumb_func_end ov69_021E6A8C

	thumb_func_start ov69_021E6B5C
ov69_021E6B5C: @ 0x021E6B5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	str r1, [sp, #0xc]
	ldr r1, [r5]
	movs r0, #0x40
	adds r4, r2, #0
	bl FUN_02026354
	adds r7, r0, #0
	ldr r1, [r5]
	movs r0, #0x40
	bl FUN_02026354
	ldr r1, _021E6C04 @ =0x0000C010
	adds r6, r0, #0
	ldr r0, [r5, r1]
	adds r1, #0x44
	ldr r2, _021E6C08 @ =0x021E764C
	adds r1, r5, r1
	bl FUN_0201D4F8
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6C0C @ =0x0000C054
	movs r2, #0
	adds r0, r5, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E6C0C @ =0x0000C054
	ldr r2, _021E6C10 @ =0x000001D9
	adds r0, r5, r0
	movs r1, #0
	movs r3, #7
	bl FUN_0200E580
	ldr r0, [r5]
	adds r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r2, r7, #0
	adds r3, r6, #0
	bl ov69_021E7520
	cmp r4, #0
	beq _021E6BD8
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, _021E6C0C @ =0x0000C054
	adds r2, r6, #0
	adds r0, r5, r0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
_021E6BD8:
	movs r1, #0
	ldr r0, _021E6C0C @ =0x0000C054
	str r1, [sp]
	str r1, [sp, #4]
	adds r0, r5, r0
	adds r2, r7, #0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	ldr r0, _021E6C0C @ =0x0000C054
	adds r0, r5, r0
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6C04: .4byte 0x0000C010
_021E6C08: .4byte 0x021E764C
_021E6C0C: .4byte 0x0000C054
_021E6C10: .4byte 0x000001D9
	thumb_func_end ov69_021E6B5C

	thumb_func_start ov69_021E6C14
ov69_021E6C14: @ 0x021E6C14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6C2C @ =0x0000C054
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E5D4
	ldr r0, _021E6C2C @ =0x0000C054
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
_021E6C2C: .4byte 0x0000C054
	thumb_func_end ov69_021E6C14

	thumb_func_start ov69_021E6C30
ov69_021E6C30: @ 0x021E6C30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r0, _021E6D54 @ =0x0000C2C4
	str r1, [sp]
	ldr r1, [r6, r0]
	movs r7, #1
	adds r2, r1, #0
	subs r2, #0x80
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #0x1c]
	adds r2, r1, #0
	adds r2, #0x80
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #0x18]
	adds r2, r0, #4
	ldr r3, [r6, r2]
	adds r0, r0, #4
	adds r2, r3, #0
	subs r2, #0x80
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r3, #0x80
	str r2, [sp, #0x14]
	lsls r2, r3, #0x10
	asrs r2, r2, #0x10
	str r2, [sp, #0x10]
	ldr r2, [r6, #0xc]
	lsls r7, r7, #8
	str r1, [sp, #0x2c]
	ldr r0, [r6, r0]
	str r2, [sp, #4]
	str r0, [sp, #0x30]
	add r0, sp, #0x2c
	bl ov69_021E75A0
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r0, r1, r0
	bpl _021E6C8A
	rsbs r0, r0, #0
_021E6C8A:
	movs r1, #1
	lsls r1, r1, #8
	cmp r0, r1
	ble _021E6CCE
	ldr r0, _021E6D58 @ =0x0000C2C8
	ldr r0, [r6, r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	cmp r0, #0
	ble _021E6CAC
	lsls r1, r1, #8
	subs r0, r0, r1
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	b _021E6CB4
_021E6CAC:
	lsls r1, r1, #8
	adds r0, r0, r1
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
_021E6CB4:
	ldr r0, [sp, #0xc]
	subs r0, #0x80
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r0, #0x80
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	subs r0, #0x80
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #0x80
	str r0, [sp, #0x10]
	b _021E6CD6
_021E6CCE:
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	str r0, [sp, #8]
_021E6CD6:
	ldr r0, [r6, #0xc]
	movs r4, #0
	cmp r0, #0
	bls _021E6D3A
	adds r5, r6, #0
_021E6CE0:
	movs r0, #0x10
	ldrsh r0, [r5, r0]
	ldr r1, [sp, #0x1c]
	cmp r0, r1
	ble _021E6D30
	ldr r1, [sp, #0x18]
	cmp r0, r1
	bge _021E6D30
	movs r1, #0x12
	ldrsh r1, [r5, r1]
	ldr r2, [sp, #0x14]
	cmp r1, r2
	ble _021E6D00
	ldr r2, [sp, #0x10]
	cmp r1, r2
	blt _021E6D0C
_021E6D00:
	ldr r2, [sp, #0xc]
	cmp r1, r2
	ble _021E6D30
	ldr r2, [sp, #8]
	cmp r1, r2
	bge _021E6D30
_021E6D0C:
	ldrh r1, [r5, #0x38]
	cmp r1, #0
	beq _021E6D30
	str r0, [sp, #0x24]
	movs r0, #0x12
	ldrsh r0, [r5, r0]
	str r0, [sp, #0x28]
	add r0, sp, #0x24
	bl ov69_021E75A0
	add r0, sp, #0x2c
	add r1, sp, #0x24
	bl ov69_021E75F8
	cmp r0, r7
	bhs _021E6D30
	adds r7, r0, #0
	str r4, [sp, #4]
_021E6D30:
	ldr r0, [r6, #0xc]
	adds r4, r4, #1
	adds r5, #0x30
	cmp r4, r0
	blo _021E6CE0
_021E6D3A:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	str r1, [r0]
	ldr r1, [r6, #0xc]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _021E6D4C
	movs r0, #1
	str r0, [sp, #0x20]
_021E6D4C:
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E6D54: .4byte 0x0000C2C4
_021E6D58: .4byte 0x0000C2C8
	thumb_func_end ov69_021E6C30

	thumb_func_start ov69_021E6D5C
ov69_021E6D5C: @ 0x021E6D5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021E6E78 @ =0x0000C338
	adds r5, r0, #0
	ldr r1, [r5, r1]
	cmp r1, #0
	bne _021E6DB6
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r0, #0xa
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6E7C @ =0x0000C014
	movs r2, #0
	adds r0, r5, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r0, _021E6E80 @ =0x0000C070
	movs r1, #0xf
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl FUN_0200BB6C
	movs r3, #0
	ldr r0, _021E6E7C @ =0x0000C014
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, r0
	movs r1, #1
	adds r2, r4, #0
	str r3, [sp, #8]
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E6DB6:
	add r1, sp, #0xc
	bl ov69_021E6C30
	cmp r0, #0
	beq _021E6E6E
	ldr r1, [r5]
	movs r0, #0x40
	bl FUN_02026354
	adds r6, r0, #0
	ldr r1, [r5]
	movs r0, #0x40
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #0xd8
	str r0, [sp]
	movs r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6E7C @ =0x0000C014
	movs r2, #0
	adds r0, r5, r0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	ldr r1, [sp, #0xc]
	movs r0, #0x30
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [r5]
	adds r1, r5, r2
	str r0, [sp]
	ldrh r0, [r1, #0x3a]
	ldrh r1, [r1, #0x3c]
	adds r2, r6, #0
	adds r3, r4, #0
	bl ov69_021E7520
	ldr r1, [sp, #0xc]
	movs r0, #0x30
	muls r0, r1, r0
	adds r0, r5, r0
	ldrh r0, [r0, #0x3c]
	cmp r0, #0
	beq _021E6E2A
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E7C @ =0x0000C014
	movs r3, #0
	adds r0, r5, r0
	movs r1, #1
	adds r2, r4, #0
	str r3, [sp, #8]
	bl FUN_020200A8
_021E6E2A:
	movs r3, #0
	ldr r0, _021E6E7C @ =0x0000C014
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, r0
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #8]
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [sp, #0xc]
	movs r1, #0x30
	adds r2, r0, #0
	muls r2, r1, r2
	adds r2, r5, r2
	movs r0, #0x10
	ldrsh r2, [r2, r0]
	ldr r0, _021E6E84 @ =0x0000C2C4
	str r2, [r5, r0]
	ldr r2, [sp, #0xc]
	adds r0, r0, #4
	muls r1, r2, r1
	adds r2, r5, r1
	movs r1, #0x12
	ldrsh r1, [r2, r1]
	add sp, #0x10
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
_021E6E6E:
	ldr r0, _021E6E78 @ =0x0000C338
	movs r1, #0
	str r1, [r5, r0]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E6E78: .4byte 0x0000C338
_021E6E7C: .4byte 0x0000C014
_021E6E80: .4byte 0x0000C070
_021E6E84: .4byte 0x0000C2C4
	thumb_func_end ov69_021E6D5C

	thumb_func_start ov69_021E6E88
ov69_021E6E88: @ 0x021E6E88
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200771C
	ldr r2, _021E6F2C @ =0x0000C0DC
	str r0, [r5, r2]
	adds r0, r2, #0
	subs r1, r2, #4
	subs r0, #0x58
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, r2
	bl FUN_0201F51C
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0200771C
	ldr r2, _021E6F30 @ =0x0000C2A4
	str r0, [r5, r2]
	adds r0, r2, #0
	adds r1, r2, #0
	subs r0, #0xc8
	subs r1, #0x14
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, r2
	bl FUN_0201F51C
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0200771C
	ldr r2, _021E6F34 @ =0x0000C2A8
	str r0, [r5, r2]
	adds r0, r2, #0
	adds r1, r2, #0
	subs r0, #0x78
	subs r1, #0x14
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, r2
	bl FUN_0201F51C
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0200771C
	ldr r2, _021E6F38 @ =0x0000C29C
	str r0, [r5, r2]
	adds r1, r2, #0
	ldr r0, _021E6F3C @ =0x0000C134
	subs r1, #0x14
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, r2
	bl FUN_0201F51C
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0200771C
	ldr r2, _021E6F40 @ =0x0000C2A0
	str r0, [r5, r2]
	adds r1, r2, #0
	ldr r0, _021E6F44 @ =0x0000C188
	subs r1, #0x14
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, r2
	bl FUN_0201F51C
	pop {r3, r4, r5, pc}
	nop
_021E6F2C: .4byte 0x0000C0DC
_021E6F30: .4byte 0x0000C2A4
_021E6F34: .4byte 0x0000C2A8
_021E6F38: .4byte 0x0000C29C
_021E6F3C: .4byte 0x0000C134
_021E6F40: .4byte 0x0000C2A0
_021E6F44: .4byte 0x0000C188
	thumb_func_end ov69_021E6E88

	thumb_func_start ov69_021E6F48
ov69_021E6F48: @ 0x021E6F48
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E6F78 @ =0x0000C2A0
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E6F7C @ =0x0000C29C
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E6F80 @ =0x0000C2A8
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E6F84 @ =0x0000C2A4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _021E6F88 @ =0x0000C0DC
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	nop
_021E6F78: .4byte 0x0000C2A0
_021E6F7C: .4byte 0x0000C29C
_021E6F80: .4byte 0x0000C2A8
_021E6F84: .4byte 0x0000C2A4
_021E6F88: .4byte 0x0000C0DC
	thumb_func_end ov69_021E6F48

	thumb_func_start ov69_021E6F8C
ov69_021E6F8C: @ 0x021E6F8C
	push {r4, r5}
	ldr r1, _021E6FE4 @ =0x0000C2AC
	movs r3, #0
	str r3, [r0, r1]
	adds r2, r1, #4
	str r3, [r0, r2]
	adds r2, r1, #0
	adds r2, #8
	str r3, [r0, r2]
	movs r2, #1
	adds r4, r1, #0
	lsls r2, r2, #0xc
	adds r4, #0xc
	str r2, [r0, r4]
	adds r4, r1, #0
	adds r4, #0x10
	str r2, [r0, r4]
	adds r4, r1, #0
	adds r4, #0x14
	str r2, [r0, r4]
	movs r5, #0x69
	adds r4, r1, #0
	lsls r5, r5, #6
	adds r4, #0x18
	str r5, [r0, r4]
	movs r5, #0x1f
	adds r4, r1, #0
	lsls r5, r5, #0xa
	adds r4, #0x1c
	str r5, [r0, r4]
	adds r4, r1, #0
	adds r4, #0x20
	str r3, [r0, r4]
	adds r3, r1, #0
	adds r3, #0x24
	str r2, [r0, r3]
	adds r3, r1, #0
	adds r3, #0x28
	str r2, [r0, r3]
	adds r1, #0x2c
	str r2, [r0, r1]
	pop {r4, r5}
	bx lr
	nop
_021E6FE4: .4byte 0x0000C2AC
	thumb_func_end ov69_021E6F8C

	thumb_func_start ov69_021E6FE8
ov69_021E6FE8: @ 0x021E6FE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r6, _021E705C @ =0x021E767C
	adds r4, r0, #0
	ldm r6!, {r0, r1}
	add r5, sp, #8
	adds r2, r5, #0
	stm r5!, {r0, r1}
	ldr r0, [r6]
	adds r1, r2, #0
	str r0, [r5]
	add r7, sp, #0x14
	movs r3, #0
	str r3, [r7]
	str r3, [r7, #4]
	str r3, [r7, #8]
	ldr r0, _021E7060 @ =0x0000C2DC
	str r3, [sp]
	ldr r0, [r4, r0]
	ldr r2, _021E7064 @ =0x000005C1
	str r0, [sp, #4]
	adds r0, r7, #0
	bl FUN_02023308
	ldr r2, _021E7060 @ =0x0000C2DC
	movs r1, #0x19
	ldr r2, [r4, r2]
	movs r0, #0
	lsls r1, r1, #0xe
	bl FUN_02023240
	ldr r1, _021E7060 @ =0x0000C2DC
	movs r0, #0
	ldr r1, [r4, r1]
	bl FUN_020233D8
	ldr r0, _021E7060 @ =0x0000C2DC
	ldr r0, [r4, r0]
	bl FUN_0202313C
	ldr r0, _021E7068 @ =0x0000C304
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7048
	movs r1, #1
	subs r0, #0x1c
	strh r1, [r4, r0]
	b _021E704E
_021E7048:
	movs r1, #0
	subs r0, #0x1c
	strh r1, [r4, r0]
_021E704E:
	adds r0, r4, #0
	bl ov69_021E737C
	cmp r0, #1
	bne _021E704E
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E705C: .4byte 0x021E767C
_021E7060: .4byte 0x0000C2DC
_021E7064: .4byte 0x000005C1
_021E7068: .4byte 0x0000C304
	thumb_func_end ov69_021E6FE8

	thumb_func_start ov69_021E706C
ov69_021E706C: @ 0x021E706C
	push {r4, lr}
	ldr r3, _021E70A0 @ =0x0000C2EC
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, r3]
	adds r1, r3, #4
	str r0, [r4, r1]
	adds r1, r3, #0
	ldr r2, _021E70A4 @ =0xFFFFF001
	adds r1, #8
	str r2, [r4, r1]
	ldr r1, [r4, r3]
	adds r2, r3, #4
	adds r3, #8
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	blx FUN_020BF034
	pop {r4, pc}
	nop
_021E70A0: .4byte 0x0000C2EC
_021E70A4: .4byte 0xFFFFF001
	thumb_func_end ov69_021E706C

	thumb_func_start ov69_021E70A8
ov69_021E70A8: @ 0x021E70A8
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, [r4, #4]
	ldr r3, _021E711C @ =0x021094DC
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r1, r1, #4
	lsls r2, r1, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r5, r0, #0
	bl FUN_020CB0EC
	ldr r0, [r4]
	ldr r3, _021E711C @ =0x021094DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB0D0
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	ldr r0, [r4, #8]
	ldr r3, _021E711C @ =0x021094DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB108
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021E711C: .4byte 0x021094DC
	thumb_func_end ov69_021E70A8

	thumb_func_start ov69_021E7120
ov69_021E7120: @ 0x021E7120
	push {r4, r5, lr}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, [r4]
	ldr r3, _021E7194 @ =0x021094DC
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r1, r1, #4
	lsls r2, r1, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r5, r0, #0
	bl FUN_020CB0EC
	ldr r0, [r4, #4]
	ldr r3, _021E7194 @ =0x021094DC
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	lsls r1, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB0D0
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	ldr r0, [r4, #8]
	ldr r3, _021E7194 @ =0x021094DC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	adds r1, r2, #1
	lsls r1, r1, #1
	lsls r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl FUN_020CB108
	adds r0, r5, #0
	add r1, sp, #0
	adds r2, r5, #0
	blx FUN_020CB410
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_021E7194: .4byte 0x021094DC
	thumb_func_end ov69_021E7120

	thumb_func_start ov69_021E7198
ov69_021E7198: @ 0x021E7198
	push {r3, r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r0, _021E735C @ =0x0000C2C4
	adds r7, r2, #0
	adds r4, r0, #4
	ldr r4, [r3, r4]
	ldr r2, [r3, r0]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r2, r2, #0x10
	mov lr, r4
	movs r4, #1
	movs r6, #0
	asrs r2, r2, #0x10
	tst r1, r4
	bne _021E71C4
	adds r1, r0, #0
	adds r1, #0x44
	ldr r1, [r3, r1]
	mov ip, r1
	tst r1, r4
	beq _021E71E8
_021E71C4:
	ldr r1, _021E7360 @ =0x0000C304
	ldrh r0, [r3, r1]
	cmp r0, #1
	bne _021E71E4
	adds r0, r1, #0
	subs r0, #0x1c
	ldrh r0, [r3, r0]
	cmp r0, #0
	bne _021E71DE
	movs r0, #1
	subs r1, #0x1c
	strh r0, [r3, r1]
	b _021E71E4
_021E71DE:
	movs r0, #0
	subs r1, #0x1c
	strh r0, [r3, r1]
_021E71E4:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E71E8:
	adds r1, r0, #0
	adds r1, #0x24
	ldrh r1, [r3, r1]
	cmp r1, #0
	bne _021E7220
	adds r1, r0, #0
	adds r1, #0x54
	ldr r1, [r3, r1]
	cmp r1, #0
	bne _021E7204
	adds r0, #0x58
	ldr r0, [r3, r0]
	cmp r0, #0
	beq _021E721A
_021E7204:
	adds r0, r1, #0
	ldr r1, _021E7364 @ =0x0000C31C
	movs r4, #0x55
	ldr r1, [r3, r1]
	muls r0, r4, r0
	muls r4, r1, r4
	lsls r0, r0, #0x10
	lsls r1, r4, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	b _021E724C
_021E721A:
	lsls r0, r4, #9
	adds r1, r0, #0
	b _021E724C
_021E7220:
	adds r1, r0, #0
	adds r1, #0x54
	ldr r1, [r3, r1]
	cmp r1, #0
	bne _021E7232
	adds r0, #0x58
	ldr r0, [r3, r0]
	cmp r0, #0
	beq _021E7248
_021E7232:
	adds r0, r1, #0
	ldr r1, _021E7364 @ =0x0000C31C
	movs r4, #0xa
	ldr r1, [r3, r1]
	muls r0, r4, r0
	muls r4, r1, r4
	lsls r0, r0, #0x10
	lsls r1, r4, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x10
	b _021E724C
_021E7248:
	movs r0, #0x20
	adds r1, r0, #0
_021E724C:
	movs r4, #0x20
	tst r4, r7
	bne _021E725A
	mov r5, ip
	movs r4, #0x20
	tst r4, r5
	beq _021E7286
_021E725A:
	ldr r6, _021E7360 @ =0x0000C304
	ldrh r4, [r3, r6]
	cmp r4, #1
	bne _021E7270
	adds r4, r6, #0
	subs r4, #0x3c
	ldr r4, [r3, r4]
	subs r6, #0x3c
	adds r4, r4, r0
	str r4, [r3, r6]
	b _021E7284
_021E7270:
	ldr r5, _021E7368 @ =0xFFFFD820
	mov r4, lr
	cmp r4, r5
	bge _021E7284
	adds r4, r6, #0
	subs r4, #0x3c
	ldr r4, [r3, r4]
	subs r6, #0x3c
	adds r4, r4, r0
	str r4, [r3, r6]
_021E7284:
	movs r6, #1
_021E7286:
	movs r4, #0x10
	tst r4, r7
	bne _021E7296
	ldr r4, _021E736C @ =0x0000C308
	ldr r5, [r3, r4]
	movs r4, #0x10
	tst r4, r5
	beq _021E72C2
_021E7296:
	ldr r5, _021E7360 @ =0x0000C304
	ldrh r4, [r3, r5]
	cmp r4, #1
	bne _021E72AC
	adds r4, r5, #0
	subs r4, #0x3c
	ldr r4, [r3, r4]
	subs r5, #0x3c
	subs r0, r4, r0
	str r0, [r3, r5]
	b _021E72C0
_021E72AC:
	ldr r4, _021E7370 @ =0xFFFFCC80
	mov r6, lr
	cmp r6, r4
	ble _021E72C0
	adds r4, r5, #0
	subs r4, #0x3c
	ldr r4, [r3, r4]
	subs r5, #0x3c
	subs r0, r4, r0
	str r0, [r3, r5]
_021E72C0:
	movs r6, #1
_021E72C2:
	movs r4, #0x40
	adds r0, r7, #0
	tst r0, r4
	bne _021E72D2
	ldr r0, _021E736C @ =0x0000C308
	ldr r0, [r3, r0]
	tst r0, r4
	beq _021E730C
_021E72D2:
	ldr r4, _021E7360 @ =0x0000C304
	ldrh r0, [r3, r4]
	cmp r0, #1
	bne _021E72F8
	movs r0, #0x3e
	adds r5, r2, r1
	lsls r0, r0, #8
	cmp r5, r0
	bge _021E72F2
	adds r0, r4, #0
	subs r0, #0x40
	ldr r0, [r3, r0]
	subs r4, #0x40
	adds r0, r0, r1
	str r0, [r3, r4]
	b _021E730A
_021E72F2:
	subs r4, #0x40
	str r0, [r3, r4]
	b _021E730A
_021E72F8:
	ldr r0, _021E7374 @ =0x00002020
	cmp r2, r0
	bge _021E730A
	adds r0, r4, #0
	subs r0, #0x40
	ldr r0, [r3, r0]
	subs r4, #0x40
	adds r0, r0, r1
	str r0, [r3, r4]
_021E730A:
	movs r6, #1
_021E730C:
	movs r4, #0x80
	adds r0, r7, #0
	tst r0, r4
	bne _021E731C
	ldr r0, _021E736C @ =0x0000C308
	ldr r0, [r3, r0]
	tst r0, r4
	beq _021E7356
_021E731C:
	ldr r4, _021E7360 @ =0x0000C304
	ldrh r0, [r3, r4]
	cmp r0, #1
	bne _021E7340
	ldr r0, _021E7378 @ =0xFFFFC200
	subs r2, r2, r1
	cmp r2, r0
	ble _021E733A
	adds r0, r4, #0
	subs r0, #0x40
	ldr r0, [r3, r0]
	subs r4, #0x40
	subs r0, r0, r1
	str r0, [r3, r4]
	b _021E7354
_021E733A:
	subs r4, #0x40
	str r0, [r3, r4]
	b _021E7354
_021E7340:
	movs r0, #0x13
	lsls r0, r0, #8
	cmp r2, r0
	ble _021E7354
	adds r0, r4, #0
	subs r0, #0x40
	ldr r0, [r3, r0]
	subs r4, #0x40
	subs r0, r0, r1
	str r0, [r3, r4]
_021E7354:
	movs r6, #1
_021E7356:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E735C: .4byte 0x0000C2C4
_021E7360: .4byte 0x0000C304
_021E7364: .4byte 0x0000C31C
_021E7368: .4byte 0xFFFFD820
_021E736C: .4byte 0x0000C308
_021E7370: .4byte 0xFFFFCC80
_021E7374: .4byte 0x00002020
_021E7378: .4byte 0xFFFFC200
	thumb_func_end ov69_021E7198

	thumb_func_start ov69_021E737C
ov69_021E737C: @ 0x021E737C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021E7400 @ =0x0000C2DC
	ldr r0, [r5, r0]
	bl FUN_02023614
	ldr r1, _021E7404 @ =0x0000C2E8
	movs r4, #0
	ldrh r2, [r5, r1]
	cmp r2, #0
	beq _021E73C6
	cmp r2, #1
	bne _021E73F4
	movs r2, #0x16
	lsls r2, r2, #0xe
	cmp r0, r2
	ble _021E73BE
	movs r2, #2
	lsls r2, r2, #0xe
	subs r0, r0, r2
	adds r2, r1, #0
	subs r2, #0x18
	ldr r3, [r5, r2]
	adds r2, r1, #0
	subs r3, #0x80
	subs r2, #0x18
	str r3, [r5, r2]
	adds r2, r1, #0
	subs r2, #0x18
	ldr r2, [r5, r2]
	subs r1, #0x14
	str r2, [r5, r1]
	b _021E73F4
_021E73BE:
	movs r0, #5
	lsls r0, r0, #0x10
	movs r4, #1
	b _021E73F4
_021E73C6:
	movs r2, #0x12
	lsls r2, r2, #0x10
	cmp r0, r2
	bge _021E73EE
	movs r2, #2
	lsls r2, r2, #0xe
	adds r0, r0, r2
	adds r2, r1, #0
	subs r2, #0x18
	ldr r3, [r5, r2]
	adds r2, r1, #0
	adds r3, #0x80
	subs r2, #0x18
	str r3, [r5, r2]
	adds r2, r1, #0
	subs r2, #0x18
	ldr r2, [r5, r2]
	subs r1, #0x14
	str r2, [r5, r1]
	b _021E73F4
_021E73EE:
	movs r0, #0x4a
	lsls r0, r0, #0xe
	movs r4, #1
_021E73F4:
	ldr r1, _021E7400 @ =0x0000C2DC
	ldr r1, [r5, r1]
	bl FUN_020235D4
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7400: .4byte 0x0000C2DC
_021E7404: .4byte 0x0000C2E8
	thumb_func_end ov69_021E737C

	thumb_func_start ov69_021E7408
ov69_021E7408: @ 0x021E7408
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	ldr r4, _021E74F8 @ =0x021E7728
	adds r5, r0, #0
	add r3, sp, #0x4c
	movs r2, #4
_021E7414:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7414
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, _021E74FC @ =0x0000C2F8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E74F2
	cmp r0, #1
	beq _021E7446
	cmp r0, #2
	bne _021E74F2
	bl FUN_02026E48
	movs r0, #0
	movs r1, #1
	bl FUN_02026E50
	ldr r0, _021E74FC @ =0x0000C2F8
	movs r1, #0
	add sp, #0x70
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021E7446:
	bl FUN_02026E48
	bl FUN_02023154
	ldr r1, _021E7500 @ =0x0000C2C4
	add r0, sp, #0x4c
	adds r1, r5, r1
	bl ov69_021E70A8
	ldr r3, _021E7504 @ =0x0000C2AC
	ldr r0, _021E7508 @ =0x0000C084
	adds r1, r5, r3
	adds r3, #0xc
	adds r0, r5, r0
	add r2, sp, #0x4c
	adds r3, r5, r3
	bl FUN_0201F554
	ldr r4, _021E750C @ =0x021E7794
	add r3, sp, #0x28
	movs r2, #4
_021E7470:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7470
	ldr r0, [r4]
	add r2, sp, #0x28
	str r0, [r3]
	ldr r3, _021E7510 @ =0x0000C230
	adds r1, r3, #0
	adds r0, r5, r3
	adds r1, #0x7c
	adds r3, #0xa0
	adds r1, r5, r1
	adds r3, r5, r3
	bl FUN_0201F554
	ldr r4, _021E7514 @ =0x021E774C
	add r3, sp, #4
	movs r2, #4
_021E7496:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E7496
	ldr r0, [r4]
	movs r7, #0
	str r0, [r3]
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bls _021E74EA
	ldr r0, _021E7518 @ =0x0000C0E0
	adds r6, r5, #0
	adds r0, r5, r0
	adds r6, #0x14
	adds r4, r5, #0
	str r0, [sp]
_021E74B6:
	adds r0, r6, #0
	add r1, sp, #0x4c
	add r2, sp, #4
	blx FUN_020CB410
	ldrh r2, [r4, #0x38]
	cmp r2, #0
	beq _021E74DE
	adds r1, r2, #0
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, [sp]
	ldr r3, _021E751C @ =0x0000C2D0
	adds r0, r0, r1
	ldr r1, _021E7504 @ =0x0000C2AC
	add r2, sp, #4
	adds r1, r5, r1
	adds r3, r5, r3
	bl FUN_0201F554
_021E74DE:
	ldr r0, [r5, #0xc]
	adds r7, r7, #1
	adds r6, #0x30
	adds r4, #0x30
	cmp r7, r0
	blo _021E74B6
_021E74EA:
	movs r0, #0
	movs r1, #1
	bl FUN_02026E50
_021E74F2:
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E74F8: .4byte 0x021E7728
_021E74FC: .4byte 0x0000C2F8
_021E7500: .4byte 0x0000C2C4
_021E7504: .4byte 0x0000C2AC
_021E7508: .4byte 0x0000C084
_021E750C: .4byte 0x021E7794
_021E7510: .4byte 0x0000C230
_021E7514: .4byte 0x021E774C
_021E7518: .4byte 0x0000C0E0
_021E751C: .4byte 0x0000C2D0
	thumb_func_end ov69_021E7408

	thumb_func_start ov69_021E7520
ov69_021E7520: @ 0x021E7520
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	str r1, [sp]
	adds r6, r2, #0
	str r3, [sp, #4]
	bl ov69_021E6300
	ldr r7, [sp, #0x20]
	adds r4, r0, #0
	ldr r2, _021E7588 @ =0x0000031E
	movs r0, #0
	movs r1, #0x1b
	adds r3, r7, #0
	bl FUN_0200BAF8
	str r0, [sp, #8]
	adds r1, r5, #0
	adds r2, r6, #0
	bl FUN_0200BB6C
	ldr r0, [sp, #8]
	bl FUN_0200BB44
	cmp r4, #0
	bne _021E755C
	movs r5, #0
	movs r4, #1
	str r5, [sp]
	b _021E755E
_021E755C:
	movs r5, #1
_021E755E:
	adds r0, r4, #0
	bl FUN_020916C0
	adds r2, r0, #0
	movs r0, #0
	movs r1, #0x1b
	adds r3, r7, #0
	bl FUN_0200BAF8
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r4, r0, #0
	bl FUN_0200BB6C
	adds r0, r4, #0
	bl FUN_0200BB44
	adds r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E7588: .4byte 0x0000031E
	thumb_func_end ov69_021E7520

	thumb_func_start ov69_021E758C
ov69_021E758C: @ 0x021E758C
	push {r3, lr}
	bl ov69_021E6300
	cmp r0, #0
	beq _021E759A
	movs r0, #1
	pop {r3, pc}
_021E759A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov69_021E758C

	thumb_func_start ov69_021E75A0
ov69_021E75A0: @ 0x021E75A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _021E75B4
	ldr r1, _021E75F4 @ =0x0000FFFF
	blx FUN_020F2998
	str r1, [r4]
	b _021E75CA
_021E75B4:
	bge _021E75B8
	rsbs r0, r0, #0
_021E75B8:
	ldr r1, _021E75F4 @ =0x0000FFFF
	blx FUN_020F2998
	adds r1, r0, #1
	ldr r0, _021E75F4 @ =0x0000FFFF
	ldr r2, [r4]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [r4]
_021E75CA:
	ldr r0, [r4, #4]
	cmp r0, #0
	blt _021E75DA
	ldr r1, _021E75F4 @ =0x0000FFFF
	blx FUN_020F2998
	str r1, [r4, #4]
	pop {r4, pc}
_021E75DA:
	bge _021E75DE
	rsbs r0, r0, #0
_021E75DE:
	ldr r1, _021E75F4 @ =0x0000FFFF
	blx FUN_020F2998
	adds r1, r0, #1
	ldr r0, _021E75F4 @ =0x0000FFFF
	ldr r2, [r4, #4]
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_021E75F4: .4byte 0x0000FFFF
	thumb_func_end ov69_021E75A0

	thumb_func_start ov69_021E75F8
ov69_021E75F8: @ 0x021E75F8
	push {r3, r4, r5, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	subs r4, r3, r2
	bpl _021E7604
	rsbs r4, r4, #0
_021E7604:
	ldr r2, [r0, #4]
	ldr r0, [r1, #4]
	subs r5, r2, r0
	bpl _021E760E
	rsbs r5, r5, #0
_021E760E:
	movs r0, #0xb4
	bl FUN_0201FCD4
	cmp r4, r0
	ble _021E761C
	ldr r0, _021E7640 @ =0x0000FFFF
	subs r4, r0, r4
_021E761C:
	movs r0, #0xb4
	bl FUN_0201FCD4
	cmp r5, r0
	ble _021E762A
	ldr r0, _021E7640 @ =0x0000FFFF
	subs r5, r0, r5
_021E762A:
	adds r1, r4, #0
	adds r0, r5, #0
	muls r1, r4, r1
	muls r0, r5, r0
	adds r0, r1, r0
	lsls r0, r0, #0xc
	blx FUN_020CCBEC
	asrs r0, r0, #0xc
	pop {r3, r4, r5, pc}
	nop
_021E7640: .4byte 0x0000FFFF
	thumb_func_end ov69_021E75F8

	.rodata

_021E7644:
	.byte 0x06, 0x13, 0x0B, 0x0C, 0x06, 0x04, 0x25, 0x01, 0x06, 0x02, 0x01, 0x1B
	.byte 0x06, 0x04, 0xB3, 0x00, 0x02, 0x01, 0x15, 0x06, 0x02, 0x0F, 0xC1, 0x01, 0x02, 0x19, 0x15, 0x06
	.byte 0x02, 0x0F, 0xCD, 0x01, 0x06, 0x19, 0x0D, 0x06, 0x04, 0x04, 0x55, 0x01, 0x06, 0x02, 0x13, 0x1B
	.byte 0x04, 0x04, 0x6D, 0x01, 0x06, 0x03, 0x02, 0x1A, 0x0E, 0x04, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x12, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x0C, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x0C, 0x00, 0x10
	.byte 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	@ 0x021E77E0
