
	thumb_func_start ov14_021E5900
ov14_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #9
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #9
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x38
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	ldr r0, [r0]
	bl FUN_020270D8
	str r0, [r4, #4]
	bl FUN_02073D4C
	strb r0, [r4, #0x1f]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02074904
	str r0, [r4, #8]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0207879C
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_02028EA8
	str r0, [r4, #0x10]
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	movs r0, #0
	str r0, [r4, #0x2c]
	movs r0, #0xb
	str r0, [r4, #0x30]
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E5900

	thumb_func_start ov14_021E596C
ov14_021E596C: @ 0x021E596C
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	adds r1, r4, #0
	bl ov14_021EAF8C
	cmp r0, #0
	bne _021E5982
	movs r0, #1
	pop {r4, pc}
_021E5982:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E596C

	thumb_func_start ov14_021E5988
ov14_021E5988: @ 0x021E5988
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0x1f]
	bl FUN_02073E84
	adds r0, r4, #0
	bl FUN_02007294
	movs r0, #9
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E5988

	thumb_func_start ov14_021E59AC
ov14_021E59AC: @ 0x021E59AC
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x34]
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _021E59C6
	adds r0, r4, #0
	blx r1
	cmp r0, #0
	bne _021E59C6
	ldr r0, [r4, #0x34]
	movs r1, #0
	str r1, [r0, #4]
_021E59C6:
	adds r0, r4, #0
	bl ov14_021E5A14
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x18]
	bl FUN_0200398C
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x14]
	bl FUN_0201EEB4
	ldr r0, [r4, #0x34]
	bl ov14_021F29C4
	ldr r1, [r4, #0x34]
	ldr r0, _021E5A08 @ =0x000088D2
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _021E59FA
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0200D020
	bl FUN_0200D034
_021E59FA:
	ldr r3, _021E5A0C @ =0x027E0000
	ldr r1, _021E5A10 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_021E5A08: .4byte 0x000088D2
_021E5A0C: .4byte 0x027E0000
_021E5A10: .4byte 0x00003FF8
	thumb_func_end ov14_021E59AC

	thumb_func_start ov14_021E5A14
ov14_021E5A14: @ 0x021E5A14
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _021E5A30
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	bl FUN_02019978
	pop {r4, pc}
_021E5A30:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	bl FUN_02019978
	ldr r0, [r4, #0x34]
	bl ov14_021F3BC0
	pop {r4, pc}
	thumb_func_end ov14_021E5A14

	thumb_func_start ov14_021E5A44
ov14_021E5A44: @ 0x021E5A44
	movs r2, #0
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	str r1, [r0, #4]
	str r2, [r0, #8]
	bx lr
	thumb_func_end ov14_021E5A44

	thumb_func_start ov14_021E5A50
ov14_021E5A50: @ 0x021E5A50
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov14_021E5A50

	thumb_func_start ov14_021E5A54
ov14_021E5A54: @ 0x021E5A54
	ldr r3, _021E5A5C @ =ov14_021E5A44
	ldr r1, [r0, #8]
	bx r3
	nop
_021E5A5C: .4byte ov14_021E5A44
	thumb_func_end ov14_021E5A54

	thumb_func_start ov14_021E5A60
ov14_021E5A60: @ 0x021E5A60
	ldr r3, _021E5A68 @ =FUN_02022BE8
	ldr r0, _021E5A6C @ =0x021F7CE4
	bx r3
	nop
_021E5A68: .4byte FUN_02022BE8
_021E5A6C: .4byte 0x021F7CE4
	thumb_func_end ov14_021E5A60

	thumb_func_start ov14_021E5A70
ov14_021E5A70: @ 0x021E5A70
	push {r4, r5, lr}
	sub sp, #0xd4
	adds r4, r0, #0
	movs r0, #0xa
	bl FUN_0201AC88
	ldr r1, [r4, #0x34]
	add r3, sp, #0xc4
	ldr r5, _021E5BE0 @ =0x021F7BC8
	str r0, [r1, #0x14]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021E5BE4 @ =0x021F7C20
	add r3, sp, #0xa8
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
	ldr r0, [r4, #0x34]
	adds r3, r1, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201B1E4
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201CAE0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0xa
	bl FUN_0201C1C4
	ldr r5, _021E5BE8 @ =0x021F7C3C
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
	ldr r0, [r4, #0x34]
	movs r3, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201B1E4
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x14]
	bl FUN_0201CAE0
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xa
	bl FUN_0201C1C4
	ldr r5, _021E5BEC @ =0x021F7C74
	add r3, sp, #0x70
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0x34]
	movs r1, #2
	ldr r0, [r0, #0x14]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _021E5BF0 @ =0x021F7C90
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
	ldr r0, [r4, #0x34]
	movs r3, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201B1E4
	ldr r5, _021E5BF4 @ =0x021F7C58
	add r3, sp, #0x38
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
	ldr r0, [r4, #0x34]
	movs r3, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201B1E4
	ldr r0, [r4, #0x34]
	movs r1, #4
	ldr r0, [r0, #0x14]
	bl FUN_0201CAE0
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xa
	bl FUN_0201C1C4
	ldr r5, _021E5BF8 @ =0x021F7CAC
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
	ldr r0, [r4, #0x34]
	movs r3, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201B1E4
	ldr r5, _021E5BFC @ =0x021F7CC8
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
	ldr r0, [r4, #0x34]
	movs r3, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201B1E4
	ldr r0, [r4, #0x34]
	movs r1, #6
	ldr r0, [r0, #0x14]
	bl FUN_0201CAE0
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #0xa
	bl FUN_0201C1C4
	add sp, #0xd4
	pop {r4, r5, pc}
	nop
_021E5BE0: .4byte 0x021F7BC8
_021E5BE4: .4byte 0x021F7C20
_021E5BE8: .4byte 0x021F7C3C
_021E5BEC: .4byte 0x021F7C74
_021E5BF0: .4byte 0x021F7C90
_021E5BF4: .4byte 0x021F7C58
_021E5BF8: .4byte 0x021F7CAC
_021E5BFC: .4byte 0x021F7CC8
	thumb_func_end ov14_021E5A70

	thumb_func_start ov14_021E5C00
ov14_021E5C00: @ 0x021E5C00
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #6
	ldr r0, [r0, #0x14]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x34]
	movs r1, #5
	ldr r0, [r0, #0x14]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x34]
	movs r1, #4
	ldr r0, [r0, #0x14]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x34]
	movs r1, #3
	ldr r0, [r0, #0x14]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x34]
	movs r1, #2
	ldr r0, [r0, #0x14]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x14]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201BB4C
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x14]
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov14_021E5C00

	thumb_func_start ov14_021E5C54
ov14_021E5C54: @ 0x021E5C54
	push {r4, lr}
	sub sp, #0x10
	movs r3, #0
	str r3, [sp]
	adds r4, r0, #0
	str r3, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r0, #0x13
	ldr r2, [r2, #0x14]
	movs r1, #0xe
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r0, #0x13
	ldr r2, [r2, #0x14]
	movs r1, #0xe
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r0, #0x13
	ldr r2, [r2, #0x14]
	movs r1, #3
	movs r3, #2
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r1, #2
	ldr r2, [r2, #0x14]
	movs r0, #0x13
	adds r3, r1, #0
	bl FUN_02007914
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r0, #0x13
	ldr r2, [r2, #0x14]
	movs r3, #3
	bl FUN_020078F0
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r0, #0x13
	ldr r2, [r2, #0x14]
	movs r3, #3
	bl FUN_02007914
	movs r0, #0x80
	str r0, [sp]
	movs r0, #0xa
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x13
	movs r1, #4
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r0, #0x13
	ldr r2, [r2, #0x14]
	movs r1, #6
	movs r3, #5
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r1, #5
	ldr r2, [r2, #0x14]
	movs r0, #0x13
	adds r3, r1, #0
	bl FUN_02007914
	movs r3, #0
	str r3, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #0x13
	movs r1, #7
	movs r2, #4
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x34]
	movs r1, #6
	ldr r2, [r2, #0x14]
	movs r0, #0x13
	adds r3, r1, #0
	bl FUN_020078F0
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov14_021E5C54

	thumb_func_start ov14_021E5D78
ov14_021E5D78: @ 0x021E5D78
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x18
	movs r3, #0xa
	bl FUN_0200BAF8
	ldr r1, [r4, #0x34]
	movs r2, #0
	str r0, [r1, #0x20]
	movs r0, #1
	movs r1, #2
	movs r3, #0xa
	bl FUN_0200CC74
	ldr r1, [r4, #0x34]
	str r0, [r1, #0x1c]
	movs r0, #0xa
	bl FUN_0200BD08
	ldr r1, [r4, #0x34]
	str r0, [r1, #0x24]
	movs r0, #1
	lsls r0, r0, #0xa
	movs r1, #0xa
	bl FUN_02026354
	ldr r1, [r4, #0x34]
	str r0, [r1, #0x28]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E5D78

	thumb_func_start ov14_021E5DB8
ov14_021E5DB8: @ 0x021E5DB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x28]
	bl FUN_02026380
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x24]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x1c]
	bl FUN_0200CD94
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x20]
	bl FUN_0200BB44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E5DB8

	thumb_func_start ov14_021E5DE0
ov14_021E5DE0: @ 0x021E5DE0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0xfa
	ldr r4, [r5, #0x34]
	lsls r0, r0, #2
	str r0, [sp]
	subs r0, #0xe8
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	movs r0, #0x13
	movs r1, #0x40
	movs r3, #0
	bl FUN_020078F0
	movs r0, #0xfa
	lsls r0, r0, #2
	str r0, [sp]
	subs r0, #0xe8
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0xa
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	movs r0, #0x13
	movs r1, #0x40
	bl FUN_020078F0
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0xa
	movs r3, #6
	str r0, [sp, #4]
	movs r0, #0x13
	movs r1, #0x41
	movs r2, #0
	lsls r3, r3, #6
	bl FUN_02007938
	ldr r0, [r5, #0x10]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r3, #0xa
	str r3, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r2, _021E5E70 @ =0x0000038E
	movs r1, #0
	bl FUN_0200E644
	movs r1, #0x16
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0xa
	bl FUN_0200304C
	movs r1, #0x1e
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0xa
	bl FUN_02003030
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E5E70: .4byte 0x0000038E
	thumb_func_end ov14_021E5DE0

	thumb_func_start ov14_021E5E74
ov14_021E5E74: @ 0x021E5E74
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	bl FUN_020030E8
	ldr r1, [r4, #0x34]
	movs r2, #2
	str r0, [r1, #0x18]
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x18]
	lsls r2, r2, #8
	movs r3, #0xa
	bl FUN_02003120
	pop {r4, pc}
	thumb_func_end ov14_021E5E74

	thumb_func_start ov14_021E5E94
ov14_021E5E94: @ 0x021E5E94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x18]
	bl FUN_02003150
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x18]
	bl FUN_02003104
	pop {r4, pc}
	thumb_func_end ov14_021E5E94

	thumb_func_start ov14_021E5EAC
ov14_021E5EAC: @ 0x021E5EAC
	push {r3, lr}
	cmp r0, #1
	bne _021E5EC4
	movs r0, #0xa
	str r0, [sp]
	ldr r0, _021E5ECC @ =0x04000050
	movs r1, #0
	movs r2, #0x2a
	movs r3, #6
	blx FUN_020CF15C
	pop {r3, pc}
_021E5EC4:
	ldr r0, _021E5ECC @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	pop {r3, pc}
	.align 2, 0
_021E5ECC: .4byte 0x04000050
	thumb_func_end ov14_021E5EAC

	thumb_func_start ov14_021E5ED0
ov14_021E5ED0: @ 0x021E5ED0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	bl FUN_0201660C
	ldr r2, [r4, #0x34]
	ldr r1, _021E5EE4 @ =0x00000434
	str r0, [r2, r1]
	pop {r4, pc}
	nop
_021E5EE4: .4byte 0x00000434
	thumb_func_end ov14_021E5ED0

	thumb_func_start ov14_021E5EE8
ov14_021E5EE8: @ 0x021E5EE8
	ldr r1, [r0, #0x34]
	ldr r0, _021E5EF4 @ =0x00000434
	ldr r3, _021E5EF8 @ =FUN_02016624
	ldr r0, [r1, r0]
	bx r3
	nop
_021E5EF4: .4byte 0x00000434
_021E5EF8: .4byte FUN_02016624
	thumb_func_end ov14_021E5EE8

	thumb_func_start ov14_021E5EFC
ov14_021E5EFC: @ 0x021E5EFC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	ldr r2, [r0, #0x34]
	movs r4, #0xeb
	ldr r2, [r2, #0x14]
	movs r5, #0
	str r2, [sp]
	lsls r4, r4, #2
	movs r2, #8
	str r4, [sp, #8]
	str r2, [sp, #0xc]
	str r5, [sp, #4]
	movs r3, #0x19
	add r2, sp, #0
	strb r3, [r2, #0x10]
	movs r3, #0xc
	strb r3, [r2, #0x11]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1c
	ldrb r6, [r2, #0x12]
	movs r3, #0xf
	lsrs r1, r1, #0x18
	bics r6, r3
	strb r6, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	movs r6, #0xf0
	adds r4, #0x88
	bics r3, r6
	orrs r1, r3
	strb r1, [r2, #0x12]
	strb r5, [r2, #0x13]
	ldr r0, [r0, #0x34]
	add r1, sp, #0
	ldr r0, [r0, r4]
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021E5EFC

	thumb_func_start ov14_021E5F4C
ov14_021E5F4C: @ 0x021E5F4C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, _021E6044 @ =0x000088D4
	adds r4, r0, r1
	ldrb r1, [r4, #2]
	cmp r1, #0
	beq _021E5F68
	cmp r1, #1
	beq _021E5FC0
	cmp r1, #2
	beq _021E602C
	b _021E603E
_021E5F68:
	ldrb r1, [r4]
	lsls r2, r1, #0x1f
	lsrs r2, r2, #0x1f
	bne _021E5F8A
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021E5FB8
_021E5F8A:
	ldrb r1, [r4, #6]
	str r1, [sp]
	ldrb r1, [r4, #7]
	str r1, [sp, #4]
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	str r1, [sp, #8]
	ldrb r1, [r4]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #5]
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x14]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	ldrb r1, [r4]
	ldr r0, [r5, #0x34]
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x14]
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021E5FB8:
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _021E603E
_021E5FC0:
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #4
	bne _021E603E
	ldrb r0, [r4]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	bne _021E5FF0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021E6020
_021E5FF0:
	ldrb r0, [r4, #6]
	str r0, [sp]
	ldrb r0, [r4, #7]
	str r0, [sp, #4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4]
	ldr r0, [r5, #0x34]
	ldrb r2, [r4, #4]
	lsls r1, r1, #0x18
	ldrb r3, [r4, #5]
	ldr r0, [r0, #0x14]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	ldrb r1, [r4]
	ldr r0, [r5, #0x34]
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x14]
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021E6020:
	movs r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _021E603E
_021E602C:
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _021E603E
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021E603E:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021E6044: .4byte 0x000088D4
	thumb_func_end ov14_021E5F4C

	thumb_func_start ov14_021E6048
ov14_021E6048: @ 0x021E6048
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F90
	cmp r0, #1
	ldr r0, [r4]
	bne _021E6064
	ldr r0, [r0, #4]
	movs r1, #0
	bl FUN_02018410
	pop {r4, pc}
_021E6064:
	ldr r0, [r0, #4]
	movs r1, #1
	bl FUN_02018410
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E6048

	thumb_func_start ov14_021E6070
ov14_021E6070: @ 0x021E6070
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldrb r1, [r0, #0x1f]
	adds r5, r2, #0
	adds r2, r6, #0
	adds r4, r3, #0
	bl ov14_021E60C0
	cmp r0, #0
	bne _021E6088
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E6088:
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0206E640
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021E6070

	thumb_func_start ov14_021E6094
ov14_021E6094: @ 0x021E6094
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #0x1f]
	adds r6, r2, #0
	adds r2, r4, #0
	adds r7, r3, #0
	bl ov14_021E60C0
	cmp r0, #0
	beq _021E60BE
	adds r1, r6, #0
	adds r2, r7, #0
	bl FUN_0206ED70
	cmp r4, #0x1e
	bhs _021E60BE
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	bl FUN_020740D8
_021E60BE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021E6094

	thumb_func_start ov14_021E60C0
ov14_021E60C0: @ 0x021E60C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	cmp r1, #0xff
	beq _021E60CE
	cmp r4, #0x1e
	blo _021E60F0
_021E60CE:
	cmp r4, #0x1e
	blo _021E60D4
	subs r4, #0x1e
_021E60D4:
	ldr r0, [r5, #8]
	bl FUN_02074640
	cmp r0, r4
	bls _021E60EC
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02074644
	bl FUN_02070DB0
	pop {r3, r4, r5, pc}
_021E60EC:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E60F0:
	cmp r4, #0xff
	bne _021E60F8
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E60F8:
	ldr r0, [r5, #4]
	bl FUN_02074058
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E60C0

	thumb_func_start ov14_021E6100
ov14_021E6100: @ 0x021E6100
	push {r3, lr}
	cmp r2, #0x1e
	bhs _021E610E
	ldr r0, [r0, #4]
	bl FUN_02073D10
	pop {r3, pc}
_021E610E:
	subs r2, #0x1e
	ldr r0, [r0, #8]
	adds r1, r2, #0
	bl FUN_0207456C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E6100

	thumb_func_start ov14_021E611C
ov14_021E611C: @ 0x021E611C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldrb r1, [r5, #0x1f]
	ldr r2, [r6, #4]
	bl ov14_021E60C0
	ldr r1, [r6]
	bl FUN_02071780
	ldr r7, [r4, #4]
	ldr r0, [r5, #8]
	subs r7, #0x1e
	adds r1, r7, #0
	bl FUN_02074644
	ldr r1, [r4]
	bl FUN_0207188C
	movs r1, #0
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r4]
	movs r1, #0xbb
	add r2, sp, #0
	bl FUN_0206EC40
	ldr r0, [r5, #8]
	ldr r2, [r6]
	adds r1, r7, #0
	bl FUN_02074740
	ldr r0, [r4]
	bl FUN_02070DB0
	adds r3, r0, #0
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	ldr r2, [r4, #8]
	bl FUN_02073C6C
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4958
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4A20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E611C

	thumb_func_start ov14_021E6184
ov14_021E6184: @ 0x021E6184
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #0x1f]
	ldr r2, [r4, #4]
	bl ov14_021E60C0
	ldr r1, [r4]
	bl FUN_02071780
	ldr r0, [r5, #8]
	ldr r1, [r4]
	bl FUN_02074524
	ldrb r1, [r5, #0x1f]
	ldr r2, [r4, #4]
	adds r0, r5, #0
	bl ov14_021E6100
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4958
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4A20
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E6184

	thumb_func_start ov14_021E61BC
ov14_021E61BC: @ 0x021E61BC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r5, #8]
	subs r1, #0x1e
	bl FUN_02074644
	movs r2, #0
	add r1, sp, #0
	strb r2, [r1]
	adds r6, r0, #0
	movs r1, #0xbb
	add r2, sp, #0
	bl FUN_0206EC40
	adds r0, r6, #0
	bl FUN_02070DB0
	adds r3, r0, #0
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	ldr r2, [r4, #8]
	bl FUN_02073C6C
	ldrb r1, [r5, #0x1f]
	ldr r2, [r4, #4]
	adds r0, r5, #0
	bl ov14_021E6100
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4958
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4A20
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021E61BC

	thumb_func_start ov14_021E6210
ov14_021E6210: @ 0x021E6210
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r1, #0
	ldr r7, [r6, #4]
	adds r5, r0, #0
	ldr r4, [r6, #8]
	subs r7, #0x1e
	ldr r0, [r5, #8]
	adds r1, r7, #0
	subs r4, #0x1e
	bl FUN_02074644
	ldr r1, [r6]
	bl FUN_0207188C
	add r1, sp, #4
	ldr r0, [r5, #8]
	adds r1, #1
	adds r2, r7, #0
	bl FUN_02074670
	ldr r0, [r5, #8]
	add r1, sp, #0
	adds r2, r4, #0
	bl FUN_02074670
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02074644
	adds r2, r0, #0
	ldr r0, [r5, #8]
	adds r1, r7, #0
	bl FUN_02074740
	ldr r0, [r5, #8]
	ldr r2, [r6]
	adds r1, r4, #0
	bl FUN_02074740
	ldr r0, [r5, #8]
	add r1, sp, #0
	adds r2, r7, #0
	bl FUN_020746BC
	add r1, sp, #4
	ldr r0, [r5, #8]
	adds r1, #1
	adds r2, r4, #0
	bl FUN_020746BC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E6210

	thumb_func_start ov14_021E627C
ov14_021E627C: @ 0x021E627C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r6, [r4, #4]
	adds r5, r0, #0
	subs r6, #0x1e
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_02074644
	ldr r1, [r4]
	bl FUN_0207188C
	ldr r0, [r5, #8]
	add r1, sp, #0
	adds r2, r6, #0
	bl FUN_02074670
	ldrb r1, [r5, #0x1f]
	ldr r2, [r4, #4]
	adds r0, r5, #0
	bl ov14_021E6100
	ldr r0, [r5, #8]
	ldr r1, [r4]
	bl FUN_02074524
	ldr r0, [r5, #8]
	bl FUN_02074640
	subs r2, r0, #1
	ldr r0, [r5, #8]
	add r1, sp, #0
	bl FUN_020746BC
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021E627C

	thumb_func_start ov14_021E62C8
ov14_021E62C8: @ 0x021E62C8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldrb r1, [r5, #0x1f]
	ldr r2, [r4, #4]
	bl ov14_021E60C0
	adds r6, r0, #0
	ldr r1, [r4, #8]
	adds r0, r5, #0
	bl ov14_021E6464
	adds r7, r0, #0
	ldr r0, [r5, #4]
	adds r1, r7, #0
	adds r2, r6, #0
	bl FUN_02073BFC
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	ldr r2, [r4, #4]
	bl FUN_02073D10
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4958
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4A20
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov14_021F4958
	adds r0, r5, #0
	adds r1, r7, #0
	bl ov14_021F4A20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021E62C8

	thumb_func_start ov14_021E6318
ov14_021E6318: @ 0x021E6318
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	adds r5, r0, #0
	bl ov14_021E6464
	ldr r1, [r4, #4]
	adds r6, r0, #0
	ldr r0, [r5, #8]
	subs r1, #0x1e
	bl FUN_02074644
	ldr r1, [r4]
	bl FUN_0207188C
	ldr r0, [r4]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x7b
	lsls r1, r1, #2
	cmp r0, r1
	bne _021E6350
	ldr r0, [r4]
	movs r1, #0
	bl FUN_02071D6C
_021E6350:
	ldr r0, [r4]
	bl FUN_02070DB0
	adds r2, r0, #0
	ldr r0, [r5, #4]
	adds r1, r6, #0
	bl FUN_02073BFC
	ldrb r1, [r5, #0x1f]
	ldr r2, [r4, #4]
	adds r0, r5, #0
	bl ov14_021E6100
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F4958
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F4A20
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021E6318

	thumb_func_start ov14_021E637C
ov14_021E637C: @ 0x021E637C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r4, [r0, #0xc]
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _021E6462
	ldr r0, [r5, #8]
	bl FUN_02074640
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r3, [r1]
	movs r1, #0x80
	tst r1, r3
	beq _021E63CA
	adds r0, r5, #0
	adds r1, r3, #0
	bl ov14_021E6464
	adds r0, r4, #0
	adds r0, #0xe4
	ldr r1, [r0]
	cmp r1, #0x1e
	bhs _021E63BC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E62C8
	pop {r3, r4, r5, pc}
_021E63BC:
	subs r1, #0x1e
	lsls r1, r1, #5
	adds r0, r5, #0
	adds r1, r4, r1
	bl ov14_021E6318
	pop {r3, r4, r5, pc}
_021E63CA:
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r2, [r1]
	cmp r2, #0x1e
	bhs _021E6410
	cmp r3, #0x1e
	bhs _021E63F2
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	bl FUN_02073CC0
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4958
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F4A20
	pop {r3, r4, r5, pc}
_021E63F2:
	subs r3, #0x1e
	cmp r3, r0
	bhs _021E6406
	adds r1, r4, #0
	adds r4, #0x20
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021E611C
	pop {r3, r4, r5, pc}
_021E6406:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E6184
	pop {r3, r4, r5, pc}
_021E6410:
	cmp r3, #0x1e
	bhs _021E6446
	adds r1, r3, #0
	adds r0, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021E6432
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x20
	adds r2, r4, #0
	bl ov14_021E611C
	pop {r3, r4, r5, pc}
_021E6432:
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r1, [r1]
	adds r0, r5, #0
	subs r1, #0x1e
	lsls r1, r1, #5
	adds r1, r4, r1
	bl ov14_021E61BC
	pop {r3, r4, r5, pc}
_021E6446:
	subs r3, #0x1e
	cmp r3, r0
	bhs _021E6456
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E6210
	pop {r3, r4, r5, pc}
_021E6456:
	subs r2, #0x1e
	lsls r1, r2, #5
	adds r0, r5, #0
	adds r1, r4, r1
	bl ov14_021E627C
_021E6462:
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E637C

	thumb_func_start ov14_021E6464
ov14_021E6464: @ 0x021E6464
	push {r4, lr}
	adds r0, #0x25
	ldrb r0, [r0]
	adds r4, r1, #0
	movs r1, #6
	blx FUN_020F2998
	movs r1, #0x7f
	adds r2, r4, #0
	ands r2, r1
	movs r1, #6
	muls r1, r0, r1
	adds r0, r2, r1
	pop {r4, pc}
	thumb_func_end ov14_021E6464

	thumb_func_start ov14_021E6480
ov14_021E6480: @ 0x021E6480
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	adds r7, r1, #0
	movs r4, #0
	bl FUN_02074640
	cmp r0, #0
	bls _021E64CA
_021E6492:
	cmp r4, r7
	beq _021E64BE
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0x4c
	movs r2, #0
	adds r6, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _021E64BE
	adds r0, r6, #0
	movs r1, #0xa3
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021E64BE
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E64BE:
	ldr r0, [r5, #8]
	adds r4, r4, #1
	bl FUN_02074640
	cmp r4, r0
	blo _021E6492
_021E64CA:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E6480

	thumb_func_start ov14_021E64D0
ov14_021E64D0: @ 0x021E64D0
	push {r3, r4, r5, lr}
	movs r1, #5
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _021E6544 @ =0x000001ED
	cmp r1, r0
	bne _021E6510
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl FUN_02071BD0
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	beq _021E6540
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6510:
	subs r0, r0, #6
	cmp r1, r0
	bne _021E6540
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r4, #0
	bl FUN_02071CBC
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	beq _021E6540
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6540:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E6544: .4byte 0x000001ED
	thumb_func_end ov14_021E64D0

	thumb_func_start ov14_021E6548
ov14_021E6548: @ 0x021E6548
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x1e
	bhs _021E6556
	cmp r2, #0x1e
	blo _021E65BC
_021E6556:
	cmp r4, #0x1e
	blo _021E655E
	cmp r2, #0x1e
	bhs _021E65BC
_021E655E:
	cmp r4, #0x1e
	blo _021E6564
	adds r4, r2, #0
_021E6564:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #5
	movs r3, #0
	bl ov14_021E6070
	movs r1, #0x7b
	lsls r1, r1, #2
	cmp r0, r1
	bne _021E65BC
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x70
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021E65BC
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021E60C0
	movs r1, #0
	bl FUN_02071D7C
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r4
	ldr r3, _021E65C0 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	adds r2, r4, #0
	bl ov14_021F2ED0
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, r4
	bne _021E65BC
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E7588
_021E65BC:
	pop {r4, r5, r6, pc}
	nop
_021E65C0: .4byte 0x00004094
	thumb_func_end ov14_021E6548

	thumb_func_start ov14_021E65C4
ov14_021E65C4: @ 0x021E65C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r6, [r0, #0xc]
	adds r0, r6, #0
	adds r0, #0xe0
	ldr r0, [r0]
	cmp r0, #8
	bne _021E665E
	movs r7, #0
_021E65DA:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _021E6650
	ldr r1, [r6, #4]
	ldr r0, [r5, #0x34]
	adds r2, r0, r1
	ldr r0, _021E66F0 @ =0x00004094
	ldrb r4, [r2, r0]
	ldr r0, [r6, #8]
	movs r2, #0x80
	tst r2, r0
	add r2, sp, #4
	bne _021E6604
	adds r3, r5, #0
	adds r3, #0x22
	ldrb r3, [r3]
	add r1, sp, #4
	adds r1, #2
	bl ov14_021F2F88
	b _021E6634
_021E6604:
	cmp r1, #0x1e
	blo _021E661A
	adds r3, r5, #0
	adds r3, #0x22
	ldrb r3, [r3]
	add r1, sp, #4
	movs r0, #0x23
	adds r1, #2
	bl ov14_021F2F88
	b _021E662A
_021E661A:
	adds r3, r5, #0
	adds r3, #0x22
	ldrb r3, [r3]
	adds r0, r1, #0
	add r1, sp, #4
	adds r1, #2
	bl ov14_021F2F88
_021E662A:
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	movs r2, #0
	bl ov14_021F2A18
_021E6634:
	ldr r1, [r5, #0x34]
	lsls r0, r4, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r2, sp, #4
	movs r1, #2
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
_021E6650:
	adds r7, r7, #1
	adds r6, #0x20
	cmp r7, #7
	blo _021E65DA
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E665E:
	adds r0, r6, #0
	adds r0, #0xe0
	ldr r0, [r0]
	adds r4, r6, #0
	adds r1, r0, #1
	adds r0, r6, #0
	adds r0, #0xe0
	str r1, [r0]
	movs r0, #0
	str r0, [sp]
	add r7, sp, #4
_021E6674:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _021E66DE
	ldr r1, [r5, #0x34]
	ldr r0, [r4, #4]
	adds r1, r1, r0
	ldr r0, _021E66F0 @ =0x00004094
	ldrb r0, [r1, r0]
	movs r1, #0x18
	ldrsh r3, [r4, r1]
	adds r1, r6, #0
	adds r1, #0xe0
	ldr r2, [r1]
	ldr r1, [r4, #0x10]
	mov ip, r0
	movs r0, #0x1c
	muls r1, r2, r1
	lsrs r1, r1, #0x10
	ldrsh r0, [r4, r0]
	muls r1, r3, r1
	adds r0, r0, r1
	strh r0, [r7, #2]
	movs r1, #0x1a
	ldrsh r3, [r4, r1]
	adds r1, r6, #0
	adds r1, #0xe0
	ldr r2, [r1]
	ldr r1, [r4, #0x14]
	movs r0, #0x1e
	muls r1, r2, r1
	lsrs r1, r1, #0x10
	ldrsh r0, [r4, r0]
	muls r1, r3, r1
	movs r2, #0
	adds r0, r0, r1
	strh r0, [r7]
	mov r1, ip
	ldr r0, [r5, #0x34]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #4]
	movs r2, #0
	bl ov14_021F3190
_021E66DE:
	ldr r0, [sp]
	adds r4, #0x20
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #7
	blo _021E6674
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E66F0: .4byte 0x00004094
	thumb_func_end ov14_021E65C4

	thumb_func_start ov14_021E66F4
ov14_021E66F4: @ 0x021E66F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r4, [r0, #0xc]
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r0, [r0]
	cmp r0, #8
	bne _021E676E
	movs r6, #0
_021E670A:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _021E6760
	ldr r1, [r5, #0x34]
	ldr r0, [r4, #4]
	adds r3, r5, #0
	adds r1, r1, r0
	ldr r0, _021E6810 @ =0x00004094
	adds r3, #0x22
	ldrb r7, [r1, r0]
	add r1, sp, #4
	ldrb r3, [r3]
	ldr r0, [r4, #8]
	adds r1, #2
	add r2, sp, #4
	bl ov14_021F2F88
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	ldr r0, [r4, #8]
	cmp r1, r0
	beq _021E6744
	add r1, sp, #4
	movs r0, #0
	ldrsh r1, [r1, r0]
	add r0, sp, #4
	adds r1, #0x90
	strh r1, [r0]
_021E6744:
	ldr r1, [r5, #0x34]
	lsls r0, r7, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r2, sp, #4
	movs r1, #2
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
_021E6760:
	adds r6, r6, #1
	adds r4, #0x20
	cmp r6, #7
	blo _021E670A
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E676E:
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0xe0
	str r1, [r0]
	movs r1, #0
	adds r0, r4, #0
_021E6780:
	ldr r2, [r0, #0xc]
	cmp r2, #0
	beq _021E6802
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r3, [r2]
	ldr r2, [r0, #8]
	cmp r3, r2
	bne _021E6802
	lsls r6, r1, #5
	adds r0, r4, #4
	str r0, [sp]
	ldr r1, [r5, #0x34]
	ldr r0, [r0, r6]
	adds r1, r1, r0
	ldr r0, _021E6810 @ =0x00004094
	ldrb r3, [r1, r0]
	adds r0, r4, r6
	movs r1, #0x1c
	ldrsh r7, [r0, r1]
	movs r1, #0x18
	ldrsh r1, [r0, r1]
	mov ip, r1
	adds r1, r4, #0
	adds r1, #0xe0
	ldr r2, [r1]
	ldr r1, [r0, #0x10]
	adds r4, #0xe0
	muls r1, r2, r1
	lsrs r1, r1, #0x10
	mov r2, ip
	muls r1, r2, r1
	adds r1, r7, r1
	add r7, sp, #4
	strh r1, [r7, #2]
	movs r1, #0x1e
	ldrsh r2, [r0, r1]
	movs r1, #0x1a
	ldrsh r1, [r0, r1]
	ldr r4, [r4]
	ldr r0, [r0, #0x14]
	muls r0, r4, r0
	lsrs r0, r0, #0x10
	muls r0, r1, r0
	adds r0, r2, r0
	strh r0, [r7]
	movs r2, #0
	ldr r1, [r5, #0x34]
	lsls r0, r3, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	bl FUN_0200DDB8
	ldr r1, [sp]
	ldr r0, [r5, #0x34]
	ldr r1, [r1, r6]
	movs r2, #0
	bl ov14_021F3190
	b _021E680A
_021E6802:
	adds r1, r1, #1
	adds r0, #0x20
	cmp r1, #7
	blo _021E6780
_021E680A:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6810: .4byte 0x00004094
	thumb_func_end ov14_021E66F4

	thumb_func_start ov14_021E6814
ov14_021E6814: @ 0x021E6814
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	ldr r5, [r0, #0xc]
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	cmp r0, #8
	bne _021E6876
	movs r4, #0
_021E682A:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021E6868
	ldr r1, [r6, #0x34]
	ldr r0, [r5, #4]
	adds r3, r6, #0
	adds r1, r1, r0
	ldr r0, _021E6908 @ =0x00004094
	adds r3, #0x22
	ldrb r7, [r1, r0]
	add r1, sp, #4
	ldrb r3, [r3]
	ldr r0, [r5, #8]
	adds r1, #2
	add r2, sp, #4
	bl ov14_021F2F88
	add r2, sp, #4
	ldr r1, [r6, #0x34]
	lsls r0, r7, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
_021E6868:
	adds r4, r4, #1
	adds r5, #0x20
	cmp r4, #7
	blo _021E682A
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6876:
	adds r0, r5, #0
	adds r0, #0xe0
	ldr r0, [r0]
	adds r4, r5, #0
	adds r1, r0, #1
	adds r0, r5, #0
	adds r0, #0xe0
	str r1, [r0]
	movs r0, #0
	str r0, [sp]
	add r7, sp, #4
_021E688C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _021E68F6
	ldr r1, [r6, #0x34]
	ldr r0, [r4, #4]
	adds r1, r1, r0
	ldr r0, _021E6908 @ =0x00004094
	ldrb r0, [r1, r0]
	movs r1, #0x18
	ldrsh r3, [r4, r1]
	adds r1, r5, #0
	adds r1, #0xe0
	ldr r2, [r1]
	ldr r1, [r4, #0x10]
	mov ip, r0
	movs r0, #0x1c
	muls r1, r2, r1
	lsrs r1, r1, #0x10
	ldrsh r0, [r4, r0]
	muls r1, r3, r1
	adds r0, r0, r1
	strh r0, [r7, #2]
	movs r1, #0x1a
	ldrsh r3, [r4, r1]
	adds r1, r5, #0
	adds r1, #0xe0
	ldr r2, [r1]
	ldr r1, [r4, #0x14]
	movs r0, #0x1e
	muls r1, r2, r1
	lsrs r1, r1, #0x10
	ldrsh r0, [r4, r0]
	muls r1, r3, r1
	movs r2, #0
	adds r0, r0, r1
	strh r0, [r7]
	mov r1, ip
	ldr r0, [r6, #0x34]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	bl FUN_0200DDB8
	ldr r0, [r6, #0x34]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	bl ov14_021F31E0
_021E68F6:
	ldr r0, [sp]
	adds r4, #0x20
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #7
	blo _021E688C
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6908: .4byte 0x00004094
	thumb_func_end ov14_021E6814

	thumb_func_start ov14_021E690C
ov14_021E690C: @ 0x021E690C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r6, r1, #0
	adds r1, r4, #0
	movs r2, #0xac
	movs r3, #0
	adds r5, r0, #0
	bl ov14_021E6070
	movs r0, #0x80
	tst r0, r4
	beq _021E694C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E6464
	ldrb r1, [r5, #0x1f]
	str r0, [sp]
	cmp r0, r1
	beq _021E6940
	ldr r0, [r5, #4]
	ldr r1, [sp]
	bl FUN_02073F64
	cmp r0, #0x1e
	bne _021E6944
_021E6940:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6944:
	movs r0, #0x80
	eors r4, r0
	movs r7, #0
	b _021E695E
_021E694C:
	ldrb r0, [r5, #0x1f]
	adds r1, r4, #0
	movs r2, #0xac
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl ov14_021E6070
	adds r7, r0, #0
_021E695E:
	cmp r6, #0x1e
	blo _021E69D6
	adds r1, r6, #0
	adds r0, r5, #0
	subs r1, #0x1e
	bl ov14_021E6480
	cmp r0, #0
	bne _021E699C
	cmp r7, #0
	bne _021E6984
	cmp r4, #0x1e
	blo _021E6980
	ldrb r1, [r5, #0x1f]
	ldr r0, [sp]
	cmp r0, r1
	beq _021E699C
_021E6980:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6984:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x4c
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021E699C
	cmp r4, #0x1e
	bhs _021E699C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E699C:
	cmp r4, #0x1e
	bhs _021E6A36
	subs r6, #0x1e
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021E69C4
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E69C4:
	adds r0, r4, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021E6A36
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E69D6:
	cmp r4, #0x1e
	blo _021E6A36
	cmp r7, #0
	beq _021E6A36
	adds r1, r4, #0
	ldr r0, [r5, #8]
	subs r1, #0x1e
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021E6A02
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6A02:
	adds r0, r7, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021E6A14
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6A14:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x4c
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021E6A36
	subs r4, #0x1e
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E6480
	cmp r0, #0
	bne _021E6A36
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6A36:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E690C

	thumb_func_start ov14_021E6A3C
ov14_021E6A3C: @ 0x021E6A3C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r1, r2, #0
	movs r2, #0xac
	movs r3, #0
	adds r5, r0, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021E6A54
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E6A54:
	adds r1, r4, #0
	adds r0, r5, #0
	subs r1, #0x1e
	bl ov14_021E6480
	cmp r0, #0
	bne _021E6A66
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E6A66:
	subs r4, #0x1e
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021E6A8A
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E6A8A:
	adds r0, r4, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _021E6A9C
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E6A9C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E6A3C

	thumb_func_start ov14_021E6AA0
ov14_021E6AA0: @ 0x021E6AA0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r1, r6, #0
	movs r2, #0xac
	movs r3, #0
	adds r5, r0, #0
	bl ov14_021E6070
	cmp r0, #0
	bne _021E6ABA
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6ABA:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x4c
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021E6ACE
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6ACE:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	bl FUN_02078068
	cmp r0, #1
	bne _021E6AEC
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6AEC:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r7, #0
	bl FUN_02078068
	cmp r0, #1
	bne _021E6B0A
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6B0A:
	ldr r0, [sp]
	cmp r0, #0x70
	bne _021E6B26
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	movs r3, #0
	bl ov14_021E6070
	ldr r1, _021E6B44 @ =0x000001E7
	cmp r0, r1
	beq _021E6B26
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6B26:
	cmp r7, #0x70
	bne _021E6B40
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #5
	movs r3, #0
	bl ov14_021E6070
	ldr r1, _021E6B44 @ =0x000001E7
	cmp r0, r1
	beq _021E6B40
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6B40:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6B44: .4byte 0x000001E7
	thumb_func_end ov14_021E6AA0

	thumb_func_start ov14_021E6B48
ov14_021E6B48: @ 0x021E6B48
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #4]
	adds r2, r0, r1
	ldr r1, _021E6C08 @ =0x00004094
	ldrb r1, [r2, r1]
	adds r2, r4, #0
	adds r2, #0x1e
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r4, #0
	adds r1, #0x1c
	bl FUN_0200DE44
	ldr r2, [r4, #8]
	movs r0, #0x80
	tst r0, r2
	bne _021E6B88
	adds r5, #0x22
	ldrb r3, [r5]
	add r1, sp, #0
	adds r0, r2, #0
	adds r1, #2
	add r2, sp, #0
	bl ov14_021F2F88
	b _021E6B98
_021E6B88:
	movs r1, #0x7f
	ands r1, r2
	add r2, sp, #0
	ldr r0, [r5, #0x34]
	adds r2, #2
	add r3, sp, #0
	bl ov14_021F4940
_021E6B98:
	movs r0, #0x1c
	add r2, sp, #0
	movs r1, #2
	ldrsh r5, [r4, r0]
	ldrsh r3, [r2, r1]
	cmp r5, r3
	bgt _021E6BB2
	movs r3, #1
	strh r3, [r4, #0x18]
	ldrsh r1, [r2, r1]
	ldrsh r0, [r4, r0]
	subs r0, r1, r0
	b _021E6BBC
_021E6BB2:
	subs r3, r1, #3
	strh r3, [r4, #0x18]
	ldrsh r3, [r4, r0]
	ldrsh r0, [r2, r1]
	subs r0, r3, r0
_021E6BBC:
	lsls r1, r0, #0x10
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [r4, #0x10]
	movs r0, #0x1e
	add r2, sp, #0
	movs r1, #0
	ldrsh r5, [r4, r0]
	ldrsh r3, [r2, r1]
	cmp r5, r3
	bgt _021E6BEE
	movs r3, #1
	strh r3, [r4, #0x1a]
	ldrsh r1, [r2, r1]
	ldrsh r0, [r4, r0]
	subs r0, r1, r0
	lsls r1, r0, #0x10
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [r4, #0x14]
	pop {r3, r4, r5, pc}
_021E6BEE:
	subs r3, r1, #1
	strh r3, [r4, #0x1a]
	ldrsh r3, [r4, r0]
	ldrsh r0, [r2, r1]
	subs r0, r3, r0
	lsls r1, r0, #0x10
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [r4, #0x14]
	pop {r3, r4, r5, pc}
	nop
_021E6C08: .4byte 0x00004094
	thumb_func_end ov14_021E6B48

	thumb_func_start ov14_021E6C0C
ov14_021E6C0C: @ 0x021E6C0C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #8]
	adds r2, r0, r1
	ldr r1, _021E6CC4 @ =0x00004094
	ldrb r6, [r2, r1]
	ldr r2, [r4, #4]
	adds r2, r0, r2
	ldrb r1, [r2, r1]
	adds r2, r4, #0
	adds r2, #0x1e
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r4, #0
	adds r1, #0x1c
	bl FUN_0200DE44
	ldr r1, [r5, #0x34]
	lsls r0, r6, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0x1c
	add r2, sp, #0
	movs r1, #2
	ldrsh r5, [r4, r0]
	ldrsh r3, [r2, r1]
	cmp r5, r3
	bgt _021E6C6A
	movs r3, #1
	strh r3, [r4, #0x18]
	ldrsh r1, [r2, r1]
	ldrsh r0, [r4, r0]
	subs r0, r1, r0
	b _021E6C74
_021E6C6A:
	subs r3, r1, #3
	strh r3, [r4, #0x18]
	ldrsh r3, [r4, r0]
	ldrsh r0, [r2, r1]
	subs r0, r3, r0
_021E6C74:
	lsls r1, r0, #0x10
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [r4, #0x10]
	movs r0, #0x1e
	add r2, sp, #0
	movs r1, #0
	ldrsh r5, [r4, r0]
	ldrsh r3, [r2, r1]
	cmp r5, r3
	bgt _021E6CA8
	movs r3, #1
	strh r3, [r4, #0x1a]
	ldrsh r1, [r2, r1]
	ldrsh r0, [r4, r0]
	add sp, #4
	subs r0, r1, r0
	lsls r1, r0, #0x10
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [r4, #0x14]
	pop {r3, r4, r5, r6, pc}
_021E6CA8:
	subs r3, r1, #1
	strh r3, [r4, #0x1a]
	ldrsh r3, [r4, r0]
	ldrsh r0, [r2, r1]
	subs r0, r3, r0
	lsls r1, r0, #0x10
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [r4, #0x14]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E6CC4: .4byte 0x00004094
	thumb_func_end ov14_021E6C0C

	thumb_func_start ov14_021E6CC8
ov14_021E6CC8: @ 0x021E6CC8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	ldr r1, [r7, #0x34]
	adds r6, r2, #0
	ldr r4, [r1, #0xc]
	movs r1, #1
	str r5, [r4, #4]
	str r6, [r4, #8]
	str r1, [r4, #0xc]
	adds r1, r4, #0
	bl ov14_021E6B48
	str r6, [r4, #0x24]
	str r5, [r4, #0x28]
	movs r0, #1
	str r0, [r4, #0x2c]
	adds r4, #0x20
	adds r0, r7, #0
	adds r1, r4, #0
	bl ov14_021E6B48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E6CC8

	thumb_func_start ov14_021E6CF8
ov14_021E6CF8: @ 0x021E6CF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	str r2, [sp, #4]
	ldr r2, [r6, #0x34]
	str r1, [sp]
	ldr r0, [r2, #0xc]
	movs r1, #1
	str r0, [sp, #0x14]
	ldr r0, _021E6F38 @ =0x000040C4
	str r1, [r2, r0]
	movs r1, #0
	ldr r2, [sp, #0x14]
	adds r0, r1, #0
_021E6D14:
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r1, r1, #1
	adds r2, #0x20
	cmp r1, #7
	blo _021E6D14
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #4]
	adds r1, #0xec
	str r0, [r1]
	cmp r0, #0xff
	beq _021E6D40
	ldr r1, [sp]
	cmp r1, r0
	beq _021E6D40
	ldr r2, [sp, #4]
	adds r0, r6, #0
	bl ov14_021E690C
	cmp r0, #0
	bne _021E6D66
_021E6D40:
	ldr r0, [sp, #0x14]
	movs r1, #0xff
	adds r0, #0xe4
	str r1, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0xe8
	str r1, [r0]
	ldr r1, [sp]
	ldr r0, [sp, #0x14]
	str r1, [r0, #4]
	str r1, [r0, #8]
	movs r1, #1
	str r1, [r0, #0xc]
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	bl ov14_021E6B48
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6D66:
	ldr r1, [sp, #0x14]
	ldr r0, [sp]
	adds r1, #0xe4
	str r0, [r1]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #4]
	adds r1, #0xe8
	str r0, [r1]
	ldr r0, [r6, #8]
	bl FUN_02074640
	adds r7, r0, #0
	ldr r0, [sp, #4]
	movs r1, #0x80
	tst r0, r1
	beq _021E6E06
	ldr r0, [sp]
	cmp r0, #0x1e
	bhs _021E6DAE
	adds r1, r0, #0
	ldr r0, [sp, #0x14]
	str r1, [r0, #4]
	ldr r1, [sp, #4]
	str r1, [r0, #8]
	movs r1, #1
	str r1, [r0, #0xc]
	ldr r1, [sp, #0x14]
	adds r0, r6, #0
	bl ov14_021E6B48
	ldr r1, [r6, #0x34]
	ldr r0, _021E6F38 @ =0x000040C4
	movs r2, #0
	str r2, [r1, r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6DAE:
	str r0, [sp, #0x10]
	subs r0, #0x1e
	adds r5, r0, #1
	str r0, [sp, #0x10]
	cmp r5, #6
	bhs _021E6DE0
	ldr r0, [sp, #0x14]
	lsls r1, r5, #5
	adds r4, r0, r1
	movs r7, #1
_021E6DC2:
	adds r0, r5, #0
	adds r0, #0x1e
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0x1d
	str r0, [r4, #8]
	adds r0, r6, #0
	adds r1, r4, #0
	str r7, [r4, #0xc]
	bl ov14_021E6B48
	adds r5, r5, #1
	adds r4, #0x20
	cmp r5, #6
	blo _021E6DC2
_021E6DE0:
	ldr r0, [sp, #0x10]
	lsls r1, r0, #5
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, [sp]
	str r0, [r1, #4]
	ldr r0, [sp, #4]
	str r0, [r1, #8]
	movs r0, #1
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov14_021E6B48
	ldr r1, [r6, #0x34]
	ldr r0, _021E6F38 @ =0x000040C4
	movs r2, #0
	str r2, [r1, r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6E06:
	ldr r0, [sp]
	cmp r0, #0x1e
	bhs _021E6E44
	ldr r0, [sp, #4]
	cmp r0, #0x1e
	bhs _021E6E20
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	bl ov14_021E6CC8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6E20:
	subs r0, #0x1e
	cmp r0, r7
	bhs _021E6E34
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	bl ov14_021E6CC8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6E34:
	adds r7, #0x1e
	ldr r1, [sp]
	adds r0, r6, #0
	adds r2, r7, #0
	bl ov14_021E6CC8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6E44:
	ldr r0, [sp, #4]
	cmp r0, #0x1e
	bhs _021E6ED2
	ldr r1, [sp, #4]
	adds r0, r6, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021E6E68
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	bl ov14_021E6CC8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6E68:
	ldr r0, [sp]
	str r0, [sp, #8]
	subs r0, #0x1e
	adds r5, r0, #1
	str r0, [sp, #8]
	cmp r5, r7
	bhs _021E6E9C
	ldr r0, [sp, #0x14]
	lsls r1, r5, #5
	adds r4, r0, r1
_021E6E7C:
	adds r0, r5, #0
	adds r0, #0x1e
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0x1d
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov14_021E6B48
	adds r5, r5, #1
	adds r4, #0x20
	cmp r5, r7
	blo _021E6E7C
_021E6E9C:
	ldr r0, [sp, #8]
	lsls r1, r0, #5
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, [sp]
	str r0, [r1, #4]
	ldr r0, [sp, #4]
	str r0, [r1, #8]
	movs r0, #1
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov14_021E6B48
	lsls r1, r7, #5
	ldr r0, [sp, #0x14]
	adds r7, #0x1d
	adds r1, r0, r1
	ldr r0, [sp, #4]
	str r0, [r1, #4]
	str r7, [r1, #8]
	movs r0, #1
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov14_021E6B48
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6ED2:
	subs r0, #0x1e
	cmp r0, r7
	bhs _021E6EE6
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	bl ov14_021E6CC8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E6EE6:
	ldr r0, [sp]
	str r0, [sp, #0xc]
	subs r0, #0x1e
	adds r5, r0, #1
	str r0, [sp, #0xc]
	cmp r5, r7
	bhs _021E6F1A
	ldr r0, [sp, #0x14]
	lsls r1, r5, #5
	adds r4, r0, r1
_021E6EFA:
	adds r0, r5, #0
	adds r0, #0x1e
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0x1d
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov14_021E6B48
	adds r5, r5, #1
	adds r4, #0x20
	cmp r5, r7
	blo _021E6EFA
_021E6F1A:
	ldr r0, [sp, #0xc]
	adds r7, #0x1d
	lsls r1, r0, #5
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r0, [sp]
	str r0, [r1, #4]
	str r7, [r1, #8]
	movs r0, #1
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov14_021E6B48
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6F38: .4byte 0x000040C4
	thumb_func_end ov14_021E6CF8

	thumb_func_start ov14_021E6F3C
ov14_021E6F3C: @ 0x021E6F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	str r2, [sp, #4]
	ldr r2, [r6, #0x34]
	str r1, [sp]
	ldr r0, [r2, #0xc]
	movs r1, #1
	str r0, [sp, #0xc]
	ldr r0, _021E7030 @ =0x000040C4
	str r1, [r2, r0]
	movs r1, #0
	ldr r2, [sp, #0xc]
	adds r0, r1, #0
_021E6F58:
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r1, r1, #1
	adds r2, #0x20
	cmp r1, #7
	blo _021E6F58
	ldr r0, [sp, #4]
	cmp r0, #0xff
	beq _021E6F7A
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r6, #0
	bl ov14_021E6A3C
	cmp r0, #0
	bne _021E6FA0
_021E6F7A:
	ldr r0, [sp, #0xc]
	movs r1, #0xff
	adds r0, #0xe4
	str r1, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #0xe8
	str r1, [r0]
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	str r1, [r0, #4]
	str r1, [r0, #8]
	movs r1, #1
	str r1, [r0, #0xc]
	ldr r1, [sp, #0xc]
	adds r0, r6, #0
	bl ov14_021E6B48
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E6FA0:
	ldr r1, [sp, #0xc]
	ldr r0, [sp]
	adds r1, #0xe4
	str r0, [r1]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #4]
	adds r1, #0xe8
	str r0, [r1]
	ldr r0, [r6, #8]
	bl FUN_02074640
	adds r7, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #0x1e
	bhs _021E702C
	ldr r0, [sp]
	str r0, [sp, #8]
	subs r0, #0x1e
	adds r5, r0, #1
	str r0, [sp, #8]
	cmp r5, r7
	bhs _021E6FF2
	ldr r0, [sp, #0xc]
	lsls r1, r5, #5
	adds r4, r0, r1
_021E6FD2:
	adds r0, r5, #0
	adds r0, #0x1e
	str r0, [r4, #4]
	adds r0, r5, #0
	adds r0, #0x1d
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov14_021E6C0C
	adds r5, r5, #1
	adds r4, #0x20
	cmp r5, r7
	blo _021E6FD2
_021E6FF2:
	ldr r0, [sp, #8]
	lsls r1, r0, #5
	ldr r0, [sp, #0xc]
	adds r1, r0, r1
	ldr r0, [sp]
	str r0, [r1, #4]
	ldr r0, [sp, #4]
	str r0, [r1, #8]
	movs r0, #1
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov14_021E6C0C
	lsls r1, r7, #5
	ldr r0, [sp, #0xc]
	adds r7, #0x1d
	adds r1, r0, r1
	ldr r0, [sp, #4]
	str r0, [r1, #4]
	str r7, [r1, #8]
	movs r0, #1
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov14_021E6C0C
	ldr r1, [r6, #0x34]
	ldr r0, _021E7030 @ =0x000040C4
	movs r2, #0
	str r2, [r1, r0]
_021E702C:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7030: .4byte 0x000040C4
	thumb_func_end ov14_021E6F3C

	thumb_func_start ov14_021E7034
ov14_021E7034: @ 0x021E7034
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r2, #0
	ldr r2, [r5, #0x34]
	ldr r0, _021E70AC @ =0x000040C4
	adds r6, r1, #0
	ldr r4, [r2, #0xc]
	movs r1, #1
	str r1, [r2, r0]
	movs r0, #0
	adds r1, r4, #0
	adds r3, r0, #0
_021E704C:
	str r3, [r1, #4]
	str r3, [r1, #8]
	str r3, [r1, #0xc]
	adds r0, r0, #1
	adds r1, #0x20
	cmp r0, #7
	blo _021E704C
	cmp r7, #0xff
	beq _021E706C
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0xac
	bl ov14_021E6070
	cmp r0, #0
	beq _021E708C
_021E706C:
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0xe4
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0xe8
	str r1, [r0]
	str r6, [r4, #4]
	str r6, [r4, #8]
	movs r0, #1
	str r0, [r4, #0xc]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E6B48
	pop {r3, r4, r5, r6, r7, pc}
_021E708C:
	adds r0, r4, #0
	adds r0, #0xe4
	str r6, [r0]
	adds r4, #0xe8
	str r7, [r4]
	ldr r0, [r5, #8]
	bl FUN_02074640
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, #0x1e
	bl ov14_021E6CC8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E70AC: .4byte 0x000040C4
	thumb_func_end ov14_021E7034

	thumb_func_start ov14_021E70B0
ov14_021E70B0: @ 0x021E70B0
	push {r3, r4}
	ldr r0, [r0, #0x34]
	movs r3, #0
	ldr r2, [r0, #0xc]
	adds r4, r2, #0
_021E70BA:
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _021E70D0
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _021E70D0
	lsls r0, r3, #5
	adds r0, r2, r0
	ldr r0, [r0, #8]
	pop {r3, r4}
	bx lr
_021E70D0:
	adds r3, r3, #1
	adds r4, #0x20
	cmp r3, #7
	blo _021E70BA
	movs r0, #0xff
	pop {r3, r4}
	bx lr
	.align 2, 0
	thumb_func_end ov14_021E70B0

	thumb_func_start ov14_021E70E0
ov14_021E70E0: @ 0x021E70E0
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	str r1, [sp]
	ldr r7, [r0, #0xc]
	subs r1, #0x1e
	movs r2, #0
	str r1, [sp]
	adds r3, r7, #0
	adds r1, r2, #0
_021E70F4:
	adds r0, r2, #0
	adds r0, #0x1e
	str r0, [r3, #4]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	adds r2, r2, #1
	adds r3, #0x20
	cmp r2, #6
	blo _021E70F4
	lsls r0, r2, #5
	adds r0, r7, r0
	str r1, [r0, #0xc]
	ldr r0, [sp]
	adds r5, r0, #1
	cmp r5, #6
	bhs _021E7132
	lsls r0, r5, #5
	adds r4, r7, r0
_021E7118:
	adds r0, r5, #0
	adds r0, #0x1d
	str r0, [r4, #8]
	movs r0, #1
	str r0, [r4, #0xc]
	adds r0, r6, #0
	adds r1, r4, #0
	bl ov14_021E6B48
	adds r5, r5, #1
	adds r4, #0x20
	cmp r5, #6
	blo _021E7118
_021E7132:
	ldr r0, [sp]
	lsls r1, r0, #5
	movs r0, #0x23
	adds r1, r7, r1
	str r0, [r1, #8]
	movs r0, #1
	str r0, [r1, #0xc]
	adds r0, r6, #0
	bl ov14_021E6B48
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021E70E0

	thumb_func_start ov14_021E7148
ov14_021E7148: @ 0x021E7148
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r1, #0
	ldr r7, _021E71C0 @ =0x00004094
	adds r5, r0, #0
	movs r2, #0
	adds r3, r4, #0
	add r6, sp, #0
_021E7158:
	ldr r0, [r3, #0xc]
	cmp r0, #0
	beq _021E7168
	ldr r1, [r5, #0x34]
	ldr r0, [r3, #4]
	adds r0, r1, r0
	ldrb r0, [r0, r7]
	strb r0, [r6]
_021E7168:
	adds r2, r2, #1
	adds r3, #0x20
	adds r6, r6, #1
	cmp r2, #7
	blo _021E7158
	movs r7, #0
	add r6, sp, #0
_021E7176:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _021E71B2
	ldr r1, [r4, #8]
	movs r0, #0x80
	tst r0, r1
	bne _021E719A
	ldr r2, [r5, #0x34]
	ldrb r0, [r6]
	adds r2, r2, r1
	ldr r1, _021E71C0 @ =0x00004094
	strb r0, [r2, r1]
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #8]
	movs r2, #1
	bl ov14_021F3190
	b _021E71B2
_021E719A:
	ldr r0, [r4, #4]
	cmp r0, #0x1e
	blo _021E71A8
	ldrb r2, [r6]
	ldr r1, [r5, #0x34]
	ldr r0, _021E71C4 @ =0x000040B7
	strb r2, [r1, r0]
_021E71A8:
	ldr r0, [r5, #0x34]
	ldr r1, [r4, #4]
	movs r2, #1
	bl ov14_021F3190
_021E71B2:
	adds r7, r7, #1
	adds r4, #0x20
	adds r6, r6, #1
	cmp r7, #7
	blo _021E7176
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E71C0: .4byte 0x00004094
_021E71C4: .4byte 0x000040B7
	thumb_func_end ov14_021E7148

	thumb_func_start ov14_021E71C8
ov14_021E71C8: @ 0x021E71C8
	ldr r3, _021E71E4 @ =0x021F7BC0
	movs r2, #0
_021E71CC:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021E71D6
	adds r0, r2, #0
	bx lr
_021E71D6:
	adds r2, r2, #1
	adds r3, r3, #2
	cmp r2, #4
	blo _021E71CC
	movs r0, #0
	mvns r0, r0
	bx lr
	.align 2, 0
_021E71E4: .4byte 0x021F7BC0
	thumb_func_end ov14_021E71C8

	thumb_func_start ov14_021E71E8
ov14_021E71E8: @ 0x021E71E8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0xa
	movs r1, #0xc
	bl FUN_0201AACC
	ldr r2, [r4, #0x34]
	ldr r1, _021E725C @ =0x000088DC
	str r0, [r2, r1]
	ldr r0, [r4, #0x34]
	ldr r6, [r0, r1]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r0, r1
	ldr r1, _021E7260 @ =0x00004094
	ldrb r1, [r2, r1]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [r6]
	movs r0, #0
	strh r0, [r6, #4]
	strb r0, [r6, #6]
	adds r0, r4, #0
	ldrb r1, [r4, #0x1f]
	adds r4, #0x21
	ldrb r2, [r4]
	bl ov14_021E60C0
	movs r5, #0
	adds r4, r0, #0
	subs r7, r5, #1
_021E722E:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x36
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ov14_021E71C8
	cmp r0, r7
	beq _021E7254
	ldrb r2, [r6, #6]
	movs r1, #1
	lsls r1, r0
	adds r0, r2, #0
	orrs r0, r1
	strb r0, [r6, #6]
	pop {r3, r4, r5, r6, r7, pc}
_021E7254:
	adds r5, r5, #1
	cmp r5, #4
	blo _021E722E
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E725C: .4byte 0x000088DC
_021E7260: .4byte 0x00004094
	thumb_func_end ov14_021E71E8

	thumb_func_start ov14_021E7264
ov14_021E7264: @ 0x021E7264
	ldr r1, [r0, #0x34]
	ldr r0, _021E7270 @ =0x000088DC
	ldr r3, _021E7274 @ =FUN_0201AB0C
	ldr r0, [r1, r0]
	bx r3
	nop
_021E7270: .4byte 0x000088DC
_021E7274: .4byte FUN_0201AB0C
	thumb_func_end ov14_021E7264

	thumb_func_start ov14_021E7278
ov14_021E7278: @ 0x021E7278
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, _021E7350 @ =0x000088DC
	ldr r4, [r1, r0]
	ldr r0, _021E7354 @ =0x00000222
	ldrh r5, [r4, #4]
	cmp r5, r0
	bne _021E728E
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E728E:
	movs r0, #0
	str r0, [sp]
_021E7292:
	movs r0, #0x87
	lsls r0, r0, #2
	cmp r5, r0
	bhs _021E72CE
	adds r0, r5, #0
	movs r1, #0x1e
	blx FUN_020F2998
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #0x1e
	blx FUN_020F2998
	ldrb r0, [r7, #0x1f]
	adds r2, r1, #0
	cmp r6, r0
	bne _021E72C2
	adds r0, r7, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r2, r0
	bne _021E72C2
	movs r6, #0
	b _021E72EA
_021E72C2:
	adds r0, r7, #0
	adds r1, r6, #0
	bl ov14_021E60C0
	adds r6, r0, #0
	b _021E72EA
_021E72CE:
	subs r2, r5, r0
	adds r0, r7, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	cmp r2, r0
	bne _021E72E0
	movs r6, #0
	b _021E72EA
_021E72E0:
	adds r0, r7, #0
	movs r1, #0xff
	bl ov14_021E60C0
	adds r6, r0, #0
_021E72EA:
	cmp r6, #0
	beq _021E732E
	adds r0, r6, #0
	movs r1, #0xac
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _021E732E
	movs r5, #0
_021E72FE:
	adds r1, r5, #0
	adds r0, r6, #0
	adds r1, #0x36
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl ov14_021E71C8
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E7328
	movs r1, #1
	lsls r1, r0
	movs r0, #0xff
	ldrb r2, [r4, #6]
	eors r0, r1
	ands r0, r2
	strb r0, [r4, #6]
_021E7328:
	adds r5, r5, #1
	cmp r5, #4
	blo _021E72FE
_021E732E:
	ldrh r0, [r4, #4]
	adds r0, r0, #1
	strh r0, [r4, #4]
	ldrh r5, [r4, #4]
	ldr r0, _021E7354 @ =0x00000222
	cmp r5, r0
	bne _021E7340
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7340:
	ldr r0, [sp]
	adds r0, r0, #1
	str r0, [sp]
	cmp r0, #0xf
	blo _021E7292
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7350: .4byte 0x000088DC
_021E7354: .4byte 0x00000222
	thumb_func_end ov14_021E7278

	thumb_func_start ov14_021E7358
ov14_021E7358: @ 0x021E7358
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0xac
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _021E7460
	movs r0, #0xa
	movs r1, #0x1c
	bl FUN_0201AA8C
	adds r6, r0, #0
	str r7, [r6]
	adds r0, r7, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r6, #4]
	adds r0, r7, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E640
	movs r1, #0
	strh r0, [r6, #6]
	adds r0, r7, #0
	adds r2, r1, #0
	bl FUN_0206E640
	str r0, [r6, #8]
	adds r0, r7, #0
	movs r1, #0xb1
	movs r2, #0
	bl FUN_0206E640
	strb r0, [r6, #0xc]
	adds r0, r7, #0
	movs r1, #0xb2
	movs r2, #0
	bl FUN_0206E640
	strb r0, [r6, #0xd]
	adds r0, r7, #0
	movs r1, #0xa
	movs r2, #0
	bl FUN_0206E640
	strb r0, [r6, #0xe]
	adds r0, r7, #0
	bl FUN_0206FE04
	strb r0, [r6, #0xf]
	adds r0, r7, #0
	movs r1, #0xb
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r6, #0x10]
	adds r0, r7, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E640
	ldrb r1, [r6, #0x12]
	movs r2, #0x7f
	lsls r0, r0, #0x18
	bics r1, r2
	lsrs r2, r0, #0x18
	movs r0, #0x7f
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #0x12]
	adds r0, r7, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r0, r0, #0x1f
	ldrb r1, [r6, #0x12]
	movs r2, #0x80
	lsrs r0, r0, #0x18
	bics r1, r2
	orrs r0, r1
	strb r0, [r6, #0x12]
	adds r0, r7, #0
	bl FUN_0206FF90
	adds r2, r6, #0
	ldrb r1, [r6, #0x13]
	movs r3, #0x7f
	adds r2, #0x13
	bics r1, r3
	movs r3, #0x7f
	ands r0, r3
	orrs r0, r1
	strb r0, [r6, #0x13]
	ldrh r0, [r6, #4]
	cmp r0, #0x1d
	beq _021E743C
	cmp r0, #0x20
	beq _021E743C
	ldrb r0, [r6, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021E743C
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
	b _021E7444
_021E743C:
	ldrb r1, [r6, #0x13]
	movs r0, #0x80
	bics r1, r0
	strb r1, [r6, #0x13]
_021E7444:
	movs r4, #0
	adds r5, r6, #0
_021E7448:
	adds r1, r4, #0
	adds r0, r7, #0
	adds r1, #0x36
	movs r2, #0
	bl FUN_0206E640
	strh r0, [r5, #0x14]
	adds r4, r4, #1
	adds r5, r5, #2
	cmp r4, #4
	blo _021E7448
	b _021E7462
_021E7460:
	movs r6, #0
_021E7462:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E7358

	thumb_func_start ov14_021E7468
ov14_021E7468: @ 0x021E7468
	ldr r3, _021E746C @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_021E746C: .4byte FUN_0201AB0C
	thumb_func_end ov14_021E7468

	thumb_func_start ov14_021E7470
ov14_021E7470: @ 0x021E7470
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	bl ov14_021F5404
	movs r7, #0x2f
	adds r6, r0, #0
	movs r4, #0
	lsls r7, r7, #4
_021E7482:
	ldr r2, [r5, #0x34]
	adds r3, r6, r4
	ldr r0, [r2, r7]
	adds r2, #0x30
	lsls r3, r3, #4
	movs r1, #0x10
	adds r2, r2, r3
	bl FUN_02019A60
	adds r4, r4, #1
	cmp r4, #4
	blo _021E7482
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88A4
	ldr r1, [sp]
	adds r0, r5, #0
	movs r2, #2
	bl ov14_021F36DC
	ldr r0, [r5, #0x34]
	ldr r1, _021E74EC @ =0x000088D0
	movs r2, #1
	ldrh r1, [r0, r1]
	eors r1, r2
	adds r1, r1, #2
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	ldr r1, _021E74EC @ =0x000088D0
	movs r2, #0
	ldrh r1, [r0, r1]
	adds r1, r1, #2
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	ldr r1, [sp]
	bl ov14_021F3D70
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov14_021F5368
	ldr r1, [sp]
	adds r0, r5, #0
	ldrh r1, [r1, #0x10]
	bl ov14_021E895C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E74EC: .4byte 0x000088D0
	thumb_func_end ov14_021E7470

	thumb_func_start ov14_021E74F0
ov14_021E74F0: @ 0x021E74F0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldrh r1, [r4, #6]
	adds r5, r0, #0
	cmp r1, #0
	beq _021E7534
	bl ov14_021F5564
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r2, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	adds r2, #0x30
	lsls r3, r6, #4
	movs r1, #0x10
	adds r2, r2, r3
	bl FUN_02019A60
	movs r0, #0x2f
	adds r3, r6, #1
	ldr r2, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	adds r2, #0x30
	lsls r3, r3, #4
	movs r1, #0x10
	adds r2, r2, r3
	bl FUN_02019A60
	ldrh r1, [r4, #6]
	ldr r0, [r5, #0x34]
	bl ov14_021F38B0
_021E7534:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8944
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #2
	bl ov14_021F36DC
	ldr r0, [r5, #0x34]
	ldr r1, _021E7584 @ =0x000088D0
	movs r2, #1
	ldrh r1, [r0, r1]
	eors r1, r2
	adds r1, r1, #2
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	ldr r1, _021E7584 @ =0x000088D0
	movs r2, #0
	ldrh r1, [r0, r1]
	adds r1, r1, #2
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	bl ov14_021F3D70
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F5368
	ldrh r1, [r4, #0x10]
	adds r0, r5, #0
	bl ov14_021E895C
	pop {r4, r5, r6, pc}
	nop
_021E7584: .4byte 0x000088D0
	thumb_func_end ov14_021E74F0

	thumb_func_start ov14_021E7588
ov14_021E7588: @ 0x021E7588
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r2, r1, #0
	ldrb r1, [r5, #0x1f]
	bl ov14_021E60C0
	adds r4, r0, #0
	beq _021E75E6
	bl FUN_0206DDD8
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov14_021E7358
	adds r6, r0, #0
	beq _021E75CA
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021E75BA
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E74F0
	b _021E75C2
_021E75BA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E7470
_021E75C2:
	adds r0, r6, #0
	bl ov14_021E7468
	b _021E75DC
_021E75CA:
	adds r0, r5, #0
	bl ov14_021E765C
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0206DE00
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E75DC:
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0206DE00
	b _021E75F0
_021E75E6:
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E75F0:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021E7588

	thumb_func_start ov14_021E75F4
ov14_021E75F4: @ 0x021E75F4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r2, r1, #0
	ldrb r1, [r5, #0x1f]
	bl ov14_021E60C0
	adds r4, r0, #0
	bl FUN_0206DDD8
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov14_021E7358
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #2
	bl ov14_021F36DC
	ldr r0, [r5, #0x34]
	ldr r1, _021E7658 @ =0x000088D0
	movs r2, #1
	ldrh r1, [r0, r1]
	eors r1, r2
	adds r1, r1, #2
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	ldr r1, _021E7658 @ =0x000088D0
	movs r2, #0
	ldrh r1, [r0, r1]
	adds r1, r1, #2
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	bl ov14_021F3D70
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F5368
	adds r0, r6, #0
	bl ov14_021E7468
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_0206DE00
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E7658: .4byte 0x000088D0
	thumb_func_end ov14_021E75F4

	thumb_func_start ov14_021E765C
ov14_021E765C: @ 0x021E765C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #2
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #3
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0xd
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0xe
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	bl ov14_021F53C0
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021E895C
	ldr r0, [r4]
	ldr r1, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021E76AC
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8944
	pop {r4, pc}
_021E76AC:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88A4
	pop {r4, pc}
	thumb_func_end ov14_021E765C

	thumb_func_start ov14_021E76B8
ov14_021E76B8: @ 0x021E76B8
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E765C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	movs r0, #0xff
	adds r4, #0x21
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end ov14_021E76B8

	thumb_func_start ov14_021E76D0
ov14_021E76D0: @ 0x021E76D0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0xa
	adds r4, r3, #0
	str r0, [sp]
	movs r0, #0x13
	adds r1, #0x10
	movs r2, #1
	add r3, sp, #4
	bl FUN_020079BC
	ldr r3, [sp, #4]
	adds r6, r0, #0
	str r4, [sp]
	ldr r0, [r5, #0x34]
	ldr r2, [r3, #0x14]
	ldr r0, [r0, #0x14]
	ldr r3, [r3, #0x10]
	movs r1, #3
	bl FUN_0201C0C0
	movs r0, #3
	str r0, [sp]
	ldr r1, [sp, #4]
	adds r4, #0x15
	ldr r2, [r1, #0x14]
	movs r1, #0x2a
	lsls r1, r1, #4
	adds r1, r2, r1
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0x15
	bl ov14_021F5718
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021E76D0

	thumb_func_start ov14_021E7720
ov14_021E7720: @ 0x021E7720
	push {r3, lr}
	sub sp, #8
	movs r0, #0x20
	adds r3, r2, #0
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #0x13
	adds r1, #0x28
	movs r2, #0
	lsls r3, r3, #5
	bl FUN_02007938
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E7720

	thumb_func_start ov14_021E7740
ov14_021E7740: @ 0x021E7740
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x10]
	movs r0, #0xa
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0xf
	movs r2, #1
	add r3, sp, #0x30
	bl FUN_020079D8
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x24]
	adds r0, #0xc
	str r0, [sp, #0x24]
	movs r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x48]
	lsls r0, r0, #0xc
	str r0, [sp, #0x1c]
_021E776E:
	ldr r0, [sp, #0x20]
	movs r1, #0x15
	muls r1, r0, r1
	ldr r0, [sp, #0x24]
	lsls r1, r1, #1
	adds r6, r0, r1
	ldr r0, [sp, #0x20]
	ldr r4, [sp, #0x14]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	movs r5, #0
	lsrs r7, r0, #0x18
_021E7786:
	lsls r0, r5, #1
	ldrh r1, [r6, r0]
	ldr r0, _021E7800 @ =0x00000FFF
	lsls r3, r4, #0x18
	ands r1, r0
	ldr r0, [sp, #0x1c]
	add r2, sp, #0x2c
	adds r1, r0, r1
	ldr r0, [sp, #0x18]
	lsrs r3, r3, #0x18
	adds r1, r0, r1
	add r0, sp, #0x2c
	strh r1, [r0]
	str r7, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	movs r1, #3
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0x14]
	bl FUN_0201C4C4
	adds r4, r4, #1
	cmp r4, #0x40
	blo _021E77BC
	movs r4, #0
_021E77BC:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x15
	blo _021E7786
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	cmp r0, #0x14
	blo _021E776E
	ldr r0, [sp, #0x28]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x14
	str r0, [sp, #8]
	movs r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	lsls r3, r4, #0x18
	ldr r0, [r0, #0x34]
	ldr r2, _021E7804 @ =0x00001001
	ldr r0, [r0, #0x14]
	movs r1, #3
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E7800: .4byte 0x00000FFF
_021E7804: .4byte 0x00001001
	thumb_func_end ov14_021E7740

	thumb_func_start ov14_021E7808
ov14_021E7808: @ 0x021E7808
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl ov14_021E76D0
	ldr r2, [sp, #0x18]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E7720
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	str r0, [sp]
	adds r0, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov14_021E7740
	ldr r0, [r5, #0x34]
	movs r1, #3
	ldr r0, [r0, #0x14]
	bl FUN_0201EFBC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021E7808

	thumb_func_start ov14_021E783C
ov14_021E783C: @ 0x021E783C
	push {r3, r4, r5, r6, r7, lr}
	cmp r2, #0
	bne _021E785A
	ldr r4, [r0, #0x34]
	ldr r2, _021E78A4 @ =0x00000448
	ldrsb r3, [r4, r2]
	subs r3, #0x17
	strb r3, [r4, r2]
	ldr r4, [r0, #0x34]
	ldrsb r3, [r4, r2]
	cmp r3, #0
	bge _021E7874
	adds r3, #0x40
	strb r3, [r4, r2]
	b _021E7874
_021E785A:
	cmp r2, #1
	bne _021E7874
	ldr r4, [r0, #0x34]
	ldr r2, _021E78A4 @ =0x00000448
	ldrsb r3, [r4, r2]
	adds r3, #0x17
	strb r3, [r4, r2]
	ldr r4, [r0, #0x34]
	ldrsb r3, [r4, r2]
	cmp r3, #0x40
	blt _021E7874
	subs r3, #0x40
	strb r3, [r4, r2]
_021E7874:
	ldr r6, [r0, #0x34]
	ldr r2, _021E78A8 @ =0x00000449
	ldrb r2, [r6, r2]
	cmp r2, #0
	bne _021E7886
	movs r3, #0x97
	lsls r3, r3, #2
	movs r5, #0xe
	b _021E788A
_021E7886:
	movs r3, #0xb8
	movs r5, #0xf
_021E788A:
	ldr r7, _021E78A8 @ =0x00000449
	movs r2, #1
	ldrb r4, [r6, r7]
	eors r2, r4
	strb r2, [r6, r7]
	str r5, [sp]
	ldr r4, [r0, #0x34]
	subs r2, r7, #1
	ldrsb r2, [r4, r2]
	bl ov14_021E7808
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E78A4: .4byte 0x00000448
_021E78A8: .4byte 0x00000449
	thumb_func_end ov14_021E783C

	thumb_func_start ov14_021E78AC
ov14_021E78AC: @ 0x021E78AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r0, [r5, #0x34]
	ldr r1, _021E7928 @ =0x00000449
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021E78C6
	movs r6, #0x97
	lsls r6, r6, #2
	movs r4, #0xe
	b _021E78CA
_021E78C6:
	movs r6, #0xb8
	movs r4, #0xf
_021E78CA:
	ldr r1, _021E7928 @ =0x00000449
	ldr r3, _021E7928 @ =0x00000449
	ldrb r2, [r0, r1]
	movs r1, #1
	subs r3, r3, #1
	eors r2, r1
	ldr r1, _021E7928 @ =0x00000449
	strb r2, [r0, r1]
	ldr r2, [r5, #0x34]
	adds r0, r5, #0
	ldrsb r2, [r2, r3]
	adds r1, r7, #0
	adds r3, r6, #0
	bl ov14_021E76D0
	movs r0, #0
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	lsls r0, r4, #0x14
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r5, #0x34]
	adds r2, r7, #0
	ldr r0, [r0, #0x18]
	movs r1, #0x13
	adds r2, #0x28
	movs r3, #0xa
	bl FUN_02003200
	str r4, [sp]
	ldr r3, [r5, #0x34]
	ldr r2, _021E792C @ =0x00000448
	adds r0, r5, #0
	ldrsb r2, [r3, r2]
	adds r1, r7, #0
	adds r3, r6, #0
	bl ov14_021E7740
	ldr r0, [r5, #0x34]
	movs r1, #3
	ldr r0, [r0, #0x14]
	bl FUN_0201EFBC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E7928: .4byte 0x00000449
_021E792C: .4byte 0x00000448
	thumb_func_end ov14_021E78AC

	thumb_func_start ov14_021E7930
ov14_021E7930: @ 0x021E7930
	push {r3, lr}
	ldr r0, [r0, #4]
	bl FUN_02073E98
	cmp r0, #0x10
	blo _021E793E
	subs r0, #0x10
_021E793E:
	pop {r3, pc}
	thumb_func_end ov14_021E7930

	thumb_func_start ov14_021E7940
ov14_021E7940: @ 0x021E7940
	ldrb r3, [r2]
	cmp r0, r3
	blt _021E795C
	ldrb r3, [r2, #1]
	cmp r0, r3
	bgt _021E795C
	ldrb r0, [r2, #2]
	cmp r1, r0
	blt _021E795C
	ldrb r0, [r2, #3]
	cmp r1, r0
	bge _021E795C
	movs r0, #1
	bx lr
_021E795C:
	movs r0, #0
	bx lr
	thumb_func_end ov14_021E7940

	thumb_func_start ov14_021E7960
ov14_021E7960: @ 0x021E7960
	push {r3, r4, r5, lr}
	ldr r2, _021E79A8 @ =_021F7BBC
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov14_021E7940
	cmp r0, #1
	bne _021E79A4
	cmp r5, #0xc
	bge _021E7978
	movs r5, #0
	b _021E798E
_021E7978:
	cmp r5, #0x9c
	blt _021E7980
	movs r5, #5
	b _021E798E
_021E7980:
	subs r5, #0xc
	adds r0, r5, #0
	movs r1, #0x18
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
_021E798E:
	subs r4, #0x28
	adds r0, r4, #0
	movs r1, #0x18
	blx FUN_020F2998
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #6
	muls r0, r1, r0
	adds r0, r5, r0
	pop {r3, r4, r5, pc}
_021E79A4:
	movs r0, #0xff
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E79A8: .4byte _021F7BBC
	thumb_func_end ov14_021E7960

	thumb_func_start ov14_021E79AC
ov14_021E79AC: @ 0x021E79AC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r4, #0
_021E79B6:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov14_021E7940
	cmp r0, #1
	bne _021E79CA
	adds r4, #0x1e
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E79CA:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _021E79B6
	movs r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E79AC

	thumb_func_start ov14_021E79D8
ov14_021E79D8: @ 0x021E79D8
	push {r3, r4, r5, r6, r7, lr}
	ldr r5, _021E7A04 @ =0x021F7BD8
	adds r6, r0, #0
	adds r7, r1, #0
	movs r4, #0
_021E79E2:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl ov14_021E7940
	cmp r0, #1
	bne _021E79F6
	adds r4, #0x80
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E79F6:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #6
	blo _021E79E2
	movs r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7A04: .4byte 0x021F7BD8
	thumb_func_end ov14_021E79D8

	thumb_func_start ov14_021E7A08
ov14_021E7A08: @ 0x021E7A08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	ldr r1, [r0, #0x34]
	movs r0, #0xca
	lsls r0, r0, #2
	adds r5, r2, #0
	ldr r4, [r1, #0xc]
	ldr r0, [r1, r0]
	add r1, sp, #4
	adds r1, #2
	add r2, sp, #4
	adds r6, r3, #0
	bl FUN_0200DE44
	add r1, sp, #0
	adds r0, r5, #0
	adds r1, #2
	add r2, sp, #0
	adds r3, r6, #0
	bl ov14_021F2F88
	ldr r0, [sp, #0x20]
	add r1, sp, #0
	cmp r0, #1
	bne _021E7A4C
	movs r0, #2
	ldrsh r0, [r1, r0]
	adds r0, #8
	strh r0, [r1, #2]
	movs r0, #0
	ldrsh r0, [r1, r0]
	adds r0, #8
	b _021E7A52
_021E7A4C:
	movs r0, #0
	ldrsh r0, [r1, r0]
	adds r0, r0, #4
_021E7A52:
	strh r0, [r1]
	strh r5, [r4]
	strh r7, [r4, #2]
	ldr r2, [r4, #0x18]
	movs r0, #3
	ands r0, r2
	str r0, [r4, #0x18]
	str r6, [r4, #4]
	add r3, sp, #0
	movs r0, #2
	movs r2, #6
	adds r1, r4, #0
	ldrsh r0, [r3, r0]
	ldrsh r2, [r3, r2]
	adds r1, #0x18
	cmp r2, r0
	ldr r5, [r1]
	ble _021E7A84
	movs r3, #1
	bics r5, r3
	movs r3, #1
	orrs r3, r5
	str r3, [r1]
	subs r0, r2, r0
	b _021E7A8C
_021E7A84:
	movs r3, #1
	bics r5, r3
	str r5, [r1]
	subs r0, r0, r2
_021E7A8C:
	lsls r1, r0, #8
	asrs r0, r1, #2
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	asrs r0, r0, #3
	str r0, [r4, #0x10]
	add r3, sp, #0
	movs r0, #0
	movs r1, #4
	ldrsh r0, [r3, r0]
	ldrsh r1, [r3, r1]
	cmp r1, r0
	ldr r5, [r4, #0x18]
	ble _021E7AB2
	movs r3, #2
	orrs r3, r5
	str r3, [r4, #0x18]
	subs r0, r1, r0
	b _021E7ABA
_021E7AB2:
	movs r3, #2
	bics r5, r3
	str r5, [r4, #0x18]
	subs r0, r0, r1
_021E7ABA:
	lsls r3, r0, #8
	asrs r0, r3, #2
	lsrs r0, r0, #0x1d
	adds r0, r3, r0
	asrs r0, r0, #3
	str r0, [r4, #0x14]
	lsls r0, r2, #8
	str r0, [r4, #8]
	lsls r0, r1, #8
	str r0, [r4, #0xc]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E7A08

	thumb_func_start ov14_021E7AD4
ov14_021E7AD4: @ 0x021E7AD4
	push {r3, r4, lr}
	sub sp, #4
	movs r4, #1
	str r4, [sp]
	bl ov14_021E7A08
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E7AD4

	thumb_func_start ov14_021E7AE4
ov14_021E7AE4: @ 0x021E7AE4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r1, #0
	movs r1, #0
	str r1, [sp]
	adds r3, r2, #0
	ldr r2, [r0, #0x34]
	ldr r1, _021E7B00 @ =0x0000044C
	ldrb r1, [r2, r1]
	adds r2, r4, #0
	bl ov14_021E7A08
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E7B00: .4byte 0x0000044C
	thumb_func_end ov14_021E7AE4

	thumb_func_start ov14_021E7B04
ov14_021E7B04: @ 0x021E7B04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r4, [r0, #0xc]
	ldr r2, [r4, #0x18]
	lsrs r3, r2, #2
	cmp r3, #8
	bne _021E7B32
	cmp r1, #1
	ldrh r1, [r4]
	bne _021E7B22
	ldr r2, [r4, #4]
	bl ov14_021F396C
	b _021E7B28
_021E7B22:
	ldr r2, [r4, #4]
	bl ov14_021F39A0
_021E7B28:
	ldr r0, [r5, #0x34]
	bl ov14_021F3B5C
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7B32:
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	ldr r1, [r4, #8]
	bne _021E7B40
	ldr r0, [r4, #0x10]
	adds r0, r1, r0
	b _021E7B44
_021E7B40:
	ldr r0, [r4, #0x10]
	subs r0, r1, r0
_021E7B44:
	str r0, [r4, #8]
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0xc]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E7B56
	ldr r0, [r4, #0x14]
	adds r0, r1, r0
	b _021E7B5A
_021E7B56:
	ldr r0, [r4, #0x14]
	subs r0, r1, r0
_021E7B5A:
	str r0, [r4, #0xc]
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	lsls r1, r1, #8
	lsls r2, r2, #8
	ldr r0, [r5, #0x34]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov14_021F395C
	ldr r0, [r5, #0x34]
	bl ov14_021F3B5C
	ldr r1, [r4, #0x18]
	movs r0, #3
	adds r2, r1, #0
	ands r2, r0
	lsrs r0, r1, #2
	adds r0, r0, #1
	lsls r0, r0, #2
	orrs r0, r2
	str r0, [r4, #0x18]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E7B04

	thumb_func_start ov14_021E7B8C
ov14_021E7B8C: @ 0x021E7B8C
	ldr r3, _021E7B94 @ =ov14_021E7B04
	movs r1, #1
	bx r3
	nop
_021E7B94: .4byte ov14_021E7B04
	thumb_func_end ov14_021E7B8C

	thumb_func_start ov14_021E7B98
ov14_021E7B98: @ 0x021E7B98
	ldr r3, _021E7BA0 @ =ov14_021E7B04
	movs r1, #0
	bx r3
	nop
_021E7BA0: .4byte ov14_021E7B04
	thumb_func_end ov14_021E7B98

	thumb_func_start ov14_021E7BA4
ov14_021E7BA4: @ 0x021E7BA4
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #2
	ldr r0, [r0, #0x14]
	movs r2, #0x11
	movs r3, #0xa
	bl FUN_0201956C
	movs r1, #0x2f
	ldr r2, [r4, #0x34]
	lsls r1, r1, #4
	str r0, [r2, r1]
	movs r0, #7
	str r0, [sp]
	ldr r0, [r4, #0x34]
	movs r2, #1
	ldr r0, [r0, r1]
	movs r1, #0xd
	movs r3, #0x20
	bl FUN_020195F4
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	adds r2, r1, #0
	movs r3, #0xb
	bl FUN_020195F4
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	movs r2, #0
	movs r3, #0xb
	bl FUN_020195F4
	movs r0, #6
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xc
	movs r2, #0
	movs r3, #0xb
	bl FUN_020195F4
	ldr r0, [r4, #0x34]
	bl ov14_021F6244
	ldr r0, [r4, #0x34]
	bl ov14_021F62CC
	ldr r0, [r4, #0x34]
	bl ov14_021F62E4
	ldr r0, [r4, #0x34]
	bl ov14_021F62FC
	adds r0, r4, #0
	bl ov14_021F6314
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _021E7C62
	movs r0, #7
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	adds r2, r1, #0
	movs r3, #0x20
	bl FUN_020195F4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	movs r2, #0xc
	bl ov14_021E7D8C
	b _021E7C88
_021E7C62:
	movs r0, #6
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	movs r2, #1
	movs r3, #0x20
	bl FUN_020195F4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	movs r2, #0xb
	bl ov14_021E7D8C
_021E7C88:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xd
	adds r2, r1, #0
	bl ov14_021E7D8C
	ldr r0, [r4]
	ldr r1, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #1
	bhi _021E7CB2
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	movs r2, #9
	bl ov14_021E7D8C
	b _021E7CC4
_021E7CB2:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov14_021E81A8
	ldr r0, [r4, #0x34]
	bl ov14_021F63F0
_021E7CC4:
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021E7D06
	movs r0, #9
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	movs r2, #6
	movs r3, #0x20
	bl FUN_020195F4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x18
	bl FUN_020196E8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	movs r2, #0x55
	bl ov14_021E7D8C
	b _021E7D3E
_021E7D06:
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	movs r2, #6
	movs r3, #0xc
	bl FUN_020195F4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	movs r2, #0x20
	movs r3, #0xc
	bl FUN_020196E8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0x10
	movs r2, #0x56
	bl ov14_021E7D8C
_021E7D3E:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	movs r2, #0xa
	bl ov14_021E7D8C
	ldr r0, [r4, #0x34]
	bl ov14_021F63C8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8394
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85AC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8600
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E7BA4

	thumb_func_start ov14_021E7D7C
ov14_021E7D7C: @ 0x021E7D7C
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r3, _021E7D88 @ =FUN_020195C0
	ldr r0, [r0, r1]
	bx r3
	nop
_021E7D88: .4byte FUN_020195C0
	thumb_func_end ov14_021E7D7C

	thumb_func_start ov14_021E7D8C
ov14_021E7D8C: @ 0x021E7D8C
	push {r3, lr}
	adds r3, r2, #0
	movs r2, #1
	str r2, [sp]
	movs r2, #0x13
	bl FUN_02019688
	pop {r3, pc}
	thumb_func_end ov14_021E7D8C

	thumb_func_start ov14_021E7D9C
ov14_021E7D9C: @ 0x021E7D9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_02019B08
	lsrs r2, r4, #1
	lsls r1, r2, #1
	adds r1, r2, r1
	adds r1, r1, #2
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0xb
	muls r1, r2, r1
	lsls r1, r1, #1
	adds r1, r0, r1
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1d
	adds r0, r0, #3
	lsls r0, r0, #0x18
	ldr r3, [r5, #0x34]
	ldr r2, _021E7DF4 @ =0x000040C0
	lsrs r0, r0, #0x17
	ldr r3, [r3, r2]
	movs r2, #1
	lsls r2, r4
	tst r2, r3
	bne _021E7DE0
	adds r4, #0xb
	b _021E7DE2
_021E7DE0:
	adds r4, #0x2b
_021E7DE2:
	lsls r2, r4, #0x10
	lsrs r4, r2, #0x10
	movs r2, #0xf
	ldrh r3, [r1, r0]
	lsls r2, r2, #0xc
	ands r2, r3
	adds r2, r2, r4
	strh r2, [r1, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7DF4: .4byte 0x000040C0
	thumb_func_end ov14_021E7D9C

	thumb_func_start ov14_021E7DF8
ov14_021E7DF8: @ 0x021E7DF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021E7DFE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E7D9C
	adds r4, r4, #1
	cmp r4, #6
	blo _021E7DFE
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E7DF8

	thumb_func_start ov14_021E7E10
ov14_021E7E10: @ 0x021E7E10
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x34]
	ldr r6, _021E7E3C @ =0x000040C0
	movs r2, #1
	ldr r3, [r5, r6]
	lsls r2, r1
	eors r2, r3
	str r2, [r5, r6]
	bl ov14_021E7D9C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	movs r2, #0x15
	movs r3, #6
	bl FUN_020196E8
	pop {r4, r5, r6, pc}
	nop
_021E7E3C: .4byte 0x000040C0
	thumb_func_end ov14_021E7E10

	thumb_func_start ov14_021E7E40
ov14_021E7E40: @ 0x021E7E40
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #2
	movs r2, #0x15
	movs r3, #0x18
	adds r4, r0, #0
	bl FUN_020196E8
	movs r0, #0x12
	movs r2, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #2
	subs r3, r2, #1
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E7E40

	thumb_func_start ov14_021E7E64
ov14_021E7E64: @ 0x021E7E64
	push {r3, lr}
	movs r1, #0x12
	str r1, [sp]
	movs r1, #2
	movs r2, #0
	movs r3, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E7E64

	thumb_func_start ov14_021E7E78
ov14_021E7E78: @ 0x021E7E78
	push {r3, lr}
	movs r1, #1
	movs r2, #2
	movs r3, #6
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E7E78

	thumb_func_start ov14_021E7E88
ov14_021E7E88: @ 0x021E7E88
	push {r3, lr}
	movs r1, #1
	movs r2, #0x15
	movs r3, #6
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E7E88

	thumb_func_start ov14_021E7E98
ov14_021E7E98: @ 0x021E7E98
	push {r3, lr}
	sub sp, #0x10
	movs r1, #0x15
	str r1, [sp]
	movs r1, #0xb
	str r1, [sp, #4]
	movs r1, #0x12
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	ldr r0, [r0, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x14]
	movs r2, #0
	movs r3, #2
	bl FUN_0201C8C4
	add sp, #0x10
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E7E98

	thumb_func_start ov14_021E7EC0
ov14_021E7EC0: @ 0x021E7EC0
	push {r3, lr}
	movs r1, #1
	movs r2, #2
	movs r3, #0x18
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E7EC0

	thumb_func_start ov14_021E7ED0
ov14_021E7ED0: @ 0x021E7ED0
	push {r3, lr}
	movs r1, #1
	movs r2, #0x15
	movs r3, #0x18
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E7ED0

	thumb_func_start ov14_021E7EE0
ov14_021E7EE0: @ 0x021E7EE0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #1
	adds r2, #1
	add r3, sp, #4
	adds r4, r0, #0
	bl FUN_02019B1C
	add r0, sp, #4
	movs r2, #0
	ldrsb r0, [r0, r2]
	cmp r0, #6
	beq _021E7F46
	subs r0, r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r0, [sp]
	adds r0, r4, #0
	subs r3, r1, #2
	bl FUN_020198FC
	add r5, sp, #4
	movs r0, #1
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _021E7F46
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r0, r4, #0
	movs r1, #0xa
	adds r3, #0xf
	lsls r3, r3, #0x18
	movs r2, #0x18
	asrs r3, r3, #0x18
	bl FUN_020196E8
	movs r1, #0xa
	adds r3, r1, #0
	adds r0, r5, #0
	movs r2, #0
	ldrsb r0, [r0, r2]
	subs r3, #0xb
	subs r0, r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r4, #0
	bl FUN_020198FC
_021E7F46:
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E7EE0

	thumb_func_start ov14_021E7F4C
ov14_021E7F4C: @ 0x021E7F4C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #1
	adds r2, #1
	add r3, sp, #4
	adds r4, r0, #0
	bl FUN_02019B1C
	add r0, sp, #4
	movs r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0x18
	beq _021E7FB4
	movs r0, #0x18
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_020198FC
	add r5, sp, #4
	movs r0, #1
	ldrsb r0, [r5, r0]
	cmp r0, #2
	bne _021E7FB4
	movs r3, #0
	ldrsb r3, [r5, r3]
	adds r0, r4, #0
	movs r1, #0xa
	adds r3, #0xf
	lsls r3, r3, #0x18
	movs r2, #0x18
	asrs r3, r3, #0x18
	bl FUN_020196E8
	adds r0, r5, #0
	movs r2, #0
	ldrsb r1, [r0, r2]
	movs r0, #0x18
	movs r3, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	bl FUN_020198FC
_021E7FB4:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E7F4C

	thumb_func_start ov14_021E7FB8
ov14_021E7FB8: @ 0x021E7FB8
	push {r4, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #1
	adds r2, #1
	add r3, sp, #4
	adds r4, r0, #0
	bl FUN_02019B1C
	add r0, sp, #4
	movs r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0x18
	beq _021E7FE8
	movs r0, #0x18
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_020198FC
_021E7FE8:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov14_021E7FB8

	thumb_func_start ov14_021E7FEC
ov14_021E7FEC: @ 0x021E7FEC
	push {r4, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #1
	adds r2, #1
	add r3, sp, #4
	adds r4, r0, #0
	bl FUN_02019B1C
	add r0, sp, #4
	movs r2, #0
	ldrsb r0, [r0, r2]
	cmp r0, #6
	beq _021E801A
	subs r0, r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	str r0, [sp]
	adds r0, r4, #0
	subs r3, r1, #2
	bl FUN_020198FC
_021E801A:
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E7FEC

	thumb_func_start ov14_021E8020
ov14_021E8020: @ 0x021E8020
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0x13
	str r1, [sp]
	movs r1, #1
	adds r2, r1, #0
	movs r3, #0
	adds r4, r0, #0
	bl FUN_020198FC
	movs r0, #0x13
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E8020

	thumb_func_start ov14_021E8048
ov14_021E8048: @ 0x021E8048
	push {r3, lr}
	movs r1, #0x13
	str r1, [sp]
	movs r1, #1
	adds r2, r1, #0
	movs r3, #0
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8048

	thumb_func_start ov14_021E805C
ov14_021E805C: @ 0x021E805C
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0x13
	str r1, [sp]
	movs r1, #1
	adds r4, r0, #0
	subs r2, r1, #2
	movs r3, #0
	bl FUN_020198FC
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x2b
	movs r3, #0x15
	bl FUN_020196E8
	movs r1, #0xa
	movs r0, #0x13
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0xb
	movs r3, #0
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E805C

	thumb_func_start ov14_021E8094
ov14_021E8094: @ 0x021E8094
	push {r3, lr}
	movs r1, #0x13
	str r1, [sp]
	movs r1, #1
	subs r2, r1, #2
	movs r3, #0
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8094

	thumb_func_start ov14_021E80A8
ov14_021E80A8: @ 0x021E80A8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r2, sp, #0
	add r3, sp, #0
	movs r1, #1
	adds r2, #3
	adds r3, #2
	bl FUN_02019B1C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xf
	bl FUN_02019978
	movs r0, #0x2f
	add r2, sp, #0
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	adds r2, #1
	add r3, sp, #0
	bl FUN_02019B1C
	add r0, sp, #0
	movs r1, #3
	ldrsb r2, [r0, r1]
	movs r1, #1
	ldrsb r1, [r0, r1]
	cmp r2, r1
	bne _021E8120
	movs r1, #2
	ldrsb r2, [r0, r1]
	movs r1, #0
	ldrsb r0, [r0, r1]
	cmp r2, r0
	beq _021E8126
_021E8120:
	adds r0, r5, #0
	bl ov14_021F32E0
_021E8126:
	cmp r6, #0
	bne _021E8134
	cmp r4, #0
	bne _021E8134
	add sp, #4
	movs r0, #0
	pop {r3, r4, r5, r6, pc}
_021E8134:
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021E80A8

	thumb_func_start ov14_021E813C
ov14_021E813C: @ 0x021E813C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r2, sp, #0
	add r3, sp, #0
	movs r1, #1
	adds r2, #3
	adds r3, #2
	bl FUN_02019B1C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02019978
	adds r4, r0, #0
	movs r0, #0x2f
	add r2, sp, #0
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	adds r2, #1
	add r3, sp, #0
	bl FUN_02019B1C
	add r1, sp, #0
	movs r0, #3
	ldrsb r2, [r1, r0]
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _021E8194
	movs r0, #2
	ldrsb r2, [r1, r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	beq _021E819A
_021E8194:
	adds r0, r5, #0
	bl ov14_021F32E0
_021E819A:
	cmp r4, #0
	beq _021E81A2
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E81A2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E813C

	thumb_func_start ov14_021E81A8
ov14_021E81A8: @ 0x021E81A8
	ldr r3, _021E81B0 @ =ov14_021E7D8C
	movs r2, #8
	bx r3
	nop
_021E81B0: .4byte ov14_021E7D8C
	thumb_func_end ov14_021E81A8

	thumb_func_start ov14_021E81B4
ov14_021E81B4: @ 0x021E81B4
	push {r3, r4, lr}
	sub sp, #4
	movs r2, #0
	movs r1, #0xd
	subs r3, r2, #7
	adds r4, r0, #0
	bl FUN_020196E8
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0
	movs r3, #1
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E81B4

	thumb_func_start ov14_021E81D8
ov14_021E81D8: @ 0x021E81D8
	push {r3, r4, lr}
	sub sp, #4
	movs r2, #0
	movs r1, #0xd
	adds r3, r2, #0
	adds r4, r0, #0
	bl FUN_020196E8
	movs r0, #7
	movs r2, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd
	subs r3, r2, #1
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E81D8

	thumb_func_start ov14_021E81FC
ov14_021E81FC: @ 0x021E81FC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov14_021F5C84
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	movs r2, #0
	movs r3, #0x15
	bl FUN_020196E8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E81FC

	thumb_func_start ov14_021E821C
ov14_021E821C: @ 0x021E821C
	push {r3, lr}
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	movs r2, #0
	movs r3, #0x18
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E821C

	thumb_func_start ov14_021E8234
ov14_021E8234: @ 0x021E8234
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #8
	movs r2, #0
	movs r3, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8234

	thumb_func_start ov14_021E8248
ov14_021E8248: @ 0x021E8248
	push {r3, lr}
	movs r1, #3
	movs r2, #0
	str r1, [sp]
	movs r1, #8
	subs r3, r2, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8248

	thumb_func_start ov14_021E825C
ov14_021E825C: @ 0x021E825C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov14_021F5E94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	movs r2, #0xc
	movs r3, #0x15
	bl FUN_020196E8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E825C

	thumb_func_start ov14_021E827C
ov14_021E827C: @ 0x021E827C
	push {r3, lr}
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	movs r2, #0xc
	movs r3, #0x18
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E827C

	thumb_func_start ov14_021E8294
ov14_021E8294: @ 0x021E8294
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #9
	movs r2, #0
	movs r3, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8294

	thumb_func_start ov14_021E82A8
ov14_021E82A8: @ 0x021E82A8
	push {r3, lr}
	movs r1, #3
	movs r2, #0
	str r1, [sp]
	movs r1, #9
	subs r3, r2, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E82A8

	thumb_func_start ov14_021E82BC
ov14_021E82BC: @ 0x021E82BC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov14_021F5EB4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	movs r2, #0x18
	movs r3, #0x15
	bl FUN_020196E8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E82BC

	thumb_func_start ov14_021E82DC
ov14_021E82DC: @ 0x021E82DC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov14_021F5EC4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	movs r2, #0x18
	movs r3, #0x15
	bl FUN_020196E8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E82DC

	thumb_func_start ov14_021E82FC
ov14_021E82FC: @ 0x021E82FC
	push {r4, lr}
	movs r1, #0xa
	adds r4, r0, #0
	bl FUN_0201980C
	movs r2, #0x18
	adds r0, r4, #0
	movs r1, #0xa
	adds r3, r2, #0
	bl FUN_020196E8
	pop {r4, pc}
	thumb_func_end ov14_021E82FC

	thumb_func_start ov14_021E8314
ov14_021E8314: @ 0x021E8314
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #0xa
	movs r2, #0
	movs r3, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8314

	thumb_func_start ov14_021E8328
ov14_021E8328: @ 0x021E8328
	push {r3, r4, lr}
	sub sp, #4
	movs r2, #0x18
	movs r1, #0xa
	adds r3, r2, #0
	adds r4, r0, #0
	bl FUN_020196E8
	movs r0, #3
	movs r2, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xa
	subs r3, r2, #1
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E8328

	thumb_func_start ov14_021E834C
ov14_021E834C: @ 0x021E834C
	push {r3, lr}
	add r2, sp, #0
	movs r1, #0xb
	adds r2, #1
	add r3, sp, #0
	bl FUN_02019B1C
	add r1, sp, #0
	movs r0, #0
	ldrsb r1, [r1, r0]
	cmp r1, #0x15
	bne _021E8366
	movs r0, #1
_021E8366:
	pop {r3, pc}
	thumb_func_end ov14_021E834C

	thumb_func_start ov14_021E8368
ov14_021E8368: @ 0x021E8368
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #8
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #9
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0x18
	bl FUN_020196E8
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0xc
	movs r3, #0x18
	bl FUN_020196E8
	pop {r4, pc}
	thumb_func_end ov14_021E8368

	thumb_func_start ov14_021E8394
ov14_021E8394: @ 0x021E8394
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #5
	movs r7, #0x20
_021E839E:
	lsls r3, r5, #0x18
	adds r0, r6, #0
	adds r1, r4, #3
	adds r2, r7, #0
	asrs r3, r3, #0x18
	bl FUN_020196E8
	adds r4, r4, #1
	adds r5, r5, #3
	cmp r4, #5
	blo _021E839E
	movs r2, #0x18
	adds r0, r6, #0
	movs r1, #0xb
	adds r3, r2, #0
	bl FUN_020196E8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E8394

	thumb_func_start ov14_021E83C4
ov14_021E83C4: @ 0x021E83C4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #5
	movs r7, #0x15
_021E83CE:
	lsls r3, r5, #0x18
	adds r0, r6, #0
	adds r1, r4, #3
	adds r2, r7, #0
	asrs r3, r3, #0x18
	bl FUN_020196E8
	adds r4, r4, #1
	adds r5, r5, #3
	cmp r4, #5
	blo _021E83CE
	adds r0, r6, #0
	movs r1, #0xb
	movs r2, #0x18
	movs r3, #0x15
	bl FUN_020196E8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E83C4

	thumb_func_start ov14_021E83F4
ov14_021E83F4: @ 0x021E83F4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r4, #0
	movs r5, #5
	movs r7, #0x20
_021E83FE:
	adds r0, r6, #0
	adds r1, r4, #3
	bl FUN_0201980C
	lsls r3, r5, #0x18
	adds r0, r6, #0
	adds r1, r4, #3
	adds r2, r7, #0
	asrs r3, r3, #0x18
	bl FUN_020196E8
	adds r4, r4, #1
	adds r5, r5, #3
	cmp r4, #5
	blo _021E83FE
	adds r0, r6, #0
	movs r1, #0xb
	bl FUN_0201980C
	movs r2, #0x18
	adds r0, r6, #0
	movs r1, #0xb
	adds r3, r2, #0
	bl FUN_020196E8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E83F4

	thumb_func_start ov14_021E8434
ov14_021E8434: @ 0x021E8434
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #3
	adds r2, #1
	add r3, sp, #4
	adds r5, r0, #0
	bl FUN_02019B1C
	add r6, sp, #4
	movs r0, #1
	ldrsb r0, [r6, r0]
	cmp r0, #0x15
	beq _021E849E
	movs r4, #0
	movs r7, #1
_021E8454:
	ldrsb r0, [r6, r7]
	movs r2, #0
	adds r1, r4, #3
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	mvns r2, r2
	movs r3, #0
	bl FUN_020198FC
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	blo _021E8454
	add r2, sp, #4
	adds r0, r5, #0
	movs r1, #0xb
	adds r2, #1
	add r3, sp, #4
	bl FUN_02019B1C
	movs r1, #0xb
	adds r3, r1, #0
	add r0, sp, #4
	movs r2, #0
	ldrsb r0, [r0, r2]
	subs r3, #0xc
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	bl FUN_020198FC
_021E849E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E8434

	thumb_func_start ov14_021E84A4
ov14_021E84A4: @ 0x021E84A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #3
	adds r2, #1
	add r3, sp, #4
	adds r5, r0, #0
	bl FUN_02019B1C
	add r6, sp, #4
	movs r0, #1
	ldrsb r0, [r6, r0]
	cmp r0, #0x20
	beq _021E850E
	movs r4, #0
	movs r7, #0x20
_021E84C4:
	movs r0, #1
	ldrsb r0, [r6, r0]
	adds r1, r4, #3
	movs r2, #1
	subs r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	movs r3, #0
	bl FUN_020198FC
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	blo _021E84C4
	add r2, sp, #4
	adds r0, r5, #0
	movs r1, #0xb
	adds r2, #1
	add r3, sp, #4
	bl FUN_02019B1C
	add r0, sp, #4
	movs r2, #0
	ldrsb r1, [r0, r2]
	movs r0, #0x18
	movs r3, #1
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xb
	bl FUN_020198FC
_021E850E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E84A4

	thumb_func_start ov14_021E8514
ov14_021E8514: @ 0x021E8514
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0
	adds r5, r0, #0
	adds r4, r6, #0
	movs r7, #1
_021E851E:
	adds r0, r5, #0
	adds r1, r4, #3
	bl FUN_02019978
	cmp r0, #1
	bne _021E852C
	adds r6, r7, #0
_021E852C:
	adds r4, r4, #1
	cmp r4, #5
	blo _021E851E
	adds r0, r5, #0
	movs r1, #0xb
	bl FUN_02019978
	cmp r0, #1
	bne _021E8540
	movs r6, #1
_021E8540:
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021E8514

	thumb_func_start ov14_021E8544
ov14_021E8544: @ 0x021E8544
	push {r3, lr}
	add r2, sp, #0
	movs r1, #3
	adds r2, #1
	add r3, sp, #0
	bl FUN_02019B1C
	add r1, sp, #0
	movs r0, #1
	ldrsb r1, [r1, r0]
	cmp r1, #0x20
	bne _021E855E
	movs r0, #0
_021E855E:
	pop {r3, pc}
	thumb_func_end ov14_021E8544

	thumb_func_start ov14_021E8560
ov14_021E8560: @ 0x021E8560
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0xc
	movs r2, #0x20
	movs r3, #0xe
	adds r4, r0, #0
	bl FUN_020196E8
	movs r1, #0xc
	movs r0, #0xb
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0xd
	movs r3, #0
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E8560

	thumb_func_start ov14_021E8588
ov14_021E8588: @ 0x021E8588
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0xc
	movs r2, #0x15
	movs r3, #0xe
	adds r4, r0, #0
	bl FUN_020196E8
	movs r0, #0xb
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E8588

	thumb_func_start ov14_021E85AC
ov14_021E85AC: @ 0x021E85AC
	push {r3, lr}
	movs r1, #0xe
	movs r2, #0
	movs r3, #0x18
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E85AC

	thumb_func_start ov14_021E85BC
ov14_021E85BC: @ 0x021E85BC
	push {r3, lr}
	movs r1, #3
	movs r2, #0
	str r1, [sp]
	movs r1, #0xe
	subs r3, r2, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E85BC

	thumb_func_start ov14_021E85D0
ov14_021E85D0: @ 0x021E85D0
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #0xe
	movs r2, #0
	movs r3, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E85D0

	thumb_func_start ov14_021E85E4
ov14_021E85E4: @ 0x021E85E4
	push {r3, lr}
	add r2, sp, #0
	movs r1, #0xe
	adds r2, #1
	add r3, sp, #0
	bl FUN_02019B1C
	add r1, sp, #0
	movs r0, #0
	ldrsb r1, [r1, r0]
	cmp r1, #0x15
	bne _021E85FE
	movs r0, #1
_021E85FE:
	pop {r3, pc}
	thumb_func_end ov14_021E85E4

	thumb_func_start ov14_021E8600
ov14_021E8600: @ 0x021E8600
	push {r3, lr}
	movs r1, #0xf
	movs r2, #0
	movs r3, #0x18
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8600

	thumb_func_start ov14_021E8610
ov14_021E8610: @ 0x021E8610
	push {r3, lr}
	movs r1, #0xf
	movs r2, #0
	movs r3, #0x15
	bl FUN_020196E8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8610

	thumb_func_start ov14_021E8620
ov14_021E8620: @ 0x021E8620
	push {r3, lr}
	movs r1, #3
	movs r2, #0
	str r1, [sp]
	movs r1, #0xf
	subs r3, r2, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8620

	thumb_func_start ov14_021E8634
ov14_021E8634: @ 0x021E8634
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #0xf
	movs r2, #0
	movs r3, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8634

	thumb_func_start ov14_021E8648
ov14_021E8648: @ 0x021E8648
	push {r3, lr}
	add r2, sp, #0
	movs r1, #0xf
	adds r2, #1
	add r3, sp, #0
	bl FUN_02019B1C
	add r1, sp, #0
	movs r0, #0
	ldrsb r1, [r1, r0]
	cmp r1, #0x15
	bne _021E8662
	movs r0, #1
_021E8662:
	pop {r3, pc}
	thumb_func_end ov14_021E8648

	thumb_func_start ov14_021E8664
ov14_021E8664: @ 0x021E8664
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E82DC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_0201980C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_0201980C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	movs r2, #0
	movs r3, #0x18
	bl FUN_020196E8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	movs r2, #0xc
	movs r3, #0x18
	bl FUN_020196E8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_020196E8
	adds r0, r4, #0
	bl ov14_021F57B8
	adds r0, r4, #0
	bl ov14_021F4720
	adds r0, r4, #0
	bl ov14_021F4848
	adds r0, r4, #0
	bl ov14_021F48B4
	adds r0, r4, #0
	movs r1, #0x30
	bl ov14_021F47B8
	pop {r4, pc}
	thumb_func_end ov14_021E8664

	thumb_func_start ov14_021E86E0
ov14_021E86E0: @ 0x021E86E0
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0
	adds r2, r1, #0
	subs r3, r1, #6
	adds r4, r0, #0
	bl FUN_020196E8
	movs r0, #6
	movs r1, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #1
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E86E0

	thumb_func_start ov14_021E8704
ov14_021E8704: @ 0x021E8704
	push {r3, lr}
	movs r1, #6
	str r1, [sp]
	movs r1, #0
	adds r2, r1, #0
	subs r3, r1, #1
	bl FUN_020198FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E8704

	thumb_func_start ov14_021E8718
ov14_021E8718: @ 0x021E8718
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xc
	movs r2, #0x15
	movs r3, #8
	bl FUN_020196E8
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x15
	movs r3, #0xe
	bl FUN_020196E8
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0x15
	movs r3, #0x11
	bl FUN_020196E8
	pop {r4, pc}
	thumb_func_end ov14_021E8718

	thumb_func_start ov14_021E8740
ov14_021E8740: @ 0x021E8740
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E8664
	adds r0, r4, #0
	bl ov14_021F6070
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8718
	pop {r4, pc}
	thumb_func_end ov14_021E8740

	thumb_func_start ov14_021E875C
ov14_021E875C: @ 0x021E875C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r1, #0xc
	movs r2, #0x20
	movs r3, #8
	bl FUN_020196E8
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x20
	movs r3, #0xe
	bl FUN_020196E8
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0x20
	movs r3, #0x11
	bl FUN_020196E8
	movs r1, #0xc
	movs r0, #0xb
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #0xd
	movs r3, #0
	bl FUN_020198FC
	movs r0, #0xb
	movs r1, #6
	str r0, [sp]
	adds r0, r4, #0
	subs r2, r1, #7
	movs r3, #0
	bl FUN_020198FC
	movs r1, #7
	movs r0, #0xb
	adds r2, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r2, #8
	movs r3, #0
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E875C

	thumb_func_start ov14_021E87BC
ov14_021E87BC: @ 0x021E87BC
	push {r3, r4, lr}
	sub sp, #4
	movs r1, #0xb
	str r1, [sp]
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	adds r4, r0, #0
	bl FUN_020198FC
	movs r0, #0xb
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #1
	movs r3, #0
	bl FUN_020198FC
	movs r0, #0xb
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #7
	movs r2, #1
	movs r3, #0
	bl FUN_020198FC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021E87BC

	thumb_func_start ov14_021E87F4
ov14_021E87F4: @ 0x021E87F4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_0201980C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_0201980C
	adds r0, r4, #0
	bl ov14_021E821C
	adds r0, r4, #0
	bl ov14_021E827C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E87F4

	thumb_func_start ov14_021E8824
ov14_021E8824: @ 0x021E8824
	push {r3, lr}
	ldr r1, _021E8848 @ =0x0000044E
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1d
	beq _021E8846
	movs r1, #0xc
	str r1, [sp]
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #0x10
	adds r2, r1, #0
	subs r2, #0x11
	movs r3, #0
	bl FUN_020198FC
_021E8846:
	pop {r3, pc}
	.align 2, 0
_021E8848: .4byte 0x0000044E
	thumb_func_end ov14_021E8824

	thumb_func_start ov14_021E884C
ov14_021E884C: @ 0x021E884C
	push {r3, lr}
	ldr r1, _021E8870 @ =0x0000044E
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1d
	beq _021E886C
	movs r1, #0xc
	str r1, [sp]
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	movs r1, #0x10
	movs r2, #1
	movs r3, #0
	bl FUN_020198FC
_021E886C:
	pop {r3, pc}
	nop
_021E8870: .4byte 0x0000044E
	thumb_func_end ov14_021E884C

	thumb_func_start ov14_021E8874
ov14_021E8874: @ 0x021E8874
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E88A0 @ =0x0000044E
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	beq _021E889E
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x10
	bl FUN_0201980C
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x10
	movs r2, #0x14
	movs r3, #0xc
	bl FUN_020196E8
_021E889E:
	pop {r4, pc}
	.align 2, 0
_021E88A0: .4byte 0x0000044E
	thumb_func_end ov14_021E8874

	thumb_func_start ov14_021E88A4
ov14_021E88A4: @ 0x021E88A4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0x20
	movs r3, #0xc
	bl FUN_020196E8
	pop {r4, pc}
	thumb_func_end ov14_021E88A4

	thumb_func_start ov14_021E88BC
ov14_021E88BC: @ 0x021E88BC
	push {r4, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #0x10
	adds r2, #1
	add r3, sp, #4
	adds r4, r0, #0
	bl FUN_02019B1C
	add r0, sp, #4
	movs r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0xf
	beq _021E88F2
	movs r0, #0x18
	subs r1, r0, r1
	movs r0, #9
	subs r0, r0, r1
	lsls r0, r0, #0x18
	movs r1, #0x10
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	str r0, [sp]
	adds r0, r4, #0
	subs r3, #0x11
	bl FUN_020198FC
_021E88F2:
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E88BC

	thumb_func_start ov14_021E88F8
ov14_021E88F8: @ 0x021E88F8
	push {r4, lr}
	sub sp, #8
	add r2, sp, #4
	movs r1, #0x10
	adds r2, #1
	add r3, sp, #4
	adds r4, r0, #0
	bl FUN_02019B1C
	add r0, sp, #4
	movs r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0x18
	beq _021E8928
	movs r0, #0x18
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x10
	movs r3, #1
	bl FUN_020198FC
_021E8928:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov14_021E88F8

	thumb_func_start ov14_021E892C
ov14_021E892C: @ 0x021E892C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0xf
	bl FUN_020196E8
	pop {r4, pc}
	thumb_func_end ov14_021E892C

	thumb_func_start ov14_021E8944
ov14_021E8944: @ 0x021E8944
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0x18
	bl FUN_020196E8
	pop {r4, pc}
	thumb_func_end ov14_021E8944

	thumb_func_start ov14_021E895C
ov14_021E895C: @ 0x021E895C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	movs r7, #1
_021E8968:
	adds r0, r7, #0
	lsls r0, r4
	tst r0, r6
	beq _021E8976
	adds r0, r4, #0
	adds r0, #0x3a
	b _021E897A
_021E8976:
	adds r0, r4, #0
	adds r0, #0x1a
_021E897A:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0x12
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x34]
	adds r3, r4, #0
	adds r3, #0xf
	lsls r3, r3, #0x18
	ldr r0, [r0, #0x14]
	movs r1, #5
	lsrs r3, r3, #0x18
	bl FUN_0201C8C4
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #6
	blo _021E8968
	ldr r0, [r5, #0x34]
	movs r1, #5
	ldr r0, [r0, #0x14]
	bl FUN_0201EFBC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E895C

	thumb_func_start ov14_021E89B8
ov14_021E89B8: @ 0x021E89B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #9
	movs r1, #0x3c
	bl FUN_0201AA8C
	str r0, [r5, #0x18]
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021E89EE
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	movs r2, #0
	bl ov14_021E60C0
	str r0, [r4]
	movs r0, #2
	strb r0, [r4, #0x11]
	movs r0, #0x1e
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	b _021E8A06
_021E89EE:
	ldr r0, [r5, #8]
	str r0, [r4]
	movs r0, #1
	strb r0, [r4, #0x11]
	ldr r0, [r5, #8]
	bl FUN_02074640
	strb r0, [r4, #0x13]
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
_021E8A06:
	strb r0, [r4, #0x14]
	ldr r0, [r5, #0x10]
	str r0, [r4, #4]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02028E9C
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_0208AD34
	movs r0, #0
	strb r0, [r4, #0x12]
	ldr r1, _021E8A74 @ =0x021F7D0C
	adds r0, r4, #0
	bl FUN_02089D40
	movs r0, #0
	strb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
	strh r0, [r4, #0x18]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02074910
	str r0, [r4, #0x1c]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0202D95C
	str r0, [r4, #0x20]
	movs r0, #0
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02088288
	str r0, [r4, #0x2c]
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_0208828C
	str r0, [r4, #0x34]
	ldr r0, [r5]
	adds r1, r4, #0
	ldr r0, [r0, #4]
	movs r2, #9
	str r0, [r4, #0x30]
	ldr r0, _021E8A78 @ =0x02103A1C
	bl FUN_0200724C
	str r0, [r5, #0x14]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8A74: .4byte 0x021F7D0C
_021E8A78: .4byte 0x02103A1C
	thumb_func_end ov14_021E89B8

	thumb_func_start ov14_021E8A7C
ov14_021E8A7C: @ 0x021E8A7C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x27
	ldrb r1, [r1]
	ldr r0, [r4, #0x18]
	cmp r1, #0
	bne _021E8AA8
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldrb r2, [r0, #0x14]
	cmp r1, #0x1e
	bhs _021E8AA0
	adds r1, r4, #0
	adds r1, #0x21
	strb r2, [r1]
	b _021E8AA8
_021E8AA0:
	adds r1, r4, #0
	adds r2, #0x1e
	adds r1, #0x21
	strb r2, [r1]
_021E8AA8:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r1, #0x1e
	bhs _021E8AC0
	ldr r0, [r0, #0x38]
	cmp r0, #1
	bne _021E8AC0
	ldrb r1, [r4, #0x1f]
	ldr r0, [r4, #4]
	bl FUN_020740D8
_021E8AC0:
	ldr r0, [r4, #0x18]
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E8A7C

	thumb_func_start ov14_021E8ACC
ov14_021E8ACC: @ 0x021E8ACC
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0207879C
	ldr r1, _021E8B10 @ =0x021F7D14
	movs r2, #9
	bl FUN_02078644
	str r0, [r4, #0x18]
	ldr r1, [r4]
	movs r2, #1
	ldr r0, [r1, #4]
	movs r3, #0
	str r0, [sp]
	ldr r0, [r4, #0x18]
	ldr r1, [r1]
	bl FUN_0207789C
	ldr r0, _021E8B14 @ =0x0000000F
	movs r1, #2
	bl FUN_02006FF8
	ldr r0, _021E8B18 @ =0x022008B8
	ldr r1, [r4, #0x18]
	movs r2, #9
	bl FUN_0200724C
	str r0, [r4, #0x14]
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021E8B10: .4byte 0x021F7D14
_021E8B14: .4byte 0x0000000F
_021E8B18: .4byte 0x022008B8
	thumb_func_end ov14_021E8ACC

	thumb_func_start ov14_021E8B1C
ov14_021E8B1C: @ 0x021E8B1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E8B38 @ =0x0000000F
	bl FUN_02006F7C
	ldr r0, [r4, #0x18]
	bl FUN_02077904
	strh r0, [r4, #0x1c]
	ldr r0, [r4, #0x18]
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E8B38: .4byte 0x0000000F
	thumb_func_end ov14_021E8B1C

	thumb_func_start ov14_021E8B3C
ov14_021E8B3C: @ 0x021E8B3C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #2
	str r0, [sp]
	ldr r0, [r4]
	movs r2, #0
	ldr r0, [r0, #4]
	movs r3, #8
	str r0, [sp, #4]
	movs r0, #9
	bl FUN_020830D8
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x25
	ldr r2, [r4, #0x18]
	ldrb r1, [r1]
	ldr r0, [r4, #4]
	ldr r2, [r2, #0x18]
	bl FUN_02073F00
	ldr r0, _021E8B7C @ =0x02102610
	ldr r1, [r4, #0x18]
	movs r2, #9
	bl FUN_0200724C
	str r0, [r4, #0x14]
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021E8B7C: .4byte 0x02102610
	thumb_func_end ov14_021E8B3C

	thumb_func_start ov14_021E8B80
ov14_021E8B80: @ 0x021E8B80
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	ldr r4, [r5, #0x18]
	adds r1, #0x25
	ldrb r1, [r1]
	ldr r0, [r5, #4]
	ldr r2, [r4, #0x18]
	bl FUN_02073F34
	ldr r0, [r4, #0x14]
	strh r0, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	bl FUN_0208311C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E8B80

	thumb_func_start ov14_021E8BA4
ov14_021E8BA4: @ 0x021E8BA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r4, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov14_021E8514
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_02019978
	adds r7, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	str r0, [sp]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	str r0, [sp, #4]
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021E8BF4
	cmp r0, #1
	beq _021E8CCC
	b _021E8D0C
_021E8BF4:
	add r0, sp, #0xc
	add r1, sp, #8
	bl FUN_02025364
	cmp r0, #0
	bne _021E8C86
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	movs r6, #0xff
	cmp r0, #0
	beq _021E8C24
	ldr r1, [r5, #0x34]
	ldr r2, _021E8D14 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E79D8
	adds r6, r0, #0
_021E8C24:
	cmp r6, #0xff
	bne _021E8C40
	ldr r1, [r5, #0x34]
	ldr r2, _021E8D14 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E7960
	adds r6, r0, #0
_021E8C40:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov14_021E6CF8
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F40E8
	movs r0, #0x80
	tst r0, r6
	bne _021E8C6E
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov14_021E70B0
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
_021E8C6E:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	ldr r0, [r5, #0x34]
	bl ov14_021E8824
	movs r0, #1
	strh r0, [r4, #0x10]
	b _021E8D0C
_021E8C86:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	adds r2, r0, r1
	ldr r1, _021E8D18 @ =0x00004094
	ldrb r1, [r2, r1]
	ldr r2, [sp, #8]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	lsls r2, r2, #0x10
	ldr r0, [r1, r0]
	ldr r1, [sp, #0xc]
	asrs r2, r2, #0x10
	subs r2, #8
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r5, #0
	bl ov14_021F4174
	ldr r2, [sp, #0xc]
	ldr r1, [r5, #0x34]
	ldr r0, _021E8D14 @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp, #8]
	ldr r1, [r5, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021E8D0C
_021E8CCC:
	adds r0, r5, #0
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E8D0C
	cmp r6, #0
	bne _021E8D0C
	cmp r7, #0
	bne _021E8D0C
	ldr r0, [sp]
	cmp r0, #0
	bne _021E8D0C
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _021E8D0C
	ldr r1, [r4, #0xc]
	adds r0, r5, #0
	bl ov14_021E7148
	adds r0, r5, #0
	bl ov14_021F4174
	ldr r2, [r5, #0x34]
	ldr r1, _021E8D1C @ =0x000040C4
	adds r0, r5, #0
	ldr r1, [r2, r1]
	bl ov14_021F40E8
	movs r0, #0
	add sp, #0x10
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021E8D0C:
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8D14: .4byte 0x000040B8
_021E8D18: .4byte 0x00004094
_021E8D1C: .4byte 0x000040C4
	thumb_func_end ov14_021E8BA4

	thumb_func_start ov14_021E8D20
ov14_021E8D20: @ 0x021E8D20
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r5, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov14_021E8514
	adds r7, r0, #0
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	bne _021E8D5C
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	adds r2, r0, r1
	ldr r1, _021E8FC0 @ =0x00004094
	ldrb r1, [r2, r1]
	add r2, sp, #0
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	bl FUN_0200DE44
_021E8D5C:
	adds r0, r4, #0
	bl ov14_021E80A8
	adds r6, r0, #0
	ldrh r0, [r5, #0x10]
	cmp r0, #5
	bls _021E8D6C
	b _021E8FB8
_021E8D6C:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E8D78: @ jump table
	.2byte _021E8D84 - _021E8D78 - 2 @ case 0
	.2byte _021E8F1E - _021E8D78 - 2 @ case 1
	.2byte _021E8F1E - _021E8D78 - 2 @ case 2
	.2byte _021E8F62 - _021E8D78 - 2 @ case 3
	.2byte _021E8F96 - _021E8D78 - 2 @ case 4
	.2byte _021E8FA0 - _021E8D78 - 2 @ case 5
_021E8D84:
	ldr r0, [r4, #0x34]
	ldr r1, _021E8FC4 @ =0x0000044A
	ldrb r2, [r0, r1]
	cmp r2, #1
	bne _021E8DA8
	cmp r6, #0
	bne _021E8DA8
	movs r2, #2
	strb r2, [r0, r1]
	adds r0, r4, #0
	movs r1, #0x28
	bl ov14_021F69F0
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
_021E8DA8:
	add r0, sp, #8
	add r1, sp, #4
	bl FUN_02025364
	cmp r0, #0
	bne _021E8EA8
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	add r3, sp, #0
	adds r2, r0, r1
	ldr r1, _021E8FC0 @ =0x00004094
	ldrb r1, [r2, r1]
	movs r2, #0
	ldrsh r2, [r3, r2]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r3, r1]
	bl FUN_0200DDB8
	ldr r1, [r4, #0x34]
	ldr r0, _021E8FC4 @ =0x0000044A
	ldr r2, _021E8FC8 @ =0x000040B8
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _021E8DFA
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E7960
	b _021E8E0E
_021E8DFA:
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _021E8FCC @ =0x021F7BF0
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E79AC
_021E8E0E:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, r0, #0
	adds r0, r4, #0
	bl ov14_021E6CF8
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E70B0
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021E8E44
	movs r2, #0
	b _021E8E46
_021E8E44:
	movs r2, #1
_021E8E46:
	ldr r1, [r4, #0x34]
	ldr r0, _021E8FD0 @ =0x000040C4
	str r2, [r1, r0]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r1, [r0]
	cmp r1, #0x1e
	bhs _021E8E84
	adds r0, r4, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	bne _021E8E6A
	movs r0, #3
	strh r0, [r5, #0x10]
	b _021E8FB8
_021E8E6A:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
	adds r0, r4, #0
	movs r1, #0xff
	bl ov14_021E7588
	movs r0, #1
	strh r0, [r5, #0x10]
	b _021E8FB8
_021E8E84:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7FEC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	movs r0, #1
	strh r0, [r5, #0x10]
	b _021E8FB8
_021E8EA8:
	cmp r7, #0
	bne _021E8ED8
	ldr r0, [r4, #0x34]
	ldr r1, _021E8FC4 @ =0x0000044A
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021E8ED8
	ldr r2, [sp, #8]
	cmp r2, #0x10
	blo _021E8EC6
	ldr r1, [sp, #4]
	cmp r1, #0x30
	blo _021E8EC6
	cmp r2, #0x68
	blo _021E8ED8
_021E8EC6:
	ldr r1, _021E8FC4 @ =0x0000044A
	movs r2, #1
	strb r2, [r0, r1]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7FB8
_021E8ED8:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	adds r2, r0, r1
	ldr r1, _021E8FC0 @ =0x00004094
	ldrb r1, [r2, r1]
	ldr r2, [sp, #4]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	lsls r2, r2, #0x10
	ldr r0, [r1, r0]
	ldr r1, [sp, #8]
	asrs r2, r2, #0x10
	subs r2, #8
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #0
	bl ov14_021F4174
	ldr r2, [sp, #8]
	ldr r1, [r4, #0x34]
	ldr r0, _021E8FC8 @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp, #4]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021E8FB8
_021E8F1E:
	adds r0, r4, #0
	bl ov14_021E6814
	cmp r0, #0
	bne _021E8FB8
	cmp r7, #0
	bne _021E8FB8
	cmp r6, #0
	bne _021E8FB8
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl ov14_021E7148
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021E8F4A
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
_021E8F4A:
	adds r0, r4, #0
	bl ov14_021F4174
	ldr r2, [r4, #0x34]
	ldr r1, _021E8FD0 @ =0x000040C4
	adds r0, r4, #0
	ldr r1, [r2, r1]
	bl ov14_021F40E8
	movs r0, #5
	strh r0, [r5, #0x10]
	b _021E8FB8
_021E8F62:
	adds r0, r4, #0
	bl ov14_021E66F4
	cmp r0, #0
	bne _021E8FB8
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl ov14_021E7148
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
	adds r0, r4, #0
	movs r1, #0xff
	bl ov14_021E7588
	movs r0, #0xff
	adds r4, #0x21
	strb r0, [r4]
	ldrh r0, [r5, #0x10]
	adds r0, r0, #1
	strh r0, [r5, #0x10]
	b _021E8FB8
_021E8F96:
	cmp r6, #0
	bne _021E8FB8
	movs r0, #5
	strh r0, [r5, #0x10]
	b _021E8FB8
_021E8FA0:
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	ldr r2, [r4, #0x34]
	ldr r1, _021E8FC4 @ =0x0000044A
	movs r0, #0
	strb r0, [r2, r1]
	add sp, #0xc
	strh r0, [r5, #0x10]
	pop {r4, r5, r6, r7, pc}
_021E8FB8:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E8FC0: .4byte 0x00004094
_021E8FC4: .4byte 0x0000044A
_021E8FC8: .4byte 0x000040B8
_021E8FCC: .4byte 0x021F7BF0
_021E8FD0: .4byte 0x000040C4
	thumb_func_end ov14_021E8D20

	thumb_func_start ov14_021E8FD4
ov14_021E8FD4: @ 0x021E8FD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r4, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xe
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xf
	bl FUN_02019978
	adds r7, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021E900C
	cmp r0, #1
	beq _021E90F8
	cmp r0, #2
	bne _021E900A
	b _021E914E
_021E900A:
	b _021E9180
_021E900C:
	add r0, sp, #4
	add r1, sp, #0
	bl FUN_02025364
	cmp r0, #0
	bne _021E90B2
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	movs r6, #0xff
	cmp r0, #0
	beq _021E903C
	ldr r1, [r5, #0x34]
	ldr r2, _021E9188 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E79D8
	adds r6, r0, #0
_021E903C:
	cmp r6, #0xff
	bne _021E9058
	ldr r1, [r5, #0x34]
	ldr r2, _021E9188 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E7960
	adds r6, r0, #0
_021E9058:
	cmp r6, #0xff
	bne _021E9076
	ldr r1, [r5, #0x34]
	ldr r2, _021E9188 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _021E918C @ =0x021F7C08
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E79AC
	adds r6, r0, #0
_021E9076:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov14_021E6CF8
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F40E8
	movs r0, #0x80
	tst r0, r6
	bne _021E90A4
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov14_021E70B0
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
_021E90A4:
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E9180
_021E90B2:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	adds r2, r0, r1
	ldr r1, _021E9190 @ =0x00004094
	ldrb r1, [r2, r1]
	ldr r2, [sp]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	lsls r2, r2, #0x10
	ldr r0, [r1, r0]
	ldr r1, [sp, #4]
	asrs r2, r2, #0x10
	subs r2, #8
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r5, #0
	bl ov14_021F4174
	ldr r2, [sp, #4]
	ldr r1, [r5, #0x34]
	ldr r0, _021E9188 @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp]
	ldr r1, [r5, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021E9180
_021E90F8:
	cmp r6, #0
	bne _021E914E
	cmp r7, #0
	bne _021E914E
	ldr r6, [r4, #0xc]
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r1, [r0]
	cmp r1, #0xff
	beq _021E913C
	movs r0, #0x80
	tst r0, r1
	beq _021E913C
	adds r0, r6, #0
	adds r0, #0xe4
	ldr r0, [r0]
	cmp r0, #0x1e
	blo _021E9148
	ldr r0, [r5, #8]
	bl FUN_02074640
	adds r6, #0xe4
	ldr r1, [r6]
	subs r0, r0, #1
	subs r1, #0x1e
	cmp r1, r0
	bhs _021E9148
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
	b _021E9148
_021E913C:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
_021E9148:
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021E914E:
	adds r0, r5, #0
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E9180
	cmp r7, #0
	bne _021E9180
	ldrh r0, [r4, #0x10]
	cmp r0, #2
	bne _021E9180
	ldr r1, [r4, #0xc]
	adds r0, r5, #0
	bl ov14_021E7148
	adds r0, r5, #0
	bl ov14_021F4174
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F40E8
	movs r0, #0
	add sp, #8
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021E9180:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9188: .4byte 0x000040B8
_021E918C: .4byte 0x021F7C08
_021E9190: .4byte 0x00004094
	thumb_func_end ov14_021E8FD4

	thumb_func_start ov14_021E9194
ov14_021E9194: @ 0x021E9194
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r4, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xa
	bl FUN_02019978
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021E91B2
	cmp r0, #1
	beq _021E91C4
	b _021E91DC
_021E91B2:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov14_021E70E0
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021E91C4:
	adds r0, r5, #0
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E91DC
	ldr r1, [r4, #0xc]
	adds r0, r5, #0
	bl ov14_021E7148
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E91DC:
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E9194

	thumb_func_start ov14_021E91E0
ov14_021E91E0: @ 0x021E91E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E91F2
	cmp r1, #1
	beq _021E9218
	b _021E922E
_021E91F2:
	ldr r0, [r5, #8]
	bl FUN_02074640
	adds r2, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r2, #0x1e
	adds r0, r5, #0
	bl ov14_021E6CF8
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F40E8
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E922E
_021E9218:
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E922E
	ldr r1, [r4, #0xc]
	adds r0, r5, #0
	bl ov14_021E7148
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E922E:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E91E0

	thumb_func_start ov14_021E9234
ov14_021E9234: @ 0x021E9234
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E9248
	cmp r1, #1
	beq _021E927E
	b _021E92A6
_021E9248:
	ldrb r0, [r5, #0x1f]
	add r1, sp, #0
	add r2, sp, #4
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	bl FUN_02073D9C
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl ov14_021E6CF8
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F40E8
	movs r0, #0xff
	adds r5, #0x21
	strb r0, [r5]
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E92A6
_021E927E:
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E92A6
	ldr r6, [r4, #0xc]
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	adds r1, #0xe4
	ldr r1, [r1]
	movs r2, #1
	bl ov14_021F34C8
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E7148
	movs r0, #0
	add sp, #8
	strh r0, [r4, #0x10]
	pop {r4, r5, r6, pc}
_021E92A6:
	movs r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021E9234

	thumb_func_start ov14_021E92AC
ov14_021E92AC: @ 0x021E92AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x34]
	ldrh r0, [r1, #0x12]
	cmp r0, #0x17
	bne _021E92D8
	ldr r0, [r1, #0x2c]
	bl FUN_02019F90
	cmp r0, #1
	bne _021E92CC
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
_021E92CC:
	ldr r1, [r5, #0x34]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, [r5, #0x34]
	strh r0, [r1, #0x10]
	pop {r3, r4, r5, pc}
_021E92D8:
	ldr r0, [r1, #0x14]
	movs r1, #3
	movs r2, #2
	movs r3, #8
	bl FUN_0201F238
	adds r0, r5, #0
	movs r1, #8
	bl ov14_021F3210
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xe
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xb
	bl FUN_020199E4
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xb
	bl FUN_020199E4
	cmp r4, #1
	bne _021E9362
	cmp r0, #0
	bne _021E9362
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
_021E9362:
	ldr r1, [r5, #0x34]
	ldrh r0, [r1, #0x12]
	adds r0, r0, #1
	strh r0, [r1, #0x12]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E92AC

	thumb_func_start ov14_021E9370
ov14_021E9370: @ 0x021E9370
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x34]
	ldrh r0, [r1, #0x12]
	cmp r0, #0x17
	bne _021E939C
	ldr r0, [r1, #0x2c]
	bl FUN_02019F90
	cmp r0, #1
	bne _021E9390
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
_021E9390:
	ldr r1, [r5, #0x34]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, [r5, #0x34]
	strh r0, [r1, #0x10]
	pop {r3, r4, r5, pc}
_021E939C:
	ldr r0, [r1, #0x14]
	movs r1, #3
	movs r2, #1
	movs r3, #8
	bl FUN_0201F238
	movs r1, #7
	adds r0, r5, #0
	mvns r1, r1
	bl ov14_021F3210
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xe
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xb
	bl FUN_020199E4
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xb
	bl FUN_020199E4
	cmp r4, #1
	bne _021E9428
	cmp r0, #0
	bne _021E9428
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
_021E9428:
	ldr r1, [r5, #0x34]
	ldrh r0, [r1, #0x12]
	adds r0, r0, #1
	strh r0, [r1, #0x12]
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E9370

	thumb_func_start ov14_021E9434
ov14_021E9434: @ 0x021E9434
	push {r3, lr}
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	cmp r0, #0
	beq _021E944A
	movs r0, #1
	pop {r3, pc}
_021E944A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E9434

	thumb_func_start ov14_021E9450
ov14_021E9450: @ 0x021E9450
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	adds r7, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r4, #0
	bne _021E94A4
	cmp r6, #0
	bne _021E94A4
	cmp r7, #0
	bne _021E94A4
	cmp r0, #0
	bne _021E94A4
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E94A4:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021E9450

	thumb_func_start ov14_021E94A8
ov14_021E94A8: @ 0x021E94A8
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldr r3, _021E94B8 @ =FUN_02019978
	movs r1, #2
	bx r3
	nop
_021E94B8: .4byte FUN_02019978
	thumb_func_end ov14_021E94A8

	thumb_func_start ov14_021E94BC
ov14_021E94BC: @ 0x021E94BC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_02019978
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	adds r7, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xb
	bl FUN_02019978
	cmp r4, #0
	bne _021E9512
	cmp r6, #0
	bne _021E9512
	cmp r7, #0
	bne _021E9512
	cmp r0, #0
	bne _021E9512
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9512:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021E94BC

	thumb_func_start ov14_021E9518
ov14_021E9518: @ 0x021E9518
	push {r3, lr}
	bl ov14_021E80A8
	cmp r0, #0
	beq _021E9526
	movs r0, #1
	pop {r3, pc}
_021E9526:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021E9518

	thumb_func_start ov14_021E952C
ov14_021E952C: @ 0x021E952C
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E80A8
	cmp r0, #0
	bne _021E953C
	movs r0, #0
	pop {r4, pc}
_021E953C:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov14_021E952C

	thumb_func_start ov14_021E954C
ov14_021E954C: @ 0x021E954C
	ldr r3, _021E9550 @ =ov14_021E9518
	bx r3
	.align 2, 0
_021E9550: .4byte ov14_021E9518
	thumb_func_end ov14_021E954C

	thumb_func_start ov14_021E9554
ov14_021E9554: @ 0x021E9554
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02019978
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xf
	bl FUN_02019978
	adds r6, r0, #0
	adds r0, r5, #0
	movs r1, #8
	bl ov14_021F47B8
	cmp r4, #0
	bne _021E958C
	cmp r6, #0
	bne _021E958C
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E958C:
	movs r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021E9554

	thumb_func_start ov14_021E9590
ov14_021E9590: @ 0x021E9590
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02019978
	movs r1, #7
	adds r5, r0, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov14_021F47B8
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E9590

	thumb_func_start ov14_021E95B4
ov14_021E95B4: @ 0x021E95B4
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldr r3, _021E95C4 @ =FUN_02019978
	movs r1, #0xa
	bx r3
	nop
_021E95C4: .4byte FUN_02019978
	thumb_func_end ov14_021E95B4

	thumb_func_start ov14_021E95C8
ov14_021E95C8: @ 0x021E95C8
	push {r4, lr}
	ldr r4, [r0, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E95D8
	cmp r1, #1
	beq _021E95E8
	b _021E95FE
_021E95D8:
	bl ov14_021E9434
	cmp r0, #0
	bne _021E95FE
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E95FE
_021E95E8:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xc
	bl FUN_02019978
	cmp r0, #0
	bne _021E95FE
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r4, pc}
_021E95FE:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E95C8

	thumb_func_start ov14_021E9604
ov14_021E9604: @ 0x021E9604
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldr r3, _021E9614 @ =FUN_02019978
	movs r1, #0xc
	bx r3
	nop
_021E9614: .4byte FUN_02019978
	thumb_func_end ov14_021E9604

	thumb_func_start ov14_021E9618
ov14_021E9618: @ 0x021E9618
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xc
	bl FUN_02019978
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #6
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #7
	bl FUN_02019978
	cmp r4, #0
	bne _021E965A
	cmp r6, #0
	bne _021E965A
	cmp r0, #0
	bne _021E965A
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E965A:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021E9618

	thumb_func_start ov14_021E9660
ov14_021E9660: @ 0x021E9660
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E9672
	cmp r1, #1
	beq _021E9682
	b _021E96A2
_021E9672:
	bl ov14_021E9618
	cmp r0, #0
	bne _021E96A2
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E96A2
_021E9682:
	adds r0, r4, #0
	movs r1, #8
	bl ov14_021F44B4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xd
	bl FUN_02019978
	cmp r0, #0
	bne _021E96A2
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E96A2:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E9660

	thumb_func_start ov14_021E96A8
ov14_021E96A8: @ 0x021E96A8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #7
	ldr r0, [r4, #0x34]
	mvns r1, r1
	bl ov14_021F44B4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xd
	bl FUN_02019978
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021E96A8

	thumb_func_start ov14_021E96C8
ov14_021E96C8: @ 0x021E96C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r6, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_02019B08
	adds r5, r0, #0
	ldrh r0, [r6, #0x10]
	cmp r0, #0xa
	bls _021E96E6
	b _021E988A
_021E96E6:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E96F2: @ jump table
	.2byte _021E9708 - _021E96F2 - 2 @ case 0
	.2byte _021E972E - _021E96F2 - 2 @ case 1
	.2byte _021E9776 - _021E96F2 - 2 @ case 2
	.2byte _021E97DA - _021E96F2 - 2 @ case 3
	.2byte _021E97FC - _021E96F2 - 2 @ case 4
	.2byte _021E9844 - _021E96F2 - 2 @ case 5
	.2byte _021E988A - _021E96F2 - 2 @ case 6
	.2byte _021E988A - _021E96F2 - 2 @ case 7
	.2byte _021E988A - _021E96F2 - 2 @ case 8
	.2byte _021E988A - _021E96F2 - 2 @ case 9
	.2byte _021E97BC - _021E96F2 - 2 @ case 10
_021E9708:
	movs r2, #0x20
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r0, #3
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #9
	bl FUN_0201C4EC
	b _021E988A
_021E972E:
	movs r2, #0x20
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #8
	bl FUN_0201C4EC
	movs r2, #0x20
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r0, #6
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #0xa
	bl FUN_0201C4EC
	b _021E988A
_021E9776:
	movs r2, #0x20
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r3, #7
	str r3, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201C4EC
	movs r2, #0x20
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r0, #5
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #0xa
	bl FUN_0201C4EC
	b _021E988A
_021E97BC:
	movs r0, #4
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0xb
	str r0, [sp, #8]
	movs r1, #0
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	adds r3, r1, #0
	bl FUN_0201C8C4
_021E97DA:
	movs r2, #0x20
	str r2, [sp]
	movs r0, #7
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #6
	bl FUN_0201C4EC
	b _021E988A
_021E97FC:
	movs r2, #0x20
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #5
	bl FUN_0201C4EC
	movs r2, #0x20
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r0, #5
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #0xc
	bl FUN_0201C4EC
	b _021E988A
_021E9844:
	movs r2, #0x20
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #4
	bl FUN_0201C4EC
	movs r2, #0x20
	str r2, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r0, #5
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	movs r3, #0xd
	bl FUN_0201C4EC
_021E988A:
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201EFBC
	ldrh r0, [r6, #0x10]
	cmp r0, #0xa
	bne _021E98A2
	movs r0, #0
	add sp, #0x1c
	strh r0, [r6, #0x10]
	pop {r3, r4, r5, r6, pc}
_021E98A2:
	adds r0, r0, #1
	strh r0, [r6, #0x10]
	movs r0, #1
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov14_021E96C8

	thumb_func_start ov14_021E98AC
ov14_021E98AC: @ 0x021E98AC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	movs r1, #0
	ldrh r0, [r4, #0x10]
	adds r2, r1, #0
	adds r3, r1, #0
	adds r0, r0, #6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	bl FUN_0201C8C4
	ldrh r1, [r4, #0x10]
	movs r0, #0xc
	subs r0, r0, r1
	movs r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x34]
	adds r2, r1, #0
	ldr r0, [r0, #0x14]
	adds r3, r1, #0
	bl FUN_0201C8C4
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x14]
	bl FUN_0201EFBC
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	bne _021E9914
	movs r0, #0
	add sp, #0x10
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E9914:
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E98AC

	thumb_func_start ov14_021E9920
ov14_021E9920: @ 0x021E9920
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021E9932
	cmp r0, #1
	beq _021E9956
	b _021E996C
_021E9932:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_02019978
	cmp r0, #0
	bne _021E996C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85BC
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E996C
_021E9956:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xe
	bl FUN_02019978
	cmp r0, #0
	bne _021E996C
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E996C:
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E9920

	thumb_func_start ov14_021E9970
ov14_021E9970: @ 0x021E9970
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xf
	bl FUN_02019978
	cmp r0, #0
	bne _021E999C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xe
	bl FUN_02019978
	cmp r0, #0
	bne _021E999C
	movs r0, #0
	pop {r4, pc}
_021E999C:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov14_021E9970

	thumb_func_start ov14_021E99A0
ov14_021E99A0: @ 0x021E99A0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021E99B2
	cmp r0, #1
	beq _021E99D6
	b _021E99EC
_021E99B2:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xe
	bl FUN_02019978
	cmp r0, #0
	bne _021E99EC
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E99EC
_021E99D6:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_02019978
	cmp r0, #0
	bne _021E99EC
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E99EC:
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021E99A0

	thumb_func_start ov14_021E99F0
ov14_021E99F0: @ 0x021E99F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xc
	bl FUN_02019978
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r4, #0
	bne _021E9A1E
	cmp r0, #0
	bne _021E9A1E
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E9A1E:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021E99F0

	thumb_func_start ov14_021E9A24
ov14_021E9A24: @ 0x021E9A24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r5, [r4, #0x34]
	ldrh r0, [r5, #0x10]
	cmp r0, #1
	bhi _021E9A52
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	add r2, sp, #4
	adds r1, r5, r0
	ldr r0, _021E9C78 @ =0x00004094
	ldrb r0, [r1, r0]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #4
	adds r1, #2
	bl FUN_0200DE44
_021E9A52:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov14_021E813C
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	str r0, [sp]
	ldrh r0, [r5, #0x10]
	cmp r0, #7
	bls _021E9A80
	b _021E9C70
_021E9A80:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E9A8C: @ jump table
	.2byte _021E9A9C - _021E9A8C - 2 @ case 0
	.2byte _021E9AA0 - _021E9A8C - 2 @ case 1
	.2byte _021E9BE2 - _021E9A8C - 2 @ case 2
	.2byte _021E9BE2 - _021E9A8C - 2 @ case 3
	.2byte _021E9BE2 - _021E9A8C - 2 @ case 4
	.2byte _021E9C14 - _021E9A8C - 2 @ case 5
	.2byte _021E9C44 - _021E9A8C - 2 @ case 6
	.2byte _021E9C4E - _021E9A8C - 2 @ case 7
_021E9A9C:
	movs r0, #1
	strh r0, [r5, #0x10]
_021E9AA0:
	ldr r0, [r4, #0x34]
	ldr r1, _021E9C7C @ =0x0000044A
	ldrb r2, [r0, r1]
	cmp r2, #1
	bne _021E9ABA
	cmp r6, #0
	bne _021E9ABA
	movs r2, #2
	strb r2, [r0, r1]
	adds r0, r4, #0
	movs r1, #0x28
	bl ov14_021F69F0
_021E9ABA:
	add r0, sp, #0xc
	add r1, sp, #8
	bl FUN_02025364
	cmp r0, #0
	ldr r0, [r4, #0x34]
	bne _021E9B68
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	add r3, sp, #4
	adds r2, r0, r1
	ldr r1, _021E9C78 @ =0x00004094
	ldrb r1, [r2, r1]
	movs r2, #0
	ldrsh r2, [r3, r2]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r3, r1]
	bl FUN_0200DDB8
	ldr r1, [r4, #0x34]
	ldr r0, _021E9C7C @ =0x0000044A
	movs r2, #0xff
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _021E9B0E
	ldr r2, _021E9C80 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E7960
	adds r2, r0, #0
_021E9B0E:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E6F3C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E70B0
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021E9B44
	movs r0, #5
	strh r0, [r5, #0x10]
	b _021E9C70
_021E9B44:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7FEC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	movs r0, #2
	strh r0, [r5, #0x10]
	b _021E9C70
_021E9B68:
	ldr r1, _021E9C7C @ =0x0000044A
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021E9B9C
	cmp r7, #0
	bne _021E9B9C
	ldr r1, [sp]
	cmp r1, #0
	bne _021E9B9C
	ldr r2, [sp, #0xc]
	cmp r2, #0x10
	blo _021E9B8A
	ldr r1, [sp, #8]
	cmp r1, #0x30
	blo _021E9B8A
	cmp r2, #0x68
	blo _021E9B9C
_021E9B8A:
	ldr r1, _021E9C7C @ =0x0000044A
	movs r2, #1
	strb r2, [r0, r1]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7FB8
_021E9B9C:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	adds r2, r0, r1
	ldr r1, _021E9C78 @ =0x00004094
	ldrb r1, [r2, r1]
	ldr r2, [sp, #8]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	lsls r2, r2, #0x10
	ldr r0, [r1, r0]
	ldr r1, [sp, #0xc]
	asrs r2, r2, #0x10
	subs r2, #8
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #0
	bl ov14_021F4174
	ldr r2, [sp, #0xc]
	ldr r1, [r4, #0x34]
	ldr r0, _021E9C80 @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp, #8]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021E9C70
_021E9BE2:
	adds r0, r4, #0
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E9C70
	cmp r6, #0
	bne _021E9C70
	cmp r7, #0
	bne _021E9C70
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl ov14_021E7148
	adds r0, r4, #0
	bl ov14_021F4174
	ldr r2, [r4, #0x34]
	ldr r1, _021E9C84 @ =0x000040C4
	adds r0, r4, #0
	ldr r1, [r2, r1]
	bl ov14_021F40E8
	movs r0, #7
	strh r0, [r5, #0x10]
	b _021E9C70
_021E9C14:
	adds r0, r4, #0
	bl ov14_021E66F4
	cmp r0, #0
	bne _021E9C70
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl ov14_021E7148
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
	movs r0, #0xff
	adds r4, #0x21
	strb r0, [r4]
	movs r0, #6
	strh r0, [r5, #0x10]
	b _021E9C70
_021E9C44:
	cmp r6, #0
	bne _021E9C70
	movs r0, #7
	strh r0, [r5, #0x10]
	b _021E9C70
_021E9C4E:
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	ldr r2, [r4, #0x34]
	ldr r1, _021E9C7C @ =0x0000044A
	movs r0, #0
	strb r0, [r2, r1]
	add sp, #0x10
	strh r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021E9C70:
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9C78: .4byte 0x00004094
_021E9C7C: .4byte 0x0000044A
_021E9C80: .4byte 0x000040B8
_021E9C84: .4byte 0x000040C4
	thumb_func_end ov14_021E9A24

	thumb_func_start ov14_021E9C88
ov14_021E9C88: @ 0x021E9C88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r5, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov14_021E8514
	str r0, [sp]
	adds r0, r4, #0
	bl ov14_021E80A8
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	adds r7, r0, #0
	ldrh r0, [r5, #0x10]
	cmp r0, #8
	bls _021E9CBC
	b _021E9F04
_021E9CBC:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E9CC8: @ jump table
	.2byte _021E9CDA - _021E9CC8 - 2 @ case 0
	.2byte _021E9CDE - _021E9CC8 - 2 @ case 1
	.2byte _021E9E30 - _021E9CC8 - 2 @ case 2
	.2byte _021E9E4A - _021E9CC8 - 2 @ case 3
	.2byte _021E9E4A - _021E9CC8 - 2 @ case 4
	.2byte _021E9E8C - _021E9CC8 - 2 @ case 5
	.2byte _021E9EBA - _021E9CC8 - 2 @ case 6
	.2byte _021E9ED8 - _021E9CC8 - 2 @ case 7
	.2byte _021E9EE2 - _021E9CC8 - 2 @ case 8
_021E9CDA:
	movs r0, #1
	strh r0, [r5, #0x10]
_021E9CDE:
	ldr r0, [r4, #0x34]
	ldr r1, _021E9F0C @ =0x0000044A
	ldrb r2, [r0, r1]
	cmp r2, #1
	bne _021E9CF8
	cmp r6, #0
	bne _021E9CF8
	movs r2, #2
	strb r2, [r0, r1]
	adds r0, r4, #0
	movs r1, #0x28
	bl ov14_021F69F0
_021E9CF8:
	add r0, sp, #0xc
	add r1, sp, #8
	bl FUN_02025364
	cmp r0, #0
	ldr r0, _021E9F0C @ =0x0000044A
	bne _021E9D78
	ldr r1, [r4, #0x34]
	movs r2, #0xff
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _021E9D28
	ldr r2, _021E9F10 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _021E9F14 @ =0x021F7C08
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E79AC
	adds r2, r0, #0
_021E9D28:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E7034
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E70B0
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	blo _021E9D5E
	movs r0, #5
	strh r0, [r5, #0x10]
	b _021E9F04
_021E9D5E:
	ldr r1, [r4, #0x34]
	ldr r0, _021E9F0C @ =0x0000044A
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _021E9D72
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7F4C
_021E9D72:
	movs r0, #2
	strh r0, [r5, #0x10]
	b _021E9F04
_021E9D78:
	ldr r1, [r4, #0x34]
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _021E9DEA
	ldr r0, [sp]
	cmp r0, #0
	bne _021E9DEA
	cmp r7, #0
	bne _021E9DEA
	adds r0, r4, #0
	adds r3, r4, #0
	adds r0, #0x21
	adds r3, #0x22
	add r1, sp, #4
	ldrb r0, [r0]
	ldrb r3, [r3]
	adds r1, #2
	add r2, sp, #4
	bl ov14_021F2F88
	add r1, sp, #4
	movs r0, #2
	ldrsh r3, [r1, r0]
	ldr r2, [sp, #0xc]
	adds r0, r3, #0
	subs r0, #0x10
	cmp r2, r0
	blo _021E9DCA
	adds r3, #0x10
	cmp r2, r3
	bhs _021E9DCA
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldr r1, [sp, #8]
	adds r0, r2, #0
	subs r0, #0x10
	cmp r1, r0
	blo _021E9DCA
	adds r2, #0x10
	cmp r1, r2
	blo _021E9DEA
_021E9DCA:
	ldr r1, [r4, #0x34]
	ldr r0, _021E9F0C @ =0x0000044A
	movs r2, #1
	strb r2, [r1, r0]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7ED0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
_021E9DEA:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	adds r2, r0, r1
	ldr r1, _021E9F18 @ =0x00004094
	ldrb r1, [r2, r1]
	ldr r2, [sp, #8]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	lsls r2, r2, #0x10
	ldr r0, [r1, r0]
	ldr r1, [sp, #0xc]
	asrs r2, r2, #0x10
	subs r2, #8
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #0
	bl ov14_021F4174
	ldr r2, [sp, #0xc]
	ldr r1, [r4, #0x34]
	ldr r0, _021E9F10 @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp, #8]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021E9F04
_021E9E30:
	cmp r6, #0
	bne _021E9E4A
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	movs r0, #3
	strh r0, [r5, #0x10]
_021E9E4A:
	adds r0, r4, #0
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E9E80
	ldrh r0, [r5, #0x10]
	cmp r0, #4
	bne _021E9E80
	ldr r0, [sp]
	cmp r0, #0
	bne _021E9E80
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl ov14_021E7148
	adds r0, r4, #0
	bl ov14_021F4174
	ldr r2, [r4, #0x34]
	ldr r1, _021E9F1C @ =0x000040C4
	adds r0, r4, #0
	ldr r1, [r2, r1]
	bl ov14_021F40E8
	movs r0, #8
	strh r0, [r5, #0x10]
	b _021E9F04
_021E9E80:
	ldrh r0, [r5, #0x10]
	cmp r0, #3
	bne _021E9F04
	movs r0, #4
	strh r0, [r5, #0x10]
	b _021E9F04
_021E9E8C:
	adds r0, r4, #0
	bl ov14_021E65C4
	cmp r0, #0
	bne _021E9F04
	ldr r1, [r5, #0xc]
	adds r0, r4, #0
	bl ov14_021E7148
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7F4C
	ldrh r0, [r5, #0x10]
	adds r0, r0, #1
	strh r0, [r5, #0x10]
	b _021E9F04
_021E9EBA:
	cmp r6, #0
	bne _021E9F04
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldrh r0, [r5, #0x10]
	adds r0, r0, #1
	strh r0, [r5, #0x10]
	b _021E9F04
_021E9ED8:
	cmp r7, #0
	bne _021E9F04
	movs r0, #8
	strh r0, [r5, #0x10]
	b _021E9F04
_021E9EE2:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	ldr r2, [r4, #0x34]
	ldr r1, _021E9F0C @ =0x0000044A
	movs r0, #0
	strb r0, [r2, r1]
	add sp, #0x10
	strh r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021E9F04:
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9F0C: .4byte 0x0000044A
_021E9F10: .4byte 0x000040B8
_021E9F14: .4byte 0x021F7C08
_021E9F18: .4byte 0x00004094
_021E9F1C: .4byte 0x000040C4
	thumb_func_end ov14_021E9C88

	thumb_func_start ov14_021E9F20
ov14_021E9F20: @ 0x021E9F20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r4, [r1, #0xc]
	ldr r0, [r1, r0]
	movs r1, #0xf
	bl FUN_02019978
	ldr r1, [r4, #4]
	lsrs r2, r1, #2
	bne _021E9F98
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldrb r1, [r4]
	ldrb r2, [r4, #1]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	ldr r1, _021EA060 @ =0x0000044B
	ldrb r1, [r0, r1]
	cmp r1, #1
	bne _021E9F94
	ldr r1, [r5]
	ldr r1, [r1, #8]
	cmp r1, #3
	bne _021E9F72
	ldrb r2, [r4, #1]
	movs r1, #0xca
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	adds r2, #8
	lsls r2, r2, #0x10
	ldrb r1, [r4]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	b _021E9F94
_021E9F72:
	adds r5, #0x21
	ldrb r1, [r5]
	adds r2, r0, r1
	ldr r1, _021EA064 @ =0x00004094
	ldrb r1, [r2, r1]
	ldrb r2, [r4, #1]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r2, r2, #4
	lsls r2, r2, #0x10
	ldrb r1, [r4]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
_021E9F94:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E9F98:
	movs r0, #3
	ands r1, r0
	subs r0, r2, #1
	lsls r0, r0, #2
	orrs r0, r1
	str r0, [r4, #4]
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	ldr r0, [r4, #4]
	add r1, sp, #0
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bne _021E9FCA
	movs r0, #2
	ldrsh r2, [r1, r0]
	ldrb r0, [r4, #2]
	adds r0, r2, r0
	b _021E9FD2
_021E9FCA:
	movs r0, #2
	ldrsh r2, [r1, r0]
	ldrb r0, [r4, #2]
	subs r0, r2, r0
_021E9FD2:
	strh r0, [r1, #2]
	ldr r0, [r4, #4]
	add r1, sp, #0
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	bne _021E9FE8
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r0, [r4, #3]
	adds r0, r2, r0
	b _021E9FF0
_021E9FE8:
	movs r0, #0
	ldrsh r2, [r1, r0]
	ldrb r0, [r4, #3]
	subs r0, r2, r0
_021E9FF0:
	strh r0, [r1]
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	ldr r1, _021EA060 @ =0x0000044B
	ldrb r1, [r0, r1]
	cmp r1, #1
	bne _021EA05C
	ldr r1, [r5]
	add r3, sp, #0
	ldr r1, [r1, #8]
	cmp r1, #3
	bne _021EA036
	movs r2, #0
	movs r1, #0xca
	ldrsh r2, [r3, r2]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #2
	adds r2, #8
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	b _021EA05C
_021EA036:
	adds r5, #0x21
	ldrb r1, [r5]
	adds r2, r0, r1
	ldr r1, _021EA064 @ =0x00004094
	ldrb r1, [r2, r1]
	movs r2, #0
	ldrsh r2, [r3, r2]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	adds r2, r2, #4
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
_021EA05C:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EA060: .4byte 0x0000044B
_021EA064: .4byte 0x00004094
	thumb_func_end ov14_021E9F20

	thumb_func_start ov14_021EA068
ov14_021EA068: @ 0x021EA068
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x34]
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	beq _021EA07A
	cmp r0, #1
	beq _021EA092
	b _021EA0B2
_021EA07A:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r0, #0
	bne _021EA0B2
	ldrh r0, [r5, #0x10]
	adds r0, r0, #1
	strh r0, [r5, #0x10]
	b _021EA0B2
_021EA092:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov14_021E8514
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov14_021E9F20
	cmp r4, #0
	bne _021EA0B2
	cmp r0, #0
	bne _021EA0B2
	movs r0, #0
	strh r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
_021EA0B2:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021EA068

	thumb_func_start ov14_021EA0B8
ov14_021EA0B8: @ 0x021EA0B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021EA0CA
	cmp r1, #1
	beq _021EA10A
	b _021EA12A
_021EA0CA:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #8
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	adds r7, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r6, #0
	bne _021EA12A
	cmp r7, #0
	bne _021EA12A
	cmp r0, #0
	bne _021EA12A
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EA12A
_021EA10A:
	bl ov14_021E9F20
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	cmp r6, #0
	bne _021EA12A
	cmp r0, #0
	bne _021EA12A
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021EA12A:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021EA0B8

	thumb_func_start ov14_021EA130
ov14_021EA130: @ 0x021EA130
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, [r6, #0x34]
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	beq _021EA142
	cmp r0, #1
	beq _021EA164
	b _021EA17A
_021EA142:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov14_021E8514
	adds r4, r0, #0
	adds r0, r6, #0
	bl ov14_021E9F20
	cmp r4, #0
	bne _021EA17A
	cmp r0, #0
	bne _021EA17A
	ldrh r0, [r5, #0x10]
	adds r0, r0, #1
	strh r0, [r5, #0x10]
	b _021EA17A
_021EA164:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r0, #0
	bne _021EA17A
	movs r0, #0
	strh r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
_021EA17A:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021EA130

	thumb_func_start ov14_021EA180
ov14_021EA180: @ 0x021EA180
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021EA192
	cmp r1, #1
	beq _021EA1AE
	b _021EA1EC
_021EA192:
	bl ov14_021E9F20
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov14_021E9434
	cmp r6, #0
	bne _021EA1EC
	cmp r0, #0
	bne _021EA1EC
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EA1EC
_021EA1AE:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #8
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	adds r7, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r6, #0
	bne _021EA1EC
	cmp r7, #0
	bne _021EA1EC
	cmp r0, #0
	bne _021EA1EC
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021EA1EC:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021EA180

	thumb_func_start ov14_021EA1F0
ov14_021EA1F0: @ 0x021EA1F0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0xa
	bl ov14_021F29E4
	movs r0, #0x32
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	add r3, sp, #0
	adds r2, r0, r1
	ldr r1, _021EA250 @ =0x00004094
	ldrb r1, [r2, r1]
	movs r2, #0
	ldrsh r2, [r3, r2]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	adds r2, r2, #4
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r0, [r4, #0x34]
	adds r4, #0x21
	ldrb r1, [r4]
	movs r2, #0
	bl ov14_021F3190
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EA250: .4byte 0x00004094
	thumb_func_end ov14_021EA1F0

	thumb_func_start ov14_021EA254
ov14_021EA254: @ 0x021EA254
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r4, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_02019978
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	bhi _021EA36E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EA27A: @ jump table
	.2byte _021EA282 - _021EA27A - 2 @ case 0
	.2byte _021EA292 - _021EA27A - 2 @ case 1
	.2byte _021EA2DA - _021EA27A - 2 @ case 2
	.2byte _021EA2EA - _021EA27A - 2 @ case 3
_021EA282:
	movs r1, #9
	ldr r0, [r5, #0x34]
	adds r2, r1, #0
	bl ov14_021F29E4
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021EA292:
	ldrh r0, [r4, #0x12]
	cmp r0, #4
	bne _021EA2A4
	movs r0, #0
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EA36E
_021EA2A4:
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0x32
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	adds r2, r2, #2
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
	b _021EA36E
_021EA2DA:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xa
	bl ov14_021F29E4
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021EA2EA:
	ldrh r0, [r4, #0x12]
	cmp r0, #4
	bne _021EA2FA
	movs r0, #0
	strh r0, [r4, #0x12]
	add sp, #4
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, r6, pc}
_021EA2FA:
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0x32
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	subs r2, r2, #2
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	adds r2, r0, r1
	ldr r1, _021EA374 @ =0x00004094
	ldrb r1, [r2, r1]
	add r2, sp, #0
	lsls r6, r1, #2
	adds r1, r0, r6
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	bl FUN_0200DE44
	ldr r0, [r5, #0x34]
	add r3, sp, #0
	movs r2, #0
	adds r1, r0, r6
	movs r0, #0xbf
	ldrsh r2, [r3, r2]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	subs r2, r2, #2
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
_021EA36E:
	movs r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021EA374: .4byte 0x00004094
	thumb_func_end ov14_021EA254

	thumb_func_start ov14_021EA378
ov14_021EA378: @ 0x021EA378
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r4, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_02019978
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021EA396
	cmp r0, #1
	beq _021EA3DC
	b _021EA3FE
_021EA396:
	movs r1, #9
	ldr r0, [r5, #0x34]
	adds r2, r1, #0
	bl ov14_021F29E4
	ldr r1, [r5, #0x34]
	ldr r0, _021EA404 @ =0x0000044C
	ldrb r6, [r1, r0]
	cmp r6, #0x25
	blo _021EA3B0
	cmp r6, #0x2a
	bhi _021EA3B0
	adds r6, #0x5b
_021EA3B0:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r2, r6, #0
	bl ov14_021E6CF8
	movs r0, #0x80
	tst r0, r6
	bne _021EA3D6
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov14_021E70B0
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
_021EA3D6:
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021EA3DC:
	adds r0, r5, #0
	bl ov14_021E65C4
	cmp r0, #0
	bne _021EA3FE
	ldr r1, [r4, #0xc]
	adds r0, r5, #0
	bl ov14_021E7148
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r4, r5, r6, pc}
_021EA3FE:
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_021EA404: .4byte 0x0000044C
	thumb_func_end ov14_021EA378

	thumb_func_start ov14_021EA408
ov14_021EA408: @ 0x021EA408
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021EA41E
	cmp r1, #1
	beq _021EA448
	cmp r1, #2
	beq _021EA48A
	b _021EA4C0
_021EA41E:
	ldr r0, _021EA4C4 @ =0x000088C8
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021EA442
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
_021EA442:
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021EA448:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	adds r7, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r6, #0
	bne _021EA4C0
	cmp r7, #0
	bne _021EA4C0
	cmp r0, #0
	bne _021EA4C0
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EA4C0
_021EA48A:
	bl ov14_021E9F20
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8514
	cmp r6, #0
	bne _021EA4C0
	cmp r0, #0
	bne _021EA4C0
	ldr r0, [r5, #0x34]
	ldr r1, _021EA4C4 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021EA4BA
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	bl ov14_021F3B3C
_021EA4BA:
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021EA4C0:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA4C4: .4byte 0x000088C8
	thumb_func_end ov14_021EA408

	thumb_func_start ov14_021EA4C8
ov14_021EA4C8: @ 0x021EA4C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r5, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov14_021E8514
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #8
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	ldrh r0, [r5, #0x10]
	cmp r0, #0xa
	bls _021EA50E
	b _021EA664
_021EA50E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EA51A: @ jump table
	.2byte _021EA530 - _021EA51A - 2 @ case 0
	.2byte _021EA56A - _021EA51A - 2 @ case 1
	.2byte _021EA588 - _021EA51A - 2 @ case 2
	.2byte _021EA632 - _021EA51A - 2 @ case 3
	.2byte _021EA664 - _021EA51A - 2 @ case 4
	.2byte _021EA664 - _021EA51A - 2 @ case 5
	.2byte _021EA664 - _021EA51A - 2 @ case 6
	.2byte _021EA664 - _021EA51A - 2 @ case 7
	.2byte _021EA664 - _021EA51A - 2 @ case 8
	.2byte _021EA664 - _021EA51A - 2 @ case 9
	.2byte _021EA642 - _021EA51A - 2 @ case 10
_021EA530:
	ldr r0, [r4, #0x34]
	ldr r1, _021EA66C @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021EA55A
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #1
	strh r0, [r5, #0x10]
	b _021EA664
_021EA55A:
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl ov14_021E8434
	movs r0, #0xa
	strh r0, [r5, #0x10]
	b _021EA664
_021EA56A:
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	beq _021EA664
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B3C
	movs r0, #2
	strh r0, [r5, #0x10]
_021EA588:
	add r0, sp, #4
	add r1, sp, #0
	bl FUN_02025364
	cmp r0, #0
	bne _021EA608
	ldr r1, [r4, #0x34]
	ldr r2, _021EA670 @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E7960
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	cmp r6, #0xff
	bne _021EA5BC
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r6, [r0]
	b _021EA5D4
_021EA5BC:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov14_021E6AA0
	cmp r0, #0
	bne _021EA5D4
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r6, [r0]
_021EA5D4:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r6, r0
	ldr r1, [r4, #0x34]
	bne _021EA5EC
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	b _021EA5F6
_021EA5EC:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
_021EA5F6:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #2
	bl ov14_021E7AD4
	movs r0, #3
	strh r0, [r5, #0x10]
	b _021EA664
_021EA608:
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x34]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov14_021F395C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B5C
	ldr r2, [sp, #4]
	ldr r1, [r4, #0x34]
	ldr r0, _021EA670 @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021EA664
_021EA632:
	adds r0, r4, #0
	bl ov14_021E7B8C
	cmp r0, #0
	bne _021EA664
	movs r0, #0xa
	strh r0, [r5, #0x10]
	b _021EA664
_021EA642:
	cmp r6, #0
	bne _021EA664
	ldr r0, [r4, #0x34]
	ldr r1, _021EA66C @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021EA65C
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B3C
_021EA65C:
	movs r0, #0
	add sp, #8
	strh r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021EA664:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA66C: .4byte 0x000088C8
_021EA670: .4byte 0x000040B8
	thumb_func_end ov14_021EA4C8

	thumb_func_start ov14_021EA674
ov14_021EA674: @ 0x021EA674
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021EA68A
	cmp r0, #1
	beq _021EA6AA
	cmp r0, #2
	beq _021EA6C8
	b _021EA720
_021EA68A:
	ldr r0, _021EA724 @ =0x000088C8
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _021EA6A4
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
_021EA6A4:
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021EA6AA:
	adds r0, r5, #0
	bl ov14_021E9F20
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov14_021E9434
	cmp r6, #0
	bne _021EA720
	cmp r0, #0
	bne _021EA720
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EA720
_021EA6C8:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #8
	bl FUN_02019978
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_02019978
	adds r7, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	cmp r6, #0
	bne _021EA720
	cmp r7, #0
	bne _021EA720
	cmp r0, #0
	bne _021EA720
	ldr r0, [r5, #0x34]
	ldr r1, _021EA724 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021EA71A
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
_021EA71A:
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021EA720:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA724: .4byte 0x000088C8
	thumb_func_end ov14_021EA674

	thumb_func_start ov14_021EA728
ov14_021EA728: @ 0x021EA728
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021EA73A
	cmp r1, #1
	beq _021EA766
	b _021EA774
_021EA73A:
	adds r0, r4, #0
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	beq _021EA774
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	ldr r0, [r4, #0xc]
	movs r3, #2
	ldrh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x21
	strb r2, [r0]
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021E7AD4
	movs r0, #1
	strh r0, [r4, #0x10]
	b _021EA774
_021EA766:
	bl ov14_021E7B8C
	cmp r0, #0
	bne _021EA774
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021EA774:
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021EA728

	thumb_func_start ov14_021EA778
ov14_021EA778: @ 0x021EA778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r5, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0xe
	bl FUN_02019978
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xf
	bl FUN_02019978
	ldrh r0, [r5, #0x10]
	cmp r0, #6
	bhi _021EA7E8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EA7AC: @ jump table
	.2byte _021EA7BA - _021EA7AC - 2 @ case 0
	.2byte _021EA7DC - _021EA7AC - 2 @ case 1
	.2byte _021EA7FE - _021EA7AC - 2 @ case 2
	.2byte _021EA8A6 - _021EA7AC - 2 @ case 3
	.2byte _021EA8C8 - _021EA7AC - 2 @ case 4
	.2byte _021EA8E8 - _021EA7AC - 2 @ case 5
	.2byte _021EA90C - _021EA7AC - 2 @ case 6
_021EA7BA:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #1
	strh r0, [r5, #0x10]
	b _021EA914
_021EA7DC:
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	beq _021EA7EA
_021EA7E8:
	b _021EA914
_021EA7EA:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B3C
	movs r0, #2
	strh r0, [r5, #0x10]
	b _021EA914
_021EA7FE:
	add r0, sp, #4
	add r1, sp, #0
	bl FUN_02025364
	cmp r0, #0
	bne _021EA87C
	ldr r1, [r4, #0x34]
	ldr r2, _021EA91C @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E7960
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xff
	bne _021EA844
	ldr r1, [r4, #0x34]
	ldr r2, _021EA91C @ =0x000040B8
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _021EA920 @ =0x021F7C08
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E79AC
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_021EA844:
	adds r7, r6, #0
	cmp r6, #0xff
	bne _021EA852
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r6, [r0]
	b _021EA86A
_021EA852:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov14_021E6AA0
	cmp r0, #0
	bne _021EA86A
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r6, [r0]
_021EA86A:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #2
	bl ov14_021E7AD4
	movs r0, #3
	strh r0, [r5, #0x10]
	b _021EA914
_021EA87C:
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x34]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov14_021F395C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B5C
	ldr r2, [sp, #4]
	ldr r1, [r4, #0x34]
	ldr r0, _021EA91C @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021EA914
_021EA8A6:
	adds r0, r4, #0
	bl ov14_021E7B8C
	cmp r0, #0
	bne _021EA914
	ldr r0, _021EA924 @ =0x000005EA
	bl FUN_0200604C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
	movs r0, #4
	strh r0, [r5, #0x10]
	b _021EA914
_021EA8C8:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	movs r0, #5
	strh r0, [r5, #0x10]
	b _021EA914
_021EA8E8:
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EA914
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	movs r0, #6
	strh r0, [r5, #0x10]
	b _021EA914
_021EA90C:
	movs r0, #0
	add sp, #8
	strh r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021EA914:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA91C: .4byte 0x000040B8
_021EA920: .4byte 0x021F7C08
_021EA924: .4byte 0x000005EA
	thumb_func_end ov14_021EA778

	thumb_func_start ov14_021EA928
ov14_021EA928: @ 0x021EA928
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r1, [r4, #0x10]
	cmp r1, #6
	bhi _021EA9FC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021EA940: @ jump table
	.2byte _021EA94E - _021EA940 - 2 @ case 0
	.2byte _021EA970 - _021EA940 - 2 @ case 1
	.2byte _021EA98A - _021EA940 - 2 @ case 2
	.2byte _021EA9A6 - _021EA940 - 2 @ case 3
	.2byte _021EA9BA - _021EA940 - 2 @ case 4
	.2byte _021EA9D2 - _021EA940 - 2 @ case 5
	.2byte _021EA9F6 - _021EA940 - 2 @ case 6
_021EA94E:
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #1
	strh r0, [r4, #0x10]
	b _021EA9FC
_021EA970:
	adds r0, r4, #0
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EA9FC
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F391C
	movs r0, #2
	strh r0, [r4, #0x10]
	b _021EA9FC
_021EA98A:
	adds r1, r5, #0
	ldr r2, [r4, #0xc]
	adds r1, #0x21
	ldrb r1, [r1]
	ldrh r2, [r2]
	adds r5, #0x21
	movs r3, #2
	strb r2, [r5]
	adds r2, r1, #0
	bl ov14_021E7AD4
	movs r0, #3
	strh r0, [r4, #0x10]
	b _021EA9FC
_021EA9A6:
	bl ov14_021E7B8C
	cmp r0, #0
	bne _021EA9FC
	ldr r0, _021EAA00 @ =0x000005EA
	bl FUN_0200604C
	movs r0, #4
	strh r0, [r4, #0x10]
	b _021EA9FC
_021EA9BA:
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #5
	strh r0, [r4, #0x10]
	b _021EA9FC
_021EA9D2:
	adds r0, r4, #0
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EA9FC
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F391C
	movs r0, #6
	strh r0, [r4, #0x10]
	b _021EA9FC
_021EA9F6:
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021EA9FC:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EAA00: .4byte 0x000005EA
	thumb_func_end ov14_021EA928

	thumb_func_start ov14_021EAA04
ov14_021EAA04: @ 0x021EAA04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r4, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_02019978
	ldrh r0, [r4, #0x10]
	cmp r0, #5
	bls _021EAA1E
	b _021EAB4E
_021EAA1E:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EAA2A: @ jump table
	.2byte _021EAA36 - _021EAA2A - 2 @ case 0
	.2byte _021EAA5A - _021EAA2A - 2 @ case 1
	.2byte _021EAA76 - _021EAA2A - 2 @ case 2
	.2byte _021EAA86 - _021EAA2A - 2 @ case 3
	.2byte _021EAACE - _021EAA2A - 2 @ case 4
	.2byte _021EAADE - _021EAA2A - 2 @ case 5
_021EAA36:
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EAB4E
_021EAA5A:
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EAB4E
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EAB4E
_021EAA76:
	movs r1, #9
	ldr r0, [r5, #0x34]
	adds r2, r1, #0
	bl ov14_021F29E4
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021EAA86:
	ldrh r0, [r4, #0x12]
	cmp r0, #4
	bne _021EAA98
	movs r0, #0
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
	b _021EAB4E
_021EAA98:
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0x32
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	adds r2, r2, #2
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
	b _021EAB4E
_021EAACE:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xa
	bl ov14_021F29E4
	ldrh r0, [r4, #0x10]
	adds r0, r0, #1
	strh r0, [r4, #0x10]
_021EAADE:
	ldrh r0, [r4, #0x12]
	cmp r0, #4
	bne _021EAAEC
	movs r0, #0
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021EAAEC:
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0x32
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	subs r2, r2, #2
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r0, #0xca
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0xca
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	subs r2, r2, #2
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
_021EAB4E:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021EAA04

	thumb_func_start ov14_021EAB54
ov14_021EAB54: @ 0x021EAB54
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	ldrh r0, [r4, #0x10]
	cmp r0, #4
	bhi _021EAC20
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EAB6C: @ jump table
	.2byte _021EAB76 - _021EAB6C - 2 @ case 0
	.2byte _021EAB84 - _021EAB6C - 2 @ case 1
	.2byte _021EABCA - _021EAB6C - 2 @ case 2
	.2byte _021EABEC - _021EAB6C - 2 @ case 3
	.2byte _021EAC10 - _021EAB6C - 2 @ case 4
_021EAB76:
	movs r1, #9
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F29E4
	movs r0, #1
	strh r0, [r4, #0x10]
_021EAB84:
	ldrh r0, [r4, #0x12]
	cmp r0, #4
	bne _021EAB94
	movs r0, #0
	strh r0, [r4, #0x12]
	movs r0, #2
	strh r0, [r4, #0x10]
	b _021EAC20
_021EAB94:
	movs r0, #0xca
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0xca
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	adds r2, r2, #2
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrh r0, [r4, #0x12]
	adds r0, r0, #1
	strh r0, [r4, #0x12]
	b _021EAC20
_021EABCA:
	adds r0, r4, #0
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #3
	strh r0, [r4, #0x10]
	b _021EAC20
_021EABEC:
	adds r0, r4, #0
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EAC20
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #4
	strh r0, [r4, #0x10]
	b _021EAC20
_021EAC10:
	adds r0, r4, #0
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021EAC20:
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021EAB54

	thumb_func_start ov14_021EAC24
ov14_021EAC24: @ 0x021EAC24
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r5, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0xf
	bl FUN_02019978
	ldrh r0, [r5, #0x10]
	cmp r0, #4
	bhi _021EACCC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EAC48: @ jump table
	.2byte _021EAC52 - _021EAC48 - 2 @ case 0
	.2byte _021EAC70 - _021EAC48 - 2 @ case 1
	.2byte _021EAC80 - _021EAC48 - 2 @ case 2
	.2byte _021EAC98 - _021EAC48 - 2 @ case 3
	.2byte _021EACBC - _021EAC48 - 2 @ case 4
_021EAC52:
	movs r1, #9
	ldr r0, [r4, #0x34]
	adds r2, r1, #0
	bl ov14_021F29E4
	ldr r2, [r4, #0x34]
	ldr r1, _021EACD0 @ =0x000088CA
	adds r0, r4, #0
	ldrh r1, [r2, r1]
	movs r2, #2
	bl ov14_021E7AE4
	movs r0, #1
	strh r0, [r5, #0x10]
	b _021EACCC
_021EAC70:
	adds r0, r4, #0
	bl ov14_021E7B98
	cmp r0, #0
	bne _021EACCC
	movs r0, #2
	strh r0, [r5, #0x10]
	b _021EACCC
_021EAC80:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #3
	strh r0, [r5, #0x10]
	b _021EACCC
_021EAC98:
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EACCC
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #4
	strh r0, [r5, #0x10]
	b _021EACCC
_021EACBC:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	movs r0, #0
	strh r0, [r5, #0x10]
	pop {r3, r4, r5, pc}
_021EACCC:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EACD0: .4byte 0x000088CA
	thumb_func_end ov14_021EAC24

	thumb_func_start ov14_021EACD4
ov14_021EACD4: @ 0x021EACD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r5, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl ov14_021E8514
	adds r7, r0, #0
	adds r0, r4, #0
	bl ov14_021E80A8
	adds r6, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xa
	bl FUN_02019978
	ldrh r0, [r5, #0x10]
	cmp r0, #0xa
	bhi _021EAD6C
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EAD10: @ jump table
	.2byte _021EAD26 - _021EAD10 - 2 @ case 0
	.2byte _021EAD60 - _021EAD10 - 2 @ case 1
	.2byte _021EAD80 - _021EAD10 - 2 @ case 2
	.2byte _021EAEBA - _021EAD10 - 2 @ case 3
	.2byte _021EAEF0 - _021EAD10 - 2 @ case 4
	.2byte _021EAEF0 - _021EAD10 - 2 @ case 5
	.2byte _021EAEF0 - _021EAD10 - 2 @ case 6
	.2byte _021EAEF0 - _021EAD10 - 2 @ case 7
	.2byte _021EAEF0 - _021EAD10 - 2 @ case 8
	.2byte _021EAEF0 - _021EAD10 - 2 @ case 9
	.2byte _021EAECA - _021EAD10 - 2 @ case 10
_021EAD26:
	ldr r0, [r4, #0x34]
	ldr r1, _021EAEF8 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021EAD50
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #1
	strh r0, [r5, #0x10]
	b _021EAEF0
_021EAD50:
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl ov14_021E8434
	movs r0, #0xa
	strh r0, [r5, #0x10]
	b _021EAEF0
_021EAD60:
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	bne _021EAD6E
_021EAD6C:
	b _021EAEF0
_021EAD6E:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B3C
	movs r0, #2
	strh r0, [r5, #0x10]
_021EAD80:
	ldr r0, [r4, #0x34]
	ldr r1, _021EAEFC @ =0x0000044A
	ldrb r2, [r0, r1]
	cmp r2, #1
	bne _021EADA4
	cmp r6, #0
	bne _021EADA4
	movs r2, #2
	strb r2, [r0, r1]
	adds r0, r4, #0
	movs r1, #0x28
	bl ov14_021F69F0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #0
	bl ov14_021F3488
_021EADA4:
	add r0, sp, #4
	add r1, sp, #0
	bl FUN_02025364
	cmp r0, #0
	bne _021EAE60
	ldr r1, [r4, #0x34]
	ldr r0, _021EAEFC @ =0x0000044A
	ldr r2, _021EAF00 @ =0x000040B8
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _021EADD0
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E7960
	b _021EADE4
_021EADD0:
	ldr r0, [r1, r2]
	adds r2, r2, #4
	ldr r1, [r1, r2]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _021EAF04 @ =0x021F7BF0
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov14_021E79AC
_021EADE4:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r7, r6, #0
	cmp r6, #0xff
	bne _021EADF6
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r6, [r0]
	b _021EAE0E
_021EADF6:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	adds r2, r6, #0
	bl ov14_021E6AA0
	cmp r0, #0
	bne _021EAE0E
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r6, [r0]
_021EAE0E:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r6, r0
	ldr r1, [r4, #0x34]
	bne _021EAE44
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	ldr r0, [r4, #0x34]
	ldr r1, _021EAEFC @ =0x0000044A
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _021EAE4E
	movs r1, #0x2f
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl ov14_021E7FEC
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	b _021EAE4E
_021EAE44:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
_021EAE4E:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #1
	bl ov14_021E7AD4
	movs r0, #3
	strh r0, [r5, #0x10]
	b _021EAEF0
_021EAE60:
	cmp r7, #0
	bne _021EAE90
	ldr r0, [r4, #0x34]
	ldr r1, _021EAEFC @ =0x0000044A
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021EAE90
	ldr r2, [sp, #4]
	cmp r2, #0x10
	blo _021EAE7E
	ldr r1, [sp]
	cmp r1, #0x30
	blo _021EAE7E
	cmp r2, #0x68
	blo _021EAE90
_021EAE7E:
	ldr r1, _021EAEFC @ =0x0000044A
	movs r2, #1
	strb r2, [r0, r1]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7FB8
_021EAE90:
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	ldr r0, [r4, #0x34]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov14_021F395C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B5C
	ldr r2, [sp, #4]
	ldr r1, [r4, #0x34]
	ldr r0, _021EAF00 @ =0x000040B8
	str r2, [r1, r0]
	ldr r2, [sp]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	str r2, [r1, r0]
	b _021EAEF0
_021EAEBA:
	adds r0, r4, #0
	bl ov14_021E7B8C
	cmp r0, #0
	bne _021EAEF0
	movs r0, #0xa
	strh r0, [r5, #0x10]
	b _021EAEF0
_021EAECA:
	cmp r7, #0
	bne _021EAEF0
	cmp r6, #0
	bne _021EAEF0
	ldr r0, [r4, #0x34]
	ldr r1, _021EAEF8 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021EAEE8
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	bl ov14_021F3B3C
_021EAEE8:
	movs r0, #0
	add sp, #8
	strh r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021EAEF0:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EAEF8: .4byte 0x000088C8
_021EAEFC: .4byte 0x0000044A
_021EAF00: .4byte 0x000040B8
_021EAF04: .4byte 0x021F7BF0
	thumb_func_end ov14_021EACD4

	thumb_func_start ov14_021EAF08
ov14_021EAF08: @ 0x021EAF08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x34]
	bl ov14_021E80A8
	adds r6, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021EAF20
	cmp r0, #1
	beq _021EAF70
	b _021EAF84
_021EAF20:
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EAF84
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	ldr r0, [r4, #0xc]
	movs r3, #1
	ldrh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x21
	strb r2, [r0]
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021E7AD4
	ldr r2, [r5, #0x34]
	ldr r0, _021EAF88 @ =0x0000044A
	ldrb r1, [r2, r0]
	cmp r1, #0
	beq _021EAF6A
	movs r1, #0
	strb r1, [r2, r0]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7FEC
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021F3488
_021EAF6A:
	movs r0, #1
	strh r0, [r4, #0x10]
	b _021EAF84
_021EAF70:
	adds r0, r5, #0
	bl ov14_021E7B8C
	cmp r0, #0
	bne _021EAF84
	cmp r6, #0
	bne _021EAF84
	movs r0, #0
	strh r0, [r4, #0x10]
	pop {r4, r5, r6, pc}
_021EAF84:
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EAF88: .4byte 0x0000044A
	thumb_func_end ov14_021EAF08

	thumb_func_start ov14_021EAF8C
ov14_021EAF8C: @ 0x021EAF8C
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	lsls r2, r1, #2
	ldr r1, _021EAFA8 @ =0x021F7D9C
	ldr r1, [r1, r2]
	blx r1
	str r0, [r4]
	cmp r0, #0xb3
	beq _021EAFA4
	movs r0, #1
	pop {r4, pc}
_021EAFA4:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021EAFA8: .4byte 0x021F7D9C
	thumb_func_end ov14_021EAF8C

	thumb_func_start ov14_021EAFAC
ov14_021EAFAC: @ 0x021EAFAC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #0
	bl FUN_02022C9C
	movs r0, #0
	bl FUN_02022D04
	ldr r0, _021EB0C8 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _021EB0CC @ =0x04001050
	strh r1, [r0]
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	ldr r2, _021EB0D0 @ =0x04000304
	ldr r0, _021EB0D4 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r2, #2
	movs r0, #3
	movs r1, #0xa
	lsls r2, r2, #0x12
	bl FUN_0201A910
	ldr r1, _021EB0D8 @ =0x000088E0
	movs r0, #0xa
	bl FUN_0201AA8C
	ldr r2, _021EB0D8 @ =0x000088E0
	movs r1, #0
	str r0, [r4, #0x34]
	blx FUN_020D4994
	movs r0, #2
	movs r1, #0xa
	bl FUN_02007688
	movs r1, #0x45
	ldr r2, [r4, #0x34]
	lsls r1, r1, #4
	str r0, [r2, r1]
	movs r0, #0x14
	movs r1, #0xa
	bl FUN_02007688
	ldr r2, [r4, #0x34]
	ldr r1, _021EB0DC @ =0x00000454
	str r0, [r2, r1]
	bl ov14_021E5A60
	adds r0, r4, #0
	bl ov14_021E5A70
	adds r0, r4, #0
	bl ov14_021E5E74
	adds r0, r4, #0
	bl ov14_021E5C54
	adds r0, r4, #0
	bl ov14_021E5D78
	adds r0, r4, #0
	bl ov14_021E5DE0
	adds r0, r4, #0
	bl ov14_021F4ED0
	adds r0, r4, #0
	bl ov14_021F297C
	adds r0, r4, #0
	bl ov14_021F2F20
	adds r0, r4, #0
	bl ov14_021F2F3C
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021E7930
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #2
	bl ov14_021E783C
	adds r0, r4, #0
	bl ov14_021E7BA4
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #1
	beq _021EB08C
	cmp r0, #0
	beq _021EB08C
	adds r0, r4, #0
	bl ov14_021E81FC
	adds r0, r4, #0
	bl ov14_021E825C
_021EB08C:
	adds r0, r4, #0
	bl ov14_021E82BC
	adds r0, r4, #0
	bl ov14_021E5ED0
	adds r0, r4, #0
	bl ov14_021F5620
	adds r0, r4, #0
	bl ov14_021F566C
	adds r0, r4, #0
	bl ov14_021F49C8
	adds r0, r4, #0
	bl ov14_021F6A44
	ldr r0, _021EB0E0 @ =ov14_021E59AC
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E33C
	ldr r1, [r4, #0x34]
	str r0, [r1]
	movs r0, #1
	bl ov14_021E5EAC
	ldr r0, [r4, #0x30]
	pop {r4, pc}
	.align 2, 0
_021EB0C8: .4byte 0x04000050
_021EB0CC: .4byte 0x04001050
_021EB0D0: .4byte 0x04000304
_021EB0D4: .4byte 0xFFFF7FFF
_021EB0D8: .4byte 0x000088E0
_021EB0DC: .4byte 0x00000454
_021EB0E0: .4byte ov14_021E59AC
	thumb_func_end ov14_021EAFAC

	thumb_func_start ov14_021EB0E4
ov14_021EB0E4: @ 0x021EB0E4
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E6048
	ldr r0, [r4, #0x34]
	ldr r0, [r0]
	bl FUN_0200E390
	adds r0, r4, #0
	bl ov14_021F6B10
	adds r0, r4, #0
	bl ov14_021E5EE8
	ldr r0, [r4, #0x34]
	bl ov14_021E7D7C
	ldr r0, [r4, #0x34]
	bl ov14_021F29AC
	adds r0, r4, #0
	bl ov14_021F4F00
	adds r0, r4, #0
	bl ov14_021E5DB8
	adds r0, r4, #0
	bl ov14_021E5E94
	adds r0, r4, #0
	bl ov14_021E5C00
	ldr r1, [r4, #0x34]
	ldr r0, _021EB164 @ =0x00000454
	ldr r0, [r1, r0]
	bl FUN_0200770C
	movs r0, #0x45
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl FUN_0200770C
	bl FUN_02021238
	ldr r1, _021EB168 @ =0x04000050
	movs r0, #0
	strh r0, [r1]
	ldr r1, _021EB16C @ =0x04001050
	strh r0, [r1]
	bl FUN_02022C9C
	movs r0, #0
	bl FUN_02022D04
	ldr r0, [r4, #0x34]
	bl FUN_0201AB0C
	movs r0, #0xa
	bl FUN_0201A9C4
	ldr r0, [r4, #0x30]
	pop {r4, pc}
	nop
_021EB164: .4byte 0x00000454
_021EB168: .4byte 0x04000050
_021EB16C: .4byte 0x04001050
	thumb_func_end ov14_021EB0E4

	thumb_func_start ov14_021EB170
ov14_021EB170: @ 0x021EB170
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021EB186
	movs r0, #0x11
	ldr r1, [r4, #0x34]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	pop {r4, pc}
_021EB186:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EB170

	thumb_func_start ov14_021EB18C
ov14_021EB18C: @ 0x021EB18C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x18]
	bl FUN_02003B44
	cmp r0, #0
	bne _021EB1A0
	ldr r0, [r4, #0x30]
	pop {r4, pc}
_021EB1A0:
	movs r0, #3
	pop {r4, pc}
	thumb_func_end ov14_021EB18C

	thumb_func_start ov14_021EB1A4
ov14_021EB1A4: @ 0x021EB1A4
	ldr r3, [r0, #0x34]
	ldr r1, _021EB1BC @ =0x00000444
	ldr r2, [r3, r1]
	cmp r2, #0
	bne _021EB1B2
	ldr r0, [r0, #0x30]
	bx lr
_021EB1B2:
	subs r0, r2, #1
	str r0, [r3, r1]
	movs r0, #4
	bx lr
	nop
_021EB1BC: .4byte 0x00000444
	thumb_func_end ov14_021EB1A4

	thumb_func_start ov14_021EB1C0
ov14_021EB1C0: @ 0x021EB1C0
	push {r3, lr}
	ldr r1, [r0, #0x34]
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _021EB1D6
	ldr r1, [r0, #0x30]
	lsls r2, r1, #2
	ldr r1, _021EB1DC @ =0x021F7D9C
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
_021EB1D6:
	movs r0, #5
	pop {r3, pc}
	nop
_021EB1DC: .4byte 0x021F7D9C
	thumb_func_end ov14_021EB1C0

	thumb_func_start ov14_021EB1E0
ov14_021EB1E0: @ 0x021EB1E0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02025358
	cmp r0, #1
	bne _021EB1F6
	ldr r0, _021EB210 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4, #0x30]
	pop {r4, pc}
_021EB1F6:
	ldr r0, _021EB214 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _021EB20A
	ldr r0, _021EB210 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4, #0x30]
	pop {r4, pc}
_021EB20A:
	movs r0, #6
	pop {r4, pc}
	nop
_021EB210: .4byte 0x000005DD
_021EB214: .4byte 0x021D110C
	thumb_func_end ov14_021EB1E0

	thumb_func_start ov14_021EB218
ov14_021EB218: @ 0x021EB218
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x34]
	ldr r0, _021EB26C @ =0x00000434
	ldr r0, [r1, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021EB230
	cmp r0, #2
	beq _021EB24C
	b _021EB268
_021EB230:
	ldr r1, [r4, #0x34]
	ldr r0, _021EB26C @ =0x00000434
	ldr r0, [r1, r0]
	bl FUN_020169CC
	ldr r2, [r4, #0x34]
	ldr r1, _021EB270 @ =0x00000438
	adds r0, r4, #0
	ldrh r1, [r2, r1]
	lsls r2, r1, #3
	ldr r1, _021EB274 @ =0x021F7D74
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
_021EB24C:
	ldr r1, [r4, #0x34]
	ldr r0, _021EB26C @ =0x00000434
	ldr r0, [r1, r0]
	bl FUN_020169CC
	ldr r2, [r4, #0x34]
	ldr r1, _021EB270 @ =0x00000438
	adds r0, r4, #0
	ldrh r1, [r2, r1]
	lsls r2, r1, #3
	ldr r1, _021EB278 @ =0x021F7D78
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
_021EB268:
	movs r0, #7
	pop {r4, pc}
	.align 2, 0
_021EB26C: .4byte 0x00000434
_021EB270: .4byte 0x00000438
_021EB274: .4byte 0x021F7D74
_021EB278: .4byte 0x021F7D78
	thumb_func_end ov14_021EB218

	thumb_func_start ov14_021EB27C
ov14_021EB27C: @ 0x021EB27C
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E5F4C
	cmp r0, #0
	bne _021EB28C
	ldr r0, [r4, #0x30]
	pop {r4, pc}
_021EB28C:
	movs r0, #8
	pop {r4, pc}
	thumb_func_end ov14_021EB27C

	thumb_func_start ov14_021EB290
ov14_021EB290: @ 0x021EB290
	push {r3, lr}
	ldrb r2, [r0, #0x1e]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021EB2A4 @ =0x021F7D50
	ldr r1, [r1, r3]
	blx r1
	movs r0, #0xa
	pop {r3, pc}
	.align 2, 0
_021EB2A4: .4byte 0x021F7D50
	thumb_func_end ov14_021EB290

	thumb_func_start ov14_021EB2A8
ov14_021EB2A8: @ 0x021EB2A8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl FUN_020072A8
	cmp r0, #0
	bne _021EB2BA
	movs r0, #0xa
	pop {r4, pc}
_021EB2BA:
	ldr r0, [r4, #0x14]
	bl FUN_02007278
	ldrb r2, [r4, #0x1e]
	movs r1, #0xc
	adds r0, r4, #0
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021EB2E4 @ =0x021F7D54
	ldr r1, [r1, r3]
	blx r1
	ldrb r1, [r4, #0x1e]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _021EB2E8 @ =0x021F7D58
	ldr r0, [r0, r2]
	str r0, [r4, #0x30]
	movs r0, #0
	pop {r4, pc}
	nop
_021EB2E4: .4byte 0x021F7D54
_021EB2E8: .4byte 0x021F7D58
	thumb_func_end ov14_021EB2A8

	thumb_func_start ov14_021EB2EC
ov14_021EB2EC: @ 0x021EB2EC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _021EB384 @ =0x0000060C
	bl FUN_0200604C
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bhi _021EB37A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EB30A: @ jump table
	.2byte _021EB312 - _021EB30A - 2 @ case 0
	.2byte _021EB342 - _021EB30A - 2 @ case 1
	.2byte _021EB35A - _021EB30A - 2 @ case 2
	.2byte _021EB366 - _021EB30A - 2 @ case 3
_021EB312:
	adds r0, r4, #0
	bl ov14_021F0BF4
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F43F4
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #0x1e
	bl ov14_021E7588
	movs r5, #0x5b
	b _021EB37A
_021EB342:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021E7588
	movs r5, #0x51
	b _021EB37A
_021EB35A:
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021E7588
	movs r5, #0xc
	b _021EB37A
_021EB366:
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021E7588
	movs r5, #0x75
_021EB37A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F01D8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EB384: .4byte 0x0000060C
	thumb_func_end ov14_021EB2EC

	thumb_func_start ov14_021EB388
ov14_021EB388: @ 0x021EB388
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A14
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EB490
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EB3F4
	ldr r0, _021EB6E4 @ =0x000005EB
	bl FUN_0200604C
	ldr r2, [r4, #0x34]
	ldr r1, _021EB6E8 @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021EB3D8
	ldr r1, _021EB6EC @ =0x021F7D3C
	adds r0, r4, #0
	movs r2, #5
	bl ov14_021F5EE4
_021EB3D8:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F039C
	pop {r3, r4, r5, pc}
_021EB3F4:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021EB470
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021EB6F0 @ =ov14_021EA180
	adds r0, r4, #0
	movs r2, #0x4a
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021EB470:
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0xc
	pop {r3, r4, r5, pc}
_021EB490:
	adds r0, r4, #0
	bl ov14_021F6F94
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021EB4DC
	blo _021EB4A4
	b _021EB684
_021EB4A4:
	cmp r5, #0x29
	bhi _021EB4D0
	subs r0, #0x1e
	bmi _021EB4DA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EB4B8: @ jump table
	.2byte _021EB4F2 - _021EB4B8 - 2 @ case 0
	.2byte _021EB506 - _021EB4B8 - 2 @ case 1
	.2byte _021EB530 - _021EB4B8 - 2 @ case 2
	.2byte _021EB55A - _021EB4B8 - 2 @ case 3
	.2byte _021EB56C - _021EB4B8 - 2 @ case 4
	.2byte _021EB6C8 - _021EB4B8 - 2 @ case 5
	.2byte _021EB58C - _021EB4B8 - 2 @ case 6
	.2byte _021EB5BA - _021EB4B8 - 2 @ case 7
	.2byte _021EB5D0 - _021EB4B8 - 2 @ case 8
	.2byte _021EB5E2 - _021EB4B8 - 2 @ case 9
	.2byte _021EB5F4 - _021EB4B8 - 2 @ case 10
	.2byte _021EB606 - _021EB4B8 - 2 @ case 11
_021EB4D0:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	bne _021EB4DA
	b _021EB714
_021EB4DA:
	b _021EB750
_021EB4DC:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021EB4E8
	bne _021EB4E6
	b _021EB6E0
_021EB4E6:
	b _021EB750
_021EB4E8:
	adds r0, r1, #2
	cmp r5, r0
	bne _021EB4F0
	b _021EB63A
_021EB4F0:
	b _021EB750
_021EB4F2:
	ldr r0, _021EB6F4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	bl ov14_021F1128
	pop {r3, r4, r5, pc}
_021EB506:
	ldr r0, _021EB6F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x1e
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xc
	bl ov14_021F028C
	pop {r3, r4, r5, pc}
_021EB530:
	ldr r0, _021EB6F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x1e
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xc
	bl ov14_021F0314
	pop {r3, r4, r5, pc}
_021EB55A:
	ldr r0, _021EB6FC @ =0x00000632
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0x95
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB56C:
	ldr r0, _021EB6FC @ =0x00000632
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0x96
	bl ov14_021F2330
	pop {r3, r4, r5, pc}
_021EB58C:
	ldr r0, _021EB6F4 @ =0x000005DD
	bl FUN_0200604C
	bl FUN_02025358
	cmp r0, #0
	bne _021EB5A2
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x2a
	strb r1, [r0]
_021EB5A2:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0xb2
	bl ov14_021F2330
	pop {r3, r4, r5, pc}
_021EB5BA:
	ldr r0, _021EB6F4 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x25
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x97
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB5D0:
	ldr r0, _021EB6F4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0x98
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB5E2:
	ldr r0, _021EB6F4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x99
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB5F4:
	ldr r0, _021EB6F4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0x9b
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB606:
	ldr r0, _021EB6F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0x9c
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB63A:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	cmp r0, #0x1e
	bne _021EB66C
	ldr r0, _021EB700 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	beq _021EB666
	ldr r0, _021EB6F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0xc
	bl ov14_021F028C
	pop {r3, r4, r5, pc}
_021EB666:
	movs r0, #0x10
	tst r0, r1
	bne _021EB66E
_021EB66C:
	b _021EB79E
_021EB66E:
	ldr r0, _021EB6F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0xc
	bl ov14_021F0314
	pop {r3, r4, r5, pc}
_021EB684:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x1e
	bhs _021EB69A
	adds r0, r4, #0
	bl ov14_021E7588
	b _021EB6B8
_021EB69A:
	cmp r1, #0x24
	beq _021EB6B8
	cmp r1, #0x25
	beq _021EB6B8
	cmp r1, #0x26
	beq _021EB6B8
	cmp r1, #0x27
	beq _021EB6B8
	cmp r1, #0x28
	beq _021EB6B8
	cmp r1, #0x29
	beq _021EB6B8
	adds r0, r4, #0
	bl ov14_021E765C
_021EB6B8:
	ldr r0, _021EB6F8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x4a
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EB6C8:
	ldr r0, _021EB6F4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E765C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x93
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB6E0:
	ldr r0, _021EB6F4 @ =0x000005DD
	b _021EB704
	.align 2, 0
_021EB6E4: .4byte 0x000005EB
_021EB6E8: .4byte 0x000040B8
_021EB6EC: .4byte 0x021F7D3C
_021EB6F0: .4byte ov14_021EA180
_021EB6F4: .4byte 0x000005DD
_021EB6F8: .4byte 0x000005DC
_021EB6FC: .4byte 0x00000632
_021EB700: .4byte 0x021D110C
_021EB704:
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x94
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EB714:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x1e
	bhs _021EB72A
	adds r0, r4, #0
	bl ov14_021E7588
	b _021EB748
_021EB72A:
	cmp r1, #0x24
	beq _021EB748
	cmp r1, #0x25
	beq _021EB748
	cmp r1, #0x26
	beq _021EB748
	cmp r1, #0x27
	beq _021EB748
	cmp r1, #0x28
	beq _021EB748
	cmp r1, #0x29
	beq _021EB748
	adds r0, r4, #0
	bl ov14_021E765C
_021EB748:
	ldr r0, _021EB7A4 @ =0x000005DC
	bl FUN_0200604C
	b _021EB79E
_021EB750:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EB79E
	ldr r0, _021EB7A8 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, _021EB7AC @ =0x021F7D3C
	adds r0, r4, #0
	movs r2, #5
	bl ov14_021F5EE4
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x24
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	movs r1, #0x24
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F0530
	pop {r3, r4, r5, pc}
_021EB79E:
	movs r0, #0xc
	pop {r3, r4, r5, pc}
	nop
_021EB7A4: .4byte 0x000005DC
_021EB7A8: .4byte 0x000005DD
_021EB7AC: .4byte 0x021F7D3C
	thumb_func_end ov14_021EB388

	thumb_func_start ov14_021EB7B0
ov14_021EB7B0: @ 0x021EB7B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021EB7E0 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E637C
	adds r0, r4, #0
	bl ov14_021F08F0
	ldr r0, [r4, #0x34]
	movs r1, #0x24
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0xc
	pop {r4, pc}
	nop
_021EB7E0: .4byte 0x000005EA
	thumb_func_end ov14_021EB7B0

	thumb_func_start ov14_021EB7E4
ov14_021EB7E4: @ 0x021EB7E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0x25
	bl ov14_021F6688
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021EB81E
	cmp r0, #1
	beq _021EB800
	cmp r0, #2
	b _021EB83C
_021EB800:
	ldr r1, _021EB8AC @ =0x021F7D2C
	adds r0, r5, #0
	movs r2, #4
	bl ov14_021F5EE4
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	movs r4, #0x5a
	b _021EB856
_021EB81E:
	ldr r1, _021EB8B0 @ =0x021F7D1C
	adds r0, r5, #0
	movs r2, #4
	bl ov14_021F5EE4
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	movs r4, #0x72
	b _021EB856
_021EB83C:
	ldr r1, _021EB8B4 @ =0x021F7D3C
	adds r0, r5, #0
	movs r2, #5
	bl ov14_021F5EE4
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021EB854
	movs r4, #0x4d
	b _021EB856
_021EB854:
	movs r4, #0x4e
_021EB856:
	ldr r0, [r5, #0x34]
	ldr r2, _021EB8B8 @ =0x0000044E
	ldrb r3, [r0, r2]
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _021EB892
	movs r1, #0x80
	bics r3, r1
	strb r3, [r0, r2]
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	blo _021EB880
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	b _021EB892
_021EB880:
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F43F4
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
_021EB892:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	ldr r1, _021EB8BC @ =ov14_021E9434
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021EB8AC: .4byte 0x021F7D2C
_021EB8B0: .4byte 0x021F7D1C
_021EB8B4: .4byte 0x021F7D3C
_021EB8B8: .4byte 0x0000044E
_021EB8BC: .4byte ov14_021E9434
	thumb_func_end ov14_021EB7E4

	thumb_func_start ov14_021EB8C0
ov14_021EB8C0: @ 0x021EB8C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	bl ov14_021E7588
	adds r0, r5, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	bne _021EB9D4
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _021EB8EC
	ldr r1, _021EBAD8 @ =0x021F7D2C
	adds r0, r5, #0
	movs r2, #4
	bl ov14_021F5EE4
	b _021EB954
_021EB8EC:
	cmp r0, #0
	bne _021EB90E
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F43F4
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021F3488
	ldr r1, _021EBADC @ =0x021F7D1C
	adds r0, r5, #0
	movs r2, #4
	bl ov14_021F5EE4
	b _021EB954
_021EB90E:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	blo _021EB934
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021F3488
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EB944
	adds r0, r5, #0
	bl ov14_021E8664
	b _021EB944
_021EB934:
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EB944
	adds r0, r5, #0
	bl ov14_021E8664
_021EB944:
	ldr r1, _021EBAE0 @ =0x021F7D3C
	adds r0, r5, #0
	movs r2, #5
	bl ov14_021F5EE4
	adds r0, r5, #0
	bl ov14_021E87F4
_021EB954:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E83C4
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	ldr r0, [r5]
	cmp r1, #0x1e
	bhs _021EB984
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _021EB980
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	movs r4, #0x51
	b _021EB9BE
_021EB980:
	movs r4, #0xc
	b _021EB9BE
_021EB984:
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _021EB9A4
	adds r0, r5, #0
	bl ov14_021F0BF4
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	movs r4, #0x5b
	b _021EB9BE
_021EB9A4:
	adds r0, r5, #0
	bl ov14_021F0B70
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F43F4
	adds r0, r5, #0
	movs r1, #5
	movs r2, #9
	bl ov14_021F6AC0
	movs r4, #0x24
_021EB9BE:
	adds r0, r5, #0
	bl ov14_021F3F6C
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _021EBACC
	ldr r0, [r5, #0x34]
	bl ov14_021E8874
	b _021EBACC
_021EB9D4:
	adds r0, r5, #0
	bl ov14_021F0BB4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8610
	adds r0, r5, #0
	bl ov14_021F4720
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E86E0
_021EBA0A:
	adds r0, r5, #0
	bl ov14_021E9554
	cmp r0, #0
	bne _021EBA0A
	adds r0, r5, #0
	adds r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	bne _021EBA2E
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r2, [r2]
	adds r0, r5, #0
	movs r1, #4
	bl ov14_021F6AC0
	b _021EBA4A
_021EBA2E:
	adds r2, r5, #0
	adds r2, #0x28
	ldrb r2, [r2]
	adds r0, r5, #0
	movs r1, #4
	bl ov14_021F6AC0
	ldr r1, [r5, #0x34]
	ldr r0, _021EBAE4 @ =0x0000044B
	movs r2, #1
	strb r2, [r1, r0]
	adds r0, r5, #0
	bl ov14_021EA1F0
_021EBA4A:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r2, [r5, #0x34]
	ldr r0, _021EBAE8 @ =0x0000043C
	adds r1, #0x25
	str r1, [r2, r0]
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EBA7E
	adds r0, r5, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
	movs r4, #0x82
	b _021EBA8E
_021EBA7E:
	adds r0, r5, #0
	adds r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	bne _021EBA8C
	movs r4, #0x29
	b _021EBA8E
_021EBA8C:
	movs r4, #0x73
_021EBA8E:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _021EBAA6
	adds r0, r5, #0
	adds r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EBAA6
	ldr r0, [r5, #0x34]
	bl ov14_021E8874
_021EBAA6:
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _021EBAB8
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F43F4
_021EBAB8:
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x27
	strb r1, [r0]
_021EBACC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F01D8
	pop {r3, r4, r5, pc}
	nop
_021EBAD8: .4byte 0x021F7D2C
_021EBADC: .4byte 0x021F7D1C
_021EBAE0: .4byte 0x021F7D3C
_021EBAE4: .4byte 0x0000044B
_021EBAE8: .4byte 0x0000043C
	thumb_func_end ov14_021EB8C0

	thumb_func_start ov14_021EBAEC
ov14_021EBAEC: @ 0x021EBAEC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #9
	movs r2, #0xa
	bl ov14_021F6AC0
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r2, [r4, #0x34]
	ldr r0, _021EBB38 @ =0x0000043C
	str r1, [r2, r0]
	adds r0, r4, #0
	bl ov14_021E8740
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x27
	bl ov14_021F6844
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EBB2C
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
_021EBB2C:
	adds r0, r4, #0
	movs r1, #0x3d
	bl ov14_021F01D8
	pop {r4, pc}
	nop
_021EBB38: .4byte 0x0000043C
	thumb_func_end ov14_021EBAEC

	thumb_func_start ov14_021EBB3C
ov14_021EBB3C: @ 0x021EBB3C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r1, #0x1e
	blo _021EBB62
	bl ov14_021F0B70
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F43F4
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021F3488
_021EBB62:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _021EBB70
	adds r0, r5, #0
	bl ov14_021F3F6C
_021EBB70:
	ldr r0, [r5]
	ldr r0, [r0, #8]
	subs r0, r0, #2
	cmp r0, #1
	bhi _021EBB8C
	adds r0, r5, #0
	bl ov14_021E87F4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82FC
_021EBB8C:
	ldrh r0, [r5, #0x1c]
	cmp r0, #0
	bne _021EBC04
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EBBD2
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F5FBC
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021EBBBA
	adds r0, r5, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	movs r4, #0x75
	b _021EBBF6
_021EBBBA:
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
	adds r0, r5, #0
	movs r1, #7
	movs r2, #8
	bl ov14_021F6AC0
	movs r4, #0x8b
	b _021EBBF6
_021EBBD2:
	ldr r1, _021EBDBC @ =0x021F7D3C
	adds r0, r5, #0
	movs r2, #5
	bl ov14_021F5EE4
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021EBBEA
	movs r4, #0xc
	b _021EBBF6
_021EBBEA:
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0xa
	bl ov14_021F6AC0
	movs r4, #0x24
_021EBBF6:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E83C4
	b _021EBD82
_021EBC04:
	movs r4, #0
	cmp r0, #0x70
	bne _021EBC24
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #5
	adds r3, r4, #0
	bl ov14_021E6070
	ldr r1, _021EBDC0 @ =0x000001E7
	cmp r0, r1
	beq _021EBC24
	movs r4, #1
	b _021EBC72
_021EBC24:
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov14_021E60C0
	adds r1, r5, #0
	adds r1, #0x21
	adds r3, r5, #0
	adds r6, r0, #0
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #6
	adds r3, #0x1c
	bl ov14_021E6094
	adds r0, r6, #0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EBC66
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r2, [r0]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r2
	ldr r3, _021EBDC4 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EBC66:
	ldrh r1, [r5, #0x1c]
	ldr r0, [r5, #0xc]
	movs r2, #1
	movs r3, #0xa
	bl FUN_02078434
_021EBC72:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r2, [r0]
	ldr r0, [r5]
	cmp r2, #0x1e
	blo _021EBC9C
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EBC90
	adds r0, r5, #0
	movs r1, #7
	subs r2, #0x1e
	bl ov14_021F6AC0
	b _021EBCD6
_021EBC90:
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0xa
	bl ov14_021F6AC0
	b _021EBCD6
_021EBC9C:
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EBCD6
	ldr r0, [r5, #0x34]
	adds r1, r2, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
_021EBCD6:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EBD78
	cmp r4, #0
	bne _021EBD50
	ldrh r2, [r5, #0x1c]
	ldr r0, [r5, #0x34]
	ldr r1, _021EBDC8 @ =0x000088C8
	strh r2, [r0, r1]
	ldr r0, [r5, #0x34]
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	blo _021EBD2A
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #1
	bl ov14_021F396C
	b _021EBD42
_021EBD2A:
	adds r0, r5, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F396C
_021EBD42:
	ldr r0, [r5, #0x34]
	bl ov14_021F39D0
	ldr r0, [r5, #0x34]
	bl ov14_021F3B3C
	b _021EBD74
_021EBD50:
	movs r0, #0
	strh r0, [r5, #0x1c]
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	blo _021EBD6A
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
	b _021EBD74
_021EBD6A:
	adds r0, r5, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
_021EBD74:
	movs r4, #0x7d
	b _021EBD82
_021EBD78:
	cmp r4, #1
	bne _021EBD80
	movs r0, #0
	strh r0, [r5, #0x1c]
_021EBD80:
	movs r4, #0x12
_021EBD82:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov14_021E7588
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	beq _021EBD9E
	ldr r0, [r5, #0x34]
	bl ov14_021E8874
	b _021EBDB0
_021EBD9E:
	ldrh r0, [r5, #0x1c]
	cmp r0, #0
	beq _021EBDB0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E892C
_021EBDB0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F01D8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021EBDBC: .4byte 0x021F7D3C
_021EBDC0: .4byte 0x000001E7
_021EBDC4: .4byte 0x00004094
_021EBDC8: .4byte 0x000088C8
	thumb_func_end ov14_021EBB3C

	thumb_func_start ov14_021EBDCC
ov14_021EBDCC: @ 0x021EBDCC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x1c]
	movs r2, #0x25
	bl ov14_021F6768
	movs r0, #0xe
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
	thumb_func_end ov14_021EBDCC

	thumb_func_start ov14_021EBDE0
ov14_021EBDE0: @ 0x021EBDE0
	ldr r3, _021EBDE4 @ =ov14_021EBDE8
	bx r3
	.align 2, 0
_021EBDE4: .4byte ov14_021EBDE8
	thumb_func_end ov14_021EBDE0

	thumb_func_start ov14_021EBDE8
ov14_021EBDE8: @ 0x021EBDE8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #0xb
	movs r3, #0
	bl ov14_021E6070
	ldr r2, [r4, #0x34]
	ldr r1, _021EBE24 @ =0x000040C0
	str r0, [r2, r1]
	adds r0, r4, #0
	bl ov14_021E7DF8
	ldr r0, [r4, #0x34]
	bl ov14_021F638C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7E40
	ldr r1, _021EBE28 @ =ov14_021E94A8
	adds r0, r4, #0
	movs r2, #0x15
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EBE24: .4byte 0x000040C0
_021EBE28: .4byte ov14_021E94A8
	thumb_func_end ov14_021EBDE8

	thumb_func_start ov14_021EBE2C
ov14_021EBE2C: @ 0x021EBE2C
	push {r4, lr}
	movs r1, #8
	movs r2, #0
	adds r4, r0, #0
	bl ov14_021F6AC0
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov14_021F3488
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r0, r4, #0
	movs r1, #0x26
	bl ov14_021F67A4
	movs r0, #0x16
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EBE2C

	thumb_func_start ov14_021EBE68
ov14_021EBE68: @ 0x021EBE68
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	movs r1, #3
	mvns r1, r1
	cmp r0, r1
	bhi _021EBEA0
	bhs _021EBF72
	cmp r0, #7
	bhi _021EBF78
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021EBE90: @ jump table
	.2byte _021EBEB4 - _021EBE90 - 2 @ case 0
	.2byte _021EBEC4 - _021EBE90 - 2 @ case 1
	.2byte _021EBED4 - _021EBE90 - 2 @ case 2
	.2byte _021EBEE4 - _021EBE90 - 2 @ case 3
	.2byte _021EBEF4 - _021EBE90 - 2 @ case 4
	.2byte _021EBF04 - _021EBE90 - 2 @ case 5
	.2byte _021EBF14 - _021EBE90 - 2 @ case 6
	.2byte _021EBF4C - _021EBE90 - 2 @ case 7
_021EBEA0:
	movs r1, #2
	mvns r1, r1
	cmp r0, r1
	bhi _021EBEAC
	beq _021EBF60
	b _021EBF78
_021EBEAC:
	adds r1, r1, #1
	cmp r0, r1
	beq _021EBF4C
	b _021EBF78
_021EBEB4:
	ldr r0, _021EBF80 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021E7E10
	b _021EBF78
_021EBEC4:
	ldr r0, _021EBF80 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021E7E10
	b _021EBF78
_021EBED4:
	ldr r0, _021EBF80 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #2
	bl ov14_021E7E10
	b _021EBF78
_021EBEE4:
	ldr r0, _021EBF80 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021E7E10
	b _021EBF78
_021EBEF4:
	ldr r0, _021EBF80 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021E7E10
	b _021EBF78
_021EBF04:
	ldr r0, _021EBF80 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #5
	bl ov14_021E7E10
	b _021EBF78
_021EBF14:
	ldr r1, [r4, #0x34]
	ldr r0, _021EBF84 @ =0x000040C0
	movs r2, #0xb
	ldr r1, [r1, r0]
	add r0, sp, #0
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	add r3, sp, #0
	bl ov14_021E6094
	add r1, sp, #0
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E895C
	ldr r0, _021EBF80 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x9a
	bl ov14_021F23F0
	add sp, #4
	pop {r3, r4, pc}
_021EBF4C:
	ldr r0, _021EBF88 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x9a
	bl ov14_021F23F0
	add sp, #4
	pop {r3, r4, pc}
_021EBF60:
	ldr r0, _021EBF88 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x18
	bl ov14_021F0244
	add sp, #4
	pop {r3, r4, pc}
_021EBF72:
	ldr r0, _021EBF88 @ =0x000005DC
	bl FUN_0200604C
_021EBF78:
	movs r0, #0x16
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EBF80: .4byte 0x000005DD
_021EBF84: .4byte 0x000040C0
_021EBF88: .4byte 0x000005DC
	thumb_func_end ov14_021EBE68

	thumb_func_start ov14_021EBF8C
ov14_021EBF8C: @ 0x021EBF8C
	ldr r3, _021EBF94 @ =ov14_021F0234
	ldr r1, _021EBF98 @ =ov14_021E94BC
	movs r2, #0xe
	bx r3
	.align 2, 0
_021EBF94: .4byte ov14_021F0234
_021EBF98: .4byte ov14_021E94BC
	thumb_func_end ov14_021EBF8C

	thumb_func_start ov14_021EBF9C
ov14_021EBF9C: @ 0x021EBF9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r1, #0x1e
	blo _021EC070
	movs r1, #2
	movs r2, #1
	bl ov14_021F3488
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	adds r0, r5, #0
	subs r4, #0x1e
	adds r1, r4, #0
	bl ov14_021E6480
	cmp r0, #0
	bne _021EBFF8
	ldr r0, _021EC0E4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x25
	bl ov14_021F67B0
	ldr r3, [r5, #0x34]
	ldr r1, _021EC0E8 @ =0x0000044E
	movs r0, #0x80
	ldrb r2, [r3, r1]
	orrs r0, r2
	strb r0, [r3, r1]
	movs r0, #0xe
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EBFF8:
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021EC03C
	ldr r0, _021EC0E4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #6
	movs r3, #0x25
	bl ov14_021F685C
	ldr r3, [r5, #0x34]
	ldr r1, _021EC0E8 @ =0x0000044E
	movs r0, #0x80
	ldrb r2, [r3, r1]
	orrs r0, r2
	strb r0, [r3, r1]
	movs r0, #0xe
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EC03C:
	adds r0, r4, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021EC090
	ldr r0, _021EC0E4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0x25
	bl ov14_021F685C
	ldr r3, [r5, #0x34]
	ldr r1, _021EC0E8 @ =0x0000044E
	movs r0, #0x80
	ldrb r2, [r3, r1]
	orrs r0, r2
	strb r0, [r3, r1]
	movs r0, #0xe
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EC070:
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F43F4
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021F3488
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F34C8
_021EC090:
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov14_021E60C0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _021EC0CE
	ldr r0, _021EC0E4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0x25
	bl ov14_021F67B0
	ldr r3, [r5, #0x34]
	ldr r1, _021EC0E8 @ =0x0000044E
	movs r0, #0x80
	ldrb r2, [r3, r1]
	orrs r0, r2
	strb r0, [r3, r1]
	movs r0, #0xe
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EC0CE:
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x25
	bl ov14_021F67B0
	adds r0, r5, #0
	movs r1, #1
	bl ov14_021F0254
	pop {r3, r4, r5, pc}
	nop
_021EC0E4: .4byte 0x000005F3
_021EC0E8: .4byte 0x0000044E
	thumb_func_end ov14_021EBF9C

	thumb_func_start ov14_021EC0EC
ov14_021EC0EC: @ 0x021EC0EC
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E7278
	ldr r1, [r4, #0x34]
	ldr r0, _021EC124 @ =0x000088DC
	ldr r0, [r1, r0]
	bl ov14_021F3380
	cmp r0, #0
	bne _021EC120
	ldr r1, [r4, #0x34]
	ldr r0, _021EC124 @ =0x000088DC
	ldr r0, [r1, r0]
	ldrb r1, [r0, #6]
	cmp r1, #0
	beq _021EC112
	movs r0, #0x1e
	pop {r4, pc}
_021EC112:
	bl ov14_021F33E8
	adds r0, r4, #0
	bl ov14_021E7264
	movs r0, #0x1b
	pop {r4, pc}
_021EC120:
	movs r0, #0x1a
	pop {r4, pc}
	.align 2, 0
_021EC124: .4byte 0x000088DC
	thumb_func_end ov14_021EC0EC

	thumb_func_start ov14_021EC128
ov14_021EC128: @ 0x021EC128
	push {r4, lr}
	movs r1, #1
	movs r2, #0x25
	adds r4, r0, #0
	bl ov14_021F67B0
	movs r0, #0x1c
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
	thumb_func_end ov14_021EC128

	thumb_func_start ov14_021EC13C
ov14_021EC13C: @ 0x021EC13C
	push {r4, lr}
	movs r1, #2
	movs r2, #0x25
	adds r4, r0, #0
	bl ov14_021F67B0
	movs r0, #0x1d
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
	thumb_func_end ov14_021EC13C

	thumb_func_start ov14_021EC150
ov14_021EC150: @ 0x021EC150
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r2]
	bl ov14_021E6100
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6654
	adds r0, r4, #0
	bl ov14_021E765C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021EC200
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021F4958
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021F4A20
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _021EC1A2
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	movs r0, #0x51
	str r0, [r4, #0x30]
	b _021EC1BE
_021EC1A2:
	movs r0, #0xc
	str r0, [r4, #0x30]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
_021EC1BE:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r1, r4, #0
	ldr r0, [r4, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F43F4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	ldr r1, _021EC234 @ =ov14_021E9450
	b _021EC22A
_021EC200:
	adds r0, r4, #0
	bl ov14_021F08BC
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x22
	strb r1, [r0]
	movs r0, #0x21
	str r0, [r4, #0x30]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	ldr r1, _021EC238 @ =ov14_021E9194
_021EC22A:
	ldr r2, [r4, #0x30]
	adds r0, r4, #0
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EC234: .4byte ov14_021E9450
_021EC238: .4byte ov14_021E9194
	thumb_func_end ov14_021EC150

	thumb_func_start ov14_021EC23C
ov14_021EC23C: @ 0x021EC23C
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F08F0
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EC254
	adds r0, r4, #0
	bl ov14_021F57B8
_021EC254:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E7588
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	subs r1, #0x1e
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _021EC29E
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	movs r0, #0x5b
	pop {r4, pc}
_021EC29E:
	movs r0, #0x24
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EC23C

	thumb_func_start ov14_021EC2A4
ov14_021EC2A4: @ 0x021EC2A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x34]
	ldr r0, _021EC2E8 @ =0x000088DC
	ldr r0, [r1, r0]
	bl ov14_021F33B0
	cmp r0, #0
	bne _021EC2E4
	ldr r1, [r4, #0x34]
	ldr r0, _021EC2E8 @ =0x000088DC
	ldr r0, [r1, r0]
	bl ov14_021F33FC
	adds r0, r4, #0
	bl ov14_021E7264
	adds r0, r4, #0
	bl ov14_021F3F6C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x25
	bl ov14_021F67B0
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	movs r0, #0x1f
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
_021EC2E4:
	movs r0, #0x1e
	pop {r4, pc}
	.align 2, 0
_021EC2E8: .4byte 0x000088DC
	thumb_func_end ov14_021EC2A4

	thumb_func_start ov14_021EC2EC
ov14_021EC2EC: @ 0x021EC2EC
	push {r4, lr}
	movs r1, #5
	movs r2, #0x25
	adds r4, r0, #0
	bl ov14_021F67B0
	movs r0, #0x20
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
	thumb_func_end ov14_021EC2EC

	thumb_func_start ov14_021EC300
ov14_021EC300: @ 0x021EC300
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl ov14_021F40E8
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021EC328
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F43F4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
	b _021EC332
_021EC328:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
_021EC332:
	ldr r1, _021EC340 @ =ov14_021E9450
	adds r0, r4, #0
	movs r2, #0xe
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021EC340: .4byte ov14_021E9450
	thumb_func_end ov14_021EC300

	thumb_func_start ov14_021EC344
ov14_021EC344: @ 0x021EC344
	push {r3, lr}
	ldr r0, [r0, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x5b
	pop {r3, pc}
	thumb_func_end ov14_021EC344

	thumb_func_start ov14_021EC354
ov14_021EC354: @ 0x021EC354
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov14_021E81A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EC0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
	ldr r0, [r4, #0x34]
	bl ov14_021F63F0
	ldr r0, [r4, #0x34]
	bl ov14_021F63A8
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F5EC4
	adds r0, r4, #0
	bl ov14_021F2FDC
	ldr r1, _021EC3A4 @ =ov14_021E9518
	adds r0, r4, #0
	movs r2, #0x23
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EC3A4: .4byte ov14_021E9518
	thumb_func_end ov14_021EC354

	thumb_func_start ov14_021EC3A8
ov14_021EC3A8: @ 0x021EC3A8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EC3C8
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	bl ov14_021F6AC0
	movs r0, #0x8b
	pop {r4, pc}
_021EC3C8:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl ov14_021F6AC0
	movs r0, #0x24
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EC3A8

	thumb_func_start ov14_021EC3D8
ov14_021EC3D8: @ 0x021EC3D8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A24
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EC4D4
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EC44A
	ldr r0, _021EC6F4 @ =0x000005EB
	bl FUN_0200604C
	ldr r2, [r4, #0x34]
	ldr r1, _021EC6F8 @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021EC42A
	ldr r1, _021EC6FC @ =0x021F7D3C
	adds r0, r4, #0
	movs r2, #5
	bl ov14_021F5EE4
_021EC42A:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F0594
	pop {r3, r4, r5, pc}
_021EC44A:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021EC4B4
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021EC700 @ =ov14_021EA180
	adds r0, r4, #0
	movs r2, #0x4c
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021EC4B4:
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x24
	pop {r3, r4, r5, pc}
_021EC4D4:
	adds r0, r4, #0
	bl ov14_021F7388
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021EC51E
	bhs _021EC5CA
	cmp r5, #0xd
	bhi _021EC512
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EC4F6: @ jump table
	.2byte _021EC69A - _021EC4F6 - 2 @ case 0
	.2byte _021EC69A - _021EC4F6 - 2 @ case 1
	.2byte _021EC69A - _021EC4F6 - 2 @ case 2
	.2byte _021EC69A - _021EC4F6 - 2 @ case 3
	.2byte _021EC69A - _021EC4F6 - 2 @ case 4
	.2byte _021EC69A - _021EC4F6 - 2 @ case 5
	.2byte _021EC532 - _021EC4F6 - 2 @ case 6
	.2byte _021EC610 - _021EC4F6 - 2 @ case 7
	.2byte _021EC550 - _021EC4F6 - 2 @ case 8
	.2byte _021EC57E - _021EC4F6 - 2 @ case 9
	.2byte _021EC594 - _021EC4F6 - 2 @ case 10
	.2byte _021EC5A6 - _021EC4F6 - 2 @ case 11
	.2byte _021EC5B8 - _021EC4F6 - 2 @ case 12
	.2byte _021EC622 - _021EC4F6 - 2 @ case 13
_021EC512:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	bne _021EC51C
	b _021EC65C
_021EC51C:
	b _021EC69A
_021EC51E:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021EC528
	beq _021EC610
	b _021EC69A
_021EC528:
	adds r0, r1, #2
	cmp r5, r0
	bne _021EC530
	b _021EC6EE
_021EC530:
	b _021EC69A
_021EC532:
	ldr r0, _021EC704 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x2a
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, r4, #0
	movs r2, #0x9d
	bl ov14_021F2490
	pop {r3, r4, r5, pc}
_021EC550:
	ldr r0, _021EC704 @ =0x000005DD
	bl FUN_0200604C
	bl FUN_02025358
	cmp r0, #0
	bne _021EC566
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x2a
	strb r1, [r0]
_021EC566:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x9d
	bl ov14_021F2330
	pop {r3, r4, r5, pc}
_021EC57E:
	ldr r0, _021EC704 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #9
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x97
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EC594:
	ldr r0, _021EC704 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0x98
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EC5A6:
	ldr r0, _021EC704 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x99
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EC5B8:
	ldr r0, _021EC704 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0x9b
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EC5CA:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #5
	bhi _021EC5E2
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	b _021EC600
_021EC5E2:
	cmp r1, #8
	beq _021EC600
	cmp r1, #9
	beq _021EC600
	cmp r1, #0xa
	beq _021EC600
	cmp r1, #0xb
	beq _021EC600
	cmp r1, #0xc
	beq _021EC600
	cmp r1, #0xd
	beq _021EC600
	adds r0, r4, #0
	bl ov14_021E765C
_021EC600:
	ldr r0, _021EC708 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x4c
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EC610:
	ldr r0, _021EC70C @ =0x00000633
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x9f
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EC622:
	ldr r0, _021EC708 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0x9e
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EC65C:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #5
	bhi _021EC674
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	b _021EC692
_021EC674:
	cmp r1, #8
	beq _021EC692
	cmp r1, #9
	beq _021EC692
	cmp r1, #0xa
	beq _021EC692
	cmp r1, #0xb
	beq _021EC692
	cmp r1, #0xc
	beq _021EC692
	cmp r1, #0xd
	beq _021EC692
	adds r0, r4, #0
	bl ov14_021E765C
_021EC692:
	ldr r0, _021EC708 @ =0x000005DC
	bl FUN_0200604C
	b _021EC6EE
_021EC69A:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EC6EE
	ldr r0, _021EC704 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, _021EC6FC @ =0x021F7D3C
	adds r0, r4, #0
	movs r2, #5
	bl ov14_021F5EE4
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #8
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F07F0
	pop {r3, r4, r5, pc}
_021EC6EE:
	movs r0, #0x24
	pop {r3, r4, r5, pc}
	nop
_021EC6F4: .4byte 0x000005EB
_021EC6F8: .4byte 0x000040B8
_021EC6FC: .4byte 0x021F7D3C
_021EC700: .4byte ov14_021EA180
_021EC704: .4byte 0x000005DD
_021EC708: .4byte 0x000005DC
_021EC70C: .4byte 0x00000633
	thumb_func_end ov14_021EC3D8

	thumb_func_start ov14_021EC710
ov14_021EC710: @ 0x021EC710
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7F4C
	ldr r1, _021EC72C @ =ov14_021E9518
	adds r0, r4, #0
	movs r2, #0x26
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EC72C: .4byte ov14_021E9518
	thumb_func_end ov14_021EC710

	thumb_func_start ov14_021EC730
ov14_021EC730: @ 0x021EC730
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E7E98
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F43F4
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F5C84
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F5E94
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _021EC762
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F5EB4
_021EC762:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EC7AE
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x21
	bl ov14_021F6AC0
	ldr r1, _021EC7D0 @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0x75
	bl ov14_021F0234
	pop {r4, pc}
_021EC7AE:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x21
	bl ov14_021F6AC0
	ldr r1, _021EC7D0 @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0xc
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021EC7D0: .4byte ov14_021E94BC
	thumb_func_end ov14_021EC730

	thumb_func_start ov14_021EC7D4
ov14_021EC7D4: @ 0x021EC7D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r4, [r0, #0xc]
	adds r1, r4, #0
	adds r1, #0xe4
	ldr r6, [r1]
	movs r1, #0x28
	bl ov14_021F6654
	ldr r0, _021EC850 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021E637C
	adds r1, r4, #0
	adds r1, #0xe4
	adds r4, #0xe8
	ldr r1, [r1]
	ldr r2, [r4]
	adds r0, r5, #0
	bl ov14_021E6548
	adds r0, r5, #0
	bl ov14_021F08F0
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0xff
	ldr r0, [r5, #0x34]
	bne _021EC838
	adds r1, r6, #0
	subs r1, #0x1e
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E7588
	b _021EC84A
_021EC838:
	ldr r0, [r0, #0x2c]
	movs r1, #8
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
_021EC84A:
	movs r0, #0x24
	pop {r4, r5, r6, pc}
	nop
_021EC850: .4byte 0x000005EA
	thumb_func_end ov14_021EC7D4

	thumb_func_start ov14_021EC854
ov14_021EC854: @ 0x021EC854
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r2, [r4, #0x34]
	ldr r0, _021EC8CC @ =0x0000043C
	adds r1, #0x25
	str r1, [r2, r0]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _021EC8A2
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F6AC0
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021F1580
	movs r1, #0
	adds r4, #0x2a
	strb r1, [r4]
	pop {r4, pc}
_021EC8A2:
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F6AC0
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E7588
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EC8C8
	movs r0, #0x82
	pop {r4, pc}
_021EC8C8:
	movs r0, #0x29
	pop {r4, pc}
	.align 2, 0
_021EC8CC: .4byte 0x0000043C
	thumb_func_end ov14_021EC854

	thumb_func_start ov14_021EC8D0
ov14_021EC8D0: @ 0x021EC8D0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A34
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EC97E
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EC928
	ldr r0, _021ECC30 @ =0x000005EB
	bl FUN_0200604C
	ldr r2, [r4, #0x34]
	ldr r1, _021ECC34 @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F083C
	pop {r3, r4, r5, pc}
_021EC928:
	adds r0, r4, #0
	bl ov14_021E765C
	ldr r0, [r4, #0x34]
	adds r5, #0x1e
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021EC960
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021EC960:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021EC97A
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021EC97A:
	movs r0, #0x29
	pop {r3, r4, r5, pc}
_021EC97E:
	bl ov14_021F6A14
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021ECA20
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EC9CC
	ldr r0, _021ECC30 @ =0x000005EB
	bl FUN_0200604C
	ldr r2, [r4, #0x34]
	ldr r1, _021ECC34 @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F083C
	pop {r3, r4, r5, pc}
_021EC9CC:
	adds r0, r4, #0
	bl ov14_021E765C
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021ECA02
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021ECA02:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021ECA1C
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021ECA1C:
	movs r0, #0x29
	pop {r3, r4, r5, pc}
_021ECA20:
	adds r0, r4, #0
	bl ov14_021F7B7C
	cmp r0, #1
	bne _021ECA68
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021ECA64
	ldr r0, _021ECC38 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x21
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #0x97
	bl ov14_021F2330
	pop {r3, r4, r5, pc}
_021ECA64:
	movs r0, #0x29
	pop {r3, r4, r5, pc}
_021ECA68:
	adds r0, r4, #0
	bl ov14_021F70C0
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021ECAAE
	blo _021ECA7C
	b _021ECC6A
_021ECA7C:
	cmp r5, #0x2d
	bhi _021ECAA4
	subs r0, #0x24
	bmi _021ECAAC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021ECA90: @ jump table
	.2byte _021ECCFE - _021ECA90 - 2 @ case 0
	.2byte _021ECAC4 - _021ECA90 - 2 @ case 1
	.2byte _021ECADA - _021ECA90 - 2 @ case 2
	.2byte _021ECAF0 - _021ECA90 - 2 @ case 3
	.2byte _021ECB06 - _021ECA90 - 2 @ case 4
	.2byte _021ECB1C - _021ECA90 - 2 @ case 5
	.2byte _021ECB32 - _021ECA90 - 2 @ case 6
	.2byte _021ECB48 - _021ECA90 - 2 @ case 7
	.2byte _021ECBBA - _021ECA90 - 2 @ case 8
	.2byte _021ECC2A - _021ECA90 - 2 @ case 9
_021ECAA4:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	beq _021ECAC0
_021ECAAC:
	b _021ECD70
_021ECAAE:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021ECABA
	bne _021ECAB8
	b _021ECD1A
_021ECAB8:
	b _021ECD70
_021ECABA:
	adds r0, r1, #2
	cmp r5, r0
	bne _021ECAC2
_021ECAC0:
	b _021ECD98
_021ECAC2:
	b _021ECD70
_021ECAC4:
	ldr r0, _021ECC38 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021ECADA:
	ldr r0, _021ECC38 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021ECAF0:
	ldr r0, _021ECC38 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #2
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021ECB06:
	ldr r0, _021ECC38 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021ECB1C:
	ldr r0, _021ECC38 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021ECB32:
	ldr r0, _021ECC38 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #5
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021ECB48:
	ldr r0, _021ECC3C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov14_021F1004
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021ECB9C
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021ECB9C:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021ECBB6
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021ECBB6:
	movs r0, #0x29
	pop {r3, r4, r5, pc}
_021ECBBA:
	ldr r0, _021ECC3C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F1004
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021ECC0C
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021ECC0C:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021ECC26
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021ECC26:
	movs r0, #0x29
	pop {r3, r4, r5, pc}
_021ECC2A:
	ldr r0, _021ECC3C @ =0x000005DC
	b _021ECC40
	nop
_021ECC30: .4byte 0x000005EB
_021ECC34: .4byte 0x000040B8
_021ECC38: .4byte 0x000005DD
_021ECC3C: .4byte 0x000005DC
_021ECC40:
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0xa0
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021ECC6A:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x25
	bhs _021ECCC4
	adds r0, r4, #0
	bl ov14_021E7588
	cmp r0, #1
	ldr r1, [r4, #0x34]
	bne _021ECCA8
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #0
	bne _021ECCE6
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F6408
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
	b _021ECCE6
_021ECCA8:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021ECCE6
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021ECCE6
_021ECCC4:
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021ECCE6
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
_021ECCE6:
	ldr r0, _021ECD9C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021ECD98
	adds r0, r4, #0
	movs r1, #0x4b
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021ECCFE:
	ldr r0, _021ECDA0 @ =0x00000633
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xa1
	bl ov14_021F2490
	pop {r3, r4, r5, pc}
_021ECD1A:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #0
	bne _021ECD3C
	ldr r0, _021ECDA0 @ =0x00000633
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xa1
	bl ov14_021F2490
	pop {r3, r4, r5, pc}
_021ECD3C:
	ldr r0, _021ECD9C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	movs r1, #0x29
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021ECD70:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021ECD98
	ldr r0, _021ECDA4 @ =0x000005EB
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F1580
	pop {r3, r4, r5, pc}
_021ECD98:
	movs r0, #0x29
	pop {r3, r4, r5, pc}
	.align 2, 0
_021ECD9C: .4byte 0x000005DC
_021ECDA0: .4byte 0x00000633
_021ECDA4: .4byte 0x000005EB
	thumb_func_end ov14_021EC8D0

	thumb_func_start ov14_021ECDA8
ov14_021ECDA8: @ 0x021ECDA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r7, [r0, #0xc]
	adds r0, r7, #0
	adds r0, #0xe8
	ldr r6, [r0]
	adds r0, r7, #0
	adds r0, #0xec
	ldr r4, [r0]
	ldr r0, _021ECF50 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021E637C
	movs r0, #0x80
	ands r0, r6
	str r0, [sp]
	bne _021ECDE0
	adds r1, r7, #0
	adds r1, #0xe4
	adds r7, #0xe8
	ldr r1, [r1]
	ldr r2, [r7]
	adds r0, r5, #0
	bl ov14_021E6548
_021ECDE0:
	adds r0, r5, #0
	bl ov14_021F08F0
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _021ECE04
	adds r0, r5, #0
	bl ov14_021F57B8
_021ECE04:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	bne _021ECE20
	adds r0, r5, #0
	bl ov14_021E765C
	b _021ECF40
_021ECE20:
	cmp r6, #0xff
	beq _021ECE3A
	ldr r0, [sp]
	cmp r0, #0
	bne _021ECE2C
	b _021ECF40
_021ECE2C:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov14_021E7588
	b _021ECF40
_021ECE3A:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r6, [r0]
	cmp r6, #0x1e
	blo _021ECECE
	cmp r4, r6
	beq _021ECECE
	subs r6, #0x1e
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021ECE82
	ldr r0, _021ECF54 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #6
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ECE82:
	adds r0, r7, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021ECEAA
	ldr r0, _021ECF54 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ECEAA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E6480
	cmp r0, #0
	bne _021ECECE
	ldr r0, _021ECF54 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x25
	bl ov14_021F67B0
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ECECE:
	cmp r4, #0xff
	beq _021ECF40
	movs r0, #0x80
	tst r0, r4
	beq _021ECF40
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	movs r2, #0x80
	adds r3, r4, #0
	eors r3, r2
	movs r2, #6
	muls r2, r0, r2
	ldrb r1, [r5, #0x1f]
	adds r0, r3, r2
	cmp r1, r0
	beq _021ECF40
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	cmp r1, #0x1e
	bhs _021ECF0E
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	movs r3, #0x25
	bl ov14_021F685C
	b _021ECF32
_021ECF0E:
	adds r0, r5, #0
	subs r1, #0x1e
	bl ov14_021E6480
	cmp r0, #1
	bne _021ECF28
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	movs r3, #0x25
	bl ov14_021F685C
	b _021ECF32
_021ECF28:
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x25
	bl ov14_021F67B0
_021ECF32:
	ldr r0, _021ECF54 @ =0x000005F3
	bl FUN_0200604C
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ECF40:
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x29
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ECF50: .4byte 0x000005EA
_021ECF54: .4byte 0x000005F3
	thumb_func_end ov14_021ECDA8

	thumb_func_start ov14_021ECF58
ov14_021ECF58: @ 0x021ECF58
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r4, [r0, #0xc]
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r6, [r0]
	ldr r0, _021ED1A0 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021E637C
	movs r0, #0x80
	tst r0, r6
	bne _021ECF88
	adds r1, r4, #0
	adds r1, #0xe4
	adds r4, #0xe8
	ldr r1, [r1]
	ldr r2, [r4]
	adds r0, r5, #0
	bl ov14_021E6548
_021ECF88:
	adds r0, r5, #0
	bl ov14_021F08F0
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _021ECF9E
	adds r0, r5, #0
	bl ov14_021F57B8
_021ECF9E:
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r4, r0, #0
	ldr r1, [r5, #0x34]
	ldr r0, _021ED1A4 @ =0x000088CC
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021ECFC0
	cmp r6, #0xff
	bne _021ECFC0
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r6, [r0]
	cmp r4, r6
	bne _021ECFC2
_021ECFC0:
	b _021ED15C
_021ECFC2:
	cmp r6, #0x1e
	blo _021ED0B2
	subs r6, #0x1e
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021ED022
	ldr r0, _021ED1A8 @ =0x000005F3
	bl FUN_0200604C
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r5, #0
	movs r1, #0
	movs r2, #6
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ED022:
	adds r0, r7, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021ED06C
	ldr r0, _021ED1A8 @ =0x000005F3
	bl FUN_0200604C
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ED06C:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E6480
	cmp r0, #0
	bne _021ED0B2
	ldr r0, _021ED1A8 @ =0x000005F3
	bl FUN_0200604C
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x25
	bl ov14_021F67B0
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ED0B2:
	cmp r4, #0x25
	blo _021ED142
	cmp r4, #0x2a
	bhi _021ED142
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r3, r4, #0
	movs r2, #6
	ldrb r1, [r5, #0x1f]
	subs r3, #0x25
	muls r2, r0, r2
	adds r0, r3, r2
	cmp r1, r0
	beq _021ED142
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	cmp r1, #0x1e
	bhs _021ED0EE
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	movs r3, #0x25
	bl ov14_021F685C
	b _021ED112
_021ED0EE:
	adds r0, r5, #0
	subs r1, #0x1e
	bl ov14_021E6480
	cmp r0, #1
	bne _021ED108
	adds r0, r5, #0
	movs r1, #0
	movs r2, #4
	movs r3, #0x25
	bl ov14_021F685C
	b _021ED112
_021ED108:
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x25
	bl ov14_021F67B0
_021ED112:
	ldr r0, _021ED1A8 @ =0x000005F3
	bl FUN_0200604C
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	movs r0, #0x2c
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021ED142:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021ED15C
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r5, #0
	bl ov14_021E7588
_021ED15C:
	adds r0, r5, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _021ED17E
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r5, #0
	bl ov14_021E76B8
	adds r0, r5, #0
	bl ov14_021F0CD8
	pop {r3, r4, r5, r6, r7, pc}
_021ED17E:
	cmp r4, #0x25
	blo _021ED192
	cmp r4, #0x2a
	bhi _021ED192
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	b _021ED19C
_021ED192:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021ED19C:
	movs r0, #0x29
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021ED1A0: .4byte 0x000005EA
_021ED1A4: .4byte 0x000088CC
_021ED1A8: .4byte 0x000005F3
	thumb_func_end ov14_021ECF58

	thumb_func_start ov14_021ED1AC
ov14_021ED1AC: @ 0x021ED1AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6688
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #0x34]
	beq _021ED1DA
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	bl ov14_021F0CD8
	pop {r4, pc}
_021ED1DA:
	ldr r0, [r0, #0x2c]
	movs r1, #1
	bl FUN_02019F94
	movs r0, #0x29
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021ED1AC

	thumb_func_start ov14_021ED1E8
ov14_021ED1E8: @ 0x021ED1E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov14_021F63B8
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021ED206
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	b _021ED210
_021ED206:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
_021ED210:
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, r4, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021ED238
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F6408
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
_021ED238:
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x29
	strb r1, [r0]
	adds r0, r4, #0
	ldrb r1, [r4, #0x1f]
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0x28
	bl ov14_021F1058
	pop {r4, pc}
	thumb_func_end ov14_021ED1E8

	thumb_func_start ov14_021ED258
ov14_021ED258: @ 0x021ED258
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov14_021F63A8
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021ED28A
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	bl ov14_021F6AC0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	movs r0, #0x8b
	pop {r4, pc}
_021ED28A:
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _021ED2A6
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r2, [r2]
	adds r0, r4, #0
	movs r1, #5
	subs r2, #0x1e
	bl ov14_021F6AC0
	b _021ED2B0
_021ED2A6:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl ov14_021F6AC0
_021ED2B0:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	movs r0, #0x24
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021ED258

	thumb_func_start ov14_021ED2C8
ov14_021ED2C8: @ 0x021ED2C8
	ldrb r2, [r0, #0x1f]
	adds r1, r0, #0
	adds r1, #0x25
	strb r2, [r1]
	ldr r3, _021ED2D8 @ =ov14_021F1058
	movs r1, #0x30
	bx r3
	nop
_021ED2D8: .4byte ov14_021F1058
	thumb_func_end ov14_021ED2C8

	thumb_func_start ov14_021ED2DC
ov14_021ED2DC: @ 0x021ED2DC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov14_021E81A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7ED0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
	ldr r0, [r4, #0x34]
	bl ov14_021F63F0
	ldr r0, [r4, #0x34]
	bl ov14_021F63B8
	adds r0, r4, #0
	bl ov14_021F3044
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F6408
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, r4, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021ED340
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
_021ED340:
	ldr r1, _021ED34C @ =ov14_021E9518
	adds r0, r4, #0
	movs r2, #0x28
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED34C: .4byte ov14_021E9518
	thumb_func_end ov14_021ED2DC

	thumb_func_start ov14_021ED350
ov14_021ED350: @ 0x021ED350
	ldr r3, _021ED358 @ =ov14_021F1090
	movs r1, #0x32
	bx r3
	nop
_021ED358: .4byte ov14_021F1090
	thumb_func_end ov14_021ED350

	thumb_func_start ov14_021ED35C
ov14_021ED35C: @ 0x021ED35C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x29
	ldrb r1, [r1]
	cmp r1, #1
	bne _021ED370
	bl ov14_021F0C58
	pop {r4, pc}
_021ED370:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7F4C
	ldr r1, _021ED388 @ =ov14_021E9518
	adds r0, r4, #0
	movs r2, #0x33
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED388: .4byte ov14_021E9518
	thumb_func_end ov14_021ED35C

	thumb_func_start ov14_021ED38C
ov14_021ED38C: @ 0x021ED38C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5]
	ldr r1, [r1, #8]
	cmp r1, #3
	bne _021ED3A0
	movs r7, #6
	movs r6, #0x22
	movs r4, #0x75
	b _021ED3BC
_021ED3A0:
	adds r1, r5, #0
	adds r1, #0x2a
	ldrb r1, [r1]
	movs r7, #3
	movs r6, #0x22
	movs r4, #0xc
	cmp r1, #0
	beq _021ED3BC
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r6, [r1]
	adds r1, r6, #0
	bl ov14_021E7588
_021ED3BC:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl ov14_021F6AC0
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F5C84
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F5E94
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F5EB4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r1, _021ED410 @ =ov14_021E94BC
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED410: .4byte ov14_021E94BC
	thumb_func_end ov14_021ED38C

	thumb_func_start ov14_021ED414
ov14_021ED414: @ 0x021ED414
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	movs r1, #3
	mvns r1, r1
	cmp r0, r1
	bhi _021ED454
	blo _021ED42C
	b _021ED57C
_021ED42C:
	cmp r0, #0xb
	bhi _021ED45E
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021ED43C: @ jump table
	.2byte _021ED46A - _021ED43C - 2 @ case 0
	.2byte _021ED47A - _021ED43C - 2 @ case 1
	.2byte _021ED48A - _021ED43C - 2 @ case 2
	.2byte _021ED49A - _021ED43C - 2 @ case 3
	.2byte _021ED4AA - _021ED43C - 2 @ case 4
	.2byte _021ED4BA - _021ED43C - 2 @ case 5
	.2byte _021ED4CA - _021ED43C - 2 @ case 6
	.2byte _021ED4DC - _021ED43C - 2 @ case 7
	.2byte _021ED4EC - _021ED43C - 2 @ case 8
	.2byte _021ED526 - _021ED43C - 2 @ case 9
	.2byte _021ED542 - _021ED43C - 2 @ case 10
	.2byte _021ED584 - _021ED43C - 2 @ case 11
_021ED454:
	movs r1, #2
	mvns r1, r1
	cmp r0, r1
	bhi _021ED460
	beq _021ED55E
_021ED45E:
	b _021ED5A0
_021ED460:
	adds r1, r1, #1
	cmp r0, r1
	bne _021ED468
	b _021ED58E
_021ED468:
	b _021ED5A0
_021ED46A:
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F1170
	pop {r4, pc}
_021ED47A:
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F1170
	pop {r4, pc}
_021ED48A:
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #2
	bl ov14_021F1170
	pop {r4, pc}
_021ED49A:
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021F1170
	pop {r4, pc}
_021ED4AA:
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F1170
	pop {r4, pc}
_021ED4BA:
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #5
	bl ov14_021F1170
	pop {r4, pc}
_021ED4CA:
	ldr r0, _021ED5A8 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov14_021F11F8
	pop {r4, pc}
_021ED4DC:
	ldr r0, _021ED5A8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F11F8
	pop {r4, pc}
_021ED4EC:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r1, [r4, #0x1f]
	ldrb r0, [r0]
	cmp r1, r0
	bne _021ED514
	ldr r0, _021ED5AC @ =0x000005F3
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x3d
	bl ov14_021F2270
	pop {r4, pc}
_021ED514:
	ldr r0, _021ED5A8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0xa2
	bl ov14_021F2270
	pop {r4, pc}
_021ED526:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0xa3
	bl ov14_021F2270
	pop {r4, pc}
_021ED542:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, _021ED5A4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0xa4
	bl ov14_021F2270
	pop {r4, pc}
_021ED55E:
	ldr r0, _021ED5A8 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021ED5A0
	ldr r0, _021ED5A8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x3e
	bl ov14_021F0244
	pop {r4, pc}
_021ED57C:
	ldr r0, _021ED5A8 @ =0x000005DC
	bl FUN_0200604C
	b _021ED5A0
_021ED584:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021ED58E:
	ldr r0, _021ED5A8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x39
	bl ov14_021F2270
	pop {r4, pc}
_021ED5A0:
	movs r0, #0x3d
	pop {r4, pc}
	.align 2, 0
_021ED5A4: .4byte 0x000005DD
_021ED5A8: .4byte 0x000005DC
_021ED5AC: .4byte 0x000005F3
	thumb_func_end ov14_021ED414

	thumb_func_start ov14_021ED5B0
ov14_021ED5B0: @ 0x021ED5B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _021ED5DA
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E834C
	cmp r0, #0
	bne _021ED5FC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	b _021ED5FC
_021ED5DA:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8234
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8294
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
_021ED5FC:
	ldr r1, _021ED608 @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0x35
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED608: .4byte ov14_021E94BC
	thumb_func_end ov14_021ED5B0

	thumb_func_start ov14_021ED60C
ov14_021ED60C: @ 0x021ED60C
	ldrb r2, [r0, #0x1f]
	adds r1, r0, #0
	adds r1, #0x25
	strb r2, [r1]
	ldr r3, _021ED61C @ =ov14_021F1058
	movs r1, #0x36
	bx r3
	nop
_021ED61C: .4byte ov14_021F1058
	thumb_func_end ov14_021ED60C

	thumb_func_start ov14_021ED620
ov14_021ED620: @ 0x021ED620
	ldr r3, _021ED628 @ =ov14_021F10B4
	movs r1, #0x37
	bx r3
	nop
_021ED628: .4byte ov14_021F10B4
	thumb_func_end ov14_021ED620

	thumb_func_start ov14_021ED62C
ov14_021ED62C: @ 0x021ED62C
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F6070
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E875C
	ldr r1, _021ED64C @ =ov14_021E9618
	adds r0, r4, #0
	movs r2, #0x38
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED64C: .4byte ov14_021E9618
	thumb_func_end ov14_021ED62C

	thumb_func_start ov14_021ED650
ov14_021ED650: @ 0x021ED650
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x2c]
	movs r1, #9
	bl ov14_021F6AC0
	ldr r0, [r4, #0x2c]
	cmp r0, #5
	ldr r0, [r4, #0x34]
	bhi _021ED66E
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	b _021ED676
_021ED66E:
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021ED676:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x27
	bl ov14_021F6844
	movs r0, #0x3d
	pop {r4, pc}
	thumb_func_end ov14_021ED650

	thumb_func_start ov14_021ED684
ov14_021ED684: @ 0x021ED684
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	adds r0, r4, #0
	movs r1, #0x3a
	bl ov14_021F10DC
	pop {r4, pc}
	thumb_func_end ov14_021ED684

	thumb_func_start ov14_021ED6A4
ov14_021ED6A4: @ 0x021ED6A4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E87BC
	ldr r1, _021ED6C0 @ =ov14_021E9618
	adds r0, r4, #0
	movs r2, #0x3b
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED6C0: .4byte ov14_021E9618
	thumb_func_end ov14_021ED6A4

	thumb_func_start ov14_021ED6C4
ov14_021ED6C4: @ 0x021ED6C4
	ldr r3, _021ED6CC @ =ov14_021F1090
	movs r1, #0x3c
	bx r3
	nop
_021ED6CC: .4byte ov14_021F1090
	thumb_func_end ov14_021ED6C4

	thumb_func_start ov14_021ED6D0
ov14_021ED6D0: @ 0x021ED6D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F5EB4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #1
	bne _021ED71A
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x1e
	bl ov14_021F6AC0
	ldr r1, _021ED758 @ =ov14_021E95B4
	adds r0, r4, #0
	movs r2, #0x52
	bl ov14_021F0234
	pop {r4, pc}
_021ED71A:
	cmp r0, #3
	bne _021ED72A
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x1e
	bl ov14_021F6AC0
	b _021ED734
_021ED72A:
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl ov14_021F6AC0
_021ED734:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	ldr r1, _021ED75C @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0x4d
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED758: .4byte ov14_021E95B4
_021ED75C: .4byte ov14_021E94BC
	thumb_func_end ov14_021ED6D0

	thumb_func_start ov14_021ED760
ov14_021ED760: @ 0x021ED760
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r1, [r1]
	bl ov14_021E7930
	ldr r2, [r4, #0x34]
	ldr r1, _021ED7B0 @ =0x0000044D
	strb r0, [r2, r1]
	adds r0, r4, #0
	bl ov14_021F4428
	adds r0, r4, #0
	bl ov14_021F4530
	adds r0, r4, #0
	bl ov14_021F459C
	adds r0, r4, #0
	bl ov14_021F58B8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E87BC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E81B4
	ldr r1, _021ED7B4 @ =ov14_021E9660
	adds r0, r4, #0
	movs r2, #0x40
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED7B0: .4byte 0x0000044D
_021ED7B4: .4byte ov14_021E9660
	thumb_func_end ov14_021ED760

	thumb_func_start ov14_021ED7B8
ov14_021ED7B8: @ 0x021ED7B8
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F6094
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8560
	ldr r1, _021ED7D8 @ =ov14_021E95C8
	adds r0, r4, #0
	movs r2, #0x41
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED7D8: .4byte ov14_021E95C8
	thumb_func_end ov14_021ED7B8

	thumb_func_start ov14_021ED7DC
ov14_021ED7DC: @ 0x021ED7DC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x34]
	ldr r2, _021ED81C @ =0x0000044D
	ldrb r3, [r1, r2]
	lsrs r6, r3, #0x1f
	lsls r5, r3, #0x1e
	subs r5, r5, r6
	movs r3, #0x1e
	rors r5, r3
	adds r3, r2, #0
	adds r5, r6, r5
	subs r3, #0x11
	str r5, [r1, r3]
	ldr r3, [r4, #0x34]
	subs r2, #0x11
	ldr r2, [r3, r2]
	movs r1, #0xa
	bl ov14_021F6AC0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x27
	bl ov14_021F6844
	movs r0, #0x42
	pop {r4, r5, r6, pc}
	.align 2, 0
_021ED81C: .4byte 0x0000044D
	thumb_func_end ov14_021ED7DC

	thumb_func_start ov14_021ED820
ov14_021ED820: @ 0x021ED820
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	movs r1, #2
	mvns r1, r1
	cmp r0, r1
	bhi _021ED856
	bhs _021ED8E0
	cmp r0, #7
	bhi _021ED914
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021ED846: @ jump table
	.2byte _021ED860 - _021ED846 - 2 @ case 0
	.2byte _021ED872 - _021ED846 - 2 @ case 1
	.2byte _021ED884 - _021ED846 - 2 @ case 2
	.2byte _021ED896 - _021ED846 - 2 @ case 3
	.2byte _021ED8A8 - _021ED846 - 2 @ case 4
	.2byte _021ED8BC - _021ED846 - 2 @ case 5
	.2byte _021ED8CE - _021ED846 - 2 @ case 6
	.2byte _021ED8F8 - _021ED846 - 2 @ case 7
_021ED856:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _021ED902
	b _021ED914
_021ED860:
	ldr r0, _021ED918 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F129C
	movs r0, #0x42
	pop {r4, pc}
_021ED872:
	ldr r0, _021ED918 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F129C
	movs r0, #0x42
	pop {r4, pc}
_021ED884:
	ldr r0, _021ED918 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #2
	bl ov14_021F129C
	movs r0, #0x42
	pop {r4, pc}
_021ED896:
	ldr r0, _021ED918 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021F129C
	movs r0, #0x42
	pop {r4, pc}
_021ED8A8:
	ldr r0, _021ED91C @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov14_021F1228
	movs r0, #0x42
	pop {r4, pc}
_021ED8BC:
	ldr r0, _021ED91C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F1228
	movs r0, #0x42
	pop {r4, pc}
_021ED8CE:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r0, r4, #0
	bl ov14_021F131C
	pop {r4, pc}
_021ED8E0:
	ldr r0, _021ED91C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021ED914
	adds r0, r4, #0
	movs r1, #0x49
	bl ov14_021F0244
	pop {r4, pc}
_021ED8F8:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021ED902:
	ldr r0, _021ED91C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xa6
	bl ov14_021F2270
	pop {r4, pc}
_021ED914:
	movs r0, #0x42
	pop {r4, pc}
	.align 2, 0
_021ED918: .4byte 0x000005DD
_021ED91C: .4byte 0x000005DC
	thumb_func_end ov14_021ED820

	thumb_func_start ov14_021ED920
ov14_021ED920: @ 0x021ED920
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8588
	ldr r1, _021ED93C @ =ov14_021E9604
	adds r0, r4, #0
	movs r2, #0x44
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED93C: .4byte ov14_021E9604
	thumb_func_end ov14_021ED920

	thumb_func_start ov14_021ED940
ov14_021ED940: @ 0x021ED940
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E81D8
	ldr r1, _021ED95C @ =ov14_021E96A8
	adds r0, r4, #0
	movs r2, #0x45
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021ED95C: .4byte ov14_021E96A8
	thumb_func_end ov14_021ED940

	thumb_func_start ov14_021ED960
ov14_021ED960: @ 0x021ED960
	ldr r3, _021ED968 @ =ov14_021F1058
	movs r1, #0x37
	bx r3
	nop
_021ED968: .4byte ov14_021F1058
	thumb_func_end ov14_021ED960

	thumb_func_start ov14_021ED96C
ov14_021ED96C: @ 0x021ED96C
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x34]
	ldr r1, _021ED9A8 @ =0x0000044D
	ldrb r1, [r2, r1]
	bl ov14_021E78AC
	ldr r1, [r4, #0x34]
	ldr r0, _021ED9A8 @ =0x0000044D
	ldrb r2, [r1, r0]
	ldr r0, [r4, #4]
	cmp r2, #0x10
	bhs _021ED98E
	ldrb r1, [r4, #0x1f]
	bl FUN_02073EC8
	b _021ED996
_021ED98E:
	ldrb r1, [r4, #0x1f]
	adds r2, #0x10
	bl FUN_02073EC8
_021ED996:
	adds r0, r4, #0
	bl ov14_021F4530
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021F4958
	movs r0, #0x48
	pop {r4, pc}
	.align 2, 0
_021ED9A8: .4byte 0x0000044D
	thumb_func_end ov14_021ED96C

	thumb_func_start ov14_021ED9AC
ov14_021ED9AC: @ 0x021ED9AC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0
	movs r3, #2
	ldr r0, [r0, #0x18]
	adds r2, r1, #0
	lsls r3, r3, #8
	bl FUN_020032A4
	movs r3, #0
	movs r2, #3
	str r3, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _021ED9E8 @ =0x00007FFF
	movs r1, #1
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	lsls r2, r2, #0xe
	ldr r0, [r0, #0x18]
	bl FUN_02003370
	movs r0, #0x46
	str r0, [r4, #0x30]
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021ED9E8: .4byte 0x00007FFF
	thumb_func_end ov14_021ED9AC

	thumb_func_start ov14_021ED9EC
ov14_021ED9EC: @ 0x021ED9EC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r3, #0
	ldr r0, _021EDA18 @ =0x00007FFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	movs r2, #3
	ldr r0, [r0, #0x18]
	movs r1, #1
	lsls r2, r2, #0xe
	bl FUN_02003370
	movs r0, #0x42
	str r0, [r4, #0x30]
	movs r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021EDA18: .4byte 0x00007FFF
	thumb_func_end ov14_021ED9EC

	thumb_func_start ov14_021EDA1C
ov14_021EDA1C: @ 0x021EDA1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021EDA36
	movs r0, #0x75
	pop {r4, pc}
_021EDA36:
	movs r0, #0xc
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EDA1C

	thumb_func_start ov14_021EDA3C
ov14_021EDA3C: @ 0x021EDA3C
	push {r3, lr}
	ldr r0, [r0, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #0x24
	pop {r3, pc}
	thumb_func_end ov14_021EDA3C

	thumb_func_start ov14_021EDA4C
ov14_021EDA4C: @ 0x021EDA4C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A14
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EDB3C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EDAB8
	ldr r2, [r4, #0x34]
	ldr r1, _021EDDA4 @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021EDA96
	ldr r1, _021EDDA8 @ =0x021F7D2C
	adds r0, r4, #0
	movs r2, #4
	bl ov14_021F5EE4
_021EDA96:
	ldr r0, _021EDDAC @ =0x000005EB
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F0418
	pop {r3, r4, r5, pc}
_021EDAB8:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021EDB1C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021EDDB0 @ =ov14_021EA130
	adds r0, r4, #0
	movs r2, #0x59
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021EDB1C:
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x51
	pop {r3, r4, r5, pc}
_021EDB3C:
	adds r0, r4, #0
	bl ov14_021F6E8C
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021EDB82
	blo _021EDB50
	b _021EDCBA
_021EDB50:
	cmp r5, #0x26
	bhi _021EDB76
	subs r0, #0x1e
	bmi _021EDB80
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EDB64: @ jump table
	.2byte _021EDC32 - _021EDB64 - 2 @ case 0
	.2byte _021EDC4E - _021EDB64 - 2 @ case 1
	.2byte _021EDC84 - _021EDB64 - 2 @ case 2
	.2byte _021EDCFA - _021EDB64 - 2 @ case 3
	.2byte _021EDB98 - _021EDB64 - 2 @ case 4
	.2byte _021EDBBC - _021EDB64 - 2 @ case 5
	.2byte _021EDBD2 - _021EDB64 - 2 @ case 6
	.2byte _021EDBEC - _021EDB64 - 2 @ case 7
	.2byte _021EDBFE - _021EDB64 - 2 @ case 8
_021EDB76:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	bne _021EDB80
	b _021EDD6C
_021EDB80:
	b _021EDDC4
_021EDB82:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021EDB8E
	bne _021EDB8C
	b _021EDD12
_021EDB8C:
	b _021EDDC4
_021EDB8E:
	adds r0, r1, #2
	cmp r5, r0
	bne _021EDB96
	b _021EDD24
_021EDB96:
	b _021EDDC4
_021EDB98:
	ldr r0, [r4, #8]
	bl FUN_02074640
	cmp r0, #6
	beq _021EDBAA
	ldr r0, _021EDDB4 @ =0x000005DD
	bl FUN_0200604C
	b _021EDBB0
_021EDBAA:
	ldr r0, _021EDDB8 @ =0x000005F3
	bl FUN_0200604C
_021EDBB0:
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0xa7
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EDBBC:
	ldr r0, _021EDDB4 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x23
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0x97
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EDBD2:
	ldr r0, _021EDDB4 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x99
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EDBEC:
	ldr r0, _021EDDB4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0x9b
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EDBFE:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, _021EDDBC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xa8
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EDC32:
	ldr r0, _021EDDB4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	adds r0, r4, #0
	bl ov14_021F1128
	pop {r3, r4, r5, pc}
_021EDC4E:
	ldr r0, _021EDDBC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x1e
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	adds r0, r4, #0
	movs r1, #0x51
	bl ov14_021F028C
	pop {r3, r4, r5, pc}
_021EDC84:
	ldr r0, _021EDDBC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x1e
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	adds r0, r4, #0
	movs r1, #0x51
	bl ov14_021F0314
	pop {r3, r4, r5, pc}
_021EDCBA:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x1e
	bhs _021EDCD0
	adds r0, r4, #0
	bl ov14_021E7588
	b _021EDCEA
_021EDCD0:
	cmp r1, #0x22
	beq _021EDCEA
	cmp r1, #0x23
	beq _021EDCEA
	cmp r1, #0x24
	beq _021EDCEA
	cmp r1, #0x25
	beq _021EDCEA
	cmp r1, #0x26
	beq _021EDCEA
	adds r0, r4, #0
	bl ov14_021E765C
_021EDCEA:
	ldr r0, _021EDDBC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x58
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EDCFA:
	ldr r0, _021EDDB4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E765C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x93
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EDD12:
	ldr r0, _021EDDB4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x94
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EDD24:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	cmp r0, #0x1e
	bne _021EDE12
	ldr r0, _021EDDC0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	beq _021EDD50
	ldr r0, _021EDDBC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0x51
	bl ov14_021F028C
	pop {r3, r4, r5, pc}
_021EDD50:
	movs r0, #0x10
	tst r0, r1
	beq _021EDE12
	ldr r0, _021EDDBC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0x51
	bl ov14_021F0314
	pop {r3, r4, r5, pc}
_021EDD6C:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x1e
	bhs _021EDD82
	adds r0, r4, #0
	bl ov14_021E7588
	b _021EDD9C
_021EDD82:
	cmp r1, #0x22
	beq _021EDD9C
	cmp r1, #0x23
	beq _021EDD9C
	cmp r1, #0x24
	beq _021EDD9C
	cmp r1, #0x25
	beq _021EDD9C
	cmp r1, #0x26
	beq _021EDD9C
	adds r0, r4, #0
	bl ov14_021E765C
_021EDD9C:
	ldr r0, _021EDDBC @ =0x000005DC
	bl FUN_0200604C
	b _021EDE12
	.align 2, 0
_021EDDA4: .4byte 0x000040B8
_021EDDA8: .4byte 0x021F7D2C
_021EDDAC: .4byte 0x000005EB
_021EDDB0: .4byte ov14_021EA130
_021EDDB4: .4byte 0x000005DD
_021EDDB8: .4byte 0x000005F3
_021EDDBC: .4byte 0x000005DC
_021EDDC0: .4byte 0x021D110C
_021EDDC4:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EDE12
	ldr r0, _021EDE18 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, _021EDE1C @ =0x021F7D2C
	adds r0, r4, #0
	movs r2, #4
	bl ov14_021F5EE4
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x22
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	movs r1, #0x22
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F04D4
	pop {r3, r4, r5, pc}
_021EDE12:
	movs r0, #0x51
	pop {r3, r4, r5, pc}
	nop
_021EDE18: .4byte 0x000005DD
_021EDE1C: .4byte 0x021F7D2C
	thumb_func_end ov14_021EDA4C

	thumb_func_start ov14_021EDE20
ov14_021EDE20: @ 0x021EDE20
	push {r4, lr}
	movs r1, #0
	adds r4, r0, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	adds r0, r4, #0
	bl ov14_021EDF90
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EDE20

	thumb_func_start ov14_021EDE38
ov14_021EDE38: @ 0x021EDE38
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F3044
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7ED0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x22
	strb r1, [r0]
	ldr r1, _021EDE6C @ =ov14_021E9518
	adds r0, r4, #0
	movs r2, #0x54
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EDE6C: .4byte ov14_021E9518
	thumb_func_end ov14_021EDE38

	thumb_func_start ov14_021EDE70
ov14_021EDE70: @ 0x021EDE70
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F08BC
	ldr r1, _021EDE84 @ =ov14_021E91E0
	adds r0, r4, #0
	movs r2, #0x55
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EDE84: .4byte ov14_021E91E0
	thumb_func_end ov14_021EDE70

	thumb_func_start ov14_021EDE88
ov14_021EDE88: @ 0x021EDE88
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _021EDF00 @ =0x000005EA
	bl FUN_0200604C
	adds r1, r4, #0
	ldr r0, [r4, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r1, r4, #0
	ldr r0, [r4, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	adds r0, r4, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r4, #0
	bl ov14_021E637C
	adds r0, r4, #0
	bl ov14_021F08F0
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7F4C
	ldr r1, _021EDF04 @ =ov14_021E9518
	adds r0, r4, #0
	movs r2, #0x56
	bl ov14_021F0234
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021EDF00: .4byte 0x000005EA
_021EDF04: .4byte ov14_021E9518
	thumb_func_end ov14_021EDE88

	thumb_func_start ov14_021EDF08
ov14_021EDF08: @ 0x021EDF08
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r1, _021EDF24 @ =ov14_021E95B4
	adds r0, r4, #0
	movs r2, #0x52
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EDF24: .4byte ov14_021E95B4
	thumb_func_end ov14_021EDF08

	thumb_func_start ov14_021EDF28
ov14_021EDF28: @ 0x021EDF28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0xc]
	adds r0, #0xe4
	ldr r4, [r0]
	ldr r0, _021EDF8C @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021E637C
	adds r0, r5, #0
	bl ov14_021F08F0
	ldr r0, [r5, #0x34]
	movs r1, #0x28
	bl ov14_021F6678
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _021EDF66
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	b _021EDF72
_021EDF66:
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	movs r4, #0x22
_021EDF72:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x51
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EDF8C: .4byte 0x000005EA
	thumb_func_end ov14_021EDF28

	thumb_func_start ov14_021EDF90
ov14_021EDF90: @ 0x021EDF90
	push {r3, lr}
	ldr r0, [r0, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #0x51
	pop {r3, pc}
	thumb_func_end ov14_021EDF90

	thumb_func_start ov14_021EDFA0
ov14_021EDFA0: @ 0x021EDFA0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A24
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EE0A4
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EE012
	ldr r2, [r4, #0x34]
	ldr r1, _021EE254 @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021EDFEC
	ldr r1, _021EE258 @ =0x021F7D1C
	adds r0, r4, #0
	movs r2, #4
	bl ov14_021F5EE4
_021EDFEC:
	ldr r0, _021EE25C @ =0x000005EB
	bl FUN_0200604C
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F0660
	pop {r3, r4, r5, pc}
_021EE012:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021EE084
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F5EB4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021EE260 @ =ov14_021EA130
	adds r0, r4, #0
	movs r2, #0x70
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021EE084:
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x5b
	pop {r3, r4, r5, pc}
_021EE0A4:
	adds r0, r4, #0
	bl ov14_021F6BC0
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021EE0E8
	bhs _021EE1AA
	cmp r5, #0xb
	bhi _021EE0DE
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EE0C6: @ jump table
	.2byte _021EE1FA - _021EE0C6 - 2 @ case 0
	.2byte _021EE1FA - _021EE0C6 - 2 @ case 1
	.2byte _021EE1FA - _021EE0C6 - 2 @ case 2
	.2byte _021EE1FA - _021EE0C6 - 2 @ case 3
	.2byte _021EE1FA - _021EE0C6 - 2 @ case 4
	.2byte _021EE1FA - _021EE0C6 - 2 @ case 5
	.2byte _021EE1D0 - _021EE0C6 - 2 @ case 6
	.2byte _021EE0FC - _021EE0C6 - 2 @ case 7
	.2byte _021EE10E - _021EE0C6 - 2 @ case 8
	.2byte _021EE124 - _021EE0C6 - 2 @ case 9
	.2byte _021EE13E - _021EE0C6 - 2 @ case 10
	.2byte _021EE150 - _021EE0C6 - 2 @ case 11
_021EE0DE:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	beq _021EE18A
	b _021EE1FA
_021EE0E8:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021EE0F2
	beq _021EE1E8
	b _021EE1FA
_021EE0F2:
	adds r0, r1, #2
	cmp r5, r0
	bne _021EE0FA
	b _021EE24E
_021EE0FA:
	b _021EE1FA
_021EE0FC:
	ldr r0, _021EE264 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0xa9
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EE10E:
	ldr r0, _021EE264 @ =0x000005DD
	bl FUN_0200604C
	movs r0, #8
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0x97
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EE124:
	ldr r0, _021EE264 @ =0x000005DD
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x99
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EE13E:
	ldr r0, _021EE264 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0x9b
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EE150:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, _021EE268 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xaa
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EE18A:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #6
	bhi _021EE1A0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
_021EE1A0:
	ldr r0, _021EE268 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #0x5b
	pop {r3, r4, r5, pc}
_021EE1AA:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #6
	bhi _021EE1C0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
_021EE1C0:
	ldr r0, _021EE268 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x6f
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EE1D0:
	ldr r0, _021EE264 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E765C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x93
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EE1E8:
	ldr r0, _021EE264 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x94
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EE1FA:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EE24E
	ldr r0, _021EE264 @ =0x000005DD
	bl FUN_0200604C
	ldr r1, _021EE258 @ =0x021F7D1C
	adds r0, r4, #0
	movs r2, #4
	bl ov14_021F5EE4
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #7
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	movs r1, #7
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F0794
	pop {r3, r4, r5, pc}
_021EE24E:
	movs r0, #0x5b
	pop {r3, r4, r5, pc}
	nop
_021EE254: .4byte 0x000040B8
_021EE258: .4byte 0x021F7D1C
_021EE25C: .4byte 0x000005EB
_021EE260: .4byte ov14_021EA130
_021EE264: .4byte 0x000005DD
_021EE268: .4byte 0x000005DC
	thumb_func_end ov14_021EDFA0

	thumb_func_start ov14_021EE26C
ov14_021EE26C: @ 0x021EE26C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r4, [r1]
	subs r4, #0x1e
	adds r1, r4, #0
	bl ov14_021E6480
	cmp r0, #0
	bne _021EE29A
	ldr r0, _021EE320 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0x25
	bl ov14_021F67B0
	movs r0, #0x5d
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EE29A:
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021EE2D2
	ldr r0, _021EE320 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #6
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0x5d
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EE2D2:
	adds r0, r4, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021EE2FA
	ldr r0, _021EE320 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0x5d
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EE2FA:
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #2
	movs r2, #1
	bl ov14_021F3488
	adds r0, r5, #0
	bl ov14_021F40DC
	ldr r1, _021EE324 @ =ov14_021E96C8
	adds r0, r5, #0
	movs r2, #0x5e
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021EE320: .4byte 0x000005F3
_021EE324: .4byte ov14_021E96C8
	thumb_func_end ov14_021EE26C

	thumb_func_start ov14_021EE328
ov14_021EE328: @ 0x021EE328
	ldr r3, _021EE330 @ =ov14_021F0234
	ldr r1, _021EE334 @ =ov14_021E9450
	movs r2, #0xe
	bx r3
	.align 2, 0
_021EE330: .4byte ov14_021F0234
_021EE334: .4byte ov14_021E9450
	thumb_func_end ov14_021EE328

	thumb_func_start ov14_021EE338
ov14_021EE338: @ 0x021EE338
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F4BC0
	adds r0, r4, #0
	bl ov14_021F4848
	adds r0, r4, #0
	bl ov14_021F48B4
	adds r0, r4, #0
	bl ov14_021F57B8
	adds r0, r4, #0
	movs r1, #0x5f
	bl ov14_021F10B4
	pop {r4, pc}
	thumb_func_end ov14_021EE338

	thumb_func_start ov14_021EE35C
ov14_021EE35C: @ 0x021EE35C
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F60A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8560
	ldr r1, _021EE37C @ =ov14_021E95C8
	adds r0, r4, #0
	movs r2, #0x60
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EE37C: .4byte ov14_021E95C8
	thumb_func_end ov14_021EE35C

	thumb_func_start ov14_021EE380
ov14_021EE380: @ 0x021EE380
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	ldr r2, _021EE3C4 @ =0x0000043C
	str r1, [r0, r2]
	ldr r3, [r4, #0x34]
	adds r0, r4, #0
	ldr r2, [r3, r2]
	movs r1, #1
	bl ov14_021F6AC0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6654
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	movs r3, #0x27
	bl ov14_021F685C
	movs r0, #0x61
	pop {r4, pc}
	nop
_021EE3C4: .4byte 0x0000043C
	thumb_func_end ov14_021EE380

	thumb_func_start ov14_021EE3C8
ov14_021EE3C8: @ 0x021EE3C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	movs r1, #2
	mvns r1, r1
	cmp r0, r1
	bhi _021EE402
	bhs _021EE472
	cmp r0, #9
	bhi _021EE4A4
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021EE3EE: @ jump table
	.2byte _021EE40C - _021EE3EE - 2 @ case 0
	.2byte _021EE416 - _021EE3EE - 2 @ case 1
	.2byte _021EE420 - _021EE3EE - 2 @ case 2
	.2byte _021EE42A - _021EE3EE - 2 @ case 3
	.2byte _021EE434 - _021EE3EE - 2 @ case 4
	.2byte _021EE43E - _021EE3EE - 2 @ case 5
	.2byte _021EE448 - _021EE3EE - 2 @ case 6
	.2byte _021EE45A - _021EE3EE - 2 @ case 7
	.2byte _021EE46A - _021EE3EE - 2 @ case 8
	.2byte _021EE48A - _021EE3EE - 2 @ case 9
_021EE402:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _021EE494
	b _021EE4A4
_021EE40C:
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F1448
	pop {r4, pc}
_021EE416:
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F1448
	pop {r4, pc}
_021EE420:
	adds r0, r4, #0
	movs r1, #2
	bl ov14_021F1448
	pop {r4, pc}
_021EE42A:
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021F1448
	pop {r4, pc}
_021EE434:
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F1448
	pop {r4, pc}
_021EE43E:
	adds r0, r4, #0
	movs r1, #5
	bl ov14_021F1448
	pop {r4, pc}
_021EE448:
	ldr r0, _021EE4A8 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov14_021F1504
	pop {r4, pc}
_021EE45A:
	ldr r0, _021EE4A8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F1504
	pop {r4, pc}
_021EE46A:
	adds r0, r4, #0
	bl ov14_021F1540
	pop {r4, pc}
_021EE472:
	ldr r0, _021EE4A8 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021EE4A4
	adds r0, r4, #0
	movs r1, #0x71
	bl ov14_021F0244
	pop {r4, pc}
_021EE48A:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021EE494:
	ldr r0, _021EE4A8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F1534
	pop {r4, pc}
_021EE4A4:
	movs r0, #0x61
	pop {r4, pc}
	.align 2, 0
_021EE4A8: .4byte 0x000005DC
	thumb_func_end ov14_021EE3C8

	thumb_func_start ov14_021EE4AC
ov14_021EE4AC: @ 0x021EE4AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8588
	ldr r1, _021EE4D4 @ =ov14_021E9604
	adds r0, r4, #0
	movs r2, #0x63
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021EE4D4: .4byte ov14_021E9604
	thumb_func_end ov14_021EE4AC

	thumb_func_start ov14_021EE4D8
ov14_021EE4D8: @ 0x021EE4D8
	ldr r3, _021EE4E0 @ =ov14_021F10DC
	movs r1, #0x64
	bx r3
	nop
_021EE4E0: .4byte ov14_021F10DC
	thumb_func_end ov14_021EE4D8

	thumb_func_start ov14_021EE4E4
ov14_021EE4E4: @ 0x021EE4E4
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F4CA0
	ldr r1, _021EE4F8 @ =ov14_021E98AC
	adds r0, r4, #0
	movs r2, #0x65
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EE4F8: .4byte ov14_021E98AC
	thumb_func_end ov14_021EE4E4

	thumb_func_start ov14_021EE4FC
ov14_021EE4FC: @ 0x021EE4FC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	movs r2, #7
	bl ov14_021F6AC0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	bl ov14_021F3F6C
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F40E8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	movs r0, #0xe
	pop {r4, pc}
	thumb_func_end ov14_021EE4FC

	thumb_func_start ov14_021EE538
ov14_021EE538: @ 0x021EE538
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8588
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r1, _021EE574 @ =ov14_021E99F0
	adds r0, r4, #0
	movs r2, #0x67
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EE574: .4byte ov14_021E99F0
	thumb_func_end ov14_021EE538

	thumb_func_start ov14_021EE578
ov14_021EE578: @ 0x021EE578
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r1, [r1]
	ldr r0, [r4, #4]
	bl FUN_02073F64
	cmp r0, #0x1e
	bne _021EE5A0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #4
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0x5e
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
_021EE5A0:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	adds r0, r4, #0
	bl ov14_021F4CA0
	ldr r1, _021EE5C4 @ =ov14_021E98AC
	adds r0, r4, #0
	movs r2, #0x68
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EE5C4: .4byte ov14_021E98AC
	thumb_func_end ov14_021EE578

	thumb_func_start ov14_021EE5C8
ov14_021EE5C8: @ 0x021EE5C8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8048
	ldr r1, _021EE5E4 @ =ov14_021E952C
	adds r0, r4, #0
	movs r2, #0x69
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EE5E4: .4byte ov14_021E952C
	thumb_func_end ov14_021EE5C8

	thumb_func_start ov14_021EE5E8
ov14_021EE5E8: @ 0x021EE5E8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r2, [r4, #0x1f]
	ldrb r1, [r1]
	strb r1, [r4, #0x1f]
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r1, [r1]
	cmp r2, r1
	bne _021EE604
	movs r0, #0x6a
	pop {r4, pc}
_021EE604:
	cmp r2, r1
	ldrb r1, [r4, #0x1f]
	bls _021EE62E
	bl ov14_021F2DE8
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021E7930
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl ov14_021E783C
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r1, _021EE65C @ =ov14_021E92AC
	b _021EE650
_021EE62E:
	bl ov14_021F2DE8
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021E7930
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov14_021E783C
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r1, _021EE660 @ =ov14_021E9370
_021EE650:
	adds r0, r4, #0
	movs r2, #0x6a
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021EE65C: .4byte ov14_021E92AC
_021EE660: .4byte ov14_021E9370
	thumb_func_end ov14_021EE5E8

	thumb_func_start ov14_021EE664
ov14_021EE664: @ 0x021EE664
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	movs r2, #2
	adds r1, #0x22
	strb r2, [r1]
	bl ov14_021F08BC
	ldr r1, _021EE680 @ =ov14_021E9234
	adds r0, r4, #0
	movs r2, #0x6b
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EE680: .4byte ov14_021E9234
	thumb_func_end ov14_021EE664

	thumb_func_start ov14_021EE684
ov14_021EE684: @ 0x021EE684
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r4, [r0, #0xc]
	ldr r0, _021EE6C8 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021E637C
	adds r1, r4, #0
	adds r1, #0xe4
	adds r4, #0xe8
	ldr r1, [r1]
	ldr r2, [r4]
	adds r0, r5, #0
	bl ov14_021E6548
	adds r0, r5, #0
	bl ov14_021F08F0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8094
	ldr r1, _021EE6CC @ =ov14_021E954C
	adds r0, r5, #0
	movs r2, #0x6c
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021EE6C8: .4byte 0x000005EA
_021EE6CC: .4byte ov14_021E954C
	thumb_func_end ov14_021EE684

	thumb_func_start ov14_021EE6D0
ov14_021EE6D0: @ 0x021EE6D0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov14_021F5EB4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r1, _021EE6F4 @ =ov14_021E95B4
	adds r0, r4, #0
	movs r2, #0x6d
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021EE6F4: .4byte ov14_021E95B4
	thumb_func_end ov14_021EE6D0

	thumb_func_start ov14_021EE6F8
ov14_021EE6F8: @ 0x021EE6F8
	push {r4, lr}
	movs r1, #0
	adds r2, r1, #0
	adds r4, r0, #0
	bl ov14_021F6AC0
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	adds r0, r4, #0
	movs r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	movs r0, #0x5b
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EE6F8

	thumb_func_start ov14_021EE728
ov14_021EE728: @ 0x021EE728
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r4, [r0, #0xc]
	ldr r0, _021EE7B0 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021E637C
	adds r1, r4, #0
	adds r1, #0xe4
	adds r4, #0xe8
	ldr r1, [r1]
	ldr r2, [r4]
	adds r0, r5, #0
	bl ov14_021E6548
	adds r0, r5, #0
	bl ov14_021F08F0
	ldr r0, [r5, #0x34]
	movs r1, #0x28
	bl ov14_021F6678
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	cmp r1, #0xff
	bne _021EE78E
	movs r1, #0
	adds r0, r5, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r5, #0
	movs r1, #0x1e
	bl ov14_021E7588
	b _021EE7AC
_021EE78E:
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	ldr r0, [r5, #0x34]
	movs r1, #7
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
_021EE7AC:
	movs r0, #0x5b
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EE7B0: .4byte 0x000005EA
	thumb_func_end ov14_021EE728

	thumb_func_start ov14_021EE7B4
ov14_021EE7B4: @ 0x021EE7B4
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0xc
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE7B4

	thumb_func_start ov14_021EE7C4
ov14_021EE7C4: @ 0x021EE7C4
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x29
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE7C4

	thumb_func_start ov14_021EE7D4
ov14_021EE7D4: @ 0x021EE7D4
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x24
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE7D4

	thumb_func_start ov14_021EE7E4
ov14_021EE7E4: @ 0x021EE7E4
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x5b
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE7E4

	thumb_func_start ov14_021EE7F4
ov14_021EE7F4: @ 0x021EE7F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	movs r0, #0x5b
	pop {r4, pc}
	thumb_func_end ov14_021EE7F4

	thumb_func_start ov14_021EE810
ov14_021EE810: @ 0x021EE810
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x61
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE810

	thumb_func_start ov14_021EE820
ov14_021EE820: @ 0x021EE820
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x16
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE820

	thumb_func_start ov14_021EE830
ov14_021EE830: @ 0x021EE830
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x3d
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE830

	thumb_func_start ov14_021EE840
ov14_021EE840: @ 0x021EE840
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x42
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE840

	thumb_func_start ov14_021EE850
ov14_021EE850: @ 0x021EE850
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x51
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EE850

	thumb_func_start ov14_021EE860
ov14_021EE860: @ 0x021EE860
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	movs r0, #0x51
	pop {r4, pc}
	thumb_func_end ov14_021EE860

	thumb_func_start ov14_021EE87C
ov14_021EE87C: @ 0x021EE87C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A14
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EE976
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EE8CE
	ldr r0, _021EEBDC @ =0x000005EB
	bl FUN_0200604C
	ldr r2, [r4, #0x34]
	ldr r1, _021EEBE0 @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F18B0
	pop {r3, r4, r5, pc}
_021EE8CE:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021EE956
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r0, r4, #0
	bl ov14_021F40DC
	ldr r1, [r4, #0x34]
	ldr r0, _021EEBE4 @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021EE94A
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
_021EE94A:
	ldr r1, _021EEBE8 @ =ov14_021EA674
	adds r0, r4, #0
	movs r2, #0x76
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021EE956:
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x75
	pop {r3, r4, r5, pc}
_021EE976:
	adds r0, r4, #0
	bl ov14_021F74B0
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021EE9BA
	blo _021EE98A
	b _021EEB08
_021EE98A:
	cmp r5, #0x25
	bhi _021EE9AE
	subs r0, #0x1e
	bmi _021EE9B8
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EE99E: @ jump table
	.2byte _021EE9CE - _021EE99E - 2 @ case 0
	.2byte _021EE9EC - _021EE99E - 2 @ case 1
	.2byte _021EEA20 - _021EE99E - 2 @ case 2
	.2byte _021EEA54 - _021EE99E - 2 @ case 3
	.2byte _021EEA66 - _021EE99E - 2 @ case 4
	.2byte _021EEB3C - _021EE99E - 2 @ case 5
	.2byte _021EEA78 - _021EE99E - 2 @ case 6
	.2byte _021EEA8A - _021EE99E - 2 @ case 7
_021EE9AE:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	bne _021EE9B8
	b _021EEB66
_021EE9B8:
	b _021EEB92
_021EE9BA:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021EE9C6
	bne _021EE9C4
	b _021EEB54
_021EE9C4:
	b _021EEB92
_021EE9C6:
	adds r0, r1, #2
	cmp r5, r0
	beq _021EEABE
	b _021EEB92
_021EE9CE:
	ldr r0, _021EEBEC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	bl ov14_021F1128
	pop {r3, r4, r5, pc}
_021EE9EC:
	ldr r0, _021EEBF0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x1e
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0x75
	bl ov14_021F028C
	pop {r3, r4, r5, pc}
_021EEA20:
	ldr r0, _021EEBF0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x1e
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0x75
	bl ov14_021F0314
	pop {r3, r4, r5, pc}
_021EEA54:
	ldr r0, _021EEBF4 @ =0x00000632
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0xab
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EEA66:
	ldr r0, _021EEBF4 @ =0x00000632
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #9
	movs r2, #0xac
	bl ov14_021F2330
	pop {r3, r4, r5, pc}
_021EEA78:
	ldr r0, _021EEBEC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0xad
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EEA8A:
	ldr r0, _021EEBF0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xae
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EEABE:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	cmp r0, #0x1e
	beq _021EEACC
	b _021EEBD6
_021EEACC:
	ldr r0, _021EEBF8 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #0x20
	tst r0, r1
	beq _021EEAEC
	ldr r0, _021EEBF0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0x75
	bl ov14_021F028C
	pop {r3, r4, r5, pc}
_021EEAEC:
	movs r0, #0x10
	tst r0, r1
	beq _021EEBD6
	ldr r0, _021EEBF0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0x75
	bl ov14_021F0314
	pop {r3, r4, r5, pc}
_021EEB08:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x1e
	bhs _021EEB1E
	adds r0, r4, #0
	bl ov14_021E7588
	b _021EEB2C
_021EEB1E:
	cmp r1, #0x24
	beq _021EEB2C
	cmp r1, #0x25
	beq _021EEB2C
	adds r0, r4, #0
	bl ov14_021E765C
_021EEB2C:
	ldr r0, _021EEBF0 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x76
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EEB3C:
	ldr r0, _021EEBEC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E765C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x93
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EEB54:
	ldr r0, _021EEBEC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x94
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EEB66:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x1e
	bhs _021EEB7C
	adds r0, r4, #0
	bl ov14_021E7588
	b _021EEB8A
_021EEB7C:
	cmp r1, #0x24
	beq _021EEB8A
	cmp r1, #0x25
	beq _021EEB8A
	adds r0, r4, #0
	bl ov14_021E765C
_021EEB8A:
	ldr r0, _021EEBF0 @ =0x000005DC
	bl FUN_0200604C
	b _021EEBD6
_021EEB92:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EEBD6
	ldr r0, _021EEBEC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x24
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	movs r1, #0x24
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F1808
	pop {r3, r4, r5, pc}
_021EEBD6:
	movs r0, #0x75
	pop {r3, r4, r5, pc}
	nop
_021EEBDC: .4byte 0x000005EB
_021EEBE0: .4byte 0x000040B8
_021EEBE4: .4byte 0x000088C8
_021EEBE8: .4byte ov14_021EA674
_021EEBEC: .4byte 0x000005DD
_021EEBF0: .4byte 0x000005DC
_021EEBF4: .4byte 0x00000632
_021EEBF8: .4byte 0x021D110C
	thumb_func_end ov14_021EE87C

	thumb_func_start ov14_021EEBFC
ov14_021EEBFC: @ 0x021EEBFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A44
	cmp r0, #1
	bne _021EEC30
	adds r0, r4, #0
	bl ov14_021F40DC
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
_021EEC30:
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6654
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021EEC72
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	b _021EEC7C
_021EEC72:
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
_021EEC7C:
	ldr r1, _021EEC88 @ =ov14_021E9450
	adds r0, r4, #0
	movs r2, #0x7b
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021EEC88: .4byte ov14_021E9450
	thumb_func_end ov14_021EEBFC

	thumb_func_start ov14_021EEC8C
ov14_021EEC8C: @ 0x021EEC8C
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x75
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EEC8C

	thumb_func_start ov14_021EEC9C
ov14_021EEC9C: @ 0x021EEC9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	blo _021EED0C
	ldr r1, [r5, #0x34]
	ldr r0, _021EED20 @ =0x000088C8
	ldrh r0, [r1, r0]
	bl FUN_02078068
	cmp r0, #1
	bne _021EED0C
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, _021EED24 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #4
	movs r2, #0x25
	bl ov14_021F68C0
	movs r0, #0x77
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EED0C:
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0x25
	bl ov14_021F68C0
	adds r0, r5, #0
	movs r1, #2
	bl ov14_021F0254
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EED20: .4byte 0x000088C8
_021EED24: .4byte 0x000005F3
	thumb_func_end ov14_021EEC9C

	thumb_func_start ov14_021EED28
ov14_021EED28: @ 0x021EED28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #0
	bne _021EEDAE
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0x1e
	blo _021EED48
	subs r4, #0x1e
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_021EED48:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0x25
	bl ov14_021F68C0
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F5FBC
	ldr r1, [r5, #0x34]
	ldr r0, _021EEDB4 @ =0x000088C8
	movs r2, #0
	strh r2, [r1, r0]
	movs r0, #0x77
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EEDAE:
	movs r0, #0x79
	pop {r3, r4, r5, pc}
	nop
_021EEDB4: .4byte 0x000088C8
	thumb_func_end ov14_021EED28

	thumb_func_start ov14_021EEDB8
ov14_021EEDB8: @ 0x021EEDB8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r4, [r1]
	cmp r4, #0x1e
	bhs _021EEDEA
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	adds r0, r5, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	b _021EEDF8
_021EEDEA:
	subs r4, #0x1e
	lsls r1, r4, #0x10
	lsrs r4, r1, #0x10
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
_021EEDF8:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	adds r0, r5, #0
	bl ov14_021F40DC
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
	ldr r0, [r5, #0x34]
	movs r1, #0x25
	bl ov14_021F6654
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021EEE78
	adds r0, r5, #0
	movs r1, #0x81
	movs r2, #1
	bl ov14_021F3488
	b _021EEE82
_021EEE78:
	adds r0, r5, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
_021EEE82:
	ldr r1, _021EEE90 @ =ov14_021E9450
	adds r0, r5, #0
	movs r2, #0x7b
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021EEE90: .4byte ov14_021E9450
	thumb_func_end ov14_021EEDB8

	thumb_func_start ov14_021EEE94
ov14_021EEE94: @ 0x021EEE94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	bne _021EEEA8
	movs r0, #0x7b
	pop {r4, pc}
_021EEEA8:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	adds r4, #0x21
	ldrb r0, [r4]
	cmp r0, #0x1e
	blo _021EEED0
	movs r0, #0x8b
	pop {r4, pc}
_021EEED0:
	movs r0, #0x75
	pop {r4, pc}
	thumb_func_end ov14_021EEE94

	thumb_func_start ov14_021EEED4
ov14_021EEED4: @ 0x021EEED4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0x1e
	blo _021EEEE6
	subs r4, #0x1e
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_021EEEE6:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, _021EEF30 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0x25
	bl ov14_021F68C0
	movs r0, #0x77
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EEF30: .4byte 0x000005F3
	thumb_func_end ov14_021EEED4

	thumb_func_start ov14_021EEF34
ov14_021EEF34: @ 0x021EEF34
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0x1e
	blo _021EEF46
	subs r4, #0x1e
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_021EEF46:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldrh r1, [r5, #0x1c]
	adds r0, r5, #0
	movs r2, #0x25
	bl ov14_021F6768
	movs r0, #0x77
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021EEF34

	thumb_func_start ov14_021EEF8C
ov14_021EEF8C: @ 0x021EEF8C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r2, [r5, #0x34]
	adds r0, #0x21
	ldr r4, [r2, #0xc]
	ldrb r0, [r0]
	ldrh r1, [r4]
	cmp r1, r0
	beq _021EEFA6
	ldr r0, _021EF01C @ =0x000088C8
	ldrh r0, [r2, r0]
	cmp r0, #0
	bne _021EEFE2
_021EEFA6:
	adds r0, r5, #0
	bl ov14_021F1F38
	ldr r1, [r5, #0x34]
	ldr r0, _021EF01C @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021EEFCA
	ldr r0, _021EF020 @ =0x000005EA
	bl FUN_0200604C
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F34C8
_021EEFCA:
	ldr r0, [r5, #0x34]
	movs r1, #0x24
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x75
	pop {r3, r4, r5, pc}
_021EEFE2:
	ldr r0, _021EF020 @ =0x000005EA
	bl FUN_0200604C
	ldrh r1, [r4]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #1
	bl ov14_021F34C8
	adds r0, r5, #0
	bl ov14_021F40DC
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #0x7f
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EF01C: .4byte 0x000088C8
_021EF020: .4byte 0x000005EA
	thumb_func_end ov14_021EEF8C

	thumb_func_start ov14_021EF024
ov14_021EF024: @ 0x021EF024
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	bne _021EF038
	movs r0, #0x7f
	pop {r3, r4, r5, r6, r7, pc}
_021EF038:
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	movs r2, #6
	ldr r4, [r0, #0xc]
	adds r0, r5, #0
	ldrh r1, [r4]
	movs r3, #0
	bl ov14_021E6070
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r4]
	ldr r6, [r5, #0x34]
	ldr r3, _021EF17C @ =0x000088C8
	adds r0, r5, #0
	movs r2, #6
	adds r3, r6, r3
	bl ov14_021E6094
	ldrb r1, [r5, #0x1f]
	ldrh r2, [r4]
	adds r0, r5, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EF092
	ldrh r2, [r4]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r2
	ldr r3, _021EF180 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EF092:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl ov14_021E7588
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	ldr r3, _021EF17C @ =0x000088C8
	adds r1, #0x21
	strh r7, [r0, r3]
	ldr r6, [r5, #0x34]
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #6
	adds r3, r6, r3
	bl ov14_021E6094
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EF0DE
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r2, [r0]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r2
	ldr r3, _021EF180 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EF0DE:
	ldr r1, [r5, #0x34]
	ldr r0, _021EF17C @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _021EF13E
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F1F38
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r1, _021EF184 @ =ov14_021E94BC
	adds r0, r5, #0
	movs r2, #0x75
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
_021EF13E:
	ldr r0, _021EF188 @ =0x000005EB
	bl FUN_0200604C
	ldr r0, [r5, #0x34]
	ldr r1, _021EF17C @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	bl ov14_021F39D0
	ldr r1, _021EF18C @ =ov14_021EA728
	adds r0, r5, #0
	movs r2, #0x80
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EF17C: .4byte 0x000088C8
_021EF180: .4byte 0x00004094
_021EF184: .4byte ov14_021E94BC
_021EF188: .4byte 0x000005EB
_021EF18C: .4byte ov14_021EA728
	thumb_func_end ov14_021EF024

	thumb_func_start ov14_021EF190
ov14_021EF190: @ 0x021EF190
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r2, #0
	ldr r4, [r0, #0xc]
	ldrh r1, [r4]
	bl ov14_021F34C8
	ldr r0, _021EF1E8 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021F40DC
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r5, #0
	ldrh r1, [r4]
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F1F38
	movs r0, #0x81
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EF1E8: .4byte 0x000005EA
	thumb_func_end ov14_021EF190

	thumb_func_start ov14_021EF1EC
ov14_021EF1EC: @ 0x021EF1EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	bne _021EF200
	movs r0, #0x81
	pop {r4, pc}
_021EF200:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r1, _021EF244 @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0x75
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021EF244: .4byte ov14_021E94BC
	thumb_func_end ov14_021EF1EC

	thumb_func_start ov14_021EF248
ov14_021EF248: @ 0x021EF248
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A34
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EF2E2
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EF28C
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F19F0
	pop {r3, r4, r5, pc}
_021EF28C:
	adds r0, r4, #0
	bl ov14_021E765C
	ldr r0, [r4, #0x34]
	adds r5, #0x1e
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021EF2C4
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021EF2C4:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021EF2DE
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021EF2DE:
	movs r0, #0x82
	pop {r3, r4, r5, pc}
_021EF2E2:
	bl ov14_021F6A14
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EF370
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EF31C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F19F0
	pop {r3, r4, r5, pc}
_021EF31C:
	adds r0, r4, #0
	bl ov14_021E765C
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021EF352
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021EF352:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021EF36C
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021EF36C:
	movs r0, #0x82
	pop {r3, r4, r5, pc}
_021EF370:
	adds r0, r4, #0
	bl ov14_021F7B7C
	cmp r0, #1
	bne _021EF3B8
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EF3B4
	ldr r0, _021EF6C8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x21
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #0x97
	bl ov14_021F2330
	pop {r3, r4, r5, pc}
_021EF3B4:
	movs r0, #0x82
	pop {r3, r4, r5, pc}
_021EF3B8:
	adds r0, r4, #0
	bl ov14_021F70C0
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021EF3FE
	blo _021EF3CC
	b _021EF5A6
_021EF3CC:
	cmp r5, #0x2d
	bhi _021EF3F4
	subs r0, #0x24
	bmi _021EF3FC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EF3E0: @ jump table
	.2byte _021EF63A - _021EF3E0 - 2 @ case 0
	.2byte _021EF414 - _021EF3E0 - 2 @ case 1
	.2byte _021EF42A - _021EF3E0 - 2 @ case 2
	.2byte _021EF440 - _021EF3E0 - 2 @ case 3
	.2byte _021EF456 - _021EF3E0 - 2 @ case 4
	.2byte _021EF46C - _021EF3E0 - 2 @ case 5
	.2byte _021EF482 - _021EF3E0 - 2 @ case 6
	.2byte _021EF498 - _021EF3E0 - 2 @ case 7
	.2byte _021EF50A - _021EF3E0 - 2 @ case 8
	.2byte _021EF57A - _021EF3E0 - 2 @ case 9
_021EF3F4:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	beq _021EF410
_021EF3FC:
	b _021EF6A2
_021EF3FE:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021EF40A
	bne _021EF408
	b _021EF64C
_021EF408:
	b _021EF6A2
_021EF40A:
	adds r0, r1, #2
	cmp r5, r0
	bne _021EF412
_021EF410:
	b _021EF6C4
_021EF412:
	b _021EF6A2
_021EF414:
	ldr r0, _021EF6C8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021EF42A:
	ldr r0, _021EF6C8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021EF440:
	ldr r0, _021EF6C8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #2
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021EF456:
	ldr r0, _021EF6C8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021EF46C:
	ldr r0, _021EF6C8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021EF482:
	ldr r0, _021EF6C8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #5
	bl ov14_021F0D58
	pop {r3, r4, r5, pc}
_021EF498:
	ldr r0, _021EF6CC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	movs r1, #0
	adds r0, r4, #0
	mvns r1, r1
	bl ov14_021F1004
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021EF4EC
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021EF4EC:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021EF506
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021EF506:
	movs r0, #0x82
	pop {r3, r4, r5, pc}
_021EF50A:
	ldr r0, _021EF6CC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F1004
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021EF55C
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021EF55C:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021EF576
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0D34
	pop {r3, r4, r5, pc}
_021EF576:
	movs r0, #0x82
	pop {r3, r4, r5, pc}
_021EF57A:
	ldr r0, _021EF6CC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0xaf
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EF5A6:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x24
	bhs _021EF600
	adds r0, r4, #0
	bl ov14_021E7588
	cmp r0, #1
	ldr r1, [r4, #0x34]
	bne _021EF5E4
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #0
	bne _021EF622
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F6408
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
	b _021EF622
_021EF5E4:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021EF622
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021EF622
_021EF600:
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021EF622
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
_021EF622:
	ldr r0, _021EF6CC @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021EF6C4
	adds r0, r4, #0
	movs r1, #0x83
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EF63A:
	ldr r0, _021EF6D0 @ =0x00000633
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xa1
	bl ov14_021F2490
	pop {r3, r4, r5, pc}
_021EF64C:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #0
	bne _021EF66E
	ldr r0, _021EF6D0 @ =0x00000633
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xa1
	bl ov14_021F2490
	pop {r3, r4, r5, pc}
_021EF66E:
	ldr r0, _021EF6CC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	movs r1, #0x82
	bl ov14_021F0EE8
	pop {r3, r4, r5, pc}
_021EF6A2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EF6C4
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021E7588
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F1B4C
	pop {r3, r4, r5, pc}
_021EF6C4:
	movs r0, #0x82
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EF6C8: .4byte 0x000005DD
_021EF6CC: .4byte 0x000005DC
_021EF6D0: .4byte 0x00000633
	thumb_func_end ov14_021EF248

	thumb_func_start ov14_021EF6D4
ov14_021EF6D4: @ 0x021EF6D4
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x82
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EF6D4

	thumb_func_start ov14_021EF6E4
ov14_021EF6E4: @ 0x021EF6E4
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F40DC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
	movs r0, #0x85
	pop {r4, pc}
	thumb_func_end ov14_021EF6E4

	thumb_func_start ov14_021EF6FC
ov14_021EF6FC: @ 0x021EF6FC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldr r4, [r1, #0xc]
	movs r1, #0x10
	bl FUN_020199E4
	cmp r0, #0
	beq _021EF718
	movs r0, #0x85
	pop {r3, r4, r5, r6, r7, pc}
_021EF718:
	adds r0, r5, #0
	adds r0, #0x21
	ldrh r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _021EF784
	adds r0, r5, #0
	ldrh r4, [r4, #2]
	bl ov14_021F1F38
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r1, [r5, #0x34]
	ldr r0, _021EF898 @ =0x000088C8
	ldrh r0, [r1, r0]
	bl FUN_02078068
	cmp r0, #1
	bne _021EF776
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r4, r0
	beq _021EF776
	ldr r0, _021EF89C @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0x25
	bl ov14_021F6730
	movs r0, #0x87
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021EF776:
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x82
	pop {r3, r4, r5, r6, r7, pc}
_021EF784:
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #1
	bl ov14_021F34C8
	ldrh r1, [r4]
	adds r0, r5, #0
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r4]
	ldr r6, [r5, #0x34]
	ldr r3, _021EF898 @ =0x000088C8
	adds r0, r5, #0
	movs r2, #6
	adds r3, r6, r3
	bl ov14_021E6094
	ldrb r1, [r5, #0x1f]
	ldrh r2, [r4]
	adds r0, r5, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EF7DE
	ldrh r2, [r4]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r2
	ldr r3, _021EF8A0 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EF7DE:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl ov14_021E7588
	ldrh r1, [r4]
	ldr r0, [r5, #0x34]
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	ldr r3, _021EF898 @ =0x000088C8
	adds r1, #0x21
	strh r7, [r0, r3]
	ldr r6, [r5, #0x34]
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #6
	adds r3, r6, r3
	bl ov14_021E6094
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EF838
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r2, [r0]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r2
	ldr r3, _021EF8A0 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EF838:
	ldr r0, [r5, #0x34]
	ldr r1, _021EF898 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _021EF85E
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F1F38
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x82
	pop {r3, r4, r5, r6, r7, pc}
_021EF85E:
	bl ov14_021F3844
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	bl ov14_021F39D0
	ldr r0, _021EF8A4 @ =0x000005EB
	bl FUN_0200604C
	ldr r1, _021EF8A8 @ =ov14_021EA928
	adds r0, r5, #0
	movs r2, #0x86
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EF898: .4byte 0x000088C8
_021EF89C: .4byte 0x000005F3
_021EF8A0: .4byte 0x00004094
_021EF8A4: .4byte 0x000005EB
_021EF8A8: .4byte ov14_021EA928
	thumb_func_end ov14_021EF6FC

	thumb_func_start ov14_021EF8AC
ov14_021EF8AC: @ 0x021EF8AC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r2, #0
	ldr r7, [r0, #0xc]
	ldrh r1, [r7]
	bl ov14_021F34C8
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r6, [r0]
	adds r0, r5, #0
	ldrh r4, [r7, #2]
	ldrh r1, [r7]
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F1F38
	ldr r3, [r5, #0x34]
	ldr r1, _021EF918 @ =0x000088C8
	movs r2, #0
	ldrh r0, [r3, r1]
	strh r2, [r3, r1]
	bl FUN_02078068
	cmp r0, #1
	bne _021EF908
	cmp r4, r6
	beq _021EF908
	ldr r0, _021EF91C @ =0x000005F3
	bl FUN_0200604C
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r5, #0
	movs r1, #0x25
	bl ov14_021F6730
	movs r0, #0x87
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021EF908:
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x82
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EF918: .4byte 0x000088C8
_021EF91C: .4byte 0x000005F3
	thumb_func_end ov14_021EF8AC

	thumb_func_start ov14_021EF920
ov14_021EF920: @ 0x021EF920
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6688
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x82
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021EF920

	thumb_func_start ov14_021EF93C
ov14_021EF93C: @ 0x021EF93C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov14_021F7A50
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F90
	cmp r0, #0
	bne _021EF956
	movs r4, #1
	mvns r4, r4
_021EF956:
	cmp r4, #0x24
	bhi _021EF95E
	beq _021EF990
	b _021EF9A0
_021EF95E:
	adds r0, r4, #4
	cmp r0, #3
	bhi _021EF9A0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EF970: @ jump table
	.2byte _021EF988 - _021EF970 - 2 @ case 0
	.2byte _021EF978 - _021EF970 - 2 @ case 1
	.2byte _021EF990 - _021EF970 - 2 @ case 2
	.2byte _021EF9B0 - _021EF970 - 2 @ case 3
_021EF978:
	ldr r0, _021EF9B4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0x89
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EF988:
	ldr r0, _021EF9B4 @ =0x000005DC
	bl FUN_0200604C
	b _021EF9B0
_021EF990:
	ldr r0, _021EF9B8 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0xff
	bl ov14_021F1C4C
	pop {r3, r4, r5, pc}
_021EF9A0:
	ldr r0, _021EF9B8 @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F1C4C
	pop {r3, r4, r5, pc}
_021EF9B0:
	movs r0, #0x88
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EF9B4: .4byte 0x000005DC
_021EF9B8: .4byte 0x000005EA
	thumb_func_end ov14_021EF93C

	thumb_func_start ov14_021EF9BC
ov14_021EF9BC: @ 0x021EF9BC
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x88
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EF9BC

	thumb_func_start ov14_021EF9CC
ov14_021EF9CC: @ 0x021EF9CC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r1, _021EFB48 @ =0x0000044C
	movs r2, #0
	ldrb r1, [r0, r1]
	bl ov14_021F34C8
	ldr r0, [r4, #0x34]
	ldr r2, _021EFB48 @ =0x0000044C
	ldr r3, _021EFB4C @ =0x000088CA
	ldrb r1, [r0, r2]
	ldrh r5, [r0, r3]
	cmp r1, r5
	bne _021EFA12
	movs r5, #0
	subs r1, r3, #2
	strh r5, [r0, r1]
	ldr r1, [r4, #0x34]
	adds r0, r4, #0
	ldrb r1, [r1, r2]
	bl ov14_021E7588
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
	ldr r1, _021EFB50 @ =ov14_021E9970
	adds r0, r4, #0
	movs r2, #0x82
	bl ov14_021F0234
	pop {r4, r5, r6, pc}
_021EFA12:
	adds r0, r4, #0
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r3, [r4, #0x34]
	ldr r1, _021EFB48 @ =0x0000044C
	ldr r6, _021EFB54 @ =0x000088C8
	ldrb r1, [r3, r1]
	adds r0, r4, #0
	movs r2, #6
	adds r3, r3, r6
	bl ov14_021E6094
	ldr r3, [r4, #0x34]
	ldr r2, _021EFB48 @ =0x0000044C
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r3, r2]
	adds r0, r4, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EFA5C
	ldr r3, [r4, #0x34]
	ldr r0, _021EFB48 @ =0x0000044C
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r3, r0]
	adds r0, r4, #0
	adds r6, r3, r2
	ldr r3, _021EFB58 @ =0x00004094
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EFA5C:
	ldr r2, [r4, #0x34]
	ldr r1, _021EFB48 @ =0x0000044C
	adds r0, r4, #0
	ldrb r1, [r2, r1]
	bl ov14_021E7588
	ldr r3, _021EFB54 @ =0x000088C8
	ldr r0, [r4, #0x34]
	adds r1, r3, #2
	strh r5, [r0, r3]
	ldr r5, [r4, #0x34]
	adds r0, r4, #0
	ldrh r1, [r5, r1]
	movs r2, #6
	adds r3, r5, r3
	bl ov14_021E6094
	ldr r3, [r4, #0x34]
	ldr r2, _021EFB4C @ =0x000088CA
	ldrb r1, [r4, #0x1f]
	ldrh r2, [r3, r2]
	adds r0, r4, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EFAA8
	ldr r3, [r4, #0x34]
	ldr r0, _021EFB4C @ =0x000088CA
	ldrb r1, [r4, #0x1f]
	ldrh r2, [r3, r0]
	adds r0, r4, #0
	adds r5, r3, r2
	ldr r3, _021EFB58 @ =0x00004094
	ldrb r3, [r5, r3]
	bl ov14_021F2ED0
_021EFAA8:
	ldr r2, [r4, #0x34]
	ldr r0, _021EFB54 @ =0x000088C8
	ldrh r0, [r2, r0]
	cmp r0, #0
	bne _021EFAC8
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	bl ov14_021E8620
	ldr r1, _021EFB50 @ =ov14_021E9970
	adds r0, r4, #0
	movs r2, #0x82
	bl ov14_021F0234
	pop {r4, r5, r6, pc}
_021EFAC8:
	ldr r0, _021EFB5C @ =0x0000044B
	movs r1, #1
	strb r1, [r2, r0]
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	ldr r1, _021EFB48 @ =0x0000044C
	movs r2, #2
	ldrb r1, [r0, r1]
	bl ov14_021F39A0
	ldr r0, [r4, #0x34]
	ldr r1, _021EFB54 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r2, [r4, #0x34]
	ldr r1, _021EFB54 @ =0x000088C8
	adds r0, r4, #0
	ldrh r1, [r2, r1]
	bl ov14_021F5564
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r3, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r3, r0]
	adds r3, #0x30
	lsls r2, r5, #4
	movs r1, #0x10
	adds r2, r3, r2
	bl FUN_02019A60
	movs r0, #0x2f
	adds r3, r5, #1
	ldr r2, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	adds r2, #0x30
	lsls r3, r3, #4
	movs r1, #0x10
	adds r2, r2, r3
	bl FUN_02019A60
	ldr r0, [r4, #0x34]
	ldr r1, _021EFB54 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F38B0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88BC
	ldr r1, _021EFB60 @ =ov14_021EAA04
	adds r0, r4, #0
	movs r2, #0x88
	bl ov14_021F0234
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EFB48: .4byte 0x0000044C
_021EFB4C: .4byte 0x000088CA
_021EFB50: .4byte ov14_021E9970
_021EFB54: .4byte 0x000088C8
_021EFB58: .4byte 0x00004094
_021EFB5C: .4byte 0x0000044B
_021EFB60: .4byte ov14_021EAA04
	thumb_func_end ov14_021EF9CC

	thumb_func_start ov14_021EFB64
ov14_021EFB64: @ 0x021EFB64
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov14_021F6A24
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	beq _021EFC52
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EFBBC
	ldr r0, _021EFDC8 @ =0x000005EB
	bl FUN_0200604C
	ldr r2, [r4, #0x34]
	ldr r1, _021EFDCC @ =0x000040B8
	adds r0, r2, r1
	adds r1, r1, #4
	adds r1, r2, r1
	bl FUN_02025380
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F1D6C
	pop {r3, r4, r5, pc}
_021EFBBC:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021EFC32
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r0, r4, #0
	bl ov14_021F40DC
	ldr r1, [r4, #0x34]
	ldr r0, _021EFDD0 @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021EFC26
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
_021EFC26:
	ldr r1, _021EFDD4 @ =ov14_021EA674
	adds r0, r4, #0
	movs r2, #0x8c
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021EFC32:
	ldr r0, [r4, #0x34]
	lsls r1, r5, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	adds r0, r4, #0
	bl ov14_021E765C
	movs r0, #0x8b
	pop {r3, r4, r5, pc}
_021EFC52:
	adds r0, r4, #0
	bl ov14_021F75C8
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021EFC92
	bhs _021EFCCA
	cmp r5, #9
	bhi _021EFC88
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EFC74: @ jump table
	.2byte _021EFD7A - _021EFC74 - 2 @ case 0
	.2byte _021EFD7A - _021EFC74 - 2 @ case 1
	.2byte _021EFD7A - _021EFC74 - 2 @ case 2
	.2byte _021EFD7A - _021EFC74 - 2 @ case 3
	.2byte _021EFD7A - _021EFC74 - 2 @ case 4
	.2byte _021EFD7A - _021EFC74 - 2 @ case 5
	.2byte _021EFCA6 - _021EFC74 - 2 @ case 6
	.2byte _021EFD00 - _021EFC74 - 2 @ case 7
	.2byte _021EFCB8 - _021EFC74 - 2 @ case 8
	.2byte _021EFD12 - _021EFC74 - 2 @ case 9
_021EFC88:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	beq _021EFD4C
	b _021EFD7A
_021EFC92:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021EFC9C
	beq _021EFD00
	b _021EFD7A
_021EFC9C:
	adds r0, r1, #2
	cmp r5, r0
	bne _021EFCA4
	b _021EFDC4
_021EFCA4:
	b _021EFD7A
_021EFCA6:
	ldr r0, _021EFDD8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xb0
	bl ov14_021F2490
	pop {r3, r4, r5, pc}
_021EFCB8:
	ldr r0, _021EFDD8 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0xad
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EFCCA:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #5
	bhi _021EFCE2
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	b _021EFCF0
_021EFCE2:
	cmp r1, #8
	beq _021EFCF0
	cmp r1, #9
	beq _021EFCF0
	adds r0, r4, #0
	bl ov14_021E765C
_021EFCF0:
	ldr r0, _021EFDDC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x8c
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021EFD00:
	ldr r0, _021EFDE0 @ =0x00000633
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x9f
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EFD12:
	ldr r0, _021EFDDC @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	subs r0, #0x1e
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	adds r1, r5, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0xb1
	bl ov14_021F2270
	pop {r3, r4, r5, pc}
_021EFD4C:
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #5
	bhi _021EFD64
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	b _021EFD72
_021EFD64:
	cmp r1, #8
	beq _021EFD72
	cmp r1, #9
	beq _021EFD72
	adds r0, r4, #0
	bl ov14_021E765C
_021EFD72:
	ldr r0, _021EFDDC @ =0x000005DC
	bl FUN_0200604C
	b _021EFDC4
_021EFD7A:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021EFDC4
	ldr r0, _021EFDD8 @ =0x000005DD
	bl FUN_0200604C
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x1e
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #8
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r5, #0x1e
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov14_021F1CDC
	pop {r3, r4, r5, pc}
_021EFDC4:
	movs r0, #0x8b
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EFDC8: .4byte 0x000005EB
_021EFDCC: .4byte 0x000040B8
_021EFDD0: .4byte 0x000088C8
_021EFDD4: .4byte ov14_021EA674
_021EFDD8: .4byte 0x000005DD
_021EFDDC: .4byte 0x000005DC
_021EFDE0: .4byte 0x00000633
	thumb_func_end ov14_021EFB64

	thumb_func_start ov14_021EFDE4
ov14_021EFDE4: @ 0x021EFDE4
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x8b
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021EFDE4

	thumb_func_start ov14_021EFDF4
ov14_021EFDF4: @ 0x021EFDF4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	adds r1, r4, #0
	ldr r5, [r0, #0xc]
	adds r1, #0x21
	ldrh r2, [r5]
	ldrb r1, [r1]
	cmp r2, r1
	beq _021EFE10
	ldr r1, _021EFEF0 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _021EFEB0
_021EFE10:
	adds r0, r4, #0
	ldrh r5, [r5, #2]
	bl ov14_021F1F38
	ldr r0, [r4, #0x34]
	ldr r1, _021EFEF4 @ =0x0000044A
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021EFE6C
	ldr r1, _021EFEF0 @ =0x000088C8
	ldrh r0, [r0, r1]
	bl FUN_02078068
	cmp r0, #1
	bne _021EFE7A
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r5, r0
	beq _021EFE7A
	ldr r0, _021EFEF8 @ =0x000005F3
	bl FUN_0200604C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #7
	bl FUN_0201980C
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0x28
	bl ov14_021F68C0
	movs r0, #0x92
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021EFE6C:
	movs r1, #0x28
	bl ov14_021F6654
	ldr r1, [r4, #0x34]
	ldr r0, _021EFEF4 @ =0x0000044A
	movs r2, #0
	strb r2, [r1, r0]
_021EFE7A:
	ldr r1, [r4, #0x34]
	ldr r0, _021EFEF0 @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021EFE98
	ldr r0, _021EFEFC @ =0x000005EA
	bl FUN_0200604C
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F34C8
_021EFE98:
	ldr r0, [r4, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x8b
	pop {r3, r4, r5, pc}
_021EFEB0:
	movs r1, #0x28
	bl ov14_021F6654
	ldr r0, _021EFEFC @ =0x000005EA
	bl FUN_0200604C
	ldrh r1, [r5]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F34C8
	adds r0, r4, #0
	bl ov14_021F40DC
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #0x8e
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EFEF0: .4byte 0x000088C8
_021EFEF4: .4byte 0x0000044A
_021EFEF8: .4byte 0x000005F3
_021EFEFC: .4byte 0x000005EA
	thumb_func_end ov14_021EFDF4

	thumb_func_start ov14_021EFF00
ov14_021EFF00: @ 0x021EFF00
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	bne _021EFF14
	movs r0, #0x8e
	pop {r3, r4, r5, r6, r7, pc}
_021EFF14:
	ldr r0, [r5, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	movs r2, #6
	ldr r4, [r0, #0xc]
	adds r0, r5, #0
	ldrh r1, [r4]
	movs r3, #0
	bl ov14_021E6070
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r1, [r4]
	ldr r6, [r5, #0x34]
	ldr r3, _021F0084 @ =0x000088C8
	adds r0, r5, #0
	movs r2, #6
	adds r3, r6, r3
	bl ov14_021E6094
	ldrb r1, [r5, #0x1f]
	ldrh r2, [r4]
	adds r0, r5, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EFF6E
	ldrh r2, [r4]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r2
	ldr r3, _021F0088 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EFF6E:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl ov14_021E7588
	adds r1, r5, #0
	ldr r0, [r5, #0x34]
	ldr r3, _021F0084 @ =0x000088C8
	adds r1, #0x21
	strh r7, [r0, r3]
	ldr r6, [r5, #0x34]
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #6
	adds r3, r6, r3
	bl ov14_021E6094
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021EFFBA
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r2, [r0]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r6, r3, r2
	ldr r3, _021F0088 @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r6, r3]
	bl ov14_021F2ED0
_021EFFBA:
	ldr r0, [r5, #0x34]
	ldr r1, _021F0084 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _021F0046
	ldr r1, _021F008C @ =0x0000044A
	ldrb r2, [r0, r1]
	cmp r2, #0
	bne _021F0006
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F1F38
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	subs r1, #0x1e
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r1, _021F0090 @ =ov14_021E94BC
	adds r0, r5, #0
	movs r2, #0x8f
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
_021F0006:
	movs r2, #0
	strb r2, [r0, r1]
	adds r0, r5, #0
	bl ov14_021F1F38
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	subs r1, #0x1e
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7EE0
	movs r1, #1
	adds r0, r5, #0
	adds r2, r1, #0
	bl ov14_021F3488
	ldr r1, _021F0094 @ =ov14_021E9518
	adds r0, r5, #0
	movs r2, #0x8f
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
_021F0046:
	ldr r0, _021F0098 @ =0x000005EB
	bl FUN_0200604C
	ldr r0, [r5, #0x34]
	ldr r1, _021F0084 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #1
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	bl ov14_021F39D0
	ldr r1, _021F009C @ =ov14_021EAF08
	adds r0, r5, #0
	movs r2, #0x90
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F0084: .4byte 0x000088C8
_021F0088: .4byte 0x00004094
_021F008C: .4byte 0x0000044A
_021F0090: .4byte ov14_021E94BC
_021F0094: .4byte ov14_021E9518
_021F0098: .4byte 0x000005EB
_021F009C: .4byte ov14_021EAF08
	thumb_func_end ov14_021EFF00

	thumb_func_start ov14_021F00A0
ov14_021F00A0: @ 0x021F00A0
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	bl ov14_021E7588
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x8b
	pop {r4, pc}
	thumb_func_end ov14_021F00A0

	thumb_func_start ov14_021F00BC
ov14_021F00BC: @ 0x021F00BC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r2, #0
	ldr r4, [r0, #0xc]
	ldrh r1, [r4]
	bl ov14_021F34C8
	ldr r0, _021F011C @ =0x000005EA
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021F40DC
	ldr r0, [r5, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021F00FC
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x21
	strb r1, [r0]
_021F00FC:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	subs r1, #0x1e
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	bl ov14_021F1F38
	movs r0, #0x91
	pop {r3, r4, r5, pc}
	nop
_021F011C: .4byte 0x000005EA
	thumb_func_end ov14_021F00BC

	thumb_func_start ov14_021F0120
ov14_021F0120: @ 0x021F0120
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	bl ov14_021F2A04
	cmp r0, #1
	bne _021F0134
	movs r0, #0x91
	pop {r4, pc}
_021F0134:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r1, _021F0160 @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0x8f
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0160: .4byte ov14_021E94BC
	thumb_func_end ov14_021F0120

	thumb_func_start ov14_021F0164
ov14_021F0164: @ 0x021F0164
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x28
	bl ov14_021F6654
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #7
	bl FUN_020197F4
	ldr r0, [r4, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x8b
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F0164

	thumb_func_start ov14_021F0198
ov14_021F0198: @ 0x021F0198
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F01B4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0x25
	bl ov14_021F68C0
	movs r0, #0xe
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
	.align 2, 0
_021F01B4: .4byte 0x000005F3
	thumb_func_end ov14_021F0198

	thumb_func_start ov14_021F01B8
ov14_021F01B8: @ 0x021F01B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F01D4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x25
	bl ov14_021F6724
	movs r0, #0xe
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
	nop
_021F01D4: .4byte 0x000005F3
	thumb_func_end ov14_021F01B8

	thumb_func_start ov14_021F01D8
ov14_021F01D8: @ 0x021F01D8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	adds r4, r1, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x11
	ldr r1, [r5, #0x34]
	lsls r0, r0, #6
	str r4, [r1, r0]
	movs r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov14_021F01D8

	thumb_func_start ov14_021F0204
ov14_021F0204: @ 0x021F0204
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	movs r0, #0
	adds r4, r1, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0x11
	ldr r1, [r5, #0x34]
	lsls r0, r0, #6
	str r4, [r1, r0]
	movs r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F0204

	thumb_func_start ov14_021F0234
ov14_021F0234: @ 0x021F0234
	push {r3, lr}
	str r2, [r0, #0x30]
	ldr r0, [r0, #0x34]
	bl ov14_021E5A44
	movs r0, #5
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F0234

	thumb_func_start ov14_021F0244
ov14_021F0244: @ 0x021F0244
	push {r3, lr}
	str r1, [r0, #0x30]
	ldr r0, [r0, #0x34]
	bl ov14_021E5A54
	movs r0, #5
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F0244

	thumb_func_start ov14_021F0254
ov14_021F0254: @ 0x021F0254
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #1
	bne _021F0266
	movs r1, #1
	bl ov14_021E5EFC
	b _021F026C
_021F0266:
	movs r1, #0
	bl ov14_021E5EFC
_021F026C:
	ldr r1, [r5, #0x34]
	ldr r0, _021F0278 @ =0x00000438
	strh r4, [r1, r0]
	movs r0, #7
	pop {r3, r4, r5, pc}
	nop
_021F0278: .4byte 0x00000438
	thumb_func_end ov14_021F0254

	thumb_func_start ov14_021F027C
ov14_021F027C: @ 0x021F027C
	ldr r3, _021F0288 @ =ov14_021F0204
	strb r1, [r0, #0x1e]
	movs r1, #9
	str r1, [r0, #0x30]
	movs r1, #1
	bx r3
	.align 2, 0
_021F0288: .4byte ov14_021F0204
	thumb_func_end ov14_021F027C

	thumb_func_start ov14_021F028C
ov14_021F028C: @ 0x021F028C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x1f]
	adds r4, r1, #0
	cmp r0, #0
	bne _021F029C
	movs r0, #0x11
	b _021F029E
_021F029C:
	subs r0, r0, #1
_021F029E:
	strb r0, [r5, #0x1f]
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F2DE8
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021E7930
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0
	bl ov14_021E783C
	ldr r0, [r5, #0x34]
	movs r1, #0
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021F0302
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r0, [r5]
	ldr r0, [r0, #8]
	subs r0, r0, #2
	cmp r0, #1
	bhi _021F0302
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
_021F0302:
	ldr r1, _021F0310 @ =ov14_021E92AC
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F0310: .4byte ov14_021E92AC
	thumb_func_end ov14_021F028C

	thumb_func_start ov14_021F0314
ov14_021F0314: @ 0x021F0314
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldrb r0, [r5, #0x1f]
	adds r4, r1, #0
	cmp r0, #0x11
	bne _021F0324
	movs r0, #0
	b _021F0326
_021F0324:
	adds r0, r0, #1
_021F0326:
	strb r0, [r5, #0x1f]
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021F2DE8
	ldrb r1, [r5, #0x1f]
	adds r0, r5, #0
	bl ov14_021E7930
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #1
	bl ov14_021E783C
	ldr r0, [r5, #0x34]
	movs r1, #1
	movs r2, #4
	bl ov14_021F29E4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021F038A
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r0, [r5]
	ldr r0, [r0, #8]
	subs r0, r0, #2
	cmp r0, #1
	bhi _021F038A
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
_021F038A:
	ldr r1, _021F0398 @ =ov14_021E9370
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F0398: .4byte ov14_021E9370
	thumb_func_end ov14_021F0314

	thumb_func_start ov14_021F039C
ov14_021F039C: @ 0x021F039C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F3F6C
	adds r0, r4, #0
	bl ov14_021F08BC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F03F2
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8234
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8294
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
_021F03F2:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x22
	strb r1, [r0]
	ldr r1, _021F0414 @ =ov14_021E8BA4
	adds r0, r4, #0
	movs r2, #0xd
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0414: .4byte ov14_021E8BA4
	thumb_func_end ov14_021F039C

	thumb_func_start ov14_021F0418
ov14_021F0418: @ 0x021F0418
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F3F6C
	adds r0, r4, #0
	bl ov14_021F3044
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #2
	movs r2, #1
	bl ov14_021F3488
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	ldr r0, [r4, #8]
	bl FUN_02074640
	cmp r0, #6
	beq _021F0482
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #1
	bl ov14_021F6928
	b _021F048C
_021F0482:
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl ov14_021F6928
_021F048C:
	adds r0, r4, #0
	bl ov14_021F08BC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F04BA
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
_021F04BA:
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x22
	strb r1, [r0]
	ldr r1, _021F04D0 @ =ov14_021E9C88
	adds r0, r4, #0
	movs r2, #0x57
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F04D0: .4byte ov14_021E9C88
	thumb_func_end ov14_021F0418

	thumb_func_start ov14_021F04D4
ov14_021F04D4: @ 0x021F04D4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F3F6C
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	ldr r1, _021F052C @ =ov14_021EA068
	adds r0, r4, #0
	movs r2, #0x58
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F052C: .4byte ov14_021EA068
	thumb_func_end ov14_021F04D4

	thumb_func_start ov14_021F0530
ov14_021F0530: @ 0x021F0530
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F3F6C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8234
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8294
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	ldr r1, _021F0590 @ =ov14_021EA0B8
	adds r0, r4, #0
	movs r2, #0x4a
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0590: .4byte ov14_021EA0B8
	thumb_func_end ov14_021F0530

	thumb_func_start ov14_021F0594
ov14_021F0594: @ 0x021F0594
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x21
	adds r1, r5, #0
	strb r4, [r0]
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F3190
	adds r0, r5, #0
	bl ov14_021F3F6C
	adds r1, r4, #0
	ldr r0, [r5, #8]
	subs r1, #0x1e
	bl FUN_02074644
	subs r4, #0x1e
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021E6480
	cmp r0, #0
	bne _021F05E4
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	bl FUN_02073FA8
	cmp r0, #0
	bne _021F05E4
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #8
	bl ov14_021F6928
	b _021F062A
_021F05E4:
	adds r0, r6, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021F0606
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #6
	bl ov14_021F6928
	b _021F062A
_021F0606:
	adds r0, r6, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021F0620
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #7
	bl ov14_021F6928
	b _021F062A
_021F0620:
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0
	bl ov14_021F6928
_021F062A:
	adds r0, r5, #0
	bl ov14_021F08BC
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x22
	strb r1, [r0]
	ldr r1, _021F065C @ =ov14_021E8D20
	adds r0, r5, #0
	movs r2, #0x27
	bl ov14_021F0234
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F065C: .4byte ov14_021E8D20
	thumb_func_end ov14_021F0594

	thumb_func_start ov14_021F0660
ov14_021F0660: @ 0x021F0660
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	str r1, [sp]
	adds r1, r5, #0
	ldr r0, [sp]
	adds r1, #0x21
	strb r0, [r1]
	movs r4, #0x1e
	movs r7, #1
	movs r6, #0
_021F0674:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bne _021F068A
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F3190
	b _021F0692
_021F068A:
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov14_021F3190
_021F0692:
	adds r4, r4, #1
	cmp r4, #0x24
	blo _021F0674
	adds r0, r5, #0
	bl ov14_021F3F6C
	adds r0, r5, #0
	movs r1, #2
	movs r2, #1
	bl ov14_021F3488
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F34C8
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	ldr r1, [sp]
	ldr r0, [r5, #8]
	subs r1, #0x1e
	bl FUN_02074644
	ldr r1, [sp]
	adds r4, r0, #0
	subs r1, #0x1e
	adds r0, r5, #0
	str r1, [sp]
	bl ov14_021E6480
	cmp r0, #0
	bne _021F06EE
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #8
	bl ov14_021F6928
	b _021F074C
_021F06EE:
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021F0710
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #6
	bl ov14_021F6928
	b _021F074C
_021F0710:
	adds r0, r4, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021F072A
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #7
	bl ov14_021F6928
	b _021F074C
_021F072A:
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	bl FUN_02073E40
	cmp r0, #0
	bne _021F0742
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #2
	bl ov14_021F6928
	b _021F074C
_021F0742:
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0
	bl ov14_021F6928
_021F074C:
	adds r0, r5, #0
	bl ov14_021F08BC
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F077A
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
_021F077A:
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x22
	strb r1, [r0]
	ldr r1, _021F0790 @ =ov14_021E9A24
	adds r0, r5, #0
	movs r2, #0x6e
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F0790: .4byte ov14_021E9A24
	thumb_func_end ov14_021F0660

	thumb_func_start ov14_021F0794
ov14_021F0794: @ 0x021F0794
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F3F6C
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0x27
	bl ov14_021F685C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	ldr r1, _021F07EC @ =ov14_021EA068
	adds r0, r4, #0
	movs r2, #0x6f
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F07EC: .4byte ov14_021EA068
	thumb_func_end ov14_021F0794

	thumb_func_start ov14_021F07F0
ov14_021F07F0: @ 0x021F07F0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F3F6C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	ldr r1, _021F0838 @ =ov14_021EA0B8
	adds r0, r4, #0
	movs r2, #0x4c
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0838: .4byte ov14_021EA0B8
	thumb_func_end ov14_021F07F0

	thumb_func_start ov14_021F083C
ov14_021F083C: @ 0x021F083C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F3F6C
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	ldr r1, [r4, #0x34]
	bne _021F0876
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85D0
	b _021F0890
_021F0876:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021F0890
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
_021F0890:
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F6408
	adds r0, r4, #0
	bl ov14_021F08BC
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x22
	strb r1, [r0]
	ldr r1, _021F08B8 @ =ov14_021E8FD4
	adds r0, r4, #0
	movs r2, #0x2a
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021F08B8: .4byte ov14_021E8FD4
	thumb_func_end ov14_021F083C

	thumb_func_start ov14_021F08BC
ov14_021F08BC: @ 0x021F08BC
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #0xa
	movs r1, #0xf0
	bl FUN_0201AA8C
	str r0, [sp]
	movs r4, #0
	adds r5, r0, #0
	movs r6, #0xa
_021F08D0:
	adds r0, r6, #0
	bl FUN_0206DD2C
	str r0, [r5]
	adds r4, r4, #1
	adds r5, #0x20
	cmp r4, #7
	blo _021F08D0
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0xe0
	str r1, [r0]
	ldr r1, [r7, #0x34]
	ldr r0, [sp]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021F08BC

	thumb_func_start ov14_021F08F0
ov14_021F08F0: @ 0x021F08F0
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x34]
	movs r4, #0
	ldr r6, [r0, #0xc]
	adds r5, r6, #0
_021F08FA:
	ldr r0, [r5]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, #0x20
	cmp r4, #7
	blo _021F08FA
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021F08F0

	thumb_func_start ov14_021F0910
ov14_021F0910: @ 0x021F0910
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #0x4c
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021F0948
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r1, _021F09B8 @ =ov14_021E9450
	adds r0, r5, #0
	movs r2, #0x4f
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021F0948:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	adds r4, r0, #0
	bne _021F096A
	movs r0, #0x26
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #1
	bl ov14_021F027C
	pop {r3, r4, r5, pc}
_021F096A:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	ldr r1, [r5, #0x34]
	bne _021F0998
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r1, _021F09B8 @ =ov14_021E9450
	adds r0, r5, #0
	movs r2, #0x50
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
_021F0998:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E83F4
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x25
	bl ov14_021F6704
	adds r0, r5, #0
	movs r1, #0
	bl ov14_021F0254
	pop {r3, r4, r5, pc}
	nop
_021F09B8: .4byte ov14_021E9450
	thumb_func_end ov14_021F0910

	thumb_func_start ov14_021F09BC
ov14_021F09BC: @ 0x021F09BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _021F09D0
	cmp r1, #1
	beq _021F09DA
	cmp r1, #2
	b _021F09E4
_021F09D0:
	movs r1, #0
	movs r2, #9
	bl ov14_021F6AC0
	b _021F0A04
_021F09DA:
	movs r1, #2
	movs r2, #0x24
	bl ov14_021F6AC0
	b _021F0A04
_021F09E4:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021F09FA
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x27
	bl ov14_021F6AC0
	b _021F0A04
_021F09FA:
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0xb
	bl ov14_021F6AC0
_021F0A04:
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #0x34]
	movs r1, #0x26
	bl ov14_021F6654
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F0A26
	adds r0, r4, #0
	bl ov14_021F57B8
_021F0A26:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021F0A3A
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
_021F0A3A:
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7E64
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #2
	bne _021F0A6E
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _021F0A6E
	ldr r1, _021F0A7C @ =ov14_021E94A8
	adds r0, r4, #0
	movs r2, #0x17
	bl ov14_021F0234
	pop {r4, pc}
_021F0A6E:
	ldr r1, _021F0A7C @ =ov14_021E94A8
	adds r0, r4, #0
	movs r2, #0xe
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0A7C: .4byte ov14_021E94A8
	thumb_func_end ov14_021F09BC

	thumb_func_start ov14_021F0A80
ov14_021F0A80: @ 0x021F0A80
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r1, _021F0AA8 @ =ov14_021E9434
	adds r0, r4, #0
	movs r2, #0x13
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0AA8: .4byte ov14_021E9434
	thumb_func_end ov14_021F0A80

	thumb_func_start ov14_021F0AAC
ov14_021F0AAC: @ 0x021F0AAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r1, _021F0AD4 @ =ov14_021E9450
	adds r0, r4, #0
	movs r2, #0x19
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0AD4: .4byte ov14_021E9450
	thumb_func_end ov14_021F0AAC

	thumb_func_start ov14_021F0AD8
ov14_021F0AD8: @ 0x021F0AD8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	adds r0, #0x23
	strb r1, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F43F4
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8234
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8294
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r1, _021F0B30 @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0x22
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0B30: .4byte ov14_021E94BC
	thumb_func_end ov14_021F0AD8

	thumb_func_start ov14_021F0B34
ov14_021F0B34: @ 0x021F0B34
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	adds r0, #0x23
	strb r2, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #9
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F0B5E
	adds r0, r4, #0
	bl ov14_021EC710
	pop {r4, pc}
_021F0B5E:
	adds r0, r4, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0x25
	bl ov14_021F1100
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F0B34

	thumb_func_start ov14_021F0B70
ov14_021F0B70: @ 0x021F0B70
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov14_021E81A8
	ldr r0, [r4, #0x34]
	bl ov14_021F63F0
	ldr r0, [r4, #0x34]
	bl ov14_021F63A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8368
	adds r0, r4, #0
	bl ov14_021E82DC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7E78
	adds r0, r4, #0
	bl ov14_021F30B0
	pop {r4, pc}
	thumb_func_end ov14_021F0B70

	thumb_func_start ov14_021F0BB4
ov14_021F0BB4: @ 0x021F0BB4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov14_021E81A8
	ldr r0, [r4, #0x34]
	bl ov14_021F63F0
	ldr r0, [r4, #0x34]
	bl ov14_021F63B8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8368
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7E88
	adds r0, r4, #0
	bl ov14_021F311C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F0BB4

	thumb_func_start ov14_021F0BF4
ov14_021F0BF4: @ 0x021F0BF4
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F30B0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E7E78
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F0BF4

	thumb_func_start ov14_021F0C0C
ov14_021F0C0C: @ 0x021F0C0C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8020
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021F0C48
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
_021F0C48:
	ldr r1, _021F0C54 @ =ov14_021E952C
	adds r0, r4, #0
	movs r2, #0x2d
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021F0C54: .4byte ov14_021E952C
	thumb_func_end ov14_021F0C0C

	thumb_func_start ov14_021F0C58
ov14_021F0C58: @ 0x021F0C58
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	movs r2, #0xff
	adds r1, #0x21
	strb r2, [r1]
	movs r1, #1
	adds r2, r1, #0
	bl ov14_021F3488
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E805C
	ldr r1, _021F0C84 @ =ov14_021E954C
	adds r0, r4, #0
	movs r2, #0x2e
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021F0C84: .4byte ov14_021E954C
	thumb_func_end ov14_021F0C58

	thumb_func_start ov14_021F0C88
ov14_021F0C88: @ 0x021F0C88
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x29
	strb r2, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #9
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8234
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8294
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r1, _021F0CD4 @ =ov14_021E94BC
	adds r0, r4, #0
	movs r2, #0x2f
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F0CD4: .4byte ov14_021E94BC
	thumb_func_end ov14_021F0C88

	thumb_func_start ov14_021F0CD8
ov14_021F0CD8: @ 0x021F0CD8
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021F0D10
	adds r0, r4, #0
	movs r1, #0x31
	bl ov14_021F0EE8
	pop {r4, pc}
_021F0D10:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021F0D2A
	adds r0, r4, #0
	movs r1, #0x31
	bl ov14_021F0D34
	pop {r4, pc}
_021F0D2A:
	adds r0, r4, #0
	movs r1, #0x32
	bl ov14_021F1090
	pop {r4, pc}
	thumb_func_end ov14_021F0CD8

	thumb_func_start ov14_021F0D34
ov14_021F0D34: @ 0x021F0D34
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	ldr r1, _021F0D54 @ =ov14_021E9970
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F0D54: .4byte ov14_021E9970
	thumb_func_end ov14_021F0D34

	thumb_func_start ov14_021F0D58
ov14_021F0D58: @ 0x021F0D58
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021F0D6A
	movs r4, #0x82
	b _021F0D6C
_021F0D6A:
	movs r4, #0x29
_021F0D6C:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r7, [r0]
	movs r1, #6
	adds r0, r7, #0
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	adds r1, r6, r1
	cmp r1, r7
	beq _021F0D96
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
_021F0D96:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r1, [r0]
	ldrb r0, [r5, #0x1f]
	cmp r1, r0
	bne _021F0E4E
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021F0DEA
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r5, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F0EE8
	pop {r3, r4, r5, r6, r7, pc}
_021F0DEA:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021F0E40
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r5, #0x34]
	adds r1, #0x25
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	ldr r1, _021F0EE0 @ =ov14_021E9970
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
_021F0E40:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F0E4E:
	ldr r0, [r5, #0x34]
	movs r1, #0x2d
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F90
	cmp r0, #1
	bne _021F0E9E
	ldr r0, [r5, #0x34]
	movs r1, #0x2d
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
_021F0E9E:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021F0EB2
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F0EB2:
	adds r0, r5, #0
	bl ov14_021F604C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021F0ED4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
_021F0ED4:
	ldr r1, _021F0EE4 @ =ov14_021E9920
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F0EE0: .4byte ov14_021E9970
_021F0EE4: .4byte ov14_021E9920
	thumb_func_end ov14_021F0D58

	thumb_func_start ov14_021F0EE8
ov14_021F0EE8: @ 0x021F0EE8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85D0
	ldr r1, _021F0F08 @ =ov14_021E9970
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F0F08: .4byte ov14_021E9970
	thumb_func_end ov14_021F0EE8

	thumb_func_start ov14_021F0F0C
ov14_021F0F0C: @ 0x021F0F0C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x25
	adds r5, r1, #0
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r2]
	strb r2, [r4, #0x1f]
	adds r2, r4, #0
	adds r2, #0x25
	ldrb r2, [r2]
	cmp r1, r2
	ldrb r1, [r4, #0x1f]
	bls _021F0F42
	bl ov14_021F2DE8
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021E7930
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl ov14_021E783C
	ldr r6, _021F0FFC @ =ov14_021E92AC
	b _021F0F5A
_021F0F42:
	bl ov14_021F2DE8
	ldrb r1, [r4, #0x1f]
	adds r0, r4, #0
	bl ov14_021E7930
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	bl ov14_021E783C
	ldr r6, _021F1000 @ =ov14_021E9370
_021F0F5A:
	cmp r5, #4
	bhi _021F0FF0
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F0F6A: @ jump table
	.2byte _021F0F74 - _021F0F6A - 2 @ case 0
	.2byte _021F0F90 - _021F0F6A - 2 @ case 1
	.2byte _021F0F9C - _021F0F6A - 2 @ case 2
	.2byte _021F0FA2 - _021F0F6A - 2 @ case 3
	.2byte _021F0FCA - _021F0F6A - 2 @ case 4
_021F0F74:
	adds r0, r4, #0
	bl ov14_021F4848
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F0F8A
	movs r0, #0xc
	str r0, [r4, #0x30]
	b _021F0FF0
_021F0F8A:
	movs r0, #0x24
	str r0, [r4, #0x30]
	b _021F0FF0
_021F0F90:
	adds r0, r4, #0
	bl ov14_021F4848
	movs r0, #0x3d
	str r0, [r4, #0x30]
	b _021F0FF0
_021F0F9C:
	movs r0, #0x47
	str r0, [r4, #0x30]
	b _021F0FF0
_021F0FA2:
	adds r0, r4, #0
	bl ov14_021F4848
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021F0FC4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85D0
_021F0FC4:
	movs r0, #0x29
	str r0, [r4, #0x30]
	b _021F0FF0
_021F0FCA:
	adds r0, r4, #0
	bl ov14_021F4848
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021F0FEC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85D0
_021F0FEC:
	movs r0, #0x82
	str r0, [r4, #0x30]
_021F0FF0:
	ldr r2, [r4, #0x30]
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov14_021F0234
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F0FFC: .4byte ov14_021E92AC
_021F1000: .4byte ov14_021E9370
	thumb_func_end ov14_021F0F0C

	thumb_func_start ov14_021F1004
ov14_021F1004: @ 0x021F1004
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x25
	adds r4, r1, #0
	ldrb r1, [r0]
	movs r0, #6
	muls r0, r4, r0
	adds r1, r1, r0
	bpl _021F101A
	adds r1, #0x12
	b _021F1020
_021F101A:
	cmp r1, #0x12
	blt _021F1020
	subs r1, #0x12
_021F1020:
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F49E0
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F57B8
	cmp r4, #0
	ldr r0, [r5, #0x34]
	ble _021F104E
	movs r1, #5
	movs r2, #4
	bl ov14_021F29E4
	pop {r3, r4, r5, pc}
_021F104E:
	movs r1, #4
	movs r2, #2
	bl ov14_021F29E4
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F1004

	thumb_func_start ov14_021F1058
ov14_021F1058: @ 0x021F1058
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov14_021F4720
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E86E0
	ldr r1, _021F108C @ =ov14_021E9554
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F108C: .4byte ov14_021E9554
	thumb_func_end ov14_021F1058

	thumb_func_start ov14_021F1090
ov14_021F1090: @ 0x021F1090
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8704
	ldr r1, _021F10B0 @ =ov14_021E9590
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F10B0: .4byte ov14_021E9590
	thumb_func_end ov14_021F1090

	thumb_func_start ov14_021F10B4
ov14_021F10B4: @ 0x021F10B4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	bl ov14_021F5EC4
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r1, _021F10D8 @ =ov14_021E95B4
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F10D8: .4byte ov14_021E95B4
	thumb_func_end ov14_021F10B4

	thumb_func_start ov14_021F10DC
ov14_021F10DC: @ 0x021F10DC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r1, _021F10FC @ =ov14_021E95B4
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F10FC: .4byte ov14_021E95B4
	thumb_func_end ov14_021F10DC

	thumb_func_start ov14_021F1100
ov14_021F1100: @ 0x021F1100
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0xff
	adds r0, #0x21
	strb r1, [r0]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r1, _021F1124 @ =ov14_021E9434
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F1124: .4byte ov14_021E9434
	thumb_func_end ov14_021F1100

	thumb_func_start ov14_021F1128
ov14_021F1128: @ 0x021F1128
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldrb r0, [r4, #0x1f]
	movs r1, #6
	blx FUN_020F2998
	ldr r2, [r4, #0x34]
	ldr r0, _021F116C @ =0x0000043C
	str r1, [r2, r0]
	ldr r1, [r4, #0x34]
	ldr r0, [r1, r0]
	str r0, [r4, #0x2c]
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F1162
	adds r0, r4, #0
	bl ov14_021ED5B0
	pop {r4, pc}
_021F1162:
	adds r0, r4, #0
	movs r1, #0x35
	bl ov14_021F1100
	pop {r4, pc}
	.align 2, 0
_021F116C: .4byte 0x0000043C
	thumb_func_end ov14_021F1128

	thumb_func_start ov14_021F1170
ov14_021F1170: @ 0x021F1170
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r4, r1, #0
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	adds r0, r5, #0
	adds r1, r4, r1
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r1, [r5, #0x34]
	ldr r0, _021F11F4 @ =0x0000043C
	adds r3, r2, #0
	str r2, [r1, r0]
	ldr r0, [r5, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_02019F88
	ldr r0, [r5, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #0x3d
	pop {r3, r4, r5, pc}
	nop
_021F11F4: .4byte 0x0000043C
	thumb_func_end ov14_021F1170

	thumb_func_start ov14_021F11F8
ov14_021F11F8: @ 0x021F11F8
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F1004
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x3d
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F11F8

	thumb_func_start ov14_021F1228
ov14_021F1228: @ 0x021F1228
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r2, _021F1298 @ =0x0000044D
	ldrb r3, [r0, r2]
	lsls r2, r1, #2
	adds r3, r3, r2
	bpl _021F123C
	adds r3, #0x18
	b _021F1242
_021F123C:
	cmp r3, #0x18
	blt _021F1242
	subs r3, #0x18
_021F1242:
	ldr r2, _021F1298 @ =0x0000044D
	cmp r1, #0
	strb r3, [r0, r2]
	ldr r0, [r4, #0x34]
	ble _021F1256
	movs r1, #5
	movs r2, #4
	bl ov14_021F29E4
	b _021F125E
_021F1256:
	movs r1, #4
	movs r2, #2
	bl ov14_021F29E4
_021F125E:
	adds r0, r4, #0
	bl ov14_021F462C
	adds r0, r4, #0
	bl ov14_021F4530
	adds r0, r4, #0
	bl ov14_021F58B8
	ldr r2, [r4, #0x34]
	ldr r1, _021F1298 @ =0x0000044D
	ldr r0, [r2, #0x2c]
	ldrb r1, [r2, r1]
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1e
	subs r2, r2, r3
	movs r1, #0x1e
	rors r2, r1
	adds r1, r3, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	pop {r4, pc}
	.align 2, 0
_021F1298: .4byte 0x0000044D
	thumb_func_end ov14_021F1228

	thumb_func_start ov14_021F129C
ov14_021F129C: @ 0x021F129C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x34]
	ldr r3, _021F1314 @ =0x0000044D
	ldrb r5, [r2, r3]
	lsrs r5, r5, #2
	lsls r5, r5, #2
	adds r1, r1, r5
	strb r1, [r2, r3]
	bl ov14_021F459C
	adds r0, r4, #0
	bl ov14_021F58B8
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	ldr r2, [r4, #0x34]
	ldr r1, _021F1318 @ =0x0000043C
	str r0, [r2, r1]
	ldr r0, [r4, #0x34]
	ldr r2, [r0, r1]
	ldr r0, [r0, #0x2c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r1, #6
	adds r3, r2, #0
	bl FUN_02019F88
	ldr r0, [r4, #0x34]
	movs r1, #6
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F1314: .4byte 0x0000044D
_021F1318: .4byte 0x0000043C
	thumb_func_end ov14_021F129C

	thumb_func_start ov14_021F131C
ov14_021F131C: @ 0x021F131C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x34]
	ldr r0, _021F13A0 @ =0x0000044D
	ldrb r1, [r1, r0]
	cmp r1, #0x10
	blo _021F1348
	ldr r0, [r4, #4]
	subs r1, #0x10
	bl FUN_020740B4
	cmp r0, #0
	bne _021F1348
	ldr r0, _021F13A4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x42
	bl ov14_021F2270
	pop {r4, pc}
_021F1348:
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E7930
	ldr r2, [r4, #0x34]
	ldr r1, _021F13A0 @ =0x0000044D
	ldrb r1, [r2, r1]
	cmp r1, r0
	bne _021F1370
	ldr r0, _021F13A4 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x42
	bl ov14_021F2270
	pop {r4, pc}
_021F1370:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r1, [r0]
	ldrb r0, [r4, #0x1f]
	cmp r1, r0
	beq _021F138E
	ldr r0, _021F13A8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0xa5
	bl ov14_021F2270
	pop {r4, pc}
_021F138E:
	ldr r0, _021F13AC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x47
	bl ov14_021F2270
	pop {r4, pc}
	.align 2, 0
_021F13A0: .4byte 0x0000044D
_021F13A4: .4byte 0x000005F3
_021F13A8: .4byte 0x000005DC
_021F13AC: .4byte 0x000005DD
	thumb_func_end ov14_021F131C

	thumb_func_start ov14_021F13B0
ov14_021F13B0: @ 0x021F13B0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4, #8]
	bl FUN_02074640
	cmp r0, #6
	beq _021F13EE
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	ldr r1, _021F1410 @ =ov14_021E9434
	adds r0, r4, #0
	movs r2, #0x53
	bl ov14_021F0234
	pop {r4, pc}
_021F13EE:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E83F4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	movs r3, #0x25
	bl ov14_021F685C
	movs r0, #0xe
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r4, pc}
	nop
_021F1410: .4byte ov14_021E9434
	thumb_func_end ov14_021F13B0

	thumb_func_start ov14_021F1414
ov14_021F1414: @ 0x021F1414
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r1, _021F1444 @ =ov14_021E9450
	adds r0, r4, #0
	movs r2, #0x5c
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F1444: .4byte ov14_021E9450
	thumb_func_end ov14_021F1414

	thumb_func_start ov14_021F1448
ov14_021F1448: @ 0x021F1448
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r4, r1, #0
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	adds r0, r5, #0
	adds r1, r4, r1
	adds r0, #0x25
	strb r1, [r0]
	bl FUN_02025358
	cmp r0, #0
	bne _021F148C
	ldr r0, [r5, #4]
	adds r5, #0x25
	ldrb r1, [r5]
	bl FUN_02073F64
	cmp r0, #0x1e
	bne _021F1482
	ldr r0, _021F14F8 @ =0x000005F3
	bl FUN_0200604C
	b _021F1488
_021F1482:
	ldr r0, _021F14FC @ =0x000005DD
	bl FUN_0200604C
_021F1488:
	movs r0, #0x66
	pop {r3, r4, r5, pc}
_021F148C:
	ldr r0, _021F14FC @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r2, r0, #0
	ldr r1, [r5, #0x34]
	ldr r0, _021F1500 @ =0x0000043C
	adds r3, r2, #0
	str r2, [r1, r0]
	ldr r0, [r5, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_02019F88
	ldr r0, [r5, #0x34]
	movs r1, #8
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	movs r0, #0x61
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F14F8: .4byte 0x000005F3
_021F14FC: .4byte 0x000005DD
_021F1500: .4byte 0x0000043C
	thumb_func_end ov14_021F1448

	thumb_func_start ov14_021F1504
ov14_021F1504: @ 0x021F1504
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F1004
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r0, [r4, #0x34]
	lsls r1, r1, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x61
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F1504

	thumb_func_start ov14_021F1534
ov14_021F1534: @ 0x021F1534
	ldr r3, _021F153C @ =ov14_021F2270
	movs r1, #0xa
	movs r2, #0x62
	bx r3
	.align 2, 0
_021F153C: .4byte ov14_021F2270
	thumb_func_end ov14_021F1534

	thumb_func_start ov14_021F1540
ov14_021F1540: @ 0x021F1540
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r1, [r1]
	ldr r0, [r4, #4]
	bl FUN_02073F64
	cmp r0, #0x1e
	bne _021F1566
	ldr r0, _021F1578 @ =0x000005F3
	bl FUN_0200604C
	b _021F156C
_021F1566:
	ldr r0, _021F157C @ =0x000005DD
	bl FUN_0200604C
_021F156C:
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x66
	bl ov14_021F2270
	pop {r4, pc}
	.align 2, 0
_021F1578: .4byte 0x000005F3
_021F157C: .4byte 0x000005DD
	thumb_func_end ov14_021F1540

	thumb_func_start ov14_021F1580
ov14_021F1580: @ 0x021F1580
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x21
	strb r1, [r0]
	ldr r1, [r4, #0x34]
	ldr r0, _021F15C0 @ =0x0000044B
	movs r2, #1
	strb r2, [r1, r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F3190
	adds r0, r4, #0
	bl ov14_021F40DC
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F15B4
	ldr r0, [r4, #0x34]
	bl ov14_021E8824
_021F15B4:
	ldr r1, _021F15C4 @ =ov14_021EA254
	adds r0, r4, #0
	movs r2, #0x73
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021F15C0: .4byte 0x0000044B
_021F15C4: .4byte ov14_021EA254
	thumb_func_end ov14_021F1580

	thumb_func_start ov14_021F15C8
ov14_021F15C8: @ 0x021F15C8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xff
	bne _021F15D6
	movs r2, #1
	b _021F15D8
_021F15D6:
	movs r2, #0
_021F15D8:
	ldr r1, [r5, #0x34]
	ldr r0, _021F17F8 @ =0x000088CC
	str r2, [r1, r0]
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	add r3, sp, #0
	adds r2, r0, r1
	ldr r1, _021F17FC @ =0x00004094
	ldrb r1, [r2, r1]
	movs r2, #0
	ldrsh r2, [r3, r2]
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	adds r2, r2, #4
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	cmp r4, #0x24
	bhs _021F1684
	cmp r4, #0x1e
	blo _021F167C
	ldr r0, [r5, #8]
	bl FUN_02074640
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r1, #0x1e
	bhs _021F1658
	adds r1, r4, #0
	subs r1, #0x1e
	cmp r1, r0
	bls _021F1650
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021F17D0
_021F1650:
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F1658:
	adds r1, r4, #0
	subs r1, #0x1e
	cmp r1, r0
	blo _021F1674
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021F17D0
_021F1674:
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F167C:
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F1684:
	cmp r4, #0xff
	bne _021F168A
	b _021F1798
_021F168A:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	adds r1, r4, r1
	adds r0, r5, #0
	subs r1, #0x25
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r6, [r0]
	cmp r6, #0x1e
	blo _021F1752
	subs r6, #0x1e
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_02074644
	movs r1, #6
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl FUN_02078068
	cmp r0, #1
	bne _021F16E2
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F16E2:
	adds r0, r7, #0
	movs r1, #0xa2
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _021F16F8
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F16F8:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E6480
	cmp r0, #0
	bne _021F170C
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F170C:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r1, [r0]
	ldrb r0, [r5, #0x1f]
	cmp r1, r0
	bne _021F172C
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021F17D0
_021F172C:
	ldr r0, [r5, #4]
	bl FUN_02073E40
	cmp r0, #0
	bne _021F173E
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F173E:
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021F17D0
_021F1752:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r1, [r0]
	ldrb r0, [r5, #0x1f]
	cmp r1, r0
	bne _021F1772
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021F17D0
_021F1772:
	ldr r0, [r5, #4]
	bl FUN_02073E40
	cmp r0, #0
	bne _021F1784
	ldr r0, [r5, #0x34]
	bl ov14_021E884C
	b _021F17D0
_021F1784:
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021F17D0
_021F1798:
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x24
	bhs _021F17BE
	adds r0, r5, #0
	bl ov14_021E7588
	cmp r0, #0
	bne _021F17D0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
	b _021F17D0
_021F17BE:
	adds r0, r5, #0
	bl ov14_021E765C
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
_021F17D0:
	ldr r1, [r5, #0x34]
	ldr r0, _021F1800 @ =0x0000044C
	movs r2, #0
	strb r4, [r1, r0]
	ldr r1, [r5, #0x34]
	subs r0, r0, #1
	strb r2, [r1, r0]
	adds r0, r5, #0
	bl ov14_021F08BC
	adds r0, r5, #0
	movs r1, #2
	adds r0, #0x22
	strb r1, [r0]
	ldr r1, _021F1804 @ =ov14_021EA378
	adds r0, r5, #0
	movs r2, #0x2b
	bl ov14_021F0234
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F17F8: .4byte 0x000088CC
_021F17FC: .4byte 0x00004094
_021F1800: .4byte 0x0000044C
_021F1804: .4byte ov14_021EA378
	thumb_func_end ov14_021F15C8

	thumb_func_start ov14_021F1808
ov14_021F1808: @ 0x021F1808
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x21
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	ldr r2, [r4, #0x34]
	ldr r1, _021F18A8 @ =0x000088C8
	strh r0, [r2, r1]
	ldr r2, [r4, #0x34]
	adds r0, r4, #0
	ldrh r1, [r2, r1]
	bl ov14_021F5FBC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8234
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8294
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r0, [r4, #0x34]
	ldr r1, _021F18A8 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021F189C
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #0
	bl ov14_021F396C
	ldr r0, [r4, #0x34]
	ldr r1, _021F18A8 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r4, #0x34]
	bl ov14_021F39D0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88BC
_021F189C:
	ldr r1, _021F18AC @ =ov14_021EA408
	adds r0, r4, #0
	movs r2, #0x76
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021F18A8: .4byte 0x000088C8
_021F18AC: .4byte ov14_021EA408
	thumb_func_end ov14_021F1808

	thumb_func_start ov14_021F18B0
ov14_021F18B0: @ 0x021F18B0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r3, [r5, #0x34]
	ldr r2, _021F19E4 @ =0x000088C8
	ldrh r4, [r3, r2]
	adds r2, r5, #0
	adds r2, #0x21
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	ldr r2, [r5, #0x34]
	ldr r1, _021F19E4 @ =0x000088C8
	strh r0, [r2, r1]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021F190E
	cmp r4, #0
	bne _021F18F2
	ldr r1, [r5, #0x34]
	ldr r0, _021F19E4 @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021F1900
_021F18F2:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E83F4
	b _021F1932
_021F1900:
	beq _021F1932
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	b _021F1932
_021F190E:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8234
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8294
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
_021F1932:
	ldr r2, [r5, #0x34]
	ldr r1, _021F19E4 @ =0x000088C8
	adds r0, r5, #0
	ldrh r1, [r2, r1]
	bl ov14_021F5FBC
	ldr r0, [r5, #0x34]
	ldr r1, _021F19E4 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021F198A
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #0
	bl ov14_021F396C
	ldr r0, [r5, #0x34]
	ldr r1, _021F19E4 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r5, #0x34]
	bl ov14_021F39D0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #1
	bl ov14_021F34C8
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88BC
	b _021F19A4
_021F198A:
	movs r1, #0xb
	bl ov14_021F2A44
	cmp r0, #1
	bne _021F19A4
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r5, #0
	bl ov14_021F40DC
_021F19A4:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	movs r3, #0
	bl ov14_021F2F88
	add r2, sp, #0
	movs r0, #2
	ldrsh r3, [r2, r0]
	ldr r1, [r5, #0x34]
	ldr r0, _021F19E8 @ =0x000040B8
	adds r3, #8
	str r3, [r1, r0]
	movs r1, #0
	ldrsh r2, [r2, r1]
	ldr r1, [r5, #0x34]
	adds r0, r0, #4
	adds r2, #8
	str r2, [r1, r0]
	adds r0, r5, #0
	bl ov14_021F1F24
	ldr r1, _021F19EC @ =ov14_021EA4C8
	adds r0, r5, #0
	movs r2, #0x7e
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F19E4: .4byte 0x000088C8
_021F19E8: .4byte 0x000040B8
_021F19EC: .4byte ov14_021EA4C8
	thumb_func_end ov14_021F18B0

	thumb_func_start ov14_021F19F0
ov14_021F19F0: @ 0x021F19F0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x21
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	ldr r2, [r4, #0x34]
	ldr r1, _021F1B38 @ =0x000088C8
	strh r0, [r2, r1]
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F6408
	ldr r1, [r4, #0x34]
	ldr r0, _021F1B38 @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _021F1A78
	ldr r0, [r1, #0x2c]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	bl FUN_02019F7C
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021F1A4E
	add sp, #4
	movs r0, #0x82
	pop {r3, r4, pc}
_021F1A4E:
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	bne _021F1A6A
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85D0
_021F1A6A:
	ldr r1, _021F1B3C @ =ov14_021E99A0
	adds r0, r4, #0
	movs r2, #0x82
	bl ov14_021F0234
	add sp, #4
	pop {r3, r4, pc}
_021F1A78:
	ldr r0, _021F1B40 @ =0x000005EB
	bl FUN_0200604C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #2
	bl ov14_021F396C
	ldr r0, [r4, #0x34]
	ldr r1, _021F1B38 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r4, #0x34]
	bl ov14_021F39D0
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F34C8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88BC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #1
	ldr r1, [r4, #0x34]
	bne _021F1ADE
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85D0
	b _021F1AF8
_021F1ADE:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021F1AF8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
_021F1AF8:
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r0, [r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	movs r3, #2
	bl ov14_021F2F88
	add r2, sp, #0
	movs r0, #2
	ldrsh r3, [r2, r0]
	ldr r1, [r4, #0x34]
	ldr r0, _021F1B44 @ =0x000040B8
	adds r3, #8
	str r3, [r1, r0]
	movs r1, #0
	ldrsh r2, [r2, r1]
	ldr r1, [r4, #0x34]
	adds r0, r0, #4
	adds r2, #8
	str r2, [r1, r0]
	adds r0, r4, #0
	bl ov14_021F1F24
	ldr r1, _021F1B48 @ =ov14_021EA778
	adds r0, r4, #0
	movs r2, #0x84
	bl ov14_021F0234
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021F1B38: .4byte 0x000088C8
_021F1B3C: .4byte ov14_021E99A0
_021F1B40: .4byte 0x000005EB
_021F1B44: .4byte 0x000040B8
_021F1B48: .4byte ov14_021EA778
	thumb_func_end ov14_021F19F0

	thumb_func_start ov14_021F1B4C
ov14_021F1B4C: @ 0x021F1B4C
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x21
	strb r1, [r2]
	ldr r3, [r4, #0x34]
	ldr r2, _021F1BF0 @ =0x000088CA
	strh r1, [r3, r2]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	ldr r2, [r4, #0x34]
	ldr r1, _021F1BF4 @ =0x000088C8
	strh r0, [r2, r1]
	ldr r0, [r4, #0x34]
	ldrh r0, [r0, r1]
	cmp r0, #0
	bne _021F1B7C
	movs r0, #0x82
	pop {r4, pc}
_021F1B7C:
	ldr r0, _021F1BF8 @ =0x000005EB
	bl FUN_0200604C
	ldr r1, [r4, #0x34]
	ldr r0, _021F1BFC @ =0x0000044B
	movs r2, #1
	strb r2, [r1, r0]
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #2
	bl ov14_021F39A0
	ldr r0, [r4, #0x34]
	ldr r1, _021F1BF4 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F34C8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88BC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #1
	bne _021F1BE2
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8634
_021F1BE2:
	ldr r1, _021F1C00 @ =ov14_021EAA04
	adds r0, r4, #0
	movs r2, #0x88
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F1BF0: .4byte 0x000088CA
_021F1BF4: .4byte 0x000088C8
_021F1BF8: .4byte 0x000005EB
_021F1BFC: .4byte 0x0000044B
_021F1C00: .4byte ov14_021EAA04
	thumb_func_end ov14_021F1B4C

	thumb_func_start ov14_021F1C04
ov14_021F1C04: @ 0x021F1C04
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r0, #0
	cmp r1, #0x24
	bhs _021F1C2E
	adds r0, r4, #0
	bl ov14_021E7588
	cmp r0, #1
	bne _021F1C34
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8620
	b _021F1C34
_021F1C2E:
	adds r0, r4, #0
	bl ov14_021E765C
_021F1C34:
	adds r0, r4, #0
	bl ov14_021F1F24
	ldr r1, _021F1C48 @ =ov14_021EAC24
	adds r0, r4, #0
	movs r2, #0x86
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F1C48: .4byte ov14_021EAC24
	thumb_func_end ov14_021F1C04

	thumb_func_start ov14_021F1C4C
ov14_021F1C4C: @ 0x021F1C4C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _021F1CD4 @ =0x0000044C
	movs r2, #0
	strb r4, [r1, r0]
	ldr r1, [r5, #0x34]
	subs r0, r0, #1
	strb r2, [r1, r0]
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0xca
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	adds r2, #8
	lsls r2, r2, #0x10
	ldrsh r1, [r3, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r1, [r5, #0x34]
	ldr r0, _021F1CD4 @ =0x0000044C
	ldrb r0, [r1, r0]
	cmp r0, #0xff
	bne _021F1CA0
	adds r0, r5, #0
	bl ov14_021F1C04
	pop {r3, r4, r5, pc}
_021F1CA0:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021E6AA0
	cmp r0, #0
	bne _021F1CBA
	adds r0, r5, #0
	bl ov14_021F1C04
	pop {r3, r4, r5, pc}
_021F1CBA:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
	ldr r1, _021F1CD8 @ =ov14_021EAB54
	adds r0, r5, #0
	movs r2, #0x8a
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F1CD4: .4byte 0x0000044C
_021F1CD8: .4byte ov14_021EAB54
	thumb_func_end ov14_021F1C4C

	thumb_func_start ov14_021F1CDC
ov14_021F1CDC: @ 0x021F1CDC
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x21
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	ldr r2, [r4, #0x34]
	ldr r1, _021F1D64 @ =0x000088C8
	strh r0, [r2, r1]
	ldr r2, [r4, #0x34]
	adds r0, r4, #0
	ldrh r1, [r2, r1]
	bl ov14_021F5FBC
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8434
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
	ldr r0, [r4, #0x34]
	ldr r1, _021F1D64 @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021F1D58
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	movs r2, #1
	bl ov14_021F396C
	ldr r0, [r4, #0x34]
	ldr r1, _021F1D64 @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r4, #0x34]
	bl ov14_021F39D0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88BC
_021F1D58:
	ldr r1, _021F1D68 @ =ov14_021EA408
	adds r0, r4, #0
	movs r2, #0x8c
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021F1D64: .4byte 0x000088C8
_021F1D68: .4byte ov14_021EA408
	thumb_func_end ov14_021F1CDC

	thumb_func_start ov14_021F1D6C
ov14_021F1D6C: @ 0x021F1D6C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x21
	strb r1, [r2]
	ldr r2, [r5, #0x34]
	ldr r1, _021F1EAC @ =0x000088C8
	movs r3, #0
	ldrh r4, [r2, r1]
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #6
	bl ov14_021E6070
	ldr r2, [r5, #0x34]
	ldr r1, _021F1EAC @ =0x000088C8
	strh r0, [r2, r1]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021F1DCA
	cmp r4, #0
	bne _021F1DAE
	ldr r1, [r5, #0x34]
	ldr r0, _021F1EAC @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021F1DBC
_021F1DAE:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E83F4
	b _021F1DD6
_021F1DBC:
	beq _021F1DD6
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	b _021F1DD6
_021F1DCA:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8314
_021F1DD6:
	ldr r2, [r5, #0x34]
	ldr r1, _021F1EAC @ =0x000088C8
	adds r0, r5, #0
	ldrh r1, [r2, r1]
	bl ov14_021F5FBC
	ldr r0, [r5, #0x34]
	ldr r1, _021F1EAC @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021F1E52
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #1
	bl ov14_021F396C
	ldr r0, [r5, #0x34]
	ldr r1, _021F1EAC @ =0x000088C8
	ldrh r1, [r0, r1]
	bl ov14_021F3844
	ldr r0, [r5, #0x34]
	bl ov14_021F39D0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r0, [r5, #0x34]
	movs r2, #1
	bl ov14_021F34C8
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88BC
	ldr r1, [r5, #0x34]
	ldr r0, _021F1EAC @ =0x000088C8
	ldrh r0, [r1, r0]
	bl FUN_02078068
	cmp r0, #1
	bne _021F1E46
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #9
	bl ov14_021F6928
	b _021F1E6C
_021F1E46:
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xa
	bl ov14_021F6928
	b _021F1E6C
_021F1E52:
	movs r1, #0xb
	bl ov14_021F2A44
	cmp r0, #1
	bne _021F1E6C
	ldr r0, [r5, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r5, #0
	bl ov14_021F40DC
_021F1E6C:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	movs r3, #1
	bl ov14_021F2F88
	add r2, sp, #0
	movs r0, #2
	ldrsh r3, [r2, r0]
	ldr r1, [r5, #0x34]
	ldr r0, _021F1EB0 @ =0x000040B8
	adds r3, #8
	str r3, [r1, r0]
	movs r1, #0
	ldrsh r2, [r2, r1]
	ldr r1, [r5, #0x34]
	adds r0, r0, #4
	adds r2, #8
	str r2, [r1, r0]
	adds r0, r5, #0
	bl ov14_021F1F24
	ldr r1, _021F1EB4 @ =ov14_021EACD4
	adds r0, r5, #0
	movs r2, #0x8d
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	nop
_021F1EAC: .4byte 0x000088C8
_021F1EB0: .4byte 0x000040B8
_021F1EB4: .4byte ov14_021EACD4
	thumb_func_end ov14_021F1D6C

	thumb_func_start ov14_021F1EB8
ov14_021F1EB8: @ 0x021F1EB8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, _021F1F1C @ =0x000088C8
	ldrh r1, [r0, r1]
	cmp r1, #0
	bne _021F1EFA
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov14_021E60C0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	bne _021F1EF6
	movs r0, #0x24
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	movs r1, #1
	bl ov14_021F027C
	pop {r3, r4, r5, pc}
_021F1EF6:
	movs r4, #0x7c
	b _021F1F04
_021F1EFA:
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r4, #0x78
_021F1F04:
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	ldr r1, _021F1F20 @ =ov14_021E9450
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F0234
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F1F1C: .4byte 0x000088C8
_021F1F20: .4byte ov14_021E9450
	thumb_func_end ov14_021F1EB8

	thumb_func_start ov14_021F1F24
ov14_021F1F24: @ 0x021F1F24
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	movs r1, #0x1c
	bl FUN_0201AA8C
	ldr r1, [r4, #0x34]
	str r0, [r1, #0xc]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F1F24

	thumb_func_start ov14_021F1F38
ov14_021F1F38: @ 0x021F1F38
	ldr r0, [r0, #0x34]
	ldr r3, _021F1F40 @ =FUN_0201AB0C
	ldr r0, [r0, #0xc]
	bx r3
	.align 2, 0
_021F1F40: .4byte FUN_0201AB0C
	thumb_func_end ov14_021F1F38

	thumb_func_start ov14_021F1F44
ov14_021F1F44: @ 0x021F1F44
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov14_021F7B7C
	cmp r0, #1
	bne _021F1F7E
	ldr r0, _021F2008 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x26
	strb r1, [r0]
	adds r0, r5, #0
	adds r0, #0x27
	strb r1, [r0]
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r1, r5, #0
	adds r1, #0x28
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0xf
	movs r2, #0x97
	bl ov14_021F2330
	pop {r3, r4, r5, pc}
_021F1F7E:
	adds r0, r5, #0
	bl ov14_021F7340
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F90
	cmp r0, #0
	bne _021F1F96
	movs r4, #1
	mvns r4, r4
_021F1F96:
	movs r1, #2
	mvns r1, r1
	cmp r4, r1
	bhi _021F1FCE
	bhs _021F1FE0
	cmp r4, #0x2a
	bhi _021F1FC4
	adds r0, r4, #0
	subs r0, #0x24
	bmi _021F1FFA
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F1FB6: @ jump table
	.2byte _021F1FF0 - _021F1FB6 - 2 @ case 0
	.2byte _021F1FFA - _021F1FB6 - 2 @ case 1
	.2byte _021F1FFA - _021F1FB6 - 2 @ case 2
	.2byte _021F1FFA - _021F1FB6 - 2 @ case 3
	.2byte _021F1FFA - _021F1FB6 - 2 @ case 4
	.2byte _021F1FFA - _021F1FB6 - 2 @ case 5
	.2byte _021F1FFA - _021F1FB6 - 2 @ case 6
_021F1FC4:
	movs r0, #3
	mvns r0, r0
	cmp r4, r0
	beq _021F2004
	b _021F1FFA
_021F1FCE:
	adds r0, r1, #1
	cmp r4, r0
	bhi _021F1FD8
	beq _021F1FF0
	b _021F1FFA
_021F1FD8:
	adds r0, r1, #2
	cmp r4, r0
	beq _021F2004
	b _021F1FFA
_021F1FE0:
	ldr r0, _021F200C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0x74
	bl ov14_021F0244
	pop {r3, r4, r5, pc}
_021F1FF0:
	adds r0, r5, #0
	movs r1, #0xff
	bl ov14_021F15C8
	pop {r3, r4, r5, pc}
_021F1FFA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F15C8
	pop {r3, r4, r5, pc}
_021F2004:
	movs r0, #0x73
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F2008: .4byte 0x000005DD
_021F200C: .4byte 0x000005DC
	thumb_func_end ov14_021F1F44

	thumb_func_start ov14_021F2010
ov14_021F2010: @ 0x021F2010
	push {r3, lr}
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0xc]
	bl FUN_0201AB0C
	movs r0, #0x73
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F2010

	thumb_func_start ov14_021F2020
ov14_021F2020: @ 0x021F2020
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	adds r1, r0, #0
	str r1, [sp]
	lsls r1, r1, #0x10
	ldr r0, [r5, #0xc]
	lsrs r1, r1, #0x10
	movs r2, #1
	movs r3, #0xa
	bl FUN_02078398
	cmp r0, #1
	bne _021F20A4
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	adds r0, r5, #0
	bl ov14_021E60C0
	adds r4, r0, #0
	ldr r1, [sp]
	adds r0, r5, #0
	movs r2, #0x25
	bl ov14_021F673C
	movs r0, #0
	adds r1, r5, #0
	str r0, [sp]
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	movs r2, #6
	add r3, sp, #0
	bl ov14_021E6094
	adds r0, r4, #0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021F2096
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r2, [r0]
	ldr r3, [r5, #0x34]
	ldrb r1, [r5, #0x1f]
	adds r4, r3, r2
	ldr r3, _021F20BC @ =0x00004094
	adds r0, r5, #0
	ldrb r3, [r4, r3]
	bl ov14_021F2ED0
_021F2096:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r5, #0
	bl ov14_021E75F4
	b _021F20B2
_021F20A4:
	ldr r0, _021F20C0 @ =0x000005F3
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0x25
	bl ov14_021F675C
_021F20B2:
	movs r0, #0xe
	str r0, [r5, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
	nop
_021F20BC: .4byte 0x00004094
_021F20C0: .4byte 0x000005F3
	thumb_func_end ov14_021F2020

	thumb_func_start ov14_021F20C4
ov14_021F20C4: @ 0x021F20C4
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F40DC
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6654
	adds r0, r4, #0
	bl ov14_021E71E8
	ldr r1, [r4, #0x34]
	ldr r0, _021F20F0 @ =0x000088DC
	ldr r0, [r1, r0]
	bl ov14_021F3354
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	movs r0, #0x1a
	pop {r4, pc}
	nop
_021F20F0: .4byte 0x000088DC
	thumb_func_end ov14_021F20C4

	thumb_func_start ov14_021F20F4
ov14_021F20F4: @ 0x021F20F4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl FUN_0207879C
	ldr r2, [r4, #0x34]
	ldr r1, _021F21A8 @ =0x000088C8
	movs r3, #0xa
	ldrh r1, [r2, r1]
	movs r2, #1
	bl FUN_02078398
	cmp r0, #0
	bne _021F212A
	ldr r0, _021F21AC @ =0x000005F3
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #6
	movs r2, #0x25
	bl ov14_021F68C0
	movs r0, #0x7a
	str r0, [r4, #0x30]
	movs r0, #6
	pop {r3, r4, r5, pc}
_021F212A:
	movs r1, #0
	add r0, sp, #0
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	movs r2, #6
	add r3, sp, #0
	bl ov14_021E6094
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r2]
	adds r0, r4, #0
	bl ov14_021E60C0
	bl ov14_021E64D0
	cmp r0, #1
	bne _021F216C
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r2, [r0]
	ldr r3, [r4, #0x34]
	ldrb r1, [r4, #0x1f]
	adds r5, r3, r2
	ldr r3, _021F21B0 @ =0x00004094
	adds r0, r4, #0
	ldrb r3, [r5, r3]
	bl ov14_021F2ED0
_021F216C:
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	adds r0, r4, #0
	bl ov14_021E7588
	adds r0, r4, #0
	bl ov14_021F40DC
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6654
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F391C
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #2
	bl ov14_021F29E4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
	movs r0, #0x79
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F21A8: .4byte 0x000088C8
_021F21AC: .4byte 0x000005F3
_021F21B0: .4byte 0x00004094
	thumb_func_end ov14_021F20F4

	thumb_func_start ov14_021F21B4
ov14_021F21B4: @ 0x021F21B4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F21CC @ =0x0000060D
	bl FUN_0200604C
	movs r0, #0xb3
	str r0, [r4, #0x30]
	adds r0, r4, #0
	movs r1, #1
	bl ov14_021F0204
	pop {r4, pc}
	.align 2, 0
_021F21CC: .4byte 0x0000060D
	thumb_func_end ov14_021F21B4

	thumb_func_start ov14_021F21D0
ov14_021F21D0: @ 0x021F21D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x25
	bl ov14_021F6654
	ldr r0, [r4, #0x34]
	movs r1, #1
	ldr r0, [r0, #0x2c]
	bl FUN_02019F94
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bhi _021F226A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F21FA: @ jump table
	.2byte _021F2202 - _021F21FA - 2 @ case 0
	.2byte _021F221C - _021F21FA - 2 @ case 1
	.2byte _021F223E - _021F21FA - 2 @ case 2
	.2byte _021F2254 - _021F21FA - 2 @ case 3
_021F2202:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov14_021F3488
	movs r0, #0x5b
	pop {r4, pc}
_021F221C:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #0x27
	bl ov14_021F685C
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F43F4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
	movs r0, #0x51
	pop {r4, pc}
_021F223E:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F43F4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
	movs r0, #0xc
	pop {r4, pc}
_021F2254:
	ldr r0, [r4, #0x34]
	movs r1, #1
	bl ov14_021F43F4
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #0
	bl ov14_021F3488
	movs r0, #0x75
	pop {r4, pc}
_021F226A:
	movs r0, #0xc
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F21D0

	thumb_func_start ov14_021F2270
ov14_021F2270: @ 0x021F2270
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r2, #0
	movs r0, #0x2f
	ldr r2, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	add r2, sp, #0
	adds r2, #1
	add r3, sp, #0
	adds r4, r1, #0
	bl FUN_02019B1C
	movs r0, #0x2f
	add r3, sp, #0
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	adds r1, r4, #0
	add r2, sp, #4
	adds r3, #2
	bl FUN_02019B44
	ldr r2, [r5, #0x34]
	ldr r0, _021F232C @ =0x000088D4
	movs r3, #1
	ldrb r1, [r2, r0]
	bics r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r2, r0]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	adds r1, r4, #0
	bl FUN_02019B10
	lsls r0, r0, #0x19
	ldr r3, [r5, #0x34]
	ldr r1, _021F232C @ =0x000088D4
	movs r4, #0xfe
	ldrb r2, [r3, r1]
	lsrs r0, r0, #0x18
	bics r2, r4
	orrs r0, r2
	strb r0, [r3, r1]
	ldr r0, [r5, #0x34]
	adds r2, r1, #1
	ldrb r3, [r0, r2]
	movs r2, #0xf
	bics r3, r2
	movs r2, #0xd
	orrs r3, r2
	adds r2, r1, #1
	strb r3, [r0, r2]
	ldr r0, [r5, #0x34]
	ldrb r3, [r0, r2]
	movs r2, #0xf0
	bics r3, r2
	movs r2, #0xc0
	orrs r3, r2
	adds r2, r1, #1
	strb r3, [r0, r2]
	ldr r3, [r5, #0x34]
	movs r2, #0
	adds r0, r1, #2
	strb r2, [r3, r0]
	ldr r3, [r5, #0x34]
	adds r0, r1, #3
	strb r2, [r3, r0]
	add r0, sp, #0
	movs r3, #1
	ldrsb r7, [r0, r3]
	ldr r4, [r5, #0x34]
	adds r3, r1, #4
	strb r7, [r4, r3]
	ldrsb r4, [r0, r2]
	ldr r3, [r5, #0x34]
	adds r2, r1, #5
	strb r4, [r3, r2]
	ldrh r4, [r0, #4]
	ldr r3, [r5, #0x34]
	adds r2, r1, #6
	strb r4, [r3, r2]
	ldrh r3, [r0, #2]
	ldr r2, [r5, #0x34]
	adds r0, r1, #7
	strb r3, [r2, r0]
	str r6, [r5, #0x30]
	movs r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F232C: .4byte 0x000088D4
	thumb_func_end ov14_021F2270

	thumb_func_start ov14_021F2330
ov14_021F2330: @ 0x021F2330
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r2, #0
	movs r0, #0x2f
	ldr r2, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	add r2, sp, #0
	adds r2, #1
	add r3, sp, #0
	adds r4, r1, #0
	bl FUN_02019B1C
	movs r0, #0x2f
	add r3, sp, #0
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	adds r1, r4, #0
	add r2, sp, #4
	adds r3, #2
	bl FUN_02019B44
	ldr r2, [r5, #0x34]
	ldr r0, _021F23EC @ =0x000088D4
	movs r3, #1
	ldrb r1, [r2, r0]
	bics r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r2, r0]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	adds r1, r4, #0
	bl FUN_02019B10
	lsls r0, r0, #0x19
	ldr r3, [r5, #0x34]
	ldr r1, _021F23EC @ =0x000088D4
	movs r4, #0xfe
	ldrb r2, [r3, r1]
	lsrs r0, r0, #0x18
	bics r2, r4
	orrs r0, r2
	strb r0, [r3, r1]
	ldr r0, [r5, #0x34]
	adds r2, r1, #1
	ldrb r3, [r0, r2]
	movs r2, #0xf
	bics r3, r2
	movs r2, #3
	orrs r3, r2
	adds r2, r1, #1
	strb r3, [r0, r2]
	ldr r0, [r5, #0x34]
	ldrb r3, [r0, r2]
	movs r2, #0xf0
	bics r3, r2
	movs r2, #0x20
	orrs r3, r2
	adds r2, r1, #1
	strb r3, [r0, r2]
	ldr r3, [r5, #0x34]
	movs r2, #0
	adds r0, r1, #2
	strb r2, [r3, r0]
	ldr r3, [r5, #0x34]
	adds r0, r1, #3
	strb r2, [r3, r0]
	add r0, sp, #0
	movs r3, #1
	ldrsb r7, [r0, r3]
	ldr r4, [r5, #0x34]
	adds r3, r1, #4
	strb r7, [r4, r3]
	ldrsb r4, [r0, r2]
	ldr r3, [r5, #0x34]
	adds r2, r1, #5
	strb r4, [r3, r2]
	ldrh r4, [r0, #4]
	ldr r3, [r5, #0x34]
	adds r2, r1, #6
	strb r4, [r3, r2]
	ldrh r3, [r0, #2]
	ldr r2, [r5, #0x34]
	adds r0, r1, #7
	strb r3, [r2, r0]
	str r6, [r5, #0x30]
	movs r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F23EC: .4byte 0x000088D4
	thumb_func_end ov14_021F2330

	thumb_func_start ov14_021F23F0
ov14_021F23F0: @ 0x021F23F0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	ldr r2, [r5, #0x34]
	ldr r0, _021F2488 @ =0x000088D4
	adds r4, r1, #0
	ldrb r1, [r2, r0]
	movs r3, #1
	bics r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r2, r0]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	bl FUN_02019B10
	lsls r0, r0, #0x19
	ldr r3, [r5, #0x34]
	ldr r1, _021F2488 @ =0x000088D4
	movs r7, #0xfe
	ldrb r2, [r3, r1]
	lsrs r0, r0, #0x18
	bics r2, r7
	orrs r0, r2
	strb r0, [r3, r1]
	ldr r0, [r5, #0x34]
	adds r2, r1, #1
	ldrb r3, [r0, r2]
	movs r2, #0xf
	bics r3, r2
	movs r2, #3
	orrs r3, r2
	adds r2, r1, #1
	strb r3, [r0, r2]
	ldr r0, [r5, #0x34]
	ldrb r3, [r0, r2]
	movs r2, #0xf0
	bics r3, r2
	movs r2, #0x20
	orrs r3, r2
	adds r2, r1, #1
	strb r3, [r0, r2]
	ldr r3, [r5, #0x34]
	movs r0, #0
	adds r2, r1, #2
	strb r0, [r3, r2]
	adds r2, r1, #3
	ldr r3, [r5, #0x34]
	cmp r4, #0
	strb r0, [r3, r2]
	bne _021F2460
	movs r3, #0x10
	b _021F2462
_021F2460:
	movs r3, #0x14
_021F2462:
	ldr r2, [r5, #0x34]
	adds r0, r1, #5
	strb r3, [r2, r0]
	ldr r1, [r5, #0x34]
	ldr r0, _021F248C @ =0x000088D8
	movs r2, #0x16
	strb r2, [r1, r0]
	adds r1, r0, #2
	ldr r2, [r5, #0x34]
	movs r3, #9
	strb r3, [r2, r1]
	ldr r1, [r5, #0x34]
	movs r2, #4
	adds r0, r0, #3
	strb r2, [r1, r0]
	str r6, [r5, #0x30]
	movs r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2488: .4byte 0x000088D4
_021F248C: .4byte 0x000088D8
	thumb_func_end ov14_021F23F0

	thumb_func_start ov14_021F2490
ov14_021F2490: @ 0x021F2490
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r3, [r5, #0x34]
	ldr r0, _021F252C @ =0x000088D4
	adds r6, r2, #0
	ldrb r2, [r3, r0]
	adds r4, r1, #0
	movs r1, #1
	bics r2, r1
	movs r1, #1
	orrs r2, r1
	strb r2, [r3, r0]
	movs r0, #0x2f
	ldr r2, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	bl FUN_02019B10
	lsls r0, r0, #0x19
	ldr r3, [r5, #0x34]
	ldr r1, _021F252C @ =0x000088D4
	movs r7, #0xfe
	ldrb r2, [r3, r1]
	lsrs r0, r0, #0x18
	bics r2, r7
	orrs r0, r2
	strb r0, [r3, r1]
	ldr r2, [r5, #0x34]
	adds r0, r1, #1
	ldrb r3, [r2, r0]
	movs r0, #0xf
	bics r3, r0
	adds r7, r3, #0
	movs r0, #3
	orrs r7, r0
	adds r3, r1, #1
	strb r7, [r2, r3]
	ldr r3, [r5, #0x34]
	adds r2, r1, #1
	ldrb r2, [r3, r2]
	movs r7, #0xf0
	bics r2, r7
	movs r7, #0x20
	orrs r7, r2
	adds r2, r1, #1
	strb r7, [r3, r2]
	ldr r7, [r5, #0x34]
	movs r2, #0
	adds r3, r1, #2
	strb r2, [r7, r3]
	adds r3, r1, #3
	ldr r7, [r5, #0x34]
	cmp r4, #0
	strb r2, [r7, r3]
	bne _021F2506
	ldr r2, [r5, #0x34]
	adds r1, r1, #4
	strb r0, [r2, r1]
	b _021F250E
_021F2506:
	ldr r2, [r5, #0x34]
	movs r3, #0x16
	adds r0, r1, #4
	strb r3, [r2, r0]
_021F250E:
	ldr r1, [r5, #0x34]
	ldr r0, _021F2530 @ =0x000088D9
	movs r2, #0x14
	strb r2, [r1, r0]
	adds r1, r0, #1
	ldr r2, [r5, #0x34]
	movs r3, #9
	strb r3, [r2, r1]
	ldr r1, [r5, #0x34]
	movs r2, #4
	adds r0, r0, #2
	strb r2, [r1, r0]
	str r6, [r5, #0x30]
	movs r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F252C: .4byte 0x000088D4
_021F2530: .4byte 0x000088D9
	thumb_func_end ov14_021F2490

	thumb_func_start ov14_021F2534
ov14_021F2534: @ 0x021F2534
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4]
	ldr r1, [r1, #8]
	cmp r1, #3
	bhi _021F2570
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F254C: @ jump table
	.2byte _021F2554 - _021F254C - 2 @ case 0
	.2byte _021F255E - _021F254C - 2 @ case 1
	.2byte _021F255E - _021F254C - 2 @ case 2
	.2byte _021F255E - _021F254C - 2 @ case 3
_021F2554:
	movs r1, #2
	movs r2, #1
	bl ov14_021F3488
	pop {r4, pc}
_021F255E:
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl ov14_021F43F4
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
_021F2570:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2534

	thumb_func_start ov14_021F2574
ov14_021F2574: @ 0x021F2574
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #1
	bl ov14_021F66E8
	adds r0, r4, #0
	bl ov14_021F2534
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021F0254
	pop {r4, pc}
	thumb_func_end ov14_021F2574

	thumb_func_start ov14_021F259C
ov14_021F259C: @ 0x021F259C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	movs r1, #0x25
	movs r2, #0
	bl ov14_021F66E8
	adds r0, r4, #0
	bl ov14_021F2534
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F0254
	pop {r4, pc}
	thumb_func_end ov14_021F259C

	thumb_func_start ov14_021F25C4
ov14_021F25C4: @ 0x021F25C4
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	bl ov14_021F0AD8
	pop {r4, pc}
	thumb_func_end ov14_021F25C4

	thumb_func_start ov14_021F25D4
ov14_021F25D4: @ 0x021F25D4
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	bl ov14_021F0C88
	pop {r4, pc}
	thumb_func_end ov14_021F25D4

	thumb_func_start ov14_021F25E4
ov14_021F25E4: @ 0x021F25E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov14_021F40E8
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x24
	strb r1, [r0]
	adds r0, r4, #0
	movs r2, #0
	adds r0, #0x29
	strb r2, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #9
	bl ov14_021F2A18
	adds r0, r4, #0
	movs r1, #0x2f
	bl ov14_021F1100
	pop {r4, pc}
	thumb_func_end ov14_021F25E4

	thumb_func_start ov14_021F2610
ov14_021F2610: @ 0x021F2610
	ldr r3, _021F2618 @ =ov14_021F027C
	movs r1, #0
	bx r3
	nop
_021F2618: .4byte ov14_021F027C
	thumb_func_end ov14_021F2610

	thumb_func_start ov14_021F261C
ov14_021F261C: @ 0x021F261C
	ldr r3, _021F2620 @ =ov14_021F0910
	bx r3
	.align 2, 0
_021F2620: .4byte ov14_021F0910
	thumb_func_end ov14_021F261C

	thumb_func_start ov14_021F2624
ov14_021F2624: @ 0x021F2624
	ldr r3, _021F2628 @ =ov14_021F0A80
	bx r3
	.align 2, 0
_021F2628: .4byte ov14_021F0A80
	thumb_func_end ov14_021F2624

	thumb_func_start ov14_021F262C
ov14_021F262C: @ 0x021F262C
	ldr r3, _021F2630 @ =ov14_021F09BC
	bx r3
	.align 2, 0
_021F2630: .4byte ov14_021F09BC
	thumb_func_end ov14_021F262C

	thumb_func_start ov14_021F2634
ov14_021F2634: @ 0x021F2634
	ldr r3, _021F2638 @ =ov14_021F0AAC
	bx r3
	.align 2, 0
_021F2638: .4byte ov14_021F0AAC
	thumb_func_end ov14_021F2634

	thumb_func_start ov14_021F263C
ov14_021F263C: @ 0x021F263C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021F268C @ =ov14_021EA180
	adds r0, r4, #0
	movs r2, #0x4a
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F268C: .4byte ov14_021EA180
	thumb_func_end ov14_021F263C

	thumb_func_start ov14_021F2690
ov14_021F2690: @ 0x021F2690
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	cmp r1, #0
	bne _021F26A4
	bl ov14_021E76B8
	b _021F26AA
_021F26A4:
	movs r1, #0
	bl ov14_021F40E8
_021F26AA:
	adds r0, r4, #0
	bl ov14_021F0C0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2690

	thumb_func_start ov14_021F26B4
ov14_021F26B4: @ 0x021F26B4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021F26EC @ =ov14_021EA180
	adds r0, r4, #0
	movs r2, #0x4c
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F26EC: .4byte ov14_021EA180
	thumb_func_end ov14_021F26B4

	thumb_func_start ov14_021F26F0
ov14_021F26F0: @ 0x021F26F0
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	bl ov14_021F0B34
	pop {r4, pc}
	thumb_func_end ov14_021F26F0

	thumb_func_start ov14_021F2700
ov14_021F2700: @ 0x021F2700
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	movs r1, #3
	bl ov14_021F0F0C
	pop {r4, pc}
	thumb_func_end ov14_021F2700

	thumb_func_start ov14_021F2718
ov14_021F2718: @ 0x021F2718
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	bl ov14_021F0CD8
	pop {r4, pc}
	thumb_func_end ov14_021F2718

	thumb_func_start ov14_021F2728
ov14_021F2728: @ 0x021F2728
	ldr r3, _021F2730 @ =ov14_021F0F0C
	movs r1, #1
	bx r3
	nop
_021F2730: .4byte ov14_021F0F0C
	thumb_func_end ov14_021F2728

	thumb_func_start ov14_021F2734
ov14_021F2734: @ 0x021F2734
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F3488
	adds r0, r4, #0
	movs r1, #0x3f
	bl ov14_021F1090
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2734

	thumb_func_start ov14_021F2760
ov14_021F2760: @ 0x021F2760
	ldr r3, _021F2768 @ =ov14_021F027C
	movs r1, #2
	bx r3
	nop
_021F2768: .4byte ov14_021F027C
	thumb_func_end ov14_021F2760

	thumb_func_start ov14_021F276C
ov14_021F276C: @ 0x021F276C
	ldr r3, _021F2774 @ =ov14_021F0F0C
	movs r1, #2
	bx r3
	nop
_021F2774: .4byte ov14_021F0F0C
	thumb_func_end ov14_021F276C

	thumb_func_start ov14_021F2778
ov14_021F2778: @ 0x021F2778
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0x27
	bl ov14_021F6654
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021F27A2
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #0
	bl ov14_021F3488
	b _021F27AC
_021F27A2:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov14_021F3488
_021F27AC:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	ldr r2, [r4, #0x34]
	ldr r0, _021F27C8 @ =0x0000043C
	str r1, [r2, r0]
	movs r0, #9
	str r0, [r4, #0x2c]
	movs r0, #0x43
	pop {r4, pc}
	nop
_021F27C8: .4byte 0x0000043C
	thumb_func_end ov14_021F2778

	thumb_func_start ov14_021F27CC
ov14_021F27CC: @ 0x021F27CC
	ldr r3, _021F27D0 @ =ov14_021F13B0
	bx r3
	.align 2, 0
_021F27D0: .4byte ov14_021F13B0
	thumb_func_end ov14_021F27CC

	thumb_func_start ov14_021F27D4
ov14_021F27D4: @ 0x021F27D4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021F280C @ =ov14_021EA130
	adds r0, r4, #0
	movs r2, #0x59
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F280C: .4byte ov14_021EA130
	thumb_func_end ov14_021F27D4

	thumb_func_start ov14_021F2810
ov14_021F2810: @ 0x021F2810
	ldr r3, _021F2814 @ =ov14_021F1414
	bx r3
	.align 2, 0
_021F2814: .4byte ov14_021F1414
	thumb_func_end ov14_021F2810

	thumb_func_start ov14_021F2818
ov14_021F2818: @ 0x021F2818
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov14_021F5EB4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	ldr r0, [r4, #0x34]
	bl ov14_021E884C
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F40E8
	ldr r1, _021F2854 @ =ov14_021EA130
	adds r0, r4, #0
	movs r2, #0x70
	bl ov14_021F0234
	pop {r4, pc}
	.align 2, 0
_021F2854: .4byte ov14_021EA130
	thumb_func_end ov14_021F2818

	thumb_func_start ov14_021F2858
ov14_021F2858: @ 0x021F2858
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
	adds r0, r4, #0
	bl ov14_021F0AD8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2858

	thumb_func_start ov14_021F2874
ov14_021F2874: @ 0x021F2874
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E76B8
	adds r0, r4, #0
	movs r1, #0x82
	movs r2, #1
	bl ov14_021F3488
	adds r0, r4, #0
	bl ov14_021F0C88
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2874

	thumb_func_start ov14_021F2890
ov14_021F2890: @ 0x021F2890
	ldr r3, _021F2894 @ =ov14_021F1EB8
	bx r3
	.align 2, 0
_021F2894: .4byte ov14_021F1EB8
	thumb_func_end ov14_021F2890

	thumb_func_start ov14_021F2898
ov14_021F2898: @ 0x021F2898
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8248
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E82A8
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r0, r4, #0
	bl ov14_021F40DC
	ldr r1, [r4, #0x34]
	ldr r0, _021F28F4 @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021F28E6
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
_021F28E6:
	ldr r1, _021F28F8 @ =ov14_021EA674
	adds r0, r4, #0
	movs r2, #0x76
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F28F4: .4byte 0x000088C8
_021F28F8: .4byte ov14_021EA674
	thumb_func_end ov14_021F2898

	thumb_func_start ov14_021F28FC
ov14_021F28FC: @ 0x021F28FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	movs r1, #4
	bl ov14_021F0F0C
	pop {r4, pc}
	thumb_func_end ov14_021F28FC

	thumb_func_start ov14_021F2914
ov14_021F2914: @ 0x021F2914
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021E76B8
	ldr r0, [r4, #0x34]
	movs r1, #0xb
	movs r2, #0
	bl ov14_021F2A18
	adds r0, r4, #0
	bl ov14_021F0C0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2914

	thumb_func_start ov14_021F2930
ov14_021F2930: @ 0x021F2930
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E84A4
	movs r0, #0x2f
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8328
	adds r0, r4, #0
	bl ov14_021F40DC
	ldr r1, [r4, #0x34]
	ldr r0, _021F2974 @ =0x000088C8
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _021F2966
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E88F8
_021F2966:
	ldr r1, _021F2978 @ =ov14_021EA674
	adds r0, r4, #0
	movs r2, #0x8c
	bl ov14_021F0234
	pop {r4, pc}
	nop
_021F2974: .4byte 0x000088C8
_021F2978: .4byte ov14_021EA674
	thumb_func_end ov14_021F2930

	thumb_func_start ov14_021F297C
ov14_021F297C: @ 0x021F297C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r4, #0x34]
	bl ov14_021F2AC8
	ldr r0, [r4, #0x34]
	bl ov14_021F2B88
	adds r0, r4, #0
	bl ov14_021F2BB8
	ldr r0, [r4, #0x34]
	bl ov14_021F4D10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F297C

	thumb_func_start ov14_021F29AC
ov14_021F29AC: @ 0x021F29AC
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F4E68
	adds r0, r4, #0
	bl ov14_021F2C04
	adds r0, r4, #0
	bl ov14_021F2B68
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F29AC

	thumb_func_start ov14_021F29C4
ov14_021F29C4: @ 0x021F29C4
	push {r4, r5, r6, lr}
	movs r6, #0xbf
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021F29CE:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021F29D8
	bl FUN_0200DC18
_021F29D8:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xf
	blo _021F29CE
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F29C4

	thumb_func_start ov14_021F29E4
ov14_021F29E4: @ 0x021F29E4
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	movs r2, #0xbf
	lsls r2, r2, #2
	lsls r4, r1, #2
	adds r5, r0, r2
	ldr r0, [r5, r4]
	movs r1, #0
	bl FUN_0200DCC0
	ldr r0, [r5, r4]
	adds r1, r6, #0
	bl FUN_0200DC4C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F29E4

	thumb_func_start ov14_021F2A04
ov14_021F2A04: @ 0x021F2A04
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r3, _021F2A14 @ =FUN_0200DCA0
	ldr r0, [r1, r0]
	bx r3
	nop
_021F2A14: .4byte FUN_0200DCA0
	thumb_func_end ov14_021F2A04

	thumb_func_start ov14_021F2A18
ov14_021F2A18: @ 0x021F2A18
	push {r3, lr}
	cmp r2, #1
	bne _021F2A30
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200DCE8
	pop {r3, pc}
_021F2A30:
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F2A18

	thumb_func_start ov14_021F2A44
ov14_021F2A44: @ 0x021F2A44
	push {r3, lr}
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0200DCFC
	cmp r0, #1
	bne _021F2A5C
	movs r0, #1
	pop {r3, pc}
_021F2A5C:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov14_021F2A44

	thumb_func_start ov14_021F2A60
ov14_021F2A60: @ 0x021F2A60
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r3, _021F2A70 @ =FUN_0200DD54
	adds r1, r2, #0
	bx r3
	.align 2, 0
_021F2A70: .4byte FUN_0200DD54
	thumb_func_end ov14_021F2A60

	thumb_func_start ov14_021F2A74
ov14_021F2A74: @ 0x021F2A74
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F2A98 @ =0x000088D2
	movs r3, #1
	strh r3, [r4, r0]
	lsls r0, r1, #2
	adds r1, r4, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r2, #0
	bl FUN_0200DD68
	ldr r0, _021F2A98 @ =0x000088D2
	movs r1, #0
	strh r1, [r4, r0]
	pop {r4, pc}
	nop
_021F2A98: .4byte 0x000088D2
	thumb_func_end ov14_021F2A74

	thumb_func_start ov14_021F2A9C
ov14_021F2A9C: @ 0x021F2A9C
	push {r3, lr}
	cmp r2, #1
	bne _021F2AB4
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200E0FC
	pop {r3, pc}
_021F2AB4:
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200E0FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F2A9C

	thumb_func_start ov14_021F2AC8
ov14_021F2AC8: @ 0x021F2AC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021F2B5C @ =0x021F80D4
	add r2, sp, #0x34
	adds r4, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0xa
	bl FUN_0200CF18
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0200CF38
	movs r7, #0xbe
	lsls r7, r7, #2
	add r2, sp, #0x14
	ldr r3, _021F2B60 @ =0x021F80EC
	str r0, [r4, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r5, _021F2B64 @ =0x021F80A8
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
	movs r2, #0x67
	bl FUN_0200CFF4
	subs r1, r7, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl FUN_0200D3F8
	subs r0, r7, #4
	ldr r0, [r4, r0]
	bl FUN_0200CF6C
	movs r2, #2
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F2B5C: .4byte 0x021F80D4
_021F2B60: .4byte 0x021F80EC
_021F2B64: .4byte 0x021F80A8
	thumb_func_end ov14_021F2AC8

	thumb_func_start ov14_021F2B68
ov14_021F2B68: @ 0x021F2B68
	push {r4, lr}
	movs r1, #0xbd
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D998
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200D108
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2B68

	thumb_func_start ov14_021F2B88
ov14_021F2B88: @ 0x021F2B88
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F41E4
	adds r0, r4, #0
	bl ov14_021F42EC
	adds r0, r4, #0
	bl ov14_021F2C84
	adds r0, r4, #0
	bl ov14_021F3DE8
	adds r0, r4, #0
	bl ov14_021F3714
	adds r0, r4, #0
	bl ov14_021F34EC
	adds r0, r4, #0
	bl ov14_021F3C08
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F2B88

	thumb_func_start ov14_021F2BB8
ov14_021F2BB8: @ 0x021F2BB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov14_021F4278
	ldr r0, [r4, #0x34]
	bl ov14_021F4380
	ldr r0, [r4, #0x34]
	bl ov14_021F2D1C
	ldr r0, [r4, #0x34]
	bl ov14_021F3E70
	ldr r0, [r4, #0x34]
	bl ov14_021F37F4
	adds r0, r4, #0
	bl ov14_021F35BC
	ldr r0, [r4, #0x34]
	bl ov14_021F3CB4
	pop {r4, pc}
	thumb_func_end ov14_021F2BB8

	thumb_func_start ov14_021F2BE8
ov14_021F2BE8: @ 0x021F2BE8
	push {r3, r4, r5, lr}
	lsls r5, r1, #2
	movs r1, #0xbf
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _021F2C00
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r4, r5]
_021F2C00:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F2BE8

	thumb_func_start ov14_021F2C04
ov14_021F2C04: @ 0x021F2C04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021F2C0A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F2BE8
	adds r4, r4, #1
	cmp r4, #0x45
	blo _021F2C0A
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F2C04

	thumb_func_start ov14_021F2C1C
ov14_021F2C1C: @ 0x021F2C1C
	push {r4, r5, r6, lr}
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r5, r2, #0
	ldr r0, [r0]
	adds r4, r3, #0
	bl FUN_02024B1C
	movs r1, #1
	blx FUN_020B802C
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	blx DC_FlushRange
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	blx FUN_020CFE74
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F2C1C

	thumb_func_start ov14_021F2C50
ov14_021F2C50: @ 0x021F2C50
	push {r4, r5, r6, lr}
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r5, r2, #0
	ldr r0, [r0]
	adds r4, r3, #0
	bl FUN_02024B1C
	movs r1, #2
	blx FUN_020B802C
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	blx DC_FlushRange
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	blx FUN_020CFECC
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F2C50

	thumb_func_start ov14_021F2C84
ov14_021F2C84: @ 0x021F2C84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r7, #0xbe
	adds r5, r0, #0
	movs r4, #0
	movs r6, #1
	lsls r7, r7, #2
_021F2C92:
	ldr r0, _021F2D18 @ =0x0000C0F9
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r7]
	movs r2, #0x13
	movs r3, #0x4e
	bl FUN_0200D4A4
	adds r4, r4, #1
	cmp r4, #0x24
	blo _021F2C92
	bl FUN_02074490
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021F2D18 @ =0x0000C0F9
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x14
	bl FUN_0200D564
	bl FUN_0207449C
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021F2D18 @ =0x0000C0F9
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x14
	bl FUN_0200D6D4
	bl FUN_020744A8
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021F2D18 @ =0x0000C0F9
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x14
	bl FUN_0200D704
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F2D18: .4byte 0x0000C0F9
	thumb_func_end ov14_021F2C84

	thumb_func_start ov14_021F2D1C
ov14_021F2D1C: @ 0x021F2D1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	adds r5, r0, #0
	movs r4, #0
	ldr r3, _021F2DB8 @ =0x021F810C
	str r4, [sp]
	adds r7, r5, #0
	add r2, sp, #4
	movs r6, #6
_021F2D2E:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, r6, #1
	bne _021F2D2E
	ldr r0, [r3]
	str r0, [r2]
_021F2D3A:
	add r6, sp, #4
	add r3, sp, #0x38
	movs r2, #6
_021F2D40:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021F2D40
	ldr r0, [r6]
	movs r1, #6
	str r0, [r3]
	adds r0, r4, #0
	blx FUN_020F2BA4
	movs r3, #0x18
	add r0, sp, #4
	movs r2, #0x34
	ldrsh r2, [r0, r2]
	muls r3, r1, r3
	adds r1, r2, r3
	strh r1, [r0, #0x34]
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2BA4
	movs r3, #0x18
	add r1, sp, #4
	movs r2, #0x36
	ldrsh r2, [r1, r2]
	muls r3, r0, r3
	adds r0, r2, r3
	strh r0, [r1, #0x36]
	ldr r0, [sp]
	movs r1, #0x74
	subs r0, r1, r0
	str r0, [sp, #0x40]
	ldr r0, _021F2DBC @ =0x0000C0F9
	movs r1, #0xbd
	adds r0, r4, r0
	lsls r1, r1, #2
	str r0, [sp, #0x4c]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0x38
	bl FUN_0200D734
	movs r1, #0x36
	lsls r1, r1, #4
	str r0, [r7, r1]
	adds r2, r4, #0
	adds r1, r5, r4
	ldr r0, _021F2DC0 @ =0x00004094
	adds r2, #0x19
	strb r2, [r1, r0]
	ldr r0, [sp]
	adds r4, r4, #1
	adds r0, r0, #2
	adds r7, r7, #4
	str r0, [sp]
	cmp r4, #0x24
	blo _021F2D3A
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F2DB8: .4byte 0x021F810C
_021F2DBC: .4byte 0x0000C0F9
_021F2DC0: .4byte 0x00004094
	thumb_func_end ov14_021F2D1C

	thumb_func_start ov14_021F2DC4
ov14_021F2DC4: @ 0x021F2DC4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r4, r2, #0
	bl FUN_02074170
	adds r1, r0, #0
	movs r0, #0xa
	str r0, [sp]
	ldr r0, _021F2DE4 @ =0x00000454
	movs r2, #0
	ldr r0, [r5, r0]
	adds r3, r4, #0
	bl FUN_02007C10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F2DE4: .4byte 0x00000454
	thumb_func_end ov14_021F2DC4

	thumb_func_start ov14_021F2DE8
ov14_021F2DE8: @ 0x021F2DE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r4, #0
	adds r5, r0, #0
	str r1, [sp, #4]
	adds r6, r4, #0
_021F2DF4:
	movs r0, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [sp, #4]
	adds r2, r4, #0
	movs r3, #0xac
	bl FUN_02074014
	cmp r0, #0
	bne _021F2E10
	ldr r0, [r5, #0x34]
	movs r1, #0
	adds r2, r0, r4
	b _021F2E56
_021F2E10:
	ldr r1, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021E60C0
	adds r7, r0, #0
	ldr r0, [r5, #0x34]
	adds r1, r7, #0
	add r2, sp, #0xc
	bl ov14_021F2DC4
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r2, [r5, #0x34]
	ldr r1, _021F2E6C @ =0x00000458
	ldr r0, [r0, #0x14]
	adds r1, r2, r1
	movs r2, #2
	adds r1, r1, r6
	lsls r2, r2, #8
	blx FUN_020D4808
	ldr r0, [sp, #8]
	bl FUN_0201AB0C
	adds r0, r7, #0
	bl FUN_02074444
	ldr r1, [r5, #0x34]
	adds r2, r1, r4
	ldr r1, _021F2E70 @ =0x00004076
	strb r0, [r2, r1]
	ldr r0, [r5, #0x34]
	movs r1, #1
	adds r2, r0, r4
_021F2E56:
	ldr r0, _021F2E74 @ =0x00004058
	adds r4, r4, #1
	strb r1, [r2, r0]
	movs r0, #2
	lsls r0, r0, #8
	adds r6, r6, r0
	cmp r4, #0x1e
	blo _021F2DF4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2E6C: .4byte 0x00000458
_021F2E70: .4byte 0x00004076
_021F2E74: .4byte 0x00004058
	thumb_func_end ov14_021F2DE8

	thumb_func_start ov14_021F2E78
ov14_021F2E78: @ 0x021F2E78
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r3, #0
	movs r3, #2
	adds r7, r1, #0
	adds r4, r2, #0
	adds r1, r4, #0
	adds r2, r7, #0
	lsls r3, r3, #8
	adds r5, r0, #0
	bl ov14_021F2C1C
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r6, #3
	bl FUN_0200DD10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021F2E78

	thumb_func_start ov14_021F2EA0
ov14_021F2EA0: @ 0x021F2EA0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r6, r2, #0
	adds r4, r1, #0
	add r2, sp, #0
	bl ov14_021F2DC4
	adds r7, r0, #0
	adds r0, r4, #0
	bl FUN_02074444
	ldr r1, [sp]
	adds r3, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, [r1, #0x14]
	adds r2, r6, #0
	bl ov14_021F2E78
	adds r0, r7, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021F2EA0

	thumb_func_start ov14_021F2ED0
ov14_021F2ED0: @ 0x021F2ED0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	str r1, [sp]
	movs r0, #0xbf
	adds r4, r3, #0
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	adds r6, r1, r0
	lsls r7, r4, #2
	ldr r0, [r6, r7]
	str r2, [sp, #4]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r1, [sp, #4]
	adds r0, r5, #0
	movs r2, #0xac
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	beq _021F2F1A
	ldr r1, [sp]
	ldr r2, [sp, #4]
	adds r0, r5, #0
	bl ov14_021E60C0
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov14_021F2EA0
	ldr r0, [r6, r7]
	movs r1, #1
	bl FUN_0200DCE8
_021F2F1A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021F2ED0

	thumb_func_start ov14_021F2F20
ov14_021F2F20: @ 0x021F2F20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021F2F26:
	ldrb r1, [r5, #0x1f]
	adds r3, r4, #0
	adds r0, r5, #0
	adds r2, r4, #0
	adds r3, #0x19
	bl ov14_021F2ED0
	adds r4, r4, #1
	cmp r4, #0x1e
	blo _021F2F26
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F2F20

	thumb_func_start ov14_021F2F3C
ov14_021F2F3C: @ 0x021F2F3C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02074640
	adds r6, r0, #0
	ldr r4, _021F2F80 @ =0x00000000
	beq _021F2F7C
	ldr r7, _021F2F84 @ =0x000040B2
_021F2F4E:
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02074644
	bl FUN_02070DB0
	ldr r2, [r5, #0x34]
	adds r1, r0, #0
	adds r3, r2, r4
	ldr r2, _021F2F84 @ =0x000040B2
	adds r0, r5, #0
	ldrb r2, [r3, r2]
	bl ov14_021F2EA0
	ldr r0, [r5, #0x34]
	movs r2, #0
	adds r1, r0, r4
	ldrb r1, [r1, r7]
	bl ov14_021F2A18
	adds r4, r4, #1
	cmp r4, r6
	blo _021F2F4E
_021F2F7C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F2F80: .4byte 0x00000000
_021F2F84: .4byte 0x000040B2
	thumb_func_end ov14_021F2F3C

	thumb_func_start ov14_021F2F88
ov14_021F2F88: @ 0x021F2F88
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0x1e
	bhs _021F2FB4
	movs r1, #6
	blx FUN_020F2BA4
	adds r1, r1, #1
	movs r0, #0x18
	muls r0, r1, r0
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #6
	blx FUN_020F2BA4
	movs r1, #0x18
	muls r1, r0, r1
	adds r1, #0x30
	strh r1, [r6]
	pop {r4, r5, r6, pc}
_021F2FB4:
	subs r5, #0x1e
	ldr r0, _021F2FD4 @ =0x021F80BC
	lsls r1, r5, #2
	ldrsh r0, [r0, r1]
	strh r0, [r4]
	ldr r0, _021F2FD8 @ =0x021F80BE
	ldrsh r0, [r0, r1]
	subs r0, #0x90
	strh r0, [r6]
	cmp r3, #2
	bne _021F2FD2
	movs r0, #0
	ldrsh r0, [r4, r0]
	adds r0, #0x98
	strh r0, [r4]
_021F2FD2:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F2FD4: .4byte 0x021F80BC
_021F2FD8: .4byte 0x021F80BE
	thumb_func_end ov14_021F2F88

	thumb_func_start ov14_021F2FDC
ov14_021F2FDC: @ 0x021F2FDC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02074640
	ldr r6, _021F303C @ =0x021F80BC
	str r0, [sp]
	movs r4, #0
_021F2FEC:
	ldr r0, [r5, #0x34]
	ldr r1, _021F3040 @ =0x000040B2
	adds r2, r0, r4
	ldrb r7, [r2, r1]
	movs r2, #2
	ldrsh r2, [r6, r2]
	lsls r1, r7, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	ldrsh r1, [r6, r1]
	bl FUN_0200DDB8
	adds r1, r4, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x1e
	movs r2, #1
	bl ov14_021F3190
	ldr r0, [sp]
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bhs _021F3028
	adds r1, r7, #0
	movs r2, #1
	bl ov14_021F2A18
	b _021F3030
_021F3028:
	adds r1, r7, #0
	movs r2, #0
	bl ov14_021F2A18
_021F3030:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #6
	blo _021F2FEC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F303C: .4byte 0x021F80BC
_021F3040: .4byte 0x000040B2
	thumb_func_end ov14_021F2FDC

	thumb_func_start ov14_021F3044
ov14_021F3044: @ 0x021F3044
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02074640
	ldr r6, _021F30A8 @ =0x021F80BC
	str r0, [sp]
	movs r4, #0
_021F3054:
	ldr r0, [r5, #0x34]
	ldr r1, _021F30AC @ =0x000040B2
	adds r2, r0, r4
	ldrb r7, [r2, r1]
	movs r2, #2
	ldrsh r2, [r6, r2]
	lsls r1, r7, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	ldrsh r1, [r6, r1]
	adds r1, #0x98
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	adds r1, r4, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x1e
	movs r2, #1
	bl ov14_021F3190
	ldr r0, [sp]
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bhs _021F3096
	adds r1, r7, #0
	movs r2, #1
	bl ov14_021F2A18
	b _021F309E
_021F3096:
	adds r1, r7, #0
	movs r2, #0
	bl ov14_021F2A18
_021F309E:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #6
	blo _021F3054
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F30A8: .4byte 0x021F80BC
_021F30AC: .4byte 0x000040B2
	thumb_func_end ov14_021F3044

	thumb_func_start ov14_021F30B0
ov14_021F30B0: @ 0x021F30B0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02074640
	ldr r6, _021F3114 @ =0x021F80BC
	str r0, [sp]
	movs r4, #0
_021F30C0:
	ldr r0, [r5, #0x34]
	ldr r1, _021F3118 @ =0x000040B2
	adds r2, r0, r4
	ldrb r7, [r2, r1]
	movs r2, #2
	ldrsh r2, [r6, r2]
	lsls r1, r7, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	subs r2, #0x90
	lsls r2, r2, #0x10
	ldrsh r1, [r6, r1]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r1, r4, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x1e
	movs r2, #1
	bl ov14_021F3190
	ldr r0, [sp]
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bhs _021F3102
	adds r1, r7, #0
	movs r2, #1
	bl ov14_021F2A18
	b _021F310A
_021F3102:
	adds r1, r7, #0
	movs r2, #0
	bl ov14_021F2A18
_021F310A:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #6
	blo _021F30C0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F3114: .4byte 0x021F80BC
_021F3118: .4byte 0x000040B2
	thumb_func_end ov14_021F30B0

	thumb_func_start ov14_021F311C
ov14_021F311C: @ 0x021F311C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl FUN_02074640
	ldr r6, _021F3188 @ =0x021F80BC
	str r0, [sp]
	movs r4, #0
_021F312C:
	ldr r0, [r5, #0x34]
	ldr r1, _021F318C @ =0x000040B2
	adds r2, r0, r4
	ldrb r7, [r2, r1]
	movs r2, #2
	ldrsh r2, [r6, r2]
	lsls r1, r7, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	ldrsh r1, [r6, r1]
	subs r2, #0x90
	lsls r2, r2, #0x10
	adds r1, #0x98
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r1, r4, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x1e
	movs r2, #1
	bl ov14_021F3190
	ldr r0, [sp]
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bhs _021F3174
	adds r1, r7, #0
	movs r2, #1
	bl ov14_021F2A18
	b _021F317C
_021F3174:
	adds r1, r7, #0
	movs r2, #0
	bl ov14_021F2A18
_021F317C:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #6
	blo _021F312C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3188: .4byte 0x021F80BC
_021F318C: .4byte 0x000040B2
	thumb_func_end ov14_021F311C

	thumb_func_start ov14_021F3190
ov14_021F3190: @ 0x021F3190
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r3, r5, r6
	ldr r1, _021F31DC @ =0x00004094
	cmp r2, #0
	ldrb r4, [r3, r1]
	bne _021F31B4
	adds r1, r4, #0
	movs r2, #0
	bl ov14_021F2A60
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x14
	bl ov14_021F2A74
	pop {r4, r5, r6, pc}
_021F31B4:
	cmp r6, #0x1e
	bhs _021F31C2
	adds r1, r4, #0
	movs r2, #3
	bl ov14_021F2A60
	b _021F31CA
_021F31C2:
	adds r1, r4, #0
	movs r2, #1
	bl ov14_021F2A60
_021F31CA:
	lsls r3, r6, #1
	movs r2, #0x74
	adds r0, r5, #0
	adds r1, r4, #0
	subs r2, r2, r3
	bl ov14_021F2A74
	pop {r4, r5, r6, pc}
	nop
_021F31DC: .4byte 0x00004094
	thumb_func_end ov14_021F3190

	thumb_func_start ov14_021F31E0
ov14_021F31E0: @ 0x021F31E0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r3, r4, r1
	ldr r1, _021F320C @ =0x00004094
	cmp r2, #0x1e
	ldrb r5, [r3, r1]
	bhs _021F31F8
	adds r1, r5, #0
	movs r2, #3
	bl ov14_021F2A60
	b _021F3200
_021F31F8:
	adds r1, r5, #0
	movs r2, #1
	bl ov14_021F2A60
_021F3200:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x14
	bl ov14_021F2A74
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F320C: .4byte 0x00004094
	thumb_func_end ov14_021F31E0

	thumb_func_start ov14_021F3210
ov14_021F3210: @ 0x021F3210
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp]
	cmp r1, #0
	blt _021F3228
	movs r0, #0xb0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	subs r0, #0xb8
	str r0, [sp, #0xc]
	b _021F3232
_021F3228:
	movs r0, #7
	mvns r0, r0
	str r0, [sp, #8]
	movs r0, #0xb0
	str r0, [sp, #0xc]
_021F3232:
	movs r4, #0
	add r7, sp, #0x14
_021F3236:
	ldr r0, [r5, #0x34]
	ldr r1, _021F32D0 @ =0x00004094
	adds r2, r0, r4
	ldrb r1, [r2, r1]
	add r2, sp, #0x14
	str r1, [sp, #4]
	lsls r1, r1, #2
	str r1, [sp, #0x10]
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0x14
	adds r1, #2
	bl FUN_0200DE44
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [sp]
	adds r0, r1, r0
	strh r0, [r7, #2]
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [sp, #8]
	cmp r1, r0
	bne _021F32AA
	ldr r0, [sp, #0xc]
	ldr r1, _021F32D4 @ =0x00000458
	strh r0, [r7, #2]
	ldr r0, [r5, #0x34]
	ldr r3, _021F32D8 @ =0x00004076
	adds r6, r0, r4
	adds r2, r0, r1
	lsls r1, r4, #9
	adds r1, r2, r1
	ldrb r3, [r6, r3]
	ldr r2, [sp, #4]
	bl ov14_021F2E78
	ldr r1, [r5, #0x34]
	ldr r0, [sp, #0x10]
	adds r2, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	adds r2, r1, r4
	ldr r1, _021F32DC @ =0x00004058
	ldrb r1, [r2, r1]
	bl FUN_0200DCE8
	ldr r0, [r5]
	ldr r0, [r0, #8]
	cmp r0, #3
	bne _021F32AA
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F34DC
_021F32AA:
	ldr r1, [r5, #0x34]
	ldr r0, [sp, #0x10]
	movs r2, #0
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	bl FUN_0200DDB8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x1e
	blo _021F3236
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F32D0: .4byte 0x00004094
_021F32D4: .4byte 0x00000458
_021F32D8: .4byte 0x00004076
_021F32DC: .4byte 0x00004058
	thumb_func_end ov14_021F3210

	thumb_func_start ov14_021F32E0
ov14_021F32E0: @ 0x021F32E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r2, sp, #4
	movs r1, #1
	adds r2, #1
	add r3, sp, #4
	bl FUN_02019B1C
	movs r4, #0
	add r1, sp, #4
	ldrsb r0, [r1, r4]
	lsls r0, r0, #0x13
	asrs r7, r0, #0x10
	movs r0, #1
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x13
	asrs r5, r0, #0x10
_021F330C:
	ldr r0, _021F334C @ =0x021F808C
	lsls r1, r4, #1
	adds r2, r0, r1
	ldr r0, [sp]
	ldrb r2, [r2, #1]
	ldr r6, [r0, #0x34]
	ldr r0, _021F3350 @ =0x000040B2
	adds r3, r6, r4
	ldrb r0, [r3, r0]
	adds r2, r7, r2
	lsls r2, r2, #0x10
	lsls r0, r0, #2
	adds r3, r6, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r3, r0]
	ldr r3, _021F334C @ =0x021F808C
	asrs r2, r2, #0x10
	ldrb r1, [r3, r1]
	adds r1, r5, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #6
	blo _021F330C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F334C: .4byte 0x021F808C
_021F3350: .4byte 0x000040B2
	thumb_func_end ov14_021F32E0

	thumb_func_start ov14_021F3354
ov14_021F3354: @ 0x021F3354
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xfe
	lsls r0, r0, #0x16
	str r0, [r4, #8]
	movs r0, #0
	strb r0, [r4, #7]
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0200DF98
	ldr r1, [r4, #8]
	ldr r0, [r4]
	adds r2, r1, #0
	bl FUN_0200E024
	ldr r0, [r4]
	movs r1, #0
	movs r2, #8
	bl FUN_0200E0CC
	pop {r4, pc}
	thumb_func_end ov14_021F3354

	thumb_func_start ov14_021F3380
ov14_021F3380: @ 0x021F3380
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #7]
	ldr r1, _021F33AC @ =0x3CCCCCCD
	adds r0, r0, #1
	strb r0, [r4, #7]
	ldr r0, [r4, #8]
	blx FUN_020F24C8
	str r0, [r4, #8]
	ldrb r0, [r4, #7]
	cmp r0, #0x28
	bne _021F339E
	movs r0, #0
	pop {r4, pc}
_021F339E:
	ldr r1, [r4, #8]
	ldr r0, [r4]
	adds r2, r1, #0
	bl FUN_0200E024
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021F33AC: .4byte 0x3CCCCCCD
	thumb_func_end ov14_021F3380

	thumb_func_start ov14_021F33B0
ov14_021F33B0: @ 0x021F33B0
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #7]
	ldr r1, _021F33E4 @ =0x3CCCCCCD
	subs r0, r0, #2
	strb r0, [r4, #7]
	ldr r0, [r4, #8]
	blx FUN_020F1520
	ldr r1, _021F33E4 @ =0x3CCCCCCD
	str r0, [r4, #8]
	blx FUN_020F1520
	str r0, [r4, #8]
	ldrb r0, [r4, #7]
	cmp r0, #0
	bne _021F33D6
	movs r0, #0
	pop {r4, pc}
_021F33D6:
	ldr r1, [r4, #8]
	ldr r0, [r4]
	adds r2, r1, #0
	bl FUN_0200E024
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021F33E4: .4byte 0x3CCCCCCD
	thumb_func_end ov14_021F33B0

	thumb_func_start ov14_021F33E8
ov14_021F33E8: @ 0x021F33E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r4, #0
	bl ov14_021F33FC
	pop {r4, pc}
	thumb_func_end ov14_021F33E8

	thumb_func_start ov14_021F33FC
ov14_021F33FC: @ 0x021F33FC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	ldr r0, [r4]
	adds r2, r1, #0
	bl FUN_0200E0CC
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r4]
	adds r2, r1, #0
	bl FUN_0200E024
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0200DF98
	pop {r4, pc}
	thumb_func_end ov14_021F33FC

	thumb_func_start ov14_021F3420
ov14_021F3420: @ 0x021F3420
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [sp, #0x18]
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r0, #1
	bne _021F3468
	cmp r4, r6
	bhs _021F3480
	ldr r7, _021F3484 @ =0x00004094
_021F3436:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	movs r3, #0
	bl ov14_021E6070
	cmp r0, #0
	ldr r0, [r5, #0x34]
	bne _021F3454
	adds r1, r0, r4
	ldrb r1, [r1, r7]
	movs r2, #1
	bl ov14_021F2A9C
	b _021F3460
_021F3454:
	ldr r1, _021F3484 @ =0x00004094
	adds r2, r0, r4
	ldrb r1, [r2, r1]
	movs r2, #0
	bl ov14_021F2A9C
_021F3460:
	adds r4, r4, #1
	cmp r4, r6
	blo _021F3436
	pop {r3, r4, r5, r6, r7, pc}
_021F3468:
	cmp r4, r6
	bhs _021F3480
_021F346C:
	ldr r0, [r5, #0x34]
	ldr r1, _021F3484 @ =0x00004094
	adds r2, r0, r4
	ldrb r1, [r2, r1]
	adds r2, r7, #0
	bl ov14_021F2A9C
	adds r4, r4, #1
	cmp r4, r6
	blo _021F346C
_021F3480:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3484: .4byte 0x00004094
	thumb_func_end ov14_021F3420

	thumb_func_start ov14_021F3488
ov14_021F3488: @ 0x021F3488
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	movs r0, #0x80
	adds r7, r2, #0
	tst r0, r5
	beq _021F349A
	movs r4, #1
	b _021F349C
_021F349A:
	movs r4, #0
_021F349C:
	movs r0, #1
	tst r0, r5
	beq _021F34B0
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #0x1e
	str r4, [sp]
	bl ov14_021F3420
_021F34B0:
	movs r0, #2
	tst r0, r5
	beq _021F34C4
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x1e
	movs r3, #0x24
	str r4, [sp]
	bl ov14_021F3420
_021F34C4:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021F3488

	thumb_func_start ov14_021F34C8
ov14_021F34C8: @ 0x021F34C8
	adds r3, r0, r1
	ldr r1, _021F34D4 @ =0x00004094
	ldrb r1, [r3, r1]
	ldr r3, _021F34D8 @ =ov14_021F2A9C
	bx r3
	nop
_021F34D4: .4byte 0x00004094
_021F34D8: .4byte ov14_021F2A9C
	thumb_func_end ov14_021F34C8

	thumb_func_start ov14_021F34DC
ov14_021F34DC: @ 0x021F34DC
	push {r3, lr}
	adds r2, r1, #0
	movs r1, #1
	adds r3, r2, #1
	str r1, [sp]
	bl ov14_021F3420
	pop {r3, pc}
	thumb_func_end ov14_021F34DC

	thumb_func_start ov14_021F34EC
ov14_021F34EC: @ 0x021F34EC
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021F35AC @ =0x0000C11D
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #0x4c
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021F35B0 @ =0x0000C11E
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #0x4c
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021F35B4 @ =0x0000C0FA
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #0x4b
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021F35B8 @ =0x0000C0FB
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #0x4b
	bl FUN_0200D564
	movs r0, #0
	str r0, [sp]
	ldr r0, _021F35B4 @ =0x0000C0FA
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #0x4d
	bl FUN_0200D6D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021F35B4 @ =0x0000C0FA
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #0x4e
	bl FUN_0200D704
	add sp, #0x10
	pop {r4, pc}
	nop
_021F35AC: .4byte 0x0000C11D
_021F35B0: .4byte 0x0000C11E
_021F35B4: .4byte 0x0000C0FA
_021F35B8: .4byte 0x0000C0FB
	thumb_func_end ov14_021F34EC

	thumb_func_start ov14_021F35BC
ov14_021F35BC: @ 0x021F35BC
	push {r4, lr}
	movs r1, #0xbd
	ldr r4, [r0, #0x34]
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	movs r3, #2
	ldr r1, [r4, r1]
	ldr r2, _021F360C @ =0x021F8210
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0xc1
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x10
	subs r1, #0xc
	movs r3, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3610 @ =0x021F8244
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0xc2
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xc2
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r4, pc}
	.align 2, 0
_021F360C: .4byte 0x021F8210
_021F3610: .4byte 0x021F8244
	thumb_func_end ov14_021F35BC

	thumb_func_start ov14_021F3614
ov14_021F3614: @ 0x021F3614
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r3, _021F36D4 @ =0x021F8098
	adds r7, r2, #0
	add r2, sp, #0x14
	adds r6, r0, #0
	adds r4, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r1, #0x32
	movs r0, #0xa
	lsls r1, r1, #6
	bl FUN_0201AACC
	adds r5, r0, #0
	ldr r1, [r4]
	add r0, sp, #0x24
	movs r2, #2
	movs r3, #0
	bl FUN_0207013C
	ldrb r0, [r4, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _021F3658
	ldrh r1, [r4, #4]
	ldr r0, _021F36D8 @ =0x00000147
	cmp r1, r0
	bne _021F3658
	adds r0, #0xa7
	b _021F365A
_021F3658:
	ldrh r0, [r4, #4]
_021F365A:
	str r5, [sp]
	ldr r1, [r4, #8]
	movs r2, #0xa
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	add r1, sp, #0x14
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x12]
	add r3, sp, #0x14
	bl FUN_02014510
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r4, r6, r0
	lsls r6, r7, #2
	ldr r0, [r4, r6]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #2
	blx FUN_020B802C
	movs r1, #0x32
	adds r7, r0, #0
	adds r0, r5, #0
	lsls r1, r1, #6
	blx DC_FlushRange
	movs r2, #0x32
	adds r0, r5, #0
	adds r1, r7, #0
	lsls r2, r2, #6
	blx FUN_020CFECC
	ldr r0, [r4, r6]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #2
	blx FUN_020B8078
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	add r1, sp, #0x14
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x14]
	movs r2, #5
	bl FUN_02007938
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F36D4: .4byte 0x021F8098
_021F36D8: .4byte 0x00000147
	thumb_func_end ov14_021F3614

	thumb_func_start ov14_021F36DC
ov14_021F36DC: @ 0x021F36DC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [r5, #0x34]
	ldr r2, _021F3710 @ =0x000088D0
	ldrh r2, [r0, r2]
	adds r4, r4, r2
	adds r2, r4, #0
	bl ov14_021F3614
	ldr r1, [r5, #0x34]
	lsls r0, r4, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r3, [r5, #0x34]
	ldr r1, _021F3710 @ =0x000088D0
	movs r0, #1
	ldrh r2, [r3, r1]
	eors r0, r2
	strh r0, [r3, r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F3710: .4byte 0x000088D0
	thumb_func_end ov14_021F36DC

	thumb_func_start ov14_021F3714
ov14_021F3714: @ 0x021F3714
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F37E0 @ =0x0000C11F
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x4f
	bl FUN_0200D4A4
	movs r0, #0
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021F37E4 @ =0x0000C0FC
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x12
	bl FUN_0200D564
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021F37E8 @ =0x0000C120
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x4f
	bl FUN_0200D4A4
	movs r0, #0
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021F37EC @ =0x0000C0FD
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x12
	bl FUN_0200D564
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F37F0 @ =0x0000C0FB
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x50
	bl FUN_0200D6D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F37F0 @ =0x0000C0FB
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x51
	bl FUN_0200D704
	add sp, #0x10
	pop {r4, pc}
	nop
_021F37E0: .4byte 0x0000C11F
_021F37E4: .4byte 0x0000C0FC
_021F37E8: .4byte 0x0000C120
_021F37EC: .4byte 0x0000C0FD
_021F37F0: .4byte 0x0000C0FB
	thumb_func_end ov14_021F3714

	thumb_func_start ov14_021F37F4
ov14_021F37F4: @ 0x021F37F4
	push {r4, lr}
	movs r1, #0xbd
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _021F383C @ =0x021F83E4
	bl FUN_0200D734
	movs r1, #0xca
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_0200DCE8
	movs r1, #0xbd
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	movs r3, #2
	ldr r1, [r4, r1]
	ldr r2, _021F3840 @ =0x021F8418
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0xcb
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r4, pc}
	nop
_021F383C: .4byte 0x021F83E4
_021F3840: .4byte 0x021F8418
	thumb_func_end ov14_021F37F4

	thumb_func_start ov14_021F3844
ov14_021F3844: @ 0x021F3844
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02077C18
	adds r1, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x12
	movs r2, #0
	add r3, sp, #8
	bl FUN_020079BC
	ldr r2, [sp, #8]
	movs r3, #2
	adds r4, r0, #0
	ldr r2, [r2, #0x14]
	adds r0, r5, #0
	movs r1, #0xb
	lsls r3, r3, #8
	bl ov14_021F2C1C
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl FUN_02077C18
	adds r1, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #0x12
	movs r2, #1
	adds r3, r4, #0
	bl FUN_02007938
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov14_021F3844

	thumb_func_start ov14_021F38B0
ov14_021F38B0: @ 0x021F38B0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02077C18
	adds r1, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x12
	movs r2, #0
	add r3, sp, #8
	bl FUN_020079BC
	ldr r2, [sp, #8]
	movs r3, #2
	adds r4, r0, #0
	ldr r2, [r2, #0x14]
	adds r0, r5, #0
	movs r1, #0xc
	lsls r3, r3, #8
	bl ov14_021F2C50
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #2
	blx FUN_020B8078
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl FUN_02077C18
	adds r1, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	movs r0, #0x12
	movs r2, #5
	adds r3, r4, #0
	bl FUN_02007938
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov14_021F38B0

	thumb_func_start ov14_021F391C
ov14_021F391C: @ 0x021F391C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #1
	bne _021F3940
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DF98
	movs r0, #0xca
	lsls r0, r0, #2
	movs r1, #0xc
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl FUN_0200E0CC
	pop {r4, pc}
_021F3940:
	movs r0, #0xca
	lsls r0, r0, #2
	movs r1, #0
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl FUN_0200E0CC
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DF98
	pop {r4, pc}
	thumb_func_end ov14_021F391C

	thumb_func_start ov14_021F395C
ov14_021F395C: @ 0x021F395C
	movs r3, #0xca
	lsls r3, r3, #2
	ldr r0, [r0, r3]
	ldr r3, _021F3968 @ =FUN_0200DDB8
	bx r3
	nop
_021F3968: .4byte FUN_0200DDB8
	thumb_func_end ov14_021F395C

	thumb_func_start ov14_021F396C
ov14_021F396C: @ 0x021F396C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	add r1, sp, #0
	adds r3, r2, #0
	adds r1, #2
	add r2, sp, #0
	bl ov14_021F2F88
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r4, #0
	adds r1, #8
	adds r2, #8
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl ov14_021F395C
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov14_021F396C

	thumb_func_start ov14_021F39A0
ov14_021F39A0: @ 0x021F39A0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r0, r1, #0
	add r1, sp, #0
	adds r3, r2, #0
	adds r1, #2
	add r2, sp, #0
	bl ov14_021F2F88
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	movs r1, #2
	ldrsh r1, [r3, r1]
	adds r2, r2, #4
	lsls r2, r2, #0x10
	adds r0, r4, #0
	asrs r2, r2, #0x10
	bl ov14_021F395C
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F39A0

	thumb_func_start ov14_021F39D0
ov14_021F39D0: @ 0x021F39D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r5, r0, #0
	ldr r0, _021F3B24 @ =0x000088C8
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _021F39E0
	b _021F3B1E
_021F39E0:
	movs r0, #0xca
	lsls r0, r0, #2
	add r1, sp, #0x10
	ldr r0, [r5, r0]
	adds r1, #2
	add r2, sp, #0x10
	bl FUN_0200DE44
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _021F3AA0
	ldr r4, _021F3B28 @ =0x021F83E4
	add r3, sp, #0x14
	movs r2, #6
_021F3A00:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021F3A00
	ldr r0, [r4]
	str r0, [r3]
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200DD7C
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200DD48
	str r0, [sp, #0x40]
	ldr r0, _021F3B2C @ =0x0000C11F
	movs r1, #1
	str r0, [sp, #0x28]
	ldr r0, _021F3B30 @ =0x000088D2
	ldr r7, _021F3B34 @ =0x021F8070
	strh r1, [r5, r0]
	movs r0, #0
	ldr r6, _021F3B38 @ =0x021F8078
	str r0, [sp, #8]
	adds r4, r5, #0
_021F3A3A:
	add r1, sp, #0x10
	movs r0, #2
	ldrsh r1, [r1, r0]
	movs r0, #0
	ldrsb r0, [r7, r0]
	add r2, sp, #0x14
	adds r1, r1, r0
	add r0, sp, #0x10
	strh r1, [r0, #4]
	adds r1, r0, #0
	movs r0, #0
	ldrsh r1, [r1, r0]
	ldrsb r0, [r6, r0]
	adds r1, r1, r0
	add r0, sp, #0x10
	strh r1, [r0, #6]
	movs r0, #0xbd
	movs r1, #0xbe
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200D734
	movs r1, #0x3f
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r0, [r4, r0]
	movs r1, #8
	bl FUN_0200DD10
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r0, r0, #1
	adds r6, r6, #1
	adds r4, r4, #4
	str r0, [sp, #8]
	cmp r0, #8
	blo _021F3A3A
	ldr r0, _021F3B30 @ =0x000088D2
	movs r1, #0
	add sp, #0x48
	strh r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021F3AA0:
	subs r0, #0xc8
	ldr r0, [r5, r0]
	bl FUN_0200DD7C
	str r0, [sp, #0xc]
	movs r0, #0xca
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_0200DD48
	str r0, [sp, #4]
	movs r0, #0
	ldr r7, _021F3B38 @ =0x021F8078
	ldr r6, _021F3B34 @ =0x021F8070
	str r0, [sp]
	adds r4, r5, #0
_021F3AC0:
	add r2, sp, #0x10
	movs r1, #2
	ldrsh r1, [r2, r1]
	movs r2, #0
	ldrsb r2, [r6, r2]
	add r3, sp, #0x10
	movs r0, #0x3f
	adds r1, r1, r2
	movs r2, #0
	ldrsh r3, [r3, r2]
	ldrsb r2, [r7, r2]
	lsls r0, r0, #4
	lsls r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	ldr r0, [r4, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r1, [sp]
	ldr r2, [sp, #0xc]
	adds r0, r5, #0
	adds r1, #0x3d
	adds r2, r2, #1
	bl ov14_021F2A74
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	bl FUN_0200DD54
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp]
	adds r7, r7, #1
	adds r0, r0, #1
	adds r6, r6, #1
	adds r4, r4, #4
	str r0, [sp]
	cmp r0, #8
	blo _021F3AC0
_021F3B1E:
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3B24: .4byte 0x000088C8
_021F3B28: .4byte 0x021F83E4
_021F3B2C: .4byte 0x0000C11F
_021F3B30: .4byte 0x000088D2
_021F3B34: .4byte 0x021F8070
_021F3B38: .4byte 0x021F8078
	thumb_func_end ov14_021F39D0

	thumb_func_start ov14_021F3B3C
ov14_021F3B3C: @ 0x021F3B3C
	push {r3, r4, r5, r6, r7, lr}
	movs r6, #0x3f
	adds r5, r0, #0
	movs r4, #0
	movs r7, #1
	lsls r6, r6, #4
_021F3B48:
	ldr r0, [r5, r6]
	adds r1, r7, #0
	bl FUN_0200DCE8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blo _021F3B48
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021F3B3C

	thumb_func_start ov14_021F3B5C
ov14_021F3B5C: @ 0x021F3B5C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0xca
	lsls r0, r0, #2
	add r1, sp, #0
	ldr r0, [r5, r0]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021F3BB6
	ldr r6, _021F3BB8 @ =0x021F8078
	ldr r4, _021F3BBC @ =0x021F8070
	movs r7, #0
_021F3B80:
	add r2, sp, #0
	movs r1, #2
	ldrsh r1, [r2, r1]
	movs r2, #0
	ldrsb r2, [r4, r2]
	add r3, sp, #0
	movs r0, #0x3f
	adds r1, r1, r2
	movs r2, #0
	ldrsh r2, [r3, r2]
	movs r3, #0
	ldrsb r3, [r6, r3]
	lsls r0, r0, #4
	lsls r1, r1, #0x10
	adds r2, r2, r3
	lsls r2, r2, #0x10
	ldr r0, [r5, r0]
	asrs r1, r1, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r7, r7, #1
	adds r6, r6, #1
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r7, #8
	blo _021F3B80
_021F3BB6:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F3BB8: .4byte 0x021F8078
_021F3BBC: .4byte 0x021F8070
	thumb_func_end ov14_021F3B5C

	thumb_func_start ov14_021F3BC0
ov14_021F3BC0: @ 0x021F3BC0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x2f
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r4, r0]
	movs r1, #0x10
	adds r2, #1
	add r3, sp, #0
	bl FUN_02019B1C
	movs r0, #0xcb
	lsls r0, r0, #2
	add r3, sp, #0
	movs r2, #0
	ldrsb r2, [r3, r2]
	ldr r0, [r4, r0]
	movs r1, #0x12
	lsls r3, r2, #3
	movs r2, #0x5a
	lsls r2, r2, #2
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r0, #0xcb
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200DCE8
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F3BC0

	thumb_func_start ov14_021F3C08
ov14_021F3C08: @ 0x021F3C08
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021F3CA4 @ =0x0000C121
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x52
	bl FUN_0200D4A4
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021F3CA8 @ =0x0000C122
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x52
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021F3CAC @ =0x0000C0FE
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #8
	movs r3, #0x4a
	bl FUN_0200D564
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F3CB0 @ =0x0000C0FC
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x53
	bl FUN_0200D6D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F3CB0 @ =0x0000C0FC
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x54
	bl FUN_0200D704
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021F3CA4: .4byte 0x0000C121
_021F3CA8: .4byte 0x0000C122
_021F3CAC: .4byte 0x0000C0FE
_021F3CB0: .4byte 0x0000C0FC
	thumb_func_end ov14_021F3C08

	thumb_func_start ov14_021F3CB4
ov14_021F3CB4: @ 0x021F3CB4
	push {r4, lr}
	movs r1, #0xbd
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	movs r3, #2
	ldr r1, [r4, r1]
	ldr r2, _021F3D04 @ =0x021F844C
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0x33
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x3c
	subs r1, #0x38
	movs r3, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3D08 @ =0x021F8480
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0xcd
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r4, pc}
	.align 2, 0
_021F3D04: .4byte 0x021F844C
_021F3D08: .4byte 0x021F8480
	thumb_func_end ov14_021F3CB4

	thumb_func_start ov14_021F3D0C
ov14_021F3D0C: @ 0x021F3D0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r1, #0
	adds r5, r0, #0
	adds r4, r2, #0
	bl FUN_020776B4
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_02077678
	adds r1, r0, #0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r6, #0
	movs r2, #1
	add r3, sp, #4
	bl FUN_020079BC
	ldr r2, [sp, #4]
	movs r3, #1
	adds r6, r0, #0
	ldr r2, [r2, #0x14]
	adds r0, r5, #0
	adds r1, r4, #0
	lsls r3, r3, #8
	bl ov14_021F2C50
	adds r0, r6, #0
	bl FUN_0201AB0C
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r5, r5, r0
	lsls r4, r4, #2
	ldr r0, [r5, r4]
	bl FUN_0200DD30
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_0207769C
	adds r1, r0, #0
	ldr r0, [r5, r4]
	adds r1, r6, r1
	bl FUN_0200DD10
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021F3D0C

	thumb_func_start ov14_021F3D70
ov14_021F3D70: @ 0x021F3D70
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldrb r1, [r4, #0x12]
	adds r5, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	beq _021F3D98
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
_021F3D98:
	ldrb r1, [r4, #0xc]
	ldr r3, _021F3DE0 @ =0x0000C121
	movs r2, #0xd
	bl ov14_021F3D0C
	movs r0, #0x33
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	ldrb r1, [r4, #0xd]
	cmp r1, #0
	beq _021F3DD2
	ldrb r0, [r4, #0xc]
	cmp r0, r1
	beq _021F3DD2
	ldr r3, _021F3DE4 @ =0x0000C122
	adds r0, r5, #0
	movs r2, #0xe
	bl ov14_021F3D0C
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
_021F3DD2:
	movs r0, #0xcd
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F3DE0: .4byte 0x0000C121
_021F3DE4: .4byte 0x0000C122
	thumb_func_end ov14_021F3D70

	thumb_func_start ov14_021F3DE8
ov14_021F3DE8: @ 0x021F3DE8
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021F3E64 @ =0x0000C12D
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x42
	bl FUN_0200D4A4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021F3E68 @ =0x0000C101
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x45
	bl FUN_0200D564
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F3E6C @ =0x0000C0FF
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x43
	bl FUN_0200D6D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F3E6C @ =0x0000C0FF
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #0x13
	movs r3, #0x44
	bl FUN_0200D704
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021F3E64: .4byte 0x0000C12D
_021F3E68: .4byte 0x0000C101
_021F3E6C: .4byte 0x0000C0FF
	thumb_func_end ov14_021F3DE8

	thumb_func_start ov14_021F3E70
ov14_021F3E70: @ 0x021F3E70
	push {r4, lr}
	movs r1, #0xbd
	adds r4, r0, #0
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _021F3F48 @ =0x021F81A8
	bl FUN_0200D734
	movs r1, #0xbf
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #8
	subs r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F4C @ =0x021F81DC
	bl FUN_0200D734
	movs r1, #3
	lsls r1, r1, #8
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0xc
	subs r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F50 @ =0x021F8278
	bl FUN_0200D734
	movs r1, #0xc3
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x18
	subs r1, #0x14
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F54 @ =0x021F82AC
	bl FUN_0200D734
	movs r1, #0x31
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x1c
	subs r1, #0x18
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F58 @ =0x021F82E0
	bl FUN_0200D734
	movs r1, #0xc5
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x20
	subs r1, #0x1c
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F5C @ =0x021F8314
	bl FUN_0200D734
	movs r1, #0xc6
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x24
	subs r1, #0x20
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F60 @ =0x021F8348
	bl FUN_0200D734
	movs r1, #0xc7
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x28
	subs r1, #0x24
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F64 @ =0x021F837C
	bl FUN_0200D734
	movs r1, #0x32
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0x2c
	subs r1, #0x28
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _021F3F68 @ =0x021F83B0
	bl FUN_0200D734
	movs r1, #0xc9
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0
	bl ov14_021F2A18
	pop {r4, pc}
	nop
_021F3F48: .4byte 0x021F81A8
_021F3F4C: .4byte 0x021F81DC
_021F3F50: .4byte 0x021F8278
_021F3F54: .4byte 0x021F82AC
_021F3F58: .4byte 0x021F82E0
_021F3F5C: .4byte 0x021F8314
_021F3F60: .4byte 0x021F8348
_021F3F64: .4byte 0x021F837C
_021F3F68: .4byte 0x021F83B0
	thumb_func_end ov14_021F3E70

	thumb_func_start ov14_021F3F6C
ov14_021F3F6C: @ 0x021F3F6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r6, r0, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _021F3F7C
	b _021F40C0
_021F3F7C:
	ldr r4, [r6, #0x34]
	add r2, sp, #0x14
	adds r1, r4, r0
	ldr r0, _021F40C4 @ =0x00004094
	ldrb r0, [r1, r0]
	add r1, sp, #0x14
	adds r1, #2
	str r0, [sp, #0xc]
	lsls r5, r0, #2
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r7, r4, r0
	ldr r0, [r7, r5]
	bl FUN_0200DE44
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021F402C
	ldr r3, _021F40C8 @ =0x021F810C
	add r2, sp, #0x18
	movs r6, #6
_021F3FAA:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, r6, #1
	bne _021F3FAA
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r7, r5]
	bl FUN_0200DD7C
	adds r0, r0, #1
	str r0, [sp, #0x20]
	ldr r0, [r7, r5]
	bl FUN_0200DD48
	str r0, [sp, #0x44]
	ldr r1, _021F40CC @ =0x0000C0E0
	ldr r0, [sp, #0xc]
	movs r5, #0
	adds r0, r0, r1
	str r0, [sp, #0x2c]
	ldr r0, _021F40D0 @ =0x000088D2
	movs r1, #1
	strh r1, [r4, r0]
	add r7, sp, #0x14
_021F3FDA:
	movs r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, _021F40D4 @ =0x021F8070
	add r2, sp, #0x18
	ldrsb r0, [r0, r5]
	adds r0, r1, r0
	strh r0, [r7, #4]
	movs r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, _021F40D8 @ =0x021F8078
	ldrsb r0, [r0, r5]
	adds r0, r1, r0
	strh r0, [r7, #6]
	lsls r0, r5, #2
	adds r6, r4, r0
	movs r0, #0xbd
	movs r1, #0xbe
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl FUN_0200D734
	movs r1, #0x3f
	lsls r1, r1, #4
	str r0, [r6, r1]
	adds r0, r1, #0
	ldr r0, [r6, r0]
	movs r1, #8
	bl FUN_0200DD10
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #8
	blo _021F3FDA
	ldr r0, _021F40D0 @ =0x000088D2
	movs r1, #0
	add sp, #0x4c
	strh r1, [r4, r0]
	pop {r4, r5, r6, r7, pc}
_021F402C:
	ldr r0, [r7, r5]
	ldr r0, [r0]
	bl FUN_02024B1C
	str r0, [sp, #8]
	ldr r0, [r7, r5]
	bl FUN_0200DD7C
	str r0, [sp, #0x10]
	ldr r0, [r7, r5]
	bl FUN_0200DD48
	str r0, [sp, #4]
	movs r5, #0
_021F4048:
	lsls r7, r5, #2
	movs r0, #0x3f
	adds r1, r4, r7
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	str r1, [sp]
	ldr r0, [r0]
	ldr r1, [sp, #8]
	bl FUN_02024B00
	movs r0, #0x3f
	ldr r1, [sp]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	add r2, sp, #0x14
	movs r1, #2
	ldrsh r1, [r2, r1]
	ldr r2, _021F40D4 @ =0x021F8070
	add r3, sp, #0x14
	ldrsb r2, [r2, r5]
	adds r1, r1, r2
	movs r2, #0
	ldrsh r3, [r3, r2]
	ldr r2, _021F40D8 @ =0x021F8078
	lsls r1, r1, #0x10
	ldrsb r2, [r2, r5]
	asrs r1, r1, #0x10
	adds r2, r3, r2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldr r2, [sp, #0x10]
	adds r1, r5, #0
	ldr r0, [r6, #0x34]
	adds r1, #0x3d
	adds r2, r2, #1
	bl ov14_021F2A74
	ldr r0, [r6, #0x34]
	adds r1, r0, r7
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [sp, #4]
	bl FUN_0200DD54
	ldr r0, [r6, #0x34]
	adds r1, r0, r7
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #8
	blo _021F4048
_021F40C0:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F40C4: .4byte 0x00004094
_021F40C8: .4byte 0x021F810C
_021F40CC: .4byte 0x0000C0E0
_021F40D0: .4byte 0x000088D2
_021F40D4: .4byte 0x021F8070
_021F40D8: .4byte 0x021F8078
	thumb_func_end ov14_021F3F6C

	thumb_func_start ov14_021F40DC
ov14_021F40DC: @ 0x021F40DC
	ldr r3, _021F40E4 @ =ov14_021F40E8
	movs r1, #0
	bx r3
	nop
_021F40E4: .4byte ov14_021F40E8
	thumb_func_end ov14_021F40DC

	thumb_func_start ov14_021F40E8
ov14_021F40E8: @ 0x021F40E8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r5, r0, #0
	cmp r7, #1
	bne _021F40F6
	movs r7, #1
	b _021F40F8
_021F40F6:
	movs r7, #0
_021F40F8:
	movs r6, #0
	adds r4, r6, #0
_021F40FC:
	ldr r0, [r5, #0x34]
	adds r1, r0, r4
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021F4164
	adds r1, r7, #0
	bl FUN_0200DCE8
	cmp r7, #1
	bne _021F4164
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	cmp r1, #0xff
	beq _021F4164
	ldr r0, [r5, #0x34]
	adds r2, r0, r1
	ldr r1, _021F4170 @ =0x00004094
	ldrb r1, [r2, r1]
	lsls r1, r1, #2
	str r1, [sp]
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0200DD7C
	adds r2, r0, #0
	adds r1, r6, #0
	ldr r0, [r5, #0x34]
	adds r1, #0x3d
	adds r2, r2, #1
	bl ov14_021F2A74
	ldr r1, [r5, #0x34]
	ldr r0, [sp]
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0200DD48
	adds r1, r0, #0
	ldr r0, [r5, #0x34]
	adds r2, r0, r4
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	bl FUN_0200DD54
_021F4164:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #8
	blo _021F40FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4170: .4byte 0x00004094
	thumb_func_end ov14_021F40E8

	thumb_func_start ov14_021F4174
ov14_021F4174: @ 0x021F4174
	push {r3, r4, r5, r6, r7, lr}
	adds r1, r0, #0
	adds r1, #0x21
	ldrb r1, [r1]
	cmp r1, #0xff
	beq _021F41D4
	ldr r4, [r0, #0x34]
	ldr r0, _021F41D8 @ =0x00004094
	adds r1, r4, r1
	ldrb r0, [r1, r0]
	add r2, sp, #0
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	bl FUN_0200DE44
	ldr r7, _021F41DC @ =0x021F8070
	movs r5, #0
	add r6, sp, #0
_021F41A2:
	lsls r0, r5, #2
	adds r1, r4, r0
	movs r0, #0x3f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r2, [r6, r1]
	ldrsb r1, [r7, r5]
	ldr r3, _021F41E0 @ =0x021F8078
	adds r1, r2, r1
	movs r2, #0
	lsls r1, r1, #0x10
	ldrsh r2, [r6, r2]
	ldrsb r3, [r3, r5]
	asrs r1, r1, #0x10
	adds r2, r2, r3
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #8
	blo _021F41A2
_021F41D4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F41D8: .4byte 0x00004094
_021F41DC: .4byte 0x021F8070
_021F41E0: .4byte 0x021F8078
	thumb_func_end ov14_021F4174

	thumb_func_start ov14_021F41E4
ov14_021F41E4: @ 0x021F41E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
	movs r7, #1
_021F41F0:
	ldr r0, _021F426C @ =0x0000C123
	str r6, [sp]
	str r7, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r0, #0xbd
	movs r1, #0xbe
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x46
	bl FUN_0200D4A4
	adds r4, r4, #1
	cmp r4, #6
	blo _021F41F0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021F4270 @ =0x0000C0FF
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x47
	bl FUN_0200D564
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F4274 @ =0x0000C0FD
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x48
	bl FUN_0200D6D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F4274 @ =0x0000C0FD
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x49
	bl FUN_0200D704
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F426C: .4byte 0x0000C123
_021F4270: .4byte 0x0000C0FF
_021F4274: .4byte 0x0000C0FD
	thumb_func_end ov14_021F41E4

	thumb_func_start ov14_021F4278
ov14_021F4278: @ 0x021F4278
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	movs r7, #0
	ldr r3, _021F42E4 @ =0x021F8140
	str r0, [sp]
	adds r4, r7, #0
	adds r5, r0, #0
	add r2, sp, #4
	movs r6, #6
_021F428A:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, r6, #1
	bne _021F428A
	ldr r0, [r3]
	str r0, [r2]
_021F4296:
	add r6, sp, #4
	add r3, sp, #0x38
	movs r2, #6
_021F429C:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021F429C
	ldr r0, [r6]
	add r1, sp, #4
	str r0, [r3]
	movs r0, #0x34
	ldrsh r0, [r1, r0]
	adds r1, r0, r4
	add r0, sp, #4
	strh r1, [r0, #0x34]
	ldr r0, _021F42E8 @ =0x0000C123
	ldr r1, [sp]
	adds r0, r7, r0
	str r0, [sp, #0x4c]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r2, r1, #0
	movs r1, #0xbe
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	add r2, sp, #0x38
	bl FUN_0200D734
	movs r1, #0xce
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r7, r7, #1
	adds r4, #0x22
	adds r5, r5, #4
	cmp r7, #6
	blo _021F4296
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F42E4: .4byte 0x021F8140
_021F42E8: .4byte 0x0000C123
	thumb_func_end ov14_021F4278

	thumb_func_start ov14_021F42EC
ov14_021F42EC: @ 0x021F42EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
	movs r7, #1
_021F42F8:
	ldr r0, _021F4378 @ =0x0000C129
	str r6, [sp]
	str r7, [sp, #4]
	adds r0, r4, r0
	str r0, [sp, #8]
	movs r0, #0xbd
	movs r1, #0xbe
	lsls r0, r0, #2
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x4a
	bl FUN_0200D4A4
	adds r4, r4, #1
	cmp r4, #4
	blo _021F42F8
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xc1
	movs r1, #0xbd
	lsls r0, r0, #8
	lsls r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x4b
	bl FUN_0200D564
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F437C @ =0x0000C0FE
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x4c
	bl FUN_0200D6D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021F437C @ =0x0000C0FE
	movs r1, #0xbd
	lsls r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x13
	movs r3, #0x4d
	bl FUN_0200D704
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F4378: .4byte 0x0000C129
_021F437C: .4byte 0x0000C0FE
	thumb_func_end ov14_021F42EC

	thumb_func_start ov14_021F4380
ov14_021F4380: @ 0x021F4380
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	movs r7, #0
	ldr r3, _021F43EC @ =0x021F8174
	str r0, [sp]
	adds r4, r7, #0
	adds r5, r0, #0
	add r2, sp, #4
	movs r6, #6
_021F4392:
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r6, r6, #1
	bne _021F4392
	ldr r0, [r3]
	str r0, [r2]
_021F439E:
	add r6, sp, #4
	add r3, sp, #0x38
	movs r2, #6
_021F43A4:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021F43A4
	ldr r0, [r6]
	add r1, sp, #4
	str r0, [r3]
	movs r0, #0x34
	ldrsh r0, [r1, r0]
	adds r1, r0, r4
	add r0, sp, #4
	strh r1, [r0, #0x34]
	ldr r0, _021F43F0 @ =0x0000C129
	ldr r1, [sp]
	adds r0, r7, r0
	str r0, [sp, #0x4c]
	movs r0, #0xbd
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r2, r1, #0
	movs r1, #0xbe
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	add r2, sp, #0x38
	bl FUN_0200D734
	movs r1, #0x35
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r7, r7, #1
	adds r4, #0x2e
	adds r5, r5, #4
	cmp r7, #4
	blo _021F439E
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F43EC: .4byte 0x021F8174
_021F43F0: .4byte 0x0000C129
	thumb_func_end ov14_021F4380

	thumb_func_start ov14_021F43F4
ov14_021F43F4: @ 0x021F43F4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl ov14_021F2A18
	adds r0, r5, #0
	movs r1, #1
	adds r2, r4, #0
	bl ov14_021F2A18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F43F4

	thumb_func_start ov14_021F4410
ov14_021F4410: @ 0x021F4410
	ldr r1, _021F4420 @ =0x00000414
	ldr r3, _021F4424 @ =FUN_020136B4
	ldr r0, [r0, r1]
	movs r1, #0x2f
	mvns r1, r1
	adds r2, r1, #0
	adds r2, #0x28
	bx r3
	.align 2, 0
_021F4420: .4byte 0x00000414
_021F4424: .4byte FUN_020136B4
	thumb_func_end ov14_021F4410

	thumb_func_start ov14_021F4428
ov14_021F4428: @ 0x021F4428
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xc3
	movs r1, #0xc
	adds r2, r1, #0
	ldr r4, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	subs r2, #0x21
	bl FUN_0200DDB8
	movs r0, #0x31
	lsls r0, r0, #4
	movs r2, #0x14
	ldr r0, [r4, r0]
	movs r1, #0xf4
	mvns r2, r2
	bl FUN_0200DDB8
	movs r0, #0xc5
	lsls r0, r0, #2
	movs r1, #0x2b
	adds r2, r1, #0
	ldr r0, [r4, r0]
	subs r2, #0x40
	bl FUN_0200DDB8
	movs r0, #0xc6
	lsls r0, r0, #2
	movs r1, #0x80
	adds r2, r1, #0
	ldr r0, [r4, r0]
	subs r2, #0xa8
	bl FUN_0200DDB8
	movs r0, #0xc7
	lsls r0, r0, #2
	movs r1, #0x80
	adds r2, r1, #0
	ldr r0, [r4, r0]
	subs r2, #0x9c
	bl FUN_0200DDB8
	adds r0, r5, #0
	bl ov14_021F462C
	movs r1, #7
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov14_021F29E4
	adds r0, r4, #0
	bl ov14_021F4410
	ldr r0, _021F44AC @ =0x00000414
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_020137C0
	ldr r0, _021F44B0 @ =0x00000424
	movs r1, #0
	ldr r0, [r4, r0]
	bl FUN_020137C0
	pop {r3, r4, r5, pc}
	nop
_021F44AC: .4byte 0x00000414
_021F44B0: .4byte 0x00000424
	thumb_func_end ov14_021F4428

	thumb_func_start ov14_021F44B4
ov14_021F44B4: @ 0x021F44B4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r6, r1, #0
	movs r7, #4
	adds r4, #0x10
_021F44C0:
	movs r0, #0xbf
	lsls r0, r0, #2
	add r1, sp, #0
	ldr r0, [r4, r0]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	add r2, sp, #0
	movs r1, #2
	movs r0, #0xbf
	lsls r0, r0, #2
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	adds r2, r2, r6
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r7, r7, #1
	adds r4, r4, #4
	cmp r7, #8
	bls _021F44C0
	adds r0, r5, #0
	bl ov14_021F4410
	movs r4, #0
	add r7, sp, #0
_021F44FE:
	movs r0, #0x35
	lsls r0, r0, #4
	add r1, sp, #0
	ldr r0, [r5, r0]
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r2, #0
	ldrsh r2, [r7, r2]
	movs r0, #0x35
	movs r1, #2
	lsls r0, r0, #4
	adds r2, r2, r6
	lsls r2, r2, #0x10
	ldrsh r1, [r7, r1]
	ldr r0, [r5, r0]
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blo _021F44FE
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021F44B4

	thumb_func_start ov14_021F4530
ov14_021F4530: @ 0x021F4530
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x25
	ldrb r1, [r1]
	bl ov14_021E7930
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	ldr r1, _021F4598 @ =0x0000044D
	ldrb r1, [r0, r1]
	lsrs r2, r1, #2
	lsrs r1, r4, #2
	cmp r2, r1
	bne _021F4558
	movs r1, #6
	movs r2, #1
	bl ov14_021F2A18
	b _021F4560
_021F4558:
	movs r1, #6
	movs r2, #0
	bl ov14_021F2A18
_021F4560:
	movs r0, #0xc5
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0xc5
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #3
	adds r2, r4, #0
	ands r2, r1
	movs r1, #0x2e
	muls r1, r2, r1
	adds r1, #0x3b
	lsls r1, r1, #0x10
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	pop {r3, r4, r5, pc}
	nop
_021F4598: .4byte 0x0000044D
	thumb_func_end ov14_021F4530

	thumb_func_start ov14_021F459C
ov14_021F459C: @ 0x021F459C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r1, _021F4628 @ =0x0000044D
	ldrb r1, [r0, r1]
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1e
	subs r2, r2, r3
	movs r1, #0x1e
	rors r2, r1
	adds r1, r3, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r1, #0x15
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r2, sp, #0
	add r1, sp, #0
	adds r2, #2
	bl FUN_0200DE44
	movs r0, #0xc6
	add r2, sp, #0
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #4
	adds r2, #2
	bl FUN_0200DE44
	movs r0, #0xc6
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #0
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	movs r0, #0xc7
	add r2, sp, #0
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #4
	adds r2, #2
	bl FUN_0200DE44
	movs r0, #0xc7
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #0
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	ldr r0, [r4, #0x34]
	bl ov14_021F4410
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021F4628: .4byte 0x0000044D
	thumb_func_end ov14_021F459C

	thumb_func_start ov14_021F462C
ov14_021F462C: @ 0x021F462C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, _021F46AC @ =0x0000044D
	movs r6, #0x15
	ldrb r0, [r1, r0]
	movs r1, #9
	lsls r1, r1, #6
	lsrs r0, r0, #2
	lsls r5, r0, #2
	movs r0, #0xa
	bl FUN_0201AACC
	adds r4, r0, #0
	movs r0, #0x13
	movs r1, #0x4a
	movs r2, #0xa
	bl FUN_02007540
	add r1, sp, #0xc
	str r0, [sp, #8]
	blx FUN_020B70A8
	movs r0, #0
	str r0, [sp, #4]
_021F4660:
	ldr r0, [sp, #0xc]
	movs r2, #9
	ldr r0, [r0, #0x14]
	adds r1, r4, #0
	lsls r2, r2, #6
	blx FUN_020D4A50
	movs r0, #9
	lsls r0, r0, #6
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0x1e
	bl ov14_021F46B0
	movs r3, #9
	ldr r0, [r7, #0x34]
	adds r1, r6, #0
	adds r2, r4, #0
	lsls r3, r3, #6
	bl ov14_021F2C1C
	ldr r0, [sp, #4]
	adds r6, r6, #1
	adds r0, r0, #1
	adds r5, r5, #1
	str r0, [sp, #4]
	cmp r0, #4
	blo _021F4660
	ldr r0, [sp, #8]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F46AC: .4byte 0x0000044D
	thumb_func_end ov14_021F462C

	thumb_func_start ov14_021F46B0
ov14_021F46B0: @ 0x021F46B0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r5, r1, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x18]
	cmp r7, #0x10
	blo _021F46D8
	adds r1, r7, #0
	ldr r0, [r0, #4]
	subs r1, #0x10
	bl FUN_020740B4
	cmp r0, #0
	bne _021F46D0
	movs r2, #0x28
	b _021F46DE
_021F46D0:
	adds r7, #0x10
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
	b _021F46DE
_021F46D8:
	adds r7, #0x10
	lsls r0, r7, #0x18
	lsrs r2, r0, #0x18
_021F46DE:
	movs r1, #0
	cmp r4, #0
	bls _021F46F2
_021F46E4:
	ldrb r0, [r5, r1]
	cmp r6, r0
	bne _021F46EC
	strb r2, [r5, r1]
_021F46EC:
	adds r1, r1, #1
	cmp r1, r4
	blo _021F46E4
_021F46F2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021F46B0

	thumb_func_start ov14_021F46F4
ov14_021F46F4: @ 0x021F46F4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021F4718 @ =0x00000414
	movs r1, #0x47
	mvns r1, r1
	adds r2, r1, #0
	ldr r0, [r4, r0]
	adds r2, #0x40
	bl FUN_020136B4
	ldr r0, _021F471C @ =0x00000424
	movs r1, #0x20
	adds r2, r1, #0
	ldr r0, [r4, r0]
	subs r2, #0x28
	bl FUN_020136B4
	pop {r4, pc}
	.align 2, 0
_021F4718: .4byte 0x00000414
_021F471C: .4byte 0x00000424
	thumb_func_end ov14_021F46F4

	thumb_func_start ov14_021F4720
ov14_021F4720: @ 0x021F4720
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc3
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0xc
	adds r2, r1, #0
	subs r2, #0x21
	bl FUN_0200DDB8
	movs r0, #0x31
	movs r2, #0x14
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0xf4
	mvns r2, r2
	bl FUN_0200DDB8
	movs r0, #0xc5
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0x2b
	adds r2, r1, #0
	subs r2, #0x40
	bl FUN_0200DDB8
	movs r0, #0xc6
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0x80
	adds r2, r1, #0
	subs r2, #0xa8
	bl FUN_0200DDB8
	movs r0, #0xc7
	ldr r1, [r4, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0x80
	adds r2, r1, #0
	subs r2, #0x9c
	bl FUN_0200DDB8
	adds r0, r4, #0
	bl ov14_021F49E0
	ldr r0, [r4, #0x34]
	movs r1, #7
	movs r2, #5
	bl ov14_021F29E4
	ldr r0, [r4, #0x34]
	bl ov14_021F46F4
	ldr r1, [r4, #0x34]
	ldr r0, _021F47B0 @ =0x00000414
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_020137C0
	ldr r1, [r4, #0x34]
	ldr r0, _021F47B4 @ =0x00000424
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_020137C0
	pop {r4, pc}
	nop
_021F47B0: .4byte 0x00000414
_021F47B4: .4byte 0x00000424
	thumb_func_end ov14_021F4720

	thumb_func_start ov14_021F47B8
ov14_021F47B8: @ 0x021F47B8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #4
	movs r4, #0x10
_021F47C2:
	ldr r0, [r5, #0x34]
	add r2, sp, #0
	adds r1, r0, r4
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	bl FUN_0200DE44
	ldr r0, [r5, #0x34]
	add r2, sp, #0
	adds r1, r0, r4
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #8
	bls _021F47C2
	ldr r0, [r5, #0x34]
	bl ov14_021F46F4
	movs r6, #0
	adds r4, r6, #0
_021F4808:
	ldr r0, [r5, #0x34]
	add r2, sp, #0
	adds r1, r0, r4
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	bl FUN_0200DE44
	ldr r0, [r5, #0x34]
	add r2, sp, #0
	adds r1, r0, r4
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #2
	ldrsh r1, [r2, r1]
	adds r3, r2, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	adds r2, r2, r7
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #6
	blo _021F4808
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021F47B8

	thumb_func_start ov14_021F4848
ov14_021F4848: @ 0x021F4848
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r4, r0, #0
	ldrb r0, [r5, #0x1f]
	movs r1, #6
	blx FUN_020F2998
	cmp r4, r0
	ldr r0, [r5, #0x34]
	bne _021F4870
	movs r1, #6
	movs r2, #1
	bl ov14_021F2A18
	b _021F4878
_021F4870:
	movs r1, #6
	movs r2, #0
	bl ov14_021F2A18
_021F4878:
	ldrb r0, [r5, #0x1f]
	movs r1, #6
	blx FUN_020F2998
	adds r4, r1, #0
	movs r0, #0xc5
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	bl FUN_0200DE44
	movs r0, #0xc5
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0x22
	muls r1, r4, r1
	adds r1, #0x2b
	lsls r1, r1, #0x10
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	asrs r1, r1, #0x10
	bl FUN_0200DDB8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F4848

	thumb_func_start ov14_021F48B4
ov14_021F48B4: @ 0x021F48B4
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	lsls r0, r1, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xc6
	add r2, sp, #0
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #4
	adds r2, #2
	bl FUN_0200DE44
	movs r0, #0xc6
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, _021F493C @ =0x021F8068
	add r3, sp, #0
	movs r2, #2
	ldrb r1, [r1, r4]
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	adds r4, #0xf
	add r2, sp, #0
	ldr r1, [r5, #0x34]
	lsls r0, r4, #2
	adds r1, r1, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	adds r2, #2
	bl FUN_0200DE44
	movs r0, #0xc7
	add r2, sp, #0
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #4
	adds r2, #2
	bl FUN_0200DE44
	movs r0, #0xc7
	ldr r1, [r5, #0x34]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #0
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	bl ov14_021F46F4
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021F493C: .4byte 0x021F8068
	thumb_func_end ov14_021F48B4

	thumb_func_start ov14_021F4940
ov14_021F4940: @ 0x021F4940
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _021F4954 @ =FUN_0200DE44
	bx r3
	nop
_021F4954: .4byte FUN_0200DE44
	thumb_func_end ov14_021F4940

	thumb_func_start ov14_021F4958
ov14_021F4958: @ 0x021F4958
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x13
	movs r1, #0x46
	movs r2, #0xa
	bl FUN_02007540
	add r1, sp, #4
	adds r7, r0, #0
	blx FUN_020B70A8
	ldr r0, [sp, #4]
	ldr r2, [r5, #0x34]
	ldr r1, _021F49C4 @ =0x000040C8
	lsls r4, r6, #0xa
	adds r1, r2, r1
	movs r2, #1
	ldr r0, [r0, #0x14]
	adds r1, r1, r4
	lsls r2, r2, #0xa
	blx FUN_020D4A50
	adds r0, r7, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021E7930
	adds r2, r0, #0
	movs r0, #1
	lsls r0, r0, #0xa
	str r0, [sp]
	ldr r3, [r5, #0x34]
	ldr r1, _021F49C4 @ =0x000040C8
	adds r0, r5, #0
	adds r1, r3, r1
	adds r1, r1, r4
	movs r3, #8
	bl ov14_021F46B0
	ldr r3, [r5, #0x34]
	ldr r2, _021F49C4 @ =0x000040C8
	adds r0, r5, #0
	adds r2, r3, r2
	adds r1, r6, #0
	adds r2, r2, r4
	bl ov14_021F4A64
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F49C4: .4byte 0x000040C8
	thumb_func_end ov14_021F4958

	thumb_func_start ov14_021F49C8
ov14_021F49C8: @ 0x021F49C8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021F49CE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F4958
	adds r4, r4, #1
	cmp r4, #0x12
	blo _021F49CE
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F49C8

	thumb_func_start ov14_021F49E0
ov14_021F49E0: @ 0x021F49E0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	movs r4, #0xf
	movs r6, #0
	lsls r5, r1, #0xa
_021F49F8:
	ldr r0, [r7, #0x34]
	ldr r2, _021F4A1C @ =0x000040C8
	movs r3, #1
	adds r2, r0, r2
	adds r1, r4, #0
	adds r2, r2, r5
	lsls r3, r3, #0xa
	bl ov14_021F2C1C
	movs r0, #1
	lsls r0, r0, #0xa
	adds r6, r6, #1
	adds r4, r4, #1
	adds r5, r5, r0
	cmp r6, #6
	blo _021F49F8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4A1C: .4byte 0x000040C8
	thumb_func_end ov14_021F49E0

	thumb_func_start ov14_021F4A20
ov14_021F4A20: @ 0x021F4A20
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r4, r1, #0
	movs r1, #6
	blx FUN_020F2998
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #6
	blx FUN_020F2BA4
	cmp r6, r0
	bne _021F4A5C
	adds r0, r4, #0
	movs r1, #6
	ldr r5, [r5, #0x34]
	blx FUN_020F2BA4
	ldr r2, _021F4A60 @ =0x000040C8
	adds r0, r5, #0
	adds r3, r5, r2
	lsls r2, r4, #0xa
	adds r2, r3, r2
	movs r3, #1
	adds r1, #0xf
	lsls r3, r3, #0xa
	bl ov14_021F2C1C
_021F4A5C:
	pop {r4, r5, r6, pc}
	nop
_021F4A60: .4byte 0x000040C8
	thumb_func_end ov14_021F4A20

	thumb_func_start ov14_021F4A64
ov14_021F4A64: @ 0x021F4A64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #0x10]
	movs r0, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0x20]
_021F4A76:
	movs r0, #0xa
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	movs r1, #6
	muls r1, r0, r1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x14]
	adds r5, r0, #2
_021F4A8A:
	ldr r0, [sp]
	ldr r3, [sp, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r0, [r0, #4]
	ldr r1, [sp, #4]
	adds r2, r3, r2
	bl FUN_02074058
	str r0, [sp, #0x28]
	bl FUN_0206DDD8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x28]
	movs r1, #5
	movs r2, #0
	bl FUN_0206E640
	adds r4, r0, #0
	ldr r0, [sp, #0x28]
	movs r1, #0xac
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	beq _021F4B4A
	ldr r0, [sp, #0x28]
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E640
	cmp r0, #0
	bne _021F4AF0
	ldr r0, [sp, #0x28]
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E640
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [sp]
	movs r3, #0x1b
	ldr r1, [r0, #0x34]
	movs r0, #0x45
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	adds r1, r4, #0
	bl FUN_0206FC08
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	b _021F4AFC
_021F4AF0:
	ldr r0, _021F4B88 @ =0x000001EA
	cmp r4, r0
	bne _021F4AFA
	movs r1, #1
	b _021F4AFC
_021F4AFA:
	movs r1, #8
_021F4AFC:
	ldr r0, _021F4B8C @ =0x021F8080
	ldr r4, [sp, #0x10]
	ldrb r0, [r0, r1]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r0, r1, #8
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	adds r0, r4, #0
	cmp r0, r5
	bge _021F4B4A
	ldr r0, [sp, #0x18]
	adds r1, r0, #0
	asrs r7, r0, #3
	movs r0, #7
	adds r6, r1, #0
	ands r6, r0
_021F4B24:
	asrs r2, r4, #3
	lsls r2, r2, #2
	lsls r1, r4, #0x1d
	adds r2, r2, r7
	lsrs r1, r1, #0x1a
	lsls r2, r2, #6
	adds r1, r1, r2
	adds r2, r6, r1
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r1, r1, r2
	movs r2, #2
	blx FUN_020D4790
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blt _021F4B24
_021F4B4A:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x24]
	bl FUN_0206DE00
	ldr r0, [sp, #0x18]
	adds r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x1c]
	cmp r0, #6
	blo _021F4A8A
	ldr r0, [sp, #0x10]
	adds r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x20]
	cmp r0, #5
	bhs _021F4B84
	b _021F4A76
_021F4B84:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021F4B88: .4byte 0x000001EA
_021F4B8C: .4byte 0x021F8080
	thumb_func_end ov14_021F4A64

	thumb_func_start ov14_021F4B90
ov14_021F4B90: @ 0x021F4B90
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	lsls r0, r4, #2
	adds r1, r5, r0
	movs r0, #0xbf
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r2, #0
	adds r2, r3, #0
	bl FUN_0200DDB8
	ldr r2, [sp, #0x10]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F2A18
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov14_021F2A60
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F4B90

	thumb_func_start ov14_021F4BC0
ov14_021F4BC0: @ 0x021F4BC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x34]
	movs r1, #4
	movs r2, #0xc
	movs r3, #0x54
	bl ov14_021F4B90
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x34]
	movs r1, #5
	movs r2, #0xf4
	movs r3, #0x54
	bl ov14_021F4B90
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x34]
	movs r1, #6
	movs r2, #0x2b
	movs r3, #0x54
	bl ov14_021F4B90
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x34]
	movs r1, #7
	movs r2, #0x80
	movs r3, #0x41
	bl ov14_021F4B90
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0x34]
	movs r1, #8
	movs r2, #0x80
	movs r3, #0x4d
	bl ov14_021F4B90
	movs r6, #0
	adds r4, r6, #0
	movs r7, #1
_021F4C1C:
	ldr r0, [r5, #0x34]
	add r2, sp, #4
	adds r1, r0, r4
	movs r0, #0xce
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #4
	adds r1, #2
	bl FUN_0200DE44
	str r7, [sp]
	adds r1, r6, #0
	add r3, sp, #4
	movs r2, #2
	ldrsh r2, [r3, r2]
	ldr r0, [r5, #0x34]
	adds r1, #0xf
	movs r3, #0x54
	bl ov14_021F4B90
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #6
	blo _021F4C1C
	adds r0, r5, #0
	bl ov14_021F49E0
	ldr r0, [r5, #0x34]
	movs r1, #7
	movs r2, #5
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	bl ov14_021F46F4
	ldr r1, [r5, #0x34]
	ldr r0, _021F4C98 @ =0x00000414
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_020137C0
	ldr r1, [r5, #0x34]
	ldr r0, _021F4C9C @ =0x00000424
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_020137C0
	ldr r1, [r5, #0x34]
	ldr r0, _021F4C98 @ =0x00000414
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_020137F0
	ldr r1, [r5, #0x34]
	ldr r0, _021F4C9C @ =0x00000424
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_020137F0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4C98: .4byte 0x00000414
_021F4C9C: .4byte 0x00000424
	thumb_func_end ov14_021F4BC0

	thumb_func_start ov14_021F4CA0
ov14_021F4CA0: @ 0x021F4CA0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #4
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	movs r1, #5
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	movs r1, #6
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	movs r1, #7
	movs r2, #0
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	movs r1, #8
	movs r2, #0
	bl ov14_021F2A18
	movs r4, #0
	adds r6, r4, #0
_021F4CDA:
	adds r1, r4, #0
	ldr r0, [r5, #0x34]
	adds r1, #0xf
	adds r2, r6, #0
	bl ov14_021F2A18
	adds r4, r4, #1
	cmp r4, #6
	blo _021F4CDA
	ldr r1, [r5, #0x34]
	ldr r0, _021F4D08 @ =0x00000414
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_020137C0
	ldr r1, [r5, #0x34]
	ldr r0, _021F4D0C @ =0x00000424
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_020137C0
	pop {r4, r5, r6, pc}
	nop
_021F4D08: .4byte 0x00000414
_021F4D0C: .4byte 0x00000424
	thumb_func_end ov14_021F4CA0

	thumb_func_start ov14_021F4D10
ov14_021F4D10: @ 0x021F4D10
	push {r3, r4, r5, lr}
	sub sp, #0x48
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0xa
	bl FUN_02013534
	movs r1, #0x41
	lsls r1, r1, #4
	str r0, [r4, r1]
	adds r0, r1, #4
	adds r5, r4, r0
	add r0, sp, #0x38
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x14]
	add r1, sp, #0x38
	movs r2, #0xc
	bl FUN_0201D494
	add r0, sp, #0x38
	movs r1, #1
	movs r2, #0xa
	bl FUN_02013688
	movs r1, #1
	adds r2, r1, #0
	adds r3, r5, #4
	bl FUN_02021AC8
	movs r0, #0x41
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	str r0, [sp, #8]
	add r0, sp, #0x38
	str r0, [sp, #0xc]
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E2B0
	str r0, [sp, #0x10]
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, _021F4E5C @ =0x0000C101
	bl FUN_0200D934
	str r0, [sp, #0x14]
	movs r0, #0xc6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldr r0, [r5, #8]
	str r0, [sp, #0x1c]
	movs r0, #0x80
	str r0, [sp, #0x20]
	subs r0, #0x9c
	str r0, [sp, #0x24]
	movs r0, #4
	str r0, [sp, #0x2c]
	movs r0, #0xa
	str r0, [sp, #0x34]
	add r0, sp, #8
	str r1, [sp, #0x28]
	str r1, [sp, #0x30]
	bl FUN_020135D8
	ldr r1, _021F4E60 @ =0x00000414
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #1
	bl FUN_020138B0
	ldr r0, _021F4E60 @ =0x00000414
	movs r1, #1
	ldr r0, [r4, r0]
	bl FUN_020138E0
	add r0, sp, #0x38
	bl FUN_0201D520
	ldr r0, _021F4E64 @ =0x00000424
	adds r5, r4, r0
	add r0, sp, #0x38
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	movs r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x14]
	add r1, sp, #0x38
	movs r2, #5
	bl FUN_0201D494
	add r0, sp, #0x38
	movs r1, #1
	movs r2, #0xa
	bl FUN_02013688
	movs r1, #1
	adds r2, r1, #0
	adds r3, r5, #4
	bl FUN_02021AC8
	movs r0, #0x41
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	str r0, [sp, #8]
	add r0, sp, #0x38
	str r0, [sp, #0xc]
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200E2B0
	str r0, [sp, #0x10]
	movs r0, #0xbe
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, _021F4E5C @ =0x0000C101
	bl FUN_0200D934
	str r0, [sp, #0x14]
	movs r0, #0xc6
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	ldr r0, [r0]
	str r0, [sp, #0x18]
	ldr r0, [r5, #8]
	str r0, [sp, #0x1c]
	movs r0, #0x80
	str r0, [sp, #0x20]
	subs r0, #0x9c
	str r0, [sp, #0x24]
	movs r0, #4
	str r0, [sp, #0x2c]
	movs r0, #0xa
	str r0, [sp, #0x34]
	str r1, [sp, #0x28]
	str r1, [sp, #0x30]
	add r0, sp, #8
	bl FUN_020135D8
	str r0, [r5]
	movs r1, #1
	bl FUN_020138B0
	ldr r0, [r5]
	movs r1, #1
	bl FUN_020138E0
	add r0, sp, #0x38
	bl FUN_0201D520
	add sp, #0x48
	pop {r3, r4, r5, pc}
	nop
_021F4E5C: .4byte 0x0000C101
_021F4E60: .4byte 0x00000414
_021F4E64: .4byte 0x00000424
	thumb_func_end ov14_021F4D10

	thumb_func_start ov14_021F4E68
ov14_021F4E68: @ 0x021F4E68
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021F4E9C @ =0x00000418
	str r0, [sp]
	movs r6, #0
	adds r4, r0, r1
	adds r5, r0, #0
	subs r7, r1, #4
_021F4E76:
	adds r0, r4, #0
	bl FUN_02021B5C
	ldr r0, [r5, r7]
	bl FUN_02013660
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #2
	blo _021F4E76
	movs r1, #0x41
	ldr r0, [sp]
	lsls r1, r1, #4
	ldr r0, [r0, r1]
	bl FUN_020135AC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4E9C: .4byte 0x00000418
	thumb_func_end ov14_021F4E68

	thumb_func_start ov14_021F4EA0
ov14_021F4EA0: @ 0x021F4EA0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl FUN_02013910
	adds r7, r0, #0
	lsls r0, r6, #4
	adds r1, r5, r0
	ldr r0, _021F4ECC @ =0x00000414
	adds r2, r4, #0
	ldr r0, [r1, r0]
	adds r1, r7, #0
	movs r3, #0xa
	bl FUN_020139D0
	adds r0, r7, #0
	bl FUN_02013938
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F4ECC: .4byte 0x00000414
	thumb_func_end ov14_021F4EA0

	thumb_func_start ov14_021F4ED0
ov14_021F4ED0: @ 0x021F4ED0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #4
	movs r1, #0xa
	bl FUN_02002CEC
	movs r6, #0
	ldr r4, _021F4EFC @ =0x021F84B4
	adds r5, r6, #0
_021F4EE2:
	ldr r1, [r7, #0x34]
	adds r2, r4, #0
	ldr r0, [r1, #0x14]
	adds r1, #0x30
	adds r1, r1, r5
	bl FUN_0201D4F8
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #0x2c
	blo _021F4EE2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F4EFC: .4byte 0x021F84B4
	thumb_func_end ov14_021F4ED0

	thumb_func_start ov14_021F4F00
ov14_021F4F00: @ 0x021F4F00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021F4F06:
	ldr r1, [r5, #0x34]
	lsls r0, r4, #4
	adds r1, #0x30
	adds r0, r1, r0
	bl FUN_0201D520
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x2c
	blo _021F4F06
	movs r0, #4
	bl FUN_02002DB4
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F4F00

	thumb_func_start ov14_021F4F24
ov14_021F4F24: @ 0x021F4F24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r0, [sp, #0x30]
	str r1, [sp, #0x10]
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r4, [sp, #0x28]
	cmp r0, #1
	bne _021F4F44
	adds r0, r4, #0
	movs r2, #0
	bl FUN_02002F30
	subs r5, r5, r0
	b _021F4F66
_021F4F44:
	cmp r0, #2
	bne _021F4F56
	adds r0, r4, #0
	movs r2, #0
	bl FUN_02002F30
	lsrs r0, r0, #1
	subs r5, r5, r0
	b _021F4F66
_021F4F56:
	cmp r0, #3
	bne _021F4F66
	adds r0, r4, #0
	movs r2, #0
	bl FUN_02003068
	lsrs r0, r0, #1
	subs r5, r5, r0
_021F4F66:
	str r6, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x10]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r3, r5, #0
	bl FUN_020200FC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov14_021F4F24

	thumb_func_start ov14_021F4F84
ov14_021F4F84: @ 0x021F4F84
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r3, #0
	adds r4, r2, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [sp, #0x28]
	adds r5, #0x30
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x24]
	str r0, [sp, #8]
	lsls r0, r4, #4
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov14_021F4F24
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov14_021F4F84

	thumb_func_start ov14_021F4FBC
ov14_021F4FBC: @ 0x021F4FBC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r3, #0
	adds r4, r2, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	adds r2, r6, #0
	bl FUN_0200CBBC
	ldr r0, [sp, #0x28]
	adds r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	adds r1, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x20]
	str r0, [sp, #8]
	lsls r0, r4, #4
	adds r0, r1, r0
	ldr r1, [r5, #0x28]
	ldr r3, [sp, #0x24]
	bl ov14_021F4F24
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov14_021F4FBC

	thumb_func_start ov14_021F5000
ov14_021F5000: @ 0x021F5000
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r5, #0
	adds r0, r2, #0
	adds r6, r1, #0
	adds r4, #0x30
	lsls r7, r0, #4
	adds r0, r4, r7
	movs r1, #0
	str r2, [sp, #0x14]
	bl FUN_0201D978
	ldrb r0, [r6, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021F5044
	ldr r0, [r5, #0x24]
	ldr r2, [r6]
	movs r1, #0
	bl FUN_0200BF1C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, _021F5050 @ =0x00010200
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	bl ov14_021F4FBC
_021F5044:
	adds r0, r4, r7
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F5050: .4byte 0x00010200
	thumb_func_end ov14_021F5000

	thumb_func_start ov14_021F5054
ov14_021F5054: @ 0x021F5054
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r5, #0
	adds r0, r2, #0
	adds r7, r1, #0
	adds r4, #0x30
	lsls r6, r0, #4
	adds r0, r4, r6
	movs r1, #0
	str r2, [sp, #0x14]
	bl FUN_0201D978
	ldr r0, [r5, #0x24]
	ldr r2, [r7]
	movs r1, #0
	bl FUN_0200BF8C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F509C @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #1
	bl ov14_021F4FBC
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F509C: .4byte 0x00010200
	thumb_func_end ov14_021F5054

	thumb_func_start ov14_021F50A0
ov14_021F50A0: @ 0x021F50A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r5, #0
	adds r0, r2, #0
	adds r7, r1, #0
	adds r4, #0x30
	lsls r6, r0, #4
	adds r0, r4, r6
	movs r1, #0
	str r2, [sp, #0x14]
	bl FUN_0201D978
	ldrb r0, [r7, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021F5104
	movs r0, #5
	str r0, [sp]
	ldr r0, [r5, #0x1c]
	movs r1, #1
	adds r2, r4, r6
	movs r3, #0
	bl FUN_0200CDAC
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldrb r2, [r7, #0x12]
	ldr r0, [r5, #0x24]
	movs r3, #3
	lsls r2, r2, #0x19
	lsrs r2, r2, #0x19
	bl FUN_0200BFCC
	movs r0, #0x10
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	ldr r0, _021F5110 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0x5a
	bl ov14_021F4FBC
_021F5104:
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F5110: .4byte 0x00010200
	thumb_func_end ov14_021F50A0

	thumb_func_start ov14_021F5114
ov14_021F5114: @ 0x021F5114
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	adds r4, r6, #0
	adds r0, r2, #0
	adds r5, r1, #0
	adds r4, #0x30
	lsls r7, r0, #4
	adds r0, r4, r7
	movs r1, #0
	str r2, [sp, #0x14]
	bl FUN_0201D978
	ldrb r0, [r5, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021F5182
	ldrb r0, [r5, #0x13]
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _021F5182
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bne _021F5162
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F518C @ =0x00070800
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r6, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r6, #0
	movs r3, #0x52
	bl ov14_021F4F84
	b _021F5182
_021F5162:
	cmp r0, #1
	bne _021F5182
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #0xc1
	str r1, [sp, #8]
	lsls r0, r0, #0xa
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r6, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r6, #0
	movs r3, #0x53
	bl ov14_021F4F84
_021F5182:
	adds r0, r4, r7
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F518C: .4byte 0x00070800
	thumb_func_end ov14_021F5114

	thumb_func_start ov14_021F5190
ov14_021F5190: @ 0x021F5190
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r7, r2, #0
	lsls r4, r7, #4
	adds r0, #0x30
	adds r6, r1, #0
	adds r0, r0, r4
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r6, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021F5208
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02074910
	ldrh r1, [r6, #4]
	bl FUN_02074930
	adds r6, r0, #0
	beq _021F5208
	ldr r2, [r5, #0x34]
	movs r0, #5
	str r0, [sp]
	ldr r0, [r2, #0x1c]
	adds r2, #0x30
	movs r1, #2
	adds r2, r2, r4
	movs r3, #0
	bl FUN_0200CDAC
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x24]
	adds r2, r6, #0
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, [r5, #0x34]
	movs r1, #0x10
	str r1, [sp]
	movs r2, #0
	str r2, [sp, #4]
	ldr r1, _021F5218 @ =0x00010200
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r1, [r0, #0x20]
	adds r2, r7, #0
	movs r3, #0x5b
	bl ov14_021F4FBC
_021F5208:
	ldr r0, [r5, #0x34]
	adds r0, #0x30
	adds r0, r0, r4
	bl FUN_0201D5C8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021F5218: .4byte 0x00010200
	thumb_func_end ov14_021F5190

	thumb_func_start ov14_021F521C
ov14_021F521C: @ 0x021F521C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r5, #0
	adds r0, r2, #0
	adds r6, r1, #0
	adds r4, #0x30
	lsls r7, r0, #4
	adds r0, r4, r7
	movs r1, #0
	str r2, [sp, #0x14]
	bl FUN_0201D978
	ldrb r0, [r6, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021F5264
	ldrb r2, [r6, #0xf]
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200C098
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F5288 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0x55
	bl ov14_021F4FBC
	b _021F527E
_021F5264:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F5288 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0x5d
	bl ov14_021F4F84
_021F527E:
	adds r0, r4, r7
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F5288: .4byte 0x00010200
	thumb_func_end ov14_021F521C

	thumb_func_start ov14_021F528C
ov14_021F528C: @ 0x021F528C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r5, #0
	adds r0, r2, #0
	adds r6, r1, #0
	adds r4, #0x30
	lsls r7, r0, #4
	adds r0, r4, r7
	movs r1, #0
	str r2, [sp, #0x14]
	bl FUN_0201D978
	ldrb r0, [r6, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021F52D4
	ldrb r2, [r6, #0xe]
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200C060
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F52F8 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0x54
	bl ov14_021F4FBC
	b _021F52EE
_021F52D4:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F52F8 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0x5d
	bl ov14_021F4F84
_021F52EE:
	adds r0, r4, r7
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F52F8: .4byte 0x00010200
	thumb_func_end ov14_021F528C

	thumb_func_start ov14_021F52FC
ov14_021F52FC: @ 0x021F52FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r5, #0
	adds r0, r2, #0
	adds r7, r1, #0
	adds r4, #0x30
	lsls r6, r0, #4
	adds r0, r4, r6
	movs r1, #0
	str r2, [sp, #0x14]
	bl FUN_0201D978
	ldrh r2, [r7, #6]
	cmp r2, #0
	beq _021F5340
	ldr r0, [r5, #0x24]
	movs r1, #0
	bl FUN_0200C0CC
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F5364 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0x56
	bl ov14_021F4FBC
	b _021F535A
_021F5340:
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F5364 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5, #0x20]
	ldr r2, [sp, #0x14]
	adds r0, r5, #0
	movs r3, #0x5c
	bl ov14_021F4F84
_021F535A:
	adds r0, r4, r6
	bl FUN_0201D5C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F5364: .4byte 0x00010200
	thumb_func_end ov14_021F52FC

	thumb_func_start ov14_021F5368
ov14_021F5368: @ 0x021F5368
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r2, #0
	adds r4, r1, #0
	bl ov14_021F5000
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	movs r2, #1
	bl ov14_021F5054
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	movs r2, #2
	bl ov14_021F50A0
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	movs r2, #4
	bl ov14_021F5114
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #5
	bl ov14_021F5190
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	movs r2, #6
	bl ov14_021F521C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	movs r2, #7
	bl ov14_021F528C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	movs r2, #8
	bl ov14_021F52FC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F5368

	thumb_func_start ov14_021F53C0
ov14_021F53C0: @ 0x021F53C0
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x40
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x50
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x70
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x80
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0x90
	bl FUN_0201D8E4
	adds r0, r4, #0
	adds r0, #0xa0
	bl FUN_0201D8E4
	adds r4, #0xb0
	adds r0, r4, #0
	bl FUN_0201D8E4
	pop {r4, pc}
	thumb_func_end ov14_021F53C0

	thumb_func_start ov14_021F5404
ov14_021F5404: @ 0x021F5404
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r6, r0, #0
	ldr r3, [r6, #0x34]
	ldr r0, _021F5558 @ =0x0000044E
	str r1, [sp, #0x1c]
	ldrb r0, [r3, r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	bne _021F541E
	movs r0, #9
	str r0, [sp, #0x20]
	b _021F5422
_021F541E:
	movs r0, #0xd
	str r0, [sp, #0x20]
_021F5422:
	ldr r0, _021F5558 @ =0x0000044E
	movs r2, #0xf
	ldrb r4, [r3, r0]
	adds r1, r4, #0
	bics r1, r2
	lsls r2, r4, #0x1c
	lsrs r4, r2, #0x1c
	movs r2, #1
	eors r4, r2
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	movs r4, #0xf
	ands r4, r5
	orrs r1, r4
	strb r1, [r3, r0]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x13
	movs r1, #6
	add r3, sp, #0x3c
	bl FUN_020079BC
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x3c]
	ldr r2, _021F555C @ =0x000002EE
	ldr r0, [r0, #0x14]
	movs r1, #0x1b
	str r0, [sp, #0x30]
	movs r0, #0
	movs r3, #0xa
	bl FUN_0200BAF8
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _021F553A
	movs r0, #0
	str r0, [sp, #0x28]
_021F5472:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x28]
	movs r4, #0
	adds r0, r1, r0
	str r0, [sp, #0x24]
	lsls r7, r0, #4
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x38]
	adds r0, #0x20
	str r0, [sp, #0x38]
_021F5486:
	movs r0, #8
	str r0, [sp]
	lsls r5, r4, #3
	str r0, [sp, #4]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	ldr r0, [r6, #0x34]
	movs r1, #0x16
	adds r0, #0x30
	ldr r2, [sp, #0x30]
	lsls r1, r1, #4
	adds r1, r2, r1
	movs r2, #0
	adds r0, r0, r7
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	ldr r0, [r6, #0x34]
	movs r2, #0
	adds r0, #0x30
	ldr r1, [sp, #0x38]
	adds r0, r0, r7
	adds r3, r2, #0
	bl FUN_0201DA04
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xb
	blo _021F5486
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _021F5560 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r3, [sp, #0x28]
	ldr r0, [r6, #0x34]
	lsls r4, r3, #1
	ldr r3, [sp, #0x1c]
	ldr r1, [sp, #0x2c]
	adds r3, r3, r4
	ldrh r3, [r3, #0x14]
	ldr r2, [sp, #0x24]
	bl ov14_021F4F84
	ldr r1, [r6, #0x34]
	ldr r0, [sp, #0x24]
	adds r1, #0x30
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D8A0
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	cmp r0, #4
	blo _021F5472
	ldr r3, [r6, #0x34]
	ldr r1, _021F5558 @ =0x0000044E
	movs r0, #0x70
	ldrb r2, [r3, r1]
	bics r2, r0
	movs r0, #0x10
	orrs r0, r2
	strb r0, [r3, r1]
	b _021F5546
_021F553A:
	ldr r3, [r6, #0x34]
	ldr r1, _021F5558 @ =0x0000044E
	movs r0, #0x70
	ldrb r2, [r3, r1]
	bics r2, r0
	strb r2, [r3, r1]
_021F5546:
	ldr r0, [sp, #0x2c]
	bl FUN_0200BB44
	ldr r0, [sp, #0x34]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x20]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F5558: .4byte 0x0000044E
_021F555C: .4byte 0x000002EE
_021F5560: .4byte 0x00010200
	thumb_func_end ov14_021F5404

	thumb_func_start ov14_021F5564
ov14_021F5564: @ 0x021F5564
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #0xc]
	adds r6, r0, #0
	ldr r0, [r6, #0x34]
	ldr r1, _021F5618 @ =0x0000044E
	ldrb r1, [r0, r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bne _021F557C
	movs r7, #0x14
	b _021F557E
_021F557C:
	movs r7, #0x16
_021F557E:
	ldr r1, _021F5618 @ =0x0000044E
	adds r5, r0, #0
	ldrb r2, [r0, r1]
	movs r1, #0xf
	adds r5, #0x30
	adds r3, r2, #0
	bics r3, r1
	lsls r1, r2, #0x1c
	lsrs r2, r1, #0x1c
	movs r1, #1
	eors r1, r2
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0xf
	ands r1, r2
	adds r2, r3, #0
	orrs r2, r1
	ldr r1, _021F5618 @ =0x0000044E
	lsls r4, r7, #4
	strb r2, [r0, r1]
	adds r0, r5, r4
	movs r1, #0xd
	bl FUN_0201D978
	adds r0, r5, r4
	adds r0, #0x10
	movs r1, #0xd
	bl FUN_0201D978
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _021F5612
	ldr r0, [r6, #0x34]
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x28]
	movs r2, #0xa
	bl FUN_02077D40
	movs r2, #0
	ldr r0, _021F561C @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r1, [r6, #0x34]
	adds r0, r5, r4
	ldr r1, [r1, #0x28]
	adds r3, r2, #0
	bl ov14_021F4F24
	adds r0, r5, r4
	bl FUN_0201D8A0
	ldr r0, [r6, #0x34]
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x28]
	movs r2, #0xa
	bl FUN_02077D64
	movs r2, #0
	ldr r0, _021F561C @ =0x00010200
	str r2, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r1, [r6, #0x34]
	adds r0, r5, r4
	ldr r1, [r1, #0x28]
	adds r0, #0x10
	adds r3, r2, #0
	bl ov14_021F4F24
	adds r0, r5, r4
	adds r0, #0x10
	bl FUN_0201D8A0
_021F5612:
	adds r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F5618: .4byte 0x0000044E
_021F561C: .4byte 0x00010200
	thumb_func_end ov14_021F5564

	thumb_func_start ov14_021F5620
ov14_021F5620: @ 0x021F5620
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	bl ov14_021F6628
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0
	adds r0, #0x60
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	ldr r0, _021F5668 @ =0x00010200
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r3, [r5]
	ldr r0, [r5, #0x34]
	ldr r3, [r3, #8]
	adds r1, r4, #0
	movs r2, #3
	adds r3, #0x32
	bl ov14_021F4F84
	adds r0, r4, #0
	bl FUN_0200BB44
	ldr r0, [r5, #0x34]
	adds r0, #0x60
	bl FUN_0201D578
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_021F5668: .4byte 0x00010200
	thumb_func_end ov14_021F5620

	thumb_func_start ov14_021F566C
ov14_021F566C: @ 0x021F566C
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #5
	ldr r1, [r4, #0x34]
	lsls r0, r0, #6
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x15
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x16
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0x34]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r1, _021F5714 @ =0x00010200
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r1, [r0, #0x20]
	movs r2, #0x11
	movs r3, #0x57
	bl ov14_021F4F84
	ldr r0, [r4, #0x34]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r1, _021F5714 @ =0x00010200
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r1, [r0, #0x20]
	movs r2, #0x12
	movs r3, #0x58
	bl ov14_021F4F84
	ldr r0, [r4, #0x34]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r1, _021F5714 @ =0x00010200
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r1, [r0, #0x20]
	movs r2, #0x13
	movs r3, #0x59
	bl ov14_021F4F84
	movs r0, #5
	ldr r1, [r4, #0x34]
	lsls r0, r0, #6
	adds r0, r1, r0
	bl FUN_0201D578
	movs r0, #0x15
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D578
	movs r0, #0x16
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D578
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021F5714: .4byte 0x00010200
	thumb_func_end ov14_021F566C

	thumb_func_start ov14_021F5718
ov14_021F5718: @ 0x021F5718
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r6, r0, #0
	str r1, [sp, #0x14]
	adds r5, r3, #0
	movs r0, #0xa
	movs r1, #0x10
	adds r7, r2, #0
	bl FUN_0201AACC
	adds r4, r0, #0
	movs r3, #0
	lsls r0, r5, #0x18
	str r3, [sp]
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	adds r1, r4, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	lsls r0, r7, #0x10
	str r3, [sp, #0xc]
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x34]
	movs r2, #3
	ldr r0, [r0, #0x14]
	bl FUN_0201D40C
	ldr r2, [sp, #0x30]
	ldr r0, [sp, #0x14]
	muls r2, r5, r2
	ldr r1, [r4, #0xc]
	lsls r2, r2, #5
	blx FUN_020D4808
	movs r0, #0x14
	movs r1, #0xa
	bl FUN_02026354
	adds r7, r0, #0
	ldrb r1, [r6, #0x1f]
	ldr r0, [r6, #4]
	adds r2, r7, #0
	bl FUN_02073F00
	movs r0, #0
	ldr r3, [sp, #0x30]
	str r0, [sp]
	ldr r0, _021F57B4 @ =0x00020100
	lsls r3, r3, #3
	str r0, [sp, #4]
	movs r0, #2
	lsls r2, r5, #3
	lsrs r3, r3, #1
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r1, r7, #0
	lsrs r2, r2, #1
	subs r3, #8
	bl ov14_021F4F24
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r4, #0
	bl FUN_0201D8A0
	adds r0, r4, #0
	bl FUN_0201D520
	adds r0, r4, #0
	bl FUN_0201AB0C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F57B4: .4byte 0x00020100
	thumb_func_end ov14_021F5718

	thumb_func_start ov14_021F57B8
ov14_021F57B8: @ 0x021F57B8
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	add r0, sp, #0xc
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	add r1, sp, #0xc
	ldr r0, [r0, #0x14]
	movs r2, #0xc
	movs r3, #2
	bl FUN_0201D494
	movs r0, #0x14
	movs r1, #0xa
	bl FUN_02026354
	adds r5, r0, #0
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r1, [r1]
	ldr r0, [r4, #4]
	adds r2, r5, #0
	bl FUN_02073F00
	movs r3, #0
	ldr r0, _021F58B4 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	add r0, sp, #0xc
	adds r1, r5, #0
	movs r2, #0x30
	bl ov14_021F4F24
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [r4, #0x34]
	add r1, sp, #0xc
	movs r2, #0
	bl ov14_021F4EA0
	add r0, sp, #0xc
	bl FUN_0201D520
	add r0, sp, #0xc
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	add r1, sp, #0xc
	ldr r0, [r0, #0x14]
	movs r2, #5
	movs r3, #2
	bl FUN_0201D494
	ldr r0, [r4, #0x34]
	movs r1, #0x18
	ldr r0, [r0, #0x20]
	bl FUN_0200BBA0
	adds r1, r4, #0
	adds r1, #0x25
	adds r5, r0, #0
	ldrb r1, [r1]
	ldr r0, [r4, #4]
	bl FUN_02073F64
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	movs r3, #2
	ldr r0, [r0, #0x24]
	bl FUN_0200BFCC
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r4, #0x34]
	movs r2, #0x1e
	ldr r0, [r0, #0x24]
	movs r3, #2
	bl FUN_0200BFCC
	ldr r1, [r4, #0x34]
	adds r2, r5, #0
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	bl FUN_0200CBBC
	movs r3, #0
	ldr r0, _021F58B4 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r1, [r4, #0x34]
	add r0, sp, #0xc
	ldr r1, [r1, #0x28]
	movs r2, #0x14
	bl ov14_021F4F24
	adds r0, r5, #0
	bl FUN_02026380
	ldr r0, [r4, #0x34]
	add r1, sp, #0xc
	movs r2, #1
	bl ov14_021F4EA0
	add r0, sp, #0xc
	bl FUN_0201D520
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_021F58B4: .4byte 0x00010200
	thumb_func_end ov14_021F57B8

	thumb_func_start ov14_021F58B8
ov14_021F58B8: @ 0x021F58B8
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	add r0, sp, #0xc
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	add r1, sp, #0xc
	ldr r0, [r0, #0x14]
	movs r2, #0xc
	movs r3, #2
	bl FUN_0201D494
	ldr r2, [r5, #0x34]
	ldr r0, _021F5948 @ =0x0000044D
	ldrb r1, [r2, r0]
	cmp r1, #0x10
	blo _021F590E
	ldr r0, [r5, #4]
	subs r1, #0x10
	bl FUN_020740B4
	cmp r0, #0
	bne _021F58FC
	ldr r0, [r5, #0x34]
	movs r1, #0x3b
	ldr r0, [r0, #0x20]
	bl FUN_0200BBA0
	adds r4, r0, #0
	b _021F5918
_021F58FC:
	ldr r2, [r5, #0x34]
	ldr r1, _021F5948 @ =0x0000044D
	ldr r0, [r2, #0x20]
	ldrb r1, [r2, r1]
	adds r1, #0x23
	bl FUN_0200BBA0
	adds r4, r0, #0
	b _021F5918
_021F590E:
	ldr r0, [r2, #0x20]
	adds r1, #0x23
	bl FUN_0200BBA0
	adds r4, r0, #0
_021F5918:
	movs r3, #0
	ldr r0, _021F594C @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	add r0, sp, #0xc
	adds r1, r4, #0
	movs r2, #0x30
	bl ov14_021F4F24
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [r5, #0x34]
	add r1, sp, #0xc
	movs r2, #0
	bl ov14_021F4EA0
	add r0, sp, #0xc
	bl FUN_0201D520
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_021F5948: .4byte 0x0000044D
_021F594C: .4byte 0x00010200
	thumb_func_end ov14_021F58B8

	thumb_func_start ov14_021F5950
ov14_021F5950: @ 0x021F5950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	ldr r5, [r0, #0x34]
	lsls r4, r1, #4
	adds r5, #0x30
	str r0, [sp, #0x1c]
	adds r0, r5, r4
	str r2, [sp, #0x20]
	adds r6, r3, #0
	bl FUN_0201EE8C
	adds r0, r5, r4
	bl FUN_0201EE98
	adds r0, r5, r4
	bl FUN_0201EE9C
	adds r0, r5, r4
	bl FUN_0201EE90
	str r0, [sp, #0x30]
	adds r0, r5, r4
	bl FUN_0201EE94
	str r0, [sp, #0x3c]
	cmp r6, #1
	bne _021F599A
	adds r0, r5, r4
	movs r1, #0xb
	bl FUN_0201D978
	ldr r0, _021F5BD4 @ =0x000E0F00
	str r0, [sp, #0x4c]
	movs r0, #6
	lsls r0, r0, #6
	str r0, [sp, #0x40]
	b _021F59AA
_021F599A:
	adds r0, r5, r4
	movs r1, #4
	bl FUN_0201D978
	ldr r0, _021F5BD4 @ =0x000E0F00
	str r0, [sp, #0x4c]
	movs r0, #0
	str r0, [sp, #0x40]
_021F59AA:
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0x40
	movs r2, #1
	add r3, sp, #0x6c
	bl FUN_020079BC
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x6c]
	movs r2, #0
	ldr r6, [r0, #0x14]
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x40]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	ldr r0, [sp, #0x30]
	movs r2, #0
	subs r0, r0, #1
	lsls r7, r0, #3
	str r0, [sp, #0x2c]
	movs r0, #8
	str r0, [sp]
	lsls r1, r7, #0x10
	str r0, [sp, #4]
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	ldr r1, [sp, #0x40]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	adds r1, #0x40
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	ldr r0, [sp, #0x3c]
	movs r3, #0
	subs r0, r0, #1
	str r0, [sp, #0x38]
	lsls r0, r0, #3
	str r0, [sp, #0x34]
	movs r0, #8
	ldr r1, [sp, #0x34]
	str r0, [sp]
	str r0, [sp, #4]
	lsls r1, r1, #0x10
	str r3, [sp, #8]
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r2, #0xff
	str r2, [sp, #0x18]
	ldr r1, [sp, #0x40]
	adds r2, #0x21
	adds r1, r1, r2
	adds r0, r5, r4
	adds r1, r6, r1
	adds r2, r3, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	lsls r1, r7, #0x10
	str r0, [sp, #4]
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	ldr r1, [sp, #0x34]
	movs r2, #0xff
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r1, [sp, #0x40]
	adds r2, #0x61
	adds r1, r1, r2
	movs r2, #0
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	ldr r0, [sp, #0x38]
	movs r7, #1
	cmp r0, #1
	ble _021F5AFE
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x40]
	str r0, [sp, #0x54]
	adds r0, #0x60
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x30]
	str r1, [sp, #0x58]
	subs r0, r0, #1
	adds r1, #0xa0
	lsls r0, r0, #3
	str r1, [sp, #0x58]
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0x10
	subs r1, r1, #1
	lsrs r0, r0, #0x10
	str r1, [sp, #0x44]
	str r0, [sp, #0x5c]
_021F5A9A:
	lsls r0, r7, #3
	str r0, [sp, #0x28]
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x54]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	movs r2, #0
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x58]
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	movs r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp, #0x44]
	cmp r7, r0
	blt _021F5A9A
_021F5AFE:
	ldr r0, [sp, #0x2c]
	movs r7, #1
	cmp r0, #1
	ble _021F5B8E
	ldr r0, [sp, #0x40]
	movs r2, #5
	str r0, [sp, #0x60]
	adds r0, #0x20
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	lsls r2, r2, #6
	subs r0, r0, #1
	adds r1, r1, r2
	lsls r0, r0, #3
	str r1, [sp, #0x64]
	ldr r1, [sp, #0x30]
	lsls r0, r0, #0x10
	subs r1, r1, #1
	lsrs r0, r0, #0x10
	str r1, [sp, #0x48]
	str r0, [sp, #0x68]
_021F5B2A:
	lsls r0, r7, #3
	str r0, [sp, #0x24]
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x60]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	movs r2, #0
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x64]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x68]
	movs r2, #0
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp, #0x48]
	cmp r7, r0
	blt _021F5B2A
_021F5B8E:
	ldr r0, [sp, #0x50]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0x20]
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r2, [sp, #0x30]
	movs r7, #4
	lsls r3, r2, #3
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	ldr r0, [sp, #0x4c]
	str r7, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r1, r6, #0
	asrs r2, r2, #1
	adds r3, r7, #0
	bl ov14_021F4F24
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D8A0
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F5BD4: .4byte 0x000E0F00
	thumb_func_end ov14_021F5950

	thumb_func_start ov14_021F5BD8
ov14_021F5BD8: @ 0x021F5BD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r5, [r7, #0x34]
	lsls r4, r1, #4
	adds r5, #0x30
	adds r0, r5, r4
	str r2, [sp, #0xc]
	adds r6, r3, #0
	bl FUN_0201EE8C
	adds r0, r5, r4
	bl FUN_0201EE98
	adds r0, r5, r4
	bl FUN_0201EE9C
	adds r0, r5, r4
	bl FUN_0201EE90
	str r0, [sp, #0x10]
	adds r0, r5, r4
	bl FUN_0201EE94
	cmp r6, #1
	bne _021F5C16
	adds r0, r5, r4
	movs r1, #0xb
	bl FUN_0201D978
	b _021F5C1E
_021F5C16:
	adds r0, r5, r4
	movs r1, #4
	bl FUN_0201D978
_021F5C1E:
	ldr r0, [r7, #0x34]
	ldr r1, [sp, #0xc]
	ldr r0, [r0, #0x20]
	ldr r6, _021F5C80 @ =0x000E0F00
	bl FUN_0200BBA0
	adds r7, r0, #0
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	adds r1, r0, #0
	adds r1, #0xfe
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _021F5C5A
	movs r1, #4
	str r1, [sp]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	adds r0, r5, r4
	lsls r3, r2, #3
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	adds r1, r7, #0
	asrs r2, r2, #1
	movs r3, #0
	bl ov14_021F4F24
	b _021F5C6E
_021F5C5A:
	movs r1, #4
	str r1, [sp]
	str r6, [sp, #4]
	movs r2, #0
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r1, r7, #0
	adds r3, r2, #0
	bl ov14_021F4F24
_021F5C6E:
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D8A0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021F5C80: .4byte 0x000E0F00
	thumb_func_end ov14_021F5BD8

	thumb_func_start ov14_021F5C84
ov14_021F5C84: @ 0x021F5C84
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #0x18
	movs r2, #0x3c
	bl ov14_021F5950
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F5C84

	thumb_func_start ov14_021F5C94
ov14_021F5C94: @ 0x021F5C94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r5, [r0, #0x34]
	lsls r4, r1, #4
	adds r5, #0x30
	str r0, [sp, #0x1c]
	adds r0, r5, r4
	str r2, [sp, #0x20]
	bl FUN_0201EE90
	str r0, [sp, #0x2c]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0xe
	movs r2, #1
	add r3, sp, #0x38
	bl FUN_020079BC
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	movs r2, #0
	ldr r6, [r0, #0x14]
	movs r1, #0x18
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0xae
	str r0, [sp, #0x14]
	movs r0, #0xff
	lsls r1, r1, #4
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r1, #0x18
	movs r2, #0
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r1, #0xb6
	str r0, [sp, #0x14]
	movs r0, #0xff
	lsls r1, r1, #4
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r3, #0x18
	str r3, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r1, #0xb2
	movs r0, #0xff
	lsls r1, r1, #4
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	ldr r0, [sp, #0x2c]
	subs r0, r0, #1
	str r0, [sp, #0x28]
	lsls r7, r0, #3
	movs r0, #8
	str r0, [sp]
	lsls r1, r7, #0x10
	movs r2, #0
	str r0, [sp, #4]
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r1, #0xd6
	str r0, [sp, #0x14]
	movs r0, #0xff
	lsls r1, r1, #4
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r1, #8
	str r1, [sp]
	lsls r0, r7, #0x10
	movs r2, #0
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r1, #0xd2
	movs r0, #0xff
	lsls r1, r1, #4
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	lsls r1, r7, #0x10
	movs r2, #0
	str r0, [sp, #4]
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	movs r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r1, #0x35
	str r0, [sp, #0x14]
	movs r0, #0xff
	lsls r1, r1, #6
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	ldr r0, [sp, #0x28]
	movs r7, #1
	cmp r0, #1
	ble _021F5E4A
	ldr r0, [sp, #0x2c]
	subs r0, r0, #1
	str r0, [sp, #0x30]
_021F5DB8:
	lsls r0, r7, #3
	str r0, [sp, #0x24]
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	movs r1, #0xb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	lsls r1, r1, #8
	movs r2, #0
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	movs r1, #0x2e
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	lsls r1, r1, #6
	movs r2, #0
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	movs r1, #0x2d
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	lsls r1, r1, #6
	movs r2, #0
	str r0, [sp, #0x18]
	adds r0, r5, r4
	adds r1, r6, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp, #0x30]
	cmp r7, r0
	blt _021F5DB8
_021F5E4A:
	ldr r0, [sp, #0x34]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0x20]
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r2, [sp, #0x2c]
	movs r7, #4
	lsls r3, r2, #3
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	ldr r0, _021F5E90 @ =0x00090A00
	str r7, [sp]
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	adds r0, r5, r4
	adds r1, r6, #0
	asrs r2, r2, #1
	adds r3, r7, #0
	bl ov14_021F4F24
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, r4
	bl FUN_0201D8A0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_021F5E90: .4byte 0x00090A00
	thumb_func_end ov14_021F5C94

	thumb_func_start ov14_021F5E94
ov14_021F5E94: @ 0x021F5E94
	push {r3, lr}
	ldr r1, [r0]
	ldr r1, [r1, #8]
	cmp r1, #3
	bne _021F5EA8
	movs r1, #0x19
	movs r2, #0x40
	bl ov14_021F5C94
	pop {r3, pc}
_021F5EA8:
	movs r1, #0x19
	movs r2, #0x3d
	bl ov14_021F5C94
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F5E94

	thumb_func_start ov14_021F5EB4
ov14_021F5EB4: @ 0x021F5EB4
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #0x1a
	movs r2, #0x3e
	bl ov14_021F5950
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F5EB4

	thumb_func_start ov14_021F5EC4
ov14_021F5EC4: @ 0x021F5EC4
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #0x1b
	movs r2, #0x4c
	bl ov14_021F5950
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F5EC4

	thumb_func_start ov14_021F5ED4
ov14_021F5ED4: @ 0x021F5ED4
	push {r3, lr}
	adds r3, r1, #0
	movs r1, #0x1c
	movs r2, #0x47
	bl ov14_021F5950
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F5ED4

	thumb_func_start ov14_021F5EE4
ov14_021F5EE4: @ 0x021F5EE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0xc]
	movs r0, #0x2f
	adds r6, r2, #0
	add r2, sp, #0x14
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #3
	adds r2, #2
	add r3, sp, #0x14
	bl FUN_02019B44
	movs r4, #0
	cmp r6, #0
	bls _021F5F90
	subs r0, r6, #1
	str r0, [sp, #0x10]
	add r7, sp, #0x14
_021F5F0E:
	ldr r0, [sp, #0x10]
	subs r0, r0, r4
	lsls r1, r0, #2
	ldr r0, [sp, #0xc]
	adds r2, r0, r1
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _021F5F56
	ldrh r2, [r2]
	movs r1, #0x21
	adds r0, r5, #0
	subs r1, r1, r4
	movs r3, #0
	bl ov14_021F5950
	ldrh r0, [r7, #2]
	movs r2, #0
	adds r3, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #7
	subs r1, r1, r4
	bl FUN_020199F4
	b _021F5F8A
_021F5F56:
	ldrh r2, [r2]
	movs r1, #0x21
	adds r0, r5, #0
	subs r1, r1, r4
	bl ov14_021F5C94
	ldrh r0, [r7, #2]
	movs r2, #0
	adds r3, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #7
	subs r1, r1, r4
	bl FUN_020199F4
_021F5F8A:
	adds r4, r4, #1
	cmp r4, r6
	blo _021F5F0E
_021F5F90:
	cmp r6, #5
	bhs _021F5FB6
	movs r7, #0x21
_021F5F96:
	subs r0, r7, r6
	lsls r4, r0, #4
	ldr r0, [r5, #0x34]
	movs r1, #0
	adds r0, #0x30
	adds r0, r0, r4
	bl FUN_0201D978
	ldr r0, [r5, #0x34]
	adds r0, #0x30
	adds r0, r0, r4
	bl FUN_0201D8A0
	adds r6, r6, #1
	cmp r6, #5
	blo _021F5F96
_021F5FB6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov14_021F5EE4

	thumb_func_start ov14_021F5FBC
ov14_021F5FBC: @ 0x021F5FBC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #2
	ldr r1, [r5, #0x34]
	lsls r0, r0, #8
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x21
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x22
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #0x23
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r0, #2
	ldr r1, [r5, #0x34]
	lsls r0, r0, #8
	adds r0, r1, r0
	bl FUN_0201D8A0
	movs r0, #0x21
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D8A0
	movs r0, #0x22
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D8A0
	movs r0, #0x23
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	adds r0, r1, r0
	bl FUN_0201D8A0
	cmp r4, #0
	bne _021F603C
	adds r0, r5, #0
	movs r1, #0x21
	movs r2, #0x51
	movs r3, #0
	bl ov14_021F5950
	pop {r3, r4, r5, pc}
_021F603C:
	adds r0, r5, #0
	movs r1, #0x21
	movs r2, #0x50
	movs r3, #0
	bl ov14_021F5950
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F5FBC

	thumb_func_start ov14_021F604C
ov14_021F604C: @ 0x021F604C
	push {r3, lr}
	movs r1, #0x2a
	movs r2, #0x3f
	movs r3, #0
	bl ov14_021F5950
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F604C

	thumb_func_start ov14_021F605C
ov14_021F605C: @ 0x021F605C
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #0x29
	movs r2, #0x4d
	movs r3, #0
	bl ov14_021F5BD8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F605C

	thumb_func_start ov14_021F6070
ov14_021F6070: @ 0x021F6070
	push {r4, lr}
	adds r4, r0, #0
	bl ov14_021F605C
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #0x1a
	movs r3, #0
	bl ov14_021F5950
	adds r0, r4, #0
	movs r1, #0x21
	movs r2, #0x1b
	movs r3, #0
	bl ov14_021F5950
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F6070

	thumb_func_start ov14_021F6094
ov14_021F6094: @ 0x021F6094
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #0x29
	movs r2, #0x4e
	movs r3, #0
	bl ov14_021F5BD8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F6094

	thumb_func_start ov14_021F60A8
ov14_021F60A8: @ 0x021F60A8
	push {r3, lr}
	movs r1, #3
	str r1, [sp]
	movs r1, #0x29
	movs r2, #0x4f
	movs r3, #0
	bl ov14_021F5BD8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F60A8

	thumb_func_start ov14_021F60BC
ov14_021F60BC: @ 0x021F60BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl FUN_02019B08
	add r2, sp, #0xc
	adds r7, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, #2
	add r3, sp, #0xc
	bl FUN_02019B44
	adds r0, r4, #0
	bl FUN_0201EEA0
	adds r2, r0, #0
	ldrb r0, [r4, #9]
	add r3, sp, #0xc
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x10
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r5, r0
	strh r1, [r7]
	ldrh r4, [r3, #2]
	adds r1, r0, #2
	adds r1, r5, r1
	subs r4, r4, #1
	lsls r4, r4, #1
	strh r1, [r7, r4]
	ldrh r4, [r3]
	adds r1, r0, #0
	adds r1, #9
	ldrh r6, [r3, #2]
	subs r4, r4, #1
	adds r1, r5, r1
	muls r4, r6, r4
	lsls r4, r4, #1
	strh r1, [r7, r4]
	adds r1, r0, #0
	adds r1, #0xb
	adds r6, r5, r1
	ldrh r4, [r3, #2]
	ldrh r1, [r3]
	muls r1, r4, r1
	subs r1, r1, #1
	lsls r1, r1, #1
	strh r6, [r7, r1]
	ldrh r4, [r3, #2]
	movs r1, #0
	subs r4, r4, #2
	cmp r4, #0
	ble _021F6164
	adds r4, r0, #1
	adds r0, #0xa
	adds r0, r5, r0
	adds r4, r5, r4
	lsls r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r0, r0, #0x10
	lsrs r6, r4, #0x10
	str r0, [sp, #4]
_021F613E:
	lsls r0, r1, #1
	adds r0, r7, r0
	strh r6, [r0, #2]
	ldrh r4, [r3]
	ldrh r0, [r3, #2]
	subs r4, r4, #1
	muls r4, r0, r4
	adds r0, r1, r4
	lsls r0, r0, #1
	adds r4, r7, r0
	ldr r0, [sp, #4]
	strh r0, [r4, #2]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #2]
	subs r0, r0, #2
	cmp r1, r0
	blt _021F613E
_021F6164:
	add r6, sp, #0xc
	ldrh r1, [r6]
	movs r0, #0
	subs r1, r1, #2
	cmp r1, #0
	ble _021F61AE
	ldr r1, _021F6204 @ =0x000003EB
	adds r3, r5, r1
	adds r1, r1, #2
	adds r1, r5, r1
	lsls r3, r3, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r3, #0x10
	lsrs r1, r1, #0x10
	str r3, [sp, #8]
	mov ip, r1
_021F6184:
	ldrh r1, [r6, #2]
	adds r4, r0, #1
	adds r0, r0, #2
	adds r3, r1, #0
	muls r3, r4, r3
	ldr r1, [sp, #8]
	lsls r3, r3, #1
	strh r1, [r7, r3]
	ldrh r1, [r6, #2]
	muls r0, r1, r0
	lsls r0, r0, #1
	adds r0, r7, r0
	subs r1, r0, #2
	mov r0, ip
	strh r0, [r1]
	ldrh r1, [r6]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	subs r1, r1, #2
	cmp r0, r1
	blt _021F6184
_021F61AE:
	movs r0, #0
	str r0, [sp]
	cmp r1, #0
	ble _021F6200
_021F61B6:
	add r0, sp, #0xc
	ldrh r6, [r0, #2]
	movs r3, #0
	subs r0, r6, #2
	cmp r0, #0
	ble _021F61EA
	ldr r0, [sp]
	adds r4, r0, #1
_021F61C6:
	adds r0, r6, #0
	muls r0, r4, r0
	adds r0, r3, r0
	lsls r0, r0, #1
	adds r1, r5, r2
	adds r0, r7, r0
	strh r1, [r0, #2]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	add r0, sp, #0xc
	ldrh r6, [r0, #2]
	subs r0, r6, #2
	cmp r3, r0
	blt _021F61C6
_021F61EA:
	ldr r0, [sp]
	adds r0, r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	add r0, sp, #0xc
	ldrh r0, [r0]
	subs r1, r0, #2
	ldr r0, [sp]
	cmp r0, r1
	blt _021F61B6
_021F6200:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F6204: .4byte 0x000003EB
	thumb_func_end ov14_021F60BC

	thumb_func_start ov14_021F6208
ov14_021F6208: @ 0x021F6208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	adds r5, r0, #0
	adds r0, r6, #0
	adds r4, r1, #0
	bl FUN_0201EE8C
	adds r7, r0, #0
	adds r0, r6, #0
	bl FUN_0201EE90
	str r0, [sp, #4]
	adds r0, r6, #0
	bl FUN_0201EE94
	str r0, [sp]
	ldr r3, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_020195F4
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_02019A60
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov14_021F6208

	thumb_func_start ov14_021F6244
ov14_021F6244: @ 0x021F6244
	push {r4, lr}
	movs r2, #0x2f
	adds r4, r0, #0
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0xf0
	movs r1, #3
	adds r2, r4, r2
	bl ov14_021F6208
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0xe0
	movs r1, #4
	adds r2, r4, r2
	bl ov14_021F6208
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0xd0
	movs r1, #5
	adds r2, r4, r2
	bl ov14_021F6208
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0xc0
	movs r1, #6
	adds r2, r4, r2
	bl ov14_021F6208
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0xb0
	movs r1, #7
	adds r2, r4, r2
	bl ov14_021F6208
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0x30
	movs r1, #0xc
	adds r2, r4, r2
	bl ov14_021F60BC
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0x20
	movs r1, #0xe
	adds r2, r4, r2
	bl ov14_021F6208
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0x10
	movs r1, #0xf
	adds r2, r4, r2
	bl ov14_021F6208
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F6244

	thumb_func_start ov14_021F62CC
ov14_021F62CC: @ 0x021F62CC
	adds r3, r0, #0
	movs r0, #0x2f
	movs r2, #0x1b
	lsls r0, r0, #4
	lsls r2, r2, #4
	ldr r0, [r3, r0]
	adds r2, r3, r2
	ldr r3, _021F62E0 @ =ov14_021F6208
	movs r1, #8
	bx r3
	.align 2, 0
_021F62E0: .4byte ov14_021F6208
	thumb_func_end ov14_021F62CC

	thumb_func_start ov14_021F62E4
ov14_021F62E4: @ 0x021F62E4
	adds r3, r0, #0
	movs r0, #0x2f
	movs r2, #7
	lsls r0, r0, #4
	lsls r2, r2, #6
	ldr r0, [r3, r0]
	adds r2, r3, r2
	ldr r3, _021F62F8 @ =ov14_021F6208
	movs r1, #9
	bx r3
	.align 2, 0
_021F62F8: .4byte ov14_021F6208
	thumb_func_end ov14_021F62E4

	thumb_func_start ov14_021F62FC
ov14_021F62FC: @ 0x021F62FC
	adds r3, r0, #0
	movs r0, #0x2f
	movs r2, #0x1d
	lsls r0, r0, #4
	lsls r2, r2, #4
	ldr r0, [r3, r0]
	adds r2, r3, r2
	ldr r3, _021F6310 @ =ov14_021F6208
	movs r1, #0xa
	bx r3
	.align 2, 0
_021F6310: .4byte ov14_021F6208
	thumb_func_end ov14_021F62FC

	thumb_func_start ov14_021F6314
ov14_021F6314: @ 0x021F6314
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x2f
	movs r2, #0x1f
	ldr r3, [r4, #0x34]
	lsls r0, r0, #4
	lsls r2, r2, #4
	ldr r0, [r3, r0]
	movs r1, #0xb
	adds r2, r3, r2
	bl ov14_021F6208
	adds r0, r4, #0
	movs r1, #0
	bl ov14_021F5ED4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F6314

	thumb_func_start ov14_021F6338
ov14_021F6338: @ 0x021F6338
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r0, #0
	adds r6, r1, #0
	adds r5, r7, #0
	adds r5, #0x30
	lsls r4, r6, #4
	adds r0, r5, r4
	movs r1, #0xd
	str r2, [sp, #0x14]
	bl FUN_0201D978
	adds r0, r5, r4
	bl FUN_0201EE90
	lsls r1, r0, #3
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	ldr r0, _021F6388 @ =0x00090A0D
	ldr r3, [sp, #0x14]
	str r0, [sp, #0xc]
	movs r0, #2
	str r0, [sp, #0x10]
	ldr r1, [r7, #0x20]
	adds r0, r7, #0
	adds r2, r6, #0
	bl ov14_021F4F84
	adds r0, r5, r4
	bl FUN_0201D8A0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F6388: .4byte 0x00090A0D
	thumb_func_end ov14_021F6338

	thumb_func_start ov14_021F638C
ov14_021F638C: @ 0x021F638C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x22
	movs r2, #0x48
	movs r3, #0
	bl ov14_021F6338
	adds r0, r4, #0
	movs r1, #0x23
	movs r2, #0x49
	movs r3, #0
	bl ov14_021F6338
	pop {r4, pc}
	thumb_func_end ov14_021F638C

	thumb_func_start ov14_021F63A8
ov14_021F63A8: @ 0x021F63A8
	push {r3, lr}
	movs r1, #0x24
	movs r2, #0x4a
	movs r3, #0
	bl ov14_021F6338
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F63A8

	thumb_func_start ov14_021F63B8
ov14_021F63B8: @ 0x021F63B8
	push {r3, lr}
	movs r1, #0x24
	movs r2, #0x4b
	movs r3, #0
	bl ov14_021F6338
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov14_021F63B8

	thumb_func_start ov14_021F63C8
ov14_021F63C8: @ 0x021F63C8
	push {r4, lr}
	movs r2, #0x2f
	adds r4, r0, #0
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0xa0
	movs r1, #2
	adds r2, r4, r2
	bl FUN_02019A60
	movs r2, #0x2f
	lsls r2, r2, #4
	ldr r0, [r4, r2]
	subs r2, #0x90
	movs r1, #2
	adds r2, r4, r2
	bl FUN_02019A60
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov14_021F63C8

	thumb_func_start ov14_021F63F0
ov14_021F63F0: @ 0x021F63F0
	movs r2, #0x2f
	adds r3, r0, #0
	lsls r2, r2, #4
	ldr r0, [r3, r2]
	subs r2, #0x80
	adds r2, r3, r2
	ldr r3, _021F6404 @ =FUN_02019A60
	movs r1, #1
	bx r3
	nop
_021F6404: .4byte FUN_02019A60
	thumb_func_end ov14_021F63F0

	thumb_func_start ov14_021F6408
ov14_021F6408: @ 0x021F6408
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x1c]
	ldr r4, [r0, #0x34]
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201EE90
	str r0, [sp, #0x20]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x13
	movs r1, #0xe
	movs r2, #1
	add r3, sp, #0x30
	bl FUN_020079BC
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x30]
	movs r2, #0
	ldr r5, [r0, #0x14]
	movs r1, #0x18
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0x7a
	lsls r0, r0, #4
	lsls r1, r1, #4
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r1, #0x18
	movs r2, #0
	str r1, [sp]
	movs r0, #8
	str r0, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0xba
	lsls r0, r0, #4
	lsls r1, r1, #4
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r3, #0x18
	str r3, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0xfa
	lsls r0, r0, #4
	lsls r1, r1, #4
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	ldr r0, [sp, #0x20]
	movs r1, #8
	subs r0, r0, #1
	str r1, [sp]
	movs r2, #0
	lsls r6, r0, #3
	str r0, [sp, #0x2c]
	lsls r0, r6, #0x10
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0xd
	lsls r0, r0, #4
	lsls r1, r1, #8
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r1, #8
	str r1, [sp]
	lsls r0, r6, #0x10
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0xce
	lsls r0, r0, #4
	lsls r1, r1, #4
	movs r2, #0
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r1, #8
	str r1, [sp]
	lsls r0, r6, #0x10
	movs r2, #0
	str r1, [sp, #4]
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0x33
	lsls r0, r0, #4
	lsls r1, r1, #6
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	ldr r0, [sp, #0x2c]
	movs r7, #3
	cmp r0, #3
	ble _021F65D8
	ldr r0, [sp, #0x20]
	subs r0, r0, #1
	str r0, [sp, #0x24]
_021F6542:
	movs r0, #8
	str r0, [sp]
	lsls r6, r7, #3
	str r0, [sp, #4]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0xc2
	lsls r0, r0, #4
	lsls r1, r1, #4
	movs r2, #0
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0xca
	lsls r0, r0, #4
	lsls r1, r1, #4
	movs r2, #0
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	movs r0, #0xff
	str r0, [sp, #0x18]
	movs r0, #0x2e
	movs r1, #0x32
	lsls r0, r0, #4
	lsls r1, r1, #6
	movs r2, #0
	adds r0, r4, r0
	adds r1, r5, r1
	adds r3, r2, #0
	bl FUN_0201DA04
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, [sp, #0x24]
	cmp r7, r0
	blt _021F6542
_021F65D8:
	ldr r0, [sp, #0x28]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x1c]
	movs r1, #0x41
	ldr r0, [r0, #0x34]
	ldr r0, [r0, #0x20]
	bl FUN_0200BBA0
	adds r5, r0, #0
	movs r3, #4
	ldr r2, [sp, #0x20]
	ldr r0, _021F6624 @ =0x00090A00
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #2
	lsls r6, r2, #3
	str r0, [sp, #8]
	movs r0, #0x2e
	lsrs r2, r6, #0x1f
	lsls r0, r0, #4
	adds r2, r6, r2
	adds r0, r4, r0
	adds r1, r5, #0
	asrs r2, r2, #1
	bl ov14_021F4F24
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #0x2e
	lsls r0, r0, #4
	adds r0, r4, r0
	bl FUN_0201D8A0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021F6624: .4byte 0x00090A00
	thumb_func_end ov14_021F6408

	thumb_func_start ov14_021F6628
ov14_021F6628: @ 0x021F6628
	push {r3, lr}
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0x19
	movs r3, #0xa
	bl FUN_0200BAF8
	pop {r3, pc}
	thumb_func_end ov14_021F6628

	thumb_func_start ov14_021F6638
ov14_021F6638: @ 0x021F6638
	push {r4, lr}
	movs r1, #0xf
	adds r4, r0, #0
	bl FUN_0201D978
	ldr r1, _021F6650 @ =0x0000038E
	adds r0, r4, #0
	movs r2, #0xa
	bl FUN_0200E948
	pop {r4, pc}
	nop
_021F6650: .4byte 0x0000038E
	thumb_func_end ov14_021F6638

	thumb_func_start ov14_021F6654
ov14_021F6654: @ 0x021F6654
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	lsls r4, r1, #4
	adds r5, #0x30
	adds r0, r5, r4
	movs r1, #1
	bl FUN_0200E9BC
	adds r0, r5, r4
	bl FUN_0201EE8C
	adds r1, r0, #0
	ldr r0, [r6, #0x14]
	bl FUN_0201EFBC
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F6654

	thumb_func_start ov14_021F6678
ov14_021F6678: @ 0x021F6678
	ldr r3, _021F6684 @ =FUN_0200E9BC
	adds r0, #0x30
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #1
	bx r3
	.align 2, 0
_021F6684: .4byte FUN_0200E9BC
	thumb_func_end ov14_021F6678

	thumb_func_start ov14_021F6688
ov14_021F6688: @ 0x021F6688
	ldr r3, _021F6694 @ =FUN_0200E9BC
	adds r0, #0x30
	lsls r1, r1, #4
	adds r0, r0, r1
	movs r1, #0
	bx r3
	.align 2, 0
_021F6694: .4byte FUN_0200E9BC
	thumb_func_end ov14_021F6688

	thumb_func_start ov14_021F6698
ov14_021F6698: @ 0x021F6698
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	str r1, [sp, #0x14]
	adds r4, r2, #0
	bl ov14_021F6628
	adds r7, r0, #0
	ldr r0, [r5, #0x34]
	lsls r6, r4, #4
	adds r0, #0x30
	adds r0, r0, r6
	bl ov14_021F6638
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021F66E4 @ =0x0001020F
	ldr r3, [sp, #0x14]
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [r5, #0x34]
	adds r1, r7, #0
	adds r2, r4, #0
	bl ov14_021F4FBC
	ldr r0, [r5, #0x34]
	adds r0, #0x30
	adds r0, r0, r6
	bl FUN_0201D5C8
	adds r0, r7, #0
	bl FUN_0200BB44
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F66E4: .4byte 0x0001020F
	thumb_func_end ov14_021F6698

	thumb_func_start ov14_021F66E8
ov14_021F66E8: @ 0x021F66E8
	push {r3, lr}
	adds r3, r1, #0
	cmp r2, #1
	bne _021F66FA
	movs r1, #0xb
	adds r2, r3, #0
	bl ov14_021F6698
	pop {r3, pc}
_021F66FA:
	movs r1, #0xc
	adds r2, r3, #0
	bl ov14_021F6698
	pop {r3, pc}
	thumb_func_end ov14_021F66E8

	thumb_func_start ov14_021F6704
ov14_021F6704: @ 0x021F6704
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r3, r1, #0
	ldr r0, [r0, #0x24]
	adds r4, r2, #0
	movs r1, #0
	adds r2, r3, #0
	bl FUN_0200C0CC
	adds r0, r5, #0
	movs r1, #0x17
	adds r2, r4, #0
	bl ov14_021F6698
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6704

	thumb_func_start ov14_021F6724
ov14_021F6724: @ 0x021F6724
	ldr r3, _021F672C @ =ov14_021F6698
	adds r2, r1, #0
	movs r1, #0x18
	bx r3
	.align 2, 0
_021F672C: .4byte ov14_021F6698
	thumb_func_end ov14_021F6724

	thumb_func_start ov14_021F6730
ov14_021F6730: @ 0x021F6730
	ldr r3, _021F6738 @ =ov14_021F6698
	adds r2, r1, #0
	movs r1, #0x36
	bx r3
	.align 2, 0
_021F6738: .4byte ov14_021F6698
	thumb_func_end ov14_021F6730

	thumb_func_start ov14_021F673C
ov14_021F673C: @ 0x021F673C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r3, r1, #0
	ldr r0, [r0, #0x24]
	adds r4, r2, #0
	movs r1, #0
	adds r2, r3, #0
	bl FUN_0200C0CC
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	bl ov14_021F6698
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F673C

	thumb_func_start ov14_021F675C
ov14_021F675C: @ 0x021F675C
	ldr r3, _021F6764 @ =ov14_021F6698
	adds r2, r1, #0
	movs r1, #0xe
	bx r3
	.align 2, 0
_021F6764: .4byte ov14_021F6698
	thumb_func_end ov14_021F675C

	thumb_func_start ov14_021F6768
ov14_021F6768: @ 0x021F6768
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	adds r4, r2, #0
	cmp r3, #0
	ldr r0, [r5, #0x34]
	bne _021F678C
	ldr r0, [r0, #0x24]
	movs r1, #0
	movs r2, #0x70
	bl FUN_0200C0CC
	adds r0, r5, #0
	movs r1, #0x37
	adds r2, r4, #0
	bl ov14_021F6698
	pop {r3, r4, r5, pc}
_021F678C:
	ldr r0, [r0, #0x24]
	movs r1, #0
	adds r2, r3, #0
	bl FUN_0200C0CC
	adds r0, r5, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl ov14_021F6698
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov14_021F6768

	thumb_func_start ov14_021F67A4
ov14_021F67A4: @ 0x021F67A4
	ldr r3, _021F67AC @ =ov14_021F6698
	adds r2, r1, #0
	movs r1, #0x23
	bx r3
	.align 2, 0
_021F67AC: .4byte ov14_021F6698
	thumb_func_end ov14_021F67A4

	thumb_func_start ov14_021F67B0
ov14_021F67B0: @ 0x021F67B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r2, #0
	cmp r1, #6
	bhi _021F6836
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F67C6: @ jump table
	.2byte _021F67D4 - _021F67C6 - 2 @ case 0
	.2byte _021F67D8 - _021F67C6 - 2 @ case 1
	.2byte _021F67F4 - _021F67C6 - 2 @ case 2
	.2byte _021F6810 - _021F67C6 - 2 @ case 3
	.2byte _021F6814 - _021F67C6 - 2 @ case 4
	.2byte _021F6830 - _021F67C6 - 2 @ case 5
	.2byte _021F6834 - _021F67C6 - 2 @ case 6
_021F67D4:
	movs r5, #2
	b _021F6836
_021F67D8:
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r2]
	movs r5, #3
	bl ov14_021E60C0
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x24]
	bl FUN_0200BF8C
	b _021F6836
_021F67F4:
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r2]
	movs r5, #4
	bl ov14_021E60C0
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x24]
	bl FUN_0200BF8C
	b _021F6836
_021F6810:
	movs r5, #0x1f
	b _021F6836
_021F6814:
	adds r2, r4, #0
	adds r2, #0x21
	ldrb r1, [r4, #0x1f]
	ldrb r2, [r2]
	movs r5, #0x20
	bl ov14_021E60C0
	adds r2, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #0
	ldr r0, [r0, #0x24]
	bl FUN_0200BF8C
	b _021F6836
_021F6830:
	movs r5, #0x21
	b _021F6836
_021F6834:
	movs r5, #6
_021F6836:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov14_021F6698
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F67B0

	thumb_func_start ov14_021F6844
ov14_021F6844: @ 0x021F6844
	cmp r1, #0
	beq _021F684E
	cmp r1, #1
	beq _021F6852
	b _021F6854
_021F684E:
	movs r1, #7
	b _021F6854
_021F6852:
	movs r1, #0xa
_021F6854:
	ldr r3, _021F6858 @ =ov14_021F6698
	bx r3
	.align 2, 0
_021F6858: .4byte ov14_021F6698
	thumb_func_end ov14_021F6844

	thumb_func_start ov14_021F685C
ov14_021F685C: @ 0x021F685C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r3, #0
	cmp r2, #6
	bhi _021F68B2
	adds r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021F6872: @ jump table
	.2byte _021F6880 - _021F6872 - 2 @ case 0
	.2byte _021F6884 - _021F6872 - 2 @ case 1
	.2byte _021F68A0 - _021F6872 - 2 @ case 2
	.2byte _021F68A4 - _021F6872 - 2 @ case 3
	.2byte _021F68A8 - _021F6872 - 2 @ case 4
	.2byte _021F68AC - _021F6872 - 2 @ case 5
	.2byte _021F68B0 - _021F6872 - 2 @ case 6
_021F6880:
	movs r4, #0x12
	b _021F68B2
_021F6884:
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r1, [r5, #0x1f]
	ldrb r2, [r2]
	movs r4, #0
	bl ov14_021E60C0
	adds r2, r0, #0
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x24]
	bl FUN_0200BF8C
	b _021F68B2
_021F68A0:
	movs r4, #5
	b _021F68B2
_021F68A4:
	movs r4, #0x13
	b _021F68B2
_021F68A8:
	movs r4, #0xd
	b _021F68B2
_021F68AC:
	movs r4, #0x1d
	b _021F68B2
_021F68B0:
	movs r4, #0x1e
_021F68B2:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F6698
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F685C

	thumb_func_start ov14_021F68C0
ov14_021F68C0: @ 0x021F68C0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r1, #7
	bhi _021F6918
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F68D6: @ jump table
	.2byte _021F6918 - _021F68D6 - 2 @ case 0
	.2byte _021F6918 - _021F68D6 - 2 @ case 1
	.2byte _021F68E6 - _021F68D6 - 2 @ case 2
	.2byte _021F68F8 - _021F68D6 - 2 @ case 3
	.2byte _021F690A - _021F68D6 - 2 @ case 4
	.2byte _021F690E - _021F68D6 - 2 @ case 5
	.2byte _021F6912 - _021F68D6 - 2 @ case 6
	.2byte _021F6916 - _021F68D6 - 2 @ case 7
_021F68E6:
	ldr r3, [r5, #0x34]
	ldr r2, _021F6924 @ =0x000088C8
	ldr r0, [r3, #0x24]
	ldrh r2, [r3, r2]
	movs r1, #0
	movs r4, #0x1a
	bl FUN_0200C0CC
	b _021F6918
_021F68F8:
	ldr r3, [r5, #0x34]
	ldr r2, _021F6924 @ =0x000088C8
	ldr r0, [r3, #0x24]
	ldrh r2, [r3, r2]
	movs r1, #0
	movs r4, #0x1b
	bl FUN_0200C0CC
	b _021F6918
_021F690A:
	movs r4, #0x18
	b _021F6918
_021F690E:
	movs r4, #0x22
	b _021F6918
_021F6912:
	movs r4, #0xe
	b _021F6918
_021F6916:
	movs r4, #0x3b
_021F6918:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F6698
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F6924: .4byte 0x000088C8
	thumb_func_end ov14_021F68C0

	thumb_func_start ov14_021F6928
ov14_021F6928: @ 0x021F6928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	bl ov14_021F6628
	adds r7, r0, #0
	cmp r4, #0xa
	bhi _021F6996
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F6948: @ jump table
	.2byte _021F695E - _021F6948 - 2 @ case 0
	.2byte _021F6962 - _021F6948 - 2 @ case 1
	.2byte _021F6966 - _021F6948 - 2 @ case 2
	.2byte _021F696A - _021F6948 - 2 @ case 3
	.2byte _021F696E - _021F6948 - 2 @ case 4
	.2byte _021F6972 - _021F6948 - 2 @ case 5
	.2byte _021F6984 - _021F6948 - 2 @ case 6
	.2byte _021F6988 - _021F6948 - 2 @ case 7
	.2byte _021F698C - _021F6948 - 2 @ case 8
	.2byte _021F6990 - _021F6948 - 2 @ case 9
	.2byte _021F6994 - _021F6948 - 2 @ case 10
_021F695E:
	movs r4, #0x24
	b _021F6996
_021F6962:
	movs r4, #0x25
	b _021F6996
_021F6966:
	movs r4, #0x26
	b _021F6996
_021F696A:
	movs r4, #0x27
	b _021F6996
_021F696E:
	movs r4, #0x1c
	b _021F6996
_021F6972:
	ldr r3, [r5, #0x34]
	ldr r2, _021F69E8 @ =0x000088C8
	ldr r0, [r3, #0x24]
	ldrh r2, [r3, r2]
	movs r1, #0
	movs r4, #0x19
	bl FUN_0200C0CC
	b _021F6996
_021F6984:
	movs r4, #0x38
	b _021F6996
_021F6988:
	movs r4, #0x39
	b _021F6996
_021F698C:
	movs r4, #0x3a
	b _021F6996
_021F6990:
	movs r4, #0x3b
	b _021F6996
_021F6994:
	movs r4, #0x3c
_021F6996:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r1, [r5, #0x34]
	adds r2, r4, #0
	ldr r0, [r1, #0x24]
	ldr r1, [r1, #0x28]
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [r5, #0x34]
	lsls r4, r6, #4
	adds r0, #0x30
	adds r0, r0, r4
	movs r1, #0xf
	bl FUN_0201D978
	ldr r2, [r5, #0x34]
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021F69EC @ =0x0001020F
	movs r1, #1
	str r0, [sp, #8]
	adds r0, r2, #0
	str r3, [sp, #0xc]
	adds r0, #0x30
	ldr r2, [r2, #0x28]
	adds r0, r0, r4
	bl FUN_020200FC
	adds r0, r7, #0
	bl FUN_0200BB44
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021F69E8: .4byte 0x000088C8
_021F69EC: .4byte 0x0001020F
	thumb_func_end ov14_021F6928

	thumb_func_start ov14_021F69F0
ov14_021F69F0: @ 0x021F69F0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	lsls r4, r1, #4
	adds r0, #0x30
	ldr r1, _021F6A10 @ =0x0000038E
	adds r0, r0, r4
	movs r2, #0xa
	bl FUN_0200E948
	ldr r0, [r5, #0x34]
	adds r0, #0x30
	adds r0, r0, r4
	bl FUN_0201D5C8
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F6A10: .4byte 0x0000038E
	thumb_func_end ov14_021F69F0

	thumb_func_start ov14_021F6A14
ov14_021F6A14: @ 0x021F6A14
	ldr r3, _021F6A1C @ =FUN_02025224
	ldr r0, _021F6A20 @ =0x021F864C
	bx r3
	nop
_021F6A1C: .4byte FUN_02025224
_021F6A20: .4byte 0x021F864C
	thumb_func_end ov14_021F6A14

	thumb_func_start ov14_021F6A24
ov14_021F6A24: @ 0x021F6A24
	ldr r3, _021F6A2C @ =FUN_02025224
	ldr r0, _021F6A30 @ =0x021F8614
	bx r3
	nop
_021F6A2C: .4byte FUN_02025224
_021F6A30: .4byte 0x021F8614
	thumb_func_end ov14_021F6A24

	thumb_func_start ov14_021F6A34
ov14_021F6A34: @ 0x021F6A34
	ldr r3, _021F6A3C @ =FUN_02025224
	ldr r0, _021F6A40 @ =0x021F8630
	bx r3
	nop
_021F6A3C: .4byte FUN_02025224
_021F6A40: .4byte 0x021F8630
	thumb_func_end ov14_021F6A34

	thumb_func_start ov14_021F6A44
ov14_021F6A44: @ 0x021F6A44
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #8]
	cmp r0, #3
	bhi _021F6A74
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F6A5E: @ jump table
	.2byte _021F6A66 - _021F6A5E - 2 @ case 0
	.2byte _021F6A6A - _021F6A5E - 2 @ case 1
	.2byte _021F6A6E - _021F6A5E - 2 @ case 2
	.2byte _021F6A72 - _021F6A5E - 2 @ case 3
_021F6A66:
	movs r5, #0
	b _021F6A74
_021F6A6A:
	movs r5, #2
	b _021F6A74
_021F6A6E:
	movs r5, #3
	b _021F6A74
_021F6A72:
	movs r5, #6
_021F6A74:
	adds r0, r4, #0
	bl ov14_021F6B10
	movs r0, #0xc
	adds r2, r5, #0
	muls r2, r0, r2
	movs r0, #1
	str r0, [sp]
	ldr r0, [r4, #0x2c]
	ldr r1, _021F6AB4 @ =0x021F8B14
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	ldr r0, _021F6AB8 @ =0x021F8B10
	ldr r3, _021F6ABC @ =0x021F8B18
	ldr r0, [r0, r2]
	ldr r1, [r1, r2]
	ldr r2, [r3, r2]
	adds r3, r4, #0
	bl FUN_02019BA4
	ldr r1, [r4, #0x34]
	str r0, [r1, #0x2c]
	ldr r1, [r4, #0x2c]
	adds r0, r4, #0
	bl ov14_021F6B28
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021F6AB4: .4byte 0x021F8B14
_021F6AB8: .4byte 0x021F8B10
_021F6ABC: .4byte 0x021F8B18
	thumb_func_end ov14_021F6A44

	thumb_func_start ov14_021F6AC0
ov14_021F6AC0: @ 0x021F6AC0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r6, r1, #0
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov14_021F6B10
	movs r0, #0xc
	adds r2, r6, #0
	muls r2, r0, r2
	movs r0, #1
	str r0, [sp]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0xa
	str r0, [sp, #8]
	ldr r0, _021F6B04 @ =0x021F8B10
	ldr r1, _021F6B08 @ =0x021F8B14
	ldr r3, _021F6B0C @ =0x021F8B18
	ldr r0, [r0, r2]
	ldr r1, [r1, r2]
	ldr r2, [r3, r2]
	adds r3, r5, #0
	bl FUN_02019BA4
	ldr r1, [r5, #0x34]
	str r0, [r1, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021F6B04: .4byte 0x021F8B10
_021F6B08: .4byte 0x021F8B14
_021F6B0C: .4byte 0x021F8B18
	thumb_func_end ov14_021F6AC0

	thumb_func_start ov14_021F6B10
ov14_021F6B10: @ 0x021F6B10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _021F6B26
	bl FUN_02019BDC
	ldr r0, [r4, #0x34]
	movs r1, #0
	str r1, [r0, #0x2c]
_021F6B26:
	pop {r4, pc}
	thumb_func_end ov14_021F6B10

	thumb_func_start ov14_021F6B28
ov14_021F6B28: @ 0x021F6B28
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	add r1, sp, #0
	adds r0, r5, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r4, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6B28

	thumb_func_start ov14_021F6B60
ov14_021F6B60: @ 0x021F6B60
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6B60

	thumb_func_start ov14_021F6B7C
ov14_021F6B7C: @ 0x021F6B7C
	ldr r3, _021F6B88 @ =ov14_021F2A18
	ldr r0, [r0, #0x34]
	movs r1, #9
	movs r2, #0
	bx r3
	nop
_021F6B88: .4byte ov14_021F2A18
	thumb_func_end ov14_021F6B7C

	thumb_func_start ov14_021F6B8C
ov14_021F6B8C: @ 0x021F6B8C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	ldr r1, _021F6BA0 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, pc}
	.align 2, 0
_021F6BA0: .4byte ov14_021E9F20
	thumb_func_end ov14_021F6B8C

	thumb_func_start ov14_021F6BA4
ov14_021F6BA4: @ 0x021F6BA4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6BA4

	thumb_func_start ov14_021F6BC0
ov14_021F6BC0: @ 0x021F6BC0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r6, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	cmp r4, #0xc
	ldr r1, [r5, #0x34]
	bhs _021F6C18
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F6C0C
	cmp r4, #7
	blo _021F6C14
	cmp r4, #0xb
	bhi _021F6C14
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F6C0C:
	cmp r4, #6
	bne _021F6C14
	movs r0, #0xb
	pop {r4, r5, r6, pc}
_021F6C14:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021F6C18:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021F6C36
	cmp r4, #6
	beq _021F6C32
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _021F6C36
_021F6C32:
	movs r0, #0xb
	pop {r4, r5, r6, pc}
_021F6C36:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F6BC0

	thumb_func_start ov14_021F6C3C
ov14_021F6C3C: @ 0x021F6C3C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	adds r4, r1, #0
	cmp r2, r0
	beq _021F6C7E
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F6C70
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0xff
	beq _021F6C6C
	cmp r4, #0x1e
	blo _021F6C6C
	subs r4, #0x1e
	b _021F6C7E
_021F6C6C:
	movs r4, #0
	b _021F6C7E
_021F6C70:
	cmp r4, #8
	beq _021F6C7E
	cmp r4, #9
	beq _021F6C7E
	cmp r4, #0xa
	beq _021F6C7E
	movs r4, #7
_021F6C7E:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6C3C

	thumb_func_start ov14_021F6C94
ov14_021F6C94: @ 0x021F6C94
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	subs r0, r4, #6
	cmp r0, #1
	bhi _021F6CB4
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r4, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _021F6D10 @ =0x0000043C
	str r4, [r1, r0]
_021F6CB4:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	cmp r4, #0
	blt _021F6D04
	cmp r4, #5
	bgt _021F6D04
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	pop {r3, r4, r5, pc}
_021F6D04:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	pop {r3, r4, r5, pc}
	.align 2, 0
_021F6D10: .4byte 0x0000043C
	thumb_func_end ov14_021F6C94

	thumb_func_start ov14_021F6D14
ov14_021F6D14: @ 0x021F6D14
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0
	blt _021F6D30
	cmp r4, #5
	bgt _021F6D30
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	b _021F6D3A
_021F6D30:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021F6D3A:
	cmp r6, #8
	bne _021F6D56
	cmp r4, #0
	bne _021F6D56
	ldr r1, [r5, #0x34]
	ldr r0, _021F6E60 @ =0x0000043C
	movs r2, #8
	ldr r4, [r1, r0]
	ldr r0, [r1, #0x2c]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_02019F88
_021F6D56:
	cmp r4, #0
	blt _021F6D64
	cmp r4, #5
	bgt _021F6D64
	ldr r1, [r5, #0x34]
	ldr r0, _021F6E60 @ =0x0000043C
	str r4, [r1, r0]
_021F6D64:
	cmp r4, #0
	bne _021F6DC0
	cmp r6, #5
	bne _021F6DC0
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r0, r0, #1
	cmp r0, #0x12
	blt _021F6D7C
	movs r1, #0
	b _021F6D84
_021F6D7C:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r1, r0, #1
_021F6D84:
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F49E0
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	movs r1, #5
	movs r2, #4
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F6E64 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F6DC0:
	cmp r4, #5
	bne _021F6E1A
	cmp r6, #0
	bne _021F6E1A
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, r0, #1
	bpl _021F6DD6
	movs r1, #0x11
	b _021F6DDE
_021F6DD6:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r1, r0, #1
_021F6DDE:
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F49E0
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	movs r1, #4
	movs r2, #2
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F6E64 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F6E1A:
	cmp r4, #0
	blt _021F6E4A
	cmp r4, #5
	bgt _021F6E4A
	cmp r6, #8
	beq _021F6E4A
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	adds r0, r5, #0
	adds r1, r4, r1
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
_021F6E4A:
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F6E64 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
	nop
_021F6E60: .4byte 0x0000043C
_021F6E64: .4byte ov14_021E9F20
	thumb_func_end ov14_021F6D14

	thumb_func_start ov14_021F6E68
ov14_021F6E68: @ 0x021F6E68
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	cmp r4, #6
	beq _021F6E8A
	cmp r4, #7
	beq _021F6E8A
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
_021F6E8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6E68

	thumb_func_start ov14_021F6E8C
ov14_021F6E8C: @ 0x021F6E8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r6, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	cmp r4, #0x27
	ldr r1, [r5, #0x34]
	bhs _021F6EE4
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F6ED8
	cmp r4, #0x22
	blo _021F6EE0
	cmp r4, #0x26
	bhi _021F6EE0
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F6ED8:
	cmp r4, #0x21
	bne _021F6EE0
	movs r0, #0x26
	pop {r4, r5, r6, pc}
_021F6EE0:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
_021F6EE4:
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #1
	bne _021F6F02
	cmp r4, #0x21
	beq _021F6EFE
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _021F6F02
_021F6EFE:
	movs r0, #0x26
	pop {r4, r5, r6, pc}
_021F6F02:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov14_021F6E8C

	thumb_func_start ov14_021F6F08
ov14_021F6F08: @ 0x021F6F08
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	adds r4, r1, #0
	cmp r2, r0
	beq _021F6F5A
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F6F4C
	adds r0, r4, #0
	subs r0, #0x1f
	cmp r0, #1
	bhi _021F6F32
	movs r4, #0x1e
	b _021F6F5A
_021F6F32:
	cmp r4, #0x1e
	beq _021F6F5A
	cmp r4, #0x21
	beq _021F6F5A
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0xff
	beq _021F6F48
	cmp r4, #0x1e
	blo _021F6F5A
_021F6F48:
	movs r4, #0
	b _021F6F5A
_021F6F4C:
	cmp r4, #0x23
	beq _021F6F5A
	cmp r4, #0x24
	beq _021F6F5A
	cmp r4, #0x25
	beq _021F6F5A
	movs r4, #0x22
_021F6F5A:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6F08

	thumb_func_start ov14_021F6F70
ov14_021F6F70: @ 0x021F6F70
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	cmp r4, #0x1f
	beq _021F6F92
	cmp r4, #0x20
	beq _021F6F92
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
_021F6F92:
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F6F70

	thumb_func_start ov14_021F6F94
ov14_021F6F94: @ 0x021F6F94
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r6, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F6FDC
	cmp r4, #0x24
	blo _021F700C
	cmp r4, #0x28
	bhi _021F700C
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F6FDC:
	adds r0, r4, #0
	subs r0, #0x21
	cmp r0, #1
	bhi _021F6FFC
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F6FFC:
	cmp r4, #0x23
	beq _021F7008
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _021F700C
_021F7008:
	movs r0, #0x29
	pop {r4, r5, r6, pc}
_021F700C:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021F6F94

	thumb_func_start ov14_021F7010
ov14_021F7010: @ 0x021F7010
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	adds r4, r1, #0
	cmp r2, r0
	beq _021F7076
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F7060
	adds r0, r4, #0
	subs r0, #0x1e
	cmp r0, #5
	bhi _021F7052
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F7042: @ jump table
	.2byte _021F7076 - _021F7042 - 2 @ case 0
	.2byte _021F704E - _021F7042 - 2 @ case 1
	.2byte _021F704E - _021F7042 - 2 @ case 2
	.2byte _021F7076 - _021F7042 - 2 @ case 3
	.2byte _021F7076 - _021F7042 - 2 @ case 4
	.2byte _021F7076 - _021F7042 - 2 @ case 5
_021F704E:
	movs r4, #0x1e
	b _021F7076
_021F7052:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0x1e
	blo _021F7076
	movs r4, #0
	b _021F7076
_021F7060:
	cmp r4, #0x24
	bne _021F7074
	cmp r4, #0x25
	bne _021F7074
	cmp r4, #0x26
	bne _021F7074
	cmp r4, #0x27
	bne _021F7074
	cmp r4, #0x28
	beq _021F7076
_021F7074:
	movs r4, #0x24
_021F7076:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7010

	thumb_func_start ov14_021F708C
ov14_021F708C: @ 0x021F708C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	ldr r1, _021F70A0 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, pc}
	.align 2, 0
_021F70A0: .4byte ov14_021E9F20
	thumb_func_end ov14_021F708C

	thumb_func_start ov14_021F70A4
ov14_021F70A4: @ 0x021F70A4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F70A4

	thumb_func_start ov14_021F70C0
ov14_021F70C0: @ 0x021F70C0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #0
	bne _021F70DE
	ldr r0, [r5, #0x34]
	movs r1, #0x2d
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
_021F70DE:
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019FC4
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F70C0

	thumb_func_start ov14_021F70F4
ov14_021F70F4: @ 0x021F70F4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	subs r0, #0x2b
	cmp r0, #1
	bhi _021F7118
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r4, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _021F717C @ =0x0000043C
	adds r4, #0x25
	str r4, [r1, r0]
_021F7118:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #1
	bl ov14_021F2A18
	ldr r0, [r5, #0x34]
	ldr r1, _021F7180 @ =0x0000044B
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021F7178
	cmp r4, #0x25
	blt _021F7170
	cmp r4, #0x2a
	bgt _021F7170
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	pop {r3, r4, r5, pc}
_021F7170:
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021F7178:
	pop {r3, r4, r5, pc}
	nop
_021F717C: .4byte 0x0000043C
_021F7180: .4byte 0x0000044B
	thumb_func_end ov14_021F70F4

	thumb_func_start ov14_021F7184
ov14_021F7184: @ 0x021F7184
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5, #0x34]
	ldr r1, _021F72FC @ =0x0000044B
	adds r6, r2, #0
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021F71B0
	cmp r4, #0x25
	blt _021F71A8
	cmp r4, #0x2a
	bgt _021F71A8
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	b _021F71B0
_021F71A8:
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021F71B0:
	cmp r4, #0x25
	bne _021F71EE
	cmp r6, #0
	blt _021F71BC
	cmp r6, #5
	ble _021F71D0
_021F71BC:
	cmp r6, #0x18
	blt _021F71C4
	cmp r6, #0x1d
	ble _021F71D0
_021F71C4:
	cmp r6, #0x1e
	blt _021F71CC
	cmp r6, #0x1f
	ble _021F71D0
_021F71CC:
	cmp r6, #0x24
	bne _021F71EE
_021F71D0:
	ldr r1, [r5, #0x34]
	ldr r0, _021F7300 @ =0x0000043C
	ldr r4, [r1, r0]
	ldr r0, [r1, #0x2c]
	bl FUN_02019F78
	adds r3, r0, #0
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	lsls r2, r6, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl FUN_02019F88
_021F71EE:
	cmp r4, #0x25
	blt _021F71FC
	cmp r4, #0x2a
	bgt _021F71FC
	ldr r1, [r5, #0x34]
	ldr r0, _021F7300 @ =0x0000043C
	str r4, [r1, r0]
_021F71FC:
	cmp r4, #0x25
	bne _021F7258
	cmp r6, #0x2a
	bne _021F7258
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r0, r0, #1
	cmp r0, #0x12
	blt _021F7214
	movs r1, #0
	b _021F721C
_021F7214:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r1, r0, #1
_021F721C:
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F49E0
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	movs r1, #5
	movs r2, #4
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7304 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F7258:
	cmp r4, #0x2a
	bne _021F72B2
	cmp r6, #0x25
	bne _021F72B2
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, r0, #1
	bpl _021F726E
	movs r1, #0x11
	b _021F7276
_021F726E:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r1, r0, #1
_021F7276:
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F49E0
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	movs r1, #4
	movs r2, #2
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7304 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F72B2:
	cmp r4, #0x25
	blt _021F72E8
	cmp r4, #0x2a
	bgt _021F72E8
	cmp r6, #0x25
	blt _021F72E8
	cmp r6, #0x2a
	bgt _021F72E8
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	adds r1, r4, r1
	adds r0, r5, #0
	subs r1, #0x25
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
_021F72E8:
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7304 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F72FC: .4byte 0x0000044B
_021F7300: .4byte 0x0000043C
_021F7304: .4byte ov14_021E9F20
	thumb_func_end ov14_021F7184

	thumb_func_start ov14_021F7308
ov14_021F7308: @ 0x021F7308
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x25
	blt _021F731C
	cmp r4, #0x2a
	bgt _021F731C
	ldr r1, [r5, #0x34]
	ldr r0, _021F733C @ =0x0000043C
	str r4, [r1, r0]
_021F731C:
	cmp r4, #0x2b
	beq _021F7338
	cmp r4, #0x2c
	beq _021F7338
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
_021F7338:
	pop {r3, r4, r5, pc}
	nop
_021F733C: .4byte 0x0000043C
	thumb_func_end ov14_021F7308

	thumb_func_start ov14_021F7340
ov14_021F7340: @ 0x021F7340
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E85E4
	cmp r0, #0
	bne _021F735E
	ldr r0, [r5, #0x34]
	movs r1, #0x2d
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
_021F735E:
	ldr r0, [r5, #0x34]
	movs r1, #0x2b
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x2c
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019FC4
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7340

	thumb_func_start ov14_021F7388
ov14_021F7388: @ 0x021F7388
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r6, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F73D0
	cmp r4, #8
	blo _021F73E0
	cmp r4, #0xc
	bhi _021F73E0
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F73D0:
	cmp r4, #7
	beq _021F73DC
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _021F73E0
_021F73DC:
	movs r0, #0xd
	pop {r4, r5, r6, pc}
_021F73E0:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021F7388

	thumb_func_start ov14_021F73E4
ov14_021F73E4: @ 0x021F73E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	adds r4, r1, #0
	cmp r2, r0
	beq _021F742E
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F7418
	cmp r4, #8
	blt _021F742E
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0x1e
	blo _021F7414
	subs r4, #0x1e
	b _021F742E
_021F7414:
	movs r4, #0
	b _021F742E
_021F7418:
	cmp r4, #8
	bne _021F742C
	cmp r4, #9
	bne _021F742C
	cmp r4, #0xa
	bne _021F742C
	cmp r4, #0xb
	bne _021F742C
	cmp r4, #0xc
	beq _021F742E
_021F742C:
	movs r4, #8
_021F742E:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F73E4

	thumb_func_start ov14_021F7444
ov14_021F7444: @ 0x021F7444
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	adds r6, r2, #0
	bl ov14_021E8544
	cmp r0, #1
	bne _021F747E
	cmp r4, #6
	bgt _021F7492
	cmp r6, #7
	blt _021F7492
	adds r0, r5, #0
	bl ov14_021E76B8
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F74A8 @ =ov14_021EA180
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F747E:
	cmp r4, #0xc
	bne _021F7492
	cmp r6, #7
	bne _021F7492
	ldr r0, [r5, #0x34]
	movs r1, #7
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	movs r4, #7
_021F7492:
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F74AC @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
	nop
_021F74A8: .4byte ov14_021EA180
_021F74AC: .4byte ov14_021E9F20
	thumb_func_end ov14_021F7444

	thumb_func_start ov14_021F74B0
ov14_021F74B0: @ 0x021F74B0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r6, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F74F4
	cmp r4, #0x24
	bne _021F7524
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F74F4:
	adds r0, r4, #0
	subs r0, #0x21
	cmp r0, #1
	bhi _021F7514
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F7514:
	cmp r4, #0x23
	beq _021F7520
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _021F7524
_021F7520:
	movs r0, #0x25
	pop {r4, r5, r6, pc}
_021F7524:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021F74B0

	thumb_func_start ov14_021F7528
ov14_021F7528: @ 0x021F7528
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	adds r4, r1, #0
	cmp r2, r0
	beq _021F757E
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F7578
	adds r0, r4, #0
	subs r0, #0x1e
	cmp r0, #5
	bhi _021F756A
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021F755A: @ jump table
	.2byte _021F757E - _021F755A - 2 @ case 0
	.2byte _021F7566 - _021F755A - 2 @ case 1
	.2byte _021F7566 - _021F755A - 2 @ case 2
	.2byte _021F757E - _021F755A - 2 @ case 3
	.2byte _021F757E - _021F755A - 2 @ case 4
	.2byte _021F757E - _021F755A - 2 @ case 5
_021F7566:
	movs r4, #0x1e
	b _021F757E
_021F756A:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0x1e
	blo _021F757E
	movs r4, #0
	b _021F757E
_021F7578:
	cmp r4, #0x24
	beq _021F757E
	movs r4, #0x24
_021F757E:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7528

	thumb_func_start ov14_021F7594
ov14_021F7594: @ 0x021F7594
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	ldr r1, _021F75A8 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, pc}
	.align 2, 0
_021F75A8: .4byte ov14_021E9F20
	thumb_func_end ov14_021F7594

	thumb_func_start ov14_021F75AC
ov14_021F75AC: @ 0x021F75AC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F75AC

	thumb_func_start ov14_021F75C8
ov14_021F75C8: @ 0x021F75C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019F74
	adds r6, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F760C
	cmp r4, #8
	bne _021F761C
	ldr r0, [r5, #0x34]
	adds r1, r6, #0
	ldr r0, [r0, #0x2c]
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov14_021F6B28
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_021F760C:
	cmp r4, #7
	beq _021F7618
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	bne _021F761C
_021F7618:
	movs r0, #9
	pop {r4, r5, r6, pc}
_021F761C:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov14_021F75C8

	thumb_func_start ov14_021F7620
ov14_021F7620: @ 0x021F7620
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	mvns r0, r0
	adds r4, r1, #0
	cmp r2, r0
	beq _021F765A
	movs r0, #0x2f
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8544
	cmp r0, #0
	bne _021F7654
	cmp r4, #8
	blt _021F765A
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r4, [r0]
	cmp r4, #0x1e
	blo _021F7650
	subs r4, #0x1e
	b _021F765A
_021F7650:
	movs r4, #0
	b _021F765A
_021F7654:
	cmp r4, #8
	beq _021F765A
	movs r4, #8
_021F765A:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7620

	thumb_func_start ov14_021F7670
ov14_021F7670: @ 0x021F7670
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ov14_021F7AC4
	ldr r0, [r4, #0x34]
	ldr r1, _021F7684 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, pc}
	.align 2, 0
_021F7684: .4byte ov14_021E9F20
	thumb_func_end ov14_021F7670

	thumb_func_start ov14_021F7688
ov14_021F7688: @ 0x021F7688
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	subs r0, r4, #6
	cmp r0, #1
	bhi _021F76A8
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	adds r4, r1, #0
	ldr r1, [r5, #0x34]
	ldr r0, _021F76FC @ =0x0000043C
	str r4, [r1, r0]
_021F76A8:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	cmp r4, #0
	blt _021F76EE
	cmp r4, #5
	bgt _021F76EE
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	pop {r3, r4, r5, pc}
_021F76EE:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	pop {r3, r4, r5, pc}
	nop
_021F76FC: .4byte 0x0000043C
	thumb_func_end ov14_021F7688

	thumb_func_start ov14_021F7700
ov14_021F7700: @ 0x021F7700
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0
	blt _021F771C
	cmp r4, #5
	bgt _021F771C
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	b _021F7726
_021F771C:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021F7726:
	cmp r6, #8
	bne _021F7742
	cmp r4, #0
	bne _021F7742
	ldr r1, [r5, #0x34]
	ldr r0, _021F784C @ =0x0000043C
	movs r2, #8
	ldr r4, [r1, r0]
	ldr r0, [r1, #0x2c]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_02019F88
_021F7742:
	cmp r4, #0
	blt _021F7750
	cmp r4, #5
	bgt _021F7750
	ldr r1, [r5, #0x34]
	ldr r0, _021F784C @ =0x0000043C
	str r4, [r1, r0]
_021F7750:
	cmp r4, #0
	bne _021F77AC
	cmp r6, #5
	bne _021F77AC
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r0, r0, #1
	cmp r0, #0x12
	blt _021F7768
	movs r1, #0
	b _021F7770
_021F7768:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	adds r1, r0, #1
_021F7770:
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F49E0
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	movs r1, #5
	movs r2, #4
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7850 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F77AC:
	cmp r4, #5
	bne _021F7806
	cmp r6, #0
	bne _021F7806
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r0, r0, #1
	bpl _021F77C2
	movs r1, #0x11
	b _021F77CA
_021F77C2:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	subs r1, r0, #1
_021F77CA:
	adds r0, r5, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F49E0
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F4848
	adds r0, r5, #0
	bl ov14_021F57B8
	ldr r0, [r5, #0x34]
	movs r1, #4
	movs r2, #2
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7850 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F7806:
	cmp r4, #0
	blt _021F7836
	cmp r4, #5
	bgt _021F7836
	cmp r6, #8
	beq _021F7836
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r1, #6
	blx FUN_020F2998
	movs r1, #6
	muls r1, r0, r1
	adds r0, r5, #0
	adds r1, r4, r1
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r5, #0
	bl ov14_021F48B4
	adds r0, r5, #0
	bl ov14_021F57B8
_021F7836:
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7850 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
	nop
_021F784C: .4byte 0x0000043C
_021F7850: .4byte ov14_021E9F20
	thumb_func_end ov14_021F7700

	thumb_func_start ov14_021F7854
ov14_021F7854: @ 0x021F7854
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	cmp r4, #6
	beq _021F7876
	cmp r4, #7
	beq _021F7876
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
_021F7876:
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7854

	thumb_func_start ov14_021F7878
ov14_021F7878: @ 0x021F7878
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r4, r1, #0
	adds r5, r0, #0
	subs r0, r4, #4
	cmp r0, #1
	bhi _021F789C
	ldr r0, [r5, #0x34]
	ldr r6, _021F78F4 @ =0x0000044D
	ldrb r1, [r0, r6]
	subs r6, #0x11
	lsrs r3, r1, #0x1f
	lsls r2, r1, #0x1e
	subs r2, r2, r3
	movs r1, #0x1e
	rors r2, r1
	adds r4, r3, r2
	str r4, [r0, r6]
_021F789C:
	ldr r0, [r5, #0x34]
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	ldr r0, [r0, #0x2c]
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0x32
	ldr r1, [r5, #0x34]
	lsls r0, r0, #4
	add r2, sp, #0
	ldr r0, [r1, r0]
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	bl FUN_0200DDB8
	cmp r4, #0
	blt _021F78E4
	cmp r4, #3
	bgt _021F78E4
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021F78E4:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021F78F4: .4byte 0x0000044D
	thumb_func_end ov14_021F7878

	thumb_func_start ov14_021F78F8
ov14_021F78F8: @ 0x021F78F8
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0
	blt _021F7914
	cmp r4, #3
	bgt _021F7914
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #0xe
	bl ov14_021F29E4
	b _021F791E
_021F7914:
	ldr r0, [r5, #0x34]
	movs r1, #9
	movs r2, #8
	bl ov14_021F29E4
_021F791E:
	cmp r6, #6
	bne _021F793A
	cmp r4, #0
	bne _021F793A
	ldr r1, [r5, #0x34]
	ldr r0, _021F7A20 @ =0x0000043C
	movs r2, #6
	ldr r4, [r1, r0]
	ldr r0, [r1, #0x2c]
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r3, r2, #0
	bl FUN_02019F88
_021F793A:
	cmp r4, #0
	blt _021F7948
	cmp r4, #3
	bgt _021F7948
	ldr r1, [r5, #0x34]
	ldr r0, _021F7A20 @ =0x0000043C
	str r4, [r1, r0]
_021F7948:
	cmp r4, #0
	bne _021F7998
	cmp r6, #3
	bne _021F7998
	ldr r0, [r5, #0x34]
	ldr r1, _021F7A24 @ =0x0000044D
	ldrb r2, [r0, r1]
	adds r2, r2, #1
	cmp r2, #0x18
	blt _021F7960
	movs r2, #0
	b _021F7960
_021F7960:
	strb r2, [r0, r1]
	adds r0, r5, #0
	bl ov14_021F462C
	adds r0, r5, #0
	bl ov14_021F4530
	adds r0, r5, #0
	bl ov14_021F459C
	adds r0, r5, #0
	bl ov14_021F58B8
	ldr r0, [r5, #0x34]
	movs r1, #5
	movs r2, #4
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7A28 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F7998:
	cmp r4, #3
	bne _021F79E6
	cmp r6, #0
	bne _021F79E6
	ldr r0, [r5, #0x34]
	ldr r1, _021F7A24 @ =0x0000044D
	ldrb r2, [r0, r1]
	subs r2, r2, #1
	bpl _021F79AE
	movs r2, #0x17
	b _021F79AE
_021F79AE:
	strb r2, [r0, r1]
	adds r0, r5, #0
	bl ov14_021F462C
	adds r0, r5, #0
	bl ov14_021F4530
	adds r0, r5, #0
	bl ov14_021F459C
	adds r0, r5, #0
	bl ov14_021F58B8
	ldr r0, [r5, #0x34]
	movs r1, #4
	movs r2, #2
	bl ov14_021F29E4
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7A28 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
_021F79E6:
	cmp r4, #0
	blt _021F7A0C
	cmp r4, #3
	bgt _021F7A0C
	cmp r6, #6
	beq _021F7A0C
	ldr r0, [r5, #0x34]
	ldr r1, _021F7A24 @ =0x0000044D
	ldrb r2, [r0, r1]
	lsrs r2, r2, #2
	lsls r2, r2, #2
	adds r2, r4, r2
	strb r2, [r0, r1]
	adds r0, r5, #0
	bl ov14_021F459C
	adds r0, r5, #0
	bl ov14_021F58B8
_021F7A0C:
	ldr r0, [r5, #0x34]
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov14_021F7AC4
	ldr r0, [r5, #0x34]
	ldr r1, _021F7A28 @ =ov14_021E9F20
	bl ov14_021E5A50
	pop {r4, r5, r6, pc}
	.align 2, 0
_021F7A20: .4byte 0x0000043C
_021F7A24: .4byte 0x0000044D
_021F7A28: .4byte ov14_021E9F20
	thumb_func_end ov14_021F78F8

	thumb_func_start ov14_021F7A2C
ov14_021F7A2C: @ 0x021F7A2C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	adds r4, r1, #0
	lsls r1, r4, #0x18
	ldr r0, [r0, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_02019F7C
	cmp r4, #4
	beq _021F7A4E
	cmp r4, #5
	beq _021F7A4E
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov14_021F6B28
_021F7A4E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7A2C

	thumb_func_start ov14_021F7A50
ov14_021F7A50: @ 0x021F7A50
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x34]
	movs r1, #0x2b
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x2c
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x2d
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x25
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x26
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x27
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x28
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x29
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	movs r1, #0x2a
	ldr r0, [r0, #0x2c]
	bl FUN_02019FD0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019D18
	adds r4, r0, #0
	ldr r0, [r5, #0x34]
	ldr r0, [r0, #0x2c]
	bl FUN_02019FC4
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7A50

	thumb_func_start ov14_021F7AC4
ov14_021F7AC4: @ 0x021F7AC4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r2, #0
	bl FUN_0201A018
	add r1, sp, #0
	add r2, sp, #0
	adds r1, #3
	adds r2, #2
	bl FUN_02020A0C
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl FUN_0201A018
	add r1, sp, #0
	adds r1, #1
	add r2, sp, #0
	bl FUN_02020A0C
	movs r0, #0xa
	movs r1, #8
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r1, [r4, #4]
	movs r0, #3
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r4, #4]
	add r0, sp, #0
	ldrb r1, [r0, #3]
	strb r1, [r4]
	ldrb r1, [r0, #2]
	strb r1, [r4, #1]
	ldrb r1, [r0, #1]
	ldrb r0, [r0, #3]
	cmp r0, r1
	blo _021F7B24
	subs r0, r0, r1
	strb r0, [r4, #2]
	ldr r1, [r4, #4]
	movs r0, #1
	bics r1, r0
	str r1, [r4, #4]
	b _021F7B34
_021F7B24:
	subs r0, r1, r0
	strb r0, [r4, #2]
	ldr r1, [r4, #4]
	movs r0, #1
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	str r0, [r4, #4]
_021F7B34:
	add r0, sp, #0
	ldrb r1, [r0]
	ldrb r0, [r0, #2]
	cmp r0, r1
	blo _021F7B4C
	subs r0, r0, r1
	strb r0, [r4, #3]
	ldr r1, [r4, #4]
	movs r0, #2
	bics r1, r0
	str r1, [r4, #4]
	b _021F7B58
_021F7B4C:
	subs r0, r1, r0
	strb r0, [r4, #3]
	ldr r1, [r4, #4]
	movs r0, #2
	orrs r0, r1
	str r0, [r4, #4]
_021F7B58:
	ldrb r0, [r4, #2]
	ldr r1, [r4, #4]
	lsls r0, r0, #8
	lsrs r1, r1, #2
	blx FUN_020F2BA4
	lsrs r0, r0, #8
	strb r0, [r4, #2]
	ldrb r0, [r4, #3]
	ldr r1, [r4, #4]
	lsls r0, r0, #8
	lsrs r1, r1, #2
	blx FUN_020F2BA4
	lsrs r0, r0, #8
	strb r0, [r4, #3]
	str r4, [r5, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end ov14_021F7AC4

	thumb_func_start ov14_021F7B7C
ov14_021F7B7C: @ 0x021F7B7C
	push {r3, lr}
	ldr r1, [r0, #0x34]
	movs r0, #0x2f
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov14_021E8648
	cmp r0, #0
	bne _021F7B92
	movs r0, #0
	pop {r3, pc}
_021F7B92:
	ldr r0, _021F7BB4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	lsls r0, r0, #0xa
	tst r0, r1
	beq _021F7BA2
	movs r0, #1
	pop {r3, pc}
_021F7BA2:
	ldr r0, _021F7BB8 @ =0x021F86C8
	bl FUN_02025320
	cmp r0, #1
	bne _021F7BB0
	movs r0, #1
	pop {r3, pc}
_021F7BB0:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021F7BB4: .4byte 0x021D110C
_021F7BB8: .4byte 0x021F86C8
	thumb_func_end ov14_021F7B7C
_021F7BBC:
	.byte 0x08, 0x9F, 0x28, 0x9F
	.byte 0x39, 0x00, 0xAF, 0x01, 0x7F, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x36, 0x0F, 0x26, 0x41, 0x58, 0x0F, 0x26
	.byte 0x63, 0x7A, 0x0F, 0x26, 0x85, 0x9C, 0x0F, 0x26, 0xA7, 0xBE, 0x0F, 0x26, 0xC9, 0xE0, 0x0F, 0x26
	.byte 0x1A, 0x39, 0x3A, 0x51, 0x3E, 0x5D, 0x42, 0x59, 0x1A, 0x39, 0x5A, 0x71, 0x3E, 0x5D, 0x62, 0x79
	.byte 0x1A, 0x39, 0x7A, 0x91, 0x3E, 0x5D, 0x82, 0x99, 0xB2, 0xD1, 0x3A, 0x51, 0xD6, 0xF5, 0x42, 0x59
	.byte 0xB2, 0xD1, 0x5A, 0x71, 0xD6, 0xF5, 0x62, 0x79, 0xB2, 0xD1, 0x7A, 0x91, 0xD6, 0xF5, 0x82, 0x99
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x1B, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x06, 0x07, 0xFF, 0x46, 0x00, 0x00, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x45, 0x00, 0x00, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x01, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00
	.byte 0xB9, 0x89, 0x1E, 0x02, 0x7D, 0x8A, 0x1E, 0x02, 0x0F, 0x00, 0x00, 0x00, 0xCD, 0x8A, 0x1E, 0x02
	.byte 0x1D, 0x8B, 0x1E, 0x02, 0x11, 0x00, 0x00, 0x00, 0x3D, 0x8B, 0x1E, 0x02, 0x81, 0x8B, 0x1E, 0x02
	.byte 0x10, 0x00, 0x00, 0x00, 0x21, 0x20, 0x1F, 0x02, 0xE5, 0xB7, 0x1E, 0x02, 0xC5, 0x20, 0x1F, 0x02
	.byte 0x01, 0xC3, 0x1E, 0x02, 0xF5, 0x20, 0x1F, 0x02, 0xB9, 0xED, 0x1E, 0x02, 0xB5, 0x21, 0x1F, 0x02
	.byte 0xD1, 0x21, 0x1F, 0x02, 0xD1, 0x21, 0x1F, 0x02, 0xB5, 0x21, 0x1F, 0x02, 0xAD, 0xAF, 0x1E, 0x02
	.byte 0xE5, 0xB0, 0x1E, 0x02, 0x71, 0xB1, 0x1E, 0x02, 0x8D, 0xB1, 0x1E, 0x02, 0xA5, 0xB1, 0x1E, 0x02
	.byte 0xC1, 0xB1, 0x1E, 0x02, 0xE1, 0xB1, 0x1E, 0x02, 0x19, 0xB2, 0x1E, 0x02, 0x7D, 0xB2, 0x1E, 0x02
	.byte 0x91, 0xB2, 0x1E, 0x02, 0xA9, 0xB2, 0x1E, 0x02, 0xED, 0xB2, 0x1E, 0x02, 0x89, 0xB3, 0x1E, 0x02
	.byte 0xB1, 0xB7, 0x1E, 0x02, 0xE5, 0xB7, 0x1E, 0x02, 0xC1, 0xB8, 0x1E, 0x02, 0xED, 0xBA, 0x1E, 0x02
	.byte 0x3D, 0xBB, 0x1E, 0x02, 0xCD, 0xBD, 0x1E, 0x02, 0xE1, 0xBD, 0x1E, 0x02, 0xE9, 0xBD, 0x1E, 0x02
	.byte 0x2D, 0xBE, 0x1E, 0x02, 0x69, 0xBE, 0x1E, 0x02, 0x8D, 0xBF, 0x1E, 0x02, 0x21, 0xE8, 0x1E, 0x02
	.byte 0x9D, 0xBF, 0x1E, 0x02, 0xED, 0xC0, 0x1E, 0x02, 0x29, 0xC1, 0x1E, 0x02, 0x3D, 0xC1, 0x1E, 0x02
	.byte 0x51, 0xC1, 0x1E, 0x02, 0xA5, 0xC2, 0x1E, 0x02, 0xED, 0xC2, 0x1E, 0x02, 0x01, 0xC3, 0x1E, 0x02
	.byte 0x3D, 0xC2, 0x1E, 0x02, 0x55, 0xC3, 0x1E, 0x02, 0xA9, 0xC3, 0x1E, 0x02, 0xD9, 0xC3, 0x1E, 0x02
	.byte 0x11, 0xC7, 0x1E, 0x02, 0x31, 0xC7, 0x1E, 0x02, 0xD5, 0xC7, 0x1E, 0x02, 0x55, 0xC8, 0x1E, 0x02
	.byte 0xD1, 0xC8, 0x1E, 0x02, 0xA9, 0xCD, 0x1E, 0x02, 0x59, 0xCF, 0x1E, 0x02, 0xAD, 0xD1, 0x1E, 0x02
	.byte 0xE9, 0xD1, 0x1E, 0x02, 0x59, 0xD2, 0x1E, 0x02, 0xC9, 0xD2, 0x1E, 0x02, 0xDD, 0xD2, 0x1E, 0x02
	.byte 0x51, 0xD3, 0x1E, 0x02, 0x5D, 0xD3, 0x1E, 0x02, 0x8D, 0xD3, 0x1E, 0x02, 0xB1, 0xD5, 0x1E, 0x02
	.byte 0x0D, 0xD6, 0x1E, 0x02, 0x21, 0xD6, 0x1E, 0x02, 0x2D, 0xD6, 0x1E, 0x02, 0x51, 0xD6, 0x1E, 0x02
	.byte 0x85, 0xD6, 0x1E, 0x02, 0xA5, 0xD6, 0x1E, 0x02, 0xC5, 0xD6, 0x1E, 0x02, 0xD1, 0xD6, 0x1E, 0x02
	.byte 0x15, 0xD4, 0x1E, 0x02, 0x31, 0xE8, 0x1E, 0x02, 0x61, 0xD7, 0x1E, 0x02, 0xB9, 0xD7, 0x1E, 0x02
	.byte 0xDD, 0xD7, 0x1E, 0x02, 0x21, 0xD8, 0x1E, 0x02, 0x21, 0xD9, 0x1E, 0x02, 0x41, 0xD9, 0x1E, 0x02
	.byte 0x61, 0xD9, 0x1E, 0x02, 0x6D, 0xD9, 0x1E, 0x02, 0xAD, 0xD9, 0x1E, 0x02, 0xED, 0xD9, 0x1E, 0x02
	.byte 0x41, 0xE8, 0x1E, 0x02, 0xB5, 0xE7, 0x1E, 0x02, 0xC5, 0xE7, 0x1E, 0x02, 0xD5, 0xE7, 0x1E, 0x02
	.byte 0x1D, 0xDA, 0x1E, 0x02, 0x3D, 0xDA, 0x1E, 0x02, 0x99, 0x01, 0x1F, 0x02, 0xB9, 0x01, 0x1F, 0x02
	.byte 0x4D, 0xDA, 0x1E, 0x02, 0x21, 0xDE, 0x1E, 0x02, 0x39, 0xDE, 0x1E, 0x02, 0x71, 0xDE, 0x1E, 0x02
	.byte 0x89, 0xDE, 0x1E, 0x02, 0x09, 0xDF, 0x1E, 0x02, 0x29, 0xDF, 0x1E, 0x02, 0x51, 0xE8, 0x1E, 0x02
	.byte 0x61, 0xE8, 0x1E, 0x02, 0x91, 0xDF, 0x1E, 0x02, 0xA1, 0xDF, 0x1E, 0x02, 0x6D, 0xE2, 0x1E, 0x02
	.byte 0x29, 0xE3, 0x1E, 0x02, 0x39, 0xE3, 0x1E, 0x02, 0x5D, 0xE3, 0x1E, 0x02, 0x81, 0xE3, 0x1E, 0x02
	.byte 0xC9, 0xE3, 0x1E, 0x02, 0xAD, 0xE4, 0x1E, 0x02, 0xD9, 0xE4, 0x1E, 0x02, 0xE5, 0xE4, 0x1E, 0x02
	.byte 0xFD, 0xE4, 0x1E, 0x02, 0x39, 0xE5, 0x1E, 0x02, 0x79, 0xE5, 0x1E, 0x02, 0xC9, 0xE5, 0x1E, 0x02
	.byte 0xE9, 0xE5, 0x1E, 0x02, 0x65, 0xE6, 0x1E, 0x02, 0x85, 0xE6, 0x1E, 0x02, 0xD1, 0xE6, 0x1E, 0x02
	.byte 0xF9, 0xE6, 0x1E, 0x02, 0x29, 0xE7, 0x1E, 0x02, 0xE5, 0xE7, 0x1E, 0x02, 0xF5, 0xE7, 0x1E, 0x02
	.byte 0x11, 0xE8, 0x1E, 0x02, 0x45, 0xC3, 0x1E, 0x02, 0x45, 0x1F, 0x1F, 0x02, 0x11, 0x20, 0x1F, 0x02
	.byte 0x7D, 0xE8, 0x1E, 0x02, 0x8D, 0xEC, 0x1E, 0x02, 0xFD, 0xEB, 0x1E, 0x02, 0x9D, 0xEC, 0x1E, 0x02
	.byte 0x29, 0xED, 0x1E, 0x02, 0xB9, 0xED, 0x1E, 0x02, 0x95, 0xEE, 0x1E, 0x02, 0xD5, 0xEE, 0x1E, 0x02
	.byte 0x35, 0xEF, 0x1E, 0x02, 0x8D, 0xEF, 0x1E, 0x02, 0x25, 0xF0, 0x1E, 0x02, 0x91, 0xF1, 0x1E, 0x02
	.byte 0xED, 0xF1, 0x1E, 0x02, 0x49, 0xF2, 0x1E, 0x02, 0xD5, 0xF6, 0x1E, 0x02, 0xE5, 0xF6, 0x1E, 0x02
	.byte 0xFD, 0xF6, 0x1E, 0x02, 0xAD, 0xF8, 0x1E, 0x02, 0x21, 0xF9, 0x1E, 0x02, 0x3D, 0xF9, 0x1E, 0x02
	.byte 0xBD, 0xF9, 0x1E, 0x02, 0xCD, 0xF9, 0x1E, 0x02, 0x65, 0xFB, 0x1E, 0x02, 0xE5, 0xFD, 0x1E, 0x02
	.byte 0xF5, 0xFD, 0x1E, 0x02, 0x01, 0xFF, 0x1E, 0x02, 0xA1, 0x00, 0x1F, 0x02, 0xBD, 0x00, 0x1F, 0x02
	.byte 0x21, 0x01, 0x1F, 0x02, 0x65, 0x01, 0x1F, 0x02, 0x75, 0x25, 0x1F, 0x02, 0x9D, 0x25, 0x1F, 0x02
	.byte 0xC5, 0x25, 0x1F, 0x02, 0xD5, 0x25, 0x1F, 0x02, 0x11, 0x26, 0x1F, 0x02, 0x1D, 0x26, 0x1F, 0x02
	.byte 0x25, 0x26, 0x1F, 0x02, 0x2D, 0x26, 0x1F, 0x02, 0x35, 0x26, 0x1F, 0x02, 0x3D, 0x26, 0x1F, 0x02
	.byte 0x91, 0x26, 0x1F, 0x02, 0xB5, 0x26, 0x1F, 0x02, 0xF1, 0x26, 0x1F, 0x02, 0x01, 0x27, 0x1F, 0x02
	.byte 0x19, 0x27, 0x1F, 0x02, 0x29, 0x27, 0x1F, 0x02, 0x35, 0x27, 0x1F, 0x02, 0x61, 0x27, 0x1F, 0x02
	.byte 0x6D, 0x27, 0x1F, 0x02, 0x79, 0x27, 0x1F, 0x02, 0xCD, 0x27, 0x1F, 0x02, 0xD5, 0x27, 0x1F, 0x02
	.byte 0x11, 0x28, 0x1F, 0x02, 0x19, 0x28, 0x1F, 0x02, 0x59, 0x28, 0x1F, 0x02, 0x75, 0x28, 0x1F, 0x02
	.byte 0x91, 0x28, 0x1F, 0x02, 0x99, 0x28, 0x1F, 0x02, 0xFD, 0x28, 0x1F, 0x02, 0x15, 0x29, 0x1F, 0x02
	.byte 0x31, 0x29, 0x1F, 0x02, 0xE5, 0x25, 0x1F, 0x02, 0x50, 0x60, 0x70, 0x90, 0xA0, 0xB0, 0x00, 0x00
	.byte 0x01, 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0xFF, 0x00, 0x00, 0x01, 0xFF, 0x01, 0xFF, 0x01, 0xFF
	.byte 0x0E, 0x0F, 0x05, 0x02, 0x0D, 0x0C, 0x06, 0x0B, 0x0A, 0x09, 0x00, 0x00, 0x18, 0x10, 0x40, 0x18
	.byte 0x18, 0x30, 0x40, 0x38, 0x18, 0x50, 0x40, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x45, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x28, 0x00, 0xD0, 0x00
	.byte 0x50, 0x00, 0xD8, 0x00, 0x28, 0x00, 0xF0, 0x00, 0x50, 0x00, 0xF8, 0x00, 0x28, 0x00, 0x10, 0x01
	.byte 0x50, 0x00, 0x18, 0x01, 0x35, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x18, 0x00, 0x30, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0xEB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x23, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x3B, 0x00, 0xEB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x29, 0xC1, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00
	.byte 0xFE, 0xC0, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2D, 0xC1, 0x00, 0x00
	.byte 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x1C, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x2D, 0xC1, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x8C, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x1D, 0xC1, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x1E, 0xC1, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0xEB, 0xFF, 0x00, 0x00, 0x01, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2D, 0xC1, 0x00, 0x00
	.byte 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF4, 0x00, 0xEB, 0xFF
	.byte 0x00, 0x00, 0x03, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x2D, 0xC1, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0xEB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x2D, 0xC1, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xD8, 0xFF, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2D, 0xC1, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00
	.byte 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xE4, 0xFF, 0x00, 0x00, 0x06, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x2D, 0xC1, 0x00, 0x00
	.byte 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x2D, 0xC1, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x2D, 0xC1, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0xFF, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1F, 0xC1, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x20, 0xC1, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x30, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x21, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC2, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x22, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x08, 0x05, 0x08, 0x02, 0x0F, 0x69, 0x00, 0x04, 0x01, 0x07, 0x08
	.byte 0x02, 0x0F, 0x79, 0x00, 0x04, 0x04, 0x09, 0x06, 0x02, 0x0F, 0x89, 0x00, 0x04, 0x01, 0x00, 0x1E
	.byte 0x03, 0x0F, 0x0F, 0x00, 0x04, 0x10, 0x05, 0x02, 0x02, 0x0F, 0x95, 0x00, 0x04, 0x01, 0x05, 0x06
	.byte 0x02, 0x0F, 0x99, 0x00, 0x04, 0x01, 0x0D, 0x08, 0x02, 0x0F, 0xA5, 0x00, 0x04, 0x01, 0x11, 0x0B
	.byte 0x02, 0x0F, 0xB5, 0x00, 0x04, 0x01, 0x15, 0x0C, 0x02, 0x0F, 0xCB, 0x00, 0x06, 0x01, 0x01, 0x0B
	.byte 0x02, 0x01, 0xEA, 0x03, 0x06, 0x01, 0x03, 0x0B, 0x02, 0x01, 0xD4, 0x03, 0x06, 0x01, 0x05, 0x0B
	.byte 0x02, 0x01, 0xBE, 0x03, 0x06, 0x01, 0x07, 0x0B, 0x02, 0x01, 0xA8, 0x03, 0x06, 0x01, 0x01, 0x0B
	.byte 0x02, 0x01, 0x92, 0x03, 0x06, 0x01, 0x03, 0x0B, 0x02, 0x01, 0x7C, 0x03, 0x06, 0x01, 0x05, 0x0B
	.byte 0x02, 0x01, 0x66, 0x03, 0x06, 0x01, 0x07, 0x0B, 0x02, 0x01, 0x50, 0x03, 0x04, 0x01, 0x0B, 0x08
	.byte 0x02, 0x0F, 0xE3, 0x00, 0x04, 0x01, 0x0F, 0x0B, 0x02, 0x0F, 0xF3, 0x00, 0x04, 0x01, 0x13, 0x0C
	.byte 0x02, 0x0F, 0x09, 0x01, 0x06, 0x01, 0x01, 0x0C, 0x02, 0x01, 0xE8, 0x03, 0x06, 0x04, 0x03, 0x1B
	.byte 0x06, 0x01, 0x2E, 0x03, 0x06, 0x01, 0x01, 0x0C, 0x02, 0x01, 0xD0, 0x03, 0x06, 0x04, 0x03, 0x1B
	.byte 0x06, 0x01, 0x8C, 0x02, 0x01, 0x00, 0x00, 0x0B, 0x03, 0x0C, 0xC7, 0x03, 0x01, 0x00, 0x00, 0x0B
	.byte 0x03, 0x02, 0xA6, 0x03, 0x01, 0x00, 0x00, 0x08, 0x03, 0x0C, 0x8E, 0x03, 0x01, 0x00, 0x00, 0x08
	.byte 0x03, 0x0C, 0x8E, 0x03, 0x01, 0x00, 0x00, 0x08, 0x03, 0x0C, 0x76, 0x03, 0x00, 0x00, 0x00, 0x0B
	.byte 0x03, 0x0C, 0x6D, 0x03, 0x00, 0x00, 0x00, 0x0B, 0x03, 0x0C, 0x4C, 0x03, 0x00, 0x00, 0x00, 0x0B
	.byte 0x03, 0x0C, 0x2B, 0x03, 0x00, 0x00, 0x00, 0x0B, 0x03, 0x0C, 0x0A, 0x03, 0x00, 0x00, 0x00, 0x0B
	.byte 0x03, 0x0C, 0xE9, 0x02, 0x00, 0x02, 0x0B, 0x07, 0x02, 0x01, 0x80, 0x03, 0x00, 0x02, 0x0F, 0x07
	.byte 0x02, 0x01, 0x72, 0x03, 0x01, 0x02, 0x0F, 0x07, 0x02, 0x01, 0x68, 0x03, 0x00, 0x02, 0x15, 0x1B
	.byte 0x02, 0x0B, 0xB3, 0x02, 0x00, 0x02, 0x01, 0x1B, 0x02, 0x0B, 0xB3, 0x02, 0x00, 0x02, 0x15, 0x13
	.byte 0x02, 0x0B, 0xB3, 0x02, 0x00, 0x02, 0x15, 0x1B, 0x02, 0x0B, 0x7D, 0x02, 0x00, 0x16, 0x10, 0x09
	.byte 0x04, 0x0C, 0x59, 0x02, 0x01, 0x00, 0x00, 0x11, 0x03, 0x0C, 0x35, 0x03, 0x01, 0x00, 0x00, 0x11
	.byte 0x03, 0x02, 0x02, 0x03, 0x38, 0x4F, 0x1E, 0x35, 0x40, 0x57, 0x42, 0x59, 0x58, 0x6F, 0x1E, 0x35
	.byte 0x60, 0x77, 0x42, 0x59, 0x78, 0x8F, 0x1E, 0x35, 0x80, 0x97, 0x42, 0x59, 0xFF, 0x00, 0x00, 0x00
	.byte 0x38, 0x4F, 0xB6, 0xCD, 0x40, 0x57, 0xDA, 0xF1, 0x58, 0x6F, 0xB6, 0xCD, 0x60, 0x77, 0xDA, 0xF1
	.byte 0x78, 0x8F, 0xB6, 0xCD, 0x80, 0x97, 0xDA, 0xF1, 0xFF, 0x00, 0x00, 0x00, 0x28, 0x3F, 0x0C, 0x23
	.byte 0x28, 0x3F, 0x24, 0x3B, 0x28, 0x3F, 0x3C, 0x53, 0x28, 0x3F, 0x54, 0x6B, 0x28, 0x3F, 0x6C, 0x83
	.byte 0x28, 0x3F, 0x84, 0x9B, 0x40, 0x57, 0x0C, 0x23, 0x40, 0x57, 0x24, 0x3B, 0x40, 0x57, 0x3C, 0x53
	.byte 0x40, 0x57, 0x54, 0x6B, 0x40, 0x57, 0x6C, 0x83, 0x40, 0x57, 0x84, 0x9B, 0x58, 0x6F, 0x0C, 0x23
	.byte 0x58, 0x6F, 0x24, 0x3B, 0x58, 0x6F, 0x3C, 0x53, 0x58, 0x6F, 0x54, 0x6B, 0x58, 0x6F, 0x6C, 0x83
	.byte 0x58, 0x6F, 0x84, 0x9B, 0x70, 0x87, 0x0C, 0x23, 0x70, 0x87, 0x24, 0x3B, 0x70, 0x87, 0x3C, 0x53
	.byte 0x70, 0x87, 0x54, 0x6B, 0x70, 0x87, 0x6C, 0x83, 0x70, 0x87, 0x84, 0x9B, 0x88, 0x9F, 0x0C, 0x23
	.byte 0x88, 0x9F, 0x24, 0x3B, 0x88, 0x9F, 0x3C, 0x53, 0x88, 0x9F, 0x54, 0x6B, 0x88, 0x9F, 0x6C, 0x83
	.byte 0x88, 0x9F, 0x84, 0x9B, 0xFF, 0x00, 0x00, 0x00, 0xA8, 0xBF, 0x00, 0x87, 0x79, 0x78, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0xF9, 0x78, 0x1F, 0x02, 0x2D, 0x7A, 0x1F, 0x02, 0x09, 0x6F, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x8D, 0x6B, 0x1F, 0x02, 0x71, 0x6F, 0x1F, 0x02, 0x3D, 0x6C, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x8D, 0x6B, 0x1F, 0x02, 0xA5, 0x6B, 0x1F, 0x02, 0x95, 0x6C, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x15, 0x6D, 0x1F, 0x02, 0x69, 0x6E, 0x1F, 0x02, 0x89, 0x76, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x01, 0x77, 0x1F, 0x02, 0x55, 0x78, 0x1F, 0x02, 0xE5, 0x73, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x45, 0x74, 0x1F, 0x02, 0xA5, 0x6B, 0x1F, 0x02, 0xF5, 0x70, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x85, 0x71, 0x1F, 0x02, 0x09, 0x73, 0x1F, 0x02, 0x11, 0x70, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x8D, 0x70, 0x1F, 0x02, 0xA5, 0x70, 0x1F, 0x02, 0x61, 0x6B, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x8D, 0x6B, 0x1F, 0x02, 0xA5, 0x6B, 0x1F, 0x02, 0x21, 0x76, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x71, 0x76, 0x1F, 0x02, 0xA5, 0x6B, 0x1F, 0x02, 0x29, 0x75, 0x1F, 0x02
	.byte 0x7D, 0x6B, 0x1F, 0x02, 0x95, 0x75, 0x1F, 0x02, 0xAD, 0x75, 0x1F, 0x02, 0x3C, 0x4B, 0xBC, 0xCB
	.byte 0x3C, 0x4B, 0xDC, 0xEB, 0x54, 0x63, 0xBC, 0xCB, 0x54, 0x63, 0xDC, 0xEB, 0x6C, 0x7B, 0xBC, 0xCB
	.byte 0x6C, 0x7B, 0xDC, 0xEB, 0x82, 0x9D, 0xB2, 0xF5, 0xA2, 0xBD, 0xB2, 0xF5, 0xFF, 0x00, 0x00, 0x00
	.byte 0x17, 0x2E, 0x2F, 0x46, 0x17, 0x2E, 0x5D, 0x74, 0x17, 0x2E, 0x8B, 0xA2, 0x17, 0x2E, 0xB9, 0xD0
	.byte 0x17, 0x2E, 0x02, 0x17, 0x17, 0x2E, 0xE8, 0xFD, 0x70, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x38, 0x4F, 0x1E, 0x35, 0x40, 0x57, 0x42, 0x59, 0x58, 0x6F, 0x1E, 0x35
	.byte 0x60, 0x77, 0x42, 0x59, 0x78, 0x8F, 0x1E, 0x35, 0x80, 0x97, 0x42, 0x59, 0xA2, 0xBD, 0x1A, 0x5D
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0x88, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x47, 0x5E, 0x1F, 0x36, 0x47, 0x5E, 0x41, 0x58, 0x47, 0x5E, 0x63, 0x7A, 0x47, 0x5E, 0x85, 0x9C
	.byte 0x47, 0x5E, 0xA7, 0xBE, 0x47, 0x5E, 0xC9, 0xE0, 0x47, 0x5E, 0x01, 0x16, 0x47, 0x5E, 0xE9, 0xFE
	.byte 0x70, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x38, 0x4F, 0x1E, 0x35
	.byte 0x40, 0x57, 0x42, 0x59, 0x58, 0x6F, 0x1E, 0x35, 0x60, 0x77, 0x42, 0x59, 0x78, 0x8F, 0x1E, 0x35
	.byte 0x80, 0x97, 0x42, 0x59, 0xA8, 0xBF, 0xC0, 0xFF, 0x40, 0x57, 0xA8, 0xFF, 0x58, 0x6F, 0xA8, 0xFF
	.byte 0x70, 0x87, 0xA8, 0xFF, 0x88, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x0F, 0x26, 0x1F, 0x36, 0x0F, 0x26, 0x41, 0x58, 0x0F, 0x26, 0x63, 0x7A, 0x0F, 0x26, 0x85, 0x9C
	.byte 0x0F, 0x26, 0xA7, 0xBE, 0x0F, 0x26, 0xC9, 0xE0, 0x0F, 0x26, 0x01, 0x16, 0x0F, 0x26, 0xE9, 0xFE
	.byte 0x40, 0x6F, 0xA8, 0xFF, 0x70, 0x87, 0xA8, 0xFF, 0x88, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00, 0x38, 0x4F, 0x1E, 0x35, 0x40, 0x57, 0x42, 0x59, 0x58, 0x6F, 0x1E, 0x35
	.byte 0x60, 0x77, 0x42, 0x59, 0x78, 0x8F, 0x1E, 0x35, 0x80, 0x97, 0x42, 0x59, 0xA2, 0xBD, 0x1A, 0x5D
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0x28, 0x3F, 0xA8, 0xFF, 0x40, 0x57, 0xA8, 0xFF, 0x58, 0x6F, 0xA8, 0xFF
	.byte 0x70, 0x87, 0xA8, 0xFF, 0x88, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0xCC, 0x38, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0xEC, 0x38, 0x00, 0x00, 0x01, 0x03, 0x00, 0x01
	.byte 0xCC, 0x50, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03, 0xEC, 0x50, 0x00, 0x00, 0x01, 0x05, 0x02, 0x03
	.byte 0xCC, 0x68, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xEC, 0x68, 0x00, 0x00, 0x03, 0x06, 0x04, 0x05
	.byte 0xD4, 0x82, 0x00, 0x00, 0x84, 0x07, 0x06, 0x06, 0xD4, 0xA2, 0x00, 0x00, 0x06, 0x07, 0x07, 0x07
	.byte 0x3B, 0x1F, 0x00, 0x00, 0x00, 0x06, 0x03, 0x01, 0x69, 0x1F, 0x00, 0x00, 0x01, 0x06, 0x00, 0x02
	.byte 0x97, 0x1F, 0x00, 0x00, 0x02, 0x06, 0x01, 0x03, 0xC5, 0x1F, 0x00, 0x00, 0x03, 0x06, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x04, 0x04, 0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x05, 0x05
	.byte 0xD4, 0x70, 0x00, 0x00, 0x00, 0x07, 0x06, 0x06, 0xE0, 0xA8, 0x00, 0x00, 0x06, 0x07, 0x07, 0x07
	.byte 0x2B, 0x53, 0x00, 0x00, 0x00, 0x08, 0x05, 0x01, 0x4D, 0x53, 0x00, 0x00, 0x01, 0x08, 0x00, 0x02
	.byte 0x6F, 0x53, 0x00, 0x00, 0x02, 0x08, 0x01, 0x03, 0x91, 0x53, 0x00, 0x00, 0x03, 0x08, 0x02, 0x04
	.byte 0xB3, 0x53, 0x00, 0x00, 0x04, 0x08, 0x03, 0x05, 0xD5, 0x53, 0x00, 0x00, 0x05, 0x08, 0x04, 0x00
	.byte 0x0C, 0x53, 0x00, 0x00, 0x06, 0x06, 0x06, 0x06, 0xF4, 0x53, 0x00, 0x00, 0x07, 0x07, 0x07, 0x07
	.byte 0xD4, 0x70, 0x00, 0x00, 0x00, 0x09, 0x08, 0x08, 0xE0, 0xA8, 0x00, 0x00, 0x08, 0x09, 0x09, 0x09
	.byte 0x28, 0x34, 0x00, 0x00, 0x04, 0x02, 0x00, 0x01, 0x50, 0x3C, 0x00, 0x00, 0x05, 0x03, 0x00, 0x02
	.byte 0x28, 0x54, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03, 0x50, 0x5C, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x28, 0x74, 0x00, 0x00, 0x02, 0x06, 0x03, 0x05, 0x50, 0x7C, 0x00, 0x00, 0x03, 0x06, 0x04, 0x06
	.byte 0x3C, 0xA2, 0x00, 0x00, 0x85, 0x07, 0x05, 0x07, 0xE0, 0xA8, 0x00, 0x00, 0x06, 0x07, 0x06, 0x07
	.byte 0xD4, 0x88, 0x00, 0x00, 0x09, 0x09, 0x08, 0x08, 0xE0, 0xA8, 0x00, 0x00, 0x08, 0x08, 0x09, 0x09
	.byte 0x2B, 0x17, 0x00, 0x00, 0x00, 0x08, 0x05, 0x01, 0x4D, 0x17, 0x00, 0x00, 0x01, 0x08, 0x00, 0x02
	.byte 0x6F, 0x17, 0x00, 0x00, 0x02, 0x08, 0x01, 0x03, 0x91, 0x17, 0x00, 0x00, 0x03, 0x08, 0x02, 0x04
	.byte 0xB3, 0x17, 0x00, 0x00, 0x04, 0x08, 0x03, 0x05, 0xD5, 0x17, 0x00, 0x00, 0x05, 0x08, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x06, 0x06, 0x06, 0x00, 0x00, 0x00, 0x00, 0x07, 0x07, 0x07, 0x07
	.byte 0xD4, 0x40, 0x00, 0x00, 0x00, 0x09, 0x08, 0x08, 0xD4, 0x70, 0x00, 0x00, 0x08, 0x0A, 0x09, 0x09
	.byte 0xD4, 0x88, 0x00, 0x00, 0x09, 0x0B, 0x0A, 0x0A, 0xE0, 0xA8, 0x00, 0x00, 0x0A, 0x0B, 0x0B, 0x0B
	.byte 0x28, 0x34, 0x00, 0x00, 0x06, 0x02, 0x00, 0x01, 0x50, 0x3C, 0x00, 0x00, 0x06, 0x03, 0x00, 0x02
	.byte 0x28, 0x54, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03, 0x50, 0x5C, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x28, 0x74, 0x00, 0x00, 0x02, 0x06, 0x03, 0x05, 0x50, 0x7C, 0x00, 0x00, 0x03, 0x06, 0x04, 0x06
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x85, 0x00, 0x05, 0x06, 0xD4, 0x40, 0x00, 0x00, 0x0B, 0x08, 0x07, 0x07
	.byte 0xD4, 0x58, 0x00, 0x00, 0x07, 0x09, 0x08, 0x08, 0xD4, 0x70, 0x00, 0x00, 0x08, 0x0A, 0x09, 0x09
	.byte 0xD4, 0x88, 0x00, 0x00, 0x09, 0x0B, 0x0A, 0x0A, 0xE0, 0xA8, 0x00, 0x00, 0x0A, 0x07, 0x0B, 0x0B
	.byte 0x28, 0x34, 0x00, 0x00, 0x07, 0x02, 0x00, 0x01, 0x50, 0x3C, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02
	.byte 0x28, 0x54, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03, 0x50, 0x5C, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x28, 0x74, 0x00, 0x00, 0x02, 0x06, 0x03, 0x05, 0x50, 0x7C, 0x00, 0x00, 0x03, 0x06, 0x04, 0x06
	.byte 0x3C, 0xA2, 0x00, 0x00, 0x85, 0x07, 0x05, 0x07, 0xE0, 0xA8, 0x00, 0x00, 0x06, 0x00, 0x06, 0x07
	.byte 0xD4, 0x28, 0x00, 0x00, 0x0D, 0x09, 0x08, 0x08, 0xD4, 0x40, 0x00, 0x00, 0x08, 0x0A, 0x09, 0x09
	.byte 0xD4, 0x58, 0x00, 0x00, 0x09, 0x0B, 0x0A, 0x0A, 0xD4, 0x70, 0x00, 0x00, 0x0A, 0x0C, 0x0B, 0x0B
	.byte 0xD4, 0x88, 0x00, 0x00, 0x0B, 0x0D, 0x0C, 0x0C, 0xE0, 0xA8, 0x00, 0x00, 0x0C, 0x08, 0x0D, 0x0D
	.byte 0x1C, 0x88, 0x1F, 0x02, 0x40, 0x8A, 0x1F, 0x02, 0xEC, 0x86, 0x1F, 0x02, 0xF0, 0x87, 0x1F, 0x02
	.byte 0x40, 0x89, 0x1F, 0x02, 0xFC, 0x86, 0x1F, 0x02, 0x30, 0x8C, 0x1F, 0x02, 0x68, 0x8F, 0x1F, 0x02
	.byte 0xDC, 0x86, 0x1F, 0x02, 0xD0, 0x8C, 0x1F, 0x02, 0xA0, 0x90, 0x1F, 0x02, 0x3C, 0x87, 0x1F, 0x02
	.byte 0x7C, 0x8D, 0x1F, 0x02, 0xF0, 0x91, 0x1F, 0x02, 0x2C, 0x87, 0x1F, 0x02, 0x84, 0x88, 0x1F, 0x02
	.byte 0xA0, 0x8A, 0x1F, 0x02, 0x1C, 0x87, 0x1F, 0x02, 0x94, 0x8B, 0x1F, 0x02, 0x38, 0x8E, 0x1F, 0x02
	.byte 0x6C, 0x87, 0x1F, 0x02, 0xC4, 0x87, 0x1F, 0x02, 0x90, 0x89, 0x1F, 0x02, 0x5C, 0x87, 0x1F, 0x02
	.byte 0x7C, 0x87, 0x1F, 0x02, 0xC0, 0x88, 0x1F, 0x02, 0x4C, 0x87, 0x1F, 0x02, 0x50, 0x88, 0x1F, 0x02
	.byte 0xE0, 0x89, 0x1F, 0x02, 0x0C, 0x87, 0x1F, 0x02, 0xA0, 0x87, 0x1F, 0x02, 0x00, 0x89, 0x1F, 0x02
	.byte 0xCC, 0x86, 0x1F, 0x02, 0x28, 0x3F, 0x0C, 0x23, 0x28, 0x3F, 0x24, 0x3B, 0x28, 0x3F, 0x3C, 0x53
	.byte 0x28, 0x3F, 0x54, 0x6B, 0x28, 0x3F, 0x6C, 0x83, 0x28, 0x3F, 0x84, 0x9B, 0x40, 0x57, 0x0C, 0x23
	.byte 0x40, 0x57, 0x24, 0x3B, 0x40, 0x57, 0x3C, 0x53, 0x40, 0x57, 0x54, 0x6B, 0x40, 0x57, 0x6C, 0x83
	.byte 0x40, 0x57, 0x84, 0x9B, 0x58, 0x6F, 0x0C, 0x23, 0x58, 0x6F, 0x24, 0x3B, 0x58, 0x6F, 0x3C, 0x53
	.byte 0x58, 0x6F, 0x54, 0x6B, 0x58, 0x6F, 0x6C, 0x83, 0x58, 0x6F, 0x84, 0x9B, 0x70, 0x87, 0x0C, 0x23
	.byte 0x70, 0x87, 0x24, 0x3B, 0x70, 0x87, 0x3C, 0x53, 0x70, 0x87, 0x54, 0x6B, 0x70, 0x87, 0x6C, 0x83
	.byte 0x70, 0x87, 0x84, 0x9B, 0x88, 0x9F, 0x0C, 0x23, 0x88, 0x9F, 0x24, 0x3B, 0x88, 0x9F, 0x3C, 0x53
	.byte 0x88, 0x9F, 0x54, 0x6B, 0x88, 0x9F, 0x6C, 0x83, 0x88, 0x9F, 0x84, 0x9B, 0x11, 0x27, 0x1A, 0x8D
	.byte 0x11, 0x26, 0x01, 0x16, 0x11, 0x26, 0x91, 0xA6, 0xA8, 0xBF, 0x00, 0x57, 0xA8, 0xBF, 0x60, 0xB7
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0x88, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x28, 0x3F, 0x0C, 0x23, 0x28, 0x3F, 0x24, 0x3B, 0x28, 0x3F, 0x3C, 0x53, 0x28, 0x3F, 0x54, 0x6B
	.byte 0x28, 0x3F, 0x6C, 0x83, 0x28, 0x3F, 0x84, 0x9B, 0x40, 0x57, 0x0C, 0x23, 0x40, 0x57, 0x24, 0x3B
	.byte 0x40, 0x57, 0x3C, 0x53, 0x40, 0x57, 0x54, 0x6B, 0x40, 0x57, 0x6C, 0x83, 0x40, 0x57, 0x84, 0x9B
	.byte 0x58, 0x6F, 0x0C, 0x23, 0x58, 0x6F, 0x24, 0x3B, 0x58, 0x6F, 0x3C, 0x53, 0x58, 0x6F, 0x54, 0x6B
	.byte 0x58, 0x6F, 0x6C, 0x83, 0x58, 0x6F, 0x84, 0x9B, 0x70, 0x87, 0x0C, 0x23, 0x70, 0x87, 0x24, 0x3B
	.byte 0x70, 0x87, 0x3C, 0x53, 0x70, 0x87, 0x54, 0x6B, 0x70, 0x87, 0x6C, 0x83, 0x70, 0x87, 0x84, 0x9B
	.byte 0x88, 0x9F, 0x0C, 0x23, 0x88, 0x9F, 0x24, 0x3B, 0x88, 0x9F, 0x3C, 0x53, 0x88, 0x9F, 0x54, 0x6B
	.byte 0x88, 0x9F, 0x6C, 0x83, 0x88, 0x9F, 0x84, 0x9B, 0x11, 0x27, 0x1A, 0x8D, 0x11, 0x26, 0x01, 0x16
	.byte 0x11, 0x26, 0x91, 0xA6, 0xA8, 0xBF, 0xC0, 0xFF, 0x40, 0x57, 0xA8, 0xFF, 0x58, 0x6F, 0xA8, 0xFF
	.byte 0x70, 0x87, 0xA8, 0xFF, 0x88, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00
	.byte 0x28, 0x3F, 0x0C, 0x23, 0x28, 0x3F, 0x24, 0x3B, 0x28, 0x3F, 0x3C, 0x53, 0x28, 0x3F, 0x54, 0x6B
	.byte 0x28, 0x3F, 0x6C, 0x83, 0x28, 0x3F, 0x84, 0x9B, 0x40, 0x57, 0x0C, 0x23, 0x40, 0x57, 0x24, 0x3B
	.byte 0x40, 0x57, 0x3C, 0x53, 0x40, 0x57, 0x54, 0x6B, 0x40, 0x57, 0x6C, 0x83, 0x40, 0x57, 0x84, 0x9B
	.byte 0x58, 0x6F, 0x0C, 0x23, 0x58, 0x6F, 0x24, 0x3B, 0x58, 0x6F, 0x3C, 0x53, 0x58, 0x6F, 0x54, 0x6B
	.byte 0x58, 0x6F, 0x6C, 0x83, 0x58, 0x6F, 0x84, 0x9B, 0x70, 0x87, 0x0C, 0x23, 0x70, 0x87, 0x24, 0x3B
	.byte 0x70, 0x87, 0x3C, 0x53, 0x70, 0x87, 0x54, 0x6B, 0x70, 0x87, 0x6C, 0x83, 0x70, 0x87, 0x84, 0x9B
	.byte 0x88, 0x9F, 0x0C, 0x23, 0x88, 0x9F, 0x24, 0x3B, 0x88, 0x9F, 0x3C, 0x53, 0x88, 0x9F, 0x54, 0x6B
	.byte 0x88, 0x9F, 0x6C, 0x83, 0x88, 0x9F, 0x84, 0x9B, 0x11, 0x27, 0x1A, 0x8D, 0x11, 0x26, 0x01, 0x16
	.byte 0x11, 0x26, 0x91, 0xA6, 0xA8, 0xBF, 0x00, 0x57, 0xA8, 0xBF, 0x60, 0xB7, 0xA8, 0xBF, 0xC0, 0xFF
	.byte 0x28, 0x3F, 0xA8, 0xFF, 0x40, 0x57, 0xA8, 0xFF, 0x58, 0x6F, 0xA8, 0xFF, 0x70, 0x87, 0xA8, 0xFF
	.byte 0x88, 0x9F, 0xA8, 0xFF, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x28, 0x3F, 0x0C, 0x23
	.byte 0x28, 0x3F, 0x24, 0x3B, 0x28, 0x3F, 0x3C, 0x53, 0x28, 0x3F, 0x54, 0x6B, 0x28, 0x3F, 0x6C, 0x83
	.byte 0x28, 0x3F, 0x84, 0x9B, 0x40, 0x57, 0x0C, 0x23, 0x40, 0x57, 0x24, 0x3B, 0x40, 0x57, 0x3C, 0x53
	.byte 0x40, 0x57, 0x54, 0x6B, 0x40, 0x57, 0x6C, 0x83, 0x40, 0x57, 0x84, 0x9B, 0x58, 0x6F, 0x0C, 0x23
	.byte 0x58, 0x6F, 0x24, 0x3B, 0x58, 0x6F, 0x3C, 0x53, 0x58, 0x6F, 0x54, 0x6B, 0x58, 0x6F, 0x6C, 0x83
	.byte 0x58, 0x6F, 0x84, 0x9B, 0x70, 0x87, 0x0C, 0x23, 0x70, 0x87, 0x24, 0x3B, 0x70, 0x87, 0x3C, 0x53
	.byte 0x70, 0x87, 0x54, 0x6B, 0x70, 0x87, 0x6C, 0x83, 0x70, 0x87, 0x84, 0x9B, 0x88, 0x9F, 0x0C, 0x23
	.byte 0x88, 0x9F, 0x24, 0x3B, 0x88, 0x9F, 0x3C, 0x53, 0x88, 0x9F, 0x54, 0x6B, 0x88, 0x9F, 0x6C, 0x83
	.byte 0x88, 0x9F, 0x84, 0x9B, 0x38, 0x4F, 0xB6, 0xCD, 0x40, 0x57, 0xDA, 0xF1, 0x58, 0x6F, 0xB6, 0xCD
	.byte 0x60, 0x77, 0xDA, 0xF1, 0x78, 0x8F, 0xB6, 0xCD, 0x80, 0x97, 0xDA, 0xF1, 0xA2, 0xBD, 0xB2, 0xF5
	.byte 0x0F, 0x26, 0x1F, 0x36, 0x0F, 0x26, 0x41, 0x58, 0x0F, 0x26, 0x63, 0x7A, 0x0F, 0x26, 0x85, 0x9C
	.byte 0x0F, 0x26, 0xA7, 0xBE, 0x0F, 0x26, 0xC9, 0xE0, 0x0F, 0x26, 0x01, 0x16, 0x0F, 0x26, 0xE9, 0xFE
	.byte 0xA8, 0xBF, 0x00, 0x87, 0xFF, 0x00, 0x00, 0x00, 0x18, 0x24, 0x00, 0x00, 0x1E, 0x06, 0x05, 0x01
	.byte 0x30, 0x24, 0x00, 0x00, 0x1E, 0x07, 0x00, 0x02, 0x48, 0x24, 0x00, 0x00, 0x1E, 0x08, 0x01, 0x03
	.byte 0x60, 0x24, 0x00, 0x00, 0x1E, 0x09, 0x02, 0x04, 0x78, 0x24, 0x00, 0x00, 0x1E, 0x0A, 0x03, 0x05
	.byte 0x90, 0x24, 0x00, 0x00, 0x1E, 0x0B, 0x04, 0x00, 0x18, 0x3C, 0x00, 0x00, 0x00, 0x0C, 0x0B, 0x07
	.byte 0x30, 0x3C, 0x00, 0x00, 0x01, 0x0D, 0x06, 0x08, 0x48, 0x3C, 0x00, 0x00, 0x02, 0x0E, 0x07, 0x09
	.byte 0x60, 0x3C, 0x00, 0x00, 0x03, 0x0F, 0x08, 0x0A, 0x78, 0x3C, 0x00, 0x00, 0x04, 0x10, 0x09, 0x0B
	.byte 0x90, 0x3C, 0x00, 0x00, 0x05, 0x11, 0x0A, 0x06, 0x18, 0x54, 0x00, 0x00, 0x06, 0x12, 0x11, 0x0D
	.byte 0x30, 0x54, 0x00, 0x00, 0x07, 0x13, 0x0C, 0x0E, 0x48, 0x54, 0x00, 0x00, 0x08, 0x14, 0x0D, 0x0F
	.byte 0x60, 0x54, 0x00, 0x00, 0x09, 0x15, 0x0E, 0x10, 0x78, 0x54, 0x00, 0x00, 0x0A, 0x16, 0x0F, 0x11
	.byte 0x90, 0x54, 0x00, 0x00, 0x0B, 0x17, 0x10, 0x0C, 0x18, 0x6C, 0x00, 0x00, 0x0C, 0x18, 0x17, 0x13
	.byte 0x30, 0x6C, 0x00, 0x00, 0x0D, 0x19, 0x12, 0x14, 0x48, 0x6C, 0x00, 0x00, 0x0E, 0x1A, 0x13, 0x15
	.byte 0x60, 0x6C, 0x00, 0x00, 0x0F, 0x1B, 0x14, 0x16, 0x78, 0x6C, 0x00, 0x00, 0x10, 0x1C, 0x15, 0x17
	.byte 0x90, 0x6C, 0x00, 0x00, 0x11, 0x1D, 0x16, 0x12, 0x18, 0x84, 0x00, 0x00, 0x12, 0xA1, 0x1D, 0x19
	.byte 0x30, 0x84, 0x00, 0x00, 0x13, 0xA1, 0x18, 0x1A, 0x48, 0x84, 0x00, 0x00, 0x14, 0xA1, 0x19, 0x1B
	.byte 0x60, 0x84, 0x00, 0x00, 0x15, 0xA1, 0x1A, 0x1C, 0x78, 0x84, 0x00, 0x00, 0x16, 0xA1, 0x1B, 0x1D
	.byte 0x90, 0x84, 0x00, 0x00, 0x17, 0xA1, 0x1C, 0x18, 0x54, 0x10, 0x00, 0x00, 0x21, 0x80, 0x1E, 0x1E
	.byte 0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F, 0x1F, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x20, 0x20, 0x20, 0x20
	.byte 0x2C, 0xA8, 0x00, 0x00, 0x98, 0x1E, 0x21, 0x22, 0x8C, 0xA8, 0x00, 0x00, 0x98, 0x1E, 0x21, 0x23
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x98, 0x1E, 0x22, 0x23, 0xD4, 0x88, 0x00, 0x00, 0x25, 0x25, 0x24, 0x24
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x24, 0x24, 0x25, 0x25, 0x18, 0x24, 0x00, 0x00, 0x1E, 0x06, 0x05, 0x01
	.byte 0x30, 0x24, 0x00, 0x00, 0x1E, 0x07, 0x00, 0x02, 0x48, 0x24, 0x00, 0x00, 0x1E, 0x08, 0x01, 0x03
	.byte 0x60, 0x24, 0x00, 0x00, 0x1E, 0x09, 0x02, 0x04, 0x78, 0x24, 0x00, 0x00, 0x1E, 0x0A, 0x03, 0x05
	.byte 0x90, 0x24, 0x00, 0x00, 0x1E, 0x0B, 0x04, 0x00, 0x18, 0x3C, 0x00, 0x00, 0x00, 0x0C, 0x0B, 0x07
	.byte 0x30, 0x3C, 0x00, 0x00, 0x01, 0x0D, 0x06, 0x08, 0x48, 0x3C, 0x00, 0x00, 0x02, 0x0E, 0x07, 0x09
	.byte 0x60, 0x3C, 0x00, 0x00, 0x03, 0x0F, 0x08, 0x0A, 0x78, 0x3C, 0x00, 0x00, 0x04, 0x10, 0x09, 0x0B
	.byte 0x90, 0x3C, 0x00, 0x00, 0x05, 0x11, 0x0A, 0x06, 0x18, 0x54, 0x00, 0x00, 0x06, 0x12, 0x11, 0x0D
	.byte 0x30, 0x54, 0x00, 0x00, 0x07, 0x13, 0x0C, 0x0E, 0x48, 0x54, 0x00, 0x00, 0x08, 0x14, 0x0D, 0x0F
	.byte 0x60, 0x54, 0x00, 0x00, 0x09, 0x15, 0x0E, 0x10, 0x78, 0x54, 0x00, 0x00, 0x0A, 0x16, 0x0F, 0x11
	.byte 0x90, 0x54, 0x00, 0x00, 0x0B, 0x17, 0x10, 0x0C, 0x18, 0x6C, 0x00, 0x00, 0x0C, 0x18, 0x17, 0x13
	.byte 0x30, 0x6C, 0x00, 0x00, 0x0D, 0x19, 0x12, 0x14, 0x48, 0x6C, 0x00, 0x00, 0x0E, 0x1A, 0x13, 0x15
	.byte 0x60, 0x6C, 0x00, 0x00, 0x0F, 0x1B, 0x14, 0x16, 0x78, 0x6C, 0x00, 0x00, 0x10, 0x1C, 0x15, 0x17
	.byte 0x90, 0x6C, 0x00, 0x00, 0x11, 0x1D, 0x16, 0x12, 0x18, 0x84, 0x00, 0x00, 0x12, 0x21, 0x1D, 0x19
	.byte 0x30, 0x84, 0x00, 0x00, 0x13, 0x21, 0x18, 0x1A, 0x48, 0x84, 0x00, 0x00, 0x14, 0x21, 0x19, 0x1B
	.byte 0x60, 0x84, 0x00, 0x00, 0x15, 0x21, 0x1A, 0x1C, 0x78, 0x84, 0x00, 0x00, 0x16, 0x21, 0x1B, 0x1D
	.byte 0x90, 0x84, 0x00, 0x00, 0x17, 0x21, 0x1C, 0x18, 0x54, 0x10, 0x00, 0x00, 0x21, 0x80, 0x1E, 0x1E
	.byte 0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F, 0x1F, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x20, 0x20, 0x20, 0x20
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x98, 0x1E, 0x21, 0x21, 0xD4, 0x40, 0x00, 0x00, 0x26, 0x23, 0x22, 0x22
	.byte 0xD4, 0x58, 0x00, 0x00, 0x22, 0x24, 0x23, 0x23, 0xD4, 0x70, 0x00, 0x00, 0x23, 0x25, 0x24, 0x24
	.byte 0xD4, 0x88, 0x00, 0x00, 0x24, 0x26, 0x25, 0x25, 0xE0, 0xA8, 0x00, 0x00, 0x25, 0x22, 0x26, 0x26
	.byte 0x18, 0x24, 0x00, 0x00, 0x1E, 0x06, 0x05, 0x01, 0x30, 0x24, 0x00, 0x00, 0x1E, 0x07, 0x00, 0x02
	.byte 0x48, 0x24, 0x00, 0x00, 0x1E, 0x08, 0x01, 0x03, 0x60, 0x24, 0x00, 0x00, 0x1E, 0x09, 0x02, 0x04
	.byte 0x78, 0x24, 0x00, 0x00, 0x1E, 0x0A, 0x03, 0x05, 0x90, 0x24, 0x00, 0x00, 0x1E, 0x0B, 0x04, 0x00
	.byte 0x18, 0x3C, 0x00, 0x00, 0x00, 0x0C, 0x0B, 0x07, 0x30, 0x3C, 0x00, 0x00, 0x01, 0x0D, 0x06, 0x08
	.byte 0x48, 0x3C, 0x00, 0x00, 0x02, 0x0E, 0x07, 0x09, 0x60, 0x3C, 0x00, 0x00, 0x03, 0x0F, 0x08, 0x0A
	.byte 0x78, 0x3C, 0x00, 0x00, 0x04, 0x10, 0x09, 0x0B, 0x90, 0x3C, 0x00, 0x00, 0x05, 0x11, 0x0A, 0x06
	.byte 0x18, 0x54, 0x00, 0x00, 0x06, 0x12, 0x11, 0x0D, 0x30, 0x54, 0x00, 0x00, 0x07, 0x13, 0x0C, 0x0E
	.byte 0x48, 0x54, 0x00, 0x00, 0x08, 0x14, 0x0D, 0x0F, 0x60, 0x54, 0x00, 0x00, 0x09, 0x15, 0x0E, 0x10
	.byte 0x78, 0x54, 0x00, 0x00, 0x0A, 0x16, 0x0F, 0x11, 0x90, 0x54, 0x00, 0x00, 0x0B, 0x17, 0x10, 0x0C
	.byte 0x18, 0x6C, 0x00, 0x00, 0x0C, 0x18, 0x17, 0x13, 0x30, 0x6C, 0x00, 0x00, 0x0D, 0x19, 0x12, 0x14
	.byte 0x48, 0x6C, 0x00, 0x00, 0x0E, 0x1A, 0x13, 0x15, 0x60, 0x6C, 0x00, 0x00, 0x0F, 0x1B, 0x14, 0x16
	.byte 0x78, 0x6C, 0x00, 0x00, 0x10, 0x1C, 0x15, 0x17, 0x90, 0x6C, 0x00, 0x00, 0x11, 0x1D, 0x16, 0x12
	.byte 0x18, 0x84, 0x00, 0x00, 0x12, 0xA1, 0x1D, 0x19, 0x30, 0x84, 0x00, 0x00, 0x13, 0xA1, 0x18, 0x1A
	.byte 0x48, 0x84, 0x00, 0x00, 0x14, 0xA1, 0x19, 0x1B, 0x60, 0x84, 0x00, 0x00, 0x15, 0xA1, 0x1A, 0x1C
	.byte 0x78, 0x84, 0x00, 0x00, 0x16, 0xA1, 0x1B, 0x1D, 0x90, 0x84, 0x00, 0x00, 0x17, 0xA1, 0x1C, 0x18
	.byte 0x54, 0x10, 0x00, 0x00, 0x21, 0x80, 0x1E, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F, 0x1F, 0x1F
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x20, 0x20, 0x20, 0x2C, 0xA8, 0x00, 0x00, 0x98, 0x1E, 0x21, 0x22
	.byte 0x8C, 0xA8, 0x00, 0x00, 0x98, 0x1E, 0x21, 0x23, 0xE0, 0xA8, 0x00, 0x00, 0x98, 0x1E, 0x22, 0x23
	.byte 0xD4, 0x28, 0x00, 0x00, 0x29, 0x25, 0x24, 0x24, 0xD4, 0x40, 0x00, 0x00, 0x24, 0x26, 0x25, 0x25
	.byte 0xD4, 0x58, 0x00, 0x00, 0x25, 0x27, 0x26, 0x26, 0xD4, 0x70, 0x00, 0x00, 0x26, 0x28, 0x27, 0x27
	.byte 0xD4, 0x88, 0x00, 0x00, 0x27, 0x29, 0x28, 0x28, 0xE0, 0xA8, 0x00, 0x00, 0x28, 0x24, 0x29, 0x29
	.byte 0x18, 0x24, 0x00, 0x00, 0x25, 0x06, 0x1F, 0x01, 0x30, 0x24, 0x00, 0x00, 0x25, 0x07, 0x00, 0x02
	.byte 0x48, 0x24, 0x00, 0x00, 0x25, 0x08, 0x01, 0x03, 0x60, 0x24, 0x00, 0x00, 0x25, 0x09, 0x02, 0x04
	.byte 0x78, 0x24, 0x00, 0x00, 0x25, 0x0A, 0x03, 0x05, 0x90, 0x24, 0x00, 0x00, 0x25, 0x0B, 0x04, 0x9E
	.byte 0x18, 0x3C, 0x00, 0x00, 0x00, 0x0C, 0x1F, 0x07, 0x30, 0x3C, 0x00, 0x00, 0x01, 0x0D, 0x06, 0x08
	.byte 0x48, 0x3C, 0x00, 0x00, 0x02, 0x0E, 0x07, 0x09, 0x60, 0x3C, 0x00, 0x00, 0x03, 0x0F, 0x08, 0x0A
	.byte 0x78, 0x3C, 0x00, 0x00, 0x04, 0x10, 0x09, 0x0B, 0x90, 0x3C, 0x00, 0x00, 0x05, 0x11, 0x0A, 0x9E
	.byte 0x18, 0x54, 0x00, 0x00, 0x06, 0x12, 0x21, 0x0D, 0x30, 0x54, 0x00, 0x00, 0x07, 0x13, 0x0C, 0x0E
	.byte 0x48, 0x54, 0x00, 0x00, 0x08, 0x14, 0x0D, 0x0F, 0x60, 0x54, 0x00, 0x00, 0x09, 0x15, 0x0E, 0x10
	.byte 0x78, 0x54, 0x00, 0x00, 0x0A, 0x16, 0x0F, 0x11, 0x90, 0x54, 0x00, 0x00, 0x0B, 0x17, 0x10, 0xA0
	.byte 0x18, 0x6C, 0x00, 0x00, 0x0C, 0x18, 0x21, 0x13, 0x30, 0x6C, 0x00, 0x00, 0x0D, 0x19, 0x12, 0x14
	.byte 0x48, 0x6C, 0x00, 0x00, 0x0E, 0x1A, 0x13, 0x15, 0x60, 0x6C, 0x00, 0x00, 0x0F, 0x1B, 0x14, 0x16
	.byte 0x78, 0x6C, 0x00, 0x00, 0x10, 0x1C, 0x15, 0x17, 0x90, 0x6C, 0x00, 0x00, 0x11, 0x1D, 0x16, 0xA2
	.byte 0x18, 0x84, 0x00, 0x00, 0x12, 0x25, 0x23, 0x19, 0x30, 0x84, 0x00, 0x00, 0x13, 0x25, 0x18, 0x1A
	.byte 0x48, 0x84, 0x00, 0x00, 0x14, 0x25, 0x19, 0x1B, 0x60, 0x84, 0x00, 0x00, 0x15, 0x25, 0x1A, 0x1C
	.byte 0x78, 0x84, 0x00, 0x00, 0x16, 0x25, 0x1B, 0x1D, 0x90, 0x84, 0x00, 0x00, 0x17, 0x25, 0x1C, 0xA2
	.byte 0xC0, 0x34, 0x00, 0x00, 0x25, 0x20, 0x85, 0x1F, 0xE8, 0x3C, 0x00, 0x00, 0x25, 0x21, 0x1E, 0x80
	.byte 0xC0, 0x54, 0x00, 0x00, 0x1E, 0x22, 0x91, 0x21, 0xE8, 0x5C, 0x00, 0x00, 0x1F, 0x23, 0x20, 0x8C
	.byte 0xC0, 0x74, 0x00, 0x00, 0x20, 0x24, 0x97, 0x23, 0xE8, 0x7C, 0x00, 0x00, 0x21, 0x24, 0x22, 0x98
	.byte 0xD4, 0xA2, 0x00, 0x00, 0xA3, 0x25, 0x24, 0x24, 0x2B, 0x17, 0x00, 0x00, 0x18, 0x80, 0x2A, 0x26
	.byte 0x4D, 0x17, 0x00, 0x00, 0x18, 0x80, 0x25, 0x27, 0x6F, 0x17, 0x00, 0x00, 0x18, 0x80, 0x26, 0x28
	.byte 0x91, 0x17, 0x00, 0x00, 0x18, 0x80, 0x27, 0x29, 0xB3, 0x17, 0x00, 0x00, 0x18, 0x80, 0x28, 0x2A
	.byte 0xD5, 0x17, 0x00, 0x00, 0x18, 0x80, 0x29, 0x25, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x2B, 0x2B, 0x2B
	.byte 0x00, 0x00, 0x00, 0x00, 0x2C, 0x2C, 0x2C, 0x2C, 0x44, 0xA8, 0x00, 0x00, 0x2D, 0x2D, 0x2D, 0x2D
