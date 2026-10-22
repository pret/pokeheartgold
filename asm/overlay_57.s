	.include "macros.inc"
	.include "overlay_57.inc"
	.include "global.inc"

	.text

	.extern ov57_02237E88
	.extern ov57_02237F14
	.extern ov57_02237F3C
	.extern ov57_02237FAC
	.extern ov57_02238028
	.extern ov57_02238134
	.extern ov57_022382F8
	.extern ov57_022383AC
	.extern ov57_022383D0
	.extern ov57_022384C0
	.extern ov57_0223853C
	.extern ov57_0223857C
	.extern ov57_0223866C
	.extern ov57_022387C0
	.extern ov57_022388E4
	.extern ov57_02238958
	.extern ov57_02238A00
	.extern ov57_02238AC0
	.extern ov57_02238AF0
	.extern ov57_02238C30
	.extern ov57_02238D80
	.extern ov57_02238DAC
	.extern ov57_02238FC4
	.extern ov57_02239240
	.extern ov57_022394AC
	.extern ov57_022394D8
	.extern ov57_02239558
	.extern ov57_02239728
	.extern ov57_022397B0
	.extern ov57_022398C4
	.extern ov57_022399F8
	.extern ov57_02239A8C
	.extern ov57_02239B0C
	.extern ov57_02239B2C
	.extern ov57_02239BAC
	.extern ov57_02239BCC
	.extern ov57_0223A034
	.extern ov57_0223A104
	.extern ov57_0223A31C
	.extern ov57_0223A504
	.extern ov57_0223A5AC

	thumb_func_start ov57_0223A6B4
ov57_0223A6B4: ; 0x0223A6B4
	mov r0, #0
	bx lr
	thumb_func_end ov57_0223A6B4

	thumb_func_start ov57_0223A6B8
ov57_0223A6B8: ; 0x0223A6B8
	push {r4, lr}
	ldr r1, _0223A7C4 ; =0x00000404
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0223A6CE
	cmp r1, #1
	beq _0223A708
	cmp r1, #2
	beq _0223A7A6
	b _0223A7C0
_0223A6CE:
	mov r1, #0
	bl ov57_0223B948
	add r0, r4, #0
	bl ov57_022398C4
	add r0, r4, #0
	bl ov57_022399F8
	add r0, r4, #0
	bl ov57_0223B75C
	add r0, r4, #0
	bl ov57_0223B78C
	mov r0, #0xa2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0x41
	lsl r0, r0, #4
	str r1, [r4, r0]
	bl ov57_02239BCC
	ldr r0, _0223A7C4 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A7C0
_0223A708:
	bl ov57_0223B940
	cmp r0, #1
	beq _0223A7C0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A7C0
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	mov r0, #4
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	mov r0, #7
	mov r1, #1
	bl SetBgPriority
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223A034
	add r0, r4, #0
	mov r1, #1
	bl ov57_02239240
	add r0, r4, #0
	mov r1, #1
	bl ov57_022387C0
	add r0, r4, #0
	mov r1, #1
	bl ov57_02238AF0
	ldr r0, _0223A7C8 ; =0x00000434
	mov r1, #0
	ldr r0, [r4, r0]
	bl ManagedSprite_SetAnimationFrame
	ldr r0, _0223A7CC ; =0x00000438
	mov r1, #0
	ldr r0, [r4, r0]
	bl ManagedSprite_SetAnimationFrame
	ldr r0, _0223A7D0 ; =0x0000043C
	mov r1, #0
	ldr r0, [r4, r0]
	bl ManagedSprite_SetAnimationFrame
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	ldr r2, _0223A7D4 ; =0x0000FFFF
	add r0, #0xec
	mov r1, #0
	mov r3, #1
	bl ov57_02239728
	ldr r2, _0223A7D8 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	bl ov57_02239BAC
	ldr r0, _0223A7C4 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A7C0
_0223A7A6:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A7C0
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B948
	ldr r0, _0223A7C4 ; =0x00000404
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #4
	pop {r4, pc}
_0223A7C0:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223A7C4: .word 0x00000404
_0223A7C8: .word 0x00000434
_0223A7CC: .word 0x00000438
_0223A7D0: .word 0x0000043C
_0223A7D4: .word 0x0000FFFF
_0223A7D8: .word 0x04000304
	thumb_func_end ov57_0223A6B8

	thumb_func_start ov57_0223A7DC
ov57_0223A7DC: ; 0x0223A7DC
	push {r4, lr}
	ldr r1, _0223A8F0 ; =0x00000404
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _0223A7F2
	cmp r2, #1
	beq _0223A820
	cmp r2, #2
	beq _0223A8B4
	b _0223A8EC
_0223A7F2:
	add r0, r1, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0223A80C
	add r0, r1, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	add r1, #0xc
	sub r0, r0, #1
	str r0, [r4, r1]
	mov r0, #0
	pop {r4, pc}
_0223A80C:
	mov r0, #0
	add r1, #0xc
	str r0, [r4, r1]
	bl ov57_02239BCC
	ldr r0, _0223A8F0 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A8EC
_0223A820:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A8EC
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #7
	mov r1, #3
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223A034
	add r0, r4, #0
	mov r1, #0
	bl ov57_02239240
	add r0, r4, #0
	mov r1, #0
	bl ov57_022387C0
	add r0, r4, #0
	add r0, #0xec
	mov r1, #1
	bl ClearWindowPixelBuffer
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #3
	mov r2, #7
	mov r3, #0
	bl ov57_02239728
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r4, r0
	bl CopyWindowToVram
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223866C
	ldr r2, _0223A8F4 ; =0x04000304
	ldr r1, _0223A8F8 ; =0xFFFF7FFF
	ldrh r0, [r2]
	and r0, r1
	strh r0, [r2]
	add r0, r4, #0
	asr r1, r1, #0x10
	bl ov57_02238AF0
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	bl ov57_02239BAC
	ldr r0, _0223A8F0 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223A8EC
_0223A8B4:
	bl ov57_0223B940
	cmp r0, #1
	beq _0223A8EC
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0223A8EC
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r1, #0
	add r0, r4, #0
	mov r2, #0xff
	add r3, r1, #0
	bl ov57_0223B828
	add r0, r4, #0
	bl ov57_02239B0C
	ldr r0, _0223A8F0 ; =0x00000404
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0223A8EC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223A8F0: .word 0x00000404
_0223A8F4: .word 0x04000304
_0223A8F8: .word 0xFFFF7FFF
	thumb_func_end ov57_0223A7DC

	thumb_func_start ov57_0223A8FC
ov57_0223A8FC: ; 0x0223A8FC
	push {r4, r5, lr}
	sub sp, #0x24
	ldr r1, _0223AB44 ; =0x00000404
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #5
	bhi _0223A986
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223A916: ; jump table
	.short _0223A922 - _0223A916 - 2 ; case 0
	.short _0223A97A - _0223A916 - 2 ; case 1
	.short _0223AA20 - _0223A916 - 2 ; case 2
	.short _0223AA30 - _0223A916 - 2 ; case 3
	.short _0223AA98 - _0223A916 - 2 ; case 4
	.short _0223AAD2 - _0223A916 - 2 ; case 5
_0223A922:
	bl ov57_022384C0
	cmp r0, #0
	bne _0223A930
	add sp, #0x24
	mov r0, #0xb
	pop {r4, r5, pc}
_0223A930:
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB48 ; =0x0000080B
	mov r1, #2
	bl PaletteData_BeginPaletteFade
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB4C ; =0x0000FFFF
	mov r1, #8
	bl PaletteData_BeginPaletteFade
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	mov r0, #1
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223A97A:
	add r0, #0xe8
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	beq _0223A988
_0223A986:
	b _0223AB3C
_0223A988:
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl PaletteData_SetAutoTransparent
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	add r0, r4, #0
	str r2, [sp, #8]
	mov r1, #0x3a
	str r1, [sp, #0xc]
	add r0, #0xe4
	add r1, #0xf2
	ldr r0, [r0]
	add r1, r4, r1
	mov r3, #2
	bl ov57_022397B0
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r2, sp, #0x10
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #0xe6
	str r0, [sp, #0x18]
	mov r0, #5
	str r0, [sp, #0x1c]
	mov r0, #0x19
	strb r0, [r2, #0x10]
	mov r0, #6
	strb r0, [r2, #0x11]
	ldrb r0, [r2, #0x12]
	mov r1, #0xf
	bic r0, r1
	ldr r1, _0223AB50 ; =0x0000040C
	ldr r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r2, #0x12]
	mov r0, #0x34
	bl YesNoPrompt_Create
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0x10
	bl YesNoPrompt_InitFromTemplate
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #4
	mov r2, #0xe
	mov r3, #0
	bl ov57_02239728
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AA20:
	mov r0, #1
	add r1, r0, #0
	bl GfGfx_EngineBTogglePlanes
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
_0223AA30:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl YesNoPrompt_HandleInput
	add r5, r0, #0
	beq _0223AB3C
	cmp r5, #1
	beq _0223AA46
	cmp r5, #2
	bne _0223AB3C
_0223AA46:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl YesNoPrompt_IsInTouchMode
	ldr r1, _0223AB50 ; =0x0000040C
	str r0, [r4, r1]
	sub r0, r1, #4
	str r5, [r4, r0]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #1
	bl PaletteData_SetAutoTransparent
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl YesNoPrompt_Reset
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl YesNoPrompt_Destroy
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x4b
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AA98:
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB48 ; =0x0000080B
	mov r1, #2
	bl PaletteData_BeginPaletteFade
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AB4C ; =0x0000FFFF
	mov r1, #8
	bl PaletteData_BeginPaletteFade
	ldr r0, _0223AB44 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AB3C
_0223AAD2:
	add r0, #0xe8
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _0223AB3C
	ldr r0, _0223AB54 ; =0x00000408
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223AB26
	cmp r0, #1
	beq _0223AAF0
	cmp r0, #2
	beq _0223AB22
	b _0223AB26
_0223AAF0:
	add r0, r4, #0
	bl ov57_0223B774
	add r0, r4, #0
	bl ov57_0223B7A8
	add r0, r4, #0
	bl ov57_022399F8
	add r0, r4, #0
	bl ov57_022383AC
	add r0, r4, #0
	bl ov57_02237F3C
	add r0, r4, #0
	mov r1, #1
	bl ov57_022383D0
	mov r0, #0x41
	mov r1, #0x14
	lsl r0, r0, #4
	mov r5, #6
	str r1, [r4, r0]
	b _0223AB28
_0223AB22:
	mov r5, #4
	b _0223AB28
_0223AB26:
	mov r5, #7
_0223AB28:
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B948
	ldr r0, _0223AB44 ; =0x00000404
	mov r1, #0
	str r1, [r4, r0]
	add sp, #0x24
	add r0, r5, #0
	pop {r4, r5, pc}
_0223AB3C:
	mov r0, #7
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_0223AB44: .word 0x00000404
_0223AB48: .word 0x0000080B
_0223AB4C: .word 0x0000FFFF
_0223AB50: .word 0x0000040C
_0223AB54: .word 0x00000408
	thumb_func_end ov57_0223A8FC

	thumb_func_start ov57_0223AB58
ov57_0223AB58: ; 0x0223AB58
	push {r4, r5, lr}
	sub sp, #0x84
	ldr r1, _0223AE90 ; =0x00000404
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #7
	bls _0223AB68
	b _0223AE4C
_0223AB68:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223AB74: ; jump table
	.short _0223AB84 - _0223AB74 - 2 ; case 0
	.short _0223ABF6 - _0223AB74 - 2 ; case 1
	.short _0223AC4A - _0223AB74 - 2 ; case 2
	.short _0223ACAC - _0223AB74 - 2 ; case 3
	.short _0223ACF6 - _0223AB74 - 2 ; case 4
	.short _0223AD38 - _0223AB74 - 2 ; case 5
	.short _0223AD7A - _0223AB74 - 2 ; case 6
	.short _0223ADE2 - _0223AB74 - 2 ; case 7
_0223AB84:
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE94 ; =0x0000080B
	mov r1, #2
	bl PaletteData_BeginPaletteFade
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE98 ; =0x0000FFFF
	mov r1, #8
	bl PaletteData_BeginPaletteFade
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223AE9C ; =0x00000408
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov57_0223B7C4
	add r0, r4, #0
	bl ov57_0223B950
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223BB38
	add r0, r4, #0
	mov r1, #0
	add r0, #0xec
	mov r2, #0xd
	add r3, r1, #0
	bl ov57_02239728
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ABF6:
	add r0, #0xe8
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	beq _0223AC04
	b _0223AE88
_0223AC04:
	mov r0, #0x34
	str r0, [sp, #0x60]
	mov r1, #1
	mov r2, #0
	mov r0, #0xff
	str r0, [sp, #0x68]
	add r0, r4, #0
	str r1, [sp, #0x5c]
	str r1, [sp, #0x74]
	str r2, [sp, #0x64]
	str r2, [sp, #0x70]
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #0x9b
	str r0, [sp, #0x78]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x7c]
	ldr r0, _0223AEA0 ; =0x00000458
	ldr r0, [r4, r0]
	bl GetMonData
	str r0, [sp, #0x6c]
	add r0, sp, #0x5c
	bl ov07_02233DB8
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AC4A:
	add r2, sp, #0x38
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	mov r0, #1
	str r0, [sp, #0x38]
	add r0, r1, #0
	add r0, #0x54
	ldr r0, [r4, r0]
	sub r1, #0x18
	str r0, [sp, #0x40]
	ldr r0, [r4, r1]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [sp, #0xc]
	add r0, sp, #0x44
	bl ov57_0223857C
	ldr r0, _0223AEA0 ; =0x00000458
	mov r1, #0xa2
	ldr r0, [r4, r0]
	add r2, sp, #0xc
	bl SetMonData
	ldr r0, _0223AEA0 ; =0x00000458
	mov r1, #0xab
	ldr r0, [r4, r0]
	add r2, sp, #0x44
	bl SetMonData
	mov r0, #0x34
	add r1, sp, #0x38
	bl ov07_02232694
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl ov07_022329B0
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0
	add r0, r0, #4
	str r1, [r4, r0]
	b _0223AE88
_0223ACAC:
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232A04
	cmp r0, #1
	bne _0223AD64
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233EA0
	cmp r0, #1
	bne _0223AD64
	add r0, r4, #0
	bl ov57_0223BA40
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232A44
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223BB38
	add r0, r4, #0
	bl ov57_0223BA1C
	ldr r0, _0223AEA4 ; =0x000006C5
	bl PlaySE
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ACF6:
	bl ov57_0223BA40
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233E88
	cmp r0, #0
	bne _0223AD64
	cmp r5, #0
	bne _0223AD64
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233ECC
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	add r0, r4, #0
	bl ov57_0223B9C8
	ldr r0, _0223AE9C ; =0x00000408
	mov r1, #0
	str r1, [r4, r0]
	sub r1, r0, #4
	ldr r1, [r4, r1]
	sub r0, r0, #4
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AD38:
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232A54
	cmp r0, #0
	bne _0223AD64
	mov r0, #0xa1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02017068
	cmp r0, #1
	bne _0223AD64
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Pokepic_IsAnimFinished
	cmp r0, #0
	beq _0223AD66
_0223AD64:
	b _0223AE88
_0223AD66:
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov07_02232AB8
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AD7A:
	add r0, r1, #4
	ldr r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	blt _0223AE88
	add r0, r1, #4
	mov r2, #0
	str r2, [r4, r0]
	mov r0, #0x34
	mov r3, #1
	str r0, [sp, #0x14]
	mov r0, #5
	str r0, [sp, #0x18]
	mov r0, #0xff
	str r0, [sp, #0x1c]
	add r0, r4, #0
	str r3, [sp, #0x10]
	str r2, [sp, #0x24]
	str r3, [sp, #0x28]
	add r0, #0xdc
	ldr r0, [r0]
	add r1, #0x54
	str r0, [sp, #0x2c]
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x30]
	ldr r0, [r4, r1]
	mov r1, #0x9b
	bl GetMonData
	str r0, [sp, #0x20]
	add r0, sp, #0x10
	bl ov07_02233DB8
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	bl ov57_0223BB5C
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223ADE2:
	bl ov57_0223BABC
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233E88
	cmp r0, #0
	bne _0223AE88
	cmp r5, #0
	bne _0223AE88
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE94 ; =0x0000080B
	mov r1, #2
	bl PaletteData_BeginPaletteFade
	mov r0, #0xa
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	add r0, #0xe8
	ldr r0, [r0]
	ldr r2, _0223AE98 ; =0x0000FFFF
	mov r1, #8
	bl PaletteData_BeginPaletteFade
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223BB38
	add r0, r4, #0
	bl ov57_0223BB4C
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov07_02233ECC
	ldr r0, _0223AE90 ; =0x00000404
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	b _0223AE88
_0223AE4C:
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _0223AE88
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineATogglePlanes
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B948
	mov r1, #0
	ldr r0, _0223AE90 ; =0x00000404
	mov r2, #4
	str r1, [r4, r0]
	sub r0, #8
	str r2, [r4, r0]
	add r4, #0xec
	ldr r2, _0223AE98 ; =0x0000FFFF
	add r0, r4, #0
	add r3, r1, #0
	bl ov57_02239728
	add sp, #0x84
	mov r0, #4
	pop {r4, r5, pc}
_0223AE88:
	mov r0, #5
	add sp, #0x84
	pop {r4, r5, pc}
	nop
_0223AE90: .word 0x00000404
_0223AE94: .word 0x0000080B
_0223AE98: .word 0x0000FFFF
_0223AE9C: .word 0x00000408
_0223AEA0: .word 0x00000458
_0223AEA4: .word 0x000006C5
	thumb_func_end ov57_0223AB58

	thumb_func_start ov57_0223AEA8
ov57_0223AEA8: ; 0x0223AEA8
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	add r6, r1, #0
	cmp r0, #0
	bne _0223AEBC
	b _0223B100
_0223AEBC:
	cmp r5, #0x14
	bls _0223AEC2
	b _0223B0FC
_0223AEC2:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223AECE: ; jump table
	.short _0223B036 - _0223AECE - 2 ; case 0
	.short _0223B036 - _0223AECE - 2 ; case 1
	.short _0223B036 - _0223AECE - 2 ; case 2
	.short _0223B036 - _0223AECE - 2 ; case 3
	.short _0223B036 - _0223AECE - 2 ; case 4
	.short _0223B036 - _0223AECE - 2 ; case 5
	.short _0223B036 - _0223AECE - 2 ; case 6
	.short _0223B036 - _0223AECE - 2 ; case 7
	.short _0223AEF8 - _0223AECE - 2 ; case 8
	.short _0223AF42 - _0223AECE - 2 ; case 9
	.short _0223AF90 - _0223AECE - 2 ; case 10
	.short _0223AFBE - _0223AECE - 2 ; case 11
	.short _0223AFFC - _0223AECE - 2 ; case 12
	.short _0223B0CC - _0223AECE - 2 ; case 13
	.short _0223B0CC - _0223AECE - 2 ; case 14
	.short _0223B0CC - _0223AECE - 2 ; case 15
	.short _0223B0CC - _0223AECE - 2 ; case 16
	.short _0223B0CC - _0223AECE - 2 ; case 17
	.short _0223B0CC - _0223AECE - 2 ; case 18
	.short _0223B0CC - _0223AECE - 2 ; case 19
	.short _0223B0CC - _0223AECE - 2 ; case 20
_0223AEF8:
	cmp r6, #0
	bne _0223AF36
	ldr r1, _0223B104 ; =0x00000448
	ldr r0, [r4, r1]
	cmp r0, #0
	ble _0223AF06
	b _0223AF0A
_0223AF06:
	add r0, r1, #4
	ldr r0, [r4, r0]
_0223AF0A:
	sub r0, r0, #1
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov57_02238AC0
	ldr r1, _0223B104 ; =0x00000448
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	add r0, r4, #0
	bl ov57_02238958
	add r0, r4, #0
	bl ov57_02238A00
	add r0, r4, #0
	bl ov57_022399F8
	ldr r0, _0223B108 ; =0x000006C4
	bl PlaySE
_0223AF36:
	ldr r0, _0223B10C ; =0x00000434
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AF42:
	cmp r6, #0
	bne _0223AF84
	ldr r1, _0223B104 ; =0x00000448
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl _s32_div_f
	ldr r0, _0223B104 ; =0x00000448
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov57_02238AC0
	ldr r1, _0223B104 ; =0x00000448
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl ov57_022388E4
	add r0, r4, #0
	bl ov57_02238958
	add r0, r4, #0
	bl ov57_02238A00
	add r0, r4, #0
	bl ov57_022399F8
	ldr r0, _0223B108 ; =0x000006C4
	bl PlaySE
_0223AF84:
	ldr r0, _0223B110 ; =0x00000438
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AF90:
	cmp r6, #0
	bne _0223AFB2
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #5
	beq _0223AFA8
	mov r1, #5
	str r1, [r4, r0]
	ldr r0, _0223B114 ; =0x000005DD
	bl PlaySE
_0223AFA8:
	ldr r0, _0223B118 ; =0x0000043C
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov57_0223B90C
_0223AFB2:
	ldr r0, _0223B118 ; =0x0000043C
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AFBE:
	cmp r6, #0
	bne _0223AFEE
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #6
	beq _0223AFDE
	mov r1, #6
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B11C ; =0x000005E2
	bl PlaySE
_0223AFDE:
	mov r0, #0x11
	mov r1, #0x26
	lsl r0, r0, #6
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
_0223AFEE:
	mov r0, #0x11
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223AFFC:
	cmp r6, #0
	bne _0223B02A
	mov r0, #0xff
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #7
	beq _0223B01C
	mov r1, #7
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B114 ; =0x000005DD
	bl PlaySE
_0223B01C:
	ldr r0, _0223B120 ; =0x00000444
	mov r1, #0x99
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
_0223B02A:
	ldr r0, _0223B120 ; =0x00000444
	add r1, r6, #0
	ldr r0, [r4, r0]
	bl ov57_0223B858
	pop {r4, r5, r6, pc}
_0223B036:
	cmp r6, #0
	bne _0223B100
	add r0, r4, #0
	bl ov57_02238028
	cmp r0, #0
	bne _0223B05A
	ldr r0, _0223B124 ; =0x000005F2
	bl PlaySE
	add r4, #0xec
	mov r1, #0
	add r0, r4, #0
	mov r2, #0xf
	add r3, r1, #0
	bl ov57_02239728
	pop {r4, r5, r6, pc}
_0223B05A:
	mov r0, #0x45
	lsl r0, r0, #4
	add r6, r4, r0
	ldrb r1, [r6, r5]
	cmp r1, #0
	beq _0223B0B0
	ldr r0, [r4, #0x64]
	sub r1, r1, #1
	bl SealCaseInventory_GetSealQuantity
	cmp r0, #0
	beq _0223B0B0
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov57_02237FAC
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	ldrb r0, [r6, r5]
	bl CapsuleMenu_GetSealNameIndex
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xec
	bl ov57_02239B2C
	ldr r0, [r4]
	mov r2, #0
	ldrb r1, [r6, r5]
	ldr r0, [r0, #0x20]
	mvn r2, r2
	bl GiveOrTakeSeal
	add r0, r4, #0
	add r1, r5, #0
	bl ov57_02239A8C
	ldr r0, _0223B128 ; =0x000005EB
	bl PlaySE
	pop {r4, r5, r6, pc}
_0223B0B0:
	ldrb r0, [r6, r5]
	cmp r0, #0
	beq _0223B100
	ldr r0, _0223B124 ; =0x000005F2
	bl PlaySE
	add r4, #0xec
	mov r1, #0
	add r0, r4, #0
	mov r2, #0x10
	add r3, r1, #0
	bl ov57_02239728
	pop {r4, r5, r6, pc}
_0223B0CC:
	cmp r6, #0
	bne _0223B100
	sub r5, #0xd
	lsl r2, r5, #0x18
	add r0, r4, #0
	lsr r2, r2, #0x18
	bl ov57_022382F8
	lsl r0, r5, #4
	add r1, r4, r0
	mov r0, #0x35
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	bl CapsuleMenu_GetSealNameIndex
	add r4, #0xec
	add r1, r0, #0
	add r0, r4, #0
	bl ov57_02239B2C
	ldr r0, _0223B128 ; =0x000005EB
	bl PlaySE
	pop {r4, r5, r6, pc}
_0223B0FC:
	bl GF_AssertFail
_0223B100:
	pop {r4, r5, r6, pc}
	nop
_0223B104: .word 0x00000448
_0223B108: .word 0x000006C4
_0223B10C: .word 0x00000434
_0223B110: .word 0x00000438
_0223B114: .word 0x000005DD
_0223B118: .word 0x0000043C
_0223B11C: .word 0x000005E2
_0223B120: .word 0x00000444
_0223B124: .word 0x000005F2
_0223B128: .word 0x000005EB
	thumb_func_end ov57_0223AEA8

	thumb_func_start ov57_0223B12C
ov57_0223B12C: ; 0x0223B12C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223B178 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0223B156
	bl System_GetTouchHeld
	cmp r0, #0
	beq _0223B144
	mov r0, #0
	pop {r4, pc}
_0223B144:
	ldr r0, _0223B17C ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0223B174
	ldr r0, _0223B178 ; =0x0000040C
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0223B156:
	ldr r0, _0223B17C ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0223B162
	mov r0, #0
	pop {r4, pc}
_0223B162:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _0223B174
	ldr r0, _0223B178 ; =0x0000040C
	mov r1, #1
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
_0223B174:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0223B178: .word 0x0000040C
_0223B17C: .word gSystem
	thumb_func_end ov57_0223B12C

	thumb_func_start ov57_0223B180
ov57_0223B180: ; 0x0223B180
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B1A0 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B198
	add r0, r4, #0
	bl ov57_0223B288
	pop {r4, pc}
_0223B198:
	add r0, r4, #0
	bl ov57_0223B2EC
	pop {r4, pc}
	.balign 4, 0
_0223B1A0: .word 0x0000040C
	thumb_func_end ov57_0223B180

	thumb_func_start ov57_0223B1A4
ov57_0223B1A4: ; 0x0223B1A4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	beq _0223B1B4
	cmp r4, #0xd
	beq _0223B1C6
	b _0223B1FA
_0223B1B4:
	ldr r0, _0223B27C ; =0x000005DD
	bl PlaySE
	ldr r0, [r5]
	mov r1, #0
	bl ov57_02237E88
	mov r0, #5
	pop {r3, r4, r5, pc}
_0223B1C6:
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #3
	mov r2, #8
	mov r3, #0
	bl ov57_02239728
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r1, #0xfc
	mov r2, #1
	add r3, r5, #0
	bl ov57_02238C30
	ldr r0, _0223B280 ; =0x000005DC
	bl PlaySE
	mov r0, #4
	pop {r3, r4, r5, pc}
_0223B1FA:
	bl ov57_02238134
	add r0, r5, #0
	bl ov57_0223853C
	add r0, r5, #0
	bl ov57_022394AC
	mov r0, #0xfb
	lsl r0, r0, #2
	str r4, [r5, r0]
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl ov57_0223B504
	add r0, r5, #0
	bl ov57_022383AC
	add r0, r5, #0
	bl ov57_02237F3C
	add r0, r5, #0
	mov r1, #1
	bl ov57_022383D0
	add r0, r5, #0
	bl ov57_02237F14
	ldr r0, _0223B284 ; =0x0000040C
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223B244
	ldr r0, _0223B280 ; =0x000005DC
	bl PlaySE
	b _0223B278
_0223B244:
	mov r0, #0x47
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #3
	mov r2, #8
	mov r3, #0
	bl ov57_02239728
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r1, #0xfc
	mov r2, #1
	add r3, r5, #0
	bl ov57_02238C30
	ldr r0, _0223B280 ; =0x000005DC
	bl PlaySE
	mov r0, #4
	pop {r3, r4, r5, pc}
_0223B278:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B27C: .word 0x000005DD
_0223B280: .word 0x000005DC
_0223B284: .word 0x0000040C
	thumb_func_end ov57_0223B1A4

	thumb_func_start ov57_0223B288
ov57_0223B288: ; 0x0223B288
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0223B2E8 ; =gSystem
	mov r1, #2
	ldr r3, [r2, #0x48]
	add r4, r0, #0
	tst r1, r3
	beq _0223B2A2
	mov r1, #0xc
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
_0223B2A2:
	mov r1, #1
	tst r1, r3
	beq _0223B2B2
	mov r1, #0xd
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
_0223B2B2:
	ldr r1, [r2, #0x4c]
	mov r0, #0xf0
	tst r0, r1
	bne _0223B2C0
	add sp, #4
	mov r0, #3
	pop {r3, r4, pc}
_0223B2C0:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp]
	add r0, sp, #0
	bl ov57_0223B478
	cmp r0, #0
	bne _0223B2D8
	add sp, #4
	mov r0, #3
	pop {r3, r4, pc}
_0223B2D8:
	ldr r1, [sp]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov57_0223B1A4
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223B2E8: .word gSystem
	thumb_func_end ov57_0223B288

	thumb_func_start ov57_0223B2EC
ov57_0223B2EC: ; 0x0223B2EC
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B578
	add r1, r0, #0
	bpl _0223B2FC
	mov r0, #3
	pop {r4, pc}
_0223B2FC:
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov57_0223B1A4
	pop {r4, pc}
	thumb_func_end ov57_0223B2EC

	thumb_func_start ov57_0223B308
ov57_0223B308: ; 0x0223B308
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B328 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne gApp_MainMenu_SelectOption_ConnectToRanger
	add r0, r4, #0
	bl ov57_0223B3F8
	pop {r4, pc}
gApp_MainMenu_SelectOption_ConnectToRanger:
	add r0, r4, #0
	bl ov57_0223B45C
	pop {r4, pc}
	.balign 4, 0
_0223B328: .word 0x0000040C
	thumb_func_end ov57_0223B308

	thumb_func_start ov57_0223B32C
ov57_0223B32C: ; 0x0223B32C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r2, [r4, r0]
	sub r0, r0, #4
	ldr r3, [r4, r0]
	cmp r3, r2
	bne _0223B340
	mov r1, #0
_0223B340:
	cmp r1, #0
	beq _0223B36E
	add r0, r4, #0
	add r1, r3, #0
	bl ov57_022394D8
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov57_0223B504
	add r4, #0xec
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xb
	mov r3, #1
	bl ov57_02239728
	ldr r0, _0223B39C ; =0x000005DC
	bl PlaySE
	mov r0, #2
	pop {r4, pc}
_0223B36E:
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetDrawFlag
	mov r0, #0xc7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ManagedSprite_SetAnim
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov57_0223B504
	ldr r0, _0223B3A0 ; =0x000005DD
	bl PlaySE
	mov r0, #3
	pop {r4, pc}
	nop
_0223B39C: .word 0x000005DC
_0223B3A0: .word 0x000005DD
	thumb_func_end ov57_0223B32C

	thumb_func_start ov57_0223B3A4
ov57_0223B3A4: ; 0x0223B3A4
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0xc
	beq _0223B3B2
	cmp r1, #0xd
	beq _0223B3BA
	b _0223B3C2
_0223B3B2:
	mov r1, #0
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3BA:
	mov r1, #1
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3C2:
	mov r2, #0x3f
	lsl r2, r2, #4
	str r1, [r4, r2]
	mov r1, #1
	mov r2, #0
	bl ov57_0223B504
	ldr r0, _0223B3F0 ; =0x0000040C
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0223B3E0
	ldr r0, _0223B3F4 ; =0x000005DC
	bl PlaySE
	b _0223B3EA
_0223B3E0:
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223B32C
	pop {r4, pc}
_0223B3EA:
	mov r0, #1
	pop {r4, pc}
	nop
_0223B3F0: .word 0x0000040C
_0223B3F4: .word 0x000005DC
	thumb_func_end ov57_0223B3A4

	thumb_func_start ov57_0223B3F8
ov57_0223B3F8: ; 0x0223B3F8
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0223B458 ; =gSystem
	mov r1, #2
	ldr r3, [r2, #0x48]
	add r4, r0, #0
	tst r1, r3
	beq _0223B412
	mov r1, #0xc
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
_0223B412:
	mov r1, #1
	tst r3, r1
	beq _0223B422
	mov r1, #0xd
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
_0223B422:
	ldr r2, [r2, #0x4c]
	mov r0, #0xf0
	tst r0, r2
	bne _0223B430
	add sp, #4
	add r0, r1, #0
	pop {r3, r4, pc}
_0223B430:
	mov r0, #0x3f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	str r0, [sp]
	add r0, sp, #0
	bl ov57_0223B478
	cmp r0, #0
	bne _0223B448
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_0223B448:
	ldr r1, [sp]
	add r0, r4, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov57_0223B3A4
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0223B458: .word gSystem
	thumb_func_end ov57_0223B3F8

	thumb_func_start ov57_0223B45C
ov57_0223B45C: ; 0x0223B45C
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B578
	add r1, r0, #0
	bpl _0223B46C
	mov r0, #1
	pop {r4, pc}
_0223B46C:
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov57_0223B3A4
	pop {r4, pc}
	thumb_func_end ov57_0223B45C

	thumb_func_start ov57_0223B478
ov57_0223B478: ; 0x0223B478
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223B500 ; =gSystem
	mov r1, #0x10
	ldr r0, [r0, #0x4c]
	tst r1, r0
	beq _0223B496
	ldr r0, [r4]
	mov r1, #0xc
	add r0, r0, #1
	str r0, [r4]
	bl _s32_div_f
	str r1, [r4]
	b _0223B4FC
_0223B496:
	mov r1, #0x20
	tst r1, r0
	beq _0223B4AE
	ldr r0, [r4]
	cmp r0, #0
	ble _0223B4A8
	sub r0, r0, #1
	str r0, [r4]
	b _0223B4FC
_0223B4A8:
	mov r0, #0xb
	str r0, [r4]
	b _0223B4FC
_0223B4AE:
	mov r1, #0x40
	tst r1, r0
	beq _0223B4D2
	ldr r1, [r4]
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	beq _0223B4CE
	sub r0, r1, #4
	mov r1, #0xc
	str r0, [r4]
	bl _s32_div_f
	str r1, [r4]
	b _0223B4FC
_0223B4CE:
	mov r0, #0
	pop {r4, pc}
_0223B4D2:
	mov r1, #0x80
	tst r0, r1
	beq _0223B4F8
	ldr r1, [r4]
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	cmp r0, #2
	beq _0223B4F4
	add r0, r1, #4
	mov r1, #0xc
	str r0, [r4]
	bl _s32_div_f
	str r1, [r4]
	b _0223B4FC
_0223B4F4:
	mov r0, #0
	pop {r4, pc}
_0223B4F8:
	mov r0, #0
	pop {r4, pc}
_0223B4FC:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223B500: .word gSystem
	thumb_func_end ov57_0223B478

	thumb_func_start ov57_0223B504
ov57_0223B504: ; 0x0223B504
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r4, #0
	str r2, [sp]
	cmp r1, #0
	bne _0223B514
	mov r4, #1
_0223B514:
	mov r0, #0xfb
	lsl r0, r0, #2
	lsl r6, r1, #2
	add r7, r5, r0
	add r1, sp, #4
	ldr r0, [r7, r6]
	add r1, #2
	add r2, sp, #4
	bl ov57_02238DAC
	mov r0, #0xc7
	add r1, r5, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #4
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl ManagedSprite_SetPositionXY
	ldr r0, [sp]
	cmp r0, #1
	bne _0223B572
	mov r0, #0xfb
	lsl r0, r0, #2
	add r1, r5, r0
	ldr r0, [r7, r6]
	lsl r4, r4, #2
	str r0, [r1, r4]
	ldr r0, [r1, r4]
	add r1, sp, #4
	add r1, #2
	add r2, sp, #4
	bl ov57_02238DAC
	mov r0, #0xc7
	add r1, r5, r4
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r3, sp, #4
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl ManagedSprite_SetPositionXY
_0223B572:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov57_0223B504

	thumb_func_start ov57_0223B578
ov57_0223B578: ; 0x0223B578
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #4]
	bl System_GetTouchNew
	cmp r0, #0
	bne _0223B58E
	mov r0, #0
	add sp, #0x18
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0223B58E:
	mov r0, #0xfe
	add r6, sp, #0x10
	strb r0, [r6, #2]
	mov r0, #0x18
	add r7, sp, #0x10
	str r0, [sp, #8]
	strb r0, [r6, #5]
	mov r0, #0
	str r0, [sp, #0xc]
	add r7, #2
_0223B5A2:
	ldr r0, [sp, #8]
	mov r4, #0
	strb r0, [r6, #4]
	mov r5, #0x28
_0223B5AA:
	add r0, r7, #0
	strb r5, [r6, #3]
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #0
	beq _0223B5C0
	ldr r0, [sp, #0xc]
	add sp, #0x18
	lsl r0, r0, #2
	add r0, r4, r0
	pop {r3, r4, r5, r6, r7, pc}
_0223B5C0:
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #4
	blt _0223B5AA
	ldr r0, [sp, #8]
	add r0, #0x38
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _0223B5A2
	ldr r0, _0223B618 ; =ov57_0223BEB0
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0223B614
	lsr r1, r0, #0x16
	add r0, sp, #0x10
	strh r1, [r0]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, _0223B61C ; =gSystem + 0x40
	add r0, #0xe4
	ldrh r2, [r3, #0x20]
	str r0, [sp, #4]
	ldrh r3, [r3, #0x22]
	ldr r0, [r0]
	mov r1, #3
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _0223B610
	mov r4, #0
	mvn r4, r4
	b _0223B612
_0223B610:
	add r4, #0xc
_0223B612:
	add r0, r4, #0
_0223B614:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B618: .word ov57_0223BEB0
_0223B61C: .word gSystem + 0x40
	thumb_func_end ov57_0223B578

	thumb_func_start ov57_0223B620
ov57_0223B620: ; 0x0223B620
	push {r4, lr}
	add r4, r0, #0
	bl ov57_0223B12C
	ldr r0, _0223B6D8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0223B668
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B646
	ldr r0, _0223B6DC ; =0x000005F2
	bl PlaySE
	mov r0, #4
	pop {r4, pc}
_0223B646:
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B6E0 ; =0x000005E2
	bl PlaySE
	mov r0, #0x11
	mov r1, #0x26
	lsl r0, r0, #6
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
	mov r0, #6
	pop {r4, pc}
_0223B668:
	mov r0, #2
	tst r0, r1
	beq _0223B6A2
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B682
	ldr r0, _0223B6DC ; =0x000005F2
	bl PlaySE
	mov r0, #4
	pop {r4, pc}
_0223B682:
	add r0, r4, #0
	mov r1, #0
	bl ov57_0223B948
	ldr r0, _0223B6E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _0223B6E8 ; =0x00000444
	mov r1, #0x99
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	bl ov57_0223B90C
	mov r0, #7
	pop {r4, pc}
_0223B6A2:
	mov r0, #3
	lsl r0, r0, #0xa
	tst r0, r1
	beq _0223B6D2
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0xff
	beq _0223B6BE
	ldr r0, _0223B6DC ; =0x000005F2
	bl PlaySE
	mov r0, #4
	pop {r4, pc}
_0223B6BE:
	ldr r0, _0223B6E4 ; =0x000005DD
	bl PlaySE
	ldr r0, _0223B6EC ; =0x0000043C
	mov r1, #0
	ldr r0, [r4, r0]
	bl ov57_0223B90C
	mov r0, #5
	pop {r4, pc}
_0223B6D2:
	mov r0, #4
	pop {r4, pc}
	nop
_0223B6D8: .word gSystem
_0223B6DC: .word 0x000005F2
_0223B6E0: .word 0x000005E2
_0223B6E4: .word 0x000005DD
_0223B6E8: .word 0x00000444
_0223B6EC: .word 0x0000043C
	thumb_func_end ov57_0223B620

	thumb_func_start ov57_0223B6F0
ov57_0223B6F0: ; 0x0223B6F0
	push {r3, lr}
	mov r1, #1
	mov r2, #0
	mov r3, #3
	bl ov57_0223B828
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B6F0

	thumb_func_start ov57_0223B700
ov57_0223B700: ; 0x0223B700
	push {r4, lr}
	add r4, r0, #0
	bl ov57_02238D80
	add r0, r4, #0
	mov r1, #1
	bl ov57_0223866C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov57_0223B700

	thumb_func_start ov57_0223B714
ov57_0223B714: ; 0x0223B714
	push {r4, lr}
	add r4, r0, #0
	bl ov57_02238134
	add r0, r4, #0
	bl ov57_0223853C
	add r0, r4, #0
	bl ov57_022394AC
	ldr r0, [r4]
	mov r1, #1
	bl ov57_02237E88
	mov r0, #0xff
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov57_0223B714

	thumb_func_start ov57_0223B73C
ov57_0223B73C: ; 0x0223B73C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #3
	bl ov57_0223B828
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B73C

	thumb_func_start ov57_0223B74C
ov57_0223B74C: ; 0x0223B74C
	push {r3, lr}
	mov r1, #3
	mov r2, #0
	add r3, r1, #0
	bl ov57_0223B828
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov57_0223B74C

	thumb_func_start ov57_0223B75C
ov57_0223B75C: ; 0x0223B75C
	add r1, r0, #0
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r3, _0223B770 ; =CopyCapsule
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r0, [r0, #8]
	add r1, #0x68
	bx r3
	.balign 4, 0
_0223B770: .word CopyCapsule
	thumb_func_end ov57_0223B75C

	thumb_func_start ov57_0223B774
ov57_0223B774: ; 0x0223B774
	mov r1, #0xfb
	add r2, r0, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	ldr r3, _0223B788 ; =CopyCapsule
	lsl r1, r1, #3
	add r1, r2, r1
	add r0, #0x68
	ldr r1, [r1, #8]
	bx r3
	.balign 4, 0
_0223B788: .word CopyCapsule
	thumb_func_end ov57_0223B774

	thumb_func_start ov57_0223B78C
ov57_0223B78C: ; 0x0223B78C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223B792:
	ldr r0, [r5, #0x64]
	add r1, r4, #0
	bl SealCaseInventory_GetSealQuantity
	add r1, r5, r4
	add r1, #0x80
	add r4, r4, #1
	strb r0, [r1]
	cmp r4, #0x51
	blt _0223B792
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_0223B78C

	thumb_func_start ov57_0223B7A8
ov57_0223B7A8: ; 0x0223B7A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223B7AE:
	add r2, r5, r4
	add r2, #0x80
	ldrb r2, [r2]
	ldr r0, [r5, #0x64]
	add r1, r4, #0
	bl SealCaseInventory_SetSealQuantity
	add r4, r4, #1
	cmp r4, #0x51
	blt _0223B7AE
	pop {r3, r4, r5, pc}
	thumb_func_end ov57_0223B7A8

	thumb_func_start ov57_0223B7C4
ov57_0223B7C4: ; 0x0223B7C4
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xfb
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	lsl r0, r0, #3
	add r0, r5, r0
	ldr r0, [r0, #4]
	cmp r0, #0xff
	beq _0223B7EA
	ldr r2, [r5]
	lsl r0, r0, #2
	add r0, r2, r0
	add r1, #0x6c
	ldr r0, [r0, #4]
	ldr r1, [r5, r1]
	bl CopyPokemonToPokemon
	pop {r3, r4, r5, r6, r7, pc}
_0223B7EA:
	ldr r1, [r5]
	mov r6, #0
	ldr r0, [r1]
	cmp r0, #0
	ble _0223B820
	add r4, r6, #0
_0223B7F6:
	add r0, r1, r4
	ldr r7, [r0, #4]
	mov r1, #0x4c
	add r0, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0223B814
	ldr r1, _0223B824 ; =0x00000458
	add r0, r7, #0
	ldr r1, [r5, r1]
	bl CopyPokemonToPokemon
	pop {r3, r4, r5, r6, r7, pc}
_0223B814:
	ldr r1, [r5]
	add r6, r6, #1
	ldr r0, [r1]
	add r4, r4, #4
	cmp r6, r0
	blt _0223B7F6
_0223B820:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223B824: .word 0x00000458
	thumb_func_end ov57_0223B7C4

	thumb_func_start ov57_0223B828
ov57_0223B828: ; 0x0223B828
	push {r3, r4}
	cmp r2, #0xff
	bne _0223B83A
	mov r2, #1
	lsl r2, r2, #0xa
	ldr r4, [r0, r2]
	sub r2, r2, #4
	str r4, [r0, r2]
	b _0223B840
_0223B83A:
	mov r4, #0xff
	lsl r4, r4, #2
	str r2, [r0, r4]
_0223B840:
	mov r2, #0xfd
	lsl r2, r2, #2
	str r1, [r0, r2]
	add r1, r2, #0
	add r1, #0xc
	str r3, [r0, r1]
	mov r1, #0
	add r2, #0x10
	str r1, [r0, r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov57_0223B828

	thumb_func_start ov57_0223B858
ov57_0223B858: ; 0x0223B858
	push {r3, lr}
	cmp r1, #3
	bhi _0223B88A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223B86A: ; jump table
	.short _0223B872 - _0223B86A - 2 ; case 0
	.short _0223B882 - _0223B86A - 2 ; case 1
	.short _0223B87A - _0223B86A - 2 ; case 2
	.short _0223B882 - _0223B86A - 2 ; case 3
_0223B872:
	mov r1, #1
	bl ManagedSprite_SetAnimationFrame
	pop {r3, pc}
_0223B87A:
	mov r1, #2
	bl ManagedSprite_SetAnimationFrame
	pop {r3, pc}
_0223B882:
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	pop {r3, pc}
_0223B88A:
	bl GF_AssertFail
	pop {r3, pc}
	thumb_func_end ov57_0223B858

	thumb_func_start ov57_0223B890
ov57_0223B890: ; 0x0223B890
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	beq _0223B8B4
	add r1, sp, #4
	add r2, sp, #0
	bl sub_02013794
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r1, r4
	add r2, r2, r6
	bl sub_020136B4
_0223B8B4:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov57_0223B890

	thumb_func_start ov57_0223B8B8
ov57_0223B8B8: ; 0x0223B8B8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	beq _0223B8CA
	cmp r0, #6
	beq _0223B8E4
	b _0223B904
_0223B8CA:
	mov r1, #0
	ldr r0, [r4, #8]
	sub r2, r1, #1
	bl ov57_0223B890
	ldr r0, [r4, #4]
	mov r1, #2
	bl ManagedSprite_SetAnimationFrame
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0223B8E4:
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #2
	bl ov57_0223B890
	ldr r0, [r4, #4]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	add r0, r5, #0
	bl SysTask_Destroy
	add r0, r4, #0
	bl Heap_Free
	pop {r3, r4, r5, pc}
_0223B904:
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov57_0223B8B8

	thumb_func_start ov57_0223B90C
ov57_0223B90C: ; 0x0223B90C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0x34
	mov r1, #0xc
	bl Heap_Alloc
	add r4, r0, #0
	mov r0, #1
	str r0, [r4]
	mov r1, #0
	str r6, [r4, #4]
	add r0, r5, #0
	sub r2, r1, #1
	str r5, [r4, #8]
	bl ov57_0223B890
	mov r2, #0xfa
	ldr r0, _0223B93C ; =ov57_0223B8B8
	add r1, r4, #0
	lsl r2, r2, #2
	bl SysTask_CreateOnMainQueue
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223B93C: .word ov57_0223B8B8
	thumb_func_end ov57_0223B90C

	thumb_func_start ov57_0223B940
ov57_0223B940: ; 0x0223B940
	mov r1, #0xa
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov57_0223B940

	thumb_func_start ov57_0223B948
ov57_0223B948: ; 0x0223B948
	add r0, #0xd8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov57_0223B948

	thumb_func_start ov57_0223B950
ov57_0223B950: ; 0x0223B950
	push {r4, r5, r6, lr}
	sub sp, #0x48
	ldr r1, _0223B9BC ; =0x00000458
	add r5, r0, #0
	ldr r1, [r5, r1]
	add r0, sp, #0x38
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	ldr r0, _0223B9BC ; =0x00000458
	mov r1, #5
	ldr r0, [r5, r0]
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, _0223B9BC ; =0x00000458
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_0207083C
	add r6, r0, #0
	mov r0, #0x73
	lsl r0, r0, #2
	str r6, [r5, r0]
	ldr r0, _0223B9C0 ; =0x0000045C
	lsl r2, r4, #0x10
	ldr r0, [r5, r0]
	add r1, sp, #0x10
	lsr r2, r2, #0x10
	mov r3, #1
	bl NARC_ReadPokepicAnimScript
	ldr r0, _0223B9C4 ; =0xFFFFFD80
	add r6, #0x30
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	mov r0, #0x71
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x38
	mov r2, #0xc0
	add r3, r6, #0
	bl PokepicManager_CreatePokepic
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223B9BC: .word 0x00000458
_0223B9C0: .word 0x0000045C
_0223B9C4: .word 0xFFFFFD80
	thumb_func_end ov57_0223B950

	thumb_func_start ov57_0223B9C8
ov57_0223B9C8: ; 0x0223B9C8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223BA14 ; =0x00000458
	mov r1, #5
	ldr r0, [r5, r0]
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, _0223BA14 ; =0x00000458
	ldr r0, [r5, r0]
	bl GetMonNature
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Pokepic_StartAnim
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r2, #0xa1
	str r0, [sp, #8]
	ldr r0, _0223BA18 ; =0x0000045C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #0xbc
	lsl r3, r4, #0x10
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	lsr r3, r3, #0x10
	bl sub_0207294C
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0223BA14: .word 0x00000458
_0223BA18: .word 0x0000045C
	thumb_func_end ov57_0223B9C8

	thumb_func_start ov57_0223BA1C
ov57_0223BA1C: ; 0x0223BA1C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	mov r2, #0
	bl Pokepic_SetAttr
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd
	mov r2, #0
	bl Pokepic_SetAttr
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BA1C

	thumb_func_start ov57_0223BA40
ov57_0223BA40: ; 0x0223BA40
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl Pokepic_GetAttr
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	bne _0223BA5C
	mov r0, #0
	pop {r4, pc}
_0223BA5C:
	add r1, #0xc8
	ldr r0, [r4, r1]
	mov r1, #0xc
	bl Pokepic_GetAttr
	mov r2, #1
	lsl r2, r2, #8
	cmp r0, r2
	blt _0223BA8E
	add r0, r2, #0
	add r0, #0xc8
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl Pokepic_SetAttr
	mov r0, #0x72
	lsl r0, r0, #2
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, r0]
	add r2, #0xf3
	bl Pokepic_SetAttr
	mov r0, #0
	pop {r4, pc}
_0223BA8E:
	add r2, #0xc8
	ldr r0, [r4, r2]
	mov r1, #0xc
	mov r2, #0x20
	bl Pokepic_AddAttr
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd
	mov r2, #0x20
	bl Pokepic_AddAttr
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200914C
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BA40

	thumb_func_start ov57_0223BABC
ov57_0223BABC: ; 0x0223BABC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl Pokepic_GetAttr
	cmp r0, #0
	bne _0223BAD4
	mov r0, #0
	pop {r4, pc}
_0223BAD4:
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	bl Pokepic_GetAttr
	cmp r0, #0
	bgt _0223BB04
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc
	mov r2, #0
	bl Pokepic_SetAttr
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd
	mov r2, #0
	bl Pokepic_SetAttr
	mov r0, #0
	pop {r4, pc}
_0223BB04:
	mov r0, #0x72
	lsl r0, r0, #2
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2c
	bl Pokepic_AddAttr
	mov r0, #0x72
	lsl r0, r0, #2
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, r0]
	sub r2, #0x2d
	bl Pokepic_AddAttr
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200914C
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BABC

	thumb_func_start ov57_0223BB38
ov57_0223BB38: ; 0x0223BB38
	add r2, r1, #0
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _0223BB48 ; =Pokepic_SetAttr
	mov r1, #6
	bx r3
	nop
_0223BB48: .word Pokepic_SetAttr
	thumb_func_end ov57_0223BB38

	thumb_func_start ov57_0223BB4C
ov57_0223BB4C: ; 0x0223BB4C
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r3, _0223BB58 ; =Pokepic_Delete
	ldr r0, [r0, r1]
	bx r3
	nop
_0223BB58: .word Pokepic_Delete
	thumb_func_end ov57_0223BB4C

	thumb_func_start ov57_0223BB5C
ov57_0223BB5C: ; 0x0223BB5C
	push {r3, lr}
	mov r1, #0
	mov r3, #0x1f
	ldr r0, _0223BB7C ; =0x04000050
	add r2, r1, #0
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	mov r1, #0
	mov r3, #0x1f
	ldr r0, _0223BB80 ; =0x04001050
	add r2, r1, #0
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_0223BB7C: .word 0x04000050
_0223BB80: .word 0x04001050
	thumb_func_end ov57_0223BB5C

	thumb_func_start ov57_0223BB84
ov57_0223BB84: ; 0x0223BB84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	add r1, sp, #0x10
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	mov r7, #0x1f
	lsl r7, r7, #4
	strb r0, [r1, #3]
	ldr r1, _0223BC40 ; =ov57_0223BEF4
	ldr r2, [sp, #4]
	add r3, r7, #1
	add r4, r7, #2
	add r5, r7, #3
_0223BBA4:
	ldrb r6, [r1]
	add r0, r0, #1
	strb r6, [r2, r7]
	ldrb r6, [r1, #1]
	strb r6, [r2, r3]
	ldrb r6, [r1, #2]
	strb r6, [r2, r4]
	ldrb r6, [r1, #3]
	add r1, r1, #4
	strb r6, [r2, r5]
	add r2, r2, #4
	cmp r0, #0xd
	blt _0223BBA4
	cmp r0, #0x15
	bge _0223BC1E
	mov r3, #0x1f
	ldr r2, [sp, #4]
	lsl r3, r3, #4
	add r2, r2, r3
	lsl r4, r0, #2
	ldr r1, [sp, #4]
	ldr r3, [sp, #4]
	add r1, r1, r4
	add r2, r2, r4
	lsl r4, r0, #4
	add r5, sp, #0xc
	add r3, r3, r4
	ldrb r4, [r5, #4]
	strb r4, [r5]
	ldrb r4, [r5, #5]
	strb r4, [r5, #1]
	ldrb r4, [r5, #6]
	strb r4, [r5, #2]
	ldrb r4, [r5, #7]
	strb r4, [r5, #3]
	ldrb r4, [r5, #2]
	ldrb r6, [r5]
	ldrb r7, [r5, #1]
	str r4, [sp, #8]
	ldrb r4, [r5, #3]
	mov ip, r4
_0223BBF6:
	mov r4, #0x1f
	lsl r4, r4, #4
	strb r6, [r1, r4]
	add r4, r4, #1
	strb r7, [r1, r4]
	ldr r5, _0223BC44 ; =0x000001F2
	ldr r4, [sp, #8]
	add r0, r0, #1
	strb r4, [r1, r5]
	add r5, r5, #1
	mov r4, ip
	strb r4, [r1, r5]
	mov r4, #0xa2
	lsl r4, r4, #2
	str r2, [r3, r4]
	add r1, r1, #4
	add r2, r2, #4
	add r3, #0x10
	cmp r0, #0x15
	blt _0223BBF6
_0223BC1E:
	mov r0, #0x34
	str r0, [sp]
	mov r1, #0x1f
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	add r0, r0, r1
	ldr r2, _0223BC48 ; =ov57_0223AEA8
	ldr r3, [sp, #4]
	mov r1, #0x15
	bl TouchHitboxController_Create
	mov r2, #0x7b
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223BC40: .word ov57_0223BEF4
_0223BC44: .word 0x000001F2
_0223BC48: .word ov57_0223AEA8
	thumb_func_end ov57_0223BB84

	thumb_func_start ov57_0223BC4C
ov57_0223BC4C: ; 0x0223BC4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0
	add r4, r5, #4
	lsl r6, r1, #3
	str r0, [sp]
	ldr r0, [r4, r6]
	cmp r0, #0xff
	beq _0223BC70
	ldr r1, [r5]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r0, [r0, #4]
	mov r1, #0xa2
	add r2, sp, #0
	bl SetMonData
_0223BC70:
	mov r0, #0xff
	str r0, [r4, r6]
	add r0, r5, #0
	bl ov57_022394AC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BC4C

	.rodata

	.global ov57_0223BEB0
ov57_0223BEB0: ; 0x0223BEB0
	.byte 0xA8, 0xC0, 0xC0, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00
	.size ov57_0223BEB0,.-ov57_0223BEB0

	.global ov57_0223BEB8
ov57_0223BEB8: ; 0x0223BEB8
	.word ov57_0223A104
	.word ov57_0223A31C
	.word ov57_0223A504
	.word ov57_0223A5AC
	.word ov57_0223A6B4
	.size ov57_0223BEB8,.-ov57_0223BEB8

	.global ov57_0223BECC
ov57_0223BECC: ; 0x0223BECC
	.word 0x00000000, ov57_0223B6F0
	.word 0x00000001, ov57_0223B700
	.word 0x00000002, ov57_0223B714
	.word 0x00000003, ov57_0223B73C
	.word 0x00000004, ov57_0223B74C
	.size ov57_0223BECC,.-ov57_0223BECC

	.global ov57_0223BEF4
ov57_0223BEF4: ; 0x0223BEF4
	.byte 0x10, 0x20, 0x08, 0x18, 0x10, 0x20, 0x40, 0x50, 0x28, 0x38, 0x08, 0x18
	.byte 0x28, 0x38, 0x40, 0x50, 0x40, 0x50, 0x08, 0x18, 0x40, 0x50, 0x40, 0x50, 0x58, 0x68, 0x08, 0x18
	.byte 0x58, 0x68, 0x40, 0x50, 0x68, 0x80, 0x08, 0x30, 0x68, 0x80, 0x38, 0x60, 0xA8, 0xBC, 0x12, 0x4D
	.byte 0xA8, 0xBC, 0x61, 0x9C, 0xA8, 0xBC, 0xB2, 0xED
	.size ov57_0223BEF4,.-ov57_0223BEF4
