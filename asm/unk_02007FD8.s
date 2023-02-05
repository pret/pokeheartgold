	.include "asm/macros.inc"
	.include "unk_02007FD8.inc"
	.include "global.inc"

	.rodata

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

	thumb_func_start sub_02007FD4
sub_02007FD4: ; 0x02007FD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0xce
	lsl r1, r1, #2
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r2, #0xce
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuClearFast
	mov r0, #0xba
	lsl r0, r0, #2
	add r1, r0, #0
	add r3, r0, #0
	str r5, [r4, r0]
	mov r2, #0
	add r1, #0x48
	strb r2, [r4, r1]
	add r1, r0, #4
	str r2, [r4, r1]
	mov r1, #2
	lsl r1, r1, #0xe
	add r3, #8
	str r1, [r4, r3]
	add r3, r0, #0
	add r3, #0xc
	str r2, [r4, r3]
	mov r2, #0x80
	add r0, #0x10
	str r2, [r4, r0]
	add r0, r5, #0
	bl AllocFromHeap
	mov r1, #0xbf
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r5, #0
	mov r1, #0xc0
	bl AllocFromHeap
	mov r1, #3
	lsl r1, r1, #8
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	mov r0, #0
	mov r2, #4
	bl MIi_CpuClearFast
	add r0, r5, #0
	mov r1, #0xc0
	bl AllocFromHeap
	mov r1, #0xc1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	mov r0, #0
	mov r2, #4
	bl MIi_CpuClearFast
	mov r6, #0
	add r5, r4, #0
	add r7, r6, #0
_0200805A:
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #0xac
	bl MIi_CpuClearFast
	add r6, r6, #1
	add r5, #0xac
	cmp r6, #4
	blt _0200805A
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r2, _02008114 ; =0x00000333
	mov r0, #0
	strb r0, [r4, r2]
	mov r0, #0x72
	sub r2, #0x4b
	add r1, r0, #0
	ldr r2, [r4, r2]
	add r1, #0x91
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	str r0, [sp, #4]
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, [sp, #0xc]
	mov r1, #0xc3
	ldr r0, [r0, #4]
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0xc]
	ldr r2, [r0, #8]
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [sp, #0xc]
	add r1, #8
	ldr r0, [r0, #0xc]
	str r0, [r4, r1]
	ldr r0, [sp, #0xc]
	ldr r0, [r0, #0x14]
	str r0, [sp, #8]
	bl sub_02009CD0
	ldr r1, [sp, #8]
	mov r0, #0xbf
	lsl r0, r0, #2
	mov r2, #2
	ldrb r1, [r1]
	ldr r0, [r4, r0]
	lsl r2, r2, #0xe
	bl MI_CpuFill8
	mov r0, #0
	mov r7, #0xbf
	ldr r6, _02008118 ; =0x00005050
	mov ip, r0
	str r0, [sp]
	add r3, r0, #0
	lsl r7, r7, #2
_020080D0:
	ldr r2, [sp, #8]
	ldr r0, [sp]
	mov r1, #0
	add r2, r2, r0
_020080D8:
	ldr r5, [r4, r7]
	ldrb r0, [r2]
	add r5, r3, r5
	add r5, r1, r5
	add r1, r1, #1
	add r2, r2, #1
	strb r0, [r5, r6]
	cmp r1, #0x28
	blt _020080D8
	ldr r0, [sp]
	add r3, #0x80
	add r0, #0x50
	str r0, [sp]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #0x50
	blt _020080D0
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r0, _0200811C ; =0x00000331
	mov r1, #1
	strb r1, [r4, r0]
	add r0, r0, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02008114: .word 0x00000333
_02008118: .word 0x00005050
_0200811C: .word 0x00000331
	thumb_func_end sub_02007FD4

	thumb_func_start sub_02008120
sub_02008120: ; 0x02008120
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	bl sub_020094FC
	add r0, r5, #0
	bl sub_0200994C
	bl NNS_G3dGeFlushBuffer
	mov r6, #0xb3
	mov r0, #0
	ldr r4, _02008494 ; =0x04000444
	lsl r6, r6, #2
	str r0, [r4]
	str r0, [sp, #0x18]
	add r0, r6, #0
	sub r0, #0xc
	ldr r1, [r5, r0]
	add r3, r6, #0
	ldr r2, [r5, r6]
	add r0, r6, #0
	sub r3, #8
	add r6, #0x20
	ldr r3, [r5, r3]
	ldr r6, [r5, r6]
	sub r0, #0x10
	ldr r0, [r5, r0]
	lsr r6, r6, #3
	lsl r3, r3, #0x1a
	orr r6, r3
	mov r3, #1
	lsl r3, r3, #0x1e
	lsl r0, r0, #0x14
	orr r3, r6
	lsl r1, r1, #0x17
	orr r0, r3
	lsl r2, r2, #0x1d
	orr r0, r1
	orr r0, r2
	str r0, [r4, #0x64]
	ldr r0, [sp, #0x18]
	ldr r7, _02008498 ; =_020F5B04
	add r4, r5, #0
	str r0, [sp, #0x14]
_0200817A:
	ldr r0, [r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02008190
	ldr r0, [r4, #0x54]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _02008190
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1f
	beq _02008192
_02008190:
	b _020084FA
_02008192:
	ldr r2, [r4, #0x68]
	cmp r2, #0
	beq _020081A0
	add r1, r4, #0
	add r0, r4, #0
	add r1, #0x24
	blx r2
_020081A0:
	bl NNS_G3dGeFlushBuffer
	ldr r0, _0200849C ; =0x00000333
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _020081B2
	ldr r0, _020084A0 ; =0x04000454
	mov r1, #0
	str r1, [r0]
_020081B2:
	add r0, r4, #0
	bl sub_0200925C
	mov r0, #0xb1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _020081C6
	mov r0, #1
	b _020081C8
_020081C6:
	mov r0, #0
_020081C8:
	mov r1, #0xbd
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	ldr r1, [sp, #0x14]
	mov r3, #0x40
	add r2, r2, r1
	mov r1, #4
	sub r0, r1, r0
	add r1, r2, #0
	lsr r1, r0
	ldr r0, _020084A4 ; =0x040004AC
	str r1, [r0]
	ldr r0, [r4, #0x28]
	ldrsh r3, [r4, r3]
	lsl r2, r0, #0xc
	mov r0, #0x26
	ldrsh r1, [r4, r0]
	mov r0, #0x42
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	lsl r1, r0, #0xc
	mov r0, #0x24
	ldrsh r0, [r4, r0]
	add r0, r0, r3
	lsl r3, r0, #0xc
	ldr r0, _020084A8 ; =0x04000470
	str r3, [r0]
	str r1, [r0]
	str r2, [r0]
	ldrh r0, [r4, #0x38]
	asr r0, r0, #4
	lsl r2, r0, #2
	ldr r0, _020084AC ; =FX_SinCosTable_
	add r1, r0, r2
	ldrsh r0, [r0, r2]
	mov r2, #2
	ldrsh r1, [r1, r2]
	bl G3_RotX
	ldrh r0, [r4, #0x3a]
	asr r0, r0, #4
	lsl r2, r0, #2
	ldr r0, _020084AC ; =FX_SinCosTable_
	add r1, r0, r2
	ldrsh r0, [r0, r2]
	mov r2, #2
	ldrsh r1, [r1, r2]
	bl G3_RotY
	ldrh r0, [r4, #0x3c]
	asr r0, r0, #4
	lsl r2, r0, #2
	ldr r0, _020084AC ; =FX_SinCosTable_
	add r1, r0, r2
	ldrsh r0, [r0, r2]
	mov r2, #2
	ldrsh r1, [r1, r2]
	bl G3_RotZ
	ldr r0, [r4, #0x28]
	mov r3, #0x40
	lsl r0, r0, #0xc
	neg r2, r0
	mov r0, #0x26
	ldrsh r1, [r4, r0]
	mov r0, #0x42
	ldrsh r0, [r4, r0]
	ldrsh r3, [r4, r3]
	add r0, r1, r0
	lsl r0, r0, #0xc
	neg r1, r0
	mov r0, #0x24
	ldrsh r0, [r4, r0]
	add r0, r0, r3
	lsl r0, r0, #0xc
	neg r3, r0
	ldr r0, _020084A8 ; =0x04000470
	str r3, [r0]
	str r1, [r0]
	str r2, [r0]
	ldr r0, [r4, #0x50]
	lsl r1, r0, #0x11
	lsr r1, r1, #0x1b
	lsl r3, r0, #0x16
	lsl r2, r1, #0xa
	lsl r1, r0, #0x1b
	lsr r3, r3, #0x1b
	lsr r1, r1, #0x1b
	lsl r3, r3, #5
	orr r1, r3
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	lsl r1, r0, #2
	lsr r1, r1, #0x1b
	lsl r2, r1, #0xa
	lsl r1, r0, #0xc
	lsl r0, r0, #7
	lsr r0, r0, #0x1b
	lsr r1, r1, #0x1b
	lsl r0, r0, #5
	orr r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	add r1, r3, #0
	orr r1, r0
	mov r0, #2
	lsl r0, r0, #0xe
	orr r1, r0
	ldr r0, _020084B0 ; =0x040004C0
	str r1, [r0]
	ldr r1, _020084B4 ; =0x00004210
	add r0, r0, #4
	str r1, [r0]
	ldr r1, [r4]
	ldr r0, [r4, #0x54]
	lsl r1, r1, #0x19
	lsl r0, r0, #0x19
	lsr r1, r1, #0x1a
	lsr r0, r0, #0x1b
	lsl r2, r1, #0x18
	mov r1, #0xc0
	lsl r0, r0, #0x10
	orr r1, r2
	orr r1, r0
	ldr r0, _020084B8 ; =0x040004A4
	str r1, [r0]
	ldr r0, [r4, #0x54]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _0200834A
	add r0, r4, #0
	add r0, #0x5b
	ldrb r0, [r0]
	add r1, r4, #0
	add r1, #0x44
	lsl r3, r0, #4
	ldrb r2, [r1]
	ldr r1, [r7, r3]
	add r0, r7, r3
	add r6, r2, r1
	add r1, r4, #0
	add r1, #0x46
	ldrb r1, [r1]
	add r3, r4, #0
	add r3, #0x47
	str r1, [sp, #0x1c]
	add r1, r4, #0
	add r1, #0x45
	ldrb r3, [r3]
	ldrb r1, [r1]
	ldr r0, [r0, #4]
	mov ip, r3
	str r3, [sp]
	ldr r3, [sp, #0x1c]
	add r0, r1, r0
	str r6, [sp, #4]
	str r0, [sp, #8]
	add r3, r3, r6
	str r3, [sp, #0xc]
	mov r3, ip
	add r0, r3, r0
	str r0, [sp, #0x10]
	mov r3, #0x24
	ldrsh r3, [r4, r3]
	mov r0, #0x2c
	ldrsh r0, [r4, r0]
	sub r3, #0x28
	add r2, r3, r2
	add r0, r0, r2
	mov r3, #0x26
	ldrsh r3, [r4, r3]
	mov r2, #0x2e
	lsl r0, r0, #0x10
	sub r3, #0x28
	add r1, r3, r1
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x28]
	asr r0, r0, #0x10
	add r2, r2, r1
	mov r1, #0x6e
	ldrsb r1, [r4, r1]
	sub r1, r2, r1
	ldr r2, [r4, #0x30]
	lsl r1, r1, #0x10
	add r2, r3, r2
	ldr r3, [sp, #0x1c]
	asr r1, r1, #0x10
	bl NNS_G2dDrawSpriteFast
	b _020083B6
_0200834A:
	mov r0, #0x34
	ldrsh r1, [r4, r0]
	mov r0, #0x50
	mul r0, r1
	asr r3, r0, #8
	mov r0, #0x36
	ldrsh r1, [r4, r0]
	mov r0, #0x50
	mul r0, r1
	asr r6, r0, #8
	add r0, r4, #0
	add r0, #0x5b
	ldrb r0, [r0]
	lsl r1, r0, #4
	str r6, [sp]
	add r0, r7, r1
	ldr r1, [r7, r1]
	str r1, [sp, #4]
	ldr r1, [r0, #4]
	str r1, [sp, #8]
	ldr r1, [r0, #8]
	str r1, [sp, #0xc]
	ldr r0, [r0, #0xc]
	lsr r1, r3, #0x1f
	str r0, [sp, #0x10]
	mov r0, #0x24
	add r1, r3, r1
	ldrsh r0, [r4, r0]
	asr r1, r1, #1
	sub r0, r0, r1
	mov r1, #0x2c
	ldrsh r1, [r4, r1]
	add r0, r0, r1
	mov r1, #0x26
	ldrsh r2, [r4, r1]
	lsr r1, r6, #0x1f
	add r1, r6, r1
	asr r1, r1, #1
	sub r1, r2, r1
	mov r2, #0x2e
	ldrsh r2, [r4, r2]
	lsl r0, r0, #0x10
	ldr r6, [r4, #0x28]
	add r1, r1, r2
	mov r2, #0x6e
	ldrsb r2, [r4, r2]
	asr r0, r0, #0x10
	sub r1, r1, r2
	ldr r2, [r4, #0x30]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r6, r2
	bl NNS_G2dDrawSpriteFast
_020083B6:
	add r0, r4, #0
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1e
	beq _020083DC
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	beq _020083DC
	ldr r0, [r4, #0x54]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _020083DC
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #1
	tst r0, r1
	beq _020083DE
_020083DC:
	b _020084FA
_020083DE:
	ldr r0, _0200849C ; =0x00000333
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _020083EC
	ldr r0, _020084A0 ; =0x04000454
	mov r1, #0
	str r1, [r0]
_020083EC:
	mov r0, #0xb1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #2
	bne _020083FA
	mov r1, #1
	b _020083FC
_020083FA:
	mov r1, #0
_020083FC:
	add r2, r4, #0
	add r2, #0x6c
	ldrh r2, [r2]
	mov r0, #0xbd
	lsl r0, r0, #2
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x1e
	add r2, r2, #3
	ldr r0, [r5, r0]
	lsl r2, r2, #5
	add r2, r0, r2
	mov r0, #4
	sub r0, r0, r1
	add r1, r2, #0
	lsr r1, r0
	ldr r0, _020084A4 ; =0x040004AC
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _0200843C
	mov r0, #0x34
	ldrsh r0, [r4, r0]
	lsl r0, r0, #6
	asr r3, r0, #8
	mov r0, #0x36
	ldrsh r0, [r4, r0]
	lsl r0, r0, #4
	asr r1, r0, #8
	b _02008440
_0200843C:
	mov r3, #0x40
	mov r1, #0x10
_02008440:
	add r0, r4, #0
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _02008462
	mov r0, #0x74
	ldrsh r2, [r4, r0]
	mov r0, #0x24
	mov r6, #0x2c
	ldrsh r0, [r4, r0]
	ldrsh r6, [r4, r6]
	add r0, r0, r6
	add r2, r2, r0
	add r0, r4, #0
	add r0, #0x70
	strh r2, [r0]
_02008462:
	add r0, r4, #0
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	beq _02008484
	mov r0, #0x76
	ldrsh r2, [r4, r0]
	mov r0, #0x26
	mov r6, #0x2e
	ldrsh r0, [r4, r0]
	ldrsh r6, [r4, r6]
	add r0, r0, r6
	add r2, r2, r0
	add r0, r4, #0
	add r0, #0x72
	strh r2, [r0]
_02008484:
	add r0, r4, #0
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	lsl r2, r0, #4
	ldr r0, _020084BC ; =_020F5988
	b _020084C0
	.balign 4, 0
_02008494: .word 0x04000444
_02008498: .word _020F5B04
_0200849C: .word 0x00000333
_020084A0: .word 0x04000454
_020084A4: .word 0x040004AC
_020084A8: .word 0x04000470
_020084AC: .word FX_SinCosTable_
_020084B0: .word 0x040004C0
_020084B4: .word 0x00004210
_020084B8: .word 0x040004A4
_020084BC: .word _020F5988
_020084C0:
	str r1, [sp]
	add r6, r0, r2
	ldr r0, [r0, r2]
	lsr r2, r3, #0x1f
	str r0, [sp, #4]
	ldr r0, [r6, #4]
	add r2, r3, r2
	str r0, [sp, #8]
	ldr r0, [r6, #8]
	asr r2, r2, #1
	str r0, [sp, #0xc]
	ldr r0, [r6, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x70
	ldrsh r0, [r4, r0]
	sub r0, r0, r2
	mov r2, #0x72
	ldrsh r6, [r4, r2]
	lsr r2, r1, #0x1f
	add r2, r1, r2
	asr r1, r2, #1
	sub r1, r6, r1
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	ldr r2, _0200851C ; =0xFFFFFC18
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	bl NNS_G2dDrawSpriteFast
_020084FA:
	ldr r0, [sp, #0x14]
	add r4, #0xac
	add r0, #0x20
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r7, #0x20
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #4
	bge _02008510
	b _0200817A
_02008510:
	ldr r0, _02008520 ; =0x04000448
	mov r1, #1
	str r1, [r0]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200851C: .word 0xFFFFFC18
_02008520: .word 0x04000448
	thumb_func_end sub_02008120

	thumb_func_start sub_02008524
sub_02008524: ; 0x02008524
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02008524

	thumb_func_start sub_02008550
sub_02008550: ; 0x02008550
	push {r3, r4}
	add r1, r0, #0
	mov r3, #0
	add r1, #0x59
	strb r3, [r1]
	add r1, r3, #0
_0200855C:
	add r2, r0, r3
	add r2, #0x5c
	add r3, r3, #1
	strb r1, [r2]
	cmp r3, #0xa
	blt _0200855C
	add r2, r0, #0
	add r2, #0x59
	ldrb r2, [r2]
	lsl r2, r2, #2
	add r3, r0, r2
	mov r2, #0x84
	ldrsb r4, [r3, r2]
	add r3, r2, #0
	sub r3, #0x85
	cmp r4, r3
	bne _02008586
	add r0, #0x5b
	strb r1, [r0]
	pop {r3, r4}
	bx lr
_02008586:
	add r1, r0, #0
	mov r3, #1
	add r1, #0x58
	strb r3, [r1]
	add r1, r0, #0
	add r1, #0x59
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r1, r0, r1
	ldrsb r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x5b
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x59
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r1, r0, r1
	add r1, #0x85
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0x5a
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x59
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r2, r0, r1
	mov r1, #0x86
	ldrsb r1, [r2, r1]
	strh r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02008550

	thumb_func_start sub_020085C8
sub_020085C8: ; 0x020085C8
	add r2, r0, #0
	ldr r3, _020085D8 ; =MI_CpuCopy8
	add r2, #0x84
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0x28
	bx r3
	nop
_020085D8: .word MI_CpuCopy8
	thumb_func_end sub_020085C8

	thumb_func_start sub_020085DC
sub_020085DC: ; 0x020085DC
	add r0, #0x58
	ldrb r0, [r0]
	cmp r0, #0
	beq _020085E8
	mov r0, #1
	bx lr
_020085E8:
	mov r0, #0
	bx lr
	thumb_func_end sub_020085DC

	thumb_func_start sub_020085EC
sub_020085EC: ; 0x020085EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #0x14]
	mov r4, #0
_020085FA:
	ldr r1, [r0]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _0200860A
	add r4, r4, #1
	add r0, #0xac
	cmp r4, #4
	blt _020085FA
_0200860A:
	cmp r4, #4
	bne _02008612
	bl GF_AssertFail
_02008612:
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x14]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	add r2, r7, #0
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_02008634
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020085EC

	thumb_func_start sub_02008634
sub_02008634: ; 0x02008634
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #8]
	ldr r1, [sp, #0x28]
	add r4, r0, #0
	mov r0, #0xac
	add r6, r1, #0
	mul r6, r0
	ldr r0, [r4, r6]
	str r2, [sp]
	lsl r0, r0, #0x1f
	str r3, [sp, #4]
	lsr r0, r0, #0x1f
	beq _02008654
	bl GF_AssertFail
_02008654:
	add r5, r4, r6
	mov r0, #0
	add r1, r5, #0
	mov r2, #0xac
	bl MIi_CpuClearFast
	ldr r1, [r4, r6]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	str r0, [r4, r6]
	ldr r1, [r4, r6]
	mov r0, #0x80
	orr r0, r1
	str r0, [r4, r6]
	mov r0, #0x80
	ldr r1, [r4, r6]
	add r0, #0x80
	orr r0, r1
	str r0, [r4, r6]
	add r2, r5, #0
	ldr r0, [r4, r6]
	mov r1, #0x7e
	bic r0, r1
	ldr r1, [sp, #0x24]
	add r7, r2, #4
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x19
	orr r0, r1
	str r0, [r4, r6]
	ldr r0, [sp, #8]
	mov ip, r0
	mov r3, ip
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	add r7, r2, #0
	ldr r3, [sp, #8]
	add r7, #0x14
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	str r3, [sp, #8]
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	ldr r0, [sp]
	ldr r1, [sp, #4]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	lsl r1, r1, #0x10
	asr r7, r1, #0x10
	strh r0, [r2, #0x24]
	str r3, [sp, #8]
	ldr r1, [sp, #0x20]
	strh r7, [r2, #0x26]
	str r1, [r2, #0x28]
	mov r1, #0x80
	add r1, #0x80
	strh r1, [r2, #0x34]
	strh r1, [r2, #0x36]
	ldr r1, [r5, #0x54]
	mov r3, #0x7c
	bic r1, r3
	mov r3, #0x7c
	orr r1, r3
	str r1, [r5, #0x54]
	ldr r1, [r5, #0x50]
	mov r3, #0x1f
	bic r1, r3
	mov r3, #0x1f
	orr r3, r1
	ldr r1, _0200876C ; =0xFFFFFC1F
	and r1, r3
	mov r3, #0x1f
	lsl r3, r3, #5
	orr r3, r1
	ldr r1, _02008770 ; =0xFFFF83FF
	and r1, r3
	mov r3, #0x1f
	lsl r3, r3, #0xa
	orr r3, r1
	ldr r1, _02008774 ; =0xFFF07FFF
	and r1, r3
	mov r3, #0x80
	lsl r3, r3, #0xc
	orr r3, r1
	ldr r1, _02008778 ; =0xFE0FFFFF
	and r1, r3
	mov r3, #0x80
	lsl r3, r3, #0x11
	orr r3, r1
	ldr r1, _0200877C ; =0xC1FFFFFF
	and r1, r3
	mov r3, #0x80
	lsl r3, r3, #0x16
	orr r1, r3
	str r1, [r5, #0x50]
	ldr r1, [sp, #0x30]
	str r1, [r2, #0x68]
	add r1, r2, #0
	add r1, #0x70
	strh r0, [r1]
	add r2, #0x72
	add r0, r5, #0
	strh r7, [r2]
	add r0, #0x6c
	ldrh r1, [r0]
	mov r0, #4
	orr r1, r0
	add r0, r5, #0
	add r0, #0x6c
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x6c
	ldrh r1, [r0]
	mov r0, #8
	orr r1, r0
	add r0, r5, #0
	add r0, #0x6c
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x6c
	ldrh r1, [r0]
	mov r0, #0x10
	add r5, #0x6c
	orr r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _02008764
	add r1, r4, r6
	add r1, #0x84
	mov r2, #0x28
	bl MI_CpuCopy8
_02008764:
	add r0, r4, r6
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0200876C: .word 0xFFFFFC1F
_02008770: .word 0xFFFF83FF
_02008774: .word 0xFFF07FFF
_02008778: .word 0xFE0FFFFF
_0200877C: .word 0xC1FFFFFF
	thumb_func_end sub_02008634

	thumb_func_start sub_02008780
sub_02008780: ; 0x02008780
	ldr r2, [r0]
	mov r1, #1
	bic r2, r1
	str r2, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02008780

	thumb_func_start sub_0200878C
sub_0200878C: ; 0x0200878C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_02008792:
	add r0, r5, #0
	bl sub_02008780
	add r4, r4, #1
	add r5, #0xac
	cmp r4, #4
	blt _02008792
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200878C

	thumb_func_start sub_020087A4
sub_020087A4: ; 0x020087A4
	cmp r1, #0x2e
	bls _020087AA
	b _02008A4C
_020087AA:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020087B6: ; jump table
	.short _02008814 - _020087B6 - 2 ; case 0
	.short _02008818 - _020087B6 - 2 ; case 1
	.short _0200881C - _020087B6 - 2 ; case 2
	.short _02008820 - _020087B6 - 2 ; case 3
	.short _02008824 - _020087B6 - 2 ; case 4
	.short _02008828 - _020087B6 - 2 ; case 5
	.short _0200882C - _020087B6 - 2 ; case 6
	.short _0200883C - _020087B6 - 2 ; case 7
	.short _02008840 - _020087B6 - 2 ; case 8
	.short _02008844 - _020087B6 - 2 ; case 9
	.short _02008848 - _020087B6 - 2 ; case 10
	.short _0200884E - _020087B6 - 2 ; case 11
	.short _02008854 - _020087B6 - 2 ; case 12
	.short _02008858 - _020087B6 - 2 ; case 13
	.short _0200885C - _020087B6 - 2 ; case 14
	.short _0200886C - _020087B6 - 2 ; case 15
	.short _02008872 - _020087B6 - 2 ; case 16
	.short _02008878 - _020087B6 - 2 ; case 17
	.short _0200887E - _020087B6 - 2 ; case 18
	.short _02008884 - _020087B6 - 2 ; case 19
	.short _0200888A - _020087B6 - 2 ; case 20
	.short _02008890 - _020087B6 - 2 ; case 21
	.short _02008896 - _020087B6 - 2 ; case 22
	.short _0200889C - _020087B6 - 2 ; case 23
	.short _020088AC - _020087B6 - 2 ; case 24
	.short _020088BC - _020087B6 - 2 ; case 25
	.short _020088CC - _020087B6 - 2 ; case 26
	.short _020088DC - _020087B6 - 2 ; case 27
	.short _020088EC - _020087B6 - 2 ; case 28
	.short _020088FC - _020087B6 - 2 ; case 29
	.short _0200890C - _020087B6 - 2 ; case 30
	.short _02008926 - _020087B6 - 2 ; case 31
	.short _02008934 - _020087B6 - 2 ; case 32
	.short _02008946 - _020087B6 - 2 ; case 33
	.short _02008958 - _020087B6 - 2 ; case 34
	.short _0200895E - _020087B6 - 2 ; case 35
	.short _02008976 - _020087B6 - 2 ; case 36
	.short _0200898E - _020087B6 - 2 ; case 37
	.short _0200899E - _020087B6 - 2 ; case 38
	.short _02008A4C - _020087B6 - 2 ; case 39
	.short _020089A4 - _020087B6 - 2 ; case 40
	.short _020089BC - _020087B6 - 2 ; case 41
	.short _020089C2 - _020087B6 - 2 ; case 42
	.short _020089E6 - _020087B6 - 2 ; case 43
	.short _02008A00 - _020087B6 - 2 ; case 44
	.short _02008A1A - _020087B6 - 2 ; case 45
	.short _02008A34 - _020087B6 - 2 ; case 46
_02008814:
	strh r2, [r0, #0x24]
	bx lr
_02008818:
	strh r2, [r0, #0x26]
	bx lr
_0200881C:
	str r2, [r0, #0x28]
	bx lr
_02008820:
	strh r2, [r0, #0x2c]
	bx lr
_02008824:
	strh r2, [r0, #0x2e]
	bx lr
_02008828:
	str r2, [r0, #0x30]
	bx lr
_0200882C:
	ldr r3, [r0, #0x54]
	mov r1, #1
	bic r3, r1
	mov r1, #1
	and r1, r2
	orr r1, r3
	str r1, [r0, #0x54]
	bx lr
_0200883C:
	strh r2, [r0, #0x38]
	bx lr
_02008840:
	strh r2, [r0, #0x3a]
	bx lr
_02008844:
	strh r2, [r0, #0x3c]
	bx lr
_02008848:
	add r0, #0x40
	strh r2, [r0]
	bx lr
_0200884E:
	add r0, #0x42
	strh r2, [r0]
	bx lr
_02008854:
	strh r2, [r0, #0x34]
	bx lr
_02008858:
	strh r2, [r0, #0x36]
	bx lr
_0200885C:
	ldr r3, [r0, #0x54]
	mov r1, #2
	bic r3, r1
	lsl r1, r2, #0x1f
	lsr r1, r1, #0x1e
	orr r1, r3
	str r1, [r0, #0x54]
	bx lr
_0200886C:
	add r0, #0x44
	strb r2, [r0]
	bx lr
_02008872:
	add r0, #0x45
	strb r2, [r0]
	bx lr
_02008878:
	add r0, #0x46
	strb r2, [r0]
	bx lr
_0200887E:
	add r0, #0x47
	strb r2, [r0]
	bx lr
_02008884:
	add r0, #0x70
	strh r2, [r0]
	bx lr
_0200888A:
	add r0, #0x72
	strh r2, [r0]
	bx lr
_02008890:
	add r0, #0x74
	strh r2, [r0]
	bx lr
_02008896:
	add r0, #0x76
	strh r2, [r0]
	bx lr
_0200889C:
	ldr r3, [r0, #0x54]
	mov r1, #0x7c
	bic r3, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #0x19
	orr r1, r3
	str r1, [r0, #0x54]
	bx lr
_020088AC:
	ldr r3, [r0, #0x50]
	mov r1, #0x1f
	bic r3, r1
	mov r1, #0x1f
	and r1, r2
	orr r1, r3
	str r1, [r0, #0x50]
	bx lr
_020088BC:
	ldr r3, [r0, #0x50]
	ldr r1, _02008A50 ; =0xFFFFFC1F
	and r3, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #0x16
	orr r1, r3
	str r1, [r0, #0x50]
	bx lr
_020088CC:
	ldr r3, [r0, #0x50]
	ldr r1, _02008A54 ; =0xFFFF83FF
	and r3, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #0x11
	orr r1, r3
	str r1, [r0, #0x50]
	bx lr
_020088DC:
	ldr r3, [r0, #0x50]
	ldr r1, _02008A58 ; =0xFFF07FFF
	and r3, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #0xc
	orr r1, r3
	str r1, [r0, #0x50]
	bx lr
_020088EC:
	ldr r3, [r0, #0x50]
	ldr r1, _02008A5C ; =0xFE0FFFFF
	and r3, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #7
	orr r1, r3
	str r1, [r0, #0x50]
	bx lr
_020088FC:
	ldr r3, [r0, #0x50]
	ldr r1, _02008A60 ; =0xC1FFFFFF
	and r3, r1
	lsl r1, r2, #0x1b
	lsr r1, r1, #2
	orr r1, r3
	str r1, [r0, #0x50]
	bx lr
_0200890C:
	ldr r3, [r0, #0x54]
	ldr r1, _02008A64 ; =0xFFFFEFFF
	and r3, r1
	lsl r1, r2, #0x1f
	lsr r1, r1, #0x13
	orr r1, r3
	str r1, [r0, #0x54]
	mov r1, #1
	ldr r2, [r0]
	lsl r1, r1, #8
	orr r1, r2
	str r1, [r0]
	bx lr
_02008926:
	str r2, [r0, #0x4c]
	mov r1, #1
	ldr r2, [r0]
	lsl r1, r1, #8
	orr r1, r2
	str r1, [r0]
	bx lr
_02008934:
	add r1, r0, #0
	add r1, #0x48
	strb r2, [r1]
	mov r1, #1
	ldr r2, [r0]
	lsl r1, r1, #8
	orr r1, r2
	str r1, [r0]
	bx lr
_02008946:
	add r1, r0, #0
	add r1, #0x49
	strb r2, [r1]
	mov r1, #1
	ldr r2, [r0]
	lsl r1, r1, #8
	orr r1, r2
	str r1, [r0]
	bx lr
_02008958:
	add r0, #0x4a
	strb r2, [r0]
	bx lr
_0200895E:
	ldr r3, [r0, #0x54]
	ldr r1, _02008A68 ; =0xFFFFFDFF
	and r3, r1
	lsl r1, r2, #0x1f
	lsr r1, r1, #0x16
	orr r1, r3
	str r1, [r0, #0x54]
	ldr r2, [r0]
	mov r1, #0x80
	orr r1, r2
	str r1, [r0]
	bx lr
_02008976:
	ldr r3, [r0, #0x54]
	ldr r1, _02008A6C ; =0xFFFFFBFF
	and r3, r1
	lsl r1, r2, #0x1f
	lsr r1, r1, #0x15
	orr r1, r3
	str r1, [r0, #0x54]
	ldr r2, [r0]
	mov r1, #0x80
	orr r1, r2
	str r1, [r0]
	bx lr
_0200898E:
	ldr r3, [r0, #0x54]
	ldr r1, _02008A70 ; =0xFFFFF7FF
	and r3, r1
	lsl r1, r2, #0x1f
	lsr r1, r1, #0x14
	orr r1, r3
	str r1, [r0, #0x54]
	bx lr
_0200899E:
	add r0, #0x5b
	strb r2, [r0]
	bx lr
_020089A4:
	ldr r3, [r0, #0x54]
	ldr r1, _02008A74 ; =0xFFFE1FFF
	and r3, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0xf
	orr r1, r3
	str r1, [r0, #0x54]
	ldr r2, [r0]
	mov r1, #0x80
	orr r1, r2
	str r1, [r0]
	bx lr
_020089BC:
	add r0, #0x6e
	strb r2, [r0]
	bx lr
_020089C2:
	add r1, r0, #0
	add r1, #0x6c
	ldrh r3, [r1]
	mov r1, #3
	bic r3, r1
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	mov r2, #3
	and r1, r2
	orr r3, r1
	add r1, r0, #0
	add r1, #0x6c
	strh r3, [r1]
	ldr r1, [r0]
	add r2, #0xfd
	orr r1, r2
	str r1, [r0]
	bx lr
_020089E6:
	add r1, r0, #0
	add r1, #0x6c
	ldrh r3, [r1]
	mov r1, #4
	add r0, #0x6c
	bic r3, r1
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	orr r1, r3
	strh r1, [r0]
	bx lr
_02008A00:
	add r1, r0, #0
	add r1, #0x6c
	ldrh r3, [r1]
	mov r1, #8
	add r0, #0x6c
	bic r3, r1
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1c
	orr r1, r3
	strh r1, [r0]
	bx lr
_02008A1A:
	add r1, r0, #0
	add r1, #0x6c
	ldrh r3, [r1]
	mov r1, #0x10
	add r0, #0x6c
	bic r3, r1
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1b
	orr r1, r3
	strh r1, [r0]
	bx lr
_02008A34:
	add r1, r0, #0
	add r1, #0x6c
	ldrh r3, [r1]
	mov r1, #0x60
	add r0, #0x6c
	bic r3, r1
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x19
	orr r1, r3
	strh r1, [r0]
_02008A4C:
	bx lr
	nop
_02008A50: .word 0xFFFFFC1F
_02008A54: .word 0xFFFF83FF
_02008A58: .word 0xFFF07FFF
_02008A5C: .word 0xFE0FFFFF
_02008A60: .word 0xC1FFFFFF
_02008A64: .word 0xFFFFEFFF
_02008A68: .word 0xFFFFFDFF
_02008A6C: .word 0xFFFFFBFF
_02008A70: .word 0xFFFFF7FF
_02008A74: .word 0xFFFE1FFF
	thumb_func_end sub_020087A4

	thumb_func_start sub_02008A78
sub_02008A78: ; 0x02008A78
	push {r3, lr}
	cmp r1, #0x2e
	bls _02008A80
	b _02008C22
_02008A80:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02008A8C: ; jump table
	.short _02008AEA - _02008A8C - 2 ; case 0
	.short _02008AF0 - _02008A8C - 2 ; case 1
	.short _02008AF6 - _02008A8C - 2 ; case 2
	.short _02008AFA - _02008A8C - 2 ; case 3
	.short _02008B00 - _02008A8C - 2 ; case 4
	.short _02008B06 - _02008A8C - 2 ; case 5
	.short _02008B0A - _02008A8C - 2 ; case 6
	.short _02008B12 - _02008A8C - 2 ; case 7
	.short _02008B16 - _02008A8C - 2 ; case 8
	.short _02008B1A - _02008A8C - 2 ; case 9
	.short _02008B1E - _02008A8C - 2 ; case 10
	.short _02008B24 - _02008A8C - 2 ; case 11
	.short _02008B2A - _02008A8C - 2 ; case 12
	.short _02008B30 - _02008A8C - 2 ; case 13
	.short _02008B36 - _02008A8C - 2 ; case 14
	.short _02008B3E - _02008A8C - 2 ; case 15
	.short _02008B44 - _02008A8C - 2 ; case 16
	.short _02008B4A - _02008A8C - 2 ; case 17
	.short _02008B50 - _02008A8C - 2 ; case 18
	.short _02008B56 - _02008A8C - 2 ; case 19
	.short _02008B5C - _02008A8C - 2 ; case 20
	.short _02008B62 - _02008A8C - 2 ; case 21
	.short _02008B68 - _02008A8C - 2 ; case 22
	.short _02008B6E - _02008A8C - 2 ; case 23
	.short _02008B76 - _02008A8C - 2 ; case 24
	.short _02008B7E - _02008A8C - 2 ; case 25
	.short _02008B86 - _02008A8C - 2 ; case 26
	.short _02008B8E - _02008A8C - 2 ; case 27
	.short _02008B96 - _02008A8C - 2 ; case 28
	.short _02008B9E - _02008A8C - 2 ; case 29
	.short _02008BA6 - _02008A8C - 2 ; case 30
	.short _02008BAE - _02008A8C - 2 ; case 31
	.short _02008BB2 - _02008A8C - 2 ; case 32
	.short _02008BB8 - _02008A8C - 2 ; case 33
	.short _02008BBE - _02008A8C - 2 ; case 34
	.short _02008BC4 - _02008A8C - 2 ; case 35
	.short _02008BCC - _02008A8C - 2 ; case 36
	.short _02008BD4 - _02008A8C - 2 ; case 37
	.short _02008BDC - _02008A8C - 2 ; case 38
	.short _02008C22 - _02008A8C - 2 ; case 39
	.short _02008BE2 - _02008A8C - 2 ; case 40
	.short _02008BEA - _02008A8C - 2 ; case 41
	.short _02008BF0 - _02008A8C - 2 ; case 42
	.short _02008BFA - _02008A8C - 2 ; case 43
	.short _02008C04 - _02008A8C - 2 ; case 44
	.short _02008C0E - _02008A8C - 2 ; case 45
	.short _02008C18 - _02008A8C - 2 ; case 46
_02008AEA:
	mov r1, #0x24
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008AF0:
	mov r1, #0x26
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008AF6:
	ldr r0, [r0, #0x28]
	pop {r3, pc}
_02008AFA:
	mov r1, #0x2c
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B00:
	mov r1, #0x2e
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B06:
	ldr r0, [r0, #0x30]
	pop {r3, pc}
_02008B0A:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008B12:
	ldrh r0, [r0, #0x38]
	pop {r3, pc}
_02008B16:
	ldrh r0, [r0, #0x3a]
	pop {r3, pc}
_02008B1A:
	ldrh r0, [r0, #0x3c]
	pop {r3, pc}
_02008B1E:
	mov r1, #0x40
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B24:
	mov r1, #0x42
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B2A:
	mov r1, #0x34
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B30:
	mov r1, #0x36
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B36:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008B3E:
	add r0, #0x44
	ldrb r0, [r0]
	pop {r3, pc}
_02008B44:
	add r0, #0x45
	ldrb r0, [r0]
	pop {r3, pc}
_02008B4A:
	add r0, #0x46
	ldrb r0, [r0]
	pop {r3, pc}
_02008B50:
	add r0, #0x47
	ldrb r0, [r0]
	pop {r3, pc}
_02008B56:
	mov r1, #0x70
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B5C:
	mov r1, #0x72
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B62:
	mov r1, #0x74
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B68:
	mov r1, #0x76
	ldrsh r0, [r0, r1]
	pop {r3, pc}
_02008B6E:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1b
	pop {r3, pc}
_02008B76:
	ldr r0, [r0, #0x50]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1b
	pop {r3, pc}
_02008B7E:
	ldr r0, [r0, #0x50]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1b
	pop {r3, pc}
_02008B86:
	ldr r0, [r0, #0x50]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1b
	pop {r3, pc}
_02008B8E:
	ldr r0, [r0, #0x50]
	lsl r0, r0, #0xc
	lsr r0, r0, #0x1b
	pop {r3, pc}
_02008B96:
	ldr r0, [r0, #0x50]
	lsl r0, r0, #7
	lsr r0, r0, #0x1b
	pop {r3, pc}
_02008B9E:
	ldr r0, [r0, #0x50]
	lsl r0, r0, #2
	lsr r0, r0, #0x1b
	pop {r3, pc}
_02008BA6:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x13
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008BAE:
	ldr r0, [r0, #0x4c]
	pop {r3, pc}
_02008BB2:
	add r0, #0x48
	ldrb r0, [r0]
	pop {r3, pc}
_02008BB8:
	add r0, #0x49
	ldrb r0, [r0]
	pop {r3, pc}
_02008BBE:
	add r0, #0x4a
	ldrb r0, [r0]
	pop {r3, pc}
_02008BC4:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008BCC:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008BD4:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x14
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008BDC:
	add r0, #0x5b
	ldrb r0, [r0]
	pop {r3, pc}
_02008BE2:
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0xf
	lsr r0, r0, #0x1c
	pop {r3, pc}
_02008BEA:
	mov r1, #0x6e
	ldrsb r0, [r0, r1]
	pop {r3, pc}
_02008BF0:
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	pop {r3, pc}
_02008BFA:
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008C04:
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008C0E:
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	pop {r3, pc}
_02008C18:
	add r0, #0x6c
	ldrh r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1e
	pop {r3, pc}
_02008C22:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02008A78

	thumb_func_start sub_02008C2C
sub_02008C2C: ; 0x02008C2C
	push {r3, r4}
	add r3, r0, #0
	add r0, r2, #0
	cmp r1, #0x2e
	bls _02008C38
	b _0200905E
_02008C38:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02008C44: ; jump table
	.short _02008CA2 - _02008C44 - 2 ; case 0
	.short _02008CAE - _02008C44 - 2 ; case 1
	.short _02008CBA - _02008C44 - 2 ; case 2
	.short _02008CC4 - _02008C44 - 2 ; case 3
	.short _02008CD0 - _02008C44 - 2 ; case 4
	.short _02008CDC - _02008C44 - 2 ; case 5
	.short _02008CE6 - _02008C44 - 2 ; case 6
	.short _02008D00 - _02008C44 - 2 ; case 7
	.short _02008D0A - _02008C44 - 2 ; case 8
	.short _02008D14 - _02008C44 - 2 ; case 9
	.short _02008D1E - _02008C44 - 2 ; case 10
	.short _02008D2C - _02008C44 - 2 ; case 11
	.short _02008D3A - _02008C44 - 2 ; case 12
	.short _02008D46 - _02008C44 - 2 ; case 13
	.short _02008D52 - _02008C44 - 2 ; case 14
	.short _02008D6C - _02008C44 - 2 ; case 15
	.short _02008D7C - _02008C44 - 2 ; case 16
	.short _02008D8C - _02008C44 - 2 ; case 17
	.short _02008D9C - _02008C44 - 2 ; case 18
	.short _02008DAC - _02008C44 - 2 ; case 19
	.short _02008DBA - _02008C44 - 2 ; case 20
	.short _02008DC8 - _02008C44 - 2 ; case 21
	.short _02008DD6 - _02008C44 - 2 ; case 22
	.short _02008DE4 - _02008C44 - 2 ; case 23
	.short _02008DFE - _02008C44 - 2 ; case 24
	.short _02008E18 - _02008C44 - 2 ; case 25
	.short _02008E30 - _02008C44 - 2 ; case 26
	.short _02008E48 - _02008C44 - 2 ; case 27
	.short _02008E60 - _02008C44 - 2 ; case 28
	.short _02008E78 - _02008C44 - 2 ; case 29
	.short _02008E90 - _02008C44 - 2 ; case 30
	.short _02008EB2 - _02008C44 - 2 ; case 31
	.short _02008EC6 - _02008C44 - 2 ; case 32
	.short _02008EE2 - _02008C44 - 2 ; case 33
	.short _02008EFE - _02008C44 - 2 ; case 34
	.short _02008F0E - _02008C44 - 2 ; case 35
	.short _02008F2E - _02008C44 - 2 ; case 36
	.short _02008F4E - _02008C44 - 2 ; case 37
	.short _02008F66 - _02008C44 - 2 ; case 38
	.short _0200905E - _02008C44 - 2 ; case 39
	.short _02008F76 - _02008C44 - 2 ; case 40
	.short _02008F96 - _02008C44 - 2 ; case 41
	.short _02008FA4 - _02008C44 - 2 ; case 42
	.short _02008FD2 - _02008C44 - 2 ; case 43
	.short _02008FF6 - _02008C44 - 2 ; case 44
	.short _0200901A - _02008C44 - 2 ; case 45
	.short _0200903E - _02008C44 - 2 ; case 46
_02008CA2:
	mov r1, #0x24
	ldrsh r1, [r3, r1]
	add r0, r1, r0
	strh r0, [r3, #0x24]
	pop {r3, r4}
	bx lr
_02008CAE:
	mov r1, #0x26
	ldrsh r1, [r3, r1]
	add r0, r1, r0
	strh r0, [r3, #0x26]
	pop {r3, r4}
	bx lr
_02008CBA:
	ldr r1, [r3, #0x28]
	add r0, r1, r0
	str r0, [r3, #0x28]
	pop {r3, r4}
	bx lr
_02008CC4:
	mov r1, #0x2c
	ldrsh r1, [r3, r1]
	add r0, r1, r0
	strh r0, [r3, #0x2c]
	pop {r3, r4}
	bx lr
_02008CD0:
	mov r1, #0x2e
	ldrsh r1, [r3, r1]
	add r0, r1, r0
	strh r0, [r3, #0x2e]
	pop {r3, r4}
	bx lr
_02008CDC:
	ldr r1, [r3, #0x30]
	add r0, r1, r0
	str r0, [r3, #0x30]
	pop {r3, r4}
	bx lr
_02008CE6:
	ldr r4, [r3, #0x54]
	mov r2, #1
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x1f
	lsr r2, r2, #0x1f
	add r2, r2, r0
	mov r0, #1
	and r0, r2
	orr r0, r1
	str r0, [r3, #0x54]
	pop {r3, r4}
	bx lr
_02008D00:
	ldrh r1, [r3, #0x38]
	add r0, r1, r0
	strh r0, [r3, #0x38]
	pop {r3, r4}
	bx lr
_02008D0A:
	ldrh r1, [r3, #0x3a]
	add r0, r1, r0
	strh r0, [r3, #0x3a]
	pop {r3, r4}
	bx lr
_02008D14:
	ldrh r1, [r3, #0x3c]
	add r0, r1, r0
	strh r0, [r3, #0x3c]
	pop {r3, r4}
	bx lr
_02008D1E:
	mov r1, #0x40
	ldrsh r1, [r3, r1]
	add r3, #0x40
	add r0, r1, r0
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_02008D2C:
	mov r1, #0x42
	ldrsh r1, [r3, r1]
	add r3, #0x42
	add r0, r1, r0
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_02008D3A:
	mov r1, #0x34
	ldrsh r1, [r3, r1]
	add r0, r1, r0
	strh r0, [r3, #0x34]
	pop {r3, r4}
	bx lr
_02008D46:
	mov r1, #0x36
	ldrsh r1, [r3, r1]
	add r0, r1, r0
	strh r0, [r3, #0x36]
	pop {r3, r4}
	bx lr
_02008D52:
	ldr r4, [r3, #0x54]
	mov r2, #2
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x1e
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1e
	orr r0, r1
	str r0, [r3, #0x54]
	pop {r3, r4}
	bx lr
_02008D6C:
	add r1, r3, #0
	add r1, #0x44
	ldrb r1, [r1]
	add r3, #0x44
	add r0, r1, r0
	strb r0, [r3]
	pop {r3, r4}
	bx lr
_02008D7C:
	add r1, r3, #0
	add r1, #0x45
	ldrb r1, [r1]
	add r3, #0x45
	add r0, r1, r0
	strb r0, [r3]
	pop {r3, r4}
	bx lr
_02008D8C:
	add r1, r3, #0
	add r1, #0x46
	ldrb r1, [r1]
	add r3, #0x46
	add r0, r1, r0
	strb r0, [r3]
	pop {r3, r4}
	bx lr
_02008D9C:
	add r1, r3, #0
	add r1, #0x47
	ldrb r1, [r1]
	add r3, #0x47
	add r0, r1, r0
	strb r0, [r3]
	pop {r3, r4}
	bx lr
_02008DAC:
	mov r1, #0x70
	ldrsh r1, [r3, r1]
	add r3, #0x70
	add r0, r1, r0
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_02008DBA:
	mov r1, #0x72
	ldrsh r1, [r3, r1]
	add r3, #0x72
	add r0, r1, r0
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_02008DC8:
	mov r1, #0x74
	ldrsh r1, [r3, r1]
	add r3, #0x74
	add r0, r1, r0
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_02008DD6:
	mov r1, #0x76
	ldrsh r1, [r3, r1]
	add r3, #0x76
	add r0, r1, r0
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_02008DE4:
	ldr r4, [r3, #0x54]
	mov r2, #0x7c
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x19
	lsr r2, r2, #0x1b
	add r0, r2, r0
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x19
	orr r0, r1
	str r0, [r3, #0x54]
	pop {r3, r4}
	bx lr
_02008DFE:
	ldr r4, [r3, #0x50]
	mov r2, #0x1f
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x1b
	lsr r2, r2, #0x1b
	add r2, r2, r0
	mov r0, #0x1f
	and r0, r2
	orr r0, r1
	str r0, [r3, #0x50]
	pop {r3, r4}
	bx lr
_02008E18:
	ldr r2, [r3, #0x50]
	ldr r1, _02009064 ; =0xFFFFFC1F
	and r1, r2
	lsl r2, r2, #0x16
	lsr r2, r2, #0x1b
	add r0, r2, r0
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x16
	orr r0, r1
	str r0, [r3, #0x50]
	pop {r3, r4}
	bx lr
_02008E30:
	ldr r2, [r3, #0x50]
	ldr r1, _02009068 ; =0xFFFF83FF
	and r1, r2
	lsl r2, r2, #0x11
	lsr r2, r2, #0x1b
	add r0, r2, r0
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x11
	orr r0, r1
	str r0, [r3, #0x50]
	pop {r3, r4}
	bx lr
_02008E48:
	ldr r2, [r3, #0x50]
	ldr r1, _0200906C ; =0xFFF07FFF
	and r1, r2
	lsl r2, r2, #0xc
	lsr r2, r2, #0x1b
	add r0, r2, r0
	lsl r0, r0, #0x1b
	lsr r0, r0, #0xc
	orr r0, r1
	str r0, [r3, #0x50]
	pop {r3, r4}
	bx lr
_02008E60:
	ldr r2, [r3, #0x50]
	ldr r1, _02009070 ; =0xFE0FFFFF
	and r1, r2
	lsl r2, r2, #7
	lsr r2, r2, #0x1b
	add r0, r2, r0
	lsl r0, r0, #0x1b
	lsr r0, r0, #7
	orr r0, r1
	str r0, [r3, #0x50]
	pop {r3, r4}
	bx lr
_02008E78:
	ldr r2, [r3, #0x50]
	ldr r1, _02009074 ; =0xC1FFFFFF
	and r1, r2
	lsl r2, r2, #2
	lsr r2, r2, #0x1b
	add r0, r2, r0
	lsl r0, r0, #0x1b
	lsr r0, r0, #2
	orr r0, r1
	str r0, [r3, #0x50]
	pop {r3, r4}
	bx lr
_02008E90:
	ldr r2, [r3, #0x54]
	ldr r1, _02009078 ; =0xFFFFEFFF
	and r1, r2
	lsl r2, r2, #0x13
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x13
	orr r0, r1
	str r0, [r3, #0x54]
	mov r0, #1
	ldr r1, [r3]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008EB2:
	ldr r1, [r3, #0x4c]
	add r0, r1, r0
	str r0, [r3, #0x4c]
	mov r0, #1
	ldr r1, [r3]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008EC6:
	add r1, r3, #0
	add r1, #0x48
	ldrb r1, [r1]
	add r1, r1, r0
	add r0, r3, #0
	add r0, #0x48
	strb r1, [r0]
	mov r0, #1
	ldr r1, [r3]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008EE2:
	add r1, r3, #0
	add r1, #0x49
	ldrb r1, [r1]
	add r1, r1, r0
	add r0, r3, #0
	add r0, #0x49
	strb r1, [r0]
	mov r0, #1
	ldr r1, [r3]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008EFE:
	add r1, r3, #0
	add r1, #0x4a
	ldrb r1, [r1]
	add r3, #0x4a
	add r0, r1, r0
	strb r0, [r3]
	pop {r3, r4}
	bx lr
_02008F0E:
	ldr r2, [r3, #0x54]
	ldr r1, _0200907C ; =0xFFFFFDFF
	and r1, r2
	lsl r2, r2, #0x16
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x16
	orr r0, r1
	str r0, [r3, #0x54]
	ldr r1, [r3]
	mov r0, #0x80
	orr r0, r1
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008F2E:
	ldr r2, [r3, #0x54]
	ldr r1, _02009080 ; =0xFFFFFBFF
	and r1, r2
	lsl r2, r2, #0x15
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x15
	orr r0, r1
	str r0, [r3, #0x54]
	ldr r1, [r3]
	mov r0, #0x80
	orr r0, r1
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008F4E:
	ldr r2, [r3, #0x54]
	ldr r1, _02009084 ; =0xFFFFF7FF
	and r1, r2
	lsl r2, r2, #0x14
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x14
	orr r0, r1
	str r0, [r3, #0x54]
	pop {r3, r4}
	bx lr
_02008F66:
	add r1, r3, #0
	add r1, #0x5b
	ldrb r1, [r1]
	add r3, #0x5b
	add r0, r1, r0
	strb r0, [r3]
	pop {r3, r4}
	bx lr
_02008F76:
	ldr r2, [r3, #0x54]
	ldr r1, _02009088 ; =0xFFFE1FFF
	and r1, r2
	lsl r2, r2, #0xf
	lsr r2, r2, #0x1c
	add r0, r2, r0
	lsl r0, r0, #0x1c
	lsr r0, r0, #0xf
	orr r0, r1
	str r0, [r3, #0x54]
	ldr r1, [r3]
	mov r0, #0x80
	orr r0, r1
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008F96:
	mov r1, #0x6e
	ldrsb r1, [r3, r1]
	add r3, #0x6e
	add r0, r1, r0
	strb r0, [r3]
	pop {r3, r4}
	bx lr
_02008FA4:
	add r1, r3, #0
	add r1, #0x6c
	ldrh r4, [r1]
	mov r2, #3
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x1e
	lsr r2, r2, #0x1e
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #3
	and r0, r2
	orr r1, r0
	add r0, r3, #0
	add r0, #0x6c
	strh r1, [r0]
	ldr r0, [r3]
	add r2, #0xfd
	orr r0, r2
	str r0, [r3]
	pop {r3, r4}
	bx lr
_02008FD2:
	add r1, r3, #0
	add r1, #0x6c
	ldrh r4, [r1]
	mov r2, #4
	add r3, #0x6c
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x1d
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1d
	orr r0, r1
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_02008FF6:
	add r1, r3, #0
	add r1, #0x6c
	ldrh r4, [r1]
	mov r2, #8
	add r3, #0x6c
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x1c
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1c
	orr r0, r1
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_0200901A:
	add r1, r3, #0
	add r1, #0x6c
	ldrh r4, [r1]
	mov r2, #0x10
	add r3, #0x6c
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x1b
	lsr r2, r2, #0x1f
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1b
	orr r0, r1
	strh r0, [r3]
	pop {r3, r4}
	bx lr
_0200903E:
	add r1, r3, #0
	add r1, #0x6c
	ldrh r4, [r1]
	mov r2, #0x60
	add r3, #0x6c
	add r1, r4, #0
	bic r1, r2
	lsl r2, r4, #0x19
	lsr r2, r2, #0x1e
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x19
	orr r0, r1
	strh r0, [r3]
_0200905E:
	pop {r3, r4}
	bx lr
	nop
_02009064: .word 0xFFFFFC1F
_02009068: .word 0xFFFF83FF
_0200906C: .word 0xFFF07FFF
_02009070: .word 0xFE0FFFFF
_02009074: .word 0xC1FFFFFF
_02009078: .word 0xFFFFEFFF
_0200907C: .word 0xFFFFFDFF
_02009080: .word 0xFFFFFBFF
_02009084: .word 0xFFFFF7FF
_02009088: .word 0xFFFE1FFF
	thumb_func_end sub_02008C2C

	thumb_func_start sub_0200908C
sub_0200908C: ; 0x0200908C
	push {r4, r5}
	ldr r5, [r0, #0x54]
	mov r4, #2
	orr r4, r5
	str r4, [r0, #0x54]
	add r4, r0, #0
	add r4, #0x44
	strb r1, [r4]
	add r1, r0, #0
	add r1, #0x45
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x46
	strb r3, [r1]
	ldr r1, [sp, #8]
	add r0, #0x47
	strb r1, [r0]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0200908C

	thumb_func_start sub_020090B4
sub_020090B4: ; 0x020090B4
	push {r4, r5}
	mov r4, #1
	ldr r5, [r0, #0x54]
	lsl r4, r4, #0xc
	orr r4, r5
	str r4, [r0, #0x54]
	add r4, r0, #0
	add r4, #0x48
	strb r1, [r4]
	add r1, r0, #0
	add r1, #0x49
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x4a
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x4b
	strb r3, [r1]
	ldr r1, [sp, #8]
	str r1, [r0, #0x4c]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020090B4

	thumb_func_start sub_020090E4
sub_020090E4: ; 0x020090E4
	push {r4, r5, r6, r7}
	add r4, r0, #0
	add r0, r1, #0
	add r5, r2, #0
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	lsl r0, r5, #0x18
	lsr r5, r0, #0x18
	lsl r0, r3, #0x18
	ldr r2, [sp, #0x10]
	mov r1, #0
	lsr r0, r0, #0x18
_020090FC:
	ldr r3, [r4]
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1f
	beq _0200912A
	mov r3, #1
	ldr r7, [r4, #0x54]
	lsl r3, r3, #0xc
	orr r3, r7
	str r3, [r4, #0x54]
	add r3, r4, #0
	add r3, #0x48
	strb r6, [r3]
	add r3, r4, #0
	add r3, #0x49
	add r7, r4, #0
	strb r5, [r3]
	add r7, #0x4a
	mov r3, #0
	strb r3, [r7]
	add r3, r4, #0
	add r3, #0x4b
	strb r0, [r3]
	str r2, [r4, #0x4c]
_0200912A:
	add r1, r1, #1
	add r4, #0xac
	cmp r1, #4
	blt _020090FC
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020090E4

	thumb_func_start sub_02009138
sub_02009138: ; 0x02009138
	ldr r0, [r0, #0x54]
	lsl r0, r0, #0x13
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02009146
	mov r0, #1
	bx lr
_02009146:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02009138

	thumb_func_start sub_0200914C
sub_0200914C: ; 0x0200914C
	mov r2, #0x28
	sub r2, r2, r1
	mov r1, #0x36
	ldrsh r1, [r0, r1]
	mul r1, r2
	asr r1, r1, #8
	sub r1, r2, r1
	strh r1, [r0, #0x2e]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0200914C

	thumb_func_start sub_02009160
sub_02009160: ; 0x02009160
	push {r4, r5, r6, r7}
	add r1, r0, #0
	add r1, #0x58
	ldrb r1, [r1]
	cmp r1, #0
	beq _02009256
	add r1, r0, #0
	add r1, #0x5a
	ldrb r1, [r1]
	cmp r1, #0
	bne _0200924A
	add r1, r0, #0
	add r1, #0x59
	ldrb r1, [r1]
	add r6, r0, #0
	add r6, #0x59
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0x59
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x59
	ldrb r3, [r1]
	lsl r1, r3, #2
	add r2, r0, r1
	mov r1, #0x84
	ldrsb r4, [r2, r1]
	sub r1, #0x85
	cmp r4, r1
	bge _020091FC
	mov r2, #0
	sub r1, r2, #2
_020091A0:
	add r4, r0, r3
	add r4, #0x5c
	ldrb r4, [r4]
	add r3, r0, r3
	add r3, #0x5c
	add r4, r4, #1
	strb r4, [r3]
	add r3, r0, #0
	add r3, #0x59
	ldrb r5, [r3]
	lsl r3, r5, #2
	add r4, r0, r3
	add r3, r4, #0
	add r7, r0, r5
	add r3, #0x85
	add r7, #0x5c
	ldrb r3, [r3]
	ldrb r7, [r7]
	cmp r3, r7
	beq _020091CC
	cmp r3, #0
	bne _020091DA
_020091CC:
	add r3, r0, r5
	add r3, #0x5c
	strb r2, [r3]
	ldrb r3, [r6]
	add r3, r3, #1
	strb r3, [r6]
	b _020091E6
_020091DA:
	mov r3, #0x84
	ldrsb r3, [r4, r3]
	sub r4, r1, r3
	add r3, r0, #0
	add r3, #0x59
	strb r4, [r3]
_020091E6:
	add r3, r0, #0
	add r3, #0x59
	ldrb r3, [r3]
	lsl r4, r3, #2
	add r5, r0, r4
	mov r4, #0x84
	ldrsb r4, [r5, r4]
	mov r5, #0
	mvn r5, r5
	cmp r4, r5
	blt _020091A0
_020091FC:
	cmp r3, #0xa
	bhs _02009208
	mov r1, #0
	mvn r1, r1
	cmp r4, r1
	bne _0200921C
_02009208:
	add r1, r0, #0
	mov r2, #0
	add r1, #0x5b
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x58
	strb r2, [r1]
	strh r2, [r0, #0x2c]
	pop {r4, r5, r6, r7}
	bx lr
_0200921C:
	add r1, r0, #0
	add r1, #0x5b
	strb r4, [r1]
	add r1, r0, #0
	add r1, #0x59
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r1, r0, r1
	add r1, #0x85
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0x5a
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x59
	ldrb r1, [r1]
	lsl r1, r1, #2
	add r2, r0, r1
	mov r1, #0x86
	ldrsb r1, [r2, r1]
	strh r1, [r0, #0x2c]
	pop {r4, r5, r6, r7}
	bx lr
_0200924A:
	add r1, r0, #0
	add r1, #0x5a
	ldrb r1, [r1]
	add r0, #0x5a
	sub r1, r1, #1
	strb r1, [r0]
_02009256:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02009160

	thumb_func_start sub_0200925C
sub_0200925C: ; 0x0200925C
	ldr r3, _02009260 ; =sub_02009160
	bx r3
	.balign 4, 0
_02009260: .word sub_02009160
	thumb_func_end sub_0200925C

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
	bl sub_02003DE8
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
	bl sub_02003DE8
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
