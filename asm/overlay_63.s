
	thumb_func_start ov63_0221BE20
ov63_0221BE20: @ 0x0221BE20
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	movs r0, #0
	bl FUN_02022C9C
	movs r0, #0
	bl FUN_02022D04
	ldr r2, _0221BF10 @ =0x04000050
	movs r1, #0
	strh r1, [r2]
	ldr r0, _0221BF14 @ =0x04001050
	ldr r3, _0221BF18 @ =0x04000304
	strh r1, [r0]
	ldrh r1, [r3]
	lsrs r0, r3, #0xb
	lsls r2, r2, #0xc
	orrs r0, r1
	strh r0, [r3]
	movs r0, #3
	movs r1, #0x3e
	bl FUN_0201A910
	ldr r1, _0221BF1C @ =0x0001306C
	adds r0, r4, #0
	movs r2, #0x3e
	bl FUN_02007280
	ldr r2, _0221BF1C @ =0x0001306C
	movs r1, #0
	adds r5, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_020072A4
	str r0, [r5]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb4
	movs r3, #0x3e
	bl FUN_0200BAF8
	adds r1, r5, #0
	adds r1, #0x84
	str r0, [r1]
	movs r0, #0x3e
	bl FUN_0200BD08
	adds r1, r5, #0
	adds r1, #0x88
	str r0, [r1]
	movs r0, #0x7d
	lsls r0, r0, #2
	movs r1, #0x3e
	bl FUN_02026354
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	movs r0, #0x7d
	lsls r0, r0, #2
	movs r1, #0x3e
	bl FUN_02026354
	adds r1, r5, #0
	adds r1, #0x90
	str r0, [r1]
	movs r0, #0x65
	movs r1, #0x3e
	bl FUN_02007688
	adds r1, r5, #0
	adds r1, #0x94
	str r0, [r1]
	movs r0, #0xb4
	movs r1, #0x3e
	bl FUN_02007688
	adds r1, r5, #0
	adds r1, #0x98
	str r0, [r1]
	adds r0, r5, #0
	bl ov63_0221E114
	bl ov63_0221BFBC
	adds r0, r5, #0
	bl ov63_0221C044
	adds r0, r5, #0
	bl ov63_0221C068
	ldr r1, _0221BF20 @ =0x000003F7
	movs r0, #8
	movs r2, #1
	bl FUN_02004EC4
	movs r1, #0
	movs r0, #0x47
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r1, #0x1e
	movs r0, #0
	lsls r1, r1, #4
	movs r2, #0x3e
	bl FUN_02003030
	ldr r0, _0221BF24 @ =0x0001304C
	movs r1, #2
	str r1, [r5, r0]
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221BF10: .4byte 0x04000050
_0221BF14: .4byte 0x04001050
_0221BF18: .4byte 0x04000304
_0221BF1C: .4byte 0x0001306C
_0221BF20: .4byte 0x000003F7
_0221BF24: .4byte 0x0001304C
	thumb_func_end ov63_0221BE20

	thumb_func_start ov63_0221BF28
ov63_0221BF28: @ 0x0221BF28
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	bl ov63_0221C118
	adds r0, r4, #0
	bl ov63_0221C05C
	adds r0, r4, #0
	adds r0, #0x98
	ldr r0, [r0]
	bl FUN_0200770C
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	bl FUN_0200770C
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_02026380
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_0200BDA0
	adds r4, #0x84
	ldr r0, [r4]
	bl FUN_0200BB44
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x3e
	bl FUN_0201A9C4
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov63_0221BF28

	thumb_func_start ov63_0221BF88
ov63_0221BF88: @ 0x0221BF88
	push {r4, lr}
	bl FUN_02007290
	ldr r1, _0221BFB4 @ =0x0001304C
	adds r4, r0, #0
	ldr r1, [r4, r1]
	lsls r2, r1, #2
	ldr r1, _0221BFB8 @ =0x0221FD18
	ldr r1, [r1, r2]
	blx r1
	ldr r1, _0221BFB4 @ =0x0001304C
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #8
	bne _0221BFAA
	movs r0, #1
	pop {r4, pc}
_0221BFAA:
	adds r0, r4, #0
	bl ov63_0221C14C
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0221BFB4: .4byte 0x0001304C
_0221BFB8: .4byte 0x0221FD18
	thumb_func_end ov63_0221BF88

	thumb_func_start ov63_0221BFBC
ov63_0221BFBC: @ 0x0221BFBC
	ldr r3, _0221BFC4 @ =FUN_02022BE8
	ldr r0, _0221BFC8 @ =0x0221FD58
	bx r3
	nop
_0221BFC4: .4byte FUN_02022BE8
_0221BFC8: .4byte 0x0221FD58
	thumb_func_end ov63_0221BFBC

	thumb_func_start ov63_0221BFCC
ov63_0221BFCC: @ 0x0221BFCC
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0221BFE2
	adds r0, r4, #0
	blx r1
	cmp r0, #0
	bne _0221BFE2
	movs r0, #0
	str r0, [r4, #8]
_0221BFE2:
	ldr r0, [r4, #0x10]
	bl FUN_0201EEB4
	adds r4, #0xa0
	ldr r0, [r4]
	bl FUN_0200D020
	bl FUN_0200D034
	ldr r3, _0221C004 @ =0x027E0000
	ldr r1, _0221C008 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0221C004: .4byte 0x027E0000
_0221C008: .4byte 0x00003FF8
	thumb_func_end ov63_0221BFCC

	thumb_func_start ov63_0221C00C
ov63_0221C00C: @ 0x0221C00C
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	blx DC_FlushRange
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020CFE74
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov63_0221C00C

	thumb_func_start ov63_0221C028
ov63_0221C028: @ 0x0221C028
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r4, r1, #0
	adds r5, r0, #0
	adds r1, r6, #0
	blx DC_FlushRange
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	blx FUN_020CFD18
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov63_0221C028

	thumb_func_start ov63_0221C044
ov63_0221C044: @ 0x0221C044
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x3e
	bl FUN_0201AC88
	str r0, [r4, #0x10]
	movs r0, #4
	movs r1, #0
	bl FUN_0201C2D8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov63_0221C044

	thumb_func_start ov63_0221C05C
ov63_0221C05C: @ 0x0221C05C
	ldr r3, _0221C064 @ =FUN_0201AB0C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0221C064: .4byte FUN_0201AB0C
	thumb_func_end ov63_0221C05C

	thumb_func_start ov63_0221C068
ov63_0221C068: @ 0x0221C068
	push {r3, r4, r5, r6, lr}
	sub sp, #0x4c
	adds r4, r0, #0
	movs r0, #0x3e
	bl FUN_0200CF18
	adds r1, r4, #0
	adds r1, #0x9c
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	bl FUN_0200CF38
	adds r1, r4, #0
	adds r1, #0xa0
	add r2, sp, #0x2c
	ldr r5, _0221C10C @ =0x0221FCB8
	str r0, [r1]
	ldm r5!, {r0, r1}
	adds r3, r2, #0
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r5!, {r0, r1}
	ldr r6, _0221C110 @ =0x0221FB30
	stm r2!, {r0, r1}
	add r5, sp, #0x18
	ldm r6!, {r0, r1}
	adds r2, r5, #0
	stm r5!, {r0, r1}
	ldm r6!, {r0, r1}
	stm r5!, {r0, r1}
	ldr r0, [r6]
	adds r1, r3, #0
	str r0, [r5]
	adds r0, r4, #0
	adds r0, #0x9c
	ldr r0, [r0]
	movs r3, #0x20
	bl FUN_0200CF70
	ldr r3, _0221C114 @ =0x0221FB5C
	add r2, sp, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	movs r2, #0xf
	bl FUN_0200CFF4
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0
	bl FUN_0200D3F8
	adds r4, #0x9c
	ldr r0, [r4]
	bl FUN_0200CF6C
	movs r2, #1
	movs r1, #0
	lsls r2, r2, #0x16
	bl FUN_02009FC8
	add sp, #0x4c
	pop {r3, r4, r5, r6, pc}
	nop
_0221C10C: .4byte 0x0221FCB8
_0221C110: .4byte 0x0221FB30
_0221C114: .4byte 0x0221FB5C
	thumb_func_end ov63_0221C068

	thumb_func_start ov63_0221C118
ov63_0221C118: @ 0x0221C118
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	bl FUN_0200D998
	adds r4, #0x9c
	ldr r0, [r4]
	bl FUN_0200D108
	pop {r4, pc}
	thumb_func_end ov63_0221C118

	thumb_func_start ov63_0221C134
ov63_0221C134: @ 0x0221C134
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	lsls r5, r1, #2
	adds r4, #0xa4
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _0221C14A
	bl FUN_0200D9DC
	movs r0, #0
	str r0, [r4, r5]
_0221C14A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov63_0221C134

	thumb_func_start ov63_0221C14C
ov63_0221C14C: @ 0x0221C14C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0221C152:
	adds r0, r5, #0
	adds r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	beq _0221C160
	bl FUN_0200DC18
_0221C160:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0xf
	blo _0221C152
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov63_0221C14C

	thumb_func_start ov63_0221C16C
ov63_0221C16C: @ 0x0221C16C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r4, r1, #2
	adds r5, #0xa4
	ldr r0, [r5, r4]
	movs r1, #0
	adds r6, r2, #0
	bl FUN_0200DCC0
	ldr r0, [r5, r4]
	adds r1, r6, #0
	bl FUN_0200DC4C
	pop {r4, r5, r6, pc}
	thumb_func_end ov63_0221C16C

	thumb_func_start ov63_0221C188
ov63_0221C188: @ 0x0221C188
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	adds r4, r1, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x3e
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, _0221C1B0 @ =0x00013050
	str r4, [r5, r0]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_0221C1B0: .4byte 0x00013050
	thumb_func_end ov63_0221C188

	thumb_func_start ov63_0221C1B4
ov63_0221C1B4: @ 0x0221C1B4
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3e
	str r0, [sp, #8]
	movs r0, #0
	adds r4, r1, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, _0221C1E0 @ =0x00013050
	str r4, [r5, r0]
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0221C1E0: .4byte 0x00013050
	thumb_func_end ov63_0221C1B4

	thumb_func_start ov63_0221C1E4
ov63_0221C1E4: @ 0x0221C1E4
	ldr r3, _0221C1F4 @ =0x00013050
	str r2, [r0, r3]
	movs r2, #0
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r1, [r0, #8]
	movs r0, #1
	bx lr
	.align 2, 0
_0221C1F4: .4byte 0x00013050
	thumb_func_end ov63_0221C1E4

	thumb_func_start ov63_0221C1F8
ov63_0221C1F8: @ 0x0221C1F8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0221C20A
	ldr r0, _0221C210 @ =0x00013050
	ldr r0, [r4, r0]
	pop {r4, pc}
_0221C20A:
	movs r0, #0
	pop {r4, pc}
	nop
_0221C210: .4byte 0x00013050
	thumb_func_end ov63_0221C1F8

	thumb_func_start ov63_0221C214
ov63_0221C214: @ 0x0221C214
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0221C220
	ldr r1, _0221C224 @ =0x00013050
	ldr r0, [r0, r1]
	bx lr
_0221C220:
	movs r0, #1
	bx lr
	.align 2, 0
_0221C224: .4byte 0x00013050
	thumb_func_end ov63_0221C214

	thumb_func_start ov63_0221C228
ov63_0221C228: @ 0x0221C228
	push {r4, lr}
	adds r4, r0, #0
	bl ov63_0221CC78
	adds r0, r4, #0
	bl ov63_0221CDF8
	adds r0, r4, #0
	bl ov63_0221CD68
	ldr r0, _0221C25C @ =0x00013054
	movs r2, #0
	strh r2, [r4, r0]
	adds r0, r0, #2
	strh r2, [r4, r0]
	ldr r0, _0221C260 @ =ov63_0221BFCC
	adds r1, r4, #0
	bl FUN_0200E33C
	str r0, [r4, #4]
	adds r0, r4, #0
	movs r1, #3
	bl ov63_0221C188
	pop {r4, pc}
	nop
_0221C25C: .4byte 0x00013054
_0221C260: .4byte ov63_0221BFCC
	thumb_func_end ov63_0221C228

	thumb_func_start ov63_0221C264
ov63_0221C264: @ 0x0221C264
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _0221C354 @ =0x00013054
	adds r4, r0, #0
	ldrh r2, [r4, r1]
	cmp r2, #4
	bhi _0221C34C
	adds r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	add pc, r3
_0221C27E: @ jump table
	.2byte _0221C288 - _0221C27E - 2 @ case 0
	.2byte _0221C296 - _0221C27E - 2 @ case 1
	.2byte _0221C2B8 - _0221C27E - 2 @ case 2
	.2byte _0221C316 - _0221C27E - 2 @ case 3
	.2byte _0221C342 - _0221C27E - 2 @ case 4
_0221C288:
	bl ov63_0221D344
	ldr r0, _0221C354 @ =0x00013054
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0221C34C
_0221C296:
	adds r2, r2, #1
	strh r2, [r4, r1]
	adds r1, r1, #2
	ldrh r2, [r4, r1]
	movs r1, #1
	tst r1, r2
	bne _0221C2AE
	ldr r1, _0221C358 @ =ov63_0221D55C
	movs r2, #3
	bl ov63_0221C1E4
	b _0221C34C
_0221C2AE:
	ldr r1, _0221C35C @ =ov63_0221DB38
	movs r2, #3
	bl ov63_0221C1E4
	b _0221C34C
_0221C2B8:
	ldr r3, [r4, #8]
	cmp r3, #0
	bne _0221C2C4
	adds r0, r2, #1
	strh r0, [r4, r1]
	b _0221C34C
_0221C2C4:
	adds r2, r1, #0
	adds r2, #0xc
	ldr r2, [r4, r2]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1f
	cmp r2, #1
	bne _0221C2EC
	movs r2, #0
	str r2, [sp]
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	movs r2, #2
	movs r3, #1
	bl ov63_0221E450
	ldr r1, _0221C360 @ =0x00013060
	movs r0, #2
	ldr r2, [r4, r1]
	bics r2, r0
	str r2, [r4, r1]
_0221C2EC:
	ldr r1, _0221C360 @ =0x00013060
	ldr r0, [r4, r1]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221C34C
	movs r0, #2
	str r0, [sp]
	subs r1, #0xa
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #1
	bl ov63_0221E450
	ldr r1, _0221C360 @ =0x00013060
	movs r0, #1
	ldr r2, [r4, r1]
	bics r2, r0
	str r2, [r4, r1]
	b _0221C34C
_0221C316:
	bl ov63_0221D21C
	ldr r1, _0221C364 @ =0x00013056
	ldrh r0, [r4, r1]
	adds r0, r0, #1
	strh r0, [r4, r1]
	adds r0, r1, #0
	subs r0, #0xe
	ldr r2, [r4, r0]
	ldrh r0, [r4, r1]
	cmp r2, r0
	bne _0221C33A
	subs r0, r1, #2
	ldrh r0, [r4, r0]
	adds r2, r0, #1
	subs r0, r1, #2
	strh r2, [r4, r0]
	b _0221C34C
_0221C33A:
	movs r2, #0
	subs r0, r1, #2
	strh r2, [r4, r0]
	b _0221C34C
_0221C342:
	movs r1, #4
	bl ov63_0221C1B4
	add sp, #4
	pop {r3, r4, pc}
_0221C34C:
	movs r0, #3
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221C354: .4byte 0x00013054
_0221C358: .4byte ov63_0221D55C
_0221C35C: .4byte ov63_0221DB38
_0221C360: .4byte 0x00013060
_0221C364: .4byte 0x00013056
	thumb_func_end ov63_0221C264

	thumb_func_start ov63_0221C368
ov63_0221C368: @ 0x0221C368
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl FUN_0200E390
	adds r0, r4, #0
	bl ov63_0221CE7C
	adds r0, r4, #0
	bl ov63_0221CD40
	movs r0, #5
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov63_0221C368

	thumb_func_start ov63_0221C384
ov63_0221C384: @ 0x0221C384
	push {r4, lr}
	ldr r1, _0221C3C4 @ =0x00013056
	adds r4, r0, #0
	movs r2, #0
	strh r2, [r4, r1]
	subs r1, r1, #2
	strh r2, [r4, r1]
	bl ov63_0221E940
	adds r0, r4, #0
	bl ov63_0221EA24
	adds r0, r4, #0
	bl ov63_0221EAA8
	adds r0, r4, #0
	bl ov63_0221EC1C
	adds r0, r4, #0
	bl ov63_0221F088
	ldr r0, _0221C3C8 @ =ov63_0221E8FC
	adds r1, r4, #0
	movs r2, #4
	bl FUN_0200E33C
	str r0, [r4, #4]
	adds r0, r4, #0
	movs r1, #6
	bl ov63_0221C188
	pop {r4, pc}
	.align 2, 0
_0221C3C4: .4byte 0x00013056
_0221C3C8: .4byte ov63_0221E8FC
	thumb_func_end ov63_0221C384

	thumb_func_start ov63_0221C3CC
ov63_0221C3CC: @ 0x0221C3CC
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0221C570 @ =0x00013054
	adds r5, r0, #0
	ldrh r2, [r5, r1]
	cmp r2, #0
	beq _0221C3E4
	cmp r2, #1
	beq _0221C3F2
	cmp r2, #2
	bne _0221C3E2
	b _0221C562
_0221C3E2:
	b _0221C56A
_0221C3E4:
	adds r2, r2, #1
	strh r2, [r5, r1]
	ldr r1, _0221C574 @ =ov63_0221E5A0
	movs r2, #6
	bl ov63_0221C1E4
	b _0221C56A
_0221C3F2:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0221C3FC
	adds r0, r2, #1
	strh r0, [r5, r1]
_0221C3FC:
	ldr r0, _0221C578 @ =0x00013060
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	cmp r0, #1
	beq _0221C40A
	b _0221C51C
_0221C40A:
	adds r0, r5, #0
	bl ov63_0221F238
	adds r1, r5, #0
	adds r1, #0xf8
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xf8
	movs r2, #5
	ldr r0, [r0]
	ldr r1, _0221C57C @ =0xFFFFF493
	lsls r2, r2, #0xe
	bl ov63_0221F324
	adds r0, r5, #0
	adds r0, #0xf8
	movs r2, #0xf
	ldr r0, [r0]
	ldr r1, _0221C580 @ =0xFFFFF923
	lsls r2, r2, #0xe
	bl ov63_0221F324
	adds r0, r5, #0
	adds r0, #0xf8
	movs r2, #0xa
	ldr r0, [r0]
	ldr r1, _0221C584 @ =0xFFFFFDB6
	lsls r2, r2, #0xe
	bl ov63_0221F324
	adds r0, r5, #0
	adds r0, #0xf8
	movs r2, #0x23
	ldr r0, [r0]
	ldr r1, _0221C588 @ =0x0000024A
	lsls r2, r2, #0xe
	bl ov63_0221F324
	adds r0, r5, #0
	adds r0, #0xf8
	movs r2, #0x1e
	ldr r0, [r0]
	ldr r1, _0221C58C @ =0x000006DD
	lsls r2, r2, #0xe
	bl ov63_0221F324
	adds r0, r5, #0
	adds r0, #0xf8
	movs r2, #0xa
	ldr r0, [r0]
	ldr r1, _0221C590 @ =0x00000B6D
	lsls r2, r2, #0x10
	bl ov63_0221F324
	adds r0, r5, #0
	bl ov63_0221F614
	adds r1, r5, #0
	adds r1, #0xfc
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xfc
	ldr r0, [r0]
	bl ov63_0221F7DC
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	ldr r0, _0221C594 @ =0x00013048
	movs r6, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	bls _0221C512
	ldr r7, _0221C594 @ =0x00013048
	adds r4, r5, #0
_0221C4CA:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r6, #0
	bl ov63_0221C9E0
	adds r0, r4, #0
	adds r0, #0xa4
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200E0FC
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200E0FC
	ldr r0, [r5, r7]
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, r0
	blo _0221C4CA
_0221C512:
	ldr r1, _0221C578 @ =0x00013060
	movs r0, #4
	ldr r2, [r5, r1]
	bics r2, r0
	str r2, [r5, r1]
_0221C51C:
	ldr r0, _0221C578 @ =0x00013060
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221C544
	adds r0, r5, #0
	bl ov63_0221E8AC
	ldr r0, _0221C598 @ =0x00000919
	bl FUN_0200604C
	ldr r0, _0221C59C @ =0x0000091A
	bl FUN_0200604C
	ldr r1, _0221C578 @ =0x00013060
	movs r0, #8
	ldr r2, [r5, r1]
	bics r2, r0
	str r2, [r5, r1]
_0221C544:
	ldr r0, _0221C578 @ =0x00013060
	ldr r0, [r5, r0]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221C56A
	adds r0, r5, #0
	bl ov63_0221E8D4
	ldr r1, _0221C578 @ =0x00013060
	movs r0, #0x10
	ldr r2, [r5, r1]
	bics r2, r0
	str r2, [r5, r1]
	b _0221C56A
_0221C562:
	movs r0, #0
	strh r0, [r5, r1]
	movs r0, #7
	pop {r3, r4, r5, r6, r7, pc}
_0221C56A:
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221C570: .4byte 0x00013054
_0221C574: .4byte ov63_0221E5A0
_0221C578: .4byte 0x00013060
_0221C57C: .4byte 0xFFFFF493
_0221C580: .4byte 0xFFFFF923
_0221C584: .4byte 0xFFFFFDB6
_0221C588: .4byte 0x0000024A
_0221C58C: .4byte 0x000006DD
_0221C590: .4byte 0x00000B6D
_0221C594: .4byte 0x00013048
_0221C598: .4byte 0x00000919
_0221C59C: .4byte 0x0000091A
	thumb_func_end ov63_0221C3CC

	thumb_func_start ov63_0221C5A0
ov63_0221C5A0: @ 0x0221C5A0
	push {r4, lr}
	ldr r1, _0221C60C @ =0x00013054
	adds r4, r0, #0
	ldrh r1, [r4, r1]
	cmp r1, #0
	beq _0221C5B6
	cmp r1, #1
	beq _0221C5DA
	cmp r1, #2
	beq _0221C5EC
	b _0221C606
_0221C5B6:
	ldr r0, [r4, #4]
	bl FUN_0200E390
	adds r0, r4, #0
	adds r0, #0xfc
	ldr r0, [r0]
	bl ov63_0221F7C4
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl ov63_0221F5B4
	ldr r0, _0221C60C @ =0x00013054
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0221C606
_0221C5DA:
	bl ov63_0221F600
	cmp r0, #1
	bne _0221C606
	ldr r0, _0221C60C @ =0x00013054
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	b _0221C606
_0221C5EC:
	bl ov63_0221F1C4
	adds r0, r4, #0
	bl ov63_0221EFD8
	adds r0, r4, #0
	bl ov63_0221EC04
	adds r0, r4, #0
	bl ov63_0221E9FC
	movs r0, #8
	pop {r4, pc}
_0221C606:
	movs r0, #7
	pop {r4, pc}
	nop
_0221C60C: .4byte 0x00013054
	thumb_func_end ov63_0221C5A0

	thumb_func_start ov63_0221C610
ov63_0221C610: @ 0x0221C610
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	str r0, [sp]
	str r2, [sp, #4]
	adds r6, r3, #0
	bne _0221C638
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	bl FUN_0200DDB8
	ldr r1, [r4, #8]
	ldr r0, [sp]
	adds r2, r1, #0
	bl FUN_0200E024
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221C638:
	adds r1, r2, #0
	cmp r6, r1
	bne _0221C658
	movs r1, #4
	movs r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	bl FUN_0200DDB8
	ldr r1, [r4, #0xc]
	ldr r0, [sp]
	adds r2, r1, #0
	bl FUN_0200E024
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221C658:
	movs r0, #4
	ldrsh r7, [r4, r0]
	movs r0, #0
	ldrsh r5, [r4, r0]
	subs r0, r5, r7
	blx FUN_020E4A90
	ldr r1, [sp, #4]
	lsls r0, r0, #8
	blx FUN_020F2BA4
	muls r0, r6, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	cmp r5, r7
	ble _0221C682
	subs r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	b _0221C68A
_0221C682:
	adds r0, r5, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
_0221C68A:
	movs r0, #6
	ldrsh r7, [r4, r0]
	movs r0, #2
	ldrsh r5, [r4, r0]
	subs r0, r5, r7
	blx FUN_020E4A90
	ldr r1, [sp, #4]
	lsls r0, r0, #8
	blx FUN_020F2BA4
	muls r0, r6, r0
	lsls r0, r0, #8
	asrs r0, r0, #0x10
	cmp r5, r7
	ble _0221C6AE
	subs r0, r5, r0
	b _0221C6B0
_0221C6AE:
	adds r0, r5, r0
_0221C6B0:
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r0, [sp]
	ldr r1, [sp, #8]
	bl FUN_0200DDB8
	adds r0, r6, #0
	blx FUN_020F21C0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #8]
	blx FUN_020F24C8
	adds r6, r0, #0
	ldr r0, [sp, #4]
	blx FUN_020F21C0
	adds r1, r0, #0
	adds r0, r6, #0
	blx FUN_020F1CC8
	adds r1, r0, #0
	adds r0, r5, #0
	blx FUN_020F22DC
	adds r1, r0, #0
	ldr r0, [r4, #8]
	blx FUN_020F1520
	adds r1, r0, #0
	ldr r0, [sp]
	adds r2, r1, #0
	bl FUN_0200E024
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov63_0221C610

	thumb_func_start ov63_0221C6FC
ov63_0221C6FC: @ 0x0221C6FC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #8
	movs r1, #0x3e
	bl FUN_02007688
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221C84C @ =0x0000D8D8
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4c
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221C84C @ =0x0000D8D8
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4d
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221C84C @ =0x0000D8D8
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4e
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C84C @ =0x0000D8D8
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C850 @ =0x0000D8D9
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221C850 @ =0x0000D8D9
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4c
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221C850 @ =0x0000D8D9
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4d
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221C850 @ =0x0000D8D9
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4e
	bl FUN_0200D71C
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C854 @ =0x0000D8DA
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221C858 @ =0x0000D8DB
	adds r2, r4, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r5, #0xa0
	ldr r0, [r0]
	ldr r1, [r5]
	movs r3, #0x4b
	bl FUN_0200D5D4
	adds r0, r4, #0
	bl FUN_0200770C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C84C: .4byte 0x0000D8D8
_0221C850: .4byte 0x0000D8D9
_0221C854: .4byte 0x0000D8DA
_0221C858: .4byte 0x0000D8DB
	thumb_func_end ov63_0221C6FC

	thumb_func_start ov63_0221C85C
ov63_0221C85C: @ 0x0221C85C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 @ =0x0000D8D8
	bl FUN_0200D968
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8DC @ =0x0000D8D9
	bl FUN_0200D968
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8E0 @ =0x0000D8DA
	bl FUN_0200D968
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8E4 @ =0x0000D8DB
	bl FUN_0200D968
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 @ =0x0000D8D8
	bl FUN_0200D958
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 @ =0x0000D8D8
	bl FUN_0200D978
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8D8 @ =0x0000D8D8
	bl FUN_0200D988
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8DC @ =0x0000D8D9
	bl FUN_0200D958
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221C8DC @ =0x0000D8D9
	bl FUN_0200D978
	adds r4, #0xa0
	ldr r0, [r4]
	ldr r1, _0221C8DC @ =0x0000D8D9
	bl FUN_0200D988
	pop {r4, pc}
	nop
_0221C8D8: .4byte 0x0000D8D8
_0221C8DC: .4byte 0x0000D8D9
_0221C8E0: .4byte 0x0000D8DA
_0221C8E4: .4byte 0x0000D8DB
	thumb_func_end ov63_0221C85C

	thumb_func_start ov63_0221C8E8
ov63_0221C8E8: @ 0x0221C8E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	add r0, sp, #8
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02070124
	cmp r6, #2
	bne _0221C904
	adds r4, #0x6c
	b _0221C908
_0221C904:
	ldr r0, _0221C950 @ =0x0000196C
	adds r4, r4, r0
_0221C908:
	adds r5, #0xa4
	lsls r6, r7, #2
	ldr r0, [r5, r6]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #1
	blx FUN_020B802C
	movs r2, #0x32
	adds r1, r0, #0
	adds r0, r4, #0
	lsls r2, r2, #6
	bl ov63_0221C00C
	ldr r0, [r5, r6]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3e
	str r0, [sp, #4]
	add r1, sp, #8
	ldrh r0, [r1]
	ldrh r1, [r1, #4]
	movs r2, #1
	bl FUN_02007938
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221C950: .4byte 0x0000196C
	thumb_func_end ov63_0221C8E8

	thumb_func_start ov63_0221C954
ov63_0221C954: @ 0x0221C954
	push {r3, r4, r5, lr}
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, #0xa4
	ldr r0, [r0]
	adds r5, r2, #0
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r1, r0, #0
	cmp r5, #0
	beq _0221C97C
	cmp r5, #1
	beq _0221C980
	cmp r5, #2
	beq _0221C984
	b _0221C986
_0221C97C:
	ldr r4, _0221C990 @ =0x0221FC58
	b _0221C986
_0221C980:
	ldr r4, _0221C994 @ =0x0221FC78
	b _0221C986
_0221C984:
	ldr r4, _0221C998 @ =0x0221FC98
_0221C986:
	adds r0, r4, #0
	movs r2, #0x20
	bl ov63_0221C028
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221C990: .4byte 0x0221FC58
_0221C994: .4byte 0x0221FC78
_0221C998: .4byte 0x0221FC98
	thumb_func_end ov63_0221C954

	thumb_func_start ov63_0221C99C
ov63_0221C99C: @ 0x0221C99C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r0, r2, #2
	adds r0, r5, r0
	adds r0, #0xa4
	ldr r0, [r0]
	adds r4, r1, #0
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r6, r0, #0
	bl FUN_02026EA4
	movs r1, #1
	bics r6, r1
	movs r1, #1
	lsls r1, r1, #8
	adds r3, r5, r1
	ldr r1, _0221C9DC @ =0x0000328C
	adds r2, r4, #0
	muls r2, r1, r2
	adds r2, r3, r2
	subs r1, #0x20
	adds r1, r2, r1
	adds r0, r0, r6
	movs r2, #0x20
	blx FUN_020D4A50
	pop {r4, r5, r6, pc}
	.align 2, 0
_0221C9DC: .4byte 0x0000328C
	thumb_func_end ov63_0221C99C

	thumb_func_start ov63_0221C9E0
ov63_0221C9E0: @ 0x0221C9E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	lsls r0, r2, #2
	adds r0, r5, r0
	adds r0, #0xa4
	ldr r0, [r0]
	adds r4, r1, #0
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	adds r3, r5, r0
	ldr r0, _0221CA18 @ =0x0000328C
	adds r2, r4, #0
	muls r2, r0, r2
	adds r2, r3, r2
	subs r0, #0x20
	adds r0, r2, r0
	movs r2, #0x20
	bl ov63_0221C028
	pop {r3, r4, r5, pc}
	nop
_0221CA18: .4byte 0x0000328C
	thumb_func_end ov63_0221C9E0

	thumb_func_start ov63_0221CA1C
ov63_0221CA1C: @ 0x0221CA1C
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _0221CA8C
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221CB3C @ =0x0000D8DE
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0xc
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 @ =0x0000D8DA
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0xd
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 @ =0x0000D8DA
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0xe
	bl FUN_0200D71C
	b _0221CAEE
_0221CA8C:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221CB3C @ =0x0000D8DE
	adds r1, r4, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #9
	bl FUN_0200D504
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 @ =0x0000D8DA
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0xa
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221CB40 @ =0x0000D8DA
	adds r1, r4, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0xb
	bl FUN_0200D71C
_0221CAEE:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221CB3C @ =0x0000D8DE
	adds r1, r4, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0xf
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221CB44 @ =0x0000D8DF
	adds r1, r4, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r4, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r4]
	movs r3, #0xf
	bl FUN_0200D5D4
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_0221CB3C: .4byte 0x0000D8DE
_0221CB40: .4byte 0x0000D8DA
_0221CB44: .4byte 0x0000D8DF
	thumb_func_end ov63_0221CA1C

	thumb_func_start ov63_0221CB48
ov63_0221CB48: @ 0x0221CB48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB88 @ =0x0000D8DE
	bl FUN_0200D968
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB8C @ =0x0000D8DF
	bl FUN_0200D968
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB88 @ =0x0000D8DE
	bl FUN_0200D958
	adds r0, r4, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221CB90 @ =0x0000D8DA
	bl FUN_0200D978
	adds r4, #0xa0
	ldr r0, [r4]
	ldr r1, _0221CB90 @ =0x0000D8DA
	bl FUN_0200D988
	pop {r4, pc}
	nop
_0221CB88: .4byte 0x0000D8DE
_0221CB8C: .4byte 0x0000D8DF
_0221CB90: .4byte 0x0000D8DA
	thumb_func_end ov63_0221CB48

	thumb_func_start ov63_0221CB94
ov63_0221CB94: @ 0x0221CB94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp, #0x24]
	adds r0, #0xa4
	str r0, [sp, #0x24]
	str r1, [sp, #0xc]
	lsls r0, r2, #2
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #1
	blx FUN_020B802C
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _0221CBC4
	movs r0, #8
	str r0, [sp, #0x10]
	b _0221CBC8
_0221CBC4:
	movs r0, #4
	str r0, [sp, #0x10]
_0221CBC8:
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0xc]
	lsls r1, r0, #5
	adds r6, r0, #0
	muls r6, r1, r6
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	ldrh r0, [r0, #0xc]
	ldrb r1, [r1, #0x10]
	ldrb r2, [r2, #0x11]
	bl ov63_0221E404
	adds r1, r0, #0
	movs r0, #0x51
	movs r2, #0x3e
	bl FUN_02007524
	str r0, [sp, #0x1c]
	blx FUN_020C3B50
	ldr r1, [r0, #0x14]
	str r0, [sp, #0x20]
	adds r0, r0, r1
	str r0, [sp, #0x18]
	movs r0, #0x3e
	adds r1, r6, #0
	bl FUN_0201AA8C
	adds r7, r0, #0
	movs r4, #0
_0221CC04:
	ldr r0, [sp, #0x10]
	adds r5, r6, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r2, #0
	ldr r0, [sp, #0x18]
	muls r5, r4, r5
	ldr r1, [sp, #0x10]
	adds r0, r0, r5
	adds r3, r2, #0
	str r7, [sp, #8]
	bl FUN_020145B4
	ldr r1, [sp, #0x14]
	adds r0, r7, #0
	adds r1, r1, r5
	adds r2, r6, #0
	bl ov63_0221C00C
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #8
	blo _0221CC04
	adds r0, r7, #0
	bl FUN_0201AB0C
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	ldr r1, [r0, #0x38]
	adds r5, r0, r1
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	bl FUN_0207003C
	cmp r0, #1
	bne _0221CC62
	adds r5, #0x20
_0221CC62:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x20
	bl ov63_0221C028
	ldr r0, [sp, #0x1c]
	bl FUN_0201AB0C
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov63_0221CB94

	thumb_func_start ov63_0221CC78
ov63_0221CC78: @ 0x0221CC78
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _0221CD2C @ =0x0221FB10
	add r3, sp, #0x70
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0221CD30 @ =0x0221FBAC
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
	ldr r0, [r4, #0x10]
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0201CAE0
	movs r0, #0
	movs r1, #0x20
	adds r2, r0, #0
	movs r3, #0x3e
	bl FUN_0201C1C4
	ldr r5, _0221CD34 @ =0x0221FBC8
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _0221CD38 @ =0x0221FB74
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _0221CD3C @ =0x0221FC1C
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_0221CD2C: .4byte 0x0221FB10
_0221CD30: .4byte 0x0221FBAC
_0221CD34: .4byte 0x0221FBC8
_0221CD38: .4byte 0x0221FB74
_0221CD3C: .4byte 0x0221FC1C
	thumb_func_end ov63_0221CC78

	thumb_func_start ov63_0221CD40
ov63_0221CD40: @ 0x0221CD40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov63_0221CD40

	thumb_func_start ov63_0221CD68
ov63_0221CD68: @ 0x0221CD68
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r3, #1
	adds r4, r0, #0
	str r3, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	movs r1, #2
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	movs r1, #3
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3e
	movs r2, #0
	adds r4, #0x94
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #4
	adds r3, r2, #0
	bl FUN_02007B8C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov63_0221CD68

	thumb_func_start ov63_0221CDF8
ov63_0221CDF8: @ 0x0221CDF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r5, r7, #0
	ldr r4, _0221CE74 @ =0x0221FD80
	movs r6, #0
	adds r5, #0x14
_0221CE06:
	ldr r0, [r7, #0x10]
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_0201D4F8
	adds r6, r6, #1
	adds r4, #8
	adds r5, #0x10
	cmp r6, #7
	blo _0221CE06
	adds r0, r7, #0
	adds r0, #0x14
	movs r1, #0
	bl FUN_0201D978
	adds r0, r7, #0
	adds r2, r7, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0
	bl FUN_0200BB6C
	adds r1, r7, #0
	adds r1, #0x8c
	movs r0, #0
	ldr r1, [r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	adds r2, r7, #0
	lsrs r4, r3, #1
	movs r3, #0x80
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221CE78 @ =0x000F0200
	adds r2, #0x8c
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r7, #0
	ldr r2, [r2]
	adds r0, #0x14
	subs r3, r3, r4
	bl FUN_020200FC
	adds r7, #0x14
	adds r0, r7, #0
	bl FUN_0201D8A0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221CE74: .4byte 0x0221FD80
_0221CE78: .4byte 0x000F0200
	thumb_func_end ov63_0221CDF8

	thumb_func_start ov63_0221CE7C
ov63_0221CE7C: @ 0x0221CE7C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x14
_0221CE84:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #7
	blo _0221CE84
	pop {r3, r4, r5, pc}
	thumb_func_end ov63_0221CE7C

	thumb_func_start ov63_0221CE94
ov63_0221CE94: @ 0x0221CE94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r4, r0, #0
	adds r0, r1, #0
	movs r1, #1
	lsls r1, r1, #8
	lsls r6, r2, #4
	adds r2, r4, r1
	ldr r1, _0221D204 @ =0x0000328C
	adds r5, r4, #0
	muls r1, r0, r1
	ldr r0, [r2, r1]
	adds r5, #0x14
	adds r7, r2, r1
	str r0, [sp, #0x14]
	bl FUN_02070DB0
	str r0, [sp, #0x10]
	adds r0, r5, r6
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #4
	bl FUN_0200BB6C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r2, [sp, #0x10]
	movs r1, #0
	bl FUN_0200BF8C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x88
	adds r1, #0x90
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	movs r1, #0
	adds r2, r4, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 @ =0x000F0200
	adds r2, #0x90
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r2]
	adds r0, r5, r6
	movs r3, #2
	bl FUN_020200FC
	adds r0, r5, r6
	bl FUN_0201D8A0
	adds r0, r5, r6
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	ldrb r1, [r7, #0x11]
	cmp r1, #2
	beq _0221CF2E
	ldrb r0, [r7, #0x12]
	cmp r0, #0
	bne _0221CF42
_0221CF2E:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #3
	bl FUN_0200BB6C
	b _0221CF84
_0221CF42:
	cmp r1, #0
	bne _0221CF5A
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #1
	bl FUN_0200BB6C
	b _0221CF84
_0221CF5A:
	cmp r1, #1
	bne _0221CF72
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #2
	bl FUN_0200BB6C
	b _0221CF84
_0221CF72:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #3
	bl FUN_0200BB6C
_0221CF84:
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r2, [sp, #0x10]
	movs r1, #0
	bl FUN_0200BF1C
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x88
	adds r1, #0x90
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	movs r1, #0
	adds r2, r4, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 @ =0x000F0200
	adds r2, #0x90
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, r6
	ldr r2, [r2]
	adds r0, #0x10
	movs r3, #2
	bl FUN_020200FC
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #5
	bl FUN_0200BB6C
	movs r1, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x88
	ldrh r2, [r7, #0xe]
	ldr r0, [r0]
	movs r3, #3
	bl FUN_0200BFCC
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x88
	adds r1, #0x90
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 @ =0x000F0200
	adds r2, r4, #0
	str r0, [sp, #8]
	movs r1, #0
	adds r0, r5, r6
	str r1, [sp, #0xc]
	adds r2, #0x90
	ldr r2, [r2]
	adds r0, #0x10
	movs r3, #2
	bl FUN_020200FC
	adds r0, r5, r6
	adds r0, #0x10
	bl FUN_0201D8A0
	adds r0, r5, r6
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #6
	bl FUN_0200BB6C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r2, [sp, #0x10]
	movs r1, #0
	bl FUN_0200BFAC
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x88
	adds r1, #0x90
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 @ =0x000F0200
	adds r2, r4, #0
	str r0, [sp, #8]
	adds r0, r5, r6
	str r1, [sp, #0xc]
	adds r2, #0x90
	ldr r2, [r2]
	adds r0, #0x20
	movs r3, #2
	bl FUN_020200FC
	ldr r2, [r4]
	ldr r1, [sp, #0x14]
	ldr r2, [r2]
	adds r0, r4, #0
	bl ov63_0221E310
	cmp r0, #9
	bls _0221D09C
	b _0221D1DA
_0221D09C:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221D0A8: @ jump table
	.2byte _0221D0BC - _0221D0A8 - 2 @ case 0
	.2byte _0221D0F4 - _0221D0A8 - 2 @ case 1
	.2byte _0221D12C - _0221D0A8 - 2 @ case 2
	.2byte _0221D140 - _0221D0A8 - 2 @ case 3
	.2byte _0221D154 - _0221D0A8 - 2 @ case 4
	.2byte _0221D168 - _0221D0A8 - 2 @ case 5
	.2byte _0221D17C - _0221D0A8 - 2 @ case 6
	.2byte _0221D190 - _0221D0A8 - 2 @ case 7
	.2byte _0221D1A4 - _0221D0A8 - 2 @ case 8
	.2byte _0221D1A4 - _0221D0A8 - 2 @ case 9
_0221D0BC:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #7
	bl FUN_0200BB6C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r2, [r7, #0x14]
	movs r1, #0
	bl FUN_0200C278
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x88
	adds r1, #0x90
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	b _0221D1DA
_0221D0F4:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #8
	bl FUN_0200BB6C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r2, [r7, #0x14]
	movs r1, #0
	bl FUN_0200C278
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x88
	adds r1, #0x90
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	b _0221D1DA
_0221D12C:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #9
	bl FUN_0200BB6C
	b _0221D1DA
_0221D140:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0xa
	bl FUN_0200BB6C
	b _0221D1DA
_0221D154:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0xb
	bl FUN_0200BB6C
	b _0221D1DA
_0221D168:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0xe
	bl FUN_0200BB6C
	b _0221D1DA
_0221D17C:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0xc
	bl FUN_0200BB6C
	b _0221D1DA
_0221D190:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0xd
	bl FUN_0200BB6C
	b _0221D1DA
_0221D1A4:
	adds r0, r4, #0
	adds r2, r4, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0xf
	bl FUN_0200BB6C
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	ldr r2, [r7, #0x14]
	movs r1, #0
	bl FUN_0200C278
	adds r0, r4, #0
	adds r1, r4, #0
	adds r2, r4, #0
	adds r0, #0x88
	adds r1, #0x90
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
_0221D1DA:
	movs r0, #0x18
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221D208 @ =0x000F0200
	movs r1, #0
	str r0, [sp, #8]
	adds r0, r5, r6
	str r1, [sp, #0xc]
	adds r4, #0x90
	ldr r2, [r4]
	adds r0, #0x20
	movs r3, #2
	bl FUN_020200FC
	adds r0, r5, r6
	adds r0, #0x20
	bl FUN_0201D8A0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221D204: .4byte 0x0000328C
_0221D208: .4byte 0x000F0200
	thumb_func_end ov63_0221CE94

	thumb_func_start ov63_0221D20C
ov63_0221D20C: @ 0x0221D20C
	push {r3, lr}
	bl ov63_0221D240
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	pop {r3, pc}
	thumb_func_end ov63_0221D20C

	thumb_func_start ov63_0221D21C
ov63_0221D21C: @ 0x0221D21C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0221D222:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov63_0221C134
	adds r4, r4, #1
	cmp r4, #0xf
	blo _0221D222
	adds r0, r5, #0
	bl ov63_0221CB48
	adds r0, r5, #0
	bl ov63_0221C85C
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov63_0221D21C

	thumb_func_start ov63_0221D240
ov63_0221D240: @ 0x0221D240
	push {r3, r4, r5, r6, r7, lr}
	movs r2, #1
	adds r5, r0, #0
	lsls r2, r2, #8
	adds r3, r5, r2
	ldr r2, _0221D2EC @ =0x0000328C
	muls r2, r1, r2
	adds r1, r3, r2
	str r1, [sp]
	bl ov63_0221C6FC
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov63_0221CA1C
	ldr r4, _0221D2F0 @ =0x0221FF68
	movs r7, #0
	adds r6, r5, #0
_0221D264:
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r4, #0
	bl FUN_0200D734
	adds r1, r6, #0
	adds r1, #0xa4
	adds r7, r7, #1
	str r0, [r1]
	adds r4, #0x34
	adds r6, r6, #4
	cmp r7, #5
	bls _0221D264
	ldr r1, [sp]
	adds r0, r5, #0
	movs r2, #2
	movs r3, #0
	bl ov63_0221C8E8
	ldr r1, [sp]
	adds r0, r5, #0
	movs r2, #0
	movs r3, #2
	bl ov63_0221C8E8
	ldr r1, [sp]
	adds r0, r5, #0
	movs r2, #4
	bl ov63_0221CB94
	ldr r0, [sp]
	ldrh r1, [r0, #0xc]
	ldr r0, _0221D2F4 @ =0x0000FF9E
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _0221D2CC
	adds r0, r5, #0
	movs r1, #4
	movs r2, #2
	bl ov63_0221C16C
	adds r0, r5, #0
	movs r1, #5
	movs r2, #2
	bl ov63_0221C16C
_0221D2CC:
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov63_0221C954
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0
	bl ov63_0221C954
	adds r0, r5, #0
	movs r1, #5
	movs r2, #0
	bl ov63_0221C954
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221D2EC: .4byte 0x0000328C
_0221D2F0: .4byte 0x0221FF68
_0221D2F4: .4byte 0x0000FF9E
	thumb_func_end ov63_0221D240

	thumb_func_start ov63_0221D2F8
ov63_0221D2F8: @ 0x0221D2F8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _0221D322
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0x1f
	mvns r1, r1
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DED0
	adds r4, #0xb8
	movs r1, #0x1f
	mvns r1, r1
	ldr r0, [r4]
	adds r2, r1, #0
	bl FUN_0200DED0
	pop {r4, pc}
_0221D322:
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0xf
	mvns r1, r1
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DED0
	adds r4, #0xb8
	movs r1, #0xf
	mvns r1, r1
	ldr r0, [r4]
	adds r2, r1, #0
	bl FUN_0200DED0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov63_0221D2F8

	thumb_func_start ov63_0221D344
ov63_0221D344: @ 0x0221D344
	push {r3, r4, r5, lr}
	ldr r1, _0221D54C @ =0x00013056
	adds r5, r0, #0
	movs r2, #1
	lsls r2, r2, #8
	adds r3, r5, r2
	ldrh r1, [r5, r1]
	ldr r2, _0221D550 @ =0x0000328C
	muls r2, r1, r2
	adds r4, r3, r2
	bl ov63_0221D20C
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_0201CAE0
	movs r1, #0
	ldr r0, [r5, #0x10]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201F238
	movs r1, #0
	ldr r0, [r5, #0x10]
	movs r2, #3
	adds r3, r1, #0
	bl FUN_0201F238
	ldr r0, _0221D54C @ =0x00013056
	movs r1, #1
	ldrh r0, [r5, r0]
	tst r0, r1
	ldr r0, [r5, #0x10]
	bne _0221D44E
	movs r2, #0
	adds r3, r2, #0
	bl FUN_0201F238
	ldr r0, [r5, #0x10]
	movs r1, #1
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r5, #0x10]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	ldr r0, [r5, #0x10]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r5, #0x10]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r5, #0x10]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201F238
	adds r0, r5, #0
	adds r0, #0xa4
	movs r1, #1
	movs r2, #0x27
	ldr r0, [r0]
	lsls r1, r1, #8
	mvns r2, r2
	bl FUN_0200DDB8
	adds r0, r5, #0
	adds r0, #0xa8
	movs r1, #0x4a
	movs r2, #0x4f
	ldr r0, [r0]
	lsls r1, r1, #2
	mvns r2, r2
	bl FUN_0200DDB8
	ldrb r2, [r4, #0x13]
	adds r0, r5, #0
	adds r0, #0xac
	adds r2, #0x98
	movs r1, #0x12
	lsls r2, r2, #0x10
	ldr r0, [r0]
	lsls r1, r1, #4
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrb r2, [r4, #0x13]
	adds r0, r5, #0
	adds r0, #0xb0
	adds r2, #0x98
	movs r1, #0x4a
	lsls r2, r2, #0x10
	ldr r0, [r0]
	lsls r1, r1, #2
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r5, #0
	movs r1, #0x51
	adds r0, #0xb4
	mvns r1, r1
	adds r2, r1, #0
	ldr r0, [r0]
	adds r2, #0x50
	bl FUN_0200DDB8
	adds r0, r5, #0
	movs r1, #0x58
	adds r0, #0xb8
	mvns r1, r1
	adds r2, r1, #0
	ldr r0, [r0]
	adds r2, #0x56
	bl FUN_0200DDB8
	ldr r1, _0221D54C @ =0x00013056
	adds r0, r5, #0
	ldrh r1, [r5, r1]
	movs r2, #1
	bl ov63_0221CE94
	b _0221D512
_0221D44E:
	movs r2, #0
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r5, #0x10]
	movs r1, #1
	adds r3, #0xfd
	bl FUN_0201F238
	movs r2, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x10]
	movs r1, #2
	subs r3, #0xb8
	bl FUN_0201F238
	ldr r0, [r5, #0x10]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	movs r1, #3
	adds r3, r1, #0
	ldr r0, [r5, #0x10]
	movs r2, #0
	adds r3, #0xfd
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r5, #0x10]
	adds r2, r1, #0
	movs r3, #0
	bl FUN_0201F238
	adds r0, r5, #0
	adds r0, #0xa4
	movs r1, #0
	adds r2, r1, #0
	ldr r0, [r0]
	subs r2, #0x28
	bl FUN_0200DDB8
	adds r0, r5, #0
	movs r1, #0x27
	adds r0, #0xa8
	mvns r1, r1
	adds r2, r1, #0
	ldr r0, [r0]
	subs r2, #0x28
	bl FUN_0200DDB8
	ldrb r2, [r4, #0x13]
	adds r0, r5, #0
	adds r0, #0xac
	adds r2, #0x98
	movs r1, #0x4f
	lsls r2, r2, #0x10
	ldr r0, [r0]
	mvns r1, r1
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	ldrb r2, [r4, #0x13]
	adds r0, r5, #0
	adds r0, #0xb0
	adds r2, #0x98
	movs r1, #0x5b
	lsls r2, r2, #0x10
	ldr r0, [r0]
	mvns r1, r1
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r5, #0
	adds r0, #0xb4
	movs r2, #1
	ldr r0, [r0]
	ldr r1, _0221D554 @ =0x00000152
	mvns r2, r2
	bl FUN_0200DDB8
	adds r0, r5, #0
	adds r0, #0xb8
	movs r2, #2
	ldr r0, [r0]
	ldr r1, _0221D558 @ =0x00000159
	mvns r2, r2
	bl FUN_0200DDB8
	ldr r1, _0221D54C @ =0x00013056
	adds r0, r5, #0
	ldrh r1, [r5, r1]
	movs r2, #4
	bl ov63_0221CE94
_0221D512:
	adds r0, r5, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200DF98
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200DF98
	adds r0, r5, #0
	adds r0, #0xa8
	movs r1, #0xff
	lsls r1, r1, #0x16
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov63_0221D2F8
	ldr r0, [r5, #0x10]
	movs r1, #0
	bl FUN_0201EFBC
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221D54C: .4byte 0x00013056
_0221D550: .4byte 0x0000328C
_0221D554: .4byte 0x00000152
_0221D558: .4byte 0x00000159
	thumb_func_end ov63_0221D344

	thumb_func_start ov63_0221D55C
ov63_0221D55C: @ 0x0221D55C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0xe]
	cmp r1, #0x10
	bls _0221D568
	b _0221DB1A
_0221D568:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221D574: @ jump table
	.2byte _0221D596 - _0221D574 - 2 @ case 0
	.2byte _0221D632 - _0221D574 - 2 @ case 1
	.2byte _0221D644 - _0221D574 - 2 @ case 2
	.2byte _0221D65C - _0221D574 - 2 @ case 3
	.2byte _0221D6C4 - _0221D574 - 2 @ case 4
	.2byte _0221D70E - _0221D574 - 2 @ case 5
	.2byte _0221D726 - _0221D574 - 2 @ case 6
	.2byte _0221D734 - _0221D574 - 2 @ case 7
	.2byte _0221D780 - _0221D574 - 2 @ case 8
	.2byte _0221D812 - _0221D574 - 2 @ case 9
	.2byte _0221D848 - _0221D574 - 2 @ case 10
	.2byte _0221D860 - _0221D574 - 2 @ case 11
	.2byte _0221D87C - _0221D574 - 2 @ case 12
	.2byte _0221D894 - _0221D574 - 2 @ case 13
	.2byte _0221D8B8 - _0221D574 - 2 @ case 14
	.2byte _0221D940 - _0221D574 - 2 @ case 15
	.2byte _0221DB0C - _0221D574 - 2 @ case 16
_0221D596:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	bne _0221D5F2
	ldr r0, _0221D8A4 @ =0x00013056
	movs r2, #0
	ldrh r1, [r4, r0]
	ldr r0, _0221D8A8 @ =0x0000328C
	adds r3, r2, #0
	muls r0, r1, r0
	adds r1, r4, r0
	ldr r0, _0221D8AC @ =0x00000113
	subs r3, #0x48
	ldrb r5, [r1, r0]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0x48
	bl FUN_0201F238
	adds r0, r4, #0
	adds r5, #0x98
	adds r0, #0xac
	lsls r2, r5, #0x10
	ldr r0, [r0]
	movs r1, #0x30
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb0
	lsls r2, r5, #0x10
	ldr r0, [r0]
	movs r1, #0x2e
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D5F2:
	ldr r0, [r4, #0x10]
	movs r1, #1
	movs r2, #2
	movs r3, #7
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #1
	movs r3, #7
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	movs r1, #0x17
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #0
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb0
	movs r1, #0x18
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #0
	bl FUN_0200DED0
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D632:
	ldr r1, _0221D8B0 @ =0x00013060
	movs r0, #2
	ldr r2, [r4, r1]
	orrs r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D644:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x32
	bne _0221D656
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D656:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D65C:
	ldrh r0, [r4, #0xc]
	cmp r0, #6
	bne _0221D6A0
	adds r0, r4, #0
	adds r0, #0xb4
	ldr r0, [r0]
	movs r1, #0x20
	movs r2, #0x28
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #0x1f
	movs r2, #0x27
	bl FUN_0200DDB8
	movs r1, #1
	lsls r1, r1, #8
	adds r3, r4, r1
	ldr r1, _0221D8A4 @ =0x00013056
	adds r0, r4, #0
	ldrh r2, [r4, r1]
	ldr r1, _0221D8A8 @ =0x0000328C
	muls r1, r2, r1
	adds r1, r3, r1
	bl ov63_0221D2F8
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D6A0:
	adds r0, r4, #0
	adds r0, #0xb4
	ldr r0, [r0]
	movs r1, #0x13
	movs r2, #7
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #0x14
	movs r2, #7
	bl FUN_0200DED0
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D6C4:
	ldr r1, _0221D8A4 @ =0x00013056
	ldrh r2, [r4, r1]
	ldr r1, _0221D8A8 @ =0x0000328C
	muls r1, r2, r1
	adds r2, r4, r1
	movs r1, #0x43
	lsls r1, r1, #2
	ldrh r2, [r2, r1]
	ldr r1, _0221D8B4 @ =0x0000FF9E
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _0221D6F4
	movs r1, #4
	movs r2, #3
	bl ov63_0221C16C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #3
	bl ov63_0221C16C
	b _0221D706
_0221D6F4:
	movs r1, #4
	movs r2, #1
	bl ov63_0221C16C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #1
	bl ov63_0221C16C
_0221D706:
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D70E:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221D720
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D720:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D726:
	adds r0, #0x14
	bl FUN_0201D5C8
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D734:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221D77A
	movs r2, #0
	adds r3, r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #2
	subs r3, #0x10
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #2
	adds r3, #0xfd
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200DD54
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D77A:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D780:
	ldrh r0, [r4, #0xc]
	cmp r0, #8
	ldr r0, [r4, #0x10]
	bne _0221D7D4
	movs r1, #2
	movs r2, #0
	movs r3, #0x70
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #3
	movs r3, #0xc0
	bl FUN_0201F238
	movs r1, #3
	adds r3, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	adds r3, #0xfd
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xa4
	movs r1, #0x58
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x68
	movs r2, #0x48
	bl FUN_0200DDB8
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D7D4:
	movs r1, #2
	movs r2, #1
	movs r3, #0x10
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #5
	movs r3, #8
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xa4
	movs r1, #0x14
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #0x10
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xa8
	movs r1, #0x17
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #0x13
	bl FUN_0200DED0
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D812:
	adds r0, #0x24
	bl FUN_0201D5C8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov63_0221C954
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl ov63_0221C954
	adds r0, r4, #0
	movs r1, #3
	movs r2, #2
	bl ov63_0221C954
	adds r0, r4, #0
	movs r1, #5
	movs r2, #2
	bl ov63_0221C954
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D848:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x28
	bne _0221D85A
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D85A:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D860:
	adds r0, #0x34
	bl FUN_0201D5C8
	ldr r1, _0221D8B0 @ =0x00013060
	movs r0, #1
	ldr r2, [r4, r1]
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D87C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221D88E
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D88E:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D894:
	adds r0, #0x44
	bl FUN_0201D5C8
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
	nop
_0221D8A4: .4byte 0x00013056
_0221D8A8: .4byte 0x0000328C
_0221D8AC: .4byte 0x00000113
_0221D8B0: .4byte 0x00013060
_0221D8B4: .4byte 0x0000FF9E
_0221D8B8:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xf0
	bne _0221D93A
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #0
	movs r3, #0x48
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb4
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	movs r1, #0xfe
	ldr r0, _0221DB20 @ =0x00013058
	lsls r1, r1, #0x16
	str r1, [r4, r0]
	movs r1, #0xff
	lsls r1, r1, #0x16
	adds r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221D93A:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221D940:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	bne _0221DA14
	movs r1, #0
	adds r3, r1, #0
	adds r2, r1, #0
	subs r3, #0x50
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #0
	subs r3, #0xcb
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #3
	movs r2, #0
	movs r3, #0x3c
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	movs r3, #0xe2
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #0x94
	movs r2, #0xfc
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #0x40
	movs r2, #0xc0
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0x1b
	mvns r1, r1
	ldr r0, [r0]
	subs r2, r1, #2
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb8
	movs r1, #0x1c
	mvns r1, r1
	ldr r0, [r0]
	subs r2, r1, #2
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0x30
	movs r2, #0x80
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x40
	movs r2, #0x70
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r1, _0221DB24 @ =0x3FE66666
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r4, #0
	adds r0, #0xa8
	movs r1, #1
	lsls r1, r1, #0x1e
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221DB1A
_0221DA14:
	movs r1, #0
	movs r2, #2
	movs r3, #8
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #0
	movs r2, #4
	movs r3, #0x14
	bl FUN_0201F238
	movs r1, #1
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	movs r3, #7
	bl FUN_0201F238
	movs r1, #2
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	movs r3, #7
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #3
	movs r2, #1
	movs r3, #6
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r4, #0x10]
	movs r2, #5
	adds r3, r1, #0
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	movs r1, #0xa
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb0
	movs r1, #0xa
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #5
	mvns r1, r1
	ldr r0, [r0]
	subs r2, r1, #1
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb8
	movs r1, #5
	mvns r1, r1
	ldr r0, [r0]
	subs r2, r1, #1
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xa4
	movs r1, #3
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #4
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xa8
	movs r1, #3
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #4
	bl FUN_0200DED0
	ldr r5, _0221DB20 @ =0x00013058
	ldr r0, [r4, r5]
	blx FUN_020F2080
	ldr r2, _0221DB28 @ =0x47AE147B
	ldr r3, _0221DB2C @ =0x3FB47AE1
	blx FUN_020F068C
	blx FUN_020F09A4
	str r0, [r4, r5]
	adds r0, r5, #4
	ldr r0, [r4, r0]
	blx FUN_020F2080
	ldr r2, _0221DB30 @ =0x9999999A
	ldr r3, _0221DB34 @ =0x3FA99999
	blx FUN_020F068C
	blx FUN_020F09A4
	adds r1, r5, #4
	str r0, [r4, r1]
	adds r0, r4, #0
	subs r1, r1, #4
	adds r0, #0xa4
	ldr r1, [r4, r1]
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r4, #0
	adds r1, r5, #4
	adds r0, #0xa8
	ldr r1, [r4, r1]
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221DB1A
_0221DB0C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221DB16
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221DB16:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
_0221DB1A:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221DB20: .4byte 0x00013058
_0221DB24: .4byte 0x3FE66666
_0221DB28: .4byte 0x47AE147B
_0221DB2C: .4byte 0x3FB47AE1
_0221DB30: .4byte 0x9999999A
_0221DB34: .4byte 0x3FA99999
	thumb_func_end ov63_0221D55C

	thumb_func_start ov63_0221DB38
ov63_0221DB38: @ 0x0221DB38
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0xe]
	cmp r1, #0x10
	bls _0221DB44
	b _0221E0F6
_0221DB44:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0221DB50: @ jump table
	.2byte _0221DB72 - _0221DB50 - 2 @ case 0
	.2byte _0221DC0A - _0221DB50 - 2 @ case 1
	.2byte _0221DC1C - _0221DB50 - 2 @ case 2
	.2byte _0221DC34 - _0221DB50 - 2 @ case 3
	.2byte _0221DCA0 - _0221DB50 - 2 @ case 4
	.2byte _0221DCEA - _0221DB50 - 2 @ case 5
	.2byte _0221DD02 - _0221DB50 - 2 @ case 6
	.2byte _0221DD10 - _0221DB50 - 2 @ case 7
	.2byte _0221DD5C - _0221DB50 - 2 @ case 8
	.2byte _0221DDEA - _0221DB50 - 2 @ case 9
	.2byte _0221DE20 - _0221DB50 - 2 @ case 10
	.2byte _0221DE38 - _0221DB50 - 2 @ case 11
	.2byte _0221DE54 - _0221DB50 - 2 @ case 12
	.2byte _0221DE6C - _0221DB50 - 2 @ case 13
	.2byte _0221DE90 - _0221DB50 - 2 @ case 14
	.2byte _0221DF1A - _0221DB50 - 2 @ case 15
	.2byte _0221E0E8 - _0221DB50 - 2 @ case 16
_0221DB72:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	bne _0221DBCE
	ldr r0, _0221DE7C @ =0x00013056
	movs r2, #0
	ldrh r1, [r4, r0]
	ldr r0, _0221DE80 @ =0x0000328C
	movs r3, #0x48
	muls r0, r1, r0
	adds r1, r4, r0
	ldr r0, _0221DE84 @ =0x00000113
	ldrb r5, [r1, r0]
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0201F238
	movs r3, #0xff
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #0
	mvns r3, r3
	bl FUN_0201F238
	adds r0, r4, #0
	adds r5, #0x98
	adds r0, #0xac
	lsls r2, r5, #0x10
	ldr r0, [r0]
	movs r1, #0xa0
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb0
	lsls r2, r5, #0x10
	ldr r0, [r0]
	movs r1, #0x9e
	asrs r2, r2, #0x10
	bl FUN_0200DDB8
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DBCE:
	movs r1, #1
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	movs r3, #7
	bl FUN_0201F238
	movs r1, #2
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	movs r3, #7
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #0x18
	movs r2, #0
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #0x19
	movs r2, #0
	bl FUN_0200DED0
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DC0A:
	ldr r1, _0221DE88 @ =0x00013060
	movs r0, #2
	ldr r2, [r4, r1]
	orrs r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DC1C:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x32
	bne _0221DC2E
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DC2E:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DC34:
	ldrh r0, [r4, #0xc]
	cmp r0, #6
	bne _0221DC78
	adds r0, r4, #0
	adds r0, #0xb4
	ldr r0, [r0]
	movs r1, #0xe0
	movs r2, #0x28
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #0xe1
	movs r2, #0x27
	bl FUN_0200DDB8
	movs r1, #1
	lsls r1, r1, #8
	adds r3, r4, r1
	ldr r1, _0221DE7C @ =0x00013056
	adds r0, r4, #0
	ldrh r2, [r4, r1]
	ldr r1, _0221DE80 @ =0x0000328C
	muls r1, r2, r1
	adds r1, r3, r1
	bl ov63_0221D2F8
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DC78:
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0x12
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #7
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb8
	movs r1, #0x13
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #7
	bl FUN_0200DED0
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DCA0:
	ldr r1, _0221DE7C @ =0x00013056
	ldrh r2, [r4, r1]
	ldr r1, _0221DE80 @ =0x0000328C
	muls r1, r2, r1
	adds r2, r4, r1
	movs r1, #0x43
	lsls r1, r1, #2
	ldrh r2, [r2, r1]
	ldr r1, _0221DE8C @ =0x0000FF9E
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #1
	bhi _0221DCD0
	movs r1, #4
	movs r2, #3
	bl ov63_0221C16C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #3
	bl ov63_0221C16C
	b _0221DCE2
_0221DCD0:
	movs r1, #4
	movs r2, #1
	bl ov63_0221C16C
	adds r0, r4, #0
	movs r1, #5
	movs r2, #1
	bl ov63_0221C16C
_0221DCE2:
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DCEA:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221DCFC
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DCFC:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DD02:
	adds r0, #0x14
	bl FUN_0201D5C8
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DD10:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221DD56
	movs r3, #0x11
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #0
	lsls r3, r3, #4
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #2
	adds r3, #0xfd
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #2
	bl FUN_0200DD54
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DD56:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DD5C:
	ldrh r0, [r4, #0xc]
	cmp r0, #8
	ldr r0, [r4, #0x10]
	bne _0221DDB0
	movs r1, #2
	movs r2, #0
	movs r3, #0x90
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #3
	movs r3, #0xc0
	bl FUN_0201F238
	movs r1, #3
	adds r3, r1, #0
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	adds r3, #0xfd
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0xa8
	movs r2, #0x58
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x98
	movs r2, #0x48
	bl FUN_0200DDB8
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DDB0:
	movs r1, #2
	adds r2, r1, #0
	movs r3, #0x10
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #5
	movs r3, #8
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0x15
	movs r2, #0x10
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0x18
	movs r2, #0x13
	bl FUN_0200DED0
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DDEA:
	adds r0, #0x54
	bl FUN_0201D5C8
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl ov63_0221C954
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	bl ov63_0221C954
	adds r0, r4, #0
	movs r1, #3
	movs r2, #2
	bl ov63_0221C954
	adds r0, r4, #0
	movs r1, #5
	movs r2, #2
	bl ov63_0221C954
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE20:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x28
	bne _0221DE32
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE32:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DE38:
	adds r0, #0x64
	bl FUN_0201D5C8
	ldr r1, _0221DE88 @ =0x00013060
	movs r0, #1
	ldr r2, [r4, r1]
	bics r2, r0
	movs r0, #1
	orrs r0, r2
	str r0, [r4, r1]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE54:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221DE66
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DE66:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DE6C:
	adds r0, #0x74
	bl FUN_0201D5C8
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
	nop
_0221DE7C: .4byte 0x00013056
_0221DE80: .4byte 0x0000328C
_0221DE84: .4byte 0x00000113
_0221DE88: .4byte 0x00013060
_0221DE8C: .4byte 0x0000FF9E
_0221DE90:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xf0
	bne _0221DF14
	movs r3, #0xff
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #0
	mvns r3, r3
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #3
	movs r3, #0
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xac
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb0
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb4
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	adds r0, r4, #0
	adds r0, #0xb8
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200DD54
	movs r1, #0xfe
	ldr r0, _0221E0FC @ =0x00013058
	lsls r1, r1, #0x16
	str r1, [r4, r0]
	movs r1, #0xff
	lsls r1, r1, #0x16
	adds r0, r0, #4
	str r1, [r4, r0]
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DF14:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221DF1A:
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	ldr r0, [r4, #0x10]
	bne _0221DFF0
	movs r1, #0
	adds r2, r1, #0
	movs r3, #0x50
	bl FUN_0201F238
	movs r2, #3
	adds r3, r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #0
	subs r3, #0xcb
	bl FUN_0201F238
	movs r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r3, r2, #0
	bl FUN_0201F238
	movs r2, #0
	adds r3, r2, #0
	ldr r0, [r4, #0x10]
	movs r1, #2
	subs r3, #0xb8
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #3
	movs r2, #0
	movs r3, #0xc4
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	movs r3, #0xe2
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	movs r1, #0x41
	ldr r0, [r0]
	lsls r1, r1, #2
	movs r2, #0xfc
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb0
	movs r1, #0xc0
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #0xa4
	adds r2, r1, #0
	ldr r0, [r0]
	subs r2, #0xc2
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xb8
	movs r1, #0xa5
	adds r2, r1, #0
	ldr r0, [r0]
	subs r2, #0xc4
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0xd0
	movs r2, #0x80
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	movs r1, #0xc0
	movs r2, #0x70
	bl FUN_0200DDB8
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r1, _0221E100 @ =0x3FE66666
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r4, #0
	adds r0, #0xa8
	movs r1, #1
	lsls r1, r1, #0x1e
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E0F6
_0221DFF0:
	movs r1, #0
	movs r2, #1
	movs r3, #8
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #0
	movs r2, #4
	movs r3, #0x14
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #1
	movs r2, #2
	movs r3, #7
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #2
	movs r2, #1
	movs r3, #7
	bl FUN_0201F238
	ldr r0, [r4, #0x10]
	movs r1, #3
	movs r2, #2
	movs r3, #6
	bl FUN_0201F238
	movs r1, #3
	ldr r0, [r4, #0x10]
	movs r2, #5
	adds r3, r1, #0
	bl FUN_0201F238
	adds r0, r4, #0
	adds r0, #0xac
	movs r1, #9
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #0xa
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb0
	movs r1, #9
	ldr r0, [r0]
	mvns r1, r1
	movs r2, #0xa
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb4
	movs r1, #6
	adds r2, r1, #0
	ldr r0, [r0]
	subs r2, #0xd
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xb8
	movs r1, #6
	adds r2, r1, #0
	ldr r0, [r0]
	subs r2, #0xd
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xa4
	movs r1, #4
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DED0
	adds r0, r4, #0
	adds r0, #0xa8
	movs r1, #4
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200DED0
	ldr r5, _0221E0FC @ =0x00013058
	ldr r0, [r4, r5]
	blx FUN_020F2080
	ldr r2, _0221E104 @ =0x47AE147B
	ldr r3, _0221E108 @ =0x3FB47AE1
	blx FUN_020F068C
	blx FUN_020F09A4
	str r0, [r4, r5]
	adds r0, r5, #4
	ldr r0, [r4, r0]
	blx FUN_020F2080
	ldr r2, _0221E10C @ =0x9999999A
	ldr r3, _0221E110 @ =0x3FA99999
	blx FUN_020F068C
	blx FUN_020F09A4
	adds r1, r5, #4
	str r0, [r4, r1]
	adds r0, r4, #0
	subs r1, r1, #4
	adds r0, #0xa4
	ldr r1, [r4, r1]
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r4, #0
	adds r1, r5, #4
	adds r0, #0xa8
	ldr r1, [r4, r1]
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E0F6
_0221E0E8:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221E0F2
	movs r0, #0
	pop {r3, r4, r5, pc}
_0221E0F2:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
_0221E0F6:
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221E0FC: .4byte 0x00013058
_0221E100: .4byte 0x3FE66666
_0221E104: .4byte 0x47AE147B
_0221E108: .4byte 0x3FB47AE1
_0221E10C: .4byte 0x9999999A
_0221E110: .4byte 0x3FA99999
	thumb_func_end ov63_0221DB38

	thumb_func_start ov63_0221E114
ov63_0221E114: @ 0x0221E114
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	ldr r3, _0221E2F8 @ =0x0221FC38
	add r2, sp, #0x20
	adds r6, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #0xb4
	movs r1, #0x3e
	bl FUN_02007688
	str r0, [sp, #0x18]
	ldr r0, [r6]
	movs r7, #0
	ldr r0, [r0, #4]
	bl FUN_02074640
	cmp r0, #0
	bhi _0221E148
	b _0221E2EC
_0221E148:
	movs r0, #1
	lsls r0, r0, #8
	adds r0, r6, r0
	str r0, [sp, #0x1c]
_0221E150:
	ldr r0, [r6]
	adds r1, r7, #0
	ldr r0, [r0, #4]
	bl FUN_02074644
	adds r4, r0, #0
	bl FUN_0206DD40
	str r0, [sp, #0x14]
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0221E172
	b _0221E2D4
_0221E172:
	ldr r0, _0221E2FC @ =0x00013048
	movs r2, #0
	ldr r1, [r6, r0]
	ldr r0, _0221E300 @ =0x0000328C
	muls r0, r1, r0
	ldr r1, [sp, #0x1c]
	adds r5, r1, r0
	str r4, [r1, r0]
	adds r0, r4, #0
	movs r1, #5
	bl FUN_0206E540
	movs r1, #0
	strh r0, [r5, #0xc]
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_0206E540
	str r0, [r5, #8]
	adds r0, r4, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #0x10]
	adds r0, r4, #0
	movs r1, #0x6f
	movs r2, #0
	bl FUN_0206E540
	strb r0, [r5, #0x11]
	ldr r0, [r5, #8]
	movs r2, #0
	str r0, [sp]
	ldrh r0, [r5, #0xc]
	ldrb r1, [r5, #0x11]
	ldrb r3, [r5, #0x10]
	bl FUN_020708D8
	adds r0, #8
	strb r0, [r5, #0x13]
	adds r0, r4, #0
	movs r1, #0x99
	movs r2, #0
	bl FUN_0206E540
	str r0, [r5, #0x14]
	adds r0, r4, #0
	movs r1, #0xa1
	movs r2, #0
	bl FUN_0206E540
	strh r0, [r5, #0xe]
	str r7, [r5, #0x18]
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1d
	beq _0221E1E8
	cmp r0, #0x20
	bne _0221E1EE
_0221E1E8:
	movs r0, #0
	strb r0, [r5, #0x12]
	b _0221E1F2
_0221E1EE:
	movs r0, #1
	strb r0, [r5, #0x12]
_0221E1F2:
	ldrh r0, [r5, #0xc]
	bl FUN_0206A304
	adds r2, r0, #0
	adds r0, r5, #4
	movs r1, #0x8d
	bl FUN_02007508
	add r0, sp, #0x40
	adds r1, r4, #0
	movs r2, #2
	bl FUN_02070124
	adds r0, r5, #0
	adds r0, #0x6c
	str r0, [sp]
	ldr r0, [r5, #8]
	add r1, sp, #0x20
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	movs r2, #0x3e
	add r3, sp, #0x20
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl FUN_02014510
	ldr r0, _0221E304 @ =0x00000CEC
	add r1, sp, #0x20
	adds r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r2, #0x3e
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #2
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	add r3, sp, #0x30
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl FUN_02014510
	add r0, sp, #0x40
	adds r1, r4, #0
	movs r2, #0
	bl FUN_02070124
	ldr r0, _0221E308 @ =0x0000196C
	add r1, sp, #0x20
	adds r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r2, #0x3e
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	add r3, sp, #0x20
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl FUN_02014510
	ldr r0, _0221E30C @ =0x000025EC
	add r1, sp, #0x20
	adds r0, r5, r0
	str r0, [sp]
	ldr r0, [r5, #8]
	movs r2, #0x3e
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r0, [r5, #0xc]
	add r3, sp, #0x30
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrh r0, [r0, #0x20]
	ldrh r1, [r1, #0x22]
	bl FUN_02014510
	adds r1, r5, #0
	ldrh r2, [r5, #0xc]
	ldr r0, [sp, #0x18]
	adds r1, #0x1c
	movs r3, #1
	bl FUN_02072914
	ldrh r2, [r5, #0xc]
	adds r1, r5, #0
	ldr r0, [sp, #0x18]
	adds r1, #0x44
	movs r3, #0
	bl FUN_02072914
	ldr r0, _0221E2FC @ =0x00013048
	ldr r0, [r6, r0]
	adds r1, r0, #1
	ldr r0, _0221E2FC @ =0x00013048
	str r1, [r6, r0]
_0221E2D4:
	ldr r1, [sp, #0x14]
	adds r0, r4, #0
	bl FUN_0206DD8C
	ldr r0, [r6]
	adds r7, r7, #1
	ldr r0, [r0, #4]
	bl FUN_02074640
	cmp r7, r0
	bhs _0221E2EC
	b _0221E150
_0221E2EC:
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E2F8: .4byte 0x0221FC38
_0221E2FC: .4byte 0x00013048
_0221E300: .4byte 0x0000328C
_0221E304: .4byte 0x00000CEC
_0221E308: .4byte 0x0000196C
_0221E30C: .4byte 0x000025EC
	thumb_func_end ov63_0221E114

	thumb_func_start ov63_0221E310
ov63_0221E310: @ 0x0221E310
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r6, r2, #0
	bl FUN_0206DD40
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0x7a
	movs r2, #0
	bl FUN_0206E540
	subs r1, r0, #1
	cmp r1, #2
	bhi _0221E334
	movs r5, #4
	b _0221E3F6
_0221E334:
	subs r1, r0, #4
	cmp r1, #1
	bhi _0221E33E
	movs r5, #3
	b _0221E3F6
_0221E33E:
	cmp r0, #0xf
	bne _0221E346
	movs r5, #6
	b _0221E3F6
_0221E346:
	subs r0, #0xa
	cmp r0, #2
	bhi _0221E350
	movs r5, #5
	b _0221E3F6
_0221E350:
	adds r0, r4, #0
	movs r1, #0x6e
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _0221E362
	movs r5, #7
	b _0221E3F6
_0221E362:
	adds r0, r4, #0
	movs r1, #6
	bl FUN_0206D894
	cmp r0, #1
	bne _0221E372
	movs r5, #8
	b _0221E3F6
_0221E372:
	adds r0, r4, #0
	movs r1, #7
	bl FUN_0206D894
	cmp r0, #1
	bne _0221E382
	movs r5, #9
	b _0221E3F6
_0221E382:
	adds r0, r6, #0
	bl FUN_02028F84
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	bl FUN_0206E540
	cmp r7, r0
	beq _0221E39C
	movs r5, #2
	b _0221E3F6
_0221E39C:
	adds r1, r5, #0
	adds r1, #0x8c
	ldr r1, [r1]
	adds r0, r6, #0
	bl FUN_02028F58
	adds r2, r5, #0
	adds r2, #0x90
	ldr r2, [r2]
	adds r0, r4, #0
	movs r1, #0x91
	bl FUN_0206E540
	adds r0, r5, #0
	adds r0, #0x8c
	adds r5, #0x90
	ldr r0, [r0]
	ldr r1, [r5]
	bl FUN_020267A4
	cmp r0, #0
	beq _0221E3CC
	movs r5, #2
	b _0221E3F6
_0221E3CC:
	adds r0, r4, #0
	movs r1, #0x99
	movs r2, #0
	bl FUN_0206E540
	movs r1, #0x7d
	lsls r1, r1, #4
	cmp r0, r1
	blo _0221E3E2
	movs r5, #7
	b _0221E3F6
_0221E3E2:
	adds r0, r4, #0
	movs r1, #0x93
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _0221E3F4
	movs r5, #0
	b _0221E3F6
_0221E3F4:
	movs r5, #1
_0221E3F6:
	ldr r1, [sp]
	adds r0, r4, #0
	bl FUN_0206DD8C
	adds r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov63_0221E310

	thumb_func_start ov63_0221E404
ov63_0221E404: @ 0x0221E404
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	cmp r5, #0
	ble _0221E416
	ldr r1, _0221E448 @ =0x000001ED
	cmp r5, r1
	ble _0221E41A
_0221E416:
	movs r4, #1
	b _0221E442
_0221E41A:
	bl FUN_0206A304
	ldr r1, _0221E44C @ =0x00000129
	adds r4, r0, r1
	adds r0, r5, #0
	bl FUN_0206A338
	cmp r0, #0
	beq _0221E434
	cmp r7, #1
	bne _0221E442
	adds r4, r4, #1
	b _0221E442
_0221E434:
	adds r0, r5, #0
	bl FUN_0206A310
	cmp r6, r0
	ble _0221E440
	movs r6, #0
_0221E440:
	adds r4, r4, r6
_0221E442:
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E448: .4byte 0x000001ED
_0221E44C: .4byte 0x00000129
	thumb_func_end ov63_0221E404

	thumb_func_start ov63_0221E450
ov63_0221E450: @ 0x0221E450
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x3e
	movs r1, #0x2c
	adds r7, r2, #0
	str r3, [sp]
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #1
	lsls r0, r0, #8
	adds r1, r5, r0
	ldr r0, _0221E4D4 @ =0x0000328C
	muls r0, r6, r0
	adds r0, r1, r0
	str r0, [r4]
	ldr r0, [sp]
	str r0, [r4, #0x28]
	adds r0, r5, #0
	adds r0, #0x98
	ldr r0, [r0]
	str r0, [r4, #0x18]
	lsls r0, r7, #2
	adds r0, r5, r0
	adds r0, #0xa4
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #1
	blx FUN_020B802C
	str r0, [r4, #0x20]
	ldr r0, [sp, #0x18]
	cmp r0, #2
	bne _0221E4B0
	ldr r0, [r4]
	adds r0, #0x6c
	str r0, [r4, #0x1c]
	movs r0, #1
	strh r0, [r4, #0x24]
	ldr r1, [r4]
	adds r0, r4, #4
	adds r1, #0x1c
	bl FUN_02009264
	b _0221E4C6
_0221E4B0:
	ldr r1, [r4]
	ldr r0, _0221E4D8 @ =0x0000196C
	adds r0, r1, r0
	str r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x24]
	ldr r1, [r4]
	adds r0, r4, #4
	adds r1, #0x44
	bl FUN_02009264
_0221E4C6:
	ldr r0, _0221E4DC @ =ov63_0221E4E0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E4D4: .4byte 0x0000328C
_0221E4D8: .4byte 0x0000196C
_0221E4DC: .4byte ov63_0221E4E0
	thumb_func_end ov63_0221E450

	thumb_func_start ov63_0221E4E0
ov63_0221E4E0: @ 0x0221E4E0
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0x28]
	cmp r0, #1
	bne _0221E528
	ldr r2, [r4]
	ldrh r3, [r4, #0x24]
	ldrh r2, [r2, #0xc]
	ldr r0, [r4, #0x18]
	add r1, sp, #4
	bl FUN_020729A4
	ldr r2, [r4]
	ldr r1, _0221E558 @ =0x000001B9
	ldrh r0, [r2, #0xc]
	cmp r0, r1
	bne _0221E51A
	add r0, sp, #4
	ldrb r0, [r0]
	movs r2, #0x64
	str r0, [sp]
	movs r0, #0
	adds r1, r0, #0
	adds r3, r0, #0
	bl FUN_02006EA0
	b _0221E524
_0221E51A:
	add r1, sp, #4
	ldrb r1, [r1]
	ldrb r2, [r2, #0x10]
	bl FUN_020062E0
_0221E524:
	movs r0, #0
	str r0, [r4, #0x28]
_0221E528:
	adds r0, r4, #4
	bl FUN_02009284
	cmp r0, #0
	blt _0221E548
	movs r2, #0x32
	ldr r3, [r4, #0x1c]
	lsls r2, r2, #6
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r3, r1
	ldr r1, [r4, #0x20]
	bl ov63_0221C00C
	add sp, #8
	pop {r3, r4, r5, pc}
_0221E548:
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
_0221E558: .4byte 0x000001B9
	thumb_func_end ov63_0221E4E0

	thumb_func_start ov63_0221E55C
ov63_0221E55C: @ 0x0221E55C
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r2, #0
	cmp r1, r4
	bne _0221E578
	movs r1, #0
	ldr r0, _0221E59C @ =0x04000050
	movs r2, #0x1c
	adds r3, r1, #0
	str r1, [sp]
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
_0221E578:
	movs r0, #1
	lsls r0, r0, #0x14
	blx FUN_020F2BA4
	adds r1, r0, #0
	muls r1, r4, r1
	lsrs r3, r1, #0x10
	movs r0, #0x10
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _0221E59C @ =0x04000050
	movs r1, #4
	movs r2, #0x1c
	blx FUN_020CF15C
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221E59C: .4byte 0x04000050
	thumb_func_end ov63_0221E55C

	thumb_func_start ov63_0221E5A0
ov63_0221E5A0: @ 0x0221E5A0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0221E878 @ =0x00013060
	ldr r0, [r4, r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221E5BC
	movs r1, #2
	ldr r0, [r4, #0x10]
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201F238
_0221E5BC:
	ldr r1, _0221E878 @ =0x00013060
	ldr r0, [r4, r1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0221E638
	adds r0, r1, #0
	adds r0, #0xa
	ldrh r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #8
	ldrh r0, [r4, r0]
	cmp r2, r0
	bne _0221E62C
	bl FUN_0201FD44
	movs r1, #0xe0
	blx FUN_020F2998
	adds r1, #0x10
	lsls r0, r1, #0x10
	asrs r5, r0, #0x10
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1a
	subs r1, r1, r2
	movs r0, #0x1a
	rors r1, r0
	adds r0, r2, r1
	adds r0, #0x10
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	adds r0, r4, #0
	adds r0, #0xdc
	ldr r0, [r0]
	adds r1, r5, #0
	bl FUN_0200DDB8
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0
	bl ov63_0221C16C
	bl FUN_0201FD44
	movs r1, #0xff
	blx FUN_020F2998
	ldr r0, _0221E87C @ =0x00013068
	adds r1, #0x1c
	strh r1, [r4, r0]
	movs r1, #0
	adds r0, r0, #2
	strh r1, [r4, r0]
	b _0221E638
_0221E62C:
	adds r0, r1, #0
	adds r0, #0xa
	ldrh r0, [r4, r0]
	adds r1, #0xa
	adds r0, r0, #1
	strh r0, [r4, r1]
_0221E638:
	ldrh r0, [r4, #0xe]
	cmp r0, #7
	bhi _0221E6B6
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0221E64A: @ jump table
	.2byte _0221E65A - _0221E64A - 2 @ case 0
	.2byte _0221E672 - _0221E64A - 2 @ case 1
	.2byte _0221E6C8 - _0221E64A - 2 @ case 2
	.2byte _0221E6E0 - _0221E64A - 2 @ case 3
	.2byte _0221E724 - _0221E64A - 2 @ case 4
	.2byte _0221E782 - _0221E64A - 2 @ case 5
	.2byte _0221E7B6 - _0221E64A - 2 @ case 6
	.2byte _0221E7EC - _0221E64A - 2 @ case 7
_0221E65A:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x14
	bne _0221E66C
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E66C:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E672:
	ldr r0, _0221E880 @ =0x00013056
	ldr r2, _0221E884 @ =0x0221FDB8
	ldrh r1, [r4, r0]
	ldrh r3, [r4, #0xc]
	lsls r0, r1, #2
	adds r0, r4, r0
	adds r0, #0xa4
	lsls r1, r1, #4
	adds r1, r2, r1
	ldr r0, [r0]
	movs r2, #6
	bl ov63_0221C610
	ldrh r0, [r4, #0xc]
	cmp r0, #6
	bne _0221E6C2
	ldr r0, _0221E880 @ =0x00013056
	movs r1, #1
	ldrh r0, [r4, r0]
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_0200DF98
	ldr r0, _0221E880 @ =0x00013056
	movs r2, #0
	ldrh r1, [r4, r0]
	adds r1, r1, #1
	strh r1, [r4, r0]
	strh r2, [r4, #0xc]
	ldrh r1, [r4, r0]
	cmp r1, #6
	beq _0221E6B8
_0221E6B6:
	b _0221E874
_0221E6B8:
	strh r2, [r4, r0]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E6C2:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E6C8:
	ldrh r0, [r4, #0xc]
	cmp r0, #0x20
	bne _0221E6DA
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E6DA:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E6E0:
	ldr r0, _0221E888 @ =0x00013064
	movs r1, #0x28
	str r1, [r4, r0]
	subs r1, r0, #4
	ldr r2, [r4, r1]
	movs r1, #8
	orrs r2, r1
	subs r1, r0, #4
	str r2, [r4, r1]
	ldr r2, [r4, r1]
	movs r1, #4
	orrs r2, r1
	subs r1, r0, #4
	str r2, [r4, r1]
	ldr r2, [r4, r1]
	movs r1, #0x20
	orrs r2, r1
	subs r1, r0, #4
	str r2, [r4, r1]
	ldr r2, [r4, r1]
	movs r1, #0x40
	orrs r1, r2
	subs r0, r0, #4
	str r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0xdc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DCE8
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E724:
	ldrh r2, [r4, #0xc]
	adds r0, r4, #0
	movs r1, #0x50
	bl ov63_0221E55C
	ldr r0, _0221E88C @ =0x00013048
	movs r5, #0
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0221E75A
	ldr r6, _0221E890 @ =0x0221FE18
	adds r7, r4, #0
_0221E73C:
	adds r0, r7, #0
	adds r0, #0xbc
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	adds r1, r6, #0
	movs r2, #0x50
	bl ov63_0221C610
	ldr r0, _0221E88C @ =0x00013048
	adds r5, r5, #1
	ldr r0, [r4, r0]
	adds r6, #0x10
	adds r7, r7, #4
	cmp r5, r0
	blo _0221E73C
_0221E75A:
	adds r0, r4, #0
	adds r0, #0xd8
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	ldr r1, _0221E894 @ =0x0221FE78
	movs r2, #0x50
	bl ov63_0221C610
	ldrh r0, [r4, #0xc]
	cmp r0, #0x50
	bne _0221E77C
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E77C:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	b _0221E874
_0221E782:
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0221E874
	ldr r0, _0221E898 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _0221E79C
	bl FUN_02025358
	cmp r0, #1
	bne _0221E874
_0221E79C:
	ldr r0, _0221E888 @ =0x00013064
	movs r1, #0xf
	str r1, [r4, r0]
	subs r1, r0, #4
	ldr r2, [r4, r1]
	movs r1, #8
	orrs r1, r2
	subs r0, r0, #4
	str r1, [r4, r0]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E874
_0221E7B6:
	ldrh r2, [r4, #0xc]
	adds r0, r4, #0
	movs r1, #0x3c
	bl ov63_0221E55C
	ldrh r0, [r4, #0xc]
	cmp r0, #0x1e
	bne _0221E7E8
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0221E7EC
	ldr r0, _0221E888 @ =0x00013064
	movs r1, #0xf
	str r1, [r4, r0]
	subs r1, r0, #4
	ldr r2, [r4, r1]
	movs r1, #0x10
	orrs r1, r2
	subs r0, r0, #4
	str r1, [r4, r0]
	ldrh r0, [r4, #0xe]
	adds r0, r0, #1
	strh r0, [r4, #0xe]
	b _0221E7EC
_0221E7E8:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
_0221E7EC:
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221E88C @ =0x00013048
	ldr r0, [r4, r0]
	cmp r0, #0
	bls _0221E834
	ldr r7, _0221E89C @ =0x0221FE88
	ldr r6, _0221E8A0 @ =0x0221FEF8
	adds r5, r4, #0
_0221E7FE:
	adds r0, r5, #0
	adds r0, #0xa4
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	adds r1, r7, #0
	movs r2, #0x3c
	bl ov63_0221C610
	adds r0, r5, #0
	adds r0, #0xbc
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	adds r1, r6, #0
	movs r2, #0x3c
	bl ov63_0221C610
	ldr r0, [sp]
	adds r7, #0x10
	adds r0, r0, #1
	str r0, [sp]
	ldr r0, _0221E88C @ =0x00013048
	adds r5, r5, #4
	ldr r1, [r4, r0]
	ldr r0, [sp]
	adds r6, #0x10
	cmp r0, r1
	blo _0221E7FE
_0221E834:
	adds r0, r4, #0
	adds r0, #0xd4
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	ldr r1, _0221E8A4 @ =0x0221FEE8
	movs r2, #0x3c
	bl ov63_0221C610
	adds r0, r4, #0
	adds r0, #0xd8
	ldrh r3, [r4, #0xc]
	ldr r0, [r0]
	ldr r1, _0221E8A8 @ =0x0221FF58
	movs r2, #0x3c
	bl ov63_0221C610
	ldrh r0, [r4, #0xe]
	cmp r0, #7
	bne _0221E874
	ldrh r0, [r4, #0xc]
	cmp r0, #0x3c
	bne _0221E870
	bl FUN_0200FB5C
	cmp r0, #1
	bne _0221E874
	movs r0, #0
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	pop {r3, r4, r5, r6, r7, pc}
_0221E870:
	adds r0, r0, #1
	strh r0, [r4, #0xc]
_0221E874:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221E878: .4byte 0x00013060
_0221E87C: .4byte 0x00013068
_0221E880: .4byte 0x00013056
_0221E884: .4byte 0x0221FDB8
_0221E888: .4byte 0x00013064
_0221E88C: .4byte 0x00013048
_0221E890: .4byte 0x0221FE18
_0221E894: .4byte 0x0221FE78
_0221E898: .4byte 0x021D110C
_0221E89C: .4byte 0x0221FE88
_0221E8A0: .4byte 0x0221FEF8
_0221E8A4: .4byte 0x0221FEE8
_0221E8A8: .4byte 0x0221FF58
	thumb_func_end ov63_0221E5A0

	thumb_func_start ov63_0221E8AC
ov63_0221E8AC: @ 0x0221E8AC
	push {lr}
	sub sp, #0xc
	ldr r1, _0221E8CC @ =0x00013064
	ldr r3, _0221E8D0 @ =0x00007FFF
	ldr r0, [r0, r1]
	movs r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0x3e
	str r0, [sp, #8]
	movs r0, #3
	adds r2, r1, #0
	bl FUN_0200FA24
	add sp, #0xc
	pop {pc}
	.align 2, 0
_0221E8CC: .4byte 0x00013064
_0221E8D0: .4byte 0x00007FFF
	thumb_func_end ov63_0221E8AC

	thumb_func_start ov63_0221E8D4
ov63_0221E8D4: @ 0x0221E8D4
	push {lr}
	sub sp, #0xc
	ldr r1, _0221E8F8 @ =0x00013064
	ldr r0, [r0, r1]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x3e
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	add sp, #0xc
	pop {pc}
	nop
_0221E8F8: .4byte 0x00013064
	thumb_func_end ov63_0221E8D4

	thumb_func_start ov63_0221E8FC
ov63_0221E8FC: @ 0x0221E8FC
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0221E912
	adds r0, r4, #0
	blx r1
	cmp r0, #0
	bne _0221E912
	movs r0, #0
	str r0, [r4, #8]
_0221E912:
	adds r0, r4, #0
	bl ov63_0221F1D0
	ldr r0, [r4, #0x10]
	bl FUN_0201EEB4
	adds r4, #0xa0
	ldr r0, [r4]
	bl FUN_0200D020
	bl FUN_0200D034
	ldr r3, _0221E938 @ =0x027E0000
	ldr r1, _0221E93C @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.align 2, 0
_0221E938: .4byte 0x027E0000
_0221E93C: .4byte 0x00003FF8
	thumb_func_end ov63_0221E8FC

	thumb_func_start ov63_0221E940
ov63_0221E940: @ 0x0221E940
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _0221E9EC @ =0x0221FB00
	add r3, sp, #0x54
	adds r4, r0, #0
	adds r2, r3, #0
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r5!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_0201ACB0
	ldr r5, _0221E9F0 @ =0x0221FBE4
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0201CAE0
	movs r0, #1
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x3e
	bl FUN_0201C1C4
	ldr r5, _0221E9F4 @ =0x0221FC00
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	ldr r5, _0221E9F8 @ =0x0221FB90
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
	ldr r0, [r4, #0x10]
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #2
	movs r1, #0
	bl FUN_02022C60
	movs r0, #4
	movs r1, #0
	bl FUN_02022C60
	movs r0, #8
	movs r1, #0
	bl FUN_02022C60
	add sp, #0x64
	pop {r4, r5, pc}
	nop
_0221E9EC: .4byte 0x0221FB00
_0221E9F0: .4byte 0x0221FBE4
_0221E9F4: .4byte 0x0221FC00
_0221E9F8: .4byte 0x0221FB90
	thumb_func_end ov63_0221E940

	thumb_func_start ov63_0221E9FC
ov63_0221E9FC: @ 0x0221E9FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r4, #0x10]
	movs r1, #0
	bl FUN_0201BB4C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov63_0221E9FC

	thumb_func_start ov63_0221EA24
ov63_0221EA24: @ 0x0221EA24
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	movs r1, #5
	movs r3, #2
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	movs r1, #6
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x3e
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x94
	ldr r0, [r0]
	ldr r2, [r4, #0x10]
	movs r1, #7
	movs r3, #2
	bl FUN_02007B44
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3e
	movs r2, #0
	adds r4, #0x94
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #8
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #1
	movs r1, #0
	bl FUN_0201C2D8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov63_0221EA24

	thumb_func_start ov63_0221EAA8
ov63_0221EAA8: @ 0x0221EAA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r4, r5, #0
	ldr r6, _0221EBFC @ =0x0221FB20
	movs r7, #0
	adds r4, #0x14
_0221EAB6:
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0201D4F8
	adds r7, r7, #1
	adds r6, #8
	adds r4, #0x10
	cmp r7, #2
	blo _0221EAB6
	adds r0, r5, #0
	adds r0, #0x14
	movs r1, #1
	bl FUN_0201D978
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x84
	adds r2, #0x8c
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0x10
	bl FUN_0200BB6C
	adds r1, r5, #0
	adds r1, #0x8c
	movs r0, #0
	ldr r1, [r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	adds r2, r5, #0
	lsrs r4, r3, #1
	movs r3, #0x80
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC00 @ =0x000F0200
	adds r2, #0x8c
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r2]
	adds r0, #0x14
	subs r3, r3, r4
	bl FUN_020200FC
	adds r0, r5, #0
	adds r0, #0x14
	bl FUN_0201D578
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #1
	bl FUN_0201D978
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x84
	adds r2, #0x90
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0x11
	bl FUN_0200BB6C
	adds r0, r5, #0
	ldr r2, [r5]
	adds r0, #0x88
	ldr r0, [r0]
	ldr r2, [r2]
	movs r1, #0
	bl FUN_0200BE48
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02028F88
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	adds r0, r5, #0
	str r1, [sp, #4]
	adds r0, #0x88
	ldr r0, [r0]
	movs r3, #5
	bl FUN_0200BFCC
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0202CE24
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #2
	movs r3, #3
	bl FUN_0200BFCC
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl FUN_0202CE28
	adds r2, r0, #0
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x88
	ldr r0, [r0]
	movs r1, #3
	bl FUN_0200BFCC
	adds r0, r5, #0
	adds r1, r5, #0
	adds r2, r5, #0
	adds r0, #0x88
	adds r1, #0x8c
	adds r2, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl FUN_0200CBBC
	adds r1, r5, #0
	adds r1, #0x8c
	movs r0, #0
	ldr r1, [r1]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r3, r0, #0
	movs r1, #0
	adds r2, r5, #0
	lsrs r4, r3, #1
	movs r3, #0x80
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EC00 @ =0x000F0200
	adds r2, #0x8c
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r2]
	adds r0, #0x24
	subs r3, r3, r4
	bl FUN_020200FC
	adds r5, #0x24
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221EBFC: .4byte 0x0221FB20
_0221EC00: .4byte 0x000F0200
	thumb_func_end ov63_0221EAA8

	thumb_func_start ov63_0221EC04
ov63_0221EC04: @ 0x0221EC04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	adds r5, #0x14
_0221EC0C:
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #2
	blo _0221EC0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov63_0221EC04

	thumb_func_start ov63_0221EC1C
ov63_0221EC1C: @ 0x0221EC1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	ldr r3, _0221EFA4 @ =0x0221FAF0
	add r2, sp, #0x1c
	adds r5, r0, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	movs r0, #8
	movs r1, #0x3e
	bl FUN_02007688
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221EFA8 @ =0x0000D8D8
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	movs r3, #0x4d
	bl FUN_0200D6EC
	movs r0, #0
	str r0, [sp]
	ldr r0, _0221EFA8 @ =0x0000D8D8
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	movs r3, #0x4e
	bl FUN_0200D71C
	movs r4, #0
_0221EC72:
	ldr r0, _0221EFA8 @ =0x0000D8D8
	adds r1, r5, #0
	adds r6, r4, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r5, #0
	str r6, [sp, #8]
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	movs r3, #0x4c
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r1, r5, #0
	str r6, [sp, #0xc]
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	adds r4, r4, #1
	cmp r4, #6
	blo _0221EC72
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _0221EFAC @ =0x0000D8DF
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	movs r3, #0x4c
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221EFB0 @ =0x0000D8E0
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221EFB4 @ =0x0000D8E1
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	movs r3, #0x4b
	bl FUN_0200D5D4
	adds r0, r7, #0
	bl FUN_0200770C
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221EFB8 @ =0x0000D8DB
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0x11
	bl FUN_0200D6EC
	movs r0, #1
	str r0, [sp]
	ldr r0, _0221EFB8 @ =0x0000D8DB
	adds r1, r5, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0x12
	bl FUN_0200D71C
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221EFB0 @ =0x0000D8E0
	adds r1, r5, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0x10
	bl FUN_0200D504
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221EFBC @ =0x0000D8E2
	adds r1, r5, #0
	str r0, [sp, #0xc]
	adds r0, r5, #0
	adds r2, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	adds r2, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	movs r3, #0x13
	bl FUN_0200D5D4
	movs r0, #1
	ldr r7, _0221EFC0 @ =0x022200A0
	lsls r0, r0, #8
	movs r6, #0
	adds r0, r5, r0
	adds r4, r5, #0
	str r6, [sp, #0x14]
	str r0, [sp, #0x10]
	str r7, [sp, #0x18]
_0221EDBE:
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r7, #0
	bl FUN_0200D734
	adds r1, r4, #0
	adds r1, #0xa4
	str r0, [r1]
	movs r2, #0x4e
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r3, [sp, #0x14]
	lsls r2, r2, #2
	adds r3, r3, r2
	ldr r2, [sp, #0x18]
	ldr r0, [r0]
	ldr r1, [r1]
	adds r2, r2, r3
	bl FUN_0200D734
	adds r1, r4, #0
	adds r1, #0xbc
	str r0, [r1]
	ldr r0, _0221EFC4 @ =0x00013048
	ldr r0, [r5, r0]
	cmp r6, r0
	bhs _0221EE0E
	ldr r1, [sp, #0x10]
	adds r0, r5, #0
	movs r2, #2
	adds r3, r6, #0
	bl ov63_0221C8E8
	b _0221EE1A
_0221EE0E:
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
_0221EE1A:
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r6, #0
	bl ov63_0221C99C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #1
	bl ov63_0221C954
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DF98
	adds r0, r4, #0
	adds r0, #0xa4
	movs r1, #0xfe
	lsls r1, r1, #0x16
	ldr r0, [r0]
	adds r2, r1, #0
	bl FUN_0200E024
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200E0FC
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200E0FC
	adds r0, r4, #0
	adds r0, #0xbc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	adds r0, #0x34
	str r0, [sp, #0x14]
	ldr r0, _0221EFC8 @ =0x0000328C
	adds r6, r6, #1
	adds r0, r1, r0
	adds r7, #0x34
	adds r4, r4, #4
	str r0, [sp, #0x10]
	cmp r6, #6
	blo _0221EDBE
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _0221EFCC @ =0x02220310
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0xd4
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _0221EFD0 @ =0x02220344
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0xd8
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DF98
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #1
	bl FUN_0200DF98
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r5, #0
	adds r0, #0xd8
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	ldr r0, [r5]
	ldr r0, [r0]
	bl FUN_02028F94
	cmp r0, #1
	add r2, sp, #0x2c
	bne _0221EEFE
	movs r0, #1
	movs r1, #2
	bl FUN_02070D84
	b _0221EF06
_0221EEFE:
	movs r0, #0
	movs r1, #2
	bl FUN_02070D84
_0221EF06:
	movs r1, #0x19
	movs r0, #0x3e
	lsls r1, r1, #8
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r4, [sp]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x40]
	movs r2, #0x3e
	add r3, sp, #0x1c
	bl FUN_020143E0
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02024B1C
	movs r1, #1
	blx FUN_020B802C
	movs r2, #0x32
	adds r1, r0, #0
	adds r0, r4, #0
	lsls r2, r2, #6
	bl ov63_0221C00C
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	adds r0, #0xd4
	ldr r0, [r0]
	ldr r0, [r0]
	bl FUN_02024B34
	movs r1, #1
	blx FUN_020B8078
	adds r3, r0, #0
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x3e
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x34]
	movs r2, #1
	bl FUN_02007938
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x9c
	adds r1, #0xa0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _0221EFD4 @ =0x02220378
	bl FUN_0200D734
	adds r1, r5, #0
	adds r1, #0xdc
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0xdc
	ldr r0, [r0]
	movs r1, #0
	bl FUN_0200DCE8
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #0
	bl ov63_0221C954
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221EFA4: .4byte 0x0221FAF0
_0221EFA8: .4byte 0x0000D8D8
_0221EFAC: .4byte 0x0000D8DF
_0221EFB0: .4byte 0x0000D8E0
_0221EFB4: .4byte 0x0000D8E1
_0221EFB8: .4byte 0x0000D8DB
_0221EFBC: .4byte 0x0000D8E2
_0221EFC0: .4byte 0x022200A0
_0221EFC4: .4byte 0x00013048
_0221EFC8: .4byte 0x0000328C
_0221EFCC: .4byte 0x02220310
_0221EFD0: .4byte 0x02220344
_0221EFD4: .4byte 0x02220378
	thumb_func_end ov63_0221EC1C

	thumb_func_start ov63_0221EFD8
ov63_0221EFD8: @ 0x0221EFD8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #0
_0221EFDE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov63_0221C134
	adds r4, r4, #1
	cmp r4, #0xf
	blo _0221EFDE
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F070 @ =0x0000D8E2
	bl FUN_0200D968
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F074 @ =0x0000D8E0
	bl FUN_0200D958
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F078 @ =0x0000D8DB
	bl FUN_0200D978
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F078 @ =0x0000D8DB
	bl FUN_0200D988
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F074 @ =0x0000D8E0
	bl FUN_0200D968
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F07C @ =0x0000D8DF
	bl FUN_0200D958
	ldr r6, _0221F080 @ =0x0000D8D8
	movs r4, #0
_0221F038:
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	adds r1, r4, r6
	bl FUN_0200D968
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	adds r1, r4, r6
	bl FUN_0200D958
	adds r4, r4, #1
	cmp r4, #6
	blo _0221F038
	adds r0, r5, #0
	adds r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0221F084 @ =0x0000D8DA
	bl FUN_0200D978
	adds r5, #0xa0
	ldr r0, [r5]
	ldr r1, _0221F084 @ =0x0000D8DA
	bl FUN_0200D988
	pop {r4, r5, r6, pc}
	nop
_0221F070: .4byte 0x0000D8E2
_0221F074: .4byte 0x0000D8E0
_0221F078: .4byte 0x0000D8DB
_0221F07C: .4byte 0x0000D8DF
_0221F080: .4byte 0x0000D8D8
_0221F084: .4byte 0x0000D8DA
	thumb_func_end ov63_0221EFD8

	thumb_func_start ov63_0221F088
ov63_0221F088: @ 0x0221F088
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	blx FUN_020C2698
	blx FUN_020CF704
	ldr r0, _0221F118 @ =0x04000060
	ldr r2, _0221F11C @ =0xFFFFCFFD
	ldrh r1, [r0]
	ands r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	adds r1, r2, #2
	ands r3, r1
	movs r1, #0x10
	orrs r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _0221F120 @ =0x0000CFFB
	ands r1, r3
	strh r1, [r0]
	adds r1, r2, #2
	ldrh r3, [r0]
	lsrs r2, r2, #0x11
	ands r3, r1
	movs r1, #8
	orrs r1, r3
	strh r1, [r0]
	movs r0, #0
	adds r1, r0, #0
	movs r3, #0x3f
	str r0, [sp]
	blx FUN_020CF910
	ldr r1, _0221F124 @ =0x04000540
	movs r0, #2
	str r0, [r1]
	ldr r0, _0221F128 @ =0xBFFF0000
	str r0, [r1, #0x40]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02027000
	movs r0, #1
	lsls r0, r0, #0xe
	movs r1, #1
	bl FUN_02027008
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	ldr r0, _0221F12C @ =0x04000008
	movs r1, #3
	ldrh r2, [r0]
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strh r1, [r0]
	movs r1, #0
	adds r0, #0x48
	movs r2, #0x1c
	adds r3, r1, #0
	str r1, [sp]
	blx FUN_020CF15C
	adds r0, r4, #0
	bl ov63_0221F130
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
_0221F118: .4byte 0x04000060
_0221F11C: .4byte 0xFFFFCFFD
_0221F120: .4byte 0x0000CFFB
_0221F124: .4byte 0x04000540
_0221F128: .4byte 0xBFFF0000
_0221F12C: .4byte 0x04000008
	thumb_func_end ov63_0221F088

	thumb_func_start ov63_0221F130
ov63_0221F130: @ 0x0221F130
	push {r4, lr}
	sub sp, #0x18
	adds r4, r0, #0
	movs r0, #0x3e
	bl FUN_02023114
	adds r1, r4, #0
	adds r1, #0xe0
	str r0, [r1]
	adds r1, r4, #0
	movs r0, #0
	adds r1, #0xe4
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xe8
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xec
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0xf0
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0xf2
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0xf4
	strh r0, [r1]
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r0, [r0]
	movs r1, #5
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r2, r4, #0
	ldr r3, _0221F1C0 @ =0x00000FA4
	adds r0, #0xe4
	lsls r1, r1, #0xc
	adds r2, #0xf0
	bl FUN_02023254
	movs r1, #0
	movs r0, #1
	lsls r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #0x14]
	adds r1, r4, #0
	adds r1, #0xe0
	ldr r1, [r1]
	add r0, sp, #0xc
	bl FUN_02023204
	adds r0, r4, #0
	adds r0, #0xe0
	ldr r0, [r0]
	bl FUN_0202313C
	adds r4, #0xe0
	movs r0, #1
	movs r1, #0x7d
	ldr r2, [r4]
	lsls r0, r0, #0xc
	lsls r1, r1, #0xe
	bl FUN_02023240
	add sp, #0x18
	pop {r4, pc}
	nop
_0221F1C0: .4byte 0x00000FA4
	thumb_func_end ov63_0221F130

	thumb_func_start ov63_0221F1C4
ov63_0221F1C4: @ 0x0221F1C4
	ldr r3, _0221F1CC @ =FUN_02023120
	adds r0, #0xe0
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0221F1CC: .4byte FUN_02023120
	thumb_func_end ov63_0221F1C4

	thumb_func_start ov63_0221F1D0
ov63_0221F1D0: @ 0x0221F1D0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _0221F230 @ =0x04000600
	ldr r1, [r0]
	movs r0, #2
	lsls r0, r0, #0x1a
	tst r0, r1
	bne _0221F22A
	blx FUN_020CF670
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r0, [r0]
	bl ov63_0221F580
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #4
	str r2, [sp, #4]
	blx FUN_020C2528
	movs r1, #0
	movs r0, #0x11
	adds r2, r1, #0
	blx FUN_020C2528
	adds r4, #0xfc
	ldr r0, [r4]
	bl ov63_0221FAA0
	movs r2, #1
	movs r0, #0x12
	add r1, sp, #0
	str r2, [sp]
	blx FUN_020C2528
	ldr r0, _0221F234 @ =0x04000540
	movs r1, #1
	str r1, [r0]
_0221F22A:
	add sp, #8
	pop {r4, pc}
	nop
_0221F230: .4byte 0x04000600
_0221F234: .4byte 0x04000540
	thumb_func_end ov63_0221F1D0

	thumb_func_start ov63_0221F238
ov63_0221F238: @ 0x0221F238
	push {r3, r4, r5, lr}
	ldr r1, _0221F278 @ =0x00000844
	adds r5, r0, #0
	movs r0, #0x3e
	bl FUN_0201AA8C
	adds r4, r0, #0
	ldr r0, _0221F27C @ =0x022203C0
	movs r1, #1
	str r1, [r0]
	ldr r0, _0221F280 @ =0x022203E0
	movs r1, #2
	str r1, [r0]
	ldr r0, _0221F284 @ =0x0000083C
	movs r1, #0
	str r1, [r4, r0]
	ldr r0, _0221F288 @ =ov63_0221F2E8
	adds r1, r4, #0
	movs r2, #3
	bl FUN_0200E33C
	ldr r1, _0221F28C @ =0x00000838
	movs r2, #1
	str r0, [r4, r1]
	adds r1, #8
	str r5, [r4, r1]
	ldr r0, _0221F290 @ =ov63_0221F294
	adds r1, r4, #0
	bl FUN_0200E33C
	pop {r3, r4, r5, pc}
	nop
_0221F278: .4byte 0x00000844
_0221F27C: .4byte 0x022203C0
_0221F280: .4byte 0x022203E0
_0221F284: .4byte 0x0000083C
_0221F288: .4byte ov63_0221F2E8
_0221F28C: .4byte 0x00000838
_0221F290: .4byte ov63_0221F294
	thumb_func_end ov63_0221F238

	thumb_func_start ov63_0221F294
ov63_0221F294: @ 0x0221F294
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _0221F2D8 @ =0x022203C0
	ldr r1, [r1]
	cmp r1, #0
	beq _0221F2C8
	adds r1, r4, #0
	movs r2, #2
	adds r0, r4, #0
	adds r1, #0x14
	lsls r2, r2, #0xa
	blx FUN_020D0D60
	ldr r1, _0221F2DC @ =0x00007FFF
	ldr r2, _0221F2E0 @ =0x00004210
	adds r0, r4, #0
	movs r3, #0
	blx FUN_020CF394
	movs r2, #0
	ldr r1, _0221F2E0 @ =0x00004210
	adds r0, r4, #0
	adds r3, r2, #0
	blx FUN_020CF3D8
	pop {r4, pc}
_0221F2C8:
	ldr r1, _0221F2E4 @ =0x022203E0
	ldr r2, [r1]
	subs r2, r2, #1
	str r2, [r1]
	bl FUN_0200E390
	pop {r4, pc}
	nop
_0221F2D8: .4byte 0x022203C0
_0221F2DC: .4byte 0x00007FFF
_0221F2E0: .4byte 0x00004210
_0221F2E4: .4byte 0x022203E0
	thumb_func_end ov63_0221F294

	thumb_func_start ov63_0221F2E8
ov63_0221F2E8: @ 0x0221F2E8
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _0221F318 @ =0x022203C0
	ldr r1, [r1]
	cmp r1, #0
	beq _0221F30A
	adds r0, r4, #0
	blx FUN_020D0D80
	ldr r1, _0221F31C @ =0x00000814
	str r0, [r4, r1]
	adds r0, r4, #0
	ldr r1, [r4, r1]
	adds r0, #0x14
	blx DC_FlushRange
	pop {r4, pc}
_0221F30A:
	ldr r1, _0221F320 @ =0x022203E0
	ldr r2, [r1]
	subs r2, r2, #1
	str r2, [r1]
	bl FUN_0200E390
	pop {r4, pc}
	.align 2, 0
_0221F318: .4byte 0x022203C0
_0221F31C: .4byte 0x00000814
_0221F320: .4byte 0x022203E0
	thumb_func_end ov63_0221F2E8

	thumb_func_start ov63_0221F324
ov63_0221F324: @ 0x0221F324
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r2, #0
	bl FUN_0201F988
	ldr r1, _0221F360 @ =0x0000083C
	adds r4, r0, #0
	ldr r3, [r4, r1]
	cmp r3, #8
	bge _0221F35C
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov63_0221F368
	ldr r2, _0221F360 @ =0x0000083C
	ldr r1, [r4, r2]
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r1, r2, #0
	subs r1, #0x24
	str r0, [r3, r1]
	ldr r0, _0221F364 @ =0x022203E0
	ldr r1, [r0]
	adds r1, r1, #1
	str r1, [r0]
	ldr r0, [r4, r2]
	adds r0, r0, #1
	str r0, [r4, r2]
_0221F35C:
	pop {r4, r5, r6, pc}
	nop
_0221F360: .4byte 0x0000083C
_0221F364: .4byte 0x022203E0
	thumb_func_end ov63_0221F324

	thumb_func_start ov63_0221F368
ov63_0221F368: @ 0x0221F368
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	ldr r1, _0221F3DC @ =0x00000838
	movs r0, #0x3e
	adds r7, r2, #0
	adds r4, r3, #0
	bl FUN_0201AA8C
	adds r1, r0, #0
	str r6, [r1]
	ldr r0, _0221F3E0 @ =0x00000818
	ldr r2, _0221F3E4 @ =0x0221FCF8
	lsls r3, r4, #2
	ldr r3, [r2, r3]
	adds r2, r0, #0
	strh r5, [r1, r0]
	subs r2, #8
	str r3, [r1, r2]
	adds r2, r0, #0
	movs r3, #0
	subs r2, #0x14
	str r3, [r1, r2]
	adds r2, r0, #0
	subs r2, #0x10
	str r7, [r1, r2]
	ldr r2, _0221F3E8 @ =_0221FAE4
	lsls r6, r4, #1
	ldrsh r2, [r2, r6]
	lsls r6, r2, #1
	adds r2, r0, #0
	subs r2, #0xc
	str r6, [r1, r2]
	subs r2, r0, #4
	str r4, [r1, r2]
	adds r4, r5, #0
	subs r4, #0x50
	adds r2, r0, #2
	strh r4, [r1, r2]
	ldr r2, _0221F3EC @ =0xFFFFF000
	adds r4, r0, #4
	strh r2, [r1, r4]
	adds r4, r0, #6
	strh r3, [r1, r4]
	adds r4, r0, #0
	adds r5, #0x50
	adds r4, #8
	strh r5, [r1, r4]
	adds r4, r0, #0
	adds r4, #0xa
	strh r2, [r1, r4]
	adds r0, #0xc
	strh r3, [r1, r0]
	ldr r0, _0221F3F0 @ =ov63_0221F3F4
	movs r2, #2
	bl FUN_0200E33C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221F3DC: .4byte 0x00000838
_0221F3E0: .4byte 0x00000818
_0221F3E4: .4byte 0x0221FCF8
_0221F3E8: .4byte _0221FAE4
_0221F3EC: .4byte 0xFFFFF000
_0221F3F0: .4byte ov63_0221F3F4
	thumb_func_end ov63_0221F368

	thumb_func_start ov63_0221F3F4
ov63_0221F3F4: @ 0x0221F3F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	ldr r1, _0221F564 @ =0x022203C0
	ldr r1, [r1]
	cmp r1, #0
	bne _0221F404
	b _0221F552
_0221F404:
	ldr r0, _0221F568 @ =0x00000808
	adds r1, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [r5, r1]
	adds r1, r2, r1
	str r1, [r5, r0]
	adds r1, r0, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r0]
	cmp r1, #0
	ble _0221F432
	movs r1, #0xaa
	lsls r1, r1, #0xc
	cmp r2, r1
	blt _0221F448
	adds r1, r0, #4
	ldr r2, [r5, r1]
	movs r1, #0
	mvns r1, r1
	muls r1, r2, r1
	adds r0, r0, #4
	str r1, [r5, r0]
	b _0221F448
_0221F432:
	movs r1, #0xa
	lsls r1, r1, #0xc
	cmp r2, r1
	bgt _0221F448
	adds r1, r0, #4
	ldr r2, [r5, r1]
	movs r1, #0
	mvns r1, r1
	muls r1, r2, r1
	adds r0, r0, #4
	str r1, [r5, r0]
_0221F448:
	ldr r0, _0221F568 @ =0x00000808
	ldr r0, [r5, r0]
	asrs r6, r0, #0xc
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	bl FUN_0201FC30
	movs r2, #0xa
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xa
	movs r3, #0
	blx FUN_020F2948
	ldr r3, _0221F56C @ =0x00000818
	movs r4, #0
	ldrsh r2, [r5, r3]
	subs r3, #0x18
	adds r3, r0, r3
	adcs r1, r4
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	orrs r1, r0
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	adds r4, r2, r1
	bl FUN_0201FBB8
	movs r2, #0xa
	asrs r1, r0, #0x1f
	lsls r2, r2, #0xa
	movs r3, #0
	blx FUN_020F2948
	movs r2, #2
	movs r3, #0
	lsls r2, r2, #0xa
	adds r6, r0, r2
	adcs r1, r3
	lsls r0, r1, #0x14
	lsrs r1, r6, #0xc
	orrs r1, r0
	lsls r0, r2, #1
	movs r7, #9
	subs r6, r1, r0
	lsls r7, r7, #6
	adds r0, r2, #0
	subs r1, r4, r7
	adds r0, #0x26
	strh r1, [r5, r0]
	lsls r0, r6, #0x10
	adds r1, r2, #0
	asrs r0, r0, #0x10
	adds r1, #0x28
	strh r0, [r5, r1]
	adds r1, r2, #0
	adds r1, #0x2a
	strh r3, [r5, r1]
	adds r1, r2, #0
	adds r4, r4, r7
	adds r1, #0x2c
	strh r4, [r5, r1]
	adds r1, r2, #0
	adds r1, #0x2e
	strh r0, [r5, r1]
	adds r0, r2, #0
	adds r0, #0x30
	adds r2, #0x14
	strh r3, [r5, r0]
	ldr r0, [r5, r2]
	adds r1, r3, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r2, r3, #0
	ldr r0, [r5]
	movs r3, #2
	blx FUN_020CF348
	ldr r0, [r5]
	movs r1, #1
	blx FUN_020CF4A8
	movs r1, #0x81
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	ldr r0, [r5]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	blx FUN_020CF278
	ldr r3, _0221F570 @ =0x0000081A
	ldr r0, [r5]
	adds r2, r3, #2
	ldrsh r1, [r5, r3]
	adds r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	blx FUN_020CF2F4
	movs r3, #0x82
	lsls r3, r3, #4
	adds r2, r3, #2
	ldrsh r1, [r5, r3]
	adds r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r0, [r5]
	blx FUN_020CF2F4
	ldr r3, _0221F574 @ =0x0000082C
	ldr r0, [r5]
	adds r2, r3, #2
	ldrsh r1, [r5, r3]
	adds r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	blx FUN_020CF2F4
	ldr r3, _0221F578 @ =0x00000826
	ldr r0, [r5]
	adds r2, r3, #2
	ldrsh r1, [r5, r3]
	adds r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	blx FUN_020CF2F4
	ldr r0, [r5]
	blx FUN_020CF4D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221F552:
	ldr r1, _0221F57C @ =0x022203E0
	ldr r2, [r1]
	subs r2, r2, #1
	str r2, [r1]
	bl FUN_0200E390
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221F564: .4byte 0x022203C0
_0221F568: .4byte 0x00000808
_0221F56C: .4byte 0x00000818
_0221F570: .4byte 0x0000081A
_0221F574: .4byte 0x0000082C
_0221F578: .4byte 0x00000826
_0221F57C: .4byte 0x022203E0
	thumb_func_end ov63_0221F3F4

	thumb_func_start ov63_0221F580
ov63_0221F580: @ 0x0221F580
	push {r3, lr}
	cmp r0, #0
	beq _0221F5A6
	bl FUN_0201F988
	adds r3, r0, #0
	ldr r0, _0221F5A8 @ =0x04000444
	movs r1, #0
	str r1, [r0]
	ldr r2, _0221F5AC @ =0x00000814
	adds r1, r3, #0
	ldr r2, [r3, r2]
	movs r0, #3
	adds r1, #0x14
	blx FUN_01FF8580
	ldr r0, _0221F5B0 @ =0x04000448
	movs r1, #1
	str r1, [r0]
_0221F5A6:
	pop {r3, pc}
	.align 2, 0
_0221F5A8: .4byte 0x04000444
_0221F5AC: .4byte 0x00000814
_0221F5B0: .4byte 0x04000448
	thumb_func_end ov63_0221F580

	thumb_func_start ov63_0221F5B4
ov63_0221F5B4: @ 0x0221F5B4
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0221F5F4 @ =0x022203C0
	movs r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _0221F5F0
	bl FUN_0201F988
	adds r6, r0, #0
	ldr r0, _0221F5F8 @ =0x0000083C
	movs r4, #0
	ldr r0, [r6, r0]
	cmp r0, #0
	ble _0221F5EA
	ldr r7, _0221F5F8 @ =0x0000083C
	adds r5, r6, #0
_0221F5D4:
	ldr r0, _0221F5FC @ =0x00000818
	ldr r0, [r5, r0]
	bl FUN_0201F988
	bl FUN_0201AB0C
	ldr r0, [r6, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r0
	blt _0221F5D4
_0221F5EA:
	adds r0, r6, #0
	bl FUN_0201AB0C
_0221F5F0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F5F4: .4byte 0x022203C0
_0221F5F8: .4byte 0x0000083C
_0221F5FC: .4byte 0x00000818
	thumb_func_end ov63_0221F5B4

	thumb_func_start ov63_0221F600
ov63_0221F600: @ 0x0221F600
	ldr r0, _0221F610 @ =0x022203E0
	ldr r0, [r0]
	cmp r0, #0
	bne _0221F60C
	movs r0, #1
	bx lr
_0221F60C:
	movs r0, #0
	bx lr
	.align 2, 0
_0221F610: .4byte 0x022203E0
	thumb_func_end ov63_0221F600

	thumb_func_start ov63_0221F614
ov63_0221F614: @ 0x0221F614
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r1, _0221F7A8 @ =0x00008D64
	movs r0, #0x3e
	bl FUN_0201AA8C
	str r0, [sp, #0x28]
	bl FUN_0201FD44
	str r0, [sp, #0x20]
	ldr r0, _0221F7AC @ =0x00003594
	bl FUN_0201FD38
	movs r0, #0
	ldr r4, [sp, #0x28]
	str r0, [sp, #0x24]
	str r0, [sp, #0x1c]
	adds r0, r4, #0
	str r0, [sp, #0x18]
	adds r0, #0x34
	str r0, [sp, #0x18]
	adds r0, r4, #0
	str r0, [sp, #0x14]
	adds r0, #0x28
	str r0, [sp, #0x14]
	adds r0, r4, #0
	str r0, [sp, #0x10]
	adds r0, #0x2e
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xc]
_0221F652:
	ldr r0, [sp, #0x1c]
	lsls r1, r0, #2
	ldr r0, _0221F7B0 @ =0x0221FD38
	ldr r0, [r0, r1]
	str r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blo _0221F66A
	movs r0, #0
	str r0, [sp, #0x1c]
_0221F66A:
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x13
	subs r1, r1, r2
	movs r0, #0x13
	rors r1, r0
	movs r0, #1
	adds r1, r2, r1
	lsls r0, r0, #0xc
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #8]
	bl FUN_0201FD44
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x13
	subs r1, r1, r2
	movs r0, #0x13
	rors r1, r0
	movs r0, #1
	adds r1, r2, r1
	lsls r0, r0, #0xc
	adds r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	bl FUN_0201FD44
	movs r1, #0x29
	lsls r1, r1, #4
	blx FUN_020F2998
	movs r0, #0x52
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r5, _0221F7B4 @ =0x0221FB44
	str r0, [sp]
	movs r7, #0
	adds r6, r4, #0
_0221F6C0:
	movs r0, #0
	ldrsh r1, [r5, r0]
	ldr r0, [sp, #8]
	adds r0, r0, r1
	strh r0, [r6, #0x10]
	movs r0, #2
	ldrsh r1, [r5, r0]
	ldr r0, [sp, #4]
	adds r0, r0, r1
	strh r0, [r6, #0x12]
	movs r0, #4
	ldrsh r1, [r5, r0]
	ldr r0, [sp]
	adds r0, r0, r1
	strh r0, [r6, #0x14]
	movs r0, #0
	strh r0, [r4, #0x28]
	strh r0, [r4, #0x2a]
	strh r0, [r4, #0x2c]
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x17
	subs r2, r2, r1
	movs r0, #0x17
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #8
	adds r0, r1, r0
	strh r0, [r4, #0x2e]
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x17
	subs r2, r2, r1
	movs r0, #0x17
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #8
	adds r0, r1, r0
	strh r0, [r4, #0x30]
	bl FUN_0201FD44
	lsrs r1, r0, #0x1f
	lsls r2, r0, #0x17
	subs r2, r2, r1
	movs r0, #0x17
	rors r2, r0
	movs r0, #2
	adds r1, r1, r2
	lsls r0, r0, #8
	adds r0, r1, r0
	strh r0, [r4, #0x32]
	ldr r0, [sp, #0x18]
	blx FUN_020CC044
	adds r7, r7, #1
	adds r5, r5, #6
	adds r6, r6, #6
	cmp r7, #4
	blt _0221F6C0
	bl FUN_0201FD44
	movs r1, #7
	ands r0, r1
	subs r5, r0, #1
	cmp r0, #0
	beq _0221F75E
_0221F74C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	blx FUN_020CCDE0
	adds r0, r5, #0
	subs r5, r5, #1
	cmp r0, #0
	bne _0221F74C
_0221F75E:
	ldr r0, [sp, #0x18]
	adds r4, #0x70
	adds r0, #0x70
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, #0x70
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #0x70
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r0, #0x70
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #0x30
	bge _0221F784
	b _0221F652
_0221F784:
	ldr r0, [sp, #0x20]
	bl FUN_0201FD38
	ldr r0, [sp, #0x28]
	movs r2, #0
	str r2, [r0]
	ldr r1, _0221F7B8 @ =0x00008D20
	str r2, [r0, #4]
	str r2, [r0, r1]
	ldr r0, _0221F7BC @ =0x04000440
	movs r1, #2
	str r1, [r0]
	ldr r0, _0221F7C0 @ =ov63_0221F7EC
	ldr r1, [sp, #0x28]
	bl FUN_0200E320
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0221F7A8: .4byte 0x00008D64
_0221F7AC: .4byte 0x00003594
_0221F7B0: .4byte 0x0221FD38
_0221F7B4: .4byte 0x0221FB44
_0221F7B8: .4byte 0x00008D20
_0221F7BC: .4byte 0x04000440
_0221F7C0: .4byte ov63_0221F7EC
	thumb_func_end ov63_0221F614

	thumb_func_start ov63_0221F7C4
ov63_0221F7C4: @ 0x0221F7C4
	push {r4, lr}
	adds r4, r0, #0
	beq _0221F7D8
	bl FUN_0201F988
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0200E390
_0221F7D8:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov63_0221F7C4

	thumb_func_start ov63_0221F7DC
ov63_0221F7DC: @ 0x0221F7DC
	push {r3, lr}
	cmp r0, #0
	beq _0221F7EA
	bl FUN_0201F988
	movs r1, #1
	str r1, [r0]
_0221F7EA:
	pop {r3, pc}
	thumb_func_end ov63_0221F7DC

	thumb_func_start ov63_0221F7EC
ov63_0221F7EC: @ 0x0221F7EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	adds r7, r1, #0
	ldr r0, [r7]
	cmp r0, #0
	bne _0221F7FA
	b _0221FA70
_0221F7FA:
	ldr r1, _0221FA74 @ =0x00001508
	movs r2, #0x1e
	adds r0, r7, r1
	adds r1, #0x14
	adds r1, r7, r1
	lsls r2, r2, #0xa
	blx FUN_020D0D60
	movs r0, #0x3f
	str r0, [sp]
	movs r0, #0x1f
	str r0, [sp, #4]
	ldr r0, _0221FA74 @ =0x00001508
	movs r1, #3
	movs r2, #0
	adds r0, r7, r0
	adds r3, r1, #0
	str r2, [sp, #8]
	blx FUN_020CF348
	ldr r0, _0221FA74 @ =0x00001508
	movs r2, #0
	ldr r1, _0221FA78 @ =0x00005294
	adds r0, r7, r0
	adds r3, r2, #0
	blx FUN_020CF394
	movs r0, #0
	str r0, [sp, #0x1c]
	adds r0, r7, #0
	str r0, [sp, #0x18]
	adds r0, #0x28
	str r0, [sp, #0x18]
	adds r0, r7, #0
	str r0, [sp, #0x14]
	adds r0, #0x2e
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	adds r5, r7, #0
	str r5, [sp, #0xc]
	adds r5, #0x34
	adds r4, r7, #0
	str r0, [sp, #0x10]
	str r5, [sp, #0xc]
_0221F852:
	movs r0, #0x24
	ldrsh r0, [r4, r0]
	subs r0, #0x55
	strh r0, [r4, #0x24]
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	ldr r0, _0221FA7C @ =0xFFFFF000
	cmp r1, r0
	bgt _0221F86C
	movs r0, #2
	lsls r0, r0, #0xc
	adds r0, r1, r0
	strh r0, [r4, #0x24]
_0221F86C:
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	ldr r0, _0221FA80 @ =0x0000019A
	ldr r2, [sp, #0x18]
	subs r0, r1, r0
	strh r0, [r4, #0x12]
	movs r0, #0x12
	ldrsh r0, [r4, r0]
	ldr r1, [sp, #0x14]
	strh r0, [r4, #0x18]
	movs r0, #0x24
	ldrsh r0, [r4, r0]
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0x10]
	blx FUN_020CCDE0
	ldr r0, [sp, #0xc]
	blx FUN_020CC044
	movs r0, #0x14
	ldrsh r0, [r4, r0]
	movs r2, #0x10
	movs r3, #0x12
	str r0, [sp]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [sp, #0xc]
	adds r0, r5, #0
	blx FUN_020CC0A4
	ldr r0, _0221FA74 @ =0x00001508
	ldr r2, _0221FA84 @ =0x00002D6B
	adds r0, r7, r0
	movs r1, #0
	blx FUN_020CF478
	ldr r2, [r4, #8]
	ldr r0, _0221FA74 @ =0x00001508
	lsls r2, r2, #0x10
	adds r0, r7, r0
	movs r1, #1
	lsrs r2, r2, #0x10
	blx FUN_020CF478
	movs r1, #0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, _0221FA88 @ =0x00000FFF
	strh r1, [r0, #2]
	ldr r1, _0221FA8C @ =0xFFFFF001
	strh r1, [r0, #4]
	add r0, sp, #0x20
	adds r1, r0, #0
	blx FUN_020CD0F8
	add r3, sp, #0x20
	add r1, sp, #0x20
	movs r0, #4
	ldrsh r0, [r1, r0]
	movs r1, #0
	adds r2, r1, #0
	str r0, [sp]
	ldr r0, _0221FA74 @ =0x00001508
	ldrsh r2, [r3, r2]
	adds r6, r3, #0
	movs r3, #2
	ldrsh r3, [r6, r3]
	adds r0, r7, r0
	blx FUN_020CF41C
	movs r1, #0
	adds r0, r6, #0
	strh r1, [r0]
	ldr r1, _0221FA8C @ =0xFFFFF001
	strh r1, [r0, #2]
	lsrs r1, r1, #0x14
	strh r1, [r0, #4]
	add r0, sp, #0x20
	adds r1, r0, #0
	blx FUN_020CD0F8
	adds r1, r6, #0
	movs r0, #4
	ldrsh r0, [r1, r0]
	adds r3, r6, #0
	movs r2, #0
	str r0, [sp]
	ldrsh r2, [r3, r2]
	movs r3, #2
	ldr r0, _0221FA74 @ =0x00001508
	ldrsh r3, [r6, r3]
	adds r0, r7, r0
	movs r1, #1
	blx FUN_020CF41C
	ldrh r0, [r4, #0x28]
	ldr r3, _0221FA90 @ =0x021094DC
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0221FA90 @ =0x021094DC
	adds r2, r0, r1
	ldrsh r1, [r3, r1]
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x28
	bl FUN_020CC17C
	ldr r2, [sp, #0xc]
	add r0, sp, #0x28
	adds r1, r5, #0
	blx FUN_020CC1E8
	ldrh r0, [r4, #0x2a]
	ldr r3, _0221FA90 @ =0x021094DC
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0221FA90 @ =0x021094DC
	adds r2, r0, r1
	ldrsh r1, [r3, r1]
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x28
	bl FUN_020CC1A0
	ldr r2, [sp, #0xc]
	add r0, sp, #0x28
	adds r1, r5, #0
	blx FUN_020CC1E8
	ldrh r0, [r4, #0x2c]
	ldr r3, _0221FA90 @ =0x021094DC
	asrs r0, r0, #4
	lsls r1, r0, #2
	ldr r0, _0221FA90 @ =0x021094DC
	adds r2, r0, r1
	ldrsh r1, [r3, r1]
	movs r3, #2
	ldrsh r2, [r2, r3]
	add r0, sp, #0x28
	bl FUN_020CC1C4
	ldr r2, [sp, #0xc]
	add r0, sp, #0x28
	adds r1, r5, #0
	blx FUN_020CC1E8
	ldr r2, [r4, #8]
	ldr r0, _0221FA74 @ =0x00001508
	lsls r2, r2, #0x10
	ldr r1, _0221FA94 @ =0x00007FFF
	adds r0, r7, r0
	lsrs r2, r2, #0x10
	movs r3, #0
	blx FUN_020CF3D8
	ldr r0, _0221FA74 @ =0x00001508
	adds r0, r7, r0
	blx FUN_020CF208
	ldr r0, _0221FA74 @ =0x00001508
	adds r1, r5, #0
	adds r0, r7, r0
	blx FUN_020CF254
	ldr r0, _0221FA74 @ =0x00001508
	movs r1, #1
	adds r0, r7, r0
	blx FUN_020CF4A8
	ldr r0, _0221FA74 @ =0x00001508
	movs r1, #0
	ldr r3, _0221FA8C @ =0xFFFFF001
	adds r0, r7, r0
	adds r2, r1, #0
	blx FUN_020CF2A4
	movs r1, #0x9b
	ldr r0, _0221FA74 @ =0x00001508
	mvns r1, r1
	adds r2, r1, #0
	adds r0, r7, r0
	subs r2, #0x31
	movs r3, #0
	blx FUN_020CF2F4
	ldr r0, _0221FA74 @ =0x00001508
	movs r2, #0xcc
	adds r0, r7, r0
	movs r1, #0x9c
	mvns r2, r2
	movs r3, #0
	blx FUN_020CF2F4
	ldr r0, _0221FA74 @ =0x00001508
	movs r1, #0x9c
	adds r0, r7, r0
	movs r2, #0xcd
	movs r3, #0
	blx FUN_020CF2F4
	ldr r0, _0221FA74 @ =0x00001508
	movs r1, #0x9b
	adds r0, r7, r0
	mvns r1, r1
	movs r2, #0xcd
	movs r3, #0
	blx FUN_020CF2F4
	ldr r0, _0221FA74 @ =0x00001508
	adds r0, r7, r0
	blx FUN_020CF4D4
	ldr r0, _0221FA74 @ =0x00001508
	movs r1, #1
	adds r0, r7, r0
	blx FUN_020CF228
	ldr r0, [sp, #0x18]
	adds r4, #0x70
	adds r0, #0x70
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r5, #0x70
	adds r0, #0x70
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #0x70
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	adds r0, #0x70
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	adds r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #0x30
	bge _0221FA46
	b _0221F852
_0221FA46:
	ldr r0, _0221FA74 @ =0x00001508
	adds r0, r7, r0
	blx FUN_020D0D80
	ldr r1, _0221FA98 @ =0x00008D1C
	str r0, [r7, r1]
	ldr r0, _0221FA9C @ =0x0000151C
	ldr r1, [r7, r1]
	adds r0, r7, r0
	blx DC_FlushRange
	ldr r0, _0221FA98 @ =0x00008D1C
	ldr r1, [r7, r0]
	movs r0, #0x1e
	lsls r0, r0, #0xa
	cmp r1, r0
	blo _0221FA6C
	bl GF_AssertFail
_0221FA6C:
	movs r0, #1
	str r0, [r7, #4]
_0221FA70:
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221FA74: .4byte 0x00001508
_0221FA78: .4byte 0x00005294
_0221FA7C: .4byte 0xFFFFF000
_0221FA80: .4byte 0x0000019A
_0221FA84: .4byte 0x00002D6B
_0221FA88: .4byte 0x00000FFF
_0221FA8C: .4byte 0xFFFFF001
_0221FA90: .4byte 0x021094DC
_0221FA94: .4byte 0x00007FFF
_0221FA98: .4byte 0x00008D1C
_0221FA9C: .4byte 0x0000151C
	thumb_func_end ov63_0221F7EC

	thumb_func_start ov63_0221FAA0
ov63_0221FAA0: @ 0x0221FAA0
	push {r4, lr}
	cmp r0, #0
	beq _0221FAD0
	bl FUN_0201F988
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0221FAD0
	ldr r0, _0221FAD4 @ =0x04000444
	movs r1, #0
	str r1, [r0]
	ldr r2, _0221FAD8 @ =0x00008D1C
	ldr r1, _0221FADC @ =0x0000151C
	ldr r2, [r4, r2]
	movs r0, #3
	adds r1, r4, r1
	blx FUN_01FF8580
	ldr r0, _0221FAE0 @ =0x04000448
	movs r1, #1
	str r1, [r0]
	movs r0, #0
	str r0, [r4, #4]
_0221FAD0:
	pop {r4, pc}
	nop
_0221FAD4: .4byte 0x04000444
_0221FAD8: .4byte 0x00008D1C
_0221FADC: .4byte 0x0000151C
_0221FAE0: .4byte 0x04000448
	thumb_func_end ov63_0221FAA0

	.rodata

_0221FAE4:
	.byte 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0A
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x20, 0x02, 0x0F, 0x01, 0x00, 0x01, 0x00, 0x16, 0x20, 0x02, 0x0F, 0x41, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x64, 0xFF, 0x33, 0xFF, 0x00, 0x00, 0x9C, 0x00, 0x33, 0xFF, 0x00, 0x00
	.byte 0x9C, 0x00, 0xCD, 0x00, 0x00, 0x00, 0x64, 0xFF, 0xCD, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x14, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x1C, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x18, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x10, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0xFF, 0x33, 0x00, 0x00, 0xFF, 0x43, 0x00, 0x00
	.byte 0x9F, 0x23, 0x00, 0x00, 0xFF, 0x33, 0x00, 0x00, 0xFF, 0x43, 0x00, 0x00, 0x9F, 0x23, 0x00, 0x00
	.byte 0xFF, 0x33, 0x00, 0x00, 0xFF, 0x33, 0x00, 0x00, 0xF9, 0xC1, 0x21, 0x02, 0x15, 0xC2, 0x21, 0x02
	.byte 0x29, 0xC2, 0x21, 0x02, 0x65, 0xC2, 0x21, 0x02, 0x69, 0xC3, 0x21, 0x02, 0x85, 0xC3, 0x21, 0x02
	.byte 0xCD, 0xC3, 0x21, 0x02, 0xA1, 0xC5, 0x21, 0x02, 0x90, 0x57, 0x00, 0x00, 0x1F, 0x76, 0x00, 0x00
	.byte 0x08, 0x7D, 0x00, 0x00, 0xE6, 0x7F, 0x00, 0x00, 0xFF, 0x03, 0x00, 0x00, 0xE9, 0x03, 0x00, 0x00
	.byte 0x5F, 0x02, 0x00, 0x00, 0x16, 0x7C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x20, 0x02, 0x0F, 0x01, 0x00, 0x00, 0x12, 0x03, 0x0E, 0x02, 0x0F, 0x41, 0x00
	.byte 0x00, 0x12, 0x06, 0x0E, 0x04, 0x0F, 0x5D, 0x00, 0x00, 0x12, 0x0C, 0x0E, 0x09, 0x0F, 0x95, 0x00
	.byte 0x00, 0x00, 0x03, 0x0E, 0x02, 0x0F, 0x41, 0x00, 0x00, 0x00, 0x06, 0x0E, 0x04, 0x0F, 0x5D, 0x00
	.byte 0x00, 0x00, 0x0C, 0x0E, 0x09, 0x0F, 0x95, 0x00, 0xA8, 0x00, 0xD8, 0xFF, 0x60, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xA4, 0xFF, 0x58, 0x00, 0xA0, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x5C, 0x01, 0x58, 0x00, 0x38, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x58, 0x00, 0xD8, 0xFF, 0xC8, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x50, 0x01, 0x00, 0x00, 0x28, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xB0, 0xFF, 0x00, 0x00, 0xD8, 0x00, 0x50, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x5D, 0x00, 0x6E, 0x00, 0x63, 0x00, 0x6E, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x9D, 0x00, 0x6E, 0x00, 0xA3, 0x00, 0x6E, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x35, 0x00, 0x60, 0x00, 0x3B, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xC5, 0x00, 0x60, 0x00, 0xCB, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x25, 0x00, 0x48, 0x00, 0x2B, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0xD5, 0x00, 0x48, 0x00, 0xDB, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x7D, 0x00, 0x78, 0x00, 0x83, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x80, 0x3F, 0x60, 0x00, 0x78, 0x00, 0x6C, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0xA0, 0x00, 0x78, 0x00, 0x94, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0x38, 0x00, 0x68, 0x00, 0x54, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F, 0xC8, 0x00, 0x68, 0x00, 0xAA, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F, 0x28, 0x00, 0x50, 0x00, 0x40, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x33, 0x33, 0x33, 0x3F, 0xD8, 0x00, 0x50, 0x00, 0xBE, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x33, 0x33, 0x33, 0x3F, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x33, 0x33, 0x33, 0x3F, 0x60, 0x00, 0x5A, 0x00, 0x6C, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0xA0, 0x00, 0x5A, 0x00, 0x94, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x66, 0x66, 0x66, 0x3F, 0x38, 0x00, 0x50, 0x00, 0x54, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0xC8, 0x00, 0x50, 0x00, 0xAA, 0x00, 0x5A, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0x28, 0x00, 0x3C, 0x00, 0x40, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F, 0xD8, 0x00, 0x3C, 0x00, 0xBE, 0x00, 0x4B, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0x00, 0x00, 0x40, 0x3F, 0x80, 0x00, 0x64, 0x00, 0x80, 0x00, 0x78, 0x00
	.byte 0x00, 0x00, 0x80, 0x3F, 0xCD, 0xCC, 0x4C, 0x3F, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00
	.byte 0xD9, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00
	.byte 0xD9, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDE, 0xD8, 0x00, 0x00
	.byte 0xDE, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xDE, 0xD8, 0x00, 0x00, 0xDF, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA8, 0x00, 0xD8, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xA4, 0xFF, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00, 0xD9, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5C, 0x01, 0x58, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00
	.byte 0xDA, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x00, 0xD8, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xDB, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDC, 0xD8, 0x00, 0x00, 0xDC, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDD, 0xD8, 0x00, 0x00, 0xDD, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9D, 0x00, 0x6E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD9, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x35, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDA, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC5, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x25, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDC, 0xD8, 0x00, 0x00
	.byte 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD5, 0x00, 0x48, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xDD, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDF, 0xD8, 0x00, 0x00, 0xE0, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDF, 0xD8, 0x00, 0x00, 0xE1, 0xD8, 0x00, 0x00
	.byte 0xD8, 0xD8, 0x00, 0x00, 0xD8, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE0, 0xD8, 0x00, 0x00
	.byte 0xE2, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xDB, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_022203C0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_022203E0:
	.space 0x20
