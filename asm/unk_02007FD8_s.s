	.include "asm/macros.inc"
	.include "unk_02007FD8.inc"
	.include "global.inc"

	.rodata

	.public _020F5988
_020F5988:
	.byte 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00
_020F59C8:
	.byte 0x1E, 0x21, 0x1F, 0x21, 0x20, 0x21, 0x1D, 0x22
	.byte 0x1E, 0x22, 0x1F, 0x22, 0x20, 0x22, 0x21, 0x22, 0x1C, 0x23, 0x1D, 0x23, 0x1E, 0x23, 0x1F, 0x23
	.byte 0x20, 0x23, 0x21, 0x23, 0x22, 0x23, 0x1C, 0x24, 0x1D, 0x24, 0x1E, 0x24, 0x1F, 0x24, 0x20, 0x24
	.byte 0x21, 0x24, 0x22, 0x24, 0x1C, 0x25, 0x1D, 0x25, 0x1E, 0x25, 0x1F, 0x25, 0x20, 0x25, 0x21, 0x25
	.byte 0x22, 0x25, 0x1C, 0x26, 0x1D, 0x26, 0x1E, 0x26, 0x1F, 0x26, 0x20, 0x26, 0x21, 0x26, 0x22, 0x26
	.byte 0x1C, 0x27, 0x1D, 0x27, 0x1E, 0x27, 0x1F, 0x27, 0x20, 0x27, 0x21, 0x27, 0x22, 0x27, 0x1D, 0x28
	.byte 0x1E, 0x28, 0x1F, 0x28, 0x20, 0x28, 0x21, 0x28, 0x1E, 0x29, 0x1F, 0x29, 0x20, 0x29, 0xFF, 0xFF
_020F5A30:
	.byte 0x33, 0x11, 0x34, 0x11, 0x35, 0x11, 0x36, 0x11, 0x32, 0x12, 0x33, 0x12, 0x34, 0x12, 0x35, 0x12
	.byte 0x36, 0x12, 0x37, 0x12, 0x31, 0x13, 0x32, 0x13, 0x33, 0x13, 0x34, 0x13, 0x35, 0x13, 0x36, 0x13
	.byte 0x37, 0x13, 0x38, 0x13, 0x31, 0x14, 0x32, 0x14, 0x33, 0x14, 0x34, 0x14, 0x35, 0x14, 0x36, 0x14
	.byte 0x37, 0x14, 0x38, 0x14, 0x31, 0x15, 0x32, 0x15, 0x33, 0x15, 0x34, 0x15, 0x35, 0x15, 0x36, 0x15
	.byte 0x37, 0x15, 0x38, 0x15, 0x31, 0x16, 0x32, 0x16, 0x33, 0x16, 0x34, 0x16, 0x35, 0x16, 0x36, 0x16
	.byte 0x37, 0x16, 0x38, 0x16, 0x32, 0x17, 0x33, 0x17, 0x34, 0x17, 0x35, 0x17, 0x36, 0x17, 0x37, 0x17
	.byte 0x33, 0x18, 0x34, 0x18, 0x35, 0x18, 0x36, 0x18, 0xFF, 0xFF
_020F5A9A:
	.byte 0x1B, 0x0F, 0x1C, 0x0F, 0x1D, 0x0F
	.byte 0x1E, 0x0F, 0x1A, 0x10, 0x1B, 0x10, 0x1C, 0x10, 0x1D, 0x10, 0x1E, 0x10, 0x1F, 0x10, 0x19, 0x11
	.byte 0x1A, 0x11, 0x1B, 0x11, 0x1C, 0x11, 0x1D, 0x11, 0x1E, 0x11, 0x1F, 0x11, 0x20, 0x11, 0x19, 0x12
	.byte 0x1A, 0x12, 0x1B, 0x12, 0x1C, 0x12, 0x1D, 0x12, 0x1E, 0x12, 0x1F, 0x12, 0x20, 0x12, 0x19, 0x13
	.byte 0x1A, 0x13, 0x1B, 0x13, 0x1C, 0x13, 0x1D, 0x13, 0x1E, 0x13, 0x1F, 0x13, 0x20, 0x13, 0x19, 0x14
	.byte 0x1A, 0x14, 0x1B, 0x14, 0x1C, 0x14, 0x1D, 0x14, 0x1E, 0x14, 0x1F, 0x14, 0x20, 0x14, 0x1A, 0x15
	.byte 0x1B, 0x15, 0x1C, 0x15, 0x1D, 0x15, 0x1E, 0x15, 0x1F, 0x15, 0x1B, 0x16, 0x1C, 0x16, 0x1D, 0x16
	.byte 0x1E, 0x16, 0xFF, 0xFF

	.public _020F5B04
_020F5B04:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xF0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00
_020F5B84:
	.byte 0x2B, 0x21, 0x2C, 0x21, 0x2D, 0x21, 0x29, 0x22, 0x2A, 0x22, 0x2B, 0x22
	.byte 0x2C, 0x22, 0x2D, 0x22, 0x2E, 0x22, 0x2F, 0x22, 0x28, 0x23, 0x29, 0x23, 0x2A, 0x23, 0x2B, 0x23
	.byte 0x2C, 0x23, 0x2D, 0x23, 0x2E, 0x23, 0x2F, 0x23, 0x30, 0x23, 0x28, 0x24, 0x29, 0x24, 0x2A, 0x24
	.byte 0x2B, 0x24, 0x2C, 0x24, 0x2D, 0x24, 0x2E, 0x24, 0x2F, 0x24, 0x30, 0x24, 0x28, 0x25, 0x29, 0x25
	.byte 0x2A, 0x25, 0x2B, 0x25, 0x2C, 0x25, 0x2D, 0x25, 0x2E, 0x25, 0x2F, 0x25, 0x30, 0x25, 0x28, 0x26
	.byte 0x29, 0x26, 0x2A, 0x26, 0x2B, 0x26, 0x2C, 0x26, 0x2D, 0x26, 0x2E, 0x26, 0x2F, 0x26, 0x30, 0x26
	.byte 0x28, 0x27, 0x29, 0x27, 0x2A, 0x27, 0x2B, 0x27, 0x2C, 0x27, 0x2D, 0x27, 0x2E, 0x27, 0x2F, 0x27
	.byte 0x30, 0x27, 0x28, 0x28, 0x29, 0x28, 0x2A, 0x28, 0x2B, 0x28, 0x2C, 0x28, 0x2D, 0x28, 0x2E, 0x28
	.byte 0x2F, 0x28, 0x30, 0x28, 0x29, 0x29, 0x2A, 0x29, 0x2B, 0x29, 0x2C, 0x29, 0x2D, 0x29, 0x2E, 0x29
	.byte 0x2F, 0x29, 0x2B, 0x2A, 0x2C, 0x2A, 0x2D, 0x2A, 0xFF, 0xFF, 0x00, 0x00

	.data
_0210F63C:
	.word _020F5A9A
	.word _020F5A30
	.word _020F59C8
	.word _020F5B84

	.text

	thumb_func_start sub_02009264
sub_02009264: ; 0x02009264
	mov r2, #1
	strb r2, [r0]
	mov r3, #0
	strb r3, [r0, #2]
	ldrsb r2, [r1, r3]
	strb r2, [r0, #1]
	ldrb r2, [r1, #1]
	strb r2, [r0, #3]
	str r1, [r0, #0x10]
	add r2, r3, #0
_02009278:
	add r1, r0, r3
	add r3, r3, #1
	strb r2, [r1, #4]
	cmp r3, #0xa
	blt _02009278
	bx lr
	thumb_func_end sub_02009264

	thumb_func_start sub_02009284
sub_02009284: ; 0x02009284
	push {r4, r5, r6, r7}
	ldrb r1, [r0]
	cmp r1, #0
	beq _0200931A
	add r3, r0, #2
	ldr r4, [r0, #0x10]
	cmp r1, #0
	beq _02009314
	ldrb r1, [r0, #3]
	cmp r1, #0
	bne _02009310
	ldrb r1, [r3]
	add r1, r1, #1
	strb r1, [r3]
	ldrb r2, [r3]
	mov r1, #0
	mvn r1, r1
	lsl r5, r2, #2
	ldrsb r6, [r4, r5]
	cmp r6, r1
	bge _020092EC
	mov r1, #0
_020092B0:
	add r5, r0, r2
	ldrb r2, [r5, #4]
	add r2, r2, #1
	strb r2, [r5, #4]
	ldrb r2, [r3]
	add r5, r0, r2
	lsl r2, r2, #2
	add r2, r4, r2
	ldrb r7, [r2, #1]
	ldrb r6, [r5, #4]
	cmp r7, r6
	beq _020092CC
	cmp r7, #0
	bne _020092D2
_020092CC:
	strb r1, [r5, #4]
	add r3, r3, #1
	b _020092DE
_020092D2:
	mov r5, #0
	ldrsb r5, [r2, r5]
	mov r2, #1
	mvn r2, r2
	sub r2, r2, r5
	strb r2, [r3]
_020092DE:
	ldrb r2, [r3]
	mov r6, #0
	mvn r6, r6
	lsl r5, r2, #2
	ldrsb r7, [r4, r5]
	cmp r7, r6
	blt _020092B0
_020092EC:
	ldrsb r5, [r4, r5]
	mov r1, #0
	mvn r1, r1
	cmp r5, r1
	beq _020092FA
	cmp r2, #0xa
	blo _02009302
_020092FA:
	mov r1, #0
	strb r1, [r0, #1]
	strb r1, [r0]
	b _02009314
_02009302:
	strb r5, [r0, #1]
	ldrb r1, [r3]
	lsl r1, r1, #2
	add r1, r4, r1
	ldrb r1, [r1, #1]
	strb r1, [r0, #3]
	b _02009314
_02009310:
	sub r1, r1, #1
	strb r1, [r0, #3]
_02009314:
	ldrb r0, [r0, #1]
	pop {r4, r5, r6, r7}
	bx lr
_0200931A:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02009284

	thumb_func_start sub_02009324
sub_02009324: ; 0x02009324
	ldr r2, [r0]
	mov r1, #0x80
	orr r2, r1
	add r1, #0x80
	orr r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02009324

	thumb_func_start sub_02009334
sub_02009334: ; 0x02009334
	push {r3, r4}
	add r2, r0, #0
	add r3, r2, #0
	add r4, r2, #4
	add r3, #0x14
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	add r0, #0x6c
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x78
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x6e
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x7a
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x70
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x7c
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x72
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x74
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x80
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x76
	ldrh r0, [r0]
	add r2, #0x82
	strh r0, [r2]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02009334

	thumb_func_start sub_02009390
sub_02009390: ; 0x02009390
	push {r3, r4}
	add r2, r0, #0
	add r4, r2, #0
	add r4, #0x14
	add r3, r2, #4
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	add r0, #0x78
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x6c
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x7a
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x6e
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x7c
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x70
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x7e
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x72
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x80
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x74
	strh r1, [r0]
	add r0, r2, #0
	add r0, #0x82
	ldrh r1, [r0]
	add r0, r2, #0
	add r0, #0x76
	strh r1, [r0]
	ldr r1, [r2]
	mov r0, #0x80
	orr r1, r0
	add r0, #0x80
	orr r0, r1
	str r0, [r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02009390

	thumb_func_start sub_020093FC
sub_020093FC: ; 0x020093FC
	mov r3, #0xbb
	lsl r3, r3, #2
	str r1, [r0, r3]
	add r1, r3, #4
	str r2, [r0, r1]
	bx lr
	thumb_func_end sub_020093FC

	thumb_func_start sub_02009408
sub_02009408: ; 0x02009408
	mov r3, #0xbd
	lsl r3, r3, #2
	str r1, [r0, r3]
	add r1, r3, #4
	str r2, [r0, r1]
	bx lr
	thumb_func_end sub_02009408

	thumb_func_start sub_02009414
sub_02009414: ; 0x02009414
	add r0, r0, #4
	bx lr
	thumb_func_end sub_02009414

	thumb_func_start sub_02009418
sub_02009418: ; 0x02009418
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020094A8 ; =0x00000331
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _02009466
	mov r1, #0
	strb r1, [r4, r0]
	sub r0, #0x81
	add r0, r4, r0
	bl NNS_G2dInitImageProxy
	mov r3, #0xc2
	lsl r3, r3, #2
	mov r1, #0x20
	strh r1, [r4, r3]
	add r0, r3, #2
	strh r1, [r4, r0]
	add r0, r3, #0
	sub r0, #0x18
	ldr r1, [r4, r0]
	add r0, r3, #0
	add r0, #0x10
	str r1, [r4, r0]
	add r0, r3, #0
	sub r0, #0xc
	ldr r1, [r4, r0]
	add r0, r3, #0
	add r0, #0x14
	str r1, [r4, r0]
	add r1, r3, #0
	sub r1, #0x1c
	add r0, r4, r3
	sub r3, #0x58
	ldr r1, [r4, r1]
	mov r2, #0
	add r3, r4, r3
	bl NNS_G2dLoadImage2DMapping
_02009466:
	ldr r0, _020094AC ; =0x00000332
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _020094A6
	mov r1, #0
	strb r1, [r4, r0]
	sub r0, #0x5e
	add r0, r4, r0
	bl NNS_G2dInitImagePaletteProxy
	mov r3, #0xbe
	lsl r3, r3, #2
	add r0, r3, #0
	ldr r1, [r4, r3]
	add r0, #0x30
	str r1, [r4, r0]
	add r0, r3, #0
	add r0, #8
	ldr r1, [r4, r0]
	add r0, r3, #0
	add r0, #0x34
	str r1, [r4, r0]
	add r0, r3, #0
	sub r1, r3, #4
	add r0, #0x28
	sub r3, #0x24
	ldr r1, [r4, r1]
	add r0, r4, r0
	mov r2, #0
	add r3, r4, r3
	bl NNS_G2dLoadPalette
_020094A6:
	pop {r4, pc}
	.balign 4, 0
_020094A8: .word 0x00000331
_020094AC: .word 0x00000332
	thumb_func_end sub_02009418

	thumb_func_start sub_020094B0
sub_020094B0: ; 0x020094B0
	ldr r2, _020094B8 ; =0x00000333
	strb r1, [r0, r2]
	bx lr
	nop
_020094B8: .word 0x00000333
	thumb_func_end sub_020094B0

	thumb_func_start sub_020094BC
sub_020094BC: ; 0x020094BC
	push {r4, lr}
	add r4, r0, #0
	bne _020094C6
	bl GF_AssertFail
_020094C6:
	ldr r0, [r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _020094D2
	mov r0, #1
	pop {r4, pc}
_020094D2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020094BC

	thumb_func_start sub_020094D8
sub_020094D8: ; 0x020094D8
	mov r2, #0xcd
	lsl r2, r2, #2
	ldr r3, [r0, r2]
	orr r1, r3
	str r1, [r0, r2]
	bx lr
	thumb_func_end sub_020094D8

	thumb_func_start sub_020094E4
sub_020094E4: ; 0x020094E4
	push {r3, r4}
	mov r3, #0xcd
	lsl r3, r3, #2
	mov r2, #0
	mvn r2, r2
	ldr r4, [r0, r3]
	eor r1, r2
	and r1, r4
	str r1, [r0, r3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020094E4

	thumb_func_start sub_020094FC
sub_020094FC: ; 0x020094FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #0x48]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x48]
	str r6, [sp, #0x44]
	str r0, [sp, #0x38]
_0200950E:
	ldr r0, [sp, #0x44]
	ldr r1, [r0]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	beq _0200951E
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1f
	bne _02009520
_0200951E:
	b _0200991A
_02009520:
	mov r0, #0x80
	bic r1, r0
	ldr r0, [sp, #0x44]
	mov r2, #0xba
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x44]
	lsl r2, r2, #2
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #6]
	ldr r2, [r6, r2]
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0x58
	str r0, [sp, #0x4c]
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, [sp, #0x58]
	mov r1, #0xc3
	ldr r0, [r0, #4]
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, [sp, #0x58]
	ldr r2, [r0, #8]
	add r0, r1, #4
	str r2, [r6, r0]
	ldr r0, [sp, #0x58]
	add r1, #8
	ldr r0, [r0, #0xc]
	str r0, [r6, r1]
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x44]
	ldr r0, [r0, #0x14]
	ldrh r1, [r1, #4]
	str r0, [sp, #0x50]
	bl sub_02009D28
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x50]
	bl sub_02009B48
	ldr r0, [sp, #0x54]
	cmp r0, #3
	beq _0200957E
	b _020097AC
_0200957E:
	mov r5, #0
	add r0, r5, #0
	str r5, [sp, #0x14]
	str r0, [sp, #0x24]
_02009586:
	ldr r0, [sp, #0x14]
	mov r1, #0x4f
	sub r2, r1, r0
	mov r0, #0x50
	add r1, r2, #0
	mul r1, r0
	ldr r0, [sp, #0x50]
	mov r4, #0
	add r0, r0, r1
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x50]
	ldr r0, [sp, #0x24]
	add r7, r1, r0
	ldr r0, [sp, #0x20]
	str r7, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	sub r0, r0, #1
	lsl r0, r0, #7
	str r0, [sp, #0x10]
_020095AE:
	cmp r4, #0x28
	bge _0200969A
	ldr r0, [sp, #0x44]
	ldr r1, [r0, #0x54]
	lsl r0, r1, #0x16
	lsr r0, r0, #0x1f
	beq _020095DE
	lsl r1, r1, #0x15
	lsr r1, r1, #0x1f
	beq _020095DE
	mov r0, #0x27
	sub r1, r0, r4
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	add r1, r4, r1
	add r1, #0x50
	strb r0, [r1]
	b _02009786
_020095DE:
	cmp r0, #0
	beq _020095FE
	mov r0, #0x27
	sub r1, r0, r4
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	add r1, r4, r1
	add r1, #0x50
	strb r0, [r1]
	b _02009786
_020095FE:
	ldr r0, [sp, #0x44]
	ldr r0, [r0, #0x54]
	lsl r1, r0, #0x15
	lsr r1, r1, #0x1f
	beq _0200961C
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r0, [sp, #0x20]
	ldr r1, [r6, r1]
	ldrb r0, [r0]
	add r1, r5, r1
	add r1, r4, r1
	add r1, #0x50
	strb r0, [r1]
	b _02009786
_0200961C:
	lsl r0, r0, #0xf
	lsr r0, r0, #0x1c
	str r0, [sp, #0xc]
	beq _02009688
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x14]
	lsl r1, r1, #1
	bl _u32_div_f
	cmp r1, #0
	beq _0200964C
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	add r0, r4, r0
	add r0, #0x50
	add r1, r5, r1
	add r1, r4, r1
	ldrb r0, [r0]
	add r1, #0x50
	strb r0, [r1]
	b _02009786
_0200964C:
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl _u32_div_f
	cmp r1, #0
	beq _0200966E
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r2, r5, r0
	add r0, r2, r4
	add r0, #0x4f
	ldrb r1, [r0]
	add r0, r2, r4
	add r0, #0x50
	strb r1, [r0]
	b _02009786
_0200966E:
	ldrb r1, [r7]
	mov r0, #0xf
	and r1, r0
	lsl r0, r1, #4
	orr r0, r1
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	add r1, r4, r1
	add r1, #0x50
	strb r0, [r1]
	b _02009786
_02009688:
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	ldrb r0, [r7]
	add r1, r5, r1
	add r1, r4, r1
	add r1, #0x50
	strb r0, [r1]
	b _02009786
_0200969A:
	ldr r0, [sp, #0x44]
	ldr r1, [r0, #0x54]
	lsl r0, r1, #0x16
	lsr r0, r0, #0x1f
	beq _020096CA
	lsl r1, r1, #0x15
	lsr r1, r1, #0x1f
	beq _020096CA
	add r1, r4, #0
	sub r1, #0x28
	mov r0, #0x4f
	sub r1, r0, r1
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	add r2, r4, r1
	ldr r1, _02009940 ; =0x00002828
	strb r0, [r2, r1]
	b _02009786
_020096CA:
	cmp r0, #0
	beq _020096EE
	add r1, r4, #0
	sub r1, #0x28
	mov r0, #0x4f
	sub r1, r0, r1
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	add r2, r4, r1
	ldr r1, _02009940 ; =0x00002828
	strb r0, [r2, r1]
	b _02009786
_020096EE:
	ldr r0, [sp, #0x44]
	ldr r0, [r0, #0x54]
	lsl r1, r0, #0x15
	lsr r1, r1, #0x1f
	beq _0200970C
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r0, [sp, #0x20]
	ldr r1, [r6, r1]
	ldrb r0, [r0]
	add r1, r5, r1
	add r2, r4, r1
	ldr r1, _02009940 ; =0x00002828
	strb r0, [r2, r1]
	b _02009786
_0200970C:
	lsl r0, r0, #0xf
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	beq _02009776
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x14]
	lsl r1, r1, #1
	bl _u32_div_f
	cmp r1, #0
	beq _0200973C
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	add r2, r4, r0
	ldr r0, _02009940 ; =0x00002828
	add r1, r5, r1
	ldrb r0, [r2, r0]
	add r2, r4, r1
	ldr r1, _02009940 ; =0x00002828
	strb r0, [r2, r1]
	b _02009786
_0200973C:
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl _u32_div_f
	cmp r1, #0
	beq _0200975C
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, _02009944 ; =0x00002827
	add r0, r5, r0
	add r0, r0, r4
	ldrb r2, [r0, r1]
	add r1, r1, #1
	strb r2, [r0, r1]
	b _02009786
_0200975C:
	ldrb r1, [r7]
	mov r0, #0xf
	and r1, r0
	lsl r0, r1, #4
	orr r0, r1
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	add r2, r4, r1
	ldr r1, _02009940 ; =0x00002828
	strb r0, [r2, r1]
	b _02009786
_02009776:
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	ldrb r0, [r7]
	add r1, r5, r1
	add r2, r4, r1
	ldr r1, _02009940 ; =0x00002828
	strb r0, [r2, r1]
_02009786:
	ldr r0, [sp, #0x20]
	add r4, r4, #1
	add r0, r0, #1
	add r7, r7, #1
	str r0, [sp, #0x20]
	cmp r4, #0x50
	bge _02009796
	b _020095AE
_02009796:
	ldr r0, [sp, #0x24]
	add r5, #0x80
	add r0, #0x50
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0x50
	bge _020097AA
	b _02009586
_020097AA:
	b _02009914
_020097AC:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #0x40]
	str r0, [sp, #0x3c]
_020097B4:
	ldr r0, [sp]
	mov r1, #0x4f
	sub r2, r1, r0
	mov r0, #0x50
	add r1, r2, #0
	mul r1, r0
	ldr r0, [sp, #0x50]
	mov r4, #0
	add r0, r0, r1
	str r0, [sp, #0x34]
	ldr r1, [sp, #0x50]
	ldr r0, [sp, #0x3c]
	add r7, r1, r0
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x38]
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x40]
	str r7, [sp, #0x2c]
	add r5, r1, r0
	ldr r0, [sp]
	sub r0, r0, #1
	lsl r1, r0, #7
	ldr r0, [sp, #0x38]
	add r0, r0, r1
	str r0, [sp, #0x28]
_020097E6:
	ldr r0, [sp, #0x44]
	ldr r1, [r0, #0x54]
	lsl r0, r1, #0x16
	lsr r0, r0, #0x1f
	beq _0200982E
	lsl r1, r1, #0x15
	lsr r1, r1, #0x1f
	beq _0200982E
	cmp r4, #0x28
	bge _02009812
	mov r0, #0x27
	sub r1, r0, r4
	ldr r0, [sp, #0x30]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	strb r0, [r4, r1]
	b _020098EC
_02009812:
	add r1, r4, #0
	sub r1, #0x28
	mov r0, #0x4f
	sub r1, r0, r1
	ldr r0, [sp, #0x30]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	strb r0, [r4, r1]
	b _020098EC
_0200982E:
	cmp r0, #0
	beq _0200986A
	cmp r4, #0x28
	bge _0200984E
	mov r0, #0x27
	sub r1, r0, r4
	ldr r0, [sp, #0x2c]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	strb r0, [r4, r1]
	b _020098EC
_0200984E:
	add r1, r4, #0
	sub r1, #0x28
	mov r0, #0x4f
	sub r1, r0, r1
	ldr r0, [sp, #0x2c]
	ldrb r0, [r0, r1]
	bl sub_02009B34
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	strb r0, [r4, r1]
	b _020098EC
_0200986A:
	ldr r0, [sp, #0x44]
	ldr r0, [r0, #0x54]
	lsl r1, r0, #0x15
	lsr r1, r1, #0x1f
	beq _02009884
	ldr r0, [sp, #0x34]
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	ldrb r0, [r0]
	add r1, r5, r1
	strb r0, [r4, r1]
	b _020098EC
_02009884:
	lsl r0, r0, #0xf
	lsr r0, r0, #0x1c
	str r0, [sp, #4]
	beq _020098E0
	ldr r1, [sp, #4]
	ldr r0, [sp]
	lsl r1, r1, #1
	bl _u32_div_f
	cmp r1, #0
	beq _020098AC
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x28]
	add r1, r1, r0
	ldrb r1, [r4, r1]
	add r0, r5, r0
	strb r1, [r4, r0]
	b _020098EC
_020098AC:
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl _u32_div_f
	cmp r1, #0
	beq _020098CA
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r1, r5, r0
	add r0, r1, r4
	sub r0, r0, #1
	ldrb r0, [r0]
	strb r0, [r1, r4]
	b _020098EC
_020098CA:
	ldrb r1, [r7]
	mov r0, #0xf
	and r1, r0
	lsl r0, r1, #4
	orr r0, r1
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	add r1, r5, r1
	strb r0, [r4, r1]
	b _020098EC
_020098E0:
	mov r1, #0xbf
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	ldrb r0, [r7]
	add r1, r5, r1
	strb r0, [r4, r1]
_020098EC:
	ldr r0, [sp, #0x34]
	add r4, r4, #1
	add r0, r0, #1
	add r7, r7, #1
	str r0, [sp, #0x34]
	cmp r4, #0x50
	bge _020098FC
	b _020097E6
_020098FC:
	ldr r0, [sp, #0x40]
	add r0, #0x80
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	add r0, #0x50
	str r0, [sp, #0x3c]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #0x50
	bge _02009914
	b _020097B4
_02009914:
	ldr r0, [sp, #0x4c]
	bl FreeToHeap
_0200991A:
	ldr r0, [sp, #0x44]
	mov r1, #0xa
	add r0, #0xac
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x38]
	lsl r1, r1, #0xa
	add r0, r0, r1
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x54]
	add r0, r0, #1
	str r0, [sp, #0x54]
	cmp r0, #4
	bge _02009936
	b _0200950E
_02009936:
	ldr r1, _02009948 ; =0x00000331
	ldr r0, [sp, #0x48]
	strb r0, [r6, r1]
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02009940: .word 0x00002828
_02009944: .word 0x00002827
_02009948: .word 0x00000331
	thumb_func_end sub_020094FC

	thumb_func_start sub_0200994C
sub_0200994C: ; 0x0200994C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r4, r5, #0
	str r0, [sp, #8]
_0200995E:
	ldr r1, [r4]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	beq _02009A3A
	lsl r0, r1, #0x17
	lsr r0, r0, #0x1f
	beq _02009A3A
	ldr r0, _02009B28 ; =0xFFFFFEFF
	mov r2, #0xba
	and r0, r1
	str r0, [r4]
	mov r0, #1
	str r0, [sp, #0xc]
	lsl r2, r2, #2
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #8]
	ldr r2, [r5, r2]
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0x18
	str r0, [sp, #0x10]
	bl NNS_G2dGetUnpackedPaletteData
	ldr r0, [sp, #0x18]
	mov r7, #0
	ldr r1, [r0]
	mov r0, #0x32
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [sp, #0x18]
	add r2, r7, #0
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #8]
	lsl r3, r0, #1
_020099A2:
	mov r6, #3
	lsl r6, r6, #8
	ldr r6, [r5, r6]
	ldrh r0, [r1]
	add r6, r3, r6
	add r7, r7, #1
	strh r0, [r2, r6]
	mov r6, #0xc1
	lsl r6, r6, #2
	ldrh r0, [r1]
	ldr r6, [r5, r6]
	add r1, r1, #2
	add r6, r3, r6
	strh r0, [r2, r6]
	add r2, r2, #2
	cmp r7, #0x10
	blt _020099A2
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	beq _02009A3A
	mov r2, #0xba
	mov r0, #0x72
	lsl r2, r2, #2
	add r1, r0, #0
	ldr r2, [r5, r2]
	add r1, #0x92
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0x18
	str r0, [sp, #4]
	bl NNS_G2dGetUnpackedPaletteData
	ldr r0, [sp, #0x18]
	mov r7, #0xc1
	ldr r0, [r0, #0xc]
	mov r1, #0
	lsl r7, r7, #2
_020099F8:
	add r6, r4, #0
	add r6, #0x6c
	ldrh r6, [r6]
	mov r2, #3
	lsl r2, r2, #8
	lsl r6, r6, #0x1e
	lsr r6, r6, #0x1e
	add r6, r6, #3
	lsl r6, r6, #4
	add r6, r1, r6
	ldrh r3, [r0]
	ldr r2, [r5, r2]
	lsl r6, r6, #1
	strh r3, [r2, r6]
	add r6, r4, #0
	add r6, #0x6c
	ldrh r6, [r6]
	ldrh r3, [r0]
	ldr r2, [r5, r7]
	lsl r6, r6, #0x1e
	lsr r6, r6, #0x1e
	add r6, r6, #3
	lsl r6, r6, #4
	add r6, r1, r6
	lsl r6, r6, #1
	add r1, r1, #1
	add r0, r0, #2
	strh r3, [r2, r6]
	cmp r1, #0x10
	blt _020099F8
	ldr r0, [sp, #4]
	bl FreeToHeap
_02009A3A:
	ldr r0, [r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02009B08
	ldr r0, [r4, #0x54]
	lsl r0, r0, #0x13
	lsr r0, r0, #0x1f
	beq _02009B08
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _02009AFA
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x4b
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x4a
	strb r1, [r0]
	ldr r0, [sp, #8]
	mov r2, #0xc1
	lsl r1, r0, #1
	ldr r0, [r4, #0x4c]
	add r3, r4, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	sub r2, r2, #4
	add r3, #0x48
	ldr r2, [r5, r2]
	add r0, r0, r1
	add r1, r2, r1
	ldrb r3, [r3]
	mov r2, #0x10
	bl BlendPalette
	add r0, r4, #0
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	beq _02009ABC
	add r0, r0, #3
	lsl r1, r0, #5
	ldr r0, [r4, #0x4c]
	mov r2, #0xc1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r3, r4, #0
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	sub r2, r2, #4
	add r3, #0x48
	ldr r2, [r5, r2]
	add r0, r0, r1
	add r1, r2, r1
	ldrb r3, [r3]
	mov r2, #0x10
	bl BlendPalette
_02009ABC:
	add r0, r4, #0
	add r0, #0x49
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x48
	ldrb r0, [r0]
	cmp r0, r1
	bne _02009AD6
	ldr r1, [r4, #0x54]
	ldr r0, _02009B2C ; =0xFFFFEFFF
	and r0, r1
	str r0, [r4, #0x54]
	b _02009B08
_02009AD6:
	cmp r0, r1
	bls _02009AEA
	add r0, r4, #0
	add r0, #0x48
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x48
	strb r1, [r0]
	b _02009B08
_02009AEA:
	add r0, r4, #0
	add r0, #0x48
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x48
	strb r1, [r0]
	b _02009B08
_02009AFA:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x4a
	strb r1, [r0]
_02009B08:
	ldr r0, [sp, #8]
	add r4, #0xac
	add r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	bge _02009B1C
	b _0200995E
_02009B1C:
	ldr r1, _02009B30 ; =0x00000332
	ldr r0, [sp, #0xc]
	strb r0, [r5, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02009B28: .word 0xFFFFFEFF
_02009B2C: .word 0xFFFFEFFF
_02009B30: .word 0x00000332
	thumb_func_end sub_0200994C

	thumb_func_start sub_02009B34
sub_02009B34: ; 0x02009B34
	mov r1, #0xf0
	and r1, r0
	lsl r1, r1, #0x14
	lsl r0, r0, #0x1c
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_02009B34

	thumb_func_start sub_02009B48
sub_02009B48: ; 0x02009B48
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #0xa]
	cmp r0, #0
	beq _02009B5C
	add r0, r1, #0
	ldr r1, [r2, #0x10]
	mov r2, #1
	bl sub_02009B60
_02009B5C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02009B48

	thumb_func_start sub_02009B60
sub_02009B60: ; 0x02009B60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r3, r0, #0
	add r0, r1, #0
	mov lr, r0
	mov r0, #0
	mov ip, r0
	ldr r0, _02009CAC ; =_0210F63C
	str r1, [sp]
	str r2, [sp, #4]
	str r0, [sp, #0x10]
_02009B76:
	ldr r0, [sp, #0x10]
	mov r1, #0
	ldr r6, [r0]
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _02009BEE
	ldr r0, [sp]
	mov r2, #0xf
	and r0, r2
	str r0, [sp, #0xc]
	sub r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp]
	mov r2, #0xf0
	and r0, r2
	lsr r7, r0, #4
	sub r7, #8
_02009B98:
	lsl r0, r1, #1
	add r2, r6, r0
	ldrb r4, [r6, r0]
	ldrb r2, [r2, #1]
	ldr r0, [sp, #0xc]
	add r0, r0, r4
	add r2, r7, r2
	lsl r0, r0, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #0x18
	lsr r4, r2, #0x18
	mov r2, #0x50
	mul r2, r4
	lsr r5, r0, #1
	add r2, r5, r2
	mov r4, #1
	tst r0, r4
	ldrb r4, [r3, r2]
	beq _02009BD0
	mov r0, #0xf0
	and r0, r4
	cmp r0, #0x10
	blt _02009BE0
	cmp r0, #0x30
	bgt _02009BE0
	add r4, #0x50
	strb r4, [r3, r2]
	b _02009BE0
_02009BD0:
	mov r0, #0xf
	and r0, r4
	cmp r0, #1
	blt _02009BE0
	cmp r0, #3
	bgt _02009BE0
	add r0, r4, #5
	strb r0, [r3, r2]
_02009BE0:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	lsl r0, r1, #1
	ldrb r0, [r6, r0]
	cmp r0, #0xff
	bne _02009B98
_02009BEE:
	ldr r0, [sp]
	lsr r0, r0, #8
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x10]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #4
	blt _02009B76
	mov r0, lr
	str r0, [sp]
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02009CA6
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _02009CAC ; =_0210F63C
	str r0, [sp, #0x18]
_02009C16:
	ldr r0, [sp, #0x18]
	mov r4, #0
	ldr r2, [r0]
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _02009C90
	ldr r0, [sp]
	mov r1, #0xf
	and r0, r1
	str r0, [sp, #0x14]
	add r0, #0x48
	str r0, [sp, #0x14]
	ldr r0, [sp]
	mov r1, #0xf0
	and r0, r1
	lsr r7, r0, #4
	sub r7, #8
_02009C38:
	lsl r0, r4, #1
	add r5, r2, r0
	ldrb r1, [r2, r0]
	ldrb r5, [r5, #1]
	ldr r0, [sp, #0x14]
	sub r1, #0xe
	add r0, r0, r1
	add r5, r7, r5
	lsl r0, r0, #0x18
	lsl r5, r5, #0x18
	lsr r1, r0, #0x18
	lsr r6, r5, #0x18
	mov r5, #0x50
	lsr r0, r1, #1
	mul r5, r6
	add r0, r0, r5
	mov r5, #1
	tst r1, r5
	ldrb r5, [r3, r0]
	beq _02009C72
	mov r1, #0xf0
	and r1, r5
	cmp r1, #0x10
	blt _02009C82
	cmp r1, #0x30
	bgt _02009C82
	add r5, #0x50
	strb r5, [r3, r0]
	b _02009C82
_02009C72:
	mov r1, #0xf
	and r1, r5
	cmp r1, #1
	blt _02009C82
	cmp r1, #3
	bgt _02009C82
	add r1, r5, #5
	strb r1, [r3, r0]
_02009C82:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	lsl r0, r4, #1
	ldrb r0, [r2, r0]
	cmp r0, #0xff
	bne _02009C38
_02009C90:
	ldr r0, [sp]
	lsr r0, r0, #8
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	blt _02009C16
_02009CA6:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02009CAC: .word _0210F63C
	thumb_func_end sub_02009B60

	thumb_func_start sub_02009CB0
sub_02009CB0: ; 0x02009CB0
	ldr r2, [r0]
	ldr r1, _02009CC8 ; =0x41C64E6D
	add r3, r2, #0
	mul r3, r1
	ldr r1, _02009CCC ; =0x00006073
	add r1, r3, r1
	str r1, [r0]
	lsr r0, r1, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_02009CC8: .word 0x41C64E6D
_02009CCC: .word 0x00006073
	thumb_func_end sub_02009CB0

	thumb_func_start sub_02009CD0
sub_02009CD0: ; 0x02009CD0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	mov r6, #0x32
	mov r4, #0
	str r0, [sp]
	add r7, sp, #0
	lsl r6, r6, #6
_02009CE0:
	ldrh r1, [r5]
	ldr r0, [sp]
	eor r0, r1
	strh r0, [r5]
	add r0, r7, #0
	bl sub_02009CB0
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, r6
	blt _02009CE0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02009CD0

	thumb_func_start sub_02009CF8
sub_02009CF8: ; 0x02009CF8
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02009D24 ; =0x000018FE
	mov r6, #0
	ldrh r2, [r0, r1]
	lsr r4, r1, #1
	add r5, r0, r1
	str r2, [sp]
	add r7, sp, #0
	mvn r6, r6
_02009D0A:
	ldrh r1, [r5]
	ldr r0, [sp]
	eor r0, r1
	strh r0, [r5]
	add r0, r7, #0
	bl sub_02009CB0
	sub r4, r4, #1
	sub r5, r5, #2
	cmp r4, r6
	bgt _02009D0A
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02009D24: .word 0x000018FE
	thumb_func_end sub_02009CF8

	thumb_func_start sub_02009D28
sub_02009D28: ; 0x02009D28
	push {r3, lr}
	cmp r1, #0xc2
	beq _02009D3A
	cmp r1, #0xc3
	beq _02009D3A
	cmp r1, #0x3a
	beq _02009D3A
	cmp r1, #6
	bne _02009D40
_02009D3A:
	bl sub_02009CF8
	pop {r3, pc}
_02009D40:
	bl sub_02009CD0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02009D28
