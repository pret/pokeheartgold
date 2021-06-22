
	thumb_func_start ov04_02253E20
ov04_02253E20: @ 0x02253E20
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #4
	bl FUN_0202AEA8
	add r3, sp, #0x18
	ldr r6, _02253ECC @ =_02257328
	adds r4, r0, #0
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #0x6f
	str r0, [r3]
	ldr r0, [r5, #0x54]
	movs r3, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_021F3C0C
	movs r3, #3
	movs r0, #2
	str r3, [sp]
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	movs r1, #0xe
	str r0, [sp, #8]
	movs r0, #0
	movs r2, #0x13
	bl FUN_021FB3E4
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	beq _02253E80
	cmp r0, #1
	beq _02253E86
	b _02253E8C
_02253E80:
	movs r4, #2
	lsls r4, r4, #0x10
	b _02253E94
_02253E86:
	movs r4, #0x1f
	lsls r4, r4, #0x10
	b _02253E94
_02253E8C:
	bl FUN_0202551C
	movs r4, #2
	lsls r4, r4, #0x10
_02253E94:
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0x6f
	bl FUN_021F3B4C
	adds r6, r0, #0
	add r0, sp, #0xc
	adds r1, r6, #0
	bl FUN_021F3B0C
	adds r0, r6, #0
	add r1, sp, #0xc
	str r4, [sp, #0x10]
	bl FUN_021F3B1C
	adds r5, #0x98
	ldr r2, [r5]
	movs r0, #0
	adds r1, r4, #0
	bl FUN_021FB4A0
	ldr r0, _02253ED0 @ =0x02257334
	blx FUN_020CF8E4
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	nop
_02253ECC: .4byte _02257328
_02253ED0: .4byte 0x02257334
	thumb_func_end ov04_02253E20

	thumb_func_start ov04_02253ED4
ov04_02253ED4: @ 0x02253ED4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0xb
	movs r1, #8
	bl FUN_0201AACC
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4]
	adds r0, r5, #0
	str r5, [r4, #4]
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #4
	bl FUN_0202AEA8
	adds r6, r0, #0
	ldr r0, [r5, #0x40]
	add r1, sp, #0
	bl FUN_0205C6AC
	movs r0, #2
	ldr r1, [sp, #4]
	lsls r0, r0, #0x10
	cmp r1, r0
	ldr r0, [r5, #0x10]
	bne _02253F20
	ldr r1, _02253F30 @ =ov04_02253F38
	adds r2, r4, #0
	bl FUN_02050530
	movs r0, #1
	add sp, #0xc
	str r0, [r6]
	pop {r3, r4, r5, r6, pc}
_02253F20:
	ldr r1, _02253F34 @ =ov04_02253F94
	adds r2, r4, #0
	bl FUN_02050530
	movs r0, #0
	str r0, [r6]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02253F30: .4byte ov04_02253F38
_02253F34: .4byte ov04_02253F94
	thumb_func_end ov04_02253ED4

	thumb_func_start ov04_02253F38
ov04_02253F38: @ 0x02253F38
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02253F5A
	cmp r1, #1
	beq _02253F6C
	cmp r1, #5
	beq _02253F7E
	b _02253F86
_02253F5A:
	ldr r0, [r5, #0x10]
	ldr r1, _02253F8C @ =0x02205A61
	movs r2, #0
	bl FUN_02050530
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02253F86
_02253F6C:
	ldr r0, _02253F90 @ =ov04_02253FF0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02253F86
_02253F7E:
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, r4, r5, pc}
_02253F86:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02253F8C: .4byte 0x02205A61
_02253F90: .4byte ov04_02253FF0
	thumb_func_end ov04_02253F38

	thumb_func_start ov04_02253F94
ov04_02253F94: @ 0x02253F94
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02253FB6
	cmp r1, #1
	beq _02253FC8
	cmp r1, #5
	beq _02253FDA
	b _02253FE2
_02253FB6:
	ldr r0, [r5, #0x10]
	ldr r1, _02253FE8 @ =0x02205A61
	movs r2, #0
	bl FUN_02050530
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02253FE2
_02253FC8:
	ldr r0, _02253FEC @ =ov04_022540C0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02253FE2
_02253FDA:
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, r4, r5, pc}
_02253FE2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02253FE8: .4byte 0x02205A61
_02253FEC: .4byte ov04_022540C0
	thumb_func_end ov04_02253F94

	thumb_func_start ov04_02253FF0
ov04_02253FF0: @ 0x02253FF0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r4, [r5, #4]
	cmp r0, #2
	beq _0225400C
	cmp r0, #3
	beq _02254026
	cmp r0, #4
	beq _0225408C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0225400C:
	ldr r0, [r4, #0x40]
	movs r1, #0
	bl FUN_0205C858
	movs r0, #0x61
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r5]
	add sp, #0x18
	adds r0, r0, #1
	str r0, [r5]
	pop {r4, r5, r6, pc}
_02254026:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0x6f
	bl FUN_021F3B4C
	adds r6, r0, #0
	add r0, sp, #0xc
	adds r1, r6, #0
	bl FUN_021F3B0C
	movs r0, #1
	ldr r1, [sp, #0x10]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	movs r0, #0x1f
	lsls r0, r0, #0x10
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _02254060
	str r0, [sp, #0x10]
	movs r0, #0x61
	lsls r0, r0, #4
	movs r1, #0
	bl FUN_02006154
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_02254060:
	ldr r0, [r4, #0x40]
	add r1, sp, #0
	bl FUN_0205C6AC
	movs r0, #1
	ldr r1, [sp, #4]
	lsls r0, r0, #0x10
	adds r1, r1, r0
	str r1, [sp, #4]
	ldr r0, [r4, #0x40]
	bl FUN_0205C838
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl FUN_02205A34
	adds r0, r6, #0
	add r1, sp, #0xc
	bl FUN_021F3B1C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0225408C:
	adds r2, r4, #0
	adds r2, #0x98
	movs r1, #0x1f
	ldr r2, [r2]
	movs r0, #0
	lsls r1, r1, #0x10
	bl FUN_021FB4A0
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0205C874
	ldr r0, _022540BC @ =0x00000619
	bl FUN_0200604C
	adds r0, r6, #0
	bl FUN_0200E390
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_022540BC: .4byte 0x00000619
	thumb_func_end ov04_02253FF0

	thumb_func_start ov04_022540C0
ov04_022540C0: @ 0x022540C0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r4, [r5, #4]
	cmp r0, #2
	beq _022540DC
	cmp r0, #3
	beq _022540F6
	cmp r0, #4
	beq _0225415C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_022540DC:
	ldr r0, [r4, #0x40]
	movs r1, #0
	bl FUN_0205C858
	movs r0, #0x61
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r5]
	add sp, #0x18
	adds r0, r0, #1
	str r0, [r5]
	pop {r4, r5, r6, pc}
_022540F6:
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0x6f
	bl FUN_021F3B4C
	adds r6, r0, #0
	add r0, sp, #0xc
	adds r1, r6, #0
	bl FUN_021F3B0C
	movs r0, #1
	ldr r1, [sp, #0x10]
	lsls r0, r0, #0x10
	subs r2, r1, r0
	lsls r1, r0, #1
	str r2, [sp, #0x10]
	cmp r2, r1
	bgt _02254130
	lsls r0, r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x61
	lsls r0, r0, #4
	movs r1, #0
	bl FUN_02006154
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
_02254130:
	ldr r0, [r4, #0x40]
	add r1, sp, #0
	bl FUN_0205C6AC
	movs r0, #1
	ldr r1, [sp, #4]
	lsls r0, r0, #0x10
	subs r1, r1, r0
	str r1, [sp, #4]
	ldr r0, [r4, #0x40]
	bl FUN_0205C838
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl FUN_02205A34
	adds r0, r6, #0
	add r1, sp, #0xc
	bl FUN_021F3B1C
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0225415C:
	adds r2, r4, #0
	adds r2, #0x98
	movs r1, #2
	ldr r2, [r2]
	movs r0, #0
	lsls r1, r1, #0x10
	bl FUN_021FB4A0
	ldr r0, [r4, #0x40]
	movs r1, #1
	bl FUN_0205C874
	ldr r0, _0225418C @ =0x00000619
	bl FUN_0200604C
	adds r0, r6, #0
	bl FUN_0200E390
	ldr r0, [r5]
	adds r0, r0, #1
	str r0, [r5]
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0225418C: .4byte 0x00000619
	thumb_func_end ov04_022540C0

	thumb_func_start ov04_02254190
ov04_02254190: @ 0x02254190
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #5
	bl FUN_0202AEA8
	adds r7, r0, #0
	movs r0, #4
	movs r1, #0x54
	bl FUN_0201AA8C
	ldr r1, [r4, #4]
	movs r2, #0x54
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	blx FUN_020D4994
	ldr r0, [r4, #4]
	movs r6, #0
	ldr r5, [r0, #0x24]
_022541C4:
	movs r1, #0
	add r0, sp, #4
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldrb r0, [r7, r6]
	ldr r1, _02254400 @ =0x022575D4
	movs r3, #0
	lsls r2, r0, #2
	ldr r0, _02254400 @ =0x022575D4
	ldrh r1, [r1, r2]
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	lsls r2, r1, #0x10
	movs r1, #2
	lsls r1, r1, #0xe
	lsls r0, r0, #0x10
	str r2, [sp, #4]
	adds r1, r2, r1
	str r1, [sp, #4]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x54]
	movs r1, #0x76
	str r0, [sp]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	add r2, sp, #4
	bl FUN_021F3C0C
	str r0, [r5, #4]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #4
	blt _022541C4
	ldr r0, [r7, #4]
	cmp r0, #3
	bls _02254212
	b _022543F6
_02254212:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225421E: @ jump table
	.2byte _02254226 - _0225421E - 2 @ case 0
	.2byte _0225429A - _0225421E - 2 @ case 1
	.2byte _0225430E - _0225421E - 2 @ case 2
	.2byte _02254382 - _0225421E - 2 @ case 3
_02254226:
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x73
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x73
	movs r2, #1
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x74
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x74
	movs r2, #1
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x7a
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x7a
	movs r2, #1
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x75
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x75
	movs r2, #1
	bl FUN_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225429A:
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x73
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x73
	movs r2, #1
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x74
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x74
	adds r2, r1, #0
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x7a
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x7a
	movs r2, #1
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x75
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x75
	adds r2, r1, #0
	bl FUN_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225430E:
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x73
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x73
	adds r2, r1, #0
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x74
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x74
	movs r2, #1
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x7a
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x7a
	adds r2, r1, #0
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x75
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #0
	str r0, [sp]
	movs r0, #0x75
	movs r2, #1
	bl FUN_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02254382:
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x73
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x73
	adds r2, r1, #0
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x74
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x74
	adds r2, r1, #0
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x7a
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x7a
	adds r2, r1, #0
	bl FUN_021E8970
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x75
	bl FUN_022040D0
	adds r3, r0, #0
	ldr r0, [r4, #0x54]
	movs r1, #1
	str r0, [sp]
	movs r0, #0x75
	adds r2, r1, #0
	bl FUN_021E8970
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_022543F6:
	bl FUN_0202551C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02254400: .4byte 0x022575D4
	thumb_func_end ov04_02254190

	thumb_func_start ov04_02254404
ov04_02254404: @ 0x02254404
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r6, r1, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #5
	bl FUN_0202AEA8
	adds r4, r0, #0
	ldr r0, _02254560 @ =0x00000619
	bl FUN_0200604C
	cmp r6, #0
	bne _022544B6
	ldr r2, [r4, #4]
	movs r1, #1
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r2, #0
	eors r0, r1
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x74
	bl FUN_022040D0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x75
	bl FUN_022040D0
	str r0, [sp, #4]
	ldr r0, [r5, #0x54]
	adds r1, r7, #0
	movs r2, #0x74
	adds r3, r6, #0
	bl FUN_021E8A8C
	ldr r0, [r5, #0x54]
	ldr r1, [sp, #4]
	movs r2, #0x75
	adds r3, r6, #0
	bl FUN_021E8A8C
	ldr r0, [r4, #4]
	movs r2, #1
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r0, [r5, #0x54]
	beq _02254498
	str r0, [sp]
	movs r0, #0x74
	adds r1, r2, #0
	adds r3, r7, #0
	bl FUN_021E8970
	ldr r0, [r5, #0x54]
	movs r1, #1
	str r0, [sp]
	ldr r3, [sp, #4]
	movs r0, #0x75
	adds r2, r1, #0
	bl FUN_021E8970
	b _02254550
_02254498:
	str r0, [sp]
	movs r0, #0x74
	movs r1, #0
	adds r3, r7, #0
	bl FUN_021E8970
	ldr r0, [r5, #0x54]
	ldr r3, [sp, #4]
	str r0, [sp]
	movs r0, #0x75
	movs r1, #0
	movs r2, #1
	bl FUN_021E8970
	b _02254550
_022544B6:
	cmp r6, #1
	bne _0225454C
	ldr r1, [r4, #4]
	movs r0, #1
	asrs r2, r1, #1
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #2
	eors r0, r1
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x73
	bl FUN_022040D0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0x7a
	bl FUN_022040D0
	str r0, [sp, #8]
	ldr r0, [r5, #0x54]
	adds r1, r7, #0
	movs r2, #0x73
	adds r3, r6, #0
	bl FUN_021E8A8C
	ldr r0, [r5, #0x54]
	ldr r1, [sp, #8]
	movs r2, #0x7a
	adds r3, r6, #0
	bl FUN_021E8A8C
	ldr r0, [r4, #4]
	movs r2, #1
	asrs r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r0, [r5, #0x54]
	beq _0225452E
	str r0, [sp]
	movs r0, #0x73
	adds r1, r2, #0
	adds r3, r7, #0
	bl FUN_021E8970
	ldr r0, [r5, #0x54]
	movs r1, #1
	str r0, [sp]
	ldr r3, [sp, #8]
	movs r0, #0x7a
	adds r2, r1, #0
	bl FUN_021E8970
	b _02254550
_0225452E:
	str r0, [sp]
	movs r0, #0x73
	movs r1, #0
	adds r3, r7, #0
	bl FUN_021E8970
	ldr r0, [r5, #0x54]
	ldr r3, [sp, #8]
	str r0, [sp]
	movs r0, #0x7a
	movs r1, #0
	movs r2, #1
	bl FUN_021E8970
	b _02254550
_0225454C:
	bl FUN_0202551C
_02254550:
	ldr r0, [r5, #0x10]
	ldr r1, _02254564 @ =ov04_02254CA4
	movs r2, #0
	bl FUN_02050530
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02254560: .4byte 0x00000619
_02254564: .4byte ov04_02254CA4
	thumb_func_end ov04_02254404

	thumb_func_start ov04_02254568
ov04_02254568: @ 0x02254568
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #4]
	adds r5, r1, #0
	ldr r4, [r0, #0x24]
	movs r0, #0xb
	movs r1, #8
	bl FUN_0201AACC
	adds r7, r0, #0
	movs r1, #0
	str r1, [r7]
	str r6, [r7, #4]
	strb r5, [r4, #0x18]
	str r1, [r4, #0x30]
	strb r1, [r4, #0x14]
	movs r0, #1
	strb r0, [r4, #0x16]
	adds r0, r6, #0
	str r1, [r4, #0x1c]
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #5
	bl FUN_0202AEA8
	adds r2, r0, #0
	ldr r0, [r2, #4]
	movs r1, #0
	strb r0, [r4, #0x15]
_022545A6:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bne _022545B0
	strb r1, [r4, #0x17]
	b _022545B6
_022545B0:
	adds r1, r1, #1
	cmp r1, #4
	blt _022545A6
_022545B6:
	cmp r1, #4
	bne _022545C0
	bl FUN_0202551C
	pop {r3, r4, r5, r6, r7, pc}
_022545C0:
	cmp r5, #0xb
	bhi _02254600
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022545D0: @ jump table
	.2byte _02254600 - _022545D0 - 2 @ case 0
	.2byte _02254600 - _022545D0 - 2 @ case 1
	.2byte _02254600 - _022545D0 - 2 @ case 2
	.2byte _022545E8 - _022545D0 - 2 @ case 3
	.2byte _022545E8 - _022545D0 - 2 @ case 4
	.2byte _022545E8 - _022545D0 - 2 @ case 5
	.2byte _02254600 - _022545D0 - 2 @ case 6
	.2byte _02254600 - _022545D0 - 2 @ case 7
	.2byte _02254600 - _022545D0 - 2 @ case 8
	.2byte _022545E8 - _022545D0 - 2 @ case 9
	.2byte _022545E8 - _022545D0 - 2 @ case 10
	.2byte _022545E8 - _022545D0 - 2 @ case 11
_022545E8:
	movs r1, #1
	ldr r0, _02254634 @ =0x022575A4
	lsls r2, r5, #2
	strb r1, [r4, #0x19]
	ldr r0, [r0, r2]
	ldrb r2, [r4, #0x15]
	lsls r2, r2, #3
	ldrh r0, [r0, r2]
	subs r0, r0, #1
	strb r0, [r4, #0x1a]
	strb r1, [r4, #0x1b]
	b _02254608
_02254600:
	movs r0, #0
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x1a]
	strb r0, [r4, #0x1b]
_02254608:
	ldr r0, _02254634 @ =0x022575A4
	lsls r1, r5, #2
	ldr r1, [r0, r1]
	ldrb r0, [r4, #0x15]
	lsls r0, r0, #3
	adds r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsls r1, r0, #2
	adds r0, r2, r1
	ldrh r1, [r2, r1]
	adds r2, r7, #0
	lsls r1, r1, #0x10
	str r1, [r4, #0x2c]
	ldrh r0, [r0, #2]
	ldr r1, _02254638 @ =ov04_0225463C
	lsls r0, r0, #0x10
	str r0, [r4, #0x34]
	ldr r0, [r6, #0x10]
	bl FUN_02050530
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02254634: .4byte 0x022575A4
_02254638: .4byte ov04_0225463C
	thumb_func_end ov04_02254568

	thumb_func_start ov04_0225463C
ov04_0225463C: @ 0x0225463C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _0225465E
	cmp r1, #1
	beq _02254670
	cmp r1, #0xa
	beq _02254682
	b _0225468A
_0225465E:
	ldr r0, [r5, #0x10]
	ldr r1, _02254690 @ =0x02205A61
	movs r2, #0
	bl FUN_02050530
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225468A
_02254670:
	ldr r0, _02254694 @ =ov04_02254724
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225468A
_02254682:
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225468A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_02254690: .4byte 0x02205A61
_02254694: .4byte ov04_02254724
	thumb_func_end ov04_0225463C

	thumb_func_start ov04_02254698
ov04_02254698: @ 0x02254698
	push {r4}
	sub sp, #0xc
	adds r3, r0, #0
	ldrh r4, [r2]
	ldrh r0, [r1]
	ldrh r2, [r2, #2]
	subs r0, r4, r0
	lsls r0, r0, #0xc
	str r0, [sp]
	ldrh r0, [r1, #2]
	subs r0, r2, r0
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	movs r0, #0
	add r2, sp, #0
	str r0, [sp, #4]
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	add sp, #0xc
	pop {r4}
	bx lr
	.align 2, 0
	thumb_func_end ov04_02254698

	thumb_func_start ov04_022546C8
ov04_022546C8: @ 0x022546C8
	ldr r2, [r0]
	cmp r2, #0
	blt _022546D2
	movs r2, #1
	b _022546D4
_022546D2:
	movs r2, #0
_022546D4:
	str r2, [r1]
	ldr r0, [r0, #8]
	cmp r0, #0
	blt _022546E2
	movs r0, #1
	str r0, [r1, #4]
	bx lr
_022546E2:
	movs r0, #0
	str r0, [r1, #4]
	bx lr
	thumb_func_end ov04_022546C8

	thumb_func_start ov04_022546E8
ov04_022546E8: @ 0x022546E8
	push {r3, r4}
	lsls r3, r3, #0x10
	adds r1, r1, r2
	movs r4, #0
	cmp r3, r1
	bne _022546F8
	movs r4, #1
	b _0225470A
_022546F8:
	cmp r0, #0
	beq _02254704
	cmp r1, r3
	ble _0225470A
	movs r4, #2
	b _0225470A
_02254704:
	cmp r1, r3
	bge _0225470A
	movs r4, #2
_0225470A:
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov04_022546E8

	thumb_func_start ov04_02254710
ov04_02254710: @ 0x02254710
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_02254710

	thumb_func_start ov04_02254724
ov04_02254724: @ 0x02254724
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r6, r1, #0
	ldr r5, [r6, #4]
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	ldr r0, [r6]
	cmp r0, #9
	bhi _02254828
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02254744: @ jump table
	.2byte _02254C9E - _02254744 - 2 @ case 0
	.2byte _02254C9E - _02254744 - 2 @ case 1
	.2byte _02254758 - _02254744 - 2 @ case 2
	.2byte _022547BA - _02254744 - 2 @ case 3
	.2byte _0225481E - _02254744 - 2 @ case 4
	.2byte _02254886 - _02254744 - 2 @ case 5
	.2byte _02254AE0 - _02254744 - 2 @ case 6
	.2byte _02254B76 - _02254744 - 2 @ case 7
	.2byte _02254BD4 - _02254744 - 2 @ case 8
	.2byte _02254C44 - _02254744 - 2 @ case 9
_02254758:
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	ldr r0, [r5, #0x40]
	beq _0225479C
	bl FUN_0205C6DC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_02069D68
	str r0, [sp, #0x28]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _0225478A
	adds r0, r7, #0
	movs r1, #0xd
	bl FUN_0206214C
	ldr r0, [sp, #0x28]
	movs r1, #0xd
	bl FUN_0206214C
	b _022547B4
_0225478A:
	adds r0, r7, #0
	movs r1, #0xc
	bl FUN_0206214C
	ldr r0, [sp, #0x28]
	movs r1, #0xc
	bl FUN_0206214C
	b _022547B4
_0225479C:
	bl FUN_0205C6DC
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _022547AE
	movs r1, #0xd
	bl FUN_0206214C
	b _022547B4
_022547AE:
	movs r1, #0xc
	bl FUN_0206214C
_022547B4:
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_022547BA:
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	beq _022547FE
	adds r0, r5, #0
	bl FUN_02069D68
	adds r5, r0, #0
	adds r0, r7, #0
	bl FUN_02062108
	cmp r0, #0
	beq _02254828
	adds r0, r5, #0
	bl FUN_02062108
	cmp r0, #0
	beq _02254828
	adds r0, r7, #0
	movs r1, #0x49
	bl FUN_0206214C
	movs r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	adds r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_022547FE:
	adds r0, r7, #0
	bl FUN_02062108
	cmp r0, #0
	beq _02254828
	adds r0, r7, #0
	movs r1, #0x49
	bl FUN_0206214C
	movs r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	adds r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_0225481E:
	ldr r1, [r4, #0x50]
	adds r0, r1, #1
	str r0, [r4, #0x50]
	cmp r1, #4
	bge _0225482A
_02254828:
	b _02254C9E
_0225482A:
	adds r0, r5, #0
	adds r0, #0x9c
	ldrb r1, [r4, #0x17]
	ldr r0, [r0]
	bl FUN_021F3B44
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	bl FUN_021FB9E0
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_021F3B38
	str r0, [sp, #0x2c]
	adds r0, r4, #0
	bl FUN_021F3B3C
	ldr r1, [sp, #0x2c]
	movs r2, #1
	str r1, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xff
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	movs r3, #0x76
	bl FUN_021E8DE8
	ldr r0, [r5, #0x58]
	movs r1, #1
	movs r2, #0
	bl FUN_021E8E70
	ldr r0, _02254B9C @ =0x0000087B
	bl FUN_0200604C
	ldr r0, [r6]
	add sp, #0x98
	adds r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254886:
	ldrb r0, [r4, #0x18]
	str r0, [sp, #0x24]
	ldrb r0, [r4, #0x16]
	ldrb r7, [r4, #0x15]
	cmp r0, #0
	beq _02254962
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _022548B0
	ldr r0, [sp, #0x24]
	lsls r1, r0, #2
	ldr r0, _02254BA0 @ =0x022575A4
	ldr r1, [r0, r1]
	lsls r0, r7, #3
	adds r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsls r1, r0, #2
	adds r1, r2, r1
	subs r0, r0, #1
	b _022548C6
_022548B0:
	ldr r0, [sp, #0x24]
	lsls r1, r0, #2
	ldr r0, _02254BA0 @ =0x022575A4
	ldr r1, [r0, r1]
	lsls r0, r7, #3
	adds r0, r1, r0
	ldr r2, [r0, #4]
	ldrb r0, [r4, #0x1a]
	lsls r1, r0, #2
	adds r1, r2, r1
	adds r0, r0, #1
_022548C6:
	lsls r0, r0, #2
	adds r0, r2, r0
	str r0, [r4, #0x28]
	ldr r2, [r4, #0x28]
	add r0, sp, #0x38
	bl ov04_02254698
	add r3, sp, #0x38
	adds r2, r4, #0
	adds r2, #0x38
	ldm r3!, {r0, r1}
	str r2, [sp, #0x30]
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r1, r4, #0
	str r0, [r2]
	ldr r0, [sp, #0x30]
	adds r1, #0x20
	bl ov04_022546C8
	adds r0, r4, #0
	adds r0, #0x38
	adds r1, r0, #0
	blx FUN_020CCFE0
	ldr r2, _02254BA4 @ =0x02257350
	add r3, sp, #0x8c
	ldm r2!, {r0, r1}
	mov ip, r3
	stm r3!, {r0, r1}
	ldr r0, [r2]
	mov r1, ip
	str r0, [r3]
	adds r0, r4, #0
	adds r0, #0x38
	blx FUN_020CCE14
	str r0, [sp, #0x34]
	adds r1, r4, #0
	adds r1, #0x38
	add r2, sp, #0x80
	movs r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	movs r0, #2
	lsls r0, r0, #0xc
	adds r3, r1, #0
	blx FUN_020CD224
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0225494A
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0225494A
	movs r2, #1
	lsls r2, r2, #0xc
	cmp r1, r2
	beq _0225494A
	movs r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x2c]
	bl FUN_021F6304
	b _0225495E
_0225494A:
	cmp r0, #1
	bne _0225495E
	movs r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x40]
	bl FUN_0205C6BC
	ldr r1, [r5, #0x2c]
	bl FUN_021F62E8
_0225495E:
	movs r0, #0
	strb r0, [r4, #0x16]
_02254962:
	ldr r3, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldrh r3, [r3]
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x38]
	bl ov04_022546E8
	ldr r3, [r4, #0x28]
	str r0, [sp, #0x20]
	ldrh r3, [r3, #2]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x40]
	bl ov04_022546E8
	ldr r1, [sp, #0x20]
	cmp r1, #2
	bne _0225498A
	movs r1, #0
	str r1, [r4, #0x38]
_0225498A:
	cmp r0, #2
	bne _02254992
	movs r1, #0
	str r1, [r4, #0x40]
_02254992:
	ldr r1, [sp, #0x20]
	cmp r1, #0
	beq _02254A14
	cmp r0, #0
	beq _02254A14
	ldr r0, [r4, #0x28]
	lsls r7, r7, #3
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x10
	str r0, [r4, #0x34]
	ldrb r0, [r4, #0x14]
	adds r0, r0, #1
	strb r0, [r4, #0x14]
	ldr r0, [sp, #0x24]
	lsls r1, r0, #2
	ldr r0, _02254BA0 @ =0x022575A4
	ldr r0, [r0, r1]
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x1c]
	ldrb r0, [r4, #0x14]
	ldrh r1, [r1, r7]
	subs r1, r1, #1
	cmp r0, r1
	blt _022549FE
	adds r0, r5, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #5
	bl FUN_0202AEA8
	ldr r1, [sp, #0x1c]
	adds r1, r1, r7
	ldrh r2, [r1, #2]
	ldrb r1, [r4, #0x17]
	strb r2, [r0, r1]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	movs r2, #1
	bl FUN_021E8ED0
	ldr r0, _02254B9C @ =0x0000087B
	movs r1, #1
	bl FUN_02006154
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
	b _02254A22
_022549FE:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	ldrb r0, [r4, #0x1a]
	beq _02254A0A
	subs r0, r0, #1
	b _02254A0C
_02254A0A:
	adds r0, r0, #1
_02254A0C:
	strb r0, [r4, #0x1a]
	movs r0, #1
	strb r0, [r4, #0x16]
	b _02254A22
_02254A14:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x38
	adds r2, r0, #0
	blx FUN_020CCD78
_02254A22:
	ldrb r1, [r4, #0x17]
	adds r0, r5, #0
	adds r0, #0x9c
	lsls r1, r1, #2
	adds r1, r4, r1
	ldr r1, [r1, #4]
	ldr r0, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_021F3B44
	adds r3, r4, #0
	add r2, sp, #0x74
	adds r3, #0x2c
	adds r6, r0, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	movs r0, #2
	ldr r1, [sp, #0x74]
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x74]
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_021F3B1C
	ldr r3, _02254BA8 @ =0x02257344
	add r2, sp, #0x5c
	adds r6, r4, #0
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldr r0, [r3]
	adds r6, #0x2c
	str r0, [r2]
	add r3, sp, #0x68
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r7, #0
	str r0, [r3]
	adds r0, r2, #0
	blx FUN_020CCD78
	movs r0, #0x1b
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #0x70]
	lsls r0, r0, #0x10
	adds r0, r1, r0
	str r0, [sp, #0x70]
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #0x68
	bl FUN_0205F954
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	bne _02254AA6
	b _02254C9E
_02254AA6:
	movs r0, #0x1b
	ldrsb r1, [r4, r0]
	movs r0, #1
	add r3, sp, #0x50
	subs r0, r0, r1
	lsls r0, r0, #0x18
	adds r4, #0x2c
	asrs r6, r0, #0x18
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	adds r1, r7, #0
	str r0, [r3]
	adds r0, r2, #0
	blx FUN_020CCD78
	ldr r1, [sp, #0x58]
	lsls r0, r6, #0x10
	adds r0, r1, r0
	str r0, [sp, #0x58]
	adds r0, r5, #0
	bl FUN_02069D68
	add r1, sp, #0x50
	bl FUN_0205F954
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
_02254AE0:
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	ldr r1, [r4, #0x28]
	adds r7, r0, #0
	ldrh r1, [r1]
	bl FUN_0205F918
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0205F928
	ldr r1, [r4, #0x28]
	movs r2, #0x1b
	ldrh r1, [r1, #2]
	ldrsb r2, [r4, r2]
	adds r0, r7, #0
	adds r1, r1, r2
	bl FUN_0205F938
	adds r0, r7, #0
	bl FUN_02060F78
	adds r0, r7, #0
	movs r1, #0x4a
	bl FUN_0206214C
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	beq _02254B52
	adds r0, r5, #0
	bl FUN_02069D68
	ldr r1, [r4, #0x28]
	adds r7, r0, #0
	ldrh r1, [r1]
	bl FUN_0205F918
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0205F928
	ldr r1, [r4, #0x28]
	adds r0, r7, #0
	ldrh r3, [r1, #2]
	movs r1, #0x1b
	ldrsb r2, [r4, r1]
	movs r1, #1
	subs r1, r1, r2
	adds r1, r3, r1
	bl FUN_0205F938
	adds r0, r7, #0
	bl FUN_02060F78
_02254B52:
	movs r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	cmp r0, #1
	bne _02254B68
	movs r0, #1
	lsls r0, r0, #0xc
	b _02254B6A
_02254B68:
	ldr r0, _02254BAC @ =0xFFFFF000
_02254B6A:
	str r0, [r4, #0x4c]
	ldr r0, [r6]
	add sp, #0x98
	adds r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254B76:
	add r0, sp, #0x44
	movs r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r2, [r4, #0x4c]
	str r2, [sp, #0x4c]
	ldr r3, [r4, #0x48]
	adds r2, r3, #1
	str r2, [r4, #0x48]
	cmp r3, #0
	bne _02254BB0
	ldr r1, [r5, #0x24]
	bl FUN_02023514
	ldr r0, [r4, #0x44]
	adds r0, r0, #1
	str r0, [r4, #0x44]
	b _02254BC0
	.align 2, 0
_02254B9C: .4byte 0x0000087B
_02254BA0: .4byte 0x022575A4
_02254BA4: .4byte 0x02257350
_02254BA8: .4byte 0x02257344
_02254BAC: .4byte 0xFFFFF000
_02254BB0:
	ldr r0, [r4, #0x48]
	cmp r0, #1
	ble _02254BC0
	str r1, [r4, #0x48]
	ldr r2, [r4, #0x4c]
	subs r0, r1, #1
	muls r0, r2, r0
	str r0, [r4, #0x4c]
_02254BC0:
	ldr r0, [r4, #0x44]
	cmp r0, #4
	blt _02254C9E
	movs r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r6]
	add sp, #0x98
	adds r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254BD4:
	ldr r1, [r4, #0x50]
	adds r0, r1, #1
	str r0, [r4, #0x50]
	cmp r1, #8
	blt _02254C9E
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	beq _02254C22
	adds r0, r5, #0
	bl FUN_02069D68
	adds r5, r0, #0
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _02254C10
	adds r0, r7, #0
	movs r1, #0xd
	bl FUN_0206214C
	adds r0, r5, #0
	movs r1, #0xd
	bl FUN_0206214C
	b _02254C3A
_02254C10:
	adds r0, r7, #0
	movs r1, #0xc
	bl FUN_0206214C
	adds r0, r5, #0
	movs r1, #0xc
	bl FUN_0206214C
	b _02254C3A
_02254C22:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _02254C32
	adds r0, r7, #0
	movs r1, #0xd
	bl FUN_0206214C
	b _02254C3A
_02254C32:
	adds r0, r7, #0
	movs r1, #0xc
	bl FUN_0206214C
_02254C3A:
	ldr r0, [r6]
	add sp, #0x98
	adds r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254C44:
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_02069F88
	cmp r0, #0
	beq _02254C88
	adds r0, r5, #0
	bl FUN_02069D68
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02062108
	cmp r0, #0
	beq _02254C9E
	adds r0, r4, #0
	bl FUN_02062108
	cmp r0, #0
	beq _02254C9E
	adds r0, r4, #0
	bl FUN_020621F0
	ldr r0, [sp, #0x18]
	bl FUN_0200E390
	ldr r0, [r6]
	add sp, #0x98
	adds r0, r0, #1
	str r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02254C88:
	adds r0, r7, #0
	bl FUN_02062108
	cmp r0, #0
	beq _02254C9E
	ldr r0, [sp, #0x18]
	bl FUN_0200E390
	ldr r0, [r6]
	adds r0, r0, #1
	str r0, [r6]
_02254C9E:
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02254724

	thumb_func_start ov04_02254CA4
ov04_02254CA4: @ 0x02254CA4
	push {r3, lr}
	ldr r0, _02254CB8 @ =0x00000619
	bl FUN_02006184
	cmp r0, #0
	bne _02254CB4
	movs r0, #1
	pop {r3, pc}
_02254CB4:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_02254CB8: .4byte 0x00000619
	thumb_func_end ov04_02254CA4

	thumb_func_start ov04_02254CBC
ov04_02254CBC: @ 0x02254CBC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #1
	bl FUN_0202AEA8
	adds r7, r0, #0
	movs r0, #4
	movs r1, #0x1c
	bl FUN_0201AA8C
	ldr r1, [r5, #4]
	movs r2, #0x1c
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	blx FUN_020D4994
	ldr r0, [r5, #4]
	movs r1, #1
	lsls r1, r1, #8
	ldr r4, [r0, #0x24]
	adds r0, r1, #0
	adds r0, #0x1c
	str r1, [r5, r0]
	movs r0, #0xa
	movs r3, #0
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, [r5, #0x4c]
	subs r1, r3, #1
	movs r2, #1
	bl FUN_021EA864
	movs r1, #0
	ldr r0, [r5, #0x4c]
	mvns r1, r1
	movs r2, #0
	movs r3, #0x1f
	bl FUN_021EA89C
	movs r1, #0
	add r2, sp, #0x14
	subs r0, r1, #1
_02254D1E:
	adds r1, r1, #1
	strb r0, [r2]
	adds r2, r2, #1
	cmp r1, #0x20
	blt _02254D1E
	ldr r0, [r5, #0x4c]
	add r1, sp, #0x14
	bl FUN_021EA8C4
	adds r0, r5, #0
	bl ov04_02254F44
	movs r6, #0
_02254D38:
	ldr r0, [r5, #0x3c]
	adds r1, r6, #2
	bl FUN_0205EE60
	add r1, sp, #8
	bl FUN_0205F944
	ldr r0, [r5, #0x54]
	movs r1, #0x80
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x9c
	ldr r0, [r0]
	add r2, sp, #8
	movs r3, #0
	bl FUN_021F3C0C
	str r0, [r4]
	ldrb r0, [r7, r6]
	cmp r0, #0
	beq _02254D78
	adds r0, r5, #0
	ldr r1, [r4]
	adds r0, #0x9c
	lsls r1, r1, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	bl FUN_021F3B44
	movs r1, #1
	bl FUN_021F3B2C
_02254D78:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _02254D38
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02254CBC

	thumb_func_start ov04_02254D84
ov04_02254D84: @ 0x02254D84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_02254D84

	thumb_func_start ov04_02254D98
ov04_02254D98: @ 0x02254D98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6, #4]
	ldr r5, [r1, #0x24]
	movs r1, #0x1e
	bl FUN_020402F0
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov04_02254F20
	cmp r0, #4
	bne _02254DB8
	bl FUN_0202551C
	pop {r4, r5, r6, pc}
_02254DB8:
	str r0, [r5, #0x10]
	ldr r0, [r4]
	adds r1, r6, #0
	str r0, [r5, #0x18]
	ldr r0, _02254DCC @ =ov04_02254E20
	movs r2, #0
	bl FUN_0200E320
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
	.align 2, 0
_02254DCC: .4byte ov04_02254E20
	thumb_func_end ov04_02254D98

	thumb_func_start ov04_02254DD0
ov04_02254DD0: @ 0x02254DD0
	ldr r0, [r0, #4]
	ldr r3, _02254DDC @ =FUN_0200E390
	ldr r0, [r0, #0x24]
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02254DDC: .4byte FUN_0200E390
	thumb_func_end ov04_02254DD0

	thumb_func_start ov04_02254DE0
ov04_02254DE0: @ 0x02254DE0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r2, [r5, #4]
	ldr r4, [r2, #0x24]
	bl FUN_020402F0
	adds r6, r0, #0
	ldr r0, [r6]
	bl ov04_02254F20
	str r0, [r4, #0x10]
	ldr r0, [r6]
	movs r1, #0x10
	str r0, [r4, #0x18]
	movs r0, #0xb
	bl FUN_0201AACC
	adds r2, r0, #0
	movs r1, #0
	str r1, [r2]
	movs r0, #1
	str r0, [r2, #4]
	str r1, [r2, #8]
	str r5, [r2, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, _02254E1C @ =ov04_02254E50
	bl FUN_02050530
	pop {r4, r5, r6, pc}
	nop
_02254E1C: .4byte ov04_02254E50
	thumb_func_end ov04_02254DE0

	thumb_func_start ov04_02254E20
ov04_02254E20: @ 0x02254E20
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r0, [r5, #4]
	add r1, sp, #0
	ldr r4, [r0, #0x24]
	ldr r0, [r4, #0x18]
	bl FUN_0205F944
	ldr r1, [r4, #0x10]
	adds r5, #0x9c
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, [r5]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_021F3B44
	add r1, sp, #0
	bl FUN_021F3B1C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov04_02254E20

	thumb_func_start ov04_02254E50
ov04_02254E50: @ 0x02254E50
	push {r4, r5, r6, lr}
	bl FUN_02050650
	adds r4, r0, #0
	ldr r1, [r4, #0xc]
	ldr r0, [r1, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _02254E6E
	cmp r0, #1
	beq _02254E86
	cmp r0, #2
	beq _02254EFE
	b _02254F18
_02254E6E:
	ldr r1, [r4, #8]
	adds r0, r1, #1
	str r0, [r4, #8]
	cmp r1, #0x1e
	blt _02254F18
	ldr r0, _02254F1C @ =0x00000904
	bl FUN_0200604C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02254F18
_02254E86:
	adds r1, #0x9c
	ldr r0, [r1]
	ldr r1, [r5, #0x10]
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_021F3B44
	ldr r1, [r4, #4]
	adds r6, r0, #0
	cmp r1, #4
	blt _02254ECC
	movs r1, #1
	bl FUN_021F3B2C
	ldr r0, [r4, #0xc]
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #1
	bl FUN_0202AEA8
	ldr r1, [r5, #0x10]
	movs r2, #1
	strb r2, [r0, r1]
	ldr r0, [r5, #0x18]
	movs r1, #0xfa
	bl FUN_021FA930
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02254ED0
_02254ECC:
	adds r0, r1, #1
	str r0, [r4, #4]
_02254ED0:
	adds r0, r6, #0
	bl FUN_021F3B04
	adds r5, r0, #0
	movs r0, #1
	ldr r1, [r4, #4]
	lsls r0, r0, #0xc
	blx FUN_020F2998
	str r0, [r5]
	movs r0, #1
	ldr r1, [r4, #4]
	lsls r0, r0, #0xc
	blx FUN_020F2998
	str r0, [r5, #4]
	movs r0, #1
	ldr r1, [r4, #4]
	lsls r0, r0, #0xc
	blx FUN_020F2998
	str r0, [r5, #8]
	b _02254F18
_02254EFE:
	ldr r0, [r5, #0x18]
	bl FUN_021FA2D4
	cmp r0, #0
	bne _02254F18
	ldr r0, [r4, #0xc]
	bl ov04_02254F44
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, r5, r6, pc}
_02254F18:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02254F1C: .4byte 0x00000904
	thumb_func_end ov04_02254E50

	thumb_func_start ov04_02254F20
ov04_02254F20: @ 0x02254F20
	push {r3, lr}
	bl FUN_0205F24C
	ldr r2, _02254F40 @ =0x02257604
	movs r3, #0
_02254F2A:
	lsls r1, r3, #2
	ldr r1, [r2, r1]
	cmp r0, r1
	beq _02254F3C
	adds r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #4
	blo _02254F2A
_02254F3C:
	adds r0, r3, #0
	pop {r3, pc}
	.align 2, 0
_02254F40: .4byte 0x02257604
	thumb_func_end ov04_02254F20

	thumb_func_start ov04_02254F44
ov04_02254F44: @ 0x02254F44
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl FUN_0205F168
	adds r5, r0, #0
	ldr r0, [r4, #0x3c]
	bl FUN_0205F1BC
	movs r4, #0
	str r0, [sp]
	cmp r5, #0
	ble _02254F88
	adds r6, r4, #0
	add r7, sp, #0
_02254F62:
	ldr r0, [sp]
	bl FUN_0205F624
	cmp r0, #1
	bne _02254F7C
	ldr r0, [sp]
	bl FUN_021F72DC
	bl FUN_02023F90
	adds r1, r6, #0
	blx FUN_020C36D8
_02254F7C:
	adds r0, r7, #0
	bl FUN_0205F1D0
	adds r4, r4, #1
	cmp r4, r5
	blt _02254F62
_02254F88:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02254F44

	thumb_func_start ov04_02254F8C
ov04_02254F8C: @ 0x02254F8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r3, _02255070 @ =0x0225762C
	str r0, [sp, #4]
	ldm r3!, {r0, r1}
	add r2, sp, #0x38
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #4]
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #6
	bl FUN_0202AEA8
	str r0, [sp, #0x10]
	ldr r1, _02255074 @ =0x00000754
	movs r0, #4
	bl FUN_0201AA8C
	ldr r1, [sp, #4]
	ldr r2, _02255074 @ =0x00000754
	ldr r1, [r1, #4]
	str r0, [r1, #0x24]
	ldr r0, [sp, #4]
	movs r1, #0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x24]
	blx FUN_020D4994
	ldr r0, [sp, #4]
	ldr r2, _02255078 @ =0x02257620
	ldr r0, [r0, #4]
	add r3, sp, #0x14
	ldr r6, [r0, #0x24]
	ldr r0, [sp, #4]
	ldr r4, [sp, #0x10]
	str r0, [r6]
	add r0, sp, #0x38
	str r0, [sp, #0xc]
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	movs r5, #0
	adds r7, r6, #4
	str r0, [r3]
_02254FEC:
	add r3, sp, #0x14
	ldm r3!, {r0, r1}
	add r2, sp, #0x2c
	mov ip, r2
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #0
	str r0, [r2]
	add r0, sp, #0x20
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x10]
	mov r2, ip
	adds r0, r0, r5
	str r0, [sp, #8]
	ldrb r0, [r0, #0xc]
	add r3, sp, #0x20
	lsls r0, r0, #0xe
	rsbs r0, r0, #0
	str r0, [sp, #0x24]
	ldrh r0, [r4]
	lsls r1, r0, #0x10
	movs r0, #2
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x2c]
	ldrh r0, [r4, #6]
	lsls r1, r0, #0x10
	movs r0, #2
	lsls r0, r0, #0xe
	adds r0, r1, r0
	str r0, [sp, #0x34]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x54]
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r1, [r1]
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_021F3C0C
	strb r0, [r6, #0xb]
	str r7, [sp]
	ldr r1, [sp, #8]
	lsls r0, r5, #0x18
	ldrb r1, [r1, #0xc]
	ldrh r2, [r4]
	ldrh r3, [r4, #6]
	lsrs r0, r0, #0x18
	bl ov04_02255140
	ldr r0, [sp, #0xc]
	adds r5, r5, #1
	adds r0, r0, #4
	str r0, [sp, #0xc]
	movs r0, #0x27
	lsls r0, r0, #4
	adds r4, r4, #2
	adds r6, r6, r0
	adds r7, r7, r0
	cmp r5, #3
	blt _02254FEC
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02255070: .4byte 0x0225762C
_02255074: .4byte 0x00000754
_02255078: .4byte 0x02257620
	thumb_func_end ov04_02254F8C

	thumb_func_start ov04_0225507C
ov04_0225507C: @ 0x0225507C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_0225507C

	thumb_func_start ov04_02255090
ov04_02255090: @ 0x02255090
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	bl FUN_0202AEBC
	cmp r0, #6
	beq _022550A8
	movs r0, #0
	pop {r4, r5, r6, pc}
_022550A8:
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	cmp r4, #0
	bne _022550B4
	movs r0, #0
	pop {r4, r5, r6, pc}
_022550B4:
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	adds r6, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	adds r2, r0, #0
	lsls r1, r6, #0x10
	lsls r2, r2, #0x10
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	bl ov04_02255708
	pop {r4, r5, r6, pc}
	thumb_func_end ov04_02255090

	thumb_func_start ov04_022550D4
ov04_022550D4: @ 0x022550D4
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [sp, #0x18]
	movs r6, #0x79
	str r0, [sp, #0x18]
	movs r0, #0
	mov ip, r0
	ldr r0, [sp]
	lsls r6, r6, #2
	ldr r0, [r0, #4]
	adds r3, r1, #0
	ldr r0, [r0, #0x24]
	subs r4, r6, #4
	adds r7, r0, #4
_022550F0:
	movs r0, #0
	adds r1, r7, #0
_022550F4:
	ldr r5, [r1, r4]
	cmp r3, r5
	bne _0225510A
	ldr r5, [r1, r6]
	cmp r2, r5
	bne _0225510A
	ldr r0, [sp, #0x18]
	movs r1, #0
	str r1, [r0]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225510A:
	adds r0, r0, #1
	adds r1, #8
	cmp r0, #0x12
	blt _022550F4
	movs r0, #0x27
	lsls r0, r0, #4
	adds r7, r7, r0
	mov r0, ip
	adds r0, r0, #1
	mov ip, r0
	cmp r0, #3
	blt _022550F0
	ldr r0, [sp]
	adds r1, r3, #0
	bl FUN_02054918
	bl FUN_0205BAC4
	cmp r0, #0
	beq _0225513A
	ldr r1, [sp, #0x18]
	movs r0, #1
	str r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
_0225513A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_022550D4

	thumb_func_start ov04_02255140
ov04_02255140: @ 0x02255140
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r1, [sp, #0x38]
	ldr r2, [sp, #4]
	str r1, [sp, #0x38]
	str r2, [r1, #8]
	ldr r2, [sp, #8]
	str r2, [r1, #0xc]
	ldr r1, [sp, #4]
	adds r2, r1, #1
	ldr r1, [sp, #0x38]
	str r2, [r1, #0x10]
	ldr r2, [sp, #8]
	str r2, [r1, #0x14]
	ldr r1, [sp, #4]
	subs r7, r1, #1
	ldr r1, [sp, #0x38]
	cmp r0, #1
	str r7, [r1, #0x18]
	ldr r2, [sp, #8]
	str r2, [r1, #0x1c]
	ldr r2, [sp, #4]
	str r2, [r1, #0x20]
	ldr r2, [sp, #8]
	str r2, [r1, #0x24]
	bne _0225517C
	b _022552D6
_0225517C:
	movs r0, #0
	str r0, [r1]
	movs r2, #5
	strb r2, [r1, #4]
	movs r2, #7
	strb r2, [r1, #5]
	ldr r1, [sp, #4]
	ldr r4, [sp, #0x38]
	str r1, [sp, #0x1c]
	ldr r1, [sp, #8]
	str r1, [sp, #0x20]
	ldr r1, [sp, #4]
	adds r3, r1, #3
	ldr r1, [sp, #8]
	str r3, [sp, #0x1c]
	subs r2, r1, #2
	str r2, [sp, #0x20]
_0225519E:
	adds r1, r2, r0
	str r3, [r4, #0x28]
	str r1, [r4, #0x2c]
	adds r0, r0, #1
	adds r4, #8
	cmp r0, #7
	blt _0225519E
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	movs r4, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	subs r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	subs r1, r0, #2
	str r1, [sp, #0x20]
_022551C4:
	adds r0, r1, r4
	str r2, [r3, #0x68]
	str r0, [r3, #0x6c]
	adds r4, r4, #1
	adds r3, #8
	cmp r4, #7
	blt _022551C4
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	movs r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	subs r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	adds r0, r0, #5
	str r0, [sp, #0x20]
_022551EA:
	adds r4, r2, #0
	adds r4, #0xa8
	str r1, [r4]
	adds r4, r2, #0
	adds r4, #0xac
	str r0, [r4]
	adds r4, r2, #0
	adds r4, #0xa8
	ldr r4, [r4]
	adds r5, r4, r3
	adds r4, r2, #0
	adds r4, #0xa8
	adds r3, r3, #1
	adds r2, #8
	str r5, [r4]
	cmp r3, #5
	blt _022551EA
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	movs r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	subs r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	subs r0, r0, #3
	str r0, [sp, #0x20]
_02255224:
	adds r4, r2, #0
	adds r4, #0xd0
	str r1, [r4]
	adds r4, r2, #0
	adds r4, #0xd4
	str r0, [r4]
	adds r4, r2, #0
	adds r4, #0xd0
	ldr r4, [r4]
	adds r5, r4, r3
	adds r4, r2, #0
	adds r4, #0xd0
	adds r3, r3, #1
	adds r2, #8
	str r5, [r4]
	cmp r3, #5
	blt _02255224
	ldr r0, [sp, #4]
	movs r6, #0
	subs r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	str r6, [sp, #0x10]
	adds r4, r0, #4
_02255254:
	ldr r0, [sp, #0xc]
	str r4, [sp, #0x20]
	str r0, [sp, #0x1c]
	subs r2, r0, r6
	ldr r0, [sp, #0x10]
	str r2, [sp, #0x1c]
	lsls r1, r0, #3
	ldr r0, [sp, #0x38]
	movs r3, #0
	adds r5, r0, r1
_02255268:
	adds r0, r5, #0
	adds r0, #0xf8
	str r2, [r0]
	adds r0, r5, #0
	adds r0, #0xfc
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	subs r1, r0, r3
	adds r0, r5, #0
	adds r0, #0xfc
	adds r3, r3, #1
	adds r5, #8
	str r1, [r0]
	cmp r3, #7
	blt _02255268
	ldr r0, [sp, #0x10]
	adds r6, r6, #1
	adds r0, r0, #7
	str r0, [sp, #0x10]
	cmp r6, #2
	blt _02255254
	ldr r0, [sp, #0x38]
	movs r4, #0
	ldrb r3, [r0, #4]
	cmp r3, #0
	ble _022552D4
	ldr r0, [sp, #4]
	adds r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	subs r1, r0, #2
	str r1, [sp, #0x20]
	cmp r3, #0
	ble _022552D4
	movs r6, #0x6f
	lsls r6, r6, #2
	ldr r3, [sp, #0x38]
	adds r0, r6, #0
_022552B8:
	movs r5, #0x6e
	lsls r5, r5, #2
	str r2, [r3, r5]
	adds r5, r5, #4
	str r1, [r3, r5]
	ldr r5, [r3, r6]
	adds r5, r5, r4
	str r5, [r3, r0]
	ldr r5, [sp, #0x38]
	adds r4, r4, #1
	ldrb r5, [r5, #4]
	adds r3, #8
	cmp r4, r5
	blt _022552B8
_022552D4:
	b _02255432
_022552D6:
	ldr r0, [sp, #0x38]
	movs r1, #1
	str r1, [r0]
	movs r1, #4
	strb r1, [r0, #4]
	movs r1, #8
	strb r1, [r0, #5]
	ldr r0, [sp, #4]
	ldr r4, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	movs r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	adds r2, r0, #2
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	subs r1, r0, #2
	str r1, [sp, #0x20]
_022552FC:
	adds r0, r1, r3
	str r2, [r4, #0x28]
	str r0, [r4, #0x2c]
	adds r3, r3, #1
	adds r4, #8
	cmp r3, #8
	blt _022552FC
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	movs r4, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	subs r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	subs r1, r0, #2
	str r1, [sp, #0x20]
_02255322:
	adds r0, r1, r4
	str r2, [r3, #0x68]
	str r0, [r3, #0x6c]
	adds r4, r4, #1
	adds r3, #8
	cmp r4, #8
	blt _02255322
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	movs r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	subs r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	adds r0, r0, #6
	str r0, [sp, #0x20]
_02255348:
	adds r4, r2, #0
	adds r4, #0xa8
	str r1, [r4]
	adds r4, r2, #0
	adds r4, #0xac
	str r0, [r4]
	adds r4, r2, #0
	adds r4, #0xa8
	ldr r4, [r4]
	adds r5, r4, r3
	adds r4, r2, #0
	adds r4, #0xa8
	adds r3, r3, #1
	adds r2, #8
	str r5, [r4]
	cmp r3, #4
	blt _02255348
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	movs r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	subs r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	subs r0, r0, #3
	str r0, [sp, #0x20]
_02255382:
	adds r4, r2, #0
	adds r4, #0xd0
	str r1, [r4]
	adds r4, r2, #0
	adds r4, #0xd4
	str r0, [r4]
	adds r4, r2, #0
	adds r4, #0xd0
	ldr r4, [r4]
	adds r5, r4, r3
	adds r4, r2, #0
	adds r4, #0xd0
	adds r3, r3, #1
	adds r2, #8
	str r5, [r4]
	cmp r3, #4
	blt _02255382
	ldr r0, [sp, #4]
	movs r6, #0
	subs r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r6, [sp, #0x18]
	adds r4, r0, #5
_022553B2:
	ldr r0, [sp, #0x14]
	str r4, [sp, #0x20]
	str r0, [sp, #0x1c]
	subs r2, r0, r6
	ldr r0, [sp, #0x18]
	str r2, [sp, #0x1c]
	lsls r1, r0, #3
	ldr r0, [sp, #0x38]
	movs r3, #0
	adds r5, r0, r1
_022553C6:
	adds r0, r5, #0
	adds r0, #0xf8
	str r2, [r0]
	adds r0, r5, #0
	adds r0, #0xfc
	str r4, [r0]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	subs r1, r0, r3
	adds r0, r5, #0
	adds r0, #0xfc
	adds r3, r3, #1
	adds r5, #8
	str r1, [r0]
	cmp r3, #8
	blt _022553C6
	ldr r0, [sp, #0x18]
	adds r6, r6, #1
	adds r0, #8
	str r0, [sp, #0x18]
	cmp r6, #3
	blt _022553B2
	ldr r0, [sp, #0x38]
	movs r4, #0
	ldrb r3, [r0, #4]
	cmp r3, #0
	ble _02255432
	ldr r0, [sp, #4]
	adds r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	subs r1, r0, #2
	str r1, [sp, #0x20]
	cmp r3, #0
	ble _02255432
	movs r6, #0x6f
	lsls r6, r6, #2
	ldr r3, [sp, #0x38]
	adds r0, r6, #0
_02255416:
	movs r5, #0x6e
	lsls r5, r5, #2
	str r2, [r3, r5]
	adds r5, r5, #4
	str r1, [r3, r5]
	ldr r5, [r3, r6]
	adds r5, r5, r4
	str r5, [r3, r0]
	ldr r5, [sp, #0x38]
	adds r4, r4, #1
	ldrb r5, [r5, #4]
	adds r3, #8
	cmp r4, r5
	blt _02255416
_02255432:
	ldr r0, [sp, #8]
	movs r6, #0x1e
	subs r2, r0, #1
	movs r1, #0
	lsls r6, r6, #4
	str r7, [sp, #0x1c]
	str r2, [sp, #0x20]
	mov ip, r1
	adds r4, r6, #4
_02255444:
	ldr r3, [sp, #0x38]
	lsls r5, r1, #3
	movs r0, #0
	adds r5, r3, r5
_0225544C:
	adds r3, r7, r0
	str r3, [r5, r6]
	str r2, [r5, r4]
	adds r0, r0, #1
	adds r5, #8
	cmp r0, #3
	blt _0225544C
	mov r0, ip
	adds r0, r0, #1
	adds r1, r1, #3
	adds r2, r2, #1
	mov ip, r0
	cmp r0, #6
	blt _02255444
	ldr r1, [sp]
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x38]
	strb r1, [r0, #6]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ov04_022554FC
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02255140

	thumb_func_start ov04_02255480
ov04_02255480: @ 0x02255480
	push {r4, r5}
	ldr r4, [r3]
	ldr r3, [r3, #4]
	ldr r5, [sp, #8]
	subs r4, r4, r1
	subs r3, r3, r2
	cmp r0, #1
	beq _0225549C
	cmp r0, #2
	beq _022554A4
	cmp r0, #3
	beq _022554AE
	pop {r4, r5}
	bx lr
_0225549C:
	rsbs r0, r3, #0
	str r0, [r5]
	str r4, [r5, #4]
	b _022554B4
_022554A4:
	rsbs r0, r4, #0
	str r0, [r5]
	rsbs r0, r3, #0
	str r0, [r5, #4]
	b _022554B4
_022554AE:
	str r3, [r5]
	rsbs r0, r4, #0
	str r0, [r5, #4]
_022554B4:
	ldr r0, [r5]
	adds r0, r0, r1
	str r0, [r5]
	ldr r0, [r5, #4]
	adds r0, r0, r2
	str r0, [r5, #4]
	pop {r4, r5}
	bx lr
	thumb_func_end ov04_02255480

	thumb_func_start ov04_022554C4
ov04_022554C4: @ 0x022554C4
	push {r3, r4}
	movs r4, #0
	cmp r1, #0
	ble _022554DA
_022554CC:
	ldr r3, [r2]
	adds r4, r4, #1
	adds r3, r3, r0
	str r3, [r2]
	adds r2, #8
	cmp r4, r1
	blt _022554CC
_022554DA:
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov04_022554C4

	thumb_func_start ov04_022554E0
ov04_022554E0: @ 0x022554E0
	push {r3, r4}
	movs r4, #0
	cmp r1, #0
	ble _022554F6
_022554E8:
	ldr r3, [r2, #4]
	adds r4, r4, #1
	adds r3, r3, r0
	str r3, [r2, #4]
	adds r2, #8
	cmp r4, r1
	blt _022554E8
_022554F6:
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov04_022554E0

	thumb_func_start ov04_022554FC
ov04_022554FC: @ 0x022554FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r5, r0, #0
	ldr r0, [r3]
	adds r4, r1, #0
	adds r6, r2, #0
	str r3, [sp, #4]
	cmp r0, #0
	bne _0225551C
	movs r0, #0xe
	str r0, [sp, #0x44]
	movs r0, #5
	str r0, [sp, #0x20]
	movs r0, #7
	str r0, [sp, #0x24]
	b _02255528
_0225551C:
	movs r0, #0x18
	str r0, [sp, #0x44]
	movs r0, #4
	str r0, [sp, #0x20]
	movs r0, #8
	str r0, [sp, #0x24]
_02255528:
	ldr r3, [sp, #4]
	adds r0, r5, #0
	adds r3, #0x10
	adds r1, r4, #0
	adds r2, r6, #0
	str r3, [sp]
	bl ov04_02255480
	ldr r3, [sp, #4]
	adds r0, r5, #0
	adds r3, #0x18
	adds r1, r4, #0
	adds r2, r6, #0
	str r3, [sp]
	bl ov04_02255480
	movs r0, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _0225557A
	ldr r7, [sp, #4]
	adds r7, #0x28
	str r7, [sp, #0x28]
_02255558:
	ldr r3, [sp, #0x28]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x28]
	adds r7, #8
	adds r0, #8
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x48]
	adds r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x48]
	cmp r1, r0
	blt _02255558
_0225557A:
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _022555AC
	ldr r7, [sp, #4]
	adds r7, #0x68
	str r7, [sp, #0x2c]
_0225558A:
	ldr r3, [sp, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x2c]
	adds r7, #8
	adds r0, #8
	str r0, [sp, #0x2c]
	ldr r0, [sp, #8]
	adds r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0225558A
_022555AC:
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _022555DE
	ldr r7, [sp, #4]
	adds r7, #0xa8
	str r7, [sp, #0x30]
_022555BC:
	ldr r3, [sp, #0x30]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x30]
	adds r7, #8
	adds r0, #8
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xc]
	adds r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _022555BC
_022555DE:
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _02255610
	ldr r7, [sp, #4]
	adds r7, #0xd0
	str r7, [sp, #0x34]
_022555EE:
	ldr r3, [sp, #0x34]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x34]
	adds r7, #8
	adds r0, #8
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x10]
	adds r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _022555EE
_02255610:
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x44]
	cmp r0, #0
	ble _02255642
	ldr r7, [sp, #4]
	adds r7, #0xf8
	str r7, [sp, #0x38]
_02255620:
	ldr r3, [sp, #0x38]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x38]
	adds r7, #8
	adds r0, #8
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	adds r1, r0, #1
	ldr r0, [sp, #0x44]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02255620
_02255642:
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _02255678
	movs r1, #0x6e
	ldr r0, [sp, #4]
	lsls r1, r1, #2
	adds r7, r0, r1
	str r7, [sp, #0x3c]
_02255656:
	ldr r3, [sp, #0x3c]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x3c]
	adds r7, #8
	adds r0, #8
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	adds r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x18]
	cmp r1, r0
	blt _02255656
_02255678:
	movs r0, #0
	str r0, [sp, #0x1c]
	movs r1, #0x1e
	ldr r0, [sp, #4]
	lsls r1, r1, #4
	adds r7, r0, r1
	str r7, [sp, #0x40]
_02255686:
	ldr r3, [sp, #0x40]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x40]
	adds r7, #8
	adds r0, #8
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #0x12
	blt _02255686
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_022554FC

	thumb_func_start ov04_022556AC
ov04_022556AC: @ 0x022556AC
	push {r4, r5, r6, r7}
	movs r6, #0x27
	movs r4, #0
	lsls r6, r6, #4
_022556B4:
	adds r5, r4, #0
	muls r5, r6, r5
	adds r5, r0, r5
	ldr r7, [r5, #0xc]
	cmp r1, r7
	bne _022556CE
	ldr r7, [r5, #0x10]
	cmp r2, r7
	bne _022556CE
	strb r4, [r3]
	movs r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_022556CE:
	ldr r7, [r5, #0x14]
	cmp r1, r7
	bne _022556E2
	ldr r7, [r5, #0x18]
	cmp r2, r7
	bne _022556E2
	strb r4, [r3]
	movs r0, #2
	pop {r4, r5, r6, r7}
	bx lr
_022556E2:
	ldr r7, [r5, #0x1c]
	cmp r1, r7
	bne _022556F6
	ldr r5, [r5, #0x20]
	cmp r2, r5
	bne _022556F6
	strb r4, [r3]
	movs r0, #3
	pop {r4, r5, r6, r7}
	bx lr
_022556F6:
	adds r4, r4, #1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #3
	blo _022556B4
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end ov04_022556AC

	thumb_func_start ov04_02255708
ov04_02255708: @ 0x02255708
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r3, sp, #0
	adds r5, r0, #0
	bl ov04_022556AC
	adds r6, r0, #0
	bne _0225571E
	add sp, #4
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_0225571E:
	movs r0, #0xb
	movs r1, #0x74
	bl FUN_0201AACC
	adds r4, r0, #0
	ldr r0, [r5]
	adds r2, r4, #0
	str r0, [r4, #0x70]
	movs r1, #0
	adds r2, #0x4c
	str r1, [r4]
	add r0, sp, #0
	ldrb r3, [r0]
	cmp r6, #1
	strb r3, [r2]
	str r6, [r4, #0x50]
	beq _0225574A
	cmp r6, #2
	beq _02255762
	cmp r6, #3
	beq _022557AA
	b _022557F2
_0225574A:
	movs r0, #8
	str r0, [r4]
	ldr r0, _022557F8 @ =0x00000902
	bl FUN_0200604C
	ldr r0, [r5]
	ldr r1, _022557FC @ =ov04_02255AC4
	adds r2, r4, #0
	bl FUN_020504F0
	movs r1, #1
	b _022557F2
_02255762:
	adds r2, r4, #0
	str r1, [r4]
	adds r2, #0x4d
	strb r1, [r2]
	ldrb r2, [r0]
	movs r3, #0x27
	lsls r3, r3, #4
	adds r6, r2, #0
	muls r6, r3, r6
	adds r2, r5, r6
	ldrb r6, [r2, #8]
	adds r2, r4, #0
	adds r2, #0x4e
	strb r6, [r2]
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r3, r2
	adds r0, r5, r2
	ldrb r0, [r0, #0xa]
	bl ov04_022558B4
	adds r1, r4, #0
	adds r1, #0x58
	str r0, [r4, #0x54]
	bl ov04_022558D0
	ldr r0, _022557F8 @ =0x00000902
	bl FUN_0200604C
	ldr r0, [r5]
	ldr r1, _02255800 @ =ov04_022559C8
	adds r2, r4, #0
	bl FUN_020504F0
	movs r1, #1
	b _022557F2
_022557AA:
	adds r2, r4, #0
	str r1, [r4]
	adds r2, #0x4d
	strb r1, [r2]
	ldrb r1, [r0]
	movs r2, #0x27
	lsls r2, r2, #4
	adds r3, r1, #0
	muls r3, r2, r3
	adds r1, r5, r3
	ldrb r3, [r1, #8]
	adds r1, r4, #0
	adds r1, #0x4e
	strb r3, [r1]
	ldrb r0, [r0]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r5, r1
	ldrb r0, [r0, #0xa]
	movs r1, #1
	bl ov04_022558B4
	adds r1, r4, #0
	adds r1, #0x58
	str r0, [r4, #0x54]
	bl ov04_022558D0
	ldr r0, _022557F8 @ =0x00000902
	bl FUN_0200604C
	ldr r0, [r5]
	ldr r1, _02255800 @ =ov04_022559C8
	adds r2, r4, #0
	bl FUN_020504F0
	movs r1, #1
_022557F2:
	adds r0, r1, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_022557F8: .4byte 0x00000902
_022557FC: .4byte ov04_02255AC4
_02255800: .4byte ov04_022559C8
	thumb_func_end ov04_02255708

	thumb_func_start ov04_02255804
ov04_02255804: @ 0x02255804
	push {r4, r5}
	ldr r2, [r1, #0x50]
	cmp r2, #2
	beq _02255814
	cmp r2, #3
	beq _02255836
	pop {r4, r5}
	bx lr
_02255814:
	ldrb r2, [r0, #5]
	movs r4, #0
	cmp r2, #0
	ble _02255854
	adds r5, r0, #0
_0225581E:
	ldr r3, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	adds r4, r4, #1
	str r3, [r1, #4]
	str r2, [r1, #8]
	ldrb r2, [r0, #5]
	adds r5, #8
	adds r1, #8
	cmp r4, r2
	blt _0225581E
	pop {r4, r5}
	bx lr
_02255836:
	ldrb r2, [r0, #5]
	movs r5, #0
	cmp r2, #0
	ble _02255854
	adds r4, r0, #0
_02255840:
	ldr r3, [r4, #0x68]
	ldr r2, [r4, #0x6c]
	adds r5, r5, #1
	str r3, [r1, #4]
	str r2, [r1, #8]
	ldrb r2, [r0, #5]
	adds r4, #8
	adds r1, #8
	cmp r5, r2
	blt _02255840
_02255854:
	pop {r4, r5}
	bx lr
	thumb_func_end ov04_02255804

	thumb_func_start ov04_02255858
ov04_02255858: @ 0x02255858
	push {r3, lr}
	adds r2, r1, #0
	adds r3, r0, #0
	ldr r0, [r2, #0x54]
	cmp r0, #3
	bhi _022558B2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02255870: @ jump table
	.2byte _02255878 - _02255870 - 2 @ case 0
	.2byte _02255886 - _02255870 - 2 @ case 1
	.2byte _02255894 - _02255870 - 2 @ case 2
	.2byte _022558A4 - _02255870 - 2 @ case 3
_02255878:
	lsls r1, r3, #0x18
	movs r0, #1
	lsrs r1, r1, #0x18
	adds r2, r2, #4
	bl ov04_022554C4
	pop {r3, pc}
_02255886:
	lsls r1, r3, #0x18
	movs r0, #1
	lsrs r1, r1, #0x18
	adds r2, r2, #4
	bl ov04_022554E0
	pop {r3, pc}
_02255894:
	movs r0, #0
	lsls r1, r3, #0x18
	mvns r0, r0
	lsrs r1, r1, #0x18
	adds r2, r2, #4
	bl ov04_022554C4
	pop {r3, pc}
_022558A4:
	movs r0, #0
	lsls r1, r3, #0x18
	mvns r0, r0
	lsrs r1, r1, #0x18
	adds r2, r2, #4
	bl ov04_022554E0
_022558B2:
	pop {r3, pc}
	thumb_func_end ov04_02255858

	thumb_func_start ov04_022558B4
ov04_022558B4: @ 0x022558B4
	cmp r1, #0
	bne _022558BC
	movs r1, #0
	b _022558BE
_022558BC:
	movs r1, #2
_022558BE:
	adds r0, r1, r0
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	bx lr
	.align 2, 0
	thumb_func_end ov04_022558B4

	thumb_func_start ov04_022558D0
ov04_022558D0: @ 0x022558D0
	movs r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	cmp r0, #3
	bhi _0225590A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022558E8: @ jump table
	.2byte _022558F0 - _022558E8 - 2 @ case 0
	.2byte _022558F8 - _022558E8 - 2 @ case 1
	.2byte _02255900 - _022558E8 - 2 @ case 2
	.2byte _02255906 - _022558E8 - 2 @ case 3
_022558F0:
	movs r0, #2
	lsls r0, r0, #0xe
	str r0, [r1]
	bx lr
_022558F8:
	movs r0, #2
	lsls r0, r0, #0xe
	str r0, [r1, #8]
	bx lr
_02255900:
	ldr r0, _0225590C @ =0xFFFF8000
	str r0, [r1]
	bx lr
_02255906:
	ldr r0, _0225590C @ =0xFFFF8000
	str r0, [r1, #8]
_0225590A:
	bx lr
	.align 2, 0
_0225590C: .4byte 0xFFFF8000
	thumb_func_end ov04_022558D0

	thumb_func_start ov04_02255910
ov04_02255910: @ 0x02255910
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xff
	adds r7, r1, #0
	adds r4, r2, #0
	movs r6, #0
	str r0, [sp]
	cmp r7, #0
	ble _0225595A
_02255922:
	ldr r1, [r4]
	ldr r2, [r4, #4]
	adds r0, r5, #0
	bl FUN_020548C0
	cmp r0, #0
	beq _02255938
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	b _0225595A
_02255938:
	ldr r1, [r4]
	ldr r2, [r4, #4]
	adds r0, r5, #0
	bl FUN_02054918
	bl FUN_0205BAC4
	cmp r0, #0
	bne _02255952
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	b _0225595A
_02255952:
	adds r6, r6, #1
	adds r4, #8
	cmp r6, r7
	blt _02255922
_0225595A:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02255910

	thumb_func_start ov04_02255960
ov04_02255960: @ 0x02255960
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #1
	lsls r0, r0, #0xe
	adds r7, r1, #0
	adds r5, r2, #0
	movs r4, #0
	str r3, [sp]
	str r0, [sp, #4]
	cmp r7, #0
	ble _022559C0
_02255978:
	ldr r1, [r5]
	ldr r2, [r5, #4]
	adds r0, r6, #0
	bl FUN_020548C0
	cmp r0, #0
	bne _0225599E
	ldr r1, [r5]
	ldr r2, [r5, #4]
	adds r0, r6, #0
	bl FUN_02054918
	bl FUN_0205BAC4
	cmp r0, #0
	bne _0225599C
	movs r0, #1
	b _0225599E
_0225599C:
	movs r0, #0
_0225599E:
	cmp r0, #0
	beq _022559B8
	ldr r0, [sp]
	ldrb r0, [r0, r4]
	lsls r1, r0, #8
	movs r0, #1
	lsls r0, r0, #0xe
	cmp r1, r0
	bge _022559B8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	b _022559C0
_022559B8:
	adds r4, r4, #1
	adds r5, #8
	cmp r4, r7
	blt _02255978
_022559C0:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02255960

	thumb_func_start ov04_022559C8
ov04_022559C8: @ 0x022559C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r6, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _022559F0
	cmp r0, #3
	beq _02255A16
	cmp r0, #7
	beq _02255AA2
	b _02255AB6
_022559F0:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	movs r0, #0x27
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r2, r5, #4
	adds r0, r2, r0
	adds r1, r4, #0
	bl ov04_02255804
	ldr r0, _02255ABC @ =ov04_02255D88
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	movs r0, #1
	str r0, [r4]
	b _02255AB6
_02255A16:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r0, r6, #0
	adds r1, r5, r1
	adds r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl FUN_021F3B44
	adds r1, r0, #0
	add r0, sp, #8
	bl FUN_021F3B0C
	ldr r1, [sp, #8]
	asrs r0, r1, #0xf
	lsrs r0, r0, #0x10
	adds r0, r1, r0
	asrs r0, r0, #0x10
	ldr r1, [sp, #0x10]
	str r0, [sp, #4]
	asrs r0, r1, #0xf
	lsrs r0, r0, #0x10
	adds r0, r1, r0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	asrs r7, r0, #0x10
	adds r0, r5, #4
	muls r1, r2, r1
	adds r5, r0, r1
	adds r0, r6, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #6
	bl FUN_0202AEA8
	ldr r1, [sp, #4]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r1, [r1]
	lsls r1, r1, #1
	strh r2, [r0, r1]
	lsls r1, r7, #0x10
	lsrs r3, r1, #0x10
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r3, [r0, #6]
	adds r0, r4, #0
	str r5, [sp]
	adds r0, #0x4c
	ldrb r0, [r0]
	ldrb r1, [r5, #6]
	bl ov04_02255140
	movs r0, #7
	str r0, [r4]
	b _02255AB6
_02255AA2:
	ldr r0, _02255AC0 @ =0x00000902
	movs r1, #0
	bl FUN_02006154
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x14
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_02255AB6:
	movs r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02255ABC: .4byte ov04_02255D88
_02255AC0: .4byte 0x00000902
	thumb_func_end ov04_022559C8

	thumb_func_start ov04_02255AC4
ov04_02255AC4: @ 0x02255AC4
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r5, #4]
	ldr r6, [r0, #0x24]
	ldr r0, [r4]
	subs r0, #8
	cmp r0, #4
	bhi _02255BA4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02255AEE: @ jump table
	.2byte _02255AF8 - _02255AEE - 2 @ case 0
	.2byte _02255B64 - _02255AEE - 2 @ case 1
	.2byte _02255C26 - _02255AEE - 2 @ case 2
	.2byte _02255C64 - _02255AEE - 2 @ case 3
	.2byte _02255C9E - _02255AEE - 2 @ case 4
_02255AF8:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r3, [r0]
	movs r0, #0x27
	lsls r0, r0, #4
	adds r1, r3, #0
	muls r1, r0, r1
	adds r0, r4, #0
	adds r2, r6, #4
	adds r1, r2, r1
	movs r3, #0
	adds r0, #0x4f
	strb r3, [r0]
	adds r0, r5, #0
	add r2, sp, #0
	bl ov04_02255CBC
	cmp r0, #2
	bne _02255B24
	movs r0, #9
	str r0, [r4]
	b _02255CB0
_02255B24:
	cmp r0, #1
	bne _02255B5E
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r1, r6, r1
	adds r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl FUN_021F3B44
	bl FUN_021F3B08
	add r1, sp, #0
	ldrh r1, [r1]
	str r1, [r4, #0x68]
	ldr r0, [r0, #4]
	str r0, [r4, #0x6c]
	movs r0, #0
	str r0, [r4, #0x64]
	movs r0, #0xa
	str r0, [r4]
	ldr r0, _02255CB4 @ =0x00000914
	bl FUN_0200604C
	b _02255CB0
_02255B5E:
	movs r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255B64:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r0, r5, #0
	adds r1, r6, r1
	adds r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl FUN_021F3B44
	bl FUN_021F3B08
	movs r1, #1
	ldr r2, [r0, #4]
	lsls r1, r1, #0xa
	subs r1, r2, r1
	str r1, [r0, #4]
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0x10
	bhs _02255BA6
_02255BA4:
	b _02255CB0
_02255BA6:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	movs r0, #0x27
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r2, r6, #4
	adds r7, r2, r0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r0, r5, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #6
	bl FUN_0202AEA8
	adds r3, r0, #0
	mov ip, r0
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r2, [r0]
	adds r3, #0xc
	ldrb r0, [r3, r2]
	adds r0, r0, #1
	lsrs r1, r0, #0x1f
	lsls r6, r0, #0x1e
	subs r6, r6, r1
	movs r0, #0x1e
	rors r6, r0
	adds r0, r1, r6
	strb r0, [r3, r2]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	mov r0, ip
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	strb r0, [r7, #6]
	ldr r0, [r5, #0x40]
	bl FUN_0205C6DC
	adds r6, r0, #0
	bl FUN_0205F914
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0205F934
	adds r2, r0, #0
	lsls r1, r5, #0x10
	lsls r2, r2, #0x10
	movs r0, #1
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x10
	adds r3, r7, #0
	bl ov04_022554FC
	movs r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255C26:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r1, r6, r1
	adds r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl FUN_021F3B44
	bl FUN_021F3B08
	movs r1, #1
	ldr r2, [r0, #4]
	lsls r1, r1, #0xa
	subs r2, r2, r1
	str r2, [r0, #4]
	ldr r2, [r4, #0x64]
	adds r1, r2, r1
	str r1, [r4, #0x64]
	ldr r2, [r4, #0x68]
	cmp r1, r2
	blt _02255CB0
	ldr r1, [r4, #0x6c]
	subs r1, r1, r2
	str r1, [r0, #4]
	movs r0, #0xb
	str r0, [r4]
	b _02255CB0
_02255C64:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r1, r6, r1
	adds r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl FUN_021F3B44
	bl FUN_021F3B08
	movs r1, #1
	ldr r2, [r0, #4]
	lsls r1, r1, #0xa
	adds r2, r2, r1
	str r2, [r0, #4]
	ldr r2, [r4, #0x64]
	subs r1, r2, r1
	str r1, [r4, #0x64]
	cmp r1, #0
	bgt _02255CB0
	ldr r1, [r4, #0x6c]
	str r1, [r0, #4]
	movs r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255C9E:
	ldr r0, _02255CB8 @ =0x00000902
	movs r1, #0
	bl FUN_02006154
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02255CB0:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02255CB4: .4byte 0x00000914
_02255CB8: .4byte 0x00000902
	thumb_func_end ov04_02255AC4

	thumb_func_start ov04_02255CBC
ov04_02255CBC: @ 0x02255CBC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	ldrb r1, [r4, #4]
	adds r6, r2, #0
	adds r5, r0, #0
	subs r2, r1, #1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	adds r2, r4, #0
	adds r2, #0xa8
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255CDC
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255CDC:
	ldrb r1, [r4, #4]
	adds r2, r4, #0
	adds r0, r5, #0
	adds r2, #0xd0
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255CF0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255CF0:
	ldrb r1, [r4, #5]
	adds r2, r4, #0
	adds r0, r5, #0
	adds r2, #0x68
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255D04
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255D04:
	adds r2, r4, #0
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, #0x28
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255D18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255D18:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov04_02255D34
	movs r1, #1
	lsls r1, r1, #0xe
	cmp r0, r1
	bhs _02255D2E
	strh r0, [r6]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02255D2E:
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02255CBC

	thumb_func_start ov04_02255D34
ov04_02255D34: @ 0x02255D34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _02255D48
	movs r1, #0xe
	ldr r3, _02255D78 @ =0x02257638
	ldr r4, _02255D7C @ =0x02257618
	b _02255D4E
_02255D48:
	ldr r3, _02255D80 @ =0x02257648
	ldr r4, _02255D84 @ =0x02257614
	movs r1, #0x18
_02255D4E:
	ldrb r0, [r5, #4]
	adds r2, r5, #0
	adds r2, #0xf8
	str r0, [sp]
	adds r0, r7, #0
	bl ov04_02255960
	movs r2, #0x6e
	lsls r2, r2, #2
	adds r6, r0, #0
	ldr r1, [sp]
	adds r0, r7, #0
	adds r2, r5, r2
	adds r3, r4, #0
	bl ov04_02255960
	cmp r6, r0
	bhi _02255D74
	adds r0, r6, #0
_02255D74:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02255D78: .4byte 0x02257638
_02255D7C: .4byte 0x02257618
_02255D80: .4byte 0x02257648
_02255D84: .4byte 0x02257614
	thumb_func_end ov04_02255D34

	thumb_func_start ov04_02255D88
ov04_02255D88: @ 0x02255D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r4, r1, #0
	ldr r6, [r4, #0x70]
	adds r7, r0, #0
	ldr r1, [r6, #4]
	ldr r5, [r1, #0x24]
	ldr r1, [r4]
	cmp r1, #6
	bhi _02255E5C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02255DA8: @ jump table
	.2byte _02255FB8 - _02255DA8 - 2 @ case 0
	.2byte _02255DB6 - _02255DA8 - 2 @ case 1
	.2byte _02255DEA - _02255DA8 - 2 @ case 2
	.2byte _02255FB8 - _02255DA8 - 2 @ case 3
	.2byte _02255EDE - _02255DA8 - 2 @ case 4
	.2byte _02255EEC - _02255DA8 - 2 @ case 5
	.2byte _02255F1C - _02255DA8 - 2 @ case 6
_02255DB6:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r1, r5, r1
	ldrb r1, [r1, #9]
	adds r0, r6, #0
	adds r2, r4, #4
	bl ov04_02255910
	cmp r0, #0xff
	bne _02255DE2
	movs r0, #2
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DE2:
	movs r0, #4
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DEA:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r0, r6, #0
	adds r1, r5, r1
	adds r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl FUN_021F3B44
	str r0, [sp]
	ldr r1, [sp]
	add r0, sp, #0x34
	bl FUN_021F3B0C
	add r0, sp, #0x34
	adds r1, r4, #0
	adds r1, #0x58
	adds r2, r0, #0
	blx FUN_020CCD78
	ldr r0, [sp]
	add r1, sp, #0x34
	bl FUN_021F3B1C
	ldr r0, [r6, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #0x28
	adds r6, r0, #0
	bl FUN_0205F944
	add r0, sp, #0x28
	adds r1, r4, #0
	adds r1, #0x58
	adds r2, r0, #0
	blx FUN_020CCD78
	adds r0, r6, #0
	add r1, sp, #0x28
	bl FUN_0205F954
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	bhs _02255E5E
_02255E5C:
	b _02255FB8
_02255E5E:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrb r1, [r0]
	movs r0, #0x27
	lsls r0, r0, #4
	muls r0, r1, r0
	adds r0, r5, r0
	ldrb r0, [r0, #9]
	adds r1, r4, #0
	bl ov04_02255858
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	cmp r1, r0
	blo _02255ED6
	adds r0, r6, #0
	add r1, sp, #0x1c
	bl FUN_0205F944
	ldr r2, [sp, #0x1c]
	adds r0, r6, #0
	asrs r1, r2, #0xf
	lsrs r1, r1, #0x10
	adds r1, r2, r1
	asrs r1, r1, #0x10
	bl FUN_0205F918
	ldr r2, [sp, #0x24]
	adds r0, r6, #0
	asrs r1, r2, #0xf
	lsrs r1, r1, #0x10
	adds r1, r2, r1
	asrs r1, r1, #0x10
	bl FUN_0205F938
	adds r0, r6, #0
	bl FUN_02060F78
	adds r0, r7, #0
	bl FUN_0200E390
	movs r0, #3
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255ED6:
	movs r0, #1
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EDE:
	ldr r0, _02255FBC @ =0x00000914
	bl FUN_0200604C
	movs r0, #5
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EEC:
	adds r1, r4, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	cmp r1, #0
	bne _02255F02
	bl FUN_0200E390
	movs r0, #7
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F02:
	ldr r1, [r4, #0x58]
	movs r0, #0
	mvns r0, r0
	adds r2, r1, #0
	muls r2, r0, r2
	str r2, [r4, #0x58]
	ldr r1, [r4, #0x60]
	add sp, #0x40
	muls r0, r1, r0
	str r0, [r4, #0x60]
	movs r0, #6
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F1C:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrb r2, [r1]
	movs r1, #0x27
	lsls r1, r1, #4
	muls r1, r2, r1
	adds r0, r6, #0
	adds r1, r5, r1
	adds r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl FUN_021F3B44
	adds r5, r0, #0
	add r0, sp, #0x10
	adds r1, r5, #0
	bl FUN_021F3B0C
	add r0, sp, #0x10
	adds r1, r4, #0
	adds r1, #0x58
	adds r2, r0, #0
	blx FUN_020CCD78
	adds r0, r5, #0
	add r1, sp, #0x10
	bl FUN_021F3B1C
	ldr r0, [r6, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #4
	adds r5, r0, #0
	bl FUN_0205F944
	add r0, sp, #4
	adds r1, r4, #0
	adds r1, #0x58
	adds r2, r0, #0
	blx FUN_020CCD78
	adds r0, r5, #0
	add r1, sp, #4
	bl FUN_0205F954
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	blo _02255FB8
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x4d
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02255FB8
	adds r0, r7, #0
	bl FUN_0200E390
	movs r0, #7
	str r0, [r4]
_02255FB8:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02255FBC: .4byte 0x00000914
	thumb_func_end ov04_02255D88

	thumb_func_start ov04_02255FC0
ov04_02255FC0: @ 0x02255FC0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #2
	bl FUN_0202AEA8
	adds r4, r0, #0
	movs r0, #4
	adds r1, r0, #0
	bl FUN_0201AA8C
	ldr r1, [r5, #4]
	movs r2, #4
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	blx FUN_020D4994
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x24]
	str r5, [r0]
	ldr r0, [r4]
	cmp r0, #0
	beq _0225603E
	adds r0, r5, #0
	bl ov04_02256278
	adds r7, r0, #0
	ldr r4, _02256040 @ =0x00000000
	beq _02256026
_02256004:
	ldr r2, [r5, #0x54]
	movs r0, #0xae
	adds r1, r4, #0
	bl FUN_021E8B04
	adds r6, r0, #0
	movs r1, #1
	bl FUN_021E8B60
	adds r0, r6, #0
	bl FUN_021E8B78
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r7
	blo _02256004
_02256026:
	ldr r2, [r5, #0x54]
	movs r0, #0xaf
	movs r1, #0
	bl FUN_021E8B04
	adds r4, r0, #0
	movs r1, #1
	bl FUN_021E8B60
	adds r0, r4, #0
	bl FUN_021E8B78
_0225603E:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02256040: .4byte 0x00000000
	thumb_func_end ov04_02255FC0

	thumb_func_start ov04_02256044
ov04_02256044: @ 0x02256044
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_02256044

	thumb_func_start ov04_02256058
ov04_02256058: @ 0x02256058
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	adds r4, r0, #0
	bl FUN_0202AEBC
	cmp r0, #2
	beq _02256072
	movs r0, #0
	pop {r3, r4, r5, pc}
_02256072:
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0202AEA8
	ldr r1, [r5, #4]
	ldr r1, [r1, #0x24]
	cmp r1, #0
	bne _02256086
	movs r0, #0
	pop {r3, r4, r5, pc}
_02256086:
	ldr r0, [r0]
	cmp r0, #0
	bne _02256096
	adds r0, r1, #0
	bl ov04_0225609C
	movs r0, #1
	pop {r3, r4, r5, pc}
_02256096:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov04_02256058

	thumb_func_start ov04_0225609C
ov04_0225609C: @ 0x0225609C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #2
	bl FUN_0202AEA8
	adds r4, r0, #0
	movs r0, #0xb
	movs r1, #0xc
	bl FUN_0201AACC
	adds r2, r0, #0
	movs r0, #0
	str r0, [r2]
	movs r0, #1
	str r0, [r4]
	ldr r0, [r5]
	ldr r1, _022560D0 @ =ov04_022560D4
	ldr r0, [r0, #0x10]
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	.align 2, 0
_022560D0: .4byte ov04_022560D4
	thumb_func_end ov04_0225609C

	thumb_func_start ov04_022560D4
ov04_022560D4: @ 0x022560D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	adds r4, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r6, #0x40]
	bl FUN_0205C6DC
	ldr r0, [r4]
	cmp r0, #6
	bls _022560F6
	b _0225626C
_022560F6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02256102: @ jump table
	.2byte _02256110 - _02256102 - 2 @ case 0
	.2byte _02256168 - _02256102 - 2 @ case 1
	.2byte _02256180 - _02256102 - 2 @ case 2
	.2byte _022561CE - _02256102 - 2 @ case 3
	.2byte _022561E8 - _02256102 - 2 @ case 4
	.2byte _02256248 - _02256102 - 2 @ case 5
	.2byte _02256260 - _02256102 - 2 @ case 6
_02256110:
	ldr r1, [r6, #0x24]
	add r0, sp, #0xc
	bl FUN_02023618
	add r0, sp, #4
	ldrh r1, [r0, #8]
	strh r1, [r0, #0x18]
	ldrh r1, [r0, #0xa]
	strh r1, [r0, #0x1a]
	ldrh r1, [r0, #0xc]
	strh r1, [r0, #0x1c]
	ldrh r1, [r0, #0xe]
	strh r1, [r0, #0x1e]
	ldrh r1, [r0, #0x18]
	add r0, sp, #0x44
	strh r1, [r0]
	ldr r0, [r6, #0x24]
	bl FUN_0202360C
	add r1, sp, #0x44
	ldr r3, _02256274 @ =0x02257660
	strh r0, [r1, #2]
	ldm r3!, {r0, r1}
	add r2, sp, #0x48
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r6, #0x24]
	bl FUN_02023614
	str r0, [sp, #0x54]
	ldr r1, [r6, #0x24]
	movs r0, #4
	bl FUN_02019014
	str r0, [r4, #8]
	add r1, sp, #0x44
	movs r2, #0x18
	bl FUN_02019040
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256168:
	ldr r0, [r4, #8]
	bl FUN_020190E8
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4, #8]
	bl FUN_02019030
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256180:
	adds r0, r6, #0
	bl ov04_02256278
	movs r5, #0
	str r0, [sp]
	cmp r0, #0
	ble _022561AE
_0225618E:
	ldr r2, [r6, #0x54]
	movs r0, #0xae
	adds r1, r5, #0
	bl FUN_021E8B04
	adds r7, r0, #0
	movs r1, #1
	bl FUN_021E8B84
	adds r0, r7, #0
	bl FUN_021E8B6C
	ldr r0, [sp]
	adds r5, r5, #1
	cmp r5, r0
	blt _0225618E
_022561AE:
	ldr r2, [r6, #0x54]
	movs r0, #0xaf
	movs r1, #0
	bl FUN_021E8B04
	adds r5, r0, #0
	movs r1, #1
	bl FUN_021E8B84
	adds r0, r5, #0
	bl FUN_021E8B6C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225626C
_022561CE:
	ldr r2, [r6, #0x54]
	movs r0, #0xaf
	movs r1, #0
	bl FUN_021E8B04
	bl FUN_021E8B90
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225626C
_022561E8:
	add r1, sp, #0x24
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r1, [r6, #0x24]
	add r0, sp, #4
	bl FUN_02023618
	add r0, sp, #4
	ldrh r1, [r0]
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #2]
	strh r1, [r0, #0x12]
	ldrh r1, [r0, #4]
	strh r1, [r0, #0x14]
	ldrh r1, [r0, #6]
	strh r1, [r0, #0x16]
	ldrh r1, [r0, #0x10]
	strh r1, [r0, #0x2c]
	ldr r0, [r6, #0x24]
	bl FUN_0202360C
	add r1, sp, #4
	add r3, sp, #0x24
	strh r0, [r1, #0x2e]
	ldm r3!, {r0, r1}
	add r2, sp, #0x34
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r6, #0x24]
	bl FUN_02023614
	str r0, [sp, #0x40]
	ldr r1, [r6, #0x24]
	movs r0, #4
	bl FUN_02019014
	str r0, [r4, #8]
	add r1, sp, #0x30
	movs r2, #0x18
	bl FUN_02019040
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256248:
	ldr r0, [r4, #8]
	bl FUN_020190E8
	cmp r0, #0
	beq _0225626C
	ldr r0, [r4, #8]
	bl FUN_02019030
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0225626C
_02256260:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x58
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225626C:
	movs r0, #0
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256274: .4byte 0x02257660
	thumb_func_end ov04_022560D4

	thumb_func_start ov04_02256278
ov04_02256278: @ 0x02256278
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0xad
	bl FUN_022040D0
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0xae
	bl FUN_022040D0
	adds r0, r4, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0xaf
	bl FUN_022040D0
	str r0, [sp, #4]
	ldr r0, [r4, #0x54]
	movs r1, #0xad
	bl FUN_021E8BAC
	adds r7, r0, #0
	movs r5, #0
	cmp r7, #0
	ble _022562C6
_022562B4:
	ldr r0, [r4, #0x54]
	adds r1, r6, #0
	movs r2, #0xad
	adds r3, r5, #0
	bl FUN_021E8A8C
	adds r5, r5, #1
	cmp r5, r7
	blt _022562B4
_022562C6:
	ldr r0, [r4, #0x54]
	movs r1, #0xae
	bl FUN_021E8BAC
	adds r7, r0, #0
	movs r5, #0
	cmp r7, #0
	ble _022562EC
_022562D6:
	ldr r0, [r4, #0x54]
	adds r1, r5, #0
	str r0, [sp]
	movs r0, #0xae
	movs r2, #1
	adds r3, r6, #0
	bl FUN_021E8970
	adds r5, r5, #1
	cmp r5, r7
	blt _022562D6
_022562EC:
	ldr r0, [r4, #0x54]
	ldr r3, [sp, #4]
	str r0, [sp]
	movs r0, #0xaf
	movs r1, #0
	movs r2, #1
	bl FUN_021E8970
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02256278

	thumb_func_start ov04_02256304
ov04_02256304: @ 0x02256304
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #3
	bl FUN_0202AEA8
	str r0, [sp]
	movs r0, #4
	adds r1, r0, #0
	bl FUN_0201AA8C
	ldr r1, [r5, #4]
	movs r2, #4
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	blx FUN_020D4994
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x24]
	str r5, [r0]
	ldr r0, [sp]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _02256370
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0xc7
	bl FUN_022040D0
	adds r7, r0, #0
	ldr r0, [r5, #0x54]
	movs r1, #0xc7
	bl FUN_021E8BAC
	adds r6, r0, #0
	ldr r4, _022563AC @ =0x00000000
	beq _02256370
_0225635A:
	ldr r0, [r5, #0x54]
	adds r1, r7, #0
	movs r2, #0xc7
	adds r3, r4, #0
	bl FUN_021E8A8C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _0225635A
_02256370:
	ldr r0, [sp]
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _022563AA
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	movs r1, #0xc8
	bl FUN_022040D0
	adds r7, r0, #0
	ldr r0, [r5, #0x54]
	movs r1, #0xc8
	bl FUN_021E8BAC
	adds r6, r0, #0
	ldr r4, _022563AC @ =0x00000000
	beq _022563AA
_02256394:
	ldr r0, [r5, #0x54]
	adds r1, r7, #0
	movs r2, #0xc8
	adds r3, r4, #0
	bl FUN_021E8A8C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _02256394
_022563AA:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022563AC: .4byte 0x00000000
	thumb_func_end ov04_02256304

	thumb_func_start ov04_022563B0
ov04_022563B0: @ 0x022563B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end ov04_022563B0

	thumb_func_start ov04_022563C4
ov04_022563C4: @ 0x022563C4
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #3
	bl FUN_0202AEA8
	ldrb r2, [r0, #2]
	cmp r2, #0
	beq _022563E6
	ldrb r1, [r0, #3]
	cmp r1, #0
	beq _022563E6
	movs r0, #4
	pop {r4, pc}
_022563E6:
	cmp r2, #0
	beq _022563F8
	ldrb r0, [r0, #1]
	cmp r4, r0
	bne _022563F4
	movs r0, #2
	pop {r4, pc}
_022563F4:
	movs r0, #3
	pop {r4, pc}
_022563F8:
	ldrb r0, [r0]
	cmp r4, r0
	bne _02256402
	movs r0, #1
	b _02256404
_02256402:
	movs r0, #0
_02256404:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov04_022563C4

	thumb_func_start ov04_0225640C
ov04_0225640C: @ 0x0225640C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	str r2, [sp]
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #3
	bl FUN_0202AEA8
	adds r6, r0, #0
	movs r0, #0xb
	movs r1, #0x18
	bl FUN_0201AACC
	adds r4, r0, #0
	cmp r7, #0
	beq _02256438
	cmp r7, #1
	beq _0225646A
	b _02256494
_02256438:
	movs r0, #0xc7
	str r0, [r4, #0x10]
	ldr r0, [sp]
	cmp r0, #0
	beq _02256456
	movs r0, #2
	strb r0, [r4, #0x16]
	ldr r0, [r5, #0x10]
	ldr r1, _0225649C @ =ov04_022564A0
	adds r2, r4, #0
	bl FUN_02050530
	movs r0, #0
	strb r0, [r6, #2]
	pop {r3, r4, r5, r6, r7, pc}
_02256456:
	movs r0, #1
	strb r0, [r4, #0x16]
	ldr r0, [r5, #0x10]
	ldr r1, _0225649C @ =ov04_022564A0
	adds r2, r4, #0
	bl FUN_02050530
	movs r0, #1
	strb r0, [r6, #2]
	pop {r3, r4, r5, r6, r7, pc}
_0225646A:
	movs r0, #0xc8
	str r0, [r4, #0x10]
	ldr r0, [sp]
	cmp r0, #0
	beq _02256480
	bl FUN_0202551C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
_02256480:
	movs r0, #1
	strb r0, [r4, #0x16]
	ldr r0, [r5, #0x10]
	ldr r1, _0225649C @ =ov04_022564A0
	adds r2, r4, #0
	bl FUN_02050530
	movs r0, #1
	strb r0, [r6, #3]
	pop {r3, r4, r5, r6, r7, pc}
_02256494:
	bl FUN_0202551C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225649C: .4byte ov04_022564A0
	thumb_func_end ov04_0225640C

	thumb_func_start ov04_022564A0
ov04_022564A0: @ 0x022564A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl FUN_0205064C
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_02050650
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_02050654
	str r0, [sp, #0xc]
	ldr r0, [r0]
	cmp r0, #6
	bls _022564C4
	b _02256642
_022564C4:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022564D0: @ jump table
	.2byte _022564DE - _022564D0 - 2 @ case 0
	.2byte _0225652A - _022564D0 - 2 @ case 1
	.2byte _0225654A - _022564D0 - 2 @ case 2
	.2byte _0225656A - _022564D0 - 2 @ case 3
	.2byte _022565B2 - _022564D0 - 2 @ case 4
	.2byte _022565F2 - _022564D0 - 2 @ case 5
	.2byte _02256636 - _022564D0 - 2 @ case 6
_022564DE:
	ldr r0, [r4, #0x10]
	cmp r0, #0xc7
	ldr r0, [r6, #0x3c]
	bne _02256502
	movs r1, #3
	bl FUN_0205EE60
	str r0, [r4, #4]
	ldr r0, [r6, #0x3c]
	movs r1, #4
	bl FUN_0205EE60
	str r0, [r4, #8]
	ldr r0, [r6, #0x3c]
	movs r1, #5
	bl FUN_0205EE60
	b _0225651C
_02256502:
	movs r1, #0
	bl FUN_0205EE60
	str r0, [r4, #4]
	ldr r0, [r6, #0x3c]
	movs r1, #1
	bl FUN_0205EE60
	str r0, [r4, #8]
	ldr r0, [r6, #0x3c]
	movs r1, #2
	bl FUN_0205EE60
_0225651C:
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x14]
	ldrb r1, [r4, #0x16]
	ldr r0, [sp, #0xc]
	str r1, [r0]
	b _02256642
_0225652A:
	ldr r0, [r4, #4]
	movs r1, #0x16
	bl FUN_0206214C
	ldr r0, [r4, #8]
	movs r1, #0x16
	bl FUN_0206214C
	ldr r0, [r4, #0xc]
	movs r1, #0x17
	bl FUN_0206214C
	ldr r0, [sp, #0xc]
	movs r1, #3
	str r1, [r0]
	b _02256642
_0225654A:
	ldr r0, [r4, #4]
	movs r1, #0x17
	bl FUN_0206214C
	ldr r0, [r4, #8]
	movs r1, #0x17
	bl FUN_0206214C
	ldr r0, [r4, #0xc]
	movs r1, #0x16
	bl FUN_0206214C
	ldr r0, [sp, #0xc]
	movs r1, #3
	str r1, [r0]
	b _02256642
_0225656A:
	movs r5, #0
_0225656C:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldr r0, [r0, #4]
	bl FUN_02062108
	cmp r0, #0
	beq _02256584
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _0225656C
_02256584:
	cmp r5, #3
	bne _02256642
	ldrh r0, [r4, #0x14]
	adds r0, r0, #1
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x14]
	cmp r0, #2
	blo _022565AA
	ldrb r0, [r4, #0x16]
	cmp r0, #1
	bne _022565A2
	ldr r0, [sp, #0xc]
	movs r1, #4
	str r1, [r0]
	b _02256642
_022565A2:
	ldr r0, [sp, #0xc]
	movs r1, #5
	str r1, [r0]
	b _02256642
_022565AA:
	ldrb r1, [r4, #0x16]
	ldr r0, [sp, #0xc]
	str r1, [r0]
	b _02256642
_022565B2:
	adds r0, r6, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r4, #0x10]
	bl FUN_022040D0
	str r0, [sp, #8]
	ldr r0, [r6, #0x54]
	ldr r1, [r4, #0x10]
	bl FUN_021E8BAC
	adds r7, r0, #0
	ldr r5, _02256648 @ =0x00000000
	beq _022565E4
_022565CE:
	ldr r0, [r6, #0x54]
	ldr r1, [sp, #8]
	ldr r2, [r4, #0x10]
	adds r3, r5, #0
	bl FUN_021E8A8C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _022565CE
_022565E4:
	ldr r0, _0225664C @ =0x00000623
	bl FUN_0200604C
	ldr r0, [sp, #0xc]
	movs r1, #6
	str r1, [r0]
	b _02256642
_022565F2:
	adds r0, r6, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r4, #0x10]
	bl FUN_022040D0
	str r0, [sp, #4]
	ldr r0, [r6, #0x54]
	ldr r1, [r4, #0x10]
	bl FUN_021E8BAC
	adds r7, r0, #0
	ldr r5, _02256648 @ =0x00000000
	beq _02256628
_0225660E:
	ldr r0, [r6, #0x54]
	ldr r3, [sp, #4]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	adds r1, r5, #0
	movs r2, #0
	bl FUN_021E8970
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, r7
	blo _0225660E
_02256628:
	ldr r0, _0225664C @ =0x00000623
	bl FUN_0200604C
	ldr r0, [sp, #0xc]
	movs r1, #6
	str r1, [r0]
	b _02256642
_02256636:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256642:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02256648: .4byte 0x00000000
_0225664C: .4byte 0x00000623
	thumb_func_end ov04_022564A0

	thumb_func_start ov04_02256650
ov04_02256650: @ 0x02256650
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #7
	bl FUN_0202AEA8
	ldr r1, _02256698 @ =0x00001DD8
	movs r0, #4
	bl FUN_0201AA8C
	ldr r1, [r4, #4]
	ldr r2, _02256698 @ =0x00001DD8
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	blx FUN_020D4994
	ldr r0, [r4, #4]
	movs r1, #4
	ldr r4, [r0, #0x24]
	adds r0, r4, #0
	bl ov04_02256758
	movs r2, #0
	ldr r0, _0225669C @ =0x00001DB6
	subs r1, r2, #1
_0225668C:
	adds r2, r2, #1
	strh r1, [r4, r0]
	adds r4, #0xc
	cmp r2, #3
	blt _0225668C
	pop {r4, pc}
	.align 2, 0
_02256698: .4byte 0x00001DD8
_0225669C: .4byte 0x00001DB6
	thumb_func_end ov04_02256650

	thumb_func_start ov04_022566A0
ov04_022566A0: @ 0x022566A0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	adds r0, r5, #0
	bl ov04_0225686C
	ldr r6, _022566E4 @ =0x00001DB4
	movs r4, #0
	movs r7, #0xc
_022566B4:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r1, r5, r0
	ldrh r0, [r1, r6]
	cmp r0, #0
	beq _022566C8
	ldr r0, _022566E8 @ =0x00001DBC
	ldr r0, [r1, r0]
	bl FUN_0200E390
_022566C8:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _022566B4
	adds r0, r5, #0
	bl FUN_0201AB0C
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022566E4: .4byte 0x00001DB4
_022566E8: .4byte 0x00001DBC
	thumb_func_end ov04_022566A0

	thumb_func_start ov04_022566EC
ov04_022566EC: @ 0x022566EC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #4]
	ldr r5, [r0, #0x24]
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov04_022568F0
	adds r4, r0, #0
	bpl _0225670A
	movs r0, #6
	lsls r0, r0, #8
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
_0225670A:
	ldr r0, _0225672C @ =0x00001DB4
	adds r1, r4, #0
	adds r0, r5, r0
	bl ov04_02256920
	cmp r0, #0
	bne _0225672A
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	bl ov04_02256950
	ldr r0, _02256730 @ =0x00000903
	bl FUN_0200604C
_0225672A:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0225672C: .4byte 0x00001DB4
_02256730: .4byte 0x00000903
	thumb_func_end ov04_022566EC

	thumb_func_start ov04_02256734
ov04_02256734: @ 0x02256734
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5, #4]
	movs r1, #4
	adds r0, r4, #4
	bl ov04_02256A54
	cmp r0, #0
	beq _0225674E
	adds r0, r5, #0
	bl ov04_02256B3C
	pop {r3, r4, r5, pc}
_0225674E:
	adds r4, #0x54
	adds r0, r4, #0
	bl FUN_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov04_02256734

	thumb_func_start ov04_02256758
ov04_02256758: @ 0x02256758
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	movs r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl FUN_0201AC14
	movs r0, #0
	str r0, [sp, #0x14]
_0225676A:
	ldr r0, [sp, #0x14]
	movs r1, #0x9a
	adds r4, r0, #0
	lsls r1, r1, #2
	muls r4, r1, r4
	ldr r0, [sp, #8]
	movs r1, #0
	adds r0, r0, r4
	adds r0, #0xd4
	str r1, [r0]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #8]
	lsls r0, r0, #4
	adds r1, #0x10
	str r0, [sp, #0x10]
	adds r0, r1, r0
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0xc]
	movs r1, #0xf8
	bl FUN_021FBCD8
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	adds r0, #0xd8
	adds r0, r0, r4
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	adds r0, #0x10
	str r0, [sp, #0x24]
_022567A8:
	ldr r1, [sp, #0x1c]
	movs r0, #0xcc
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x18]
	movs r1, #0
	adds r0, r0, r2
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	adds r5, r1, #0
	str r1, [r0, r2]
	ldr r0, [sp, #0x20]
	adds r4, r0, #4
_022567C2:
	ldr r0, [sp, #0xc]
	adds r3, r5, #1
	str r0, [sp]
	ldr r0, [sp, #8]
	movs r6, #0xc
	str r0, [sp, #4]
	movs r0, #0x14
	muls r6, r3, r6
	ldr r3, [sp, #0x14]
	muls r0, r5, r0
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x10]
	adds r0, r4, r0
	adds r1, r2, r1
	movs r2, #0xf8
	adds r3, r6, r3
	bl FUN_021FBE44
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _022567C2
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x10]
	adds r0, #0x54
	adds r1, r2, r1
	bl FUN_021FBF2C
	ldr r0, [sp, #0x20]
	movs r5, #0
	adds r7, r0, #0
	adds r4, r0, #4
	adds r7, #0x54
_02256808:
	movs r0, #0x14
	adds r6, r5, #0
	muls r6, r0, r6
	adds r0, r7, #0
	adds r1, r4, r6
	bl FUN_021FBF50
	adds r0, r4, r6
	movs r1, #0
	bl FUN_021FBF20
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _02256808
	movs r1, #0
	add r0, sp, #0x28
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	adds r0, #0x54
	bl FUN_021FC00C
	ldr r0, [sp, #0x20]
	movs r1, #0
	adds r0, #0x54
	str r0, [sp, #0x20]
	bl FUN_021FC004
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	cmp r0, #3
	blo _022567A8
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #0xc
	blo _0225676A
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256758

	thumb_func_start ov04_0225686C
ov04_0225686C: @ 0x0225686C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	str r0, [sp, #0xc]
	adds r0, #0x10
	str r0, [sp, #0xc]
	adds r0, r6, #0
	str r0, [sp, #0x10]
	adds r0, #0xd8
	str r0, [sp, #0x10]
	movs r7, #0x14
_02256888:
	ldr r0, [sp, #8]
	lsls r1, r0, #4
	ldr r0, [sp, #0xc]
	adds r0, r0, r1
	bl FUN_021FBDA8
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x10]
	adds r0, r0, r2
	str r0, [sp]
_022568A8:
	ldr r1, [sp, #4]
	movs r0, #0xcc
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp]
	movs r5, #0
	adds r0, r0, r2
	adds r4, r0, #4
_022568B8:
	adds r0, r5, #0
	muls r0, r7, r0
	adds r0, r4, r0
	adds r1, r6, #0
	bl FUN_021FBE80
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _022568B8
	ldr r0, [sp, #4]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _022568A8
	ldr r0, [sp, #8]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #0xc
	blo _02256888
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_0225686C

	thumb_func_start ov04_022568F0
ov04_022568F0: @ 0x022568F0
	push {r3, r4}
	ldr r4, _0225691C @ =0x0225766C
	movs r3, #0
_022568F6:
	ldr r2, [r4]
	cmp r0, r2
	bne _02256908
	ldr r2, [r4, #4]
	cmp r1, r2
	bne _02256908
	adds r0, r3, #0
	pop {r3, r4}
	bx lr
_02256908:
	adds r2, r3, #1
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	adds r4, #0x14
	cmp r3, #0x3c
	blt _022568F6
	movs r0, #0
	mvns r0, r0
	pop {r3, r4}
	bx lr
	.align 2, 0
_0225691C: .4byte 0x0225766C
	thumb_func_end ov04_022568F0

	thumb_func_start ov04_02256920
ov04_02256920: @ 0x02256920
	push {r3, r4, r5, r6}
	movs r2, #0
	movs r3, #2
	movs r4, #0xc
_02256928:
	adds r5, r2, #0
	muls r5, r4, r5
	adds r6, r0, r5
	ldrh r5, [r0, r5]
	cmp r5, #0
	beq _02256940
	ldrsh r5, [r6, r3]
	cmp r1, r5
	bne _02256940
	movs r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_02256940:
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #3
	blo _02256928
	movs r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov04_02256920

	thumb_func_start ov04_02256950
ov04_02256950: @ 0x02256950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r7, r2, #0
	adds r2, r6, #0
	adds r2, #0xd0
	str r1, [sp]
	ldr r1, _02256A38 @ =0x00001DB4
	ldr r3, [r2]
	movs r2, #0xc
	adds r1, r6, r1
	muls r2, r3, r2
	adds r5, r1, r2
	ldrh r1, [r1, r2]
	cmp r1, #0
	beq _02256978
	bl FUN_0202551C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02256978:
	adds r1, r7, #0
	bl ov04_02256AC4
	movs r0, #1
	strh r0, [r5]
	movs r0, #0x14
	adds r4, r7, #0
	muls r4, r0, r4
	ldr r1, _02256A3C @ =0x02257674
	adds r0, r6, #0
	ldrh r1, [r1, r4]
	adds r0, #0xd4
	strh r7, [r5, #2]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0x9a
	lsls r1, r1, #2
	muls r1, r2, r1
	adds r0, r0, r1
	bl ov04_02256A90
	str r0, [r5, #4]
	ldr r0, _02256A40 @ =ov04_02256734
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	movs r1, #1
	adds r0, #0x54
	bl FUN_021FC004
	add r1, sp, #4
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #4
	bl FUN_0205F944
	ldr r0, _02256A44 @ =0x0225766C
	ldr r2, _02256A48 @ =0x02257677
	ldr r0, [r0, r4]
	ldrsb r2, [r2, r4]
	lsls r1, r0, #4
	ldr r0, _02256A4C @ =0x02257676
	adds r1, #8
	ldrsb r0, [r0, r4]
	lsls r2, r2, #4
	lsls r0, r0, #4
	adds r0, r1, r0
	lsls r1, r0, #0xc
	ldr r0, _02256A50 @ =0x02257670
	str r1, [sp, #4]
	ldr r0, [r0, r4]
	lsls r0, r0, #4
	adds r0, #8
	adds r0, r0, r2
	lsls r3, r0, #0xc
	str r3, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [sp, #8]
	adds r0, #0x54
	bl FUN_021FC00C
	movs r4, #0
	movs r7, #0x14
_02256A08:
	ldr r0, [r5, #4]
	adds r1, r0, #4
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r1, r0
	movs r1, #0
	bl FUN_021FBF20
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _02256A08
	adds r0, r6, #0
	adds r0, #0xd0
	ldr r0, [r0]
	movs r1, #3
	adds r0, r0, #1
	blx FUN_020F2998
	adds r6, #0xd0
	str r1, [r6]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02256A38: .4byte 0x00001DB4
_02256A3C: .4byte 0x02257674
_02256A40: .4byte ov04_02256734
_02256A44: .4byte 0x0225766C
_02256A48: .4byte 0x02257677
_02256A4C: .4byte 0x02257676
_02256A50: .4byte 0x02257670
	thumb_func_end ov04_02256950

	thumb_func_start ov04_02256A54
ov04_02256A54: @ 0x02256A54
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	adds r6, r1, #0
	adds r7, r0, #0
	adds r4, r5, #0
	cmp r6, #0
	bls _02256A84
_02256A62:
	movs r0, #0x14
	muls r0, r4, r0
	movs r1, #1
	adds r0, r7, r0
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	cmp r0, #0
	beq _02256A7A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02256A7A:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r6
	blo _02256A62
_02256A84:
	cmp r5, r6
	bne _02256A8C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256A8C:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256A54

	thumb_func_start ov04_02256A90
ov04_02256A90: @ 0x02256A90
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xcc
	muls r0, r1, r0
	adds r0, r5, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02256AA6
	bl FUN_0202551C
_02256AA6:
	ldr r1, [r5]
	movs r0, #0xcc
	adds r6, r1, #0
	muls r6, r0, r6
	adds r4, r5, #4
	movs r0, #1
	str r0, [r4, r6]
	ldr r0, [r5]
	movs r1, #3
	adds r0, r0, #1
	blx FUN_020F2998
	str r1, [r5]
	adds r0, r4, r6
	pop {r4, r5, r6, pc}
	thumb_func_end ov04_02256A90

	thumb_func_start ov04_02256AC4
ov04_02256AC4: @ 0x02256AC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x14
	ldr r2, _02256B30 @ =0x0225766C
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp]
	ldr r0, _02256B34 @ =0x00001DB4
	ldr r5, _02256B34 @ =0x00001DB4
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r7, #0xc
_02256AE2:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	adds r0, r1, r0
	movs r1, #0xc
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _02256B2C
	movs r1, #0xc
	ldrsb r6, [r0, r1]
	movs r2, #0
_02256AF6:
	adds r1, r2, #0
	muls r1, r7, r1
	adds r0, r4, r1
	ldrh r3, [r0, r5]
	cmp r3, #0
	beq _02256B14
	ldr r3, _02256B38 @ =0x00001DB6
	ldrsh r0, [r0, r3]
	cmp r0, r6
	bne _02256B14
	ldr r0, [sp, #8]
	adds r0, r0, r1
	bl ov04_02256B3C
	b _02256B1E
_02256B14:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	blo _02256AF6
_02256B1E:
	ldr r0, [sp, #4]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #6
	blo _02256AE2
_02256B2C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02256B30: .4byte 0x0225766C
_02256B34: .4byte 0x00001DB4
_02256B38: .4byte 0x00001DB6
	thumb_func_end ov04_02256AC4

	thumb_func_start ov04_02256B3C
ov04_02256B3C: @ 0x02256B3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #0
	adds r0, #0x54
	bl FUN_021FC004
	ldr r0, [r4, #4]
	movs r1, #0
	str r1, [r0]
	strh r1, [r4]
	subs r0, r1, #1
	strh r0, [r4, #2]
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	bl FUN_0200E390
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov04_02256B3C

	thumb_func_start ov04_02256B64
ov04_02256B64: @ 0x02256B64
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #8
	bl FUN_0202AEA8
	ldr r1, _02256B9C @ =0x00000708
	movs r0, #4
	bl FUN_0201AA8C
	ldr r1, [r4, #4]
	ldr r2, _02256B9C @ =0x00000708
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	blx FUN_020D4994
	ldr r0, [r4, #4]
	movs r1, #4
	ldr r0, [r0, #0x24]
	bl ov04_02256C20
	pop {r4, pc}
	nop
_02256B9C: .4byte 0x00000708
	thumb_func_end ov04_02256B64

	thumb_func_start ov04_02256BA0
ov04_02256BA0: @ 0x02256BA0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #4]
	ldr r5, [r0, #0x24]
	adds r0, r5, #0
	bl ov04_02256D00
	movs r7, #0xa3
	lsls r7, r7, #2
	adds r6, r7, #0
	movs r4, #0
	subs r6, #0x50
_02256BB8:
	adds r0, r4, #0
	muls r0, r6, r0
	adds r1, r5, r0
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _02256BCA
	ldr r0, [r1, r7]
	bl FUN_0200E390
_02256BCA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	blo _02256BB8
	adds r0, r5, #0
	bl FUN_0201AB0C
	ldr r0, [sp]
	movs r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0x24]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256BA0

	thumb_func_start ov04_02256BE4
ov04_02256BE4: @ 0x02256BE4
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #4]
	adds r2, r1, #0
	ldr r4, [r0, #0x24]
	movs r1, #0x8f
	ldr r5, [r4, #0x50]
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r6, r5, #0
	adds r0, #0x54
	muls r6, r1, r6
	ldr r1, [r0, r6]
	cmp r1, #0
	bne _02256C18
	adds r0, r0, r6
	adds r1, r3, #0
	bl ov04_02256D68
	ldr r0, [r4, #0x50]
	movs r1, #3
	adds r0, r0, #1
	blx FUN_020F2998
	str r1, [r4, #0x50]
	pop {r4, r5, r6, pc}
_02256C18:
	bl FUN_0202551C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov04_02256BE4

	thumb_func_start ov04_02256C20
ov04_02256C20: @ 0x02256C20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	movs r2, #0x20
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl FUN_0201AC14
	ldr r4, [sp, #8]
	ldr r6, _02256CFC @ =0x00000101
	movs r5, #0
	adds r4, #0x10
_02256C36:
	lsls r0, r5, #4
	ldr r3, [sp, #0xc]
	adds r0, r4, r0
	adds r1, r6, #0
	adds r2, r5, #4
	bl FUN_021FBCD8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _02256C36
	movs r0, #0
	str r0, [sp, #0x14]
_02256C52:
	ldr r0, [sp, #8]
	movs r4, #0
	adds r2, r0, #0
	str r4, [r0, #0x50]
	movs r1, #0x8f
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r2, #0x54
	muls r1, r0, r1
	adds r7, r2, r1
	str r4, [r2, r1]
	str r4, [r7, #4]
	adds r6, r7, #0
	ldr r0, [sp, #0x14]
	movs r1, #0x8c
	muls r1, r0, r1
	ldr r0, [sp, #8]
	adds r6, #0x1c
	str r0, [sp, #0x1c]
	adds r0, #0x10
	str r1, [sp, #0x18]
	adds r7, #8
	str r0, [sp, #0x1c]
_02256C80:
	lsls r0, r4, #4
	str r0, [sp, #0x10]
	movs r0, #0x8c
	adds r5, r4, #0
	muls r5, r0, r5
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r1, r2, r1
	str r0, [sp, #4]
	ldr r2, _02256CFC @ =0x00000101
	adds r0, r7, r5
	adds r3, r4, #0
	bl FUN_021FBE44
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	adds r0, r6, r5
	adds r1, r2, r1
	bl FUN_021FBF2C
	adds r0, r6, r5
	adds r1, r7, r5
	bl FUN_021FBF50
	adds r0, r7, r5
	movs r1, #0
	bl FUN_021FBF20
	movs r1, #0
	add r0, sp, #0x20
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	adds r0, r6, r0
	bl FUN_021FC00C
	adds r0, r6, r5
	movs r1, #0
	bl FUN_021FC004
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _02256C80
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #3
	blo _02256C52
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02256CFC: .4byte 0x00000101
	thumb_func_end ov04_02256C20

	thumb_func_start ov04_02256D00
ov04_02256D00: @ 0x02256D00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r6, #0
	movs r4, #0
	adds r5, #0x10
_02256D0C:
	lsls r0, r4, #4
	adds r0, r5, r0
	bl FUN_021FBDA8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	blo _02256D0C
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	str r0, [sp, #4]
	adds r0, #0x54
	str r0, [sp, #4]
	movs r7, #0x8c
_02256D2C:
	ldr r1, [sp]
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #4]
	movs r5, #0
	adds r4, r0, r2
	adds r4, #8
_02256D3E:
	adds r0, r5, #0
	muls r0, r7, r0
	adds r0, r4, r0
	adds r1, r6, #0
	bl FUN_021FBE80
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	blo _02256D3E
	ldr r0, [sp]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	cmp r0, #3
	blo _02256D2C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02256D00

	thumb_func_start ov04_02256D68
ov04_02256D68: @ 0x02256D68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r5, #1
	subs r2, #0x40
	adds r7, r1, #0
	str r5, [r4]
	cmp r2, #3
	bhi _02256D9A
	adds r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02256D86: @ jump table
	.2byte _02256D8E - _02256D86 - 2 @ case 0
	.2byte _02256D92 - _02256D86 - 2 @ case 1
	.2byte _02256D96 - _02256D86 - 2 @ case 2
	.2byte _02256D98 - _02256D86 - 2 @ case 3
_02256D8E:
	movs r5, #2
	b _02256DA2
_02256D92:
	movs r5, #0
	b _02256DA2
_02256D96:
	movs r5, #3
_02256D98:
	b _02256DA2
_02256D9A:
	bl FUN_0202551C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02256DA2:
	ldr r0, _02256DF8 @ =ov04_02256DFC
	adds r1, r4, #0
	movs r2, #0
	str r5, [r4, #4]
	bl FUN_0200E320
	movs r1, #0x8e
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r6, r5, #0
	movs r0, #0x8c
	adds r5, r4, #0
	muls r6, r0, r6
	adds r5, #0x1c
	adds r0, r5, r6
	movs r1, #1
	bl FUN_021FC004
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r7, #0x40]
	bl FUN_0205C6DC
	add r1, sp, #0
	bl FUN_0205F944
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r5, r6
	bl FUN_021FC00C
	adds r4, #8
	adds r0, r4, r6
	movs r1, #0
	bl FUN_021FBF20
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02256DF8: .4byte ov04_02256DFC
	thumb_func_end ov04_02256D68

	thumb_func_start ov04_02256DFC
ov04_02256DFC: @ 0x02256DFC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #4]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #0x8c
	adds r4, r1, #0
	muls r4, r0, r4
	adds r0, r5, #0
	adds r0, #8
	adds r0, r0, r4
	bl ov04_02256E48
	cmp r0, #0
	beq _02256E3E
	adds r0, r5, #0
	adds r0, #0x1c
	adds r0, r0, r4
	movs r1, #0
	bl FUN_021FC004
	movs r0, #0
	str r0, [r5]
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200E390
	movs r0, #0x8e
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
_02256E3E:
	adds r5, #0x1c
	adds r0, r5, r4
	bl FUN_021FBF68
	pop {r3, r4, r5, pc}
	thumb_func_end ov04_02256DFC

	thumb_func_start ov04_02256E48
ov04_02256E48: @ 0x02256E48
	push {r3, lr}
	movs r1, #1
	lsls r1, r1, #0xc
	bl FUN_021FBEE4
	cmp r0, #0
	beq _02256E5A
	movs r0, #1
	pop {r3, pc}
_02256E5A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov04_02256E48

	thumb_func_start ov04_02256E60
ov04_02256E60: @ 0x02256E60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #9
	bl FUN_0202AEA8
	movs r1, #0x8e
	movs r0, #4
	lsls r1, r1, #2
	bl FUN_0201AA8C
	ldr r1, [r5, #4]
	movs r2, #0x8e
	str r0, [r1, #0x24]
	ldr r0, [r5, #4]
	movs r1, #0
	ldr r0, [r0, #0x24]
	lsls r2, r2, #2
	blx FUN_020D4994
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	adds r0, r4, #0
	str r5, [r4]
	bl ov04_02256F50
	ldr r0, _02256EAC @ =ov04_02257148
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0200E320
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02256EAC: .4byte ov04_02257148
	thumb_func_end ov04_02256E60

	thumb_func_start ov04_02256EB0
ov04_02256EB0: @ 0x02256EB0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E390
	adds r0, r4, #0
	bl ov04_022570EC
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, [r5, #4]
	movs r1, #0
	str r1, [r0, #0x24]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov04_02256EB0

	thumb_func_start ov04_02256ED8
ov04_02256ED8: @ 0x02256ED8
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #4]
	movs r5, #0
	ldr r4, [r0, #0x24]
	adds r7, r5, #0
	adds r4, #0x4c
	movs r6, #0xb4
_02256EE6:
	adds r0, r5, #0
	muls r0, r6, r0
	adds r0, r4, r0
	adds r1, r7, #0
	bl FUN_021FC004
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _02256EE6
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02256ED8

	thumb_func_start ov04_02256F00
ov04_02256F00: @ 0x02256F00
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r6, r1, #0
	ldr r4, [r0, #0x24]
	cmp r6, #3
	bls _02256F14
	bl FUN_0202551C
	pop {r4, r5, r6, pc}
_02256F14:
	adds r0, r4, #0
	adds r0, #0x4c
	bl FUN_021FC008
	cmp r0, #0
	bne _02256F24
	bl FUN_0202551C
_02256F24:
	adds r0, r5, #0
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #9
	bl FUN_0202AEA8
	str r6, [r0]
	movs r0, #0x23
	movs r1, #1
	lsls r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r5, #0x10]
	ldr r1, _02256F4C @ =ov04_02257308
	adds r2, r4, #0
	bl FUN_02050530
	pop {r4, r5, r6, pc}
	nop
_02256F4C: .4byte ov04_02257308
	thumb_func_end ov04_02256F00

	thumb_func_start ov04_02256F50
ov04_02256F50: @ 0x02256F50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	ldr r3, _022570E0 @ =0x02257B28
	str r0, [sp, #8]
	ldm r3!, {r0, r1}
	add r2, sp, #0x54
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r3, _022570E4 @ =0x02257B1C
	add r2, sp, #0x48
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #4
	str r0, [r2]
	ldr r0, [sp, #8]
	movs r2, #0x20
	adds r0, r0, #4
	bl FUN_0201AC14
	ldr r4, [sp, #8]
	movs r5, #0
	adds r4, #0x14
	add r6, sp, #0x48
	movs r7, #0xb4
_02256F88:
	adds r0, r5, #0
	lsls r2, r5, #2
	muls r0, r7, r0
	ldr r2, [r6, r2]
	adds r0, r4, r0
	movs r1, #0xae
	movs r3, #4
	bl FUN_021FBCD8
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _02256F88
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	str r0, [sp, #0x14]
	adds r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	adds r0, #0x24
	str r0, [sp, #0x18]
_02256FBE:
	ldr r0, [sp, #0x10]
	movs r5, #0
	lsls r1, r0, #3
	add r0, sp, #0x54
	adds r6, r0, r1
	ldr r1, [sp, #0x10]
	movs r0, #0xb4
	adds r7, r1, #0
	muls r7, r0, r7
	ldr r0, [sp, #0x18]
	adds r4, r0, r7
_02256FD4:
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	movs r0, #0x14
	lsls r3, r5, #2
	muls r0, r5, r0
	ldr r3, [r6, r3]
	adds r0, r4, r0
	adds r1, r1, r7
	movs r2, #0xae
	bl FUN_021FBE44
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02256FD4
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #3
	blo _02256FBE
	ldr r4, [sp, #8]
	ldr r6, [sp, #8]
	movs r5, #0
	adds r4, #0x4c
	adds r6, #0x14
	movs r7, #0xb4
_02257014:
	adds r1, r5, #0
	muls r1, r7, r1
	adds r0, r4, r1
	adds r1, r6, r1
	bl FUN_021FBF2C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _02257014
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r7, [sp, #8]
	str r0, [sp, #0x20]
	adds r0, #0x24
	str r0, [sp, #0x20]
	adds r7, #0x4c
_0225703A:
	ldr r1, [sp, #0xc]
	movs r0, #0xb4
	adds r6, r1, #0
	muls r6, r0, r6
	ldr r0, [sp, #0x20]
	movs r5, #0
	adds r4, r0, r6
_02257048:
	movs r1, #0x14
	muls r1, r5, r1
	adds r0, r7, r6
	adds r1, r4, r1
	bl FUN_021FBF50
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #2
	blo _02257048
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	cmp r0, #3
	blo _0225703A
	ldr r6, [sp, #8]
	ldr r7, [sp, #8]
	movs r5, #0
	adds r6, #0x4c
	adds r7, #0x24
_02257076:
	movs r0, #0xb4
	adds r4, r5, #0
	muls r4, r0, r4
	adds r0, r6, r4
	movs r1, #1
	bl FUN_021FC004
	adds r0, r7, r4
	movs r1, #2
	movs r2, #0
	bl ov04_022572E0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _02257076
	ldr r4, _022570E8 @ =0x02257B40
	add r3, sp, #0x24
	movs r2, #4
_0225709E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0225709E
	ldr r0, [r4]
	movs r5, #0
	str r0, [r3]
	ldr r0, [sp, #8]
	add r4, sp, #0x24
	adds r0, #0x4c
	str r0, [sp, #8]
	movs r7, #0xc
	movs r6, #0xb4
_022570B8:
	adds r1, r5, #0
	muls r1, r7, r1
	adds r2, r5, #0
	adds r3, r4, r1
	ldr r0, [sp, #8]
	muls r2, r6, r2
	adds r0, r0, r2
	ldr r2, [r3, #4]
	ldr r1, [r4, r1]
	ldr r3, [r3, #8]
	bl FUN_021FC00C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _022570B8
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_022570E0: .4byte 0x02257B28
_022570E4: .4byte 0x02257B1C
_022570E8: .4byte 0x02257B40
	thumb_func_end ov04_02256F50

	thumb_func_start ov04_022570EC
ov04_022570EC: @ 0x022570EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	str r0, [sp, #0xc]
	adds r0, #0x14
	str r0, [sp, #0xc]
	adds r0, r6, #0
	str r0, [sp, #8]
	adds r0, #0x24
	str r0, [sp, #8]
	movs r7, #0x14
_02257108:
	ldr r1, [sp, #4]
	movs r0, #0xb4
	muls r0, r1, r0
	ldr r1, [sp, #8]
	movs r4, #0
	str r0, [sp]
	adds r5, r1, r0
_02257116:
	adds r0, r4, #0
	muls r0, r7, r0
	adds r0, r5, r0
	adds r1, r6, #4
	bl FUN_021FBE80
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	blo _02257116
	ldr r1, [sp, #0xc]
	ldr r0, [sp]
	adds r0, r1, r0
	bl FUN_021FBDA8
	ldr r0, [sp, #4]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _02257108
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_022570EC

	thumb_func_start ov04_02257148
ov04_02257148: @ 0x02257148
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r1, #0
	add r1, sp, #4
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	ldr r0, [r7]
	bl FUN_0203E344
	bl FUN_0202A998
	movs r1, #9
	bl FUN_0202AEA8
	ldr r0, [r0]
	cmp r0, #3
	bhi _0225719A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225717A: @ jump table
	.2byte _0225719E - _0225717A - 2 @ case 0
	.2byte _02257182 - _0225717A - 2 @ case 1
	.2byte _0225718A - _0225717A - 2 @ case 2
	.2byte _02257192 - _0225717A - 2 @ case 3
_02257182:
	movs r1, #1
	add r0, sp, #4
	strb r1, [r0]
	b _0225719E
_0225718A:
	movs r1, #1
	add r0, sp, #4
	strb r1, [r0, #1]
	b _0225719E
_02257192:
	movs r1, #1
	add r0, sp, #4
	strb r1, [r0, #2]
	b _0225719E
_0225719A:
	bl FUN_0202551C
_0225719E:
	adds r4, r7, #0
	movs r5, #0
	adds r4, #0x14
	add r6, sp, #4
_022571A6:
	movs r0, #0xb4
	muls r0, r5, r0
	ldrb r2, [r6, r5]
	adds r0, r4, r0
	movs r1, #2
	bl ov04_02257240
	str r0, [sp]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _022571A6
	adds r4, r7, #0
	movs r5, #0
	adds r4, #0x4c
	movs r6, #0xb4
_022571C8:
	adds r0, r5, #0
	muls r0, r6, r0
	adds r0, r4, r0
	bl FUN_021FBF68
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #3
	blo _022571C8
	ldr r0, [sp]
	cmp r0, #0
	beq _022571EA
	movs r0, #0x23
	movs r1, #0
	lsls r0, r0, #4
	str r1, [r7, r0]
_022571EA:
	movs r5, #0
	add r6, sp, #8
	adds r7, #0x14
_022571F0:
	movs r0, #0xb4
	muls r0, r5, r0
	adds r0, r7, r0
	adds r0, #0x10
	lsls r4, r5, #2
	bl FUN_021FBF28
	asrs r1, r0, #0xb
	lsrs r1, r1, #0x14
	adds r1, r0, r1
	asrs r0, r1, #0xc
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	movs r1, #0x1e
	blx FUN_020F2998
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	str r1, [r6, r4]
	cmp r5, #3
	blo _022571F0
	ldr r4, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, r4
	beq _02257228
	bl FUN_0202551C
_02257228:
	ldr r5, [sp, #0x10]
	cmp r4, r5
	beq _02257232
	bl FUN_0202551C
_02257232:
	ldr r0, [sp, #8]
	cmp r5, r0
	beq _0225723C
	bl FUN_0202551C
_0225723C:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov04_02257148

	thumb_func_start ov04_02257240
ov04_02257240: @ 0x02257240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	str r0, [sp]
	str r2, [sp, #8]
	adds r0, #0xb0
	ldr r0, [r0]
	movs r6, #0
	cmp r0, #0
	beq _0225725C
	movs r0, #0xf
	lsls r0, r0, #0xe
	str r0, [sp, #0xc]
	b _02257262
_0225725C:
	movs r0, #0x1e
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
_02257262:
	ldr r0, [sp, #4]
	movs r5, #0
	cmp r0, #0
	bls _022572CE
	ldr r4, [sp]
	adds r4, #0x10
_0225726E:
	movs r0, #0x14
	adds r7, r5, #0
	muls r7, r0, r7
	adds r0, r4, r7
	bl FUN_021FBF28
	movs r1, #1
	lsls r1, r1, #0xc
	adds r1, r0, r1
	ldr r0, [sp, #0xc]
	cmp r1, r0
	blt _02257294
	cmp r5, #0
	beq _02257292
	cmp r6, #0
	bne _02257292
	bl FUN_0202551C
_02257292:
	movs r6, #1
_02257294:
	movs r1, #1
	adds r0, r4, r7
	lsls r1, r1, #0xc
	bl FUN_021FBEAC
	cmp r6, #0
	beq _022572C2
	ldr r1, [sp]
	ldr r0, [sp, #8]
	adds r1, #0xb0
	str r0, [r1]
	ldr r0, [sp]
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	beq _022572BA
	movs r1, #0x1e
	lsls r1, r1, #0xc
	b _022572BC
_022572BA:
	movs r1, #0
_022572BC:
	adds r0, r4, r7
	bl FUN_021FBF20
_022572C2:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [sp, #4]
	cmp r5, r0
	blo _0225726E
_022572CE:
	cmp r6, #0
	beq _022572D8
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022572D8:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_02257240

	thumb_func_start ov04_022572E0
ov04_022572E0: @ 0x022572E0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r7, r2, #0
	movs r4, #0
	cmp r5, #0
	bls _02257304
_022572EE:
	movs r0, #0x14
	muls r0, r4, r0
	adds r0, r6, r0
	adds r1, r7, #0
	bl FUN_021FBF20
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _022572EE
_02257304:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov04_022572E0

	thumb_func_start ov04_02257308
ov04_02257308: @ 0x02257308
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r0, r4, #0
	bl FUN_02050650
	movs r1, #0x23
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02257324
	movs r0, #1
	pop {r4, pc}
_02257324:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov04_02257308
_02257328:
	.byte 0x00, 0x80, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x14, 0x00, 0x00, 0x00, 0x29, 0x25, 0x70, 0x11, 0x94, 0x7F, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x10, 0x00
	.byte 0x09, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x09, 0x00, 0x03, 0x00, 0x10, 0x00
	.byte 0x03, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x0D, 0x00, 0x09, 0x00, 0x09, 0x00, 0x0F, 0x00, 0x1F, 0x00
	.byte 0x0F, 0x00, 0x1C, 0x00, 0x09, 0x00, 0x1B, 0x00, 0x09, 0x00, 0x1A, 0x00, 0x03, 0x00, 0x1B, 0x00
	.byte 0x03, 0x00, 0x18, 0x00, 0x03, 0x00, 0x10, 0x00, 0x03, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x0D, 0x00
	.byte 0x09, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x09, 0x00, 0x09, 0x00, 0x10, 0x00
	.byte 0x09, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x0C, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x07, 0x00, 0x04, 0x75, 0x25, 0x02, 0x06, 0x00, 0x06, 0x00
	.byte 0x94, 0x73, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1F, 0x00, 0x03, 0x00, 0x1D, 0x00, 0x09, 0x00, 0x1D, 0x00
	.byte 0x09, 0x00, 0x1B, 0x00, 0x0F, 0x00, 0x1C, 0x00, 0x0F, 0x00, 0x19, 0x00, 0x09, 0x00, 0x19, 0x00
	.byte 0x09, 0x00, 0x18, 0x00, 0x06, 0x00, 0x02, 0x00, 0x7C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x02, 0x00
	.byte 0x7C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x02, 0x00, 0x7C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x02, 0x00
	.byte 0x7C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x03, 0x00, 0x7C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x03, 0x00
	.byte 0x7C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x03, 0x00, 0x7C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x03, 0x00
	.byte 0x7C, 0x73, 0x25, 0x02, 0x08, 0x00, 0x05, 0x00, 0x84, 0x75, 0x25, 0x02, 0x08, 0x00, 0x05, 0x00
	.byte 0x84, 0x75, 0x25, 0x02, 0x08, 0x00, 0x05, 0x00, 0x84, 0x75, 0x25, 0x02, 0x08, 0x00, 0x05, 0x00
	.byte 0x84, 0x75, 0x25, 0x02, 0x08, 0x00, 0x04, 0x00, 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x04, 0x00
	.byte 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x04, 0x00, 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x04, 0x00
	.byte 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x00, 0x00, 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x00, 0x00
	.byte 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x00, 0x00, 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x00, 0x00
	.byte 0x04, 0x74, 0x25, 0x02, 0x08, 0x00, 0x01, 0x00, 0x84, 0x75, 0x25, 0x02, 0x08, 0x00, 0x01, 0x00
	.byte 0x84, 0x75, 0x25, 0x02, 0x08, 0x00, 0x01, 0x00, 0x84, 0x75, 0x25, 0x02, 0x08, 0x00, 0x01, 0x00
	.byte 0x84, 0x75, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x07, 0x00, 0xAC, 0x73, 0x25, 0x02, 0x04, 0x00, 0x06, 0x00
	.byte 0x6C, 0x73, 0x25, 0x02, 0x09, 0x00, 0x10, 0x00, 0x09, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00
	.byte 0x0F, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x0A, 0x00
	.byte 0x03, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x09, 0x00
	.byte 0x94, 0x73, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x0A, 0x00
	.byte 0x6C, 0x73, 0x25, 0x02, 0x08, 0x00, 0x09, 0x00, 0x04, 0x75, 0x25, 0x02, 0x04, 0x00, 0x0B, 0x00
	.byte 0x5C, 0x73, 0x25, 0x02, 0x06, 0x00, 0x0A, 0x00, 0xAC, 0x73, 0x25, 0x02, 0x04, 0x00, 0x0B, 0x00
	.byte 0x5C, 0x73, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x07, 0x00
	.byte 0x5C, 0x73, 0x25, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x07, 0x00
	.byte 0x5C, 0x73, 0x25, 0x02, 0x09, 0x00, 0x1F, 0x00, 0x09, 0x00, 0x1D, 0x00, 0x03, 0x00, 0x1D, 0x00
	.byte 0x03, 0x00, 0x1B, 0x00, 0x09, 0x00, 0x1A, 0x00, 0x09, 0x00, 0x19, 0x00, 0x0F, 0x00, 0x19, 0x00
	.byte 0x0F, 0x00, 0x18, 0x00, 0x84, 0x74, 0x25, 0x02, 0x64, 0x74, 0x25, 0x02, 0x44, 0x74, 0x25, 0x02
	.byte 0x24, 0x74, 0x25, 0x02, 0xA4, 0x74, 0x25, 0x02, 0xC4, 0x74, 0x25, 0x02, 0x24, 0x75, 0x25, 0x02
	.byte 0x44, 0x75, 0x25, 0x02, 0xC4, 0x73, 0x25, 0x02, 0xE4, 0x73, 0x25, 0x02, 0xE4, 0x74, 0x25, 0x02
	.byte 0x64, 0x75, 0x25, 0x02, 0x03, 0x00, 0x1F, 0x00, 0x09, 0x00, 0x1F, 0x00, 0x0F, 0x00, 0x1F, 0x00
	.byte 0x03, 0x00, 0x18, 0x00, 0x09, 0x00, 0x18, 0x00, 0x0F, 0x00, 0x18, 0x00, 0x03, 0x00, 0x10, 0x00
	.byte 0x09, 0x00, 0x10, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x03, 0x00, 0x09, 0x00, 0x09, 0x00, 0x09, 0x00
	.byte 0x0F, 0x00, 0x09, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x40, 0x14, 0x1E, 0x2E, 0x40, 0x40, 0x40, 0x40, 0x2A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x79, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x0D, 0x12, 0x19, 0x26, 0x33, 0x40
	.byte 0x40, 0x17, 0x1C, 0x23, 0x2D, 0x37, 0x00, 0x00, 0x08, 0x09, 0x0A, 0x0E, 0x13, 0x1A, 0x25, 0x33
	.byte 0x40, 0x11, 0x13, 0x17, 0x1C, 0x23, 0x2E, 0x37, 0x40, 0x40, 0x40, 0x1E, 0x23, 0x29, 0x31, 0x39
	.byte 0x00, 0x20, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x03, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x03, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x03, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x01, 0x02, 0x05, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x06, 0x08, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00
	.byte 0x03, 0x05, 0x08, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x09, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x05, 0x06, 0x0D, 0x0F, 0xFF, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x07, 0x0E, 0x10
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x0C, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0A, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x0A, 0x0B, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x0D, 0x0F, 0x11
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x10, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x08, 0x0D, 0x11, 0x12, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF, 0x09, 0x0E, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x12, 0x13, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0F, 0x11, 0x13, 0x14, 0xFF, 0xFF, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x11, 0x12, 0x14, 0x19, 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x12, 0x13, 0x19, 0x1B, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1A, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x17, 0x18, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x16, 0x18, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x16, 0x17, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x13, 0x14, 0x1B, 0x1C
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF
	.byte 0x15, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x14, 0x19, 0x1C, 0x23, 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x19, 0x1B, 0x23, 0x25, 0x22, 0xFF, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x1A, 0x1E, 0x1F, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x24, 0x1D, 0x1F, 0x20, 0x20, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x1D, 0x1E, 0x20, 0x21, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1E, 0x1F, 0x21, 0x22, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1F, 0x20, 0x22, 0x23
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x20, 0x21, 0x23, 0x1C, 0x25, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x1B, 0x1C, 0x25, 0x22, 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF, 0x1D, 0x1E, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0xFF, 0x1C, 0x22, 0x23, 0x25
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x27, 0x2C, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x26, 0x2C, 0x2E, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x2A, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x28, 0x2A, 0x2B, 0x2D
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x28, 0x29, 0x2B, 0x2D, 0xFF, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x29, 0x2D, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x26, 0x27, 0x2E, 0x30, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x29, 0x2B, 0x2A, 0x2F
	.byte 0x34, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x27, 0x2C, 0x30, 0x3B, 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x2A, 0x2D, 0x33, 0x34, 0x35, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x2C, 0x2E, 0x3B, 0x3A, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x32, 0x33, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x31, 0x33, 0x34, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x31, 0x32, 0x34, 0x35, 0x2F, 0xFF, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x32, 0x33, 0x2D, 0x2F, 0x35, 0x36, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2F, 0x33, 0x34, 0x36
	.byte 0x37, 0xFF, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x34, 0x35, 0x37, 0x38, 0xFF, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x35, 0x36, 0x38, 0x39, 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x36, 0x37, 0x39, 0x3A, 0x3B, 0xFF, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x37, 0x38, 0x3A, 0x3B
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x38, 0x39, 0x3B, 0x30, 0xFF, 0xFF, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x3A, 0x30, 0x39, 0x2E, 0xFF, 0xFF, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x0C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x80, 0x14, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x80, 0x0F, 0x00, 0x00, 0x80, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x80, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	@ 0x02257B80
