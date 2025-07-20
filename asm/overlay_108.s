	.include "asm/macros.inc"
	.include "overlay_108.inc"
	.include "global.inc"

	.text

	thumb_func_start SafariAreaCustomizer_Init
SafariAreaCustomizer_Init: ; 0x021E5900
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetArgs
	mov r2, #5
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x5f
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, _021E5944 ; =0x000184EC
	add r0, r4, #0
	mov r2, #0x5f
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5944 ; =0x000184EC
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x5f
	str r0, [r4]
	add r0, r4, #0
	add r1, r5, #0
	bl ov108_021E59E4
	mov r1, #0
	mov r0, #0x43
	add r2, r1, #0
	bl Sound_SetSceneAndPlayBGM
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5944: .word 0x000184EC
	thumb_func_end SafariAreaCustomizer_Init

	thumb_func_start SafariAreaCustomizer_Exit
SafariAreaCustomizer_Exit: ; 0x021E5948
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r6, r0, #0
	bl ov108_021E5A48
	ldr r2, _021E5974 ; =0x000184EC
	ldr r4, [r6]
	add r0, r6, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E5974: .word 0x000184EC
	thumb_func_end SafariAreaCustomizer_Exit

	thumb_func_start SafariAreaCustomizer_Main
SafariAreaCustomizer_Main: ; 0x021E5978
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #7
	bhi _021E59DE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5992: ; jump table
	.short _021E59A2 - _021E5992 - 2 ; case 0
	.short _021E59AA - _021E5992 - 2 ; case 1
	.short _021E59B2 - _021E5992 - 2 ; case 2
	.short _021E59BA - _021E5992 - 2 ; case 3
	.short _021E59C2 - _021E5992 - 2 ; case 4
	.short _021E59CA - _021E5992 - 2 ; case 5
	.short _021E59D2 - _021E5992 - 2 ; case 6
	.short _021E59DA - _021E5992 - 2 ; case 7
_021E59A2:
	bl ov108_021E5A78
	str r0, [r4]
	b _021E59DE
_021E59AA:
	bl ov108_021E5A8C
	str r0, [r4]
	b _021E59DE
_021E59B2:
	bl ov108_021E5AA0
	str r0, [r4]
	b _021E59DE
_021E59BA:
	bl ov108_021E5AF0
	str r0, [r4]
	b _021E59DE
_021E59C2:
	bl ov108_021E5B48
	str r0, [r4]
	b _021E59DE
_021E59CA:
	bl ov108_021E5B98
	str r0, [r4]
	b _021E59DE
_021E59D2:
	bl ov108_021E5BFC
	str r0, [r4]
	b _021E59DE
_021E59DA:
	mov r0, #1
	pop {r4, pc}
_021E59DE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end SafariAreaCustomizer_Main

	thumb_func_start ov108_021E59E4
ov108_021E59E4: ; 0x021E59E4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl Save_SafariZone_Get
	add r2, r5, #0
	str r0, [r5, #0x18]
	mov r1, #0
	add r2, #0x1c
	bl SafariZone_CopyAreaSet
	ldr r0, [r4]
	bl Save_PlayerData_GetOptionsAddr
	add r6, r0, #0
	bl Options_GetTextSpeed
	ldr r1, _021E5A38 ; =0x000184DC
	strb r0, [r5, r1]
	add r0, r6, #0
	bl Options_GetFrame
	ldr r1, _021E5A3C ; =0x000184DD
	strb r0, [r5, r1]
	ldr r0, [r4, #4]
	bl MenuInputStateMgr_GetState
	str r0, [r5, #0x10]
	ldr r0, _021E5A40 ; =0x000184E8
	mov r1, #0
	str r1, [r5, r0]
	str r4, [r5, #0x14]
	ldr r0, [r5, #0x18]
	bl SafariZone_GetObjectUnlockLevel
	cmp r0, #0
	beq _021E5A36
	ldr r0, _021E5A44 ; =0x000184E3
	mov r1, #1
	strb r1, [r5, r0]
_021E5A36:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E5A38: .word 0x000184DC
_021E5A3C: .word 0x000184DD
_021E5A40: .word 0x000184E8
_021E5A44: .word 0x000184E3
	thumb_func_end ov108_021E59E4

	thumb_func_start ov108_021E5A48
ov108_021E5A48: ; 0x021E5A48
	push {r4, lr}
	add r4, r0, #0
	add r2, r4, #0
	ldr r0, [r4, #0x18]
	mov r1, #0
	add r2, #0x1c
	bl SafariZone_SetAreaSet
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	bl Save_VarsFlags_Get
	ldr r1, _021E5A74 ; =0x000184E8
	ldr r1, [r4, r1]
	bl ChangeFlag99D
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x10]
	ldr r0, [r0, #4]
	bl MenuInputStateMgr_SetState
	pop {r4, pc}
	.balign 4, 0
_021E5A74: .word 0x000184E8
	thumb_func_end ov108_021E5A48

	thumb_func_start ov108_021E5A78
ov108_021E5A78: ; 0x021E5A78
	push {r3, lr}
	bl ov108_021E5C54
	cmp r0, #0
	beq _021E5A86
	mov r0, #5
	pop {r3, pc}
_021E5A86:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5A78

	thumb_func_start ov108_021E5A8C
ov108_021E5A8C: ; 0x021E5A8C
	push {r3, lr}
	bl ov108_021E5D0C
	cmp r0, #0
	beq _021E5A9A
	mov r0, #7
	pop {r3, pc}
_021E5A9A:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5A8C

	thumb_func_start ov108_021E5AA0
ov108_021E5AA0: ; 0x021E5AA0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5AE4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5AB6: ; jump table
	.short _021E5AC0 - _021E5AB6 - 2 ; case 0
	.short _021E5AC8 - _021E5AB6 - 2 ; case 1
	.short _021E5AD0 - _021E5AB6 - 2 ; case 2
	.short _021E5AE4 - _021E5AB6 - 2 ; case 3
	.short _021E5AD8 - _021E5AB6 - 2 ; case 4
_021E5AC0:
	bl ov108_021E5D90
	str r0, [r4, #4]
	b _021E5AE4
_021E5AC8:
	bl ov108_021E5DB8
	str r0, [r4, #4]
	b _021E5AE4
_021E5AD0:
	bl ov108_021E5E68
	str r0, [r4, #4]
	b _021E5AE4
_021E5AD8:
	mov r1, #0
	str r1, [r4, #4]
	bl ov108_021E846C
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E5AE4:
	add r0, r4, #0
	bl ov108_021E846C
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5AA0

	thumb_func_start ov108_021E5AF0
ov108_021E5AF0: ; 0x021E5AF0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5B3C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5B06: ; jump table
	.short _021E5B10 - _021E5B06 - 2 ; case 0
	.short _021E5B18 - _021E5B06 - 2 ; case 1
	.short _021E5B20 - _021E5B06 - 2 ; case 2
	.short _021E5B28 - _021E5B06 - 2 ; case 3
	.short _021E5B30 - _021E5B06 - 2 ; case 4
_021E5B10:
	bl ov108_021E5F10
	str r0, [r4, #4]
	b _021E5B3C
_021E5B18:
	bl ov108_021E5F38
	str r0, [r4, #4]
	b _021E5B3C
_021E5B20:
	bl ov108_021E5E68
	str r0, [r4, #4]
	b _021E5B3C
_021E5B28:
	bl ov108_021E6010
	str r0, [r4, #4]
	b _021E5B3C
_021E5B30:
	mov r1, #0
	str r1, [r4, #4]
	bl ov108_021E846C
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E5B3C:
	add r0, r4, #0
	bl ov108_021E846C
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5AF0

	thumb_func_start ov108_021E5B48
ov108_021E5B48: ; 0x021E5B48
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #4
	bhi _021E5B8C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5B5E: ; jump table
	.short _021E5B68 - _021E5B5E - 2 ; case 0
	.short _021E5B8C - _021E5B5E - 2 ; case 1
	.short _021E5B70 - _021E5B5E - 2 ; case 2
	.short _021E5B78 - _021E5B5E - 2 ; case 3
	.short _021E5B80 - _021E5B5E - 2 ; case 4
_021E5B68:
	bl ov108_021E6068
	str r0, [r4, #4]
	b _021E5B8C
_021E5B70:
	bl ov108_021E5E68
	str r0, [r4, #4]
	b _021E5B8C
_021E5B78:
	bl ov108_021E6090
	str r0, [r4, #4]
	b _021E5B8C
_021E5B80:
	mov r1, #0
	str r1, [r4, #4]
	bl ov108_021E846C
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E5B8C:
	add r0, r4, #0
	bl ov108_021E846C
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5B48

	thumb_func_start ov108_021E5B98
ov108_021E5B98: ; 0x021E5B98
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E5BAA
	cmp r0, #1
	beq _021E5BD8
	b _021E5BF0
_021E5BAA:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021E5BF0
_021E5BD8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5BF0
	mov r0, #0
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov108_021E846C
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, pc}
_021E5BF0:
	add r0, r4, #0
	bl ov108_021E846C
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov108_021E5B98

	thumb_func_start ov108_021E5BFC
ov108_021E5BFC: ; 0x021E5BFC
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E5C0E
	cmp r0, #1
	beq _021E5C2E
	b _021E5C46
_021E5C0E:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021E5C46
_021E5C2E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5C46
	mov r0, #0
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov108_021E846C
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E5C46:
	add r0, r4, #0
	bl ov108_021E846C
	mov r0, #6
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5BFC

	thumb_func_start ov108_021E5C54
ov108_021E5C54: ; 0x021E5C54
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5C68
	cmp r1, #1
	beq _021E5CB8
	cmp r1, #2
	beq _021E5CE2
	b _021E5CF6
_021E5C68:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5D00 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5D04 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	b _021E5CF6
_021E5CB8:
	bl ov108_021E6C68
	add r0, r4, #0
	bl ov108_021E6D80
	add r0, r4, #0
	bl ov108_021E6F74
	add r0, r4, #0
	bl ov108_021E7080
	add r0, r4, #0
	bl ov108_021E7224
	add r0, r4, #0
	bl ov108_021E72CC
	add r0, r4, #0
	bl ov108_021E733C
	b _021E5CF6
_021E5CE2:
	bl ov108_021E7BFC
	ldr r0, _021E5D08 ; =ov108_021E6BA0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021E5CF6:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E5D00: .word 0xFFFFE0FF
_021E5D04: .word 0x04001000
_021E5D08: .word ov108_021E6BA0
	thumb_func_end ov108_021E5C54

	thumb_func_start ov108_021E5D0C
ov108_021E5D0C: ; 0x021E5D0C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E5D1C
	cmp r0, #2
	beq _021E5D54
	b _021E5D7C
_021E5D1C:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r0, r4, #0
	bl ov108_021E7510
	add r0, r4, #0
	bl ov108_021E730C
	add r0, r4, #0
	bl ov108_021E72A4
	add r0, r4, #0
	bl ov108_021E71EC
	add r0, r4, #0
	bl ov108_021E7014
	add r0, r4, #0
	bl ov108_021E6F58
	add r0, r4, #0
	bl ov108_021E6D24
	b _021E5D7C
_021E5D54:
	bl sub_02021238
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5D88 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5D8C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021E5D7C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	nop
_021E5D88: .word 0xFFFFE0FF
_021E5D8C: .word 0x04001000
	thumb_func_end ov108_021E5D0C

	thumb_func_start ov108_021E5D90
ov108_021E5D90: ; 0x021E5D90
	push {r4, lr}
	add r4, r0, #0
	bl ov108_021E6240
	cmp r0, #0
	beq _021E5DA0
	mov r0, #0
	pop {r4, pc}
_021E5DA0:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E5DAE
	add r0, r4, #0
	bl ov108_021E62B4
	pop {r4, pc}
_021E5DAE:
	add r0, r4, #0
	bl ov108_021E63B8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5D90

	thumb_func_start ov108_021E5DB8
ov108_021E5DB8: ; 0x021E5DB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E5E5C ; =0x000004BC
	ldr r0, [r5, r0]
	bl TouchscreenListMenu_HandleInput
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021E5DD2
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E5DD2:
	ldr r0, _021E5E5C ; =0x000004BC
	ldr r0, [r5, r0]
	add r1, r0, #0
	add r1, #0x27
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r4, r1, #0x19
	bl TouchscreenListMenu_Destroy
	ldr r0, [r5, #0x10]
	cmp r4, r0
	beq _021E5DFC
	cmp r4, #0
	bne _021E5DF6
	add r0, r5, #0
	bl ov108_021E61E8
	b _021E5DFC
_021E5DF6:
	add r0, r5, #0
	bl ov108_021E6238
_021E5DFC:
	str r4, [r5, #0x10]
	cmp r6, #0
	beq _021E5E0A
	cmp r6, #1
	beq _021E5E14
	cmp r6, #2
	b _021E5E40
_021E5E0A:
	ldr r0, _021E5E60 ; =0x000184E0
	mov r1, #0
	strb r1, [r5, r0]
	mov r0, #2
	pop {r4, r5, r6, pc}
_021E5E14:
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E79A8
	mov r2, #0
	add r0, r5, #0
	mov r1, #4
	add r3, r2, #0
	bl ov108_021E79A8
	ldr r0, _021E5E64 ; =0x000184DF
	ldrb r1, [r5, r0]
	add r0, r0, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	bl ov108_021E6804
	mov r0, #4
	str r0, [r5, #0xc]
	pop {r4, r5, r6, pc}
_021E5E40:
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E79A8
	mov r2, #0
	add r0, r5, #0
	mov r1, #4
	add r3, r2, #0
	bl ov108_021E79A8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E5E5C: .word 0x000004BC
_021E5E60: .word 0x000184E0
_021E5E64: .word 0x000184DF
	thumb_func_end ov108_021E5DB8

	thumb_func_start ov108_021E5E68
ov108_021E5E68: ; 0x021E5E68
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5E78
	cmp r1, #1
	beq _021E5E84
	b _021E5E94
_021E5E78:
	bl ov108_021E7F7C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021E5EF6
_021E5E84:
	bl ov108_021E80F4
	cmp r0, #0
	beq _021E5EF6
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021E5EF6
_021E5E94:
	ldr r3, _021E5EFC ; =0x04001000
	ldr r1, _021E5F00 ; =0xFFFF1FFF
	ldr r2, [r3]
	and r1, r2
	str r1, [r3]
	ldr r2, _021E5F04 ; =0x000184E1
	mov r1, #0
	strb r1, [r4, r2]
	str r1, [r4, #8]
	add r2, r2, #1
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1b
	bne _021E5ED2
	mov r2, #3
	str r2, [r4, #0xc]
	mov r2, #1
	add r3, r2, #0
	bl ov108_021E7700
	add r0, r4, #0
	bl ov108_021E7EB0
	ldr r1, _021E5F08 ; =0x000184E2
	mov r0, #0xf8
	ldrb r2, [r4, r1]
	bic r2, r0
	mov r0, #8
	orr r0, r2
	strb r0, [r4, r1]
	b _021E5EF2
_021E5ED2:
	mov r2, #2
	str r2, [r4, #0xc]
	add r2, r1, #0
	mov r3, #1
	bl ov108_021E7700
	ldr r1, _021E5F0C ; =0x000184DF
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E7CD8
	ldr r1, _021E5F08 ; =0x000184E2
	mov r0, #0xf8
	ldrb r2, [r4, r1]
	bic r2, r0
	strb r2, [r4, r1]
_021E5EF2:
	mov r0, #4
	pop {r4, pc}
_021E5EF6:
	mov r0, #2
	pop {r4, pc}
	nop
_021E5EFC: .word 0x04001000
_021E5F00: .word 0xFFFF1FFF
_021E5F04: .word 0x000184E1
_021E5F08: .word 0x000184E2
_021E5F0C: .word 0x000184DF
	thumb_func_end ov108_021E5E68

	thumb_func_start ov108_021E5F10
ov108_021E5F10: ; 0x021E5F10
	push {r4, lr}
	add r4, r0, #0
	bl ov108_021E6240
	cmp r0, #0
	beq _021E5F20
	mov r0, #0
	pop {r4, pc}
_021E5F20:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E5F2E
	add r0, r4, #0
	bl ov108_021E64C0
	pop {r4, pc}
_021E5F2E:
	add r0, r4, #0
	bl ov108_021E66AC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E5F10

	thumb_func_start ov108_021E5F38
ov108_021E5F38: ; 0x021E5F38
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x13
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl YesNoPrompt_HandleInput
	cmp r0, #1
	beq _021E5F50
	cmp r0, #2
	beq _021E5F88
	b _021E5F9E
_021E5F50:
	ldr r1, _021E6008 ; =0x000184E0
	mov r4, #1
	sub r2, r1, #2
	ldrb r3, [r5, r2]
	ldrb r0, [r5, r1]
	mov r2, #6
	mul r2, r3
	add r0, r0, r2
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	sub r0, r1, #1
	ldrb r3, [r5, r0]
	mov r0, #0x7a
	mul r0, r3
	add r0, r5, r0
	ldrb r0, [r0, #0x1c]
	cmp r2, r0
	beq _021E5FA2
	add r0, r1, #0
	add r0, #8
	str r4, [r5, r0]
	sub r1, r1, #1
	add r0, r5, #0
	ldrb r1, [r5, r1]
	add r0, #0x1c
	bl SafariZone_InitAreaInSet
	b _021E5FA2
_021E5F88:
	ldr r0, _021E600C ; =0x000184DF
	mov r2, #0x7a
	ldrb r1, [r5, r0]
	add r0, r5, #0
	mul r2, r1
	add r2, r5, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	mov r4, #0
	b _021E5FA2
_021E5F9E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E5FA2:
	mov r0, #0x13
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl YesNoPrompt_IsInTouchMode
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	cmp r6, r0
	beq _021E5FC6
	cmp r6, #0
	bne _021E5FC0
	add r0, r5, #0
	bl ov108_021E61E8
	b _021E5FC6
_021E5FC0:
	add r0, r5, #0
	bl ov108_021E6238
_021E5FC6:
	mov r0, #0x13
	str r6, [r5, #0x10]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl YesNoPrompt_Reset
	mov r0, #0xf1
	lsl r0, r0, #2
	add r0, r5, r0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	mov r1, #0
	bl ov108_021E767C
	mov r2, #1
	add r0, r5, #0
	mov r1, #0
	add r3, r2, #0
	bl ov108_021E7700
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E79A8
	cmp r4, #0
	beq _021E6004
	mov r0, #2
	pop {r4, r5, r6, pc}
_021E6004:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6008: .word 0x000184E0
_021E600C: .word 0x000184DF
	thumb_func_end ov108_021E5F38

	thumb_func_start ov108_021E6010
ov108_021E6010: ; 0x021E6010
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E6020
	cmp r1, #1
	beq _021E602C
	b _021E603C
_021E6020:
	bl ov108_021E81A8
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021E6060
_021E602C:
	bl ov108_021E8270
	cmp r0, #0
	beq _021E6060
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021E6060
_021E603C:
	ldr r2, _021E6064 ; =0x000184E2
	mov r1, #4
	ldrb r3, [r4, r2]
	add r0, r3, #0
	bic r0, r1
	lsl r1, r3, #0x1d
	lsr r3, r1, #0x1f
	mov r1, #1
	eor r1, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	orr r0, r1
	strb r0, [r4, r2]
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
_021E6060:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E6064: .word 0x000184E2
	thumb_func_end ov108_021E6010

	thumb_func_start ov108_021E6068
ov108_021E6068: ; 0x021E6068
	push {r4, lr}
	add r4, r0, #0
	bl ov108_021E6240
	cmp r0, #0
	beq _021E6078
	mov r0, #0
	pop {r4, pc}
_021E6078:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E6086
	add r0, r4, #0
	bl ov108_021E6894
	pop {r4, pc}
_021E6086:
	add r0, r4, #0
	bl ov108_021E69A0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E6068

	thumb_func_start ov108_021E6090
ov108_021E6090: ; 0x021E6090
	push {r3, r4, r5, lr}
	ldr r2, _021E61D8 ; =0x000184E2
	add r5, r0, #0
	ldrb r1, [r5, r2]
	lsl r1, r1, #0x1d
	lsr r3, r1, #0x1f
	mov r1, #6
	add r4, r3, #0
	mul r4, r1
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _021E60B2
	cmp r1, #1
	beq _021E60EE
	cmp r1, #2
	beq _021E6174
	b _021E61BA
_021E60B2:
	sub r0, r2, #3
	ldrb r0, [r5, r0]
	add r0, r0, r4
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl ManagedSprite_SetPriority
	ldr r0, _021E61DC ; =0x000184E0
	ldrb r0, [r5, r0]
	add r0, r0, r4
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl ManagedSprite_SetPriority
	mov r0, #0x10
	mov r1, #0
	bl GfGfx_EngineBTogglePlanes
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _021E61D2
_021E60EE:
	mov r1, #0
	bl ov108_021E82E0
	cmp r0, #0
	beq _021E61D2
	ldr r2, _021E61E0 ; =0x000184E8
	mov r0, #1
	add r1, r2, #0
	str r0, [r5, r2]
	sub r1, #9
	sub r2, #8
	add r0, r5, #0
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r2]
	add r0, #0x1c
	bl SafariZone_SwapAreasInSet
	ldr r0, _021E61E4 ; =0x000184DF
	mov r3, #0x7a
	ldrb r2, [r5, r0]
	mov r0, #0xd2
	lsl r0, r0, #2
	add r1, r2, r4
	mul r3, r2
	add r2, r5, r3
	lsl r1, r1, #0x18
	ldrb r2, [r2, #0x1c]
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl ov108_021E84F8
	ldr r0, _021E61E4 ; =0x000184DF
	mov r2, #0x7a
	ldrb r1, [r5, r0]
	add r0, r5, #0
	mul r2, r1
	add r2, r5, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	ldr r0, _021E61DC ; =0x000184E0
	mov r3, #0x7a
	ldrb r2, [r5, r0]
	mov r0, #0xd2
	lsl r0, r0, #2
	add r1, r2, r4
	mul r3, r2
	add r2, r5, r3
	lsl r1, r1, #0x18
	ldrb r2, [r2, #0x1c]
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl ov108_021E84F8
	ldr r0, _021E61DC ; =0x000184E0
	mov r2, #0x7a
	ldrb r1, [r5, r0]
	add r0, r5, #0
	mul r2, r1
	add r2, r5, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _021E61D2
_021E6174:
	mov r1, #1
	bl ov108_021E82E0
	cmp r0, #0
	beq _021E61D2
	ldr r0, _021E61E4 ; =0x000184DF
	ldrb r0, [r5, r0]
	add r0, r0, r4
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	bl ManagedSprite_SetPriority
	ldr r0, _021E61DC ; =0x000184E0
	ldrb r0, [r5, r0]
	add r0, r0, r4
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	bl ManagedSprite_SetPriority
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _021E61D2
_021E61BA:
	sub r1, r2, #2
	ldrb r3, [r5, r1]
	sub r1, r2, #3
	strb r3, [r5, r1]
	bl ov108_021E6850
	mov r0, #0
	str r0, [r5, #8]
	mov r0, #2
	str r0, [r5, #0xc]
	mov r0, #4
	pop {r3, r4, r5, pc}
_021E61D2:
	mov r0, #3
	pop {r3, r4, r5, pc}
	nop
_021E61D8: .word 0x000184E2
_021E61DC: .word 0x000184E0
_021E61E0: .word 0x000184E8
_021E61E4: .word 0x000184DF
	thumb_func_end ov108_021E6090

	thumb_func_start ov108_021E61E8
ov108_021E61E8: ; 0x021E61E8
	push {r4, lr}
	ldr r2, _021E6230 ; =0x000184E2
	add r4, r0, #0
	ldrb r1, [r4, r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1b
	beq _021E6200
	cmp r1, #1
	beq _021E620C
	cmp r1, #2
	beq _021E6224
	pop {r4, pc}
_021E6200:
	sub r2, r2, #3
	ldrb r2, [r4, r2]
	mov r1, #0
	bl ov108_021E78F4
	pop {r4, pc}
_021E620C:
	sub r2, r2, #2
	ldrb r2, [r4, r2]
	mov r1, #1
	bl ov108_021E78F4
	ldr r2, _021E6234 ; =0x000184DF
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #2
	bl ov108_021E78F4
	pop {r4, pc}
_021E6224:
	sub r2, r2, #2
	ldrb r2, [r4, r2]
	mov r1, #0
	bl ov108_021E78F4
	pop {r4, pc}
	.balign 4, 0
_021E6230: .word 0x000184E2
_021E6234: .word 0x000184DF
	thumb_func_end ov108_021E61E8

	thumb_func_start ov108_021E6238
ov108_021E6238: ; 0x021E6238
	ldr r3, _021E623C ; =ov108_021E61E8
	bx r3
	.balign 4, 0
_021E623C: .word ov108_021E61E8
	thumb_func_end ov108_021E6238

	thumb_func_start ov108_021E6240
ov108_021E6240: ; 0x021E6240
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #1
	bne _021E6276
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021E6256
	mov r0, #0
	pop {r4, pc}
_021E6256:
	ldr r0, _021E62A8 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E62A4
	ldr r0, _021E62AC ; =0x000004C4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E626A
	add r0, r4, #0
	blx r1
_021E626A:
	add r0, r4, #0
	bl ov108_021E61E8
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
_021E6276:
	ldr r0, _021E62A8 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E6282
	mov r0, #0
	pop {r4, pc}
_021E6282:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _021E62A4
	ldr r0, _021E62B0 ; =0x000004C8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E6296
	add r0, r4, #0
	blx r1
_021E6296:
	add r0, r4, #0
	bl ov108_021E6238
	mov r0, #1
	str r0, [r4, #0x10]
	mov r0, #0
	pop {r4, pc}
_021E62A4:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E62A8: .word gSystem
_021E62AC: .word 0x000004C4
_021E62B0: .word 0x000004C8
	thumb_func_end ov108_021E6240

	thumb_func_start ov108_021E62B4
ov108_021E62B4: ; 0x021E62B4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _021E63A8 ; =gSystem
	ldr r4, [r0, #0x48]
	mov r0, #2
	tst r0, r4
	beq _021E62D0
	ldr r0, _021E63AC ; =0x000005DC
	bl PlaySE
	mov r0, #6
	str r0, [r5, #0xc]
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E62D0:
	mov r0, #1
	tst r0, r4
	beq _021E62FA
	ldr r0, _021E63B0 ; =0x000184DF
	ldrb r0, [r5, r0]
	cmp r0, #6
	ldr r0, _021E63AC ; =0x000005DC
	blo _021E62EC
	bl PlaySE
	mov r0, #6
	str r0, [r5, #0xc]
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E62EC:
	bl PlaySE
	add r0, r5, #0
	bl ov108_021E6A58
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E62FA:
	mov r0, #0xf0
	tst r0, r4
	bne _021E6304
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6304:
	ldr r0, _021E63B0 ; =0x000184DF
	mov r1, #3
	ldrb r6, [r5, r0]
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	add r0, r6, #0
	mov r1, #3
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	bhs _021E634A
	mov r0, #0x10
	tst r0, r4
	beq _021E6338
	add r0, r7, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	b _021E634A
_021E6338:
	mov r0, #0x20
	tst r0, r4
	beq _021E634A
	add r0, r7, #2
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
_021E634A:
	mov r0, #0x40
	tst r0, r4
	beq _021E635E
	add r0, r6, #2
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E6370
_021E635E:
	mov r0, #0x80
	tst r0, r4
	beq _021E6370
	add r0, r6, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
_021E6370:
	lsl r0, r6, #1
	add r0, r6, r0
	add r1, r7, r0
	ldr r0, _021E63B0 ; =0x000184DF
	cmp r6, #2
	strb r1, [r5, r0]
	blo _021E6388
	ldr r0, _021E63A8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc0
	tst r0, r1
	beq _021E638E
_021E6388:
	ldr r0, _021E63B4 ; =0x000005E5
	bl PlaySE
_021E638E:
	ldr r2, _021E63B0 ; =0x000184DF
	add r0, r5, #0
	ldrb r2, [r5, r2]
	mov r1, #0
	bl ov108_021E78F4
	ldr r1, _021E63B0 ; =0x000184DF
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov108_021E7CD8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E63A8: .word gSystem
_021E63AC: .word 0x000005DC
_021E63B0: .word 0x000184DF
_021E63B4: .word 0x000005E5
	thumb_func_end ov108_021E62B4

	thumb_func_start ov108_021E63B8
ov108_021E63B8: ; 0x021E63B8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _021E643C ; =ov108_021EA760
	bl TouchscreenHitbox_FindRectAtTouchNew
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021E63D2
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E63D2:
	cmp r0, #6
	bne _021E640C
	ldr r1, _021E6440 ; =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E6444 ; =gSystem + 0x40
	mov r0, #0xd
	lsl r0, r0, #6
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r4, r0]
	mov r1, #3
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _021E63FC
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E63FC:
	ldr r0, _021E6448 ; =0x000005DC
	bl PlaySE
	mov r0, #6
	str r0, [r4, #0xc]
	add sp, #8
	mov r0, #4
	pop {r4, pc}
_021E640C:
	ldr r2, _021E644C ; =0x000184DF
	mov r1, #0
	strb r0, [r4, r2]
	add r0, r2, #1
	strb r1, [r4, r0]
	ldrb r2, [r4, r2]
	add r0, r4, #0
	bl ov108_021E78F4
	ldr r1, _021E644C ; =0x000184DF
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E7CD8
	ldr r0, _021E6448 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov108_021E6A58
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	nop
_021E643C: .word ov108_021EA760
_021E6440: .word 0x0000FFFE
_021E6444: .word gSystem + 0x40
_021E6448: .word 0x000005DC
_021E644C: .word 0x000184DF
	thumb_func_end ov108_021E63B8

	thumb_func_start ov108_021E6450
ov108_021E6450: ; 0x021E6450
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E64B4 ; =0x000005DC
	bl PlaySE
	ldr r1, _021E64B8 ; =0x000184E3
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _021E646C
	add r0, r4, #0
	bl ov108_021E6B00
	mov r0, #1
	pop {r4, pc}
_021E646C:
	sub r0, r1, #3
	ldrb r3, [r4, r0]
	sub r0, r1, #5
	ldrb r2, [r4, r0]
	mov r0, #6
	mul r0, r2
	add r0, r3, r0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	add r0, r1, #5
	mov r3, #1
	str r3, [r4, r0]
	sub r1, r1, #4
	add r0, r4, #0
	ldrb r1, [r4, r1]
	add r0, #0x1c
	bl SafariZone_InitAreaInSet
	ldr r0, _021E64BC ; =0x000184DF
	mov r2, #0x7a
	ldrb r1, [r4, r0]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrb r2, [r2, #0x1c]
	bl ov108_021E7BB4
	mov r2, #0
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E79A8
	mov r0, #2
	pop {r4, pc}
	nop
_021E64B4: .word 0x000005DC
_021E64B8: .word 0x000184E3
_021E64BC: .word 0x000184DF
	thumb_func_end ov108_021E6450

	thumb_func_start ov108_021E64C0
ov108_021E64C0: ; 0x021E64C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _021E6694 ; =0x000184E0
	add r5, r0, #0
	ldrb r2, [r5, r1]
	str r2, [sp]
	ldr r2, _021E6698 ; =gSystem
	ldr r7, [r2, #0x48]
	mov r2, #2
	tst r2, r7
	beq _021E64E2
	ldr r0, _021E669C ; =0x000005DC
	bl PlaySE
	add sp, #8
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021E64E2:
	mov r2, #1
	tst r2, r7
	beq _021E6526
	ldr r2, [sp]
	cmp r2, #6
	blo _021E64FA
	ldr r0, _021E669C ; =0x000005DC
	bl PlaySE
	add sp, #8
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021E64FA:
	sub r2, r1, #2
	ldrb r3, [r5, r2]
	sub r1, r1, #1
	mov r2, #6
	add r4, r3, #0
	ldrb r3, [r5, r1]
	mov r1, #0x7a
	mul r4, r2
	mul r1, r3
	add r1, r5, r1
	ldr r2, [sp]
	ldrb r1, [r1, #0x1c]
	add r2, r2, r4
	cmp r2, r1
	bne _021E651E
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E651E:
	bl ov108_021E6450
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E6526:
	mov r0, #0xf0
	tst r0, r7
	bne _021E6532
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6532:
	ldr r0, [sp]
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	ldr r0, [sp]
	mov r1, #3
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x10
	tst r0, r7
	beq _021E65B6
	cmp r4, #2
	bhs _021E65B6
	cmp r6, #2
	bne _021E65A8
	cmp r4, #0
	bne _021E6576
	mov r0, #1
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r6, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E6644
_021E6576:
	cmp r4, #2
	bhs _021E6644
	ldr r1, _021E66A0 ; =0x000184DE
	ldrb r0, [r5, r1]
	cmp r0, #1
	bhs _021E6644
	mov r0, #1
	str r0, [sp, #4]
	add r0, r1, #4
	ldrb r2, [r5, r0]
	mov r0, #2
	bic r2, r0
	add r0, r1, #4
	strb r2, [r5, r0]
	ldr r0, [sp, #4]
	mov r1, #3
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r6, #1
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E6644
_021E65A8:
	add r0, r6, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E6644
_021E65B6:
	mov r0, #0x20
	tst r0, r7
	beq _021E661E
	cmp r4, #2
	bhs _021E661E
	cmp r6, #0
	bne _021E6610
	cmp r4, #1
	bne _021E65DE
	mov r0, #1
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r6, #2
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E6644
_021E65DE:
	cmp r4, #2
	bhs _021E6644
	ldr r1, _021E66A0 ; =0x000184DE
	ldrb r0, [r5, r1]
	cmp r0, #0
	beq _021E6644
	mov r0, #1
	str r0, [sp, #4]
	add r0, r1, #4
	ldrb r2, [r5, r0]
	mov r0, #2
	orr r2, r0
	add r0, r1, #4
	strb r2, [r5, r0]
	ldr r0, [sp, #4]
	mov r1, #3
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r6, #2
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E6644
_021E6610:
	add r0, r6, #2
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E6644
_021E661E:
	mov r0, #0x40
	tst r0, r7
	beq _021E6632
	add r0, r4, #2
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	b _021E6644
_021E6632:
	mov r0, #0x80
	tst r0, r7
	beq _021E6644
	add r0, r4, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
_021E6644:
	lsl r0, r4, #1
	add r0, r4, r0
	ldr r2, _021E6694 ; =0x000184E0
	add r0, r6, r0
	strb r0, [r5, r2]
	ldrb r2, [r5, r2]
	add r0, r5, #0
	mov r1, #1
	bl ov108_021E78F4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021E6676
	ldr r0, _021E66A4 ; =0x000005E1
	bl PlaySE
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E78C0
	add sp, #8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_021E6676:
	ldr r0, _021E6694 ; =0x000184E0
	ldrb r1, [r5, r0]
	ldr r0, [sp]
	cmp r0, r1
	beq _021E6686
	ldr r0, _021E66A8 ; =0x000005E5
	bl PlaySE
_021E6686:
	add r0, r5, #0
	bl ov108_021E7EB0
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6694: .word 0x000184E0
_021E6698: .word gSystem
_021E669C: .word 0x000005DC
_021E66A0: .word 0x000184DE
_021E66A4: .word 0x000005E1
_021E66A8: .word 0x000005E5
	thumb_func_end ov108_021E64C0

	thumb_func_start ov108_021E66AC
ov108_021E66AC: ; 0x021E66AC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _021E67E8 ; =ov108_021EA7D0
	bl TouchscreenHitbox_FindRectAtTouchNew
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021E66C6
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E66C6:
	cmp r0, #6
	beq _021E66D4
	cmp r0, #7
	beq _021E670C
	cmp r0, #8
	beq _021E675A
	b _021E67A6
_021E66D4:
	ldr r1, _021E67EC ; =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E67F0 ; =gSystem + 0x40
	mov r0, #0xd
	lsl r0, r0, #6
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r4, r0]
	mov r1, #3
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _021E66FA
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E66FA:
	ldr r0, _021E67F4 ; =0x000184E0
	mov r1, #6
	strb r1, [r4, r0]
	ldr r0, _021E67F8 ; =0x000005DC
	bl PlaySE
	add sp, #8
	mov r0, #2
	pop {r4, pc}
_021E670C:
	ldr r1, _021E67FC ; =0x000184DE
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _021E671A
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E671A:
	add r0, r1, #4
	ldrb r2, [r4, r0]
	mov r0, #2
	orr r2, r0
	add r0, r1, #4
	strb r2, [r4, r0]
	add r0, r1, #2
	mov r2, #5
	strb r2, [r4, r0]
	mov r2, #0
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E78C0
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Sprite_ResetAnimCtrlState
	ldr r0, _021E6800 ; =0x000005E1
	bl PlaySE
	add sp, #8
	mov r0, #3
	pop {r4, pc}
_021E675A:
	ldr r1, _021E67FC ; =0x000184DE
	ldrb r0, [r4, r1]
	cmp r0, #1
	bne _021E6768
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E6768:
	add r0, r1, #4
	ldrb r2, [r4, r0]
	mov r0, #2
	bic r2, r0
	add r0, r1, #4
	strb r2, [r4, r0]
	mov r2, #0
	add r0, r1, #2
	strb r2, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E78C0
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Sprite_ResetAnimCtrlState
	ldr r0, _021E6800 ; =0x000005E1
	bl PlaySE
	add sp, #8
	mov r0, #3
	pop {r4, pc}
_021E67A6:
	ldr r2, _021E67F4 ; =0x000184E0
	mov r1, #1
	strb r0, [r4, r2]
	ldrb r2, [r4, r2]
	add r0, r4, #0
	bl ov108_021E78F4
	add r0, r4, #0
	bl ov108_021E7EB0
	ldr r1, _021E67F4 ; =0x000184E0
	sub r0, r1, #2
	ldrb r2, [r4, r0]
	ldrb r3, [r4, r1]
	mov r0, #6
	mul r0, r2
	sub r1, r1, #1
	ldrb r2, [r4, r1]
	mov r1, #0x7a
	add r0, r3, r0
	mul r1, r2
	add r1, r4, r1
	ldrb r1, [r1, #0x1c]
	cmp r0, r1
	bne _021E67DE
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E67DE:
	add r0, r4, #0
	bl ov108_021E6450
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E67E8: .word ov108_021EA7D0
_021E67EC: .word 0x0000FFFE
_021E67F0: .word gSystem + 0x40
_021E67F4: .word 0x000184E0
_021E67F8: .word 0x000005DC
_021E67FC: .word 0x000184DE
_021E6800: .word 0x000005E1
	thumb_func_end ov108_021E66AC

	thumb_func_start ov108_021E6804
ov108_021E6804: ; 0x021E6804
	push {r4, lr}
	ldr r2, _021E6848 ; =0x000184E2
	add r4, r0, #0
	ldrb r3, [r4, r2]
	mov r1, #0xf8
	bic r3, r1
	mov r1, #0x10
	orr r1, r3
	strb r1, [r4, r2]
	sub r2, r2, #2
	ldrb r2, [r4, r2]
	mov r1, #0
	bl ov108_021E78F4
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	ldr r2, _021E684C ; =0x000184DF
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #3
	bl ov108_021E78F4
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	mov r3, #1
	bl ov108_021E7700
	pop {r4, pc}
	nop
_021E6848: .word 0x000184E2
_021E684C: .word 0x000184DF
	thumb_func_end ov108_021E6804

	thumb_func_start ov108_021E6850
ov108_021E6850: ; 0x021E6850
	push {r4, lr}
	ldr r2, _021E6890 ; =0x000184E2
	add r4, r0, #0
	ldrb r3, [r4, r2]
	mov r1, #0xf8
	bic r3, r1
	strb r3, [r4, r2]
	sub r2, r2, #3
	ldrb r2, [r4, r2]
	mov r1, #0
	bl ov108_021E78F4
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl thunk_Sprite_SetPriority
	mov r2, #0
	add r0, r4, #0
	mov r1, #3
	add r3, r2, #0
	bl ov108_021E78C0
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov108_021E7700
	pop {r4, pc}
	nop
_021E6890: .word 0x000184E2
	thumb_func_end ov108_021E6850

	thumb_func_start ov108_021E6894
ov108_021E6894: ; 0x021E6894
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021E698C ; =gSystem
	add r5, r0, #0
	ldr r4, [r1, #0x48]
	mov r1, #2
	tst r1, r4
	beq _021E68B4
	bl ov108_021E6850
	mov r0, #2
	str r0, [r5, #0xc]
	ldr r0, _021E6990 ; =0x000005DC
	bl PlaySE
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E68B4:
	mov r0, #1
	tst r0, r4
	beq _021E68E8
	ldr r0, _021E6994 ; =0x000184E0
	ldrb r1, [r5, r0]
	cmp r1, #6
	bhs _021E68CA
	sub r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r0, r1
	bne _021E68DE
_021E68CA:
	add r0, r5, #0
	bl ov108_021E6850
	mov r0, #2
	str r0, [r5, #0xc]
	ldr r0, _021E6990 ; =0x000005DC
	bl PlaySE
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E68DE:
	ldr r0, _021E6998 ; =0x0000069C
	bl PlaySE
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_021E68E8:
	mov r0, #0xf0
	tst r0, r4
	bne _021E68F2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E68F2:
	ldr r0, _021E6994 ; =0x000184E0
	mov r1, #3
	ldrb r6, [r5, r0]
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	add r0, r6, #0
	mov r1, #3
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	bhs _021E6938
	mov r0, #0x10
	tst r0, r4
	beq _021E6926
	add r0, r7, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	b _021E6938
_021E6926:
	mov r0, #0x20
	tst r0, r4
	beq _021E6938
	add r0, r7, #2
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
_021E6938:
	mov r0, #0x40
	tst r0, r4
	beq _021E694C
	add r0, r6, #2
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
	b _021E695E
_021E694C:
	mov r0, #0x80
	tst r0, r4
	beq _021E695E
	add r0, r6, #1
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r6, r0, #0x18
_021E695E:
	lsl r0, r6, #1
	add r0, r6, r0
	add r1, r7, r0
	ldr r0, _021E6994 ; =0x000184E0
	cmp r6, #2
	strb r1, [r5, r0]
	blo _021E6976
	ldr r0, _021E698C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc0
	tst r0, r1
	beq _021E697C
_021E6976:
	ldr r0, _021E699C ; =0x000005E5
	bl PlaySE
_021E697C:
	ldr r2, _021E6994 ; =0x000184E0
	add r0, r5, #0
	ldrb r2, [r5, r2]
	mov r1, #0
	bl ov108_021E78F4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E698C: .word gSystem
_021E6990: .word 0x000005DC
_021E6994: .word 0x000184E0
_021E6998: .word 0x0000069C
_021E699C: .word 0x000005E5
	thumb_func_end ov108_021E6894

	thumb_func_start ov108_021E69A0
ov108_021E69A0: ; 0x021E69A0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _021E6A3C ; =ov108_021EA760
	bl TouchscreenHitbox_FindRectAtTouchNew
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021E69BA
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E69BA:
	cmp r0, #6
	bne _021E6A00
	ldr r1, _021E6A40 ; =0x0000FFFE
	add r0, sp, #4
	strh r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r3, _021E6A44 ; =gSystem + 0x40
	mov r0, #0xd
	lsl r0, r0, #6
	ldrh r2, [r3, #0x20]
	ldrh r3, [r3, #0x22]
	ldr r0, [r4, r0]
	mov r1, #3
	bl DoesPixelAtScreenXYMatchPtrVal
	cmp r0, #0
	bne _021E69E4
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_021E69E4:
	ldr r0, _021E6A48 ; =0x000184E0
	mov r1, #6
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov108_021E6850
	mov r0, #2
	str r0, [r4, #0xc]
	ldr r0, _021E6A4C ; =0x000005DC
	bl PlaySE
	add sp, #8
	mov r0, #4
	pop {r4, pc}
_021E6A00:
	ldr r2, _021E6A50 ; =0x000184DF
	ldrb r1, [r4, r2]
	cmp r1, r0
	bne _021E6A1E
	add r0, r4, #0
	bl ov108_021E6850
	mov r0, #2
	str r0, [r4, #0xc]
	ldr r0, _021E6A4C ; =0x000005DC
	bl PlaySE
	add sp, #8
	mov r0, #4
	pop {r4, pc}
_021E6A1E:
	add r1, r2, #1
	strb r0, [r4, r1]
	add r2, r2, #1
	ldrb r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0
	bl ov108_021E78F4
	ldr r0, _021E6A54 ; =0x0000069C
	bl PlaySE
	mov r0, #3
	add sp, #8
	pop {r4, pc}
	nop
_021E6A3C: .word ov108_021EA760
_021E6A40: .word 0x0000FFFE
_021E6A44: .word gSystem + 0x40
_021E6A48: .word 0x000184E0
_021E6A4C: .word 0x000005DC
_021E6A50: .word 0x000184DF
_021E6A54: .word 0x0000069C
	thumb_func_end ov108_021E69A0

	thumb_func_start ov108_021E6A58
ov108_021E6A58: ; 0x021E6A58
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r0, #0
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r0, _021E6AE8 ; =_021EA720
	add r2, sp, #0xc
	ldrh r3, [r0, #0xc]
	ldr r5, _021E6AEC ; =ov108_021EA748
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #0xe]
	strh r3, [r2, #2]
	ldrh r3, [r0, #0x10]
	strh r3, [r2, #4]
	ldrh r3, [r0, #0x12]
	strh r3, [r2, #6]
	ldrh r3, [r0, #0x14]
	ldrh r0, [r0, #0x16]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	ldr r0, _021E6AF0 ; =0x000004B4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r3, [r4, r0]
	add r0, r0, #4
	str r3, [sp, #0x1c]
	mov r3, #3
	strb r3, [r2, #0x14]
	ldr r2, _021E6AF4 ; =0x000184DF
	ldrb r2, [r4, r2]
	lsl r3, r2, #2
	ldr r2, _021E6AF8 ; =ov108_021EA74A
	ldrh r2, [r2, r3]
	ldrh r3, [r5, r3]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp]
	mov r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	ldr r2, [r4, #0x10]
	lsl r3, r3, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r4, r0]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl TouchscreenListMenu_Create
	ldr r1, _021E6AFC ; =0x000004BC
	ldr r2, _021E6AF4 ; =0x000184DF
	str r0, [r4, r1]
	mov r1, #1
	ldrb r2, [r4, r2]
	add r0, r4, #0
	add r3, r1, #0
	bl ov108_021E79A8
	ldr r2, _021E6AF4 ; =0x000184DF
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #4
	mov r3, #1
	bl ov108_021E79A8
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_021E6AE8: .word _021EA720
_021E6AEC: .word ov108_021EA748
_021E6AF0: .word 0x000004B4
_021E6AF4: .word 0x000184DF
_021E6AF8: .word ov108_021EA74A
_021E6AFC: .word 0x000004BC
	thumb_func_end ov108_021E6A58

	thumb_func_start ov108_021E6B00
ov108_021E6B00: ; 0x021E6B00
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r0, #0x39
	str r1, [sp]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0xd
	str r1, [sp, #4]
	str r0, [sp, #0xc]
	mov r0, #0x1a
	add r2, sp, #0
	strb r0, [r2, #0x10]
	mov r0, #0x10
	strb r0, [r2, #0x11]
	ldrb r0, [r2, #0x12]
	mov r1, #0xf
	bic r0, r1
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf
	and r1, r3
	orr r0, r1
	strb r0, [r2, #0x12]
	ldrb r1, [r2, #0x12]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x13
	strb r1, [r2, #0x12]
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl YesNoPrompt_InitFromTemplate
	ldr r2, _021E6B98 ; =0x000184E0
	mov r1, #1
	ldrb r2, [r4, r2]
	add r0, r4, #0
	add r3, r1, #0
	bl ov108_021E79A8
	ldr r3, _021E6B9C ; =0x000184DF
	add r0, r4, #0
	add r2, r3, #1
	ldrb r1, [r4, r3]
	sub r3, r3, #1
	ldrb r5, [r4, r3]
	mov r3, #6
	ldrb r2, [r4, r2]
	mul r3, r5
	add r2, r2, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov108_021E7BB4
	add r0, r4, #0
	mov r1, #1
	bl ov108_021E767C
	mov r1, #1
	add r0, r4, #0
	mov r2, #3
	add r3, r1, #0
	bl ov108_021E7700
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021E6B98: .word 0x000184E0
_021E6B9C: .word 0x000184DF
	thumb_func_end ov108_021E6B00

	thumb_func_start ov108_021E6BA0
ov108_021E6BA0: ; 0x021E6BA0
	push {r4, lr}
	add r4, r0, #0
	bl ov108_021E8490
	ldr r3, _021E6C34 ; =0x000184E2
	ldrb r0, [r4, r3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E6C16
	mov r0, #0xd
	add r3, r3, #2
	lsl r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	mov r1, #1
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _021E6C38 ; =0x000184E4
	mov r0, #0xd
	lsl r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _021E6C3C ; =0x000184E6
	mov r0, #0xd
	lsl r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	mov r1, #4
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _021E6C3C ; =0x000184E6
	mov r0, #0xd
	lsl r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	mov r1, #6
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r3, _021E6C3C ; =0x000184E6
	mov r0, #0xd
	lsl r0, r0, #6
	ldrsh r3, [r4, r3]
	ldr r0, [r4, r0]
	mov r1, #5
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r1, _021E6C34 ; =0x000184E2
	mov r0, #1
	ldrb r2, [r4, r1]
	bic r2, r0
	strb r2, [r4, r1]
_021E6C16:
	bl GF_RunVramTransferTasks
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl DoScheduledBgGpuUpdates
	ldr r3, _021E6C40 ; =0x027E0000
	ldr r1, _021E6C44 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E6C34: .word 0x000184E2
_021E6C38: .word 0x000184E4
_021E6C3C: .word 0x000184E6
_021E6C40: .word 0x027E0000
_021E6C44: .word 0x00003FF8
	thumb_func_end ov108_021E6BA0

	thumb_func_start ov108_021E6C48
ov108_021E6C48: ; 0x021E6C48
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6C64 ; =ov108_021EA780
	add r3, sp, #0
	mov r2, #5
_021E6C52:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6C52
	add r0, sp, #0
	bl GfGfx_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E6C64: .word ov108_021EA780
	thumb_func_end ov108_021E6C48

	thumb_func_start ov108_021E6C68
ov108_021E6C68: ; 0x021E6C68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xf4
	add r5, r0, #0
	bl ov108_021E6C48
	ldr r2, _021E6D0C ; =0x04000304
	ldr r0, _021E6D10 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	ldr r0, [r5]
	bl BgConfig_Alloc
	mov r1, #0xd
	lsl r1, r1, #6
	add r3, sp, #4
	ldr r4, _021E6D14 ; =ov108_021EA738
	str r0, [r5, r1]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021E6D18 ; =ov108_021EA898
	add r3, sp, #0x14
	mov r2, #0x1c
_021E6CA2:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6CA2
	mov r4, #0
	add r7, r4, #0
	add r6, sp, #0x14
_021E6CB0:
	mov r0, #0xd
	lsl r0, r0, #6
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0xd
	lsl r0, r0, #6
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	lsl r0, r4, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	add r7, r7, #1
	add r4, r4, #1
	add r6, #0x1c
	cmp r7, #8
	blt _021E6CB0
	mov r0, #4
	str r0, [sp]
	mov r2, #0x1c
	ldr r0, _021E6D1C ; =0x04000050
	mov r1, #2
	add r3, r2, #0
	bl G2x_SetBlendAlpha_
	mov r0, #4
	str r0, [sp]
	ldr r0, _021E6D20 ; =0x04001050
	mov r1, #1
	mov r2, #0x1e
	mov r3, #0x1c
	bl G2x_SetBlendAlpha_
	add sp, #0xf4
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6D0C: .word 0x04000304
_021E6D10: .word 0xFFFF7FFF
_021E6D14: .word ov108_021EA738
_021E6D18: .word ov108_021EA898
_021E6D1C: .word 0x04000050
_021E6D20: .word 0x04001050
	thumb_func_end ov108_021E6C68

	thumb_func_start ov108_021E6D24
ov108_021E6D24: ; 0x021E6D24
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0
	add r5, r0, #0
	ldr r0, _021E6D74 ; =0x04000050
	add r2, r1, #0
	mov r3, #0x1f
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	mov r1, #0
	ldr r0, _021E6D78 ; =0x04001050
	add r2, r1, #0
	mov r3, #0x1f
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	mov r6, #0xd
	mov r4, #0
	lsl r6, r6, #6
_021E6D4C:
	lsl r1, r4, #0x18
	ldr r0, [r5, r6]
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	cmp r4, #8
	blt _021E6D4C
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl Heap_Free
	ldr r2, _021E6D7C ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E6D74: .word 0x04000050
_021E6D78: .word 0x04001050
_021E6D7C: .word 0x04000304
	thumb_func_end ov108_021E6D24

	thumb_func_start ov108_021E6D80
ov108_021E6D80: ; 0x021E6D80
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xa6
	bl NARC_New
	add r4, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	mov r0, #6
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	mov r0, #1
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	mov r0, #5
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	mov r1, #0
	str r1, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0xd
	str r1, [sp, #0x10]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	mov r0, #0xa
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	mov r0, #7
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	mov r0, #4
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	ldr r0, _021E6F4C ; =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6EA4
	mov r0, #1
	b _021E6EA6
_021E6EA4:
	mov r0, #0
_021E6EA6:
	add r0, r0, #2
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [r5]
	add r2, r4, #0
	mov r3, #0xa6
	bl sub_0208820C
	ldr r0, [r5]
	ldr r3, _021E6F50 ; =0x000004D8
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x4d
	lsl r3, r3, #4
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, r3, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r1, _021E6F54 ; =0x000004CC
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_Delete
	add r0, r5, #0
	bl ov108_021E7ADC
	add r0, r5, #0
	mov r1, #0xff
	mov r2, #0
	bl ov108_021E7BB4
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021E6F4C: .word 0x000184E3
_021E6F50: .word 0x000004D8
_021E6F54: .word 0x000004CC
	thumb_func_end ov108_021E6D80

	thumb_func_start ov108_021E6F58
ov108_021E6F58: ; 0x021E6F58
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Heap_Free
	ldr r0, _021E6F70 ; =0x000004CC
	ldr r0, [r4, r0]
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
_021E6F70: .word 0x000004CC
	thumb_func_end ov108_021E6F58

	thumb_func_start ov108_021E6F74
ov108_021E6F74: ; 0x021E6F74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	ldr r2, _021E7010 ; =0x000001AD
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	mov r1, #0xc1
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [r5]
	mov r0, #1
	mov r1, #0x11
	bl MessageFormat_New_Custom
	mov r1, #0xc2
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [r5]
	mov r0, #0x51
	bl String_New
	mov r1, #0xc3
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #8
	ldr r0, [r5, r1]
	mov r1, #9
	bl NewString_ReadMsgData
	mov r1, #0xcd
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x30
	ldr r0, [r5, r1]
	mov r1, #0xf
	bl NewString_ReadMsgData
	mov r1, #0xce
	lsl r1, r1, #2
	add r7, r1, #0
	str r0, [r5, r1]
	mov r4, #0
	add r6, r5, #0
	sub r7, #0x28
_021E6FD8:
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #4
	bl NewString_ReadMsgData
	str r0, [r6, r7]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #5
	blt _021E6FD8
	mov r7, #0xc9
	mov r4, #0
	add r6, r5, #0
	lsl r7, r7, #2
_021E6FF6:
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl NewString_ReadMsgData
	str r0, [r6, r7]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #4
	blt _021E6FF6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7010: .word 0x000001AD
	thumb_func_end ov108_021E6F74

	thumb_func_start ov108_021E7014
ov108_021E7014: ; 0x021E7014
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0xc9
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E7020:
	ldr r0, [r5, r7]
	bl String_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E7020
	mov r7, #0x31
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #4
_021E7036:
	ldr r0, [r4, r7]
	bl String_Delete
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #5
	blt _021E7036
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl String_Delete
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl String_Delete
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl String_Delete
	mov r0, #0xc2
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl MessageFormat_Delete
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov108_021E7014

	thumb_func_start ov108_021E7080
ov108_021E7080: ; 0x021E7080
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r7, r0, #0
	mov r0, #0xed
	lsl r0, r0, #2
	ldr r4, _021E71D8 ; =ov108_021EA7A8
	mov r6, #0
	add r5, r7, r0
_021E7090:
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r7, r0]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #4
	ble _021E7090
	mov r0, #5
	str r0, [sp, #0x24]
	mov r0, #1
	ldr r4, _021E71DC ; =0x000003A6
	str r0, [sp, #0x20]
	add r0, r4, #0
	add r0, #0xe
	mov r5, #0
	add r6, r7, r0
_021E70C2:
	ldr r0, [sp, #0x20]
	mov r2, #7
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x28]
	asr r0, r5, #1
	lsr r0, r0, #0x1e
	add r0, r5, r0
	asr r1, r0, #2
	mov r0, #1
	eor r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	lsl r0, r0, #1
	add r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0x16
	mul r1, r0
	str r1, [sp, #0x1c]
	sub r4, r4, r1
	ldr r1, [sp, #0x24]
	mov r3, #1
	lsl r1, r1, #4
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r1, [sp]
	mov r1, #0x16
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r1, [sp, #0x2c]
	ldr r0, [r7, r0]
	add r1, r6, r1
	bl AddWindowParameterized
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r1, r0, #2
	ldr r0, _021E71E0 ; =ov108_021EA724
	ldr r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x2c]
	lsl r1, r1, #0x18
	add r0, r6, r0
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x28]
	sub r4, r4, r0
	ldr r0, [sp, #0x24]
	mov r2, #7
	add r0, r0, #1
	lsl r0, r0, #4
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x18]
	mov r3, #0x1a
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r1, [sp, #0x30]
	ldr r0, [r7, r0]
	add r1, r6, r1
	bl AddWindowParameterized
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x30]
	lsl r1, r1, #0x18
	add r0, r6, r0
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x24]
	add r5, r5, #1
	add r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	sub r4, #0xa
	add r0, r0, #4
	str r0, [sp, #0x20]
	cmp r5, #5
	blt _021E70C2
	ldr r0, _021E71E4 ; =0x000004A4
	add r0, r7, r0
	bl InitWindow
	ldr r1, _021E71E8 ; =0x000002E1
	mov r0, #0
	str r1, [sp]
	add r1, #0x5f
	str r0, [sp, #4]
	ldr r0, [r7, r1]
	ldr r1, _021E71E4 ; =0x000004A4
	mov r2, #6
	add r1, r7, r1
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	ldr r0, _021E71E4 ; =0x000004A4
	mov r1, #0
	add r0, r7, r0
	bl FillWindowPixelBufferText_AssumeTileSize32
	ldr r0, [r7]
	bl YesNoPrompt_Create
	mov r1, #0x13
	lsl r1, r1, #6
	str r0, [r7, r1]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E71D8: .word ov108_021EA7A8
_021E71DC: .word 0x000003A6
_021E71E0: .word ov108_021EA724
_021E71E4: .word 0x000004A4
_021E71E8: .word 0x000002E1
	thumb_func_end ov108_021E7080

	thumb_func_start ov108_021E71EC
ov108_021E71EC: ; 0x021E71EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x13
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl YesNoPrompt_Destroy
	ldr r0, _021E7220 ; =0x000004A4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0xed
	lsl r0, r0, #2
	mov r4, #0
	add r5, r5, r0
_021E720A:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xf
	blt _021E720A
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7220: .word 0x000004A4
	thumb_func_end ov108_021E71EC

	thumb_func_start ov108_021E7224
ov108_021E7224: ; 0x021E7224
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #3
	bl ListMenuItems_New
	ldr r1, _021E729C ; =0x000004B4
	str r0, [r4, r1]
	ldr r1, [r4]
	mov r0, #2
	bl ListMenuItems_New
	ldr r1, _021E72A0 ; =0x000004B8
	mov r2, #7
	str r0, [r4, r1]
	sub r0, r1, #4
	mov r1, #0xc1
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r3, #0
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _021E729C ; =0x000004B4
	mov r1, #0xc1
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _021E729C ; =0x000004B4
	mov r1, #0xc1
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #6
	mov r3, #2
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _021E72A0 ; =0x000004B8
	mov r1, #0xc1
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #5
	mov r3, #0
	bl ListMenuItems_AppendFromMsgData
	ldr r0, _021E72A0 ; =0x000004B8
	mov r1, #0xc1
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #6
	mov r3, #1
	bl ListMenuItems_AppendFromMsgData
	pop {r4, pc}
	.balign 4, 0
_021E729C: .word 0x000004B4
_021E72A0: .word 0x000004B8
	thumb_func_end ov108_021E7224

	thumb_func_start ov108_021E72A4
ov108_021E72A4: ; 0x021E72A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E72C4 ; =0x000004B8
	ldr r0, [r4, r0]
	bl ListMenuItems_Delete
	ldr r0, _021E72C8 ; =0x000004B4
	ldr r0, [r4, r0]
	bl ListMenuItems_Delete
	ldr r0, _021E72C8 ; =0x000004B4
	mov r1, #0
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_021E72C4: .word 0x000004B8
_021E72C8: .word 0x000004B4
	thumb_func_end ov108_021E72A4

	thumb_func_start ov108_021E72CC
ov108_021E72CC: ; 0x021E72CC
	push {r4, lr}
	add r4, r0, #0
	bl ov108_021E838C
	ldr r0, [r4]
	mov r1, #0xc
	mov r2, #1
	mov r3, #2
	bl ov108_021E84A4
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov108_021E83F0
	ldr r0, [r4]
	mov r1, #0
	bl TouchscreenListMenuSpawner_Create
	mov r1, #0xd1
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4]
	mov r0, #1
	bl sub_02013534
	mov r1, #0xe7
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E72CC

	thumb_func_start ov108_021E730C
ov108_021E730C: ; 0x021E730C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xe7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020135AC
	mov r0, #0xd1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl TouchscreenListMenuSpawner_Destroy
	add r0, r4, #0
	bl ov108_021E844C
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov108_021E84DC
	add r0, r4, #0
	bl ov108_021E83C8
	pop {r4, pc}
	thumb_func_end ov108_021E730C

	thumb_func_start ov108_021E733C
ov108_021E733C: ; 0x021E733C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r4, #0
	add r7, r5, #0
	add r6, r5, #0
_021E7348:
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	str r1, [sp, #0x10]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #0x80
	str r0, [sp]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrb r0, [r7, #0x1c]
	ldr r2, [sp, #0x10]
	mov r1, #0x48
	mul r1, r2
	str r0, [sp, #8]
	mov r0, #1
	mov r2, #0x48
	mul r2, r3
	str r0, [sp, #0xc]
	mov r0, #0xd2
	lsl r0, r0, #2
	add r1, #0x38
	add r2, #0x38
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	mov r3, #2
	bl ov108_021E8540
	mov r1, #0xdb
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r4, r4, #1
	add r7, #0x7a
	add r6, r6, #4
	cmp r4, #6
	blt _021E7348
	mov r4, #0
	add r6, r5, #0
_021E73A4:
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	add r7, r1, #0
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	add r2, r0, #0
	mov r0, #0x80
	str r0, [sp]
	add r0, r4, #6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, _021E74FC ; =0x000184DE
	mov r3, #0x48
	ldrb r1, [r5, r0]
	mov r0, #6
	mul r3, r2
	mul r0, r1
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #1
	mov r1, #0x50
	str r0, [sp, #0xc]
	mov r0, #0xd2
	mul r1, r7
	lsl r0, r0, #2
	add r1, #0x30
	add r3, #0x38
	lsl r2, r3, #0x10
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	mov r3, #3
	bl ov108_021E8540
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #6
	blt _021E73A4
	sub r1, #0x38
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021E7500 ; =ov108_021EA7F8
	bl SpriteSystem_CreateSpriteFromResourceHeader
	mov r1, #0xd5
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #8
	sub r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7500 ; =ov108_021EA7F8
	bl SpriteSystem_CreateSpriteFromResourceHeader
	mov r1, #0xd6
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0xc
	sub r1, #8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7500 ; =ov108_021EA7F8
	bl SpriteSystem_CreateSpriteFromResourceHeader
	mov r1, #0x36
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x14
	sub r1, #0x10
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7504 ; =ov108_021EA820
	bl SpriteSystem_CreateSpriteFromResourceHeader
	mov r1, #0xd7
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x10
	sub r1, #0xc
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E7508 ; =ov108_021EA848
	bl SpriteSystem_CreateSpriteFromResourceHeader
	mov r1, #0xd9
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x18
	sub r1, #0x14
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E750C ; =ov108_021EA870
	bl SpriteSystem_CreateSpriteFromResourceHeader
	mov r1, #0xda
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x10
	ldr r0, [r5, r1]
	mov r1, #3
	bl thunk_Sprite_SetPriority
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl thunk_Sprite_SetPriority
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl thunk_Sprite_SetPriority
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #5
	bl thunk_Sprite_SetDrawPriority
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl thunk_Sprite_SetDrawFlag
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl thunk_Sprite_SetDrawFlag
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl thunk_Sprite_SetDrawFlag
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl thunk_Sprite_SetDrawFlag
	add r0, r5, #0
	bl ov108_021E756C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E74FC: .word 0x000184DE
_021E7500: .word ov108_021EA7F8
_021E7504: .word ov108_021EA820
_021E7508: .word ov108_021EA848
_021E750C: .word ov108_021EA870
	thumb_func_end ov108_021E733C

	thumb_func_start ov108_021E7510
ov108_021E7510: ; 0x021E7510
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov108_021E7650
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl thunk_Sprite_Delete
	mov r0, #0xd6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl thunk_Sprite_Delete
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl thunk_Sprite_Delete
	mov r0, #0x36
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl thunk_Sprite_Delete
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl thunk_Sprite_Delete
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl thunk_Sprite_Delete
	mov r6, #0xdb
	mov r4, #0
	lsl r6, r6, #2
_021E755A:
	ldr r0, [r5, r6]
	bl ov108_021E8674
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xc
	blt _021E755A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov108_021E7510

	thumb_func_start ov108_021E756C
ov108_021E756C: ; 0x021E756C
	push {r4, r5, r6, lr}
	sub sp, #0x40
	add r5, r0, #0
	ldr r0, _021E7648 ; =0x000004A4
	ldr r1, [r5]
	add r0, r5, r0
	bl sub_02013910
	mov r1, #0x3a
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_02013948
	add r6, r0, #0
	ldr r0, _021E7648 ; =0x000004A4
	add r0, r5, r0
	bl GetWindowWidth
	mov r1, #0x31
	lsl r1, r1, #4
	add r4, r0, #0
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r1, r4, #3
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	mov r2, #0x31
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E764C ; =0x000B0600
	lsl r2, r2, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _021E7648 ; =0x000004A4
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterizedWithColor
	mov r1, #0xe7
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, #0x4c
	str r0, [sp, #0x10]
	ldr r0, _021E7648 ; =0x000004A4
	add r0, r5, r0
	str r0, [sp, #0x14]
	ldr r0, [r5, r1]
	bl SpriteManager_GetSpriteList
	str r0, [sp, #0x18]
	mov r0, #0x35
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl SpriteManager_FindPlttResourceProxy
	str r0, [sp, #0x1c]
	mov r0, #3
	str r0, [sp, #0x30]
	mov r0, #0x80
	str r0, [sp, #0x34]
	mov r0, #0xc8
	mov r2, #1
	str r0, [sp, #0x28]
	mov r0, #0xac
	mov r3, #0xea
	lsl r3, r3, #2
	str r2, [sp, #0x38]
	str r0, [sp, #0x2c]
	ldr r0, [r5]
	mov r1, #0
	str r0, [sp, #0x3c]
	add r0, r6, #0
	add r3, r5, r3
	bl sub_02021AC8
	mov r1, #0xeb
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, #0xc
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r1, [r5, r1]
	add r0, sp, #0x10
	bl sub_02013950
	mov r1, #0xe9
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_020137C0
	mov r0, #0xe9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	bl sub_02013850
	add sp, #0x40
	pop {r4, r5, r6, pc}
	nop
_021E7648: .word 0x000004A4
_021E764C: .word 0x000B0600
	thumb_func_end ov108_021E756C

	thumb_func_start ov108_021E7650
ov108_021E7650: ; 0x021E7650
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xe9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020139C8
	mov r0, #0xea
	lsl r0, r0, #2
	add r0, r4, r0
	bl sub_02021B5C
	mov r0, #0xe9
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02013938
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E7650

	thumb_func_start ov108_021E767C
ov108_021E767C: ; 0x021E767C
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	mov r0, #0xd
	lsl r0, r0, #6
	add r4, r1, #0
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	ldr r0, _021E76FC ; =0x000004D8
	lsl r3, r4, #1
	add r2, r4, r3
	lsl r2, r2, #0x18
	ldr r0, [r5, r0]
	mov r1, #0x18
	str r1, [sp]
	add r1, r3, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	mov r4, #0x15
	sub r3, r4, r3
	lsl r3, r3, #0x18
	str r1, [sp, #0xc]
	lsr r2, r2, #0x18
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	lsr r3, r3, #0x18
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r2, r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl CopyToBgTilemapRect
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
_021E76FC: .word 0x000004D8
	thumb_func_end ov108_021E767C

	thumb_func_start ov108_021E7700
ov108_021E7700: ; 0x021E7700
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	lsl r5, r0, #4
	mov r0, #0xed
	lsl r0, r0, #2
	add r4, r7, r0
	add r0, r4, r5
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r6, r0, #0x18
	add r0, r4, r5
	bl GetWindowHeight
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	ldr r0, _021E77CC ; =0x00030102
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	cmp r0, #2
	beq _021E778A
	mov r0, #0xc9
	lsl r0, r0, #2
	add r0, r7, r0
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	mov r7, #4
	cmp r0, #1
	bhi _021E7780
	ldr r0, _021E77D0 ; =0x000D0C0E
	mov r1, #0xe
	str r0, [sp, #0x18]
	add r0, r4, r5
	bl FillWindowPixelBuffer
	mov r2, #0
	str r6, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, r5
	mov r1, #6
	add r3, r2, #0
	bl FillWindowPixelRect
	str r6, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r3, [sp, #0x1c]
	add r0, r4, r5
	sub r3, r3, #2
	lsl r3, r3, #0x10
	mov r1, #6
	mov r2, #0
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	b _021E77AC
_021E7780:
	add r0, r4, r5
	mov r1, #2
	bl FillWindowPixelBuffer
	b _021E77AC
_021E778A:
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r7, r0
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x24]
	lsl r2, r1, #2
	ldr r1, [sp, #0x24]
	mov r0, #0
	ldr r1, [r1, r2]
	add r2, r0, #0
	bl FontID_String_GetWidth
	sub r0, r6, r0
	lsl r0, r0, #0x17
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	mov r7, #4
_021E77AC:
	str r7, [sp]
	mov r1, #0
	ldr r0, [sp, #0x18]
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x14]
	add r0, r4, r5
	lsl r3, r2, #2
	ldr r2, [sp, #0x24]
	ldr r2, [r2, r3]
	ldr r3, [sp, #0x20]
	bl AddTextPrinterParameterizedWithColor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E77CC: .word 0x00030102
_021E77D0: .word 0x000D0C0E
	thumb_func_end ov108_021E7700

	thumb_func_start ov108_021E77D4
ov108_021E77D4: ; 0x021E77D4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0xf9
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r3, #1
	str r3, [sp]
	mov r0, #0xc2
	ldr r2, _021E78B8 ; =0x000184DE
	str r3, [sp, #4]
	ldrb r2, [r5, r2]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r2, #0xc2
	lsl r2, r2, #2
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x2c
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0xf9
	lsl r0, r0, #2
	add r0, r5, r0
	bl GetWindowWidth
	mov r1, #0xc3
	lsl r1, r1, #2
	add r4, r0, #0
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r1, r4, #3
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	mov r2, #0xf9
	ldr r0, _021E78BC ; =0x00030102
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r2, #2
	add r0, r5, r2
	str r1, [sp, #0xc]
	sub r2, #0xd8
	ldr r2, [r5, r2]
	bl AddTextPrinterParameterizedWithColor
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	ldr r0, _021E78B8 ; =0x000184DE
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E7878
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl Sprite_SetAnimCtrlSeq
	b _021E7884
_021E7878:
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	bl Sprite_SetAnimCtrlSeq
_021E7884:
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	ldr r0, _021E78B8 ; =0x000184DE
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021E78A8
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #7
	bl Sprite_SetAnimCtrlSeq
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021E78A8:
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	bl Sprite_SetAnimCtrlSeq
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E78B8: .word 0x000184DE
_021E78BC: .word 0x00030102
	thumb_func_end ov108_021E77D4

	thumb_func_start ov108_021E78C0
ov108_021E78C0: ; 0x021E78C0
	push {r4, r5, r6, lr}
	add r6, r2, #0
	cmp r3, #0
	bne _021E78DA
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
	pop {r4, r5, r6, pc}
_021E78DA:
	mov r2, #0xd5
	lsl r2, r2, #2
	lsl r4, r1, #2
	add r5, r0, r2
	ldr r0, [r5, r4]
	mov r1, #1
	bl Sprite_SetDrawFlag
	ldr r0, [r5, r4]
	add r1, r6, #0
	bl Sprite_SetAnimCtrlSeq
	pop {r4, r5, r6, pc}
	thumb_func_end ov108_021E78C0

	thumb_func_start ov108_021E78F4
ov108_021E78F4: ; 0x021E78F4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	mov r6, #0
	cmp r7, #6
	blo _021E790C
	mov r0, #0xe0
	str r0, [sp]
	mov r2, #0xb4
	mov r6, #1
	b _021E7984
_021E790C:
	cmp r4, #1
	beq _021E795E
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	mov r0, #0x48
	mul r0, r1
	add r0, #0x38
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	mov r1, #0x48
	mul r1, r0
	add r1, #0x38
	lsl r0, r1, #0x10
	asr r2, r0, #0x10
	cmp r4, #2
	bne _021E7942
	add r2, #0xc0
	lsl r0, r2, #0x10
	asr r2, r0, #0x10
	b _021E7984
_021E7942:
	cmp r4, #3
	bne _021E794A
	mov r6, #2
	b _021E7984
_021E794A:
	cmp r4, #0
	bne _021E7984
	ldr r0, _021E79A4 ; =0x000184E2
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	cmp r0, #2
	bne _021E7984
	mov r6, #3
	b _021E7984
_021E795E:
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	mov r0, #0x50
	mul r0, r1
	add r0, #0x30
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	mov r1, #0x48
	mul r1, r0
	add r1, #0x38
	lsl r0, r1, #0x10
	asr r2, r0, #0x10
_021E7984:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0xd5
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [sp]
	bl Sprite_SetPositionXY
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl ov108_021E78C0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E79A4: .word 0x000184E2
	thumb_func_end ov108_021E78F4

	thumb_func_start ov108_021E79A8
ov108_021E79A8: ; 0x021E79A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	cmp r3, #0
	bne _021E79D0
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl BgClearTilemapBufferAndCommit
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_021E79D0:
	ldr r0, _021E7AD4 ; =0x000004D4
	mov r2, #0x20
	ldr r0, [r5, r0]
	mov r6, #0x18
	str r2, [sp]
	add r2, r0, #0
	str r6, [sp, #4]
	add r2, #0xc
	str r2, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldrh r2, [r0]
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r2, r3, #0
	ldr r3, _021E7AD8 ; =0x000184E2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldrb r3, [r5, r3]
	mov r0, #0xd
	lsl r0, r0, #6
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1b
	mul r6, r3
	lsl r3, r6, #0x18
	ldr r0, [r5, r0]
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	ldr r0, _021E7AD8 ; =0x000184E2
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	bne _021E7A80
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #3
	add r0, r1, r0
	add r0, r0, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	lsl r1, r0, #3
	add r0, r0, r1
	add r0, r0, #3
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r4, #4
	bne _021E7AA6
	ldr r0, _021E7AD4 ; =0x000004D4
	mov r1, #0x20
	ldr r0, [r5, r0]
	mov r2, #0
	str r1, [sp]
	mov r1, #3
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r3, #0x15
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r1, r4, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl CopyToBgTilemapRect
	b _021E7AA6
_021E7A80:
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	mov r0, #0xa
	mul r0, r1
	add r0, r0, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	lsl r1, r0, #3
	add r0, r0, r1
	add r0, #0x1b
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_021E7AA6:
	str r6, [sp]
	mov r0, #8
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	add r1, r4, #0
	mov r2, #0
	bl FillBgTilemapRect
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7AD4: .word 0x000004D4
_021E7AD8: .word 0x000184E2
	thumb_func_end ov108_021E79A8

	thumb_func_start ov108_021E7ADC
ov108_021E7ADC: ; 0x021E7ADC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #0x10]
	mov r0, #0
	mov r5, #1
	str r0, [sp, #0x1c]
_021E7AE8:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	mov r1, #3
	bl _s32_div_f
	lsl r1, r0, #3
	add r0, r0, r1
	add r0, r0, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	mov r1, #3
	bl _s32_div_f
	lsl r0, r1, #3
	add r0, r1, r0
	add r0, r0, #3
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_021E7B12:
	ldr r0, [sp, #0x14]
	mov r4, #0
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_021E7B1A:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x11
	lsl r2, r5, #0x10
	str r0, [sp, #0xc]
	mov r0, #0xd
	add r3, r7, r4
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x10]
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	mov r1, #5
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	add r5, r5, #1
	bl FillBgTilemapRect
	add r4, r4, #1
	cmp r4, #8
	blt _021E7B1A
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #8
	blt _021E7B12
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #6
	blt _021E7AE8
	mov r1, #0xd
	ldr r0, [sp, #0x10]
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov108_021E7ADC

	thumb_func_start ov108_021E7B74
ov108_021E7B74: ; 0x021E7B74
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r3, #0x12
	add r4, r2, #0
	str r0, [sp]
	add r0, r1, #0
	add r1, r3, #0
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetCharDataFromOpenNarc
	add r6, r0, #0
	lsl r0, r4, #6
	add r0, r0, #1
	str r0, [sp]
	mov r0, #0xd
	ldr r2, [sp, #4]
	lsl r0, r0, #6
	mov r3, #1
	ldr r0, [r5, r0]
	ldr r2, [r2, #0x14]
	mov r1, #5
	lsl r3, r3, #0xc
	bl BG_LoadCharTilesData
	add r0, r6, #0
	bl Heap_Free
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov108_021E7B74

	thumb_func_start ov108_021E7BB4
ov108_021E7BB4: ; 0x021E7BB4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r4, r1, #0
	ldr r1, [r6]
	mov r0, #0xa6
	add r5, r2, #0
	bl NARC_New
	add r7, r0, #0
	cmp r4, #6
	blo _021E7BE6
	mov r4, #0
	add r5, r6, #0
_021E7BCE:
	ldrb r3, [r5, #0x1c]
	lsl r2, r4, #0x18
	add r0, r6, #0
	add r1, r7, #0
	lsr r2, r2, #0x18
	bl ov108_021E7B74
	add r4, r4, #1
	add r5, #0x7a
	cmp r4, #6
	blt _021E7BCE
	b _021E7BF2
_021E7BE6:
	add r0, r6, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r5, #0
	bl ov108_021E7B74
_021E7BF2:
	add r0, r7, #0
	bl NARC_Delete
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov108_021E7BB4

	thumb_func_start ov108_021E7BFC
ov108_021E7BFC: ; 0x021E7BFC
	push {r4, lr}
	add r4, r0, #0
	bl ov108_021E7C5C
	ldr r1, _021E7C54 ; =0x000184DF
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E7CD8
	add r0, r4, #0
	mov r1, #0
	bl ov108_021E767C
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov108_021E7700
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _021E7C30
	add r0, r4, #0
	bl ov108_021E61E8
	b _021E7C36
_021E7C30:
	add r0, r4, #0
	bl ov108_021E6238
_021E7C36:
	ldr r0, _021E7C58 ; =0x000184E4
	mov r2, #0
	strh r2, [r4, r0]
	sub r2, #0xc0
	add r1, r0, #2
	strh r2, [r4, r1]
	sub r1, r0, #2
	ldrb r2, [r4, r1]
	mov r1, #1
	sub r0, r0, #2
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_021E7C54: .word 0x000184DF
_021E7C58: .word 0x000184E4
	thumb_func_end ov108_021E7BFC

	thumb_func_start ov108_021E7C5C
ov108_021E7C5C: ; 0x021E7C5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, _021E7CD0 ; =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E7CCC
	mov r0, #0xed
	lsl r0, r0, #2
	add r0, r5, r0
	mov r4, #0
	mov r6, #5
	str r0, [sp, #0x10]
_021E7C76:
	mov r0, #0xc1
	mov r2, #0xc3
	lsl r0, r0, #2
	lsl r2, r2, #2
	add r1, r4, #0
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	add r1, #0xa
	lsl r7, r6, #4
	bl ReadMsgDataIntoString
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r1, r0, #2
	ldr r0, _021E7CD4 ; =ov108_021EA724
	mov r2, #0xc3
	ldr r0, [r0, r1]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r0, r7
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x10]
	add r0, r0, r7
	bl CopyWindowToVram
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #5
	blt _021E7C76
_021E7CCC:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7CD0: .word 0x000184E3
_021E7CD4: .word ov108_021EA724
	thumb_func_end ov108_021E7C5C

	thumb_func_start ov108_021E7CD8
ov108_021E7CD8: ; 0x021E7CD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	cmp r1, #6
	blo _021E7D3E
	ldr r0, _021E7EA4 ; =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E7D24
	mov r0, #0xed
	lsl r0, r0, #2
	mov r6, #0
	mov r4, #6
	add r7, r5, r0
_021E7CF4:
	lsr r3, r6, #0x1f
	lsl r2, r6, #0x1f
	sub r2, r2, r3
	mov r1, #0x1f
	ror r2, r1
	add r1, r3, r2
	lsl r2, r1, #2
	ldr r1, _021E7EA8 ; =ov108_021EA724
	lsl r0, r4, #4
	ldr r1, [r1, r2]
	str r0, [sp, #0x20]
	lsl r1, r1, #0x18
	add r0, r7, r0
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x20]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, #5
	blt _021E7CF4
_021E7D24:
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xc
	bl FillWindowPixelBuffer
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_021E7D3E:
	add r3, r5, #0
	mov r6, #0xfd
	mov r0, #0x7a
	add r2, r1, #0
	add r3, #0x1c
	mul r2, r0
	add r0, r3, r2
	ldrb r1, [r3, r2]
	lsl r6, r6, #2
	str r0, [sp, #0x1c]
	add r0, r6, #0
	add r2, r6, #0
	sub r0, #0xf0
	sub r2, #0xe8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	add r1, #0x10
	bl ReadMsgDataIntoString
	add r0, r5, r6
	bl GetWindowWidth
	add r1, r6, #0
	sub r1, #0xe8
	add r4, r0, #0
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r1, r4, #3
	sub r0, r1, r0
	lsl r0, r0, #0x17
	lsr r4, r0, #0x18
	add r0, r5, r6
	mov r1, #0xc
	bl FillWindowPixelBuffer
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7EAC ; =0x00080B0C
	add r2, r6, #0
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	sub r2, #0xe8
	ldr r2, [r5, r2]
	add r0, r5, r6
	add r3, r4, #0
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	ldr r0, _021E7EA4 ; =0x000184E3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E7E9E
	add r0, sp, #0x24
	add r0, #3
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	ldr r0, [sp, #0x1c]
	mov r4, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	ble _021E7E02
	ldr r6, [sp, #0x1c]
	add r7, sp, #0x24
_021E7DD0:
	ldrb r1, [r6, #2]
	add r0, sp, #0x24
	mov r2, #2
	bl sub_02097268
	ldrb r1, [r7, #2]
	cmp r1, #0
	bne _021E7DE8
	ldrb r0, [r7, #7]
	add r0, r0, #1
	strb r0, [r7, #7]
	b _021E7DF6
_021E7DE8:
	add r0, sp, #0x24
	add r0, #3
	add r0, r0, r1
	sub r0, r0, #1
	ldrb r1, [r0]
	add r1, r1, #1
	strb r1, [r0]
_021E7DF6:
	ldr r0, [sp, #0x1c]
	add r4, r4, #1
	ldrb r0, [r0, #1]
	add r6, r6, #4
	cmp r4, r0
	blt _021E7DD0
_021E7E02:
	mov r0, #6
	str r0, [sp, #0x18]
	add r0, sp, #0x24
	add r0, #3
	str r0, [sp, #0x14]
	mov r0, #0xed
	lsl r0, r0, #2
	mov r7, #0
	add r6, r5, r0
_021E7E14:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x14]
	lsl r4, r0, #4
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xc2
	lsl r0, r0, #2
	ldrb r2, [r2]
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0xc2
	mov r1, #0xc3
	mov r2, #0xce
	lsl r0, r0, #2
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	lsr r2, r7, #0x1f
	lsl r1, r7, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r1, r0, #2
	ldr r0, _021E7EA8 ; =ov108_021EA724
	ldr r0, [r0, r1]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, r6, r4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	mov r2, #0xc3
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r2, r2, #2
	mov r1, #0
	ldr r2, [r5, r2]
	add r0, r6, r4
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, r4
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x18]
	add r7, r7, #1
	add r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r7, #5
	blt _021E7E14
_021E7E9E:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7EA4: .word 0x000184E3
_021E7EA8: .word ov108_021EA724
_021E7EAC: .word 0x00080B0C
	thumb_func_end ov108_021E7CD8

	thumb_func_start ov108_021E7EB0
ov108_021E7EB0: ; 0x021E7EB0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r4, #0xfd
	add r5, r0, #0
	lsl r4, r4, #2
	add r0, r5, r4
	mov r1, #0xc
	bl FillWindowPixelBuffer
	ldr r1, _021E7F70 ; =0x000184DF
	add r2, r4, #0
	ldrb r3, [r5, r1]
	mov r1, #0x7a
	sub r2, #0xf0
	mul r1, r3
	add r1, r5, r1
	ldrb r1, [r1, #0x1c]
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, #0x10
	bl ReadMsgDataIntoString
	add r1, r4, #0
	sub r1, #0xe8
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x60
	sub r0, r1, r0
	lsl r0, r0, #0x17
	lsr r3, r0, #0x18
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7F74 ; =0x00080B0C
	add r2, r4, #0
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	sub r2, #0xe8
	ldr r2, [r5, r2]
	add r0, r5, r4
	bl AddTextPrinterParameterizedWithColor
	ldr r3, _021E7F78 ; =0x000184E0
	ldrb r1, [r5, r3]
	cmp r1, #6
	bhs _021E7F66
	sub r3, r3, #2
	add r2, r4, #0
	ldrb r6, [r5, r3]
	sub r2, #0xf0
	ldr r0, [r5, r2]
	mov r3, #6
	add r2, #8
	add r1, #0x10
	mul r3, r6
	ldr r2, [r5, r2]
	add r1, r1, r3
	bl ReadMsgDataIntoString
	add r1, r4, #0
	sub r1, #0xe8
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0x60
	sub r0, r1, r0
	lsl r0, r0, #0x17
	lsr r3, r0, #0x18
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7F74 ; =0x00080B0C
	add r2, r4, #0
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	sub r2, #0xe8
	ldr r2, [r5, r2]
	add r0, r5, r4
	add r3, #0x90
	bl AddTextPrinterParameterizedWithColor
_021E7F66:
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E7F70: .word 0x000184DF
_021E7F74: .word 0x00080B0C
_021E7F78: .word 0x000184E0
	thumb_func_end ov108_021E7EB0

	thumb_func_start ov108_021E7F7C
ov108_021E7F7C: ; 0x021E7F7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r1, _021E80DC ; =0x000184E2
	add r6, r0, #0
	ldrb r1, [r6, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1b
	bne _021E7FF4
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	mov r0, #0xd
	lsl r0, r0, #6
	mov r2, #0
	ldr r0, [r6, r0]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xbf
	ldr r2, _021E80E0 ; =0x000184E6
	mvn r0, r0
	strh r0, [r6, r2]
	sub r0, r2, #4
	ldrb r3, [r6, r0]
	mov r0, #1
	mov r1, #1
	bic r3, r0
	orr r3, r1
	sub r0, r2, #4
	strb r3, [r6, r0]
	sub r0, r2, #6
	mov r3, #0
	strb r3, [r6, r0]
	sub r2, r2, #6
	ldrb r2, [r6, r2]
	add r0, r6, #0
	bl ov108_021E78F4
	ldr r2, _021E80E4 ; =0x000184DF
	add r0, r6, #0
	ldrb r2, [r6, r2]
	mov r1, #2
	bl ov108_021E78F4
	add r0, r6, #0
	bl ov108_021E77D4
	b _021E807E
_021E7FF4:
	mov r1, #1
	mov r2, #0xff
	mov r3, #0
	bl ov108_021E79A8
	mov r2, #0
	add r0, r6, #0
	mov r1, #1
	add r3, r2, #0
	bl ov108_021E78C0
	ldr r0, _021E80DC ; =0x000184E2
	mov r4, #0
	ldrb r0, [r6, r0]
	add r7, r6, #0
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1f
	mov r0, #6
	mul r0, r1
	str r0, [sp, #0x14]
	lsl r0, r0, #2
	add r5, r6, r0
_021E8020:
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	str r1, [sp, #0x10]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r2, [sp, #0x10]
	mov r1, #0x48
	mul r1, r2
	mov r2, #0x48
	mul r2, r3
	add r1, #0x38
	sub r2, #0x88
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ManagedSprite_SetPositionXY
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl ManagedSprite_SetPriority
	ldr r1, [sp, #0x14]
	mov r0, #0xd2
	lsl r0, r0, #2
	add r1, r4, r1
	lsl r1, r1, #0x18
	ldrb r2, [r7, #0x1c]
	ldr r0, [r6, r0]
	lsr r1, r1, #0x18
	bl ov108_021E84F8
	add r4, r4, #1
	add r5, r5, #4
	add r7, #0x7a
	cmp r4, #6
	blt _021E8020
_021E807E:
	ldr r0, _021E80E8 ; =0x000184E1
	mov r1, #0
	strb r1, [r6, r0]
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r6, r0
	mov r1, #0xc
	bl FillWindowPixelBuffer
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _021E80EC ; =0x04001040
	mov r1, #0xf0
	strh r1, [r0]
	mov r1, #0x10
	add r4, r0, #0
	strh r1, [r0, #4]
	add r4, #8
	ldrh r3, [r4]
	mov r2, #0x3f
	mov r1, #0xf
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r4]
	add r4, r0, #0
	add r4, #0xa
	ldrh r5, [r4]
	mov r1, #0x1f
	sub r0, #0x40
	bic r5, r2
	orr r1, r5
	orr r1, r3
	strh r1, [r4]
	ldr r2, [r0]
	ldr r1, _021E80F0 ; =0xFFFF1FFF
	and r2, r1
	lsl r1, r3, #8
	orr r1, r2
	str r1, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E80DC: .word 0x000184E2
_021E80E0: .word 0x000184E6
_021E80E4: .word 0x000184DF
_021E80E8: .word 0x000184E1
_021E80EC: .word 0x04001040
_021E80F0: .word 0xFFFF1FFF
	thumb_func_end ov108_021E7F7C

	thumb_func_start ov108_021E80F4
ov108_021E80F4: ; 0x021E80F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _021E81A0 ; =0x000184E2
	ldrb r1, [r5, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1b
	bne _021E811A
	add r1, r0, #2
	ldrsh r2, [r5, r1]
	mov r7, #0x17
	mvn r7, r7
	add r2, #0x18
	strh r2, [r5, r1]
	add r1, r0, #4
	ldrsh r1, [r5, r1]
	add r0, r0, #4
	add r1, #0x18
	strh r1, [r5, r0]
	b _021E812E
_021E811A:
	add r1, r0, #2
	ldrsh r2, [r5, r1]
	mov r7, #0x18
	sub r2, #0x18
	strh r2, [r5, r1]
	add r1, r0, #4
	ldrsh r1, [r5, r1]
	add r0, r0, #4
	sub r1, #0x18
	strh r1, [r5, r0]
_021E812E:
	ldr r1, _021E81A0 ; =0x000184E2
	mov r0, #1
	ldrb r2, [r5, r1]
	mov r4, #0
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r5, r1]
	lsl r0, r7, #0x10
	asr r6, r0, #0x10
_021E8142:
	ldr r0, _021E81A0 ; =0x000184E2
	add r2, r6, #0
	ldrb r0, [r5, r0]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1f
	mov r0, #6
	mul r0, r1
	add r0, r4, r0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl ManagedSprite_OffsetPositionXY
	add r4, r4, #1
	cmp r4, #6
	blt _021E8142
	mov r0, #0xd5
	lsl r0, r0, #2
	lsl r2, r7, #0x10
	ldr r0, [r5, r0]
	mov r1, #0
	asr r2, r2, #0x10
	bl Sprite_OffsetPositionXY
	mov r0, #0xd7
	lsl r0, r0, #2
	lsl r2, r7, #0x10
	ldr r0, [r5, r0]
	mov r1, #0
	asr r2, r2, #0x10
	bl Sprite_OffsetPositionXY
	ldr r0, _021E81A4 ; =0x000184E1
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	ldrb r0, [r5, r0]
	cmp r0, #8
	blo _021E819A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E819A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E81A0: .word 0x000184E2
_021E81A4: .word 0x000184E1
	thumb_func_end ov108_021E80F4

	thumb_func_start ov108_021E81A8
ov108_021E81A8: ; 0x021E81A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _021E8264 ; =0x000184E2
	add r6, r0, #0
	ldrb r0, [r6, r1]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _021E81CA
	sub r0, r1, #4
	ldrb r0, [r6, r0]
	add r2, r0, #1
	sub r0, r1, #4
	strb r2, [r6, r0]
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	b _021E81DA
_021E81CA:
	sub r0, r1, #4
	ldrb r0, [r6, r0]
	sub r2, r0, #1
	sub r0, r1, #4
	strb r2, [r6, r0]
	mov r0, #0xff
	mvn r0, r0
	str r0, [sp]
_021E81DA:
	ldr r0, _021E8264 ; =0x000184E2
	mov r4, #0
	ldrb r0, [r6, r0]
	lsl r0, r0, #0x1d
	lsr r1, r0, #0x1f
	mov r0, #6
	mul r0, r1
	str r0, [sp, #4]
	lsl r0, r0, #2
	add r5, r6, r0
_021E81EE:
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	add r7, r1, #0
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	mov r1, #0x50
	mul r1, r7
	add r2, r0, #0
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r3, [sp]
	add r1, #0x30
	add r1, r3, r1
	mov r3, #0x48
	mul r3, r2
	add r3, #0x38
	lsl r1, r1, #0x10
	lsl r2, r3, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ManagedSprite_SetPositionXY
	ldr r2, _021E8268 ; =0x000184DE
	ldr r1, [sp, #4]
	ldrb r3, [r6, r2]
	mov r2, #6
	mov r0, #0xd2
	mul r2, r3
	lsl r0, r0, #2
	add r1, r4, r1
	add r2, r4, r2
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r6, r0]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl ov108_021E84F8
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl ManagedSprite_SetPriority
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _021E81EE
	ldr r0, _021E826C ; =0x000184E1
	mov r1, #0
	strb r1, [r6, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8264: .word 0x000184E2
_021E8268: .word 0x000184DE
_021E826C: .word 0x000184E1
	thumb_func_end ov108_021E81A8

	thumb_func_start ov108_021E8270
ov108_021E8270: ; 0x021E8270
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _021E82D8 ; =0x000184E2
	ldrb r0, [r7, r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _021E8284
	mov r0, #0x1f
	mvn r0, r0
	b _021E8286
_021E8284:
	mov r0, #0x20
_021E8286:
	lsl r0, r0, #0x10
	mov r4, #0
	add r5, r7, #0
	asr r6, r0, #0x10
_021E828E:
	mov r0, #0xdb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	mov r2, #0
	bl ManagedSprite_OffsetPositionXY
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xc
	blt _021E828E
	ldr r2, _021E82DC ; =0x000184E1
	ldrb r0, [r7, r2]
	add r0, r0, #1
	strb r0, [r7, r2]
	ldrb r0, [r7, r2]
	cmp r0, #8
	blo _021E82D2
	mov r0, #0
	strb r0, [r7, r2]
	sub r2, r2, #1
	ldrb r2, [r7, r2]
	add r0, r7, #0
	mov r1, #1
	bl ov108_021E78F4
	add r0, r7, #0
	bl ov108_021E7EB0
	add r0, r7, #0
	bl ov108_021E77D4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E82D2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E82D8: .word 0x000184E2
_021E82DC: .word 0x000184E1
	thumb_func_end ov108_021E8270

	thumb_func_start ov108_021E82E0
ov108_021E82E0: ; 0x021E82E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp]
	ldr r1, _021E837C ; =0x000184E2
	add r6, r0, #0
	ldrb r0, [r6, r1]
	add r3, sp, #8
	lsl r0, r0, #0x1d
	lsr r2, r0, #0x1f
	mov r0, #6
	mul r0, r2
	sub r2, r1, #3
	ldrb r2, [r6, r2]
	add r2, r2, r0
	strb r2, [r3, #2]
	sub r2, r1, #2
	ldrb r2, [r6, r2]
	add r0, r2, r0
	strb r0, [r3, #3]
	sub r0, r1, #3
	ldrb r0, [r6, r0]
	mov r1, #3
	bl _s32_div_f
	add r1, sp, #8
	strb r0, [r1]
	ldr r0, _021E8380 ; =0x000184E0
	mov r1, #3
	ldrb r0, [r6, r0]
	bl _s32_div_f
	add r1, sp, #8
	strb r0, [r1, #1]
	ldr r0, [sp]
	add r5, sp, #8
	ldr r1, _021E8384 ; =_021EA720
	lsl r0, r0, #1
	add r0, r1, r0
	mov r7, #0
	add r4, sp, #8
	add r5, #2
	str r0, [sp, #4]
_021E8334:
	ldrb r3, [r4]
	ldrb r0, [r5]
	ldr r2, [sp, #4]
	ldrsb r3, [r2, r3]
	lsl r0, r0, #2
	add r1, r6, r0
	mov r0, #0xdb
	mov r2, #0xc
	lsl r0, r0, #2
	mul r2, r3
	ldr r0, [r1, r0]
	lsl r2, r2, #0x10
	mov r1, #0
	asr r2, r2, #0x10
	bl ManagedSprite_OffsetPositionXY
	add r7, r7, #1
	add r4, r4, #1
	add r5, r5, #1
	cmp r7, #2
	blt _021E8334
	ldr r0, _021E8388 ; =0x000184E1
	ldrb r1, [r6, r0]
	add r1, r1, #1
	strb r1, [r6, r0]
	ldrb r1, [r6, r0]
	cmp r1, #8
	blo _021E8376
	mov r1, #0
	strb r1, [r6, r0]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E8376:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E837C: .word 0x000184E2
_021E8380: .word 0x000184E0
_021E8384: .word _021EA720
_021E8388: .word 0x000184E1
	thumb_func_end ov108_021E82E0

	thumb_func_start ov108_021E838C
ov108_021E838C: ; 0x021E838C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r4]
	bl SpriteSystem_Alloc
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _021E83C0 ; =ov108_021EA9A0
	ldr r2, _021E83C4 ; =ov108_021EA98C
	mov r3, #4
	bl SpriteSystem_Init
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	pop {r4, pc}
	nop
_021E83C0: .word ov108_021EA9A0
_021E83C4: .word ov108_021EA98C
	thumb_func_end ov108_021E838C

	thumb_func_start ov108_021E83C8
ov108_021E83C8: ; 0x021E83C8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl SpriteSystem_Free
	mov r0, #0xd3
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	pop {r4, pc}
	thumb_func_end ov108_021E83C8

	thumb_func_start ov108_021E83F0
ov108_021E83F0: ; 0x021E83F0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E8442
	bl SpriteManager_New
	mov r1, #0x35
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x8c
	bl SpriteSystem_InitSprites
	mov r1, #0xd3
	mov r0, #0
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _021E8448 ; =ov108_021EA97C
	mov r3, #2
	bl sub_0200D2A4
	mov r0, #0x35
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl SpriteManager_GetSpriteList
	add r1, r0, #0
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov108_021E853C
_021E8442:
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E8448: .word ov108_021EA97C
	thumb_func_end ov108_021E83F0

	thumb_func_start ov108_021E844C
ov108_021E844C: ; 0x021E844C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x35
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E846A
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl SpriteSystem_DestroySpriteManager
	mov r0, #0x35
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
_021E846A:
	pop {r4, pc}
	thumb_func_end ov108_021E844C

	thumb_func_start ov108_021E846C
ov108_021E846C: ; 0x021E846C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E847E
	bl ov108_021E852C
_021E847E:
	mov r0, #0x35
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E848C
	bl SpriteSystem_DrawSprites
_021E848C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E846C

	thumb_func_start ov108_021E8490
ov108_021E8490: ; 0x021E8490
	push {r3, lr}
	mov r1, #0xd3
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _021E84A0
	bl SpriteSystem_TransferOam
_021E84A0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov108_021E8490

	thumb_func_start ov108_021E84A4
ov108_021E84A4: ; 0x021E84A4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x59
	lsl r1, r1, #2
	add r5, r0, #0
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r2, #0x59
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	str r5, [r4]
	mov r0, #4
	strh r0, [r4, #0xa]
	strh r6, [r4, #0xc]
	ldr r0, [sp]
	strh r7, [r4, #0xe]
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov108_021E867C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov108_021E84A4

	thumb_func_start ov108_021E84DC
ov108_021E84DC: ; 0x021E84DC
	push {r4, lr}
	add r4, r0, #0
	bl ov108_021E8718
	mov r2, #0x59
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	thumb_func_end ov108_021E84DC

	thumb_func_start ov108_021E84F8
ov108_021E84F8: ; 0x021E84F8
	push {r4, lr}
	sub sp, #8
	add r3, r2, #0
	mov r2, #0x55
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	lsl r1, r1, #2
	ldr r4, [r4]
	sub r2, #0x10
	ldr r4, [r4, r1]
	mov r1, #0
	str r1, [sp]
	ldr r1, [r0]
	add r3, #0x12
	str r1, [sp, #4]
	ldr r0, [r0, r2]
	add r1, r4, #0
	mov r2, #0xa6
	bl ReplaceCharResObjFromNarc
	add r0, r4, #0
	bl sub_0200AE8C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E84F8

	thumb_func_start ov108_021E852C
ov108_021E852C: ; 0x021E852C
	push {r3, lr}
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _021E8538
	bl SpriteList_RenderAndAnimateSprites
_021E8538:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov108_021E852C

	thumb_func_start ov108_021E853C
ov108_021E853C: ; 0x021E853C
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov108_021E853C

	thumb_func_start ov108_021E8540
ov108_021E8540: ; 0x021E8540
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r5, r0, #0
	str r3, [sp, #0x2c]
	add r6, r1, #0
	ldr r0, [r5]
	mov r1, #0x10
	add r7, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4, #8]
	ldr r0, [r5]
	mov r1, #0x24
	bl AllocFromHeap
	ldr r1, [r4, #8]
	mov r3, #0xe
	str r0, [r1]
	ldr r0, [r4, #8]
	lsl r3, r3, #0xc
	ldr r0, [r0]
	mov r1, #0
	str r0, [r4, #4]
	mov r0, #0
	str r3, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x10]
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	str r2, [sp, #0x14]
	add r2, r0, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r0, #0
	add r2, #8
	ldr r2, [r5, r2]
	add r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	add r2, r3, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	add r1, sp, #0x68
	ldrb r1, [r1, #0x14]
	ldr r0, [r4, #4]
	add r1, r1, r3
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _021E85C8
	str r0, [sp, #0x30]
	b _021E85CC
_021E85C8:
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x30]
_021E85CC:
	ldr r0, [r4, #4]
	cmp r6, #0
	str r0, [sp, #0x34]
	beq _021E85E6
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E85F4
_021E85E6:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E85F4:
	bl _ffix
	str r0, [sp, #0x38]
	cmp r7, #0
	beq _021E8610
	lsl r0, r7, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E861E
_021E8610:
	lsl r0, r7, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E861E:
	bl _ffix
	mov r1, #0
	str r1, [sp, #0x40]
	ldr r1, [sp, #0x84]
	str r0, [sp, #0x3c]
	cmp r1, #2
	bne _021E8636
	mov r1, #3
	lsl r1, r1, #0x12
	add r0, r0, r1
	str r0, [sp, #0x3c]
_021E8636:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	mov r1, #0
	add r0, sp, #0x30
	add r2, sp, #0x68
	strh r1, [r0, #0x20]
	ldrb r0, [r2, #0x10]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x84]
	str r0, [sp, #0x58]
	ldr r0, [r5]
	str r0, [sp, #0x5c]
	ldrb r1, [r2, #0x14]
	ldrb r2, [r2, #0x18]
	add r0, r5, #0
	bl ov108_021E84F8
	add r0, sp, #0x30
	bl Sprite_CreateAffine
	str r0, [r4]
	cmp r0, #0
	bne _021E866E
	bl GF_AssertFail
_021E866E:
	add r0, r4, #0
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov108_021E8540

	thumb_func_start ov108_021E8674
ov108_021E8674: ; 0x021E8674
	ldr r3, _021E8678 ; =Sprite_DeleteAndFreeResources
	bx r3
	.balign 4, 0
_021E8678: .word Sprite_DeleteAndFreeResources
	thumb_func_end ov108_021E8674

	thumb_func_start ov108_021E867C
ov108_021E867C: ; 0x021E867C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _021E8714 ; =ov108_021EA978
	str r0, [sp]
	ldrb r2, [r1]
	add r0, sp, #8
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	ldrb r1, [r1, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr r0, [sp]
	ldr r2, [sp]
	ldr r1, [sp]
	ldrh r0, [r0, #0xc]
	ldr r2, [r2]
	add r1, #0x18
	bl G2dRenderer_Init
	ldr r1, [sp]
	mov r6, #0x55
	str r0, [r1, #0x10]
	mov r0, #0
	str r0, [sp, #4]
	add r7, sp, #8
	add r5, r1, #0
	add r4, r0, #0
	lsl r6, r6, #2
_021E86B8:
	ldr r2, [sp]
	ldrb r0, [r7]
	ldr r1, [sp, #4]
	ldr r2, [r2]
	bl Create2DGfxResObjMan
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r1, [sp]
	ldrb r0, [r7]
	ldr r1, [r1]
	bl Create2DGfxResObjList
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	mov r1, #0
	ldr r0, [r3, #4]
	cmp r0, #0
	bls _021E86FA
	add r2, r1, #0
_021E86EA:
	ldr r0, [r3]
	add r1, r1, #1
	str r4, [r0, r2]
	ldr r3, [r5, r6]
	add r2, r2, #4
	ldr r0, [r3, #4]
	cmp r1, r0
	blo _021E86EA
_021E86FA:
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r0, r0, #1
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r0, #4
	blo _021E86B8
	ldr r0, [sp]
	bl ov108_021E8758
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E8714: .word ov108_021EA978
	thumb_func_end ov108_021E867C

	thumb_func_start ov108_021E8718
ov108_021E8718: ; 0x021E8718
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl SpriteList_Delete
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AED4
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200B0CC
	mov r7, #0x55
	lsl r7, r7, #2
	add r6, r7, #0
	mov r4, #0
	sub r6, #0x10
_021E8740:
	ldr r0, [r5, r7]
	bl Delete2DGfxResObjList
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _021E8740
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov108_021E8718

	thumb_func_start ov108_021E8758
ov108_021E8758: ; 0x021E8758
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x55
	lsl r0, r0, #2
	mov r7, #0
	ldr r6, [r5, r0]
	add r4, r7, #0
_021E8768:
	mov r0, #0xe
	lsl r0, r0, #0xc
	add r0, r7, r0
	str r0, [sp]
	ldrh r0, [r5, #0xe]
	add r2, r7, #0
	mov r1, #0xa6
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, #0x12
	str r0, [sp, #8]
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #0
	bl AddCharResObjFromNarc
	ldr r1, [r6]
	str r0, [r1, r4]
	ldr r0, [r6]
	ldr r0, [r0, r4]
	cmp r0, #0
	bne _021E879A
	bl GF_AssertFail
_021E879A:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E87A8
	cmp r0, #1
	beq _021E87B2
	cmp r0, #2
	b _021E87BC
_021E87A8:
	ldr r0, [r6]
	ldr r0, [r0, r4]
	bl sub_0200ADA4
	b _021E87C4
_021E87B2:
	ldr r0, [r6]
	ldr r0, [r0, r4]
	bl sub_0200AE18
	b _021E87C4
_021E87BC:
	ldr r0, [r6]
	ldr r0, [r0, r4]
	bl sub_0200AD64
_021E87C4:
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, #0xc
	blt _021E8768
	mov r4, #0
	add r6, r5, #0
_021E87D0:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r7, [r6, r0]
	mov r0, #0xe
	lsl r0, r0, #0xc
	str r0, [sp]
	add r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0xa6
	add r2, #0x10
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	ldr r1, [r7]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8806
	bl GF_AssertFail
_021E8806:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #2
	blt _021E87D0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	mov r1, #0xe
	lsl r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r5, #0xe]
	sub r0, #0x10
	mov r2, #0xf
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldr r1, [r5]
	mov r3, #0
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	mov r1, #0xa6
	bl AddPlttResObjFromNarc
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E8844
	bl GF_AssertFail
_021E8844:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200B00C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov108_021E8758

	.rodata

_021EA720:
	.byte 0xFF, 0x01, 0x01, 0xFF

ov108_021EA724: ; 0x021EA724
	.byte 0x08, 0x0A, 0x0B, 0x00, 0x09, 0x0A, 0x0B, 0x00, 0x03, 0x00, 0x00, 0x0F
	.byte 0x00, 0x00, 0xB5, 0x03, 0xE5, 0x03, 0x30, 0x00

ov108_021EA738: ; 0x021EA738
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EA748: ; 0x021EA748
	.byte 0x0C, 0x00

ov108_021EA74A: ; 0x021EA74A
	.byte 0x02, 0x00, 0x15, 0x00, 0x02, 0x00
	.byte 0x0A, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x09, 0x00, 0x15, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x09, 0x00

ov108_021EA760: ; 0x021EA760
	.byte 0x18, 0x58, 0x18, 0x58, 0x18, 0x58, 0x60, 0xA0, 0x18, 0x58, 0xA8, 0xE8, 0x60, 0xA0, 0x18, 0x58
	.byte 0x60, 0xA0, 0x60, 0xA0, 0x60, 0xA0, 0xA8, 0xE8, 0xA8, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov108_021EA780: ; 0x021EA780
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EA7A8: ; 0x021EA7A8
	.byte 0x00, 0x01, 0x15, 0x16, 0x03, 0x04, 0x37, 0x03
	.byte 0x00, 0x01, 0x13, 0x16, 0x05, 0x04, 0x0B, 0x03, 0x03, 0x19, 0x15, 0x06, 0x03, 0x0C, 0xF9, 0x02
	.byte 0x03, 0x0D, 0x00, 0x06, 0x02, 0x0C, 0xED, 0x02, 0x07, 0x01, 0x15, 0x1E, 0x03, 0x05, 0xA6, 0x03

ov108_021EA7D0: ; 0x021EA7D0
	.byte 0x18, 0x58, 0x10, 0x50, 0x18, 0x58, 0x60, 0xA0, 0x18, 0x58, 0xB0, 0xF0, 0x60, 0xA0, 0x10, 0x50
	.byte 0x60, 0xA0, 0x60, 0xA0, 0x60, 0xA0, 0xB0, 0xF0, 0xA8, 0xC0, 0xC0, 0x00, 0x06, 0x1A, 0x40, 0x60
	.byte 0x06, 0x1A, 0xA0, 0xC0, 0xFF, 0x00, 0x00, 0x00

ov108_021EA7F8: ; 0x021EA7F8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EA820: ; 0x021EA820
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EA848: ; 0x021EA848
	.byte 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EA870: ; 0x021EA870
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EA898: ; 0x021EA898
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x1A, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x01, 0x18, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x1A, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EA978: ; 0x021EA978
	.byte 0x0C, 0x01, 0x01, 0x01

ov108_021EA97C: ; 0x021EA97C
	.byte 0x3A, 0x00, 0x3B, 0x00
	.byte 0x39, 0x00, 0x38, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x56, 0x00, 0x00, 0x00

ov108_021EA98C: ; 0x021EA98C
	.byte 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00

ov108_021EA9A0: ; 0x021EA9A0
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0xB0, 0x15, 0x00
