
	thumb_func_start MOD64_021E5900
MOD64_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #0
	bl FUN_02022C9C
	movs r0, #0
	bl FUN_02022D04
	ldr r0, _021E59B4 @ =0x04000050
	movs r1, #0
	strh r1, [r0]
	ldr r0, _021E59B8 @ =0x04001050
	strh r1, [r0]
	bl FUN_020210BC
	movs r0, #4
	bl FUN_02021148
	ldr r2, _021E59BC @ =0x04000304
	ldr r0, _021E59C0 @ =0xFFFF7FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r2, #1
	movs r0, #3
	movs r1, #0x3b
	lsls r2, r2, #0x12
	bl FUN_0201A910
	movs r1, #0x1d
	adds r0, r5, #0
	lsls r1, r1, #4
	movs r2, #0x3b
	bl FUN_02007280
	movs r2, #0x1d
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	bl FUN_0202E298
	movs r1, #0x6e
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0xb4
	movs r1, #0x3b
	bl FUN_02007688
	movs r1, #0x61
	lsls r1, r1, #2
	str r0, [r4, r1]
	bl FUN_021E5B00
	adds r0, r4, #0
	bl FUN_021E5B10
	adds r0, r4, #0
	bl FUN_021E5CD0
	adds r0, r4, #0
	bl FUN_021E607C
	adds r0, r4, #0
	bl FUN_021E6170
	adds r0, r4, #0
	bl FUN_021E622C
	adds r0, r4, #0
	movs r1, #0
	bl FUN_021E652C
	ldr r0, _021E59C4 @ =0x021E5A89
	adds r1, r4, #0
	bl FUN_0201A0FC
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E59B4: .4byte 0x04000050
_021E59B8: .4byte 0x04001050
_021E59BC: .4byte 0x04000304
_021E59C0: .4byte 0xFFFF7FFF
_021E59C4: .4byte 0x021E5A89
	thumb_func_end MOD64_021E5900
_021E59C8:
	.byte 0x38, 0xB5, 0x05, 0x1C, 0x21, 0xF6, 0x60, 0xFC
	.byte 0x04, 0x1C, 0x00, 0x20, 0x21, 0x1C, 0x34, 0xF6, 0x91, 0xFB, 0x20, 0x1C, 0x00, 0xF0, 0x40, 0xFC
	.byte 0x20, 0x1C, 0x00, 0xF0, 0x13, 0xFC, 0x20, 0x1C, 0x00, 0xF0, 0x96, 0xFB, 0x20, 0x1C, 0x00, 0xF0
	.byte 0x1D, 0xFB, 0x20, 0x1C, 0x00, 0xF0, 0x56, 0xF9, 0x61, 0x20, 0x80, 0x00, 0x20, 0x58, 0x21, 0xF6
	.byte 0x85, 0xFE, 0x3B, 0xF6, 0x19, 0xFC, 0x28, 0x1C, 0x21, 0xF6, 0x44, 0xFC, 0x3B, 0x20, 0x34, 0xF6
	.byte 0xD9, 0xFF, 0x01, 0x20, 0x38, 0xBD, 0x00, 0x00, 0x38, 0xB5, 0x0C, 0x1C, 0x21, 0xF6, 0x38, 0xFC
	.byte 0x21, 0x68, 0x05, 0x1C, 0x03, 0x29, 0x25, 0xD8, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88, 0x09, 0x04
	.byte 0x09, 0x14, 0x8F, 0x44, 0x06, 0x00, 0x12, 0x00, 0x22, 0x00, 0x32, 0x00, 0x00, 0xF0, 0x24, 0xFC
	.byte 0x20, 0x68, 0x40, 0x1C, 0x20, 0x60, 0x15, 0xE0, 0x2A, 0xF6, 0x88, 0xF8, 0x01, 0x28, 0x11, 0xD1
	.byte 0x20, 0x68, 0x40, 0x1C, 0x20, 0x60, 0x0D, 0xE0, 0x00, 0xF0, 0x36, 0xFC, 0x00, 0x28, 0x09, 0xD1
	.byte 0x20, 0x68, 0x40, 0x1C, 0x20, 0x60, 0x05, 0xE0, 0x2A, 0xF6, 0x78, 0xF8, 0x01, 0x28, 0x01, 0xD1
	.byte 0x01, 0x20, 0x38, 0xBD, 0x28, 0x1C, 0x00, 0xF0, 0xF1, 0xFA, 0x4D, 0x20, 0x80, 0x00, 0x28, 0x58
	.byte 0x27, 0xF6, 0xCE, 0xFA, 0x00, 0x20, 0x38, 0xBD, 0x08, 0xB5, 0x40, 0x68, 0x39, 0xF6, 0x12, 0xFA
	.byte 0x27, 0xF6, 0xD0, 0xFA, 0x03, 0x4B, 0x04, 0x49, 0x01, 0x20, 0x5A, 0x58, 0x10, 0x43, 0x58, 0x50
	.byte 0x08, 0xBD, 0xC0, 0x46, 0x00, 0x00, 0x7E, 0x02, 0xF8, 0x3F, 0x00, 0x00

	thumb_func_start FUN_021E5AAC
FUN_021E5AAC: @ 0x021E5AAC
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	blx FUN_020D2894
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020CFE74
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end FUN_021E5AAC

	thumb_func_start FUN_021E5AC8
FUN_021E5AC8: @ 0x021E5AC8
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	blx FUN_020D2894
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020CFECC
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end FUN_021E5AC8

	thumb_func_start FUN_021E5AE4
FUN_021E5AE4: @ 0x021E5AE4
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	blx FUN_020D2894
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020CFD18
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end FUN_021E5AE4

	thumb_func_start FUN_021E5B00
FUN_021E5B00: @ 0x021E5B00
	ldr r3, _021E5B08 @ =FUN_02022BE8
	ldr r0, _021E5B0C @ =0x021E6FAC
	bx r3
	nop
_021E5B08: .4byte FUN_02022BE8
_021E5B0C: .4byte 0x021E6FAC
	thumb_func_end FUN_021E5B00

	thumb_func_start FUN_021E5B10
FUN_021E5B10: @ 0x021E5B10
	push {r3, r4, r5, lr}
	sub sp, #0x90
	adds r5, r0, #0
	movs r0, #0x3b
	bl FUN_0201AC88
	add r3, sp, #0x80
	ldr r4, _021E5C90 @ =0x021E6E88
	str r0, [r5, #4]
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r4, _021E5C94 @ =0x021E6F50
	add r3, sp, #0x64
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #0
	str r0, [r3]
	ldr r0, [r5, #4]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #4]
	movs r1, #0
	bl FUN_0201CAE0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3b
	bl FUN_0201C1C4
	ldr r4, _021E5C98 @ =0x021E6EFC
	add r3, sp, #0x48
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #1
	str r0, [r3]
	ldr r0, [r5, #4]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r4, _021E5C9C @ =0x021E6F18
	add r3, sp, #0x2c
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
	ldr r0, [r5, #4]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #4]
	movs r1, #4
	bl FUN_0201CAE0
	movs r0, #4
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3b
	bl FUN_0201C1C4
	ldr r4, _021E5CA0 @ =0x021E6F34
	add r3, sp, #0x10
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	movs r1, #5
	str r0, [r3]
	ldr r0, [r5, #4]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #0x61
	movs r1, #0x3b
	bl FUN_02007688
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r2, #0x3b
	str r2, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r4, r0, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x3b
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	adds r3, r1, #0
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3b
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3b
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	movs r1, #3
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3b
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r3, #5
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3b
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #5
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	adds r0, r4, #0
	bl FUN_0200770C
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3b
	bl FUN_02003030
	movs r1, #0x1e
	movs r0, #4
	lsls r1, r1, #4
	movs r2, #0x3b
	bl FUN_02003030
	add sp, #0x90
	pop {r3, r4, r5, pc}
	nop
_021E5C90: .4byte 0x021E6E88
_021E5C94: .4byte 0x021E6F50
_021E5C98: .4byte 0x021E6EFC
_021E5C9C: .4byte 0x021E6F18
_021E5CA0: .4byte 0x021E6F34
	thumb_func_end FUN_021E5B10
_021E5CA4:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x60, 0x68, 0x05, 0x21, 0x35, 0xF6, 0x4E, 0xFF
	.byte 0x60, 0x68, 0x04, 0x21, 0x35, 0xF6, 0x4A, 0xFF, 0x60, 0x68, 0x01, 0x21, 0x35, 0xF6, 0x46, 0xFF
	.byte 0x60, 0x68, 0x00, 0x21, 0x35, 0xF6, 0x42, 0xFF, 0x60, 0x68, 0x34, 0xF6, 0x1F, 0xFF, 0x10, 0xBD

	thumb_func_start FUN_021E5CD0
FUN_021E5CD0: @ 0x021E5CD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	adds r5, r0, #0
	movs r0, #0x3b
	bl FUN_0200CF18
	movs r1, #0x13
	lsls r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl FUN_0200CF38
	movs r7, #0x4d
	lsls r7, r7, #2
	add r2, sp, #0x3c
	ldr r3, _021E5FD4 @ =0x021E6F8C
	str r0, [r5, r7]
	ldm r3!, {r0, r1}
	adds r6, r2, #0
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	ldr r4, _021E5FD8 @ =0x021E6EB8
	stm r2!, {r0, r1}
	add r3, sp, #0x28
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r4]
	adds r1, r6, #0
	str r0, [r3]
	subs r0, r7, #4
	ldr r0, [r5, r0]
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r3, _021E5FDC @ =0x021E6EE4
	add r2, sp, #0x10
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	subs r1, r7, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	movs r2, #0x12
	bl FUN_0200CFF4
	subs r1, r7, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0x10
	bl FUN_0200D3F8
	subs r0, r7, #4
	ldr r0, [r5, r0]
	bl FUN_0200CF6C
	movs r2, #2
	movs r1, #0
	lsls r2, r2, #0x14
	bl FUN_02009FC8
	movs r0, #8
	movs r1, #0x3b
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021E5FE0 @ =0x0000DCC0
	subs r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x4c
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	ldr r0, _021E5FE4 @ =0x0000DCC1
	subs r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x4c
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021E5FE0 @ =0x0000DCC0
	subs r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	ldr r0, _021E5FE4 @ =0x0000DCC1
	subs r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5FE0 @ =0x0000DCC0
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x4d
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _021E5FE0 @ =0x0000DCC0
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	movs r3, #0x4e
	bl FUN_0200D71C
	adds r0, r4, #0
	bl FUN_0200770C
	movs r0, #0x61
	movs r1, #0x3b
	bl FUN_02007688
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E5FE8 @ =0x0000DCCE
	subs r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #6
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E5FEC @ =0x0000DCC3
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #7
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E5FEC @ =0x0000DCC3
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #8
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	ldr r0, _021E5FE8 @ =0x0000DCCE
	subs r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #9
	bl FUN_0200D5D4
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E5FE4 @ =0x0000DCC1
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #0xb
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E5FE4 @ =0x0000DCC1
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #0xc
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E5FF0 @ =0x0000DCC2
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #0xe
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _021E5FF0 @ =0x0000DCC2
	subs r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #0xf
	bl FUN_0200D71C
	ldr r4, _021E5FF0 @ =0x0000DCC2
	movs r7, #0
_021E5EF0:
	str r7, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x13
	movs r1, #0x4d
	str r4, [sp, #0xc]
	lsls r0, r0, #4
	lsls r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	adds r2, r6, #0
	movs r3, #0x10
	bl FUN_0200D5D4
	ldr r0, _021E5FF4 @ =0x0000DCCD
	adds r4, r4, #1
	cmp r4, r0
	bls _021E5EF0
	adds r0, r6, #0
	bl FUN_0200770C
	movs r1, #0x13
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	movs r3, #2
	ldr r1, [r5, r1]
	ldr r2, _021E5FF8 @ =0x021E70C8
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0x4e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #8
	subs r1, r1, #4
	movs r3, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E5FFC @ =0x021E70FC
	lsls r3, r3, #0x14
	bl FUN_0200D740
	movs r1, #0x4f
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r0, r1, #4
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r1, #0x13
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021E6000 @ =0x021E73A0
	bl FUN_0200D734
	movs r1, #0x17
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x40
	subs r1, #0x3c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E6004 @ =0x021E73D4
	bl FUN_0200D734
	movs r1, #0x5d
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x44
	subs r1, #0x40
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E6008 @ =0x021E7408
	bl FUN_0200D734
	movs r1, #0x5e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r1, #0
	subs r0, #0x48
	subs r1, #0x44
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E600C @ =0x021E743C
	bl FUN_0200D734
	movs r1, #0x5f
	lsls r1, r1, #2
	str r0, [r5, r1]
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_021E5FD4: .4byte 0x021E6F8C
_021E5FD8: .4byte 0x021E6EB8
_021E5FDC: .4byte 0x021E6EE4
_021E5FE0: .4byte 0x0000DCC0
_021E5FE4: .4byte 0x0000DCC1
_021E5FE8: .4byte 0x0000DCCE
_021E5FEC: .4byte 0x0000DCC3
_021E5FF0: .4byte 0x0000DCC2
_021E5FF4: .4byte 0x0000DCCD
_021E5FF8: .4byte 0x021E70C8
_021E5FFC: .4byte 0x021E70FC
_021E6000: .4byte 0x021E73A0
_021E6004: .4byte 0x021E73D4
_021E6008: .4byte 0x021E7408
_021E600C: .4byte 0x021E743C
	thumb_func_end FUN_021E5CD0
_021E6010:
	.byte 0x38, 0xB5, 0x8D, 0x00, 0x4E, 0x21, 0x89, 0x00, 0x44, 0x18, 0x60, 0x59, 0x00, 0x28, 0x03, 0xD0
	.byte 0x27, 0xF6, 0xDC, 0xFC, 0x00, 0x20, 0x60, 0x51, 0x38, 0xBD, 0x00, 0x00, 0x38, 0xB5, 0x04, 0x1C
	.byte 0x00, 0x25, 0x20, 0x1C, 0x29, 0x1C, 0xFF, 0xF7, 0xEB, 0xFF, 0x6D, 0x1C, 0x12, 0x2D, 0xF8, 0xD3
	.byte 0x13, 0x21, 0x09, 0x01, 0x60, 0x58, 0x09, 0x1D, 0x61, 0x58, 0x27, 0xF6, 0xA5, 0xFC, 0x13, 0x20
	.byte 0x00, 0x01, 0x20, 0x58, 0x27, 0xF6, 0x58, 0xF8, 0x38, 0xBD, 0x00, 0x00, 0x70, 0xB5, 0x4E, 0x26
	.byte 0x05, 0x1C, 0x00, 0x24, 0xB6, 0x00, 0xA8, 0x59, 0x00, 0x28, 0x01, 0xD0, 0x27, 0xF6, 0xD4, 0xFD
	.byte 0x64, 0x1C, 0x2D, 0x1D, 0x12, 0x2C, 0xF6, 0xD3, 0x70, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E607C
FUN_021E607C: @ 0x021E607C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb5
	movs r3, #0x3b
	bl FUN_0200BAF8
	movs r1, #0x46
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #1
	movs r1, #0x1b
	movs r2, #0xed
	movs r3, #0x3b
	bl FUN_0200BAF8
	movs r1, #0x47
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r2, _021E6114 @ =0x000002EE
	movs r0, #1
	movs r1, #0x1b
	movs r3, #0x3b
	bl FUN_0200BAF8
	movs r1, #0x12
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0x3b
	bl FUN_0200BD08
	movs r1, #0x49
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x24
	adds r0, r1, #0
	movs r1, #0x3b
	bl FUN_02026354
	movs r1, #0x4a
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x28
	adds r0, r1, #0
	movs r1, #0x3b
	bl FUN_02026354
	movs r1, #0x4b
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0x2c
	adds r0, r1, #0
	movs r1, #0x3b
	bl FUN_02026354
	movs r1, #0x69
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #0xa4
	adds r0, r1, #0
	movs r1, #0x3b
	bl FUN_02026354
	movs r1, #0x6a
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r0, r1, #4
	ldr r2, [r4, r0]
	adds r0, r1, #0
	subs r0, #0x20
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	subs r1, #0x1c
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_021E6114: .4byte 0x000002EE
	thumb_func_end FUN_021E607C
_021E6118:
	.byte 0x10, 0xB5, 0x04, 0x1C, 0x6A, 0x20, 0x80, 0x00
	.byte 0x20, 0x58, 0x40, 0xF6, 0x2D, 0xF9, 0x69, 0x20, 0x80, 0x00, 0x20, 0x58, 0x40, 0xF6, 0x28, 0xF9
	.byte 0x4B, 0x20, 0x80, 0x00, 0x20, 0x58, 0x40, 0xF6, 0x23, 0xF9, 0x4A, 0x20, 0x80, 0x00, 0x20, 0x58
	.byte 0x40, 0xF6, 0x1E, 0xF9, 0x49, 0x20, 0x80, 0x00, 0x20, 0x58, 0x25, 0xF6, 0x29, 0xFE, 0x12, 0x20
	.byte 0x00, 0x01, 0x20, 0x58, 0x25, 0xF6, 0xF6, 0xFC, 0x47, 0x20, 0x80, 0x00, 0x20, 0x58, 0x25, 0xF6
	.byte 0xF1, 0xFC, 0x46, 0x20, 0x80, 0x00, 0x20, 0x58, 0x25, 0xF6, 0xEC, 0xFC, 0x10, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E6170
FUN_021E6170: @ 0x021E6170
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	movs r0, #4
	movs r1, #0x3b
	bl FUN_02002CEC
	adds r5, r6, #0
	ldr r4, _021E6204 @ =0x021E7040
	movs r7, #0
	adds r5, #8
_021E6186:
	ldr r0, [r6, #4]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r7, r7, #1
	adds r4, #8
	adds r5, #0x10
	cmp r7, #0x11
	blo _021E6186
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r6, r0
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0x46
	lsls r2, r2, #2
	ldr r0, [r6, r2]
	adds r2, #0x10
	ldr r2, [r6, r2]
	movs r1, #6
	bl FUN_0200BB6C
	movs r1, #0x4a
	lsls r1, r1, #2
	ldr r1, [r6, r1]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	lsrs r4, r3, #1
	movs r3, #0x18
	str r1, [sp]
	movs r2, #0xff
	ldr r0, _021E6208 @ =0x000F0100
	str r2, [sp, #4]
	str r0, [sp, #8]
	adds r0, r2, #0
	str r1, [sp, #0xc]
	adds r2, #0x29
	adds r0, #9
	ldr r2, [r6, r2]
	adds r0, r6, r0
	movs r1, #4
	subs r3, r3, r4
	bl FUN_020200FC
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D8A0
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r6, r0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6204: .4byte 0x021E7040
_021E6208: .4byte 0x000F0100
	thumb_func_end FUN_021E6170
_021E620C:
	.byte 0x38, 0xB5, 0x05, 0x1C
	.byte 0x00, 0x24, 0x08, 0x35, 0x28, 0x1C, 0x37, 0xF6, 0x83, 0xF9, 0x64, 0x1C, 0x10, 0x35, 0x11, 0x2C
	.byte 0xF8, 0xD3, 0x04, 0x20, 0x1C, 0xF6, 0xC6, 0xFD, 0x38, 0xBD, 0x00, 0x00

	thumb_func_start FUN_021E622C
FUN_021E622C: @ 0x021E622C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x3b
	str r0, [sp, #8]
	ldr r0, _021E6254 @ =0x021E6F6C
	ldr r1, _021E6258 @ =0x021E7008
	ldr r2, _021E625C @ =0x021E6EA8
	adds r3, r4, #0
	bl FUN_02019BA4
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_021E6254: .4byte 0x021E6F6C
_021E6258: .4byte 0x021E7008
_021E625C: .4byte 0x021E6EA8
	thumb_func_end FUN_021E622C
_021E6260:
	.byte 0x06, 0x21, 0x89, 0x01, 0x01, 0x4B, 0x40, 0x58, 0x18, 0x47, 0xC0, 0x46, 0xDD, 0x9B, 0x01, 0x02
	.byte 0x70, 0x47, 0x00, 0x00, 0x70, 0x47, 0x00, 0x00, 0x00, 0x4B, 0x18, 0x47, 0xD9, 0x6B, 0x1E, 0x02
	.byte 0x00, 0x4B, 0x18, 0x47, 0xD9, 0x6B, 0x1E, 0x02, 0x00, 0xB5, 0x83, 0xB0, 0x06, 0x20, 0x00, 0x90
	.byte 0x01, 0x21, 0x01, 0x91, 0x3B, 0x20, 0x02, 0x90, 0x00, 0x20, 0x0A, 0x1C, 0x03, 0x1C, 0x29, 0xF6
	.byte 0xC1, 0xFB, 0x03, 0xB0, 0x00, 0xBD, 0x00, 0x00, 0x00, 0xB5, 0x83, 0xB0, 0x06, 0x20, 0x00, 0x90
	.byte 0x01, 0x20, 0x01, 0x90, 0x3B, 0x20, 0x02, 0x90, 0x00, 0x20, 0x01, 0x1C, 0x02, 0x1C, 0x03, 0x1C
	.byte 0x29, 0xF6, 0xB0, 0xFB, 0x03, 0xB0, 0x00, 0xBD, 0x38, 0xB5, 0x72, 0x21, 0x04, 0x1C, 0x89, 0x00
	.byte 0x61, 0x58, 0x04, 0x29, 0x65, 0xD8, 0x49, 0x18, 0x79, 0x44, 0xC9, 0x88, 0x09, 0x04, 0x09, 0x14
	.byte 0x8F, 0x44, 0x08, 0x00, 0xBA, 0x01, 0xCE, 0x01, 0xE0, 0x01, 0xF0, 0x01, 0x7E, 0x48, 0x3E, 0xF6
	.byte 0x99, 0xFF, 0x00, 0x28, 0x16, 0xD1, 0x6D, 0x21, 0x89, 0x00, 0x60, 0x58, 0x00, 0x28, 0x50, 0xDD
	.byte 0x08, 0x1C, 0x0F, 0x22, 0x08, 0x30, 0x22, 0x50, 0x08, 0x1C, 0x02, 0x22, 0x18, 0x30, 0x22, 0x50
	.byte 0x01, 0x20, 0x14, 0x31, 0x60, 0x50, 0x20, 0x1C, 0x00, 0xF0, 0xEE, 0xF8, 0x73, 0x48, 0x1F, 0xF6
	.byte 0x95, 0xFE, 0xDE, 0xE0, 0x01, 0x28, 0x1A, 0xD1, 0x6E, 0x21, 0x89, 0x00, 0x63, 0x58, 0x01, 0x2B
	.byte 0x37, 0xDB, 0x08, 0x1F, 0x22, 0x58, 0x58, 0x1E, 0x82, 0x42, 0x32, 0xD0, 0x10, 0x22, 0x08, 0x1D
	.byte 0x22, 0x50, 0x08, 0x1C, 0x03, 0x22, 0x14, 0x30, 0x22, 0x50, 0x01, 0x20, 0x10, 0x31, 0x60, 0x50
	.byte 0x20, 0x1C, 0x00, 0xF0, 0xD1, 0xF8, 0x65, 0x48, 0x1F, 0xF6, 0x78, 0xFE, 0xC1, 0xE0, 0x06, 0x20
	.byte 0x80, 0x01, 0x20, 0x58, 0x33, 0xF6, 0xD8, 0xFC, 0x02, 0x21, 0x05, 0x1C, 0xC9, 0x43, 0x8D, 0x42
	.byte 0x13, 0xD8, 0x40, 0xD2, 0x06, 0x2D, 0x0C, 0xD8, 0x68, 0x19, 0x78, 0x44, 0xC0, 0x88, 0x00, 0x04
	.byte 0x00, 0x14, 0x87, 0x44, 0x26, 0x00, 0x26, 0x00, 0x26, 0x00, 0x26, 0x00, 0x26, 0x00, 0x26, 0x00
	.byte 0x4C, 0x00, 0x03, 0x20, 0xC0, 0x43, 0x85, 0x42, 0xA3, 0xE0, 0x48, 0x1C, 0x85, 0x42, 0x01, 0xD8
	.byte 0x17, 0xD0, 0x9E, 0xE0, 0x88, 0x1C, 0x85, 0x42, 0x32, 0xD0, 0x9A, 0xE0, 0x20, 0x1C, 0x29, 0x1C
	.byte 0x00, 0xF0, 0xE4, 0xF9, 0x4E, 0x48, 0x81, 0x6C, 0x01, 0x20, 0x08, 0x42, 0x04, 0xD1, 0x6B, 0x20
	.byte 0x80, 0x00, 0x20, 0x58, 0x85, 0x42, 0x00, 0xD3, 0x8B, 0xE0, 0x48, 0x48, 0x1F, 0xF6, 0x3E, 0xFE
	.byte 0x87, 0xE0, 0x46, 0x48, 0x1F, 0xF6, 0x3A, 0xFE, 0x6F, 0x21, 0x11, 0x20, 0x89, 0x00, 0x60, 0x50
	.byte 0x08, 0x1C, 0x04, 0x22, 0x10, 0x30, 0x22, 0x50, 0x08, 0x1C, 0x0C, 0x30, 0x20, 0x58, 0x0C, 0x31
	.byte 0x40, 0x1C, 0x60, 0x50, 0x75, 0xE0, 0x06, 0x20, 0x80, 0x01, 0x20, 0x58, 0x33, 0xF6, 0xBA, 0xFD
	.byte 0x01, 0x1C, 0x20, 0x1C, 0x00, 0xF0, 0xBA, 0xF9, 0x38, 0x48, 0x1F, 0xF6, 0x1F, 0xFE, 0x68, 0xE0
	.byte 0x06, 0x20, 0x80, 0x01, 0x20, 0x58, 0x33, 0xF6, 0xAD, 0xFD, 0x35, 0x49, 0xCA, 0x6C, 0x10, 0x21
	.byte 0x11, 0x42, 0x1E, 0xD0, 0x02, 0x28, 0x01, 0xD0, 0x05, 0x28, 0x5A, 0xD1, 0x6E, 0x21, 0x89, 0x00
	.byte 0x63, 0x58, 0x01, 0x2B, 0x55, 0xDB, 0x08, 0x1F, 0x22, 0x58, 0x58, 0x1E, 0x82, 0x42, 0x50, 0xD0
	.byte 0x10, 0x22, 0x08, 0x1D, 0x22, 0x50, 0x08, 0x1C, 0x03, 0x22, 0x14, 0x30, 0x22, 0x50, 0x01, 0x20
	.byte 0x10, 0x31, 0x60, 0x50, 0x20, 0x1C, 0x00, 0xF0, 0x4F, 0xF8, 0x24, 0x48, 0x1F, 0xF6, 0xF6, 0xFD
	.byte 0x3F, 0xE0, 0x20, 0x21, 0x11, 0x42, 0x3C, 0xD0, 0x00, 0x28, 0x01, 0xD0, 0x03, 0x28, 0x38, 0xD1
	.byte 0x6D, 0x21, 0x89, 0x00, 0x60, 0x58, 0x00, 0x28, 0x33, 0xDD, 0x08, 0x1C, 0x0F, 0x22, 0x08, 0x30
	.byte 0x22, 0x50, 0x08, 0x1C, 0x02, 0x22, 0x18, 0x30, 0x22, 0x50, 0x01, 0x20, 0x14, 0x31, 0x60, 0x50
	.byte 0x20, 0x1C, 0x00, 0xF0, 0x31, 0xF8, 0x15, 0x48, 0x1F, 0xF6, 0xD8, 0xFD, 0x21, 0xE0, 0x00, 0xF0
	.byte 0x71, 0xFB, 0x00, 0x28, 0x1D, 0xD1, 0x73, 0x20, 0x80, 0x00, 0x21, 0x58, 0x00, 0x1F, 0x21, 0x50
	.byte 0x17, 0xE0, 0x00, 0x21, 0xC9, 0x43, 0x00, 0xF0, 0x39, 0xF8, 0x72, 0x20, 0x00, 0x21, 0x80, 0x00
	.byte 0x21, 0x50, 0x0E, 0xE0, 0x01, 0x21, 0x00, 0xF0, 0x31, 0xF8, 0x72, 0x20, 0x00, 0x21, 0x80, 0x00
	.byte 0x21, 0x50, 0x06, 0xE0, 0xFF, 0xF7, 0xE8, 0xFE, 0x06, 0x48, 0x1F, 0xF6, 0xB7, 0xFD, 0x00, 0x20
	.byte 0x38, 0xBD, 0x01, 0x20, 0x38, 0xBD, 0xC0, 0x46, 0x7C, 0x6E, 0x1E, 0x02, 0xDC, 0x05, 0x00, 0x00
	.byte 0x0C, 0x11, 0x1D, 0x02, 0x0D, 0x06, 0x00, 0x00, 0xF8, 0xB5, 0x05, 0x1C, 0x02, 0x24, 0x28, 0x1C
	.byte 0x21, 0x1C, 0xFF, 0xF7, 0x85, 0xFD, 0x64, 0x1C, 0x0D, 0x2C, 0xF8, 0xD9, 0x06, 0x4C, 0x4D, 0x27
	.byte 0x26, 0x1C, 0xBF, 0x00, 0x0B, 0x36, 0xE8, 0x59, 0x21, 0x1C, 0x27, 0xF6, 0x1D, 0xFA, 0x64, 0x1C
	.byte 0xB4, 0x42, 0xF8, 0xD9, 0xF8, 0xBD, 0xC0, 0x46, 0xC2, 0xDC, 0x00, 0x00

	thumb_func_start FUN_021E652C
FUN_021E652C: @ 0x021E652C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	movs r2, #0x6d
	adds r5, r0, #0
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r0, r0, r1
	str r0, [r5, r2]
	ldr r1, [r5, r2]
	cmp r1, #0
	bge _021E6548
	movs r0, #0
	str r0, [r5, r2]
	b _021E6554
_021E6548:
	adds r0, r2, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	blt _021E6554
	subs r0, r0, #1
	str r0, [r5, r2]
_021E6554:
	movs r1, #0x6e
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _021E6576
	subs r1, #0x44
	ldr r0, [r5, r1]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x5e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	b _021E65BA
_021E6576:
	subs r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E658A
	subs r1, #0x44
	ldr r0, [r5, r1]
	movs r1, #0
	bl FUN_0200DCE8
	b _021E6594
_021E658A:
	subs r1, #0x44
	ldr r0, [r5, r1]
	movs r1, #1
	bl FUN_0200DCE8
_021E6594:
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r1, r0, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r0]
	subs r1, r1, #1
	cmp r2, r1
	bne _021E65B0
	subs r0, #0x3c
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	b _021E65BA
_021E65B0:
	subs r0, #0x3c
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_0200DCE8
_021E65BA:
	movs r1, #0x6d
	lsls r1, r1, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl FUN_0202E2C4
	movs r1, #0x1b
	lsls r1, r1, #4
	str r0, [r5, r1]
	adds r1, r1, #4
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl FUN_0202E2F8
	movs r1, #0x6b
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r1, #0x1a
	ldrh r0, [r5, r1]
	cmp r0, #0
	bne _021E65F0
	ldr r0, _021E6744 @ =0x0000DCC2
	movs r7, #2
	str r0, [sp, #0x14]
	movs r0, #7
	str r0, [sp, #0x10]
	b _021E65FA
_021E65F0:
	ldr r0, _021E6748 @ =0x0000DCC8
	movs r7, #8
	str r0, [sp, #0x14]
	movs r0, #0xf
	str r0, [sp, #0x10]
_021E65FA:
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r4, #0
	cmp r0, #0
	bls _021E6656
	lsls r0, r7, #2
	adds r6, r5, r0
_021E660A:
	movs r1, #0x6d
	lsls r1, r1, #2
	movs r3, #0x62
	lsls r3, r3, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	adds r2, r4, #0
	adds r3, r5, r3
	bl FUN_0202E344
	ldr r0, [sp, #0x14]
	adds r1, r7, #0
	adds r3, r0, r4
	adds r0, r5, #0
	adds r2, r4, #0
	str r3, [sp]
	bl FUN_021E6C1C
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_0200DCC0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	movs r1, #0
	bl FUN_0200DC4C
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r4, #1
	adds r7, r7, #1
	adds r6, r6, #4
	cmp r4, r0
	blo _021E660A
_021E6656:
	movs r0, #6
	lsls r0, r0, #6
	ldr r0, [r5, r0]
	bl FUN_02019F74
	adds r1, r0, #0
	adds r0, r5, #0
	bl FUN_021E677C
	ldr r0, [sp, #0x10]
	adds r4, r5, #0
	adds r4, #8
	lsls r6, r0, #4
	adds r0, r4, r6
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0x46
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #0
	bl FUN_0200BB6C
	movs r1, #0x6d
	lsls r1, r1, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl FUN_0202E2C4
	movs r1, #0
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r3, #4
	bl FUN_0200BFCC
	movs r1, #0x6d
	lsls r1, r1, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	add r2, sp, #0x18
	bl FUN_0202E3C4
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x49
	lsls r0, r0, #2
	movs r2, #0x7d
	ldr r3, [sp, #0x18]
	lsls r2, r2, #4
	adds r2, r3, r2
	ldr r0, [r5, r0]
	movs r3, #4
	bl FUN_0200BFCC
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x1c]
	movs r1, #2
	bl FUN_0200CB1C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x49
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x20]
	movs r1, #3
	movs r3, #2
	bl FUN_0200BFCC
	movs r2, #0x49
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r0, [r5, r2]
	adds r1, #8
	adds r2, r2, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E674C @ =0x000F0200
	adds r2, #0x2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r4, r6
	adds r3, r1, #0
	bl FUN_020200FC
	adds r0, r4, r6
	bl FUN_0201D8A0
	adds r0, r4, r6
	bl FUN_0201D5C8
	ldr r1, _021E6750 @ =0x000001C6
	movs r0, #1
	ldrh r2, [r5, r1]
	eors r0, r2
	strh r0, [r5, r1]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6744: .4byte 0x0000DCC2
_021E6748: .4byte 0x0000DCC8
_021E674C: .4byte 0x000F0200
_021E6750: .4byte 0x000001C6
	thumb_func_end FUN_021E652C

	thumb_func_start FUN_021E6754
FUN_021E6754: @ 0x021E6754
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x4e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r4, #4]
	movs r1, #4
	movs r2, #0
	bl FUN_0201CB28
	pop {r4, pc}
	thumb_func_end FUN_021E6754

	thumb_func_start FUN_021E677C
FUN_021E677C: @ 0x021E677C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	ldr r3, _021E6AC0 @ =0x021E6E98
	add r2, sp, #0x40
	adds r5, r0, #0
	adds r6, r1, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0x6b
	lsls r0, r0, #2
	ldr r1, [r5, r0]
	cmp r6, r1
	blo _021E67A4
	adds r0, r5, #0
	bl FUN_021E6754
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
_021E67A4:
	subs r0, #0x74
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x4f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_0200DCE8
	movs r0, #0x71
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _021E67CA
	movs r4, #0
	str r4, [sp, #0x1c]
	b _021E67D0
_021E67CA:
	movs r0, #1
	str r0, [sp, #0x1c]
	movs r4, #8
_021E67D0:
	movs r3, #0x6d
	lsls r3, r3, #2
	ldr r1, [r5, r3]
	subs r3, #0x2c
	ldr r0, [r5]
	adds r2, r6, #0
	adds r3, r5, r3
	bl FUN_0202E344
	movs r1, #0x66
	lsls r1, r1, #2
	ldrh r0, [r5, r1]
	subs r1, #8
	ldr r1, [r5, r1]
	bl FUN_0206FFC8
	movs r2, #0x61
	lsls r2, r2, #2
	str r0, [sp, #0x20]
	ldr r0, [r5, r2]
	adds r2, #0x14
	ldrh r2, [r5, r2]
	add r1, sp, #0x3c
	bl FUN_020729D8
	movs r3, #0x19
	lsls r3, r3, #4
	ldr r0, [r5, r3]
	ldr r1, [sp, #0x20]
	str r0, [sp]
	adds r0, r3, #0
	adds r0, #8
	adds r3, #0xb
	lsls r1, r1, #0x18
	ldrh r0, [r5, r0]
	ldrb r3, [r5, r3]
	lsrs r1, r1, #0x18
	movs r2, #2
	bl FUN_020708D8
	adds r7, r0, #0
	ldr r0, [sp, #0x1c]
	add r3, sp, #0x3c
	movs r2, #0
	lsls r6, r0, #2
	movs r0, #0x4e
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp, #0x24]
	ldrsb r2, [r3, r2]
	adds r7, #0x40
	movs r1, #0x40
	subs r2, r7, r2
	lsls r2, r2, #0x10
	ldr r0, [r0, r6]
	asrs r2, r2, #0x10
	lsls r3, r1, #0xf
	bl FUN_0200DDF4
	movs r1, #0x65
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_02070068
	cmp r0, #0
	beq _021E685C
	movs r7, #1
	b _021E685E
_021E685C:
	movs r7, #0
_021E685E:
	movs r1, #0x32
	movs r0, #0x3b
	lsls r1, r1, #6
	bl FUN_0201AACC
	movs r1, #0x19
	lsls r1, r1, #4
	str r0, [sp, #0x28]
	ldr r0, [r5, r1]
	adds r1, #8
	str r0, [sp, #0x18]
	ldrh r0, [r5, r1]
	ldr r1, [sp, #0x18]
	bl FUN_0206FFC8
	adds r2, r0, #0
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _021E6AC4 @ =0x0000019B
	str r0, [sp]
	ldrb r0, [r5, r1]
	subs r1, r1, #3
	movs r3, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	ldrh r1, [r5, r1]
	add r0, sp, #0x50
	bl FUN_020701E4
	ldr r0, [sp, #0x28]
	movs r2, #0x3b
	str r0, [sp]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	adds r0, #8
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	ldrh r0, [r5, r0]
	add r1, sp, #0x3c
	add r3, sp, #0x40
	str r0, [sp, #0x10]
	ldrh r0, [r1, #0x14]
	ldrh r1, [r1, #0x16]
	bl FUN_02014510
	ldr r0, [sp, #0x24]
	ldr r0, [r0, r6]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #2
	blx FUN_020B802C
	adds r1, r0, #0
	movs r2, #0x32
	ldr r0, [sp, #0x28]
	lsls r2, r2, #6
	bl FUN_021E5AC8
	ldr r0, [sp, #0x28]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x24]
	ldr r0, [r0, r6]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #2
	blx FUN_020B8078
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3b
	str r0, [sp, #4]
	add r1, sp, #0x3c
	ldrh r0, [r1, #0x14]
	ldrh r1, [r1, #0x18]
	movs r2, #5
	bl FUN_02007938
	ldr r0, [sp, #0x24]
	movs r1, #1
	ldr r0, [r0, r6]
	bl FUN_0200DCE8
	adds r0, r5, #0
	str r0, [sp, #0x2c]
	adds r0, #8
	movs r7, #0
	adds r6, r4, #0
	str r0, [sp, #0x2c]
_021E6920:
	ldr r0, [sp, #0x2c]
	lsls r1, r6, #4
	adds r0, r0, r1
	movs r1, #0
	bl FUN_0201D978
	adds r7, r7, #1
	adds r6, r6, #1
	cmp r7, #7
	blo _021E6920
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 @ =0x000F0200
	adds r3, r5, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r2, #0x89
	adds r3, #8
	lsls r0, r4, #4
	adds r0, r3, r0
	ldr r2, [r5, r2]
	adds r3, r1, #0
	bl FUN_020200FC
	movs r2, #0x47
	lsls r2, r2, #2
	adds r1, r2, #0
	adds r1, #0x7c
	ldr r0, [r5, r2]
	adds r2, #0xc
	ldrh r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0
	adds r0, r4, #1
	lsls r7, r0, #4
	adds r6, r5, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 @ =0x000F0200
	adds r2, #0x29
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r6, #8
	ldr r2, [r5, r2]
	adds r0, r6, r7
	adds r3, r1, #0
	bl FUN_020200FC
	movs r2, #0x66
	lsls r2, r2, #2
	ldrh r0, [r5, r2]
	cmp r0, #0x1d
	beq _021E6A18
	cmp r0, #0x20
	beq _021E6A18
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _021E69DA
	adds r0, r2, #0
	subs r0, #0x80
	subs r2, #0x6c
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	movs r1, #3
	bl FUN_0200BB6C
	movs r1, #0x4a
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 @ =0x000F0200
	adds r2, #0x2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r6, r7
	adds r3, #8
	bl FUN_020200FC
	b _021E6A18
_021E69DA:
	cmp r0, #1
	bne _021E6A18
	adds r0, r2, #0
	subs r0, #0x80
	subs r2, #0x6c
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	movs r1, #4
	bl FUN_0200BB6C
	movs r1, #0x4a
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 @ =0x000F0200
	adds r2, #0x2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r6, r7
	adds r3, #8
	bl FUN_020200FC
_021E6A18:
	movs r2, #0x46
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #1
	bl FUN_0200BB6C
	movs r1, #0
	movs r2, #0x49
	str r1, [sp]
	movs r0, #1
	lsls r2, r2, #2
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	adds r2, #0x76
	ldrb r2, [r5, r2]
	movs r3, #3
	bl FUN_0200BFCC
	movs r2, #0x49
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r0, [r5, r2]
	adds r1, #8
	adds r2, r2, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl FUN_0200CBBC
	movs r0, #0x10
	str r0, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 @ =0x000F0200
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r2, #0x2d
	ldr r2, [r5, r2]
	adds r0, r6, r7
	adds r3, r1, #0
	bl FUN_020200FC
	movs r2, #0x46
	lsls r2, r2, #2
	ldr r0, [r5, r2]
	adds r2, #0x10
	ldr r2, [r5, r2]
	movs r1, #2
	bl FUN_0200BB6C
	movs r1, #0
	adds r0, r4, #2
	lsls r7, r0, #4
	adds r6, r5, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 @ =0x000F0200
	adds r2, #0x29
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r6, #8
	ldr r2, [r5, r2]
	adds r0, r6, r7
	adds r3, r1, #0
	bl FUN_020200FC
	movs r1, #0x4a
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0
	adds r3, r0, #0
	str r1, [sp]
	movs r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 @ =0x000F0200
	b _021E6ACC
	nop
_021E6AC0: .4byte 0x021E6E98
_021E6AC4: .4byte 0x0000019B
_021E6AC8: .4byte 0x000F0200
_021E6ACC:
	adds r2, #0x8d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	adds r0, r6, r7
	bl FUN_020200FC
	movs r0, #0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	str r0, [sp, #0x30]
	adds r0, #8
	str r5, [sp, #0x38]
	adds r7, r4, #3
	str r0, [sp, #0x30]
_021E6AEA:
	movs r1, #0x67
	ldr r0, [sp, #0x38]
	lsls r1, r1, #2
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021E6B3E
	movs r0, #0x12
	movs r2, #0x4a
	lsls r0, r0, #4
	lsls r2, r2, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl FUN_0200BB6C
	movs r1, #0x4a
	lsls r1, r1, #2
	movs r0, #0
	ldr r1, [r5, r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6B80 @ =0x000F0200
	movs r2, #0x4a
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	lsls r2, r2, #2
	lsrs r6, r3, #1
	movs r3, #0x38
	ldr r0, [sp, #0x30]
	lsls r1, r7, #4
	adds r0, r0, r1
	ldr r2, [r5, r2]
	movs r1, #0
	subs r3, r3, r6
	bl FUN_020200FC
_021E6B3E:
	ldr r0, [sp, #0x38]
	adds r7, r7, #1
	adds r0, r0, #2
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	adds r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blo _021E6AEA
	adds r6, r5, #0
	movs r7, #0
	adds r6, #8
_021E6B56:
	lsls r0, r4, #4
	str r0, [sp, #0x34]
	adds r0, r6, r0
	bl FUN_0201D8A0
	ldr r0, [sp, #0x34]
	adds r0, r6, r0
	bl FUN_0201D5C8
	adds r7, r7, #1
	adds r4, r4, #1
	cmp r7, #7
	blo _021E6B56
	movs r1, #0x71
	lsls r1, r1, #2
	ldrh r2, [r5, r1]
	movs r0, #1
	eors r0, r2
	strh r0, [r5, r1]
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E6B80: .4byte 0x000F0200
	thumb_func_end FUN_021E677C
_021E6B84:
	.byte 0x10, 0xB5, 0x07, 0x21, 0x04, 0x1C, 0x89, 0x01, 0x60, 0x58, 0x00, 0x28
	.byte 0x09, 0xD1, 0x08, 0x1F, 0x20, 0x58, 0x88, 0x39, 0x80, 0x00, 0x20, 0x18, 0x40, 0x58, 0x01, 0x21
	.byte 0x27, 0xF6, 0xB6, 0xF8, 0x10, 0xE0, 0x04, 0x28, 0x09, 0xD1, 0x08, 0x1F, 0x20, 0x58, 0x88, 0x39
	.byte 0x80, 0x00, 0x20, 0x18, 0x40, 0x58, 0x00, 0x21, 0x27, 0xF6, 0xAA, 0xF8, 0x04, 0xE0, 0x06, 0x28
	.byte 0x02, 0xD1, 0x00, 0x20, 0x60, 0x50, 0x10, 0xBD, 0x07, 0x20, 0x80, 0x01, 0x21, 0x58, 0x49, 0x1C
	.byte 0x21, 0x50, 0x01, 0x20, 0x10, 0xBD, 0x00, 0x00, 0x38, 0xB5, 0x04, 0x1C, 0x06, 0x20, 0x80, 0x01
	.byte 0x20, 0x58, 0x0D, 0x1C, 0x33, 0xF6, 0x18, 0xFA, 0x02, 0x1C, 0x17, 0x20, 0x00, 0x01, 0x11, 0x78
	.byte 0x52, 0x78, 0x20, 0x58, 0x27, 0xF6, 0xE0, 0xF8, 0x06, 0x2D, 0x01, 0xD1, 0x04, 0x25, 0x00, 0xE0
	.byte 0x03, 0x25, 0x17, 0x20, 0x00, 0x01, 0x20, 0x58, 0x00, 0x21, 0x27, 0xF6, 0x59, 0xF8, 0x17, 0x20
	.byte 0x00, 0x01, 0x20, 0x58, 0x29, 0x1C, 0x27, 0xF6, 0x19, 0xF8, 0x38, 0xBD

	thumb_func_start FUN_021E6C1C
FUN_021E6C1C: @ 0x021E6C1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r5, r0, #0
	movs r0, #0x66
	lsls r0, r0, #2
	ldrh r0, [r5, r0]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	adds r7, r3, #0
	bl FUN_0206A304
	adds r2, r0, #0
	add r0, sp, #0x30
	movs r1, #0x8d
	bl FUN_02007508
	movs r0, #0x61
	movs r1, #0x3b
	bl FUN_02007688
	adds r4, r0, #0
	add r0, sp, #0x30
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _021E6C58
	ldr r0, _021E6E18 @ =0x0000DCC2
	movs r3, #0xd
	str r0, [sp, #0x20]
	movs r6, #8
	b _021E6C60
_021E6C58:
	ldr r0, _021E6E1C @ =0x0000DCC1
	movs r3, #0xa
	str r0, [sp, #0x20]
	movs r6, #4
_021E6C60:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #0x13
	str r7, [sp, #8]
	lsls r1, r1, #4
	ldr r0, [r5, r1]
	adds r1, r1, #4
	ldr r1, [r5, r1]
	adds r2, r4, #0
	bl FUN_0200D504
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r4, _021E6E20 @ =0x021E6FD4
	add r3, sp, #0x34
	movs r2, #6
_021E6C84:
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _021E6C84
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, [sp, #0x80]
	str r7, [sp, #0x48]
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x10]
	lsls r2, r0, #2
	ldr r0, _021E6E24 @ =0x021E6ECC
	ldrsh r1, [r0, r2]
	add r0, sp, #0x30
	strh r1, [r0, #4]
	ldr r1, _021E6E28 @ =0x021E6ECE
	ldrsh r1, [r1, r2]
	add r2, sp, #0x34
	strh r1, [r0, #6]
	movs r1, #0x4e
	lsls r1, r1, #2
	adds r0, r5, r1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #2
	str r0, [sp, #0x28]
	adds r0, r1, #0
	subs r0, #8
	subs r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl FUN_0200D734
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [r2, r1]
	ldr r0, [sp, #0x28]
	adds r1, r2, #0
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #1
	blx FUN_020B802C
	movs r1, #0x66
	str r0, [sp, #0x2c]
	lsls r0, r6, #5
	adds r4, r6, #0
	lsls r1, r1, #2
	muls r4, r0, r4
	ldrh r0, [r5, r1]
	subs r1, #8
	ldr r1, [r5, r1]
	bl FUN_0206FFC8
	movs r1, #0x66
	lsls r1, r1, #2
	adds r2, r0, #0
	ldrh r0, [r5, r1]
	adds r1, r1, #3
	ldrb r1, [r5, r1]
	bl FUN_021E6E30
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x51
	movs r2, #0x3b
	bl FUN_02007524
	str r0, [sp, #0x1c]
	blx FUN_020C3B50
	ldr r1, [r0, #0x14]
	str r0, [sp, #0x18]
	adds r0, r0, r1
	str r0, [sp, #0x14]
	movs r0, #0x3b
	adds r1, r4, #0
	bl FUN_0201AA8C
	adds r7, r0, #0
	movs r0, #0x66
	lsls r0, r0, #2
	ldrh r1, [r5, r0]
	ldr r0, _021E6E2C @ =0x0000FF9E
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	str r6, [sp]
	bhi _021E6D8C
	movs r0, #6
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x14]
	movs r2, #0
	str r6, [sp, #4]
	adds r0, r0, r1
	adds r1, r6, #0
	adds r3, r2, #0
	str r7, [sp, #8]
	bl FUN_020145B4
	ldr r1, [sp, #0x2c]
	adds r0, r7, #0
	adds r2, r4, #0
	bl FUN_021E5AAC
	str r6, [sp]
	movs r2, #0
	str r6, [sp, #4]
	movs r0, #7
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, [sp, #0x14]
	adds r3, r2, #0
	adds r0, r0, r1
	adds r1, r6, #0
	str r7, [sp, #8]
	bl FUN_020145B4
	ldr r1, [sp, #0x2c]
	adds r0, r7, #0
	adds r1, r1, r4
	adds r2, r4, #0
	bl FUN_021E5AAC
	b _021E6DCE
_021E6D8C:
	ldr r0, [sp, #0x14]
	lsls r1, r4, #1
	movs r2, #0
	str r6, [sp, #4]
	adds r0, r0, r1
	adds r1, r6, #0
	adds r3, r2, #0
	str r7, [sp, #8]
	bl FUN_020145B4
	ldr r1, [sp, #0x2c]
	adds r0, r7, #0
	adds r2, r4, #0
	bl FUN_021E5AAC
	lsls r0, r4, #1
	adds r1, r4, r0
	ldr r0, [sp, #0x14]
	str r6, [sp]
	movs r2, #0
	str r6, [sp, #4]
	adds r0, r0, r1
	adds r1, r6, #0
	adds r3, r2, #0
	str r7, [sp, #8]
	bl FUN_020145B4
	ldr r1, [sp, #0x2c]
	adds r0, r7, #0
	adds r1, r1, r4
	adds r2, r4, #0
	bl FUN_021E5AAC
_021E6DCE:
	adds r0, r7, #0
	bl FUN_0201AB0C
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #0x38]
	adds r4, r0, r1
	movs r1, #0x65
	lsls r1, r1, #2
	ldr r0, [r5, r1]
	subs r1, r1, #4
	ldr r1, [r5, r1]
	bl FUN_02070068
	cmp r0, #0
	beq _021E6E02
	adds r4, #0x20
_021E6E02:
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl FUN_021E5AE4
	ldr r0, [sp, #0x1c]
	bl FUN_0201AB0C
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6E18: .4byte 0x0000DCC2
_021E6E1C: .4byte 0x0000DCC1
_021E6E20: .4byte 0x021E6FD4
_021E6E24: .4byte 0x021E6ECC
_021E6E28: .4byte 0x021E6ECE
_021E6E2C: .4byte 0x0000FF9E
	thumb_func_end FUN_021E6C1C

	thumb_func_start FUN_021E6E30
FUN_021E6E30: @ 0x021E6E30
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r5, #0
	ble _021E6E42
	ldr r1, _021E6E74 @ =0x000001ED
	cmp r5, r1
	ble _021E6E46
_021E6E42:
	movs r4, #1
	b _021E6E6E
_021E6E46:
	bl FUN_0206A304
	ldr r1, _021E6E78 @ =0x00000129
	adds r4, r0, r1
	adds r0, r5, #0
	bl FUN_0206A338
	cmp r0, #0
	beq _021E6E60
	cmp r7, #1
	bne _021E6E6E
	adds r4, r4, #1
	b _021E6E6E
_021E6E60:
	adds r0, r5, #0
	bl FUN_0206A310
	cmp r6, r0
	ble _021E6E6C
	movs r6, #0
_021E6E6C:
	adds r4, r4, r6
_021E6E6E:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6E74: .4byte 0x000001ED
_021E6E78: .4byte 0x00000129
	thumb_func_end FUN_021E6E30
