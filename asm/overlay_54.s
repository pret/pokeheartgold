	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov54_021E5900
ov54_021E5900: ; 0x021E5900
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x26
	lsl r2, r0, #0x10
	bl CreateHeap
	mov r1, #0xcb
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x26
	bl OverlayManager_CreateAndGetData
	mov r2, #0xcb
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #4]
	bl Options_GetTextSpeed
	ldrh r1, [r4, #0x18]
	mov r2, #0xf
	lsl r0, r0, #0x10
	bic r1, r2
	lsr r2, r0, #0x10
	mov r0, #0xf
	and r0, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl Options_GetBattleScene
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r1, [r4, #0x18]
	mov r2, #0x40
	lsr r0, r0, #0x19
	bic r1, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl Options_GetBattleStyle
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r1, [r4, #0x18]
	mov r2, #0x80
	lsr r0, r0, #0x18
	bic r1, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl Options_GetSoundMethod
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r1, [r4, #0x18]
	mov r2, #0x30
	lsr r0, r0, #0x1a
	bic r1, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl Options_GetButtonMode
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5A08 ; =0xFFFFFCFF
	lsr r0, r0, #0x16
	and r1, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl Options_GetFrame
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1b
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5A0C ; =0xFFFF83FF
	lsr r0, r0, #0x11
	and r1, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #8]
	str r0, [r4, #0x20]
	ldr r0, [r5, #4]
	str r0, [r4, #0x1c]
	mov r0, #0x26
	str r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	bl sub_020183F0
	mov r1, #0x32
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r1, [r4]
	mov r0, #0x28
	bl String_ctor
	mov r1, #0xc9
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5A08: .word 0xFFFFFCFF
_021E5A0C: .word 0xFFFF83FF
	thumb_func_end ov54_021E5900

	thumb_func_start ov54_021E5A10
ov54_021E5A10: ; 0x021E5A10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r0, #1
	bne _021E5AE2
	ldrh r0, [r4, #0x18]
	mov r1, #0xf
	bic r0, r1
	add r1, r4, #0
	add r1, #0x86
	ldrh r2, [r1]
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #0x18]
	mov r1, #0x40
	bic r0, r1
	add r1, r4, #0
	add r1, #0xda
	ldrh r1, [r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x19
	orr r0, r1
	strh r0, [r4, #0x18]
	ldrh r1, [r4, #0x18]
	mov r0, #0x80
	bic r1, r0
	ldr r0, _021E5B30 ; =0x0000012E
	ldrh r2, [r4, r0]
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x18
	orr r1, r2
	strh r1, [r4, #0x18]
	ldrh r1, [r4, #0x18]
	mov r2, #0x30
	bic r1, r2
	add r2, r0, #0
	add r2, #0x54
	ldrh r2, [r4, r2]
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x1a
	orr r1, r2
	strh r1, [r4, #0x18]
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5B34 ; =0xFFFFFCFF
	and r1, r2
	add r2, r0, #0
	add r2, #0xa8
	ldrh r2, [r4, r2]
	add r0, #0xfc
	lsl r2, r2, #0x1e
	lsr r2, r2, #0x16
	orr r1, r2
	strh r1, [r4, #0x18]
	ldrh r0, [r4, r0]
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5B38 ; =0xFFFF83FF
	lsl r0, r0, #0x1b
	and r1, r2
	lsr r0, r0, #0x11
	orr r0, r1
	strh r0, [r4, #0x18]
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl Options_SetTextSpeed
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	bl Options_SetBattleScene
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	bl Options_SetBattleStyle
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1e
	bl Options_SetSoundMethod
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x1e
	bl Options_SetButtonMode
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1b
	bl Options_SetFrame
	b _021E5B08
_021E5AE2:
	cmp r0, #2
	bne _021E5B08
	ldrh r0, [r4, #0x18]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	bl GF_SndSetMonoFlag
	ldrh r1, [r4, #0x18]
	mov r0, #0
	lsl r1, r1, #0x16
	lsr r1, r1, #0x1e
	bl Options_SetButtonModeOnMain
	ldrh r1, [r4, #0x18]
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl Options_SetTextSpeed
_021E5B08:
	mov r0, #0xc9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #1
	bl sub_02002B8C
	add r0, r5, #0
	bl OverlayManager_FreeData
	ldr r0, [r4]
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5B30: .word 0x0000012E
_021E5B34: .word 0xFFFFFCFF
_021E5B38: .word 0xFFFF83FF
	thumb_func_end ov54_021E5A10

	thumb_func_start ov54_021E5B3C
ov54_021E5B3C: ; 0x021E5B3C
	push {r3, r4, lr}
	sub sp, #0xc
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #5
	bls _021E5B4E
	b _021E5C58
_021E5B4E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5B5A: ; jump table
	.short _021E5B66 - _021E5B5A - 2 ; case 0
	.short _021E5B9E - _021E5B5A - 2 ; case 1
	.short _021E5BB6 - _021E5B5A - 2 ; case 2
	.short _021E5BDE - _021E5B5A - 2 ; case 3
	.short _021E5C14 - _021E5B5A - 2 ; case 4
	.short _021E5C44 - _021E5B5A - 2 ; case 5
_021E5B66:
	bl ov54_021E5CE4
	cmp r0, #0
	bne _021E5B74
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E5B74:
	mov r0, #0
	str r0, [r4, #0xc]
	mov r1, #6
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r2, [r4]
	add r3, r0, #0
	str r2, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl ov54_021E6BB8
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
	b _021E5C58
_021E5B9E:
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021E5C58
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E5BB6:
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1e
	beq _021E5BCA
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
	b _021E5C58
_021E5BCA:
	bl ov54_021E681C
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E5BDE:
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
	add r0, r4, #0
	bl ov54_021E6C08
	cmp r0, #0
	bne _021E5C0E
	mov r0, #0
	str r0, [r4, #0xc]
	mov r1, #6
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r1, [r4]
	add r2, r0, #0
	str r1, [sp, #8]
	add r1, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _021E5C58
_021E5C0E:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E5C14:
	mov r0, #0xca
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021E5C2C
	mov r0, #0xca
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	bl sub_020200A0
_021E5C2C:
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021E5C58
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E5C44:
	bl ov54_021E5DBC
	cmp r0, #0
	beq _021E5C52
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E5C52:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E5C58:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov54_021E5B3C

	thumb_func_start ov54_021E5C64
ov54_021E5C64: ; 0x021E5C64
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5C80 ; =ov54_021E6CD8
	add r3, sp, #0
	mov r2, #5
_021E5C6E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5C6E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5C80: .word ov54_021E6CD8
	thumb_func_end ov54_021E5C64

	thumb_func_start ov54_021E5C84
ov54_021E5C84: ; 0x021E5C84
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0xa
	lsr r0, r0, #0x1f
	beq _021E5CB4
	ldr r0, _021E5CD4 ; =0x0000022A
	mov r1, #5
	ldrh r0, [r4, r0]
	mov r2, #0x6d
	mov r3, #0xf
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	bl LoadUserFrameGfx2
	ldr r1, [r4, #0x10]
	ldr r0, _021E5CD8 ; =0xFFDFFFFF
	and r0, r1
	str r0, [r4, #0x10]
_021E5CB4:
	bl sub_0200D034
	bl NNS_GfdDoVramTransfer
	ldr r0, [r4, #0x14]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E5CDC ; =0x027E0000
	ldr r1, _021E5CE0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	add sp, #8
	pop {r4, pc}
	nop
_021E5CD4: .word 0x0000022A
_021E5CD8: .word 0xFFDFFFFF
_021E5CDC: .word 0x027E0000
_021E5CE0: .word 0x00003FF8
	thumb_func_end ov54_021E5C84

	thumb_func_start ov54_021E5CE4
ov54_021E5CE4: ; 0x021E5CE4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5CF8
	cmp r1, #1
	beq _021E5D48
	cmp r1, #2
	beq _021E5D62
	b _021E5D9C
_021E5CF8:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5DA8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5DAC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bl ov54_021E5C64
	ldr r2, _021E5DB0 ; =0x04000304
	ldr r0, _021E5DB4 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	add r0, r4, #0
	bl ov54_021E5E6C
	add r0, r4, #0
	bl ov54_021E6A7C
	b _021E5D9C
_021E5D48:
	bl ov54_021E5F40
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x2d
	bl NewMsgDataFromNarc
	str r0, [r4, #0x28]
	add r0, r4, #0
	bl ov54_021E6360
	b _021E5D9C
_021E5D62:
	bl ov54_021E6004
	add r0, r4, #0
	bl ov54_021E6238
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	bl sub_0203A964
	add r0, r4, #0
	bl ov54_021E6B5C
	ldr r0, _021E5DB8 ; =ov54_021E5C84
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	mov r1, #1
	str r0, [r4, #8]
	bl ToggleBgLayer
	mov r0, #1
	pop {r4, pc}
_021E5D9C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	nop
_021E5DA8: .word 0xFFFFE0FF
_021E5DAC: .word 0x04001000
_021E5DB0: .word 0x04000304
_021E5DB4: .word 0xFFFF7FFF
_021E5DB8: .word ov54_021E5C84
	thumb_func_end ov54_021E5CE4

	thumb_func_start ov54_021E5DBC
ov54_021E5DBC: ; 0x021E5DBC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021E5DCC
	cmp r0, #1
	beq _021E5E24
	b _021E5E56
_021E5DCC:
	bl GF_DestroyVramTransferManager
	ldr r0, [sp]
	bl ov54_021E6164
	ldr r6, [sp]
	mov r7, #0
_021E5DDA:
	add r0, r6, #0
	add r0, #0x84
	ldrh r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _021E5E00
	add r5, r6, #0
_021E5DE8:
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	bl String_dtor
	add r0, r6, #0
	add r0, #0x84
	ldrh r0, [r0]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _021E5DE8
_021E5E00:
	add r7, r7, #1
	add r6, #0x54
	cmp r7, #6
	blt _021E5DDA
	ldr r0, [sp]
	ldr r0, [r0, #0x28]
	bl DestroyMsgData
	ldr r0, [sp]
	bl ov54_021E6000
	ldr r0, [sp]
	bl ov54_021E5F0C
	ldr r0, [sp]
	bl ov54_021E6B34
	b _021E5E56
_021E5E24:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5E64 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5E68 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0, #8]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5E56:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #8]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5E64: .word 0xFFFFE0FF
_021E5E68: .word 0x04001000
	thumb_func_end ov54_021E5DBC

	thumb_func_start ov54_021E5E6C
ov54_021E5E6C: ; 0x021E5E6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	add r5, r0, #0
	ldr r0, [r5]
	bl BgConfig_Alloc
	add r3, sp, #0
	ldr r4, _021E5F00 ; =ov54_021E6C48
	str r0, [r5, #0x14]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021E5F04 ; =ov54_021E6E20
	add r3, sp, #0x10
	mov r2, #0x11
_021E5E94:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5E94
	ldr r0, [r4]
	ldr r4, _021E5F08 ; =ov54_021E6C58
	str r0, [r3]
	mov r7, #0
	add r6, sp, #0x10
_021E5EA6:
	ldr r1, [r4]
	ldr r0, [r5, #0x14]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r1, [r4]
	ldr r0, [r5, #0x14]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r7, r7, #1
	add r6, #0x1c
	add r4, r4, #4
	cmp r7, #5
	blt _021E5EA6
	mov r0, #0
	ldr r3, [r5]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r3, [r5]
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r5]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r5]
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5F00: .word ov54_021E6C48
_021E5F04: .word ov54_021E6E20
_021E5F08: .word ov54_021E6C58
	thumb_func_end ov54_021E5E6C

	thumb_func_start ov54_021E5F0C
ov54_021E5F0C: ; 0x021E5F0C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov54_021E5F0C

	thumb_func_start ov54_021E5F40
ov54_021E5F40: ; 0x021E5F40
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #3
	str r0, [sp, #4]
	mov r0, #0x48
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	mov r0, #0x48
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #0x13
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	mov r0, #0x48
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x48
	mov r1, #2
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r4]
	mov r1, #7
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	mov r0, #0x48
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #0x11
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	mov r0, #0x48
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r4]
	mov r1, #0x12
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	mov r0, #0x48
	bl GfGfxLoader_LoadScrnData
	ldr r3, [r4, #0x10]
	ldr r0, [r4, #0x14]
	lsl r3, r3, #0x1b
	lsr r3, r3, #0x1d
	lsl r4, r3, #2
	ldr r3, _021E5FFC ; =ov54_021E6C80
	mov r1, #0
	ldr r3, [r3, r4]
	mov r2, #3
	bl BgSetPosTextAndCommit
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E5FFC: .word ov54_021E6C80
	thumb_func_end ov54_021E5F40

	thumb_func_start ov54_021E6000
ov54_021E6000: ; 0x021E6000
	bx lr
	.balign 4, 0
	thumb_func_end ov54_021E6000

	thumb_func_start ov54_021E6004
ov54_021E6004: ; 0x021E6004
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x10]
	add r1, r4, #0
	mov r2, #1
	ldr r0, [r4, #0x14]
	add r1, #0x34
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #3
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x2e
	str r0, [sp, #0x10]
	add r1, r4, #0
	mov r2, #1
	ldr r0, [r4, #0x14]
	add r1, #0x44
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E615C ; =0x0000024A
	add r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x14]
	add r1, #0x64
	mov r2, #1
	mov r3, #0x18
	bl AddWindowParameterized
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x54
	mov r2, #5
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E6160 ; =0x0000025F
	add r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x14]
	add r1, #0x74
	mov r2, #1
	mov r3, #0xf
	bl AddWindowParameterized
	ldrh r0, [r4, #0x18]
	mov r1, #5
	mov r2, #0x6d
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	mov r3, #0xf
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	bl LoadUserFrameGfx2
	mov r1, #0x1a
	ldr r2, [r4]
	mov r0, #0
	lsl r1, r1, #4
	bl LoadFontPal0
	mov r1, #0x1a
	ldr r2, [r4]
	mov r0, #4
	lsl r1, r1, #4
	bl LoadFontPal0
	mov r1, #6
	ldr r2, [r4]
	mov r0, #0
	lsl r1, r1, #6
	bl LoadFontPal1
	mov r1, #6
	ldr r2, [r4]
	mov r0, #4
	lsl r1, r1, #6
	bl LoadFontPal1
	add r0, r4, #0
	add r0, #0x34
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x44
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x74
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x54
	bl ClearWindowTilemap
	add r0, r4, #0
	add r0, #0x44
	bl ClearWindowTilemap
	add r0, r4, #0
	add r0, #0x34
	bl ClearWindowTilemap
	add r4, #0x54
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x6d
	mov r3, #0xf
	bl DrawFrameAndWindow2
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021E615C: .word 0x0000024A
_021E6160: .word 0x0000025F
	thumb_func_end ov54_021E6004

	thumb_func_start ov54_021E6164
ov54_021E6164: ; 0x021E6164
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x44
	mov r1, #0
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r6, #0
	add r5, #0x34
	add r7, r6, #0
_021E6180:
	lsl r4, r6, #4
	add r0, r5, r4
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, r4
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r0, r5, r4
	bl ClearWindowTilemap
	add r0, r5, r4
	bl RemoveWindow
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #5
	blo _021E6180
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov54_021E6164

	thumb_func_start ov54_021E61A8
ov54_021E61A8: ; 0x021E61A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	add r4, r1, #0
	add r6, r2, #0
	bl Options_GetTextFrameDelay
	add r7, r0, #0
	mov r0, #0xca
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021E61D2
	mov r0, #0xca
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	bl sub_020200A0
_021E61D2:
	ldr r1, _021E6230 ; =0x0000022A
	ldr r0, [r5, #0x28]
	ldrh r1, [r5, r1]
	add r2, r4, #0
	add r1, #0x28
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	cmp r6, #0
	ldr r0, _021E6234 ; =0x0001020F
	beq _021E620C
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r5, #0x54
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	mov r3, #4
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E620C:
	mov r1, #0
	str r1, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r0, #0x54
	mov r1, #1
	add r2, r4, #0
	mov r3, #4
	bl AddTextPrinterParameterized2
	mov r1, #0xca
	lsl r1, r1, #2
	strb r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6230: .word 0x0000022A
_021E6234: .word 0x0001020F
	thumb_func_end ov54_021E61A8

	thumb_func_start ov54_021E6238
ov54_021E6238: ; 0x021E6238
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r1, [r6]
	mov r0, #0x28
	bl String_ctor
	add r5, r0, #0
	ldr r0, [r6, #0x28]
	mov r1, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r0, #5
	str r0, [sp]
	mov r1, #0
	ldr r0, _021E635C ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r0, #0x34
	add r2, r5, #0
	mov r3, #2
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl StringSetEmpty
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #1
	bl ov54_021E61A8
	add r7, r6, #0
	mov r4, #0
	add r7, #0x44
_021E6282:
	add r0, r5, #0
	bl StringSetEmpty
	ldr r0, [r6, #0x28]
	add r1, r4, #1
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r0, #0x18
	mul r0, r4
	add r0, r0, #5
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E635C ; =0x000F0200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r2, r5, #0
	mov r3, #4
	bl AddTextPrinterParameterized2
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _021E6282
	add r0, r5, #0
	bl StringSetEmpty
	ldr r0, [r6, #0x28]
	mov r1, #8
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r0, #6
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E635C ; =0x000F0200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r0, #0x64
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl StringSetEmpty
	ldr r0, [r6, #0x28]
	mov r1, #7
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r0, #6
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E635C ; =0x000F0200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r0, #0x74
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r4, #0
_021E6316:
	add r0, r6, #0
	add r1, r4, #0
	bl ov54_021E6418
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #7
	blo _021E6316
	add r0, r6, #0
	add r0, #0x34
	bl CopyWindowToVram
	add r0, r6, #0
	add r0, #0x44
	bl CopyWindowToVram
	add r0, r6, #0
	add r0, #0x64
	bl CopyWindowToVram
	add r0, r6, #0
	add r0, #0x74
	bl CopyWindowToVram
	add r6, #0x54
	add r0, r6, #0
	bl CopyWindowToVram
	add r0, r5, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E635C: .word 0x000F0200
	thumb_func_end ov54_021E6238

	thumb_func_start ov54_021E6360
ov54_021E6360: ; 0x021E6360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r5, #0
	add r6, r0, #0
	str r5, [sp, #4]
_021E636A:
	ldr r0, [sp, #4]
	ldr r2, [sp, #4]
	lsl r7, r0, #2
	ldr r0, _021E640C ; =ov54_021E6C9C
	mov r1, #0x54
	mul r1, r2
	add r1, r6, r1
	str r1, [sp]
	ldr r0, [r0, r7]
	add r1, #0x84
	mov r4, #0
	strh r0, [r1]
	cmp r0, #0
	ble _021E63AE
_021E6386:
	add r0, r5, #1
	lsl r0, r0, #0x10
	add r1, r5, #0
	lsr r5, r0, #0x10
	ldr r0, [r6, #0x28]
	add r1, #9
	bl NewString_ReadMsgData
	ldr r1, [sp]
	lsl r2, r4, #2
	add r1, r1, r2
	add r1, #0x88
	str r0, [r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, _021E640C ; =ov54_021E6C9C
	ldr r0, [r0, r7]
	cmp r4, r0
	blt _021E6386
_021E63AE:
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	cmp r0, #6
	blo _021E636A
	ldrh r0, [r6, #0x18]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	add r0, r6, #0
	add r0, #0x86
	strh r1, [r0]
	ldrh r0, [r6, #0x18]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x1f
	add r0, r6, #0
	add r0, #0xda
	strh r1, [r0]
	ldrh r0, [r6, #0x18]
	ldr r1, _021E6410 ; =0x0000012E
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	strh r0, [r6, r1]
	ldrh r0, [r6, #0x18]
	lsl r0, r0, #0x1a
	lsr r2, r0, #0x1e
	add r0, r1, #0
	add r0, #0x54
	strh r2, [r6, r0]
	ldrh r0, [r6, #0x18]
	lsl r0, r0, #0x16
	lsr r2, r0, #0x1e
	add r0, r1, #0
	add r0, #0xa8
	strh r2, [r6, r0]
	ldrh r0, [r6, #0x18]
	add r1, #0xfc
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1b
	strh r0, [r6, r1]
	ldr r0, _021E6414 ; =0x0000027E
	mov r1, #0
	strh r1, [r6, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E640C: .word ov54_021E6C9C
_021E6410: .word 0x0000012E
_021E6414: .word 0x0000027E
	thumb_func_end ov54_021E6360

	thumb_func_start ov54_021E6418
ov54_021E6418: ; 0x021E6418
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r1, #0
	str r0, [sp, #0x10]
	ldr r2, _021E65C0 ; =_021E6C30
	mov r1, #0x18
	add r0, r6, #0
	mul r0, r1
	add r0, r0, #5
	str r0, [sp, #0x14]
	ldrsb r2, [r2, r6]
	lsl r0, r1, #4
	str r0, [sp]
	ldr r3, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r2, #0x6c
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	str r1, [sp, #4]
	add r0, #0x44
	mov r1, #0
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	cmp r6, #5
	bhi _021E652E
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E645A: ; jump table
	.short _021E6508 - _021E645A - 2 ; case 0
	.short _021E652E - _021E645A - 2 ; case 1
	.short _021E652E - _021E645A - 2 ; case 2
	.short _021E64DE - _021E645A - 2 ; case 3
	.short _021E64F2 - _021E645A - 2 ; case 4
	.short _021E6466 - _021E645A - 2 ; case 5
_021E6466:
	ldr r4, [sp, #0x10]
	mov r0, #0x54
	add r7, r6, #0
	mul r7, r0
	add r4, #0x86
	ldr r0, [sp, #0x10]
	ldrh r1, [r4, r7]
	add r0, #0x88
	add r5, r0, r7
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #6
	add r2, r6, #0
	mul r2, r1
	ldr r1, _021E65C4 ; =ov54_021E6D00
	lsr r0, r0, #1
	ldrh r1, [r1, r2]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	ldr r0, [sp, #0x14]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E65C8 ; =0x00010200
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldrh r2, [r4, r7]
	ldr r0, [sp, #0x10]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, #0x44
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	add r0, #0x44
	bl CopyWindowToVram
	ldr r0, [sp, #0x10]
	mov r2, #0xc9
	lsl r2, r2, #2
	add r1, r0, #0
	ldr r1, [r1, r2]
	mov r2, #1
	bl ov54_021E61A8
	ldr r0, [sp, #0x10]
	ldr r1, [r0, #0x10]
	mov r0, #2
	lsl r0, r0, #0x14
	orr r1, r0
	ldr r0, [sp, #0x10]
	add sp, #0x20
	str r1, [r0, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_021E64DE:
	mov r0, #0x54
	add r1, r6, #0
	mul r1, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r1
	add r0, #0x86
	ldrh r0, [r0]
	bl GF_SndSetMonoFlag
	b _021E652E
_021E64F2:
	mov r1, #0x54
	add r2, r6, #0
	mul r2, r1
	ldr r1, [sp, #0x10]
	mov r0, #0
	add r1, r1, r2
	add r1, #0x86
	ldrh r1, [r1]
	bl Options_SetButtonModeOnMain
	b _021E652E
_021E6508:
	mov r1, #0x54
	add r2, r6, #0
	mul r2, r1
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x10]
	add r1, r1, r2
	add r1, #0x86
	ldrh r1, [r1]
	ldr r0, [r0, #0x24]
	bl Options_SetTextSpeed
	ldr r0, [sp, #0x10]
	mov r2, #0xc9
	lsl r2, r2, #2
	add r1, r0, #0
	ldr r1, [r1, r2]
	mov r2, #0
	bl ov54_021E61A8
_021E652E:
	mov r0, #0x54
	add r1, r6, #0
	mul r1, r0
	ldr r0, [sp, #0x10]
	mov r4, #0
	add r5, r0, r1
	add r0, r5, #0
	add r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	bls _021E65B2
	bls _021E65B2
	mov r0, #6
	ldr r1, _021E65C4 ; =ov54_021E6D00
	mul r0, r6
	add r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	str r0, [sp, #0x1c]
	add r0, #0x44
	str r0, [sp, #0x1c]
_021E6558:
	add r0, r5, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r4, r0
	bne _021E6566
	ldr r6, _021E65C8 ; =0x00010200
	b _021E6568
_021E6566:
	ldr r6, _021E65CC ; =0x000F0200
_021E6568:
	lsl r7, r4, #2
	add r1, r5, r7
	add r1, #0x88
	mov r0, #0
	ldr r1, [r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	ldr r1, [sp, #0x18]
	lsl r2, r4, #1
	ldrh r1, [r1, r2]
	lsr r0, r0, #1
	add r2, r5, r7
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	ldr r0, [sp, #0x14]
	add r2, #0x88
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [r2]
	mov r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	add r0, #0x84
	ldrh r0, [r0]
	cmp r4, r0
	blo _021E6558
_021E65B2:
	ldr r0, [sp, #0x10]
	add r0, #0x44
	str r0, [sp, #0x10]
	bl CopyWindowToVram
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E65C0: .word _021E6C30
_021E65C4: .word ov54_021E6D00
_021E65C8: .word 0x00010200
_021E65CC: .word 0x000F0200
	thumb_func_end ov54_021E6418

	thumb_func_start ov54_021E65D0
ov54_021E65D0: ; 0x021E65D0
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	cmp r1, #5
	bne _021E6600
	mov r1, #0
	mvn r1, r1
	cmp r4, r1
	bne _021E65F0
	mov r1, #0xbb
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	b _021E6600
_021E65F0:
	cmp r4, #1
	bne _021E6600
	mov r1, #0x2f
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
_021E6600:
	cmp r4, #0
	ble _021E6612
	ldrh r0, [r5, #2]
	ldrh r1, [r5]
	add r0, r0, r4
	bl _s32_div_f
	strh r1, [r5, #2]
	pop {r3, r4, r5, pc}
_021E6612:
	bge _021E6622
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	add r0, r0, r1
	sub r0, r0, #1
	bl _s32_div_f
	strh r1, [r5, #2]
_021E6622:
	pop {r3, r4, r5, pc}
	thumb_func_end ov54_021E65D0

	thumb_func_start ov54_021E6624
ov54_021E6624: ; 0x021E6624
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r2, r1, #0
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	cmp r1, #6
	beq _021E6686
	ldr r3, _021E6810 ; =gSystem
	ldr r5, [r3, #0x48]
	mov r3, #0x10
	tst r3, r5
	beq _021E665C
	mov r3, #1
	bl ov54_021E65D0
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov54_021E6418
	ldr r0, _021E6814 ; =0x000005DC
	bl PlaySE
	b _021E667E
_021E665C:
	mov r3, #0x20
	tst r5, r3
	beq _021E667E
	sub r3, #0x21
	bl ov54_021E65D0
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov54_021E6418
	ldr r0, _021E6814 ; =0x000005DC
	bl PlaySE
_021E667E:
	add r0, r4, #0
	bl ov54_021E6BB8
	b _021E66DC
_021E6686:
	ldr r2, _021E6810 ; =gSystem
	ldr r3, [r2, #0x48]
	mov r2, #0x20
	tst r2, r3
	beq _021E66B4
	add r2, r4, #0
	mov r3, #0x54
	add r2, #0x86
	mul r3, r1
	ldrh r1, [r2, r3]
	cmp r1, #0
	bne _021E66DC
	mov r1, #1
	strh r1, [r2, r3]
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 ; =0x000005DC
	bl PlaySE
	b _021E66DC
_021E66B4:
	mov r2, #0x10
	tst r2, r3
	beq _021E66DC
	add r2, r4, #0
	mov r3, #0x54
	add r2, #0x86
	mul r3, r1
	ldrh r1, [r2, r3]
	cmp r1, #1
	bne _021E66DC
	mov r1, #0
	strh r1, [r2, r3]
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 ; =0x000005DC
	bl PlaySE
_021E66DC:
	ldr r0, _021E6810 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6716
	ldr r0, [r4, #0x10]
	mov r1, #7
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1d
	add r0, r0, #6
	bl _u32_div_f
	ldr r2, [r4, #0x10]
	mov r0, #0x1c
	bic r2, r0
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1b
	add r1, r2, #0
	orr r1, r0
	str r1, [r4, #0x10]
	lsl r1, r1, #0x1b
	add r0, r4, #0
	lsr r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 ; =0x000005DC
	bl PlaySE
	pop {r3, r4, r5, pc}
_021E6716:
	mov r1, #0x80
	tst r1, r0
	beq _021E674C
	ldr r0, [r4, #0x10]
	mov r1, #7
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1d
	add r0, r0, #1
	bl _u32_div_f
	ldr r2, [r4, #0x10]
	mov r0, #0x1c
	bic r2, r0
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1b
	add r1, r2, #0
	orr r1, r0
	str r1, [r4, #0x10]
	lsl r1, r1, #0x1b
	add r0, r4, #0
	lsr r1, r1, #0x1d
	bl ov54_021E69D4
	ldr r0, _021E6814 ; =0x000005DC
	bl PlaySE
	pop {r3, r4, r5, pc}
_021E674C:
	mov r1, #1
	tst r1, r0
	beq _021E67BA
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	cmp r1, #6
	bne _021E67BA
	mov r0, #0x54
	mul r0, r1
	add r0, r4, r0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r0, #1
	ldr r0, [r4, #0x20]
	bne _021E6792
	mov r1, #0
	bl sub_02018410
	ldr r0, _021E6818 ; =0x0000061A
	bl PlaySE
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r1, [r4, #0x10]
	mov r0, #3
	bic r1, r0
	mov r0, #1
	orr r0, r1
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E6792:
	mov r1, #0
	bl sub_02018410
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r1, [r4, #0x10]
	mov r0, #3
	bic r1, r0
	mov r0, #2
	orr r0, r1
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
_021E67BA:
	mov r1, #2
	tst r0, r1
	beq _021E680E
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl sub_02018410
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1d
	cmp r1, #6
	bne _021E67F6
	mov r0, #0x54
	mul r0, r1
	add r0, r4, r0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r0, #0
	bne _021E67F6
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	b _021E6802
_021E67F6:
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
_021E6802:
	ldr r1, [r4, #0x10]
	mov r0, #3
	bic r1, r0
	mov r0, #2
	orr r0, r1
	str r0, [r4, #0x10]
_021E680E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6810: .word gSystem
_021E6814: .word 0x000005DC
_021E6818: .word 0x0000061A
	thumb_func_end ov54_021E6624

	thumb_func_start ov54_021E681C
ov54_021E681C: ; 0x021E681C
	push {r3, r4, r5, lr}
	ldr r1, _021E69B8 ; =gSystem + 0x40
	add r4, r0, #0
	ldrh r1, [r1, #0x24]
	cmp r1, #0
	bne _021E682A
	b _021E6998
_021E682A:
	ldr r0, _021E69BC ; =ov54_021E6D68
	bl sub_02025224
	mov r3, #0
	mvn r3, r3
	cmp r0, r3
	bne _021E683A
	b _021E69B4
_021E683A:
	cmp r0, #0xd
	beq _021E6844
	cmp r0, #0xe
	beq _021E68B0
	b _021E691E
_021E6844:
	ldr r1, [r4, #0x10]
	mov r2, #0x1c
	bic r1, r2
	lsl r2, r0, #3
	ldr r0, _021E69C0 ; =ov54_021E6DA8
	ldr r0, [r0, r2]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1b
	orr r0, r1
	str r0, [r4, #0x10]
	add r0, r4, #0
	bl ov54_021E6BB8
	add r0, r4, #0
	bl ov54_021E6A64
	ldr r1, [r4, #0x10]
	mov r0, #3
	bic r1, r0
	mov r0, #1
	orr r0, r1
	str r0, [r4, #0x10]
	ldr r0, _021E69C4 ; =0x0000061A
	bl PlaySE
	mov r0, #0x32
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #0x20]
	bl sub_02018410
	ldr r1, [r4, #0x10]
	mov r0, #1
	lsl r1, r1, #0x1b
	lsr r2, r1, #0x1d
	mov r1, #0x54
	mul r1, r2
	add r1, r4, r1
	add r1, #0x86
	strh r0, [r1]
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	bl ov54_021E69D4
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E68B0:
	ldr r1, [r4, #0x10]
	mov r2, #0x1c
	bic r1, r2
	lsl r2, r0, #3
	ldr r0, _021E69C0 ; =ov54_021E6DA8
	ldr r0, [r0, r2]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1b
	orr r0, r1
	str r0, [r4, #0x10]
	add r0, r4, #0
	bl ov54_021E6BB8
	add r0, r4, #0
	bl ov54_021E6A64
	ldr r1, [r4, #0x10]
	mov r0, #3
	bic r1, r0
	mov r0, #2
	orr r0, r1
	str r0, [r4, #0x10]
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x32
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #0x20]
	bl sub_02018410
	ldr r1, [r4, #0x10]
	mov r0, #0
	lsl r1, r1, #0x1b
	lsr r2, r1, #0x1d
	mov r1, #0x54
	mul r1, r2
	add r1, r4, r1
	add r1, #0x86
	strh r0, [r1]
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	bl ov54_021E69D4
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E691E:
	lsl r5, r0, #3
	ldr r0, [r4, #0x10]
	mov r1, #0x1c
	bic r0, r1
	ldr r1, _021E69C0 ; =ov54_021E6DA8
	add r2, r4, #0
	ldr r1, [r1, r5]
	add r2, #0x84
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1b
	orr r0, r1
	str r0, [r4, #0x10]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1d
	mov r0, #0x54
	mul r0, r1
	add r2, r2, r0
	ldr r0, _021E69C8 ; =ov54_021E6DAC
	ldr r0, [r0, r5]
	cmp r0, #3
	bne _021E6950
	add r0, r4, #0
	bl ov54_021E65D0
	b _021E6960
_021E6950:
	cmp r0, #4
	bne _021E695E
	add r0, r4, #0
	mov r3, #1
	bl ov54_021E65D0
	b _021E6960
_021E695E:
	strh r0, [r2, #2]
_021E6960:
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ov54_021E6418
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1d
	bl ov54_021E69D4
	add r0, r4, #0
	bl ov54_021E6BB8
	add r0, r4, #0
	bl ov54_021E6A64
	mov r0, #0x32
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _021E69CC ; =0x000005DC
	bl PlaySE
	pop {r3, r4, r5, pc}
_021E6998:
	ldr r1, _021E69D0 ; =gSystem
	ldr r1, [r1, #0x48]
	cmp r1, #0
	beq _021E69B4
	ldr r2, [r4, #0x10]
	add r1, r4, #0
	lsl r2, r2, #0x1b
	lsr r3, r2, #0x1d
	mov r2, #0x54
	add r1, #0x84
	mul r2, r3
	add r1, r1, r2
	bl ov54_021E6624
_021E69B4:
	pop {r3, r4, r5, pc}
	nop
_021E69B8: .word gSystem + 0x40
_021E69BC: .word ov54_021E6D68
_021E69C0: .word ov54_021E6DA8
_021E69C4: .word 0x0000061A
_021E69C8: .word ov54_021E6DAC
_021E69CC: .word 0x000005DC
_021E69D0: .word gSystem
	thumb_func_end ov54_021E681C

	thumb_func_start ov54_021E69D4
ov54_021E69D4: ; 0x021E69D4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	bne _021E6A28
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #0x54
	mul r0, r4
	add r0, r5, r0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r0, #0
	bne _021E6A0E
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E6A0E:
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E6A28:
	ldr r3, [r5, #0x10]
	ldr r0, [r5, #0x14]
	lsl r3, r3, #0x1b
	lsr r3, r3, #0x1d
	lsl r4, r3, #2
	ldr r3, _021E6A60 ; =ov54_021E6C80
	mov r1, #0
	ldr r3, [r3, r4]
	mov r2, #3
	bl BgSetPosTextAndCommit
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	mov r1, #1
	bl ToggleBgLayer
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6A60: .word ov54_021E6C80
	thumb_func_end ov54_021E69D4

	thumb_func_start ov54_021E6A64
ov54_021E6A64: ; 0x021E6A64
	push {r3, lr}
	ldr r0, [r0, #0x10]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1d
	cmp r0, #6
	bne _021E6A78
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
_021E6A78:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov54_021E6A64

	thumb_func_start ov54_021E6A7C
ov54_021E6A7C: ; 0x021E6A7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r4]
	bl sub_0200CF18
	mov r1, #0x2d
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	mov r7, #0xb5
	lsl r7, r7, #2
	add r2, sp, #0x24
	ldr r3, _021E6B28 ; =ov54_021E6CB8
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _021E6B2C ; =ov54_021E6C6C
	stmia r2!, {r0, r1}
	add r3, sp, #0x10
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r4, r0]
	mov r3, #0x20
	bl sub_0200CF70
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #9
	bl sub_0200CFF4
	ldr r3, _021E6B30 ; =ov54_021E6C38
	add r2, sp, #0
	mov r1, #7
_021E6AF2:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _021E6AF2
	mov r1, #0x2d
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl sub_0200D294
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200CF6C
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_021E6B28: .word ov54_021E6CB8
_021E6B2C: .word ov54_021E6C6C
_021E6B30: .word ov54_021E6C38
	thumb_func_end ov54_021E6A7C

	thumb_func_start ov54_021E6B34
ov54_021E6B34: ; 0x021E6B34
	push {r4, lr}
	mov r1, #0x2d
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D0E4
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D108
	mov r0, #0xb5
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov54_021E6B34

	thumb_func_start ov54_021E6B5C
ov54_021E6B5C: ; 0x021E6B5C
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _021E6BB4 ; =ov54_021E6EAC
	add r6, r0, #0
	mov r4, #0
_021E6B64:
	lsl r0, r4, #2
	add r5, r6, r0
	mov r0, #0x2d
	mov r1, #0xb5
	lsl r0, r0, #4
	lsl r1, r1, #2
	mov r2, #0x28
	mul r2, r4
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	add r2, r7, r2
	bl sub_0200D2B4
	mov r1, #0xb6
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_0200DD3C
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #9
	blo _021E6B64
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6BB4: .word ov54_021E6EAC
	thumb_func_end ov54_021E6B5C

	thumb_func_start ov54_021E6BB8
ov54_021E6BB8: ; 0x021E6BB8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, _021E6C04 ; =ov54_021E6D2C
	mov r7, #0
	add r6, r5, #0
_021E6BC2:
	mov r0, #0xb6
	lsl r0, r0, #2
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	add r0, r6, #0
	add r0, #0x86
	ldrh r0, [r0]
	add r2, sp, #0
	add r3, r2, #0
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, sp, #0
	strh r1, [r0, #2]
	mov r1, #2
	mov r0, #0xb6
	ldrsh r1, [r2, r1]
	mov r2, #0
	lsl r0, r0, #2
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl sub_0200DD88
	add r7, r7, #1
	add r5, r5, #4
	add r4, #0xc
	add r6, #0x54
	cmp r7, #5
	blt _021E6BC2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6C04: .word ov54_021E6D2C
	thumb_func_end ov54_021E6BB8

	thumb_func_start ov54_021E6C08
ov54_021E6C08: ; 0x021E6C08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _021E6C2C
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _021E6C2C
	mov r0, #0
	pop {r4, pc}
_021E6C2C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov54_021E6C08

	.rodata

_021E6C30:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x00

ov54_021E6C38: ; 0x021E6C38
	.byte 0x16, 0x00, 0x17, 0x00, 0x15, 0x00, 0x14, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4D, 0x00, 0x00, 0x00

ov54_021E6C48: ; 0x021E6C48
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov54_021E6C58: ; 0x021E6C58
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov54_021E6C6C: ; 0x021E6C6C
	.byte 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov54_021E6C80: ; 0x021E6C80
	.byte 0xF8, 0xFF, 0xFF, 0xFF, 0xE0, 0xFF, 0xFF, 0xFF, 0xC8, 0xFF, 0xFF, 0xFF, 0xB0, 0xFF, 0xFF, 0xFF
	.byte 0x98, 0xFF, 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF, 0x64, 0xFF, 0xFF, 0xFF

ov54_021E6C9C: ; 0x021E6C9C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov54_021E6CB8: ; 0x021E6CB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov54_021E6CD8: ; 0x021E6CD8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov54_021E6D00: ; 0x021E6D00
	.byte 0x7C, 0x00, 0xAC, 0x00, 0xDC, 0x00, 0x7C, 0x00, 0xAC, 0x00, 0x00, 0x00, 0x84, 0x00, 0xD4, 0x00
	.byte 0x00, 0x00, 0x84, 0x00, 0xD4, 0x00, 0x00, 0x00, 0x84, 0x00, 0xD4, 0x00, 0x00, 0x00, 0xAC, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov54_021E6D2C: ; 0x021E6D2C
	.byte 0x70, 0x00, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov54_021E6D68: ; 0x021E6D68
	.byte 0x1A, 0x2E, 0x70, 0x97, 0x1A, 0x2E, 0xA0, 0xC8
	.byte 0x1A, 0x2E, 0xD0, 0xF8, 0x32, 0x46, 0x70, 0x97, 0x32, 0x46, 0xA0, 0xC8, 0x4A, 0x5D, 0x70, 0xA7
	.byte 0x4A, 0x5D, 0xC0, 0xF7, 0x62, 0x75, 0x70, 0xA7, 0x62, 0x75, 0xC0, 0xF7, 0x7A, 0x8E, 0x70, 0xA7
	.byte 0x7A, 0x8E, 0xC0, 0xF7, 0x92, 0xA6, 0x6E, 0x96, 0x92, 0xA6, 0xD0, 0xFD, 0xAC, 0xBF, 0x80, 0xB4
	.byte 0xAC, 0xBF, 0xB7, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov54_021E6DA8: ; 0x021E6DA8
	.byte 0x00, 0x00, 0x00, 0x00

ov54_021E6DAC: ; 0x021E6DAC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00

ov54_021E6E20: ; 0x021E6E20
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov54_021E6EAC: ; 0x021E6EAC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x48, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x70, 0x00, 0x78, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x73, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xD5, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xBC, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x74, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	; 0x021E7014
