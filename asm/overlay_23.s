
	thumb_func_start ov23_022598C0
ov23_022598C0: @ 0x022598C0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x104
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r6, #0xd
	blo _022598D0
	bl FUN_0202551C
_022598D0:
	adds r0, r5, #0
	movs r1, #0x14
	bl FUN_0201AA8C
	adds r4, r0, #0
	adds r2, r4, #0
	movs r1, #0x14
	movs r0, #0
_022598E0:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _022598E0
	movs r2, #0
	str r2, [sp]
	movs r0, #0x70
	adds r1, r6, #0
	adds r3, r5, #0
	bl FUN_02007A44
	str r0, [r4]
	str r5, [r4, #0x10]
	str r6, [r4, #0xc]
	adds r0, r5, #0
	bl FUN_0206DD2C
	str r0, [r4, #4]
	adds r0, r5, #0
	bl FUN_02028ED0
	str r0, [r4, #8]
	bl FUN_02028EF0
	adds r6, #0xd
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov23_02259C1C
	adds r5, r0, #0
	add r1, sp, #4
	movs r2, #0x80
	bl FUN_02026A68
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [r4, #8]
	add r1, sp, #4
	bl FUN_02028F24
	ldr r1, [r4]
	ldr r0, [r4, #8]
	ldr r1, [r1, #0x40]
	bl FUN_02028F90
	adds r0, r4, #0
	add sp, #0x104
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov23_022598C0

	thumb_func_start ov23_02259944
ov23_02259944: @ 0x02259944
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	ldr r0, [r4, #4]
	bl FUN_0201AB0C
	ldr r0, [r4, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov23_02259944

	thumb_func_start ov23_02259964
ov23_02259964: @ 0x02259964
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	str r2, [sp, #0xc]
	movs r0, #0xb
	adds r5, r1, #0
	str r3, [sp, #0x10]
	bl FUN_0206DD2C
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x70
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xb
	bl FUN_02007A44
	adds r4, r0, #0
	ldr r0, [sp, #0x10]
	adds r1, r4, #0
	str r0, [sp]
	movs r0, #7
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	adds r0, r6, #0
	adds r3, r5, #0
	bl ov23_02259C40
	ldr r0, [r7, #0xc]
	adds r1, r6, #0
	bl FUN_0202ECC0
	ldr r0, [r7, #0xc]
	bl FUN_02074904
	adds r1, r6, #0
	adds r7, r0, #0
	bl FUN_02074524
	cmp r5, #7
	bne _02259A14
	adds r0, r7, #0
	bl FUN_02074640
	adds r1, r0, #0
	adds r0, r7, #0
	subs r1, r1, #1
	bl FUN_02074644
	adds r5, #0xd
	str r0, [sp, #0x14]
	movs r0, #0xb
	adds r1, r5, #0
	bl ov23_02259C1C
	adds r5, r0, #0
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078078
	adds r1, r0, #0
	ldr r0, [r4, #0x20]
	adds r3, r5, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r2, [r4, #0x40]
	adds r0, r6, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_0202B2D4
	adds r7, r0, #0
	ldr r0, [sp, #0x14]
	movs r1, #0xaa
	adds r2, r7, #0
	bl FUN_0206EC40
	adds r0, r5, #0
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_0201AB0C
_02259A14:
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov23_02259964

	thumb_func_start ov23_02259A24
ov23_02259A24: @ 0x02259A24
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r0, #0xb
	bl FUN_0206DD2C
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0x70
	movs r1, #7
	movs r2, #0
	movs r3, #0xb
	bl FUN_02007A44
	adds r4, r0, #0
	movs r0, #0x65
	str r0, [sp]
	movs r3, #7
	str r3, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x14
	bl ov23_02259C40
	movs r0, #0xb
	movs r1, #0x14
	bl ov23_02259C1C
	adds r6, r0, #0
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078078
	adds r1, r0, #0
	ldr r0, [r4, #0x20]
	adds r3, r6, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r2, [r4, #0x40]
	adds r0, r5, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	bl FUN_0202B2D4
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0201AB0C
	adds r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov23_02259A24

	thumb_func_start ov23_02259AA0
ov23_02259AA0: @ 0x02259AA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, [r0, #0xc]
	adds r4, r2, #0
	adds r5, r1, #0
	bl FUN_02074904
	adds r1, r4, #0
	str r0, [sp, #4]
	bl FUN_02074644
	adds r1, r5, #0
	str r0, [sp]
	bl FUN_0206D894
	cmp r0, #0
	bne _02259AC8
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259AC8:
	ldr r0, [sp]
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	beq _02259ADE
	add sp, #8
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02259ADE:
	ldr r0, [sp, #4]
	movs r6, #0
	bl FUN_02074640
	adds r7, r0, #0
	adds r5, r6, #0
	cmp r7, #0
	ble _02259B28
_02259AEE:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl FUN_02074644
	movs r1, #3
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	cmp r0, #1
	beq _02259B22
	adds r0, r4, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _02259B22
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02259B22
	adds r6, r6, #1
_02259B22:
	adds r5, r5, #1
	cmp r5, r7
	blt _02259AEE
_02259B28:
	cmp r6, #2
	bge _02259B32
	add sp, #8
	movs r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02259B32:
	ldr r0, [sp]
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	beq _02259B48
	add sp, #8
	movs r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02259B48:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov23_02259AA0

	thumb_func_start ov23_02259B50
ov23_02259B50: @ 0x02259B50
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov23_02259B50

	thumb_func_start ov23_02259B58
ov23_02259B58: @ 0x02259B58
	ldr r0, [r0]
	ldr r0, [r0, #0x4c]
	bx lr
	.align 2, 0
	thumb_func_end ov23_02259B58

	thumb_func_start ov23_02259B60
ov23_02259B60: @ 0x02259B60
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bx lr
	.align 2, 0
	thumb_func_end ov23_02259B60

	thumb_func_start ov23_02259B68
ov23_02259B68: @ 0x02259B68
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_02074904
	ldr r2, [r6, #4]
	adds r1, r4, #0
	bl FUN_02074740
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #4]
	bl FUN_0202ECC0
	pop {r4, r5, r6, pc}
	thumb_func_end ov23_02259B68

	thumb_func_start ov23_02259B88
ov23_02259B88: @ 0x02259B88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	adds r7, r2, #0
	adds r5, r1, #0
	adds r4, r3, #0
	bl FUN_02074904
	adds r1, r7, #0
	bl FUN_02074644
	movs r1, #0xa1
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	adds r2, r0, #0
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [r5]
	ldr r3, [r5, #0xc]
	bl ov23_02259C40
	ldr r1, [sp, #0x20]
	adds r0, r7, #0
	bl FUN_0207188C
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x24]
	bl FUN_0207188C
	ldr r0, [sp, #0x20]
	bl FUN_02070DB0
	str r0, [r4]
	ldr r0, [sp, #0x24]
	bl FUN_02070DB0
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r6, #0xc]
	bl FUN_02028EA8
	str r0, [r4, #0x14]
	adds r0, r6, #0
	bl FUN_020555E0
	cmp r0, #1
	bhi _02259C06
	movs r0, #0
	add sp, #0xc
	str r0, [r4, #0xc]
	pop {r4, r5, r6, r7, pc}
_02259C06:
	cmp r0, #2
	bne _02259C12
	movs r0, #1
	add sp, #0xc
	str r0, [r4, #0xc]
	pop {r4, r5, r6, r7, pc}
_02259C12:
	movs r0, #2
	str r0, [r4, #0xc]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov23_02259B88

	thumb_func_start ov23_02259C1C
ov23_02259C1C: @ 0x02259C1C
	push {r3, r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xc8
	bl FUN_0200BAF8
	adds r5, r0, #0
	adds r1, r4, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0200BB44
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov23_02259C1C

	thumb_func_start ov23_02259C40
ov23_02259C40: @ 0x02259C40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r3, #0
	movs r3, #1
	adds r4, r1, #0
	str r3, [sp]
	ldr r1, [r4, #0x38]
	adds r5, r0, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	ldr r1, [r4, #0x20]
	movs r3, #0x20
	str r1, [sp, #0xc]
	ldr r1, [r4]
	bl FUN_0206DE38
	ldr r7, [sp, #0x38]
	adds r1, r6, #0
	adds r0, r7, #0
	bl ov23_02259C1C
	str r0, [sp, #0x10]
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #0x77
	bl FUN_0206EC40
	ldr r0, [sp, #0x10]
	bl FUN_02026380
	movs r1, #1
	add r0, sp, #0x14
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0x4d
	add r2, sp, #0x14
	bl FUN_0206EC40
	adds r0, r5, #0
	movs r1, #0x46
	adds r2, r4, #4
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x47
	adds r2, #8
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x48
	adds r2, #0xc
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x49
	adds r2, #0x10
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x4a
	adds r2, #0x14
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x4b
	adds r2, #0x18
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x13
	adds r2, #0x24
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x14
	adds r2, #0x28
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x15
	adds r2, #0x2c
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x16
	adds r2, #0x30
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x17
	adds r2, #0x34
	bl FUN_0206EC40
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #6
	adds r2, #0x3c
	bl FUN_0206EC40
	adds r6, #0xd
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov23_02259C1C
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x91
	adds r2, r6, #0
	bl FUN_0206EC40
	adds r0, r6, #0
	bl FUN_02026380
	adds r2, r4, #0
	adds r0, r5, #0
	movs r1, #0x9d
	adds r2, #0x40
	bl FUN_0206EC40
	adds r4, #0x48
	adds r0, r5, #0
	movs r1, #0xc
	adds r2, r4, #0
	bl FUN_0206EC40
	ldr r0, [sp, #0x30]
	bl FUN_0203B36C
	adds r3, r0, #0
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x34]
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0208F260
	adds r0, r5, #0
	bl FUN_0206E250
	adds r0, r5, #0
	bl FUN_0207003C
	cmp r0, #0
	beq _02259D78
	bl FUN_0202551C
_02259D78:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov23_02259C40
