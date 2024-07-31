	.include "asm/macros.inc"
	.include "overlay_121.inc"
	.include "global.inc"

	.text

	.extern ov121_021E6168
	.extern ov121_021E65D8

	thumb_func_start ov121_021E6C5C
ov121_021E6C5C: ; 0x021E6C5C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x44
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x28
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CA0 ; =0x00030100
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x44
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x44
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6CA0: .word 0x00030100
	thumb_func_end ov121_021E6C5C

	thumb_func_start ov121_021E6CA4
ov121_021E6CA4: ; 0x021E6CA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x34
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x29
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CE8 ; =0x00030100
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x34
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x34
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6CE8: .word 0x00030100
	thumb_func_end ov121_021E6CA4

	thumb_func_start ov121_021E6CEC
ov121_021E6CEC: ; 0x021E6CEC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021E6D78 ; =0x00000232
	add r5, r0, #0
	ldrsb r0, [r5, r1]
	mov r3, #0xc
	add r2, r5, r0
	add r0, r1, #0
	add r0, #0x30
	ldrb r4, [r2, r0]
	add r0, r1, #0
	add r1, #0x2e
	add r0, #0x22
	ldr r2, [r5, r0]
	ldrb r1, [r5, r1]
	mov r0, #0x3c
	mul r0, r1
	add r6, r2, r0
	add r0, r5, #0
	mov r1, #1
	add r0, #0x54
	add r2, r1, #0
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r2, r4, #3
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	add r2, r6, r2
	ldr r2, [r2, #4]
	ldr r0, [r5, #0x68]
	ldr r2, [r2, #8]
	mov r1, #0
	bl BufferString
	ldr r0, [r5, #0x68]
	ldr r1, [r5, #0x64]
	mov r2, #0x31
	mov r3, #0x9e
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6D7C ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6D78: .word 0x00000232
_021E6D7C: .word 0x00010200
	thumb_func_end ov121_021E6CEC

	thumb_func_start ov121_021E6D80
ov121_021E6D80: ; 0x021E6D80
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #1
	add r5, r0, #0
	add r0, #0x54
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x34
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6DD4 ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6DD4: .word 0x00010200
	thumb_func_end ov121_021E6D80

	thumb_func_start ov121_021E6DD8
ov121_021E6DD8: ; 0x021E6DD8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x24
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x97
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E6DF4
	mov r1, #0x35
	b _021E6DF6
_021E6DF4:
	mov r1, #0x41
_021E6DF6:
	mov r0, #0x26
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	lsl r0, r0, #1
	add r5, r1, r0
	ldr r0, [r4, #0x64]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r4, #0x64]
	add r1, r5, #1
	bl NewString_ReadMsgData
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x24
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x24
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, #0
	bl String_Delete
	add r0, r5, #0
	bl String_Delete
	add r4, #0x24
	add r0, r4, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6E64: .word 0x00010200
	thumb_func_end ov121_021E6DD8

	thumb_func_start ov121_021E6E68
ov121_021E6E68: ; 0x021E6E68
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #1
	add r5, r0, #0
	add r0, #0x54
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x30
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6EBC ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6EBC: .word 0x00010200
	thumb_func_end ov121_021E6E68

	thumb_func_start ov121_021E6EC0
ov121_021E6EC0: ; 0x021E6EC0
	push {r4, r5, lr}
	sub sp, #0x14
	mov r2, #0x95
	lsl r2, r2, #2
	add r3, r2, #0
	add r4, r0, #0
	add r3, #0xc
	ldrb r5, [r4, r3]
	mov r3, #0x3c
	ldr r1, [r4, r2]
	mul r3, r5
	add r1, r1, r3
	add r3, r2, #0
	sub r3, #0x22
	ldrsb r3, [r4, r3]
	add r1, r1, #4
	add r5, r4, r3
	add r3, r2, #0
	add r3, #0xe
	ldrb r3, [r5, r3]
	lsl r3, r3, #3
	add r3, r1, r3
	add r1, r2, #4
	str r3, [r4, r1]
	ldr r1, [r4, r1]
	ldrb r1, [r1, #6]
	cmp r1, #0xff
	bne _021E6F0C
	mov r1, #3
	sub r2, #0x21
	strb r1, [r4, r2]
	bl ov121_021E6D80
	ldr r0, _021E6F50 ; =0x000005F2
	bl PlaySE
	add sp, #0x14
	pop {r4, r5, pc}
_021E6F0C:
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x8f
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #6
	strb r1, [r0, #0x11]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	bl YesNoPrompt_InitFromTemplate
	add r0, r4, #0
	bl ov121_021E6CEC
	bl ov121_021E6F58
	ldr r0, _021E6F54 ; =0x00000233
	mov r1, #2
	strb r1, [r4, r0]
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021E6F50: .word 0x000005F2
_021E6F54: .word 0x00000233
	thumb_func_end ov121_021E6EC0

	thumb_func_start ov121_021E6F58
ov121_021E6F58: ; 0x021E6F58
	mov r1, #0x1e
	add r2, r1, #0
	ldr r3, _021E6F64 ; =G2x_SetBlendBrightness_
	ldr r0, _021E6F68 ; =0x04000050
	sub r2, #0x25
	bx r3
	.balign 4, 0
_021E6F64: .word G2x_SetBlendBrightness_
_021E6F68: .word 0x04000050
	thumb_func_end ov121_021E6F58

	thumb_func_start ov121_021E6F6C
ov121_021E6F6C: ; 0x021E6F6C
	ldr r0, _021E6F74 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
_021E6F74: .word 0x04000050
	thumb_func_end ov121_021E6F6C

	thumb_func_start ov121_021E6F78
ov121_021E6F78: ; 0x021E6F78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021E700C ; =0x0000025E
	ldrb r0, [r4, r0]
	cmp r0, #0
	ble _021E7008
	ldr r0, [sp, #4]
	str r0, [sp]
_021E6F8E:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	ldr r0, [sp]
	mov r6, #0
	add r1, r2, r0
	ldr r0, [r2, r0]
	add r7, r6, #0
	cmp r0, #0
	ble _021E6FF2
	add r5, r6, #0
_021E6FA4:
	add r0, r1, #4
	add r1, r0, r5
	ldrb r0, [r1, #6]
	mov ip, r0
	cmp r0, #0xff
	beq _021E6FDC
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _021E6FDC
	ldr r1, _021E7010 ; =0x0000025F
	mov r0, #0x8d
	ldrb r3, [r4, r1]
	sub r1, r1, #2
	ldrb r2, [r4, r1]
	mov r1, #0xd
	lsl r0, r0, #2
	mul r1, r2
	add r2, r3, r1
	ldr r1, [sp, #4]
	ldr r0, [r4, r0]
	add r1, r1, r2
	mov r2, ip
	sub r2, r2, r6
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0202E544
	add r6, r6, #1
_021E6FDC:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp]
	ldr r2, [sp]
	add r1, r1, r0
	ldr r0, [r2, r0]
	add r7, r7, #1
	add r5, #8
	cmp r7, r0
	blt _021E6FA4
_021E6FF2:
	ldr r0, [sp]
	add r0, #0x3c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, _021E700C ; =0x0000025E
	ldrb r1, [r4, r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _021E6F8E
_021E7008:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E700C: .word 0x0000025E
_021E7010: .word 0x0000025F
	thumb_func_end ov121_021E6F78

	.rodata

	.global ov121_021E7014
ov121_021E7014:
	.word ov121_021E7110
	.word ov121_021E70C8

	.global ov121_021E701C
ov121_021E701C: ; 0x021E701C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E702C
ov121_021E702C: ; 0x021E702C
	.byte 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00

	.global ov121_021E703C
ov121_021E703C: ; 0x021E703C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E7058
ov121_021E7058: ; 0x021E7058
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.global ov121_021E7074
ov121_021E7074: ; 0x021E7074
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E7090
ov121_021E7090: ; 0x021E7090
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E70AC
ov121_021E70AC: ; 0x021E70AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E70C8
ov121_021E70C8:
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2E, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00

	.global ov121_021E70E8
ov121_021E70E8: ; 0x021E70E8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

	.global ov121_021E7110
ov121_021E7110:
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x2D, 0x00

	.global ov121_021E7140
ov121_021E7140: ; 0x021E7140
	.byte 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	; 0x021E7194
