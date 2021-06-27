
	thumb_func_start ov60_021E5900
ov60_021E5900: @ 0x021E5900
	push {r4, lr}
	ldr r1, _021E59B4 @ =0x00007FFF
	adds r4, r0, #0
	movs r0, #0
	bl FUN_0200FBF4
	ldr r1, _021E59B4 @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
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
	ldr r0, _021E59B8 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E59BC @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	movs r2, #5
	movs r0, #3
	movs r1, #0x1e
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r1, #0xbe
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x1e
	bl FUN_02007280
	movs r2, #0xbe
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r1, #0x2e
	movs r0, #0x1e
	lsls r1, r1, #4
	str r0, [r4]
	movs r2, #0
	adds r0, r1, #0
	strh r2, [r4, r1]
	adds r0, #0x10
	str r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x14
	str r2, [r4, r0]
	subs r1, #0x10
	str r2, [r4, r1]
	bl ov60_021E5D7C
	adds r0, r4, #0
	bl ov60_021E6074
	adds r0, r4, #0
	bl ov60_021E5D9C
	ldr r0, _021E59C0 @ =ov60_021E5D44
	adds r1, r4, #0
	bl FUN_0201A0FC
	bl FUN_02022D24
	ldr r0, _021E59C4 @ =0x020F566C
	ldrb r1, [r0]
	movs r0, #0xb3
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	pop {r4, pc}
	nop
_021E59B4: .4byte 0x00007FFF
_021E59B8: .4byte 0xFFFFE0FF
_021E59BC: .4byte 0x04001000
_021E59C0: .4byte ov60_021E5D44
_021E59C4: .4byte 0x020F566C
	thumb_func_end ov60_021E5900

	thumb_func_start ov60_021E59C8
ov60_021E59C8: @ 0x021E59C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r5]
	cmp r0, #6
	bhi _021E5A04
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E59E6: @ jump table
	.2byte _021E59F4 - _021E59E6 - 2 @ case 0
	.2byte _021E5A20 - _021E59E6 - 2 @ case 1
	.2byte _021E5A38 - _021E59E6 - 2 @ case 2
	.2byte _021E5B62 - _021E59E6 - 2 @ case 3
	.2byte _021E5BD0 - _021E59E6 - 2 @ case 4
	.2byte _021E5C1C - _021E59E6 - 2 @ case 5
	.2byte _021E5C68 - _021E59E6 - 2 @ case 6
_021E59F4:
	adds r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	adds r0, #0xcc
	bl ov60_021E6244
	cmp r0, #1
	beq _021E5A06
_021E5A04:
	b _021E5C8E
_021E5A06:
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0xcc
	str r2, [r0]
	movs r0, #0xb9
	movs r1, #0x1e
	lsls r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E5C94 @ =0x021D110C
	str r2, [r0, #0x70]
	movs r0, #1
	str r0, [r5]
	b _021E5C8E
_021E5A20:
	movs r0, #0
	bl FUN_02004AD8
	movs r0, #1
	movs r1, #0x3f
	lsls r1, r1, #4
	adds r2, r0, #0
	bl FUN_02004EC4
	movs r0, #2
	str r0, [r5]
	b _021E5C8E
_021E5A38:
	movs r0, #0xb9
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E5A5A
	subs r1, r1, #1
	str r1, [r4, r0]
	movs r1, #0
	subs r0, #0x70
	str r1, [r4, r0]
	adds r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	adds r0, #0xcc
	bl ov60_021E641C
	b _021E5C8E
_021E5A5A:
	movs r1, #1
	subs r0, #0x70
	str r1, [r4, r0]
	adds r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	adds r0, #0xcc
	bl ov60_021E641C
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r1, [r4, r0]
	movs r2, #1
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, _021E5C94 @ =0x021D110C
	ldr r3, [r1, #0x48]
	adds r6, r3, #0
	ands r6, r2
	cmp r6, #1
	beq _021E5A94
	movs r7, #8
	ands r3, r7
	cmp r3, #8
	beq _021E5A94
	ldr r3, _021E5C98 @ =0x021D114C
	ldrh r3, [r3, #0x24]
	cmp r3, #0
	beq _021E5AD2
_021E5A94:
	movs r0, #0x2e
	movs r1, #1
	lsls r0, r0, #4
	strh r1, [r4, r0]
	movs r0, #0
	movs r1, #0x3c
	bl FUN_02005F50
	movs r0, #0xfa
	movs r1, #0
	bl FUN_02006218
	movs r0, #1
	movs r1, #0x30
	bl FUN_020054AC
	movs r0, #5
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x1e
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _021E5C9C @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	movs r0, #3
	str r0, [r5]
	b _021E5C8E
_021E5AD2:
	ldr r3, [r1, #0x44]
	movs r6, #0x46
	ands r6, r3
	cmp r6, #0x46
	bne _021E5AFE
	movs r1, #2
	subs r0, #0x10
	strh r1, [r4, r0]
	movs r0, #6
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5AFE:
	movs r6, #0x32
	lsls r6, r6, #6
	ands r3, r6
	cmp r3, r6
	bne _021E5B2A
	movs r1, #5
	subs r0, #0x10
	strh r1, [r4, r0]
	movs r0, #6
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5B2A:
	ldr r6, [r4, r0]
	ldr r3, _021E5CA0 @ =0x00000924
	cmp r6, r3
	ble _021E5B50
	movs r3, #3
	subs r0, #0x10
	strh r3, [r4, r0]
	str r2, [r1, #0x70]
	adds r0, r7, #0
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0
	movs r1, #0x3c
	bl FUN_02005F50
	movs r0, #5
	str r0, [r5]
	b _021E5C8E
_021E5B50:
	adds r0, r4, #0
	adds r0, #0xcc
	bl ov60_021E69D4
	adds r4, #0xcc
	adds r0, r4, #0
	bl ov60_021E6B08
	b _021E5C8E
_021E5B62:
	adds r0, r4, #0
	adds r0, #0xcc
	bl ov60_021E6B08
	movs r0, #0x9d
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	adds r0, #0xcc
	bl ov60_021E641C
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E5BA0
	movs r0, #0xc
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x1e
	str r0, [sp, #8]
	ldr r3, _021E5C9C @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #4
	str r0, [r5]
_021E5BA0:
	bl FUN_02005F88
	cmp r0, #0
	bne _021E5C8E
	movs r0, #0x3f
	lsls r0, r0, #4
	movs r1, #0
	bl FUN_02005EB4
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
	movs r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5BD0:
	adds r0, r4, #0
	adds r0, #0xcc
	bl ov60_021E6B08
	movs r0, #0x9d
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	adds r0, #0xcc
	bl ov60_021E641C
	bl FUN_02005F88
	cmp r0, #0
	bne _021E5C8E
	movs r0, #0x3f
	lsls r0, r0, #4
	movs r1, #0
	bl FUN_02005EB4
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
	movs r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5C1C:
	adds r0, r4, #0
	adds r0, #0xcc
	bl ov60_021E6B08
	movs r0, #0x9d
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	adds r0, #0xcc
	bl ov60_021E641C
	bl FUN_02005F88
	cmp r0, #0
	bne _021E5C8E
	movs r0, #0x3f
	lsls r0, r0, #4
	movs r1, #0
	bl FUN_02005EB4
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
	movs r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5C68:
	adds r0, r4, #0
	adds r0, #0xcc
	bl ov60_021E6B08
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021E5C8E
	adds r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	adds r0, #0xcc
	bl ov60_021E6544
	cmp r0, #1
	bne _021E5C8E
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E5C8E:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E5C94: .4byte 0x021D110C
_021E5C98: .4byte 0x021D114C
_021E5C9C: .4byte 0x00007FFF
_021E5CA0: .4byte 0x00000924
	thumb_func_end ov60_021E59C8

	thumb_func_start ov60_021E5CA4
ov60_021E5CA4: @ 0x021E5CA4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl FUN_02007290
	adds r6, r0, #0
	movs r0, #0x2e
	lsls r0, r0, #4
	ldrh r4, [r6, r0]
	movs r0, #0
	adds r1, r0, #0
	ldr r5, [r6]
	bl FUN_0201A0FC
	adds r0, r6, #0
	bl ov60_021E5DCC
	adds r0, r6, #0
	bl ov60_021E61C8
	adds r0, r7, #0
	bl FUN_02007294
	adds r0, r5, #0
	bl FUN_0201A9C4
	cmp r4, #5
	bhi _021E5CF2
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E5CE6: @ jump table
	.2byte _021E5CF2 - _021E5CE6 - 2 @ case 0
	.2byte _021E5CF2 - _021E5CE6 - 2 @ case 1
	.2byte _021E5CFE - _021E5CE6 - 2 @ case 2
	.2byte _021E5D0A - _021E5CE6 - 2 @ case 3
	.2byte _021E5CF2 - _021E5CE6 - 2 @ case 4
	.2byte _021E5D1A - _021E5CE6 - 2 @ case 5
_021E5CF2:
	movs r0, #0
	ldr r1, _021E5D2C @ =0x02108278
	mvns r0, r0
	bl FUN_02000EF4
	b _021E5D28
_021E5CFE:
	movs r0, #0
	ldr r1, _021E5D30 @ =0x0210820C
	mvns r0, r0
	bl FUN_02000EF4
	b _021E5D28
_021E5D0A:
	movs r0, #0
	bl FUN_02004AD8
	ldr r0, _021E5D34 @ =0x0000003C
	ldr r1, _021E5D38 @ =0x021EB030
	bl FUN_02000EF4
	b _021E5D28
_021E5D1A:
	movs r0, #0
	bl FUN_02004AD8
	ldr r0, _021E5D3C @ =0x0000003E
	ldr r1, _021E5D40 @ =0x021E68CC
	bl FUN_02000EF4
_021E5D28:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E5D2C: .4byte 0x02108278
_021E5D30: .4byte 0x0210820C
_021E5D34: .4byte 0x0000003C
_021E5D38: .4byte 0x021EB030
_021E5D3C: .4byte 0x0000003E
_021E5D40: .4byte 0x021E68CC
	thumb_func_end ov60_021E5CA4

	thumb_func_start ov60_021E5D44
ov60_021E5D44: @ 0x021E5D44
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5D66
	movs r0, #0
	bl FUN_0200FBE8
	movs r0, #1
	bl FUN_0200FBE8
	movs r0, #0xbd
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_021E5D66:
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5D74
	bl FUN_0200398C
_021E5D74:
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	pop {r4, pc}
	thumb_func_end ov60_021E5D44

	thumb_func_start ov60_021E5D7C
ov60_021E5D7C: @ 0x021E5D7C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5D98 @ =0x021EAF18
	add r3, sp, #0
	movs r2, #5
_021E5D86:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5D86
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E5D98: .4byte 0x021EAF18
	thumb_func_end ov60_021E5D7C

	thumb_func_start ov60_021E5D9C
ov60_021E5D9C: @ 0x021E5D9C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #4
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	movs r2, #1
	adds r3, r1, #0
	bl FUN_02026EB4
	str r0, [r4, #8]
	ldr r1, _021E5DC8 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	strh r0, [r1]
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021E5DC8: .4byte 0x04000008
	thumb_func_end ov60_021E5D9C

	thumb_func_start ov60_021E5DCC
ov60_021E5DCC: @ 0x021E5DCC
	ldr r3, _021E5DD4 @ =FUN_02026F54
	ldr r0, [r0, #8]
	bx r3
	nop
_021E5DD4: .4byte FUN_02026F54
	thumb_func_end ov60_021E5DCC

	thumb_func_start ov60_021E5DD8
ov60_021E5DD8: @ 0x021E5DD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r1, #0
	adds r5, r0, #0
	movs r1, #0
	adds r7, r2, #0
	ldr r4, [sp, #0x30]
	str r3, [sp]
	adds r2, r5, #0
	adds r0, r1, #0
_021E5DEC:
	str r0, [r2, #0x70]
	str r0, [r2, #0x60]
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #4
	blt _021E5DEC
	adds r0, r5, #0
	adds r0, #0x80
	adds r1, r4, #0
	movs r2, #4
	bl FUN_0201AC14
	movs r0, #0x2e
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_02007524
	adds r1, r5, #0
	adds r2, r5, #0
	str r0, [r5, #0x5c]
	adds r0, r5, #4
	adds r1, #0x58
	adds r2, #0x5c
	bl FUN_0201F51C
	ldr r0, [r5, #0x5c]
	blx FUN_020C3B50
	adds r6, r0, #0
	cmp r7, #0
	ble _021E5E5E
	movs r0, #0x2e
	adds r1, r7, #0
	adds r2, r4, #0
	bl FUN_02007524
	str r0, [r5, #0x60]
	movs r1, #0
	blx FUN_020C3B90
	adds r7, r0, #0
	adds r0, r5, #0
	ldr r2, [r5, #0x58]
	adds r0, #0x80
	adds r1, r7, #0
	blx FUN_020C2B7C
	str r0, [r5, #0x70]
	ldr r2, [r5, #0x58]
	adds r1, r7, #0
	adds r3, r6, #0
	blx FUN_020BE008
	ldr r1, [r5, #0x70]
	adds r0, r5, #4
	blx FUN_020BE294
_021E5E5E:
	ldr r0, [sp]
	cmp r0, #0
	ble _021E5E98
	ldr r1, [sp]
	movs r0, #0x2e
	adds r2, r4, #0
	bl FUN_02007524
	str r0, [r5, #0x64]
	movs r1, #0
	blx FUN_020C3B90
	adds r7, r0, #0
	adds r0, r5, #0
	ldr r2, [r5, #0x58]
	adds r0, #0x80
	adds r1, r7, #0
	blx FUN_020C2B7C
	str r0, [r5, #0x74]
	ldr r2, [r5, #0x58]
	adds r1, r7, #0
	adds r3, r6, #0
	blx FUN_020BE008
	ldr r1, [r5, #0x74]
	adds r0, r5, #4
	blx FUN_020BE294
_021E5E98:
	ldr r1, [sp, #0x28]
	cmp r1, #0
	ble _021E5ED0
	movs r0, #0x2e
	adds r2, r4, #0
	bl FUN_02007524
	str r0, [r5, #0x68]
	movs r1, #0
	blx FUN_020C3B90
	adds r7, r0, #0
	adds r0, r5, #0
	ldr r2, [r5, #0x58]
	adds r0, #0x80
	adds r1, r7, #0
	blx FUN_020C2B7C
	str r0, [r5, #0x78]
	ldr r2, [r5, #0x58]
	adds r1, r7, #0
	adds r3, r6, #0
	blx FUN_020BE008
	ldr r1, [r5, #0x78]
	adds r0, r5, #4
	blx FUN_020BE294
_021E5ED0:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	ble _021E5F08
	movs r0, #0x2e
	adds r2, r4, #0
	bl FUN_02007524
	str r0, [r5, #0x6c]
	movs r1, #0
	blx FUN_020C3B90
	adds r4, r0, #0
	adds r0, r5, #0
	ldr r2, [r5, #0x58]
	adds r0, #0x80
	adds r1, r4, #0
	blx FUN_020C2B7C
	str r0, [r5, #0x7c]
	ldr r2, [r5, #0x58]
	adds r1, r4, #0
	adds r3, r6, #0
	blx FUN_020BE008
	ldr r1, [r5, #0x7c]
	adds r0, r5, #4
	blx FUN_020BE294
_021E5F08:
	ldr r6, _021E5F44 @ =0x021EAE30
	add r3, sp, #4
	movs r2, #0
	str r2, [r3]
	str r2, [r3, #4]
	adds r4, r5, #0
	ldm r6!, {r0, r1}
	str r2, [r3, #8]
	adds r4, #0x90
	stm r4!, {r0, r1}
	ldr r0, [r6]
	ldr r6, _021E5F48 @ =0x021EAE24
	str r0, [r4]
	adds r4, r5, #0
	ldm r6!, {r0, r1}
	adds r4, #0x9c
	stm r4!, {r0, r1}
	ldr r0, [r6]
	str r0, [r4]
	adds r4, r5, #0
	ldm r3!, {r0, r1}
	adds r4, #0xa8
	stm r4!, {r0, r1}
	ldr r0, [r3]
	adds r5, #0xb8
	str r0, [r4]
	str r2, [r5]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5F44: .4byte 0x021EAE30
_021E5F48: .4byte 0x021EAE24
	thumb_func_end ov60_021E5DD8

	thumb_func_start ov60_021E5F4C
ov60_021E5F4C: @ 0x021E5F4C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r7, #0
	movs r4, #0
	adds r5, r7, #0
	adds r6, #0x80
_021E5F58:
	ldr r1, [r5, #0x70]
	cmp r1, #0
	beq _021E5F6A
	adds r0, r6, #0
	blx FUN_020C2BA0
	ldr r0, [r5, #0x60]
	bl FUN_0201AB0C
_021E5F6A:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E5F58
	ldr r0, [r7, #0x5c]
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov60_021E5F4C

	thumb_func_start ov60_021E5F7C
ov60_021E5F7C: @ 0x021E5F7C
	push {r3, r4, r5, r6}
	cmp r1, #0
	bne _021E5F9A
	movs r3, #0
	adds r1, r3, #0
_021E5F86:
	ldr r2, [r0]
	cmp r2, #0
	beq _021E5F8E
	str r1, [r2]
_021E5F8E:
	adds r3, r3, #1
	adds r0, r0, #4
	cmp r3, #4
	blt _021E5F86
	pop {r3, r4, r5, r6}
	bx lr
_021E5F9A:
	movs r4, #0
	adds r5, r4, #0
_021E5F9E:
	ldr r3, [r0]
	cmp r3, #0
	beq _021E5FBA
	ldr r2, [r3]
	adds r2, r2, r1
	str r2, [r3]
	ldr r3, [r0]
	ldr r6, [r3, #8]
	ldr r2, [r3]
	ldrh r6, [r6, #4]
	lsls r6, r6, #0xc
	cmp r2, r6
	bne _021E5FBA
	str r5, [r3]
_021E5FBA:
	adds r4, r4, #1
	adds r0, r0, #4
	cmp r4, #4
	blt _021E5F9E
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov60_021E5F7C

	thumb_func_start ov60_021E5FC8
ov60_021E5FC8: @ 0x021E5FC8
	push {r4, r5, lr}
	sub sp, #0x24
	ldr r5, _021E6070 @ =0x021EAEF4
	adds r4, r0, #0
	add r3, sp, #0
	movs r2, #4
_021E5FD4:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E5FD4
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4]
	cmp r0, #0
	beq _021E606A
	cmp r0, #1
	beq _021E5FF2
	cmp r0, #2
	beq _021E6006
	add sp, #0x24
	pop {r4, r5, pc}
_021E5FF2:
	bl FUN_02026E48
	movs r0, #0
	movs r1, #1
	bl FUN_02026E50
	movs r0, #0
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, pc}
_021E6006:
	bl FUN_02026E48
	bl FUN_02023154
	adds r1, r4, #0
	add r0, sp, #0
	adds r1, #0xa8
	bl FUN_02020D2C
	adds r1, r4, #0
	adds r3, r4, #0
	adds r0, r4, #4
	adds r1, #0x90
	add r2, sp, #0
	adds r3, #0x9c
	bl FUN_0201F554
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _021E603E
	cmp r0, #1
	beq _021E604C
	cmp r0, #2
	beq _021E605E
	add sp, #0x24
	pop {r4, r5, pc}
_021E603E:
	adds r4, #0x70
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021E5F7C
	add sp, #0x24
	pop {r4, r5, pc}
_021E604C:
	ldr r0, [r4, #0x70]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E605E
	movs r0, #0
	adds r4, #0xb8
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, pc}
_021E605E:
	adds r4, #0x70
	movs r1, #1
	adds r0, r4, #0
	lsls r1, r1, #0xc
	bl ov60_021E5F7C
_021E606A:
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021E6070: .4byte 0x021EAEF4
	thumb_func_end ov60_021E5FC8

	thumb_func_start ov60_021E6074
ov60_021E6074: @ 0x021E6074
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AC88
	add r3, sp, #0xa8
	ldr r5, _021E61AC @ =0x021EAE3C
	str r0, [r4, #4]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E61B0 @ =0x021EAEA0
	add r3, sp, #0x8c
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
	ldr r5, _021E61B4 @ =0x021EAEBC
	add r3, sp, #0x70
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
	ldr r5, _021E61B8 @ =0x021EAE4C
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
	ldr r0, [r4, #4]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021E61BC @ =0x021EAE68
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
	ldr r0, [r4, #4]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021E61C0 @ =0x021EAE84
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
	ldr r0, [r4, #4]
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021E61C4 @ =0x021EAED8
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
	ldr r0, [r4, #4]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
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
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021E61AC: .4byte 0x021EAE3C
_021E61B0: .4byte 0x021EAEA0
_021E61B4: .4byte 0x021EAEBC
_021E61B8: .4byte 0x021EAE4C
_021E61BC: .4byte 0x021EAE68
_021E61C0: .4byte 0x021EAE84
_021E61C4: .4byte 0x021EAED8
	thumb_func_end ov60_021E6074

	thumb_func_start ov60_021E61C8
ov60_021E61C8: @ 0x021E61C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
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
	ldr r0, [r4, #4]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov60_021E61C8

	thumb_func_start ov60_021E6244
ov60_021E6244: @ 0x021E6244
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl ov60_021E68B0
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl ov60_021E65B4
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	cmp r0, #7
	bne _021E6294
	movs r0, #0x1d
	str r0, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	adds r0, r5, #4
	movs r1, #0x19
	movs r2, #0x1a
	movs r3, #0x1b
	str r4, [sp, #8]
	bl ov60_021E5DD8
	movs r3, #0x28
	str r3, [sp]
	subs r3, #0x29
	adds r0, r5, #0
	str r3, [sp, #4]
	adds r0, #0xc0
	movs r1, #0x26
	movs r2, #0x27
	str r4, [sp, #8]
	bl ov60_021E5DD8
	b _021E62C0
_021E6294:
	movs r0, #0x17
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #4
	movs r1, #0x14
	movs r2, #0x15
	movs r3, #0x16
	str r4, [sp, #8]
	bl ov60_021E5DD8
	movs r3, #0x2b
	str r3, [sp]
	subs r3, #0x2c
	adds r0, r5, #0
	str r3, [sp, #4]
	adds r0, #0xc0
	movs r1, #0x29
	movs r2, #0x2a
	str r4, [sp, #8]
	bl ov60_021E5DD8
_021E62C0:
	ldr r0, _021E6408 @ =0x04000060
	ldr r2, _021E640C @ =0xFFFFCFFF
	ldrh r1, [r0]
	adds r3, r1, #0
	ands r3, r2
	movs r1, #0x10
	orrs r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	ands r2, r1
	movs r1, #8
	orrs r1, r2
	strh r1, [r0]
	movs r0, #0x71
	lsls r0, r0, #2
	adds r1, r0, #0
	ldr r2, [r5, r0]
	subs r1, #0x34
	str r2, [r5, r1]
	adds r1, r0, #4
	ldr r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x30
	str r2, [r5, r1]
	adds r1, r0, #0
	adds r1, #8
	ldr r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x2c
	str r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x18
	ldr r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x28
	str r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x14
	ldr r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x24
	str r2, [r5, r1]
	adds r1, r0, #0
	subs r1, #0x10
	ldr r1, [r5, r1]
	subs r0, #0x20
	str r1, [r5, r0]
	adds r0, r4, #0
	bl FUN_02023114
	adds r1, r5, #0
	adds r1, #0xb8
	str r0, [r1]
	movs r3, #0
	adds r0, r5, #0
	movs r1, #0x19
	movs r2, #0xb6
	str r3, [sp]
	adds r0, #0xb8
	ldr r0, [r0]
	lsls r1, r1, #4
	str r0, [sp, #4]
	adds r0, r5, r1
	adds r1, #0xc
	adds r1, r5, r1
	lsls r2, r2, #4
	bl FUN_02023308
	adds r2, r5, #0
	adds r2, #0xb8
	movs r1, #2
	ldr r2, [r2]
	movs r0, #0
	lsls r1, r1, #0xa
	bl FUN_02023240
	adds r1, r5, #0
	adds r1, #0xb8
	ldr r1, [r1]
	movs r0, #0
	bl FUN_020233D8
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_0202313C
	movs r3, #0x77
	lsls r3, r3, #2
	adds r2, r3, #2
	ldrsh r1, [r5, r3]
	adds r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	movs r0, #0
	blx FUN_020BF034
	ldr r1, _021E6410 @ =0x00007FFF
	movs r0, #0
	blx FUN_020BF070
	ldr r3, _021E6414 @ =0x000001E2
	movs r0, #1
	adds r2, r3, #2
	ldrsh r1, [r5, r3]
	adds r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	blx FUN_020BF034
	ldr r1, _021E6410 @ =0x00007FFF
	movs r0, #1
	blx FUN_020BF070
	ldr r2, _021E6408 @ =0x04000060
	ldr r0, _021E640C @ =0xFFFFCFFF
	ldrh r1, [r2]
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _021E6418 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r1, #2
	adds r0, r5, #0
	str r1, [r5, #4]
	adds r0, #0xc0
	str r1, [r0]
	movs r0, #0x7f
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	subs r0, r0, #4
	str r1, [r5, r0]
	movs r0, #0x1e
	bl FUN_020030E8
	movs r1, #0x81
	lsls r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	lsls r2, r1, #9
	movs r3, #0x1e
	bl FUN_02003120
	movs r0, #0x81
	lsls r0, r0, #2
	movs r1, #1
	ldr r0, [r5, r0]
	movs r2, #0
	lsls r3, r1, #9
	bl FUN_020032A4
	movs r0, #0x82
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E6408: .4byte 0x04000060
_021E640C: .4byte 0xFFFFCFFF
_021E6410: .4byte 0x00007FFF
_021E6414: .4byte 0x000001E2
_021E6418: .4byte 0x021D116C
	thumb_func_end ov60_021E6244

	thumb_func_start ov60_021E641C
ov60_021E641C: @ 0x021E641C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	movs r4, #0
	cmp r0, #0
	beq _021E642E
	cmp r0, #1
	beq _021E64D2
	b _021E651A
_021E642E:
	adds r1, r5, #0
	movs r0, #0x1d
	adds r1, #0xb8
	lsls r0, r0, #4
	ldr r1, [r1]
	adds r0, r5, r0
	bl FUN_0202365C
	adds r1, r5, #0
	movs r0, #0x6e
	adds r1, #0xb8
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r0, r5, r0
	bl FUN_0202366C
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	adds r0, r4, #0
	bl FUN_0200FBE8
	movs r0, #1
	bl FUN_0200FBE8
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	bl FUN_0200B4F0
	adds r0, r4, #0
	movs r1, #7
	movs r2, #2
	bl FUN_0200B4F0
	movs r0, #0x1f
	str r0, [sp]
	ldr r0, _021E653C @ =0x04001050
	movs r1, #4
	movs r2, #0x39
	adds r3, r4, #0
	blx FUN_020CF15C
	adds r0, r5, #0
	movs r1, #2
	adds r0, #0xbc
	str r1, [r0]
	movs r0, #0x5e
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r1, _021E6540 @ =0x00007FFF
	movs r0, #1
	blx FUN_020BF070
	movs r0, #0x5f
	adds r1, r4, #0
	lsls r0, r0, #2
	strh r1, [r5, r0]
	movs r0, #1
	str r0, [r5]
	b _021E651A
_021E64D2:
	movs r0, #0x6a
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #1
	bne _021E64FC
	subs r0, #0x2c
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _021E64EE
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	b _021E6504
_021E64EE:
	cmp r0, #0x1e
	bne _021E6504
	movs r0, #8
	adds r1, r4, #0
	bl FUN_02022C60
	b _021E6504
_021E64FC:
	movs r0, #8
	adds r1, r4, #0
	bl FUN_02022C60
_021E6504:
	movs r0, #0x5f
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	adds r1, r1, #1
	strh r1, [r5, r0]
	ldrh r1, [r5, r0]
	cmp r1, #0x2d
	blo _021E6518
	movs r1, #0
	strh r1, [r5, r0]
_021E6518:
	movs r4, #1
_021E651A:
	adds r0, r5, #4
	bl ov60_021E5FC8
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov60_021E5FC8
	movs r0, #0
	movs r1, #1
	bl FUN_02026E50
	adds r0, r5, #0
	bl ov60_021E67E8
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E653C: .4byte 0x04001050
_021E6540: .4byte 0x00007FFF
	thumb_func_end ov60_021E641C

	thumb_func_start ov60_021E6544
ov60_021E6544: @ 0x021E6544
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x81
	lsls r0, r0, #2
	adds r4, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	adds r6, r2, #0
	bl FUN_02003150
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02003104
	movs r0, #0x81
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_02023120
	adds r0, r5, #4
	bl ov60_021E5F4C
	adds r0, r5, #0
	adds r0, #0xc0
	bl ov60_021E5F4C
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl ov60_021E68A0
	ldr r2, _021E65A8 @ =0x04000050
	movs r3, #0
	strh r3, [r2]
	adds r2, #0x10
	ldrh r1, [r2]
	ldr r0, _021E65AC @ =0x0000CFDF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _021E65B0 @ =0x021D116C
	strb r3, [r0, #9]
	bl FUN_02022D3C
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E65A8: .4byte 0x04000050
_021E65AC: .4byte 0x0000CFDF
_021E65B0: .4byte 0x021D116C
	thumb_func_end ov60_021E6544

	thumb_func_start ov60_021E65B4
ov60_021E65B4: @ 0x021E65B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	movs r0, #2
	adds r4, r2, #0
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	adds r5, r1, #0
	cmp r0, #7
	bne _021E65F6
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x2e
	movs r1, #0x22
	adds r2, r6, #0
	movs r3, #7
	str r5, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x2e
	movs r1, #0x23
	adds r2, r6, #0
	movs r3, #7
	str r5, [sp, #0xc]
	bl FUN_02007914
	b _021E6622
_021E65F6:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x2e
	movs r1, #0x24
	adds r2, r6, #0
	movs r3, #7
	str r5, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x2e
	movs r1, #0x25
	adds r2, r6, #0
	movs r3, #7
	str r5, [sp, #0xc]
	bl FUN_02007914
_021E6622:
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	adds r3, r5, #0
	bl FUN_0201C1C4
	adds r0, r6, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #7
	bne _021E6646
	movs r1, #4
	movs r7, #0xd
	b _021E664A
_021E6646:
	movs r1, #2
	movs r7, #0xe
_021E664A:
	movs r3, #0
	str r3, [sp]
	movs r0, #0x2e
	movs r2, #4
	str r5, [sp, #4]
	bl FUN_02007938
	movs r2, #0
	str r2, [sp]
	movs r0, #0x2e
	adds r1, r7, #0
	adds r3, r2, #0
	str r5, [sp, #4]
	bl FUN_02007938
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #7
	bne _021E6678
	movs r1, #3
	movs r7, #4
	b _021E667C
_021E6678:
	movs r1, #1
	movs r7, #2
_021E667C:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x2e
	adds r2, r6, #0
	movs r3, #6
	str r5, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	movs r0, #0x2e
	adds r1, r7, #0
	movs r2, #6
	lsls r3, r3, #0xe
	str r5, [sp, #4]
	bl FUN_02007938
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x2e
	adds r2, r6, #0
	movs r3, #6
	str r5, [sp, #0xc]
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x2e
	movs r1, #0xf
	adds r2, r6, #0
	movs r3, #5
	str r5, [sp, #0xc]
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x2e
	movs r1, #0x11
	adds r2, r6, #0
	movs r3, #5
	str r5, [sp, #0xc]
	bl FUN_02007914
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #5
	movs r1, #0
	bl FUN_0201C2D8
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	adds r3, r5, #0
	bl FUN_0201C1C4
	ldr r2, _021E67D0 @ =0x000002CF
	movs r0, #1
	movs r1, #0x1b
	adds r3, r5, #0
	bl FUN_0200BAF8
	adds r7, r0, #0
	movs r0, #0x40
	adds r1, r5, #0
	bl FUN_02026354
	movs r1, #6
	lsls r1, r1, #6
	adds r5, r0, #0
	ldr r2, _021E67D4 @ =_021EAE1C
	adds r0, r6, #0
	adds r1, r4, r1
	bl FUN_0201D4F8
	movs r1, #1
	lsls r1, r1, #8
	str r1, [sp]
	movs r0, #0x10
	adds r1, #0x80
	str r0, [sp, #4]
	adds r0, r4, r1
	movs r1, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	adds r0, r7, #0
	movs r1, #0
	adds r2, r5, #0
	bl FUN_0200BB6C
	movs r0, #0
	adds r1, r5, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r0, #2
	lsls r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #7
	bne _021E677C
	movs r1, #0
	str r1, [sp]
	ldr r2, _021E67D8 @ =0x00010100
	str r1, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	subs r0, #0x80
	str r1, [sp, #0x10]
	adds r0, r4, r0
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0x14]
	bl FUN_02020150
	b _021E679A
_021E677C:
	movs r1, #0
	str r1, [sp]
	ldr r2, _021E67DC @ =0x00020200
	str r1, [sp, #4]
	str r2, [sp, #8]
	movs r2, #1
	str r2, [sp, #0xc]
	subs r0, #0x80
	str r1, [sp, #0x10]
	adds r0, r4, r0
	adds r2, r5, #0
	adds r3, r1, #0
	str r1, [sp, #0x14]
	bl FUN_02020150
_021E679A:
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	ldr r1, _021E67E0 @ =0x0000011B
	add r0, sp, #0x18
	strh r1, [r0, #2]
	ldr r1, _021E67E4 @ =0x00007F80
	movs r2, #2
	strh r1, [r0]
	add r1, sp, #0x18
	movs r0, #3
	adds r1, #2
	movs r3, #0x42
	bl FUN_0201C260
	movs r0, #3
	add r1, sp, #0x18
	movs r2, #2
	movs r3, #0x44
	bl FUN_0201C260
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E67D0: .4byte 0x000002CF
_021E67D4: .4byte _021EAE1C
_021E67D8: .4byte 0x00010100
_021E67DC: .4byte 0x00020200
_021E67E0: .4byte 0x0000011B
_021E67E4: .4byte 0x00007F80
	thumb_func_end ov60_021E65B4

	thumb_func_start ov60_021E67E8
ov60_021E67E8: @ 0x021E67E8
	push {r3, lr}
	sub sp, #8
	movs r1, #0x82
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	cmp r2, #3
	bhi _021E687A
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E6802: @ jump table
	.2byte _021E680A - _021E6802 - 2 @ case 0
	.2byte _021E681A - _021E6802 - 2 @ case 1
	.2byte _021E683E - _021E6802 - 2 @ case 2
	.2byte _021E6862 - _021E6802 - 2 @ case 3
_021E680A:
	movs r2, #1
	str r2, [r0, r1]
	adds r2, r1, #4
	movs r3, #0
	str r3, [r0, r2]
	adds r1, #8
	str r3, [r0, r1]
	b _021E687A
_021E681A:
	adds r2, r1, #0
	adds r2, #8
	ldr r2, [r0, r2]
	adds r3, r2, #1
	adds r2, r1, #0
	adds r2, #8
	str r3, [r0, r2]
	adds r2, r1, #0
	adds r2, #8
	ldr r2, [r0, r2]
	cmp r2, #0x3c
	ble _021E687A
	movs r3, #0
	adds r2, r1, #4
	str r3, [r0, r2]
	movs r2, #2
	str r2, [r0, r1]
	b _021E687A
_021E683E:
	adds r2, r1, #0
	adds r2, #8
	ldr r2, [r0, r2]
	subs r3, r2, #1
	adds r2, r1, #0
	adds r2, #8
	str r3, [r0, r2]
	adds r2, r1, #0
	adds r2, #8
	ldr r2, [r0, r2]
	cmp r2, #0
	bne _021E687A
	movs r2, #3
	str r2, [r0, r1]
	movs r2, #0
	adds r1, r1, #4
	str r2, [r0, r1]
	b _021E687A
_021E6862:
	adds r2, r1, #4
	ldr r2, [r0, r2]
	adds r3, r2, #1
	adds r2, r1, #4
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0x14
	ble _021E687A
	movs r2, #0
	str r2, [r0, r1]
	adds r1, r1, #4
	str r2, [r0, r1]
_021E687A:
	movs r1, #0x21
	lsls r1, r1, #4
	ldr r2, [r0, r1]
	subs r1, #0xc
	str r2, [sp]
	ldr r2, _021E689C @ =0x0000318C
	movs r3, #0xa0
	str r2, [sp, #4]
	ldr r0, [r0, r1]
	movs r2, #0xff
	movs r1, #2
	lsls r2, r2, #8
	bl FUN_020040AC
	add sp, #8
	pop {r3, pc}
	nop
_021E689C: .4byte 0x0000318C
	thumb_func_end ov60_021E67E8

	thumb_func_start ov60_021E68A0
ov60_021E68A0: @ 0x021E68A0
	movs r0, #6
	lsls r0, r0, #6
	ldr r3, _021E68AC @ =FUN_0201D520
	adds r0, r2, r0
	bx r3
	nop
_021E68AC: .4byte FUN_0201D520
	thumb_func_end ov60_021E68A0

	thumb_func_start ov60_021E68B0
ov60_021E68B0: @ 0x021E68B0
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #2
	lsls r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #7
	bne _021E68F2
	adds r2, r0, #0
	movs r1, #0
	subs r2, #0x54
	str r1, [r4, r2]
	movs r3, #0x41
	adds r2, r0, #0
	lsls r3, r3, #0xc
	subs r2, #0x50
	str r3, [r4, r2]
	movs r3, #0x12
	adds r2, r0, #0
	lsls r3, r3, #0xe
	subs r2, #0x4c
	str r3, [r4, r2]
	adds r2, r0, #0
	ldr r3, _021E69B4 @ =0x00271000
	subs r2, #0x48
	str r3, [r4, r2]
	movs r3, #0x26
	adds r2, r0, #0
	lsls r3, r3, #0xe
	subs r2, #0x44
	str r3, [r4, r2]
	lsls r3, r0, #0xb
	b _021E6924
_021E68F2:
	adds r2, r0, #0
	movs r1, #0
	subs r2, #0x54
	str r1, [r4, r2]
	movs r3, #0x41
	adds r2, r0, #0
	lsls r3, r3, #0xc
	subs r2, #0x50
	str r3, [r4, r2]
	movs r3, #0x12
	adds r2, r0, #0
	lsls r3, r3, #0xe
	subs r2, #0x4c
	str r3, [r4, r2]
	movs r3, #0x69
	adds r2, r0, #0
	lsls r3, r3, #0xe
	subs r2, #0x48
	str r3, [r4, r2]
	movs r3, #0x57
	adds r2, r0, #0
	lsls r3, r3, #0xc
	subs r2, #0x44
	str r3, [r4, r2]
	ldr r3, _021E69B8 @ =0x0014B000
_021E6924:
	adds r2, r0, #0
	subs r2, #0x40
	str r3, [r4, r2]
	adds r2, r0, #0
	subs r2, #0x3c
	str r1, [r4, r2]
	movs r3, #0x5a
	adds r2, r0, #0
	lsls r3, r3, #0xc
	subs r2, #0x38
	str r3, [r4, r2]
	adds r2, r0, #0
	subs r2, #0x34
	str r1, [r4, r2]
	adds r2, r0, #0
	ldr r3, _021E69BC @ =0xFFFFE000
	subs r2, #0x30
	str r3, [r4, r2]
	movs r3, #0x1f
	adds r2, r0, #0
	lsls r3, r3, #0xe
	subs r2, #0x2c
	str r3, [r4, r2]
	adds r2, r0, #0
	ldr r3, _021E69C0 @ =0xFFFDA000
	subs r2, #0x28
	str r3, [r4, r2]
	adds r2, r0, #0
	subs r2, #0x24
	strh r1, [r4, r2]
	adds r2, r0, #0
	ldr r3, _021E69C4 @ =0x00000A2B
	subs r2, #0x22
	strh r3, [r4, r2]
	adds r2, r0, #0
	subs r2, #0x20
	strh r1, [r4, r2]
	adds r2, r0, #0
	subs r2, #0x1e
	strh r1, [r4, r2]
	adds r2, r0, #0
	ldr r3, _021E69C8 @ =0x000007A1
	subs r2, #0x1c
	strh r3, [r4, r2]
	adds r2, r0, #0
	subs r2, #0x1a
	strh r1, [r4, r2]
	movs r1, #3
	lsls r1, r1, #0xc
	subs r0, #0x14
	str r1, [r4, r0]
	movs r1, #0
	ldr r0, _021E69C4 @ =0x00000A2B
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r0, sp, #0xc
	add r1, sp, #0
	blx FUN_020CCFE0
	movs r0, #0x77
	ldr r1, [sp]
	lsls r0, r0, #2
	strh r1, [r4, r0]
	adds r1, r0, #2
	ldr r2, [sp, #4]
	adds r0, r0, #4
	strh r2, [r4, r1]
	ldr r1, [sp, #8]
	strh r1, [r4, r0]
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
_021E69B4: .4byte 0x00271000
_021E69B8: .4byte 0x0014B000
_021E69BC: .4byte 0xFFFFE000
_021E69C0: .4byte 0xFFFDA000
_021E69C4: .4byte 0x00000A2B
_021E69C8: .4byte 0x000007A1
	thumb_func_end ov60_021E68B0

	thumb_func_start ov60_021E69CC
ov60_021E69CC: @ 0x021E69CC
	cmp r0, #0
	bge _021E69D2
	rsbs r0, r0, #0
_021E69D2:
	bx lr
	thumb_func_end ov60_021E69CC

	thumb_func_start ov60_021E69D4
ov60_021E69D4: @ 0x021E69D4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r5, r0]
	cmp r0, #7
	bne _021E69E8
	ldr r4, _021E6AFC @ =0x021EAF40
	b _021E69EA
_021E69E8:
	ldr r4, _021E6B00 @ =0x021EAF90
_021E69EA:
	movs r2, #0x7d
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	movs r3, #0x1e
	adds r0, r0, #1
	str r0, [r5, r2]
	subs r0, r2, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r2]
	lsls r0, r0, #4
	adds r0, r4, r0
	ldr r6, [r0, #0xc]
	muls r3, r6, r3
	cmp r1, r3
	ble _021E6AF6
	subs r2, #0x3c
	adds r1, r5, r2
	add r2, sp, #0
	blx FUN_020CCDAC
	movs r0, #1
	ldr r1, [sp]
	lsls r0, r0, #0xc
	cmp r1, r0
	ble _021E6A2A
	movs r1, #0x6e
	lsls r1, r1, #2
	movs r0, #5
	ldr r2, [r5, r1]
	lsls r0, r0, #0xc
	adds r0, r2, r0
	str r0, [r5, r1]
_021E6A2A:
	ldr r1, [sp]
	ldr r0, _021E6B04 @ =0xFFFFF000
	cmp r1, r0
	bge _021E6A40
	movs r1, #0x6e
	lsls r1, r1, #2
	movs r0, #5
	ldr r2, [r5, r1]
	lsls r0, r0, #0xc
	subs r0, r2, r0
	str r0, [r5, r1]
_021E6A40:
	movs r0, #1
	ldr r1, [sp, #4]
	lsls r0, r0, #0xc
	cmp r1, r0
	ble _021E6A58
	movs r1, #0x6f
	lsls r1, r1, #2
	movs r0, #5
	ldr r2, [r5, r1]
	lsls r0, r0, #0xc
	adds r0, r2, r0
	str r0, [r5, r1]
_021E6A58:
	ldr r1, [sp, #4]
	ldr r0, _021E6B04 @ =0xFFFFF000
	cmp r1, r0
	bge _021E6A6E
	movs r1, #0x6f
	lsls r1, r1, #2
	movs r0, #5
	ldr r2, [r5, r1]
	lsls r0, r0, #0xc
	subs r0, r2, r0
	str r0, [r5, r1]
_021E6A6E:
	movs r0, #1
	ldr r1, [sp, #8]
	lsls r0, r0, #0xc
	cmp r1, r0
	ble _021E6A86
	movs r1, #7
	lsls r1, r1, #6
	movs r0, #5
	ldr r2, [r5, r1]
	lsls r0, r0, #0xc
	adds r0, r2, r0
	str r0, [r5, r1]
_021E6A86:
	ldr r1, [sp, #8]
	ldr r0, _021E6B04 @ =0xFFFFF000
	cmp r1, r0
	bge _021E6A9C
	movs r1, #7
	lsls r1, r1, #6
	movs r0, #5
	ldr r2, [r5, r1]
	lsls r0, r0, #0xc
	subs r0, r2, r0
	str r0, [r5, r1]
_021E6A9C:
	adds r1, r5, #0
	movs r0, #0x6e
	adds r1, #0xb8
	lsls r0, r0, #2
	ldr r1, [r1]
	adds r0, r5, r0
	bl FUN_0202366C
	ldr r0, [sp]
	bl ov60_021E69CC
	movs r1, #1
	lsls r1, r1, #0xc
	cmp r0, r1
	bgt _021E6AF6
	ldr r0, [sp, #4]
	bl ov60_021E69CC
	movs r1, #1
	lsls r1, r1, #0xc
	cmp r0, r1
	bgt _021E6AF6
	ldr r0, [sp, #8]
	bl ov60_021E69CC
	movs r1, #1
	lsls r1, r1, #0xc
	cmp r0, r1
	bgt _021E6AF6
	movs r1, #0x7d
	lsls r1, r1, #2
	movs r0, #0
	str r0, [r5, r1]
	subs r2, r1, #4
	ldr r2, [r5, r2]
	adds r3, r2, #1
	subs r2, r1, #4
	str r3, [r5, r2]
	ldr r2, [r5, r2]
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	cmp r2, #0
	bne _021E6AF6
	subs r1, r1, #4
	str r0, [r5, r1]
_021E6AF6:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E6AFC: .4byte 0x021EAF40
_021E6B00: .4byte 0x021EAF90
_021E6B04: .4byte 0xFFFFF000
	thumb_func_end ov60_021E69D4

	thumb_func_start ov60_021E6B08
ov60_021E6B08: @ 0x021E6B08
	push {r3, lr}
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	adds r2, r2, #1
	str r2, [r0, r1]
	ldr r2, [r0, r1]
	cmp r2, #3
	ble _021E6B5A
	subs r2, r1, #4
	ldr r3, [r0, r2]
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	asrs r2, r2, #1
	lsls r3, r2, #0x10
	ldr r2, _021E6B5C @ =0x01FF0000
	ands r3, r2
	ldr r2, _021E6B60 @ =0x04001018
	str r3, [r2]
	subs r2, r1, #4
	ldr r2, [r0, r2]
	adds r3, r2, #1
	subs r2, r1, #4
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0x1f
	ble _021E6B44
	movs r2, #0x1f
	subs r1, r1, #4
	str r2, [r0, r1]
_021E6B44:
	movs r1, #0x7e
	lsls r1, r1, #2
	ldr r3, [r0, r1]
	movs r0, #0x1f
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _021E6B64 @ =0x04001050
	movs r1, #4
	movs r2, #0x39
	blx FUN_020CF15C
_021E6B5A:
	pop {r3, pc}
	.align 2, 0
_021E6B5C: .4byte 0x01FF0000
_021E6B60: .4byte 0x04001018
_021E6B64: .4byte 0x04001050
	thumb_func_end ov60_021E6B08

	thumb_func_start ov60_021E6B68
ov60_021E6B68: @ 0x021E6B68
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200B528
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	movs r2, #0x1a
	movs r0, #3
	movs r1, #0x4a
	lsls r2, r2, #0xe
	bl FUN_0201A910
	ldr r1, _021E6BFC @ =0x0000062C
	adds r0, r4, #0
	movs r2, #0x4a
	bl FUN_02007280
	ldr r2, _021E6BFC @ =0x0000062C
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x4a
	str r0, [r4]
	movs r1, #0
	ldr r0, _021E6C00 @ =0x00000628
	str r1, [r4, #8]
	strb r1, [r4, r0]
	ldr r0, _021E6C04 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	bl FUN_0201FD2C
	movs r1, #0x53
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	bl FUN_0201FD38
	ldr r0, [r4]
	bl FUN_0201AC88
	str r0, [r4, #0xc]
	bl ov60_021E6E14
	adds r0, r4, #0
	bl ov60_021E6E40
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021E6BFC: .4byte 0x0000062C
_021E6C00: .4byte 0x00000628
_021E6C04: .4byte 0x021D116C
	thumb_func_end ov60_021E6B68

	thumb_func_start ov60_021E6C08
ov60_021E6C08: @ 0x021E6C08
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _021E6CE0 @ =0x00000628
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E6C4A
	ldr r0, _021E6CE4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _021E6C32
	movs r0, #8
	tst r0, r1
	bne _021E6C32
	ldr r0, _021E6CE8 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6C4A
_021E6C32:
	movs r0, #1
	str r0, [r4, #8]
	ldr r1, _021E6CE4 @ =0x021D110C
	movs r0, #0
	str r0, [r1, #0x70]
	ldr r1, _021E6CEC @ =0x00007FFF
	bl FUN_0200FBF4
	ldr r1, _021E6CEC @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
_021E6C4A:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E6C5A
	cmp r0, #1
	beq _021E6C78
	cmp r0, #2
	beq _021E6CBC
	b _021E6CC0
_021E6C5A:
	ldr r0, _021E6CE0 @ =0x00000628
	movs r2, #1
	adds r1, r4, r0
	movs r0, #0x55
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r1, #0xfb
	movs r0, #2
	lsls r1, r1, #2
	bl FUN_02004EC4
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E6CC4
_021E6C78:
	adds r0, r4, #0
	bl ov60_021E7900
	ldr r2, _021E6CF0 @ =0x0000062B
	adds r1, r0, #0
	ldrb r2, [r4, r2]
	adds r0, r4, #0
	lsls r3, r2, #2
	ldr r2, _021E6CF4 @ =0x021EB860
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _021E6CB2
	ldr r1, _021E6CF0 @ =0x0000062B
	movs r2, #0
	ldrb r0, [r4, r1]
	adds r0, r0, #1
	strb r0, [r4, r1]
	subs r0, r1, #2
	strb r2, [r4, r0]
	subs r0, r1, #1
	strb r2, [r4, r0]
	ldrb r0, [r4, r1]
	cmp r0, #5
	blo _021E6CC4
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	b _021E6CC4
_021E6CB2:
	ldr r0, _021E6CF8 @ =0x0000062A
	ldrb r1, [r4, r0]
	adds r1, r1, #1
	strb r1, [r4, r0]
	b _021E6CC4
_021E6CBC:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6CC0:
	bl GF_AssertFail
_021E6CC4:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E6CCE
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6CCE:
	adds r0, r4, #0
	bl ov60_021E6E34
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6CE0: .4byte 0x00000628
_021E6CE4: .4byte 0x021D110C
_021E6CE8: .4byte 0x021D114C
_021E6CEC: .4byte 0x00007FFF
_021E6CF0: .4byte 0x0000062B
_021E6CF4: .4byte 0x021EB860
_021E6CF8: .4byte 0x0000062A
	thumb_func_end ov60_021E6C08

	thumb_func_start ov60_021E6CFC
ov60_021E6CFC: @ 0x021E6CFC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl FUN_02007290
	adds r6, r0, #0
	ldr r1, _021E6DEC @ =0x00007FFF
	movs r0, #0
	bl FUN_0200FBF4
	ldr r1, _021E6DEC @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
	adds r0, r6, #0
	bl ov60_021E6EC0
	ldr r0, [r6, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x47
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6D38
	bl FUN_0200E390
	movs r0, #0x47
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r6, r0]
_021E6D38:
	ldr r0, _021E6DF0 @ =0x00000488
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6D4A
	bl FUN_0200E390
	ldr r0, _021E6DF0 @ =0x00000488
	movs r1, #0
	str r1, [r6, r0]
_021E6D4A:
	movs r4, #0
	adds r5, r6, #0
	adds r7, r4, #0
_021E6D50:
	ldr r0, _021E6DF4 @ =0x000004AC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6D60
	bl FUN_0200E390
	ldr r0, _021E6DF4 @ =0x000004AC
	str r7, [r5, r0]
_021E6D60:
	adds r4, r4, #1
	adds r5, #0x1c
	cmp r4, #8
	blt _021E6D50
	movs r5, #0
	adds r4, r6, #0
	adds r7, r5, #0
_021E6D6E:
	ldr r0, _021E6DF8 @ =0x00000588
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6D7E
	bl FUN_0200E390
	ldr r0, _021E6DF8 @ =0x00000588
	str r7, [r4, r0]
_021E6D7E:
	adds r5, r5, #1
	adds r4, #0x4c
	cmp r5, #2
	blt _021E6D6E
	ldr r0, _021E6DFC @ =0x0000061C
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6D98
	bl FUN_0200E390
	ldr r0, _021E6DFC @ =0x0000061C
	movs r1, #0
	str r1, [r6, r0]
_021E6D98:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	ldr r3, _021E6E00 @ =0x04000050
	movs r0, #0
	strh r0, [r3]
	ldr r2, _021E6E04 @ =0x04001050
	subs r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _021E6E08 @ =0xFFFF1FFF
	subs r2, #0x50
	ands r1, r0
	str r1, [r3]
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	bl FUN_0200FB70
	movs r0, #0x53
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0201FD38
	ldr r0, [sp]
	bl FUN_02007294
	movs r0, #0x4a
	bl FUN_0201A9C4
	ldr r0, _021E6E0C @ =0x0000003C
	ldr r1, _021E6E10 @ =0x021EAFE0
	bl FUN_02000EF4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6DEC: .4byte 0x00007FFF
_021E6DF0: .4byte 0x00000488
_021E6DF4: .4byte 0x000004AC
_021E6DF8: .4byte 0x00000588
_021E6DFC: .4byte 0x0000061C
_021E6E00: .4byte 0x04000050
_021E6E04: .4byte 0x04001050
_021E6E08: .4byte 0xFFFF1FFF
_021E6E0C: .4byte 0x0000003C
_021E6E10: .4byte 0x021EAFE0
	thumb_func_end ov60_021E6CFC

	thumb_func_start ov60_021E6E14
ov60_021E6E14: @ 0x021E6E14
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6E30 @ =0x021EB008
	add r3, sp, #0
	movs r2, #5
_021E6E1E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6E1E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021E6E30: .4byte 0x021EB008
	thumb_func_end ov60_021E6E14

	thumb_func_start ov60_021E6E34
ov60_021E6E34: @ 0x021E6E34
	ldr r3, _021E6E3C @ =FUN_0202457C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_021E6E3C: .4byte FUN_0202457C
	thumb_func_end ov60_021E6E34

	thumb_func_start ov60_021E6E40
ov60_021E6E40: @ 0x021E6E40
	push {r4, r5, lr}
	sub sp, #0x24
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _021E6EB4 @ =0xFFCFFFEF
	movs r1, #0x10
	ands r3, r0
	orrs r3, r1
	str r3, [r2]
	ldr r3, _021E6EB8 @ =0x04001000
	ldr r5, _021E6EBC @ =0x021EAFF8
	ldr r2, [r3]
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	add r3, sp, #0x14
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0xa
	movs r1, #0x4a
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	blx FUN_020B78D4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r2, #0x4a
	str r2, [sp, #0x10]
	adds r2, r0, #0
	bl FUN_0200B150
	adds r1, r4, #0
	movs r0, #0x14
	adds r1, #0x14
	movs r2, #0x4a
	bl FUN_02009F40
	str r0, [r4, #0x10]
	add sp, #0x24
	pop {r4, r5, pc}
	.align 2, 0
_021E6EB4: .4byte 0xFFCFFFEF
_021E6EB8: .4byte 0x04001000
_021E6EBC: .4byte 0x021EAFF8
	thumb_func_end ov60_021E6E40

	thumb_func_start ov60_021E6EC0
ov60_021E6EC0: @ 0x021E6EC0
	push {r3, lr}
	ldr r0, [r0, #0x10]
	bl FUN_02024504
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov60_021E6EC0

	thumb_func_start ov60_021E6ED8
ov60_021E6ED8: @ 0x021E6ED8
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x4f
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_021E6EE4:
	ldrb r0, [r6, r4]
	adds r1, r4, #0
	movs r2, #0x4a
	bl FUN_0200A090
	lsls r1, r4, #2
	adds r1, r5, r1
	str r0, [r1, r7]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E6EE4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E6ED8

	thumb_func_start ov60_021E6F00
ov60_021E6F00: @ 0x021E6F00
	push {r4, r5, r6, lr}
	movs r6, #0x4f
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021E6F0A:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_0200A0D0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E6F0A
	pop {r4, r5, r6, pc}
	thumb_func_end ov60_021E6F00

	thumb_func_start ov60_021E6F20
ov60_021E6F20: @ 0x021E6F20
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r0, r1
	bx lr
	thumb_func_end ov60_021E6F20

	thumb_func_start ov60_021E6F28
ov60_021E6F28: @ 0x021E6F28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0202484C
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02024830
	pop {r3, r4, r5, pc}
	thumb_func_end ov60_021E6F28

	thumb_func_start ov60_021E6F3C
ov60_021E6F3C: @ 0x021E6F3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r7, r0, #0
	movs r0, #0
	str r7, [sp]
	mvns r0, r0
	str r0, [sp, #4]
	adds r5, r1, #0
	str r0, [sp, #8]
	movs r1, #0
	movs r0, #0x4f
	str r1, [sp, #0xc]
	lsls r0, r0, #2
	str r2, [sp, #0x10]
	ldr r2, [r5, r0]
	adds r6, r3, #0
	str r2, [sp, #0x14]
	adds r2, r0, #4
	ldr r2, [r5, r2]
	adds r3, r7, #0
	str r2, [sp, #0x18]
	adds r2, r0, #0
	adds r2, #8
	ldr r2, [r5, r2]
	adds r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	adds r2, r7, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x44]
	adds r1, r7, #0
	ldr r4, [sp, #0x40]
	bl FUN_02009D48
	ldr r0, [r5, #0x10]
	movs r1, #0
	str r0, [r4]
	ldr r0, [sp, #0x44]
	str r0, [r4, #4]
	str r1, [r4, #8]
	str r1, [r4, #0xc]
	movs r0, #1
	str r1, [r4, #0x10]
	lsls r0, r0, #0xc
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	strh r1, [r4, #0x20]
	str r1, [r4, #0x24]
	str r6, [r4, #0x28]
	movs r0, #0x4a
	str r0, [r4, #0x2c]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E6F3C

	thumb_func_start ov60_021E6FAC
ov60_021E6FAC: @ 0x021E6FAC
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	ldr r2, [sp, #0x10]
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x14
	lsls r1, r3, #0xc
	lsls r2, r2, #0xc
	bl FUN_02009FC8
	adds r5, #0x14
	adds r0, r5, #0
	lsls r1, r4, #0xc
	lsls r2, r6, #0xc
	bl FUN_02009FA8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov60_021E6FAC

	thumb_func_start ov60_021E6FD0
ov60_021E6FD0: @ 0x021E6FD0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	strb r4, [r5]
	strb r4, [r5, #2]
	ldr r0, [sp, #0x14]
	strb r4, [r5, #3]
	str r0, [r5, #0x10]
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	ldr r0, [sp, #0x10]
	strb r3, [r5, #1]
	str r0, [r5, #0x14]
	ldr r0, _021E6FF8 @ =ov60_021E6FFC
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0200E320
	str r0, [r5, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6FF8: .4byte ov60_021E6FFC
	thumb_func_end ov60_021E6FD0

	thumb_func_start ov60_021E6FFC
ov60_021E6FFC: @ 0x021E6FFC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x1f
	muls r0, r1, r0
	ldrb r1, [r4, #1]
	blx FUN_020F2998
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #0x1f
	blo _021E702E
	movs r0, #0x1f
	strb r0, [r4, #2]
	ldr r0, [r4, #4]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #1
	strb r0, [r4, #3]
_021E702E:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E7038
	ldrb r3, [r4, #2]
	b _021E703E
_021E7038:
	ldrb r1, [r4, #2]
	movs r0, #0x1f
	subs r3, r0, r1
_021E703E:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _021E7058
	movs r0, #0x1f
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _021E706C @ =0x04000050
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
_021E7058:
	movs r0, #0x1f
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _021E7070 @ =0x04001050
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E706C: .4byte 0x04000050
_021E7070: .4byte 0x04001050
	thumb_func_end ov60_021E6FFC

	thumb_func_start ov60_021E7074
ov60_021E7074: @ 0x021E7074
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r2, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r4, r1, #0
	adds r7, r3, #0
	bl ov60_021E734C
	movs r1, #0x1c
	muls r1, r0, r1
	adds r4, r4, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E709A
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E709A:
	ldr r1, [sp, #0x24]
	cmp r1, #0
	bne _021E70DE
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BDF4
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BE00
	str r0, [sp, #4]
	ldr r3, [sp]
	add r1, sp, #0x10
	movs r0, #0x10
	ldrsh r4, [r1, r0]
	lsls r1, r5, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	adds r3, r7, r3
	bl FUN_0201BC8C
	ldr r3, [sp, #4]
	lsls r1, r5, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #3
	adds r3, r4, r3
	bl FUN_0201BC8C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E70DE:
	str r6, [r4]
	str r5, [r4, #8]
	movs r0, #0
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	strh r1, [r4, #0xc]
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BDF4
	strh r0, [r4, #0x18]
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BE00
	strh r0, [r4, #0x1a]
	strh r7, [r4, #0x14]
	add r1, sp, #0x10
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	adds r1, r4, #0
	movs r2, #0
	strh r0, [r4, #0x16]
	movs r0, #1
	str r0, [r4, #4]
	ldr r0, _021E711C @ =ov60_021E71CC
	bl FUN_0200E33C
	str r0, [r4, #0x10]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E711C: .4byte ov60_021E71CC
	thumb_func_end ov60_021E7074

	thumb_func_start ov60_021E7120
ov60_021E7120: @ 0x021E7120
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r2, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r4, r1, #0
	adds r7, r3, #0
	bl ov60_021E734C
	movs r1, #0x1c
	muls r1, r0, r1
	adds r4, r4, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E7146
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E7146:
	ldr r1, [sp, #0x24]
	cmp r1, #0
	bne _021E718A
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BDF4
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BE00
	str r0, [sp, #4]
	ldr r3, [sp]
	add r1, sp, #0x10
	movs r0, #0x10
	ldrsh r4, [r1, r0]
	lsls r1, r5, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #0
	adds r3, r7, r3
	bl FUN_0201BC8C
	ldr r3, [sp, #4]
	lsls r1, r5, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	movs r2, #3
	adds r3, r4, r3
	bl FUN_0201BC8C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E718A:
	str r6, [r4]
	str r5, [r4, #8]
	movs r0, #0
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	strh r1, [r4, #0xc]
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BDF4
	strh r0, [r4, #0x18]
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0201BE00
	strh r0, [r4, #0x1a]
	strh r7, [r4, #0x14]
	add r1, sp, #0x10
	movs r0, #0x10
	ldrsh r0, [r1, r0]
	adds r1, r4, #0
	movs r2, #0
	strh r0, [r4, #0x16]
	movs r0, #1
	str r0, [r4, #4]
	ldr r0, _021E71C8 @ =ov60_021E7264
	bl FUN_0200E320
	str r0, [r4, #0x10]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E71C8: .4byte ov60_021E7264
	thumb_func_end ov60_021E7120

	thumb_func_start ov60_021E71CC
ov60_021E71CC: @ 0x021E71CC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _021E71F8
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl FUN_0201BDF4
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	adds r0, r1, r0
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl FUN_0201BE00
	movs r1, #0x16
	ldrsh r1, [r5, r1]
	adds r7, r1, r0
	b _021E7242
_021E71F8:
	ldrb r1, [r5, #0xe]
	adds r1, r1, #1
	strb r1, [r5, #0xe]
	ldrsh r6, [r5, r0]
	movs r0, #0x14
	ldrsh r1, [r5, r0]
	ldrb r4, [r5, #0xe]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	adds r7, r0, #0
	movs r0, #0x16
	ldrsh r1, [r5, r0]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	movs r1, #0x18
	ldrsh r1, [r5, r1]
	adds r1, r7, r1
	str r1, [sp]
	movs r1, #0x1a
	ldrsh r1, [r5, r1]
	adds r7, r0, r1
	cmp r4, r6
	blt _021E7242
	ldr r0, [r5, #0x10]
	bl FUN_0200E390
	movs r1, #0
	str r1, [r5, #0x10]
	movs r0, #1
	strb r0, [r5, #0xf]
	str r1, [r5, #4]
_021E7242:
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	ldr r3, [sp]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl FUN_0201BC8C
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	adds r3, r7, #0
	bl FUN_0201BC8C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E71CC

	thumb_func_start ov60_021E7264
ov60_021E7264: @ 0x021E7264
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _021E7290
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl FUN_0201BDF4
	movs r1, #0x14
	ldrsh r1, [r5, r1]
	adds r0, r1, r0
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl FUN_0201BE00
	movs r1, #0x16
	ldrsh r1, [r5, r1]
	adds r7, r1, r0
	b _021E72DA
_021E7290:
	ldrb r1, [r5, #0xe]
	adds r1, r1, #1
	strb r1, [r5, #0xe]
	ldrsh r6, [r5, r0]
	movs r0, #0x14
	ldrsh r1, [r5, r0]
	ldrb r4, [r5, #0xe]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	adds r7, r0, #0
	movs r0, #0x16
	ldrsh r1, [r5, r0]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	movs r1, #0x18
	ldrsh r1, [r5, r1]
	adds r1, r7, r1
	str r1, [sp]
	movs r1, #0x1a
	ldrsh r1, [r5, r1]
	adds r7, r0, r1
	cmp r4, r6
	blt _021E72DA
	ldr r0, [r5, #0x10]
	bl FUN_0200E390
	movs r1, #0
	str r1, [r5, #0x10]
	movs r0, #1
	strb r0, [r5, #0xf]
	str r1, [r5, #4]
_021E72DA:
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	ldr r3, [sp]
	lsrs r1, r1, #0x18
	movs r2, #0
	bl FUN_0201F238
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #3
	adds r3, r7, #0
	bl FUN_0201F238
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E7264

	thumb_func_start ov60_021E72FC
ov60_021E72FC: @ 0x021E72FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	movs r4, #0
	bl ov60_021E734C
	movs r1, #0x1c
	muls r1, r0, r1
	adds r1, r5, r1
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _021E7318
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E7318:
	ldrb r0, [r1, #0xf]
	cmp r0, #0
	beq _021E7320
	movs r4, #1
_021E7320:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov60_021E72FC

	thumb_func_start ov60_021E7324
ov60_021E7324: @ 0x021E7324
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov60_021E734C
	movs r1, #0x1c
	muls r1, r0, r1
	adds r4, r4, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E734A
	ldr r0, [r4, #0x10]
	bl FUN_0200E390
	movs r1, #0
	str r1, [r4, #0x10]
	movs r0, #1
	strb r0, [r4, #0xf]
	str r1, [r4, #4]
_021E734A:
	pop {r4, pc}
	thumb_func_end ov60_021E7324

	thumb_func_start ov60_021E734C
ov60_021E734C: @ 0x021E734C
	push {r4, lr}
	movs r4, #0
	cmp r0, #7
	bhi _021E738E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E7360: @ jump table
	.2byte _021E7370 - _021E7360 - 2 @ case 0
	.2byte _021E7372 - _021E7360 - 2 @ case 1
	.2byte _021E7376 - _021E7360 - 2 @ case 2
	.2byte _021E737A - _021E7360 - 2 @ case 3
	.2byte _021E737E - _021E7360 - 2 @ case 4
	.2byte _021E7382 - _021E7360 - 2 @ case 5
	.2byte _021E7386 - _021E7360 - 2 @ case 6
	.2byte _021E738A - _021E7360 - 2 @ case 7
_021E7370:
	b _021E7392
_021E7372:
	movs r4, #1
	b _021E7392
_021E7376:
	movs r4, #2
	b _021E7392
_021E737A:
	movs r4, #3
	b _021E7392
_021E737E:
	movs r4, #4
	b _021E7392
_021E7382:
	movs r4, #5
	b _021E7392
_021E7386:
	movs r4, #6
	b _021E7392
_021E738A:
	movs r4, #7
	b _021E7392
_021E738E:
	bl GF_AssertFail
_021E7392:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov60_021E734C

	thumb_func_start ov60_021E7398
ov60_021E7398: @ 0x021E7398
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	adds r4, r3, #0
	str r6, [sp]
	ldrh r2, [r4, #0x28]
	ldrh r3, [r4, #0x2a]
	adds r5, r0, #0
	str r1, [sp, #4]
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x24]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov60_021E74F0
	ldr r0, [sp, #4]
	cmp r0, #0
	bgt _021E73D4
	str r6, [sp]
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x1c]
	bl ov60_021E75C4
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E73D4:
	cmp r6, #0
	bne _021E73DA
	adds r5, #0x4c
_021E73DA:
	adds r2, r5, #0
	adds r3, r4, #0
	adds r2, #0x10
	movs r7, #5
_021E73E2:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r7, r7, #1
	bne _021E73E2
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #4]
	strh r0, [r5, #8]
	movs r0, #0
	strb r0, [r5, #0xa]
	movs r0, #1
	strb r0, [r5, #0xb]
	str r0, [r5]
	str r6, [r5, #4]
	ldr r0, [r4]
	str r0, [r5, #0x3c]
	ldr r0, [r4, #4]
	str r0, [r5, #0x40]
	ldr r0, [r4, #8]
	str r0, [r5, #0x44]
	ldr r0, [r4, #0xc]
	str r0, [r5, #0x48]
	str r6, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl ov60_021E75C4
	ldr r0, _021E7430 @ =ov60_021E7454
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E33C
	str r0, [r5, #0xc]
	adds r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7430: .4byte ov60_021E7454
	thumb_func_end ov60_021E7398

	thumb_func_start ov60_021E7434
ov60_021E7434: @ 0x021E7434
	cmp r1, #0
	bne _021E743A
	adds r0, #0x4c
_021E743A:
	ldr r1, [r0]
	cmp r1, #0
	bne _021E7444
	movs r0, #1
	bx lr
_021E7444:
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _021E744E
	movs r0, #1
	bx lr
_021E744E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov60_021E7434

	thumb_func_start ov60_021E7454
ov60_021E7454: @ 0x021E7454
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldrb r0, [r5, #0xa]
	adds r0, r0, #1
	strb r0, [r5, #0xa]
	ldr r7, [r5, #0x10]
	ldr r0, [r5, #0x20]
	ldrb r4, [r5, #0xa]
	subs r1, r0, r7
	movs r0, #8
	ldrsh r6, [r5, r0]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	adds r0, r7, r0
	str r0, [sp, #0xc]
	ldr r7, [r5, #0x14]
	ldr r0, [r5, #0x24]
	subs r1, r0, r7
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	adds r0, r7, r0
	str r0, [sp, #8]
	ldr r7, [r5, #0x18]
	ldr r0, [r5, #0x28]
	subs r1, r0, r7
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	adds r7, r7, r0
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x2c]
	str r0, [sp, #4]
	subs r1, r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	ldr r1, [sp, #4]
	adds r4, r1, r0
	ldr r0, [sp, #0xc]
	str r0, [r5, #0x3c]
	ldr r0, [sp, #8]
	str r0, [r5, #0x40]
	str r7, [r5, #0x44]
	str r4, [r5, #0x48]
	movs r0, #8
	ldrb r1, [r5, #0xa]
	ldrsh r0, [r5, r0]
	cmp r1, r0
	blt _021E74DC
	ldr r0, [r5, #0xc]
	bl FUN_0200E390
	movs r1, #0
	str r1, [r5, #0xc]
	movs r0, #1
	strb r0, [r5, #0xb]
	str r1, [r5]
_021E74DC:
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r2, r7, #0
	adds r3, r4, #0
	bl ov60_021E75C4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E7454

	thumb_func_start ov60_021E74F0
ov60_021E74F0: @ 0x021E74F0
	push {r4, r5}
	adds r4, r0, #0
	adds r0, r1, #0
	ldr r1, [sp, #8]
	cmp r1, #0
	ldr r1, _021E75A8 @ =0xFFFF1FFF
	beq _021E7554
	movs r5, #1
	lsls r5, r5, #0x1a
	ldr r3, [r5]
	ands r3, r1
	movs r1, #6
	lsls r1, r1, #0xc
	orrs r1, r3
	str r1, [r5]
	adds r5, #0x48
	ldrh r3, [r5]
	movs r1, #0x3f
	bics r3, r1
	orrs r3, r4
	cmp r2, #0
	beq _021E7520
	movs r1, #0x20
	orrs r3, r1
_021E7520:
	ldr r5, _021E75AC @ =0x04000048
	ldr r1, _021E75B0 @ =0xFFFFC0FF
	strh r3, [r5]
	ldrh r3, [r5]
	ands r3, r1
	lsls r1, r4, #8
	orrs r3, r1
	cmp r2, #0
	beq _021E7536
	lsrs r1, r5, #0xd
	orrs r3, r1
_021E7536:
	ldr r1, _021E75AC @ =0x04000048
	strh r3, [r1]
	ldrh r3, [r1, #2]
	movs r1, #0x3f
	bics r3, r1
	adds r1, r3, #0
	orrs r1, r0
	cmp r2, #0
	beq _021E754C
	movs r0, #0x20
	orrs r1, r0
_021E754C:
	ldr r0, _021E75B4 @ =0x0400004A
	strh r1, [r0]
	pop {r4, r5}
	bx lr
_021E7554:
	ldr r5, _021E75B8 @ =0x04001000
	ldr r2, [r5]
	ands r2, r1
	movs r1, #6
	lsls r1, r1, #0xc
	orrs r1, r2
	str r1, [r5]
	adds r5, #0x48
	ldrh r2, [r5]
	movs r1, #0x3f
	bics r2, r1
	orrs r2, r4
	cmp r3, #0
	beq _021E7574
	movs r1, #0x20
	orrs r2, r1
_021E7574:
	ldr r5, _021E75BC @ =0x04001048
	ldr r1, _021E75B0 @ =0xFFFFC0FF
	strh r2, [r5]
	ldrh r2, [r5]
	ands r2, r1
	lsls r1, r4, #8
	orrs r2, r1
	cmp r3, #0
	beq _021E758A
	lsrs r1, r5, #0xd
	orrs r2, r1
_021E758A:
	ldr r1, _021E75BC @ =0x04001048
	strh r2, [r1]
	ldrh r2, [r1, #2]
	movs r1, #0x3f
	bics r2, r1
	adds r1, r2, #0
	orrs r1, r0
	cmp r3, #0
	beq _021E75A0
	movs r0, #0x20
	orrs r1, r0
_021E75A0:
	ldr r0, _021E75C0 @ =0x0400104A
	strh r1, [r0]
	pop {r4, r5}
	bx lr
	.align 2, 0
_021E75A8: .4byte 0xFFFF1FFF
_021E75AC: .4byte 0x04000048
_021E75B0: .4byte 0xFFFFC0FF
_021E75B4: .4byte 0x0400004A
_021E75B8: .4byte 0x04001000
_021E75BC: .4byte 0x04001048
_021E75C0: .4byte 0x0400104A
	thumb_func_end ov60_021E74F0

	thumb_func_start ov60_021E75C4
ov60_021E75C4: @ 0x021E75C4
	push {r4, r5}
	adds r4, r1, #0
	adds r1, r3, #0
	cmp r0, #0
	bne _021E7624
	cmp r2, #0xff
	bne _021E7624
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021E75FE
	ldr r0, _021E7678 @ =0x04000042
	movs r2, #1
	strh r2, [r0]
	movs r2, #0xff
	lsls r1, r1, #0x18
	lsls r3, r4, #8
	lsls r2, r2, #8
	ands r2, r3
	lsrs r1, r1, #0x18
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	strh r3, [r0, #4]
	lsrs r2, r0, #0x12
	subs r1, r0, #2
	strh r2, [r1]
	strh r3, [r0, #2]
	pop {r4, r5}
	bx lr
_021E75FE:
	ldr r0, _021E767C @ =0x04001042
	movs r2, #1
	strh r2, [r0]
	movs r2, #0xff
	lsls r1, r1, #0x18
	lsls r3, r4, #8
	lsls r2, r2, #8
	ands r2, r3
	lsrs r1, r1, #0x18
	orrs r1, r2
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	strh r3, [r0, #4]
	lsrs r2, r0, #0x12
	subs r1, r0, #2
	strh r2, [r1]
	strh r3, [r0, #2]
	pop {r4, r5}
	bx lr
_021E7624:
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _021E7650
	lsls r0, r0, #8
	movs r3, #0xff
	adds r5, r0, #0
	lsls r3, r3, #8
	lsls r0, r2, #0x18
	ands r5, r3
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	adds r2, r5, #0
	orrs r2, r0
	ldr r0, _021E7680 @ =0x04000040
	lsrs r1, r1, #0x18
	strh r2, [r0]
	lsls r2, r4, #8
	ands r2, r3
	orrs r1, r2
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
_021E7650:
	lsls r0, r0, #8
	movs r3, #0xff
	adds r5, r0, #0
	lsls r3, r3, #8
	lsls r0, r2, #0x18
	ands r5, r3
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	adds r2, r5, #0
	orrs r2, r0
	ldr r0, _021E7684 @ =0x04001040
	lsrs r1, r1, #0x18
	strh r2, [r0]
	lsls r2, r4, #8
	ands r2, r3
	orrs r1, r2
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
	nop
_021E7678: .4byte 0x04000042
_021E767C: .4byte 0x04001042
_021E7680: .4byte 0x04000040
_021E7684: .4byte 0x04001040
	thumb_func_end ov60_021E75C4

	thumb_func_start ov60_021E7688
ov60_021E7688: @ 0x021E7688
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov60_021E7688

	thumb_func_start ov60_021E768C
ov60_021E768C: @ 0x021E768C
	ldr r1, _021E7694 @ =0x0000046C
	adds r0, r0, r1
	bx lr
	nop
_021E7694: .4byte 0x0000046C
	thumb_func_end ov60_021E768C

	thumb_func_start ov60_021E7698
ov60_021E7698: @ 0x021E7698
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov60_021E7698

	thumb_func_start ov60_021E769C
ov60_021E769C: @ 0x021E769C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov60_021E769C

	thumb_func_start ov60_021E76A0
ov60_021E76A0: @ 0x021E76A0
	push {r3, r4, r5, r6, r7, lr}
	ldr r3, _021E76E8 @ =0x04000050
	adds r5, r0, #0
	movs r4, #0
	strh r4, [r3]
	ldr r0, _021E76EC @ =0x04001050
	subs r3, #0x50
	strh r4, [r0]
	ldr r2, [r3]
	ldr r1, _021E76F0 @ =0xFFFF1FFF
	subs r0, #0x50
	ands r2, r1
	str r2, [r3]
	ldr r2, [r0]
	ands r1, r2
	str r1, [r0]
	movs r6, #3
	adds r7, r4, #0
_021E76C4:
	lsls r1, r4, #0x18
	movs r2, #0
	ldr r0, [r5, #0xc]
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_0201BC8C
	lsls r1, r4, #0x18
	ldr r0, [r5, #0xc]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0201BC8C
	adds r4, r4, #1
	cmp r4, #8
	blt _021E76C4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E76E8: .4byte 0x04000050
_021E76EC: .4byte 0x04001050
_021E76F0: .4byte 0xFFFF1FFF
	thumb_func_end ov60_021E76A0

	thumb_func_start ov60_021E76F4
ov60_021E76F4: @ 0x021E76F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r2, #0
	movs r2, #0x1f
	str r2, [sp, #8]
	ldr r2, _021E7790 @ =0x00000614
	movs r5, #0
	adds r4, r0, r2
	movs r7, #1
	str r7, [r4]
	strb r5, [r4, #0x12]
	strb r3, [r4, #0x10]
	strb r5, [r4, #0x11]
	lsls r0, r7, #0xc
	str r6, [r4, #4]
	strh r0, [r4, #0xc]
	strh r5, [r4, #0xe]
	str r5, [sp, #4]
	strb r1, [r4, #0x13]
	cmp r6, #0
	beq _021E7724
	adds r2, r5, #0
	adds r7, r5, #0
	b _021E7726
_021E7724:
	movs r2, #4
_021E7726:
	ldrb r0, [r4, #0x13]
	cmp r0, #1
	bhi _021E7730
	ldr r1, _021E7794 @ =0x00007FFF
	b _021E7732
_021E7730:
	movs r1, #0
_021E7732:
	lsls r0, r2, #0x18
	lsls r1, r1, #0x10
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x10
	bl FUN_0201C2D8
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _021E7748
	cmp r0, #2
	bne _021E7752
_021E7748:
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x1f
	str r0, [sp, #4]
	movs r5, #1
_021E7752:
	movs r0, #0
	adds r1, r0, #0
	movs r2, #0xff
	movs r3, #0xc0
	str r6, [sp]
	bl ov60_021E75C4
	movs r2, #1
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r3, r2, #0
	str r6, [sp]
	bl ov60_021E74F0
	cmp r5, #0
	beq _021E7778
	adds r0, r7, #0
	bl FUN_0200FBE8
_021E7778:
	ldr r0, _021E7798 @ =ov60_021E77C0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r4, #8]
	ldr r0, _021E779C @ =ov60_021E7864
	adds r1, r4, #0
	bl FUN_0201A120
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7790: .4byte 0x00000614
_021E7794: .4byte 0x00007FFF
_021E7798: .4byte ov60_021E77C0
_021E779C: .4byte ov60_021E7864
	thumb_func_end ov60_021E76F4

	thumb_func_start ov60_021E77A0
ov60_021E77A0: @ 0x021E77A0
	ldr r1, _021E77BC @ =0x00000614
	adds r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	bne _021E77AE
	movs r0, #1
	bx lr
_021E77AE:
	ldrb r0, [r1, #0x12]
	cmp r0, #0
	beq _021E77B8
	movs r0, #1
	bx lr
_021E77B8:
	movs r0, #0
	bx lr
	.align 2, 0
_021E77BC: .4byte 0x00000614
	thumb_func_end ov60_021E77A0

	thumb_func_start ov60_021E77C0
ov60_021E77C0: @ 0x021E77C0
	push {r4, lr}
	adds r4, r1, #0
	ldrb r0, [r4, #0x11]
	ldrb r1, [r4, #0x10]
	lsls r0, r0, #0xf
	blx FUN_020F2998
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	asrs r0, r0, #4
	lsls r2, r0, #1
	adds r0, r2, #1
	ldr r1, _021E7854 @ =0x021094DC
	lsls r0, r0, #1
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0xc]
	lsls r0, r2, #1
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0x11]
	adds r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r1, [r4, #0x11]
	ldrb r0, [r4, #0x10]
	cmp r1, r0
	blo _021E7850
	ldr r0, [r4, #8]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #8]
	movs r1, #1
	strb r1, [r4, #0x12]
	str r0, [r4]
	ldr r2, [r4, #4]
	cmp r2, #0
	beq _021E780C
	adds r1, r0, #0
_021E780C:
	lsls r0, r1, #0x18
	ldrb r1, [r4, #0x13]
	lsrs r0, r0, #0x18
	cmp r1, #1
	bne _021E781E
	ldr r1, _021E7858 @ =0x00007FFF
	bl FUN_0200FBF4
	b _021E7848
_021E781E:
	cmp r1, #3
	bne _021E782A
	movs r1, #0
	bl FUN_0200FBF4
	b _021E7848
_021E782A:
	cmp r2, #0
	ldr r1, _021E785C @ =0xFFFF1FFF
	beq _021E783C
	movs r3, #1
	lsls r3, r3, #0x1a
	ldr r2, [r3]
	ands r1, r2
	str r1, [r3]
	b _021E7844
_021E783C:
	ldr r3, _021E7860 @ =0x04001000
	ldr r2, [r3]
	ands r1, r2
	str r1, [r3]
_021E7844:
	bl FUN_0200FBE8
_021E7848:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
_021E7850:
	pop {r4, pc}
	nop
_021E7854: .4byte 0x021094DC
_021E7858: .4byte 0x00007FFF
_021E785C: .4byte 0xFFFF1FFF
_021E7860: .4byte 0x04001000
	thumb_func_end ov60_021E77C0

	thumb_func_start ov60_021E7864
ov60_021E7864: @ 0x021E7864
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E78F8 @ =0x04000006
	adds r4, r0, #0
	ldrh r2, [r1]
	cmp r2, #0xbf
	ble _021E7886
	ldr r0, [r4, #4]
	movs r2, #0x7f
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	movs r3, #0xc0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
_021E7886:
	movs r0, #0xc
	ldrsh r3, [r4, r0]
	lsrs r0, r1, #0xe
	cmp r3, r0
	bne _021E78A4
	ldr r0, [r4, #4]
	movs r2, #0xff
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	movs r3, #0xc0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
_021E78A4:
	ldr r0, _021E78FC @ =0xFFFFF000
	cmp r3, r0
	bne _021E78BE
	ldr r0, [r4, #4]
	movs r3, #0xc0
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
_021E78BE:
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bgt _021E78CA
	movs r0, #0
	b _021E78D2
_021E78CA:
	adds r0, r2, #0
	muls r0, r3, r0
	blx FUN_020F2998
_021E78D2:
	adds r2, r0, #0
	adds r2, #0x7f
	cmp r2, #0xff
	ble _021E78DE
	movs r2, #0xff
	b _021E78E4
_021E78DE:
	cmp r2, #0
	bge _021E78E4
	movs r2, #0
_021E78E4:
	ldr r0, [r4, #4]
	movs r3, #0xc0
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E78F8: .4byte 0x04000006
_021E78FC: .4byte 0xFFFFF000
	thumb_func_end ov60_021E7864

	thumb_func_start ov60_021E7900
ov60_021E7900: @ 0x021E7900
	push {r4, lr}
	ldr r1, _021E7950 @ =0x0000062B
	movs r4, #0
	ldrb r1, [r0, r1]
	cmp r1, #4
	bhi _021E7948
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E7918: @ jump table
	.2byte _021E7922 - _021E7918 - 2 @ case 0
	.2byte _021E792A - _021E7918 - 2 @ case 1
	.2byte _021E7932 - _021E7918 - 2 @ case 2
	.2byte _021E793A - _021E7918 - 2 @ case 3
	.2byte _021E7942 - _021E7918 - 2 @ case 4
_021E7922:
	movs r1, #0x15
	lsls r1, r1, #4
	adds r4, r0, r1
	b _021E794C
_021E792A:
	movs r1, #0x17
	lsls r1, r1, #4
	adds r4, r0, r1
	b _021E794C
_021E7932:
	movs r1, #0x89
	lsls r1, r1, #2
	adds r4, r0, r1
	b _021E794C
_021E793A:
	movs r1, #0xfe
	lsls r1, r1, #2
	adds r4, r0, r1
	b _021E794C
_021E7942:
	ldr r1, _021E7954 @ =0x00000468
	adds r4, r0, r1
	b _021E794C
_021E7948:
	bl GF_AssertFail
_021E794C:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
_021E7950: .4byte 0x0000062B
_021E7954: .4byte 0x00000468
	thumb_func_end ov60_021E7900

	thumb_func_start ov60_021E7958
ov60_021E7958: @ 0x021E7958
	ldr r1, _021E7968 @ =0x00000629
	ldrb r2, [r0, r1]
	adds r2, r2, #1
	strb r2, [r0, r1]
	movs r2, #0
	adds r1, r1, #1
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_021E7968: .4byte 0x00000629
	thumb_func_end ov60_021E7958

	thumb_func_start ov60_021E796C
ov60_021E796C: @ 0x021E796C
	ldr r1, _021E7974 @ =0x00000629
	ldrb r0, [r0, r1]
	bx lr
	nop
_021E7974: .4byte 0x00000629
	thumb_func_end ov60_021E796C

	thumb_func_start ov60_021E7978
ov60_021E7978: @ 0x021E7978
	ldr r1, _021E7980 @ =0x0000062A
	ldrb r0, [r0, r1]
	bx lr
	nop
_021E7980: .4byte 0x0000062A
	thumb_func_end ov60_021E7978

	thumb_func_start ov60_021E7984
ov60_021E7984: @ 0x021E7984
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E7996
	movs r0, #2
	strb r0, [r4]
_021E7996:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E79A6
	cmp r0, #1
	beq _021E79B6
	cmp r0, #2
	beq _021E79D2
	b _021E79DE
_021E79A6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E79F4
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E79DE
_021E79B6:
	adds r0, r5, #0
	bl ov60_021E769C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E7A50
	cmp r0, #0
	beq _021E79DE
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E79DE
_021E79D2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E7C5C
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E79DE:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021E7984

	thumb_func_start ov60_021E79E4
ov60_021E79E4: @ 0x021E79E4
	push {r3, lr}
	bl ov60_021E7688
	bl FUN_0201EEB4
	bl FUN_0200B224
	pop {r3, pc}
	thumb_func_end ov60_021E79E4

	thumb_func_start ov60_021E79F4
ov60_021E79F4: @ 0x021E79F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7688
	adds r6, r0, #0
	bl FUN_020216C8
	bl FUN_02022638
	ldr r0, _021E7A48 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	adds r0, r5, #0
	bl ov60_021E7CC4
	adds r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E7A4C @ =ov60_021E79E4
	adds r1, r5, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	bl ov60_021E7E0C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E7F94
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E8050
	adds r0, r5, #0
	bl ov60_021E7F74
	movs r0, #1
	strb r0, [r4, #1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E7A48: .4byte 0x021D116C
_021E7A4C: .4byte ov60_021E79E4
	thumb_func_end ov60_021E79F4

	thumb_func_start ov60_021E7A50
ov60_021E7A50: @ 0x021E7A50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r7, r1, #0
	bl ov60_021E7688
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov60_021E768C
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov60_021E7978
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov60_021E796C
	cmp r0, #0xa
	bhi _021E7B42
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E7A84: @ jump table
	.2byte _021E7A9A - _021E7A84 - 2 @ case 0
	.2byte _021E7ABE - _021E7A84 - 2 @ case 1
	.2byte _021E7AEE - _021E7A84 - 2 @ case 2
	.2byte _021E7B02 - _021E7A84 - 2 @ case 3
	.2byte _021E7B3E - _021E7A84 - 2 @ case 4
	.2byte _021E7B4C - _021E7A84 - 2 @ case 5
	.2byte _021E7B6C - _021E7A84 - 2 @ case 6
	.2byte _021E7BD6 - _021E7A84 - 2 @ case 7
	.2byte _021E7C06 - _021E7A84 - 2 @ case 8
	.2byte _021E7C1A - _021E7A84 - 2 @ case 9
	.2byte _021E7C3E - _021E7A84 - 2 @ case 10
_021E7A9A:
	ldr r0, [sp, #0xc]
	movs r1, #0
	movs r2, #3
	movs r3, #0x80
	bl FUN_0201BC8C
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7ABE:
	cmp r6, #0x1e
	blo _021E7B42
	movs r1, #1
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x3c
	bl ov60_021E6FD0
	movs r1, #1
	adds r4, #0x18
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x3c
	str r1, [sp, #4]
	bl ov60_021E6FD0
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7AEE:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _021E7B42
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _021E7B42
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B02:
	cmp r6, #0x14
	blo _021E7B42
	ldr r1, [r7, #4]
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r1, #0
	ldr r0, [sp, #0xc]
	movs r2, #3
	adds r3, r1, #0
	bl FUN_0201BC8C
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E7C54 @ =0x04000050
	movs r1, #1
	movs r2, #0x20
	movs r3, #0x1f
	blx FUN_020CF15C
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B3E:
	cmp r6, #0x6e
	bhs _021E7B44
_021E7B42:
	b _021E7C4C
_021E7B44:
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B4C:
	movs r0, #0xe
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r7, #0x18]
	movs r1, #1
	bl FUN_02024830
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B6C:
	cmp r6, #1
	blo _021E7C4C
	movs r1, #1
	str r1, [sp]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x50
	str r1, [sp, #4]
	bl ov60_021E6FD0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #2
	movs r2, #0x1e
	movs r3, #0x50
	bl ov60_021E6FD0
	movs r0, #0x1f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0xf0
	str r0, [sp, #4]
	adds r1, r4, #0
	ldr r0, [sp, #0xc]
	adds r1, #0x30
	movs r2, #1
	movs r3, #0
	bl ov60_021E7074
	movs r0, #0xf
	mvns r0, r0
	str r0, [sp]
	movs r0, #0xf0
	str r0, [sp, #4]
	adds r4, #0x30
	ldr r0, [sp, #0xc]
	adds r1, r4, #0
	movs r2, #2
	movs r3, #0
	bl ov60_021E7074
	ldr r0, [r7, #0x18]
	movs r1, #1
	bl ov60_021E6F28
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7BD6:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _021E7C4C
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _021E7C4C
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E7C4C
	adds r4, #0x30
	adds r0, r4, #0
	movs r1, #2
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E7C4C
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7C06:
	cmp r6, #0x80
	blo _021E7C4C
	ldr r0, [r7, #0x1c]
	movs r1, #1
	bl ov60_021E6F28
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7C1A:
	cmp r6, #0x5a
	blo _021E7C4C
	movs r0, #0x41
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _021E7C58 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	adds r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7C3E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E7C4C
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7C4C:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7C54: .4byte 0x04000050
_021E7C58: .4byte 0x00007FFF
	thumb_func_end ov60_021E7A50

	thumb_func_start ov60_021E7C5C
ov60_021E7C5C: @ 0x021E7C5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov60_021E7688
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _021E7CC2
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov60_021E8028
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201BB4C
	movs r0, #0
	strb r0, [r5, #1]
_021E7CC2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov60_021E7C5C

	thumb_func_start ov60_021E7CC4
ov60_021E7CC4: @ 0x021E7CC4
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	bl ov60_021E7688
	add r3, sp, #0xe0
	ldr r5, _021E7DE8 @ =0x021EB044
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E7DEC @ =0x021EB0C4
	add r3, sp, #0xc4
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
	ldr r5, _021E7DF0 @ =0x021EB0E0
	add r3, sp, #0xa8
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
	ldr r5, _021E7DF4 @ =0x021EB08C
	add r3, sp, #0x8c
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
	ldr r5, _021E7DF8 @ =0x021EB070
	add r3, sp, #0x70
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
	ldr r5, _021E7DFC @ =0x021EB0A8
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
	movs r1, #0
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r5, _021E7E00 @ =0x021EB0FC
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021E7E04 @ =0x021EB054
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021E7E08 @ =0x021EB118
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	nop
_021E7DE8: .4byte 0x021EB044
_021E7DEC: .4byte 0x021EB0C4
_021E7DF0: .4byte 0x021EB0E0
_021E7DF4: .4byte 0x021EB08C
_021E7DF8: .4byte 0x021EB070
_021E7DFC: .4byte 0x021EB0A8
_021E7E00: .4byte 0x021EB0FC
_021E7E04: .4byte 0x021EB054
_021E7E08: .4byte 0x021EB118
	thumb_func_end ov60_021E7CC4

	thumb_func_start ov60_021E7E0C
ov60_021E7E0C: @ 0x021E7E0C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #4
	adds r2, r4, #0
	movs r3, #5
	bl FUN_020078F0
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #5
	adds r2, r4, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0xc
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007914
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0xd
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0xe
	adds r2, r4, #0
	movs r3, #4
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #6
	adds r2, r4, #0
	movs r3, #7
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #7
	adds r2, r4, #0
	movs r3, #3
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #7
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x12
	adds r2, r4, #0
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x11
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x10
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #5
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x4a
	movs r1, #0
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r2, #4
	adds r3, r1, #0
	bl FUN_02007938
	movs r0, #5
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x4a
	movs r2, #0
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0xf
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0xf
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #1
	adds r1, r0, #0
	blx FUN_020D0E6C
	bl FUN_02022D24
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov60_021E7E0C

	thumb_func_start ov60_021E7F74
ov60_021E7F74: @ 0x021E7F74
	push {r3, lr}
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	movs r0, #1
	bl FUN_0200FBE8
	movs r0, #0
	bl FUN_0200FBE8
	pop {r3, pc}
	thumb_func_end ov60_021E7F74

	thumb_func_start ov60_021E7F94
ov60_021E7F94: @ 0x021E7F94
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, _021E8024 @ =0x021EB134
	adds r4, r0, #0
	bl ov60_021E6ED8
	adds r0, r4, #0
	bl ov60_021E6F20
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	adds r4, r0, #0
	ldr r0, [r4]
	adds r1, #0xbe
	movs r2, #0x18
	bl FUN_0200A1D8
	str r0, [r5, #8]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	adds r1, #0xbe
	movs r2, #0x17
	movs r3, #0
	bl FUN_0200A234
	str r0, [r5, #0xc]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, #0xbe
	movs r2, #0x1a
	bl FUN_0200A294
	str r0, [r5, #0x10]
	movs r3, #1
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xbe
	movs r2, #0x19
	bl FUN_0200A294
	str r0, [r5, #0x14]
	ldr r0, [r5, #8]
	bl FUN_0200ACF0
	ldr r0, [r5, #0xc]
	bl FUN_0200AF94
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8024: .4byte 0x021EB134
	thumb_func_end ov60_021E7F94

	thumb_func_start ov60_021E8028
ov60_021E8028: @ 0x021E8028
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x18]
	bl FUN_02024758
	ldr r0, [r4, #0x1c]
	bl FUN_02024758
	ldr r0, [r4, #8]
	bl FUN_0200AEB0
	ldr r0, [r4, #0xc]
	bl FUN_0200B0A8
	adds r0, r5, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021E8028

	thumb_func_start ov60_021E8050
ov60_021E8050: @ 0x021E8050
	push {r4, r5, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	add r0, sp, #8
	str r0, [sp]
	add r0, sp, #0x38
	str r0, [sp, #4]
	movs r0, #1
	adds r4, r1, #0
	adds r1, r5, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x10]
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0x14]
	add r0, sp, #8
	bl FUN_02024624
	str r0, [r4, #0x18]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x18]
	movs r1, #0
	bl FUN_020248F0
	add r0, sp, #8
	str r0, [sp]
	add r0, sp, #0x38
	str r0, [sp, #4]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #0
	adds r3, r0, #0
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x10]
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0x14]
	add r0, sp, #8
	bl FUN_02024624
	str r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x1c]
	movs r1, #1
	bl FUN_020248F0
	ldr r0, [r4, #0x1c]
	movs r1, #2
	bl FUN_0202487C
	add sp, #0x5c
	pop {r4, r5, pc}
	thumb_func_end ov60_021E8050

	thumb_func_start ov60_021E80E0
ov60_021E80E0: @ 0x021E80E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E80F2
	movs r0, #2
	strb r0, [r4]
_021E80F2:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E8102
	cmp r0, #1
	beq _021E8112
	cmp r0, #2
	beq _021E812E
	b _021E813A
_021E8102:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E8150
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E813A
_021E8112:
	adds r0, r5, #0
	bl ov60_021E769C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E8240
	cmp r0, #0
	beq _021E813A
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E813A
_021E812E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E85E0
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E813A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021E80E0

	thumb_func_start ov60_021E8140
ov60_021E8140: @ 0x021E8140
	push {r3, lr}
	bl ov60_021E7688
	bl FUN_0201EEB4
	bl FUN_0200B224
	pop {r3, pc}
	thumb_func_end ov60_021E8140

	thumb_func_start ov60_021E8150
ov60_021E8150: @ 0x021E8150
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, _021E81CC @ =0x00007FFF
	movs r0, #0
	bl FUN_0200FBF4
	ldr r1, _021E81CC @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
	adds r0, r5, #0
	bl ov60_021E7688
	adds r6, r0, #0
	bl FUN_020216C8
	bl FUN_02022638
	ldr r0, _021E81D0 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	adds r0, r5, #0
	bl ov60_021E866C
	adds r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E81D4 @ =ov60_021E8140
	adds r1, r5, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	bl ov60_021E8724
	movs r1, #0
	movs r0, #0xc0
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov60_021E6FAC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E87FC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E8978
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov60_021E81D8
	movs r0, #1
	strb r0, [r4, #1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021E81CC: .4byte 0x00007FFF
_021E81D0: .4byte 0x021D116C
_021E81D4: .4byte ov60_021E8140
	thumb_func_end ov60_021E8150

	thumb_func_start ov60_021E81D8
ov60_021E81D8: @ 0x021E81D8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	bl ov60_021E768C
	adds r4, r0, #0
	movs r0, #5
	lsls r0, r0, #6
	adds r1, r4, #0
	str r0, [sp]
	movs r3, #0
	adds r0, r5, #0
	adds r1, #0x30
	movs r2, #1
	str r3, [sp, #4]
	bl ov60_021E7074
	movs r0, #0xc0
	movs r2, #0
	str r0, [sp]
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x30
	adds r3, r2, #0
	str r2, [sp, #4]
	bl ov60_021E7074
	movs r0, #0x40
	str r0, [sp]
	subs r0, #0x41
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, #0x30
	movs r2, #2
	movs r3, #0
	bl ov60_021E7074
	movs r0, #0x40
	str r0, [sp]
	subs r0, #0x41
	adds r4, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #4
	movs r3, #0
	bl ov60_021E7074
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021E81D8

	thumb_func_start ov60_021E8240
ov60_021E8240: @ 0x021E8240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r4, r1, #0
	bl ov60_021E7688
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov60_021E768C
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov60_021E7978
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl ov60_021E796C
	cmp r0, #7
	bls _021E826A
	b _021E85D8
_021E826A:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E8276: @ jump table
	.2byte _021E8286 - _021E8276 - 2 @ case 0
	.2byte _021E82A8 - _021E8276 - 2 @ case 1
	.2byte _021E8340 - _021E8276 - 2 @ case 2
	.2byte _021E83D4 - _021E8276 - 2 @ case 3
	.2byte _021E845E - _021E8276 - 2 @ case 4
	.2byte _021E84EA - _021E8276 - 2 @ case 5
	.2byte _021E8576 - _021E8276 - 2 @ case 6
	.2byte _021E85C8 - _021E8276 - 2 @ case 7
_021E8286:
	movs r0, #3
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	ldr r3, _021E85C0 @ =0x00007FFF
	movs r0, #0
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #0
	strb r0, [r4, #3]
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E82A8:
	ldrb r0, [r4, #3]
	cmp r0, #0xa
	bhs _021E82CA
	ldr r1, _021E85C4 @ =0x021EB1CC
	lsls r0, r0, #2
	ldr r2, [r1, r0]
	ldr r1, [sp, #0xc]
	cmp r1, r2
	bne _021E82CA
	adds r0, r4, r0
	ldr r0, [r0, #0x3c]
	movs r1, #1
	bl ov60_021E6F28
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
_021E82CA:
	ldr r0, [sp, #0xc]
	cmp r0, #0x37
	bls _021E837C
	movs r0, #0xbf
	mvns r0, r0
	str r0, [sp]
	movs r0, #5
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, #0x30
	movs r2, #1
	movs r3, #0
	bl ov60_021E7120
	movs r0, #0xbf
	mvns r0, r0
	str r0, [sp]
	movs r0, #5
	adds r5, #0x30
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r3, r2, #0
	bl ov60_021E7120
	movs r0, #5
	movs r1, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0xc0
	bl ov60_021E8AE0
	movs r0, #5
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0xc0
	bl ov60_021E8AE0
	movs r1, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	movs r0, #4
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E8340:
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E837C
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E837C
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E837C
	adds r0, r4, #0
	movs r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E837C
	bl FUN_0200FB5C
	cmp r0, #0
	bne _021E837E
_021E837C:
	b _021E85D8
_021E837E:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x5a
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, #0x30
	movs r2, #1
	movs r3, #0x20
	bl ov60_021E7120
	movs r2, #0
	adds r5, #0x30
	str r2, [sp]
	movs r0, #0x5a
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	movs r3, #0x20
	bl ov60_021E7120
	movs r1, #0
	movs r0, #0x5a
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0x20
	adds r3, r1, #0
	bl ov60_021E8AE0
	movs r1, #1
	movs r0, #0x5a
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0x21
	movs r3, #0
	bl ov60_021E8AE0
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E83D4:
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	adds r0, r4, #0
	movs r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, #0x30
	movs r2, #1
	movs r3, #0x40
	bl ov60_021E7120
	movs r2, #0
	adds r5, #0x30
	str r2, [sp]
	movs r0, #7
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	movs r3, #0x40
	bl ov60_021E7120
	movs r1, #0
	movs r0, #7
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0x40
	adds r3, r1, #0
	bl ov60_021E8AE0
	movs r1, #1
	movs r0, #7
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0x41
	movs r3, #0
	bl ov60_021E8AE0
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E845E:
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	adds r0, r4, #0
	movs r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	bne _021E8494
_021E8492:
	b _021E85D8
_021E8494:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x42
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, #0x30
	movs r2, #1
	movs r3, #0x20
	bl ov60_021E7120
	movs r2, #0
	adds r5, #0x30
	str r2, [sp]
	movs r0, #0x42
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	movs r3, #0x20
	bl ov60_021E7120
	movs r1, #0
	movs r0, #0x42
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0x20
	adds r3, r1, #0
	bl ov60_021E8AE0
	movs r1, #1
	movs r0, #0x42
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0x21
	movs r3, #0
	bl ov60_021E8AE0
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E84EA:
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	adds r0, r4, #0
	movs r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	movs r0, #0x7f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0xa
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, #0x30
	movs r2, #1
	movs r3, #0
	bl ov60_021E7120
	movs r0, #0x3f
	mvns r0, r0
	str r0, [sp]
	movs r0, #5
	adds r5, #0x30
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r3, r2, #0
	bl ov60_021E7120
	movs r0, #0xa
	movs r1, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x80
	bl ov60_021E8AE0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0x80
	bl ov60_021E8AE0
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E8576:
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	adds r5, #0x30
	adds r0, r5, #0
	movs r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	adds r0, r4, #0
	movs r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	movs r1, #1
	adds r0, r6, #0
	adds r2, r1, #0
	movs r3, #8
	bl ov60_021E76F4
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
	nop
_021E85C0: .4byte 0x00007FFF
_021E85C4: .4byte 0x021EB1CC
_021E85C8:
	adds r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E85D8
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E85D8:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov60_021E8240

	thumb_func_start ov60_021E85E0
ov60_021E85E0: @ 0x021E85E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	adds r6, r1, #0
	bl ov60_021E768C
	str r0, [sp, #4]
	ldr r0, [sp]
	bl ov60_021E7688
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _021E8666
	movs r4, #0
	adds r7, r4, #0
_021E8608:
	movs r0, #0x28
	muls r0, r4, r0
	adds r5, r6, r0
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	beq _021E861A
	bl FUN_0200E390
	str r7, [r5, #0x6c]
_021E861A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _021E8608
	ldr r0, [sp]
	adds r1, r6, #0
	bl ov60_021E8914
	ldr r0, [sp, #4]
	movs r1, #4
	adds r0, #0x30
	bl ov60_021E7324
	ldr r0, [sp, #4]
	movs r1, #2
	adds r0, #0x30
	str r0, [sp, #4]
	bl ov60_021E7324
	ldr r0, [sp, #8]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [sp, #8]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [sp, #8]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [sp, #8]
	movs r1, #2
	bl FUN_0201BB4C
	movs r0, #0
	strb r0, [r6, #1]
_021E8666:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov60_021E85E0

	thumb_func_start ov60_021E866C
ov60_021E866C: @ 0x021E866C
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl ov60_021E7688
	add r3, sp, #0x70
	ldr r5, _021E8710 @ =0x021EB14C
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E8714 @ =0x021EB15C
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
	ldr r5, _021E8718 @ =0x021EB194
	add r3, sp, #0x38
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
	ldr r5, _021E871C @ =0x021EB1B0
	add r3, sp, #0x1c
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
	ldr r5, _021E8720 @ =0x021EB178
	add r3, sp, #0
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E8710: .4byte 0x021EB14C
_021E8714: .4byte 0x021EB15C
_021E8718: .4byte 0x021EB194
_021E871C: .4byte 0x021EB1B0
_021E8720: .4byte 0x021EB178
	thumb_func_end ov60_021E866C

	thumb_func_start ov60_021E8724
ov60_021E8724: @ 0x021E8724
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x21
	adds r2, r4, #0
	movs r3, #2
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x22
	adds r2, r4, #0
	movs r3, #4
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x23
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x24
	adds r2, r4, #0
	movs r3, #4
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x25
	adds r2, r4, #0
	bl FUN_02007914
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x26
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0x4a
	movs r2, #0
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #0x20
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0x4a
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #0x1f
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #1
	adds r1, r0, #0
	blx FUN_020D0E6C
	bl FUN_02022D24
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov60_021E8724

	thumb_func_start ov60_021E87FC
ov60_021E87FC: @ 0x021E87FC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, _021E8910 @ =0x021EB138
	adds r4, r0, #0
	bl ov60_021E6ED8
	adds r0, r4, #0
	bl ov60_021E6F20
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	adds r1, #0xbe
	movs r2, #0x4e
	movs r3, #1
	bl FUN_0200A1D8
	str r0, [r5, #4]
	movs r3, #0
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	adds r1, #0xbe
	movs r2, #0x4d
	bl FUN_0200A234
	str r0, [r5, #8]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, #0xbe
	movs r2, #0x50
	movs r3, #1
	bl FUN_0200A294
	str r0, [r5, #0xc]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xbe
	movs r2, #0x4f
	movs r3, #1
	bl FUN_0200A294
	movs r2, #0x4a
	adds r1, r2, #0
	str r0, [r5, #0x10]
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4]
	adds r1, #0xbe
	bl FUN_0200A1D8
	str r0, [r5, #0x14]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	adds r1, #0xbe
	movs r2, #0x49
	movs r3, #0
	bl FUN_0200A234
	str r0, [r5, #0x18]
	movs r3, #1
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, #0xbe
	movs r2, #0x4c
	bl FUN_0200A294
	str r0, [r5, #0x1c]
	movs r3, #1
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xbe
	movs r2, #0x4b
	bl FUN_0200A294
	str r0, [r5, #0x20]
	movs r4, #0
_021E88E0:
	lsls r0, r4, #4
	adds r6, r5, r0
	ldr r0, [r6, #4]
	bl FUN_0200ACF0
	ldr r0, [r6, #8]
	bl FUN_0200AF94
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _021E88E0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E8910: .4byte 0x021EB138
	thumb_func_end ov60_021E87FC

	thumb_func_start ov60_021E8914
ov60_021E8914: @ 0x021E8914
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #0x24]
	bl FUN_02024758
	ldr r0, [r5, #0x28]
	bl FUN_02024758
	ldr r0, [r5, #0x2c]
	bl FUN_02024758
	ldr r0, [r5, #0x30]
	bl FUN_02024758
	ldr r0, [r5, #0x34]
	bl FUN_02024758
	ldr r0, [r5, #0x38]
	bl FUN_02024758
	movs r4, #0
_021E8940:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl FUN_02024758
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xa
	blo _021E8940
	movs r4, #0
_021E8956:
	lsls r0, r4, #4
	adds r6, r5, r0
	ldr r0, [r6, #4]
	bl FUN_0200AEB0
	ldr r0, [r6, #8]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _021E8956
	adds r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E8914

	thumb_func_start ov60_021E8978
ov60_021E8978: @ 0x021E8978
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	ldr r3, _021E8AD8 @ =0x021EB140
	adds r5, r1, #0
	str r0, [sp, #8]
	add r2, sp, #0xc
	movs r1, #0xa
_021E8986:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _021E8986
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	movs r0, #0
	ldr r1, [sp, #8]
	adds r2, r0, #0
	movs r3, #3
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x20]
	movs r0, #3
	lsls r0, r0, #0x12
	str r0, [sp, #0x24]
	movs r4, #0
	add r7, sp, #0xc
_021E89B6:
	lsls r0, r4, #2
	adds r6, r5, r0
	add r0, sp, #0x18
	bl FUN_02024624
	str r0, [r6, #0x3c]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r6, #0x3c]
	movs r1, #0
	bl FUN_02024830
	ldrb r1, [r7, r4]
	ldr r0, [r6, #0x3c]
	bl FUN_020248F0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xa
	blo _021E89B6
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	movs r0, #1
	ldr r1, [sp, #8]
	adds r2, r0, #0
	adds r3, r0, #0
	bl ov60_021E6F3C
	movs r0, #1
	lsls r0, r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, _021E8ADC @ =0xFFFA0000
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	bl FUN_02024624
	str r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x24]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_020248F0
	add r0, sp, #0x18
	bl FUN_02024624
	str r0, [r5, #0x2c]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x2c]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x2c]
	movs r1, #1
	bl FUN_020248F0
	add r0, sp, #0x18
	bl FUN_02024624
	str r0, [r5, #0x34]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x34]
	movs r1, #2
	bl FUN_020248F0
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	movs r0, #1
	ldr r1, [sp, #8]
	adds r2, r0, #0
	adds r3, r0, #0
	bl ov60_021E6F3C
	movs r0, #5
	lsls r0, r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, _021E8ADC @ =0xFFFA0000
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	bl FUN_02024624
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x28]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x28]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x28]
	movs r1, #3
	bl FUN_020248F0
	add r0, sp, #0x18
	bl FUN_02024624
	str r0, [r5, #0x30]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x30]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x30]
	movs r1, #4
	bl FUN_020248F0
	add r0, sp, #0x18
	bl FUN_02024624
	str r0, [r5, #0x38]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x38]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x38]
	movs r1, #5
	bl FUN_020248F0
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E8AD8: .4byte 0x021EB140
_021E8ADC: .4byte 0xFFFA0000
	thumb_func_end ov60_021E8978

	thumb_func_start ov60_021E8AE0
ov60_021E8AE0: @ 0x021E8AE0
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r1, #0
	bne _021E8AFA
	adds r4, r0, #0
	ldr r1, [r0, #0x24]
	adds r4, #0x64
	str r1, [r4, #0x1c]
	ldr r1, [r0, #0x2c]
	str r1, [r4, #0x20]
	ldr r0, [r0, #0x34]
	b _021E8B08
_021E8AFA:
	adds r4, r0, #0
	ldr r1, [r0, #0x28]
	adds r4, #0x8c
	str r1, [r4, #0x1c]
	ldr r1, [r0, #0x30]
	str r1, [r4, #0x20]
	ldr r0, [r0, #0x38]
_021E8B08:
	str r0, [r4, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8B14
	bl GF_AssertFail
_021E8B14:
	movs r0, #1
	str r0, [r4]
	ldr r0, [sp, #0x10]
	strh r0, [r4, #4]
	movs r0, #0
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, [r4, #0x1c]
	bl FUN_020248AC
	ldr r2, [r0]
	asrs r1, r2, #0xb
	lsrs r1, r1, #0x14
	adds r1, r2, r1
	asrs r1, r1, #0xc
	str r1, [r4, #0x14]
	ldr r1, [r0, #4]
	movs r2, #0
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	str r0, [r4, #0x18]
	str r5, [r4, #0xc]
	ldr r0, _021E8B54 @ =ov60_021E8B7C
	adds r1, r4, #0
	str r6, [r4, #0x10]
	bl FUN_0200E320
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	nop
_021E8B54: .4byte ov60_021E8B7C
	thumb_func_end ov60_021E8AE0

	thumb_func_start ov60_021E8B58
ov60_021E8B58: @ 0x021E8B58
	cmp r1, #0
	bne _021E8B60
	adds r0, #0x64
	b _021E8B62
_021E8B60:
	adds r0, #0x8c
_021E8B62:
	ldr r1, [r0]
	cmp r1, #0
	bne _021E8B6C
	movs r0, #1
	bx lr
_021E8B6C:
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _021E8B76
	movs r0, #1
	bx lr
_021E8B76:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov60_021E8B58

	thumb_func_start ov60_021E8B7C
ov60_021E8B7C: @ 0x021E8B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	add r1, sp, #4
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r0, [r5, #6]
	adds r0, r0, #1
	strb r0, [r5, #6]
	movs r0, #4
	ldrb r4, [r5, #6]
	ldrsh r6, [r5, r0]
	ldr r1, [r5, #0xc]
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	ldr r1, [r5, #0x10]
	adds r7, r0, #0
	adds r0, r1, #0
	muls r0, r4, r0
	adds r1, r6, #0
	blx FUN_020F2998
	ldr r1, [r5, #0x14]
	adds r1, r7, r1
	str r1, [sp]
	ldr r1, [r5, #0x18]
	adds r7, r0, r1
	cmp r4, r6
	blt _021E8BD0
	ldr r0, [r5, #8]
	bl FUN_0200E390
	movs r1, #0
	str r1, [r5, #8]
	movs r0, #1
	strb r0, [r5, #7]
	str r1, [r5]
_021E8BD0:
	ldr r0, [sp]
	add r1, sp, #4
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	lsls r0, r7, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	bl FUN_020247D4
	ldr r0, [r5, #0x20]
	add r1, sp, #4
	bl FUN_020247D4
	ldr r0, [r5, #0x24]
	add r1, sp, #4
	bl FUN_020247D4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov60_021E8B7C

	thumb_func_start ov60_021E8BF8
ov60_021E8BF8: @ 0x021E8BF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E8C0A
	movs r0, #2
	strb r0, [r4]
_021E8C0A:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E8C1A
	cmp r0, #1
	beq _021E8C2A
	cmp r0, #2
	beq _021E8C46
	b _021E8C52
_021E8C1A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E8C68
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E8C52
_021E8C2A:
	adds r0, r5, #0
	bl ov60_021E769C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E8D38
	cmp r0, #0
	beq _021E8C52
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E8C52
_021E8C46:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E94A0
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E8C52:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021E8BF8

	thumb_func_start ov60_021E8C58
ov60_021E8C58: @ 0x021E8C58
	push {r3, lr}
	bl ov60_021E7688
	bl FUN_0201EEB4
	bl FUN_0200B224
	pop {r3, pc}
	thumb_func_end ov60_021E8C58

	thumb_func_start ov60_021E8C68
ov60_021E8C68: @ 0x021E8C68
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7688
	adds r6, r0, #0
	bl FUN_020216C8
	bl FUN_02022638
	ldr r0, _021E8CF8 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	bl FUN_02022D3C
	adds r0, r5, #0
	bl ov60_021E9580
	adds r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E8CFC @ =ov60_021E8C58
	adds r1, r5, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov60_021E9638
	movs r1, #0
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov60_021E6FAC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E9768
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E98C0
	movs r0, #4
	str r0, [sp]
	ldr r0, _021E8D00 @ =ov60_021E9BFC
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #0x4a
	movs r2, #1
	adds r3, r1, #0
	bl FUN_02026EB4
	movs r1, #0x6f
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov60_021E99B8
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov60_021E8D04
	movs r0, #1
	strb r0, [r4, #1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E8CF8: .4byte 0x021D116C
_021E8CFC: .4byte ov60_021E8C58
_021E8D00: .4byte ov60_021E9BFC
	thumb_func_end ov60_021E8C68

	thumb_func_start ov60_021E8D04
ov60_021E8D04: @ 0x021E8D04
	push {r3, lr}
	ldr r0, [r0, #0x64]
	movs r1, #1
	bl ov60_021E6F28
	movs r0, #6
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	pop {r3, pc}
	thumb_func_end ov60_021E8D04

	thumb_func_start ov60_021E8D38
ov60_021E8D38: @ 0x021E8D38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov60_021E7688
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov60_021E768C
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov60_021E7978
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov60_021E9B60
	adds r0, r6, #0
	bl ov60_021E796C
	cmp r0, #0x17
	bhi _021E8DEA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E8D74: @ jump table
	.2byte _021E8DA4 - _021E8D74 - 2 @ case 0
	.2byte _021E8DC6 - _021E8D74 - 2 @ case 1
	.2byte _021E8DE0 - _021E8D74 - 2 @ case 2
	.2byte _021E8E12 - _021E8D74 - 2 @ case 3
	.2byte _021E8E2C - _021E8D74 - 2 @ case 4
	.2byte _021E8E5C - _021E8D74 - 2 @ case 5
	.2byte _021E8E76 - _021E8D74 - 2 @ case 6
	.2byte _021E8E90 - _021E8D74 - 2 @ case 7
	.2byte _021E8EA4 - _021E8D74 - 2 @ case 8
	.2byte _021E8EB6 - _021E8D74 - 2 @ case 9
	.2byte _021E8F08 - _021E8D74 - 2 @ case 10
	.2byte _021E8F38 - _021E8D74 - 2 @ case 11
	.2byte _021E8FBE - _021E8D74 - 2 @ case 12
	.2byte _021E9016 - _021E8D74 - 2 @ case 13
	.2byte _021E9070 - _021E8D74 - 2 @ case 14
	.2byte _021E90B6 - _021E8D74 - 2 @ case 15
	.2byte _021E90F4 - _021E8D74 - 2 @ case 16
	.2byte _021E910C - _021E8D74 - 2 @ case 17
	.2byte _021E918E - _021E8D74 - 2 @ case 18
	.2byte _021E920C - _021E8D74 - 2 @ case 19
	.2byte _021E9278 - _021E8D74 - 2 @ case 20
	.2byte _021E936E - _021E8D74 - 2 @ case 21
	.2byte _021E93D8 - _021E8D74 - 2 @ case 22
	.2byte _021E9460 - _021E8D74 - 2 @ case 23
_021E8DA4:
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov60_021E9C84
	adds r0, r6, #0
	movs r1, #0
	movs r2, #1
	movs r3, #8
	bl ov60_021E76F4
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8DC6:
	ldr r0, [sp, #0x10]
	cmp r0, #0x28
	bls _021E8DEA
	adds r0, r6, #0
	movs r1, #3
	movs r2, #1
	movs r3, #8
	bl ov60_021E76F4
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8DE0:
	adds r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	bne _021E8DEC
_021E8DEA:
	b _021E9476
_021E8DEC:
	adds r0, r6, #0
	movs r1, #2
	movs r2, #1
	movs r3, #8
	bl ov60_021E76F4
	movs r0, #0x1d
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov60_021E9C84
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E12:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2e
	bls _021E8F0E
	adds r0, r6, #0
	movs r1, #3
	movs r2, #1
	movs r3, #8
	bl ov60_021E76F4
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E2C:
	adds r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	adds r0, r6, #0
	movs r1, #2
	movs r2, #1
	movs r3, #8
	bl ov60_021E76F4
	movs r0, #0x1d
	movs r1, #2
	lsls r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov60_021E9C84
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E5C:
	ldr r0, [sp, #0x10]
	cmp r0, #0x62
	bls _021E8F0E
	adds r0, r6, #0
	movs r1, #3
	movs r2, #1
	movs r3, #8
	bl ov60_021E76F4
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E76:
	adds r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	movs r0, #0x1d
	ldr r1, _021E91A8 @ =0x0000FFFF
	lsls r0, r0, #4
	str r1, [r5, r0]
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E90:
	adds r0, r6, #0
	movs r1, #2
	movs r2, #0
	movs r3, #8
	bl ov60_021E76F4
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8EA4:
	adds r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8EB6:
	ldr r3, _021E91AC @ =0x021EB250
	add r2, sp, #0x1f8
	ldm r3!, {r0, r1}
	adds r4, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrb r2, [r5, #3]
	lsls r0, r2, #2
	ldr r1, [r4, r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	blt _021E8F0E
	adds r0, r2, #1
	strb r0, [r5, #3]
	ldrb r0, [r5, #3]
	movs r1, #4
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r3, [r0, #0x24]
	adds r0, r7, #0
	adds r2, r3, #0
	ldr r3, [r3, #8]
	adds r2, #0xc
	bl FUN_0201C0A8
	adds r0, r7, #0
	movs r1, #4
	bl FUN_0201EFBC
	ldrb r0, [r5, #3]
	cmp r0, #3
	blo _021E8F0E
	ldr r0, [r5, #0x64]
	movs r1, #0
	bl ov60_021E6F28
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8F08:
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	bhs _021E8F10
_021E8F0E:
	b _021E9476
_021E8F10:
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	ldr r3, [r5, #0x34]
	adds r0, r7, #0
	adds r2, r3, #0
	ldr r3, [r3, #8]
	movs r1, #4
	adds r2, #0xc
	bl FUN_0201C0A8
	adds r0, r7, #0
	movs r1, #4
	bl FUN_0201EFBC
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8F38:
	ldr r0, [sp, #0x10]
	cmp r0, #5
	bne _021E8F60
	ldr r3, _021E91B0 @ =0x021EB3C8
	add r2, sp, #0x1cc
	movs r5, #5
_021E8F44:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E8F44
	ldr r0, [r3]
	movs r1, #5
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x1cc
	bl ov60_021E7398
_021E8F60:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2c
	blo _021E9024
	ldr r3, _021E91B4 @ =0x021EB3F4
	add r2, sp, #0x1a0
	movs r5, #5
_021E8F6C:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E8F6C
	ldr r0, [r3]
	movs r1, #7
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x1a0
	bl ov60_021E7398
	ldr r2, _021E91B8 @ =0x04001000
	movs r3, #0xff
	ldr r1, [r2]
	ldr r0, _021E91BC @ =0xFFFF1FFF
	adds r4, #0x30
	ands r1, r0
	lsrs r0, r2, #0xd
	orrs r0, r1
	str r0, [r2]
	movs r0, #0
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #4
	mvns r3, r3
	bl ov60_021E7074
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8FBE:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #4
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9024
	ldr r3, _021E91C0 @ =0x021EB420
	add r2, sp, #0x174
	movs r5, #5
_021E8FD2:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E8FD2
	ldr r0, [r3]
	movs r1, #7
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x174
	bl ov60_021E7398
	movs r0, #0
	movs r2, #5
	str r0, [sp]
	movs r0, #7
	adds r4, #0x30
	adds r3, r2, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r3, #0xfb
	bl ov60_021E7074
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9016:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	bne _021E9026
_021E9024:
	b _021E9476
_021E9026:
	ldr r3, _021E91C4 @ =0x021EB44C
	add r2, sp, #0x148
	movs r5, #5
_021E902C:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E902C
	ldr r0, [r3]
	movs r1, #1
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x148
	bl ov60_021E7398
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r4, #0x30
	movs r3, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #6
	mvns r3, r3
	bl ov60_021E7074
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9070:
	adds r4, #0x30
	adds r0, r4, #0
	movs r1, #6
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E912E
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _021E91BC @ =0xFFFF1FFF
	ldr r3, _021E91B8 @ =0x04001000
	ands r2, r1
	str r2, [r0]
	ldr r2, [r3]
	lsrs r0, r0, #0xc
	ands r1, r2
	str r1, [r3]
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x29
	adds r2, r7, #0
	movs r3, #7
	bl FUN_020078F0
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E90B6:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2a
	blo _021E912E
	ldr r5, _021E91C8 @ =0x021EB478
	add r3, sp, #0x11c
	movs r2, #5
_021E90C2:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E90C2
	ldr r0, [r5]
	movs r1, #3
	str r0, [r3]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x11c
	bl ov60_021E7398
	ldr r2, _021E91B8 @ =0x04001000
	ldr r0, _021E91BC @ =0xFFFF1FFF
	ldr r1, [r2]
	ands r1, r0
	lsrs r0, r2, #0xd
	orrs r0, r1
	str r0, [r2]
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E90F4:
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r1, #0
	bl ov60_021E7434
	cmp r0, #0
	beq _021E912E
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E910C:
	ldr r0, [sp, #0x10]
	cmp r0, #0x38
	bne _021E911A
	ldr r0, [r5, #0x68]
	movs r1, #1
	bl ov60_021E6F28
_021E911A:
	ldr r0, [sp, #0x10]
	cmp r0, #0x91
	bne _021E9128
	ldr r0, [r5, #0x6c]
	movs r1, #1
	bl ov60_021E6F28
_021E9128:
	ldr r0, [sp, #0x10]
	cmp r0, #0x91
	bhs _021E9130
_021E912E:
	b _021E9476
_021E9130:
	ldr r3, _021E91CC @ =0x021EB4A4
	add r2, sp, #0xf0
	movs r5, #5
_021E9136:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E9136
	ldr r0, [r3]
	movs r1, #0xa
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0xf0
	bl ov60_021E7398
	ldr r1, _021E91D0 @ =0x000046B9
	ldr r0, _021E91D4 @ =0x04001042
	adds r4, #0x30
	strh r1, [r0]
	ldr r1, _021E91D8 @ =0x000040C0
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E91DC @ =0xFFFFC0FF
	ands r2, r1
	movs r1, #0x1d
	lsls r1, r1, #8
	orrs r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	strh r1, [r0, #6]
	movs r0, #0
	movs r2, #5
	str r0, [sp]
	movs r0, #0xa
	adds r3, r2, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	subs r3, #0x79
	bl ov60_021E7074
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E918E:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9294
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	ldr r5, _021E91E0 @ =0x021EB4D0
	b _021E91E4
	.align 2, 0
_021E91A8: .4byte 0x0000FFFF
_021E91AC: .4byte 0x021EB250
_021E91B0: .4byte 0x021EB3C8
_021E91B4: .4byte 0x021EB3F4
_021E91B8: .4byte 0x04001000
_021E91BC: .4byte 0xFFFF1FFF
_021E91C0: .4byte 0x021EB420
_021E91C4: .4byte 0x021EB44C
_021E91C8: .4byte 0x021EB478
_021E91CC: .4byte 0x021EB4A4
_021E91D0: .4byte 0x000046B9
_021E91D4: .4byte 0x04001042
_021E91D8: .4byte 0x000040C0
_021E91DC: .4byte 0xFFFFC0FF
_021E91E0: .4byte 0x021EB4D0
_021E91E4:
	add r3, sp, #0xc4
	movs r2, #5
_021E91E8:
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E91E8
	ldr r0, [r5]
	movs r1, #0
	str r0, [r3]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r2, r1, #0
	add r3, sp, #0xc4
	bl ov60_021E7398
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E920C:
	ldr r0, [r5, #0x70]
	movs r1, #1
	bl ov60_021E6F28
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	blo _021E9294
	ldr r3, _021E9480 @ =0x021EB4FC
	add r2, sp, #0x98
	movs r5, #5
_021E9220:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E9220
	ldr r0, [r3]
	movs r1, #0xa
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x98
	bl ov60_021E7398
	ldr r1, _021E9484 @ =0x000046B9
	ldr r0, _021E9488 @ =0x04001042
	adds r4, #0x30
	strh r1, [r0]
	ldr r1, _021E948C @ =0x00004080
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E9490 @ =0xFFFFC0FF
	ands r2, r1
	movs r1, #0x19
	lsls r1, r1, #8
	orrs r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	strh r1, [r0, #6]
	movs r0, #0
	movs r2, #6
	str r0, [sp]
	movs r0, #0xa
	adds r3, r2, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	subs r3, #0x7a
	bl ov60_021E7074
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9278:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9294
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #6
	bl ov60_021E72FC
	cmp r0, #0
	bne _021E9296
_021E9294:
	b _021E9476
_021E9296:
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #5
	ldr r2, _021E9494 @ =0x021EB528
	add r3, sp, #0x6c
	mov ip, r0
_021E92A6:
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	mov r0, ip
	subs r0, r0, #1
	mov ip, r0
	bne _021E92A6
	ldr r0, [r2]
	movs r1, #0
	str r0, [r3]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r2, r1, #0
	add r3, sp, #0x6c
	bl ov60_021E7398
	ldr r3, [r5, #0x38]
	adds r0, r7, #0
	adds r2, r3, #0
	ldr r3, [r3, #8]
	movs r1, #5
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r3, [r5, #0x3c]
	adds r0, r7, #0
	adds r2, r3, #0
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r3, [r5, #0x40]
	adds r0, r7, #0
	adds r2, r3, #0
	ldr r3, [r3, #8]
	movs r1, #7
	adds r2, #0xc
	bl FUN_0201C0A8
	adds r0, r7, #0
	movs r1, #5
	bl FUN_0201EFBC
	adds r0, r7, #0
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r7, #0
	movs r1, #7
	bl FUN_0201EFBC
	movs r2, #0
	adds r0, r7, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r7, #0
	movs r1, #5
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r2, #0
	adds r0, r7, #0
	movs r1, #6
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r7, #0
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r2, #0
	adds r0, r7, #0
	movs r1, #7
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r7, #0
	movs r1, #7
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E936E:
	ldr r0, [r5, #0x74]
	movs r1, #1
	bl ov60_021E6F28
	ldr r0, [sp, #0x10]
	cmp r0, #0x1e
	blo _021E9476
	ldr r3, _021E9498 @ =0x021EB370
	add r2, sp, #0x40
	movs r5, #5
_021E9382:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E9382
	ldr r0, [r3]
	movs r1, #0xa
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x40
	bl ov60_021E7398
	ldr r1, _021E9484 @ =0x000046B9
	ldr r0, _021E9488 @ =0x04001042
	adds r4, #0x30
	strh r1, [r0]
	ldr r1, _021E948C @ =0x00004080
	movs r3, #0x74
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E9490 @ =0xFFFFC0FF
	ands r2, r1
	movs r1, #0x1e
	lsls r1, r1, #8
	orrs r2, r1
	lsrs r1, r0, #0xd
	orrs r1, r2
	strh r1, [r0, #6]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #4
	bl ov60_021E7074
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E93D8:
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #4
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9476
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	ldr r3, _021E949C @ =0x021EB39C
	add r2, sp, #0x14
	movs r5, #5
_021E93F4:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _021E93F4
	ldr r0, [r3]
	movs r1, #0xfd
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r4, r0
	movs r2, #0
	add r3, sp, #0x14
	bl ov60_021E7398
	movs r0, #0x2f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0xfe
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, #0x30
	movs r2, #5
	movs r3, #0
	bl ov60_021E7074
	movs r0, #0x1f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0xfe
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, #0x30
	movs r2, #6
	movs r3, #0
	bl ov60_021E7074
	movs r0, #7
	mvns r0, r0
	str r0, [sp]
	movs r0, #0xfe
	adds r4, #0x30
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #7
	movs r3, #0
	bl ov60_021E7074
	adds r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9460:
	adds r4, #0x30
	adds r0, r4, #0
	movs r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9476
	add sp, #0x1fc
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021E9476:
	movs r0, #0
	add sp, #0x1fc
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	nop
_021E9480: .4byte 0x021EB4FC
_021E9484: .4byte 0x000046B9
_021E9488: .4byte 0x04001042
_021E948C: .4byte 0x00004080
_021E9490: .4byte 0xFFFFC0FF
_021E9494: .4byte 0x021EB528
_021E9498: .4byte 0x021EB370
_021E949C: .4byte 0x021EB39C
	thumb_func_end ov60_021E8D38

	thumb_func_start ov60_021E94A0
ov60_021E94A0: @ 0x021E94A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	adds r7, r1, #0
	bl ov60_021E7688
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _021E957C
	bl FUN_02023148
	adds r0, r7, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02023120
	movs r0, #0
	str r0, [sp, #8]
_021E94CE:
	ldr r1, [sp, #8]
	movs r0, #0x68
	muls r0, r1, r0
	movs r5, #0
	adds r6, r7, r0
_021E94D8:
	lsls r4, r5, #2
	adds r1, r6, r4
	movs r0, #7
	adds r1, #0xe4
	lsls r0, r0, #6
	ldr r1, [r1]
	adds r0, r7, r0
	blx FUN_020C2BA0
	adds r0, r6, r4
	adds r0, #0xdc
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _021E94D8
	adds r6, #0xd8
	ldr r0, [r6]
	bl FUN_0201AB0C
	ldr r0, [sp, #8]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #3
	blo _021E94CE
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	bl FUN_02026F54
	movs r4, #0
_021E9520:
	lsls r0, r4, #2
	adds r0, r7, r0
	ldr r0, [r0, #4]
	bl FUN_0201AB0C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E9520
	movs r4, #0
_021E9536:
	lsls r0, r4, #2
	adds r0, r7, r0
	ldr r0, [r0, #0x18]
	bl FUN_0201AB0C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021E9536
	ldr r0, [r7, #0x14]
	bl FUN_0201AB0C
	ldr r0, [sp]
	adds r1, r7, #0
	bl ov60_021E9878
	ldr r0, [sp, #4]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [sp, #4]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r0, [sp, #4]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [sp, #4]
	movs r1, #7
	bl FUN_0201BB4C
	movs r0, #0
	strb r0, [r7, #1]
_021E957C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E94A0

	thumb_func_start ov60_021E9580
ov60_021E9580: @ 0x021E9580
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl ov60_021E7688
	add r3, sp, #0x70
	ldr r5, _021E9624 @ =0x021EB268
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E9628 @ =0x021EB2DC
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
	ldr r5, _021E962C @ =0x021EB2F8
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
	ldr r5, _021E9630 @ =0x021EB314
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
	ldr r5, _021E9634 @ =0x021EB330
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E9624: .4byte 0x021EB268
_021E9628: .4byte 0x021EB2DC
_021E962C: .4byte 0x021EB2F8
_021E9630: .4byte 0x021EB314
_021E9634: .4byte 0x021EB330
	thumb_func_end ov60_021E9580

	thumb_func_start ov60_021E9638
ov60_021E9638: @ 0x021E9638
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, _021E9760 @ =0x021EB288
	str r0, [sp, #0x10]
	adds r6, r1, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x20
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _021E9764 @ =0x021EB25C
	add r2, sp, #0x14
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #0x28
	str r0, [r2]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xbe
	movs r3, #4
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xbe
	movs r1, #0x2e
	movs r3, #7
	bl FUN_02007914
	adds r7, r6, #0
	movs r4, #0
	adds r7, #0x24
_021E9692:
	movs r0, #0x4a
	lsls r5, r4, #2
	str r0, [sp]
	add r1, sp, #0x20
	ldr r1, [r1, r5]
	adds r0, #0xbe
	movs r2, #1
	adds r3, r7, r5
	bl FUN_020079D8
	adds r1, r6, r5
	str r0, [r1, #4]
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E9692
	adds r7, r6, #0
	movs r5, #0
	adds r7, #0x38
_021E96BA:
	movs r0, #0x4a
	lsls r4, r5, #2
	str r0, [sp]
	add r1, sp, #0x14
	ldr r1, [r1, r4]
	adds r0, #0xbe
	movs r2, #1
	adds r3, r7, r4
	bl FUN_020079D8
	adds r1, r6, r4
	str r0, [r1, #0x18]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _021E96BA
	movs r0, #0x4a
	adds r3, r6, #0
	str r0, [sp]
	adds r0, #0xbe
	movs r1, #0x2f
	movs r2, #1
	adds r3, #0x34
	bl FUN_020079D8
	str r0, [r6, #0x14]
	ldr r3, [r6, #0x24]
	movs r0, #0
	str r0, [sp]
	adds r2, r3, #0
	ldr r0, [sp, #0x10]
	ldr r3, [r3, #8]
	movs r1, #4
	adds r2, #0xc
	bl FUN_0201BF94
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xbe
	movs r1, #0x30
	movs r3, #5
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r0, #0xbe
	movs r1, #0x31
	movs r3, #6
	bl FUN_02007914
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x4a
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #0x27
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #1
	adds r1, r0, #0
	blx FUN_020D0E6C
	bl FUN_02022D24
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9760: .4byte 0x021EB288
_021E9764: .4byte 0x021EB25C
	thumb_func_end ov60_021E9638

	thumb_func_start ov60_021E9768
ov60_021E9768: @ 0x021E9768
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r1, _021E9874 @ =0x021EB1F4
	adds r4, r0, #0
	bl ov60_021E6ED8
	adds r0, r4, #0
	bl ov60_021E6F20
	adds r4, r0, #0
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	adds r1, #0xbe
	movs r2, #0x42
	movs r3, #1
	bl FUN_0200A1D8
	str r0, [r5, #0x44]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	adds r1, #0xbe
	movs r2, #0x41
	movs r3, #0
	bl FUN_0200A234
	str r0, [r5, #0x48]
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, #0xbe
	movs r2, #0x44
	movs r3, #1
	bl FUN_0200A294
	str r0, [r5, #0x4c]
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xbe
	movs r2, #0x43
	movs r3, #1
	bl FUN_0200A294
	str r0, [r5, #0x50]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	adds r1, #0xbe
	movs r2, #0x46
	movs r3, #1
	bl FUN_0200A1D8
	str r0, [r5, #0x54]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	adds r1, #0xbe
	movs r2, #0x45
	movs r3, #0
	bl FUN_0200A234
	str r0, [r5, #0x58]
	movs r0, #3
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	adds r1, #0xbe
	movs r2, #0x48
	movs r3, #1
	bl FUN_0200A294
	str r0, [r5, #0x5c]
	movs r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	adds r1, #0xbe
	movs r2, #0x47
	movs r3, #1
	bl FUN_0200A294
	str r0, [r5, #0x60]
	movs r4, #0
_021E984E:
	lsls r0, r4, #4
	adds r6, r5, r0
	ldr r0, [r6, #0x44]
	bl FUN_0200ACF0
	ldr r0, [r6, #0x48]
	bl FUN_0200AF94
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _021E984E
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E9874: .4byte 0x021EB1F4
	thumb_func_end ov60_021E9768

	thumb_func_start ov60_021E9878
ov60_021E9878: @ 0x021E9878
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #0x64]
	bl FUN_02024758
	ldr r0, [r5, #0x68]
	bl FUN_02024758
	ldr r0, [r5, #0x6c]
	bl FUN_02024758
	ldr r0, [r5, #0x70]
	bl FUN_02024758
	ldr r0, [r5, #0x74]
	bl FUN_02024758
	movs r4, #0
_021E989E:
	lsls r0, r4, #4
	adds r6, r5, r0
	ldr r0, [r6, #0x44]
	bl FUN_0200AEB0
	ldr r0, [r6, #0x48]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _021E989E
	adds r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E9878

	thumb_func_start ov60_021E98C0
ov60_021E98C0: @ 0x021E98C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	ldr r3, _021E99B0 @ =0x021EB214
	str r0, [sp, #8]
	adds r5, r1, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x18
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021E99B4 @ =0x021EB220
	str r0, [r2]
	ldm r3!, {r0, r1}
	add r2, sp, #0xc
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, [sp, #8]
	str r0, [r2]
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	movs r0, #2
	movs r2, #0
	adds r3, r0, #0
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x2c]
	movs r0, #0x26
	lsls r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl FUN_02024624
	str r0, [r5, #0x64]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x64]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x64]
	movs r1, #0
	bl FUN_020248F0
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	movs r0, #3
	movs r2, #0
	movs r3, #2
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x10
	str r0, [sp, #0x2c]
	movs r0, #0x26
	lsls r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl FUN_02024624
	str r0, [r5, #0x68]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x68]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x68]
	movs r1, #0
	bl FUN_020248F0
	movs r7, #0
	add r6, sp, #0x18
	add r4, sp, #0xc
_021E9962:
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	movs r0, #3
	movs r2, #0
	movs r3, #2
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x2c]
	ldr r0, [r6]
	lsls r0, r0, #0xc
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl FUN_02024624
	str r0, [r5, #0x6c]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x6c]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x6c]
	ldr r1, [r4]
	bl FUN_020248F0
	adds r7, r7, #1
	adds r6, r6, #4
	adds r5, r5, #4
	adds r4, r4, #4
	cmp r7, #3
	blt _021E9962
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E99B0: .4byte 0x021EB214
_021E99B4: .4byte 0x021EB220
	thumb_func_end ov60_021E98C0

	thumb_func_start ov60_021E99B8
ov60_021E99B8: @ 0x021E99B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0xc]
	movs r0, #0x42
	lsls r0, r0, #2
	movs r1, #0x4a
	bl FUN_02007688
	str r0, [sp, #0x18]
	movs r1, #7
	ldr r0, [sp, #0xc]
	lsls r1, r1, #6
	adds r0, r0, r1
	movs r1, #0x4a
	movs r2, #4
	bl FUN_0201AC14
	movs r0, #0
	str r0, [sp, #0x1c]
_021E99DE:
	ldr r0, [sp, #0x1c]
	movs r1, #0x68
	adds r7, r0, #0
	muls r7, r1, r7
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	lsls r2, r1, #2
	ldr r1, _021E9B44 @ =0x021EB22C
	ldr r1, [r1, r2]
	movs r2, #0x4a
	bl FUN_0200771C
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0xc]
	adds r1, r1, r7
	adds r1, #0xd8
	str r0, [r1]
	ldr r0, [sp, #0xc]
	adds r2, #0xd8
	adds r0, #0x84
	adds r0, r0, r7
	add r1, sp, #0x28
	adds r2, r2, r7
	bl FUN_0201F51C
	ldr r0, [sp, #0xc]
	adds r0, r0, r7
	adds r0, #0xd8
	ldr r0, [r0]
	blx FUN_020C3B50
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	movs r1, #0
	movs r2, #0x40
	blx FUN_020C2BAC
	ldr r0, [sp, #0x28]
	movs r1, #0
	movs r2, #0x80
	blx FUN_020C2BAC
	movs r2, #2
	ldr r0, [sp, #0x28]
	movs r1, #0
	lsls r2, r2, #8
	blx FUN_020C2BAC
	movs r2, #1
	ldr r0, [sp, #0x28]
	movs r1, #0
	lsls r2, r2, #0xa
	blx FUN_020C2BAC
	ldr r0, [sp, #0x28]
	movs r1, #0
	movs r2, #0xf
	blx FUN_020C2C54
	ldr r0, [sp, #0x1c]
	ldr r1, _021E9B48 @ =0x021EB2C4
	lsls r0, r0, #3
	adds r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	movs r6, #0
	adds r5, r0, r7
	str r0, [sp, #0x20]
	adds r0, #0x84
	str r0, [sp, #0x20]
_021E9A6A:
	ldr r1, [sp, #0x10]
	lsls r4, r6, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r1, r4]
	movs r2, #0x4a
	bl FUN_0200771C
	adds r1, r5, r4
	adds r1, #0xdc
	str r0, [r1]
	adds r0, r5, r4
	adds r0, #0xdc
	ldr r0, [r0]
	movs r1, #0
	blx FUN_020C3B90
	str r0, [sp, #0x24]
	movs r0, #7
	ldr r1, [sp, #0xc]
	lsls r0, r0, #6
	adds r0, r1, r0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	blx FUN_020C2B7C
	adds r1, r5, r4
	adds r1, #0xe4
	str r0, [r1]
	adds r0, r5, r4
	adds r0, #0xe4
	ldr r0, [r0]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x14]
	blx FUN_020BE008
	adds r1, r5, r4
	ldr r0, [sp, #0x20]
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r0, r7
	blx FUN_020BE294
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #2
	blo _021E9A6A
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	cmp r0, #3
	blo _021E99DE
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	movs r0, #0x4a
	bl FUN_02023114
	ldr r1, [sp, #0xc]
	add r3, sp, #0x2c
	adds r1, #0x80
	ldr r4, _021E9B4C @ =0x021EB238
	str r0, [r1]
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	ldr r1, _021E9B50 @ =0x0019AEC1
	str r0, [r3]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r3, _021E9B54 @ =0x000005C1
	adds r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #8]
	adds r0, r2, #0
	ldr r2, _021E9B58 @ =0x021EB29C
	bl FUN_02023254
	ldr r1, [sp, #0xc]
	ldr r0, _021E9B5C @ =0x00000981
	adds r1, #0x80
	ldr r1, [r1]
	bl FUN_02023494
	ldr r0, [sp, #0xc]
	adds r0, #0x80
	str r0, [sp, #0xc]
	ldr r0, [r0]
	bl FUN_0202313C
	movs r0, #0x1f
	str r0, [sp]
	movs r0, #2
	lsls r0, r0, #0xe
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #5
	movs r2, #2
	adds r3, r1, #0
	blx FUN_020BF0CC
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E9B44: .4byte 0x021EB22C
_021E9B48: .4byte 0x021EB2C4
_021E9B4C: .4byte 0x021EB238
_021E9B50: .4byte 0x0019AEC1
_021E9B54: .4byte 0x000005C1
_021E9B58: .4byte 0x021EB29C
_021E9B5C: .4byte 0x00000981
	thumb_func_end ov60_021E99B8

	thumb_func_start ov60_021E9B60
ov60_021E9B60: @ 0x021E9B60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r4, _021E9BF0 @ =0x021EB34C
	adds r5, r0, #0
	add r3, sp, #0x18
	movs r2, #4
_021E9B6C:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E9B6C
	ldr r0, [r4]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021E9BF4 @ =0x021EB244
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, _021E9BF8 @ =0x0000FFFF
	cmp r4, r0
	beq _021E9BEC
	bl FUN_02026E48
	bl FUN_02023154
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	movs r4, #1
	movs r0, #0x68
	adds r7, r1, #0
	muls r7, r0, r7
	movs r2, #0
	adds r3, r5, r7
	lsls r4, r4, #0xc
_021E9BB4:
	lsls r0, r2, #2
	adds r0, r3, r0
	adds r0, #0xe4
	ldr r1, [r0]
	ldr r6, [r1, #8]
	ldr r0, [r1]
	ldrh r6, [r6, #4]
	adds r0, r0, r4
	lsls r6, r6, #0xc
	cmp r0, r6
	bge _021E9BCC
	str r0, [r1]
_021E9BCC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	blo _021E9BB4
	adds r5, #0x84
	adds r0, r5, r7
	add r1, sp, #0
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl FUN_0201F554
	movs r0, #0
	movs r1, #1
	bl FUN_02026E50
_021E9BEC:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E9BF0: .4byte 0x021EB34C
_021E9BF4: .4byte 0x021EB244
_021E9BF8: .4byte 0x0000FFFF
	thumb_func_end ov60_021E9B60

	thumb_func_start ov60_021E9BFC
ov60_021E9BFC: @ 0x021E9BFC
	push {r3, lr}
	ldr r0, _021E9C68 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	strh r2, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _021E9C6C @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021E9C70 @ =0x0000CFFB
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
	ldr r0, _021E9C74 @ =0x021EB278
	blx FUN_020CF8E4
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _021E9C78 @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _021E9C7C @ =0xBFFF0000
	ldr r0, _021E9C80 @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	nop
_021E9C68: .4byte 0x04000008
_021E9C6C: .4byte 0xFFFFCFFD
_021E9C70: .4byte 0x0000CFFB
_021E9C74: .4byte 0x021EB278
_021E9C78: .4byte 0x00007FFF
_021E9C7C: .4byte 0xBFFF0000
_021E9C80: .4byte 0x04000580
	thumb_func_end ov60_021E9BFC

	thumb_func_start ov60_021E9C84
ov60_021E9C84: @ 0x021E9C84
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [sp]
	movs r1, #0x30
	muls r1, r0, r1
	ldr r2, _021E9CF0 @ =0x021EB554
	lsls r0, r0, #3
	adds r6, r2, r1
	ldr r1, _021E9CF4 @ =0x021EB2AC
	movs r4, #0
	adds r5, r1, r0
	movs r7, #0xc
_021E9C9C:
	adds r1, r4, #0
	muls r1, r7, r1
	adds r3, r6, r1
	ldr r2, [r3, #4]
	ldr r1, [r6, r1]
	ldr r3, [r3, #8]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	adds r0, r4, #0
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	asrs r3, r3, #0x10
	blx FUN_020BF034
	lsls r1, r4, #1
	ldrh r1, [r5, r1]
	adds r0, r4, #0
	blx FUN_020BF070
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021E9C9C
	ldr r0, [sp]
	ldr r1, _021E9CF8 @ =0x021EB208
	lsls r4, r0, #1
	ldr r0, _021E9CFC @ =0x021EB202
	ldrh r1, [r1, r4]
	ldrh r0, [r0, r4]
	movs r2, #0
	blx FUN_020BF084
	ldr r0, _021E9D00 @ =0x021EB1FC
	ldr r1, _021E9D04 @ =0x021EB20E
	ldrh r0, [r0, r4]
	ldrh r1, [r1, r4]
	movs r2, #0
	blx FUN_020BF0A8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E9CF0: .4byte 0x021EB554
_021E9CF4: .4byte 0x021EB2AC
_021E9CF8: .4byte 0x021EB208
_021E9CFC: .4byte 0x021EB202
_021E9D00: .4byte 0x021EB1FC
_021E9D04: .4byte 0x021EB20E
	thumb_func_end ov60_021E9C84

	thumb_func_start ov60_021E9D08
ov60_021E9D08: @ 0x021E9D08
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E9D1A
	movs r0, #2
	strb r0, [r4]
_021E9D1A:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E9D2A
	cmp r0, #1
	beq _021E9D3A
	cmp r0, #2
	beq _021E9D56
	b _021E9D62
_021E9D2A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E9D78
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E9D62
_021E9D3A:
	adds r0, r5, #0
	bl ov60_021E769C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021E9E84
	cmp r0, #0
	beq _021E9D62
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021E9D62
_021E9D56:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EA21C
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E9D62:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021E9D08

	thumb_func_start ov60_021E9D68
ov60_021E9D68: @ 0x021E9D68
	push {r3, lr}
	bl ov60_021E7688
	bl FUN_0201EEB4
	bl FUN_0200B224
	pop {r3, pc}
	thumb_func_end ov60_021E9D68

	thumb_func_start ov60_021E9D78
ov60_021E9D78: @ 0x021E9D78
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7688
	adds r6, r0, #0
	bl FUN_020216C8
	bl FUN_02022638
	ldr r0, _021E9E6C @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	adds r0, r5, #0
	bl ov60_021EA2A0
	adds r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E9E70 @ =ov60_021E9D68
	adds r1, r5, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov60_021EA3A0
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov60_021E6FAC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EA508
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EA700
	movs r0, #4
	str r0, [sp]
	ldr r0, _021E9E74 @ =ov60_021EA918
	movs r1, #0
	str r0, [sp, #4]
	movs r0, #0x4a
	movs r2, #1
	adds r3, r1, #0
	bl FUN_02026EB4
	str r0, [r4, #0x5c]
	bl FUN_02014DA0
	movs r1, #0x12
	movs r0, #0x4a
	lsls r1, r1, #0xa
	bl FUN_0201AA8C
	str r0, [r4, #0x60]
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	str r0, [sp, #4]
	movs r3, #0x12
	ldr r0, _021E9E78 @ =ov60_021EA828
	ldr r1, _021E9E7C @ =ov60_021EA84C
	ldr r2, [r4, #0x60]
	lsls r3, r3, #0xa
	bl FUN_02014DB4
	str r0, [r4, #0x64]
	bl FUN_02015524
	adds r2, r0, #0
	movs r0, #1
	movs r1, #0xe1
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	movs r0, #0x3b
	movs r1, #4
	movs r2, #0x4a
	bl FUN_02015264
	adds r1, r0, #0
	ldr r0, [r4, #0x64]
	movs r2, #0xa
	movs r3, #1
	bl FUN_0201526C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov60_021EA4AC
	movs r1, #0
	ldr r0, _021E9E80 @ =0x04000050
	movs r2, #0x3e
	adds r3, r1, #0
	str r1, [sp]
	blx FUN_020CF15C
	movs r0, #1
	strb r0, [r4, #1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E9E6C: .4byte 0x021D116C
_021E9E70: .4byte ov60_021E9D68
_021E9E74: .4byte ov60_021EA918
_021E9E78: .4byte ov60_021EA828
_021E9E7C: .4byte ov60_021EA84C
_021E9E80: .4byte 0x04000050
	thumb_func_end ov60_021E9D78

	thumb_func_start ov60_021E9E84
ov60_021E9E84: @ 0x021E9E84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xc0
	adds r6, r0, #0
	adds r4, r1, #0
	bl ov60_021E7688
	str r0, [sp, #0xc]
	adds r0, r6, #0
	bl ov60_021E768C
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov60_021E7978
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov60_021E796C
	cmp r0, #0x14
	bls _021E9EAE
	b _021EA1FA
_021E9EAE:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E9EBA: @ jump table
	.2byte _021E9EE4 - _021E9EBA - 2 @ case 0
	.2byte _021E9F04 - _021E9EBA - 2 @ case 1
	.2byte _021E9F14 - _021E9EBA - 2 @ case 2
	.2byte _021E9FAE - _021E9EBA - 2 @ case 3
	.2byte _021E9FD2 - _021E9EBA - 2 @ case 4
	.2byte _021E9FE0 - _021E9EBA - 2 @ case 5
	.2byte _021EA05A - _021E9EBA - 2 @ case 6
	.2byte _021EA0B2 - _021E9EBA - 2 @ case 7
	.2byte _021EA0C2 - _021E9EBA - 2 @ case 8
	.2byte _021EA0D2 - _021E9EBA - 2 @ case 9
	.2byte _021EA0E6 - _021E9EBA - 2 @ case 10
	.2byte _021EA0F6 - _021E9EBA - 2 @ case 11
	.2byte _021EA106 - _021E9EBA - 2 @ case 12
	.2byte _021EA116 - _021E9EBA - 2 @ case 13
	.2byte _021EA128 - _021E9EBA - 2 @ case 14
	.2byte _021EA138 - _021E9EBA - 2 @ case 15
	.2byte _021EA148 - _021E9EBA - 2 @ case 16
	.2byte _021EA158 - _021E9EBA - 2 @ case 17
	.2byte _021EA182 - _021E9EBA - 2 @ case 18
	.2byte _021EA1D4 - _021E9EBA - 2 @ case 19
	.2byte _021EA1EA - _021E9EBA - 2 @ case 20
_021E9EE4:
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #9
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9F04:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E9FD6
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9F14:
	ldr r3, _021EA204 @ =0x021EB73C
	add r2, sp, #0x94
	movs r7, #5
_021E9F1A:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r7, r7, #1
	bne _021E9F1A
	ldr r0, [r3]
	movs r1, #0xa
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r2, #0
	add r3, sp, #0x94
	bl ov60_021E7398
	ldr r3, _021EA208 @ =0x021EB768
	add r2, sp, #0x68
	movs r7, #5
_021E9F3C:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r7, r7, #1
	bne _021E9F3C
	ldr r0, [r3]
	movs r1, #0xa
	str r0, [r2]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r2, #1
	add r3, sp, #0x68
	bl ov60_021E7398
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r1, r5, #0
	ldr r0, [sp, #0xc]
	adds r1, #0x30
	movs r2, #5
	movs r3, #0xc0
	bl ov60_021E7074
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	movs r2, #1
	str r0, [sp, #4]
	adds r5, #0x30
	adds r3, r2, #0
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	subs r3, #0xc1
	bl ov60_021E7074
	ldr r0, [r4, #0x44]
	movs r1, #1
	bl ov60_021E6F28
	ldr r0, [r4, #0x48]
	movs r1, #1
	bl ov60_021E6F28
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9FAE:
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9FD6
	adds r5, #0x30
	adds r0, r5, #0
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9FD6
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9FD2:
	cmp r7, #0x19
	bhi _021E9FD8
_021E9FD6:
	b _021EA1FA
_021E9FD8:
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9FE0:
	ldr r4, _021EA20C @ =0x021EB794
	add r3, sp, #0x3c
	movs r2, #5
_021E9FE6:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E9FE6
	ldr r0, [r4]
	movs r1, #0xa
	str r0, [r3]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r2, #0
	add r3, sp, #0x3c
	bl ov60_021E7398
	ldr r4, _021EA210 @ =0x021EB710
	add r3, sp, #0x10
	movs r2, #5
_021EA008:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021EA008
	ldr r0, [r4]
	movs r1, #0xa
	str r0, [r3]
	movs r0, #0x11
	lsls r0, r0, #4
	adds r0, r5, r0
	movs r2, #1
	add r3, sp, #0x10
	bl ov60_021E7398
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	adds r1, r5, #0
	ldr r0, [sp, #0xc]
	adds r1, #0x30
	movs r2, #5
	movs r3, #0xc0
	bl ov60_021E7074
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	movs r2, #1
	str r0, [sp, #4]
	adds r5, #0x30
	adds r3, r2, #0
	ldr r0, [sp, #0xc]
	adds r1, r5, #0
	subs r3, #0xc1
	bl ov60_021E7074
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA05A:
	adds r0, r5, #0
	adds r0, #0x30
	movs r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021EA0DC
	adds r5, #0x30
	adds r0, r5, #0
	movs r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021EA0DC
	ldr r0, [r4, #0x44]
	movs r1, #0
	bl ov60_021E6F28
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl ov60_021E6F28
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021EA214 @ =0xFFFF1FFF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021EA218 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0B2:
	ldr r0, [r4, #0x50]
	movs r1, #1
	bl ov60_021E6F28
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0C2:
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021EA8C8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0D2:
	ldr r0, [r4, #0x64]
	bl FUN_020154B0
	cmp r0, #0
	beq _021EA0DE
_021EA0DC:
	b _021EA1FA
_021EA0DE:
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0E6:
	adds r0, r4, #0
	movs r1, #0
	bl ov60_021EA990
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0F6:
	ldr r0, [r4, #0x54]
	movs r1, #1
	bl ov60_021E6F28
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA106:
	adds r0, r4, #0
	movs r1, #1
	bl ov60_021EA8C8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA116:
	ldr r0, [r4, #0x64]
	bl FUN_020154B0
	cmp r0, #0
	bne _021EA1FA
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA128:
	adds r0, r4, #0
	movs r1, #1
	bl ov60_021EA990
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA138:
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl ov60_021E6F28
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA148:
	adds r0, r4, #0
	movs r1, #2
	bl ov60_021EA8C8
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA158:
	ldr r0, [r4, #0x64]
	bl FUN_020154B0
	cmp r0, #0
	bne _021EA1FA
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #8
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA182:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EA1FA
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r5, #0
	adds r7, r5, #0
_021EA1B6:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x50]
	adds r1, r7, #0
	bl ov60_021E6F28
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _021EA1B6
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA1D4:
	movs r0, #0
	bl FUN_0200FBE8
	ldr r0, [r4, #0x4c]
	movs r1, #1
	bl ov60_021E6F28
	adds r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA1EA:
	ldr r0, [r4, #0x4c]
	bl FUN_02024B68
	cmp r0, #0
	bne _021EA1FA
	add sp, #0xc0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA1FA:
	bl ov60_021EA8B0
	movs r0, #0
	add sp, #0xc0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA204: .4byte 0x021EB73C
_021EA208: .4byte 0x021EB768
_021EA20C: .4byte 0x021EB794
_021EA210: .4byte 0x021EB710
_021EA214: .4byte 0xFFFF1FFF
_021EA218: .4byte 0x04001000
	thumb_func_end ov60_021E9E84

	thumb_func_start ov60_021EA21C
ov60_021EA21C: @ 0x021EA21C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov60_021E7688
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _021EA28A
	ldr r0, _021EA29C @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x64]
	bl FUN_02014EBC
	ldr r0, [r5, #0x60]
	bl FUN_0201AB0C
	ldr r0, [r5, #0x5c]
	bl FUN_02026F54
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov60_021EA6AC
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #3
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
	movs r0, #0
	strb r0, [r5, #1]
_021EA28A:
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	beq _021EA298
	bl FUN_0200E390
	movs r0, #0
	str r0, [r5, #0x6c]
_021EA298:
	pop {r4, r5, r6, pc}
	nop
_021EA29C: .4byte 0x04000050
	thumb_func_end ov60_021EA21C

	thumb_func_start ov60_021EA2A0
ov60_021EA2A0: @ 0x021EA2A0
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	bl ov60_021E7688
	add r3, sp, #0xa8
	ldr r5, _021EA384 @ =0x021EB634
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021EA388 @ =0x021EB644
	add r3, sp, #0x8c
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
	ldr r5, _021EA38C @ =0x021EB660
	add r3, sp, #0x70
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
	ldr r5, _021EA390 @ =0x021EB67C
	add r3, sp, #0x54
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
	ldr r5, _021EA394 @ =0x021EB698
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
	ldr r5, _021EA398 @ =0x021EB6B4
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
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021EA39C @ =0x021EB6D0
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
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021EA384: .4byte 0x021EB634
_021EA388: .4byte 0x021EB644
_021EA38C: .4byte 0x021EB660
_021EA390: .4byte 0x021EB67C
_021EA394: .4byte 0x021EB698
_021EA398: .4byte 0x021EB6B4
_021EA39C: .4byte 0x021EB6D0
	thumb_func_end ov60_021EA2A0

	thumb_func_start ov60_021EA3A0
ov60_021EA3A0: @ 0x021EA3A0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x36
	adds r2, r4, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x36
	adds r2, r4, #0
	movs r3, #5
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x3a
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x37
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x38
	adds r2, r4, #0
	movs r3, #3
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x39
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x37
	adds r2, r4, #0
	movs r3, #6
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x38
	adds r2, r4, #0
	movs r3, #7
	bl FUN_02007914
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0x4a
	movs r2, #0
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #0x35
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0x4a
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #0x35
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #1
	adds r1, r0, #0
	blx FUN_020D0E6C
	bl FUN_02022D24
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov60_021EA3A0

	thumb_func_start ov60_021EA4AC
ov60_021EA4AC: @ 0x021EA4AC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	bl ov60_021E768C
	adds r4, r0, #0
	movs r0, #0
	movs r2, #5
	str r0, [sp]
	adds r1, r4, #0
	adds r3, r2, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, #0x30
	subs r3, #0xc5
	bl ov60_021E7074
	movs r0, #0
	str r0, [sp]
	adds r4, #0x30
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #0xc0
	bl ov60_021E7074
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021EA4AC

	thumb_func_start ov60_021EA508
ov60_021EA508: @ 0x021EA508
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	ldr r3, _021EA694 @ =0x021EB610
	adds r4, r0, #0
	str r1, [sp, #0x10]
	ldm r3!, {r0, r1}
	add r2, sp, #0x48
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA698 @ =0x021EB5EC
	str r0, [r2]
	ldm r3!, {r0, r1}
	add r2, sp, #0x3c
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA69C @ =0x021EB604
	str r0, [r2]
	ldm r3!, {r0, r1}
	add r2, sp, #0x30
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA6A0 @ =0x021EB628
	str r0, [r2]
	ldm r3!, {r0, r1}
	add r2, sp, #0x24
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA6A4 @ =0x021EB5F8
	str r0, [r2]
	ldm r3!, {r0, r1}
	add r2, sp, #0x18
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021EA6A8 @ =0x021EB5E4
	str r0, [r2]
	adds r0, r4, #0
	bl ov60_021E6ED8
	adds r0, r4, #0
	bl ov60_021E6F20
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7]
	adds r1, #0xbe
	movs r2, #0x52
	movs r3, #1
	bl FUN_0200A1D8
	ldr r1, [sp, #0x10]
	movs r3, #0
	str r0, [r1, #4]
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r7, #4]
	adds r1, #0xbe
	movs r2, #0x51
	bl FUN_0200A234
	ldr r1, [sp, #0x10]
	movs r2, #0x54
	str r0, [r1, #8]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7, #8]
	adds r1, #0xbe
	movs r3, #1
	bl FUN_0200A294
	ldr r1, [sp, #0x10]
	movs r2, #0x53
	str r0, [r1, #0xc]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7, #0xc]
	adds r1, #0xbe
	movs r3, #1
	bl FUN_0200A294
	ldr r1, [sp, #0x10]
	str r0, [r1, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
_021EA5D2:
	ldr r0, [sp, #0x14]
	add r2, sp, #0x3c
	lsls r6, r0, #2
	add r0, sp, #0x18
	ldr r4, [r0, r6]
	ldr r0, [sp, #0x14]
	movs r3, #1
	lsls r1, r0, #4
	ldr r0, [sp, #0x10]
	str r4, [sp]
	adds r5, r0, r1
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	movs r1, #0x42
	ldr r0, [r7]
	ldr r2, [r2, r6]
	lsls r1, r1, #2
	bl FUN_0200A1D8
	str r0, [r5, #0x14]
	movs r1, #0x42
	str r4, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	add r2, sp, #0x48
	ldr r0, [r7, #4]
	ldr r2, [r2, r6]
	lsls r1, r1, #2
	movs r3, #0
	bl FUN_0200A234
	str r0, [r5, #0x18]
	movs r1, #0x42
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	add r2, sp, #0x24
	ldr r0, [r7, #8]
	ldr r2, [r2, r6]
	lsls r1, r1, #2
	movs r3, #1
	bl FUN_0200A294
	str r0, [r5, #0x1c]
	movs r1, #0x42
	str r4, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	add r2, sp, #0x30
	ldr r0, [r7, #0xc]
	ldr r2, [r2, r6]
	lsls r1, r1, #2
	movs r3, #1
	bl FUN_0200A294
	str r0, [r5, #0x20]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #3
	blo _021EA5D2
	movs r4, #0
_021EA664:
	ldr r0, [sp, #0x10]
	lsls r1, r4, #4
	adds r5, r0, r1
	ldr r0, [r5, #4]
	bl FUN_0200ACF0
	ldr r0, [r5, #8]
	bl FUN_0200AF94
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021EA664
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021EA694: .4byte 0x021EB610
_021EA698: .4byte 0x021EB5EC
_021EA69C: .4byte 0x021EB604
_021EA6A0: .4byte 0x021EB628
_021EA6A4: .4byte 0x021EB5F8
_021EA6A8: .4byte 0x021EB5E4
	thumb_func_end ov60_021EA508

	thumb_func_start ov60_021EA6AC
ov60_021EA6AC: @ 0x021EA6AC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #0x44]
	bl FUN_02024758
	ldr r0, [r5, #0x48]
	bl FUN_02024758
	ldr r0, [r5, #0x4c]
	bl FUN_02024758
	movs r4, #0
_021EA6C6:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x50]
	bl FUN_02024758
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021EA6C6
	movs r4, #0
_021EA6DC:
	lsls r0, r4, #4
	adds r6, r5, r0
	ldr r0, [r6, #4]
	bl FUN_0200AEB0
	ldr r0, [r6, #8]
	bl FUN_0200B0A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _021EA6DC
	adds r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov60_021EA6AC

	thumb_func_start ov60_021EA700
ov60_021EA700: @ 0x021EA700
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	ldr r3, _021EA824 @ =0x021EB61C
	adds r7, r0, #0
	adds r6, r1, #0
	ldm r3!, {r0, r1}
	add r2, sp, #8
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r7, #0
	str r0, [r2]
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	movs r0, #0
	adds r2, r0, #0
	movs r3, #2
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x1c]
	movs r0, #0x16
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl FUN_02024624
	str r0, [r6, #0x44]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r6, #0x44]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r6, #0x44]
	movs r1, #0
	bl FUN_020248F0
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	movs r3, #1
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x1c]
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl FUN_02024624
	str r0, [r6, #0x48]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r6, #0x48]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r6, #0x48]
	movs r1, #1
	bl FUN_020248F0
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r0, #0
	movs r3, #1
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x1c]
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl FUN_02024624
	str r0, [r6, #0x4c]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r6, #0x4c]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r6, #0x4c]
	movs r1, #2
	bl FUN_020248F0
	movs r4, #0
_021EA7D0:
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	lsls r5, r4, #2
	add r0, sp, #8
	ldr r0, [r0, r5]
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	bl ov60_021E6F3C
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #0x1c]
	movs r0, #6
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
	adds r5, r6, r5
	add r0, sp, #0x14
	bl FUN_02024624
	str r0, [r5, #0x50]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [r5, #0x50]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x50]
	movs r1, #0
	bl FUN_020248F0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _021EA7D0
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA824: .4byte 0x021EB61C
	thumb_func_end ov60_021EA700

	thumb_func_start ov60_021EA828
ov60_021EA828: @ 0x021EA828
	push {r4, lr}
	ldr r3, _021EA848 @ =0x02110924
	movs r2, #0
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bl FUN_02015354
	cmp r4, #0
	bne _021EA840
	bl GF_AssertFail
_021EA840:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_021EA848: .4byte 0x02110924
	thumb_func_end ov60_021EA828

	thumb_func_start ov60_021EA84C
ov60_021EA84C: @ 0x021EA84C
	push {r4, lr}
	ldr r3, _021EA86C @ =0x0211092C
	movs r2, #1
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bne _021EA85E
	bl GF_AssertFail
_021EA85E:
	adds r0, r4, #0
	bl FUN_02015394
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_021EA86C: .4byte 0x0211092C
	thumb_func_end ov60_021EA84C

	thumb_func_start ov60_021EA870
ov60_021EA870: @ 0x021EA870
	push {r3}
	sub sp, #0xc
	add r1, sp, #0
	movs r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	movs r1, #0x40
	str r2, [sp]
	str r2, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r1, r2, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	adds r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #8]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	adds r1, r2, r1
	str r1, [r0, #0x30]
	add sp, #0xc
	pop {r3}
	bx lr
	.align 2, 0
	thumb_func_end ov60_021EA870

	thumb_func_start ov60_021EA8B0
ov60_021EA8B0: @ 0x021EA8B0
	push {r3, lr}
	bl FUN_02026E48
	bl FUN_0201543C
	bl FUN_02015460
	movs r0, #1
	movs r1, #0
	bl FUN_02026E50
	pop {r3, pc}
	thumb_func_end ov60_021EA8B0

	thumb_func_start ov60_021EA8C8
ov60_021EA8C8: @ 0x021EA8C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x64]
	adds r6, r1, #0
	movs r1, #1
	bl FUN_02015528
	movs r0, #0xc
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r1, _021EA908 @ =0x021EB6EC
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C @ =ov60_021EA870
	movs r3, #0
	bl FUN_02015494
	ldr r1, _021EA910 @ =0x021EB6F0
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C @ =ov60_021EA870
	movs r3, #0
	bl FUN_02015494
	ldr r1, _021EA914 @ =0x021EB6F4
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C @ =ov60_021EA870
	movs r3, #0
	bl FUN_02015494
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EA908: .4byte 0x021EB6EC
_021EA90C: .4byte ov60_021EA870
_021EA910: .4byte 0x021EB6F0
_021EA914: .4byte 0x021EB6F4
	thumb_func_end ov60_021EA8C8

	thumb_func_start ov60_021EA918
ov60_021EA918: @ 0x021EA918
	push {r3, lr}
	ldr r0, _021EA978 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	strh r2, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _021EA97C @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	adds r2, r1, #2
	adds r1, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021EA980 @ =0x0000CFFB
	ands r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	subs r2, #0x1c
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	ands r1, r2
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _021EA984 @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _021EA988 @ =0xBFFF0000
	ldr r0, _021EA98C @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_021EA978: .4byte 0x04000008
_021EA97C: .4byte 0xFFFFCFFD
_021EA980: .4byte 0x0000CFFB
_021EA984: .4byte 0x00007FFF
_021EA988: .4byte 0xBFFF0000
_021EA98C: .4byte 0x04000580
	thumb_func_end ov60_021EA918

	thumb_func_start ov60_021EA990
ov60_021EA990: @ 0x021EA990
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4, #0x68]
	ldr r0, _021EA9A4 @ =ov60_021EA9A8
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E33C
	str r0, [r4, #0x6c]
	pop {r4, pc}
	.align 2, 0
_021EA9A4: .4byte ov60_021EA9A8
	thumb_func_end ov60_021EA990

	thumb_func_start ov60_021EA9A8
ov60_021EA9A8: @ 0x021EA9A8
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x68]
	cmp r0, #0
	beq _021EA9DA
	ldr r0, _021EAA10 @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	b _021EAA00
_021EA9DA:
	ldr r0, _021EAA10 @ =0x021D116C
	movs r1, #0
	strb r1, [r0, #9]
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #1
	bl FUN_02022CC8
_021EAA00:
	bl FUN_02022D3C
	ldr r0, [r4, #0x6c]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #0x6c]
	pop {r4, pc}
	.align 2, 0
_021EAA10: .4byte 0x021D116C
	thumb_func_end ov60_021EA9A8

	thumb_func_start ov60_021EAA14
ov60_021EAA14: @ 0x021EAA14
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021EAA26
	movs r0, #2
	strb r0, [r4]
_021EAA26:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021EAA36
	cmp r0, #1
	beq _021EAA46
	cmp r0, #2
	beq _021EAA62
	b _021EAA6E
_021EAA36:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EAA84
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021EAA6E
_021EAA46:
	adds r0, r5, #0
	bl ov60_021E769C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EAB04
	cmp r0, #0
	beq _021EAA6E
	ldrb r0, [r4]
	adds r0, r0, #1
	strb r0, [r4]
	b _021EAA6E
_021EAA62:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EAC14
	movs r0, #1
	pop {r3, r4, r5, pc}
_021EAA6E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov60_021EAA14

	thumb_func_start ov60_021EAA74
ov60_021EAA74: @ 0x021EAA74
	push {r3, lr}
	bl ov60_021E7688
	bl FUN_0201EEB4
	bl FUN_0200B224
	pop {r3, pc}
	thumb_func_end ov60_021EAA74

	thumb_func_start ov60_021EAA84
ov60_021EAA84: @ 0x021EAA84
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov60_021E7688
	adds r6, r0, #0
	ldr r0, _021EAAFC @ =0x021D116C
	movs r1, #1
	strb r1, [r0, #9]
	bl FUN_02022D3C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	adds r0, r5, #0
	bl ov60_021EAC5C
	adds r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021EAB00 @ =ov60_021EAA74
	adds r1, r5, #0
	bl FUN_0201A0FC
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov60_021EAD14
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov60_021E6FAC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EAE10
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov60_021EAE18
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov60_021EADF0
	movs r0, #1
	strb r0, [r4, #1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EAAFC: .4byte 0x021D116C
_021EAB00: .4byte ov60_021EAA74
	thumb_func_end ov60_021EAA84

	thumb_func_start ov60_021EAB04
ov60_021EAB04: @ 0x021EAB04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov60_021E7688
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov60_021E768C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov60_021E7978
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov60_021E796C
	cmp r0, #4
	bhi _021EAC08
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EAB36: @ jump table
	.2byte _021EAB40 - _021EAB36 - 2 @ case 0
	.2byte _021EAB5E - _021EAB36 - 2 @ case 1
	.2byte _021EAB6E - _021EAB36 - 2 @ case 2
	.2byte _021EABD6 - _021EAB36 - 2 @ case 3
	.2byte _021EABFA - _021EAB36 - 2 @ case 4
_021EAB40:
	movs r0, #0x12
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r1, #0x4a
	str r1, [sp, #8]
	movs r1, #9
	movs r2, #5
	movs r3, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EAB5E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EAC08
	adds r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EAB6E:
	movs r0, #0x3f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, #0x30
	movs r2, #1
	movs r3, #0
	bl ov60_021E7074
	movs r0, #0x3f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, #0x30
	movs r2, #2
	movs r3, #0
	bl ov60_021E7074
	movs r0, #0x3f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0x49
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, #0x30
	movs r2, #5
	movs r3, #0
	bl ov60_021E7074
	movs r0, #0x3f
	mvns r0, r0
	str r0, [sp]
	movs r0, #0x49
	adds r5, #0x30
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #0
	bl ov60_021E7074
	adds r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EABD6:
	cmp r7, #0x14
	blo _021EAC08
	movs r0, #0x32
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x4a
	str r0, [sp, #8]
	movs r0, #0
	ldr r3, _021EAC10 @ =0x00007FFF
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EABFA:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021EAC08
	add sp, #0xc
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_021EAC08:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021EAC10: .4byte 0x00007FFF
	thumb_func_end ov60_021EAB04

	thumb_func_start ov60_021EAC14
ov60_021EAC14: @ 0x021EAC14
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov60_021E7688
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _021EAC5A
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov60_021EAE14
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0201BB4C
	movs r0, #0
	strb r0, [r5, #1]
_021EAC5A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov60_021EAC14

	thumb_func_start ov60_021EAC5C
ov60_021EAC5C: @ 0x021EAC5C
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl ov60_021E7688
	add r3, sp, #0x70
	ldr r5, _021EAD00 @ =0x021EB7C0
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021EAD04 @ =0x021EB7EC
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
	ldr r5, _021EAD08 @ =0x021EB7D0
	add r3, sp, #0x38
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
	ldr r5, _021EAD0C @ =0x021EB808
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
	adds r0, r4, #0
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021EAD10 @ =0x021EB824
	add r3, sp, #0
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021EAD00: .4byte 0x021EB7C0
_021EAD04: .4byte 0x021EB7EC
_021EAD08: .4byte 0x021EB7D0
_021EAD0C: .4byte 0x021EB808
_021EAD10: .4byte 0x021EB824
	thumb_func_end ov60_021EAC5C

	thumb_func_start ov60_021EAD14
ov60_021EAD14: @ 0x021EAD14
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x3b
	adds r2, r4, #0
	movs r3, #5
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x3c
	adds r2, r4, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x3f
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x3d
	adds r2, r4, #0
	movs r3, #6
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x3e
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x4a
	str r0, [sp, #0xc]
	adds r0, #0xbe
	movs r1, #0x40
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007914
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x4a
	movs r2, #0
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #0x1f
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x4a
	str r0, [sp, #4]
	adds r0, #0xbe
	movs r1, #0x27
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #1
	adds r1, r0, #0
	blx FUN_020D0E6C
	bl FUN_02022D24
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov60_021EAD14

	thumb_func_start ov60_021EADF0
ov60_021EADF0: @ 0x021EADF0
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #2
	movs r2, #3
	movs r3, #0xa0
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #6
	movs r2, #3
	movs r3, #0xa0
	bl FUN_0201BC8C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov60_021EADF0

	thumb_func_start ov60_021EAE10
ov60_021EAE10: @ 0x021EAE10
	bx lr
	.align 2, 0
	thumb_func_end ov60_021EAE10

	thumb_func_start ov60_021EAE14
ov60_021EAE14: @ 0x021EAE14
	bx lr
	.align 2, 0
	thumb_func_end ov60_021EAE14

	thumb_func_start ov60_021EAE18
ov60_021EAE18: @ 0x021EAE18
	bx lr
	.align 2, 0
	thumb_func_end ov60_021EAE18

	.rodata

_021EAE1C:
	.byte 0x03, 0x00, 0x12, 0x20
	.byte 0x02, 0x02, 0x01, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0xE0, 0x01, 0x00, 0x00, 0xF0, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x14, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x05, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x12, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x0B, 0x00, 0x00, 0x10, 0x0B, 0x00, 0x00, 0xD0, 0x12, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0xF0, 0x14, 0x00, 0x00, 0xB0, 0xED, 0xFF, 0x00, 0x80, 0x12, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x0B, 0x00, 0x00, 0x10, 0x0B, 0x00, 0x00, 0xD0, 0x12, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x27, 0x00, 0x00, 0x80, 0x09, 0x00, 0x00, 0x00, 0x10, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x90, 0x06, 0x00, 0x00, 0x20, 0x0A, 0x00, 0x00, 0x30, 0x12, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0xB0, 0x18, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0xF0, 0x0B, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x90, 0x06, 0x00, 0x00, 0x20, 0x0A, 0x00, 0x00, 0x30, 0x12, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x1A, 0x00, 0x00, 0x70, 0x05, 0x00, 0x00, 0xB0, 0x14, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x59, 0x1E, 0x02, 0xC9, 0x59, 0x1E, 0x02, 0xA5, 0x5C, 0x1E, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x4A, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x69, 0x6B, 0x1E, 0x02, 0x09, 0x6C, 0x1E, 0x02, 0xFD, 0x6C, 0x1E, 0x02, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x4A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x03, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x02, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x4A, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x05, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x01, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x02, 0x02, 0x02, 0x02, 0x4A, 0x00, 0x00, 0x00, 0x10, 0x42, 0xCE, 0x41
	.byte 0x31, 0x46, 0xEF, 0x3D, 0xCE, 0x41, 0xEF, 0x3D, 0x69, 0x2D, 0x4A, 0x29, 0x8B, 0x31, 0xCE, 0x39
	.byte 0x08, 0x2D, 0x08, 0x1D, 0x20, 0x02, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00, 0x60, 0x02, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x38, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x19, 0x00, 0x02, 0xD6, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00, 0xD6, 0x52, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00, 0x6B, 0x41, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x13, 0x32, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x03, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x7E, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x86, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x86, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x04, 0x04, 0x04, 0x04, 0x4A, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x55, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_021EB860:
	.byte 0x85, 0x79, 0x1E, 0x02, 0xE1, 0x80, 0x1E, 0x02, 0xF9, 0x8B, 0x1E, 0x02, 0x09, 0x9D, 0x1E, 0x02
	.byte 0x15, 0xAA, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x021EB880
