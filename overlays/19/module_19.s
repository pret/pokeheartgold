
	thumb_func_start ov19_022598C0
ov19_022598C0: @ 0x022598C0
	push {r3, r4, r5, lr}
	movs r1, #0x76
	adds r5, r0, #0
	movs r0, #0xb
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0x76
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0xb
	str r0, [r4]
	str r5, [r4, #0x14]
	ldr r0, [r5, #8]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x10]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	bl FUN_020183F0
	movs r1, #0x1d
	str r0, [r4, #8]
	lsls r1, r1, #4
	ldr r0, [r4, #0x1c]
	adds r1, r4, r1
	bl FUN_0206A8C0
	ldr r0, _02259914 @ =ov19_02259950
	adds r1, r4, #0
	movs r2, #1
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	.align 2, 0
_02259914: .4byte ov19_02259950
	thumb_func_end ov19_022598C0

	thumb_func_start ov19_02259918
ov19_02259918: @ 0x02259918
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0xd8
	ldr r0, [r0]
	bl FUN_0201F988
	adds r4, r0, #0
	movs r0, #0x43
	lsls r0, r0, #2
	ldr r1, [r4, #8]
	adds r0, r5, r0
	bl FUN_02018410
	adds r0, r4, #0
	bl ov19_022599D4
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	bl FUN_0200E390
	movs r0, #0
	adds r5, #0xd8
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov19_02259918

	thumb_func_start ov19_02259950
ov19_02259950: @ 0x02259950
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02259964
	cmp r0, #1
	beq _02259972
	cmp r0, #2
	beq _0225998E
	b _022599A0
_02259964:
	adds r0, r4, #0
	bl ov19_022599AC
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r4, pc}
_02259972:
	ldr r0, _022599A8 @ =0x0400006C
	blx FUN_020CDAA8
	cmp r0, #0
	bne _022599A0
	adds r0, r4, #0
	bl ov19_022599F8
	cmp r0, #0
	beq _022599A0
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	b _022599A0
_0225998E:
	adds r0, r4, #0
	bl ov19_02259E44
	cmp r0, #0
	beq _022599A0
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0xc]
	bl FUN_0206A8DC
_022599A0:
	ldr r0, [r4, #0x5c]
	bl FUN_0202457C
	pop {r4, pc}
	.align 2, 0
_022599A8: .4byte 0x0400006C
	thumb_func_end ov19_02259950

	thumb_func_start ov19_022599AC
ov19_022599AC: @ 0x022599AC
	push {r4, lr}
	adds r4, r0, #0
	bl ov19_02259AD8
	adds r0, r4, #0
	bl ov19_02259BC0
	adds r0, r4, #0
	bl ov19_02259C68
	adds r0, r4, #0
	bl ov19_02259CF4
	adds r0, r4, #0
	bl ov19_02259D44
	adds r0, r4, #0
	bl ov19_02259F64
	pop {r4, pc}
	thumb_func_end ov19_022599AC

	thumb_func_start ov19_022599D4
ov19_022599D4: @ 0x022599D4
	push {r4, lr}
	adds r4, r0, #0
	bl ov19_02259DF4
	adds r0, r4, #0
	bl ov19_02259D24
	adds r0, r4, #0
	bl ov19_02259CBC
	adds r0, r4, #0
	bl ov19_02259C64
	adds r0, r4, #0
	bl ov19_02259B90
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov19_022599D4

	thumb_func_start ov19_022599F8
ov19_022599F8: @ 0x022599F8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov19_02259ABC
	adds r4, r0, #0
	bne _02259A14
	adds r0, r5, #0
	bl ov19_02259A94
	adds r4, r0, #0
	bne _02259A18
	movs r0, #0
	str r0, [r5, #8]
	b _02259A18
_02259A14:
	movs r0, #1
	str r0, [r5, #8]
_02259A18:
	cmp r4, #1
	beq _02259A26
	cmp r4, #2
	beq _02259A3A
	cmp r4, #3
	beq _02259A5C
	b _02259A84
_02259A26:
	adds r0, r5, #0
	movs r1, #0
	bl ov19_02259E20
	ldr r0, _02259A8C @ =0x000005DD
	bl FUN_0200604C
	movs r0, #1
	str r0, [r5, #0xc]
	b _02259A88
_02259A3A:
	movs r0, #0x75
	lsls r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _02259A48
	movs r0, #0
	pop {r3, r4, r5, pc}
_02259A48:
	adds r0, r5, #0
	movs r1, #1
	bl ov19_02259E20
	ldr r0, _02259A90 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #2
	str r0, [r5, #0xc]
	b _02259A88
_02259A5C:
	movs r0, #0x75
	lsls r0, r0, #2
	ldrb r1, [r5, r0]
	adds r0, r0, #1
	ldrb r0, [r5, r0]
	subs r0, r0, #1
	cmp r1, r0
	blt _02259A70
	movs r0, #0
	pop {r3, r4, r5, pc}
_02259A70:
	adds r0, r5, #0
	movs r1, #2
	bl ov19_02259E20
	ldr r0, _02259A90 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #3
	str r0, [r5, #0xc]
	b _02259A88
_02259A84:
	movs r0, #0
	pop {r3, r4, r5, pc}
_02259A88:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02259A8C: .4byte 0x000005DD
_02259A90: .4byte 0x000005DC
	thumb_func_end ov19_022599F8

	thumb_func_start ov19_02259A94
ov19_02259A94: @ 0x02259A94
	ldr r0, _02259AB8 @ =0x021D110C
	ldr r2, [r0, #0x48]
	movs r0, #3
	adds r1, r2, #0
	tst r1, r0
	beq _02259AA4
	movs r0, #1
	bx lr
_02259AA4:
	movs r1, #0x20
	tst r1, r2
	beq _02259AAE
	movs r0, #2
	bx lr
_02259AAE:
	movs r1, #0x10
	tst r1, r2
	bne _02259AB6
	movs r0, #0
_02259AB6:
	bx lr
	.align 2, 0
_02259AB8: .4byte 0x021D110C
	thumb_func_end ov19_02259A94

	thumb_func_start ov19_02259ABC
ov19_02259ABC: @ 0x02259ABC
	push {r3, lr}
	ldr r0, _02259AD4 @ =0x0225A05E
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02259AD0
	movs r0, #0
	pop {r3, pc}
_02259AD0:
	adds r0, r0, #1
	pop {r3, pc}
	.align 2, 0
_02259AD4: .4byte 0x0225A05E
	thumb_func_end ov19_02259ABC

	thumb_func_start ov19_02259AD8
ov19_02259AD8: @ 0x02259AD8
	push {r4, r5, lr}
	sub sp, #0x54
	adds r4, r0, #0
	movs r0, #3
	blx FUN_020CDA64
	ldr r5, _02259B84 @ =0x0225A070
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
	ldr r0, [r4, #0x18]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201CAE0
	ldr r5, _02259B88 @ =0x0225A08C
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
	ldr r0, [r4, #0x18]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #6
	bl FUN_0201CAE0
	ldr r5, _02259B8C @ =0x0225A0A8
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
	ldr r0, [r4, #0x18]
	movs r3, #2
	bl FUN_0201B1E4
	ldr r0, [r4, #0x18]
	movs r1, #7
	bl FUN_0201CAE0
	ldr r3, [r4]
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	bl FUN_0201C1C4
	ldr r3, [r4]
	movs r0, #7
	movs r1, #0x40
	movs r2, #0
	bl FUN_0201C1C4
	movs r2, #0
	ldr r0, [r4, #0x18]
	movs r1, #7
	subs r3, r2, #4
	bl FUN_0201BC8C
	add sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_02259B84: .4byte 0x0225A070
_02259B88: .4byte 0x0225A08C
_02259B8C: .4byte 0x0225A0A8
	thumb_func_end ov19_02259AD8

	thumb_func_start ov19_02259B90
ov19_02259B90: @ 0x02259B90
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, [r4, #0x18]
	movs r1, #7
	adds r3, r2, #0
	bl FUN_0201BC8C
	ldr r0, [r4, #0x18]
	movs r1, #7
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #6
	bl FUN_0201BB4C
	ldr r0, [r4, #0x18]
	movs r1, #5
	bl FUN_0201BB4C
	movs r0, #0
	blx FUN_020CDA64
	pop {r4, pc}
	thumb_func_end ov19_02259B90

	thumb_func_start ov19_02259BC0
ov19_02259BC0: @ 0x02259BC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, [r5]
	movs r0, #0xab
	bl FUN_02007688
	movs r3, #0
	str r3, [sp]
	ldr r1, [r5]
	adds r4, r0, #0
	str r1, [sp, #4]
	movs r1, #4
	adds r2, r1, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r3, #6
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	movs r1, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r3, #6
	bl FUN_02007B68
	ldr r0, [r5]
	movs r1, #5
	str r0, [sp]
	adds r0, r4, #0
	movs r2, #0
	add r3, sp, #0x10
	bl FUN_02007C10
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r3, #0x1d
	lsls r3, r3, #4
	ldr r3, [r5, r3]
	ldr r2, [sp, #0x10]
	ldrb r3, [r3, #4]
	ldr r0, [r5, #0x18]
	movs r7, #0x19
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x19
	adds r3, r3, #1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r5, r3, #0
	muls r5, r7, r5
	adds r5, #0x40
	ldr r2, [r2, #0x14]
	lsls r3, r5, #6
	adds r2, r2, r3
	movs r1, #7
	lsls r3, r7, #6
	bl FUN_0201C0C0
	adds r0, r6, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov19_02259BC0

	thumb_func_start ov19_02259C64
ov19_02259C64: @ 0x02259C64
	bx lr
	.align 2, 0
	thumb_func_end ov19_02259C64

	thumb_func_start ov19_02259C68
ov19_02259C68: @ 0x02259C68
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, [r6]
	movs r0, #4
	bl FUN_02002CEC
	movs r0, #0
	ldr r3, [r6]
	movs r1, #0x1b
	adds r2, r0, #0
	bl FUN_0200BAF8
	str r0, [r6, #0x24]
	ldr r2, [r6]
	movs r0, #6
	movs r1, #0x16
	bl FUN_0200BD18
	str r0, [r6, #0x28]
	ldr r1, [r6]
	movs r0, #0x80
	bl FUN_02026354
	str r0, [r6, #0x2c]
	ldr r0, [r6, #0x24]
	movs r1, #0
	bl FUN_0200BBA0
	str r0, [r6, #0x30]
	movs r4, #0
	adds r5, r6, #0
_02259CA6:
	adds r1, r4, #0
	ldr r0, [r6, #0x24]
	adds r1, #0xa
	bl FUN_0200BBA0
	str r0, [r5, #0x34]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02259CA6
	pop {r4, r5, r6, pc}
	thumb_func_end ov19_02259C68

	thumb_func_start ov19_02259CBC
ov19_02259CBC: @ 0x02259CBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	adds r5, r6, #0
_02259CC4:
	ldr r0, [r5, #0x34]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _02259CC4
	ldr r0, [r6, #0x30]
	bl FUN_02026380
	ldr r0, [r6, #0x2c]
	bl FUN_02026380
	ldr r0, [r6, #0x28]
	bl FUN_0200BDA0
	ldr r0, [r6, #0x24]
	bl FUN_0200BB44
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov19_02259CBC

	thumb_func_start ov19_02259CF4
ov19_02259CF4: @ 0x02259CF4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _02259D20 @ =0x0225A04E
	movs r6, #0
	adds r5, #0x3c
_02259D00:
	ldr r0, [r7, #0x18]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r0, r5, #0
	movs r1, #0
	bl FUN_0201D978
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #2
	blt _02259D00
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259D20: .4byte 0x0225A04E
	thumb_func_end ov19_02259CF4

	thumb_func_start ov19_02259D24
ov19_02259D24: @ 0x02259D24
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x3c
_02259D2C:
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blt _02259D2C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov19_02259D24

	thumb_func_start ov19_02259D44
ov19_02259D44: @ 0x02259D44
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r3, [sp]
	ldr r1, _02259DEC @ =0x0225A040
	ldr r3, [r3]
	adds r0, #0x5c
	movs r2, #3
	bl FUN_021E7FDC
	ldr r5, [sp]
	ldr r4, _02259DF0 @ =0x0225A0C4
	adds r7, r5, #0
	movs r6, #0
	adds r7, #0x5c
_02259D60:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_021E81F0
	movs r1, #7
	lsls r1, r1, #6
	str r0, [r5, r1]
	adds r0, r1, #0
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0202484C
	adds r6, r6, #1
	adds r4, #0x28
	adds r5, r5, #4
	cmp r6, #3
	blt _02259D60
	movs r1, #0x75
	ldr r0, [sp]
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _02259DA8
	ldr r0, [sp]
	subs r1, #0x10
	ldr r0, [r0, r1]
	movs r1, #2
	bl FUN_020248F0
	b _02259DB4
_02259DA8:
	ldr r0, [sp]
	subs r1, #0x10
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_020248F0
_02259DB4:
	movs r1, #0x75
	lsls r1, r1, #2
	ldr r0, [sp]
	adds r2, r1, #1
	ldrb r3, [r0, r1]
	ldrb r0, [r0, r2]
	subs r0, r0, #1
	cmp r3, r0
	blt _02259DD4
	ldr r0, [sp]
	subs r1, #0xc
	ldr r0, [r0, r1]
	movs r1, #5
	bl FUN_020248F0
	b _02259DE0
_02259DD4:
	ldr r0, [sp]
	subs r1, #0xc
	ldr r0, [r0, r1]
	movs r1, #3
	bl FUN_020248F0
_02259DE0:
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259DEC: .4byte 0x0225A040
_02259DF0: .4byte 0x0225A0C4
	thumb_func_end ov19_02259D44

	thumb_func_start ov19_02259DF4
ov19_02259DF4: @ 0x02259DF4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #7
	movs r4, #0
	adds r5, r7, #0
	lsls r6, r6, #6
_02259E00:
	ldr r0, [r5, r6]
	bl FUN_02024758
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #3
	blt _02259E00
	adds r7, #0x5c
	adds r0, r7, #0
	bl FUN_021E8194
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov19_02259DF4

	thumb_func_start ov19_02259E20
ov19_02259E20: @ 0x02259E20
	push {r3, r4, r5, lr}
	movs r2, #0x73
	lsls r2, r2, #2
	strb r1, [r0, r2]
	subs r2, #0xc
	adds r5, r0, r2
	lsls r4, r1, #2
	ldr r2, _02259E40 @ =0x0225A03C
	ldr r0, [r5, r4]
	ldrb r1, [r2, r1]
	bl FUN_020248F0
	ldr r0, [r5, r4]
	bl FUN_02024964
	pop {r3, r4, r5, pc}
	.align 2, 0
_02259E40: .4byte 0x0225A03C
	thumb_func_end ov19_02259E20

	thumb_func_start ov19_02259E44
ov19_02259E44: @ 0x02259E44
	push {r3, lr}
	movs r1, #0x73
	lsls r1, r1, #2
	ldrb r2, [r0, r1]
	subs r1, #0xc
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0, r1]
	bl FUN_02024B68
	cmp r0, #0
	bne _02259E60
	movs r0, #1
	pop {r3, pc}
_02259E60:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov19_02259E44

	thumb_func_start ov19_02259E64
ov19_02259E64: @ 0x02259E64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [sp, #0x20]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02028E9C
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0200BE48
	ldrh r0, [r5, #0x32]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_02068F98
	movs r0, #0
	str r0, [sp]
	movs r3, #2
	adds r0, r4, #0
	movs r1, #1
	adds r2, r6, #0
	str r3, [sp, #4]
	bl FUN_0200BE3C
	adds r1, r5, #0
	adds r0, r6, #0
	adds r1, #0x18
	bl FUN_020269A0
	movs r0, #0
	movs r1, #2
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r1, #0
	str r1, [sp, #4]
	bl FUN_0200BE3C
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	adds r0, r4, #0
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0x7d
	lsls r2, r2, #4
	adds r2, r3, r2
	movs r1, #3
	movs r3, #4
	bl FUN_0200BFCC
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	adds r0, r4, #0
	lsrs r2, r2, #0x10
	lsls r2, r2, #0x18
	movs r1, #4
	lsrs r2, r2, #0x18
	bl FUN_0200BFCC
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	adds r0, r4, #0
	lsrs r2, r2, #8
	lsls r2, r2, #0x18
	movs r1, #5
	lsrs r2, r2, #0x18
	bl FUN_0200BFCC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov19_02259E64

	thumb_func_start ov19_02259F0C
ov19_02259F0C: @ 0x02259F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	movs r5, #0
	adds r7, r0, #0
	str r5, [sp, #0x10]
_02259F16:
	ldr r0, [sp, #0x10]
	movs r4, #0
	adds r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_02259F20:
	str r6, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r2, r4, r5
	adds r3, r4, #0
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r2, #1
	adds r3, #0xd
	str r0, [sp, #0xc]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	ldr r0, [r7, #0x18]
	movs r1, #7
	lsrs r2, r2, #0x10
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r4, r4, #1
	cmp r4, #5
	blt _02259F20
	ldr r0, [sp, #0x10]
	adds r5, r5, #5
	adds r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _02259F16
	ldr r0, [r7, #0x18]
	movs r1, #7
	bl FUN_0201EFBC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov19_02259F0C

	thumb_func_start ov19_02259F64
ov19_02259F64: @ 0x02259F64
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	movs r5, #0x40
	subs r3, r5, r3
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A000 @ =0x00010500
	lsrs r3, r3, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x30]
	adds r0, #0x3c
	movs r1, #4
	bl FUN_020200FC
	adds r0, r4, #0
	adds r0, #0x3c
	bl FUN_0201D5C8
	ldr r0, [r4, #0x10]
	str r0, [sp]
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	ldr r3, [r4]
	bl ov19_02259E64
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov19_0225A008
	cmp r0, #1
	ldr r0, [r4, #0x28]
	bls _02259FCC
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x38]
	bl FUN_0200CBBC
	b _02259FD4
_02259FCC:
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x34]
	bl FUN_0200CBBC
_02259FD4:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A004 @ =0x00030200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	ldr r2, [r4, #0x2c]
	adds r0, #0x4c
	bl FUN_020200FC
	adds r0, r4, #0
	adds r0, #0x4c
	bl FUN_0201D5C8
	adds r0, r4, #0
	bl ov19_02259F0C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225A000: .4byte 0x00010500
_0225A004: .4byte 0x00030200
	thumb_func_end ov19_02259F64

	thumb_func_start ov19_0225A008
ov19_0225A008: @ 0x0225A008
	push {r3, r4}
	movs r1, #0
	ldr r3, _0225A038 @ =0x000001ED
	adds r2, r1, #0
_0225A010:
	lsls r4, r2, #2
	adds r4, r0, r4
	adds r4, #0x6c
	ldrh r4, [r4]
	cmp r4, #0
	ble _0225A026
	cmp r4, r3
	bgt _0225A026
	adds r1, r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
_0225A026:
	adds r2, r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r2, #6
	blo _0225A010
	adds r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_0225A038: .4byte 0x000001ED
	thumb_func_end ov19_0225A008

	.rodata

_0225A03C:
	.byte 0x09, 0x01, 0x04, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x00, 0x05, 0x18
	.byte 0x15, 0x08, 0x02, 0x01, 0xF0, 0x01, 0x05, 0x01, 0x08, 0x1C, 0x08, 0x0A, 0x10, 0x01, 0xA2, 0xBC
	.byte 0xC2, 0xFE, 0x18, 0x38, 0x50, 0x60, 0x18, 0x38, 0xA0, 0xB0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0D, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x28, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
