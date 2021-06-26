
	thumb_func_start ov70_022378C0
ov70_022378C0: @ 0x022378C0
	push {r3, r4}
	ldr r3, _022378D8 @ =0x02246800
	movs r4, #1
	str r4, [r3]
	movs r4, #0
	str r4, [r3, #4]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	str r2, [r3, #0x10]
	pop {r3, r4}
	bx lr
	nop
_022378D8: .4byte 0x02246800
	thumb_func_end ov70_022378C0

	thumb_func_start ov70_022378DC
ov70_022378DC: @ 0x022378DC
	push {r3, lr}
	ldr r1, _02237BC0 @ =0x02246800
	ldr r0, [r1]
	cmp r0, #0x18
	bls _022378E8
	b _02237F24
_022378E8:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022378F4: @ jump table
	.2byte _02237F24 - _022378F4 - 2 @ case 0
	.2byte _02237F24 - _022378F4 - 2 @ case 1
	.2byte _02237926 - _022378F4 - 2 @ case 2
	.2byte _02237F18 - _022378F4 - 2 @ case 3
	.2byte _022379D4 - _022378F4 - 2 @ case 4
	.2byte _02237F18 - _022378F4 - 2 @ case 5
	.2byte _02237A5A - _022378F4 - 2 @ case 6
	.2byte _02237F18 - _022378F4 - 2 @ case 7
	.2byte _02237ADA - _022378F4 - 2 @ case 8
	.2byte _02237F18 - _022378F4 - 2 @ case 9
	.2byte _02237B6E - _022378F4 - 2 @ case 10
	.2byte _02237F18 - _022378F4 - 2 @ case 11
	.2byte _02237BEC - _022378F4 - 2 @ case 12
	.2byte _02237F18 - _022378F4 - 2 @ case 13
	.2byte _02237C72 - _022378F4 - 2 @ case 14
	.2byte _02237F18 - _022378F4 - 2 @ case 15
	.2byte _02237CEA - _022378F4 - 2 @ case 16
	.2byte _02237F18 - _022378F4 - 2 @ case 17
	.2byte _02237DBC - _022378F4 - 2 @ case 18
	.2byte _02237F18 - _022378F4 - 2 @ case 19
	.2byte _02237E10 - _022378F4 - 2 @ case 20
	.2byte _02237F18 - _022378F4 - 2 @ case 21
	.2byte _02237E80 - _022378F4 - 2 @ case 22
	.2byte _02237F18 - _022378F4 - 2 @ case 23
	.2byte _02237F24 - _022378F4 - 2 @ case 24
_02237926:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237934
	cmp r0, #7
	beq _0223794C
	pop {r3, pc}
_02237934:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_0223794C:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	ldr r2, _02237BC4 @ =0x02246920
	str r1, [r0]
	ldrb r2, [r2, #0x1c]
	cmp r2, #0xe
	bhi _022379C6
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02237966: @ jump table
	.2byte _022379C6 - _02237966 - 2 @ case 0
	.2byte _02237984 - _02237966 - 2 @ case 1
	.2byte _0223798A - _02237966 - 2 @ case 2
	.2byte _02237990 - _02237966 - 2 @ case 3
	.2byte _022379C6 - _02237966 - 2 @ case 4
	.2byte _022379C6 - _02237966 - 2 @ case 5
	.2byte _022379C6 - _02237966 - 2 @ case 6
	.2byte _02237996 - _02237966 - 2 @ case 7
	.2byte _022379A8 - _02237966 - 2 @ case 8
	.2byte _022379AE - _02237966 - 2 @ case 9
	.2byte _022379B4 - _02237966 - 2 @ case 10
	.2byte _022379BA - _02237966 - 2 @ case 11
	.2byte _0223799C - _02237966 - 2 @ case 12
	.2byte _022379A2 - _02237966 - 2 @ case 13
	.2byte _022379C0 - _02237966 - 2 @ case 14
_02237984:
	movs r1, #0
	str r1, [r0, #4]
	b _022379CE
_0223798A:
	subs r1, #0x1d
	str r1, [r0, #4]
	b _022379CE
_02237990:
	subs r1, #0x1c
	str r1, [r0, #4]
	b _022379CE
_02237996:
	subs r1, #0x19
	str r1, [r0, #4]
	b _022379CE
_0223799C:
	subs r1, #0x1e
	str r1, [r0, #4]
	b _022379CE
_022379A2:
	subs r1, #0x1f
	str r1, [r0, #4]
	b _022379CE
_022379A8:
	subs r1, #0x20
	str r1, [r0, #4]
	b _022379CE
_022379AE:
	subs r1, #0x21
	str r1, [r0, #4]
	b _022379CE
_022379B4:
	subs r1, #0x22
	str r1, [r0, #4]
	b _022379CE
_022379BA:
	subs r1, #0x23
	str r1, [r0, #4]
	b _022379CE
_022379C0:
	subs r1, #0x1a
	str r1, [r0, #4]
	b _022379CE
_022379C6:
	movs r1, #0xc
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_022379CE:
	bl FUN_0221BFEC
	pop {r3, pc}
_022379D4:
	bl FUN_0221BF48
	cmp r0, #1
	beq _022379E2
	cmp r0, #7
	beq _022379FA
	pop {r3, pc}
_022379E2:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_022379FA:
	ldr r0, _02237BC0 @ =0x02246800
	movs r2, #0x18
	ldr r1, _02237BC4 @ =0x02246920
	str r2, [r0]
	ldrb r1, [r1, #0x1c]
	cmp r1, #5
	bgt _02237A24
	cmp r1, #0
	blt _02237A4C
	adds r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_02237A18: @ jump table
	.2byte _02237A4C - _02237A18 - 2 @ case 0
	.2byte _02237A2A - _02237A18 - 2 @ case 1
	.2byte _02237A30 - _02237A18 - 2 @ case 2
	.2byte _02237A36 - _02237A18 - 2 @ case 3
	.2byte _02237A4C - _02237A18 - 2 @ case 4
	.2byte _02237A3C - _02237A18 - 2 @ case 5
_02237A24:
	cmp r1, #0xe
	beq _02237A42
	b _02237A4C
_02237A2A:
	movs r1, #0
	str r1, [r0, #4]
	b _02237A54
_02237A30:
	subs r2, #0x1d
	str r2, [r0, #4]
	b _02237A54
_02237A36:
	subs r2, #0x1c
	str r2, [r0, #4]
	b _02237A54
_02237A3C:
	subs r2, #0x1b
	str r2, [r0, #4]
	b _02237A54
_02237A42:
	movs r1, #1
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237A54
_02237A4C:
	movs r1, #0xc
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237A54:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237A5A:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237A68
	cmp r0, #7
	beq _02237A80
	pop {r3, pc}
_02237A68:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237A80:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C020
	movs r1, #0x49
	lsls r1, r1, #2
	cmp r0, r1
	bne _02237A9A
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0
	str r1, [r0, #4]
	b _02237AD4
_02237A9A:
	ldr r0, _02237BC8 @ =0x02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #3
	beq _02237AB8
	cmp r0, #5
	beq _02237AAE
	cmp r0, #0xe
	beq _02237AC2
	b _02237ACC
_02237AAE:
	movs r1, #2
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237AD4
_02237AB8:
	movs r1, #3
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237AD4
_02237AC2:
	movs r1, #1
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237AD4
_02237ACC:
	movs r1, #0xc
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237AD4:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237ADA:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237AE8
	cmp r0, #7
	beq _02237B00
	pop {r3, pc}
_02237AE8:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237B00:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C020
	movs r1, #0x49
	lsls r1, r1, #2
	cmp r0, r1
	bne _02237B1A
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #1
	str r1, [r0, #4]
	b _02237B68
_02237B1A:
	ldr r0, _02237BC8 @ =0x02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #5
	bgt _02237B34
	cmp r0, #3
	blt _02237B60
	beq _02237B44
	cmp r0, #4
	beq _02237B4E
	cmp r0, #5
	beq _02237B3A
	b _02237B60
_02237B34:
	cmp r0, #0xe
	beq _02237B56
	b _02237B60
_02237B3A:
	movs r1, #2
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237B68
_02237B44:
	movs r1, #3
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237B68
_02237B4E:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0
	str r1, [r0, #4]
	b _02237B68
_02237B56:
	movs r1, #1
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237B68
_02237B60:
	movs r1, #0xc
	ldr r0, _02237BC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237B68:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237B6E:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237B7C
	cmp r0, #7
	beq _02237B94
	pop {r3, pc}
_02237B7C:
	ldr r0, _02237BC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237BC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237B94:
	ldr r1, _02237BC0 @ =0x02246800
	movs r2, #0x18
	ldr r0, _02237BC4 @ =0x02246920
	str r2, [r1]
	ldrb r0, [r0, #0x1c]
	cmp r0, #5
	bgt _02237BB2
	cmp r0, #1
	blt _02237BDE
	beq _02237BB8
	cmp r0, #3
	beq _02237BD2
	cmp r0, #5
	beq _02237BCC
	b _02237BDE
_02237BB2:
	cmp r0, #0xe
	beq _02237BD8
	b _02237BDE
_02237BB8:
	movs r0, #0
	str r0, [r1, #4]
	b _02237BE6
	nop
_02237BC0: .4byte 0x02246800
_02237BC4: .4byte 0x02246920
_02237BC8: .4byte 0x02246900
_02237BCC:
	subs r2, #0x1b
	str r2, [r1, #4]
	b _02237BE6
_02237BD2:
	subs r2, #0x1c
	str r2, [r1, #4]
	b _02237BE6
_02237BD8:
	subs r2, #0x1a
	str r2, [r1, #4]
	b _02237BE6
_02237BDE:
	movs r1, #0xc
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237BE6:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237BEC:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237BFA
	cmp r0, #7
	beq _02237C12
	pop {r3, pc}
_02237BFA:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237C12:
	ldr r0, _02237EC0 @ =0x02246800
	movs r2, #0x18
	ldr r1, _02237EC4 @ =0x02246920
	str r2, [r0]
	ldrb r1, [r1, #0x1c]
	cmp r1, #5
	bgt _02237C3C
	cmp r1, #0
	blt _02237C64
	adds r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_02237C30: @ jump table
	.2byte _02237C64 - _02237C30 - 2 @ case 0
	.2byte _02237C42 - _02237C30 - 2 @ case 1
	.2byte _02237C4E - _02237C30 - 2 @ case 2
	.2byte _02237C54 - _02237C30 - 2 @ case 3
	.2byte _02237C64 - _02237C30 - 2 @ case 4
	.2byte _02237C48 - _02237C30 - 2 @ case 5
_02237C3C:
	cmp r1, #0xe
	beq _02237C5A
	b _02237C64
_02237C42:
	movs r1, #0
	str r1, [r0, #4]
	b _02237C6C
_02237C48:
	subs r2, #0x1b
	str r2, [r0, #4]
	b _02237C6C
_02237C4E:
	subs r2, #0x1d
	str r2, [r0, #4]
	b _02237C6C
_02237C54:
	subs r2, #0x1c
	str r2, [r0, #4]
	b _02237C6C
_02237C5A:
	movs r1, #1
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237C6C
_02237C64:
	movs r1, #0xc
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237C6C:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237C72:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237C80
	cmp r0, #7
	beq _02237C98
	pop {r3, pc}
_02237C80:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237C98:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C020
	movs r1, #0x49
	lsls r1, r1, #2
	cmp r0, r1
	blo _02237CBC
	bl FUN_0221C020
	movs r1, #0x49
	lsls r1, r1, #2
	blx FUN_020F2BA4
	ldr r1, _02237EC0 @ =0x02246800
	str r0, [r1, #4]
	b _02237CE4
_02237CBC:
	cmp r0, #0
	bne _02237CC8
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0
	str r1, [r0, #4]
	b _02237CE4
_02237CC8:
	ldr r0, _02237EC8 @ =0x02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _02237CDC
	movs r1, #1
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237CE4
_02237CDC:
	movs r1, #0xc
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237CE4:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237CEA:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237CF8
	cmp r0, #7
	beq _02237D10
	pop {r3, pc}
_02237CF8:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237D10:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C020
	movs r1, #0x49
	lsls r1, r1, #2
	cmp r0, r1
	bne _02237D2A
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0
	str r1, [r0, #4]
	b _02237DB6
_02237D2A:
	ldr r0, _02237EC8 @ =0x02246900
	ldr r0, [r0, #0x40]
	ldrb r0, [r0]
	cmp r0, #0xe
	bhi _02237DAE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237D40: @ jump table
	.2byte _02237DAE - _02237D40 - 2 @ case 0
	.2byte _02237DAE - _02237D40 - 2 @ case 1
	.2byte _02237D5E - _02237D40 - 2 @ case 2
	.2byte _02237DAE - _02237D40 - 2 @ case 3
	.2byte _02237DAE - _02237D40 - 2 @ case 4
	.2byte _02237DAE - _02237D40 - 2 @ case 5
	.2byte _02237DAE - _02237D40 - 2 @ case 6
	.2byte _02237DAE - _02237D40 - 2 @ case 7
	.2byte _02237D7C - _02237D40 - 2 @ case 8
	.2byte _02237D86 - _02237D40 - 2 @ case 9
	.2byte _02237D90 - _02237D40 - 2 @ case 10
	.2byte _02237D9A - _02237D40 - 2 @ case 11
	.2byte _02237D68 - _02237D40 - 2 @ case 12
	.2byte _02237D72 - _02237D40 - 2 @ case 13
	.2byte _02237DA4 - _02237D40 - 2 @ case 14
_02237D5E:
	movs r1, #4
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D68:
	movs r1, #5
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D72:
	movs r1, #6
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D7C:
	movs r1, #7
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D86:
	movs r1, #8
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D90:
	movs r1, #9
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237D9A:
	movs r1, #0xa
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237DA4:
	movs r1, #1
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237DB6
_02237DAE:
	movs r1, #0xc
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237DB6:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237DBC:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237DCA
	cmp r0, #7
	beq _02237DE2
	pop {r3, pc}
_02237DCA:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237DE2:
	ldr r1, _02237EC0 @ =0x02246800
	movs r2, #0x18
	ldr r0, _02237EC4 @ =0x02246920
	str r2, [r1]
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	beq _02237DFA
	cmp r0, #2
	beq _02237E06
	cmp r0, #0xe
	beq _02237E00
	b _02237E0A
_02237DFA:
	movs r0, #0
	str r0, [r1, #4]
	b _02237E0A
_02237E00:
	subs r2, #0x1a
	str r2, [r1, #4]
	b _02237E0A
_02237E06:
	subs r2, #0x1d
	str r2, [r1, #4]
_02237E0A:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237E10:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237E1E
	cmp r0, #7
	beq _02237E36
	pop {r3, pc}
_02237E1E:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237E36:
	ldr r1, _02237EC0 @ =0x02246800
	movs r2, #0x18
	ldr r0, _02237EC4 @ =0x02246920
	str r2, [r1]
	ldrb r0, [r0, #0x1c]
	cmp r0, #7
	bgt _02237E54
	cmp r0, #1
	blt _02237E72
	beq _02237E5A
	cmp r0, #6
	beq _02237E60
	cmp r0, #7
	beq _02237E66
	b _02237E72
_02237E54:
	cmp r0, #0xe
	beq _02237E6C
	b _02237E72
_02237E5A:
	movs r0, #0
	str r0, [r1, #4]
	b _02237E7A
_02237E60:
	movs r0, #1
	str r0, [r1, #4]
	b _02237E7A
_02237E66:
	movs r0, #2
	str r0, [r1, #4]
	b _02237E7A
_02237E6C:
	subs r2, #0x1a
	str r2, [r1, #4]
	b _02237E7A
_02237E72:
	movs r1, #0xc
	ldr r0, _02237EC0 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237E7A:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237E80:
	bl FUN_0221BF48
	cmp r0, #1
	beq _02237E8E
	cmp r0, #7
	beq _02237EA6
	pop {r3, pc}
_02237E8E:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C014
	bl ov70_02238398
	ldr r1, _02237EC0 @ =0x02246800
	str r0, [r1, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
_02237EA6:
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	bl FUN_0221C020
	cmp r0, #8
	bne _02237EBC
	ldr r0, _02237EC0 @ =0x02246800
	movs r1, #0
	str r1, [r0, #4]
	b _02237F12
_02237EBC:
	ldr r0, _02237EC4 @ =0x02246920
	b _02237ECC
	.align 2, 0
_02237EC0: .4byte 0x02246800
_02237EC4: .4byte 0x02246920
_02237EC8: .4byte 0x02246900
_02237ECC:
	ldrb r0, [r0, #0x1c]
	cmp r0, #7
	bgt _02237EE2
	cmp r0, #1
	blt _02237F0A
	beq _02237EE8
	cmp r0, #6
	beq _02237EF0
	cmp r0, #7
	beq _02237EF8
	b _02237F0A
_02237EE2:
	cmp r0, #0xe
	beq _02237F00
	b _02237F0A
_02237EE8:
	ldr r0, _02237F28 @ =0x02246800
	movs r1, #0
	str r1, [r0, #4]
	b _02237F12
_02237EF0:
	ldr r0, _02237F28 @ =0x02246800
	movs r1, #1
	str r1, [r0, #4]
	b _02237F12
_02237EF8:
	ldr r0, _02237F28 @ =0x02246800
	movs r1, #2
	str r1, [r0, #4]
	b _02237F12
_02237F00:
	movs r1, #1
	ldr r0, _02237F28 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
	b _02237F12
_02237F0A:
	movs r1, #0xc
	ldr r0, _02237F28 @ =0x02246800
	mvns r1, r1
	str r1, [r0, #4]
_02237F12:
	bl FUN_0221BFEC
	pop {r3, pc}
_02237F18:
	movs r0, #0x18
	str r0, [r1]
	subs r0, #0x24
	str r0, [r1, #4]
	bl FUN_0221BFEC
_02237F24:
	pop {r3, pc}
	nop
_02237F28: .4byte 0x02246800
	thumb_func_end ov70_022378DC

	thumb_func_start ov70_02237F2C
ov70_02237F2C: @ 0x02237F2C
	ldr r0, _02237F34 @ =0x02246800
	movs r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_02237F34: .4byte 0x02246800
	thumb_func_end ov70_02237F2C

	thumb_func_start ov70_02237F38
ov70_02237F38: @ 0x02237F38
	ldr r1, _02237F54 @ =0x02246800
	ldr r0, [r1]
	cmp r0, #1
	beq _02237F46
	cmp r0, #0x18
	beq _02237F4A
	b _02237F50
_02237F46:
	movs r0, #1
	bx lr
_02237F4A:
	movs r0, #1
	str r0, [r1]
	bx lr
_02237F50:
	movs r0, #0
	bx lr
	.align 2, 0
_02237F54: .4byte 0x02246800
	thumb_func_end ov70_02237F38

	thumb_func_start ov70_02237F58
ov70_02237F58: @ 0x02237F58
	ldr r0, _02237F60 @ =0x02246800
	ldr r0, [r0, #4]
	bx lr
	nop
_02237F60: .4byte 0x02246800
	thumb_func_end ov70_02237F58

	thumb_func_start ov70_02237F64
ov70_02237F64: @ 0x02237F64
	push {r3, lr}
	adds r1, r0, #0
	movs r2, #0x49
	ldr r0, _02237FA4 @ =0x02246814
	lsls r2, r2, #2
	blx FUN_020E5AD8
	bl FUN_0221BE84
	movs r0, #2
	str r0, [sp]
	movs r2, #0x49
	ldr r0, _02237FA8 @ =0x022460A0
	ldr r1, _02237FA4 @ =0x02246814
	ldr r3, _02237FAC @ =0x0224693C
	lsls r2, r2, #2
	bl ov70_02238360
	cmp r0, #0
	beq _02237F94
	ldr r0, _02237FB0 @ =0x02246800
	movs r1, #2
	str r1, [r0]
	pop {r3, pc}
_02237F94:
	ldr r0, _02237FB0 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
	.align 2, 0
_02237FA4: .4byte 0x02246814
_02237FA8: .4byte 0x022460A0
_02237FAC: .4byte 0x0224693C
_02237FB0: .4byte 0x02246800
	thumb_func_end ov70_02237F64

	thumb_func_start ov70_02237FB4
ov70_02237FB4: @ 0x02237FB4
	push {r3, lr}
	ldr r0, _02237FF4 @ =0x0224680C
	ldr r2, _02237FF8 @ =0x02246814
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r2]
	str r0, [r2, #4]
	bl FUN_0221BE84
	movs r0, #2
	str r0, [sp]
	ldr r0, _02237FFC @ =0x022460EC
	ldr r1, _02237FF8 @ =0x02246814
	ldr r3, _02238000 @ =0x0224693C
	movs r2, #8
	bl ov70_02238360
	cmp r0, #0
	beq _02237FE2
	ldr r0, _02238004 @ =0x02246800
	movs r1, #4
	str r1, [r0]
	pop {r3, pc}
_02237FE2:
	ldr r0, _02238004 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
	nop
_02237FF4: .4byte 0x0224680C
_02237FF8: .4byte 0x02246814
_02237FFC: .4byte 0x022460EC
_02238000: .4byte 0x0224693C
_02238004: .4byte 0x02246800
	thumb_func_end ov70_02237FB4

	thumb_func_start ov70_02238008
ov70_02238008: @ 0x02238008
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _02238048 @ =0x02246900
	str r4, [r0, #0x40]
	bl FUN_0221BE84
	movs r0, #0x49
	lsls r0, r0, #2
	str r0, [sp]
	ldr r0, _0223804C @ =0x0224613C
	ldr r1, _02238050 @ =0x02246814
	movs r2, #0
	adds r3, r4, #0
	bl ov70_02238360
	cmp r0, #0
	beq _02238036
	ldr r0, _02238054 @ =0x02246800
	movs r1, #6
	str r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
_02238036:
	ldr r0, _02238054 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02238048: .4byte 0x02246900
_0223804C: .4byte 0x0224613C
_02238050: .4byte 0x02246814
_02238054: .4byte 0x02246800
	thumb_func_end ov70_02238008

	thumb_func_start ov70_02238058
ov70_02238058: @ 0x02238058
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _02238098 @ =0x02246900
	str r4, [r0, #0x40]
	bl FUN_0221BE84
	movs r0, #0x49
	lsls r0, r0, #2
	str r0, [sp]
	ldr r0, _0223809C @ =0x02246184
	ldr r1, _022380A0 @ =0x02246814
	movs r2, #0
	adds r3, r4, #0
	bl ov70_02238360
	cmp r0, #0
	beq _02238086
	ldr r0, _022380A4 @ =0x02246800
	movs r1, #8
	str r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
_02238086:
	ldr r0, _022380A4 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02238098: .4byte 0x02246900
_0223809C: .4byte 0x02246184
_022380A0: .4byte 0x02246814
_022380A4: .4byte 0x02246800
	thumb_func_end ov70_02238058

	thumb_func_start ov70_022380A8
ov70_022380A8: @ 0x022380A8
	push {r3, lr}
	bl FUN_0221BE84
	movs r0, #2
	str r0, [sp]
	ldr r0, _022380DC @ =0x022461D0
	ldr r1, _022380E0 @ =0x02246814
	ldr r3, _022380E4 @ =0x0224693C
	movs r2, #0
	bl ov70_02238360
	cmp r0, #0
	beq _022380CA
	ldr r0, _022380E8 @ =0x02246800
	movs r1, #0xa
	str r1, [r0]
	pop {r3, pc}
_022380CA:
	ldr r0, _022380E8 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
	nop
_022380DC: .4byte 0x022461D0
_022380E0: .4byte 0x02246814
_022380E4: .4byte 0x0224693C
_022380E8: .4byte 0x02246800
	thumb_func_end ov70_022380A8

	thumb_func_start ov70_022380EC
ov70_022380EC: @ 0x022380EC
	push {r3, lr}
	bl FUN_0221BE84
	movs r0, #2
	str r0, [sp]
	ldr r0, _02238120 @ =0x0224621C
	ldr r1, _02238124 @ =0x02246814
	ldr r3, _02238128 @ =0x0224693C
	movs r2, #0
	bl ov70_02238360
	cmp r0, #0
	beq _0223810E
	ldr r0, _0223812C @ =0x02246800
	movs r1, #0xc
	str r1, [r0]
	pop {r3, pc}
_0223810E:
	ldr r0, _0223812C @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
	nop
_02238120: .4byte 0x0224621C
_02238124: .4byte 0x02246814
_02238128: .4byte 0x0224693C
_0223812C: .4byte 0x02246800
	thumb_func_end ov70_022380EC

	thumb_func_start ov70_02238130
ov70_02238130: @ 0x02238130
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _02238194 @ =0x02246900
	adds r6, r2, #0
	str r6, [r0, #0x40]
	adds r4, r1, #0
	bl FUN_0221BE84
	ldrb r0, [r5]
	ldr r1, _02238198 @ =0x02246814
	movs r2, #7
	strb r0, [r1]
	ldrb r0, [r5, #1]
	adds r3, r6, #0
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #3]
	ldrb r0, [r5, #4]
	strb r0, [r1, #4]
	ldrb r0, [r5, #5]
	strb r0, [r1, #5]
	ldr r0, _0223819C @ =0x02246800
	strb r4, [r0, #0x1a]
	movs r0, #0x49
	lsls r0, r0, #2
	muls r0, r4, r0
	str r0, [sp]
	ldr r0, _022381A0 @ =0x02246268
	bl ov70_02238360
	cmp r0, #0
	beq _02238180
	ldr r0, _0223819C @ =0x02246800
	movs r1, #0xe
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02238180:
	ldr r0, _0223819C @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02238194: .4byte 0x02246900
_02238198: .4byte 0x02246814
_0223819C: .4byte 0x02246800
_022381A0: .4byte 0x02246268
	thumb_func_end ov70_02238130

	thumb_func_start ov70_022381A4
ov70_022381A4: @ 0x022381A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _022381F8 @ =0x02246900
	adds r4, r1, #0
	str r4, [r0, #0x40]
	bl FUN_0221BE84
	ldr r3, _022381FC @ =0x02246814
	adds r2, r5, #0
	movs r1, #8
_022381B8:
	ldrb r0, [r2]
	adds r2, r2, #1
	strb r0, [r3]
	adds r3, r3, #1
	subs r1, r1, #1
	bne _022381B8
	movs r0, #6
	ldrsb r1, [r5, r0]
	movs r0, #0x49
	lsls r0, r0, #2
	muls r0, r1, r0
	str r0, [sp]
	ldr r0, _02238200 @ =0x02246268
	ldr r1, _022381FC @ =0x02246814
	movs r2, #8
	adds r3, r4, #0
	bl ov70_02238360
	cmp r0, #0
	beq _022381E8
	ldr r0, _02238204 @ =0x02246800
	movs r1, #0xe
	str r1, [r0]
	pop {r3, r4, r5, pc}
_022381E8:
	ldr r0, _02238204 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, r4, r5, pc}
	.align 2, 0
_022381F8: .4byte 0x02246900
_022381FC: .4byte 0x02246814
_02238200: .4byte 0x02246268
_02238204: .4byte 0x02246800
	thumb_func_end ov70_022381A4

	thumb_func_start ov70_02238208
ov70_02238208: @ 0x02238208
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0223825C @ =0x02246900
	adds r6, r2, #0
	adds r4, r1, #0
	str r6, [r0, #0x40]
	bl FUN_0221BE84
	movs r2, #0x49
	ldr r0, _02238260 @ =0x02246814
	adds r1, r4, #0
	lsls r2, r2, #2
	blx FUN_020E5AD8
	ldr r0, _0223825C @ =0x02246900
	movs r2, #0x49
	str r5, [r0, #0x38]
	lsls r2, r2, #2
	str r2, [sp]
	ldr r0, _02238264 @ =0x022462B4
	ldr r1, _02238260 @ =0x02246814
	adds r2, r2, #4
	adds r3, r6, #0
	bl ov70_02238360
	cmp r0, #0
	beq _0223824A
	ldr r0, _02238268 @ =0x02246800
	movs r1, #0x10
	str r1, [r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0223824A:
	ldr r0, _02238268 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0223825C: .4byte 0x02246900
_02238260: .4byte 0x02246814
_02238264: .4byte 0x022462B4
_02238268: .4byte 0x02246800
	thumb_func_end ov70_02238208

	thumb_func_start ov70_0223826C
ov70_0223826C: @ 0x0223826C
	push {r3, lr}
	ldr r0, _022382AC @ =0x0224680C
	ldr r2, _022382B0 @ =0x02246814
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r2]
	str r0, [r2, #4]
	bl FUN_0221BE84
	movs r0, #2
	str r0, [sp]
	ldr r0, _022382B4 @ =0x02246304
	ldr r1, _022382B0 @ =0x02246814
	ldr r3, _022382B8 @ =0x0224693C
	movs r2, #8
	bl ov70_02238360
	cmp r0, #0
	beq _0223829A
	ldr r0, _022382BC @ =0x02246800
	movs r1, #0x12
	str r1, [r0]
	pop {r3, pc}
_0223829A:
	ldr r0, _022382BC @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
	nop
_022382AC: .4byte 0x0224680C
_022382B0: .4byte 0x02246814
_022382B4: .4byte 0x02246304
_022382B8: .4byte 0x0224693C
_022382BC: .4byte 0x02246800
	thumb_func_end ov70_0223826C

	thumb_func_start ov70_022382C0
ov70_022382C0: @ 0x022382C0
	push {r3, lr}
	bl FUN_0221BE84
	movs r0, #2
	str r0, [sp]
	ldr r0, _022382F4 @ =0x02246358
	ldr r1, _022382F8 @ =0x02246814
	ldr r3, _022382FC @ =0x0224693C
	movs r2, #0
	bl ov70_02238360
	cmp r0, #0
	beq _022382E2
	ldr r0, _02238300 @ =0x02246800
	movs r1, #0x14
	str r1, [r0]
	pop {r3, pc}
_022382E2:
	ldr r0, _02238300 @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, pc}
	nop
_022382F4: .4byte 0x02246358
_022382F8: .4byte 0x02246814
_022382FC: .4byte 0x0224693C
_02238300: .4byte 0x02246800
	thumb_func_end ov70_022382C0

	thumb_func_start ov70_02238304
ov70_02238304: @ 0x02238304
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x1c
	adds r4, r1, #0
	blx FUN_020D3C40
	ldr r0, _02238350 @ =0x02246814
	adds r1, r5, #0
	movs r2, #0x64
	blx FUN_020E5AD8
	ldr r0, _02238354 @ =0x02246900
	str r4, [r0, #0x40]
	bl FUN_0221BE84
	movs r0, #8
	str r0, [sp]
	ldr r3, _02238354 @ =0x02246900
	ldr r0, _02238358 @ =0x022463A4
	ldr r1, _02238350 @ =0x02246814
	ldr r3, [r3, #0x40]
	movs r2, #0x64
	bl ov70_02238360
	cmp r0, #0
	beq _02238340
	ldr r0, _0223835C @ =0x02246800
	movs r1, #0x16
	str r1, [r0]
	pop {r3, r4, r5, pc}
_02238340:
	ldr r0, _0223835C @ =0x02246800
	movs r1, #0x18
	str r1, [r0]
	subs r1, #0x25
	str r1, [r0, #4]
	bl FUN_0221BFEC
	pop {r3, r4, r5, pc}
	.align 2, 0
_02238350: .4byte 0x02246814
_02238354: .4byte 0x02246900
_02238358: .4byte 0x022463A4
_0223835C: .4byte 0x02246800
	thumb_func_end ov70_02238304

	thumb_func_start ov70_02238360
ov70_02238360: @ 0x02238360
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	ldr r1, [sp, #0x18]
	str r3, [sp]
	str r1, [sp, #4]
	adds r4, r2, #0
	ldr r1, _02238394 @ =0x02246800
	adds r2, r5, #0
	ldr r1, [r1, #8]
	adds r3, r4, #0
	bl FUN_0221BEA8
	cmp r0, #0
	beq _02238386
	cmp r0, #1
	beq _0223838C
	cmp r0, #2
	b _0223838C
_02238386:
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223838C:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02238394: .4byte 0x02246800
	thumb_func_end ov70_02238360

	thumb_func_start ov70_02238398
ov70_02238398: @ 0x02238398
	push {r4, lr}
	cmp r0, #0x20
	bhi _02238410
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022383AA: @ jump table
	.2byte _022383EC - _022383AA - 2 @ case 0
	.2byte _022383EC - _022383AA - 2 @ case 1
	.2byte _022383F2 - _022383AA - 2 @ case 2
	.2byte _022383EC - _022383AA - 2 @ case 3
	.2byte _022383EC - _022383AA - 2 @ case 4
	.2byte _022383EC - _022383AA - 2 @ case 5
	.2byte _022383EC - _022383AA - 2 @ case 6
	.2byte _02238410 - _022383AA - 2 @ case 7
	.2byte _022383F2 - _022383AA - 2 @ case 8
	.2byte _022383EC - _022383AA - 2 @ case 9
	.2byte _022383EC - _022383AA - 2 @ case 10
	.2byte _022383F8 - _022383AA - 2 @ case 11
	.2byte _022383FE - _022383AA - 2 @ case 12
	.2byte _022383FE - _022383AA - 2 @ case 13
	.2byte _022383EC - _022383AA - 2 @ case 14
	.2byte _0223840A - _022383AA - 2 @ case 15
	.2byte _02238404 - _022383AA - 2 @ case 16
	.2byte _02238404 - _022383AA - 2 @ case 17
	.2byte _02238404 - _022383AA - 2 @ case 18
	.2byte _02238404 - _022383AA - 2 @ case 19
	.2byte _022383EC - _022383AA - 2 @ case 20
	.2byte _022383EC - _022383AA - 2 @ case 21
	.2byte _022383EC - _022383AA - 2 @ case 22
	.2byte _022383EC - _022383AA - 2 @ case 23
	.2byte _02238410 - _022383AA - 2 @ case 24
	.2byte _022383F2 - _022383AA - 2 @ case 25
	.2byte _02238404 - _022383AA - 2 @ case 26
	.2byte _02238404 - _022383AA - 2 @ case 27
	.2byte _02238404 - _022383AA - 2 @ case 28
	.2byte _02238404 - _022383AA - 2 @ case 29
	.2byte _0223840A - _022383AA - 2 @ case 30
	.2byte _02238404 - _022383AA - 2 @ case 31
	.2byte _022383EC - _022383AA - 2 @ case 32
_022383EC:
	movs r4, #0xc
	mvns r4, r4
	b _02238414
_022383F2:
	movs r4, #0xc
	mvns r4, r4
	b _02238414
_022383F8:
	movs r4, #0xe
	mvns r4, r4
	b _02238414
_022383FE:
	movs r4, #0xe
	mvns r4, r4
	b _02238414
_02238404:
	movs r4, #1
	mvns r4, r4
	b _02238414
_0223840A:
	movs r4, #1
	mvns r4, r4
	b _02238414
_02238410:
	movs r4, #0xc
	mvns r4, r4
_02238414:
	movs r0, #0xc
	mvns r0, r0
	cmp r4, r0
	beq _0223842C
	blx FUN_020AE420
	cmp r0, #9
	beq _02238428
	movs r4, #0xd
	mvns r4, r4
_02238428:
	blx FUN_021EC210
_0223842C:
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov70_02238398

	thumb_func_start ov70_02238430
ov70_02238430: @ 0x02238430
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02238446
	cmp r0, #1
	bne _02238444
	b _0223856E
_02238444:
	b _02238582
_02238446:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02238588 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _0223858C @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	bl ov70_02238880
	movs r2, #7
	movs r0, #3
	movs r1, #0x3d
	lsls r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020915B0
	bl FUN_02091614
	movs r0, #0x3d
	bl FUN_02039FD8
	ldr r1, _02238590 @ =0x00001608
	adds r0, r6, #0
	movs r2, #0x3d
	bl FUN_02007280
	ldr r2, _02238590 @ =0x00001608
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0x3d
	bl FUN_0201AC88
	str r0, [r4, #4]
	ldr r0, _02238594 @ =0x02246944
	add r2, sp, #0
	ldr r3, _02238598 @ =0x022451F8
	str r4, [r0, #4]
	adds r7, r2, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r7, #0
	bl FUN_0201ACB0
	movs r0, #4
	movs r1, #0x3d
	bl FUN_02002CEC
	movs r0, #0xb
	movs r1, #0x40
	movs r2, #0x3d
	bl FUN_0200BD18
	ldr r1, _0223859C @ =0x00000B9C
	ldr r2, _022385A0 @ =0x00000307
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x3d
	bl FUN_0200BAF8
	movs r1, #0xba
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _022385A4 @ =0x0000030A
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x3d
	bl FUN_0200BAF8
	ldr r1, _022385A8 @ =0x00000BA8
	movs r2, #0x32
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #4
	movs r3, #0x3d
	bl FUN_0200BAF8
	ldr r1, _022385AC @ =0x00000BAC
	movs r2, #0xed
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x3d
	bl FUN_0200BAF8
	ldr r1, _022385B0 @ =0x00000BA4
	ldr r2, _022385B4 @ =0x0000031E
	str r0, [r4, r1]
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x3d
	bl FUN_0200BAF8
	movs r1, #0xbb
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov70_02238818
	adds r0, r4, #0
	bl ov70_02238E70
	ldr r1, _022385B8 @ =0x0000047D
	movs r0, #0xb
	movs r2, #1
	bl FUN_02004EC4
	ldr r1, _022385BC @ =0x00020020
	movs r0, #0x3d
	bl FUN_0201AA8C
	str r0, [r4, #0x4c]
	adds r0, #0x1f
	movs r1, #0x1f
	bics r0, r1
	movs r1, #2
	lsls r1, r1, #0x10
	movs r2, #0
	blx FUN_020B535C
	str r0, [r4, #0x50]
	movs r0, #1
	str r0, [r5]
	b _02238582
_0223856E:
	bl FUN_02034D8C
	movs r0, #1
	bl FUN_02002B8C
	movs r0, #0
	str r0, [r5]
	add sp, #0x10
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02238582:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02238588: .4byte 0xFFFFE0FF
_0223858C: .4byte 0x04001000
_02238590: .4byte 0x00001608
_02238594: .4byte 0x02246944
_02238598: .4byte 0x022451F8
_0223859C: .4byte 0x00000B9C
_022385A0: .4byte 0x00000307
_022385A4: .4byte 0x0000030A
_022385A8: .4byte 0x00000BA8
_022385AC: .4byte 0x00000BAC
_022385B0: .4byte 0x00000BA4
_022385B4: .4byte 0x0000031E
_022385B8: .4byte 0x0000047D
_022385BC: .4byte 0x00020020
	thumb_func_end ov70_02238430

	thumb_func_start ov70_022385C0
ov70_022385C0: @ 0x022385C0
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	bl FUN_02007290
	adds r4, r0, #0
	blx FUN_021ECB40
	bl ov70_022378DC
	ldr r1, [r5]
	cmp r1, #5
	bhi _022386BA
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022385E4: @ jump table
	.2byte _022385F0 - _022385E4 - 2 @ case 0
	.2byte _0223860C - _022385E4 - 2 @ case 1
	.2byte _02238634 - _022385E4 - 2 @ case 2
	.2byte _02238642 - _022385E4 - 2 @ case 3
	.2byte _02238656 - _022385E4 - 2 @ case 4
	.2byte _022386B6 - _022385E4 - 2 @ case 5
_022385F0:
	bl FUN_02034DB8
	cmp r0, #0
	beq _022386BA
	ldr r1, [r4, #0x50]
	ldr r0, _022386D8 @ =0x02246944
	str r1, [r0]
	ldr r0, _022386DC @ =ov70_02238DF8
	ldr r1, _022386E0 @ =ov70_02238E20
	blx FUN_021EC294
	movs r0, #1
	str r0, [r5]
	b _022386BA
_0223860C:
	ldr r3, [r4, #0x14]
	movs r2, #0xc
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r2, _022386E4 @ =0x022463EC
	adds r0, r4, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r5]
	bl ov70_02238880
	movs r0, #0x45
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022386BA
	adds r0, r4, #0
	bl ov70_02238E98
	b _022386BA
_02238634:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022386BA
	movs r0, #3
	str r0, [r5]
	b _022386BA
_02238642:
	ldr r3, [r4, #0x14]
	movs r2, #0xc
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r2, _022386E8 @ =0x022463F0
	adds r0, r4, #0
	ldr r2, [r2, r6]
	blx r2
	str r0, [r5]
	b _022386BA
_02238656:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022386BA
	movs r0, #0x45
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022386A0
	adds r0, r4, #0
	bl ov70_02238E70
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl FUN_02028F94
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov70_02240D74
	movs r1, #0x4a
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0
	bl ov70_02241184
	adds r0, r4, #0
	bl ov70_02239C6C
	adds r0, r4, #0
	bl ov70_02239CF8
	movs r0, #0x45
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_022386A0:
	ldr r3, [r4, #0x14]
	movs r2, #0xc
	adds r6, r3, #0
	muls r6, r2, r6
	ldr r2, _022386EC @ =0x022463F4
	ldr r1, [r5]
	ldr r2, [r2, r6]
	adds r0, r4, #0
	blx r2
	str r0, [r5]
	b _022386BA
_022386B6:
	movs r0, #1
	pop {r4, r5, r6, pc}
_022386BA:
	adds r0, r4, #0
	bl ov70_02238F04
	adds r0, r4, #0
	bl ov70_02238F24
	ldr r0, _022386F0 @ =0x00000BF4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022386D2
	bl FUN_0202457C
_022386D2:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_022386D8: .4byte 0x02246944
_022386DC: .4byte ov70_02238DF8
_022386E0: .4byte ov70_02238E20
_022386E4: .4byte 0x022463EC
_022386E8: .4byte 0x022463F0
_022386EC: .4byte 0x022463F4
_022386F0: .4byte 0x00000BF4
	thumb_func_end ov70_022385C0

	thumb_func_start ov70_022386F4
ov70_022386F4: @ 0x022386F4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl FUN_0201AB0C
	bl FUN_02091624
	bl FUN_020915C0
	adds r0, r4, #0
	bl ov70_02238E98
	ldr r0, _02238794 @ =0x00000BA4
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	ldr r0, _02238798 @ =0x00000BAC
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	ldr r0, _0223879C @ =0x00000BA8
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	movs r0, #0xbb
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	ldr r0, _022387A0 @ =0x00000B9C
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	adds r0, r4, #0
	bl ov70_0223887C
	bl FUN_02034DE0
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #4
	bl FUN_02002DB4
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022387A4 @ =0xFFFF1FFF
	ands r1, r0
	str r1, [r2]
	ldr r2, _022387A8 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #0x3d
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02238794: .4byte 0x00000BA4
_02238798: .4byte 0x00000BAC
_0223879C: .4byte 0x00000BA8
_022387A0: .4byte 0x00000B9C
_022387A4: .4byte 0xFFFF1FFF
_022387A8: .4byte 0x04001000
	thumb_func_end ov70_022386F4

	thumb_func_start ov70_022387AC
ov70_022387AC: @ 0x022387AC
	push {r4, lr}
	ldr r1, _022387E8 @ =0x00001204
	adds r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _022387C0
	blx r1
	ldr r0, _022387E8 @ =0x00001204
	movs r1, #0
	str r1, [r4, r0]
_022387C0:
	ldr r0, _022387EC @ =0x00001208
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _022387CC
	adds r0, r4, #0
	blx r1
_022387CC:
	ldr r0, [r4, #4]
	bl FUN_0201EEB4
	bl FUN_0202061C
	bl FUN_0200B224
	ldr r3, _022387F0 @ =0x027E0000
	ldr r1, _022387F4 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_022387E8: .4byte 0x00001204
_022387EC: .4byte 0x00001208
_022387F0: .4byte 0x027E0000
_022387F4: .4byte 0x00003FF8
	thumb_func_end ov70_022387AC

	thumb_func_start ov70_022387F8
ov70_022387F8: @ 0x022387F8
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02238814 @ =0x02245218
	add r3, sp, #0
	movs r2, #5
_02238802:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02238802
	add r0, sp, #0
	bl FUN_02022BE8
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0
_02238814: .4byte 0x02245218
	thumb_func_end ov70_022387F8

	thumb_func_start ov70_02238818
ov70_02238818: @ 0x02238818
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_020072A4
	movs r1, #0
	str r0, [r4]
	adds r0, r4, #0
	adds r2, r1, #0
	str r1, [r4, #0x14]
	bl ov70_02238E50
	movs r1, #0x47
	movs r0, #0
	lsls r1, r1, #2
	strh r0, [r4, r1]
	ldr r1, _02238874 @ =0x00000B8A
	movs r3, #3
	strh r0, [r4, r1]
	adds r2, r1, #2
	strb r3, [r4, r2]
	adds r2, r1, #3
	strb r0, [r4, r2]
	adds r2, r1, #4
	strb r0, [r4, r2]
	adds r1, r1, #6
	ldr r2, _02238878 @ =0x000011DC
	strh r0, [r4, r1]
	movs r3, #0x12
	strh r0, [r4, r2]
	lsls r1, r3, #4
	strh r3, [r4, r1]
	adds r1, r2, #0
	adds r1, #0x1c
	strh r0, [r4, r1]
	adds r1, r2, #0
	adds r1, #0x1e
	strh r0, [r4, r1]
	adds r1, r2, #2
	strh r0, [r4, r1]
	adds r1, r2, #0
	subs r1, #0x20
	str r0, [r4, r1]
	adds r2, #0xf0
	str r0, [r4, r2]
	pop {r4, pc}
	.align 2, 0
_02238874: .4byte 0x00000B8A
_02238878: .4byte 0x000011DC
	thumb_func_end ov70_02238818

	thumb_func_start ov70_0223887C
ov70_0223887C: @ 0x0223887C
	bx lr
	.align 2, 0
	thumb_func_end ov70_0223887C

	thumb_func_start ov70_02238880
ov70_02238880: @ 0x02238880
	ldr r3, _022388C0 @ =0x04001000
	ldr r0, _022388C4 @ =0xFFFF1FFF
	ldr r1, [r3]
	lsls r2, r3, #0xe
	ands r1, r0
	str r1, [r3]
	ldr r1, [r2]
	ands r1, r0
	lsrs r0, r3, #0xd
	orrs r0, r1
	str r0, [r2]
	ldr r0, _022388C8 @ =0x04000048
	movs r1, #0x3f
	ldrh r3, [r0]
	movs r2, #0x1f
	bics r3, r1
	orrs r3, r2
	strh r3, [r0]
	ldrh r3, [r0, #2]
	bics r3, r1
	orrs r2, r3
	movs r1, #0x20
	orrs r1, r2
	strh r1, [r0, #2]
	adds r1, r0, #0
	ldr r2, _022388CC @ =0x0000F0FF
	subs r1, #8
	strh r2, [r1]
	movs r1, #0x10
	subs r0, r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_022388C0: .4byte 0x04001000
_022388C4: .4byte 0xFFFF1FFF
_022388C8: .4byte 0x04000048
_022388CC: .4byte 0x0000F0FF
	thumb_func_end ov70_02238880

	thumb_func_start ov70_022388D0
ov70_022388D0: @ 0x022388D0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _022388FC @ =0x02245208
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	movs r0, #0x14
	movs r1, #0x3d
	bl FUN_02022588
	bl FUN_020216C8
	bl FUN_02022638
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_022388FC: .4byte 0x02245208
	thumb_func_end ov70_022388D0

	thumb_func_start ov70_02238900
ov70_02238900: @ 0x02238900
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	movs r0, #0x64
	movs r1, #0x3d
	bl FUN_02007688
	str r0, [sp, #0x18]
	blx FUN_020B78D4
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02238B2C @ =0xFFCFFFEF
	adds r3, r1, #0
	ands r3, r0
	movs r1, #0x10
	orrs r3, r1
	str r3, [r2]
	ldr r3, _02238B30 @ =0x04001000
	ldr r2, [r3]
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r1, #0x3d
	str r1, [sp, #0x10]
	movs r1, #0x7a
	adds r2, r0, #0
	bl FUN_0200B150
	ldr r1, _02238B34 @ =0x00000BF8
	movs r0, #0x54
	adds r1, r5, r1
	movs r2, #0x3d
	bl FUN_02009F40
	ldr r1, _02238B38 @ =0x00000BF4
	movs r2, #1
	str r0, [r5, r1]
	adds r0, r1, #4
	adds r0, r5, r0
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r7, #0xd2
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #4
_02238970:
	movs r0, #3
	adds r1, r6, #0
	movs r2, #0x3d
	bl FUN_0200A090
	str r0, [r4, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #4
	blt _02238970
	movs r0, #0
	str r0, [sp]
	movs r3, #1
	str r3, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0xd2
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x18]
	movs r2, #0x15
	bl FUN_0200A3C8
	movs r1, #0xd3
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r3, #0
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #3
	str r0, [sp, #8]
	movs r0, #0x3d
	subs r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	movs r2, #0xa
	bl FUN_0200A480
	ldr r1, _02238B3C @ =0x00000D34
	movs r2, #0x16
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x3d
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	movs r3, #1
	bl FUN_0200A540
	ldr r1, _02238B40 @ =0x00000D38
	movs r2, #0x17
	str r0, [r5, r1]
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x3d
	subs r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	movs r3, #1
	bl FUN_0200A540
	ldr r1, _02238B44 @ =0x00000D3C
	movs r3, #1
	str r0, [r5, r1]
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x3d
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	movs r2, #0x2b
	bl FUN_0200A3C8
	movs r1, #0x35
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0x3d
	subs r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	movs r2, #9
	movs r3, #0
	bl FUN_0200A480
	ldr r1, _02238B48 @ =0x00000D44
	movs r3, #1
	str r0, [r5, r1]
	str r3, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x3d
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	movs r2, #0x2c
	bl FUN_0200A540
	ldr r1, _02238B4C @ =0x00000D48
	movs r3, #1
	str r0, [r5, r1]
	str r3, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #0x3d
	subs r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	ldr r1, [sp, #0x18]
	movs r2, #0x2d
	bl FUN_0200A540
	ldr r1, _02238B50 @ =0x00000D4C
	str r0, [r5, r1]
	subs r1, #0x1c
	ldr r0, [r5, r1]
	bl FUN_0200ACF0
	movs r0, #0x35
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_0200ACF0
	ldr r0, _02238B3C @ =0x00000D34
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	ldr r0, _02238B48 @ =0x00000D44
	ldr r0, [r5, r0]
	bl FUN_0200AF94
	bl FUN_02074490
	adds r1, r0, #0
	movs r0, #0x14
	add r2, sp, #0x1c
	movs r3, #0x3d
	bl FUN_020079F4
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	movs r1, #0x60
	ldr r0, [r0, #0xc]
	blx FUN_020D2894
	ldr r0, [sp, #0x1c]
	movs r1, #0x60
	ldr r0, [r0, #0xc]
	adds r2, r1, #0
	blx FUN_020CFD18
	ldr r0, [sp, #0x1c]
	movs r7, #0x1f
	ldr r4, [r0, #0xc]
	movs r3, #0
	adds r5, r7, #0
_02238ACC:
	ldrh r2, [r4]
	movs r0, #0x1f
	adds r3, r3, #1
	adds r1, r2, #0
	ands r1, r0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
	asrs r0, r2, #0xa
	adds r6, r0, #0
	ands r6, r7
	lsrs r0, r6, #0x1f
	adds r0, r6, r0
	asrs r2, r2, #5
	adds r6, r2, #0
	ands r6, r5
	lsrs r2, r6, #0x1f
	adds r2, r6, r2
	asrs r0, r0, #1
	asrs r2, r2, #1
	lsls r0, r0, #0xa
	lsls r2, r2, #5
	orrs r0, r2
	orrs r0, r1
	strh r0, [r4]
	adds r4, r4, #2
	cmp r3, #0x30
	blt _02238ACC
	ldr r0, [sp, #0x1c]
	movs r1, #0x60
	ldr r0, [r0, #0xc]
	blx FUN_020D2894
	ldr r0, [sp, #0x1c]
	movs r1, #0xc0
	ldr r0, [r0, #0xc]
	movs r2, #0x60
	blx FUN_020CFD18
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238B2C: .4byte 0xFFCFFFEF
_02238B30: .4byte 0x04001000
_02238B34: .4byte 0x00000BF8
_02238B38: .4byte 0x00000BF4
_02238B3C: .4byte 0x00000D34
_02238B40: .4byte 0x00000D38
_02238B44: .4byte 0x00000D3C
_02238B48: .4byte 0x00000D44
_02238B4C: .4byte 0x00000D48
_02238B50: .4byte 0x00000D4C
	thumb_func_end ov70_02238900

	thumb_func_start ov70_02238B54
ov70_02238B54: @ 0x02238B54
	push {r3, r4}
	ldr r4, _02238B7C @ =0x00000BF4
	ldr r1, [r1, r4]
	str r1, [r0]
	str r2, [r0, #4]
	movs r2, #0
	movs r1, #1
	str r2, [r0, #0x10]
	lsls r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	movs r1, #1
	str r1, [r0, #0x24]
	str r3, [r0, #0x28]
	movs r1, #0x3d
	str r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	.align 2, 0
_02238B7C: .4byte 0x00000BF4
	thumb_func_end ov70_02238B54

	thumb_func_start ov70_02238B80
ov70_02238B80: @ 0x02238B80
	push {r3, r4, lr}
	sub sp, #0x2c
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	subs r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r2, #0xd2
	str r1, [sp, #0x10]
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	adds r3, r1, #0
	str r0, [sp, #0x14]
	adds r0, r2, #4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #8
	ldr r0, [r4, r0]
	str r0, [sp, #0x1c]
	adds r0, r2, #0
	adds r0, #0xc
	ldr r0, [r4, r0]
	adds r2, #0x40
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	adds r0, r4, r2
	adds r2, r1, #0
	str r1, [sp, #0x28]
	bl FUN_02009D48
	movs r1, #1
	movs r3, #0xd2
	str r1, [sp]
	subs r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r3, r3, #4
	ldr r2, [r4, r3]
	str r2, [sp, #0x14]
	adds r2, r3, #4
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	adds r2, r3, #0
	adds r2, #8
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	adds r2, r3, #0
	adds r2, #0xc
	ldr r2, [r4, r2]
	adds r3, #0x64
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	adds r0, r4, r3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02009D48
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x2c
	pop {r3, r4, pc}
	thumb_func_end ov70_02238B80

	thumb_func_start ov70_02238C14
ov70_02238C14: @ 0x02238C14
	push {r4, lr}
	sub sp, #8
	movs r4, #0
	str r4, [sp]
	add r4, sp, #0
	ldrb r4, [r4, #0x10]
	str r4, [sp, #4]
	bl ov70_02238C2C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02238C14

	thumb_func_start ov70_02238C2C
ov70_02238C2C: @ 0x02238C2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0x3d
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_0201660C
	str r0, [sp]
	add r0, sp, #0x20
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _02238C56
	ldr r1, [sp, #0x30]
	movs r0, #0
	cmp r1, #3
	bgt _02238C52
	movs r0, #1
_02238C52:
	bl ov70_02238FB4
_02238C56:
	ldr r0, [sp, #0x30]
	str r5, [sp, #4]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	str r7, [sp, #0x10]
	movs r0, #0x18
	add r1, sp, #4
	strb r0, [r1, #0x10]
	strb r4, [r1, #0x11]
	ldrb r2, [r1, #0x12]
	movs r0, #0xf
	bics r2, r0
	strb r2, [r1, #0x12]
	ldrb r2, [r1, #0x12]
	movs r0, #0xf0
	bics r2, r0
	strb r2, [r1, #0x12]
	movs r0, #0
	strb r0, [r1, #0x13]
	ldr r0, [sp]
	add r1, sp, #4
	bl FUN_020166FC
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov70_02238C2C

	thumb_func_start ov70_02238C8C
ov70_02238C8C: @ 0x02238C8C
	push {r4, lr}
	ldr r1, _02238CA8 @ =0x000011C8
	ldr r0, [r0, r1]
	bl FUN_020168F4
	adds r4, r0, #0
	subs r0, r4, #1
	cmp r0, #1
	bhi _02238CA2
	bl ov70_02238FE0
_02238CA2:
	adds r0, r4, #0
	pop {r4, pc}
	nop
_02238CA8: .4byte 0x000011C8
	thumb_func_end ov70_02238C8C

	thumb_func_start ov70_02238CAC
ov70_02238CAC: @ 0x02238CAC
	push {r4, r5, r6, lr}
	sub sp, #0x30
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x3d
	movs r1, #0
	adds r6, r2, #0
	bl FUN_02018424
	ldr r1, _02238D28 @ =0x000011CC
	movs r2, #0x18
	str r0, [r5, r1]
	add r0, sp, #0x18
	movs r1, #0
	blx FUN_020D4994
	ldr r2, _02238D2C @ =_022451EC
	add r0, sp, #0x18
	ldrh r3, [r2]
	add r1, sp, #0x18
	strh r3, [r0]
	ldrh r3, [r2, #2]
	strh r3, [r0, #2]
	ldrh r3, [r2, #4]
	strh r3, [r0, #4]
	ldrh r3, [r2, #6]
	strh r3, [r0, #6]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r0, #8]
	ldr r3, _02238D30 @ =0x000011AC
	strh r2, [r0, #0xa]
	ldr r2, [r5, r3]
	adds r3, #0x20
	str r2, [sp, #0x24]
	ldr r2, [r5, #4]
	str r2, [sp, #0x28]
	strb r4, [r0, #0x14]
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r2, #0
	ldr r0, _02238D34 @ =ov70_02238D38
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	movs r0, #1
	str r0, [sp, #0x14]
	ldr r0, [r5, r3]
	movs r3, #0x14
	bl FUN_02018648
	adds r4, r0, #0
	movs r0, #1
	bl ov70_02238FB4
	adds r0, r4, #0
	add sp, #0x30
	pop {r4, r5, r6, pc}
	nop
_02238D28: .4byte 0x000011CC
_02238D2C: .4byte _022451EC
_02238D30: .4byte 0x000011AC
_02238D34: .4byte ov70_02238D38
	thumb_func_end ov70_02238CAC

	thumb_func_start ov70_02238D38
ov70_02238D38: @ 0x02238D38
	push {r3, lr}
	cmp r3, #3
	bhi _02238D58
	adds r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02238D4A: @ jump table
	.2byte _02238D58 - _02238D4A - 2 @ case 0
	.2byte _02238D52 - _02238D4A - 2 @ case 1
	.2byte _02238D52 - _02238D4A - 2 @ case 2
	.2byte _02238D52 - _02238D4A - 2 @ case 3
_02238D52:
	ldr r0, _02238D5C @ =0x000005DC
	bl FUN_0200604C
_02238D58:
	pop {r3, pc}
	nop
_02238D5C: .4byte 0x000005DC
	thumb_func_end ov70_02238D38

	thumb_func_start ov70_02238D60
ov70_02238D60: @ 0x02238D60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02238D7C @ =0x000011D0
	ldr r0, [r4, r0]
	bl FUN_02018680
	ldr r0, _02238D80 @ =0x000011CC
	ldr r0, [r4, r0]
	bl FUN_02018474
	bl ov70_02238FE0
	pop {r4, pc}
	nop
_02238D7C: .4byte 0x000011D0
_02238D80: .4byte 0x000011CC
	thumb_func_end ov70_02238D60

	thumb_func_start ov70_02238D84
ov70_02238D84: @ 0x02238D84
	str r1, [r0, #0x2c]
	str r2, [r0, #0x30]
	bx lr
	.align 2, 0
	thumb_func_end ov70_02238D84

	thumb_func_start ov70_02238D8C
ov70_02238D8C: @ 0x02238D8C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	ble _02238DAA
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02238DB8
_02238DAA:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02238DB8:
	blx FUN_020F2104
	str r0, [sp]
	cmp r5, #0
	ble _02238DD4
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02238DE2
_02238DD4:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02238DE2:
	blx FUN_020F2104
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov70_02238D8C

	thumb_func_start ov70_02238DF8
ov70_02238DF8: @ 0x02238DF8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	blx FUN_020D3A38
	adds r6, r0, #0
	ldr r0, _02238E1C @ =0x02246944
	adds r1, r5, #0
	ldr r0, [r0]
	adds r2, r4, #0
	blx FUN_020B53A0
	adds r4, r0, #0
	adds r0, r6, #0
	blx FUN_020D3A4C
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02238E1C: .4byte 0x02246944
	thumb_func_end ov70_02238DF8

	thumb_func_start ov70_02238E20
ov70_02238E20: @ 0x02238E20
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	beq _02238E3C
	blx FUN_020D3A38
	adds r4, r0, #0
	ldr r0, _02238E40 @ =0x02246944
	adds r1, r5, #0
	ldr r0, [r0]
	blx FUN_020B5530
	adds r0, r4, #0
	blx FUN_020D3A4C
_02238E3C:
	pop {r3, r4, r5, pc}
	nop
_02238E40: .4byte 0x02246944
	thumb_func_end ov70_02238E20

	thumb_func_start ov70_02238E44
ov70_02238E44: @ 0x02238E44
	push {r3, lr}
	blx FUN_021EC9D4
	movs r1, #3
	subs r0, r1, r0
	pop {r3, pc}
	thumb_func_end ov70_02238E44

	thumb_func_start ov70_02238E50
ov70_02238E50: @ 0x02238E50
	str r1, [r0, #0x18]
	str r2, [r0, #0x24]
	bx lr
	.align 2, 0
	thumb_func_end ov70_02238E50

	thumb_func_start ov70_02238E58
ov70_02238E58: @ 0x02238E58
	ldr r1, [r0, #0x14]
	str r1, [r0, #0x20]
	ldr r1, [r0, #0x18]
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov70_02238E58

	thumb_func_start ov70_02238E64
ov70_02238E64: @ 0x02238E64
	ldr r0, [r0]
	ldr r3, _02238E6C @ =FUN_0202AD3C
	ldr r0, [r0, #0x24]
	bx r3
	.align 2, 0
_02238E6C: .4byte FUN_0202AD3C
	thumb_func_end ov70_02238E64

	thumb_func_start ov70_02238E70
ov70_02238E70: @ 0x02238E70
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022387F8
	bl ov70_022388D0
	adds r0, r4, #0
	bl ov70_02238900
	adds r0, r4, #0
	bl ov70_02238B80
	ldr r0, _02238E94 @ =ov70_022387AC
	adds r1, r4, #0
	bl FUN_0201A0FC
	pop {r4, pc}
	nop
_02238E94: .4byte ov70_022387AC
	thumb_func_end ov70_02238E70

	thumb_func_start ov70_02238E98
ov70_02238E98: @ 0x02238E98
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl ov70_02241308
	movs r0, #0xd3
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	movs r0, #0x35
	lsls r0, r0, #6
	ldr r0, [r6, r0]
	bl FUN_0200AEB0
	ldr r0, _02238EF8 @ =0x00000D34
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	ldr r0, _02238EFC @ =0x00000D44
	ldr r0, [r6, r0]
	bl FUN_0200B0A8
	movs r7, #0xd2
	movs r4, #0
	adds r5, r6, #0
	lsls r7, r7, #4
_02238ECC:
	ldr r0, [r5, r7]
	bl FUN_0200A0D0
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _02238ECC
	ldr r0, _02238F00 @ =0x00000BF4
	ldr r0, [r6, r0]
	bl FUN_02024504
	ldr r0, _02238F00 @ =0x00000BF4
	movs r1, #0
	str r1, [r6, r0]
	bl FUN_0200B244
	bl FUN_0202168C
	bl FUN_02022608
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238EF8: .4byte 0x00000D34
_02238EFC: .4byte 0x00000D44
_02238F00: .4byte 0x00000BF4
	thumb_func_end ov70_02238E98

	thumb_func_start ov70_02238F04
ov70_02238F04: @ 0x02238F04
	ldrh r1, [r0, #0x3a]
	cmp r1, #0
	beq _02238F0E
	subs r1, r1, #1
	strh r1, [r0, #0x3a]
_02238F0E:
	bx lr
	thumb_func_end ov70_02238F04

	thumb_func_start ov70_02238F10
ov70_02238F10: @ 0x02238F10
	ldr r1, _02238F20 @ =0x000011FA
	movs r2, #1
	strh r2, [r0, r1]
	movs r2, #0
	subs r1, r1, #2
	strh r2, [r0, r1]
	bx lr
	nop
_02238F20: .4byte 0x000011FA
	thumb_func_end ov70_02238F10

	thumb_func_start ov70_02238F24
ov70_02238F24: @ 0x02238F24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02238F5C @ =0x000011FA
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _02238F58
	ldr r0, [r4]
	subs r1, r1, #1
	ldr r0, [r0, #0xc]
	bl FUN_02073F64
	ldr r1, _02238F60 @ =0x000011F8
	ldrh r2, [r4, r1]
	adds r0, r2, r0
	strh r0, [r4, r1]
	adds r0, r1, #2
	ldrh r0, [r4, r0]
	adds r2, r0, #1
	adds r0, r1, #2
	strh r2, [r4, r0]
	ldrh r0, [r4, r0]
	cmp r0, #0x13
	bne _02238F58
	movs r2, #0
	adds r0, r1, #2
	strh r2, [r4, r0]
_02238F58:
	pop {r4, pc}
	nop
_02238F5C: .4byte 0x000011FA
_02238F60: .4byte 0x000011F8
	thumb_func_end ov70_02238F24

	thumb_func_start ov70_02238F64
ov70_02238F64: @ 0x02238F64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02238F78 @ =0x00000F18
	movs r1, #1
	adds r0, r4, r0
	bl FUN_0200F0AC
	ldr r1, _02238F7C @ =0x000011BC
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_02238F78: .4byte 0x00000F18
_02238F7C: .4byte 0x000011BC
	thumb_func_end ov70_02238F64

	thumb_func_start ov70_02238F80
ov70_02238F80: @ 0x02238F80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02238F98 @ =0x000011BC
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02238F96
	bl FUN_0200F450
	ldr r0, _02238F98 @ =0x000011BC
	movs r1, #0
	str r1, [r4, r0]
_02238F96:
	pop {r4, pc}
	.align 2, 0
_02238F98: .4byte 0x000011BC
	thumb_func_end ov70_02238F80

	thumb_func_start ov70_02238F9C
ov70_02238F9C: @ 0x02238F9C
	push {lr}
	sub sp, #0xc
	lsls r1, r1, #0xc
	str r1, [sp]
	lsls r1, r2, #0xc
	str r1, [sp, #4]
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {pc}
	.align 2, 0
	thumb_func_end ov70_02238F9C

	thumb_func_start ov70_02238FB4
ov70_02238FB4: @ 0x02238FB4
	push {r3, lr}
	cmp r0, #0
	beq _02238FC8
	movs r1, #0x1e
	adds r2, r1, #0
	ldr r0, _02238FD8 @ =0x04000050
	subs r2, #0x25
	blx FUN_020CF178
	pop {r3, pc}
_02238FC8:
	movs r1, #0x1e
	adds r2, r1, #0
	ldr r0, _02238FDC @ =0x04001050
	subs r2, #0x25
	blx FUN_020CF178
	pop {r3, pc}
	nop
_02238FD8: .4byte 0x04000050
_02238FDC: .4byte 0x04001050
	thumb_func_end ov70_02238FB4

	thumb_func_start ov70_02238FE0
ov70_02238FE0: @ 0x02238FE0
	ldr r0, _02238FEC @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _02238FF0 @ =0x04001050
	strh r1, [r0]
	bx lr
	.align 2, 0
_02238FEC: .4byte 0x04000050
_02238FF0: .4byte 0x04001050
	thumb_func_end ov70_02238FE0

	thumb_func_start ov70_02238FF4
ov70_02238FF4: @ 0x02238FF4
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov70_02239614
	ldr r2, _022390C8 @ =0x04000304
	ldr r0, _022390CC @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r4, #4]
	bl ov70_02239134
	adds r0, r4, #0
	bl ov70_02239330
	adds r0, r4, #0
	bl ov70_022394B8
	adds r0, r4, #0
	bl ov70_02239414
	adds r0, r4, #0
	bl ov70_02245124
	adds r0, r4, #0
	bl ov70_02239B00
	ldr r1, _022390D0 @ =0x00000484
	movs r0, #0x17
	movs r2, #1
	bl FUN_02004EC4
	ldrh r0, [r4, #0x34]
	cmp r0, #0
	bne _02239072
	adds r0, r4, #0
	bl ov70_02239304
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #1
	strh r0, [r4, #0x34]
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl FUN_02028F94
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov70_02240EF4
	b _022390BC
_02239072:
	ldr r0, _022390D4 @ =0x000011FC
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _022390A2
	ldr r0, _022390D8 @ =0x0400106C
	blx FUN_020CDAA8
	cmp r0, #0
	beq _022390A2
	adds r0, r4, #0
	bl ov70_02241358
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _022390B8
_022390A2:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
_022390B8:
	movs r0, #5
	str r0, [r4, #0x2c]
_022390BC:
	ldr r0, _022390D4 @ =0x000011FC
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_022390C8: .4byte 0x04000304
_022390CC: .4byte 0xFFFF7FFF
_022390D0: .4byte 0x00000484
_022390D4: .4byte 0x000011FC
_022390D8: .4byte 0x0400106C
	thumb_func_end ov70_02238FF4

	thumb_func_start ov70_022390DC
ov70_022390DC: @ 0x022390DC
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238E44
	bl FUN_0203A930
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _022390F8 @ =0x02246464
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_022390F8: .4byte 0x02246464
	thumb_func_end ov70_022390DC

	thumb_func_start ov70_022390FC
ov70_022390FC: @ 0x022390FC
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203A914
	adds r0, r4, #0
	bl ov70_022394A8
	adds r0, r4, #0
	bl ov70_0223963C
	adds r0, r4, #0
	bl ov70_022395C4
	ldr r0, [r4, #4]
	bl ov70_022392E0
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_022390FC

	thumb_func_start ov70_02239134
ov70_02239134: @ 0x02239134
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _022391E0 @ =0x0224525C
	add r3, sp, #0x54
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _022391E4 @ =0x022452F4
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _022391E8 @ =0x022452D8
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
	ldr r5, _022391EC @ =0x02245310
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
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_022391F0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x64
	pop {r4, r5, pc}
	.align 2, 0
_022391E0: .4byte 0x0224525C
_022391E4: .4byte 0x022452F4
_022391E8: .4byte 0x022452D8
_022391EC: .4byte 0x02245310
	thumb_func_end ov70_02239134

	thumb_func_start ov70_022391F0
ov70_022391F0: @ 0x022391F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	ldr r3, _022392AC @ =0x022452A0
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	add r2, sp, #0x54
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #4
	str r0, [r2]
	adds r0, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r3, _022392B0 @ =0x02245284
	add r2, sp, #0x38
	ldm r3!, {r0, r1}
	adds r7, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #6
	str r0, [r2]
	adds r0, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl FUN_0201B1E4
	cmp r6, #0
	bne _02239252
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0201CAE0
_02239252:
	ldr r6, _022392B4 @ =0x022452BC
	add r3, sp, #0x1c
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r6]
	movs r1, #5
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	str r4, [sp, #0x20]
	bl FUN_0201B1E4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	ldr r4, _022392B8 @ =0x0224532C
	add r3, sp, #0
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #7
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #7
	bl FUN_0201CAE0
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022392AC: .4byte 0x022452A0
_022392B0: .4byte 0x02245284
_022392B4: .4byte 0x022452BC
_022392B8: .4byte 0x0224532C
	thumb_func_end ov70_022391F0

	thumb_func_start ov70_022392BC
ov70_022392BC: @ 0x022392BC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov70_022392BC

	thumb_func_start ov70_022392E0
ov70_022392E0: @ 0x022392E0
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022392BC
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_022392E0

	thumb_func_start ov70_02239304
ov70_02239304: @ 0x02239304
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
	ldr r0, _0223932C @ =0x00000DCC
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	pop {r4, pc}
	.align 2, 0
_0223932C: .4byte 0x00000DCC
	thumb_func_end ov70_02239304

	thumb_func_start ov70_02239330
ov70_02239330: @ 0x02239330
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5, #4]
	movs r0, #0x64
	movs r1, #0x3d
	bl FUN_02007688
	movs r1, #0x60
	str r1, [sp]
	movs r1, #0x3d
	movs r2, #0
	str r1, [sp, #4]
	movs r1, #4
	adds r3, r2, #0
	adds r6, r0, #0
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0x27
	adds r2, r4, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0x26
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007B68
	adds r0, r5, #0
	bl ov70_02239C6C
	ldrh r0, [r5, #0x34]
	cmp r0, #0
	beq _02239402
	adds r0, r5, #0
	bl ov70_02239CF8
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	b _0223940A
_02239402:
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
_0223940A:
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_02239330

	thumb_func_start ov70_02239414
ov70_02239414: @ 0x02239414
	push {r4, lr}
	sub sp, #0x80
	movs r1, #0
	adds r4, r0, #0
	str r1, [sp]
	subs r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r2, #0xd2
	str r1, [sp, #0xc]
	movs r0, #1
	lsls r2, r2, #4
	str r0, [sp, #0x10]
	ldr r0, [r4, r2]
	adds r3, r1, #0
	str r0, [sp, #0x14]
	adds r0, r2, #4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	adds r0, r2, #0
	adds r0, #8
	ldr r0, [r4, r0]
	adds r2, #0xc
	str r0, [sp, #0x1c]
	ldr r0, [r4, r2]
	adds r2, r1, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x2c
	str r1, [sp, #0x28]
	bl FUN_02009D48
	add r0, sp, #0x50
	adds r1, r4, #0
	add r2, sp, #0x2c
	movs r3, #1
	bl ov70_02238B54
	movs r0, #0x47
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	lsls r2, r1, #2
	ldr r1, _0223949C @ =0x02245240
	ldrh r1, [r1, r2]
	lsls r1, r1, #0xc
	str r1, [sp, #0x58]
	ldrh r0, [r4, r0]
	lsls r1, r0, #2
	ldr r0, _022394A0 @ =0x02245242
	ldrh r0, [r0, r1]
	lsls r0, r0, #0xc
	str r0, [sp, #0x5c]
	add r0, sp, #0x50
	bl FUN_02024624
	ldr r1, _022394A4 @ =0x00000DCC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _022394A4 @ =0x00000DCC
	movs r1, #0x2b
	ldr r0, [r4, r0]
	bl FUN_020248F0
	add sp, #0x80
	pop {r4, pc}
	.align 2, 0
_0223949C: .4byte 0x02245240
_022394A0: .4byte 0x02245242
_022394A4: .4byte 0x00000DCC
	thumb_func_end ov70_02239414

	thumb_func_start ov70_022394A8
ov70_022394A8: @ 0x022394A8
	ldr r1, _022394B0 @ =0x00000DCC
	ldr r3, _022394B4 @ =FUN_02024758
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_022394B0: .4byte 0x00000DCC
_022394B4: .4byte FUN_02024758
	thumb_func_end ov70_022394A8

	thumb_func_start ov70_022394B8
ov70_022394B8: @ 0x022394B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	movs r2, #1
	adds r7, r0, #0
	str r2, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r3, #2
	ldr r1, _022395B0 @ =0x00000F38
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r7, r1
	bl FUN_0201D40C
	ldr r0, _022395B0 @ =0x00000F38
	movs r1, #0
	adds r0, r7, r0
	bl FUN_0201D978
	movs r0, #2
	str r0, [sp]
	movs r3, #0
	movs r2, #0x2f
	ldr r0, _022395B4 @ =0x000F0600
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _022395B0 @ =0x00000F38
	str r3, [sp, #0xc]
	lsls r2, r2, #6
	ldr r2, [r7, r2]
	adds r0, r7, r0
	movs r1, #1
	bl FUN_020200FC
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _022395B8 @ =0x00000F58
	movs r6, #0x61
	movs r4, #6
	adds r5, r7, r0
_02239510:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r5, #0
	movs r2, #1
	movs r3, #9
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	adds r6, #0x1e
	adds r0, r0, #1
	adds r4, r4, #5
	adds r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, #3
	blt _02239510
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	ldr r1, _022395BC @ =0x00000F18
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r7, r1
	movs r2, #0
	bl FUN_0201D40C
	ldr r0, _022395BC @ =0x00000F18
	movs r1, #0xf
	adds r0, r7, r0
	bl FUN_0201D978
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x96
	ldr r1, _022395C0 @ =0x00001158
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r7, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, _022395C0 @ =0x00001158
	movs r1, #0xf
	adds r0, r7, r0
	bl FUN_0201D978
	adds r0, r7, #0
	movs r1, #0
	bl ov70_02239D44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022395B0: .4byte 0x00000F38
_022395B4: .4byte 0x000F0600
_022395B8: .4byte 0x00000F58
_022395BC: .4byte 0x00000F18
_022395C0: .4byte 0x00001158
	thumb_func_end ov70_022394B8

	thumb_func_start ov70_022395C4
ov70_022395C4: @ 0x022395C4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _02239600 @ =0x00001198
	adds r0, r6, r0
	bl FUN_0201D520
	ldr r0, _02239604 @ =0x00001158
	adds r0, r6, r0
	bl FUN_0201D520
	ldr r0, _02239608 @ =0x00000F18
	adds r0, r6, r0
	bl FUN_0201D520
	ldr r0, _0223960C @ =0x00000F58
	movs r4, #0
	adds r5, r6, r0
_022395E6:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _022395E6
	ldr r0, _02239610 @ =0x00000F38
	adds r0, r6, r0
	bl FUN_0201D520
	pop {r4, r5, r6, pc}
	nop
_02239600: .4byte 0x00001198
_02239604: .4byte 0x00001158
_02239608: .4byte 0x00000F18
_0223960C: .4byte 0x00000F58
_02239610: .4byte 0x00000F38
	thumb_func_end ov70_022395C4

	thumb_func_start ov70_02239614
ov70_02239614: @ 0x02239614
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _02239638 @ =0x00000BBC
	str r0, [r4, r1]
	subs r1, #0x1c
	ldr r0, [r4, r1]
	movs r1, #0x27
	bl FUN_0200BBA0
	movs r1, #0x2f
	lsls r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_02239638: .4byte 0x00000BBC
	thumb_func_end ov70_02239614

	thumb_func_start ov70_0223963C
ov70_0223963C: @ 0x0223963C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02239654 @ =0x00000BBC
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	.align 2, 0
_02239654: .4byte 0x00000BBC
	thumb_func_end ov70_0223963C

	thumb_func_start ov70_02239658
ov70_02239658: @ 0x02239658
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02239694 @ =0x000011DC
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0223968E
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0xb
	bl ov70_02238E50
	movs r0, #1
	str r0, [r4, #0x1c]
	movs r0, #9
	str r0, [r4, #0x2c]
_0223968E:
	movs r0, #3
	pop {r4, pc}
	nop
_02239694: .4byte 0x000011DC
	thumb_func_end ov70_02239658

	thumb_func_start ov70_02239698
ov70_02239698: @ 0x02239698
	push {r3, lr}
	movs r1, #0xa
	movs r2, #2
	bl ov70_02238D84
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov70_02239698

	thumb_func_start ov70_022396A8
ov70_022396A8: @ 0x022396A8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	movs r0, #3
	str r0, [r4, #0x2c]
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_022396A8

	thumb_func_start ov70_022396CC
ov70_022396CC: @ 0x022396CC
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022396DC
	movs r0, #5
	str r0, [r4, #0x2c]
_022396DC:
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_022396CC

	thumb_func_start ov70_022396E0
ov70_022396E0: @ 0x022396E0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022396F0
	movs r0, #5
	str r0, [r4, #0x2c]
_022396F0:
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_022396E0

	thumb_func_start ov70_022396F4
ov70_022396F4: @ 0x022396F4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02239728 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl ov70_02239B84
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #6
	bl ov70_02238D84
	ldr r0, _0223972C @ =0x00000DCC
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0202484C
	adds r0, r4, #0
	bl ov70_02238F10
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02239728: .4byte 0x00000F0F
_0223972C: .4byte 0x00000DCC
	thumb_func_end ov70_022396F4

	thumb_func_start ov70_02239730
ov70_02239730: @ 0x02239730
	ldr r3, _02239738 @ =FUN_02025224
	ldr r0, _0223973C @ =0x0224524C
	bx r3
	nop
_02239738: .4byte FUN_02025224
_0223973C: .4byte 0x0224524C
	thumb_func_end ov70_02239730

	thumb_func_start ov70_02239740
ov70_02239740: @ 0x02239740
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	cmp r1, #0
	beq _02239756
	cmp r1, #1
	beq _022397CC
	cmp r1, #2
	beq _022397E8
	add sp, #4
	pop {r3, r4, pc}
_02239756:
	ldrh r1, [r4, #0x36]
	cmp r1, #0
	bne _02239772
	movs r1, #5
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _0223981C @ =0x000005DC
	bl FUN_0200604C
	add sp, #4
	pop {r3, r4, pc}
_02239772:
	ldrh r1, [r4, #0x3a]
	cmp r1, #0
	bne _02239796
	movs r1, #7
	movs r2, #0xb
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x1c]
	movs r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _02239820 @ =0x00000708
	strh r0, [r4, #0x3a]
	ldr r0, _0223981C @ =0x000005DC
	bl FUN_0200604C
	add sp, #4
	pop {r3, r4, pc}
_02239796:
	ldr r0, _02239824 @ =0x00000DCC
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0202484C
	ldr r0, _02239828 @ =0x00000F0F
	movs r1, #0x22
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl ov70_02239B84
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #5
	bl ov70_02238D84
	ldr r0, _0223982C @ =0x000005F3
	bl FUN_0200604C
	movs r0, #0x47
	movs r1, #0
	lsls r0, r0, #6
	add sp, #4
	str r1, [r4, r0]
	pop {r3, r4, pc}
_022397CC:
	ldr r1, _02239830 @ =0x000011DE
	movs r2, #0
	strh r2, [r4, r1]
	movs r1, #4
	movs r2, #0xd
	bl ov70_02238E50
	movs r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _0223981C @ =0x000005DC
	bl FUN_0200604C
	add sp, #4
	pop {r3, r4, pc}
_022397E8:
	bl ov70_02238E64
	adds r2, r0, #0
	ldr r0, _02239828 @ =0x00000F0F
	movs r1, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #0
	bl ov70_02239BDC
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xc
	bl ov70_02238D84
	ldr r0, _02239824 @ =0x00000DCC
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0202484C
	ldr r0, _0223981C @ =0x000005DC
	bl FUN_0200604C
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223981C: .4byte 0x000005DC
_02239820: .4byte 0x00000708
_02239824: .4byte 0x00000DCC
_02239828: .4byte 0x00000F0F
_0223982C: .4byte 0x000005F3
_02239830: .4byte 0x000011DE
	thumb_func_end ov70_02239740

	thumb_func_start ov70_02239834
ov70_02239834: @ 0x02239834
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_02239730
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _02239876
	movs r0, #0x47
	lsls r0, r0, #2
	strh r4, [r5, r0]
	ldr r0, _0223993C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x47
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	ldr r1, _02239940 @ =0x02245240
	ldr r3, _02239944 @ =0x02245242
	lsls r2, r0, #2
	ldr r0, _02239948 @ =0x00000DCC
	ldrh r1, [r1, r2]
	ldrh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl ov70_02238D8C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_02239740
	movs r0, #3
	pop {r3, r4, r5, pc}
_02239876:
	ldr r0, _0223994C @ =0x021D110C
	movs r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _022398AC
	adds r0, r5, #0
	bl ov70_02238E64
	adds r2, r0, #0
	ldr r0, _02239950 @ =0x00000F0F
	movs r1, #7
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl ov70_02239BDC
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0xc
	bl ov70_02238D84
	ldr r0, _02239948 @ =0x00000DCC
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0202484C
	b _02239938
_022398AC:
	movs r1, #1
	tst r1, r0
	beq _022398C0
	movs r1, #0x47
	lsls r1, r1, #2
	ldrh r1, [r5, r1]
	adds r0, r5, #0
	bl ov70_02239740
	b _02239938
_022398C0:
	movs r1, #0x40
	adds r2, r0, #0
	tst r2, r1
	beq _022398FE
	adds r0, r1, #0
	adds r0, #0xdc
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _02239938
	adds r0, r1, #0
	adds r0, #0xdc
	ldrh r0, [r5, r0]
	adds r1, #0xdc
	subs r0, r0, #1
	strh r0, [r5, r1]
	ldr r0, _0223993C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x47
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	ldr r1, _02239940 @ =0x02245240
	ldr r2, _02239944 @ =0x02245242
	lsls r3, r0, #2
	ldr r0, _02239948 @ =0x00000DCC
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238D8C
	b _02239938
_022398FE:
	movs r1, #0x80
	tst r0, r1
	beq _02239938
	adds r0, r1, #0
	adds r0, #0x9c
	ldrh r0, [r5, r0]
	cmp r0, #2
	bhs _02239938
	adds r0, r1, #0
	adds r0, #0x9c
	ldrh r0, [r5, r0]
	adds r1, #0x9c
	adds r0, r0, #1
	strh r0, [r5, r1]
	ldr r0, _0223993C @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x47
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	ldr r1, _02239940 @ =0x02245240
	ldr r2, _02239944 @ =0x02245242
	lsls r3, r0, #2
	ldr r0, _02239948 @ =0x00000DCC
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238D8C
_02239938:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223993C: .4byte 0x000005DC
_02239940: .4byte 0x02245240
_02239944: .4byte 0x02245242
_02239948: .4byte 0x00000DCC
_0223994C: .4byte 0x021D110C
_02239950: .4byte 0x00000F0F
	thumb_func_end ov70_02239834

	thumb_func_start ov70_02239954
ov70_02239954: @ 0x02239954
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl FUN_02028F94
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov70_02241004
	movs r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _02239978 @ =0x000011DC
	movs r1, #0
	strh r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_02239978: .4byte 0x000011DC
	thumb_func_end ov70_02239954

	thumb_func_start ov70_0223997C
ov70_0223997C: @ 0x0223997C
	ldr r1, _0223998C @ =0x000011DC
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02239988
	movs r1, #9
	str r1, [r0, #0x2c]
_02239988:
	movs r0, #3
	bx lr
	.align 2, 0
_0223998C: .4byte 0x000011DC
	thumb_func_end ov70_0223997C

	thumb_func_start ov70_02239990
ov70_02239990: @ 0x02239990
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _022399B6
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _022399CE
_022399B6:
	movs r0, #6
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
_022399CE:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_02239990

	thumb_func_start ov70_022399D8
ov70_022399D8: @ 0x022399D8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	movs r1, #0xa
	str r0, [sp]
	adds r2, r1, #0
	ldr r0, [r4, #4]
	adds r2, #0xf8
	movs r3, #3
	bl ov70_02238C14
	ldr r1, _02239A08 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #0xd
	str r0, [r4, #0x2c]
	ldr r0, _02239A0C @ =0x00000DCC
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02239A08: .4byte 0x000011C8
_02239A0C: .4byte 0x00000DCC
	thumb_func_end ov70_022399D8

	thumb_func_start ov70_02239A10
ov70_02239A10: @ 0x02239A10
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _02239A62
	ldr r0, _02239A9C @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _02239AA0 @ =0x00001158
	movs r1, #1
	adds r0, r4, r0
	bl FUN_0200E9BC
	ldr r0, _02239AA0 @ =0x00001158
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _02239AA4 @ =0x00001198
	adds r0, r4, r0
	bl FUN_0201D8C8
	movs r0, #6
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #7
	str r0, [r4, #0x2c]
	b _02239A98
_02239A62:
	cmp r0, #2
	bne _02239A98
	ldr r0, _02239A9C @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _02239AA0 @ =0x00001158
	movs r1, #1
	adds r0, r4, r0
	bl FUN_0200E9BC
	ldr r0, _02239AA0 @ =0x00001158
	adds r0, r4, r0
	bl FUN_0201D8C8
	ldr r0, _02239AA8 @ =0x00000DCC
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_0202484C
	movs r0, #5
	str r0, [r4, #0x2c]
	ldr r0, _02239AA8 @ =0x00000DCC
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024830
_02239A98:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02239A9C: .4byte 0x000011C8
_02239AA0: .4byte 0x00001158
_02239AA4: .4byte 0x00001198
_02239AA8: .4byte 0x00000DCC
	thumb_func_end ov70_02239A10

	thumb_func_start ov70_02239AAC
ov70_02239AAC: @ 0x02239AAC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02239AC6
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02239AC6:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02239AAC

	thumb_func_start ov70_02239ACC
ov70_02239ACC: @ 0x02239ACC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02239AFA
	movs r0, #0x47
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x2d
	ble _02239AFA
	movs r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02239AFA:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02239ACC

	thumb_func_start ov70_02239B00
ov70_02239B00: @ 0x02239B00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _02239B7C @ =0x00000F58
	ldrh r1, [r7, #0x36]
	adds r4, r7, r0
	movs r0, #0xc
	ldr r2, _02239B80 @ =0x0224526C
	muls r0, r1, r0
	movs r6, #0
	adds r5, r2, r0
_02239B16:
	movs r0, #0x78
	str r0, [sp]
	movs r0, #8
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xf
	adds r3, r2, #0
	bl FUN_0201DA74
	movs r0, #0x78
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0
	movs r3, #8
	bl FUN_0201DA74
	movs r0, #0x78
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0
	movs r3, #0xa
	bl FUN_0201DA74
	movs r0, #0
	str r0, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r7, r1]
	ldr r3, [r5]
	adds r0, r4, #0
	movs r2, #4
	bl ov70_02239C34
	adds r0, r4, #0
	bl FUN_0201D578
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, r5, #4
	cmp r6, #3
	blt _02239B16
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239B7C: .4byte 0x00000F58
_02239B80: .4byte 0x0224526C
	thumb_func_end ov70_02239B00

	thumb_func_start ov70_02239B84
ov70_02239B84: @ 0x02239B84
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	movs r2, #0xba
	adds r5, r0, #0
	lsls r2, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x1c
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	ldr r0, _02239BD4 @ =0x00000F18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _02239BD4 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _02239BD4 @ =0x00000F18
	ldr r2, _02239BD8 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02239BD4: .4byte 0x00000F18
_02239BD8: .4byte 0x00000BBC
	thumb_func_end ov70_02239B84

	thumb_func_start ov70_02239BDC
ov70_02239BDC: @ 0x02239BDC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	movs r2, #0xba
	adds r5, r0, #0
	lsls r2, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x1c
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	ldr r0, _02239C2C @ =0x00001158
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _02239C2C @ =0x00001158
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _02239C2C @ =0x00001158
	ldr r2, _02239C30 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02239C2C: .4byte 0x00001158
_02239C30: .4byte 0x00000BBC
	thumb_func_end ov70_02239BDC

	thumb_func_start ov70_02239C34
ov70_02239C34: @ 0x02239C34
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r3, #0
	adds r6, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	ldr r0, _02239C68 @ =0x000A0900
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02239C68: .4byte 0x000A0900
	thumb_func_end ov70_02239C34

	thumb_func_start ov70_02239C6C
ov70_02239C6C: @ 0x02239C6C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r0, #4]
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	movs r0, #0x64
	movs r1, #5
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r0, #0x2a
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x64
	movs r1, #0x11
	adds r2, r4, #0
	movs r3, #5
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x64
	movs r1, #0x28
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007914
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r0, #0x11
	movs r2, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	adds r3, r2, #0
	bl FUN_0201C8C4
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0201BF7C
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x3d
	bl FUN_0200304C
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02239C6C

	thumb_func_start ov70_02239CF8
ov70_02239CF8: @ 0x02239CF8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x64
	movs r1, #0x12
	movs r3, #6
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x64
	movs r1, #0x29
	movs r3, #6
	bl FUN_02007914
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02239CF8

	thumb_func_start ov70_02239D44
ov70_02239D44: @ 0x02239D44
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r2, #4
	adds r4, r1, #0
	ldr r1, _02239D88 @ =0x00001198
	str r2, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	adds r1, r5, r1
	movs r3, #0xd
	bl FUN_0201D40C
	ldr r0, _02239D88 @ =0x00001198
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0201D978
	movs r1, #0xba
	ldr r0, _02239D88 @ =0x00001198
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, r0
	adds r2, r4, #0
	bl ov70_022450EC
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_02239D88: .4byte 0x00001198
	thumb_func_end ov70_02239D44

	thumb_func_start ov70_02239D8C
ov70_02239D8C: @ 0x02239D8C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov70_0223A1E4
	ldr r0, [r4, #4]
	bl ov70_02239EAC
	adds r0, r4, #0
	bl ov70_02239FA4
	adds r0, r4, #0
	bl ov70_0223A0D4
	adds r0, r4, #0
	bl ov70_0223A06C
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02070DB0
	str r0, [sp]
	movs r0, #0x8a
	lsls r0, r0, #2
	movs r2, #0xba
	adds r0, r4, r0
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r1, r2, #4
	ldr r0, [r4, r2]
	subs r2, r2, #4
	ldr r3, _02239E58 @ =0x00001058
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r4, r3
	bl ov70_0223A578
	ldr r1, _02239E5C @ =0x00001118
	movs r2, #0x92
	adds r0, r4, r1
	str r0, [sp]
	movs r0, #0xba
	lsls r0, r0, #4
	movs r3, #0x4f
	subs r1, #0x50
	lsls r2, r2, #2
	lsls r3, r3, #2
	ldr r0, [r4, r0]
	adds r1, r4, r1
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov70_0223A72C
	ldr r1, _02239E60 @ =0x0000022F
	movs r2, #0
	ldrsb r0, [r4, r1]
	adds r1, r1, #1
	ldrsb r1, [r4, r1]
	bl ov70_0223F864
	movs r1, #0x8b
	lsls r1, r1, #2
	ldrsh r2, [r4, r1]
	ldr r3, _02239E64 @ =0x000010E8
	adds r1, r1, #2
	str r2, [sp]
	ldrsb r1, [r4, r1]
	movs r2, #0xba
	lsls r2, r2, #4
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r1, r2, #4
	ldr r0, [r4, r2]
	subs r2, r2, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r4, r3
	bl ov70_0223F470
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_0223A7E4
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02239E58: .4byte 0x00001058
_02239E5C: .4byte 0x00001118
_02239E60: .4byte 0x0000022F
_02239E64: .4byte 0x000010E8
	thumb_func_end ov70_02239D8C

	thumb_func_start ov70_02239E68
ov70_02239E68: @ 0x02239E68
	push {r3, lr}
	ldr r1, [r0, #0x2c]
	lsls r2, r1, #2
	ldr r1, _02239E78 @ =0x022464A8
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_02239E78: .4byte 0x022464A8
	thumb_func_end ov70_02239E68

	thumb_func_start ov70_02239E7C
ov70_02239E7C: @ 0x02239E7C
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_0223A0C4
	adds r0, r4, #0
	bl ov70_0223A224
	adds r0, r4, #0
	bl ov70_0223A1A0
	ldr r0, [r4, #4]
	bl ov70_02239F78
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov70_02239E7C

	thumb_func_start ov70_02239EAC
ov70_02239EAC: @ 0x02239EAC
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _02239F68 @ =0x0224539C
	adds r4, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x54
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _02239F6C @ =0x02245380
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
	ldr r5, _02239F70 @ =0x02245364
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
	ldr r5, _02239F74 @ =0x02245348
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
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_022391F0
	add sp, #0x70
	pop {r3, r4, r5, pc}
	.align 2, 0
_02239F68: .4byte 0x0224539C
_02239F6C: .4byte 0x02245380
_02239F70: .4byte 0x02245364
_02239F74: .4byte 0x02245348
	thumb_func_end ov70_02239EAC

	thumb_func_start ov70_02239F78
ov70_02239F78: @ 0x02239F78
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022392BC
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
	movs r1, #3
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02239F78

	thumb_func_start ov70_02239FA4
ov70_02239FA4: @ 0x02239FA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r5, [r6, #4]
	movs r0, #0x64
	movs r1, #0x3d
	bl FUN_02007688
	movs r1, #0x60
	str r1, [sp]
	movs r1, #0x3d
	movs r2, #0
	str r1, [sp, #4]
	movs r1, #8
	adds r3, r2, #0
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x14
	adds r2, r5, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x1c
	adds r2, r5, #0
	bl FUN_02007B68
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x3d
	bl FUN_0200304C
	adds r0, r6, #0
	bl ov70_02239CF8
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_02239FA4

	thumb_func_start ov70_0223A06C
ov70_0223A06C: @ 0x0223A06C
	push {r4, lr}
	sub sp, #0x30
	movs r2, #0xd6
	adds r4, r0, #0
	lsls r2, r2, #4
	add r0, sp, #0
	adds r1, r4, #0
	adds r2, r4, r2
	movs r3, #1
	bl ov70_02238B54
	movs r0, #0xd
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x3a
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	movs r1, #0xee
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xee
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x25
	bl FUN_020248F0
	movs r0, #0xee
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024A04
	bl FUN_0203A880
	add sp, #0x30
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223A06C

	thumb_func_start ov70_0223A0C4
ov70_0223A0C4: @ 0x0223A0C4
	movs r1, #0xee
	lsls r1, r1, #4
	ldr r3, _0223A0D0 @ =FUN_02024758
	ldr r0, [r0, r1]
	bx r3
	nop
_0223A0D0: .4byte FUN_02024758
	thumb_func_end ov70_0223A0C4

	thumb_func_start ov70_0223A0D4
ov70_0223A0D4: @ 0x0223A0D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	ldr r1, _0223A190 @ =0x00000F18
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r7, r1
	movs r2, #0
	bl FUN_0201D40C
	ldr r0, _0223A190 @ =0x00000F18
	movs r1, #0
	adds r0, r7, r0
	bl FUN_0201D978
	movs r0, #0xf
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x5e
	ldr r1, _0223A194 @ =0x00000F58
	str r0, [sp, #0x10]
	ldr r0, [r7, #4]
	adds r1, r7, r1
	movs r2, #0
	movs r3, #0x15
	bl FUN_0201D40C
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, _0223A198 @ =0x00001058
	ldr r4, _0223A19C @ =0x022453B8
	movs r6, #0x86
	adds r5, r7, r0
_0223A132:
	ldr r0, [r4, #4]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	movs r2, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	adds r4, #0x10
	muls r0, r1, r0
	adds r6, r6, r0
	ldr r0, [sp, #0x14]
	adds r5, #0x10
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0xe
	blt _0223A132
	adds r0, r7, #0
	movs r1, #2
	bl ov70_02239D44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A190: .4byte 0x00000F18
_0223A194: .4byte 0x00000F58
_0223A198: .4byte 0x00001058
_0223A19C: .4byte 0x022453B8
	thumb_func_end ov70_0223A0D4

	thumb_func_start ov70_0223A1A0
ov70_0223A1A0: @ 0x0223A1A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0223A1D4 @ =0x00001198
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, _0223A1D8 @ =0x00000F18
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, _0223A1DC @ =0x00000F58
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, _0223A1E0 @ =0x00001058
	movs r4, #0
	adds r5, r5, r0
_0223A1C2:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0xe
	blt _0223A1C2
	pop {r3, r4, r5, pc}
	nop
_0223A1D4: .4byte 0x00001198
_0223A1D8: .4byte 0x00000F18
_0223A1DC: .4byte 0x00000F58
_0223A1E0: .4byte 0x00001058
	thumb_func_end ov70_0223A1A0

	thumb_func_start ov70_0223A1E4
ov70_0223A1E4: @ 0x0223A1E4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _0223A220 @ =0x00000BBC
	str r0, [r5, r1]
	subs r1, #0x1c
	ldr r0, [r5, r1]
	movs r1, #0x27
	bl FUN_0200BBA0
	movs r1, #0x2f
	lsls r1, r1, #6
	str r0, [r5, r1]
	movs r4, #0
	movs r7, #0x14
	adds r6, r1, #4
_0223A20A:
	adds r0, r7, #0
	movs r1, #0x3d
	bl FUN_02026354
	str r0, [r5, r6]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xa
	blt _0223A20A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A220: .4byte 0x00000BBC
	thumb_func_end ov70_0223A1E4

	thumb_func_start ov70_0223A224
ov70_0223A224: @ 0x0223A224
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _0223A250 @ =0x00000BC4
	movs r4, #0
	adds r5, r7, #0
_0223A22E:
	ldr r0, [r5, r6]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xa
	blt _0223A22E
	ldr r0, _0223A254 @ =0x00000BBC
	ldr r0, [r7, r0]
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #6
	ldr r0, [r7, r0]
	bl FUN_02026380
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223A250: .4byte 0x00000BC4
_0223A254: .4byte 0x00000BBC
	thumb_func_end ov70_0223A224

	thumb_func_start ov70_0223A258
ov70_0223A258: @ 0x0223A258
	movs r1, #1
	str r1, [r0, #0x2c]
	movs r0, #3
	bx lr
	thumb_func_end ov70_0223A258

	thumb_func_start ov70_0223A260
ov70_0223A260: @ 0x0223A260
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223A2C0 @ =0x021D110C
	adds r4, r0, #0
	ldr r2, [r1, #0x48]
	movs r1, #1
	adds r3, r2, #0
	tst r3, r1
	bne _0223A27A
	ldr r3, _0223A2C4 @ =0x021D114C
	ldrh r3, [r3, #0x24]
	cmp r3, #0
	beq _0223A2A4
_0223A27A:
	ldr r0, _0223A2C8 @ =0x00000F0F
	movs r1, #5
	str r0, [sp]
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl ov70_0223A4F4
	adds r0, r4, #0
	movs r1, #3
	movs r2, #7
	bl ov70_02238D84
	ldr r0, _0223A2CC @ =0x000005DC
	bl FUN_0200604C
	b _0223A2B8
_0223A2A4:
	movs r3, #2
	tst r2, r3
	beq _0223A2B8
	movs r2, #0
	str r3, [r4, #0x2c]
	bl ov70_02238E50
	ldr r0, _0223A2CC @ =0x000005DC
	bl FUN_0200604C
_0223A2B8:
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_0223A2C0: .4byte 0x021D110C
_0223A2C4: .4byte 0x021D114C
_0223A2C8: .4byte 0x00000F0F
_0223A2CC: .4byte 0x000005DC
	thumb_func_end ov70_0223A260

	thumb_func_start ov70_0223A2D0
ov70_0223A2D0: @ 0x0223A2D0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #6
	movs r1, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_0223A2D0

	thumb_func_start ov70_0223A2F8
ov70_0223A2F8: @ 0x0223A2F8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223A31C @ =0x0000016A
	movs r1, #0xc
	movs r3, #8
	bl ov70_02238C14
	ldr r1, _0223A320 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #6
	str r0, [r4, #0x2c]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223A31C: .4byte 0x0000016A
_0223A320: .4byte 0x000011C8
	thumb_func_end ov70_0223A2F8

	thumb_func_start ov70_0223A324
ov70_0223A324: @ 0x0223A324
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223A354
	ldr r0, _0223A378 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223A37C @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #7
	movs r2, #8
	bl ov70_02238E50
	adds r0, r4, #0
	bl ov70_0223A874
	b _0223A372
_0223A354:
	cmp r0, #2
	bne _0223A372
	ldr r0, _0223A378 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _0223A380 @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	str r1, [r4, #0x2c]
	bl FUN_0200E9BC
	adds r0, r4, #0
	bl ov70_0223A874
_0223A372:
	movs r0, #3
	pop {r4, pc}
	nop
_0223A378: .4byte 0x000011C8
_0223A37C: .4byte 0x000011FC
_0223A380: .4byte 0x00000F18
	thumb_func_end ov70_0223A324

	thumb_func_start ov70_0223A384
ov70_0223A384: @ 0x0223A384
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0x3d
	bl FUN_02014918
	ldr r1, _0223A3D4 @ =0x000011AC
	movs r2, #0x37
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl FUN_02014960
	ldr r0, _0223A3D4 @ =0x000011AC
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x38
	movs r3, #2
	bl FUN_02014960
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0xd
	bl ov70_02238CAC
	ldr r1, _0223A3D8 @ =0x000011D0
	str r0, [r4, r1]
	movs r0, #1
	bl ov70_02238FB4
	movs r0, #8
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	nop
_0223A3D4: .4byte 0x000011AC
_0223A3D8: .4byte 0x000011D0
	thumb_func_end ov70_0223A384

	thumb_func_start ov70_0223A3DC
ov70_0223A3DC: @ 0x0223A3DC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0223A494 @ =0x000011D0
	ldr r0, [r5, r0]
	bl FUN_020186A4
	cmp r0, #1
	bne _0223A45E
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223A498 @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r4, r5, r0
	adds r0, r4, #0
	bl ov70_0223E76C
	cmp r0, #0
	beq _0223A43A
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r0, #6
	bne _0223A43A
	ldr r0, _0223A49C @ =0x00000F0F
	movs r1, #0x24
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0
	str r4, [sp, #4]
	bl ov70_0223A4F4
	adds r0, r5, #0
	movs r1, #3
	movs r2, #1
	bl ov70_02238D84
	add sp, #8
	movs r0, #3
	pop {r3, r4, r5, pc}
_0223A43A:
	ldr r0, _0223A49C @ =0x00000F0F
	movs r1, #6
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0
	str r4, [sp, #4]
	bl ov70_0223A4F4
	adds r0, r5, #0
	movs r1, #3
	movs r2, #5
	bl ov70_02238D84
	adds r0, r5, #0
	bl ov70_0223A874
	b _0223A48C
_0223A45E:
	cmp r0, #2
	beq _0223A46A
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _0223A48C
_0223A46A:
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223A498 @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	movs r0, #2
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	adds r0, r5, #0
	bl ov70_0223A874
_0223A48C:
	movs r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223A494: .4byte 0x000011D0
_0223A498: .4byte 0x000011AC
_0223A49C: .4byte 0x00000F0F
	thumb_func_end ov70_0223A3DC

	thumb_func_start ov70_0223A4A0
ov70_0223A4A0: @ 0x0223A4A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223A4BA
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223A4BA:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223A4A0

	thumb_func_start ov70_0223A4C0
ov70_0223A4C0: @ 0x0223A4C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223A4EE
	movs r0, #0x47
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x2d
	ble _0223A4EE
	movs r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223A4EE:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223A4C0

	thumb_func_start ov70_0223A4F4
ov70_0223A4F4: @ 0x0223A4F4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [sp, #0x24]
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _0223A56C @ =0x00000B9C
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_0200BF1C
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r1, r6, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r1, _0223A56C @ =0x00000B9C
	adds r2, r6, #0
	ldr r0, [r5, r1]
	adds r1, #0x20
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	ldr r0, _0223A570 @ =0x00000F18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _0223A570 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223A570 @ =0x00000F18
	ldr r2, _0223A574 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0223A56C: .4byte 0x00000B9C
_0223A570: .4byte 0x00000F18
_0223A574: .4byte 0x00000BBC
	thumb_func_end ov70_0223A4F4

	thumb_func_start ov70_0223A578
ov70_0223A578: @ 0x0223A578
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r5, r0, #0
	str r1, [sp, #8]
	movs r0, #0x16
	movs r1, #0x3d
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x54]
	bl FUN_02026354
	str r0, [sp, #0x1c]
	movs r0, #0x12
	movs r1, #0x3d
	bl FUN_02026354
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x50]
	ldr r2, [sp, #0x1c]
	movs r1, #0x77
	bl FUN_0206E640
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #6
	str r0, [sp, #0x10]
	movs r0, #2
	ldrsb r0, [r4, r0]
	str r0, [sp, #0x14]
	movs r0, #3
	ldrsb r4, [r4, r0]
	ldr r0, [sp, #0x50]
	bl FUN_0206E640
	str r0, [sp, #0x38]
	adds r0, r5, #0
	movs r1, #0x49
	bl FUN_0200BBA0
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	ldr r2, _0223A71C @ =0x02245910
	lsls r0, r0, #2
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r1, [r2, r1]
	bl FUN_0200BBA0
	str r0, [sp, #0x30]
	adds r0, r5, #0
	movs r1, #0x6a
	bl FUN_0200BBA0
	str r0, [sp, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #3
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_0200BFCC
	adds r0, r7, #0
	adds r1, r5, #0
	movs r2, #0x6b
	movs r3, #0x3d
	bl FUN_0200BC4C
	str r0, [sp, #0x28]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x10]
	bl FUN_0200BBA0
	ldr r1, [sp, #0x38]
	str r0, [sp, #0x34]
	lsls r1, r1, #0x10
	ldr r0, [sp, #0x18]
	lsrs r1, r1, #0x10
	movs r2, #0x3d
	bl FUN_02077D40
	adds r0, r5, #0
	movs r1, #0x3b
	bl FUN_0200BBA0
	movs r4, #0
	str r0, [sp, #0x20]
	adds r5, r6, #0
	adds r7, r4, #0
_0223A630:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blt _0223A630
	movs r2, #0
	ldr r0, _0223A720 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	adds r0, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	ldr r0, [sp, #0x14]
	cmp r0, #3
	beq _0223A66E
	movs r3, #0
	ldr r1, _0223A724 @ =0x0224649C
	ldr r0, [sp, #0xc]
	str r3, [sp]
	ldr r0, [r1, r0]
	ldr r1, [sp, #0x30]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #0x40
	bl ov70_02245084
_0223A66E:
	movs r2, #0
	ldr r0, _0223A720 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0x34]
	adds r0, #0x10
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A720 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0x2c]
	adds r0, #0x20
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A720 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0x28]
	adds r0, #0x30
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A728 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0x24]
	adds r0, #0x40
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A720 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0x18]
	adds r0, #0x50
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A728 @ =0x000F0200
	str r2, [sp]
	adds r6, #0x60
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	adds r0, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, [sp, #0x2c]
	bl FUN_02026380
	ldr r0, [sp, #0x28]
	bl FUN_02026380
	ldr r0, [sp, #0x30]
	bl FUN_02026380
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, [sp, #0x34]
	bl FUN_02026380
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0223A71C: .4byte 0x02245910
_0223A720: .4byte 0x00010200
_0223A724: .4byte 0x0224649C
_0223A728: .4byte 0x000F0200
	thumb_func_end ov70_0223A578

	thumb_func_start ov70_0223A72C
ov70_0223A72C: @ 0x0223A72C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0x10
	movs r1, #0x3d
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #0x3d
	bl FUN_02026354
	adds r6, r0, #0
	adds r0, r7, #0
	movs r1, #0x31
	bl FUN_0200BBA0
	str r0, [sp, #0x10]
	ldr r1, [sp, #8]
	adds r0, r4, #0
	bl FUN_020269A0
	adds r0, r7, #0
	movs r1, #0xb4
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r0, [sp, #0xc]
	movs r1, #0x91
	adds r2, r6, #0
	bl FUN_0206E540
	movs r2, #0
	ldr r0, _0223A7DC @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A7E0 @ =0x00010200
	str r2, [sp]
	adds r5, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A7DC @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	adds r1, r7, #0
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223A7E0 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	adds r1, r6, #0
	adds r0, #0x10
	adds r3, r2, #0
	bl ov70_02245084
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223A7DC: .4byte 0x000F0200
_0223A7E0: .4byte 0x00010200
	thumb_func_end ov70_0223A72C

	thumb_func_start ov70_0223A7E4
ov70_0223A7E4: @ 0x0223A7E4
	push {r4, r5, r6, lr}
	sub sp, #0x30
	movs r1, #0x32
	adds r5, r0, #0
	movs r0, #0x3d
	lsls r1, r1, #6
	bl FUN_0201AA8C
	adds r4, r0, #0
	add r0, sp, #0x20
	adds r1, r5, #0
	movs r2, #2
	bl FUN_02070124
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r3, #0
	str r3, [sp]
	movs r1, #0xa
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r6, [sp, #0x10]
	str r3, [sp, #0x14]
	movs r1, #2
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	add r1, sp, #0x20
	ldrh r0, [r1]
	ldrh r1, [r1, #2]
	movs r2, #0x3d
	bl FUN_02014494
	movs r1, #0x32
	adds r0, r4, #0
	lsls r1, r1, #6
	blx FUN_020D2894
	movs r1, #0x4a
	movs r2, #0x32
	adds r0, r4, #0
	lsls r1, r1, #8
	lsls r2, r2, #6
	blx FUN_020CFE74
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3d
	movs r3, #0x1a
	str r0, [sp, #4]
	add r1, sp, #0x20
	ldrh r0, [r1]
	ldrh r1, [r1, #4]
	movs r2, #1
	lsls r3, r3, #4
	bl FUN_02007938
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_0223A7E4

	thumb_func_start ov70_0223A874
ov70_0223A874: @ 0x0223A874
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _0223A8B4 @ =0x0000022F
	adds r4, r0, #0
	ldrsb r0, [r4, r1]
	adds r1, r1, #1
	ldrsb r1, [r4, r1]
	movs r2, #0
	bl ov70_0223F864
	movs r1, #0x8b
	lsls r1, r1, #2
	ldrsh r2, [r4, r1]
	adds r1, r1, #2
	ldr r3, _0223A8B8 @ =0x000010E8
	str r2, [sp]
	ldrsb r1, [r4, r1]
	movs r2, #0xba
	lsls r2, r2, #4
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r1, r2, #4
	ldr r0, [r4, r2]
	subs r2, r2, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r4, r3
	bl ov70_0223F470
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223A8B4: .4byte 0x0000022F
_0223A8B8: .4byte 0x000010E8
	thumb_func_end ov70_0223A874

	thumb_func_start ov70_0223A8BC
ov70_0223A8BC: @ 0x0223A8BC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov70_0223AE98
	ldr r1, _0223AA60 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r2, [r4, r1]
	movs r1, #0x1f
	mvns r1, r1
	subs r1, r1, r2
	bl ov70_0223AB3C
	adds r0, r4, #0
	bl ov70_0223ABF4
	adds r0, r4, #0
	bl ov70_0223ACF4
	adds r0, r4, #0
	bl ov70_0223AC98
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #8
	adds r5, r1, #0
	muls r5, r0, r5
	movs r0, #0x26
	lsls r0, r0, #4
	adds r0, r4, r0
	adds r0, r0, r5
	bl FUN_02070DB0
	str r0, [sp]
	movs r0, #0xd3
	lsls r0, r0, #2
	adds r0, r4, r0
	movs r2, #0xba
	adds r0, r0, r5
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r1, r2, #4
	ldr r0, [r4, r2]
	subs r2, r2, #4
	ldr r3, _0223AA64 @ =0x00001058
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r4, r3
	bl ov70_0223A578
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	movs r2, #0xdb
	adds r3, r1, #0
	subs r0, #8
	movs r5, #0x26
	lsls r2, r2, #2
	lsls r5, r5, #4
	ldr r1, _0223AA68 @ =0x00001118
	muls r3, r0, r3
	adds r0, r4, r1
	str r0, [sp]
	movs r0, #0xba
	lsls r0, r0, #4
	subs r1, #0x50
	adds r2, r4, r2
	ldr r0, [r4, r0]
	adds r5, r4, r5
	adds r2, r2, r3
	adds r1, r4, r1
	adds r3, r5, r3
	bl ov70_0223A72C
	movs r0, #0x26
	lsls r0, r0, #4
	adds r2, r4, r0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #8
	muls r0, r1, r0
	adds r0, r2, r0
	bl ov70_0223A7E4
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223AA6C @ =0x00001138
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x4d
	bl ov70_0223B3BC
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223AA70 @ =0x000010E8
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x51
	bl ov70_0223B3BC
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223AA74 @ =0x00000F58
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x58
	bl ov70_0223B3EC
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223AA78 @ =0x00000F68
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x6d
	bl ov70_0223B3EC
	adds r0, r4, #0
	bl ov70_0223B258
	ldr r2, _0223AA60 @ =0x00000F14
	movs r1, #0x4b
	lsls r1, r1, #2
	ldr r2, [r4, r2]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	rsbs r2, r2, #0
	bl ov70_02241330
	ldr r1, _0223AA7C @ =ov70_0223B4D4
	ldr r0, _0223AA80 @ =0x00001208
	ldr r2, _0223AA84 @ =0x04000304
	str r1, [r4, r0]
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x24]
	cmp r0, #0x11
	bne _0223AA54
	ldr r0, _0223AA88 @ =0x0400006C
	blx FUN_020CDAA8
	movs r1, #0xf
	mvns r1, r1
	cmp r0, r1
	bne _0223AA0A
	ldr r0, _0223AA8C @ =0x0400106C
	blx FUN_020CDAA8
	movs r1, #0xf
	mvns r1, r1
	cmp r0, r1
	beq _0223AA0A
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	b _0223AA54
_0223AA0A:
	ldr r0, _0223AA88 @ =0x0400006C
	blx FUN_020CDAA8
	movs r1, #0xf
	mvns r1, r1
	cmp r0, r1
	beq _0223AA3E
	ldr r0, _0223AA8C @ =0x0400106C
	blx FUN_020CDAA8
	movs r1, #0xf
	mvns r1, r1
	cmp r0, r1
	bne _0223AA3E
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #4
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	b _0223AA54
_0223AA3E:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
_0223AA54:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223AA60: .4byte 0x00000F14
_0223AA64: .4byte 0x00001058
_0223AA68: .4byte 0x00001118
_0223AA6C: .4byte 0x00001138
_0223AA70: .4byte 0x000010E8
_0223AA74: .4byte 0x00000F58
_0223AA78: .4byte 0x00000F68
_0223AA7C: .4byte ov70_0223B4D4
_0223AA80: .4byte 0x00001208
_0223AA84: .4byte 0x04000304
_0223AA88: .4byte 0x0400006C
_0223AA8C: .4byte 0x0400106C
	thumb_func_end ov70_0223A8BC

	thumb_func_start ov70_0223AA90
ov70_0223AA90: @ 0x0223AA90
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r1, [r6, #0x2c]
	lsls r2, r1, #2
	ldr r1, _0223AAEC @ =0x022464CC
	ldr r1, [r1, r2]
	blx r1
	ldr r7, _0223AAF0 @ =0x0000120E
	str r0, [sp]
	movs r4, #0
	adds r5, r6, #0
_0223AAA6:
	ldr r2, _0223AAF4 @ =0x00000F14
	ldr r1, _0223AAF8 @ =0x0000120C
	ldr r3, [r6, r2]
	ldrsh r2, [r5, r7]
	ldr r0, _0223AAFC @ =0x00000EE4
	ldrsh r1, [r5, r1]
	adds r2, r3, r2
	ldr r0, [r5, r0]
	adds r2, #0x20
	bl ov70_02238F9C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _0223AAA6
	movs r2, #0xee
	lsls r2, r2, #4
	ldr r0, [r6, r2]
	adds r2, #0x34
	ldr r3, [r6, r2]
	movs r2, #0x3a
	movs r1, #0xd0
	subs r2, r2, r3
	bl ov70_02238F9C
	movs r1, #0x4b
	ldr r2, _0223AAF4 @ =0x00000F14
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	ldr r2, [r6, r2]
	adds r0, r6, #0
	bl ov70_02241330
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223AAEC: .4byte 0x022464CC
_0223AAF0: .4byte 0x0000120E
_0223AAF4: .4byte 0x00000F14
_0223AAF8: .4byte 0x0000120C
_0223AAFC: .4byte 0x00000EE4
	thumb_func_end ov70_0223AA90

	thumb_func_start ov70_0223AB00
ov70_0223AB00: @ 0x0223AB00
	push {r4, lr}
	ldr r1, _0223AB38 @ =0x00001208
	adds r4, r0, #0
	movs r2, #0
	str r2, [r4, r1]
	bl ov70_0223ACE4
	adds r0, r4, #0
	bl ov70_0223AF30
	adds r0, r4, #0
	bl ov70_0223AE40
	ldr r0, [r4, #4]
	bl ov70_0223ABD8
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	nop
_0223AB38: .4byte 0x00001208
	thumb_func_end ov70_0223AB00

	thumb_func_start ov70_0223AB3C
ov70_0223AB3C: @ 0x0223AB3C
	push {r4, r5, r6, lr}
	sub sp, #0x38
	ldr r6, _0223ABCC @ =0x022454D0
	add r3, sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
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
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r6, _0223ABD0 @ =0x022454B4
	add r3, sp, #0
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
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	ldr r0, _0223ABD4 @ =0x0400106C
	blx FUN_020CDAA8
	cmp r0, #0
	bne _0223ABAE
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl ov70_022391F0
	b _0223ABB8
_0223ABAE:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov70_022391F0
_0223ABB8:
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223ABCC: .4byte 0x022454D0
_0223ABD0: .4byte 0x022454B4
_0223ABD4: .4byte 0x0400106C
	thumb_func_end ov70_0223AB3C

	thumb_func_start ov70_0223ABD8
ov70_0223ABD8: @ 0x0223ABD8
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022392BC
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223ABD8

	thumb_func_start ov70_0223ABF4
ov70_0223ABF4: @ 0x0223ABF4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	movs r1, #0x1a
	adds r5, r0, #0
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	ldr r4, [r5, #4]
	bl FUN_0200304C
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	movs r3, #2
	bl FUN_0200E644
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	lsls r0, r0, #0xa
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x64
	movs r1, #0x14
	adds r2, r4, #0
	bl FUN_020078F0
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0x3d
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x64
	movs r1, #8
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x64
	movs r1, #0x12
	adds r2, r4, #0
	movs r3, #6
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x64
	movs r1, #0x2a
	adds r2, r4, #0
	movs r3, #6
	bl FUN_02007914
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x3d
	bl FUN_0200304C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_0223ABF4

	thumb_func_start ov70_0223AC98
ov70_0223AC98: @ 0x0223AC98
	push {r4, lr}
	sub sp, #0x30
	movs r2, #0xd6
	adds r4, r0, #0
	lsls r2, r2, #4
	add r0, sp, #0
	adds r1, r4, #0
	adds r2, r4, r2
	movs r3, #1
	bl ov70_02238B54
	movs r0, #0xd
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x3a
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	movs r1, #0xee
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xee
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x25
	bl FUN_020248F0
	bl FUN_0203A880
	add sp, #0x30
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223AC98

	thumb_func_start ov70_0223ACE4
ov70_0223ACE4: @ 0x0223ACE4
	movs r1, #0xee
	lsls r1, r1, #4
	ldr r3, _0223ACF0 @ =FUN_02024758
	ldr r0, [r0, r1]
	bx r3
	nop
_0223ACF0: .4byte FUN_02024758
	thumb_func_end ov70_0223ACE4

	thumb_func_start ov70_0223ACF4
ov70_0223ACF4: @ 0x0223ACF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	ldr r1, _0223AE2C @ =0x00000F18
	str r2, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	adds r1, r6, r1
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, _0223AE2C @ =0x00000F18
	movs r1, #0
	adds r0, r6, r0
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r3, #1
	ldr r1, _0223AE30 @ =0x00000F58
	str r3, [sp, #0xc]
	movs r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	adds r1, r6, r1
	movs r2, #4
	bl FUN_0201D40C
	ldr r0, _0223AE30 @ =0x00000F58
	movs r1, #0
	adds r0, r6, r0
	bl FUN_0201D978
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0xd
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0xae
	ldr r1, _0223AE34 @ =0x00000F68
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	adds r1, r6, r1
	movs r2, #4
	movs r3, #0x11
	bl FUN_0201D40C
	ldr r0, _0223AE34 @ =0x00000F68
	movs r1, #0
	adds r0, r6, r0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp, #0x14]
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, _0223AE38 @ =0x00001058
	ldr r4, _0223AE3C @ =0x022454EC
	movs r7, #0xc8
	adds r5, r6, r0
_0223AD8A:
	ldr r2, [r4, #0x10]
	ldr r0, [r4, #4]
	cmp r2, #0
	bne _0223ADD6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	lsls r2, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	lsrs r2, r2, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r6, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, [sp, #0x14]
	adds r0, r0, r2
	str r0, [sp, #0x14]
	b _0223AE10
_0223ADD6:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4, #8]
	lsls r2, r2, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r6, #4]
	lsls r3, r3, #0x18
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	muls r0, r1, r0
	adds r7, r7, r0
_0223AE10:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [sp, #0x18]
	adds r4, #0x14
	adds r0, r0, #1
	adds r5, #0x10
	str r0, [sp, #0x18]
	cmp r0, #0x10
	blt _0223AD8A
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223AE2C: .4byte 0x00000F18
_0223AE30: .4byte 0x00000F58
_0223AE34: .4byte 0x00000F68
_0223AE38: .4byte 0x00001058
_0223AE3C: .4byte 0x022454EC
	thumb_func_end ov70_0223ACF4

	thumb_func_start ov70_0223AE40
ov70_0223AE40: @ 0x0223AE40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0223AE88 @ =0x00000F18
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, _0223AE8C @ =0x00000F68
	adds r0, r5, r0
	bl FUN_0201D8C8
	ldr r0, _0223AE90 @ =0x00000F58
	adds r0, r5, r0
	bl FUN_0201D8C8
	ldr r0, _0223AE8C @ =0x00000F68
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, _0223AE90 @ =0x00000F58
	adds r0, r5, r0
	bl FUN_0201D520
	ldr r0, _0223AE94 @ =0x00001058
	movs r4, #0
	adds r5, r5, r0
_0223AE72:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x10
	blt _0223AE72
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223AE88: .4byte 0x00000F18
_0223AE8C: .4byte 0x00000F68
_0223AE90: .4byte 0x00000F58
_0223AE94: .4byte 0x00001058
	thumb_func_end ov70_0223AE40

	thumb_func_start ov70_0223AE98
ov70_0223AE98: @ 0x0223AE98
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x26
	lsls r0, r0, #4
	adds r2, r5, r0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	subs r0, #8
	muls r0, r1, r0
	adds r4, r2, r0
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _0223AF18 @ =0x00000BBC
	str r0, [r5, r1]
	subs r1, #0x20
	ldr r0, [r5, r1]
	bl FUN_0200CC50
	ldr r0, _0223AF1C @ =0x0000011E
	ldrb r2, [r4, r0]
	cmp r2, #0
	beq _0223AED4
	ldr r0, _0223AF20 @ =0x00000B9C
	movs r1, #8
	ldr r0, [r5, r0]
	bl FUN_0200C4B0
_0223AED4:
	ldr r2, _0223AF24 @ =0x0000011F
	ldrb r3, [r4, r2]
	cmp r3, #0
	beq _0223AEEA
	ldr r0, _0223AF20 @ =0x00000B9C
	subs r2, r2, #1
	ldrb r2, [r4, r2]
	ldr r0, [r5, r0]
	movs r1, #9
	bl FUN_0200C4E8
_0223AEEA:
	ldr r1, _0223AF20 @ =0x00000B9C
	movs r2, #0x52
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r3, #0x3d
	bl FUN_0200BC4C
	ldr r1, _0223AF28 @ =0x00000BC4
	movs r2, #0x53
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x28
	subs r1, #0x24
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r3, #0x3d
	bl FUN_0200BC4C
	ldr r1, _0223AF2C @ =0x00000BC8
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
	nop
_0223AF18: .4byte 0x00000BBC
_0223AF1C: .4byte 0x0000011E
_0223AF20: .4byte 0x00000B9C
_0223AF24: .4byte 0x0000011F
_0223AF28: .4byte 0x00000BC4
_0223AF2C: .4byte 0x00000BC8
	thumb_func_end ov70_0223AE98

	thumb_func_start ov70_0223AF30
ov70_0223AF30: @ 0x0223AF30
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223AF50 @ =0x00000BC4
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _0223AF54 @ =0x00000BC8
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _0223AF58 @ =0x00000BBC
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	nop
_0223AF50: .4byte 0x00000BC4
_0223AF54: .4byte 0x00000BC8
_0223AF58: .4byte 0x00000BBC
	thumb_func_end ov70_0223AF30

	thumb_func_start ov70_0223AF5C
ov70_0223AF5C: @ 0x0223AF5C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x24]
	cmp r0, #0x10
	bne _0223AF90
	movs r0, #0x10
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #7
	str r0, [r4, #0x2c]
	b _0223AF9C
_0223AF90:
	movs r1, #1
	ldr r0, _0223AFA4 @ =0x00000F0C
	str r1, [r4, #0x2c]
	ldr r0, [r4, r0]
	bl FUN_02024830
_0223AF9C:
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223AFA4: .4byte 0x00000F0C
	thumb_func_end ov70_0223AF5C

	thumb_func_start ov70_0223AFA8
ov70_0223AFA8: @ 0x0223AFA8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	cmp r4, r0
	beq _0223AFF2
	cmp r4, #0
	blt _0223AFF2
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _0223AFF4 @ =0x00000EE4
	ldr r0, [r1, r0]
	lsls r1, r4, #2
	adds r1, #0x10
	bl FUN_020248F0
	movs r0, #2
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0x11
	bl ov70_02238E50
	movs r0, #0x4b
	lsls r0, r0, #2
	str r4, [r5, r0]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov70_02241330
	ldr r0, _0223AFF8 @ =0x000005DC
	bl FUN_0200604C
_0223AFF2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223AFF4: .4byte 0x00000EE4
_0223AFF8: .4byte 0x000005DC
	thumb_func_end ov70_0223AFA8

	thumb_func_start ov70_0223AFFC
ov70_0223AFFC: @ 0x0223AFFC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _0223B114 @ =0x021D110C
	movs r2, #1
	ldr r1, [r1, #0x48]
	adds r4, r0, #0
	adds r3, r1, #0
	tst r3, r2
	beq _0223B02C
	ldr r1, _0223B118 @ =0x00000F0F
	movs r3, #0
	str r1, [sp]
	movs r1, #0x10
	bl ov70_0223B364
	adds r0, r4, #0
	movs r1, #3
	movs r2, #4
	bl ov70_02238D84
	ldr r0, _0223B11C @ =0x000005DC
	bl FUN_0200604C
	b _0223B10C
_0223B02C:
	movs r3, #2
	tst r3, r1
	beq _0223B054
	movs r0, #0x10
	str r0, [sp]
	str r2, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _0223B11C @ =0x000005DC
	bl FUN_0200604C
	b _0223B10C
_0223B054:
	movs r2, #0x20
	tst r2, r1
	beq _0223B07A
	movs r2, #0x4b
	lsls r2, r2, #2
	ldr r5, [r4, r2]
	ldr r1, _0223B120 @ =0x022454A4
	lsls r3, r5, #1
	ldrb r1, [r1, r3]
	cmp r5, r1
	beq _0223B10C
	subs r2, r2, #4
	ldr r3, [r4, r2]
	adds r2, r1, #1
	cmp r3, r2
	blt _0223B10C
	bl ov70_0223AFA8
	b _0223B10C
_0223B07A:
	movs r2, #0x10
	tst r1, r2
	beq _0223B0A0
	movs r2, #0x4b
	lsls r2, r2, #2
	ldr r5, [r4, r2]
	ldr r1, _0223B124 @ =0x022454A5
	lsls r3, r5, #1
	ldrb r1, [r1, r3]
	cmp r5, r1
	beq _0223B10C
	subs r2, r2, #4
	ldr r3, [r4, r2]
	adds r2, r1, #1
	cmp r3, r2
	blt _0223B10C
	bl ov70_0223AFA8
	b _0223B10C
_0223B0A0:
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov70_02241164
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0223B0BA
	adds r0, r4, #0
	bl ov70_0223AFA8
_0223B0BA:
	ldr r0, _0223B128 @ =0x02245498
	bl FUN_02025224
	cmp r0, #0
	bne _0223B0E6
	ldr r0, _0223B118 @ =0x00000F0F
	movs r1, #0x10
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl ov70_0223B364
	adds r0, r4, #0
	movs r1, #3
	movs r2, #4
	bl ov70_02238D84
	ldr r0, _0223B11C @ =0x000005DC
	bl FUN_0200604C
	b _0223B10C
_0223B0E6:
	cmp r0, #1
	bne _0223B10C
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _0223B11C @ =0x000005DC
	bl FUN_0200604C
_0223B10C:
	movs r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223B114: .4byte 0x021D110C
_0223B118: .4byte 0x00000F0F
_0223B11C: .4byte 0x000005DC
_0223B120: .4byte 0x022454A4
_0223B124: .4byte 0x022454A5
_0223B128: .4byte 0x02245498
	thumb_func_end ov70_0223AFFC

	thumb_func_start ov70_0223B12C
ov70_0223B12C: @ 0x0223B12C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _0223B184 @ =0x00000F0C
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	ldr r0, [r4, #0x24]
	cmp r0, #0xf
	beq _0223B178
	cmp r0, #6
	bne _0223B160
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _0223B178
_0223B160:
	movs r0, #6
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
_0223B178:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223B184: .4byte 0x00000F0C
	thumb_func_end ov70_0223B12C

	thumb_func_start ov70_0223B188
ov70_0223B188: @ 0x0223B188
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	ldr r2, _0223B1B0 @ =0x0000012E
	movs r1, #0xa
	movs r3, #3
	bl ov70_02238C2C
	ldr r1, _0223B1B4 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #5
	str r0, [r4, #0x2c]
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0223B1B0: .4byte 0x0000012E
_0223B1B4: .4byte 0x000011C8
	thumb_func_end ov70_0223B188

	thumb_func_start ov70_0223B1B8
ov70_0223B1B8: @ 0x0223B1B8
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223B202
	ldr r0, _0223B240 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #2
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #6
	bl ov70_02238E50
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223B244 @ =0x00001138
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x4d
	bl ov70_0223B3BC
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223B248 @ =0x000010E8
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x51
	bl ov70_0223B3BC
	adds r0, r4, #0
	bl ov70_0223B258
	b _0223B23C
_0223B202:
	cmp r0, #2
	bne _0223B23C
	ldr r0, _0223B240 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _0223B24C @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	movs r0, #1
	str r0, [r4, #0x2c]
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223B250 @ =0x00000F58
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x58
	bl ov70_0223B3EC
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r1, _0223B254 @ =0x00000F68
	ldr r0, [r4, r0]
	adds r1, r4, r1
	movs r2, #0x6d
	bl ov70_0223B3EC
_0223B23C:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223B240: .4byte 0x000011C8
_0223B244: .4byte 0x00001138
_0223B248: .4byte 0x000010E8
_0223B24C: .4byte 0x00000F18
_0223B250: .4byte 0x00000F58
_0223B254: .4byte 0x00000F68
	thumb_func_end ov70_0223B1B8

	thumb_func_start ov70_0223B258
ov70_0223B258: @ 0x0223B258
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0x64
	movs r1, #0x24
	bl FUN_02007914
	ldr r2, _0223B2B4 @ =0x00000BC4
	ldr r0, _0223B2B8 @ =0x000010F8
	ldr r1, [r4, r2]
	adds r2, r2, #4
	ldr r2, [r4, r2]
	adds r0, r4, r0
	bl ov70_0223B484
	movs r2, #0xba
	ldr r0, _0223B2BC @ =0x00001148
	lsls r2, r2, #4
	movs r3, #0x35
	movs r5, #0x4b
	ldr r1, [r4, r2]
	adds r2, r2, #4
	lsls r3, r3, #4
	lsls r5, r5, #2
	adds r0, r4, r0
	ldr r2, [r4, r2]
	adds r3, r4, r3
	ldr r4, [r4, r5]
	subs r5, #8
	muls r5, r4, r5
	adds r3, r3, r5
	bl ov70_0223B41C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223B2B4: .4byte 0x00000BC4
_0223B2B8: .4byte 0x000010F8
_0223B2BC: .4byte 0x00001148
	thumb_func_end ov70_0223B258

	thumb_func_start ov70_0223B2C0
ov70_0223B2C0: @ 0x0223B2C0
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_0223B258
	movs r0, #1
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_0223B2C0

	thumb_func_start ov70_0223B2D0
ov70_0223B2D0: @ 0x0223B2D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223B2FC @ =0x00000F14
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223B2F6
	ldr r0, _0223B2FC @ =0x00000F14
	movs r1, #0
	str r1, [r4, r0]
	movs r1, #1
	str r1, [r4, #0x2c]
	subs r0, #8
	ldr r0, [r4, r0]
	bl FUN_02024830
_0223B2F6:
	movs r0, #3
	pop {r4, pc}
	nop
_0223B2FC: .4byte 0x00000F14
	thumb_func_end ov70_0223B2D0

	thumb_func_start ov70_0223B300
ov70_0223B300: @ 0x0223B300
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223B338 @ =0x00000F14
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223B332
	ldr r2, _0223B33C @ =0x04000304
	ldr r0, _0223B340 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #2
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0xf
	bl ov70_02238E50
	ldr r0, _0223B338 @ =0x00000F14
	movs r1, #0x10
	str r1, [r4, r0]
_0223B332:
	movs r0, #3
	pop {r4, pc}
	nop
_0223B338: .4byte 0x00000F14
_0223B33C: .4byte 0x04000304
_0223B340: .4byte 0xFFFF7FFF
	thumb_func_end ov70_0223B300

	thumb_func_start ov70_0223B344
ov70_0223B344: @ 0x0223B344
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223B35E
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223B35E:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223B344

	thumb_func_start ov70_0223B364
ov70_0223B364: @ 0x0223B364
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	movs r2, #0xba
	adds r5, r0, #0
	lsls r2, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x1c
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	ldr r0, _0223B3B4 @ =0x00000F18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _0223B3B4 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #2
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223B3B4 @ =0x00000F18
	ldr r2, _0223B3B8 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223B3B4: .4byte 0x00000F18
_0223B3B8: .4byte 0x00000BBC
	thumb_func_end ov70_0223B364

	thumb_func_start ov70_0223B3BC
ov70_0223B3BC: @ 0x0223B3BC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _0223B3E8 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223B3E8: .4byte 0x000F0200
	thumb_func_end ov70_0223B3BC

	thumb_func_start ov70_0223B3EC
ov70_0223B3EC: @ 0x0223B3EC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, _0223B418 @ =0x000F0200
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov70_022450B8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B418: .4byte 0x000F0200
	thumb_func_end ov70_0223B3EC

	thumb_func_start ov70_0223B41C
ov70_0223B41C: @ 0x0223B41C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r1, #0
	movs r1, #0
	adds r5, r0, #0
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_0201D978
	ldr r0, _0223B480 @ =0x00010200
	movs r3, #0
	str r0, [sp]
	ldrsh r2, [r4, r3]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov70_0223F20C
	movs r0, #0x49
	str r0, [sp]
	movs r3, #0
	ldr r0, _0223B480 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	movs r2, #2
	ldrsb r2, [r4, r2]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov70_0223F324
	movs r0, #3
	movs r1, #4
	ldrsb r0, [r4, r0]
	ldrsb r1, [r4, r1]
	movs r2, #0
	bl ov70_0223F864
	adds r2, r0, #0
	movs r0, #0x68
	str r0, [sp]
	movs r3, #0
	ldr r0, _0223B480 @ =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	str r3, [sp, #0xc]
	bl ov70_0223F38C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223B480: .4byte 0x00010200
	thumb_func_end ov70_0223B41C

	thumb_func_start ov70_0223B484
ov70_0223B484: @ 0x0223B484
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	adds r6, r2, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	cmp r4, #0
	beq _0223B4B4
	movs r2, #0
	ldr r0, _0223B4D0 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov70_02245084
_0223B4B4:
	cmp r6, #0
	beq _0223B4CC
	movs r2, #0
	ldr r0, _0223B4D0 @ =0x00010200
	str r2, [sp]
	adds r5, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
_0223B4CC:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223B4D0: .4byte 0x00010200
	thumb_func_end ov70_0223B484

	thumb_func_start ov70_0223B4D4
ov70_0223B4D4: @ 0x0223B4D4
	push {r3, r4, r5, lr}
	ldr r3, _0223B558 @ =0x00000F14
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #0
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _0223B558 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #1
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _0223B558 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _0223B558 @ =0x00000F14
	movs r1, #3
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	adds r2, r1, #0
	bl FUN_0201BC8C
	ldr r3, _0223B558 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #4
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	ldr r3, _0223B558 @ =0x00000F14
	movs r2, #3
	ldr r5, [r4, r3]
	adds r3, r2, #0
	subs r3, #0x23
	ldr r0, [r4, #4]
	movs r1, #5
	subs r3, r3, r5
	bl FUN_0201BC8C
	ldr r3, _0223B558 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #6
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	ldr r3, _0223B558 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #7
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	pop {r3, r4, r5, pc}
	nop
_0223B558: .4byte 0x00000F14
	thumb_func_end ov70_0223B4D4

	thumb_func_start ov70_0223B55C
ov70_0223B55C: @ 0x0223B55C
	push {r3, r4, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	bl ov70_0223BC7C
	ldr r0, [r4, #4]
	bl ov70_0223B7CC
	adds r0, r4, #0
	bl ov70_0223B8E0
	adds r0, r4, #0
	bl ov70_0223BAE0
	adds r0, r4, #0
	bl ov70_0223B9C8
	ldr r0, [r4, #4]
	ldr r3, _0223B6AC @ =0x00000F58
	str r0, [sp, #0xc]
	adds r0, r4, r3
	str r0, [sp, #0x10]
	ldr r0, _0223B6B0 @ =0x00001168
	adds r1, r4, r0
	str r1, [sp, #0x14]
	movs r1, #0xdd
	lsls r1, r1, #4
	ldr r2, [r4, r1]
	subs r1, r1, #4
	str r2, [sp, #0x18]
	adds r2, r3, #0
	subs r2, #0x54
	ldr r2, [r4, r2]
	subs r3, #0x50
	str r2, [sp, #0x1c]
	ldr r2, [r4, r3]
	adds r0, #0x5c
	str r2, [sp, #0x20]
	ldr r1, [r4, r1]
	movs r2, #0xba
	lsls r2, r2, #4
	str r1, [sp, #0x24]
	ldr r1, [r4, r2]
	str r1, [sp, #0x28]
	adds r1, r2, #4
	ldr r1, [r4, r1]
	adds r2, #0x10
	str r1, [sp, #0x2c]
	ldr r1, [r4, r2]
	movs r2, #1
	str r1, [sp, #0x30]
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	str r1, [sp, #0x34]
	ldr r0, [r4, r0]
	movs r1, #2
	ldr r0, [r0, #0x14]
	str r0, [sp, #0x38]
	add r0, sp, #0xc
	bl ov70_02242014
	ldr r1, _0223B6B4 @ =0x000011A8
	movs r2, #0xba
	str r0, [r4, r1]
	ldr r0, _0223B6B8 @ =0x00001058
	lsls r2, r2, #4
	subs r1, #0x30
	ldr r2, [r4, r2]
	adds r0, r4, r0
	adds r1, r4, r1
	bl ov70_0223CB1C
	ldr r3, _0223B6BC @ =0x000011DE
	movs r2, #0xba
	ldr r1, _0223B6C0 @ =0x000010D8
	lsls r2, r2, #4
	ldrh r3, [r4, r3]
	ldr r0, [r4, #4]
	ldr r2, [r4, r2]
	adds r1, r4, r1
	bl ov70_0223CC04
	movs r3, #0
	ldr r0, _0223B6C4 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, _0223B6C8 @ =0x00000BA4
	ldr r0, _0223B6CC @ =0x00001068
	ldr r1, [r4, r2]
	subs r2, #0x1a
	ldrsh r2, [r4, r2]
	adds r0, r4, r0
	bl ov70_0223F1D8
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223B6C4 @ =0x00010200
	movs r2, #0xba
	str r0, [sp, #8]
	lsls r2, r2, #4
	ldr r1, [r4, r2]
	subs r2, #0x14
	ldr r0, _0223B6D0 @ =0x00001088
	ldrsb r2, [r4, r2]
	adds r0, r4, r0
	movs r3, #1
	bl ov70_0223F2BC
	ldr r1, _0223B6D4 @ =0x00000B8D
	movs r2, #1
	ldrsb r0, [r4, r1]
	adds r1, r1, #1
	ldrsb r1, [r4, r1]
	bl ov70_0223F864
	adds r2, r0, #0
	movs r3, #0
	ldr r0, _0223B6C4 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0xba
	str r0, [sp, #8]
	ldr r0, _0223B6D8 @ =0x000010A8
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, r0
	bl ov70_0223F370
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223B6C4 @ =0x00010200
	movs r2, #0xbb
	str r0, [sp, #8]
	lsls r2, r2, #4
	ldr r3, _0223B6DC @ =0x000012CC
	ldr r0, _0223B6E0 @ =0x00001188
	ldr r1, [r4, r2]
	subs r2, #0x10
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	adds r0, r4, r0
	bl ov70_0223F244
	ldr r1, _0223B6E4 @ =ov70_0223CCA4
	ldr r0, _0223B6E8 @ =0x00001208
	str r1, [r4, r0]
	ldr r0, [r4, #0x24]
	cmp r0, #0xd
	bne _0223B6A2
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
_0223B6A2:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #2
	add sp, #0x3c
	pop {r3, r4, pc}
	.align 2, 0
_0223B6AC: .4byte 0x00000F58
_0223B6B0: .4byte 0x00001168
_0223B6B4: .4byte 0x000011A8
_0223B6B8: .4byte 0x00001058
_0223B6BC: .4byte 0x000011DE
_0223B6C0: .4byte 0x000010D8
_0223B6C4: .4byte 0x00010200
_0223B6C8: .4byte 0x00000BA4
_0223B6CC: .4byte 0x00001068
_0223B6D0: .4byte 0x00001088
_0223B6D4: .4byte 0x00000B8D
_0223B6D8: .4byte 0x000010A8
_0223B6DC: .4byte 0x000012CC
_0223B6E0: .4byte 0x00001188
_0223B6E4: .4byte ov70_0223CCA4
_0223B6E8: .4byte 0x00001208
	thumb_func_end ov70_0223B55C

	thumb_func_start ov70_0223B6EC
ov70_0223B6EC: @ 0x0223B6EC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x2c]
	lsls r2, r1, #2
	ldr r1, _0223B768 @ =0x02246528
	ldr r1, [r1, r2]
	blx r1
	movs r7, #0x6a
	str r0, [sp]
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #2
_0223B704:
	ldr r3, _0223B76C @ =0x0000120E
	ldr r1, _0223B770 @ =0x0000120C
	ldr r2, _0223B774 @ =0x00000F14
	ldr r0, _0223B778 @ =0x00000EE4
	ldrsh r3, [r4, r3]
	ldr r2, [r5, r2]
	ldrsh r1, [r4, r1]
	ldr r0, [r4, r0]
	adds r2, r2, r3
	bl ov70_02238F9C
	ldr r2, _0223B774 @ =0x00000F14
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	movs r1, #0x37
	adds r2, r2, r7
	bl ov70_02238F9C
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #8
	blt _0223B704
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r2, r0, #0
	ldr r0, _0223B77C @ =0x00000DCC
	movs r3, #6
	adds r6, r4, #0
	muls r6, r3, r6
	muls r3, r2, r3
	ldr r2, _0223B780 @ =0x02246500
	ldr r1, _0223B784 @ =0x022464FE
	ldrh r3, [r2, r3]
	ldr r2, _0223B774 @ =0x00000F14
	ldrh r1, [r1, r6]
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	subs r2, r3, r2
	bl ov70_02238F9C
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B768: .4byte 0x02246528
_0223B76C: .4byte 0x0000120E
_0223B770: .4byte 0x0000120C
_0223B774: .4byte 0x00000F14
_0223B778: .4byte 0x00000EE4
_0223B77C: .4byte 0x00000DCC
_0223B780: .4byte 0x02246500
_0223B784: .4byte 0x022464FE
	thumb_func_end ov70_0223B6EC

	thumb_func_start ov70_0223B788
ov70_0223B788: @ 0x0223B788
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223B7C8 @ =0x00001208
	movs r1, #0
	str r1, [r4, r0]
	subs r0, #0x60
	ldr r0, [r4, r0]
	bl ov70_0224212C
	adds r0, r4, #0
	bl ov70_0223BAAC
	adds r0, r4, #0
	bl ov70_0223BCD0
	adds r0, r4, #0
	bl ov70_0223BC2C
	ldr r0, [r4, #4]
	bl ov70_0223B8B4
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0223B7C8: .4byte 0x00001208
	thumb_func_end ov70_0223B788

	thumb_func_start ov70_0223B7CC
ov70_0223B7CC: @ 0x0223B7CC
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _0223B8A4 @ =0x02245690
	adds r4, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x54
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0223B8A8 @ =0x022456AC
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
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0223B8AC @ =0x02245674
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
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0223B8B0 @ =0x02245658
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
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_022391F0
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	add sp, #0x70
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B8A4: .4byte 0x02245690
_0223B8A8: .4byte 0x022456AC
_0223B8AC: .4byte 0x02245674
_0223B8B0: .4byte 0x02245658
	thumb_func_end ov70_0223B7CC

	thumb_func_start ov70_0223B8B4
ov70_0223B8B4: @ 0x0223B8B4
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022392BC
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
	movs r1, #3
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223B8B4

	thumb_func_start ov70_0223B8E0
ov70_0223B8E0: @ 0x0223B8E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r5, [r6, #4]
	movs r0, #0x64
	movs r1, #0x3d
	bl FUN_02007688
	movs r1, #0x60
	str r1, [sp]
	movs r1, #0x3d
	movs r2, #0
	str r1, [sp, #4]
	movs r1, #3
	adds r3, r2, #0
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xe
	adds r2, r5, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x1d
	adds r2, r5, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xf
	adds r2, r5, #0
	movs r3, #2
	bl FUN_02007B44
	movs r0, #4
	movs r1, #0x20
	movs r2, #0x3d
	bl FUN_0200304C
	adds r0, r6, #0
	bl ov70_02239CF8
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_0223B8E0

	thumb_func_start ov70_0223B9C8
ov70_0223B9C8: @ 0x0223B9C8
	push {r4, lr}
	sub sp, #0x30
	movs r2, #0xd6
	adds r4, r0, #0
	lsls r2, r2, #4
	add r0, sp, #0
	adds r1, r4, #0
	adds r2, r4, r2
	movs r3, #1
	bl ov70_02238B54
	ldr r0, _0223BA9C @ =0x022464F0
	ldrh r1, [r0, #0xe]
	ldrh r0, [r0, #0x10]
	lsls r1, r1, #0xc
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	str r1, [sp, #8]
	bl FUN_02024624
	ldr r1, _0223BAA0 @ =0x00000DCC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _0223BAA0 @ =0x00000DCC
	movs r1, #0x2d
	ldr r0, [r4, r0]
	bl FUN_020248F0
	ldr r0, _0223BAA0 @ =0x00000DCC
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024A04
	ldr r0, _0223BAA0 @ =0x00000DCC
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_02024B78
	movs r0, #0xa
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	movs r1, #0xdd
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x2f
	bl FUN_020248F0
	movs r0, #0xdd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x39
	lsls r0, r0, #0xe
	str r0, [sp, #8]
	movs r0, #0x75
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223BAA4 @ =0x00000F04
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x26
	bl FUN_020248F0
	ldr r0, _0223BAA4 @ =0x00000F04
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	movs r0, #0x23
	lsls r0, r0, #0xe
	str r0, [sp, #8]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223BAA8 @ =0x00000F08
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x27
	bl FUN_020248F0
	ldr r0, _0223BAA8 @ =0x00000F08
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	bl FUN_0203A880
	add sp, #0x30
	pop {r4, pc}
	nop
_0223BA9C: .4byte 0x022464F0
_0223BAA0: .4byte 0x00000DCC
_0223BAA4: .4byte 0x00000F04
_0223BAA8: .4byte 0x00000F08
	thumb_func_end ov70_0223B9C8

	thumb_func_start ov70_0223BAAC
ov70_0223BAAC: @ 0x0223BAAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223BAD4 @ =0x00000DCC
	ldr r0, [r4, r0]
	bl FUN_02024758
	movs r0, #0xdd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02024758
	ldr r0, _0223BAD8 @ =0x00000F04
	ldr r0, [r4, r0]
	bl FUN_02024758
	ldr r0, _0223BADC @ =0x00000F08
	ldr r0, [r4, r0]
	bl FUN_02024758
	pop {r4, pc}
	.align 2, 0
_0223BAD4: .4byte 0x00000DCC
_0223BAD8: .4byte 0x00000F04
_0223BADC: .4byte 0x00000F08
	thumb_func_end ov70_0223BAAC

	thumb_func_start ov70_0223BAE0
ov70_0223BAE0: @ 0x0223BAE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, _0223BC10 @ =0x00000F18
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #4]
	adds r1, r1, r2
	movs r2, #0
	bl FUN_0201D40C
	ldr r1, _0223BC10 @ =0x00000F18
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	ldr r1, _0223BC14 @ =0x00001058
	ldr r0, [sp, #0x14]
	ldr r4, _0223BC18 @ =0x02245640
	movs r7, #0
	movs r6, #1
	adds r5, r0, r1
_0223BB22:
	ldrh r0, [r4, #2]
	adds r1, r5, #0
	movs r2, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	ldr r0, [r0, #4]
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, #0x16
	adds r4, r4, #4
	adds r5, #0x10
	cmp r7, #6
	blt _0223BB22
	ldr r1, _0223BC1C @ =0x00001178
	ldr r0, [sp, #0x14]
	ldr r4, _0223BC20 @ =0x0224562C
	movs r7, #0
	movs r6, #0x85
	adds r5, r0, r1
_0223BB6E:
	ldrh r0, [r4, #2]
	adds r1, r5, #0
	movs r2, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	ldr r0, [r0, #4]
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, #0x38
	adds r4, r4, #4
	adds r5, #0x10
	cmp r7, #2
	blt _0223BB6E
	ldr r1, _0223BC14 @ =0x00001058
	ldr r0, [sp, #0x14]
	ldr r6, _0223BC24 @ =0x0000011D
	adds r0, r0, r1
	ldr r4, _0223BC28 @ =0x02245634
	movs r5, #0
	str r0, [sp, #0x18]
_0223BBBC:
	adds r0, r5, #6
	lsls r7, r0, #4
	ldrh r0, [r4, #2]
	ldr r1, [sp, #0x18]
	movs r2, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	adds r1, r1, r7
	lsls r3, r3, #0x18
	ldr r0, [r0, #4]
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	ldr r0, [sp, #0x18]
	movs r1, #0
	adds r0, r0, r7
	bl FUN_0201D978
	adds r5, r5, #1
	adds r6, #0x14
	adds r4, r4, #4
	cmp r5, #3
	blt _0223BBBC
	ldr r0, [sp, #0x14]
	movs r1, #4
	bl ov70_02239D44
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223BC10: .4byte 0x00000F18
_0223BC14: .4byte 0x00001058
_0223BC18: .4byte 0x02245640
_0223BC1C: .4byte 0x00001178
_0223BC20: .4byte 0x0224562C
_0223BC24: .4byte 0x0000011D
_0223BC28: .4byte 0x02245634
	thumb_func_end ov70_0223BAE0

	thumb_func_start ov70_0223BC2C
ov70_0223BC2C: @ 0x0223BC2C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0223BC6C @ =0x00001198
	adds r0, r6, r0
	bl FUN_0201D520
	ldr r0, _0223BC70 @ =0x00000F18
	adds r0, r6, r0
	bl FUN_0201D520
	ldr r0, _0223BC74 @ =0x00001058
	movs r4, #0
	adds r5, r6, r0
_0223BC46:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #9
	blt _0223BC46
	ldr r0, _0223BC78 @ =0x00001178
	movs r4, #0
	adds r5, r6, r0
_0223BC5A:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blt _0223BC5A
	pop {r4, r5, r6, pc}
	nop
_0223BC6C: .4byte 0x00001198
_0223BC70: .4byte 0x00000F18
_0223BC74: .4byte 0x00001058
_0223BC78: .4byte 0x00001178
	thumb_func_end ov70_0223BC2C

	thumb_func_start ov70_0223BC7C
ov70_0223BC7C: @ 0x0223BC7C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _0223BCC8 @ =0x00000BBC
	str r0, [r4, r1]
	subs r1, #0x1c
	ldr r0, [r4, r1]
	movs r1, #0x2a
	bl FUN_0200BBA0
	movs r1, #0x2f
	lsls r1, r1, #6
	str r0, [r4, r1]
	movs r0, #0x3d
	movs r1, #0x30
	bl FUN_0201AA8C
	ldr r1, _0223BCCC @ =0x000011C4
	movs r2, #0x30
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	movs r0, #0
	blx FUN_020D4858
	movs r0, #0x3d
	bl ov70_0223F684
	ldr r1, _0223BCCC @ =0x000011C4
	ldr r2, [r4, r1]
	adds r1, #0x70
	str r0, [r2, #0x14]
	adds r0, r4, r1
	bl ov70_0223F948
	pop {r4, pc}
	.align 2, 0
_0223BCC8: .4byte 0x00000BBC
_0223BCCC: .4byte 0x000011C4
	thumb_func_end ov70_0223BC7C

	thumb_func_start ov70_0223BCD0
ov70_0223BCD0: @ 0x0223BCD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223BCFC @ =0x000011C4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x14]
	bl FUN_0201AB0C
	ldr r0, _0223BCFC @ =0x000011C4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _0223BD00 @ =0x00000BBC
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x2f
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	nop
_0223BCFC: .4byte 0x000011C4
_0223BD00: .4byte 0x00000BBC
	thumb_func_end ov70_0223BCD0

	thumb_func_start ov70_0223BD04
ov70_0223BD04: @ 0x0223BD04
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, [r4, #0x24]
	cmp r1, #0xf
	ldr r1, _0223BD78 @ =0x00000F0F
	bne _0223BD4E
	movs r2, #0
	str r1, [sp]
	movs r1, #0x20
	adds r3, r2, #0
	bl ov70_0223CAC4
	ldr r0, _0223BD7C @ =0x0400006C
	blx FUN_020CDAA8
	movs r1, #0xf
	mvns r1, r1
	cmp r0, r1
	bne _0223BD48
	movs r0, #0x10
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x1e
	str r0, [r4, #0x2c]
	b _0223BD64
_0223BD48:
	movs r0, #1
	str r0, [r4, #0x2c]
	b _0223BD64
_0223BD4E:
	str r1, [sp]
	movs r1, #8
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov70_02238D84
_0223BD64:
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223BD78: .4byte 0x00000F0F
_0223BD7C: .4byte 0x0400006C
	thumb_func_end ov70_0223BD04

	thumb_func_start ov70_0223BD80
ov70_0223BD80: @ 0x0223BD80
	ldr r3, _0223BD88 @ =FUN_02025224
	ldr r0, _0223BD8C @ =0x022456C8
	bx r3
	nop
_0223BD88: .4byte FUN_02025224
_0223BD8C: .4byte 0x022456C8
	thumb_func_end ov70_0223BD80

	thumb_func_start ov70_0223BD90
ov70_0223BD90: @ 0x0223BD90
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r1, #6
	bhi _0223BE70
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223BDA6: @ jump table
	.2byte _0223BDB4 - _0223BDA6 - 2 @ case 0
	.2byte _0223BDC2 - _0223BDA6 - 2 @ case 1
	.2byte _0223BDFE - _0223BDA6 - 2 @ case 2
	.2byte _0223BE0C - _0223BDA6 - 2 @ case 3
	.2byte _0223BE1A - _0223BDA6 - 2 @ case 4
	.2byte _0223BE4A - _0223BDA6 - 2 @ case 5
	.2byte _0223BE52 - _0223BDA6 - 2 @ case 6
_0223BDB4:
	movs r0, #3
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 @ =0x000005DC
	bl FUN_0200604C
	add sp, #0xc
	pop {r3, r4, pc}
_0223BDC2:
	ldr r0, _0223BE78 @ =0x00000B8A
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _0223BDF0
	movs r1, #0x12
	bl FUN_0206FBE8
	ldr r1, _0223BE7C @ =0x000011C4
	ldr r2, [r4, r1]
	str r0, [r2, #0x20]
	ldr r1, [r4, r1]
	ldr r0, _0223BE78 @ =0x00000B8A
	ldr r1, [r1, #0x20]
	adds r0, r4, r0
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223BDF0
	ldr r0, _0223BE74 @ =0x000005DC
	bl FUN_0200604C
	add sp, #0xc
	pop {r3, r4, pc}
_0223BDF0:
	movs r0, #6
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 @ =0x000005DC
	bl FUN_0200604C
	add sp, #0xc
	pop {r3, r4, pc}
_0223BDFE:
	movs r0, #9
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 @ =0x000005DC
	bl FUN_0200604C
	add sp, #0xc
	pop {r3, r4, pc}
_0223BE0C:
	movs r0, #0xc
	str r0, [r4, #0x2c]
	ldr r0, _0223BE74 @ =0x000005DC
	bl FUN_0200604C
	add sp, #0xc
	pop {r3, r4, pc}
_0223BE1A:
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223BE70
	movs r0, #0x1d
	str r0, [r4, #0x2c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, _0223BE74 @ =0x000005DC
	bl FUN_0200604C
	add sp, #0xc
	pop {r3, r4, pc}
_0223BE4A:
	movs r0, #0xf
	add sp, #0xc
	str r0, [r4, #0x2c]
	pop {r3, r4, pc}
_0223BE52:
	ldr r1, _0223BE80 @ =0x00000F0F
	movs r2, #1
	str r1, [sp]
	movs r1, #0xf
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #0x17
	bl ov70_02238D84
	ldr r0, _0223BE74 @ =0x000005DC
	bl FUN_0200604C
_0223BE70:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223BE74: .4byte 0x000005DC
_0223BE78: .4byte 0x00000B8A
_0223BE7C: .4byte 0x000011C4
_0223BE80: .4byte 0x00000F0F
	thumb_func_end ov70_0223BD90

	thumb_func_start ov70_0223BE84
ov70_0223BE84: @ 0x0223BE84
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_0223BD80
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _0223BEA8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_0223C420
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_0223BD90
	b _0223BEEE
_0223BEA8:
	adds r0, r5, #0
	bl ov70_0223C304
	ldr r0, _0223BEF4 @ =0x021D110C
	movs r2, #1
	ldr r1, [r0, #0x48]
	adds r0, r1, #0
	tst r0, r2
	beq _0223BECA
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov70_0223BD90
	b _0223BEEE
_0223BECA:
	movs r0, #2
	tst r0, r1
	beq _0223BEEE
	ldr r0, _0223BEF8 @ =0x00000F0F
	movs r1, #0xf
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r5, #0
	movs r1, #0x15
	movs r2, #0x17
	bl ov70_02238D84
	ldr r0, _0223BEFC @ =0x000005DC
	bl FUN_0200604C
_0223BEEE:
	movs r0, #3
	pop {r3, r4, r5, pc}
	nop
_0223BEF4: .4byte 0x021D110C
_0223BEF8: .4byte 0x00000F0F
_0223BEFC: .4byte 0x000005DC
	thumb_func_end ov70_0223BE84

	thumb_func_start ov70_0223BF00
ov70_0223BF00: @ 0x0223BF00
	push {r3, r4, lr}
	sub sp, #4
	ldr r3, _0223BF94 @ =0x00000B8A
	adds r4, r0, #0
	ldrsh r1, [r4, r3]
	cmp r1, #0
	bne _0223BF2E
	ldr r1, _0223BF98 @ =0x00000F0F
	movs r2, #1
	str r1, [sp]
	movs r1, #0xc
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov70_02238D84
	ldr r0, _0223BF9C @ =0x000005F3
	bl FUN_0200604C
	b _0223BF8C
_0223BF2E:
	ldr r2, _0223BFA0 @ =0x000012CC
	adds r1, r3, #6
	adds r0, r4, r3
	adds r3, #0xe
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	adds r1, r4, r1
	bl ov70_0223CC68
	cmp r0, #0
	beq _0223BF66
	ldr r0, _0223BF98 @ =0x00000F0F
	movs r1, #0x21
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov70_02238D84
	ldr r0, _0223BF9C @ =0x000005F3
	bl FUN_0200604C
	b _0223BF8C
_0223BF66:
	ldr r0, _0223BFA4 @ =0x000005FE
	bl FUN_0200604C
	ldr r0, _0223BF98 @ =0x00000F0F
	movs r1, #0xd
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #0x10
	bl ov70_02238D84
	adds r0, r4, #0
	bl ov70_02241234
_0223BF8C:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223BF94: .4byte 0x00000B8A
_0223BF98: .4byte 0x00000F0F
_0223BF9C: .4byte 0x000005F3
_0223BFA0: .4byte 0x000012CC
_0223BFA4: .4byte 0x000005FE
	thumb_func_end ov70_0223BF00

	thumb_func_start ov70_0223BFA8
ov70_0223BFA8: @ 0x0223BFA8
	push {r3, r4, lr}
	sub sp, #0x2c
	cmp r1, #1
	ldr r0, [r0]
	bne _0223BFBA
	ldr r0, [r0]
	bl FUN_0202DB90
	b _0223BFC0
_0223BFBA:
	ldr r0, [r0]
	bl FUN_0202DB80
_0223BFC0:
	lsrs r1, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x1c]
	lsrs r1, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x20]
	lsrs r1, r0, #8
	lsls r1, r1, #0x18
	lsls r0, r0, #0x18
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x18
	str r1, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0xc
	add r1, sp, #0
	blx FUN_021ECB94
	add r0, sp, #0xc
	blx FUN_020DC284
	adds r4, r0, #0
	add r0, sp, #0x1c
	blx FUN_020DC284
	subs r0, r4, r0
	bmi _0223C002
	cmp r0, #3
	bge _0223C002
	add sp, #0x2c
	movs r0, #1
	pop {r3, r4, pc}
_0223C002:
	movs r0, #0
	add sp, #0x2c
	pop {r3, r4, pc}
	thumb_func_end ov70_0223BFA8

	thumb_func_start ov70_0223C008
ov70_0223C008: @ 0x0223C008
	push {r3, r4, r5, lr}
	sub sp, #8
	movs r1, #1
	adds r5, r0, #0
	movs r4, #3
	bl ov70_0223BFA8
	cmp r0, #0
	beq _0223C01C
	adds r4, r4, #2
_0223C01C:
	adds r0, r5, #0
	movs r1, #0
	bl ov70_0223BFA8
	cmp r0, #0
	beq _0223C02A
	adds r4, r4, #2
_0223C02A:
	ldr r0, _0223C0BC @ =0x000012CC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223C044
	ldr r0, _0223C0C0 @ =0x00000B8A
	movs r2, #0x26
	lsls r2, r2, #4
	adds r0, r5, r0
	adds r1, r4, #0
	adds r2, r5, r2
	bl ov70_02238130
	b _0223C082
_0223C044:
	add r0, sp, #0
	movs r1, #0
	movs r2, #8
	blx FUN_020D4994
	ldr r1, _0223C0C0 @ =0x00000B8A
	add r0, sp, #0
	ldrsh r2, [r5, r1]
	strh r2, [r0]
	adds r2, r1, #2
	ldrsb r2, [r5, r2]
	strb r2, [r0, #2]
	adds r2, r1, #3
	ldrsb r2, [r5, r2]
	strb r2, [r0, #3]
	adds r2, r1, #4
	ldrsb r2, [r5, r2]
	adds r1, r1, #5
	strb r2, [r0, #4]
	ldrsb r1, [r5, r1]
	strb r1, [r0, #5]
	ldr r1, _0223C0BC @ =0x000012CC
	strb r4, [r0, #6]
	ldr r1, [r5, r1]
	strb r1, [r0, #7]
	movs r1, #0x26
	lsls r1, r1, #4
	add r0, sp, #0
	adds r1, r5, r1
	bl ov70_022381A4
_0223C082:
	ldr r1, _0223C0C0 @ =0x00000B8A
	ldrh r2, [r5, r1]
	adds r0, r1, #6
	strh r2, [r5, r0]
	adds r0, r1, #2
	ldrh r2, [r5, r0]
	adds r0, r1, #0
	adds r0, #8
	strh r2, [r5, r0]
	adds r0, r1, #4
	ldrh r2, [r5, r0]
	adds r0, r1, #0
	adds r0, #0xa
	strh r2, [r5, r0]
	ldr r2, _0223C0BC @ =0x000012CC
	adds r1, #0xe
	ldr r0, [r5, r2]
	subs r2, #0xee
	str r0, [r5, r1]
	ldr r0, _0223C0C4 @ =0x00001604
	movs r1, #0
	str r1, [r5, r0]
	movs r0, #0x11
	str r0, [r5, #0x2c]
	strh r1, [r5, r2]
	movs r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223C0BC: .4byte 0x000012CC
_0223C0C0: .4byte 0x00000B8A
_0223C0C4: .4byte 0x00001604
	thumb_func_end ov70_0223C008

	thumb_func_start ov70_0223C0C8
ov70_0223C0C8: @ 0x0223C0C8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223C176
	bl ov70_02237F58
	adds r5, r0, #0
	ldr r0, _0223C190 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x16
	bhi _0223C18C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223C0F4: @ jump table
	.2byte _0223C170 - _0223C0F4 - 2 @ case 0
	.2byte _0223C164 - _0223C0F4 - 2 @ case 1
	.2byte _0223C16A - _0223C0F4 - 2 @ case 2
	.2byte _0223C170 - _0223C0F4 - 2 @ case 3
	.2byte _0223C18C - _0223C0F4 - 2 @ case 4
	.2byte _0223C18C - _0223C0F4 - 2 @ case 5
	.2byte _0223C18C - _0223C0F4 - 2 @ case 6
	.2byte _0223C18C - _0223C0F4 - 2 @ case 7
	.2byte _0223C18C - _0223C0F4 - 2 @ case 8
	.2byte _0223C18C - _0223C0F4 - 2 @ case 9
	.2byte _0223C18C - _0223C0F4 - 2 @ case 10
	.2byte _0223C18C - _0223C0F4 - 2 @ case 11
	.2byte _0223C18C - _0223C0F4 - 2 @ case 12
	.2byte _0223C164 - _0223C0F4 - 2 @ case 13
	.2byte _0223C18C - _0223C0F4 - 2 @ case 14
	.2byte _0223C122 - _0223C0F4 - 2 @ case 15
	.2byte _0223C122 - _0223C0F4 - 2 @ case 16
	.2byte _0223C122 - _0223C0F4 - 2 @ case 17
	.2byte _0223C122 - _0223C0F4 - 2 @ case 18
	.2byte _0223C122 - _0223C0F4 - 2 @ case 19
	.2byte _0223C122 - _0223C0F4 - 2 @ case 20
	.2byte _0223C122 - _0223C0F4 - 2 @ case 21
	.2byte _0223C122 - _0223C0F4 - 2 @ case 22
_0223C122:
	movs r0, #0x4a
	lsls r0, r0, #2
	str r5, [r4, r0]
	ldr r0, _0223C194 @ =0x000005FE
	bl FUN_02006154
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov70_02241184
	cmp r5, #0
	ldr r0, [r4, #4]
	ldr r1, _0223C198 @ =0x000010D8
	bne _0223C150
	movs r2, #0xba
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	adds r1, r4, r1
	movs r3, #0
	bl ov70_0223CC04
	b _0223C15E
_0223C150:
	movs r2, #0xba
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	adds r1, r4, r1
	movs r3, #1
	bl ov70_0223CC04
_0223C15E:
	movs r0, #0x12
	str r0, [r4, #0x2c]
	b _0223C18C
_0223C164:
	movs r0, #0x1b
	str r0, [r4, #0x2c]
	b _0223C18C
_0223C16A:
	bl FUN_020399EC
	b _0223C18C
_0223C170:
	movs r0, #0x14
	str r0, [r4, #0x2c]
	b _0223C18C
_0223C176:
	ldr r0, _0223C190 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _0223C18C
	bl FUN_020399EC
_0223C18C:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223C190: .4byte 0x00001604
_0223C194: .4byte 0x000005FE
_0223C198: .4byte 0x000010D8
	thumb_func_end ov70_0223C0C8

	thumb_func_start ov70_0223C19C
ov70_0223C19C: @ 0x0223C19C
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0x4a
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	ldr r1, _0223C1F0 @ =0x00000F0F
	bne _0223C1CC
	str r1, [sp]
	movs r1, #0xe
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov70_02238D84
	ldr r0, _0223C1F4 @ =0x000005F3
	bl FUN_0200604C
	b _0223C1EA
_0223C1CC:
	str r1, [sp]
	movs r1, #0x1e
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #0x13
	bl ov70_02238D84
	movs r0, #0x47
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
_0223C1EA:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C1F0: .4byte 0x00000F0F
_0223C1F4: .4byte 0x000005F3
	thumb_func_end ov70_0223C19C

	thumb_func_start ov70_0223C1F8
ov70_0223C1F8: @ 0x0223C1F8
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0x47
	adds r4, r0, #0
	lsls r1, r1, #6
	ldr r2, [r4, r1]
	adds r2, r2, #1
	str r2, [r4, r1]
	ldr r1, [r4, r1]
	cmp r1, #0x2d
	ble _0223C22C
	ldr r1, _0223C234 @ =0x00000F0F
	movs r2, #1
	str r1, [sp]
	movs r1, #0x20
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov70_02238D84
	ldr r0, _0223C238 @ =0x000011DE
	movs r1, #1
	strh r1, [r4, r0]
_0223C22C:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C234: .4byte 0x00000F0F
_0223C238: .4byte 0x000011DE
	thumb_func_end ov70_0223C1F8

	thumb_func_start ov70_0223C23C
ov70_0223C23C: @ 0x0223C23C
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0xb9
	adds r4, r0, #0
	movs r3, #0
	lsls r1, r1, #4
	strh r3, [r4, r1]
	ldr r1, _0223C26C @ =0x00000F0F
	movs r2, #1
	str r1, [sp]
	movs r1, #0x26
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov70_02238D84
	ldr r0, _0223C270 @ =0x000005F3
	bl FUN_0200604C
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C26C: .4byte 0x00000F0F
_0223C270: .4byte 0x000005F3
	thumb_func_end ov70_0223C23C

	thumb_func_start ov70_0223C274
ov70_0223C274: @ 0x0223C274
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C2A8 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0x99
	movs r2, #4
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x16
	movs r2, #0x1c
	bl ov70_02238D84
	movs r0, #0x47
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r4, r0]
	ldr r0, _0223C2AC @ =0x000005F3
	bl FUN_0200604C
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C2A8: .4byte 0x00000F0F
_0223C2AC: .4byte 0x000005F3
	thumb_func_end ov70_0223C274

	thumb_func_start ov70_0223C2B0
ov70_0223C2B0: @ 0x0223C2B0
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C2E4 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0x9e
	movs r2, #4
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x16
	movs r2, #2
	bl ov70_02238D84
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	ldr r0, _0223C2E8 @ =0x000005F3
	bl FUN_0200604C
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C2E4: .4byte 0x00000F0F
_0223C2E8: .4byte 0x000005F3
	thumb_func_end ov70_0223C2B0

	thumb_func_start ov70_0223C2EC
ov70_0223C2EC: @ 0x0223C2EC
	ldr r1, _0223C300 @ =0x000011C4
	ldr r1, [r0, r1]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	bne _0223C2FA
	ldr r0, [r1, #0x28]
	bx lr
_0223C2FA:
	ldr r0, [r1, #0x2c]
	adds r0, r0, #4
	bx lr
	.align 2, 0
_0223C300: .4byte 0x000011C4
	thumb_func_end ov70_0223C2EC

	thumb_func_start ov70_0223C304
ov70_0223C304: @ 0x0223C304
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0223C404 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0223C346
	ldr r0, _0223C408 @ =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	bne _0223C32E
	ldr r0, [r1, #0x28]
	cmp r0, #0
	ble _0223C3BE
	subs r0, r0, #1
	str r0, [r1, #0x28]
	ldr r0, _0223C40C @ =0x000005DC
	bl FUN_0200604C
	b _0223C3BE
_0223C32E:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	ble _0223C3BE
	ldr r0, _0223C40C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0223C408 @ =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x2c]
	subs r0, r0, #1
	str r0, [r1, #0x2c]
	b _0223C3BE
_0223C346:
	movs r1, #0x80
	tst r1, r0
	beq _0223C380
	ldr r0, _0223C408 @ =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x24]
	cmp r0, #0
	bne _0223C368
	ldr r0, [r1, #0x28]
	cmp r0, #3
	bge _0223C3BE
	adds r0, r0, #1
	str r0, [r1, #0x28]
	ldr r0, _0223C40C @ =0x000005DC
	bl FUN_0200604C
	b _0223C3BE
_0223C368:
	ldr r0, [r1, #0x2c]
	cmp r0, #2
	bge _0223C3BE
	ldr r0, _0223C40C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0223C408 @ =0x000011C4
	ldr r1, [r5, r0]
	ldr r0, [r1, #0x2c]
	adds r0, r0, #1
	str r0, [r1, #0x2c]
	b _0223C3BE
_0223C380:
	movs r1, #0x10
	tst r1, r0
	beq _0223C3A0
	ldr r0, _0223C408 @ =0x000011C4
	ldr r0, [r5, r0]
	ldr r0, [r0, #0x24]
	cmp r0, #1
	beq _0223C396
	ldr r0, _0223C40C @ =0x000005DC
	bl FUN_0200604C
_0223C396:
	ldr r0, _0223C408 @ =0x000011C4
	movs r1, #1
	ldr r0, [r5, r0]
	str r1, [r0, #0x24]
	b _0223C3BE
_0223C3A0:
	movs r1, #0x20
	tst r0, r1
	beq _0223C3BE
	ldr r0, _0223C408 @ =0x000011C4
	ldr r0, [r5, r0]
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _0223C3B6
	ldr r0, _0223C40C @ =0x000005DC
	bl FUN_0200604C
_0223C3B6:
	ldr r0, _0223C408 @ =0x000011C4
	movs r1, #0
	ldr r0, [r5, r0]
	str r1, [r0, #0x24]
_0223C3BE:
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r2, r0, #0
	ldr r0, _0223C410 @ =0x00000DCC
	movs r3, #6
	adds r6, r4, #0
	muls r6, r3, r6
	ldr r1, _0223C414 @ =0x022464FE
	muls r3, r2, r3
	ldr r2, _0223C418 @ =0x02246500
	ldrh r1, [r1, r6]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238F9C
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r3, r0, #0
	ldr r0, _0223C410 @ =0x00000DCC
	movs r1, #6
	adds r2, r3, #0
	muls r2, r1, r2
	ldr r1, _0223C41C @ =0x02246502
	ldr r0, [r5, r0]
	ldrh r1, [r1, r2]
	bl FUN_020248F0
	pop {r4, r5, r6, pc}
	nop
_0223C404: .4byte 0x021D110C
_0223C408: .4byte 0x000011C4
_0223C40C: .4byte 0x000005DC
_0223C410: .4byte 0x00000DCC
_0223C414: .4byte 0x022464FE
_0223C418: .4byte 0x02246500
_0223C41C: .4byte 0x02246502
	thumb_func_end ov70_0223C304

	thumb_func_start ov70_0223C420
ov70_0223C420: @ 0x0223C420
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r0, r1, #1
	ldr r1, _0223C494 @ =0x022464F0
	ldrb r1, [r1, r0]
	cmp r1, #0
	ldr r1, _0223C498 @ =0x000011C4
	bne _0223C440
	ldr r2, [r5, r1]
	movs r3, #0
	str r3, [r2, #0x24]
	ldr r2, _0223C49C @ =0x022464F1
	ldrb r2, [r2, r0]
	ldr r0, [r5, r1]
	str r2, [r0, #0x28]
	b _0223C44E
_0223C440:
	ldr r2, [r5, r1]
	movs r3, #1
	str r3, [r2, #0x24]
	ldr r2, _0223C49C @ =0x022464F1
	ldrb r2, [r2, r0]
	ldr r0, [r5, r1]
	str r2, [r0, #0x2c]
_0223C44E:
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r2, r0, #0
	ldr r0, _0223C4A0 @ =0x00000DCC
	movs r3, #6
	adds r6, r4, #0
	muls r6, r3, r6
	ldr r1, _0223C4A4 @ =0x022464FE
	muls r3, r2, r3
	ldr r2, _0223C4A8 @ =0x02246500
	ldrh r1, [r1, r6]
	ldrh r2, [r2, r3]
	ldr r0, [r5, r0]
	bl ov70_02238F9C
	adds r0, r5, #0
	bl ov70_0223C2EC
	adds r3, r0, #0
	ldr r0, _0223C4A0 @ =0x00000DCC
	movs r1, #6
	adds r2, r3, #0
	muls r2, r1, r2
	ldr r1, _0223C4AC @ =0x02246502
	ldr r0, [r5, r0]
	ldrh r1, [r1, r2]
	bl FUN_020248F0
	pop {r4, r5, r6, pc}
	nop
_0223C494: .4byte 0x022464F0
_0223C498: .4byte 0x000011C4
_0223C49C: .4byte 0x022464F1
_0223C4A0: .4byte 0x00000DCC
_0223C4A4: .4byte 0x022464FE
_0223C4A8: .4byte 0x02246500
_0223C4AC: .4byte 0x02246502
	thumb_func_end ov70_0223C420

	thumb_func_start ov70_0223C4B0
ov70_0223C4B0: @ 0x0223C4B0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _0223C4E0 @ =0x00000F14
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223C4D6
	movs r0, #6
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
_0223C4D6:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223C4E0: .4byte 0x00000F14
	thumb_func_end ov70_0223C4B0

	thumb_func_start ov70_0223C4E4
ov70_0223C4E4: @ 0x0223C4E4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C508 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #9
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #4
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C508: .4byte 0x00000F0F
	thumb_func_end ov70_0223C4E4

	thumb_func_start ov70_0223C50C
ov70_0223C50C: @ 0x0223C50C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223C528 @ =0x000011A8
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov70_022420C4
	movs r0, #9
	bl ov70_0223CD28
	movs r0, #5
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223C528: .4byte 0x000011A8
	thumb_func_end ov70_0223C50C

	thumb_func_start ov70_0223C52C
ov70_0223C52C: @ 0x0223C52C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _0223C5FC @ =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	adds r5, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	beq _0223C54C
	adds r0, r0, #1
	cmp r5, r0
	beq _0223C5F6
	b _0223C56E
_0223C54C:
	movs r0, #0
	bl ov70_0223CD28
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _0223C600 @ =0x000011C4
	ldr r3, [r4, r0]
	adds r0, #0x70
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	adds r0, r4, r0
	adds r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
	b _0223C5F6
_0223C56E:
	movs r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C604 @ =0x00000B8A
	movs r1, #0
	strh r5, [r4, r0]
	ldr r0, _0223C608 @ =0x00001068
	str r1, [r4, #0x2c]
	adds r0, r4, r0
	bl FUN_0201D978
	movs r3, #0
	ldr r0, _0223C60C @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, _0223C610 @ =0x00000BA4
	ldr r0, _0223C608 @ =0x00001068
	ldr r1, [r4, r1]
	adds r0, r4, r0
	adds r2, r5, #0
	bl ov70_0223F1D8
	adds r0, r5, #0
	movs r1, #0x12
	bl FUN_0206FBE8
	ldr r1, _0223C600 @ =0x000011C4
	ldr r2, [r4, r1]
	str r0, [r2, #0x20]
	ldr r3, [r4, r1]
	adds r1, #0x70
	adds r0, r4, r1
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	adds r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
	ldr r1, _0223C600 @ =0x000011C4
	ldr r0, _0223C604 @ =0x00000B8A
	ldr r1, [r4, r1]
	adds r0, r4, r0
	ldr r1, [r1, #0x20]
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223C5F6
	ldr r0, _0223C614 @ =0x00001088
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C60C @ =0x00010200
	movs r2, #0xba
	str r0, [sp, #8]
	lsls r2, r2, #4
	ldr r1, [r4, r2]
	subs r2, #0x14
	ldr r0, _0223C614 @ =0x00001088
	ldrsb r2, [r4, r2]
	adds r0, r4, r0
	movs r3, #1
	bl ov70_0223F2BC
_0223C5F6:
	movs r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0223C5FC: .4byte 0x000011A8
_0223C600: .4byte 0x000011C4
_0223C604: .4byte 0x00000B8A
_0223C608: .4byte 0x00001068
_0223C60C: .4byte 0x00010200
_0223C610: .4byte 0x00000BA4
_0223C614: .4byte 0x00001088
	thumb_func_end ov70_0223C52C

	thumb_func_start ov70_0223C618
ov70_0223C618: @ 0x0223C618
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C63C @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #7
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C63C: .4byte 0x00000F0F
	thumb_func_end ov70_0223C618

	thumb_func_start ov70_0223C640
ov70_0223C640: @ 0x0223C640
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223C65C @ =0x000011A8
	movs r1, #1
	ldr r0, [r4, r0]
	bl ov70_022420C4
	movs r0, #9
	bl ov70_0223CD28
	movs r0, #8
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223C65C: .4byte 0x000011A8
	thumb_func_end ov70_0223C640

	thumb_func_start ov70_0223C660
ov70_0223C660: @ 0x0223C660
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0223C6DC @ =0x000011A8
	ldr r0, [r5, r0]
	bl ov70_02242144
	adds r4, r0, #0
	cmp r4, #2
	bhi _0223C682
	cmp r4, #0
	beq _0223C6A0
	cmp r4, #1
	beq _0223C6A0
	cmp r4, #2
	beq _0223C6A0
	b _0223C6D6
_0223C682:
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _0223C6D6
	movs r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C6E0 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0200E9BC
	movs r0, #0
	str r0, [r5, #0x2c]
	b _0223C6D6
_0223C6A0:
	movs r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C6E4 @ =0x00000B8C
	adds r1, r4, #1
	strb r1, [r5, r0]
	ldr r0, _0223C6E8 @ =0x00001088
	movs r1, #0
	adds r0, r5, r0
	str r1, [r5, #0x2c]
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C6EC @ =0x00010200
	movs r2, #0xba
	str r0, [sp, #8]
	lsls r2, r2, #4
	ldr r1, [r5, r2]
	subs r2, #0x14
	ldr r0, _0223C6E8 @ =0x00001088
	ldrsb r2, [r5, r2]
	adds r0, r5, r0
	movs r3, #1
	bl ov70_0223F2BC
_0223C6D6:
	movs r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0223C6DC: .4byte 0x000011A8
_0223C6E0: .4byte 0x00000F18
_0223C6E4: .4byte 0x00000B8C
_0223C6E8: .4byte 0x00001088
_0223C6EC: .4byte 0x00010200
	thumb_func_end ov70_0223C660

	thumb_func_start ov70_0223C6F0
ov70_0223C6F0: @ 0x0223C6F0
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C714 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0xb
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #0xa
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C714: .4byte 0x00000F0F
	thumb_func_end ov70_0223C6F0

	thumb_func_start ov70_0223C718
ov70_0223C718: @ 0x0223C718
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x46
	ldr r1, _0223C73C @ =0x0000FFFF
	lsls r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0223C740 @ =0x000011A8
	movs r1, #2
	ldr r0, [r4, r0]
	bl ov70_022420C4
	movs r0, #9
	bl ov70_0223CD28
	movs r0, #0xb
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223C73C: .4byte 0x0000FFFF
_0223C740: .4byte 0x000011A8
	thumb_func_end ov70_0223C718

	thumb_func_start ov70_0223C744
ov70_0223C744: @ 0x0223C744
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0223C7B4 @ =0x000011A8
	ldr r0, [r5, r0]
	bl ov70_02242144
	adds r4, r0, #0
	cmp r4, #0xb
	beq _0223C768
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0223C768
	adds r0, r0, #1
	cmp r4, r0
	beq _0223C7AE
	b _0223C774
_0223C768:
	movs r0, #0
	bl ov70_0223CD28
	movs r0, #0
	str r0, [r5, #0x2c]
	b _0223C7AE
_0223C774:
	movs r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C7B8 @ =0x00000B8A
	adds r1, r4, #0
	adds r0, r5, r0
	movs r2, #1
	bl ov70_0223F828
	ldr r0, _0223C7BC @ =0x000010A8
	movs r1, #0
	adds r0, r5, r0
	str r1, [r5, #0x2c]
	bl FUN_0201D978
	movs r3, #0
	movs r1, #0xba
	ldr r0, _0223C7C0 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _0223C7BC @ =0x000010A8
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, r0
	adds r2, r4, #0
	bl ov70_0223F370
_0223C7AE:
	movs r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0223C7B4: .4byte 0x000011A8
_0223C7B8: .4byte 0x00000B8A
_0223C7BC: .4byte 0x000010A8
_0223C7C0: .4byte 0x00010200
	thumb_func_end ov70_0223C744

	thumb_func_start ov70_0223C7C4
ov70_0223C7C4: @ 0x0223C7C4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C7E8 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0xb0
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #0xd
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C7E8: .4byte 0x00000F0F
	thumb_func_end ov70_0223C7C4

	thumb_func_start ov70_0223C7EC
ov70_0223C7EC: @ 0x0223C7EC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x46
	ldr r1, _0223C810 @ =0x0000FFFF
	lsls r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0223C814 @ =0x000011A8
	movs r1, #3
	ldr r0, [r4, r0]
	bl ov70_022420C4
	movs r0, #9
	bl ov70_0223CD28
	movs r0, #0xe
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223C810: .4byte 0x0000FFFF
_0223C814: .4byte 0x000011A8
	thumb_func_end ov70_0223C7EC

	thumb_func_start ov70_0223C818
ov70_0223C818: @ 0x0223C818
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0223C898 @ =0x000011A8
	ldr r0, [r5, r0]
	bl ov70_02242144
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _0223C890
	subs r0, r0, #1
	cmp r4, r0
	beq _0223C840
	ldr r0, _0223C89C @ =0x0224590C
	ldr r0, [r0]
	adds r0, r0, #1
	cmp r4, r0
	bne _0223C856
_0223C840:
	movs r0, #0
	bl ov70_0223CD28
	ldr r0, _0223C8A0 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0200E9BC
	movs r0, #0
	str r0, [r5, #0x2c]
	b _0223C890
_0223C856:
	movs r0, #0
	bl ov70_0223CD28
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_0223F8A8
	ldr r0, _0223C8A4 @ =0x00001188
	movs r1, #0
	adds r0, r5, r0
	str r1, [r5, #0x2c]
	bl FUN_0201D978
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C8A8 @ =0x00010200
	movs r2, #0xbb
	str r0, [sp, #8]
	lsls r2, r2, #4
	ldr r3, _0223C8AC @ =0x000012CC
	ldr r0, _0223C8A4 @ =0x00001188
	ldr r1, [r5, r2]
	subs r2, #0x10
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	adds r0, r5, r0
	bl ov70_0223F244
_0223C890:
	movs r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223C898: .4byte 0x000011A8
_0223C89C: .4byte 0x0224590C
_0223C8A0: .4byte 0x00000F18
_0223C8A4: .4byte 0x00001188
_0223C8A8: .4byte 0x00010200
_0223C8AC: .4byte 0x000012CC
	thumb_func_end ov70_0223C818

	thumb_func_start ov70_0223C8B0
ov70_0223C8B0: @ 0x0223C8B0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r2, #0x12
	ldr r0, [r4, #4]
	movs r1, #0xc
	lsls r2, r2, #4
	movs r3, #3
	bl ov70_02238C14
	ldr r1, _0223C8D8 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #0x18
	str r0, [r4, #0x2c]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C8D8: .4byte 0x000011C8
	thumb_func_end ov70_0223C8B0

	thumb_func_start ov70_0223C8DC
ov70_0223C8DC: @ 0x0223C8DC
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223C90E
	ldr r0, _0223C924 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #2
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	adds r0, r4, #0
	bl ov70_02241234
	movs r0, #0x4a
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _0223C91E
_0223C90E:
	cmp r0, #2
	bne _0223C91E
	ldr r0, _0223C924 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #0
	str r0, [r4, #0x2c]
_0223C91E:
	movs r0, #3
	pop {r4, pc}
	nop
_0223C924: .4byte 0x000011C8
	thumb_func_end ov70_0223C8DC

	thumb_func_start ov70_0223C928
ov70_0223C928: @ 0x0223C928
	movs r1, #1
	str r1, [r0, #0x2c]
	movs r0, #3
	bx lr
	thumb_func_end ov70_0223C928

	thumb_func_start ov70_0223C930
ov70_0223C930: @ 0x0223C930
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223C954 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0x98
	movs r2, #1
	movs r3, #0
	bl ov70_0223CAC4
	adds r0, r4, #0
	movs r1, #0x15
	movs r2, #1
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223C954: .4byte 0x00000F0F
	thumb_func_end ov70_0223C930

	thumb_func_start ov70_0223C958
ov70_0223C958: @ 0x0223C958
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223C972
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223C972:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223C958

	thumb_func_start ov70_0223C978
ov70_0223C978: @ 0x0223C978
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223C9A6
	movs r0, #0x47
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x2d
	ble _0223C9A6
	movs r1, #0
	str r1, [r4, r0]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223C9A6:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223C978

	thumb_func_start ov70_0223C9AC
ov70_0223C9AC: @ 0x0223C9AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223CA0C @ =0x00000F14
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223CA06
	ldr r2, _0223CA10 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r1, #0xf
	ldr r0, _0223CA0C @ =0x00000F14
	mvns r1, r1
	str r1, [r4, r0]
	ldr r1, _0223CA14 @ =0x000011DE
	ldrh r1, [r4, r1]
	cmp r1, #0
	beq _0223C9FA
	subs r0, #0x2c
	ldr r0, [r4, r0]
	movs r1, #0x10
	bl FUN_020248F0
	movs r0, #2
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x10
	bl ov70_02238E50
	movs r0, #0x4b
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
_0223C9FA:
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
_0223CA06:
	movs r0, #3
	pop {r4, pc}
	nop
_0223CA0C: .4byte 0x00000F14
_0223CA10: .4byte 0x04000304
_0223CA14: .4byte 0x000011DE
	thumb_func_end ov70_0223C9AC

	thumb_func_start ov70_0223CA18
ov70_0223CA18: @ 0x0223CA18
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223CA3C @ =0x00000F14
	ldr r1, [r4, r0]
	subs r1, r1, #1
	str r1, [r4, r0]
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223CA36
	ldr r0, _0223CA3C @ =0x00000F14
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	str r0, [r4, #0x2c]
_0223CA36:
	movs r0, #3
	pop {r4, pc}
	nop
_0223CA3C: .4byte 0x00000F14
	thumb_func_end ov70_0223CA18

	thumb_func_start ov70_0223CA40
ov70_0223CA40: @ 0x0223CA40
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0223CAB4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r1, r0
	beq _0223CA68
	movs r1, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _0223CAAC
_0223CA68:
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl ov70_02241164
	adds r4, r0, #0
	ldr r0, _0223CAB8 @ =0x000011DE
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0223CAAC
	cmp r4, #0
	blt _0223CAAC
	adds r0, r4, #1
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, _0223CABC @ =0x00000EE4
	ldr r0, [r1, r0]
	lsls r1, r4, #2
	adds r1, #0x10
	bl FUN_020248F0
	movs r0, #2
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0
	bl ov70_02238E50
	movs r0, #0x4b
	lsls r0, r0, #2
	str r4, [r5, r0]
	ldr r0, _0223CAC0 @ =0x000005DC
	bl FUN_0200604C
_0223CAAC:
	movs r0, #3
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223CAB4: .4byte 0x021D110C
_0223CAB8: .4byte 0x000011DE
_0223CABC: .4byte 0x00000EE4
_0223CAC0: .4byte 0x000005DC
	thumb_func_end ov70_0223CA40

	thumb_func_start ov70_0223CAC4
ov70_0223CAC4: @ 0x0223CAC4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r2, #0
	movs r2, #0xba
	adds r5, r0, #0
	lsls r2, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x1c
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	ldr r0, _0223CB14 @ =0x00000F18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _0223CB14 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223CB14 @ =0x00000F18
	ldr r2, _0223CB18 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223CB14: .4byte 0x00000F18
_0223CB18: .4byte 0x00000BBC
	thumb_func_end ov70_0223CAC4

	thumb_func_start ov70_0223CB1C
ov70_0223CB1C: @ 0x0223CB1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r2, #0
	adds r5, r0, #0
	adds r7, r1, #0
	adds r0, r4, #0
	movs r1, #0x3d
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r2, #0
	ldr r0, _0223CC00 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0x3f
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r2, #0
	ldr r0, _0223CC00 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x20
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0x41
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r2, #0
	ldr r0, _0223CC00 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x40
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0xab
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r2, #0
	ldr r0, _0223CC00 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0x43
	bl FUN_0200BBA0
	adds r6, r0, #0
	movs r2, #0
	ldr r0, _0223CC00 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x60
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov70_022450B8
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	movs r1, #0xee
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _0223CC00 @ =0x000F0200
	str r2, [sp]
	adds r5, #0x70
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov70_022450B8
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223CC00: .4byte 0x000F0200
	thumb_func_end ov70_0223CB1C

	thumb_func_start ov70_0223CC04
ov70_0223CC04: @ 0x0223CC04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	ldr r4, _0223CC60 @ =0x00010200
	cmp r3, #0
	beq _0223CC1A
	ldr r4, _0223CC64 @ =0x000F0200
	movs r1, #0
	b _0223CC1C
_0223CC1A:
	movs r1, #2
_0223CC1C:
	movs r0, #0xe
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0x12
	movs r3, #2
	bl FUN_0201CA4C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201BF7C
	adds r0, r6, #0
	movs r1, #0x45
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r2, #0
	str r2, [sp]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r3, r2, #0
	str r4, [sp, #4]
	bl ov70_022450B8
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223CC60: .4byte 0x00010200
_0223CC64: .4byte 0x000F0200
	thumb_func_end ov70_0223CC04

	thumb_func_start ov70_0223CC68
ov70_0223CC68: @ 0x0223CC68
	push {r4, r5}
	movs r4, #0
	ldrsh r5, [r0, r4]
	ldrsh r4, [r1, r4]
	cmp r5, r4
	bne _0223CC9C
	movs r4, #2
	ldrsb r5, [r0, r4]
	ldrsb r4, [r1, r4]
	cmp r5, r4
	bne _0223CC9C
	movs r4, #3
	ldrsb r5, [r0, r4]
	ldrsb r4, [r1, r4]
	cmp r5, r4
	bne _0223CC9C
	movs r4, #4
	ldrsb r5, [r0, r4]
	ldrsb r0, [r1, r4]
	cmp r5, r0
	bne _0223CC9C
	cmp r2, r3
	bne _0223CC9C
	movs r0, #1
	pop {r4, r5}
	bx lr
_0223CC9C:
	movs r0, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov70_0223CC68

	thumb_func_start ov70_0223CCA4
ov70_0223CCA4: @ 0x0223CCA4
	push {r4, lr}
	ldr r3, _0223CD24 @ =0x00000F14
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #0
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _0223CD24 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #1
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _0223CD24 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	ldr r3, _0223CD24 @ =0x00000F14
	movs r1, #3
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	adds r2, r1, #0
	bl FUN_0201BC8C
	ldr r3, _0223CD24 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #4
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	ldr r3, _0223CD24 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #5
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	ldr r3, _0223CD24 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #6
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	ldr r3, _0223CD24 @ =0x00000F14
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	movs r1, #7
	movs r2, #3
	rsbs r3, r3, #0
	bl FUN_0201BC8C
	pop {r4, pc}
	nop
_0223CD24: .4byte 0x00000F14
	thumb_func_end ov70_0223CCA4

	thumb_func_start ov70_0223CD28
ov70_0223CD28: @ 0x0223CD28
	push {r3, lr}
	adds r2, r0, #0
	ldr r0, _0223CD40 @ =0x04000050
	beq _0223CD38
	movs r1, #0xa
	blx FUN_020CF178
	pop {r3, pc}
_0223CD38:
	movs r1, #0
	strh r1, [r0]
	pop {r3, pc}
	nop
_0223CD40: .4byte 0x04000050
	thumb_func_end ov70_0223CD28

	thumb_func_start ov70_0223CD44
ov70_0223CD44: @ 0x0223CD44
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov70_0223D3BC
	ldr r2, _0223CDCC @ =0x04000304
	ldr r0, _0223CDD0 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldr r0, [r4, #4]
	bl ov70_0223CE44
	adds r0, r4, #0
	bl ov70_0223CF74
	adds r0, r4, #0
	bl ov70_0223D26C
	adds r0, r4, #0
	bl ov70_0223D058
	adds r0, r4, #0
	bl ov70_02241358
	ldr r0, _0223CDD4 @ =0x0400106C
	blx FUN_020CDAA8
	cmp r0, #0
	bne _0223CD98
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	b _0223CDAE
_0223CD98:
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
_0223CDAE:
	movs r1, #0x12
	lsls r1, r1, #4
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl ov70_0223E264
	adds r0, r4, #0
	bl ov70_02245124
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223CDCC: .4byte 0x04000304
_0223CDD0: .4byte 0xFFFF7FFF
_0223CDD4: .4byte 0x0400106C
	thumb_func_end ov70_0223CD44

	thumb_func_start ov70_0223CDD8
ov70_0223CDD8: @ 0x0223CDD8
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238E44
	bl FUN_0203A930
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _0223CDF4 @ =0x022465A8
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0223CDF4: .4byte 0x022465A8
	thumb_func_end ov70_0223CDD8

	thumb_func_start ov70_0223CDF8
ov70_0223CDF8: @ 0x0223CDF8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203A914
	ldr r0, _0223CE40 @ =0x0400106C
	blx FUN_020CDAA8
	cmp r0, #0
	beq _0223CE10
	adds r0, r4, #0
	bl ov70_02241380
_0223CE10:
	adds r0, r4, #0
	bl ov70_0223D208
	adds r0, r4, #0
	bl ov70_0223D414
	adds r0, r4, #0
	bl ov70_0223D378
	ldr r0, [r4, #4]
	bl ov70_0223CF48
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	nop
_0223CE40: .4byte 0x0400106C
	thumb_func_end ov70_0223CDF8

	thumb_func_start ov70_0223CE44
ov70_0223CE44: @ 0x0223CE44
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0223CF34 @ =0x022456F0
	add r3, sp, #0x70
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	movs r0, #0x16
	movs r1, #1
	bl FUN_02022CC8
	ldr r5, _0223CF38 @ =0x02245768
	add r3, sp, #0x54
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0223CF3C @ =0x02245730
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
	ldr r5, _0223CF40 @ =0x0224574C
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
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0223CF44 @ =0x02245714
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
	adds r0, r4, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_022391F0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223CF34: .4byte 0x022456F0
_0223CF38: .4byte 0x02245768
_0223CF3C: .4byte 0x02245730
_0223CF40: .4byte 0x0224574C
_0223CF44: .4byte 0x02245714
	thumb_func_end ov70_0223CE44

	thumb_func_start ov70_0223CF48
ov70_0223CF48: @ 0x0223CF48
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022392BC
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
	movs r1, #3
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223CF48

	thumb_func_start ov70_0223CF74
ov70_0223CF74: @ 0x0223CF74
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r5, [r6, #4]
	movs r0, #0x64
	movs r1, #0x3d
	bl FUN_02007688
	movs r1, #0x60
	str r1, [sp]
	movs r1, #0x3d
	movs r2, #0
	str r1, [sp, #4]
	movs r1, #2
	adds r3, r2, #0
	adds r4, r0, #0
	bl FUN_02007B8C
	movs r0, #1
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xd
	adds r2, r5, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x1b
	adds r2, r5, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0x26
	adds r2, r5, #0
	movs r3, #2
	bl FUN_02007B68
	adds r0, r6, #0
	bl ov70_02239C6C
	adds r0, r6, #0
	bl ov70_02239CF8
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_0223CF74

	thumb_func_start ov70_0223D058
ov70_0223D058: @ 0x0223D058
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	movs r2, #0xd6
	adds r7, r0, #0
	lsls r2, r2, #4
	add r0, sp, #0
	adds r1, r7, #0
	adds r2, r7, r2
	movs r3, #1
	bl ov70_02238B54
	ldr r0, _0223D1E8 @ =0x00000122
	ldrh r1, [r7, r0]
	lsls r2, r1, #2
	ldr r1, _0223D1EC @ =0x02245784
	ldrh r1, [r1, r2]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	ldrh r0, [r7, r0]
	lsls r1, r0, #2
	ldr r0, _0223D1F0 @ =0x02245786
	ldrh r0, [r0, r1]
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223D1F4 @ =0x00000DCC
	str r0, [r7, r1]
	ldr r0, [r7, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _0223D1F4 @ =0x00000DCC
	movs r1, #4
	ldr r0, [r7, r0]
	bl FUN_020248F0
	ldr r0, _0223D1E8 @ =0x00000122
	ldrh r0, [r7, r0]
	cmp r0, #0x1f
	beq _0223D0B0
	cmp r0, #5
	bhi _0223D0BC
_0223D0B0:
	ldr r0, _0223D1F4 @ =0x00000DCC
	movs r1, #0
	ldr r0, [r7, r0]
	bl FUN_02024A04
	b _0223D0C6
_0223D0BC:
	ldr r0, _0223D1F4 @ =0x00000DCC
	movs r1, #1
	ldr r0, [r7, r0]
	bl FUN_02024A04
_0223D0C6:
	ldr r4, _0223D1EC @ =0x02245784
	movs r6, #0
	adds r5, r7, #0
_0223D0CC:
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #0x14
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223D1F8 @ =0x00000DD8
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	adds r1, r6, #6
	bl FUN_020248F0
	ldr r0, _0223D1F8 @ =0x00000DD8
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024A04
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #0x1e
	blt _0223D0CC
	ldr r4, _0223D1EC @ =0x02245784
	movs r6, #0
	adds r5, r7, #0
_0223D10A:
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	adds r0, r0, #6
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl FUN_02024624
	movs r1, #0xe5
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0x28
	bl FUN_020248F0
	movs r0, #0xe5
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024A04
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #0x1e
	blt _0223D10A
	ldr r4, _0223D1EC @ =0x02245784
	movs r6, #0
	adds r5, r7, #0
_0223D14E:
	ldrh r0, [r4]
	adds r0, #8
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	adds r0, r0, #6
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223D1FC @ =0x00000EC8
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #0x2a
	bl FUN_020248F0
	ldr r0, _0223D1FC @ =0x00000EC8
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024A04
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #6
	blt _0223D14E
	ldr r4, _0223D200 @ =0x022456E8
	movs r6, #0
	adds r5, r7, #0
_0223D190:
	ldrh r0, [r4]
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldrh r0, [r4, #2]
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223D204 @ =0x00000F04
	str r0, [r5, r1]
	adds r0, r1, #0
	adds r1, r6, #0
	ldr r0, [r5, r0]
	adds r1, #0x26
	bl FUN_020248F0
	ldr r0, _0223D204 @ =0x00000F04
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024A04
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, #2
	blt _0223D190
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xf1
	lsls r0, r0, #4
	movs r2, #0x6a
	ldr r0, [r7, r0]
	movs r1, #0x37
	lsls r2, r2, #2
	bl ov70_02238F9C
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D1E8: .4byte 0x00000122
_0223D1EC: .4byte 0x02245784
_0223D1F0: .4byte 0x02245786
_0223D1F4: .4byte 0x00000DCC
_0223D1F8: .4byte 0x00000DD8
_0223D1FC: .4byte 0x00000EC8
_0223D200: .4byte 0x022456E8
_0223D204: .4byte 0x00000F04
	thumb_func_end ov70_0223D058

	thumb_func_start ov70_0223D208
ov70_0223D208: @ 0x0223D208
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _0223D25C @ =0x00000F04
	movs r6, #0
	adds r4, r5, #0
_0223D212:
	ldr r0, [r4, r7]
	bl FUN_02024758
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #2
	blt _0223D212
	ldr r0, _0223D260 @ =0x00000DCC
	ldr r0, [r5, r0]
	bl FUN_02024758
	movs r7, #0xe5
	movs r6, #0
	adds r4, r5, #0
	lsls r7, r7, #4
_0223D230:
	ldr r0, _0223D264 @ =0x00000DD8
	ldr r0, [r4, r0]
	bl FUN_02024758
	ldr r0, [r4, r7]
	bl FUN_02024758
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0x1e
	blt _0223D230
	ldr r6, _0223D268 @ =0x00000EC8
	movs r4, #0
_0223D24A:
	ldr r0, [r5, r6]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blt _0223D24A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D25C: .4byte 0x00000F04
_0223D260: .4byte 0x00000DCC
_0223D264: .4byte 0x00000DD8
_0223D268: .4byte 0x00000EC8
	thumb_func_end ov70_0223D208

	thumb_func_start ov70_0223D26C
ov70_0223D26C: @ 0x0223D26C
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd
	ldr r1, _0223D358 @ =0x00000F48
	str r0, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r3, #4
	bl FUN_0201D40C
	ldr r0, _0223D358 @ =0x00000F48
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	ldr r0, _0223D358 @ =0x00000F48
	adds r0, r4, r0
	bl FUN_0201D578
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	ldr r1, _0223D35C @ =0x00000F18
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	adds r0, #0xfc
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	bl FUN_0201D40C
	ldr r0, _0223D35C @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0223D360 @ =0x0000013F
	ldr r1, _0223D364 @ =0x00001158
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, _0223D364 @ =0x00001158
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #0x10
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _0223D368 @ =0x00000165
	ldr r1, _0223D36C @ =0x00000F68
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #1
	movs r3, #0x18
	bl FUN_0201D40C
	ldr r0, _0223D36C @ =0x00000F68
	movs r1, #6
	adds r0, r4, r0
	bl FUN_0201D978
	movs r3, #1
	ldr r0, _0223D370 @ =0x00010306
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, _0223D374 @ =0x00000BB8
	ldr r0, _0223D36C @ =0x00000F68
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0
	bl ov70_02245084
	ldr r0, [r4, #0x24]
	cmp r0, #5
	bne _0223D34C
	adds r0, r4, #0
	movs r1, #3
	bl ov70_02239D44
	add sp, #0x14
	pop {r3, r4, pc}
_0223D34C:
	adds r0, r4, #0
	movs r1, #1
	bl ov70_02239D44
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0223D358: .4byte 0x00000F48
_0223D35C: .4byte 0x00000F18
_0223D360: .4byte 0x0000013F
_0223D364: .4byte 0x00001158
_0223D368: .4byte 0x00000165
_0223D36C: .4byte 0x00000F68
_0223D370: .4byte 0x00010306
_0223D374: .4byte 0x00000BB8
	thumb_func_end ov70_0223D26C

	thumb_func_start ov70_0223D378
ov70_0223D378: @ 0x0223D378
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223D3A8 @ =0x00001198
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _0223D3AC @ =0x00001158
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _0223D3B0 @ =0x00000F68
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _0223D3B4 @ =0x00000F18
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _0223D3B8 @ =0x00000F48
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	nop
_0223D3A8: .4byte 0x00001198
_0223D3AC: .4byte 0x00001158
_0223D3B0: .4byte 0x00000F68
_0223D3B4: .4byte 0x00000F18
_0223D3B8: .4byte 0x00000F48
	thumb_func_end ov70_0223D378

	thumb_func_start ov70_0223D3BC
ov70_0223D3BC: @ 0x0223D3BC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x12
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _0223D400 @ =0x00000BB4
	str r0, [r4, r1]
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _0223D404 @ =0x00000BBC
	str r0, [r4, r1]
	subs r1, #0x1c
	ldr r0, [r4, r1]
	movs r1, #0x6d
	bl FUN_0200BBA0
	ldr r1, _0223D408 @ =0x00000BB8
	str r0, [r4, r1]
	ldr r0, _0223D40C @ =0x00000122
	ldrh r1, [r4, r0]
	cmp r1, #0x1e
	bne _0223D3F2
	movs r1, #0
	strh r1, [r4, r0]
_0223D3F2:
	movs r0, #0x3d
	movs r1, #0x78
	bl FUN_0201AA8C
	ldr r1, _0223D410 @ =0x000011F4
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_0223D400: .4byte 0x00000BB4
_0223D404: .4byte 0x00000BBC
_0223D408: .4byte 0x00000BB8
_0223D40C: .4byte 0x00000122
_0223D410: .4byte 0x000011F4
	thumb_func_end ov70_0223D3BC

	thumb_func_start ov70_0223D414
ov70_0223D414: @ 0x0223D414
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223D43C @ =0x000011F4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _0223D440 @ =0x00000BB4
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _0223D444 @ =0x00000BBC
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _0223D448 @ =0x00000BB8
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	nop
_0223D43C: .4byte 0x000011F4
_0223D440: .4byte 0x00000BB4
_0223D444: .4byte 0x00000BBC
_0223D448: .4byte 0x00000BB8
	thumb_func_end ov70_0223D414

	thumb_func_start ov70_0223D44C
ov70_0223D44C: @ 0x0223D44C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223D486
	ldr r0, [r5, #0x24]
	cmp r0, #5
	bne _0223D464
	movs r4, #0x15
	b _0223D46A
_0223D464:
	cmp r0, #6
	bne _0223D46A
	movs r4, #0x11
_0223D46A:
	ldr r0, _0223D48C @ =0x00000F0F
	movs r3, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	str r3, [sp, #4]
	bl ov70_0223E01C
	adds r0, r5, #0
	movs r1, #3
	movs r2, #1
	bl ov70_02238D84
_0223D486:
	movs r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223D48C: .4byte 0x00000F0F
	thumb_func_end ov70_0223D44C

	thumb_func_start ov70_0223D490
ov70_0223D490: @ 0x0223D490
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223D578 @ =0x00000122
	adds r4, r0, #0
	ldrh r1, [r4, r1]
	cmp r1, #0x1e
	bne _0223D4B4
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223D57C @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	pop {r4, pc}
_0223D4B4:
	cmp r1, #0x1f
	beq _0223D572
	ldr r0, _0223D57C @ =0x000005DC
	bl FUN_0200604C
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E5C8
	cmp r0, #1
	beq _0223D4DE
	cmp r0, #2
	beq _0223D556
	add sp, #8
	pop {r4, pc}
_0223D4DE:
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E4DC
	cmp r0, #0
	beq _0223D536
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	adds r2, r0, #0
	ldr r0, _0223D580 @ =0x00000B9C
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200BF8C
	ldr r0, _0223D584 @ =0x00000F0F
	movs r3, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x16
	movs r2, #1
	str r3, [sp, #4]
	bl ov70_0223E01C
	adds r0, r4, #0
	movs r1, #3
	movs r2, #7
	bl ov70_02238D84
	add sp, #8
	pop {r4, pc}
_0223D536:
	ldr r0, _0223D584 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x1a
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	add sp, #8
	pop {r4, pc}
_0223D556:
	ldr r0, _0223D584 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x1b
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
_0223D572:
	add sp, #8
	pop {r4, pc}
	nop
_0223D578: .4byte 0x00000122
_0223D57C: .4byte 0x000005DC
_0223D580: .4byte 0x00000B9C
_0223D584: .4byte 0x00000F0F
	thumb_func_end ov70_0223D490

	thumb_func_start ov70_0223D588
ov70_0223D588: @ 0x0223D588
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r2, _0223D670 @ =0x00000122
	adds r5, r0, #0
	ldrh r3, [r5, r2]
	cmp r3, #0x1e
	bne _0223D5A0
	movs r1, #6
	bl ov70_0223D690
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D5A0:
	cmp r3, #0x1f
	beq _0223D66C
	ldr r1, [r5]
	subs r2, r2, #2
	ldr r0, [r1, #8]
	ldrh r2, [r5, r2]
	ldr r1, [r1, #0xc]
	bl ov70_0223E5C8
	cmp r0, #0
	beq _0223D666
	cmp r0, #1
	beq _0223D5C2
	cmp r0, #2
	beq _0223D666
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D5C2:
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	movs r1, #0x35
	lsls r1, r1, #4
	adds r3, r5, r1
	movs r1, #0x4b
	lsls r1, r1, #2
	ldr r2, [r5, r1]
	subs r1, #8
	muls r1, r2, r1
	adds r1, r3, r1
	adds r4, r0, #0
	bl ov70_0223E658
	cmp r0, #0
	beq _0223D65C
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E4DC
	cmp r0, #0
	beq _0223D63C
	ldr r0, _0223D674 @ =0x00000B9C
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl FUN_0200BF8C
	ldr r0, _0223D678 @ =0x00000F0F
	movs r3, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #1
	str r3, [sp, #4]
	bl ov70_0223E01C
	adds r0, r5, #0
	movs r1, #3
	movs r2, #9
	bl ov70_02238D84
	ldr r0, _0223D67C @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D63C:
	ldr r0, _0223D678 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x1a
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D65C:
	ldr r0, _0223D67C @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	pop {r3, r4, r5, pc}
_0223D666:
	ldr r0, _0223D67C @ =0x000005DC
	bl FUN_0200604C
_0223D66C:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223D670: .4byte 0x00000122
_0223D674: .4byte 0x00000B9C
_0223D678: .4byte 0x00000F0F
_0223D67C: .4byte 0x000005DC
	thumb_func_end ov70_0223D588

	thumb_func_start ov70_0223D680
ov70_0223D680: @ 0x0223D680
	ldr r3, _0223D688 @ =FUN_02025224
	ldr r0, _0223D68C @ =0x02245884
	bx r3
	nop
_0223D688: .4byte FUN_02025224
_0223D68C: .4byte 0x02245884
	thumb_func_end ov70_0223D680

	thumb_func_start ov70_0223D690
ov70_0223D690: @ 0x0223D690
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #5
	bne _0223D6AC
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223D6C4 @ =0x000005DC
	bl FUN_0200604C
	pop {r4, pc}
_0223D6AC:
	cmp r1, #6
	bne _0223D6C2
	movs r1, #3
	movs r2, #0x11
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223D6C4 @ =0x000005DC
	bl FUN_0200604C
_0223D6C2:
	pop {r4, pc}
	.align 2, 0
_0223D6C4: .4byte 0x000005DC
	thumb_func_end ov70_0223D690

	thumb_func_start ov70_0223D6C8
ov70_0223D6C8: @ 0x0223D6C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_0223D680
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _0223D79A
	cmp r4, #0x1e
	beq _0223D75A
	cmp r4, #0x1f
	beq _0223D6E8
	cmp r4, #0x20
	beq _0223D720
	b _0223D772
_0223D6E8:
	ldr r0, _0223D7F0 @ =0x00000F04
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_0202484C
	ldr r0, _0223D7F0 @ =0x00000F04
	movs r1, #0x26
	ldr r0, [r5, r0]
	bl FUN_020248F0
	movs r0, #0x12
	lsls r0, r0, #4
	ldrh r0, [r5, r0]
	movs r1, #0x13
	movs r2, #1
	bl ov70_0223D924
	movs r1, #0x12
	lsls r1, r1, #4
	strh r0, [r5, r1]
	ldrh r1, [r5, r1]
	adds r0, r5, #0
	bl ov70_0223E264
	ldr r0, _0223D7F4 @ =0x000005DC
	bl FUN_0200604C
	b _0223D7EC
_0223D720:
	ldr r0, _0223D7F8 @ =0x00000F08
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_0202484C
	ldr r0, _0223D7F8 @ =0x00000F08
	movs r1, #0x27
	ldr r0, [r5, r0]
	bl FUN_020248F0
	movs r0, #0x12
	lsls r0, r0, #4
	movs r1, #0x13
	adds r2, r1, #0
	ldrh r0, [r5, r0]
	subs r2, #0x14
	bl ov70_0223D924
	movs r1, #0x12
	lsls r1, r1, #4
	strh r0, [r5, r1]
	ldrh r1, [r5, r1]
	adds r0, r5, #0
	bl ov70_0223E264
	ldr r0, _0223D7F4 @ =0x000005DC
	bl FUN_0200604C
	b _0223D7EC
_0223D75A:
	ldr r1, [r5, #0x24]
	adds r0, r5, #0
	bl ov70_0223D690
	ldr r1, _0223D7FC @ =0x00000122
	ldr r0, _0223D800 @ =0x00000DCC
	strh r4, [r5, r1]
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ov70_0223D8E8
	b _0223D7EC
_0223D772:
	ldr r1, _0223D7FC @ =0x00000122
	ldr r0, _0223D800 @ =0x00000DCC
	strh r4, [r5, r1]
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ov70_0223D8E8
	ldr r0, [r5, #0x24]
	cmp r0, #5
	bne _0223D78E
	adds r0, r5, #0
	bl ov70_0223D490
	b _0223D7EC
_0223D78E:
	cmp r0, #6
	bne _0223D7EC
	adds r0, r5, #0
	bl ov70_0223D588
	b _0223D7EC
_0223D79A:
	adds r0, r5, #0
	bl ov70_0223D808
	ldr r0, [r5, #0x24]
	cmp r0, #5
	bne _0223D7C8
	ldr r0, _0223D804 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0223D7BA
	adds r0, r5, #0
	movs r1, #5
	bl ov70_0223D690
	b _0223D7EC
_0223D7BA:
	movs r0, #1
	tst r0, r1
	beq _0223D7EC
	adds r0, r5, #0
	bl ov70_0223D490
	b _0223D7EC
_0223D7C8:
	cmp r0, #6
	bne _0223D7EC
	ldr r0, _0223D804 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _0223D7E0
	adds r0, r5, #0
	movs r1, #6
	bl ov70_0223D690
	b _0223D7EC
_0223D7E0:
	movs r0, #1
	tst r0, r1
	beq _0223D7EC
	adds r0, r5, #0
	bl ov70_0223D588
_0223D7EC:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223D7F0: .4byte 0x00000F04
_0223D7F4: .4byte 0x000005DC
_0223D7F8: .4byte 0x00000F08
_0223D7FC: .4byte 0x00000122
_0223D800: .4byte 0x00000DCC
_0223D804: .4byte 0x021D110C
	thumb_func_end ov70_0223D6C8

	thumb_func_start ov70_0223D808
ov70_0223D808: @ 0x0223D808
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0223D8D0 @ =0x021D110C
	movs r7, #0
	ldr r0, [r0, #0x48]
	movs r1, #0x40
	adds r4, r7, #0
	tst r1, r0
	beq _0223D820
	movs r4, #1
	b _0223D83C
_0223D820:
	movs r1, #0x80
	tst r1, r0
	beq _0223D82A
	movs r4, #2
	b _0223D83C
_0223D82A:
	movs r1, #0x20
	tst r1, r0
	beq _0223D834
	movs r4, #3
	b _0223D83C
_0223D834:
	movs r1, #0x10
	tst r0, r1
	beq _0223D83C
	movs r4, #4
_0223D83C:
	cmp r4, #0
	beq _0223D8B4
	ldr r0, _0223D8D4 @ =0x00000122
	ldr r1, _0223D8D8 @ =0x02245804
	ldrh r3, [r5, r0]
	subs r4, r4, #1
	lsls r2, r3, #2
	adds r1, r1, r2
	ldrb r4, [r4, r1]
	cmp r4, r3
	beq _0223D8B4
	cmp r4, #0x63
	beq _0223D85A
	cmp r4, #0x65
	bne _0223D8B0
_0223D85A:
	cmp r4, #0x65
	beq _0223D862
	movs r0, #1
	b _0223D864
_0223D862:
	movs r0, #0
_0223D864:
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0223D8DC @ =0x00000F04
	adds r0, r5, r0
	str r0, [sp]
	lsls r0, r6, #2
	ldr r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0202484C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	adds r6, #0x26
	ldr r0, [r1, r0]
	adds r1, r6, #0
	bl FUN_020248F0
	movs r0, #0x12
	lsls r0, r0, #4
	subs r4, #0x64
	ldrh r0, [r5, r0]
	movs r1, #0x13
	adds r2, r4, #0
	bl ov70_0223D924
	movs r1, #0x12
	lsls r1, r1, #4
	strh r0, [r5, r1]
	ldrh r1, [r5, r1]
	adds r0, r5, #0
	bl ov70_0223E264
	ldr r0, _0223D8E0 @ =0x000005DC
	bl FUN_0200604C
	b _0223D8B4
_0223D8B0:
	movs r7, #1
	strh r4, [r5, r0]
_0223D8B4:
	cmp r7, #0
	beq _0223D8BE
	ldr r0, _0223D8E0 @ =0x000005DC
	bl FUN_0200604C
_0223D8BE:
	ldr r1, _0223D8D4 @ =0x00000122
	ldr r0, _0223D8E4 @ =0x00000DCC
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ov70_0223D8E8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223D8D0: .4byte 0x021D110C
_0223D8D4: .4byte 0x00000122
_0223D8D8: .4byte 0x02245804
_0223D8DC: .4byte 0x00000F04
_0223D8E0: .4byte 0x000005DC
_0223D8E4: .4byte 0x00000DCC
	thumb_func_end ov70_0223D808

	thumb_func_start ov70_0223D8E8
ov70_0223D8E8: @ 0x0223D8E8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _0223D91C @ =0x02245784
	lsls r3, r4, #2
	ldr r2, _0223D920 @ =0x02245786
	ldrh r1, [r1, r3]
	ldrh r2, [r2, r3]
	adds r5, r0, #0
	bl ov70_02238D8C
	cmp r4, #0x1f
	beq _0223D908
	cmp r4, #0
	blt _0223D912
	cmp r4, #5
	bgt _0223D912
_0223D908:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_02024A04
	pop {r3, r4, r5, pc}
_0223D912:
	adds r0, r5, #0
	movs r1, #1
	bl FUN_02024A04
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223D91C: .4byte 0x02245784
_0223D920: .4byte 0x02245786
	thumb_func_end ov70_0223D8E8

	thumb_func_start ov70_0223D924
ov70_0223D924: @ 0x0223D924
	adds r0, r0, r2
	bpl _0223D92C
	subs r0, r1, #1
	bx lr
_0223D92C:
	cmp r0, r1
	bne _0223D932
	movs r0, #0
_0223D932:
	bx lr
	thumb_func_end ov70_0223D924

	thumb_func_start ov70_0223D934
ov70_0223D934: @ 0x0223D934
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x3d
	bl FUN_02014918
	ldr r1, _0223D990 @ =0x000011AC
	movs r2, #0x62
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl FUN_02014960
	ldr r0, _0223D990 @ =0x000011AC
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x63
	movs r3, #2
	bl FUN_02014960
	ldr r0, _0223D990 @ =0x000011AC
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x64
	movs r3, #3
	bl FUN_02014960
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0xa
	bl ov70_02238CAC
	ldr r1, _0223D994 @ =0x000011D0
	str r0, [r4, r1]
	movs r0, #8
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	nop
_0223D990: .4byte 0x000011AC
_0223D994: .4byte 0x000011D0
	thumb_func_end ov70_0223D934

	thumb_func_start ov70_0223D998
ov70_0223D998: @ 0x0223D998
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0223DB1C @ =0x000011D0
	ldr r0, [r5, r0]
	bl FUN_020186A4
	cmp r0, #3
	bhi _0223D9BA
	cmp r0, #1
	blo _0223D9B8
	beq _0223D9C6
	cmp r0, #2
	beq _0223D9EE
	cmp r0, #3
	beq _0223D9C2
_0223D9B8:
	b _0223DB16
_0223D9BA:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _0223D9C4
_0223D9C2:
	b _0223DAFA
_0223D9C4:
	b _0223DB16
_0223D9C6:
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DB20 @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldr r0, _0223DB24 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0200E9BC
	movs r0, #2
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #8
	movs r2, #5
	bl ov70_02238E50
	b _0223DB16
_0223D9EE:
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DB20 @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	adds r4, r0, #0
	bl ov70_0223E4FC
	cmp r0, #0
	beq _0223DA38
	ldr r0, _0223DB28 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x25
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	b _0223DB16
_0223DA38:
	adds r0, r4, #0
	bl ov70_0223E538
	cmp r0, #0
	beq _0223DA76
	cmp r0, #1
	ldr r0, _0223DB28 @ =0x00000F0F
	bne _0223DA5A
	str r0, [sp]
	movs r2, #1
	adds r0, r5, #0
	movs r1, #0xb1
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	b _0223DA6A
_0223DA5A:
	str r0, [sp]
	movs r2, #1
	adds r0, r5, #0
	movs r1, #0xb2
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
_0223DA6A:
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	b _0223DB16
_0223DA76:
	adds r0, r4, #0
	bl ov70_0223E59C
	cmp r0, #0
	beq _0223DA9E
	ldr r0, _0223DB28 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xb3
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	b _0223DB16
_0223DA9E:
	movs r0, #0x12
	lsls r0, r0, #4
	ldrh r0, [r5, r0]
	movs r4, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223DACC
	ldr r1, _0223DB2C @ =0x00000122
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl FUN_02074644
	movs r1, #0xa2
	adds r2, r4, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0223DACC
	movs r0, #0xe
	movs r4, #1
	str r0, [r5, #0x2c]
_0223DACC:
	cmp r4, #0
	bne _0223DB16
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	movs r1, #0x49
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #2
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0
	bl ov70_02238E50
	b _0223DB16
_0223DAFA:
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DB20 @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldr r0, _0223DB24 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0200E9BC
	movs r0, #0
	str r0, [r5, #0x2c]
_0223DB16:
	movs r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223DB1C: .4byte 0x000011D0
_0223DB20: .4byte 0x000011AC
_0223DB24: .4byte 0x00000F18
_0223DB28: .4byte 0x00000F0F
_0223DB2C: .4byte 0x00000122
	thumb_func_end ov70_0223D998

	thumb_func_start ov70_0223DB30
ov70_0223DB30: @ 0x0223DB30
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0x3d
	bl FUN_02014918
	ldr r1, _0223DB8C @ =0x000011AC
	movs r2, #0x57
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl FUN_02014960
	ldr r0, _0223DB8C @ =0x000011AC
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x58
	movs r3, #2
	bl FUN_02014960
	ldr r0, _0223DB8C @ =0x000011AC
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	movs r2, #0x59
	movs r3, #3
	bl FUN_02014960
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0xa
	bl ov70_02238CAC
	ldr r1, _0223DB90 @ =0x000011D0
	str r0, [r4, r1]
	movs r0, #0xa
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	nop
_0223DB8C: .4byte 0x000011AC
_0223DB90: .4byte 0x000011D0
	thumb_func_end ov70_0223DB30

	thumb_func_start ov70_0223DB94
ov70_0223DB94: @ 0x0223DB94
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0223DCF8 @ =0x000011D0
	ldr r0, [r5, r0]
	bl FUN_020186A4
	cmp r0, #3
	bhi _0223DBB6
	cmp r0, #1
	blo _0223DBB4
	beq _0223DBC2
	cmp r0, #2
	beq _0223DBE0
	cmp r0, #3
	beq _0223DBBE
_0223DBB4:
	b _0223DCF0
_0223DBB6:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _0223DBC0
_0223DBBE:
	b _0223DCD4
_0223DBC0:
	b _0223DCF0
_0223DBC2:
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DCFC @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	movs r0, #2
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #8
	movs r2, #6
	bl ov70_02238E50
	b _0223DCF0
_0223DBE0:
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DCFC @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldr r0, _0223DD00 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0200E9BC
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r5]
	ldrh r2, [r5, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r5, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	adds r4, r0, #0
	bl ov70_0223E4FC
	cmp r0, #0
	beq _0223DC34
	ldr r0, _0223DD04 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x25
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	b _0223DCF0
_0223DC34:
	adds r0, r4, #0
	bl ov70_0223E538
	cmp r0, #0
	beq _0223DC72
	cmp r0, #1
	ldr r0, _0223DD04 @ =0x00000F0F
	bne _0223DC56
	str r0, [sp]
	movs r2, #1
	adds r0, r5, #0
	movs r1, #0xb1
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	b _0223DC66
_0223DC56:
	str r0, [sp]
	movs r2, #1
	adds r0, r5, #0
	movs r1, #0xb2
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
_0223DC66:
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	b _0223DCF0
_0223DC72:
	adds r0, r4, #0
	bl ov70_0223E59C
	cmp r0, #0
	beq _0223DC9A
	ldr r0, _0223DD04 @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xb3
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	b _0223DCF0
_0223DC9A:
	movs r0, #0x12
	lsls r0, r0, #4
	ldrh r0, [r5, r0]
	movs r4, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223DCC8
	ldr r1, _0223DD08 @ =0x00000122
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl FUN_02074644
	movs r1, #0xa2
	adds r2, r4, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0223DCC8
	movs r0, #0xb
	movs r4, #1
	str r0, [r5, #0x2c]
_0223DCC8:
	cmp r4, #0
	bne _0223DCF0
	adds r0, r5, #0
	bl ov70_0223DE6C
	b _0223DCF0
_0223DCD4:
	adds r0, r5, #0
	bl ov70_02238D60
	ldr r0, _0223DCFC @ =0x000011AC
	ldr r0, [r5, r0]
	bl FUN_02014950
	ldr r0, _0223DD00 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0200E9BC
	movs r0, #0
	str r0, [r5, #0x2c]
_0223DCF0:
	movs r0, #3
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223DCF8: .4byte 0x000011D0
_0223DCFC: .4byte 0x000011AC
_0223DD00: .4byte 0x00000F18
_0223DD04: .4byte 0x00000F0F
_0223DD08: .4byte 0x00000122
	thumb_func_end ov70_0223DB94

	thumb_func_start ov70_0223DD0C
ov70_0223DD0C: @ 0x0223DD0C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0223DD20
	cmp r0, #8
	beq _0223DD20
	cmp r0, #3
	bne _0223DD40
_0223DD20:
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, _0223DD64 @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	b _0223DD58
_0223DD40:
	movs r0, #6
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
_0223DD58:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223DD64: .4byte 0x000011FC
	thumb_func_end ov70_0223DD0C

	thumb_func_start ov70_0223DD68
ov70_0223DD68: @ 0x0223DD68
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223DD8C @ =0x000001AD
	movs r1, #0xc
	movs r3, #8
	bl ov70_02238C14
	ldr r1, _0223DD90 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #6
	str r0, [r4, #0x2c]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223DD8C: .4byte 0x000001AD
_0223DD90: .4byte 0x000011C8
	thumb_func_end ov70_0223DD68

	thumb_func_start ov70_0223DD94
ov70_0223DD94: @ 0x0223DD94
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223DDB8
	ldr r0, _0223DDCC @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #2
	movs r1, #0
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	b _0223DDC8
_0223DDB8:
	cmp r0, #2
	bne _0223DDC8
	ldr r0, _0223DDCC @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #0
	str r0, [r4, #0x2c]
_0223DDC8:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223DDCC: .4byte 0x000011C8
	thumb_func_end ov70_0223DD94

	thumb_func_start ov70_0223DDD0
ov70_0223DDD0: @ 0x0223DDD0
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223DDF8 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r2, #1
	movs r1, #0x19
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0xc
	bl ov70_02238D84
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_0223DDF8: .4byte 0x00000F0F
	thumb_func_end ov70_0223DDD0

	thumb_func_start ov70_0223DDFC
ov70_0223DDFC: @ 0x0223DDFC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223DE20 @ =0x000001AD
	movs r1, #0xa
	movs r3, #8
	bl ov70_02238C14
	ldr r1, _0223DE24 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #0xd
	str r0, [r4, #0x2c]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223DE20: .4byte 0x000001AD
_0223DE24: .4byte 0x000011C8
	thumb_func_end ov70_0223DDFC

	thumb_func_start ov70_0223DE28
ov70_0223DE28: @ 0x0223DE28
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223DE44
	ldr r0, _0223DE64 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	adds r0, r4, #0
	bl ov70_0223DE6C
	b _0223DE5E
_0223DE44:
	cmp r0, #2
	bne _0223DE5E
	ldr r0, _0223DE64 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _0223DE68 @ =0x00001158
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	movs r0, #1
	str r0, [r4, #0x2c]
_0223DE5E:
	movs r0, #3
	pop {r4, pc}
	nop
_0223DE64: .4byte 0x000011C8
_0223DE68: .4byte 0x00001158
	thumb_func_end ov70_0223DE28

	thumb_func_start ov70_0223DE6C
ov70_0223DE6C: @ 0x0223DE6C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x26
	lsls r0, r0, #4
	adds r2, r4, r0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #8
	muls r0, r1, r0
	adds r0, r2, r0
	bl ov70_0223E76C
	cmp r0, #0
	beq _0223DEC4
	movs r0, #0x12
	lsls r0, r0, #4
	ldrh r0, [r4, r0]
	cmp r0, #0x12
	beq _0223DEC4
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r0, #6
	bne _0223DEC4
	ldr r0, _0223DF0C @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x1c
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	bl ov70_02238D84
	add sp, #8
	movs r0, #0
	pop {r4, pc}
_0223DEC4:
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	movs r1, #0x49
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223DF10 @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #7
	movs r2, #9
	bl ov70_02238E50
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r4, #0
	bl ov70_0223E690
	movs r0, #0x4a
	movs r1, #0
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #1
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0223DF0C: .4byte 0x00000F0F
_0223DF10: .4byte 0x000011FC
	thumb_func_end ov70_0223DE6C

	thumb_func_start ov70_0223DF14
ov70_0223DF14: @ 0x0223DF14
	push {r4, lr}
	sub sp, #8
	ldr r1, _0223DF3C @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r2, #1
	movs r1, #0x19
	movs r3, #0
	str r2, [sp, #4]
	bl ov70_0223E01C
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0xf
	bl ov70_02238D84
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_0223DF3C: .4byte 0x00000F0F
	thumb_func_end ov70_0223DF14

	thumb_func_start ov70_0223DF40
ov70_0223DF40: @ 0x0223DF40
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223DF64 @ =0x000001AD
	movs r1, #0xa
	movs r3, #8
	bl ov70_02238C14
	ldr r1, _0223DF68 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #0x10
	str r0, [r4, #0x2c]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223DF64: .4byte 0x000001AD
_0223DF68: .4byte 0x000011C8
	thumb_func_end ov70_0223DF40

	thumb_func_start ov70_0223DF6C
ov70_0223DF6C: @ 0x0223DF6C
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223DFAA
	ldr r0, _0223DFC8 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r3, #0x12
	lsls r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	movs r1, #0x49
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #2
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl ov70_02238E50
	b _0223DFC4
_0223DFAA:
	cmp r0, #2
	bne _0223DFC4
	ldr r0, _0223DFC8 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _0223DFCC @ =0x00001158
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	movs r0, #1
	str r0, [r4, #0x2c]
_0223DFC4:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223DFC8: .4byte 0x000011C8
_0223DFCC: .4byte 0x00001158
	thumb_func_end ov70_0223DF6C

	thumb_func_start ov70_0223DFD0
ov70_0223DFD0: @ 0x0223DFD0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223DFEA
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223DFEA:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223DFD0

	thumb_func_start ov70_0223DFF0
ov70_0223DFF0: @ 0x0223DFF0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223E014
	ldr r0, _0223E018 @ =0x00001158
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223E014:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223E018: .4byte 0x00001158
	thumb_func_end ov70_0223DFF0

	thumb_func_start ov70_0223E01C
ov70_0223E01C: @ 0x0223E01C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r6, r2, #0
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r1, _0223E084 @ =0x00000B9C
	adds r2, r7, #0
	ldr r0, [r5, r1]
	adds r1, #0x20
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0223E048
	ldr r0, _0223E088 @ =0x00000F18
	b _0223E04A
_0223E048:
	ldr r0, _0223E08C @ =0x00001158
_0223E04A:
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r6, [sp, #4]
	ldr r2, _0223E090 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r7, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223E084: .4byte 0x00000B9C
_0223E088: .4byte 0x00000F18
_0223E08C: .4byte 0x00001158
_0223E090: .4byte 0x00000BBC
	thumb_func_end ov70_0223E01C

	thumb_func_start ov70_0223E094
ov70_0223E094: @ 0x0223E094
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r2, r3, #0
	bl FUN_0200771C
	adds r4, r0, #0
	beq _0223E0B6
	adds r1, r5, #0
	blx FUN_020B70F4
	cmp r0, #0
	bne _0223E0B6
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223E0B6:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_0223E094

	thumb_func_start ov70_0223E0BC
ov70_0223E0BC: @ 0x0223E0BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r6, #0
	adds r2, r5, #0
	str r0, [sp]
	adds r7, r3, #0
	ldr r4, [sp, #0x28]
	bl FUN_020741BC
	adds r1, r0, #0
	ldr r0, [sp, #0x24]
	add r2, sp, #8
	movs r3, #0x3d
	bl ov70_0223E094
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	adds r1, r4, #0
	movs r2, #2
	ldr r0, [r0, #0x14]
	adds r1, #0xc
	lsls r2, r2, #8
	blx FUN_020D48B4
	lsls r0, r7, #4
	adds r0, #0xc
	lsls r0, r0, #5
	str r0, [r4]
	ldr r0, [sp, #0x20]
	adds r1, r5, #0
	str r0, [r4, #8]
	ldr r0, [sp]
	adds r2, r6, #0
	bl FUN_02074364
	adds r0, r0, #3
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov70_0223E0BC

	thumb_func_start ov70_0223E114
ov70_0223E114: @ 0x0223E114
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0206FD70
	strb r0, [r4, #3]
	pop {r4, pc}
	thumb_func_end ov70_0223E114

	thumb_func_start ov70_0223E120
ov70_0223E120: @ 0x0223E120
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x12
	movs r6, #2
	lsls r1, r1, #8
	lsls r6, r6, #8
	adds r7, r6, #0
	ldr r5, [r0, r1]
	str r0, [sp]
	movs r4, #0
	adds r7, #0xc
_0223E134:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0223E158
	adds r0, r5, #0
	adds r0, #0xc
	adds r1, r6, #0
	blx FUN_020D2894
	adds r0, r5, #0
	ldr r1, [r5]
	adds r0, #0xc
	adds r2, r6, #0
	blx FUN_020CFE74
	ldr r0, [r5, #8]
	ldr r1, [r5, #4]
	bl FUN_02024A14
_0223E158:
	adds r4, r4, #1
	adds r5, r5, r7
	cmp r4, #0x1e
	blt _0223E134
	movs r1, #0x12
	ldr r0, [sp]
	lsls r1, r1, #8
	ldr r0, [r0, r1]
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov70_0223E120

	thumb_func_start ov70_0223E170
ov70_0223E170: @ 0x0223E170
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	str r1, [sp, #0xc]
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x40]
	bl FUN_0206DDD8
	adds r0, r5, #0
	movs r1, #0xac
	movs r2, #0
	bl FUN_0206E640
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r6]
	adds r0, r5, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	str r0, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E640
	str r0, [sp, #0x18]
	ldrh r0, [r6]
	movs r1, #0x6f
	movs r2, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl FUN_0206E640
	adds r0, r0, #1
	strb r0, [r4, #2]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0223E1DA
	movs r0, #0
	strb r0, [r4, #3]
_0223E1DA:
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0206DE00
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0223E248
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x44]
	ldr r3, [sp, #0x38]
	str r0, [sp, #8]
	ldrh r0, [r6]
	bl ov70_0223E0BC
	ldr r0, [sp, #0xc]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0223E23C
	adds r0, r7, #0
	movs r1, #1
	bl FUN_02024830
	ldr r0, [sp, #0x18]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #0
	beq _0223E230
	adds r0, r7, #0
	movs r1, #0x29
	bl FUN_020248F0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0223E230:
	adds r0, r7, #0
	movs r1, #0x28
	bl FUN_020248F0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0223E23C:
	adds r0, r7, #0
	movs r1, #0
	bl FUN_02024830
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0223E248:
	ldr r0, [sp, #0xc]
	movs r1, #0
	bl FUN_02024830
	adds r0, r7, #0
	movs r1, #0
	bl FUN_02024830
	ldr r0, [sp, #0x44]
	movs r1, #0
	str r1, [r0, #8]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov70_0223E170

	thumb_func_start ov70_0223E264
ov70_0223E264: @ 0x0223E264
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r5, r0, #0
	ldr r0, [r5]
	str r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	ldr r1, _0223E46C @ =0x00003D68
	str r0, [sp, #0x20]
	movs r0, #3
	bl FUN_0201AACC
	movs r1, #0x12
	lsls r1, r1, #8
	str r0, [r5, r1]
	str r0, [sp, #0x18]
	movs r0, #0x14
	movs r1, #0x3d
	bl FUN_02007688
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	blt _0223E326
	cmp r0, #0x12
	bge _0223E326
	ldr r6, _0223E470 @ =0x000011F4
	movs r4, #0
_0223E29A:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	bl FUN_02074058
	ldr r2, [r5, r6]
	lsls r1, r4, #2
	adds r1, r2, r1
	bl ov70_0223E114
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1e
	blo _0223E29A
	movs r4, #0
_0223E2BA:
	ldr r0, _0223E470 @ =0x000011F4
	lsls r6, r4, #2
	ldr r1, [r5, r0]
	movs r0, #0
	strh r0, [r1, r6]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	adds r2, r4, #0
	adds r7, r5, r6
	bl FUN_02074058
	ldr r1, [sp, #0x1c]
	str r4, [sp]
	str r1, [sp, #4]
	ldr r1, _0223E470 @ =0x000011F4
	adds r2, r4, #0
	ldr r1, [r5, r1]
	add r3, sp, #0x2c
	adds r1, r1, r6
	str r1, [sp, #8]
	movs r1, #0x83
	lsls r1, r1, #2
	muls r2, r1, r2
	ldr r1, [sp, #0x18]
	lsls r6, r4, #1
	adds r1, r1, r2
	str r1, [sp, #0xc]
	ldr r1, _0223E474 @ =0x00000DD8
	movs r2, #0xe5
	lsls r2, r2, #4
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	adds r3, r3, r6
	bl ov70_0223E170
	cmp r4, #6
	bhs _0223E30E
	ldr r0, _0223E478 @ =0x00000EC8
	movs r1, #0
	ldr r0, [r7, r0]
	bl FUN_02024830
_0223E30E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1e
	blo _0223E2BA
	ldr r2, _0223E47C @ =0x00000BB4
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	ldr r2, [r5, r2]
	bl FUN_02073F00
	b _0223E414
_0223E326:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02074640
	movs r4, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _0223E3B6
_0223E336:
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #8]
	bl FUN_02074644
	str r0, [sp, #0x24]
	bl FUN_02070DB0
	ldr r1, _0223E470 @ =0x000011F4
	lsls r6, r4, #2
	ldr r1, [r5, r1]
	str r0, [sp, #0x28]
	adds r1, r1, r6
	bl ov70_0223E114
	movs r2, #0xe5
	ldr r0, [sp, #0x1c]
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, _0223E470 @ =0x000011F4
	adds r1, r4, #0
	ldr r0, [r5, r0]
	adds r7, r5, r6
	adds r0, r0, r6
	str r0, [sp, #8]
	movs r0, #0x83
	lsls r0, r0, #2
	muls r1, r0, r1
	ldr r0, [sp, #0x18]
	lsls r2, r2, #4
	adds r0, r0, r1
	str r0, [sp, #0xc]
	ldr r1, _0223E474 @ =0x00000DD8
	ldr r0, [sp, #0x28]
	ldr r1, [r7, r1]
	ldr r2, [r7, r2]
	lsls r6, r4, #1
	add r3, sp, #0x2c
	adds r3, r3, r6
	bl ov70_0223E170
	ldr r0, [sp, #0x24]
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	ldr r0, _0223E478 @ =0x00000EC8
	beq _0223E3A2
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_02024830
	b _0223E3AA
_0223E3A2:
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_02024830
_0223E3AA:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [sp, #0x14]
	cmp r4, r0
	blt _0223E336
_0223E3B6:
	cmp r4, #0x1e
	bhs _0223E404
	movs r7, #0
_0223E3BC:
	ldr r0, _0223E470 @ =0x000011F4
	lsls r1, r4, #2
	ldr r0, [r5, r0]
	adds r6, r5, r1
	strh r7, [r0, r1]
	ldr r0, _0223E474 @ =0x00000DD8
	adds r1, r7, #0
	ldr r0, [r6, r0]
	bl FUN_02024830
	movs r0, #0xe5
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x83
	lsls r0, r0, #2
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x18]
	adds r1, r0, r1
	movs r0, #0
	str r0, [r1, #8]
	cmp r4, #6
	bhs _0223E3FA
	ldr r0, _0223E478 @ =0x00000EC8
	movs r1, #0
	ldr r0, [r6, r0]
	bl FUN_02024830
_0223E3FA:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1e
	blo _0223E3BC
_0223E404:
	movs r2, #0xba
	lsls r2, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x14
	ldr r2, [r5, r2]
	movs r1, #0x5c
	bl FUN_0200BB6C
_0223E414:
	ldr r0, [sp, #0x1c]
	bl FUN_0200770C
	ldr r0, _0223E480 @ =0x00000F48
	movs r1, #0
	adds r0, r5, r0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	ldr r0, _0223E484 @ =0x00010200
	ldr r1, _0223E47C @ =0x00000BB4
	str r0, [sp, #4]
	ldr r0, _0223E480 @ =0x00000F48
	ldr r1, [r5, r1]
	adds r0, r5, r0
	movs r2, #0
	movs r3, #5
	bl ov70_02245084
	ldr r0, [r5, #0x24]
	cmp r0, #6
	bne _0223E462
	movs r2, #0x35
	lsls r2, r2, #4
	adds r4, r5, r2
	movs r2, #0x4b
	lsls r2, r2, #2
	ldr r0, _0223E470 @ =0x000011F4
	ldr r3, [r5, r2]
	ldr r1, _0223E474 @ =0x00000DD8
	subs r2, #8
	muls r2, r3, r2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x18]
	adds r1, r5, r1
	adds r2, r4, r2
	bl ov70_0223E738
_0223E462:
	ldr r1, _0223E488 @ =ov70_0223E120
	ldr r0, _0223E48C @ =0x00001204
	str r1, [r5, r0]
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223E46C: .4byte 0x00003D68
_0223E470: .4byte 0x000011F4
_0223E474: .4byte 0x00000DD8
_0223E478: .4byte 0x00000EC8
_0223E47C: .4byte 0x00000BB4
_0223E480: .4byte 0x00000F48
_0223E484: .4byte 0x00010200
_0223E488: .4byte ov70_0223E120
_0223E48C: .4byte 0x00001204
	thumb_func_end ov70_0223E264

	thumb_func_start ov70_0223E490
ov70_0223E490: @ 0x0223E490
	cmp r0, #0x12
	bne _0223E498
	movs r0, #1
	bx lr
_0223E498:
	movs r0, #0
	bx lr
	thumb_func_end ov70_0223E490

	thumb_func_start ov70_0223E49C
ov70_0223E49C: @ 0x0223E49C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r7, r1, #0
	adds r4, r3, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223E4CE
	adds r0, r5, #0
	bl FUN_02074640
	subs r0, r0, #1
	cmp r4, r0
	ble _0223E4C0
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223E4C0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02074644
	bl FUN_02070DB0
	pop {r3, r4, r5, r6, r7, pc}
_0223E4CE:
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_02074058
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov70_0223E49C

	thumb_func_start ov70_0223E4DC
ov70_0223E4DC: @ 0x0223E4DC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	bl ov70_0223E490
	cmp r0, #0
	beq _0223E4F8
	adds r0, r4, #0
	bl FUN_02074640
	cmp r0, #2
	bge _0223E4F8
	movs r0, #0
	pop {r4, pc}
_0223E4F8:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov70_0223E4DC

	thumb_func_start ov70_0223E4FC
ov70_0223E4FC: @ 0x0223E4FC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r4, #0
	bl FUN_0206DDD8
	ldr r5, _0223E534 @ =0x02245700
	str r0, [sp]
	adds r6, r4, #0
_0223E50C:
	ldrh r1, [r5]
	adds r0, r7, #0
	movs r2, #0
	bl FUN_0206E640
	adds r6, r6, #1
	adds r4, r4, r0
	adds r5, r5, #2
	cmp r6, #0xa
	blt _0223E50C
	ldr r1, [sp]
	adds r0, r7, #0
	bl FUN_0206DE00
	cmp r4, #0
	beq _0223E530
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E530:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223E534: .4byte 0x02245700
	thumb_func_end ov70_0223E4FC

	thumb_func_start ov70_0223E538
ov70_0223E538: @ 0x0223E538
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl FUN_0206DDD8
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0206DE00
	cmp r6, #0
	ble _0223E592
	ldr r1, _0223E598 @ =0x000001DF
	cmp r4, r1
	bgt _0223E574
	bge _0223E58A
	cmp r4, #0xac
	beq _0223E58E
	b _0223E592
_0223E574:
	adds r0, r1, #0
	adds r0, #8
	cmp r4, r0
	bgt _0223E584
	adds r1, #8
	cmp r4, r1
	beq _0223E58A
	b _0223E592
_0223E584:
	adds r1, #0xd
	cmp r4, r1
	bne _0223E592
_0223E58A:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223E58E:
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0223E592:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223E598: .4byte 0x000001DF
	thumb_func_end ov70_0223E538

	thumb_func_start ov70_0223E59C
ov70_0223E59C: @ 0x0223E59C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_0206DDD8
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E640
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_0206DE00
	cmp r4, #0x70
	bne _0223E5C2
	movs r0, #1
	pop {r4, r5, r6, pc}
_0223E5C2:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_0223E59C

	thumb_func_start ov70_0223E5C8
ov70_0223E5C8: @ 0x0223E5C8
	push {r4, lr}
	bl ov70_0223E49C
	adds r4, r0, #0
	bne _0223E5D6
	movs r0, #0
	pop {r4, pc}
_0223E5D6:
	movs r1, #0xac
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	bne _0223E5E6
	movs r0, #0
	pop {r4, pc}
_0223E5E6:
	adds r0, r4, #0
	movs r1, #0xad
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _0223E5F8
	movs r0, #2
	pop {r4, pc}
_0223E5F8:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov70_0223E5C8

	thumb_func_start ov70_0223E5FC
ov70_0223E5FC: @ 0x0223E5FC
	push {r3, r4}
	movs r4, #0
	ldrsh r3, [r0, r4]
	ldrsh r2, [r1, r4]
	cmp r3, r2
	beq _0223E60E
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
_0223E60E:
	movs r2, #2
	ldrsb r3, [r1, r2]
	cmp r3, #3
	beq _0223E622
	ldrsb r2, [r0, r2]
	cmp r3, r2
	beq _0223E622
	adds r0, r4, #0
	pop {r3, r4}
	bx lr
_0223E622:
	movs r2, #3
	ldrsb r3, [r0, r2]
	cmp r3, #0
	bne _0223E630
	movs r0, #0
	pop {r3, r4}
	bx lr
_0223E630:
	ldrsb r0, [r1, r2]
	cmp r0, #0
	beq _0223E640
	cmp r0, r3
	ble _0223E640
	movs r0, #0
	pop {r3, r4}
	bx lr
_0223E640:
	movs r0, #4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0223E652
	cmp r0, r3
	bge _0223E652
	movs r0, #0
	pop {r3, r4}
	bx lr
_0223E652:
	movs r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end ov70_0223E5FC

	thumb_func_start ov70_0223E658
ov70_0223E658: @ 0x0223E658
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #5
	movs r2, #0
	adds r5, r0, #0
	bl FUN_0206E640
	add r1, sp, #0
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E640
	adds r1, r0, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	adds r0, r5, #0
	bl FUN_0206FD70
	add r1, sp, #0
	strb r0, [r1, #3]
	add r0, sp, #0
	adds r1, r4, #0
	bl ov70_0223E5FC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_0223E658

	thumb_func_start ov70_0223E690
ov70_0223E690: @ 0x0223E690
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x49
	adds r5, r1, #0
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	add r1, sp, #0
	strh r0, [r1, #6]
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E640
	adds r1, r0, #1
	add r0, sp, #0
	strb r1, [r0, #8]
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0206FD70
	add r1, sp, #0
	strb r0, [r1, #9]
	adds r0, r4, #0
	ldrh r2, [r1, #6]
	adds r0, #0xec
	strh r2, [r0]
	adds r0, r4, #0
	ldrh r1, [r1, #8]
	adds r0, #0xee
	strh r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov70_0223F6E4
	movs r0, #0x26
	lsls r0, r0, #4
	adds r2, r5, r0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	subs r0, #8
	muls r0, r1, r0
	adds r0, r2, r0
	bl FUN_02070DB0
	movs r1, #5
	movs r2, #0
	adds r5, r0, #0
	bl FUN_0206E640
	add r1, sp, #0
	strh r0, [r1]
	adds r0, r5, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E640
	adds r0, r0, #1
	add r1, sp, #0
	strb r0, [r1, #2]
	movs r0, #0
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	adds r0, r4, #0
	ldrh r2, [r1]
	adds r0, #0xf0
	strh r2, [r0]
	adds r0, r4, #0
	ldrh r2, [r1, #2]
	adds r0, #0xf2
	adds r4, #0xf4
	strh r2, [r0]
	ldrh r0, [r1, #4]
	strh r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov70_0223E690

	thumb_func_start ov70_0223E738
ov70_0223E738: @ 0x0223E738
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r2, #0
	adds r4, r3, #0
	movs r6, #0
_0223E742:
	movs r0, #0
	ldrsh r0, [r5, r0]
	cmp r0, #0
	beq _0223E75C
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov70_0223E5FC
	cmp r0, #0
	bne _0223E75C
	ldr r0, [r4, #4]
	adds r0, r0, #3
	str r0, [r4, #4]
_0223E75C:
	movs r0, #0x83
	lsls r0, r0, #2
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, r4, r0
	cmp r6, #0x1e
	blt _0223E742
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov70_0223E738

	thumb_func_start ov70_0223E76C
ov70_0223E76C: @ 0x0223E76C
	push {r3, lr}
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #0
	beq _0223E786
	movs r0, #1
	pop {r3, pc}
_0223E786:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov70_0223E76C

	thumb_func_start ov70_0223E78C
ov70_0223E78C: @ 0x0223E78C
	push {r3, r4, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	bl ov70_0223ECCC
	ldr r0, [r4, #4]
	bl ov70_0223E954
	adds r0, r4, #0
	bl ov70_0223EA6C
	adds r0, r4, #0
	bl ov70_0223EB34
	adds r0, r4, #0
	bl ov70_0223EC0C
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	bl ov70_02245124
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r2, #0xba
	str r0, [sp, #4]
	subs r0, r0, #4
	lsls r2, r2, #4
	str r0, [sp, #8]
	adds r1, r2, #4
	ldr r0, [r4, r2]
	subs r2, r2, #4
	ldr r3, _0223E870 @ =0x00001058
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	adds r3, r4, r3
	bl ov70_0223F3D8
	movs r1, #0x2e
	lsls r1, r1, #6
	adds r0, r4, r1
	str r0, [sp]
	adds r0, r1, #0
	movs r3, #0x49
	adds r0, #0x20
	adds r1, #0x1c
	ldr r2, _0223E874 @ =0x00001088
	lsls r3, r3, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	adds r2, r4, r2
	bl ov70_0223F508
	ldr r0, [r4, #4]
	movs r3, #0xba
	ldr r2, _0223E878 @ =0x00000F58
	str r0, [sp, #0xc]
	adds r0, r4, r2
	str r0, [sp, #0x10]
	ldr r0, _0223E87C @ =0x00001168
	lsls r3, r3, #4
	adds r1, r4, r0
	str r1, [sp, #0x14]
	movs r1, #0xdd
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, #0x5c
	str r1, [sp, #0x18]
	adds r1, r2, #0
	subs r1, #0x54
	ldr r1, [r4, r1]
	subs r2, #0x50
	str r1, [sp, #0x1c]
	ldr r1, [r4, r2]
	movs r2, #0
	str r2, [sp, #0x24]
	str r1, [sp, #0x20]
	ldr r1, [r4, r3]
	str r1, [sp, #0x28]
	adds r1, r3, #4
	ldr r1, [r4, r1]
	adds r3, #0x10
	str r1, [sp, #0x2c]
	ldr r1, [r4, r3]
	str r1, [sp, #0x30]
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	str r1, [sp, #0x34]
	ldr r0, [r4, r0]
	movs r1, #2
	ldr r0, [r0, #0x14]
	str r0, [sp, #0x38]
	add r0, sp, #0xc
	bl ov70_02242014
	ldr r1, _0223E880 @ =0x000011A8
	str r0, [r4, r1]
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #2
	add sp, #0x3c
	pop {r3, r4, pc}
	nop
_0223E870: .4byte 0x00001058
_0223E874: .4byte 0x00001088
_0223E878: .4byte 0x00000F58
_0223E87C: .4byte 0x00001168
_0223E880: .4byte 0x000011A8
	thumb_func_end ov70_0223E78C

	thumb_func_start ov70_0223E884
ov70_0223E884: @ 0x0223E884
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238E44
	bl FUN_0203A930
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _0223E8A0 @ =0x02246614
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0223E8A0: .4byte 0x02246614
	thumb_func_end ov70_0223E884

	thumb_func_start ov70_0223E8A4
ov70_0223E8A4: @ 0x0223E8A4
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203A914
	adds r0, r4, #0
	bl ov70_0223ECA4
	ldr r0, _0223E8E4 @ =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_0224212C
	adds r0, r4, #0
	bl ov70_0223ED24
	adds r0, r4, #0
	bl ov70_0223EBD4
	ldr r0, [r4, #4]
	bl ov70_0223EA40
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	nop
_0223E8E4: .4byte 0x000011A8
	thumb_func_end ov70_0223E8A4

	thumb_func_start ov70_0223E8E8
ov70_0223E8E8: @ 0x0223E8E8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0xba
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	adds r4, r2, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r1, _0223E948 @ =0x00000B9C
	adds r2, r6, #0
	ldr r0, [r5, r1]
	adds r1, #0x20
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	ldr r0, _0223E94C @ =0x00000F18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _0223E94C @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _0223E94C @ =0x00000F18
	ldr r2, _0223E950 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0223E948: .4byte 0x00000B9C
_0223E94C: .4byte 0x00000F18
_0223E950: .4byte 0x00000BBC
	thumb_func_end ov70_0223E8E8

	thumb_func_start ov70_0223E954
ov70_0223E954: @ 0x0223E954
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0223EA30 @ =0x02245970
	adds r4, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x64
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0223EA34 @ =0x0224598C
	add r3, sp, #0x48
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
	ldr r5, _0223EA38 @ =0x02245954
	add r3, sp, #0x2c
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
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0x18
	str r0, [sp, #8]
	adds r0, r4, #0
	movs r1, #2
	adds r3, r2, #0
	str r2, [sp, #0xc]
	bl FUN_0201C8C4
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BF7C
	ldr r5, _0223EA3C @ =0x02245938
	add r3, sp, #0x10
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
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #3
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_022391F0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223EA30: .4byte 0x02245970
_0223EA34: .4byte 0x0224598C
_0223EA38: .4byte 0x02245954
_0223EA3C: .4byte 0x02245938
	thumb_func_end ov70_0223E954

	thumb_func_start ov70_0223EA40
ov70_0223EA40: @ 0x0223EA40
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022392BC
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
	movs r1, #3
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223EA40

	thumb_func_start ov70_0223EA6C
ov70_0223EA6C: @ 0x0223EA6C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5, #4]
	movs r0, #0x64
	movs r1, #0x3d
	bl FUN_02007688
	adds r6, r0, #0
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0x3d
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x64
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02007938
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	movs r0, #0xa
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x64
	movs r1, #0xc
	adds r2, r4, #0
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	movs r0, #0x64
	movs r1, #0x1a
	adds r2, r4, #0
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	lsls r0, r0, #8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl FUN_02007B44
	adds r0, r5, #0
	bl ov70_02239CF8
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_0223EA6C

	thumb_func_start ov70_0223EB34
ov70_0223EB34: @ 0x0223EB34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	str r3, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x60
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, _0223EBC8 @ =0x00000F18
	ldr r1, [sp, #0x14]
	ldr r0, [r0, #4]
	adds r1, r1, r2
	movs r2, #0
	bl FUN_0201D40C
	ldr r1, _0223EBC8 @ =0x00000F18
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	ldr r1, _0223EBCC @ =0x00001058
	ldr r0, [sp, #0x14]
	ldr r4, _0223EBD0 @ =0x02245920
	movs r7, #0
	movs r6, #0x96
	adds r5, r0, r1
_0223EB76:
	ldrh r0, [r4, #2]
	adds r1, r5, #0
	movs r2, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r3, [r4]
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	ldr r0, [r0, #4]
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	bl FUN_0201D578
	adds r7, r7, #1
	adds r6, #0x16
	adds r4, r4, #4
	adds r5, #0x10
	cmp r7, #6
	blt _0223EB76
	ldr r0, [sp, #0x14]
	movs r1, #3
	bl ov70_02239D44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223EBC8: .4byte 0x00000F18
_0223EBCC: .4byte 0x00001058
_0223EBD0: .4byte 0x02245920
	thumb_func_end ov70_0223EB34

	thumb_func_start ov70_0223EBD4
ov70_0223EBD4: @ 0x0223EBD4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0223EC00 @ =0x00001198
	adds r0, r6, r0
	bl FUN_0201D520
	ldr r0, _0223EC04 @ =0x00001058
	movs r4, #0
	adds r5, r6, r0
_0223EBE6:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blt _0223EBE6
	ldr r0, _0223EC08 @ =0x00000F18
	adds r0, r6, r0
	bl FUN_0201D520
	pop {r4, r5, r6, pc}
	nop
_0223EC00: .4byte 0x00001198
_0223EC04: .4byte 0x00001058
_0223EC08: .4byte 0x00000F18
	thumb_func_end ov70_0223EBD4

	thumb_func_start ov70_0223EC0C
ov70_0223EC0C: @ 0x0223EC0C
	push {r4, lr}
	sub sp, #0x30
	movs r2, #0xd6
	adds r4, r0, #0
	lsls r2, r2, #4
	add r0, sp, #0
	adds r1, r4, #0
	adds r2, r4, r2
	movs r3, #1
	bl ov70_02238B54
	movs r0, #0xa
	lsls r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #2
	lsls r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	movs r1, #0xdd
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x2f
	bl FUN_020248F0
	movs r0, #0xdd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x39
	lsls r0, r0, #0xe
	str r0, [sp, #8]
	movs r0, #0x75
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223EC9C @ =0x00000F04
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x26
	bl FUN_020248F0
	ldr r0, _0223EC9C @ =0x00000F04
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	movs r0, #0x23
	lsls r0, r0, #0xe
	str r0, [sp, #8]
	add r0, sp, #0
	bl FUN_02024624
	ldr r1, _0223ECA0 @ =0x00000F08
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0x27
	bl FUN_020248F0
	ldr r0, _0223ECA0 @ =0x00000F08
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	add sp, #0x30
	pop {r4, pc}
	.align 2, 0
_0223EC9C: .4byte 0x00000F04
_0223ECA0: .4byte 0x00000F08
	thumb_func_end ov70_0223EC0C

	thumb_func_start ov70_0223ECA4
ov70_0223ECA4: @ 0x0223ECA4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xdd
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02024758
	ldr r0, _0223ECC4 @ =0x00000F04
	ldr r0, [r4, r0]
	bl FUN_02024758
	ldr r0, _0223ECC8 @ =0x00000F08
	ldr r0, [r4, r0]
	bl FUN_02024758
	pop {r4, pc}
	.align 2, 0
_0223ECC4: .4byte 0x00000F04
_0223ECC8: .4byte 0x00000F08
	thumb_func_end ov70_0223ECA4

	thumb_func_start ov70_0223ECCC
ov70_0223ECCC: @ 0x0223ECCC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _0223ED1C @ =0x00000BBC
	str r0, [r4, r1]
	movs r0, #0x3d
	movs r1, #0x30
	bl FUN_0201AA8C
	ldr r1, _0223ED20 @ =0x000011C4
	movs r2, #0x30
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	movs r0, #0
	blx FUN_020D4858
	ldr r2, _0223ED20 @ =0x000011C4
	movs r0, #0x3d
	ldr r2, [r4, r2]
	movs r1, #0
	adds r2, #0x1c
	bl ov70_0223F634
	ldr r1, _0223ED20 @ =0x000011C4
	ldr r1, [r4, r1]
	str r0, [r1, #0x18]
	movs r0, #0x3d
	bl ov70_0223F684
	ldr r1, _0223ED20 @ =0x000011C4
	ldr r2, [r4, r1]
	adds r1, #0x70
	str r0, [r2, #0x14]
	adds r0, r4, r1
	bl ov70_0223F948
	pop {r4, pc}
	.align 2, 0
_0223ED1C: .4byte 0x00000BBC
_0223ED20: .4byte 0x000011C4
	thumb_func_end ov70_0223ECCC

	thumb_func_start ov70_0223ED24
ov70_0223ED24: @ 0x0223ED24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223ED50 @ =0x000011C4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x14]
	bl FUN_0201AB0C
	ldr r0, _0223ED50 @ =0x000011C4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	bl FUN_0201AB0C
	ldr r0, _0223ED50 @ =0x000011C4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _0223ED54 @ =0x00000BBC
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	nop
_0223ED50: .4byte 0x000011C4
_0223ED54: .4byte 0x00000BBC
	thumb_func_end ov70_0223ED24

	thumb_func_start ov70_0223ED58
ov70_0223ED58: @ 0x0223ED58
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223ED80
	ldr r0, _0223ED88 @ =0x00000F0F
	movs r1, #9
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl ov70_0223E8E8
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #1
	bl ov70_02238D84
_0223ED80:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223ED88: .4byte 0x00000F0F
	thumb_func_end ov70_0223ED58

	thumb_func_start ov70_0223ED8C
ov70_0223ED8C: @ 0x0223ED8C
	push {r4, lr}
	ldr r1, _0223EDAC @ =0x021D110C
	adds r4, r0, #0
	ldr r2, [r1, #0x48]
	movs r1, #2
	tst r1, r2
	beq _0223EDA6
	movs r1, #5
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x2c]
_0223EDA6:
	movs r0, #3
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.align 2, 0
_0223EDAC: .4byte 0x021D110C
	thumb_func_end ov70_0223ED8C

	thumb_func_start ov70_0223EDB0
ov70_0223EDB0: @ 0x0223EDB0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223EDC8 @ =0x000011A8
	movs r1, #0
	ldr r0, [r4, r0]
	bl ov70_022420C4
	movs r0, #6
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	nop
_0223EDC8: .4byte 0x000011A8
	thumb_func_end ov70_0223EDB0

	thumb_func_start ov70_0223EDCC
ov70_0223EDCC: @ 0x0223EDCC
	push {r3, lr}
	bl FUN_0202551C
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov70_0223EDCC

	thumb_func_start ov70_0223EDD8
ov70_0223EDD8: @ 0x0223EDD8
	push {r3, lr}
	bl FUN_0202551C
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov70_0223EDD8

	thumb_func_start ov70_0223EDE4
ov70_0223EDE4: @ 0x0223EDE4
	cmp r1, #0
	beq _0223EDF2
	cmp r1, #0xfe
	beq _0223EDFA
	cmp r1, #0xff
	beq _0223EE02
	b _0223EE0A
_0223EDF2:
	movs r1, #1
	strb r1, [r0, #2]
	adds r0, r1, #0
	bx lr
_0223EDFA:
	movs r1, #2
	strb r1, [r0, #2]
	movs r0, #1
	bx lr
_0223EE02:
	movs r1, #3
	strb r1, [r0, #2]
	movs r0, #1
	bx lr
_0223EE0A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov70_0223EDE4

	thumb_func_start ov70_0223EE10
ov70_0223EE10: @ 0x0223EE10
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _0223EED0 @ =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _0223EE2E
	adds r1, r1, #1
	cmp r0, r1
	beq _0223EECA
	b _0223EE5E
_0223EE2E:
	ldr r0, _0223EED4 @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	movs r1, #5
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223EED8 @ =0x000011C4
	ldr r3, [r4, r0]
	adds r0, #0x70
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	adds r0, r4, r0
	adds r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
	b _0223EECA
_0223EE5E:
	ldr r1, _0223EEDC @ =0x00000B84
	strh r0, [r4, r1]
	movs r1, #0x12
	bl FUN_0206FBE8
	ldr r1, _0223EED8 @ =0x000011C4
	ldr r2, [r4, r1]
	str r0, [r2, #0x20]
	ldr r1, [r4, r1]
	ldr r0, _0223EEDC @ =0x00000B84
	ldr r1, [r1, #0x20]
	adds r0, r4, r0
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223EE88
	movs r0, #0xa
	str r0, [r4, #0x2c]
	ldr r0, _0223EEE0 @ =0x00000B86
	ldrsb r1, [r4, r0]
	b _0223EE8E
_0223EE88:
	movs r0, #7
	str r0, [r4, #0x2c]
	movs r1, #3
_0223EE8E:
	ldr r2, _0223EEDC @ =0x00000B84
	ldr r3, _0223EEE4 @ =0x00001058
	ldrsh r0, [r4, r2]
	adds r3, r4, r3
	str r0, [sp]
	movs r0, #0
	str r1, [sp, #4]
	mvns r0, r0
	str r0, [sp, #8]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r0, #0x1c
	adds r1, #0x20
	adds r2, #0x18
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov70_0223F3D8
	ldr r0, _0223EED8 @ =0x000011C4
	ldr r3, [r4, r0]
	adds r0, #0x70
	ldrh r2, [r3, #6]
	ldrh r1, [r3, #4]
	adds r0, r4, r0
	adds r1, r2, r1
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #8]
	bl ov70_0223F960
_0223EECA:
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223EED0: .4byte 0x000011A8
_0223EED4: .4byte 0x00000F18
_0223EED8: .4byte 0x000011C4
_0223EEDC: .4byte 0x00000B84
_0223EEE0: .4byte 0x00000B86
_0223EEE4: .4byte 0x00001058
	thumb_func_end ov70_0223EE10

	thumb_func_start ov70_0223EEE8
ov70_0223EEE8: @ 0x0223EEE8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223EF0C @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl ov70_0223E8E8
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #8
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223EF0C: .4byte 0x00000F0F
	thumb_func_end ov70_0223EEE8

	thumb_func_start ov70_0223EF10
ov70_0223EF10: @ 0x0223EF10
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x46
	ldr r1, _0223EF30 @ =0x0000FFFF
	lsls r0, r0, #2
	strh r1, [r4, r0]
	ldr r0, _0223EF34 @ =0x000011A8
	movs r1, #1
	ldr r0, [r4, r0]
	bl ov70_022420C4
	movs r0, #9
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	nop
_0223EF30: .4byte 0x0000FFFF
_0223EF34: .4byte 0x000011A8
	thumb_func_end ov70_0223EF10

	thumb_func_start ov70_0223EF38
ov70_0223EF38: @ 0x0223EF38
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _0223EFA8 @ =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	cmp r0, #2
	bhi _0223EF58
	cmp r0, #0
	beq _0223EF70
	cmp r0, #1
	beq _0223EF70
	cmp r0, #2
	beq _0223EF70
	b _0223EFA0
_0223EF58:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bne _0223EFA0
	ldr r0, _0223EFAC @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	movs r0, #0
	str r0, [r4, #0x2c]
	b _0223EFA0
_0223EF70:
	ldr r2, _0223EFB0 @ =0x00000B86
	adds r0, r0, #1
	strb r0, [r4, r2]
	movs r1, #0xa
	str r1, [r4, #0x2c]
	subs r0, r2, #2
	ldrsh r0, [r4, r0]
	ldr r3, _0223EFB4 @ =0x00001058
	subs r1, #0xb
	str r0, [sp]
	ldrsb r0, [r4, r2]
	adds r3, r4, r3
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r0, #0x1a
	adds r1, #0x1e
	adds r2, #0x16
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov70_0223F3D8
_0223EFA0:
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223EFA8: .4byte 0x000011A8
_0223EFAC: .4byte 0x00000F18
_0223EFB0: .4byte 0x00000B86
_0223EFB4: .4byte 0x00001058
	thumb_func_end ov70_0223EF38

	thumb_func_start ov70_0223EFB8
ov70_0223EFB8: @ 0x0223EFB8
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223EFDC @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0xb
	movs r2, #1
	movs r3, #0
	bl ov70_0223E8E8
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0xb
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223EFDC: .4byte 0x00000F0F
	thumb_func_end ov70_0223EFB8

	thumb_func_start ov70_0223EFE0
ov70_0223EFE0: @ 0x0223EFE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223F000 @ =0x000011A8
	movs r1, #2
	ldr r0, [r4, r0]
	bl ov70_022420C4
	movs r0, #0x46
	ldr r1, _0223F004 @ =0x0000FFFF
	lsls r0, r0, #2
	strh r1, [r4, r0]
	movs r0, #0xc
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	nop
_0223F000: .4byte 0x000011A8
_0223F004: .4byte 0x0000FFFF
	thumb_func_end ov70_0223EFE0

	thumb_func_start ov70_0223F008
ov70_0223F008: @ 0x0223F008
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, _0223F09C @ =0x000011A8
	ldr r0, [r4, r0]
	bl ov70_02242144
	adds r1, r0, #0
	cmp r1, #0xc
	beq _0223F02C
	movs r0, #1
	mvns r0, r0
	cmp r1, r0
	beq _0223F02C
	adds r0, r0, #1
	cmp r1, r0
	beq _0223F096
	b _0223F054
_0223F02C:
	ldr r0, _0223F0A0 @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E9BC
	ldr r1, _0223F0A4 @ =0x000011C4
	ldr r0, _0223F0A8 @ =0x00000B84
	ldr r1, [r4, r1]
	adds r0, r4, r0
	ldr r1, [r1, #0x20]
	bl ov70_0223EDE4
	cmp r0, #0
	beq _0223F04E
	movs r0, #0
	str r0, [r4, #0x2c]
	b _0223F096
_0223F04E:
	movs r0, #7
	str r0, [r4, #0x2c]
	b _0223F096
_0223F054:
	ldr r0, _0223F0A8 @ =0x00000B84
	movs r2, #0
	adds r0, r4, r0
	bl ov70_0223F828
	movs r0, #0xd
	ldr r1, _0223F0AC @ =0x00000B87
	str r0, [r4, #0x2c]
	ldrsb r0, [r4, r1]
	adds r1, r1, #1
	ldrsb r1, [r4, r1]
	movs r2, #0
	bl ov70_0223F864
	ldr r2, _0223F0A8 @ =0x00000B84
	ldr r3, _0223F0B0 @ =0x00001058
	ldrsh r1, [r4, r2]
	adds r3, r4, r3
	str r1, [sp]
	adds r1, r2, #2
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r0, #0x1c
	adds r1, #0x20
	adds r2, #0x18
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov70_0223F3D8
_0223F096:
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223F09C: .4byte 0x000011A8
_0223F0A0: .4byte 0x00000F18
_0223F0A4: .4byte 0x000011C4
_0223F0A8: .4byte 0x00000B84
_0223F0AC: .4byte 0x00000B87
_0223F0B0: .4byte 0x00001058
	thumb_func_end ov70_0223F008

	thumb_func_start ov70_0223F0B4
ov70_0223F0B4: @ 0x0223F0B4
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0223F0D8 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0x17
	movs r2, #1
	movs r3, #0
	bl ov70_0223E8E8
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0xe
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223F0D8: .4byte 0x00000F0F
	thumb_func_end ov70_0223F0B4

	thumb_func_start ov70_0223F0DC
ov70_0223F0DC: @ 0x0223F0DC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _0223F100 @ =0x0000011A
	movs r1, #0xc
	movs r3, #3
	bl ov70_02238C14
	ldr r1, _0223F104 @ =0x000011C8
	str r0, [r4, r1]
	movs r0, #0xf
	str r0, [r4, #0x2c]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223F100: .4byte 0x0000011A
_0223F104: .4byte 0x000011C8
	thumb_func_end ov70_0223F0DC

	thumb_func_start ov70_0223F108
ov70_0223F108: @ 0x0223F108
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _0223F13E
	ldr r0, _0223F15C @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r1, #7
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x2c]
	ldr r0, _0223F160 @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r4, #0
	bl ov70_0223F7A4
	b _0223F158
_0223F13E:
	cmp r0, #2
	bne _0223F158
	ldr r0, _0223F15C @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r1, #5
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #2
	str r0, [r4, #0x2c]
_0223F158:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223F15C: .4byte 0x000011C8
_0223F160: .4byte 0x000011FC
	thumb_func_end ov70_0223F108

	thumb_func_start ov70_0223F164
ov70_0223F164: @ 0x0223F164
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0223F190
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, _0223F1B4 @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	b _0223F1A8
_0223F190:
	movs r0, #6
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
_0223F1A8:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0223F1B4: .4byte 0x000011FC
	thumb_func_end ov70_0223F164

	thumb_func_start ov70_0223F1B8
ov70_0223F1B8: @ 0x0223F1B8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0223F1D2
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_0223F1D2:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223F1B8

	thumb_func_start ov70_0223F1D8
ov70_0223F1D8: @ 0x0223F1D8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r3, #0
	cmp r2, #0
	beq _0223F206
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	str r5, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #0x18]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov70_02245084
	adds r0, r4, #0
	bl FUN_02026380
_0223F206:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_0223F1D8

	thumb_func_start ov70_0223F20C
ov70_0223F20C: @ 0x0223F20C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r5, r3, #0
	cmp r2, #0
	beq _0223F240
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r1, #0
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
_0223F240:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_0223F20C

	thumb_func_start ov70_0223F244
ov70_0223F244: @ 0x0223F244
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	cmp r3, #0
	beq _0223F276
	adds r0, r1, #0
	adds r1, r3, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	bl ov70_02245084
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, pc}
_0223F276:
	adds r0, r2, #0
	movs r1, #0xad
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	bl ov70_02245084
	adds r0, r5, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_0223F244

	thumb_func_start ov70_0223F2A0
ov70_0223F2A0: @ 0x0223F2A0
	cmp r0, #1
	bne _0223F2AA
	ldr r0, _0223F2B8 @ =0x022465EC
	ldr r0, [r0]
	bx lr
_0223F2AA:
	cmp r0, #2
	bne _0223F2B2
	ldr r0, _0223F2B8 @ =0x022465EC
	ldr r1, [r0, #4]
_0223F2B2:
	adds r0, r1, #0
	bx lr
	nop
_0223F2B8: .4byte 0x022465EC
	thumb_func_end ov70_0223F2A0

	thumb_func_start ov70_0223F2BC
ov70_0223F2BC: @ 0x0223F2BC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r3, #0
	bne _0223F2CC
	cmp r5, #3
	beq _0223F31C
_0223F2CC:
	adds r0, r1, #0
	ldr r1, _0223F320 @ =0x02245910
	lsls r2, r5, #2
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	cmp r0, #3
	ble _0223F2FC
	ldr r1, [sp, #0x20]
	adds r0, r5, #0
	bl ov70_0223F2A0
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov70_02245084
	b _0223F316
_0223F2FC:
	ldr r1, [sp, #0x20]
	adds r0, r5, #0
	bl ov70_0223F2A0
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r1, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov70_02245084
_0223F316:
	adds r0, r4, #0
	bl FUN_02026380
_0223F31C:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223F320: .4byte 0x02245910
	thumb_func_end ov70_0223F2BC

	thumb_func_start ov70_0223F324
ov70_0223F324: @ 0x0223F324
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r3, #0
	bne _0223F334
	cmp r5, #3
	beq _0223F368
_0223F334:
	adds r0, r1, #0
	ldr r1, _0223F36C @ =0x02245910
	lsls r2, r5, #2
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r1, [sp, #0x28]
	adds r0, r5, #0
	bl ov70_0223F2A0
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r1, [sp]
	movs r1, #0xff
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r6, #0
	adds r2, r4, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_02026380
_0223F368:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223F36C: .4byte 0x02245910
	thumb_func_end ov70_0223F324

	thumb_func_start ov70_0223F370
ov70_0223F370: @ 0x0223F370
	push {r4, lr}
	sub sp, #0x10
	movs r4, #0
	str r4, [sp]
	ldr r4, [sp, #0x18]
	str r4, [sp, #4]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #8]
	ldr r4, [sp, #0x20]
	str r4, [sp, #0xc]
	bl ov70_0223F38C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov70_0223F370

	thumb_func_start ov70_0223F38C
ov70_0223F38C: @ 0x0223F38C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	adds r5, r3, #0
	cmp r2, r0
	beq _0223F3CC
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0223F3A6
	ldr r3, _0223F3D0 @ =0x02245A4C
	b _0223F3A8
_0223F3A6:
	ldr r3, _0223F3D4 @ =0x022459F4
_0223F3A8:
	adds r0, r1, #0
	lsls r1, r2, #3
	ldr r1, [r3, r1]
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	str r5, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov70_02245084
	adds r0, r4, #0
	bl FUN_02026380
_0223F3CC:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223F3D0: .4byte 0x02245A4C
_0223F3D4: .4byte 0x022459F4
	thumb_func_end ov70_0223F38C

	thumb_func_start ov70_0223F3D8
ov70_0223F3D8: @ 0x0223F3D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	movs r1, #0x65
	str r0, [sp, #0xc]
	adds r6, r3, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x14]
	movs r2, #0
	ldr r0, _0223F468 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r5, r6, #0
	movs r4, #1
	adds r5, #0x10
	movs r7, #0
_0223F404:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0223F404
	movs r3, #0
	ldr r0, _0223F46C @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x30]
	adds r0, #0x10
	bl ov70_0223F1D8
	ldr r2, [sp, #0x34]
	subs r0, r2, #1
	cmp r0, #1
	bhi _0223F446
	movs r3, #0
	str r3, [sp]
	movs r0, #0x46
	str r0, [sp, #4]
	ldr r0, _0223F46C @ =0x00010200
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x10
	bl ov70_0223F2BC
_0223F446:
	movs r1, #0
	ldr r0, _0223F46C @ =0x00010200
	str r1, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r6, #0x20
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x38]
	adds r0, r6, #0
	movs r3, #2
	bl ov70_0223F370
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223F468: .4byte 0x000F0200
_0223F46C: .4byte 0x00010200
	thumb_func_end ov70_0223F3D8

	thumb_func_start ov70_0223F470
ov70_0223F470: @ 0x0223F470
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	movs r1, #0x65
	str r0, [sp, #0xc]
	adds r6, r3, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x14]
	movs r2, #0
	ldr r0, _0223F500 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r5, r6, #0
	movs r4, #1
	adds r5, #0x10
	movs r7, #0
_0223F49C:
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0223F49C
	movs r3, #0
	ldr r0, _0223F504 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x30]
	adds r0, #0x10
	bl ov70_0223F1D8
	ldr r2, [sp, #0x34]
	subs r0, r2, #1
	cmp r0, #1
	bhi _0223F4DE
	movs r3, #0
	str r3, [sp]
	movs r0, #0x46
	str r0, [sp, #4]
	ldr r0, _0223F504 @ =0x00010200
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x10
	bl ov70_0223F2BC
_0223F4DE:
	movs r3, #0
	ldr r0, _0223F504 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	adds r6, #0x20
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x38]
	adds r0, r6, #0
	str r3, [sp, #8]
	bl ov70_0223F370
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F500: .4byte 0x000F0200
_0223F504: .4byte 0x00010200
	thumb_func_end ov70_0223F470

	thumb_func_start ov70_0223F508
ov70_0223F508: @ 0x0223F508
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r4, r0, #0
	adds r5, r1, #0
	movs r0, #0xb
	movs r1, #0x3d
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r7, [sp, #0x38]
	bl FUN_02026354
	str r0, [sp, #0x18]
	movs r0, #0xb
	movs r1, #0x3d
	bl FUN_02026354
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x18]
	movs r1, #0x77
	bl FUN_0206E640
	ldr r0, [sp, #0xc]
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E640
	adds r6, r0, #1
	ldr r0, [sp, #0xc]
	bl FUN_0206FD70
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #0x68
	bl FUN_0200BBA0
	str r0, [sp, #0x20]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #3
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r3, r1, #0
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x6c
	movs r3, #0x3d
	bl FUN_0200BC4C
	str r0, [sp, #0x1c]
	cmp r6, #3
	beq _0223F586
	ldr r1, _0223F624 @ =0x02245910
	lsls r2, r6, #2
	ldr r1, [r1, r2]
	ldr r2, [sp, #0x14]
	adds r0, r4, #0
	bl FUN_0200BB6C
_0223F586:
	ldr r5, [sp, #8]
	movs r4, #0
_0223F58A:
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #3
	blt _0223F58A
	movs r2, #0
	ldr r0, _0223F628 @ =0x000F0200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x20]
	adds r3, r2, #0
	bl ov70_02245084
	movs r2, #0
	ldr r0, _0223F62C @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x18]
	adds r0, #0x10
	adds r3, r2, #0
	bl ov70_02245084
	movs r0, #2
	str r0, [sp]
	ldr r0, _0223F62C @ =0x00010200
	movs r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x1c]
	adds r0, #0x20
	adds r3, r2, #0
	bl ov70_02245084
	cmp r6, #3
	beq _0223F5F6
	subs r0, r6, #1
	movs r3, #0
	lsls r1, r0, #2
	ldr r0, _0223F630 @ =0x022465EC
	str r3, [sp]
	ldr r0, [r0, r1]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	movs r2, #0x46
	adds r0, #0x10
	str r0, [sp, #8]
	bl ov70_02245084
_0223F5F6:
	ldr r0, [sp, #0xc]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r7]
	ldr r0, [sp, #0x10]
	strb r6, [r7, #2]
	strb r0, [r7, #3]
	ldr r0, [sp, #0x1c]
	bl FUN_02026380
	ldr r0, [sp, #0x14]
	bl FUN_02026380
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223F624: .4byte 0x02245910
_0223F628: .4byte 0x000F0200
_0223F62C: .4byte 0x00010200
_0223F630: .4byte 0x022465EC
	thumb_func_end ov70_0223F508

	thumb_func_start ov70_0223F634
ov70_0223F634: @ 0x0223F634
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r2, #0
	movs r2, #0
	adds r3, r0, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	movs r0, #0x4a
	movs r1, #0xd
	bl FUN_02007AC4
	ldr r1, [sp, #8]
	lsrs r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov70_0223F634

	thumb_func_start ov70_0223F658
ov70_0223F658: @ 0x0223F658
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r2, #0
	lsls r2, r1, #2
	ldr r1, _0223F680 @ =0x02245AAC
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	add r0, sp, #8
	ldr r1, [r1, r2]
	str r0, [sp, #4]
	movs r0, #0x4a
	movs r2, #0
	bl FUN_02007AC4
	ldr r1, [sp, #8]
	lsrs r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_0223F680: .4byte 0x02245AAC
	thumb_func_end ov70_0223F658

	thumb_func_start ov70_0223F684
ov70_0223F684: @ 0x0223F684
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0223F6DC @ =0x000001EE
	adds r5, r0, #0
	movs r0, #0x3d
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r2, _0223F6DC @ =0x000001EE
	movs r0, #0
	adds r1, r4, #0
	blx FUN_020D4858
	movs r2, #0
	str r2, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	movs r0, #0x4a
	movs r1, #0xc
	adds r3, r5, #0
	bl FUN_02007AC4
	adds r7, r0, #0
	ldr r0, [sp, #8]
	ldr r5, _0223F6E0 @ =0x00000000
	lsrs r3, r0, #1
	beq _0223F6D0
	ldr r0, _0223F6DC @ =0x000001EE
	adds r6, r7, #0
	movs r1, #1
_0223F6C0:
	ldrh r2, [r6]
	cmp r2, r0
	bhs _0223F6C8
	strb r1, [r4, r2]
_0223F6C8:
	adds r5, r5, #1
	adds r6, r6, #2
	cmp r5, r3
	blo _0223F6C0
_0223F6D0:
	adds r0, r7, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223F6DC: .4byte 0x000001EE
_0223F6E0: .4byte 0x00000000
	thumb_func_end ov70_0223F684

	thumb_func_start ov70_0223F6E4
ov70_0223F6E4: @ 0x0223F6E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x12
	adds r4, r1, #0
	lsls r0, r0, #4
	ldrh r0, [r4, r0]
	bl ov70_0223E490
	cmp r0, #0
	beq _0223F718
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02071D6C
	bl FUN_0206DD28
	adds r2, r0, #0
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	blx FUN_020D48B4
	b _0223F730
_0223F718:
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02071D7C
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl FUN_02071780
_0223F730:
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl FUN_02028F54
	adds r1, r0, #0
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	movs r2, #8
	bl FUN_02002048
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl FUN_02028F88
	movs r1, #0x47
	lsls r1, r1, #2
	strh r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	bl FUN_0202CA8C
	ldr r1, _0223F798 @ =0x0000011E
	strb r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x18]
	bl FUN_0202CA90
	ldr r1, _0223F79C @ =0x0000011F
	strb r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl FUN_0202903C
	movs r1, #0x12
	lsls r1, r1, #4
	strb r0, [r5, r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x1c]
	bl FUN_02028F94
	adds r1, r5, #0
	adds r1, #0xf6
	strb r0, [r1]
	ldr r0, _0223F7A0 @ =0x00000122
	movs r1, #7
	strb r1, [r5, r0]
	movs r1, #2
	adds r0, r0, #1
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_0223F798: .4byte 0x0000011E
_0223F79C: .4byte 0x0000011F
_0223F7A0: .4byte 0x00000122
	thumb_func_end ov70_0223F6E4

	thumb_func_start ov70_0223F7A4
ov70_0223F7A4: @ 0x0223F7A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov70_0223F6E4
	movs r0, #0x2e
	lsls r0, r0, #6
	adds r1, r5, #0
	ldrh r2, [r4, r0]
	adds r1, #0xec
	strh r2, [r1]
	adds r1, r0, #2
	ldrh r2, [r4, r1]
	adds r1, r5, #0
	adds r1, #0xee
	strh r2, [r1]
	adds r1, r0, #4
	ldrh r2, [r4, r1]
	adds r1, r5, #0
	adds r1, #0xf0
	strh r2, [r1]
	adds r1, r0, #6
	ldrh r2, [r4, r1]
	adds r1, r5, #0
	adds r1, #0xf2
	strh r2, [r1]
	adds r0, #8
	ldrh r0, [r4, r0]
	adds r5, #0xf4
	strh r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_0223F7A4

	thumb_func_start ov70_0223F7E4
ov70_0223F7E4: @ 0x0223F7E4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	str r1, [sp]
	cmp r2, #0
	bne _0223F7F4
	ldr r5, _0223F820 @ =0x02245A4C
	movs r6, #0xc
	b _0223F7F8
_0223F7F4:
	ldr r5, _0223F824 @ =0x022459F4
	movs r6, #0xb
_0223F7F8:
	adds r0, r6, #0
	movs r1, #0x3d
	bl FUN_02014918
	movs r4, #0
	str r0, [r7]
	cmp r6, #0
	ble _0223F81C
_0223F808:
	ldr r0, [r7]
	ldr r1, [sp]
	ldr r2, [r5]
	adds r3, r4, #0
	bl FUN_02014960
	adds r4, r4, #1
	adds r5, #8
	cmp r4, r6
	blt _0223F808
_0223F81C:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223F820: .4byte 0x02245A4C
_0223F824: .4byte 0x022459F4
	thumb_func_end ov70_0223F7E4

	thumb_func_start ov70_0223F828
ov70_0223F828: @ 0x0223F828
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	bne _0223F83E
	ldr r6, _0223F85C @ =0x02245A4C
	cmp r4, #0xc
	blt _0223F848
	bl FUN_0202551C
	b _0223F848
_0223F83E:
	ldr r6, _0223F860 @ =0x022459F4
	cmp r4, #0xb
	blt _0223F848
	bl FUN_0202551C
_0223F848:
	lsls r0, r4, #3
	adds r1, r6, r0
	movs r0, #4
	ldrsh r0, [r1, r0]
	strb r0, [r5, #3]
	movs r0, #6
	ldrsh r0, [r1, r0]
	strb r0, [r5, #4]
	pop {r4, r5, r6, pc}
	nop
_0223F85C: .4byte 0x02245A4C
_0223F860: .4byte 0x022459F4
	thumb_func_end ov70_0223F828

	thumb_func_start ov70_0223F864
ov70_0223F864: @ 0x0223F864
	push {r4, r5, r6, r7}
	cmp r2, #0
	bne _0223F870
	ldr r4, _0223F8A0 @ =0x02245A4C
	movs r3, #0xc
	b _0223F874
_0223F870:
	ldr r4, _0223F8A4 @ =0x022459F4
	movs r3, #0xb
_0223F874:
	movs r2, #0
	cmp r3, #0
	ble _0223F898
	movs r5, #6
	movs r6, #4
_0223F87E:
	ldrsh r7, [r4, r6]
	cmp r0, r7
	bne _0223F890
	ldrsh r7, [r4, r5]
	cmp r1, r7
	bne _0223F890
	adds r0, r2, #0
	pop {r4, r5, r6, r7}
	bx lr
_0223F890:
	adds r2, r2, #1
	adds r4, #8
	cmp r2, r3
	blt _0223F87E
_0223F898:
	movs r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0223F8A0: .4byte 0x02245A4C
_0223F8A4: .4byte 0x022459F4
	thumb_func_end ov70_0223F864

	thumb_func_start ov70_0223F8A8
ov70_0223F8A8: @ 0x0223F8A8
	cmp r1, #0
	bne _0223F8B4
	ldr r1, _0223F8C8 @ =0x000012CC
	movs r2, #0
	str r2, [r0, r1]
	bx lr
_0223F8B4:
	subs r1, r1, #1
	cmp r1, #0x82
	bhs _0223F8C4
	lsls r2, r1, #1
	ldr r1, _0223F8CC @ =0x02245B5C
	ldrh r2, [r1, r2]
	ldr r1, _0223F8C8 @ =0x000012CC
	str r2, [r0, r1]
_0223F8C4:
	bx lr
	nop
_0223F8C8: .4byte 0x000012CC
_0223F8CC: .4byte 0x02245B5C
	thumb_func_end ov70_0223F8A8

	thumb_func_start ov70_0223F8D0
ov70_0223F8D0: @ 0x0223F8D0
	push {r3, r4}
	ldr r3, _0223F900 @ =0x022459C8
	movs r4, #0
_0223F8D6:
	ldrb r2, [r3, #1]
	cmp r0, r2
	bne _0223F8F0
	ldr r3, _0223F900 @ =0x022459C8
	lsls r0, r4, #1
	ldrb r2, [r3, r0]
	adds r0, r4, #1
	lsls r0, r0, #1
	str r2, [r1]
	ldrb r0, [r3, r0]
	subs r0, r0, r2
	pop {r3, r4}
	bx lr
_0223F8F0:
	adds r4, r4, #1
	adds r3, r3, #2
	cmp r4, #0x16
	blo _0223F8D6
	movs r0, #0
	pop {r3, r4}
	bx lr
	nop
_0223F900: .4byte 0x022459C8
	thumb_func_end ov70_0223F8D0

	thumb_func_start ov70_0223F904
ov70_0223F904: @ 0x0223F904
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	adds r0, r2, #0
	add r1, sp, #4
	bl ov70_0223F8D0
	movs r1, #0x3d
	adds r7, r0, #0
	bl FUN_02014918
	str r0, [r5]
	movs r4, #0
	b _0223F938
_0223F922:
	ldr r2, [sp, #4]
	ldr r0, [r5]
	adds r3, r2, r4
	lsls r6, r3, #1
	ldr r2, _0223F944 @ =0x02245B5C
	ldr r1, [sp]
	ldrh r2, [r2, r6]
	adds r3, r3, #1
	bl FUN_02014960
	adds r4, r4, #1
_0223F938:
	cmp r4, r7
	blt _0223F922
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223F944: .4byte 0x02245B5C
	thumb_func_end ov70_0223F904

	thumb_func_start ov70_0223F948
ov70_0223F948: @ 0x0223F948
	movs r2, #0
	adds r3, r0, #0
	adds r1, r2, #0
_0223F94E:
	strh r1, [r3, #4]
	strh r1, [r3, #0x18]
	adds r2, r2, #1
	adds r3, r3, #2
	cmp r2, #0xa
	blt _0223F94E
	strh r1, [r0]
	strh r1, [r0, #2]
	bx lr
	thumb_func_end ov70_0223F948

	thumb_func_start ov70_0223F960
ov70_0223F960: @ 0x0223F960
	lsls r1, r1, #1
	adds r0, r0, r1
	strh r2, [r0, #4]
	strh r3, [r0, #0x18]
	bx lr
	.align 2, 0
	thumb_func_end ov70_0223F960

	thumb_func_start ov70_0223F96C
ov70_0223F96C: @ 0x0223F96C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov70_0223FC40
	ldr r0, [r4, #4]
	bl ov70_0223FA08
	adds r0, r4, #0
	bl ov70_0223FB60
	adds r0, r4, #0
	bl ov70_0223FBF4
	adds r0, r4, #0
	bl ov70_02241358
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0200FA24
	adds r0, r4, #0
	bl ov70_02245124
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov70_0223F96C

	thumb_func_start ov70_0223F9B4
ov70_0223F9B4: @ 0x0223F9B4
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238E44
	bl FUN_0203A930
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _0223F9D0 @ =0x02246658
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0223F9D0: .4byte 0x02246658
	thumb_func_end ov70_0223F9B4

	thumb_func_start ov70_0223F9D4
ov70_0223F9D4: @ 0x0223F9D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223FA04 @ =0x0400106C
	blx FUN_020CDAA8
	cmp r0, #0
	beq _0223F9E8
	adds r0, r4, #0
	bl ov70_02241380
_0223F9E8:
	adds r0, r4, #0
	bl ov70_0223FC58
	adds r0, r4, #0
	bl ov70_0223FC30
	ldr r0, [r4, #4]
	bl ov70_0223FB34
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0223FA04: .4byte 0x0400106C
	thumb_func_end ov70_0223F9D4

	thumb_func_start ov70_0223FA08
ov70_0223FA08: @ 0x0223FA08
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _0223FB1C @ =0x02245C60
	add r3, sp, #0x8c
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0223FB20 @ =0x02245CA8
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
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _0223FB24 @ =0x02245C8C
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
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201CAE0
	ldr r5, _0223FB28 @ =0x02245CE0
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
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201CAE0
	ldr r5, _0223FB2C @ =0x02245CC4
	add r3, sp, #0x1c
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
	ldr r5, _0223FB30 @ =0x02245C70
	add r3, sp, #0
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
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_0223FB1C: .4byte 0x02245C60
_0223FB20: .4byte 0x02245CA8
_0223FB24: .4byte 0x02245C8C
_0223FB28: .4byte 0x02245CE0
_0223FB2C: .4byte 0x02245CC4
_0223FB30: .4byte 0x02245C70
	thumb_func_end ov70_0223FA08

	thumb_func_start ov70_0223FB34
ov70_0223FB34: @ 0x0223FB34
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
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
	pop {r4, pc}
	thumb_func_end ov70_0223FB34

	thumb_func_start ov70_0223FB60
ov70_0223FB60: @ 0x0223FB60
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, [r5, #4]
	movs r0, #0x60
	movs r1, #0
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	movs r0, #0x64
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02007938
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	ldr r0, _0223FBF0 @ =0x000011DC
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _0223FBD8
	movs r0, #4
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #5
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
_0223FBD8:
	ldr r0, [r5, #0x20]
	cmp r0, #9
	bne _0223FBEA
	adds r0, r5, #0
	bl ov70_02239C6C
	adds r0, r5, #0
	bl ov70_02239CF8
_0223FBEA:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0223FBF0: .4byte 0x000011DC
	thumb_func_end ov70_0223FB60

	thumb_func_start ov70_0223FBF4
ov70_0223FBF4: @ 0x0223FBF4
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	ldr r1, _0223FC2C @ =0x00000F18
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, _0223FC2C @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0223FC2C: .4byte 0x00000F18
	thumb_func_end ov70_0223FBF4

	thumb_func_start ov70_0223FC30
ov70_0223FC30: @ 0x0223FC30
	ldr r1, _0223FC38 @ =0x00000F18
	ldr r3, _0223FC3C @ =FUN_0201D520
	adds r0, r0, r1
	bx r3
	.align 2, 0
_0223FC38: .4byte 0x00000F18
_0223FC3C: .4byte FUN_0201D520
	thumb_func_end ov70_0223FC30

	thumb_func_start ov70_0223FC40
ov70_0223FC40: @ 0x0223FC40
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _0223FC54 @ =0x00000BBC
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_0223FC54: .4byte 0x00000BBC
	thumb_func_end ov70_0223FC40

	thumb_func_start ov70_0223FC58
ov70_0223FC58: @ 0x0223FC58
	ldr r1, _0223FC60 @ =0x00000BBC
	ldr r3, _0223FC64 @ =FUN_02026380
	ldr r0, [r0, r1]
	bx r3
	.align 2, 0
_0223FC60: .4byte 0x00000BBC
_0223FC64: .4byte FUN_02026380
	thumb_func_end ov70_0223FC58

	thumb_func_start ov70_0223FC68
ov70_0223FC68: @ 0x0223FC68
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x24]
	cmp r1, #0xc
	bhi _0223FD4C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223FC80: @ jump table
	.2byte _0223FD4C - _0223FC80 - 2 @ case 0
	.2byte _0223FD4C - _0223FC80 - 2 @ case 1
	.2byte _0223FD4C - _0223FC80 - 2 @ case 2
	.2byte _0223FD4C - _0223FC80 - 2 @ case 3
	.2byte _0223FD4C - _0223FC80 - 2 @ case 4
	.2byte _0223FD4C - _0223FC80 - 2 @ case 5
	.2byte _0223FD4C - _0223FC80 - 2 @ case 6
	.2byte _0223FC9A - _0223FC80 - 2 @ case 7
	.2byte _0223FCB8 - _0223FC80 - 2 @ case 8
	.2byte _0223FCD6 - _0223FC80 - 2 @ case 9
	.2byte _0223FCF4 - _0223FC80 - 2 @ case 10
	.2byte _0223FD18 - _0223FC80 - 2 @ case 11
	.2byte _0223FD30 - _0223FC80 - 2 @ case 12
_0223FC9A:
	ldr r1, _0223FD5C @ =0x00000F0F
	movs r2, #0x18
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #2
	bl ov70_02238D84
	b _0223FD50
_0223FCB8:
	ldr r1, _0223FD5C @ =0x00000F0F
	movs r2, #0x18
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #7
	bl ov70_02238D84
	b _0223FD50
_0223FCD6:
	ldr r1, _0223FD5C @ =0x00000F0F
	movs r2, #0x18
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0xc
	bl ov70_02238D84
	b _0223FD50
_0223FCF4:
	ldr r1, _0223FD5C @ =0x00000F0F
	movs r2, #0x18
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0x12
	bl ov70_02238D84
	ldr r0, _0223FD60 @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	b _0223FD50
_0223FD18:
	ldr r1, _0223FD5C @ =0x00000F0F
	movs r2, #0x18
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #0
	bl ov70_02244FA4
	movs r0, #0x18
	str r0, [r4, #0x2c]
	b _0223FD50
_0223FD30:
	ldr r1, _0223FD5C @ =0x00000F0F
	movs r2, #0x94
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	movs r0, #1
	str r0, [r4, #0x18]
	movs r0, #0x1d
	str r0, [r4, #0x2c]
	b _0223FD50
_0223FD4C:
	bl FUN_0202551C
_0223FD50:
	adds r0, r4, #0
	bl ov70_02238F64
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0223FD5C: .4byte 0x00000F0F
_0223FD60: .4byte 0x000011FC
	thumb_func_end ov70_0223FC68

	thumb_func_start ov70_0223FD64
ov70_0223FD64: @ 0x0223FD64
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02072894
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_02237F64
	movs r0, #3
	str r0, [r4, #0x2c]
	ldr r0, _0223FD94 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #6
	bl ov70_02240D44
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223FD94: .4byte 0x00001604
	thumb_func_end ov70_0223FD64

	thumb_func_start ov70_0223FD98
ov70_0223FD98: @ 0x0223FD98
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223FE20
	bl ov70_02237F58
	ldr r1, _0223FE3C @ =0x00001604
	movs r2, #0
	str r2, [r4, r1]
	adds r1, r0, #0
	adds r1, #0xf
	cmp r1, #0xf
	bhi _0223FE36
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223FDC2: @ jump table
	.2byte _0223FE12 - _0223FDC2 - 2 @ case 0
	.2byte _0223FE12 - _0223FDC2 - 2 @ case 1
	.2byte _0223FE1A - _0223FDC2 - 2 @ case 2
	.2byte _0223FE0A - _0223FDC2 - 2 @ case 3
	.2byte _0223FE02 - _0223FDC2 - 2 @ case 4
	.2byte _0223FE02 - _0223FDC2 - 2 @ case 5
	.2byte _0223FE02 - _0223FDC2 - 2 @ case 6
	.2byte _0223FE02 - _0223FDC2 - 2 @ case 7
	.2byte _0223FE02 - _0223FDC2 - 2 @ case 8
	.2byte _0223FE02 - _0223FDC2 - 2 @ case 9
	.2byte _0223FE02 - _0223FDC2 - 2 @ case 10
	.2byte _0223FE0A - _0223FDC2 - 2 @ case 11
	.2byte _0223FE36 - _0223FDC2 - 2 @ case 12
	.2byte _0223FE12 - _0223FDC2 - 2 @ case 13
	.2byte _0223FDFA - _0223FDC2 - 2 @ case 14
	.2byte _0223FDE2 - _0223FDC2 - 2 @ case 15
_0223FDE2:
	adds r0, r4, #0
	movs r1, #1
	bl ov70_022409C0
	ldr r0, [r4]
	movs r1, #0x2d
	ldr r0, [r0, #0x28]
	bl FUN_0202D0FC
	movs r0, #0x1e
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FDFA:
	str r0, [r4, #0x3c]
	movs r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE02:
	str r0, [r4, #0x3c]
	movs r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE0A:
	str r0, [r4, #0x3c]
	movs r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE12:
	str r0, [r4, #0x3c]
	movs r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FE36
_0223FE1A:
	bl FUN_020399EC
	b _0223FE36
_0223FE20:
	ldr r0, _0223FE3C @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _0223FE36
	bl FUN_020399EC
_0223FE36:
	movs r0, #3
	pop {r4, pc}
	nop
_0223FE3C: .4byte 0x00001604
	thumb_func_end ov70_0223FD98

	thumb_func_start ov70_0223FE40
ov70_0223FE40: @ 0x0223FE40
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237FB4
	movs r0, #5
	str r0, [r4, #0x2c]
	ldr r0, _0223FE5C @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #1
	strh r0, [r4, #0x36]
	movs r0, #3
	pop {r4, pc}
	nop
_0223FE5C: .4byte 0x00001604
	thumb_func_end ov70_0223FE40

	thumb_func_start ov70_0223FE60
ov70_0223FE60: @ 0x0223FE60
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223FEC6
	bl ov70_02237F58
	ldr r1, _0223FEE0 @ =0x00001604
	movs r2, #0
	str r2, [r4, r1]
	adds r1, r0, #0
	adds r1, #0xf
	cmp r1, #0xf
	bhi _0223FEDC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223FE8A: @ jump table
	.2byte _0223FEB8 - _0223FE8A - 2 @ case 0
	.2byte _0223FEB8 - _0223FE8A - 2 @ case 1
	.2byte _0223FEC0 - _0223FE8A - 2 @ case 2
	.2byte _0223FEB0 - _0223FE8A - 2 @ case 3
	.2byte _0223FEDC - _0223FE8A - 2 @ case 4
	.2byte _0223FEDC - _0223FE8A - 2 @ case 5
	.2byte _0223FEDC - _0223FE8A - 2 @ case 6
	.2byte _0223FEDC - _0223FE8A - 2 @ case 7
	.2byte _0223FEDC - _0223FE8A - 2 @ case 8
	.2byte _0223FEDC - _0223FE8A - 2 @ case 9
	.2byte _0223FEB8 - _0223FE8A - 2 @ case 10
	.2byte _0223FEB0 - _0223FE8A - 2 @ case 11
	.2byte _0223FEB8 - _0223FE8A - 2 @ case 12
	.2byte _0223FEB8 - _0223FE8A - 2 @ case 13
	.2byte _0223FEB8 - _0223FE8A - 2 @ case 14
	.2byte _0223FEAA - _0223FE8A - 2 @ case 15
_0223FEAA:
	movs r0, #0x21
	str r0, [r4, #0x2c]
	b _0223FEDC
_0223FEB0:
	str r0, [r4, #0x3c]
	movs r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FEDC
_0223FEB8:
	movs r0, #4
	bl FUN_02039AD8
	b _0223FEDC
_0223FEC0:
	bl FUN_020399EC
	b _0223FEDC
_0223FEC6:
	ldr r0, _0223FEE0 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _0223FEDC
	bl FUN_020399EC
_0223FEDC:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0223FEE0: .4byte 0x00001604
	thumb_func_end ov70_0223FE60

	thumb_func_start ov70_0223FEE4
ov70_0223FEE4: @ 0x0223FEE4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_02238008
	movs r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _0223FF0C @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0xb
	bl ov70_02240D44
	movs r0, #3
	pop {r4, pc}
	nop
_0223FF0C: .4byte 0x00001604
	thumb_func_end ov70_0223FEE4

	thumb_func_start ov70_0223FF10
ov70_0223FF10: @ 0x0223FF10
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0223FFA8
	bl ov70_02237F58
	ldr r1, _0223FFC4 @ =0x00001604
	movs r2, #0
	str r2, [r4, r1]
	adds r1, r0, #0
	adds r1, #0xf
	cmp r1, #0xf
	bhi _0223FFBE
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223FF3A: @ jump table
	.2byte _0223FF9A - _0223FF3A - 2 @ case 0
	.2byte _0223FF9A - _0223FF3A - 2 @ case 1
	.2byte _0223FFA2 - _0223FF3A - 2 @ case 2
	.2byte _0223FF92 - _0223FF3A - 2 @ case 3
	.2byte _0223FFBE - _0223FF3A - 2 @ case 4
	.2byte _0223FFBE - _0223FF3A - 2 @ case 5
	.2byte _0223FFBE - _0223FF3A - 2 @ case 6
	.2byte _0223FFBE - _0223FF3A - 2 @ case 7
	.2byte _0223FFBE - _0223FF3A - 2 @ case 8
	.2byte _0223FFBE - _0223FF3A - 2 @ case 9
	.2byte _0223FFBE - _0223FF3A - 2 @ case 10
	.2byte _0223FF8C - _0223FF3A - 2 @ case 11
	.2byte _0223FF86 - _0223FF3A - 2 @ case 12
	.2byte _0223FF9A - _0223FF3A - 2 @ case 13
	.2byte _0223FFBE - _0223FF3A - 2 @ case 14
	.2byte _0223FF5A - _0223FF3A - 2 @ case 15
_0223FF5A:
	ldr r0, _0223FFC8 @ =0x0000025D
	ldrsb r5, [r4, r0]
	cmp r5, #0
	beq _0223FF68
	movs r0, #0x18
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF68:
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0202DBA0
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r4, r1
	adds r3, r5, #0
	bl ov70_02240A7C
	movs r0, #0x1e
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF86:
	movs r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF8C:
	movs r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF92:
	str r0, [r4, #0x3c]
	movs r0, #0x27
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FF9A:
	str r0, [r4, #0x3c]
	movs r0, #0x26
	str r0, [r4, #0x2c]
	b _0223FFBE
_0223FFA2:
	bl FUN_020399EC
	b _0223FFBE
_0223FFA8:
	ldr r0, _0223FFC4 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _0223FFBE
	bl FUN_020399EC
_0223FFBE:
	movs r0, #3
	pop {r3, r4, r5, pc}
	nop
_0223FFC4: .4byte 0x00001604
_0223FFC8: .4byte 0x0000025D
	thumb_func_end ov70_0223FF10

	thumb_func_start ov70_0223FFCC
ov70_0223FFCC: @ 0x0223FFCC
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022380EC
	movs r0, #0xa
	str r0, [r4, #0x2c]
	ldr r0, _0223FFE4 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_0223FFE4: .4byte 0x00001604
	thumb_func_end ov70_0223FFCC

	thumb_func_start ov70_0223FFE8
ov70_0223FFE8: @ 0x0223FFE8
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224004C
	bl ov70_02237F58
	ldr r1, _02240068 @ =0x00001604
	movs r2, #0
	adds r0, #0xf
	str r2, [r4, r1]
	cmp r0, #0xf
	bhi _02240062
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02240010: @ jump table
	.2byte _0224003E - _02240010 - 2 @ case 0
	.2byte _0224003E - _02240010 - 2 @ case 1
	.2byte _02240046 - _02240010 - 2 @ case 2
	.2byte _0224003E - _02240010 - 2 @ case 3
	.2byte _02240062 - _02240010 - 2 @ case 4
	.2byte _02240062 - _02240010 - 2 @ case 5
	.2byte _02240062 - _02240010 - 2 @ case 6
	.2byte _02240062 - _02240010 - 2 @ case 7
	.2byte _02240062 - _02240010 - 2 @ case 8
	.2byte _02240062 - _02240010 - 2 @ case 9
	.2byte _02240036 - _02240010 - 2 @ case 10
	.2byte _02240036 - _02240010 - 2 @ case 11
	.2byte _02240036 - _02240010 - 2 @ case 12
	.2byte _0224003E - _02240010 - 2 @ case 13
	.2byte _02240062 - _02240010 - 2 @ case 14
	.2byte _02240030 - _02240010 - 2 @ case 15
_02240030:
	movs r0, #0x21
	str r0, [r4, #0x2c]
	b _02240062
_02240036:
	movs r0, #3
	bl FUN_02039AD8
	b _02240062
_0224003E:
	movs r0, #4
	bl FUN_02039AD8
	b _02240062
_02240046:
	bl FUN_020399EC
	b _02240062
_0224004C:
	ldr r0, _02240068 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02240062
	bl FUN_020399EC
_02240062:
	movs r0, #3
	pop {r4, pc}
	nop
_02240068: .4byte 0x00001604
	thumb_func_end ov70_0223FFE8

	thumb_func_start ov70_0224006C
ov70_0224006C: @ 0x0224006C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02072894
	movs r1, #0x4b
	lsls r1, r1, #2
	adds r0, r1, #0
	ldr r2, [r4, r1]
	subs r0, #8
	muls r0, r2, r0
	adds r2, r4, r0
	movs r0, #0xda
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	ldr r2, _022400B4 @ =0x00000A5C
	adds r1, #0x10
	adds r1, r4, r1
	adds r2, r4, r2
	bl ov70_02238208
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0x10
	bl ov70_02240D44
	movs r0, #0xd
	str r0, [r4, #0x2c]
	ldr r0, _022400B8 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_022400B4: .4byte 0x00000A5C
_022400B8: .4byte 0x00001604
	thumb_func_end ov70_0224006C

	thumb_func_start ov70_022400BC
ov70_022400BC: @ 0x022400BC
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224015E
	bl ov70_02237F58
	ldr r2, _02240178 @ =0x00001604
	movs r1, #0
	str r1, [r4, r2]
	adds r2, r0, #0
	adds r2, #0xf
	cmp r2, #0xf
	bhi _02240174
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_022400E6: @ jump table
	.2byte _02240150 - _022400E6 - 2 @ case 0
	.2byte _02240150 - _022400E6 - 2 @ case 1
	.2byte _02240158 - _022400E6 - 2 @ case 2
	.2byte _02240148 - _022400E6 - 2 @ case 3
	.2byte _02240140 - _022400E6 - 2 @ case 4
	.2byte _02240140 - _022400E6 - 2 @ case 5
	.2byte _02240140 - _022400E6 - 2 @ case 6
	.2byte _02240140 - _022400E6 - 2 @ case 7
	.2byte _02240140 - _022400E6 - 2 @ case 8
	.2byte _02240140 - _022400E6 - 2 @ case 9
	.2byte _02240138 - _022400E6 - 2 @ case 10
	.2byte _02240174 - _022400E6 - 2 @ case 11
	.2byte _02240174 - _022400E6 - 2 @ case 12
	.2byte _02240150 - _022400E6 - 2 @ case 13
	.2byte _02240174 - _022400E6 - 2 @ case 14
	.2byte _02240106 - _022400E6 - 2 @ case 15
_02240106:
	movs r0, #0x1e
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl ov70_022409C0
	movs r2, #0x12
	lsls r2, r2, #4
	ldr r1, _0224017C @ =0x00000A5C
	ldrh r2, [r4, r2]
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov70_02240B9C
	ldr r0, [r4]
	ldr r1, _0224017C @ =0x00000A5C
	ldr r0, [r0, #0x18]
	adds r1, r4, r1
	bl ov70_02240CE4
	ldr r1, _0224017C @ =0x00000A5C
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov70_02240500
	b _02240174
_02240138:
	str r0, [r4, #0x3c]
	movs r0, #0x11
	str r0, [r4, #0x2c]
	b _02240174
_02240140:
	str r0, [r4, #0x3c]
	movs r0, #0x27
	str r0, [r4, #0x2c]
	b _02240174
_02240148:
	str r0, [r4, #0x3c]
	movs r0, #0x27
	str r0, [r4, #0x2c]
	b _02240174
_02240150:
	str r0, [r4, #0x3c]
	movs r0, #0x26
	str r0, [r4, #0x2c]
	b _02240174
_02240158:
	bl FUN_020399EC
	b _02240174
_0224015E:
	ldr r0, _02240178 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02240174
	bl FUN_020399EC
_02240174:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02240178: .4byte 0x00001604
_0224017C: .4byte 0x00000A5C
	thumb_func_end ov70_022400BC

	thumb_func_start ov70_02240180
ov70_02240180: @ 0x02240180
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_0223826C
	movs r0, #0xf
	str r0, [r4, #0x2c]
	ldr r0, _02240198 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_02240198: .4byte 0x00001604
	thumb_func_end ov70_02240180

	thumb_func_start ov70_0224019C
ov70_0224019C: @ 0x0224019C
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _02240200
	bl ov70_02237F58
	ldr r1, _0224021C @ =0x00001604
	movs r2, #0
	adds r0, #0xf
	str r2, [r4, r1]
	cmp r0, #0xf
	bhi _02240216
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022401C4: @ jump table
	.2byte _022401F2 - _022401C4 - 2 @ case 0
	.2byte _022401F2 - _022401C4 - 2 @ case 1
	.2byte _022401FA - _022401C4 - 2 @ case 2
	.2byte _022401F2 - _022401C4 - 2 @ case 3
	.2byte _02240216 - _022401C4 - 2 @ case 4
	.2byte _02240216 - _022401C4 - 2 @ case 5
	.2byte _02240216 - _022401C4 - 2 @ case 6
	.2byte _02240216 - _022401C4 - 2 @ case 7
	.2byte _02240216 - _022401C4 - 2 @ case 8
	.2byte _02240216 - _022401C4 - 2 @ case 9
	.2byte _022401EA - _022401C4 - 2 @ case 10
	.2byte _02240216 - _022401C4 - 2 @ case 11
	.2byte _02240216 - _022401C4 - 2 @ case 12
	.2byte _022401F2 - _022401C4 - 2 @ case 13
	.2byte _02240216 - _022401C4 - 2 @ case 14
	.2byte _022401E4 - _022401C4 - 2 @ case 15
_022401E4:
	movs r0, #0x21
	str r0, [r4, #0x2c]
	b _02240216
_022401EA:
	movs r0, #3
	bl FUN_02039AD8
	b _02240216
_022401F2:
	movs r0, #4
	bl FUN_02039AD8
	b _02240216
_022401FA:
	bl FUN_020399EC
	b _02240216
_02240200:
	ldr r0, _0224021C @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02240216
	bl FUN_020399EC
_02240216:
	movs r0, #3
	pop {r4, pc}
	nop
_0224021C: .4byte 0x00001604
	thumb_func_end ov70_0224019C

	thumb_func_start ov70_02240220
ov70_02240220: @ 0x02240220
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_02238058
	movs r0, #0x19
	str r0, [r4, #0x2c]
	ldr r0, _0224023C @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0224023C: .4byte 0x00001604
	thumb_func_end ov70_02240220

	thumb_func_start ov70_02240240
ov70_02240240: @ 0x02240240
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	bne _0224024E
	b _022403D0
_0224024E:
	bl ov70_02237F58
	ldr r1, _022403EC @ =0x00001604
	movs r2, #0
	str r2, [r4, r1]
	adds r1, r0, #0
	adds r1, #0xf
	cmp r1, #0x10
	bhi _022402B0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0224026C: @ jump table
	.2byte _022403BE - _0224026C - 2 @ case 0
	.2byte _022403BE - _0224026C - 2 @ case 1
	.2byte _022403C6 - _0224026C - 2 @ case 2
	.2byte _022403BE - _0224026C - 2 @ case 3
	.2byte _022403E6 - _0224026C - 2 @ case 4
	.2byte _022403E6 - _0224026C - 2 @ case 5
	.2byte _022403E6 - _0224026C - 2 @ case 6
	.2byte _022403E6 - _0224026C - 2 @ case 7
	.2byte _022403E6 - _0224026C - 2 @ case 8
	.2byte _022403E6 - _0224026C - 2 @ case 9
	.2byte _022403E6 - _0224026C - 2 @ case 10
	.2byte _02240372 - _0224026C - 2 @ case 11
	.2byte _0224030A - _0224026C - 2 @ case 12
	.2byte _022403BE - _0224026C - 2 @ case 13
	.2byte _022403E6 - _0224026C - 2 @ case 14
	.2byte _0224028E - _0224026C - 2 @ case 15
	.2byte _02240294 - _0224026C - 2 @ case 16
_0224028E:
	movs r0, #0x1a
	str r0, [r4, #0x2c]
	b _022403E6
_02240294:
	movs r1, #0x4f
	movs r0, #1
	lsls r1, r1, #2
	strh r0, [r4, #0x36]
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov70_02240D00
	cmp r0, #0
	beq _022402FE
	cmp r0, #1
	beq _022402B2
	cmp r0, #2
	beq _022402D8
_022402B0:
	b _022403E6
_022402B2:
	adds r0, r4, #0
	bl ov70_02238F80
	ldr r0, _022403F0 @ =0x00000F0F
	movs r1, #0xba
	str r0, [sp]
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0x1d
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0x1c
	bl ov70_02238D84
	b _022403E6
_022402D8:
	adds r0, r4, #0
	bl ov70_02238F80
	ldr r0, _022403F0 @ =0x00000F0F
	movs r1, #0xba
	str r0, [sp]
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0x23
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0x1c
	bl ov70_02238D84
	b _022403E6
_022402FE:
	movs r0, #0x12
	str r0, [r4, #0x2c]
	ldr r0, _022403F4 @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	b _022403E6
_0224030A:
	strh r2, [r4, #0x36]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0202DB54
	cmp r0, #0
	beq _0224036A
	movs r0, #0x3d
	bl FUN_0206DD2C
	adds r5, r0, #0
	ldr r0, [r4]
	adds r1, r5, #0
	ldr r0, [r0]
	bl FUN_0202DB64
	adds r0, r5, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _022403F8 @ =0x00000B9C
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200BF8C
	movs r0, #2
	str r0, [r4, #0x28]
	movs r0, #0x22
	str r0, [r4, #0x2c]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0202DBA0
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl ov70_02240A7C
	ldr r0, [r4]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0202DB5C
	adds r0, r5, #0
	bl FUN_0201AB0C
	b _022403E6
_0224036A:
	adds r0, r4, #0
	bl ov70_022404D4
	b _022403E6
_02240372:
	strh r2, [r4, #0x36]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0202DB54
	cmp r0, #0
	beq _022403E6
	movs r0, #0x3d
	bl FUN_0206DD2C
	adds r5, r0, #0
	ldr r0, [r4]
	adds r1, r5, #0
	ldr r0, [r0]
	bl FUN_0202DB64
	adds r0, r5, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, _022403F8 @ =0x00000B9C
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_0200BF8C
	movs r0, #3
	str r0, [r4, #0x28]
	movs r0, #0x22
	str r0, [r4, #0x2c]
	ldr r0, [r4]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0202DB5C
	adds r0, r5, #0
	bl FUN_0201AB0C
	b _022403E6
_022403BE:
	str r0, [r4, #0x3c]
	movs r0, #0x26
	str r0, [r4, #0x2c]
	b _022403E6
_022403C6:
	movs r0, #3
	movs r1, #1
	bl FUN_0203AA44
_022403CE:
	b _022403CE
_022403D0:
	ldr r0, _022403EC @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _022403E6
	bl FUN_020399EC
_022403E6:
	movs r0, #3
	pop {r3, r4, r5, pc}
	nop
_022403EC: .4byte 0x00001604
_022403F0: .4byte 0x00000F0F
_022403F4: .4byte 0x000011FC
_022403F8: .4byte 0x00000B9C
	thumb_func_end ov70_02240240

	thumb_func_start ov70_022403FC
ov70_022403FC: @ 0x022403FC
	push {r4, lr}
	movs r1, #1
	movs r2, #0
	adds r4, r0, #0
	bl ov70_02238E50
	movs r0, #0x24
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_022403FC

	thumb_func_start ov70_02240410
ov70_02240410: @ 0x02240410
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_02238008
	movs r0, #0x1b
	str r0, [r4, #0x2c]
	ldr r0, _0224042C @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_0224042C: .4byte 0x00001604
	thumb_func_end ov70_02240410

	thumb_func_start ov70_02240430
ov70_02240430: @ 0x02240430
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _022404B4
	bl ov70_02237F58
	ldr r2, _022404D0 @ =0x00001604
	movs r1, #0
	str r1, [r4, r2]
	adds r2, r0, #0
	adds r2, #0xf
	cmp r2, #0xf
	bhi _022404AC
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0224045A: @ jump table
	.2byte _0224049A - _0224045A - 2 @ case 0
	.2byte _0224049A - _0224045A - 2 @ case 1
	.2byte _022404A4 - _0224045A - 2 @ case 2
	.2byte _0224049A - _0224045A - 2 @ case 3
	.2byte _022404AC - _0224045A - 2 @ case 4
	.2byte _022404AC - _0224045A - 2 @ case 5
	.2byte _022404AC - _0224045A - 2 @ case 6
	.2byte _022404AC - _0224045A - 2 @ case 7
	.2byte _022404AC - _0224045A - 2 @ case 8
	.2byte _022404AC - _0224045A - 2 @ case 9
	.2byte _022404AC - _0224045A - 2 @ case 10
	.2byte _022404AC - _0224045A - 2 @ case 11
	.2byte _02240496 - _0224045A - 2 @ case 12
	.2byte _0224049A - _0224045A - 2 @ case 13
	.2byte _022404AC - _0224045A - 2 @ case 14
	.2byte _0224047A - _0224045A - 2 @ case 15
_0224047A:
	adds r0, r4, #0
	bl ov70_02240D54
	cmp r0, #0
	beq _02240490
	movs r0, #0x16
	str r0, [r4, #0x2c]
	movs r0, #0
	strh r0, [r4, #0x36]
	movs r0, #3
	pop {r4, pc}
_02240490:
	movs r0, #1
	strh r0, [r4, #0x36]
	b _022404AC
_02240496:
	strh r1, [r4, #0x36]
	b _022404AC
_0224049A:
	str r0, [r4, #0x3c]
	movs r0, #0x26
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
_022404A4:
	bl FUN_020399EC
	movs r0, #3
	pop {r4, pc}
_022404AC:
	adds r0, r4, #0
	bl ov70_022404D4
	b _022404CA
_022404B4:
	ldr r0, _022404D0 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _022404CA
	bl FUN_020399EC
_022404CA:
	movs r0, #3
	pop {r4, pc}
	nop
_022404D0: .4byte 0x00001604
	thumb_func_end ov70_02240430

	thumb_func_start ov70_022404D4
ov70_022404D4: @ 0x022404D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #1
	beq _022404E4
	cmp r1, #2
	beq _022404F2
	pop {r4, pc}
_022404E4:
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r0, #0x24
	str r0, [r4, #0x2c]
	pop {r4, pc}
_022404F2:
	movs r1, #2
	movs r2, #3
	bl ov70_02238E50
	movs r0, #0x24
	str r0, [r4, #0x2c]
	pop {r4, pc}
	thumb_func_end ov70_022404D4

	thumb_func_start ov70_02240500
ov70_02240500: @ 0x02240500
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	ldr r0, [r0, #0x28]
	movs r1, #0x18
	bl FUN_0202D1C0
	ldr r0, [r5]
	movs r1, #0x19
	ldr r0, [r0, #0x28]
	bl FUN_0202D0FC
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _0224053C @ =0x020F5670
	ldrb r1, [r1]
	cmp r1, r0
	beq _0224053A
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl FUN_020325EC
	movs r1, #0x14
	bl FUN_02032744
_0224053A:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224053C: .4byte 0x020F5670
	thumb_func_end ov70_02240500

	thumb_func_start ov70_02240540
ov70_02240540: @ 0x02240540
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0202DBA0
	ldr r3, _02240594 @ =0x0000025D
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r2, r0, #0
	ldrsb r3, [r4, r3]
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov70_02240A7C
	ldr r0, [r4]
	movs r1, #0x4f
	lsls r1, r1, #2
	ldr r0, [r0, #0x18]
	adds r1, r4, r1
	bl ov70_02240CE4
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r4, r1
	bl ov70_02240500
	ldr r0, [r4]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0202DB5C
	movs r0, #0x1e
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xb
	bl ov70_02240D44
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02240594: .4byte 0x0000025D
	thumb_func_end ov70_02240540

	thumb_func_start ov70_02240598
ov70_02240598: @ 0x02240598
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022380A8
	movs r0, #0x14
	str r0, [r4, #0x2c]
	ldr r0, _022405B0 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_022405B0: .4byte 0x00001604
	thumb_func_end ov70_02240598

	thumb_func_start ov70_022405B4
ov70_022405B4: @ 0x022405B4
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224061C
	bl ov70_02237F58
	ldr r1, _02240638 @ =0x00001604
	movs r2, #0
	str r2, [r4, r1]
	adds r1, r0, #0
	adds r1, #0xf
	cmp r1, #0xf
	bhi _02240632
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022405DE: @ jump table
	.2byte _0224060E - _022405DE - 2 @ case 0
	.2byte _0224060E - _022405DE - 2 @ case 1
	.2byte _02240616 - _022405DE - 2 @ case 2
	.2byte _0224060C - _022405DE - 2 @ case 3
	.2byte _02240632 - _022405DE - 2 @ case 4
	.2byte _02240632 - _022405DE - 2 @ case 5
	.2byte _02240632 - _022405DE - 2 @ case 6
	.2byte _02240632 - _022405DE - 2 @ case 7
	.2byte _02240632 - _022405DE - 2 @ case 8
	.2byte _02240632 - _022405DE - 2 @ case 9
	.2byte _02240632 - _022405DE - 2 @ case 10
	.2byte _0224060C - _022405DE - 2 @ case 11
	.2byte _02240604 - _022405DE - 2 @ case 12
	.2byte _0224060E - _022405DE - 2 @ case 13
	.2byte _02240632 - _022405DE - 2 @ case 14
	.2byte _022405FE - _022405DE - 2 @ case 15
_022405FE:
	movs r0, #0x21
	str r0, [r4, #0x2c]
	b _02240632
_02240604:
	movs r0, #3
	bl FUN_02039AD8
	b _02240632
_0224060C:
	str r0, [r4, #0x3c]
_0224060E:
	movs r0, #4
	bl FUN_02039AD8
	b _02240632
_02240616:
	bl FUN_020399EC
	b _02240632
_0224061C:
	ldr r0, _02240638 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02240632
	bl FUN_020399EC
_02240632:
	movs r0, #3
	pop {r4, pc}
	nop
_02240638: .4byte 0x00001604
	thumb_func_end ov70_022405B4

	thumb_func_start ov70_0224063C
ov70_0224063C: @ 0x0224063C
	movs r0, #3
	bx lr
	thumb_func_end ov70_0224063C

	thumb_func_start ov70_02240640
ov70_02240640: @ 0x02240640
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	strh r1, [r4, #0x36]
	movs r1, #9
	movs r2, #7
	bl ov70_02238E50
	movs r0, #0x24
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240640

	thumb_func_start ov70_02240658
ov70_02240658: @ 0x02240658
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	strh r1, [r4, #0x36]
	movs r1, #9
	movs r2, #8
	bl ov70_02238E50
	movs r0, #0x24
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240658

	thumb_func_start ov70_02240670
ov70_02240670: @ 0x02240670
	push {r4, lr}
	movs r1, #9
	adds r2, r1, #0
	adds r4, r0, #0
	bl ov70_02238E50
	movs r0, #0x24
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240670

	thumb_func_start ov70_02240684
ov70_02240684: @ 0x02240684
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	strh r1, [r4, #0x36]
	movs r1, #9
	movs r2, #0xa
	bl ov70_02238E50
	movs r0, #0x1e
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240684

	thumb_func_start ov70_0224069C
ov70_0224069C: @ 0x0224069C
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022380EC
	movs r0, #0x17
	str r0, [r4, #0x2c]
	ldr r0, _022406B4 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_022406B4: .4byte 0x00001604
	thumb_func_end ov70_0224069C

	thumb_func_start ov70_022406B8
ov70_022406B8: @ 0x022406B8
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _0224072A
	bl ov70_02237F58
	ldr r1, _02240744 @ =0x00001604
	movs r2, #0
	adds r0, #0xf
	str r2, [r4, r1]
	cmp r0, #0xf
	bhi _02240740
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022406E0: @ jump table
	.2byte _0224071C - _022406E0 - 2 @ case 0
	.2byte _0224071C - _022406E0 - 2 @ case 1
	.2byte _02240724 - _022406E0 - 2 @ case 2
	.2byte _0224071C - _022406E0 - 2 @ case 3
	.2byte _02240740 - _022406E0 - 2 @ case 4
	.2byte _02240740 - _022406E0 - 2 @ case 5
	.2byte _02240740 - _022406E0 - 2 @ case 6
	.2byte _02240740 - _022406E0 - 2 @ case 7
	.2byte _02240740 - _022406E0 - 2 @ case 8
	.2byte _02240740 - _022406E0 - 2 @ case 9
	.2byte _02240714 - _022406E0 - 2 @ case 10
	.2byte _0224070E - _022406E0 - 2 @ case 11
	.2byte _02240708 - _022406E0 - 2 @ case 12
	.2byte _0224071C - _022406E0 - 2 @ case 13
	.2byte _02240740 - _022406E0 - 2 @ case 14
	.2byte _02240700 - _022406E0 - 2 @ case 15
_02240700:
	adds r0, r4, #0
	bl ov70_022404D4
	b _02240740
_02240708:
	adds r0, r4, #0
	bl ov70_022404D4
_0224070E:
	adds r0, r4, #0
	bl ov70_022404D4
_02240714:
	movs r0, #3
	bl FUN_02039AD8
	b _02240740
_0224071C:
	movs r0, #4
	bl FUN_02039AD8
	b _02240740
_02240724:
	bl FUN_020399EC
	b _02240740
_0224072A:
	ldr r0, _02240744 @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02240740
	bl FUN_020399EC
_02240740:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02240744: .4byte 0x00001604
	thumb_func_end ov70_022406B8

	thumb_func_start ov70_02240748
ov70_02240748: @ 0x02240748
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _02240788 @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x93
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0x24
	bl ov70_02238D84
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	adds r0, r4, #0
	bl ov70_02238F80
	adds r0, r4, #0
	bl ov70_02241234
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02240788: .4byte 0x00000F0F
	thumb_func_end ov70_02240748

	thumb_func_start ov70_0224078C
ov70_0224078C: @ 0x0224078C
	push {r3, lr}
	ldr r1, [r0, #0x3c]
	movs r2, #0x9a
	adds r1, #0xf
	cmp r1, #0xe
	bhi _022407CC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022407A4: @ jump table
	.2byte _022407CC - _022407A4 - 2 @ case 0
	.2byte _022407CA - _022407A4 - 2 @ case 1
	.2byte _022407CC - _022407A4 - 2 @ case 2
	.2byte _022407CC - _022407A4 - 2 @ case 3
	.2byte _022407C2 - _022407A4 - 2 @ case 4
	.2byte _022407C2 - _022407A4 - 2 @ case 5
	.2byte _022407C2 - _022407A4 - 2 @ case 6
	.2byte _022407C2 - _022407A4 - 2 @ case 7
	.2byte _022407C2 - _022407A4 - 2 @ case 8
	.2byte _022407C2 - _022407A4 - 2 @ case 9
	.2byte _022407CC - _022407A4 - 2 @ case 10
	.2byte _022407CC - _022407A4 - 2 @ case 11
	.2byte _022407CC - _022407A4 - 2 @ case 12
	.2byte _022407CA - _022407A4 - 2 @ case 13
	.2byte _022407C6 - _022407A4 - 2 @ case 14
_022407C2:
	movs r2, #0x1a
	b _022407CC
_022407C6:
	movs r2, #0x97
	b _022407CC
_022407CA:
	movs r2, #0x9c
_022407CC:
	ldr r1, _022407E0 @ =0x00000F0F
	movs r3, #1
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r0, r1]
	bl ov70_02244FA4
	pop {r3, pc}
	nop
_022407E0: .4byte 0x00000F0F
	thumb_func_end ov70_0224078C

	thumb_func_start ov70_022407E4
ov70_022407E4: @ 0x022407E4
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_0224078C
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0x24
	bl ov70_02238D84
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	adds r0, r4, #0
	bl ov70_02238F80
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_022407E4

	thumb_func_start ov70_0224080C
ov70_0224080C: @ 0x0224080C
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_0224078C
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0x24
	bl ov70_02238D84
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	adds r0, r4, #0
	bl ov70_02238F80
	adds r0, r4, #0
	bl ov70_02241234
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_0224080C

	thumb_func_start ov70_02240838
ov70_02240838: @ 0x02240838
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x25
	movs r2, #0x1e
	bl ov70_02238D84
	adds r0, r4, #0
	movs r1, #0x21
	movs r2, #0x24
	bl ov70_02240D44
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02240838

	thumb_func_start ov70_02240854
ov70_02240854: @ 0x02240854
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02027534
	ldr r0, [r4]
	movs r1, #2
	ldr r0, [r0, #0x20]
	bl FUN_02027550
	movs r0, #0x1f
	str r0, [r4, #0x2c]
	bl FUN_0201FD44
	movs r1, #0x3c
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r1, r0, #2
	movs r0, #0x47
	lsls r0, r0, #6
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02240854

	thumb_func_start ov70_02240884
ov70_02240884: @ 0x02240884
	movs r1, #0x47
	lsls r1, r1, #6
	ldr r2, [r0, r1]
	subs r2, r2, #1
	str r2, [r0, r1]
	ldr r1, [r0, r1]
	cmp r1, #0
	bne _02240898
	movs r1, #0x20
	str r1, [r0, #0x2c]
_02240898:
	movs r0, #3
	bx lr
	thumb_func_end ov70_02240884

	thumb_func_start ov70_0224089C
ov70_0224089C: @ 0x0224089C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_02027564
	cmp r0, #1
	bne _022408B2
	ldr r0, _022408B8 @ =0x000011D4
	ldrh r0, [r4, r0]
	str r0, [r4, #0x2c]
_022408B2:
	movs r0, #3
	pop {r4, pc}
	nop
_022408B8: .4byte 0x000011D4
	thumb_func_end ov70_0224089C

	thumb_func_start ov70_022408BC
ov70_022408BC: @ 0x022408BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_02027564
	cmp r0, #2
	bne _022408D8
	ldr r0, _022408DC @ =0x000011D6
	ldrh r0, [r4, r0]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl ov70_02238F80
_022408D8:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_022408DC: .4byte 0x000011D6
	thumb_func_end ov70_022408BC

	thumb_func_start ov70_022408E0
ov70_022408E0: @ 0x022408E0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02027534
	ldr r0, [r4]
	movs r1, #2
	ldr r0, [r0, #0x20]
	bl FUN_02027550
	movs r0, #0x23
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_022408E0

	thumb_func_start ov70_022408FC
ov70_022408FC: @ 0x022408FC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_02027564
	cmp r0, #2
	bne _0224093C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	adds r0, r4, #0
	bl ov70_02238F80
	ldr r0, _02240944 @ =0x00000F0F
	movs r1, #0xba
	str r0, [sp]
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, [r4, #0x28]
	adds r0, r4, #0
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0x1c
	bl ov70_02238D84
_0224093C:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02240944: .4byte 0x00000F0F
	thumb_func_end ov70_022408FC

	thumb_func_start ov70_02240948
ov70_02240948: @ 0x02240948
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov70_02238F80
	bl FUN_0203A914
	ldr r0, _0224099C @ =0x000011FC
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02240978
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	b _02240990
_02240978:
	movs r0, #6
	str r0, [sp]
	movs r1, #0
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0200FA24
_02240990:
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0224099C: .4byte 0x000011FC
	thumb_func_end ov70_02240948

	thumb_func_start ov70_022409A0
ov70_022409A0: @ 0x022409A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _022409BA
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_022409BA:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_022409A0

	thumb_func_start ov70_022409C0
ov70_022409C0: @ 0x022409C0
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	movs r1, #0x12
	adds r5, r0, #0
	lsls r1, r1, #4
	ldrh r0, [r5, r1]
	cmp r0, #0x12
	beq _02240A1A
	movs r0, #0x3d
	bl FUN_0206DD2C
	movs r2, #0x12
	lsls r2, r2, #4
	adds r4, r0, #0
	ldr r0, [r5]
	ldrh r1, [r5, r2]
	adds r2, r2, #2
	ldrh r2, [r5, r2]
	ldr r0, [r0, #0xc]
	bl FUN_02074058
	adds r1, r4, #0
	bl FUN_02071780
	movs r2, #0x12
	ldr r0, [r5]
	lsls r2, r2, #4
	ldrh r2, [r5, r2]
	ldr r0, [r0]
	adds r1, r4, #0
	bl FUN_0202DB70
	movs r2, #0x12
	lsls r2, r2, #4
	ldr r0, [r5]
	ldrh r1, [r5, r2]
	adds r2, r2, #2
	ldrh r2, [r5, r2]
	ldr r0, [r0, #0xc]
	bl FUN_02073D10
	adds r0, r4, #0
	bl FUN_0201AB0C
	b _02240A62
_02240A1A:
	ldr r0, [r5]
	adds r1, r1, #2
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl FUN_02074644
	adds r4, r0, #0
	bl FUN_02072894
	movs r2, #0x12
	ldr r0, [r5]
	lsls r2, r2, #4
	ldrh r2, [r5, r2]
	ldr r0, [r0]
	adds r1, r4, #0
	bl FUN_0202DB70
	ldr r1, _02240A74 @ =0x00000122
	ldr r0, [r5]
	ldrh r1, [r5, r1]
	ldr r0, [r0, #8]
	bl FUN_0207456C
	ldr r0, [r5]
	ldr r1, _02240A78 @ =0x000001B9
	ldr r0, [r0, #8]
	bl FUN_020748CC
	cmp r0, #0
	bne _02240A62
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl FUN_0202CE64
	bl FUN_0202CE74
_02240A62:
	cmp r6, #0
	beq _02240A70
	ldr r0, [r5]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_0202DB5C
_02240A70:
	pop {r4, r5, r6, pc}
	nop
_02240A74: .4byte 0x00000122
_02240A78: .4byte 0x000001B9
	thumb_func_end ov70_022409C0

	thumb_func_start ov70_02240A7C
ov70_02240A7C: @ 0x02240A7C
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	adds r6, r3, #0
	bl FUN_0206E540
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #0x20]
	bl FUN_0202ECC0
	movs r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r0, #6
	bne _02240AB0
	movs r0, #0
	str r0, [sp, #0x20]
_02240AB0:
	cmp r6, #0
	beq _02240B2C
	movs r1, #0x46
	add r0, sp, #0
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02240B98 @ =0x000001ED
	cmp r0, r1
	bne _02240B0E
	adds r0, r4, #0
	movs r1, #0x6e
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02240AF4
	adds r0, r4, #0
	movs r1, #0x99
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0x56
	bne _02240B0E
	adds r0, r4, #0
	movs r1, #0x6e
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02240B0E
_02240AF4:
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl FUN_020503D0
	adds r6, r0, #0
	bl FUN_02066E28
	cmp r0, #0
	bne _02240B0E
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02066E38
_02240B0E:
	adds r0, r4, #0
	movs r1, #9
	add r2, sp, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206EC40
	ldr r0, [r5]
	movs r1, #0
	ldr r0, [r0]
	bl ov70_02240CA0
_02240B2C:
	ldr r0, [sp, #0x20]
	cmp r0, #0x12
	bne _02240B54
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #8]
	bl FUN_02074524
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02074640
	movs r1, #0x4d
	movs r2, #0x12
	lsls r1, r1, #2
	str r2, [r5, r1]
	subs r2, r0, #1
	adds r0, r1, #4
	str r2, [r5, r0]
	b _02240B84
_02240B54:
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #0x20
	ldr r0, [r0, #0xc]
	add r2, sp, #4
	bl FUN_02073D9C
	adds r0, r4, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5]
	ldr r1, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl FUN_02073BFC
	movs r0, #0x4d
	ldr r1, [sp, #0x20]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [sp, #4]
	adds r0, r0, #4
	str r1, [r5, r0]
_02240B84:
	ldr r0, [r5]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0202DB5C
	add sp, #8
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
_02240B98: .4byte 0x000001ED
	thumb_func_end ov70_02240A7C

	thumb_func_start ov70_02240B9C
ov70_02240B9C: @ 0x02240B9C
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	ldr r0, [r0, #0x20]
	bl FUN_0202ECC0
	movs r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r0, #6
	bne _02240BC2
	movs r0, #0
	str r0, [sp, #0x20]
_02240BC2:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02240C9C @ =0x000001ED
	cmp r0, r1
	bne _02240C16
	adds r0, r4, #0
	movs r1, #0x6e
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02240BFC
	adds r0, r4, #0
	movs r1, #0x99
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0x56
	bne _02240C16
	adds r0, r4, #0
	movs r1, #0x6e
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02240C16
_02240BFC:
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	bl FUN_020503D0
	adds r6, r0, #0
	bl FUN_02066E28
	cmp r0, #0
	bne _02240C16
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02066E38
_02240C16:
	movs r1, #0x46
	add r0, sp, #0
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	add r2, sp, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206EC40
	ldr r0, [sp, #0x20]
	cmp r0, #0x12
	bne _02240C58
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #8]
	bl FUN_02074524
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_02074640
	movs r1, #0x4d
	movs r2, #0x12
	lsls r1, r1, #2
	str r2, [r5, r1]
	subs r2, r0, #1
	adds r0, r1, #4
	str r2, [r5, r0]
	b _02240C88
_02240C58:
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, sp, #0x20
	ldr r0, [r0, #0xc]
	add r2, sp, #4
	bl FUN_02073D9C
	adds r0, r4, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5]
	ldr r1, [sp, #0x20]
	ldr r0, [r0, #0xc]
	bl FUN_02073BFC
	movs r0, #0x4d
	ldr r1, [sp, #0x20]
	lsls r0, r0, #2
	str r1, [r5, r0]
	ldr r1, [sp, #4]
	adds r0, r0, #4
	str r1, [r5, r0]
_02240C88:
	ldr r0, [r5]
	movs r1, #1
	ldr r0, [r0]
	bl ov70_02240CA0
	add sp, #8
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.align 2, 0
_02240C9C: .4byte 0x000001ED
	thumb_func_end ov70_02240B9C

	thumb_func_start ov70_02240CA0
ov70_02240CA0: @ 0x02240CA0
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0xc
	add r1, sp, #0
	blx FUN_021ECB94
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x10]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x10
	ldr r0, [sp, #0xc]
	lsls r3, r3, #0x18
	ldr r2, [sp, #0x18]
	lsls r0, r0, #0x18
	lsrs r3, r3, #8
	orrs r0, r3
	orrs r0, r1
	adds r1, r2, #0
	orrs r1, r0
	cmp r4, #1
	bne _02240CD8
	adds r0, r5, #0
	bl FUN_0202DB98
	add sp, #0x1c
	pop {r4, r5, pc}
_02240CD8:
	adds r0, r5, #0
	bl FUN_0202DB88
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_02240CA0

	thumb_func_start ov70_02240CE4
ov70_02240CE4: @ 0x02240CE4
	push {r4, lr}
	ldr r3, _02240CFC @ =0x0000011E
	adds r4, r1, #0
	adds r2, r3, #1
	ldrb r1, [r4, r3]
	adds r3, r3, #5
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	bl FUN_02039FB8
	pop {r4, pc}
	nop
_02240CFC: .4byte 0x0000011E
	thumb_func_end ov70_02240CE4

	thumb_func_start ov70_02240D00
ov70_02240D00: @ 0x02240D00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl ov70_0223E76C
	cmp r0, #0
	beq _02240D1E
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r0, #6
	bne _02240D1E
	movs r0, #2
	pop {r4, pc}
_02240D1E:
	ldr r0, _02240D40 @ =0x000011F8
	ldrh r1, [r4, r0]
	movs r0, #0x87
	lsls r0, r0, #2
	cmp r1, r0
	bne _02240D3A
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl FUN_02074640
	cmp r0, #6
	bne _02240D3A
	movs r0, #1
	pop {r4, pc}
_02240D3A:
	movs r0, #0
	pop {r4, pc}
	nop
_02240D40: .4byte 0x000011F8
	thumb_func_end ov70_02240D00

	thumb_func_start ov70_02240D44
ov70_02240D44: @ 0x02240D44
	ldr r3, _02240D50 @ =0x000011D4
	strh r1, [r0, r3]
	adds r1, r3, #2
	strh r2, [r0, r1]
	bx lr
	nop
_02240D50: .4byte 0x000011D4
	thumb_func_end ov70_02240D44

	thumb_func_start ov70_02240D54
ov70_02240D54: @ 0x02240D54
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0202DB54
	cmp r0, #0
	bne _02240D6E
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _02240D6E
	movs r0, #1
	pop {r4, pc}
_02240D6E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02240D54

	thumb_func_start ov70_02240D74
ov70_02240D74: @ 0x02240D74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov70_0224127C
	ldr r2, _02240ED8 @ =0x00000D84
	add r0, sp, #4
	adds r1, r5, #0
	adds r2, r5, r2
	movs r3, #2
	bl ov70_02238B54
	movs r0, #2
	str r0, [sp, #0x2c]
	lsls r0, r0, #0x12
	str r0, [sp, #0xc]
	ldr r0, _02240EDC @ =0x00182000
	str r0, [sp, #0x10]
	add r0, sp, #4
	bl FUN_02024624
	ldr r1, _02240EE0 @ =0x00000EE4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _02240EE0 @ =0x00000EE4
	movs r1, #2
	ldr r0, [r5, r0]
	bl FUN_02024A04
	ldr r0, _02240EE0 @ =0x00000EE4
	movs r1, #7
	muls r1, r4, r1
	ldr r0, [r5, r0]
	adds r1, r1, #3
	bl FUN_020248F0
	ldr r0, _02240EE0 @ =0x00000EE4
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024830
	movs r0, #0
	ldr r6, _02240EE4 @ =0x02245D0A
	str r0, [sp]
	adds r4, r5, #0
	movs r7, #0xe
_02240DD8:
	add r0, sp, #4
	bl FUN_02024624
	ldr r1, _02240EE8 @ =0x00000EE8
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _02240EE8 @ =0x00000EE8
	adds r1, r7, #0
	ldr r0, [r4, r0]
	bl FUN_020248F0
	ldr r0, _02240EE8 @ =0x00000EE8
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_02024830
	ldr r0, _02240EE8 @ =0x00000EE8
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	ldr r0, [r4, r0]
	bl ov70_022410F0
	ldr r0, _02240EE8 @ =0x00000EE8
	movs r1, #2
	ldr r0, [r4, r0]
	bl FUN_02024A04
	ldr r0, [sp]
	adds r4, r4, #4
	adds r0, r0, #1
	adds r7, r7, #4
	adds r6, r6, #4
	str r0, [sp]
	cmp r0, #7
	blt _02240DD8
	add r0, sp, #4
	bl FUN_02024624
	ldr r1, _02240EEC @ =0x00000F0C
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, _02240EEC @ =0x00000F0C
	movs r1, #0x2b
	ldr r0, [r5, r0]
	bl FUN_020248F0
	ldr r0, _02240EEC @ =0x00000F0C
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
	ldr r0, _02240EEC @ =0x00000F0C
	movs r1, #0x80
	ldr r0, [r5, r0]
	movs r2, #0x56
	bl ov70_022410F0
	ldr r0, _02240EEC @ =0x00000F0C
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024A04
	add r0, sp, #4
	bl FUN_02024624
	movs r1, #0xf1
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0x2a
	bl FUN_020248F0
	movs r2, #0xf1
	lsls r2, r2, #4
	ldr r0, [r5, r2]
	adds r2, r2, #4
	ldr r3, [r5, r2]
	movs r2, #0x6a
	lsls r2, r2, #2
	movs r1, #0x37
	adds r2, r3, r2
	bl ov70_02238F9C
	movs r0, #0xf1
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	ldr r7, _02240EF0 @ =0x0000120C
	movs r4, #0
	adds r6, r7, #2
_02240EAA:
	ldr r0, _02240EE0 @ =0x00000EE4
	ldr r0, [r5, r0]
	bl FUN_020248AC
	ldr r1, [r0]
	adds r4, r4, #1
	asrs r2, r1, #0xb
	lsrs r2, r2, #0x14
	adds r2, r1, r2
	asrs r1, r2, #0xc
	strh r1, [r5, r7]
	ldr r1, [r0, #4]
	asrs r0, r1, #0xb
	lsrs r0, r0, #0x14
	adds r0, r1, r0
	asrs r0, r0, #0xc
	strh r0, [r5, r6]
	adds r5, r5, #4
	cmp r4, #8
	blt _02240EAA
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02240ED8: .4byte 0x00000D84
_02240EDC: .4byte 0x00182000
_02240EE0: .4byte 0x00000EE4
_02240EE4: .4byte 0x02245D0A
_02240EE8: .4byte 0x00000EE8
_02240EEC: .4byte 0x00000F0C
_02240EF0: .4byte 0x0000120C
	thumb_func_end ov70_02240D74

	thumb_func_start ov70_02240EF4
ov70_02240EF4: @ 0x02240EF4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov70_02240D74
	ldr r0, _02240F30 @ =ov70_02240F58
	movs r1, #0x10
	movs r2, #5
	movs r3, #0x3d
	bl FUN_02007200
	ldr r1, _02240F34 @ =0x000011D8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl FUN_0201F988
	movs r1, #0
	adds r2, r1, #0
	str r1, [r0]
	subs r2, #0x28
	str r2, [r0, #4]
	str r4, [r0, #8]
	str r5, [r0, #0xc]
	bl ov70_02240F3C
	ldr r0, _02240F38 @ =0x0000062E
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
	nop
_02240F30: .4byte ov70_02240F58
_02240F34: .4byte 0x000011D8
_02240F38: .4byte 0x0000062E
	thumb_func_end ov70_02240EF4

	thumb_func_start ov70_02240F3C
ov70_02240F3C: @ 0x02240F3C
	adds r3, r0, #0
	ldr r2, [r3, #0xc]
	ldr r0, _02240F50 @ =0x00000EE4
	ldr r3, [r3, #8]
	ldr r0, [r2, r0]
	movs r2, #7
	muls r2, r3, r2
	ldr r3, _02240F54 @ =FUN_020248F0
	adds r1, r1, r2
	bx r3
	.align 2, 0
_02240F50: .4byte 0x00000EE4
_02240F54: .4byte FUN_020248F0
	thumb_func_end ov70_02240F3C

	thumb_func_start ov70_02240F58
ov70_02240F58: @ 0x02240F58
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #3
	bhi _02240FF6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02240F72: @ jump table
	.2byte _02240F7A - _02240F72 - 2 @ case 0
	.2byte _02240FA0 - _02240F72 - 2 @ case 1
	.2byte _02240FBA - _02240F72 - 2 @ case 2
	.2byte _02240FE2 - _02240F72 - 2 @ case 3
_02240F7A:
	ldr r0, [r4, #4]
	cmp r0, #0xa0
	ble _02240F8E
	movs r0, #0xa0
	str r0, [r4, #4]
	movs r1, #1
	adds r0, r4, #0
	str r1, [r4]
	bl ov70_02240F3C
_02240F8E:
	ldr r0, [r4, #4]
	movs r1, #0x80
	adds r2, r0, #5
	ldr r0, _02240FF8 @ =0x00000EE4
	str r2, [r4, #4]
	ldr r0, [r5, r0]
	bl ov70_022410F0
	pop {r4, r5, r6, pc}
_02240FA0:
	ldr r0, _02240FF8 @ =0x00000EE4
	ldr r0, [r5, r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _02240FF6
	adds r0, r4, #0
	movs r1, #2
	bl ov70_02240F3C
	movs r0, #2
	str r0, [r4]
	pop {r4, r5, r6, pc}
_02240FBA:
	ldr r0, [r4, #4]
	cmp r0, #0x8a
	bgt _02240FD0
	movs r0, #0x8a
	str r0, [r4, #4]
	movs r1, #3
	adds r0, r4, #0
	str r1, [r4]
	bl ov70_02240F3C
	b _02240FD4
_02240FD0:
	subs r0, r0, #2
	str r0, [r4, #4]
_02240FD4:
	ldr r0, _02240FF8 @ =0x00000EE4
	ldr r2, [r4, #4]
	ldr r0, [r5, r0]
	movs r1, #0x80
	bl ov70_022410F0
	pop {r4, r5, r6, pc}
_02240FE2:
	ldr r0, _02240FFC @ =0x0000060C
	bl FUN_0200604C
	ldr r1, [r4, #0xc]
	ldr r0, _02241000 @ =0x000011DC
	movs r2, #1
	strh r2, [r1, r0]
	adds r0, r6, #0
	bl FUN_02007234
_02240FF6:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02240FF8: .4byte 0x00000EE4
_02240FFC: .4byte 0x0000060C
_02241000: .4byte 0x000011DC
	thumb_func_end ov70_02240F58

	thumb_func_start ov70_02241004
ov70_02241004: @ 0x02241004
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0224103C @ =ov70_02241048
	movs r1, #0x10
	movs r2, #5
	movs r3, #0x3d
	bl FUN_02007200
	ldr r1, _02241040 @ =0x000011D8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl FUN_0201F988
	movs r1, #0
	str r1, [r0]
	movs r1, #0x8a
	str r1, [r0, #4]
	str r4, [r0, #8]
	movs r1, #5
	str r5, [r0, #0xc]
	bl ov70_02240F3C
	ldr r0, _02241044 @ =0x0000060D
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
	nop
_0224103C: .4byte ov70_02241048
_02241040: .4byte 0x000011D8
_02241044: .4byte 0x0000060D
	thumb_func_end ov70_02241004

	thumb_func_start ov70_02241048
ov70_02241048: @ 0x02241048
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	ldr r5, [r4, #0xc]
	cmp r1, #3
	bhi _022410E0
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02241060: @ jump table
	.2byte _02241068 - _02241060 - 2 @ case 0
	.2byte _02241090 - _02241060 - 2 @ case 1
	.2byte _022410B0 - _02241060 - 2 @ case 2
	.2byte _022410D6 - _02241060 - 2 @ case 3
_02241068:
	ldr r0, [r4, #4]
	cmp r0, #0xa0
	ble _0224107E
	movs r0, #0xa0
	str r0, [r4, #4]
	movs r0, #1
	str r0, [r4]
	adds r0, r4, #0
	movs r1, #6
	bl ov70_02240F3C
_0224107E:
	ldr r0, [r4, #4]
	movs r1, #0x80
	adds r2, r0, #2
	ldr r0, _022410E4 @ =0x00000EE4
	str r2, [r4, #4]
	ldr r0, [r5, r0]
	bl ov70_022410F0
	pop {r3, r4, r5, pc}
_02241090:
	ldr r0, _022410E4 @ =0x00000EE4
	ldr r0, [r5, r0]
	bl FUN_02024B68
	cmp r0, #0
	bne _022410E0
	adds r0, r4, #0
	movs r1, #0
	bl ov70_02240F3C
	movs r0, #2
	str r0, [r4]
	ldr r0, _022410E8 @ =0x0000062F
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_022410B0:
	movs r0, #0x13
	ldr r1, [r4, #4]
	mvns r0, r0
	cmp r1, r0
	bge _022410C4
	movs r1, #3
	adds r0, r4, #0
	str r1, [r4]
	bl ov70_02240F3C
_022410C4:
	ldr r0, [r4, #4]
	movs r1, #0x80
	subs r2, r0, #5
	ldr r0, _022410E4 @ =0x00000EE4
	str r2, [r4, #4]
	ldr r0, [r5, r0]
	bl ov70_022410F0
	pop {r3, r4, r5, pc}
_022410D6:
	ldr r1, _022410EC @ =0x000011DC
	movs r2, #1
	strh r2, [r5, r1]
	bl FUN_02007234
_022410E0:
	pop {r3, r4, r5, pc}
	nop
_022410E4: .4byte 0x00000EE4
_022410E8: .4byte 0x0000062F
_022410EC: .4byte 0x000011DC
	thumb_func_end ov70_02241048

	thumb_func_start ov70_022410F0
ov70_022410F0: @ 0x022410F0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	ble _0224110E
	lsls r0, r1, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0224111C
_0224110E:
	lsls r0, r1, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0224111C:
	blx FUN_020F2104
	subs r5, #8
	str r0, [sp]
	cmp r5, #0
	ble _0224113A
	lsls r0, r5, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02241148
_0224113A:
	lsls r0, r5, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02241148:
	blx FUN_020F2104
	movs r1, #1
	lsls r1, r1, #0x14
	adds r0, r0, r1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov70_022410F0

	thumb_func_start ov70_02241164
ov70_02241164: @ 0x02241164
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02241180 @ =0x02245D26
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0224117A
	cmp r0, r4
	blt _0224117E
_0224117A:
	movs r0, #0
	mvns r0, r0
_0224117E:
	pop {r4, pc}
	.align 2, 0
_02241180: .4byte 0x02245D26
	thumb_func_end ov70_02241164

	thumb_func_start ov70_02241184
ov70_02241184: @ 0x02241184
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	adds r0, r1, #0
	beq _0224119E
	adds r0, r2, #0
	cmp r0, #1
	bne _0224119E
	ldr r0, _02241218 @ =0x0000064E
	bl FUN_0200604C
_0224119E:
	ldr r4, [sp, #4]
	movs r0, #0xe
	movs r6, #0
	str r0, [sp, #0x10]
	adds r5, r4, #0
	movs r7, #0x11
_022411AA:
	ldr r0, [sp, #8]
	cmp r6, r0
	bge _022411F4
	ldr r0, _0224121C @ =0x00000356
	ldr r1, [sp, #4]
	ldrb r0, [r4, r0]
	movs r3, #0xe
	adds r2, r1, #0
	str r0, [sp]
	ldr r0, _02241220 @ =0x000011E4
	lsls r3, r3, #6
	ldr r0, [r1, r0]
	ldr r1, _02241224 @ =0x000011EC
	ldrb r3, [r4, r3]
	ldr r1, [r2, r1]
	adds r2, r6, #0
	bl ov70_022412C8
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ldr r0, _02241228 @ =0x00000EE8
	beq _022411E0
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x10]
	bl FUN_020248F0
	b _022411E8
_022411E0:
	ldr r0, [r5, r0]
	adds r1, r7, #0
	bl FUN_020248F0
_022411E8:
	ldr r0, _02241228 @ =0x00000EE8
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02024830
	b _022411FE
_022411F4:
	ldr r0, _02241228 @ =0x00000EE8
	movs r1, #0
	ldr r0, [r5, r0]
	bl FUN_02024830
_022411FE:
	movs r0, #0x49
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r0, [sp, #0x10]
	adds r6, r6, #1
	adds r0, r0, #4
	str r0, [sp, #0x10]
	adds r5, r5, #4
	adds r7, r7, #4
	cmp r6, #7
	blt _022411AA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02241218: .4byte 0x0000064E
_0224121C: .4byte 0x00000356
_02241220: .4byte 0x000011E4
_02241224: .4byte 0x000011EC
_02241228: .4byte 0x00000EE8
	thumb_func_end ov70_02241184

	thumb_func_start ov70_0224122C
ov70_0224122C: @ 0x0224122C
	lsls r0, r0, #2
	adds r0, #0xe
	bx lr
	.align 2, 0
	thumb_func_end ov70_0224122C

	thumb_func_start ov70_02241234
ov70_02241234: @ 0x02241234
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02241278 @ =0x00000EE8
	adds r5, r0, #0
	movs r4, #0
_0224123C:
	ldr r0, [r5, r7]
	bl FUN_020248B8
	cmp r0, #0
	beq _0224126E
	ldr r0, _02241278 @ =0x00000EE8
	ldr r0, [r5, r0]
	bl FUN_020249A8
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov70_0224122C
	adds r0, r0, #1
	cmp r6, r0
	beq _0224126E
	adds r0, r4, #0
	bl ov70_0224122C
	adds r1, r0, #0
	ldr r0, _02241278 @ =0x00000EE8
	adds r1, r1, #1
	ldr r0, [r5, r0]
	bl FUN_020248F0
_0224126E:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blt _0224123C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241278: .4byte 0x00000EE8
	thumb_func_end ov70_02241234

	thumb_func_start ov70_0224127C
ov70_0224127C: @ 0x0224127C
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _022412BC @ =0x000011EC
	adds r4, r0, #0
	movs r0, #0x54
	movs r1, #0xb
	adds r2, r4, r2
	movs r3, #0x3d
	bl FUN_020079F4
	ldr r3, _022412C0 @ =0x000011E8
	movs r1, #0xc
	str r0, [r4, r3]
	movs r0, #0x3d
	subs r3, r3, #4
	str r0, [sp]
	movs r0, #0x54
	movs r2, #1
	adds r3, r4, r3
	bl FUN_020079BC
	ldr r1, _022412C4 @ =0x000011E0
	str r0, [r4, r1]
	adds r0, r1, #4
	movs r1, #2
	ldr r0, [r4, r0]
	lsls r1, r1, #0xe
	blx FUN_020D2894
	add sp, #4
	pop {r3, r4, pc}
	nop
_022412BC: .4byte 0x000011EC
_022412C0: .4byte 0x000011E8
_022412C4: .4byte 0x000011E0
	thumb_func_end ov70_0224127C

	thumb_func_start ov70_022412C8
ov70_022412C8: @ 0x022412C8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x18]
	adds r1, r3, #0
	adds r5, r2, #0
	bl FUN_0205B464
	adds r4, r0, #0
	movs r0, #6
	lsls r0, r0, #8
	ldr r1, [r7, #0x14]
	muls r0, r4, r0
	adds r0, r1, r0
	ldr r1, _02241304 @ =0x02245CFC
	lsls r2, r5, #1
	ldrh r1, [r1, r2]
	movs r2, #2
	ldr r6, [r6, #0xc]
	lsls r2, r2, #8
	blx FUN_020CFECC
	lsls r0, r4, #5
	adds r1, r5, #2
	adds r0, r6, r0
	lsls r1, r1, #5
	movs r2, #0x20
	blx FUN_020CFD70
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241304: .4byte 0x02245CFC
	thumb_func_end ov70_022412C8

	thumb_func_start ov70_02241308
ov70_02241308: @ 0x02241308
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02241328 @ =0x000011DC
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _02241324
	adds r0, #0xc
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	ldr r0, _0224132C @ =0x000011E0
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
_02241324:
	pop {r4, pc}
	nop
_02241328: .4byte 0x000011DC
_0224132C: .4byte 0x000011E0
	thumb_func_end ov70_02241308

	thumb_func_start ov70_02241330
ov70_02241330: @ 0x02241330
	push {r4, lr}
	lsls r4, r1, #2
	ldr r1, _0224134C @ =0x00000F0C
	ldr r3, _02241350 @ =0x02245D0C
	ldr r0, [r0, r1]
	ldr r1, _02241354 @ =0x02245D0A
	ldrh r3, [r3, r4]
	ldrh r1, [r1, r4]
	adds r3, #0x20
	adds r2, r2, r3
	bl ov70_022410F0
	pop {r4, pc}
	nop
_0224134C: .4byte 0x00000F0C
_02241350: .4byte 0x02245D0C
_02241354: .4byte 0x02245D0A
	thumb_func_end ov70_02241330

	thumb_func_start ov70_02241358
ov70_02241358: @ 0x02241358
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02241378 @ =0x0000120C
	adds r5, r0, #0
	movs r4, #0
	adds r6, r7, #2
_02241362:
	ldr r0, _0224137C @ =0x00000EE4
	ldrsh r1, [r5, r7]
	ldrsh r2, [r5, r6]
	ldr r0, [r5, r0]
	bl ov70_02238F9C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _02241362
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02241378: .4byte 0x0000120C
_0224137C: .4byte 0x00000EE4
	thumb_func_end ov70_02241358

	thumb_func_start ov70_02241380
ov70_02241380: @ 0x02241380
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _022413A4 @ =0x0000120C
	adds r5, r0, #0
	movs r4, #0
	adds r6, r7, #2
_0224138A:
	ldr r0, _022413A8 @ =0x00000EE4
	ldrsh r2, [r5, r6]
	ldrsh r1, [r5, r7]
	ldr r0, [r5, r0]
	adds r2, #0x20
	bl ov70_02238F9C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _0224138A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022413A4: .4byte 0x0000120C
_022413A8: .4byte 0x00000EE4
	thumb_func_end ov70_02241380

	thumb_func_start ov70_022413AC
ov70_022413AC: @ 0x022413AC
	push {r4, lr}
	movs r3, #0x12
	adds r4, r0, #0
	lsls r3, r3, #4
	ldr r1, [r4]
	ldrh r2, [r4, r3]
	adds r3, r3, #2
	ldr r0, [r1, #8]
	ldrh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov70_0223E49C
	adds r1, r4, #0
	adds r1, #0xbc
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0xcd
	strb r1, [r0]
	adds r0, r4, #0
	movs r2, #1
	adds r0, #0xcf
	strb r2, [r0]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xd0
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xce
	strb r2, [r0]
	adds r0, r4, #0
	adds r0, #0xd4
	strh r1, [r0]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_02088288
	adds r1, r4, #0
	adds r1, #0xe8
	str r0, [r1]
	ldr r0, [r4]
	ldr r1, [r0, #0x30]
	adds r0, r4, #0
	adds r0, #0xd8
	str r1, [r0]
	ldr r0, [r4]
	ldr r1, [r0, #0x24]
	adds r0, r4, #0
	adds r0, #0xc0
	str r1, [r0]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_0202D95C
	adds r1, r4, #0
	adds r1, #0xdc
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_0208828C
	adds r1, r4, #0
	adds r1, #0xf0
	str r0, [r1]
	adds r0, r4, #0
	ldr r1, _02241460 @ =0x02245D48
	adds r0, #0xbc
	bl FUN_02089D40
	ldr r1, [r4]
	adds r0, r4, #0
	ldr r1, [r1, #0x1c]
	adds r0, #0xbc
	bl FUN_0208AD34
	adds r1, r4, #0
	ldr r0, _02241464 @ =0x02103A1C
	adds r1, #0xbc
	movs r2, #0x3d
	bl FUN_0200724C
	adds r1, r4, #0
	adds r1, #0xb8
	str r0, [r1]
	movs r0, #0x45
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_02241460: .4byte 0x02245D48
_02241464: .4byte 0x02103A1C
	thumb_func_end ov70_022413AC

	thumb_func_start ov70_02241468
ov70_02241468: @ 0x02241468
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r4, #3
	bl FUN_020072A8
	cmp r0, #0
	beq _02241490
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_02007278
	ldr r2, [r5, #0x24]
	adds r0, r5, #0
	movs r1, #5
	bl ov70_02238E50
	movs r4, #4
_02241490:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02241468

	thumb_func_start ov70_02241494
ov70_02241494: @ 0x02241494
	push {r3, lr}
	bl ov70_02238E58
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov70_02241494

	thumb_func_start ov70_022414A0
ov70_022414A0: @ 0x022414A0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3d
	bl FUN_0206DD2C
	ldr r1, _02241640 @ =0x000011F0
	str r0, [r4, r1]
	ldr r0, [r4, #0x24]
	cmp r0, #0xa
	bls _022414B6
	b _02241618
_022414B6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022414C2: @ jump table
	.2byte _02241618 - _022414C2 - 2 @ case 0
	.2byte _02241618 - _022414C2 - 2 @ case 1
	.2byte _02241618 - _022414C2 - 2 @ case 2
	.2byte _02241618 - _022414C2 - 2 @ case 3
	.2byte _02241618 - _022414C2 - 2 @ case 4
	.2byte _02241618 - _022414C2 - 2 @ case 5
	.2byte _02241618 - _022414C2 - 2 @ case 6
	.2byte _022414D8 - _022414C2 - 2 @ case 7
	.2byte _0224151C - _022414C2 - 2 @ case 8
	.2byte _022415B2 - _022414C2 - 2 @ case 9
	.2byte _02241560 - _022414C2 - 2 @ case 10
_022414D8:
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02070DB0
	adds r1, r4, #0
	adds r1, #0xf8
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xfc
	str r1, [r0]
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_0224182C
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r2, [r4, r1]
	subs r0, #0x30
	str r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #3
	subs r0, #0x2c
	str r2, [r4, r0]
	movs r0, #2
	subs r1, #0x28
	str r0, [r4, r1]
	b _02241618
_0224151C:
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02070DB0
	adds r1, r4, #0
	adds r1, #0xfc
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r1, [r0]
	adds r0, r4, #0
	adds r0, #0xf8
	str r1, [r0]
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_0224182C
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r2, [r4, r1]
	subs r0, #0x30
	str r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #3
	subs r0, #0x2c
	str r2, [r4, r0]
	movs r0, #4
	subs r1, #0x28
	str r0, [r4, r1]
	b _02241618
_02241560:
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_02070DB0
	adds r1, r4, #0
	adds r1, #0xfc
	str r0, [r1]
	ldr r0, [r4]
	ldr r1, _02241640 @ =0x000011F0
	ldr r0, [r0]
	ldr r1, [r4, r1]
	bl FUN_0202DB64
	ldr r0, _02241640 @ =0x000011F0
	ldr r0, [r4, r0]
	bl FUN_02070DB0
	adds r1, r4, #0
	adds r1, #0xf8
	str r0, [r1]
	movs r0, #0x4f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov70_0224182C
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r2, [r4, r1]
	subs r0, #0x30
	str r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #3
	subs r0, #0x2c
	str r2, [r4, r0]
	movs r0, #1
	subs r1, #0x28
	str r0, [r4, r1]
	b _02241618
_022415B2:
	ldr r0, [r4]
	ldr r1, [r4, r1]
	ldr r0, [r0]
	bl FUN_0202DB64
	ldr r0, _02241640 @ =0x000011F0
	ldr r0, [r4, r0]
	bl FUN_02070DB0
	adds r1, r4, #0
	adds r1, #0xf8
	str r0, [r1]
	movs r0, #0x26
	lsls r0, r0, #4
	adds r2, r4, r0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #8
	muls r0, r1, r0
	adds r0, r2, r0
	bl FUN_02070DB0
	adds r1, r4, #0
	adds r1, #0xfc
	str r0, [r1]
	movs r0, #0x26
	lsls r0, r0, #4
	adds r2, r4, r0
	movs r0, #0x4b
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	subs r0, #8
	muls r0, r1, r0
	adds r0, r2, r0
	bl ov70_0224182C
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r2, [r4, r1]
	subs r0, #0x30
	str r2, [r4, r0]
	adds r0, r1, #0
	movs r2, #3
	subs r0, #0x2c
	str r2, [r4, r0]
	movs r0, #1
	subs r1, #0x28
	str r0, [r4, r1]
_02241618:
	ldr r0, [r4]
	movs r2, #0x3d
	ldr r1, [r0, #0x24]
	movs r0, #0x43
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r1, r4, #0
	ldr r0, _02241644 @ =0x02245D50
	adds r1, #0xf8
	bl FUN_0200724C
	adds r1, r4, #0
	adds r1, #0xb8
	str r0, [r1]
	movs r0, #0x45
	movs r1, #1
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_02241640: .4byte 0x000011F0
_02241644: .4byte 0x02245D50
	thumb_func_end ov70_022414A0

	thumb_func_start ov70_02241648
ov70_02241648: @ 0x02241648
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	movs r4, #3
	cmp r0, #0
	beq _0224165E
	cmp r0, #1
	bne _0224165C
	b _022417C8
_0224165C:
	b _022417FE
_0224165E:
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_020072A8
	cmp r0, #0
	bne _0224166E
	b _022417FE
_0224166E:
	adds r0, r5, #0
	adds r0, #0xb8
	ldr r0, [r0]
	bl FUN_02007278
	ldr r1, [r5, #0x24]
	cmp r1, #9
	bne _022416E8
	adds r0, r5, #0
	bl ov70_02241868
	movs r1, #6
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	adds r3, r0, #0
	add r0, sp, #0x28
	lsls r3, r3, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #1
	lsrs r3, r3, #0x10
	bl FUN_02070E34
	adds r2, r0, #0
	beq _022416DA
	ldr r3, [r5]
	adds r1, r6, #0
	ldr r0, [r3, #0x38]
	str r0, [sp]
	ldr r0, [r3, #0x10]
	str r0, [sp, #4]
	ldr r0, [r3, #0x2c]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x14]
	movs r0, #0x3d
	str r0, [sp, #0x18]
	ldr r3, [r3, #0x24]
	movs r0, #0
	bl FUN_02075A7C
	movs r1, #0x11
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #1
	str r0, [r5, #0x2c]
	b _022417FE
_022416DA:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r4, #4
	b _022417FE
_022416E8:
	cmp r1, #8
	beq _022416F0
	cmp r1, #0xa
	bne _022417BA
_022416F0:
	adds r0, r5, #0
	bl ov70_02241868
	adds r6, r0, #0
	movs r0, #0x3d
	bl FUN_0206DD2C
	adds r7, r0, #0
	ldr r0, [r5]
	adds r1, r7, #0
	ldr r0, [r0]
	bl FUN_0202DB64
	adds r0, r6, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	bne _02241742
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	movs r1, #0
	str r0, [sp, #0x20]
	adds r0, r7, #0
	adds r2, r1, #0
	bl FUN_0206E540
	ldr r1, [sp, #0x20]
	cmp r1, r0
	beq _022417A6
_02241742:
	adds r0, r6, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	adds r3, r0, #0
	add r0, sp, #0x24
	lsls r3, r3, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	movs r2, #1
	lsrs r3, r3, #0x10
	bl FUN_02070E34
	adds r2, r0, #0
	beq _02241798
	ldr r3, [r5]
	adds r1, r6, #0
	ldr r0, [r3, #0x38]
	str r0, [sp]
	ldr r0, [r3, #0x10]
	str r0, [sp, #4]
	ldr r0, [r3, #0x2c]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0x10]
	movs r0, #4
	str r0, [sp, #0x14]
	movs r0, #0x3d
	str r0, [sp, #0x18]
	ldr r3, [r3, #0x24]
	movs r0, #0
	bl FUN_02075A7C
	movs r1, #0x11
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #1
	str r0, [r5, #0x2c]
	b _022417B2
_02241798:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r4, #4
	b _022417B2
_022417A6:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r4, #4
_022417B2:
	adds r0, r7, #0
	bl FUN_0201AB0C
	b _022417FE
_022417BA:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r4, #4
	b _022417FE
_022417C8:
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02075D3C
	cmp r0, #0
	beq _022417FE
	movs r0, #0x11
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_02075D4C
	adds r0, r5, #0
	bl ov70_022418A4
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02241804 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	adds r0, r5, #0
	movs r1, #7
	movs r2, #0xc
	bl ov70_02238E50
	movs r4, #4
_022417FE:
	adds r0, r4, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02241804: .4byte 0xFFFF1FFF
	thumb_func_end ov70_02241648

	thumb_func_start ov70_02241808
ov70_02241808: @ 0x02241808
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02241828 @ =0x000011F0
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	movs r0, #0x13
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl ov70_02238E58
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_02241828: .4byte 0x000011F0
	thumb_func_end ov70_02241808

	thumb_func_start ov70_0224182C
ov70_0224182C: @ 0x0224182C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x3d
	bl FUN_02028ED0
	adds r4, r0, #0
	bl FUN_02028EF0
	movs r1, #0x43
	lsls r1, r1, #2
	adds r0, r4, #0
	adds r1, r5, r1
	bl FUN_02028F24
	ldr r1, _02241860 @ =0x00000122
	adds r0, r4, #0
	ldrb r1, [r5, r1]
	bl FUN_02029080
	ldr r1, _02241864 @ =0x00000123
	adds r0, r4, #0
	ldrb r1, [r5, r1]
	bl FUN_0202908C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02241860: .4byte 0x00000122
_02241864: .4byte 0x00000123
	thumb_func_end ov70_0224182C

	thumb_func_start ov70_02241868
ov70_02241868: @ 0x02241868
	push {r3, lr}
	cmp r1, #9
	bne _02241882
	movs r1, #0x26
	lsls r1, r1, #4
	adds r2, r0, r1
	movs r1, #0x4b
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	subs r1, #8
	muls r1, r0, r1
	adds r0, r2, r1
	pop {r3, pc}
_02241882:
	cmp r1, #0xa
	bne _0224188E
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r0, r1
	pop {r3, pc}
_0224188E:
	cmp r1, #8
	bne _0224189A
	movs r1, #0x4f
	lsls r1, r1, #2
	adds r0, r0, r1
	pop {r3, pc}
_0224189A:
	bl FUN_0202551C
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov70_02241868

	thumb_func_start ov70_022418A4
ov70_022418A4: @ 0x022418A4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, [r5, #0x24]
	bl ov70_02241868
	movs r2, #0x4d
	lsls r2, r2, #2
	adds r4, r0, #0
	ldr r0, [r5, r2]
	cmp r0, #0x12
	bne _022418D4
	ldr r0, [r5]
	adds r1, r2, #4
	ldr r0, [r0, #8]
	ldr r1, [r5, r1]
	bl FUN_02074644
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_0207188C
	add sp, #8
	pop {r3, r4, r5, pc}
_022418D4:
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, r2]
	adds r2, r2, #4
	ldr r0, [r0, #0xc]
	ldr r2, [r5, r2]
	bl FUN_02073D10
	ldr r0, [r5]
	add r1, sp, #4
	ldr r0, [r0, #0xc]
	add r2, sp, #0
	bl FUN_02073D9C
	adds r0, r4, #0
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5]
	ldr r1, [sp, #4]
	ldr r0, [r0, #0xc]
	bl FUN_02073BFC
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_022418A4

	thumb_func_start ov70_0224190C
ov70_0224190C: @ 0x0224190C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r4, r0, #0
	cmp r1, #6
	bls _02241918
	b _02241DAA
_02241918:
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02241924: @ jump table
	.2byte _02241A58 - _02241924 - 2 @ case 0
	.2byte _02241C60 - _02241924 - 2 @ case 1
	.2byte _02241D00 - _02241924 - 2 @ case 2
	.2byte _02241BB2 - _02241924 - 2 @ case 3
	.2byte _02241932 - _02241924 - 2 @ case 4
	.2byte _022419B2 - _02241924 - 2 @ case 5
	.2byte _02241B06 - _02241924 - 2 @ case 6
_02241932:
	movs r0, #0
	ldr r6, _02241C68 @ =0x02245E0E
	str r0, [sp, #0x28]
	movs r7, #0x30
	adds r5, r0, #0
_0224193C:
	ldrb r0, [r6, #1]
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	adds r1, r1, r5
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [sp, #0x28]
	adds r7, r7, #6
	adds r0, r0, #1
	adds r6, r6, #2
	adds r5, #0x10
	str r0, [sp, #0x28]
	cmp r0, #9
	blt _0224193C
	movs r0, #0x11
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C @ =0x0000012F
	movs r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xe0
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xe0
	bl FUN_0201D978
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_022419B2:
	movs r1, #2
	str r1, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r3, #1
	str r3, [sp, #0xc]
	movs r0, #0x30
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r0, [r4]
	lsls r2, r2, #0x18
	ldr r1, [r4, #4]
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	bl FUN_0201D978
	ldr r6, _02241C70 @ =0x02245E10
	movs r7, #1
	movs r5, #0x10
_022419E0:
	subs r0, r6, #1
	ldrb r0, [r0]
	subs r3, r6, #2
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	subs r0, r7, #1
	lsls r0, r0, #2
	adds r0, #0x36
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldrb r3, [r3]
	ldr r0, [r4]
	adds r1, r1, r5
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, r0, r5
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, r6, #2
	adds r5, #0x10
	cmp r7, #4
	blt _022419E0
	movs r0, #0x11
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C @ =0x0000012F
	movs r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xe0
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xe0
	bl FUN_0201D978
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241A58:
	movs r0, #0
	ldr r6, _02241C74 @ =0x02245DA2
	str r0, [sp, #0x14]
	movs r7, #0x30
	adds r5, r0, #0
_02241A62:
	ldrb r0, [r6, #1]
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	adds r1, r1, r5
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	adds r7, #0x10
	adds r0, r0, #1
	adds r6, r6, #3
	adds r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02241A62
	movs r0, #0xe
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x70
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0x40
	lsrs r2, r2, #0x18
	movs r3, #6
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0x40
	bl FUN_0201D978
	movs r0, #0x11
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C @ =0x0000012F
	movs r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xe0
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xe0
	bl FUN_0201D978
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241B06:
	movs r0, #0
	ldr r6, _02241C68 @ =0x02245E0E
	str r0, [sp, #0x18]
	movs r7, #0x30
	adds r5, r0, #0
_02241B10:
	ldrb r0, [r6, #1]
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	adds r1, r1, r5
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [sp, #0x18]
	adds r7, r7, #6
	adds r0, r0, #1
	adds r6, r6, #2
	adds r5, #0x10
	str r0, [sp, #0x18]
	cmp r0, #9
	blt _02241B10
	movs r0, #0x11
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C @ =0x0000012F
	movs r3, #9
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xe0
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xe0
	bl FUN_0201D978
	movs r3, #2
	str r3, [sp]
	movs r0, #9
	str r0, [sp, #4]
	str r3, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x66
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xf0
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xf0
	bl FUN_0201D978
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241BB2:
	movs r0, #0
	ldr r6, _02241C78 @ =0x02245D96
	str r0, [sp, #0x1c]
	movs r7, #0x30
	adds r5, r0, #0
_02241BBC:
	ldrb r0, [r6, #1]
	str r0, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	adds r1, r1, r5
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [sp, #0x1c]
	adds r7, #0x2e
	adds r0, r0, #1
	adds r6, r6, #2
	adds r5, #0x10
	str r0, [sp, #0x1c]
	cmp r0, #5
	blt _02241BBC
	movs r0, #0x10
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _02241C7C @ =0x00000116
	movs r3, #0xd
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0x50
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0x50
	bl FUN_0201D978
	movs r0, #0x11
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldr r0, _02241C6C @ =0x0000012F
	movs r3, #0x18
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xe0
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xe0
	bl FUN_0201D978
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241C60:
	movs r0, #0
	ldr r6, _02241C80 @ =0x02245D60
	b _02241C84
	nop
_02241C68: .4byte 0x02245E0E
_02241C6C: .4byte 0x0000012F
_02241C70: .4byte 0x02245E10
_02241C74: .4byte 0x02245DA2
_02241C78: .4byte 0x02245D96
_02241C7C: .4byte 0x00000116
_02241C80: .4byte 0x02245D60
_02241C84:
	str r0, [sp, #0x20]
	movs r7, #0x30
	adds r5, r0, #0
_02241C8A:
	ldrb r0, [r6, #1]
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	adds r1, r1, r5
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [sp, #0x20]
	adds r7, #0x10
	adds r0, r0, #1
	adds r6, r6, #2
	adds r5, #0x10
	str r0, [sp, #0x20]
	cmp r0, #3
	blt _02241C8A
	movs r0, #0x11
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0x60
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xe0
	lsrs r2, r2, #0x18
	movs r3, #9
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xe0
	bl FUN_0201D978
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02241D00:
	movs r0, #0
	ldr r6, _02241DB0 @ =0x02245D6E
	str r0, [sp, #0x24]
	movs r7, #0x30
	adds r5, r0, #0
_02241D0A:
	ldrb r0, [r6, #1]
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldrb r3, [r6]
	ldr r0, [r4]
	adds r1, r1, r5
	lsrs r2, r2, #0x18
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [sp, #0x24]
	adds r7, #0x16
	adds r0, r0, #1
	adds r6, r6, #2
	adds r5, #0x10
	str r0, [sp, #0x24]
	cmp r0, #4
	blt _02241D0A
	movs r0, #0xe
	str r0, [sp]
	movs r0, #5
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x88
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0x40
	lsrs r2, r2, #0x18
	movs r3, #6
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0x40
	bl FUN_0201D978
	movs r0, #0x11
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	movs r0, #0xa1
	str r0, [sp, #0x10]
	ldr r2, [r4, #0x54]
	ldr r1, [r4, #4]
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r1, #0xe0
	lsrs r2, r2, #0x18
	movs r3, #9
	bl FUN_0201D40C
	ldr r0, [r4, #4]
	movs r1, #0x22
	adds r0, #0xe0
	bl FUN_0201D978
_02241DAA:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02241DB0: .4byte 0x02245D6E
	thumb_func_end ov70_0224190C

	thumb_func_start ov70_02241DB4
ov70_02241DB4: @ 0x02241DB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r2, sp, #0x10
	adds r5, r1, #0
	ldr r0, [r4, #0x1c]
	movs r1, #0
	adds r2, #1
	add r3, sp, #0x10
	bl FUN_02019B1C
	cmp r5, #6
	bls _02241DD0
	b _02242010
_02241DD0:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02241DDC: @ jump table
	.2byte _02241EA6 - _02241DDC - 2 @ case 0
	.2byte _02241FD4 - _02241DDC - 2 @ case 1
	.2byte _02241FF4 - _02241DDC - 2 @ case 2
	.2byte _02241F6A - _02241DDC - 2 @ case 3
	.2byte _02241DEA - _02241DDC - 2 @ case 4
	.2byte _02241E48 - _02241DDC - 2 @ case 5
	.2byte _02241F04 - _02241DDC - 2 @ case 6
_02241DEA:
	movs r6, #0
	adds r5, r6, #0
	movs r7, #0x22
_02241DF0:
	ldr r0, [r4, #4]
	adds r1, r7, #0
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D8A0
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #9
	blt _02241DF0
	add r0, sp, #0x10
	movs r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241E3C
	str r1, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #2
	movs r2, #5
	movs r3, #0x11
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BF7C
_02241E3C:
	ldr r0, [r4, #4]
	adds r0, #0xe0
	bl FUN_0201D520
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241E48:
	movs r6, #0
	adds r5, r6, #0
	movs r7, #0x22
_02241E4E:
	ldr r0, [r4, #4]
	adds r1, r7, #0
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D8A0
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #4
	blt _02241E4E
	add r0, sp, #0x10
	movs r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241E9A
	str r1, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #2
	movs r2, #5
	movs r3, #0x11
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BF7C
_02241E9A:
	ldr r0, [r4, #4]
	adds r0, #0xe0
	bl FUN_0201D520
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241EA6:
	movs r6, #0
	adds r5, r6, #0
	movs r7, #0x22
_02241EAC:
	ldr r0, [r4, #4]
	adds r1, r7, #0
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D8A0
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #5
	blt _02241EAC
	add r0, sp, #0x10
	movs r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241EF8
	str r1, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #2
	movs r2, #5
	movs r3, #0x11
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BF7C
_02241EF8:
	ldr r0, [r4, #4]
	adds r0, #0xe0
	bl FUN_0201D520
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241F04:
	movs r6, #0
	adds r5, r6, #0
	movs r7, #0x22
_02241F0A:
	ldr r0, [r4, #4]
	adds r1, r7, #0
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D8A0
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #9
	blt _02241F0A
	add r0, sp, #0x10
	movs r1, #1
	ldrsb r0, [r0, r1]
	cmp r0, #0x10
	bne _02241F56
	str r1, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #2
	movs r2, #5
	movs r3, #0x11
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BF7C
_02241F56:
	ldr r0, [r4, #4]
	adds r0, #0xe0
	bl FUN_0201D520
	ldr r0, [r4, #4]
	adds r0, #0xf0
	bl FUN_0201D520
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241F6A:
	movs r6, #0
	adds r5, r6, #0
	movs r7, #0x22
_02241F70:
	ldr r0, [r4, #4]
	adds r1, r7, #0
	adds r0, r0, r5
	bl FUN_0201D978
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D8A0
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #6
	blt _02241F70
	add r0, sp, #0x10
	movs r1, #1
	ldrsb r0, [r0, r1]
	subs r0, #0x10
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02241FC8
	str r1, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0xf
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #2
	movs r2, #5
	movs r3, #0x12
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BF7C
_02241FC8:
	ldr r0, [r4, #4]
	adds r0, #0xe0
	bl FUN_0201D520
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241FD4:
	movs r6, #0
	adds r5, r6, #0
_02241FD8:
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #3
	blt _02241FD8
	ldr r0, [r4, #4]
	adds r0, #0xe0
	bl FUN_0201D520
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02241FF4:
	movs r6, #0
	adds r5, r6, #0
_02241FF8:
	ldr r0, [r4, #4]
	adds r0, r0, r5
	bl FUN_0201D520
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, #5
	blt _02241FF8
	ldr r0, [r4, #4]
	adds r0, #0xe0
	bl FUN_0201D520
_02242010:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov70_02241DB4

	thumb_func_start ov70_02242014
ov70_02242014: @ 0x02242014
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x3d
	movs r1, #0x80
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r0, [r5]
	movs r1, #0
	str r0, [r4]
	ldr r0, [r5, #4]
	movs r2, #1
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	movs r3, #0x3d
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x10]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x20]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x2c]
	ldr r0, [r5, #0x28]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x30]
	str r6, [r4, #0x54]
	str r7, [r4, #0x60]
	strh r1, [r4, #0x3c]
	adds r0, r4, #0
	strh r1, [r4, #0x3e]
	adds r0, #0x40
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x42
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x45
	strb r1, [r0]
	adds r0, r4, #0
	str r1, [r4, #0x48]
	adds r0, #0x7e
	strb r1, [r0]
	str r1, [r4, #0x4c]
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201956C
	str r0, [r4, #0x1c]
	movs r0, #0x14
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #2
	movs r3, #0x20
	bl FUN_020195F4
	ldr r0, [r4, #0xc]
	movs r1, #0x88
	movs r2, #0x28
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	movs r1, #0x2f
	bl FUN_020248F0
	movs r0, #0xf
	movs r1, #0xe
	movs r2, #2
	movs r3, #0x3d
	bl FUN_0200CC74
	str r0, [r4, #0x38]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov70_02242014

	thumb_func_start ov70_022420C4
ov70_022420C4: @ 0x022420C4
	adds r2, r0, #0
	adds r2, #0x58
	strh r1, [r2]
	cmp r1, #3
	bhi _02242128
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022420DA: @ jump table
	.2byte _022420E2 - _022420DA - 2 @ case 0
	.2byte _0224210A - _022420DA - 2 @ case 1
	.2byte _0224211A - _022420DA - 2 @ case 2
	.2byte _022420F6 - _022420DA - 2 @ case 3
_022420E2:
	movs r2, #0
	adds r1, r0, #0
	str r2, [r0, #0x48]
	adds r1, #0x7e
	strb r2, [r1]
	strh r2, [r0, #0x3c]
	strh r2, [r0, #0x3e]
	movs r1, #4
	str r1, [r0, #0x4c]
	bx lr
_022420F6:
	movs r2, #0
	adds r1, r0, #0
	str r2, [r0, #0x48]
	adds r1, #0x7e
	strb r2, [r1]
	strh r2, [r0, #0x3c]
	strh r2, [r0, #0x3e]
	movs r1, #0x10
	str r1, [r0, #0x4c]
	bx lr
_0224210A:
	movs r2, #0
	adds r1, r0, #0
	str r2, [r0, #0x48]
	adds r1, #0x7e
	strb r2, [r1]
	movs r1, #0x1c
	str r1, [r0, #0x4c]
	bx lr
_0224211A:
	movs r2, #0
	adds r1, r0, #0
	str r2, [r0, #0x48]
	adds r1, #0x7e
	strb r2, [r1]
	movs r1, #0x1f
	str r1, [r0, #0x4c]
_02242128:
	bx lr
	.align 2, 0
	thumb_func_end ov70_022420C4

	thumb_func_start ov70_0224212C
ov70_0224212C: @ 0x0224212C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	bl FUN_0200CD94
	ldr r0, [r4, #0x1c]
	bl FUN_020195C0
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov70_0224212C

	thumb_func_start ov70_02242144
ov70_02242144: @ 0x02242144
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x4c]
	lsls r2, r1, #2
	ldr r1, _02242160 @ =0x022466F8
	ldr r1, [r1, r2]
	blx r1
	adds r5, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_02019934
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	nop
_02242160: .4byte 0x022466F8
	thumb_func_end ov70_02242144

	thumb_func_start ov70_02242164
ov70_02242164: @ 0x02242164
	push {r3, lr}
	cmp r1, #7
	bhi _022421B4
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02242176: @ jump table
	.2byte _02242196 - _02242176 - 2 @ case 0
	.2byte _0224219E - _02242176 - 2 @ case 1
	.2byte _02242196 - _02242176 - 2 @ case 2
	.2byte _022421A6 - _02242176 - 2 @ case 3
	.2byte _02242186 - _02242176 - 2 @ case 4
	.2byte _022421AE - _02242176 - 2 @ case 5
	.2byte _0224218E - _02242176 - 2 @ case 6
	.2byte _022421AE - _02242176 - 2 @ case 7
_02242186:
	ldr r0, _022421B8 @ =0x02245ED0
	bl FUN_02025224
	pop {r3, pc}
_0224218E:
	ldr r0, _022421BC @ =0x02245F28
	bl FUN_02025224
	pop {r3, pc}
_02242196:
	ldr r0, _022421C0 @ =0x02245E3E
	bl FUN_02025224
	pop {r3, pc}
_0224219E:
	ldr r0, _022421C4 @ =0x02245DD0
	bl FUN_02025224
	pop {r3, pc}
_022421A6:
	ldr r0, _022421C8 @ =0x02245E5E
	bl FUN_02025224
	pop {r3, pc}
_022421AE:
	ldr r0, _022421CC @ =0x02245DE4
	bl FUN_02025224
_022421B4:
	pop {r3, pc}
	nop
_022421B8: .4byte 0x02245ED0
_022421BC: .4byte 0x02245F28
_022421C0: .4byte 0x02245E3E
_022421C4: .4byte 0x02245DD0
_022421C8: .4byte 0x02245E5E
_022421CC: .4byte 0x02245DE4
	thumb_func_end ov70_02242164

	thumb_func_start ov70_022421D0
ov70_022421D0: @ 0x022421D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x48]
	cmp r1, #9
	bge _022421E0
	adds r0, #0x7e
	strb r1, [r0]
_022421E0:
	ldr r0, _02242344 @ =0x021D110C
	movs r2, #0x40
	ldr r0, [r0, #0x4c]
	tst r2, r0
	beq _022421F6
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _02242348 @ =0x02245EA8
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _0224222A
_022421F6:
	movs r2, #0x80
	tst r2, r0
	beq _02242208
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _0224234C @ =0x02245EA9
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _0224222A
_02242208:
	movs r2, #0x20
	tst r2, r0
	beq _0224221A
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _02242350 @ =0x02245EAA
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _0224222A
_0224221A:
	movs r2, #0x10
	tst r0, r2
	beq _0224222A
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _02242354 @ =0x02245EAB
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
_0224222A:
	cmp r1, #9
	blt _02242282
	ldr r0, [r5, #0x48]
	cmp r0, #9
	bge _02242282
	ldr r0, _02242344 @ =0x021D110C
	ldr r2, [r0, #0x4c]
	movs r0, #0x40
	tst r0, r2
	beq _02242260
	adds r0, r5, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	adds r0, r0, #4
	cmp r0, #9
	bge _02242282
	adds r0, r5, #0
	adds r0, #0x48
_02242250:
	ldr r2, [r0]
	adds r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	adds r2, r2, #4
	cmp r2, #9
	blt _02242250
	b _02242282
_02242260:
	movs r0, #0x80
	tst r0, r2
	beq _02242282
	adds r0, r5, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	subs r0, r0, #4
	bmi _02242282
	adds r0, r5, #0
	adds r0, #0x48
_02242276:
	ldr r2, [r0]
	subs r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	subs r2, r2, #4
	bpl _02242276
_02242282:
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _022422BC
	ldr r0, _02242358 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	ldr r1, _0224235C @ =0x02245E26
	lsls r2, r0, #1
	ldrb r1, [r1, r2]
	ldr r3, _02242360 @ =0x02245E27
	ldr r0, [r5, #0xc]
	ldrb r2, [r3, r2]
	adds r1, #0x10
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #9
	ldr r0, [r5, #0xc]
	bne _022422B6
	movs r1, #0x30
	bl FUN_020248F0
	b _022422BC
_022422B6:
	movs r1, #0x3d
	bl FUN_020248F0
_022422BC:
	adds r0, r5, #0
	movs r1, #4
	bl ov70_02242164
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _022422F8
	cmp r6, #9
	bne _022422DE
	ldr r0, _02242358 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r4, r5, r6, pc}
_022422DE:
	blo _022422E4
	bl FUN_0202551C
_022422E4:
	cmp r4, #0
	beq _022422EE
	ldrb r0, [r4, r6]
	cmp r0, #0
	beq _0224233C
_022422EE:
	ldr r0, _02242358 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_022422F8:
	ldr r0, _02242344 @ =0x021D110C
	ldr r2, [r0, #0x48]
	movs r0, #1
	adds r1, r2, #0
	tst r1, r0
	beq _0224232A
	ldr r1, [r5, #0x48]
	cmp r1, #9
	bne _0224230E
	subs r0, r0, #3
	pop {r4, r5, r6, pc}
_0224230E:
	blt _02242314
	bl FUN_0202551C
_02242314:
	cmp r4, #0
	beq _02242320
	ldr r0, [r5, #0x48]
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0224233C
_02242320:
	ldr r0, _02242358 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	pop {r4, r5, r6, pc}
_0224232A:
	movs r0, #2
	tst r0, r2
	beq _0224233C
	ldr r0, _02242358 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r4, r5, r6, pc}
_0224233C:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
	nop
_02242344: .4byte 0x021D110C
_02242348: .4byte 0x02245EA8
_0224234C: .4byte 0x02245EA9
_02242350: .4byte 0x02245EAA
_02242354: .4byte 0x02245EAB
_02242358: .4byte 0x000005DC
_0224235C: .4byte 0x02245E26
_02242360: .4byte 0x02245E27
	thumb_func_end ov70_022421D0

	thumb_func_start ov70_02242364
ov70_02242364: @ 0x02242364
	cmp r1, #3
	beq _02242386
	movs r2, #0x3c
	ldrsh r0, [r0, r2]
	cmp r0, #8
	bgt _02242382
	lsls r3, r0, #3
	ldr r0, _0224238C @ =0x02245F5C
	ldr r0, [r0, r3]
	cmp r1, r0
	blt _0224237E
	adds r1, r2, #0
	subs r1, #0x3d
_0224237E:
	adds r0, r1, #0
	bx lr
_02242382:
	adds r0, r1, #0
	bx lr
_02242386:
	movs r0, #1
	mvns r0, r0
	bx lr
	.align 2, 0
_0224238C: .4byte 0x02245F5C
	thumb_func_end ov70_02242364

	thumb_func_start ov70_02242390
ov70_02242390: @ 0x02242390
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x48]
	cmp r1, #3
	bge _022423A0
	adds r0, #0x7e
	strb r1, [r0]
_022423A0:
	ldr r0, _022424E4 @ =0x021D110C
	movs r2, #0x40
	ldr r0, [r0, #0x4c]
	tst r2, r0
	beq _022423B6
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _022424E8 @ =0x02245DC0
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _022423EA
_022423B6:
	movs r2, #0x80
	tst r2, r0
	beq _022423C8
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _022424EC @ =0x02245DC1
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _022423EA
_022423C8:
	movs r2, #0x20
	tst r2, r0
	beq _022423DA
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _022424F0 @ =0x02245DC2
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _022423EA
_022423DA:
	movs r2, #0x10
	tst r0, r2
	beq _022423EA
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _022424F4 @ =0x02245DC3
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
_022423EA:
	cmp r1, #3
	bne _022423FC
	ldr r0, [r5, #0x48]
	cmp r0, #3
	bge _022423FC
	adds r0, r5, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
_022423FC:
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _02242440
	ldr r0, _022424F8 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	cmp r0, #3
	bne _02242422
	ldr r0, [r5, #0xc]
	movs r1, #0xc0
	movs r2, #0x88
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	movs r1, #0x30
	bl FUN_020248F0
	b _02242440
_02242422:
	ldr r1, _022424FC @ =0x02245E26
	lsls r2, r0, #1
	ldrb r1, [r1, r2]
	ldr r3, _02242500 @ =0x02245E27
	ldr r0, [r5, #0xc]
	ldrb r2, [r3, r2]
	adds r1, #0x10
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	movs r1, #0x2f
	bl FUN_020248F0
_02242440:
	adds r0, r5, #0
	movs r1, #5
	bl ov70_02242164
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _02242488
	adds r0, r5, #0
	bl ov70_02242364
	movs r1, #0
	adds r6, r0, #0
	mvns r1, r1
	cmp r6, r1
	beq _022424E0
	subs r0, r1, #1
	cmp r6, r0
	beq _0224247E
	cmp r4, #0
	beq _0224247E
	movs r0, #0x3c
	ldrsh r0, [r5, r0]
	lsls r1, r0, #2
	ldr r0, _02242504 @ =0x02245E84
	ldr r1, [r0, r1]
	adds r0, r4, r6
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _022424DC
_0224247E:
	ldr r0, _022424F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_02242488:
	ldr r0, _022424E4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _022424CA
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov70_02242364
	movs r1, #0
	adds r6, r0, #0
	mvns r1, r1
	cmp r6, r1
	beq _022424E0
	subs r0, r1, #1
	cmp r6, r0
	beq _022424C0
	cmp r4, #0
	beq _022424C0
	movs r0, #0x3c
	ldrsh r0, [r5, r0]
	lsls r1, r0, #2
	ldr r0, _02242504 @ =0x02245E84
	ldr r1, [r0, r1]
	adds r0, r4, r6
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _022424DC
_022424C0:
	ldr r0, _022424F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
_022424CA:
	movs r0, #2
	tst r0, r1
	beq _022424DC
	ldr r0, _022424F8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r4, r5, r6, pc}
_022424DC:
	movs r0, #0
	mvns r0, r0
_022424E0:
	pop {r4, r5, r6, pc}
	nop
_022424E4: .4byte 0x021D110C
_022424E8: .4byte 0x02245DC0
_022424EC: .4byte 0x02245DC1
_022424F0: .4byte 0x02245DC2
_022424F4: .4byte 0x02245DC3
_022424F8: .4byte 0x000005DC
_022424FC: .4byte 0x02245E26
_02242500: .4byte 0x02245E27
_02242504: .4byte 0x02245E84
	thumb_func_end ov70_02242390

	thumb_func_start ov70_02242508
ov70_02242508: @ 0x02242508
	push {r3, lr}
	cmp r0, #0
	bne _02242512
	movs r0, #1
	pop {r3, pc}
_02242512:
	subs r2, r1, #1
	adds r0, r0, r2
	blx FUN_020F2998
	pop {r3, pc}
	thumb_func_end ov70_02242508

	thumb_func_start ov70_0224251C
ov70_0224251C: @ 0x0224251C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #4
	beq _0224252E
	cmp r1, #5
	beq _02242534
	cmp r1, #6
	beq _02242542
	b _0224254E
_0224252E:
	movs r0, #1
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02242534:
	movs r1, #0
	mvns r1, r1
	bl ov70_02242574
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02242542:
	movs r1, #1
	bl ov70_02242574
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_0224254E:
	movs r0, #0x5a
	ldrsh r2, [r5, r0]
	lsls r2, r2, #2
	adds r4, r1, r2
	ldr r1, [r5, #0x5c]
	cmp r4, r1
	bge _0224256C
	ldr r0, _02242570 @ =0x000005DC
	bl FUN_0200604C
	ldr r1, [r5, #0x34]
	lsls r0, r4, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_0224256C:
	subs r0, #0x5b
	pop {r3, r4, r5, pc}
	.align 2, 0
_02242570: .4byte 0x000005DC
	thumb_func_end ov70_0224251C

	thumb_func_start ov70_02242574
ov70_02242574: @ 0x02242574
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	adds r6, r1, #0
	movs r1, #4
	bl ov70_02242508
	subs r4, r0, #1
	beq _02242616
	cmp r6, #0
	bge _022425BE
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r5, #0x14]
	movs r1, #0x27
	bl FUN_020248F0
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, #0
	beq _022425B6
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	b _022425F0
_022425B6:
	adds r0, r5, #0
	adds r0, #0x5a
	strh r4, [r0]
	b _022425F0
_022425BE:
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r5, #0x10]
	movs r1, #0x26
	bl FUN_020248F0
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, r4
	bge _022425E8
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	b _022425F0
_022425E8:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x5a
	strh r1, [r0]
_022425F0:
	movs r1, #0x5a
	ldrsh r1, [r5, r1]
	ldr r2, [r5, #0x5c]
	adds r0, r5, #0
	bl ov70_022434C0
	ldr r0, [r5, #0x5c]
	movs r1, #4
	bl ov70_02242508
	str r0, [sp]
	movs r3, #0x5a
	ldr r2, [r5, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x38]
	adds r2, #0x40
	bl ov70_02243F00
_02242616:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_02242574

	thumb_func_start ov70_0224261C
ov70_0224261C: @ 0x0224261C
	push {r3, r4, r5, lr}
	ldr r1, _022426E4 @ =0x021D110C
	adds r5, r0, #0
	ldr r2, [r1, #0x4c]
	movs r1, #0x40
	ldr r4, [r5, #0x48]
	tst r1, r2
	beq _0224263C
	cmp r4, #0
	beq _02242636
	subs r0, r4, #1
	str r0, [r5, #0x48]
	b _0224266E
_02242636:
	movs r0, #4
	str r0, [r5, #0x48]
	b _0224266E
_0224263C:
	movs r1, #0x80
	tst r1, r2
	beq _02242652
	cmp r4, #4
	beq _0224264C
	adds r0, r4, #1
	str r0, [r5, #0x48]
	b _0224266E
_0224264C:
	movs r0, #0
	str r0, [r5, #0x48]
	b _0224266E
_02242652:
	movs r1, #0x20
	adds r3, r2, #0
	tst r3, r1
	beq _02242662
	subs r1, #0x21
	bl ov70_02242574
	b _0224266E
_02242662:
	movs r1, #0x10
	tst r1, r2
	beq _0224266E
	movs r1, #1
	bl ov70_02242574
_0224266E:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _022426A2
	ldr r0, _022426E8 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	ldr r1, _022426EC @ =0x02245D76
	lsls r3, r0, #1
	ldr r2, _022426F0 @ =0x02245D77
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #4
	ldr r0, [r5, #0xc]
	bne _0224269C
	movs r1, #0x30
	bl FUN_020248F0
	b _022426A2
_0224269C:
	movs r1, #0x31
	bl FUN_020248F0
_022426A2:
	adds r0, r5, #0
	movs r1, #0
	bl ov70_02242164
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _022426BC
	adds r0, r5, #0
	bl ov70_0224251C
	pop {r3, r4, r5, pc}
_022426BC:
	ldr r1, _022426E4 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #1
	tst r1, r2
	beq _022426D0
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov70_0224251C
	pop {r3, r4, r5, pc}
_022426D0:
	movs r1, #2
	tst r1, r2
	beq _022426E0
	ldr r0, _022426E8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
_022426E0:
	pop {r3, r4, r5, pc}
	nop
_022426E4: .4byte 0x021D110C
_022426E8: .4byte 0x000005DC
_022426EC: .4byte 0x02245D76
_022426F0: .4byte 0x02245D77
	thumb_func_end ov70_0224261C

	thumb_func_start ov70_022426F4
ov70_022426F4: @ 0x022426F4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _022427B0 @ =0x021D110C
	ldr r4, [r5, #0x48]
	ldr r1, [r0, #0x4c]
	movs r0, #0x40
	tst r0, r1
	beq _0224271C
	ldr r0, _022427B4 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _02242716
	subs r0, r0, #1
	str r0, [r5, #0x48]
	b _02242738
_02242716:
	movs r0, #3
	str r0, [r5, #0x48]
	b _02242738
_0224271C:
	movs r0, #0x80
	tst r0, r1
	beq _02242738
	ldr r0, _022427B4 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	cmp r0, #3
	beq _02242734
	adds r0, r0, #1
	str r0, [r5, #0x48]
	b _02242738
_02242734:
	movs r0, #0
	str r0, [r5, #0x48]
_02242738:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _02242764
	ldr r1, _022427B8 @ =0x02245D66
	lsls r3, r0, #1
	ldr r2, _022427BC @ =0x02245D67
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #3
	ldr r0, [r5, #0xc]
	bne _0224275E
	movs r1, #0x30
	bl FUN_020248F0
	b _02242764
_0224275E:
	movs r1, #0x31
	bl FUN_020248F0
_02242764:
	adds r0, r5, #0
	movs r1, #1
	bl ov70_02242164
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	beq _02242784
	ldr r0, _022427B4 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _022427C0 @ =0x02245DB0
	lsls r1, r4, #2
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_02242784:
	ldr r1, _022427B0 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #1
	tst r1, r2
	beq _0224279E
	ldr r0, _022427B4 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	lsls r1, r0, #2
	ldr r0, _022427C0 @ =0x02245DB0
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_0224279E:
	movs r1, #2
	tst r1, r2
	beq _022427AE
	ldr r0, _022427B4 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
_022427AE:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022427B0: .4byte 0x021D110C
_022427B4: .4byte 0x000005DC
_022427B8: .4byte 0x02245D66
_022427BC: .4byte 0x02245D67
_022427C0: .4byte 0x02245DB0
	thumb_func_end ov70_022426F4

	thumb_func_start ov70_022427C4
ov70_022427C4: @ 0x022427C4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	cmp r1, #0
	bge _02242802
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r4, #0x14]
	movs r1, #0x27
	bl FUN_020248F0
	movs r0, #0x5a
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _022427F8
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x5a
	strh r1, [r0]
	b _02242834
_022427F8:
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x5a
	strh r1, [r0]
	b _02242834
_02242802:
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r4, #0x10]
	movs r1, #0x26
	bl FUN_020248F0
	movs r0, #0x5a
	ldrsh r0, [r4, r0]
	cmp r0, #2
	bge _0224282C
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x5a
	strh r1, [r0]
	b _02242834
_0224282C:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x5a
	strh r1, [r0]
_02242834:
	movs r1, #0x5a
	ldrsh r1, [r4, r1]
	ldr r2, [r4, #0x5c]
	adds r0, r4, #0
	bl ov70_022434C0
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl ov70_02242508
	str r0, [sp]
	movs r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	adds r2, #0x40
	bl ov70_02243F00
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov70_022427C4

	thumb_func_start ov70_02242860
ov70_02242860: @ 0x02242860
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #4
	beq _02242874
	cmp r4, #5
	beq _02242880
	cmp r4, #6
	beq _0224288E
	b _0224289A
_02242874:
	ldr r0, _022428BC @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02242880:
	movs r1, #0
	mvns r1, r1
	bl ov70_022427C4
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_0224288E:
	movs r1, #1
	bl ov70_022427C4
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_0224289A:
	movs r0, #0x5a
	ldrsh r1, [r5, r0]
	lsls r1, r1, #2
	adds r2, r4, r1
	ldr r1, [r5, #0x5c]
	cmp r2, r1
	bge _022428B8
	ldr r0, _022428BC @ =0x000005DC
	bl FUN_0200604C
	ldr r1, [r5, #0x34]
	lsls r0, r4, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_022428B8:
	subs r0, #0x5b
	pop {r3, r4, r5, pc}
	.align 2, 0
_022428BC: .4byte 0x000005DC
	thumb_func_end ov70_02242860

	thumb_func_start ov70_022428C0
ov70_022428C0: @ 0x022428C0
	push {r3, r4, r5, lr}
	ldr r1, _02242990 @ =0x021D110C
	adds r5, r0, #0
	ldr r2, [r1, #0x4c]
	movs r1, #0x40
	ldr r4, [r5, #0x48]
	tst r1, r2
	beq _022428E8
	ldr r0, _02242994 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _022428E2
	subs r0, r0, #1
	str r0, [r5, #0x48]
	b _02242922
_022428E2:
	movs r0, #4
	str r0, [r5, #0x48]
	b _02242922
_022428E8:
	movs r1, #0x80
	tst r1, r2
	beq _02242906
	ldr r0, _02242994 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	cmp r0, #4
	beq _02242900
	adds r0, r0, #1
	str r0, [r5, #0x48]
	b _02242922
_02242900:
	movs r0, #0
	str r0, [r5, #0x48]
	b _02242922
_02242906:
	movs r1, #0x20
	adds r3, r2, #0
	tst r3, r1
	beq _02242916
	subs r1, #0x21
	bl ov70_022427C4
	b _02242922
_02242916:
	movs r1, #0x10
	tst r1, r2
	beq _02242922
	movs r1, #1
	bl ov70_022427C4
_02242922:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _0224294E
	ldr r1, _02242998 @ =0x02245D80
	lsls r3, r0, #1
	ldr r2, _0224299C @ =0x02245D81
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #4
	ldr r0, [r5, #0xc]
	bne _02242948
	movs r1, #0x30
	bl FUN_020248F0
	b _0224294E
_02242948:
	movs r1, #0x31
	bl FUN_020248F0
_0224294E:
	adds r0, r5, #0
	movs r1, #2
	bl ov70_02242164
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _02242968
	adds r0, r5, #0
	bl ov70_02242860
	pop {r3, r4, r5, pc}
_02242968:
	ldr r1, _02242990 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #1
	tst r1, r2
	beq _0224297C
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov70_02242860
	pop {r3, r4, r5, pc}
_0224297C:
	movs r1, #2
	tst r1, r2
	beq _0224298C
	ldr r0, _02242994 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
_0224298C:
	pop {r3, r4, r5, pc}
	nop
_02242990: .4byte 0x021D110C
_02242994: .4byte 0x000005DC
_02242998: .4byte 0x02245D80
_0224299C: .4byte 0x02245D81
	thumb_func_end ov70_022428C0

	thumb_func_start ov70_022429A0
ov70_022429A0: @ 0x022429A0
	cmp r1, #9
	beq _022429AA
	cmp r1, #0xa
	beq _022429B0
	b _022429B4
_022429AA:
	movs r0, #1
	mvns r0, r0
	bx lr
_022429B0:
	movs r0, #0xa
	bx lr
_022429B4:
	adds r0, r1, #0
	bx lr
	thumb_func_end ov70_022429A0

	thumb_func_start ov70_022429B8
ov70_022429B8: @ 0x022429B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x48]
	cmp r1, #9
	bge _022429C8
	adds r0, #0x7e
	strb r1, [r0]
_022429C8:
	ldr r0, _02242B3C @ =0x021D110C
	movs r2, #0x40
	ldr r0, [r0, #0x4c]
	tst r2, r0
	beq _022429DE
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _02242B40 @ =0x02245EFC
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _02242A12
_022429DE:
	movs r2, #0x80
	tst r2, r0
	beq _022429F0
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _02242B44 @ =0x02245EFD
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _02242A12
_022429F0:
	movs r2, #0x20
	tst r2, r0
	beq _02242A02
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _02242B48 @ =0x02245EFE
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
	b _02242A12
_02242A02:
	movs r2, #0x10
	tst r0, r2
	beq _02242A12
	ldr r0, [r5, #0x48]
	lsls r2, r0, #2
	ldr r0, _02242B4C @ =0x02245EFF
	ldrb r0, [r0, r2]
	str r0, [r5, #0x48]
_02242A12:
	cmp r1, #9
	blt _02242A6A
	ldr r0, [r5, #0x48]
	cmp r0, #9
	bge _02242A6A
	ldr r0, _02242B3C @ =0x021D110C
	ldr r2, [r0, #0x4c]
	movs r0, #0x40
	tst r0, r2
	beq _02242A48
	adds r0, r5, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	adds r0, r0, #4
	cmp r0, #9
	bge _02242A6A
	adds r0, r5, #0
	adds r0, #0x48
_02242A38:
	ldr r2, [r0]
	adds r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	adds r2, r2, #4
	cmp r2, #9
	blt _02242A38
	b _02242A6A
_02242A48:
	movs r0, #0x80
	tst r0, r2
	beq _02242A6A
	adds r0, r5, #0
	adds r0, #0x7e
	ldrb r0, [r0]
	str r0, [r5, #0x48]
	subs r0, r0, #4
	bmi _02242A6A
	adds r0, r5, #0
	adds r0, #0x48
_02242A5E:
	ldr r2, [r0]
	subs r2, r2, #4
	str r2, [r0]
	ldr r2, [r5, #0x48]
	subs r2, r2, #4
	bpl _02242A5E
_02242A6A:
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _02242AB6
	ldr r0, _02242B50 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	ldr r1, _02242B54 @ =0x02245DF8
	lsls r2, r0, #1
	ldrb r1, [r1, r2]
	ldr r3, _02242B58 @ =0x02245DF9
	ldr r0, [r5, #0xc]
	ldrb r2, [r3, r2]
	adds r1, #0x10
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #9
	beq _02242A9A
	cmp r0, #0xa
	beq _02242AA4
	b _02242AAE
_02242A9A:
	ldr r0, [r5, #0xc]
	movs r1, #0x30
	bl FUN_020248F0
	b _02242AB6
_02242AA4:
	ldr r0, [r5, #0xc]
	movs r1, #0x31
	bl FUN_020248F0
	b _02242AB6
_02242AAE:
	ldr r0, [r5, #0xc]
	movs r1, #0x3d
	bl FUN_020248F0
_02242AB6:
	adds r0, r5, #0
	movs r1, #6
	bl ov70_02242164
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _02242AF0
	adds r0, r5, #0
	bl ov70_022429A0
	adds r5, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	beq _02242AE6
	cmp r5, #0xb
	beq _02242AE6
	cmp r4, #0
	beq _02242AE6
	ldrb r0, [r4, r5]
	cmp r0, #0
	beq _02242B36
_02242AE6:
	ldr r0, _02242B50 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
_02242AF0:
	ldr r0, _02242B3C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02242B24
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov70_022429A0
	adds r5, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	beq _02242B1A
	cmp r5, #0xb
	beq _02242B1A
	cmp r4, #0
	beq _02242B1A
	ldrb r0, [r4, r5]
	cmp r0, #0
	beq _02242B36
_02242B1A:
	ldr r0, _02242B50 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
_02242B24:
	movs r0, #2
	tst r0, r1
	beq _02242B36
	ldr r0, _02242B50 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02242B36:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02242B3C: .4byte 0x021D110C
_02242B40: .4byte 0x02245EFC
_02242B44: .4byte 0x02245EFD
_02242B48: .4byte 0x02245EFE
_02242B4C: .4byte 0x02245EFF
_02242B50: .4byte 0x000005DC
_02242B54: .4byte 0x02245DF8
_02242B58: .4byte 0x02245DF9
	thumb_func_end ov70_022429B8

	thumb_func_start ov70_02242B5C
ov70_02242B5C: @ 0x02242B5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #5
	beq _02242B6E
	cmp r1, #6
	beq _02242B7A
	cmp r1, #7
	beq _02242B88
	b _02242B94
_02242B6E:
	ldr r0, _02242BB8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02242B7A:
	movs r1, #0
	mvns r1, r1
	bl ov70_02242BBC
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02242B88:
	movs r1, #1
	bl ov70_02242BBC
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_02242B94:
	movs r0, #0x5a
	ldrsh r3, [r5, r0]
	lsls r2, r3, #2
	adds r2, r3, r2
	adds r4, r1, r2
	ldr r1, [r5, #0x5c]
	cmp r4, r1
	bge _02242BB4
	ldr r0, _02242BB8 @ =0x000005DC
	bl FUN_0200604C
	ldr r1, [r5, #0x34]
	lsls r0, r4, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_02242BB4:
	subs r0, #0x5b
	pop {r3, r4, r5, pc}
	.align 2, 0
_02242BB8: .4byte 0x000005DC
	thumb_func_end ov70_02242B5C

	thumb_func_start ov70_02242BBC
ov70_02242BBC: @ 0x02242BBC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	adds r6, r1, #0
	movs r1, #5
	bl ov70_02242508
	subs r4, r0, #1
	beq _02242C5E
	cmp r6, #0
	bge _02242C06
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r5, #0x14]
	movs r1, #0x27
	bl FUN_020248F0
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, #0
	beq _02242BFE
	subs r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	b _02242C38
_02242BFE:
	adds r0, r5, #0
	adds r0, #0x5a
	strh r4, [r0]
	b _02242C38
_02242C06:
	movs r0, #0x5e
	lsls r0, r0, #4
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_0202484C
	ldr r0, [r5, #0x10]
	movs r1, #0x26
	bl FUN_020248F0
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	cmp r0, r4
	bge _02242C30
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0x5a
	strh r1, [r0]
	b _02242C38
_02242C30:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x5a
	strh r1, [r0]
_02242C38:
	movs r1, #0x5a
	ldrsh r1, [r5, r1]
	ldr r2, [r5, #0x5c]
	adds r0, r5, #0
	bl ov70_0224352C
	ldr r0, [r5, #0x5c]
	movs r1, #5
	bl ov70_02242508
	str r0, [sp]
	movs r3, #0x5a
	ldr r2, [r5, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x38]
	adds r2, #0x50
	bl ov70_02243F00
_02242C5E:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_02242BBC

	thumb_func_start ov70_02242C64
ov70_02242C64: @ 0x02242C64
	push {r3, r4, r5, lr}
	ldr r1, _02242D34 @ =0x021D110C
	adds r5, r0, #0
	ldr r2, [r1, #0x4c]
	movs r1, #0x40
	ldr r4, [r5, #0x48]
	tst r1, r2
	beq _02242C8C
	ldr r0, _02242D38 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _02242C86
	subs r0, r0, #1
	str r0, [r5, #0x48]
	b _02242CC6
_02242C86:
	movs r0, #5
	str r0, [r5, #0x48]
	b _02242CC6
_02242C8C:
	movs r1, #0x80
	tst r1, r2
	beq _02242CAA
	ldr r0, _02242D38 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x48]
	cmp r0, #5
	beq _02242CA4
	adds r0, r0, #1
	str r0, [r5, #0x48]
	b _02242CC6
_02242CA4:
	movs r0, #0
	str r0, [r5, #0x48]
	b _02242CC6
_02242CAA:
	movs r1, #0x20
	adds r3, r2, #0
	tst r3, r1
	beq _02242CBA
	subs r1, #0x21
	bl ov70_02242BBC
	b _02242CC6
_02242CBA:
	movs r1, #0x10
	tst r1, r2
	beq _02242CC6
	movs r1, #1
	bl ov70_02242BBC
_02242CC6:
	ldr r0, [r5, #0x48]
	cmp r4, r0
	beq _02242CF2
	ldr r1, _02242D3C @ =0x02245D8A
	lsls r3, r0, #1
	ldr r2, _02242D40 @ =0x02245D8B
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	bl ov70_02238F9C
	ldr r0, [r5, #0x48]
	cmp r0, #5
	ldr r0, [r5, #0xc]
	bne _02242CEC
	movs r1, #0x30
	bl FUN_020248F0
	b _02242CF2
_02242CEC:
	movs r1, #0x32
	bl FUN_020248F0
_02242CF2:
	adds r0, r5, #0
	movs r1, #3
	bl ov70_02242164
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _02242D0C
	adds r0, r5, #0
	bl ov70_02242B5C
	pop {r3, r4, r5, pc}
_02242D0C:
	ldr r1, _02242D34 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #1
	tst r1, r2
	beq _02242D20
	ldr r1, [r5, #0x48]
	adds r0, r5, #0
	bl ov70_02242B5C
	pop {r3, r4, r5, pc}
_02242D20:
	movs r1, #2
	tst r1, r2
	beq _02242D30
	ldr r0, _02242D38 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	mvns r0, r0
_02242D30:
	pop {r3, r4, r5, pc}
	nop
_02242D34: .4byte 0x021D110C
_02242D38: .4byte 0x000005DC
_02242D3C: .4byte 0x02245D8A
_02242D40: .4byte 0x02245D8B
	thumb_func_end ov70_02242C64

	thumb_func_start ov70_02242D44
ov70_02242D44: @ 0x02242D44
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #6
	bne _02242D58
	movs r3, #0x21
	b _02242D5A
_02242D58:
	movs r3, #0x22
_02242D5A:
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	movs r2, #0x64
	bl FUN_02019688
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	ldr r1, [sp, #4]
	adds r0, r5, #0
	bl ov70_0224190C
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #1
	movs r2, #0x1a
	blx FUN_020D4994
	movs r4, #0
	adds r6, r4, #0
_02242D88:
	adds r1, r4, #0
	ldr r0, [r5, #0x24]
	adds r1, #0x6e
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #4
	bne _02242DBE
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_02243F7C
	cmp r0, #1
	bne _02242DB2
	adds r2, r5, r4
	adds r2, #0x64
	movs r1, #1
	ldr r0, _02242E50 @ =0x000F0E02
	strb r1, [r2]
	b _02242DE0
_02242DB2:
	adds r2, r5, r4
	adds r2, #0x64
	movs r1, #0
	ldr r0, _02242E54 @ =0x00080902
	strb r1, [r2]
	b _02242DE0
_02242DBE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_02243FE0
	cmp r0, #1
	bne _02242DD6
	adds r2, r5, r4
	adds r2, #0x64
	movs r1, #1
	ldr r0, _02242E50 @ =0x000F0E02
	strb r1, [r2]
	b _02242DE0
_02242DD6:
	adds r2, r5, r4
	ldr r0, _02242E54 @ =0x00080902
	adds r2, #0x64
	movs r1, #0
	strb r1, [r2]
_02242DE0:
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	adds r1, r1, r6
	adds r2, r7, #0
	movs r3, #2
	bl ov70_02242FC4
	adds r0, r7, #0
	bl FUN_02026380
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #9
	blt _02242D88
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	ldr r0, [sp, #4]
	cmp r0, #6
	bne _02242E34
	ldr r0, [r5, #0x24]
	movs r1, #0xae
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, _02242E50 @ =0x000F0E02
	adds r2, r4, #0
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	adds r1, #0xf0
	movs r3, #2
	bl ov70_02242FC4
	adds r0, r4, #0
	bl FUN_02026380
_02242E34:
	ldr r2, [sp, #8]
	movs r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r5, #0x1c]
	asrs r2, r2, #0x18
	adds r3, r1, #0
	bl FUN_020196E8
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_020197F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02242E50: .4byte 0x000F0E02
_02242E54: .4byte 0x00080902
	thumb_func_end ov70_02242D44

	thumb_func_start ov70_02242E58
ov70_02242E58: @ 0x02242E58
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0x1f
	bl FUN_02019688
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	adds r0, r5, #0
	movs r1, #1
	bl ov70_0224190C
	movs r6, #0
	adds r4, r6, #0
_02242E80:
	adds r1, r6, #0
	ldr r0, [r5, #0x24]
	adds r1, #0x7c
	bl FUN_0200BBA0
	adds r7, r0, #0
	ldr r0, _02242EE0 @ =0x000F0E02
	adds r2, r7, #0
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	adds r1, r1, r4
	movs r3, #2
	bl ov70_02242FC4
	adds r0, r7, #0
	bl FUN_02026380
	adds r6, r6, #1
	adds r4, #0x10
	cmp r6, #3
	blt _02242E80
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	movs r1, #0
	ldr r0, [r5, #0x1c]
	movs r2, #0x20
	adds r3, r1, #0
	bl FUN_020196E8
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_020197F4
	movs r1, #0
	movs r0, #4
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	subs r2, r1, #4
	adds r3, r1, #0
	bl FUN_020198FC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02242EE0: .4byte 0x000F0E02
	thumb_func_end ov70_02242E58

	thumb_func_start ov70_02242EE4
ov70_02242EE4: @ 0x02242EE4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0x23
	bl FUN_02019688
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	adds r0, r4, #0
	movs r1, #2
	bl ov70_0224190C
	ldr r0, [r4, #0x60]
	cmp r0, #1
	bne _02242F20
	adds r0, r4, #0
	ldr r1, [r4, #0x24]
	adds r0, #0x34
	movs r2, #1
	bl ov70_0223F7E4
	str r0, [r4, #0x5c]
	b _02242F32
_02242F20:
	cmp r0, #0
	bne _02242F32
	adds r0, r4, #0
	ldr r1, [r4, #0x24]
	adds r0, #0x34
	movs r2, #0
	bl ov70_0223F7E4
	str r0, [r4, #0x5c]
_02242F32:
	ldr r2, [r4, #0x5c]
	adds r0, r4, #0
	movs r1, #0
	bl ov70_022434C0
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl ov70_02242508
	str r0, [sp]
	movs r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	adds r2, #0x40
	bl ov70_02243F00
	ldr r2, [r4, #4]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	movs r1, #0
	ldr r0, [r4, #0x1c]
	movs r2, #0x20
	adds r3, r1, #0
	bl FUN_020196E8
	ldr r0, [r4, #0xc]
	movs r1, #0x31
	bl FUN_020248F0
	movs r1, #0
	adds r0, r4, #0
	str r1, [r4, #0x48]
	adds r0, #0x7e
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, _02242FBC @ =0x02245D76
	lsls r3, r0, #1
	ldr r2, _02242FC0 @ =0x02245D77
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_020197F4
	movs r1, #0
	movs r0, #4
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	subs r2, r1, #4
	adds r3, r1, #0
	bl FUN_020198FC
	movs r0, #0x20
	str r0, [r4, #0x4c]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02242FBC: .4byte 0x02245D76
_02242FC0: .4byte 0x02245D77
	thumb_func_end ov70_02242EE4

	thumb_func_start ov70_02242FC4
ov70_02242FC4: @ 0x02242FC4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	str r0, [sp, #8]
	adds r0, r4, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r4, #0
	bl FUN_0201D8A0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r4, #0
	bl FUN_02019A60
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02242FC4

	thumb_func_start ov70_02242FF4
ov70_02242FF4: @ 0x02242FF4
	movs r0, #0
	mvns r0, r0
	bx lr
	.align 2, 0
	thumb_func_end ov70_02242FF4

	thumb_func_start ov70_02242FFC
ov70_02242FFC: @ 0x02242FFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_020199E4
	cmp r0, #0
	bne _02243044
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x58
	ldrsh r0, [r4, r0]
	cmp r0, #2
	bne _02243040
	ldr r0, [r4, #0x10]
	movs r1, #0xe4
	movs r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0x14]
	movs r1, #0x9a
	movs r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_02024830
_02243040:
	ldr r0, [r4, #0x50]
	str r0, [r4, #0x4c]
_02243044:
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02242FFC

	thumb_func_start ov70_0224304C
ov70_0224304C: @ 0x0224304C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_020199E4
	cmp r0, #0
	bne _02243060
	ldr r0, [r4, #0x50]
	str r0, [r4, #0x4c]
_02243060:
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_0224304C

	thumb_func_start ov70_02243068
ov70_02243068: @ 0x02243068
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_020199E4
	cmp r0, #0
	bne _02243084
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_0201980C
	ldr r0, [r4, #0x50]
	str r0, [r4, #0x4c]
_02243084:
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02243068

	thumb_func_start ov70_0224308C
ov70_0224308C: @ 0x0224308C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #4
	movs r2, #0x20
	bl ov70_02242D44
	ldr r0, [r4, #0xc]
	movs r1, #0x3d
	bl FUN_020248F0
	ldr r0, [r4, #0xc]
	movs r1, #0x88
	movs r2, #0x28
	bl ov70_02238F9C
	movs r1, #0
	movs r0, #4
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	subs r2, r1, #4
	adds r3, r1, #0
	bl FUN_020198FC
	movs r0, #1
	str r0, [r4, #0x4c]
	movs r0, #5
	str r0, [r4, #0x50]
	subs r0, r0, #6
	strh r0, [r4, #0x3c]
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov70_0224308C

	thumb_func_start ov70_022430CC
ov70_022430CC: @ 0x022430CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x64
	bl ov70_022421D0
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _022430F6
	cmp r4, #8
	bhi _02243118
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #6
	str r0, [r5, #0x4c]
	strh r4, [r5, #0x3c]
	b _02243118
_022430F6:
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #6
	str r0, [r5, #0x50]
	subs r0, r0, #7
	strh r0, [r5, #0x3c]
_02243118:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_022430CC

	thumb_func_start ov70_02243120
ov70_02243120: @ 0x02243120
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #4
	bl ov70_02241DB4
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	cmp r1, #0
	blt _0224315C
	cmp r1, #8
	ble _02243142
	bl FUN_0202551C
_02243142:
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	lsls r1, r0, #3
	ldr r0, _02243168 @ =0x02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _02243158
	movs r0, #0
	strh r0, [r4, #0x3e]
	movs r0, #0xc
	b _02243160
_02243158:
	movs r0, #8
	b _02243160
_0224315C:
	subs r0, #0x3e
	pop {r4, pc}
_02243160:
	str r0, [r4, #0x4c]
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
_02243168: .4byte 0x02245F5C
	thumb_func_end ov70_02243120

	thumb_func_start ov70_0224316C
ov70_0224316C: @ 0x0224316C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0x22
	bl FUN_02019688
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	adds r0, r5, #0
	movs r1, #4
	bl ov70_0224190C
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #1
	movs r2, #0x1a
	blx FUN_020D4994
	movs r4, #0
	adds r6, r4, #0
_022431A0:
	adds r1, r4, #0
	ldr r0, [r5, #0x24]
	adds r1, #0x6e
	bl FUN_0200BBA0
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_02243F7C
	cmp r0, #1
	bne _022431C2
	adds r2, r5, r4
	ldr r0, _02243244 @ =0x000F0E02
	adds r2, #0x64
	movs r1, #1
	b _022431CA
_022431C2:
	adds r2, r5, r4
	ldr r0, _02243248 @ =0x00080902
	adds r2, #0x64
	movs r1, #0
_022431CA:
	strb r1, [r2]
	str r0, [sp]
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x1c]
	adds r1, r1, r6
	adds r2, r7, #0
	movs r3, #2
	bl ov70_02242FC4
	adds r0, r7, #0
	bl FUN_02026380
	adds r4, r4, #1
	adds r6, #0x10
	cmp r4, #9
	blt _022431A0
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	movs r1, #0
	ldr r0, [r5, #0x1c]
	movs r2, #0x10
	adds r3, r1, #0
	bl FUN_020196E8
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_020197F4
	ldr r0, [r5, #0xc]
	movs r1, #0x3d
	bl FUN_020248F0
	movs r0, #0x3c
	ldrsh r0, [r5, r0]
	ldr r1, _0224324C @ =0x02245E26
	ldr r2, _02243250 @ =0x02245E27
	lsls r3, r0, #1
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	adds r1, #0x10
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	movs r0, #0x3c
	ldrsh r0, [r5, r0]
	movs r1, #1
	str r0, [r5, #0x48]
	ldr r0, [r5, #0xc]
	bl FUN_02024830
	movs r0, #5
	str r0, [r5, #0x4c]
	subs r0, r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02243244: .4byte 0x000F0E02
_02243248: .4byte 0x00080902
_0224324C: .4byte 0x02245E26
_02243250: .4byte 0x02245E27
	thumb_func_end ov70_0224316C

	thumb_func_start ov70_02243254
ov70_02243254: @ 0x02243254
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0x20
	bl FUN_02019688
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	adds r0, r5, #0
	movs r1, #5
	bl ov70_0224190C
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #1
	movs r2, #0x1a
	blx FUN_020D4994
	movs r0, #2
	str r0, [sp]
	ldr r0, _02243388 @ =0x000F0E02
	movs r3, #0x3c
	str r0, [sp, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	ldr r2, [r5, #4]
	adds r3, #0x6e
	bl ov70_02243E8C
	movs r0, #0x3c
	ldrsh r1, [r5, r0]
	ldr r0, _0224338C @ =0x02245F5C
	movs r4, #1
	lsls r2, r1, #3
	ldr r0, [r0, r2]
	cmp r0, #1
	blt _0224332C
	movs r7, #0x10
_022432B0:
	lsls r2, r1, #2
	ldr r1, _02243390 @ =0x02245E84
	adds r0, r5, #0
	ldr r1, [r1, r2]
	adds r1, r4, r1
	subs r1, r1, #1
	bl ov70_02243F54
	cmp r0, #0
	ble _022432DA
	movs r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243388 @ =0x000F0E02
	lsls r2, r1, #2
	ldr r1, _02243390 @ =0x02245E84
	ldr r2, [r1, r2]
	adds r1, r5, r4
	adds r2, r2, r1
	adds r2, #0x63
	movs r1, #1
	b _022432EE
_022432DA:
	movs r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243394 @ =0x00080902
	lsls r2, r1, #2
	ldr r1, _02243390 @ =0x02245E84
	ldr r2, [r1, r2]
	adds r1, r5, r4
	adds r2, r2, r1
	adds r2, #0x63
	movs r1, #0
_022432EE:
	strb r1, [r2]
	movs r1, #5
	str r1, [sp]
	str r0, [sp, #4]
	movs r3, #0x3c
	ldrsh r3, [r5, r3]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	lsls r6, r3, #3
	ldr r3, _02243398 @ =0x02245F58
	ldr r1, [r5, #0x24]
	ldr r3, [r3, r6]
	adds r2, r2, r7
	adds r3, r4, r3
	lsls r6, r3, #2
	ldr r3, _0224339C @ =0x02245FA0
	adds r3, r3, r6
	subs r3, r3, #4
	ldr r3, [r3]
	bl ov70_02243E8C
	movs r0, #0x3c
	ldrsh r1, [r5, r0]
	ldr r0, _02243398 @ =0x02245F58
	adds r4, r4, #1
	lsls r2, r1, #3
	adds r0, r0, r2
	ldr r0, [r0, #4]
	adds r7, #0x10
	cmp r4, r0
	ble _022432B0
_0224332C:
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	movs r1, #0
	ldr r0, [r5, #0x1c]
	movs r2, #0x10
	adds r3, r1, #0
	bl FUN_020196E8
	ldr r0, [r5, #0xc]
	movs r1, #0x2f
	bl FUN_020248F0
	movs r0, #0x3e
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _0224335A
	movs r0, #0
	b _0224335A
_0224335A:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x48]
	ldr r1, _022433A0 @ =0x02245E26
	lsls r3, r0, #1
	ldr r2, _022433A4 @ =0x02245E27
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	adds r1, #0x10
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_02024830
	movs r0, #9
	str r0, [r5, #0x4c]
	subs r0, #0xa
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243388: .4byte 0x000F0E02
_0224338C: .4byte 0x02245F5C
_02243390: .4byte 0x02245E84
_02243394: .4byte 0x00080902
_02243398: .4byte 0x02245F58
_0224339C: .4byte 0x02245FA0
_022433A0: .4byte 0x02245E26
_022433A4: .4byte 0x02245E27
	thumb_func_end ov70_02243254

	thumb_func_start ov70_022433A8
ov70_022433A8: @ 0x022433A8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	bl ov70_02242390
	adds r5, r0, #0
	cmp r5, #4
	bhi _022433D0
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022433C6: @ jump table
	.2byte _022433DA - _022433C6 - 2 @ case 0
	.2byte _022433DA - _022433C6 - 2 @ case 1
	.2byte _022433DA - _022433C6 - 2 @ case 2
	.2byte _022433DA - _022433C6 - 2 @ case 3
	.2byte _022433DA - _022433C6 - 2 @ case 4
_022433D0:
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	beq _022433EA
	b _022433FA
_022433DA:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xa
	str r0, [r4, #0x4c]
	strh r5, [r4, #0x3e]
	b _022433FA
_022433EA:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0xa
	str r0, [r4, #0x4c]
	subs r0, #0xb
	strh r0, [r4, #0x3e]
_022433FA:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_022433A8

	thumb_func_start ov70_02243400
ov70_02243400: @ 0x02243400
	push {r4, lr}
	movs r1, #5
	adds r4, r0, #0
	bl ov70_02241DB4
	movs r0, #0x3e
	ldrsh r0, [r4, r0]
	cmp r0, #0
	blt _02243416
	movs r0, #0xc
	b _02243418
_02243416:
	movs r0, #7
_02243418:
	str r0, [r4, #0x4c]
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	thumb_func_end ov70_02243400

	thumb_func_start ov70_02243420
ov70_02243420: @ 0x02243420
	movs r1, #8
	str r1, [r0, #0x4c]
	subs r1, #9
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov70_02243420

	thumb_func_start ov70_0224342C
ov70_0224342C: @ 0x0224342C
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0
	adds r7, r2, #0
	str r1, [sp]
	adds r5, r3, #0
	adds r4, r6, #0
	cmp r7, #0
	ble _02243452
_0224343C:
	ldrh r1, [r5]
	ldr r0, [sp]
	bl FUN_0202A044
	cmp r0, #0
	beq _0224344A
	adds r4, r4, #1
_0224344A:
	adds r6, r6, #1
	adds r5, r5, #2
	cmp r6, r7
	blt _0224343C
_02243452:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov70_0224342C

	thumb_func_start ov70_02243458
ov70_02243458: @ 0x02243458
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	adds r6, r0, #0
	ldr r1, [sp, #0x28]
	movs r0, #0x3d
	add r2, sp, #0xc
	adds r4, r3, #0
	ldr r7, [sp, #0x2c]
	bl ov70_0223F658
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #4]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov70_0224342C
	str r0, [sp, #8]
	adds r0, r0, #1
	movs r1, #0x3d
	bl FUN_02014918
	str r0, [r6]
	ldr r0, [sp, #0xc]
	movs r4, #0
	cmp r0, #0
	ble _022434B4
	ldr r5, [sp, #4]
_02243492:
	ldrh r1, [r5]
	adds r0, r7, #0
	bl FUN_0202A044
	cmp r0, #0
	beq _022434AA
	ldrh r2, [r5]
	ldr r0, [r6]
	ldr r1, [sp]
	adds r3, r2, #0
	bl FUN_02014960
_022434AA:
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, r0
	blt _02243492
_022434B4:
	ldr r0, [sp, #4]
	bl FUN_0201AB0C
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov70_02243458

	thumb_func_start ov70_022434C0
ov70_022434C0: @ 0x022434C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	lsls r7, r1, #2
	movs r4, #0
	adds r5, r0, #0
	lsls r0, r7, #3
	str r2, [sp, #4]
	str r4, [sp, #0xc]
	adds r6, r4, #0
	str r0, [sp, #8]
_022434D4:
	ldr r0, [r5, #4]
	movs r1, #0x22
	adds r0, r0, r4
	bl FUN_0201D978
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _022434FE
	ldr r0, _02243528 @ =0x000F0E02
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r3, [r5, #0x34]
	ldr r1, [r5, #4]
	adds r2, r2, r3
	ldr r0, [r5, #0x1c]
	ldr r2, [r6, r2]
	adds r1, r1, r4
	movs r3, #0
	bl ov70_02242FC4
	b _02243512
_022434FE:
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl FUN_0201D8A0
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	adds r2, r2, r4
	bl FUN_02019A60
_02243512:
	ldr r0, [sp, #0xc]
	adds r4, #0x10
	adds r0, r0, #1
	adds r7, r7, #1
	adds r6, #8
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _022434D4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243528: .4byte 0x000F0E02
	thumb_func_end ov70_022434C0

	thumb_func_start ov70_0224352C
ov70_0224352C: @ 0x0224352C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	lsls r0, r1, #2
	movs r4, #0
	adds r7, r1, r0
	lsls r0, r7, #3
	str r2, [sp, #4]
	str r4, [sp, #0xc]
	adds r6, r4, #0
	str r0, [sp, #8]
_02243542:
	ldr r0, [r5, #4]
	movs r1, #0x22
	adds r0, r0, r4
	bl FUN_0201D978
	ldr r0, [sp, #4]
	cmp r7, r0
	bge _0224356C
	ldr r0, _02243594 @ =0x000F0E02
	ldr r2, [sp, #8]
	str r0, [sp]
	ldr r3, [r5, #0x34]
	ldr r1, [r5, #4]
	adds r2, r2, r3
	ldr r0, [r5, #0x1c]
	ldr r2, [r6, r2]
	adds r1, r1, r4
	movs r3, #0
	bl ov70_02242FC4
	b _02243580
_0224356C:
	ldr r0, [r5, #4]
	adds r0, r0, r4
	bl FUN_0201D8A0
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	adds r2, r2, r4
	bl FUN_02019A60
_02243580:
	ldr r0, [sp, #0xc]
	adds r4, #0x10
	adds r0, r0, #1
	adds r7, r7, #1
	adds r6, #8
	str r0, [sp, #0xc]
	cmp r0, #5
	blt _02243542
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02243594: .4byte 0x000F0E02
	thumb_func_end ov70_0224352C

	thumb_func_start ov70_02243598
ov70_02243598: @ 0x02243598
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0x23
	bl FUN_02019688
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	adds r0, r4, #0
	movs r1, #0
	bl ov70_0224190C
	movs r0, #0x3e
	ldrsh r2, [r4, r0]
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	lsls r1, r0, #2
	ldr r0, _0224367C @ =0x02245E84
	ldr r0, [r0, r1]
	adds r0, r2, r0
	str r0, [sp]
	ldr r0, [r4, #0x20]
	str r0, [sp, #4]
	adds r0, r4, #0
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x24]
	ldr r3, [r4, #0x30]
	adds r0, #0x34
	bl ov70_02243458
	str r0, [r4, #0x5c]
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldr r2, [r4, #0x5c]
	adds r0, r4, #0
	bl ov70_022434C0
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl ov70_02242508
	str r0, [sp]
	movs r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	adds r2, #0x40
	bl ov70_02243F00
	ldr r2, [r4, #4]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	movs r1, #0
	ldr r0, [r4, #0x1c]
	movs r2, #0x10
	adds r3, r1, #0
	bl FUN_020196E8
	ldr r0, [r4, #0xc]
	movs r1, #0x31
	bl FUN_020248F0
	movs r0, #0
	ldr r1, _02243680 @ =0x02245D76
	lsls r3, r0, #1
	ldr r2, _02243684 @ =0x02245D77
	str r0, [r4, #0x48]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	ldr r0, [r4, #0x10]
	movs r1, #0xe4
	movs r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0x14]
	movs r1, #0x9a
	movs r2, #0x78
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0xd
	str r0, [r4, #0x4c]
	subs r0, #0xe
	add sp, #8
	pop {r4, pc}
	nop
_0224367C: .4byte 0x02245E84
_02243680: .4byte 0x02245D76
_02243684: .4byte 0x02245D77
	thumb_func_end ov70_02243598

	thumb_func_start ov70_02243688
ov70_02243688: @ 0x02243688
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_0224261C
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _022436A2
	adds r0, r0, #1
	cmp r4, r0
	beq _022436F6
	b _022436C4
_022436A2:
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	ldr r0, _022436FC @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0xe
	str r0, [r5, #0x4c]
	subs r0, #0xf
	adds r5, #0x40
	strh r0, [r5]
	b _022436F6
_022436C4:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0xf
	str r0, [r5, #0x50]
	adds r5, #0x40
	strh r4, [r5]
_022436F6:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
_022436FC: .4byte 0x000005DC
	thumb_func_end ov70_02243688

	thumb_func_start ov70_02243700
ov70_02243700: @ 0x02243700
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl FUN_02014950
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	cmp r0, #8
	ble _0224372E
	bl FUN_0202551C
_0224372E:
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	lsls r1, r0, #3
	ldr r0, _0224374C @ =0x02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _02243740
	movs r0, #7
	b _02243742
_02243740:
	movs r0, #0xb
_02243742:
	str r0, [r4, #0x4c]
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	nop
_0224374C: .4byte 0x02245F5C
	thumb_func_end ov70_02243700

	thumb_func_start ov70_02243750
ov70_02243750: @ 0x02243750
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl FUN_02014950
	movs r0, #0x40
	ldrsh r0, [r4, r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02243750

	thumb_func_start ov70_02243768
ov70_02243768: @ 0x02243768
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #6
	movs r2, #0x20
	adds r4, r0, #0
	bl ov70_02242D44
	movs r1, #0
	movs r0, #4
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	subs r2, r1, #4
	adds r3, r1, #0
	bl FUN_020198FC
	movs r0, #1
	str r0, [r4, #0x4c]
	movs r0, #0x11
	str r0, [r4, #0x50]
	movs r0, #0xa
	str r0, [r4, #0x48]
	subs r0, #0xb
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x48]
	ldr r1, _022437C0 @ =0x02245DF8
	lsls r3, r0, #1
	ldr r2, _022437C4 @ =0x02245DF9
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	adds r1, #0x10
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	movs r1, #0x31
	bl FUN_020248F0
	movs r0, #0
	mvns r0, r0
	add sp, #4
	pop {r3, r4, pc}
	nop
_022437C0: .4byte 0x02245DF8
_022437C4: .4byte 0x02245DF9
	thumb_func_end ov70_02243768

	thumb_func_start ov70_022437C8
ov70_022437C8: @ 0x022437C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x64
	bl ov70_022429B8
	adds r4, r0, #0
	cmp r4, #0xa
	beq _0224380E
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _022437EA
	adds r0, r0, #1
	cmp r4, r0
	beq _02243840
	b _02243832
_022437EA:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0x12
	str r0, [r5, #0x50]
	subs r0, #0x13
	strh r0, [r5, #0x3c]
	b _02243840
_0224380E:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0x12
	str r0, [r5, #0x50]
	subs r0, #0x14
	strh r0, [r5, #0x3c]
	b _02243840
_02243832:
	cmp r4, #8
	bls _0224383A
	bl FUN_0202551C
_0224383A:
	strh r4, [r5, #0x3c]
	movs r0, #0x12
	str r0, [r5, #0x4c]
_02243840:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_022437C8

	thumb_func_start ov70_02243848
ov70_02243848: @ 0x02243848
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #6
	bl ov70_02241DB4
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x3c
	ldrsh r2, [r4, r0]
	cmp r2, #0
	bge _0224387E
	adds r1, r0, #0
	subs r1, #0x3d
	cmp r2, r1
	bne _02243872
	add sp, #4
	subs r0, #0x3e
	pop {r3, r4, pc}
_02243872:
	subs r0, #0x3e
	cmp r2, r0
	bne _022438C8
	add sp, #4
	movs r0, #0
	pop {r3, r4, pc}
_0224387E:
	cmp r2, #8
	ble _02243886
	bl FUN_0202551C
_02243886:
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	lsls r1, r0, #3
	ldr r0, _022438D0 @ =0x02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _022438C4
	movs r1, #0
	strh r1, [r4, #0x3e]
	movs r2, #3
	str r2, [sp]
	ldr r0, [r4, #0x1c]
	subs r2, r2, #7
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _022438B2
	movs r1, #0
	bl FUN_02024830
_022438B2:
	ldr r0, [r4, #0xc]
	movs r1, #0x32
	bl FUN_020248F0
	movs r0, #2
	str r0, [r4, #0x4c]
	movs r0, #0x18
	str r0, [r4, #0x50]
	b _022438C8
_022438C4:
	movs r0, #0x14
	str r0, [r4, #0x4c]
_022438C8:
	movs r0, #0
	mvns r0, r0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_022438D0: .4byte 0x02245F5C
	thumb_func_end ov70_02243848

	thumb_func_start ov70_022438D4
ov70_022438D4: @ 0x022438D4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #6
	movs r2, #0x10
	bl ov70_02242D44
	ldr r0, [r4, #0xc]
	movs r1, #0x3d
	bl FUN_020248F0
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	ldr r1, _02243920 @ =0x02245DF8
	ldr r2, _02243924 @ =0x02245DF9
	lsls r3, r0, #1
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [r4, #0x48]
	adds r1, #0x10
	ldr r0, [r4, #0xc]
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02243918
	movs r1, #1
	bl FUN_02024830
_02243918:
	movs r0, #0x11
	str r0, [r4, #0x4c]
	subs r0, #0x12
	pop {r4, pc}
	.align 2, 0
_02243920: .4byte 0x02245DF8
_02243924: .4byte 0x02245DF9
	thumb_func_end ov70_022438D4

	thumb_func_start ov70_02243928
ov70_02243928: @ 0x02243928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0x20
	bl FUN_02019688
	ldr r0, [r5, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	adds r0, r5, #0
	movs r1, #5
	bl ov70_0224190C
	adds r0, r5, #0
	adds r0, #0x64
	movs r1, #1
	movs r2, #0x1a
	blx FUN_020D4994
	movs r0, #2
	str r0, [sp]
	ldr r0, _02243A50 @ =0x000F0E02
	movs r3, #0x3c
	str r0, [sp, #4]
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	ldr r2, [r5, #4]
	adds r3, #0x6e
	bl ov70_02243E8C
	movs r4, #1
	movs r7, #0x10
_02243976:
	movs r1, #0x3c
	ldrsh r1, [r5, r1]
	adds r0, r5, #0
	lsls r2, r1, #2
	ldr r1, _02243A54 @ =0x02245E84
	ldr r1, [r1, r2]
	adds r1, r4, r1
	subs r1, r1, #1
	bl ov70_02243FD4
	cmp r0, #0
	ble _022439A4
	movs r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243A50 @ =0x000F0E02
	lsls r2, r1, #2
	ldr r1, _02243A54 @ =0x02245E84
	ldr r2, [r1, r2]
	adds r1, r5, r4
	adds r2, r2, r1
	adds r2, #0x63
	movs r1, #1
	b _022439B8
_022439A4:
	movs r1, #0x3c
	ldrsh r1, [r5, r1]
	ldr r0, _02243A58 @ =0x00080902
	lsls r2, r1, #2
	ldr r1, _02243A54 @ =0x02245E84
	ldr r2, [r1, r2]
	adds r1, r5, r4
	adds r2, r2, r1
	adds r2, #0x63
	movs r1, #0
_022439B8:
	strb r1, [r2]
	movs r1, #5
	str r1, [sp]
	str r0, [sp, #4]
	movs r3, #0x3c
	ldrsh r3, [r5, r3]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	lsls r6, r3, #3
	ldr r3, _02243A5C @ =0x02245F58
	ldr r1, [r5, #0x24]
	ldr r3, [r3, r6]
	adds r2, r2, r7
	adds r3, r4, r3
	lsls r6, r3, #2
	ldr r3, _02243A60 @ =0x02245FA0
	adds r3, r3, r6
	subs r3, r3, #4
	ldr r3, [r3]
	bl ov70_02243E8C
	adds r4, r4, #1
	adds r7, #0x10
	cmp r4, #4
	blt _02243976
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	movs r1, #0
	ldr r0, [r5, #0x1c]
	movs r2, #0x10
	adds r3, r1, #0
	bl FUN_020196E8
	ldr r0, [r5, #0xc]
	movs r1, #0x2f
	bl FUN_020248F0
	movs r0, #0x3e
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _02243A18
	movs r0, #0
	b _02243A18
_02243A18:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x48]
	ldr r1, _02243A64 @ =0x02245E26
	lsls r3, r0, #1
	ldr r2, _02243A68 @ =0x02245E27
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r5, #0xc]
	adds r1, #0x10
	lsls r1, r1, #3
	lsls r2, r2, #3
	bl ov70_02238F9C
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _02243A46
	movs r1, #1
	bl FUN_02024830
_02243A46:
	movs r0, #0x15
	str r0, [r5, #0x4c]
	subs r0, #0x16
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02243A50: .4byte 0x000F0E02
_02243A54: .4byte 0x02245E84
_02243A58: .4byte 0x00080902
_02243A5C: .4byte 0x02245F58
_02243A60: .4byte 0x02245FA0
_02243A64: .4byte 0x02245E26
_02243A68: .4byte 0x02245E27
	thumb_func_end ov70_02243928

	thumb_func_start ov70_02243A6C
ov70_02243A6C: @ 0x02243A6C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x64
	bl ov70_02242390
	adds r5, r0, #0
	cmp r5, #4
	bhi _02243A94
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02243A8A: @ jump table
	.2byte _02243A9E - _02243A8A - 2 @ case 0
	.2byte _02243A9E - _02243A8A - 2 @ case 1
	.2byte _02243A9E - _02243A8A - 2 @ case 2
	.2byte _02243A9E - _02243A8A - 2 @ case 3
	.2byte _02243A9E - _02243A8A - 2 @ case 4
_02243A94:
	movs r0, #1
	mvns r0, r0
	cmp r5, r0
	beq _02243AAE
	b _02243ABE
_02243A9E:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x16
	str r0, [r4, #0x4c]
	strh r5, [r4, #0x3e]
	b _02243ABE
_02243AAE:
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x16
	str r0, [r4, #0x4c]
	subs r0, #0x17
	strh r0, [r4, #0x3e]
_02243ABE:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02243A6C

	thumb_func_start ov70_02243AC4
ov70_02243AC4: @ 0x02243AC4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #5
	bl ov70_02241DB4
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x3e
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02243AE6
	movs r0, #0x13
	str r0, [r4, #0x4c]
	b _02243B12
_02243AE6:
	movs r0, #3
	movs r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	subs r2, r1, #4
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02243B02
	movs r1, #0
	bl FUN_02024830
_02243B02:
	ldr r0, [r4, #0xc]
	movs r1, #0x32
	bl FUN_020248F0
	movs r0, #2
	str r0, [r4, #0x4c]
	movs r0, #0x18
	str r0, [r4, #0x50]
_02243B12:
	movs r0, #0
	mvns r0, r0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov70_02243AC4

	thumb_func_start ov70_02243B1C
ov70_02243B1C: @ 0x02243B1C
	movs r1, #0x14
	str r1, [r0, #0x4c]
	movs r1, #0x3e
	ldrsh r2, [r0, r1]
	subs r1, #0x3f
	str r2, [r0, #0x48]
	adds r0, r1, #0
	bx lr
	thumb_func_end ov70_02243B1C

	thumb_func_start ov70_02243B2C
ov70_02243B2C: @ 0x02243B2C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	movs r1, #0
	movs r2, #0x64
	movs r3, #0x1e
	bl FUN_02019688
	ldr r0, [r4, #0x1c]
	movs r1, #0
	bl FUN_02019B08
	adds r0, r4, #0
	movs r1, #3
	bl ov70_0224190C
	movs r3, #0x3c
	ldrsh r3, [r4, r3]
	movs r2, #0x3e
	adds r0, r4, #0
	lsls r5, r3, #2
	ldr r3, _02243BFC @ =0x02245E84
	ldrsh r2, [r4, r2]
	ldr r3, [r3, r5]
	ldr r1, [r4, #0x2c]
	adds r0, #0x34
	adds r2, r2, r3
	bl ov70_0223F904
	str r0, [r4, #0x5c]
	ldr r2, [r4, #0x5c]
	adds r0, r4, #0
	movs r1, #0
	bl ov70_0224352C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x5a
	strh r1, [r0]
	ldr r0, [r4, #0x5c]
	movs r1, #5
	bl ov70_02242508
	str r0, [sp]
	movs r3, #0x5a
	ldr r2, [r4, #4]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x38]
	adds r2, #0x50
	bl ov70_02243F00
	ldr r2, [r4, #4]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x24]
	adds r2, #0xe0
	movs r3, #0x44
	bl ov70_02243EB8
	movs r1, #0
	ldr r0, [r4, #0x1c]
	movs r2, #1
	adds r3, r1, #0
	bl FUN_020196E8
	movs r0, #0
	ldr r1, _02243C00 @ =0x02245D8A
	lsls r3, r0, #1
	ldr r2, _02243C04 @ =0x02245D8B
	str r0, [r4, #0x48]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	ldr r0, [r4, #0x10]
	movs r1, #0xb0
	movs r2, #0x88
	bl ov70_02238F9C
	ldr r0, [r4, #0x14]
	movs r1, #0x58
	movs r2, #0x88
	bl ov70_02238F9C
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x14]
	movs r1, #1
	bl FUN_02024830
	movs r0, #0x19
	str r0, [r4, #0x4c]
	subs r0, #0x1a
	pop {r3, r4, r5, pc}
	nop
_02243BFC: .4byte 0x02245E84
_02243C00: .4byte 0x02245D8A
_02243C04: .4byte 0x02245D8B
	thumb_func_end ov70_02243B2C

	thumb_func_start ov70_02243C08
ov70_02243C08: @ 0x02243C08
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_02242C64
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _02243C22
	adds r0, r0, #1
	cmp r4, r0
	beq _02243C84
	b _02243C52
_02243C22:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	movs r0, #2
	str r0, [r5, #0x4c]
	movs r0, #0x1a
	str r0, [r5, #0x50]
	b _02243C84
_02243C52:
	movs r2, #6
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0x1b
	str r0, [r5, #0x50]
	adds r5, #0x42
	strh r4, [r5]
_02243C84:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_02243C08

	thumb_func_start ov70_02243C8C
ov70_02243C8C: @ 0x02243C8C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #3
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl FUN_02014950
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	cmp r0, #8
	ble _02243CA8
	bl FUN_0202551C
_02243CA8:
	movs r0, #0x3c
	ldrsh r0, [r4, r0]
	lsls r1, r0, #3
	ldr r0, _02243CC4 @ =0x02245F5C
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _02243CBA
	movs r0, #0x13
	b _02243CBC
_02243CBA:
	movs r0, #0x17
_02243CBC:
	str r0, [r4, #0x4c]
	movs r0, #0
	mvns r0, r0
	pop {r4, pc}
	.align 2, 0
_02243CC4: .4byte 0x02245F5C
	thumb_func_end ov70_02243C8C

	thumb_func_start ov70_02243CC8
ov70_02243CC8: @ 0x02243CC8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #3
	bl ov70_02241DB4
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02243CDE
	movs r1, #1
	bl FUN_02024830
_02243CDE:
	ldr r0, [r4, #0x34]
	bl FUN_02014950
	movs r0, #0x42
	ldrsh r0, [r4, r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02243CC8

	thumb_func_start ov70_02243CEC
ov70_02243CEC: @ 0x02243CEC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x48]
	bl ov70_02242E58
	ldr r0, [r4, #0xc]
	movs r1, #0x31
	bl FUN_020248F0
	ldr r0, [r4, #0x48]
	ldr r1, _02243D20 @ =0x02245D66
	lsls r3, r0, #1
	ldr r2, _02243D24 @ =0x02245D67
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	movs r0, #1
	str r0, [r4, #0x4c]
	movs r0, #0x1d
	str r0, [r4, #0x50]
	subs r0, #0x1e
	pop {r4, pc}
	nop
_02243D20: .4byte 0x02245D66
_02243D24: .4byte 0x02245D67
	thumb_func_end ov70_02243CEC

	thumb_func_start ov70_02243D28
ov70_02243D28: @ 0x02243D28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_022426F4
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _02243D42
	adds r0, r0, #1
	cmp r4, r0
	beq _02243D8A
	b _02243D68
_02243D42:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0x1e
	str r0, [r5, #0x50]
	subs r0, #0x20
	adds r5, #0x44
	strb r0, [r5]
	b _02243D8A
_02243D68:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0x1e
	str r0, [r5, #0x50]
	adds r5, #0x44
	strb r4, [r5]
_02243D8A:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02243D28

	thumb_func_start ov70_02243D90
ov70_02243D90: @ 0x02243D90
	push {r4, lr}
	movs r1, #1
	adds r4, r0, #0
	bl ov70_02241DB4
	movs r0, #0x44
	ldrsb r0, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov70_02243D90

	thumb_func_start ov70_02243DA0
ov70_02243DA0: @ 0x02243DA0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	str r1, [r4, #0x48]
	bl ov70_02242EE4
	ldr r0, [r4, #0xc]
	movs r1, #0x31
	bl FUN_020248F0
	ldr r0, [r4, #0x48]
	ldr r1, _02243DD4 @ =0x02245D80
	lsls r3, r0, #1
	ldr r2, _02243DD8 @ =0x02245D81
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	ldr r0, [r4, #0xc]
	bl ov70_02238F9C
	movs r0, #1
	str r0, [r4, #0x4c]
	movs r0, #0x20
	str r0, [r4, #0x50]
	subs r0, #0x21
	pop {r4, pc}
	nop
_02243DD4: .4byte 0x02245D80
_02243DD8: .4byte 0x02245D81
	thumb_func_end ov70_02243DA0

	thumb_func_start ov70_02243DDC
ov70_02243DDC: @ 0x02243DDC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_022428C0
	adds r4, r0, #0
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _02243DF6
	adds r0, r0, #1
	cmp r4, r0
	beq _02243E6E
	b _02243E2C
_02243DF6:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0x21
	str r0, [r5, #0x50]
	subs r0, #0x23
	adds r5, #0x45
	strb r0, [r5]
	b _02243E6E
_02243E2C:
	movs r2, #4
	str r2, [sp]
	movs r1, #0
	ldr r0, [r5, #0x1c]
	adds r3, r1, #0
	bl FUN_020198FC
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl FUN_02024830
	movs r0, #3
	str r0, [r5, #0x4c]
	movs r0, #0x21
	str r0, [r5, #0x50]
	movs r0, #0x5a
	ldrsh r0, [r5, r0]
	ldr r1, [r5, #0x34]
	adds r5, #0x45
	lsls r0, r0, #2
	adds r0, r4, r0
	lsls r0, r0, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	strb r0, [r5]
_02243E6E:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov70_02243DDC

	thumb_func_start ov70_02243E74
ov70_02243E74: @ 0x02243E74
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl ov70_02241DB4
	ldr r0, [r4, #0x34]
	bl FUN_02014950
	movs r0, #0x45
	ldrsb r0, [r4, r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02243E74

	thumb_func_start ov70_02243E8C
ov70_02243E8C: @ 0x02243E8C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r3, #0
	adds r6, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov70_02242FC4
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov70_02243E8C

	thumb_func_start ov70_02243EB8
ov70_02243EB8: @ 0x02243EB8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r6, r0, #0
	adds r0, r1, #0
	adds r1, r3, #0
	adds r5, r2, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02243EFC @ =0x000F0E02
	movs r1, #4
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r4, #0
	str r3, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r5, #0
	bl FUN_0201D8A0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r5, #0
	bl FUN_02019A60
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_02243EFC: .4byte 0x000F0E02
	thumb_func_end ov70_02243EB8

	thumb_func_start ov70_02243F00
ov70_02243F00: @ 0x02243F00
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r2, #0
	adds r6, r0, #0
	adds r5, r1, #0
	adds r1, r3, #1
	str r4, [sp]
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #1
	bl FUN_0200CDF0
	movs r1, #0
	str r1, [sp]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0x10
	bl FUN_0200CDAC
	str r4, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r3, #0
	ldr r1, [sp, #0x20]
	adds r0, r5, #0
	movs r2, #2
	str r3, [sp, #8]
	bl FUN_0200CDF0
	adds r0, r4, #0
	bl FUN_0201D8A0
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	bl FUN_02019A60
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov70_02243F00

	thumb_func_start ov70_02243F54
ov70_02243F54: @ 0x02243F54
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x3d
	add r2, sp, #0
	bl ov70_0223F658
	adds r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #0x20]
	ldr r2, [sp]
	adds r3, r5, #0
	bl ov70_0224342C
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov70_02243F54

	thumb_func_start ov70_02243F7C
ov70_02243F7C: @ 0x02243F7C
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _02243FC8 @ =0x02245E84
	lsls r3, r1, #2
	ldr r4, [r2, r3]
	ldr r2, _02243FCC @ =0x02245F5C
	lsls r1, r1, #3
	ldr r2, [r2, r1]
	adds r7, r0, #0
	cmp r2, #0
	ble _02243FB4
	movs r5, #0
	cmp r2, #0
	ble _02243FC2
	ldr r0, _02243FD0 @ =0x02245F58
	adds r6, r0, r1
_02243F9A:
	adds r0, r7, #0
	adds r1, r4, r5
	bl ov70_02243F54
	cmp r0, #0
	ble _02243FAA
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02243FAA:
	ldr r0, [r6, #4]
	adds r5, r5, #1
	cmp r5, r0
	blt _02243F9A
	b _02243FC2
_02243FB4:
	adds r1, r4, #0
	bl ov70_02243F54
	cmp r0, #0
	ble _02243FC2
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02243FC2:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02243FC8: .4byte 0x02245E84
_02243FCC: .4byte 0x02245F5C
_02243FD0: .4byte 0x02245F58
	thumb_func_end ov70_02243F7C

	thumb_func_start ov70_02243FD4
ov70_02243FD4: @ 0x02243FD4
	push {r3, lr}
	adds r0, r1, #0
	add r1, sp, #0
	bl ov70_0223F8D0
	pop {r3, pc}
	thumb_func_end ov70_02243FD4

	thumb_func_start ov70_02243FE0
ov70_02243FE0: @ 0x02243FE0
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _0224402C @ =0x02245E84
	lsls r3, r1, #2
	ldr r4, [r2, r3]
	ldr r2, _02244030 @ =0x02245F5C
	lsls r1, r1, #3
	ldr r2, [r2, r1]
	adds r7, r0, #0
	cmp r2, #0
	ble _02244018
	movs r5, #0
	cmp r2, #0
	ble _02244026
	ldr r0, _02244034 @ =0x02245F58
	adds r6, r0, r1
_02243FFE:
	adds r0, r7, #0
	adds r1, r4, r5
	bl ov70_02243FD4
	cmp r0, #0
	ble _0224400E
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224400E:
	ldr r0, [r6, #4]
	adds r5, r5, #1
	cmp r5, r0
	blt _02243FFE
	b _02244026
_02244018:
	adds r1, r4, #0
	bl ov70_02243FD4
	cmp r0, #0
	ble _02244026
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02244026:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224402C: .4byte 0x02245E84
_02244030: .4byte 0x02245F5C
_02244034: .4byte 0x02245F58
	thumb_func_end ov70_02243FE0

	thumb_func_start ov70_02244038
ov70_02244038: @ 0x02244038
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl ov70_02244670
	ldr r2, _02244114 @ =0x04000304
	ldr r0, _02244118 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #6
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #4]
	bl ov70_022441A4
	adds r0, r4, #0
	bl ov70_022442B4
	adds r0, r4, #0
	bl ov70_0224458C
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #8
	movs r1, #0
	bl FUN_02022CC8
	blx FUN_021EC5B4
	cmp r0, #0
	bne _022440FA
	ldr r1, [r4]
	ldr r0, [r1, #0x3c]
	cmp r0, #0
	beq _022440EE
	ldr r0, [r1, #0x20]
	bl FUN_02039418
	ldr r0, _0224411C @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	ldr r1, _02244120 @ =0x00000BA8
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #2
	bl ov70_02238D84
	adds r0, r4, #0
	bl ov70_02238F64
	b _0224410C
_022440EE:
	movs r0, #4
	bl FUN_0201A4CC
	movs r0, #0
	str r0, [r4, #0x2c]
	b _0224410C
_022440FA:
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_02039418
	adds r0, r4, #0
	bl ov70_02245124
	movs r0, #0x11
	str r0, [r4, #0x2c]
_0224410C:
	movs r0, #2
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02244114: .4byte 0x04000304
_02244118: .4byte 0xFFFF7FFF
_0224411C: .4byte 0x00000F0F
_02244120: .4byte 0x00000BA8
	thumb_func_end ov70_02244038

	thumb_func_start ov70_02244124
ov70_02244124: @ 0x02244124
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov70_02238E44
	bl FUN_0203A930
	ldr r4, [r5, #0x2c]
	ldr r1, _02244150 @ =0x02246780
	lsls r2, r4, #2
	ldr r1, [r1, r2]
	adds r0, r5, #0
	blx r1
	ldr r1, [r5, #0x2c]
	cmp r4, r1
	beq _0224414E
	movs r1, #0x16
	movs r2, #0
	lsls r1, r1, #8
	strh r2, [r5, r1]
	adds r1, r1, #2
	strh r2, [r5, r1]
_0224414E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02244150: .4byte 0x02246780
	thumb_func_end ov70_02244124

	thumb_func_start ov70_02244154
ov70_02244154: @ 0x02244154
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0224419C @ =0x000012D0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224416E
	bl FUN_0200E390
	ldr r0, _0224419C @ =0x000012D0
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
_0224416E:
	adds r0, r4, #0
	bl ov70_022446A8
	adds r0, r4, #0
	bl ov70_02244644
	ldr r0, [r4, #4]
	bl ov70_02244290
	ldr r0, _022441A0 @ =0x000012D4
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r4, #0
	bl ov70_02238E58
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02244196
	movs r0, #5
	pop {r4, pc}
_02244196:
	movs r0, #1
	pop {r4, pc}
	nop
_0224419C: .4byte 0x000012D0
_022441A0: .4byte 0x000012D4
	thumb_func_end ov70_02244154

	thumb_func_start ov70_022441A4
ov70_022441A4: @ 0x022441A4
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _02244280 @ =0x02246058
	adds r4, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #0x54
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
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201CAE0
	ldr r5, _02244284 @ =0x0224603C
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
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldr r5, _02244288 @ =0x02246020
	add r3, sp, #0x1c
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
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201CAE0
	ldr r5, _0224428C @ =0x02246074
	add r3, sp, #0
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
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3d
	bl FUN_0201C1C4
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	add sp, #0x70
	pop {r3, r4, r5, pc}
	nop
_02244280: .4byte 0x02246058
_02244284: .4byte 0x0224603C
_02244288: .4byte 0x02246020
_0224428C: .4byte 0x02246074
	thumb_func_end ov70_022441A4

	thumb_func_start ov70_02244290
ov70_02244290: @ 0x02244290
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BB4C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	thumb_func_end ov70_02244290

	thumb_func_start ov70_022442B4
ov70_022442B4: @ 0x022442B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x10]
	ldr r4, [r0, #4]
	movs r0, #0x58
	movs r1, #0x3d
	bl FUN_02007688
	movs r2, #0
	str r2, [sp]
	movs r1, #0x3d
	str r1, [sp, #4]
	movs r1, #3
	adds r3, r2, #0
	str r0, [sp, #0x2c]
	bl FUN_02007B8C
	movs r3, #0
	str r3, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	movs r1, #3
	movs r2, #4
	bl FUN_02007B8C
	movs r1, #0x1a
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	movs r1, #0x1a
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x3d
	bl FUN_0200304C
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E644
	movs r1, #0
	str r1, [sp]
	movs r0, #0x3d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E3DC
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #2
	adds r2, r4, #0
	movs r3, #1
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #6
	adds r2, r4, #0
	movs r3, #1
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #0xb
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B44
	movs r1, #0
	movs r0, #6
	str r1, [sp]
	lsls r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x3d
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	movs r1, #0xc
	adds r2, r4, #0
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201C2D8
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	movs r2, #0x33
	ldr r1, _022444CC @ =0x000012D0
	ldr r0, [sp, #0x10]
	lsls r2, r2, #4
	adds r0, r0, r1
	movs r1, #0
	blx FUN_020D4994
	ldr r0, [sp, #0x2c]
	movs r1, #5
	add r2, sp, #0x38
	movs r3, #0x3d
	bl FUN_02007C48
	adds r4, r0, #0
	ldr r0, [sp, #0x38]
	ldr r2, _022444D0 @ =0x000012D8
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	adds r1, r1, r2
	movs r2, #0x80
	blx FUN_020D47B8
	ldr r0, [sp, #0x38]
	ldr r2, _022444D4 @ =0x00001358
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #0xc]
	adds r1, r1, r2
	movs r2, #0x80
	blx FUN_020D47B8
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, _022444D4 @ =0x00001358
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	subs r1, #0x80
	adds r0, r0, r1
	str r0, [sp, #0x14]
_02244404:
	movs r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	lsls r1, r0, #5
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	str r0, [sp, #0x30]
_02244416:
	ldr r0, [sp, #0x24]
	cmp r0, #0x15
	blt _02244420
	bl FUN_0202551C
_02244420:
	ldr r0, [sp, #0x30]
	movs r7, #1
	adds r4, r0, #2
	ldr r0, [sp, #0x18]
	adds r6, r0, #2
	ldr r0, [sp, #0x14]
	adds r5, r0, #2
	ldr r0, [sp, #0x20]
	asrs r0, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x34]
_02244438:
	ldr r0, _022444D0 @ =0x000012D8
	ldr r3, [sp, #0x34]
	ldrh r0, [r4, r0]
	adds r1, r6, #0
	movs r2, #1
	str r0, [sp]
	adds r0, r5, #0
	bl FUN_02003DE8
	adds r7, r7, #1
	adds r4, r4, #2
	adds r6, r6, #2
	adds r5, r5, #2
	cmp r7, #0x10
	blt _02244438
	ldr r0, [sp, #0x18]
	adds r0, #0x20
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	beq _02244482
	movs r0, #3
	ldr r1, [sp, #0x20]
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r0, #1
	lsls r0, r0, #0xc
	str r1, [sp, #0x20]
	cmp r1, r0
	blt _02244416
	str r0, [sp, #0x20]
	movs r0, #1
	str r0, [sp, #0x1c]
	b _02244416
_02244482:
	ldr r0, [sp, #0x14]
	adds r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #3
	blt _02244404
	ldr r1, _022444D4 @ =0x00001358
	ldr r0, [sp, #0x10]
	adds r0, r0, r1
	movs r1, #0x2a
	lsls r1, r1, #4
	blx FUN_020D2894
	ldr r1, _022444D8 @ =0x000012D4
	ldr r0, [sp, #0x10]
	movs r2, #1
	str r2, [r0, r1]
	ldr r2, _022444DC @ =0x000015FC
	movs r3, #0
	str r3, [r0, r2]
	subs r2, r1, #4
	ldr r1, [sp, #0x10]
	ldr r0, _022444E0 @ =ov70_022444E4
	adds r1, r1, r2
	movs r2, #0x14
	bl FUN_0200E33C
	ldr r2, _022444CC @ =0x000012D0
	ldr r1, [sp, #0x10]
	str r0, [r1, r2]
	ldr r0, [sp, #0x2c]
	bl FUN_0200770C
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022444CC: .4byte 0x000012D0
_022444D0: .4byte 0x000012D8
_022444D4: .4byte 0x00001358
_022444D8: .4byte 0x000012D4
_022444DC: .4byte 0x000015FC
_022444E0: .4byte ov70_022444E4
	thumb_func_end ov70_022442B4

	thumb_func_start ov70_022444E4
ov70_022444E4: @ 0x022444E4
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02244582
	ldr r1, _02244584 @ =0x0000032B
	movs r0, #1
	ldrb r2, [r4, r1]
	eors r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _02244582
	adds r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _0224451A
	subs r0, r1, #3
	ldrsh r0, [r4, r0]
	adds r2, r4, #0
	adds r2, #0x88
	lsls r0, r0, #5
	adds r0, r2, r0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFC6C
_0224451A:
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02244528
	cmp r0, #2
	bne _0224453E
_02244528:
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
_0224453E:
	ldr r0, _02244588 @ =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _02244566
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	adds r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _02244582
	movs r2, #0x13
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	movs r1, #1
	eors r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_02244566:
	subs r1, r0, #2
	ldrsh r1, [r4, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _02244582
	movs r2, #1
	subs r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eors r1, r2
	strb r1, [r4, r0]
_02244582:
	pop {r4, pc}
	.align 2, 0
_02244584: .4byte 0x0000032B
_02244588: .4byte 0x0000032A
	thumb_func_end ov70_022444E4

	thumb_func_start ov70_0224458C
ov70_0224458C: @ 0x0224458C
	push {r3, r4, lr}
	sub sp, #0x14
	movs r3, #4
	adds r4, r0, #0
	str r3, [sp]
	movs r0, #0x17
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x94
	ldr r1, _02244634 @ =0x00000F48
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	bl FUN_0201D40C
	ldr r0, _02244634 @ =0x00000F48
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	movs r0, #1
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r1, _02244638 @ =0x00000F38
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #4
	bl FUN_0201D40C
	ldr r0, _02244638 @ =0x00000F38
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	movs r3, #1
	movs r1, #0x2f
	ldr r0, _0224463C @ =0x000F0E00
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _02244638 @ =0x00000F38
	lsls r1, r1, #6
	ldr r1, [r4, r1]
	adds r0, r4, r0
	movs r2, #0
	bl ov70_02245050
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0x28
	ldr r1, _02244640 @ =0x00000F18
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	adds r1, r4, r1
	movs r2, #0
	movs r3, #2
	bl FUN_0201D40C
	ldr r0, _02244640 @ =0x00000F18
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02244634: .4byte 0x00000F48
_02244638: .4byte 0x00000F38
_0224463C: .4byte 0x000F0E00
_02244640: .4byte 0x00000F18
	thumb_func_end ov70_0224458C

	thumb_func_start ov70_02244644
ov70_02244644: @ 0x02244644
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02244664 @ =0x00000F18
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _02244668 @ =0x00000F38
	adds r0, r4, r0
	bl FUN_0201D520
	ldr r0, _0224466C @ =0x00000F48
	adds r0, r4, r0
	bl FUN_0201D520
	pop {r4, pc}
	nop
_02244664: .4byte 0x00000F18
_02244668: .4byte 0x00000F38
_0224466C: .4byte 0x00000F48
	thumb_func_end ov70_02244644

	thumb_func_start ov70_02244670
ov70_02244670: @ 0x02244670
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb4
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _022446A0 @ =0x00000BBC
	str r0, [r4, r1]
	movs r0, #1
	lsls r0, r0, #8
	movs r1, #0x3d
	bl FUN_02026354
	ldr r1, _022446A4 @ =0x00000BEC
	str r0, [r4, r1]
	subs r1, #0x4c
	ldr r0, [r4, r1]
	movs r1, #0x1f
	bl FUN_0200BBA0
	movs r1, #0x2f
	lsls r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_022446A0: .4byte 0x00000BBC
_022446A4: .4byte 0x00000BEC
	thumb_func_end ov70_02244670

	thumb_func_start ov70_022446A8
ov70_022446A8: @ 0x022446A8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _022446C8 @ =0x00000BEC
	ldr r0, [r4, r0]
	bl FUN_02026380
	ldr r0, _022446CC @ =0x00000BBC
	ldr r0, [r4, r0]
	bl FUN_02026380
	pop {r4, pc}
	.align 2, 0
_022446C8: .4byte 0x00000BEC
_022446CC: .4byte 0x00000BBC
	thumb_func_end ov70_022446A8

	thumb_func_start ov70_022446D0
ov70_022446D0: @ 0x022446D0
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _022446FC @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02244700 @ =0x00000BAC
	movs r2, #0x11
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #1
	bl ov70_02238D84
	ldr r0, _02244704 @ =0x000011FA
	movs r1, #1
	strh r1, [r4, r0]
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_022446FC: .4byte 0x00000F0F
_02244700: .4byte 0x00000BAC
_02244704: .4byte 0x000011FA
	thumb_func_end ov70_022446D0

	thumb_func_start ov70_02244708
ov70_02244708: @ 0x02244708
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _02244742
	ldr r0, _02244768 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	ldr r0, _0224476C @ =0x00000F0F
	movs r2, #1
	str r0, [sp]
	ldr r1, _02244770 @ =0x00000BA8
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r3, r2, #0
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #2
	bl ov70_02238D84
	adds r0, r4, #0
	bl ov70_02238F64
	b _02244760
_02244742:
	cmp r0, #2
	bne _02244760
	ldr r0, _02244768 @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	bl FUN_0203946C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #0xb
	str r0, [r4, #0x2c]
_02244760:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02244768: .4byte 0x000011C8
_0224476C: .4byte 0x00000F0F
_02244770: .4byte 0x00000BA8
	thumb_func_end ov70_02244708

	thumb_func_start ov70_02244774
ov70_02244774: @ 0x02244774
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0224479C @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #7
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0x10
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0224479C: .4byte 0x00000F0F
	thumb_func_end ov70_02244774

	thumb_func_start ov70_022447A0
ov70_022447A0: @ 0x022447A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02244800 @ =0x000011B0
	movs r1, #0x3d
	ldr r0, [r4, r0]
	bl FUN_02001FDC
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _022447FC
	subs r1, r1, #1
	cmp r0, r1
	bne _022447DE
	blx FUN_021EC5B4
	cmp r0, #0
	bne _022447CA
	movs r0, #0
	str r0, [r4, #0x2c]
	b _022447FC
_022447CA:
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0xb
	bl ov70_02238E50
	movs r0, #1
	str r0, [r4, #0x1c]
	movs r0, #0xb
	str r0, [r4, #0x2c]
	b _022447FC
_022447DE:
	blx FUN_021EC5B4
	cmp r0, #0
	beq _022447EA
	blx FUN_021EC8D8
_022447EA:
	bl FUN_0203946C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #0xb
	str r0, [r4, #0x2c]
_022447FC:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02244800: .4byte 0x000011B0
	thumb_func_end ov70_022447A0

	thumb_func_start ov70_02244804
ov70_02244804: @ 0x02244804
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0224482C @ =0x00000F0F
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, _02244830 @ =0x00000BAC
	movs r2, #0x1a
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x12
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0224482C: .4byte 0x00000F0F
_02244830: .4byte 0x00000BAC
	thumb_func_end ov70_02244804

	thumb_func_start ov70_02244834
ov70_02244834: @ 0x02244834
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203946C
	blx FUN_021EC8D8
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #0x13
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02244834

	thumb_func_start ov70_02244854
ov70_02244854: @ 0x02244854
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl FUN_0203A914
	ldr r0, _02244880 @ =0x00000F0F
	ldr r1, _02244884 @ =0x00000BAC
	str r0, [sp]
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0x1b
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0x14
	movs r2, #0xb
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02244880: .4byte 0x00000F0F
_02244884: .4byte 0x00000BAC
	thumb_func_end ov70_02244854

	thumb_func_start ov70_02244888
ov70_02244888: @ 0x02244888
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x20]
	bl FUN_02039418
	movs r0, #4
	bl FUN_0201A4BC
	adds r0, r4, #0
	bl ov70_02245124
	adds r0, r4, #0
	adds r0, #0x54
	movs r1, #2
	movs r2, #1
	movs r3, #0x14
	blx FUN_021EC3F0
	movs r0, #2
	blx FUN_021EC454
	blx FUN_021EC4A4
	movs r0, #3
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02244888

	thumb_func_start ov70_022448C0
ov70_022448C0: @ 0x022448C0
	push {r4, lr}
	sub sp, #0x48
	adds r4, r0, #0
	blx FUN_021EC60C
	blx FUN_021EC5B4
	cmp r0, #0
	beq _0224493E
	blx FUN_021EC724
	cmp r0, #8
	bhi _0224491E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022448E6: @ jump table
	.2byte _0224491E - _022448E6 - 2 @ case 0
	.2byte _0224491E - _022448E6 - 2 @ case 1
	.2byte _0224491E - _022448E6 - 2 @ case 2
	.2byte _0224491E - _022448E6 - 2 @ case 3
	.2byte _02244934 - _022448E6 - 2 @ case 4
	.2byte _0224491E - _022448E6 - 2 @ case 5
	.2byte _0224491E - _022448E6 - 2 @ case 6
	.2byte _022448F8 - _022448E6 - 2 @ case 7
	.2byte _0224491E - _022448E6 - 2 @ case 8
_022448F8:
	add r0, sp, #8
	add r1, sp, #4
	blx FUN_021EC11C
	str r0, [r4, #0x40]
	ldr r0, [sp, #8]
	str r0, [r4, #0x44]
	ldr r0, [sp, #4]
	str r0, [r4, #0x48]
	blx FUN_021EC210
	blx FUN_021EC8D8
	adds r0, r4, #0
	bl ov70_02238F80
	movs r0, #0x17
	str r0, [r4, #0x2c]
	b _0224493E
_0224491E:
	add r0, sp, #0
	blx FUN_021EC0FC
	adds r0, r4, #0
	bl ov70_02238F80
	movs r0, #0x15
	str r0, [r4, #0x2c]
	subs r0, #0x17
	str r0, [r4, #0x3c]
	b _0224493E
_02244934:
	add r0, sp, #0xc
	blx FUN_021EC9E0
	movs r0, #4
	str r0, [r4, #0x2c]
_0224493E:
	movs r0, #3
	add sp, #0x48
	pop {r4, pc}
	thumb_func_end ov70_022448C0

	thumb_func_start ov70_02244944
ov70_02244944: @ 0x02244944
	push {r4, lr}
	adds r4, r0, #0
	blx FUN_021ECD04
	movs r0, #5
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov70_02244944

	thumb_func_start ov70_02244954
ov70_02244954: @ 0x02244954
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	blx FUN_021ECDC8
	cmp r0, #5
	bhi _022449F4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0224496E: @ jump table
	.2byte _02244980 - _0224496E - 2 @ case 0
	.2byte _022449F4 - _0224496E - 2 @ case 1
	.2byte _022449F4 - _0224496E - 2 @ case 2
	.2byte _0224497A - _0224496E - 2 @ case 3
	.2byte _02244980 - _0224496E - 2 @ case 4
	.2byte _02244980 - _0224496E - 2 @ case 5
_0224497A:
	movs r0, #6
	str r0, [r4, #0x2c]
	b _022449F4
_02244980:
	adds r0, r4, #0
	bl ov70_02238F80
	add r0, sp, #4
	add r1, sp, #0
	blx FUN_021EC11C
	str r0, [r4, #0x40]
	ldr r0, [sp, #4]
	str r0, [r4, #0x44]
	blx FUN_021EC210
	blx FUN_021EC8D8
	movs r0, #0x17
	str r0, [r4, #0x2c]
	ldr r1, [sp]
	cmp r1, #7
	bhi _022449E2
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022449B2: @ jump table
	.2byte _022449E2 - _022449B2 - 2 @ case 0
	.2byte _022449C2 - _022449B2 - 2 @ case 1
	.2byte _022449C2 - _022449B2 - 2 @ case 2
	.2byte _022449D4 - _022449B2 - 2 @ case 3
	.2byte _022449C6 - _022449B2 - 2 @ case 4
	.2byte _022449DE - _022449B2 - 2 @ case 5
	.2byte _022449D0 - _022449B2 - 2 @ case 6
	.2byte _022449DE - _022449B2 - 2 @ case 7
_022449C2:
	str r0, [r4, #0x2c]
	b _022449E2
_022449C6:
	blx FUN_021FA0D8
	movs r0, #0x17
	str r0, [r4, #0x2c]
	b _022449E2
_022449D0:
	str r0, [r4, #0x2c]
	b _022449E2
_022449D4:
	blx FUN_021ED9B4
	movs r0, #0x17
	str r0, [r4, #0x2c]
	b _022449E2
_022449DE:
	bl FUN_020399EC
_022449E2:
	ldr r1, [sp, #4]
	ldr r0, _022449FC @ =0xFFFFB1E0
	cmp r1, r0
	bge _022449F4
	ldr r0, _02244A00 @ =0xFFFF8AD1
	cmp r1, r0
	blt _022449F4
	movs r0, #0x17
	str r0, [r4, #0x2c]
_022449F4:
	movs r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_022449FC: .4byte 0xFFFFB1E0
_02244A00: .4byte 0xFFFF8AD1
	thumb_func_end ov70_02244954

	thumb_func_start ov70_02244A04
ov70_02244A04: @ 0x02244A04
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x14]
	bl FUN_0202C08C
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl FUN_02028DD8
	cmp r0, #0
	bne _02244A28
	ldr r1, [r5]
	ldr r0, [r1, #4]
	ldr r1, [r1, #0x34]
	bl FUN_02028DDC
_02244A28:
	ldr r0, [r5]
	ldr r0, [r0, #4]
	bl FUN_02028DD8
	adds r6, r0, #0
	adds r0, r4, #0
	blx FUN_020A0310
	adds r3, r0, #0
	adds r2, r1, #0
	adds r0, r6, #0
	adds r1, r3, #0
	bl ov70_022378C0
	movs r0, #7
	str r0, [r5, #0x2c]
	movs r0, #3
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_02244A04

	thumb_func_start ov70_02244A4C
ov70_02244A4C: @ 0x02244A4C
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_022382C0
	movs r0, #8
	str r0, [r4, #0x2c]
	ldr r0, _02244A64 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_02244A64: .4byte 0x00001604
	thumb_func_end ov70_02244A4C

	thumb_func_start ov70_02244A68
ov70_02244A68: @ 0x02244A68
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	beq _02244B02
	bl ov70_02237F58
	adds r5, r0, #0
	ldr r0, _02244B1C @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x11
	bhi _02244AF6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02244A94: @ jump table
	.2byte _02244ADA - _02244A94 - 2 @ case 0
	.2byte _02244AE8 - _02244A94 - 2 @ case 1
	.2byte _02244AF6 - _02244A94 - 2 @ case 2
	.2byte _02244ADA - _02244A94 - 2 @ case 3
	.2byte _02244AF6 - _02244A94 - 2 @ case 4
	.2byte _02244AF6 - _02244A94 - 2 @ case 5
	.2byte _02244AF6 - _02244A94 - 2 @ case 6
	.2byte _02244AF6 - _02244A94 - 2 @ case 7
	.2byte _02244AF6 - _02244A94 - 2 @ case 8
	.2byte _02244AF6 - _02244A94 - 2 @ case 9
	.2byte _02244AF6 - _02244A94 - 2 @ case 10
	.2byte _02244AF6 - _02244A94 - 2 @ case 11
	.2byte _02244AF6 - _02244A94 - 2 @ case 12
	.2byte _02244AE8 - _02244A94 - 2 @ case 13
	.2byte _02244ACC - _02244A94 - 2 @ case 14
	.2byte _02244AB8 - _02244A94 - 2 @ case 15
	.2byte _02244ABE - _02244A94 - 2 @ case 16
	.2byte _02244ACC - _02244A94 - 2 @ case 17
_02244AB8:
	movs r0, #9
	str r0, [r4, #0x2c]
	b _02244B18
_02244ABE:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244ACC:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244ADA:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244AE8:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244B18
_02244AF6:
	adds r0, r4, #0
	bl ov70_02238F80
	bl FUN_020399EC
	b _02244B18
_02244B02:
	ldr r0, _02244B1C @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02244B18
	bl FUN_020399EC
_02244B18:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_02244B1C: .4byte 0x00001604
	thumb_func_end ov70_02244A68

	thumb_func_start ov70_02244B20
ov70_02244B20: @ 0x02244B20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, _02244B4C @ =0x00001260
	ldr r0, [r0, #0x20]
	adds r1, r4, r1
	bl FUN_0203189C
	ldr r1, _02244B4C @ =0x00001260
	adds r0, r4, r1
	adds r1, #0x64
	adds r1, r4, r1
	bl ov70_02238304
	movs r0, #0xa
	str r0, [r4, #0x2c]
	ldr r0, _02244B50 @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
	nop
_02244B4C: .4byte 0x00001260
_02244B50: .4byte 0x00001604
	thumb_func_end ov70_02244B20

	thumb_func_start ov70_02244B54
ov70_02244B54: @ 0x02244B54
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov70_02237F38
	cmp r0, #0
	bne _02244B62
	b _02244C72
_02244B62:
	bl ov70_02237F58
	adds r5, r0, #0
	ldr r0, _02244C8C @ =0x00001604
	movs r1, #0
	str r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x11
	bhi _02244C66
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02244B82: @ jump table
	.2byte _02244C4A - _02244B82 - 2 @ case 0
	.2byte _02244C58 - _02244B82 - 2 @ case 1
	.2byte _02244C66 - _02244B82 - 2 @ case 2
	.2byte _02244C4A - _02244B82 - 2 @ case 3
	.2byte _02244C66 - _02244B82 - 2 @ case 4
	.2byte _02244C66 - _02244B82 - 2 @ case 5
	.2byte _02244C66 - _02244B82 - 2 @ case 6
	.2byte _02244C66 - _02244B82 - 2 @ case 7
	.2byte _02244C66 - _02244B82 - 2 @ case 8
	.2byte _02244C66 - _02244B82 - 2 @ case 9
	.2byte _02244C66 - _02244B82 - 2 @ case 10
	.2byte _02244C66 - _02244B82 - 2 @ case 11
	.2byte _02244C66 - _02244B82 - 2 @ case 12
	.2byte _02244C58 - _02244B82 - 2 @ case 13
	.2byte _02244C3C - _02244B82 - 2 @ case 14
	.2byte _02244BA6 - _02244B82 - 2 @ case 15
	.2byte _02244C2E - _02244B82 - 2 @ case 16
	.2byte _02244C3C - _02244B82 - 2 @ case 17
_02244BA6:
	adds r0, r4, #0
	bl ov70_02238F80
	ldr r0, _02244C90 @ =0x000012C4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02244BBE
	cmp r1, #1
	beq _02244C0E
	cmp r1, #2
	beq _02244C18
	b _02244C22
_02244BBE:
	adds r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #3
	bhi _02244C08
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02244BD2: @ jump table
	.2byte _02244BDA - _02244BD2 - 2 @ case 0
	.2byte _02244BF4 - _02244BD2 - 2 @ case 1
	.2byte _02244BFE - _02244BD2 - 2 @ case 2
	.2byte _02244BEA - _02244BD2 - 2 @ case 3
_02244BDA:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov70_02238E50
	movs r0, #0xb
	str r0, [r4, #0x2c]
	b _02244C88
_02244BEA:
	ldr r0, _02244C94 @ =0xFFFFEC75
	str r0, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244BF4:
	ldr r0, _02244C98 @ =0xFFFFEC78
	str r0, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244BFE:
	ldr r0, _02244C9C @ =0xFFFFEC77
	str r0, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C08:
	bl FUN_020399EC
	b _02244C88
_02244C0E:
	ldr r0, _02244CA0 @ =0xFFFFEC74
	str r0, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C18:
	ldr r0, _02244CA4 @ =0xFFFFEC73
	str r0, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C22:
	adds r0, r4, #0
	bl ov70_02238F80
	bl FUN_020399EC
	b _02244C88
_02244C2E:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C3C:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C4A:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C58:
	adds r0, r4, #0
	bl ov70_02238F80
	str r5, [r4, #0x3c]
	movs r0, #0x15
	str r0, [r4, #0x2c]
	b _02244C88
_02244C66:
	adds r0, r4, #0
	bl ov70_02238F80
	bl FUN_020399EC
	b _02244C88
_02244C72:
	ldr r0, _02244C8C @ =0x00001604
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	movs r0, #0xe1
	lsls r0, r0, #4
	cmp r1, r0
	bne _02244C88
	bl FUN_020399EC
_02244C88:
	movs r0, #3
	pop {r3, r4, r5, pc}
	.align 2, 0
_02244C8C: .4byte 0x00001604
_02244C90: .4byte 0x000012C4
_02244C94: .4byte 0xFFFFEC75
_02244C98: .4byte 0xFFFFEC78
_02244C9C: .4byte 0xFFFFEC77
_02244CA0: .4byte 0xFFFFEC74
_02244CA4: .4byte 0xFFFFEC73
	thumb_func_end ov70_02244B54

	thumb_func_start ov70_02244CA8
ov70_02244CA8: @ 0x02244CA8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	rsbs r0, r0, #0
	bl FUN_021E6A70
	ldr r2, [r4, #0x44]
	adds r1, r0, #0
	adds r0, r4, #0
	rsbs r2, r2, #0
	bl ov70_022451A8
	movs r0, #0x18
	str r0, [r4, #0x2c]
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02244CA8

	thumb_func_start ov70_02244CCC
ov70_02244CCC: @ 0x02244CCC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02244CFC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	bne _02244CE8
	movs r0, #2
	tst r0, r1
	bne _02244CE8
	ldr r0, _02244D00 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _02244CF6
_02244CE8:
	ldr r0, _02244D04 @ =0x00000F48
	movs r1, #0
	adds r0, r4, r0
	bl FUN_0200E5D4
	movs r0, #0
	str r0, [r4, #0x2c]
_02244CF6:
	movs r0, #3
	pop {r4, pc}
	nop
_02244CFC: .4byte 0x021D110C
_02244D00: .4byte 0x021D114C
_02244D04: .4byte 0x00000F48
	thumb_func_end ov70_02244CCC

	thumb_func_start ov70_02244D08
ov70_02244D08: @ 0x02244D08
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	bl FUN_0203A914
	adds r0, r4, #0
	bl ov70_02238F80
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3d
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _02244D40 @ =0x000011FC
	movs r1, #1
	str r1, [r4, r0]
	movs r0, #4
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02244D40: .4byte 0x000011FC
	thumb_func_end ov70_02244D08

	thumb_func_start ov70_02244D44
ov70_02244D44: @ 0x02244D44
	push {r4, lr}
	adds r4, r0, #0
	bl ov70_02238C8C
	cmp r0, #1
	bne _02244D68
	ldr r0, _02244D7C @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #0xb
	str r0, [r4, #0x2c]
	b _02244D78
_02244D68:
	cmp r0, #2
	bne _02244D78
	ldr r0, _02244D7C @ =0x000011C8
	ldr r0, [r4, r0]
	bl FUN_02016624
	movs r0, #0
	str r0, [r4, #0x2c]
_02244D78:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02244D7C: .4byte 0x000011C8
	thumb_func_end ov70_02244D44

	thumb_func_start ov70_02244D80
ov70_02244D80: @ 0x02244D80
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r2, #0xd
	ldr r0, [r4, #0x3c]
	mvns r2, r2
	cmp r0, r2
	bgt _02244DBE
	bge _02244DFA
	ldr r1, _02244E38 @ =0xFFFFEC78
	cmp r0, r1
	bgt _02244DB6
	ldr r1, _02244E3C @ =0x0000138D
	adds r1, r0, r1
	bmi _02244DFE
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02244DAA: @ jump table
	.2byte _02244E12 - _02244DAA - 2 @ case 0
	.2byte _02244E0E - _02244DAA - 2 @ case 1
	.2byte _02244E02 - _02244DAA - 2 @ case 2
	.2byte _02244DFE - _02244DAA - 2 @ case 3
	.2byte _02244E0A - _02244DAA - 2 @ case 4
	.2byte _02244E06 - _02244DAA - 2 @ case 5
_02244DB6:
	movs r1, #0xe
	mvns r1, r1
	cmp r0, r1
	b _02244DFE
_02244DBE:
	adds r1, r2, #0
	adds r1, #9
	cmp r0, r1
	bgt _02244DD4
	adds r1, r2, #0
	adds r1, #9
	cmp r0, r1
	bge _02244DFE
	adds r1, r2, #2
	cmp r0, r1
	b _02244DFE
_02244DD4:
	adds r0, r0, #3
	cmp r0, #5
	bhi _02244DFE
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02244DE6: @ jump table
	.2byte _02244DFE - _02244DE6 - 2 @ case 0
	.2byte _02244DFA - _02244DE6 - 2 @ case 1
	.2byte _02244DF6 - _02244DE6 - 2 @ case 2
	.2byte _02244DFE - _02244DE6 - 2 @ case 3
	.2byte _02244DF2 - _02244DE6 - 2 @ case 4
	.2byte _02244DF6 - _02244DE6 - 2 @ case 5
_02244DF2:
	movs r2, #0x96
	b _02244E14
_02244DF6:
	movs r2, #0x97
	b _02244E14
_02244DFA:
	movs r2, #0x9c
	b _02244E14
_02244DFE:
	movs r2, #0x9b
	b _02244E14
_02244E02:
	movs r2, #0xb9
	b _02244E14
_02244E06:
	movs r2, #0xb6
	b _02244E14
_02244E0A:
	movs r2, #0xb6
	b _02244E14
_02244E0E:
	movs r2, #0xb7
	b _02244E14
_02244E12:
	movs r2, #0xb8
_02244E14:
	ldr r0, _02244E40 @ =0x00000F0F
	movs r1, #0xba
	str r0, [sp]
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	movs r3, #1
	bl ov70_02244FA4
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x16
	bl ov70_02238D84
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02244E38: .4byte 0xFFFFEC78
_02244E3C: .4byte 0x0000138D
_02244E40: .4byte 0x00000F0F
	thumb_func_end ov70_02244D80

	thumb_func_start ov70_02244E44
ov70_02244E44: @ 0x02244E44
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0x16
	adds r4, r0, #0
	lsls r1, r1, #8
	ldrsh r1, [r4, r1]
	cmp r1, #3
	bhi _02244EE8
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02244E60: @ jump table
	.2byte _02244E68 - _02244E60 - 2 @ case 0
	.2byte _02244E86 - _02244E60 - 2 @ case 1
	.2byte _02244EAC - _02244E60 - 2 @ case 2
	.2byte _02244ECA - _02244E60 - 2 @ case 3
_02244E68:
	ldr r1, _02244F0C @ =0x00000F0F
	movs r2, #0xba
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	movs r0, #0x16
	lsls r0, r0, #8
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244E86:
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02244F04
	bl FUN_0203946C
	blx FUN_021EC8D8
	movs r0, #0x16
	lsls r0, r0, #8
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244EAC:
	ldr r1, _02244F0C @ =0x00000F0F
	movs r2, #0xbb
	str r1, [sp]
	movs r1, #0xba
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	movs r3, #1
	bl ov70_02244FA4
	movs r0, #0x16
	lsls r0, r0, #8
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244ECA:
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02244F04
	movs r0, #0x16
	lsls r0, r0, #8
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _02244F04
_02244EE8:
	ldr r0, _02244F10 @ =0x00001602
	ldrsh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0x1e
	ble _02244F04
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov70_02238E50
	movs r0, #0xb
	str r0, [r4, #0x2c]
_02244F04:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_02244F0C: .4byte 0x00000F0F
_02244F10: .4byte 0x00001602
	thumb_func_end ov70_02244E44

	thumb_func_start ov70_02244F14
ov70_02244F14: @ 0x02244F14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02244F2E
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02244F2E:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02244F14

	thumb_func_start ov70_02244F34
ov70_02244F34: @ 0x02244F34
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02244F62
	movs r0, #0x47
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	ble _02244F58
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02244F58:
	movs r0, #0x47
	lsls r0, r0, #6
	ldr r1, [r4, r0]
	adds r1, r1, #1
	str r1, [r4, r0]
_02244F62:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02244F34

	thumb_func_start ov70_02244F68
ov70_02244F68: @ 0x02244F68
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xbf
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _02244F9A
	movs r0, #0
	str r0, [sp]
	movs r2, #0x8d
	ldr r0, [r4, #4]
	movs r1, #0xa
	lsls r2, r2, #2
	movs r3, #8
	bl ov70_02238C14
	ldr r1, _02244FA0 @ =0x000011C8
	str r0, [r4, r1]
	ldr r0, [r4, #0x30]
	str r0, [r4, #0x2c]
_02244F9A:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_02244FA0: .4byte 0x000011C8
	thumb_func_end ov70_02244F68

	thumb_func_start ov70_02244FA4
ov70_02244FA4: @ 0x02244FA4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r1, _0224500C @ =0x00000B9C
	adds r2, r6, #0
	ldr r0, [r5, r1]
	adds r1, #0x20
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	ldr r0, _02245010 @ =0x00000F18
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _02245010 @ =0x00000F18
	movs r1, #0
	adds r0, r5, r0
	movs r2, #1
	movs r3, #0xe
	bl FUN_0200E998
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	ldr r0, _02245010 @ =0x00000F18
	ldr r2, _02245014 @ =0x00000BBC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	movs r0, #0x47
	movs r1, #0
	lsls r0, r0, #6
	str r1, [r5, r0]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0224500C: .4byte 0x00000B9C
_02245010: .4byte 0x00000F18
_02245014: .4byte 0x00000BBC
	thumb_func_end ov70_02244FA4

	thumb_func_start ov70_02245018
ov70_02245018: @ 0x02245018
	push {r4, lr}
	adds r4, r0, #0
	cmp r3, #1
	beq _02245026
	cmp r3, #2
	beq _0224503C
	b _0224504A
_02245026:
	ldr r0, [sp, #0xc]
	movs r2, #0
	bl FUN_02002F30
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r2, r0, #1
	b _0224504A
_0224503C:
	ldr r0, [sp, #0xc]
	movs r2, #0
	bl FUN_02002F30
	ldrb r1, [r4, #7]
	lsls r1, r1, #3
	subs r2, r1, r0
_0224504A:
	adds r0, r2, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov70_02245018

	thumb_func_start ov70_02245050
ov70_02245050: @ 0x02245050
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r3, #0
	ldr r3, [sp, #0x24]
	adds r5, r0, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	adds r6, r1, #0
	bl ov70_02245018
	adds r3, r0, #0
	str r4, [sp]
	movs r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r6, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_02245050

	thumb_func_start ov70_02245084
ov70_02245084: @ 0x02245084
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r3, #0
	ldr r3, [sp, #0x24]
	adds r5, r0, #0
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	adds r6, r1, #0
	bl ov70_02245018
	adds r3, r0, #0
	str r4, [sp]
	movs r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r6, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov70_02245084

	thumb_func_start ov70_022450B8
ov70_022450B8: @ 0x022450B8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r3, #0
	ldr r3, [sp, #0x24]
	adds r5, r0, #0
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	ldr r3, [sp, #0x20]
	adds r6, r1, #0
	bl ov70_02245018
	adds r3, r0, #0
	str r4, [sp]
	movs r1, #0
	ldr r0, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #4
	adds r2, r6, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov70_022450B8

	thumb_func_start ov70_022450EC
ov70_022450EC: @ 0x022450EC
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r1, _0224511C @ =0x0224600C
	lsls r2, r2, #2
	ldr r1, [r1, r2]
	bl FUN_0200BBA0
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _02245120 @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov70_02245084
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0224511C: .4byte 0x0224600C
_02245120: .4byte 0x00010200
	thumb_func_end ov70_022450EC

	thumb_func_start ov70_02245124
ov70_02245124: @ 0x02245124
	ldr r3, _02245128 @ =FUN_0203A880
	bx r3
	.align 2, 0
_02245128: .4byte FUN_0203A880
	thumb_func_end ov70_02245124

	thumb_func_start ov70_0224512C
ov70_0224512C: @ 0x0224512C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #1
	adds r6, r1, #0
	lsls r0, r0, #8
	movs r1, #0x3d
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, _02245198 @ =0x00000BAC
	adds r1, r6, #0
	ldr r0, [r5, r0]
	adds r2, r4, #0
	bl FUN_0200BB6C
	ldr r1, _0224519C @ =0x00000B9C
	adds r2, r4, #0
	ldr r0, [r5, r1]
	adds r1, #0x50
	ldr r1, [r5, r1]
	bl FUN_0200CBBC
	ldr r0, _022451A0 @ =0x00000F48
	movs r1, #0xf
	adds r0, r5, r0
	bl FUN_0201D978
	ldr r0, _022451A0 @ =0x00000F48
	movs r1, #1
	adds r0, r5, r0
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200E580
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _022451A0 @ =0x00000F48
	ldr r2, _022451A4 @ =0x00000BEC
	str r3, [sp, #8]
	ldr r2, [r5, r2]
	adds r0, r5, r0
	movs r1, #1
	bl FUN_020200A8
	movs r1, #0xbf
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02245198: .4byte 0x00000BAC
_0224519C: .4byte 0x00000B9C
_022451A0: .4byte 0x00000F48
_022451A4: .4byte 0x00000BEC
	thumb_func_end ov70_0224512C

	thumb_func_start ov70_022451A8
ov70_022451A8: @ 0x022451A8
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0
	adds r4, r1, #0
	mvns r0, r0
	cmp r4, r0
	bne _022451BA
	movs r4, #0xb
_022451BA:
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _022451E4 @ =0x00000B9C
	movs r1, #0
	ldr r0, [r5, r0]
	movs r3, #5
	bl FUN_0200BFCC
	ldr r0, _022451E8 @ =0x00000F18
	movs r1, #1
	adds r0, r5, r0
	bl FUN_0200E9BC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov70_0224512C
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_022451E4: .4byte 0x00000B9C
_022451E8: .4byte 0x00000F18
	thumb_func_end ov70_022451A8

	.rodata

_022451EC:
	.byte 0x02, 0x00, 0x00, 0x0A
	.byte 0x00, 0x00, 0x80, 0x01, 0xBC, 0x01, 0x3C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x38, 0x00, 0x80, 0x00, 0x60, 0x00, 0x80, 0x00, 0x88, 0x00, 0x28, 0x47, 0x18, 0xE7
	.byte 0x50, 0x6F, 0x18, 0xE7, 0x78, 0x97, 0x18, 0xE7, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x1C, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xA2, 0xBF, 0x03, 0x7D, 0xA2, 0xBF, 0x82, 0xFD
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x00, 0x00, 0x04, 0x05, 0x01, 0x02, 0x06, 0x05, 0x03
	.byte 0x04, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x10, 0x00
	.byte 0x02, 0x00, 0x12, 0x00, 0x16, 0x00, 0x08, 0x00, 0x16, 0x00, 0x0D, 0x00, 0x16, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x06, 0x00, 0x02, 0x00, 0x08, 0x00
	.byte 0x01, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x07, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x03
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x29, 0x02, 0x63, 0x2B, 0x51, 0x02, 0x63
	.byte 0x53, 0x79, 0x02, 0x63, 0x7B, 0xA1, 0x02, 0x63, 0x13, 0x2D, 0x91, 0xFF, 0x3A, 0x55, 0x91, 0xFF
	.byte 0x62, 0x7D, 0x91, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0C, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x67, 0x00, 0x68, 0x00, 0x69, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x33, 0x00, 0x34, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x24, 0x00, 0x2D, 0x00, 0x24, 0x00, 0x47, 0x00, 0x24, 0x00
	.byte 0x61, 0x00, 0x24, 0x00, 0x7B, 0x00, 0x24, 0x00, 0x95, 0x00, 0x24, 0x00, 0x13, 0x00, 0x3B, 0x00
	.byte 0x2D, 0x00, 0x3B, 0x00, 0x47, 0x00, 0x3B, 0x00, 0x61, 0x00, 0x3B, 0x00, 0x7B, 0x00, 0x3B, 0x00
	.byte 0x95, 0x00, 0x3B, 0x00, 0x13, 0x00, 0x52, 0x00, 0x2D, 0x00, 0x52, 0x00, 0x47, 0x00, 0x52, 0x00
	.byte 0x61, 0x00, 0x52, 0x00, 0x7B, 0x00, 0x52, 0x00, 0x95, 0x00, 0x52, 0x00, 0x13, 0x00, 0x69, 0x00
	.byte 0x2D, 0x00, 0x69, 0x00, 0x47, 0x00, 0x69, 0x00, 0x61, 0x00, 0x69, 0x00, 0x7B, 0x00, 0x69, 0x00
	.byte 0x95, 0x00, 0x69, 0x00, 0x13, 0x00, 0x80, 0x00, 0x2D, 0x00, 0x80, 0x00, 0x47, 0x00, 0x80, 0x00
	.byte 0x61, 0x00, 0x80, 0x00, 0x7B, 0x00, 0x80, 0x00, 0x95, 0x00, 0x80, 0x00, 0xE0, 0x00, 0x87, 0x00
	.byte 0x52, 0x00, 0x10, 0x00, 0x1F, 0x06, 0x05, 0x01, 0x1F, 0x07, 0x00, 0x02, 0x1F, 0x08, 0x01, 0x03
	.byte 0x1F, 0x09, 0x02, 0x04, 0x1F, 0x0A, 0x03, 0x05, 0x1F, 0x0B, 0x04, 0x00, 0x00, 0x0C, 0x0B, 0x07
	.byte 0x01, 0x0D, 0x06, 0x08, 0x02, 0x0E, 0x07, 0x09, 0x03, 0x0F, 0x08, 0x0A, 0x04, 0x10, 0x09, 0x0B
	.byte 0x05, 0x11, 0x0A, 0x06, 0x06, 0x12, 0x11, 0x0D, 0x07, 0x13, 0x0C, 0x0E, 0x08, 0x14, 0x0D, 0x0F
	.byte 0x09, 0x15, 0x0E, 0x10, 0x0A, 0x16, 0x0F, 0x11, 0x0B, 0x17, 0x10, 0x0C, 0x0C, 0x18, 0x17, 0x13
	.byte 0x0D, 0x19, 0x12, 0x14, 0x0E, 0x1A, 0x13, 0x15, 0x0F, 0x1B, 0x14, 0x16, 0x10, 0x1C, 0x15, 0x17
	.byte 0x11, 0x1D, 0x16, 0x12, 0x12, 0x1F, 0x1E, 0x19, 0x13, 0x1F, 0x18, 0x1A, 0x14, 0x1F, 0x19, 0x1B
	.byte 0x15, 0x1F, 0x1A, 0x1C, 0x16, 0x1F, 0x1B, 0x1D, 0x17, 0x1F, 0x1C, 0x1E, 0x1E, 0x1E, 0x1D, 0x18
	.byte 0x1A, 0x02, 0x63, 0x65, 0x17, 0x31, 0x08, 0x1E, 0x17, 0x31, 0x22, 0x38, 0x17, 0x31, 0x3C, 0x52
	.byte 0x17, 0x31, 0x56, 0x6C, 0x17, 0x31, 0x70, 0x86, 0x17, 0x31, 0x8A, 0xA0, 0x2E, 0x48, 0x08, 0x1E
	.byte 0x2E, 0x48, 0x22, 0x38, 0x2E, 0x48, 0x3C, 0x52, 0x2E, 0x48, 0x56, 0x6C, 0x2E, 0x48, 0x70, 0x86
	.byte 0x2E, 0x48, 0x8A, 0xA0, 0x45, 0x5F, 0x08, 0x1E, 0x45, 0x5F, 0x22, 0x38, 0x45, 0x5F, 0x3C, 0x52
	.byte 0x45, 0x5F, 0x56, 0x6C, 0x45, 0x5F, 0x70, 0x86, 0x45, 0x5F, 0x8A, 0xA0, 0x5C, 0x76, 0x08, 0x1E
	.byte 0x5C, 0x76, 0x22, 0x38, 0x5C, 0x76, 0x3C, 0x52, 0x5C, 0x76, 0x56, 0x6C, 0x5C, 0x76, 0x70, 0x86
	.byte 0x5C, 0x76, 0x8A, 0xA0, 0x73, 0x8D, 0x08, 0x1E, 0x73, 0x8D, 0x22, 0x38, 0x73, 0x8D, 0x3C, 0x52
	.byte 0x73, 0x8D, 0x56, 0x6C, 0x73, 0x8D, 0x70, 0x86, 0x73, 0x8D, 0x8A, 0xA0, 0x7B, 0x94, 0xBA, 0xF5
	.byte 0x04, 0x1C, 0x92, 0xA2, 0x04, 0x1C, 0x02, 0x12, 0xFF, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x05, 0x00, 0x03, 0x00, 0x07, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x0D, 0x00, 0x03, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x06, 0x00, 0x04, 0x08, 0x00, 0x12
	.byte 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x01, 0x16, 0x02, 0x23, 0x03
	.byte 0x26, 0x04, 0x29, 0x05, 0x2D, 0x06, 0x38, 0x07, 0x3C, 0x08, 0x43, 0x09, 0x46, 0x0A, 0x48, 0x0B
	.byte 0x4C, 0x0C, 0x54, 0x0D, 0x5B, 0x0E, 0x5C, 0x0F, 0x63, 0x11, 0x66, 0x12, 0x73, 0x13, 0x78, 0x14
	.byte 0x7F, 0x15, 0x82, 0xFF, 0x9F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0A, 0x00, 0xA1, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x14, 0x00, 0xA2, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x1E, 0x00, 0xA3, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x28, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x32, 0x00, 0xA5, 0x00, 0x00, 0x00, 0x33, 0x00, 0x3C, 0x00, 0xA6, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x46, 0x00, 0xA7, 0x00, 0x00, 0x00, 0x47, 0x00, 0x50, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0x51, 0x00, 0x5A, 0x00, 0xA9, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x64, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x82, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x84, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x86, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00
	.byte 0x5A, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x64, 0x00, 0x64, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00
	.byte 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00
	.byte 0x3B, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0F, 0x00, 0x10, 0x00
	.byte 0x11, 0x00, 0x12, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x19, 0x00, 0x1B, 0x00
	.byte 0x1C, 0x00, 0x1D, 0x00, 0x1F, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x28, 0x00
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x2D, 0x00, 0x30, 0x00, 0x31, 0x00, 0x32, 0x00, 0x34, 0x00, 0x36, 0x00
	.byte 0x37, 0x00, 0x38, 0x00, 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x45, 0x00
	.byte 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x4A, 0x00, 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00
	.byte 0x51, 0x00, 0x52, 0x00, 0x53, 0x00, 0x55, 0x00, 0x56, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00
	.byte 0x5B, 0x00, 0x5C, 0x00, 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x61, 0x00, 0x62, 0x00, 0x64, 0x00
	.byte 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x6B, 0x00, 0x6F, 0x00, 0x73, 0x00, 0x75, 0x00
	.byte 0x76, 0x00, 0x79, 0x00, 0x7A, 0x00, 0x7E, 0x00, 0x81, 0x00, 0x83, 0x00, 0x85, 0x00, 0x87, 0x00
	.byte 0x8C, 0x00, 0x8E, 0x00, 0x92, 0x00, 0x94, 0x00, 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x9C, 0x00, 0x9D, 0x00, 0x9E, 0x00, 0xA0, 0x00, 0xA1, 0x00, 0xA3, 0x00, 0xA4, 0x00, 0xA6, 0x00
	.byte 0xA7, 0x00, 0x6E, 0x00, 0xAB, 0x00, 0xAC, 0x00, 0xB3, 0x00, 0xB7, 0x00, 0xBA, 0x00, 0xBB, 0x00
	.byte 0xBC, 0x00, 0xBD, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC4, 0x00, 0xC6, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xCA, 0x00, 0xCD, 0x00, 0xCF, 0x00, 0xD3, 0x00, 0xD4, 0x00, 0xD8, 0x00, 0xDA, 0x00
	.byte 0xDB, 0x00, 0xCC, 0x00, 0xDD, 0x00, 0xDC, 0x00, 0xDE, 0x00, 0xE0, 0x00, 0xE2, 0x00, 0xE3, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x26
	.byte 0x00, 0x28, 0x00, 0x2A, 0x00, 0x2C, 0x00, 0x2E, 0x00, 0x30, 0x80, 0x00, 0x36, 0x00, 0x60, 0x00
	.byte 0x37, 0x00, 0xA0, 0x00, 0x37, 0x00, 0x40, 0x00, 0x46, 0x00, 0xC0, 0x00, 0x46, 0x00, 0x30, 0x00
	.byte 0x66, 0x00, 0xD0, 0x00, 0x66, 0x00, 0x46, 0x66, 0x70, 0x90, 0x47, 0x67, 0x50, 0x70, 0x47, 0x67
	.byte 0x90, 0xB0, 0x56, 0x76, 0x30, 0x50, 0x56, 0x76, 0xB0, 0xD0, 0x76, 0x96, 0x20, 0x40, 0x76, 0x96
	.byte 0xC0, 0xE0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
	.byte 0x61, 0x69, 0x24, 0x02, 0xB9, 0x6B, 0x24, 0x02, 0x59, 0x6B, 0x24, 0x02, 0x47, 0x00, 0x00, 0x00
	.byte 0x04, 0x03, 0x04, 0x07, 0x04, 0x0B, 0xC0, 0x20, 0xC0, 0x40, 0xC0, 0x60, 0xC0, 0x88, 0x03, 0x02
	.byte 0x03, 0x05, 0x03, 0x08, 0x03, 0x0B, 0xC0, 0x18, 0xC0, 0x30, 0xC0, 0x48, 0xC0, 0x60, 0xC0, 0x88
	.byte 0xC0, 0x18, 0xC0, 0x30, 0xC0, 0x48, 0xC0, 0x60, 0xC0, 0x88, 0x88, 0x10, 0x88, 0x28, 0x88, 0x40
	.byte 0x88, 0x58, 0x88, 0x70, 0xC0, 0x88, 0x03, 0x01, 0x03, 0x04, 0x03, 0x07, 0x03, 0x0A, 0x03, 0x0D
	.byte 0x18, 0x11, 0x04, 0x02, 0x00, 0x04, 0x05, 0x00, 0x04, 0x08, 0x00, 0x04, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x03, 0x02, 0x01, 0x03, 0x03, 0x00, 0x02, 0x03, 0x03, 0x01, 0x00, 0x02, 0x02, 0x03, 0x03
	.byte 0x18, 0x2C, 0x88, 0xF8, 0x38, 0x4C, 0x88, 0xF8, 0x58, 0x6C, 0x88, 0xF8, 0x85, 0x9A, 0xC5, 0xFA
	.byte 0xFF, 0x00, 0x00, 0x00, 0x28, 0x3C, 0x88, 0x97, 0x28, 0x3C, 0xA8, 0xB7, 0x28, 0x3C, 0xC8, 0xD7
	.byte 0x85, 0x9A, 0xC5, 0xFA, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x05, 0x05, 0x05, 0x09, 0x05, 0x0D, 0x05
	.byte 0x01, 0x08, 0x05, 0x08, 0x09, 0x08, 0x0D, 0x08, 0x01, 0x0B, 0x08, 0x11, 0x08, 0x03, 0x01, 0x05
	.byte 0x05, 0x05, 0x09, 0x05, 0x0D, 0x05, 0x01, 0x08, 0x05, 0x08, 0x09, 0x08, 0x0D, 0x08, 0x01, 0x0B
	.byte 0x09, 0x11, 0x01, 0x02, 0x01, 0x02, 0x01, 0x05, 0x05, 0x05, 0x09, 0x05, 0x0D, 0x05, 0x01, 0x08
	.byte 0x05, 0x08, 0x09, 0x08, 0x0D, 0x08, 0x01, 0x0B, 0x08, 0x11, 0x01, 0x02, 0x01, 0x02, 0x10, 0x23
	.byte 0x88, 0xF8, 0x28, 0x3C, 0x88, 0xF8, 0x40, 0x54, 0x88, 0xF8, 0x58, 0x6C, 0x88, 0xF8, 0x85, 0x9A
	.byte 0xC6, 0xF8, 0x6C, 0x81, 0x8F, 0xA0, 0x6C, 0x7E, 0xDF, 0xF0, 0xFF, 0x00, 0x00, 0x00, 0x08, 0x1C
	.byte 0x08, 0xF7, 0x20, 0x34, 0x08, 0xF7, 0x38, 0x4C, 0x08, 0xF7, 0x50, 0x64, 0x08, 0xF7, 0x68, 0x7C
	.byte 0x08, 0xF7, 0x85, 0x9A, 0xC3, 0xF8, 0x7C, 0x91, 0x4D, 0x60, 0x7C, 0x91, 0xAD, 0xBE, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x09, 0x04, 0x03, 0x01, 0x09, 0x05, 0x00, 0x02
	.byte 0x09, 0x06, 0x01, 0x03, 0x09, 0x07, 0x02, 0x00, 0x00, 0x08, 0x07, 0x05, 0x01, 0x09, 0x04, 0x06
	.byte 0x02, 0x09, 0x05, 0x07, 0x03, 0x09, 0x06, 0x04, 0x04, 0x09, 0x08, 0x08, 0x08, 0x02, 0x09, 0x09
	.byte 0x28, 0x3C, 0x88, 0x97, 0x28, 0x3C, 0xA8, 0xB7, 0x28, 0x3C, 0xC8, 0xD7, 0x28, 0x3C, 0xE8, 0xF7
	.byte 0x40, 0x54, 0x88, 0x97, 0x40, 0x54, 0xA8, 0xB7, 0x40, 0x54, 0xC8, 0xD7, 0x40, 0x54, 0xE8, 0xF7
	.byte 0x58, 0x6C, 0x88, 0x97, 0x85, 0x9A, 0xC5, 0xFA, 0xFF, 0x00, 0x00, 0x00, 0x0A, 0x04, 0x03, 0x01
	.byte 0x0A, 0x05, 0x00, 0x02, 0x0A, 0x06, 0x01, 0x03, 0x0A, 0x07, 0x02, 0x00, 0x00, 0x08, 0x07, 0x05
	.byte 0x01, 0x09, 0x04, 0x06, 0x02, 0x09, 0x05, 0x07, 0x03, 0x09, 0x06, 0x04, 0x04, 0x09, 0x08, 0x08
	.byte 0x08, 0x0A, 0x09, 0x09, 0x09, 0x00, 0x0A, 0x0A, 0x28, 0x3C, 0x88, 0x97, 0x28, 0x3C, 0xA8, 0xB7
	.byte 0x28, 0x3C, 0xC8, 0xD7, 0x28, 0x3C, 0xE8, 0xF7, 0x40, 0x54, 0x88, 0x97, 0x40, 0x54, 0xA8, 0xB7
	.byte 0x40, 0x54, 0xC8, 0xD7, 0x40, 0x54, 0xE8, 0xF7, 0x58, 0x6C, 0x88, 0x97, 0x85, 0x9A, 0xC5, 0xFA
	.byte 0x10, 0x23, 0x88, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xBC, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x00, 0x00, 0xBE, 0x00, 0x00, 0x00, 0xBF, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00, 0x00, 0xC2, 0x00, 0x00, 0x00, 0xC3, 0x00, 0x00, 0x00
	.byte 0xC4, 0x00, 0x00, 0x00, 0xC5, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00, 0xC7, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x00, 0x00, 0xC9, 0x00, 0x00, 0x00, 0xCA, 0x00, 0x00, 0x00, 0xCB, 0x00, 0x00, 0x00
	.byte 0xCC, 0x00, 0x00, 0x00, 0xCD, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x00, 0x00, 0xCF, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00, 0xD1, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD3, 0x00, 0x00, 0x00
	.byte 0xD4, 0x00, 0x00, 0x00, 0xD5, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x00, 0x00, 0xE9, 0x00, 0x00, 0x00
	.byte 0xEA, 0x00, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00, 0xEC, 0x00, 0x00, 0x00, 0xED, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_022460A0:
	.byte 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73
	.byte 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66
	.byte 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64
	.byte 0x73, 0x2F, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2F
	.byte 0x70, 0x6F, 0x73, 0x74, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70
	.byte 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73
	.byte 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65
	.byte 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F
	.byte 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2F, 0x70, 0x6F, 0x73, 0x74
	.byte 0x5F, 0x66, 0x69, 0x6E, 0x69, 0x73, 0x68, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x68, 0x74, 0x74, 0x70
	.byte 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73
	.byte 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65
	.byte 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F
	.byte 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2F, 0x67, 0x65, 0x74, 0x2E
	.byte 0x61, 0x73, 0x70, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73
	.byte 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64
	.byte 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F
	.byte 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61
	.byte 0x6E, 0x67, 0x65, 0x2F, 0x72, 0x65, 0x73, 0x75, 0x6C, 0x74, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00
	.byte 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73
	.byte 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66
	.byte 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64
	.byte 0x73, 0x2F, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2F
	.byte 0x64, 0x65, 0x6C, 0x65, 0x74, 0x65, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70
	.byte 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73
	.byte 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65
	.byte 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F
	.byte 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2F, 0x72, 0x65, 0x74, 0x75
	.byte 0x72, 0x6E, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67
	.byte 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E
	.byte 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F
	.byte 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x65
	.byte 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2F, 0x73, 0x65, 0x61, 0x72, 0x63, 0x68, 0x2E, 0x61
	.byte 0x73, 0x70, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73
	.byte 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64
	.byte 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F
	.byte 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61
	.byte 0x6E, 0x67, 0x65, 0x2F, 0x65, 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2E, 0x61, 0x73, 0x70
	.byte 0x00, 0x00, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73
	.byte 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64
	.byte 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F
	.byte 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x65, 0x78, 0x63, 0x68, 0x61
	.byte 0x6E, 0x67, 0x65, 0x2F, 0x65, 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x5F, 0x66, 0x69, 0x6E
	.byte 0x69, 0x73, 0x68, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67
	.byte 0x61, 0x6D, 0x65, 0x73, 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E
	.byte 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F
	.byte 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x65
	.byte 0x78, 0x63, 0x68, 0x61, 0x6E, 0x67, 0x65, 0x2F, 0x69, 0x6E, 0x66, 0x6F, 0x2E, 0x61, 0x73, 0x70
	.byte 0x00, 0x00, 0x00, 0x00, 0x68, 0x74, 0x74, 0x70, 0x3A, 0x2F, 0x2F, 0x67, 0x61, 0x6D, 0x65, 0x73
	.byte 0x74, 0x61, 0x74, 0x73, 0x32, 0x2E, 0x67, 0x73, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64
	.byte 0x6F, 0x77, 0x69, 0x66, 0x69, 0x2E, 0x6E, 0x65, 0x74, 0x2F, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F
	.byte 0x6E, 0x64, 0x70, 0x64, 0x73, 0x2F, 0x63, 0x6F, 0x6D, 0x6D, 0x6F, 0x6E, 0x2F, 0x73, 0x65, 0x74
	.byte 0x50, 0x72, 0x6F, 0x66, 0x69, 0x6C, 0x65, 0x2E, 0x61, 0x73, 0x70, 0x00, 0x39, 0x40, 0x24, 0x02
	.byte 0x25, 0x41, 0x24, 0x02, 0x55, 0x41, 0x24, 0x02, 0xF5, 0x8F, 0x23, 0x02, 0xDD, 0x90, 0x23, 0x02
	.byte 0xFD, 0x90, 0x23, 0x02, 0x8D, 0x9D, 0x23, 0x02, 0x69, 0x9E, 0x23, 0x02, 0x7D, 0x9E, 0x23, 0x02
	.byte 0xBD, 0xA8, 0x23, 0x02, 0x91, 0xAA, 0x23, 0x02, 0x01, 0xAB, 0x23, 0x02, 0x5D, 0xB5, 0x23, 0x02
	.byte 0xED, 0xB6, 0x23, 0x02, 0x89, 0xB7, 0x23, 0x02, 0x45, 0xCD, 0x23, 0x02, 0xD9, 0xCD, 0x23, 0x02
	.byte 0xF9, 0xCD, 0x23, 0x02, 0x8D, 0xE7, 0x23, 0x02, 0x85, 0xE8, 0x23, 0x02, 0xA5, 0xE8, 0x23, 0x02
	.byte 0x6D, 0xF9, 0x23, 0x02, 0xB5, 0xF9, 0x23, 0x02, 0xD5, 0xF9, 0x23, 0x02, 0xAD, 0x13, 0x24, 0x02
	.byte 0x69, 0x14, 0x24, 0x02, 0x95, 0x14, 0x24, 0x02, 0xA1, 0x14, 0x24, 0x02, 0x49, 0x16, 0x24, 0x02
	.byte 0x09, 0x18, 0x24, 0x02, 0x59, 0x96, 0x23, 0x02, 0x99, 0x96, 0x23, 0x02, 0xA9, 0x96, 0x23, 0x02
	.byte 0xCD, 0x96, 0x23, 0x02, 0xE1, 0x96, 0x23, 0x02, 0xF5, 0x96, 0x23, 0x02, 0x35, 0x98, 0x23, 0x02
	.byte 0x55, 0x99, 0x23, 0x02, 0x7D, 0x99, 0x23, 0x02, 0x91, 0x99, 0x23, 0x02, 0xAD, 0x9A, 0x23, 0x02
	.byte 0xCD, 0x9A, 0x23, 0x02, 0xD9, 0x99, 0x23, 0x02, 0x11, 0x9A, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x06, 0x05, 0x00, 0x00, 0x04, 0x03, 0x00, 0x59, 0xA2, 0x23, 0x02, 0x61, 0xA2, 0x23, 0x02
	.byte 0xD1, 0xA2, 0x23, 0x02, 0xA1, 0xA4, 0x23, 0x02, 0xC1, 0xA4, 0x23, 0x02, 0xF9, 0xA2, 0x23, 0x02
	.byte 0x25, 0xA3, 0x23, 0x02, 0x85, 0xA3, 0x23, 0x02, 0xDD, 0xA3, 0x23, 0x02, 0x5D, 0xAF, 0x23, 0x02
	.byte 0xFD, 0xAF, 0x23, 0x02, 0x2D, 0xB1, 0x23, 0x02, 0x45, 0xB3, 0x23, 0x02, 0x89, 0xB1, 0x23, 0x02
	.byte 0xB9, 0xB1, 0x23, 0x02, 0xC1, 0xB2, 0x23, 0x02, 0xD1, 0xB2, 0x23, 0x02, 0x01, 0xB3, 0x23, 0x02
	.byte 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x01, 0x00, 0x01, 0x01, 0x01, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x28, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x50, 0x00, 0x2D, 0x00
	.byte 0x00, 0x00, 0x78, 0x00, 0x2D, 0x00, 0xC0, 0x00, 0x20, 0x00, 0x2E, 0x00, 0xC0, 0x00, 0x48, 0x00
	.byte 0x2E, 0x00, 0xC0, 0x00, 0x70, 0x00, 0x2E, 0x00, 0x05, 0xBD, 0x23, 0x02, 0x85, 0xBE, 0x23, 0x02
	.byte 0xB1, 0xC4, 0x23, 0x02, 0xE5, 0xC4, 0x23, 0x02, 0x0D, 0xC5, 0x23, 0x02, 0x2D, 0xC5, 0x23, 0x02
	.byte 0x19, 0xC6, 0x23, 0x02, 0x41, 0xC6, 0x23, 0x02, 0x61, 0xC6, 0x23, 0x02, 0xF1, 0xC6, 0x23, 0x02
	.byte 0x19, 0xC7, 0x23, 0x02, 0x45, 0xC7, 0x23, 0x02, 0xC5, 0xC7, 0x23, 0x02, 0xED, 0xC7, 0x23, 0x02
	.byte 0x19, 0xC8, 0x23, 0x02, 0x01, 0xBF, 0x23, 0x02, 0x09, 0xC0, 0x23, 0x02, 0xC9, 0xC0, 0x23, 0x02
	.byte 0x9D, 0xC1, 0x23, 0x02, 0xF9, 0xC1, 0x23, 0x02, 0x3D, 0xC2, 0x23, 0x02, 0x59, 0xC9, 0x23, 0x02
	.byte 0x79, 0xC9, 0x23, 0x02, 0xB1, 0xC8, 0x23, 0x02, 0xDD, 0xC8, 0x23, 0x02, 0x29, 0xC9, 0x23, 0x02
	.byte 0x31, 0xC9, 0x23, 0x02, 0x75, 0xC2, 0x23, 0x02, 0xB1, 0xC2, 0x23, 0x02, 0xAD, 0xC9, 0x23, 0x02
	.byte 0x19, 0xCA, 0x23, 0x02, 0x41, 0xCA, 0x23, 0x02, 0x4D, 0xD4, 0x23, 0x02, 0xC9, 0xD6, 0x23, 0x02
	.byte 0x0D, 0xDD, 0x23, 0x02, 0xD1, 0xDF, 0x23, 0x02, 0xF1, 0xDF, 0x23, 0x02, 0x69, 0xDD, 0x23, 0x02
	.byte 0x95, 0xDD, 0x23, 0x02, 0x35, 0xD9, 0x23, 0x02, 0x99, 0xD9, 0x23, 0x02, 0x31, 0xDB, 0x23, 0x02
	.byte 0x95, 0xDB, 0x23, 0x02, 0xD1, 0xDD, 0x23, 0x02, 0xFD, 0xDD, 0x23, 0x02, 0x29, 0xDE, 0x23, 0x02
	.byte 0x15, 0xDF, 0x23, 0x02, 0x41, 0xDF, 0x23, 0x02, 0x6D, 0xDF, 0x23, 0x02, 0x00, 0x06, 0x05, 0x00
	.byte 0x00, 0x04, 0x03, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00
	.byte 0xFE, 0xFF, 0xFF, 0xFF, 0x59, 0xED, 0x23, 0x02, 0x8D, 0xED, 0x23, 0x02, 0x65, 0xF1, 0x23, 0x02
	.byte 0xB1, 0xED, 0x23, 0x02, 0xCD, 0xED, 0x23, 0x02, 0xD9, 0xED, 0x23, 0x02, 0x11, 0xEE, 0x23, 0x02
	.byte 0xE9, 0xEE, 0x23, 0x02, 0x11, 0xEF, 0x23, 0x02, 0x39, 0xEF, 0x23, 0x02, 0xB9, 0xEF, 0x23, 0x02
	.byte 0xE1, 0xEF, 0x23, 0x02, 0x09, 0xF0, 0x23, 0x02, 0xB5, 0xF0, 0x23, 0x02, 0xDD, 0xF0, 0x23, 0x02
	.byte 0x09, 0xF1, 0x23, 0x02, 0xB9, 0xF1, 0x23, 0x02, 0x69, 0xFC, 0x23, 0x02, 0x3D, 0x06, 0x24, 0x02
	.byte 0x65, 0xFD, 0x23, 0x02, 0x99, 0xFD, 0x23, 0x02, 0x41, 0xFE, 0x23, 0x02, 0x61, 0xFE, 0x23, 0x02
	.byte 0x41, 0x06, 0x24, 0x02, 0xE5, 0xFE, 0x23, 0x02, 0x11, 0xFF, 0x23, 0x02, 0xCD, 0xFF, 0x23, 0x02
	.byte 0xE9, 0xFF, 0x23, 0x02, 0x59, 0x06, 0x24, 0x02, 0x6D, 0x00, 0x24, 0x02, 0xBD, 0x00, 0x24, 0x02
	.byte 0x81, 0x01, 0x24, 0x02, 0x9D, 0x01, 0x24, 0x02, 0x71, 0x06, 0x24, 0x02, 0x49, 0x07, 0x24, 0x02
	.byte 0x41, 0x05, 0x24, 0x02, 0x99, 0x05, 0x24, 0x02, 0xB5, 0x05, 0x24, 0x02, 0x85, 0x06, 0x24, 0x02
	.byte 0x9D, 0x06, 0x24, 0x02, 0xB9, 0x06, 0x24, 0x02, 0x21, 0x02, 0x24, 0x02, 0x41, 0x02, 0x24, 0x02
	.byte 0x11, 0x04, 0x24, 0x02, 0x31, 0x04, 0x24, 0x02, 0xFD, 0x03, 0x24, 0x02, 0x39, 0x08, 0x24, 0x02
	.byte 0x55, 0x08, 0x24, 0x02, 0x85, 0x08, 0x24, 0x02, 0x9D, 0x08, 0x24, 0x02, 0xBD, 0x08, 0x24, 0x02
	.byte 0xE1, 0x08, 0x24, 0x02, 0xFD, 0x08, 0x24, 0x02, 0x49, 0x09, 0x24, 0x02, 0xA1, 0x09, 0x24, 0x02
	.byte 0xE5, 0x07, 0x24, 0x02, 0x0D, 0x08, 0x24, 0x02, 0xF5, 0x2F, 0x24, 0x02, 0xFD, 0x2F, 0x24, 0x02
	.byte 0x4D, 0x30, 0x24, 0x02, 0x69, 0x30, 0x24, 0x02, 0x8D, 0x30, 0x24, 0x02, 0xCD, 0x30, 0x24, 0x02
	.byte 0x21, 0x31, 0x24, 0x02, 0x6D, 0x31, 0x24, 0x02, 0x55, 0x32, 0x24, 0x02, 0xA9, 0x33, 0x24, 0x02
	.byte 0x01, 0x34, 0x24, 0x02, 0x21, 0x34, 0x24, 0x02, 0x99, 0x35, 0x24, 0x02, 0x89, 0x36, 0x24, 0x02
	.byte 0x01, 0x37, 0x24, 0x02, 0x51, 0x37, 0x24, 0x02, 0x69, 0x37, 0x24, 0x02, 0xC9, 0x37, 0x24, 0x02
	.byte 0x49, 0x38, 0x24, 0x02, 0xD5, 0x38, 0x24, 0x02, 0x29, 0x39, 0x24, 0x02, 0x6D, 0x3A, 0x24, 0x02
	.byte 0xC5, 0x3A, 0x24, 0x02, 0x1D, 0x3B, 0x24, 0x02, 0x2D, 0x3B, 0x24, 0x02, 0x09, 0x3C, 0x24, 0x02
	.byte 0x8D, 0x3C, 0x24, 0x02, 0xC9, 0x3C, 0x24, 0x02, 0xED, 0x3C, 0x24, 0x02, 0x29, 0x3D, 0x24, 0x02
	.byte 0x91, 0x3D, 0x24, 0x02, 0xA1, 0x3D, 0x24, 0x02, 0xDD, 0x3D, 0x24, 0x02, 0x75, 0x3E, 0x24, 0x02
	.byte 0xD1, 0x46, 0x24, 0x02, 0x09, 0x47, 0x24, 0x02, 0x89, 0x48, 0x24, 0x02, 0xC1, 0x48, 0x24, 0x02
	.byte 0x45, 0x49, 0x24, 0x02, 0x55, 0x49, 0x24, 0x02, 0x05, 0x4A, 0x24, 0x02, 0x4D, 0x4A, 0x24, 0x02
	.byte 0x69, 0x4A, 0x24, 0x02, 0x21, 0x4B, 0x24, 0x02, 0x55, 0x4B, 0x24, 0x02, 0x09, 0x4D, 0x24, 0x02
	.byte 0x15, 0x4F, 0x24, 0x02, 0x69, 0x4F, 0x24, 0x02, 0x45, 0x4D, 0x24, 0x02, 0x75, 0x47, 0x24, 0x02
	.byte 0xA1, 0x47, 0x24, 0x02, 0x05, 0x48, 0x24, 0x02, 0x35, 0x48, 0x24, 0x02, 0x55, 0x48, 0x24, 0x02
	.byte 0x35, 0x4F, 0x24, 0x02, 0x81, 0x4D, 0x24, 0x02, 0x45, 0x4E, 0x24, 0x02, 0xA9, 0x4C, 0x24, 0x02
	.byte 0xCD, 0x4C, 0x24, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_02246800:
	.space 0x160
