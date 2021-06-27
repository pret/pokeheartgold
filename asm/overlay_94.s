
	thumb_func_start ov94_021E5900
ov94_021E5900: @ 0x021E5900
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5912
	bl GF_AssertFail
_021E5912:
	movs r0, #0xc
	movs r1, #0x1c
	bl FUN_0201AA8C
	movs r1, #0x32
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	ldr r0, _021E5938 @ =0x00000C65
	ldrb r1, [r4, r0]
	adds r0, #0x1b
	ldr r0, [r4, r0]
	str r1, [r0, #0x14]
	pop {r4, pc}
	nop
_021E5938: .4byte 0x00000C65
	thumb_func_end ov94_021E5900

	thumb_func_start ov94_021E593C
ov94_021E593C: @ 0x021E593C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r1, #0x32
	ldr r0, _021E5AD8 @ =0x00000654
	lsls r1, r1, #6
	ldr r4, [r5, r1]
	ldr r0, [r5, r0]
	subs r1, #0x1b
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl FUN_02074644
	ldr r1, [r4]
	adds r6, r0, #0
	cmp r1, #0xa
	bls _021E595E
	b _021E5AD2
_021E595E:
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E596A: @ jump table
	.2byte _021E5980 - _021E596A - 2 @ case 0
	.2byte _021E59E2 - _021E596A - 2 @ case 1
	.2byte _021E59E2 - _021E596A - 2 @ case 2
	.2byte _021E59E8 - _021E596A - 2 @ case 3
	.2byte _021E59F6 - _021E596A - 2 @ case 4
	.2byte _021E5A0C - _021E596A - 2 @ case 5
	.2byte _021E5A40 - _021E596A - 2 @ case 6
	.2byte _021E5A4E - _021E596A - 2 @ case 7
	.2byte _021E5A5A - _021E596A - 2 @ case 8
	.2byte _021E5A6A - _021E596A - 2 @ case 9
	.2byte _021E5AB2 - _021E596A - 2 @ case 10
_021E5980:
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	ldr r2, _021E5ADC @ =0x000001DF
	str r0, [r4, #0xc]
	cmp r0, r2
	beq _021E59C2
	adds r1, r2, #0
	adds r1, #8
	cmp r0, r1
	beq _021E59A0
	adds r2, #0xd
	cmp r0, r2
	beq _021E59B0
	b _021E59C2
_021E59A0:
	adds r0, r6, #0
	bl FUN_02071CA0
	movs r0, #0x41
	str r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0x10]
	b _021E59C6
_021E59B0:
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02071D6C
	movs r0, #0x23
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0x10]
	b _021E59C6
_021E59C2:
	bl GF_AssertFail
_021E59C6:
	ldr r0, _021E5AD8 @ =0x00000654
	ldr r0, [r5, r0]
	ldr r0, [r0, #0x1c]
	bl FUN_0203E344
	bl FUN_0202A634
	adds r1, r6, #0
	bl FUN_0202A434
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E59E2:
	adds r0, r1, #1
	str r0, [r4]
	b _021E5AD2
_021E59E8:
	adds r0, r5, #0
	bl ov94_021E5B04
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E59F6:
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	adds r0, r4, #0
	bl ov94_021E5BA0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A0C:
	ldr r0, [r4, #4]
	adds r1, r0, #1
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	bne _021E5A22
	ldr r1, _021E5AE0 @ =0x00000C65
	adds r0, r5, #0
	ldrb r1, [r5, r1]
	bl FUN_0207ECE0
_021E5A22:
	bl ov94_021E5C60
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	ble _021E5AD2
	ldr r0, [r4, #0x18]
	bl FUN_020154B0
	cmp r0, #0
	bne _021E5AD2
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A40:
	adds r0, r5, #0
	bl ov94_021E5B30
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A4E:
	bl FUN_020720D4
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A5A:
	bl FUN_02006360
	cmp r0, #0
	bne _021E5AD2
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5A6A:
	movs r0, #0x1f
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0xbc
	bl FUN_0200BBA0
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _021E5AE4 @ =0x000007C4
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF8C
	ldr r1, _021E5AE4 @ =0x000007C4
	adds r2, r7, #0
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r7, #0
	bl FUN_02026380
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	movs r2, #1
	bl FUN_0207DAEC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E5AD2
_021E5AB2:
	ldr r0, _021E5AE8 @ =0x00000C64
	ldrb r0, [r5, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021E5AD2
	adds r0, r5, #0
	bl ov94_021E5AEC
	ldr r0, _021E5AD8 @ =0x00000654
	movs r1, #0
	ldr r0, [r5, r0]
	adds r0, #0x27
	strb r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5AD2:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5AD8: .4byte 0x00000654
_021E5ADC: .4byte 0x000001DF
_021E5AE0: .4byte 0x00000C65
_021E5AE4: .4byte 0x000007C4
_021E5AE8: .4byte 0x00000C64
	thumb_func_end ov94_021E593C

	thumb_func_start ov94_021E5AEC
ov94_021E5AEC: @ 0x021E5AEC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x32
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov94_021E5AEC

	thumb_func_start ov94_021E5B04
ov94_021E5B04: @ 0x021E5B04
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	adds r4, r0, #0
	bl FUN_0207991C
	movs r0, #0x32
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov94_021E5B54
	movs r1, #0
	ldr r0, _021E5B2C @ =0x04000050
	movs r2, #0x3f
	movs r3, #0x1f
	str r1, [sp]
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E5B2C: .4byte 0x04000050
	thumb_func_end ov94_021E5B04

	thumb_func_start ov94_021E5B30
ov94_021E5B30: @ 0x021E5B30
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl ov94_021E5C84
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0207991C
	ldr r0, _021E5B50 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	pop {r4, pc}
	nop
_021E5B50: .4byte 0x04000050
	thumb_func_end ov94_021E5B30

	thumb_func_start ov94_021E5B54
ov94_021E5B54: @ 0x021E5B54
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl FUN_02014DA0
	movs r1, #0x12
	movs r0, #0xc
	lsls r1, r1, #0xa
	bl FUN_0201AA8C
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r3, #0x12
	ldr r0, _021E5B98 @ =ov94_021E5CA0
	ldr r1, _021E5B9C @ =ov94_021E5CC4
	lsls r3, r3, #0xa
	bl FUN_02014DB4
	str r0, [r4, #0x18]
	bl FUN_02015524
	adds r2, r0, #0
	movs r0, #1
	movs r1, #0xe1
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	add sp, #8
	pop {r4, pc}
	nop
_021E5B98: .4byte ov94_021E5CA0
_021E5B9C: .4byte ov94_021E5CC4
	thumb_func_end ov94_021E5B54

	thumb_func_start ov94_021E5BA0
ov94_021E5BA0: @ 0x021E5BA0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x10]
	movs r0, #0xd0
	movs r2, #0xc
	bl FUN_02015264
	adds r1, r0, #0
	ldr r0, [r4, #0x18]
	movs r2, #0xa
	movs r3, #1
	bl FUN_0201526C
	ldr r1, [r4, #0xc]
	ldr r0, _021E5C18 @ =0x000001E7
	cmp r1, r0
	beq _021E5BCA
	adds r0, r0, #5
	cmp r1, r0
	beq _021E5BF6
	pop {r4, pc}
_021E5BCA:
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C @ =ov94_021E5C28
	movs r1, #0
	adds r3, r4, #0
	bl FUN_02015494
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C @ =ov94_021E5C28
	movs r1, #1
	adds r3, r4, #0
	bl FUN_02015494
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C @ =ov94_021E5C28
	movs r1, #2
	adds r3, r4, #0
	bl FUN_02015494
	ldr r0, _021E5C20 @ =0x00000564
	bl FUN_0200604C
	pop {r4, pc}
_021E5BF6:
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C @ =ov94_021E5C28
	movs r1, #0
	adds r3, r4, #0
	bl FUN_02015494
	ldr r0, [r4, #0x18]
	ldr r2, _021E5C1C @ =ov94_021E5C28
	movs r1, #1
	adds r3, r4, #0
	bl FUN_02015494
	ldr r0, _021E5C24 @ =0x00000565
	bl FUN_0200604C
	pop {r4, pc}
	nop
_021E5C18: .4byte 0x000001E7
_021E5C1C: .4byte ov94_021E5C28
_021E5C20: .4byte 0x00000564
_021E5C24: .4byte 0x00000565
	thumb_func_end ov94_021E5BA0

	thumb_func_start ov94_021E5C28
ov94_021E5C28: @ 0x021E5C28
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02015504
	ldr r1, [r0, #0x14]
	lsls r2, r1, #3
	ldr r1, _021E5C58 @ =0x021E5CE8
	ldr r2, [r1, r2]
	ldr r1, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	adds r1, r2, r1
	str r1, [r4, #0x28]
	ldr r0, [r0, #0x14]
	lsls r1, r0, #3
	ldr r0, _021E5C5C @ =0x021E5CEC
	ldr r1, [r0, r1]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r4, #0x2c]
	pop {r4, pc}
	nop
_021E5C58: .4byte 0x021E5CE8
_021E5C5C: .4byte 0x021E5CEC
	thumb_func_end ov94_021E5C28

	thumb_func_start ov94_021E5C60
ov94_021E5C60: @ 0x021E5C60
	push {r4, lr}
	bl FUN_02026E48
	bl FUN_0201543C
	adds r4, r0, #0
	cmp r4, #0
	ble _021E5C74
	bl FUN_02026E48
_021E5C74:
	bl FUN_02015460
	movs r0, #1
	movs r1, #0
	bl FUN_02026E50
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov94_021E5C60

	thumb_func_start ov94_021E5C84
ov94_021E5C84: @ 0x021E5C84
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x18]
	bl FUN_020154D0
	adds r4, r0, #0
	ldr r0, [r5, #0x18]
	bl FUN_02014EBC
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov94_021E5C84

	thumb_func_start ov94_021E5CA0
ov94_021E5CA0: @ 0x021E5CA0
	push {r4, lr}
	ldr r3, _021E5CC0 @ =0x02110924
	movs r2, #0
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bne _021E5CB2
	bl GF_AssertFail
_021E5CB2:
	adds r0, r4, #0
	bl FUN_02015354
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_021E5CC0: .4byte 0x02110924
	thumb_func_end ov94_021E5CA0

	thumb_func_start ov94_021E5CC4
ov94_021E5CC4: @ 0x021E5CC4
	push {r4, lr}
	ldr r3, _021E5CE4 @ =0x0211092C
	movs r2, #1
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bne _021E5CD6
	bl GF_AssertFail
_021E5CD6:
	adds r0, r4, #0
	bl FUN_02015394
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_021E5CE4: .4byte 0x0211092C
	thumb_func_end ov94_021E5CC4

	.rodata

_021E5CE8:
	.byte 0x8C, 0xBF, 0xFF, 0xFF, 0xE0, 0x2E, 0x00, 0x00
	.byte 0x88, 0x13, 0x00, 0x00, 0xEC, 0x2C, 0x00, 0x00, 0x8C, 0xBF, 0xFF, 0xFF, 0x88, 0x13, 0x00, 0x00
	.byte 0x88, 0x13, 0x00, 0x00, 0xAC, 0x0D, 0x00, 0x00, 0x8C, 0xBF, 0xFF, 0xFF, 0x48, 0xF4, 0xFF, 0xFF
	.byte 0x88, 0x13, 0x00, 0x00, 0x6C, 0xEE, 0xFF, 0xFF
