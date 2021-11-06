	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_116
ScrCmd_116: ; 0x022598C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0
	add r2, r1, #0
	add r5, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	mov r1, #0xf
	and r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	mov r1, #0xf
	and r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	mov r1, #0xf
	and r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	mov r1, #0xf
	and r0, r1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r5, #0
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	mov r1, #0xf
	and r0, r1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r5, #0
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	mov r1, #0xf
	and r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	eor r0, r6
	asr r1, r4, #8
	mul r0, r7
	eor r0, r1
	lsl r1, r4, #0x18
	lsr r3, r1, #0x18
	lsl r0, r0, #0x10
	ldr r2, [sp, #4]
	ldr r1, [sp]
	lsr r0, r0, #0x10
	eor r2, r1
	ldr r1, [sp, #8]
	mul r2, r1
	add r1, r3, #0
	eor r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #8
	add r0, r0, r1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_116

	thumb_func_start ov20_0225996C
ov20_0225996C: ; 0x0225996C
	push {r3, r4}
	ldr r3, _0225999C ; =0x02259C74
	mov r4, #1
	mov r2, #6
_02259974:
	add r1, r4, #0
	mul r1, r2
	add r1, r3, r1
	ldrh r1, [r1, #4]
	cmp r0, r1
	bhs _0225998A
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4}
	bx lr
_0225998A:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #0xf
	blo _02259974
	add r0, r4, #0
	pop {r3, r4}
	bx lr
	nop
_0225999C: .word 0x02259C74
	thumb_func_end ov20_0225996C

	thumb_func_start ov20_022599A0
ov20_022599A0: ; 0x022599A0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #4
	add r5, r1, #0
	bl sub_02091308
	add r4, r0, #0
	mov r1, #0
	mov r2, #4
	bl sub_02091334
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02091410
	add r6, r0, #0
	add r0, r4, #0
	bl sub_020913C4
	add r0, r4, #0
	bl sub_02091320
	add r0, r5, #0
	bl ov20_0225996C
	add r4, r0, #0
	mov r1, #6
	mul r4, r1
	ldr r0, _02259A10 ; =0x02259C78
	ldr r2, _02259A14 ; =0x02259C76
	ldrh r0, [r0, r4]
	ldrh r2, [r2, r4]
	asr r1, r5, #0x1f
	mov r3, #0
	sub r0, r5, r0
	sbc r1, r3
	bl _ll_udiv
	add r2, r0, #0
	add r0, r6, #0
	ldr r6, _02259A18 ; =0x02259C74
	add r3, r1, #0
	mov r5, #0
	ldrh r4, [r6, r4]
	add r1, r5, #0
	add r2, r4, r2
	adc r5, r3
	add r3, r5, #0
	bl _ll_mul
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	pop {r4, r5, r6, pc}
	nop
_02259A10: .word 0x02259C78
_02259A14: .word 0x02259C76
_02259A18: .word 0x02259C74
	thumb_func_end ov20_022599A0

	thumb_func_start ov20_02259A1C
ov20_02259A1C: ; 0x02259A1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	mov r1, #0x10
	add r7, r2, #0
	add r4, r3, #0
	bl FieldSysGetAttrAddr
	add r1, sp, #0x10
	add r5, r0, #0
	ldrh r1, [r1, #0x10]
	add r0, r4, #0
	bl ov20_022599A0
	mov r1, #0xfa
	lsl r1, r1, #2
	mul r1, r0
	add r0, r1, #0
	mov r1, #0xfe
	bl _u32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _u32_div_f
	mov r1, #0xa
	add r4, r0, #0
	bl _u32_div_f
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	mov r0, #0
	add r2, r1, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r5]
	add r1, r7, #0
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov20_02259A1C

	thumb_func_start ScrCmd_390
ScrCmd_390: ; 0x02259A88
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r7, #0
	bl ScrCmd_116
	add r1, sp, #0
	strh r0, [r1, #2]
	ldrh r1, [r1, #2]
	add r0, r4, #0
	bl ov20_022599A0
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066B50
	add r1, sp, #0
	strh r0, [r1]
	ldrh r1, [r1]
	add r0, r4, #0
	bl ov20_022599A0
	add r5, r0, #0
	mov r0, #0xfa
	lsl r0, r0, #2
	mul r0, r7
	mov r1, #0xfe
	bl _u32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	mov r0, #0xfa
	lsl r0, r0, #2
	mul r0, r5
	mov r1, #0xfe
	bl _u32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _u32_div_f
	cmp r4, r0
	bne _02259B2E
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259B2E:
	cmp r4, r0
	bls _02259B36
	mov r0, #2
	b _02259B38
_02259B36:
	mov r0, #0
_02259B38:
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_390

	thumb_func_start ScrCmd_391
ScrCmd_391: ; 0x02259B40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScrCmd_116
	add r1, r0, #0
	lsl r1, r1, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02066B60
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_391

	thumb_func_start ScrCmd_393
ScrCmd_393: ; 0x02259B88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl sub_02066B50
	add r1, sp, #4
	strh r0, [r1]
	ldrh r0, [r1]
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, r5, #0
	bl ov20_02259A1C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_393

	thumb_func_start ScrCmd_392
ScrCmd_392: ; 0x02259BF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	str r0, [sp, #4]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [sp, #4]
	bl ScrCmd_116
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r1, r6, #0x18
	lsl r2, r7, #0x18
	lsl r3, r5, #0x10
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x10
	bl ov20_02259A1C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_392

	.rodata

_02259C74:
	.byte 0x22, 0x01, 0x01, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x01, 0x00, 0x0A, 0x00
	.byte 0x90, 0x01, 0x02, 0x00, 0x6E, 0x00, 0xF4, 0x01, 0x04, 0x00, 0x36, 0x01, 0x58, 0x02, 0x14, 0x00
	.byte 0xC6, 0x02, 0xBC, 0x02, 0x32, 0x00, 0x96, 0x0A, 0x20, 0x03, 0x64, 0x00, 0x1E, 0x1E, 0x84, 0x03
	.byte 0x96, 0x00, 0x2E, 0x45, 0xE8, 0x03, 0x96, 0x00, 0xC6, 0x7F, 0x4C, 0x04, 0x64, 0x00, 0x5E, 0xBA
	.byte 0xB0, 0x04, 0x32, 0x00, 0x6E, 0xE1, 0x14, 0x05, 0x14, 0x00, 0xF6, 0xF4, 0x78, 0x05, 0x05, 0x00
	.byte 0xC6, 0xFC, 0xDC, 0x05, 0x02, 0x00, 0xBA, 0xFE, 0x40, 0x06, 0x01, 0x00, 0x82, 0xFF, 0xA4, 0x06
	.byte 0x01, 0x00, 0xE6, 0xFF
