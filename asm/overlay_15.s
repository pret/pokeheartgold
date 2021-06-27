
	thumb_func_start ov15_021F9380
ov15_021F9380: @ 0x021F9380
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r0, #1
	lsls r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _021F95EC @ =0xFFFFE0FF
	ldr r3, _021F95F0 @ =0x04001000
	ands r2, r1
	str r2, [r0]
	ldr r2, [r3]
	adds r0, #0x50
	ands r1, r2
	str r1, [r3]
	movs r1, #0
	strh r1, [r0]
	adds r3, #0x50
	movs r2, #0x42
	strh r1, [r3]
	movs r0, #3
	movs r1, #6
	lsls r2, r2, #0xc
	bl FUN_0201A910
	ldr r1, _021F95F4 @ =0x0000094C
	adds r0, r5, #0
	movs r2, #6
	bl FUN_02007280
	ldr r2, _021F95F4 @ =0x0000094C
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r5, #0
	bl FUN_020072A4
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov15_021F98F4
	movs r0, #6
	bl FUN_0201AC88
	str r0, [r4]
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02028F94
	ldr r1, _021F95F8 @ =0x00000615
	movs r3, #0
	strb r0, [r4, r1]
	movs r1, #6
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r1, #3
	movs r0, #2
	adds r2, r1, #0
	bl FUN_0200FA24
	movs r0, #3
	movs r1, #8
	bl FUN_0201A71C
	adds r0, r4, #0
	bl ov15_021F9DB4
	adds r0, r4, #0
	bl ov15_021F9CBC
	adds r0, r4, #0
	bl ov15_021FA008
	adds r0, r4, #0
	bl ov15_021F9D28
	adds r0, r4, #0
	bl ov15_021FA620
	bl ov15_021F9984
	ldr r0, [r4]
	bl ov15_021F99A4
	adds r0, r4, #0
	bl ov15_021F9AE4
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	adds r0, r4, #0
	bl ov15_021FE020
	movs r0, #1
	bl FUN_02002B8C
	adds r0, r4, #0
	bl ov15_021FE4C8
	adds r0, r4, #0
	bl ov15_021FE528
	adds r0, r4, #0
	bl ov15_021FEA5C
	adds r0, r4, #0
	bl ov15_021FE874
	adds r0, r4, #0
	bl ov15_021F9F08
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FF29C
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r3, #0
	adds r1, r3, #0
	adds r0, #0xa
	adds r1, #8
	adds r0, r0, r2
	adds r1, r1, r2
	adds r2, r3, r2
	ldrb r2, [r2, #0xd]
	bl ov15_021FA044
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r3, #0
	adds r1, r3, #0
	adds r0, #0xa
	adds r1, #8
	adds r0, r0, r2
	adds r1, r1, r2
	adds r2, r3, r2
	ldrb r2, [r2, #0xd]
	movs r3, #6
	bl ov15_021FA070
	adds r0, r4, #0
	bl ov15_021FF850
	adds r0, r4, #0
	bl ov15_021FA074
	movs r1, #0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r3, r1, #0
	bl ov15_021FD574
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	muls r1, r2, r1
	adds r1, r3, r1
	movs r2, #0xa
	ldrsh r1, [r1, r2]
	subs r2, #0xb
	movs r3, #0
	bl ov15_021FF364
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	adds r0, r4, #0
	adds r2, #0x64
	ldrb r2, [r2]
	movs r1, #1
	bl ov15_021FD404
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r3, r3, r2
	movs r2, #0xa
	ldrb r1, [r3, #0xd]
	ldrsh r2, [r3, r2]
	adds r0, r4, #0
	movs r3, #0
	bl ov15_021FF6BC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r5, [r4, r0]
	adds r0, r4, #0
	bl ov15_021FA074
	adds r1, r5, #4
	adds r5, #0x64
	adds r2, r0, #0
	ldrb r5, [r5]
	movs r3, #0xc
	adds r0, r4, #0
	muls r3, r5, r3
	adds r1, r1, r3
	movs r3, #1
	bl ov15_02200140
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	ldrh r0, [r0, #8]
	ldr r1, _021F95FC @ =0x00000644
	adds r0, #8
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov15_021FFECC
	adds r0, r4, #0
	bl ov15_021FA170
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, #0x65
	ldrb r0, [r0]
	adds r0, #0xfc
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _021F95B6
	adds r0, r4, #0
	bl ov15_021FF1E0
_021F95B6:
	adds r0, r4, #0
	bl ov15_021FD93C
	ldr r0, _021F9600 @ =ov15_021F995C
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r1, #0
	movs r0, #0x33
	adds r2, r1, #0
	bl FUN_02004EC4
	bl FUN_0203A964
	ldr r2, _021F9604 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r0, #4
	movs r1, #1
	bl FUN_0201BC28
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021F95EC: .4byte 0xFFFFE0FF
_021F95F0: .4byte 0x04001000
_021F95F4: .4byte 0x0000094C
_021F95F8: .4byte 0x00000615
_021F95FC: .4byte 0x00000644
_021F9600: .4byte ov15_021F995C
_021F9604: .4byte 0x04000304
	thumb_func_end ov15_021F9380

	thumb_func_start ov15_021F9608
ov15_021F9608: @ 0x021F9608
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #0x25
	bhi _021F96B8
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F9624: @ jump table
	.2byte _021F9670 - _021F9624 - 2 @ case 0
	.2byte _021F96A8 - _021F9624 - 2 @ case 1
	.2byte _021F96B0 - _021F9624 - 2 @ case 2
	.2byte _021F96E8 - _021F9624 - 2 @ case 3
	.2byte _021F96F0 - _021F9624 - 2 @ case 4
	.2byte _021F96F8 - _021F9624 - 2 @ case 5
	.2byte _021F9700 - _021F9624 - 2 @ case 6
	.2byte _021F9708 - _021F9624 - 2 @ case 7
	.2byte _021F9710 - _021F9624 - 2 @ case 8
	.2byte _021F9718 - _021F9624 - 2 @ case 9
	.2byte _021F9720 - _021F9624 - 2 @ case 10
	.2byte _021F9728 - _021F9624 - 2 @ case 11
	.2byte _021F9730 - _021F9624 - 2 @ case 12
	.2byte _021F9738 - _021F9624 - 2 @ case 13
	.2byte _021F9740 - _021F9624 - 2 @ case 14
	.2byte _021F9748 - _021F9624 - 2 @ case 15
	.2byte _021F9750 - _021F9624 - 2 @ case 16
	.2byte _021F9758 - _021F9624 - 2 @ case 17
	.2byte _021F9760 - _021F9624 - 2 @ case 18
	.2byte _021F9768 - _021F9624 - 2 @ case 19
	.2byte _021F9770 - _021F9624 - 2 @ case 20
	.2byte _021F9778 - _021F9624 - 2 @ case 21
	.2byte _021F9780 - _021F9624 - 2 @ case 22
	.2byte _021F9788 - _021F9624 - 2 @ case 23
	.2byte _021F9790 - _021F9624 - 2 @ case 24
	.2byte _021F97A0 - _021F9624 - 2 @ case 25
	.2byte _021F9798 - _021F9624 - 2 @ case 26
	.2byte _021F97A8 - _021F9624 - 2 @ case 27
	.2byte _021F97B0 - _021F9624 - 2 @ case 28
	.2byte _021F97B8 - _021F9624 - 2 @ case 29
	.2byte _021F97C0 - _021F9624 - 2 @ case 30
	.2byte _021F97CA - _021F9624 - 2 @ case 31
	.2byte _021F97D6 - _021F9624 - 2 @ case 32
	.2byte _021F97DE - _021F9624 - 2 @ case 33
	.2byte _021F97E6 - _021F9624 - 2 @ case 34
	.2byte _021F97EE - _021F9624 - 2 @ case 35
	.2byte _021F97F6 - _021F9624 - 2 @ case 36
	.2byte _021F9804 - _021F9624 - 2 @ case 37
_021F9670:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021F96B8
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #1
	beq _021F9696
	cmp r0, #2
	beq _021F9690
	cmp r0, #3
	beq _021F969C
	b _021F96A2
_021F9690:
	movs r0, #0x10
	str r0, [r4]
	b _021F9810
_021F9696:
	movs r0, #0xe
	str r0, [r4]
	b _021F9810
_021F969C:
	movs r0, #0x1a
	str r0, [r4]
	b _021F9810
_021F96A2:
	movs r0, #1
	str r0, [r4]
	b _021F9810
_021F96A8:
	bl ov15_021FA1BC
	str r0, [r4]
	b _021F9810
_021F96B0:
	bl ov15_021FA93C
	cmp r0, #1
	beq _021F96BA
_021F96B8:
	b _021F9810
_021F96BA:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F96CE
	movs r0, #0x10
	str r0, [r4]
	b _021F9810
_021F96CE:
	cmp r0, #1
	bne _021F96D8
	movs r0, #0xe
	str r0, [r4]
	b _021F9810
_021F96D8:
	cmp r0, #3
	bne _021F96E2
	movs r0, #0x1a
	str r0, [r4]
	b _021F9810
_021F96E2:
	movs r0, #1
	str r0, [r4]
	b _021F9810
_021F96E8:
	bl ov15_021FAE48
	str r0, [r4]
	b _021F9810
_021F96F0:
	bl ov15_021FB5AC
	str r0, [r4]
	b _021F9810
_021F96F8:
	bl ov15_021FBD50
	str r0, [r4]
	b _021F9810
_021F9700:
	bl ov15_021FBF98
	str r0, [r4]
	b _021F9810
_021F9708:
	bl ov15_021FBFC0
	str r0, [r4]
	b _021F9810
_021F9710:
	bl ov15_021FBFF8
	str r0, [r4]
	b _021F9810
_021F9718:
	bl ov15_021FC01C
	str r0, [r4]
	b _021F9810
_021F9720:
	bl ov15_021FC140
	str r0, [r4]
	b _021F9810
_021F9728:
	bl ov15_021FC164
	str r0, [r4]
	b _021F9810
_021F9730:
	bl ov15_021FB700
	str r0, [r4]
	b _021F9810
_021F9738:
	bl ov15_021FB820
	str r0, [r4]
	b _021F9810
_021F9740:
	bl ov15_021FC41C
	str r0, [r4]
	b _021F9810
_021F9748:
	bl ov15_021FC784
	str r0, [r4]
	b _021F9810
_021F9750:
	bl ov15_021FC7EC
	str r0, [r4]
	b _021F9810
_021F9758:
	bl ov15_021FCD80
	str r0, [r4]
	b _021F9810
_021F9760:
	bl ov15_021FCDE4
	str r0, [r4]
	b _021F9810
_021F9768:
	bl ov15_021FCFC8
	str r0, [r4]
	b _021F9810
_021F9770:
	bl ov15_021FD058
	str r0, [r4]
	b _021F9810
_021F9778:
	bl ov15_021FD0E8
	str r0, [r4]
	b _021F9810
_021F9780:
	bl ov15_021FD10C
	str r0, [r4]
	b _021F9810
_021F9788:
	bl ov15_021FD24C
	str r0, [r4]
	b _021F9810
_021F9790:
	bl ov15_021FD2FC
	str r0, [r4]
	b _021F9810
_021F9798:
	bl ov15_021FD3AC
	str r0, [r4]
	b _021F9810
_021F97A0:
	bl ov15_021FC2E0
	str r0, [r4]
	b _021F9810
_021F97A8:
	bl ov15_021FA4F8
	str r0, [r4]
	b _021F9810
_021F97B0:
	bl ov15_021FB604
	str r0, [r4]
	b _021F9810
_021F97B8:
	bl ov15_021FB654
	str r0, [r4]
	b _021F9810
_021F97C0:
	movs r1, #1
	bl ov15_021FA578
	str r0, [r4]
	b _021F9810
_021F97CA:
	movs r1, #0
	mvns r1, r1
	bl ov15_021FA578
	str r0, [r4]
	b _021F9810
_021F97D6:
	bl ov15_021FB060
	str r0, [r4]
	b _021F9810
_021F97DE:
	bl ov15_021FAFFC
	str r0, [r4]
	b _021F9810
_021F97E6:
	bl ov15_021FCB64
	str r0, [r4]
	b _021F9810
_021F97EE:
	bl ov15_021FD850
	str r0, [r4]
	b _021F9810
_021F97F6:
	movs r0, #1
	movs r1, #6
	bl FUN_020880CC
	movs r0, #0x25
	str r0, [r4]
	b _021F9810
_021F9804:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021F9810
	movs r0, #1
	pop {r3, r4, r5, pc}
_021F9810:
	adds r0, r5, #0
	bl ov15_021FF8D4
	movs r0, #0x93
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200D020
	adds r0, r5, #0
	bl ov15_021FDC88
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov15_021F9608

	thumb_func_start ov15_021F982C
ov15_021F982C: @ 0x021F982C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov15_021FDC6C
	adds r0, r4, #0
	bl ov15_021FF894
	ldr r0, _021F98EC @ =0x0000068C
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x69
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov15_021FA0D8
	adds r0, r4, #0
	bl ov15_021F9EA8
	adds r0, r4, #0
	bl ov15_021FE154
	ldr r0, [r4]
	bl ov15_021F9A8C
	bl FUN_02021238
	bl FUN_020205AC
	adds r0, r4, #0
	bl ov15_021FEB64
	adds r0, r4, #0
	bl ov15_021FE504
	adds r0, r4, #0
	bl ov15_021FE8A4
	adds r0, r4, #0
	bl ov15_021FA028
	ldr r0, _021F98F0 @ =0x000005E4
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0xbb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200CD94
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200770C
	adds r0, r5, #0
	bl FUN_02007294
	bl FUN_02004B10
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #6
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F98EC: .4byte 0x0000068C
_021F98F0: .4byte 0x000005E4
	thumb_func_end ov15_021F982C

	thumb_func_start ov15_021F98F4
ov15_021F98F4: @ 0x021F98F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl FUN_0207879C
	movs r1, #0x8e
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl FUN_02028E9C
	movs r1, #0x8f
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #8
	ldr r0, [r4, r1]
	ldr r0, [r0]
	bl FUN_02028EA8
	movs r1, #9
	lsls r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov15_021F98F4

	thumb_func_start ov15_021F992C
ov15_021F992C: @ 0x021F992C
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _021F9938 @ =FUN_0202D9C4
	ldr r0, [r0]
	bx r3
	.align 2, 0
_021F9938: .4byte FUN_0202D9C4
	thumb_func_end ov15_021F992C

	thumb_func_start ov15_021F993C
ov15_021F993C: @ 0x021F993C
	push {r4, lr}
	adds r4, r1, #0
	bl ov15_021F992C
	bl FUN_0202DB04
	strb r4, [r0]
	pop {r4, pc}
	thumb_func_end ov15_021F993C

	thumb_func_start ov15_021F994C
ov15_021F994C: @ 0x021F994C
	push {r4, lr}
	adds r4, r1, #0
	bl ov15_021F992C
	adds r1, r4, #0
	bl FUN_0202DB18
	pop {r4, pc}
	thumb_func_end ov15_021F994C

	thumb_func_start ov15_021F995C
ov15_021F995C: @ 0x021F995C
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200D034
	ldr r3, _021F997C @ =0x027E0000
	ldr r1, _021F9980 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	nop
_021F997C: .4byte 0x027E0000
_021F9980: .4byte 0x00003FF8
	thumb_func_end ov15_021F995C

	thumb_func_start ov15_021F9984
ov15_021F9984: @ 0x021F9984
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021F99A0 @ =0x02200618
	add r3, sp, #0
	movs r2, #5
_021F998E:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021F998E
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_021F99A0: .4byte 0x02200618
	thumb_func_end ov15_021F9984

	thumb_func_start ov15_021F99A4
ov15_021F99A4: @ 0x021F99A4
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _021F9A68 @ =0x02200518
	add r3, sp, #4
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r2, _021F9A6C @ =0x022006CC
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r2, _021F9A70 @ =0x022006E8
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	ldr r2, _021F9A74 @ =0x02200704
	adds r0, r4, #0
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #6
	bl FUN_0201C1C4
	ldr r2, _021F9A78 @ =0x02200720
	adds r0, r4, #0
	movs r1, #4
	movs r3, #0
	bl FUN_0201B1E4
	ldr r2, _021F9A7C @ =0x0220073C
	adds r0, r4, #0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	ldr r2, _021F9A80 @ =0x02200758
	adds r0, r4, #0
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	ldr r2, _021F9A84 @ =0x02200774
	adds r0, r4, #0
	movs r1, #7
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201CAE0
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #6
	bl FUN_0201C1C4
	movs r0, #7
	movs r1, #0x20
	movs r2, #0
	movs r3, #6
	bl FUN_0201C1C4
	movs r1, #0
	ldr r0, _021F9A88 @ =0x04000050
	movs r2, #8
	adds r3, r1, #0
	str r1, [sp]
	blx FUN_020CF15C
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_021F9A68: .4byte 0x02200518
_021F9A6C: .4byte 0x022006CC
_021F9A70: .4byte 0x022006E8
_021F9A74: .4byte 0x02200704
_021F9A78: .4byte 0x02200720
_021F9A7C: .4byte 0x0220073C
_021F9A80: .4byte 0x02200758
_021F9A84: .4byte 0x02200774
_021F9A88: .4byte 0x04000050
	thumb_func_end ov15_021F99A4

	thumb_func_start ov15_021F9A8C
ov15_021F9A8C: @ 0x021F9A8C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	movs r1, #0
	bl FUN_02022C60
	movs r0, #0x1b
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
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
	movs r0, #6
	adds r1, r4, #0
	bl FUN_0201AB80
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021F9A8C

	thumb_func_start ov15_021F9AE4
ov15_021F9AE4: @ 0x021F9AE4
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0xf
	movs r1, #6
	bl FUN_02007688
	movs r1, #0x91
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0xf
	movs r1, #7
	movs r3, #2
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0xf
	movs r1, #0x36
	movs r3, #2
	bl FUN_02007914
	ldr r0, _021F9C60 @ =0x00000615
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021F9B4A
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0xf
	movs r1, #0x5e
	movs r3, #3
	bl FUN_02007914
	b _021F9B62
_021F9B4A:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0xf
	movs r1, #0x5d
	movs r3, #3
	bl FUN_02007914
_021F9B62:
	movs r2, #0
	str r2, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0xf
	movs r1, #8
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0x20
	str r0, [sp]
	movs r0, #6
	movs r3, #0x1a
	str r0, [sp, #4]
	movs r0, #0xf
	movs r1, #0x11
	movs r2, #0
	lsls r3, r3, #4
	bl FUN_02007938
	movs r1, #0x16
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #6
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021F9C64 @ =0x000003F7
	movs r1, #1
	movs r3, #0xe
	bl FUN_0200E3DC
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021F9C68 @ =0x000003D9
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E644
	movs r3, #0
	str r3, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0xf
	movs r1, #0x26
	movs r2, #4
	bl FUN_02007938
	movs r1, #0x16
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #6
	bl FUN_0200304C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r3, #6
	str r3, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0xf
	movs r1, #0x2e
	bl FUN_020078F0
	ldr r2, _021F9C6C @ =0x00000694
	movs r0, #0xf
	movs r1, #0x28
	adds r2, r4, r2
	movs r3, #6
	bl FUN_020079F4
	ldr r2, _021F9C70 @ =0x0000068C
	movs r1, #0x29
	str r0, [r4, r2]
	adds r2, #0xc
	movs r0, #0xf
	adds r2, r4, r2
	movs r3, #6
	bl FUN_020079F4
	movs r1, #0x69
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0x80
	movs r2, #4
	str r0, [sp]
	movs r0, #6
	adds r3, r2, #0
	str r0, [sp, #4]
	movs r0, #0xf
	movs r1, #8
	adds r3, #0xfc
	bl FUN_02007938
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021F9C74 @ =0x000003E2
	movs r1, #4
	movs r3, #0xc
	bl FUN_0200E644
	add sp, #0x10
	pop {r4, pc}
	nop
_021F9C60: .4byte 0x00000615
_021F9C64: .4byte 0x000003F7
_021F9C68: .4byte 0x000003D9
_021F9C6C: .4byte 0x00000694
_021F9C70: .4byte 0x0000068C
_021F9C74: .4byte 0x000003E2
	thumb_func_end ov15_021F9AE4

	thumb_func_start ov15_021F9C78
ov15_021F9C78: @ 0x021F9C78
	push {r3, lr}
	sub sp, #0x10
	adds r2, r0, #0
	cmp r1, #1
	bne _021F9C9E
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r2]
	movs r0, #0xf
	movs r1, #0x36
	movs r3, #2
	bl FUN_02007914
	add sp, #0x10
	pop {r3, pc}
_021F9C9E:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r2]
	movs r0, #0xf
	movs r1, #9
	movs r3, #2
	bl FUN_02007914
	add sp, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov15_021F9C78

	thumb_func_start ov15_021F9CBC
ov15_021F9CBC: @ 0x021F9CBC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xa
	movs r3, #6
	bl FUN_0200BAF8
	movs r1, #0x2f
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	movs r3, #6
	bl FUN_0200CC74
	movs r1, #0xbb
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #6
	bl FUN_0200BD08
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xde
	movs r3, #6
	bl FUN_0200BAF8
	movs r2, #0xbe
	lsls r2, r2, #2
	str r0, [r4, r2]
	movs r0, #0
	movs r1, #0x1b
	subs r2, #0xa
	movs r3, #6
	bl FUN_0200BAF8
	movs r1, #0xbf
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #6
	bl FUN_02026354
	ldr r1, _021F9D24 @ =0x000005E4
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_021F9D24: .4byte 0x000005E4
	thumb_func_end ov15_021F9CBC

	thumb_func_start ov15_021F9D28
ov15_021F9D28: @ 0x021F9D28
	push {r3, r4, r5, r6}
	ldr r2, _021F9D5C @ =0x00000614
	movs r1, #0
	strb r1, [r0, r2]
	adds r4, r2, #0
	movs r2, #0x8d
	lsls r2, r2, #2
	movs r3, #0xc
_021F9D38:
	adds r5, r1, #0
	ldr r6, [r0, r2]
	muls r5, r3, r5
	adds r5, r6, r5
	ldr r5, [r5, #4]
	cmp r5, #0
	beq _021F9D4C
	ldrb r5, [r0, r4]
	adds r5, r5, #1
	strb r5, [r0, r4]
_021F9D4C:
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #8
	blo _021F9D38
	pop {r3, r4, r5, r6}
	bx lr
	nop
_021F9D5C: .4byte 0x00000614
	thumb_func_end ov15_021F9D28

	thumb_func_start ov15_021F9D60
ov15_021F9D60: @ 0x021F9D60
	push {r3, r4}
	movs r3, #0x8d
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	adds r4, r0, #4
	adds r0, #0x64
	ldrb r3, [r0]
	movs r0, #0xc
	muls r0, r3, r0
	cmp r2, #0
	ldr r2, [r4, r0]
	bne _021F9D80
	lsls r0, r1, #2
	ldrh r0, [r2, r0]
	pop {r3, r4}
	bx lr
_021F9D80:
	lsls r0, r1, #2
	adds r0, r2, r0
	ldrh r0, [r0, #2]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov15_021F9D60

	thumb_func_start ov15_021F9D8C
ov15_021F9D8C: @ 0x021F9D8C
	adds r3, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _021F9D98 @ =FUN_0200BB6C
	bx r3
	nop
_021F9D98: .4byte FUN_0200BB6C
	thumb_func_end ov15_021F9D8C

	thumb_func_start ov15_021F9D9C
ov15_021F9D9C: @ 0x021F9D9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	bl FUN_02078000
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl FUN_0200BB6C
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021F9D9C

	thumb_func_start ov15_021F9DB4
ov15_021F9DB4: @ 0x021F9DB4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r7, r0]
	movs r5, #0
	adds r1, #0x64
	strb r5, [r1]
	ldr r0, [r7, r0]
	adds r4, r0, #4
	ldr r0, [r0, #0x6c]
	cmp r0, #0
	bne _021F9E12
	adds r2, r5, #0
	movs r1, #0xc
_021F9DD2:
	adds r0, r5, #0
	muls r0, r1, r0
	adds r3, r4, r0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F9DE2
	strh r2, [r3, #4]
	strh r2, [r3, #6]
_021F9DE2:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #8
	blo _021F9DD2
	movs r2, #0
	movs r1, #0xc
_021F9DF0:
	adds r0, r2, #0
	muls r0, r1, r0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F9E06
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r0, #0x64
	strb r2, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_021F9E06:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #8
	blo _021F9DF0
	pop {r3, r4, r5, r6, r7, pc}
_021F9E12:
	movs r0, #0xc
	muls r0, r5, r0
	adds r6, r4, r0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F9E3E
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	ldrb r1, [r6, #8]
	add r2, sp, #0
	ldr r0, [r0, #0x6c]
	adds r2, #1
	add r3, sp, #0
	bl FUN_020787C0
	add r0, sp, #0
	ldrb r0, [r0, #1]
	strh r0, [r6, #4]
	add r0, sp, #0
	ldrb r0, [r0]
	strh r0, [r6, #6]
_021F9E3E:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #8
	blo _021F9E12
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	ldr r0, [r0, #0x6c]
	bl FUN_020787D0
	movs r1, #0xc
	muls r1, r0, r1
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _021F9E7A
	movs r3, #0
	movs r2, #0xc
_021F9E62:
	adds r1, r3, #0
	muls r1, r2, r1
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _021F9E70
	adds r0, r3, #0
	b _021F9E7A
_021F9E70:
	adds r1, r3, #1
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	cmp r3, #8
	blo _021F9E62
_021F9E7A:
	movs r1, #0
	movs r2, #0xc
_021F9E7E:
	adds r3, r1, #0
	muls r3, r2, r3
	adds r5, r4, r3
	ldr r3, [r4, r3]
	cmp r3, #0
	beq _021F9E9C
	ldrb r3, [r5, #8]
	cmp r0, r3
	bne _021F9E9C
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r0, #0x64
	strb r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_021F9E9C:
	adds r1, r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #8
	blo _021F9E7E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021F9DB4

	thumb_func_start ov15_021F9EA8
ov15_021F9EA8: @ 0x021F9EA8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	ldr r0, [r1, #0x6c]
	cmp r0, #0
	beq _021F9F06
	adds r0, r1, #4
	str r0, [sp]
	movs r4, #0
	adds r5, r0, #0
	movs r7, #6
_021F9EC2:
	ldr r0, [r5]
	cmp r0, #0
	beq _021F9EE2
	movs r0, #0x8d
	lsls r0, r0, #2
	ldrh r2, [r5, #4]
	ldrsh r3, [r5, r7]
	ldr r0, [r6, r0]
	lsls r2, r2, #0x18
	lsls r3, r3, #0x18
	ldrb r1, [r5, #8]
	ldr r0, [r0, #0x6c]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_020787D4
_021F9EE2:
	adds r4, r4, #1
	adds r5, #0xc
	cmp r4, #8
	blo _021F9EC2
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	ldr r0, [r1, #0x6c]
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, [sp]
	adds r1, r1, r3
	ldrb r1, [r1, #8]
	bl FUN_020787E0
_021F9F06:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021F9EA8

	thumb_func_start ov15_021F9F08
ov15_021F9F08: @ 0x021F9F08
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r1, #0x8d
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r4, r2, r0
	ldrb r1, [r4, #8]
	cmp r1, #3
	bne _021F9F82
	ldr r0, _021FA000 @ =0x022008B0
	movs r6, #0
	ldrb r0, [r0, r1]
	cmp r0, #0
	bls _021F9F7E
	ldr r0, [sp]
	adds r5, r6, #0
	str r0, [sp, #4]
	adds r7, r0, #0
_021F9F38:
	ldr r0, [r4]
	ldrh r3, [r0, r5]
	adds r1, r0, r5
	cmp r3, #0
	beq _021F9F7E
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _021F9F7E
	movs r0, #0xbf
	ldr r1, [sp]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0x35
	ldr r2, [sp, #4]
	lsls r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, r3, #0
	movs r3, #6
	bl ov15_021F9D9C
	ldr r0, [r4]
	adds r6, r6, #1
	ldrh r1, [r0, r5]
	ldr r0, _021FA004 @ =0x000006A4
	adds r5, r5, #4
	strh r1, [r7, r0]
	ldr r0, [sp, #4]
	ldrb r1, [r4, #8]
	adds r0, r0, #4
	str r0, [sp, #4]
	ldr r0, _021FA000 @ =0x022008B0
	adds r7, r7, #2
	ldrb r0, [r0, r1]
	cmp r6, r0
	blo _021F9F38
_021F9F7E:
	strb r6, [r4, #9]
	b _021F9FDC
_021F9F82:
	ldr r0, _021FA000 @ =0x022008B0
	movs r6, #0
	ldrb r0, [r0, r1]
	cmp r0, #0
	bls _021F9FDA
	ldr r0, [sp]
	adds r5, r6, #0
	str r0, [sp, #8]
	adds r7, r0, #0
_021F9F94:
	ldr r0, [r4]
	ldrh r3, [r0, r5]
	adds r1, r0, r5
	cmp r3, #0
	beq _021F9FDA
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _021F9FDA
	movs r0, #0xbe
	ldr r1, [sp]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0x35
	ldr r2, [sp, #8]
	lsls r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, r3, #0
	movs r3, #6
	bl ov15_021F9D8C
	ldr r0, [r4]
	adds r6, r6, #1
	ldrh r1, [r0, r5]
	ldr r0, _021FA004 @ =0x000006A4
	adds r5, r5, #4
	strh r1, [r7, r0]
	ldr r0, [sp, #8]
	ldrb r1, [r4, #8]
	adds r0, r0, #4
	str r0, [sp, #8]
	ldr r0, _021FA000 @ =0x022008B0
	adds r7, r7, #2
	ldrb r0, [r0, r1]
	cmp r6, r0
	blo _021F9F94
_021F9FDA:
	strb r6, [r4, #9]
_021F9FDC:
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _021F9FE6
	movs r1, #0
	b _021F9FF2
_021F9FE6:
	subs r0, r0, #1
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
_021F9FF2:
	movs r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, r1
	ble _021F9FFC
	strh r1, [r4, #6]
_021F9FFC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021FA000: .4byte 0x022008B0
_021FA004: .4byte 0x000006A4
	thumb_func_end ov15_021F9F08

	thumb_func_start ov15_021FA008
ov15_021FA008: @ 0x021FA008
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0x35
	adds r5, r0, #0
	movs r4, #0
	movs r7, #0x12
	lsls r6, r6, #4
_021FA014:
	adds r0, r7, #0
	movs r1, #6
	bl FUN_02026354
	str r0, [r5, r6]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xa5
	blo _021FA014
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FA008

	thumb_func_start ov15_021FA028
ov15_021FA028: @ 0x021FA028
	push {r4, r5, r6, lr}
	movs r6, #0x35
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #4
_021FA032:
	ldr r0, [r5, r6]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xa5
	blo _021FA032
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov15_021FA028

	thumb_func_start ov15_021FA044
ov15_021FA044: @ 0x021FA044
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldrsh r3, [r4, r0]
	ldrh r0, [r1]
	adds r0, r3, r0
	cmp r0, r2
	ble _021FA062
	subs r0, r2, #1
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	strh r1, [r4]
_021FA062:
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _021FA06C
	strh r0, [r4]
_021FA06C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021FA044

	thumb_func_start ov15_021FA070
ov15_021FA070: @ 0x021FA070
	bx lr
	.align 2, 0
	thumb_func_end ov15_021FA070

	thumb_func_start ov15_021FA074
ov15_021FA074: @ 0x021FA074
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r2, r2, r0
	movs r0, #0xa
	ldrb r1, [r2, #0xd]
	ldrsh r0, [r2, r0]
	subs r0, r1, r0
	cmp r0, #6
	ble _021FA094
	movs r0, #6
_021FA094:
	bx lr
	.align 2, 0
	thumb_func_end ov15_021FA074

	thumb_func_start ov15_021FA098
ov15_021FA098: @ 0x021FA098
	push {r3, r4, r5, lr}
	ldr r1, _021FA0D4 @ =0x00000672
	ldrb r4, [r0, r1]
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r5, [r0, r1]
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2998
	adds r1, r5, #0
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	muls r1, r2, r1
	adds r2, r5, r1
	movs r1, #0xa
	ldrsh r3, [r2, r1]
	movs r1, #6
	adds r2, r0, #0
	muls r2, r1, r2
	cmp r3, r2
	bne _021FA0CE
	adds r0, r4, #0
	blx FUN_020F2998
	b _021FA0D0
_021FA0CE:
	subs r1, r1, #7
_021FA0D0:
	adds r0, r1, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FA0D4: .4byte 0x00000672
	thumb_func_end ov15_021FA098

	thumb_func_start ov15_021FA0D8
ov15_021FA0D8: @ 0x021FA0D8
	movs r1, #0xd2
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov15_021FA0D8

	thumb_func_start ov15_021FA0E4
ov15_021FA0E4: @ 0x021FA0E4
	cmp r1, #8
	blt _021FA102
	cmp r1, #0xe
	bge _021FA102
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r3, [r0, r2]
	subs r1, #8
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r0, #0xc
	muls r0, r2, r0
	adds r0, r3, r0
	strh r1, [r0, #8]
_021FA102:
	bx lr
	thumb_func_end ov15_021FA0E4

	thumb_func_start ov15_021FA104
ov15_021FA104: @ 0x021FA104
	adds r2, r1, #0
	subs r2, #0xe
	cmp r2, #1
	bhi _021FA110
	movs r0, #0
	bx lr
_021FA110:
	cmp r1, #7
	bgt _021FA124
	ldr r1, _021FA128 @ =0x00000644
	ldr r0, [r0, r1]
	cmp r0, #8
	blt _021FA124
	cmp r0, #0xd
	bgt _021FA124
	movs r0, #0
	bx lr
_021FA124:
	movs r0, #1
	bx lr
	.align 2, 0
_021FA128: .4byte 0x00000644
	thumb_func_end ov15_021FA104

	thumb_func_start ov15_021FA12C
ov15_021FA12C: @ 0x021FA12C
	push {r3, r4}
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r3, [r0, r1]
	adds r1, r3, #0
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	adds r3, r3, #4
	muls r1, r2, r1
	adds r1, r3, r1
	movs r3, #6
	ldrsh r4, [r1, r3]
	ldr r3, _021FA168 @ =0x00000644
	ldr r0, [r0, r3]
	adds r3, r4, r0
	ldr r0, _021FA16C @ =0x022008B0
	subs r3, #8
	ldrb r0, [r0, r2]
	cmp r0, r3
	bhi _021FA15C
	movs r0, #0
	pop {r3, r4}
	bx lr
_021FA15C:
	ldr r1, [r1]
	lsls r0, r3, #2
	ldrh r0, [r1, r0]
	pop {r3, r4}
	bx lr
	nop
_021FA168: .4byte 0x00000644
_021FA16C: .4byte 0x022008B0
	thumb_func_end ov15_021FA12C

	thumb_func_start ov15_021FA170
ov15_021FA170: @ 0x021FA170
	push {r4, lr}
	ldr r1, _021FA1B8 @ =0x00000644
	adds r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #8
	blt _021FA19C
	cmp r2, #0xd
	bgt _021FA19C
	bl ov15_021FA12C
	adds r2, r0, #0
	beq _021FA192
	adds r0, r4, #0
	adds r1, r4, #4
	bl ov15_021FECA0
	pop {r4, pc}
_021FA192:
	adds r0, r4, #0
	adds r1, r4, #4
	bl ov15_021FECC4
	pop {r4, pc}
_021FA19C:
	cmp r2, #0
	blt _021FA1AE
	cmp r2, #7
	bgt _021FA1AE
	adds r0, r4, #0
	adds r1, r4, #4
	bl ov15_021FECD8
	pop {r4, pc}
_021FA1AE:
	adds r0, r4, #0
	adds r1, r4, #4
	bl ov15_021FECC4
	pop {r4, pc}
	.align 2, 0
_021FA1B8: .4byte 0x00000644
	thumb_func_end ov15_021FA170

	thumb_func_start ov15_021FA1BC
ov15_021FA1BC: @ 0x021FA1BC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021FA4A4 @ =0x021D110C
	movs r2, #0x40
	ldr r3, [r1, #0x4c]
	adds r5, r0, #0
	movs r4, #0
	tst r2, r3
	beq _021FA1DE
	ldr r0, _021FA4A8 @ =0x00000644
	adds r4, r4, #1
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _021FA4AC @ =0x02200640
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FA38C
_021FA1DE:
	movs r2, #0x80
	tst r2, r3
	beq _021FA1F4
	ldr r0, _021FA4A8 @ =0x00000644
	adds r4, r4, #1
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _021FA4B0 @ =0x02200641
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FA38C
_021FA1F4:
	movs r2, #0x20
	adds r6, r3, #0
	tst r6, r2
	beq _021FA246
	ldr r1, _021FA4A8 @ =0x00000644
	ldr r3, _021FA4B4 @ =0x02200642
	ldr r1, [r5, r1]
	lsls r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #0xe
	bne _021FA21E
	movs r1, #2
	str r1, [sp]
	movs r1, #0xe
	add r2, sp, #0xc
	movs r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA21E:
	cmp r1, #0x10
	beq _021FA274
	cmp r1, #0
	blt _021FA23E
	cmp r1, #8
	bge _021FA23E
	subs r2, #0x21
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 @ =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FA274
	str r0, [r5, r1]
	adds r4, r4, #1
	b _021FA38C
_021FA23E:
	ldr r0, _021FA4A8 @ =0x00000644
	adds r4, r4, #1
	str r3, [r5, r0]
	b _021FA38C
_021FA246:
	movs r2, #0x10
	tst r3, r2
	beq _021FA29A
	ldr r1, _021FA4A8 @ =0x00000644
	ldr r2, _021FA4B8 @ =0x02200643
	ldr r1, [r5, r1]
	lsls r3, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0xf
	bne _021FA270
	movs r1, #2
	str r1, [sp]
	add r2, sp, #8
	movs r1, #0xf
	adds r2, #3
	movs r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA270:
	cmp r1, #0x10
	bne _021FA276
_021FA274:
	b _021FA38C
_021FA276:
	cmp r1, #0
	blt _021FA292
	cmp r1, #8
	bge _021FA292
	movs r2, #1
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 @ =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FA38C
	str r0, [r5, r1]
	adds r4, r4, #1
	b _021FA38C
_021FA292:
	ldr r0, _021FA4A8 @ =0x00000644
	adds r4, r4, #1
	str r2, [r5, r0]
	b _021FA38C
_021FA29A:
	ldr r3, [r1, #0x48]
	lsls r1, r2, #5
	tst r1, r3
	beq _021FA314
	ldr r1, _021FA4A8 @ =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FA2E6
	cmp r1, #8
	bge _021FA2E6
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	subs r2, #0x11
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 @ =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov15_021FFECC
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FA4A8 @ =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r2, #2
	movs r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA2E6:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #0
	adds r1, #0x64
	ldrb r1, [r1]
	adds r0, r5, #0
	mvns r2, r2
	bl ov15_021FA6C0
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, #2
	movs r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA314:
	adds r2, #0xf0
	adds r1, r3, #0
	tst r1, r2
	beq _021FA38C
	ldr r1, _021FA4A8 @ =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FA360
	cmp r1, #8
	bge _021FA360
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #1
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 @ =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov15_021FFECC
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FA4A8 @ =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r2, #1
	movs r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA360:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, #0x64
	ldrb r1, [r1]
	movs r2, #1
	bl ov15_021FA6C0
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, #1
	movs r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA38C:
	ldr r1, _021FA4A8 @ =0x00000644
	ldr r0, [r5, r1]
	cmp r0, #0x11
	bne _021FA3A0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x64
	ldrb r0, [r0]
	str r0, [r5, r1]
_021FA3A0:
	cmp r4, #0
	beq _021FA3C4
	ldr r0, _021FA4BC @ =0x000005DC
	bl FUN_0200604C
	ldr r1, _021FA4A8 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r1, _021FA4A8 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FA0E4
	adds r0, r5, #0
	bl ov15_021FA170
_021FA3C4:
	movs r1, #0
	add r0, sp, #8
	strb r1, [r0]
	adds r0, r5, #0
	bl ov15_021FAC2C
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021FA440
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FA104
	cmp r0, #0
	beq _021FA426
	cmp r4, #8
	bhs _021FA408
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FA68C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021FA426
	ldr r1, _021FA4A8 @ =0x00000644
	adds r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	b _021FA426
_021FA408:
	ldr r1, _021FA4A8 @ =0x00000644
	adds r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FA4A8 @ =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FA426
	cmp r1, #0xd
	bgt _021FA426
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FA426:
	movs r0, #2
	str r0, [sp]
	movs r3, #1
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #8
	str r3, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FA4DA
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA440:
	ldr r0, _021FA4A4 @ =0x021D110C
	movs r3, #1
	ldr r1, [r0, #0x48]
	adds r0, r1, #0
	tst r0, r3
	beq _021FA47E
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _021FA4A8 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	add r2, sp, #8
	bl ov15_021FA73C
	adds r4, r0, #0
	ldr r0, _021FA4A8 @ =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FA474
	cmp r1, #0xd
	bgt _021FA474
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FA474:
	cmp r4, #1
	beq _021FA4DA
	add sp, #0x10
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021FA47E:
	movs r0, #2
	tst r1, r0
	beq _021FA4DA
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	add r2, sp, #8
	bl ov15_021FA73C
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FD774
	ldr r0, _021FA4A8 @ =0x00000644
	b _021FA4C0
	nop
_021FA4A4: .4byte 0x021D110C
_021FA4A8: .4byte 0x00000644
_021FA4AC: .4byte 0x02200640
_021FA4B0: .4byte 0x02200641
_021FA4B4: .4byte 0x02200642
_021FA4B8: .4byte 0x02200643
_021FA4BC: .4byte 0x000005DC
_021FA4C0:
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FA4D0
	cmp r1, #0xd
	bgt _021FA4D0
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FA4D0:
	cmp r4, #1
	beq _021FA4DA
	add sp, #0x10
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021FA4DA:
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #1
	bne _021FA4F2
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0x29
	movs r3, #0x1b
	bl ov15_021FD810
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA4F2:
	movs r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FA1BC

	thumb_func_start ov15_021FA4F8
ov15_021FA4F8: @ 0x021FA4F8
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x8d
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r6, r1, #4
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	adds r7, r2, #0
	muls r7, r1, r7
	movs r2, #0
	movs r1, #2
	adds r3, r2, #0
	adds r4, r6, r7
	bl ov15_021FD574
	ldr r2, _021FA574 @ =0x00000644
	movs r1, #6
	ldr r2, [r5, r2]
	ldrsh r1, [r4, r1]
	adds r0, r5, #0
	subs r2, #8
	bl ov15_021FF4EC
	ldr r1, _021FA574 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	subs r1, #8
	bl ov15_022002B4
	adds r0, r5, #0
	bl ov15_021FB14C
	movs r0, #6
	ldrsh r3, [r4, r0]
	ldr r0, _021FA574 @ =0x00000644
	ldr r1, [r6, r7]
	ldr r2, [r5, r0]
	adds r2, r3, r2
	subs r2, #8
	lsls r2, r2, #2
	ldrh r2, [r1, r2]
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r1, #0x66
	strh r2, [r1]
	movs r2, #6
	ldrsh r3, [r4, r2]
	ldr r2, [r5, r0]
	ldr r1, [r6, r7]
	adds r2, r3, r2
	subs r2, #8
	lsls r2, r2, #2
	adds r1, r1, r2
	ldrh r1, [r1, #2]
	adds r0, #0x3e
	strh r1, [r5, r0]
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FA574: .4byte 0x00000644
	thumb_func_end ov15_021FA4F8

	thumb_func_start ov15_021FA578
ov15_021FA578: @ 0x021FA578
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r3, r0, #4
	adds r0, #0x64
	ldrb r2, [r0]
	movs r0, #0xc
	muls r0, r2, r0
	adds r4, r3, r0
	cmp r1, #0
	ble _021FA5A8
	movs r0, #6
	ldrsh r0, [r4, r0]
	adds r1, r0, #6
	ldrb r0, [r4, #9]
	cmp r1, r0
	bge _021FA5A2
	strh r1, [r4, #6]
	b _021FA5C2
_021FA5A2:
	movs r0, #0
	strh r0, [r4, #6]
	b _021FA5C2
_021FA5A8:
	movs r1, #6
	ldrsh r0, [r4, r1]
	subs r0, r0, #6
	bmi _021FA5B4
	strh r0, [r4, #6]
	b _021FA5C2
_021FA5B4:
	ldrb r0, [r4, #9]
	subs r0, r0, #1
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	strh r1, [r4, #6]
_021FA5C2:
	ldr r0, _021FA618 @ =0x00000671
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021FA5E0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FAD80
	ldr r1, _021FA61C @ =0x0000066C
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFF34
	movs r0, #3
	pop {r3, r4, r5, pc}
_021FA5E0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FA6F4
	adds r0, r5, #0
	bl ov15_021FA170
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #1
	beq _021FA60A
	cmp r0, #2
	beq _021FA606
	cmp r0, #3
	beq _021FA60E
	b _021FA612
_021FA606:
	movs r0, #0x10
	pop {r3, r4, r5, pc}
_021FA60A:
	movs r0, #0xe
	pop {r3, r4, r5, pc}
_021FA60E:
	movs r0, #0x1a
	pop {r3, r4, r5, pc}
_021FA612:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021FA618: .4byte 0x00000671
_021FA61C: .4byte 0x0000066C
	thumb_func_end ov15_021FA578

	thumb_func_start ov15_021FA620
ov15_021FA620: @ 0x021FA620
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FA648 @ =0x00000614
	ldrb r2, [r4, r0]
	movs r0, #0xa
	adds r1, r2, #0
	muls r1, r0, r1
	movs r0, #0x5a
	subs r0, r0, r1
	adds r1, r2, #1
	blx FUN_020F2998
	adds r1, r0, #6
	ldr r0, _021FA64C @ =0x00000617
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	adds r0, r0, #1
	adds r1, r1, #4
	strb r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_021FA648: .4byte 0x00000614
_021FA64C: .4byte 0x00000617
	thumb_func_end ov15_021FA620

	thumb_func_start ov15_021FA650
ov15_021FA650: @ 0x021FA650
	push {r4, lr}
	ldr r1, _021FA680 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #2
	lsls r1, r1, #0xc
	tst r1, r2
	beq _021FA67C
	ldr r3, _021FA684 @ =0x02201480
	ldr r1, [r3]
	adds r4, r1, #1
	ldr r1, _021FA688 @ =0x02201300
	str r4, [r3]
	ldr r2, [r1]
	cmp r4, r2
	blt _021FA672
	movs r1, #0
	str r1, [r3]
_021FA672:
	ldr r3, _021FA684 @ =0x02201480
	movs r1, #1
	ldr r3, [r3]
	bl ov15_021FD574
_021FA67C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021FA680: .4byte 0x021D110C
_021FA684: .4byte 0x02201480
_021FA688: .4byte 0x02201300
	thumb_func_end ov15_021FA650

	thumb_func_start ov15_021FA68C
ov15_021FA68C: @ 0x021FA68C
	push {r4, r5}
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r5, [r0, r2]
	movs r3, #0
	adds r2, r5, #0
	adds r4, r3, #0
_021FA69A:
	ldrb r0, [r2, #0xc]
	cmp r1, r0
	bne _021FA6AE
	adds r0, r5, r4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _021FA6AE
	adds r0, r3, #0
	pop {r4, r5}
	bx lr
_021FA6AE:
	adds r3, r3, #1
	adds r2, #0xc
	adds r4, #0xc
	cmp r3, #8
	blt _021FA69A
	movs r0, #0
	mvns r0, r0
	pop {r4, r5}
	bx lr
	thumb_func_end ov15_021FA68C

	thumb_func_start ov15_021FA6C0
ov15_021FA6C0: @ 0x021FA6C0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r4, #0
_021FA6CA:
	adds r5, r5, r6
	bpl _021FA6D2
	movs r5, #7
	b _021FA6D8
_021FA6D2:
	cmp r5, #8
	bne _021FA6D8
	movs r5, #0
_021FA6D8:
	adds r0, r7, #0
	adds r1, r5, #0
	bl ov15_021FA68C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021FA6EE
	adds r4, r4, #1
	cmp r4, #8
	blt _021FA6CA
_021FA6EE:
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov15_021FA6C0

	thumb_func_start ov15_021FA6F4
ov15_021FA6F4: @ 0x021FA6F4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov15_021FA074
	movs r1, #0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r3, r1, #0
	bl ov15_021FD574
	movs r2, #6
	ldrsh r1, [r4, r2]
	adds r0, r5, #0
	subs r2, r2, #7
	movs r3, #0
	bl ov15_021FF364
	movs r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov15_021FF6BC
	adds r0, r5, #0
	bl ov15_021FA074
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #1
	bl ov15_02200140
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov15_021FA6F4

	thumb_func_start ov15_021FA73C
ov15_021FA73C: @ 0x021FA73C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	movs r6, #1
	cmp r1, #0x10
	bls _021FA74A
	b _021FA92A
_021FA74A:
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021FA756: @ jump table
	.2byte _021FA778 - _021FA756 - 2 @ case 0
	.2byte _021FA778 - _021FA756 - 2 @ case 1
	.2byte _021FA778 - _021FA756 - 2 @ case 2
	.2byte _021FA778 - _021FA756 - 2 @ case 3
	.2byte _021FA778 - _021FA756 - 2 @ case 4
	.2byte _021FA778 - _021FA756 - 2 @ case 5
	.2byte _021FA778 - _021FA756 - 2 @ case 6
	.2byte _021FA778 - _021FA756 - 2 @ case 7
	.2byte _021FA856 - _021FA756 - 2 @ case 8
	.2byte _021FA856 - _021FA756 - 2 @ case 9
	.2byte _021FA856 - _021FA756 - 2 @ case 10
	.2byte _021FA856 - _021FA756 - 2 @ case 11
	.2byte _021FA856 - _021FA756 - 2 @ case 12
	.2byte _021FA856 - _021FA756 - 2 @ case 13
	.2byte _021FA8C4 - _021FA756 - 2 @ case 14
	.2byte _021FA892 - _021FA756 - 2 @ case 15
	.2byte _021FA8F6 - _021FA756 - 2 @ case 16
_021FA778:
	bl ov15_021FA68C
	subs r1, r6, #2
	cmp r0, r1
	bne _021FA786
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FA786:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	adds r1, r2, #0
	adds r1, #0x64
	ldrb r1, [r1]
	cmp r0, r1
	bne _021FA7A0
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	bne _021FA7A0
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FA7A0:
	adds r2, #0x64
	strb r0, [r2]
	adds r0, r4, #0
	bl ov15_021F9F08
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r5, r2, r0
	adds r0, r4, #0
	bl ov15_021FA074
	movs r1, #0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r3, r1, #0
	bl ov15_021FD574
	movs r2, #6
	ldrsh r1, [r5, r2]
	adds r0, r4, #0
	subs r2, r2, #7
	movs r3, #0
	bl ov15_021FF364
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	movs r2, #6
	ldrb r1, [r5, #9]
	ldrsh r2, [r5, r2]
	adds r0, r4, #0
	movs r3, #0
	bl ov15_021FF6BC
	adds r0, r4, #0
	bl ov15_021FA074
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl ov15_02200140
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	adds r0, r4, #0
	adds r2, #0x64
	ldrb r2, [r2]
	movs r1, #1
	bl ov15_021FD404
	ldr r0, _021FA930 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov15_021FA170
	ldr r0, _021FA934 @ =0x00000644
	ldr r1, [r4, r0]
	cmp r1, #8
	blt _021FA838
	adds r0, r4, #0
	bl ov15_021FA0E4
_021FA838:
	adds r0, r4, #0
	bl ov15_021FDF88
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, _021FA938 @ =0x00000808
	adds r1, #0x64
	ldrb r1, [r1]
	adds r0, r4, r0
	movs r2, #7
	adds r1, r1, #1
	bl ov15_021FDAF4
	b _021FA92A
_021FA856:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	subs r1, #8
	adds r3, r2, #0
	adds r3, #0x64
	ldrb r5, [r3]
	movs r3, #0xc
	adds r0, r2, #4
	muls r3, r5, r3
	adds r3, r0, r3
	movs r0, #6
	ldrsh r0, [r3, r0]
	adds r0, r0, r1
	ldrb r1, [r3, #9]
	cmp r0, r1
	bge _021FA88A
	ldr r1, [r3]
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	adds r2, #0x66
	strh r0, [r2]
	ldr r0, _021FA930 @ =0x000005DC
	strb r6, [r7]
	bl FUN_0200604C
_021FA88A:
	adds r0, r4, #0
	bl ov15_021FA170
	b _021FA92A
_021FA892:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	ldrb r0, [r0, #0xd]
	cmp r0, #6
	bls _021FA92A
	ldr r0, _021FA930 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	adds r6, r0, #0
	b _021FA92A
_021FA8C4:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	ldrb r0, [r0, #0xd]
	cmp r0, #6
	bls _021FA92A
	ldr r0, _021FA930 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x1f
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x11
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	adds r6, r0, #0
	b _021FA92A
_021FA8F6:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	movs r3, #0
	adds r2, #0x66
	strh r3, [r2]
	ldr r1, [r4, r1]
	movs r2, #5
	adds r1, #0x68
	strh r2, [r1]
	ldr r1, [sp, #0x1c]
	bl ov15_021FD774
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #0x24
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	adds r6, r0, #0
_021FA92A:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FA930: .4byte 0x000005DC
_021FA934: .4byte 0x00000644
_021FA938: .4byte 0x00000808
	thumb_func_end ov15_021FA73C

	thumb_func_start ov15_021FA93C
ov15_021FA93C: @ 0x021FA93C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021FAA10 @ =0x00000619
	adds r4, r5, r0
	bl FUN_0202534C
	cmp r0, #0
	bne _021FA958
	ldrb r1, [r4, #7]
	movs r0, #0x70
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4, #7]
_021FA958:
	adds r0, r5, #0
	bl ov15_021FAC40
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021FA96E
	ldrb r0, [r4]
	cmp r6, r0
	beq _021FA97A
_021FA96E:
	ldrb r1, [r4, #7]
	movs r0, #0xf
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #7]
_021FA97A:
	adds r0, r5, #0
	bl ov15_021FAA18
	cmp r0, #0
	bne _021FA9FE
	ldrb r0, [r4, #7]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	cmp r0, #1
	bne _021FA9FE
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021FA9FE
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r1, [r4]
	adds r0, #0x64
	strb r1, [r0]
	lsls r0, r6, #0x18
	ldrb r1, [r4]
	lsrs r0, r0, #0x18
	cmp r1, r0
	bls _021FA9B4
	movs r0, #0
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	b _021FA9C6
_021FA9B4:
	cmp r1, r0
	bhs _021FA9C2
	movs r0, #1
	strb r0, [r4, #1]
	movs r0, #0
	strb r0, [r4, #2]
	b _021FA9C6
_021FA9C2:
	movs r0, #2
	strb r0, [r4, #1]
_021FA9C6:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	strb r0, [r4]
	ldrb r2, [r4, #7]
	movs r1, #0xf
	bics r2, r1
	strb r2, [r4, #7]
	ldrb r2, [r4, #7]
	movs r1, #0x70
	bics r2, r1
	strb r2, [r4, #7]
	movs r1, #0
	strb r1, [r4, #4]
	movs r1, #0x67
	lsls r1, r1, #4
	strb r0, [r5, r1]
	adds r0, r5, #0
	bl ov15_021FF950
	movs r1, #0x67
	lsls r1, r1, #4
	ldrb r1, [r5, r1]
	ldr r0, _021FAA14 @ =0x00000808
	movs r2, #7
	adds r0, r5, r0
	adds r1, r1, #1
	bl ov15_021FDAF4
_021FA9FE:
	adds r0, r5, #0
	bl ov15_021FAB34
	adds r0, r5, #0
	bl ov15_021FF964
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_021FAA10: .4byte 0x00000619
_021FAA14: .4byte 0x00000808
	thumb_func_end ov15_021FA93C

	thumb_func_start ov15_021FAA18
ov15_021FAA18: @ 0x021FAA18
	push {r3, r4, r5, lr}
	ldr r1, _021FAB28 @ =0x021D110C
	adds r5, r0, #0
	ldr r0, _021FAB2C @ =0x00000619
	ldr r2, [r1, #0x48]
	movs r1, #0x20
	adds r4, r5, r0
	tst r1, r2
	beq _021FAAA6
	subs r1, r0, #5
	ldrb r1, [r5, r1]
	cmp r1, #1
	bne _021FAA36
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FAA36:
	subs r0, #0x3d
	bl FUN_0200604C
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r1, [r4]
	adds r0, #0x64
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _021FAA5C
	subs r0, r0, #1
	strb r0, [r4]
	movs r0, #0x67
	lsls r0, r0, #4
	ldrb r1, [r5, r0]
	subs r1, r1, #1
	b _021FAA6A
_021FAA5C:
	ldr r0, _021FAB30 @ =0x00000614
	ldrb r1, [r5, r0]
	subs r1, r1, #1
	strb r1, [r4]
	ldrb r1, [r5, r0]
	adds r0, #0x5c
	subs r1, r1, #1
_021FAA6A:
	strb r1, [r5, r0]
	movs r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #1]
	ldrb r1, [r4, #7]
	movs r0, #0x70
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4, #7]
	ldrb r1, [r4, #7]
	movs r0, #0xf
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4, #7]
	ldrb r1, [r4, #7]
	movs r0, #0x80
	bics r1, r0
	strb r1, [r4, #7]
	ldrb r0, [r4, #4]
	cmp r0, #3
	beq _021FAA9C
	movs r0, #4
	strb r0, [r4, #4]
_021FAA9C:
	adds r0, r5, #0
	bl ov15_021FF950
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FAAA6:
	movs r1, #0x10
	tst r1, r2
	beq _021FAB24
	subs r1, r0, #5
	ldrb r1, [r5, r1]
	cmp r1, #1
	bne _021FAAB8
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FAAB8:
	subs r0, #0x3d
	bl FUN_0200604C
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r1, [r4]
	adds r0, #0x64
	strb r1, [r0]
	ldrb r0, [r4]
	ldr r1, _021FAB30 @ =0x00000614
	adds r2, r0, #1
	ldrb r0, [r5, r1]
	cmp r2, r0
	bge _021FAAE2
	adds r0, r1, #0
	strb r2, [r4]
	adds r0, #0x5c
	ldrb r0, [r5, r0]
	adds r0, r0, #1
	b _021FAAE6
_021FAAE2:
	movs r0, #0
	strb r0, [r4]
_021FAAE6:
	adds r1, #0x5c
	strb r0, [r5, r1]
	movs r0, #0
	strb r0, [r4, #2]
	movs r0, #1
	strb r0, [r4, #1]
	ldrb r2, [r4, #7]
	movs r1, #0x70
	bics r2, r1
	movs r1, #0x10
	orrs r1, r2
	strb r1, [r4, #7]
	ldrb r2, [r4, #7]
	movs r1, #0xf
	bics r2, r1
	orrs r0, r2
	strb r0, [r4, #7]
	ldrb r1, [r4, #7]
	movs r0, #0x80
	bics r1, r0
	strb r1, [r4, #7]
	ldrb r0, [r4, #4]
	cmp r0, #3
	beq _021FAB1A
	movs r0, #4
	strb r0, [r4, #4]
_021FAB1A:
	adds r0, r5, #0
	bl ov15_021FF950
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FAB24:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FAB28: .4byte 0x021D110C
_021FAB2C: .4byte 0x00000619
_021FAB30: .4byte 0x00000614
	thumb_func_end ov15_021FAA18

	thumb_func_start ov15_021FAB34
ov15_021FAB34: @ 0x021FAB34
	push {r3, r4, r5, lr}
	ldr r1, _021FAC28 @ =0x00000619
	adds r5, r0, #0
	adds r4, r5, r1
	ldrb r1, [r4, #2]
	cmp r1, #0
	beq _021FAB4C
	cmp r1, #1
	beq _021FAB58
	cmp r1, #2
	beq _021FAC20
	b _021FAC24
_021FAB4C:
	movs r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _021FAC24
_021FAB58:
	ldrb r1, [r4, #3]
	cmp r1, #8
	bhs _021FAB64
	adds r0, r1, #1
	strb r0, [r4, #3]
	b _021FAC24
_021FAB64:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	ldrb r2, [r4]
	adds r1, #0x64
	strb r2, [r1]
	bl ov15_021F9F08
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r2, #0x64
	ldrb r3, [r2]
	movs r2, #0xc
	muls r2, r3, r2
	adds r1, r1, r2
	movs r2, #0xa
	ldrsh r1, [r1, r2]
	subs r2, #0xb
	movs r3, #0
	bl ov15_021FF364
	adds r0, r5, #0
	bl ov15_021FA074
	movs r1, #0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r3, r1, #0
	bl ov15_021FD574
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, r5, #0
	adds r2, #0x64
	ldrb r2, [r2]
	movs r1, #1
	bl ov15_021FD404
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r3, #0
	adds r1, r3, #0
	adds r0, #0xa
	adds r1, #8
	adds r0, r0, r2
	adds r1, r1, r2
	adds r2, r3, r2
	ldrb r2, [r2, #0xd]
	bl ov15_021FA044
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r3, #0
	adds r1, r3, #0
	adds r0, #0xa
	adds r1, #8
	adds r0, r0, r2
	adds r1, r1, r2
	adds r2, r3, r2
	ldrb r2, [r2, #0xd]
	movs r3, #6
	bl ov15_021FA070
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FAC20:
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FAC24:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FAC28: .4byte 0x00000619
	thumb_func_end ov15_021FAB34

	thumb_func_start ov15_021FAC2C
ov15_021FAC2C: @ 0x021FAC2C
	ldr r0, _021FAC38 @ =0x02201314
	lsls r1, r1, #2
	ldr r3, _021FAC3C @ =FUN_02025224
	ldr r0, [r0, r1]
	bx r3
	nop
_021FAC38: .4byte 0x02201314
_021FAC3C: .4byte FUN_02025224
	thumb_func_end ov15_021FAC2C

	thumb_func_start ov15_021FAC40
ov15_021FAC40: @ 0x021FAC40
	movs r0, #0
	mvns r0, r0
	bx lr
	.align 2, 0
	thumb_func_end ov15_021FAC40

	thumb_func_start ov15_021FAC48
ov15_021FAC48: @ 0x021FAC48
	push {r3, r4, r5, lr}
	movs r1, #0x8d
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r3, r1, #4
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	muls r1, r2, r1
	adds r3, r3, r1
	ldr r1, _021FAD20 @ =0x00000671
	movs r2, #1
	strb r2, [r5, r1]
	movs r2, #6
	ldrsh r3, [r3, r2]
	adds r2, r1, #0
	subs r2, #0x2d
	ldr r2, [r5, r2]
	adds r1, r1, #1
	adds r2, r3, r2
	subs r2, #8
	strb r2, [r5, r1]
	bl ov15_021FED60
	adds r0, r5, #0
	bl ov15_021FB114
	adds r0, r5, #0
	bl ov15_02200294
	adds r0, r5, #0
	bl ov15_021FF560
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov15_021FF7AC
	adds r0, r5, #0
	bl ov15_021FED58
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r4, r2, r0
	adds r0, r5, #0
	bl ov15_021FA074
	ldr r3, _021FAD24 @ =0x00000644
	adds r2, r0, #0
	ldr r3, [r5, r3]
	adds r0, r5, #0
	movs r1, #1
	subs r3, #8
	bl ov15_021FD574
	ldr r2, _021FAD24 @ =0x00000644
	movs r1, #6
	ldr r2, [r5, r2]
	ldrsh r1, [r4, r1]
	adds r0, r5, #0
	subs r2, #8
	movs r3, #1
	bl ov15_021FF364
	movs r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov15_021FF6BC
	adds r0, r5, #0
	bl ov15_021FA074
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl ov15_02200140
	movs r2, #6
	ldrsh r3, [r4, r2]
	ldr r2, _021FAD24 @ =0x00000644
	adds r0, r5, #0
	ldr r2, [r5, r2]
	adds r1, r4, #0
	adds r2, r3, r2
	subs r2, #8
	bl ov15_022001C4
	ldr r1, _021FAD24 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FAD24 @ =0x00000644
	ldr r1, [r5, r0]
	adds r0, #0x28
	subs r1, #8
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FAD20: .4byte 0x00000671
_021FAD24: .4byte 0x00000644
	thumb_func_end ov15_021FAC48

	thumb_func_start ov15_021FAD28
ov15_021FAD28: @ 0x021FAD28
	ldr r1, _021FAD6C @ =0x021D110C
	movs r2, #0x40
	ldr r1, [r1, #0x48]
	tst r2, r1
	beq _021FAD3C
	lsls r1, r0, #2
	ldr r0, _021FAD70 @ =0x02200584
	ldrb r0, [r0, r1]
	subs r0, #8
	bx lr
_021FAD3C:
	movs r2, #0x80
	tst r2, r1
	beq _021FAD4C
	lsls r1, r0, #2
	ldr r0, _021FAD74 @ =0x02200585
	ldrb r0, [r0, r1]
	subs r0, #8
	bx lr
_021FAD4C:
	movs r2, #0x20
	tst r2, r1
	beq _021FAD5C
	lsls r1, r0, #2
	ldr r0, _021FAD78 @ =0x02200586
	ldrb r0, [r0, r1]
	subs r0, #8
	bx lr
_021FAD5C:
	movs r2, #0x10
	tst r1, r2
	beq _021FAD6A
	lsls r1, r0, #2
	ldr r0, _021FAD7C @ =0x02200587
	ldrb r0, [r0, r1]
	subs r0, #8
_021FAD6A:
	bx lr
	.align 2, 0
_021FAD6C: .4byte 0x021D110C
_021FAD70: .4byte 0x02200584
_021FAD74: .4byte 0x02200585
_021FAD78: .4byte 0x02200586
_021FAD7C: .4byte 0x02200587
	thumb_func_end ov15_021FAD28

	thumb_func_start ov15_021FAD80
ov15_021FAD80: @ 0x021FAD80
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov15_021FA074
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov15_021FA098
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl ov15_021FD574
	adds r0, r5, #0
	bl ov15_021FA098
	movs r1, #6
	adds r2, r0, #0
	ldrsh r1, [r4, r1]
	adds r0, r5, #0
	movs r3, #1
	bl ov15_021FF364
	ldr r2, _021FADE4 @ =0x00000672
	adds r0, r5, #0
	ldrb r2, [r5, r2]
	adds r1, r4, #0
	bl ov15_022001C4
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r5, r0]
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r3, r3, r2
	movs r2, #0xa
	ldrb r1, [r3, #0xd]
	ldrsh r2, [r3, r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov15_021FF6BC
	pop {r4, r5, r6, pc}
	nop
_021FADE4: .4byte 0x00000672
	thumb_func_end ov15_021FAD80

	thumb_func_start ov15_021FADE8
ov15_021FADE8: @ 0x021FADE8
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r1, #0
	adds r6, r0, #0
	mvns r4, r4
	cmp r5, #8
	bhi _021FAE3A
	adds r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021FAE02: @ jump table
	.2byte _021FAE14 - _021FAE02 - 2 @ case 0
	.2byte _021FAE14 - _021FAE02 - 2 @ case 1
	.2byte _021FAE14 - _021FAE02 - 2 @ case 2
	.2byte _021FAE14 - _021FAE02 - 2 @ case 3
	.2byte _021FAE14 - _021FAE02 - 2 @ case 4
	.2byte _021FAE14 - _021FAE02 - 2 @ case 5
	.2byte _021FAE30 - _021FAE02 - 2 @ case 6
	.2byte _021FAE34 - _021FAE02 - 2 @ case 7
	.2byte _021FAE38 - _021FAE02 - 2 @ case 8
_021FAE14:
	bl ov15_021FA074
	cmp r0, r5
	ble _021FAE28
	ldr r0, _021FAE40 @ =0x0000066C
	ldr r4, [r6, r0]
	subs r0, #0x90
	bl FUN_0200604C
	b _021FAE3A
_021FAE28:
	ldr r0, _021FAE44 @ =0x000005F3
	bl FUN_0200604C
	b _021FAE3A
_021FAE30:
	movs r4, #0xe
	b _021FAE3A
_021FAE34:
	movs r4, #0xf
	b _021FAE3A
_021FAE38:
	subs r4, r4, #1
_021FAE3A:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_021FAE40: .4byte 0x0000066C
_021FAE44: .4byte 0x000005F3
	thumb_func_end ov15_021FADE8

	thumb_func_start ov15_021FAE48
ov15_021FAE48: @ 0x021FAE48
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r4, #0
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	mvns r4, r4
	muls r0, r1, r0
	adds r7, r2, r0
	ldr r0, _021FAFE4 @ =0x0000066C
	ldr r0, [r5, r0]
	bl ov15_021FAD28
	lsls r0, r0, #0x10
	ldr r2, _021FAFE4 @ =0x0000066C
	lsrs r1, r0, #0x10
	ldr r0, [r5, r2]
	cmp r0, r1
	beq _021FAE9C
	ldr r0, _021FAFE8 @ =0x0000FFFA
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _021FAE8C
	adds r0, r5, #0
	bl ov15_021FADE8
	adds r4, r0, #0
	b _021FAE9C
_021FAE8C:
	str r1, [r5, r2]
	ldr r1, [r5, r2]
	adds r0, r5, #0
	bl ov15_021FFF34
	ldr r0, _021FAFEC @ =0x000005DC
	bl FUN_0200604C
_021FAE9C:
	adds r0, r5, #0
	movs r1, #2
	bl ov15_021FAC2C
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021FAF04
	cmp r6, #8
	bne _021FAEC6
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov15_021FADE8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov15_021FFF34
	b _021FAF24
_021FAEC6:
	subs r0, r6, #6
	cmp r0, #1
	bhi _021FAED8
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov15_021FADE8
	adds r4, r0, #0
	b _021FAF24
_021FAED8:
	ldr r0, _021FAFE4 @ =0x0000066C
	str r6, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	cmp r0, r6
	bls _021FAEF2
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov15_021FADE8
	adds r4, r0, #0
	b _021FAEF8
_021FAEF2:
	ldr r0, _021FAFF0 @ =0x000005F3
	bl FUN_0200604C
_021FAEF8:
	ldr r1, _021FAFE4 @ =0x0000066C
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFF34
	b _021FAF24
_021FAF04:
	ldr r0, _021FAFF4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021FAF1C
	ldr r1, _021FAFE4 @ =0x0000066C
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FADE8
	adds r4, r0, #0
	b _021FAF24
_021FAF1C:
	movs r0, #2
	tst r1, r0
	beq _021FAF24
	subs r4, r0, #4
_021FAF24:
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bhi _021FAF3E
	bhs _021FAF46
	cmp r4, #0xf
	bhi _021FAFAC
	cmp r4, #0xe
	blo _021FAFAC
	beq _021FAF70
	cmp r4, #0xf
	beq _021FAF8E
	b _021FAFAC
_021FAF3E:
	adds r0, r0, #1
	cmp r4, r0
	beq _021FAFE0
	b _021FAFAC
_021FAF46:
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	ldr r0, _021FAFF8 @ =0x00000672
	movs r1, #6
	ldrb r0, [r5, r0]
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	strh r1, [r7, #6]
	movs r0, #0x20
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x13
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	pop {r3, r4, r5, r6, r7, pc}
_021FAF70:
	ldrb r0, [r7, #9]
	cmp r0, #6
	bls _021FAFE0
	ldr r0, _021FAFEC @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x1f
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x11
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	pop {r3, r4, r5, r6, r7, pc}
_021FAF8E:
	ldrb r0, [r7, #9]
	cmp r0, #6
	bls _021FAFE0
	ldr r0, _021FAFEC @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x1e
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	pop {r3, r4, r5, r6, r7, pc}
_021FAFAC:
	ldr r0, _021FAFEC @ =0x000005DC
	bl FUN_0200604C
	ldr r1, _021FAFF8 @ =0x00000672
	movs r2, #6
	ldrb r0, [r5, r1]
	subs r1, r1, #6
	ldrsh r2, [r7, r2]
	ldr r1, [r5, r1]
	adds r1, r2, r1
	cmp r0, r1
	bne _021FAFD2
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0x29
	movs r3, #0x21
	bl ov15_021FD810
	pop {r3, r4, r5, r6, r7, pc}
_021FAFD2:
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0x2a
	movs r3, #0x21
	bl ov15_021FD810
	pop {r3, r4, r5, r6, r7, pc}
_021FAFE0:
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FAFE4: .4byte 0x0000066C
_021FAFE8: .4byte 0x0000FFFA
_021FAFEC: .4byte 0x000005DC
_021FAFF0: .4byte 0x000005F3
_021FAFF4: .4byte 0x021D110C
_021FAFF8: .4byte 0x00000672
	thumb_func_end ov15_021FAE48

	thumb_func_start ov15_021FAFFC
ov15_021FAFFC: @ 0x021FAFFC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x64
	ldrb r3, [r0]
	movs r0, #0xc
	adds r1, r1, #4
	muls r0, r3, r0
	adds r5, r1, r0
	movs r0, #6
	ldr r1, _021FB05C @ =0x0000066C
	ldrsh r6, [r5, r0]
	ldr r2, [r4, r1]
	adds r1, r1, #6
	adds r2, r6, r2
	lsls r2, r2, #0x10
	ldrb r1, [r4, r1]
	lsrs r2, r2, #0x10
	cmp r1, r2
	beq _021FB050
	str r0, [sp]
	ldr r0, [r5]
	bl FUN_02077B5C
	adds r0, r4, #0
	bl ov15_021F9F08
	ldr r1, _021FB05C @ =0x0000066C
	ldr r2, [r4, r1]
	adds r0, r1, #0
	adds r2, #8
	subs r0, #0x28
	str r2, [r4, r0]
	subs r1, #0x28
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl ov15_021FA0E4
_021FB050:
	adds r0, r4, #0
	bl ov15_021FB060
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021FB05C: .4byte 0x0000066C
	thumb_func_end ov15_021FAFFC

	thumb_func_start ov15_021FB060
ov15_021FB060: @ 0x021FB060
	push {r3, r4, r5, lr}
	movs r1, #0xd2
	adds r5, r0, #0
	movs r3, #0
	lsls r1, r1, #2
	str r3, [r5, r1]
	ldr r1, _021FB10C @ =0x00000671
	strb r3, [r5, r1]
	adds r2, r1, #1
	strb r3, [r5, r2]
	adds r1, r1, #3
	str r3, [r5, r1]
	bl ov15_021FB114
	adds r0, r5, #0
	bl ov15_021F9F08
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r4, r2, r0
	adds r0, r5, #0
	bl ov15_021FA074
	movs r1, #0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r3, r1, #0
	bl ov15_021FD574
	movs r2, #6
	ldrsh r1, [r4, r2]
	adds r0, r5, #0
	subs r2, r2, #7
	movs r3, #0
	bl ov15_021FF364
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, r5, #0
	adds r2, #0x64
	ldrb r2, [r2]
	movs r1, #1
	bl ov15_021FD404
	movs r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov15_021FF6BC
	adds r0, r5, #0
	bl ov15_021FA074
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #1
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FED24
	ldr r1, _021FB110 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021FB10C: .4byte 0x00000671
_021FB110: .4byte 0x00000644
	thumb_func_end ov15_021FB060

	thumb_func_start ov15_021FB114
ov15_021FB114: @ 0x021FB114
	push {r4, lr}
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	adds r4, r2, #4
	adds r2, #0x64
	ldrb r3, [r2]
	movs r2, #0xc
	muls r2, r3, r2
	adds r3, r4, r2
	ldr r2, _021FB148 @ =0x00000671
	ldrb r2, [r0, r2]
	cmp r2, #0
	beq _021FB146
	ldrh r2, [r3, #4]
	adds r1, #0x1c
	ldr r0, [r0, r1]
	subs r2, r2, #1
	lsls r2, r2, #4
	adds r2, #0x10
	lsls r2, r2, #0x10
	movs r1, #0xb1
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
_021FB146:
	pop {r4, pc}
	.align 2, 0
_021FB148: .4byte 0x00000671
	thumb_func_end ov15_021FB114

	thumb_func_start ov15_021FB14C
ov15_021FB14C: @ 0x021FB14C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _021FB370 @ =_022004EC
	adds r4, r0, #0
	ldrb r2, [r1]
	add r0, sp, #0
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	strb r2, [r0, #2]
	ldrb r2, [r1, #3]
	ldrb r1, [r1, #4]
	strb r2, [r0, #3]
	strb r1, [r0, #4]
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	adds r0, #0x66
	ldrh r0, [r0]
	movs r2, #6
	bl FUN_02077CE8
	adds r7, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r3, r4, #0
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	ldrb r5, [r0, #0xc]
	movs r2, #0
	movs r0, #0x7f
	adds r1, r2, #0
	lsls r0, r0, #4
_021FB19C:
	adds r2, r2, #1
	str r1, [r3, r0]
	adds r3, r3, #4
	cmp r2, #5
	blt _021FB19C
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	beq _021FB1B8
	b _021FB2F8
_021FB1B8:
	adds r0, r1, #0
	adds r0, #0x76
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x11
	ldr r0, _021FB374 @ =0x0000FFFE
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _021FB1E8
	adds r0, r1, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r0, #0xc
	muls r0, r2, r0
	adds r0, r1, r0
	ldrb r0, [r0, #0xc]
	cmp r0, #5
	bne _021FB280
	movs r1, #2
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB1E8:
	adds r0, r7, #0
	movs r1, #6
	bl FUN_02077DAC
	cmp r0, #0
	beq _021FB280
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r1, [r4, r2]
	subs r2, #0x72
	adds r0, r1, #0
	adds r0, #0x66
	ldrh r0, [r0]
	cmp r0, r2
	bne _021FB21C
	adds r2, r1, #0
	adds r2, #0x76
	ldrh r2, [r2]
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1f
	cmp r2, #1
	bne _021FB21C
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB21C:
	adds r2, r1, #0
	adds r2, #0x64
	ldrb r3, [r2]
	movs r2, #0xc
	muls r2, r3, r2
	adds r2, r1, r2
	ldrb r3, [r2, #0xc]
	cmp r3, #5
	bne _021FB236
	movs r1, #2
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB236:
	ldr r2, _021FB378 @ =0x000001C1
	cmp r0, r2
	bne _021FB244
	movs r1, #4
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB244:
	cmp r3, #4
	bne _021FB25A
	ldr r0, [r1, #0x70]
	bl FUN_02064F24
	cmp r0, #1
	bne _021FB25A
	movs r1, #3
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB25A:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #0x3e
	adds r1, #0x66
	ldrh r1, [r1]
	cmp r1, r0
	bne _021FB27A
	bl FUN_02005C18
	cmp r0, #1
	bne _021FB27A
	movs r1, #0xf
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB27A:
	movs r1, #0
	add r0, sp, #0
	strb r1, [r0]
_021FB280:
	adds r0, r7, #0
	movs r1, #3
	bl FUN_02077DAC
	cmp r0, #0
	bne _021FB2AE
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, #0x66
	ldrh r0, [r0]
	bl FUN_02078168
	cmp r0, #1
	bne _021FB2A4
	movs r1, #8
	add r0, sp, #0
	strb r1, [r0, #2]
_021FB2A4:
	cmp r5, #3
	beq _021FB2AE
	movs r1, #5
	add r0, sp, #0
	strb r1, [r0, #1]
_021FB2AE:
	adds r0, r7, #0
	movs r1, #4
	bl FUN_02077DAC
	cmp r0, #0
	beq _021FB310
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020781C4
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	adds r2, #0x66
	ldrh r2, [r2]
	cmp r2, r0
	beq _021FB2E8
	adds r0, r1, #4
	ldr r0, [r4, r0]
	bl FUN_020781D0
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r1, #0x66
	ldrh r1, [r1]
	cmp r1, r0
	bne _021FB2F0
_021FB2E8:
	movs r1, #7
	add r0, sp, #0
	strb r1, [r0, #1]
	b _021FB310
_021FB2F0:
	movs r1, #6
	add r0, sp, #0
	strb r1, [r0, #1]
	b _021FB310
_021FB2F8:
	cmp r0, #6
	bne _021FB310
	adds r1, #0x66
	ldrh r1, [r1]
	adds r0, r5, #0
	bl ov15_021FD3F0
	cmp r0, #1
	bne _021FB310
	movs r1, #0xe
	add r0, sp, #0
	strb r1, [r0]
_021FB310:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #6
	beq _021FB32C
	cmp r5, #3
	beq _021FB32C
	cmp r5, #4
	beq _021FB32C
	movs r1, #0xc
	add r0, sp, #0
	strb r1, [r0, #3]
_021FB32C:
	movs r3, #0x7f
	movs r1, #0xb
	add r0, sp, #0
	strb r1, [r0, #4]
	ldr r6, _021FB37C @ =0x02201368
	movs r2, #0
	add r0, sp, #0
	adds r1, r4, #0
	lsls r3, r3, #4
_021FB33E:
	ldrb r5, [r0]
	cmp r5, #0xff
	beq _021FB34A
	lsls r5, r5, #2
	ldr r5, [r6, r5]
	str r5, [r1, r3]
_021FB34A:
	adds r2, r2, #1
	adds r0, r0, #1
	adds r1, r1, #4
	cmp r2, #5
	blt _021FB33E
	adds r0, r4, #0
	add r1, sp, #0
	movs r2, #5
	bl ov15_021FEB84
	adds r0, r4, #0
	add r1, sp, #0
	bl ov15_021FB380
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FB370: .4byte _022004EC
_021FB374: .4byte 0x0000FFFE
_021FB378: .4byte 0x000001C1
_021FB37C: .4byte 0x02201368
	thumb_func_end ov15_021FB14C

	thumb_func_start ov15_021FB380
ov15_021FB380: @ 0x021FB380
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _021FB3E8 @ =0x0000066C
	adds r5, r0, #0
	movs r2, #0
	str r2, [r5, r1]
	ldr r2, [r5, r1]
	ldr r1, _021FB3EC @ =0x02201468
	ldrb r1, [r1, r2]
	bl ov15_021FFECC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_0220023C
	movs r0, #0x61
	movs r1, #3
	lsls r0, r0, #2
	lsls r1, r1, #8
	ldrb r2, [r4]
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov15_021FF758
	movs r0, #0x65
	movs r1, #3
	lsls r0, r0, #2
	lsls r1, r1, #8
	ldrb r2, [r4, #1]
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov15_021FF758
	movs r0, #0x69
	movs r1, #3
	lsls r0, r0, #2
	lsls r1, r1, #8
	ldrb r2, [r4, #2]
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov15_021FF758
	movs r0, #0x6d
	movs r1, #3
	lsls r0, r0, #2
	lsls r1, r1, #8
	ldrb r2, [r4, #3]
	adds r0, r5, r0
	adds r1, r5, r1
	bl ov15_021FF758
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FB3E8: .4byte 0x0000066C
_021FB3EC: .4byte 0x02201468
	thumb_func_end ov15_021FB380

	thumb_func_start ov15_021FB3F0
ov15_021FB3F0: @ 0x021FB3F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _021FB4F8 @ =0x0000066C
	movs r2, #0x40
	ldr r1, [r5, r0]
	ldr r0, _021FB4FC @ =0x021D110C
	adds r4, r1, #0
	ldr r0, [r0, #0x48]
	tst r2, r0
	beq _021FB40C
	ldr r0, _021FB500 @ =0x02200528
	lsls r2, r1, #2
	ldrb r4, [r0, r2]
	b _021FB434
_021FB40C:
	movs r2, #0x80
	tst r2, r0
	beq _021FB41A
	ldr r0, _021FB504 @ =0x02200529
	lsls r2, r1, #2
	ldrb r4, [r0, r2]
	b _021FB434
_021FB41A:
	movs r2, #0x20
	tst r2, r0
	beq _021FB428
	ldr r0, _021FB508 @ =0x0220052A
	lsls r2, r1, #2
	ldrb r4, [r0, r2]
	b _021FB434
_021FB428:
	movs r2, #0x10
	tst r0, r2
	beq _021FB434
	ldr r0, _021FB50C @ =0x0220052B
	lsls r2, r1, #2
	ldrb r4, [r0, r2]
_021FB434:
	cmp r4, r1
	beq _021FB452
	ldr r0, _021FB4F8 @ =0x0000066C
	ldr r1, _021FB510 @ =0x02201468
	str r4, [r5, r0]
	ldrb r1, [r1, r4]
	adds r0, r5, #0
	bl ov15_021FFECC
	ldr r0, _021FB514 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021FB452:
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FAC2C
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _021FB4A4
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FD774
	ldr r0, _021FB4F8 @ =0x0000066C
	ldr r1, _021FB510 @ =0x02201468
	str r6, [r5, r0]
	ldrb r1, [r1, r6]
	adds r0, r5, #0
	bl ov15_021FFECC
	cmp r6, #4
	bne _021FB48C
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021FB48C:
	lsls r0, r6, #2
	adds r1, r5, r0
	movs r0, #0x7f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021FB4F2
	ldr r0, _021FB514 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_021FB4A4:
	ldr r0, _021FB4FC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021FB4DE
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0x7f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021FB4CE
	ldr r0, _021FB514 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FD774
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021FB4CE:
	cmp r4, #4
	bne _021FB4F2
	ldr r0, _021FB514 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021FB4DE:
	movs r0, #2
	tst r0, r1
	beq _021FB4F2
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021FB4F2:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021FB4F8: .4byte 0x0000066C
_021FB4FC: .4byte 0x021D110C
_021FB500: .4byte 0x02200528
_021FB504: .4byte 0x02200529
_021FB508: .4byte 0x0220052A
_021FB50C: .4byte 0x0220052B
_021FB510: .4byte 0x02201468
_021FB514: .4byte 0x000005DC
	thumb_func_end ov15_021FB3F0

	thumb_func_start ov15_021FB518
ov15_021FB518: @ 0x021FB518
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov15_021F9F08
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r4, r2, r0
	adds r0, r5, #0
	bl ov15_021FA074
	movs r1, #0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r3, r1, #0
	bl ov15_021FD574
	movs r2, #6
	ldrsh r1, [r4, r2]
	adds r0, r5, #0
	subs r2, r2, #7
	movs r3, #0
	bl ov15_021FF364
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r2, [r5, r2]
	adds r0, r5, #0
	adds r2, #0x64
	ldrb r2, [r2]
	movs r1, #1
	bl ov15_021FD404
	movs r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	adds r0, r5, #0
	movs r3, #0
	bl ov15_021FF6BC
	adds r0, r5, #0
	bl ov15_021FA074
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl ov15_02200140
	ldr r1, _021FB5A8 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021F9C78
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FB5A8: .4byte 0x00000644
	thumb_func_end ov15_021FB518

	thumb_func_start ov15_021FB5AC
ov15_021FB5AC: @ 0x021FB5AC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov15_021FB3F0
	adds r1, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r1, r0
	beq _021FB5C8
	adds r0, r0, #1
	cmp r1, r0
	beq _021FB5F8
	b _021FB5DC
_021FB5C8:
	movs r0, #0x1c
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, pc}
_021FB5DC:
	ldr r0, _021FB600 @ =0x00000948
	movs r2, #9
	str r1, [r4, r0]
	adds r1, #0x1c
	movs r0, #0x1d
	lsls r1, r1, #0x18
	str r0, [sp]
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	movs r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, pc}
_021FB5F8:
	movs r0, #4
	add sp, #4
	pop {r3, r4, pc}
	nop
_021FB600: .4byte 0x00000948
	thumb_func_end ov15_021FB5AC

	thumb_func_start ov15_021FB604
ov15_021FB604: @ 0x021FB604
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov15_02200294
	adds r0, r5, #0
	bl ov15_021FF560
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov15_021FF7AC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	bl ov15_021FB518
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FB604

	thumb_func_start ov15_021FB654
ov15_021FB654: @ 0x021FB654
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_02200294
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov15_021FF7AC
	ldr r1, _021FB67C @ =0x00000948
	adds r0, r4, #0
	ldr r1, [r4, r1]
	lsls r1, r1, #2
	adds r2, r4, r1
	movs r1, #0x7f
	lsls r1, r1, #4
	ldr r1, [r2, r1]
	blx r1
	pop {r4, pc}
	nop
_021FB67C: .4byte 0x00000948
	thumb_func_end ov15_021FB654

	thumb_func_start ov15_021FB680
ov15_021FB680: @ 0x021FB680
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0
	bl ov15_021FD788
	adds r0, r4, #0
	bl ov15_021FFF24
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #6
	adds r0, #0x66
	ldrh r0, [r0]
	adds r2, r1, #0
	bl FUN_02077D88
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r0, #2
	lsrs r1, r1, #0x10
	bl FUN_02064980
	adds r1, r0, #0
	beq _021FB6EE
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x70]
	blx r1
	adds r3, r0, #0
	beq _021FB6EE
	movs r2, #0x8f
	movs r0, #6
	lsls r2, r2, #2
	str r0, [sp]
	ldr r0, [r4, r2]
	subs r2, #8
	ldr r2, [r4, r2]
	ldr r1, _021FB6F8 @ =0x000005E4
	adds r2, #0x66
	ldrh r2, [r2]
	ldr r1, [r4, r1]
	bl FUN_02077AA4
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB6FC @ =0x00000616
	add sp, #4
	strb r0, [r4, r1]
	movs r0, #0xc
	pop {r3, r4, pc}
_021FB6EE:
	adds r0, r4, #0
	bl ov15_021FB784
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021FB6F8: .4byte 0x000005E4
_021FB6FC: .4byte 0x00000616
	thumb_func_end ov15_021FB680

	thumb_func_start ov15_021FB700
ov15_021FB700: @ 0x021FB700
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FB778 @ =0x00000616
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FB772
	ldr r0, _021FB77C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _021FB722
	ldr r0, _021FB780 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FB772
_021FB722:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #3
	beq _021FB736
	adds r0, r4, #0
	bl ov15_021FED3C
_021FB736:
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r4, #4
	bl FUN_0201D5C8
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021FD788
	adds r0, r4, #0
	bl ov15_021FB518
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #3
	bne _021FB76E
	movs r0, #0x1a
	pop {r4, pc}
_021FB76E:
	movs r0, #1
	pop {r4, pc}
_021FB772:
	movs r0, #0xc
	pop {r4, pc}
	nop
_021FB778: .4byte 0x00000616
_021FB77C: .4byte 0x021D110C
_021FB780: .4byte 0x021D114C
	thumb_func_end ov15_021FB700

	thumb_func_start ov15_021FB784
ov15_021FB784: @ 0x021FB784
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r3, r1, #4
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	muls r1, r2, r1
	adds r3, r3, r1
	ldr r1, _021FB80C @ =0x0000067B
	movs r2, #0
	strb r2, [r4, r1]
	ldrb r2, [r3, #8]
	cmp r2, #3
	bne _021FB7B0
	ldr r2, _021FB810 @ =ov15_021FB830
	adds r0, r1, #1
	str r2, [r4, r0]
	movs r0, #0xd
	pop {r4, pc}
_021FB7B0:
	ldr r2, [r4, r0]
	subs r1, #0x97
	ldr r0, [r2]
	adds r2, #0x66
	ldrh r2, [r2]
	ldr r1, [r4, r1]
	movs r3, #6
	bl FUN_02077980
	cmp r0, #1
	bne _021FB7D6
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB814 @ =0x00000616
	strb r0, [r4, r1]
	movs r0, #0xc
	pop {r4, pc}
_021FB7D6:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	adds r1, #0x66
	ldrh r1, [r1]
	bl ov15_021FB9D8
	cmp r0, #1
	bne _021FB7F4
	ldr r1, _021FB818 @ =ov15_021FBBB0
	ldr r0, _021FB81C @ =0x0000067C
	str r1, [r4, r0]
	movs r0, #0xd
	pop {r4, pc}
_021FB7F4:
	movs r0, #1
	movs r1, #6
	bl FUN_020880CC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0x25
	pop {r4, pc}
	.align 2, 0
_021FB80C: .4byte 0x0000067B
_021FB810: .4byte ov15_021FB830
_021FB814: .4byte 0x00000616
_021FB818: .4byte ov15_021FBBB0
_021FB81C: .4byte 0x0000067C
	thumb_func_end ov15_021FB784

	thumb_func_start ov15_021FB820
ov15_021FB820: @ 0x021FB820
	push {r3, lr}
	ldr r1, _021FB82C @ =0x0000067C
	ldr r1, [r0, r1]
	blx r1
	pop {r3, pc}
	nop
_021FB82C: .4byte 0x0000067C
	thumb_func_end ov15_021FB820

	thumb_func_start ov15_021FB830
ov15_021FB830: @ 0x021FB830
	push {r3, r4, r5, lr}
	ldr r1, _021FB9C0 @ =0x0000067B
	adds r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #3
	bhi _021FB936
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021FB848: @ jump table
	.2byte _021FB850 - _021FB848 - 2 @ case 0
	.2byte _021FB8AC - _021FB848 - 2 @ case 1
	.2byte _021FB90C - _021FB848 - 2 @ case 2
	.2byte _021FB926 - _021FB848 - 2 @ case 3
_021FB850:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r0, #0x66
	ldrh r0, [r0]
	bl FUN_02078000
	adds r5, r0, #0
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	adds r2, r5, #0
	bl FUN_0200BFF0
	adds r0, r5, #0
	bl FUN_02078024
	cmp r0, #1
	ldr r2, _021FB9C4 @ =0x000005E4
	bne _021FB88A
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	movs r1, #0x3c
	bl FUN_0200BB6C
	b _021FB898
_021FB88A:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	movs r1, #0x3b
	bl FUN_0200BB6C
_021FB898:
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB9C8 @ =0x00000616
	strb r0, [r4, r1]
	movs r0, #1
	adds r1, #0x65
	strb r0, [r4, r1]
	b _021FB9BA
_021FB8AC:
	subs r1, #0x65
	ldrb r0, [r4, r1]
	bl FUN_02020094
	cmp r0, #0
	bne _021FB936
	ldr r0, _021FB9CC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _021FB8CA
	ldr r0, _021FB9D0 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FB9BA
_021FB8CA:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x3d
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0xbd
	ldr r1, _021FB9C4 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB9C8 @ =0x00000616
	strb r0, [r4, r1]
	movs r0, #2
	adds r1, #0x65
	strb r0, [r4, r1]
	b _021FB9BA
_021FB90C:
	subs r1, #0x65
	ldrb r0, [r4, r1]
	bl FUN_02020094
	cmp r0, #0
	bne _021FB9BA
	adds r0, r4, #0
	bl ov15_021FF004
	ldr r0, _021FB9C0 @ =0x0000067B
	movs r1, #3
	strb r1, [r4, r0]
	b _021FB9BA
_021FB926:
	ldr r0, _021FB9D4 @ =0x00000804
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021FB938
	cmp r0, #2
	beq _021FB956
_021FB936:
	b _021FB9BA
_021FB938:
	adds r0, r4, #0
	bl ov15_021FF058
	movs r0, #1
	movs r1, #6
	bl FUN_020880CC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0x25
	pop {r3, r4, r5, pc}
_021FB956:
	adds r0, r4, #0
	bl ov15_021FF058
	adds r0, r4, #0
	bl ov15_021FED3C
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r4, #4
	bl FUN_0201D5C8
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r5, [r4, r0]
	adds r0, r4, #0
	bl ov15_021FA074
	adds r1, r5, #4
	adds r5, #0x64
	adds r2, r0, #0
	ldrb r5, [r5]
	movs r3, #0xc
	adds r0, r4, #0
	muls r3, r5, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r4, #0
	bl ov15_021FE868
	adds r0, r4, #0
	bl ov15_02200294
	adds r0, r4, #0
	bl ov15_021FB518
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021FD788
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FB9BA:
	movs r0, #0xd
	pop {r3, r4, r5, pc}
	nop
_021FB9C0: .4byte 0x0000067B
_021FB9C4: .4byte 0x000005E4
_021FB9C8: .4byte 0x00000616
_021FB9CC: .4byte 0x021D110C
_021FB9D0: .4byte 0x021D114C
_021FB9D4: .4byte 0x00000804
	thumb_func_end ov15_021FB830

	thumb_func_start ov15_021FB9D8
ov15_021FB9D8: @ 0x021FB9D8
	push {r3, r4, r5, lr}
	movs r2, #0xbd
	adds r4, r0, #0
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	subs r2, #0xb8
	adds r5, r1, #0
	ldr r2, [r4, r2]
	movs r1, #0
	bl FUN_0200BE48
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	adds r2, r5, #0
	bl FUN_0200C0CC
	cmp r5, #0x44
	bne _021FBA20
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x41
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021F994C
	movs r0, #0x1a
	movs r1, #0
	lsls r0, r0, #6
	strh r1, [r4, r0]
	b _021FBA7A
_021FBA20:
	cmp r5, #0x45
	bne _021FBA44
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x40
	bl FUN_0200BBA0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl ov15_021F994C
	movs r0, #0x1a
	movs r1, #0
	lsls r0, r0, #6
	strh r1, [r4, r0]
	b _021FBA7A
_021FBA44:
	cmp r5, #0x4d
	beq _021FBA50
	cmp r5, #0x4c
	beq _021FBA50
	cmp r5, #0x4f
	bne _021FBA5C
_021FBA50:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov15_021FBA9C
	adds r5, r0, #0
	b _021FBA7A
_021FBA5C:
	ldr r0, _021FBA94 @ =0x000001F6
	cmp r5, r0
	bne _021FBA76
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov15_021FBAF8
	adds r5, r0, #0
	movs r0, #0x1a
	movs r1, #0
	lsls r0, r0, #6
	strh r1, [r4, r0]
	b _021FBA7A
_021FBA76:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021FBA7A:
	movs r0, #0xbd
	ldr r1, _021FBA98 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FBA94: .4byte 0x000001F6
_021FBA98: .4byte 0x000005E4
	thumb_func_end ov15_021FB9D8

	thumb_func_start ov15_021FBA9C
ov15_021FBA9C: @ 0x021FBA9C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov15_021F992C
	bl FUN_0202DB08
	cmp r0, #0
	bne _021FBAC4
	movs r0, #0x1a
	movs r1, #0
	lsls r0, r0, #6
	strh r1, [r4, r0]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x3f
	bl FUN_0200BBA0
	pop {r3, r4, r5, pc}
_021FBAC4:
	adds r0, r5, #0
	movs r1, #2
	movs r2, #6
	bl FUN_02077D88
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl ov15_021F993C
	movs r0, #0x1a
	movs r1, #1
	lsls r0, r0, #6
	strh r1, [r4, r0]
	subs r0, #0x81
	bl FUN_0200604C
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x3e
	bl FUN_0200BBA0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov15_021FBA9C

	thumb_func_start ov15_021FBAF8
ov15_021FBAF8: @ 0x021FBAF8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02005C18
	cmp r0, #1
	bne _021FBB16
	bl FUN_02005C24
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x69
	bl FUN_0200BBA0
	pop {r4, pc}
_021FBB16:
	bl FUN_02005C24
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x68
	bl FUN_0200BBA0
	pop {r4, pc}
	thumb_func_end ov15_021FBAF8

	thumb_func_start ov15_021FBB28
ov15_021FBB28: @ 0x021FBB28
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r3, r1, #0
	muls r3, r0, r3
	adds r1, r2, r3
	movs r0, #6
	movs r3, #0x1a
	str r0, [sp]
	adds r2, #0x66
	lsls r3, r3, #6
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	ldrh r3, [r4, r3]
	bl FUN_02078480
	adds r0, r4, #0
	bl ov15_021F9F08
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	adds r0, r3, #0
	adds r1, r3, #0
	adds r0, #0xa
	adds r1, #8
	adds r0, r0, r2
	adds r1, r1, r2
	adds r2, r3, r2
	ldrb r2, [r2, #0xd]
	bl ov15_021FA044
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r3, r1, #0
	muls r3, r0, r3
	adds r0, r2, #0
	adds r1, r2, #0
	adds r2, r2, r3
	adds r0, #0xa
	adds r1, #8
	ldrb r2, [r2, #0xd]
	adds r0, r0, r3
	adds r1, r1, r3
	movs r3, #6
	bl ov15_021FA070
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov15_021FBB28

	thumb_func_start ov15_021FBBB0
ov15_021FBBB0: @ 0x021FBBB0
	push {r3, r4, r5, lr}
	ldr r1, _021FBC5C @ =0x0000067B
	adds r5, r0, #0
	ldrb r2, [r5, r1]
	cmp r2, #0
	beq _021FBBC2
	cmp r2, #1
	beq _021FBBD4
	b _021FBC56
_021FBBC2:
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FBC60 @ =0x00000616
	strb r0, [r5, r1]
	movs r0, #1
	adds r1, #0x65
	strb r0, [r5, r1]
	b _021FBC56
_021FBBD4:
	subs r1, #0x65
	ldrb r0, [r5, r1]
	bl FUN_02020094
	cmp r0, #0
	bne _021FBC56
	ldr r0, _021FBC64 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _021FBBF2
	ldr r0, _021FBC68 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FBC56
_021FBBF2:
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r5, #0
	bl ov15_021FBB28
	adds r0, r5, #0
	bl ov15_021FB518
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #1
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FA170
	adds r0, r5, #4
	bl FUN_0201D5C8
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FD788
	ldr r0, _021FBC5C @ =0x0000067B
	movs r1, #0
	strb r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FBC56:
	movs r0, #0xd
	pop {r3, r4, r5, pc}
	nop
_021FBC5C: .4byte 0x0000067B
_021FBC60: .4byte 0x00000616
_021FBC64: .4byte 0x021D110C
_021FBC68: .4byte 0x021D114C
	thumb_func_end ov15_021FBBB0

	thumb_func_start ov15_021FBC6C
ov15_021FBC6C: @ 0x021FBC6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FED3C
	movs r0, #1
	movs r1, #6
	bl FUN_020880CC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0x25
	pop {r4, pc}
	thumb_func_end ov15_021FBC6C

	thumb_func_start ov15_021FBC8C
ov15_021FBC8C: @ 0x021FBC8C
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FED3C
	movs r0, #1
	movs r1, #6
	bl FUN_020880CC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0x25
	pop {r4, pc}
	thumb_func_end ov15_021FBC8C

	thumb_func_start ov15_021FBCAC
ov15_021FBCAC: @ 0x021FBCAC
	push {r4, lr}
	movs r1, #0x1a
	adds r4, r0, #0
	movs r2, #1
	lsls r1, r1, #6
	strh r2, [r4, r1]
	bl ov15_021FFF24
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	movs r3, #6
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r2, r0
	adds r2, #0x66
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	bl FUN_02078568
	cmp r0, #1
	bne _021FBCF2
	adds r0, r4, #0
	bl ov15_021FEEA4
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FD788
	movs r0, #8
	pop {r4, pc}
_021FBCF2:
	movs r2, #0
	adds r0, r4, #0
	movs r1, #3
	adds r3, r2, #0
	bl ov15_021FD574
	ldr r2, _021FBD24 @ =0x00000682
	adds r0, r4, #0
	ldrh r2, [r4, r2]
	movs r1, #3
	bl ov15_02200300
	adds r0, r4, #0
	movs r1, #3
	bl ov15_021FEDEC
	adds r0, r4, #0
	bl ov15_021FF7C4
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021FF29C
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
_021FBD24: .4byte 0x00000682
	thumb_func_end ov15_021FBCAC

	thumb_func_start ov15_021FBD28
ov15_021FBD28: @ 0x021FBD28
	cmp r2, #0
	ble _021FBD3E
	cmp r0, r1
	bne _021FBD34
	movs r0, #1
	bx lr
_021FBD34:
	adds r0, r0, r2
	cmp r0, r1
	ble _021FBD4E
	adds r0, r1, #0
	bx lr
_021FBD3E:
	cmp r0, #1
	bne _021FBD46
	adds r0, r1, #0
	bx lr
_021FBD46:
	adds r0, r0, r2
	cmp r0, #0
	bgt _021FBD4E
	movs r0, #1
_021FBD4E:
	bx lr
	thumb_func_end ov15_021FBD28

	thumb_func_start ov15_021FBD50
ov15_021FBD50: @ 0x021FBD50
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	movs r1, #3
	adds r4, r0, #0
	bl ov15_021FAC2C
	adds r5, r0, #0
	subs r0, r6, #1
	cmp r5, r0
	bne _021FBD68
	b _021FBEF6
_021FBD68:
	ldr r0, _021FBF88 @ =0x00000682
	ldrh r0, [r4, r0]
	bl ov15_022002EC
	cmp r0, #1
	beq _021FBD7A
	cmp r0, #2
	beq _021FBD88
	b _021FBD9A
_021FBD7A:
	cmp r5, #0
	beq _021FBD82
	cmp r5, #3
	bne _021FBD9A
_021FBD82:
	movs r5, #0
	mvns r5, r5
	b _021FBD9A
_021FBD88:
	cmp r5, #0
	beq _021FBD96
	cmp r5, #1
	beq _021FBD96
	subs r0, r5, #3
	cmp r0, #1
	bhi _021FBD9A
_021FBD96:
	movs r5, #0
	mvns r5, r5
_021FBD9A:
	cmp r5, #7
	bls _021FBDA0
	b _021FBF1E
_021FBDA0:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021FBDAC: @ jump table
	.2byte _021FBDBC - _021FBDAC - 2 @ case 0
	.2byte _021FBDEE - _021FBDAC - 2 @ case 1
	.2byte _021FBE20 - _021FBDAC - 2 @ case 2
	.2byte _021FBE52 - _021FBDAC - 2 @ case 3
	.2byte _021FBE86 - _021FBDAC - 2 @ case 4
	.2byte _021FBEBA - _021FBDAC - 2 @ case 5
	.2byte _021FBEEE - _021FBDAC - 2 @ case 6
	.2byte _021FBEF2 - _021FBDAC - 2 @ case 7
_021FBDBC:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	movs r2, #0x64
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x1a
	bl FUN_0200DC4C
	movs r6, #1
	b _021FBF1E
_021FBDEE:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	movs r2, #0xa
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x1a
	bl FUN_0200DC4C
	movs r6, #1
	b _021FBF1E
_021FBE20:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	movs r2, #1
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0xb6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xb6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x1a
	bl FUN_0200DC4C
	movs r6, #1
	b _021FBF1E
_021FBE52:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	movs r2, #0x63
	ldrh r1, [r4, r1]
	mvns r2, r2
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x1c
	bl FUN_0200DC4C
	movs r6, #2
	b _021FBF1E
_021FBE86:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	movs r2, #9
	ldrh r1, [r4, r1]
	mvns r2, r2
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0x2e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0x2e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x1c
	bl FUN_0200DC4C
	movs r6, #2
	b _021FBF1E
_021FBEBA:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	movs r2, #0
	ldrh r1, [r4, r1]
	mvns r2, r2
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0xb9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xb9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x1c
	bl FUN_0200DC4C
	movs r6, #2
	b _021FBF1E
_021FBEEE:
	movs r6, #3
	b _021FBF1E
_021FBEF2:
	movs r6, #4
	b _021FBF1E
_021FBEF6:
	movs r1, #0x1a
	lsls r1, r1, #6
	adds r0, r4, r1
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	bl FUN_020881C0
	adds r6, r0, #0
	bne _021FBF1E
	ldr r0, _021FBF8C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021FBF16
	movs r6, #3
	b _021FBF1E
_021FBF16:
	movs r0, #2
	tst r0, r1
	beq _021FBF1E
	movs r6, #4
_021FBF1E:
	cmp r6, #4
	bhi _021FBF82
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021FBF2E: @ jump table
	.2byte _021FBF82 - _021FBF2E - 2 @ case 0
	.2byte _021FBF38 - _021FBF2E - 2 @ case 1
	.2byte _021FBF38 - _021FBF2E - 2 @ case 2
	.2byte _021FBF4C - _021FBF2E - 2 @ case 3
	.2byte _021FBF66 - _021FBF2E - 2 @ case 4
_021FBF38:
	adds r0, r4, #0
	movs r1, #3
	bl ov15_021FEDEC
	ldr r0, _021FBF90 @ =0x00000637
	bl FUN_0200604C
	add sp, #4
	movs r0, #5
	pop {r3, r4, r5, r6, pc}
_021FBF4C:
	ldr r0, _021FBF94 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #6
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x26
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FBF66:
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FBF82:
	movs r0, #5
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021FBF88: .4byte 0x00000682
_021FBF8C: .4byte 0x021D110C
_021FBF90: .4byte 0x00000637
_021FBF94: .4byte 0x000005DC
	thumb_func_end ov15_021FBD50

	thumb_func_start ov15_021FBF98
ov15_021FBF98: @ 0x021FBF98
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FEEA4
	adds r0, r4, #0
	bl ov15_02200428
	adds r0, r4, #0
	bl ov15_021FFF24
	adds r0, r4, #0
	bl ov15_021FF834
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FD788
	movs r0, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021FBF98

	thumb_func_start ov15_021FBFC0
ov15_021FBFC0: @ 0x021FBFC0
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FED3C
	adds r0, r4, #0
	bl ov15_021FB518
	adds r0, r4, #0
	bl ov15_02200428
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FF29C
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x10
	bl FUN_0200DC4C
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov15_021FBFC0

	thumb_func_start ov15_021FBFF8
ov15_021FBFF8: @ 0x021FBFF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FC018 @ =0x00000616
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FC012
	adds r0, r4, #0
	bl ov15_021FF004
	movs r0, #9
	pop {r4, pc}
_021FC012:
	movs r0, #8
	pop {r4, pc}
	nop
_021FC018: .4byte 0x00000616
	thumb_func_end ov15_021FBFF8

	thumb_func_start ov15_021FC01C
ov15_021FC01C: @ 0x021FC01C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _021FC134 @ =0x00000804
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021FC03A
	cmp r0, #2
	beq _021FC0CE
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	b _021FC12E
_021FC03A:
	adds r0, r5, #0
	bl ov15_021FF058
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x36
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #0x1a
	lsls r0, r0, #6
	ldrsh r0, [r5, r0]
	cmp r0, #1
	bne _021FC06E
	movs r2, #0xbd
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	subs r2, #0xc0
	ldr r2, [r5, r2]
	movs r1, #0
	adds r2, #0x66
	ldrh r2, [r2]
	bl FUN_0200C0CC
	b _021FC082
_021FC06E:
	movs r2, #0xbd
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	subs r2, #0xc0
	ldr r2, [r5, r2]
	movs r1, #0
	adds r2, #0x66
	ldrh r2, [r2]
	bl FUN_0200C134
_021FC082:
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0x1a
	movs r0, #0xbd
	str r1, [sp, #4]
	lsls r2, r2, #6
	lsls r0, r0, #2
	ldrsh r2, [r5, r2]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FC138 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FC13C @ =0x00000616
	add sp, #8
	strb r0, [r5, r1]
	movs r0, #0xa
	pop {r3, r4, r5, pc}
_021FC0CE:
	adds r0, r5, #0
	bl ov15_021FF058
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r5, #4
	bl FUN_0201D5C8
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FD788
	adds r0, r5, #0
	bl ov15_021FB518
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FC12E:
	movs r0, #9
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FC134: .4byte 0x00000804
_021FC138: .4byte 0x000005E4
_021FC13C: .4byte 0x00000616
	thumb_func_end ov15_021FC01C

	thumb_func_start ov15_021FC140
ov15_021FC140: @ 0x021FC140
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FC160 @ =0x00000616
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021FC154
	movs r0, #0xa
	pop {r4, pc}
_021FC154:
	adds r4, #0x34
	adds r0, r4, #0
	bl FUN_0201D5C8
	movs r0, #0xb
	pop {r4, pc}
	.align 2, 0
_021FC160: .4byte 0x00000616
	thumb_func_end ov15_021FC140

	thumb_func_start ov15_021FC164
ov15_021FC164: @ 0x021FC164
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021FC218 @ =0x00000616
	ldrb r0, [r5, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FC214
	ldr r0, _021FC21C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _021FC186
	ldr r0, _021FC220 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FC214
_021FC186:
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r5, #4
	bl FUN_0201D5C8
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r3, r1, #0
	muls r3, r0, r3
	adds r1, r2, r3
	movs r0, #6
	movs r3, #0x1a
	str r0, [sp]
	adds r2, #0x66
	lsls r3, r3, #6
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	ldrh r3, [r5, r3]
	bl FUN_02078480
	adds r0, r5, #0
	bl ov15_021F9F08
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #1
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	bl ov15_021FB518
	adds r0, r5, #0
	bl ov15_021FA170
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FD788
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FC214:
	movs r0, #0xb
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FC218: .4byte 0x00000616
_021FC21C: .4byte 0x021D110C
_021FC220: .4byte 0x021D114C
	thumb_func_end ov15_021FC164

	thumb_func_start ov15_021FC224
ov15_021FC224: @ 0x021FC224
	push {r3, r4, r5, lr}
	movs r1, #0x8e
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	adds r1, #0x66
	ldrh r1, [r1]
	bl FUN_020781DC
	cmp r0, #0
	bne _021FC28C
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x67
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0xbd
	ldr r1, _021FC2DC @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FEF48
	adds r0, r5, #0
	bl ov15_02200294
	adds r0, r5, #0
	bl ov15_021FFF24
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FD788
	movs r0, #0x19
	pop {r3, r4, r5, pc}
_021FC28C:
	adds r0, r5, #0
	bl ov15_02200294
	adds r0, r5, #0
	bl ov15_021FF560
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov15_021FF7AC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	bl ov15_021FB518
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021FC2DC: .4byte 0x000005E4
	thumb_func_end ov15_021FC224

	thumb_func_start ov15_021FC2E0
ov15_021FC2E0: @ 0x021FC2E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021FC370 @ =0x00000616
	ldrb r0, [r5, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FC36A
	ldr r0, _021FC374 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _021FC302
	ldr r0, _021FC378 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FC36A
_021FC302:
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r5, #0
	bl ov15_02200294
	adds r0, r5, #0
	bl ov15_021FF560
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov15_021FF7AC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	bl ov15_021FB518
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FD788
	movs r0, #1
	pop {r3, r4, r5, pc}
_021FC36A:
	movs r0, #0x19
	pop {r3, r4, r5, pc}
	nop
_021FC370: .4byte 0x00000616
_021FC374: .4byte 0x021D110C
_021FC378: .4byte 0x021D114C
	thumb_func_end ov15_021FC2E0

	thumb_func_start ov15_021FC37C
ov15_021FC37C: @ 0x021FC37C
	push {r3, r4, r5, lr}
	movs r1, #0x8e
	adds r5, r0, #0
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	adds r1, #0x66
	ldrh r1, [r1]
	bl FUN_02078208
	adds r0, r5, #0
	bl ov15_02200294
	adds r0, r5, #0
	bl ov15_021FF560
	movs r0, #0x61
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov15_021FF7AC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	bl ov15_021FB518
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FC37C

	thumb_func_start ov15_021FC3E0
ov15_021FC3E0: @ 0x021FC3E0
	push {r3, lr}
	bl ov15_021FAC48
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov15_021FC3E0

	thumb_func_start ov15_021FC3EC
ov15_021FC3EC: @ 0x021FC3EC
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FED3C
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FD788
	adds r0, r4, #0
	bl ov15_021FFF24
	movs r0, #1
	movs r1, #6
	bl FUN_020880CC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0x25
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021FC3EC

	thumb_func_start ov15_021FC41C
ov15_021FC41C: @ 0x021FC41C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021FC70C @ =0x021D110C
	movs r2, #0x40
	ldr r3, [r1, #0x4c]
	adds r5, r0, #0
	movs r4, #0
	tst r2, r3
	beq _021FC43E
	ldr r0, _021FC710 @ =0x00000644
	adds r4, r4, #1
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _021FC714 @ =0x02200640
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC56E
_021FC43E:
	movs r2, #0x80
	tst r2, r3
	beq _021FC454
	ldr r0, _021FC710 @ =0x00000644
	adds r4, r4, #1
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _021FC718 @ =0x02200641
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC56E
_021FC454:
	movs r2, #0x20
	adds r6, r3, #0
	tst r6, r2
	beq _021FC4AC
	ldr r1, _021FC710 @ =0x00000644
	ldr r3, _021FC71C @ =0x02200642
	ldr r1, [r5, r1]
	lsls r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #0xe
	bne _021FC484
	movs r1, #2
	str r1, [sp]
	movs r1, #0xe
	add r2, sp, #0xc
	adds r3, r4, #0
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	bne _021FC4D6
	add sp, #0x10
	movs r0, #0xe
	pop {r4, r5, r6, pc}
_021FC484:
	cmp r1, #0x10
	beq _021FC56E
	cmp r1, #0
	blt _021FC4A4
	cmp r1, #8
	bge _021FC4A4
	subs r2, #0x21
	bl ov15_021FA6C0
	ldr r1, _021FC710 @ =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC56E
	str r0, [r5, r1]
	adds r4, r4, #1
	b _021FC56E
_021FC4A4:
	ldr r0, _021FC710 @ =0x00000644
	adds r4, r4, #1
	str r3, [r5, r0]
	b _021FC56E
_021FC4AC:
	movs r2, #0x10
	tst r3, r2
	beq _021FC506
	ldr r1, _021FC710 @ =0x00000644
	ldr r2, _021FC720 @ =0x02200643
	ldr r1, [r5, r1]
	lsls r3, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0xf
	bne _021FC4DE
	movs r1, #2
	str r1, [sp]
	add r2, sp, #8
	movs r1, #0xf
	adds r2, #3
	adds r3, r4, #0
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FC4D8
_021FC4D6:
	b _021FC77A
_021FC4D8:
	add sp, #0x10
	movs r0, #0xe
	pop {r4, r5, r6, pc}
_021FC4DE:
	cmp r1, #0x10
	beq _021FC56E
	cmp r1, #0
	blt _021FC4FE
	cmp r1, #8
	bge _021FC4FE
	movs r2, #1
	bl ov15_021FA6C0
	ldr r1, _021FC710 @ =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC56E
	str r0, [r5, r1]
	adds r4, r4, #1
	b _021FC56E
_021FC4FE:
	ldr r0, _021FC710 @ =0x00000644
	adds r4, r4, #1
	str r2, [r5, r0]
	b _021FC56E
_021FC506:
	ldr r3, [r1, #0x48]
	lsls r1, r2, #5
	tst r1, r3
	beq _021FC53A
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	subs r2, #0x11
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	add r2, sp, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, #2
	movs r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	movs r0, #0xe
	pop {r4, r5, r6, pc}
_021FC53A:
	adds r2, #0xf0
	adds r1, r3, #0
	tst r1, r2
	beq _021FC56E
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #1
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	adds r0, r4, #0
	add r2, sp, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, #1
	movs r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	movs r0, #0xe
	pop {r4, r5, r6, pc}
_021FC56E:
	ldr r1, _021FC710 @ =0x00000644
	ldr r0, [r5, r1]
	cmp r0, #0x11
	bne _021FC582
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x64
	ldrb r0, [r0]
	str r0, [r5, r1]
_021FC582:
	cmp r4, #0
	beq _021FC5A6
	ldr r0, _021FC724 @ =0x000005DC
	bl FUN_0200604C
	ldr r1, _021FC710 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r1, _021FC710 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FA0E4
	adds r0, r5, #0
	bl ov15_021FA170
_021FC5A6:
	movs r1, #0
	add r0, sp, #8
	strb r1, [r0]
	adds r0, r5, #0
	bl ov15_021FAC2C
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021FC630
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FA104
	cmp r0, #0
	beq _021FC608
	cmp r4, #8
	bhs _021FC5EA
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FA68C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021FC608
	ldr r1, _021FC710 @ =0x00000644
	adds r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	b _021FC608
_021FC5EA:
	ldr r1, _021FC710 @ =0x00000644
	adds r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FC710 @ =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FC608
	cmp r1, #0xd
	bgt _021FC608
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FC608:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #8
	movs r3, #0
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FC6B4
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #4
	adds r1, #0x68
	strh r2, [r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FC630:
	ldr r0, _021FC70C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021FC678
	movs r0, #2
	str r0, [sp]
	movs r3, #0
	ldr r1, _021FC710 @ =0x00000644
	str r3, [sp, #4]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	add r2, sp, #8
	bl ov15_021FA73C
	adds r4, r0, #0
	ldr r0, _021FC710 @ =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FC662
	cmp r1, #0xd
	bgt _021FC662
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FC662:
	cmp r4, #1
	beq _021FC6B4
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	adds r0, #0x68
	strh r1, [r0]
	add sp, #0x10
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021FC678:
	movs r0, #2
	tst r1, r0
	beq _021FC6B4
	str r0, [sp]
	movs r3, #0
	adds r0, r5, #0
	movs r1, #0x10
	add r2, sp, #8
	str r3, [sp, #4]
	bl ov15_021FA73C
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	adds r0, #0x68
	strh r1, [r0]
	ldr r0, _021FC710 @ =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FC6AE
	cmp r1, #0xd
	bgt _021FC6AE
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FC6AE:
	add sp, #0x10
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021FC6B4:
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #1
	bne _021FC778
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #3
	adds r0, #0x66
	ldrh r0, [r0]
	movs r2, #6
	bl FUN_02077D88
	cmp r0, #0
	bne _021FC6E4
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x66
	ldrh r0, [r0]
	bl FUN_02078168
	cmp r0, #0
	bne _021FC75C
_021FC6E4:
	movs r2, #0xbd
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	subs r2, #0xc0
	ldr r2, [r5, r2]
	movs r1, #0
	adds r2, #0x66
	ldrh r2, [r2]
	bl FUN_0200C0CC
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x2f
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #0xbd
	ldr r1, _021FC728 @ =0x000005E4
	b _021FC72C
	.align 2, 0
_021FC70C: .4byte 0x021D110C
_021FC710: .4byte 0x00000644
_021FC714: .4byte 0x02200640
_021FC718: .4byte 0x02200641
_021FC71C: .4byte 0x02200642
_021FC720: .4byte 0x02200643
_021FC724: .4byte 0x000005DC
_021FC728: .4byte 0x000005E4
_021FC72C:
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FC780 @ =0x00000616
	add sp, #0x10
	strb r0, [r5, r1]
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0xf
	pop {r4, r5, r6, pc}
_021FC75C:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #4
	adds r0, #0x68
	strh r1, [r0]
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0x29
	movs r3, #0x24
	bl ov15_021FD810
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FC778:
	movs r0, #0xe
_021FC77A:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FC780: .4byte 0x00000616
	thumb_func_end ov15_021FC41C

	thumb_func_start ov15_021FC784
ov15_021FC784: @ 0x021FC784
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FC7E0 @ =0x00000616
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FC7DC
	ldr r0, _021FC7E4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _021FC7A6
	ldr r0, _021FC7E8 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FC7DC
_021FC7A6:
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	muls r1, r2, r1
	adds r1, r3, r1
	movs r2, #0xa
	ldrsh r1, [r1, r2]
	subs r2, #0xb
	movs r3, #0
	bl ov15_021FF364
	movs r0, #0xe
	pop {r4, pc}
_021FC7DC:
	movs r0, #0xf
	pop {r4, pc}
	.align 2, 0
_021FC7E0: .4byte 0x00000616
_021FC7E4: .4byte 0x021D110C
_021FC7E8: .4byte 0x021D114C
	thumb_func_end ov15_021FC784

	thumb_func_start ov15_021FC7EC
ov15_021FC7EC: @ 0x021FC7EC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021FCAB0 @ =0x021D110C
	movs r2, #0x40
	ldr r3, [r1, #0x4c]
	adds r5, r0, #0
	movs r4, #0
	tst r2, r3
	beq _021FC80E
	ldr r0, _021FCAB4 @ =0x00000644
	adds r4, r4, #1
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _021FCAB8 @ =0x02200640
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC9CA
_021FC80E:
	movs r2, #0x80
	tst r2, r3
	beq _021FC824
	ldr r0, _021FCAB4 @ =0x00000644
	adds r4, r4, #1
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _021FCABC @ =0x02200641
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC9CA
_021FC824:
	movs r2, #0x20
	adds r6, r3, #0
	tst r6, r2
	beq _021FC87C
	ldr r1, _021FCAB4 @ =0x00000644
	ldr r3, _021FCAC0 @ =0x02200642
	ldr r1, [r5, r1]
	lsls r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #0xe
	bne _021FC854
	movs r1, #4
	str r1, [sp]
	movs r1, #0xe
	add r2, sp, #0xc
	movs r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	bne _021FC8A6
	add sp, #0x10
	movs r0, #0x10
	pop {r4, r5, r6, pc}
_021FC854:
	cmp r1, #0x10
	beq _021FC8B2
	cmp r1, #0
	blt _021FC874
	cmp r1, #8
	bge _021FC874
	subs r2, #0x21
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 @ =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC8B2
	str r0, [r5, r1]
	adds r4, r4, #1
	b _021FC9CA
_021FC874:
	ldr r0, _021FCAB4 @ =0x00000644
	adds r4, r4, #1
	str r3, [r5, r0]
	b _021FC9CA
_021FC87C:
	movs r2, #0x10
	tst r3, r2
	beq _021FC8D8
	ldr r1, _021FCAB4 @ =0x00000644
	ldr r2, _021FCAC4 @ =0x02200643
	ldr r1, [r5, r1]
	lsls r3, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0xf
	bne _021FC8AE
	movs r1, #4
	str r1, [sp]
	add r2, sp, #8
	movs r1, #0xf
	adds r2, #3
	movs r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FC8A8
_021FC8A6:
	b _021FCB5A
_021FC8A8:
	add sp, #0x10
	movs r0, #0x10
	pop {r4, r5, r6, pc}
_021FC8AE:
	cmp r1, #0x10
	bne _021FC8B4
_021FC8B2:
	b _021FC9CA
_021FC8B4:
	cmp r1, #0
	blt _021FC8D0
	cmp r1, #8
	bge _021FC8D0
	movs r2, #1
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 @ =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC9CA
	str r0, [r5, r1]
	adds r4, r4, #1
	b _021FC9CA
_021FC8D0:
	ldr r0, _021FCAB4 @ =0x00000644
	adds r4, r4, #1
	str r2, [r5, r0]
	b _021FC9CA
_021FC8D8:
	ldr r3, [r1, #0x48]
	lsls r1, r2, #5
	tst r1, r3
	beq _021FC952
	ldr r1, _021FCAB4 @ =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FC922
	cmp r1, #8
	bge _021FC922
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	subs r2, #0x11
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 @ =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov15_021FFECC
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 @ =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r2, #2
	movs r3, #1
	bl ov15_021FA73C
	b _021FC94C
_021FC922:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #0
	adds r1, #0x64
	ldrb r1, [r1]
	adds r0, r5, #0
	mvns r2, r2
	bl ov15_021FA6C0
	adds r1, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, #2
	movs r3, #1
	bl ov15_021FA73C
_021FC94C:
	add sp, #0x10
	movs r0, #0x10
	pop {r4, r5, r6, pc}
_021FC952:
	adds r2, #0xf0
	adds r1, r3, #0
	tst r1, r2
	beq _021FC9CA
	ldr r1, _021FCAB4 @ =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FC99C
	cmp r1, #8
	bge _021FC99C
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #1
	adds r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 @ =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl ov15_021FFECC
	movs r0, #4
	str r0, [sp]
	adds r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 @ =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r2, #1
	movs r3, #1
	bl ov15_021FA73C
	b _021FC9C4
_021FC99C:
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, #0x64
	ldrb r1, [r1]
	movs r2, #1
	bl ov15_021FA6C0
	adds r1, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, #1
	movs r3, #1
	bl ov15_021FA73C
_021FC9C4:
	add sp, #0x10
	movs r0, #0x10
	pop {r4, r5, r6, pc}
_021FC9CA:
	ldr r1, _021FCAB4 @ =0x00000644
	ldr r0, [r5, r1]
	cmp r0, #0x11
	bne _021FC9DE
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x64
	ldrb r0, [r0]
	str r0, [r5, r1]
_021FC9DE:
	cmp r4, #0
	beq _021FCA02
	ldr r0, _021FCAC8 @ =0x000005DC
	bl FUN_0200604C
	ldr r1, _021FCAB4 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r1, _021FCAB4 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FA0E4
	adds r0, r5, #0
	bl ov15_021FA170
_021FCA02:
	movs r1, #0
	add r0, sp, #8
	strb r1, [r0]
	adds r0, r5, #0
	bl ov15_021FAC2C
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _021FCA8A
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FA104
	cmp r0, #0
	beq _021FCA64
	cmp r4, #8
	bhs _021FCA46
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov15_021FA68C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021FCA64
	ldr r1, _021FCAB4 @ =0x00000644
	adds r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	b _021FCA64
_021FCA46:
	ldr r1, _021FCAB4 @ =0x00000644
	adds r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FCAB4 @ =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCA64
	cmp r1, #0xd
	bgt _021FCA64
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FCA64:
	movs r0, #4
	str r0, [sp]
	movs r3, #1
	adds r0, r5, #0
	adds r1, r4, #0
	add r2, sp, #8
	str r3, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FCB40
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r2, #5
	adds r1, #0x68
	strh r2, [r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCA8A:
	ldr r0, _021FCAB0 @ =0x021D110C
	movs r3, #1
	ldr r1, [r0, #0x48]
	adds r0, r1, #0
	tst r0, r3
	beq _021FCAF2
	movs r0, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 @ =0x00000644
	adds r0, r5, #0
	ldr r1, [r5, r1]
	add r2, sp, #8
	bl ov15_021FA73C
	adds r4, r0, #0
	ldr r0, _021FCAB4 @ =0x00000644
	b _021FCACC
	.align 2, 0
_021FCAB0: .4byte 0x021D110C
_021FCAB4: .4byte 0x00000644
_021FCAB8: .4byte 0x02200640
_021FCABC: .4byte 0x02200641
_021FCAC0: .4byte 0x02200642
_021FCAC4: .4byte 0x02200643
_021FCAC8: .4byte 0x000005DC
_021FCACC:
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCADC
	cmp r1, #0xd
	bgt _021FCADC
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FCADC:
	cmp r4, #1
	beq _021FCB40
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	adds r0, #0x68
	strh r1, [r0]
	add sp, #0x10
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021FCAF2:
	movs r0, #2
	tst r0, r1
	beq _021FCB40
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	movs r1, #0
	adds r2, #0x66
	strh r1, [r2]
	ldr r0, [r5, r0]
	movs r2, #5
	adds r0, #0x68
	strh r2, [r0]
	adds r0, r5, #0
	bl ov15_021FD774
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	ldr r0, _021FCB60 @ =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCB2C
	cmp r1, #0xd
	bgt _021FCB2C
	adds r0, r5, #0
	bl ov15_021FA0E4
_021FCB2C:
	movs r0, #0x24
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x13
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCB40:
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #1
	bne _021FCB58
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0x29
	movs r3, #0x22
	bl ov15_021FD810
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCB58:
	movs r0, #0x10
_021FCB5A:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FCB60: .4byte 0x00000644
	thumb_func_end ov15_021FC7EC

	thumb_func_start ov15_021FCB64
ov15_021FCB64: @ 0x021FCB64
	push {r3, r4, r5, lr}
	sub sp, #8
	movs r1, #0x8d
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r3, r1, #4
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	muls r1, r2, r1
	adds r5, r3, r1
	movs r2, #0
	movs r1, #4
	adds r3, r2, #0
	bl ov15_021FD574
	movs r0, #0x1a
	movs r1, #1
	lsls r0, r0, #6
	strh r1, [r4, r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	adds r0, #0x66
	ldrh r0, [r0]
	movs r2, #6
	bl FUN_02077D88
	asrs r1, r0, #1
	ldr r0, _021FCD70 @ =0x00000684
	movs r2, #0
	str r1, [r4, r0]
	ldr r0, [r4]
	movs r1, #5
	bl ov15_021FD43C
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r4, #0
	movs r1, #0
	bl ov15_02200458
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FD788
	ldr r2, _021FCD74 @ =0x00000644
	movs r1, #6
	ldr r2, [r4, r2]
	ldrsh r1, [r5, r1]
	adds r0, r4, #0
	subs r2, #8
	bl ov15_021FF4EC
	ldr r1, _021FCD74 @ =0x00000644
	adds r0, r4, #0
	ldr r1, [r4, r1]
	subs r1, #8
	bl ov15_022002B4
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	adds r0, r4, #0
	adds r2, #0x66
	ldrh r2, [r2]
	adds r1, r4, #4
	bl ov15_021FECA0
	adds r0, r4, #0
	bl ov15_021FFF24
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #3
	adds r0, #0x66
	ldrh r0, [r0]
	movs r2, #6
	bl FUN_02077D88
	cmp r0, #0
	bne _021FCC32
	ldr r0, _021FCD70 @ =0x00000684
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021FCC7C
_021FCC32:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x4c
	bl FUN_0200BBA0
	movs r2, #0xbd
	lsls r2, r2, #2
	adds r5, r0, #0
	ldr r0, [r4, r2]
	subs r2, #0xc0
	ldr r2, [r4, r2]
	movs r1, #0
	adds r2, #0x66
	ldrh r2, [r2]
	bl FUN_0200C0CC
	movs r0, #0xbd
	ldr r1, _021FCD78 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FCD7C @ =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	movs r0, #0x18
	pop {r3, r4, r5, pc}
_021FCC7C:
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FF0FC
	adds r0, r4, #0
	bl ov15_021FF068
	adds r0, r4, #0
	movs r1, #2
	bl ov15_021FEDEC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	movs r3, #6
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r2, r0
	adds r2, #0x66
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	bl FUN_02078568
	cmp r0, #1
	bne _021FCD0C
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x4e
	bl FUN_0200BBA0
	movs r1, #0
	adds r5, r0, #0
	movs r2, #0x1a
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	lsls r2, r2, #6
	movs r0, #0xbd
	ldrsh r3, [r4, r2]
	adds r2, r2, #4
	lsls r0, r0, #2
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	muls r2, r3, r2
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FCD78 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021FEF48
	ldr r1, _021FCD7C @ =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	movs r0, #0x15
	pop {r3, r4, r5, pc}
_021FCD0C:
	movs r1, #6
	ldrsh r3, [r5, r1]
	ldr r1, _021FCD74 @ =0x00000644
	ldr r0, [r5]
	ldr r2, [r4, r1]
	adds r1, #0x3e
	adds r2, r3, r2
	subs r2, #8
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	strh r0, [r4, r1]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x4d
	bl FUN_0200BBA0
	movs r2, #0xbd
	lsls r2, r2, #2
	adds r5, r0, #0
	ldr r0, [r4, r2]
	subs r2, #0xc0
	ldr r2, [r4, r2]
	movs r1, #0
	adds r2, #0x66
	ldrh r2, [r2]
	bl FUN_0200C0CC
	movs r0, #0xbd
	ldr r1, _021FCD78 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021FEF48
	ldr r1, _021FCD7C @ =0x00000616
	strb r0, [r4, r1]
	movs r0, #0x11
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FCD70: .4byte 0x00000684
_021FCD74: .4byte 0x00000644
_021FCD78: .4byte 0x000005E4
_021FCD7C: .4byte 0x00000616
	thumb_func_end ov15_021FCB64

	thumb_func_start ov15_021FCD80
ov15_021FCD80: @ 0x021FCD80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FCDDC @ =0x00000616
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FCDD6
	ldr r0, _021FCDE0 @ =0x00000682
	ldrh r1, [r4, r0]
	cmp r1, #0x63
	bls _021FCD9C
	movs r1, #0x63
	strh r1, [r4, r0]
_021FCD9C:
	movs r2, #0
	adds r0, r4, #0
	movs r1, #4
	adds r3, r2, #0
	bl ov15_021FD574
	ldr r2, _021FCDE0 @ =0x00000682
	adds r0, r4, #0
	ldrh r2, [r4, r2]
	movs r1, #2
	bl ov15_02200300
	adds r0, r4, #0
	bl ov15_021FF7FC
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021FF29C
	adds r0, r4, #0
	movs r1, #1
	bl ov15_022004DC
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FFFDC
	movs r0, #0x12
	pop {r4, pc}
_021FCDD6:
	movs r0, #0x11
	pop {r4, pc}
	nop
_021FCDDC: .4byte 0x00000616
_021FCDE0: .4byte 0x00000682
	thumb_func_end ov15_021FCD80

	thumb_func_start ov15_021FCDE4
ov15_021FCDE4: @ 0x021FCDE4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	movs r5, #0
	movs r1, #4
	adds r4, r0, #0
	bl ov15_021FAC2C
	adds r6, r0, #0
	subs r0, r5, #1
	cmp r6, r0
	bne _021FCDFC
	b _021FCF06
_021FCDFC:
	ldr r0, _021FCFB8 @ =0x00000682
	ldrh r0, [r4, r0]
	bl ov15_022002EC
	cmp r0, #2
	bne _021FCE14
	cmp r6, #0
	beq _021FCE10
	cmp r6, #2
	bne _021FCE14
_021FCE10:
	movs r6, #0
	mvns r6, r6
_021FCE14:
	cmp r6, #5
	bls _021FCE1A
	b _021FCF2E
_021FCE1A:
	adds r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021FCE26: @ jump table
	.2byte _021FCE32 - _021FCE26 - 2 @ case 0
	.2byte _021FCE64 - _021FCE26 - 2 @ case 1
	.2byte _021FCE96 - _021FCE26 - 2 @ case 2
	.2byte _021FCECA - _021FCE26 - 2 @ case 3
	.2byte _021FCEFE - _021FCE26 - 2 @ case 4
	.2byte _021FCF02 - _021FCE26 - 2 @ case 5
_021FCE32:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	movs r2, #0xa
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x1a
	bl FUN_0200DC4C
	movs r5, #1
	b _021FCF2E
_021FCE64:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	movs r2, #1
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xb5
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x1a
	bl FUN_0200DC4C
	movs r5, #1
	b _021FCF2E
_021FCE96:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	movs r2, #9
	ldrh r1, [r4, r1]
	mvns r2, r2
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x1c
	bl FUN_0200DC4C
	movs r5, #2
	b _021FCF2E
_021FCECA:
	movs r1, #0x1a
	lsls r1, r1, #6
	ldrsh r0, [r4, r1]
	adds r1, r1, #2
	movs r2, #0
	ldrh r1, [r4, r1]
	mvns r2, r2
	bl ov15_021FBD28
	movs r1, #0x1a
	lsls r1, r1, #6
	strh r0, [r4, r1]
	movs r0, #0x2e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0x2e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x1c
	bl FUN_0200DC4C
	movs r5, #2
	b _021FCF2E
_021FCEFE:
	movs r5, #3
	b _021FCF2E
_021FCF02:
	movs r5, #4
	b _021FCF2E
_021FCF06:
	movs r1, #0x1a
	lsls r1, r1, #6
	adds r0, r4, r1
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	bl FUN_020881C0
	adds r5, r0, #0
	bne _021FCF2E
	ldr r0, _021FCFBC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _021FCF26
	movs r5, #3
	b _021FCF2E
_021FCF26:
	movs r0, #2
	tst r0, r1
	beq _021FCF2E
	movs r5, #4
_021FCF2E:
	cmp r5, #4
	bhi _021FCFB2
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021FCF3E: @ jump table
	.2byte _021FCFB2 - _021FCF3E - 2 @ case 0
	.2byte _021FCF48 - _021FCF3E - 2 @ case 1
	.2byte _021FCF62 - _021FCF3E - 2 @ case 2
	.2byte _021FCF7C - _021FCF3E - 2 @ case 3
	.2byte _021FCF96 - _021FCF3E - 2 @ case 4
_021FCF48:
	adds r0, r4, #0
	bl ov15_021FF068
	adds r0, r4, #0
	movs r1, #2
	bl ov15_021FEDEC
	ldr r0, _021FCFC0 @ =0x00000637
	bl FUN_0200604C
	add sp, #4
	movs r0, #0x12
	pop {r3, r4, r5, r6, pc}
_021FCF62:
	adds r0, r4, #0
	bl ov15_021FF068
	adds r0, r4, #0
	movs r1, #2
	bl ov15_021FEDEC
	ldr r0, _021FCFC0 @ =0x00000637
	bl FUN_0200604C
	add sp, #4
	movs r0, #0x12
	pop {r3, r4, r5, r6, pc}
_021FCF7C:
	ldr r0, _021FCFC4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x13
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x26
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FCF96:
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	movs r0, #0x14
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #9
	movs r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FCFB2:
	movs r0, #0x12
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021FCFB8: .4byte 0x00000682
_021FCFBC: .4byte 0x021D110C
_021FCFC0: .4byte 0x00000637
_021FCFC4: .4byte 0x000005DC
	thumb_func_end ov15_021FCDE4

	thumb_func_start ov15_021FCFC8
ov15_021FCFC8: @ 0x021FCFC8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x44
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r5, #0
	bl ov15_021FF834
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x4e
	bl FUN_0200BBA0
	movs r1, #0
	adds r4, r0, #0
	movs r2, #0x1a
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	lsls r2, r2, #6
	movs r0, #0xbd
	ldrsh r3, [r5, r2]
	adds r2, r2, #4
	lsls r0, r0, #2
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	muls r2, r3, r2
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FD050 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FEF48
	ldr r1, _021FD054 @ =0x00000616
	strb r0, [r5, r1]
	adds r0, r5, #0
	bl ov15_02200428
	adds r0, r5, #0
	bl ov15_021FFF24
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FD788
	movs r0, #0x15
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FD050: .4byte 0x000005E4
_021FD054: .4byte 0x00000616
	thumb_func_end ov15_021FCFC8

	thumb_func_start ov15_021FD058
ov15_021FD058: @ 0x021FD058
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021FD0E4 @ =0x00000684
	movs r1, #0
	str r1, [r5, r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r5, #4
	bl FUN_0201D5C8
	adds r0, r5, #0
	bl ov15_02200428
	adds r0, r5, #0
	bl ov15_021FFF24
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	bl ov15_021FB518
	adds r0, r5, #0
	movs r1, #1
	bl ov15_02200458
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FD788
	movs r0, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FD0E4: .4byte 0x00000684
	thumb_func_end ov15_021FD058

	thumb_func_start ov15_021FD0E8
ov15_021FD0E8: @ 0x021FD0E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FD108 @ =0x00000616
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FD102
	adds r0, r4, #0
	bl ov15_021FF004
	movs r0, #0x16
	pop {r4, pc}
_021FD102:
	movs r0, #0x15
	pop {r4, pc}
	nop
_021FD108: .4byte 0x00000616
	thumb_func_end ov15_021FD0E8

	thumb_func_start ov15_021FD10C
ov15_021FD10C: @ 0x021FD10C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _021FD23C @ =0x00000804
	ldr r0, [r4, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021FD12A
	cmp r0, #2
	beq _021FD1BA
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	b _021FD234
_021FD12A:
	adds r0, r4, #0
	bl ov15_021FF058
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x4f
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r0, #0x1a
	lsls r0, r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #1
	ble _021FD15E
	movs r2, #0xbd
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	subs r2, #0xc0
	ldr r2, [r4, r2]
	movs r1, #0
	adds r2, #0x66
	ldrh r2, [r2]
	bl FUN_0200C134
	b _021FD172
_021FD15E:
	movs r2, #0xbd
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	subs r2, #0xc0
	ldr r2, [r4, r2]
	movs r1, #0
	adds r2, #0x66
	ldrh r2, [r2]
	bl FUN_0200C0CC
_021FD172:
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0x1a
	movs r0, #0xbd
	str r1, [sp, #4]
	lsls r2, r2, #6
	ldrsh r3, [r4, r2]
	adds r2, r2, #4
	lsls r0, r0, #2
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	muls r2, r3, r2
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FD240 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FD244 @ =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	movs r0, #0x17
	pop {r3, r4, r5, pc}
_021FD1BA:
	adds r0, r4, #0
	bl ov15_021FF058
	ldr r0, _021FD248 @ =0x00000684
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r4, #4
	bl FUN_0201D5C8
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r5, [r4, r0]
	adds r0, r4, #0
	bl ov15_021FA074
	adds r1, r5, #4
	adds r5, #0x64
	adds r2, r0, #0
	ldrb r5, [r5]
	movs r3, #0xc
	adds r0, r4, #0
	muls r3, r5, r3
	adds r1, r1, r3
	movs r3, #0
	bl ov15_02200140
	adds r0, r4, #0
	bl ov15_021FE868
	adds r0, r4, #0
	bl ov15_021FED3C
	adds r0, r4, #0
	bl ov15_021FB518
	adds r0, r4, #0
	movs r1, #1
	bl ov15_02200458
	adds r0, r4, #0
	movs r1, #1
	bl ov15_021FD788
	add sp, #8
	movs r0, #0x10
	pop {r3, r4, r5, pc}
_021FD234:
	movs r0, #0x16
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FD23C: .4byte 0x00000804
_021FD240: .4byte 0x000005E4
_021FD244: .4byte 0x00000616
_021FD248: .4byte 0x00000684
	thumb_func_end ov15_021FD10C

	thumb_func_start ov15_021FD24C
ov15_021FD24C: @ 0x021FD24C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _021FD2F4 @ =0x00000616
	ldrb r0, [r4, r0]
	bl FUN_02020094
	cmp r0, #0
	beq _021FD264
	add sp, #4
	movs r0, #0x17
	pop {r3, r4, pc}
_021FD264:
	ldr r0, _021FD2F8 @ =0x00000643
	bl FUN_0200604C
	movs r1, #0x1a
	lsls r1, r1, #6
	movs r0, #0x8f
	ldrsh r2, [r4, r1]
	adds r1, r1, #4
	lsls r0, r0, #2
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	muls r1, r2, r1
	bl FUN_02029044
	movs r0, #0x1a
	lsls r0, r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #1
	bne _021FD2A8
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x75
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _021FD2B4
	adds r0, r1, #0
	adds r0, #0x75
	ldrb r0, [r0]
	adds r1, #0x75
	adds r0, r0, #1
	strb r0, [r1]
	b _021FD2B4
_021FD2A8:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	adds r0, #0x75
	strb r1, [r0]
_021FD2B4:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	adds r3, r1, #0
	muls r3, r0, r3
	adds r1, r2, r3
	movs r0, #6
	movs r3, #0x1a
	str r0, [sp]
	adds r2, #0x66
	lsls r3, r3, #6
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	ldrh r3, [r4, r3]
	bl FUN_02078480
	adds r0, r4, #0
	bl ov15_021F9F08
	adds r4, #0x34
	adds r0, r4, #0
	bl FUN_0201D5C8
	movs r0, #0x18
	add sp, #4
	pop {r3, r4, pc}
	nop
_021FD2F4: .4byte 0x00000616
_021FD2F8: .4byte 0x00000643
	thumb_func_end ov15_021FD24C

	thumb_func_start ov15_021FD2FC
ov15_021FD2FC: @ 0x021FD2FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021FD39C @ =0x00000616
	ldrb r0, [r5, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021FD396
	ldr r0, _021FD3A0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _021FD31E
	ldr r0, _021FD3A4 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FD396
_021FD31E:
	ldr r0, _021FD3A8 @ =0x00000684
	movs r1, #0
	str r1, [r5, r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r0, #0x34
	bl FUN_0201D8E4
	adds r0, r5, #4
	bl FUN_0201D5C8
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r4, [r5, r0]
	adds r0, r5, #0
	bl ov15_021FA074
	adds r1, r4, #4
	adds r4, #0x64
	adds r2, r0, #0
	ldrb r4, [r4]
	movs r3, #0xc
	adds r0, r5, #0
	muls r3, r4, r3
	adds r1, r1, r3
	movs r3, #1
	bl ov15_02200140
	adds r0, r5, #0
	bl ov15_021FE868
	adds r0, r5, #0
	bl ov15_021FED3C
	adds r0, r5, #0
	bl ov15_021FB518
	adds r0, r5, #0
	bl ov15_021FA170
	adds r0, r5, #0
	movs r1, #1
	bl ov15_02200458
	adds r0, r5, #0
	movs r1, #1
	bl ov15_021FD788
	movs r0, #0x10
	pop {r3, r4, r5, pc}
_021FD396:
	movs r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_021FD39C: .4byte 0x00000616
_021FD3A0: .4byte 0x021D110C
_021FD3A4: .4byte 0x021D114C
_021FD3A8: .4byte 0x00000684
	thumb_func_end ov15_021FD2FC

	thumb_func_start ov15_021FD3AC
ov15_021FD3AC: @ 0x021FD3AC
	push {r3, lr}
	bl ov15_021FA650
	cmp r0, #1
	bne _021FD3BA
	movs r0, #2
	pop {r3, pc}
_021FD3BA:
	movs r0, #0x1a
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov15_021FD3AC

	thumb_func_start ov15_021FD3C0
ov15_021FD3C0: @ 0x021FD3C0
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FED3C
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FD788
	adds r0, r4, #0
	bl ov15_021FFF24
	movs r0, #1
	movs r1, #6
	bl FUN_020880CC
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #4
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0x25
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021FD3C0

	thumb_func_start ov15_021FD3F0
ov15_021FD3F0: @ 0x021FD3F0
	cmp r0, #4
	beq _021FD3FC
	cmp r1, #0x5f
	blo _021FD400
	cmp r1, #0x63
	bhs _021FD400
_021FD3FC:
	movs r0, #1
	bx lr
_021FD400:
	movs r0, #0
	bx lr
	thumb_func_end ov15_021FD3F0

	thumb_func_start ov15_021FD404
ov15_021FD404: @ 0x021FD404
	push {r3, r4, r5, lr}
	lsls r1, r1, #2
	adds r1, r0, r1
	ldr r0, _021FD438 @ =0x00000694
	cmp r2, #7
	ldr r0, [r1, r0]
	ldr r5, [r0, #0xc]
	bgt _021FD434
	lsls r4, r2, #5
	adds r0, r5, r4
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFCC0
	adds r0, r5, r4
	movs r1, #0x20
	movs r2, #0x40
	blx FUN_020CFCC0
	adds r0, r5, r4
	movs r1, #0x60
	movs r2, #0x20
	blx FUN_020CFCC0
_021FD434:
	pop {r3, r4, r5, pc}
	nop
_021FD438: .4byte 0x00000694
	thumb_func_end ov15_021FD404

	thumb_func_start ov15_021FD43C
ov15_021FD43C: @ 0x021FD43C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r6, r0, #0
	adds r4, r2, #0
	bl FUN_0201CC08
	str r0, [sp, #0x14]
	cmp r4, #6
	beq _021FD4B6
	ldr r1, _021FD4BC @ =0x022013A8
	lsls r0, r4, #5
	adds r5, r1, r0
	ldr r0, [sp, #0x10]
	movs r7, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_021FD462:
	ldrb r0, [r5]
	cmp r0, #1
	bne _021FD48E
	ldrb r0, [r5, #4]
	adds r1, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	ldrb r3, [r5, #2]
	ldrb r2, [r5, #1]
	adds r0, r6, #0
	lsls r3, r3, #5
	adds r2, r2, r3
	lsls r3, r2, #1
	ldr r2, [sp, #0x14]
	adds r2, r2, r3
	ldrb r3, [r5, #3]
	bl FUN_0201C4C4
	b _021FD4AE
_021FD48E:
	cmp r0, #2
	bne _021FD4AE
	ldrb r0, [r5, #4]
	adds r1, r4, #0
	movs r2, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5, #3]
	adds r0, r6, #0
	bl FUN_0201C8C4
_021FD4AE:
	adds r7, r7, #1
	adds r5, #8
	cmp r7, #4
	blt _021FD462
_021FD4B6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FD4BC: .4byte 0x022013A8
	thumb_func_end ov15_021FD43C

	thumb_func_start ov15_021FD4C0
ov15_021FD4C0: @ 0x021FD4C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0x10]
	lsls r1, r1, #0x18
	adds r5, r2, #0
	lsrs r1, r1, #0x18
	adds r6, r0, #0
	str r3, [sp, #0x14]
	bl FUN_0201CC08
	str r0, [sp, #0x18]
	subs r0, r5, #1
	ldr r1, _021FD56C @ =0x02201340
	lsls r0, r0, #3
	adds r5, r1, r0
	ldr r0, [sp, #0x10]
	movs r4, #0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_021FD4E6:
	ldrb r0, [r5, #1]
	adds r1, r7, #0
	movs r2, #0
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5]
	adds r0, r6, #0
	bl FUN_0201C8C4
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021FD4E6
	movs r1, #0
	ldr r0, [sp, #0x14]
	mvns r1, r1
	cmp r0, r1
	beq _021FD566
	ldr r1, _021FD570 @ =0x02201328
	lsls r0, r0, #2
	adds r3, r1, r0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ldrb r0, [r3, #1]
	bhi _021FD546
	str r0, [sp]
	ldrb r0, [r3, #2]
	ldr r1, [sp, #0x10]
	movs r4, #6
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	lsls r1, r1, #0x18
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	lsls r4, r4, #8
	ldrb r3, [r3]
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	adds r2, r2, r4
	bl FUN_0201C4C4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_021FD546:
	str r0, [sp]
	ldrb r0, [r3, #2]
	ldr r1, [sp, #0x10]
	movs r4, #0x1b
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	lsls r1, r1, #0x18
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	lsls r4, r4, #6
	ldrb r3, [r3]
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	adds r2, r2, r4
	bl FUN_0201C4C4
_021FD566:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021FD56C: .4byte 0x02201340
_021FD570: .4byte 0x02201328
	thumb_func_end ov15_021FD4C0

	thumb_func_start ov15_021FD574
ov15_021FD574: @ 0x021FD574
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #4
	bls _021FD588
	bl GF_AssertFail
_021FD588:
	cmp r5, #4
	bls _021FD58E
	b _021FD770
_021FD58E:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021FD59A: @ jump table
	.2byte _021FD5A4 - _021FD59A - 2 @ case 0
	.2byte _021FD62E - _021FD59A - 2 @ case 1
	.2byte _021FD6C6 - _021FD59A - 2 @ case 2
	.2byte _021FD70C - _021FD59A - 2 @ case 3
	.2byte _021FD740 - _021FD59A - 2 @ case 4
_021FD5A4:
	movs r0, #6
	str r0, [sp]
	movs r0, #0xf
	movs r1, #0x2b
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	movs r1, #5
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201CC08
	ldr r1, [sp, #4]
	ldr r1, [r1, #8]
	blx DC_FlushRange
	ldr r0, [r4]
	movs r1, #5
	adds r2, r6, #0
	bl ov15_021FD43C
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #6
	str r0, [sp]
	movs r0, #0xf
	movs r1, #0x27
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov15_0220005C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD62E:
	movs r0, #6
	str r0, [sp]
	movs r0, #0xf
	movs r1, #0x2c
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	movs r1, #5
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201CC08
	ldr r1, [sp, #4]
	ldr r1, [r1, #8]
	blx DC_FlushRange
	ldr r0, [r4]
	movs r1, #5
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov15_021FD4C0
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #6
	str r0, [sp]
	movs r0, #0xf
	movs r1, #0x2a
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov15_02200294
	adds r0, r4, #0
	bl ov15_021FA098
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0
	bl ov15_0220005C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD6C6:
	movs r0, #6
	str r0, [sp]
	movs r0, #0xf
	movs r1, #0x2d
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	ldr r0, [r4]
	movs r1, #5
	adds r2, r6, #0
	bl ov15_021FD43C
	ldr r0, [r4]
	movs r1, #5
	bl FUN_0201EFBC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD70C:
	movs r0, #6
	str r0, [sp]
	movs r0, #0xf
	movs r1, #0x34
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD740:
	movs r0, #6
	str r0, [sp]
	movs r0, #0xf
	movs r1, #0x35
	movs r2, #0
	add r3, sp, #4
	bl FUN_020079D8
	ldr r3, [sp, #4]
	adds r5, r0, #0
	adds r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	movs r1, #6
	adds r2, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4]
	movs r1, #6
	bl FUN_0201EFBC
	adds r0, r5, #0
	bl FUN_0201AB0C
_021FD770:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FD574

	thumb_func_start ov15_021FD774
ov15_021FD774: @ 0x021FD774
	push {r3, lr}
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x78]
	cmp r0, #0
	beq _021FD786
	bl FUN_02018410
_021FD786:
	pop {r3, pc}
	thumb_func_end ov15_021FD774

	thumb_func_start ov15_021FD788
ov15_021FD788: @ 0x021FD788
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #1
	bne _021FD7C0
	movs r1, #1
	bl ov15_022004DC
	adds r0, r4, #0
	movs r1, #0
	bl ov15_021FF29C
	adds r0, r4, #0
	adds r0, #0x74
	bl FUN_0201D5C8
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0x10
	bl FUN_0200DC4C
	pop {r4, pc}
_021FD7C0:
	movs r1, #0
	bl ov15_022004DC
	adds r0, r4, #0
	bl ov15_021FF844
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021FD788

	thumb_func_start ov15_021FD7D0
ov15_021FD7D0: @ 0x021FD7D0
	push {r4, r5}
	movs r4, #0x25
	lsls r4, r4, #6
	adds r0, r0, r4
	movs r4, #0
	strb r4, [r0, #2]
	strb r1, [r0]
	ldrb r5, [r0, #1]
	movs r4, #0xf
	movs r1, #0xf
	ands r1, r2
	bics r5, r4
	orrs r1, r5
	strb r1, [r0, #1]
	lsls r2, r3, #0x1c
	ldrb r5, [r0, #1]
	movs r1, #0xf0
	lsrs r2, r2, #0x18
	bics r5, r1
	orrs r2, r5
	strb r2, [r0, #1]
	ldr r2, [sp, #8]
	str r2, [r0, #4]
	ldrb r2, [r0, #3]
	bics r2, r4
	strb r2, [r0, #3]
	ldrb r2, [r0, #3]
	bics r2, r1
	strb r2, [r0, #3]
	movs r0, #0x23
	pop {r4, r5}
	bx lr
	thumb_func_end ov15_021FD7D0

	thumb_func_start ov15_021FD810
ov15_021FD810: @ 0x021FD810
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	movs r2, #0x25
	adds r4, r0, #0
	lsls r2, r2, #6
	adds r0, r4, r2
	movs r5, #1
	strb r5, [r0, #2]
	strb r1, [r0]
	str r3, [r0, #4]
	ldrb r5, [r0, #3]
	movs r3, #0xf
	bics r5, r3
	strb r5, [r0, #3]
	ldrb r5, [r0, #3]
	movs r3, #0xf0
	bics r5, r3
	strb r5, [r0, #3]
	lsrs r0, r2, #2
	adds r5, r4, r0
	lsls r4, r1, #2
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_0200DCC0
	ldr r0, [r5, r4]
	adds r1, r6, #0
	bl FUN_0200DC4C
	movs r0, #0x23
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov15_021FD810

	thumb_func_start ov15_021FD850
ov15_021FD850: @ 0x021FD850
	push {r3, r4, r5, lr}
	movs r5, #0x25
	lsls r5, r5, #6
	adds r4, r0, r5
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _021FD874
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r0, r1
	lsrs r0, r5, #2
	ldr r0, [r1, r0]
	bl FUN_0200DCA0
	cmp r0, #0
	bne _021FD936
	ldr r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021FD874:
	ldrb r2, [r4, #3]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	beq _021FD886
	cmp r1, #1
	beq _021FD8B6
	cmp r1, #2
	beq _021FD910
	b _021FD936
_021FD886:
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r0, r1
	lsrs r0, r5, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	ldrb r2, [r4, #3]
	movs r1, #0xf
	adds r0, r2, #0
	bics r0, r1
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0xf
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #3]
	b _021FD936
_021FD8B6:
	adds r1, r2, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1c
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0xf0
	lsls r2, r2, #0x1c
	bics r1, r3
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	cmp r1, #4
	bne _021FD936
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r0, r1
	lsrs r0, r5, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	ldrb r1, [r4, #3]
	movs r0, #0xf0
	bics r1, r0
	strb r1, [r4, #3]
	ldrb r2, [r4, #3]
	movs r1, #0xf
	adds r0, r2, #0
	bics r0, r1
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0xf
	ands r1, r2
	orrs r0, r1
	strb r0, [r4, #3]
	b _021FD936
_021FD910:
	movs r1, #0xf0
	adds r0, r2, #0
	bics r0, r1
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x1c
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x18
	orrs r0, r1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #2
	bne _021FD936
	ldr r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021FD936:
	movs r0, #0x23
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov15_021FD850

	thumb_func_start ov15_021FD93C
ov15_021FD93C: @ 0x021FD93C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	bl FUN_0201F590
	ldr r2, _021FDA94 @ =0x04000060
	ldr r0, _021FDA98 @ =0xFFFFCFFF
	ldrh r1, [r2]
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	blx FUN_020CF82C
	movs r0, #0
	ldr r2, _021FDA9C @ =0x00007FFF
	adds r1, r0, #0
	adds r3, r0, #0
	str r0, [sp]
	blx FUN_020CF910
	ldr r0, _021FDAA0 @ =0x00003DEF
	ldr r1, _021FDAA4 @ =0x0000294A
	movs r2, #0
	blx FUN_020BF084
	ldr r0, _021FDAA0 @ =0x00003DEF
	movs r2, #0
	adds r1, r0, #0
	blx FUN_020BF0A8
	movs r0, #0x1f
	movs r1, #0
	str r0, [sp]
	movs r0, #0xf
	movs r2, #3
	adds r3, r1, #0
	str r1, [sp, #4]
	blx FUN_020BF0CC
	ldr r2, _021FDA94 @ =0x04000060
	ldr r0, _021FDA98 @ =0xFFFFCFFF
	ldrh r1, [r2]
	ands r1, r0
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _021FDAA8 @ =0x02201304
	blx FUN_020CF8E4
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #6
	bl FUN_02023114
	ldr r2, _021FDAAC @ =0x00000818
	ldr r4, _021FDAB0 @ =0x02200500
	str r0, [r5, r2]
	adds r0, r2, #0
	adds r0, #0xec
	adds r3, r5, r0
	ldm r4!, {r0, r1}
	adds r6, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _021FDAB4 @ =0x0220053C
	str r0, [r3]
	adds r0, r2, #0
	adds r0, #0xf8
	adds r3, r5, r0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r3, _021FDAB8 @ =0x0000091C
	ldrb r0, [r5, r3]
	adds r1, r3, #0
	subs r1, #0xc
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	adds r2, r3, #0
	str r0, [sp, #8]
	adds r3, r3, #2
	subs r2, #8
	ldrh r3, [r5, r3]
	ldr r1, [r5, r1]
	adds r0, r6, #0
	adds r2, r5, r2
	bl FUN_02023254
	ldr r0, _021FDABC @ =0x00000934
	ldr r3, _021FDAC0 @ =0x0220050C
	adds r2, r5, r0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _021FDAC4 @ =0x00000808
	adds r0, r5, r0
	bl ov15_021FDAD0
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	ldr r0, _021FDAC4 @ =0x00000808
	adds r1, #0x64
	ldrb r1, [r1]
	adds r0, r5, r0
	movs r2, #7
	adds r1, r1, #1
	bl ov15_021FDAF4
	ldr r2, _021FDAAC @ =0x00000818
	movs r0, #0x7b
	ldr r1, _021FDAC8 @ =0x006A4000
	ldr r2, [r5, r2]
	lsls r0, r0, #0xc
	bl FUN_02023240
	ldr r0, _021FDAAC @ =0x00000818
	ldr r0, [r5, r0]
	bl FUN_0202313C
	movs r6, #1
	ldr r7, _021FDA9C @ =0x00007FFF
	movs r4, #0
	lsls r6, r6, #0xc
_021FDA58:
	movs r2, #0
	adds r0, r4, #0
	adds r1, r6, #0
	adds r3, r2, #0
	blx FUN_020BF034
	adds r0, r4, #0
	adds r1, r7, #0
	blx FUN_020BF070
	adds r4, r4, #1
	cmp r4, #4
	blo _021FDA58
	adds r0, r5, #0
	bl ov15_021FDD70
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r1, _021FDACC @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #2
	orrs r0, r2
	strh r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021FDA94: .4byte 0x04000060
_021FDA98: .4byte 0xFFFFCFFF
_021FDA9C: .4byte 0x00007FFF
_021FDAA0: .4byte 0x00003DEF
_021FDAA4: .4byte 0x0000294A
_021FDAA8: .4byte 0x02201304
_021FDAAC: .4byte 0x00000818
_021FDAB0: .4byte 0x02200500
_021FDAB4: .4byte 0x0220053C
_021FDAB8: .4byte 0x0000091C
_021FDABC: .4byte 0x00000934
_021FDAC0: .4byte 0x0220050C
_021FDAC4: .4byte 0x00000808
_021FDAC8: .4byte 0x006A4000
_021FDACC: .4byte 0x04000008
	thumb_func_end ov15_021FD93C

	thumb_func_start ov15_021FDAD0
ov15_021FDAD0: @ 0x021FDAD0
	movs r2, #0x47
	lsls r2, r2, #2
	movs r3, #0
	str r3, [r0, r2]
	adds r1, r2, #4
	str r3, [r0, r1]
	adds r1, r2, #0
	subs r3, r3, #1
	adds r1, #8
	str r3, [r0, r1]
	adds r1, r2, #0
	movs r3, #7
	adds r1, #0xc
	strh r3, [r0, r1]
	adds r2, #0xe
	strh r3, [r0, r2]
	bx lr
	.align 2, 0
	thumb_func_end ov15_021FDAD0

	thumb_func_start ov15_021FDAF4
ov15_021FDAF4: @ 0x021FDAF4
	push {r4, r5}
	movs r4, #0x4a
	lsls r4, r4, #2
	adds r3, r4, #2
	ldrh r5, [r0, r4]
	ldrh r3, [r0, r3]
	cmp r5, r3
	bne _021FDB22
	adds r3, r4, #0
	subs r3, #8
	ldr r5, [r0, r3]
	adds r3, r4, #0
	subs r3, #0xc
	str r5, [r0, r3]
	adds r3, r4, #0
	subs r3, #8
	str r1, [r0, r3]
	movs r1, #0
	strh r1, [r0, r4]
	adds r1, r4, #2
	strh r2, [r0, r1]
	pop {r4, r5}
	bx lr
_021FDB22:
	subs r2, r4, #4
	str r1, [r0, r2]
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov15_021FDAF4

	thumb_func_start ov15_021FDB2C
ov15_021FDB2C: @ 0x021FDB2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0x90
	adds r2, r1, #0
	adds r1, r0, #0
	ldr r3, _021FDC64 @ =0x02200790
	muls r2, r0, r2
	adds r1, #0x98
	adds r4, r3, r2
	ldrh r2, [r5, r1]
	adds r1, r0, #0
	adds r1, #0x9a
	ldrh r1, [r5, r1]
	cmp r2, r1
	beq _021FDC28
	adds r1, r0, #0
	adds r1, #0x98
	ldrh r1, [r5, r1]
	adds r2, r1, #1
	adds r1, r0, #0
	adds r1, #0x98
	strh r2, [r5, r1]
	adds r1, r0, #0
	adds r1, #0x8c
	adds r0, #0x90
	ldr r1, [r5, r1]
	ldr r0, [r5, r0]
	lsls r1, r1, #4
	lsls r0, r0, #4
	str r1, [sp, #8]
	ldrh r7, [r4, r1]
	ldrh r1, [r4, r0]
	str r0, [sp, #4]
	subs r0, r1, r7
	bpl _021FDB76
	rsbs r0, r0, #0
_021FDB76:
	cmp r1, r7
	bhs _021FDB80
	movs r1, #0
	mvns r1, r1
	b _021FDB82
_021FDB80:
	movs r1, #1
_021FDB82:
	movs r2, #2
	lsls r2, r2, #0xe
	cmp r0, r2
	ble _021FDB94
	lsls r2, r2, #1
	subs r0, r2, r0
	movs r2, #0
	mvns r2, r2
	muls r1, r2, r1
_021FDB94:
	cmp r1, #0
	ldr r2, _021FDC68 @ =0x0000012A
	ble _021FDBB0
	ldrh r1, [r5, r2]
	str r1, [sp]
	subs r1, r2, #2
	ldrh r6, [r5, r1]
	ldr r1, [sp]
	blx FUN_020F2998
	muls r0, r6, r0
	adds r0, r7, r0
	str r0, [sp, #0x14]
	b _021FDBC4
_021FDBB0:
	ldrh r1, [r5, r2]
	str r1, [sp]
	subs r1, r2, #2
	ldrh r6, [r5, r1]
	ldr r1, [sp]
	blx FUN_020F2998
	muls r0, r6, r0
	subs r0, r7, r0
	str r0, [sp, #0x14]
_021FDBC4:
	ldr r0, [sp, #8]
	ldr r1, [sp]
	adds r0, r4, r0
	ldrh r7, [r0, #2]
	ldr r0, [sp, #4]
	adds r0, r4, r0
	ldrh r0, [r0, #2]
	subs r0, r0, r7
	blx FUN_020F2998
	muls r0, r6, r0
	adds r0, r7, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	adds r0, r4, r0
	ldr r7, [r0, #8]
	ldr r0, [sp, #4]
	adds r0, r4, r0
	ldr r0, [r0, #8]
	subs r0, r0, r7
	blx FUN_020F2998
	muls r0, r6, r0
	adds r0, r7, r0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	adds r0, r4, r0
	ldr r7, [r0, #0xc]
	ldr r0, [sp, #4]
	adds r0, r4, r0
	ldr r0, [r0, #0xc]
	subs r0, r0, r7
	blx FUN_020F2998
	muls r0, r6, r0
	adds r1, r7, r0
	movs r0, #0x43
	lsls r0, r0, #2
	ldr r2, [sp, #0x14]
	adds r3, r0, #2
	strh r2, [r5, r0]
	ldr r2, [sp, #0x10]
	strh r2, [r5, r3]
	subs r3, r0, #4
	ldr r2, [sp, #0xc]
	adds r0, #0x24
	str r2, [r5, r3]
	str r1, [r5, r0]
_021FDC28:
	movs r1, #0x4a
	lsls r1, r1, #2
	adds r0, r1, #2
	ldrh r2, [r5, r1]
	ldrh r0, [r5, r0]
	cmp r2, r0
	bne _021FDC60
	subs r0, r1, #4
	movs r2, #0
	ldr r0, [r5, r0]
	mvns r2, r2
	cmp r0, r2
	beq _021FDC60
	adds r0, r1, #0
	subs r0, #8
	ldr r3, [r5, r0]
	adds r0, r1, #0
	subs r0, #0xc
	str r3, [r5, r0]
	subs r0, r1, #4
	ldr r3, [r5, r0]
	adds r0, r1, #0
	subs r0, #8
	str r3, [r5, r0]
	subs r0, r1, #4
	str r2, [r5, r0]
	movs r0, #0
	strh r0, [r5, r1]
_021FDC60:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FDC64: .4byte 0x02200790
_021FDC68: .4byte 0x0000012A
	thumb_func_end ov15_021FDB2C

	thumb_func_start ov15_021FDC6C
ov15_021FDC6C: @ 0x021FDC6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FDF20
	ldr r0, _021FDC84 @ =0x00000818
	ldr r0, [r4, r0]
	bl FUN_02023120
	bl FUN_0201F63C
	pop {r4, pc}
	nop
_021FDC84: .4byte 0x00000818
	thumb_func_end ov15_021FDC6C

	thumb_func_start ov15_021FDC88
ov15_021FDC88: @ 0x021FDC88
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r4, _021FDD34 @ =0x022005CC
	adds r5, r0, #0
	add r3, sp, #0x18
	movs r2, #4
_021FDC94:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021FDC94
	ldr r0, [r4]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021FDD38 @ =0x022004F4
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021FDD3C @ =0x00000615
	str r0, [r2]
	ldr r0, _021FDD40 @ =0x00000808
	ldrb r1, [r5, r1]
	adds r0, r5, r0
	bl ov15_021FDB2C
	ldr r3, _021FDD44 @ =0x0000091C
	ldr r2, _021FDD48 @ =0x00000818
	ldrb r0, [r5, r3]
	adds r1, r2, #0
	adds r3, r3, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	adds r1, #0xf8
	str r0, [sp, #8]
	adds r0, r2, #0
	adds r0, #0xec
	adds r2, #0xfc
	ldrh r3, [r5, r3]
	ldr r1, [r5, r1]
	adds r0, r5, r0
	adds r2, r5, r2
	bl FUN_02023254
	bl FUN_02026E48
	bl FUN_02023154
	ldr r0, _021FDD4C @ =0x0000081C
	adds r4, r5, r0
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xa0
	ldr r0, [r0]
	bl ov15_021FDD54
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xc0
	ldr r0, [r0]
	bl ov15_021FDD54
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r0, [r0]
	bl ov15_021FDD54
	ldr r1, _021FDD50 @ =0x00000934
	adds r0, r4, #0
	adds r1, r5, r1
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl FUN_0201F554
	movs r0, #0
	adds r1, r0, #0
	bl FUN_02026E50
	add sp, #0x3c
	pop {r4, r5, pc}
	.align 2, 0
_021FDD34: .4byte 0x022005CC
_021FDD38: .4byte 0x022004F4
_021FDD3C: .4byte 0x00000615
_021FDD40: .4byte 0x00000808
_021FDD44: .4byte 0x0000091C
_021FDD48: .4byte 0x00000818
_021FDD4C: .4byte 0x0000081C
_021FDD50: .4byte 0x00000934
	thumb_func_end ov15_021FDC88

	thumb_func_start ov15_021FDD54
ov15_021FDD54: @ 0x021FDD54
	movs r1, #1
	ldr r2, [r0]
	lsls r1, r1, #0xc
	adds r2, r2, r1
	ldr r1, [r0, #8]
	ldrh r1, [r1, #4]
	lsls r1, r1, #0xc
	cmp r2, r1
	bge _021FDD6A
	str r2, [r0]
	bx lr
_021FDD6A:
	movs r1, #0
	str r1, [r0]
	bx lr
	thumb_func_end ov15_021FDD54

	thumb_func_start ov15_021FDD70
ov15_021FDD70: @ 0x021FDD70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r0, #0
	movs r0, #0xf
	movs r1, #6
	bl FUN_02007688
	str r0, [sp, #0x10]
	ldr r0, _021FDF14 @ =0x00000808
	movs r1, #6
	adds r0, r7, r0
	movs r2, #4
	bl FUN_0201AC14
	ldr r0, _021FDF18 @ =0x0000081C
	adds r4, r7, r0
	ldr r0, _021FDF1C @ =0x00000615
	ldrb r0, [r7, r0]
	cmp r0, #0
	bne _021FDDA8
	movs r0, #0x39
	str r0, [sp, #8]
	movs r0, #0x41
	str r0, [sp, #4]
	movs r0, #0x49
	movs r1, #0x37
	str r0, [sp]
	b _021FDDB6
_021FDDA8:
	movs r0, #0x4c
	str r0, [sp, #8]
	movs r0, #0x54
	str r0, [sp, #4]
	movs r0, #0x5c
	movs r1, #0x4a
	str r0, [sp]
_021FDDB6:
	ldr r0, [sp, #0x10]
	movs r2, #6
	bl FUN_0200771C
	adds r1, r4, #0
	adds r2, r4, #0
	str r0, [r4, #0x58]
	adds r0, r4, #0
	adds r1, #0x54
	adds r2, #0x58
	bl FUN_0201F51C
	ldr r0, [r4, #0x58]
	blx FUN_020C3B50
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x54]
	movs r1, #1
	movs r2, #0x40
	blx FUN_020C2BAC
	ldr r0, [r4, #0x54]
	movs r1, #1
	movs r2, #0x80
	blx FUN_020C2BAC
	movs r1, #1
	ldr r0, [r4, #0x54]
	lsls r2, r1, #9
	blx FUN_020C2BAC
	movs r1, #1
	ldr r0, [r4, #0x54]
	lsls r2, r1, #0xa
	blx FUN_020C2BAC
	movs r2, #0x3f
	ldr r0, [r4, #0x54]
	movs r1, #1
	lsls r2, r2, #0x18
	blx FUN_020C2C54
	movs r6, #0
	adds r5, r4, #0
_021FDE0E:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	adds r1, r1, r6
	movs r2, #6
	bl FUN_0200771C
	movs r1, #0
	str r0, [r5, #0x5c]
	blx FUN_020C3B90
	str r0, [sp, #0x14]
	ldr r0, _021FDF14 @ =0x00000808
	ldr r1, [sp, #0x14]
	ldr r2, [r4, #0x54]
	adds r0, r7, r0
	blx FUN_020C2B7C
	adds r1, r5, #0
	adds r1, #0xa0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	blx FUN_020BE008
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x10]
	adds r1, r1, r6
	movs r2, #6
	bl FUN_0200771C
	movs r1, #0
	str r0, [r5, #0x7c]
	blx FUN_020C3B90
	str r0, [sp, #0x18]
	ldr r0, _021FDF14 @ =0x00000808
	ldr r1, [sp, #0x18]
	ldr r2, [r4, #0x54]
	adds r0, r7, r0
	blx FUN_020C2B7C
	adds r1, r5, #0
	adds r1, #0xc0
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	blx FUN_020BE008
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #8
	blo _021FDE0E
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	movs r2, #6
	bl FUN_0200771C
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r1, #0
	blx FUN_020C3B90
	adds r5, r0, #0
	ldr r0, _021FDF14 @ =0x00000808
	ldr r2, [r4, #0x54]
	adds r0, r7, r0
	adds r1, r5, #0
	blx FUN_020C2B7C
	adds r1, r4, #0
	adds r1, #0xe0
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r0, [r0]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	adds r1, r5, #0
	blx FUN_020BE008
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	adds r0, #0x64
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe4
	str r1, [r0]
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xa0
	ldr r1, [r1]
	blx FUN_020BE294
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xc0
	ldr r1, [r1]
	blx FUN_020BE294
	adds r0, r4, #0
	adds r4, #0xe0
	ldr r1, [r4]
	blx FUN_020BE294
	ldr r0, [sp, #0x10]
	bl FUN_0200770C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021FDF14: .4byte 0x00000808
_021FDF18: .4byte 0x0000081C
_021FDF1C: .4byte 0x00000615
	thumb_func_end ov15_021FDD70

	thumb_func_start ov15_021FDF20
ov15_021FDF20: @ 0x021FDF20
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _021FDF80 @ =0x0000081C
	ldr r7, _021FDF84 @ =0x00000808
	adds r0, r5, r0
	str r0, [sp]
	movs r6, #0
	adds r4, r0, #0
_021FDF30:
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r1, [r1]
	adds r0, r5, r7
	blx FUN_020C2BA0
	adds r1, r4, #0
	adds r1, #0xc0
	ldr r1, [r1]
	adds r0, r5, r7
	blx FUN_020C2BA0
	ldr r0, [r4, #0x5c]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x7c]
	bl FUN_0201AB0C
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #8
	blo _021FDF30
	ldr r1, [sp]
	ldr r0, _021FDF84 @ =0x00000808
	adds r1, #0xe0
	ldr r1, [r1]
	adds r0, r5, r0
	blx FUN_020C2BA0
	ldr r0, [sp]
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, [sp]
	ldr r0, [r0, #0x58]
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FDF80: .4byte 0x0000081C
_021FDF84: .4byte 0x00000808
	thumb_func_end ov15_021FDF20

	thumb_func_start ov15_021FDF88
ov15_021FDF88: @ 0x021FDF88
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _021FE01C @ =0x0000081C
	adds r4, r5, r0
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xc0
	ldr r1, [r1]
	blx FUN_020BE388
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xa0
	ldr r1, [r1]
	blx FUN_020BE388
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x64
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe4
	str r1, [r0]
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	movs r0, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xa0
	ldr r1, [r1]
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xc0
	ldr r1, [r1]
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xe0
	ldr r1, [r1]
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xa0
	ldr r1, [r1]
	blx FUN_020BE294
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r4, #0
	lsls r1, r1, #2
	adds r1, r4, r1
	adds r1, #0xc0
	ldr r1, [r1]
	blx FUN_020BE294
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FE01C: .4byte 0x0000081C
	thumb_func_end ov15_021FDF88

	thumb_func_start ov15_021FE020
ov15_021FE020: @ 0x021FE020
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	movs r2, #1
	str r2, [sp, #0x10]
	ldr r0, [r4]
	adds r1, r4, #4
	movs r3, #0
	bl FUN_0201D40C
	movs r0, #0xd
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0xc1
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x14
	movs r2, #1
	movs r3, #0
	bl FUN_0201D40C
	movs r1, #1
	str r1, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x24
	movs r2, #4
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r4, #0
	str r2, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x53
	str r0, [sp, #0x10]
	ldr r0, [r4]
	adds r1, #0x34
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0xd
	str r0, [sp]
	movs r0, #0xc
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0xdb
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x44
	movs r2, #1
	movs r3, #0x13
	bl FUN_0201D40C
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _021FE150 @ =0x0000012B
	adds r1, r4, #0
	str r0, [sp, #0x10]
	movs r2, #1
	ldr r0, [r4]
	adds r1, #0x54
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x37
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x64
	movs r2, #4
	movs r3, #0xa
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	movs r0, #0x45
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4]
	adds r1, #0x74
	movs r2, #4
	movs r3, #0x18
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x74
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0
	adds r1, r2, #0
_021FE13E:
	adds r0, r4, #0
	adds r0, #0xb4
	adds r2, r2, #1
	adds r4, #0x10
	str r1, [r0]
	cmp r2, #0x18
	blt _021FE13E
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_021FE150: .4byte 0x0000012B
	thumb_func_end ov15_021FE020

	thumb_func_start ov15_021FE154
ov15_021FE154: @ 0x021FE154
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	adds r4, r6, #4
_021FE15C:
	lsls r0, r5, #4
	adds r0, r4, r0
	bl FUN_0201D520
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #8
	blo _021FE15C
	adds r0, r6, #0
	bl ov15_021FE3E0
	adds r0, r6, #0
	bl ov15_021FE1D0
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FE154

	thumb_func_start ov15_021FE17C
ov15_021FE17C: @ 0x021FE17C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	bne _021FE1C8
	adds r5, r7, #0
	ldr r4, _021FE1CC @ =0x02200908
	movs r6, #0
	adds r5, #0xb4
_021FE192:
	ldr r0, [r4, #4]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	movs r2, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r6, r6, #1
	adds r4, #0xc
	adds r5, #0x10
	cmp r6, #0xc
	blt _021FE192
_021FE1C8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021FE1CC: .4byte 0x02200908
	thumb_func_end ov15_021FE17C

	thumb_func_start ov15_021FE1D0
ov15_021FE1D0: @ 0x021FE1D0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	beq _021FE200
	movs r6, #0
	adds r4, r5, #0
	adds r4, #0xb4
	adds r7, r6, #0
_021FE1E4:
	adds r0, r4, #0
	bl FUN_0201D8E4
	adds r0, r4, #0
	bl FUN_0201D520
	adds r0, r5, #0
	adds r0, #0xb4
	adds r6, r6, #1
	str r7, [r0]
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #0xc
	blt _021FE1E4
_021FE200:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov15_021FE1D0

	thumb_func_start ov15_021FE204
ov15_021FE204: @ 0x021FE204
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	movs r3, #0x5d
	lsls r3, r3, #2
	str r0, [sp, #0x14]
	ldr r0, [r0, r3]
	cmp r0, #0
	beq _021FE216
	b _021FE3BC
_021FE216:
	movs r0, #7
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _021FE3C0 @ =0x000002CF
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r1, r1, r3
	ldr r0, [r0]
	movs r3, #0xc
	bl FUN_0201D40C
	movs r1, #0x5d
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	ldr r4, _021FE3C4 @ =0x0000031B
	str r0, [sp, #0x18]
	adds r0, #0xb4
	ldr r5, _021FE3C8 @ =0x022008E8
	movs r6, #0
	str r0, [sp, #0x18]
_021FE252:
	adds r0, r6, #0
	adds r0, #0xd
	lsls r7, r0, #4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0]
	lsls r3, r3, #0x18
	adds r1, r1, r7
	movs r2, #4
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r0, [sp, #0x18]
	movs r1, #0
	adds r0, r0, r7
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #0x14
	adds r5, #8
	cmp r6, #4
	blt _021FE252
	ldr r0, [sp, #0x14]
	ldr r4, _021FE3CC @ =0x000002FB
	str r0, [sp, #0x1c]
	adds r0, #0xb4
	ldr r5, _021FE3D0 @ =0x022008D0
	movs r6, #0
	str r0, [sp, #0x1c]
_021FE2A8:
	adds r0, r6, #0
	adds r0, #0x11
	lsls r7, r0, #4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0]
	lsls r3, r3, #0x18
	adds r1, r1, r7
	movs r2, #4
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r0, [sp, #0x1c]
	movs r1, #0
	adds r0, r0, r7
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, r4, #6
	adds r5, #8
	cmp r6, #3
	blt _021FE2A8
	movs r0, #0x15
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3D4 @ =0x0000030D
	movs r2, #0x7d
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r0, [r0]
	movs r2, #4
	movs r3, #0xe
	bl FUN_0201D40C
	movs r1, #0x7d
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	movs r0, #0x12
	str r0, [sp, #4]
	movs r2, #4
	movs r4, #0x81
	str r2, [sp, #8]
	movs r3, #0xb
	ldr r0, _021FE3C4 @ =0x0000031B
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsls r4, r4, #2
	ldr r0, [r0]
	adds r1, r1, r4
	bl FUN_0201D40C
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	movs r3, #0
	str r3, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r2, #4
	str r2, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3D8 @ =0x00000363
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r4, #0x10
	ldr r0, [r0]
	adds r1, r1, r4
	bl FUN_0201D40C
	movs r1, #0x85
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0xe
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3DC @ =0x00000387
	movs r2, #0x89
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsls r2, r2, #2
	adds r1, r1, r2
	ldr r0, [r0]
	movs r2, #4
	movs r3, #0x18
	bl FUN_0201D40C
	movs r1, #0x89
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
_021FE3BC:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FE3C0: .4byte 0x000002CF
_021FE3C4: .4byte 0x0000031B
_021FE3C8: .4byte 0x022008E8
_021FE3CC: .4byte 0x000002FB
_021FE3D0: .4byte 0x022008D0
_021FE3D4: .4byte 0x0000030D
_021FE3D8: .4byte 0x00000363
_021FE3DC: .4byte 0x00000387
	thumb_func_end ov15_021FE204

	thumb_func_start ov15_021FE3E0
ov15_021FE3E0: @ 0x021FE3E0
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _021FE4C6
	ldr r5, [sp]
	movs r4, #0
	adds r6, r5, #0
	adds r6, #0xb4
_021FE3F6:
	adds r0, r4, #0
	adds r0, #0x11
	lsls r7, r0, #4
	adds r0, r6, r7
	bl FUN_0201D8E4
	adds r0, r6, r7
	bl FUN_0201D520
	movs r0, #0x71
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _021FE3F6
	adds r1, r0, #0
	ldr r0, [sp]
	adds r1, #0x60
	adds r0, r0, r1
	bl FUN_0201D8E4
	movs r1, #0x89
	ldr r0, [sp]
	lsls r1, r1, #2
	adds r0, r0, r1
	bl FUN_0201D520
	movs r1, #0x89
	ldr r0, [sp]
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r0, r1]
	subs r1, #0x10
	adds r0, r0, r1
	bl FUN_0201D520
	movs r1, #0x85
	ldr r0, [sp]
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r0, r1]
	subs r1, #0x10
	adds r0, r0, r1
	bl FUN_0201D520
	movs r1, #0x81
	ldr r0, [sp]
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r0, r1]
	subs r1, #0x10
	adds r0, r0, r1
	bl FUN_0201D8E4
	movs r1, #0x7d
	ldr r0, [sp]
	lsls r1, r1, #2
	adds r0, r0, r1
	bl FUN_0201D520
	ldr r0, [sp]
	movs r1, #0x7d
	adds r6, r0, #0
	movs r5, #0
	lsls r1, r1, #2
	str r5, [r0, r1]
	adds r4, r0, #0
	adds r6, #0xb4
_021FE482:
	adds r0, r5, #0
	adds r0, #0xd
	lsls r7, r0, #4
	adds r0, r6, r7
	bl FUN_0201D8E4
	adds r0, r6, r7
	bl FUN_0201D520
	movs r0, #0x61
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r5, r5, #1
	adds r4, #0x10
	cmp r5, #4
	blt _021FE482
	adds r1, r0, #0
	ldr r0, [sp]
	subs r1, #0x10
	adds r0, r0, r1
	bl FUN_0201D8E4
	movs r1, #0x5d
	ldr r0, [sp]
	lsls r1, r1, #2
	adds r0, r0, r1
	bl FUN_0201D520
	movs r1, #0x5d
	ldr r0, [sp]
	movs r2, #0
	lsls r1, r1, #2
	str r2, [r0, r1]
_021FE4C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FE3E0

	thumb_func_start ov15_021FE4C8
ov15_021FE4C8: @ 0x021FE4C8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xe1
	movs r3, #6
	bl FUN_0200BAF8
	ldr r7, _021FE500 @ =0x000005F4
	adds r6, r0, #0
	movs r4, #0
_021FE4DE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0200BBA0
	lsls r1, r4, #2
	adds r1, r5, r1
	str r0, [r1, r7]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #8
	blo _021FE4DE
	adds r0, r6, #0
	bl FUN_0200BB44
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FE500: .4byte 0x000005F4
	thumb_func_end ov15_021FE4C8

	thumb_func_start ov15_021FE504
ov15_021FE504: @ 0x021FE504
	push {r4, r5, r6, lr}
	ldr r6, _021FE524 @ =0x000005F4
	adds r5, r0, #0
	movs r4, #0
_021FE50C:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_02026380
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #8
	blo _021FE50C
	pop {r4, r5, r6, pc}
	nop
_021FE524: .4byte 0x000005F4
	thumb_func_end ov15_021FE504

	thumb_func_start ov15_021FE528
ov15_021FE528: @ 0x021FE528
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r4, #0
	movs r6, #0xd
	movs r7, #1
_021FE534:
	str r6, [sp]
	str r7, [sp, #4]
	adds r2, r4, #0
	adds r2, #0xcd
	lsls r2, r2, #0x10
	lsls r3, r4, #0x18
	str r7, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	ldr r0, [r5]
	movs r1, #3
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	movs r0, #0xe
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r0, #4
	adds r2, #0xf1
	str r0, [sp, #0xc]
	lsls r2, r2, #0x10
	lsls r3, r4, #0x18
	ldr r0, [r5]
	movs r1, #3
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xc
	blo _021FE534
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov15_021FE528

	thumb_func_start ov15_021FE584
ov15_021FE584: @ 0x021FE584
	push {r3, r4, r5, lr}
	lsls r1, r1, #0x10
	adds r4, r2, #0
	lsrs r1, r1, #0x10
	movs r2, #0
	adds r5, r0, #0
	bl ov15_021F9D60
	adds r2, r0, #0
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200C0CC
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FE584

	thumb_func_start ov15_021FE5A4
ov15_021FE5A4: @ 0x021FE5A4
	push {r3, r4, r5, lr}
	lsls r1, r1, #0x10
	adds r4, r2, #0
	lsrs r1, r1, #0x10
	movs r2, #0
	adds r5, r0, #0
	bl ov15_021F9D60
	adds r2, r0, #0
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200C134
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FE5A4

	thumb_func_start ov15_021FE5C4
ov15_021FE5C4: @ 0x021FE5C4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _021FE618 @ =0x0000FFFF
	adds r6, r1, #0
	cmp r6, r0
	beq _021FE5E6
	movs r0, #0x82
	movs r1, #6
	bl FUN_02026354
	adds r1, r6, #0
	movs r2, #6
	adds r4, r0, #0
	bl FUN_02077D64
	b _021FE5F4
_021FE5E6:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x61
	bl FUN_0200BBA0
	adds r4, r0, #0
_021FE5F4:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE61C @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #4
	movs r3, #0x14
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FE618: .4byte 0x0000FFFF
_021FE61C: .4byte 0x000F0E00
	thumb_func_end ov15_021FE5C4

	thumb_func_start ov15_021FE620
ov15_021FE620: @ 0x021FE620
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r5, #0
	adds r0, r1, #0
	adds r4, #0x14
	bl FUN_02078000
	str r0, [sp, #0x10]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x65
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x59
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x5c
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r3, #0x48
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x5a
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r3, #0xa8
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x5b
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0xa8
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, [sp, #0x10]
	movs r1, #0
	bl FUN_0207332C
	adds r7, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x5d
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	adds r2, r7, #0
	movs r3, #2
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FE864 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	movs r1, #0
	str r0, [sp, #8]
	ldr r2, _021FE864 @ =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r3, #0x30
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	movs r1, #2
	bl FUN_02073314
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #1
	bhi _021FE790
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x19
	bl FUN_0200BBA0
	b _021FE79C
_021FE790:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x5e
	bl FUN_0200BBA0
_021FE79C:
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r7, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FE864 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	ldr r2, _021FE864 @ =0x000005E4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r3, #0xe8
	bl FUN_020200FC
	ldr r0, [sp, #0x10]
	movs r1, #4
	bl FUN_02073314
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	bne _021FE800
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x19
	bl FUN_0200BBA0
	b _021FE80C
_021FE800:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x5e
	bl FUN_0200BBA0
_021FE80C:
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r7, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FE864 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 @ =0x000F0E00
	movs r1, #0
	str r0, [sp, #8]
	ldr r2, _021FE864 @ =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r3, #0xe8
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021FE860: .4byte 0x000F0E00
_021FE864: .4byte 0x000005E4
	thumb_func_end ov15_021FE620

	thumb_func_start ov15_021FE868
ov15_021FE868: @ 0x021FE868
	ldr r3, _021FE870 @ =FUN_0201D8E4
	adds r0, #0x14
	bx r3
	nop
_021FE870: .4byte FUN_0201D8E4
	thumb_func_end ov15_021FE868

	thumb_func_start ov15_021FE874
ov15_021FE874: @ 0x021FE874
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x27
	bl FUN_0200BBA0
	ldr r1, _021FE89C @ =0x000005E8
	str r0, [r4, r1]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x26
	bl FUN_0200BBA0
	ldr r1, _021FE8A0 @ =0x000005EC
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_021FE89C: .4byte 0x000005E8
_021FE8A0: .4byte 0x000005EC
	thumb_func_end ov15_021FE874

	thumb_func_start ov15_021FE8A4
ov15_021FE8A4: @ 0x021FE8A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021FE8BC @ =0x000005E8
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _021FE8C0 @ =0x000005EC
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	nop
_021FE8BC: .4byte 0x000005E8
_021FE8C0: .4byte 0x000005EC
	thumb_func_end ov15_021FE8A4

	thumb_func_start ov15_021FE8C4
ov15_021FE8C4: @ 0x021FE8C4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xa
	movs r1, #6
	bl FUN_02026354
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r2, r6, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r2, _021FE910 @ =0x000005EC
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	adds r1, r4, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_021FE910: .4byte 0x000005EC
	thumb_func_end ov15_021FE8C4

	thumb_func_start ov15_021FE914
ov15_021FE914: @ 0x021FE914
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r2, #0
	adds r6, r1, #0
	adds r5, r0, #0
	movs r0, #0x69
	ldrh r1, [r7]
	lsls r0, r0, #2
	adds r4, r3, #0
	cmp r1, r0
	bhs _021FE95E
	subs r0, #0x5d
	subs r0, r1, r0
	movs r1, #2
	lsls r0, r0, #0x10
	str r1, [sp]
	lsrs r2, r0, #0x10
	str r6, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #5
	str r0, [sp, #0xc]
	movs r0, #0xbb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r3, r1, #0
	bl FUN_0200CE7C
	lsls r2, r4, #0x10
	ldrh r1, [r7, #2]
	ldr r3, _021FE98C @ =0x00010200
	adds r0, r5, #0
	lsrs r2, r2, #0x10
	bl ov15_021FE8C4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FE95E:
	subs r0, r0, #1
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	str r6, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #5
	str r0, [sp, #8]
	movs r0, #0xbb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r2, #2
	movs r3, #1
	bl FUN_0200CDF0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl ov15_021FE9B0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FE98C: .4byte 0x00010200
	thumb_func_end ov15_021FE914

	thumb_func_start ov15_021FE990
ov15_021FE990: @ 0x021FE990
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0x91
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0x25
	movs r2, #6
	bl FUN_0200771C
	adds r1, r4, #0
	adds r5, r0, #0
	blx FUN_020B70F4
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov15_021FE990

	thumb_func_start ov15_021FE9B0
ov15_021FE9B0: @ 0x021FE9B0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	add r1, sp, #0x18
	adds r4, r2, #0
	bl ov15_021FE990
	adds r6, r0, #0
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x10
	movs r2, #0
	str r0, [sp, #4]
	lsls r1, r4, #0x10
	str r2, [sp, #8]
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0x18
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	ldr r1, [r1, #0x14]
	adds r3, r2, #0
	bl FUN_0201D9D8
	movs r0, #6
	adds r1, r6, #0
	bl FUN_0201AB80
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov15_021FE9B0

	thumb_func_start ov15_021FE9F0
ov15_021FE9F0: @ 0x021FE9F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r1, #0
	add r1, sp, #0x18
	adds r4, r2, #0
	adds r6, r3, #0
	bl ov15_021FE990
	adds r7, r0, #0
	cmp r6, #0
	bne _021FEA2C
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x10
	lsls r1, r4, #0x10
	str r0, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0x28
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	ldr r1, [r1, #0x14]
	movs r2, #0x18
	bl FUN_0201D9D8
	b _021FEA50
_021FEA2C:
	movs r0, #0x68
	str r0, [sp]
	movs r0, #0x10
	lsls r1, r4, #0x10
	str r0, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	movs r1, #0x28
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	ldr r1, [r1, #0x14]
	movs r2, #0x40
	bl FUN_0201D9D8
_021FEA50:
	movs r0, #6
	adds r1, r7, #0
	bl FUN_0201AB80
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FE9F0

	thumb_func_start ov15_021FEA5C
ov15_021FEA5C: @ 0x021FEA5C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200BBA0
	movs r1, #3
	lsls r1, r1, #8
	str r0, [r4, r1]
	subs r1, #0x10
	ldr r0, [r4, r1]
	movs r1, #6
	bl FUN_0200BBA0
	movs r1, #0xc1
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x14
	ldr r0, [r4, r1]
	movs r1, #0x10
	bl FUN_0200BBA0
	movs r1, #0xc2
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x18
	ldr r0, [r4, r1]
	movs r1, #0x62
	bl FUN_0200BBA0
	movs r1, #0xc3
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x1c
	ldr r0, [r4, r1]
	movs r1, #0x63
	bl FUN_0200BBA0
	movs r1, #0x31
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r1, #0x20
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0200BBA0
	movs r1, #0xc5
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x24
	ldr r0, [r4, r1]
	movs r1, #2
	bl FUN_0200BBA0
	movs r1, #0xc6
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x28
	ldr r0, [r4, r1]
	movs r1, #0x12
	bl FUN_0200BBA0
	movs r1, #0xc7
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x2c
	ldr r0, [r4, r1]
	movs r1, #3
	bl FUN_0200BBA0
	movs r1, #0x32
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r1, #0x30
	ldr r0, [r4, r1]
	movs r1, #4
	bl FUN_0200BBA0
	movs r1, #0xc9
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x34
	ldr r0, [r4, r1]
	movs r1, #5
	bl FUN_0200BBA0
	movs r1, #0xca
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x38
	ldr r0, [r4, r1]
	movs r1, #8
	bl FUN_0200BBA0
	movs r1, #0xcb
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x3c
	ldr r0, [r4, r1]
	movs r1, #0x4b
	bl FUN_0200BBA0
	movs r1, #0x33
	lsls r1, r1, #4
	str r0, [r4, r1]
	subs r1, #0x40
	ldr r0, [r4, r1]
	movs r1, #0x56
	bl FUN_0200BBA0
	movs r1, #0xcd
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x44
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_0200BBA0
	movs r1, #0xce
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x48
	ldr r0, [r4, r1]
	movs r1, #0x80
	bl FUN_0200BBA0
	movs r1, #0xcf
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov15_021FEA5C

	thumb_func_start ov15_021FEB64
ov15_021FEB64: @ 0x021FEB64
	push {r4, r5, r6, lr}
	movs r6, #3
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #8
_021FEB6E:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, r6]
	bl FUN_02026380
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x10
	blo _021FEB6E
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FEB64

	thumb_func_start ov15_021FEB84
ov15_021FEB84: @ 0x021FEB84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r2, [r5, r0]
	adds r0, r2, #0
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r0, r2, r0
	ldrb r0, [r0, #0xc]
	cmp r0, #3
	bne _021FEBDC
	adds r0, r5, #0
	adds r0, #0x14
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, #0x66
	ldrh r1, [r1]
	bl ov15_021FE620
	adds r0, r5, #4
	bl FUN_0201D5C8
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, #0x66
	ldrh r1, [r1]
	movs r2, #1
	bl ov15_021FF97C
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021F9C78
_021FEBDC:
	adds r0, r5, #0
	ldr r2, _021FEC98 @ =0x000003E2
	adds r0, #0x24
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E998
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	adds r0, r1, #0
	adds r0, #0x64
	ldrb r2, [r0]
	movs r0, #0xc
	adds r3, r1, #4
	muls r0, r2, r0
	adds r4, r3, r0
	adds r0, r1, #0
	adds r0, #0x65
	ldrb r0, [r0]
	cmp r0, #6
	bne _021FEC30
	adds r1, #0x66
	ldrb r0, [r4, #8]
	ldrh r1, [r1]
	bl ov15_021FD3F0
	cmp r0, #0
	bne _021FEC30
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x6a
	bl FUN_0200BBA0
	adds r7, r0, #0
	b _021FEC3E
_021FEC30:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x2b
	bl FUN_0200BBA0
	adds r7, r0, #0
_021FEC3E:
	movs r0, #0x6c
	movs r1, #6
	bl FUN_02026354
	movs r1, #6
	ldrsh r2, [r4, r1]
	ldr r1, _021FEC9C @ =0x00000644
	adds r6, r0, #0
	ldr r1, [r5, r1]
	adds r0, r5, #0
	adds r1, r2, r1
	subs r1, #8
	movs r2, #0
	bl ov15_021FE584
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #8]
	bl FUN_020200A8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	adds r5, #0x24
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021FEC98: .4byte 0x000003E2
_021FEC9C: .4byte 0x00000644
	thumb_func_end ov15_021FEB84

	thumb_func_start ov15_021FECA0
ov15_021FECA0: @ 0x021FECA0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r4, r2, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	lsls r1, r4, #0x10
	adds r0, r6, #0
	lsrs r1, r1, #0x10
	bl ov15_021FE5C4
	adds r0, r5, #0
	bl FUN_0201D5C8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov15_021FECA0

	thumb_func_start ov15_021FECC4
ov15_021FECC4: @ 0x021FECC4
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	bl FUN_0201D5C8
	pop {r4, pc}
	thumb_func_end ov15_021FECC4

	thumb_func_start ov15_021FECD8
ov15_021FECD8: @ 0x021FECD8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	adds r2, #0x78
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FED20 @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r3, #0x14
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021FED20: .4byte 0x000F0E00
	thumb_func_end ov15_021FECD8

	thumb_func_start ov15_021FED24
ov15_021FED24: @ 0x021FED24
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x24
	movs r1, #1
	bl FUN_0200E9BC
	adds r4, #0x24
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021FED24

	thumb_func_start ov15_021FED3C
ov15_021FED3C: @ 0x021FED3C
	push {r4, lr}
	adds r4, r0, #0
	bl ov15_021FED24
	adds r0, r4, #0
	bl ov15_021FE3E0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov15_021FF97C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov15_021FED3C

	thumb_func_start ov15_021FED58
ov15_021FED58: @ 0x021FED58
	ldr r3, _021FED5C @ =ov15_021FE3E0
	bx r3
	.align 2, 0
_021FED5C: .4byte ov15_021FE3E0
	thumb_func_end ov15_021FED58

	thumb_func_start ov15_021FED60
ov15_021FED60: @ 0x021FED60
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, #0x24
	movs r1, #0xff
	bl FUN_0201D978
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x2e
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #0x82
	movs r1, #6
	bl FUN_02026354
	ldr r1, _021FEDE0 @ =0x00000672
	adds r4, r0, #0
	ldrb r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #0
	bl ov15_021FE584
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	ldr r2, _021FEDE4 @ =0x000003E2
	adds r0, #0x24
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FEDE8 @ =0x00010200
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x24
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r5, #0x24
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021FEDE0: .4byte 0x00000672
_021FEDE4: .4byte 0x000003E2
_021FEDE8: .4byte 0x00010200
	thumb_func_end ov15_021FED60

	thumb_func_start ov15_021FEDEC
ov15_021FEDEC: @ 0x021FEDEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0x1a
	lsls r0, r0, #6
	str r1, [sp, #0x10]
	ldrsh r1, [r5, r0]
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r1, r0
	blt _021FEE06
	bl GF_AssertFail
_021FEE06:
	movs r0, #2
	movs r1, #6
	bl FUN_02026354
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #2
	bne _021FEE1A
	movs r4, #0xa
	b _021FEE1C
_021FEE1A:
	movs r4, #0x64
_021FEE1C:
	movs r0, #0x1a
	lsls r0, r0, #6
	ldrsh r7, [r5, r0]
	ldr r0, [sp, #0x10]
	movs r6, #0
	cmp r0, #0
	bls _021FEE96
	adds r5, #0xb4
_021FEE2C:
	adds r0, r7, #0
	adds r1, r4, #0
	blx FUN_020F2BA4
	str r0, [sp, #0x18]
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	movs r2, #1
	movs r3, #0
	bl FUN_02026464
	ldr r0, [sp, #0x18]
	adds r1, r0, #0
	muls r1, r4, r1
	subs r7, r7, r1
	adds r0, r4, #0
	movs r1, #0xa
	blx FUN_020F2BA4
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x11
	lsls r0, r0, #4
	str r0, [sp, #0x1c]
	adds r0, r5, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FEEA0 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x14]
	adds r0, r5, r0
	adds r3, r1, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	adds r0, r5, r0
	bl FUN_0201D5C8
	ldr r0, [sp, #0x10]
	adds r6, r6, #1
	cmp r6, r0
	blo _021FEE2C
_021FEE96:
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FEEA0: .4byte 0x00010200
	thumb_func_end ov15_021FEDEC

	thumb_func_start ov15_021FEEA4
ov15_021FEEA4: @ 0x021FEEA4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x37
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #0x1a
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	lsls r3, r3, #6
	muls r0, r1, r0
	adds r1, r2, r0
	ldrsh r0, [r5, r3]
	cmp r0, #1
	ble _021FEEEA
	movs r2, #6
	ldrsh r2, [r1, r2]
	subs r3, #0x3c
	ldr r1, [r5, r3]
	adds r0, r5, #0
	adds r1, r2, r1
	subs r1, #8
	movs r2, #0
	bl ov15_021FE5A4
	b _021FEEFE
_021FEEEA:
	movs r2, #6
	ldrsh r2, [r1, r2]
	subs r3, #0x3c
	ldr r1, [r5, r3]
	adds r0, r5, #0
	adds r1, r2, r1
	subs r1, #8
	movs r2, #0
	bl ov15_021FE584
_021FEEFE:
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	movs r2, #0x1a
	movs r0, #0xbd
	str r1, [sp, #4]
	lsls r2, r2, #6
	lsls r0, r0, #2
	ldrsh r2, [r5, r2]
	ldr r0, [r5, r0]
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FEF40 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	movs r1, #0
	bl ov15_021FEF48
	ldr r1, _021FEF44 @ =0x00000616
	strb r0, [r5, r1]
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FEF40: .4byte 0x000005E4
_021FEF44: .4byte 0x00000616
	thumb_func_end ov15_021FEEA4

	thumb_func_start ov15_021FEF48
ov15_021FEF48: @ 0x021FEF48
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	cmp r1, #0
	bne _021FEF58
	adds r4, r5, #0
	adds r4, #0x34
	b _021FEF6C
_021FEF58:
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021FEF66
	bl GF_AssertFail
_021FEF66:
	movs r0, #0x81
	lsls r0, r0, #2
	adds r4, r5, r0
_021FEF6C:
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, _021FEFB8 @ =0x000003E2
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E998
	adds r0, r4, #0
	bl FUN_0201D5C8
	movs r0, #1
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _021FEFBC @ =ov15_021FEFC4
	ldr r2, _021FEFC0 @ =0x000005E4
	str r0, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020200A8
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021FEFB8: .4byte 0x000003E2
_021FEFBC: .4byte ov15_021FEFC4
_021FEFC0: .4byte 0x000005E4
	thumb_func_end ov15_021FEF48

	thumb_func_start ov15_021FEFC4
ov15_021FEFC4: @ 0x021FEFC4
	push {r3, lr}
	cmp r1, #4
	bhi _021FEFFC
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021FEFD6: @ jump table
	.2byte _021FEFFC - _021FEFD6 - 2 @ case 0
	.2byte _021FEFE0 - _021FEFD6 - 2 @ case 1
	.2byte _021FEFE6 - _021FEFD6 - 2 @ case 2
	.2byte _021FEFEC - _021FEFD6 - 2 @ case 3
	.2byte _021FEFF4 - _021FEFD6 - 2 @ case 4
_021FEFE0:
	bl FUN_02006198
	pop {r3, pc}
_021FEFE6:
	bl FUN_02006BCC
	pop {r3, pc}
_021FEFEC:
	ldr r0, _021FF000 @ =0x0000060C
	bl FUN_0200604C
	b _021FEFFC
_021FEFF4:
	ldr r0, _021FF000 @ =0x0000060C
	bl FUN_02006184
	pop {r3, pc}
_021FEFFC:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021FF000: .4byte 0x0000060C
	thumb_func_end ov15_021FEFC4

	thumb_func_start ov15_021FF004
ov15_021FF004: @ 0x021FF004
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #0x81
	str r0, [sp, #8]
	movs r0, #9
	str r0, [sp, #0xc]
	movs r0, #0x19
	strb r0, [r2, #0x10]
	movs r0, #6
	strb r0, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	movs r1, #0xf
	bics r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	movs r1, #0xf0
	bics r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	bics r3, r1
	strb r3, [r2, #0x12]
	movs r1, #0
	strb r1, [r2, #0x13]
	bl FUN_0201660C
	ldr r1, _021FF054 @ =0x00000804
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021FF054: .4byte 0x00000804
	thumb_func_end ov15_021FF004

	thumb_func_start ov15_021FF058
ov15_021FF058: @ 0x021FF058
	ldr r1, _021FF060 @ =0x00000804
	ldr r3, _021FF064 @ =FUN_02016624
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_021FF060: .4byte 0x00000804
_021FF064: .4byte FUN_02016624
	thumb_func_end ov15_021FF058

	thumb_func_start ov15_021FF068
ov15_021FF068: @ 0x021FF068
	push {r4, r5, r6, lr}
	sub sp, #0x10
	movs r6, #0x89
	adds r5, r0, #0
	lsls r6, r6, #2
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #0
	adds r0, #0xcc
	ldr r0, [r5, r0]
	movs r1, #0x53
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, _021FF0F0 @ =0x00000684
	adds r0, r6, #0
	ldr r3, [r5, r2]
	subs r2, r2, #4
	ldrsh r2, [r5, r2]
	adds r0, #0xd0
	ldr r0, [r5, r0]
	muls r2, r3, r2
	movs r1, #0
	movs r3, #6
	bl FUN_0200BFCC
	adds r0, r6, #0
	ldr r1, _021FF0F4 @ =0x000005E4
	adds r0, #0xd0
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	ldr r1, _021FF0F4 @ =0x000005E4
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r0, #4
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF0F8 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	ldr r2, _021FF0F4 @ =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r5, r6
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r5, r6
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FF0F0: .4byte 0x00000684
_021FF0F4: .4byte 0x000005E4
_021FF0F8: .4byte 0x00010200
	thumb_func_end ov15_021FF068

	thumb_func_start ov15_021FF0FC
ov15_021FF0FC: @ 0x021FF0FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #1
	adds r7, r1, #0
	lsls r0, r0, #8
	movs r1, #6
	bl FUN_02026354
	movs r6, #0x85
	adds r4, r0, #0
	lsls r6, r6, #2
	cmp r7, #0
	bne _021FF14E
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #0
	adds r0, #0xdc
	ldr r0, [r5, r0]
	movs r1, #0x50
	bl FUN_0200BBA0
	adds r7, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF1DC @ =0x00010200
	adds r2, r7, #0
	str r0, [sp, #8]
	adds r0, r5, r6
	movs r3, #4
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_02026380
	b _021FF160
_021FF14E:
	movs r0, #0x48
	movs r1, #0
	str r0, [sp]
	movs r3, #0x10
	adds r0, r5, r6
	adds r2, r1, #0
	str r3, [sp, #4]
	bl FUN_0201DA74
_021FF160:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x51
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02029024
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	movs r3, #6
	bl FUN_0200BFCC
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	adds r1, r4, #0
	bl FUN_0200CBBC
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	adds r7, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF1DC @ =0x00010200
	adds r7, #8
	movs r3, #0x44
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r5, r6
	adds r2, r4, #0
	subs r3, r3, r7
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, r6
	bl FUN_0201D5C8
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021FF1DC: .4byte 0x00010200
	thumb_func_end ov15_021FF0FC

	thumb_func_start ov15_021FF1E0
ov15_021FF1E0: @ 0x021FF1E0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x54
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, _021FF294 @ =0x000003F7
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0xe
	bl FUN_0200E580
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x73
	bl FUN_0200BBA0
	movs r1, #0
	adds r6, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
	adds r0, r6, #0
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x74
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r0, #0xbd
	ldr r1, _021FF298 @ =0x000005E4
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r1, _021FF298 @ =0x000005E4
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r1, #0
	ldr r2, _021FF298 @ =0x000005E4
	str r1, [sp, #8]
	ldr r2, [r5, r2]
	movs r5, #0x58
	adds r0, r4, #0
	subs r3, r5, r3
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021FF294: .4byte 0x000003F7
_021FF298: .4byte 0x000005E4
	thumb_func_end ov15_021FF1E0

	thumb_func_start ov15_021FF29C
ov15_021FF29C: @ 0x021FF29C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #4
	adds r6, r1, #0
	ldr r0, [r5, r0]
	movs r1, #8
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x74
	movs r1, #0
	bl FUN_0201D978
	cmp r6, #0
	bne _021FF2EE
	movs r0, #0
	adds r1, r4, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	movs r6, #0x30
	subs r3, r6, r3
	lsrs r3, r3, #1
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF31C @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x74
	adds r3, #8
	str r1, [sp, #0xc]
	bl FUN_020200FC
	b _021FF308
_021FF2EE:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF31C @ =0x000F0E00
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x74
	movs r3, #5
	str r1, [sp, #0xc]
	bl FUN_020200FC
_021FF308:
	adds r5, #0x74
	adds r0, r5, #0
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FF31C: .4byte 0x000F0E00
	thumb_func_end ov15_021FF29C

	thumb_func_start ov15_021FF320
ov15_021FF320: @ 0x021FF320
	push {r4, r5, r6, r7}
	adds r3, r1, #0
	adds r1, r2, #0
	ldr r2, _021FF360 @ =0x022008C8
	movs r5, #0
	ldrb r6, [r2, r3]
	adds r4, r5, #0
	cmp r6, #0
	ble _021FF35A
	ldr r7, [r0]
	ldrb r2, [r2, r3]
	adds r0, r7, #0
	adds r6, r5, #0
	adds r1, r1, #1
_021FF33C:
	ldrh r3, [r0]
	cmp r3, #0
	beq _021FF350
	adds r3, r7, r6
	ldrh r3, [r3, #2]
	cmp r3, #0
	beq _021FF350
	adds r5, r5, #1
	cmp r5, r1
	beq _021FF35A
_021FF350:
	adds r4, r4, #1
	adds r0, r0, #4
	adds r6, r6, #4
	cmp r4, r2
	blt _021FF33C
_021FF35A:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_021FF360: .4byte 0x022008C8
	thumb_func_end ov15_021FF320

	thumb_func_start ov15_021FF364
ov15_021FF364: @ 0x021FF364
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	str r1, [sp, #0x10]
	adds r2, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	str r3, [sp, #0x14]
	muls r0, r1, r0
	adds r0, r2, r0
	movs r1, #6
	str r0, [sp, #0x24]
	ldrb r2, [r0, #9]
	ldrsh r0, [r0, r1]
	subs r0, r2, r0
	str r0, [sp, #0x20]
	cmp r0, #6
	ble _021FF392
	str r1, [sp, #0x20]
_021FF392:
	ldr r0, _021FF4DC @ =0x0000068A
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021FF3A2
	movs r0, #0
	str r0, [sp, #0x18]
	movs r4, #6
	b _021FF3A8
_021FF3A2:
	movs r0, #6
	str r0, [sp, #0x18]
	movs r4, #0
_021FF3A8:
	ldr r1, _021FF4DC @ =0x0000068A
	movs r0, #1
	ldrb r2, [r5, r1]
	eors r0, r2
	strb r0, [r5, r1]
	adds r0, r5, #0
	bl ov15_021FE17C
	movs r0, #0
	adds r7, r5, #0
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x2c]
	adds r7, #0xb4
_021FF3C2:
	lsls r0, r6, #4
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D978
	lsls r0, r4, #4
	adds r0, r7, r0
	bl FUN_0201D8E4
	ldr r0, [sp, #0x2c]
	adds r6, r6, #1
	adds r0, r0, #1
	adds r4, r4, #1
	str r0, [sp, #0x2c]
	cmp r0, #6
	blt _021FF3C2
	movs r1, #0x8d
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	movs r0, #0
	adds r1, #0x64
	ldrb r1, [r1]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x10]
	bl ov15_021FF320
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, #0x64
	ldrb r1, [r0]
	ldr r0, _021FF4E0 @ =0x022008C8
	ldrb r0, [r0, r1]
	cmp r4, r0
	bge _021FF4BE
	lsls r0, r4, #2
	str r0, [sp, #0x1c]
	adds r7, r5, r0
	adds r0, r5, #0
	str r0, [sp, #0x30]
	adds r0, #0xb4
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x30]
_021FF41C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r2, [sp, #0x1c]
	adds r1, r0, r1
	ldrh r0, [r0, r2]
	cmp r0, #0
	beq _021FF4A2
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _021FF4A2
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _021FF450
	ldr r1, [sp, #0x30]
	lsls r2, r6, #4
	adds r1, r1, r2
	movs r2, #0x35
	str r4, [sp]
	lsls r2, r2, #4
	ldr r2, [r7, r2]
	ldr r3, [sp, #0x24]
	adds r0, r5, #0
	bl ov15_021FF570
	b _021FF494
_021FF450:
	ldr r0, _021FF4E4 @ =0x00000672
	ldrb r0, [r5, r0]
	cmp r4, r0
	bne _021FF470
	ldr r1, [sp, #0x30]
	lsls r2, r6, #4
	adds r1, r1, r2
	movs r2, #0x35
	str r4, [sp]
	lsls r2, r2, #4
	ldr r2, [r7, r2]
	ldr r3, [sp, #0x24]
	adds r0, r5, #0
	bl ov15_021FF570
	b _021FF494
_021FF470:
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF4E8 @ =0x00010200
	movs r2, #0x35
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	lsls r2, r2, #4
	ldr r0, [sp, #0x30]
	lsls r1, r6, #4
	adds r0, r0, r1
	movs r1, #0
	ldr r2, [r7, r2]
	adds r3, r1, #0
	bl FUN_020200FC
_021FF494:
	ldr r0, [sp, #0x28]
	adds r6, r6, #1
	adds r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x28]
	cmp r1, r0
	bge _021FF4BE
_021FF4A2:
	ldr r0, [sp, #0x1c]
	adds r4, r4, #1
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r7, r7, #4
	adds r0, #0x64
	ldrb r1, [r0]
	ldr r0, _021FF4E0 @ =0x022008C8
	ldrb r0, [r0, r1]
	cmp r4, r0
	blt _021FF41C
_021FF4BE:
	movs r4, #0
	adds r5, #0xb4
_021FF4C2:
	ldr r0, [sp, #0x18]
	lsls r0, r0, #4
	adds r0, r5, r0
	bl FUN_0201D5C8
	ldr r0, [sp, #0x18]
	adds r4, r4, #1
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r4, #6
	blt _021FF4C2
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021FF4DC: .4byte 0x0000068A
_021FF4E0: .4byte 0x022008C8
_021FF4E4: .4byte 0x00000672
_021FF4E8: .4byte 0x00010200
	thumb_func_end ov15_021FF364

	thumb_func_start ov15_021FF4EC
ov15_021FF4EC: @ 0x021FF4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0x8d
	adds r7, r2, #0
	lsls r0, r0, #2
	ldr r2, [r6, r0]
	adds r5, r6, #0
	adds r0, r2, #4
	adds r2, #0x64
	str r0, [sp, #4]
	ldrb r2, [r2]
	movs r0, #0xc
	adds r7, r7, r1
	muls r0, r2, r0
	str r0, [sp, #8]
	movs r4, #0
	adds r5, #0xb4
_021FF510:
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blt _021FF510
	adds r0, r6, #0
	bl ov15_021FE1D0
	adds r0, r6, #0
	adds r0, #0x64
	bl FUN_0201D8E4
	adds r0, r6, #0
	bl ov15_021FE204
	lsls r2, r7, #2
	adds r3, r6, r2
	movs r2, #0x35
	movs r1, #0x5d
	lsls r1, r1, #2
	str r7, [sp]
	lsls r2, r2, #4
	ldr r2, [r3, r2]
	ldr r4, [sp, #4]
	ldr r3, [sp, #8]
	adds r0, r6, #0
	adds r1, r6, r1
	adds r3, r4, r3
	bl ov15_021FF570
	movs r0, #0x5d
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov15_021FF4EC

	thumb_func_start ov15_021FF560
ov15_021FF560: @ 0x021FF560
	movs r1, #0x5d
	lsls r1, r1, #2
	ldr r3, _021FF56C @ =FUN_0201D8E4
	adds r0, r0, r1
	bx r3
	nop
_021FF56C: .4byte FUN_0201D8E4
	thumb_func_end ov15_021FF560

	thumb_func_start ov15_021FF570
ov15_021FF570: @ 0x021FF570
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r3, #0
	adds r5, r0, #0
	ldrb r0, [r4, #8]
	adds r6, r1, #0
	cmp r0, #3
	beq _021FF586
	cmp r0, #7
	beq _021FF5D8
	b _021FF632
_021FF586:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x28]
	ldr r2, [r4]
	lsls r7, r0, #2
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r2, r7
	movs r3, #0x10
	bl ov15_021FE914
	ldr r3, [r4]
	movs r0, #0x52
	ldrh r1, [r3, r7]
	lsls r0, r0, #2
	cmp r1, r0
	blo _021FF662
	adds r0, #0x5b
	cmp r1, r0
	bhi _021FF662
	movs r1, #0xbd
	lsls r1, r1, #2
	adds r3, r3, r7
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldrh r3, [r3, #2]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl ov15_021FF66C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FF5D8:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r0, [sp, #0x28]
	lsls r7, r0, #2
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020781C4
	ldr r1, [r4]
	ldrh r1, [r1, r7]
	cmp r1, r0
	bne _021FF610
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	movs r3, #0
	bl ov15_021FE9F0
_021FF610:
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020781D0
	ldr r1, [r4]
	ldrh r1, [r1, r7]
	cmp r1, r0
	bne _021FF662
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	movs r3, #1
	bl ov15_021FE9F0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FF632:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	ldr r3, [sp, #0x28]
	movs r1, #0xbd
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r4, [r4]
	lsls r3, r3, #2
	adds r3, r4, r3
	ldrh r3, [r3, #2]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl ov15_021FF66C
_021FF662:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FF668: .4byte 0x00010200
	thumb_func_end ov15_021FF570

	thumb_func_start ov15_021FF66C
ov15_021FF66C: @ 0x021FF66C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #0
	adds r6, r2, #0
	str r1, [sp]
	movs r2, #1
	str r2, [sp, #4]
	adds r2, r3, #0
	adds r5, r0, #0
	movs r3, #3
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x57
	movs r3, #6
	bl FUN_0200BC4C
	adds r4, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF6B8 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r2, r4, #0
	movs r3, #0x30
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021FF6B8: .4byte 0x00010200
	thumb_func_end ov15_021FF66C

	thumb_func_start ov15_021FF6BC
ov15_021FF6BC: @ 0x021FF6BC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, r3
	movs r1, #6
	blx FUN_020F2998
	adds r6, r0, #0
	cmp r5, #0
	bne _021FF6D6
	movs r5, #1
	b _021FF6E0
_021FF6D6:
	adds r0, r5, #5
	movs r1, #6
	blx FUN_020F2998
	adds r5, r0, #0
_021FF6E0:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	adds r2, r6, #1
	movs r3, #3
	bl FUN_0200BFCC
	movs r1, #1
	str r1, [sp]
	movs r0, #0xbd
	str r1, [sp, #4]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r2, r5, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r1, #0xbd
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	subs r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x16
	movs r3, #6
	bl FUN_0200BC4C
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF754 @ =0x000F0100
	adds r2, r5, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x64
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r4, #0x64
	adds r0, r4, #0
	bl FUN_0201D5C8
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_021FF754: .4byte 0x000F0100
	thumb_func_end ov15_021FF6BC

	thumb_func_start ov15_021FF758
ov15_021FF758: @ 0x021FF758
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #0
	adds r6, r0, #0
	adds r5, r2, #0
	bl FUN_0201D978
	cmp r5, #0xff
	beq _021FF79E
	lsls r5, r5, #2
	adds r0, r6, #0
	bl FUN_0201EE90
	adds r7, r0, #0
	movs r0, #0
	ldr r1, [r4, r5]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF7A8 @ =0x000F0E00
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, r5]
	lsls r4, r7, #3
	subs r3, r4, r3
	adds r0, r6, #0
	lsrs r3, r3, #1
	bl FUN_020200FC
_021FF79E:
	adds r0, r6, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FF7A8: .4byte 0x000F0E00
	thumb_func_end ov15_021FF758

	thumb_func_start ov15_021FF7AC
ov15_021FF7AC: @ 0x021FF7AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021FF7B2:
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #4
	blt _021FF7B2
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov15_021FF7AC

	thumb_func_start ov15_021FF7C4
ov15_021FF7C4: @ 0x021FF7C4
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021FF7F8 @ =0x000F0E00
	adds r2, #0xf5
	str r0, [sp, #8]
	adds r0, r4, r2
	movs r2, #0xc5
	str r1, [sp, #0xc]
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	movs r3, #5
	bl FUN_020200FC
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_021FF7F8: .4byte 0x000F0E00
	thumb_func_end ov15_021FF7C4

	thumb_func_start ov15_021FF7FC
ov15_021FF7FC: @ 0x021FF7FC
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021FF830 @ =0x000F0E00
	adds r2, #0xf5
	str r0, [sp, #8]
	adds r0, r4, r2
	movs r2, #0xcd
	str r1, [sp, #0xc]
	lsls r2, r2, #2
	ldr r2, [r4, r2]
	movs r3, #5
	bl FUN_020200FC
	movs r0, #0x7d
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r4, pc}
	nop
_021FF830: .4byte 0x000F0E00
	thumb_func_end ov15_021FF7FC

	thumb_func_start ov15_021FF834
ov15_021FF834: @ 0x021FF834
	movs r1, #0x7d
	lsls r1, r1, #2
	ldr r3, _021FF840 @ =FUN_0201D8E4
	adds r0, r0, r1
	bx r3
	nop
_021FF840: .4byte FUN_0201D8E4
	thumb_func_end ov15_021FF834

	thumb_func_start ov15_021FF844
ov15_021FF844: @ 0x021FF844
	ldr r3, _021FF84C @ =FUN_0201D8E4
	adds r0, #0x74
	bx r3
	nop
_021FF84C: .4byte FUN_0201D8E4
	thumb_func_end ov15_021FF844

	thumb_func_start ov15_021FF850
ov15_021FF850: @ 0x021FF850
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x20
	movs r1, #6
	bl FUN_0202055C
	adds r0, r4, #0
	bl ov15_021FFA40
	adds r0, r4, #0
	bl ov15_021FFAD0
	adds r0, r4, #0
	bl ov15_021FFDD8
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200CF6C
	movs r2, #1
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	pop {r4, pc}
	thumb_func_end ov15_021FF850

	thumb_func_start ov15_021FF894
ov15_021FF894: @ 0x021FF894
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r7, #0x25
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #4
_021FF8A0:
	ldr r0, [r5, r7]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x27
	blo _021FF8A0
	movs r1, #0x92
	lsls r1, r1, #2
	ldr r0, [r6, r1]
	adds r1, r1, #4
	ldr r1, [r6, r1]
	bl FUN_0200D998
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_0200D108
	ldr r0, _021FF8D0 @ =0x0000069C
	ldr r0, [r6, r0]
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FF8D0: .4byte 0x0000069C
	thumb_func_end ov15_021FF894

	thumb_func_start ov15_021FF8D4
ov15_021FF8D4: @ 0x021FF8D4
	push {r4, r5, r6, lr}
	movs r6, #0x25
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #4
_021FF8DE:
	ldr r0, [r5, r6]
	bl FUN_0200DC18
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x27
	blo _021FF8DE
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov15_021FF8D4

	thumb_func_start ov15_021FF8F0
ov15_021FF8F0: @ 0x021FF8F0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FF948 @ =0x0000C0FC
	movs r1, #0x92
	adds r0, r4, r0
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x12
	bl FUN_0200E248
	adds r0, r6, #0
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FF94C @ =0x0000C0FB
	movs r1, #0x92
	adds r0, r4, r0
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x12
	bl FUN_0200E27C
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021FF948: .4byte 0x0000C0FC
_021FF94C: .4byte 0x0000C0FB
	thumb_func_end ov15_021FF8F0

	thumb_func_start ov15_021FF950
ov15_021FF950: @ 0x021FF950
	ldr r1, _021FF960 @ =0x0000064B
	movs r2, #0
	strb r2, [r0, r1]
	movs r2, #1
	subs r1, r1, #3
	strb r2, [r0, r1]
	bx lr
	nop
_021FF960: .4byte 0x0000064B
	thumb_func_end ov15_021FF950

	thumb_func_start ov15_021FF964
ov15_021FF964: @ 0x021FF964
	push {r3, lr}
	ldr r1, _021FF978 @ =0x00000648
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _021FF976
	cmp r1, #1
	bne _021FF976
	bl ov15_021FFEC0
_021FF976:
	pop {r3, pc}
	.align 2, 0
_021FF978: .4byte 0x00000648
	thumb_func_end ov15_021FF964

	thumb_func_start ov15_021FF97C
ov15_021FF97C: @ 0x021FF97C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x9b
	lsls r0, r0, #2
	adds r4, r2, #0
	adds r6, r1, #0
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DCE8
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r4, #0
	bl FUN_0200DCE8
	cmp r4, #0
	beq _021FFA34
	adds r0, r6, #0
	bl FUN_02078000
	movs r1, #3
	adds r4, r0, #0
	bl FUN_02073314
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl FUN_02073314
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl FUN_020776B4
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_02077678
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, _021FFA38 @ =0x0000C103
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r7, #0
	bl FUN_0200E248
	adds r0, r6, #0
	bl FUN_0207769C
	adds r1, r0, #0
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r1, #4
	bl FUN_0200DD10
	bl FUN_02077830
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02077800
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, _021FFA3C @ =0x0000C104
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl FUN_0200E248
	adds r0, r4, #0
	bl FUN_02077818
	adds r1, r0, #0
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r1, #4
	bl FUN_0200DD10
_021FFA34:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021FFA38: .4byte 0x0000C103
_021FFA3C: .4byte 0x0000C104
	thumb_func_end ov15_021FF97C

	thumb_func_start ov15_021FFA40
ov15_021FFA40: @ 0x021FFA40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021FFAC4 @ =0x022009BC
	add r2, sp, #0x34
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #6
	bl FUN_0200CF18
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0200CF38
	movs r7, #0x93
	lsls r7, r7, #2
	add r2, sp, #0x14
	ldr r3, _021FFAC8 @ =0x022009F4
	str r0, [r4, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r5, _021FFACC @ =0x022009A8
	stm r2!, {r0, r1}
	add r3, sp, #0
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	adds r1, r6, #0
	str r0, [r3]
	subs r0, r7, #4
	ldr r0, [r4, r0]
	movs r3, #0x20
	bl FUN_0200CF70
	subs r1, r7, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x27
	bl FUN_0200CFF4
	subs r1, r7, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl FUN_0200D3F8
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_021FFAC4: .4byte 0x022009BC
_021FFAC8: .4byte 0x022009F4
_021FFACC: .4byte 0x022009A8
	thumb_func_end ov15_021FFA40

	thumb_func_start ov15_021FFAD0
ov15_021FFAD0: @ 0x021FFAD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDAC @ =0x0000C0F9
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x1a
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDB0 @ =0x0000C0FA
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #6
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021FFDB4 @ =0x0000C0FB
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x33
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDB8 @ =0x0000C102
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x3c
	movs r3, #4
	bl FUN_0200D4A4
	movs r4, #0
	adds r6, r4, #0
	movs r7, #2
_021FFB54:
	movs r0, #0
	movs r1, #1
	bl FUN_02077C18
	adds r3, r0, #0
	ldr r0, _021FFDBC @ =0x0000C0FC
	str r6, [sp]
	movs r1, #0x93
	str r7, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r0, #0x92
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #0x12
	bl FUN_0200D4A4
	adds r4, r4, #1
	cmp r4, #6
	blt _021FFB54
	ldr r0, _021FFDC0 @ =0x0000C103
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #1
	movs r3, #0
	bl FUN_020776B8
	ldr r0, _021FFDC4 @ =0x0000C104
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #1
	movs r3, #0
	bl FUN_02077834
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021FFDAC @ =0x0000C0F9
	movs r1, #0x92
	movs r2, #0xf
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r3, r2, #0
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021FFDC8 @ =0x0000C101
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x3c
	movs r3, #0xa
	bl FUN_0200D564
	movs r1, #0x92
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, _021FFDB8 @ =0x0000C102
	movs r2, #1
	bl FUN_020776EC
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021FFDB0 @ =0x0000C0FA
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x2f
	bl FUN_0200D564
	movs r4, #0
	adds r6, r4, #0
	movs r7, #1
_021FFC2A:
	movs r0, #0
	movs r1, #2
	bl FUN_02077C18
	str r6, [sp]
	adds r3, r0, #0
	movs r1, #0x93
	str r7, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021FFDB4 @ =0x0000C0FB
	lsls r1, r1, #2
	adds r0, r4, r0
	str r0, [sp, #0xc]
	movs r0, #0x92
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #0x12
	bl FUN_0200D564
	adds r4, r4, #1
	cmp r4, #6
	blt _021FFC2A
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDAC @ =0x0000C0F9
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x19
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDB0 @ =0x0000C0FA
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #5
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDB4 @ =0x0000C0FB
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x31
	bl FUN_0200D6D4
	bl FUN_02077CE0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDBC @ =0x0000C0FC
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x12
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDCC @ =0x0000C0FD
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x3c
	movs r3, #5
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDAC @ =0x0000C0F9
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x15
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDB0 @ =0x0000C0FA
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x18
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDB4 @ =0x0000C0FB
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #4
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDBC @ =0x0000C0FC
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0xf
	movs r3, #0x32
	bl FUN_0200D704
	bl FUN_02077CE4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDCC @ =0x0000C0FD
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x12
	bl FUN_0200D704
	movs r0, #0
	str r0, [sp]
	ldr r0, _021FFDD0 @ =0x0000C0FE
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x3c
	movs r3, #6
	bl FUN_0200D704
	movs r1, #0x92
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r2, _021FFDD0 @ =0x0000C0FE
	ldr r1, [r5, r1]
	adds r3, r2, #1
	bl FUN_0207775C
	movs r2, #0x6a
	lsls r2, r2, #4
	movs r0, #0xf
	movs r1, #0x30
	adds r2, r5, r2
	movs r3, #6
	bl FUN_020079F4
	ldr r1, _021FFDD4 @ =0x0000069C
	str r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FFDAC: .4byte 0x0000C0F9
_021FFDB0: .4byte 0x0000C0FA
_021FFDB4: .4byte 0x0000C0FB
_021FFDB8: .4byte 0x0000C102
_021FFDBC: .4byte 0x0000C0FC
_021FFDC0: .4byte 0x0000C103
_021FFDC4: .4byte 0x0000C104
_021FFDC8: .4byte 0x0000C101
_021FFDCC: .4byte 0x0000C0FD
_021FFDD0: .4byte 0x0000C0FE
_021FFDD4: .4byte 0x0000069C
	thumb_func_end ov15_021FFAD0

	thumb_func_start ov15_021FFDD8
ov15_021FFDD8: @ 0x021FFDD8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r4, _021FFEBC @ =0x02200B0C
	movs r7, #0
	adds r5, r6, #0
_021FFDE2:
	movs r0, #0x92
	movs r1, #0x93
	lsls r0, r0, #2
	lsls r1, r1, #2
	movs r3, #1
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	adds r2, r4, #0
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r7, r7, #1
	adds r4, #0x34
	adds r5, r5, #4
	cmp r7, #0x27
	blo _021FFDE2
	adds r0, r1, #0
	adds r0, #0x4c
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_0200DD54
	movs r7, #0xb
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #6
_021FFE1C:
	ldr r0, [r4, r7]
	movs r1, #1
	bl FUN_0200DD54
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #4
	blo _021FFE1C
	movs r7, #0x9d
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #2
_021FFE34:
	ldr r0, [r4, r7]
	movs r1, #1
	bl FUN_0200DD54
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #8
	blo _021FFE34
	adds r0, r6, #0
	movs r1, #1
	bl ov15_02200458
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x9b
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x27
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r7, #0xb
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #6
_021FFE78:
	ldr r0, [r4, r7]
	movs r1, #0
	bl FUN_0200DCE8
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #4
	blo _021FFE78
	movs r7, #0x2d
	movs r5, #0
	adds r4, r6, #0
	lsls r7, r7, #4
_021FFE90:
	ldr r0, [r4, r7]
	movs r1, #0
	bl FUN_0200DCE8
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #6
	blo _021FFE90
	movs r0, #0xba
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xba
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #1
	bl FUN_0200DD54
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FFEBC: .4byte 0x02200B0C
	thumb_func_end ov15_021FFDD8

	thumb_func_start ov15_021FFEC0
ov15_021FFEC0: @ 0x021FFEC0
	ldr r1, _021FFEC8 @ =0x00000648
	movs r2, #0
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_021FFEC8: .4byte 0x00000648
	thumb_func_end ov15_021FFEC0

	thumb_func_start ov15_021FFECC
ov15_021FFECC: @ 0x021FFECC
	push {r3, r4, r5, lr}
	lsls r4, r1, #2
	ldr r1, _021FFF14 @ =0x02200AB8
	ldr r2, _021FFF18 @ =0x02200AB9
	adds r5, r0, #0
	movs r0, #0x2a
	lsls r0, r0, #4
	movs r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
	ldr r1, _021FFF1C @ =0x02200ABA
	movs r0, #0x2a
	lsls r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl FUN_0200DC4C
	ldr r1, _021FFF20 @ =0x02200ABB
	movs r0, #0x2a
	lsls r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl FUN_0200DD10
	movs r0, #0x2a
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
	nop
_021FFF14: .4byte 0x02200AB8
_021FFF18: .4byte 0x02200AB9
_021FFF1C: .4byte 0x02200ABA
_021FFF20: .4byte 0x02200ABB
	thumb_func_end ov15_021FFECC

	thumb_func_start ov15_021FFF24
ov15_021FFF24: @ 0x021FFF24
	movs r1, #0x2a
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	ldr r3, _021FFF30 @ =FUN_0200DCE8
	movs r1, #0
	bx r3
	.align 2, 0
_021FFF30: .4byte FUN_0200DCE8
	thumb_func_end ov15_021FFF24

	thumb_func_start ov15_021FFF34
ov15_021FFF34: @ 0x021FFF34
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #9
	blt _021FFF42
	bl GF_AssertFail
_021FFF42:
	cmp r4, #8
	bne _021FFF58
	ldr r1, _021FFFC8 @ =0x02200A36
	movs r0, #0x2a
	lsls r2, r4, #2
	lsls r0, r0, #4
	ldrb r1, [r1, r2]
	ldr r0, [r5, r0]
	bl FUN_0200DC4C
	b _021FFFA0
_021FFF58:
	movs r2, #0x8d
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r3, r0, #4
	adds r0, #0x64
	ldrb r1, [r0]
	movs r0, #0xc
	muls r0, r1, r0
	adds r1, r3, r0
	movs r0, #6
	ldr r3, _021FFFCC @ =0x00000672
	ldrsh r0, [r1, r0]
	ldrb r3, [r5, r3]
	adds r0, r0, r4
	cmp r0, r3
	bne _021FFF84
	adds r2, #0x6c
	ldr r0, [r5, r2]
	movs r1, #0xa
	bl FUN_0200DC4C
	b _021FFFA0
_021FFF84:
	ldrb r1, [r1, #9]
	cmp r0, r1
	blt _021FFF96
	adds r2, #0x6c
	ldr r0, [r5, r2]
	movs r1, #0x28
	bl FUN_0200DC4C
	b _021FFFA0
_021FFF96:
	adds r2, #0x6c
	ldr r0, [r5, r2]
	movs r1, #0x14
	bl FUN_0200DC4C
_021FFFA0:
	ldr r1, _021FFFD0 @ =0x02200A34
	lsls r4, r4, #2
	ldr r2, _021FFFD4 @ =0x02200A35
	movs r0, #0x2a
	lsls r0, r0, #4
	movs r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
	ldr r1, _021FFFD8 @ =0x02200A37
	movs r0, #0x2a
	lsls r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl FUN_0200DD10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021FFFC8: .4byte 0x02200A36
_021FFFCC: .4byte 0x00000672
_021FFFD0: .4byte 0x02200A34
_021FFFD4: .4byte 0x02200A35
_021FFFD8: .4byte 0x02200A37
	thumb_func_end ov15_021FFF34

	thumb_func_start ov15_021FFFDC
ov15_021FFFDC: @ 0x021FFFDC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #8
	blt _021FFFEA
	bl GF_AssertFail
_021FFFEA:
	ldr r1, _02200020 @ =0x022009D4
	lsls r4, r4, #2
	ldr r2, _02200024 @ =0x022009D5
	movs r0, #0x2a
	lsls r0, r0, #4
	movs r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
	ldr r1, _02200028 @ =0x022009D6
	movs r0, #0x2a
	lsls r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl FUN_0200DC4C
	ldr r1, _0220002C @ =0x022009D7
	movs r0, #0x2a
	lsls r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl FUN_0200DD10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02200020: .4byte 0x022009D4
_02200024: .4byte 0x022009D5
_02200028: .4byte 0x022009D6
_0220002C: .4byte 0x022009D7
	thumb_func_end ov15_021FFFDC

	thumb_func_start ov15_02200030
ov15_02200030: @ 0x02200030
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	cmp r5, #7
	bgt _02200058
	movs r1, #0x6a
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r2, #1
	ldr r4, [r0, #0xc]
	lsls r2, r2, #8
	adds r0, r4, r2
	movs r1, #0
	blx FUN_020CFD70
	lsls r0, r5, #5
	adds r0, r4, r0
	lsls r1, r5, #5
	movs r2, #0x20
	blx FUN_020CFD70
_02200058:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov15_02200030

	thumb_func_start ov15_0220005C
ov15_0220005C: @ 0x0220005C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	adds r6, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bne _02200096
	movs r4, #0
	movs r6, #0xa9
	adds r5, r0, #0
	adds r7, r4, #0
	lsls r6, r6, #2
_02200074:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _02200074
	movs r1, #0xaf
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0200DCE8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02200096:
	movs r7, #0xa9
	movs r5, #0
	adds r4, r0, #0
	lsls r7, r7, #2
_0220009E:
	cmp r5, r6
	bge _022000AC
	ldr r0, [r4, r7]
	movs r1, #1
	bl FUN_0200DCE8
	b _022000B8
_022000AC:
	movs r0, #0xa9
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
_022000B8:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #6
	blt _0220009E
	ldr r0, [sp, #4]
	cmp r0, #0
	blt _022000DC
	adds r0, #0x15
	str r0, [sp, #4]
	lsls r1, r0, #2
	ldr r0, [sp]
	adds r1, r0, r1
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DCE8
_022000DC:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022000F0
	movs r1, #0xaf
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0200DCE8
_022000F0:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov15_0220005C

	thumb_func_start ov15_022000F4
ov15_022000F4: @ 0x022000F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r3, [r4, r0]
	adds r1, r3, #0
	adds r1, #0x64
	ldrb r2, [r1]
	movs r1, #0xc
	muls r1, r2, r1
	adds r1, r3, r1
	ldrb r1, [r1, #0xd]
	cmp r1, #6
	bhi _02200128
	adds r0, #0x60
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r4, pc}
_02200128:
	adds r0, #0x60
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	pop {r4, pc}
	thumb_func_end ov15_022000F4

	thumb_func_start ov15_02200140
ov15_02200140: @ 0x02200140
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r6, _022001BC @ =0x02200B0C
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r4, #0
	adds r5, r7, #0
_02200152:
	movs r0, #0x95
	movs r1, #0x34
	movs r2, #0x36
	lsls r0, r0, #2
	movs r3, #1
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
	ldr r0, [sp, #4]
	cmp r4, r0
	bge _0220019A
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0220018C
	ldr r3, [sp]
	movs r2, #6
	ldrsh r2, [r3, r2]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r2, r4
	lsls r2, r2, #1
	adds r3, r7, r2
	ldr r2, _022001C0 @ =0x000006A4
	ldrh r2, [r3, r2]
	bl ov15_021FF8F0
_0220018C:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	b _022001A6
_0220019A:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
_022001A6:
	adds r4, r4, #1
	adds r6, #0x34
	adds r5, r5, #4
	cmp r4, #6
	blt _02200152
	adds r0, r7, #0
	bl ov15_022000F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022001BC: .4byte 0x02200B0C
_022001C0: .4byte 0x000006A4
	thumb_func_end ov15_02200140

	thumb_func_start ov15_022001C4
ov15_022001C4: @ 0x022001C4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r2, #0
	str r0, [sp]
	adds r4, r1, #0
	movs r7, #0
	adds r0, r5, #0
	movs r1, #6
	mvns r7, r7
	blx FUN_020F2998
	movs r1, #6
	adds r2, r0, #0
	ldrsh r3, [r4, r1]
	muls r2, r1, r2
	cmp r3, r2
	bne _022001EC
	adds r0, r5, #0
	blx FUN_020F2998
	adds r7, r1, #0
_022001EC:
	ldr r4, _02200238 @ =0x02200B0C
	ldr r5, [sp]
	movs r6, #0
_022001F2:
	movs r0, #0x95
	movs r1, #0x34
	movs r2, #0x36
	lsls r0, r0, #2
	movs r3, #1
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, r0]
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
	cmp r6, r7
	bne _0220021A
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	b _02200226
_0220021A:
	movs r0, #0x95
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
_02200226:
	adds r6, r6, #1
	adds r4, #0x34
	adds r5, r5, #4
	cmp r6, #6
	blt _022001F2
	ldr r0, [sp]
	bl ov15_022000F4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02200238: .4byte 0x02200B0C
	thumb_func_end ov15_022001C4

	thumb_func_start ov15_0220023C
ov15_0220023C: @ 0x0220023C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0x2a
	lsls r0, r0, #4
	adds r6, r1, #0
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r4, #0
	adds r5, r7, #0
_02200252:
	ldrb r0, [r6, r4]
	cmp r0, #0xff
	beq _02200266
	movs r0, #0xb
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	b _02200272
_02200266:
	movs r0, #0xb
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
_02200272:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02200252
	movs r0, #0xa5
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xa6
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_0220023C

	thumb_func_start ov15_02200294
ov15_02200294: @ 0x02200294
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r6, #0xb
	adds r5, r0, #0
	adds r7, r4, #0
	lsls r6, r6, #6
_022002A0:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _022002A0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov15_02200294

	thumb_func_start ov15_022002B4
ov15_022002B4: @ 0x022002B4
	push {r3, r4, r5, r6, r7, lr}
	movs r7, #0x95
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	lsls r7, r7, #2
_022002C0:
	cmp r6, r4
	beq _022002CE
	ldr r0, [r5, r7]
	movs r1, #0
	bl FUN_0200DCE8
	b _022002E0
_022002CE:
	movs r0, #0x95
	lsls r0, r0, #2
	movs r3, #1
	ldr r0, [r5, r0]
	movs r1, #0x56
	movs r2, #0x4c
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
_022002E0:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _022002C0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov15_022002B4

	thumb_func_start ov15_022002EC
ov15_022002EC: @ 0x022002EC
	movs r1, #0
	cmp r0, #0x64
	bge _022002F4
	movs r1, #1
_022002F4:
	cmp r0, #0xa
	bge _022002FA
	movs r1, #2
_022002FA:
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov15_022002EC

	thumb_func_start ov15_02200300
ov15_02200300: @ 0x02200300
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	str r1, [sp]
	str r2, [sp, #4]
	cmp r0, #2
	bne _0220031A
	adds r0, r2, #0
	cmp r0, #0x63
	ble _0220031A
	movs r0, #0x63
	str r0, [sp, #4]
_0220031A:
	ldr r0, [sp]
	ldr r2, _02200414 @ =0x02200998
	subs r0, r0, #2
	lsls r1, r0, #2
	str r1, [sp, #8]
	ldr r1, [r2, r1]
	movs r7, #0
	cmp r1, #0
	ble _0220036C
	movs r1, #0x18
	muls r1, r0, r1
	ldr r0, _02200418 @ =0x02200A58
	adds r4, r0, r1
	ldr r0, _0220041C @ =0x02200A88
	adds r6, r0, r1
_02200338:
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [r6]
	bl FUN_0200DC4C
	ldr r1, _02200414 @ =0x02200998
	ldr r0, [sp, #8]
	adds r7, r7, #1
	ldr r0, [r1, r0]
	adds r4, r4, #4
	adds r6, r6, #4
	cmp r7, r0
	blt _02200338
_0220036C:
	ldr r0, [sp, #4]
	bl ov15_022002EC
	cmp r0, #0
	beq _022003D4
	ldr r1, [sp]
	subs r1, r1, #2
	bne _0220039A
	cmp r0, #2
	bne _0220039A
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xb7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	b _022003D4
_0220039A:
	ldr r1, [sp]
	subs r1, r1, #2
	cmp r1, #1
	bne _022003D4
	subs r2, r0, #1
	ldr r0, _02200420 @ =0x022009A0
	lsls r7, r2, #2
	ldr r0, [r0, r7]
	movs r4, #0
	cmp r0, #0
	ble _022003D4
	ldr r1, _02200424 @ =0x02200A14
	lsls r0, r2, #4
	adds r6, r1, r0
_022003B6:
	ldr r0, [r6]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x2d
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, _02200420 @ =0x022009A0
	adds r4, r4, #1
	ldr r0, [r0, r7]
	adds r6, r6, #4
	cmp r4, r0
	blt _022003B6
_022003D4:
	movs r0, #0xba
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #0xba
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xba
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x25
	bl FUN_0200DC4C
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x27
	bl FUN_0200DC4C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02200414: .4byte 0x02200998
_02200418: .4byte 0x02200A58
_0220041C: .4byte 0x02200A88
_02200420: .4byte 0x022009A0
_02200424: .4byte 0x02200A14
	thumb_func_end ov15_02200300

	thumb_func_start ov15_02200428
ov15_02200428: @ 0x02200428
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r6, #0x2d
	str r0, [sp]
	adds r5, r0, #0
	adds r7, r4, #0
	lsls r6, r6, #4
_02200436:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _02200436
	movs r1, #0xba
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov15_02200428

	thumb_func_start ov15_02200458
ov15_02200458: @ 0x02200458
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	adds r5, r0, #0
	cmp r7, #1
	beq _0220046C
	cmp r7, #0
	beq _0220046C
	bl GF_AssertFail
_0220046C:
	add r0, sp, #0
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	movs r6, #0
	adds r4, r6, #0
_0220047A:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #8
	blo _0220048C
	bl GF_AssertFail
_0220048C:
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r0, r4
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _022004A2
	ldrb r2, [r1, #0xc]
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, r2]
_022004A2:
	adds r6, r6, #1
	adds r4, #0xc
	cmp r6, #8
	blt _0220047A
	movs r6, #0
	add r4, sp, #0
_022004AE:
	ldrb r0, [r4]
	cmp r0, #0
	beq _022004C2
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_0200DCE8
	b _022004CE
_022004C2:
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
_022004CE:
	adds r6, r6, #1
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r6, #8
	blt _022004AE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_02200458

	thumb_func_start ov15_022004DC
ov15_022004DC: @ 0x022004DC
	movs r2, #0xa7
	lsls r2, r2, #2
	ldr r3, _022004E8 @ =FUN_0200DCE8
	ldr r0, [r0, r2]
	bx r3
	nop
_022004E8: .4byte FUN_0200DCE8
	thumb_func_end ov15_022004DC
_022004EC:
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x30, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x02, 0x01, 0x01, 0x03, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x03, 0x01, 0x01, 0x02, 0x04, 0x04, 0x04, 0x03, 0x02, 0x51, 0x3B, 0x15, 0x00
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x9F, 0x00, 0x5D, 0x80, 0x9F, 0x60, 0xBF, 0xA0, 0xBF, 0x00, 0x5D, 0xA0, 0xBF, 0x60, 0xBF
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x58, 0x6F, 0x78, 0x97, 0x58, 0x6F, 0x98, 0xB7
	.byte 0x88, 0x9F, 0x78, 0x97, 0x88, 0x9F, 0x98, 0xB7, 0xA8, 0xBF, 0x60, 0xAD, 0xA8, 0xBF, 0xB2, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x0C, 0x0A, 0x0E, 0x09, 0x10, 0x0B, 0x08, 0x0F, 0x08, 0x0C, 0x0E, 0x0B
	.byte 0x09, 0x0D, 0x0A, 0x0F, 0x0A, 0x08, 0x0E, 0x0D, 0x0B, 0x10, 0x0C, 0x0F, 0x0C, 0x08, 0x10, 0x10
	.byte 0x0C, 0x08, 0x10, 0x10, 0x0D, 0x09, 0x10, 0x10, 0x58, 0x6F, 0x78, 0x97, 0x58, 0x6F, 0x98, 0xB7
	.byte 0x58, 0x6F, 0xB8, 0xD7, 0x88, 0x9F, 0x78, 0x97, 0x88, 0x9F, 0x98, 0xB7, 0x88, 0x9F, 0xB8, 0xD7
	.byte 0xA8, 0xBF, 0x60, 0xAD, 0xA8, 0xBF, 0xB2, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x20, 0x49, 0x00, 0x7F, 0x20, 0x49, 0x80, 0xFF, 0x4A, 0x75, 0x00, 0x7F, 0x4A, 0x75, 0x80, 0xFF
	.byte 0x76, 0x99, 0x00, 0x7F, 0x76, 0x99, 0x80, 0xFF, 0xA8, 0xBF, 0x00, 0x27, 0xA8, 0xBF, 0x28, 0x4F
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x0C, 0x08, 0x07, 0x01, 0x0C, 0x08, 0x00, 0x02, 0x0C, 0x08, 0x01, 0x03, 0x0C, 0x08, 0x02, 0x04
	.byte 0x10, 0x09, 0x03, 0x05, 0x10, 0x09, 0x04, 0x06, 0x10, 0x09, 0x05, 0x07, 0x10, 0x09, 0x06, 0x00
	.byte 0x11, 0x0A, 0x0E, 0x09, 0x11, 0x0B, 0x08, 0x0F, 0x08, 0x0C, 0x0E, 0x0B, 0x09, 0x0D, 0x0A, 0x0F
	.byte 0x0A, 0x11, 0x0E, 0x0D, 0x0B, 0x10, 0x0C, 0x0F, 0x0C, 0x11, 0x10, 0x10, 0x0C, 0x11, 0x10, 0x10
	.byte 0x0D, 0x11, 0x10, 0x10, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x20, 0x3F, 0x00, 0x1F, 0x40, 0x5F
	.byte 0x00, 0x1F, 0x60, 0x7F, 0x00, 0x1F, 0x80, 0x9F, 0x00, 0x1F, 0xA0, 0xBF, 0x00, 0x1F, 0xC0, 0xDF
	.byte 0x00, 0x1F, 0xE0, 0xFF, 0x20, 0x49, 0x00, 0x7F, 0x20, 0x49, 0x80, 0xFF, 0x4A, 0x75, 0x00, 0x7F
	.byte 0x4A, 0x75, 0x80, 0xFF, 0x76, 0x99, 0x00, 0x7F, 0x76, 0x99, 0x80, 0xFF, 0xA8, 0xBF, 0x00, 0x27
	.byte 0xA8, 0xBF, 0x28, 0x4F, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xEE, 0x19, 0x67, 0x00, 0x00, 0x00, 0x00, 0x55, 0x3B, 0x15, 0x00, 0x00, 0xB0, 0xFD, 0xFF
	.byte 0x87, 0xE0, 0x28, 0x48, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x0E, 0x00, 0x00, 0x20, 0xFD, 0xFF
	.byte 0x7F, 0xF0, 0x16, 0x78, 0x00, 0x00, 0x00, 0x00, 0x53, 0xEB, 0x14, 0x00, 0x02, 0x00, 0xFD, 0xFF
	.byte 0x75, 0x03, 0x22, 0x56, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x5B, 0x0B, 0x00, 0x01, 0xB0, 0xFB, 0xFF
	.byte 0x81, 0xE7, 0x27, 0x75, 0x00, 0x00, 0x00, 0x00, 0x58, 0xAB, 0x0C, 0x00, 0x06, 0x40, 0xFC, 0xFF
	.byte 0x7E, 0xE8, 0x1A, 0x74, 0x00, 0x00, 0x00, 0x00, 0x4F, 0x8B, 0x12, 0x00, 0xFE, 0x9F, 0xFC, 0xFF
	.byte 0x80, 0xEB, 0x1B, 0x92, 0x00, 0x00, 0x00, 0x00, 0x52, 0x1B, 0x0D, 0x00, 0x00, 0xA0, 0xFB, 0xFF
	.byte 0x87, 0x05, 0x1F, 0x8C, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0xFF, 0xFF, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xEC, 0x20, 0x38, 0x00, 0x00, 0x00, 0x00, 0x53, 0x5B, 0x12, 0x00, 0x00, 0x30, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x20, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x51, 0xBB, 0x10, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x18, 0x5E, 0x00, 0x00, 0x00, 0x00, 0x53, 0x3B, 0x0D, 0x00, 0x01, 0x00, 0xFD, 0xFF
	.byte 0x7C, 0xF1, 0x1E, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x80, 0x01, 0x22, 0x32, 0x00, 0x00, 0x00, 0x00, 0x51, 0x5B, 0x0C, 0x00, 0x00, 0xD0, 0xFC, 0xFF
	.byte 0x7B, 0xEC, 0x16, 0x81, 0x00, 0x00, 0x00, 0x00, 0x49, 0x7B, 0x0C, 0x00, 0x01, 0x30, 0xFC, 0xFF
	.byte 0x7D, 0xF1, 0x1F, 0x72, 0x00, 0x00, 0x00, 0x00, 0x51, 0x5B, 0x0D, 0x00, 0x00, 0x60, 0xFD, 0xFF
	.byte 0x87, 0x05, 0x1D, 0x50, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x00, 0xFE, 0xFF
	.byte 0xA5, 0x28, 0x18, 0x65, 0x40, 0x0C, 0x1E, 0x32, 0x81, 0x93, 0x1F, 0x02, 0x09, 0x96, 0x1F, 0x02
	.byte 0x2D, 0x98, 0x1F, 0x02, 0xFF, 0xFF, 0xFF, 0xFF, 0xA5, 0x28, 0x18, 0x65, 0x40, 0x0C, 0x1E, 0x32
	.byte 0x10, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0xBF, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x17, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x6F, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x9B, 0x01, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xC7, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0xF3, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x1F, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x4B, 0x02, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x77, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0xA3, 0x02, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x88, 0x68, 0x1D, 0x09, 0xA8, 0x68, 0x1D, 0x09, 0xC8, 0x68, 0x1D, 0x09
	.byte 0x88, 0xA0, 0x1D, 0x09, 0xA8, 0xA0, 0x1D, 0x09, 0xC8, 0xA0, 0x1D, 0x09, 0xA0, 0xB0, 0x11, 0x09
	.byte 0xE0, 0xB0, 0x11, 0x09, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x30, 0x38, 0x14, 0x09, 0xB0, 0x38, 0x14, 0x09, 0x30, 0x60, 0x14, 0x09
	.byte 0xB0, 0x60, 0x14, 0x09, 0x30, 0x88, 0x14, 0x09, 0xB0, 0x88, 0x14, 0x09, 0x18, 0xB0, 0x0E, 0x09
	.byte 0x40, 0xB0, 0x0E, 0x09, 0xE0, 0xB0, 0x11, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x10, 0x08, 0x09, 0x30, 0x10, 0x08, 0x09
	.byte 0x50, 0x10, 0x08, 0x09, 0x70, 0x10, 0x08, 0x09, 0x90, 0x10, 0x08, 0x09, 0xB0, 0x10, 0x08, 0x09
	.byte 0xD0, 0x10, 0x08, 0x09, 0xF0, 0x10, 0x08, 0x09, 0x30, 0x38, 0x0A, 0x09, 0xB0, 0x38, 0x0A, 0x09
	.byte 0x30, 0x60, 0x0A, 0x09, 0xB0, 0x60, 0x0A, 0x09, 0x30, 0x88, 0x0A, 0x09, 0xB0, 0x88, 0x0A, 0x09
	.byte 0x18, 0xB0, 0x0E, 0x09, 0x40, 0xB0, 0x0E, 0x09, 0xE0, 0xB0, 0x11, 0x09, 0x30, 0x90, 0x17, 0x09
	.byte 0x90, 0x90, 0x17, 0x09, 0x30, 0xB0, 0x17, 0x09, 0x90, 0xB0, 0x17, 0x09, 0xB1, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFF, 0xC0, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0xC1, 0x00, 0x00
	.byte 0x02, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0xC1, 0x00, 0x00, 0x02, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x30, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x30, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x58, 0x00, 0x00, 0x00, 0x13, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x58, 0x00
	.byte 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x80, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x80, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x30, 0x00, 0x00, 0x00, 0x14, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x90, 0x00
	.byte 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x90, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x16, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x98, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x98, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_02201300:
	.byte 0x01, 0x00, 0x00, 0x00, 0x4A, 0x29, 0x2F, 0x11, 0x94, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x84, 0x06, 0x20, 0x02, 0x50, 0x05, 0x20, 0x02, 0xF0, 0x05, 0x20, 0x02
	.byte 0xA8, 0x05, 0x20, 0x02, 0x68, 0x05, 0x20, 0x02, 0x00, 0x04, 0x10, 0x06, 0x10, 0x04, 0x10, 0x06
	.byte 0x00, 0x09, 0x10, 0x06, 0x10, 0x09, 0x10, 0x06, 0x00, 0x0E, 0x10, 0x06, 0x10, 0x0E, 0x10, 0x06
	.byte 0x00, 0x0B, 0x10, 0x09, 0x10, 0x06, 0x10, 0x10, 0x00, 0x0B, 0x20, 0x09, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x10, 0x04, 0x10, 0x0B, 0x10, 0x09, 0x00, 0x10, 0x20, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x10, 0x10, 0x04, 0x81, 0xB6, 0x1F, 0x02, 0x81, 0xB6, 0x1F, 0x02
	.byte 0x81, 0xB6, 0x1F, 0x02, 0x81, 0xB6, 0x1F, 0x02, 0x81, 0xB6, 0x1F, 0x02, 0xAD, 0xBC, 0x1F, 0x02
	.byte 0x25, 0xC2, 0x1F, 0x02, 0x7D, 0xC3, 0x1F, 0x02, 0xED, 0xC3, 0x1F, 0x02, 0x6D, 0xBC, 0x1F, 0x02
	.byte 0x8D, 0xBC, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00, 0xE1, 0xC3, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0xC1, 0xD3, 0x1F, 0x02, 0x81, 0xB6, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x20, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00, 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0A, 0x10, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00, 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0A, 0x20, 0x0A, 0x00, 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x05, 0x00, 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x0A, 0x10, 0x0A, 0x00, 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0F, 0x20, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x10, 0x0F, 0x10, 0x05, 0x00, 0x11, 0x12, 0x13, 0x14, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_02201480:
