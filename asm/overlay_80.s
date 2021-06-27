
	thumb_func_start ov80_02229EE0
ov80_02229EE0: @ 0x02229EE0
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r0, r2, #0
	adds r1, r4, #0
	adds r2, r3, #0
	bl FUN_02007524
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_02229EE0

	thumb_func_start ov80_02229EF4
ov80_02229EF4: @ 0x02229EF4
	adds r3, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _02229F00 @ =FUN_02007508
	bx r3
	nop
_02229F00: .4byte FUN_02007508
	thumb_func_end ov80_02229EF4

	thumb_func_start ov80_02229F04
ov80_02229F04: @ 0x02229F04
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	movs r1, #0x1b
	str r3, [sp]
	movs r0, #1
	adds r2, r1, #0
	adds r3, r6, #0
	bl FUN_0200BAF8
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x30
	blx FUN_020D4994
	lsls r0, r4, #0x10
	ldr r2, [sp]
	lsrs r0, r0, #0x10
	adds r1, r6, #0
	bl ov80_02229EE0
	adds r6, r0, #0
	ldr r0, _02229F68 @ =0x0000FFFF
	str r4, [r5]
	strh r0, [r5, #0x18]
	lsls r0, r4, #1
	adds r0, r4, r0
	strh r0, [r5, #0x1a]
	ldrh r0, [r6]
	adds r1, r4, #0
	strh r0, [r5, #4]
	adds r0, r7, #0
	bl FUN_0200BBA0
	adds r5, #8
	adds r4, r0, #0
	adds r1, r5, #0
	movs r2, #8
	bl FUN_02026A68
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02229F68: .4byte 0x0000FFFF
	thumb_func_end ov80_02229F04

	thumb_func_start ov80_02229F6C
ov80_02229F6C: @ 0x02229F6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	adds r7, r2, #0
	movs r1, #0
	movs r2, #0x38
	adds r4, r0, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x34]
	blx FUN_020D4994
	ldr r1, [sp]
	ldr r2, [sp, #0x40]
	add r0, sp, #8
	bl ov80_02229EF4
	ldrh r1, [r4]
	add r3, sp, #8
	ldr r0, _0222A118 @ =0xFFFFF800
	adds r2, r1, #0
	ands r2, r0
	ldrh r1, [r3]
	lsrs r0, r0, #0x15
	ands r0, r1
	orrs r0, r2
	strh r0, [r4]
	ldrh r1, [r4]
	ldr r0, _0222A11C @ =0xFFFF07FF
	ands r0, r1
	ldrh r1, [r3, #0xe]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x10
	orrs r0, r1
	strh r0, [r4]
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _02229FCC
	cmp r5, #4
	blo _02229FC2
	movs r0, #3
	ands r0, r5
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02229FC2:
	ldr r0, _0222A120 @ =_0223B620
	lsls r1, r5, #1
	ldrh r0, [r0, r1]
	strh r0, [r4, #2]
	b _02229FD0
_02229FCC:
	ldrh r0, [r3, #0xc]
	strh r0, [r4, #2]
_02229FD0:
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	add r1, sp, #8
	adds r2, r4, #0
	adds r5, r0, #0
_02229FDC:
	ldrh r3, [r1, #2]
	strh r3, [r2, #4]
	ldrh r3, [r1, #2]
	cmp r3, #0xda
	bne _02229FE8
	str r5, [sp, #4]
_02229FE8:
	adds r0, r0, #1
	adds r1, r1, #2
	adds r2, r2, #2
	cmp r0, #4
	blt _02229FDC
	str r7, [r4, #0xc]
	cmp r6, #0
	bne _0222A026
_02229FF8:
	bl FUN_0201FD44
	adds r5, r0, #0
	bl FUN_0201FD44
	lsls r0, r0, #0x10
	adds r6, r5, #0
	orrs r6, r0
	adds r0, r6, #0
	bl FUN_0206FE2C
	add r1, sp, #8
	ldrb r1, [r1, #0xb]
	cmp r1, r0
	bne _02229FF8
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_02070068
	cmp r0, #1
	beq _02229FF8
	str r6, [r4, #0x10]
	b _0222A028
_0222A026:
	str r6, [r4, #0x10]
_0222A028:
	add r0, sp, #0x20
	ldrb r1, [r0, #0x10]
	ldr r2, [r4, #0x14]
	movs r0, #0x1f
	bics r2, r0
	movs r0, #0x1f
	ands r0, r1
	orrs r2, r0
	ldr r0, _0222A124 @ =0xFFFFFC1F
	movs r7, #0
	ands r2, r0
	lsls r0, r1, #0x1b
	lsrs r1, r0, #0x16
	orrs r2, r1
	ldr r1, _0222A128 @ =0xFFFF83FF
	adds r5, r7, #0
	ands r2, r1
	lsrs r1, r0, #0x11
	orrs r2, r1
	ldr r1, _0222A12C @ =0xFFF07FFF
	ands r2, r1
	lsrs r1, r0, #0xc
	orrs r2, r1
	ldr r1, _0222A130 @ =0xFE0FFFFF
	ands r2, r1
	lsrs r1, r0, #7
	orrs r2, r1
	ldr r1, _0222A134 @ =0xC1FFFFFF
	lsrs r0, r0, #2
	ands r1, r2
	orrs r0, r1
	str r0, [r4, #0x14]
_0222A068:
	adds r0, r5, #0
	bl FUN_020726C0
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0222A078
	adds r7, r7, #1
_0222A078:
	adds r5, r5, #1
	cmp r5, #6
	blt _0222A068
	ldr r0, _0222A138 @ =0x000001FE
	adds r1, r7, #0
	blx FUN_020F2998
	cmp r0, #0xff
	ble _0222A08C
	movs r0, #0xff
_0222A08C:
	lsls r0, r0, #0x18
	movs r5, #0
	lsrs r7, r0, #0x18
_0222A092:
	adds r0, r5, #0
	bl FUN_020726C0
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0222A0A4
	adds r0, r4, r5
	strb r7, [r0, #0x18]
_0222A0A4:
	adds r5, r5, #1
	cmp r5, #6
	blt _0222A092
	movs r0, #0
	strb r0, [r4, #0x1e]
	ldr r0, _0222A13C @ =0x020F5670
	movs r1, #0x19
	ldrb r0, [r0]
	strb r0, [r4, #0x1f]
	ldrh r0, [r4]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	bl FUN_0206FBE8
	cmp r0, #0
	beq _0222A0E8
	ldr r2, [r4, #0x10]
	movs r1, #1
	tst r1, r2
	beq _0222A0D4
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
	b _0222A0FA
_0222A0D4:
	ldrh r0, [r4]
	movs r1, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	bl FUN_0206FBE8
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
	b _0222A0FA
_0222A0E8:
	ldrh r0, [r4]
	movs r1, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	bl FUN_0206FBE8
	adds r1, r4, #0
	adds r1, #0x20
	strb r0, [r1]
_0222A0FA:
	adds r1, r4, #0
	ldr r0, [sp, #4]
	adds r1, #0x21
	strb r0, [r1]
	ldrh r0, [r4]
	adds r4, #0x22
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	adds r2, r4, #0
	bl FUN_0200BC28
	adds r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A118: .4byte 0xFFFFF800
_0222A11C: .4byte 0xFFFF07FF
_0222A120: .4byte _0223B620
_0222A124: .4byte 0xFFFFFC1F
_0222A128: .4byte 0xFFFF83FF
_0222A12C: .4byte 0xFFF07FFF
_0222A130: .4byte 0xFE0FFFFF
_0222A134: .4byte 0xC1FFFFFF
_0222A138: .4byte 0x000001FE
_0222A13C: .4byte 0x020F5670
	thumb_func_end ov80_02229F6C

	thumb_func_start ov80_0222A140
ov80_0222A140: @ 0x0222A140
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r4, r2, #0
	bl FUN_0206DCE4
	cmp r4, #0x78
	bne _0222A158
	movs r4, #0x32
	b _0222A15E
_0222A158:
	cmp r4, #0x79
	bne _0222A15E
	movs r4, #0x64
_0222A15E:
	ldr r1, [r6, #0x14]
	ldr r0, _0222A308 @ =0x3FFFFFFF
	adds r2, r4, #0
	ands r0, r1
	str r0, [sp, #0x1c]
	movs r0, #1
	str r0, [sp]
	ldr r0, [r6, #0x10]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r1, [r6]
	ldr r3, [sp, #0x1c]
	adds r0, r5, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x15
	bl FUN_0206DE38
	adds r0, r5, #0
	movs r1, #0xaf
	add r2, sp, #0x1c
	bl FUN_0206EC40
	adds r0, r5, #0
	bl FUN_0206E250
	ldrh r0, [r6]
	add r2, sp, #0x14
	adds r2, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x1b
	add r0, sp, #0x14
	strb r1, [r0, #1]
	adds r0, r5, #0
	movs r1, #0x70
	bl FUN_0206EC40
	adds r0, r5, #0
	movs r1, #6
	adds r2, r6, #2
	bl FUN_0206EC40
	movs r4, #0
	str r6, [sp, #0x10]
	adds r7, r4, #0
_0222A1BC:
	ldr r0, [sp, #0x10]
	add r2, sp, #0x14
	ldrh r1, [r0, #4]
	add r0, sp, #0x14
	adds r2, #2
	strh r1, [r0, #2]
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x36
	bl FUN_0206EC40
	ldrb r0, [r6, #0x1e]
	add r2, sp, #0x14
	adds r2, #1
	adds r1, r0, #0
	asrs r1, r7
	movs r0, #3
	ands r1, r0
	add r0, sp, #0x14
	strb r1, [r0, #1]
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x3e
	bl FUN_0206EC40
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x42
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #0x14
	strb r0, [r1]
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x3a
	add r2, sp, #0x14
	bl FUN_0206EC40
	ldr r0, [sp, #0x10]
	adds r4, r4, #1
	adds r0, r0, #2
	adds r7, r7, #2
	str r0, [sp, #0x10]
	cmp r4, #4
	blt _0222A1BC
	ldr r0, [r6, #0xc]
	movs r1, #7
	str r0, [sp, #0x18]
	adds r0, r5, #0
	add r2, sp, #0x18
	bl FUN_0206EC40
	add r2, sp, #0x14
	ldrb r1, [r6, #0x18]
	add r0, sp, #0x14
	adds r2, #1
	strb r1, [r0, #1]
	adds r0, r5, #0
	movs r1, #0xd
	bl FUN_0206EC40
	add r2, sp, #0x14
	ldrb r1, [r6, #0x19]
	add r0, sp, #0x14
	adds r2, #1
	strb r1, [r0, #1]
	adds r0, r5, #0
	movs r1, #0xe
	bl FUN_0206EC40
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1a]
	add r0, sp, #0x14
	adds r2, #1
	strb r1, [r0, #1]
	adds r0, r5, #0
	movs r1, #0xf
	bl FUN_0206EC40
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1b]
	add r0, sp, #0x14
	adds r2, #1
	strb r1, [r0, #1]
	adds r0, r5, #0
	movs r1, #0x10
	bl FUN_0206EC40
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1c]
	add r0, sp, #0x14
	adds r2, #1
	strb r1, [r0, #1]
	adds r0, r5, #0
	movs r1, #0x11
	bl FUN_0206EC40
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1d]
	add r0, sp, #0x14
	adds r2, #1
	strb r1, [r0, #1]
	adds r0, r5, #0
	movs r1, #0x12
	bl FUN_0206EC40
	adds r2, r6, #0
	adds r0, r5, #0
	movs r1, #0xa
	adds r2, #0x20
	bl FUN_0206EC40
	adds r2, r6, #0
	adds r0, r5, #0
	movs r1, #9
	adds r2, #0x21
	bl FUN_0206EC40
	ldr r0, [r6, #0x14]
	lsls r0, r0, #1
	lsrs r0, r0, #0x1f
	beq _0222A2E4
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xed
	movs r3, #4
	bl FUN_0200BAF8
	ldrh r1, [r6]
	adds r4, r0, #0
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x15
	bl FUN_0200BBA0
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0x77
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0200BB44
	b _0222A2F0
_0222A2E4:
	adds r2, r6, #0
	adds r0, r5, #0
	movs r1, #0x75
	adds r2, #0x22
	bl FUN_0206EC40
_0222A2F0:
	adds r6, #0x1f
	adds r0, r5, #0
	movs r1, #0xc
	adds r2, r6, #0
	bl FUN_0206EC40
	adds r0, r5, #0
	bl FUN_0206E250
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A308: .4byte 0x3FFFFFFF
	thumb_func_end ov80_0222A140

	thumb_func_start ov80_0222A30C
ov80_0222A30C: @ 0x0222A30C
	ldr r3, _0222A32C @ =0x0223B628
	movs r2, #0
_0222A310:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0222A31E
	ldr r0, _0222A330 @ =0x0223B62A
	lsls r1, r2, #2
	ldrh r0, [r0, r1]
	bx lr
_0222A31E:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #0x3f
	blo _0222A310
	movs r0, #3
	bx lr
	nop
_0222A32C: .4byte 0x0223B628
_0222A330: .4byte 0x0223B62A
	thumb_func_end ov80_0222A30C

	thumb_func_start ov80_0222A334
ov80_0222A334: @ 0x0222A334
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r0, #0
	bl FUN_02028E9C
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #8]
	adds r0, r5, #0
	bl FUN_02028E9C
	movs r3, #0
	adds r1, r0, #0
	str r3, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #4
	bl FUN_0207217C
	ldr r0, _0222A3B8 @ =0x00000113
	bl FUN_0203B36C
	adds r3, r0, #0
	movs r0, #0xb
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl FUN_0208F260
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xc1
	movs r3, #0xb
	bl FUN_0200BAF8
	movs r1, #0
	adds r5, r0, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0x91
	adds r2, r6, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #7
	add r2, sp, #8
	bl FUN_0206EC40
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0200BB44
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0222A3B8: .4byte 0x00000113
	thumb_func_end ov80_0222A334

	thumb_func_start ov80_0222A3BC
ov80_0222A3BC: @ 0x0222A3BC
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r1, r4, #0
	bl ov80_0222A334
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02074524
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222A3BC

	thumb_func_start ov80_0222A3D4
ov80_0222A3D4: @ 0x0222A3D4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_020249A8
	cmp r4, r0
	beq _0222A3FC
	adds r0, r5, #0
	movs r1, #0
	bl FUN_020249D4
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_020248F0
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl FUN_020249B0
_0222A3FC:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222A3D4

	thumb_func_start ov80_0222A400
ov80_0222A400: @ 0x0222A400
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r1, r1, #0xc
	adds r4, r2, #0
	str r1, [sp]
	lsls r1, r4, #0xc
	str r1, [sp, #4]
	movs r1, #0
	adds r5, r0, #0
	str r1, [sp, #8]
	cmp r3, #1
	bne _0222A42E
	bl FUN_020249F8
	cmp r0, #0
	bne _0222A428
	subs r0, r4, #3
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	b _0222A42E
_0222A428:
	adds r0, r4, #1
	lsls r0, r0, #0xc
	str r0, [sp, #4]
_0222A42E:
	adds r0, r5, #0
	add r1, sp, #0
	bl FUN_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222A400

	thumb_func_start ov80_0222A43C
ov80_0222A43C: @ 0x0222A43C
	push {r3, lr}
	movs r2, #0x30
	bl FUN_020880B0
	cmp r0, #4
	bhi _0222A46E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A454: @ jump table
	.2byte _0222A46E - _0222A454 - 2 @ case 0
	.2byte _0222A46A - _0222A454 - 2 @ case 1
	.2byte _0222A466 - _0222A454 - 2 @ case 2
	.2byte _0222A462 - _0222A454 - 2 @ case 3
	.2byte _0222A45E - _0222A454 - 2 @ case 4
_0222A45E:
	movs r0, #1
	pop {r3, pc}
_0222A462:
	movs r0, #2
	pop {r3, pc}
_0222A466:
	movs r0, #3
	pop {r3, pc}
_0222A46A:
	movs r0, #4
	pop {r3, pc}
_0222A46E:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222A43C

	thumb_func_start ov80_0222A474
ov80_0222A474: @ 0x0222A474
	push {r3, lr}
	bl ov80_02229F04
	bl FUN_0201AB0C
	pop {r3, pc}
	thumb_func_end ov80_0222A474

	thumb_func_start ov80_0222A480
ov80_0222A480: @ 0x0222A480
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r3, #2
	ldr r1, [r4]
	adds r0, r5, r0
	str r1, [r0, #0x18]
	movs r0, #0x34
	adds r6, r3, #0
	muls r6, r0, r6
	adds r0, r5, r6
	ldrh r1, [r4, #4]
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x3c
	adds r1, r4, #0
	adds r0, r0, r6
	adds r1, #8
	bl StringCopy
	adds r0, r5, r6
	ldrh r1, [r4, #0x20]
	adds r0, #0x4c
	strh r1, [r0]
	adds r0, r5, r6
	ldrh r1, [r4, #0x22]
	adds r0, #0x4e
	strh r1, [r0]
	adds r0, r5, r6
	ldrh r1, [r4, #0x24]
	adds r0, #0x50
	strh r1, [r0]
	adds r0, r5, r6
	ldrh r1, [r4, #0x26]
	adds r0, #0x52
	strh r1, [r0]
	adds r0, r5, r6
	ldrh r1, [r4, #0x28]
	adds r0, #0x54
	strh r1, [r0]
	adds r0, r5, r6
	ldrh r1, [r4, #0x2a]
	adds r0, #0x56
	strh r1, [r0]
	adds r0, r5, r6
	ldrh r1, [r4, #0x2c]
	adds r0, #0x58
	strh r1, [r0]
	adds r0, r5, r6
	ldrh r1, [r4, #0x2e]
	adds r0, #0x5a
	strh r1, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222A480

	thumb_func_start ov80_0222A4EC
ov80_0222A4EC: @ 0x0222A4EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	str r1, [sp, #0x14]
	adds r5, r2, #0
	adds r4, r3, #0
	bl FUN_0201FD44
	adds r6, r0, #0
	bl FUN_0201FD44
	lsls r0, r0, #0x10
	adds r2, r6, #0
	orrs r2, r0
	lsls r0, r5, #0x18
	str r4, [sp]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	adds r0, r7, #0
	bl ov80_02229F6C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222A4EC

	thumb_func_start ov80_0222A52C
ov80_0222A52C: @ 0x0222A52C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	adds r7, r1, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	str r2, [sp, #0x10]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r3, [sp, #0x14]
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	movs r4, #0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _0222A5A0
	ldr r5, [sp, #0x30]
	adds r6, r3, #0
_0222A554:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0222A55E
	movs r0, #0
	b _0222A560
_0222A55E:
	ldrb r0, [r0, r4]
_0222A560:
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222A56E
	movs r0, #0
	b _0222A570
_0222A56E:
	ldr r0, [r6]
_0222A570:
	str r0, [sp]
	ldr r0, [sp, #0x38]
	adds r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #8]
	ldrh r1, [r7]
	ldr r0, [sp, #0xc]
	bl ov80_0222A4EC
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _0222A58C
	str r0, [r5]
_0222A58C:
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	adds r0, #0x38
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	adds r6, r6, #4
	adds r7, r7, #2
	adds r5, r5, #4
	cmp r4, r0
	blt _0222A554
_0222A5A0:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222A52C

	thumb_func_start ov80_0222A5A4
ov80_0222A5A4: @ 0x0222A5A4
	cmp r0, #0x64
	bhs _0222A5AC
	movs r0, #3
	bx lr
_0222A5AC:
	cmp r0, #0x78
	bhs _0222A5B4
	movs r0, #6
	bx lr
_0222A5B4:
	cmp r0, #0x8c
	bhs _0222A5BC
	movs r0, #9
	bx lr
_0222A5BC:
	cmp r0, #0xa0
	bhs _0222A5C4
	movs r0, #0xc
	bx lr
_0222A5C4:
	cmp r0, #0xb4
	bhs _0222A5CC
	movs r0, #0xf
	bx lr
_0222A5CC:
	cmp r0, #0xc8
	bhs _0222A5D4
	movs r0, #0x12
	bx lr
_0222A5D4:
	cmp r0, #0xdc
	bhs _0222A5DC
	movs r0, #0x15
	bx lr
_0222A5DC:
	movs r0, #0x1f
	bx lr
	thumb_func_end ov80_0222A5A4

	thumb_func_start ov80_0222A5E0
ov80_0222A5E0: @ 0x0222A5E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	str r0, [sp]
	ldr r0, [sp, #0x90]
	adds r7, r3, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0x90]
	cmp r0, #6
	ble _0222A5F8
	bl GF_AssertFail
_0222A5F8:
	ldr r0, [sp, #0x90]
	movs r4, #0
	str r4, [sp, #0x14]
	cmp r0, #0
	beq _0222A6A6
	add r0, sp, #0x1c
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x94]
	str r0, [sp, #0xc]
_0222A60A:
	bl FUN_0201FD44
	ldr r1, [sp]
	ldrh r1, [r1, #2]
	blx FUN_020F2998
	ldr r0, [sp]
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	movs r2, #0xcd
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x18]
	bl ov80_02229EF4
	movs r0, #0
	cmp r4, #0
	ble _0222A64E
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x10]
	ldrh r2, [r2]
	ldrh r3, [r3, #0xc]
	add r1, sp, #0x1c
_0222A63A:
	ldrh r5, [r1]
	cmp r5, r2
	beq _0222A64E
	ldrh r5, [r1, #0xc]
	cmp r5, r3
	beq _0222A64E
	adds r0, r0, #1
	adds r1, #0x10
	cmp r0, r4
	blt _0222A63A
_0222A64E:
	cmp r0, r4
	bne _0222A6A0
	ldr r0, [sp, #0x14]
	cmp r0, #0x32
	bge _0222A68C
	movs r3, #0
	cmp r7, #0
	ble _0222A680
	ldr r2, [sp, #0x10]
	ldr r5, [sp, #0x10]
	ldrh r2, [r2]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
_0222A66A:
	ldrh r5, [r0]
	cmp r2, r5
	beq _0222A680
	ldrh r5, [r1]
	cmp r6, r5
	beq _0222A680
	adds r3, r3, #1
	adds r0, r0, #2
	adds r1, r1, #2
	cmp r3, r7
	blt _0222A66A
_0222A680:
	cmp r3, r7
	beq _0222A68C
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	b _0222A6A0
_0222A68C:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0xc]
	adds r4, r4, #1
	strh r1, [r0]
	ldr r0, [sp, #0x10]
	adds r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r0, r0, #2
	str r0, [sp, #0xc]
_0222A6A0:
	ldr r0, [sp, #0x90]
	cmp r4, r0
	bne _0222A60A
_0222A6A6:
	ldr r0, [sp, #0x14]
	cmp r0, #0x32
	blt _0222A6B2
	add sp, #0x7c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0222A6B2:
	movs r0, #0
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222A5E0

	thumb_func_start ov80_0222A6B8
ov80_0222A6B8: @ 0x0222A6B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x8c]
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	str r0, [sp, #0x8c]
	add r0, sp, #0x44
	movs r2, #0xb
	movs r3, #0xcc
	adds r5, r1, #0
	bl ov80_02229F04
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	movs r4, #0
	cmp r0, #0
	ble _0222A6EE
_0222A6DC:
	adds r0, r5, #0
	bl ov80_0222A5A4
	ldr r1, [sp, #0x8c]
	strb r0, [r1, r4]
	ldr r0, [sp, #0x10]
	adds r4, r4, #1
	cmp r4, r0
	blt _0222A6DC
_0222A6EE:
	add r0, sp, #0x78
	ldrb r0, [r0, #0x1c]
	add r1, sp, #0x2c
	cmp r0, #0
	bne _0222A710
	ldr r0, [sp, #0x10]
	add r2, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0x18]
	movs r3, #0
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	bl ov80_0222A5E0
	b _0222A7A6
_0222A710:
	ldr r0, [sp, #0x10]
	add r2, sp, #0x24
	lsrs r0, r0, #1
	str r0, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x18]
	movs r3, #0
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	bl ov80_0222A5E0
	ldr r0, [sp, #0x1c]
	movs r7, #0
	cmp r0, #0
	ble _0222A75C
	ldr r6, [sp, #0x18]
	add r4, sp, #0x2c
	add r5, sp, #0x24
_0222A738:
	ldrh r1, [r6]
	add r0, sp, #0x34
	movs r2, #0xcd
	bl ov80_02229EF4
	add r0, sp, #0x24
	ldrh r0, [r0, #0x10]
	adds r7, r7, #1
	adds r6, r6, #2
	strh r0, [r4]
	add r0, sp, #0x24
	ldrh r0, [r0, #0x1c]
	adds r4, r4, #2
	strh r0, [r5]
	ldr r0, [sp, #0x1c]
	adds r5, r5, #2
	cmp r7, r0
	blt _0222A738
_0222A75C:
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	ldr r1, [sp, #0x14]
	add r0, sp, #0x44
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_02229F04
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x20]
	lsrs r6, r1, #1
	ldr r1, [sp, #0x18]
	lsls r2, r6, #1
	adds r1, r1, r2
	str r6, [sp]
	str r1, [sp, #4]
	movs r1, #0xb
	str r1, [sp, #8]
	add r1, sp, #0x2c
	add r2, sp, #0x24
	adds r3, r6, #0
	bl ov80_0222A5E0
	movs r5, #0
	cmp r6, #0
	ble _0222A7A6
	ldr r0, [sp, #0x8c]
	adds r4, r0, r6
_0222A796:
	ldr r0, [sp, #0x14]
	bl ov80_0222A5A4
	strb r0, [r4]
	adds r5, r5, #1
	adds r4, r4, #1
	cmp r5, r6
	blt _0222A796
_0222A7A6:
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x8c]
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x88]
	movs r3, #0
	bl ov80_0222A52C
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222A6B8

	thumb_func_start ov80_0222A7CC
ov80_0222A7CC: @ 0x0222A7CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0200BE48
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222A7CC

	thumb_func_start ov80_0222A7EC
ov80_0222A7EC: @ 0x0222A7EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02028F94
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0202907C
	cmp r0, #0
	bgt _0222A804
	beq _0222A822
	b _0222A816
_0222A804:
	cmp r0, #0xc
	bgt _0222A816
	cmp r0, #7
	blt _0222A816
	beq _0222A816
	cmp r0, #8
	beq _0222A816
	cmp r0, #0xc
	beq _0222A82E
_0222A816:
	cmp r4, #0
	bne _0222A81E
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222A81E:
	movs r0, #0x61
	pop {r3, r4, r5, pc}
_0222A822:
	cmp r4, #0
	bne _0222A82A
	movs r0, #0xee
	pop {r3, r4, r5, pc}
_0222A82A:
	movs r0, #0xef
	pop {r3, r4, r5, pc}
_0222A82E:
	cmp r4, #0
	bne _0222A836
	ldr r0, _0222A83C @ =0x00000127
	pop {r3, r4, r5, pc}
_0222A836:
	movs r0, #0x4a
	lsls r0, r0, #2
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A83C: .4byte 0x00000127
	thumb_func_end ov80_0222A7EC

	thumb_func_start ov80_0222A840
ov80_0222A840: @ 0x0222A840
	push {r3, lr}
	bl FUN_0202CA44
	bl FUN_02039F68
	pop {r3, pc}
	thumb_func_end ov80_0222A840

	thumb_func_start ov80_0222A84C
ov80_0222A84C: @ 0x0222A84C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0xbc
	adds r6, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0xbc
	blx FUN_020D4994
	str r7, [r4]
	adds r0, r4, #0
	adds r1, r4, #0
	str r5, [r4, #0x34]
	adds r0, #0x52
	strh r6, [r0]
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, #0x3c
	adds r2, r6, #0
	adds r3, r5, #0
	bl ov80_0222AA40
	movs r0, #8
	movs r1, #0x40
	adds r2, r5, #0
	bl FUN_0200BD18
	str r0, [r4, #0x44]
	movs r0, #1
	lsls r0, r0, #0xa
	adds r1, r5, #0
	bl FUN_02026354
	str r0, [r4, #0x48]
	movs r0, #1
	lsls r0, r0, #0xa
	adds r1, r5, #0
	bl FUN_02026354
	lsls r1, r6, #0x10
	movs r2, #0
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	lsrs r1, r1, #0x10
	adds r3, r2, #0
	bl ov80_0222AA3C
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222A84C

	thumb_func_start ov80_0222A8B8
ov80_0222A8B8: @ 0x0222A8B8
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x51
	str r0, [sp]
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0222A8C8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A8C8:
	ldr r0, [sp]
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222A90C
	ldr r5, [sp]
	movs r7, #0
	adds r6, r5, #0
	adds r6, #0x51
_0222A8DA:
	ldr r4, [r5, #4]
	cmp r4, #0
	beq _0222A8FC
	adds r0, r4, #0
	bl ov80_0222AB98
	cmp r0, #0
	bne _0222A8FC
	ldr r0, [sp]
	adds r1, r4, #0
	bl ov80_0222AA0C
	movs r0, #0
	str r0, [r5, #4]
	ldrsb r0, [r6, r0]
	subs r0, r0, #1
	strb r0, [r6]
_0222A8FC:
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #8
	blt _0222A8DA
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov80_02239C54
_0222A90C:
	ldr r0, [sp]
	movs r1, #0x51
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0222A91A
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A91A:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222A8B8

	thumb_func_start ov80_0222A920
ov80_0222A920: @ 0x0222A920
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x51
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0222A930
	bl GF_AssertFail
_0222A930:
	ldr r0, [r4, #0x44]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x48]
	bl FUN_02026380
	ldr r0, [r4, #0x4c]
	bl FUN_02026380
	ldr r0, [r4, #0x40]
	bl FUN_0201AB0C
	ldr r0, [r4, #0x3c]
	bl FUN_0200BB44
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222A920

	thumb_func_start ov80_0222A958
ov80_0222A958: @ 0x0222A958
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r6, r1, #0
	movs r1, #0x90
	adds r7, r2, #0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x90
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r2, _0222A9D0 @ =0x0223B9CC
	ldr r1, _0222A9D4 @ =0x0223BA04
	ldr r2, [r2]
	adds r0, r4, #0
	bl ov80_0222AB40
	ldr r0, _0222A9D8 @ =0x0000FFFF
	str r5, [r4]
	cmp r6, r0
	beq _0222A990
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, r6
	bne _0222A9A2
_0222A990:
	adds r0, r4, #0
	ldr r1, [r5, #0x40]
	adds r0, #0x84
	str r1, [r0]
	adds r0, r4, #0
	ldr r1, [r5, #0x3c]
	adds r0, #0x80
	str r1, [r0]
	b _0222A9B2
_0222A9A2:
	adds r0, r4, #0
	adds r1, r4, #0
	ldr r3, [r5, #0x34]
	adds r0, #0x84
	adds r1, #0x80
	adds r2, r6, #0
	bl ov80_0222AA40
_0222A9B2:
	adds r1, r4, #0
	adds r1, #0x84
	ldr r1, [r1]
	adds r0, r4, #0
	bl ov80_0222AB78
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov80_0222AB14
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov80_0222A9DC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222A9D0: .4byte 0x0223B9CC
_0222A9D4: .4byte 0x0223BA04
_0222A9D8: .4byte 0x0000FFFF
	thumb_func_end ov80_0222A958

	thumb_func_start ov80_0222A9DC
ov80_0222A9DC: @ 0x0222A9DC
	push {r4, lr}
	movs r3, #0
	adds r4, r0, #0
_0222A9E2:
	ldr r2, [r4, #4]
	cmp r2, #0
	bne _0222A9FC
	lsls r2, r3, #2
	adds r2, r0, r2
	str r1, [r2, #4]
	movs r1, #0x51
	ldrsb r1, [r0, r1]
	adds r0, #0x51
	adds r1, r1, #1
	strb r1, [r0]
	movs r0, #1
	pop {r4, pc}
_0222A9FC:
	adds r3, r3, #1
	adds r4, r4, #4
	cmp r3, #8
	blt _0222A9E2
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222A9DC

	thumb_func_start ov80_0222AA0C
ov80_0222AA0C: @ 0x0222AA0C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	ldr r1, [r5, #0x3c]
	cmp r0, r1
	beq _0222AA22
	bl FUN_0200BB44
_0222AA22:
	adds r0, r4, #0
	adds r0, #0x84
	ldr r0, [r0]
	ldr r1, [r5, #0x40]
	cmp r0, r1
	beq _0222AA32
	bl FUN_0201AB0C
_0222AA32:
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222AA0C

	thumb_func_start ov80_0222AA3C
ov80_0222AA3C: @ 0x0222AA3C
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AA3C

	thumb_func_start ov80_0222AA40
ov80_0222AA40: @ 0x0222AA40
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r6, #0
	movs r1, #1
	adds r7, r3, #0
	bl ov80_0222ACA0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #2
	bl ov80_0222ACA0
	adds r6, r0, #0
	ldr r1, [sp]
	movs r0, #0xb6
	adds r2, r7, #0
	bl FUN_02007524
	str r0, [r5]
	movs r0, #1
	movs r1, #0x1b
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0200BAF8
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222AA40

	thumb_func_start ov80_0222AA7C
ov80_0222AA7C: @ 0x0222AA7C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r6, r1, #0
	movs r1, #2
	adds r7, r2, #0
	bl ov80_0222ACA0
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl ov80_0222ACA0
	adds r2, r0, #0
	cmp r4, r2
	beq _0222AAD4
	movs r0, #1
	movs r1, #0x1b
	adds r3, r7, #0
	bl FUN_0200BAF8
	adds r4, r0, #0
	movs r1, #0
	adds r2, r5, #0
_0222AAAE:
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0222AAC4
	adds r3, r0, #0
	adds r3, #0x80
	ldr r6, [r3]
	ldr r3, [r5, #0x3c]
	cmp r6, r3
	bne _0222AAC4
	adds r0, #0x80
	str r4, [r0]
_0222AAC4:
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #8
	blt _0222AAAE
	ldr r0, [r5, #0x3c]
	bl FUN_0200BB44
	str r4, [r5, #0x3c]
_0222AAD4:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222AA7C

	thumb_func_start ov80_0222AAD8
ov80_0222AAD8: @ 0x0222AAD8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #0x10
	bl FUN_0201AA8C
	adds r4, #0x24
	adds r3, r0, #0
	movs r2, #8
_0222AAEA:
	ldrh r1, [r4]
	adds r4, r4, #2
	strh r1, [r3]
	adds r3, r3, #2
	subs r2, r2, #1
	bne _0222AAEA
	pop {r4, pc}
	thumb_func_end ov80_0222AAD8

	thumb_func_start ov80_0222AAF8
ov80_0222AAF8: @ 0x0222AAF8
	push {r4, lr}
	adds r4, r1, #0
	adds r0, #0x24
	movs r3, #8
_0222AB00:
	ldrh r2, [r4]
	adds r4, r4, #2
	strh r2, [r0]
	adds r0, r0, #2
	subs r3, r3, #1
	bne _0222AB00
	adds r0, r1, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov80_0222AAF8

	thumb_func_start ov80_0222AB14
ov80_0222AB14: @ 0x0222AB14
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x1c]
	lsls r1, r1, #2
	adds r1, r2, r1
	str r1, [r4, #0x1c]
	bl ov80_0222AC70
	ldr r1, [r4, #0x1c]
	adds r0, r1, r0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov80_0222AB14

	thumb_func_start ov80_0222AB2C
ov80_0222AB2C: @ 0x0222AB2C
	adds r0, #0x24
	lsls r1, r1, #1
	adds r0, r0, r1
	bx lr
	thumb_func_end ov80_0222AB2C

	thumb_func_start ov80_0222AB34
ov80_0222AB34: @ 0x0222AB34
	ldr r3, _0222AB3C @ =FUN_0209680C
	ldr r0, [r0]
	bx r3
	nop
_0222AB3C: .4byte FUN_0209680C
	thumb_func_end ov80_0222AB34

	thumb_func_start ov80_0222AB40
ov80_0222AB40: @ 0x0222AB40
	push {r3, r4}
	movs r4, #0
	strb r4, [r0, #0x19]
	str r4, [r0, #0x1c]
	adds r3, r0, #0
	strb r4, [r0, #0x18]
	adds r3, #0x88
	str r4, [r3]
	str r1, [r0, #0x70]
	str r2, [r0, #0x74]
	adds r2, r0, #0
	adds r3, r4, #0
_0222AB58:
	adds r1, r2, #0
	adds r1, #0x78
	adds r4, r4, #1
	adds r2, r2, #2
	strh r3, [r1]
	cmp r4, #4
	blo _0222AB58
	movs r1, #0
_0222AB68:
	adds r3, r3, #1
	str r1, [r0, #0x20]
	adds r0, r0, #4
	cmp r3, #0x14
	blo _0222AB68
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AB40

	thumb_func_start ov80_0222AB78
ov80_0222AB78: @ 0x0222AB78
	str r1, [r0, #0x1c]
	movs r1, #1
	strb r1, [r0, #0x19]
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AB78

	thumb_func_start ov80_0222AB84
ov80_0222AB84: @ 0x0222AB84
	movs r2, #2
	strb r2, [r0, #0x19]
	adds r0, #0x88
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AB84

	thumb_func_start ov80_0222AB90
ov80_0222AB90: @ 0x0222AB90
	movs r1, #0
	strb r1, [r0, #0x19]
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov80_0222AB90

	thumb_func_start ov80_0222AB98
ov80_0222AB98: @ 0x0222AB98
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _0222ABAC
	cmp r1, #1
	beq _0222ABD2
	cmp r1, #2
	beq _0222ABB0
	b _0222AC04
_0222ABAC:
	movs r0, #0
	pop {r4, pc}
_0222ABB0:
	adds r1, r4, #0
	adds r1, #0x88
	ldr r1, [r1]
	cmp r1, #0
	beq _0222ABCE
	blx r1
	cmp r0, #1
	bne _0222ABCA
	movs r0, #1
	strb r0, [r4, #0x19]
	movs r0, #0
	adds r4, #0x88
	str r0, [r4]
_0222ABCA:
	movs r0, #1
	pop {r4, pc}
_0222ABCE:
	movs r0, #1
	strb r0, [r4, #0x19]
_0222ABD2:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0222ABDE
	movs r0, #0
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0222ABDE:
	adds r0, r4, #0
	bl ov80_0222AC58
	adds r1, r0, #0
	ldr r0, [r4, #0x74]
	cmp r1, r0
	blo _0222ABF6
	bl GF_AssertFail
	movs r0, #0
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0222ABF6:
	ldr r2, [r4, #0x70]
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	adds r0, r4, #0
	blx r1
	cmp r0, #1
	bne _0222ABD2
_0222AC04:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0222AB98

	thumb_func_start ov80_0222AC08
ov80_0222AC08: @ 0x0222AC08
	ldrb r3, [r0, #0x18]
	adds r2, r3, #1
	cmp r2, #0x14
	blt _0222AC14
	movs r0, #1
	bx lr
_0222AC14:
	lsls r2, r3, #2
	adds r2, r0, r2
	str r1, [r2, #0x20]
	ldrb r1, [r0, #0x18]
	adds r1, r1, #1
	strb r1, [r0, #0x18]
	movs r0, #0
	bx lr
	thumb_func_end ov80_0222AC08

	thumb_func_start ov80_0222AC24
ov80_0222AC24: @ 0x0222AC24
	ldrb r1, [r0, #0x18]
	cmp r1, #0
	bne _0222AC2E
	movs r0, #0
	bx lr
_0222AC2E:
	subs r1, r1, #1
	strb r1, [r0, #0x18]
	ldrb r1, [r0, #0x18]
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov80_0222AC24

	thumb_func_start ov80_0222AC3C
ov80_0222AC3C: @ 0x0222AC3C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x1c]
	bl ov80_0222AC08
	str r4, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222AC3C

	thumb_func_start ov80_0222AC4C
ov80_0222AC4C: @ 0x0222AC4C
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC24
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov80_0222AC4C

	thumb_func_start ov80_0222AC58
ov80_0222AC58: @ 0x0222AC58
	ldr r1, [r0, #0x1c]
	adds r3, r1, #1
	str r3, [r0, #0x1c]
	ldrb r2, [r1]
	adds r1, r3, #1
	str r1, [r0, #0x1c]
	ldrb r0, [r3]
	lsls r0, r0, #8
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	thumb_func_end ov80_0222AC58

	thumb_func_start ov80_0222AC70
ov80_0222AC70: @ 0x0222AC70
	push {r4, r5}
	ldr r1, [r0, #0x1c]
	adds r2, r1, #1
	str r2, [r0, #0x1c]
	ldrb r3, [r1]
	adds r1, r2, #1
	adds r5, r1, #1
	str r1, [r0, #0x1c]
	ldrb r2, [r2]
	adds r4, r5, #1
	str r5, [r0, #0x1c]
	ldrb r1, [r1]
	str r4, [r0, #0x1c]
	ldrb r0, [r5]
	movs r4, #0
	adds r0, r4, r0
	lsls r0, r0, #8
	adds r0, r0, r1
	lsls r0, r0, #8
	adds r0, r0, r2
	lsls r0, r0, #8
	adds r0, r0, r3
	pop {r4, r5}
	bx lr
	thumb_func_end ov80_0222AC70

	thumb_func_start ov80_0222ACA0
ov80_0222ACA0: @ 0x0222ACA0
	push {r3, lr}
	cmp r1, #0xd
	bhi _0222AD5A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222ACB2: @ jump table
	.2byte _0222ACCE - _0222ACB2 - 2 @ case 0
	.2byte _0222ACD8 - _0222ACB2 - 2 @ case 1
	.2byte _0222ACE2 - _0222ACB2 - 2 @ case 2
	.2byte _0222ACEC - _0222ACB2 - 2 @ case 3
	.2byte _0222ACF6 - _0222ACB2 - 2 @ case 4
	.2byte _0222AD00 - _0222ACB2 - 2 @ case 5
	.2byte _0222AD0A - _0222ACB2 - 2 @ case 6
	.2byte _0222AD14 - _0222ACB2 - 2 @ case 7
	.2byte _0222AD1E - _0222ACB2 - 2 @ case 8
	.2byte _0222AD28 - _0222ACB2 - 2 @ case 9
	.2byte _0222AD32 - _0222ACB2 - 2 @ case 10
	.2byte _0222AD3C - _0222ACB2 - 2 @ case 11
	.2byte _0222AD46 - _0222ACB2 - 2 @ case 12
	.2byte _0222AD50 - _0222ACB2 - 2 @ case 13
_0222ACCE:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD64 @ =0x0223B724
	ldr r0, [r0, r1]
	pop {r3, pc}
_0222ACD8:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD68 @ =0x0223B730
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222ACE2:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD6C @ =0x0223B732
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222ACEC:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD70 @ =0x0223B734
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222ACF6:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD74 @ =0x0223B736
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD00:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD78 @ =0x0223B738
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD0A:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD7C @ =0x0223B73A
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD14:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD80 @ =0x0223B73C
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD1E:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD84 @ =0x0223B73E
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD28:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD88 @ =0x0223B740
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD32:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD8C @ =0x0223B742
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD3C:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD90 @ =0x0223B744
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD46:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD94 @ =0x0223B746
	ldrb r0, [r0, r1]
	pop {r3, pc}
_0222AD50:
	movs r1, #0x28
	muls r1, r0, r1
	ldr r0, _0222AD98 @ =0x0223B747
	ldrb r0, [r0, r1]
	pop {r3, pc}
_0222AD5A:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	nop
_0222AD64: .4byte 0x0223B724
_0222AD68: .4byte 0x0223B730
_0222AD6C: .4byte 0x0223B732
_0222AD70: .4byte 0x0223B734
_0222AD74: .4byte 0x0223B736
_0222AD78: .4byte 0x0223B738
_0222AD7C: .4byte 0x0223B73A
_0222AD80: .4byte 0x0223B73C
_0222AD84: .4byte 0x0223B73E
_0222AD88: .4byte 0x0223B740
_0222AD8C: .4byte 0x0223B742
_0222AD90: .4byte 0x0223B744
_0222AD94: .4byte 0x0223B746
_0222AD98: .4byte 0x0223B747
	thumb_func_end ov80_0222ACA0

	thumb_func_start ov80_0222AD9C
ov80_0222AD9C: @ 0x0222AD9C
	push {r3, lr}
	movs r3, #0x28
	muls r3, r2, r3
	ldr r2, _0222ADB0 @ =0x0223B728
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _0222ADAC
	blx r2
_0222ADAC:
	pop {r3, pc}
	nop
_0222ADB0: .4byte 0x0223B728
	thumb_func_end ov80_0222AD9C

	thumb_func_start ov80_0222ADB4
ov80_0222ADB4: @ 0x0222ADB4
	push {r3, lr}
	movs r3, #0x28
	muls r3, r2, r3
	ldr r2, _0222ADC8 @ =0x0223B72C
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _0222ADC4
	blx r2
_0222ADC4:
	pop {r3, pc}
	nop
_0222ADC8: .4byte 0x0223B72C
	thumb_func_end ov80_0222ADB4

	thumb_func_start ov80_0222ADCC
ov80_0222ADCC: @ 0x0222ADCC
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x65
	movs r1, #0x20
	bl FUN_0201AA8C
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov80_0222ADCC

	thumb_func_start ov80_0222ADDC
ov80_0222ADDC: @ 0x0222ADDC
	ldr r3, _0222ADE4 @ =FUN_0201AB0C
	ldr r0, [r1]
	bx r3
	nop
_0222ADE4: .4byte FUN_0201AB0C
	thumb_func_end ov80_0222ADDC

	thumb_func_start ov80_0222ADE8
ov80_0222ADE8: @ 0x0222ADE8
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	bl ov80_02239D74
	str r0, [r4]
	movs r0, #0
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #2
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222ADE8

	thumb_func_start ov80_0222AE1C
ov80_0222AE1C: @ 0x0222AE1C
	ldr r3, _0222AE24 @ =ov80_02239DB8
	ldr r0, [r1]
	bx r3
	nop
_0222AE24: .4byte ov80_02239DB8
	thumb_func_end ov80_0222AE1C

	thumb_func_start ov80_0222AE28
ov80_0222AE28: @ 0x0222AE28
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AE28

	thumb_func_start ov80_0222AE2C
ov80_0222AE2C: @ 0x0222AE2C
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AE2C

	thumb_func_start ov80_0222AE30
ov80_0222AE30: @ 0x0222AE30
	push {r3, lr}
	movs r0, #0
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #2
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r3, #0x14
	ldr r0, _0222AE64 @ =0x04000050
	movs r1, #1
	movs r2, #0x3c
	str r3, [sp]
	blx FUN_020CF15C
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	pop {r3, pc}
	nop
_0222AE64: .4byte 0x04000050
	thumb_func_end ov80_0222AE30

	thumb_func_start ov80_0222AE68
ov80_0222AE68: @ 0x0222AE68
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AE68

	thumb_func_start ov80_0222AE6C
ov80_0222AE6C: @ 0x0222AE6C
	push {r3, lr}
	movs r0, #2
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #2
	bl FUN_0201BB68
	pop {r3, pc}
	thumb_func_end ov80_0222AE6C

	thumb_func_start ov80_0222AE80
ov80_0222AE80: @ 0x0222AE80
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AE80

	thumb_func_start ov80_0222AE84
ov80_0222AE84: @ 0x0222AE84
	push {r3, lr}
	ldr r0, _0222AE98 @ =0x04000050
	movs r3, #0x14
	movs r1, #1
	movs r2, #0x3c
	str r3, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	nop
_0222AE98: .4byte 0x04000050
	thumb_func_end ov80_0222AE84

	thumb_func_start ov80_0222AE9C
ov80_0222AE9C: @ 0x0222AE9C
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AE9C

	thumb_func_start ov80_0222AEA0
ov80_0222AEA0: @ 0x0222AEA0
	push {r4, lr}
	ldr r0, [r0]
	adds r4, r1, #0
	bl ov80_022384D8
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222AEA0

	thumb_func_start ov80_0222AEB0
ov80_0222AEB0: @ 0x0222AEB0
	ldr r3, _0222AEB8 @ =ov80_022385B0
	ldr r0, [r1]
	bx r3
	nop
_0222AEB8: .4byte ov80_022385B0
	thumb_func_end ov80_0222AEB0

	thumb_func_start ov80_0222AEBC
ov80_0222AEBC: @ 0x0222AEBC
	push {r3, lr}
	movs r0, #1
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #0
	movs r1, #2
	bl FUN_0201BB68
	movs r0, #2
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r0, #3
	adds r1, r0, #0
	bl FUN_0201BB68
	movs r3, #0x14
	ldr r0, _0222AEF0 @ =0x04000050
	movs r1, #1
	movs r2, #0x3c
	str r3, [sp]
	blx FUN_020CF15C
	pop {r3, pc}
	nop
_0222AEF0: .4byte 0x04000050
	thumb_func_end ov80_0222AEBC

	thumb_func_start ov80_0222AEF4
ov80_0222AEF4: @ 0x0222AEF4
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222AEF4

	thumb_func_start ov80_0222AEF8
ov80_0222AEF8: @ 0x0222AEF8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd9
	lsls r0, r0, #4
	ldrb r1, [r3, r0]
	adds r1, r1, #1
	strb r1, [r3, r0]
	bl FUN_0203769C
	cmp r4, r0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222AEF8

	thumb_func_start ov80_0222AF10
ov80_0222AF10: @ 0x0222AF10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222AF34 @ =0x000006FC
	ldr r0, [r4, r0]
	bl FUN_02028E9C
	ldr r1, _0222AF38 @ =0x0000072C
	movs r0, #0x22
	adds r1, r4, r1
	movs r2, #0x2c
	bl FUN_02037030
	cmp r0, #1
	bne _0222AF30
	movs r0, #1
	pop {r4, pc}
_0222AF30:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222AF34: .4byte 0x000006FC
_0222AF38: .4byte 0x0000072C
	thumb_func_end ov80_0222AF10

	thumb_func_start ov80_0222AF3C
ov80_0222AF3C: @ 0x0222AF3C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd9
	lsls r0, r0, #4
	ldrb r1, [r3, r0]
	adds r1, r1, #1
	strb r1, [r3, r0]
	bl FUN_0203769C
	cmp r4, r0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222AF3C

	thumb_func_start ov80_0222AF54
ov80_0222AF54: @ 0x0222AF54
	push {r4, lr}
	ldr r1, _0222AF80 @ =0x0000072C
	movs r3, #0
	adds r1, r0, r1
	adds r4, r1, #0
_0222AF5E:
	ldrh r2, [r0, #0x18]
	adds r3, r3, #1
	adds r0, r0, #2
	strh r2, [r4]
	adds r4, r4, #2
	cmp r3, #0x14
	blt _0222AF5E
	movs r0, #0x23
	movs r2, #0x2c
	bl FUN_02037030
	cmp r0, #1
	bne _0222AF7C
	movs r0, #1
	pop {r4, pc}
_0222AF7C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222AF80: .4byte 0x0000072C
	thumb_func_end ov80_0222AF54

	thumb_func_start ov80_0222AF84
ov80_0222AF84: @ 0x0222AF84
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0xd9
	adds r4, r3, #0
	lsls r0, r0, #4
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222AFB6
	bl FUN_0203769C
	cmp r0, #0
	beq _0222AFB6
	movs r1, #0
_0222AFA8:
	ldrh r0, [r5]
	adds r1, r1, #1
	adds r5, r5, #2
	strh r0, [r4, #0x18]
	adds r4, r4, #2
	cmp r1, #0x14
	blt _0222AFA8
_0222AFB6:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222AF84

	thumb_func_start ov80_0222AFB8
ov80_0222AFB8: @ 0x0222AFB8
	push {r3, r4, r5, lr}
	ldr r1, _0222AFE8 @ =0x0000072C
	movs r2, #0x9a
	adds r1, r0, r1
	movs r4, #0
	adds r5, r1, #0
	lsls r2, r2, #2
_0222AFC6:
	ldrh r3, [r0, r2]
	adds r4, r4, #1
	adds r0, r0, #2
	strh r3, [r5]
	adds r5, r5, #2
	cmp r4, #0x14
	blt _0222AFC6
	movs r0, #0x24
	movs r2, #0x2c
	bl FUN_02037030
	cmp r0, #1
	bne _0222AFE4
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222AFE4:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222AFE8: .4byte 0x0000072C
	thumb_func_end ov80_0222AFB8

	thumb_func_start ov80_0222AFEC
ov80_0222AFEC: @ 0x0222AFEC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0xd9
	adds r4, r3, #0
	lsls r0, r0, #4
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B022
	bl FUN_0203769C
	cmp r0, #0
	beq _0222B022
	movs r0, #0x9a
	movs r2, #0
	lsls r0, r0, #2
_0222B014:
	ldrh r1, [r5]
	adds r2, r2, #1
	adds r5, r5, #2
	strh r1, [r4, r0]
	adds r4, r4, #2
	cmp r2, #0x14
	blt _0222B014
_0222B022:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222AFEC

	thumb_func_start ov80_0222B024
ov80_0222B024: @ 0x0222B024
	push {r3, lr}
	ldr r2, _0222B044 @ =0x0000072C
	adds r3, r0, #0
	strh r1, [r3, r2]
	adds r1, r3, r2
	movs r0, #0x25
	movs r2, #0x2c
	bl FUN_02037030
	cmp r0, #1
	bne _0222B03E
	movs r0, #1
	pop {r3, pc}
_0222B03E:
	movs r0, #0
	pop {r3, pc}
	nop
_0222B044: .4byte 0x0000072C
	thumb_func_end ov80_0222B024

	thumb_func_start ov80_0222B048
ov80_0222B048: @ 0x0222B048
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xd9
	adds r4, r3, #0
	lsls r0, r0, #4
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222B068
	ldrh r1, [r6]
	ldr r0, _0222B06C @ =0x00000D88
	strb r1, [r4, r0]
_0222B068:
	pop {r4, r5, r6, pc}
	nop
_0222B06C: .4byte 0x00000D88
	thumb_func_end ov80_0222B048

	thumb_func_start ov80_0222B070
ov80_0222B070: @ 0x0222B070
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_0206DD28
	adds r4, r0, #0
	ldr r0, _0222B0B0 @ =0x000006FC
	ldr r0, [r5, r0]
	bl FUN_02074904
	movs r1, #0x26
	lsls r1, r1, #4
	ldrb r1, [r5, r1]
	bl FUN_02074644
	ldr r1, _0222B0B4 @ =0x00000784
	adds r2, r4, #0
	adds r1, r5, r1
	blx FUN_020D4A50
	ldr r1, _0222B0B4 @ =0x00000784
	movs r2, #2
	movs r0, #0x26
	adds r1, r5, r1
	lsls r2, r2, #8
	bl FUN_02036FD8
	cmp r0, #1
	bne _0222B0AC
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222B0AC:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B0B0: .4byte 0x000006FC
_0222B0B4: .4byte 0x00000784
	thumb_func_end ov80_0222B070

	thumb_func_start ov80_0222B0B8
ov80_0222B0B8: @ 0x0222B0B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0xd9
	adds r4, r3, #0
	lsls r0, r0, #4
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222B0E2
	bl FUN_0206DD28
	ldr r1, _0222B0E4 @ =0x00000D8C
	adds r2, r0, #0
	ldr r1, [r4, r1]
	adds r0, r6, #0
	blx FUN_020D4A50
_0222B0E2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B0E4: .4byte 0x00000D8C
	thumb_func_end ov80_0222B0B8

	thumb_func_start ov80_0222B0E8
ov80_0222B0E8: @ 0x0222B0E8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	lsls r0, r0, #8
	adds r4, r1, #0
	cmp r2, r0
	ble _0222B0FA
	bl GF_AssertFail
_0222B0FA:
	ldr r0, _0222B104 @ =0x00000984
	adds r1, r4, r0
	lsls r0, r5, #9
	adds r0, r1, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222B104: .4byte 0x00000984
	thumb_func_end ov80_0222B0E8

	thumb_func_start ov80_0222B108
ov80_0222B108: @ 0x0222B108
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222B13C @ =0x00000504
	adds r4, r5, r0
	subs r0, #0xc
	ldr r0, [r5, r0]
	bl FUN_02028E9C
	ldrh r0, [r5, #8]
	adds r1, r4, #0
	movs r2, #0x3c
	strh r0, [r4, #2]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0xe]
	strh r0, [r4, #6]
	movs r0, #0x16
	bl FUN_02037030
	cmp r0, #1
	bne _0222B136
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222B136:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222B13C: .4byte 0x00000504
	thumb_func_end ov80_0222B108

	thumb_func_start ov80_0222B140
ov80_0222B140: @ 0x0222B140
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0222B170 @ =0x00000702
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B16C
	ldrh r1, [r5, #2]
	movs r0, #0x16
	lsls r0, r0, #6
	strh r1, [r4, r0]
	ldrh r2, [r5, #4]
	adds r1, r0, #2
	subs r0, r0, #2
	strh r2, [r4, r1]
	ldrh r1, [r5, #6]
	strh r1, [r4, r0]
_0222B16C:
	pop {r4, r5, r6, pc}
	nop
_0222B170: .4byte 0x00000702
	thumb_func_end ov80_0222B140

	thumb_func_start ov80_0222B174
ov80_0222B174: @ 0x0222B174
	push {r4, lr}
	ldr r1, _0222B1A0 @ =0x00000504
	movs r3, #0
	adds r1, r0, r1
	adds r4, r1, #0
_0222B17E:
	ldrh r2, [r0, #0x18]
	adds r3, r3, #1
	adds r0, r0, #2
	strh r2, [r4]
	adds r4, r4, #2
	cmp r3, #0xe
	blt _0222B17E
	movs r0, #0x17
	movs r2, #0x3c
	bl FUN_02037030
	cmp r0, #1
	bne _0222B19C
	movs r0, #1
	pop {r4, pc}
_0222B19C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222B1A0: .4byte 0x00000504
	thumb_func_end ov80_0222B174

	thumb_func_start ov80_0222B1A4
ov80_0222B1A4: @ 0x0222B1A4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0222B1D8 @ =0x00000702
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B1D4
	bl FUN_0203769C
	cmp r0, #0
	beq _0222B1D4
	movs r1, #0
_0222B1C6:
	ldrh r0, [r5]
	adds r1, r1, #1
	adds r5, r5, #2
	strh r0, [r4, #0x18]
	adds r4, r4, #2
	cmp r1, #0xe
	blt _0222B1C6
_0222B1D4:
	pop {r4, r5, r6, pc}
	nop
_0222B1D8: .4byte 0x00000702
	thumb_func_end ov80_0222B1A4

	thumb_func_start ov80_0222B1DC
ov80_0222B1DC: @ 0x0222B1DC
	push {r4, r5, r6, lr}
	ldr r1, _0222B240 @ =0x00000504
	ldr r2, _0222B244 @ =0x00000584
	adds r1, r0, r1
	movs r4, #0
	adds r5, r0, #0
	adds r6, r1, #0
_0222B1EA:
	ldrh r3, [r5, r2]
	adds r4, r4, #1
	adds r5, r5, #2
	strh r3, [r6]
	adds r6, r6, #2
	cmp r4, #6
	blt _0222B1EA
	movs r2, #0x59
	movs r5, #0
	adds r4, r1, #0
	lsls r2, r2, #4
_0222B200:
	adds r3, r0, r5
	ldrb r3, [r3, r2]
	adds r5, r5, #1
	strh r3, [r4, #0xc]
	adds r4, r4, #2
	cmp r5, #6
	blt _0222B200
	ldr r4, _0222B248 @ =0x00000598
	adds r2, r1, #0
	movs r3, #0
	adds r2, #0x18
	adds r5, r4, #0
_0222B218:
	ldr r6, [r0, r4]
	adds r3, r3, #1
	strh r6, [r2]
	ldr r6, [r0, r5]
	adds r0, r0, #4
	lsrs r6, r6, #0x10
	strh r6, [r2, #0xc]
	adds r2, r2, #2
	cmp r3, #6
	blt _0222B218
	movs r0, #0x18
	movs r2, #0x3c
	bl FUN_02037030
	cmp r0, #1
	bne _0222B23C
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222B23C:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B240: .4byte 0x00000504
_0222B244: .4byte 0x00000584
_0222B248: .4byte 0x00000598
	thumb_func_end ov80_0222B1DC

	thumb_func_start ov80_0222B24C
ov80_0222B24C: @ 0x0222B24C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0222B2C0 @ =0x00000702
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B2BE
	bl FUN_0203769C
	cmp r0, #0
	beq _0222B2BE
	movs r0, #0x95
	movs r2, #0
	adds r3, r5, #0
	adds r6, r4, #0
	lsls r0, r0, #2
_0222B276:
	ldrh r1, [r3]
	adds r2, r2, #1
	adds r3, r3, #2
	strh r1, [r6, r0]
	adds r6, r6, #2
	cmp r2, #6
	blt _0222B276
	movs r0, #0x26
	movs r6, #0
	adds r3, r5, #0
	lsls r0, r0, #4
_0222B28C:
	ldrh r2, [r3, #0xc]
	adds r1, r4, r6
	adds r6, r6, #1
	adds r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #6
	blt _0222B28C
	movs r2, #0x9a
	lsls r2, r2, #2
	movs r1, #0
	adds r5, #0x18
	adds r3, r2, #0
	adds r6, r2, #0
_0222B2A6:
	ldrh r0, [r5]
	adds r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #0xc]
	ldr r0, [r4, r3]
	adds r5, r5, #2
	lsls r7, r7, #0x10
	orrs r0, r7
	str r0, [r4, r6]
	adds r4, r4, #4
	cmp r1, #6
	blt _0222B2A6
_0222B2BE:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B2C0: .4byte 0x00000702
	thumb_func_end ov80_0222B24C

	thumb_func_start ov80_0222B2C4
ov80_0222B2C4: @ 0x0222B2C4
	push {r4, r5, r6, lr}
	ldr r1, _0222B328 @ =0x00000504
	ldr r2, _0222B32C @ =0x000003D2
	adds r1, r0, r1
	movs r4, #0
	adds r5, r0, #0
	adds r6, r1, #0
_0222B2D2:
	ldrh r3, [r5, r2]
	adds r4, r4, #1
	adds r5, r5, #2
	strh r3, [r6]
	adds r6, r6, #2
	cmp r4, #4
	blt _0222B2D2
	ldr r2, _0222B330 @ =0x000003DA
	movs r5, #0
	adds r4, r1, #0
_0222B2E6:
	adds r3, r0, r5
	ldrb r3, [r3, r2]
	adds r5, r5, #1
	strh r3, [r4, #8]
	adds r4, r4, #2
	cmp r5, #4
	blt _0222B2E6
	movs r4, #0x3e
	adds r2, r1, #0
	lsls r4, r4, #4
	movs r3, #0
	adds r2, #0x10
	adds r5, r4, #0
_0222B300:
	ldr r6, [r0, r4]
	adds r3, r3, #1
	strh r6, [r2]
	ldr r6, [r0, r5]
	adds r0, r0, #4
	lsrs r6, r6, #0x10
	strh r6, [r2, #8]
	adds r2, r2, #2
	cmp r3, #4
	blt _0222B300
	movs r0, #0x19
	movs r2, #0x3c
	bl FUN_02037030
	cmp r0, #1
	bne _0222B324
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222B324:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B328: .4byte 0x00000504
_0222B32C: .4byte 0x000003D2
_0222B330: .4byte 0x000003DA
	thumb_func_end ov80_0222B2C4

	thumb_func_start ov80_0222B334
ov80_0222B334: @ 0x0222B334
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0222B3A4 @ =0x00000702
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B3A2
	bl FUN_0203769C
	cmp r0, #0
	beq _0222B3A2
	ldr r0, _0222B3A8 @ =0x000003D2
	movs r2, #0
	adds r3, r5, #0
	adds r6, r4, #0
_0222B35C:
	ldrh r1, [r3]
	adds r2, r2, #1
	adds r3, r3, #2
	strh r1, [r6, r0]
	adds r6, r6, #2
	cmp r2, #4
	blt _0222B35C
	ldr r0, _0222B3AC @ =0x000003DA
	movs r6, #0
	adds r3, r5, #0
_0222B370:
	ldrh r2, [r3, #8]
	adds r1, r4, r6
	adds r6, r6, #1
	adds r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #4
	blt _0222B370
	movs r2, #0x3e
	lsls r2, r2, #4
	movs r1, #0
	adds r5, #0x10
	adds r3, r2, #0
	adds r6, r2, #0
_0222B38A:
	ldrh r0, [r5]
	adds r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #8]
	ldr r0, [r4, r3]
	adds r5, r5, #2
	lsls r7, r7, #0x10
	orrs r0, r7
	str r0, [r4, r6]
	adds r4, r4, #4
	cmp r1, #4
	blt _0222B38A
_0222B3A2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B3A4: .4byte 0x00000702
_0222B3A8: .4byte 0x000003D2
_0222B3AC: .4byte 0x000003DA
	thumb_func_end ov80_0222B334

	thumb_func_start ov80_0222B3B0
ov80_0222B3B0: @ 0x0222B3B0
	push {r3, lr}
	ldr r2, _0222B3D0 @ =0x00000504
	adds r3, r0, #0
	strh r1, [r3, r2]
	adds r1, r3, r2
	movs r0, #0x1a
	movs r2, #0x3c
	bl FUN_02037030
	cmp r0, #1
	bne _0222B3CA
	movs r0, #1
	pop {r3, pc}
_0222B3CA:
	movs r0, #0
	pop {r3, pc}
	nop
_0222B3D0: .4byte 0x00000504
	thumb_func_end ov80_0222B3B0

	thumb_func_start ov80_0222B3D4
ov80_0222B3D4: @ 0x0222B3D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222B3F4 @ =0x00000702
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222B3F2
	ldrh r1, [r6]
	ldr r0, _0222B3F8 @ =0x0000057C
	strb r1, [r4, r0]
_0222B3F2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B3F4: .4byte 0x00000702
_0222B3F8: .4byte 0x0000057C
	thumb_func_end ov80_0222B3D4

	thumb_func_start ov80_0222B3FC
ov80_0222B3FC: @ 0x0222B3FC
	push {r3, lr}
	ldr r2, _0222B41C @ =0x00000504
	adds r3, r0, #0
	strh r1, [r3, r2]
	adds r1, r3, r2
	movs r0, #0x1b
	movs r2, #0x3c
	bl FUN_02037030
	cmp r0, #1
	bne _0222B416
	movs r0, #1
	pop {r3, pc}
_0222B416:
	movs r0, #0
	pop {r3, pc}
	nop
_0222B41C: .4byte 0x00000504
	thumb_func_end ov80_0222B3FC

	thumb_func_start ov80_0222B420
ov80_0222B420: @ 0x0222B420
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222B440 @ =0x00000702
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222B43E
	ldrh r1, [r6]
	ldr r0, _0222B444 @ =0x0000057D
	strb r1, [r4, r0]
_0222B43E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B440: .4byte 0x00000702
_0222B444: .4byte 0x0000057D
	thumb_func_end ov80_0222B420

	thumb_func_start ov80_0222B448
ov80_0222B448: @ 0x0222B448
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, _0222B520 @ =0x00000504
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	cmp r4, #0
	ble _0222B49A
	add r7, sp, #0x10
	add r6, sp, #0x14
_0222B46C:
	ldr r0, _0222B524 @ =0x000004D4
	ldr r1, [sp, #8]
	ldr r0, [r5, r0]
	bl FUN_02074644
	str r0, [sp, #0xc]
	movs r1, #0x47
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r7]
	movs r1, #0
	ldr r0, [sp, #0xc]
	adds r2, r1, #0
	bl FUN_0206E540
	stm r6!, {r0}
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r4
	blt _0222B46C
_0222B49A:
	movs r3, #0
	cmp r4, #0
	ble _0222B4B2
	ldr r2, [sp]
	ldr r0, _0222B528 @ =0x000004E8
_0222B4A4:
	ldrh r1, [r5, r0]
	adds r3, r3, #1
	adds r5, r5, #2
	strh r1, [r2]
	adds r2, r2, #2
	cmp r3, r4
	blt _0222B4A4
_0222B4B2:
	ldr r0, [sp, #4]
	adds r0, r0, r4
	str r0, [sp, #4]
	movs r0, #0
	cmp r4, #0
	ble _0222B4D6
	ldr r1, [sp, #4]
	add r3, sp, #0x10
	lsls r2, r1, #1
	ldr r1, [sp]
	adds r2, r1, r2
_0222B4C8:
	ldrb r1, [r3]
	adds r0, r0, #1
	adds r3, r3, #1
	strh r1, [r2]
	adds r2, r2, #2
	cmp r0, r4
	blt _0222B4C8
_0222B4D6:
	ldr r0, [sp, #4]
	movs r3, #0
	adds r0, r0, r4
	cmp r4, #0
	ble _0222B506
	ldr r5, [sp]
	lsls r6, r4, #1
	ldr r2, [sp]
	lsls r0, r0, #1
	adds r5, r5, r6
	adds r2, r2, r0
	add r1, sp, #0x14
	adds r0, r5, r0
_0222B4F0:
	ldr r5, [r1]
	adds r3, r3, #1
	strh r5, [r2]
	ldr r5, [r1]
	adds r1, r1, #4
	lsrs r5, r5, #0x10
	strh r5, [r0]
	adds r2, r2, #2
	adds r0, r0, #2
	cmp r3, r4
	blt _0222B4F0
_0222B506:
	ldr r1, [sp]
	movs r0, #0x1c
	movs r2, #0x3c
	bl FUN_02037030
	cmp r0, #1
	bne _0222B51A
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0222B51A:
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222B520: .4byte 0x00000504
_0222B524: .4byte 0x000004D4
_0222B528: .4byte 0x000004E8
	thumb_func_end ov80_0222B448

	thumb_func_start ov80_0222B52C
ov80_0222B52C: @ 0x0222B52C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222B5BC @ =0x00000702
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	str r2, [sp]
	movs r7, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222B5B8
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	adds r3, r7, #0
	cmp r0, #0
	ble _0222B566
	ldr r5, [sp]
	ldr r1, _0222B5C0 @ =0x00000584
	adds r6, r4, #0
_0222B558:
	ldrh r2, [r5]
	adds r3, r3, #1
	adds r5, r5, #2
	strh r2, [r6, r1]
	adds r6, r6, #2
	cmp r3, r0
	blt _0222B558
_0222B566:
	adds r7, r7, r0
	movs r6, #0
	cmp r0, #0
	ble _0222B586
	ldr r1, [sp]
	lsls r2, r7, #1
	adds r5, r1, r2
	movs r1, #0x59
	lsls r1, r1, #4
_0222B578:
	ldrh r3, [r5]
	adds r2, r4, r6
	adds r6, r6, #1
	strb r3, [r2, r1]
	adds r5, r5, #2
	cmp r6, r0
	blt _0222B578
_0222B586:
	adds r2, r7, r0
	movs r1, #0
	cmp r0, #0
	ble _0222B5B8
	ldr r3, [sp]
	lsls r2, r2, #1
	lsls r6, r0, #1
	adds r5, r3, r2
	adds r3, r3, r6
	adds r6, r3, r2
	ldr r2, _0222B5C4 @ =0x00000598
_0222B59C:
	ldrh r7, [r5]
	ldr r3, _0222B5C4 @ =0x00000598
	adds r1, r1, #1
	str r7, [r4, r3]
	ldrh r7, [r6]
	ldr r3, [r4, r3]
	adds r5, r5, #2
	lsls r7, r7, #0x10
	orrs r3, r7
	str r3, [r4, r2]
	adds r4, r4, #4
	adds r6, r6, #2
	cmp r1, r0
	blt _0222B59C
_0222B5B8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B5BC: .4byte 0x00000702
_0222B5C0: .4byte 0x00000584
_0222B5C4: .4byte 0x00000598
	thumb_func_end ov80_0222B52C

	thumb_func_start ov80_0222B5C8
ov80_0222B5C8: @ 0x0222B5C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_02030E08
	ldrh r1, [r5, #0x14]
	ldr r0, _0222B620 @ =0x000003C2
	strh r1, [r5, r0]
	ldrh r1, [r5, #0x16]
	adds r0, r0, #2
	strh r1, [r5, r0]
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	ldr r1, _0222B624 @ =0x000003D6
	movs r2, #0x28
	strh r0, [r5, r1]
	subs r1, #0x16
	movs r0, #0x2a
	adds r1, r5, r1
	bl FUN_02037030
	cmp r0, #1
	bne _0222B61A
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222B61A:
	movs r0, #0
	pop {r4, r5, r6, pc}
	nop
_0222B620: .4byte 0x000003C2
_0222B624: .4byte 0x000003D6
	thumb_func_end ov80_0222B5C8

	thumb_func_start ov80_0222B628
ov80_0222B628: @ 0x0222B628
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0222B654 @ =0x00000A1A
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B652
	ldrh r1, [r5, #2]
	ldr r0, _0222B658 @ =0x00000A16
	strh r1, [r4, r0]
	ldrh r2, [r5, #4]
	subs r1, r0, #4
	adds r0, r0, #6
	strh r2, [r4, r1]
	ldrh r1, [r5, #0x16]
	strh r1, [r4, r0]
_0222B652:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B654: .4byte 0x00000A1A
_0222B658: .4byte 0x00000A16
	thumb_func_end ov80_0222B628

	thumb_func_start ov80_0222B65C
ov80_0222B65C: @ 0x0222B65C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xf
	movs r2, #0
	adds r3, r4, #0
	lsls r0, r0, #6
_0222B668:
	ldrh r1, [r3, #0x30]
	adds r2, r2, #1
	strh r1, [r3, r0]
	adds r3, r3, #2
	cmp r2, #0xe
	blt _0222B668
	movs r1, #0xf
	lsls r1, r1, #6
	movs r0, #0x2b
	adds r1, r4, r1
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222B68A
	movs r0, #1
	pop {r4, pc}
_0222B68A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222B65C

	thumb_func_start ov80_0222B690
ov80_0222B690: @ 0x0222B690
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0222B6C4 @ =0x00000A1A
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B6C0
	bl FUN_0203769C
	cmp r0, #0
	beq _0222B6C0
	movs r1, #0
_0222B6B2:
	ldrh r0, [r5]
	adds r1, r1, #1
	adds r5, r5, #2
	strh r0, [r4, #0x30]
	adds r4, r4, #2
	cmp r1, #0xe
	blt _0222B6B2
_0222B6C0:
	pop {r4, r5, r6, pc}
	nop
_0222B6C4: .4byte 0x00000A1A
	thumb_func_end ov80_0222B690

	thumb_func_start ov80_0222B6C8
ov80_0222B6C8: @ 0x0222B6C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222B734 @ =0x00000A18
	ldrb r1, [r4, r0]
	movs r0, #0xf
	lsls r0, r0, #6
	strh r1, [r4, r0]
	bl FUN_0203769C
	cmp r0, #0
	ldr r1, _0222B738 @ =0x00000A1B
	bne _0222B700
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _0222B6EE
	subs r0, r1, #3
	ldrb r0, [r4, r0]
	strb r0, [r4, r1]
	b _0222B712
_0222B6EE:
	subs r0, r0, #6
	cmp r0, #4
	bne _0222B712
	subs r0, r1, #3
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B712
	strb r0, [r4, r1]
	b _0222B712
_0222B700:
	ldrb r0, [r4, r1]
	cmp r0, #4
	bne _0222B712
	subs r0, r1, #3
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B712
	adds r0, r0, #6
	strb r0, [r4, r1]
_0222B712:
	ldr r0, _0222B738 @ =0x00000A1B
	ldr r1, _0222B73C @ =0x000003C2
	ldrb r0, [r4, r0]
	movs r2, #0x28
	strh r0, [r4, r1]
	subs r1, r1, #2
	movs r0, #0x2c
	adds r1, r4, r1
	bl FUN_02037030
	cmp r0, #1
	bne _0222B72E
	movs r0, #1
	pop {r4, pc}
_0222B72E:
	movs r0, #0
	pop {r4, pc}
	nop
_0222B734: .4byte 0x00000A18
_0222B738: .4byte 0x00000A1B
_0222B73C: .4byte 0x000003C2
	thumb_func_end ov80_0222B6C8

	thumb_func_start ov80_0222B740
ov80_0222B740: @ 0x0222B740
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0222B7D4 @ =0x00000A1A
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B7D2
	ldrh r1, [r5]
	ldr r0, _0222B7D8 @ =0x00000A19
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r0, #0
	bne _0222B7A4
	ldr r1, _0222B7DC @ =0x00000A1B
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0222B78A
	cmp r0, #4
	bne _0222B7D2
	subs r0, r1, #2
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B7D2
	adds r2, r0, #6
	subs r0, r1, #3
	strb r2, [r4, r0]
	subs r0, r1, #2
	ldrb r0, [r4, r0]
	adds r0, r0, #6
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0222B78A:
	subs r0, r1, #2
	ldrb r0, [r4, r0]
	adds r0, r0, #6
	strb r0, [r4, r1]
	subs r0, r1, #2
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B7D2
	adds r0, r1, #5
	ldr r2, _0222B7E0 @ =0x0000EEDD
	ldr r0, [r4, r0]
	strh r2, [r0]
	pop {r4, r5, r6, pc}
_0222B7A4:
	ldrh r1, [r5, #2]
	ldr r0, _0222B7DC @ =0x00000A1B
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	cmp r1, #4
	beq _0222B7B8
	adds r0, r0, #5
	ldr r1, _0222B7E0 @ =0x0000EEDD
	ldr r0, [r4, r0]
	strh r1, [r0]
_0222B7B8:
	ldr r1, _0222B7D8 @ =0x00000A19
	ldrb r0, [r4, r1]
	cmp r0, #4
	bne _0222B7D2
	subs r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0222B7D2
	cmp r0, #4
	beq _0222B7D2
	adds r2, r0, #6
	adds r0, r1, #2
	strb r2, [r4, r0]
_0222B7D2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B7D4: .4byte 0x00000A1A
_0222B7D8: .4byte 0x00000A19
_0222B7DC: .4byte 0x00000A1B
_0222B7E0: .4byte 0x0000EEDD
	thumb_func_end ov80_0222B740

	thumb_func_start ov80_0222B7E4
ov80_0222B7E4: @ 0x0222B7E4
	push {r3, r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0x9b
	movs r1, #0xf
	movs r4, #0
	adds r5, r3, #0
	lsls r0, r0, #2
	lsls r1, r1, #6
_0222B7F4:
	ldrh r2, [r5, r0]
	adds r4, r4, #1
	strh r2, [r5, r1]
	adds r5, r5, #2
	cmp r4, #4
	blt _0222B7F4
	movs r0, #0x9d
	movs r1, #0xf2
	movs r5, #0
	adds r4, r3, #0
	lsls r0, r0, #2
	lsls r1, r1, #2
_0222B80C:
	adds r2, r3, r5
	ldrb r2, [r2, r0]
	adds r5, r5, #1
	strh r2, [r4, r1]
	adds r4, r4, #2
	cmp r5, #4
	blt _0222B80C
	movs r7, #0xf
	lsls r7, r7, #6
	adds r1, r3, #0
	movs r5, #0x9e
	adds r6, r7, #0
	movs r2, #0
	adds r0, r3, #0
	adds r1, #0x10
	lsls r5, r5, #2
	adds r6, #8
_0222B82E:
	movs r4, #0x9e
	lsls r4, r4, #2
	ldr r4, [r0, r4]
	adds r2, r2, #1
	strh r4, [r1, r7]
	ldr r4, [r0, r5]
	adds r0, r0, #4
	lsrs r4, r4, #0x10
	strh r4, [r1, r6]
	adds r1, r1, #2
	cmp r2, #4
	blt _0222B82E
	movs r1, #0xf
	lsls r1, r1, #6
	movs r0, #0x2d
	adds r1, r3, r1
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222B85C
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B85C:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222B7E4

	thumb_func_start ov80_0222B860
ov80_0222B860: @ 0x0222B860
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0222B8D4 @ =0x00000A1A
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222B8D2
	bl FUN_0203769C
	cmp r0, #0
	beq _0222B8D2
	movs r0, #0x9b
	movs r2, #0
	adds r3, r5, #0
	adds r6, r4, #0
	lsls r0, r0, #2
_0222B88A:
	ldrh r1, [r3]
	adds r2, r2, #1
	adds r3, r3, #2
	strh r1, [r6, r0]
	adds r6, r6, #2
	cmp r2, #4
	blt _0222B88A
	movs r0, #0x9d
	movs r6, #0
	adds r3, r5, #0
	lsls r0, r0, #2
_0222B8A0:
	ldrh r2, [r3, #8]
	adds r1, r4, r6
	adds r6, r6, #1
	adds r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #4
	blt _0222B8A0
	movs r2, #0x9e
	lsls r2, r2, #2
	movs r1, #0
	adds r5, #0x10
	adds r3, r2, #0
	adds r6, r2, #0
_0222B8BA:
	ldrh r0, [r5]
	adds r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #8]
	ldr r0, [r4, r3]
	adds r5, r5, #2
	lsls r7, r7, #0x10
	orrs r0, r7
	str r0, [r4, r6]
	adds r4, r4, #4
	cmp r1, #4
	blt _0222B8BA
_0222B8D2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222B8D4: .4byte 0x00000A1A
	thumb_func_end ov80_0222B860

	thumb_func_start ov80_0222B8D8
ov80_0222B8D8: @ 0x0222B8D8
	push {r3, lr}
	movs r2, #0xf
	adds r3, r0, #0
	lsls r2, r2, #6
	strh r1, [r3, r2]
	adds r1, r3, r2
	movs r0, #0x2e
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222B8F4
	movs r0, #1
	pop {r3, pc}
_0222B8F4:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222B8D8

	thumb_func_start ov80_0222B8F8
ov80_0222B8F8: @ 0x0222B8F8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222B91C @ =0x00000A1A
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222B918
	ldrh r1, [r6]
	movs r0, #0xa1
	lsls r0, r0, #4
	strb r1, [r4, r0]
_0222B918:
	pop {r4, r5, r6, pc}
	nop
_0222B91C: .4byte 0x00000A1A
	thumb_func_end ov80_0222B8F8

	thumb_func_start ov80_0222B920
ov80_0222B920: @ 0x0222B920
	push {r3, lr}
	movs r2, #0xf
	adds r3, r0, #0
	lsls r2, r2, #6
	strh r1, [r3, r2]
	adds r1, r3, r2
	movs r0, #0x2f
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222B93C
	movs r0, #1
	pop {r3, pc}
_0222B93C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222B920

	thumb_func_start ov80_0222B940
ov80_0222B940: @ 0x0222B940
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222B960 @ =0x00000A1A
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222B95E
	ldrh r1, [r6]
	ldr r0, _0222B964 @ =0x00000A11
	strb r1, [r4, r0]
_0222B95E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B960: .4byte 0x00000A1A
_0222B964: .4byte 0x00000A11
	thumb_func_end ov80_0222B940

	thumb_func_start ov80_0222B968
ov80_0222B968: @ 0x0222B968
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #0x10]
	movs r1, #0
	bl ov80_02237B24
	str r0, [sp]
	bl FUN_0206DD28
	adds r6, r0, #0
	ldr r0, [sp]
	movs r4, #0
	cmp r0, #0
	ble _0222B9AC
	movs r0, #0x41
	lsls r0, r0, #4
	adds r0, r7, r0
	adds r5, r4, #0
	str r0, [sp, #4]
_0222B990:
	ldr r0, [r7, #0x28]
	adds r1, r4, #0
	bl FUN_02074644
	ldr r1, [sp, #4]
	adds r2, r6, #0
	adds r1, r1, r5
	blx FUN_020D4A50
	ldr r0, [sp]
	adds r4, r4, #1
	adds r5, r5, r6
	cmp r4, r0
	blt _0222B990
_0222B9AC:
	movs r1, #0x41
	lsls r1, r1, #4
	movs r2, #2
	movs r0, #0x30
	adds r1, r7, r1
	lsls r2, r2, #8
	bl FUN_02036FD8
	cmp r0, #1
	bne _0222B9C6
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B9C6:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222B968

	thumb_func_start ov80_0222B9CC
ov80_0222B9CC: @ 0x0222B9CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0222BA58 @ =0x00000A1A
	adds r4, r0, #0
	adds r0, r3, #0
	ldrb r0, [r0, r1]
	str r2, [sp]
	str r3, [sp, #4]
	adds r2, r0, #1
	adds r0, r3, #0
	strb r2, [r0, r1]
	bl FUN_0203769C
	cmp r4, r0
	beq _0222BA54
	ldr r0, [sp, #4]
	movs r1, #0
	ldrb r0, [r0, #0x10]
	bl ov80_02237B24
	str r0, [sp, #8]
	bl FUN_0206DD28
	adds r5, r0, #0
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	ldr r0, [sp, #8]
	movs r7, #0
	cmp r0, #0
	ble _0222BA2E
	adds r4, r7, #0
_0222BA0E:
	ldr r0, [sp]
	adds r1, r6, #0
	adds r0, r0, r4
	adds r2, r5, #0
	blx FUN_020D4A50
	ldr r0, [sp, #4]
	adds r1, r6, #0
	ldr r0, [r0, #0x28]
	bl FUN_02074524
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r4, r4, r5
	cmp r7, r0
	blt _0222BA0E
_0222BA2E:
	adds r0, r6, #0
	bl FUN_0201AB0C
	bl FUN_0203769C
	cmp r0, #0
	beq _0222BA54
	ldr r0, [sp, #4]
	movs r1, #0
	ldr r0, [r0, #0x28]
	movs r2, #2
	bl FUN_020747BC
	ldr r0, [sp, #4]
	movs r1, #1
	ldr r0, [r0, #0x28]
	movs r2, #3
	bl FUN_020747BC
_0222BA54:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222BA58: .4byte 0x00000A1A
	thumb_func_end ov80_0222B9CC

	thumb_func_start ov80_0222BA5C
ov80_0222BA5C: @ 0x0222BA5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	lsls r0, r0, #8
	adds r4, r1, #0
	cmp r2, r0
	ble _0222BA6E
	bl GF_AssertFail
_0222BA6E:
	movs r0, #0x61
	lsls r0, r0, #4
	adds r1, r4, r0
	lsls r0, r5, #9
	adds r0, r1, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222BA5C

	thumb_func_start ov80_0222BA7C
ov80_0222BA7C: @ 0x0222BA7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl FUN_02030FA0
	ldrh r0, [r4, #0x18]
	ldr r1, _0222BAAC @ =0x00000426
	strh r0, [r4, r1]
	adds r0, r1, #2
	ldrh r2, [r4, #0x1a]
	subs r1, r1, #2
	adds r1, r4, r1
	strh r2, [r4, r0]
	movs r0, #0x41
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222BAA6
	movs r0, #1
	pop {r4, pc}
_0222BAA6:
	movs r0, #0
	pop {r4, pc}
	nop
_0222BAAC: .4byte 0x00000426
	thumb_func_end ov80_0222BA7C

	thumb_func_start ov80_0222BAB0
ov80_0222BAB0: @ 0x0222BAB0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0222BAD8 @ =0x00000A7C
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222BAD4
	ldrh r1, [r5, #2]
	ldr r0, _0222BADC @ =0x00000A78
	strh r1, [r4, r0]
	ldrh r1, [r5, #4]
	subs r0, r0, #2
	strh r1, [r4, r0]
_0222BAD4:
	pop {r4, r5, r6, pc}
	nop
_0222BAD8: .4byte 0x00000A7C
_0222BADC: .4byte 0x00000A78
	thumb_func_end ov80_0222BAB0

	thumb_func_start ov80_0222BAE0
ov80_0222BAE0: @ 0x0222BAE0
	push {r4, lr}
	adds r1, r0, #0
	ldr r2, _0222BB14 @ =0x00000424
	movs r3, #0
	adds r4, r1, #0
_0222BAEA:
	adds r0, r4, #0
	adds r0, #0x78
	ldrh r0, [r0]
	adds r3, r3, #1
	strh r0, [r4, r2]
	adds r4, r4, #2
	cmp r3, #0xe
	blt _0222BAEA
	ldr r2, _0222BB14 @ =0x00000424
	movs r0, #0x42
	adds r1, r1, r2
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222BB0E
	movs r0, #1
	pop {r4, pc}
_0222BB0E:
	movs r0, #0
	pop {r4, pc}
	nop
_0222BB14: .4byte 0x00000424
	thumb_func_end ov80_0222BAE0

	thumb_func_start ov80_0222BB18
ov80_0222BB18: @ 0x0222BB18
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0222BB50 @ =0x00000A7C
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222BB4C
	bl FUN_0203769C
	cmp r0, #0
	beq _0222BB4C
	movs r2, #0
_0222BB3A:
	ldrh r1, [r5]
	adds r0, r4, #0
	adds r0, #0x78
	adds r2, r2, #1
	strh r1, [r0]
	adds r5, r5, #2
	adds r4, r4, #2
	cmp r2, #0xe
	blt _0222BB3A
_0222BB4C:
	pop {r4, r5, r6, pc}
	nop
_0222BB50: .4byte 0x00000A7C
	thumb_func_end ov80_0222BB18

	thumb_func_start ov80_0222BB54
ov80_0222BB54: @ 0x0222BB54
	push {r3, r4, r5, r6, r7, lr}
	adds r3, r0, #0
	movs r0, #0xc5
	ldr r1, _0222BBC8 @ =0x00000424
	movs r4, #0
	adds r5, r3, #0
	lsls r0, r0, #2
_0222BB62:
	ldrh r2, [r5, r0]
	adds r4, r4, #1
	strh r2, [r5, r1]
	adds r5, r5, #2
	cmp r4, #4
	blt _0222BB62
	movs r0, #0xc7
	ldr r1, _0222BBCC @ =0x0000042C
	movs r5, #0
	adds r4, r3, #0
	lsls r0, r0, #2
_0222BB78:
	adds r2, r3, r5
	ldrb r2, [r2, r0]
	adds r5, r5, #1
	strh r2, [r4, r1]
	adds r4, r4, #2
	cmp r5, #4
	blt _0222BB78
	ldr r7, _0222BBC8 @ =0x00000424
	adds r1, r3, #0
	movs r5, #0x32
	adds r6, r7, #0
	movs r2, #0
	adds r0, r3, #0
	adds r1, #0x10
	lsls r5, r5, #4
	adds r6, #8
_0222BB98:
	movs r4, #0x32
	lsls r4, r4, #4
	ldr r4, [r0, r4]
	adds r2, r2, #1
	strh r4, [r1, r7]
	ldr r4, [r0, r5]
	adds r0, r0, #4
	lsrs r4, r4, #0x10
	strh r4, [r1, r6]
	adds r1, r1, #2
	cmp r2, #4
	blt _0222BB98
	ldr r1, _0222BBC8 @ =0x00000424
	movs r0, #0x43
	adds r1, r3, r1
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222BBC4
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222BBC4:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222BBC8: .4byte 0x00000424
_0222BBCC: .4byte 0x0000042C
	thumb_func_end ov80_0222BB54

	thumb_func_start ov80_0222BBD0
ov80_0222BBD0: @ 0x0222BBD0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0222BC44 @ =0x00000A7C
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r5, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r6, r0
	beq _0222BC42
	bl FUN_0203769C
	cmp r0, #0
	beq _0222BC42
	movs r0, #0xc5
	movs r2, #0
	adds r3, r5, #0
	adds r6, r4, #0
	lsls r0, r0, #2
_0222BBFA:
	ldrh r1, [r3]
	adds r2, r2, #1
	adds r3, r3, #2
	strh r1, [r6, r0]
	adds r6, r6, #2
	cmp r2, #4
	blt _0222BBFA
	movs r0, #0xc7
	movs r6, #0
	adds r3, r5, #0
	lsls r0, r0, #2
_0222BC10:
	ldrh r2, [r3, #8]
	adds r1, r4, r6
	adds r6, r6, #1
	adds r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #4
	blt _0222BC10
	movs r2, #0x32
	lsls r2, r2, #4
	movs r1, #0
	adds r5, #0x10
	adds r3, r2, #0
	adds r6, r2, #0
_0222BC2A:
	ldrh r0, [r5]
	adds r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #8]
	ldr r0, [r4, r3]
	adds r5, r5, #2
	lsls r7, r7, #0x10
	orrs r0, r7
	str r0, [r4, r6]
	adds r4, r4, #4
	cmp r1, #4
	blt _0222BC2A
_0222BC42:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222BC44: .4byte 0x00000A7C
	thumb_func_end ov80_0222BBD0

	thumb_func_start ov80_0222BC48
ov80_0222BC48: @ 0x0222BC48
	push {r3, lr}
	ldr r2, _0222BC68 @ =0x00000424
	adds r3, r0, #0
	strh r1, [r3, r2]
	adds r1, r3, r2
	movs r0, #0x44
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222BC62
	movs r0, #1
	pop {r3, pc}
_0222BC62:
	movs r0, #0
	pop {r3, pc}
	nop
_0222BC68: .4byte 0x00000424
	thumb_func_end ov80_0222BC48

	thumb_func_start ov80_0222BC6C
ov80_0222BC6C: @ 0x0222BC6C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222BC8C @ =0x00000A7C
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222BC8A
	ldrh r1, [r6]
	ldr r0, _0222BC90 @ =0x00000A74
	strb r1, [r4, r0]
_0222BC8A:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222BC8C: .4byte 0x00000A7C
_0222BC90: .4byte 0x00000A74
	thumb_func_end ov80_0222BC6C

	thumb_func_start ov80_0222BC94
ov80_0222BC94: @ 0x0222BC94
	push {r3, lr}
	ldr r2, _0222BCB4 @ =0x00000424
	adds r3, r0, #0
	strh r1, [r3, r2]
	adds r1, r3, r2
	movs r0, #0x45
	movs r2, #0x28
	bl FUN_02037030
	cmp r0, #1
	bne _0222BCAE
	movs r0, #1
	pop {r3, pc}
_0222BCAE:
	movs r0, #0
	pop {r3, pc}
	nop
_0222BCB4: .4byte 0x00000424
	thumb_func_end ov80_0222BC94

	thumb_func_start ov80_0222BCB8
ov80_0222BCB8: @ 0x0222BCB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222BCD8 @ =0x00000A7C
	adds r4, r3, #0
	ldrb r1, [r4, r0]
	adds r6, r2, #0
	adds r1, r1, #1
	strb r1, [r4, r0]
	bl FUN_0203769C
	cmp r5, r0
	beq _0222BCD6
	ldrh r1, [r6]
	ldr r0, _0222BCDC @ =0x00000A75
	strb r1, [r4, r0]
_0222BCD6:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222BCD8: .4byte 0x00000A7C
_0222BCDC: .4byte 0x00000A75
	thumb_func_end ov80_0222BCB8

	thumb_func_start ov80_0222BCE0
ov80_0222BCE0: @ 0x0222BCE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldrb r0, [r7, #0x10]
	movs r1, #0
	bl ov80_022380E8
	str r0, [sp]
	bl FUN_0206DD28
	adds r6, r0, #0
	ldr r0, [sp]
	movs r4, #0
	cmp r0, #0
	ble _0222BD22
	ldr r0, _0222BD40 @ =0x00000474
	adds r5, r4, #0
	adds r0, r7, r0
	str r0, [sp, #4]
_0222BD06:
	ldr r0, [r7, #0x70]
	adds r1, r4, #0
	bl FUN_02074644
	ldr r1, [sp, #4]
	adds r2, r6, #0
	adds r1, r1, r5
	blx FUN_020D4A50
	ldr r0, [sp]
	adds r4, r4, #1
	adds r5, r5, r6
	cmp r4, r0
	blt _0222BD06
_0222BD22:
	ldr r1, _0222BD40 @ =0x00000474
	movs r2, #2
	movs r0, #0x46
	adds r1, r7, r1
	lsls r2, r2, #8
	bl FUN_02036FD8
	cmp r0, #1
	bne _0222BD3A
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222BD3A:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222BD40: .4byte 0x00000474
	thumb_func_end ov80_0222BCE0

	thumb_func_start ov80_0222BD44
ov80_0222BD44: @ 0x0222BD44
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0222BDD0 @ =0x00000A7C
	adds r4, r0, #0
	adds r0, r3, #0
	ldrb r0, [r0, r1]
	str r2, [sp]
	str r3, [sp, #4]
	adds r2, r0, #1
	adds r0, r3, #0
	strb r2, [r0, r1]
	bl FUN_0203769C
	cmp r4, r0
	beq _0222BDCC
	ldr r0, [sp, #4]
	movs r1, #0
	ldrb r0, [r0, #0x10]
	bl ov80_022380E8
	str r0, [sp, #8]
	bl FUN_0206DD28
	adds r5, r0, #0
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	ldr r0, [sp, #8]
	movs r7, #0
	cmp r0, #0
	ble _0222BDA6
	adds r4, r7, #0
_0222BD86:
	ldr r0, [sp]
	adds r1, r6, #0
	adds r0, r0, r4
	adds r2, r5, #0
	blx FUN_020D4A50
	ldr r0, [sp, #4]
	adds r1, r6, #0
	ldr r0, [r0, #0x70]
	bl FUN_02074524
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r4, r4, r5
	cmp r7, r0
	blt _0222BD86
_0222BDA6:
	adds r0, r6, #0
	bl FUN_0201AB0C
	bl FUN_0203769C
	cmp r0, #0
	beq _0222BDCC
	ldr r0, [sp, #4]
	movs r1, #0
	ldr r0, [r0, #0x70]
	movs r2, #2
	bl FUN_020747BC
	ldr r0, [sp, #4]
	movs r1, #1
	ldr r0, [r0, #0x70]
	movs r2, #3
	bl FUN_020747BC
_0222BDCC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222BDD0: .4byte 0x00000A7C
	thumb_func_end ov80_0222BD44

	thumb_func_start ov80_0222BDD4
ov80_0222BDD4: @ 0x0222BDD4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	lsls r0, r0, #8
	adds r4, r1, #0
	cmp r2, r0
	ble _0222BDE6
	bl GF_AssertFail
_0222BDE6:
	ldr r0, _0222BDF0 @ =0x00000674
	adds r1, r4, r0
	lsls r0, r5, #9
	adds r0, r1, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222BDF0: .4byte 0x00000674
	thumb_func_end ov80_0222BDD4

	thumb_func_start ov80_0222BDF4
ov80_0222BDF4: @ 0x0222BDF4
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE24
	adds r4, r0, #0
	bne _0222BE0C
	bl GF_AssertFail
_0222BE0C:
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov80_0222BDF4

	thumb_func_start ov80_0222BE10
ov80_0222BE10: @ 0x0222BE10
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE9C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222BE10

	thumb_func_start ov80_0222BE24
ov80_0222BE24: @ 0x0222BE24
	push {r3, lr}
	movs r3, #2
	lsls r3, r3, #0xe
	cmp r1, r3
	bhs _0222BE32
	movs r0, #0
	pop {r3, pc}
_0222BE32:
	adds r2, r3, #0
	adds r2, #8
	cmp r1, r2
	bhs _0222BE44
	subs r1, r1, r3
	adds r0, #8
	lsls r1, r1, #1
	adds r0, r0, r1
	pop {r3, pc}
_0222BE44:
	adds r2, r3, #0
	adds r2, #0x10
	cmp r1, r2
	bhs _0222BE58
	adds r3, #8
	ldr r0, [r0]
	subs r1, r1, r3
	bl ov80_0222AB2C
	pop {r3, pc}
_0222BE58:
	adds r2, r3, #0
	adds r2, #0x14
	cmp r1, r2
	bhs _0222BE6C
	adds r3, #0x10
	subs r1, r1, r3
	adds r0, #0x78
	lsls r1, r1, #1
	adds r0, r0, r1
	pop {r3, pc}
_0222BE6C:
	ldr r0, _0222BE94 @ =0x0000FD13
	cmp r1, r0
	bne _0222BE76
	movs r0, #0
	pop {r3, pc}
_0222BE76:
	ldr r0, _0222BE98 @ =0x0000EEEE
	cmp r1, r0
	bne _0222BE80
	movs r0, #0
	pop {r3, pc}
_0222BE80:
	adds r0, r0, #1
	cmp r1, r0
	bne _0222BE8A
	movs r0, #0
	pop {r3, pc}
_0222BE8A:
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	nop
_0222BE94: .4byte 0x0000FD13
_0222BE98: .4byte 0x0000EEEE
	thumb_func_end ov80_0222BE24

	thumb_func_start ov80_0222BE9C
ov80_0222BE9C: @ 0x0222BE9C
	push {r4, lr}
	adds r4, r1, #0
	bl ov80_0222BE24
	cmp r0, #0
	beq _0222BEAA
	ldrh r4, [r0]
_0222BEAA:
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222BE9C

	thumb_func_start ov80_0222BEB0
ov80_0222BEB0: @ 0x0222BEB0
	movs r0, #0
	bx lr
	thumb_func_end ov80_0222BEB0

	thumb_func_start ov80_0222BEB4
ov80_0222BEB4: @ 0x0222BEB4
	push {r3, lr}
	bl ov80_0222AB90
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222BEB4

	thumb_func_start ov80_0222BEC0
ov80_0222BEC0: @ 0x0222BEC0
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AB90
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209684C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222BEC0

	thumb_func_start ov80_0222BED4
ov80_0222BED4: @ 0x0222BED4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222BE10
	adds r1, r0, #0
	ldr r0, [r4]
	ldr r2, _0222BEF4 @ =0x0000FFFF
	bl FUN_02096854
	ldr r1, _0222BEF8 @ =ov80_0222BEFC
	adds r0, r5, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222BEF4: .4byte 0x0000FFFF
_0222BEF8: .4byte ov80_0222BEFC
	thumb_func_end ov80_0222BED4

	thumb_func_start ov80_0222BEFC
ov80_0222BEFC: @ 0x0222BEFC
	movs r0, #1
	bx lr
	thumb_func_end ov80_0222BEFC

	thumb_func_start ov80_0222BF00
ov80_0222BF00: @ 0x0222BF00
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r2, r0, #0
	ldr r0, [r4]
	adds r1, r6, #0
	bl FUN_02096854
	adds r0, r5, #0
	bl ov80_0222AB90
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0222BF00

	thumb_func_start ov80_0222BF28
ov80_0222BF28: @ 0x0222BF28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov80_0222BE24
	strh r4, [r0]
	adds r0, r5, #0
	adds r0, #0x78
	strh r6, [r0]
	ldr r1, _0222BF58 @ =ov80_0222BF5C
	adds r0, r5, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_0222BF58: .4byte ov80_0222BF5C
	thumb_func_end ov80_0222BF28

	thumb_func_start ov80_0222BF5C
ov80_0222BF5C: @ 0x0222BF5C
	push {r3, lr}
	adds r1, r0, #0
	adds r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE24
	ldrh r1, [r0]
	subs r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	bne _0222BF78
	movs r0, #1
	pop {r3, pc}
_0222BF78:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222BF5C

	thumb_func_start ov80_0222BF7C
ov80_0222BF7C: @ 0x0222BF7C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222BF7C

	thumb_func_start ov80_0222BF94
ov80_0222BF94: @ 0x0222BF94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222BF94

	thumb_func_start ov80_0222BFAC
ov80_0222BFAC: @ 0x0222BFAC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	ldrh r1, [r4]
	adds r0, r1, r0
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222BFAC

	thumb_func_start ov80_0222BFC8
ov80_0222BFC8: @ 0x0222BFC8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	ldrh r1, [r4]
	subs r0, r1, r0
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222BFC8

	thumb_func_start ov80_0222BFE4
ov80_0222BFE4: @ 0x0222BFE4
	cmp r0, r1
	bhs _0222BFEC
	movs r0, #0
	bx lr
_0222BFEC:
	cmp r0, r1
	bne _0222BFF4
	movs r0, #1
	bx lr
_0222BFF4:
	movs r0, #2
	bx lr
	thumb_func_end ov80_0222BFE4

	thumb_func_start ov80_0222BFF8
ov80_0222BFF8: @ 0x0222BFF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov80_0222BFE4
	adds r5, #0x8c
	strb r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222BFF8

	thumb_func_start ov80_0222C018
ov80_0222C018: @ 0x0222C018
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r1, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r1]
	bl ov80_0222BFE4
	adds r5, #0x8c
	strb r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222C018

	thumb_func_start ov80_0222C03C
ov80_0222C03C: @ 0x0222C03C
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov80_0222C03C

	thumb_func_start ov80_0222C040
ov80_0222C040: @ 0x0222C040
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC70
	adds r2, r0, #0
	ldr r1, [r4, #0x1c]
	adds r0, r4, #0
	adds r1, r1, r2
	bl ov80_0222C03C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222C040

	thumb_func_start ov80_0222C058
ov80_0222C058: @ 0x0222C058
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222AC70
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r4, r4, r0
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r3, _0222C08C @ =0x0223B9D8
	ldrb r2, [r0]
	adds r0, r3, r4
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0222C088
	ldr r2, [r5, #0x1c]
	adds r0, r5, #0
	adds r1, r2, r1
	bl ov80_0222C03C
_0222C088:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222C08C: .4byte 0x0223B9D8
	thumb_func_end ov80_0222C058

	thumb_func_start ov80_0222C090
ov80_0222C090: @ 0x0222C090
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC70
	adds r2, r0, #0
	ldr r1, [r4, #0x1c]
	adds r0, r4, #0
	adds r1, r1, r2
	bl ov80_0222AC3C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222C090

	thumb_func_start ov80_0222C0A8
ov80_0222C0A8: @ 0x0222C0A8
	push {r3, lr}
	bl ov80_0222AC4C
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222C0A8

	thumb_func_start ov80_0222C0B4
ov80_0222C0B4: @ 0x0222C0B4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222AC70
	adds r1, r0, #0
	lsls r0, r4, #1
	adds r4, r4, r0
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r3, _0222C0E8 @ =0x0223B9D8
	ldrb r2, [r0]
	adds r0, r3, r4
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0222C0E4
	ldr r2, [r5, #0x1c]
	adds r0, r5, #0
	adds r1, r2, r1
	bl ov80_0222AC3C
_0222C0E4:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222C0E8: .4byte 0x0223B9D8
	thumb_func_end ov80_0222C0B4

	thumb_func_start ov80_0222C0EC
ov80_0222C0EC: @ 0x0222C0EC
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r2, r0, #0
	movs r3, #0
	add r0, sp, #4
	strb r3, [r0]
	strb r3, [r0, #1]
	movs r1, #1
	strb r1, [r0, #2]
	strb r3, [r0, #3]
	add r0, sp, #4
	str r0, [sp]
	ldr r0, [r4]
	adds r4, #0x80
	ldr r1, [r4]
	bl ov80_0222E268
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222C0EC

	thumb_func_start ov80_0222C11C
ov80_0222C11C: @ 0x0222C11C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov80_0222AC58
	movs r3, #0
	adds r1, r4, #0
	str r3, [sp]
	adds r1, #0x80
	adds r2, r0, #0
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_0222E268
	ldr r1, _0222C148 @ =ov80_0222C17C
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_0222C148: .4byte ov80_0222C17C
	thumb_func_end ov80_0222C11C

	thumb_func_start ov80_0222C14C
ov80_0222C14C: @ 0x0222C14C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r2, r0, #0
	movs r0, #0
	adds r1, r4, #0
	str r0, [sp]
	adds r1, #0x80
	ldr r0, [r4]
	ldr r1, [r1]
	movs r3, #1
	bl ov80_0222E268
	ldr r1, _0222C178 @ =ov80_0222C17C
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0222C178: .4byte ov80_0222C17C
	thumb_func_end ov80_0222C14C

	thumb_func_start ov80_0222C17C
ov80_0222C17C: @ 0x0222C17C
	push {r3, lr}
	ldr r0, [r0]
	adds r0, #0x50
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _0222C196
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #1
	pop {r3, pc}
_0222C196:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222C17C

	thumb_func_start ov80_0222C19C
ov80_0222C19C: @ 0x0222C19C
	push {r3, lr}
	ldr r0, [r0]
	bl ov80_0222E38C
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222C19C

	thumb_func_start ov80_0222C1A8
ov80_0222C1A8: @ 0x0222C1A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	str r4, [sp]
	adds r3, r0, #0
	str r6, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r7, #0
	bl FUN_0200FA24
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222C1A8

	thumb_func_start ov80_0222C1F0
ov80_0222C1F0: @ 0x0222C1F0
	push {r3, lr}
	ldr r1, _0222C1FC @ =ov80_0222C200
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222C1FC: .4byte ov80_0222C200
	thumb_func_end ov80_0222C1F0

	thumb_func_start ov80_0222C200
ov80_0222C200: @ 0x0222C200
	push {r3, lr}
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0222C20E
	movs r0, #1
	pop {r3, pc}
_0222C20E:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222C200

	thumb_func_start ov80_0222C214
ov80_0222C214: @ 0x0222C214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	adds r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	adds r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	adds r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	adds r3, r7, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	bl ov80_0222E558
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	adds r5, #0x78
	strh r0, [r5]
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222C214

	thumb_func_start ov80_0222C270
ov80_0222C270: @ 0x0222C270
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	adds r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	adds r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	adds r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	adds r3, r7, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	bl ov80_0222E558
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	adds r5, #0x78
	strh r0, [r5]
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222C270

	thumb_func_start ov80_0222C2D0
ov80_0222C2D0: @ 0x0222C2D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r3, r0, #0
	ldr r0, [r4, #0x60]
	adds r1, r6, #0
	movs r2, #0xff
	bl ov80_0222E5A8
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0222C2D0

	thumb_func_start ov80_0222C2F4
ov80_0222C2F4: @ 0x0222C2F4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r3, r0, #0
	ldr r0, [r4, #0x60]
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_0222E5A8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222C2F4

	thumb_func_start ov80_0222C320
ov80_0222C320: @ 0x0222C320
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x60]
	bl ov80_0222E5B0
	ldr r1, _0222C338 @ =ov80_0222C33C
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0222C338: .4byte ov80_0222C33C
	thumb_func_end ov80_0222C320

	thumb_func_start ov80_0222C33C
ov80_0222C33C: @ 0x0222C33C
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0x78
	ldrh r1, [r1]
	ldr r4, [r0]
	bl ov80_0222BE24
	ldr r1, [r4, #0x60]
	cmp r1, #0
	beq _0222C354
	movs r0, #0
	pop {r4, pc}
_0222C354:
	ldrh r1, [r0]
	ldr r0, _0222C364 @ =0x0000EEEE
	cmp r1, r0
	beq _0222C360
	movs r0, #1
	pop {r4, pc}
_0222C360:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222C364: .4byte 0x0000EEEE
	thumb_func_end ov80_0222C33C

	thumb_func_start ov80_0222C368
ov80_0222C368: @ 0x0222C368
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	adds r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	adds r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	adds r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	adds r3, r7, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	bl ov80_0222E920
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	adds r5, #0x78
	strh r0, [r5]
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222C368

	thumb_func_start ov80_0222C3C4
ov80_0222C3C4: @ 0x0222C3C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	adds r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	adds r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	adds r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	adds r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	adds r3, r7, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	bl ov80_0222E920
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	adds r5, #0x78
	strh r0, [r5]
	movs r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222C3C4

	thumb_func_start ov80_0222C424
ov80_0222C424: @ 0x0222C424
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r3, r0, #0
	ldr r0, [r4, #0x60]
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_0222E940
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222C424

	thumb_func_start ov80_0222C450
ov80_0222C450: @ 0x0222C450
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x60]
	bl ov80_0222E948
	ldr r1, _0222C468 @ =ov80_0222C33C
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0222C468: .4byte ov80_0222C33C
	thumb_func_end ov80_0222C450

	thumb_func_start ov80_0222C46C
ov80_0222C46C: @ 0x0222C46C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x60]
	bl ov80_0222EEAC
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222C46C

	thumb_func_start ov80_0222C47C
ov80_0222C47C: @ 0x0222C47C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, [r5]
	adds r0, r4, #0
	bl ov80_0222AB34
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	ldr r1, [r5, #0x1c]
	adds r7, r0, #0
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r0, [r1]
	ldr r1, _0222C4C4 @ =0x0223B9D0
	ldr r2, _0222C4C8 @ =0x000003D9
	str r0, [sp]
	ldr r0, [r4, #0x34]
	movs r3, #0xc
	str r0, [sp, #4]
	ldr r0, [r6]
	bl FUN_02001F20
	str r0, [r4, #0x74]
	adds r0, r5, #0
	adds r0, #0x78
	strh r7, [r0]
	ldr r1, _0222C4CC @ =ov80_0222C4D0
	adds r0, r5, #0
	bl ov80_0222AB84
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C4C4: .4byte 0x0223B9D0
_0222C4C8: .4byte 0x000003D9
_0222C4CC: .4byte ov80_0222C4D0
	thumb_func_end ov80_0222C47C

	thumb_func_start ov80_0222C4D0
ov80_0222C4D0: @ 0x0222C4D0
	push {r4, r5, r6, lr}
	adds r1, r0, #0
	adds r1, #0x78
	ldrh r1, [r1]
	ldr r4, [r0]
	bl ov80_0222BE24
	adds r5, r0, #0
	ldr r0, [r4, #0x74]
	ldr r1, [r4, #0x34]
	bl FUN_02001FDC
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _0222C516
	bl FUN_02025358
	cmp r0, #1
	bne _0222C512
	ldr r0, _0222C528 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x74]
	bl FUN_02001C94
	adds r6, r0, #0
	ldr r0, [r4, #0x74]
	ldr r1, [r4, #0x34]
	bl FUN_02001FFC
	b _0222C516
_0222C512:
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222C516:
	cmp r6, #0
	bne _0222C51E
	movs r0, #0
	b _0222C520
_0222C51E:
	movs r0, #1
_0222C520:
	strh r0, [r5]
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_0222C528: .4byte 0x000005DC
	thumb_func_end ov80_0222C4D0

	thumb_func_start ov80_0222C52C
ov80_0222C52C: @ 0x0222C52C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, r0, #0
	ldr r0, [sp]
	bl ov80_0222AC70
	ldr r1, [sp]
	ldr r1, [r1, #0x1c]
	str r1, [sp, #4]
	adds r1, r1, r0
	ldr r0, [sp]
	str r1, [r0, #0x1c]
_0222C550:
	ldr r0, [sp]
	bl ov80_0222BE10
	add r1, sp, #0xc
	strh r0, [r1]
	ldrh r2, [r1]
	ldr r0, _0222C5E4 @ =0x0000FD13
	cmp r2, r0
	beq _0222C5D8
	ldr r0, [sp]
	ldr r3, [r0, #0x1c]
	adds r2, r3, #1
	str r2, [r0, #0x1c]
	ldrb r0, [r3]
	strb r0, [r1, #2]
	ldrh r1, [r1]
	ldr r0, _0222C5E8 @ =0x0000EEEE
	cmp r1, r0
	bne _0222C596
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_02028E9C
	bl ov80_0222A7EC
	add r1, sp, #0xc
	strh r0, [r1]
	adds r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	b _0222C550
_0222C596:
	adds r0, r0, #1
	cmp r1, r0
	bne _0222C5CE
	bl FUN_02037474
	cmp r0, #1
	bne _0222C550
	bl FUN_02037454
	adds r6, r0, #0
	movs r5, #0
	cmp r6, #0
	ble _0222C550
	add r7, sp, #0xc
_0222C5B2:
	adds r0, r5, #0
	bl FUN_02034818
	bl ov80_0222A7EC
	strh r0, [r7]
	adds r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	adds r5, r5, #1
	cmp r5, r6
	blt _0222C5B2
	b _0222C550
_0222C5CE:
	adds r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	b _0222C550
_0222C5D8:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	str r1, [r0, #0x1c]
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C5E4: .4byte 0x0000FD13
_0222C5E8: .4byte 0x0000EEEE
	thumb_func_end ov80_0222C52C

	thumb_func_start ov80_0222C5EC
ov80_0222C5EC: @ 0x0222C5EC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov80_022394D8
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C5EC

	thumb_func_start ov80_0222C60C
ov80_0222C60C: @ 0x0222C60C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r0, [r5]
	str r0, [sp, #8]
	ldr r0, [r0]
	bl FUN_0209680C
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov80_0222AC70
	ldr r1, [r5, #0x1c]
	adds r4, r5, #0
	adds r0, r1, r0
	str r1, [sp]
	str r0, [r5, #0x1c]
	adds r4, #0x1c
	add r6, sp, #0xc
_0222C632:
	movs r7, #0
	adds r0, r5, #0
	mvns r7, r7
	bl ov80_0222BE10
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	ldr r0, _0222C6DC @ =0x0000FD13
	cmp r1, r0
	beq _0222C6D0
	adds r0, r5, #0
	bl ov80_0222BE10
	strh r0, [r6]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	adds r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xa]
	adds r0, r5, #0
	bl ov80_0222AC58
	subs r0, #8
	strh r0, [r6, #6]
	adds r0, r5, #0
	bl ov80_0222AC58
	subs r0, #0x10
	strh r0, [r6, #8]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	adds r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xb]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	adds r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xc]
	movs r0, #0
	strh r0, [r6, #2]
	ldrh r1, [r6]
	ldr r0, _0222C6E0 @ =0x0000EEEE
	cmp r1, r0
	bne _0222C6AA
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_02028E9C
	bl ov80_0222A7EC
	strh r0, [r6]
	movs r7, #0x1f
	b _0222C6C4
_0222C6AA:
	adds r0, r0, #1
	cmp r1, r0
	bne _0222C6C4
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	adds r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	bl FUN_02034818
	bl ov80_0222A7EC
	strh r0, [r6]
_0222C6C4:
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	adds r2, r7, #0
	bl ov80_02239510
	b _0222C632
_0222C6D0:
	ldr r0, [sp]
	str r0, [r5, #0x1c]
	movs r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0222C6DC: .4byte 0x0000FD13
_0222C6E0: .4byte 0x0000EEEE
	thumb_func_end ov80_0222C60C

	thumb_func_start ov80_0222C6E4
ov80_0222C6E4: @ 0x0222C6E4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r1, r0, #0
	ldr r0, [r5, #0x14]
	bl FUN_02228110
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov80_02239590
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C6E4

	thumb_func_start ov80_0222C70C
ov80_0222C70C: @ 0x0222C70C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	ldr r2, [r5, #0x1c]
	adds r1, r0, #0
	adds r0, r2, #1
	str r0, [r5, #0x1c]
	ldrb r5, [r2]
	movs r2, #0
	adds r0, r4, #0
	str r2, [sp]
	add r3, sp, #0
	bl ov80_022395E8
	ldr r0, [sp]
	cmp r0, #0
	bne _0222C740
	bl GF_AssertFail
_0222C740:
	ldr r0, [sp]
	adds r1, r5, #0
	bl FUN_02229200
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C70C

	thumb_func_start ov80_0222C74C
ov80_0222C74C: @ 0x0222C74C
	movs r0, #0
	bx lr
	thumb_func_end ov80_0222C74C

	thumb_func_start ov80_0222C750
ov80_0222C750: @ 0x0222C750
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl FUN_0209680C
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC70
	adds r6, r0, #0
	ldr r0, [r4]
	adds r1, r7, #0
	bl ov80_02239938
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222C782
	bl GF_AssertFail
_0222C782:
	adds r0, r4, #0
	adds r0, #0x59
	str r0, [sp]
	ldr r0, [r4, #0x34]
	ldr r3, [sp, #0xc]
	str r0, [sp, #4]
	ldr r2, [r5, #0x1c]
	ldr r1, [sp, #8]
	ldr r3, [r3, #0x30]
	adds r0, r7, #0
	adds r2, r2, r6
	bl ov80_0222C7B0
	adds r0, r4, #0
	adds r0, #0x59
	ldrb r0, [r0]
	adds r4, #0x59
	adds r0, r0, #1
	strb r0, [r4]
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222C750

	thumb_func_start ov80_0222C7B0
ov80_0222C7B0: @ 0x0222C7B0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x1c]
	movs r1, #0x18
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x18
	blx FUN_020D4994
	str r5, [r4, #0x14]
	ldr r0, [sp]
	str r7, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x18]
	strh r6, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #0x38]
	cmp r0, #0
	beq _0222C7E4
	bl GF_AssertFail
_0222C7E4:
	ldr r0, _0222C7F4 @ =ov80_0222EEC8
	ldr r2, _0222C7F8 @ =0x0000EAC4
	adds r1, r4, #0
	bl FUN_0200E320
	str r0, [r5, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C7F4: .4byte ov80_0222EEC8
_0222C7F8: .4byte 0x0000EAC4
	thumb_func_end ov80_0222C7B0

	thumb_func_start ov80_0222C7FC
ov80_0222C7FC: @ 0x0222C7FC
	push {r3, lr}
	ldr r1, _0222C808 @ =ov80_0222C80C
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222C808: .4byte ov80_0222C80C
	thumb_func_end ov80_0222C7FC

	thumb_func_start ov80_0222C80C
ov80_0222C80C: @ 0x0222C80C
	ldr r0, [r0]
	adds r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222C81A
	movs r0, #1
	bx lr
_0222C81A:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222C80C

	thumb_func_start ov80_0222C820
ov80_0222C820: @ 0x0222C820
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, [r6]
	ldr r0, [r4]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, r6, #0
	bl ov80_0222AC70
	ldr r1, [r6, #0x1c]
	adds r0, r1, r0
	str r0, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r1, [r4, #0x34]
	movs r0, #0xb8
	bl FUN_02007688
	adds r7, r0, #0
_0222C848:
	adds r0, r6, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, _0222C880 @ =0x0000FD13
	cmp r4, r0
	beq _0222C86E
	str r4, [sp]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r3, [r5, #4]
	adds r2, r7, #0
	bl ov80_02239AF8
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov80_0223962C
	b _0222C848
_0222C86E:
	adds r0, r7, #0
	bl FUN_0200770C
	ldr r0, [sp, #4]
	str r0, [r6, #0x1c]
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C880: .4byte 0x0000FD13
	thumb_func_end ov80_0222C820

	thumb_func_start ov80_0222C884
ov80_0222C884: @ 0x0222C884
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r5, r0, #0
	ldr r0, [r4, #0x38]
	adds r1, r5, #0
	bl ov80_02239B7C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov80_0223965C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222C884

	thumb_func_start ov80_0222C8B0
ov80_0222C8B0: @ 0x0222C8B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC70
	ldr r1, [r5, #0x1c]
	adds r4, r5, #0
	adds r0, r1, r0
	str r1, [sp]
	str r0, [r5, #0x1c]
	adds r4, #0x1c
_0222C8D2:
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	ldr r0, _0222C948 @ =0x0000FD13
	cmp r7, r0
	beq _0222C93E
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x14]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	adds r2, r0, #1
	str r2, [r4]
	ldrb r0, [r1]
	str r0, [sp, #8]
	adds r0, r2, #1
	ldr r1, [r5, #0x1c]
	adds r2, r7, #0
	str r0, [r4]
	ldrb r0, [r1]
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	adds r0, r6, #0
	bl ov80_0223968C
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	adds r7, r0, #0
	bl FUN_0200DDB8
	ldr r1, [sp, #0x14]
	adds r0, r7, #0
	bl FUN_0200DCE8
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r0, r6, #0
	bl ov80_02239708
	b _0222C8D2
_0222C93E:
	ldr r0, [sp]
	str r0, [r5, #0x1c]
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C948: .4byte 0x0000FD13
	thumb_func_end ov80_0222C8B0

	thumb_func_start ov80_0222C94C
ov80_0222C94C: @ 0x0222C94C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov80_022396D8
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C94C

	thumb_func_start ov80_0222C96C
ov80_0222C96C: @ 0x0222C96C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	ldr r2, [r5, #0x1c]
	adds r1, r0, #0
	adds r0, r2, #1
	str r0, [r5, #0x1c]
	adds r0, r4, #0
	ldrb r5, [r2]
	bl ov80_02239700
	adds r4, r0, #0
	bne _0222C998
	bl GF_AssertFail
_0222C998:
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_0200DCE8
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C96C

	thumb_func_start ov80_0222C9A4
ov80_0222C9A4: @ 0x0222C9A4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov80_02239700
	adds r4, r0, #0
	bne _0222C9C8
	bl GF_AssertFail
_0222C9C8:
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0200E0B8
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C9A4

	thumb_func_start ov80_0222C9D4
ov80_0222C9D4: @ 0x0222C9D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_02239700
	adds r4, r0, #0
	bne _0222CA02
	bl GF_AssertFail
_0222CA02:
	cmp r5, #0
	ldr r0, [r4]
	bne _0222CA10
	movs r1, #0
	bl FUN_0200E0F4
	b _0222CA16
_0222CA10:
	movs r1, #1
	bl FUN_0200E0F4
_0222CA16:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0222C9D4

	thumb_func_start ov80_0222CA1C
ov80_0222CA1C: @ 0x0222CA1C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl ov80_0222BE10
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r1, r5, #0
	adds r4, r0, #0
	bl ov80_02239700
	adds r1, r6, #0
	bl FUN_0200DC4C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl ov80_02239708
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0222CA1C

	thumb_func_start ov80_0222CA54
ov80_0222CA54: @ 0x0222CA54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r1, r4, #0
	movs r2, #0
	bl ov80_02239708
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222CA54

	thumb_func_start ov80_0222CA74
ov80_0222CA74: @ 0x0222CA74
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222BE10
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _0222CA90 @ =ov80_0222CA94
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_0222CA90: .4byte ov80_0222CA94
	thumb_func_end ov80_0222CA74

	thumb_func_start ov80_0222CA94
ov80_0222CA94: @ 0x0222CA94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r1, r5, #0
	adds r1, #0x78
	ldrh r1, [r1]
	adds r4, r0, #0
	bl ov80_02239700
	adds r5, #0x78
	adds r6, r0, #0
	ldrh r1, [r5]
	adds r0, r4, #0
	bl ov80_02239734
	cmp r0, #0
	beq _0222CAC6
	adds r0, r6, #0
	bl FUN_0200DCA0
	cmp r0, #0
	bne _0222CACA
_0222CAC6:
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222CACA:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0222CA94

	thumb_func_start ov80_0222CAD0
ov80_0222CAD0: @ 0x0222CAD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	adds r4, r2, #0
	ldr r7, [r6]
	cmp r4, #7
	ble _0222CAE2
	bl GF_AssertFail
_0222CAE2:
	ldr r0, [r7, #0x34]
	lsls r1, r4, #1
	bl FUN_0201AA8C
	str r0, [sp, #8]
	adds r0, r6, #0
	bl ov80_0222BE10
	ldr r5, [sp, #8]
	str r0, [sp, #4]
	movs r4, #0
_0222CAF8:
	adds r0, r6, #0
	bl ov80_0222BE10
	strh r0, [r5]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #3
	blt _0222CAF8
	movs r0, #3
	str r0, [sp]
	ldr r0, [r7]
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	movs r2, #1
	bl ov80_02239BF0
	ldr r0, [sp, #8]
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222CAD0

	thumb_func_start ov80_0222CB24
ov80_0222CB24: @ 0x0222CB24
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl ov80_0222BE10
	movs r2, #0
	str r2, [sp]
	adds r1, r0, #0
	ldr r0, [r4]
	adds r3, r2, #0
	ldr r0, [r0]
	bl ov80_02239BF0
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov80_0222CB24

	thumb_func_start ov80_0222CB44
ov80_0222CB44: @ 0x0222CB44
	push {r3, lr}
	movs r1, #1
	movs r2, #3
	bl ov80_0222CAD0
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222CB44

	thumb_func_start ov80_0222CB54
ov80_0222CB54: @ 0x0222CB54
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #4]
	movs r1, #0
	str r0, [sp]
	movs r0, #0xb
	adds r2, r1, #0
	movs r3, #8
	str r1, [sp, #4]
	bl FUN_020830D8
	adds r2, r0, #0
	ldr r0, _0222CB8C @ =ov80_0222CB94
	ldr r1, _0222CB90 @ =0x02102610
	str r0, [sp]
	ldr r0, [r4]
	movs r3, #0
	ldr r0, [r0]
	bl FUN_02096820
	movs r0, #1
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0222CB8C: .4byte ov80_0222CB94
_0222CB90: .4byte 0x02102610
	thumb_func_end ov80_0222CB54

	thumb_func_start ov80_0222CB94
ov80_0222CB94: @ 0x0222CB94
	ldr r3, _0222CB98 @ =FUN_0208311C
	bx r3
	.align 2, 0
_0222CB98: .4byte FUN_0208311C
	thumb_func_end ov80_0222CB94

	thumb_func_start ov80_0222CB9C
ov80_0222CB9C: @ 0x0222CB9C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	movs r1, #0xb
	add r2, sp, #0
	bl FUN_0202FBF0
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CB9C

	thumb_func_start ov80_0222CBB4
ov80_0222CBB4: @ 0x0222CBB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r7, r0, #0
	ldr r0, _0222CC18 @ =0x0000270F
	cmp r6, r0
	bls _0222CBE2
	adds r6, r0, #0
_0222CBE2:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xb0
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb2
	strh r1, [r0]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl ov80_0222CC70
	adds r1, r4, #0
	adds r1, #0xb4
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xb6
	strh r6, [r0]
	adds r4, #0xb8
	ldr r1, _0222CC1C @ =ov80_0222CC20
	adds r0, r5, #0
	str r7, [r4]
	bl ov80_0222AB84
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CC18: .4byte 0x0000270F
_0222CC1C: .4byte ov80_0222CC20
	thumb_func_end ov80_0222CBB4

	thumb_func_start ov80_0222CC20
ov80_0222CC20: @ 0x0222CC20
	push {r4, lr}
	sub sp, #8
	ldr r4, [r0]
	ldr r0, [r4]
	bl FUN_02096808
	adds r1, r4, #0
	adds r1, #0xb0
	str r1, [sp]
	adds r1, r4, #0
	adds r1, #0xb2
	str r1, [sp, #4]
	adds r1, r4, #0
	adds r2, r4, #0
	adds r1, #0xb4
	adds r2, #0xb6
	ldrh r1, [r1]
	ldrh r2, [r2]
	ldr r0, [r0, #8]
	movs r3, #0
	bl FUN_0202FE14
	subs r1, r0, #2
	cmp r1, #1
	bhi _0222CC68
	cmp r0, #2
	bne _0222CC5A
	movs r1, #1
	b _0222CC5C
_0222CC5A:
	movs r1, #0
_0222CC5C:
	adds r4, #0xb8
	ldr r0, [r4]
	add sp, #8
	strh r1, [r0]
	movs r0, #1
	pop {r4, pc}
_0222CC68:
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222CC20

	thumb_func_start ov80_0222CC70
ov80_0222CC70: @ 0x0222CC70
	push {r4, lr}
	movs r4, #0xf
	cmp r0, #6
	bhi _0222CCB0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CC84: @ jump table
	.2byte _0222CD90 - _0222CC84 - 2 @ case 0
	.2byte _0222CC92 - _0222CC84 - 2 @ case 1
	.2byte _0222CCC0 - _0222CC84 - 2 @ case 2
	.2byte _0222CCEA - _0222CC84 - 2 @ case 3
	.2byte _0222CD14 - _0222CC84 - 2 @ case 4
	.2byte _0222CD3E - _0222CC84 - 2 @ case 5
	.2byte _0222CD68 - _0222CC84 - 2 @ case 6
_0222CC92:
	cmp r1, #6
	bhi _0222CCBA
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CCA2: @ jump table
	.2byte _0222CCB0 - _0222CCA2 - 2 @ case 0
	.2byte _0222CCB2 - _0222CCA2 - 2 @ case 1
	.2byte _0222CCB6 - _0222CCA2 - 2 @ case 2
	.2byte _0222CCB6 - _0222CCA2 - 2 @ case 3
	.2byte _0222CCB8 - _0222CCA2 - 2 @ case 4
	.2byte _0222CCB8 - _0222CCA2 - 2 @ case 5
	.2byte _0222CCB6 - _0222CCA2 - 2 @ case 6
_0222CCB0:
	b _0222CD90
_0222CCB2:
	movs r4, #0x10
	b _0222CD90
_0222CCB6:
	movs r4, #0x11
_0222CCB8:
	b _0222CD90
_0222CCBA:
	bl GF_AssertFail
	b _0222CD90
_0222CCC0:
	cmp r1, #3
	bhi _0222CCE4
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CCD0: @ jump table
	.2byte _0222CCD8 - _0222CCD0 - 2 @ case 0
	.2byte _0222CCDC - _0222CCD0 - 2 @ case 1
	.2byte _0222CCE0 - _0222CCD0 - 2 @ case 2
	.2byte _0222CCE0 - _0222CCD0 - 2 @ case 3
_0222CCD8:
	movs r4, #0x12
	b _0222CD90
_0222CCDC:
	movs r4, #0x13
	b _0222CD90
_0222CCE0:
	movs r4, #0x14
	b _0222CD90
_0222CCE4:
	bl GF_AssertFail
	b _0222CD90
_0222CCEA:
	cmp r1, #3
	bhi _0222CD0E
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CCFA: @ jump table
	.2byte _0222CD02 - _0222CCFA - 2 @ case 0
	.2byte _0222CD06 - _0222CCFA - 2 @ case 1
	.2byte _0222CD0A - _0222CCFA - 2 @ case 2
	.2byte _0222CD0A - _0222CCFA - 2 @ case 3
_0222CD02:
	movs r4, #0x15
	b _0222CD90
_0222CD06:
	movs r4, #0x16
	b _0222CD90
_0222CD0A:
	movs r4, #0x17
	b _0222CD90
_0222CD0E:
	bl GF_AssertFail
	b _0222CD90
_0222CD14:
	cmp r1, #3
	bhi _0222CD38
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CD24: @ jump table
	.2byte _0222CD2C - _0222CD24 - 2 @ case 0
	.2byte _0222CD30 - _0222CD24 - 2 @ case 1
	.2byte _0222CD34 - _0222CD24 - 2 @ case 2
	.2byte _0222CD34 - _0222CD24 - 2 @ case 3
_0222CD2C:
	movs r4, #0x1b
	b _0222CD90
_0222CD30:
	movs r4, #0x1c
	b _0222CD90
_0222CD34:
	movs r4, #0x1d
	b _0222CD90
_0222CD38:
	bl GF_AssertFail
	b _0222CD90
_0222CD3E:
	cmp r1, #3
	bhi _0222CD62
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CD4E: @ jump table
	.2byte _0222CD56 - _0222CD4E - 2 @ case 0
	.2byte _0222CD5A - _0222CD4E - 2 @ case 1
	.2byte _0222CD5E - _0222CD4E - 2 @ case 2
	.2byte _0222CD5E - _0222CD4E - 2 @ case 3
_0222CD56:
	movs r4, #0x18
	b _0222CD90
_0222CD5A:
	movs r4, #0x19
	b _0222CD90
_0222CD5E:
	movs r4, #0x1a
	b _0222CD90
_0222CD62:
	bl GF_AssertFail
	b _0222CD90
_0222CD68:
	cmp r1, #3
	bhi _0222CD8C
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222CD78: @ jump table
	.2byte _0222CD80 - _0222CD78 - 2 @ case 0
	.2byte _0222CD84 - _0222CD78 - 2 @ case 1
	.2byte _0222CD88 - _0222CD78 - 2 @ case 2
	.2byte _0222CD88 - _0222CD78 - 2 @ case 3
_0222CD80:
	movs r4, #0x1e
	b _0222CD90
_0222CD84:
	movs r4, #0x1f
	b _0222CD90
_0222CD88:
	movs r4, #0x20
	b _0222CD90
_0222CD8C:
	bl GF_AssertFail
_0222CD90:
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov80_0222CC70

	thumb_func_start ov80_0222CD94
ov80_0222CD94: @ 0x0222CD94
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	movs r1, #0x75
	adds r4, r0, #0
	movs r0, #0xb
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x75
	movs r1, #0
	lsls r2, r2, #2
	adds r6, r0, #0
	blx FUN_020D4994
	movs r0, #0
	str r0, [sp]
	ldr r0, [r4, #8]
	movs r1, #0xb
	add r2, sp, #4
	adds r3, r6, #0
	bl FUN_0202FC90
	ldr r1, _0222CDEC @ =0x0000045D
	movs r0, #5
	movs r2, #1
	bl FUN_02004EC4
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, _0222CDF0 @ =0x020FA484
	ldr r0, [r0]
	adds r2, r6, #0
	movs r3, #1
	bl FUN_02096820
	movs r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222CDEC: .4byte 0x0000045D
_0222CDF0: .4byte 0x020FA484
	thumb_func_end ov80_0222CD94

	thumb_func_start ov80_0222CDF4
ov80_0222CDF4: @ 0x0222CDF4
	push {r3, lr}
	bl FUN_0202FC24
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222CDF4

	thumb_func_start ov80_0222CE00
ov80_0222CE00: @ 0x0222CE00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	movs r1, #0xb
	add r2, sp, #0
	movs r3, #0
	bl FUN_0202FD28
	strh r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222CE00

	thumb_func_start ov80_0222CE28
ov80_0222CE28: @ 0x0222CE28
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096808
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BDF4
	ldr r0, [r5, #8]
	bl FUN_020273F0
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222CE28

	thumb_func_start ov80_0222CE48
ov80_0222CE48: @ 0x0222CE48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl FUN_02096808
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	movs r0, #4
	bl FUN_0201A728
	ldr r0, [r4, #0x34]
	bl FUN_0201A748
	ldr r0, [r6, #8]
	movs r1, #2
	bl FUN_02027550
	ldr r1, _0222CE7C @ =ov80_0222CE80
	adds r0, r5, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222CE7C: .4byte ov80_0222CE80
	thumb_func_end ov80_0222CE48

	thumb_func_start ov80_0222CE80
ov80_0222CE80: @ 0x0222CE80
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_02027564
	cmp r0, #2
	bne _0222CEA2
	bl FUN_0201A774
	movs r0, #4
	bl FUN_0201A738
	movs r0, #1
	pop {r3, pc}
_0222CEA2:
	cmp r0, #3
	bne _0222CEB4
	bl FUN_0201A774
	movs r0, #4
	bl FUN_0201A738
	movs r0, #1
	pop {r3, pc}
_0222CEB4:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CE80

	thumb_func_start ov80_0222CEB8
ov80_0222CEB8: @ 0x0222CEB8
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_02027FFC
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CEB8

	thumb_func_start ov80_0222CECC
ov80_0222CECC: @ 0x0222CECC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	bl FUN_020274E8
	strh r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222CECC

	thumb_func_start ov80_0222CEF0
ov80_0222CEF0: @ 0x0222CEF0
	push {r4, lr}
	ldr r4, [r0]
	ldr r1, _0222CF04 @ =0x000003E2
	adds r0, r4, #0
	adds r0, #0x64
	bl FUN_0200F0AC
	str r0, [r4, #0x7c]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222CF04: .4byte 0x000003E2
	thumb_func_end ov80_0222CEF0

	thumb_func_start ov80_0222CF08
ov80_0222CF08: @ 0x0222CF08
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x7c]
	bl FUN_0200F450
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222CF08

	thumb_func_start ov80_0222CF18
ov80_0222CF18: @ 0x0222CF18
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	adds r2, r0, #0
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #0x44]
	bl FUN_0200C0CC
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222CF18

	thumb_func_start ov80_0222CF38
ov80_0222CF38: @ 0x0222CF38
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	adds r6, r0, #0
	bl ov80_0222CF6C
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #0x44]
	adds r2, r6, #0
	bl FUN_0200BFCC
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0222CF38

	thumb_func_start ov80_0222CF6C
ov80_0222CF6C: @ 0x0222CF6C
	push {r4, lr}
	movs r1, #0xa
	adds r4, r0, #0
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CF7E
	movs r0, #1
	pop {r4, pc}
_0222CF7E:
	adds r0, r4, #0
	movs r1, #0x64
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CF8E
	movs r0, #2
	pop {r4, pc}
_0222CF8E:
	movs r1, #0xfa
	adds r0, r4, #0
	lsls r1, r1, #2
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CFA0
	movs r0, #3
	pop {r4, pc}
_0222CFA0:
	ldr r1, _0222CFF4 @ =0x00002710
	adds r0, r4, #0
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CFB0
	movs r0, #4
	pop {r4, pc}
_0222CFB0:
	ldr r1, _0222CFF8 @ =0x000186A0
	adds r0, r4, #0
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CFC0
	movs r0, #5
	pop {r4, pc}
_0222CFC0:
	ldr r1, _0222CFFC @ =0x000F4240
	adds r0, r4, #0
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CFD0
	movs r0, #6
	pop {r4, pc}
_0222CFD0:
	ldr r1, _0222D000 @ =0x00989680
	adds r0, r4, #0
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CFE0
	movs r0, #7
	pop {r4, pc}
_0222CFE0:
	ldr r1, _0222D004 @ =0x05F5E100
	adds r0, r4, #0
	blx FUN_020F2BA4
	cmp r0, #0
	bne _0222CFF0
	movs r0, #8
	pop {r4, pc}
_0222CFF0:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0222CFF4: .4byte 0x00002710
_0222CFF8: .4byte 0x000186A0
_0222CFFC: .4byte 0x000F4240
_0222D000: .4byte 0x00989680
_0222D004: .4byte 0x05F5E100
	thumb_func_end ov80_0222CF6C

	thumb_func_start ov80_0222D008
ov80_0222D008: @ 0x0222D008
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldr r0, [r0, #8]
	ldrb r4, [r2]
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #0x44]
	bl FUN_0200BE48
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222D008

	thumb_func_start ov80_0222D034
ov80_0222D034: @ 0x0222D034
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r5, #0x1c]
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r4, [r1]
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #0x44]
	bl FUN_0200BE48
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D034

	thumb_func_start ov80_0222D064
ov80_0222D064: @ 0x0222D064
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	adds r2, r0, #0
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #0x44]
	bl FUN_0200BFF0
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D064

	thumb_func_start ov80_0222D084
ov80_0222D084: @ 0x0222D084
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	ldr r1, [r5, #0x1c]
	str r0, [sp, #8]
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r4, [r1]
	adds r0, r7, #0
	movs r1, #0xb
	bl ov80_0222D0D4
	adds r7, r0, #0
	str r4, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, [sp, #8]
	ldr r0, [r0, #0x44]
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0200BE3C
	adds r0, r7, #0
	bl FUN_02026380
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222D084

	thumb_func_start ov80_0222D0D4
ov80_0222D0D4: @ 0x0222D0D4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xed
	bl FUN_0200BAF8
	adds r5, r0, #0
	adds r1, r4, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0200BB44
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D0D4

	thumb_func_start ov80_0222D0F8
ov80_0222D0F8: @ 0x0222D0F8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x1c]
	adds r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	adds r2, r0, #0
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #0x44]
	bl FUN_0200C19C
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D0F8

	thumb_func_start ov80_0222D118
ov80_0222D118: @ 0x0222D118
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r4, #0x1c]
	adds r2, r0, #0
	adds r0, r1, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	ldrb r1, [r1]
	ldr r0, [r0, #0x44]
	ldr r2, [r2, #8]
	bl FUN_0200BE6C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222D118

	thumb_func_start ov80_0222D13C
ov80_0222D13C: @ 0x0222D13C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0202D918
	movs r1, #0
	adds r2, r1, #0
	bl FUN_0202D3F8
	strh r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222D13C

	thumb_func_start ov80_0222D168
ov80_0222D168: @ 0x0222D168
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r5, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0202CF54
	movs r1, #0x45
	adds r2, r5, #0
	bl FUN_0202D144
	ldr r0, [r4, #8]
	bl FUN_0202D918
	adds r1, r5, #0
	movs r2, #5
	bl FUN_0202D3F8
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222D168

	thumb_func_start ov80_0222D1A0
ov80_0222D1A0: @ 0x0222D1A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r5, r0, #0
	ldr r0, [r4, #8]
	bl FUN_0202CF54
	movs r1, #0x46
	adds r2, r5, #0
	bl FUN_0202D144
	ldr r0, [r4, #8]
	bl FUN_0202D918
	adds r1, r5, #0
	movs r2, #6
	bl FUN_0202D3F8
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222D1A0

	thumb_func_start ov80_0222D1D8
ov80_0222D1D8: @ 0x0222D1D8
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222BE10
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02037AC0
	ldr r1, _0222D1FC @ =ov80_0222D200
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_0222D1FC: .4byte ov80_0222D200
	thumb_func_end ov80_0222D1D8

	thumb_func_start ov80_0222D200
ov80_0222D200: @ 0x0222D200
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02037454
	cmp r0, #2
	bge _0222D210
	movs r0, #1
	pop {r4, pc}
_0222D210:
	adds r4, #0x78
	ldrh r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02037B38
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222D200

	thumb_func_start ov80_0222D220
ov80_0222D220: @ 0x0222D220
	push {r3, lr}
	bl FUN_02037BEC
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222D220

	thumb_func_start ov80_0222D22C
ov80_0222D22C: @ 0x0222D22C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02058284
	ldr r1, _0222D240 @ =ov80_0222D244
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_0222D240: .4byte ov80_0222D244
	thumb_func_end ov80_0222D22C

	thumb_func_start ov80_0222D244
ov80_0222D244: @ 0x0222D244
	push {r3, lr}
	bl FUN_02037D78
	cmp r0, #1
	beq _0222D25A
	bl FUN_02035650
	cmp r0, #1
	beq _0222D25A
	movs r0, #1
	pop {r3, pc}
_0222D25A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222D244

	thumb_func_start ov80_0222D260
ov80_0222D260: @ 0x0222D260
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov80_0222BDF4
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	bl FUN_0201FD44
	adds r1, r4, #0
	blx FUN_020F2998
	strh r1, [r5]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222D260

	thumb_func_start ov80_0222D284
ov80_0222D284: @ 0x0222D284
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_02074904
	bl FUN_02090C1C
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222D284

	thumb_func_start ov80_0222D29C
ov80_0222D29C: @ 0x0222D29C
	push {r3, lr}
	ldr r1, _0222D2A8 @ =ov80_0222D2AC
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222D2A8: .4byte ov80_0222D2AC
	thumb_func_end ov80_0222D29C

	thumb_func_start ov80_0222D2AC
ov80_0222D2AC: @ 0x0222D2AC
	push {r3, lr}
	ldr r0, _0222D2C8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222D2C0
	bl FUN_02025358
	cmp r0, #0
	beq _0222D2C4
_0222D2C0:
	movs r0, #1
	pop {r3, pc}
_0222D2C4:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0222D2C8: .4byte 0x021D110C
	thumb_func_end ov80_0222D2AC

	thumb_func_start ov80_0222D2CC
ov80_0222D2CC: @ 0x0222D2CC
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222BE10
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _0222D2E8 @ =ov80_0222D2EC
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_0222D2E8: .4byte ov80_0222D2EC
	thumb_func_end ov80_0222D2CC

	thumb_func_start ov80_0222D2EC
ov80_0222D2EC: @ 0x0222D2EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222D324 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0222D302
	bl FUN_02025358
	cmp r0, #0
	beq _0222D306
_0222D302:
	movs r0, #1
	pop {r4, pc}
_0222D306:
	adds r0, r4, #0
	adds r0, #0x78
	ldrh r0, [r0]
	subs r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x78
	adds r4, #0x78
	strh r1, [r0]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0222D320
	movs r0, #1
	pop {r4, pc}
_0222D320:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222D324: .4byte 0x021D110C
	thumb_func_end ov80_0222D2EC

	thumb_func_start ov80_0222D328
ov80_0222D328: @ 0x0222D328
	push {r3, lr}
	bl ov80_0222BDF4
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222D328

	thumb_func_start ov80_0222D334
ov80_0222D334: @ 0x0222D334
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_020503D0
	adds r1, r6, #0
	bl FUN_020504A4
	strh r4, [r0]
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222D334

	thumb_func_start ov80_0222D360
ov80_0222D360: @ 0x0222D360
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_020503D0
	adds r1, r6, #0
	bl FUN_020504A4
	ldrh r0, [r0]
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0222D360

	thumb_func_start ov80_0222D390
ov80_0222D390: @ 0x0222D390
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222D3A2
	cmp r0, #1
	beq _0222D3BE
	b _0222D3F0
_0222D3A2:
	movs r1, #0x10
	movs r0, #2
	adds r2, r1, #0
	adds r3, r4, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D3FE
_0222D3BE:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D3FE
	movs r0, #0
	bl FUN_0200FBDC
	movs r0, #1
	bl FUN_0200FBDC
	movs r0, #0xc
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x20
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D3FE
_0222D3F0:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0222D3FE
	add sp, #0xc
	movs r0, #0
	pop {r3, r4, pc}
_0222D3FE:
	movs r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov80_0222D390

	thumb_func_start ov80_0222D404
ov80_0222D404: @ 0x0222D404
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _0222D4CC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222D41C: @ jump table
	.2byte _0222D424 - _0222D41C - 2 @ case 0
	.2byte _0222D440 - _0222D41C - 2 @ case 1
	.2byte _0222D49A - _0222D41C - 2 @ case 2
	.2byte _0222D4B2 - _0222D41C - 2 @ case 3
_0222D424:
	movs r1, #0x10
	movs r0, #2
	adds r2, r1, #0
	adds r3, r4, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D440:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D51A
	movs r0, #0xb
	movs r1, #1
	bl FUN_0201D39C
	str r0, [r4, #0x28]
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	movs r2, #1
	bl FUN_0201D40C
	movs r1, #0
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r2, #2
	ldr r0, [r0, #4]
	adds r3, r1, #0
	bl FUN_02003D5C
	ldr r0, [r4, #0x28]
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0x28]
	bl FUN_0201D5C8
	movs r0, #0xb
	bl ov80_0223AF30
	str r0, [r4, #0x2c]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
_0222D49A:
	movs r0, #0xf
	str r0, [sp]
	movs r1, #1
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x28]
	adds r2, r1, #0
	bl ov80_0223AF80
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D4B2:
	ldr r0, [r4, #0x2c]
	bl ov80_0223AFC4
	adds r5, r0, #0
	ldr r0, [r4, #0x28]
	bl FUN_0201D5C8
	cmp r5, #0
	beq _0222D51A
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D4CC:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0222D51A
	ldr r0, [r4, #0x2c]
	bl ov80_0223AF60
	ldr r0, [r4, #0x28]
	bl FUN_0201D8C8
	ldr r0, [r4, #0x28]
	bl FUN_0201D520
	ldr r0, [r4, #0x28]
	movs r1, #1
	bl FUN_0201D54C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xb
	bl FUN_0201C1C4
	ldr r0, [r4]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_0201CAE0
	add sp, #0x14
	movs r0, #0
	pop {r4, r5, pc}
_0222D51A:
	movs r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_0222D404

	thumb_func_start ov80_0222D520
ov80_0222D520: @ 0x0222D520
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _0222D5E8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222D538: @ jump table
	.2byte _0222D540 - _0222D538 - 2 @ case 0
	.2byte _0222D55C - _0222D538 - 2 @ case 1
	.2byte _0222D5B6 - _0222D538 - 2 @ case 2
	.2byte _0222D5CE - _0222D538 - 2 @ case 3
_0222D540:
	movs r1, #0x10
	movs r0, #2
	adds r2, r1, #0
	adds r3, r4, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D55C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D636
	movs r0, #0xb
	movs r1, #1
	bl FUN_0201D39C
	str r0, [r4, #0x28]
	movs r3, #0
	str r3, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	movs r2, #1
	bl FUN_0201D40C
	movs r1, #0
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r2, #2
	ldr r0, [r0, #4]
	adds r3, r1, #0
	bl FUN_02003D5C
	ldr r0, [r4, #0x28]
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0x28]
	bl FUN_0201D5C8
	movs r0, #0xb
	bl ov80_0223AF30
	str r0, [r4, #0x2c]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
_0222D5B6:
	movs r0, #0xf
	str r0, [sp]
	movs r1, #1
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x28]
	adds r2, r1, #0
	bl ov80_0223AF80
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D5CE:
	ldr r0, [r4, #0x2c]
	bl ov80_0223B1D4
	adds r5, r0, #0
	ldr r0, [r4, #0x28]
	bl FUN_0201D5C8
	cmp r5, #0
	beq _0222D636
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D5E8:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0222D636
	ldr r0, [r4, #0x2c]
	bl ov80_0223AF60
	ldr r0, [r4, #0x28]
	bl FUN_0201D8C8
	ldr r0, [r4, #0x28]
	bl FUN_0201D520
	ldr r0, [r4, #0x28]
	movs r1, #1
	bl FUN_0201D54C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xb
	bl FUN_0201C1C4
	ldr r0, [r4]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_0201CAE0
	add sp, #0x14
	movs r0, #0
	pop {r4, r5, pc}
_0222D636:
	movs r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_0222D520

	thumb_func_start ov80_0222D63C
ov80_0222D63C: @ 0x0222D63C
	lsls r1, r1, #0x10
	orrs r0, r1
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222D63C

	thumb_func_start ov80_0222D644
ov80_0222D644: @ 0x0222D644
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r1, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	movs r1, #2
	ldr r0, [r0]
	ldr r7, [r4, #0x24]
	bl FUN_0201CC14
	str r0, [sp, #0x20]
	ldr r0, [r4]
	movs r1, #2
	ldr r0, [r0]
	bl FUN_0201CC14
	str r0, [sp, #0x1c]
	ldr r0, [r4]
	movs r1, #3
	ldr r0, [r0]
	bl FUN_0201CC14
	str r0, [sp, #0x18]
	ldr r0, [r4]
	movs r1, #3
	ldr r0, [r0]
	bl FUN_0201CC14
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x10]
	cmp r0, #1
	beq _0222D686
	b _0222D7F6
_0222D686:
	movs r0, #6
	lsls r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B60C
	str r0, [sp, #0x24]
	movs r0, #0
	str r0, [sp, #0x28]
	adds r4, r7, #0
_0222D698:
	movs r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	ldrsh r6, [r4, r0]
	movs r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	blt _0222D6AA
	b _0222D7CE
_0222D6AA:
	ldr r0, [sp, #0x24]
	lsls r1, r6, #5
	adds r5, r0, r1
_0222D6B0:
	movs r2, #1
	movs r0, #0
	lsls r2, r2, #0xc
	str r0, [sp]
	add r0, sp, #0x2c
	movs r1, #0
	adds r3, r2, #0
	bl FUN_0201FECC
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	adds r1, r1, r2
	ldr r2, _0222D964 @ =0x00000604
	lsls r1, r1, #0x10
	ldr r2, [r7, r2]
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	cmp r2, #2
	bne _0222D704
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsrs r2, r1, #0x1f
	lsls r3, r1, #0x18
	lsls r0, r0, #0x10
	subs r3, r3, r2
	movs r1, #0x18
	rors r3, r1
	adds r1, r2, r3
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	b _0222D730
_0222D704:
	cmp r2, #1
	bne _0222D730
	cmp r0, #0
	bge _0222D716
	movs r2, #1
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D716:
	cmp r1, #0
	bge _0222D720
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
_0222D720:
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D730:
	str r0, [sp]
	movs r2, #0
	str r1, [sp, #4]
	adds r0, r5, #0
	add r1, sp, #0x2c
	adds r3, r2, #0
	blx FUN_020CF0AC
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x18]
	adds r0, r0, r1
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0x10
	adds r1, r1, r2
	ldr r2, _0222D964 @ =0x00000604
	lsls r1, r1, #0x10
	ldr r2, [r7, r2]
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	cmp r2, #2
	bne _0222D782
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsrs r2, r1, #0x1f
	lsls r3, r1, #0x18
	lsls r0, r0, #0x10
	subs r3, r3, r2
	movs r1, #0x18
	rors r3, r1
	adds r1, r2, r3
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	b _0222D7AE
_0222D782:
	cmp r2, #1
	bne _0222D7AE
	cmp r0, #0
	bge _0222D794
	movs r2, #1
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D794:
	cmp r1, #0
	bge _0222D79E
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
_0222D79E:
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D7AE:
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0
	str r1, [sp, #4]
	adds r0, #0x10
	add r1, sp, #0x2c
	adds r3, r2, #0
	blx FUN_020CF0AC
	movs r0, #2
	ldrsh r0, [r4, r0]
	adds r6, r6, #1
	adds r5, #0x20
	cmp r6, r0
	bge _0222D7CE
	b _0222D6B0
_0222D7CE:
	ldr r0, [sp, #0x28]
	adds r4, #0x10
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #0x60
	bge _0222D7DC
	b _0222D698
_0222D7DC:
	movs r0, #6
	lsls r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B5E8
	adds r0, r7, #0
	bl FUN_0201AB0C
	ldr r0, [sp, #8]
	bl FUN_0200E390
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_0222D7F6:
	movs r0, #6
	lsls r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B60C
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r4, r7, #0
_0222D808:
	movs r0, #8
	ldrsh r1, [r4, r0]
	movs r0, #4
	ldrsh r0, [r4, r0]
	adds r0, r1, r0
	strh r0, [r4, #8]
	movs r0, #0xa
	ldrsh r1, [r4, r0]
	movs r0, #6
	ldrsh r0, [r4, r0]
	adds r0, r1, r0
	strh r0, [r4, #0xa]
	movs r0, #0
	ldrsh r6, [r4, r0]
	movs r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	blt _0222D82E
	b _0222D952
_0222D82E:
	ldr r0, [sp, #0x10]
	lsls r1, r6, #5
	adds r5, r0, r1
_0222D834:
	movs r2, #1
	movs r0, #0
	lsls r2, r2, #0xc
	str r0, [sp]
	add r0, sp, #0x2c
	movs r1, #0
	adds r3, r2, #0
	bl FUN_0201FECC
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x20]
	adds r0, r0, r1
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x1c]
	lsls r0, r0, #0x10
	adds r1, r1, r2
	ldr r2, _0222D964 @ =0x00000604
	lsls r1, r1, #0x10
	ldr r2, [r7, r2]
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	cmp r2, #2
	bne _0222D888
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsrs r2, r1, #0x1f
	lsls r3, r1, #0x18
	lsls r0, r0, #0x10
	subs r3, r3, r2
	movs r1, #0x18
	rors r3, r1
	adds r1, r2, r3
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	b _0222D8B4
_0222D888:
	cmp r2, #1
	bne _0222D8B4
	cmp r0, #0
	bge _0222D89A
	movs r2, #1
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D89A:
	cmp r1, #0
	bge _0222D8A4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
_0222D8A4:
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D8B4:
	str r0, [sp]
	movs r2, #0
	str r1, [sp, #4]
	adds r0, r5, #0
	add r1, sp, #0x2c
	adds r3, r2, #0
	blx FUN_020CF0AC
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x18]
	adds r0, r0, r1
	movs r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x14]
	lsls r0, r0, #0x10
	adds r1, r1, r2
	ldr r2, _0222D964 @ =0x00000604
	lsls r1, r1, #0x10
	ldr r2, [r7, r2]
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	cmp r2, #2
	bne _0222D906
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsrs r2, r1, #0x1f
	lsls r3, r1, #0x18
	lsls r0, r0, #0x10
	subs r3, r3, r2
	movs r1, #0x18
	rors r3, r1
	adds r1, r2, r3
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	b _0222D932
_0222D906:
	cmp r2, #1
	bne _0222D932
	cmp r0, #0
	bge _0222D918
	movs r2, #1
	lsls r2, r2, #8
	adds r0, r0, r2
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D918:
	cmp r1, #0
	bge _0222D922
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
_0222D922:
	lsrs r2, r0, #0x1f
	lsls r3, r0, #0x18
	subs r3, r3, r2
	movs r0, #0x18
	rors r3, r0
	adds r0, r2, r3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
_0222D932:
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0
	str r1, [sp, #4]
	adds r0, #0x10
	add r1, sp, #0x2c
	adds r3, r2, #0
	blx FUN_020CF0AC
	movs r0, #2
	ldrsh r0, [r4, r0]
	adds r6, r6, #1
	adds r5, #0x20
	cmp r6, r0
	bge _0222D952
	b _0222D834
_0222D952:
	ldr r0, [sp, #0xc]
	adds r4, #0x10
	adds r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x60
	bge _0222D960
	b _0222D808
_0222D960:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222D964: .4byte 0x00000604
	thumb_func_end ov80_0222D644

	thumb_func_start ov80_0222D968
ov80_0222D968: @ 0x0222D968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222D97E
	cmp r0, #1
	beq _0222D99A
	cmp r0, #2
	beq _0222DA54
	b _0222DA8E
_0222D97E:
	movs r1, #0x10
	movs r0, #2
	adds r2, r1, #0
	adds r3, r5, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222D99A:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0222DA94
	add r0, sp, #4
	movs r1, #0
	movs r2, #0x20
	blx FUN_020D4994
	movs r0, #0
	str r0, [r5, #0x10]
	ldr r1, _0222DA9C @ =0x00000608
	movs r0, #0x65
	bl FUN_0201AA8C
	ldr r1, _0222DAA0 @ =0x00000604
	str r0, [r5, #0x24]
	movs r2, #1
	str r2, [r0, r1]
	ldr r0, _0222DAA4 @ =0x04000020
	add r1, sp, #4
	movs r2, #0x65
	bl ov80_0223B544
	movs r7, #0
	movs r1, #6
	ldr r2, [r5, #0x24]
	lsls r1, r1, #8
	str r0, [r2, r1]
	adds r6, r7, #0
	adds r4, r7, #0
_0222D9D6:
	ldr r0, [r5, #0x24]
	strh r6, [r0, r4]
	ldr r1, [r5, #0x24]
	adds r0, r1, r4
	ldrsh r1, [r1, r4]
	adds r1, r1, #2
	strh r1, [r0, #2]
	movs r0, #0x31
	subs r2, r0, r7
	lsrs r1, r2, #0x1f
	lsls r3, r2, #0x1d
	subs r3, r3, r1
	movs r0, #0x1d
	rors r3, r0
	adds r0, r1, r3
	ldr r1, [r5, #0x24]
	adds r1, r1, r4
	strh r0, [r1, #4]
	asrs r0, r2, #1
	lsrs r0, r0, #0x1e
	adds r0, r2, r0
	asrs r1, r0, #2
	ldr r0, [r5, #0x24]
	adds r0, r0, r4
	strh r1, [r0, #6]
	ldr r0, [r5, #0x24]
	adds r1, r0, r4
	movs r0, #0
	strh r0, [r1, #8]
	ldr r0, [r5, #0x24]
	adds r1, r0, r4
	movs r0, #0
	strh r0, [r1, #0xa]
	adds r1, r0, #0
	bl ov80_0222D63C
	ldr r1, [r5, #0x24]
	adds r7, r7, #1
	adds r1, r1, r4
	str r0, [r1, #0xc]
	adds r6, r6, #2
	adds r4, #0x10
	cmp r7, #0x60
	blt _0222D9D6
	movs r0, #1
	str r0, [sp]
	movs r0, #0x28
	adds r1, r0, #0
	subs r1, #0x38
	movs r2, #0
	movs r3, #0x1e
	bl FUN_0200B484
	movs r2, #1
	ldr r0, _0222DAA8 @ =ov80_0222D644
	adds r1, r5, #0
	lsls r2, r2, #0xc
	bl FUN_0200E320
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222DA54:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0222DA94
	movs r0, #1
	str r0, [r5, #0x10]
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r5]
	movs r2, #0
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r5]
	movs r1, #3
	ldr r0, [r0]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222DA8E:
	add sp, #0x24
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0222DA94:
	movs r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222DA9C: .4byte 0x00000608
_0222DAA0: .4byte 0x00000604
_0222DAA4: .4byte 0x04000020
_0222DAA8: .4byte ov80_0222D644
	thumb_func_end ov80_0222D968

	thumb_func_start ov80_0222DAAC
ov80_0222DAAC: @ 0x0222DAAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222DAC2
	cmp r0, #1
	beq _0222DADE
	cmp r0, #2
	beq _0222DBBC
	b _0222DBF6
_0222DAC2:
	movs r1, #0x10
	movs r0, #2
	adds r2, r1, #0
	adds r3, r5, #0
	str r0, [sp]
	movs r0, #1
	subs r2, #0x20
	adds r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DADE:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0222DAE6
	b _0222DBFC
_0222DAE6:
	add r0, sp, #4
	movs r1, #0
	movs r2, #0x20
	blx FUN_020D4994
	movs r0, #0
	str r0, [r5, #0x10]
	ldr r1, _0222DC04 @ =0x00000608
	movs r0, #0x65
	bl FUN_0201AA8C
	ldr r1, _0222DC08 @ =0x00000604
	str r0, [r5, #0x24]
	movs r2, #2
	str r2, [r0, r1]
	ldr r0, _0222DC0C @ =0x04000020
	add r1, sp, #4
	movs r2, #0x65
	bl ov80_0223B544
	movs r6, #0
	movs r1, #6
	ldr r2, [r5, #0x24]
	lsls r1, r1, #8
	str r0, [r2, r1]
	adds r7, r6, #0
	adds r4, r6, #0
_0222DB1C:
	ldr r0, [r5, #0x24]
	lsrs r2, r6, #0x1f
	strh r7, [r0, r4]
	ldr r1, [r5, #0x24]
	adds r0, r1, r4
	ldrsh r1, [r1, r4]
	adds r1, r1, #2
	strh r1, [r0, #2]
	movs r0, #0x30
	subs r1, r0, r6
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	adds r1, r0, #1
	ldr r0, [r5, #0x24]
	adds r0, r0, r4
	strh r1, [r0, #4]
	lsls r1, r6, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	beq _0222DB5A
	ldr r0, [r5, #0x24]
	movs r1, #4
	adds r0, r0, r4
	ldrsh r2, [r0, r1]
	subs r1, r1, #5
	muls r1, r2, r1
	strh r1, [r0, #4]
_0222DB5A:
	cmp r6, #0x30
	bge _0222DB66
	ldr r0, [r5, #0x24]
	adds r0, r0, r4
	strh r6, [r0, #6]
	b _0222DB70
_0222DB66:
	movs r0, #0x60
	subs r1, r0, r6
	ldr r0, [r5, #0x24]
	adds r0, r0, r4
	strh r1, [r0, #6]
_0222DB70:
	ldr r0, [r5, #0x24]
	adds r1, r0, r4
	movs r0, #0
	strh r0, [r1, #8]
	ldr r0, [r5, #0x24]
	adds r1, r0, r4
	movs r0, #0
	strh r0, [r1, #0xa]
	adds r1, r0, #0
	bl ov80_0222D63C
	ldr r1, [r5, #0x24]
	adds r6, r6, #1
	adds r1, r1, r4
	str r0, [r1, #0xc]
	adds r7, r7, #2
	adds r4, #0x10
	cmp r6, #0x60
	blt _0222DB1C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x28
	adds r1, r0, #0
	subs r1, #0x38
	movs r2, #0
	movs r3, #0x1c
	bl FUN_0200B484
	movs r2, #1
	ldr r0, _0222DC10 @ =ov80_0222D644
	adds r1, r5, #0
	lsls r2, r2, #0xc
	bl FUN_0200E320
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DBBC:
	movs r0, #1
	bl FUN_0200B5C0
	cmp r0, #0
	beq _0222DBFC
	movs r0, #1
	str r0, [r5, #0x10]
	movs r0, #3
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r5]
	movs r2, #0
	ldr r0, [r0]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r5]
	movs r1, #3
	ldr r0, [r0]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	ldr r0, [r5, #4]
	adds r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DBF6:
	add sp, #0x24
	movs r0, #0
	pop {r4, r5, r6, r7, pc}
_0222DBFC:
	movs r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222DC04: .4byte 0x00000608
_0222DC08: .4byte 0x00000604
_0222DC0C: .4byte 0x04000020
_0222DC10: .4byte ov80_0222D644
	thumb_func_end ov80_0222DAAC

	thumb_func_start ov80_0222DC14
ov80_0222DC14: @ 0x0222DC14
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222DC26
	cmp r0, #1
	beq _0222DC38
	b _0222DC62
_0222DC26:
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0x65
	bl ov80_0223B424
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0222DC62
_0222DC38:
	movs r0, #0x12
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #0x19
	lsls r0, r0, #4
	str r0, [sp, #4]
	ldr r0, _0222DC68 @ =0x0400001C
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #4
	str r0, [sp, #0x10]
	adds r0, r4, #0
	ldr r3, _0222DC6C @ =0x000002AA
	adds r0, #0x18
	movs r2, #0xbf
	bl ov80_0223B440
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
_0222DC62:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0222DC68: .4byte 0x0400001C
_0222DC6C: .4byte 0x000002AA
	thumb_func_end ov80_0222DC14

	thumb_func_start ov80_0222DC70
ov80_0222DC70: @ 0x0222DC70
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r1, r5, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _0222DCE8 @ =0x0000045D
	movs r0, #5
	movs r2, #1
	bl FUN_02004EC4
	movs r0, #0xb
	movs r1, #0x30
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	str r0, [r4, #0x14]
	movs r0, #0
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0x78
	ldrh r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r5]
	bl ov80_0222AB34
	str r0, [r4]
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0]
	bl FUN_02096818
	ldr r1, _0222DCEC @ =ov80_0222DCF0
	adds r0, r5, #0
	bl ov80_0222AB84
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r2, #2
	ldr r0, [r0, #4]
	adds r3, r1, #0
	bl FUN_02003D5C
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222DCE8: .4byte 0x0000045D
_0222DCEC: .4byte ov80_0222DCF0
	thumb_func_end ov80_0222DC70

	thumb_func_start ov80_0222DCF0
ov80_0222DCF0: @ 0x0222DCF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r1, [r4, #8]
	lsls r2, r1, #2
	ldr r1, _0222DD38 @ =0x0223B9EC
	ldr r1, [r1, r2]
	blx r1
	adds r6, r0, #0
	bne _0222DD2C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	ldr r0, [r5]
	ldr r1, [r4, #0x14]
	ldr r0, [r0]
	bl FUN_02096818
	adds r0, r4, #0
	bl FUN_0201AB0C
_0222DD2C:
	cmp r6, #0
	bne _0222DD34
	movs r0, #1
	pop {r4, r5, r6, pc}
_0222DD34:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222DD38: .4byte 0x0223B9EC
	thumb_func_end ov80_0222DCF0

	thumb_func_start ov80_0222DD3C
ov80_0222DD3C: @ 0x0222DD3C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_02028E9C
	bl FUN_02028F94
	cmp r0, #0
	bne _0222DD60
	movs r0, #0
	b _0222DD62
_0222DD60:
	movs r0, #0x61
_0222DD62:
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222DD3C

	thumb_func_start ov80_0222DD68
ov80_0222DD68: @ 0x0222DD68
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r3, r0, #0
	ldr r0, [r4, #0x10]
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_022399A4
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222DD68

	thumb_func_start ov80_0222DD9C
ov80_0222DD9C: @ 0x0222DD9C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r1, r0, #0
	ldr r0, [r5, #0x10]
	bl ov80_02239A1C
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222DD9C

	thumb_func_start ov80_0222DDBC
ov80_0222DDBC: @ 0x0222DDBC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5, #0x10]
	adds r1, r6, #0
	bl ov80_02239A60
	movs r2, #0
	adds r1, r4, #0
	adds r3, r2, #0
	bl FUN_02015494
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222DDBC

	thumb_func_start ov80_0222DDF0
ov80_0222DDF0: @ 0x0222DDF0
	push {r3, lr}
	ldr r1, _0222DDFC @ =ov80_0222DE00
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222DDFC: .4byte ov80_0222DE00
	thumb_func_end ov80_0222DDF0

	thumb_func_start ov80_0222DE00
ov80_0222DE00: @ 0x0222DE00
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_0209680C
	ldr r0, [r0, #0x10]
	bl ov80_02239A74
	cmp r0, #1
	bne _0222DE18
	movs r0, #1
	pop {r3, pc}
_0222DE18:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222DE00

	thumb_func_start ov80_0222DE1C
ov80_0222DE1C: @ 0x0222DE1C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r5, r0, #0
	adds r0, #0xa4
	ldr r0, [r0]
	adds r5, #0xa4
	cmp r0, #0
	beq _0222DE3E
	bl GF_AssertFail
	ldr r0, [r5]
	bl FUN_0200E390
_0222DE3E:
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	str r0, [sp]
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	strh r6, [r5, #4]
	ldr r0, [sp]
	strh r7, [r5, #6]
	strb r0, [r5, #9]
	ldr r0, _0222DE84 @ =ov80_0222F4F0
	ldr r2, _0222DE88 @ =0x00011170
	adds r1, r5, #0
	strb r4, [r5, #0xa]
	bl FUN_0200E320
	str r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DE84: .4byte ov80_0222F4F0
_0222DE88: .4byte 0x00011170
	thumb_func_end ov80_0222DE1C

	thumb_func_start ov80_0222DE8C
ov80_0222DE8C: @ 0x0222DE8C
	push {r3, lr}
	ldr r1, _0222DE98 @ =ov80_0222DE9C
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222DE98: .4byte ov80_0222DE9C
	thumb_func_end ov80_0222DE8C

	thumb_func_start ov80_0222DE9C
ov80_0222DE9C: @ 0x0222DE9C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _0222DEB2
	movs r0, #1
	pop {r3, pc}
_0222DEB2:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222DE9C

	thumb_func_start ov80_0222DEB8
ov80_0222DEB8: @ 0x0222DEB8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, r0, #0
	adds r0, #0xb0
	ldr r0, [r0]
	adds r4, #0xb0
	cmp r0, #0
	beq _0222DEDA
	bl GF_AssertFail
	ldr r0, [r4]
	bl FUN_0200E390
_0222DEDA:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	adds r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #4]
	adds r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #5]
	adds r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #6]
	adds r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #7]
	adds r0, r5, #0
	bl ov80_0222BE10
	strh r0, [r4, #8]
	adds r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #0xa]
	movs r2, #0x4b
	ldr r0, _0222DF28 @ =ov80_0222F53C
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	str r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222DF28: .4byte ov80_0222F53C
	thumb_func_end ov80_0222DEB8

	thumb_func_start ov80_0222DF2C
ov80_0222DF2C: @ 0x0222DF2C
	push {r3, lr}
	ldr r1, _0222DF38 @ =ov80_0222DF3C
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_0222DF38: .4byte ov80_0222DF3C
	thumb_func_end ov80_0222DF2C

	thumb_func_start ov80_0222DF3C
ov80_0222DF3C: @ 0x0222DF3C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222DF52
	movs r0, #1
	pop {r3, pc}
_0222DF52:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222DF3C

	thumb_func_start ov80_0222DF58
ov80_0222DF58: @ 0x0222DF58
	push {r3, lr}
	bl ov80_0222AC58
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222DF58

	thumb_func_start ov80_0222DF64
ov80_0222DF64: @ 0x0222DF64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x18]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r0, r5, #0
	bl ov80_0222AC58
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_02074904
	ldr r1, [sp, #0x18]
	bl FUN_02074644
	str r4, [sp]
	adds r1, r0, #0
	str r6, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	adds r0, r7, #0
	movs r2, #0xb
	bl ov80_0222F030
	movs r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222DF64

	thumb_func_start ov80_0222DFD4
ov80_0222DFD4: @ 0x0222DFD4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov80_0222F1D0
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222DFD4

	thumb_func_start ov80_0222DFF4
ov80_0222DFF4: @ 0x0222DFF4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	add r1, sp, #0x10
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, #2
	add r2, sp, #0x10
	bl ov80_022398E4
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x78
	str r0, [sp, #4]
	movs r0, #2
	ldrsh r0, [r1, r0]
	str r0, [sp, #8]
	movs r0, #0
	ldrsh r0, [r1, r0]
	str r0, [sp, #0xc]
	ldr r1, [r4]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	adds r0, r6, #0
	bl ov80_0223A00C
	ldr r1, _0222E054 @ =0x0000047B
	movs r0, #5
	movs r2, #1
	bl FUN_02004EC4
	ldr r1, _0222E058 @ =ov80_0222E05C
	adds r0, r5, #0
	bl ov80_0222AB84
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222E054: .4byte 0x0000047B
_0222E058: .4byte ov80_0222E05C
	thumb_func_end ov80_0222DFF4

	thumb_func_start ov80_0222E05C
ov80_0222E05C: @ 0x0222E05C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0209680C
	adds r4, #0x78
	ldrh r0, [r4]
	cmp r0, #1
	bne _0222E074
	movs r0, #1
	pop {r4, pc}
_0222E074:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222E05C

	thumb_func_start ov80_0222E078
ov80_0222E078: @ 0x0222E078
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_0202CF54
	adds r1, r4, #0
	bl FUN_0202D0FC
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222E078

	thumb_func_start ov80_0222E09C
ov80_0222E09C: @ 0x0222E09C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_0202CF54
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0202D144
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222E09C

	thumb_func_start ov80_0222E0C8
ov80_0222E0C8: @ 0x0222E0C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_0202CF54
	adds r1, r4, #0
	bl FUN_0202D1C0
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222E0C8

	thumb_func_start ov80_0222E0EC
ov80_0222E0EC: @ 0x0222E0EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_0205C298
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222E0EC

	thumb_func_start ov80_0222E10C
ov80_0222E10C: @ 0x0222E10C
	push {r4, lr}
	bl ov80_0222BDF4
	adds r4, r0, #0
	bl FUN_020304B4
	strh r0, [r4]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222E10C

	thumb_func_start ov80_0222E120
ov80_0222E120: @ 0x0222E120
	push {r4, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_0202C6F4
	adds r4, r0, #0
	bl FUN_021E6EBC
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_0202C4B0
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222E120

	thumb_func_start ov80_0222E144
ov80_0222E144: @ 0x0222E144
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_020270C4
	adds r0, r4, #0
	bl ov80_0222BE10
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222E144

	thumb_func_start ov80_0222E160
ov80_0222E160: @ 0x0222E160
	push {r3, lr}
	bl ov80_0222BE10
	bl FUN_020378E4
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222E160

	thumb_func_start ov80_0222E170
ov80_0222E170: @ 0x0222E170
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222BE10
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02037AC0
	ldr r1, _0222E194 @ =ov80_0222E198
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_0222E194: .4byte ov80_0222E198
	thumb_func_end ov80_0222E170

	thumb_func_start ov80_0222E198
ov80_0222E198: @ 0x0222E198
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_02037454
	cmp r0, #2
	bge _0222E1A8
	movs r4, #1
	b _0222E1B8
_0222E1A8:
	adds r0, r5, #0
	adds r0, #0x78
	ldrh r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02037B38
	adds r4, r0, #0
_0222E1B8:
	cmp r4, #0
	bne _0222E210
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r6, r0, #0
	beq _0222E210
	adds r0, #0x6f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222E210
	adds r0, r6, #0
	adds r0, #0x74
	ldrh r1, [r0]
	cmp r1, #1
	beq _0222E1E0
	ldr r0, _0222E214 @ =0x0000FFFE
	cmp r1, r0
	bne _0222E1EA
_0222E1E0:
	ldr r0, [r5]
	movs r4, #1
	adds r0, #0x39
	strb r4, [r0]
	b _0222E210
_0222E1EA:
	cmp r1, #0
	bne _0222E210
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02034818
	bl FUN_0202907C
	cmp r0, #0xc
	bne _0222E210
	adds r0, r6, #0
	movs r1, #0
	adds r0, #0x6f
	strb r1, [r0]
	adds r0, r6, #0
	bl FUN_02096BF8
_0222E210:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222E214: .4byte 0x0000FFFE
	thumb_func_end ov80_0222E198

	thumb_func_start ov80_0222E218
ov80_0222E218: @ 0x0222E218
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222BDF4
	ldr r1, [r4]
	adds r1, #0x39
	ldrb r1, [r1]
	strh r1, [r0]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0222E218

	thumb_func_start ov80_0222E22C
ov80_0222E22C: @ 0x0222E22C
	ldr r0, [r0]
	movs r1, #0
	adds r0, #0x39
	strb r1, [r0]
	movs r0, #1
	bx lr
	thumb_func_end ov80_0222E22C

	thumb_func_start ov80_0222E238
ov80_0222E238: @ 0x0222E238
	push {r3, lr}
	ldr r2, [r0, #0x1c]
	ldr r3, [r0]
	adds r1, r2, #1
	str r1, [r0, #0x1c]
	ldrb r1, [r2]
	ldr r0, [r3, #0x60]
	bl ov80_0222F5D0
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222E238

	thumb_func_start ov80_0222E250
ov80_0222E250: @ 0x0222E250
	push {r3, lr}
	ldr r2, [r0, #0x1c]
	ldr r3, [r0]
	adds r1, r2, #1
	str r1, [r0, #0x1c]
	ldrb r1, [r2]
	ldr r0, [r3, #0x60]
	bl ov80_0222F5EC
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222E250

	thumb_func_start ov80_0222E268
ov80_0222E268: @ 0x0222E268
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp, #4]
	ldr r4, [sp, #0x20]
	bl ov80_0222E2B8
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_0222E328
	cmp r4, #0
	bne _0222E2A2
	adds r0, r5, #0
	bl ov80_0222AB34
	ldr r0, [r0, #8]
	bl FUN_02096808
	ldr r0, [r0, #4]
	bl FUN_0202AD3C
	adds r2, r0, #0
	movs r0, #0
	movs r1, #1
	b _0222E2A8
_0222E2A2:
	ldrb r2, [r4]
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
_0222E2A8:
	str r0, [sp]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	bl ov80_0222E344
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222E268

	thumb_func_start ov80_0222E2B8
ov80_0222E2B8: @ 0x0222E2B8
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ov80_0222AB34
	adds r1, r4, #0
	adds r1, #0x5a
	ldrb r1, [r1]
	cmp r1, #0
	bne _0222E310
	movs r1, #0x13
	str r1, [sp]
	movs r1, #0x1b
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r1, #0xd
	str r1, [sp, #0xc]
	ldr r1, _0222E320 @ =0x0000036D
	movs r2, #1
	str r1, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r0]
	adds r1, #0x64
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r4, #0
	ldr r2, _0222E324 @ =0x000003E2
	adds r0, #0x64
	movs r1, #0
	movs r3, #0xb
	bl FUN_0200E998
	movs r0, #1
	adds r4, #0x5a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, pc}
_0222E310:
	adds r4, #0x64
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0222E320: .4byte 0x0000036D
_0222E324: .4byte 0x000003E2
	thumb_func_end ov80_0222E2B8

	thumb_func_start ov80_0222E328
ov80_0222E328: @ 0x0222E328
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r2, [r4, #0x4c]
	bl FUN_0200BB6C
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	ldr r2, [r4, #0x4c]
	bl FUN_0200CBBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222E328

	thumb_func_start ov80_0222E344
ov80_0222E344: @ 0x0222E344
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r3, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_02002B34
	ldr r0, [sp, #0x20]
	bl FUN_02002B50
	cmp r4, #0
	beq _0222E362
	cmp r4, #0xff
	bne _0222E36A
_0222E362:
	movs r0, #0
	bl FUN_02002B8C
	b _0222E370
_0222E36A:
	movs r0, #1
	bl FUN_02002B8C
_0222E370:
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	adds r0, r5, #0
	ldr r2, [r5, #0x48]
	adds r0, #0x64
	adds r1, r6, #0
	bl FUN_020200A8
	adds r5, #0x50
	strb r0, [r5]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov80_0222E344

	thumb_func_start ov80_0222E38C
ov80_0222E38C: @ 0x0222E38C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0222E39C
	bl GF_AssertFail
_0222E39C:
	adds r0, r4, #0
	adds r0, #0x64
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x64
	bl FUN_0201D520
	movs r0, #0
	adds r4, #0x5a
	strb r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222E38C

	thumb_func_start ov80_0222E3B8
ov80_0222E3B8: @ 0x0222E3B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov80_0222E2B8
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	adds r1, r6, #0
	adds r2, r7, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	ldr r0, [r5, #0x48]
	bl ov80_0222E400
	add r0, sp, #8
	ldrb r3, [r0, #0x18]
	cmp r3, #0xff
	beq _0222E3F0
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl ov80_0222E344
	pop {r3, r4, r5, r6, r7, pc}
_0222E3F0:
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	str r2, [sp]
	bl ov80_0222E344
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222E3B8

	thumb_func_start ov80_0222E400
ov80_0222E400: @ 0x0222E400
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	add r0, sp, #0
	adds r7, r3, #0
	bl FUN_0201581C
	add r0, sp, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_02015A44
	add r0, sp, #0
	movs r1, #0
	adds r2, r7, #0
	bl FUN_02015A5C
	add r2, sp, #0x10
	ldrh r2, [r2, #0x10]
	add r0, sp, #0
	movs r1, #1
	bl FUN_02015A5C
	add r0, sp, #0
	movs r1, #0x20
	bl FUN_02015898
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_020263D4
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222E400

	thumb_func_start ov80_0222E450
ov80_0222E450: @ 0x0222E450
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldr r1, [sp, #0x28]
	adds r7, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	cmp r1, #0
	bne _0222E47E
	ldr r3, [r7, #0x34]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xbf
	bl FUN_0200BAF8
	adds r1, r6, #0
	adds r1, #0x8c
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0x97
	ldrb r1, [r0]
	movs r0, #2
	orrs r1, r0
	b _0222E48E
_0222E47E:
	adds r0, r6, #0
	adds r0, #0x8c
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x97
	ldrb r1, [r0]
	movs r0, #2
	bics r1, r0
_0222E48E:
	adds r0, r6, #0
	adds r0, #0x97
	strb r1, [r0]
	adds r0, r6, #0
	ldr r1, [sp, #0x24]
	adds r0, #0x90
	str r1, [r0]
	adds r0, r6, #0
	ldr r1, [sp, #0x20]
	str r7, [r6]
	adds r0, #0xa0
	str r1, [r0]
	adds r1, r6, #0
	adds r1, #0xa0
	ldr r1, [r1]
	movs r0, #0
	strh r0, [r1]
	adds r1, r6, #0
	adds r1, #0x97
	ldrb r3, [r1]
	movs r1, #1
	bics r3, r1
	add r1, sp, #8
	ldrb r2, [r1, #0x14]
	movs r1, #1
	ands r1, r2
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r6, #0
	adds r1, #0x97
	strb r2, [r1]
	add r1, sp, #8
	adds r2, r6, #0
	ldrb r1, [r1, #0x10]
	adds r2, #0x96
	movs r3, #3
	strb r1, [r2]
	adds r2, r6, #0
	adds r2, #0x98
	strb r4, [r2]
	adds r2, r6, #0
	adds r2, #0x99
	strb r5, [r2]
	adds r2, r6, #0
	adds r2, #0x9b
	strb r0, [r2]
	adds r2, r7, #0
	adds r2, #0x64
	str r2, [r6, #0x18]
	adds r2, r6, #0
	adds r2, #0x94
	strb r3, [r2]
	movs r2, #0xb5
	lsls r2, r2, #2
	strh r1, [r6, r2]
	adds r3, r6, #0
	adds r2, r0, #0
_0222E500:
	adds r1, r3, #0
	adds r1, #0xb4
	str r2, [r1]
	adds r1, r3, #0
	adds r1, #0xb8
	adds r0, r0, #1
	adds r3, #8
	str r2, [r1]
	cmp r0, #0x1c
	blt _0222E500
	adds r0, r6, #0
	adds r1, r6, #0
	movs r5, #0
	movs r4, #0xff
_0222E51C:
	movs r3, #0x6f
	lsls r3, r3, #2
	str r5, [r0, r3]
	adds r3, r3, #4
	str r5, [r0, r3]
	movs r3, #0xa7
	lsls r3, r3, #2
	strh r4, [r1, r3]
	adds r2, r2, #1
	adds r0, #8
	adds r1, r1, #2
	cmp r2, #0x1c
	blt _0222E51C
	adds r4, r6, #0
_0222E538:
	ldr r1, [r7, #0x34]
	movs r0, #0x50
	bl FUN_02026354
	str r0, [r4, #0x1c]
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #0x1c
	blt _0222E538
	adds r6, #0xa0
	ldr r1, _0222E554 @ =0x0000EEEE
	ldr r0, [r6]
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E554: .4byte 0x0000EEEE
	thumb_func_end ov80_0222E450

	thumb_func_start ov80_0222E558
ov80_0222E558: @ 0x0222E558
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r2, [sp, #0x14]
	adds r7, r1, #0
	movs r1, #0xb6
	ldr r0, [r5, #0x34]
	lsls r1, r1, #2
	adds r4, r3, #0
	bl FUN_0201AA8C
	adds r6, r0, #0
	bne _0222E578
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E578:
	movs r2, #0xb6
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	str r4, [sp]
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	adds r1, r6, #0
	adds r2, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	adds r0, r5, #0
	bl ov80_0222E450
	adds r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222E558

	thumb_func_start ov80_0222E5A8
ov80_0222E5A8: @ 0x0222E5A8
	push {r3, lr}
	bl ov80_0222E690
	pop {r3, pc}
	thumb_func_end ov80_0222E5A8

	thumb_func_start ov80_0222E5B0
ov80_0222E5B0: @ 0x0222E5B0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222E714
	movs r1, #7
	tst r1, r0
	bne _0222E5CE
	lsrs r0, r0, #3
	b _0222E5D2
_0222E5CE:
	lsrs r0, r0, #3
	adds r0, r0, #1
_0222E5D2:
	adds r1, r5, #0
	adds r1, #0x97
	ldrb r1, [r1]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	beq _0222E5EC
	adds r1, r5, #0
	adds r1, #0x98
	ldrb r1, [r1]
	subs r2, r1, r0
	adds r1, r5, #0
	adds r1, #0x98
	strb r2, [r1]
_0222E5EC:
	adds r1, r5, #0
	adds r1, #0x97
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	beq _0222E60E
	adds r1, r5, #0
	adds r1, #0x99
	ldrb r2, [r1]
	adds r1, r5, #0
	adds r1, #0x9b
	ldrb r1, [r1]
	lsls r1, r1, #1
	subs r2, r2, r1
	adds r1, r5, #0
	adds r1, #0x99
	strb r2, [r1]
_0222E60E:
	adds r1, r5, #0
	adds r1, #0x99
	ldrb r1, [r1]
	lsls r0, r0, #0x18
	adds r3, r5, #0
	str r1, [sp]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	adds r1, r5, #0
	movs r2, #1
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	adds r3, #0x98
	ldrb r3, [r3]
	ldr r0, [r4]
	adds r1, #8
	bl FUN_0201D40C
	adds r0, r5, #0
	ldr r2, _0222E688 @ =0x000003D9
	adds r0, #8
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E580
	adds r0, r5, #0
	bl ov80_0222E754
	ldr r2, [r5]
	adds r1, r5, #0
	adds r1, #0x96
	ldr r2, [r2, #0x34]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	ldrb r1, [r1]
	adds r0, #0xa4
	lsrs r2, r2, #0x18
	bl FUN_02001B9C
	adds r1, r5, #0
	adds r1, #0xb0
	str r0, [r1]
	adds r0, r5, #0
	bl ov80_0222E8FC
	ldr r0, _0222E68C @ =ov80_0222E7C8
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r5, #4]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0222E688: .4byte 0x000003D9
_0222E68C: .4byte ov80_0222E7C8
	thumb_func_end ov80_0222E5B0

	thumb_func_start ov80_0222E690
ov80_0222E690: @ 0x0222E690
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	movs r0, #0x50
	ldr r1, [r1, #0x34]
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp]
	adds r2, r4, #0
	bl FUN_0200BB6C
	adds r1, r5, #0
	adds r1, #0x9b
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r0, #0x90
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r5, r0
	lsls r1, r1, #3
	adds r1, r5, r1
	ldr r0, [r0, #0x1c]
	adds r1, #0xb4
	str r0, [r1]
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0xa7
	lsls r0, r0, #2
	strh r6, [r1, r0]
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r5, r0
	adds r0, #0xb8
	str r7, [r0]
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	adds r5, #0x9b
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222E690

	thumb_func_start ov80_0222E714
ov80_0222E714: @ 0x0222E714
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	movs r6, #0
	adds r4, r6, #0
	cmp r0, #0
	ble _0222E74C
	adds r5, r7, #0
_0222E726:
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r1, [r0]
	cmp r1, #0
	beq _0222E74C
	movs r0, #0
	adds r2, r0, #0
	bl FUN_02002F30
	cmp r6, r0
	bhs _0222E73E
	adds r6, r0, #0
_0222E73E:
	adds r0, r7, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	adds r4, r4, #1
	adds r5, #8
	cmp r4, r0
	blt _0222E726
_0222E74C:
	adds r6, #0xc
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222E714

	thumb_func_start ov80_0222E754
ov80_0222E754: @ 0x0222E754
	adds r2, r0, #0
	adds r1, r0, #0
	adds r2, #0xb4
	adds r1, #0xa4
	str r2, [r1]
	adds r2, r0, #0
	adds r1, r0, #0
	adds r2, #8
	adds r1, #0xa8
	str r2, [r1]
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0xac
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #1
	adds r1, #0xad
	strb r2, [r1]
	adds r1, r0, #0
	adds r1, #0x9b
	ldrb r2, [r1]
	adds r1, r0, #0
	adds r1, #0xae
	strb r2, [r1]
	adds r2, r0, #0
	adds r2, #0xaf
	ldrb r3, [r2]
	movs r2, #0xf
	adds r1, r0, #0
	bics r3, r2
	adds r2, r0, #0
	adds r2, #0xaf
	strb r3, [r2]
	adds r2, r0, #0
	adds r2, #0xaf
	ldrb r3, [r2]
	movs r2, #0x30
	adds r1, #0xaf
	bics r3, r2
	adds r2, r0, #0
	adds r2, #0xaf
	strb r3, [r2]
	adds r0, #0x9b
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, #4
	blo _0222E7BE
	movs r0, #0xc0
	bics r2, r0
	movs r0, #0x40
	orrs r0, r2
	strb r0, [r1]
	bx lr
_0222E7BE:
	movs r0, #0xc0
	bics r2, r0
	strb r2, [r1]
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222E754

	thumb_func_start ov80_0222E7C8
ov80_0222E7C8: @ 0x0222E7C8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222E7E4
	adds r0, r5, #0
	adds r0, #0x94
	ldrb r0, [r0]
	adds r5, #0x94
	subs r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
_0222E7E4:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222E87E
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02001BE0
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222E814
	bl FUN_02025358
	cmp r0, #1
	bne _0222E814
	adds r0, r5, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02001C94
	adds r4, r0, #0
_0222E814:
	ldr r0, _0222E880 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	bne _0222E830
	movs r1, #0x80
	tst r1, r0
	bne _0222E830
	movs r1, #0x20
	tst r1, r0
	bne _0222E830
	movs r1, #0x10
	tst r0, r1
	beq _0222E836
_0222E830:
	adds r0, r5, #0
	bl ov80_0222E8FC
_0222E836:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0222E884 @ =0x0000EEDD
	ldrh r2, [r0]
	cmp r2, r1
	bne _0222E84C
	adds r0, r5, #0
	bl ov80_0222E88C
	pop {r3, r4, r5, pc}
_0222E84C:
	movs r1, #1
	mvns r1, r1
	cmp r4, r1
	beq _0222E85C
	adds r1, r1, #1
	cmp r4, r1
	beq _0222E87E
	b _0222E876
_0222E85C:
	adds r1, r5, #0
	adds r1, #0x97
	ldrb r1, [r1]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _0222E87E
	ldr r1, _0222E888 @ =0x0000FFFE
	strh r1, [r0]
	adds r0, r5, #0
	bl ov80_0222E88C
	pop {r3, r4, r5, pc}
_0222E876:
	strh r4, [r0]
	adds r0, r5, #0
	bl ov80_0222E88C
_0222E87E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222E880: .4byte 0x021D110C
_0222E884: .4byte 0x0000EEDD
_0222E888: .4byte 0x0000FFFE
	thumb_func_end ov80_0222E7C8

	thumb_func_start ov80_0222E88C
ov80_0222E88C: @ 0x0222E88C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _0222E8F8 @ =0x000005DC
	ldr r7, [r6]
	bl FUN_0200604C
	adds r0, r6, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #0
	bl FUN_02001BC4
	adds r0, r6, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r6, #0
	adds r0, #0xa8
	ldr r0, [r0]
	bl FUN_0201D520
	movs r4, #0
	adds r5, r6, #0
_0222E8BE:
	ldr r0, [r5, #0x1c]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x1c
	blt _0222E8BE
	adds r0, r6, #0
	adds r0, #0x97
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222E8E4
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200BB44
_0222E8E4:
	ldr r0, [r6, #4]
	bl FUN_0200E390
	adds r0, r6, #0
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E8F8: .4byte 0x000005DC
	thumb_func_end ov80_0222E88C

	thumb_func_start ov80_0222E8FC
ov80_0222E8FC: @ 0x0222E8FC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xb0
	ldr r0, [r0]
	bl FUN_02001C94
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r0, #0xa7
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	cmp r1, #0xff
	beq _0222E91E
	adds r0, r4, #0
	movs r2, #0
	bl ov80_0222EE14
_0222E91E:
	pop {r4, pc}
	thumb_func_end ov80_0222E8FC

	thumb_func_start ov80_0222E920
ov80_0222E920: @ 0x0222E920
	push {r4, lr}
	sub sp, #0x10
	add r4, sp, #8
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #4]
	ldr r4, [sp, #0x20]
	str r4, [sp, #8]
	ldr r4, [sp, #0x24]
	str r4, [sp, #0xc]
	bl ov80_0222E558
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222E920

	thumb_func_start ov80_0222E940
ov80_0222E940: @ 0x0222E940
	push {r3, lr}
	bl ov80_0222EA74
	pop {r3, pc}
	thumb_func_end ov80_0222E940

	thumb_func_start ov80_0222E948
ov80_0222E948: @ 0x0222E948
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222EB14
	movs r1, #7
	tst r1, r0
	bne _0222E966
	lsrs r1, r0, #3
	b _0222E96A
_0222E966:
	lsrs r0, r0, #3
	adds r1, r0, #1
_0222E96A:
	adds r0, r5, #0
	adds r0, #0x97
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	beq _0222E984
	adds r0, r5, #0
	adds r0, #0x98
	ldrb r0, [r0]
	subs r2, r0, r1
	adds r0, r5, #0
	adds r0, #0x98
	strb r2, [r0]
_0222E984:
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	cmp r0, #8
	bls _0222E9D4
	adds r0, r5, #0
	adds r0, #0x97
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	beq _0222E9A8
	adds r0, r5, #0
	adds r0, #0x99
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x99
	subs r2, #0x10
	strb r2, [r0]
_0222E9A8:
	adds r0, r5, #0
	adds r0, #0x99
	ldrb r0, [r0]
	adds r3, r5, #0
	movs r2, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	adds r3, #0x98
	adds r1, r5, #0
	ldrb r3, [r3]
	ldr r0, [r4]
	adds r1, #8
	bl FUN_0201D40C
	b _0222EA22
_0222E9D4:
	adds r2, r5, #0
	adds r2, #0x97
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1f
	beq _0222E9F0
	adds r2, r5, #0
	adds r2, #0x99
	ldrb r2, [r2]
	lsls r0, r0, #1
	subs r2, r2, r0
	adds r0, r5, #0
	adds r0, #0x99
	strb r2, [r0]
_0222E9F0:
	adds r0, r5, #0
	adds r0, #0x99
	ldrb r0, [r0]
	adds r3, r5, #0
	movs r2, #1
	str r0, [sp]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r3, #0x98
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrb r3, [r3]
	ldr r0, [r4]
	adds r1, #8
	bl FUN_0201D40C
_0222EA22:
	adds r0, r5, #0
	ldr r2, _0222EA6C @ =0x000003D9
	adds r0, #8
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E580
	adds r0, r5, #0
	bl ov80_0222EB54
	ldr r3, [r5]
	adds r2, r5, #0
	adds r2, #0x96
	ldr r3, [r3, #0x34]
	movs r0, #0x65
	lsls r0, r0, #2
	lsls r3, r3, #0x18
	ldrb r2, [r2]
	adds r0, r5, r0
	movs r1, #0
	lsrs r3, r3, #0x18
	bl FUN_020011DC
	movs r1, #0x6d
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r5, #0
	bl ov80_0222EE7C
	ldr r0, _0222EA70 @ =ov80_0222EC90
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E320
	str r0, [r5, #4]
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_0222EA6C: .4byte 0x000003D9
_0222EA70: .4byte ov80_0222EC90
	thumb_func_end ov80_0222E948

	thumb_func_start ov80_0222EA74
ov80_0222EA74: @ 0x0222EA74
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	movs r0, #0x50
	ldr r1, [r1, #0x34]
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_02026354
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp]
	adds r2, r6, #0
	bl FUN_0200BB6C
	adds r1, r5, #0
	adds r1, #0x9b
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r0, #0x90
	lsls r1, r1, #2
	adds r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r5, r0
	lsls r1, r1, #3
	adds r2, r5, r1
	movs r1, #0x6f
	ldr r0, [r0, #0x1c]
	lsls r1, r1, #2
	str r0, [r2, r1]
	adds r0, r6, #0
	bl FUN_02026380
	cmp r4, #0xfa
	bne _0222EAE6
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	movs r2, #2
	mvns r2, r2
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #7
	lsls r0, r0, #6
	str r2, [r1, r0]
	b _0222EAF6
_0222EAE6:
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, r5, r0
	movs r0, #7
	lsls r0, r0, #6
	str r4, [r1, r0]
_0222EAF6:
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0xa7
	lsls r0, r0, #2
	strh r7, [r1, r0]
	adds r0, r5, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	adds r5, #0x9b
	adds r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222EA74

	thumb_func_start ov80_0222EB14
ov80_0222EB14: @ 0x0222EB14
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	movs r6, #0
	adds r4, r6, #0
	cmp r0, #0
	ble _0222EB4C
	adds r5, r7, #0
_0222EB26:
	movs r0, #0x6f
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222EB4C
	movs r0, #0
	adds r2, r0, #0
	bl FUN_02002F30
	cmp r6, r0
	bhs _0222EB3E
	adds r6, r0, #0
_0222EB3E:
	adds r0, r7, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	adds r4, r4, #1
	adds r5, #8
	cmp r4, r0
	blt _0222EB26
_0222EB4C:
	adds r6, #0xc
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0222EB14

	thumb_func_start ov80_0222EB54
ov80_0222EB54: @ 0x0222EB54
	push {r4, r5}
	movs r3, #0x6f
	lsls r3, r3, #2
	adds r1, r3, #0
	adds r2, r0, r3
	subs r1, #0x28
	str r2, [r0, r1]
	adds r1, r3, #0
	ldr r2, _0222EC4C @ =ov80_0222EC84
	subs r1, #0x24
	str r2, [r0, r1]
	adds r1, r3, #0
	ldr r2, _0222EC50 @ =ov80_0222EC60
	subs r1, #0x20
	str r2, [r0, r1]
	adds r2, r0, #0
	adds r1, r3, #0
	adds r2, #8
	subs r1, #0x1c
	str r2, [r0, r1]
	adds r1, r0, #0
	adds r1, #0x9b
	ldrb r2, [r1]
	adds r1, r3, #0
	subs r1, #0x18
	strh r2, [r0, r1]
	adds r1, r3, #0
	movs r2, #8
	subs r1, #0x16
	strh r2, [r0, r1]
	adds r1, r3, #0
	movs r2, #1
	subs r1, #0x14
	strb r2, [r0, r1]
	adds r1, r3, #0
	movs r4, #0xc
	subs r1, #0x13
	strb r4, [r0, r1]
	adds r1, r3, #0
	movs r4, #2
	subs r1, #0x12
	strb r4, [r0, r1]
	adds r1, r3, #0
	subs r1, #0x11
	ldrb r4, [r0, r1]
	movs r1, #0xf
	bics r4, r1
	orrs r4, r2
	adds r2, r3, #0
	subs r2, #0x11
	strb r4, [r0, r2]
	adds r2, r3, #0
	subs r2, #0x11
	ldrb r5, [r0, r2]
	movs r2, #0xf0
	movs r4, #0x10
	bics r5, r2
	orrs r5, r4
	adds r4, r3, #0
	subs r4, #0x11
	strb r5, [r0, r4]
	adds r4, r3, #0
	subs r4, #0x10
	ldrb r4, [r0, r4]
	bics r4, r1
	movs r1, #0xf
	orrs r4, r1
	adds r1, r3, #0
	subs r1, #0x10
	strb r4, [r0, r1]
	adds r1, r3, #0
	subs r1, #0x10
	ldrb r4, [r0, r1]
	movs r1, #0x20
	bics r4, r2
	adds r2, r4, #0
	orrs r2, r1
	adds r1, r3, #0
	subs r1, #0x10
	strb r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0xe
	ldrh r2, [r0, r1]
	movs r1, #7
	bics r2, r1
	adds r1, r3, #0
	subs r1, #0xe
	strh r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0xe
	ldrh r2, [r0, r1]
	movs r1, #0x78
	bics r2, r1
	adds r1, r3, #0
	subs r1, #0xe
	strh r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC54 @ =0xFFFFFE7F
	ands r2, r1
	adds r1, r3, #0
	subs r1, #0xe
	strh r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC58 @ =0xFFFF81FF
	ands r2, r1
	adds r1, r3, #0
	subs r1, #0xe
	strh r2, [r0, r1]
	adds r1, r3, #0
	subs r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC5C @ =0xFFFF7FFF
	ands r2, r1
	adds r1, r3, #0
	subs r1, #0xe
	strh r2, [r0, r1]
	subs r3, #0xc
	str r0, [r0, r3]
	pop {r4, r5}
	bx lr
	.align 2, 0
_0222EC4C: .4byte ov80_0222EC84
_0222EC50: .4byte ov80_0222EC60
_0222EC54: .4byte 0xFFFFFE7F
_0222EC58: .4byte 0xFFFF81FF
_0222EC5C: .4byte 0xFFFF7FFF
	thumb_func_end ov80_0222EB54

	thumb_func_start ov80_0222EC60
ov80_0222EC60: @ 0x0222EC60
	push {r3, lr}
	movs r2, #2
	mvns r2, r2
	cmp r1, r2
	bne _0222EC76
	movs r1, #3
	movs r2, #0xf
	movs r3, #4
	bl FUN_02001488
	pop {r3, pc}
_0222EC76:
	movs r1, #1
	movs r2, #0xf
	movs r3, #2
	bl FUN_02001488
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222EC60

	thumb_func_start ov80_0222EC84
ov80_0222EC84: @ 0x0222EC84
	ldr r3, _0222EC8C @ =FUN_02001508
	movs r1, #0x13
	bx r3
	nop
_0222EC8C: .4byte FUN_02001508
	thumb_func_end ov80_0222EC84

	thumb_func_start ov80_0222EC90
ov80_0222EC90: @ 0x0222EC90
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r0, r5, #0
	adds r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222ECAC
	adds r0, r5, #0
	adds r0, #0x94
	ldrb r0, [r0]
	adds r5, #0x94
	subs r0, r0, #1
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_0222ECAC:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0222ED8C
	movs r0, #0x6d
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02001338
	adds r4, r0, #0
	movs r0, #0x6d
	movs r1, #0xb5
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldrh r6, [r5, r1]
	ldr r0, [r5, r0]
	adds r1, r5, r1
	bl FUN_020014DC
	movs r0, #0xb5
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r6, r0
	beq _0222ECE2
	ldr r0, _0222ED90 @ =0x000005DC
	bl FUN_0200604C
_0222ECE2:
	ldr r0, _0222ED94 @ =0x021D110C
	movs r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	bne _0222ECFE
	movs r1, #0x80
	tst r1, r0
	bne _0222ECFE
	movs r1, #0x20
	tst r1, r0
	bne _0222ECFE
	movs r1, #0x10
	tst r0, r1
	beq _0222ED04
_0222ECFE:
	adds r0, r5, #0
	bl ov80_0222EE7C
_0222ED04:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222ED26
	bl FUN_02025358
	cmp r0, #1
	bne _0222ED26
	movs r1, #0xb5
	movs r0, #0x6d
	lsls r1, r1, #2
	lsls r0, r0, #2
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl FUN_020014FC
	adds r4, r0, #0
_0222ED26:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldrh r1, [r0]
	ldr r0, _0222ED98 @ =0x0000EEDD
	cmp r1, r0
	bne _0222ED3E
	adds r0, r5, #0
	movs r1, #0
	bl ov80_0222EDA0
	pop {r4, r5, r6, pc}
_0222ED3E:
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _0222ED4E
	adds r0, r0, #1
	cmp r4, r0
	beq _0222ED8C
	b _0222ED76
_0222ED4E:
	adds r0, r5, #0
	adds r0, #0x97
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222ED8C
	ldr r0, _0222ED90 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r1, _0222ED9C @ =0x0000FFFE
	ldr r0, [r0]
	strh r1, [r0]
	adds r0, r5, #0
	movs r1, #1
	bl ov80_0222EDA0
	pop {r4, r5, r6, pc}
_0222ED76:
	ldr r0, _0222ED90 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	movs r1, #1
	strh r4, [r0]
	adds r0, r5, #0
	bl ov80_0222EDA0
_0222ED8C:
	pop {r4, r5, r6, pc}
	nop
_0222ED90: .4byte 0x000005DC
_0222ED94: .4byte 0x021D110C
_0222ED98: .4byte 0x0000EEDD
_0222ED9C: .4byte 0x0000FFFE
	thumb_func_end ov80_0222EC90

	thumb_func_start ov80_0222EDA0
ov80_0222EDA0: @ 0x0222EDA0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r7, [r6]
	cmp r1, #1
	bne _0222EDB0
	ldr r0, _0222EE10 @ =0x000005DC
	bl FUN_0200604C
_0222EDB0:
	movs r0, #0x6d
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r6, r0]
	adds r2, r1, #0
	bl FUN_02001434
	movs r0, #0x1a
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r6, #0
	adds r0, #8
	bl FUN_0201D520
	movs r4, #0
	adds r5, r6, #0
_0222EDD6:
	ldr r0, [r5, #0x1c]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x1c
	blt _0222EDD6
	adds r0, r6, #0
	adds r0, #0x97
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222EDFC
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200BB44
_0222EDFC:
	ldr r0, [r6, #4]
	bl FUN_0200E390
	adds r0, r6, #0
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EE10: .4byte 0x000005DC
	thumb_func_end ov80_0222EDA0

	thumb_func_start ov80_0222EE14
ov80_0222EE14: @ 0x0222EE14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	str r1, [sp, #0xc]
	ldr r1, [r5]
	movs r0, #0x50
	ldr r1, [r1, #0x34]
	adds r7, r2, #0
	bl FUN_02026354
	ldr r1, [r5]
	adds r4, r0, #0
	ldr r1, [r1, #0x34]
	movs r0, #0x50
	bl FUN_02026354
	adds r6, r0, #0
	ldr r0, [r5, #0x18]
	movs r1, #0xf
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	adds r2, r4, #0
	bl FUN_0200BB6C
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #0x18]
	movs r1, #1
	adds r2, r6, #0
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222EE14

	thumb_func_start ov80_0222EE7C
ov80_0222EE7C: @ 0x0222EE7C
	push {r4, lr}
	movs r1, #0x6d
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #6
	adds r1, r4, r1
	bl FUN_020014DC
	ldr r0, _0222EEA8 @ =0x000001BA
	ldrh r1, [r4, r0]
	adds r0, #0xe2
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1, r0]
	cmp r1, #0xff
	beq _0222EEA6
	adds r0, r4, #0
	movs r2, #0
	bl ov80_0222EE14
_0222EEA6:
	pop {r4, pc}
	.align 2, 0
_0222EEA8: .4byte 0x000001BA
	thumb_func_end ov80_0222EE7C

	thumb_func_start ov80_0222EEAC
ov80_0222EEAC: @ 0x0222EEAC
	push {r3, lr}
	cmp r0, #0
	beq _0222EEC2
	adds r1, r0, #0
	adds r1, #0xa0
	ldr r2, _0222EEC4 @ =0x0000FFFE
	ldr r1, [r1]
	strh r2, [r1]
	movs r1, #0
	bl ov80_0222EDA0
_0222EEC2:
	pop {r3, pc}
	.align 2, 0
_0222EEC4: .4byte 0x0000FFFE
	thumb_func_end ov80_0222EEAC

	thumb_func_start ov80_0222EEC8
ov80_0222EEC8: @ 0x0222EEC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5, #0xc]
	ldrh r4, [r0]
	ldrh r6, [r0, #2]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0222EEE8
	cmp r0, #1
	beq _0222EEF6
	cmp r0, #2
	beq _0222EF9A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222EEE8:
	ldr r0, _0222EFC8 @ =0x0000FD13
	cmp r4, r0
	bne _0222EEF6
	movs r0, #2
	add sp, #8
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222EEF6:
	ldr r0, [r5, #0x14]
	movs r1, #5
	ldr r0, [r0]
	bl FUN_02228188
	cmp r0, #0
	bne _0222EFC2
	cmp r4, #0x20
	blo _0222EF2E
	cmp r4, #0x26
	bhi _0222EF2E
	movs r0, #2
	ldrsh r1, [r5, r0]
	subs r4, #0x20
	adds r1, r1, #1
	strh r1, [r5, #2]
	ldrsh r1, [r5, r0]
	ldr r0, _0222EFCC @ =0x0223BD44
	ldrb r0, [r0, r4]
	cmp r1, r0
	blt _0222EFC2
	movs r0, #0
	strh r0, [r5, #2]
	ldr r0, [r5, #0xc]
	add sp, #8
	adds r0, r0, #4
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF2E:
	cmp r4, #0x27
	blo _0222EF66
	cmp r4, #0x29
	bhs _0222EF66
	cmp r4, #0x27
	beq _0222EF40
	cmp r4, #0x28
	beq _0222EF4C
	b _0222EF58
_0222EF40:
	ldr r0, [r5, #0x14]
	movs r1, #1
	ldr r0, [r0, #4]
	bl FUN_02229200
	b _0222EF5C
_0222EF4C:
	ldr r0, [r5, #0x14]
	movs r1, #0
	ldr r0, [r0, #4]
	bl FUN_02229200
	b _0222EF5C
_0222EF58:
	bl GF_AssertFail
_0222EF5C:
	ldr r0, [r5, #0xc]
	add sp, #8
	adds r0, r0, #4
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF66:
	ldr r1, [r5, #0x14]
	ldrh r2, [r5, #4]
	ldr r1, [r1]
	add r0, sp, #0
	adds r3, r4, #0
	bl ov80_0222EFD0
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl FUN_022299C0
	ldrb r0, [r5, #1]
	adds r0, r0, #1
	strb r0, [r5, #1]
	ldrb r0, [r5, #1]
	cmp r0, r6
	blt _0222EF92
	movs r0, #0
	strb r0, [r5, #1]
	ldr r0, [r5, #0xc]
	adds r0, r0, #4
	str r0, [r5, #0xc]
_0222EF92:
	movs r0, #0
	add sp, #8
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF9A:
	ldr r0, [r5, #0x14]
	movs r1, #5
	ldr r0, [r0]
	bl FUN_02228188
	cmp r0, #0
	bne _0222EFC2
	ldr r1, [r5, #8]
	ldrb r0, [r1]
	subs r0, r0, #1
	strb r0, [r1]
	ldr r0, [r5, #0x14]
	movs r1, #0
	str r1, [r0, #0x38]
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r7, #0
	bl FUN_0200E390
_0222EFC2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EFC8: .4byte 0x0000FD13
_0222EFCC: .4byte 0x0223BD44
	thumb_func_end ov80_0222EEC8

	thumb_func_start ov80_0222EFD0
ov80_0222EFD0: @ 0x0222EFD0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	strb r2, [r4, #7]
	ldr r0, _0222F028 @ =0x0223DC22
	lsls r2, r3, #2
	ldrh r0, [r0, r2]
	strb r0, [r4, #6]
	ldr r0, _0222F02C @ =_0223DC20
	ldrh r0, [r0, r2]
	strh r0, [r4, #4]
	cmp r0, #2
	beq _0222EFF2
	cmp r0, #3
	beq _0222EFF2
	cmp r0, #6
	bne _0222F00C
_0222EFF2:
	adds r0, r1, #0
	bl FUN_022282E8
	add r1, sp, #0
	strh r0, [r1, #4]
	lsrs r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	add sp, #8
	strh r0, [r4]
	ldrh r0, [r1, #6]
	strh r0, [r4, #2]
	pop {r4, pc}
_0222F00C:
	adds r0, r1, #0
	bl FUN_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	add sp, #8
	pop {r4, pc}
	nop
_0222F028: .4byte 0x0223DC22
_0222F02C: .4byte _0223DC20
	thumb_func_end ov80_0222EFD0

	thumb_func_start ov80_0222F030
ov80_0222F030: @ 0x0222F030
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	adds r5, r0, #0
	ldr r0, [r5, #4]
	str r1, [sp, #0x20]
	str r0, [sp, #0x2c]
	ldr r7, [r5, #0x34]
	ldr r6, [r5, #0x38]
	movs r0, #8
	adds r1, r2, #0
	str r2, [sp, #0x24]
	adds r4, r3, #0
	bl FUN_02007688
	str r0, [sp, #0x30]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x30]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #0x70
	str r4, [sp, #8]
	bl FUN_0200D504
	ldr r0, [sp, #0x30]
	movs r1, #2
	str r0, [sp]
	movs r0, #0x6f
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	adds r2, r7, #0
	adds r3, r6, #0
	str r4, [sp, #0x14]
	bl FUN_0200D68C
	movs r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x30]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #0x71
	str r4, [sp, #4]
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x30]
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #0x72
	str r4, [sp, #4]
	bl FUN_0200D71C
	ldr r0, [sp, #0x30]
	bl FUN_0200770C
	add r0, sp, #0x38
	movs r1, #0
	movs r2, #0x34
	blx FUN_020D4994
	ldr r0, [sp, #0x90]
	add r1, sp, #0x38
	strh r0, [r1]
	ldr r0, [sp, #0x94]
	strh r0, [r1, #2]
	movs r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	ldr r1, [sp, #0x98]
	str r0, [sp, #0x44]
	str r1, [sp, #0x40]
	movs r1, #1
	str r1, [sp, #0x48]
	ldr r1, [sp, #0x9c]
	str r0, [sp, #0x68]
	str r1, [sp, #0x64]
	add r1, sp, #0x38
_0222F0DA:
	adds r0, r0, #1
	str r4, [r1, #0x14]
	adds r1, r1, #4
	cmp r0, #6
	blt _0222F0DA
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #0x38
	bl FUN_0200D734
	adds r6, r0, #0
	bl FUN_0200DC18
	movs r1, #0x32
	ldr r0, [sp, #0x24]
	lsls r1, r1, #6
	bl FUN_0201AA8C
	str r0, [sp, #0x28]
	movs r1, #0
	ldr r0, [sp, #0x20]
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x20]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	ldr r1, [sp, #0x20]
	add r0, sp, #0x6c
	movs r2, #2
	bl FUN_02070124
	movs r3, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, sp, #0x38
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x24]
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	movs r0, #2
	str r0, [sp, #0x18]
	str r7, [sp, #0x1c]
	ldrh r0, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	bl FUN_02014494
	ldr r0, [r6]
	bl FUN_02024B1C
	adds r7, r0, #0
	ldr r0, [sp, #0x28]
	movs r1, #4
	blx FUN_020D2894
	movs r2, #0x32
	ldr r0, [sp, #0x28]
	ldr r1, [r7, #4]
	lsls r2, r2, #6
	blx FUN_020CFE74
	ldr r0, [r6]
	bl FUN_02024B34
	movs r1, #1
	bl FUN_02022808
	lsls r7, r0, #4
	movs r0, #2
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r7, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	add r2, sp, #0x38
	ldrh r1, [r2, #0x34]
	ldrh r2, [r2, #0x38]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	bl FUN_02003200
	ldr r0, [sp, #0xa0]
	cmp r0, #0
	ble _0222F1AE
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x80
	ldrh r0, [r0, #0x24]
	lsls r2, r7, #0x10
	movs r1, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	lsrs r2, r2, #0x10
	movs r3, #0x10
	bl FUN_02003E5C
_0222F1AE:
	ldr r0, [sp, #0x28]
	bl FUN_0201AB0C
	ldr r0, _0222F1CC @ =0x0000C350
	adds r5, #0x80
	subs r0, r4, r0
	lsls r4, r0, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _0222F1C6
	bl GF_AssertFail
_0222F1C6:
	str r6, [r5, r4]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222F1CC: .4byte 0x0000C350
	thumb_func_end ov80_0222F030

	thumb_func_start ov80_0222F1D0
ov80_0222F1D0: @ 0x0222F1D0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222F20C @ =0x0000C350
	adds r6, r1, #0
	adds r4, r5, #0
	subs r0, r6, r0
	adds r4, #0x80
	lsls r7, r0, #2
	ldr r0, [r4, r7]
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r4, r7]
	ldr r0, [r5, #0x38]
	adds r1, r6, #0
	bl FUN_0200D958
	ldr r0, [r5, #0x38]
	adds r1, r6, #0
	bl FUN_0200D968
	ldr r0, [r5, #0x38]
	adds r1, r6, #0
	bl FUN_0200D978
	ldr r0, [r5, #0x38]
	adds r1, r6, #0
	bl FUN_0200D988
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F20C: .4byte 0x0000C350
	thumb_func_end ov80_0222F1D0

	thumb_func_start ov80_0222F210
ov80_0222F210: @ 0x0222F210
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	bl FUN_02074490
	movs r1, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x7d
	lsls r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	movs r1, #2
	bl FUN_0200D644
	bl FUN_02074498
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x7d
	lsls r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	movs r2, #0x14
	bl FUN_0200D6D4
	bl FUN_020744A4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x7d
	lsls r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	movs r2, #0x14
	bl FUN_0200D704
	add sp, #0x18
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222F210

	thumb_func_start ov80_0222F278
ov80_0222F278: @ 0x0222F278
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x7d
	ldr r0, [r4, #0x38]
	lsls r1, r1, #4
	bl FUN_0200D978
	movs r1, #0x7d
	ldr r0, [r4, #0x38]
	lsls r1, r1, #4
	bl FUN_0200D988
	movs r1, #0x7d
	ldr r0, [r4, #0x38]
	lsls r1, r1, #4
	bl FUN_0200D968
	pop {r4, pc}
	thumb_func_end ov80_0222F278

	thumb_func_start ov80_0222F29C
ov80_0222F29C: @ 0x0222F29C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r4, r2, #0
	adds r5, r0, #0
	adds r7, r1, #0
	str r3, [sp, #0xc]
	cmp r4, #8
	blt _0222F2B0
	bl GF_AssertFail
_0222F2B0:
	adds r0, r7, #0
	bl FUN_020741B0
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x7d
	lsls r0, r0, #4
	adds r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	movs r2, #0x14
	bl FUN_0200E188
	ldr r6, _0222F320 @ =0x0223BD80
	add r3, sp, #0x10
	movs r2, #6
_0222F2D8:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222F2D8
	ldr r0, [r6]
	add r1, sp, #0x10
	str r0, [r3]
	ldr r0, [sp, #0x24]
	add r2, sp, #0x10
	adds r0, r0, r4
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	strh r0, [r1]
	ldr r0, [sp, #0x58]
	strh r0, [r1, #2]
	movs r0, #0xc8
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_0200D734
	adds r4, r0, #0
	adds r0, r7, #0
	bl FUN_02074484
	adds r1, r0, #0
	ldr r0, [r4]
	bl FUN_02024AA8
	adds r0, r4, #0
	bl FUN_0200DC18
	adds r0, r4, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0222F320: .4byte 0x0223BD80
	thumb_func_end ov80_0222F29C

	thumb_func_start ov80_0222F324
ov80_0222F324: @ 0x0222F324
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0x7d
	lsls r1, r1, #4
	ldr r0, [r0, #0x38]
	adds r1, r2, r1
	bl FUN_0200D958
	adds r0, r4, #0
	bl FUN_0200D9DC
	pop {r4, pc}
	thumb_func_end ov80_0222F324

	thumb_func_start ov80_0222F33C
ov80_0222F33C: @ 0x0222F33C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	movs r0, #0x15
	movs r1, #0x65
	bl FUN_02007688
	adds r4, r0, #0
	bl FUN_0207CAA0
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0222F3C4 @ =0x000007D1
	movs r1, #2
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x34]
	ldr r3, [r5, #0x38]
	bl FUN_0200D68C
	bl FUN_0207CAA4
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0222F3C4 @ =0x000007D1
	adds r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_0200D6EC
	bl FUN_0207CAA8
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0222F3C4 @ =0x000007D1
	adds r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_0200D71C
	bl FUN_0207CA9C
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0222F3C8 @ =0x000007D9
	movs r2, #0x15
	str r0, [sp, #8]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_0200E188
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222F3C4: .4byte 0x000007D1
_0222F3C8: .4byte 0x000007D9
	thumb_func_end ov80_0222F33C

	thumb_func_start ov80_0222F3CC
ov80_0222F3CC: @ 0x0222F3CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F4 @ =0x000007D9
	bl FUN_0200D958
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 @ =0x000007D1
	bl FUN_0200D978
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 @ =0x000007D1
	bl FUN_0200D988
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 @ =0x000007D1
	bl FUN_0200D968
	pop {r4, pc}
	nop
_0222F3F4: .4byte 0x000007D9
_0222F3F8: .4byte 0x000007D1
	thumb_func_end ov80_0222F3CC

	thumb_func_start ov80_0222F3FC
ov80_0222F3FC: @ 0x0222F3FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r5, _0222F43C @ =0x0223BD4C
	adds r6, r2, #0
	adds r3, r0, #0
	adds r7, r1, #0
	add r4, sp, #0
	movs r2, #6
_0222F40C:
	ldm r5!, {r0, r1}
	stm r4!, {r0, r1}
	subs r2, r2, #1
	bne _0222F40C
	ldr r0, [r5]
	add r2, sp, #0
	str r0, [r4]
	add r0, sp, #0
	strh r7, [r0]
	strh r6, [r0, #2]
	movs r0, #0x4b
	lsls r0, r0, #2
	str r0, [sp, #8]
	ldr r0, [r3, #0x34]
	ldr r1, [r3, #0x38]
	bl FUN_0200D734
	adds r4, r0, #0
	bl FUN_0200DC18
	adds r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222F43C: .4byte 0x0223BD4C
	thumb_func_end ov80_0222F3FC

	thumb_func_start ov80_0222F440
ov80_0222F440: @ 0x0222F440
	ldr r3, _0222F448 @ =FUN_0200D9DC
	adds r0, r1, #0
	bx r3
	nop
_0222F448: .4byte FUN_0200D9DC
	thumb_func_end ov80_0222F440

	thumb_func_start ov80_0222F44C
ov80_0222F44C: @ 0x0222F44C
	ldr r3, _0222F454 @ =ov80_0222F458
	movs r2, #0xb5
	lsls r2, r2, #2
	bx r3
	.align 2, 0
_0222F454: .4byte ov80_0222F458
	thumb_func_end ov80_0222F44C

	thumb_func_start ov80_0222F458
ov80_0222F458: @ 0x0222F458
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	ldr r0, [r0]
	adds r6, r2, #0
	bl FUN_02096808
	ldrh r2, [r4]
	ldr r1, _0222F4C8 @ =0x0000FFFF
	cmp r2, r1
	bne _0222F498
	movs r0, #1
	movs r1, #0x1b
	adds r2, r6, #0
	movs r3, #0x20
	bl FUN_0200BAF8
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	ldrh r2, [r4, #2]
	ldr r0, [r5]
	adds r1, r6, #0
	movs r3, #1
	bl ov80_0222E268
	adds r0, r6, #0
	bl FUN_0200BB44
	b _0222F4BC
_0222F498:
	ldr r0, [r0, #8]
	bl FUN_02028EA8
	bl FUN_0202AD3C
	adds r1, r0, #0
	ldrh r0, [r4, #4]
	str r0, [sp]
	movs r0, #6
	ldrsh r0, [r4, r0]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldrh r2, [r4]
	ldrh r3, [r4, #2]
	ldr r0, [r5]
	bl ov80_0222E3B8
_0222F4BC:
	ldr r1, _0222F4CC @ =ov80_0222F4D0
	adds r0, r5, #0
	bl ov80_0222AB84
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222F4C8: .4byte 0x0000FFFF
_0222F4CC: .4byte ov80_0222F4D0
	thumb_func_end ov80_0222F458

	thumb_func_start ov80_0222F4D0
ov80_0222F4D0: @ 0x0222F4D0
	push {r3, lr}
	ldr r0, [r0]
	adds r0, #0x50
	ldrb r0, [r0]
	bl FUN_02020094
	cmp r0, #0
	bne _0222F4EA
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #1
	pop {r3, pc}
_0222F4EA:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222F4D0

	thumb_func_start ov80_0222F4F0
ov80_0222F4F0: @ 0x0222F4F0
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #8
	ldrsb r2, [r4, r1]
	adds r2, r2, #1
	strb r2, [r4, #8]
	ldrsb r2, [r4, r1]
	movs r1, #9
	ldrsb r1, [r4, r1]
	cmp r2, r1
	ble _0222F538
	movs r1, #0
	strb r1, [r4, #8]
	movs r1, #0xa
	ldrsb r2, [r4, r1]
	subs r2, r2, #1
	strb r2, [r4, #0xa]
	ldrsb r1, [r4, r1]
	cmp r1, #0
	bge _0222F528
	bl FUN_0200E390
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	pop {r4, pc}
_0222F528:
	movs r0, #4
	ldrsh r0, [r4, r0]
	rsbs r0, r0, #0
	strh r0, [r4, #4]
	movs r0, #6
	ldrsh r0, [r4, r0]
	rsbs r0, r0, #0
	strh r0, [r4, #6]
_0222F538:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222F4F0

	thumb_func_start ov80_0222F53C
ov80_0222F53C: @ 0x0222F53C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	movs r1, #8
	adds r7, r0, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0222F5C2
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0222F5A6
	ldr r2, _0222F5C8 @ =0x04000048
	movs r1, #0x3f
	ldrh r3, [r2]
	movs r0, #0xf
	movs r5, #0x20
	bics r3, r1
	orrs r0, r3
	orrs r0, r5
	strh r0, [r2]
	ldrh r3, [r2, #2]
	movs r0, #0x1f
	bics r3, r1
	orrs r0, r3
	orrs r0, r5
	strh r0, [r2, #2]
	ldrb r3, [r4, #4]
	ldrb r1, [r4, #7]
	ldrb r0, [r4, #5]
	lsls r6, r3, #8
	movs r3, #0xff
	lsls r3, r3, #8
	ands r6, r3
	ldrb r3, [r4, #6]
	orrs r6, r3
	adds r3, r2, #0
	subs r3, #8
	strh r6, [r3]
	lsls r3, r0, #8
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r3
	orrs r1, r0
	subs r0, r2, #4
	strh r1, [r0]
	lsls r2, r5, #0x15
	ldr r1, [r2]
	ldr r0, _0222F5CC @ =0xFFFF1FFF
	ands r1, r0
	lsls r0, r5, #8
	orrs r0, r1
	str r0, [r2]
	b _0222F5B0
_0222F5A6:
	lsls r2, r1, #0x17
	ldr r1, [r2]
	ldr r0, _0222F5CC @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
_0222F5B0:
	adds r0, r7, #0
	bl FUN_0200E390
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	pop {r3, r4, r5, r6, r7, pc}
_0222F5C2:
	subs r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F5C8: .4byte 0x04000048
_0222F5CC: .4byte 0xFFFF1FFF
	thumb_func_end ov80_0222F53C

	thumb_func_start ov80_0222F5D0
ov80_0222F5D0: @ 0x0222F5D0
	adds r2, r0, #0
	adds r2, #0x97
	ldrb r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x40
	lsls r1, r1, #0x1f
	bics r3, r2
	lsrs r1, r1, #0x19
	orrs r1, r3
	adds r0, #0x97
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222F5D0

	thumb_func_start ov80_0222F5EC
ov80_0222F5EC: @ 0x0222F5EC
	adds r2, r0, #0
	adds r2, #0x97
	ldrb r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x80
	lsls r1, r1, #0x1f
	bics r3, r2
	lsrs r1, r1, #0x18
	orrs r1, r3
	adds r0, #0x97
	strb r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov80_0222F5EC

	thumb_func_start ov80_0222F608
ov80_0222F608: @ 0x0222F608
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	lsls r2, r4, #0x18
	lsls r3, r6, #0x18
	ldr r0, [r0, #8]
	adds r1, r7, #0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov80_0222FD08
	adds r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096818
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222F608

	thumb_func_start ov80_0222F648
ov80_0222F648: @ 0x0222F648
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r4, #0
	bl ov80_0222FEEC
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222F648

	thumb_func_start ov80_0222F664
ov80_0222F664: @ 0x0222F664
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_02230424
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222F664

	thumb_func_start ov80_0222F678
ov80_0222F678: @ 0x0222F678
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096808
	adds r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096810
	adds r5, r0, #0
	movs r0, #0xb
	movs r1, #0x24
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x24
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r7, #8]
	movs r3, #0
	str r0, [r4]
	ldrb r0, [r5, #4]
	adds r2, r4, #0
	strb r0, [r4, #4]
	ldrb r0, [r5, #5]
	strb r0, [r4, #5]
	ldr r0, _0222F6D4 @ =0x000004D4
	strb r3, [r4, #6]
	ldr r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r4, #8]
	ldr r0, [r5, r0]
	ldr r1, _0222F6D8 @ =0x0223BDB4
	str r0, [r4, #0xc]
	ldr r0, _0222F6DC @ =ov80_0222F7CC
	str r5, [r4, #0x1c]
	str r0, [sp]
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096820
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F6D4: .4byte 0x000004D4
_0222F6D8: .4byte 0x0223BDB4
_0222F6DC: .4byte ov80_0222F7CC
	thumb_func_end ov80_0222F678

	thumb_func_start ov80_0222F6E0
ov80_0222F6E0: @ 0x0222F6E0
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r0, _0222F704 @ =0x000004FC
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl FUN_02052554
	str r0, [r4, #0x14]
	adds r0, r5, #0
	bl FUN_02051BF8
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222F704: .4byte 0x000004FC
	thumb_func_end ov80_0222F6E0

	thumb_func_start ov80_0222F708
ov80_0222F708: @ 0x0222F708
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r4, r0, #0
	bl ov80_02236F24
	adds r2, r0, #0
	ldr r0, _0222F744 @ =0x000004FC
	movs r3, #0
	str r2, [r4, r0]
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _0222F748 @ =0x020FA484
	ldr r0, [r0]
	bl FUN_02096820
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0222F744: .4byte 0x000004FC
_0222F748: .4byte 0x020FA484
	thumb_func_end ov80_0222F708

	thumb_func_start ov80_0222F74C
ov80_0222F74C: @ 0x0222F74C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096808
	adds r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096810
	adds r5, r0, #0
	movs r2, #0
	ldr r0, _0222F7BC @ =0x000004DC
	adds r3, r5, #0
	adds r1, r2, #0
_0222F76C:
	adds r2, r2, #1
	strh r1, [r3, r0]
	adds r3, r3, #2
	cmp r2, #6
	blt _0222F76C
	movs r0, #0xb
	movs r1, #0x24
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x24
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r7, #8]
	adds r2, r4, #0
	str r0, [r4]
	ldrb r0, [r5, #4]
	movs r3, #0
	strb r0, [r4, #4]
	ldrb r0, [r5, #5]
	strb r0, [r4, #5]
	movs r0, #1
	strb r0, [r4, #6]
	ldr r0, _0222F7C0 @ =0x000004D4
	ldr r1, [r5, r0]
	adds r0, r0, #4
	str r1, [r4, #8]
	ldr r0, [r5, r0]
	ldr r1, _0222F7C4 @ =0x0223BDC4
	str r0, [r4, #0xc]
	ldr r0, _0222F7C8 @ =ov80_0222F7CC
	str r5, [r4, #0x1c]
	str r0, [sp]
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096820
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222F7BC: .4byte 0x000004DC
_0222F7C0: .4byte 0x000004D4
_0222F7C4: .4byte 0x0223BDC4
_0222F7C8: .4byte ov80_0222F7CC
	thumb_func_end ov80_0222F74C

	thumb_func_start ov80_0222F7CC
ov80_0222F7CC: @ 0x0222F7CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	adds r1, r4, #0
	bl ov80_02230460
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov80_0222F7CC

	thumb_func_start ov80_0222F7E0
ov80_0222F7E0: @ 0x0222F7E0
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_022307F0
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222F7E0

	thumb_func_start ov80_0222F7F4
ov80_0222F7F4: @ 0x0222F7F4
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_022308C4
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222F7F4

	thumb_func_start ov80_0222F808
ov80_0222F808: @ 0x0222F808
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_022309F8
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222F808

	thumb_func_start ov80_0222F81C
ov80_0222F81C: @ 0x0222F81C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_02230A60
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222F81C

	thumb_func_start ov80_0222F830
ov80_0222F830: @ 0x0222F830
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	adds r6, r0, #0
	ldr r2, [r6, #0x1c]
	adds r1, r2, #1
	str r1, [r6, #0x1c]
	ldrb r7, [r2]
	adds r2, r1, #1
	str r2, [r6, #0x1c]
	ldrb r5, [r1]
	adds r1, r2, #1
	str r1, [r6, #0x1c]
	ldrb r1, [r2]
	str r1, [sp, #0x1c]
	bl ov80_0222BDF4
	str r0, [sp, #0x18]
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r0, [r6]
	bl ov80_0222AB34
	str r0, [sp, #0x20]
	cmp r7, #0x29
	bhi _0222F8F2
	adds r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222F874: @ jump table
	.2byte _0222F8C8 - _0222F874 - 2 @ case 0
	.2byte _0222F8CC - _0222F874 - 2 @ case 1
	.2byte _0222F8D0 - _0222F874 - 2 @ case 2
	.2byte _0222F8D4 - _0222F874 - 2 @ case 3
	.2byte _0222F8E2 - _0222F874 - 2 @ case 4
	.2byte _0222F8EA - _0222F874 - 2 @ case 5
	.2byte _0222FBE6 - _0222F874 - 2 @ case 6
	.2byte _0222F8FA - _0222F874 - 2 @ case 7
	.2byte _0222FBE6 - _0222F874 - 2 @ case 8
	.2byte _0222F902 - _0222F874 - 2 @ case 9
	.2byte _0222F910 - _0222F874 - 2 @ case 10
	.2byte _0222FBE6 - _0222F874 - 2 @ case 11
	.2byte _0222FBE6 - _0222F874 - 2 @ case 12
	.2byte _0222FBE6 - _0222F874 - 2 @ case 13
	.2byte _0222F91A - _0222F874 - 2 @ case 14
	.2byte _0222F926 - _0222F874 - 2 @ case 15
	.2byte _0222F93C - _0222F874 - 2 @ case 16
	.2byte _0222F954 - _0222F874 - 2 @ case 17
	.2byte _0222F98C - _0222F874 - 2 @ case 18
	.2byte _0222FA4C - _0222F874 - 2 @ case 19
	.2byte _0222FA58 - _0222F874 - 2 @ case 20
	.2byte _0222FA66 - _0222F874 - 2 @ case 21
	.2byte _0222FA6E - _0222F874 - 2 @ case 22
	.2byte _0222FA76 - _0222F874 - 2 @ case 23
	.2byte _0222FA82 - _0222F874 - 2 @ case 24
	.2byte _0222FBE6 - _0222F874 - 2 @ case 25
	.2byte _0222FA8C - _0222F874 - 2 @ case 26
	.2byte _0222FA96 - _0222F874 - 2 @ case 27
	.2byte _0222FA9E - _0222F874 - 2 @ case 28
	.2byte _0222FAAA - _0222F874 - 2 @ case 29
	.2byte _0222FAB2 - _0222F874 - 2 @ case 30
	.2byte _0222FAD6 - _0222F874 - 2 @ case 31
	.2byte _0222FAEE - _0222F874 - 2 @ case 32
	.2byte _0222FB06 - _0222F874 - 2 @ case 33
	.2byte _0222FB34 - _0222F874 - 2 @ case 34
	.2byte _0222FB64 - _0222F874 - 2 @ case 35
	.2byte _0222FB70 - _0222F874 - 2 @ case 36
	.2byte _0222FB78 - _0222F874 - 2 @ case 37
	.2byte _0222FBA0 - _0222F874 - 2 @ case 38
	.2byte _0222FBA8 - _0222F874 - 2 @ case 39
	.2byte _0222FBD4 - _0222F874 - 2 @ case 40
	.2byte _0222FBDC - _0222F874 - 2 @ case 41
_0222F8C8:
	strb r5, [r4, #7]
	b _0222FBE6
_0222F8CC:
	strb r5, [r4, #5]
	b _0222FBE6
_0222F8D0:
	strb r5, [r4, #4]
	b _0222FBE6
_0222F8D4:
	lsls r0, r5, #1
	adds r1, r4, r0
	ldr r0, _0222FBEC @ =0x000004DC
	ldrh r1, [r1, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F8E2:
	ldrh r1, [r4, #0xc]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F8EA:
	ldrh r1, [r4, #0xc]
	ldr r0, _0222FBF0 @ =0x0000270F
	cmp r1, r0
	blo _0222F8F4
_0222F8F2:
	b _0222FBE6
_0222F8F4:
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	b _0222FBE6
_0222F8FA:
	movs r0, #0
	blx FUN_020D3B84
	b _0222FBE6
_0222F902:
	ldr r0, _0222FBF4 @ =0x000004F4
	ldr r0, [r4, r0]
	bl FUN_0203095C
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222F910:
	adds r0, r4, #0
	movs r1, #2
	bl ov80_0223049C
	b _0222FBE6
_0222F91A:
	adds r0, r4, #0
	bl ov80_02230784
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222F926:
	movs r0, #0x38
	muls r0, r5, r0
	adds r1, r4, r0
	movs r0, #0x3f
	lsls r0, r0, #4
	ldrh r0, [r1, r0]
	lsls r0, r0, #0x15
	lsrs r1, r0, #0x15
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F93C:
	movs r0, #0x38
	muls r0, r5, r0
	adds r1, r4, r0
	ldr r0, [sp, #0x1c]
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #0xfd
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F954:
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov80_02237120
	adds r2, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r1, r4, r0
	movs r0, #0x38
	muls r0, r5, r0
	adds r0, r1, r0
	adds r1, r6, #0
	bl ov80_0222A140
	adds r0, r6, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	adds r0, r6, #0
	bl FUN_0201AB0C
	b _0222FBE6
_0222F98C:
	ldrb r0, [r4, #4]
	movs r1, #1
	bl ov80_02236DF8
	movs r1, #0
	str r0, [sp, #0x14]
	add r2, sp, #0x24
	adds r0, r1, #0
_0222F99C:
	adds r1, r1, #1
	stm r2!, {r0}
	cmp r1, #0x12
	blt _0222F99C
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ble _0222FA12
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r6, r4, r0
_0222F9BC:
	adds r0, r4, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov80_0222A140
	adds r0, r5, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	cmp r7, r0
	bne _0222F9E8
	movs r0, #0xff
_0222F9E8:
	lsls r1, r7, #2
	add r2, sp, #0x24
	ldr r2, [r2, r1]
	adds r3, r2, #1
	add r2, sp, #0x24
	str r3, [r2, r1]
	cmp r0, #0xff
	beq _0222FA04
	lsls r0, r0, #2
	adds r1, r2, #0
	ldr r1, [r1, r0]
	adds r2, r1, #1
	add r1, sp, #0x24
	str r2, [r1, r0]
_0222FA04:
	ldr r0, [sp, #0x10]
	adds r6, #0x38
	adds r1, r0, #1
	ldr r0, [sp, #0x14]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _0222F9BC
_0222FA12:
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #0
	add r4, sp, #0x24
	adds r5, r0, #0
	adds r3, r4, #0
_0222FA20:
	lsls r1, r0, #2
	ldr r2, [r3, r1]
	ldr r1, [r4]
	cmp r2, r1
	bge _0222FA2C
	adds r0, r5, #0
_0222FA2C:
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, #0x12
	blt _0222FA20
	lsls r2, r0, #2
	add r1, sp, #0x24
	ldr r1, [r1, r2]
	cmp r1, #1
	bgt _0222FA46
	ldr r0, [sp, #0x18]
	movs r1, #0xff
	strh r1, [r0]
	b _0222FBE6
_0222FA46:
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA4C:
	adds r0, r4, #0
	bl ov80_022372B4
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA58:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov80_02230794
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA66:
	adds r0, r4, #0
	bl ov80_022307C8
	b _0222FBE6
_0222FA6E:
	adds r0, r4, #0
	bl ov80_022307D4
	b _0222FBE6
_0222FA76:
	adds r0, r4, #0
	bl ov80_02230790
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA82:
	ldr r0, _0222FBF8 @ =0x0000057C
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FA8C:
	ldr r0, _0222FBFC @ =0x0000057D
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FA96:
	adds r0, r4, #0
	bl FUN_02096910
	b _0222FBE6
_0222FA9E:
	ldrb r0, [r4, #4]
	bl ov80_02237254
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FAAA:
	ldrb r1, [r4, #4]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FAB2:
	movs r0, #0x1a
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r1, #3
	ldr r0, [sp, #0x20]
	str r5, [sp, #8]
	ldr r0, [r0]
	adds r2, r1, #0
	movs r3, #0xa
	bl FUN_0201CA4C
	ldr r0, [sp, #0x20]
	movs r1, #3
	ldr r0, [r0]
	bl FUN_0201EFBC
	b _0222FBE6
_0222FAD6:
	ldr r0, [r6]
	bl ov80_0222AB34
	adds r1, r0, #0
	ldr r0, _0222FC00 @ =ov80_0222FC08
	movs r2, #5
	bl FUN_0200E320
	movs r1, #5
	lsls r1, r1, #8
	str r0, [r4, r1]
	b _0222FBE6
_0222FAEE:
	movs r0, #5
	lsls r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222FBE6
	bl FUN_0200E390
	movs r0, #5
	movs r1, #0
	lsls r0, r0, #8
	str r1, [r4, r0]
	b _0222FBE6
_0222FB06:
	ldrb r1, [r4, #6]
	adds r0, r4, #0
	adds r0, #0x34
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1, #0x18]
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #6]
	movs r0, #0x51
	lsls r0, r0, #2
	adds r1, r1, #7
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1, #0x18]
	adds r0, r4, r0
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_0222A474
	b _0222FBE6
_0222FB34:
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	adds r7, r0, #0
	movs r5, #0
	cmp r7, #0
	ble _0222FBE6
_0222FB42:
	ldr r0, _0222FC04 @ =0x000004D4
	adds r1, r5, #0
	ldr r0, [r4, r0]
	bl FUN_02074644
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r6]
	adds r1, r5, #0
	ldr r0, [r0, #0x44]
	bl FUN_0200BF1C
	adds r5, r5, #1
	cmp r5, r7
	blt _0222FB42
	b _0222FBE6
_0222FB64:
	adds r0, r4, #0
	bl ov80_02230B4C
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FB70:
	adds r0, r4, #0
	bl ov80_02230AE4
	b _0222FBE6
_0222FB78:
	ldr r0, [sp, #0x18]
	movs r1, #0
	strh r1, [r0]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _0222FBE6
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	cmp r0, #0x15
	bne _0222FB94
	ldr r0, [sp, #0x18]
	movs r1, #1
	strh r1, [r0]
	b _0222FBE6
_0222FB94:
	cmp r0, #0x31
	bne _0222FBE6
	ldr r0, [sp, #0x18]
	movs r1, #2
	strh r1, [r0]
	b _0222FBE6
_0222FBA0:
	adds r0, r4, #0
	bl ov80_022371B0
	b _0222FBE6
_0222FBA8:
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r3, #0x3f
	lsls r3, r3, #4
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	adds r1, r3, #0
	adds r2, r3, #0
	str r0, [sp, #0xc]
	adds r0, r4, r3
	subs r1, #0x1e
	subs r2, #0x16
	subs r3, #0x10
	adds r1, r4, r1
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov80_0222A52C
	b _0222FBE6
_0222FBD4:
	adds r0, r4, #0
	bl ov80_02237130
	b _0222FBE6
_0222FBDC:
	ldrb r1, [r4, #0xb]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	movs r0, #1
	strb r0, [r4, #0xb]
_0222FBE6:
	movs r0, #0
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222FBEC: .4byte 0x000004DC
_0222FBF0: .4byte 0x0000270F
_0222FBF4: .4byte 0x000004F4
_0222FBF8: .4byte 0x0000057C
_0222FBFC: .4byte 0x0000057D
_0222FC00: .4byte ov80_0222FC08
_0222FC04: .4byte 0x000004D4
	thumb_func_end ov80_0222F830

	thumb_func_start ov80_0222FC08
ov80_0222FC08: @ 0x0222FC08
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BE00
	cmp r0, #0xff
	ldr r0, [r4]
	blt _0222FC26
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	pop {r4, pc}
_0222FC26:
	movs r1, #2
	movs r2, #4
	movs r3, #1
	bl FUN_0201F238
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0222FC08

	thumb_func_start ov80_0222FC34
ov80_0222FC34: @ 0x0222FC34
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r0, [r0, #0x14]
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0222FC34

	thumb_func_start ov80_0222FC50
ov80_0222FC50: @ 0x0222FC50
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_02230AF8
	strh r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222FC50

	thumb_func_start ov80_0222FC80
ov80_0222FC80: @ 0x0222FC80
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _0222FC9C @ =ov80_0222FCA0
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_0222FC9C: .4byte ov80_0222FCA0
	thumb_func_end ov80_0222FC80

	thumb_func_start ov80_0222FCA0
ov80_0222FCA0: @ 0x0222FCA0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r1, _0222FCCC @ =0x00000702
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _0222FCC6
	movs r2, #0
	strb r2, [r0, r1]
	movs r0, #1
	pop {r4, pc}
_0222FCC6:
	movs r0, #0
	pop {r4, pc}
	nop
_0222FCCC: .4byte 0x00000702
	thumb_func_end ov80_0222FCA0

	thumb_func_start ov80_0222FCD0
ov80_0222FCD0: @ 0x0222FCD0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r5, #0x1c]
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0]
	bl FUN_02096810
	adds r2, r0, #0
	bne _0222FCF4
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222FCF4:
	lsls r1, r4, #4
	adds r1, r4, r1
	adds r2, #0x4c
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r2, r1
	bl ov80_0222F44C
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222FCD0

	thumb_func_start ov80_0222FD08
ov80_0222FD08: @ 0x0222FD08
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r4, r0, #0
	ldr r1, _0222FED4 @ =0x00000708
	movs r0, #0xb
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	ldr r1, _0222FED8 @ =0x0223DD40
	ldr r2, _0222FED4 @ =0x00000708
	str r0, [r1]
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r5, [r0]
	adds r0, r4, #0
	bl FUN_0203094C
	ldr r1, _0222FEDC @ =0x000004F4
	str r0, [r5, r1]
	adds r0, r1, #4
	str r4, [r5, r0]
	movs r0, #0xb
	ldr r1, _0222FED8 @ =0x0223DD40
	str r0, [r5]
	ldr r5, [r1]
	bl FUN_020744BC
	ldr r1, _0222FEE0 @ =0x000004D4
	str r0, [r5, r1]
	movs r0, #0xb
	bl FUN_020744BC
	ldr r1, _0222FEE4 @ =0x000004D8
	str r0, [r5, r1]
	adds r1, #0x1c
	adds r0, r4, #0
	ldr r5, [r5, r1]
	bl FUN_02030AE8
	adds r4, r0, #0
	cmp r6, #0
	bne _0222FE1A
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r1, [r0]
	strb r7, [r1, #4]
	ldr r0, [sp]
	strb r0, [r1, #5]
	movs r0, #0
	strb r0, [r1, #6]
	adds r0, r5, #0
	bl FUN_02030940
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r2, [r0]
	ldrb r3, [r2, #4]
	cmp r3, #3
	bne _0222FD8E
	ldr r0, _0222FEE8 @ =0x000004F8
	ldr r0, [r2, r0]
	bl FUN_020503D0
	bl FUN_02066E48
	b _0222FDA2
_0222FD8E:
	ldrb r2, [r2, #5]
	adds r0, r4, #0
	movs r1, #0xa
	lsls r2, r2, #2
	adds r2, r3, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030AD4
_0222FDA2:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0222FE0A
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r5, [r0]
	ldr r0, _0222FEE8 @ =0x000004F8
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205BFF0
	adds r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205BFF0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	strh r0, [r5, #0xc]
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r4, [r0]
	ldr r0, _0222FEE8 @ =0x000004F8
	ldr r0, [r4, r0]
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl FUN_0205C048
	adds r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C048
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_020310BC
	b _0222FE12
_0222FE0A:
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r4, [r0]
	movs r0, #0
	strh r0, [r4, #0xc]
_0222FE12:
	strh r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0x10]
	b _0222FEA8
_0222FE1A:
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02030A24
	ldr r1, _0222FED8 @ =0x0223DD40
	ldr r4, [r1]
	movs r1, #0
	strb r0, [r4, #4]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02030A24
	movs r2, #0
	strb r0, [r4, #5]
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_02030A24
	strb r0, [r4, #6]
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r5, [r0]
	ldr r0, _0222FEE8 @ =0x000004F8
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205BFF0
	adds r7, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl FUN_0205BFF0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_020310BC
	strh r0, [r5, #0xc]
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r4, [r0]
	ldr r0, _0222FEE8 @ =0x000004F8
	ldr r0, [r4, r0]
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl FUN_0205C048
	adds r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C048
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_020310BC
	strh r0, [r4, #8]
_0222FEA8:
	ldr r0, _0222FED8 @ =0x0223DD40
	movs r1, #7
	ldr r4, [r0]
	ldrh r0, [r4, #0xc]
	blx FUN_020F2998
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	bl ov80_02237254
	cmp r0, #1
	bne _0222FECC
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r1, [r0]
	ldr r0, _0222FEE8 @ =0x000004F8
	ldr r0, [r1, r0]
	bl ov80_0222A840
_0222FECC:
	ldr r0, _0222FED8 @ =0x0223DD40
	ldr r0, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FED4: .4byte 0x00000708
_0222FED8: .4byte 0x0223DD40
_0222FEDC: .4byte 0x000004F4
_0222FEE0: .4byte 0x000004D4
_0222FEE4: .4byte 0x000004D8
_0222FEE8: .4byte 0x000004F8
	thumb_func_end ov80_0222FD08

	thumb_func_start ov80_0222FEEC
ov80_0222FEEC: @ 0x0222FEEC
	push {r3, lr}
	cmp r1, #0
	bne _0222FEF8
	bl ov80_0222FF00
	pop {r3, pc}
_0222FEF8:
	bl ov80_02230270
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0222FEEC

	thumb_func_start ov80_0222FF00
ov80_0222FF00: @ 0x0222FF00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0xd8
	adds r4, r0, #0
	bl ov80_022372B4
	adds r1, r0, #0
	adds r2, r4, #0
	ldrb r0, [r4, #4]
	adds r2, #0x18
	movs r3, #0xe
	bl ov80_02236BE4
	adds r0, r4, #0
	bl ov80_022372B4
	movs r3, #0x26
	lsls r3, r3, #4
	adds r1, r4, r3
	str r1, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r1, #8
	adds r1, r4, r1
	str r1, [sp, #4]
	ldrh r1, [r4, #8]
	subs r2, #0xc
	adds r3, #0x20
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #5]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov80_02236E24
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl ov80_022300D4
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl ov80_022300D4
	movs r0, #6
	str r0, [sp, #0x18]
	movs r0, #0
	mov ip, r0
	adds r3, r4, #0
	add r5, sp, #0x34
_0222FF6A:
	movs r0, #0xa
	lsls r0, r0, #6
	adds r2, r3, r0
	adds r7, r5, #0
	movs r6, #7
_0222FF74:
	ldm r2!, {r0, r1}
	stm r7!, {r0, r1}
	subs r6, r6, #1
	bne _0222FF74
	mov r0, ip
	adds r0, r0, #1
	adds r3, #0x38
	adds r5, #0x38
	mov ip, r0
	cmp r0, #6
	blt _0222FF6A
	ldrb r0, [r4, #4]
	bl ov80_02237254
	cmp r0, #1
	bne _02230038
	movs r0, #0xa
	lsls r0, r0, #6
	ldr r7, _022300C4 @ =0x00000282
	movs r5, #0
	adds r0, r4, r0
	add r1, sp, #0x28
	adds r2, r4, #0
	add r3, sp, #0x1c
_0222FFA4:
	ldrh r6, [r0]
	adds r5, r5, #1
	adds r0, #0x38
	lsls r6, r6, #0x15
	lsrs r6, r6, #0x15
	strh r6, [r1]
	ldrh r6, [r2, r7]
	adds r1, r1, #2
	adds r2, #0x38
	strh r6, [r3]
	adds r3, r3, #2
	cmp r5, #6
	blt _0222FFA4
	adds r0, r4, #0
	bl ov80_022372B4
	movs r3, #0x59
	lsls r3, r3, #4
	adds r1, r4, r3
	str r1, [sp]
	adds r1, r3, #0
	adds r1, #8
	adds r1, r4, r1
	str r1, [sp, #4]
	adds r1, r3, #0
	adds r2, r3, #0
	subs r1, #0x10
	ldrh r1, [r4, r1]
	subs r2, #0xc
	adds r3, #0x20
	str r1, [sp, #8]
	add r1, sp, #0x28
	str r1, [sp, #0xc]
	add r1, sp, #0x1c
	str r1, [sp, #0x10]
	ldrb r1, [r4, #5]
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov80_02236E24
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	bl ov80_022300D4
	adds r0, r4, #0
	movs r1, #5
	movs r2, #1
	bl ov80_022300D4
	movs r0, #0xc
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x14]
	adds r5, r4, #0
	add r6, sp, #0x34
_02230014:
	movs r0, #0x5b
	lsls r0, r0, #4
	adds r3, r5, r0
	movs r0, #0x15
	lsls r0, r0, #4
	adds r2, r6, r0
	movs r7, #7
_02230022:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r7, r7, #1
	bne _02230022
	ldr r0, [sp, #0x14]
	adds r5, #0x38
	adds r0, r0, #1
	adds r6, #0x38
	str r0, [sp, #0x14]
	cmp r0, #6
	blt _02230014
_02230038:
	ldrb r0, [r4, #4]
	movs r1, #1
	bl ov80_02236DF8
	ldr r2, _022300C8 @ =0x000003D2
	add r3, sp, #0x34
	adds r1, r4, r2
	str r1, [sp]
	adds r1, r2, #0
	adds r1, #0x1e
	adds r1, r4, r1
	str r1, [sp, #4]
	adds r1, r2, #0
	adds r1, #8
	adds r1, r4, r1
	adds r2, #0xe
	str r1, [sp, #8]
	adds r1, r4, r2
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #5]
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1, #0x18]
	bl ov80_02236E90
	movs r0, #0xa
	lsls r0, r0, #6
	movs r7, #0
	adds r6, r4, r0
_02230078:
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl ov80_0222A140
	ldr r0, _022300CC @ =0x000004F8
	ldr r1, _022300D0 @ =0x000004D4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r5, #0
	bl ov80_0222A3BC
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r7, r7, #1
	adds r6, #0x38
	cmp r7, #6
	blt _02230078
	ldr r6, _022300D0 @ =0x000004D4
	movs r5, #0
_022300B0:
	ldr r0, [r4, r6]
	adds r1, r5, #0
	bl FUN_02074644
	adds r5, r5, #1
	cmp r5, #6
	blt _022300B0
	add sp, #0x1fc
	add sp, #0xd8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022300C4: .4byte 0x00000282
_022300C8: .4byte 0x000003D2
_022300CC: .4byte 0x000004F8
_022300D0: .4byte 0x000004D4
	thumb_func_end ov80_0222FF00

	thumb_func_start ov80_022300D4
ov80_022300D4: @ 0x022300D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xdc
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_0201FD44
	movs r1, #6
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
	cmp r6, #0
	bne _022301B0
	movs r0, #0x95
	lsls r0, r0, #2
	adds r1, r4, r0
	lsls r3, r5, #1
	str r1, [sp, #0x5c]
	ldrh r1, [r1, r3]
	str r3, [sp, #0x20]
	add r6, sp, #0xa4
	str r1, [sp, #0x1c]
	adds r1, r0, #0
	adds r1, #0xc
	adds r1, r4, r1
	str r1, [sp, #0x24]
	ldrb r1, [r1, r5]
	movs r7, #7
	str r1, [sp, #0x18]
	adds r1, r0, #0
	adds r1, #0x14
	adds r1, r4, r1
	str r1, [sp, #0x28]
	lsls r1, r5, #2
	ldr r3, [sp, #0x28]
	str r1, [sp, #0x2c]
	ldr r1, [r3, r1]
	adds r0, #0x2c
	str r1, [sp, #0x14]
	adds r1, r4, r0
	movs r0, #0x38
	muls r0, r5, r0
	adds r0, r1, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0x30]
_02230130:
	ldr r3, [sp, #0x30]
	subs r7, r7, #1
	ldm r3!, {r0, r1}
	str r3, [sp, #0x30]
	stm r6!, {r0, r1}
	bne _02230130
	movs r0, #0x95
	lsls r0, r0, #2
	adds r1, r4, r0
	str r1, [sp, #0x34]
	ldr r3, [sp, #0x34]
	lsls r1, r2, #1
	ldrh r6, [r3, r1]
	str r1, [sp, #0x38]
	ldr r3, [sp, #0x20]
	ldr r1, [sp, #0x5c]
	strh r6, [r1, r3]
	adds r1, r0, #0
	adds r1, #0xc
	adds r1, r4, r1
	ldrb r3, [r1, r2]
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x24]
	strb r3, [r1, r5]
	adds r1, r0, #0
	adds r1, #0x14
	adds r7, r4, r1
	lsls r1, r2, #2
	str r1, [sp, #0x60]
	ldr r5, [r7, r1]
	ldr r3, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	adds r0, #0x2c
	str r5, [r3, r1]
	adds r1, r4, r0
	movs r0, #0x38
	muls r0, r2, r0
	adds r6, r1, r0
	adds r5, r6, #0
	movs r4, #7
_02230180:
	ldr r3, [sp, #0x10]
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	str r3, [sp, #0x10]
	subs r4, r4, #1
	bne _02230180
	ldr r3, [sp, #0x1c]
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x38]
	strh r3, [r1, r0]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x3c]
	add r3, sp, #0xa4
	strb r1, [r0, r2]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x60]
	movs r2, #7
	str r1, [r7, r0]
_022301A4:
	ldm r3!, {r0, r1}
	stm r6!, {r0, r1}
	subs r2, r2, #1
	bne _022301A4
	add sp, #0xdc
	pop {r4, r5, r6, r7, pc}
_022301B0:
	ldr r0, _0223026C @ =0x00000584
	lsls r3, r5, #1
	adds r1, r4, r0
	str r1, [sp, #0x64]
	ldrh r1, [r1, r3]
	str r3, [sp, #0x40]
	add r6, sp, #0x6c
	str r1, [sp, #8]
	adds r1, r0, #0
	adds r1, #0xc
	adds r1, r4, r1
	str r1, [sp, #0x44]
	ldrb r1, [r1, r5]
	movs r7, #7
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0x14
	adds r1, r4, r1
	str r1, [sp, #0x48]
	lsls r1, r5, #2
	ldr r3, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [r3, r1]
	adds r0, #0x2c
	str r1, [sp]
	adds r1, r4, r0
	movs r0, #0x38
	muls r0, r5, r0
	adds r0, r1, r0
	str r0, [sp, #0xc]
	str r0, [sp, #0x50]
_022301EE:
	ldr r3, [sp, #0x50]
	subs r7, r7, #1
	ldm r3!, {r0, r1}
	str r3, [sp, #0x50]
	stm r6!, {r0, r1}
	bne _022301EE
	ldr r3, _0223026C @ =0x00000584
	adds r0, r4, r3
	str r0, [sp, #0x54]
	ldr r1, [sp, #0x54]
	lsls r0, r2, #1
	ldrh r6, [r1, r0]
	str r0, [sp, #0x58]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x64]
	strh r6, [r0, r1]
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r4, r0
	ldrb r1, [r0, r2]
	mov ip, r0
	ldr r0, [sp, #0x44]
	strb r1, [r0, r5]
	adds r0, r3, #0
	adds r0, #0x14
	adds r7, r4, r0
	lsls r0, r2, #2
	str r0, [sp, #0x68]
	ldr r5, [r7, r0]
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x4c]
	adds r3, #0x2c
	str r5, [r1, r0]
	movs r0, #0x38
	adds r1, r4, r3
	muls r0, r2, r0
	adds r5, r1, r0
	adds r6, r5, #0
	movs r4, #7
_0223023C:
	ldr r3, [sp, #0xc]
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	str r3, [sp, #0xc]
	subs r4, r4, #1
	bne _0223023C
	ldr r3, [sp, #8]
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0x58]
	strh r3, [r1, r0]
	ldr r1, [sp, #4]
	mov r0, ip
	strb r1, [r0, r2]
	ldr r1, [sp]
	ldr r0, [sp, #0x68]
	add r3, sp, #0x6c
	str r1, [r7, r0]
	movs r2, #7
_02230260:
	ldm r3!, {r0, r1}
	stm r5!, {r0, r1}
	subs r2, r2, #1
	bne _02230260
	add sp, #0xdc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223026C: .4byte 0x00000584
	thumb_func_end ov80_022300D4

	thumb_func_start ov80_02230270
ov80_02230270: @ 0x02230270
	push {r4, r5, r6, r7, lr}
	sub sp, #0x19c
	adds r5, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	ldr r7, _0223040C @ =0x000004F4
	movs r4, #0
	adds r6, r5, #0
_02230282:
	lsls r2, r4, #0x18
	ldr r0, [r5, r7]
	movs r1, #3
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030A24
	strh r0, [r6, #0x18]
	adds r4, r4, #1
	adds r6, r6, #2
	cmp r4, #0xe
	blt _02230282
	add r0, sp, #0x28
	movs r4, #0
	add r6, sp, #0x40
	str r0, [sp, #0x14]
	add r7, sp, #0x20
	str r5, [sp, #0x10]
_022302A6:
	ldr r0, _0223040C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #4
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030A24
	strh r0, [r6]
	ldr r0, _0223040C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #6
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030A24
	ldr r1, [sp, #0x14]
	lsls r2, r4, #0x18
	str r0, [r1]
	ldr r0, _0223040C @ =0x000004F4
	movs r1, #5
	ldr r0, [r5, r0]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030A24
	strb r0, [r7]
	ldrh r2, [r6]
	ldr r1, [sp, #0x10]
	ldr r0, _02230410 @ =0x000004E8
	adds r4, r4, #1
	strh r2, [r1, r0]
	ldr r0, [sp, #0x14]
	adds r6, r6, #2
	adds r0, r0, #4
	str r0, [sp, #0x14]
	adds r0, r1, #0
	adds r0, r0, #2
	adds r7, r7, #1
	str r0, [sp, #0x10]
	cmp r4, #4
	blt _022302A6
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x4c
	add r1, sp, #0x40
	add r2, sp, #0x20
	add r3, sp, #0x28
	bl ov80_0222A52C
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r7, #0
	add r4, sp, #0x4c
_02230324:
	adds r0, r5, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r0, _02230414 @ =0x000004F8
	ldr r1, _02230418 @ =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl ov80_0222A3BC
	adds r7, r7, #1
	adds r4, #0x38
	cmp r7, #4
	blt _02230324
	adds r0, r6, #0
	bl FUN_0201AB0C
	add r0, sp, #0x28
	movs r4, #0
	add r6, sp, #0x40
	str r0, [sp, #0x1c]
	add r7, sp, #0x20
	str r5, [sp, #0x18]
_0223035C:
	ldr r0, _0223040C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #7
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030A24
	strh r0, [r6]
	ldr r0, _0223040C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #9
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030A24
	ldr r1, [sp, #0x1c]
	lsls r2, r4, #0x18
	str r0, [r1]
	ldr r0, _0223040C @ =0x000004F4
	movs r1, #8
	ldr r0, [r5, r0]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030A24
	strb r0, [r7]
	ldrh r2, [r6]
	ldr r1, [sp, #0x18]
	ldr r0, _0223041C @ =0x000003D2
	adds r4, r4, #1
	strh r2, [r1, r0]
	ldr r0, [sp, #0x1c]
	adds r6, r6, #2
	adds r0, r0, #4
	str r0, [sp, #0x1c]
	adds r0, r1, #0
	adds r0, r0, #2
	adds r7, r7, #1
	str r0, [sp, #0x18]
	cmp r4, #4
	blt _0223035C
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x4c
	add r1, sp, #0x40
	add r2, sp, #0x20
	add r3, sp, #0x28
	bl ov80_0222A52C
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r7, #0
	add r4, sp, #0x4c
_022303DA:
	adds r0, r5, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r0, _02230414 @ =0x000004F8
	ldr r1, _02230420 @ =0x000004D8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl ov80_0222A3BC
	adds r7, r7, #1
	adds r4, #0x38
	cmp r7, #4
	blt _022303DA
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0x19c
	pop {r4, r5, r6, r7, pc}
	nop
_0223040C: .4byte 0x000004F4
_02230410: .4byte 0x000004E8
_02230414: .4byte 0x000004F8
_02230418: .4byte 0x000004D4
_0223041C: .4byte 0x000003D2
_02230420: .4byte 0x000004D8
	thumb_func_end ov80_02230270

	thumb_func_start ov80_02230424
ov80_02230424: @ 0x02230424
	push {r4, lr}
	adds r4, r0, #0
	beq _02230452
	ldr r0, _02230454 @ =0x000004D4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02230436
	bl FUN_0201AB0C
_02230436:
	ldr r0, _02230458 @ =0x000004D8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02230442
	bl FUN_0201AB0C
_02230442:
	ldr r2, _0223045C @ =0x00000708
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
_02230452:
	pop {r4, pc}
	.align 2, 0
_02230454: .4byte 0x000004D4
_02230458: .4byte 0x000004D8
_0223045C: .4byte 0x00000708
	thumb_func_end ov80_02230424

	thumb_func_start ov80_02230460
ov80_02230460: @ 0x02230460
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02230480 @ =0x000004DC
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0223046A:
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl ov80_02230484
	strh r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #6
	blt _0223046A
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230480: .4byte 0x000004DC
	thumb_func_end ov80_02230460

	thumb_func_start ov80_02230484
ov80_02230484: @ 0x02230484
	push {r3, lr}
	cmp r1, #6
	blo _02230492
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
_02230492:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x10]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02230484

	thumb_func_start ov80_0223049C
ov80_0223049C: @ 0x0223049C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, _02230768 @ =0x000004F8
	adds r6, r1, #0
	ldr r0, [r5, r0]
	bl FUN_02030AE8
	str r0, [sp]
	ldr r0, _02230768 @ =0x000004F8
	ldr r0, [r5, r0]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	ldrb r0, [r5, #4]
	movs r1, #1
	bl ov80_02236DF8
	ldrb r1, [r5, #5]
	add r0, sp, #4
	add r3, sp, #0xc
	strb r1, [r0, #8]
	ldr r0, _0223076C @ =0x000004F4
	movs r1, #0
	ldr r0, [r5, r0]
	adds r2, r1, #0
	bl FUN_02030978
	ldrb r1, [r5, #4]
	add r0, sp, #4
	movs r2, #0
	strb r1, [r0, #8]
	ldr r0, _0223076C @ =0x000004F4
	movs r1, #1
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl FUN_02030978
	ldr r0, _0223076C @ =0x000004F4
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02030964
	ldrb r1, [r5, #6]
	add r0, sp, #4
	movs r2, #0
	strb r1, [r0, #8]
	ldr r0, _0223076C @ =0x000004F4
	movs r1, #2
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl FUN_02030978
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C048
	adds r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C048
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #8]
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02031108
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205BFF0
	adds r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205BFF0
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02031108
	cmp r6, #2
	beq _02230648
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C01C
	adds r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C01C
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	adds r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C01C
	adds r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C01C
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0203126C
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C01C
	adds r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C01C
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_020310BC
	ldrh r1, [r5, #0xc]
	cmp r1, r6
	bne _022305E2
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C074
	adds r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C074
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0203126C
	b _02230608
_022305E2:
	cmp r6, r0
	bhs _02230608
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C074
	adds r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl FUN_0205C074
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #8]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02031108
_02230608:
	ldrb r1, [r5, #0xa]
	add r0, sp, #4
	strb r1, [r0, #8]
	ldrb r2, [r5, #5]
	ldrb r3, [r5, #4]
	ldr r0, [sp]
	lsls r2, r2, #2
	adds r2, r3, r2
	lsls r2, r2, #0x18
	movs r1, #0xa
	lsrs r2, r2, #0x18
	add r3, sp, #0xc
	bl FUN_02030AA4
	ldrb r0, [r5, #4]
	cmp r0, #3
	bne _02230648
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _02230634
	movs r6, #0x66
	b _02230636
_02230634:
	movs r6, #0x68
_02230636:
	adds r0, r6, #0
	bl FUN_0205C268
	adds r2, r0, #0
	ldrb r3, [r5, #0xa]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_02031108
_02230648:
	ldr r7, _0223076C @ =0x000004F4
	movs r4, #0
	add r6, sp, #4
_0223064E:
	lsls r0, r4, #1
	adds r0, r5, r0
	ldrh r0, [r0, #0x18]
	lsls r2, r4, #0x18
	movs r1, #3
	strh r0, [r6]
	ldr r0, [r5, r7]
	lsrs r2, r2, #0x18
	add r3, sp, #4
	bl FUN_02030978
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xe
	blo _0223064E
	ldr r0, _02230770 @ =0x000004D4
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r7, r0, #0
	ldr r4, _02230774 @ =0x00000000
	beq _022306E8
_0223067C:
	ldr r0, _02230770 @ =0x000004D4
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r6, r0, #0
	lsls r0, r4, #1
	adds r1, r5, r0
	ldr r0, _02230778 @ =0x000004E8
	lsls r2, r4, #0x18
	ldrh r1, [r1, r0]
	add r0, sp, #4
	lsrs r2, r2, #0x18
	strh r1, [r0]
	ldr r0, _0223076C @ =0x000004F4
	movs r1, #4
	ldr r0, [r5, r0]
	add r3, sp, #4
	bl FUN_02030978
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #4
	strb r0, [r1, #8]
	ldr r0, _0223076C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #5
	lsrs r2, r2, #0x18
	add r3, sp, #0xc
	bl FUN_02030978
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [sp, #0x10]
	ldr r0, _0223076C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #6
	lsrs r2, r2, #0x18
	add r3, sp, #0x10
	bl FUN_02030978
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r7
	blo _0223067C
_022306E8:
	ldr r0, _0223077C @ =0x000004D8
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r7, r0, #0
	ldr r4, _02230774 @ =0x00000000
	beq _02230762
_022306F6:
	ldr r0, _0223077C @ =0x000004D8
	adds r1, r4, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r6, r0, #0
	lsls r0, r4, #1
	adds r1, r5, r0
	ldr r0, _02230780 @ =0x000003D2
	lsls r2, r4, #0x18
	ldrh r1, [r1, r0]
	add r0, sp, #4
	lsrs r2, r2, #0x18
	strh r1, [r0]
	ldr r0, _0223076C @ =0x000004F4
	movs r1, #7
	ldr r0, [r5, r0]
	add r3, sp, #4
	bl FUN_02030978
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #4
	strb r0, [r1, #8]
	ldr r0, _0223076C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #8
	lsrs r2, r2, #0x18
	add r3, sp, #0xc
	bl FUN_02030978
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [sp, #0x10]
	ldr r0, _0223076C @ =0x000004F4
	lsls r2, r4, #0x18
	ldr r0, [r5, r0]
	movs r1, #9
	lsrs r2, r2, #0x18
	add r3, sp, #0x10
	bl FUN_02030978
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r7
	blo _022306F6
_02230762:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230768: .4byte 0x000004F8
_0223076C: .4byte 0x000004F4
_02230770: .4byte 0x000004D4
_02230774: .4byte 0x00000000
_02230778: .4byte 0x000004E8
_0223077C: .4byte 0x000004D8
_02230780: .4byte 0x000003D2
	thumb_func_end ov80_0223049C

	thumb_func_start ov80_02230784
ov80_02230784: @ 0x02230784
	ldrb r1, [r0, #6]
	adds r1, r1, #1
	strb r1, [r0, #6]
	ldrb r0, [r0, #6]
	bx lr
	.align 2, 0
	thumb_func_end ov80_02230784

	thumb_func_start ov80_02230790
ov80_02230790: @ 0x02230790
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end ov80_02230790

	thumb_func_start ov80_02230794
ov80_02230794: @ 0x02230794
	push {r4, lr}
	sub sp, #0x30
	adds r2, r0, #0
	ldrb r4, [r2, #6]
	movs r3, #7
	muls r3, r1, r3
	adds r1, r4, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r1, r2, r1
	ldrh r1, [r1, #0x18]
	add r0, sp, #0
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov80_02230794

	thumb_func_start ov80_022307C8
ov80_022307C8: @ 0x022307C8
	ldr r3, _022307D0 @ =ov80_0223049C
	movs r1, #1
	bx r3
	nop
_022307D0: .4byte ov80_0223049C
	thumb_func_end ov80_022307C8

	thumb_func_start ov80_022307D4
ov80_022307D4: @ 0x022307D4
	movs r1, #1
	strb r1, [r0, #0xa]
	ldrh r1, [r0, #0xe]
	cmp r1, #8
	bhs _022307E2
	adds r1, r1, #1
	strh r1, [r0, #0xe]
_022307E2:
	ldr r3, _022307EC @ =ov80_0223049C
	movs r1, #0
	strb r1, [r0, #6]
	bx r3
	nop
_022307EC: .4byte ov80_0223049C
	thumb_func_end ov80_022307D4

	thumb_func_start ov80_022307F0
ov80_022307F0: @ 0x022307F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	movs r1, #1
	bl ov80_02236DF8
	str r0, [sp]
	ldr r0, _022308B0 @ =0x000004D4
	ldr r0, [r5, r0]
	bl FUN_020744D0
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	ldr r0, [sp, #4]
	movs r7, #0
	cmp r0, #0
	ble _0223086E
	movs r0, #0xa
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r4, r5, #0
	str r0, [sp, #8]
_0223082A:
	adds r0, r5, #0
	bl ov80_02237120
	adds r2, r0, #0
	ldr r0, _022308B4 @ =0x000004DC
	movs r1, #0x38
	ldrh r0, [r4, r0]
	muls r1, r0, r1
	ldr r0, [sp, #8]
	adds r0, r0, r1
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022308B8 @ =0x000004F8
	ldr r1, _022308B0 @ =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl ov80_0222A3BC
	ldr r0, _022308B4 @ =0x000004DC
	adds r7, r7, #1
	ldrh r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	ldr r0, _022308BC @ =0x000004E8
	strh r1, [r4, r0]
	ldr r0, [sp, #4]
	adds r4, r4, #2
	cmp r7, r0
	blt _0223082A
_0223086E:
	ldr r0, [sp]
	movs r7, #0
	cmp r0, #0
	ble _022308A4
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r4, r5, r0
_0223087C:
	adds r0, r5, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022308B8 @ =0x000004F8
	ldr r1, _022308C0 @ =0x000004D8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl ov80_0222A3BC
	ldr r0, [sp]
	adds r7, r7, #1
	adds r4, #0x38
	cmp r7, r0
	blt _0223087C
_022308A4:
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022308B0: .4byte 0x000004D4
_022308B4: .4byte 0x000004DC
_022308B8: .4byte 0x000004F8
_022308BC: .4byte 0x000004E8
_022308C0: .4byte 0x000004D8
	thumb_func_end ov80_022307F0

	thumb_func_start ov80_022308C4
ov80_022308C4: @ 0x022308C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	movs r1, #0
	adds r5, r0, #0
	add r2, sp, #0x3c
	add r3, sp, #0x2c
	adds r0, r1, #0
_022308D2:
	adds r1, r1, #1
	strh r0, [r2]
	strh r0, [r3]
	adds r2, r2, #2
	adds r3, r3, #2
	cmp r1, #8
	blt _022308D2
	ldrb r0, [r5, #4]
	movs r1, #1
	bl ov80_02236DF8
	str r0, [sp, #0x1c]
	ldr r0, _022309EC @ =0x000004D4
	ldr r0, [r5, r0]
	bl FUN_02074640
	movs r7, #0
	str r0, [sp, #0x20]
	cmp r0, #0
	ble _0223092C
	add r6, sp, #0x3c
	add r4, sp, #0x2c
_022308FE:
	ldr r0, _022309EC @ =0x000004D4
	adds r1, r7, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	str r0, [sp, #0x24]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r6]
	ldr r0, [sp, #0x24]
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4]
	ldr r0, [sp, #0x20]
	adds r7, r7, #1
	adds r6, r6, #2
	adds r4, r4, #2
	cmp r7, r0
	blt _022308FE
_0223092C:
	ldr r0, _022309F0 @ =0x000004D8
	ldr r0, [r5, r0]
	bl FUN_02074640
	movs r7, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _0223098A
	ldr r0, [sp, #0x20]
	str r5, [sp, #0x18]
	lsls r1, r0, #1
	add r0, sp, #0x3c
	adds r6, r0, r1
	add r0, sp, #0x2c
	adds r4, r0, r1
_0223094A:
	ldr r0, _022309F0 @ =0x000004D8
	adds r1, r7, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	str r0, [sp, #0x28]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r6]
	ldr r0, [sp, #0x28]
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r4]
	ldr r1, [sp, #0x18]
	ldr r0, _022309F4 @ =0x000003D2
	adds r7, r7, #1
	ldrh r2, [r1, r0]
	movs r0, #0x95
	lsls r0, r0, #2
	strh r2, [r1, r0]
	adds r0, r1, #0
	adds r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r6, r6, #2
	adds r4, r4, #2
	cmp r7, r0
	blt _0223094A
_0223098A:
	ldrb r0, [r5, #6]
	ldrb r1, [r5, #5]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0, #0x18]
	bl ov80_02236C2C
	ldr r1, _022309F4 @ =0x000003D2
	ldr r3, [sp, #0x20]
	adds r2, r5, r1
	str r2, [sp]
	movs r2, #0xb
	str r2, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	ldr r2, [sp, #0x14]
	adds r1, #8
	str r0, [sp, #0xc]
	adds r0, r5, r1
	str r0, [sp, #0x10]
	adds r2, r3, r2
	ldr r3, [sp, #0x1c]
	add r0, sp, #0x3c
	add r1, sp, #0x2c
	bl ov80_02236C9C
	movs r2, #0x3e
	lsls r2, r2, #4
	adds r0, r5, r2
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	adds r1, r2, #0
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	adds r0, r2, #0
	adds r0, #0x10
	subs r1, #0xe
	subs r2, r2, #6
	adds r0, r5, r0
	adds r1, r5, r1
	adds r2, r5, r2
	movs r3, #0
	bl ov80_0222A52C
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022309EC: .4byte 0x000004D4
_022309F0: .4byte 0x000004D8
_022309F4: .4byte 0x000003D2
	thumb_func_end ov80_022308C4

	thumb_func_start ov80_022309F8
ov80_022309F8: @ 0x022309F8
	push {r4, lr}
	ldr r1, _02230A50 @ =0x000004DC
	adds r4, r0, #0
	ldrh r0, [r4, r1]
	cmp r0, #0xff
	beq _02230A4C
	subs r0, r1, #4
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	ldr r0, [r4, r0]
	bl FUN_02074644
	ldr r1, _02230A54 @ =0x000004D4
	adds r2, r0, #0
	ldr r0, [r4, r1]
	adds r1, #8
	ldrh r1, [r4, r1]
	bl FUN_02074740
	ldr r1, _02230A58 @ =0x000004DE
	ldrh r0, [r4, r1]
	lsls r0, r0, #1
	adds r2, r4, r0
	movs r0, #0x95
	lsls r0, r0, #2
	ldrh r2, [r2, r0]
	subs r0, r1, #2
	ldrh r0, [r4, r0]
	adds r1, #0xa
	lsls r0, r0, #1
	adds r0, r4, r0
	strh r2, [r0, r1]
	adds r0, r4, #0
	bl ov80_02230AE4
	ldr r0, _02230A5C @ =0x000004F8
	ldr r0, [r4, r0]
	bl FUN_0202CF54
	movs r1, #0x41
	bl FUN_0202D0FC
_02230A4C:
	pop {r4, pc}
	nop
_02230A50: .4byte 0x000004DC
_02230A54: .4byte 0x000004D4
_02230A58: .4byte 0x000004DE
_02230A5C: .4byte 0x000004F8
	thumb_func_end ov80_022309F8

	thumb_func_start ov80_02230A60
ov80_02230A60: @ 0x02230A60
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	ldrb r0, [r4, #4]
	movs r1, #1
	bl ov80_02236DF8
	adds r6, r0, #0
	ldr r0, _02230ADC @ =0x000004D8
	ldr r0, [r4, r0]
	bl FUN_020744D0
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	cmp r6, #0
	ble _02230ABC
	movs r0, #0x3f
	lsls r0, r0, #4
	adds r5, r4, r0
_02230A92:
	adds r0, r4, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov80_0222A140
	ldr r0, _02230AE0 @ =0x000004F8
	ldr r1, _02230ADC @ =0x000004D8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	adds r2, r7, #0
	bl ov80_0222A3BC
	ldr r0, [sp]
	adds r5, #0x38
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, r6
	blt _02230A92
_02230ABC:
	adds r0, r7, #0
	bl FUN_0201AB0C
	movs r5, #0
	cmp r6, #0
	ble _02230AD8
	ldr r7, _02230ADC @ =0x000004D8
_02230ACA:
	ldr r0, [r4, r7]
	adds r1, r5, #0
	bl FUN_02074644
	adds r5, r5, #1
	cmp r5, r6
	blt _02230ACA
_02230AD8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230ADC: .4byte 0x000004D8
_02230AE0: .4byte 0x000004F8
	thumb_func_end ov80_02230A60

	thumb_func_start ov80_02230AE4
ov80_02230AE4: @ 0x02230AE4
	ldrh r2, [r0, #8]
	ldr r1, _02230AF4 @ =0x0000270F
	cmp r2, r1
	bhs _02230AF0
	adds r1, r2, #1
	strh r1, [r0, #8]
_02230AF0:
	bx lr
	nop
_02230AF4: .4byte 0x0000270F
	thumb_func_end ov80_02230AE4

	thumb_func_start ov80_02230AF8
ov80_02230AF8: @ 0x02230AF8
	push {r3, lr}
	cmp r1, #6
	bhi _02230B48
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02230B0A: @ jump table
	.2byte _02230B18 - _02230B0A - 2 @ case 0
	.2byte _02230B1E - _02230B0A - 2 @ case 1
	.2byte _02230B24 - _02230B0A - 2 @ case 2
	.2byte _02230B2A - _02230B0A - 2 @ case 3
	.2byte _02230B30 - _02230B0A - 2 @ case 4
	.2byte _02230B3A - _02230B0A - 2 @ case 5
	.2byte _02230B44 - _02230B0A - 2 @ case 6
_02230B18:
	bl ov80_0222B108
	pop {r3, pc}
_02230B1E:
	bl ov80_0222B174
	pop {r3, pc}
_02230B24:
	bl ov80_0222B1DC
	pop {r3, pc}
_02230B2A:
	bl ov80_0222B2C4
	pop {r3, pc}
_02230B30:
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl ov80_0222B3B0
	pop {r3, pc}
_02230B3A:
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl ov80_0222B3FC
	pop {r3, pc}
_02230B44:
	bl ov80_0222B448
_02230B48:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02230AF8

	thumb_func_start ov80_02230B4C
ov80_02230B4C: @ 0x02230B4C
	ldrb r3, [r0, #4]
	ldrh r2, [r0, #0xe]
	cmp r3, #1
	bhi _02230B62
	cmp r2, #8
	blo _02230B5C
	movs r1, #9
	b _02230B6E
_02230B5C:
	ldr r1, _02230B84 @ =0x0223BDD4
	ldrb r1, [r1, r2]
	b _02230B6E
_02230B62:
	cmp r2, #8
	blo _02230B6A
	movs r1, #0x15
	b _02230B6E
_02230B6A:
	ldr r1, _02230B88 @ =0x0223BDE0
	ldrb r1, [r1, r2]
_02230B6E:
	cmp r3, #0
	bne _02230B7E
	ldrh r0, [r0, #0xc]
	cmp r0, #0x15
	beq _02230B7C
	cmp r0, #0x31
	bne _02230B7E
_02230B7C:
	movs r1, #0x14
_02230B7E:
	adds r0, r1, #0
	bx lr
	nop
_02230B84: .4byte 0x0223BDD4
_02230B88: .4byte 0x0223BDE0
	thumb_func_end ov80_02230B4C

	thumb_func_start ov80_02230B8C
ov80_02230B8C: @ 0x02230B8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ov80_0222BE10
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	lsls r1, r7, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r2, r4, #0x18
	lsls r3, r6, #0x18
	ldr r0, [r0, #8]
	ldr r1, [sp, #4]
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl ov80_022310C4
	adds r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096818
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02230B8C

	thumb_func_start ov80_02230BE0
ov80_02230BE0: @ 0x02230BE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r4, #0
	bl ov80_022313C0
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02230BE0

	thumb_func_start ov80_02230BFC
ov80_02230BFC: @ 0x02230BFC
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_022314A0
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02230BFC

	thumb_func_start ov80_02230C10
ov80_02230C10: @ 0x02230C10
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096808
	adds r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	movs r0, #0xb
	movs r1, #0x20
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x20
	adds r5, r0, #0
	blx FUN_020D4994
	ldr r0, [r7, #8]
	ldr r1, _02230CD0 @ =0x00000704
	str r0, [r5]
	ldrb r0, [r4, #4]
	adds r3, r4, r1
	subs r1, #0xf
	strb r0, [r5, #4]
	str r4, [r5, #0x10]
	ldrb r2, [r4, #4]
	lsls r0, r2, #3
	adds r0, r2, r0
	adds r0, r3, r0
	str r0, [r5, #8]
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r5, #0xc]
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x18]
	ldrb r0, [r4, r1]
	strb r0, [r5, #5]
	ldr r0, _02230CD4 @ =0x00000D84
	adds r0, r4, r0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	bl FUN_020744D0
	ldr r0, [r7, #8]
	bl FUN_02074904
	movs r1, #0x26
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	adds r7, r0, #0
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_02074524
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _02230CA4
	ldr r1, _02230CD8 @ =0x00000261
	adds r0, r7, #0
	ldrb r1, [r4, r1]
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_02074524
	b _02230CB8
_02230CA4:
	adds r0, #0xfe
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02230CB8
	ldr r1, _02230CDC @ =0x00000D8C
	ldr r0, [r5, #0xc]
	ldr r1, [r4, r1]
	bl FUN_02074524
_02230CB8:
	ldr r0, _02230CE0 @ =ov80_02230D5C
	ldr r1, _02230CE4 @ =0x0223BDEC
	str r0, [sp]
	ldr r0, [r6]
	adds r2, r5, #0
	ldr r0, [r0]
	movs r3, #0
	bl FUN_02096820
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230CD0: .4byte 0x00000704
_02230CD4: .4byte 0x00000D84
_02230CD8: .4byte 0x00000261
_02230CDC: .4byte 0x00000D8C
_02230CE0: .4byte ov80_02230D5C
_02230CE4: .4byte 0x0223BDEC
	thumb_func_end ov80_02230C10

	thumb_func_start ov80_02230CE8
ov80_02230CE8: @ 0x02230CE8
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	movs r0, #7
	lsls r0, r0, #8
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl FUN_02052554
	str r0, [r4, #0x14]
	adds r0, r5, #0
	bl FUN_02051BF8
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02230CE8

	thumb_func_start ov80_02230D0C
ov80_02230D0C: @ 0x02230D0C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r4, r0, #0
	bl ov80_022375D0
	adds r6, r0, #0
	movs r0, #7
	lsls r0, r0, #8
	str r6, [r4, r0]
	ldr r1, _02230D54 @ =0x0000045D
	movs r0, #5
	movs r2, #1
	bl FUN_02004EC4
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02230D58 @ =0x020FA484
	ldr r0, [r0]
	adds r2, r6, #0
	bl FUN_02096820
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02230D54: .4byte 0x0000045D
_02230D58: .4byte 0x020FA484
	thumb_func_end ov80_02230D0C

	thumb_func_start ov80_02230D5C
ov80_02230D5C: @ 0x02230D5C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	adds r1, r4, #0
	bl ov80_022314DC
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov80_02230D5C

	thumb_func_start ov80_02230D70
ov80_02230D70: @ 0x02230D70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x1c]
	adds r2, r1, #1
	str r2, [r4, #0x1c]
	ldrb r7, [r1]
	adds r1, r2, #1
	str r1, [r4, #0x1c]
	ldrb r6, [r2]
	adds r1, r1, #1
	str r1, [r4, #0x1c]
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096808
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	cmp r7, #0x26
	bls _02230DA8
	b _02230FB6
_02230DA8:
	adds r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02230DB4: @ jump table
	.2byte _02230FB6 - _02230DB4 - 2 @ case 0
	.2byte _02230FB6 - _02230DB4 - 2 @ case 1
	.2byte _02230E02 - _02230DB4 - 2 @ case 2
	.2byte _02230E06 - _02230DB4 - 2 @ case 3
	.2byte _02230E0E - _02230DB4 - 2 @ case 4
	.2byte _02230E14 - _02230DB4 - 2 @ case 5
	.2byte _02230FB6 - _02230DB4 - 2 @ case 6
	.2byte _02230E22 - _02230DB4 - 2 @ case 7
	.2byte _02230FB6 - _02230DB4 - 2 @ case 8
	.2byte _02230E2A - _02230DB4 - 2 @ case 9
	.2byte _02230E36 - _02230DB4 - 2 @ case 10
	.2byte _02230FB6 - _02230DB4 - 2 @ case 11
	.2byte _02230FB6 - _02230DB4 - 2 @ case 12
	.2byte _02230FB6 - _02230DB4 - 2 @ case 13
	.2byte _02230E3E - _02230DB4 - 2 @ case 14
	.2byte _02230F6C - _02230DB4 - 2 @ case 15
	.2byte _02230FB6 - _02230DB4 - 2 @ case 16
	.2byte _02230F00 - _02230DB4 - 2 @ case 17
	.2byte _02230FB6 - _02230DB4 - 2 @ case 18
	.2byte _02230E46 - _02230DB4 - 2 @ case 19
	.2byte _02230E58 - _02230DB4 - 2 @ case 20
	.2byte _02230E62 - _02230DB4 - 2 @ case 21
	.2byte _02230E68 - _02230DB4 - 2 @ case 22
	.2byte _02230E6E - _02230DB4 - 2 @ case 23
	.2byte _02230E76 - _02230DB4 - 2 @ case 24
	.2byte _02230FB6 - _02230DB4 - 2 @ case 25
	.2byte _02230FB6 - _02230DB4 - 2 @ case 26
	.2byte _02230E7E - _02230DB4 - 2 @ case 27
	.2byte _02230EBA - _02230DB4 - 2 @ case 28
	.2byte _02230EF0 - _02230DB4 - 2 @ case 29
	.2byte _02230EF6 - _02230DB4 - 2 @ case 30
	.2byte _02230F06 - _02230DB4 - 2 @ case 31
	.2byte _02230F1E - _02230DB4 - 2 @ case 32
	.2byte _02230F4C - _02230DB4 - 2 @ case 33
	.2byte _02230F64 - _02230DB4 - 2 @ case 34
	.2byte _02230F8A - _02230DB4 - 2 @ case 35
	.2byte _02230F90 - _02230DB4 - 2 @ case 36
	.2byte _02230F96 - _02230DB4 - 2 @ case 37
	.2byte _02230FB6 - _02230DB4 - 2 @ case 38
_02230E02:
	strb r6, [r4, #4]
	b _02230FB6
_02230E06:
	ldr r0, _02230FBC @ =0x000006F2
	ldrh r0, [r4, r0]
	strh r0, [r5]
	b _02230FB6
_02230E0E:
	ldrh r0, [r4, #8]
	strh r0, [r5]
	b _02230FB6
_02230E14:
	ldrh r1, [r4, #8]
	ldr r0, _02230FC0 @ =0x0000270F
	cmp r1, r0
	bhs _02230EB8
	adds r0, r1, #1
	strh r0, [r4, #8]
	b _02230FB6
_02230E22:
	movs r0, #0
	blx FUN_020D3B84
	b _02230FB6
_02230E2A:
	ldr r0, _02230FC4 @ =0x000006F8
	ldr r0, [r4, r0]
	bl FUN_02030B14
	strh r0, [r5]
	b _02230FB6
_02230E36:
	movs r1, #2
	bl ov80_0223157C
	b _02230FB6
_02230E3E:
	bl ov80_022317C0
	strh r0, [r5]
	b _02230FB6
_02230E46:
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _02230E52
	movs r0, #0xa
	strh r0, [r5]
	b _02230FB6
_02230E52:
	ldrh r0, [r4, #0xa]
	strh r0, [r5]
	b _02230FB6
_02230E58:
	adds r1, r6, #0
	bl ov80_022317D0
	strh r0, [r5]
	b _02230FB6
_02230E62:
	bl ov80_02231804
	b _02230FB6
_02230E68:
	bl ov80_02231828
	b _02230FB6
_02230E6E:
	bl ov80_022317CC
	strh r0, [r5]
	b _02230FB6
_02230E76:
	ldr r0, _02230FC8 @ =0x00000D88
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _02230FB6
_02230E7E:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl FUN_02074904
	str r0, [sp]
	ldrb r0, [r4, #4]
	bl ov80_0223787C
	adds r7, r0, #0
	movs r5, #0
	cmp r7, #0
	ble _02230EB8
	ldr r0, _02230FCC @ =0x00000728
	adds r6, r4, r0
_02230E9A:
	movs r1, #0x26
	adds r2, r4, r5
	lsls r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [sp]
	bl FUN_02074644
	movs r1, #6
	adds r2, r6, #0
	bl FUN_0206EC40
	adds r5, r5, #1
	adds r6, r6, #2
	cmp r5, r7
	blt _02230E9A
_02230EB8:
	b _02230FB6
_02230EBA:
	ldr r1, _02230FD0 @ =0x000006F5
	ldrb r2, [r4, #4]
	ldrb r0, [r4, r1]
	adds r1, #0xf
	adds r3, r4, r1
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r3, r1
	bl FUN_02030BD0
	adds r2, r0, #0
	cmp r2, #0xa
	bhs _02230FB6
	ldr r1, _02230FD0 @ =0x000006F5
	ldrb r3, [r4, #4]
	ldrb r0, [r4, r1]
	adds r1, #0xf
	adds r5, r4, r1
	lsls r1, r3, #3
	adds r2, r2, #1
	adds r1, r3, r1
	lsls r2, r2, #0x18
	adds r1, r5, r1
	lsrs r2, r2, #0x18
	bl FUN_02030BF4
	b _02230FB6
_02230EF0:
	bl FUN_02096910
	b _02230FB6
_02230EF6:
	ldrb r0, [r4, #4]
	bl ov80_0223792C
	strh r0, [r5]
	b _02230FB6
_02230F00:
	ldrb r0, [r4, #4]
	strh r0, [r5]
	b _02230FB6
_02230F06:
	cmp r6, #0
	bne _02230F14
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	b _02230FB6
_02230F14:
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	b _02230FB6
_02230F1E:
	ldrb r1, [r4, #5]
	adds r0, #0x40
	movs r2, #0xb
	lsls r1, r1, #2
	adds r1, r4, r1
	ldrh r1, [r1, #0x18]
	movs r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #5]
	movs r0, #0x15
	lsls r0, r0, #4
	lsls r1, r1, #1
	adds r1, r1, #1
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1, #0x18]
	adds r0, r4, r0
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_0222A474
	b _02230FB6
_02230F4C:
	ldr r1, _02230FD0 @ =0x000006F5
	ldrb r2, [r4, #4]
	ldrb r0, [r4, r1]
	adds r1, #0xf
	adds r3, r4, r1
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r3, r1
	bl FUN_02030BD0
	strh r0, [r5]
	b _02230FB6
_02230F64:
	bl ov80_02231888
	strh r0, [r5]
	b _02230FB6
_02230F6C:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl FUN_02074904
	movs r1, #0x26
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r5]
	b _02230FB6
_02230F8A:
	bl ov80_022319B0
	b _02230FB6
_02230F90:
	bl ov80_02231A04
	b _02230FB6
_02230F96:
	movs r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _02230FB6
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	cmp r0, #0x32
	bne _02230FAE
	movs r0, #1
	strh r0, [r5]
	b _02230FB6
_02230FAE:
	cmp r0, #0xaa
	bne _02230FB6
	movs r0, #2
	strh r0, [r5]
_02230FB6:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230FBC: .4byte 0x000006F2
_02230FC0: .4byte 0x0000270F
_02230FC4: .4byte 0x000006F8
_02230FC8: .4byte 0x00000D88
_02230FCC: .4byte 0x00000728
_02230FD0: .4byte 0x000006F5
	thumb_func_end ov80_02230D70

	thumb_func_start ov80_02230FD4
ov80_02230FD4: @ 0x02230FD4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r0, [r0, #0x14]
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02230FD4

	thumb_func_start ov80_02230FF0
ov80_02230FF0: @ 0x02230FF0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_02231844
	strh r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02230FF0

	thumb_func_start ov80_02231020
ov80_02231020: @ 0x02231020
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _0223103C @ =ov80_02231040
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_0223103C: .4byte ov80_02231040
	thumb_func_end ov80_02231020

	thumb_func_start ov80_02231040
ov80_02231040: @ 0x02231040
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	movs r1, #0xd9
	lsls r1, r1, #4
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _02231068
	movs r2, #0
	strb r2, [r0, r1]
	movs r0, #1
	pop {r4, pc}
_02231068:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_02231040

	thumb_func_start ov80_0223106C
ov80_0223106C: @ 0x0223106C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r5, #0x1c]
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0]
	bl FUN_02096810
	adds r2, r0, #0
	bne _02231090
	movs r0, #0
	pop {r3, r4, r5, pc}
_02231090:
	lsls r1, r4, #4
	adds r1, r4, r1
	adds r2, #0x58
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r2, r1
	bl ov80_0222F44C
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223106C

	thumb_func_start ov80_022310A4
ov80_022310A4: @ 0x022310A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r4, #0
	bl ov80_0223151C
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022310A4

	thumb_func_start ov80_022310C0
ov80_022310C0: @ 0x022310C0
	movs r0, #0
	bx lr
	thumb_func_end ov80_022310C0

	thumb_func_start ov80_022310C4
ov80_022310C4: @ 0x022310C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	str r0, [sp, #4]
	ldr r1, _022313A0 @ =0x00000D98
	movs r0, #0xb
	adds r6, r2, #0
	str r3, [sp, #8]
	bl FUN_0201AA8C
	ldr r1, _022313A4 @ =0x0223DD44
	ldr r2, _022313A0 @ =0x00000D98
	str r0, [r1]
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r4, [r0]
	ldr r0, [sp, #4]
	bl FUN_02030B04
	ldr r1, _022313A8 @ =0x000006F8
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	adds r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0xb
	ldr r1, _022313A4 @ =0x0223DD44
	str r0, [r4]
	ldr r4, [r1]
	bl FUN_020744BC
	movs r1, #0x99
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xb
	bl FUN_0206DD2C
	ldr r1, _022313AC @ =0x00000D8C
	str r0, [r4, r1]
	ldr r0, _022313A8 @ =0x000006F8
	ldr r4, [r4, r0]
	ldr r0, [sp, #4]
	bl FUN_02030C5C
	str r0, [sp, #0xc]
	cmp r5, #0
	bne _022311E0
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r0, [r0]
	strb r6, [r0, #4]
	ldrb r0, [r0, #4]
	bl ov80_0223787C
	adds r6, r0, #0
	ldr r0, _022313A4 @ =0x0223DD44
	movs r1, #0
	ldr r0, [r0]
	strb r1, [r0, #5]
	adds r0, r4, #0
	bl FUN_02030AF8
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r1, [r0]
	ldrb r2, [r1, #4]
	cmp r2, #3
	bne _02231158
	ldr r0, _022313B0 @ =0x000006FC
	ldr r0, [r1, r0]
	bl FUN_020503D0
	bl FUN_02066E48
	b _02231164
_02231158:
	ldr r0, [sp, #0xc]
	movs r3, #0
	movs r1, #5
	str r3, [sp]
	bl FUN_02030CA0
_02231164:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _022311A6
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 @ =0x000006FC
	ldr r0, [r1, r0]
	bl FUN_0203107C
	adds r4, r0, #0
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl FUN_0205C0CC
	adds r5, r0, #0
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl FUN_0205C0CC
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_020310BC
	ldr r1, _022313A4 @ =0x0223DD44
	ldr r1, [r1]
	strh r0, [r1, #8]
	b _022311CA
_022311A6:
	ldr r5, _022313A4 @ =0x0223DD44
	movs r4, #0
	ldr r0, [r5]
	ldr r7, _022313B0 @ =0x000006FC
	strh r4, [r0, #8]
_022311B0:
	ldr r1, [r5]
	lsls r2, r4, #0x18
	ldr r0, [r1, r7]
	ldrb r1, [r1, #4]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl ov80_02231930
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x12
	blo _022311B0
_022311CA:
	ldr r0, _022313A4 @ =0x0223DD44
	movs r1, #0x26
	ldr r3, [r0]
	ldr r0, [sp, #8]
	lsls r1, r1, #4
	strb r0, [r3, r1]
	add r0, sp, #0x20
	ldrb r2, [r0, #0x10]
	adds r0, r1, #1
	strb r2, [r3, r0]
	b _022312CA
_022311E0:
	ldr r0, _022313A4 @ =0x0223DD44
	movs r1, #0
	ldr r5, [r0]
	str r1, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02030B88
	strb r0, [r5, #4]
	ldrb r0, [r5, #4]
	bl ov80_0223787C
	movs r2, #0
	adds r6, r0, #0
	ldr r0, _022313A4 @ =0x0223DD44
	str r2, [sp]
	ldr r5, [r0]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02030B88
	strb r0, [r5, #5]
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 @ =0x000006FC
	ldr r0, [r1, r0]
	bl FUN_0203107C
	adds r7, r0, #0
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl FUN_0205C0CC
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl FUN_0205C0CC
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp, #0x10]
	adds r0, r7, #0
	bl FUN_020310BC
	ldr r1, _022313A4 @ =0x0223DD44
	movs r5, #0
	ldr r1, [r1]
	cmp r6, #0
	strh r0, [r1, #8]
	ble _02231272
	adds r7, r5, #0
_0223124C:
	lsls r2, r5, #0x18
	adds r0, r4, #0
	movs r1, #3
	lsrs r2, r2, #0x18
	adds r3, r7, #0
	str r7, [sp]
	bl FUN_02030B88
	ldr r1, _022313A4 @ =0x0223DD44
	ldr r1, [r1]
	adds r2, r1, r5
	movs r1, #0x26
	lsls r1, r1, #4
	strb r0, [r2, r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r6
	blt _0223124C
_02231272:
	movs r5, #0
	adds r7, r5, #0
_02231276:
	lsls r2, r5, #0x18
	adds r0, r4, #0
	movs r1, #2
	lsrs r2, r2, #0x18
	adds r3, r7, #0
	str r7, [sp]
	bl FUN_02030B88
	ldr r1, _022313A4 @ =0x0223DD44
	ldr r2, [r1]
	lsls r1, r5, #1
	adds r1, r2, r1
	strh r0, [r1, #0x18]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x14
	blo _02231276
	movs r5, #0
_0223129C:
	ldr r0, _022313A4 @ =0x0223DD44
	lsls r2, r5, #0x18
	ldr r7, [r0]
	movs r0, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #4
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030B88
	lsls r1, r5, #1
	lsls r0, r0, #0x18
	adds r2, r7, r1
	movs r1, #0x9a
	lsrs r0, r0, #0x18
	lsls r1, r1, #2
	strh r0, [r2, r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x14
	blo _0223129C
_022312CA:
	movs r5, #0
	cmp r6, #0
	ble _02231304
	ldr r7, _022313A4 @ =0x0223DD44
_022312D2:
	ldr r4, [r7]
	ldr r0, _022313B0 @ =0x000006FC
	ldr r0, [r4, r0]
	bl FUN_02074904
	movs r1, #0x26
	adds r2, r4, r5
	lsls r1, r1, #4
	ldrb r1, [r2, r1]
	bl FUN_02074644
	ldr r4, [r7]
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r1, r5, #1
	adds r2, r4, r1
	ldr r1, _022313B4 @ =0x00000728
	strh r0, [r2, r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r6
	blt _022312D2
_02231304:
	ldr r0, _022313A4 @ =0x0223DD44
	movs r1, #0xa
	ldr r4, [r0]
	movs r0, #0
	str r0, [r4, #0x10]
	ldrh r0, [r4, #8]
	blx FUN_020F2998
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _0223133E
	ldr r4, _022313A4 @ =0x0223DD44
	ldr r6, _022313B8 @ =0x00000716
	movs r5, #0
	movs r7, #9
_02231324:
	ldr r1, [r4]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	adds r1, r1, r6
	adds r2, r7, #0
	bl FUN_02030BF4
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x12
	blo _02231324
	b _0223137E
_0223133E:
	ldr r5, _022313A4 @ =0x0223DD44
	movs r4, #0
	add r7, sp, #0x14
_02231344:
	ldr r1, [r5]
	str r7, [sp]
	ldrb r1, [r1, #4]
	lsls r2, r4, #0x18
	add r3, sp, #0x14
	ldr r0, [sp, #4]
	lsrs r2, r2, #0x18
	adds r3, #2
	bl ov80_022318D0
	adds r2, r0, #0
	lsls r0, r4, #0x18
	lsls r2, r2, #0x18
	ldr r1, [r5]
	ldr r3, _022313BC @ =0x00000704
	lsrs r0, r0, #0x18
	adds r6, r1, r3
	ldrb r3, [r1, #4]
	lsrs r2, r2, #0x18
	lsls r1, r3, #3
	adds r1, r3, r1
	adds r1, r6, r1
	bl FUN_02030BF4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x12
	blo _02231344
_0223137E:
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl ov80_0223792C
	cmp r0, #1
	bne _02231398
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 @ =0x000006FC
	ldr r0, [r1, r0]
	bl ov80_0222A840
_02231398:
	ldr r0, _022313A4 @ =0x0223DD44
	ldr r0, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022313A0: .4byte 0x00000D98
_022313A4: .4byte 0x0223DD44
_022313A8: .4byte 0x000006F8
_022313AC: .4byte 0x00000D8C
_022313B0: .4byte 0x000006FC
_022313B4: .4byte 0x00000728
_022313B8: .4byte 0x00000716
_022313BC: .4byte 0x00000704
	thumb_func_end ov80_022310C4

	thumb_func_start ov80_022313C0
ov80_022313C0: @ 0x022313C0
	ldr r3, _022313C4 @ =ov80_022313C8
	bx r3
	.align 2, 0
_022313C4: .4byte ov80_022313C8
	thumb_func_end ov80_022313C0

	thumb_func_start ov80_022313C8
ov80_022313C8: @ 0x022313C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldrb r2, [r5, #4]
	movs r4, #0
	movs r6, #1
	cmp r2, #0
	beq _022313DA
	movs r6, #2
_022313DA:
	ldr r1, _02231490 @ =0x000006F5
	lsls r3, r2, #3
	ldrb r0, [r5, r1]
	adds r1, #0xf
	adds r1, r5, r1
	adds r2, r2, r3
	adds r1, r1, r2
	bl FUN_02030BD0
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_02231A14
	strb r0, [r5, #7]
	adds r0, r5, #0
	adds r0, #0x18
	str r0, [sp]
	ldr r0, _02231490 @ =0x000006F5
	ldrb r3, [r5, #5]
	ldrb r0, [r5, r0]
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_022372D8
	ldrb r0, [r5, #5]
	adds r1, r6, #0
	adds r3, r7, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x18
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	ldrh r2, [r5, #0xa]
	bl ov80_02237334
	ldrb r0, [r5, #5]
	adds r6, r5, #0
	adds r6, #0x18
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x17
	ldrh r1, [r6, r0]
	str r0, [sp, #0xc]
	ldr r0, _02231494 @ =0x0000FECD
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _02231444
	adds r0, r5, #0
	bl ov80_0223793C
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_02231444:
	ldr r0, [sp, #0xc]
	ldrh r1, [r6, r0]
	ldr r0, _02231498 @ =0x00000133
	cmp r1, r0
	bne _02231450
	movs r4, #1
_02231450:
	movs r0, #0x4d
	lsls r0, r0, #2
	cmp r1, r0
	bne _0223145A
	movs r4, #2
_0223145A:
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r1, _0223149C @ =0x000006F4
	ldrb r3, [r5, #5]
	ldrb r1, [r5, r1]
	movs r0, #1
	adds r2, r7, #0
	bl ov80_02237448
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231490: .4byte 0x000006F5
_02231494: .4byte 0x0000FECD
_02231498: .4byte 0x00000133
_0223149C: .4byte 0x000006F4
	thumb_func_end ov80_022313C8

	thumb_func_start ov80_022314A0
ov80_022314A0: @ 0x022314A0
	push {r4, lr}
	adds r4, r0, #0
	beq _022314D0
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022314B4
	bl FUN_0201AB0C
_022314B4:
	ldr r0, _022314D4 @ =0x00000D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022314C0
	bl FUN_0201AB0C
_022314C0:
	ldr r2, _022314D8 @ =0x00000D98
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
_022314D0:
	pop {r4, pc}
	nop
_022314D4: .4byte 0x00000D8C
_022314D8: .4byte 0x00000D98
	thumb_func_end ov80_022314A0

	thumb_func_start ov80_022314DC
ov80_022314DC: @ 0x022314DC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #0
	bl ov80_02231518
	ldr r1, _02231510 @ =0x000006F2
	strh r0, [r4, r1]
	ldrh r2, [r4, r1]
	adds r0, r1, #3
	strb r2, [r4, r0]
	ldrh r0, [r4, r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov80_02237920
	ldr r1, _02231514 @ =0x000006F4
	strb r0, [r4, r1]
	adds r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #0x11
	blo _0223150E
	movs r2, #0x11
	adds r0, r1, #1
	strb r2, [r4, r0]
_0223150E:
	pop {r4, pc}
	.align 2, 0
_02231510: .4byte 0x000006F2
_02231514: .4byte 0x000006F4
	thumb_func_end ov80_022314DC

	thumb_func_start ov80_02231518
ov80_02231518: @ 0x02231518
	ldrh r0, [r0, #6]
	bx lr
	thumb_func_end ov80_02231518

	thumb_func_start ov80_0223151C
ov80_0223151C: @ 0x0223151C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldrb r6, [r5, #4]
	adds r4, r1, #0
	cmp r6, #3
	beq _0223156E
	adds r0, r6, #0
	bl FUN_0205C0F4
	adds r7, r0, #0
	ldrb r0, [r5, #4]
	bl FUN_0205C11C
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl FUN_0205C0F4
	bl FUN_0205C268
	str r0, [sp, #0x14]
	adds r0, r6, #0
	bl FUN_0205C144
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	add r0, sp, #0x18
	str r0, [sp, #0xc]
	ldr r0, _02231578 @ =0x000006FC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x14]
	adds r1, r7, #0
	bl FUN_020313C4
	add sp, #0x20
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0223156E:
	movs r0, #0
	strh r0, [r4]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231578: .4byte 0x000006FC
	thumb_func_end ov80_0223151C

	thumb_func_start ov80_0223157C
ov80_0223157C: @ 0x0223157C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, _022317B4 @ =0x000006FC
	adds r4, r1, #0
	ldr r0, [r5, r0]
	bl FUN_02030C5C
	str r0, [sp, #4]
	ldr r0, _022317B4 @ =0x000006FC
	ldr r0, [r5, r0]
	bl FUN_0203107C
	str r0, [sp, #0xc]
	ldrb r1, [r5, #4]
	add r0, sp, #0x14
	strb r1, [r0, #8]
	movs r1, #0
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r0, _022317B8 @ =0x000006F8
	adds r2, r1, #0
	ldr r0, [r5, r0]
	adds r3, r1, #0
	bl FUN_02030B30
	ldr r0, _022317B8 @ =0x000006F8
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02030B1C
	ldr r0, _022317B4 @ =0x000006FC
	ldr r0, [r5, r0]
	bl FUN_02074904
	movs r1, #0x26
	lsls r1, r1, #4
	ldrb r1, [r5, r1]
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	str r0, [sp, #8]
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r0, [r5, #4]
	bl FUN_0205C11C
	adds r7, r0, #0
	ldrb r0, [r5, #4]
	bl FUN_0205C11C
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [sp, #0xc]
	adds r1, r7, #0
	bl FUN_020310BC
	adds r7, r0, #0
	movs r2, #0
	ldrb r1, [r5, #5]
	add r0, sp, #0x14
	adds r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r0, _022317B8 @ =0x000006F8
	movs r1, #1
	ldr r0, [r5, r0]
	bl FUN_02030B30
	ldrb r0, [r5, #4]
	bl FUN_0205C0CC
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl FUN_0205C0CC
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl FUN_02031108
	cmp r4, #2
	beq _022316C8
	ldrb r4, [r5, #4]
	cmp r4, #3
	beq _02231658
	adds r0, r4, #0
	bl FUN_0205C0F4
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0205C0F4
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	bl FUN_02031108
	b _0223169A
_02231658:
	cmp r7, r6
	beq _0223167C
	adds r0, r4, #0
	bl FUN_0205C0F4
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0205C0F4
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	bl FUN_02031108
	b _0223169A
_0223167C:
	adds r0, r4, #0
	bl FUN_0205C0F4
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0205C0F4
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	bl FUN_0203126C
_0223169A:
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	movs r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x1c
	str r0, [sp]
	ldrb r2, [r5, #4]
	ldr r0, [sp, #4]
	movs r1, #5
	bl FUN_02030C6C
	ldrb r0, [r5, #4]
	cmp r0, #3
	bne _022316C8
	movs r0, #0x6a
	bl FUN_0205C268
	adds r2, r0, #0
	ldrb r3, [r5, #6]
	ldr r0, [sp, #0xc]
	movs r1, #0x6a
	bl FUN_02031108
_022316C8:
	movs r4, #0
	add r6, sp, #0x14
	add r7, sp, #0x14
_022316CE:
	lsls r0, r4, #1
	adds r0, r5, r0
	ldrh r0, [r0, #0x18]
	lsls r2, r4, #0x18
	movs r1, #2
	strh r0, [r7]
	ldr r0, _022317B8 @ =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030B30
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x14
	blo _022316CE
	movs r4, #0
	add r6, sp, #0x1c
	add r7, sp, #0x14
_022316F8:
	movs r0, #0x26
	adds r1, r5, r4
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	lsls r2, r4, #0x18
	movs r1, #3
	strb r0, [r7, #8]
	ldr r0, _022317B8 @ =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030B30
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #2
	blo _022316F8
	ldr r0, _022317BC @ =0x00000704
	movs r4, #0
	adds r6, r5, r0
	add r7, sp, #0x14
_02231726:
	ldrb r2, [r5, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r6, r1
	bl FUN_02030BD0
	strb r0, [r7, #8]
	ldr r0, _022317B4 @ =0x000006FC
	lsls r2, r4, #0x18
	ldrb r1, [r5, #4]
	ldrb r3, [r7, #8]
	ldr r0, [r5, r0]
	lsrs r2, r2, #0x18
	bl ov80_02231930
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x12
	blo _02231726
	movs r4, #0
	add r6, sp, #0x14
	add r7, sp, #0x14
_02231758:
	lsls r0, r4, #1
	adds r1, r5, r0
	movs r0, #0x9a
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	lsls r2, r4, #0x18
	movs r1, #4
	strh r0, [r7]
	ldr r0, _022317B8 @ =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030B30
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x14
	blo _02231758
	ldrb r0, [r5, #4]
	bl FUN_0205C11C
	adds r4, r0, #0
	ldrb r0, [r5, #4]
	bl FUN_0205C11C
	bl FUN_0205C268
	adds r5, r0, #0
	ldr r0, [sp, #8]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r3, r0, #0
	lsls r3, r3, #0x10
	ldr r0, [sp, #0xc]
	adds r1, r4, #0
	adds r2, r5, #0
	lsrs r3, r3, #0x10
	bl FUN_02031108
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022317B4: .4byte 0x000006FC
_022317B8: .4byte 0x000006F8
_022317BC: .4byte 0x00000704
	thumb_func_end ov80_0223157C

	thumb_func_start ov80_022317C0
ov80_022317C0: @ 0x022317C0
	ldrb r1, [r0, #5]
	adds r1, r1, #1
	strb r1, [r0, #5]
	ldrb r0, [r0, #5]
	bx lr
	.align 2, 0
	thumb_func_end ov80_022317C0

	thumb_func_start ov80_022317CC
ov80_022317CC: @ 0x022317CC
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end ov80_022317CC

	thumb_func_start ov80_022317D0
ov80_022317D0: @ 0x022317D0
	push {r3, lr}
	sub sp, #0x30
	adds r2, r0, #0
	ldrb r3, [r2, #5]
	add r0, sp, #0
	lsls r3, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r1, r2, r1
	ldrh r1, [r1, #0x18]
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_022317D0

	thumb_func_start ov80_02231804
ov80_02231804: @ 0x02231804
	push {r4, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #4]
	ldr r0, _02231824 @ =0x00000704
	adds r2, r4, r0
	lsls r0, r1, #3
	adds r0, r1, r0
	adds r0, r2, r0
	bl FUN_02030C34
	adds r0, r4, #0
	movs r1, #1
	bl ov80_0223157C
	pop {r4, pc}
	nop
_02231824: .4byte 0x00000704
	thumb_func_end ov80_02231804

	thumb_func_start ov80_02231828
ov80_02231828: @ 0x02231828
	movs r1, #1
	strb r1, [r0, #6]
	ldrh r1, [r0, #0xa]
	cmp r1, #0x12
	bhs _02231836
	adds r1, r1, #1
	strh r1, [r0, #0xa]
_02231836:
	ldr r3, _02231840 @ =ov80_0223157C
	movs r1, #0
	strb r1, [r0, #5]
	bx r3
	nop
_02231840: .4byte ov80_0223157C
	thumb_func_end ov80_02231828

	thumb_func_start ov80_02231844
ov80_02231844: @ 0x02231844
	push {r3, lr}
	cmp r1, #7
	bhi _02231886
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02231856: @ jump table
	.2byte _02231866 - _02231856 - 2 @ case 0
	.2byte _0223186C - _02231856 - 2 @ case 1
	.2byte _02231872 - _02231856 - 2 @ case 2
	.2byte _02231878 - _02231856 - 2 @ case 3
	.2byte _02231886 - _02231856 - 2 @ case 4
	.2byte _02231886 - _02231856 - 2 @ case 5
	.2byte _02231886 - _02231856 - 2 @ case 6
	.2byte _02231882 - _02231856 - 2 @ case 7
_02231866:
	bl ov80_0222AF10
	pop {r3, pc}
_0223186C:
	bl ov80_0222AF54
	pop {r3, pc}
_02231872:
	bl ov80_0222AFB8
	pop {r3, pc}
_02231878:
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl ov80_0222B024
	pop {r3, pc}
_02231882:
	bl ov80_0222B070
_02231886:
	pop {r3, pc}
	thumb_func_end ov80_02231844

	thumb_func_start ov80_02231888
ov80_02231888: @ 0x02231888
	ldrb r3, [r0, #4]
	ldrh r2, [r0, #0xa]
	cmp r3, #1
	bhi _0223189E
	cmp r2, #0x12
	blo _02231898
	movs r1, #0xc
	b _022318AA
_02231898:
	ldr r1, _022318C8 @ =0x0223BDFC
	ldrb r1, [r1, r2]
	b _022318AA
_0223189E:
	cmp r2, #0x12
	blo _022318A6
	movs r1, #0x17
	b _022318AA
_022318A6:
	ldr r1, _022318CC @ =0x0223BE10
	ldrb r1, [r1, r2]
_022318AA:
	cmp r3, #0
	bne _022318BC
	ldrh r0, [r0, #8]
	cmp r0, #0x32
	beq _022318B8
	cmp r0, #0xaa
	bne _022318C2
_022318B8:
	movs r1, #0x14
	b _022318C2
_022318BC:
	cmp r3, #2
	bne _022318C2
	movs r1, #0xc
_022318C2:
	adds r0, r1, #0
	bx lr
	nop
_022318C8: .4byte 0x0223BDFC
_022318CC: .4byte 0x0223BE10
	thumb_func_end ov80_02231888

	thumb_func_start ov80_022318D0
ov80_022318D0: @ 0x022318D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x20]
	bl FUN_0203107C
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_0205C0A0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r5, #0
	bl FUN_0205C0A0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl FUN_020310BC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xf
	ands r0, r1
	strh r0, [r6]
	asrs r0, r1, #4
	strh r0, [r4]
	lsrs r2, r5, #0x1f
	lsls r1, r5, #0x1f
	subs r1, r1, r2
	movs r0, #0x1f
	rors r1, r0
	adds r0, r2, r1
	bne _02231928
	add sp, #8
	ldrh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02231928:
	ldrh r0, [r4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_022318D0

	thumb_func_start ov80_02231930
ov80_02231930: @ 0x02231930
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r3, #0
	add r3, sp, #0xc
	str r3, [sp]
	add r3, sp, #0xc
	adds r3, #2
	str r0, [sp, #4]
	adds r6, r1, #0
	adds r5, r2, #0
	bl ov80_022318D0
	add r0, sp, #0xc
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	lsrs r3, r5, #0x1f
	lsls r1, r1, #4
	orrs r0, r1
	lsls r2, r5, #0x1f
	lsls r0, r0, #0x18
	subs r2, r2, r3
	movs r1, #0x1f
	rors r2, r1
	adds r1, r3, r2
	lsls r1, r1, #0x18
	lsrs r0, r0, #0x18
	lsrs r1, r1, #0x18
	bne _0223196C
	movs r2, #0xf0
	b _0223196E
_0223196C:
	movs r2, #0xf
_0223196E:
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r1, #2
	adds r1, r7, #0
	lsls r1, r0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	orrs r4, r0
	ldr r0, [sp, #4]
	bl FUN_0203107C
	adds r7, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0205C0A0
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0205C0A0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp, #8]
	adds r0, r7, #0
	adds r3, r4, #0
	bl FUN_02031108
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02231930

	thumb_func_start ov80_022319B0
ov80_022319B0: @ 0x022319B0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _022319FE
	ldr r0, _02231A00 @ =0x00000704
	movs r4, #0
	adds r6, r5, r0
_022319C0:
	ldrb r2, [r5, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r6, r1
	bl FUN_02030BD0
	cmp r0, #0xa
	blo _022319DA
	adds r4, r4, #1
	cmp r4, #0x11
	blt _022319C0
_022319DA:
	cmp r4, #0x11
	bne _022319FE
	ldr r0, _02231A00 @ =0x00000704
	movs r4, #0
	adds r6, r5, r0
	movs r7, #9
_022319E6:
	ldrb r2, [r5, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r6, r1
	adds r2, r7, #0
	bl FUN_02030BF4
	adds r4, r4, #1
	cmp r4, #0x11
	blt _022319E6
_022319FE:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231A00: .4byte 0x00000704
	thumb_func_end ov80_022319B0

	thumb_func_start ov80_02231A04
ov80_02231A04: @ 0x02231A04
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_022379C8
	bl ov80_02237A40
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end ov80_02231A04

	thumb_func_start ov80_02231A14
ov80_02231A14: @ 0x02231A14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r1, _02231BE0 @ =0x000006F5
	ldrb r2, [r6, #4]
	ldrb r0, [r6, r1]
	adds r1, #0xf
	adds r3, r6, r1
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r3, r1
	bl FUN_02030BD0
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov80_022379C8
	str r0, [sp, #4]
	ldrb r0, [r6, #4]
	cmp r0, #2
	bne _02231A48
	ldr r0, [sp, #4]
	add sp, #0xc
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5, r6, r7, pc}
_02231A48:
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _02231A60
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02231A6E
_02231A60:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02231A6E:
	ldr r5, [r6, #0xc]
	blx FUN_020F2104
	lsls r1, r5, #1
	adds r1, r5, r1
	subs r0, r0, r1
	str r0, [sp, #8]
	adds r0, r5, #0
	blx FUN_020F2178
	ldr r1, _02231BE4 @ =0x45800000
	blx FUN_020F1CC8
	blx FUN_020F2080
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, _02231BE8 @ =0x40140000
	movs r0, #0
	blx FUN_020F0C54
	blx FUN_020F09A4
	adds r5, r0, #0
	ldr r0, [sp, #4]
	blx FUN_020F2178
	adds r1, r5, #0
	blx FUN_020F1CC8
	blx FUN_020F2080
	ldr r3, _02231BEC @ =0x3FF00000
	movs r2, #0
	blx FUN_020F1918
	bhs _02231AC2
	adds r0, r4, #0
	blx FUN_020F2178
	str r0, [sp]
	b _02231B00
_02231AC2:
	ldr r0, [sp, #4]
	muls r0, r4, r0
	cmp r0, #0
	ble _02231ADC
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02231AEA
_02231ADC:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02231AEA:
	blx FUN_020F2104
	blx FUN_020F2178
	ldr r1, _02231BE4 @ =0x45800000
	blx FUN_020F1CC8
	adds r1, r5, #0
	blx FUN_020F1CC8
	str r0, [sp]
_02231B00:
	ldr r0, _02231BF0 @ =0x00000704
	movs r5, #0
	adds r4, r5, #0
	adds r7, r6, r0
_02231B08:
	ldr r0, _02231BE0 @ =0x000006F5
	ldrb r0, [r6, r0]
	cmp r4, r0
	bne _02231B26
	adds r0, r5, #0
	blx FUN_020F2080
	ldr r3, _02231BEC @ =0x3FF00000
	movs r2, #0
	blx FUN_020F068C
	blx FUN_020F09A4
	adds r5, r0, #0
	b _02231B4E
_02231B26:
	ldrb r2, [r6, #4]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r7, r1
	bl FUN_02030BD0
	cmp r0, #0
	beq _02231B4E
	adds r0, r5, #0
	blx FUN_020F2080
	ldr r3, _02231BEC @ =0x3FF00000
	movs r2, #0
	blx FUN_020F068C
	blx FUN_020F09A4
	adds r5, r0, #0
_02231B4E:
	adds r4, r4, #1
	cmp r4, #0x12
	blt _02231B08
	adds r0, r5, #0
	blx FUN_020F2080
	adds r2, r0, #0
	movs r0, #0
	adds r3, r1, #0
	adds r1, r0, #0
	blx FUN_020F1A40
	beq _02231B7C
	adds r0, r5, #0
	blx FUN_020F2080
	ldr r3, _02231BEC @ =0x3FF00000
	movs r2, #0
	blx FUN_020F116C
	blx FUN_020F09A4
	adds r5, r0, #0
_02231B7C:
	adds r0, r5, #0
	blx FUN_020F2080
	ldr r3, _02231BF4 @ =0x3FE00000
	movs r2, #0
	blx FUN_020F0C54
	blx FUN_020F09A4
	adds r4, r0, #0
	ldr r0, [sp, #8]
	blx FUN_020F2178
	ldr r1, _02231BE4 @ =0x45800000
	blx FUN_020F1CC8
	ldr r1, [sp]
	blx FUN_020F1520
	adds r1, r0, #0
	adds r0, r4, #0
	blx FUN_020F1520
	adds r5, r0, #0
	blx FUN_020F2104
	adds r4, r0, #0
	adds r0, r5, #0
	blx FUN_020F2104
	blx FUN_020F2178
	adds r1, r0, #0
	adds r0, r5, #0
	blx FUN_020F1C54
	beq _02231BC8
	adds r4, r4, #1
_02231BC8:
	ldr r0, [sp, #4]
	cmp r4, r0
	ble _02231BD0
	adds r4, r0, #0
_02231BD0:
	cmp r4, #0x64
	ble _02231BD6
	movs r4, #0x64
_02231BD6:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02231BE0: .4byte 0x000006F5
_02231BE4: .4byte 0x45800000
_02231BE8: .4byte 0x40140000
_02231BEC: .4byte 0x3FF00000
_02231BF0: .4byte 0x00000704
_02231BF4: .4byte 0x3FE00000
	thumb_func_end ov80_02231A14

	thumb_func_start ov80_02231BF8
ov80_02231BF8: @ 0x02231BF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	bl ov80_0222BE10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	str r0, [sp, #0x14]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	str r6, [sp]
	lsls r2, r4, #0x18
	ldr r1, [sp, #0x14]
	str r7, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r0, #8]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #0x10]
	lsrs r2, r2, #0x18
	bl ov80_022324C4
	adds r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096818
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02231BF8

	thumb_func_start ov80_02231C5C
ov80_02231C5C: @ 0x02231C5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r4, #0
	bl ov80_02232824
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02231C5C

	thumb_func_start ov80_02231C78
ov80_02231C78: @ 0x02231C78
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_02232ABC
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02231C78

	thumb_func_start ov80_02231C8C
ov80_02231C8C: @ 0x02231C8C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r7, r0, #0
	movs r0, #0xb
	movs r1, #0x30
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x30
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r6, #8]
	adds r1, r7, #0
	str r0, [r4]
	adds r0, r4, #0
	bl ov80_02231E4C
	ldr r0, _02231CD8 @ =ov80_02231E94
	ldr r1, _02231CDC @ =0x0223BE34
	str r0, [sp]
	ldr r0, [r5]
	adds r2, r4, #0
	ldr r0, [r0]
	movs r3, #0
	bl FUN_02096820
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231CD8: .4byte ov80_02231E94
_02231CDC: .4byte 0x0223BE34
	thumb_func_end ov80_02231C8C

	thumb_func_start ov80_02231CE0
ov80_02231CE0: @ 0x02231CE0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r7, r0, #0
	movs r0, #0xb
	movs r1, #0x30
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x30
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r6, #8]
	adds r1, r7, #0
	str r0, [r4]
	adds r0, r4, #0
	bl ov80_02231E4C
	ldr r0, _02231D2C @ =ov80_02231E94
	ldr r1, _02231D30 @ =0x0223BE24
	str r0, [sp]
	ldr r0, [r5]
	adds r2, r4, #0
	ldr r0, [r0]
	movs r3, #0
	bl FUN_02096820
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231D2C: .4byte ov80_02231E94
_02231D30: .4byte 0x0223BE24
	thumb_func_end ov80_02231CE0

	thumb_func_start ov80_02231D34
ov80_02231D34: @ 0x02231D34
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r5, [r4, #0xc]
	movs r1, #0
	ldr r0, [r5, #4]
	bl FUN_02074644
	adds r2, r0, #0
	ldr r0, [r4, #0x28]
	movs r1, #0
	bl FUN_02074740
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_02074644
	adds r2, r0, #0
	ldr r0, [r4, #0x28]
	movs r1, #1
	bl FUN_02074740
	ldrb r0, [r4, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02231D84
	ldr r0, [r5, #4]
	movs r1, #2
	bl FUN_02074644
	adds r2, r0, #0
	ldr r0, [r4, #0x28]
	movs r1, #2
	bl FUN_02074740
	b _02231DA8
_02231D84:
	ldr r0, [r5, #0xc]
	movs r1, #0
	bl FUN_02074644
	adds r2, r0, #0
	ldr r0, [r4, #0x28]
	movs r1, #2
	bl FUN_02074740
	ldr r0, [r5, #0xc]
	movs r1, #1
	bl FUN_02074644
	adds r2, r0, #0
	ldr r0, [r4, #0x28]
	movs r1, #3
	bl FUN_02074740
_02231DA8:
	ldr r0, [r5, #0x14]
	bl FUN_02052554
	str r0, [r4, #0x1c]
	adds r0, r5, #0
	bl FUN_02051BF8
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02231D34

	thumb_func_start ov80_02231DBC
ov80_02231DBC: @ 0x02231DBC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r4, r0, #0
	bl ov80_02237B8C
	adds r2, r0, #0
	str r2, [r4, #0xc]
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02231DF4 @ =0x020FA484
	ldr r0, [r0]
	bl FUN_02096820
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02231DF4: .4byte 0x020FA484
	thumb_func_end ov80_02231DBC

	thumb_func_start ov80_02231DF8
ov80_02231DF8: @ 0x02231DF8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r7, r0, #0
	movs r0, #0xb
	movs r1, #0x30
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x30
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r6, #8]
	adds r1, r7, #0
	str r0, [r4]
	adds r0, r4, #0
	bl ov80_02231E4C
	ldr r0, _02231E44 @ =ov80_02231E94
	ldr r1, _02231E48 @ =0x0223BE44
	str r0, [sp]
	ldr r0, [r5]
	adds r2, r4, #0
	ldr r0, [r0]
	movs r3, #0
	bl FUN_02096820
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02231E44: .4byte ov80_02231E94
_02231E48: .4byte 0x0223BE44
	thumb_func_end ov80_02231DF8

	thumb_func_start ov80_02231E4C
ov80_02231E4C: @ 0x02231E4C
	push {r4, r5, r6, r7}
	ldrb r2, [r1, #0x10]
	movs r6, #0
	strb r2, [r0, #4]
	ldr r2, [r1, #0x28]
	str r2, [r0, #0x18]
	ldr r2, [r1, #0x2c]
	str r2, [r0, #0x1c]
	ldr r2, _02231E90 @ =0x00000A1C
	str r1, [r0, #0x24]
	ldrh r2, [r1, r2]
	strh r2, [r0, #0x28]
	movs r2, #0xde
	lsls r2, r2, #2
	adds r3, r2, #4
_02231E6A:
	movs r7, #0x37
	adds r5, r1, r6
	lsls r7, r7, #4
	ldrb r7, [r5, r7]
	adds r4, r0, r6
	adds r6, r6, #1
	strb r7, [r4, #8]
	movs r7, #0xdd
	lsls r7, r7, #2
	ldrb r7, [r5, r7]
	cmp r6, #4
	strb r7, [r4, #0xc]
	ldrb r7, [r5, r2]
	strb r7, [r4, #0x10]
	ldrb r5, [r5, r3]
	strb r5, [r4, #0x14]
	blt _02231E6A
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_02231E90: .4byte 0x00000A1C
	thumb_func_end ov80_02231E4C

	thumb_func_start ov80_02231E94
ov80_02231E94: @ 0x02231E94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x24]
	adds r1, r4, #0
	bl ov80_02232AEC
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov80_02231E94

	thumb_func_start ov80_02231EA8
ov80_02231EA8: @ 0x02231EA8
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_02232F00
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02231EA8

	thumb_func_start ov80_02231EBC
ov80_02231EBC: @ 0x02231EBC
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_02232F08
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02231EBC

	thumb_func_start ov80_02231ED0
ov80_02231ED0: @ 0x02231ED0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r3, [r0, #0x1c]
	adds r1, r0, #0
	adds r2, r3, #1
	str r2, [r1, #0x1c]
	ldrb r1, [r3]
	adds r3, r2, #1
	str r0, [sp, #0x10]
	str r1, [sp, #0x18]
	adds r1, r0, #0
	str r3, [r1, #0x1c]
	ldrb r6, [r2]
	adds r2, r3, #1
	str r2, [r1, #0x1c]
	ldrb r1, [r3]
	str r1, [sp, #0x14]
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096808
	adds r7, r0, #0
	ldr r0, [sp, #0x18]
	cmp r0, #0x2c
	bls _02231F18
	b _0223228E
_02231F18:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02231F24: @ jump table
	.2byte _0223228E - _02231F24 - 2 @ case 0
	.2byte _0223228E - _02231F24 - 2 @ case 1
	.2byte _02231F7E - _02231F24 - 2 @ case 2
	.2byte _02231F82 - _02231F24 - 2 @ case 3
	.2byte _02231F90 - _02231F24 - 2 @ case 4
	.2byte _02231F96 - _02231F24 - 2 @ case 5
	.2byte _0223228E - _02231F24 - 2 @ case 6
	.2byte _02231FA4 - _02231F24 - 2 @ case 7
	.2byte _0223228E - _02231F24 - 2 @ case 8
	.2byte _02231FAC - _02231F24 - 2 @ case 9
	.2byte _02231FB6 - _02231F24 - 2 @ case 10
	.2byte _0223228E - _02231F24 - 2 @ case 11
	.2byte _0223228E - _02231F24 - 2 @ case 12
	.2byte _0223228E - _02231F24 - 2 @ case 13
	.2byte _02231FC0 - _02231F24 - 2 @ case 14
	.2byte _02231FCA - _02231F24 - 2 @ case 15
	.2byte _02231FDE - _02231F24 - 2 @ case 16
	.2byte _0223212A - _02231F24 - 2 @ case 17
	.2byte _02231FF4 - _02231F24 - 2 @ case 18
	.2byte _02232020 - _02231F24 - 2 @ case 19
	.2byte _0223202A - _02231F24 - 2 @ case 20
	.2byte _02232036 - _02231F24 - 2 @ case 21
	.2byte _0223203E - _02231F24 - 2 @ case 22
	.2byte _02232046 - _02231F24 - 2 @ case 23
	.2byte _02232050 - _02231F24 - 2 @ case 24
	.2byte _02232130 - _02231F24 - 2 @ case 25
	.2byte _0223205A - _02231F24 - 2 @ case 26
	.2byte _02232062 - _02231F24 - 2 @ case 27
	.2byte _02232076 - _02231F24 - 2 @ case 28
	.2byte _0223207E - _02231F24 - 2 @ case 29
	.2byte _02232086 - _02231F24 - 2 @ case 30
	.2byte _02232098 - _02231F24 - 2 @ case 31
	.2byte _022320A8 - _02231F24 - 2 @ case 32
	.2byte _022320AE - _02231F24 - 2 @ case 33
	.2byte _022320EC - _02231F24 - 2 @ case 34
	.2byte _02232120 - _02231F24 - 2 @ case 35
	.2byte _02232136 - _02231F24 - 2 @ case 36
	.2byte _0223214A - _02231F24 - 2 @ case 37
	.2byte _02232178 - _02231F24 - 2 @ case 38
	.2byte _02232182 - _02231F24 - 2 @ case 39
	.2byte _022321B2 - _02231F24 - 2 @ case 40
	.2byte _022321D4 - _02231F24 - 2 @ case 41
	.2byte _02232200 - _02231F24 - 2 @ case 42
	.2byte _02232208 - _02231F24 - 2 @ case 43
	.2byte _02232212 - _02231F24 - 2 @ case 44
_02231F7E:
	strb r6, [r4, #0x10]
	b _0223228E
_02231F82:
	lsls r0, r6, #1
	adds r1, r4, r0
	movs r0, #0xe
	lsls r0, r0, #6
	ldrh r0, [r1, r0]
	strh r0, [r5]
	b _0223228E
_02231F90:
	ldrh r0, [r4, #0x14]
	strh r0, [r5]
	b _0223228E
_02231F96:
	ldrh r1, [r4, #0x14]
	ldr r0, _02232294 @ =0x0000270F
	cmp r1, r0
	bhs _0223201E
	adds r0, r1, #1
	strh r0, [r4, #0x14]
	b _0223228E
_02231FA4:
	movs r0, #0
	blx FUN_020D3B84
	b _0223228E
_02231FAC:
	ldr r0, [r4, #8]
	bl FUN_02030CD8
	strh r0, [r5]
	b _0223228E
_02231FB6:
	adds r0, r4, #0
	movs r1, #2
	bl ov80_02232B58
	b _0223228E
_02231FC0:
	adds r0, r4, #0
	bl ov80_02232E58
	strh r0, [r5]
	b _0223228E
_02231FCA:
	movs r0, #0x38
	muls r0, r6, r0
	adds r1, r4, r0
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	strh r0, [r5]
	b _0223228E
_02231FDE:
	movs r0, #0x38
	muls r0, r6, r0
	adds r1, r4, r0
	ldr r0, [sp, #0x14]
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #0xa3
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	strh r0, [r5]
	b _0223228E
_02231FF4:
	ldr r0, [r7, #8]
	bl FUN_02074904
	adds r7, r0, #0
	ldr r0, _02232298 @ =0x0000036A
	movs r5, #0
	adds r6, r4, r0
_02232002:
	adds r1, r4, r5
	adds r1, #0x24
	ldrb r1, [r1]
	adds r0, r7, #0
	bl FUN_02074644
	movs r1, #6
	adds r2, r6, #0
	bl FUN_0206EC40
	adds r5, r5, #1
	adds r6, r6, #2
	cmp r5, #3
	blt _02232002
_0223201E:
	b _0223228E
_02232020:
	adds r0, r4, #0
	bl ov80_02237ED8
	strh r0, [r5]
	b _0223228E
_0223202A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_02232E68
	strh r0, [r5]
	b _0223228E
_02232036:
	adds r0, r4, #0
	bl ov80_02232E9C
	b _0223228E
_0223203E:
	adds r0, r4, #0
	bl ov80_02232EE0
	b _0223228E
_02232046:
	adds r0, r4, #0
	bl ov80_02232E64
	strh r0, [r5]
	b _0223228E
_02232050:
	movs r0, #0xa1
	lsls r0, r0, #4
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _0223228E
_0223205A:
	ldr r0, _0223229C @ =0x00000A11
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _0223228E
_02232062:
	adds r0, r4, #0
	bl ov80_02233020
	strh r0, [r5]
	ldrb r1, [r4, #0x10]
	ldrh r2, [r5]
	ldr r0, [r4, #4]
	bl ov80_022331E8
	b _0223228E
_02232076:
	adds r0, r4, #0
	bl ov80_02232F60
	b _0223228E
_0223207E:
	adds r0, r4, #0
	bl FUN_02096910
	b _0223228E
_02232086:
	ldr r0, _022322A0 @ =0x00000A1B
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _02232094
	subs r0, r0, #6
	strh r0, [r5]
	b _0223228E
_02232094:
	strh r0, [r5]
	b _0223228E
_02232098:
	ldr r0, _022322A0 @ =0x00000A1B
	movs r2, #0
	strb r2, [r4, r0]
	subs r1, r0, #2
	strb r2, [r4, r1]
	subs r0, r0, #3
	strb r2, [r4, r0]
	b _0223228E
_022320A8:
	ldr r0, _022322A4 @ =0x00000A18
	strb r6, [r4, r0]
	b _0223228E
_022320AE:
	ldr r0, _022322A0 @ =0x00000A1B
	movs r5, #0
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _022320C4
	bl FUN_0203769C
	cmp r0, #0
	beq _022320CE
	movs r5, #1
	b _022320CE
_022320C4:
	bl FUN_0203769C
	cmp r0, #0
	bne _022320CE
	movs r5, #1
_022320CE:
	cmp r5, #1
	bne _022320E2
	ldr r0, [r7, #8]
	bl FUN_0203107C
	ldrb r1, [r4, #0x10]
	movs r2, #0x32
	bl ov80_02237FA4
	b _0223228E
_022320E2:
	ldr r0, _022322A8 @ =0x00000A1C
	ldrh r1, [r4, r0]
	subs r1, #0x32
	strh r1, [r4, r0]
	b _0223228E
_022320EC:
	movs r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #0x10]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02232118
	ldr r0, _022322A0 @ =0x00000A1B
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _02232110
	bl FUN_0203769C
	cmp r0, #0
	bne _02232118
	movs r0, #1
	strh r0, [r5]
	b _0223228E
_02232110:
	bl FUN_0203769C
	cmp r0, #0
	bne _0223211A
_02232118:
	b _0223228E
_0223211A:
	movs r0, #1
	strh r0, [r5]
	b _0223228E
_02232120:
	ldrb r0, [r4, #0x10]
	bl ov80_02237D8C
	strh r0, [r5]
	b _0223228E
_0223212A:
	ldrb r0, [r4, #0x10]
	strh r0, [r5]
	b _0223228E
_02232130:
	ldrb r0, [r4, #0x12]
	strh r0, [r5]
	b _0223228E
_02232136:
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	bl ov80_0222AB34
	ldr r0, [r0]
	adds r1, r4, #0
	movs r2, #3
	bl ov80_02237EFC
	b _0223228E
_0223214A:
	ldrb r1, [r4, #0x11]
	adds r0, r4, #0
	adds r0, #0x4c
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1, #0x30]
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #0x11]
	movs r0, #0x57
	lsls r0, r0, #2
	adds r1, r1, #7
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrh r1, [r1, #0x30]
	adds r0, r4, r0
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_0222A474
	b _0223228E
_02232178:
	adds r0, r4, #0
	bl ov80_02233648
	strh r0, [r5]
	b _0223228E
_02232182:
	ldr r0, [r7, #8]
	bl FUN_02030E08
	movs r2, #0
	str r2, [sp]
	movs r1, #0xa
	adds r3, r2, #0
	bl FUN_02030E58
	strh r0, [r5]
	movs r1, #1
	add r0, sp, #0x20
	strb r1, [r0]
	ldr r0, [r7, #8]
	bl FUN_02030E08
	add r1, sp, #0x20
	movs r2, #0
	str r1, [sp]
	movs r1, #0xa
	adds r3, r2, #0
	bl FUN_02030E18
	b _0223228E
_022321B2:
	movs r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _0223228E
	ldrh r0, [r4, #0x14]
	adds r0, r0, #1
	cmp r0, #0x15
	bne _022321CA
	movs r0, #1
	strh r0, [r5]
	b _0223228E
_022321CA:
	cmp r0, #0x31
	bne _0223228E
	movs r0, #2
	strh r0, [r5]
	b _0223228E
_022321D4:
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r3, #0xa2
	lsls r3, r3, #2
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	adds r1, r3, #0
	adds r2, r3, #0
	str r0, [sp, #0xc]
	adds r0, r4, r3
	subs r1, #0x1c
	subs r2, #0x14
	subs r3, #0x10
	adds r1, r4, r1
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov80_0222A52C
	b _0223228E
_02232200:
	adds r0, r4, #0
	bl ov80_02237E30
	b _0223228E
_02232208:
	ldrb r0, [r4, #0x13]
	strh r0, [r5]
	movs r0, #1
	strb r0, [r4, #0x13]
	b _0223228E
_02232212:
	ldrb r5, [r4, #0x10]
	cmp r5, #3
	bne _0223228E
	cmp r6, #0
	ldr r0, [r7, #8]
	bne _0223226A
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r4, #0x10]
	bl FUN_0205C1F0
	str r0, [sp, #0x1c]
	adds r0, r5, #0
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp, #0x1c]
	adds r0, r6, #0
	bl FUN_020310BC
	strh r0, [r4, #0x22]
	ldr r0, [r7, #8]
	bl FUN_0203107C
	adds r5, r0, #0
	ldrb r0, [r4, #0x10]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r4, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r4, #0x20]
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02031108
	b _0223228E
_0223226A:
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r4, #0x10]
	bl FUN_0205C1F0
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r4, #0x22]
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_02031108
_0223228E:
	movs r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02232294: .4byte 0x0000270F
_02232298: .4byte 0x0000036A
_0223229C: .4byte 0x00000A11
_022322A0: .4byte 0x00000A1B
_022322A4: .4byte 0x00000A18
_022322A8: .4byte 0x00000A1C
	thumb_func_end ov80_02231ED0

	thumb_func_start ov80_022322AC
ov80_022322AC: @ 0x022322AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r0, [r0, #0x1c]
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_022322AC

	thumb_func_start ov80_022322C8
ov80_022322C8: @ 0x022322C8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_02233280
	strh r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022322C8

	thumb_func_start ov80_022322F8
ov80_022322F8: @ 0x022322F8
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _02232314 @ =ov80_02232318
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_02232314: .4byte ov80_02232318
	thumb_func_end ov80_022322F8

	thumb_func_start ov80_02232318
ov80_02232318: @ 0x02232318
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r1, _02232344 @ =0x00000A1A
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _0223233E
	movs r2, #0
	strb r2, [r0, r1]
	movs r0, #1
	pop {r4, pc}
_0223233E:
	movs r0, #0
	pop {r4, pc}
	nop
_02232344: .4byte 0x00000A1A
	thumb_func_end ov80_02232318

	thumb_func_start ov80_02232348
ov80_02232348: @ 0x02232348
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _02232364 @ =ov80_02232368
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_02232364: .4byte ov80_02232368
	thumb_func_end ov80_02232348

	thumb_func_start ov80_02232368
ov80_02232368: @ 0x02232368
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE24
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r2, _0223239C @ =0x00000A1B
	ldrb r1, [r0, r2]
	cmp r1, #0
	bne _0223238C
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223238C:
	movs r3, #0
	subs r1, r2, #1
	strb r3, [r0, r1]
	ldrb r0, [r0, r2]
	strh r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0223239C: .4byte 0x00000A1B
	thumb_func_end ov80_02232368

	thumb_func_start ov80_022323A0
ov80_022323A0: @ 0x022323A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov80_022332D0
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_022323A0

	thumb_func_start ov80_022323B8
ov80_022323B8: @ 0x022323B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov80_022333F0
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_022323B8

	thumb_func_start ov80_022323D0
ov80_022323D0: @ 0x022323D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r0, #0
	ldr r0, [r4]
	bl ov80_02233490
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_022323D0

	thumb_func_start ov80_022323E8
ov80_022323E8: @ 0x022323E8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_0203107C
	adds r5, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205C1F0
	adds r7, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020310BC
	strh r0, [r6]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022323E8

	thumb_func_start ov80_02232430
ov80_02232430: @ 0x02232430
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl FUN_0203107C
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	bl ov80_02237FA4
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_02232430

	thumb_func_start ov80_02232460
ov80_02232460: @ 0x02232460
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	lsls r1, r4, #0x18
	ldr r0, [r0, #8]
	lsrs r1, r1, #0x18
	adds r2, r6, #0
	bl ov80_022331E8
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_02232460

	thumb_func_start ov80_0223248C
ov80_0223248C: @ 0x0223248C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r5, #0x1c]
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0]
	bl FUN_02096810
	adds r2, r0, #0
	bne _022324B0
	movs r0, #0
	pop {r3, r4, r5, pc}
_022324B0:
	lsls r1, r4, #4
	adds r1, r4, r1
	adds r2, #0x64
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r2, r1
	bl ov80_0222F44C
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223248C

	thumb_func_start ov80_022324C4
ov80_022324C4: @ 0x022324C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r1, #0
	adds r5, r0, #0
	ldr r1, _02232818 @ =0x00000A28
	movs r0, #0xb
	adds r6, r2, #0
	str r3, [sp, #4]
	bl FUN_0201AA8C
	ldr r1, _0223281C @ =0x0223DD48
	ldr r2, _02232818 @ =0x00000A28
	str r0, [r1]
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _0223281C @ =0x0223DD48
	ldr r4, [r0]
	adds r0, r5, #0
	bl FUN_02030CC8
	str r0, [r4, #8]
	ldr r1, _0223281C @ =0x0223DD48
	str r5, [r4, #4]
	movs r0, #0xb
	str r0, [r4]
	ldr r4, [r1]
	bl FUN_020744BC
	str r0, [r4, #0x28]
	movs r0, #0xb
	bl FUN_020744BC
	str r0, [r4, #0x2c]
	movs r0, #0xa2
	ldr r1, [sp, #0x38]
	lsls r0, r0, #4
	str r1, [r4, r0]
	adds r0, r5, #0
	ldr r4, [r4, #8]
	bl FUN_02030E08
	adds r5, r0, #0
	cmp r7, #0
	beq _02232520
	b _022326BA
_02232520:
	ldr r0, _0223281C @ =0x0223DD48
	ldr r1, [r0]
	movs r0, #0
	strb r6, [r1, #0x10]
	strb r0, [r1, #0x11]
	adds r0, r4, #0
	bl FUN_02030CBC
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	cmp r2, #3
	bne _02232546
	ldr r0, [r0, #4]
	bl FUN_020503D0
	bl FUN_02066E48
	b _02232552
_02232546:
	movs r3, #0
	adds r0, r5, #0
	movs r1, #9
	str r3, [sp]
	bl FUN_02030E58
_02232552:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _02232592
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_0203107C
	adds r5, r0, #0
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C1A0
	adds r4, r0, #0
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C1A0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_020310BC
	ldr r1, _0223281C @ =0x0223DD48
	ldr r1, [r1]
	strh r0, [r1, #0x14]
	b _02232630
_02232592:
	ldr r0, _0223281C @ =0x0223DD48
	ldr r4, [r0]
	movs r0, #0
	strh r0, [r4, #0x14]
	ldr r0, [r4, #4]
	bl FUN_0203107C
	adds r5, r0, #0
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C1F0
	adds r7, r0, #0
	ldrb r0, [r4, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	movs r3, #0
	bl FUN_02031108
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0205C218
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0205C218
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl FUN_02031108
	ldr r4, _0223281C @ =0x0223DD48
	movs r5, #0
_022325F2:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl FUN_0203107C
	adds r6, r0, #0
	ldr r0, [r4]
	lsls r1, r5, #0x18
	ldrb r0, [r0, #0x10]
	lsrs r1, r1, #0x18
	bl FUN_0205C174
	adds r7, r0, #0
	ldr r0, [r4]
	lsls r1, r5, #0x18
	ldrb r0, [r0, #0x10]
	lsrs r1, r1, #0x18
	bl FUN_0205C174
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	movs r3, #1
	bl FUN_02031108
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	blo _022325F2
_02232630:
	ldr r0, _0223281C @ =0x0223DD48
	movs r1, #7
	ldr r5, [r0]
	ldrh r0, [r5, #0x14]
	blx FUN_020F2998
	strh r0, [r5, #0x16]
	movs r0, #0
	str r0, [r5, #0x18]
	adds r1, r5, #0
	ldr r0, [sp, #4]
	adds r1, #0x24
	strb r0, [r1]
	add r1, sp, #0x20
	adds r0, r5, #0
	ldrh r2, [r1, #0x10]
	adds r0, #0x25
	strb r2, [r0]
	adds r0, r5, #0
	ldrh r1, [r1, #0x14]
	adds r0, #0x26
	strb r1, [r0]
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	strh r0, [r5, #0x20]
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C1F0
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0xa
	bl FUN_02031228
	b _0223273E
_022326BA:
	ldr r0, _0223281C @ =0x0223DD48
	movs r1, #0
	ldr r5, [r0]
	str r1, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02030D84
	strb r0, [r5, #0x10]
	movs r2, #0
	str r2, [sp]
	adds r0, r4, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02030D84
	strb r0, [r5, #0x11]
	ldr r0, _0223281C @ =0x0223DD48
	ldr r6, [r0]
	ldr r0, [r6, #4]
	bl FUN_0203107C
	adds r7, r0, #0
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C1A0
	str r0, [sp, #0xc]
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1A0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp, #0xc]
	adds r0, r7, #0
	bl FUN_020310BC
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x14]
	movs r1, #7
	blx FUN_020F2998
	movs r5, #0
	strh r0, [r6, #0x16]
	ldr r7, _0223281C @ =0x0223DD48
	adds r6, r5, #0
_0223271C:
	lsls r2, r5, #0x18
	adds r0, r4, #0
	movs r1, #7
	lsrs r2, r2, #0x18
	adds r3, r6, #0
	str r6, [sp]
	bl FUN_02030D84
	ldr r1, [r7]
	adds r1, r1, r5
	adds r1, #0x24
	strb r0, [r1]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	blo _0223271C
_0223273E:
	ldr r6, _0223281C @ =0x0223DD48
	ldr r7, _02232820 @ =0x0000036A
	movs r4, #0
_02232744:
	ldr r5, [r6]
	ldr r0, [r5, #4]
	bl FUN_02074904
	adds r1, r5, r4
	adds r1, #0x24
	ldrb r1, [r1]
	bl FUN_02074644
	ldr r5, [r6]
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r1, r4, #1
	adds r1, r5, r1
	strh r0, [r1, r7]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	blo _02232744
	ldr r0, [r5, #4]
	bl FUN_02074904
	str r0, [sp, #8]
	ldr r0, _0223281C @ =0x0223DD48
	movs r1, #0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02237B24
	adds r7, r0, #0
	movs r5, #0
	cmp r7, #0
	ble _022327F8
	ldr r6, _0223281C @ =0x0223DD48
_0223278E:
	ldr r1, [r6]
	ldr r0, [sp, #8]
	adds r1, r1, r5
	adds r1, #0x24
	ldrb r1, [r1]
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x28]
	bl FUN_02074524
	ldr r0, [r6]
	adds r1, r5, #0
	ldr r0, [r0, #0x28]
	bl FUN_02074644
	movs r1, #0
	str r1, [sp, #0x14]
	adds r4, r0, #0
	movs r1, #6
	add r2, sp, #0x14
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0x32
	bls _022327EE
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x32
	bl FUN_0206FD00
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #0x10
	bl FUN_0206EC40
	adds r0, r4, #0
	bl FUN_0206E250
_022327EE:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r7
	blt _0223278E
_022327F8:
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02232810
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov80_0222A840
_02232810:
	ldr r0, _0223281C @ =0x0223DD48
	ldr r0, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02232818: .4byte 0x00000A28
_0223281C: .4byte 0x0223DD48
_02232820: .4byte 0x0000036A
	thumb_func_end ov80_022324C4

	thumb_func_start ov80_02232824
ov80_02232824: @ 0x02232824
	push {r3, lr}
	cmp r1, #0
	bne _02232830
	bl ov80_02232838
	pop {r3, pc}
_02232830:
	bl ov80_02232908
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02232824

	thumb_func_start ov80_02232838
ov80_02232838: @ 0x02232838
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r0, [r7, #0x28]
	bl FUN_02074640
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	str r0, [sp, #0x10]
	cmp r0, #0
	ble _022328A0
	adds r5, r7, #0
_02232852:
	ldr r0, [r7, #0x28]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #0x3a
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	movs r1, #0xe5
	lsls r1, r1, #2
	strh r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x3b
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02232900 @ =0x00000396
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x3c
	bl FUN_0206E540
	movs r1, #0xe6
	lsls r1, r1, #2
	strh r0, [r5, r1]
	adds r0, r4, #0
	movs r1, #0x3d
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02232904 @ =0x0000039A
	adds r6, r6, #1
	strh r0, [r5, r1]
	ldr r0, [sp, #0x10]
	adds r5, #8
	cmp r6, r0
	blt _02232852
_022328A0:
	adds r0, r7, #0
	bl ov80_02237ED8
	adds r1, r0, #0
	adds r2, r7, #0
	ldrb r0, [r7, #0x10]
	adds r2, #0x30
	movs r3, #0xe
	bl ov80_02237ADC
	ldrb r0, [r7, #0x10]
	movs r1, #1
	ldrb r4, [r7, #0x11]
	bl ov80_02237B58
	adds r5, r0, #0
	ldrb r0, [r7, #0x10]
	bl ov80_02237D8C
	movs r3, #0xa2
	lsls r3, r3, #2
	adds r1, r7, r3
	str r1, [sp]
	adds r1, r3, #0
	subs r1, #0x14
	adds r1, r7, r1
	str r1, [sp, #4]
	adds r1, r3, #0
	subs r1, #0x10
	adds r1, r7, r1
	lsls r0, r0, #0x18
	adds r2, r4, #7
	str r1, [sp, #8]
	lsrs r0, r0, #0x18
	lsls r1, r4, #1
	lsls r2, r2, #1
	str r0, [sp, #0xc]
	adds r1, r7, r1
	adds r2, r7, r2
	subs r3, #0x1c
	ldrh r1, [r1, #0x30]
	ldrh r2, [r2, #0x30]
	adds r0, r5, #0
	adds r3, r7, r3
	bl ov80_0222A6B8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02232900: .4byte 0x00000396
_02232904: .4byte 0x0000039A
	thumb_func_end ov80_02232838

	thumb_func_start ov80_02232908
ov80_02232908: @ 0x02232908
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18c
	adds r5, r0, #0
	bl ov80_022329B4
	movs r4, #0
	adds r6, r5, #0
	adds r7, r4, #0
_02232918:
	str r7, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #6
	lsrs r2, r2, #0x18
	adds r3, r7, #0
	bl FUN_02030D84
	strh r0, [r6, #0x30]
	adds r4, r4, #1
	adds r6, r6, #2
	cmp r4, #0xe
	blt _02232918
	movs r6, #0
	add r4, sp, #0x30
	adds r7, r5, #0
_02232938:
	movs r0, #0
	str r0, [sp]
	lsls r2, r6, #0x18
	ldr r0, [r5, #8]
	movs r1, #8
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030D84
	strh r0, [r4]
	ldrh r1, [r4]
	movs r0, #0x9b
	lsls r0, r0, #2
	strh r1, [r7, r0]
	adds r6, r6, #1
	adds r4, r4, #2
	adds r7, r7, #2
	cmp r6, #4
	blt _02232938
	add r0, sp, #0x18
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	add r1, sp, #0x30
	add r2, sp, #0x10
	movs r3, #0
	bl ov80_0222A52C
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r7, #0
	add r4, sp, #0x3c
_02232986:
	adds r0, r5, #0
	bl ov80_02237D88
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x2c]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov80_02237E18
	adds r7, r7, #1
	adds r4, #0x38
	cmp r7, #4
	blt _02232986
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0x18c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02232908

	thumb_func_start ov80_022329B4
ov80_022329B4: @ 0x022329B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #0x28]
	bl FUN_02074640
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02232AB6
	add r7, sp, #8
_022329CE:
	ldr r0, [r5, #0x28]
	adds r1, r4, #0
	bl FUN_02074644
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #2
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030D84
	add r2, sp, #8
	strh r0, [r7, #2]
	adds r0, r6, #0
	movs r1, #0xa3
	adds r2, #2
	bl FUN_0206EC40
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #3
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030D84
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0x3a
	add r2, sp, #8
	bl FUN_0206EC40
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #3
	lsrs r2, r2, #0x18
	movs r3, #1
	bl FUN_02030D84
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0x3b
	add r2, sp, #8
	bl FUN_0206EC40
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #3
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_02030D84
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0x3c
	add r2, sp, #8
	bl FUN_0206EC40
	movs r0, #0
	str r0, [sp]
	movs r1, #3
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	lsrs r2, r2, #0x18
	adds r3, r1, #0
	bl FUN_02030D84
	strb r0, [r7]
	adds r0, r6, #0
	movs r1, #0x3d
	add r2, sp, #8
	bl FUN_0206EC40
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #4
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030D84
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #0xa0
	add r2, sp, #0xc
	bl FUN_0206EC40
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #5
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030D84
	add r2, sp, #8
	strh r0, [r7, #2]
	adds r0, r6, #0
	movs r1, #6
	adds r2, #2
	bl FUN_0206EC40
	ldr r0, [sp, #4]
	adds r4, r4, #1
	cmp r4, r0
	blt _022329CE
_02232AB6:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_022329B4

	thumb_func_start ov80_02232ABC
ov80_02232ABC: @ 0x02232ABC
	push {r4, lr}
	adds r4, r0, #0
	beq _02232AE6
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02232ACC
	bl FUN_0201AB0C
_02232ACC:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02232AD6
	bl FUN_0201AB0C
_02232AD6:
	ldr r2, _02232AE8 @ =0x00000A28
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
_02232AE6:
	pop {r4, pc}
	.align 2, 0
_02232AE8: .4byte 0x00000A28
	thumb_func_end ov80_02232ABC

	thumb_func_start ov80_02232AEC
ov80_02232AEC: @ 0x02232AEC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	movs r4, #0
	adds r5, r7, #0
_02232AF6:
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl ov80_02232B44
	movs r1, #0xe
	lsls r1, r1, #6
	strh r0, [r5, r1]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #6
	blt _02232AF6
	movs r3, #0
	subs r0, r1, #4
_02232B12:
	adds r2, r6, r3
	ldrb r5, [r2, #8]
	movs r4, #0x37
	adds r1, r7, r3
	lsls r4, r4, #4
	strb r5, [r1, r4]
	ldrb r5, [r2, #0xc]
	adds r4, r4, #4
	adds r3, r3, #1
	strb r5, [r1, r4]
	movs r4, #0xde
	lsls r4, r4, #2
	ldrb r5, [r2, #0x10]
	cmp r3, #4
	strb r5, [r1, r4]
	ldrb r2, [r2, #0x14]
	strb r2, [r1, r0]
	blt _02232B12
	ldrh r1, [r6, #0x28]
	ldr r0, _02232B40 @ =0x00000A1C
	strh r1, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232B40: .4byte 0x00000A1C
	thumb_func_end ov80_02232AEC

	thumb_func_start ov80_02232B44
ov80_02232B44: @ 0x02232B44
	push {r3, lr}
	cmp r1, #6
	blo _02232B52
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
_02232B52:
	ldrh r0, [r0, #0x20]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02232B44

	thumb_func_start ov80_02232B58
ov80_02232B58: @ 0x02232B58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r6, r1, #0
	bl FUN_02030E08
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	bl ov80_02237B58
	ldrb r1, [r5, #0x10]
	add r0, sp, #0x10
	strb r1, [r0, #8]
	movs r1, #0
	add r0, sp, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02030CF4
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_02030CE0
	movs r2, #0
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x10
	adds r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_02030CF4
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1A0
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1A0
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #0x14]
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02031108
	cmp r6, #2
	beq _02232CCA
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1C8
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1C8
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1C8
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1C8
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #0x14]
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0203126C
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1C8
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1C8
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_020310BC
	str r0, [sp, #0xc]
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_020310BC
	adds r7, r0, #0
	ldrh r0, [r5, #0x14]
	cmp r0, r6
	bne _02232C6E
	ldrb r0, [r5, #0x10]
	bl FUN_0205C240
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C240
	bl FUN_0205C268
	lsls r3, r7, #0x10
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	lsrs r3, r3, #0x10
	bl FUN_0203126C
	b _02232C94
_02232C6E:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	bhs _02232C94
	ldrb r0, [r5, #0x10]
	bl FUN_0205C240
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C240
	bl FUN_0205C268
	lsls r3, r7, #0x10
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	lsrs r3, r3, #0x10
	bl FUN_02031108
_02232C94:
	adds r0, r5, #0
	adds r0, #0x27
	ldrb r1, [r0]
	add r0, sp, #0x10
	movs r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x18
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	ldr r0, [sp, #4]
	movs r1, #9
	bl FUN_02030E18
	ldrb r0, [r5, #0x10]
	cmp r0, #3
	bne _02232CCA
	movs r0, #0x6c
	bl FUN_0205C268
	adds r3, r5, #0
	adds r3, #0x27
	adds r2, r0, #0
	ldrb r3, [r3]
	adds r0, r4, #0
	movs r1, #0x6c
	bl FUN_02031108
_02232CCA:
	movs r4, #0
	add r6, sp, #0x10
	add r7, sp, #0x10
_02232CD0:
	lsls r0, r4, #1
	adds r0, r5, r0
	ldrh r0, [r0, #0x30]
	lsls r2, r4, #0x18
	movs r1, #6
	strh r0, [r7]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030CF4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xe
	blo _02232CD0
	movs r4, #0
	add r6, sp, #0x18
	add r7, sp, #0x10
_02232CF8:
	adds r0, r5, r4
	adds r0, #0x24
	ldrb r0, [r0]
	lsls r2, r4, #0x18
	movs r1, #7
	strb r0, [r7, #8]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030CF4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	blo _02232CF8
	ldr r0, [r5, #0x28]
	bl FUN_02074640
	movs r4, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _02232E10
	add r7, sp, #0x10
_02232D2A:
	ldr r0, [r5, #0x28]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0xa3
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	strh r0, [r7]
	add r0, sp, #0x10
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #2
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030CF4
	adds r0, r6, #0
	movs r1, #0x3a
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #3
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030CF4
	adds r0, r6, #0
	movs r1, #0x3b
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #3
	lsrs r2, r2, #0x18
	movs r3, #1
	bl FUN_02030CF4
	adds r0, r6, #0
	movs r1, #0x3c
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #3
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_02030CF4
	adds r0, r6, #0
	movs r1, #0x3d
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	movs r1, #3
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	lsrs r2, r2, #0x18
	adds r3, r1, #0
	bl FUN_02030CF4
	adds r0, r6, #0
	movs r1, #0xa0
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x1c]
	add r0, sp, #0x1c
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #4
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030CF4
	adds r0, r6, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r7]
	add r0, sp, #0x10
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #5
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030CF4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [sp, #8]
	cmp r4, r0
	blo _02232D2A
_02232E10:
	ldr r0, [r5, #0x2c]
	bl FUN_02074640
	adds r6, r0, #0
	ldr r4, _02232E54 @ =0x00000000
	beq _02232E4E
	add r7, sp, #0x10
_02232E1E:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl FUN_02074644
	lsls r0, r4, #1
	adds r1, r5, r0
	movs r0, #0x9b
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	add r0, sp, #0x10
	lsls r2, r4, #0x18
	strh r1, [r0]
	str r7, [sp]
	ldr r0, [r5, #8]
	movs r1, #8
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030CF4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blo _02232E1E
_02232E4E:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02232E54: .4byte 0x00000000
	thumb_func_end ov80_02232B58

	thumb_func_start ov80_02232E58
ov80_02232E58: @ 0x02232E58
	ldrb r1, [r0, #0x11]
	adds r1, r1, #1
	strb r1, [r0, #0x11]
	ldrb r0, [r0, #0x11]
	bx lr
	.align 2, 0
	thumb_func_end ov80_02232E58

	thumb_func_start ov80_02232E64
ov80_02232E64: @ 0x02232E64
	ldrb r0, [r0, #0x11]
	bx lr
	thumb_func_end ov80_02232E64

	thumb_func_start ov80_02232E68
ov80_02232E68: @ 0x02232E68
	push {r4, lr}
	sub sp, #0x30
	adds r2, r0, #0
	ldrb r4, [r2, #0x11]
	movs r3, #7
	muls r3, r1, r3
	adds r1, r4, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x17
	adds r1, r2, r1
	ldrh r1, [r1, #0x30]
	add r0, sp, #0
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov80_02232E68

	thumb_func_start ov80_02232E9C
ov80_02232E9C: @ 0x02232E9C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
_02232EA2:
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r6, r0, #0
	lsls r1, r4, #0x18
	ldrb r0, [r5, #0x10]
	lsrs r1, r1, #0x18
	bl FUN_0205C174
	adds r7, r0, #0
	lsls r1, r4, #0x18
	ldrb r0, [r5, #0x10]
	lsrs r1, r1, #0x18
	bl FUN_0205C174
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	movs r3, #1
	bl FUN_02031108
	adds r4, r4, #1
	cmp r4, #3
	blt _02232EA2
	adds r0, r5, #0
	movs r1, #1
	bl ov80_02232B58
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02232E9C

	thumb_func_start ov80_02232EE0
ov80_02232EE0: @ 0x02232EE0
	adds r1, r0, #0
	movs r2, #1
	adds r1, #0x27
	strb r2, [r1]
	ldrh r1, [r0, #0x16]
	cmp r1, #8
	bhs _02232EF2
	adds r1, r1, #1
	strh r1, [r0, #0x16]
_02232EF2:
	ldr r3, _02232EFC @ =ov80_02232B58
	movs r1, #0
	strb r1, [r0, #0x11]
	bx r3
	nop
_02232EFC: .4byte ov80_02232B58
	thumb_func_end ov80_02232EE0

	thumb_func_start ov80_02232F00
ov80_02232F00: @ 0x02232F00
	ldr r3, _02232F04 @ =ov80_02237E30
	bx r3
	.align 2, 0
_02232F04: .4byte ov80_02237E30
	thumb_func_end ov80_02232F00

	thumb_func_start ov80_02232F08
ov80_02232F08: @ 0x02232F08
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	ldrb r4, [r5, #0x11]
	bl ov80_02237B58
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02237D8C
	movs r3, #0xa2
	lsls r3, r3, #2
	adds r1, r5, r3
	str r1, [sp]
	adds r1, r3, #0
	subs r1, #0x14
	adds r1, r5, r1
	str r1, [sp, #4]
	adds r1, r3, #0
	subs r1, #0x10
	adds r1, r5, r1
	lsls r0, r0, #0x18
	adds r2, r4, #7
	str r1, [sp, #8]
	lsrs r0, r0, #0x18
	lsls r1, r4, #1
	lsls r2, r2, #1
	str r0, [sp, #0xc]
	adds r1, r5, r1
	adds r2, r5, r2
	subs r3, #0x1c
	ldrh r1, [r1, #0x30]
	ldrh r2, [r2, #0x30]
	adds r0, r6, #0
	adds r3, r5, r3
	bl ov80_0222A6B8
	adds r0, r5, #0
	bl ov80_02237E30
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02232F08

	thumb_func_start ov80_02232F60
ov80_02232F60: @ 0x02232F60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _02232F74
	movs r0, #0
	str r0, [sp]
	b _02232F78
_02232F74:
	movs r0, #2
	str r0, [sp]
_02232F78:
	ldrb r0, [r6, #0x10]
	movs r1, #0
	bl ov80_02237B24
	adds r5, r0, #0
	ldr r0, [r6, #0x28]
	bl FUN_02074640
	ldr r4, [sp]
	adds r0, r4, #0
	adds r0, r5, r0
	adds r1, r4, #0
	str r0, [sp, #4]
	cmp r1, r0
	bge _02232FEA
_02232F96:
	ldr r0, [r6, #0x28]
	adds r1, r4, #0
	bl FUN_02074644
	ldr r1, [sp]
	movs r2, #0
	subs r1, r4, r1
	lsls r1, r1, #3
	adds r5, r6, r1
	movs r1, #0x3a
	adds r7, r0, #0
	bl FUN_0206E540
	movs r1, #0xe5
	lsls r1, r1, #2
	strh r0, [r5, r1]
	adds r0, r7, #0
	movs r1, #0x3b
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _02233018 @ =0x00000396
	movs r2, #0
	strh r0, [r5, r1]
	adds r0, r7, #0
	movs r1, #0x3c
	bl FUN_0206E540
	movs r1, #0xe6
	lsls r1, r1, #2
	strh r0, [r5, r1]
	adds r0, r7, #0
	movs r1, #0x3d
	movs r2, #0
	bl FUN_0206E540
	ldr r1, _0223301C @ =0x0000039A
	adds r4, r4, #1
	strh r0, [r5, r1]
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _02232F96
_02232FEA:
	ldr r0, [r6, #0x28]
	bl ov80_02237D9C
	movs r0, #0x37
	lsls r0, r0, #4
	movs r7, #0
	adds r2, r0, #0
	adds r3, r0, #0
	adds r4, r7, #0
	adds r1, r0, #4
	adds r2, #8
	adds r3, #0xc
_02233002:
	adds r5, r6, r7
	strb r4, [r5, r0]
	strb r4, [r5, r1]
	strb r4, [r5, r2]
	adds r7, r7, #1
	strb r4, [r5, r3]
	cmp r7, #4
	blt _02233002
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233018: .4byte 0x00000396
_0223301C: .4byte 0x0000039A
	thumb_func_end ov80_02232F60

	thumb_func_start ov80_02233020
ov80_02233020: @ 0x02233020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0x10]
	add r1, sp, #0x18
	adds r4, r0, #0
_0223302E:
	adds r0, r0, #1
	strb r4, [r1]
	adds r1, r1, #1
	cmp r0, #0x14
	blt _0223302E
	strb r4, [r6, #0x12]
	bl FUN_0203769C
	cmp r0, #0
	bne _02233048
	movs r0, #0
	str r0, [sp]
	b _0223304C
_02233048:
	movs r0, #2
	str r0, [sp]
_0223304C:
	ldrb r0, [r6, #0x10]
	movs r1, #0
	bl ov80_02237B24
	str r0, [sp, #8]
	ldrb r0, [r6, #0x10]
	movs r1, #1
	bl ov80_02237B58
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [sp]
	adds r0, r1, r0
	ldr r1, [sp]
	str r0, [sp, #0xc]
	cmp r1, r0
	bge _02233122
	add r7, sp, #0x18
_02233070:
	ldr r0, [r6, #0x28]
	ldr r1, [sp]
	bl FUN_02074644
	movs r1, #0xac
	movs r2, #0
	adds r5, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _02233116
	adds r0, r5, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #0xa4
	movs r2, #0
	bl FUN_0206E540
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022330E2
	ldrb r1, [r7]
	adds r1, r1, #1
	strb r1, [r7]
	ldr r1, [sp, #0x14]
	cmp r1, r0
	bne _022330B6
	ldrb r0, [r7, #1]
	adds r0, r0, #1
	strb r0, [r7, #1]
	b _022330CC
_022330B6:
	lsrs r1, r0, #1
	ldr r0, [sp, #0x14]
	cmp r0, r1
	blo _022330C6
	ldrb r0, [r7, #2]
	adds r0, r0, #1
	strb r0, [r7, #2]
	b _022330CC
_022330C6:
	ldrb r0, [r7, #3]
	adds r0, r0, #1
	strb r0, [r7, #3]
_022330CC:
	adds r0, r5, #0
	movs r1, #0xa0
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _022330E6
	ldrb r0, [r7, #4]
	adds r0, r0, #1
	strb r0, [r7, #4]
	b _022330E6
_022330E2:
	movs r0, #1
	strb r0, [r6, #0x12]
_022330E6:
	adds r0, r5, #0
	movs r1, #0x3a
	movs r2, #0
	bl FUN_0206E540
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #0x3b
	movs r2, #0
	bl FUN_0206E540
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0
	bl FUN_0206E540
	adds r4, r4, r0
	adds r0, r5, #0
	movs r1, #0x3d
	movs r2, #0
	bl FUN_0206E540
	adds r4, r4, r0
_02233116:
	ldr r0, [sp]
	adds r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp]
	cmp r1, r0
	blt _02233070
_02233122:
	ldr r1, [sp, #4]
	movs r0, #0
	cmp r1, #0
	ble _02233146
	movs r2, #0xdd
	add r3, sp, #0x18
	lsls r2, r2, #2
_02233130:
	adds r1, r6, r0
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _0223313E
	ldrb r1, [r3, #8]
	adds r1, r1, #1
	strb r1, [r3, #8]
_0223313E:
	ldr r1, [sp, #4]
	adds r0, r0, #1
	cmp r0, r1
	blt _02233130
_02233146:
	ldr r0, [sp, #8]
	movs r3, #0
	adds r7, r3, #0
	cmp r0, #0
	ble _0223316E
	movs r0, #0xe5
	lsls r0, r0, #2
_02233154:
	movs r2, #0
	adds r5, r6, #0
_02233158:
	ldrh r1, [r5, r0]
	adds r2, r2, #1
	adds r5, r5, #2
	adds r3, r3, r1
	cmp r2, #4
	blt _02233158
	ldr r1, [sp, #8]
	adds r7, r7, #1
	adds r6, #8
	cmp r7, r1
	blt _02233154
_0223316E:
	subs r0, r3, r4
	cmp r0, #5
	bgt _0223317E
	add r0, sp, #0x18
	ldrb r1, [r0, #5]
	adds r1, r1, #1
	strb r1, [r0, #5]
	b _02233198
_0223317E:
	cmp r0, #0xa
	bgt _0223318C
	add r0, sp, #0x18
	ldrb r1, [r0, #6]
	adds r1, r1, #1
	strb r1, [r0, #6]
	b _02233198
_0223318C:
	cmp r0, #0xf
	bgt _02233198
	add r0, sp, #0x18
	ldrb r1, [r0, #7]
	adds r1, r1, #1
	strb r1, [r0, #7]
_02233198:
	add r1, sp, #0x18
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r2, r2, r0
	ldr r0, [sp, #0x10]
	adds r3, r0, r2
	ldrb r2, [r1, #1]
	lsls r0, r2, #1
	adds r0, r2, r0
	adds r2, r3, r0
	ldrb r0, [r1, #2]
	lsls r0, r0, #1
	adds r2, r2, r0
	ldrb r0, [r1, #3]
	adds r2, r2, r0
	ldrb r0, [r1, #4]
	adds r2, r2, r0
	ldrb r0, [r1, #5]
	lsls r0, r0, #3
	adds r3, r2, r0
	ldrb r2, [r1, #6]
	movs r0, #6
	muls r0, r2, r0
	adds r2, r3, r0
	ldrb r0, [r1, #7]
	ldrb r1, [r1, #8]
	lsls r0, r0, #2
	adds r2, r2, r0
	movs r0, #7
	muls r0, r1, r0
	adds r0, r2, r0
	str r0, [sp, #0x10]
	cmp r0, #0
	bgt _022331E0
	movs r0, #1
	str r0, [sp, #0x10]
_022331E0:
	ldr r0, [sp, #0x10]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02233020

	thumb_func_start ov80_022331E8
ov80_022331E8: @ 0x022331E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r6, r0, #0
	adds r4, r2, #0
	bl FUN_0203107C
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0205C1F0
	str r0, [sp]
	adds r0, r5, #0
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp]
	adds r0, r7, #0
	bl FUN_020310BC
	adds r1, r0, r4
	ldr r0, _0223327C @ =0x0000270F
	cmp r1, r0
	ble _02233244
	adds r0, r6, #0
	bl FUN_0203107C
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0205C1F0
	str r0, [sp, #4]
	adds r0, r5, #0
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp, #4]
	ldr r3, _0223327C @ =0x0000270F
	adds r0, r7, #0
	bl FUN_02031108
	b _0223326A
_02233244:
	adds r0, r6, #0
	bl FUN_0203107C
	adds r7, r0, #0
	adds r0, r5, #0
	bl FUN_0205C1F0
	str r0, [sp, #8]
	adds r0, r5, #0
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp, #8]
	adds r0, r7, #0
	adds r3, r4, #0
	bl FUN_02031228
_0223326A:
	adds r0, r6, #0
	bl FUN_0202CF54
	movs r1, #0x42
	adds r2, r4, #0
	bl FUN_0202D144
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223327C: .4byte 0x0000270F
	thumb_func_end ov80_022331E8

	thumb_func_start ov80_02233280
ov80_02233280: @ 0x02233280
	push {r3, lr}
	cmp r1, #6
	bhi _022332CC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02233292: @ jump table
	.2byte _022332A0 - _02233292 - 2 @ case 0
	.2byte _022332A6 - _02233292 - 2 @ case 1
	.2byte _022332AC - _02233292 - 2 @ case 2
	.2byte _022332B2 - _02233292 - 2 @ case 3
	.2byte _022332B8 - _02233292 - 2 @ case 4
	.2byte _022332C0 - _02233292 - 2 @ case 5
	.2byte _022332C8 - _02233292 - 2 @ case 6
_022332A0:
	bl ov80_0222B5C8
	pop {r3, pc}
_022332A6:
	bl ov80_0222B65C
	pop {r3, pc}
_022332AC:
	bl ov80_0222B6C8
	pop {r3, pc}
_022332B2:
	bl ov80_0222B7E4
	pop {r3, pc}
_022332B8:
	adds r1, r2, #0
	bl ov80_0222B8D8
	pop {r3, pc}
_022332C0:
	adds r1, r2, #0
	bl ov80_0222B920
	pop {r3, pc}
_022332C8:
	bl ov80_0222B968
_022332CC:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02233280

	thumb_func_start ov80_022332D0
ov80_022332D0: @ 0x022332D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	bl ov80_0222AB34
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	beq _022332EC
	bl GF_AssertFail
_022332EC:
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _022332FA
	bl GF_AssertFail
_022332FA:
	ldrb r0, [r6, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02233342
	movs r0, #0xb
	movs r1, #1
	bl FUN_0201D39C
	adds r1, r5, #0
	adds r1, #0xa8
	str r0, [r1]
	movs r2, #1
	adds r1, r5, #0
	str r2, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333C8 @ =0x00000253
	adds r1, #0xa8
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	adds r3, r2, #0
	bl FUN_0201D40C
	adds r1, r5, #0
	adds r1, #0xa8
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
	b _022333BA
_02233342:
	movs r0, #0xb
	movs r1, #1
	bl FUN_0201D39C
	adds r1, r5, #0
	adds r1, #0xa8
	str r0, [r1]
	movs r0, #0xb
	movs r1, #1
	bl FUN_0201D39C
	adds r1, r5, #0
	adds r1, #0xac
	str r0, [r1]
	movs r2, #1
	adds r1, r5, #0
	str r2, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333C8 @ =0x00000253
	adds r1, #0xa8
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	adds r3, r2, #0
	bl FUN_0201D40C
	movs r2, #1
	adds r1, r5, #0
	str r2, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333CC @ =0x0000022B
	adds r1, #0xac
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	movs r3, #0x15
	bl FUN_0201D40C
	adds r1, r5, #0
	adds r1, #0xa8
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
	adds r1, r5, #0
	adds r1, #0xac
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
_022333BA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov80_02233490
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_022333C8: .4byte 0x00000253
_022333CC: .4byte 0x0000022B
	thumb_func_end ov80_022332D0

	thumb_func_start ov80_022333D0
ov80_022333D0: @ 0x022333D0
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, _022333EC @ =0x000003D9
	adds r0, r4, #0
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E580
	adds r0, r4, #0
	movs r1, #0xf
	bl FUN_0201D978
	pop {r4, pc}
	nop
_022333EC: .4byte 0x000003D9
	thumb_func_end ov80_022333D0

	thumb_func_start ov80_022333F0
ov80_022333F0: @ 0x022333F0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r1, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02233424
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _0223340C
	bl GF_AssertFail
_0223340C:
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r4, [r0]
	movs r1, #0
	adds r0, r4, #0
	bl FUN_0200E5D4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201D54C
	b _02233480
_02233424:
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02233432
	bl GF_AssertFail
_02233432:
	adds r0, r5, #0
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02233440
	bl GF_AssertFail
_02233440:
	bl FUN_0203769C
	cmp r0, #0
	bne _02233454
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r4, [r0]
	adds r0, r5, #0
	adds r0, #0xac
	b _0223345E
_02233454:
	adds r0, r5, #0
	adds r0, #0xac
	ldr r4, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
_0223345E:
	ldr r6, [r0]
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201D54C
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0200E5D4
	adds r0, r6, #0
	movs r1, #1
	bl FUN_0201D54C
_02233480:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0xa8
	str r1, [r0]
	adds r5, #0xac
	str r1, [r5]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_022333F0

	thumb_func_start ov80_02233490
ov80_02233490: @ 0x02233490
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022334EA
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022334AE
	bl GF_AssertFail
_022334AE:
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_020310BC
	adds r6, r0, #0
	ldr r0, [r5, #4]
	bl FUN_02028E9C
	adds r2, r0, #0
	adds r0, r4, #0
	adds r4, #0xa8
	ldr r1, [r4]
	adds r3, r6, #0
	bl ov80_02233594
	pop {r3, r4, r5, r6, r7, pc}
_022334EA:
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022334F8
	bl GF_AssertFail
_022334F8:
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02233506
	bl GF_AssertFail
_02233506:
	bl FUN_0203769C
	cmp r0, #0
	bne _0223353A
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_020310BC
	adds r6, r0, #0
	ldr r0, _02233590 @ =0x00000A1C
	ldrh r5, [r5, r0]
	b _02233564
_0223353A:
	ldr r0, _02233590 @ =0x00000A1C
	ldrh r6, [r5, r0]
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	str r0, [sp]
	ldrb r0, [r5, #0x10]
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp]
	adds r0, r7, #0
	bl FUN_020310BC
	adds r5, r0, #0
_02233564:
	movs r0, #0
	bl FUN_02034818
	adds r1, r4, #0
	adds r1, #0xa8
	adds r2, r0, #0
	ldr r1, [r1]
	adds r0, r4, #0
	adds r3, r6, #0
	bl ov80_02233594
	movs r0, #1
	bl FUN_02034818
	adds r2, r0, #0
	adds r0, r4, #0
	adds r4, #0xac
	ldr r1, [r4]
	adds r3, r5, #0
	bl ov80_02233594
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02233590: .4byte 0x00000A1C
	thumb_func_end ov80_02233490

	thumb_func_start ov80_02233594
ov80_02233594: @ 0x02233594
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r3, [sp, #0x14]
	str r1, [sp, #0xc]
	ldr r1, [r5, #0x34]
	movs r0, #0x14
	str r2, [sp, #0x10]
	bl FUN_02026354
	adds r4, r0, #0
	ldr r1, [r5, #0x34]
	movs r0, #0x14
	bl FUN_02026354
	adds r6, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x1f
	movs r3, #0xb
	bl FUN_0200BAF8
	adds r7, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x44]
	ldr r2, [sp, #0x14]
	movs r1, #0
	movs r3, #4
	bl FUN_0200BFCC
	adds r0, r7, #0
	movs r1, #2
	adds r2, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x44]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0200CBBC
	movs r3, #0x10
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	adds r2, r6, #0
	bl FUN_020200A8
	ldr r0, [r5, #0x44]
	ldr r2, [sp, #0x10]
	movs r1, #0
	bl FUN_0200BE48
	adds r0, r7, #0
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x44]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0xc]
	adds r2, r6, #0
	adds r3, r1, #0
	str r1, [sp, #8]
	bl FUN_020200A8
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0200BB44
	ldr r0, [sp, #0xc]
	bl FUN_0201D578
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02233594

	thumb_func_start ov80_02233648
ov80_02233648: @ 0x02233648
	ldrb r3, [r0, #0x10]
	ldrh r2, [r0, #0x16]
	cmp r3, #1
	bhi _0223365E
	cmp r2, #8
	blo _02233658
	movs r1, #7
	b _0223366A
_02233658:
	ldr r1, _02233680 @ =0x0223BE54
	ldrb r1, [r1, r2]
	b _0223366A
_0223365E:
	cmp r2, #8
	blo _02233666
	movs r1, #0x12
	b _0223366A
_02233666:
	ldr r1, _02233684 @ =0x0223BE60
	ldrb r1, [r1, r2]
_0223366A:
	cmp r3, #0
	bne _0223367A
	ldrh r0, [r0, #0x14]
	cmp r0, #0x15
	beq _02233678
	cmp r0, #0x31
	bne _0223367A
_02233678:
	movs r1, #0x14
_0223367A:
	adds r0, r1, #0
	bx lr
	nop
_02233680: .4byte 0x0223BE54
_02233684: .4byte 0x0223BE60
	thumb_func_end ov80_02233648

	thumb_func_start ov80_02233688
ov80_02233688: @ 0x02233688
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	bl ov80_0222BE10
	str r0, [sp, #0xc]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	str r0, [sp, #0x14]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	str r6, [sp]
	lsls r2, r4, #0x18
	ldr r1, [sp, #0x14]
	str r7, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r0, #8]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #0x10]
	lsrs r2, r2, #0x18
	bl ov80_022340E8
	adds r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096818
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02233688

	thumb_func_start ov80_022336EC
ov80_022336EC: @ 0x022336EC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r4, #0
	bl ov80_0223437C
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022336EC

	thumb_func_start ov80_02233708
ov80_02233708: @ 0x02233708
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_02234520
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02233708

	thumb_func_start ov80_0223371C
ov80_0223371C: @ 0x0223371C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r7, r0, #0
	movs r0, #0xb
	movs r1, #0x48
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x48
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r6, #8]
	adds r1, r7, #0
	str r0, [r4]
	adds r0, r4, #0
	bl ov80_02233944
	ldr r0, _02233768 @ =ov80_02233A1C
	ldr r1, _0223376C @ =0x0223BE78
	str r0, [sp]
	ldr r0, [r5]
	adds r2, r4, #0
	ldr r0, [r0]
	movs r3, #0
	bl FUN_02096820
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02233768: .4byte ov80_02233A1C
_0223376C: .4byte 0x0223BE78
	thumb_func_end ov80_0223371C

	thumb_func_start ov80_02233770
ov80_02233770: @ 0x02233770
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	adds r6, r0, #0
	ldr r1, [r6, #0xc]
	movs r4, #0x6d
	str r1, [sp, #8]
	ldr r2, [sp, #8]
	ldr r3, [sp, #8]
	lsls r4, r4, #2
	ldr r1, [r1, #4]
	ldr r2, [r2, #0xc]
	ldr r3, [r3, r4]
	bl ov80_02234848
	strb r0, [r6, #0x1d]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x14]
	bl FUN_02052554
	str r0, [r6, #0x28]
	ldrb r0, [r6, #0x13]
	cmp r0, #0x1b
	bne _022337AC
	movs r1, #1
	movs r7, #3
	b _022337B0
_022337AC:
	movs r1, #0
	movs r7, #2
_022337B0:
	ldr r0, [sp, #8]
	lsls r5, r1, #2
	adds r4, r0, #4
	movs r2, #0
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	adds r3, r2, #0
	bl ov80_02235364
	movs r2, #1
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	adds r3, r2, #0
	bl ov80_02235364
	ldrb r0, [r6, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022337E6
	movs r2, #2
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	adds r3, r2, #0
	bl ov80_02235364
	b _02233804
_022337E6:
	ldr r0, [sp, #8]
	lsls r5, r7, #2
	adds r4, r0, #4
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	movs r2, #0
	movs r3, #2
	bl ov80_02235364
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	movs r2, #1
	movs r3, #3
	bl ov80_02235364
_02233804:
	ldrb r0, [r6, #0x13]
	cmp r0, #0x11
	bne _02233858
	ldrb r0, [r6, #0x10]
	movs r1, #1
	bl ov80_022380E8
	movs r5, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02233858
_0223381A:
	ldr r0, [r6, #0x70]
	adds r1, r5, #0
	bl FUN_02074644
	adds r4, r0, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	subs r1, r7, #3
	bl FUN_0206FD00
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #0x10
	bl FUN_0206EC40
	adds r0, r4, #0
	bl FUN_0206E250
	ldr r0, [sp, #4]
	adds r5, r5, #1
	cmp r5, r0
	blt _0223381A
_02233858:
	ldr r0, [r6, #0x70]
	bl FUN_02074640
	str r0, [sp, #0xc]
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _022338FA
	adds r5, r6, #0
	add r7, sp, #0x14
_0223386E:
	ldr r0, [r6, #0x70]
	ldr r1, [sp]
	bl FUN_02074644
	adds r1, r5, #0
	adds r1, #0x94
	ldr r1, [r1]
	adds r4, r0, #0
	str r1, [sp, #0x14]
	movs r1, #0xa4
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0xa3
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r5, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0xa5
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	movs r1, #0xa6
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r5, #0
	adds r0, #0xc4
	ldr r0, [r0]
	movs r1, #0xa7
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	movs r1, #0xa8
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r5, #0
	adds r0, #0xe4
	ldr r0, [r0]
	movs r1, #0xa9
	str r0, [sp, #0x14]
	adds r0, r4, #0
	adds r2, r7, #0
	bl FUN_0206EC40
	ldr r0, [sp]
	adds r5, r5, #4
	adds r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp]
	cmp r1, r0
	blt _0223386E
_022338FA:
	ldr r0, [sp, #8]
	bl FUN_02051BF8
	movs r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02233770

	thumb_func_start ov80_02233908
ov80_02233908: @ 0x02233908
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r4, r0, #0
	bl ov80_02238150
	adds r2, r0, #0
	str r2, [r4, #0xc]
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02233940 @ =0x020FA484
	ldr r0, [r0]
	bl FUN_02096820
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02233940: .4byte 0x020FA484
	thumb_func_end ov80_02233908

	thumb_func_start ov80_02233944
ov80_02233944: @ 0x02233944
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r4, r0, #0
	ldrb r0, [r7, #0x10]
	strb r0, [r4, #4]
	adds r0, r7, #0
	bl ov80_02238498
	strh r0, [r4, #0x1e]
	adds r0, r7, #0
	adds r0, #0x20
	str r0, [r4, #0x14]
	adds r0, r7, #0
	adds r0, #0x13
	str r0, [r4, #0x10]
	ldrb r0, [r7, #0x1d]
	movs r1, #0
	strb r0, [r4, #7]
	ldrh r0, [r7, #0x18]
	strh r0, [r4, #0x1c]
	ldr r0, _02233A18 @ =0x00000A78
	ldrh r0, [r7, r0]
	strh r0, [r4, #0x18]
	adds r0, r7, #0
	adds r0, #0x1c
	str r0, [r4, #0xc]
	ldr r0, [r7, #0x70]
	str r0, [r4, #0x30]
	ldr r0, [r7, #0x74]
	str r0, [r4, #0x34]
	str r7, [r4, #0x3c]
	adds r0, r7, #0
	str r1, [r7, #0x14]
	adds r0, #0x14
	str r0, [r4, #8]
	ldrb r0, [r7, #0x12]
	adds r4, #0x42
	strb r0, [r4]
	strb r1, [r7, #0x12]
	strb r1, [r7, #0x1f]
	ldr r0, [r7, #0x70]
	bl FUN_02074640
	movs r6, #0
	str r0, [sp]
	cmp r0, #0
	ble _02233A16
	adds r5, r7, #0
_022339A4:
	ldr r0, [r7, #0x70]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #0xa4
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa5
	movs r2, #0
	bl FUN_0206E540
	adds r1, r5, #0
	adds r1, #0xa4
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa6
	movs r2, #0
	bl FUN_0206E540
	adds r1, r5, #0
	adds r1, #0xb4
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa7
	movs r2, #0
	bl FUN_0206E540
	adds r1, r5, #0
	adds r1, #0xc4
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa8
	movs r2, #0
	bl FUN_0206E540
	adds r1, r5, #0
	adds r1, #0xd4
	str r0, [r1]
	adds r0, r4, #0
	movs r1, #0xa9
	movs r2, #0
	bl FUN_0206E540
	adds r1, r5, #0
	adds r1, #0xe4
	str r0, [r1]
	ldr r0, [sp]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _022339A4
_02233A16:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02233A18: .4byte 0x00000A78
	thumb_func_end ov80_02233944

	thumb_func_start ov80_02233A1C
ov80_02233A1C: @ 0x02233A1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	adds r1, r4, #0
	bl ov80_02234550
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov80_02233A1C

	thumb_func_start ov80_02233A30
ov80_02233A30: @ 0x02233A30
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_022347E4
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02233A30

	thumb_func_start ov80_02233A44
ov80_02233A44: @ 0x02233A44
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_022347EC
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02233A44

	thumb_func_start ov80_02233A58
ov80_02233A58: @ 0x02233A58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r7, r0, #0
	ldr r2, [r7, #0x1c]
	adds r1, r2, #1
	str r1, [r7, #0x1c]
	ldrb r1, [r2]
	str r1, [sp, #0x20]
	bl ov80_0222BE10
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r0, r7, #0
	bl ov80_0222BE10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_02096808
	str r0, [sp, #0x24]
	ldr r0, [r7]
	bl ov80_0222AB34
	ldr r1, [sp, #0x20]
	str r0, [sp, #0x28]
	cmp r1, #0x34
	bls _02233AA8
	b _02233F12
_02233AA8:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02233AB4: @ jump table
	.2byte _02233F12 - _02233AB4 - 2 @ case 0
	.2byte _02233F12 - _02233AB4 - 2 @ case 1
	.2byte _02233B1E - _02233AB4 - 2 @ case 2
	.2byte _02233B22 - _02233AB4 - 2 @ case 3
	.2byte _02233B2E - _02233AB4 - 2 @ case 4
	.2byte _02233B34 - _02233AB4 - 2 @ case 5
	.2byte _02233CB0 - _02233AB4 - 2 @ case 6
	.2byte _02233B42 - _02233AB4 - 2 @ case 7
	.2byte _02233F12 - _02233AB4 - 2 @ case 8
	.2byte _02233B4A - _02233AB4 - 2 @ case 9
	.2byte _02233B54 - _02233AB4 - 2 @ case 10
	.2byte _02233D62 - _02233AB4 - 2 @ case 11
	.2byte _02233B5E - _02233AB4 - 2 @ case 12
	.2byte _02233F12 - _02233AB4 - 2 @ case 13
	.2byte _02233B6A - _02233AB4 - 2 @ case 14
	.2byte _02233B74 - _02233AB4 - 2 @ case 15
	.2byte _02233B96 - _02233AB4 - 2 @ case 16
	.2byte _02233CC2 - _02233AB4 - 2 @ case 17
	.2byte _02233B9C - _02233AB4 - 2 @ case 18
	.2byte _02233BCA - _02233AB4 - 2 @ case 19
	.2byte _02233BD4 - _02233AB4 - 2 @ case 20
	.2byte _02233BE0 - _02233AB4 - 2 @ case 21
	.2byte _02233BE8 - _02233AB4 - 2 @ case 22
	.2byte _02233BF0 - _02233AB4 - 2 @ case 23
	.2byte _02233BFA - _02233AB4 - 2 @ case 24
	.2byte _02233C02 - _02233AB4 - 2 @ case 25
	.2byte _02233F12 - _02233AB4 - 2 @ case 26
	.2byte _02233F12 - _02233AB4 - 2 @ case 27
	.2byte _02233CB8 - _02233AB4 - 2 @ case 28
	.2byte _02233CC8 - _02233AB4 - 2 @ case 29
	.2byte _02233CCE - _02233AB4 - 2 @ case 30
	.2byte _02233CD4 - _02233AB4 - 2 @ case 31
	.2byte _02233D32 - _02233AB4 - 2 @ case 32
	.2byte _02233D3E - _02233AB4 - 2 @ case 33
	.2byte _02233D44 - _02233AB4 - 2 @ case 34
	.2byte _02233D4A - _02233AB4 - 2 @ case 35
	.2byte _02233D56 - _02233AB4 - 2 @ case 36
	.2byte _02233D6C - _02233AB4 - 2 @ case 37
	.2byte _02233D82 - _02233AB4 - 2 @ case 38
	.2byte _02233DD2 - _02233AB4 - 2 @ case 39
	.2byte _02233DE4 - _02233AB4 - 2 @ case 40
	.2byte _02233E16 - _02233AB4 - 2 @ case 41
	.2byte _02233E24 - _02233AB4 - 2 @ case 42
	.2byte _02233E32 - _02233AB4 - 2 @ case 43
	.2byte _02233E50 - _02233AB4 - 2 @ case 44
	.2byte _02233E92 - _02233AB4 - 2 @ case 45
	.2byte _02233E9C - _02233AB4 - 2 @ case 46
	.2byte _02233EA6 - _02233AB4 - 2 @ case 47
	.2byte _02233EAC - _02233AB4 - 2 @ case 48
	.2byte _02233ECE - _02233AB4 - 2 @ case 49
	.2byte _02233EFA - _02233AB4 - 2 @ case 50
	.2byte _02233F02 - _02233AB4 - 2 @ case 51
	.2byte _02233F0C - _02233AB4 - 2 @ case 52
_02233B1E:
	strb r6, [r4, #0x10]
	b _02233F12
_02233B22:
	lsls r0, r6, #1
	adds r1, r4, r0
	ldr r0, _02233E3C @ =0x00000418
	ldrh r0, [r1, r0]
	strh r0, [r5]
	b _02233F12
_02233B2E:
	ldrh r0, [r4, #0x18]
	strh r0, [r5]
	b _02233F12
_02233B34:
	ldrh r1, [r4, #0x18]
	ldr r0, _02233E40 @ =0x0000270F
	cmp r1, r0
	bhs _02233BC8
	adds r0, r1, #1
	strh r0, [r4, #0x18]
	b _02233F12
_02233B42:
	movs r0, #0
	blx FUN_020D3B84
	b _02233F12
_02233B4A:
	ldr r0, [r4, #8]
	bl FUN_02030E98
	strh r0, [r5]
	b _02233F12
_02233B54:
	adds r0, r4, #0
	movs r1, #2
	bl ov80_02234588
	b _02233F12
_02233B5E:
	ldrb r1, [r4, #0x13]
	adds r0, r4, #0
	bl ov80_02238430
	strh r0, [r5]
	b _02233F12
_02233B6A:
	adds r0, r4, #0
	bl ov80_02234764
	strh r0, [r5]
	b _02233F12
_02233B74:
	cmp r6, #0
	bne _02233B82
	ldr r0, [r4, #0x70]
	movs r1, #0
	bl FUN_02074644
	b _02233B8A
_02233B82:
	ldr r0, [r4, #0x74]
	movs r1, #0
	bl FUN_02074644
_02233B8A:
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r5]
	b _02233F12
_02233B96:
	ldrb r0, [r4, #0x13]
	strh r0, [r5]
	b _02233F12
_02233B9C:
	ldr r0, [sp, #0x24]
	ldr r0, [r0, #8]
	bl FUN_02074904
	adds r7, r0, #0
	ldr r0, _02233E44 @ =0x00000412
	movs r5, #0
	adds r6, r4, r0
_02233BAC:
	adds r1, r4, r5
	adds r1, #0x2c
	ldrb r1, [r1]
	adds r0, r7, #0
	bl FUN_02074644
	movs r1, #6
	adds r2, r6, #0
	bl FUN_0206EC40
	adds r5, r5, #1
	adds r6, r6, #2
	cmp r5, #3
	blt _02233BAC
_02233BC8:
	b _02233F12
_02233BCA:
	adds r0, r4, #0
	bl ov80_02238498
	strh r0, [r5]
	b _02233F12
_02233BD4:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_02234774
	strh r0, [r5]
	b _02233F12
_02233BE0:
	adds r0, r4, #0
	bl ov80_022347B8
	b _02233F12
_02233BE8:
	adds r0, r4, #0
	bl ov80_022347C4
	b _02233F12
_02233BF0:
	adds r0, r4, #0
	bl ov80_02234770
	strh r0, [r5]
	b _02233F12
_02233BFA:
	ldr r0, _02233E48 @ =0x00000A74
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _02233F12
_02233C02:
	ldrb r0, [r4, #0x13]
	cmp r0, #0x1b
	bne _02233CAE
	ldrb r0, [r4, #0x10]
	movs r1, #1
	bl ov80_022380E8
	str r0, [sp, #0x18]
	ldrb r0, [r4, #0x10]
	movs r1, #1
	bl ov80_0223811C
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _02233CAE
_02233C24:
	ldr r0, [r4, #0x30]
	ldr r7, [r0]
	adds r0, r7, #0
	bl FUN_020248AC
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x38
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x40]
	ldr r5, [r0]
	adds r0, r5, #0
	bl FUN_020248AC
	adds r6, r0, #0
	add r3, sp, #0x2c
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r2, #0
	str r0, [r3]
	adds r0, r7, #0
	bl FUN_020247D4
	adds r0, r5, #0
	add r1, sp, #0x38
	bl FUN_020247D4
	ldr r0, [r4, #0x50]
	ldr r7, [r0]
	adds r0, r7, #0
	bl FUN_020248AC
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x38
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x60]
	ldr r5, [r0]
	adds r0, r5, #0
	bl FUN_020248AC
	adds r6, r0, #0
	add r3, sp, #0x2c
	ldm r6!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldr r0, [r6]
	adds r1, r2, #0
	str r0, [r3]
	adds r0, r7, #0
	bl FUN_020247D4
	adds r0, r5, #0
	add r1, sp, #0x38
	bl FUN_020247D4
	ldr r0, [sp, #0x10]
	adds r4, r4, #4
	adds r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _02233C24
_02233CAE:
	b _02233F12
_02233CB0:
	adds r0, r4, #0
	bl FUN_02096910
	b _02233F12
_02233CB8:
	ldrb r0, [r4, #0x10]
	bl ov80_02238374
	strh r0, [r5]
	b _02233F12
_02233CC2:
	ldrb r0, [r4, #0x10]
	strh r0, [r5]
	b _02233F12
_02233CC8:
	bl ov80_0222F210
	b _02233F12
_02233CCE:
	bl ov80_0222F278
	b _02233F12
_02233CD4:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov80_02234A74
	ldrb r0, [r4, #0x10]
	movs r1, #1
	bl ov80_022380E8
	str r0, [sp, #0x14]
	ldrb r0, [r4, #0x10]
	movs r1, #1
	bl ov80_0223811C
	adds r7, r0, #0
	cmp r6, #0
	bne _02233D16
	ldr r0, [sp, #0x14]
	movs r5, #0
	cmp r0, #0
	ble _02233D14
	movs r6, #2
_02233D00:
	ldr r0, [r4, #0x30]
	adds r1, r6, #0
	ldr r0, [r0]
	bl FUN_02024A04
	ldr r0, [sp, #0x14]
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, r0
	blt _02233D00
_02233D14:
	b _02233F12
_02233D16:
	movs r5, #0
	cmp r7, #0
	ble _02233D30
	movs r6, #2
_02233D1E:
	ldr r0, [r4, #0x40]
	adds r1, r6, #0
	ldr r0, [r0]
	bl FUN_02024A04
	adds r5, r5, #1
	adds r4, r4, #4
	cmp r5, r7
	blt _02233D1E
_02233D30:
	b _02233F12
_02233D32:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov80_02234B24
	b _02233F12
_02233D3E:
	bl ov80_0222F33C
	b _02233F12
_02233D44:
	bl ov80_0222F3CC
	b _02233F12
_02233D4A:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov80_02234BEC
	b _02233F12
_02233D56:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov80_02234CB0
	b _02233F12
_02233D62:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	bl ov80_02234968
	b _02233F12
_02233D6C:
	ldrb r0, [r4, #0x10]
	bl ov80_02238374
	cmp r0, #1
	beq _02233D78
	b _02233F12
_02233D78:
	ldr r1, [sp, #0x28]
	adds r0, r4, #0
	bl ov80_02234A38
	b _02233F12
_02233D82:
	ldrb r0, [r4, #0x13]
	bl ov80_022384BC
	cmp r0, #0
	bne _02233DAA
	ldr r1, [sp, #0x1c]
	adds r0, r4, #0
	bl ov80_022347A8
	adds r2, r0, #0
	lsls r2, r2, #1
	adds r2, r4, r2
	ldr r0, [r7]
	adds r2, #0x78
	ldrh r2, [r2]
	ldr r0, [r0, #0x44]
	adds r1, r6, #0
	bl FUN_0200C3B4
	b _02233F12
_02233DAA:
	ldrb r0, [r4, #0x10]
	bl ov80_02238374
	cmp r0, #0
	bne _02233DBE
	ldr r0, [sp, #0x24]
	ldr r0, [r0, #8]
	bl FUN_02028E9C
	b _02233DC4
_02233DBE:
	ldr r0, [sp, #0x1c]
	bl FUN_02034818
_02233DC4:
	adds r2, r0, #0
	ldr r0, [r7]
	adds r1, r6, #0
	ldr r0, [r0, #0x44]
	bl FUN_0200BE48
	b _02233F12
_02233DD2:
	ldr r1, _02233E4C @ =0x00000A7A
	ldr r0, [sp, #0x1c]
	adds r2, r6, #0
	strb r0, [r4, r1]
	adds r0, r7, #0
	adds r1, r4, #0
	bl ov80_02233F1C
	b _02233F12
_02233DE4:
	ldrb r1, [r4, #0x11]
	adds r0, r4, #0
	adds r0, #0xf4
	lsls r1, r1, #1
	adds r1, r4, r1
	adds r1, #0x78
	ldrh r1, [r1]
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #0x11]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r1, r1, #7
	lsls r1, r1, #1
	adds r1, r4, r1
	adds r1, #0x78
	ldrh r1, [r1]
	adds r0, r4, r0
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_0222A474
	b _02233F12
_02233E16:
	ldr r1, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov80_02234B7C
	b _02233F12
_02233E24:
	ldr r1, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov80_02234BB4
	b _02233F12
_02233E32:
	ldr r1, [sp, #0x1c]
	adds r0, r6, #0
	bl ov80_02234DC4
	b _02233F12
	.align 2, 0
_02233E3C: .4byte 0x00000418
_02233E40: .4byte 0x0000270F
_02233E44: .4byte 0x00000412
_02233E48: .4byte 0x00000A74
_02233E4C: .4byte 0x00000A7A
_02233E50:
	cmp r6, #0
	bne _02233E68
	str r6, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r1, #2
	adds r3, r1, #0
	ldr r0, [r0, #4]
	adds r3, #0xfe
	bl FUN_02003E5C
	b _02233F12
_02233E68:
	ldr r0, [r7]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	bl ov80_02239938
	ldr r0, [r0, #4]
	bl FUN_02229248
	adds r2, r0, #0
	lsls r2, r2, #0x14
	str r6, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	movs r1, #2
	ldr r0, [r0, #4]
	lsrs r2, r2, #0x10
	movs r3, #0x10
	bl FUN_02003E5C
	b _02233F12
_02233E92:
	adds r0, r4, #0
	bl ov80_02235324
	strh r0, [r5]
	b _02233F12
_02233E9C:
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	b _02233F12
_02233EA6:
	ldrb r0, [r4, #0x1f]
	strh r0, [r5]
	b _02233F12
_02233EAC:
	movs r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _02233F12
	ldrh r0, [r4, #0x18]
	adds r0, r0, #1
	cmp r0, #0x15
	bne _02233EC4
	movs r0, #1
	strh r0, [r5]
	b _02233F12
_02233EC4:
	cmp r0, #0x31
	bne _02233F12
	movs r0, #2
	strh r0, [r5]
	b _02233F12
_02233ECE:
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r3, #0x33
	lsls r3, r3, #4
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	adds r1, r3, #0
	adds r2, r3, #0
	str r0, [sp, #0xc]
	adds r0, r4, r3
	subs r1, #0x1c
	subs r2, #0x14
	subs r3, #0x10
	adds r1, r4, r1
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov80_0222A52C
	b _02233F12
_02233EFA:
	adds r0, r4, #0
	bl ov80_022383C0
	b _02233F12
_02233F02:
	ldrb r0, [r4, #0x1e]
	strh r0, [r5]
	movs r0, #1
	strb r0, [r4, #0x1e]
	b _02233F12
_02233F0C:
	ldr r0, _02233F18 @ =0x00000A7C
	movs r1, #0
	strb r1, [r4, r0]
_02233F12:
	movs r0, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02233F18: .4byte 0x00000A7C
	thumb_func_end ov80_02233A58

	thumb_func_start ov80_02233F1C
ov80_02233F1C: @ 0x02233F1C
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	adds r5, r1, #0
	adds r4, r2, #0
	bl ov80_0222AB34
	ldr r0, [r0, #0x10]
	movs r1, #0
	bl ov80_02239A60
	ldr r2, _02233F3C @ =ov80_02233F40
	adds r1, r4, #0
	adds r3, r5, #0
	bl FUN_02015494
	pop {r3, r4, r5, pc}
	.align 2, 0
_02233F3C: .4byte ov80_02233F40
	thumb_func_end ov80_02233F1C

	thumb_func_start ov80_02233F40
ov80_02233F40: @ 0x02233F40
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl FUN_02015504
	ldr r5, _02233FB4 @ =0x0223BE6C
	adds r2, r0, #0
	ldm r5!, {r0, r1}
	add r3, sp, #8
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, _02233FB8 @ =0x00000A7A
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _02233FB0
	adds r0, r4, #0
	add r1, sp, #0
	bl FUN_02015538
	add r1, sp, #0
	movs r0, #0
	ldrsh r2, [r1, r0]
	subs r0, r0, #1
	muls r0, r2, r0
	strh r0, [r1]
	adds r0, r4, #0
	ldrh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	adds r0, r4, #0
	ldrh r2, [r1, #2]
	adds r0, #0x52
	strh r2, [r0]
	adds r0, r4, #0
	ldrh r1, [r1, #4]
	adds r0, #0x54
	strh r1, [r0]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	adds r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	adds r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	adds r0, r1, r0
	str r0, [r4, #0x30]
_02233FB0:
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_02233FB4: .4byte 0x0223BE6C
_02233FB8: .4byte 0x00000A7A
	thumb_func_end ov80_02233F40

	thumb_func_start ov80_02233FBC
ov80_02233FBC: @ 0x02233FBC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r0, [r0, #0x28]
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02233FBC

	thumb_func_start ov80_02233FD8
ov80_02233FD8: @ 0x02233FD8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_02234E50
	strh r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02233FD8

	thumb_func_start ov80_02234008
ov80_02234008: @ 0x02234008
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _02234024 @ =ov80_02234028
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_02234024: .4byte ov80_02234028
	thumb_func_end ov80_02234008

	thumb_func_start ov80_02234028
ov80_02234028: @ 0x02234028
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r1, _02234054 @ =0x00000A7C
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _0223404E
	movs r2, #0
	strb r2, [r0, r1]
	movs r0, #1
	pop {r4, pc}
_0223404E:
	movs r0, #0
	pop {r4, pc}
	nop
_02234054: .4byte 0x00000A7C
	thumb_func_end ov80_02234028

	thumb_func_start ov80_02234058
ov80_02234058: @ 0x02234058
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r5, #0x1c]
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0]
	bl FUN_02096810
	adds r2, r0, #0
	bne _0223407C
	movs r0, #0
	pop {r3, r4, r5, pc}
_0223407C:
	movs r1, #0x43
	lsls r1, r1, #2
	adds r2, r2, r1
	lsls r1, r4, #4
	adds r1, r4, r1
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r2, r1
	bl ov80_0222F44C
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02234058

	thumb_func_start ov80_02234094
ov80_02234094: @ 0x02234094
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	ldrb r1, [r0, #0x13]
	bl ov80_02234E98
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov80_02234094

	thumb_func_start ov80_022340A8
ov80_022340A8: @ 0x022340A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #4]
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r3, [sp, #4]
	adds r1, r6, #0
	adds r2, r7, #0
	str r4, [sp]
	bl ov80_02234D04
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022340A8

	thumb_func_start ov80_022340E8
ov80_022340E8: @ 0x022340E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r7, r1, #0
	adds r4, r0, #0
	str r2, [sp, #4]
	ldr r1, _02234370 @ =0x00000A88
	movs r0, #0xb
	str r3, [sp, #8]
	bl FUN_0201AA8C
	ldr r1, _02234374 @ =0x0223DD4C
	ldr r2, _02234370 @ =0x00000A88
	str r0, [r1]
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r5, [r0]
	adds r0, r4, #0
	bl FUN_02030E88
	str r0, [r5, #8]
	ldr r1, _02234374 @ =0x0223DD4C
	str r4, [r5, #4]
	movs r0, #0xb
	str r0, [r5]
	ldr r5, [r1]
	bl FUN_020744BC
	str r0, [r5, #0x70]
	movs r0, #0xb
	bl FUN_020744BC
	str r0, [r5, #0x74]
	movs r0, #0x2a
	ldr r1, [sp, #0x38]
	lsls r0, r0, #6
	str r1, [r5, r0]
	movs r0, #0x20
	strb r0, [r5, #0x13]
	adds r0, r4, #0
	ldr r6, [r5, #8]
	bl FUN_02030FA0
	adds r4, r0, #0
	cmp r7, #0
	bne _022341EC
	ldr r0, _02234374 @ =0x0223DD4C
	movs r1, #0
	ldr r2, [r0]
	ldr r0, [sp, #4]
	strb r0, [r2, #0x10]
	strb r1, [r2, #0x11]
	movs r0, #3
	strb r0, [r2, #0x1c]
	adds r0, r6, #0
	strb r1, [r2, #0x12]
	bl FUN_02030E7C
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	cmp r2, #3
	bne _02234174
	ldr r0, [r0, #4]
	bl FUN_020503D0
	bl FUN_02066E48
	b _02234180
_02234174:
	movs r3, #0
	adds r0, r4, #0
	movs r1, #8
	str r3, [sp]
	bl FUN_02030FE4
_02234180:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _022341B8
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r5, [r0]
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C2C0
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C2C0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	strh r0, [r5, #0x18]
	b _022341C0
_022341B8:
	ldr r0, _02234374 @ =0x0223DD4C
	movs r1, #0
	ldr r0, [r0]
	strh r1, [r0, #0x18]
_022341C0:
	ldr r0, _02234374 @ =0x0223DD4C
	movs r1, #7
	ldr r4, [r0]
	ldrh r0, [r4, #0x18]
	blx FUN_020F2998
	strh r0, [r4, #0x1a]
	movs r0, #0
	str r0, [r4, #0x24]
	adds r1, r4, #0
	ldr r0, [sp, #8]
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	add r1, sp, #0x20
	ldrh r2, [r1, #0x10]
	adds r0, #0x2d
	adds r4, #0x2e
	strb r2, [r0]
	ldrh r0, [r1, #0x14]
	strb r0, [r4]
	b _02234294
_022341EC:
	movs r1, #0
	adds r0, r6, #0
	adds r2, r1, #0
	adds r3, r1, #0
	str r1, [sp]
	bl FUN_02030F34
	ldr r1, _02234374 @ =0x0223DD4C
	movs r2, #0
	ldr r1, [r1]
	adds r3, r2, #0
	strb r0, [r1, #0x10]
	adds r0, r6, #0
	movs r1, #2
	str r2, [sp]
	bl FUN_02030F34
	ldr r1, _02234374 @ =0x0223DD4C
	movs r2, #0
	ldr r4, [r1]
	movs r1, #3
	strb r0, [r4, #0x11]
	str r2, [sp]
	adds r0, r6, #0
	adds r3, r2, #0
	bl FUN_02030F34
	strb r0, [r4, #0x1c]
	movs r2, #0
	str r2, [sp]
	adds r0, r6, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02030F34
	strb r0, [r4, #0x12]
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r5, [r0]
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r7, r0, #0
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl FUN_0205C2C0
	str r0, [sp, #0x10]
	ldrb r0, [r4, #0x10]
	bl FUN_0205C2C0
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r1, [sp, #0x10]
	adds r0, r7, #0
	bl FUN_020310BC
	strh r0, [r5, #0x18]
	ldrh r0, [r5, #0x18]
	movs r1, #7
	blx FUN_020F2998
	movs r4, #0
	strh r0, [r5, #0x1a]
	adds r7, r4, #0
_02234270:
	ldr r0, _02234374 @ =0x0223DD4C
	lsls r2, r4, #0x18
	ldr r5, [r0]
	adds r0, r6, #0
	movs r1, #6
	lsrs r2, r2, #0x18
	adds r3, r7, #0
	str r7, [sp]
	bl FUN_02030F34
	adds r1, r5, r4
	adds r1, #0x2c
	strb r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	blo _02234270
_02234294:
	ldr r6, _02234374 @ =0x0223DD4C
	ldr r7, _02234378 @ =0x00000412
	movs r5, #0
_0223429A:
	ldr r4, [r6]
	ldr r0, [r4, #4]
	bl FUN_02074904
	adds r1, r4, r5
	adds r1, #0x2c
	ldrb r1, [r1]
	bl FUN_02074644
	ldr r4, [r6]
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r1, r5, #1
	adds r1, r4, r1
	strh r0, [r1, r7]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	blo _0223429A
	ldr r0, [r4, #4]
	bl FUN_02074904
	str r0, [sp, #0xc]
	ldr r0, _02234374 @ =0x0223DD4C
	movs r1, #0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_022380E8
	adds r7, r0, #0
	movs r5, #0
	cmp r7, #0
	ble _0223434E
	ldr r6, _02234374 @ =0x0223DD4C
_022342E4:
	ldr r1, [r6]
	ldr r0, [sp, #0xc]
	adds r1, r1, r5
	adds r1, #0x2c
	ldrb r1, [r1]
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x70]
	bl FUN_02074524
	ldr r0, [r6]
	adds r1, r5, #0
	ldr r0, [r0, #0x70]
	bl FUN_02074644
	movs r1, #0
	str r1, [sp, #0x18]
	adds r4, r0, #0
	movs r1, #6
	add r2, sp, #0x18
	bl FUN_0206EC40
	adds r0, r4, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0x32
	bls _02234344
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x32
	bl FUN_0206FD00
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #0x14
	bl FUN_0206EC40
	adds r0, r4, #0
	bl FUN_0206E250
_02234344:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, r7
	blt _022342E4
_0223434E:
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02238374
	cmp r0, #1
	bne _02234366
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov80_0222A840
_02234366:
	ldr r0, _02234374 @ =0x0223DD4C
	ldr r0, [r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02234370: .4byte 0x00000A88
_02234374: .4byte 0x0223DD4C
_02234378: .4byte 0x00000412
	thumb_func_end ov80_022340E8

	thumb_func_start ov80_0223437C
ov80_0223437C: @ 0x0223437C
	push {r3, lr}
	cmp r1, #0
	bne _02234388
	bl ov80_02234390
	pop {r3, pc}
_02234388:
	bl ov80_02234424
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0223437C

	thumb_func_start ov80_02234390
ov80_02234390: @ 0x02234390
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	bl ov80_02238498
	adds r1, r0, #0
	adds r2, r5, #0
	ldrb r0, [r5, #0x10]
	adds r2, #0x78
	movs r3, #0xe
	bl ov80_022380A0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	ldrb r4, [r5, #0x11]
	bl ov80_0223811C
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02238374
	movs r3, #0x33
	lsls r3, r3, #4
	adds r1, r5, r3
	str r1, [sp]
	adds r1, r3, #0
	subs r1, #0x14
	adds r1, r5, r1
	str r1, [sp, #4]
	adds r1, r3, #0
	subs r1, #0x10
	adds r1, r5, r1
	adds r2, r4, #7
	str r1, [sp, #8]
	lsls r0, r0, #0x18
	lsls r1, r4, #1
	lsls r2, r2, #1
	lsrs r0, r0, #0x18
	adds r1, r5, r1
	adds r2, r5, r2
	str r0, [sp, #0xc]
	adds r1, #0x78
	adds r2, #0x78
	subs r3, #0x1c
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r0, r6, #0
	adds r3, r5, r3
	bl ov80_0222A6B8
	adds r0, r5, #0
	bl ov80_02238498
	ldr r3, _0223441C @ =0x0223BE98
	movs r2, #0
_022343FE:
	ldrb r1, [r3]
	cmp r0, r1
	blt _02234410
	ldr r0, _02234420 @ =0x0223BE99
	lsls r1, r2, #1
	ldrb r0, [r0, r1]
	add sp, #0x10
	strb r0, [r5, #0x1c]
	pop {r4, r5, r6, pc}
_02234410:
	adds r2, r2, #1
	adds r3, r3, #2
	cmp r2, #3
	blo _022343FE
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
_0223441C: .4byte 0x0223BE98
_02234420: .4byte 0x0223BE99
	thumb_func_end ov80_02234390

	thumb_func_start ov80_02234424
ov80_02234424: @ 0x02234424
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18c
	adds r5, r0, #0
	bl ov80_022344D4
	movs r4, #0
	adds r6, r5, #0
	adds r7, r4, #0
_02234434:
	str r7, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #5
	lsrs r2, r2, #0x18
	adds r3, r7, #0
	bl FUN_02030F34
	adds r1, r6, #0
	adds r1, #0x78
	adds r4, r4, #1
	adds r6, r6, #2
	strh r0, [r1]
	cmp r4, #0xe
	blt _02234434
	movs r6, #0
	add r4, sp, #0x30
	adds r7, r5, #0
_02234458:
	movs r0, #0
	str r0, [sp]
	lsls r2, r6, #0x18
	ldr r0, [r5, #8]
	movs r1, #7
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030F34
	strh r0, [r4]
	ldrh r1, [r4]
	movs r0, #0xc5
	lsls r0, r0, #2
	strh r1, [r7, r0]
	adds r6, r6, #1
	adds r4, r4, #2
	adds r7, r7, #2
	cmp r6, #4
	blt _02234458
	add r0, sp, #0x18
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	add r1, sp, #0x30
	add r2, sp, #0x10
	movs r3, #0
	bl ov80_0222A52C
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r7, #0
	add r4, sp, #0x3c
_022344A6:
	adds r0, r5, #0
	bl ov80_02238370
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x74]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov80_022383A8
	adds r7, r7, #1
	adds r4, #0x38
	cmp r7, #4
	blt _022344A6
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0x18c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02234424

	thumb_func_start ov80_022344D4
ov80_022344D4: @ 0x022344D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x70]
	bl FUN_02074640
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r4, #0
	cmp r7, #0
	ble _0223451A
_022344EA:
	ldr r0, [r5, #0x70]
	adds r1, r4, #0
	bl FUN_02074644
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #4
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030F34
	add r1, sp, #4
	strh r0, [r1]
	adds r0, r6, #0
	movs r1, #6
	add r2, sp, #4
	bl FUN_0206EC40
	adds r4, r4, #1
	cmp r4, r7
	blt _022344EA
_0223451A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_022344D4

	thumb_func_start ov80_02234520
ov80_02234520: @ 0x02234520
	push {r4, lr}
	adds r4, r0, #0
	beq _0223454A
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _02234530
	bl FUN_0201AB0C
_02234530:
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0223453A
	bl FUN_0201AB0C
_0223453A:
	ldr r2, _0223454C @ =0x00000A88
	adds r0, r4, #0
	movs r1, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_0201AB0C
_0223454A:
	pop {r4, pc}
	.align 2, 0
_0223454C: .4byte 0x00000A88
	thumb_func_end ov80_02234520

	thumb_func_start ov80_02234550
ov80_02234550: @ 0x02234550
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02234570 @ =0x00000418
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0223455A:
	lsls r1, r4, #0x18
	adds r0, r6, #0
	lsrs r1, r1, #0x18
	bl ov80_02234574
	strh r0, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #6
	blt _0223455A
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02234570: .4byte 0x00000418
	thumb_func_end ov80_02234550

	thumb_func_start ov80_02234574
ov80_02234574: @ 0x02234574
	push {r3, lr}
	cmp r1, #6
	blo _02234582
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
_02234582:
	ldrh r0, [r0, #0x38]
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02234574

	thumb_func_start ov80_02234588
ov80_02234588: @ 0x02234588
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #4]
	adds r4, r1, #0
	bl FUN_02030FA0
	str r0, [sp, #4]
	ldrb r0, [r5, #0x10]
	movs r1, #1
	bl ov80_0223811C
	ldrb r1, [r5, #0x10]
	add r0, sp, #8
	strb r1, [r0, #8]
	movs r1, #0
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_02030EB4
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_02030EA0
	movs r2, #0
	ldrb r1, [r5, #0x11]
	add r0, sp, #8
	adds r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r1, #2
	bl FUN_02030EB4
	movs r2, #0
	ldrb r1, [r5, #0x1c]
	add r0, sp, #8
	adds r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r1, #3
	bl FUN_02030EB4
	movs r2, #0
	ldrb r1, [r5, #0x12]
	add r0, sp, #8
	adds r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r1, #1
	bl FUN_02030EB4
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C2C0
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C2C0
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #0x18]
	adds r0, r6, #0
	adds r1, r7, #0
	bl FUN_02031108
	cmp r4, #2
	beq _0223468E
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C2E8
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl FUN_0205C2E8
	bl FUN_0205C268
	adds r2, r0, #0
	ldrh r3, [r5, #0x18]
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_0203126C
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	add r0, sp, #8
	movs r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	ldr r0, [sp, #4]
	movs r1, #8
	bl FUN_02030FB0
	ldrb r0, [r5, #0x10]
	cmp r0, #3
	bne _0223468E
	ldr r0, [r5, #4]
	bl FUN_0203107C
	adds r4, r0, #0
	movs r0, #0x6e
	bl FUN_0205C268
	adds r3, r5, #0
	adds r3, #0x2f
	adds r2, r0, #0
	ldrb r3, [r3]
	adds r0, r4, #0
	movs r1, #0x6e
	bl FUN_02031108
_0223468E:
	movs r4, #0
	add r6, sp, #8
	add r7, sp, #8
_02234694:
	lsls r0, r4, #1
	adds r0, r5, r0
	adds r0, #0x78
	ldrh r0, [r0]
	lsls r2, r4, #0x18
	movs r1, #5
	strh r0, [r7]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030EB4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xe
	blo _02234694
	movs r4, #0
	add r6, sp, #0x10
	add r7, sp, #8
_022346BE:
	adds r0, r5, r4
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r4, #0x18
	movs r1, #6
	strb r0, [r7, #8]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030EB4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	blo _022346BE
	ldr r0, [r5, #0x70]
	bl FUN_02074640
	adds r6, r0, #0
	ldr r4, _02234760 @ =0x00000000
	beq _0223471C
	add r7, sp, #8
_022346EE:
	ldr r0, [r5, #0x70]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #8
	strh r0, [r1]
	str r7, [sp]
	lsls r2, r4, #0x18
	ldr r0, [r5, #8]
	movs r1, #4
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030EB4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blo _022346EE
_0223471C:
	ldr r0, [r5, #0x74]
	bl FUN_02074640
	adds r6, r0, #0
	ldr r4, _02234760 @ =0x00000000
	beq _0223475A
	add r7, sp, #8
_0223472A:
	ldr r0, [r5, #0x74]
	adds r1, r4, #0
	bl FUN_02074644
	lsls r0, r4, #1
	adds r1, r5, r0
	movs r0, #0xc5
	lsls r0, r0, #2
	ldrh r1, [r1, r0]
	add r0, sp, #8
	lsls r2, r4, #0x18
	strh r1, [r0]
	str r7, [sp]
	ldr r0, [r5, #8]
	movs r1, #7
	lsrs r2, r2, #0x18
	movs r3, #0
	bl FUN_02030EB4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r6
	blo _0223472A
_0223475A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02234760: .4byte 0x00000000
	thumb_func_end ov80_02234588

	thumb_func_start ov80_02234764
ov80_02234764: @ 0x02234764
	ldrb r1, [r0, #0x11]
	adds r1, r1, #1
	strb r1, [r0, #0x11]
	ldrb r0, [r0, #0x11]
	bx lr
	.align 2, 0
	thumb_func_end ov80_02234764

	thumb_func_start ov80_02234770
ov80_02234770: @ 0x02234770
	ldrb r0, [r0, #0x11]
	bx lr
	thumb_func_end ov80_02234770

	thumb_func_start ov80_02234774
ov80_02234774: @ 0x02234774
	push {r4, lr}
	sub sp, #0x30
	adds r4, r0, #0
	bl ov80_022347A8
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x17
	adds r1, r4, r1
	adds r1, #0x78
	ldrh r1, [r1]
	add r0, sp, #0
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_02234774

	thumb_func_start ov80_022347A8
ov80_022347A8: @ 0x022347A8
	ldrb r2, [r0, #0x11]
	movs r0, #7
	muls r0, r1, r0
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
	thumb_func_end ov80_022347A8

	thumb_func_start ov80_022347B8
ov80_022347B8: @ 0x022347B8
	ldr r3, _022347C0 @ =ov80_02234588
	movs r1, #1
	bx r3
	nop
_022347C0: .4byte ov80_02234588
	thumb_func_end ov80_022347B8

	thumb_func_start ov80_022347C4
ov80_022347C4: @ 0x022347C4
	adds r1, r0, #0
	movs r2, #1
	adds r1, #0x2f
	strb r2, [r1]
	ldrh r1, [r0, #0x1a]
	cmp r1, #8
	bhs _022347D6
	adds r1, r1, #1
	strh r1, [r0, #0x1a]
_022347D6:
	ldr r3, _022347E0 @ =ov80_02234588
	movs r1, #0
	strb r1, [r0, #0x11]
	bx r3
	nop
_022347E0: .4byte ov80_02234588
	thumb_func_end ov80_022347C4

	thumb_func_start ov80_022347E4
ov80_022347E4: @ 0x022347E4
	ldr r3, _022347E8 @ =ov80_022383C0
	bx r3
	.align 2, 0
_022347E8: .4byte ov80_022383C0
	thumb_func_end ov80_022347E4

	thumb_func_start ov80_022347EC
ov80_022347EC: @ 0x022347EC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	ldrb r4, [r5, #0x11]
	bl ov80_0223811C
	adds r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02238374
	movs r3, #0x33
	lsls r3, r3, #4
	adds r1, r5, r3
	str r1, [sp]
	adds r1, r3, #0
	subs r1, #0x14
	adds r1, r5, r1
	str r1, [sp, #4]
	adds r1, r3, #0
	subs r1, #0x10
	adds r1, r5, r1
	adds r2, r4, #7
	str r1, [sp, #8]
	lsls r0, r0, #0x18
	lsls r1, r4, #1
	lsls r2, r2, #1
	lsrs r0, r0, #0x18
	adds r1, r5, r1
	adds r2, r5, r2
	str r0, [sp, #0xc]
	adds r1, #0x78
	adds r2, #0x78
	subs r3, #0x1c
	ldrh r1, [r1]
	ldrh r2, [r2]
	adds r0, r6, #0
	adds r3, r5, r3
	bl ov80_0222A6B8
	adds r0, r5, #0
	bl ov80_022383C0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022347EC

	thumb_func_start ov80_02234848
ov80_02234848: @ 0x02234848
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrb r0, [r6, #0x10]
	movs r4, #0
	adds r7, r1, #0
	str r2, [sp]
	adds r1, r4, #0
	adds r5, r3, #0
	bl ov80_022380E8
	adds r3, r0, #0
	ldr r2, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov80_02234894
	ldr r2, _0223488C @ =0x0223BE9E
	adds r4, r4, r0
	movs r1, #0
_0223486E:
	ldrb r0, [r2]
	cmp r5, r0
	bge _0223487E
	ldr r0, _02234890 @ =0x0223BE9F
	lsls r1, r1, #1
	ldrb r0, [r0, r1]
	adds r4, r4, r0
	b _02234886
_0223487E:
	adds r1, r1, #1
	adds r2, r2, #2
	cmp r1, #5
	blt _0223486E
_02234886:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223488C: .4byte 0x0223BE9E
_02234890: .4byte 0x0223BE9F
	thumb_func_end ov80_02234848

	thumb_func_start ov80_02234894
ov80_02234894: @ 0x02234894
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r3, [sp, #0xc]
	str r0, [sp]
	movs r4, #0
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	str r2, [sp, #8]
	adds r5, r4, #0
	adds r6, r4, #0
	cmp r0, #0
	ble _022348F2
_022348AC:
	ldr r0, [sp, #4]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #0xac
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _022348EA
	adds r0, r7, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _022348D6
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_022348D6:
	adds r0, r7, #0
	movs r1, #0xa0
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _022348EA
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_022348EA:
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	cmp r6, r0
	blt _022348AC
_022348F2:
	ldr r0, [sp]
	ldrb r0, [r0, #0x10]
	bl ov80_02238374
	cmp r0, #1
	bne _0223494C
	ldr r0, [sp, #0xc]
	movs r6, #0
	cmp r0, #0
	ble _0223494C
_02234906:
	ldr r0, [sp, #8]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #0xac
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _02234944
	adds r0, r7, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02234930
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_02234930:
	adds r0, r7, #0
	movs r1, #0xa0
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _02234944
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_02234944:
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	cmp r6, r0
	blt _02234906
_0223494C:
	ldr r0, _02234960 @ =0x0223BE90
	ldrb r1, [r0, r5]
	movs r0, #0
	adds r1, r0, r1
	ldr r0, _02234964 @ =0x0223BE88
	ldrb r0, [r0, r4]
	adds r0, r1, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02234960: .4byte 0x0223BE90
_02234964: .4byte 0x0223BE88
	thumb_func_end ov80_02234894

	thumb_func_start ov80_02234968
ov80_02234968: @ 0x02234968
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldrb r0, [r5, #0x13]
	adds r4, r1, #0
	cmp r0, #0x20
	beq _02234A1E
	movs r0, #0xb7
	movs r1, #0x65
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0x65
	str r1, [sp, #0xc]
	ldrb r2, [r5, #0x13]
	movs r1, #6
	adds r6, r0, #0
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _02234A2C @ =0x0223BF5A
	ldr r2, [r4]
	ldrh r1, [r1, r3]
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldrb r2, [r5, #0x13]
	movs r1, #6
	adds r0, r6, #0
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _02234A30 @ =0x0223BF5C
	ldr r2, [r4]
	ldrh r1, [r1, r3]
	movs r3, #2
	bl FUN_02007B68
	ldrb r2, [r5, #0x13]
	movs r1, #6
	adds r0, r6, #0
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _02234A34 @ =0x0223BF5E
	add r2, sp, #0x10
	ldrh r1, [r1, r3]
	movs r3, #0x65
	bl FUN_02007C48
	ldr r1, [sp, #0x10]
	adds r5, r0, #0
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	blx FUN_020D2894
	blx FUN_020D0524
	ldr r0, [sp, #0x10]
	movs r1, #1
	lsls r1, r1, #0xe
	ldr r0, [r0, #0xc]
	lsrs r2, r1, #1
	blx FUN_020D05C4
	blx FUN_020D0634
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201EFBC
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_02234A1E:
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02234A2C: .4byte 0x0223BF5A
_02234A30: .4byte 0x0223BF5C
_02234A34: .4byte 0x0223BF5E
	thumb_func_end ov80_02234968

	thumb_func_start ov80_02234A38
ov80_02234A38: @ 0x02234A38
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	movs r0, #0xb7
	movs r1, #0x65
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0x65
	str r1, [sp, #0xc]
	ldr r2, [r5]
	movs r1, #0x39
	movs r3, #3
	adds r4, r0, #0
	bl FUN_02007B68
	ldr r0, [r5]
	movs r1, #3
	bl FUN_0201EFBC
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02234A38

	thumb_func_start ov80_02234A74
ov80_02234A74: @ 0x02234A74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r1, [sp, #8]
	movs r1, #1
	adds r4, r2, #0
	bl ov80_022380E8
	adds r7, r0, #0
	ldr r0, [sp, #4]
	movs r1, #1
	ldrb r0, [r0, #0x10]
	bl ov80_0223811C
	str r0, [sp, #0xc]
	cmp r4, #0
	bne _02234AD8
	movs r4, #0
	cmp r7, #0
	ble _02234B18
	ldr r5, _02234B1C @ =0x0223BEB8
	ldr r6, [sp, #4]
_02234AA2:
	ldr r0, [sp, #4]
	adds r1, r4, #0
	ldr r0, [r0, #0x70]
	bl FUN_02074644
	adds r1, r0, #0
	movs r0, #2
	ldrsh r0, [r5, r0]
	movs r3, #0
	adds r2, r4, #0
	str r0, [sp]
	ldrsh r3, [r5, r3]
	ldr r0, [sp, #8]
	bl ov80_0222F29C
	str r0, [r6, #0x30]
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0202484C
	adds r4, r4, #1
	adds r5, r5, #4
	adds r6, r6, #4
	cmp r4, r7
	blt _02234AA2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02234AD8:
	movs r6, #0
	cmp r0, #0
	ble _02234B18
	ldr r4, _02234B20 @ =0x0223BEC8
	ldr r5, [sp, #4]
_02234AE2:
	ldr r0, [sp, #4]
	adds r1, r6, #0
	ldr r0, [r0, #0x74]
	bl FUN_02074644
	adds r1, r0, #0
	movs r0, #2
	ldrsh r0, [r4, r0]
	movs r3, #0
	adds r2, r7, #0
	str r0, [sp]
	ldrsh r3, [r4, r3]
	ldr r0, [sp, #8]
	bl ov80_0222F29C
	str r0, [r5, #0x40]
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0202484C
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _02234AE2
_02234B18:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02234B1C: .4byte 0x0223BEB8
_02234B20: .4byte 0x0223BEC8
	thumb_func_end ov80_02234A74

	thumb_func_start ov80_02234B24
ov80_02234B24: @ 0x02234B24
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	adds r7, r1, #0
	movs r1, #1
	adds r6, r2, #0
	bl ov80_022380E8
	adds r4, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	bl ov80_0223811C
	str r0, [sp]
	cmp r6, #0
	bne _02234B5E
	movs r6, #0
	cmp r4, #0
	ble _02234B7A
_02234B4A:
	ldr r1, [r5, #0x30]
	adds r0, r7, #0
	adds r2, r6, #0
	bl ov80_0222F324
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r4
	blt _02234B4A
	pop {r3, r4, r5, r6, r7, pc}
_02234B5E:
	movs r6, #0
	cmp r0, #0
	ble _02234B7A
_02234B64:
	ldr r1, [r5, #0x40]
	adds r0, r7, #0
	adds r2, r4, #0
	bl ov80_0222F324
	ldr r0, [sp]
	adds r6, r6, #1
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _02234B64
_02234B7A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02234B24

	thumb_func_start ov80_02234B7C
ov80_02234B7C: @ 0x02234B7C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	adds r6, r2, #0
	adds r4, r3, #0
	bl ov80_022380E8
	cmp r4, r0
	bge _02234BB2
	cmp r6, #1
	bne _02234BA4
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x30]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_02024830
	pop {r4, r5, r6, pc}
_02234BA4:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x30]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
_02234BB2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02234B7C

	thumb_func_start ov80_02234BB4
ov80_02234BB4: @ 0x02234BB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	adds r6, r2, #0
	adds r4, r3, #0
	bl ov80_0223811C
	cmp r4, r0
	bge _02234BEA
	cmp r6, #1
	bne _02234BDC
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x40]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_02024830
	pop {r4, r5, r6, pc}
_02234BDC:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x40]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
_02234BEA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02234BB4

	thumb_func_start ov80_02234BEC
ov80_02234BEC: @ 0x02234BEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldrb r0, [r7, #0x10]
	str r1, [sp]
	movs r1, #1
	adds r4, r2, #0
	bl ov80_022380E8
	str r0, [sp, #8]
	ldrb r0, [r7, #0x10]
	movs r1, #1
	bl ov80_0223811C
	str r0, [sp, #4]
	cmp r4, #0
	bne _02234C5C
	ldr r0, [sp, #8]
	movs r6, #0
	cmp r0, #0
	ble _02234CA4
	ldr r4, _02234CA8 @ =0x0223BEB8
	adds r5, r7, #0
_02234C1A:
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [sp]
	adds r1, #8
	adds r2, r2, #4
	bl ov80_0222F3FC
	str r0, [r5, #0x50]
	ldr r0, [r7, #0x70]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02234C4C
	ldr r0, [r5, #0x50]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
_02234C4C:
	ldr r0, [sp, #8]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, r0
	blt _02234C1A
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02234C5C:
	movs r6, #0
	cmp r0, #0
	ble _02234CA4
	ldr r4, _02234CAC @ =0x0223BEC8
	adds r5, r7, #0
_02234C66:
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [sp]
	adds r1, #8
	adds r2, r2, #4
	bl ov80_0222F3FC
	str r0, [r5, #0x60]
	ldr r0, [r7, #0x74]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02234C98
	ldr r0, [r5, #0x60]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
_02234C98:
	ldr r0, [sp, #4]
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r6, r0
	blt _02234C66
_02234CA4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02234CA8: .4byte 0x0223BEB8
_02234CAC: .4byte 0x0223BEC8
	thumb_func_end ov80_02234BEC

	thumb_func_start ov80_02234CB0
ov80_02234CB0: @ 0x02234CB0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	adds r4, r1, #0
	movs r1, #1
	adds r6, r2, #0
	bl ov80_022380E8
	str r0, [sp]
	ldrb r0, [r5, #0x10]
	movs r1, #1
	bl ov80_0223811C
	adds r7, r0, #0
	cmp r6, #0
	bne _02234CEC
	ldr r0, [sp]
	movs r6, #0
	cmp r0, #0
	ble _02234D02
_02234CD8:
	ldr r1, [r5, #0x50]
	adds r0, r4, #0
	bl ov80_0222F440
	ldr r0, [sp]
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r0
	blt _02234CD8
	pop {r3, r4, r5, r6, r7, pc}
_02234CEC:
	movs r6, #0
	cmp r7, #0
	ble _02234D02
_02234CF2:
	ldr r1, [r5, #0x60]
	adds r0, r4, #0
	bl ov80_0222F440
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, r7
	blt _02234CF2
_02234D02:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02234CB0

	thumb_func_start ov80_02234D04
ov80_02234D04: @ 0x02234D04
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	adds r6, r2, #0
	adds r4, r3, #0
	bl ov80_022380E8
	adds r7, r0, #0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	bl ov80_0223811C
	cmp r6, #0
	bne _02234D72
	cmp r4, r7
	bge _02234DC0
	ldr r0, [r5, #0x70]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bne _02234D62
	cmp r0, #0
	bne _02234D52
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x50]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
_02234D52:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x50]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
_02234D62:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x50]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
_02234D72:
	cmp r4, r0
	bge _02234DC0
	ldr r0, [r5, #0x74]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bne _02234DB2
	cmp r0, #0
	bne _02234DA2
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x60]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
_02234DA2:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x60]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_02024830
	pop {r3, r4, r5, r6, r7, pc}
_02234DB2:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x60]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_02024830
_02234DC0:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02234D04

	thumb_func_start ov80_02234DC4
ov80_02234DC4: @ 0x02234DC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	cmp r1, #0
	bne _02234DD6
	movs r5, #0x1e
	movs r6, #0xa2
	lsls r5, r5, #4
	b _02234DDC
_02234DD6:
	movs r6, #0xa1
	adds r5, r6, #0
	adds r5, #0x7f
_02234DDC:
	movs r1, #2
	movs r0, #0x65
	lsls r1, r1, #0xc
	bl FUN_0201AA8C
	movs r2, #2
	movs r1, #0
	lsls r2, r2, #0xc
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r0, #0xb7
	movs r1, #0x65
	bl FUN_02007688
	adds r1, r6, #0
	add r2, sp, #8
	movs r3, #0x65
	str r0, [sp, #4]
	bl FUN_02007C48
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #8]
	movs r2, #1
	ldr r0, [r0, #0xc]
	adds r1, r4, #0
	lsls r2, r2, #0xc
	adds r3, r7, #0
	bl FUN_02003DE8
	movs r1, #2
	adds r0, r4, #0
	lsls r1, r1, #0xc
	blx FUN_020D2894
	blx FUN_020D0524
	movs r1, #6
	adds r0, r4, #0
	lsls r1, r1, #0xc
	adds r2, r5, #0
	blx FUN_020D05C4
	blx FUN_020D0634
	ldr r0, [sp, #4]
	bl FUN_0200770C
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02234DC4

	thumb_func_start ov80_02234E50
ov80_02234E50: @ 0x02234E50
	push {r3, lr}
	cmp r1, #5
	bhi _02234E94
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02234E62: @ jump table
	.2byte _02234E6E - _02234E62 - 2 @ case 0
	.2byte _02234E74 - _02234E62 - 2 @ case 1
	.2byte _02234E7A - _02234E62 - 2 @ case 2
	.2byte _02234E80 - _02234E62 - 2 @ case 3
	.2byte _02234E88 - _02234E62 - 2 @ case 4
	.2byte _02234E90 - _02234E62 - 2 @ case 5
_02234E6E:
	bl ov80_0222BA7C
	pop {r3, pc}
_02234E74:
	bl ov80_0222BAE0
	pop {r3, pc}
_02234E7A:
	bl ov80_0222BB54
	pop {r3, pc}
_02234E80:
	adds r1, r2, #0
	bl ov80_0222BC48
	pop {r3, pc}
_02234E88:
	adds r1, r2, #0
	bl ov80_0222BC94
	pop {r3, pc}
_02234E90:
	bl ov80_0222BCE0
_02234E94:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02234E50

	thumb_func_start ov80_02234E98
ov80_02234E98: @ 0x02234E98
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r6, #9
	bhs _02234EAE
	ldrb r0, [r5, #0x10]
	movs r1, #1
	ldr r4, [r5, #0x74]
	bl ov80_0223811C
	b _02234EB8
_02234EAE:
	ldrb r0, [r5, #0x10]
	movs r1, #1
	ldr r4, [r5, #0x70]
	bl ov80_022380E8
_02234EB8:
	ldr r3, _02234EC8 @ =0x0223DCB8
	adds r1, r4, #0
	lsls r4, r6, #2
	adds r2, r0, #0
	ldr r3, [r3, r4]
	adds r0, r5, #0
	blx r3
	pop {r4, r5, r6, pc}
	.align 2, 0
_02234EC8: .4byte 0x0223DCB8
	thumb_func_end ov80_02234E98

	thumb_func_start ov80_02234ECC
ov80_02234ECC: @ 0x02234ECC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r2, #0
	movs r5, #0
	str r1, [sp]
	cmp r7, #0
	ble _02234F1C
_02234EDA:
	ldr r0, [sp]
	adds r1, r5, #0
	bl FUN_02074644
	movs r1, #0xa4
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	adds r4, r0, #0
	blx FUN_020F0C18
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _02234F20 @ =0x33333333
	ldr r1, _02234F24 @ =0x3FF33333
	blx FUN_020F0C54
	blx FUN_020F0AF4
	str r0, [sp, #4]
	subs r0, r0, r4
	str r0, [sp, #4]
	subs r0, r4, r0
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa3
	add r2, sp, #4
	bl FUN_0206EC40
	adds r5, r5, #1
	cmp r5, r7
	blt _02234EDA
_02234F1C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02234F20: .4byte 0x33333333
_02234F24: .4byte 0x3FF33333
	thumb_func_end ov80_02234ECC

	thumb_func_start ov80_02234F28
ov80_02234F28: @ 0x02234F28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r2, [sp, #8]
	str r0, [sp]
	movs r5, #0
	ldr r0, [sp, #8]
	str r1, [sp, #4]
	str r5, [sp, #0xc]
	cmp r0, #0
	ble _02234F98
_02234F3C:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl FUN_02074644
	adds r4, r0, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	bl FUN_0206E540
	cmp r6, #3
	beq _02234F7A
	cmp r7, #3
	beq _02234F7A
	cmp r6, #8
	beq _02234F7A
	cmp r7, #8
	beq _02234F7A
	cmp r0, #0x11
	bne _02234F82
_02234F7A:
	ldr r0, [sp, #0xc]
	adds r0, r0, #1
	str r0, [sp, #0xc]
	b _02234F90
_02234F82:
	movs r0, #8
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #0xa0
	add r2, sp, #0x10
	bl FUN_0206EC40
_02234F90:
	ldr r0, [sp, #8]
	adds r5, r5, #1
	cmp r5, r0
	blt _02234F3C
_02234F98:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _02234FA6
	ldr r0, [sp]
	movs r1, #1
	strb r1, [r0, #0x1f]
_02234FA6:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02234F28

	thumb_func_start ov80_02234FAC
ov80_02234FAC: @ 0x02234FAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r2, [sp, #8]
	str r0, [sp]
	movs r6, #0
	ldr r0, [sp, #8]
	adds r5, r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	ble _02235012
_02234FC0:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl FUN_02074644
	adds r4, r0, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	bl FUN_0206E540
	cmp r7, #4
	beq _02234FF8
	ldr r1, [sp, #0xc]
	cmp r1, #4
	beq _02234FF8
	cmp r0, #7
	bne _02234FFC
_02234FF8:
	adds r6, r6, #1
	b _0223500A
_02234FFC:
	movs r0, #0x40
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #0xa0
	add r2, sp, #0x10
	bl FUN_0206EC40
_0223500A:
	ldr r0, [sp, #8]
	adds r5, r5, #1
	cmp r5, r0
	blt _02234FC0
_02235012:
	ldr r0, [sp, #8]
	cmp r6, r0
	blt _0223501E
	ldr r0, [sp]
	movs r1, #1
	strb r1, [r0, #0x1f]
_0223501E:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02234FAC

	thumb_func_start ov80_02235024
ov80_02235024: @ 0x02235024
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r2, [sp, #8]
	str r0, [sp]
	movs r6, #0
	ldr r0, [sp, #8]
	adds r5, r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	ble _0223508A
_02235038:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl FUN_02074644
	adds r4, r0, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	bl FUN_0206E540
	cmp r7, #0xa
	beq _02235070
	ldr r1, [sp, #0xc]
	cmp r1, #0xa
	beq _02235070
	cmp r0, #0x29
	bne _02235074
_02235070:
	adds r6, r6, #1
	b _02235082
_02235074:
	movs r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #0xa0
	add r2, sp, #0x10
	bl FUN_0206EC40
_02235082:
	ldr r0, [sp, #8]
	adds r5, r5, #1
	cmp r5, r0
	blt _02235038
_0223508A:
	ldr r0, [sp, #8]
	cmp r6, r0
	blt _02235096
	ldr r0, [sp]
	movs r1, #1
	strb r1, [r0, #0x1f]
_02235096:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02235024

	thumb_func_start ov80_0223509C
ov80_0223509C: @ 0x0223509C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldrh r0, [r0, #0x20]
	adds r5, r2, #0
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r6, #0
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	adds r7, r6, #0
	cmp r5, #0
	ble _0223510A
_022350BA:
	ldr r0, [sp, #4]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0xa
	movs r2, #0
	str r0, [sp, #8]
	bl FUN_0206E540
	cmp r0, #0xf
	beq _022350D4
	cmp r0, #0x48
	bne _022350E4
_022350D4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r6, #1
	cmp r4, r5
	blo _02235104
	movs r4, #0
	b _02235104
_022350E4:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1e
	subs r1, r1, r2
	movs r0, #0x1e
	rors r1, r0
	adds r0, r2, r1
	adds r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	movs r1, #0xa0
	add r2, sp, #0xc
	bl FUN_0206EC40
	b _0223510A
_02235104:
	adds r7, r7, #1
	cmp r7, r5
	blt _022350BA
_0223510A:
	cmp r6, r5
	blt _02235114
	ldr r0, [sp]
	movs r1, #1
	strb r1, [r0, #0x1f]
_02235114:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223509C

	thumb_func_start ov80_02235118
ov80_02235118: @ 0x02235118
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	ldrh r0, [r0, #0x20]
	adds r6, r2, #0
	str r1, [sp, #4]
	adds r1, r6, #0
	movs r7, #0
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r5, r0, #0x18
	adds r0, r7, #0
	str r0, [sp, #8]
	cmp r6, #0
	ble _0223519C
_02235138:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl FUN_02074644
	adds r4, r0, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E540
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	bl FUN_0206E540
	ldr r1, [sp, #0xc]
	cmp r1, #0xf
	beq _02235172
	ldr r1, [sp, #0x10]
	cmp r1, #0xf
	beq _02235172
	cmp r0, #0x28
	bne _02235182
_02235172:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r7, r7, #1
	cmp r5, r6
	blo _02235192
	movs r5, #0
	b _02235192
_02235182:
	movs r0, #0x20
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #0xa0
	add r2, sp, #0x14
	bl FUN_0206EC40
	b _0223519C
_02235192:
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r6
	blt _02235138
_0223519C:
	cmp r7, r6
	blt _022351A6
	ldr r0, [sp]
	movs r1, #1
	strb r1, [r0, #0x1f]
_022351A6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02235118

	thumb_func_start ov80_022351AC
ov80_022351AC: @ 0x022351AC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	bl ov80_02238498
	cmp r0, #3
	bhs _022351C4
	ldr r0, _02235204 @ =0x0223DCA0
	movs r1, #8
	ldr r4, [r0]
	b _022351D6
_022351C4:
	cmp r0, #6
	bhs _022351D0
	ldr r0, _02235204 @ =0x0223DCA0
	movs r1, #0x14
	ldr r4, [r0, #4]
	b _022351D6
_022351D0:
	ldr r0, _02235204 @ =0x0223DCA0
	movs r1, #0xa
	ldr r4, [r0, #8]
_022351D6:
	ldrh r0, [r7, #0x20]
	blx FUN_020F2998
	lsls r0, r1, #1
	ldrh r1, [r4, r0]
	add r0, sp, #0
	movs r4, #0
	strh r1, [r0]
	cmp r5, #0
	ble _02235202
	movs r7, #6
_022351EC:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_02074644
	adds r1, r7, #0
	add r2, sp, #0
	bl FUN_0206EC40
	adds r4, r4, #1
	cmp r4, r5
	blt _022351EC
_02235202:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02235204: .4byte 0x0223DCA0
	thumb_func_end ov80_022351AC

	thumb_func_start ov80_02235208
ov80_02235208: @ 0x02235208
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	bl ov80_02238498
	cmp r0, #3
	bhs _02235220
	ldr r0, _02235260 @ =0x0223DCA0
	movs r1, #0xb
	ldr r4, [r0, #0xc]
	b _02235232
_02235220:
	cmp r0, #6
	bhs _0223522C
	ldr r0, _02235260 @ =0x0223DCA0
	movs r1, #0xd
	ldr r4, [r0, #0x10]
	b _02235232
_0223522C:
	ldr r0, _02235260 @ =0x0223DCA0
	movs r1, #0xb
	ldr r4, [r0, #0x14]
_02235232:
	ldrh r0, [r7, #0x20]
	blx FUN_020F2998
	lsls r0, r1, #1
	ldrh r1, [r4, r0]
	add r0, sp, #0
	movs r4, #0
	strh r1, [r0]
	cmp r5, #0
	ble _0223525E
	movs r7, #6
_02235248:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_02074644
	adds r1, r7, #0
	add r2, sp, #0
	bl FUN_0206EC40
	adds r4, r4, #1
	cmp r4, r5
	blt _02235248
_0223525E:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02235260: .4byte 0x0223DCA0
	thumb_func_end ov80_02235208

	thumb_func_start ov80_02235264
ov80_02235264: @ 0x02235264
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r2, #0
	movs r4, #0
	str r1, [sp]
	cmp r7, #0
	ble _022352B8
_02235272:
	ldr r0, [sp]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	adds r5, r0, #0
	bl FUN_0206E540
	adds r6, r0, #3
	cmp r6, #0x64
	bls _02235290
	bl GF_AssertFail
	movs r6, #0x64
_02235290:
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	adds r1, r6, #0
	bl FUN_0206FD00
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #8
	add r2, sp, #4
	bl FUN_0206EC40
	adds r0, r5, #0
	bl FUN_0206E250
	adds r4, r4, #1
	cmp r4, r7
	blt _02235272
_022352B8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235264

	thumb_func_start ov80_022352BC
ov80_022352BC: @ 0x022352BC
	ldr r1, _022352C4 @ =0x000003E9
	str r1, [r0, #0x14]
	bx lr
	nop
_022352C4: .4byte 0x000003E9
	thumb_func_end ov80_022352BC

	thumb_func_start ov80_022352C8
ov80_022352C8: @ 0x022352C8
	movs r1, #1
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov80_022352C8

	thumb_func_start ov80_022352D0
ov80_022352D0: @ 0x022352D0
	movs r1, #7
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov80_022352D0

	thumb_func_start ov80_022352D8
ov80_022352D8: @ 0x022352D8
	movs r1, #4
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov80_022352D8

	thumb_func_start ov80_022352E0
ov80_022352E0: @ 0x022352E0
	movs r1, #9
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov80_022352E0

	thumb_func_start ov80_022352E8
ov80_022352E8: @ 0x022352E8
	ldr r1, _022352F0 @ =0x000003EA
	str r1, [r0, #0x14]
	bx lr
	nop
_022352F0: .4byte 0x000003EA
	thumb_func_end ov80_022352E8

	thumb_func_start ov80_022352F4
ov80_022352F4: @ 0x022352F4
	ldrb r1, [r0, #0x1c]
	cmp r1, #7
	bhs _022352FE
	adds r1, r1, #1
	strb r1, [r0, #0x1c]
_022352FE:
	bx lr
	thumb_func_end ov80_022352F4

	thumb_func_start ov80_02235300
ov80_02235300: @ 0x02235300
	ldrb r1, [r0, #0x1c]
	cmp r1, #0
	beq _0223530A
	subs r1, r1, #1
	strb r1, [r0, #0x1c]
_0223530A:
	bx lr
	thumb_func_end ov80_02235300

	thumb_func_start ov80_0223530C
ov80_0223530C: @ 0x0223530C
	movs r1, #1
	strb r1, [r0, #0x12]
	bx lr
	.align 2, 0
	thumb_func_end ov80_0223530C

	thumb_func_start ov80_02235314
ov80_02235314: @ 0x02235314
	bx lr
	.align 2, 0
	thumb_func_end ov80_02235314

	thumb_func_start ov80_02235318
ov80_02235318: @ 0x02235318
	bx lr
	.align 2, 0
	thumb_func_end ov80_02235318

	thumb_func_start ov80_0223531C
ov80_0223531C: @ 0x0223531C
	bx lr
	.align 2, 0
	thumb_func_end ov80_0223531C

	thumb_func_start ov80_02235320
ov80_02235320: @ 0x02235320
	bx lr
	.align 2, 0
	thumb_func_end ov80_02235320

	thumb_func_start ov80_02235324
ov80_02235324: @ 0x02235324
	ldrb r3, [r0, #0x10]
	ldrh r2, [r0, #0x1a]
	cmp r3, #1
	bhi _0223533A
	cmp r2, #8
	blo _02235334
	movs r1, #6
	b _02235346
_02235334:
	ldr r1, _0223535C @ =0x0223C01C
	ldrb r1, [r1, r2]
	b _02235346
_0223533A:
	cmp r2, #8
	blo _02235342
	movs r1, #0x11
	b _02235346
_02235342:
	ldr r1, _02235360 @ =0x0223C028
	ldrb r1, [r1, r2]
_02235346:
	cmp r3, #0
	bne _02235356
	ldrh r0, [r0, #0x18]
	cmp r0, #0x15
	beq _02235354
	cmp r0, #0x31
	bne _02235356
_02235354:
	movs r1, #0x14
_02235356:
	adds r0, r1, #0
	bx lr
	nop
_0223535C: .4byte 0x0223C01C
_02235360: .4byte 0x0223C028
	thumb_func_end ov80_02235324

	thumb_func_start ov80_02235364
ov80_02235364: @ 0x02235364
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r1, r2, #0
	adds r4, r3, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	add r1, sp, #0
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	add r2, sp, #0
	bl FUN_0206EC40
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02235364

	thumb_func_start ov80_02235390
ov80_02235390: @ 0x02235390
	push {r3, lr}
	bl ov80_0222BE10
	bl FUN_0200604C
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02235390

	thumb_func_start ov80_022353A0
ov80_022353A0: @ 0x022353A0
	push {r3, lr}
	bl ov80_0222BE10
	movs r1, #0
	bl FUN_02006154
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_022353A0

	thumb_func_start ov80_022353B0
ov80_022353B0: @ 0x022353B0
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222BE10
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _022353CC @ =ov80_022353D0
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_022353CC: .4byte ov80_022353D0
	thumb_func_end ov80_022353B0

	thumb_func_start ov80_022353D0
ov80_022353D0: @ 0x022353D0
	push {r3, lr}
	adds r0, #0x78
	ldrh r0, [r0]
	bl FUN_02006184
	cmp r0, #0
	bne _022353E2
	movs r0, #1
	pop {r3, pc}
_022353E2:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_022353D0

	thumb_func_start ov80_022353E8
ov80_022353E8: @ 0x022353E8
	push {r3, lr}
	bl ov80_0222AC58
	bl FUN_02006B24
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_022353E8

	thumb_func_start ov80_022353F8
ov80_022353F8: @ 0x022353F8
	push {r3, lr}
	ldr r1, _02235404 @ =ov80_02235408
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_02235404: .4byte ov80_02235408
	thumb_func_end ov80_022353F8

	thumb_func_start ov80_02235408
ov80_02235408: @ 0x02235408
	push {r3, lr}
	bl FUN_02006BCC
	cmp r0, #0
	bne _02235416
	movs r0, #1
	pop {r3, pc}
_02235416:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02235408

	thumb_func_start ov80_0223541C
ov80_0223541C: @ 0x0223541C
	push {r4, lr}
	bl ov80_0222AC58
	adds r4, r0, #0
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02004AC8
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02005D48
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0223541C

	thumb_func_start ov80_02235438
ov80_02235438: @ 0x02235438
	push {r3, lr}
	bl ov80_0222AC58
	bl FUN_02004A90
	movs r1, #0
	bl FUN_02005EB4
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov80_02235438

	thumb_func_start ov80_0223544C
ov80_0223544C: @ 0x0223544C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_02096808
	adds r5, r0, #0
	adds r0, r7, #0
	bl ov80_0222AC58
	adds r6, r0, #0
	adds r0, r7, #0
	bl ov80_0222BE10
	str r0, [sp]
	adds r0, r7, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_02096810
	cmp r6, #0x3b
	bgt _022354CC
	adds r1, r6, #0
	subs r1, #0x21
	bmi _022354C6
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02235490: @ jump table
	.2byte _022354FC - _02235490 - 2 @ case 0
	.2byte _02235504 - _02235490 - 2 @ case 1
	.2byte _0223550C - _02235490 - 2 @ case 2
	.2byte _02235514 - _02235490 - 2 @ case 3
	.2byte _0223553E - _02235490 - 2 @ case 4
	.2byte _02235546 - _02235490 - 2 @ case 5
	.2byte _0223554E - _02235490 - 2 @ case 6
	.2byte _02235524 - _02235490 - 2 @ case 7
	.2byte _0223552C - _02235490 - 2 @ case 8
	.2byte _0223557A - _02235490 - 2 @ case 9
	.2byte _0223551C - _02235490 - 2 @ case 10
	.2byte _02235536 - _02235490 - 2 @ case 11
	.2byte _0223557A - _02235490 - 2 @ case 12
	.2byte _022354D8 - _02235490 - 2 @ case 13
	.2byte _0223557A - _02235490 - 2 @ case 14
	.2byte _0223557A - _02235490 - 2 @ case 15
	.2byte _0223557A - _02235490 - 2 @ case 16
	.2byte _0223557A - _02235490 - 2 @ case 17
	.2byte _0223557A - _02235490 - 2 @ case 18
	.2byte _0223557A - _02235490 - 2 @ case 19
	.2byte _0223557A - _02235490 - 2 @ case 20
	.2byte _0223557A - _02235490 - 2 @ case 21
	.2byte _022354EE - _02235490 - 2 @ case 22
	.2byte _0223557A - _02235490 - 2 @ case 23
	.2byte _0223557A - _02235490 - 2 @ case 24
	.2byte _02235554 - _02235490 - 2 @ case 25
	.2byte _02235562 - _02235490 - 2 @ case 26
_022354C6:
	cmp r6, #2
	beq _022354D2
	b _0223557A
_022354CC:
	cmp r6, #0x64
	beq _0223556A
	b _0223557A
_022354D2:
	bl FUN_0204A68C
	b _0223557E
_022354D8:
	bl FUN_0204B068
	strh r0, [r4]
	ldr r0, [r5, #8]
	bl FUN_0202CF54
	ldrh r2, [r4]
	movs r1, #0x45
	bl FUN_0202D144
	b _0223557E
_022354EE:
	ldr r1, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov80_0223558C
	strh r0, [r4]
	b _0223557E
_022354FC:
	bl FUN_0204AC78
	strh r0, [r4]
	b _0223557E
_02235504:
	bl ov80_022358C4
	strh r0, [r4]
	b _0223557E
_0223550C:
	bl FUN_0204AC7C
	strh r0, [r4]
	b _0223557E
_02235514:
	bl ov80_022358E8
	strh r0, [r4]
	b _0223557E
_0223551C:
	bl FUN_0204B05C
	strh r0, [r4]
	b _0223557E
_02235524:
	ldr r1, [r5, #8]
	bl ov80_022357B4
	b _0223557E
_0223552C:
	ldr r1, [sp]
	bl ov80_02235898
	strh r0, [r4]
	b _0223557E
_02235536:
	ldr r1, [sp]
	bl ov80_022358B0
	b _0223557E
_0223553E:
	ldr r1, [r5, #8]
	bl FUN_0204AD04
	b _0223557E
_02235546:
	ldr r1, [r5, #8]
	bl FUN_0204AE20
	b _0223557E
_0223554E:
	bl FUN_0204AF2C
	b _0223557E
_02235554:
	ldr r1, _02235584 @ =0x00000884
	movs r2, #0x46
	adds r0, r0, r1
	movs r1, #0
	blx FUN_020D4994
	b _0223557E
_02235562:
	ldr r1, _02235588 @ =0x000008D6
	movs r2, #1
	strb r2, [r0, r1]
	b _0223557E
_0223556A:
	cmp r0, #0
	bne _02235574
	movs r0, #1
	strh r0, [r4]
	b _0223557E
_02235574:
	movs r0, #0
	strh r0, [r4]
	b _0223557E
_0223557A:
	bl GF_AssertFail
_0223557E:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235584: .4byte 0x00000884
_02235588: .4byte 0x000008D6
	thumb_func_end ov80_0223544C

	thumb_func_start ov80_0223558C
ov80_0223558C: @ 0x0223558C
	cmp r1, #2
	bne _02235598
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1d
	bx lr
_02235598:
	cmp r1, #1
	bne _022355BE
	ldrb r1, [r0, #0xf]
	cmp r1, #2
	bne _022355B0
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1d
	lsls r1, r0, #1
	ldr r0, _022355CC @ =0x0223C034
	ldrh r0, [r0, r1]
	bx lr
_022355B0:
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _022355BA
	movs r0, #0x61
	bx lr
_022355BA:
	movs r0, #0
	bx lr
_022355BE:
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _022355C8
	movs r0, #0x61
	bx lr
_022355C8:
	movs r0, #0
	bx lr
	.align 2, 0
_022355CC: .4byte 0x0223C034
	thumb_func_end ov80_0223558C

	thumb_func_start ov80_022355D0
ov80_022355D0: @ 0x022355D0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r5, #0x1c]
	adds r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r6, [r1]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	bne _022355F4
	movs r0, #0
	pop {r4, r5, r6, pc}
_022355F4:
	ldrb r0, [r4, #0xf]
	bl ov80_02236B18
	lsls r1, r6, #4
	adds r1, r6, r1
	adds r2, r0, #0
	adds r4, #0x90
	lsls r1, r1, #4
	adds r0, r5, #0
	adds r1, r4, r1
	bl ov80_0222F458
	movs r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022355D0

	thumb_func_start ov80_02235610
ov80_02235610: @ 0x02235610
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl FUN_0204AA2C
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02235610

	thumb_func_start ov80_02235624
ov80_02235624: @ 0x02235624
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r6, #0
	adds r4, r0, #0
	bl ov80_0223690C
	adds r6, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #4
	str r6, [r4, r0]
	ldr r1, _0223566C @ =0x0000045D
	movs r0, #5
	movs r2, #1
	bl FUN_02004EC4
	movs r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02235670 @ =0x020FA484
	ldr r0, [r0]
	adds r2, r6, #0
	bl FUN_02096820
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0223566C: .4byte 0x0000045D
_02235670: .4byte 0x020FA484
	thumb_func_end ov80_02235624

	thumb_func_start ov80_02235674
ov80_02235674: @ 0x02235674
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r6, r0, #0
	movs r0, #0x8d
	lsls r0, r0, #4
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl FUN_02052554
	ldr r1, _022356A8 @ =0x000008CC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	strh r0, [r6]
	adds r0, r5, #0
	bl FUN_02051BF8
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_022356A8: .4byte 0x000008CC
	thumb_func_end ov80_02235674

	thumb_func_start ov80_022356AC
ov80_022356AC: @ 0x022356AC
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096808
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	cmp r6, #2
	bne _022356E6
	adds r1, r7, #0
	bl ov80_02236ABC
	b _022356EA
_022356E6:
	bl GF_AssertFail
_022356EA:
	bl FUN_0203769C
	ldr r1, _0223570C @ =0x0000083E
	adds r1, r4, r1
	bl FUN_02037C0C
	cmp r0, #1
	bne _02235700
	movs r0, #1
	strh r0, [r5]
	b _02235708
_02235700:
	movs r0, #0
	strh r0, [r5]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02235708:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223570C: .4byte 0x0000083E
	thumb_func_end ov80_022356AC

	thumb_func_start ov80_02235710
ov80_02235710: @ 0x02235710
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222AC58
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222AC58
	adds r1, r5, #0
	adds r1, #0x78
	strh r4, [r1]
	adds r1, r5, #0
	adds r1, #0x7a
	strh r0, [r1]
	ldr r1, _02235738 @ =ov80_0223573C
	adds r0, r5, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02235738: .4byte ov80_0223573C
	thumb_func_end ov80_02235710

	thumb_func_start ov80_0223573C
ov80_0223573C: @ 0x0223573C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x7a
	ldrh r0, [r0]
	str r0, [sp]
	adds r0, r5, #0
	adds r5, #0x78
	ldrh r3, [r5]
	ldr r2, [r4, #8]
	bl ov80_02235774
	cmp r0, #1
	bne _02235770
	movs r0, #1
	pop {r3, r4, r5, pc}
_02235770:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223573C

	thumb_func_start ov80_02235774
ov80_02235774: @ 0x02235774
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r3, #0
	bl FUN_0203769C
	movs r1, #1
	subs r0, r1, r0
	bl FUN_02037C44
	adds r7, r0, #0
	bne _02235790
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02235790:
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	adds r0, r4, #0
	bl ov80_0222BE24
	adds r4, r0, #0
	cmp r5, #2
	bne _022357AC
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov80_02236AD8
	strh r0, [r4]
	b _022357B0
_022357AC:
	bl GF_AssertFail
_022357B0:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235774

	thumb_func_start ov80_022357B4
ov80_022357B4: @ 0x022357B4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldrb r2, [r4, #0xf]
	cmp r2, #6
	bhi _02235870
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_022357CC: @ jump table
	.2byte _02235870 - _022357CC - 2 @ case 0
	.2byte _02235870 - _022357CC - 2 @ case 1
	.2byte _022357F0 - _022357CC - 2 @ case 2
	.2byte _022357F0 - _022357CC - 2 @ case 3
	.2byte _022357DA - _022357CC - 2 @ case 4
	.2byte _022357DA - _022357CC - 2 @ case 5
	.2byte _022357F0 - _022357CC - 2 @ case 6
_022357DA:
	ldrb r2, [r4, #0xc]
	adds r0, r1, #0
	adds r1, r4, #0
	subs r2, r2, #1
	lsls r2, r2, #0x18
	adds r1, #0x78
	lsrs r2, r2, #0x18
	bl ov80_02236698
	add sp, #0x18
	pop {r4, r5, r6, pc}
_022357F0:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r4, #4]
	str r1, [sp, #0xc]
	ldrb r2, [r4, #0xc]
	adds r1, r4, #0
	ldrb r3, [r4, #0xe]
	subs r2, r2, #1
	lsls r2, r2, #2
	adds r2, r4, r2
	ldrh r2, [r2, #0x3e]
	adds r1, #0x78
	bl ov80_02236450
	ldrb r3, [r4, #0xe]
	movs r0, #0
	cmp r3, #0
	ble _02235842
	adds r1, r4, #0
	adds r1, #0xa8
	add r2, sp, #0x14
	adds r5, r4, #0
	add r6, sp, #0x10
_02235822:
	ldrh r3, [r1]
	adds r0, r0, #1
	adds r1, #0x38
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x15
	strh r3, [r2]
	adds r3, r5, #0
	adds r3, #0xaa
	ldrh r3, [r3]
	adds r2, r2, #2
	adds r5, #0x38
	strh r3, [r6]
	ldrb r3, [r4, #0xe]
	adds r6, r6, #2
	cmp r0, r3
	blt _02235822
_02235842:
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	movs r1, #0x62
	str r0, [sp, #0xc]
	ldrb r2, [r4, #0xc]
	lsls r1, r1, #2
	adds r0, r4, #0
	subs r2, r2, #1
	lsls r2, r2, #1
	adds r2, r2, #1
	lsls r2, r2, #1
	adds r2, r4, r2
	ldrh r2, [r2, #0x3e]
	adds r1, r4, r1
	bl ov80_02236450
	add sp, #0x18
	pop {r4, r5, r6, pc}
_02235870:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	adds r1, r4, #0
	str r0, [sp, #0xc]
	ldrb r2, [r4, #0xc]
	ldrb r3, [r4, #0xe]
	adds r0, r4, #0
	subs r2, r2, #1
	lsls r2, r2, #1
	adds r2, r4, r2
	ldrh r2, [r2, #0x3e]
	adds r1, #0x78
	bl ov80_02236450
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_022357B4

	thumb_func_start ov80_02235898
ov80_02235898: @ 0x02235898
	lsls r2, r1, #4
	adds r1, r1, r2
	lsls r1, r1, #4
	adds r0, r0, r1
	adds r0, #0x7c
	ldrh r0, [r0]
	ldr r3, _022358AC @ =ov80_0222A30C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx r3
	.align 2, 0
_022358AC: .4byte ov80_0222A30C
	thumb_func_end ov80_02235898

	thumb_func_start ov80_022358B0
ov80_022358B0: @ 0x022358B0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1e
	ldrb r3, [r0, #0x10]
	movs r2, #6
	lsrs r1, r1, #0x1d
	bics r3, r2
	orrs r1, r3
	strb r1, [r0, #0x10]
	bx lr
	thumb_func_end ov80_022358B0

	thumb_func_start ov80_022358C4
ov80_022358C4: @ 0x022358C4
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0xd]
	adds r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xf]
	cmp r0, #6
	beq _022358DC
	ldr r0, [r4, #8]
	bl FUN_020674A4
	str r0, [r4, #8]
_022358DC:
	ldrb r0, [r4, #0xc]
	adds r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xc]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_022358C4

	thumb_func_start ov80_022358E8
ov80_022358E8: @ 0x022358E8
	ldrb r1, [r0, #0xd]
	ldrh r0, [r0, #0x1a]
	adds r1, r0, r1
	ldr r0, _022358FC @ =0x0000FFFF
	cmp r1, r0
	bhi _022358F8
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
_022358F8:
	bx lr
	nop
_022358FC: .4byte 0x0000FFFF
	thumb_func_end ov80_022358E8

	thumb_func_start ov80_02235900
ov80_02235900: @ 0x02235900
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r0, [r0, #8]
	bl ov80_02235FC8
	adds r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096818
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov80_02235900

	thumb_func_start ov80_02235920
ov80_02235920: @ 0x02235920
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl ov80_02235FEC
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02235920

	thumb_func_start ov80_02235934
ov80_02235934: @ 0x02235934
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp]
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r3, [sp]
	adds r1, r6, #0
	adds r2, r7, #0
	bl ov80_02235FF8
	strh r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02235934

	thumb_func_start ov80_02235970
ov80_02235970: @ 0x02235970
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _0223598C @ =ov80_02235990
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_0223598C: .4byte ov80_02235990
	thumb_func_end ov80_02235970

	thumb_func_start ov80_02235990
ov80_02235990: @ 0x02235990
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r0, #0
	adds r1, #0x6f
	ldrb r1, [r1]
	cmp r1, #2
	blo _022359AE
	movs r1, #0
	adds r0, #0x6f
	strb r1, [r0]
	movs r0, #1
	pop {r3, pc}
_022359AE:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02235990

	thumb_func_start ov80_022359B4
ov80_022359B4: @ 0x022359B4
	push {r4, lr}
	adds r4, r0, #0
	bl ov80_0222AC58
	adds r1, r4, #0
	adds r1, #0x78
	strh r0, [r1]
	ldr r1, _022359D0 @ =ov80_022359D4
	adds r0, r4, #0
	bl ov80_0222AB84
	movs r0, #1
	pop {r4, pc}
	nop
_022359D0: .4byte ov80_022359D4
	thumb_func_end ov80_022359B4

	thumb_func_start ov80_022359D4
ov80_022359D4: @ 0x022359D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02096810
	adds r1, r0, #0
	adds r1, #0x6f
	ldrb r1, [r1]
	cmp r1, #2
	blo _022359F4
	movs r1, #0
	adds r0, #0x6f
	strb r1, [r0]
	movs r0, #1
	pop {r4, pc}
_022359F4:
	bl FUN_0203769C
	movs r1, #1
	eors r0, r1
	bl FUN_02037B5C
	cmp r0, #0xaf
	bne _02235A0E
	ldr r1, [r4]
	movs r0, #1
	adds r1, #0x39
	strb r0, [r1]
	pop {r4, pc}
_02235A0E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_022359D4

	thumb_func_start ov80_02235A14
ov80_02235A14: @ 0x02235A14
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r0, #0x6e
	ldrb r0, [r0]
	cmp r6, r0
	bne _02235A3A
	movs r0, #1
	b _02235A3C
_02235A3A:
	movs r0, #0
_02235A3C:
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_02235A14

	thumb_func_start ov80_02235A44
ov80_02235A44: @ 0x02235A44
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl ov80_0222BE10
	adds r0, r5, #0
	bl ov80_0222BE10
	adds r7, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	ldr r1, [r0, #0x24]
	adds r0, r4, #0
	adds r0, #0x98
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb0
	str r6, [r0]
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0]
	adds r2, r7, #0
	bl ov80_02236040
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235A44

	thumb_func_start ov80_02235A8C
ov80_02235A8C: @ 0x02235A8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov80_0222BDF4
	adds r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r5, r0, #0
	adds r0, #0xa8
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #7
	bne _02235ACC
	movs r0, #0xff
	movs r2, #0
	strh r0, [r4]
	adds r1, r2, #0
_02235ABE:
	adds r0, r5, r2
	adds r0, #0xa1
	adds r2, r2, #1
	strb r1, [r0]
	cmp r2, #2
	blt _02235ABE
	b _02235AF2
_02235ACC:
	cmp r0, #6
	bne _02235AF2
	adds r1, #0x30
	ldrb r0, [r1]
	strh r0, [r4]
	ldrh r0, [r4]
	subs r0, r0, #1
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r0, #0x31
	ldrb r0, [r0]
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #0
	beq _02235AF2
	subs r0, r0, #1
	strh r0, [r6]
_02235AF2:
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	bl FUN_0201AB0C
	movs r0, #0
	adds r5, #0xa8
	str r0, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02235A8C

	thumb_func_start ov80_02235B04
ov80_02235B04: @ 0x02235B04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r0, #0x59
	ldrb r0, [r0]
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02235B04

	thumb_func_start ov80_02235B20
ov80_02235B20: @ 0x02235B20
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, [r7, #0x1c]
	adds r2, r1, #1
	str r2, [r7, #0x1c]
	ldrb r1, [r1]
	str r1, [sp]
	adds r1, r2, #1
	str r1, [r7, #0x1c]
	ldrb r6, [r2]
	adds r1, r1, #1
	str r1, [r7, #0x1c]
	bl ov80_0222BDF4
	adds r5, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_02096810
	adds r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl FUN_02096808
	adds r7, r0, #0
	ldr r0, [sp]
	cmp r0, #0xd
	bhi _02235BD0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02235B64: @ jump table
	.2byte _02235B80 - _02235B64 - 2 @ case 0
	.2byte _02235B88 - _02235B64 - 2 @ case 1
	.2byte _02235B90 - _02235B64 - 2 @ case 2
	.2byte _02235C44 - _02235B64 - 2 @ case 3
	.2byte _02235C60 - _02235B64 - 2 @ case 4
	.2byte _02235C88 - _02235B64 - 2 @ case 5
	.2byte _02235C94 - _02235B64 - 2 @ case 6
	.2byte _02235CA6 - _02235B64 - 2 @ case 7
	.2byte _02235CAC - _02235B64 - 2 @ case 8
	.2byte _02235CB4 - _02235B64 - 2 @ case 9
	.2byte _02235CBC - _02235B64 - 2 @ case 10
	.2byte _02235CC4 - _02235B64 - 2 @ case 11
	.2byte _02235D3E - _02235B64 - 2 @ case 12
	.2byte _02235E6C - _02235B64 - 2 @ case 13
_02235B80:
	adds r0, r4, #0
	bl FUN_02096910
	b _02235E80
_02235B88:
	adds r4, #0x86
	ldrh r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235B90:
	cmp r6, #1
	bne _02235BDA
	movs r0, #0
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0x76
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235BB2
	adds r0, r4, #0
	adds r0, #0x88
	ldrh r0, [r0]
	cmp r1, r0
	bne _02235BB8
_02235BB2:
	ldrh r0, [r5]
	adds r0, r0, #1
	strh r0, [r5]
_02235BB8:
	adds r0, r4, #0
	adds r0, #0x78
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235BD2
	adds r4, #0x88
	ldrh r0, [r4]
	cmp r1, r0
	beq _02235BD2
_02235BD0:
	b _02235E80
_02235BD2:
	ldrh r0, [r5]
	adds r0, r0, #2
	strh r0, [r5]
	b _02235E80
_02235BDA:
	cmp r6, #5
	bne _02235BF8
	adds r0, r4, #0
	adds r0, #0x76
	adds r4, #0x86
	ldrh r1, [r0]
	ldrh r0, [r4]
	cmp r1, r0
	bne _02235BF2
	movs r0, #0
	strh r0, [r5]
	b _02235E80
_02235BF2:
	movs r0, #1
	strh r0, [r5]
	b _02235E80
_02235BF8:
	cmp r6, #4
	beq _02235C00
	cmp r6, #6
	bne _02235CF6
_02235C00:
	movs r0, #0
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0x76
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235C1E
	adds r0, r4, #0
	adds r0, #0x88
	ldrh r0, [r0]
	cmp r1, r0
	bne _02235C24
_02235C1E:
	ldrh r0, [r5]
	adds r0, r0, #1
	strh r0, [r5]
_02235C24:
	adds r0, r4, #0
	adds r0, #0x78
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235C3C
	adds r4, #0x88
	ldrh r0, [r4]
	cmp r1, r0
	bne _02235CF6
_02235C3C:
	ldrh r0, [r5]
	adds r0, r0, #2
	strh r0, [r5]
	b _02235E80
_02235C44:
	ldr r0, [r7, #8]
	bl FUN_0203107C
	adds r4, r0, #0
	movs r0, #0x6a
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0x6a
	bl FUN_020310BC
	strh r0, [r5]
	b _02235E80
_02235C60:
	ldr r0, [r7, #8]
	bl FUN_0203107C
	adds r4, r0, #0
	movs r0, #3
	bl FUN_0205C11C
	adds r6, r0, #0
	movs r0, #3
	bl FUN_0205C11C
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl FUN_020310BC
	strh r0, [r5]
	b _02235E80
_02235C88:
	lsls r0, r6, #1
	adds r0, r4, r0
	adds r0, #0x76
	ldrh r0, [r0]
	strh r0, [r5]
	b _02235E80
_02235C94:
	ldr r0, [r7, #8]
	bl FUN_02030C5C
	adds r1, r0, #0
	ldr r0, [r7, #8]
	movs r2, #3
	bl FUN_0204F878
	b _02235E80
_02235CA6:
	adds r4, #0xa0
	strb r6, [r4]
	b _02235E80
_02235CAC:
	adds r4, #0x74
	ldrh r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235CB4:
	adds r4, #0xa0
	ldrb r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235CBC:
	adds r4, #0x71
	ldrb r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235CC4:
	movs r0, #1
	strh r0, [r5]
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	bl ov80_022385D8
	adds r6, r0, #0
	ldr r0, [r4]
	bl FUN_0203107C
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_020310BC
	adds r1, r4, #0
	adds r1, #0x72
	ldrh r1, [r1]
	cmp r0, r1
	bne _02235CF8
_02235CF6:
	b _02235E80
_02235CF8:
	ldr r0, [r4]
	bl FUN_0203107C
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	movs r3, #0
	bl FUN_02031108
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	bl ov80_02238610
	adds r6, r0, #0
	ldr r0, [r4]
	bl FUN_0203107C
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0
	bl FUN_02031108
	movs r0, #0
	strh r0, [r5]
	b _02235E80
_02235D3E:
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	bl ov80_02238610
	adds r6, r0, #0
	ldr r0, [r4]
	bl FUN_0203107C
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_020310BC
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #0
	bne _02235E50
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	bl ov80_022385D8
	adds r5, r0, #0
	ldr r0, [r4]
	bl FUN_0203107C
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #0
	bl FUN_02031108
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _02235DA8
	ldr r0, [r4]
	bl FUN_0202D918
	movs r1, #6
	movs r2, #2
	bl FUN_0202D57C
_02235DA8:
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #4
	bne _02235DE6
	ldr r0, [r4]
	bl FUN_0203107C
	adds r5, r0, #0
	movs r0, #0x88
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0x88
	movs r3, #0
	bl FUN_02031108
	ldr r0, [r4]
	bl FUN_0203107C
	adds r5, r0, #0
	movs r0, #0x89
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	movs r1, #0x89
	movs r3, #0
	bl FUN_02031108
_02235DE6:
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #2
	bne _02235E1A
	ldr r0, [r4]
	bl FUN_0203107C
	adds r5, r0, #0
	movs r0, #0
	movs r1, #3
	bl FUN_0205C048
	adds r6, r0, #0
	movs r0, #0
	movs r1, #3
	bl FUN_0205C048
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0
	bl FUN_02031108
_02235E1A:
	adds r0, r4, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #3
	bne _02235E80
	ldr r0, [r4]
	bl FUN_0203107C
	adds r5, r0, #0
	movs r0, #1
	movs r1, #3
	bl FUN_0205C048
	adds r4, r0, #0
	movs r0, #1
	movs r1, #3
	bl FUN_0205C048
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl FUN_02031108
	b _02235E80
_02235E50:
	ldr r0, [r4]
	bl FUN_0203107C
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #0
	bl FUN_02031108
	b _02235E80
_02235E6C:
	movs r2, #0
	adds r1, r2, #0
_02235E70:
	adds r0, r4, r2
	adds r0, #0xa1
	adds r2, r2, #1
	strb r1, [r0]
	cmp r2, #2
	blt _02235E70
	adds r4, #0x9f
	strb r1, [r4]
_02235E80:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235B20

	thumb_func_start ov80_02235E84
ov80_02235E84: @ 0x02235E84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xb4
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096808
	adds r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	adds r6, r0, #0
	adds r4, r6, #0
	add r3, sp, #0
	movs r2, #0x16
_02235EA4:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02235EA4
	ldr r0, [r4]
	str r0, [r3]
	adds r0, r6, #0
	bl ov80_02235FEC
	ldr r0, [r7, #8]
	movs r1, #0
	movs r2, #6
	bl FUN_0204A824
	adds r4, r0, #0
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0]
	bl FUN_02096818
	ldrb r0, [r4, #0xf]
	cmp r0, #6
	bne _02235ED8
	ldr r0, [r7, #8]
	bl ov80_0222A840
_02235ED8:
	ldrb r0, [r4, #0xe]
	movs r2, #0
	cmp r0, #0
	ble _02235F10
	add r3, sp, #0
	adds r5, r3, #0
	adds r6, r4, #0
_02235EE6:
	adds r0, r3, #0
	adds r0, #0x6a
	ldrb r1, [r0]
	adds r0, r4, r2
	adds r0, #0x2a
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x76
	ldrh r0, [r0]
	adds r2, r2, #1
	adds r3, r3, #1
	strh r0, [r6, #0x2e]
	adds r0, r5, #0
	adds r0, #0x7e
	ldrh r0, [r0]
	adds r5, r5, #2
	strh r0, [r6, #0x36]
	ldrb r0, [r4, #0xe]
	adds r6, r6, #2
	cmp r2, r0
	blt _02235EE6
_02235F10:
	add r0, sp, #0x80
	ldrh r1, [r0, #6]
	strh r1, [r4, #0x16]
	ldrh r0, [r0, #8]
	movs r1, #0xe0
	strh r0, [r4, #0x18]
	add r0, sp, #0x40
	ldrb r2, [r0, #0x18]
	strb r2, [r4, #0x12]
	ldrb r0, [r4, #0x10]
	bics r0, r1
	adds r1, r2, #5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x18
	orrs r0, r1
	strb r0, [r4, #0x10]
	bl FUN_0203769C
	cmp r0, #0
	bne _02235F44
	ldr r1, [r7, #8]
	adds r0, r4, #0
	bl FUN_0204ABC8
_02235F44:
	ldr r0, [r7, #8]
	bl FUN_02074904
	bl FUN_02090C1C
	adds r0, r4, #0
	bl FUN_02096910
	ldr r1, _02235F60 @ =0x000008D4
	movs r0, #0
	strb r0, [r4, r1]
	add sp, #0xb4
	pop {r4, r5, r6, r7, pc}
	nop
_02235F60: .4byte 0x000008D4
	thumb_func_end ov80_02235E84

	thumb_func_start ov80_02235F64
ov80_02235F64: @ 0x02235F64
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0222BDF4
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02096810
	bl FUN_02096998
	strh r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02235F64

	thumb_func_start ov80_02235F80
ov80_02235F80: @ 0x02235F80
	push {r3, lr}
	ldr r1, _02235F8C @ =ov80_02235F90
	bl ov80_0222AB84
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
_02235F8C: .4byte ov80_02235F90
	thumb_func_end ov80_02235F80

	thumb_func_start ov80_02235F90
ov80_02235F90: @ 0x02235F90
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	ldr r1, _02235FB0 @ =0x000008D4
	ldrb r2, [r0, r1]
	cmp r2, #2
	bhs _02235FA6
	movs r0, #0
	pop {r3, pc}
_02235FA6:
	movs r2, #0
	strb r2, [r0, r1]
	movs r0, #1
	pop {r3, pc}
	nop
_02235FB0: .4byte 0x000008D4
	thumb_func_end ov80_02235F90

	thumb_func_start ov80_02235FB4
ov80_02235FB4: @ 0x02235FB4
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02096810
	bl FUN_0204AA2C
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02235FB4

	thumb_func_start ov80_02235FC8
ov80_02235FC8: @ 0x02235FC8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xb
	movs r1, #0xb4
	bl FUN_0201AA8C
	ldr r1, _02235FE8 @ =0x0223DD50
	movs r2, #0xb4
	str r0, [r1]
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _02235FE8 @ =0x0223DD50
	ldr r0, [r0]
	str r4, [r0]
	pop {r4, pc}
	.align 2, 0
_02235FE8: .4byte 0x0223DD50
	thumb_func_end ov80_02235FC8

	thumb_func_start ov80_02235FEC
ov80_02235FEC: @ 0x02235FEC
	push {r3, lr}
	cmp r0, #0
	beq _02235FF6
	bl FUN_0201AB0C
_02235FF6:
	pop {r3, pc}
	thumb_func_end ov80_02235FEC

	thumb_func_start ov80_02235FF8
ov80_02235FF8: @ 0x02235FF8
	push {r3, lr}
	cmp r1, #5
	bhi _0223603C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223600A: @ jump table
	.2byte _02236016 - _0223600A - 2 @ case 0
	.2byte _0223601C - _0223600A - 2 @ case 1
	.2byte _02236024 - _0223600A - 2 @ case 2
	.2byte _0223603C - _0223600A - 2 @ case 3
	.2byte _0223602E - _0223600A - 2 @ case 4
	.2byte _02236036 - _0223600A - 2 @ case 5
_02236016:
	bl FUN_02096A34
	pop {r3, pc}
_0223601C:
	adds r1, r2, #0
	bl FUN_02096AAC
	pop {r3, pc}
_02236024:
	adds r1, r2, #0
	adds r2, r3, #0
	bl FUN_02096AF4
	pop {r3, pc}
_0223602E:
	adds r1, r2, #0
	bl FUN_02096BF8
	pop {r3, pc}
_02236036:
	adds r1, r2, #0
	bl FUN_02096C40
_0223603C:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02235FF8

	thumb_func_start ov80_02236040
ov80_02236040: @ 0x02236040
	push {r3, lr}
	adds r3, r1, #0
	adds r3, #0x98
	ldr r3, [r3]
	cmp r2, #4
	bhi _02236088
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02236058: @ jump table
	.2byte _02236062 - _02236058 - 2 @ case 0
	.2byte _0223606C - _02236058 - 2 @ case 1
	.2byte _02236076 - _02236058 - 2 @ case 2
	.2byte _02236080 - _02236058 - 2 @ case 3
	.2byte _02236088 - _02236058 - 2 @ case 4
_02236062:
	adds r2, r3, #0
	movs r3, #0xb
	bl ov80_0223608C
	pop {r3, pc}
_0223606C:
	adds r2, r3, #0
	movs r3, #0xb
	bl ov80_022362B8
	pop {r3, pc}
_02236076:
	adds r2, r3, #0
	movs r3, #0xb
	bl ov80_02236330
	pop {r3, pc}
_02236080:
	adds r2, r3, #0
	movs r3, #0xb
	bl ov80_0223641C
_02236088:
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02236040

	thumb_func_start ov80_0223608C
ov80_0223608C: @ 0x0223608C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0xb
	movs r1, #0x44
	adds r4, r2, #0
	bl FUN_0201AA8C
	adds r1, r5, #0
	adds r1, #0xa8
	str r0, [r1]
	adds r1, r5, #0
	adds r1, #0xa8
	ldr r1, [r1]
	movs r0, #0
	movs r2, #0x44
	blx FUN_020D4858
	ldr r0, [r5]
	bl FUN_02074904
	adds r1, r5, #0
	adds r1, #0xa8
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [r5]
	bl FUN_0207879C
	adds r1, r5, #0
	adds r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r0, [r5]
	bl FUN_0202B50C
	adds r1, r5, #0
	adds r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #8]
	ldr r0, [r5]
	bl FUN_02028EA8
	adds r1, r5, #0
	adds r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #0xc]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _0223610E
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x11
	adds r0, #0x24
	strb r1, [r0]
	b _02236148
_0223610E:
	cmp r0, #5
	bne _02236120
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x16
	adds r0, #0x24
	strb r1, [r0]
	b _02236148
_02236120:
	cmp r0, #4
	bne _02236132
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x17
	adds r0, #0x24
	strb r1, [r0]
	b _02236148
_02236132:
	cmp r0, #6
	bne _02236144
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x17
	adds r0, #0x24
	strb r1, [r0]
	b _02236148
_02236144:
	bl GF_AssertFail
_02236148:
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	str r4, [r0, #0x1c]
	adds r0, r5, #0
	adds r0, #0x9f
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r0, #0x26
	strb r1, [r0]
	movs r1, #0
_02236162:
	adds r2, r5, #0
	adds r0, r5, r1
	adds r2, #0xa8
	adds r0, #0xa1
	ldr r2, [r2]
	ldrb r0, [r0]
	adds r2, r2, r1
	adds r2, #0x30
	strb r0, [r2]
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #2
	blo _02236162
	adds r0, r5, #0
	adds r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _022361C6
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf
	adds r0, #0x36
	bics r2, r1
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf0
	adds r0, #0x36
	bics r2, r1
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x64
	adds r0, #0x37
	strb r1, [r0]
	b _02236290
_022361C6:
	cmp r0, #5
	bne _02236208
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf
	adds r0, #0x36
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf0
	adds r0, #0x36
	bics r2, r1
	movs r1, #0x10
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x1e
	adds r0, #0x37
	strb r1, [r0]
	b _02236290
_02236208:
	cmp r0, #4
	bne _0223624A
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf
	adds r0, #0x36
	bics r2, r1
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf0
	adds r0, #0x36
	bics r2, r1
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x64
	adds r0, #0x37
	strb r1, [r0]
	b _02236290
_0223624A:
	cmp r0, #6
	bne _0223628C
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf
	adds r0, #0x36
	bics r2, r1
	movs r1, #2
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x36
	ldrb r2, [r1]
	movs r1, #0xf0
	adds r0, #0x36
	bics r2, r1
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x64
	adds r0, #0x37
	strb r1, [r0]
	b _02236290
_0223628C:
	bl GF_AssertFail
_02236290:
	movs r0, #0x43
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r3, #0
	str r1, [r0, #0x20]
	str r3, [sp]
	adds r5, #0xa8
	ldr r1, _022362B4 @ =0x0210159C
	ldr r2, [r5]
	adds r0, r6, #0
	bl FUN_02096820
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022362B4: .4byte 0x0210159C
	thumb_func_end ov80_0223608C

	thumb_func_start ov80_022362B8
ov80_022362B8: @ 0x022362B8
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x26
	ldrb r1, [r1]
	cmp r1, #6
	beq _022362E0
	cmp r1, #7
	bne _022362F0
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #4
	strh r1, [r0]
	adds r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
_022362E0:
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #4
	strh r1, [r0]
	adds r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
_022362F0:
	adds r1, r4, #0
	adds r0, #0x30
	adds r1, #0xa1
	movs r2, #2
	blx FUN_020D4A50
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	adds r0, #0x26
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x9f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xa8
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #2
	strh r1, [r0]
	adds r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_022362B8

	thumb_func_start ov80_02236330
ov80_02236330: @ 0x02236330
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r3, #0
	movs r1, #0x3c
	bl FUN_0201AACC
	adds r1, r4, #0
	adds r1, #0xac
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020D4994
	ldr r0, [r4]
	bl FUN_02028EA8
	adds r1, r4, #0
	adds r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r0, [r4]
	bl FUN_02074904
	adds r1, r4, #0
	adds r1, #0xac
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [r4]
	bl FUN_02074910
	adds r1, r4, #0
	adds r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	ldr r0, [r4]
	bl FUN_02088288
	adds r1, r4, #0
	adds r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x2c]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #1
	strb r1, [r0, #0x11]
	adds r0, r4, #0
	adds r0, #0x9f
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02074640
	adds r1, r4, #0
	adds r1, #0xac
	ldr r1, [r1]
	strb r0, [r1, #0x13]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #0
	strh r1, [r0, #0x18]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	strb r1, [r0, #0x12]
	ldr r0, [r4]
	bl FUN_0202D95C
	adds r1, r4, #0
	adds r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x20]
	ldr r0, [r4]
	bl FUN_0208828C
	adds r1, r4, #0
	adds r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x34]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldr r1, _02236414 @ =0x0223C040
	bl FUN_02089D40
	ldr r0, [r4]
	bl FUN_02028E9C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0208AD34
	movs r3, #0
	str r3, [sp]
	adds r4, #0xac
	ldr r1, _02236418 @ =0x02103A1C
	ldr r2, [r4]
	adds r0, r5, #0
	bl FUN_02096820
	pop {r3, r4, r5, pc}
	.align 2, 0
_02236414: .4byte 0x0223C040
_02236418: .4byte 0x02103A1C
	thumb_func_end ov80_02236330

	thumb_func_start ov80_0223641C
ov80_0223641C: @ 0x0223641C
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x9f
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xac
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	adds r4, #0x9d
	strh r1, [r0]
	strb r1, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223641C

	thumb_func_start ov80_02236450
ov80_02236450: @ 0x02236450
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldrb r0, [r5, #0xf]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov80_02236B04
	adds r3, r0, #0
	ldr r2, [sp, #0x3c]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_02229F04
	str r0, [sp, #0x14]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	adds r4, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	adds r2, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	adds r3, r4, #0
	str r0, [sp, #0x10]
	adds r0, r5, #0
	bl ov80_022364A4
	adds r4, r0, #0
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02236450

	thumb_func_start ov80_022364A4
ov80_022364A4: @ 0x022364A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	adds r7, r0, #0
	ldr r0, [sp, #0x9c]
	str r2, [sp, #0x18]
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #0x14]
	str r0, [sp, #0xa0]
	ldr r0, [sp, #0xa4]
	str r3, [sp, #0x1c]
	str r0, [sp, #0xa4]
	ldr r0, [sp, #0xa8]
	str r0, [sp, #0xa8]
	movs r0, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x88
	ldrb r0, [r0, #0x10]
	cmp r0, #4
	bls _022364D0
	bl GF_AssertFail
_022364D0:
	add r0, sp, #0x88
	ldrb r6, [r0, #0x10]
	movs r4, #0
	str r4, [sp, #0x30]
	cmp r6, #0
	bne _022364DE
	b _022365EE
_022364DE:
	add r0, sp, #0x74
	str r0, [sp, #0x24]
_022364E2:
	adds r0, r7, #0
	bl FUN_0204B510
	ldr r1, [sp, #0x14]
	ldrh r1, [r1, #2]
	blx FUN_020F2998
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x17
	ldr r0, [sp, #0x14]
	adds r0, r0, r1
	ldrh r0, [r0, #4]
	str r0, [sp, #0x34]
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	adds r2, r0, #0
	ldr r1, [sp, #0x34]
	add r0, sp, #0x44
	bl ov80_02229EF4
	movs r0, #0
	str r0, [sp, #0x40]
	cmp r4, #0
	ble _0223653C
	add r5, sp, #0x74
_02236516:
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	adds r2, r0, #0
	ldr r1, [r5]
	add r0, sp, #0x54
	bl ov80_02229EF4
	add r0, sp, #0x44
	ldrh r1, [r0, #0x10]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0223653C
	ldr r0, [sp, #0x40]
	adds r5, r5, #4
	adds r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, r4
	blt _02236516
_0223653C:
	ldr r0, [sp, #0x40]
	cmp r0, r4
	bne _022365E8
	ldr r0, [sp, #0x9c]
	cmp r0, #0
	beq _02236566
	movs r0, #0
	cmp r6, #0
	ble _02236562
	add r1, sp, #0x44
	ldrh r3, [r1]
	ldr r2, [sp, #0x9c]
_02236554:
	ldrh r1, [r2]
	cmp r3, r1
	beq _02236562
	adds r0, r0, #1
	adds r2, r2, #2
	cmp r0, r6
	blt _02236554
_02236562:
	cmp r0, r6
	bne _022365E8
_02236566:
	ldr r0, [sp, #0x30]
	cmp r0, #0x32
	bge _022365DE
	movs r0, #0
	str r0, [sp, #0x20]
	cmp r4, #0
	ble _022365A0
	add r5, sp, #0x74
_02236576:
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	adds r2, r0, #0
	ldr r1, [r5]
	add r0, sp, #0x54
	bl ov80_02229EF4
	add r0, sp, #0x44
	ldrh r1, [r0, #0x1c]
	cmp r1, #0
	beq _02236594
	ldrh r0, [r0, #0xc]
	cmp r1, r0
	beq _022365A0
_02236594:
	ldr r0, [sp, #0x20]
	adds r5, r5, #4
	adds r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, r4
	blt _02236576
_022365A0:
	ldr r0, [sp, #0x20]
	cmp r0, r4
	beq _022365AE
	ldr r0, [sp, #0x30]
	adds r0, r0, #1
	str r0, [sp, #0x30]
	b _022365E8
_022365AE:
	ldr r0, [sp, #0xa0]
	cmp r0, #0
	beq _022365DE
	movs r0, #0
	cmp r6, #0
	ble _022365D2
	add r1, sp, #0x44
	ldrh r3, [r1, #0xc]
	ldr r2, [sp, #0xa0]
_022365C0:
	ldrh r1, [r2]
	cmp r3, r1
	bne _022365CA
	cmp r1, #0
	bne _022365D2
_022365CA:
	adds r0, r0, #1
	adds r2, r2, #2
	cmp r0, r6
	blt _022365C0
_022365D2:
	cmp r0, r6
	beq _022365DE
	ldr r0, [sp, #0x30]
	adds r0, r0, #1
	str r0, [sp, #0x30]
	b _022365E8
_022365DE:
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x24]
	adds r4, r4, #1
	stm r0!, {r1}
	str r0, [sp, #0x24]
_022365E8:
	cmp r4, r6
	beq _022365EE
	b _022364E2
_022365EE:
	ldr r0, [sp, #0x18]
	bl FUN_0204B4D4
	str r0, [sp, #0x3c]
	adds r0, r7, #0
	bl FUN_0204B510
	adds r5, r0, #0
	adds r0, r7, #0
	bl FUN_0204B510
	lsls r0, r0, #0x10
	orrs r0, r5
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x30]
	cmp r0, #0x32
	blt _02236614
	movs r0, #1
	str r0, [sp, #0x2c]
_02236614:
	movs r5, #0
	cmp r4, #0
	ble _0223665C
	add r0, sp, #0x74
	str r0, [sp, #0x28]
	add r6, sp, #0x64
_02236620:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	str r0, [sp, #4]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xa8]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x10]
	ldr r2, [r2]
	adds r0, r7, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl ov80_02236734
	stm r6!, {r0}
	ldr r0, [sp, #0x28]
	adds r5, r5, #1
	adds r0, r0, #4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	adds r0, #0x38
	str r0, [sp, #0x1c]
	cmp r5, r4
	blt _02236620
_0223665C:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bne _02236668
	ldr r0, [sp, #0x2c]
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
_02236668:
	ldr r1, [sp, #0x38]
	ldr r2, [sp, #0xa4]
	str r1, [r0]
	movs r3, #0
	add r0, sp, #0x74
	add r1, sp, #0x64
_02236674:
	ldr r5, [r0]
	ldr r4, [sp, #0xa4]
	adds r3, r3, #1
	strh r5, [r4, #4]
	ldr r4, [r1]
	adds r0, r0, #4
	str r4, [r2, #8]
	ldr r4, [sp, #0xa4]
	adds r1, r1, #4
	adds r4, r4, #2
	adds r2, r2, #4
	str r4, [sp, #0xa4]
	cmp r3, #2
	blt _02236674
	ldr r0, [sp, #0x2c]
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_022364A4

	thumb_func_start ov80_02236698
ov80_02236698: @ 0x02236698
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	movs r2, #0x11
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020D4994
	adds r0, r6, #0
	bl FUN_0202D928
	adds r6, r0, #0
	bl FUN_0202D7B0
	cmp r0, #0
	bne _022366C6
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov80_022366D4
	pop {r4, r5, r6, pc}
_022366C6:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0202D804
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_02236698

	thumb_func_start ov80_022366D4
ov80_022366D4: @ 0x022366D4
	push {r3, r4, r5, r6, r7, lr}
	movs r2, #0x11
	adds r4, r1, #0
	movs r1, #0
	lsls r2, r2, #4
	adds r5, r0, #0
	blx FUN_020D4994
	movs r0, #6
	muls r0, r4, r0
	ldr r1, _02236728 @ =0x0223C050
	str r0, [sp]
	adds r6, r1, r0
	ldr r1, _0223672C @ =0x0223C07C
	movs r2, #0x30
	adds r0, r4, #0
	muls r0, r2, r0
	adds r0, r1, r0
	adds r1, r5, #0
	ldr r7, _02236730 @ =0x0223C0AC
	blx FUN_020D4A50
	ldr r1, _02236728 @ =0x0223C050
	ldr r0, [sp]
	movs r4, #0
	ldrh r0, [r1, r0]
	strh r0, [r5, #6]
	adds r5, #0x30
_0223670C:
	adds r0, r6, r4
	ldrb r1, [r0, #2]
	movs r0, #0x38
	movs r2, #0x38
	muls r0, r1, r0
	adds r0, r7, r0
	adds r1, r5, #0
	blx FUN_020D4A50
	adds r4, r4, #1
	adds r5, #0x38
	cmp r4, #4
	blt _0223670C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02236728: .4byte 0x0223C050
_0223672C: .4byte 0x0223C07C
_02236730: .4byte 0x0223C0AC
	thumb_func_end ov80_022366D4

	thumb_func_start ov80_02236734
ov80_02236734: @ 0x02236734
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, r2, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x38
	str r3, [sp]
	blx FUN_020D4994
	ldrb r0, [r4, #0xf]
	bl ov80_02236AF0
	adds r2, r0, #0
	add r0, sp, #8
	adds r1, r6, #0
	bl ov80_02229EF4
	add r2, sp, #8
	ldrh r0, [r5]
	ldr r1, _022368E4 @ =0xFFFFF800
	ldrh r3, [r2]
	ands r0, r1
	lsrs r1, r1, #0x15
	ands r1, r3
	orrs r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	ldr r0, _022368E8 @ =0xFFFF07FF
	ands r1, r0
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0223678E
	add r0, sp, #0x20
	ldrb r0, [r0, #0x18]
	lsls r1, r0, #1
	ldr r0, _022368EC @ =0x0223C048
	ldrh r0, [r0, r1]
	b _02236790
_0223678E:
	ldrh r0, [r2, #0xc]
_02236790:
	strh r0, [r5, #2]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	add r1, sp, #8
	adds r2, r5, #0
	adds r3, r0, #0
_0223679E:
	ldrh r6, [r1, #2]
	strh r6, [r2, #4]
	ldrh r6, [r1, #2]
	cmp r6, #0xda
	bne _022367AA
	str r3, [sp, #4]
_022367AA:
	adds r0, r0, #1
	adds r1, r1, #2
	adds r2, r2, #2
	cmp r0, #4
	blt _0223679E
	ldr r0, [sp]
	ldr r7, [sp, #0x30]
	str r0, [r5, #0xc]
	cmp r7, #0
	bne _022367F0
_022367BE:
	adds r0, r4, #0
	bl FUN_0204B510
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0204B510
	lsls r0, r0, #0x10
	adds r7, r6, #0
	orrs r7, r0
	adds r0, r7, #0
	bl FUN_0206FE2C
	add r1, sp, #8
	ldrb r1, [r1, #0xb]
	cmp r1, r0
	bne _022367BE
	ldr r0, [sp]
	adds r1, r7, #0
	bl FUN_02070068
	cmp r0, #1
	beq _022367BE
	str r7, [r5, #0x10]
	b _022367F2
_022367F0:
	str r7, [r5, #0x10]
_022367F2:
	add r0, sp, #0x20
	ldrb r1, [r0, #0x14]
	ldr r2, [r5, #0x14]
	movs r0, #0x1f
	bics r2, r0
	movs r0, #0x1f
	ands r0, r1
	orrs r2, r0
	ldr r0, _022368F0 @ =0xFFFFFC1F
	movs r6, #0
	ands r2, r0
	lsls r0, r1, #0x1b
	lsrs r1, r0, #0x16
	orrs r2, r1
	ldr r1, _022368F4 @ =0xFFFF83FF
	adds r4, r6, #0
	ands r2, r1
	lsrs r1, r0, #0x11
	orrs r2, r1
	ldr r1, _022368F8 @ =0xFFF07FFF
	ands r2, r1
	lsrs r1, r0, #0xc
	orrs r2, r1
	ldr r1, _022368FC @ =0xFE0FFFFF
	ands r2, r1
	lsrs r1, r0, #7
	orrs r2, r1
	ldr r1, _02236900 @ =0xC1FFFFFF
	lsrs r0, r0, #2
	ands r1, r2
	orrs r0, r1
	str r0, [r5, #0x14]
_02236832:
	adds r0, r4, #0
	bl FUN_020726C0
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _02236842
	adds r6, r6, #1
_02236842:
	adds r4, r4, #1
	cmp r4, #6
	blt _02236832
	ldr r0, _02236904 @ =0x000001FE
	adds r1, r6, #0
	blx FUN_020F2998
	cmp r0, #0xff
	ble _02236856
	movs r0, #0xff
_02236856:
	lsls r0, r0, #0x18
	movs r4, #0
	lsrs r6, r0, #0x18
_0223685C:
	adds r0, r4, #0
	bl FUN_020726C0
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0223686E
	adds r0, r5, r4
	strb r6, [r0, #0x18]
_0223686E:
	adds r4, r4, #1
	cmp r4, #6
	blt _0223685C
	movs r0, #0
	strb r0, [r5, #0x1e]
	ldr r0, _02236908 @ =0x020F5670
	movs r1, #0x19
	ldrb r0, [r0]
	strb r0, [r5, #0x1f]
	ldrh r0, [r5]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	bl FUN_0206FBE8
	cmp r0, #0
	beq _022368B2
	ldr r2, [r5, #0x10]
	movs r1, #1
	tst r1, r2
	beq _0223689E
	adds r1, r5, #0
	adds r1, #0x20
	strb r0, [r1]
	b _022368C4
_0223689E:
	ldrh r0, [r5]
	movs r1, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	bl FUN_0206FBE8
	adds r1, r5, #0
	adds r1, #0x20
	strb r0, [r1]
	b _022368C4
_022368B2:
	ldrh r0, [r5]
	movs r1, #0x18
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	bl FUN_0206FBE8
	adds r1, r5, #0
	adds r1, #0x20
	strb r0, [r1]
_022368C4:
	adds r1, r5, #0
	ldr r0, [sp, #4]
	adds r1, #0x21
	strb r0, [r1]
	ldrh r0, [r5]
	adds r5, #0x22
	ldr r1, [sp, #0x40]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	adds r2, r5, #0
	bl FUN_0200BC28
	adds r0, r7, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022368E4: .4byte 0xFFFFF800
_022368E8: .4byte 0xFFFF07FF
_022368EC: .4byte 0x0223C048
_022368F0: .4byte 0xFFFFFC1F
_022368F4: .4byte 0xFFFF83FF
_022368F8: .4byte 0xFFF07FFF
_022368FC: .4byte 0xFE0FFFFF
_02236900: .4byte 0xC1FFFFFF
_02236904: .4byte 0x000001FE
_02236908: .4byte 0x020F5670
	thumb_func_end ov80_02236734

	thumb_func_start ov80_0223690C
ov80_0223690C: @ 0x0223690C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldrb r0, [r5, #0xf]
	adds r4, r1, #0
	bl ov80_02236A88
	adds r1, r0, #0
	ldr r0, [r5, #4]
	bl FUN_020518D8
	adds r7, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02074904
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	movs r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x18]
	adds r0, r7, #0
	bl FUN_02051D18
	movs r0, #0x53
	movs r1, #0x12
	lsls r0, r0, #2
	str r1, [r7, r0]
	adds r0, r0, #4
	str r1, [r7, r0]
	ldr r0, [r5, #4]
	bl FUN_0206DD2C
	adds r4, r0, #0
	ldrb r1, [r5, #0xe]
	ldr r0, [r7, #4]
	bl FUN_020744DC
	ldrb r0, [r5, #0xe]
	movs r6, #0
	cmp r0, #0
	ble _022369B8
_02236964:
	adds r1, r5, r6
	adds r1, #0x2a
	ldrb r1, [r1]
	ldr r0, [sp, #8]
	bl FUN_02074644
	adds r1, r4, #0
	bl FUN_0207188C
	adds r0, r4, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0x32
	bls _022369A6
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x32
	bl FUN_0206FD00
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #8
	add r2, sp, #0xc
	bl FUN_0206EC40
	adds r0, r4, #0
	bl FUN_0206E250
_022369A6:
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_02051C9C
	ldrb r0, [r5, #0xe]
	adds r6, r6, #1
	cmp r6, r0
	blt _02236964
_022369B8:
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r7, #0
	bl FUN_02052580
	ldr r0, [r5, #4]
	adds r1, r5, #0
	str r0, [sp]
	ldrb r2, [r5, #0xe]
	adds r0, r7, #0
	adds r1, #0x78
	movs r3, #1
	bl ov80_02236A34
	movs r2, #0
	adds r1, r7, #0
	movs r0, #7
_022369DC:
	adds r2, r2, #1
	str r0, [r1, #0x34]
	adds r1, #0x34
	cmp r2, #4
	blt _022369DC
	ldrb r0, [r5, #0xf]
	cmp r0, #2
	beq _022369F6
	cmp r0, #3
	beq _02236A18
	cmp r0, #6
	beq _02236A18
	b _02236A2C
_022369F6:
	ldr r0, [r5, #4]
	movs r1, #0xa6
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	lsls r1, r1, #2
	adds r1, r5, r1
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x1d
	lsls r2, r3, #4
	adds r2, r3, r2
	lsls r2, r2, #4
	adds r1, r1, r2
	ldrb r2, [r5, #0xe]
	adds r0, r7, #0
	movs r3, #2
	bl ov80_02236A34
_02236A18:
	ldr r0, [r5, #4]
	movs r1, #0x62
	str r0, [sp]
	ldrb r2, [r5, #0xe]
	lsls r1, r1, #2
	adds r0, r7, #0
	adds r1, r5, r1
	movs r3, #3
	bl ov80_02236A34
_02236A2C:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0223690C

	thumb_func_start ov80_02236A34
ov80_02236A34: @ 0x02236A34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x28]
	str r0, [sp, #4]
	adds r5, r1, #0
	adds r7, r2, #0
	str r3, [sp, #8]
	str r4, [sp]
	bl ov80_0222A480
	ldr r0, [sp, #0x28]
	bl FUN_0206DD2C
	adds r4, r0, #0
	movs r6, #0
	cmp r7, #0
	ble _02236A7E
	ldr r0, [sp, #8]
	adds r5, #0x30
	lsls r1, r0, #2
	ldr r0, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #0xc]
_02236A62:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x78
	bl ov80_0222A140
	ldr r0, [sp, #0xc]
	adds r1, r4, #0
	ldr r0, [r0, #4]
	bl FUN_02074524
	adds r6, r6, #1
	adds r5, #0x38
	cmp r6, r7
	blt _02236A62
_02236A7E:
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02236A34

	thumb_func_start ov80_02236A88
ov80_02236A88: @ 0x02236A88
	cmp r0, #6
	bhi _02236AB6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02236A98: @ jump table
	.2byte _02236AA6 - _02236A98 - 2 @ case 0
	.2byte _02236AAA - _02236A98 - 2 @ case 1
	.2byte _02236AAE - _02236A98 - 2 @ case 2
	.2byte _02236AB2 - _02236A98 - 2 @ case 3
	.2byte _02236AA6 - _02236A98 - 2 @ case 4
	.2byte _02236AB6 - _02236A98 - 2 @ case 5
	.2byte _02236AB2 - _02236A98 - 2 @ case 6
_02236AA6:
	movs r0, #0x81
	bx lr
_02236AAA:
	movs r0, #0x83
	bx lr
_02236AAE:
	movs r0, #0xcb
	bx lr
_02236AB2:
	movs r0, #0x8f
	bx lr
_02236AB6:
	movs r0, #0x81
	bx lr
	.align 2, 0
	thumb_func_end ov80_02236A88

	thumb_func_start ov80_02236ABC
ov80_02236ABC: @ 0x02236ABC
	ldrb r3, [r0, #0x10]
	movs r2, #8
	bics r3, r2
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x1c
	orrs r2, r3
	strb r2, [r0, #0x10]
	ldr r2, _02236AD4 @ =0x0000083E
	strh r1, [r0, r2]
	bx lr
	.align 2, 0
_02236AD4: .4byte 0x0000083E
	thumb_func_end ov80_02236ABC

	thumb_func_start ov80_02236AD8
ov80_02236AD8: @ 0x02236AD8
	ldrb r0, [r0, #0x10]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	bne _02236AE6
	ldrh r0, [r1]
	cmp r0, #0
	beq _02236AEA
_02236AE6:
	movs r0, #1
	bx lr
_02236AEA:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov80_02236AD8

	thumb_func_start ov80_02236AF0
ov80_02236AF0: @ 0x02236AF0
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236AFE
	movs r0, #0x81
	pop {r3, pc}
_02236AFE:
	movs r0, #0xcd
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02236AF0

	thumb_func_start ov80_02236B04
ov80_02236B04: @ 0x02236B04
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236B12
	movs r0, #0x80
	pop {r3, pc}
_02236B12:
	movs r0, #0xcc
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02236B04

	thumb_func_start ov80_02236B18
ov80_02236B18: @ 0x02236B18
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236B26
	ldr r0, _02236B2C @ =0x000002D3
	pop {r3, pc}
_02236B26:
	movs r0, #0xb5
	lsls r0, r0, #2
	pop {r3, pc}
	.align 2, 0
_02236B2C: .4byte 0x000002D3
	thumb_func_end ov80_02236B18

	thumb_func_start ov80_02236B30
ov80_02236B30: @ 0x02236B30
	push {r3, r4, r5, lr}
	cmp r0, #3
	beq _02236B3A
	cmp r0, #6
	bne _02236B74
_02236B3A:
	movs r0, #0
	bl FUN_02034818
	adds r5, r0, #0
	bne _02236B48
	bl GF_AssertFail
_02236B48:
	movs r0, #1
	bl FUN_02034818
	adds r4, r0, #0
	bne _02236B56
	bl GF_AssertFail
_02236B56:
	adds r0, r5, #0
	bl FUN_0202907C
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_0202907C
	cmp r5, #0
	beq _02236B6C
	cmp r0, #0
	bne _02236B70
_02236B6C:
	movs r0, #0
	pop {r3, r4, r5, pc}
_02236B70:
	movs r0, #1
	pop {r3, r4, r5, pc}
_02236B74:
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02236B30

	thumb_func_start ov80_02236B78
ov80_02236B78: @ 0x02236B78
	push {r3, r4, r5, lr}
	cmp r1, #8
	blo _02236B80
	movs r1, #7
_02236B80:
	cmp r0, #0
	bne _02236B9C
	movs r0, #7
	adds r3, r2, #1
	muls r0, r1, r0
	adds r0, r3, r0
	cmp r0, #0x15
	bne _02236B94
	ldr r0, _02236BCC @ =0x00000135
	pop {r3, r4, r5, pc}
_02236B94:
	cmp r0, #0x31
	bne _02236B9C
	ldr r0, _02236BD0 @ =0x00000136
	pop {r3, r4, r5, pc}
_02236B9C:
	cmp r2, #6
	beq _02236BA4
	cmp r2, #0xd
	bne _02236BB2
_02236BA4:
	ldr r0, _02236BD4 @ =0x0223C47C
	lsls r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02236BD8 @ =0x0223C47E
	ldrh r0, [r0, r1]
	subs r5, r0, r4
	b _02236BBE
_02236BB2:
	ldr r0, _02236BDC @ =0x0223C478
	lsls r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02236BE0 @ =0x0223C47A
	ldrh r0, [r0, r1]
	subs r5, r0, r4
_02236BBE:
	bl FUN_0201FD44
	adds r1, r5, #0
	blx FUN_020F2998
	adds r0, r4, r1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02236BCC: .4byte 0x00000135
_02236BD0: .4byte 0x00000136
_02236BD4: .4byte 0x0223C47C
_02236BD8: .4byte 0x0223C47E
_02236BDC: .4byte 0x0223C478
_02236BE0: .4byte 0x0223C47A
	thumb_func_end ov80_02236B78

	thumb_func_start ov80_02236BE4
ov80_02236BE4: @ 0x02236BE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r3, #0
	movs r4, #0
	adds r5, r6, #0
_02236BF4:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, r4, #0
	bl ov80_02236B78
	movs r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _02236C1A
	lsls r0, r4, #1
	ldrh r3, [r6, r0]
	adds r2, r6, #0
_02236C0C:
	ldrh r0, [r2]
	cmp r0, r3
	beq _02236C1A
	adds r1, r1, #1
	adds r2, r2, #2
	cmp r1, r4
	blt _02236C0C
_02236C1A:
	cmp r1, r4
	bne _02236C22
	adds r5, r5, #2
	adds r4, r4, #1
_02236C22:
	cmp r4, r7
	blt _02236BF4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02236BE4

	thumb_func_start ov80_02236C2C
ov80_02236C2C: @ 0x02236C2C
	push {r4, lr}
	cmp r1, #0
	bne _02236C38
	ldr r2, _02236C6C @ =0x0223C508
	ldr r1, _02236C70 @ =0x0223DD38
	b _02236C3C
_02236C38:
	ldr r2, _02236C74 @ =0x0223C558
	ldr r1, _02236C70 @ =0x0223DD38
_02236C3C:
	movs r4, #0xa
	str r2, [r1]
	movs r2, #0
	cmp r4, #0
	ble _02236C58
	ldr r1, _02236C70 @ =0x0223DD38
	ldr r3, [r1]
_02236C4A:
	ldrh r1, [r3]
	cmp r0, r1
	blt _02236C58
	adds r2, r2, #1
	adds r3, #8
	cmp r2, r4
	blt _02236C4A
_02236C58:
	cmp r2, r4
	blt _02236C62
	bl GF_AssertFail
	subs r2, r4, #1
_02236C62:
	ldr r0, _02236C70 @ =0x0223DD38
	ldr r1, [r0]
	lsls r0, r2, #3
	adds r0, r1, r0
	pop {r4, pc}
	.align 2, 0
_02236C6C: .4byte 0x0223C508
_02236C70: .4byte 0x0223DD38
_02236C74: .4byte 0x0223C558
	thumb_func_end ov80_02236C2C

	thumb_func_start ov80_02236C78
ov80_02236C78: @ 0x02236C78
	cmp r0, #8
	blt _02236C7E
	movs r0, #7
_02236C7E:
	cmp r1, #0
	bne _02236C8A
	ldr r1, _02236C94 @ =0x0223C508
	lsls r0, r0, #3
	adds r0, r1, r0
	bx lr
_02236C8A:
	ldr r1, _02236C98 @ =0x0223C4B8
	lsls r0, r0, #3
	adds r0, r1, r0
	bx lr
	nop
_02236C94: .4byte 0x0223C508
_02236C98: .4byte 0x0223C4B8
	thumb_func_end ov80_02236C78

	thumb_func_start ov80_02236C9C
ov80_02236C9C: @ 0x02236C9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	str r0, [sp]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #4]
	str r0, [sp, #0xa0]
	ldr r0, [sp, #0xa8]
	adds r7, r2, #0
	str r0, [sp, #0xa8]
	adds r0, r3, #0
	str r3, [sp, #8]
	cmp r0, #6
	ble _02236CBA
	bl GF_AssertFail
_02236CBA:
	ldr r0, [sp, #0xa0]
	movs r4, #0
	ldrh r1, [r0, #4]
	ldrh r0, [r0, #2]
	subs r0, r1, r0
	add r1, sp, #0x88
	ldrh r5, [r1, #0x1c]
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	cmp r5, #0
	beq _02236CE8
	ldr r3, _02236DD0 @ =0x0223C464
	movs r0, #5
	adds r2, r4, #0
_02236CD6:
	ldr r1, [r3]
	cmp r5, r1
	bgt _02236CE0
	adds r0, r2, #0
	b _02236CE8
_02236CE0:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #5
	blo _02236CD6
_02236CE8:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _02236DC8
	add r1, sp, #0x24
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x98]
	str r1, [sp, #0x10]
	ldr r1, [sp, #8]
	subs r0, r1, r0
	str r0, [sp, #0xc]
_02236CFC:
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blt _02236D30
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #7]
	cmp r0, #1
	bne _02236D30
	ldr r0, [sp, #0xa0]
	ldrh r1, [r0, #0xc]
	ldrh r0, [r0, #0xa]
	subs r0, r1, r0
	str r0, [sp, #0x1c]
	bl FUN_0201FD44
	ldr r1, [sp, #0x1c]
	adds r1, r1, #1
	blx FUN_020F2998
	ldr r0, [sp, #0xa0]
	ldrh r0, [r0, #0xc]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #0xe]
	str r0, [sp, #0x20]
	b _02236D4A
_02236D30:
	bl FUN_0201FD44
	ldr r1, [sp, #0x1c]
	adds r1, r1, #1
	blx FUN_020F2998
	ldr r0, [sp, #0xa0]
	ldrh r0, [r0, #4]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #6]
	str r0, [sp, #0x20]
_02236D4A:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	movs r2, #0xcd
	bl ov80_02229EF4
	movs r2, #0
	cmp r4, #0
	ble _02236D78
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x14]
	ldrh r1, [r1]
	ldrh r3, [r3, #0xc]
	add r0, sp, #0x24
_02236D64:
	ldrh r5, [r0]
	cmp r5, r1
	beq _02236D78
	ldrh r5, [r0, #0xc]
	cmp r5, r3
	beq _02236D78
	adds r2, r2, #1
	adds r0, #0x10
	cmp r2, r4
	blt _02236D64
_02236D78:
	cmp r2, r4
	bne _02236DC2
	movs r3, #0
	cmp r7, #0
	ble _02236DA4
	ldr r2, [sp, #0x14]
	ldr r5, [sp, #0x14]
	ldrh r2, [r2]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp]
	ldr r1, [sp, #4]
_02236D8E:
	ldrh r5, [r0]
	cmp r2, r5
	beq _02236DA4
	ldrh r5, [r1]
	cmp r6, r5
	beq _02236DA4
	adds r3, r3, #1
	adds r0, r0, #2
	adds r1, r1, #2
	cmp r3, r7
	blt _02236D8E
_02236DA4:
	cmp r3, r7
	bne _02236DC2
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	strh r1, [r0]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0xa8]
	strb r1, [r0, r4]
	ldr r0, [sp, #0x14]
	adds r4, r4, #1
	adds r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, r0, #2
	str r0, [sp, #0x10]
_02236DC2:
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02236CFC
_02236DC8:
	movs r0, #0
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_02236DD0: .4byte 0x0223C464
	thumb_func_end ov80_02236C9C

	thumb_func_start ov80_02236DD4
ov80_02236DD4: @ 0x02236DD4
	cmp r0, #3
	bhi _02236DF4
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02236DE4: @ jump table
	.2byte _02236DEC - _02236DE4 - 2 @ case 0
	.2byte _02236DEC - _02236DE4 - 2 @ case 1
	.2byte _02236DF0 - _02236DE4 - 2 @ case 2
	.2byte _02236DF0 - _02236DE4 - 2 @ case 3
_02236DEC:
	movs r0, #3
	bx lr
_02236DF0:
	movs r0, #2
	bx lr
_02236DF4:
	movs r0, #0
	bx lr
	thumb_func_end ov80_02236DD4

	thumb_func_start ov80_02236DF8
ov80_02236DF8: @ 0x02236DF8
	cmp r0, #3
	bhi _02236E20
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02236E08: @ jump table
	.2byte _02236E10 - _02236E08 - 2 @ case 0
	.2byte _02236E10 - _02236E08 - 2 @ case 1
	.2byte _02236E14 - _02236E08 - 2 @ case 2
	.2byte _02236E14 - _02236E08 - 2 @ case 3
_02236E10:
	movs r0, #3
	bx lr
_02236E14:
	cmp r1, #0
	bne _02236E1C
	movs r0, #2
	bx lr
_02236E1C:
	movs r0, #4
	bx lr
_02236E20:
	movs r0, #0
	bx lr
	thumb_func_end ov80_02236DF8

	thumb_func_start ov80_02236E24
ov80_02236E24: @ 0x02236E24
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r2, #0
	adds r4, r3, #0
	bl ov80_02236C78
	ldr r1, [sp, #0x2c]
	str r5, [sp]
	cmp r1, #0
	bne _02236E56
	movs r1, #0xb
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x18]
	movs r3, #6
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	bl ov80_02236C9C
	b _02236E70
_02236E56:
	movs r2, #0xb
	str r2, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x18]
	movs r2, #6
	adds r3, r2, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	adds r0, r1, #0
	bl ov80_02236C9C
_02236E70:
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl ov80_0222A52C
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_02236E24

	thumb_func_start ov80_02236E90
ov80_02236E90: @ 0x02236E90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xa8]
	adds r7, r3, #0
	str r0, [sp, #0xa8]
	adds r0, r1, #0
	adds r1, r2, #0
	bl ov80_02236C2C
	str r0, [sp, #0x18]
	movs r0, #0
	mov ip, r0
	ldr r0, [sp, #0xa8]
	cmp r0, #0
	ble _02236EE4
	add r4, sp, #0x34
	add r5, sp, #0x1c
_02236EB4:
	adds r6, r7, #0
	add r3, sp, #0x4c
	movs r2, #7
_02236EBA:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02236EBA
	add r0, sp, #0x1c
	ldrh r0, [r0, #0x30]
	adds r7, #0x38
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x15
	strh r0, [r4]
	add r0, sp, #0x1c
	ldrh r0, [r0, #0x32]
	adds r4, r4, #2
	strh r0, [r5]
	mov r0, ip
	adds r1, r0, #1
	ldr r0, [sp, #0xa8]
	adds r5, r5, #2
	mov ip, r1
	cmp r1, r0
	blt _02236EB4
_02236EE4:
	ldr r0, [sp, #0x98]
	ldr r2, [sp, #0xa8]
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r1, sp, #0x1c
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xa0]
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, sp, #0x34
	bl ov80_02236C9C
	ldr r0, [sp, #0xa4]
	ldr r1, [sp, #0x98]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0xa0]
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x9c]
	movs r3, #0
	bl ov80_0222A52C
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02236E90

	thumb_func_start ov80_02236F24
ov80_02236F24: @ 0x02236F24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	adds r5, r0, #0
	ldrb r0, [r5, #4]
	adds r6, r1, #0
	bl ov80_02236DD4
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	movs r1, #0
	bl ov80_02236DF8
	str r0, [sp, #0xc]
	ldr r0, _022370EC @ =0x000004D4
	ldr r0, [r5, r0]
	bl FUN_02090C1C
	ldr r0, _022370F0 @ =0x000004D8
	ldr r0, [r5, r0]
	bl FUN_02090C1C
	ldrb r0, [r5, #4]
	bl ov80_022370F4
	adds r1, r0, #0
	movs r0, #0xb
	bl FUN_020518D8
	ldr r1, [r6, #0xc]
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0x18]
	movs r1, #0
	bl FUN_02051D18
	movs r0, #0x53
	movs r1, #0x13
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl FUN_020744DC
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	movs r6, #0
	cmp r0, #0
	ble _02236FB6
_02236F94:
	ldr r0, _022370EC @ =0x000004D4
	adds r1, r6, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r1, r7, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	bl FUN_02051C9C
	ldr r0, [sp, #0x10]
	adds r6, r6, #1
	cmp r6, r0
	blt _02236F94
_02236FB6:
	adds r0, r7, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_02052580
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	movs r2, #0xb
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1, #0x18]
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	add r1, sp, #0x14
	movs r3, #1
	bl ov80_0222A480
	ldrb r0, [r5, #4]
	movs r1, #0
	bl ov80_02236DF8
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_020744DC
	movs r7, #0
	adds r6, r4, #0
_02236FFC:
	adds r0, r5, #0
	bl ov80_02237264
	str r0, [r6, #0x34]
	adds r7, r7, #1
	adds r6, #0x34
	cmp r7, #4
	blt _02236FFC
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	ldr r0, [sp, #0xc]
	movs r6, #0
	cmp r0, #0
	ble _0223703E
_0223701C:
	ldr r0, _022370F0 @ =0x000004D8
	adds r1, r6, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r1, r7, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	bl FUN_02051C9C
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	cmp r6, r0
	blt _0223701C
_0223703E:
	adds r0, r7, #0
	bl FUN_0201AB0C
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _0223704E
	cmp r0, #3
	bne _022370E4
_0223704E:
	adds r0, r4, #0
	bl FUN_02052580
	bl FUN_0203769C
	movs r1, #1
	subs r0, r1, r0
	bl FUN_02034818
	movs r1, #1
	lsls r1, r1, #8
	ldr r1, [r4, r1]
	bl FUN_02028EE4
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	movs r2, #0xb
	adds r1, r1, #7
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1, #0x18]
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	add r1, sp, #0x14
	movs r3, #3
	bl ov80_0222A480
	ldrb r0, [r5, #4]
	movs r1, #0
	bl ov80_02236DF8
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020744DC
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _022370DE
	adds r6, r0, #0
_022370B6:
	ldr r0, _022370F0 @ =0x000004D8
	adds r1, r6, #0
	ldr r0, [r5, r0]
	bl FUN_02074644
	adds r1, r7, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #3
	bl FUN_02051C9C
	ldr r0, [sp, #8]
	adds r6, r6, #1
	adds r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _022370B6
_022370DE:
	adds r0, r7, #0
	bl FUN_0201AB0C
_022370E4:
	adds r0, r4, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_022370EC: .4byte 0x000004D4
_022370F0: .4byte 0x000004D8
	thumb_func_end ov80_02236F24

	thumb_func_start ov80_022370F4
ov80_022370F4: @ 0x022370F4
	cmp r0, #3
	bhi _0223711C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237104: @ jump table
	.2byte _0223710C - _02237104 - 2 @ case 0
	.2byte _02237110 - _02237104 - 2 @ case 1
	.2byte _02237114 - _02237104 - 2 @ case 2
	.2byte _02237118 - _02237104 - 2 @ case 3
_0223710C:
	movs r0, #0x81
	bx lr
_02237110:
	movs r0, #0x83
	bx lr
_02237114:
	movs r0, #0x8f
	bx lr
_02237118:
	movs r0, #0x8f
	bx lr
_0223711C:
	movs r0, #0x81
	bx lr
	thumb_func_end ov80_022370F4

	thumb_func_start ov80_02237120
ov80_02237120: @ 0x02237120
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0223712A
	movs r0, #0x32
	bx lr
_0223712A:
	movs r0, #0x64
	bx lr
	.align 2, 0
	thumb_func_end ov80_02237120

	thumb_func_start ov80_02237130
ov80_02237130: @ 0x02237130
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	movs r3, #0xa
	lsls r3, r3, #6
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r0, #0xcd
	adds r1, r3, #0
	adds r2, r3, #0
	str r0, [sp, #0xc]
	adds r0, r5, r3
	subs r1, #0x2c
	subs r2, #0x20
	subs r3, #0x18
	adds r1, r5, r1
	adds r2, r5, r2
	adds r3, r5, r3
	bl ov80_0222A52C
	ldr r0, _022371A8 @ =0x000004D4
	ldr r0, [r5, r0]
	bl FUN_020744D0
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r0, #0xa
	lsls r0, r0, #6
	movs r7, #0
	adds r4, r5, r0
_02237178:
	adds r0, r5, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022371AC @ =0x000004F8
	ldr r1, _022371A8 @ =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	bl ov80_0222A3BC
	adds r7, r7, #1
	adds r4, #0x38
	cmp r7, #6
	blt _02237178
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022371A8: .4byte 0x000004D4
_022371AC: .4byte 0x000004F8
	thumb_func_end ov80_02237130

	thumb_func_start ov80_022371B0
ov80_022371B0: @ 0x022371B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	adds r5, r0, #0
	ldr r0, _02237248 @ =0x000004D4
	ldr r0, [r5, r0]
	bl FUN_02074640
	adds r4, r0, #0
	cmp r4, #2
	ble _022371D4
	ldr r6, _02237248 @ =0x000004D4
_022371C6:
	ldr r0, [r5, r6]
	subs r1, r4, #1
	bl FUN_0207456C
	subs r4, r4, #1
	cmp r4, #2
	bgt _022371C6
_022371D4:
	ldr r3, _0223724C @ =0x00000584
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0xb
	adds r2, r3, #0
	str r0, [sp, #8]
	movs r0, #0xcd
	adds r1, r5, r3
	adds r2, #0xc
	adds r3, #0x14
	str r0, [sp, #0xc]
	add r0, sp, #0x14
	adds r2, r5, r2
	adds r3, r5, r3
	bl ov80_0222A52C
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x10]
	add r6, sp, #0x14
	adds r4, r5, #0
_02237208:
	adds r0, r5, #0
	bl ov80_02237120
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r7, #0
	bl ov80_0222A140
	ldr r0, _02237250 @ =0x000004F8
	ldr r1, _02237248 @ =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r7, #0
	bl ov80_0222A3BC
	ldr r0, _0223724C @ =0x00000584
	adds r6, #0x38
	ldrh r1, [r4, r0]
	subs r0, #0x98
	strh r1, [r4, r0]
	ldr r0, [sp, #0x10]
	adds r4, r4, #2
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	blt _02237208
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_02237248: .4byte 0x000004D4
_0223724C: .4byte 0x00000584
_02237250: .4byte 0x000004F8
	thumb_func_end ov80_022371B0

	thumb_func_start ov80_02237254
ov80_02237254: @ 0x02237254
	cmp r0, #2
	beq _0223725C
	cmp r0, #3
	bne _02237260
_0223725C:
	movs r0, #1
	bx lr
_02237260:
	movs r0, #0
	bx lr
	thumb_func_end ov80_02237254

	thumb_func_start ov80_02237264
ov80_02237264: @ 0x02237264
	push {r3, lr}
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _02237284
	ldrb r1, [r0, #6]
	lsls r1, r1, #1
	adds r1, r0, r1
	ldrh r2, [r1, #0x18]
	ldr r1, _022372B0 @ =0x0000FECB
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _02237284
	movs r0, #7
	pop {r3, pc}
_02237284:
	bl ov80_022372B4
	adds r0, r0, #1
	movs r1, #7
	cmp r0, #4
	bhi _022372AC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223729C: @ jump table
	.2byte _022372AC - _0223729C - 2 @ case 0
	.2byte _022372A6 - _0223729C - 2 @ case 1
	.2byte _022372A6 - _0223729C - 2 @ case 2
	.2byte _022372AA - _0223729C - 2 @ case 3
	.2byte _022372AA - _0223729C - 2 @ case 4
_022372A6:
	movs r1, #0
	b _022372AC
_022372AA:
	movs r1, #1
_022372AC:
	adds r0, r1, #0
	pop {r3, pc}
	.align 2, 0
_022372B0: .4byte 0x0000FECB
	thumb_func_end ov80_02237264

	thumb_func_start ov80_022372B4
ov80_022372B4: @ 0x022372B4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #4]
	ldrh r4, [r5, #0xe]
	bl ov80_02237254
	cmp r0, #1
	bne _022372D0
	ldr r0, _022372D4 @ =0x0000057E
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0xe]
	cmp r1, r0
	bls _022372D0
	adds r4, r1, #0
_022372D0:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_022372D4: .4byte 0x0000057E
	thumb_func_end ov80_022372B4

	thumb_func_start ov80_022372D8
ov80_022372D8: @ 0x022372D8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r3, #0
	adds r0, r2, #0
	str r1, [sp]
	movs r4, #0
	bl ov80_022379C0
	lsls r1, r5, #0x19
	lsls r0, r0, #0x18
	ldr r2, [sp, #0x18]
	lsrs r1, r1, #0x17
	adds r5, r2, r1
	ldr r1, _0223732C @ =0x0223C698
	lsrs r0, r0, #0x14
	adds r7, r1, r0
	ldr r1, _02237330 @ =0x0223C608
	lsls r0, r6, #3
	adds r6, r1, r0
_022372FE:
	bl FUN_0201FD44
	movs r1, #0xc
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhs _02237316
	lsls r0, r0, #1
	ldrh r0, [r7, r0]
	b _0223731E
_02237316:
	lsls r0, r0, #1
	adds r0, r6, r0
	subs r0, #0x10
	ldrh r0, [r0]
_0223731E:
	strh r0, [r5]
	ldr r0, [sp]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, r0
	blt _022372FE
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223732C: .4byte 0x0223C698
_02237330: .4byte 0x0223C608
	thumb_func_end ov80_022372D8

	thumb_func_start ov80_02237334
ov80_02237334: @ 0x02237334
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, [sp, #0x34]
	str r1, [sp]
	str r0, [sp, #0x34]
	movs r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrb r4, [r0, #0x10]
	adds r6, r2, #0
	lsls r0, r4, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	adds r0, r3, #0
	bl ov80_022379C0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	cmp r5, #0
	bne _0223738E
	movs r0, #0xa
	adds r1, r4, #1
	muls r0, r6, r0
	adds r0, r1, r0
	cmp r0, #0x32
	bne _0223737A
	ldr r0, [sp, #8]
	ldr r2, _0223743C @ =0x00000133
	lsls r1, r0, #1
	ldr r0, [sp, #0x34]
	add sp, #0x1c
	strh r2, [r0, r1]
	pop {r4, r5, r6, r7, pc}
_0223737A:
	cmp r0, #0xaa
	bne _0223738E
	ldr r0, [sp, #8]
	movs r2, #0x4d
	lsls r1, r0, #1
	ldr r0, [sp, #0x34]
	lsls r2, r2, #2
	strh r2, [r0, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0223738E:
	ldr r0, [sp, #8]
	lsls r1, r0, #1
	ldr r0, [sp, #0x34]
	adds r0, r0, r1
	str r0, [sp, #0xc]
_02237398:
	bl FUN_0201FD44
	movs r1, #0x4b
	lsls r1, r1, #2
	blx FUN_020F2BA4
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	str r4, [sp, #0x14]
	adds r5, r1, r0
	lsls r0, r5, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	lsls r1, r0, #4
	ldr r0, _02237440 @ =0x0223C698
	adds r7, r0, r1
_022373BC:
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x18]
	ldrh r6, [r1, r0]
	ldr r0, _02237444 @ =0x0223C738
	lsls r1, r4, #1
	ldrh r0, [r0, r1]
	cmp r6, r0
	bne _022373F6
	movs r1, #0
	cmp r5, #0
	ble _022373E2
	ldr r2, [sp, #0x34]
_022373D4:
	ldrh r0, [r2]
	cmp r4, r0
	beq _022373E2
	adds r1, r1, #1
	adds r2, r2, #2
	cmp r1, r5
	blt _022373D4
_022373E2:
	cmp r1, r5
	bne _022373F6
	ldr r0, [sp, #0xc]
	strh r4, [r0]
	adds r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	adds r0, r0, #1
	str r0, [sp, #0x10]
	b _0223742E
_022373F6:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0x4b
	lsls r0, r0, #2
	cmp r4, r0
	blo _02237406
	movs r4, #0
_02237406:
	ldr r0, [sp, #0x14]
	cmp r4, r0
	bne _022373BC
_0223740C:
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x1d
	subs r2, r2, r1
	movs r0, #0x1d
	rors r2, r0
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	ldrh r2, [r7, r0]
	cmp r6, r2
	beq _0223740C
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x18]
	strh r2, [r1, r0]
	b _022373BC
_0223742E:
	adds r1, r0, #0
	ldr r0, [sp]
	cmp r1, r0
	blt _02237398
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223743C: .4byte 0x00000133
_02237440: .4byte 0x0223C698
_02237444: .4byte 0x0223C738
	thumb_func_end ov80_02237334

	thumb_func_start ov80_02237448
ov80_02237448: @ 0x02237448
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x28]
	movs r7, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x30]
	ldr r6, [sp, #0x2c]
	str r0, [sp, #0x30]
	lsls r0, r3, #0x19
	lsrs r4, r0, #0x18
	adds r0, r2, #0
	str r7, [sp, #0xc]
	bl ov80_022379C0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _022374CE
	ldr r3, _022375B8 @ =0x0223C990
	adds r2, r7, #0
_02237476:
	lsls r0, r2, #1
	ldrh r1, [r3, r0]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bne _02237484
	adds r5, r2, #0
	b _02237490
_02237484:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _022375BC @ =0x000001DD
	cmp r2, r0
	blo _02237476
_02237490:
	ldr r0, _022375BC @ =0x000001DD
	cmp r2, r0
	bne _0223749A
	adds r5, r0, #0
	subs r5, #0x65
_0223749A:
	ldr r0, _022375C0 @ =0x0223C5A8
	movs r1, #0
_0223749E:
	lsls r2, r1, #2
	adds r2, r0, r2
	ldrh r2, [r2, #2]
	cmp r5, r2
	blo _022374B2
	adds r1, r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #4
	blo _0223749E
_022374B2:
	cmp r1, #4
	bne _022374B8
	movs r1, #3
_022374B8:
	ldr r0, [sp, #0x30]
	cmp r0, #2
	bne _022374C4
	ldr r0, _022375C4 @ =0x0223C5B4
	str r0, [sp, #0x10]
	b _022374D6
_022374C4:
	ldr r2, _022375C0 @ =0x0223C5A8
	lsls r0, r1, #2
	adds r0, r2, r0
	str r0, [sp, #0x10]
	b _022374D6
_022374CE:
	ldr r1, _022375C8 @ =0x0223C5E0
	lsls r0, r2, #2
	adds r0, r1, r0
	str r0, [sp, #0x10]
_022374D6:
	ldr r0, [sp, #0x10]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	subs r0, r1, r0
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl FUN_0201FD44
	adds r1, r5, #0
	blx FUN_020F2998
	ldr r0, [sp, #0x10]
	ldrh r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	str r2, [sp, #8]
	ldr r0, [sp]
	cmp r0, #0
	ble _022375B4
	subs r0, r4, #2
	lsls r0, r0, #1
	mov ip, r0
	lsls r0, r4, #1
	adds r5, r6, r0
_02237510:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _02237532
	movs r0, #0
	cmp r4, #0
	ble _02237542
	adds r1, r2, #1
_0223751E:
	lsls r3, r0, #1
	ldrh r3, [r6, r3]
	cmp r1, r3
	beq _02237542
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r4
	blt _0223751E
	b _02237542
_02237532:
	mov r1, ip
	ldrh r1, [r6, r1]
	adds r0, r2, #1
	cmp r0, r1
	bne _02237540
	movs r0, #0
	b _02237542
_02237540:
	adds r0, r4, #0
_02237542:
	cmp r0, r4
	bne _0223758A
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _02237562
	ldr r0, _022375B8 @ =0x0223C990
	lsls r1, r2, #1
	ldrh r1, [r0, r1]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	beq _0223758A
	lsls r0, r7, #1
	adds r1, r2, #1
	strh r1, [r5, r0]
	adds r7, r7, #1
	b _0223758A
_02237562:
	ldr r1, _022375CC @ =0x0223CD4A
	lsls r0, r2, #2
	adds r3, r1, r0
	ldrh r1, [r1, r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _02237576
	ldrh r1, [r3, #2]
	cmp r0, r1
	bne _0223758A
_02237576:
	ldr r0, _022375B8 @ =0x0223C990
	lsls r1, r2, #1
	ldrh r1, [r0, r1]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	beq _0223758A
	lsls r0, r7, #1
	adds r1, r2, #1
	strh r1, [r5, r0]
	adds r7, r7, #1
_0223758A:
	ldr r1, [sp, #0x10]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r1, #2]
	adds r0, r2, #1
	cmp r0, r1
	blt _022375A4
	ldr r0, [sp, #0x10]
	ldrh r0, [r0]
	subs r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_022375A4:
	ldr r0, [sp, #8]
	cmp r2, r0
	bne _022375AE
	movs r0, #1
	str r0, [sp, #0xc]
_022375AE:
	ldr r0, [sp]
	cmp r7, r0
	blt _02237510
_022375B4:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022375B8: .4byte 0x0223C990
_022375BC: .4byte 0x000001DD
_022375C0: .4byte 0x0223C5A8
_022375C4: .4byte 0x0223C5B4
_022375C8: .4byte 0x0223C5E0
_022375CC: .4byte 0x0223CD4A
	thumb_func_end ov80_02237448

	thumb_func_start ov80_022375D0
ov80_022375D0: @ 0x022375D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	adds r5, r0, #0
	ldrb r0, [r5, #5]
	adds r6, r1, #0
	lsls r0, r0, #0x19
	lsrs r7, r0, #0x18
	ldrb r0, [r5, #4]
	bl ov80_0223787C
	str r0, [sp, #0x18]
	ldrb r0, [r5, #4]
	bl ov80_02237888
	str r0, [sp, #0x10]
	ldr r0, _02237818 @ =0x000006FC
	ldr r0, [r5, r0]
	bl FUN_02074904
	str r0, [sp, #0x1c]
	bl FUN_02090C1C
	ldrb r0, [r5, #4]
	bl ov80_02237850
	adds r1, r0, #0
	movs r0, #0xb
	bl FUN_020518D8
	ldr r1, [r6, #0xc]
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0x18]
	movs r1, #0
	bl FUN_02051D18
	movs r0, #0x53
	movs r1, #0x16
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x18]
	bl FUN_020744DC
	movs r0, #0xb
	bl FUN_0206DD2C
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	movs r6, #0
	cmp r0, #0
	ble _02237668
_02237642:
	movs r1, #0x26
	adds r2, r5, r6
	lsls r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [sp, #0x1c]
	bl FUN_02074644
	ldr r1, [sp, #0x20]
	bl FUN_0207188C
	ldr r1, [sp, #0x20]
	adds r0, r4, #0
	movs r2, #0
	bl FUN_02051C9C
	ldr r0, [sp, #0x18]
	adds r6, r6, #1
	cmp r6, r0
	blt _02237642
_02237668:
	ldr r0, [sp, #0x20]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_02052580
	lsls r0, r7, #1
	str r0, [sp, #0x28]
	adds r6, r5, #0
	ldr r1, [sp, #0x28]
	adds r6, #0x18
	ldrh r1, [r6, r1]
	add r0, sp, #0x34
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	add r1, sp, #0x34
	movs r3, #1
	bl ov80_0222A480
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x10]
	bl FUN_020744DC
	ldr r1, _0223781C @ =0x000006F5
	ldrb r2, [r5, #4]
	ldrb r0, [r5, r1]
	adds r1, #0xf
	adds r3, r5, r1
	lsls r1, r2, #3
	adds r1, r2, r1
	adds r1, r3, r1
	bl FUN_02030BD0
	str r0, [sp, #0x24]
	ldrb r0, [r5, #4]
	cmp r0, #2
	bne _022376C6
	movs r0, #9
	str r0, [sp, #0x24]
_022376C6:
	ldr r2, [sp, #0x24]
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov80_02237980
	movs r2, #0
	adds r1, r4, #0
_022376D4:
	adds r2, r2, #1
	str r0, [r1, #0x34]
	adds r1, #0x34
	cmp r2, #4
	blt _022376D4
	movs r0, #0x38
	muls r0, r7, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	movs r3, #0x29
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #0xce
	str r0, [sp, #8]
	ldr r2, [sp, #0x28]
	lsls r3, r3, #4
	adds r1, r5, r3
	ldr r0, [sp, #0x14]
	ldrh r2, [r6, r2]
	subs r3, #0x28
	adds r0, r1, r0
	adds r6, r5, r3
	lsls r3, r7, #1
	ldr r1, [sp, #0x24]
	adds r3, r6, r3
	bl ov80_02237894
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _0223776E
	movs r0, #0x29
	lsls r0, r0, #4
	adds r0, r5, r0
	str r0, [sp, #0x2c]
	movs r0, #0x38
	muls r0, r7, r0
	str r0, [sp, #0x30]
_0223772C:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov80_02237820
	cmp r0, #0
	bne _0223772C
	ldr r1, [sp, #0x24]
	adds r0, r5, #0
	bl ov80_022378F8
	adds r2, r0, #0
	lsls r2, r2, #0x18
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	lsrs r2, r2, #0x18
	adds r0, r1, r0
	adds r1, r6, #0
	bl ov80_0222A140
	adds r0, r6, #0
	bl FUN_020722D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl FUN_02051C9C
	ldr r0, [sp, #0xc]
	adds r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _0223772C
_0223776E:
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _0223777E
	cmp r0, #3
	bne _02237810
_0223777E:
	adds r0, r4, #0
	bl FUN_02052580
	bl FUN_0203769C
	movs r1, #1
	subs r0, r1, r0
	bl FUN_02034818
	movs r1, #1
	lsls r1, r1, #8
	ldr r1, [r4, r1]
	bl FUN_02028EE4
	adds r1, r7, #1
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1, #0x18]
	add r0, sp, #0x34
	movs r2, #0xb
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0x10]
	adds r0, r4, #0
	add r1, sp, #0x34
	movs r3, #3
	bl ov80_0222A480
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x10]
	bl FUN_020744DC
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
_022377D0:
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov80_02237820
	cmp r0, #0
	bne _022377D0
	ldr r1, [sp, #0x24]
	adds r0, r5, #0
	bl ov80_022378F8
	adds r2, r0, #0
	movs r0, #0x29
	lsls r0, r0, #4
	adds r1, r5, r0
	ldr r0, [sp, #0x14]
	lsls r2, r2, #0x18
	adds r0, r1, r0
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	bl ov80_0222A140
	adds r0, r6, #0
	bl FUN_020722D4
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl FUN_02051C9C
	adds r0, r6, #0
	bl FUN_0201AB0C
_02237810:
	adds r0, r4, #0
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	nop
_02237818: .4byte 0x000006FC
_0223781C: .4byte 0x000006F5
	thumb_func_end ov80_022375D0

	thumb_func_start ov80_02237820
ov80_02237820: @ 0x02237820
	push {r4, lr}
	movs r2, #0x38
	muls r2, r1, r2
	movs r1, #0x2a
	lsls r1, r1, #4
	adds r1, r0, r1
	ldr r4, [r1, r2]
	ldr r3, _0223784C @ =0x0003D0A9
	cmp r4, r3
	bls _02237838
	subs r3, r4, r3
	b _0223783A
_02237838:
	adds r3, r4, r3
_0223783A:
	str r3, [r1, r2]
	adds r3, r0, r2
	movs r0, #0xa7
	lsls r0, r0, #2
	ldr r0, [r3, r0]
	ldr r1, [r1, r2]
	bl FUN_02070068
	pop {r4, pc}
	.align 2, 0
_0223784C: .4byte 0x0003D0A9
	thumb_func_end ov80_02237820

	thumb_func_start ov80_02237850
ov80_02237850: @ 0x02237850
	cmp r0, #3
	bhi _02237878
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237860: @ jump table
	.2byte _02237868 - _02237860 - 2 @ case 0
	.2byte _0223786C - _02237860 - 2 @ case 1
	.2byte _02237870 - _02237860 - 2 @ case 2
	.2byte _02237874 - _02237860 - 2 @ case 3
_02237868:
	movs r0, #0x81
	bx lr
_0223786C:
	movs r0, #0x83
	bx lr
_02237870:
	movs r0, #0x8f
	bx lr
_02237874:
	movs r0, #0x8f
	bx lr
_02237878:
	movs r0, #0x81
	bx lr
	thumb_func_end ov80_02237850

	thumb_func_start ov80_0223787C
ov80_0223787C: @ 0x0223787C
	cmp r0, #1
	bne _02237884
	movs r0, #2
	bx lr
_02237884:
	movs r0, #1
	bx lr
	thumb_func_end ov80_0223787C

	thumb_func_start ov80_02237888
ov80_02237888: @ 0x02237888
	cmp r0, #1
	bne _02237890
	movs r0, #2
	bx lr
_02237890:
	movs r0, #1
	bx lr
	thumb_func_end ov80_02237888

	thumb_func_start ov80_02237894
ov80_02237894: @ 0x02237894
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [sp, #0x2c]
	adds r5, r3, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	ldr r7, [sp, #0x28]
	str r0, [sp, #0x30]
	ldr r0, _022378F4 @ =0x00000133
	cmp r2, r0
	bne _022378B0
	movs r0, #0x1f
	b _022378C0
_022378B0:
	adds r0, r0, #1
	cmp r2, r0
	bne _022378BA
	movs r0, #0x1f
	b _022378C0
_022378BA:
	adds r0, r1, #0
	bl ov80_0223796C
_022378C0:
	movs r4, #0
	cmp r7, #0
	ble _022378EE
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
_022378CC:
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0xc]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	adds r2, r4, #0
	str r0, [sp, #8]
	ldrh r1, [r5]
	adds r0, r6, #0
	bl ov80_0222A4EC
	adds r4, r4, #1
	adds r5, r5, #2
	adds r6, #0x38
	cmp r4, r7
	blt _022378CC
_022378EE:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022378F4: .4byte 0x00000133
	thumb_func_end ov80_02237894

	thumb_func_start ov80_022378F8
ov80_022378F8: @ 0x022378F8
	push {r3, lr}
	ldrb r1, [r0, #5]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x17
	adds r1, r0, r1
	ldrh r2, [r1, #0x18]
	ldr r1, _0223791C @ =0x0000FECD
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _02237916
	bl ov80_022379C8
	pop {r3, pc}
_02237916:
	ldrb r0, [r0, #7]
	pop {r3, pc}
	nop
_0223791C: .4byte 0x0000FECD
	thumb_func_end ov80_022378F8

	thumb_func_start ov80_02237920
ov80_02237920: @ 0x02237920
	ldr r1, _02237928 @ =0x0223D4C0
	ldrb r0, [r1, r0]
	bx lr
	nop
_02237928: .4byte 0x0223D4C0
	thumb_func_end ov80_02237920

	thumb_func_start ov80_0223792C
ov80_0223792C: @ 0x0223792C
	cmp r0, #2
	beq _02237934
	cmp r0, #3
	bne _02237938
_02237934:
	movs r0, #1
	bx lr
_02237938:
	movs r0, #0
	bx lr
	thumb_func_end ov80_0223792C

	thumb_func_start ov80_0223793C
ov80_0223793C: @ 0x0223793C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02237968 @ =0x000006FC
	ldr r0, [r4, r0]
	bl FUN_02074904
	movs r1, #0x26
	lsls r1, r1, #4
	ldrb r1, [r4, r1]
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0xa
	blx FUN_020F2998
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4, pc}
	nop
_02237968: .4byte 0x000006FC
	thumb_func_end ov80_0223793C

	thumb_func_start ov80_0223796C
ov80_0223796C: @ 0x0223796C
	push {r3, lr}
	bl ov80_022379C0
	lsls r1, r0, #2
	ldr r0, _0223797C @ =0x0223C5B9
	ldrb r0, [r0, r1]
	pop {r3, pc}
	nop
_0223797C: .4byte 0x0223C5B9
	thumb_func_end ov80_0223796C

	thumb_func_start ov80_02237980
ov80_02237980: @ 0x02237980
	adds r2, r2, #1
	cmp r2, #8
	blt _0223798A
	movs r2, #7
	b _02237994
_0223798A:
	cmp r2, #4
	blt _02237992
	movs r2, #1
	b _02237994
_02237992:
	movs r2, #0
_02237994:
	ldrb r3, [r0, #4]
	cmp r3, #0
	bne _022379B0
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x17
	adds r0, r0, r1
	ldrh r1, [r0, #0x18]
	ldr r0, _022379BC @ =0x0000FECD
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _022379B0
	movs r2, #7
_022379B0:
	cmp r3, #2
	bne _022379B6
	movs r2, #7
_022379B6:
	adds r0, r2, #0
	bx lr
	nop
_022379BC: .4byte 0x0000FECD
	thumb_func_end ov80_02237980

	thumb_func_start ov80_022379C0
ov80_022379C0: @ 0x022379C0
	cmp r0, #0xa
	blo _022379C6
	movs r0, #9
_022379C6:
	bx lr
	thumb_func_end ov80_022379C0

	thumb_func_start ov80_022379C8
ov80_022379C8: @ 0x022379C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _02237A34 @ =0x000006FC
	ldr r0, [r5, r0]
	bl FUN_02074904
	movs r1, #0x26
	lsls r1, r1, #4
	ldrb r1, [r5, r1]
	adds r6, r0, #0
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrb r0, [r5, #4]
	bl ov80_0223787C
	cmp r0, #2
	bne _02237A16
	ldr r1, _02237A38 @ =0x00000261
	adds r0, r6, #0
	ldrb r1, [r5, r1]
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bhi _02237A12
	adds r4, r0, #0
_02237A12:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_02237A16:
	ldrb r0, [r5, #4]
	bl ov80_0223792C
	cmp r0, #1
	bne _02237A2E
	ldr r0, _02237A3C @ =0x00000D84
	ldrh r0, [r5, r0]
	cmp r4, r0
	bhi _02237A2A
	adds r4, r0, #0
_02237A2A:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_02237A2E:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02237A34: .4byte 0x000006FC
_02237A38: .4byte 0x00000261
_02237A3C: .4byte 0x00000D84
	thumb_func_end ov80_022379C8

	thumb_func_start ov80_02237A40
ov80_02237A40: @ 0x02237A40
	push {r3, lr}
	cmp r0, #0
	beq _02237A58
	lsls r0, r0, #0xc
	blx FUN_020F21C0
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _02237A66
_02237A58:
	lsls r0, r0, #0xc
	blx FUN_020F21C0
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_02237A66:
	blx FUN_020F2104
	blx FUN_020CCBEC
	pop {r3, pc}
	thumb_func_end ov80_02237A40

	thumb_func_start ov80_02237A70
ov80_02237A70: @ 0x02237A70
	push {r3, r4, r5, lr}
	cmp r0, #0
	bne _02237A8E
	movs r0, #7
	adds r3, r2, #1
	muls r0, r1, r0
	adds r0, r3, r0
	cmp r0, #0x15
	bne _02237A86
	ldr r0, _02237AC4 @ =0x00000139
	pop {r3, r4, r5, pc}
_02237A86:
	cmp r0, #0x31
	bne _02237A8E
	ldr r0, _02237AC8 @ =0x0000013A
	pop {r3, r4, r5, pc}
_02237A8E:
	cmp r1, #8
	blo _02237A94
	movs r1, #7
_02237A94:
	cmp r2, #6
	beq _02237A9C
	cmp r2, #0xd
	bne _02237AAA
_02237A9C:
	ldr r0, _02237ACC @ =0x0223D4D8
	lsls r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02237AD0 @ =0x0223D4DA
	ldrh r0, [r0, r1]
	subs r5, r0, r4
	b _02237AB6
_02237AAA:
	ldr r0, _02237AD4 @ =0x0223D4D4
	lsls r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02237AD8 @ =0x0223D4D6
	ldrh r0, [r0, r1]
	subs r5, r0, r4
_02237AB6:
	bl FUN_0201FD44
	adds r1, r5, #0
	blx FUN_020F2998
	adds r0, r4, r1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02237AC4: .4byte 0x00000139
_02237AC8: .4byte 0x0000013A
_02237ACC: .4byte 0x0223D4D8
_02237AD0: .4byte 0x0223D4DA
_02237AD4: .4byte 0x0223D4D4
_02237AD8: .4byte 0x0223D4D6
	thumb_func_end ov80_02237A70

	thumb_func_start ov80_02237ADC
ov80_02237ADC: @ 0x02237ADC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r3, #0
	movs r4, #0
	adds r5, r6, #0
_02237AEC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, r4, #0
	bl ov80_02237A70
	movs r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _02237B12
	lsls r0, r4, #1
	ldrh r3, [r6, r0]
	adds r2, r6, #0
_02237B04:
	ldrh r0, [r2]
	cmp r0, r3
	beq _02237B12
	adds r1, r1, #1
	adds r2, r2, #2
	cmp r1, r4
	blt _02237B04
_02237B12:
	cmp r1, r4
	bne _02237B1A
	adds r5, r5, #2
	adds r4, r4, #1
_02237B1A:
	cmp r4, r7
	blt _02237AEC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02237ADC

	thumb_func_start ov80_02237B24
ov80_02237B24: @ 0x02237B24
	push {r3, lr}
	cmp r0, #3
	bhi _02237B4E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237B36: @ jump table
	.2byte _02237B3E - _02237B36 - 2 @ case 0
	.2byte _02237B3E - _02237B36 - 2 @ case 1
	.2byte _02237B42 - _02237B36 - 2 @ case 2
	.2byte _02237B42 - _02237B36 - 2 @ case 3
_02237B3E:
	movs r0, #3
	pop {r3, pc}
_02237B42:
	cmp r1, #0
	bne _02237B4A
	movs r0, #2
	pop {r3, pc}
_02237B4A:
	movs r0, #4
	pop {r3, pc}
_02237B4E:
	bl GF_AssertFail
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02237B24

	thumb_func_start ov80_02237B58
ov80_02237B58: @ 0x02237B58
	push {r3, lr}
	cmp r0, #3
	bhi _02237B82
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237B6A: @ jump table
	.2byte _02237B72 - _02237B6A - 2 @ case 0
	.2byte _02237B72 - _02237B6A - 2 @ case 1
	.2byte _02237B76 - _02237B6A - 2 @ case 2
	.2byte _02237B76 - _02237B6A - 2 @ case 3
_02237B72:
	movs r0, #3
	pop {r3, pc}
_02237B76:
	cmp r1, #0
	bne _02237B7E
	movs r0, #2
	pop {r3, pc}
_02237B7E:
	movs r0, #4
	pop {r3, pc}
_02237B82:
	bl GF_AssertFail
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02237B58

	thumb_func_start ov80_02237B8C
ov80_02237B8C: @ 0x02237B8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	adds r6, r1, #0
	movs r1, #0
	bl ov80_02237B24
	str r0, [sp, #0x10]
	ldrb r0, [r5, #0x10]
	movs r1, #0
	bl ov80_02237B58
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	bl FUN_02090C1C
	ldrb r0, [r5, #0x10]
	bl ov80_02237D5C
	adds r1, r0, #0
	movs r0, #0xb
	bl FUN_020518D8
	ldr r1, [r6, #0xc]
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0x18]
	movs r1, #0
	bl FUN_02051D18
	movs r0, #0x53
	movs r1, #0x15
	lsls r0, r0, #2
	str r1, [r4, r0]
	adds r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl FUN_020744DC
	bl FUN_0203769C
	cmp r0, #0
	bne _02237BF0
	movs r6, #0
	b _02237BF2
_02237BF0:
	movs r6, #2
_02237BF2:
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _02237C2A
_02237C04:
	ldr r0, [r5, #0x28]
	adds r1, r6, #0
	bl FUN_02074644
	adds r1, r7, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	bl FUN_02051C9C
	ldr r0, [sp, #0x14]
	adds r6, r6, #1
	adds r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02237C04
_02237C2A:
	adds r0, r7, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_02052580
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x18
	movs r2, #0xb
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1, #0x30]
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	add r1, sp, #0x18
	movs r3, #1
	bl ov80_0222A480
	ldrb r0, [r5, #0x10]
	movs r1, #0
	bl ov80_02237B58
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_020744DC
	movs r7, #0
	adds r6, r4, #0
_02237C70:
	adds r0, r5, #0
	bl ov80_02237E88
	str r0, [r6, #0x34]
	adds r7, r7, #1
	adds r6, #0x34
	cmp r7, #4
	blt _02237C70
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	ldr r0, [sp, #0xc]
	movs r6, #0
	cmp r0, #0
	ble _02237CB0
_02237C90:
	ldr r0, [r5, #0x2c]
	adds r1, r6, #0
	bl FUN_02074644
	adds r1, r7, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	bl FUN_02051C9C
	ldr r0, [sp, #0xc]
	adds r6, r6, #1
	cmp r6, r0
	blt _02237C90
_02237CB0:
	adds r0, r7, #0
	bl FUN_0201AB0C
	ldrb r0, [r5, #0x10]
	cmp r0, #2
	beq _02237CC0
	cmp r0, #3
	bne _02237D54
_02237CC0:
	adds r0, r4, #0
	bl FUN_02052580
	bl FUN_0203769C
	movs r1, #1
	subs r0, r1, r0
	bl FUN_02034818
	movs r1, #1
	lsls r1, r1, #8
	ldr r1, [r4, r1]
	bl FUN_02028EE4
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x18
	movs r2, #0xb
	adds r1, r1, #7
	lsls r1, r1, #1
	adds r1, r5, r1
	ldrh r1, [r1, #0x30]
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	add r1, sp, #0x18
	movs r3, #3
	bl ov80_0222A480
	ldrb r0, [r5, #0x10]
	movs r1, #0
	bl ov80_02237B58
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020744DC
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _02237D4E
	adds r6, r0, #0
_02237D28:
	ldr r0, [r5, #0x2c]
	adds r1, r6, #0
	bl FUN_02074644
	adds r1, r7, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #3
	bl FUN_02051C9C
	ldr r0, [sp, #8]
	adds r6, r6, #1
	adds r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _02237D28
_02237D4E:
	adds r0, r7, #0
	bl FUN_0201AB0C
_02237D54:
	adds r0, r4, #0
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02237B8C

	thumb_func_start ov80_02237D5C
ov80_02237D5C: @ 0x02237D5C
	cmp r0, #3
	bhi _02237D84
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237D6C: @ jump table
	.2byte _02237D74 - _02237D6C - 2 @ case 0
	.2byte _02237D78 - _02237D6C - 2 @ case 1
	.2byte _02237D7C - _02237D6C - 2 @ case 2
	.2byte _02237D80 - _02237D6C - 2 @ case 3
_02237D74:
	movs r0, #0x81
	bx lr
_02237D78:
	movs r0, #0x83
	bx lr
_02237D7C:
	movs r0, #0x8f
	bx lr
_02237D80:
	movs r0, #0x8f
	bx lr
_02237D84:
	movs r0, #0x81
	bx lr
	thumb_func_end ov80_02237D5C

	thumb_func_start ov80_02237D88
ov80_02237D88: @ 0x02237D88
	movs r0, #0x32
	bx lr
	thumb_func_end ov80_02237D88

	thumb_func_start ov80_02237D8C
ov80_02237D8C: @ 0x02237D8C
	cmp r0, #2
	beq _02237D94
	cmp r0, #3
	bne _02237D98
_02237D94:
	movs r0, #1
	bx lr
_02237D98:
	movs r0, #0
	bx lr
	thumb_func_end ov80_02237D8C

	thumb_func_start ov80_02237D9C
ov80_02237D9C: @ 0x02237D9C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl FUN_02074640
	adds r6, r0, #0
	movs r4, #0
	cmp r6, #0
	ble _02237DF2
_02237DAC:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0xac
	movs r2, #0
	adds r5, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _02237DEC
	adds r0, r5, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02237DDE
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xa3
	add r2, sp, #0
	bl FUN_0206EC40
_02237DDE:
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xa0
	add r2, sp, #0
	bl FUN_0206EC40
_02237DEC:
	adds r4, r4, #1
	cmp r4, r6
	blt _02237DAC
_02237DF2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02237D9C

	thumb_func_start ov80_02237DF4
ov80_02237DF4: @ 0x02237DF4
	push {r4, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	adds r4, r1, #0
	bl FUN_02028E9C
	movs r3, #0
	adds r1, r0, #0
	str r3, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #4
	bl FUN_0207217C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_02237DF4

	thumb_func_start ov80_02237E18
ov80_02237E18: @ 0x02237E18
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r1, r4, #0
	bl ov80_02237DF4
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02074524
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02237E18

	thumb_func_start ov80_02237E30
ov80_02237E30: @ 0x02237E30
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl FUN_020744D0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	bl ov80_02237B58
	str r0, [sp]
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	ldr r0, [sp]
	movs r7, #0
	cmp r0, #0
	ble _02237E7E
	movs r0, #0xa2
	lsls r0, r0, #2
	adds r4, r5, r0
_02237E5A:
	adds r0, r5, #0
	bl ov80_02237D88
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x2c]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov80_02237E18
	ldr r0, [sp]
	adds r7, r7, #1
	adds r4, #0x38
	cmp r7, r0
	blt _02237E5A
_02237E7E:
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02237E30

	thumb_func_start ov80_02237E88
ov80_02237E88: @ 0x02237E88
	push {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _02237EA8
	ldrb r1, [r0, #0x11]
	lsls r1, r1, #1
	adds r1, r0, r1
	ldrh r2, [r1, #0x30]
	ldr r1, _02237ED4 @ =0x0000FEC7
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _02237EA8
	movs r0, #7
	pop {r3, pc}
_02237EA8:
	bl ov80_02237ED8
	adds r0, r0, #1
	movs r1, #7
	cmp r0, #4
	bhi _02237ED0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02237EC0: @ jump table
	.2byte _02237ED0 - _02237EC0 - 2 @ case 0
	.2byte _02237ECA - _02237EC0 - 2 @ case 1
	.2byte _02237ECA - _02237EC0 - 2 @ case 2
	.2byte _02237ECE - _02237EC0 - 2 @ case 3
	.2byte _02237ECE - _02237EC0 - 2 @ case 4
_02237ECA:
	movs r1, #0
	b _02237ED0
_02237ECE:
	movs r1, #1
_02237ED0:
	adds r0, r1, #0
	pop {r3, pc}
	.align 2, 0
_02237ED4: .4byte 0x0000FEC7
	thumb_func_end ov80_02237E88

	thumb_func_start ov80_02237ED8
ov80_02237ED8: @ 0x02237ED8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	ldrh r4, [r5, #0x16]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02237EF4
	ldr r0, _02237EF8 @ =0x00000A12
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0x16]
	cmp r1, r0
	bls _02237EF4
	adds r4, r1, #0
_02237EF4:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02237EF8: .4byte 0x00000A12
	thumb_func_end ov80_02237ED8

	thumb_func_start ov80_02237EFC
ov80_02237EFC: @ 0x02237EFC
	push {r3, r4, r5, lr}
	sub sp, #0x48
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	bl ov80_02237ED8
	adds r1, r0, #0
	add r0, sp, #0xc
	bl ov80_02237F3C
	movs r0, #6
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #3
	lsls r1, r4, #0x18
	str r0, [sp, #8]
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	add r2, sp, #0xc
	movs r3, #0xb
	bl FUN_0201C4C4
	lsls r1, r4, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x18
	bl FUN_0201EFBC
	add sp, #0x48
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02237EFC

	thumb_func_start ov80_02237F3C
ov80_02237F3C: @ 0x02237F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	adds r0, r1, #0
	bl ov80_02237F9C
	movs r3, #0
	add r4, sp, #4
	movs r1, #4
_02237F4E:
	strb r3, [r4]
	subs r2, r1, r3
	strb r2, [r4, #5]
	adds r3, r3, #1
	adds r4, r4, #1
	cmp r3, #5
	blo _02237F4E
	movs r1, #0x60
	movs r7, #0
	muls r1, r0, r1
	movs r5, #1
	adds r1, #0x10
	adds r2, r7, #0
	lsls r5, r5, #0xa
_02237F6A:
	ldr r4, [sp]
	lsls r6, r2, #1
	movs r0, #0
	add r3, sp, #4
	adds r4, r4, r6
_02237F74:
	ldrb r6, [r3]
	adds r6, r6, r1
	strh r6, [r4]
	cmp r0, #5
	blo _02237F84
	ldrh r6, [r4]
	orrs r6, r5
	strh r6, [r4]
_02237F84:
	adds r0, r0, #1
	adds r3, r3, #1
	adds r4, r4, #2
	cmp r0, #0xa
	blo _02237F74
	adds r7, r7, #1
	adds r1, #0x20
	adds r2, #0xa
	cmp r7, #3
	blo _02237F6A
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02237F3C

	thumb_func_start ov80_02237F9C
ov80_02237F9C: @ 0x02237F9C
	cmp r0, #8
	blo _02237FA2
	movs r0, #7
_02237FA2:
	bx lr
	thumb_func_end ov80_02237F9C

	thumb_func_start ov80_02237FA4
ov80_02237FA4: @ 0x02237FA4
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	bl FUN_0205C1F0
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_0205C1F0
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	adds r3, r6, #0
	bl FUN_02031248
	adds r0, r4, #0
	bl FUN_0205C218
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_0205C218
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_020310BC
	adds r1, r0, r6
	ldr r0, _02238030 @ =0x0000270F
	cmp r1, r0
	ble _0223800E
	adds r0, r4, #0
	bl FUN_0205C218
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_0205C218
	bl FUN_0205C268
	adds r2, r0, #0
	ldr r3, _02238030 @ =0x0000270F
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_02031108
	pop {r3, r4, r5, r6, r7, pc}
_0223800E:
	adds r0, r4, #0
	bl FUN_0205C218
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_0205C218
	bl FUN_0205C268
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	adds r3, r6, #0
	bl FUN_02031228
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238030: .4byte 0x0000270F
	thumb_func_end ov80_02237FA4

	thumb_func_start ov80_02238034
ov80_02238034: @ 0x02238034
	push {r3, r4, r5, lr}
	cmp r0, #0
	bne _02238054
	movs r0, #7
	adds r3, r2, #1
	muls r0, r1, r0
	adds r0, r3, r0
	cmp r0, #0x15
	bne _0223804A
	ldr r0, _0223808C @ =0x00000137
	pop {r3, r4, r5, pc}
_0223804A:
	cmp r0, #0x31
	bne _02238054
	movs r0, #0x4e
	lsls r0, r0, #2
	pop {r3, r4, r5, pc}
_02238054:
	cmp r1, #8
	blo _0223805A
	movs r1, #7
_0223805A:
	cmp r2, #6
	beq _02238062
	cmp r2, #0xd
	bne _02238070
_02238062:
	ldr r0, _02238090 @ =0x0223D518
	lsls r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02238094 @ =0x0223D51A
	ldrh r0, [r0, r1]
	subs r5, r0, r4
	b _0223807C
_02238070:
	ldr r0, _02238098 @ =0x0223D514
	lsls r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _0223809C @ =0x0223D516
	ldrh r0, [r0, r1]
	subs r5, r0, r4
_0223807C:
	bl FUN_0201FD44
	adds r1, r5, #0
	blx FUN_020F2998
	adds r0, r4, r1
	pop {r3, r4, r5, pc}
	nop
_0223808C: .4byte 0x00000137
_02238090: .4byte 0x0223D518
_02238094: .4byte 0x0223D51A
_02238098: .4byte 0x0223D514
_0223809C: .4byte 0x0223D516
	thumb_func_end ov80_02238034

	thumb_func_start ov80_022380A0
ov80_022380A0: @ 0x022380A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	adds r7, r3, #0
	movs r4, #0
	adds r5, r6, #0
_022380B0:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r2, r4, #0
	bl ov80_02238034
	movs r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _022380D6
	lsls r0, r4, #1
	ldrh r3, [r6, r0]
	adds r2, r6, #0
_022380C8:
	ldrh r0, [r2]
	cmp r0, r3
	beq _022380D6
	adds r1, r1, #1
	adds r2, r2, #2
	cmp r1, r4
	blt _022380C8
_022380D6:
	cmp r1, r4
	bne _022380DE
	adds r5, r5, #2
	adds r4, r4, #1
_022380DE:
	cmp r4, r7
	blt _022380B0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_022380A0

	thumb_func_start ov80_022380E8
ov80_022380E8: @ 0x022380E8
	push {r3, lr}
	cmp r0, #3
	bhi _02238112
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022380FA: @ jump table
	.2byte _02238102 - _022380FA - 2 @ case 0
	.2byte _02238102 - _022380FA - 2 @ case 1
	.2byte _02238106 - _022380FA - 2 @ case 2
	.2byte _02238106 - _022380FA - 2 @ case 3
_02238102:
	movs r0, #3
	pop {r3, pc}
_02238106:
	cmp r1, #0
	bne _0223810E
	movs r0, #2
	pop {r3, pc}
_0223810E:
	movs r0, #4
	pop {r3, pc}
_02238112:
	bl GF_AssertFail
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_022380E8

	thumb_func_start ov80_0223811C
ov80_0223811C: @ 0x0223811C
	push {r3, lr}
	cmp r0, #3
	bhi _02238146
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223812E: @ jump table
	.2byte _02238136 - _0223812E - 2 @ case 0
	.2byte _02238136 - _0223812E - 2 @ case 1
	.2byte _0223813A - _0223812E - 2 @ case 2
	.2byte _0223813A - _0223812E - 2 @ case 3
_02238136:
	movs r0, #3
	pop {r3, pc}
_0223813A:
	cmp r1, #0
	bne _02238142
	movs r0, #2
	pop {r3, pc}
_02238142:
	movs r0, #4
	pop {r3, pc}
_02238146:
	bl GF_AssertFail
	movs r0, #3
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0223811C

	thumb_func_start ov80_02238150
ov80_02238150: @ 0x02238150
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	adds r7, r0, #0
	ldrb r0, [r7, #0x10]
	adds r5, r1, #0
	movs r1, #0
	bl ov80_022380E8
	str r0, [sp, #0x10]
	ldrb r0, [r7, #0x10]
	movs r1, #0
	bl ov80_0223811C
	str r0, [sp, #0xc]
	ldrb r0, [r7, #0x10]
	bl ov80_02238344
	adds r1, r0, #0
	movs r0, #0xb
	bl FUN_020518D8
	ldr r1, [r5, #0xc]
	adds r4, r0, #0
	str r1, [sp]
	ldr r1, [r5, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r5, #8]
	ldr r3, [r5, #0x18]
	movs r1, #0
	bl FUN_02051D18
	movs r1, #0x53
	lsls r1, r1, #2
	movs r2, #0x14
	str r2, [r4, r1]
	adds r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r7, #0x14]
	adds r1, #0x28
	str r0, [r4, r1]
	ldr r0, [r7, #0x74]
	ldr r1, [r7, #0x70]
	str r0, [sp, #0x14]
	ldrb r0, [r7, #0x13]
	str r1, [sp, #0x18]
	cmp r0, #0x1b
	bne _022381B4
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r1, [sp, #0x14]
_022381B4:
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl FUN_020744DC
	bl FUN_0203769C
	cmp r0, #0
	bne _022381C8
	movs r5, #0
	b _022381CA
_022381C8:
	movs r5, #2
_022381CA:
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _02238202
_022381DC:
	ldr r0, [sp, #0x18]
	adds r1, r5, #0
	bl FUN_02074644
	adds r1, r6, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl FUN_02051C9C
	ldr r0, [sp, #0x1c]
	adds r5, r5, #1
	adds r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x1c]
	cmp r1, r0
	blt _022381DC
_02238202:
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_02052580
	ldrb r1, [r7, #0x11]
	add r0, sp, #0x20
	movs r2, #0xb
	lsls r1, r1, #1
	adds r1, r7, r1
	adds r1, #0x78
	ldrh r1, [r1]
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	add r1, sp, #0x20
	movs r3, #1
	bl ov80_0222A480
	ldrb r0, [r7, #0x10]
	movs r1, #0
	bl ov80_0223811C
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_020744DC
	movs r6, #0
	adds r5, r4, #0
_0223824A:
	adds r0, r7, #0
	bl ov80_02238444
	str r0, [r5, #0x34]
	adds r6, r6, #1
	adds r5, #0x34
	cmp r6, #4
	blt _0223824A
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	ldr r0, [sp, #0xc]
	movs r5, #0
	cmp r0, #0
	ble _0223828A
_0223826A:
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	bl FUN_02074644
	adds r1, r6, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl FUN_02051C9C
	ldr r0, [sp, #0xc]
	adds r5, r5, #1
	cmp r5, r0
	blt _0223826A
_0223828A:
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldrb r0, [r7, #0x10]
	cmp r0, #2
	beq _0223829A
	cmp r0, #3
	bne _02238330
_0223829A:
	adds r0, r4, #0
	bl FUN_02052580
	bl FUN_0203769C
	movs r1, #1
	subs r0, r1, r0
	bl FUN_02034818
	movs r1, #1
	lsls r1, r1, #8
	ldr r1, [r4, r1]
	bl FUN_02028EE4
	ldrb r1, [r7, #0x11]
	add r0, sp, #0x20
	movs r2, #0xb
	adds r1, r1, #7
	lsls r1, r1, #1
	adds r1, r7, r1
	adds r1, #0x78
	ldrh r1, [r1]
	movs r3, #0xcc
	bl ov80_02229F04
	bl FUN_0201AB0C
	movs r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	adds r0, r4, #0
	add r1, sp, #0x20
	movs r3, #3
	bl ov80_0222A480
	ldrb r0, [r7, #0x10]
	movs r1, #0
	bl ov80_0223811C
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020744DC
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _0223832A
	adds r5, r0, #0
_02238304:
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	bl FUN_02074644
	adds r1, r6, #0
	bl FUN_0207188C
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #3
	bl FUN_02051C9C
	ldr r0, [sp, #8]
	adds r5, r5, #1
	adds r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _02238304
_0223832A:
	adds r0, r6, #0
	bl FUN_0201AB0C
_02238330:
	ldr r0, [r7, #0x70]
	bl FUN_02090C1C
	ldr r0, [r7, #0x74]
	bl FUN_02090C1C
	adds r0, r4, #0
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02238150

	thumb_func_start ov80_02238344
ov80_02238344: @ 0x02238344
	cmp r0, #3
	bhi _0223836C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02238354: @ jump table
	.2byte _0223835C - _02238354 - 2 @ case 0
	.2byte _02238360 - _02238354 - 2 @ case 1
	.2byte _02238364 - _02238354 - 2 @ case 2
	.2byte _02238368 - _02238354 - 2 @ case 3
_0223835C:
	movs r0, #0x81
	bx lr
_02238360:
	movs r0, #0x83
	bx lr
_02238364:
	movs r0, #0x8f
	bx lr
_02238368:
	movs r0, #0x8f
	bx lr
_0223836C:
	movs r0, #0x81
	bx lr
	thumb_func_end ov80_02238344

	thumb_func_start ov80_02238370
ov80_02238370: @ 0x02238370
	movs r0, #0x32
	bx lr
	thumb_func_end ov80_02238370

	thumb_func_start ov80_02238374
ov80_02238374: @ 0x02238374
	cmp r0, #2
	beq _0223837C
	cmp r0, #3
	bne _02238380
_0223837C:
	movs r0, #1
	bx lr
_02238380:
	movs r0, #0
	bx lr
	thumb_func_end ov80_02238374

	thumb_func_start ov80_02238384
ov80_02238384: @ 0x02238384
	push {r4, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	adds r4, r1, #0
	bl FUN_02028E9C
	movs r3, #0
	adds r1, r0, #0
	str r3, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #4
	bl FUN_0207217C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_02238384

	thumb_func_start ov80_022383A8
ov80_022383A8: @ 0x022383A8
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r5, r1, #0
	adds r1, r4, #0
	bl ov80_02238384
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02074524
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_022383A8

	thumb_func_start ov80_022383C0
ov80_022383C0: @ 0x022383C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x74]
	bl FUN_020744D0
	ldrb r0, [r5, #0x10]
	movs r1, #1
	bl ov80_0223811C
	str r0, [sp]
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r7, r0, #0
	ldr r0, [sp]
	movs r6, #0
	cmp r0, #0
	ble _02238424
	movs r0, #0x33
	lsls r0, r0, #4
	adds r4, r5, r0
_022383EC:
	adds r0, r5, #0
	bl ov80_02238370
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x74]
	adds r0, r5, #0
	adds r2, r7, #0
	bl ov80_022383A8
	ldr r0, [r5, #0x74]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #6
	add r2, sp, #4
	bl FUN_0206EC40
	ldr r0, [sp]
	adds r6, r6, #1
	adds r4, #0x38
	cmp r6, r0
	blt _022383EC
_02238424:
	adds r0, r7, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_022383C0

	thumb_func_start ov80_02238430
ov80_02238430: @ 0x02238430
	push {r4, lr}
	adds r4, r1, #0
	bl ov80_02238498
	cmp r4, #0x1c
	bne _02238440
	movs r0, #1
	pop {r4, pc}
_02238440:
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov80_02238430

	thumb_func_start ov80_02238444
ov80_02238444: @ 0x02238444
	push {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _02238466
	ldrb r1, [r0, #0x11]
	lsls r1, r1, #1
	adds r1, r0, r1
	adds r1, #0x78
	ldrh r2, [r1]
	ldr r1, _02238494 @ =0x0000FEC9
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _02238466
	movs r0, #7
	pop {r3, pc}
_02238466:
	bl ov80_02238498
	adds r0, r0, #1
	movs r1, #7
	cmp r0, #4
	bhi _0223848E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0223847E: @ jump table
	.2byte _0223848E - _0223847E - 2 @ case 0
	.2byte _02238488 - _0223847E - 2 @ case 1
	.2byte _02238488 - _0223847E - 2 @ case 2
	.2byte _0223848C - _0223847E - 2 @ case 3
	.2byte _0223848C - _0223847E - 2 @ case 4
_02238488:
	movs r1, #0
	b _0223848E
_0223848C:
	movs r1, #1
_0223848E:
	adds r0, r1, #0
	pop {r3, pc}
	nop
_02238494: .4byte 0x0000FEC9
	thumb_func_end ov80_02238444

	thumb_func_start ov80_02238498
ov80_02238498: @ 0x02238498
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x10]
	ldrh r4, [r5, #0x1a]
	bl ov80_02238374
	cmp r0, #1
	bne _022384B4
	ldr r0, _022384B8 @ =0x00000A76
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0x1a]
	cmp r1, r0
	bls _022384B4
	adds r4, r1, #0
_022384B4:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_022384B8: .4byte 0x00000A76
	thumb_func_end ov80_02238498

	thumb_func_start ov80_022384BC
ov80_022384BC: @ 0x022384BC
	cmp r0, #9
	bhs _022384C4
	movs r0, #0
	bx lr
_022384C4:
	cmp r0, #0x12
	bhs _022384CC
	movs r0, #1
	bx lr
_022384CC:
	cmp r0, #0x1b
	bhs _022384D4
	movs r0, #2
	bx lr
_022384D4:
	movs r0, #3
	bx lr
	thumb_func_end ov80_022384BC

	thumb_func_start ov80_022384D8
ov80_022384D8: @ 0x022384D8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x65
	movs r1, #8
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #8
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl ov80_022384FC
	str r0, [r4, #4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_022384D8

	thumb_func_start ov80_022384FC
ov80_022384FC: @ 0x022384FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x65
	movs r1, #0xc
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0xc
	blx FUN_020D4994
	str r5, [r4, #4]
	movs r0, #0
	strh r0, [r4, #8]
	ldr r0, _02238528 @ =ov80_02238530
	ldr r2, _0223852C @ =0x0001368C
	adds r1, r4, #0
	bl FUN_0200E320
	str r0, [r4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02238528: .4byte ov80_02238530
_0223852C: .4byte 0x0001368C
	thumb_func_end ov80_022384FC

	thumb_func_start ov80_02238530
ov80_02238530: @ 0x02238530
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r1, #0
	ldrh r0, [r4, #0xa]
	cmp r0, #2
	bhs _02238544
	adds r0, r0, #1
	add sp, #0x14
	strh r0, [r4, #0xa]
	pop {r3, r4, pc}
_02238544:
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r0, #1
	eors r0, r1
	strh r0, [r4, #8]
	ldrh r1, [r4, #8]
	add r0, sp, #0xc
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov80_0223857C
	movs r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	movs r1, #3
	add r2, sp, #0xc
	movs r3, #0xe
	bl FUN_0201C4C4
	ldr r0, [r4, #4]
	movs r1, #3
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov80_02238530

	thumb_func_start ov80_0223857C
ov80_0223857C: @ 0x0223857C
	push {r4, r5, r6, r7}
	cmp r1, #0
	bne _02238586
	movs r6, #0xc
	b _02238588
_02238586:
	movs r6, #0xe
_02238588:
	movs r1, #0
	movs r3, #0x60
	adds r4, r1, #0
_0223858E:
	lsls r5, r4, #1
	movs r2, #0
	adds r5, r0, r5
_02238594:
	adds r7, r6, r2
	adds r7, r3, r7
	strh r7, [r5]
	adds r2, r2, #1
	adds r5, r5, #2
	cmp r2, #2
	blo _02238594
	adds r1, r1, #1
	adds r3, #0x10
	adds r4, r4, #2
	cmp r1, #2
	blo _0223858E
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov80_0223857C

	thumb_func_start ov80_022385B0
ov80_022385B0: @ 0x022385B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov80_022385C4
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_022385B0

	thumb_func_start ov80_022385C4
ov80_022385C4: @ 0x022385C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_022385C4

	thumb_func_start ov80_022385D8
ov80_022385D8: @ 0x022385D8
	cmp r0, #6
	bhi _0223860C
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022385E8: @ jump table
	.2byte _0223860C - _022385E8 - 2 @ case 0
	.2byte _0223860A - _022385E8 - 2 @ case 1
	.2byte _022385F6 - _022385E8 - 2 @ case 2
	.2byte _022385FA - _022385E8 - 2 @ case 3
	.2byte _022385FE - _022385E8 - 2 @ case 4
	.2byte _02238602 - _022385E8 - 2 @ case 5
	.2byte _02238606 - _022385E8 - 2 @ case 6
_022385F6:
	movs r0, #0x73
	bx lr
_022385FA:
	movs r0, #0x77
	bx lr
_022385FE:
	movs r0, #0x87
	bx lr
_02238602:
	movs r0, #0x7b
	bx lr
_02238606:
	movs r0, #0x8f
	bx lr
_0223860A:
	movs r0, #0x71
_0223860C:
	bx lr
	.align 2, 0
	thumb_func_end ov80_022385D8

	thumb_func_start ov80_02238610
ov80_02238610: @ 0x02238610
	cmp r0, #6
	bhi _02238644
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02238620: @ jump table
	.2byte _02238644 - _02238620 - 2 @ case 0
	.2byte _02238642 - _02238620 - 2 @ case 1
	.2byte _0223862E - _02238620 - 2 @ case 2
	.2byte _02238632 - _02238620 - 2 @ case 3
	.2byte _02238636 - _02238620 - 2 @ case 4
	.2byte _0223863A - _02238620 - 2 @ case 5
	.2byte _0223863E - _02238620 - 2 @ case 6
_0223862E:
	movs r0, #0x66
	bx lr
_02238632:
	movs r0, #0x68
	bx lr
_02238636:
	movs r0, #0x6c
	bx lr
_0223863A:
	movs r0, #0x6a
	bx lr
_0223863E:
	movs r0, #0x6e
	bx lr
_02238642:
	movs r0, #0x64
_02238644:
	bx lr
	.align 2, 0
	thumb_func_end ov80_02238610

	thumb_func_start ov80_02238648
ov80_02238648: @ 0x02238648
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl FUN_02096808
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02028E9C
	adds r7, r0, #0
	movs r0, #0
	adds r4, #0x20
	adds r1, r0, #0
	ldrb r5, [r4]
	bl FUN_0201A0FC
	bl FUN_0201A108
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r1, #1
	lsls r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _02238828 @ =0xFFFFE0FF
	ands r0, r2
	str r0, [r1]
	ldr r0, _0223882C @ =0x04001000
	ldr r3, [r0]
	ands r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _02238830 @ =0xFFFF1FFF
	ands r3, r2
	str r3, [r1]
	ldr r3, [r0]
	adds r1, #0x50
	ands r2, r3
	str r2, [r0]
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x50
	strh r2, [r0]
	ldr r2, _02238834 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	movs r2, #9
	movs r0, #3
	movs r1, #0x65
	lsls r2, r2, #0x10
	bl FUN_0201A910
	movs r0, #0x65
	movs r1, #0xc4
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xc4
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	str r6, [r4, #8]
	adds r0, #0xc1
	ldr r1, _02238838 @ =0x0000FFFF
	strb r5, [r0]
	movs r2, #0
	adds r3, r4, #0
_022386D4:
	adds r0, r3, #0
	adds r0, #0x70
	adds r2, r2, #1
	adds r3, r3, #2
	strh r1, [r0]
	cmp r2, #8
	blt _022386D4
	movs r0, #0x65
	bl ov80_022392DC
	str r0, [r4, #0xc]
	movs r0, #0x65
	bl FUN_020030E8
	str r0, [r4, #4]
	movs r1, #1
	bl FUN_02003B50
	movs r2, #2
	ldr r0, [r4, #4]
	movs r1, #0
	lsls r2, r2, #8
	movs r3, #0x65
	bl FUN_02003120
	movs r1, #1
	ldr r0, [r4, #4]
	lsls r2, r1, #9
	movs r3, #0x65
	bl FUN_02003120
	movs r2, #7
	ldr r0, [r4, #4]
	movs r1, #2
	lsls r2, r2, #6
	movs r3, #0x65
	bl FUN_02003120
	movs r2, #2
	ldr r0, [r4, #4]
	movs r1, #3
	lsls r2, r2, #8
	movs r3, #0x65
	bl FUN_02003120
	movs r0, #0x65
	bl FUN_0201AC88
	str r0, [r4]
	movs r0, #0x40
	movs r1, #0x65
	bl FUN_0202055C
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	ldr r0, [r4]
	adds r1, r5, #0
	bl ov80_02238CD8
	adds r0, r4, #0
	bl ov80_02238F10
	adds r0, r4, #0
	bl ov80_02238FA0
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	adds r0, r4, #0
	bl ov80_02239384
	movs r0, #0x65
	bl ov80_02239960
	str r0, [r4, #0x10]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl ov80_02239004
	ldr r0, _0223883C @ =ov80_02238AB0
	ldr r2, _02238840 @ =0x0000EA60
	adds r1, r4, #0
	bl FUN_0200E320
	adds r1, r4, #0
	adds r1, #0x94
	str r0, [r1]
	ldr r0, _02238844 @ =ov80_02238ABC
	ldr r2, _02238848 @ =0x0000EE48
	adds r1, r4, #0
	bl FUN_0200E320
	adds r1, r4, #0
	adds r1, #0x98
	str r0, [r1]
	ldr r0, _0223884C @ =ov80_02238AC8
	ldr r2, _02238850 @ =0x00013880
	adds r1, r4, #0
	bl FUN_0200E320
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	bl FUN_02022D24
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r5, #0
	movs r1, #3
	bl ov80_0222ACA0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02004AC8
	adds r0, r5, #0
	movs r1, #3
	bl ov80_0222ACA0
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r0, #0
	lsrs r1, r1, #0x10
	bl FUN_02055198
	movs r0, #1
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, _02238854 @ =ov80_02238A7C
	adds r1, r4, #0
	bl FUN_0201A0FC
	ldr r0, _02238858 @ =ov80_02238AAC
	adds r1, r4, #0
	movs r2, #0xa
	bl FUN_0200E33C
	adds r1, r4, #0
	adds r1, #0xa0
	str r0, [r1]
	adds r2, r4, #0
	adds r2, #0xc1
	adds r1, r4, #0
	ldrb r2, [r2]
	adds r0, r4, #0
	adds r1, #0x90
	bl ov80_0222AD9C
	bl FUN_0203A880
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238828: .4byte 0xFFFFE0FF
_0223882C: .4byte 0x04001000
_02238830: .4byte 0xFFFF1FFF
_02238834: .4byte 0x04000304
_02238838: .4byte 0x0000FFFF
_0223883C: .4byte ov80_02238AB0
_02238840: .4byte 0x0000EA60
_02238844: .4byte ov80_02238ABC
_02238848: .4byte 0x0000EE48
_0223884C: .4byte ov80_02238AC8
_02238850: .4byte 0x00013880
_02238854: .4byte ov80_02238A7C
_02238858: .4byte ov80_02238AAC
	thumb_func_end ov80_02238648

	thumb_func_start ov80_0223885C
ov80_0223885C: @ 0x0223885C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02096808
	adds r2, r4, #0
	adds r2, #0xc1
	adds r1, r4, #0
	ldrb r2, [r2]
	adds r0, r4, #0
	adds r1, #0x90
	bl ov80_0222ADB4
	adds r0, r4, #0
	bl ov80_0223927C
	movs r0, #1
	movs r1, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201BB4C
	movs r0, #4
	movs r1, #0
	bl FUN_0201BC28
	ldr r0, [r4]
	movs r1, #4
	bl FUN_0201BB4C
	adds r0, r4, #0
	bl ov80_022393E8
	ldr r0, [r4, #0x10]
	bl ov80_02239980
	bl FUN_020205AC
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_02003150
	ldr r0, [r4, #4]
	movs r1, #1
	bl FUN_02003150
	ldr r0, [r4, #4]
	movs r1, #2
	bl FUN_02003150
	ldr r0, [r4, #4]
	movs r1, #3
	bl FUN_02003150
	ldr r0, [r4, #4]
	bl FUN_02003104
	ldr r0, [r4]
	bl FUN_0201AB0C
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_0200E390
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl FUN_0200E390
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0200E390
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	bl FUN_0200E390
	ldr r0, [r4, #0xc]
	bl ov80_0223937C
	bl FUN_02021238
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022389A4 @ =0xFFFF1FFF
	ands r1, r0
	str r1, [r2]
	ldr r2, _022389A8 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #0x65
	bl FUN_0201A9C4
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	bl FUN_0203A914
	movs r1, #5
	movs r2, #2
	ldr r0, _022389AC @ =0x00007FFF
	lsls r1, r1, #0x18
	lsls r2, r2, #8
	blx FUN_020D4790
	movs r2, #2
	ldr r0, _022389AC @ =0x00007FFF
	ldr r1, _022389B0 @ =0x05000200
	lsls r2, r2, #8
	blx FUN_020D4790
	movs r2, #2
	ldr r0, _022389AC @ =0x00007FFF
	ldr r1, _022389B4 @ =0x05000400
	lsls r2, r2, #8
	blx FUN_020D4790
	movs r2, #2
	ldr r0, _022389AC @ =0x00007FFF
	ldr r1, _022389B8 @ =0x05000600
	lsls r2, r2, #8
	blx FUN_020D4790
	ldr r0, _022389BC @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _022389C0 @ =0x04001050
	strh r1, [r0]
	pop {r4, pc}
	nop
_022389A4: .4byte 0xFFFF1FFF
_022389A8: .4byte 0x04001000
_022389AC: .4byte 0x00007FFF
_022389B0: .4byte 0x05000200
_022389B4: .4byte 0x05000400
_022389B8: .4byte 0x05000600
_022389BC: .4byte 0x04000050
_022389C0: .4byte 0x04001050
	thumb_func_end ov80_0223885C

	thumb_func_start ov80_022389C4
ov80_022389C4: @ 0x022389C4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #0
	movs r7, #6
_022389CC:
	ldr r0, [r6, #8]
	adds r1, r5, #0
	bl FUN_0209686C
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02238A0A
	adds r1, r7, #0
	bl FUN_02228188
	strb r0, [r4, #0x12]
	ldr r0, [r4]
	movs r1, #5
	bl FUN_02228188
	strh r0, [r4, #0xa]
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02228188
	strh r0, [r4, #0xe]
	ldr r0, [r4]
	movs r1, #1
	bl FUN_02228188
	strh r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl FUN_022291F4
	strb r0, [r4, #0x13]
_02238A0A:
	adds r5, r5, #1
	cmp r5, #0x20
	blt _022389CC
	adds r0, r6, #0
	bl ov80_02239740
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022389C4

	thumb_func_start ov80_02238A18
ov80_02238A18: @ 0x02238A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02096864
	ldr r7, _02238A78 @ =0x0000FFFF
	adds r4, r0, #0
	movs r6, #0
_02238A2A:
	ldrh r1, [r4]
	cmp r1, r7
	beq _02238A3A
	ldrb r2, [r4, #2]
	ldr r0, [r5, #0x20]
	movs r3, #0x65
	bl FUN_02228FE0
_02238A3A:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0x18
	blt _02238A2A
	ldr r7, _02238A78 @ =0x0000FFFF
	movs r4, #0
	add r6, sp, #0
_02238A48:
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_0209686C
	ldrh r1, [r0, #0xc]
	cmp r1, r7
	beq _02238A66
	adds r1, r6, #0
	bl ov80_02239900
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov80_02239510
_02238A66:
	adds r4, r4, #1
	cmp r4, #0x20
	blt _02238A48
	adds r0, r5, #0
	bl ov80_02239828
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238A78: .4byte 0x0000FFFF
	thumb_func_end ov80_02238A18

	thumb_func_start ov80_02238A7C
ov80_02238A7C: @ 0x02238A7C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0202061C
	bl FUN_0200D034
	ldr r0, [r4, #4]
	bl FUN_0200398C
	ldr r0, [r4]
	bl FUN_0201EEB4
	ldr r3, _02238AA4 @ =0x027E0000
	ldr r1, _02238AA8 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02238AA4: .4byte 0x027E0000
_02238AA8: .4byte 0x00003FF8
	thumb_func_end ov80_02238A7C

	thumb_func_start ov80_02238AAC
ov80_02238AAC: @ 0x02238AAC
	bx lr
	.align 2, 0
	thumb_func_end ov80_02238AAC

	thumb_func_start ov80_02238AB0
ov80_02238AB0: @ 0x02238AB0
	ldr r3, _02238AB8 @ =FUN_0222807C
	ldr r0, [r1, #0x14]
	bx r3
	nop
_02238AB8: .4byte FUN_0222807C
	thumb_func_end ov80_02238AB0

	thumb_func_start ov80_02238ABC
ov80_02238ABC: @ 0x02238ABC
	ldr r3, _02238AC4 @ =ov80_02238C78
	adds r0, r1, #0
	bx r3
	nop
_02238AC4: .4byte ov80_02238C78
	thumb_func_end ov80_02238ABC

	thumb_func_start ov80_02238AC8
ov80_02238AC8: @ 0x02238AC8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r0, [r7, #8]
	movs r1, #0x1f
	bl FUN_0209686C
	ldr r1, [r0]
	cmp r1, #0
	beq _02238AE2
	adds r0, r7, #0
	adds r0, #0x1c
	bl FUN_02229358
_02238AE2:
	adds r0, r7, #0
	bl ov80_02238B28
	ldr r0, [r7, #0x20]
	bl FUN_022290DC
	ldr r4, [r7, #0x6c]
	movs r6, #0
	adds r5, r7, #0
_02238AF4:
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	beq _02238B04
	movs r1, #1
	tst r1, r4
	beq _02238B04
	bl FUN_0200DC18
_02238B04:
	adds r6, r6, #1
	lsrs r4, r4, #1
	adds r5, r5, #4
	cmp r6, #8
	blt _02238AF4
	ldr r0, [r7, #0x38]
	bl FUN_0200D020
	bl FUN_0200D03C
	bl ov80_02239A38
	movs r0, #1
	movs r1, #0
	bl FUN_02026E50
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02238AC8

	thumb_func_start ov80_02238B28
ov80_02238B28: @ 0x02238B28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02096808
	adds r4, r0, #0
	adds r0, #0x20
	ldrb r0, [r0]
	movs r1, #0xc
	bl ov80_0222ACA0
	cmp r0, #0
	beq _02238B46
	cmp r0, #1
	beq _02238B74
_02238B46:
	ldr r0, [r5, #0x24]
	cmp r0, #0
	beq _02238B54
	adds r1, r5, #0
	adds r1, #0x1c
	bl FUN_02229420
_02238B54:
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _02238B7A
	adds r4, #0x20
	ldrb r0, [r4]
	movs r1, #0xd
	bl ov80_0222ACA0
	cmp r0, #1
	bne _02238B7A
	ldr r0, [r5, #0x28]
	adds r5, #0x1c
	adds r1, r5, #0
	bl FUN_02229420
	pop {r3, r4, r5, pc}
_02238B74:
	adds r0, r5, #0
	bl ov80_02238B7C
_02238B7A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02238B28

	thumb_func_start ov80_02238B7C
ov80_02238B7C: @ 0x02238B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02096808
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x1c
	bl FUN_022293A8
	movs r1, #0xaa
	ldrsh r1, [r5, r1]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x1c
	bl FUN_022293B0
	movs r1, #0xa8
	ldrsh r1, [r5, r1]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	cmp r4, #0
	ble _02238BC6
	lsls r0, r4, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #4]
	b _02238BD6
_02238BC6:
	lsls r0, r4, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #4]
_02238BD6:
	cmp r6, #0
	ble _02238BEE
	lsls r0, r6, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp]
	b _02238BFE
_02238BEE:
	lsls r0, r6, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp]
_02238BFE:
	ldr r0, [r5, #0x34]
	bl FUN_0200CF6C
	str r0, [sp, #8]
	ldr r0, [sp]
	blx FUN_020F2104
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	blx FUN_020F2104
	adds r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl FUN_02009FA8
	ldr r0, [r5]
	movs r1, #3
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r5]
	adds r2, r1, #0
	adds r3, r4, #0
	bl FUN_0201F238
	adds r0, r7, #0
	adds r0, #0x20
	ldrb r0, [r0]
	movs r1, #9
	bl ov80_0222ACA0
	ldr r1, _02238C74 @ =0x0000FFFF
	cmp r0, r1
	beq _02238C6E
	adds r7, #0x20
	ldrb r0, [r7]
	movs r1, #0xd
	bl ov80_0222ACA0
	cmp r0, #1
	bne _02238C6E
	ldr r0, [r5]
	movs r1, #2
	movs r2, #0
	adds r3, r6, #0
	bl FUN_0201F238
	ldr r0, [r5]
	movs r1, #2
	movs r2, #3
	adds r3, r4, #0
	bl FUN_0201F238
_02238C6E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238C74: .4byte 0x0000FFFF
	thumb_func_end ov80_02238B7C

	thumb_func_start ov80_02238C78
ov80_02238C78: @ 0x02238C78
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	add r1, sp, #0
	bl FUN_02229A08
	cmp r0, #1
	bne _02238CA0
	add r4, sp, #0
_02238C8C:
	ldr r0, [r5, #0x14]
	adds r1, r4, #0
	bl FUN_02228068
	ldr r0, [r5, #0x30]
	adds r1, r4, #0
	bl FUN_02229A08
	cmp r0, #1
	beq _02238C8C
_02238CA0:
	ldr r0, [r5, #0x2c]
	add r1, sp, #8
	bl FUN_02229AC8
	cmp r0, #1
	bne _02238CD4
	add r6, sp, #0
	add r4, sp, #8
_02238CB0:
	ldr r0, [r5, #0x18]
	ldr r1, [r5, #0x14]
	adds r2, r4, #0
	adds r3, r6, #0
	bl FUN_02228C80
	cmp r0, #1
	bne _02238CC8
	ldr r0, [r5, #0x14]
	adds r1, r6, #0
	bl FUN_02228068
_02238CC8:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl FUN_02229AC8
	cmp r0, #1
	beq _02238CB0
_02238CD4:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov80_02238C78

	thumb_func_start ov80_02238CD8
ov80_02238CD8: @ 0x02238CD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa8
	adds r7, r1, #0
	adds r5, r0, #0
	adds r0, r7, #0
	movs r1, #0
	bl ov80_0222ACA0
	adds r4, r0, #0
	bl FUN_02022C54
	ldr r6, _02238EF8 @ =0x0223D5D8
	add r3, sp, #0x2c
	movs r2, #5
_02238CF4:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02238CF4
	add r0, sp, #0x2c
	bl FUN_02022BE8
	movs r1, #6
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x18
	lsls r2, r2, #0x12
	blx FUN_020D47EC
	movs r1, #0x62
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x14
	lsls r2, r2, #0x10
	blx FUN_020D47EC
	movs r1, #0x19
	movs r2, #1
	movs r0, #0
	lsls r1, r1, #0x16
	lsls r2, r2, #0x12
	blx FUN_020D47EC
	movs r1, #0x66
	movs r2, #2
	movs r0, #0
	lsls r1, r1, #0x14
	lsls r2, r2, #0x10
	blx FUN_020D47EC
	ldr r6, _02238EFC @ =0x0223D560
	add r3, sp, #0x1c
	adds r2, r3, #0
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	str r4, [sp, #0x20]
	bl FUN_0201ACB0
	ldr r6, _02238F00 @ =0x0223D600
	add r3, sp, #0x54
	movs r2, #0xa
_02238D56:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _02238D56
	ldr r0, [r6]
	cmp r4, #0
	str r0, [r3]
	bne _02238D74
	movs r2, #0
	add r1, sp, #0x74
	strb r2, [r1, #0xd]
	add r0, sp, #0x94
	strb r2, [r0, #9]
	strb r2, [r1, #0x10]
	strb r2, [r0, #0xc]
_02238D74:
	adds r0, r7, #0
	movs r1, #4
	bl ov80_0222ACA0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	add r0, sp, #0x94
	strb r6, [r0, #8]
	adds r0, r7, #0
	movs r1, #9
	bl ov80_0222ACA0
	ldr r1, _02238F04 @ =0x0000FFFF
	cmp r0, r1
	beq _02238D96
	add r0, sp, #0x74
	strb r6, [r0, #0xc]
_02238D96:
	cmp r4, #0
	add r2, sp, #0x54
	bne _02238E20
	adds r0, r5, #0
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #2
	add r2, sp, #0x70
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #3
	add r2, sp, #0x8c
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	movs r1, #3
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
	b _02238EA2
_02238E20:
	adds r0, r5, #0
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	movs r1, #2
	adds r0, r5, #0
	add r2, sp, #0x70
	adds r3, r1, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #2
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #3
	add r2, sp, #0x8c
	movs r3, #2
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #3
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201BC8C
	movs r1, #3
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201BC8C
_02238EA2:
	ldr r1, _02238F08 @ =0x04000008
	movs r0, #3
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #1
	strh r2, [r1]
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r4, _02238F0C @ =0x0223D59C
	add r3, sp, #0
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #4
	str r0, [r3]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_0201B1E4
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201CAE0
	movs r2, #0
	adds r0, r5, #0
	movs r1, #4
	adds r3, r2, #0
	bl FUN_0201BC8C
	adds r0, r5, #0
	movs r1, #4
	movs r2, #3
	movs r3, #0
	bl FUN_0201BC8C
	add sp, #0xa8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02238EF8: .4byte 0x0223D5D8
_02238EFC: .4byte 0x0223D560
_02238F00: .4byte 0x0223D600
_02238F04: .4byte 0x0000FFFF
_02238F08: .4byte 0x04000008
_02238F0C: .4byte 0x0223D59C
	thumb_func_end ov80_02238CD8

	thumb_func_start ov80_02238F10
ov80_02238F10: @ 0x02238F10
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xe0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	movs r1, #0x10
	movs r2, #7
	movs r3, #0x65
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	movs r1, #0x10
	movs r2, #8
	movs r3, #0x65
	bl FUN_02003200
	ldr r0, [r4, #8]
	bl FUN_02096808
	ldr r0, [r0, #4]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x65
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02238F98 @ =0x000003E2
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E644
	ldr r0, [r4, #4]
	movs r1, #0
	movs r2, #0xb0
	movs r3, #0x20
	bl FUN_020032A4
	movs r0, #0
	str r0, [sp]
	movs r0, #0x65
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02238F9C @ =0x000003D9
	movs r1, #1
	movs r3, #0xc
	bl FUN_0200E3DC
	ldr r0, [r4, #4]
	movs r1, #0
	movs r2, #0xc0
	movs r3, #0x20
	bl FUN_020032A4
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02238F98: .4byte 0x000003E2
_02238F9C: .4byte 0x000003D9
	thumb_func_end ov80_02238F10

	thumb_func_start ov80_02238FA0
ov80_02238FA0: @ 0x02238FA0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0xb7
	movs r1, #0x65
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0x65
	str r1, [sp, #0xc]
	ldr r2, [r5]
	movs r1, #0x81
	movs r3, #4
	adds r4, r0, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r4, #0
	movs r1, #0x82
	movs r3, #4
	bl FUN_02007B68
	movs r0, #1
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	movs r1, #0xb7
	movs r2, #0xbe
	movs r3, #0x65
	bl FUN_02003200
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02238FA0

	thumb_func_start ov80_02239004
ov80_02239004: @ 0x02239004
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x20
	movs r1, #0x65
	adds r6, r2, #0
	bl FUN_02228010
	str r0, [r5, #0x14]
	movs r0, #0x10
	adds r1, r0, #0
	movs r2, #0x65
	bl FUN_02227EE0
	str r0, [r5, #0x18]
	adds r0, r5, #0
	adds r0, #0x1c
	bl FUN_02229394
	ldr r0, [r5, #0x38]
	bl FUN_0200E2B0
	adds r7, r0, #0
	adds r0, r6, #0
	bl ov80_0222A7EC
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x65
	str r0, [sp, #8]
	ldr r1, [r5, #4]
	adds r0, r7, #0
	movs r2, #0x20
	bl FUN_02228F24
	ldr r3, _02239270 @ =0x0223D554
	str r0, [r5, #0x20]
	add r2, sp, #0x20
	movs r1, #0xb
_0223905A:
	ldrb r0, [r3]
	adds r3, r3, #1
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _0223905A
	adds r0, r4, #0
	movs r1, #5
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x10]
	adds r0, r4, #0
	movs r1, #6
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x11]
	adds r0, r4, #0
	movs r1, #0xc
	bl ov80_0222ACA0
	adds r6, r0, #0
	bne _0223909C
	ldr r0, [r5, #0x34]
	bl FUN_0200CF6C
	ldr r1, [r5]
	add r2, sp, #0x20
	movs r3, #0x65
	bl FUN_022293B8
	str r0, [r5, #0x24]
_0223909C:
	adds r0, r4, #0
	movs r1, #9
	bl ov80_0222ACA0
	ldr r1, _02239274 @ =0x0000FFFF
	cmp r0, r1
	beq _022390DA
	adds r0, r4, #0
	movs r1, #9
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x11]
	movs r0, #2
	strb r0, [r1, #9]
	movs r2, #1
	movs r0, #8
	strb r2, [r1, #0xb]
	strb r0, [r1, #0xc]
	strb r2, [r1, #0xe]
	cmp r6, #0
	bne _022390DA
	ldr r0, [r5, #0x34]
	bl FUN_0200CF6C
	ldr r1, [r5]
	add r2, sp, #0x20
	movs r3, #0x65
	bl FUN_022293B8
	str r0, [r5, #0x28]
_022390DA:
	movs r0, #0x80
	movs r1, #0x65
	bl FUN_02229A40
	str r0, [r5, #0x2c]
	movs r0, #0x80
	movs r1, #0x65
	bl FUN_02229974
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x18]
	ldr r1, _02239278 @ =0x0223D654
	bl FUN_02227F48
	adds r0, r4, #0
	movs r1, #0
	bl ov80_0222ACA0
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #5
	bl ov80_0222ACA0
	movs r1, #0x65
	str r0, [sp, #0x10]
	bl FUN_02007688
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #7
	bl ov80_0222ACA0
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r3, #3
	bl FUN_02007B44
	cmp r7, #0
	bne _0223915A
	adds r0, r4, #0
	movs r1, #8
	bl ov80_0222ACA0
	adds r2, r0, #0
	movs r1, #0
	movs r0, #0x16
	str r1, [sp]
	lsls r0, r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x10]
	movs r3, #0x65
	bl FUN_02003200
	b _02239198
_0223915A:
	adds r0, r4, #0
	movs r1, #8
	bl ov80_0222ACA0
	adds r1, r0, #0
	adds r0, r6, #0
	add r2, sp, #0x1c
	movs r3, #0x65
	bl FUN_02007C48
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x14]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	blx FUN_020D2894
	blx FUN_020D0524
	ldr r0, [sp, #0x1c]
	movs r1, #6
	movs r2, #2
	ldr r0, [r0, #0xc]
	lsls r1, r1, #0xc
	lsls r2, r2, #0xc
	blx FUN_020D05C4
	blx FUN_020D0634
	ldr r0, [sp, #0x14]
	bl FUN_0201AB0C
_02239198:
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	movs r2, #2
	adds r3, r1, #0
	bl FUN_02003D5C
	adds r0, r4, #0
	movs r1, #6
	bl ov80_0222ACA0
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r3, #3
	bl FUN_02007B68
	adds r0, r4, #0
	movs r1, #9
	bl ov80_0222ACA0
	ldr r1, _02239274 @ =0x0000FFFF
	cmp r0, r1
	beq _0223925E
	adds r0, r4, #0
	movs r1, #0xa
	bl ov80_0222ACA0
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r3, #2
	bl FUN_02007B44
	adds r0, r4, #0
	movs r1, #9
	bl ov80_0222ACA0
	adds r1, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	adds r0, r6, #0
	movs r3, #2
	bl FUN_02007B68
	cmp r7, #0
	beq _0223925E
	adds r0, r4, #0
	movs r1, #0xb
	bl ov80_0222ACA0
	adds r1, r0, #0
	adds r0, r6, #0
	add r2, sp, #0x18
	movs r3, #0x65
	bl FUN_02007C48
	ldr r1, [sp, #0x18]
	adds r4, r0, #0
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	blx FUN_020D2894
	blx FUN_020D0524
	ldr r0, [sp, #0x18]
	movs r1, #1
	lsls r1, r1, #0xe
	ldr r0, [r0, #0xc]
	lsrs r2, r1, #1
	blx FUN_020D05C4
	blx FUN_020D0634
	adds r0, r4, #0
	bl FUN_0201AB0C
_0223925E:
	ldr r0, [r5]
	movs r1, #3
	bl FUN_0201EFBC
	adds r0, r6, #0
	bl FUN_0200770C
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02239270: .4byte 0x0223D554
_02239274: .4byte 0x0000FFFF
_02239278: .4byte 0x0223D654
	thumb_func_end ov80_02239004

	thumb_func_start ov80_0223927C
ov80_0223927C: @ 0x0223927C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, [r6, #8]
	bl FUN_02096868
	adds r5, r0, #0
	movs r4, #0
_0223928A:
	ldr r0, [r5]
	cmp r0, #0
	beq _0223929E
	bl FUN_02228100
	ldr r0, [r5, #0x38]
	cmp r0, #0
	beq _0223929E
	bl GF_AssertFail
_0223929E:
	adds r4, r4, #1
	adds r5, #0x3c
	cmp r4, #0x20
	blt _0223928A
	ldr r0, [r6, #0x14]
	bl FUN_02228050
	ldr r0, [r6, #0x18]
	bl FUN_02227F28
	ldr r0, [r6, #0x20]
	bl FUN_02228F94
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _022392C2
	bl FUN_0222940C
_022392C2:
	ldr r0, [r6, #0x28]
	cmp r0, #0
	beq _022392CC
	bl FUN_0222940C
_022392CC:
	ldr r0, [r6, #0x2c]
	bl FUN_02229A78
	ldr r0, [r6, #0x30]
	bl FUN_022299AC
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0223927C

	thumb_func_start ov80_022392DC
ov80_022392DC: @ 0x022392DC
	push {r3, lr}
	sub sp, #8
	movs r2, #1
	ldr r1, _022392F4 @ =ov80_022392F8
	str r2, [sp]
	str r1, [sp, #4]
	movs r1, #0
	adds r3, r1, #0
	bl FUN_02026EB4
	add sp, #8
	pop {r3, pc}
	.align 2, 0
_022392F4: .4byte ov80_022392F8
	thumb_func_end ov80_022392DC

	thumb_func_start ov80_022392F8
ov80_022392F8: @ 0x022392F8
	push {r3, lr}
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _02239364 @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	adds r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02239368 @ =0xFFFFCFFD
	ands r2, r1
	strh r2, [r0]
	adds r2, r1, #2
	ldrh r3, [r0]
	adds r1, r1, #2
	ands r3, r2
	movs r2, #0x10
	orrs r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0223936C @ =0x0000CFFB
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
	ldr r2, _02239370 @ =0x00007FFF
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _02239374 @ =0xBFFF0000
	ldr r0, _02239378 @ =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_02239364: .4byte 0x04000008
_02239368: .4byte 0xFFFFCFFD
_0223936C: .4byte 0x0000CFFB
_02239370: .4byte 0x00007FFF
_02239374: .4byte 0xBFFF0000
_02239378: .4byte 0x04000580
	thumb_func_end ov80_022392F8

	thumb_func_start ov80_0223937C
ov80_0223937C: @ 0x0223937C
	ldr r3, _02239380 @ =FUN_02026F54
	bx r3
	.align 2, 0
_02239380: .4byte FUN_02026F54
	thumb_func_end ov80_0223937C

	thumb_func_start ov80_02239384
ov80_02239384: @ 0x02239384
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x65
	bl FUN_0200CF18
	ldr r1, _022393D8 @ =0x0223D5B8
	ldr r2, _022393DC @ =0x0223D570
	movs r3, #0x20
	str r0, [r4, #0x34]
	bl FUN_0200CF70
	ldr r1, _022393E0 @ =0x00200010
	movs r0, #1
	bl FUN_02009FE8
	movs r0, #1
	bl FUN_0200A080
	ldr r0, [r4, #0x34]
	bl FUN_0200CF38
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	movs r2, #0x80
	bl FUN_0200CFF4
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r2, _022393E4 @ =0x0223D584
	bl FUN_0200D3F8
	ldr r0, [r4, #0x34]
	bl FUN_0200CF6C
	movs r2, #2
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	pop {r4, pc}
	nop
_022393D8: .4byte 0x0223D5B8
_022393DC: .4byte 0x0223D570
_022393E0: .4byte 0x00200010
_022393E4: .4byte 0x0223D584
	thumb_func_end ov80_02239384

	thumb_func_start ov80_022393E8
ov80_022393E8: @ 0x022393E8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #0
_022393F0:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _022393FA
	bl ov80_02239BE8
_022393FA:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #8
	blt _022393F0
	ldr r7, _02239474 @ =0x0000FFFF
	movs r6, #0
	adds r4, r5, #0
_02239408:
	adds r0, r4, #0
	adds r0, #0x70
	ldrh r1, [r0]
	cmp r1, r7
	beq _02239418
	ldr r0, [r5, #0x38]
	bl ov80_02239B7C
_02239418:
	adds r6, r6, #1
	adds r4, r4, #2
	cmp r6, #8
	blt _02239408
	ldr r7, _02239478 @ =0x0000C350
	movs r4, #0
	adds r6, r5, #0
_02239426:
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _0223945A
	bl FUN_0200D9DC
	ldr r1, _02239478 @ =0x0000C350
	ldr r0, [r5, #0x38]
	adds r1, r4, r1
	bl FUN_0200D958
	ldr r1, _02239478 @ =0x0000C350
	ldr r0, [r5, #0x38]
	adds r1, r4, r1
	bl FUN_0200D968
	ldr r1, _02239478 @ =0x0000C350
	ldr r0, [r5, #0x38]
	adds r1, r4, r1
	bl FUN_0200D978
	ldr r0, [r5, #0x38]
	adds r1, r4, r7
	bl FUN_0200D988
_0223945A:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #4
	blt _02239426
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl FUN_0200D998
	ldr r0, [r5, #0x34]
	bl FUN_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239474: .4byte 0x0000FFFF
_02239478: .4byte 0x0000C350
	thumb_func_end ov80_022393E8

	thumb_func_start ov80_0223947C
ov80_0223947C: @ 0x0223947C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #8]
	adds r5, r1, #0
	bl FUN_02096864
	adds r7, r0, #0
	ldrh r3, [r5]
	movs r1, #0
	adds r2, r7, #0
_02239490:
	ldrh r0, [r2]
	cmp r3, r0
	beq _022394D2
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #0x18
	blt _02239490
	ldr r0, _022394D4 @ =0x0000FFFF
	movs r4, #0
	adds r2, r7, #0
_022394A4:
	ldrh r1, [r2]
	cmp r1, r0
	beq _022394B2
	adds r4, r4, #1
	adds r2, r2, #4
	cmp r4, #0x18
	blt _022394A4
_022394B2:
	cmp r4, #0x18
	bne _022394BA
	bl GF_AssertFail
_022394BA:
	ldrh r0, [r5]
	lsls r2, r4, #2
	adds r1, r7, r2
	strh r0, [r7, r2]
	ldrh r0, [r5, #2]
	movs r3, #0x65
	strh r0, [r1, #2]
	ldrh r1, [r5]
	ldrb r2, [r5, #2]
	ldr r0, [r6, #0x20]
	bl FUN_02228FE0
_022394D2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022394D4: .4byte 0x0000FFFF
	thumb_func_end ov80_0223947C

	thumb_func_start ov80_022394D8
ov80_022394D8: @ 0x022394D8
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #8]
	adds r5, r1, #0
	bl FUN_02096864
	adds r7, r0, #0
	movs r4, #0
	adds r1, r7, #0
_022394EA:
	ldrh r0, [r1]
	cmp r5, r0
	bne _02239500
	ldr r0, [r6, #0x20]
	adds r1, r5, #0
	bl FUN_02229004
	ldr r1, _0223950C @ =0x0000FFFF
	lsls r0, r4, #2
	strh r1, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02239500:
	adds r4, r4, #1
	adds r1, r1, #4
	cmp r4, #0x18
	blt _022394EA
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223950C: .4byte 0x0000FFFF
	thumb_func_end ov80_022394D8

	thumb_func_start ov80_02239510
ov80_02239510: @ 0x02239510
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, [r6, #8]
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_02096868
	movs r1, #0
	mvns r1, r1
	cmp r4, r1
	bne _02239540
	movs r4, #0
_0223952A:
	ldr r1, [r0]
	cmp r1, #0
	beq _02239538
	adds r4, r4, #1
	adds r0, #0x3c
	cmp r4, #0x20
	blt _0223952A
_02239538:
	cmp r4, #0x20
	bne _02239540
	bl GF_AssertFail
_02239540:
	movs r0, #6
	ldrsh r0, [r5, r0]
	add r1, sp, #8
	strh r0, [r1]
	movs r0, #8
	ldrsh r0, [r5, r0]
	strh r0, [r1, #2]
	ldrh r0, [r5, #4]
	strh r0, [r1, #4]
	ldrh r0, [r5, #2]
	strh r0, [r1, #6]
	ldrb r0, [r5, #0xa]
	strh r0, [r1, #8]
	ldrh r0, [r5]
	strh r0, [r1, #0xa]
	ldr r0, [r6, #0x14]
	add r1, sp, #8
	bl FUN_022280B8
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	ldr r1, [sp, #4]
	movs r2, #0
	movs r3, #0x65
	bl FUN_0222903C
	ldrb r1, [r5, #0xb]
	adds r7, r0, #0
	bl FUN_02229200
	str r5, [sp]
	ldr r0, [r6, #8]
	ldr r2, [sp, #4]
	adds r1, r4, #0
	adds r3, r7, #0
	bl ov80_02239914
	ldr r0, [sp, #4]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02239510

	thumb_func_start ov80_02239590
ov80_02239590: @ 0x02239590
	push {r3, r4, r5, lr}
	ldr r0, [r0, #8]
	adds r5, r1, #0
	bl FUN_02096868
	adds r4, r0, #0
	movs r1, #0
	adds r2, r4, #0
_022395A0:
	ldr r0, [r2]
	cmp r0, r5
	bne _022395D8
	movs r0, #0x3c
	adds r5, r1, #0
	muls r5, r0, r5
	ldr r0, [r4, r5]
	bl FUN_02228100
	adds r0, r4, r5
	ldr r0, [r0, #4]
	bl FUN_022290C4
	adds r0, r4, r5
	ldr r0, [r0, #0x38]
	cmp r0, #0
	beq _022395C6
	bl GF_AssertFail
_022395C6:
	adds r0, r4, r5
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020D4994
	ldr r1, _022395E4 @ =0x0000FFFF
	adds r0, r4, r5
	strh r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
_022395D8:
	adds r1, r1, #1
	adds r2, #0x3c
	cmp r1, #0x20
	blt _022395A0
	pop {r3, r4, r5, pc}
	nop
_022395E4: .4byte 0x0000FFFF
	thumb_func_end ov80_02239590

	thumb_func_start ov80_022395E8
ov80_022395E8: @ 0x022395E8
	push {r4, r5, r6, lr}
	ldr r0, [r0, #8]
	adds r5, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	bl FUN_02096868
	movs r1, #0
	adds r3, r0, #0
_022395FA:
	ldrh r2, [r3, #0xc]
	cmp r5, r2
	bne _0223961C
	cmp r4, #0
	beq _0223960C
	movs r2, #0x3c
	muls r2, r1, r2
	ldr r2, [r0, r2]
	str r2, [r4]
_0223960C:
	cmp r6, #0
	beq _02239628
	movs r2, #0x3c
	muls r2, r1, r2
	adds r0, r0, r2
	ldr r0, [r0, #4]
	str r0, [r6]
	pop {r4, r5, r6, pc}
_0223961C:
	adds r1, r1, #1
	adds r3, #0x3c
	cmp r1, #0x20
	blt _022395FA
	bl GF_AssertFail
_02239628:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_022395E8

	thumb_func_start ov80_0223962C
ov80_0223962C: @ 0x0223962C
	push {r3, r4, r5, lr}
	ldr r3, _02239658 @ =0x0000FFFF
	movs r4, #0
	adds r5, r0, #0
_02239634:
	adds r2, r5, #0
	adds r2, #0x70
	ldrh r2, [r2]
	cmp r2, r3
	bne _02239648
	lsls r2, r4, #1
	adds r0, r0, r2
	adds r0, #0x70
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_02239648:
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #8
	blt _02239634
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_02239658: .4byte 0x0000FFFF
	thumb_func_end ov80_0223962C

	thumb_func_start ov80_0223965C
ov80_0223965C: @ 0x0223965C
	push {r3, r4}
	movs r3, #0
	adds r4, r0, #0
_02239662:
	adds r2, r4, #0
	adds r2, #0x70
	ldrh r2, [r2]
	cmp r1, r2
	bne _0223967A
	lsls r1, r3, #1
	adds r0, r0, r1
	ldr r2, _02239688 @ =0x0000FFFF
	adds r0, #0x70
	strh r2, [r0]
	pop {r3, r4}
	bx lr
_0223967A:
	adds r3, r3, #1
	adds r4, r4, #2
	cmp r3, #8
	blt _02239662
	pop {r3, r4}
	bx lr
	nop
_02239688: .4byte 0x0000FFFF
	thumb_func_end ov80_0223965C

	thumb_func_start ov80_0223968C
ov80_0223968C: @ 0x0223968C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #8
	blo _0223969E
	bl GF_AssertFail
_0223969E:
	adds r7, r5, #0
	lsls r0, r4, #2
	adds r7, #0x3c
	str r0, [sp]
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _022396B0
	bl GF_AssertFail
_022396B0:
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	adds r2, r6, #0
	bl ov80_02239BB8
	ldr r1, [sp]
	str r0, [sp, #4]
	str r0, [r7, r1]
	lsls r0, r4, #1
	adds r0, r5, r0
	adds r0, #0x5c
	strh r6, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov80_02239708
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223968C

	thumb_func_start ov80_022396D8
ov80_022396D8: @ 0x022396D8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #8
	blo _022396E6
	bl GF_AssertFail
_022396E6:
	lsls r4, r4, #2
	adds r5, #0x3c
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _022396F4
	bl GF_AssertFail
_022396F4:
	ldr r0, [r5, r4]
	bl ov80_02239BE8
	movs r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022396D8

	thumb_func_start ov80_02239700
ov80_02239700: @ 0x02239700
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0, #0x3c]
	bx lr
	thumb_func_end ov80_02239700

	thumb_func_start ov80_02239708
ov80_02239708: @ 0x02239708
	push {r3, r4}
	cmp r2, #1
	bne _0223971E
	movs r2, #1
	ldr r3, [r0, #0x6c]
	lsls r2, r1
	adds r1, r3, #0
	orrs r1, r2
	str r1, [r0, #0x6c]
	pop {r3, r4}
	bx lr
_0223971E:
	movs r2, #1
	adds r3, r2, #0
	lsls r3, r1
	subs r1, r2, #2
	ldr r4, [r0, #0x6c]
	eors r1, r3
	ands r1, r4
	str r1, [r0, #0x6c]
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov80_02239708

	thumb_func_start ov80_02239734
ov80_02239734: @ 0x02239734
	ldr r0, [r0, #0x6c]
	adds r2, r0, #0
	lsrs r2, r1
	movs r0, #1
	ands r0, r2
	bx lr
	thumb_func_end ov80_02239734

	thumb_func_start ov80_02239740
ov80_02239740: @ 0x02239740
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0, #8]
	bl FUN_02096878
	ldr r4, [sp]
	adds r6, r0, #0
	ldr r0, _02239814 @ =0x0000FFFF
	adds r4, #0x3c
	movs r3, #0
_02239756:
	lsls r2, r3, #1
	adds r1, r4, r2
	ldrh r1, [r1, #0x34]
	cmp r1, r0
	beq _02239764
	strh r1, [r6, r2]
	adds r3, r3, #1
_02239764:
	adds r3, r3, #1
	cmp r3, #8
	blt _02239756
	adds r0, r6, #0
	str r0, [sp, #8]
	adds r0, #0x12
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r5, r6, #0
	str r0, [sp, #4]
	adds r0, #0x10
	movs r7, #0
	adds r5, #0x16
	str r4, [sp, #0xc]
	str r0, [sp, #4]
_02239782:
	ldr r0, [r4]
	cmp r0, #0
	beq _022397F0
	bl FUN_0200DC64
	strb r0, [r6, #0x15]
	ldr r0, [r4]
	bl FUN_0200DCD4
	ldrh r2, [r5]
	ldr r1, _02239818 @ =0xFFFFE000
	ands r1, r2
	ldr r2, _0223981C @ =0x00001FFF
	ands r0, r2
	orrs r0, r1
	strh r0, [r5]
	lsls r1, r7, #0x10
	ldr r0, [sp]
	lsrs r1, r1, #0x10
	bl ov80_02239734
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1f
	ldrh r2, [r5]
	ldr r1, _02239820 @ =0xFFFFDFFF
	lsrs r0, r0, #0x12
	ands r1, r2
	orrs r0, r1
	strh r0, [r5]
	ldr r0, [r4]
	bl FUN_0200DCFC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1f
	ldrh r2, [r5]
	ldr r1, _02239824 @ =0xFFFFBFFF
	lsrs r0, r0, #0x11
	ands r1, r2
	orrs r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldrh r0, [r0, #0x20]
	ldr r2, [sp, #8]
	strb r0, [r6, #0x14]
	ldr r0, [r4]
	bl FUN_0200DE44
	movs r0, #2
	ldrh r1, [r5]
	lsls r0, r0, #0xe
	orrs r0, r1
	strh r0, [r5]
_022397F0:
	ldr r0, [sp, #0xc]
	adds r7, r7, #1
	adds r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	adds r4, r4, #4
	adds r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r6, #8
	adds r0, #8
	adds r5, #8
	str r0, [sp, #4]
	cmp r7, #8
	blt _02239782
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239814: .4byte 0x0000FFFF
_02239818: .4byte 0xFFFFE000
_0223981C: .4byte 0x00001FFF
_02239820: .4byte 0xFFFFDFFF
_02239824: .4byte 0xFFFFBFFF
	thumb_func_end ov80_02239740

	thumb_func_start ov80_02239828
ov80_02239828: @ 0x02239828
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #8]
	bl FUN_02096878
	adds r5, r0, #0
	movs r0, #0xb8
	movs r1, #0x65
	bl FUN_02007688
	str r0, [sp, #4]
	movs r6, #0
	adds r4, r5, #0
_02239844:
	ldrh r1, [r4]
	ldr r0, _022398E0 @ =0x0000FFFF
	cmp r1, r0
	beq _02239862
	str r1, [sp]
	ldr r0, [r7, #0x34]
	ldr r1, [r7, #0x38]
	ldr r2, [sp, #4]
	ldr r3, [r7, #4]
	bl ov80_02239AF8
	ldrh r1, [r4]
	adds r0, r7, #0
	bl ov80_0223962C
_02239862:
	adds r6, r6, #1
	adds r4, r4, #2
	cmp r6, #8
	blt _02239844
	adds r4, r5, #0
	movs r6, #0
	adds r4, #0x16
_02239870:
	ldrh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _022398C4
	ldrb r2, [r5, #0x14]
	lsls r1, r6, #0x10
	adds r0, r7, #0
	lsrs r1, r1, #0x10
	bl ov80_0223968C
	movs r1, #0x10
	movs r2, #0x12
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	str r0, [sp, #8]
	bl FUN_0200DDB8
	ldrh r1, [r4]
	ldr r0, [sp, #8]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x1f
	bl FUN_0200DCE8
	ldrh r2, [r4]
	lsls r1, r6, #0x10
	adds r0, r7, #0
	lsls r2, r2, #0x12
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x1f
	bl ov80_02239708
	ldrb r1, [r5, #0x15]
	ldr r0, [sp, #8]
	bl FUN_0200DC4C
	ldrh r1, [r4]
	ldr r0, [sp, #8]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x13
	bl FUN_0200DCC0
_022398C4:
	adds r6, r6, #1
	adds r4, #8
	adds r5, #8
	cmp r6, #8
	blt _02239870
	ldr r0, [sp, #4]
	bl FUN_0200770C
	ldr r0, [r7, #8]
	bl FUN_02096884
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022398E0: .4byte 0x0000FFFF
	thumb_func_end ov80_02239828

	thumb_func_start ov80_022398E4
ov80_022398E4: @ 0x022398E4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x1c
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_022293A8
	adds r5, #0x1c
	strh r0, [r4]
	adds r0, r5, #0
	bl FUN_022293B0
	strh r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022398E4

	thumb_func_start ov80_02239900
ov80_02239900: @ 0x02239900
	adds r0, #8
	movs r3, #0xf
_02239904:
	ldrh r2, [r0]
	adds r0, r0, #2
	strh r2, [r1]
	adds r1, r1, #2
	subs r3, r3, #1
	bne _02239904
	bx lr
	.align 2, 0
	thumb_func_end ov80_02239900

	thumb_func_start ov80_02239914
ov80_02239914: @ 0x02239914
	push {r3, r4, r5, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	bl FUN_0209686C
	str r5, [r0]
	str r4, [r0, #4]
	ldr r3, [sp, #0x10]
	adds r0, #8
	movs r2, #0xf
_02239928:
	ldrh r1, [r3]
	adds r3, r3, #2
	strh r1, [r0]
	adds r0, r0, #2
	subs r2, r2, #1
	bne _02239928
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02239914

	thumb_func_start ov80_02239938
ov80_02239938: @ 0x02239938
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02096868
	movs r2, #0
_02239942:
	ldr r1, [r0]
	cmp r1, #0
	beq _0223994E
	ldrh r1, [r0, #0xc]
	cmp r1, r4
	beq _0223995C
_0223994E:
	adds r2, r2, #1
	adds r0, #0x3c
	cmp r2, #0x20
	blt _02239942
	bl GF_AssertFail
	movs r0, #0
_0223995C:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_02239938

	thumb_func_start ov80_02239960
ov80_02239960: @ 0x02239960
	push {r3, r4, r5, lr}
	movs r1, #0x24
	adds r5, r0, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x24
	blx FUN_020D4994
	strh r5, [r4, #0x20]
	bl FUN_02014DA0
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_02239960

	thumb_func_start ov80_02239980
ov80_02239980: @ 0x02239980
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_02239988:
	ldr r0, [r5]
	cmp r0, #0
	beq _02239992
	bl ov80_02239A98
_02239992:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _02239988
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_02239980

	thumb_func_start ov80_022399A4
ov80_022399A4: @ 0x022399A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	lsls r6, r1, #2
	ldr r0, [r5, r6]
	adds r7, r2, #0
	str r3, [sp, #8]
	cmp r0, #0
	beq _022399BA
	bl GF_AssertFail
_022399BA:
	ldrh r0, [r5, #0x20]
	movs r1, #0x12
	lsls r1, r1, #0xa
	bl FUN_0201AA8C
	adds r2, r0, #0
	movs r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x20]
	movs r3, #0x12
	ldr r1, _02239A14 @ =ov80_02239AD4
	str r0, [sp, #4]
	ldr r0, _02239A18 @ =ov80_02239AB0
	lsls r3, r3, #0xa
	bl FUN_02014DB4
	adds r4, r0, #0
	bl FUN_02015524
	adds r2, r0, #0
	movs r0, #1
	movs r1, #0xe1
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	ldr r1, [sp, #8]
	adds r0, r4, #0
	bl FUN_02015528
	ldrh r2, [r5, #0x20]
	movs r0, #0xbc
	adds r1, r7, #0
	bl FUN_02015264
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0xa
	movs r3, #1
	bl FUN_0201526C
	str r4, [r5, r6]
	adds r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02239A14: .4byte ov80_02239AD4
_02239A18: .4byte ov80_02239AB0
	thumb_func_end ov80_022399A4

	thumb_func_start ov80_02239A1C
ov80_02239A1C: @ 0x02239A1C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _02239A2C
	bl GF_AssertFail
_02239A2C:
	ldr r0, [r5, r4]
	bl ov80_02239A98
	movs r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A1C

	thumb_func_start ov80_02239A38
ov80_02239A38: @ 0x02239A38
	push {r3, lr}
	bl FUN_02026E48
	bl FUN_02015420
	cmp r0, #0
	bne _02239A4A
	movs r0, #0
	pop {r3, pc}
_02239A4A:
	bl FUN_0201543C
	cmp r0, #0
	ble _02239A56
	bl FUN_02026E48
_02239A56:
	bl FUN_02015460
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_02239A38

	thumb_func_start ov80_02239A60
ov80_02239A60: @ 0x02239A60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _02239A70
	bl GF_AssertFail
_02239A70:
	ldr r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A60

	thumb_func_start ov80_02239A74
ov80_02239A74: @ 0x02239A74
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_02239A7A:
	ldr r0, [r5]
	cmp r0, #0
	beq _02239A8C
	bl FUN_020154B0
	cmp r0, #0
	ble _02239A8C
	movs r0, #0
	pop {r3, r4, r5, pc}
_02239A8C:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _02239A7A
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A74

	thumb_func_start ov80_02239A98
ov80_02239A98: @ 0x02239A98
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_020154D0
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_02014EBC
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A98

	thumb_func_start ov80_02239AB0
ov80_02239AB0: @ 0x02239AB0
	push {r4, lr}
	ldr r3, _02239AD0 @ =0x02110924
	movs r2, #0
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bne _02239AC2
	bl GF_AssertFail
_02239AC2:
	adds r0, r4, #0
	bl FUN_02015354
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_02239AD0: .4byte 0x02110924
	thumb_func_end ov80_02239AB0

	thumb_func_start ov80_02239AD4
ov80_02239AD4: @ 0x02239AD4
	push {r4, lr}
	ldr r3, _02239AF4 @ =0x0211092C
	movs r2, #1
	ldr r3, [r3]
	blx r3
	adds r4, r0, #0
	bne _02239AE6
	bl GF_AssertFail
_02239AE6:
	adds r0, r4, #0
	bl FUN_02015394
	lsls r0, r4, #0x10
	lsrs r0, r0, #0xd
	pop {r4, pc}
	nop
_02239AF4: .4byte 0x0211092C
	thumb_func_end ov80_02239AD4

	thumb_func_start ov80_02239AF8
ov80_02239AF8: @ 0x02239AF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r6, r0, #0
	add r0, sp, #0x20
	ldrh r0, [r0, #0x10]
	adds r7, r1, #0
	adds r5, r2, #0
	str r3, [sp, #0x18]
	cmp r0, #4
	blo _02239B10
	bl GF_AssertFail
_02239B10:
	add r1, sp, #0x20
	ldrh r2, [r1, #0x10]
	movs r1, #0x34
	ldr r0, _02239B78 @ =0x0223DA54
	muls r1, r2, r1
	adds r4, r0, r1
	ldr r3, [r4, #0x14]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_0200D504
	ldr r1, [r4, #0x18]
	movs r0, #0
	str r5, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	movs r1, #2
	adds r2, r6, #0
	adds r3, r7, #0
	bl FUN_0200D68C
	ldr r3, [r4, #0x1c]
	movs r0, #1
	str r0, [sp]
	str r3, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl FUN_0200D6EC
	ldr r3, [r4, #0x20]
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	str r3, [sp, #4]
	bl FUN_0200D71C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02239B78: .4byte 0x0223DA54
	thumb_func_end ov80_02239AF8

	thumb_func_start ov80_02239B7C
ov80_02239B7C: @ 0x02239B7C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #4
	blo _02239B8A
	bl GF_AssertFail
_02239B8A:
	movs r0, #0x34
	ldr r1, _02239BB4 @ =0x0223DA54
	muls r0, r4, r0
	adds r4, r1, r0
	ldr r1, [r4, #0x14]
	adds r0, r5, #0
	bl FUN_0200D958
	ldr r1, [r4, #0x18]
	adds r0, r5, #0
	bl FUN_0200D968
	ldr r1, [r4, #0x1c]
	adds r0, r5, #0
	bl FUN_0200D978
	ldr r1, [r4, #0x20]
	adds r0, r5, #0
	bl FUN_0200D988
	pop {r3, r4, r5, pc}
	.align 2, 0
_02239BB4: .4byte 0x0223DA54
	thumb_func_end ov80_02239B7C

	thumb_func_start ov80_02239BB8
ov80_02239BB8: @ 0x02239BB8
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r4, #4
	blo _02239BC8
	bl GF_AssertFail
_02239BC8:
	movs r2, #0x34
	ldr r3, _02239BE4 @ =0x0223DA54
	muls r2, r4, r2
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r3, r2
	bl FUN_0200D734
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0200DC0C
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_02239BE4: .4byte 0x0223DA54
	thumb_func_end ov80_02239BB8

	thumb_func_start ov80_02239BE8
ov80_02239BE8: @ 0x02239BE8
	ldr r3, _02239BEC @ =FUN_0200D9DC
	bx r3
	.align 2, 0
_02239BEC: .4byte FUN_0200D9DC
	thumb_func_end ov80_02239BE8

	thumb_func_start ov80_02239BF0
ov80_02239BF0: @ 0x02239BF0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r5, r3, #0
	ldr r6, [sp, #0x18]
	bl ov80_02239938
	adds r4, r0, #0
	adds r0, #0x26
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
	adds r0, r4, #0
	adds r0, #0x26
	movs r2, #0
	strb r7, [r0]
	cmp r6, #0
	ble _02239C24
	adds r0, r2, #0
_02239C16:
	ldrsh r1, [r5, r0]
	adds r2, r2, #1
	adds r5, r5, #2
	strh r1, [r4, #0x28]
	adds r4, r4, #2
	cmp r2, r6
	blt _02239C16
_02239C24:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_02239BF0

	thumb_func_start ov80_02239C28
ov80_02239C28: @ 0x02239C28
	push {r4, lr}
	adds r4, r1, #0
	adds r2, r4, #0
	adds r2, #0x26
	ldrb r2, [r2]
	lsls r3, r2, #2
	ldr r2, _02239C50 @ =0x0223DB24
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _02239C4E
	blx r2
	cmp r0, #1
	bne _02239C4E
	adds r4, #0x26
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	blx FUN_020D4994
_02239C4E:
	pop {r4, pc}
	.align 2, 0
_02239C50: .4byte 0x0223DB24
	thumb_func_end ov80_02239C28

	thumb_func_start ov80_02239C54
ov80_02239C54: @ 0x02239C54
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl FUN_02096868
	adds r4, r0, #0
	movs r5, #0
_02239C60:
	ldr r0, [r4]
	cmp r0, #0
	beq _02239C74
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _02239C74
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov80_02239C28
_02239C74:
	adds r5, r5, #1
	adds r4, #0x3c
	cmp r5, #0x20
	blt _02239C60
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_02239C54

	thumb_func_start ov80_02239C80
ov80_02239C80: @ 0x02239C80
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r1, #0
	adds r4, r6, #0
	adds r4, #0x26
	bl FUN_0209680C
	adds r5, r0, #0
	movs r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02239CA2
	subs r0, r0, #1
	strh r0, [r4, #6]
	add sp, #8
	movs r0, #0
	pop {r4, r5, r6, pc}
_02239CA2:
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhi _02239D64
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02239CB4: @ jump table
	.2byte _02239CBC - _02239CB4 - 2 @ case 0
	.2byte _02239D22 - _02239CB4 - 2 @ case 1
	.2byte _02239D22 - _02239CB4 - 2 @ case 2
	.2byte _02239D22 - _02239CB4 - 2 @ case 3
_02239CBC:
	movs r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #3
	bhi _02239D0C
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02239CD0: @ jump table
	.2byte _02239CD8 - _02239CD0 - 2 @ case 0
	.2byte _02239CD8 - _02239CD0 - 2 @ case 1
	.2byte _02239CF0 - _02239CD0 - 2 @ case 2
	.2byte _02239CF0 - _02239CD0 - 2 @ case 3
_02239CD8:
	movs r1, #4
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bne _02239CE8
	strh r0, [r4, #8]
	movs r0, #3
	strh r0, [r4, #0xa]
	b _02239D16
_02239CE8:
	movs r1, #3
	strh r1, [r4, #8]
	strh r0, [r4, #0xa]
	b _02239D16
_02239CF0:
	movs r0, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _02239D02
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #1
	strh r0, [r4, #0xa]
	b _02239D16
_02239D02:
	movs r0, #1
	strh r0, [r4, #8]
	movs r0, #0
	strh r0, [r4, #0xa]
	b _02239D16
_02239D0C:
	bl GF_AssertFail
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_02239D16:
	movs r0, #2
	ldrsh r0, [r4, r0]
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
_02239D22:
	ldrb r3, [r4, #1]
	ldr r1, [r6]
	ldrh r2, [r6, #0xc]
	adds r3, r3, #2
	lsls r3, r3, #1
	adds r6, r4, r3
	movs r3, #2
	ldrsh r3, [r6, r3]
	add r0, sp, #0
	bl ov80_0222EFD0
	ldr r0, [r5, #0x30]
	add r1, sp, #0
	bl FUN_022299C0
	ldrb r1, [r4, #1]
	movs r0, #2
	ldrsh r2, [r4, r0]
	adds r1, r1, #2
	lsls r1, r1, #1
	adds r1, r4, r1
	ldrsh r0, [r1, r0]
	cmp r2, r0
	bne _02239D5A
	movs r0, #0x2d
	strh r0, [r4, #6]
	movs r0, #1
	b _02239D6A
_02239D5A:
	movs r0, #0x1e
	strh r0, [r4, #6]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	b _02239D6A
_02239D64:
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_02239D6A:
	strb r0, [r4, #1]
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_02239C80

	thumb_func_start ov80_02239D74
ov80_02239D74: @ 0x02239D74
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x65
	movs r1, #0xc
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0xc
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl ov80_02239DD0
	str r0, [r4]
	adds r0, r6, #0
	bl ov80_02239F48
	str r0, [r4, #4]
	movs r0, #9
	str r0, [sp]
	ldr r0, _02239DB4 @ =0x04000050
	movs r1, #4
	movs r2, #0x1f
	movs r3, #8
	blx FUN_020CF15C
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_02239DB4: .4byte 0x04000050
	thumb_func_end ov80_02239D74

	thumb_func_start ov80_02239DB8
ov80_02239DB8: @ 0x02239DB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov80_02239EC4
	ldr r0, [r4, #4]
	bl ov80_02239F94
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov80_02239DB8

	thumb_func_start ov80_02239DD0
ov80_02239DD0: @ 0x02239DD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r1, _02239EAC @ =0x0002200C
	adds r4, r0, #0
	movs r0, #0x65
	bl FUN_0201AA8C
	ldr r2, _02239EAC @ =0x0002200C
	str r0, [sp, #8]
	movs r1, #0
	blx FUN_020D4994
	ldr r0, [sp, #8]
	movs r1, #0x65
	str r4, [r0, #4]
	movs r0, #0xb7
	bl FUN_02007688
	ldr r5, [sp, #8]
	ldr r4, _02239EB0 @ =0x0223DB2C
	str r0, [sp, #4]
	movs r6, #0
	adds r5, #8
_02239DFE:
	movs r0, #0x65
	str r0, [sp]
	ldrh r1, [r4]
	ldr r0, [sp, #4]
	movs r2, #1
	add r3, sp, #0x10
	bl FUN_02007C2C
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	movs r2, #1
	adds r0, #0xc
	adds r1, r5, #0
	lsls r2, r2, #0xc
	blx FUN_020D4808
	adds r0, r7, #0
	bl FUN_0201AB0C
	movs r0, #1
	lsls r0, r0, #0xc
	adds r6, r6, #1
	adds r4, r4, #2
	adds r5, r5, r0
	cmp r6, #2
	blt _02239DFE
	ldr r0, [sp, #4]
	bl FUN_0200770C
	movs r0, #0xb7
	movs r1, #0x65
	bl FUN_02007688
	movs r1, #0x65
	str r1, [sp]
	movs r1, #0xe
	movs r2, #1
	add r3, sp, #0xc
	adds r4, r0, #0
	bl FUN_02007C10
	ldr r3, [sp, #0xc]
	adds r5, r0, #0
	ldr r2, _02239EB4 @ =0x00002008
	ldr r1, [sp, #8]
	ldr r0, [r3, #0x14]
	adds r1, r1, r2
	ldr r2, [r3, #0x10]
	blx FUN_020D4808
	adds r0, r5, #0
	bl FUN_0201AB0C
	movs r0, #0x65
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #1
	add r3, sp, #0xc
	bl FUN_02007C10
	ldr r3, [sp, #0xc]
	adds r5, r0, #0
	ldr r2, _02239EB8 @ =0x00012008
	ldr r1, [sp, #8]
	ldr r0, [r3, #0x14]
	adds r1, r1, r2
	ldr r2, [r3, #0x10]
	blx FUN_020D4808
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, _02239EBC @ =ov80_02239ED8
	ldr r1, [sp, #8]
	ldr r2, _02239EC0 @ =0x0001368C
	bl FUN_0200E320
	ldr r1, [sp, #8]
	str r0, [r1]
	adds r0, r1, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02239EAC: .4byte 0x0002200C
_02239EB0: .4byte 0x0223DB2C
_02239EB4: .4byte 0x00002008
_02239EB8: .4byte 0x00012008
_02239EBC: .4byte ov80_02239ED8
_02239EC0: .4byte 0x0001368C
	thumb_func_end ov80_02239DD0

	thumb_func_start ov80_02239EC4
ov80_02239EC4: @ 0x02239EC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_02239EC4

	thumb_func_start ov80_02239ED8
ov80_02239ED8: @ 0x02239ED8
	push {r3, r4, lr}
	sub sp, #4
	ldr r3, _02239F3C @ =0x00022008
	adds r4, r1, #0
	ldrb r0, [r4, r3]
	cmp r0, #0xc
	bhs _02239EEE
	adds r0, r0, #1
	add sp, #4
	strb r0, [r4, r3]
	pop {r3, r4, pc}
_02239EEE:
	movs r0, #0
	strb r0, [r4, r3]
	str r0, [sp]
	adds r3, r3, #1
	ldrb r3, [r4, r3]
	ldr r2, _02239F40 @ =0x00002008
	ldr r0, [r4, #4]
	adds r2, r4, r2
	lsls r3, r3, #0x10
	adds r2, r2, r3
	movs r3, #1
	movs r1, #3
	lsls r3, r3, #0x10
	bl FUN_0201C0C0
	ldr r2, _02239F44 @ =0x00022009
	adds r3, r4, #0
	ldrb r2, [r4, r2]
	adds r3, #8
	ldr r0, [r4, #4]
	lsls r2, r2, #0xc
	adds r2, r3, r2
	movs r3, #1
	movs r1, #3
	lsls r3, r3, #0xc
	bl FUN_0201C0A8
	ldr r0, [r4, #4]
	movs r1, #3
	bl FUN_0201EFBC
	ldr r1, _02239F44 @ =0x00022009
	movs r0, #1
	ldrb r2, [r4, r1]
	eors r0, r2
	strb r0, [r4, r1]
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239F3C: .4byte 0x00022008
_02239F40: .4byte 0x00002008
_02239F44: .4byte 0x00022009
	thumb_func_end ov80_02239ED8

	thumb_func_start ov80_02239F48
ov80_02239F48: @ 0x02239F48
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x65
	movs r1, #0x6c
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #0
	movs r2, #0x6c
	blx FUN_020D4994
	adds r0, r4, #0
	str r5, [r4, #4]
	movs r1, #2
	adds r0, #0x68
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0200335C
	adds r1, r4, #0
	adds r0, #0xa0
	adds r1, #8
	movs r2, #0x60
	blx FUN_020D47B8
	ldr r0, _02239F8C @ =ov80_02239FA8
	ldr r2, _02239F90 @ =0x0001368D
	adds r1, r4, #0
	bl FUN_0200E320
	str r0, [r4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02239F8C: .4byte ov80_02239FA8
_02239F90: .4byte 0x0001368D
	thumb_func_end ov80_02239F48

	thumb_func_start ov80_02239F94
ov80_02239F94: @ 0x02239F94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_02239F94

	thumb_func_start ov80_02239FA8
ov80_02239FA8: @ 0x02239FA8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r0, [r0]
	cmp r0, #8
	bhs _02239FC8
	adds r0, r4, #0
	adds r0, #0x69
	ldrb r0, [r0]
	adds r4, #0x69
	add sp, #4
	adds r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02239FC8:
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x69
	strb r2, [r0]
	movs r0, #0x20
	str r0, [sp]
	adds r1, #0x68
	ldrb r1, [r1]
	adds r3, r4, #0
	ldr r0, [r4, #4]
	adds r3, #8
	lsls r1, r1, #5
	adds r1, r3, r1
	movs r3, #0x60
	bl FUN_0200316C
	adds r0, r4, #0
	adds r0, #0x68
	ldrb r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x68
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x68
	ldrb r0, [r0]
	cmp r0, #3
	blo _0223A006
	movs r0, #0
	adds r4, #0x68
	strb r0, [r4]
_0223A006:
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov80_02239FA8

	thumb_func_start ov80_0223A00C
ov80_0223A00C: @ 0x0223A00C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	movs r1, #0x5a
	movs r2, #0xfa
	str r3, [sp]
	ldr r0, _0223A0B4 @ =ov80_0223A144
	lsls r1, r1, #2
	lsls r2, r2, #2
	movs r3, #0x65
	bl FUN_02007200
	bl FUN_0201F988
	adds r4, r0, #0
	str r5, [r4, #0x10]
	ldr r0, [sp]
	str r7, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x18]
	add r1, sp, #8
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x20]
	movs r0, #0x18
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0x28]
	movs r0, #0x1c
	ldrsh r0, [r1, r0]
	movs r1, #0x65
	strh r0, [r4, #0x2a]
	movs r0, #0x6d
	bl FUN_02007688
	str r0, [r4, #0x24]
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _0223A05E
	movs r0, #0
	strh r0, [r1]
_0223A05E:
	adds r0, r4, #0
	subs r1, r6, #1
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #1
	bl FUN_0201CB4C
	movs r2, #2
	adds r1, r0, #0
	movs r0, #0
	lsls r2, r2, #0xe
	blx FUN_020D47EC
	movs r2, #0
	adds r0, r5, #0
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201F238
	adds r0, r5, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r1, #0xc
	ldr r3, _0223A0B8 @ =0x0223DB98
	muls r1, r2, r1
	adds r0, r4, #0
	adds r1, r3, r1
	bl ov80_0223A938
	ldr r0, _0223A0BC @ =ov80_0223A0EC
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0200E374
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A0B4: .4byte ov80_0223A144
_0223A0B8: .4byte 0x0223DB98
_0223A0BC: .4byte ov80_0223A0EC
	thumb_func_end ov80_0223A00C

	thumb_func_start ov80_0223A0C0
ov80_0223A0C0: @ 0x0223A0C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #5
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_0200E390
	ldr r0, [r5, #0x34]
	bl FUN_0200E390
	ldr r0, [r5, #0x24]
	bl FUN_0200770C
	ldr r1, [r5, #0xc]
	movs r0, #0x65
	bl FUN_0201AB80
	adds r0, r4, #0
	bl FUN_02007234
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223A0C0

	thumb_func_start ov80_0223A0EC
ov80_0223A0EC: @ 0x0223A0EC
	push {r3, r4, r5, r6}
	adds r0, r1, #0
	ldr r1, _0223A13C @ =0x00000151
	subs r2, r1, #2
	ldrb r3, [r0, r2]
	subs r2, r1, #3
	ldrb r2, [r0, r2]
	ldrb r4, [r0, r1]
	lsls r3, r3, #8
	lsls r5, r2, #8
	adds r6, r5, #0
	subs r5, r1, #1
	movs r2, #0xff
	lsls r2, r2, #8
	ands r3, r2
	ldrb r5, [r0, r5]
	ands r6, r2
	orrs r3, r4
	orrs r5, r6
	ldr r6, _0223A140 @ =0x04000040
	strh r5, [r6]
	strh r3, [r6, #4]
	adds r3, r1, #4
	ldrb r5, [r0, r3]
	adds r3, r1, #2
	ldrb r4, [r0, r3]
	adds r3, r1, #1
	ldrb r3, [r0, r3]
	adds r1, r1, #3
	ldrb r0, [r0, r1]
	lsls r3, r3, #8
	ands r3, r2
	orrs r0, r3
	strh r0, [r6, #2]
	lsls r0, r4, #8
	ands r0, r2
	orrs r0, r5
	strh r0, [r6, #6]
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
_0223A13C: .4byte 0x00000151
_0223A140: .4byte 0x04000040
	thumb_func_end ov80_0223A0EC

	thumb_func_start ov80_0223A144
ov80_0223A144: @ 0x0223A144
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r3, r4, #0
	adds r3, #0x2c
	ldrb r6, [r3]
	movs r3, #0xc
	ldr r2, _0223A170 @ =0x0223DB98
	muls r3, r6, r3
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0x65
	adds r2, r2, r3
	bl ov80_0223A174
	cmp r0, #1
	bne _0223A16C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov80_0223A0C0
_0223A16C:
	pop {r4, r5, r6, pc}
	nop
_0223A170: .4byte 0x0223DB98
	thumb_func_end ov80_0223A144

	thumb_func_start ov80_0223A174
ov80_0223A174: @ 0x0223A174
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r4]
	adds r7, r2, #0
	ldr r5, [r4, #0xc]
	cmp r1, #0x12
	bls _0223A188
	b _0223A620
_0223A188:
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_0223A194: @ jump table
	.2byte _0223A1BA - _0223A194 - 2 @ case 0
	.2byte _0223A410 - _0223A194 - 2 @ case 1
	.2byte _0223A42E - _0223A194 - 2 @ case 2
	.2byte _0223A43E - _0223A194 - 2 @ case 3
	.2byte _0223A458 - _0223A194 - 2 @ case 4
	.2byte _0223A468 - _0223A194 - 2 @ case 5
	.2byte _0223A476 - _0223A194 - 2 @ case 6
	.2byte _0223A48A - _0223A194 - 2 @ case 7
	.2byte _0223A4A6 - _0223A194 - 2 @ case 8
	.2byte _0223A4AC - _0223A194 - 2 @ case 9
	.2byte _0223A4C4 - _0223A194 - 2 @ case 10
	.2byte _0223A4D0 - _0223A194 - 2 @ case 11
	.2byte _0223A4F4 - _0223A194 - 2 @ case 12
	.2byte _0223A57A - _0223A194 - 2 @ case 13
	.2byte _0223A594 - _0223A194 - 2 @ case 14
	.2byte _0223A5A8 - _0223A194 - 2 @ case 15
	.2byte _0223A5B8 - _0223A194 - 2 @ case 16
	.2byte _0223A5D8 - _0223A194 - 2 @ case 17
	.2byte _0223A5E8 - _0223A194 - 2 @ case 18
_0223A1BA:
	adds r0, r6, #0
	movs r1, #0x94
	bl FUN_0201AA8C
	str r0, [r4, #0xc]
	movs r1, #0
	movs r2, #0x94
	blx FUN_020E5B44
	ldr r5, [r4, #0xc]
	ldr r0, [r4, #0x24]
	movs r1, #2
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A50C @ =0x000007D4
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl FUN_0200D68C
	movs r3, #0x59
	adds r1, r0, #0
	lsls r3, r3, #2
	movs r2, #1
	lsls r2, r1
	ldr r0, [r4, r3]
	movs r1, #0x65
	orrs r0, r2
	str r0, [r4, r3]
	movs r0, #4
	bl FUN_02013534
	str r0, [r4, #0x30]
	ldr r2, _0223A510 @ =0x000002D9
	movs r0, #1
	movs r1, #0x1b
	adds r3, r6, #0
	bl FUN_0200BAF8
	ldr r1, [r7]
	str r0, [sp, #0x20]
	bl FUN_0200BBA0
	str r0, [sp, #0x24]
	ldr r0, _0223A514 @ =0x00010200
	adds r1, r5, #0
	str r0, [sp]
	movs r3, #0
	ldr r0, _0223A50C @ =0x000007D4
	str r3, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x28
	ldrsh r0, [r4, r0]
	ldr r2, [sp, #0x24]
	adds r1, #0x7c
	adds r0, #0x74
	str r0, [sp, #0xc]
	movs r0, #0x2a
	ldrsh r0, [r4, r0]
	adds r0, #0x58
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	adds r0, r4, #0
	bl ov80_0223A62C
	ldr r0, [r5, #0x7c]
	movs r1, #0
	bl FUN_020137C0
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	ldr r0, [sp, #0x20]
	bl FUN_0200BB44
	ldr r0, [r4, #0x24]
	movs r1, #2
	str r0, [sp]
	ldrb r0, [r7, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A518 @ =0x000007D2
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl FUN_0200D68C
	movs r3, #0x16
	lsls r3, r3, #4
	str r0, [r4, r3]
	adds r0, r3, #4
	ldr r2, [r4, r3]
	movs r1, #1
	ldr r0, [r4, r0]
	lsls r1, r2
	orrs r1, r0
	adds r0, r3, #4
	str r1, [r4, r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0223A51C @ =0x000007DA
	str r0, [sp, #8]
	ldrb r3, [r7, #5]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0223A518 @ =0x000007D2
	str r0, [sp, #4]
	ldrb r3, [r7, #6]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0223A518 @ =0x000007D2
	str r0, [sp, #4]
	ldrb r3, [r7, #7]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl FUN_0200D71C
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0
	movs r2, #0x16
	str r0, [sp, #4]
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	lsls r2, r2, #0x14
	movs r1, #2
	lsrs r2, r2, #0x10
	movs r3, #0x10
	bl FUN_02003E5C
	ldr r0, [r4, #0x24]
	movs r1, #2
	str r0, [sp]
	movs r0, #0x3b
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A520 @ =0x000007D3
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl FUN_0200D68C
	adds r3, r0, #0
	movs r7, #0x59
	movs r0, #1
	lsls r7, r7, #2
	adds r1, r0, #0
	lsls r1, r3
	ldr r2, [r4, r7]
	movs r3, #0xcc
	orrs r1, r2
	str r1, [r4, r7]
	movs r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, _0223A524 @ =0x000007DB
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0223A520 @ =0x000007D3
	movs r3, #0xcd
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0223A520 @ =0x000007D3
	movs r3, #0xce
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl FUN_0200D71C
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, _0223A528 @ =0x0223DB30
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0x90
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_0200DC0C
	movs r0, #0x2a
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0223A3AA
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	str r0, [sp, #0x1c]
	b _0223A3BA
_0223A3AA:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
	str r0, [sp, #0x1c]
_0223A3BA:
	movs r0, #0x28
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0223A3D4
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _0223A3E2
_0223A3D4:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_0223A3E2:
	blx FUN_020F2104
	adds r7, r0, #0
	ldr r0, [sp, #0x1c]
	blx FUN_020F2104
	adds r5, #0x14
	adds r1, r5, #0
	movs r2, #0x12
	movs r5, #0x52
	adds r3, r0, #0
	lsls r2, r2, #0xe
	lsls r5, r5, #0xc
	str r6, [sp]
	adds r0, r4, #0
	adds r2, r7, r2
	adds r3, r3, r5
	bl ov80_0223A78C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A410:
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	ldr r3, _0223A52C @ =0x00007FFF
	str r6, [sp, #8]
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A42E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223A4FC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A43E:
	movs r0, #3
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0223A52C @ =0x00007FFF
	str r6, [sp, #8]
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A458:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223A4FC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A468:
	movs r1, #0
	bl ov80_0223AA80
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A476:
	movs r0, #0x53
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0223A4FC
	adds r0, r1, #1
	str r0, [r4]
	movs r0, #0xa
	str r0, [r5, #0x78]
	b _0223A620
_0223A48A:
	ldr r0, [r5, #0x78]
	subs r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A4FC
	adds r5, #0x14
	adds r0, r5, #0
	bl ov80_0223A834
	cmp r0, #1
	bne _0223A4FC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4A6:
	adds r0, r1, #1
	str r0, [r4]
	b _0223A620
_0223A4AC:
	movs r2, #0x56
	lsls r2, r2, #2
	adds r1, r5, #0
	adds r2, r4, r2
	bl ov80_0223AB94
	cmp r0, #1
	bne _0223A4FC
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4C4:
	movs r0, #0xa
	str r0, [r5, #0x78]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4D0:
	ldr r0, [r5, #0x78]
	subs r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A4FC
	movs r0, #3
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r1, #0
	ldr r3, _0223A52C @ =0x00007FFF
	str r6, [sp, #8]
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4F4:
	bl FUN_0200FB5C
	cmp r0, #0
	bne _0223A4FE
_0223A4FC:
	b _0223A620
_0223A4FE:
	movs r0, #0
	movs r2, #0x59
	str r0, [sp]
	lsls r2, r2, #2
	ldr r3, [r4, r2]
	ldr r2, _0223A530 @ =0x00003FFF
	b _0223A534
	.align 2, 0
_0223A50C: .4byte 0x000007D4
_0223A510: .4byte 0x000002D9
_0223A514: .4byte 0x00010200
_0223A518: .4byte 0x000007D2
_0223A51C: .4byte 0x000007DA
_0223A520: .4byte 0x000007D3
_0223A524: .4byte 0x000007DB
_0223A528: .4byte 0x0223DB30
_0223A52C: .4byte 0x00007FFF
_0223A530: .4byte 0x00003FFF
_0223A534:
	ldr r0, [r4, #0x1c]
	eors r2, r3
	lsls r2, r2, #0x10
	movs r1, #2
	lsrs r2, r2, #0x10
	movs r3, #0xe
	bl FUN_02003EA4
	movs r0, #0
	str r0, [sp]
	movs r2, #0x16
	str r0, [sp, #4]
	lsls r2, r2, #4
	ldr r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	lsls r2, r2, #0x14
	movs r1, #2
	lsrs r2, r2, #0x10
	movs r3, #0x10
	bl FUN_02003E5C
	movs r0, #0xd
	mvns r0, r0
	movs r1, #0x2c
	movs r2, #1
	bl FUN_0200B4F0
	ldr r0, [r5, #0x7c]
	movs r1, #1
	bl FUN_020137C0
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A57A:
	movs r0, #3
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0223A628 @ =0x00007FFF
	str r6, [sp, #8]
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A594:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223A620
	movs r0, #0x1a
	str r0, [r5, #0x78]
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5A8:
	ldr r0, [r5, #0x78]
	subs r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A620
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5B8:
	movs r0, #0xf
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x65
	movs r1, #0
	str r0, [sp, #8]
	ldr r3, _0223A628 @ =0x00007FFF
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5D8:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _0223A620
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5E8:
	ldr r1, _0223A628 @ =0x00007FFF
	movs r0, #1
	bl FUN_0200FBF4
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _0223A5FA
	movs r0, #1
	strh r0, [r1]
_0223A5FA:
	adds r0, r5, #0
	adds r0, #0x7c
	bl ov80_0223A748
	ldr r0, [r4, #0x30]
	bl FUN_020135AC
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_0200D9DC
	adds r5, #0x14
	adds r0, r5, #0
	bl ov80_0223A81C
	add sp, #0x28
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223A620:
	movs r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A628: .4byte 0x00007FFF
	thumb_func_end ov80_0223A174

	thumb_func_start ov80_0223A62C
ov80_0223A62C: @ 0x0223A62C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	adds r5, r1, #0
	adds r7, r0, #0
	ldr r0, [r5]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #0x9c]
	ldr r4, [sp, #0xa8]
	cmp r0, #0
	beq _0223A646
	bl GF_AssertFail
_0223A646:
	ldr r0, [r7, #0x10]
	cmp r4, #0
	str r0, [sp, #0x24]
	ldr r0, [r7, #0x18]
	str r0, [sp, #0x20]
	bne _0223A660
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r2, sp, #0x2c
	add r3, sp, #0x28
	bl ov80_0223A75C
	b _0223A668
_0223A660:
	ldrh r0, [r4, #0x12]
	str r0, [sp, #0x2c]
	ldrh r0, [r4, #0x10]
	str r0, [sp, #0x28]
_0223A668:
	cmp r4, #0
	bne _0223A6A6
	add r0, sp, #0x3c
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x28]
	ldr r0, [sp, #0x24]
	lsls r2, r2, #0x18
	add r1, sp, #0x3c
	lsrs r2, r2, #0x18
	movs r3, #2
	bl FUN_0201D494
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x18]
	add r0, sp, #0x3c
	str r3, [sp, #0x14]
	bl FUN_02020150
	b _0223A6B2
_0223A6A6:
	adds r3, r4, #0
	add r2, sp, #0x3c
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
_0223A6B2:
	add r0, sp, #0x3c
	movs r1, #1
	movs r2, #0x65
	bl FUN_02013688
	movs r1, #1
	adds r2, r1, #0
	add r3, sp, #0x30
	bl FUN_02021AC8
	ldr r0, [sp, #0xa4]
	cmp r0, #1
	bne _0223A6D6
	ldr r1, [sp, #0x2c]
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	subs r6, r6, r0
_0223A6D6:
	ldr r0, [r7, #0x30]
	str r0, [sp, #0x4c]
	add r0, sp, #0x3c
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x20]
	bl FUN_0200E2B0
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x98]
	bl FUN_0200D934
	movs r1, #0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x5c]
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xa0]
	str r6, [sp, #0x64]
	subs r0, #8
	str r0, [sp, #0x68]
	movs r0, #0xb
	str r0, [sp, #0x70]
	movs r0, #1
	str r0, [sp, #0x74]
	movs r0, #0x65
	str r0, [sp, #0x78]
	add r0, sp, #0x4c
	str r1, [sp, #0x6c]
	bl FUN_020135D8
	ldr r1, [sp, #0x94]
	adds r7, r0, #0
	bl FUN_020138E0
	ldr r2, [sp, #0xa0]
	adds r0, r7, #0
	adds r1, r6, #0
	subs r2, #8
	bl FUN_020136B4
	cmp r4, #0
	bne _0223A732
	add r0, sp, #0x3c
	bl FUN_0201D520
_0223A732:
	str r7, [r5]
	add r3, sp, #0x30
	ldm r3!, {r0, r1}
	adds r2, r5, #4
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x2c]
	strh r0, [r5, #0x10]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223A62C

	thumb_func_start ov80_0223A748
ov80_0223A748: @ 0x0223A748
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_02013660
	adds r0, r4, #4
	bl FUN_02021B5C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223A748

	thumb_func_start ov80_0223A75C
ov80_0223A75C: @ 0x0223A75C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r2, #0
	adds r0, r1, #0
	adds r1, r4, #0
	movs r2, #0
	adds r7, r3, #0
	bl FUN_02002F30
	adds r4, r0, #0
	asrs r1, r4, #2
	lsrs r1, r1, #0x1d
	adds r1, r4, r1
	asrs r5, r1, #3
	movs r1, #8
	blx FUN_020CCD3C
	cmp r0, #0
	beq _0223A784
	adds r5, r5, #1
_0223A784:
	str r4, [r6]
	str r5, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0223A75C

	thumb_func_start ov80_0223A78C
ov80_0223A78C: @ 0x0223A78C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r6, r3, #0
	mov ip, r2
	ldr r3, _0223A818 @ =0x0223DB64
	adds r7, r0, #0
	adds r4, r1, #0
	add r2, sp, #0
	movs r5, #6
_0223A79E:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r5, r5, #1
	bne _0223A79E
	ldr r0, [r3]
	adds r5, r4, #0
	str r0, [r2]
	mov r0, ip
	asrs r1, r0, #0xc
	add r0, sp, #0
	strh r1, [r0]
	asrs r1, r6, #0xc
	strh r1, [r0, #2]
	movs r6, #0
	strh r6, [r4]
	strh r6, [r4, #2]
	adds r5, #0x14
_0223A7C0:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	add r2, sp, #0
	bl FUN_0200D734
	movs r1, #0
	str r0, [r4, #4]
	bl FUN_0200DCE8
	cmp r6, #3
	beq _0223A7FA
	ldr r0, [r4, #4]
	movs r1, #2
	ldr r0, [r0]
	bl FUN_0202487C
	ldr r0, [r4, #4]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_020248F0
	movs r1, #2
	lsls r1, r1, #0xc
	adds r0, r5, #0
	lsrs r2, r1, #1
	movs r3, #6
	bl ov80_0223A8C4
	b _0223A808
_0223A7FA:
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #6
	bl ov80_0223A8C4
_0223A808:
	adds r6, r6, #1
	adds r4, r4, #4
	adds r5, #0x14
	cmp r6, #4
	blt _0223A7C0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0223A818: .4byte 0x0223DB64
	thumb_func_end ov80_0223A78C

	thumb_func_start ov80_0223A81C
ov80_0223A81C: @ 0x0223A81C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0223A822:
	ldr r0, [r5, #4]
	bl FUN_0200D9DC
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0223A822
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0223A81C

	thumb_func_start ov80_0223A834
ov80_0223A834: @ 0x0223A834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	movs r0, #1
	movs r1, #2
	str r0, [sp]
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bge _0223A862
	movs r0, #0
	str r0, [sp]
	ldrsh r0, [r7, r0]
	subs r0, r0, #1
	strh r0, [r7]
	ldr r0, [sp]
	ldrsh r0, [r7, r0]
	cmp r0, #0
	bgt _0223A862
	movs r0, #3
	strh r0, [r7]
	ldrsh r0, [r7, r1]
	adds r0, r0, #1
	strh r0, [r7, #2]
_0223A862:
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #2
	ldrsh r0, [r7, r0]
	cmp r0, #0
	ble _0223A8BE
	adds r6, r7, #0
	adds r6, #0x14
	adds r4, r7, #0
	adds r5, r7, #0
_0223A876:
	adds r0, r6, #0
	bl ov80_0223A8D4
	ldr r1, [r4, #0x14]
	str r0, [sp, #8]
	add r0, sp, #0xc
	adds r2, r1, #0
	adds r3, r1, #0
	bl ov80_0223A91C
	ldr r0, [r5, #4]
	add r1, sp, #0xc
	ldr r0, [r0]
	bl FUN_020247F4
	ldr r0, [r5, #4]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_02024830
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0223A8A8
	movs r0, #0
	str r0, [sp]
_0223A8A8:
	ldr r0, [sp, #4]
	adds r6, #0x14
	adds r0, r0, #1
	str r0, [sp, #4]
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [sp, #4]
	adds r4, #0x14
	adds r5, r5, #4
	cmp r0, r1
	blt _0223A876
_0223A8BE:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223A834

	thumb_func_start ov80_0223A8C4
ov80_0223A8C4: @ 0x0223A8C4
	str r1, [r0]
	str r1, [r0, #4]
	subs r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov80_0223A8C4

	thumb_func_start ov80_0223A8D4
ov80_0223A8D4: @ 0x0223A8D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
	lsls r2, r2, #0xc
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r0, r0, r2
	adcs r1, r3
	lsls r1, r1, #0x14
	lsrs r0, r0, #0xc
	orrs r0, r1
	ldr r1, [r4, #0x10]
	lsls r1, r1, #0xc
	blx FUN_020CCBA0
	ldr r1, [r4, #4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r0, r0, #1
	cmp r0, r1
	bgt _0223A914
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
_0223A914:
	str r1, [r4, #0xc]
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223A8D4

	thumb_func_start ov80_0223A91C
ov80_0223A91C: @ 0x0223A91C
	push {r4}
	sub sp, #0xc
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r2, sp, #0
	adds r4, r0, #0
	str r1, [sp]
	ldm r2!, {r0, r1}
	stm r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r4}
	bx lr
	thumb_func_end ov80_0223A91C

	thumb_func_start ov80_0223A938
ov80_0223A938: @ 0x0223A938
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r3, #1
	lsls r3, r3, #0x1a
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r3]
	ldr r0, _0223AA3C @ =0xFFFF1FFF
	adds r2, r3, #0
	ands r1, r0
	movs r0, #6
	lsls r0, r0, #0xc
	orrs r0, r1
	str r0, [r3]
	adds r2, #0x48
	ldrh r6, [r2]
	movs r0, #0x3f
	movs r1, #0x1f
	bics r6, r0
	orrs r1, r6
	movs r7, #0x20
	orrs r1, r7
	strh r1, [r2]
	ldrh r6, [r2]
	ldr r1, _0223AA40 @ =0xFFFFC0FF
	ands r1, r6
	movs r6, #0x1f
	lsls r6, r6, #8
	orrs r6, r1
	lsls r1, r7, #8
	orrs r1, r6
	strh r1, [r2]
	adds r1, r3, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	bics r2, r0
	movs r0, #0x1d
	orrs r0, r2
	orrs r0, r7
	strh r0, [r1]
	adds r1, r3, #0
	movs r0, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r1, r3, #0
	adds r1, #0x44
	strh r0, [r1]
	adds r1, r3, #0
	adds r1, #0x42
	strh r0, [r1]
	adds r3, #0x46
	strh r0, [r3]
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xc0
	str r0, [sp, #8]
	ldrb r2, [r4, #8]
	ldr r0, [r5, #0x1c]
	movs r1, #0x6d
	movs r3, #0x65
	bl FUN_02003200
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldrb r1, [r4, #9]
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x10]
	movs r3, #1
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x65
	str r0, [sp, #0xc]
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x10]
	movs r3, #1
	bl FUN_02007B68
	adds r0, r7, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r2, #0
	ldr r0, [r5, #0x10]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201CA4C
	ldr r0, [r5, #0x10]
	movs r1, #1
	bl FUN_0201EFBC
	ldrb r1, [r4, #8]
	movs r0, #0x6d
	add r2, sp, #0x10
	movs r3, #0x65
	bl FUN_020079F4
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r0, [r0, #0xc]
	adds r1, #0x40
	adds r2, #0xe0
	blx FUN_020D47B8
	adds r0, r4, #0
	bl FUN_0201AB0C
	ldr r0, _0223AA44 @ =ov80_0223AA4C
	ldr r2, _0223AA48 @ =0x0000044C
	adds r1, r5, #0
	bl FUN_0200E320
	movs r1, #5
	lsls r1, r1, #6
	str r0, [r5, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223AA3C: .4byte 0xFFFF1FFF
_0223AA40: .4byte 0xFFFFC0FF
_0223AA44: .4byte ov80_0223AA4C
_0223AA48: .4byte 0x0000044C
	thumb_func_end ov80_0223A938

	thumb_func_start ov80_0223AA4C
ov80_0223AA4C: @ 0x0223AA4C
	push {r3, lr}
	ldr r0, [r1, #0x38]
	adds r0, r0, #1
	str r0, [r1, #0x38]
	bmi _0223AA7E
	movs r2, #0
	str r2, [r1, #0x38]
	ldr r0, [r1, #0x3c]
	adds r0, r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #8
	blt _0223AA66
	str r2, [r1, #0x3c]
_0223AA66:
	movs r0, #0x20
	str r0, [sp]
	adds r2, r1, #0
	ldr r0, [r1, #0x1c]
	ldr r1, [r1, #0x3c]
	adds r2, #0x40
	lsls r1, r1, #5
	adds r1, r2, r1
	movs r2, #0
	movs r3, #0xc0
	bl FUN_0200316C
_0223AA7E:
	pop {r3, pc}
	thumb_func_end ov80_0223AA4C

	thumb_func_start ov80_0223AA80
ov80_0223AA80: @ 0x0223AA80
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r1, #0x51
	lsls r1, r1, #2
	adds r4, r0, r1
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	cmp r5, #0
	bne _0223AAAE
	movs r0, #5
	lsls r0, r0, #0xc
	str r0, [r4]
	str r0, [r4, #4]
	movs r2, #0xfa
	ldr r0, _0223AAC8 @ =ov80_0223AAD0
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
_0223AAAE:
	movs r0, #0x2e
	lsls r0, r0, #8
	str r0, [r4]
	movs r0, #0x72
	lsls r0, r0, #8
	str r0, [r4, #4]
	movs r2, #0xfa
	ldr r0, _0223AACC @ =ov80_0223AB34
	adds r1, r4, #0
	lsls r2, r2, #2
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223AAC8: .4byte ov80_0223AAD0
_0223AACC: .4byte ov80_0223AB34
	thumb_func_end ov80_0223AA80

	thumb_func_start ov80_0223AAD0
ov80_0223AAD0: @ 0x0223AAD0
	push {r3, lr}
	ldrb r2, [r1, #9]
	cmp r2, #0
	bne _0223AB28
	movs r0, #2
	ldr r2, [r1]
	lsls r0, r0, #0xa
	subs r2, r2, r0
	str r2, [r1]
	ldr r2, [r1, #4]
	adds r0, r2, r0
	str r0, [r1, #4]
	movs r0, #0x2e
	ldr r2, [r1]
	lsls r0, r0, #8
	cmp r2, r0
	bgt _0223AB00
	str r0, [r1]
	movs r0, #0x72
	lsls r0, r0, #8
	str r0, [r1, #4]
	ldrb r0, [r1, #9]
	adds r0, r0, #1
	strb r0, [r1, #9]
_0223AB00:
	movs r0, #0
	strb r0, [r1, #0xa]
	ldr r2, [r1]
	asrs r2, r2, #8
	strb r2, [r1, #0xb]
	movs r2, #0xff
	strb r2, [r1, #0xc]
	ldr r2, [r1, #4]
	asrs r2, r2, #8
	strb r2, [r1, #0xd]
	movs r2, #1
	strb r2, [r1, #0xe]
	ldr r2, [r1]
	asrs r2, r2, #8
	strb r2, [r1, #0xf]
	strb r0, [r1, #0x10]
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	strb r0, [r1, #0x11]
	pop {r3, pc}
_0223AB28:
	movs r2, #1
	strb r2, [r1, #8]
	bl FUN_0200E390
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0223AAD0

	thumb_func_start ov80_0223AB34
ov80_0223AB34: @ 0x0223AB34
	push {r3, lr}
	ldrb r2, [r1, #9]
	cmp r2, #0
	bne _0223AB88
	movs r0, #2
	ldr r2, [r1]
	lsls r0, r0, #0xa
	adds r2, r2, r0
	str r2, [r1]
	ldr r2, [r1, #4]
	subs r0, r2, r0
	str r0, [r1, #4]
	movs r0, #5
	ldr r2, [r1]
	lsls r0, r0, #0xc
	cmp r2, r0
	blt _0223AB60
	str r0, [r1]
	str r0, [r1, #4]
	ldrb r0, [r1, #9]
	adds r0, r0, #1
	strb r0, [r1, #9]
_0223AB60:
	movs r0, #0
	strb r0, [r1, #0xa]
	ldr r2, [r1]
	asrs r2, r2, #8
	strb r2, [r1, #0xb]
	movs r2, #0xff
	strb r2, [r1, #0xc]
	ldr r2, [r1, #4]
	asrs r2, r2, #8
	strb r2, [r1, #0xd]
	movs r2, #1
	strb r2, [r1, #0xe]
	ldr r2, [r1]
	asrs r2, r2, #8
	strb r2, [r1, #0xf]
	strb r0, [r1, #0x10]
	ldr r0, [r1, #4]
	asrs r0, r0, #8
	strb r0, [r1, #0x11]
	pop {r3, pc}
_0223AB88:
	movs r2, #1
	strb r2, [r1, #8]
	bl FUN_0200E390
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0223AB34

	thumb_func_start ov80_0223AB94
ov80_0223AB94: @ 0x0223AB94
	push {r3, r4, r5, lr}
	adds r4, r2, #0
	adds r3, r0, #0
	ldr r0, [r4, #4]
	adds r5, r1, #0
	cmp r0, #0
	beq _0223ABA8
	cmp r0, #1
	beq _0223ABE4
	b _0223AC1C
_0223ABA8:
	movs r1, #0x28
	ldrsh r2, [r3, r1]
	adds r1, #0xd8
	adds r0, r5, #0
	adds r1, r2, r1
	movs r2, #0x2a
	ldrsh r2, [r3, r2]
	adds r0, #0x90
	lsls r1, r1, #0x10
	adds r2, #0x50
	lsls r2, r2, #0x10
	movs r3, #2
	ldr r0, [r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
	adds r5, #0x90
	ldr r0, [r5]
	movs r1, #1
	bl FUN_0200DCE8
	movs r0, #1
	lsls r0, r0, #0x10
	str r0, [r4]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _0223AC20
_0223ABE4:
	movs r0, #0xf
	ldr r1, [r4]
	lsls r0, r0, #8
	subs r1, r1, r0
	movs r0, #0xd
	lsls r0, r0, #0xc
	str r1, [r4]
	cmp r1, r0
	bgt _0223ABFE
	str r0, [r4]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
_0223ABFE:
	movs r2, #0x2a
	ldrsh r2, [r3, r2]
	ldr r1, [r4]
	adds r5, #0x90
	adds r2, #0x50
	lsls r1, r1, #8
	lsls r2, r2, #0x10
	movs r3, #2
	ldr r0, [r5]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x14
	bl FUN_0200DDF4
	b _0223AC20
_0223AC1C:
	movs r0, #1
	pop {r3, r4, r5, pc}
_0223AC20:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223AB94

	thumb_func_start ov80_0223AC24
ov80_0223AC24: @ 0x0223AC24
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	movs r0, #0xb
	movs r1, #0x4c
	str r2, [sp]
	adds r5, r3, #0
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x4c
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, _0223AC64 @ =ov80_0223AC68
	adds r1, r4, #0
	movs r2, #5
	bl FUN_0200E320
	str r5, [r4, #0x48]
	cmp r5, #0
	beq _0223AC54
	movs r0, #0
	str r0, [r5]
_0223AC54:
	str r6, [r4, #0xc]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223AC64: .4byte ov80_0223AC68
	thumb_func_end ov80_0223AC24

	thumb_func_start ov80_0223AC68
ov80_0223AC68: @ 0x0223AC68
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	ldr r1, [r4]
	cmp r1, #5
	bhi _0223AD4E
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0223AC80: @ jump table
	.2byte _0223AC8C - _0223AC80 - 2 @ case 0
	.2byte _0223ACC4 - _0223AC80 - 2 @ case 1
	.2byte _0223ACDE - _0223AC80 - 2 @ case 2
	.2byte _0223ACF2 - _0223AC80 - 2 @ case 3
	.2byte _0223AD0C - _0223AC80 - 2 @ case 4
	.2byte _0223AD30 - _0223AC80 - 2 @ case 5
_0223AC8C:
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _0223ACA6
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	ldr r2, [r4, #0x14]
	adds r0, #0x30
	movs r1, #0
	movs r3, #2
	bl ov80_0223AD7C
	b _0223ACBC
_0223ACA6:
	cmp r0, #2
	bne _0223ACBC
	movs r0, #8
	str r0, [sp]
	adds r0, r4, #0
	ldr r2, [r4, #0x14]
	adds r0, #0x30
	movs r1, #0
	movs r3, #1
	bl ov80_0223AD7C
_0223ACBC:
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACC4:
	movs r0, #3
	str r0, [sp]
	adds r0, r4, #0
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0xc]
	adds r0, #0x18
	movs r1, #0
	bl ov80_0223AD7C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACDE:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov80_0223AD88
	cmp r0, #0
	beq _0223AD4E
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACF2:
	movs r0, #3
	str r0, [sp]
	adds r0, r4, #0
	ldr r1, [r4, #0x10]
	ldr r3, [r4, #0xc]
	adds r0, #0x18
	movs r2, #0
	bl ov80_0223AD7C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223AD0C:
	adds r0, r4, #0
	adds r0, #0x18
	bl ov80_0223AD88
	cmp r0, #0
	beq _0223AD4E
	ldr r0, [r4, #8]
	adds r1, r0, #1
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _0223AD2A
	movs r0, #5
	str r0, [r4]
	b _0223AD4E
_0223AD2A:
	movs r0, #1
	str r0, [r4]
	b _0223AD4E
_0223AD30:
	movs r1, #0
	str r1, [r4]
	str r1, [r4, #8]
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0223AD40
	movs r1, #1
	str r1, [r2]
_0223AD40:
	bl FUN_0200E390
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #4
	pop {r3, r4, pc}
_0223AD4E:
	adds r4, #0x30
	adds r0, r4, #0
	bl ov80_0223AD88
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223AC68

	thumb_func_start ov80_0223AD5C
ov80_0223AD5C: @ 0x0223AD5C
	push {r3, lr}
	cmp r0, #1
	bne _0223AD6A
	ldr r0, _0223AD74 @ =0x0400006C
	blx FUN_020CDA80
	pop {r3, pc}
_0223AD6A:
	ldr r0, _0223AD78 @ =0x0400106C
	blx FUN_020CDA80
	pop {r3, pc}
	nop
_0223AD74: .4byte 0x0400006C
_0223AD78: .4byte 0x0400106C
	thumb_func_end ov80_0223AD5C

	thumb_func_start ov80_0223AD7C
ov80_0223AD7C: @ 0x0223AD7C
	push {r3, lr}
	str r3, [r0, #0x14]
	ldr r3, [sp, #8]
	bl ov80_0223ADB8
	pop {r3, pc}
	thumb_func_end ov80_0223AD7C

	thumb_func_start ov80_0223AD88
ov80_0223AD88: @ 0x0223AD88
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov80_0223ADC8
	adds r4, r0, #0
	ldr r0, _0223ADA0 @ =ov80_0223ADA4
	adds r1, r5, #0
	movs r2, #0xa
	bl FUN_0200E374
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223ADA0: .4byte ov80_0223ADA4
	thumb_func_end ov80_0223AD88

	thumb_func_start ov80_0223ADA4
ov80_0223ADA4: @ 0x0223ADA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1]
	bl ov80_0223AD5C
	adds r0, r4, #0
	bl FUN_0200E390
	pop {r4, pc}
	thumb_func_end ov80_0223ADA4

	thumb_func_start ov80_0223ADB8
ov80_0223ADB8: @ 0x0223ADB8
	str r1, [r0]
	str r1, [r0, #4]
	subs r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov80_0223ADB8

	thumb_func_start ov80_0223ADC8
ov80_0223ADC8: @ 0x0223ADC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	muls r0, r1, r0
	ldr r1, [r4, #0x10]
	blx FUN_020F2998
	ldr r1, [r4, #4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r0, r0, #1
	cmp r0, r1
	bgt _0223ADEE
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
_0223ADEE:
	str r1, [r4, #0xc]
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0223ADC8

	thumb_func_start ov80_0223ADF4
ov80_0223ADF4: @ 0x0223ADF4
	push {r4, lr}
	movs r1, #0x30
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x30
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223ADF4

	thumb_func_start ov80_0223AE0C
ov80_0223AE0C: @ 0x0223AE0C
	ldr r3, _0223AE10 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_0223AE10: .4byte FUN_0201AB0C
	thumb_func_end ov80_0223AE0C

	thumb_func_start ov80_0223AE14
ov80_0223AE14: @ 0x0223AE14
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r0, #0
	beq _0223AE2A
	bl GF_AssertFail
_0223AE2A:
	ldr r3, [sp, #0x1c]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov80_0223ADB8
	adds r0, r5, #0
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, #0x14
	adds r1, r7, #0
	bl ov80_0223ADB8
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [r5, #0x28]
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, r5, #0
	ldr r1, [sp, #0x28]
	adds r0, #0x2d
	strb r1, [r0]
	add r0, sp, #0x2c
	ldrb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x2f
	strb r1, [r0]
	movs r0, #1
	adds r5, #0x2e
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov80_0223AE14

	thumb_func_start ov80_0223AE6C
ov80_0223AE6C: @ 0x0223AE6C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223AE82
	add sp, #8
	movs r0, #1
	pop {r4, r5, r6, pc}
_0223AE82:
	bl ov80_0223ADC8
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x14
	bl ov80_0223ADC8
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	ldr r2, [r5]
	ldr r6, [r5, #0x14]
	lsrs r1, r0, #1
	subs r1, r2, r1
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	adds r1, r5, #0
	adds r1, #0x2d
	ldrb r2, [r1]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsrs r1, r2, #1
	str r0, [sp]
	adds r0, r5, #0
	subs r1, r6, r1
	adds r0, #0x2f
	lsls r1, r1, #0x10
	ldrb r0, [r0]
	asrs r1, r1, #0x10
	adds r2, r1, r2
	str r0, [sp, #4]
	lsls r2, r2, #0x10
	ldr r0, [r5, #0x28]
	asrs r2, r2, #0x10
	bl ov80_0223AED4
	adds r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0223AE6C

	thumb_func_start ov80_0223AED4
ov80_0223AED4: @ 0x0223AED4
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r5, [sp, #0x18]
	adds r4, r1, #0
	cmp r5, #0
	ble _0223AF2C
	cmp r2, #0
	ble _0223AF2C
	cmp r3, r5
	beq _0223AF2C
	cmp r4, r2
	beq _0223AF2C
	cmp r3, #0
	bge _0223AEF2
	movs r3, #0
_0223AEF2:
	movs r1, #1
	lsls r1, r1, #8
	cmp r5, r1
	ble _0223AEFC
	adds r5, r1, #0
_0223AEFC:
	cmp r4, #0
	bge _0223AF02
	movs r4, #0
_0223AF02:
	movs r1, #1
	lsls r1, r1, #8
	cmp r2, r1
	ble _0223AF0C
	adds r2, r1, #0
_0223AF0C:
	subs r1, r5, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	subs r1, r2, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r3, #0x10
	add r1, sp, #8
	lsls r3, r4, #0x10
	ldrb r1, [r1, #0x14]
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
_0223AF2C:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223AED4

	thumb_func_start ov80_0223AF30
ov80_0223AF30: @ 0x0223AF30
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x19
	lsls r1, r1, #4
	adds r6, r0, #0
	bl FUN_0201AA8C
	movs r2, #0x19
	movs r1, #0
	lsls r2, r2, #4
	adds r7, r0, #0
	blx FUN_020E5B44
	movs r4, #0
	adds r5, r7, #0
_0223AF4C:
	adds r0, r6, #0
	bl ov80_0223ADF4
	str r0, [r5, #4]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x60
	blt _0223AF4C
	adds r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223AF30

	thumb_func_start ov80_0223AF60
ov80_0223AF60: @ 0x0223AF60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_0223AF68:
	ldr r0, [r5, #4]
	bl ov80_0223AE0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x60
	blt _0223AF68
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov80_0223AF60

	thumb_func_start ov80_0223AF80
ov80_0223AF80: @ 0x0223AF80
	push {r3, r4}
	str r3, [r0]
	ldr r3, _0223AFC0 @ =0xFFFFFFF8
	add r3, sp
	ldrb r4, [r3, #0x10]
	movs r3, #0x63
	lsls r3, r3, #2
	strb r4, [r0, r3]
	subs r4, r3, #3
	strb r1, [r0, r4]
	subs r1, r3, #2
	strb r2, [r0, r1]
	adds r2, r3, #0
	movs r1, #0
	subs r2, #8
	strb r1, [r0, r2]
	subs r2, r3, #7
	strb r1, [r0, r2]
	subs r2, r3, #6
	strb r1, [r0, r2]
	subs r2, r3, #5
	strb r1, [r0, r2]
	subs r2, r3, #4
	strb r1, [r0, r2]
	subs r2, r3, #1
	strb r1, [r0, r2]
	movs r2, #1
	adds r1, r3, #1
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
	nop
_0223AFC0: .4byte 0xFFFFFFF8
	thumb_func_end ov80_0223AF80

	thumb_func_start ov80_0223AFC4
ov80_0223AFC4: @ 0x0223AFC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, _0223B1C8 @ =0x0000018D
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _0223AFD8
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0223AFD8:
	adds r1, r0, #0
	subs r1, #9
	ldrb r1, [r5, r1]
	cmp r1, #0x60
	bhs _0223AFF2
	subs r1, r0, #2
	ldrsb r1, [r5, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strb r2, [r5, r1]
	ldrsb r1, [r5, r1]
	cmp r1, #0
	ble _0223AFF4
_0223AFF2:
	b _0223B16E
_0223AFF4:
	subs r1, r0, #3
	ldrb r2, [r5, r1]
	subs r1, r0, #2
	ldr r3, _0223B1CC @ =0x0223DBEC
	strb r2, [r5, r1]
	subs r1, r0, #6
	ldrb r1, [r5, r1]
	lsls r4, r1, #4
	adds r1, r0, #0
	subs r1, #8
	ldrb r2, [r5, r1]
	adds r1, r3, r4
	subs r3, r0, #7
	ldrb r3, [r5, r3]
	subs r4, r0, #4
	ldrb r1, [r2, r1]
	lsls r3, r3, #4
	adds r3, #8
	str r3, [sp]
	ldrb r4, [r5, r4]
	lsls r1, r1, #5
	adds r2, r1, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	adds r2, #0x20
	str r4, [sp, #8]
	movs r4, #0x20
	str r4, [sp, #0xc]
	movs r4, #0x10
	str r4, [sp, #0x10]
	subs r4, r0, #1
	ldrb r4, [r5, r4]
	subs r0, #9
	str r4, [sp, #0x14]
	ldrb r0, [r5, r0]
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 @ =0x00000187
	movs r1, #1
	ldrb r2, [r5, r0]
	ldr r3, _0223B1CC @ =0x0223DBEC
	eors r1, r2
	lsls r4, r1, #4
	subs r1, r0, #2
	ldrb r2, [r5, r1]
	adds r1, r3, r4
	subs r3, r0, #1
	ldrb r4, [r5, r3]
	movs r3, #5
	ldrb r1, [r2, r1]
	subs r3, r3, r4
	lsls r3, r3, #4
	adds r3, #8
	str r3, [sp]
	adds r4, r0, #2
	ldrb r4, [r5, r4]
	lsls r1, r1, #5
	adds r2, r1, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	adds r2, #0x20
	str r4, [sp, #8]
	movs r4, #0x20
	str r4, [sp, #0xc]
	movs r4, #0x10
	str r4, [sp, #0x10]
	adds r4, r0, #5
	ldrb r4, [r5, r4]
	subs r0, r0, #3
	str r4, [sp, #0x14]
	ldrb r0, [r5, r0]
	adds r0, r0, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 @ =0x00000187
	ldr r3, _0223B1CC @ =0x0223DBEC
	ldrb r1, [r5, r0]
	lsls r4, r1, #4
	subs r1, r0, #2
	ldrb r2, [r5, r1]
	adds r1, r3, r4
	ldrb r1, [r2, r1]
	subs r2, r0, #1
	ldrb r2, [r5, r2]
	lsls r1, r1, #5
	adds r2, r2, #6
	lsls r3, r2, #4
	adds r3, #8
	str r3, [sp]
	adds r2, r0, #2
	ldrb r2, [r5, r2]
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	movs r2, #0x20
	str r2, [sp, #0xc]
	movs r2, #0x10
	str r2, [sp, #0x10]
	adds r2, r0, #5
	ldrb r2, [r5, r2]
	subs r0, r0, #3
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	adds r2, r1, #0
	adds r2, #0x20
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 @ =0x00000187
	movs r1, #1
	ldrb r2, [r5, r0]
	ldr r3, _0223B1CC @ =0x0223DBEC
	eors r1, r2
	lsls r4, r1, #4
	subs r1, r0, #2
	ldrb r2, [r5, r1]
	adds r1, r3, r4
	ldrb r1, [r2, r1]
	subs r2, r0, #1
	ldrb r3, [r5, r2]
	movs r2, #0xb
	lsls r1, r1, #5
	subs r2, r2, r3
	lsls r3, r2, #4
	adds r3, #8
	str r3, [sp]
	adds r2, r0, #2
	ldrb r2, [r5, r2]
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	movs r2, #0x20
	str r2, [sp, #0xc]
	movs r2, #0x10
	str r2, [sp, #0x10]
	adds r2, r0, #5
	ldrb r2, [r5, r2]
	subs r0, r0, #3
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	adds r2, r1, #0
	adds r2, #0x20
	adds r0, r0, #3
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	movs r1, #0x61
	lsls r1, r1, #2
	ldrb r0, [r5, r1]
	adds r0, r0, #4
	strb r0, [r5, r1]
	adds r0, r1, #1
	ldrb r0, [r5, r0]
	adds r2, r0, #1
	adds r0, r1, #1
	strb r2, [r5, r0]
	ldrb r0, [r5, r0]
	lsrs r3, r0, #0x1f
	lsls r2, r0, #0x1d
	subs r2, r2, r3
	movs r0, #0x1d
	rors r2, r0
	adds r0, r3, r2
	bne _0223B16E
	adds r0, r1, #3
	ldrb r2, [r5, r0]
	movs r0, #1
	eors r2, r0
	adds r0, r1, #3
	strb r2, [r5, r0]
	adds r0, r1, #2
	ldrb r0, [r5, r0]
	adds r2, r0, #1
	adds r0, r1, #2
	strb r2, [r5, r0]
	movs r2, #0
	adds r0, r1, #1
	strb r2, [r5, r0]
_0223B16E:
	movs r0, #0x62
	lsls r0, r0, #2
	ldrb r4, [r5, r0]
	subs r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _0223B1A4
	lsls r0, r4, #2
	movs r7, #0x62
	adds r6, r5, r0
	lsls r7, r7, #2
_0223B184:
	ldr r0, [r6, #4]
	bl ov80_0223AE6C
	str r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B196
	ldrb r0, [r5, r7]
	adds r0, r0, #1
	strb r0, [r5, r7]
_0223B196:
	movs r0, #0x61
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, r0
	blt _0223B184
_0223B1A4:
	movs r1, #0x62
	lsls r1, r1, #2
	ldrb r0, [r5, r1]
	cmp r0, #0x60
	blo _0223B1C0
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B1C0
	movs r2, #0
	adds r0, r1, #5
	strb r2, [r5, r0]
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B1C0:
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223B1C8: .4byte 0x0000018D
_0223B1CC: .4byte 0x0223DBEC
_0223B1D0: .4byte 0x00000187
	thumb_func_end ov80_0223AFC4

	thumb_func_start ov80_0223B1D4
ov80_0223B1D4: @ 0x0223B1D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, _0223B3DC @ =0x0000018D
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _0223B1E8
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B1E8:
	adds r1, r0, #0
	subs r1, #9
	ldrb r1, [r5, r1]
	cmp r1, #0x60
	bhs _0223B202
	subs r1, r0, #2
	ldrsb r1, [r5, r1]
	subs r2, r1, #1
	subs r1, r0, #2
	strb r2, [r5, r1]
	ldrsb r1, [r5, r1]
	cmp r1, #0
	ble _0223B204
_0223B202:
	b _0223B384
_0223B204:
	subs r1, r0, #3
	ldrb r2, [r5, r1]
	subs r1, r0, #2
	ldr r4, _0223B3E0 @ =0x0223DBE0
	strb r2, [r5, r1]
	subs r2, r0, #6
	ldrb r3, [r5, r2]
	movs r2, #6
	adds r1, r0, #0
	muls r2, r3, r2
	subs r3, r0, #7
	ldrb r3, [r5, r3]
	adds r2, r4, r2
	subs r1, #8
	ldrb r2, [r3, r2]
	ldrb r1, [r5, r1]
	lsls r3, r2, #5
	adds r2, r3, #0
	adds r2, #0x20
	str r2, [sp]
	subs r2, r0, #4
	ldrb r2, [r5, r2]
	lsls r1, r1, #4
	adds r1, #8
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	movs r2, #0x10
	str r2, [sp, #0xc]
	movs r2, #0x20
	str r2, [sp, #0x10]
	subs r2, r0, #1
	ldrb r2, [r5, r2]
	subs r0, #9
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	adds r2, r1, #0
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 @ =0x00000185
	movs r0, #7
	ldrb r1, [r5, r2]
	subs r0, r0, r1
	lsls r1, r0, #4
	adds r0, r2, #2
	ldrb r3, [r5, r0]
	movs r0, #1
	adds r1, #8
	eors r3, r0
	movs r0, #6
	muls r0, r3, r0
	adds r3, r2, #1
	ldrb r3, [r5, r3]
	adds r0, r4, r0
	ldrb r0, [r3, r0]
	lsls r3, r0, #5
	adds r0, r3, #0
	adds r0, #0x20
	str r0, [sp]
	adds r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x20
	str r0, [sp, #0x10]
	adds r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	subs r0, r2, #1
	ldrb r0, [r5, r0]
	adds r2, r1, #0
	adds r0, r0, #1
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 @ =0x00000185
	ldrb r0, [r5, r2]
	adds r0, #8
	lsls r1, r0, #4
	adds r0, r2, #2
	ldrb r3, [r5, r0]
	movs r0, #6
	adds r1, #8
	muls r0, r3, r0
	adds r3, r2, #1
	ldrb r3, [r5, r3]
	adds r0, r4, r0
	ldrb r0, [r3, r0]
	lsls r3, r0, #5
	adds r0, r3, #0
	adds r0, #0x20
	str r0, [sp]
	adds r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x20
	str r0, [sp, #0x10]
	adds r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	subs r0, r2, #1
	ldrb r0, [r5, r0]
	adds r2, r1, #0
	adds r0, r0, #2
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 @ =0x00000185
	movs r0, #0xf
	ldrb r1, [r5, r2]
	subs r0, r0, r1
	lsls r1, r0, #4
	adds r0, r2, #2
	ldrb r3, [r5, r0]
	movs r0, #1
	adds r1, #8
	eors r3, r0
	movs r0, #6
	muls r0, r3, r0
	adds r3, r2, #1
	ldrb r3, [r5, r3]
	adds r0, r4, r0
	ldrb r0, [r3, r0]
	lsls r3, r0, #5
	adds r0, r3, #0
	adds r0, #0x20
	str r0, [sp]
	adds r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #0x20
	str r0, [sp, #0x10]
	adds r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	subs r0, r2, #1
	ldrb r0, [r5, r0]
	adds r2, r1, #0
	adds r0, r0, #3
	lsls r0, r0, #2
	adds r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	movs r0, #0x61
	lsls r0, r0, #2
	ldrb r1, [r5, r0]
	adds r1, r1, #4
	strb r1, [r5, r0]
	adds r1, r0, #2
	ldrb r1, [r5, r1]
	adds r2, r1, #1
	adds r1, r0, #2
	strb r2, [r5, r1]
	adds r0, r0, #2
	ldrb r0, [r5, r0]
	movs r1, #6
	blx FUN_020F2998
	cmp r1, #0
	bne _0223B384
	ldr r1, _0223B3E8 @ =0x00000187
	movs r0, #1
	ldrb r2, [r5, r1]
	eors r0, r2
	strb r0, [r5, r1]
	subs r0, r1, #2
	ldrb r0, [r5, r0]
	adds r2, r0, #1
	subs r0, r1, #2
	strb r2, [r5, r0]
	movs r2, #0
	subs r0, r1, #1
	strb r2, [r5, r0]
_0223B384:
	movs r0, #0x62
	lsls r0, r0, #2
	ldrb r4, [r5, r0]
	subs r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _0223B3BA
	lsls r0, r4, #2
	movs r7, #0x62
	adds r6, r5, r0
	lsls r7, r7, #2
_0223B39A:
	ldr r0, [r6, #4]
	bl ov80_0223AE6C
	str r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B3AC
	ldrb r0, [r5, r7]
	adds r0, r0, #1
	strb r0, [r5, r7]
_0223B3AC:
	movs r0, #0x61
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, r0
	blt _0223B39A
_0223B3BA:
	movs r1, #0x62
	lsls r1, r1, #2
	ldrb r0, [r5, r1]
	cmp r0, #0x60
	blo _0223B3D6
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B3D6
	movs r2, #0
	adds r0, r1, #5
	strb r2, [r5, r0]
	add sp, #0x1c
	movs r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B3D6:
	movs r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0223B3DC: .4byte 0x0000018D
_0223B3E0: .4byte 0x0223DBE0
_0223B3E4: .4byte 0x00000185
_0223B3E8: .4byte 0x00000187
	thumb_func_end ov80_0223B1D4

	thumb_func_start ov80_0223B3EC
ov80_0223B3EC: @ 0x0223B3EC
	ldr r3, _0223B3F8 @ =FUN_0200E33C
	movs r2, #1
	adds r1, r0, #0
	ldr r0, _0223B3FC @ =ov80_0223B400
	lsls r2, r2, #0xa
	bx r3
	.align 2, 0
_0223B3F8: .4byte FUN_0200E33C
_0223B3FC: .4byte ov80_0223B400
	thumb_func_end ov80_0223B3EC

	thumb_func_start ov80_0223B400
ov80_0223B400: @ 0x0223B400
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #2
	blo _0223B414
	ldr r0, [r4]
	bl FUN_02014C08
	movs r0, #0
	str r0, [r4, #8]
_0223B414:
	ldr r0, [r4]
	bl FUN_02014C40
	ldr r0, [r4, #8]
	adds r0, r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223B400

	thumb_func_start ov80_0223B424
ov80_0223B424: @ 0x0223B424
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_02014AD8
	str r0, [r4]
	movs r0, #0
	str r0, [r4, #8]
	adds r0, r4, #0
	bl ov80_0223B3EC
	str r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223B424

	thumb_func_start ov80_0223B440
ov80_0223B440: @ 0x0223B440
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x20]
	add r5, sp, #0x10
	str r4, [sp]
	movs r4, #0x14
	ldrsh r4, [r5, r4]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x10]
	ldr r0, [r0]
	bl FUN_02014B08
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov80_0223B440

	thumb_func_start ov80_0223B468
ov80_0223B468: @ 0x0223B468
	push {r3, lr}
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0223B47C
	movs r0, #1
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0x10]
	blx r1
	pop {r3, pc}
_0223B47C:
	bl FUN_02014AA0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov80_0223B468

	thumb_func_start ov80_0223B484
ov80_0223B484: @ 0x0223B484
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223B49E
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0223B49E
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x14]
	blx r1
	movs r0, #0
	str r0, [r4, #0xc]
_0223B49E:
	pop {r4, pc}
	thumb_func_end ov80_0223B484

	thumb_func_start ov80_0223B4A0
ov80_0223B4A0: @ 0x0223B4A0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r5, #0
	bne _0223B4B2
	bl GF_AssertFail
_0223B4B2:
	movs r0, #1
	str r0, [r5, #8]
	movs r2, #0
	str r2, [r5, #0xc]
	str r4, [r5, #0x18]
	str r6, [r5, #0x10]
	ldr r0, _0223B4D8 @ =ov80_0223B468
	str r7, [r5, #0x14]
	adds r1, r5, #0
	bl FUN_0200E374
	str r0, [r5, #4]
	ldr r0, _0223B4DC @ =ov80_0223B484
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E33C
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223B4D8: .4byte ov80_0223B468
_0223B4DC: .4byte ov80_0223B484
	thumb_func_end ov80_0223B4A0

	thumb_func_start ov80_0223B4E0
ov80_0223B4E0: @ 0x0223B4E0
	push {r4, lr}
	adds r4, r0, #0
	bne _0223B4EA
	bl GF_AssertFail
_0223B4EA:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0223B4F4
	bl FUN_0200E390
_0223B4F4:
	ldr r0, [r4]
	cmp r0, #0
	beq _0223B4FE
	bl FUN_0200E390
_0223B4FE:
	bl FUN_02014AA0
	pop {r4, pc}
	thumb_func_end ov80_0223B4E0

	thumb_func_start ov80_0223B504
ov80_0223B504: @ 0x0223B504
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_02014A60
	adds r5, r0, #0
	bl FUN_02014AA0
	ldr r1, _0223B524 @ =0x00003020
	adds r0, r5, #0
	ldr r1, [r4, r1]
	movs r2, #0x20
	movs r3, #1
	bl FUN_02014AB0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0223B524: .4byte 0x00003020
	thumb_func_end ov80_0223B504

	thumb_func_start ov80_0223B528
ov80_0223B528: @ 0x0223B528
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_02014A8C
	adds r0, r4, #0
	bl ov80_0223B504
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223B528

	thumb_func_start ov80_0223B53C
ov80_0223B53C: @ 0x0223B53C
	ldr r3, _0223B540 @ =ov80_0223B504
	bx r3
	.align 2, 0
_0223B540: .4byte ov80_0223B504
	thumb_func_end ov80_0223B53C

	thumb_func_start ov80_0223B544
ov80_0223B544: @ 0x0223B544
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r0, #0
	ldr r1, _0223B5D4 @ =0x00003024
	adds r0, r5, #0
	bl FUN_0201AA8C
	ldr r2, _0223B5D4 @ =0x00003024
	str r0, [sp]
	movs r1, #0
	blx FUN_020E5B44
	ldr r0, [sp]
	cmp r0, #0
	bne _0223B568
	bl GF_AssertFail
_0223B568:
	ldr r1, [sp]
	ldr r3, _0223B5D8 @ =0x00001820
	ldr r2, [sp]
	adds r0, r5, #0
	adds r1, #0x20
	adds r2, r2, r3
	bl FUN_02014A08
	ldr r1, [sp]
	cmp r0, #0
	str r0, [r1, #0x1c]
	bne _0223B584
	bl GF_AssertFail
_0223B584:
	ldr r0, [sp]
	ldr r1, _0223B5DC @ =0x00003020
	movs r5, #0
	str r4, [r0, r1]
	adds r6, r0, #0
_0223B58E:
	adds r3, r6, #0
	adds r4, r7, #0
	adds r3, #0x20
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, _0223B5D8 @ =0x00001820
	adds r3, r7, #0
	adds r4, r6, r0
	ldm r3!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r4!, {r0, r1}
	ldm r3!, {r0, r1}
	adds r5, r5, #1
	adds r6, r2, #0
	stm r4!, {r0, r1}
	cmp r5, #0xc0
	blt _0223B58E
	ldr r0, [sp]
	ldr r2, _0223B5E0 @ =ov80_0223B528
	ldr r3, _0223B5E4 @ =ov80_0223B53C
	adds r1, r0, #0
	bl ov80_0223B4A0
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0223B5D4: .4byte 0x00003024
_0223B5D8: .4byte 0x00001820
_0223B5DC: .4byte 0x00003020
_0223B5E0: .4byte ov80_0223B528
_0223B5E4: .4byte ov80_0223B53C
	thumb_func_end ov80_0223B544

	thumb_func_start ov80_0223B5E8
ov80_0223B5E8: @ 0x0223B5E8
	push {r4, lr}
	adds r4, r0, #0
	bne _0223B5F2
	bl GF_AssertFail
_0223B5F2:
	adds r0, r4, #0
	bl ov80_0223B4E0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0223B602
	bl FUN_02014A38
_0223B602:
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223B5E8

	thumb_func_start ov80_0223B60C
ov80_0223B60C: @ 0x0223B60C
	push {r4, lr}
	adds r4, r0, #0
	bne _0223B616
	bl GF_AssertFail
_0223B616:
	ldr r0, [r4, #0x1c]
	bl FUN_02014A4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov80_0223B60C

	.rodata

_0223B620: @ 0x0223B620
	.byte 0xD5, 0x00, 0x9D, 0x00, 0xEA, 0x00, 0xD9, 0x00, 0x5A, 0x00, 0x8D, 0x00, 0x5B, 0x00, 0x8E, 0x00
	.byte 0x5C, 0x00, 0x8F, 0x00, 0x5D, 0x00, 0x90, 0x00, 0x5E, 0x00, 0x91, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x3C, 0x00, 0x03, 0x00, 0x3D, 0x00, 0x08, 0x00, 0x20, 0x00, 0x3E, 0x00
	.byte 0x21, 0x00, 0x3F, 0x00, 0x04, 0x00, 0x34, 0x00, 0x05, 0x00, 0x35, 0x00, 0x2C, 0x00, 0x01, 0x00
	.byte 0x2D, 0x00, 0x02, 0x00, 0x14, 0x00, 0x0F, 0x00, 0x15, 0x00, 0x10, 0x00, 0x51, 0x00, 0x3B, 0x00
	.byte 0x1A, 0x00, 0x3C, 0x00, 0x10, 0x00, 0x09, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x53, 0x00, 0x17, 0x00
	.byte 0x54, 0x00, 0x16, 0x00, 0x47, 0x00, 0x29, 0x00, 0x12, 0x00, 0x2A, 0x00, 0x0C, 0x00, 0x26, 0x00
	.byte 0x0D, 0x00, 0x27, 0x00, 0x0E, 0x00, 0x33, 0x00, 0x0A, 0x00, 0x07, 0x00, 0x1B, 0x00, 0x11, 0x00
	.byte 0x23, 0x00, 0x25, 0x00, 0x31, 0x00, 0x46, 0x00, 0x32, 0x00, 0x46, 0x00, 0x27, 0x00, 0x0B, 0x00
	.byte 0x28, 0x00, 0x0E, 0x00, 0x18, 0x00, 0x0B, 0x00, 0x19, 0x00, 0x0E, 0x00, 0x35, 0x00, 0x44, 0x00
	.byte 0x36, 0x00, 0x45, 0x00, 0x1D, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x05, 0x00, 0x1C, 0x00, 0x01, 0x00
	.byte 0x13, 0x00, 0x2D, 0x00, 0x0B, 0x00, 0x36, 0x00, 0x2E, 0x00, 0x38, 0x00, 0x09, 0x00, 0x14, 0x00
	.byte 0x30, 0x00, 0x32, 0x00, 0x34, 0x00, 0x0A, 0x00, 0x25, 0x00, 0x13, 0x00, 0x39, 0x00, 0x1F, 0x00
	.byte 0x4E, 0x00, 0x1D, 0x00, 0x22, 0x00, 0x24, 0x00, 0x3B, 0x00, 0x28, 0x00, 0x3A, 0x00, 0x2B, 0x00
	.byte 0x26, 0x00, 0x22, 0x00, 0x33, 0x00, 0x3E, 0x00, 0x1E, 0x00, 0x0E, 0x00, 0x50, 0x00, 0x37, 0x00
	.byte 0x24, 0x00, 0x0D, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x55, 0x00, 0x23, 0x00, 0x0F, 0x00, 0x2C, 0x00
	.byte 0x16, 0x00, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCD, 0xAD, 0x22, 0x02, 0xDD, 0xAD, 0x22, 0x02
	.byte 0x04, 0x00, 0x23, 0x00, 0x2E, 0x04, 0x03, 0x00, 0xB7, 0x00, 0x01, 0x00, 0x00, 0x00, 0x94, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x94, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x00, 0x2E, 0x04, 0x03, 0x00
	.byte 0xB7, 0x00, 0x02, 0x00, 0x00, 0x00, 0x94, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x24, 0x00, 0x2E, 0x04, 0x03, 0x00, 0xB7, 0x00, 0x01, 0x00, 0x00, 0x00, 0x94, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x6D, 0xAE, 0x22, 0x02, 0x81, 0xAE, 0x22, 0x02, 0x01, 0x00, 0xC3, 0x00, 0x77, 0x04, 0x04, 0x00
	.byte 0xB7, 0x00, 0x02, 0x00, 0x00, 0x00, 0x94, 0x00, 0x03, 0x00, 0x00, 0x00, 0x94, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x85, 0xAE, 0x22, 0x02, 0x9D, 0xAE, 0x22, 0x02
	.byte 0x01, 0x00, 0xC3, 0x00, 0x77, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x01, 0x00, 0x00, 0x00, 0x94, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x60, 0x00, 0x2E, 0x04, 0x04, 0x00
	.byte 0xB7, 0x00, 0x36, 0x00, 0x31, 0x00, 0xA0, 0x00, 0x37, 0x00, 0x31, 0x00, 0xA0, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x60, 0x00, 0x2E, 0x04, 0x04, 0x00, 0xB7, 0x00, 0x33, 0x00, 0x31, 0x00, 0xA0, 0x00
	.byte 0x34, 0x00, 0x31, 0x00, 0xA0, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x61, 0x00, 0x2E, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x35, 0x00, 0x31, 0x00, 0xA0, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x62, 0x00, 0x2E, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x32, 0x00, 0x31, 0x00, 0xA0, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0xB9, 0x01, 0x78, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x11, 0x00, 0x10, 0x00, 0x97, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xE9, 0xAD, 0x22, 0x02, 0x1D, 0xAE, 0x22, 0x02
	.byte 0x03, 0x00, 0xB9, 0x01, 0x78, 0x04, 0x04, 0x00, 0xB7, 0x00, 0x14, 0x00, 0x0E, 0x00, 0x96, 0x00
	.byte 0x16, 0x00, 0x13, 0x00, 0x98, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x7A, 0x04, 0x04, 0x00
	.byte 0xB7, 0x00, 0x1A, 0x00, 0x19, 0x00, 0x9A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xBD, 0xAE, 0x22, 0x02, 0xF5, 0xAE, 0x22, 0x02
	.byte 0x00, 0x00, 0x20, 0x00, 0x7A, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x1E, 0x00, 0x1D, 0x00, 0x9F, 0x00
	.byte 0x21, 0x00, 0x1D, 0x00, 0x9F, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x7A, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x1C, 0x00, 0x1B, 0x00, 0x9B, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xA1, 0xAE, 0x22, 0x02, 0xB1, 0xAE, 0x22, 0x02
	.byte 0x0A, 0x00, 0x12, 0x00, 0x2E, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x84, 0x00, 0x83, 0x00, 0xBF, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x29, 0xAE, 0x22, 0x02, 0x2D, 0xAE, 0x22, 0x02, 0x02, 0x00, 0xAA, 0x01, 0x79, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0xA2, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x31, 0xAE, 0x22, 0x02, 0x69, 0xAE, 0x22, 0x02
	.byte 0x02, 0x00, 0xAA, 0x01, 0x79, 0x04, 0x04, 0x00, 0xB7, 0x00, 0x38, 0x00, 0x3A, 0x00, 0xA1, 0x00
	.byte 0x3D, 0x00, 0x5D, 0x00, 0xBC, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
	.byte 0x01, 0x19, 0x0D, 0x06, 0x04, 0x0E, 0x55, 0x03, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00, 0x91, 0xD3, 0x22, 0x02
	.byte 0x05, 0xD4, 0x22, 0x02, 0x21, 0xD5, 0x22, 0x02, 0x69, 0xD9, 0x22, 0x02, 0xAD, 0xDA, 0x22, 0x02
	.byte 0x15, 0xDC, 0x22, 0x02, 0xB1, 0xBE, 0x22, 0x02, 0xB5, 0xBE, 0x22, 0x02, 0xC1, 0xBE, 0x22, 0x02
	.byte 0xD5, 0xBE, 0x22, 0x02, 0x01, 0xBF, 0x22, 0x02, 0x29, 0xBF, 0x22, 0x02, 0x7D, 0xBF, 0x22, 0x02
	.byte 0x95, 0xBF, 0x22, 0x02, 0xAD, 0xBF, 0x22, 0x02, 0xC9, 0xBF, 0x22, 0x02, 0x41, 0xC0, 0x22, 0x02
	.byte 0x59, 0xC0, 0x22, 0x02, 0x91, 0xC0, 0x22, 0x02, 0xA9, 0xC0, 0x22, 0x02, 0xB5, 0xC0, 0x22, 0x02
	.byte 0xED, 0xC0, 0x22, 0x02, 0x1D, 0xC1, 0x22, 0x02, 0x4D, 0xC1, 0x22, 0x02, 0x9D, 0xC1, 0x22, 0x02
	.byte 0xA9, 0xC1, 0x22, 0x02, 0xF1, 0xC1, 0x22, 0x02, 0x15, 0xC2, 0x22, 0x02, 0x71, 0xC2, 0x22, 0x02
	.byte 0xD1, 0xC2, 0x22, 0x02, 0xF5, 0xC2, 0x22, 0x02, 0x21, 0xC3, 0x22, 0x02, 0x69, 0xC3, 0x22, 0x02
	.byte 0xC5, 0xC3, 0x22, 0x02, 0x25, 0xC4, 0x22, 0x02, 0x51, 0xC4, 0x22, 0x02, 0x6D, 0xC4, 0x22, 0x02
	.byte 0x7D, 0xC4, 0x22, 0x02, 0xF9, 0xBF, 0x22, 0x02, 0x19, 0xC0, 0x22, 0x02, 0x2D, 0xC5, 0x22, 0x02
	.byte 0xED, 0xC5, 0x22, 0x02, 0x0D, 0xC6, 0x22, 0x02, 0xE5, 0xC6, 0x22, 0x02, 0x0D, 0xC7, 0x22, 0x02
	.byte 0x4D, 0xC7, 0x22, 0x02, 0x51, 0xC7, 0x22, 0x02, 0xFD, 0xC7, 0x22, 0x02, 0x21, 0xC8, 0x22, 0x02
	.byte 0x85, 0xC8, 0x22, 0x02, 0xB1, 0xC8, 0x22, 0x02, 0x4D, 0xC9, 0x22, 0x02, 0x6D, 0xC9, 0x22, 0x02
	.byte 0xA5, 0xC9, 0x22, 0x02, 0xD5, 0xC9, 0x22, 0x02, 0x1D, 0xCA, 0x22, 0x02, 0x55, 0xCA, 0x22, 0x02
	.byte 0x75, 0xCA, 0x22, 0x02, 0x55, 0xCB, 0x22, 0x02, 0xD9, 0xD1, 0x22, 0x02, 0x21, 0xD2, 0x22, 0x02
	.byte 0x2D, 0xD2, 0x22, 0x02, 0x61, 0xD2, 0x22, 0x02, 0x85, 0xD2, 0x22, 0x02, 0x9D, 0xD2, 0x22, 0x02
	.byte 0xCD, 0xD2, 0x22, 0x02, 0x29, 0xD3, 0x22, 0x02, 0x35, 0xD3, 0x22, 0x02, 0x61, 0xD3, 0x22, 0x02
	.byte 0x71, 0xDC, 0x22, 0x02, 0x3D, 0xDD, 0x22, 0x02, 0x69, 0xDD, 0x22, 0x02, 0x9D, 0xDD, 0x22, 0x02
	.byte 0xBD, 0xDD, 0x22, 0x02, 0xF1, 0xDD, 0x22, 0x02, 0x65, 0xDF, 0x22, 0x02, 0xD5, 0xDF, 0x22, 0x02
	.byte 0xF5, 0xDF, 0x22, 0x02, 0x79, 0xE0, 0x22, 0x02, 0x9D, 0xE0, 0x22, 0x02, 0xC9, 0xE0, 0x22, 0x02
	.byte 0xED, 0xE0, 0x22, 0x02, 0x1D, 0xDE, 0x22, 0x02, 0x8D, 0xDE, 0x22, 0x02, 0xB9, 0xDE, 0x22, 0x02
	.byte 0x2D, 0xDF, 0x22, 0x02, 0xA1, 0x23, 0x23, 0x02, 0xB9, 0x23, 0x23, 0x02, 0xD1, 0x23, 0x23, 0x02
	.byte 0x25, 0xCB, 0x22, 0x02, 0x45, 0xCB, 0x22, 0x02, 0x91, 0x53, 0x23, 0x02, 0xA1, 0x53, 0x23, 0x02
	.byte 0xB1, 0x53, 0x23, 0x02, 0xE9, 0x53, 0x23, 0x02, 0xF9, 0x53, 0x23, 0x02, 0x1D, 0x54, 0x23, 0x02
	.byte 0x39, 0x54, 0x23, 0x02, 0x09, 0xF6, 0x22, 0x02, 0x49, 0xF6, 0x22, 0x02, 0x65, 0xF6, 0x22, 0x02
	.byte 0x79, 0xF6, 0x22, 0x02, 0xE1, 0xF6, 0x22, 0x02, 0x09, 0xF7, 0x22, 0x02, 0x4D, 0xF7, 0x22, 0x02
	.byte 0xE1, 0xF7, 0x22, 0x02, 0xF5, 0xF7, 0x22, 0x02, 0x09, 0xF8, 0x22, 0x02, 0x1D, 0xF8, 0x22, 0x02
	.byte 0x31, 0xF8, 0x22, 0x02, 0x35, 0xFC, 0x22, 0x02, 0x51, 0xFC, 0x22, 0x02, 0x81, 0xFC, 0x22, 0x02
	.byte 0xD1, 0xFC, 0x22, 0x02, 0x9D, 0xCB, 0x22, 0x02, 0xB5, 0xCB, 0x22, 0x02, 0x95, 0xCD, 0x22, 0x02
	.byte 0xF5, 0xCD, 0x22, 0x02, 0x01, 0xCE, 0x22, 0x02, 0x0D, 0xE1, 0x22, 0x02, 0x29, 0xCE, 0x22, 0x02
	.byte 0x49, 0xCE, 0x22, 0x02, 0xB9, 0xCE, 0x22, 0x02, 0xCD, 0xCE, 0x22, 0x02, 0xA5, 0x10, 0x23, 0x02
	.byte 0xF1, 0xCE, 0x22, 0x02, 0x09, 0xCF, 0x22, 0x02, 0x19, 0xCF, 0x22, 0x02, 0x39, 0xCF, 0x22, 0x02
	.byte 0x09, 0xD0, 0x22, 0x02, 0x35, 0xD0, 0x22, 0x02, 0x65, 0xD0, 0x22, 0x02, 0x85, 0xD0, 0x22, 0x02
	.byte 0xF9, 0xD0, 0x22, 0x02, 0x19, 0xD1, 0x22, 0x02, 0x3D, 0xD1, 0x22, 0x02, 0x69, 0xD1, 0x22, 0x02
	.byte 0xA1, 0xD1, 0x22, 0x02, 0x4D, 0x54, 0x23, 0x02, 0xD1, 0x55, 0x23, 0x02, 0x11, 0x56, 0x23, 0x02
	.byte 0x25, 0x56, 0x23, 0x02, 0x75, 0x56, 0x23, 0x02, 0xAD, 0x56, 0x23, 0x02, 0x11, 0x57, 0x23, 0x02
	.byte 0x8D, 0x0B, 0x23, 0x02, 0xE1, 0x0B, 0x23, 0x02, 0xFD, 0x0B, 0x23, 0x02, 0x11, 0x0C, 0x23, 0x02
	.byte 0xE9, 0x0C, 0x23, 0x02, 0x0D, 0x0D, 0x23, 0x02, 0x71, 0x0D, 0x23, 0x02, 0xD5, 0x0F, 0x23, 0x02
	.byte 0xF1, 0x0F, 0x23, 0x02, 0x21, 0x10, 0x23, 0x02, 0x6D, 0x10, 0x23, 0x02, 0x59, 0xDF, 0x22, 0x02
	.byte 0xF9, 0x1B, 0x23, 0x02, 0x5D, 0x1C, 0x23, 0x02, 0x79, 0x1C, 0x23, 0x02, 0x8D, 0x1C, 0x23, 0x02
	.byte 0x35, 0x1D, 0x23, 0x02, 0xBD, 0x1D, 0x23, 0x02, 0xF9, 0x1D, 0x23, 0x02, 0xA9, 0x1E, 0x23, 0x02
	.byte 0xBD, 0x1E, 0x23, 0x02, 0xD1, 0x1E, 0x23, 0x02, 0xAD, 0x22, 0x23, 0x02, 0xC9, 0x22, 0x23, 0x02
	.byte 0xF9, 0x22, 0x23, 0x02, 0xE1, 0x1C, 0x23, 0x02, 0x49, 0x23, 0x23, 0x02, 0xE9, 0x23, 0x23, 0x02
	.byte 0x31, 0x24, 0x23, 0x02, 0x61, 0x24, 0x23, 0x02, 0x8D, 0x24, 0x23, 0x02, 0x01, 0x59, 0x23, 0x02
	.byte 0x21, 0x59, 0x23, 0x02, 0x35, 0x59, 0x23, 0x02, 0x71, 0x59, 0x23, 0x02, 0x15, 0x5A, 0x23, 0x02
	.byte 0x45, 0x5A, 0x23, 0x02, 0x8D, 0x5A, 0x23, 0x02, 0x05, 0x5B, 0x23, 0x02, 0x21, 0x5B, 0x23, 0x02
	.byte 0x85, 0x5E, 0x23, 0x02, 0x65, 0x5F, 0x23, 0x02, 0x81, 0x5F, 0x23, 0x02, 0xB5, 0x5F, 0x23, 0x02
	.byte 0x21, 0xE1, 0x22, 0x02, 0x89, 0x36, 0x23, 0x02, 0xED, 0x36, 0x23, 0x02, 0x09, 0x37, 0x23, 0x02
	.byte 0x71, 0x37, 0x23, 0x02, 0x09, 0x39, 0x23, 0x02, 0x31, 0x3A, 0x23, 0x02, 0x45, 0x3A, 0x23, 0x02
	.byte 0x59, 0x3A, 0x23, 0x02, 0xBD, 0x3F, 0x23, 0x02, 0xD9, 0x3F, 0x23, 0x02, 0x09, 0x40, 0x23, 0x02
	.byte 0x1D, 0x37, 0x23, 0x02, 0x59, 0x40, 0x23, 0x02, 0x95, 0x40, 0x23, 0x02, 0xA9, 0x40, 0x23, 0x02
	.byte 0xC1, 0x10, 0x23, 0x02, 0x45, 0xE1, 0x22, 0x02, 0x61, 0xE1, 0x22, 0x02, 0xB5, 0x59, 0x23, 0x02
	.byte 0x71, 0xE1, 0x22, 0x02, 0x19, 0xE2, 0x22, 0x02, 0x2D, 0xE2, 0x22, 0x02, 0x39, 0xE2, 0x22, 0x02
	.byte 0x51, 0xE2, 0x22, 0x02, 0x01, 0x02, 0x04, 0x08, 0x0F, 0x10, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD9, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00
	.byte 0xD0, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x61, 0xDD, 0x23, 0x02, 0xA9, 0xDE, 0x23, 0x02, 0x35, 0xE2, 0x23, 0x02
	.byte 0x51, 0x00, 0x00, 0x00, 0x61, 0xDD, 0x23, 0x02, 0xA9, 0xDE, 0x23, 0x02, 0x35, 0xE2, 0x23, 0x02
	.byte 0x51, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x05, 0x05, 0x07, 0x07, 0x08, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x0A, 0x0B, 0x0C, 0x0D, 0x10, 0x11, 0x13, 0x15, 0x00, 0x00, 0x00, 0x61, 0xDD, 0x23, 0x02
	.byte 0x21, 0xDE, 0x23, 0x02, 0x75, 0xDF, 0x23, 0x02, 0x52, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01
	.byte 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x04, 0x04, 0x06, 0x06, 0x08, 0x08, 0x0A, 0x0A, 0x0C, 0x00
	.byte 0x00, 0x06, 0x06, 0x06, 0x08, 0x08, 0x08, 0x0A, 0x0A, 0x0A, 0x0C, 0x0C, 0x0E, 0x0F, 0x11, 0x11
	.byte 0x14, 0x14, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00, 0x61, 0xDD, 0x23, 0x02, 0x61, 0xDE, 0x23, 0x02, 0xBD, 0xDF, 0x23, 0x02
	.byte 0x53, 0x00, 0x00, 0x00, 0xE9, 0x2F, 0x24, 0x02, 0x09, 0x31, 0x24, 0x02, 0x69, 0x32, 0x24, 0x02
	.byte 0x53, 0x00, 0x00, 0x00, 0x00, 0x03, 0x03, 0x04, 0x04, 0x05, 0x05, 0x07, 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x09, 0x0B, 0x0C, 0x0E, 0x0F, 0x12, 0x12, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0xDD, 0x23, 0x02, 0xB9, 0xDE, 0x23, 0x02
	.byte 0xF1, 0xDF, 0x23, 0x02, 0x54, 0x00, 0x00, 0x00, 0x06, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x06, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x05, 0x04, 0x04, 0x00, 0x03, 0x03, 0x0A
	.byte 0x05, 0x06, 0x07, 0x04, 0x09, 0x02, 0x0A, 0x00, 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00, 0x21, 0x00, 0x14, 0x00, 0x27, 0x00, 0x2B, 0x00
	.byte 0x2B, 0x00, 0x42, 0x00, 0x2E, 0x00, 0x59, 0x00, 0xDE, 0x00, 0x14, 0x00, 0xD8, 0x00, 0x2B, 0x00
	.byte 0xD5, 0x00, 0x42, 0x00, 0xD2, 0x00, 0x59, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00, 0xC9, 0x00
	.byte 0xCA, 0x00, 0xCB, 0x00, 0xCC, 0x00, 0xCD, 0x00, 0xCE, 0x00, 0xCF, 0x00, 0xDD, 0x00, 0xD9, 0x00
	.byte 0xD5, 0x00, 0x15, 0x01, 0x28, 0x01, 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00, 0x16, 0x01, 0x17, 0x01
	.byte 0x19, 0x01, 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0x0C, 0x01
	.byte 0x0E, 0x01, 0xDC, 0x00, 0x29, 0x01, 0x1F, 0x01, 0xD6, 0x00, 0x0F, 0x01, 0x0A, 0x01, 0x0B, 0x01
	.byte 0xFD, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0x0C, 0x01, 0x0E, 0x01, 0x16, 0x01, 0x17, 0x01
	.byte 0x19, 0x01, 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00, 0xBE, 0x00
	.byte 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00, 0xC5, 0x00, 0xC6, 0x00
	.byte 0xC7, 0x00, 0xC8, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00, 0x5D, 0x00, 0x3E, 0x00, 0xA3, 0x00
	.byte 0x5E, 0x00, 0x40, 0x00, 0xA4, 0x00, 0x5F, 0x00, 0x42, 0x00, 0xA5, 0x00, 0x60, 0x00, 0x44, 0x00
	.byte 0xA6, 0x00, 0x61, 0x00, 0x46, 0x00, 0xA7, 0x00, 0x62, 0x00, 0x48, 0x00, 0xA8, 0x00, 0x63, 0x00
	.byte 0x4A, 0x00, 0xA9, 0x00, 0x64, 0x00, 0x4C, 0x00, 0xAA, 0x00, 0x65, 0x00, 0x4E, 0x00, 0xAB, 0x00
	.byte 0x5D, 0x00, 0x3D, 0x00, 0xA3, 0x00, 0x5E, 0x00, 0x3F, 0x00, 0xA4, 0x00, 0x5F, 0x00, 0x41, 0x00
	.byte 0xA5, 0x00, 0x60, 0x00, 0x43, 0x00, 0xA6, 0x00, 0x61, 0x00, 0x45, 0x00, 0xA7, 0x00, 0x62, 0x00
	.byte 0x47, 0x00, 0xA8, 0x00, 0x63, 0x00, 0x49, 0x00, 0xA9, 0x00, 0x64, 0x00, 0x4B, 0x00, 0xAA, 0x00
	.byte 0x65, 0x00, 0x4D, 0x00, 0xAB, 0x00, 0x66, 0x00, 0x4F, 0x00, 0xAC, 0x00, 0x67, 0x00, 0x50, 0x00
	.byte 0xAD, 0x00, 0x68, 0x00, 0x51, 0x00, 0xAE, 0x00, 0x69, 0x00, 0x52, 0x00, 0xAF, 0x00, 0x6A, 0x00
	.byte 0x53, 0x00, 0xB0, 0x00, 0x6B, 0x00, 0x54, 0x00, 0xB1, 0x00, 0x6D, 0x00, 0x56, 0x00, 0xB3, 0x00
	.byte 0x6E, 0x00, 0x57, 0x00, 0xB4, 0x00, 0x6F, 0x00, 0x58, 0x00, 0xB5, 0x00, 0x6C, 0x00, 0x55, 0x00
	.byte 0xB2, 0x00, 0x71, 0x00, 0x5A, 0x00, 0xB7, 0x00, 0x70, 0x00, 0x59, 0x00, 0xB6, 0x00, 0x72, 0x00
	.byte 0x5B, 0x00, 0xB8, 0x00, 0x73, 0x00, 0x5C, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x00, 0x02, 0x02, 0x02
	.byte 0x02, 0x04, 0x04, 0x05, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x08, 0x09, 0x0A, 0x0D, 0x0E, 0x10
	.byte 0x11, 0x00, 0x00, 0x00, 0x8D, 0x00, 0x91, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00, 0xD5, 0x00, 0x9D, 0x00, 0xEA, 0x00, 0xD9, 0x00
	.byte 0x04, 0x00, 0x00, 0x01, 0x02, 0x03, 0x14, 0x00, 0x02, 0x03, 0x04, 0x05, 0x09, 0x00, 0x04, 0x06
	.byte 0x06, 0x07, 0x0A, 0x00, 0x06, 0x07, 0x08, 0x09, 0x23, 0x00, 0x08, 0x09, 0x0A, 0x0B, 0x0D, 0x00
	.byte 0x0B, 0x0C, 0x0D, 0x0E, 0x11, 0x00, 0x0D, 0x0E, 0x0F, 0x10, 0x00, 0x00, 0x78, 0x56, 0x34, 0x12
	.byte 0x00, 0x00, 0x00, 0x00, 0x71, 0x00, 0x90, 0x00, 0xF1, 0x00, 0xA2, 0x00, 0xA3, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0xEA, 0x00
	.byte 0x16, 0x00, 0x4B, 0x00, 0xEB, 0x00, 0x4C, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x86, 0x00
	.byte 0x68, 0x00, 0x5F, 0x00, 0x71, 0x00, 0x7E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0xFD, 0x00, 0x34, 0x00, 0x53, 0x00, 0x35, 0x00, 0x7E, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x83, 0x00, 0x79, 0x00, 0x5C, 0x00, 0x63, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x07, 0x00, 0xF3, 0x00
	.byte 0x37, 0x00, 0x39, 0x00, 0x60, 0x01, 0x38, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6D, 0x00
	.byte 0x7C, 0x00, 0x5D, 0x00, 0x92, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x7B, 0x00, 0xDD, 0x00, 0x3E, 0x01, 0xD3, 0x00, 0x68, 0x00, 0x3A, 0x01
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6A, 0x00, 0x79, 0x00, 0x9A, 0x00, 0x55, 0x00, 0x60, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x6B, 0x01, 0xF6, 0x00
	.byte 0x2D, 0x01, 0x60, 0x01, 0x02, 0x01, 0xBD, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00
	.byte 0x8F, 0x00, 0x67, 0x00, 0x9A, 0x00, 0x68, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x51, 0x00, 0x99, 0x00, 0x5F, 0x01, 0x30, 0x00, 0x3F, 0x01, 0x73, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x64, 0x00, 0x55, 0x00, 0x9C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x2C, 0x01, 0xD9, 0x00
	.byte 0x2F, 0x00, 0x39, 0x01, 0xCC, 0x00, 0x03, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x59, 0x00
	.byte 0x7E, 0x00, 0x64, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x28, 0x01, 0xE8, 0x00, 0xFC, 0x00, 0x45, 0x00, 0xC5, 0x00, 0x12, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x8F, 0x00, 0x60, 0x00, 0x7F, 0x00, 0x68, 0x00, 0x70, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xA7, 0x00, 0xC9, 0x00
	.byte 0x44, 0x01, 0x65, 0x00, 0xA9, 0x00, 0xB8, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x55, 0x00
	.byte 0x79, 0x00, 0x8F, 0x00, 0x9C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x1B, 0x00, 0xED, 0x00, 0x5B, 0x00, 0x3D, 0x01, 0xC9, 0x00, 0x1C, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x66, 0x00, 0xA1, 0x00, 0x7A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x14, 0x01, 0xCB, 0x00
	.byte 0x13, 0x00, 0x62, 0x00, 0x1B, 0x01, 0x74, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6A, 0x00
	.byte 0x81, 0x00, 0x92, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x66, 0x00, 0x97, 0x00, 0x5D, 0x00, 0xF6, 0x00, 0x49, 0x00, 0x71, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00, 0x8F, 0x00, 0x70, 0x00, 0x8F, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x4A, 0x00, 0xE6, 0x00
	.byte 0xDE, 0x00, 0x5E, 0x01, 0x46, 0x00, 0xB6, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x55, 0x00
	.byte 0x68, 0x00, 0x75, 0x00, 0x87, 0x00, 0x77, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xC8, 0x00, 0xD5, 0x00, 0xDC, 0x00, 0xF7, 0x00, 0x6D, 0x00, 0x56, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x91, 0x00, 0x57, 0x00, 0x8F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x73, 0x01, 0x9D, 0x00
	.byte 0xE1, 0x00, 0x1D, 0x00, 0x18, 0x01, 0xB8, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00
	.byte 0x75, 0x00, 0x8A, 0x00, 0x55, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xE4, 0x00, 0xF9, 0x00, 0xF2, 0x00, 0x34, 0x00, 0x2E, 0x00, 0xB6, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x78, 0x00, 0x9C, 0x00, 0x84, 0x00, 0x9C, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x31, 0x01, 0x9E, 0x00
	.byte 0xE8, 0x00, 0x3D, 0x01, 0x4E, 0x01, 0x6A, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x64, 0x00
	.byte 0x7A, 0x00, 0x9A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x63, 0x00, 0x64, 0x00, 0x77, 0x00
	.byte 0x50, 0x00, 0x77, 0x00, 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00
	.byte 0x78, 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00
	.byte 0xA0, 0x00, 0xC7, 0x00, 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00
	.byte 0xC8, 0x00, 0x2B, 0x01, 0xC8, 0x00, 0x2B, 0x01, 0x64, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x00, 0x01
	.byte 0x78, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x04, 0x01, 0x8C, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x08, 0x01
	.byte 0xA0, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x0C, 0x01, 0xB4, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x10, 0x01
	.byte 0xC8, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x14, 0x01, 0xDC, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00, 0x64, 0x00, 0x01, 0x00, 0x96, 0x00, 0x00, 0x01
	.byte 0x78, 0x00, 0x97, 0x00, 0xFA, 0x00, 0x04, 0x01, 0x8C, 0x00, 0xFB, 0x00, 0x5E, 0x01, 0x08, 0x01
	.byte 0xA0, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x01, 0xB4, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x10, 0x01
	.byte 0xC8, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x14, 0x01, 0xDC, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00, 0x64, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x00, 0x01
	.byte 0x78, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x04, 0x01, 0x8C, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x08, 0x01
	.byte 0xA0, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x0C, 0x01, 0xB4, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x10, 0x01
	.byte 0xC8, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x14, 0x01, 0xDC, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00, 0x01, 0x00, 0x9A, 0x00, 0x9B, 0x00, 0x0E, 0x01
	.byte 0x0F, 0x01, 0x77, 0x01, 0x78, 0x01, 0xDD, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00
	.byte 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00
	.byte 0x01, 0x00, 0x9A, 0x00, 0x01, 0x00, 0x9A, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x01, 0x00, 0x0E, 0x01
	.byte 0x01, 0x00, 0x0E, 0x01, 0x9B, 0x00, 0x77, 0x01, 0x9B, 0x00, 0x77, 0x01, 0x9B, 0x00, 0x77, 0x01
	.byte 0x0F, 0x01, 0xDD, 0x01, 0x0F, 0x01, 0xDD, 0x01, 0x14, 0x00, 0x15, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x1B, 0x00, 0x1B, 0x00, 0x26, 0x00, 0x26, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x0B, 0x00
	.byte 0x16, 0x00, 0x16, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x07, 0x00, 0x07, 0x00, 0x04, 0x00, 0x05, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x1C, 0x00, 0x1C, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00
	.byte 0x45, 0x00, 0x45, 0x00, 0x45, 0x00, 0x45, 0x00, 0x31, 0x00, 0x31, 0x00, 0x32, 0x00, 0x32, 0x00
	.byte 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00
	.byte 0x31, 0x00, 0x31, 0x00, 0x32, 0x00, 0x32, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x39, 0x00, 0x39, 0x00, 0x34, 0x00, 0x34, 0x00, 0x54, 0x00, 0x53, 0x00, 0x0C, 0x00, 0x0D, 0x00
	.byte 0x55, 0x00, 0x3A, 0x00, 0x51, 0x00, 0x1A, 0x00, 0x02, 0x00, 0x03, 0x00, 0x14, 0x00, 0x15, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0x16, 0x00, 0x1C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x51, 0x00, 0x1A, 0x00
	.byte 0x13, 0x00, 0x50, 0x00, 0x16, 0x00, 0x1C, 0x00, 0x20, 0x00, 0x21, 0x00, 0x14, 0x00, 0x15, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0x3A, 0x00, 0x55, 0x00, 0x20, 0x00, 0x21, 0x00, 0x51, 0x00, 0x1A, 0x00
	.byte 0x13, 0x00, 0x50, 0x00, 0x3A, 0x00, 0x55, 0x00, 0x04, 0x00, 0x05, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x25, 0x00, 0x24, 0x00, 0x04, 0x00, 0x05, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x39, 0x00, 0x34, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x13, 0x00, 0x50, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x39, 0x00, 0x34, 0x00, 0x18, 0x00, 0x19, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x33, 0x00, 0x1B, 0x00, 0x18, 0x00, 0x19, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x33, 0x00, 0x1B, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x3D, 0x00
	.byte 0x20, 0x00, 0x20, 0x00, 0x20, 0x00, 0x21, 0x00, 0x21, 0x00, 0x21, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2D, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x55, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x15, 0x00, 0x15, 0x00, 0x15, 0x00, 0x51, 0x00, 0x51, 0x00
	.byte 0x51, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x1C, 0x00
	.byte 0x1C, 0x00, 0x1C, 0x00, 0x16, 0x00, 0x16, 0x00, 0x16, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x30, 0x00
	.byte 0x30, 0x00, 0x25, 0x00, 0x25, 0x00, 0x50, 0x00, 0x50, 0x00, 0x50, 0x00, 0x24, 0x00, 0x24, 0x00
	.byte 0x24, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x34, 0x00, 0x34, 0x00, 0x45, 0x00, 0x45, 0x00
	.byte 0x45, 0x00, 0x2E, 0x00, 0x2E, 0x00, 0x09, 0x00, 0x09, 0x00, 0x55, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x13, 0x00, 0x13, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x47, 0x00, 0x47, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x12, 0x00, 0x12, 0x00, 0x53, 0x00, 0x53, 0x00, 0x53, 0x00, 0x54, 0x00, 0x54, 0x00, 0x54, 0x00
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x1B, 0x00, 0x1B, 0x00
	.byte 0x1B, 0x00, 0x23, 0x00, 0x23, 0x00, 0x23, 0x00, 0x31, 0x00, 0x31, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x32, 0x00, 0x32, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x22, 0x00, 0x22, 0x00, 0x39, 0x00, 0x39, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x3A, 0x00, 0x3A, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x19, 0x00, 0x27, 0x00, 0x27, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x28, 0x00, 0x28, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00
	.byte 0x3C, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x20, 0x00, 0x20, 0x00, 0x21, 0x00, 0x21, 0x00
	.byte 0x06, 0x00, 0x06, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x16, 0x00, 0x16, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x13, 0x00, 0x13, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x30, 0x00, 0x30, 0x00, 0x25, 0x00, 0x25, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x45, 0x00, 0x45, 0x00, 0x2E, 0x00, 0x2E, 0x00, 0x09, 0x00, 0x09, 0x00
	.byte 0x26, 0x00, 0x26, 0x00, 0x33, 0x00, 0x33, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x55, 0x00, 0x55, 0x00, 0x14, 0x00, 0x14, 0x00, 0x15, 0x00, 0x15, 0x00
	.byte 0x47, 0x00, 0x47, 0x00, 0x12, 0x00, 0x12, 0x00, 0x10, 0x00, 0x10, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00
	.byte 0x27, 0x00, 0x27, 0x00, 0x28, 0x00, 0x28, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x0E, 0x00, 0x0E, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x1B, 0x00, 0x1B, 0x00, 0x23, 0x00, 0x23, 0x00, 0x31, 0x00, 0x31, 0x00
	.byte 0x32, 0x00, 0x32, 0x00, 0x51, 0x00, 0x51, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x53, 0x00, 0x53, 0x00
	.byte 0x54, 0x00, 0x54, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x33, 0x00, 0x33, 0x00
	.byte 0x55, 0x00, 0x55, 0x00, 0x13, 0x00, 0x13, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x2E, 0x00, 0x2E, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00, 0x34, 0x00, 0x34, 0x00, 0x25, 0x00, 0x25, 0x00
	.byte 0x39, 0x00, 0x39, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x22, 0x00, 0x22, 0x00, 0x3B, 0x00, 0x3B, 0x00
	.byte 0x3A, 0x00, 0x3A, 0x00, 0x26, 0x00, 0x26, 0x00, 0x33, 0x00, 0x33, 0x00, 0x45, 0x00, 0x45, 0x00
	.byte 0x50, 0x00, 0x50, 0x00, 0x24, 0x00, 0x24, 0x00, 0x07, 0x00, 0x07, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x01, 0x00, 0x04, 0x00, 0x07, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x13, 0x00, 0x15, 0x00, 0x17, 0x00, 0x19, 0x00, 0x1B, 0x00, 0x1D, 0x00, 0x20, 0x00, 0x23, 0x00
	.byte 0x25, 0x00, 0x27, 0x00, 0x29, 0x00, 0x2B, 0x00, 0x2E, 0x00, 0x30, 0x00, 0x32, 0x00, 0x34, 0x00
	.byte 0x36, 0x00, 0x38, 0x00, 0x3C, 0x00, 0x3F, 0x00, 0x42, 0x00, 0x45, 0x00, 0x48, 0x00, 0x4A, 0x00
	.byte 0x4F, 0x00, 0x51, 0x00, 0x54, 0x00, 0x56, 0x00, 0x58, 0x00, 0x5A, 0x00, 0x5C, 0x00, 0x60, 0x00
	.byte 0x62, 0x00, 0x64, 0x00, 0x66, 0x00, 0x68, 0x00, 0x74, 0x00, 0x76, 0x00, 0x81, 0x00, 0x84, 0x00
	.byte 0x85, 0x00, 0x93, 0x00, 0x98, 0x00, 0x9B, 0x00, 0x9E, 0x00, 0xA1, 0x00, 0xA3, 0x00, 0xA5, 0x00
	.byte 0xA7, 0x00, 0xAA, 0x00, 0xAC, 0x00, 0xAD, 0x00, 0xAE, 0x00, 0xAF, 0x00, 0xB1, 0x00, 0xB3, 0x00
	.byte 0xB7, 0x00, 0xBB, 0x00, 0xBF, 0x00, 0xC2, 0x00, 0xC9, 0x00, 0xCC, 0x00, 0xD1, 0x00, 0xD8, 0x00
	.byte 0xDA, 0x00, 0xDC, 0x00, 0xDF, 0x00, 0xE1, 0x00, 0xE4, 0x00, 0xE7, 0x00, 0xEB, 0x00, 0xEC, 0x00
	.byte 0xEE, 0x00, 0xF6, 0x00, 0xFC, 0x00, 0xFF, 0x00, 0x02, 0x01, 0x05, 0x01, 0x07, 0x01, 0x09, 0x01
	.byte 0x0A, 0x01, 0x0C, 0x01, 0x0E, 0x01, 0x11, 0x01, 0x14, 0x01, 0x16, 0x01, 0x18, 0x01, 0x19, 0x01
	.byte 0x1B, 0x01, 0x1D, 0x01, 0x1F, 0x01, 0x22, 0x01, 0x24, 0x01, 0x25, 0x01, 0x28, 0x01, 0x2A, 0x01
	.byte 0x2C, 0x01, 0x30, 0x01, 0x33, 0x01, 0x35, 0x01, 0x3C, 0x01, 0x3E, 0x01, 0x42, 0x01, 0x45, 0x01
	.byte 0x48, 0x01, 0x4B, 0x01, 0x4D, 0x01, 0x53, 0x01, 0x55, 0x01, 0x57, 0x01, 0x5D, 0x01, 0x61, 0x01
	.byte 0x63, 0x01, 0x68, 0x01, 0x69, 0x01, 0x6B, 0x01, 0x72, 0x01, 0x73, 0x01, 0x76, 0x01, 0x83, 0x01
	.byte 0x86, 0x01, 0x89, 0x01, 0x8C, 0x01, 0x8F, 0x01, 0x91, 0x01, 0x93, 0x01, 0x96, 0x01, 0x9C, 0x01
	.byte 0x9F, 0x01, 0xA2, 0x01, 0xA4, 0x01, 0xA6, 0x01, 0xAF, 0x01, 0xB1, 0x01, 0xB2, 0x01, 0xB4, 0x01
	.byte 0xB6, 0x01, 0xB7, 0x01, 0xB8, 0x01, 0xBB, 0x01, 0xBF, 0x01, 0xC1, 0x01, 0xC3, 0x01, 0xC5, 0x01
	.byte 0xC8, 0x01, 0xCB, 0x01, 0x02, 0x00, 0x05, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x11, 0x00
	.byte 0x14, 0x00, 0x18, 0x00, 0x1E, 0x00, 0x21, 0x00, 0x28, 0x00, 0x2C, 0x00, 0x2F, 0x00, 0x33, 0x00
	.byte 0x3A, 0x00, 0x3D, 0x00, 0x40, 0x00, 0x43, 0x00, 0x46, 0x00, 0x4B, 0x00, 0x4D, 0x00, 0x53, 0x00
	.byte 0x5D, 0x00, 0x5F, 0x00, 0x69, 0x00, 0x6C, 0x00, 0x6D, 0x00, 0x6F, 0x00, 0x72, 0x00, 0x78, 0x00
	.byte 0x89, 0x00, 0x8A, 0x00, 0x8C, 0x00, 0x94, 0x00, 0x99, 0x00, 0x9C, 0x00, 0x9F, 0x00, 0xA2, 0x00
	.byte 0xA6, 0x00, 0xA8, 0x00, 0xB0, 0x00, 0xB4, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBC, 0x00, 0xBE, 0x00
	.byte 0xC0, 0x00, 0xC1, 0x00, 0xC3, 0x00, 0xC6, 0x00, 0xC8, 0x00, 0xCA, 0x00, 0xCE, 0x00, 0xCF, 0x00
	.byte 0xD3, 0x00, 0xD7, 0x00, 0xDB, 0x00, 0xDE, 0x00, 0xEF, 0x00, 0xF0, 0x00, 0xF7, 0x00, 0xFD, 0x00
	.byte 0x00, 0x01, 0x03, 0x01, 0x06, 0x01, 0x08, 0x01, 0x0B, 0x01, 0x0D, 0x01, 0x0F, 0x01, 0x12, 0x01
	.byte 0x15, 0x01, 0x17, 0x01, 0x1C, 0x01, 0x26, 0x01, 0x2B, 0x01, 0x2D, 0x01, 0x2E, 0x01, 0x2F, 0x01
	.byte 0x31, 0x01, 0x34, 0x01, 0x37, 0x01, 0x38, 0x01, 0x39, 0x01, 0x3A, 0x01, 0x3B, 0x01, 0x40, 0x01
	.byte 0x47, 0x01, 0x49, 0x01, 0x59, 0x01, 0x5B, 0x01, 0x5F, 0x01, 0x66, 0x01, 0x6C, 0x01, 0x6E, 0x01
	.byte 0x74, 0x01, 0x77, 0x01, 0x84, 0x01, 0x87, 0x01, 0x8A, 0x01, 0x8D, 0x01, 0x90, 0x01, 0x92, 0x01
	.byte 0x94, 0x01, 0x98, 0x01, 0x9A, 0x01, 0x9D, 0x01, 0x9E, 0x01, 0xA1, 0x01, 0xA9, 0x01, 0xAB, 0x01
	.byte 0xB9, 0x01, 0xBC, 0x01, 0xBE, 0x01, 0xCA, 0x01, 0x9D, 0x01, 0x9D, 0x01, 0x1A, 0x00, 0x1C, 0x00
	.byte 0x1F, 0x00, 0x22, 0x00, 0x24, 0x00, 0x2A, 0x00, 0x2D, 0x00, 0x31, 0x00, 0x35, 0x00, 0x39, 0x00
	.byte 0x41, 0x00, 0x47, 0x00, 0x4C, 0x00, 0x50, 0x00, 0x52, 0x00, 0x55, 0x00, 0x57, 0x00, 0x61, 0x00
	.byte 0x63, 0x00, 0x65, 0x00, 0x6A, 0x00, 0x6B, 0x00, 0x6E, 0x00, 0x70, 0x00, 0x71, 0x00, 0x73, 0x00
	.byte 0x75, 0x00, 0x77, 0x00, 0x7A, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x80, 0x00, 0x8B, 0x00
	.byte 0x8D, 0x00, 0xA4, 0x00, 0xAB, 0x00, 0xB2, 0x00, 0xB6, 0x00, 0xBD, 0x00, 0xC7, 0x00, 0xCB, 0x00
	.byte 0xCD, 0x00, 0xD2, 0x00, 0xDD, 0x00, 0xE0, 0x00, 0xE2, 0x00, 0xE3, 0x00, 0xEA, 0x00, 0xED, 0x00
	.byte 0xF1, 0x00, 0x10, 0x01, 0x13, 0x01, 0x1E, 0x01, 0x20, 0x01, 0x23, 0x01, 0x27, 0x01, 0x29, 0x01
	.byte 0x36, 0x01, 0x3D, 0x01, 0x3F, 0x01, 0x43, 0x01, 0x44, 0x01, 0x46, 0x01, 0x4C, 0x01, 0x4E, 0x01
	.byte 0x4F, 0x01, 0x50, 0x01, 0x51, 0x01, 0x52, 0x01, 0x54, 0x01, 0x56, 0x01, 0x5A, 0x01, 0x5C, 0x01
	.byte 0x60, 0x01, 0x62, 0x01, 0x64, 0x01, 0x65, 0x01, 0x67, 0x01, 0x6A, 0x01, 0x6F, 0x01, 0x70, 0x01
	.byte 0x71, 0x01, 0x8E, 0x01, 0x99, 0x01, 0x9B, 0x01, 0xA0, 0x01, 0xA3, 0x01, 0xA5, 0x01, 0xA7, 0x01
	.byte 0xA8, 0x01, 0xAA, 0x01, 0xAC, 0x01, 0xAD, 0x01, 0xB0, 0x01, 0xB3, 0x01, 0xBA, 0x01, 0xC6, 0x01
	.byte 0xC7, 0x01, 0xC9, 0x01, 0xCC, 0x01, 0xDE, 0x01, 0xDF, 0x01, 0x12, 0x00, 0x16, 0x00, 0x09, 0x00
	.byte 0x26, 0x00, 0x37, 0x00, 0x3B, 0x00, 0x3E, 0x00, 0x44, 0x00, 0x49, 0x00, 0x4E, 0x00, 0x59, 0x00
	.byte 0x5B, 0x00, 0x5E, 0x00, 0x67, 0x00, 0x79, 0x00, 0x7B, 0x00, 0x7F, 0x00, 0x82, 0x00, 0x83, 0x00
	.byte 0x86, 0x00, 0x87, 0x00, 0x88, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00, 0x91, 0x00, 0x92, 0x00
	.byte 0x95, 0x00, 0x9A, 0x00, 0x9D, 0x00, 0xA0, 0x00, 0xA9, 0x00, 0xB5, 0x00, 0xBA, 0x00, 0xC4, 0x00
	.byte 0xC5, 0x00, 0xD0, 0x00, 0xD4, 0x00, 0xD5, 0x00, 0xD6, 0x00, 0xD9, 0x00, 0xE5, 0x00, 0xE6, 0x00
	.byte 0xE8, 0x00, 0xE9, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0xF4, 0x00, 0xF5, 0x00, 0xF8, 0x00, 0xFE, 0x00
	.byte 0x01, 0x01, 0x04, 0x01, 0x1A, 0x01, 0x21, 0x01, 0x32, 0x01, 0x41, 0x01, 0x4A, 0x01, 0x58, 0x01
	.byte 0x5E, 0x01, 0x6D, 0x01, 0xE8, 0x01, 0x75, 0x01, 0x78, 0x01, 0x79, 0x01, 0x7A, 0x01, 0x7B, 0x01
	.byte 0x7C, 0x01, 0x7D, 0x01, 0x85, 0x01, 0x88, 0x01, 0x8B, 0x01, 0x95, 0x01, 0x97, 0x01, 0xAE, 0x01
	.byte 0xB5, 0x01, 0xBD, 0x01, 0xC0, 0x01, 0xC2, 0x01, 0xC4, 0x01, 0xCD, 0x01, 0xCE, 0x01, 0xCF, 0x01
	.byte 0xD0, 0x01, 0xD1, 0x01, 0xD2, 0x01, 0xD3, 0x01, 0xD4, 0x01, 0xD5, 0x01, 0xD6, 0x01, 0xD7, 0x01
	.byte 0xD8, 0x01, 0xD9, 0x01, 0xDA, 0x01, 0xDB, 0x01, 0xDC, 0x01, 0xDD, 0x01, 0xE0, 0x01, 0xE1, 0x01
	.byte 0xE2, 0x01, 0xE5, 0x01, 0x03, 0x00, 0x06, 0x00, 0xE6, 0x01, 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0D, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x07, 0x00, 0x03, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0E, 0x00, 0x02, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0F, 0x00
	.byte 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x02, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x11, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x02, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x05, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x04, 0x00
	.byte 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x06, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x03, 0x00, 0x11, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x05, 0x00, 0x05, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x04, 0x00, 0x01, 0x00, 0x01, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x03, 0x00, 0x06, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0F, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x07, 0x00, 0x03, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x0B, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x11, 0x00, 0x02, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x11, 0x00
	.byte 0x0F, 0x00, 0x0A, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x04, 0x00, 0x11, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x02, 0x00, 0x06, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x00, 0x07, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x00, 0x05, 0x00, 0x01, 0x00
	.byte 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x10, 0x00, 0x05, 0x00, 0x0C, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x10, 0x00, 0x08, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x06, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x08, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x07, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00
	.byte 0x08, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0F, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x08, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x10, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x05, 0x00, 0x0E, 0x00, 0x05, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0B, 0x00
	.byte 0x11, 0x00, 0x05, 0x00, 0x0C, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x11, 0x00, 0x11, 0x00, 0x0F, 0x00
	.byte 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x08, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x11, 0x00, 0x07, 0x00, 0x11, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x07, 0x00, 0x0D, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x07, 0x00
	.byte 0x03, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00
	.byte 0x02, 0x00, 0x0D, 0x00, 0x02, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x10, 0x00, 0x02, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x11, 0x00, 0x11, 0x00, 0x08, 0x00
	.byte 0x04, 0x00, 0x06, 0x00, 0x08, 0x00, 0x06, 0x00, 0x05, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x05, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x05, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x04, 0x00, 0x10, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0F, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x10, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x08, 0x00, 0x08, 0x00, 0x10, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x08, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x11, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x04, 0x00, 0x01, 0x00, 0x08, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x0F, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x05, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x04, 0x00, 0x02, 0x00, 0x0F, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x05, 0x00, 0x08, 0x00, 0x07, 0x00
	.byte 0x07, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00
	.byte 0x08, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x0A, 0x0B, 0x0D, 0x0C, 0x0F, 0x01, 0x03, 0x04, 0x02, 0x0E, 0x06, 0x05, 0x07, 0x10, 0x11
	.byte 0x08, 0xFE, 0xFE, 0x09, 0x00, 0x00, 0x63, 0x00, 0x64, 0x00, 0x77, 0x00, 0x50, 0x00, 0x77, 0x00
	.byte 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00, 0x78, 0x00, 0x9F, 0x00
	.byte 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00, 0xA0, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00, 0xC8, 0x00, 0x2B, 0x01
	.byte 0xC8, 0x00, 0x2B, 0x01, 0x00, 0x00, 0x63, 0x00, 0x64, 0x00, 0x77, 0x00, 0x50, 0x00, 0x77, 0x00
	.byte 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00, 0x78, 0x00, 0x9F, 0x00
	.byte 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00, 0xA0, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00, 0xC8, 0x00, 0x2B, 0x01
	.byte 0xC8, 0x00, 0x2B, 0x01, 0x00, 0x03, 0x00, 0x05, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x20, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x01, 0x08
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x05, 0x0C, 0x01, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00
	.byte 0x3C, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x81, 0x9C, 0x23, 0x02, 0x14, 0x00, 0x15, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDA, 0x07, 0x00, 0x00, 0xD2, 0x07, 0x00, 0x00, 0xD2, 0x07, 0x00, 0x00
	.byte 0xD2, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDB, 0x07, 0x00, 0x00, 0xD3, 0x07, 0x00, 0x00
	.byte 0xD3, 0x07, 0x00, 0x00, 0xD3, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC3, 0x02, 0x00, 0x00, 0xBA, 0xB9, 0xBB, 0xBC
	.byte 0xCA, 0xC9, 0xCB, 0x00, 0xC5, 0x02, 0x00, 0x00, 0xAE, 0xAD, 0xAF, 0xB0, 0xC1, 0xC0, 0xC2, 0x00
	.byte 0xC5, 0x02, 0x00, 0x00, 0xAE, 0xAD, 0xAF, 0xB0, 0xC1, 0xC0, 0xC2, 0x00, 0xC7, 0x02, 0x00, 0x00
	.byte 0xAA, 0xA9, 0xAB, 0xAC, 0xBE, 0xBD, 0xBF, 0x00, 0xC4, 0x02, 0x00, 0x00, 0xB6, 0xB5, 0xB7, 0xB8
	.byte 0xC7, 0xC6, 0xC8, 0x00, 0xC6, 0x02, 0x00, 0x00, 0xB2, 0xB1, 0xB3, 0xB4, 0xC4, 0xC3, 0xC5, 0x00
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00, 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x06, 0x05, 0x04
	.byte 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_0223DC20: @ 0x0223DC20
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00, 0x03, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x07, 0x00, 0x02, 0x00, 0x07, 0x00, 0x03, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x0A, 0x00, 0x03, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x03, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x08, 0x00, 0x03, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x09, 0x00, 0x03, 0x00
	.byte 0xA8, 0xBE, 0x23, 0x02, 0x32, 0xBF, 0x23, 0x02, 0xD8, 0xBE, 0x23, 0x02, 0xEC, 0xBE, 0x23, 0x02
	.byte 0x18, 0xBF, 0x23, 0x02, 0x02, 0xBF, 0x23, 0x02, 0xCD, 0x4E, 0x23, 0x02, 0x29, 0x4F, 0x23, 0x02
	.byte 0xAD, 0x4F, 0x23, 0x02, 0x25, 0x50, 0x23, 0x02, 0x9D, 0x50, 0x23, 0x02, 0x19, 0x51, 0x23, 0x02
	.byte 0xAD, 0x51, 0x23, 0x02, 0x09, 0x52, 0x23, 0x02, 0x65, 0x52, 0x23, 0x02, 0xCD, 0x4E, 0x23, 0x02
	.byte 0x29, 0x4F, 0x23, 0x02, 0xAD, 0x4F, 0x23, 0x02, 0x25, 0x50, 0x23, 0x02, 0x9D, 0x50, 0x23, 0x02
	.byte 0x19, 0x51, 0x23, 0x02, 0xAD, 0x51, 0x23, 0x02, 0x09, 0x52, 0x23, 0x02, 0x65, 0x52, 0x23, 0x02
	.byte 0xBD, 0x52, 0x23, 0x02, 0xC9, 0x52, 0x23, 0x02, 0xD1, 0x52, 0x23, 0x02, 0xD9, 0x52, 0x23, 0x02
	.byte 0xE1, 0x52, 0x23, 0x02, 0xE9, 0x52, 0x23, 0x02, 0xF5, 0x52, 0x23, 0x02, 0x01, 0x53, 0x23, 0x02
	.byte 0x0D, 0x53, 0x23, 0x02, 0x15, 0x53, 0x23, 0x02, 0x19, 0x53, 0x23, 0x02, 0x1D, 0x53, 0x23, 0x02
	.byte 0x21, 0x53, 0x23, 0x02, 0x19, 0x53, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0223DD40:
	.space 0x20
