
	thumb_func_start ov103_021EC940
ov103_021EC940: @ 0x021EC940
	push {r3, r4, r5, lr}
	movs r2, #1
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x9c
	lsls r2, r2, #0x10
	bl FUN_0201A910
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0x9c
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x2c
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4, #8]
	ldr r0, [r0]
	bl FUN_02028EA8
	str r0, [r4]
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl FUN_0202B50C
	str r0, [r4, #4]
	movs r0, #8
	str r0, [r4, #0x28]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EC940

	thumb_func_start ov103_021EC988
ov103_021EC988: @ 0x021EC988
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02007290
	adds r1, r4, #0
	bl ov103_021ED2D4
	cmp r0, #0
	bne _021EC99E
	movs r0, #1
	pop {r4, pc}
_021EC99E:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EC988

	thumb_func_start ov103_021EC9A4
ov103_021EC9A4: @ 0x021EC9A4
	push {r3, lr}
	bl FUN_02007294
	movs r0, #0x9c
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov103_021EC9A4

	thumb_func_start ov103_021EC9B4
ov103_021EC9B4: @ 0x021EC9B4
	push {r3, lr}
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	bl FUN_0201EEB4
	bl FUN_0200D034
	ldr r3, _021EC9D0 @ =0x027E0000
	ldr r1, _021EC9D4 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	.align 2, 0
_021EC9D0: .4byte 0x027E0000
_021EC9D4: .4byte 0x00003FF8
	thumb_func_end ov103_021EC9B4

	thumb_func_start ov103_021EC9D8
ov103_021EC9D8: @ 0x021EC9D8
	ldr r3, _021EC9E0 @ =FUN_02022BE8
	ldr r0, _021EC9E4 @ =0x021EEC30
	bx r3
	nop
_021EC9E0: .4byte FUN_02022BE8
_021EC9E4: .4byte 0x021EEC30
	thumb_func_end ov103_021EC9D8

	thumb_func_start ov103_021EC9E8
ov103_021EC9E8: @ 0x021EC9E8
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	adds r4, r0, #0
	movs r0, #0x9d
	bl FUN_0201AC88
	ldr r1, [r4, #0xc]
	add r3, sp, #0xe0
	ldr r5, _021ECB98 @ =0x021EEB40
	str r0, [r1]
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _021ECB9C @ =0x021EEBC0
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	ldr r0, [r0]
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #4
	ldr r0, [r0]
	bl FUN_0201CAE0
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x9d
	bl FUN_0201C1C4
	ldr r5, _021ECBA0 @ =0x021EEBA4
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	ldr r0, [r0]
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #5
	ldr r0, [r0]
	bl FUN_0201CAE0
	movs r0, #5
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x9d
	bl FUN_0201C1C4
	ldr r5, _021ECBA4 @ =0x021EEB88
	add r3, sp, #0x8c
	ldm r5!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0xc]
	movs r1, #6
	ldr r0, [r0]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #6
	ldr r0, [r0]
	bl FUN_0201CAE0
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x9d
	bl FUN_0201C1C4
	ldr r5, _021ECBA8 @ =0x021EEC14
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	ldr r0, [r0]
	bl FUN_0201B1E4
	ldr r5, _021ECBAC @ =0x021EEBDC
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
	ldr r0, [r4, #0xc]
	adds r3, r1, #0
	ldr r0, [r0]
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0201CAE0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x9d
	bl FUN_0201C1C4
	ldr r5, _021ECBB0 @ =0x021EEB50
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	ldr r0, [r0]
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_0201CAE0
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x9d
	bl FUN_0201C1C4
	ldr r5, _021ECBB4 @ =0x021EEB6C
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	ldr r0, [r0]
	bl FUN_0201B1E4
	ldr r0, [r4, #0xc]
	movs r1, #2
	ldr r0, [r0]
	bl FUN_0201CAE0
	ldr r5, _021ECBB8 @ =0x021EEBF8
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
	ldr r0, [r4, #0xc]
	movs r3, #0
	ldr r0, [r0]
	bl FUN_0201B1E4
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021ECB98: .4byte 0x021EEB40
_021ECB9C: .4byte 0x021EEBC0
_021ECBA0: .4byte 0x021EEBA4
_021ECBA4: .4byte 0x021EEB88
_021ECBA8: .4byte 0x021EEC14
_021ECBAC: .4byte 0x021EEBDC
_021ECBB0: .4byte 0x021EEB50
_021ECBB4: .4byte 0x021EEB6C
_021ECBB8: .4byte 0x021EEBF8
	thumb_func_end ov103_021EC9E8

	thumb_func_start ov103_021ECBBC
ov103_021ECBBC: @ 0x021ECBBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #3
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #2
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #1
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #7
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #6
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #5
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	movs r1, #4
	ldr r0, [r0]
	bl FUN_0201BB4C
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ECBBC

	thumb_func_start ov103_021ECC1C
ov103_021ECC1C: @ 0x021ECC1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r0, #0xfc
	movs r1, #0x9d
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r1, #0x9d
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	movs r1, #5
	ldr r2, [r2]
	movs r3, #7
	adds r4, r0, #0
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	ldr r2, [r2]
	movs r1, #4
	movs r3, #7
	bl FUN_02007B68
	movs r3, #0
	str r3, [sp]
	movs r0, #0x9d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #6
	movs r2, #4
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	ldr r2, [r2]
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	ldr r2, [r2]
	adds r3, r1, #0
	bl FUN_02007B44
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	ldr r2, [r2]
	movs r3, #3
	bl FUN_02007B68
	movs r2, #0
	str r2, [sp]
	movs r0, #0x9d
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0x9d
	movs r1, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r2, r1, #0
	add r3, sp, #0x10
	bl FUN_02007C10
	adds r7, r0, #0
	ldr r0, [sp, #0x10]
	ldr r1, [r5, #0xc]
	ldr r6, [r0, #0x14]
	adds r1, #8
	adds r0, r6, #0
	adds r0, #0xe0
	movs r2, #0x20
	blx FUN_020D4808
	movs r0, #0x16
	ldr r1, [r5, #0xc]
	lsls r0, r0, #4
	adds r0, r6, r0
	adds r1, #0x28
	movs r2, #0x20
	blx FUN_020D4808
	adds r0, r7, #0
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov103_021ECC1C

	thumb_func_start ov103_021ECD18
ov103_021ECD18: @ 0x021ECD18
	push {r4, lr}
	sub sp, #8
	ldr r4, [r0, #0xc]
	ldr r0, [r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0x9d
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021ECD64 @ =0x000003E2
	movs r1, #0
	movs r3, #0xd
	bl FUN_0200E644
	movs r1, #7
	movs r0, #0
	lsls r1, r1, #6
	movs r2, #0x9d
	bl FUN_0200304C
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x9d
	bl FUN_02003030
	movs r1, #0x1e
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x9d
	bl FUN_02003030
	add sp, #8
	pop {r4, pc}
	nop
_021ECD64: .4byte 0x000003E2
	thumb_func_end ov103_021ECD18

	thumb_func_start ov103_021ECD68
ov103_021ECD68: @ 0x021ECD68
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	movs r1, #2
	ldr r0, [r0]
	movs r2, #0xb
	movs r3, #0x9d
	bl FUN_0201956C
	ldr r1, [r5, #0xc]
	movs r4, #0
	str r0, [r1, #4]
	movs r6, #4
	movs r7, #2
_021ECD84:
	str r6, [sp]
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	ldr r0, [r0, #4]
	adds r2, r7, #0
	movs r3, #0xe
	bl FUN_020195F4
	adds r4, r4, #1
	cmp r4, #0xa
	blo _021ECD84
	movs r0, #4
	str r0, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #0xa
	ldr r0, [r0, #4]
	movs r2, #1
	movs r3, #0xe
	bl FUN_020195F4
	movs r0, #1
	str r0, [sp]
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #4]
	movs r2, #0xfc
	movs r3, #3
	bl FUN_02019688
	ldr r0, [r5, #0xc]
	movs r1, #0
	ldr r0, [r0, #4]
	bl FUN_02019B08
	adds r6, r0, #0
	movs r4, #1
	movs r7, #0x70
_021ECDCE:
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	ldr r0, [r0, #4]
	bl FUN_02019B08
	adds r1, r0, #0
	adds r0, r6, #0
	adds r2, r7, #0
	blx FUN_020D4A50
	adds r4, r4, #1
	cmp r4, #0xa
	bls _021ECDCE
	movs r4, #0
_021ECDEA:
	lsls r2, r4, #0x1f
	ldr r0, [r5, #0xc]
	lsrs r2, r2, #0x1b
	adds r2, r2, #1
	lsrs r3, r4, #1
	lsls r2, r2, #0x18
	lsls r3, r3, #0x1a
	ldr r0, [r0, #4]
	adds r1, r4, #0
	asrs r2, r2, #0x18
	asrs r3, r3, #0x18
	bl FUN_020196E8
	adds r4, r4, #1
	cmp r4, #0xa
	blo _021ECDEA
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021ECD68

	thumb_func_start ov103_021ECE0C
ov103_021ECE0C: @ 0x021ECE0C
	ldr r0, [r0, #0xc]
	ldr r3, _021ECE14 @ =FUN_020195C0
	ldr r0, [r0, #4]
	bx r3
	.align 2, 0
_021ECE14: .4byte FUN_020195C0
	thumb_func_end ov103_021ECE0C

	thumb_func_start ov103_021ECE18
ov103_021ECE18: @ 0x021ECE18
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xe8
	movs r3, #0x9d
	bl FUN_0200BAF8
	movs r1, #0x8a
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0x9d
	bl FUN_0200BD08
	movs r1, #0x8b
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #1
	lsls r0, r0, #0xa
	movs r1, #0x9d
	bl FUN_02026354
	movs r1, #0x23
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #1
	bl FUN_02002B8C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ECE18

	thumb_func_start ov103_021ECE54
ov103_021ECE54: @ 0x021ECE54
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BDA0
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0200BB44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ECE54

	thumb_func_start ov103_021ECE80
ov103_021ECE80: @ 0x021ECE80
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x9d
	bl FUN_0201660C
	movs r1, #0x8e
	ldr r2, [r4, #0xc]
	lsls r1, r1, #2
	str r0, [r2, r1]
	pop {r4, pc}
	thumb_func_end ov103_021ECE80

	thumb_func_start ov103_021ECE94
ov103_021ECE94: @ 0x021ECE94
	ldr r1, [r0, #0xc]
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r3, _021ECEA0 @ =FUN_02016624
	ldr r0, [r1, r0]
	bx r3
	.align 2, 0
_021ECEA0: .4byte FUN_02016624
	thumb_func_end ov103_021ECE94

	thumb_func_start ov103_021ECEA4
ov103_021ECEA4: @ 0x021ECEA4
	push {r3, r4, lr}
	sub sp, #0x14
	ldr r1, [r0, #0xc]
	ldr r2, _021ECEE8 @ =0x000003A6
	ldr r1, [r1]
	movs r4, #0xa
	str r1, [sp]
	movs r1, #0
	str r2, [sp, #8]
	str r1, [sp, #4]
	str r4, [sp, #0xc]
	movs r2, #0x19
	add r3, sp, #0
	strb r2, [r3, #0x10]
	strb r4, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	movs r2, #0xf
	bics r4, r2
	strb r4, [r3, #0x12]
	ldrb r4, [r3, #0x12]
	movs r2, #0xf0
	bics r4, r2
	strb r4, [r3, #0x12]
	strb r1, [r3, #0x13]
	ldr r1, [r0, #0xc]
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021ECEE8: .4byte 0x000003A6
	thumb_func_end ov103_021ECEA4

	thumb_func_start ov103_021ECEEC
ov103_021ECEEC: @ 0x021ECEEC
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x9d
	movs r1, #0
	bl FUN_02018424
	movs r1, #9
	ldr r2, [r5, #0xc]
	lsls r1, r1, #6
	str r0, [r2, r1]
	adds r0, r5, #0
	bl ov103_021ED2B8
	movs r1, #0x9d
	adds r6, r0, #0
	bl FUN_02014918
	movs r1, #0x92
	lsls r1, r1, #2
	ldr r2, [r5, #0xc]
	adds r7, r1, #0
	str r0, [r2, r1]
	movs r4, #0
	subs r7, #0x20
_021ECF1C:
	cmp r6, #2
	bne _021ECF28
	cmp r4, #2
	beq _021ECF3A
	cmp r4, #1
	beq _021ECF3A
_021ECF28:
	movs r0, #0x92
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [r1, r7]
	adds r2, r4, #5
	adds r3, r4, #0
	bl FUN_02014960
_021ECF3A:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	blo _021ECF1C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov103_021ECEEC

	thumb_func_start ov103_021ECF48
ov103_021ECF48: @ 0x021ECF48
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x92
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_02014950
	movs r0, #9
	ldr r1, [r4, #0xc]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	bl FUN_02018474
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ECF48

	thumb_func_start ov103_021ECF68
ov103_021ECF68: @ 0x021ECF68
	push {r3, r4, lr}
	sub sp, #0x24
	ldr r2, _021ECFF8 @ =_021EEB34
	add r1, sp, #0xc
	ldrh r3, [r2]
	adds r4, r0, #0
	strh r3, [r1]
	ldrh r3, [r2, #2]
	strh r3, [r1, #2]
	ldrh r3, [r2, #4]
	strh r3, [r1, #4]
	ldrh r3, [r2, #6]
	strh r3, [r1, #6]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r1, #8]
	strh r2, [r1, #0xa]
	movs r1, #0x92
	ldr r2, [r4, #0xc]
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	str r1, [sp, #0x18]
	ldr r1, [r4, #0xc]
	ldr r1, [r1]
	str r1, [sp, #0x1c]
	bl ov103_021ED2B8
	add r1, sp, #0xc
	strb r0, [r1, #0x14]
	ldrb r0, [r1, #0x14]
	cmp r0, #4
	bne _021ECFD0
	movs r0, #5
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #9
	ldr r1, [r4, #0xc]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	movs r3, #0x12
	bl FUN_020185FC
	movs r1, #0x91
	ldr r2, [r4, #0xc]
	lsls r1, r1, #2
	str r0, [r2, r1]
	add sp, #0x24
	pop {r3, r4, pc}
_021ECFD0:
	movs r0, #0xb
	str r0, [sp]
	str r0, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r0, #9
	ldr r1, [r4, #0xc]
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	movs r3, #0x12
	bl FUN_020185FC
	ldr r2, [r4, #0xc]
	movs r1, #0x91
	lsls r1, r1, #2
	str r0, [r2, r1]
	add sp, #0x24
	pop {r3, r4, pc}
	nop
_021ECFF8: .4byte _021EEB34
	thumb_func_end ov103_021ECF68

	thumb_func_start ov103_021ECFFC
ov103_021ECFFC: @ 0x021ECFFC
	ldr r1, [r0, #0xc]
	movs r0, #0x91
	lsls r0, r0, #2
	ldr r3, _021ED008 @ =FUN_02018680
	ldr r0, [r1, r0]
	bx r3
	.align 2, 0
_021ED008: .4byte FUN_02018680
	thumb_func_end ov103_021ECFFC

	thumb_func_start ov103_021ED00C
ov103_021ED00C: @ 0x021ED00C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x2e
	movs r4, #0
	ldr r1, [r5, #0xc]
	lsls r0, r0, #4
	strh r4, [r1, r0]
	adds r6, r4, #0
	movs r7, #0xff
_021ED01E:
	ldr r0, [r5, #0xc]
	adds r2, r4, #0
	adds r1, r0, r4
	movs r0, #0xb3
	lsls r0, r0, #2
	strb r7, [r1, r0]
	ldr r0, [r5, #4]
	movs r1, #0
	movs r3, #0x9d
	bl FUN_0202B574
	ldr r1, [r5, #0xc]
	adds r2, r1, r6
	movs r1, #0x9f
	lsls r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r5, #0xc]
	adds r1, r0, r6
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0202B0B8
	cmp r0, #1
	bne _021ED070
	movs r0, #0x2e
	ldr r1, [r5, #0xc]
	lsls r0, r0, #4
	ldrh r0, [r1, r0]
	adds r1, r1, r0
	movs r0, #0xb3
	lsls r0, r0, #2
	strb r4, [r1, r0]
	movs r1, #0x2e
	ldr r0, [r5, #0xc]
	lsls r1, r1, #4
	ldrh r1, [r0, r1]
	adds r2, r1, #1
	movs r1, #0x2e
	lsls r1, r1, #4
	strh r2, [r0, r1]
_021ED070:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #0x14
	blo _021ED01E
	movs r0, #0x2e
	ldr r4, [r5, #0xc]
	lsls r0, r0, #4
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021ED08C
	movs r1, #0
	adds r0, r0, #2
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021ED08C:
	subs r0, r1, #1
	movs r1, #0xa
	blx FUN_020F2998
	ldr r1, _021ED09C @ =0x000002E2
	strh r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED09C: .4byte 0x000002E2
	thumb_func_end ov103_021ED00C

	thumb_func_start ov103_021ED0A0
ov103_021ED0A0: @ 0x021ED0A0
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r7, #0x9f
	adds r6, r0, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_021ED0AC:
	ldr r0, [r6, #0xc]
	adds r0, r0, r5
	ldr r0, [r0, r7]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x14
	blo _021ED0AC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021ED0A0

	thumb_func_start ov103_021ED0C0
ov103_021ED0C0: @ 0x021ED0C0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0x1c]
	movs r0, #0xa
	movs r4, #0
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0xb3
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	adds r0, r0, r2
	str r0, [sp]
	lsls r0, r2, #0x10
	lsrs r7, r0, #0x10
	adds r6, r4, #0
_021ED0E2:
	ldr r0, [sp]
	ldrb r3, [r0, r6]
	cmp r3, #0xff
	bne _021ED0F6
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	ldr r0, [r0, #4]
	bl FUN_0201980C
	b _021ED10A
_021ED0F6:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov103_021EE468
	ldr r0, [r5, #0xc]
	adds r1, r4, #0
	ldr r0, [r0, #4]
	bl FUN_020197F4
_021ED10A:
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0xa
	blo _021ED0E2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov103_021ED0C0

	thumb_func_start ov103_021ED124
ov103_021ED124: @ 0x021ED124
	push {r4, lr}
	adds r4, r0, #0
	ldrb r3, [r4, #0x1f]
	movs r1, #0xa
	movs r2, #0x14
	bl ov103_021EE468
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	ldr r0, [r0, #4]
	movs r2, #4
	movs r3, #7
	bl FUN_020196E8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ED124

	thumb_func_start ov103_021ED144
ov103_021ED144: @ 0x021ED144
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r1, #0xb9
	ldr r0, [r5, #0xc]
	lsls r1, r1, #2
	adds r4, r0, r1
	ldrb r2, [r4, #2]
	cmp r2, #0
	beq _021ED162
	cmp r2, #1
	beq _021ED1B8
	cmp r2, #2
	beq _021ED222
	b _021ED234
_021ED162:
	ldrb r2, [r4]
	lsls r3, r2, #0x1f
	lsrs r3, r3, #0x1f
	bne _021ED182
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x19
	lsls r2, r2, #2
	adds r0, r0, r2
	subs r1, #0x8c
	ldr r0, [r0, r1]
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021ED1B0
_021ED182:
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
	ldr r0, [r0]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	ldrb r1, [r4]
	ldr r0, [r5, #0xc]
	lsls r1, r1, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021ED1B0:
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _021ED234
_021ED1B8:
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #4
	bne _021ED234
	ldrb r0, [r4]
	lsls r2, r0, #0x1f
	lsrs r2, r2, #0x1f
	bne _021ED1E6
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r2, [r5, #0xc]
	lsls r0, r0, #2
	adds r0, r2, r0
	subs r1, #0x8c
	ldr r0, [r0, r1]
	ldrb r1, [r4, #1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	b _021ED216
_021ED1E6:
	ldrb r0, [r4, #6]
	str r0, [sp]
	ldrb r0, [r4, #7]
	str r0, [sp, #4]
	ldrb r0, [r4, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4]
	ldr r0, [r5, #0xc]
	ldrb r2, [r4, #4]
	lsls r1, r1, #0x18
	ldrb r3, [r4, #5]
	ldr r0, [r0]
	lsrs r1, r1, #0x19
	bl FUN_0201CA4C
	ldrb r1, [r4]
	ldr r0, [r5, #0xc]
	lsls r1, r1, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x19
	bl FUN_0201EFBC
_021ED216:
	movs r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	b _021ED234
_021ED222:
	ldrb r0, [r4, #3]
	adds r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _021ED234
	add sp, #0xc
	movs r0, #0
	pop {r4, r5, pc}
_021ED234:
	movs r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021ED144

	thumb_func_start ov103_021ED23C
ov103_021ED23C: @ 0x021ED23C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x4f
	movs r1, #0x9d
	bl FUN_02007688
	adds r4, r0, #0
	ldrb r0, [r5, #0x1f]
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0202B3F0
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r1, r6, #0
	ldr r2, [r2]
	adds r0, r4, #0
	adds r1, #0xc
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0x40
	str r0, [sp]
	movs r0, #0x9d
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r6, #0x18
	ldr r2, [r2]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r3, #5
	bl FUN_02007B68
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov103_021ED23C

	thumb_func_start ov103_021ED2B8
ov103_021ED2B8: @ 0x021ED2B8
	push {r3, lr}
	ldr r0, [r0, #8]
	ldr r0, [r0]
	bl FUN_02074904
	bl FUN_02074640
	cmp r0, #0
	ble _021ED2CE
	movs r0, #4
	pop {r3, pc}
_021ED2CE:
	movs r0, #2
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov103_021ED2B8

	thumb_func_start ov103_021ED2D4
ov103_021ED2D4: @ 0x021ED2D4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	lsls r2, r1, #2
	ldr r1, _021ED310 @ =0x021EECA8
	ldr r1, [r1, r2]
	blx r1
	str r0, [r4]
	cmp r0, #0x19
	bne _021ED2EE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021ED2EE:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021ED30C
	ldr r0, [r0, #4]
	bl FUN_02019934
	ldr r0, [r5, #0xc]
	bl ov103_021EDF68
	movs r0, #0x95
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0200D020
_021ED30C:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021ED310: .4byte 0x021EECA8
	thumb_func_end ov103_021ED2D4

	thumb_func_start ov103_021ED314
ov103_021ED314: @ 0x021ED314
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
	ldr r0, _021ED3D4 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _021ED3D8 @ =0x04001050
	strh r1, [r0]
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	ldr r2, _021ED3DC @ =0x04000304
	ldr r0, _021ED3E0 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #3
	movs r1, #0x9d
	lsls r2, r0, #0x11
	bl FUN_0201A910
	movs r1, #0x2f
	movs r0, #0x9d
	lsls r1, r1, #4
	bl FUN_0201AA8C
	movs r2, #0x2f
	movs r1, #0
	lsls r2, r2, #4
	str r0, [r4, #0xc]
	blx FUN_020D4994
	adds r0, r4, #0
	bl ov103_021ED00C
	bl ov103_021EC9D8
	adds r0, r4, #0
	bl ov103_021EC9E8
	adds r0, r4, #0
	bl ov103_021ECC1C
	adds r0, r4, #0
	bl ov103_021ECD18
	adds r0, r4, #0
	bl ov103_021EE390
	adds r0, r4, #0
	bl ov103_021ECD68
	adds r0, r4, #0
	bl ov103_021EDEA8
	adds r0, r4, #0
	bl ov103_021ECE80
	adds r0, r4, #0
	bl ov103_021EEA48
	ldr r0, [r4, #0xc]
	bl ov103_021ECE18
	adds r0, r4, #0
	bl ov103_021EE550
	adds r0, r4, #0
	bl ov103_021EE644
	adds r0, r4, #0
	bl ov103_021ED0C0
	adds r0, r4, #0
	bl ov103_021ECEEC
	ldr r0, _021ED3E4 @ =ov103_021EC9B4
	adds r1, r4, #0
	bl FUN_0201A0FC
	ldr r0, [r4, #0x28]
	pop {r4, pc}
	nop
_021ED3D4: .4byte 0x04000050
_021ED3D8: .4byte 0x04001050
_021ED3DC: .4byte 0x04000304
_021ED3E0: .4byte 0xFFFF7FFF
_021ED3E4: .4byte ov103_021EC9B4
	thumb_func_end ov103_021ED314

	thumb_func_start ov103_021ED3E8
ov103_021ED3E8: @ 0x021ED3E8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	adds r0, r4, #0
	bl ov103_021ECF48
	ldr r0, [r4, #0xc]
	bl ov103_021ECE54
	adds r0, r4, #0
	bl ov103_021EEAA0
	adds r0, r4, #0
	bl ov103_021ECE94
	adds r0, r4, #0
	bl ov103_021EDF50
	adds r0, r4, #0
	bl ov103_021ECE0C
	adds r0, r4, #0
	bl ov103_021EE3C0
	adds r0, r4, #0
	bl ov103_021ECBBC
	adds r0, r4, #0
	bl ov103_021ED0A0
	bl FUN_02021238
	ldr r1, _021ED458 @ =0x04000050
	movs r0, #0
	strh r0, [r1]
	ldr r1, _021ED45C @ =0x04001050
	strh r0, [r1]
	bl FUN_02022C9C
	movs r0, #0
	bl FUN_02022D04
	ldr r0, [r4, #0xc]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #0x9d
	bl FUN_0201A9C4
	ldr r0, [r4, #0x28]
	pop {r4, pc}
	nop
_021ED458: .4byte 0x04000050
_021ED45C: .4byte 0x04001050
	thumb_func_end ov103_021ED3E8

	thumb_func_start ov103_021ED460
ov103_021ED460: @ 0x021ED460
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _021ED476
	movs r0, #0xbb
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_021ED476:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ED460

	thumb_func_start ov103_021ED47C
ov103_021ED47C: @ 0x021ED47C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8d
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	bl FUN_02020094
	cmp r0, #0
	bne _021ED4C4
	ldr r1, [r4, #0xc]
	ldr r0, _021ED4C8 @ =0x00000235
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _021ED49E
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED49E:
	bl FUN_02025358
	cmp r0, #1
	bne _021ED4B0
	ldr r0, _021ED4CC @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED4B0:
	ldr r0, _021ED4D0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _021ED4C4
	ldr r0, _021ED4CC @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED4C4:
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_021ED4C8: .4byte 0x00000235
_021ED4CC: .4byte 0x000005DC
_021ED4D0: .4byte 0x021D110C
	thumb_func_end ov103_021ED47C

	thumb_func_start ov103_021ED4D4
ov103_021ED4D4: @ 0x021ED4D4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x8e
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021ED4EE
	cmp r0, #2
	beq _021ED50E
	b _021ED52E
_021ED4EE:
	movs r0, #0x8e
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_020169CC
	movs r1, #0x8f
	ldr r2, [r4, #0xc]
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	adds r0, r4, #0
	lsls r2, r1, #3
	ldr r1, _021ED534 @ =0x021EEC68
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
_021ED50E:
	movs r0, #0x8e
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_020169CC
	movs r1, #0x8f
	ldr r2, [r4, #0xc]
	lsls r1, r1, #2
	ldr r1, [r2, r1]
	adds r0, r4, #0
	lsls r2, r1, #3
	ldr r1, _021ED538 @ =0x021EEC6C
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
_021ED52E:
	movs r0, #4
	pop {r4, pc}
	nop
_021ED534: .4byte 0x021EEC68
_021ED538: .4byte 0x021EEC6C
	thumb_func_end ov103_021ED4D4

	thumb_func_start ov103_021ED53C
ov103_021ED53C: @ 0x021ED53C
	push {r4, lr}
	adds r4, r0, #0
	bl ov103_021ED144
	cmp r0, #0
	bne _021ED54C
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED54C:
	movs r0, #5
	pop {r4, pc}
	thumb_func_end ov103_021ED53C

	thumb_func_start ov103_021ED550
ov103_021ED550: @ 0x021ED550
	push {r3, lr}
	ldr r2, [r0, #0x18]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021ED564 @ =0x021EEC78
	ldr r1, [r1, r3]
	blx r1
	movs r0, #7
	pop {r3, pc}
	.align 2, 0
_021ED564: .4byte 0x021EEC78
	thumb_func_end ov103_021ED550

	thumb_func_start ov103_021ED568
ov103_021ED568: @ 0x021ED568
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FUN_020072A8
	cmp r0, #0
	bne _021ED57A
	movs r0, #7
	pop {r4, pc}
_021ED57A:
	ldr r0, [r4, #0x10]
	bl FUN_02007278
	ldr r2, [r4, #0x18]
	movs r1, #0xc
	adds r3, r2, #0
	muls r3, r1, r3
	ldr r1, _021ED5A0 @ =0x021EEC7C
	adds r0, r4, #0
	ldr r1, [r1, r3]
	blx r1
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x18]
	movs r0, #0xc
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _021ED5A4 @ =0x021EEC80
	ldr r0, [r0, r2]
	pop {r4, pc}
	.align 2, 0
_021ED5A0: .4byte 0x021EEC7C
_021ED5A4: .4byte 0x021EEC80
	thumb_func_end ov103_021ED568

	thumb_func_start ov103_021ED5A8
ov103_021ED5A8: @ 0x021ED5A8
	ldr r3, _021ED5B0 @ =ov103_021EDA14
	movs r1, #9
	bx r3
	nop
_021ED5B0: .4byte ov103_021EDA14
	thumb_func_end ov103_021ED5A8

	thumb_func_start ov103_021ED5B4
ov103_021ED5B4: @ 0x021ED5B4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov103_021EEA24
	cmp r0, #0
	beq _021ED5C6
	cmp r0, #1
	beq _021ED5E6
	b _021ED60C
_021ED5C6:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0
	beq _021ED5E2
	subs r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED5E2:
	movs r0, #9
	pop {r3, r4, r5, pc}
_021ED5E6:
	ldr r1, [r4, #0xc]
	ldr r0, _021ED744 @ =0x000002E2
	ldrh r2, [r4, #0x1c]
	ldrh r0, [r1, r0]
	cmp r2, r0
	beq _021ED608
	adds r0, r2, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED608:
	movs r0, #9
	pop {r3, r4, r5, pc}
_021ED60C:
	movs r0, #0x9e
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_02019BE4
	movs r1, #2
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	bhi _021ED654
	blo _021ED626
	b _021ED734
_021ED626:
	cmp r5, #0xa
	bhi _021ED64C
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021ED636: @ jump table
	.2byte _021ED666 - _021ED636 - 2 @ case 0
	.2byte _021ED666 - _021ED636 - 2 @ case 1
	.2byte _021ED666 - _021ED636 - 2 @ case 2
	.2byte _021ED666 - _021ED636 - 2 @ case 3
	.2byte _021ED666 - _021ED636 - 2 @ case 4
	.2byte _021ED666 - _021ED636 - 2 @ case 5
	.2byte _021ED666 - _021ED636 - 2 @ case 6
	.2byte _021ED666 - _021ED636 - 2 @ case 7
	.2byte _021ED666 - _021ED636 - 2 @ case 8
	.2byte _021ED666 - _021ED636 - 2 @ case 9
	.2byte _021ED6A0 - _021ED636 - 2 @ case 10
_021ED64C:
	movs r0, #3
	mvns r0, r0
	cmp r5, r0
	b _021ED73A
_021ED654:
	adds r0, r1, #1
	cmp r5, r0
	bhi _021ED65E
	beq _021ED6A0
	b _021ED73A
_021ED65E:
	adds r0, r1, #2
	cmp r5, r0
	beq _021ED6B2
	b _021ED73A
_021ED666:
	ldrh r1, [r4, #0x1c]
	ldr r0, [r4, #0xc]
	adds r3, r0, r5
	adds r2, r1, #0
	movs r0, #0xa
	muls r2, r0, r2
	movs r1, #0xb3
	adds r2, r3, r2
	lsls r1, r1, #2
	ldrb r2, [r2, r1]
	cmp r2, #0xff
	beq _021ED73A
	strb r5, [r4, #0x1e]
	ldr r2, [r4, #0xc]
	adds r3, r2, r5
	ldrh r2, [r4, #0x1c]
	muls r0, r2, r0
	adds r0, r3, r0
	ldrb r0, [r0, r1]
	strb r0, [r4, #0x1f]
	ldr r0, _021ED748 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xc
	bl ov103_021EDA98
	pop {r3, r4, r5, pc}
_021ED6A0:
	ldr r0, _021ED748 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0xa
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED6B2:
	movs r0, #0x9e
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_02019F74
	ldr r1, _021ED74C @ =0x021D110C
	movs r2, #0x10
	ldr r1, [r1, #0x4c]
	tst r2, r1
	beq _021ED6FE
	cmp r0, #1
	beq _021ED6DC
	cmp r0, #3
	beq _021ED6DC
	cmp r0, #5
	beq _021ED6DC
	cmp r0, #7
	beq _021ED6DC
	cmp r0, #9
	bne _021ED6FE
_021ED6DC:
	ldr r3, [r4, #0xc]
	ldr r2, _021ED744 @ =0x000002E2
	ldrh r5, [r4, #0x1c]
	ldrh r2, [r3, r2]
	cmp r5, r2
	beq _021ED6FE
	adds r0, r5, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED6FE:
	movs r2, #0x20
	tst r1, r2
	beq _021ED73A
	cmp r0, #0
	beq _021ED718
	cmp r0, #2
	beq _021ED718
	cmp r0, #4
	beq _021ED718
	cmp r0, #6
	beq _021ED718
	cmp r0, #8
	bne _021ED73A
_021ED718:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0
	beq _021ED73A
	subs r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED734:
	ldr r0, _021ED740 @ =0x000005DC
	bl FUN_0200604C
_021ED73A:
	movs r0, #9
	pop {r3, r4, r5, pc}
	nop
_021ED740: .4byte 0x000005DC
_021ED744: .4byte 0x000002E2
_021ED748: .4byte 0x000005DD
_021ED74C: .4byte 0x021D110C
	thumb_func_end ov103_021ED5B4

	thumb_func_start ov103_021ED750
ov103_021ED750: @ 0x021ED750
	ldr r3, _021ED75C @ =ov103_021EDA40
	movs r1, #0x19
	str r1, [r0, #0x28]
	movs r1, #1
	bx r3
	nop
_021ED75C: .4byte ov103_021EDA40
	thumb_func_end ov103_021ED750

	thumb_func_start ov103_021ED760
ov103_021ED760: @ 0x021ED760
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x1c]
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _021ED780
	movs r1, #0
	adds r2, r1, #0
	bl ov103_021EE0CC
	movs r1, #1
	ldr r0, [r4, #0xc]
	adds r2, r1, #0
	bl ov103_021EE0CC
	b _021ED792
_021ED780:
	movs r1, #0
	movs r2, #1
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #1
	movs r2, #0
	bl ov103_021EE0CC
_021ED792:
	adds r0, r4, #0
	bl ov103_021EE644
	adds r0, r4, #0
	bl ov103_021ED0C0
	movs r0, #9
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ED760

	thumb_func_start ov103_021ED7A4
ov103_021ED7A4: @ 0x021ED7A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl ov103_021EDB60
	adds r0, r4, #0
	bl ov103_021ED124
	adds r0, r4, #0
	bl ov103_021EE860
	adds r0, r4, #0
	bl ov103_021EE824
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0xd
	bl ov103_021EDA70
	pop {r4, pc}
	thumb_func_end ov103_021ED7A4

	thumb_func_start ov103_021ED7D8
ov103_021ED7D8: @ 0x021ED7D8
	push {r3, lr}
	bl ov103_021ECF68
	movs r0, #0xe
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov103_021ED7D8

	thumb_func_start ov103_021ED7E4
ov103_021ED7E4: @ 0x021ED7E4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x91
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_020186A4
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	bhi _021ED816
	bhs _021ED89E
	cmp r0, #3
	bhi _021ED8CA
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021ED80E: @ jump table
	.2byte _021ED81E - _021ED80E - 2 @ case 0
	.2byte _021ED84A - _021ED80E - 2 @ case 1
	.2byte _021ED864 - _021ED80E - 2 @ case 2
	.2byte _021ED89E - _021ED80E - 2 @ case 3
_021ED816:
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	b _021ED8CA
_021ED81E:
	adds r0, r4, #0
	bl ov103_021ECFFC
	adds r0, r4, #0
	bl ov103_021EE888
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #1
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	bl ov103_021EE60C
	ldr r0, [r4, #0xc]
	bl ov103_021EE374
	adds r0, r4, #0
	bl ov103_021EDBB0
	movs r0, #0xf
	pop {r4, pc}
_021ED84A:
	adds r0, r4, #0
	bl ov103_021ECFFC
	adds r0, r4, #0
	movs r1, #0
	bl ov103_021EE8A8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x11
	bl ov103_021EDA70
	pop {r4, pc}
_021ED864:
	adds r0, r4, #0
	bl ov103_021ECFFC
	ldrb r0, [r4, #0x1f]
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0202B3F0
	bl FUN_0207808C
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0xe
	movs r3, #0
	bl ov103_021EDC68
	movs r0, #0
	str r0, [r4, #0x18]
	movs r0, #6
	str r0, [r4, #0x28]
	adds r0, r4, #0
	movs r1, #1
	bl ov103_021EDA40
	pop {r4, pc}
_021ED89E:
	adds r0, r4, #0
	bl ov103_021ECFFC
	adds r0, r4, #0
	bl ov103_021EE888
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	ldr r0, [r0, #4]
	bl FUN_0201980C
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov103_021EDB60
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #1
	bl ov103_021EE0CC
	movs r0, #9
	pop {r4, pc}
_021ED8CA:
	movs r0, #0xe
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ED7E4

	thumb_func_start ov103_021ED8D0
ov103_021ED8D0: @ 0x021ED8D0
	push {r4, lr}
	adds r4, r0, #0
	bl ov103_021EEB04
	cmp r0, #1
	bne _021ED8EE
	ldr r0, _021ED8F4 @ =0x000005DD
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x10
	bl ov103_021EDB18
	pop {r4, pc}
_021ED8EE:
	movs r0, #0xf
	pop {r4, pc}
	nop
_021ED8F4: .4byte 0x000005DD
	thumb_func_end ov103_021ED8D0

	thumb_func_start ov103_021ED8F8
ov103_021ED8F8: @ 0x021ED8F8
	push {r4, lr}
	adds r4, r0, #0
	bl ov103_021EDBC8
	movs r0, #0x9e
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov103_021EEAC8
	ldr r0, [r4, #0xc]
	bl ov103_021EE628
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	ldr r0, [r0, #4]
	bl FUN_0201980C
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov103_021EDB60
	movs r0, #9
	pop {r4, pc}
	thumb_func_end ov103_021ED8F8

	thumb_func_start ov103_021ED930
ov103_021ED930: @ 0x021ED930
	ldr r3, _021ED938 @ =ov103_021EDA84
	movs r1, #0
	bx r3
	nop
_021ED938: .4byte ov103_021EDA84
	thumb_func_end ov103_021ED930

	thumb_func_start ov103_021ED93C
ov103_021ED93C: @ 0x021ED93C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	bl ov103_021EE8A8
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x13
	bl ov103_021EDA70
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021ED93C

	thumb_func_start ov103_021ED954
ov103_021ED954: @ 0x021ED954
	ldr r3, _021ED95C @ =ov103_021EDA84
	movs r1, #1
	bx r3
	nop
_021ED95C: .4byte ov103_021EDA84
	thumb_func_end ov103_021ED954

	thumb_func_start ov103_021ED960
ov103_021ED960: @ 0x021ED960
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r1, [r1]
	cmp r1, #6
	beq _021ED972
	movs r1, #0x15
	str r1, [r0, #0x28]
	movs r0, #0
	bx lr
_021ED972:
	movs r1, #2
	str r1, [r0, #0x18]
	movs r0, #6
	bx lr
	.align 2, 0
	thumb_func_end ov103_021ED960

	thumb_func_start ov103_021ED97C
ov103_021ED97C: @ 0x021ED97C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #1
	bl ov103_021EDB60
	adds r0, r4, #0
	movs r1, #0x16
	bl ov103_021EDA14
	pop {r4, pc}
	thumb_func_end ov103_021ED97C

	thumb_func_start ov103_021ED99C
ov103_021ED99C: @ 0x021ED99C
	push {r4, lr}
	adds r4, r0, #0
	bl ov103_021EE860
	adds r0, r4, #0
	bl ov103_021EDE7C
	pop {r4, pc}
	thumb_func_end ov103_021ED99C

	thumb_func_start ov103_021ED9AC
ov103_021ED9AC: @ 0x021ED9AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x24]
	cmp r1, #0
	bne _021ED9BE
	movs r0, #0x15
	str r0, [r4, #0x28]
	movs r0, #0
	pop {r4, pc}
_021ED9BE:
	adds r3, r4, #0
	adds r3, #0x21
	ldrb r3, [r3]
	ldrh r2, [r4, #0x22]
	movs r1, #0xb
	lsls r3, r3, #0x19
	lsrs r3, r3, #0x19
	bl ov103_021EDC68
	movs r0, #3
	str r0, [r4, #0x18]
	movs r0, #6
	pop {r4, pc}
	thumb_func_end ov103_021ED9AC

	thumb_func_start ov103_021ED9D8
ov103_021ED9D8: @ 0x021ED9D8
	push {r4, lr}
	adds r4, r0, #0
	bl ov103_021EE888
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	ldr r0, [r0, #4]
	bl FUN_0201980C
	movs r0, #0x9e
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov103_021EEAC8
	ldr r0, [r4, #0xc]
	movs r1, #2
	movs r2, #1
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl ov103_021EDB60
	movs r0, #9
	pop {r4, pc}
	thumb_func_end ov103_021ED9D8

	thumb_func_start ov103_021EDA14
ov103_021EDA14: @ 0x021EDA14
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	adds r4, r1, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x9d
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xbb
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	str r4, [r1, r0]
	movs r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov103_021EDA14

	thumb_func_start ov103_021EDA40
ov103_021EDA40: @ 0x021EDA40
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x9d
	str r0, [sp, #8]
	movs r0, #0
	adds r4, r1, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	movs r0, #0xbb
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	str r4, [r1, r0]
	movs r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EDA40

	thumb_func_start ov103_021EDA70
ov103_021EDA70: @ 0x021EDA70
	push {r3, r4}
	ldr r4, [r0, #0xc]
	ldr r3, _021EDA80 @ =0x00000235
	strb r1, [r4, r3]
	str r2, [r0, #0x28]
	movs r0, #3
	pop {r3, r4}
	bx lr
	.align 2, 0
_021EDA80: .4byte 0x00000235
	thumb_func_end ov103_021EDA70

	thumb_func_start ov103_021EDA84
ov103_021EDA84: @ 0x021EDA84
	push {r3, lr}
	movs r2, #0x8f
	ldr r3, [r0, #0xc]
	lsls r2, r2, #2
	str r1, [r3, r2]
	bl ov103_021ECEA4
	movs r0, #4
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov103_021EDA84

	thumb_func_start ov103_021EDA98
ov103_021EDA98: @ 0x021EDA98
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	adds r4, r2, #0
	add r2, sp, #0
	ldr r0, [r0, #4]
	adds r2, #1
	add r3, sp, #0
	adds r6, r1, #0
	bl FUN_02019B1C
	ldr r0, [r5, #0xc]
	add r3, sp, #0
	ldr r0, [r0, #4]
	adds r1, r6, #0
	add r2, sp, #4
	adds r3, #2
	bl FUN_02019B44
	movs r0, #0xb9
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #1
	bics r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r1]
	ldrb r3, [r1]
	movs r2, #0xfe
	bics r3, r2
	movs r2, #4
	orrs r2, r3
	strb r2, [r1]
	ldrb r3, [r1, #1]
	movs r2, #0xf
	bics r3, r2
	movs r2, #2
	orrs r2, r3
	strb r2, [r1, #1]
	ldrb r3, [r1, #1]
	movs r2, #0xf0
	bics r3, r2
	movs r2, #0x10
	orrs r2, r3
	strb r2, [r1, #1]
	movs r3, #0
	strb r3, [r1, #2]
	strb r3, [r1, #3]
	add r2, sp, #0
	ldrsb r0, [r2, r0]
	strb r0, [r1, #4]
	ldrsb r0, [r2, r3]
	strb r0, [r1, #5]
	ldrh r0, [r2, #4]
	strb r0, [r1, #6]
	ldrh r0, [r2, #2]
	strb r0, [r1, #7]
	str r4, [r5, #0x28]
	movs r0, #5
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov103_021EDA98

	thumb_func_start ov103_021EDB18
ov103_021EDB18: @ 0x021EDB18
	push {r4, r5}
	movs r3, #0xb9
	ldr r4, [r0, #0xc]
	lsls r3, r3, #2
	adds r4, r4, r3
	ldrb r5, [r4]
	movs r3, #1
	lsls r1, r1, #0x18
	bics r5, r3
	strb r5, [r4]
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x19
	ldrb r3, [r4]
	movs r5, #0xfe
	lsrs r1, r1, #0x18
	bics r3, r5
	orrs r1, r3
	strb r1, [r4]
	ldrb r3, [r4, #1]
	movs r1, #0xf
	bics r3, r1
	movs r1, #1
	orrs r1, r3
	strb r1, [r4, #1]
	ldrb r3, [r4, #1]
	movs r1, #0xf0
	bics r3, r1
	strb r3, [r4, #1]
	movs r1, #0
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	str r2, [r0, #0x28]
	movs r0, #5
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov103_021EDB18

	thumb_func_start ov103_021EDB60
ov103_021EDB60: @ 0x021EDB60
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	cmp r1, #1
	bne _021EDB90
	movs r1, #0
	movs r2, #1
	bl ov103_021EE110
	movs r1, #1
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov103_021EE110
	movs r0, #0xc
	str r0, [sp]
	movs r1, #4
	ldr r0, _021EDBAC @ =0x04000050
	movs r2, #8
	adds r3, r1, #0
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
_021EDB90:
	movs r1, #0
	adds r2, r1, #0
	bl ov103_021EE110
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov103_021EE110
	ldr r0, _021EDBAC @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021EDBAC: .4byte 0x04000050
	thumb_func_end ov103_021EDB60

	thumb_func_start ov103_021EDBB0
ov103_021EDBB0: @ 0x021EDBB0
	push {r4, lr}
	adds r4, r0, #0
	bl ov103_021ED23C
	adds r0, r4, #0
	bl ov103_021EE930
	adds r0, r4, #0
	bl ov103_021EE210
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EDBB0

	thumb_func_start ov103_021EDBC8
ov103_021EDBC8: @ 0x021EDBC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #4
	movs r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #5
	movs r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #6
	movs r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #4
	ldr r0, [r0]
	bl FUN_0201CAE0
	ldr r0, [r4, #0xc]
	movs r1, #5
	ldr r0, [r0]
	bl FUN_0201CAE0
	pop {r4, pc}
	thumb_func_end ov103_021EDBC8

	thumb_func_start ov103_021EDC00
ov103_021EDC00: @ 0x021EDC00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl FUN_0207879C
	adds r4, r0, #0
	ldrb r0, [r5, #0x1f]
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0202B3F0
	bl FUN_0207808C
	strh r0, [r5, #0x22]
	ldrh r1, [r5, #0x22]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0x9d
	bl FUN_02078398
	cmp r0, #1
	bne _021EDC46
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	movs r0, #0x80
	adds r5, #0x21
	bics r1, r0
	strb r1, [r5]
	pop {r3, r4, r5, pc}
_021EDC46:
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r1, [r0]
	movs r0, #0x80
	adds r5, #0x21
	orrs r0, r1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EDC00

	thumb_func_start ov103_021EDC58
ov103_021EDC58: @ 0x021EDC58
	ldr r3, _021EDC64 @ =FUN_0202B544
	adds r2, r0, #0
	ldr r0, [r2, #4]
	movs r1, #0
	ldrb r2, [r2, #0x1f]
	bx r3
	.align 2, 0
_021EDC64: .4byte FUN_0202B544
	thumb_func_end ov103_021EDC58

	thumb_func_start ov103_021EDC68
ov103_021EDC68: @ 0x021EDC68
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x9c
	movs r1, #0x44
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x44
	adds r4, r0, #0
	blx FUN_020D4994
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl FUN_02074904
	str r0, [r4]
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl FUN_0207879C
	str r0, [r4, #4]
	ldr r0, [r5]
	movs r1, #0
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	adds r0, r4, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r6, [r0]
	strh r7, [r4, #0x28]
	ldr r0, [r5, #8]
	adds r1, r4, #0
	ldr r0, [r0, #4]
	adds r1, #0x26
	str r0, [r4, #0x1c]
	ldr r0, [r5, #8]
	ldr r0, [r0, #8]
	str r0, [r4, #0x20]
	ldr r0, [sp]
	strb r0, [r1]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021EDC68

	thumb_func_start ov103_021EDCC8
ov103_021EDCC8: @ 0x021EDCC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021EDCDC @ =0x0210159C
	ldr r1, [r4, #0x14]
	movs r2, #0x9c
	bl FUN_0200724C
	str r0, [r4, #0x10]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021EDCDC: .4byte 0x0210159C
	thumb_func_end ov103_021EDCC8

	thumb_func_start ov103_021EDCE0
ov103_021EDCE0: @ 0x021EDCE0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	adds r0, #0x26
	ldrb r4, [r0]
	cmp r4, #5
	bhi _021EDD08
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl FUN_02074904
	adds r1, r4, #0
	bl FUN_02074644
	adds r2, r0, #0
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	movs r3, #0x9c
	bl FUN_02091004
_021EDD08:
	ldr r0, [r5, #0x14]
	bl FUN_0201AB0C
	movs r0, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EDCE0

	thumb_func_start ov103_021EDD14
ov103_021EDD14: @ 0x021EDD14
	push {r4, lr}
	adds r1, r0, #0
	adds r1, #0x21
	ldrb r1, [r1]
	ldr r2, [r0, #0x14]
	movs r3, #0x7f
	bics r1, r3
	adds r3, r2, #0
	adds r3, #0x26
	ldrb r4, [r3]
	movs r3, #0x7f
	adds r2, #0x27
	ands r3, r4
	orrs r3, r1
	adds r1, r0, #0
	adds r1, #0x21
	strb r3, [r1]
	adds r1, r0, #0
	ldrb r2, [r2]
	adds r1, #0x20
	strb r2, [r1]
	ldr r0, [r0, #0x14]
	bl FUN_0201AB0C
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov103_021EDD14

	thumb_func_start ov103_021EDD48
ov103_021EDD48: @ 0x021EDD48
	push {r3, lr}
	ldr r0, [r0, #0x14]
	bl FUN_0201AB0C
	movs r0, #8
	pop {r3, pc}
	thumb_func_end ov103_021EDD48

	thumb_func_start ov103_021EDD54
ov103_021EDD54: @ 0x021EDD54
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x22]
	bl FUN_02078078
	adds r3, r0, #0
	movs r0, #0x9c
	adds r2, r4, #0
	str r0, [sp]
	adds r2, #0x21
	ldrb r2, [r2]
	ldr r0, [r4, #8]
	movs r1, #2
	lsls r2, r2, #0x19
	ldr r0, [r0]
	lsrs r2, r2, #0x19
	bl FUN_02090E68
	ldr r1, [r4, #8]
	movs r2, #0x9c
	ldr r1, [r1, #8]
	str r1, [r0, #0x1c]
	str r0, [r4, #0x14]
	ldr r0, _021EDD94 @ =0x021EEC58
	ldr r1, [r4, #0x14]
	bl FUN_0200724C
	str r0, [r4, #0x10]
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_021EDD94: .4byte 0x021EEC58
	thumb_func_end ov103_021EDD54

	thumb_func_start ov103_021EDD98
ov103_021EDD98: @ 0x021EDD98
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl FUN_02090F6C
	str r0, [r4, #0x24]
	cmp r0, #1
	bne _021EDDD8
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl FUN_02074904
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	bl FUN_02074644
	adds r1, r0, #0
	ldr r0, [r4, #0x14]
	bl FUN_02090F70
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl FUN_0207879C
	ldrh r1, [r4, #0x22]
	movs r2, #1
	movs r3, #0x9c
	bl FUN_02078434
_021EDDD8:
	ldr r0, [r4, #0x14]
	bl FUN_02090F90
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EDD98

	thumb_func_start ov103_021EDDE4
ov103_021EDDE4: @ 0x021EDDE4
	push {r4, lr}
	adds r4, r0, #0
	bl ov103_021EDC00
	adds r0, r4, #0
	bl ov103_021EDC58
	adds r0, r4, #0
	bl ov103_021ED0A0
	adds r0, r4, #0
	bl ov103_021ED00C
	movs r1, #0x2e
	ldr r0, [r4, #0xc]
	lsls r1, r1, #4
	ldrh r1, [r0, r1]
	cmp r1, #0xa
	bhi _021EDE1C
	movs r1, #0
	adds r2, r1, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	movs r1, #1
	movs r2, #0
	bl ov103_021EE0CC
_021EDE1C:
	ldr r1, [r4, #0xc]
	ldr r0, _021EDE58 @ =0x000002E2
	ldrh r1, [r1, r0]
	ldrh r0, [r4, #0x1c]
	cmp r0, r1
	bls _021EDE2E
	strh r1, [r4, #0x1c]
	movs r0, #0
	strb r0, [r4, #0x1e]
_021EDE2E:
	adds r0, r4, #0
	bl ov103_021EE644
	adds r0, r4, #0
	bl ov103_021ED0C0
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	ldr r0, [r0, #4]
	bl FUN_0201980C
	adds r0, r4, #0
	movs r1, #1
	bl ov103_021EE8A8
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x12
	bl ov103_021EDA70
	pop {r4, pc}
	.align 2, 0
_021EDE58: .4byte 0x000002E2
	thumb_func_end ov103_021EDDE4

	thumb_func_start ov103_021EDE5C
ov103_021EDE5C: @ 0x021EDE5C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x22]
	movs r1, #9
	movs r3, #0
	bl ov103_021EDC68
	movs r1, #1
	str r1, [r4, #0x18]
	movs r0, #6
	str r0, [r4, #0x28]
	adds r0, r4, #0
	bl ov103_021EDA40
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EDE5C

	thumb_func_start ov103_021EDE7C
ov103_021EDE7C: @ 0x021EDE7C
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x21
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1f
	bne _021EDE94
	movs r1, #3
	bl ov103_021EE8A8
	b _021EDE9A
_021EDE94:
	movs r1, #4
	bl ov103_021EE8A8
_021EDE9A:
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0x18
	bl ov103_021EDA70
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EDE7C

	thumb_func_start ov103_021EDEA8
ov103_021EDEA8: @ 0x021EDEA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	ldr r0, [r5, #0xc]
	bl ov103_021EE13C
	ldr r0, [r5, #0xc]
	bl ov103_021EDF88
	ldr r0, [r5, #0xc]
	bl ov103_021EE2E0
	ldr r0, [r5, #0xc]
	bl ov103_021EE160
	movs r7, #0
	ldr r6, _021EDF4C @ =0x021EED58
	adds r4, r7, #0
_021EDEDA:
	ldr r0, [r5, #0xc]
	adds r1, r6, #0
	bl ov103_021EE048
	ldr r1, [r5, #0xc]
	adds r7, r7, #1
	adds r2, r1, r4
	movs r1, #0x96
	lsls r1, r1, #2
	str r0, [r2, r1]
	adds r6, #0x34
	adds r4, r4, #4
	cmp r7, #7
	blo _021EDEDA
	ldr r0, [r5, #0xc]
	adds r1, #0x88
	ldrh r1, [r0, r1]
	cmp r1, #0xa
	bhi _021EDF14
	movs r1, #0
	adds r2, r1, #0
	bl ov103_021EE0CC
	ldr r0, [r5, #0xc]
	movs r1, #1
	movs r2, #0
	bl ov103_021EE0CC
	b _021EDF2C
_021EDF14:
	ldrh r1, [r5, #0x1c]
	cmp r1, #0
	bne _021EDF24
	movs r1, #0
	adds r2, r1, #0
	bl ov103_021EE0CC
	b _021EDF2C
_021EDF24:
	movs r1, #1
	movs r2, #0
	bl ov103_021EE0CC
_021EDF2C:
	ldr r0, [r5, #0xc]
	movs r1, #4
	movs r2, #0
	bl ov103_021EE0CC
	ldr r0, [r5, #0xc]
	movs r1, #5
	movs r2, #0
	bl ov103_021EE0CC
	ldr r0, [r5, #0xc]
	movs r1, #6
	movs r2, #0
	bl ov103_021EE0CC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EDF4C: .4byte 0x021EED58
	thumb_func_end ov103_021EDEA8

	thumb_func_start ov103_021EDF50
ov103_021EDF50: @ 0x021EDF50
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl ov103_021EE094
	ldr r0, [r4, #0xc]
	bl ov103_021EE028
	ldr r0, [r4, #0xc]
	bl ov103_021EE150
	pop {r4, pc}
	thumb_func_end ov103_021EDF50

	thumb_func_start ov103_021EDF68
ov103_021EDF68: @ 0x021EDF68
	push {r4, r5, r6, lr}
	movs r6, #0x96
	adds r5, r0, #0
	movs r4, #0
	lsls r6, r6, #2
_021EDF72:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021EDF7C
	bl FUN_0200DC18
_021EDF7C:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #7
	blo _021EDF72
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov103_021EDF68

	thumb_func_start ov103_021EDF88
ov103_021EDF88: @ 0x021EDF88
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	movs r0, #0x9d
	bl FUN_0200CF18
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl FUN_0200CF38
	movs r7, #0x95
	lsls r7, r7, #2
	add r2, sp, #0x2c
	ldr r3, _021EE01C @ =0x021EED38
	str r0, [r4, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r5, _021EE020 @ =0x021EED0C
	stm r2!, {r0, r1}
	add r3, sp, #0x18
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
	ldr r3, _021EE024 @ =0x021EED20
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r1, r7, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	movs r2, #7
	bl FUN_0200CFF4
	subs r1, r7, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0
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
_021EE01C: .4byte 0x021EED38
_021EE020: .4byte 0x021EED0C
_021EE024: .4byte 0x021EED20
	thumb_func_end ov103_021EDF88

	thumb_func_start ov103_021EE028
ov103_021EE028: @ 0x021EE028
	push {r4, lr}
	movs r1, #0x25
	adds r4, r0, #0
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r1, [r4, r1]
	bl FUN_0200D998
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0200D108
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EE028

	thumb_func_start ov103_021EE048
ov103_021EE048: @ 0x021EE048
	push {r3, lr}
	adds r2, r1, #0
	adds r3, r0, #0
	ldr r0, [r2, #0x10]
	cmp r0, #1
	bne _021EE064
	movs r1, #0x25
	lsls r1, r1, #4
	ldr r0, [r3, r1]
	adds r1, r1, #4
	ldr r1, [r3, r1]
	bl FUN_0200D734
	pop {r3, pc}
_021EE064:
	movs r1, #0x25
	lsls r1, r1, #4
	ldr r0, [r3, r1]
	adds r1, r1, #4
	ldr r1, [r3, r1]
	movs r3, #2
	lsls r3, r3, #0x14
	bl FUN_0200D740
	pop {r3, pc}
	thumb_func_end ov103_021EE048

	thumb_func_start ov103_021EE078
ov103_021EE078: @ 0x021EE078
	push {r3, r4, r5, lr}
	lsls r5, r1, #2
	movs r1, #0x96
	lsls r1, r1, #2
	adds r4, r0, r1
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _021EE090
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r4, r5]
_021EE090:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EE078

	thumb_func_start ov103_021EE094
ov103_021EE094: @ 0x021EE094
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_021EE09A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov103_021EE078
	adds r4, r4, #1
	cmp r4, #7
	blo _021EE09A
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EE094

	thumb_func_start ov103_021EE0AC
ov103_021EE0AC: @ 0x021EE0AC
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	movs r2, #0x96
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
	thumb_func_end ov103_021EE0AC

	thumb_func_start ov103_021EE0CC
ov103_021EE0CC: @ 0x021EE0CC
	push {r3, lr}
	cmp r2, #1
	bne _021EE0E4
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200DCE8
	pop {r3, pc}
_021EE0E4:
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200DCE8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov103_021EE0CC

	thumb_func_start ov103_021EE0F8
ov103_021EE0F8: @ 0x021EE0F8
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, _021EE10C @ =FUN_0200DDB8
	bx r3
	nop
_021EE10C: .4byte FUN_0200DDB8
	thumb_func_end ov103_021EE0F8

	thumb_func_start ov103_021EE110
ov103_021EE110: @ 0x021EE110
	push {r3, lr}
	cmp r2, #1
	bne _021EE128
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200E0FC
	pop {r3, pc}
_021EE128:
	lsls r1, r1, #2
	adds r1, r0, r1
	movs r0, #0x96
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_0200E0FC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov103_021EE110

	thumb_func_start ov103_021EE13C
ov103_021EE13C: @ 0x021EE13C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x14
	movs r1, #0x9d
	bl FUN_02007688
	movs r1, #0x9d
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov103_021EE13C

	thumb_func_start ov103_021EE150
ov103_021EE150: @ 0x021EE150
	movs r1, #0x9d
	lsls r1, r1, #2
	ldr r3, _021EE15C @ =FUN_0200770C
	ldr r0, [r0, r1]
	bx r3
	nop
_021EE15C: .4byte FUN_0200770C
	thumb_func_end ov103_021EE150

	thumb_func_start ov103_021EE160
ov103_021EE160: @ 0x021EE160
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, _021EE208 @ =0x000037F0
	adds r5, r0, #0
	movs r6, #0
	movs r7, #2
_021EE16C:
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	bl FUN_020741BC
	str r6, [sp]
	adds r3, r0, #0
	str r7, [sp, #4]
	movs r0, #0x25
	movs r1, #0x95
	movs r2, #0x9d
	str r4, [sp, #8]
	lsls r0, r0, #4
	lsls r1, r1, #2
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200D504
	ldr r0, _021EE20C @ =0x000037F2
	adds r4, r4, #1
	cmp r4, r0
	bls _021EE16C
	bl FUN_02074490
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021EE208 @ =0x000037F0
	movs r2, #0x25
	lsls r2, r2, #4
	str r0, [sp, #0xc]
	adds r1, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x24
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200D5D4
	bl FUN_02074494
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021EE208 @ =0x000037F0
	movs r2, #0x25
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r1, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x24
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200D6EC
	bl FUN_02074498
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _021EE208 @ =0x000037F0
	movs r2, #0x25
	lsls r2, r2, #4
	str r0, [sp, #4]
	adds r1, r2, #4
	ldr r0, [r5, r2]
	adds r2, #0x24
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200D71C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EE208: .4byte 0x000037F0
_021EE20C: .4byte 0x000037F2
	thumb_func_end ov103_021EE160

	thumb_func_start ov103_021EE210
ov103_021EE210: @ 0x021EE210
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldrb r0, [r5, #0x1f]
	movs r4, #0
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r7, [r1, r0]
	adds r6, r4, #0
_021EE228:
	adds r0, r7, #0
	bl FUN_0202B4E4
	lsls r1, r4, #0x18
	adds r3, r0, #0
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	movs r2, #2
	bl FUN_0202B404
	add r1, sp, #0x10
	strh r0, [r1]
	adds r0, r1, #0
	ldrh r1, [r0]
	ldr r0, _021EE2DC @ =0x0000FFFF
	cmp r1, r0
	beq _021EE254
	lsls r0, r1, #0x14
	lsrs r0, r0, #0x14
	str r0, [sp, #4]
	cmp r0, #7
	bne _021EE260
_021EE254:
	ldr r0, [r5, #0xc]
	adds r1, r4, #4
	movs r2, #0
	bl ov103_021EE0CC
	b _021EE2CE
_021EE260:
	ldr r0, [r5, #0xc]
	adds r1, r0, r6
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #2
	blx FUN_020B802C
	str r0, [sp, #8]
	movs r0, #0x9d
	str r0, [sp]
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [sp, #4]
	movs r2, #0
	add r3, sp, #0x14
	bl FUN_02007C10
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	movs r1, #2
	ldr r0, [r0, #0x14]
	lsls r1, r1, #8
	blx DC_FlushRange
	ldr r0, [sp, #0x14]
	movs r2, #2
	ldr r0, [r0, #0x14]
	ldr r1, [sp, #8]
	lsls r2, r2, #8
	blx FUN_020CFECC
	ldr r0, [sp, #0xc]
	bl FUN_0201AB0C
	ldr r0, [r5, #0xc]
	adds r1, r0, r6
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0x10
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x1c
	bl FUN_0200DD10
	ldr r0, [r5, #0xc]
	adds r1, r4, #4
	movs r2, #1
	bl ov103_021EE0CC
_021EE2CE:
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #3
	blo _021EE228
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EE2DC: .4byte 0x0000FFFF
	thumb_func_end ov103_021EE210

	thumb_func_start ov103_021EE2E0
ov103_021EE2E0: @ 0x021EE2E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0xfc
	movs r1, #0x9d
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EE36C @ =0x000037F3
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #7
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021EE370 @ =0x000037F1
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0xa
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021EE370 @ =0x000037F1
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #8
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _021EE370 @ =0x000037F1
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #9
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EE36C: .4byte 0x000037F3
_021EE370: .4byte 0x000037F1
	thumb_func_end ov103_021EE2E0

	thumb_func_start ov103_021EE374
ov103_021EE374: @ 0x021EE374
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #2
	movs r2, #0xe0
	movs r3, #0xb0
	bl ov103_021EE0F8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	bl ov103_021EE0AC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EE374

	thumb_func_start ov103_021EE390
ov103_021EE390: @ 0x021EE390
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r0, #4
	movs r1, #0x9d
	bl FUN_02002CEC
	movs r6, #0
	ldr r4, _021EE3BC @ =0x021EEEC4
	adds r5, r6, #0
_021EE3A2:
	ldr r1, [r7, #0xc]
	adds r2, r4, #0
	ldr r0, [r1]
	adds r1, #0x48
	adds r1, r1, r5
	bl FUN_0201D4F8
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #0x1e
	blo _021EE3A2
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EE3BC: .4byte 0x021EEEC4
	thumb_func_end ov103_021EE390

	thumb_func_start ov103_021EE3C0
ov103_021EE3C0: @ 0x021EE3C0
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r6, r0, #0
	adds r5, r4, #0
_021EE3C8:
	ldr r0, [r6, #0xc]
	adds r0, #0x48
	adds r0, r0, r5
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #0x1e
	blo _021EE3C8
	movs r0, #4
	bl FUN_02002DB4
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov103_021EE3C0

	thumb_func_start ov103_021EE3E4
ov103_021EE3E4: @ 0x021EE3E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	adds r7, r1, #0
	adds r5, r2, #0
	adds r4, r3, #0
	cmp r0, #1
	bne _021EE402
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	subs r5, r5, r0
	b _021EE412
_021EE402:
	cmp r0, #2
	bne _021EE412
	ldr r0, [sp, #0x28]
	movs r2, #0
	bl FUN_02002F30
	lsrs r0, r0, #1
	subs r5, r5, r0
_021EE412:
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r2, r7, #0
	adds r3, r5, #0
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021EE3E4

	thumb_func_start ov103_021EE430
ov103_021EE430: @ 0x021EE430
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r3, #0
	adds r4, r2, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	ldr r0, [sp, #0x28]
	adds r5, #0x48
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
	bl ov103_021EE3E4
	adds r0, r6, #0
	bl FUN_02026380
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov103_021EE430

	thumb_func_start ov103_021EE468
ov103_021EE468: @ 0x021EE468
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	str r1, [sp, #0x18]
	ldr r1, [r5, #0xc]
	lsls r0, r3, #2
	adds r6, r1, #0
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	adds r6, #0x48
	lsls r7, r2, #4
	str r0, [sp, #0x20]
	bl FUN_0202B3E8
	adds r1, r0, #0
	movs r0, #0x23
	ldr r2, [r5, #0xc]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	bl FUN_020269A0
	movs r4, #0
	str r4, [sp, #0x1c]
_021EE49A:
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r5, #0xc]
	movs r2, #0
	adds r0, r6, r7
	adds r1, #8
	adds r3, r2, #0
	bl FUN_0201D9D8
	movs r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r5, #0xc]
	movs r2, #0
	adds r0, r6, r7
	adds r1, #0x28
	adds r3, r2, #0
	bl FUN_0201D9D8
	ldr r0, [sp, #0x1c]
	adds r4, #8
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blo _021EE49A
	ldr r0, [sp, #0x20]
	bl FUN_0202B3EC
	cmp r0, #0
	bne _021EE514
	movs r0, #4
	str r0, [sp]
	ldr r0, _021EE548 @ =0x00030200
	movs r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r1, #0x23
	ldr r3, [r5, #0xc]
	lsls r1, r1, #4
	ldr r1, [r3, r1]
	adds r0, r6, r7
	adds r3, r2, #0
	bl ov103_021EE3E4
	b _021EE530
_021EE514:
	movs r0, #4
	str r0, [sp]
	ldr r0, _021EE54C @ =0x00050400
	movs r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	movs r1, #0x23
	ldr r3, [r5, #0xc]
	lsls r1, r1, #4
	ldr r1, [r3, r1]
	adds r0, r6, r7
	adds r3, r2, #0
	bl ov103_021EE3E4
_021EE530:
	adds r0, r6, r7
	bl FUN_0201D8A0
	ldr r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #4]
	adds r2, r6, r7
	bl FUN_02019A60
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_021EE548: .4byte 0x00030200
_021EE54C: .4byte 0x00050400
	thumb_func_end ov103_021EE468

	thumb_func_start ov103_021EE550
ov103_021EE550: @ 0x021EE550
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r0, #0x76
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0xc]
	movs r1, #0x2c
	str r1, [sp]
	movs r3, #0
	str r3, [sp, #4]
	ldr r1, _021EE604 @ =0x00010200
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	movs r1, #0x8a
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	movs r2, #0x19
	bl ov103_021EE430
	movs r0, #0x76
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl FUN_0201D5C8
	movs r0, #0x66
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0xc]
	movs r1, #0x18
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	ldr r1, _021EE608 @ =0x000F0100
	movs r2, #0x15
	str r1, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	movs r1, #0x8a
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	movs r3, #3
	bl ov103_021EE430
	movs r0, #0x66
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl FUN_0201D5C8
	movs r0, #0x6a
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldr r0, [r4, #0xc]
	movs r1, #0x18
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r3, #4
	ldr r1, _021EE608 @ =0x000F0100
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	movs r1, #0x8a
	lsls r1, r1, #2
	ldr r1, [r0, r1]
	movs r2, #0x16
	bl ov103_021EE430
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021EE604: .4byte 0x00010200
_021EE608: .4byte 0x000F0100
	thumb_func_end ov103_021EE550

	thumb_func_start ov103_021EE60C
ov103_021EE60C: @ 0x021EE60C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x66
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EE60C

	thumb_func_start ov103_021EE628
ov103_021EE628: @ 0x021EE628
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x6a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D8E4
	movs r0, #0x66
	lsls r0, r0, #2
	adds r0, r4, r0
	bl FUN_0201D5C8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EE628

	thumb_func_start ov103_021EE644
ov103_021EE644: @ 0x021EE644
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #0x6e
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0x8a
	ldr r3, [r5, #0xc]
	lsls r2, r2, #2
	ldr r0, [r3, r2]
	adds r2, #8
	ldr r2, [r3, r2]
	movs r1, #2
	bl FUN_0200BB6C
	movs r1, #0x6e
	ldr r2, [r5, #0xc]
	movs r3, #0
	ldr r0, _021EE780 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	movs r0, #2
	lsls r1, r1, #2
	str r0, [sp, #8]
	adds r0, r2, r1
	adds r1, #0x78
	ldr r1, [r2, r1]
	movs r2, #0x14
	bl ov103_021EE3E4
	movs r1, #0x23
	ldr r2, [r5, #0xc]
	lsls r1, r1, #4
	movs r0, #0
	ldr r1, [r2, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0
	lsls r4, r0, #0x10
	movs r0, #0x8b
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	ldr r2, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	ldrh r2, [r5, #0x1c]
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r0, #0x8a
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200BBA0
	movs r1, #0x8b
	ldr r2, [r5, #0xc]
	lsls r1, r1, #2
	adds r6, r0, #0
	ldr r0, [r2, r1]
	adds r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r1, #0x23
	ldr r2, [r5, #0xc]
	lsls r1, r1, #4
	movs r0, #0
	ldr r1, [r2, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r6, #0x6e
	ldr r1, [r5, #0xc]
	movs r3, #0
	ldr r0, _021EE780 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	lsls r6, r6, #2
	adds r0, r1, r6
	str r3, [sp, #8]
	adds r6, #0x78
	ldr r1, [r1, r6]
	lsrs r4, r4, #0x11
	movs r6, #0x14
	subs r6, r6, r4
	subs r2, r6, r2
	bl ov103_021EE3E4
	ldr r6, [r5, #0xc]
	movs r1, #0
	movs r2, #0x8b
	str r1, [sp]
	movs r3, #1
	str r3, [sp, #4]
	lsls r2, r2, #2
	ldr r0, [r6, r2]
	adds r2, #0xb6
	ldrh r2, [r6, r2]
	adds r2, r2, #1
	bl FUN_0200BFCC
	movs r0, #0x8a
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_0200BBA0
	movs r1, #0x8b
	ldr r2, [r5, #0xc]
	lsls r1, r1, #2
	adds r6, r0, #0
	ldr r0, [r2, r1]
	adds r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, r6, #0
	bl FUN_0200CBBC
	adds r0, r6, #0
	bl FUN_02026380
	movs r1, #0x6e
	ldr r2, [r5, #0xc]
	movs r3, #0
	ldr r0, _021EE780 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	lsls r1, r1, #2
	adds r0, r2, r1
	str r3, [sp, #8]
	adds r1, #0x78
	ldr r1, [r2, r1]
	adds r4, #0x14
	adds r2, r4, #0
	bl ov103_021EE3E4
	movs r0, #0x6e
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021EE780: .4byte 0x00010200
	thumb_func_end ov103_021EE644

	thumb_func_start ov103_021EE784
ov103_021EE784: @ 0x021EE784
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldrb r0, [r6, #0x1f]
	ldr r1, [r6, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r5, [r1, r0]
	movs r0, #8
	movs r1, #0x9d
	bl FUN_02026354
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0202B3E8
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_020269A0
	adds r0, r5, #0
	bl FUN_0202B3EC
	adds r3, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0x8b
	ldr r1, [r6, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	adds r2, r4, #0
	bl FUN_0200BE3C
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov103_021EE784

	thumb_func_start ov103_021EE7DC
ov103_021EE7DC: @ 0x021EE7DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r6, #0x72
	ldr r4, [r5, #0xc]
	lsls r6, r6, #2
	adds r0, r4, r6
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [r5]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _021EE820 @ =0x0001020F
	adds r2, r6, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	adds r0, r4, r6
	ldr r4, [r5, #0xc]
	adds r2, #0x68
	ldr r2, [r4, r2]
	movs r1, #1
	bl FUN_020200FC
	adds r1, r6, #0
	ldr r2, [r5, #0xc]
	adds r1, #0x6c
	strb r0, [r2, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EE820: .4byte 0x0001020F
	thumb_func_end ov103_021EE7DC

	thumb_func_start ov103_021EE824
ov103_021EE824: @ 0x021EE824
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r1, #0
	bl ov103_021EE784
	movs r0, #0x8a
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #9
	bl FUN_0200BBA0
	movs r1, #0x8b
	ldr r2, [r5, #0xc]
	lsls r1, r1, #2
	adds r4, r0, #0
	ldr r0, [r2, r1]
	adds r1, r1, #4
	ldr r1, [r2, r1]
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl ov103_021EE7DC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EE824

	thumb_func_start ov103_021EE860
ov103_021EE860: @ 0x021EE860
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x72
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r2, _021EE884 @ =0x000003E2
	movs r1, #1
	movs r3, #0xd
	bl FUN_0200E998
	movs r0, #0x72
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl FUN_0201D5C8
	pop {r4, pc}
	.align 2, 0
_021EE884: .4byte 0x000003E2
	thumb_func_end ov103_021EE860

	thumb_func_start ov103_021EE888
ov103_021EE888: @ 0x021EE888
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x72
	ldr r1, [r4, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #1
	bl FUN_0200E9BC
	ldr r0, [r4, #0xc]
	movs r1, #0
	ldr r0, [r0]
	bl FUN_0201EFBC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov103_021EE888

	thumb_func_start ov103_021EE8A8
ov103_021EE8A8: @ 0x021EE8A8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #4
	bhi _021EE928
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EE8BC: @ jump table
	.2byte _021EE8C6 - _021EE8BC - 2 @ case 0
	.2byte _021EE8DA - _021EE8BC - 2 @ case 1
	.2byte _021EE8EE - _021EE8BC - 2 @ case 2
	.2byte _021EE902 - _021EE8BC - 2 @ case 3
	.2byte _021EE916 - _021EE8BC - 2 @ case 4
_021EE8C6:
	movs r2, #0x8a
	ldr r3, [r4, #0xc]
	lsls r2, r2, #2
	ldr r0, [r3, r2]
	adds r2, #8
	ldr r2, [r3, r2]
	movs r1, #0xa
	bl FUN_0200BB6C
	b _021EE928
_021EE8DA:
	movs r2, #0x8a
	ldr r3, [r4, #0xc]
	lsls r2, r2, #2
	ldr r0, [r3, r2]
	adds r2, #8
	ldr r2, [r3, r2]
	movs r1, #0xb
	bl FUN_0200BB6C
	b _021EE928
_021EE8EE:
	movs r2, #0x8a
	ldr r3, [r4, #0xc]
	lsls r2, r2, #2
	ldr r0, [r3, r2]
	adds r2, #8
	ldr r2, [r3, r2]
	movs r1, #0xc
	bl FUN_0200BB6C
	b _021EE928
_021EE902:
	movs r2, #0x8a
	ldr r3, [r4, #0xc]
	lsls r2, r2, #2
	ldr r0, [r3, r2]
	adds r2, #8
	ldr r2, [r3, r2]
	movs r1, #0xd
	bl FUN_0200BB6C
	b _021EE928
_021EE916:
	movs r2, #0x8a
	ldr r3, [r4, #0xc]
	lsls r2, r2, #2
	ldr r0, [r3, r2]
	adds r2, #8
	ldr r2, [r3, r2]
	movs r1, #0xe
	bl FUN_0200BB6C
_021EE928:
	adds r0, r4, #0
	bl ov103_021EE7DC
	pop {r4, pc}
	thumb_func_end ov103_021EE8A8

	thumb_func_start ov103_021EE930
ov103_021EE930: @ 0x021EE930
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r4, #0
	adds r5, r0, #0
	adds r7, r4, #0
_021EE93A:
	adds r0, r4, #0
	adds r0, #0x1a
	lsls r6, r0, #4
	ldr r0, [r5, #0xc]
	adds r1, r7, #0
	adds r0, #0x48
	adds r0, r0, r6
	bl FUN_0201D978
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0x1a
	adds r2, r4, #0
	bl ov103_021EE9C8
	ldr r0, [r5, #0xc]
	adds r0, #0x48
	adds r0, r0, r6
	bl FUN_0201D5C8
	adds r4, r4, #1
	cmp r4, #3
	blo _021EE93A
	movs r0, #0x86
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0
	bl FUN_0201D978
	ldrb r0, [r5, #0x1f]
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl FUN_0202B3E8
	adds r1, r0, #0
	movs r0, #0x23
	ldr r2, [r5, #0xc]
	lsls r0, r0, #4
	ldr r0, [r2, r0]
	bl FUN_020269A0
	movs r1, #0x86
	ldr r4, [r5, #0xc]
	movs r3, #1
	ldr r0, _021EE9C4 @ =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	movs r2, #0
	lsls r1, r1, #2
	adds r0, r4, r1
	str r2, [sp, #8]
	adds r1, #0x18
	ldr r1, [r4, r1]
	bl ov103_021EE3E4
	movs r0, #0x86
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r0, r1, r0
	bl FUN_0201D5C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021EE9C4: .4byte 0x00010200
	thumb_func_end ov103_021EE930

	thumb_func_start ov103_021EE9C8
ov103_021EE9C8: @ 0x021EE9C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldrb r0, [r5, #0x1f]
	adds r4, r1, #0
	ldr r1, [r5, #0xc]
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	lsls r1, r2, #0x18
	lsrs r1, r1, #0x18
	bl FUN_0202B4E8
	adds r6, r0, #0
	bl FUN_02015920
	cmp r0, #0
	beq _021EEA1C
	adds r0, r6, #0
	movs r1, #0x9d
	bl FUN_02015898
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	ldr r0, _021EEA20 @ =0x00010200
	movs r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r1, [r5, #0xc]
	lsls r0, r4, #4
	adds r1, #0x48
	adds r0, r1, r0
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov103_021EE3E4
	adds r0, r6, #0
	bl FUN_02026380
_021EEA1C:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021EEA20: .4byte 0x00010200
	thumb_func_end ov103_021EE9C8

	thumb_func_start ov103_021EEA24
ov103_021EEA24: @ 0x021EEA24
	push {r3, lr}
	ldr r1, [r0, #0xc]
	ldr r0, _021EEA40 @ =0x000002E2
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _021EEA36
	movs r0, #0
	mvns r0, r0
	pop {r3, pc}
_021EEA36:
	ldr r0, _021EEA44 @ =0x021EEFBC
	bl FUN_02025224
	pop {r3, pc}
	nop
_021EEA40: .4byte 0x000002E2
_021EEA44: .4byte 0x021EEFBC
	thumb_func_end ov103_021EEA24

	thumb_func_start ov103_021EEA48
ov103_021EEA48: @ 0x021EEA48
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	ldr r0, _021EEA90 @ =0x000002E2
	ldrh r1, [r1, r0]
	ldrh r0, [r5, #0x1c]
	cmp r0, r1
	bls _021EEA60
	strh r1, [r5, #0x1c]
	movs r4, #0
	b _021EEA62
_021EEA60:
	ldrb r4, [r5, #0x1e]
_021EEA62:
	movs r0, #1
	str r0, [sp]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x9d
	str r0, [sp, #8]
	ldr r0, _021EEA94 @ =0x021EEFD8
	ldr r1, _021EEA98 @ =0x021EF008
	ldr r2, _021EEA9C @ =0x021EEFC8
	adds r3, r5, #0
	bl FUN_02019BA4
	movs r1, #0x9e
	ldr r2, [r5, #0xc]
	lsls r1, r1, #2
	str r0, [r2, r1]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov103_021EEAC8
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_021EEA90: .4byte 0x000002E2
_021EEA94: .4byte 0x021EEFD8
_021EEA98: .4byte 0x021EF008
_021EEA9C: .4byte 0x021EEFC8
	thumb_func_end ov103_021EEA48

	thumb_func_start ov103_021EEAA0
ov103_021EEAA0: @ 0x021EEAA0
	ldr r1, [r0, #0xc]
	movs r0, #0x9e
	lsls r0, r0, #2
	ldr r3, _021EEAAC @ =FUN_02019BDC
	ldr r0, [r1, r0]
	bx r3
	.align 2, 0
_021EEAAC: .4byte FUN_02019BDC
	thumb_func_end ov103_021EEAA0

	thumb_func_start ov103_021EEAB0
ov103_021EEAB0: @ 0x021EEAB0
	bx lr
	.align 2, 0
	thumb_func_end ov103_021EEAB0

	thumb_func_start ov103_021EEAB4
ov103_021EEAB4: @ 0x021EEAB4
	bx lr
	.align 2, 0
	thumb_func_end ov103_021EEAB4

	thumb_func_start ov103_021EEAB8
ov103_021EEAB8: @ 0x021EEAB8
	ldr r3, _021EEABC @ =ov103_021EEAC8
	bx r3
	.align 2, 0
_021EEABC: .4byte ov103_021EEAC8
	thumb_func_end ov103_021EEAB8

	thumb_func_start ov103_021EEAC0
ov103_021EEAC0: @ 0x021EEAC0
	ldr r3, _021EEAC4 @ =ov103_021EEAC8
	bx r3
	.align 2, 0
_021EEAC4: .4byte ov103_021EEAC8
	thumb_func_end ov103_021EEAC0

	thumb_func_start ov103_021EEAC8
ov103_021EEAC8: @ 0x021EEAC8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x9e
	ldr r2, [r5, #0xc]
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	adds r4, r1, #0
	bl FUN_0201A018
	adds r3, r0, #0
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r5, #0xc]
	movs r1, #2
	bl ov103_021EE0F8
	cmp r4, #0xa
	ldr r0, [r5, #0xc]
	bne _021EEAF8
	movs r1, #2
	movs r2, #4
	bl ov103_021EE0AC
	pop {r3, r4, r5, pc}
_021EEAF8:
	movs r1, #2
	movs r2, #5
	bl ov103_021EE0AC
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov103_021EEAC8

	thumb_func_start ov103_021EEB04
ov103_021EEB04: @ 0x021EEB04
	push {r3, lr}
	ldr r0, _021EEB2C @ =0x021EEFB4
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021EEB18
	movs r0, #1
	pop {r3, pc}
_021EEB18:
	ldr r0, _021EEB30 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _021EEB26
	movs r0, #1
	pop {r3, pc}
_021EEB26:
	movs r0, #0
	pop {r3, pc}
	nop
_021EEB2C: .4byte 0x021EEFB4
_021EEB30: .4byte 0x021D110C
	thumb_func_end ov103_021EEB04

	.rodata

_021EEB34:
	.byte 0x03, 0x00, 0x00, 0x0C, 0x00, 0x00, 0xFD, 0x02, 0xE2, 0x02, 0xA9, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x25, 0x59, 0x1E, 0x02, 0x8D, 0x59, 0x1E, 0x02
	.byte 0xE9, 0x5A, 0x1E, 0x02, 0x37, 0x00, 0x00, 0x00, 0xE5, 0xDD, 0x1E, 0x02, 0xD9, 0xD9, 0x1E, 0x02
	.byte 0x5D, 0xDE, 0x1E, 0x02, 0x7D, 0xDE, 0x1E, 0x02, 0xC9, 0xDC, 0x1E, 0x02, 0xE1, 0xDC, 0x1E, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0xC9, 0xDC, 0x1E, 0x02, 0x15, 0xDD, 0x1E, 0x02, 0x14, 0x00, 0x00, 0x00
	.byte 0x55, 0xDD, 0x1E, 0x02, 0x99, 0xDD, 0x1E, 0x02, 0x17, 0x00, 0x00, 0x00, 0xC9, 0xDC, 0x1E, 0x02
	.byte 0x49, 0xDD, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x15, 0xD3, 0x1E, 0x02, 0xE9, 0xD3, 0x1E, 0x02
	.byte 0x61, 0xD4, 0x1E, 0x02, 0x7D, 0xD4, 0x1E, 0x02, 0xD5, 0xD4, 0x1E, 0x02, 0x3D, 0xD5, 0x1E, 0x02
	.byte 0x51, 0xD5, 0x1E, 0x02, 0x69, 0xD5, 0x1E, 0x02, 0xA9, 0xD5, 0x1E, 0x02, 0xB5, 0xD5, 0x1E, 0x02
	.byte 0x51, 0xD7, 0x1E, 0x02, 0x61, 0xD7, 0x1E, 0x02, 0xA5, 0xD7, 0x1E, 0x02, 0xD9, 0xD7, 0x1E, 0x02
	.byte 0xE5, 0xD7, 0x1E, 0x02, 0xD1, 0xD8, 0x1E, 0x02, 0xF9, 0xD8, 0x1E, 0x02, 0x31, 0xD9, 0x1E, 0x02
	.byte 0x3D, 0xD9, 0x1E, 0x02, 0x55, 0xD9, 0x1E, 0x02, 0x61, 0xD9, 0x1E, 0x02, 0x7D, 0xD9, 0x1E, 0x02
	.byte 0x9D, 0xD9, 0x1E, 0x02, 0xAD, 0xD9, 0x1E, 0x02, 0xD9, 0xD9, 0x1E, 0x02, 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x18, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xF3, 0x37, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xF3, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x10, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xF3, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xF3, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00
	.byte 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x00, 0xA0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xF2, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00
	.byte 0xF0, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xF0, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xE0, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xD0, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xC0, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xB0, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xA0, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x90, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x80, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x70, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x60, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x50, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x40, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x30, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x20, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x10, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x00, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xF0, 0x02, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xE0, 0x02, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xD0, 0x02, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xC0, 0x02, 0x01, 0x04, 0x01, 0x08, 0x02, 0x01, 0xF0, 0x03, 0x01, 0x19, 0x15, 0x06
	.byte 0x02, 0x0F, 0xE4, 0x03, 0x01, 0x19, 0x15, 0x06, 0x02, 0x0F, 0xD8, 0x03, 0x01, 0x0A, 0x15, 0x05
	.byte 0x02, 0x0F, 0xCE, 0x03, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0E, 0x01, 0x00, 0x06, 0x01, 0x01, 0x0B
	.byte 0x02, 0x0F, 0x01, 0x00, 0x04, 0x03, 0x03, 0x1A, 0x04, 0x01, 0x01, 0x00, 0x04, 0x03, 0x08, 0x1A
	.byte 0x04, 0x01, 0x69, 0x00, 0x04, 0x03, 0x0D, 0x1A, 0x04, 0x01, 0xD1, 0x00, 0x04, 0x15, 0x14, 0x08
	.byte 0x02, 0x01, 0x39, 0x01, 0xA0, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xA0, 0xBF, 0x08, 0x27
	.byte 0xA0, 0xBF, 0x28, 0x47, 0xFF, 0x00, 0x00, 0x00, 0xB1, 0xEA, 0x1E, 0x02, 0xB5, 0xEA, 0x1E, 0x02
	.byte 0xB9, 0xEA, 0x1E, 0x02, 0xC1, 0xEA, 0x1E, 0x02, 0x00, 0x1F, 0x08, 0x77, 0x00, 0x1F, 0x88, 0xF4
	.byte 0x20, 0x3F, 0x08, 0x77, 0x20, 0x3F, 0x88, 0xF4, 0x40, 0x5F, 0x08, 0x77, 0x40, 0x5F, 0x88, 0xF4
	.byte 0x60, 0x7F, 0x08, 0x77, 0x60, 0x7F, 0x88, 0xF4, 0x80, 0x9F, 0x08, 0x77, 0x80, 0x9F, 0x88, 0xF4
	.byte 0xA0, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x40, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01
	.byte 0xC0, 0x10, 0x00, 0x00, 0x01, 0x03, 0x00, 0x01, 0x40, 0x30, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03
	.byte 0xC0, 0x30, 0x00, 0x00, 0x01, 0x05, 0x02, 0x03, 0x40, 0x50, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05
	.byte 0xC0, 0x50, 0x00, 0x00, 0x03, 0x07, 0x04, 0x05, 0x40, 0x70, 0x00, 0x00, 0x04, 0x08, 0x06, 0x07
	.byte 0xC0, 0x70, 0x00, 0x00, 0x05, 0x09, 0x06, 0x07, 0x40, 0x90, 0x00, 0x00, 0x06, 0x0A, 0x08, 0x09
	.byte 0xC0, 0x90, 0x00, 0x00, 0x07, 0x0A, 0x08, 0x09, 0xE0, 0xB0, 0x00, 0x00, 0x89, 0x0A, 0x0A, 0x0A
	@ 0x021EF060
