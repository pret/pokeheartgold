	.include "asm/macros.inc"
	.include "overlay_108.inc"
	.include "global.inc"

	.text

	thumb_func_start SafariDecoration_Init
SafariDecoration_Init: ; 0x021E8850
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0
	beq _021E8862
	cmp r1, #1
	beq _021E88B0
	b _021E88C0
_021E8862:
	bl ov108_021E8AD4
	mov r2, #0x12
	mov r0, #3
	mov r1, #0x5f
	lsl r2, r2, #0xe
	bl CreateHeap
	add r0, r4, #0
	bl OverlayManager_GetArgs
	mov r1, #0x53
	add r6, r0, #0
	add r0, r4, #0
	lsl r1, r1, #4
	mov r2, #0x5f
	bl OverlayManager_CreateAndGetData
	mov r2, #0x53
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x5f
	str r0, [r4]
	add r0, r4, #0
	add r1, r6, #0
	bl ov108_021E8968
	mov r1, #0
	mov r0, #0x43
	add r2, r1, #0
	bl sub_02004EC4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E88C0
_021E88B0:
	bl OverlayManager_GetData
	bl ov108_021E929C
	cmp r0, #0
	beq _021E88C0
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E88C0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end SafariDecoration_Init

	thumb_func_start SafariDecoration_Exit
SafariDecoration_Exit: ; 0x021E88C4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov108_021E9304
	cmp r0, #0
	bne _021E88DA
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E88DA:
	bl ov108_021E8AD4
	add r0, r4, #0
	bl ov108_021E8A88
	mov r2, #0x53
	ldr r5, [r4]
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	add r0, r6, #0
	bl OverlayManager_FreeData
	add r0, r5, #0
	bl DestroyHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end SafariDecoration_Exit

	thumb_func_start SafariDecoration_Main
SafariDecoration_Main: ; 0x021E8904
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #4
	bhi _021E894E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E8920: ; jump table
	.short _021E892A - _021E8920 - 2 ; case 0
	.short _021E8932 - _021E8920 - 2 ; case 1
	.short _021E893A - _021E8920 - 2 ; case 2
	.short _021E8942 - _021E8920 - 2 ; case 3
	.short _021E894A - _021E8920 - 2 ; case 4
_021E892A:
	bl ov108_021E8BC0
	str r0, [r4]
	b _021E894E
_021E8932:
	bl ov108_021E8B24
	str r0, [r4]
	b _021E894E
_021E893A:
	bl ov108_021E8B68
	str r0, [r4]
	b _021E894E
_021E8942:
	bl ov108_021E8C18
	str r0, [r4]
	b _021E894E
_021E894A:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E894E:
	mov r0, #0x11
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl SpriteSystem_DrawSprites
	mov r0, #0xce
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov108_021E8E10
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end SafariDecoration_Main

	thumb_func_start ov108_021E8968
ov108_021E8968: ; 0x021E8968
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl Save_SafariZone_Get
	add r2, r5, #0
	str r0, [r5, #0x20]
	mov r1, #0
	add r2, #0x24
	bl SafariZone_CopyAreaSet
	ldr r0, [r4]
	bl Save_PlayerData_GetOptionsAddr
	add r6, r0, #0
	bl Options_GetTextSpeed
	strb r0, [r5, #0x18]
	add r0, r6, #0
	bl Options_GetFrame
	strb r0, [r5, #0x19]
	ldr r0, [r4, #4]
	bl MenuInputStateMgr_GetState
	str r0, [r5, #0x10]
	str r4, [r5, #0x1c]
	ldr r0, [r4, #0x20]
	mov r1, #6
	ldrb r0, [r0]
	bl _s32_div_f
	ldr r0, _021E8A74 ; =0x00000431
	strb r1, [r5, r0]
	ldr r0, [r5, #0x1c]
	mov r1, #6
	ldr r0, [r0, #0x20]
	ldrb r0, [r0]
	bl _s32_div_f
	mov r1, #0x43
	lsl r1, r1, #4
	strb r0, [r5, r1]
	ldr r0, [r4]
	bl Save_PlayerData_GetProfile
	add r6, r0, #0
	ldr r0, [r5, #0x20]
	bl sub_0202F720
	add r7, r0, #0
	add r0, r6, #0
	bl PlayerProfile_GetTrainerID
	str r0, [sp, #4]
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [r5]
	ldr r3, _021E8A78 ; =0x0000042D
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r3, r5, r3
	bl ov108_021EA63C
	mov r1, #0xcd
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldrb r0, [r4, #0x19]
	strb r0, [r5, #0x1a]
	cmp r0, #5
	bls _021E8A06
	mov r0, #0
	strb r0, [r5, #0x1a]
_021E8A06:
	ldrb r1, [r5, #0x1a]
	mov r0, #0x7a
	mul r0, r1
	add r0, r5, r0
	add r0, #0x25
	ldrb r1, [r0]
	mov r0, #0x1e
	sub r1, r0, r1
	ldr r0, _021E8A7C ; =0x00000435
	strb r1, [r5, r0]
	sub r0, #8
	ldrb r0, [r5, r0]
	mov r1, #6
	bl _s32_div_f
	ldr r1, _021E8A80 ; =0x0000042E
	strb r0, [r5, r1]
	sub r0, r1, #1
	ldrb r0, [r5, r0]
	mov r1, #6
	bl _s32_div_f
	cmp r1, #0
	ble _021E8A3E
	ldr r0, _021E8A80 ; =0x0000042E
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
_021E8A3E:
	mov r0, #0x43
	lsl r0, r0, #4
	sub r1, r0, #2
	ldrb r2, [r5, r0]
	ldrb r1, [r5, r1]
	cmp r2, r1
	blo _021E8A50
	mov r1, #0
	strb r1, [r5, r0]
_021E8A50:
	ldr r0, [r5, #0x1c]
	mov r1, #0xff
	strh r1, [r0, #0x1c]
	ldr r0, [r4]
	bl Save_SysInfo_RTC_Get
	ldr r0, [r0, #0x14]
	bl GF_RTC_GetTimeOfDayByHour
	ldr r1, _021E8A84 ; =0x0000042C
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r0, #4
	bne _021E8A70
	mov r0, #3
	strb r0, [r5, r1]
_021E8A70:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8A74: .word 0x00000431
_021E8A78: .word 0x0000042D
_021E8A7C: .word 0x00000435
_021E8A80: .word 0x0000042E
_021E8A84: .word 0x0000042C
	thumb_func_end ov108_021E8968

	thumb_func_start ov108_021E8A88
ov108_021E8A88: ; 0x021E8A88
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r2, r4, #0
	ldr r0, [r4, #0x20]
	mov r1, #0
	add r2, #0x24
	bl SafariZone_SetAreaSet
	ldr r0, _021E8AD0 ; =0x00000431
	ldrb r1, [r4, r0]
	cmp r1, #6
	blo _021E8AAE
	mov r1, #5
	strb r1, [r4, r0]
_021E8AAE:
	ldr r0, _021E8AD0 ; =0x00000431
	ldrb r2, [r4, r0]
	sub r0, r0, #1
	ldrb r1, [r4, r0]
	mov r0, #6
	mul r0, r1
	add r1, r2, r0
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0x20]
	strb r1, [r0]
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0x10]
	ldr r0, [r0, #4]
	bl MenuInputStateMgr_SetState
	pop {r4, pc}
	nop
_021E8AD0: .word 0x00000431
	thumb_func_end ov108_021E8A88

	thumb_func_start ov108_021E8AD4
ov108_021E8AD4: ; 0x021E8AD4
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E8B1C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E8B20 ; =0x04001000
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
	pop {r3, pc}
	.balign 4, 0
_021E8B1C: .word 0xFFFFE0FF
_021E8B20: .word 0x04001000
	thumb_func_end ov108_021E8AD4

	thumb_func_start ov108_021E8B24
ov108_021E8B24: ; 0x021E8B24
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #3
	bhi _021E8B62
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E8B3A: ; jump table
	.short _021E8B42 - _021E8B3A - 2 ; case 0
	.short _021E8B4A - _021E8B3A - 2 ; case 1
	.short _021E8B52 - _021E8B3A - 2 ; case 2
	.short _021E8B5A - _021E8B3A - 2 ; case 3
_021E8B42:
	bl ov108_021E9388
	str r0, [r4, #4]
	b _021E8B62
_021E8B4A:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #2
	pop {r4, pc}
_021E8B52:
	bl ov108_021E93A8
	str r0, [r4, #4]
	b _021E8B62
_021E8B5A:
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_021E8B62:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E8B24

	thumb_func_start ov108_021E8B68
ov108_021E8B68: ; 0x021E8B68
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021E8B78
	cmp r1, #1
	beq _021E8B8C
	b _021E8BAE
_021E8B78:
	mov r1, #1
	bl ov108_021E940C
	add r0, r4, #0
	bl ov108_021E9488
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021E8BBC
_021E8B8C:
	bl ov108_021E94E8
	cmp r0, #0
	blt _021E8BBC
	cmp r0, #1
	bne _021E8BA6
	add r0, r4, #0
	bl ov108_021E8C64
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #3
	pop {r4, pc}
_021E8BA6:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021E8BBC
_021E8BAE:
	mov r1, #0
	bl ov108_021E940C
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
_021E8BBC:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov108_021E8B68

	thumb_func_start ov108_021E8BC0
ov108_021E8BC0: ; 0x021E8BC0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E8BD2
	cmp r0, #1
	beq _021E8C00
	b _021E8C12
_021E8BD2:
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
	b _021E8C12
_021E8C00:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8C12
	mov r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E8C12:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov108_021E8BC0

	thumb_func_start ov108_021E8C18
ov108_021E8C18: ; 0x021E8C18
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E8C2A
	cmp r0, #1
	beq _021E8C4A
	b _021E8C5C
_021E8C2A:
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
	b _021E8C5C
_021E8C4A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8C5C
	mov r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #4
	pop {r3, r4, pc}
_021E8C5C:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov108_021E8C18

	thumb_func_start ov108_021E8C64
ov108_021E8C64: ; 0x021E8C64
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, #0xfe
	ldrb r1, [r4, r0]
	mov r5, #0x1b
	lsl r0, r1, #2
	add r0, r1, r0
	add r1, r2, r0
	ldrb r2, [r2, r0]
	add r0, sp, #0
	strb r2, [r0]
	ldrb r2, [r1, #1]
	ldr r3, [r4, #0x1c]
	lsl r2, r2, #2
	add r2, r3, r2
	ldrb r2, [r2, #9]
	lsr r3, r2, #0x1f
	lsl r2, r2, #0x1b
	sub r2, r2, r3
	ror r2, r5
	add r2, r3, r2
	strb r2, [r0, #1]
	ldrb r1, [r1, #1]
	ldr r2, [r4, #0x1c]
	lsl r1, r1, #2
	add r1, r2, r1
	ldrb r1, [r1, #0xb]
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1b
	sub r1, r1, r2
	ror r1, r5
	add r1, r2, r1
	strb r1, [r0, #3]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	ldrb r1, [r1, #0x1a]
	strb r1, [r0, #2]
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	ldrb r1, [r1, #0x19]
	add r0, #0x24
	bl SafariZone_AddObjectToArea
	add r0, sp, #0
	ldrb r1, [r0]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov108_021E8C64

	thumb_func_start ov108_021E8CD4
ov108_021E8CD4: ; 0x021E8CD4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	add r4, r2, #0
	mov r1, #0
	mov r2, #0xf4
	add r5, r0, #0
	bl MI_CpuFill8
	bl NNS_G3dInit
	bl G3X_Init
	bl G3X_InitMtxStack
	ldr r0, _021E8DF4 ; =0x04000060
	ldr r1, _021E8DF8 ; =0xFFFFCFFD
	ldrh r2, [r0]
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021E8DFC ; =0x0000CFFB
	and r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _021E8E00 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _021E8E04 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _021E8E08 ; =0xBFFF0000
	str r0, [r1, #0x40]
	add r0, r5, #0
	str r4, [r5, #0x14]
	add r0, #0xf1
	strb r6, [r0]
	mov r0, #0x80
	bl NNS_GfdGetLnkTexVramManagerWorkSize
	add r6, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0xec
	str r0, [r1]
	mov r0, #1
	add r2, r5, #0
	str r0, [sp]
	add r2, #0xec
	ldr r2, [r2]
	lsl r0, r0, #0x11
	mov r1, #0
	add r3, r6, #0
	bl GF_3DVramMan_InitLinkedListTexVramManager
	mov r0, #1
	lsl r0, r0, #8
	bl NNS_GfdGetLnkPlttVramManagerWorkSize
	add r6, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0xe8
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xe8
	mov r0, #1
	ldr r1, [r1]
	lsl r0, r0, #0xe
	add r2, r6, #0
	mov r3, #1
	bl GF_3DVramMan_InitLinkedListPlttVramManager
	add r0, r5, #4
	add r1, r4, #0
	mov r2, #0x20
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0x28
	add r1, r4, #0
	bl NARC_New
	str r0, [r5, #0x18]
	mov r0, #0x6b
	add r1, r4, #0
	bl NARC_New
	str r0, [r5, #0x1c]
	mov r0, #0x6a
	add r1, r4, #0
	bl NARC_New
	str r0, [r5, #0x20]
	add r0, r5, #0
	add r1, r4, #0
	bl ov108_021E9230
	mov r0, #1
	add r1, r0, #0
	bl GfGfx_EngineATogglePlanes
	ldr r1, _021E8E0C ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E8DF4: .word 0x04000060
_021E8DF8: .word 0xFFFFCFFD
_021E8DFC: .word 0x0000CFFB
_021E8E00: .word 0x00007FFF
_021E8E04: .word 0x04000540
_021E8E08: .word 0xBFFF0000
_021E8E0C: .word 0x04000008
	thumb_func_end ov108_021E8CD4

	thumb_func_start ov108_021E8E10
ov108_021E8E10: ; 0x021E8E10
	push {r4, lr}
	add r4, r0, #0
	bl Thunk_G3X_Reset
	bl Camera_PushLookAtToNNSGlb
	bl NNS_G3dGeFlushBuffer
	ldr r2, _021E8E58 ; =0x04000440
	mov r3, #0
	add r1, r2, #0
	str r3, [r2]
	add r1, #0x14
	str r3, [r1]
	mov r0, #2
	str r0, [r2]
	add r0, r4, #0
	str r3, [r1]
	add r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E8E4E
	add r0, r4, #0
	add r0, #0xd8
	ldrh r0, [r0]
	cmp r0, #0
	beq _021E8E4E
	add r4, #0x24
	add r0, r4, #0
	bl ov108_021E9144
_021E8E4E:
	ldr r0, _021E8E5C ; =0x04000540
	mov r1, #1
	str r1, [r0]
	pop {r4, pc}
	nop
_021E8E58: .word 0x04000440
_021E8E5C: .word 0x04000540
	thumb_func_end ov108_021E8E10

	thumb_func_start ov108_021E8E60
ov108_021E8E60: ; 0x021E8E60
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xd8
	ldrh r1, [r1]
	cmp r1, #0
	beq _021E8E76
	add r1, r4, #0
	add r1, #0x24
	bl ov108_021E90C4
_021E8E76:
	ldr r0, [r4]
	bl Camera_Delete
	add r0, r4, #0
	add r0, #0xe8
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #0x20]
	bl NARC_Delete
	ldr r0, [r4, #0x1c]
	bl NARC_Delete
	ldr r0, [r4, #0x18]
	bl NARC_Delete
	pop {r4, pc}
	thumb_func_end ov108_021E8E60

	thumb_func_start ov108_021E8EA4
ov108_021E8EA4: ; 0x021E8EA4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r1, r5, #0
	add r1, #0xd8
	ldrh r1, [r1]
	add r4, r2, #0
	cmp r1, #0
	beq _021E8EBE
	add r1, r5, #0
	add r1, #0x24
	bl ov108_021E90C4
_021E8EBE:
	add r0, r5, #0
	mov r1, #1
	add r0, #0xf0
	strb r1, [r0]
	cmp r4, #0
	beq _021E8ED4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov108_021E8F00
_021E8ED4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov108_021E8EA4

	thumb_func_start ov108_021E8ED8
ov108_021E8ED8: ; 0x021E8ED8
	push {r3, lr}
	add r2, r0, #0
	add r2, #0xf0
	strb r1, [r2]
	add r0, #0xf0
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E8EFA
	bl Thunk_G3X_Reset
	bl Camera_PushLookAtToNNSGlb
	bl NNS_G3dGeFlushBuffer
	ldr r0, _021E8EFC ; =0x04000540
	mov r1, #1
	str r1, [r0]
_021E8EFA:
	pop {r3, pc}
	.balign 4, 0
_021E8EFC: .word 0x04000540
	thumb_func_end ov108_021E8ED8

	thumb_func_start ov108_021E8F00
ov108_021E8F00: ; 0x021E8F00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #4]
	add r4, r2, #0
	mov r2, #0
	add r5, r0, #0
	str r2, [sp]
	ldr r3, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4]
	ldr r0, [r0, #0x18]
	ldr r3, [r3, #0x14]
	add r5, #0x24
	bl GfGfxLoader_LoadFromOpenNarc
	ldr r1, [sp, #4]
	str r0, [r1, #0x24]
	bl NNS_G3dGetMdlSet
	str r0, [r5, #4]
	cmp r0, #0
	beq _021E8F4C
	add r2, r0, #0
	add r2, #8
	beq _021E8F40
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _021E8F40
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _021E8F42
_021E8F40:
	mov r1, #0
_021E8F42:
	cmp r1, #0
	beq _021E8F4C
	ldr r1, [r1]
	add r0, r0, r1
	b _021E8F4E
_021E8F4C:
	mov r0, #0
_021E8F4E:
	str r0, [r5, #8]
	ldr r0, [r5]
	bl NNS_G3dGetTex
	str r0, [r5, #0xc]
	cmp r0, #0
	beq _021E8F68
	bl GF3dRender_AllocAndLoadTexResources
	ldr r0, [r5]
	ldr r1, [r5, #0xc]
	bl GF3dRender_BindModelSet
_021E8F68:
	add r0, r5, #0
	ldr r1, [r5, #8]
	add r0, #0x10
	bl NNS_G3dRenderObjInit
	bl DC_FlushAll
	add r0, r5, #0
	mov r1, #1
	add r0, #0xb4
	strh r1, [r0]
	ldr r0, [sp, #4]
	ldrb r1, [r4]
	ldr r0, [r0, #0x1c]
	add r2, sp, #0x10
	bl NARC_ReadWholeMember
	add r0, sp, #0x10
	ldrb r1, [r0]
	cmp r1, #0
	beq _021E8FEC
	ldrb r0, [r0, #1]
	cmp r0, #8
	beq _021E8FEC
	mov r0, #0
	add r6, r5, #0
	add r7, r5, #0
	str r0, [sp, #0xc]
	add r4, sp, #0x10
	add r6, #0x64
	add r7, #0xb6
_021E8FA6:
	ldr r1, [r4, #8]
	mov r0, #0
	mvn r0, r0
	mov ip, r1
	cmp r1, r0
	beq _021E8FEC
	add r2, r5, #0
	add r2, #0xb6
	ldrh r3, [r2]
	mov r2, #0x14
	ldr r0, [sp, #4]
	mul r2, r3
	add r1, r5, #0
	add r2, r6, r2
	mov r3, ip
	bl ov108_021E9198
	add r1, r5, #0
	add r1, #0xb6
	ldrh r2, [r1]
	mov r1, #0x14
	add r0, r5, #0
	mul r1, r2
	add r1, r6, r1
	bl ov108_021E91F8
	ldrh r0, [r7]
	add r4, r4, #4
	add r0, r0, #1
	strh r0, [r7]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _021E8FA6
_021E8FEC:
	ldr r0, [sp, #8]
	ldr r1, _021E90C0 ; =ov108_021EA9E4
	lsl r0, r0, #3
	add r4, r1, r0
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E900E
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E901C
_021E900E:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E901C:
	bl _ffix
	ldr r1, [sp, #4]
	add r1, #0xdc
	str r0, [r1]
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E9040
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E904E
_021E9040:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E904E:
	bl _ffix
	ldr r1, [sp, #4]
	add r1, #0xe0
	str r0, [r1]
	mov r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E9072
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E9080
_021E9072:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E9080:
	bl _ffix
	ldr r1, [sp, #4]
	add r1, #0xe4
	str r0, [r1]
	ldrh r0, [r4]
	cmp r0, #0
	beq _021E90A2
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E90B0
_021E90A2:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E90B0:
	bl _ffix
	ldr r1, [sp, #4]
	ldr r1, [r1]
	bl Camera_SetDistance
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E90C0: .word ov108_021EA9E4
	thumb_func_end ov108_021E8F00

	thumb_func_start ov108_021E90C4
ov108_021E90C4: ; 0x021E90C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	add r0, #0xb6
	ldrh r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _021E90FA
	add r5, r6, #0
	add r5, #0x64
_021E90DC:
	add r0, r6, #0
	add r1, r5, #0
	bl ov108_021E9204
	add r0, r7, #0
	add r1, r5, #0
	bl ov108_021E91D4
	add r0, r6, #0
	add r0, #0xb6
	ldrh r0, [r0]
	add r4, r4, #1
	add r5, #0x14
	cmp r4, r0
	blt _021E90DC
_021E90FA:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _021E9124
	add r1, sp, #4
	add r2, sp, #0
	bl NNS_G3dTexReleaseTexKey
	ldr r1, _021E913C ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r0, [sp, #4]
	ldr r1, [r1]
	blx r1
	ldr r1, _021E913C ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	ldr r0, [r6, #0xc]
	bl NNS_G3dPlttReleasePlttKey
	ldr r1, _021E9140 ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r1, [r1]
	blx r1
_021E9124:
	ldr r0, [r6]
	cmp r0, #0
	beq _021E912E
	bl FreeToHeap
_021E912E:
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xb8
	bl MI_CpuFill8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E913C: .word NNS_GfdDefaultFuncFreeTexVram
_021E9140: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end ov108_021E90C4

	thumb_func_start ov108_021E9144
ov108_021E9144: ; 0x021E9144
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	add r6, r0, #0
	add r0, #0xb6
	ldrh r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _021E916C
	add r5, r6, #0
	add r5, #0x64
_021E9158:
	add r0, r5, #0
	bl ov108_021E9210
	add r0, r6, #0
	add r0, #0xb6
	ldrh r0, [r0]
	add r4, r4, #1
	add r5, #0x14
	cmp r4, r0
	blt _021E9158
_021E916C:
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x18
	bl MTX_Identity33_
	add r6, #0x10
	add r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #0x18
	add r3, sp, #0
	bl GF3dRender_DrawModel
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov108_021E9144

	thumb_func_start ov108_021E9198
ov108_021E9198: ; 0x021E9198
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r2, #0
	mov r2, #0
	add r6, r1, #0
	add r5, r0, #0
	str r2, [sp]
	add r1, r3, #0
	ldr r0, [r5, #0x20]
	ldr r3, [r5, #0x14]
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r4]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	str r0, [r4, #4]
	ldr r1, [r4, #4]
	ldr r2, [r6, #8]
	add r0, r5, #4
	bl NNS_G3dAllocAnmObj
	str r0, [r4, #8]
	ldr r1, [r4, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0xc]
	bl NNS_G3dAnmObjInit
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov108_021E9198

	thumb_func_start ov108_021E91D4
ov108_021E91D4: ; 0x021E91D4
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _021E91F6
	ldr r1, [r4, #8]
	add r0, r0, #4
	bl NNS_G3dFreeAnmObj
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
_021E91F6:
	pop {r4, pc}
	thumb_func_end ov108_021E91D4

	thumb_func_start ov108_021E91F8
ov108_021E91F8: ; 0x021E91F8
	ldr r3, _021E9200 ; =NNS_G3dRenderObjAddAnmObj
	add r0, #0x10
	ldr r1, [r1, #8]
	bx r3
	.balign 4, 0
_021E9200: .word NNS_G3dRenderObjAddAnmObj
	thumb_func_end ov108_021E91F8

	thumb_func_start ov108_021E9204
ov108_021E9204: ; 0x021E9204
	ldr r3, _021E920C ; =NNS_G3dRenderObjRemoveAnmObj
	add r0, #0x10
	ldr r1, [r1, #8]
	bx r3
	.balign 4, 0
_021E920C: .word NNS_G3dRenderObjRemoveAnmObj
	thumb_func_end ov108_021E9204

	thumb_func_start ov108_021E9210
ov108_021E9210: ; 0x021E9210
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	ldr r1, [r4, #0xc]
	lsl r0, r0, #0xc
	add r0, r1, r0
	ldr r1, [r4, #8]
	ldr r1, [r1, #8]
	ldrh r1, [r1, #4]
	lsl r1, r1, #0xc
	bl _s32_div_f
	str r1, [r4, #0xc]
	ldr r0, [r4, #8]
	str r1, [r0]
	pop {r4, pc}
	thumb_func_end ov108_021E9210

	thumb_func_start ov108_021E9230
ov108_021E9230: ; 0x021E9230
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, r1, #0
	bl Camera_New
	str r0, [r4]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xdc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xe0
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xe4
	str r1, [r0]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r1, _021E928C ; =0x0015B000
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r2, _021E9290 ; =ov108_021EA9C4
	ldr r3, _021E9294 ; =0x000005C1
	add r0, #0xdc
	bl Camera_Init_FromTargetDistanceAndAngle
	ldr r0, [r4]
	bl Camera_SetStaticPtr
	mov r0, #0x19
	mov r1, #0x4b
	ldr r2, [r4]
	lsl r0, r0, #0xe
	lsl r1, r1, #0x10
	bl Camera_SetPerspectiveClippingPlane
	ldr r0, _021E9298 ; =ov108_021EA9D8
	ldr r1, [r4]
	bl Camera_OffsetLookAtPosAndTarget
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E928C: .word 0x0015B000
_021E9290: .word ov108_021EA9C4
_021E9294: .word 0x000005C1
_021E9298: .word ov108_021EA9D8
	thumb_func_end ov108_021E9230

	thumb_func_start ov108_021E929C
ov108_021E929C: ; 0x021E929C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E92AC
	cmp r1, #1
	beq _021E92D6
	b _021E92F4
_021E92AC:
	bl ov108_021E9850
	add r0, r4, #0
	bl ov108_021E9A60
	add r0, r4, #0
	bl ov108_021E9C14
	add r0, r4, #0
	bl ov108_021E9C3C
	add r0, r4, #0
	bl ov108_021E9D30
	add r0, r4, #0
	bl ov108_021E9E10
	add r0, r4, #0
	bl ov108_021E9EB8
	b _021E92F4
_021E92D6:
	bl ov108_021EA50C
	ldr r0, _021E9300 ; =ov108_021E979C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021E92F4:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	nop
_021E9300: .word ov108_021E979C
	thumb_func_end ov108_021E929C

	thumb_func_start ov108_021E9304
ov108_021E9304: ; 0x021E9304
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E9314
	cmp r0, #2
	beq _021E934C
	b _021E9374
_021E9314:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r0, r4, #0
	bl ov108_021E9F04
	add r0, r4, #0
	bl ov108_021E9E80
	add r0, r4, #0
	bl ov108_021E9DE0
	add r0, r4, #0
	bl ov108_021E9CD0
	add r0, r4, #0
	bl ov108_021E9C2C
	add r0, r4, #0
	bl ov108_021E9BD4
	add r0, r4, #0
	bl ov108_021E9A08
	b _021E9374
_021E934C:
	bl sub_02021238
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E9380 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E9384 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021E9374:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	nop
_021E9380: .word 0xFFFFE0FF
_021E9384: .word 0x04001000
	thumb_func_end ov108_021E9304

	thumb_func_start ov108_021E9388
ov108_021E9388: ; 0x021E9388
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov108_021E96FC
	ldr r1, [sp]
	cmp r1, #0
	bne _021E93A4
	add r0, r4, #0
	bl ov108_021E95AC
_021E93A4:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov108_021E9388

	thumb_func_start ov108_021E93A8
ov108_021E93A8: ; 0x021E93A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E93BC
	mov r4, #1
	str r4, [r5, #0x10]
	b _021E93D6
_021E93BC:
	ldr r0, _021E93FC ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _021E9400 ; =0x00000CF3
	tst r0, r1
	beq _021E93CA
	add r0, r4, #0
	str r0, [r5, #0x10]
_021E93CA:
	ldr r0, _021E93FC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021E93D6
	mov r4, #1
_021E93D6:
	cmp r4, #0
	beq _021E93F6
	ldr r0, _021E9404 ; =0x000005E5
	bl PlaySE
	ldr r0, _021E9408 ; =0x00000464
	mov r1, #1
	add r0, r5, r0
	bl ClearFrameAndWindow2
	ldr r0, _021E9408 ; =0x00000464
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E93F6:
	mov r0, #2
	pop {r3, r4, r5, pc}
	nop
_021E93FC: .word gSystem
_021E9400: .word 0x00000CF3
_021E9404: .word 0x000005E5
_021E9408: .word 0x00000464
	thumb_func_end ov108_021E93A8

	thumb_func_start ov108_021E940C
ov108_021E940C: ; 0x021E940C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #1
	bne _021E9434
	mov r1, #1
	bl ov108_021E9F94
	add r0, r5, #0
	mov r1, #2
	bl ov108_021E9F20
	add r0, r5, #0
	bl ov108_021EA260
	add r0, r5, #0
	mov r1, #0
	bl ov108_021EA334
	mov r4, #0
	b _021E945A
_021E9434:
	mov r1, #0
	bl ov108_021E9F94
	ldr r0, _021E947C ; =0x00000494
	add r0, r5, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	mov r1, #0
	bl ov108_021E9F20
	add r0, r5, #0
	bl ov108_021EA040
	add r0, r5, #0
	mov r1, #2
	bl ov108_021EA334
	mov r4, #1
_021E945A:
	ldr r0, _021E9480 ; =0x0000044C
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl Sprite_SetDrawFlag
	mov r0, #0x45
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Sprite_SetDrawFlag
	ldr r0, _021E9484 ; =0x00000444
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl Sprite_SetDrawFlag
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E947C: .word 0x00000494
_021E9480: .word 0x0000044C
_021E9484: .word 0x00000444
	thumb_func_end ov108_021E940C

	thumb_func_start ov108_021E9488
ov108_021E9488: ; 0x021E9488
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, _021E94E4 ; =0x00000438
	mov r3, #4
	ldr r1, [r4, r0]
	mov r2, #0x1a
	str r1, [sp]
	add r1, r0, #0
	sub r1, #0x92
	str r1, [sp, #8]
	mov r1, #0xe
	str r1, [sp, #0xc]
	str r3, [sp, #4]
	add r1, sp, #0
	strb r2, [r1, #0x10]
	strb r3, [r1, #0x11]
	ldrb r2, [r1, #0x12]
	mov r3, #0xf
	add r0, #0xdc
	bic r2, r3
	ldr r3, [r4, #0x10]
	lsl r3, r3, #0x18
	lsr r5, r3, #0x18
	mov r3, #0xf
	and r3, r5
	orr r2, r3
	strb r2, [r1, #0x12]
	ldrb r3, [r1, #0x12]
	mov r2, #0xf0
	bic r3, r2
	strb r3, [r1, #0x12]
	mov r2, #0
	strb r2, [r1, #0x13]
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl YesNoPrompt_InitFromTemplateWithPalette
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_021E94E4: .word 0x00000438
	thumb_func_end ov108_021E9488

	thumb_func_start ov108_021E94E8
ov108_021E94E8: ; 0x021E94E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E9524 ; =0x00000514
	ldr r0, [r5, r0]
	bl YesNoPrompt_HandleInput
	cmp r0, #1
	beq _021E94FE
	cmp r0, #2
	beq _021E9502
	b _021E9506
_021E94FE:
	mov r4, #1
	b _021E950C
_021E9502:
	mov r4, #0
	b _021E950C
_021E9506:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021E950C:
	ldr r0, _021E9524 ; =0x00000514
	ldr r0, [r5, r0]
	bl YesNoPrompt_IsInTouchMode
	str r0, [r5, #0x10]
	ldr r0, _021E9524 ; =0x00000514
	ldr r0, [r5, r0]
	bl YesNoPrompt_Reset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E9524: .word 0x00000514
	thumb_func_end ov108_021E94E8

	thumb_func_start ov108_021E9528
ov108_021E9528: ; 0x021E9528
	push {r3, r4, r5, lr}
	add r4, r0, #0
	cmp r1, #6
	blo _021E9544
	ldr r0, _021E95A0 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	bl ov108_021E9F20
	mov r0, #3
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_021E9544:
	ldr r2, _021E95A4 ; =0x00000431
	sub r3, r2, #1
	ldrb r5, [r4, r3]
	ldrb r1, [r4, r2]
	mov r3, #6
	mul r3, r5
	add r3, r1, r3
	add r1, r2, #1
	strb r3, [r4, r1]
	sub r2, r2, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	cmp r1, r2
	blo _021E9564
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E9564:
	bl ov108_021EA52C
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	beq _021E9580
	ldr r0, _021E95A8 ; =0x000005F3
	bl PlaySE
	add r0, r4, #0
	sub r1, r5, #1
	bl ov108_021EA418
	mov r0, #2
	pop {r3, r4, r5, pc}
_021E9580:
	ldr r0, _021E95A0 ; =0x000005DC
	bl PlaySE
	mov r1, #0xcd
	lsl r1, r1, #2
	add r0, r1, #0
	add r0, #0xfe
	ldrb r2, [r4, r0]
	ldr r3, [r4, r1]
	add r1, #0xff
	lsl r0, r2, #2
	add r0, r2, r0
	ldrb r0, [r3, r0]
	strb r0, [r4, r1]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E95A0: .word 0x000005DC
_021E95A4: .word 0x00000431
_021E95A8: .word 0x000005F3
	thumb_func_end ov108_021E9528

	thumb_func_start ov108_021E95AC
ov108_021E95AC: ; 0x021E95AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _021E96EC ; =gSystem
	mov r1, #0
	ldr r2, [r0, #0x48]
	ldr r0, _021E96F0 ; =0x00000CF3
	tst r0, r2
	beq _021E95BE
	str r1, [r4, #0x10]
_021E95BE:
	ldr r0, _021E96EC ; =gSystem
	ldr r6, [r0, #0x48]
	mov r0, #2
	tst r0, r6
	beq _021E95D2
	add r0, r4, #0
	mov r1, #6
	bl ov108_021E9528
	pop {r3, r4, r5, r6, r7, pc}
_021E95D2:
	mov r0, #1
	tst r0, r6
	beq _021E95E4
	ldr r1, _021E96F4 ; =0x00000431
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021E9528
	pop {r3, r4, r5, r6, r7, pc}
_021E95E4:
	mov r0, #0xf0
	tst r0, r6
	bne _021E95EE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E95EE:
	ldr r0, _021E96F4 ; =0x00000431
	mov r2, #0x1f
	ldrb r5, [r4, r0]
	lsr r3, r5, #0x1f
	lsl r7, r5, #0x1f
	sub r7, r7, r3
	ror r7, r2
	add r2, r3, r7
	lsl r3, r5, #0x17
	lsl r2, r2, #0x18
	mov r5, #0x10
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	tst r5, r6
	beq _021E9644
	cmp r3, #3
	bne _021E9614
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9614:
	cmp r2, #1
	bne _021E963C
	sub r5, r0, #3
	sub r1, r0, #1
	ldrb r5, [r4, r5]
	ldrb r1, [r4, r1]
	sub r5, r5, #1
	cmp r1, r5
	bge _021E9638
	cmp r3, #3
	bhs _021E9638
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #2
	b _021E96AE
_021E9638:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E963C:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _021E96AE
_021E9644:
	mov r5, #0x20
	tst r5, r6
	beq _021E967C
	cmp r3, #3
	bne _021E9652
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9652:
	cmp r2, #0
	bne _021E9674
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _021E9670
	cmp r3, #3
	bhs _021E9670
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	sub r1, r1, #1
	strb r1, [r4, r0]
	mov r1, #1
	b _021E96AE
_021E9670:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E9674:
	sub r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _021E96AE
_021E967C:
	mov r0, #0x40
	tst r0, r6
	beq _021E9696
	add r0, r3, #3
	lsr r5, r0, #0x1f
	lsl r3, r0, #0x1e
	sub r3, r3, r5
	mov r0, #0x1e
	ror r3, r0
	add r0, r5, r3
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	b _021E96AE
_021E9696:
	mov r0, #0x80
	tst r0, r6
	beq _021E96AE
	add r0, r3, #1
	lsr r5, r0, #0x1f
	lsl r3, r0, #0x1e
	sub r3, r3, r5
	mov r0, #0x1e
	ror r3, r0
	add r0, r5, r3
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
_021E96AE:
	lsl r0, r3, #1
	add r2, r2, r0
	ldr r0, _021E96F4 ; =0x00000431
	cmp r1, #0
	strb r2, [r4, r0]
	beq _021E96D0
	sub r1, r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x18
	add r4, #0x14
	lsr r1, r1, #0x18
	add r2, r4, #0
	mov r3, #0
	bl ov108_021EA584
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E96D0:
	ldr r0, _021E96F8 ; =0x000005E5
	bl PlaySE
	ldr r1, _021E96F4 ; =0x00000431
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021EA2EC
	add r0, r4, #0
	bl ov108_021EA47C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E96EC: .word gSystem
_021E96F0: .word 0x00000CF3
_021E96F4: .word 0x00000431
_021E96F8: .word 0x000005E5
	thumb_func_end ov108_021E95AC

	thumb_func_start ov108_021E96FC
ov108_021E96FC: ; 0x021E96FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E9794 ; =ov108_021EABF0
	add r4, r1, #0
	bl TouchscreenHitbox_FindRectAtTouchNew
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021E9716
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E9716:
	cmp r0, #7
	bne _021E973E
	mov r0, #0x43
	lsl r0, r0, #4
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _021E973A
	sub r1, r1, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0
	add r5, #0x14
	add r2, r5, #0
	add r3, r1, #0
	bl ov108_021EA584
	mov r0, #1
	str r0, [r4]
_021E973A:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E973E:
	cmp r0, #8
	bne _021E976C
	mov r0, #0x43
	lsl r0, r0, #4
	sub r1, r0, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r0]
	sub r1, r1, #1
	cmp r2, r1
	bge _021E9768
	add r1, r2, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	add r5, #0x14
	mov r1, #1
	add r2, r5, #0
	mov r3, #0
	bl ov108_021EA584
	mov r0, #1
	str r0, [r4]
_021E9768:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E976C:
	ldr r1, _021E9798 ; =0x00000431
	ldrb r2, [r5, r1]
	cmp r0, r2
	beq _021E9784
	strb r0, [r5, r1]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl ov108_021EA2EC
	add r0, r5, #0
	bl ov108_021EA47C
_021E9784:
	mov r0, #1
	str r0, [r4]
	ldr r1, _021E9798 ; =0x00000431
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl ov108_021E9528
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9794: .word ov108_021EABF0
_021E9798: .word 0x00000431
	thumb_func_end ov108_021E96FC

	thumb_func_start ov108_021E979C
ov108_021E979C: ; 0x021E979C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E981C ; =0x00000434
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _021E97F4
	sub r2, r0, #4
	sub r1, r0, #3
	ldrb r3, [r4, r2]
	mov r2, #6
	ldrb r1, [r4, r1]
	mul r2, r3
	add r2, r1, r2
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r1, #6
	bhs _021E97C6
	sub r0, r0, #7
	ldrb r0, [r4, r0]
	cmp r2, r0
	blo _021E97D6
_021E97C6:
	mov r0, #0xce
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x18
	mov r2, #0
	bl ov108_021E8EA4
	b _021E97EE
_021E97D6:
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	lsl r3, r2, #2
	add r3, r2, r3
	add r2, r1, r3
	add r0, r0, #4
	ldrb r1, [r1, r3]
	add r0, r4, r0
	add r2, r2, #2
	bl ov108_021E8EA4
_021E97EE:
	ldr r0, _021E981C ; =0x00000434
	mov r1, #0
	strb r1, [r4, r0]
_021E97F4:
	ldr r0, _021E9820 ; =0x0000043C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E9800
	bl SpriteSystem_TransferOam
_021E9800:
	bl GF_RunVramTransferTasks
	ldr r0, _021E9824 ; =0x00000438
	ldr r0, [r4, r0]
	bl DoScheduledBgGpuUpdates
	ldr r3, _021E9828 ; =0x027E0000
	ldr r1, _021E982C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E981C: .word 0x00000434
_021E9820: .word 0x0000043C
_021E9824: .word 0x00000438
_021E9828: .word 0x027E0000
_021E982C: .word 0x00003FF8
	thumb_func_end ov108_021E979C

	thumb_func_start ov108_021E9830
ov108_021E9830: ; 0x021E9830
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E984C ; =ov108_021EABC8
	add r3, sp, #0
	mov r2, #5
_021E983A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E983A
	add r0, sp, #0
	bl GfGfx_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E984C: .word ov108_021EABC8
	thumb_func_end ov108_021E9830

	thumb_func_start ov108_021E9850
ov108_021E9850: ; 0x021E9850
	push {r4, r5, lr}
	sub sp, #0xd4
	add r4, r0, #0
	bl ov108_021E9830
	ldr r2, _021E99E0 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r4]
	bl BgConfig_Alloc
	ldr r1, _021E99E4 ; =0x00000438
	add r3, sp, #0xc4
	ldr r5, _021E99E8 ; =ov108_021EAAC0
	str r0, [r4, r1]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E99EC ; =ov108_021EAB54
	add r3, sp, #0xa8
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	ldr r0, _021E99E4 ; =0x00000438
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #1
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E99F0 ; =ov108_021EAB1C
	add r3, sp, #0x8c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	ldr r0, _021E99E4 ; =0x00000438
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #2
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E99F4 ; =ov108_021EAB38
	add r3, sp, #0x70
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, _021E99E4 ; =0x00000438
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #3
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E99F8 ; =ov108_021EAB8C
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #4
	ldr r0, [r4, r0]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #4
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E99FC ; =ov108_021EAAE4
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	ldr r0, _021E99E4 ; =0x00000438
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #5
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E9A00 ; =ov108_021EAB00
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	ldr r0, _021E99E4 ; =0x00000438
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #6
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E9A04 ; =ov108_021EAB70
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	ldr r0, _021E99E4 ; =0x00000438
	mov r3, #0
	ldr r0, [r4, r0]
	bl InitBgFromTemplate
	ldr r0, _021E99E4 ; =0x00000438
	mov r1, #7
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add sp, #0xd4
	pop {r4, r5, pc}
	nop
_021E99E0: .word 0x04000304
_021E99E4: .word 0x00000438
_021E99E8: .word ov108_021EAAC0
_021E99EC: .word ov108_021EAB54
_021E99F0: .word ov108_021EAB1C
_021E99F4: .word ov108_021EAB38
_021E99F8: .word ov108_021EAB8C
_021E99FC: .word ov108_021EAAE4
_021E9A00: .word ov108_021EAB00
_021E9A04: .word ov108_021EAB70
	thumb_func_end ov108_021E9850

	thumb_func_start ov108_021E9A08
ov108_021E9A08: ; 0x021E9A08
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E9A5C ; =0x00000438
	mov r1, #7
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E9A5C ; =0x00000438
	mov r1, #6
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E9A5C ; =0x00000438
	mov r1, #5
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E9A5C ; =0x00000438
	mov r1, #4
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E9A5C ; =0x00000438
	mov r1, #3
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E9A5C ; =0x00000438
	mov r1, #2
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E9A5C ; =0x00000438
	mov r1, #1
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E9A5C ; =0x00000438
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_021E9A5C: .word 0x00000438
	thumb_func_end ov108_021E9A08

	thumb_func_start ov108_021E9A60
ov108_021E9A60: ; 0x021E9A60
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xe1
	bl NARC_New
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	ldr r2, _021E9BC0 ; =0x00000438
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	mov r1, #1
	mov r3, #3
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 ; =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #5
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	ldr r0, [r5]
	add r2, r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	mov r1, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	ldr r2, [r5]
	mov r0, #0
	lsl r1, r1, #4
	bl LoadFontPal1
	mov r1, #0x1a
	ldr r2, [r5]
	mov r0, #4
	lsl r1, r1, #4
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 ; =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #2
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 ; =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #3
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, _021E9BC0 ; =0x00000438
	str r0, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #6
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5]
	ldr r3, _021E9BC4 ; =0x0000051C
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r3, _021E9BC8 ; =0x00000518
	mov r1, #6
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0xc
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r3, #0x52
	lsl r3, r3, #4
	str r0, [r5, r3]
	ldr r0, [r5]
	add r3, #0xc
	str r0, [sp]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r1, _021E9BCC ; =0x00000528
	str r0, [r5, r1]
	add r0, r4, #0
	bl NARC_Delete
	ldrb r0, [r5, #0x19]
	ldr r2, _021E9BC0 ; =0x00000438
	mov r1, #4
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	sub r2, #0x56
	bl LoadUserFrameGfx2
	mov r1, #0x1a
	ldr r2, [r5]
	mov r0, #0
	lsl r1, r1, #4
	bl LoadFontPal1
	ldr r0, _021E9BC0 ; =0x00000438
	mov r1, #7
	ldr r0, [r5, r0]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021E9BC0 ; =0x00000438
	mov r1, #3
	ldr r0, [r5, r0]
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #4
	str r0, [sp]
	ldr r0, _021E9BD0 ; =0x04000050
	mov r1, #1
	mov r2, #0x1e
	mov r3, #0x1c
	bl G2x_SetBlendAlpha_
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9BC0: .word 0x00000438
_021E9BC4: .word 0x0000051C
_021E9BC8: .word 0x00000518
_021E9BCC: .word 0x00000528
_021E9BD0: .word 0x04000050
	thumb_func_end ov108_021E9A60

	thumb_func_start ov108_021E9BD4
ov108_021E9BD4: ; 0x021E9BD4
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	add r4, r0, #0
	ldr r0, _021E9C08 ; =0x04000050
	add r2, r1, #0
	mov r3, #0x1f
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	ldr r0, _021E9C0C ; =0x00000528
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x52
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E9C10 ; =0x00000518
	ldr r0, [r4, r0]
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E9C08: .word 0x04000050
_021E9C0C: .word 0x00000528
_021E9C10: .word 0x00000518
	thumb_func_end ov108_021E9BD4

	thumb_func_start ov108_021E9C14
ov108_021E9C14: ; 0x021E9C14
	mov r1, #0xce
	add r2, r0, #0
	lsl r1, r1, #2
	add r0, r2, r1
	add r1, #0xf4
	ldrb r1, [r2, r1]
	ldr r3, _021E9C28 ; =ov108_021E8CD4
	ldr r2, [r2]
	bx r3
	nop
_021E9C28: .word ov108_021E8CD4
	thumb_func_end ov108_021E9C14

	thumb_func_start ov108_021E9C2C
ov108_021E9C2C: ; 0x021E9C2C
	mov r1, #0xce
	lsl r1, r1, #2
	ldr r3, _021E9C38 ; =ov108_021E8E60
	add r0, r0, r1
	bx r3
	nop
_021E9C38: .word ov108_021E8E60
	thumb_func_end ov108_021E9C2C

	thumb_func_start ov108_021E9C3C
ov108_021E9C3C: ; 0x021E9C3C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	ldr r2, _021E9CCC ; =0x000001AE
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	mov r1, #0xc3
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r2, [r5]
	mov r0, #2
	mov r1, #0x10
	bl MessageFormat_New_Custom
	mov r1, #0x31
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #8
	bl String_New
	mov r1, #0xc5
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #8
	bl String_New
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	mov r1, #0xc
	bl NewString_ReadMsgData
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x20
	ldr r0, [r5, r1]
	mov r1, #8
	bl NewString_ReadMsgData
	mov r1, #0x33
	lsl r1, r1, #4
	add r7, r1, #0
	str r0, [r5, r1]
	mov r6, #0
	add r4, r5, #0
	sub r7, #0x14
_021E9CB2:
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl NewString_ReadMsgData
	str r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E9CB2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9CCC: .word 0x000001AE
	thumb_func_end ov108_021E9C3C

	thumb_func_start ov108_021E9CD0
ov108_021E9CD0: ; 0x021E9CD0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0xc7
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E9CDC:
	ldr r0, [r5, r7]
	bl String_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E9CDC
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl String_Delete
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl String_Delete
	mov r0, #0xc6
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl String_Delete
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl String_Delete
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl MessageFormat_Delete
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov108_021E9CD0

	thumb_func_start ov108_021E9D30
ov108_021E9D30: ; 0x021E9D30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	ldr r0, _021E9DCC ; =0x00000454
	ldr r4, _021E9DD0 ; =ov108_021EAC18
	mov r6, #0
	add r5, r7, r0
_021E9D3E:
	ldr r0, _021E9DD4 ; =0x00000438
	add r1, r5, #0
	ldr r0, [r7, r0]
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #5
	ble _021E9D3E
	ldr r0, _021E9DCC ; =0x00000454
	ldr r6, _021E9DD8 ; =0x000002E2
	add r0, r7, r0
	mov r4, #0
	str r0, [sp, #0x14]
_021E9D66:
	lsr r0, r4, #0x1f
	add r0, r4, r0
	asr r1, r0, #1
	lsl r0, r1, #2
	add r0, r1, r0
	lsr r3, r4, #0x1f
	str r3, [sp, #0x18]
	add r0, r0, #6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	add r1, r4, #6
	lsl r2, r1, #4
	ldr r1, [sp, #0x14]
	ldr r5, [sp, #0x18]
	lsl r3, r4, #0x1f
	sub r3, r3, r5
	mov r5, #0x1f
	ror r3, r5
	ldr r5, [sp, #0x18]
	add r1, r1, r2
	add r3, r5, r3
	lsl r3, r3, #4
	add r3, r3, #1
	lsl r3, r3, #0x18
	ldr r0, _021E9DD4 ; =0x00000438
	str r6, [sp, #0x10]
	ldr r0, [r7, r0]
	mov r2, #5
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	sub r6, #0x1c
	lsl r0, r6, #0x10
	add r4, r4, #1
	lsr r6, r0, #0x10
	cmp r4, #6
	blt _021E9D66
	ldr r0, [r7]
	bl YesNoPrompt_Create
	ldr r1, _021E9DDC ; =0x00000514
	str r0, [r7, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9DCC: .word 0x00000454
_021E9DD0: .word ov108_021EAC18
_021E9DD4: .word 0x00000438
_021E9DD8: .word 0x000002E2
_021E9DDC: .word 0x00000514
	thumb_func_end ov108_021E9D30

	thumb_func_start ov108_021E9DE0
ov108_021E9DE0: ; 0x021E9DE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E9E08 ; =0x00000514
	ldr r0, [r5, r0]
	bl YesNoPrompt_Destroy
	ldr r0, _021E9E0C ; =0x00000454
	mov r4, #0
	add r5, r5, r0
_021E9DF2:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xc
	blt _021E9DF2
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9E08: .word 0x00000514
_021E9E0C: .word 0x00000454
	thumb_func_end ov108_021E9DE0

	thumb_func_start ov108_021E9E10
ov108_021E9E10: ; 0x021E9E10
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r4]
	bl SpriteSystem_Alloc
	ldr r1, _021E9E70 ; =0x0000043C
	ldr r2, _021E9E74 ; =ov108_021EAAD0
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _021E9E78 ; =ov108_021EABA8
	mov r3, #1
	bl SpriteSystem_Init
	ldr r0, _021E9E70 ; =0x0000043C
	ldr r0, [r4, r0]
	bl SpriteManager_New
	mov r1, #0x11
	lsl r1, r1, #6
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #4
	bl SpriteSystem_InitSprites
	mov r3, #0
	ldr r1, _021E9E70 ; =0x0000043C
	str r3, [sp]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _021E9E7C ; =ov108_021EAAB0
	bl sub_0200D2A4
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021E9E70: .word 0x0000043C
_021E9E74: .word ov108_021EAAD0
_021E9E78: .word ov108_021EABA8
_021E9E7C: .word ov108_021EAAB0
	thumb_func_end ov108_021E9E10

	thumb_func_start ov108_021E9E80
ov108_021E9E80: ; 0x021E9E80
	push {r4, lr}
	ldr r1, _021E9EB4 ; =0x0000043C
	add r4, r0, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl SpriteSystem_DestroySpriteManager
	ldr r0, _021E9EB4 ; =0x0000043C
	ldr r0, [r4, r0]
	bl SpriteSystem_Free
	ldr r0, _021E9EB4 ; =0x0000043C
	mov r1, #0
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	pop {r4, pc}
	.balign 4, 0
_021E9EB4: .word 0x0000043C
	thumb_func_end ov108_021E9E80

	thumb_func_start ov108_021E9EB8
ov108_021E9EB8: ; 0x021E9EB8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r4, _021E9EF8 ; =ov108_021EAC48
	mov r7, #0
	add r5, r6, #0
_021E9EC2:
	ldr r0, _021E9EFC ; =0x0000043C
	mov r1, #0x11
	lsl r1, r1, #6
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	add r2, r4, #0
	bl SpriteSystem_CreateSpriteFromResourceHeader
	ldr r1, _021E9F00 ; =0x00000444
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	add r7, r7, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r7, #4
	blt _021E9EC2
	ldr r0, _021E9F00 ; =0x00000444
	mov r1, #1
	ldr r0, [r6, r0]
	bl thunk_Sprite_SetPriority
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9EF8: .word ov108_021EAC48
_021E9EFC: .word 0x0000043C
_021E9F00: .word 0x00000444
	thumb_func_end ov108_021E9EB8

	thumb_func_start ov108_021E9F04
ov108_021E9F04: ; 0x021E9F04
	push {r4, r5, r6, lr}
	ldr r6, _021E9F1C ; =0x00000444
	add r5, r0, #0
	mov r4, #0
_021E9F0C:
	ldr r0, [r5, r6]
	bl thunk_Sprite_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E9F0C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E9F1C: .word 0x00000444
	thumb_func_end ov108_021E9F04

	thumb_func_start ov108_021E9F20
ov108_021E9F20: ; 0x021E9F20
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _021E9F88 ; =0x00000448
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r4, #2
	bl Sprite_SetAnimCtrlSeq
	ldr r0, _021E9F88 ; =0x00000448
	ldr r0, [r5, r0]
	bl Sprite_ResetAnimCtrlState
	ldr r0, _021E9F8C ; =0x00000474
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r1, #0x33
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #4
	add r3, r0, #0
	lsl r2, r4, #2
	mov r4, #0x30
	sub r3, r4, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E9F90 ; =ov108_021EAAA4
	lsr r3, r3, #1
	ldr r0, [r0, r2]
	mov r2, #0x33
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _021E9F8C ; =0x00000474
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, _021E9F8C ; =0x00000474
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E9F88: .word 0x00000448
_021E9F8C: .word 0x00000474
_021E9F90: .word ov108_021EAAA4
	thumb_func_end ov108_021E9F20

	thumb_func_start ov108_021E9F94
ov108_021E9F94: ; 0x021E9F94
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	cmp r1, #0
	bne _021E9FA2
	ldr r0, _021EA034 ; =0x00000524
	b _021E9FA4
_021E9FA2:
	ldr r0, _021EA038 ; =0x0000052C
_021E9FA4:
	ldr r4, [r5, r0]
	mov r1, #5
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, _021EA03C ; =0x00000438
	mov r2, #0
	ldr r0, [r5, r0]
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #5
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, _021EA03C ; =0x00000438
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #6
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r0, [r4]
	mov r1, #7
	add r3, r2, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r4, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, _021EA03C ; =0x00000438
	ldr r0, [r5, r0]
	bl CopyToBgTilemapRect
	ldr r0, _021EA03C ; =0x00000438
	mov r1, #5
	ldr r0, [r5, r0]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021EA03C ; =0x00000438
	mov r1, #6
	ldr r0, [r5, r0]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021EA03C ; =0x00000438
	mov r1, #7
	ldr r0, [r5, r0]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_021EA034: .word 0x00000524
_021EA038: .word 0x0000052C
_021EA03C: .word 0x00000438
	thumb_func_end ov108_021E9F94

	thumb_func_start ov108_021EA040
ov108_021EA040: ; 0x021EA040
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, _021EA244 ; =0x00000438
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #6
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, _021EA248 ; =0x00000454
	mov r4, #0
	add r7, r5, r0
_021EA06A:
	mov r0, #0x43
	lsl r0, r0, #4
	ldrb r1, [r5, r0]
	mov r0, #6
	mul r0, r1
	add r0, r4, r0
	str r0, [sp, #0x1c]
	add r0, r4, #6
	lsl r0, r0, #4
	str r0, [sp, #0x20]
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _021EA24C ; =0x0000042D
	ldrb r1, [r5, r0]
	ldr r0, [sp, #0x1c]
	cmp r0, r1
	blt _021EA09A
	ldr r0, [sp, #0x20]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	b _021EA168
_021EA09A:
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov108_021EA52C
	cmp r0, #0
	ble _021EA0AE
	mov r0, #1
	b _021EA0B0
_021EA0AE:
	mov r0, #0
_021EA0B0:
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _021EA250 ; =0x0000051C
	lsl r1, r1, #0x1c
	ldr r0, [r5, r0]
	mov r2, #0x10
	str r2, [sp]
	mov r2, #4
	str r2, [sp, #4]
	add r2, r0, #0
	add r2, #0xc
	str r2, [sp, #8]
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsr r3, r4, #0x1f
	lsl r6, r4, #0x1f
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	sub r6, r6, r3
	mov r2, #0x1f
	ror r6, r2
	add r2, r3, r6
	add r3, r4, r3
	lsl r0, r0, #0x15
	asr r3, r3, #1
	lsr r0, r0, #0x18
	add r6, r3, #1
	str r0, [sp, #0x18]
	ldr r0, _021EA244 ; =0x00000438
	lsl r3, r6, #2
	add r3, r6, r3
	lsl r2, r2, #0x1c
	lsl r3, r3, #0x18
	ldr r0, [r5, r0]
	mov r1, #6
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	mov r1, #0xcd
	ldr r2, [sp, #0x1c]
	lsl r1, r1, #2
	lsl r3, r2, #2
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r1, [r5, r1]
	add r2, r2, r3
	ldrb r1, [r1, r2]
	mov r2, #0xc6
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	add r1, #0xe
	bl ReadMsgDataIntoString
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0x70
	sub r3, r1, r0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA254 ; =0x00010200
	mov r2, #0xc6
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	lsl r2, r2, #2
	lsr r6, r3, #0x1f
	add r6, r3, r6
	ldr r2, [r5, r2]
	add r0, r7, r0
	mov r1, #4
	asr r3, r6, #1
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x20]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
_021EA168:
	add r4, r4, #1
	cmp r4, #6
	bge _021EA170
	b _021EA06A
_021EA170:
	ldr r0, _021EA258 ; =0x00000484
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r3, #1
	str r3, [sp]
	mov r2, #0x43
	mov r0, #0x31
	str r3, [sp, #4]
	lsl r2, r2, #4
	ldrb r2, [r5, r2]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r1, #1
	str r1, [sp]
	mov r0, #0x31
	ldr r2, _021EA25C ; =0x0000042E
	str r1, [sp, #4]
	lsl r0, r0, #4
	ldrb r2, [r5, r2]
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl BufferIntegerAsString
	mov r2, #0x31
	lsl r2, r2, #4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x1c
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0
	mov r2, #0xc5
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	ldr r0, _021EA258 ; =0x00000484
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, _021EA258 ; =0x00000484
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _021EA244 ; =0x00000438
	mov r1, #5
	ldr r0, [r5, r0]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _021EA244 ; =0x00000438
	mov r1, #6
	ldr r0, [r5, r0]
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x43
	lsl r0, r0, #4
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _021EA20E
	add r0, #0x1c
	ldr r0, [r5, r0]
	mov r1, #7
	bl Sprite_SetAnimCtrlSeq
	b _021EA218
_021EA20E:
	add r0, #0x1c
	ldr r0, [r5, r0]
	mov r1, #5
	bl Sprite_SetAnimCtrlSeq
_021EA218:
	mov r0, #0x43
	lsl r0, r0, #4
	sub r1, r0, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r0]
	sub r1, r1, #1
	cmp r2, r1
	bne _021EA236
	add r0, #0x20
	ldr r0, [r5, r0]
	mov r1, #0xa
	bl Sprite_SetAnimCtrlSeq
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_021EA236:
	add r0, #0x20
	ldr r0, [r5, r0]
	mov r1, #8
	bl Sprite_SetAnimCtrlSeq
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA244: .word 0x00000438
_021EA248: .word 0x00000454
_021EA24C: .word 0x0000042D
_021EA250: .word 0x0000051C
_021EA254: .word 0x00010200
_021EA258: .word 0x00000484
_021EA25C: .word 0x0000042E
	thumb_func_end ov108_021EA040

	thumb_func_start ov108_021EA260
ov108_021EA260: ; 0x021EA260
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _021EA2DC ; =0x00000494
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	ldr r3, _021EA2E0 ; =0x00000432
	mov r2, #0xc3
	lsl r2, r2, #2
	ldrb r5, [r4, r3]
	add r1, r2, #0
	add r1, #0x28
	lsl r3, r5, #2
	ldr r0, [r4, r2]
	add r2, #0xc
	ldr r1, [r4, r1]
	add r3, r5, r3
	ldrb r1, [r1, r3]
	ldr r2, [r4, r2]
	add r1, #0xe
	bl ReadMsgDataIntoString
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0x70
	sub r3, r1, r0
	mov r1, #0
	mov r2, #0xc6
	lsr r5, r3, #0x1f
	add r5, r3, r5
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA2E4 ; =0x00010200
	lsl r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _021EA2DC ; =0x00000494
	ldr r2, [r4, r2]
	add r0, r4, r0
	mov r1, #4
	asr r3, r5, #1
	bl AddTextPrinterParameterizedWithColor
	ldr r0, _021EA2DC ; =0x00000494
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	ldr r0, _021EA2E8 ; =0x00000484
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021EA2DC: .word 0x00000494
_021EA2E0: .word 0x00000432
_021EA2E4: .word 0x00010200
_021EA2E8: .word 0x00000484
	thumb_func_end ov108_021EA260

	thumb_func_start ov108_021EA2EC
ov108_021EA2EC: ; 0x021EA2EC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	cmp r1, #6
	blo _021EA2FC
	mov r3, #0xe0
	mov r2, #0xb4
	mov r5, #1
	b _021EA31A
_021EA2FC:
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1f
	sub r2, r2, r3
	mov r0, #0x1f
	ror r2, r0
	add r0, r3, r2
	lsl r0, r0, #0x17
	asr r3, r0, #0x10
	lsr r0, r1, #1
	add r1, r0, #1
	mov r0, #0x28
	mul r0, r1
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	mov r5, #0
_021EA31A:
	ldr r0, _021EA330 ; =0x00000444
	add r1, r3, #0
	ldr r0, [r4, r0]
	bl Sprite_SetPositionXY
	ldr r0, _021EA330 ; =0x00000444
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl Sprite_SetAnimCtrlSeq
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EA330: .word 0x00000444
	thumb_func_end ov108_021EA2EC

	thumb_func_start ov108_021EA334
ov108_021EA334: ; 0x021EA334
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _021EA40C ; =0x00000454
	mov r6, #0
	add r4, r1, #0
	add r0, r5, r0
	add r1, r6, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	beq _021EA352
	cmp r4, #2
	beq _021EA382
	b _021EA3A4
_021EA352:
	ldr r1, _021EA410 ; =0x00000433
	mov r2, #0xc3
	lsl r2, r2, #2
	ldrb r1, [r5, r1]
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, #0xe
	bl ReadMsgDataIntoString
	add r1, r6, #0
	mov r2, #0x31
	str r1, [sp]
	mov r0, #2
	lsl r2, r2, #4
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r2, r2, #4
	ldr r2, [r5, r2]
	mov r3, #1
	bl BufferString
	mov r6, #1
	b _021EA3A4
_021EA382:
	ldr r0, _021EA414 ; =0x00000435
	ldrb r2, [r5, r0]
	cmp r2, #0
	bne _021EA38E
	mov r4, #3
	b _021EA3A4
_021EA38E:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r6, #1
_021EA3A4:
	cmp r6, #0
	beq _021EA3CE
	mov r2, #0xc3
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	mov r2, #0x31
	lsl r2, r2, #4
	add r1, r2, #0
	ldr r0, [r5, r2]
	add r1, #8
	add r2, r2, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _021EA3DE
_021EA3CE:
	mov r2, #0xc3
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	add r1, r4, #0
	bl ReadMsgDataIntoString
_021EA3DE:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	mov r2, #0xc6
	ldr r0, _021EA40C ; =0x00000454
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, _021EA40C ; =0x00000454
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EA40C: .word 0x00000454
_021EA410: .word 0x00000433
_021EA414: .word 0x00000435
	thumb_func_end ov108_021EA334

	thumb_func_start ov108_021EA418
ov108_021EA418: ; 0x021EA418
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _021EA474 ; =0x00000464
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r2, #0xc3
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	add r1, r4, #4
	bl ReadMsgDataIntoString
	ldr r2, _021EA474 ; =0x00000464
	mov r1, #1
	add r0, r5, r2
	sub r2, #0x82
	mov r3, #0xc
	bl DrawFrameAndWindow2
	mov r3, #0
	mov r2, #0xc6
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA478 ; =0x0001020F
	lsl r2, r2, #2
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, _021EA474 ; =0x00000464
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterizedWithColor
	ldr r0, _021EA474 ; =0x00000464
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021EA474: .word 0x00000464
_021EA478: .word 0x0001020F
	thumb_func_end ov108_021EA418

	thumb_func_start ov108_021EA47C
ov108_021EA47C: ; 0x021EA47C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl ov108_021EA624
	ldr r0, _021EA500 ; =0x000004A4
	mov r1, #0
	add r0, r4, r0
	bl FillWindowPixelBuffer
	ldr r2, _021EA504 ; =0x00000431
	sub r1, r2, #1
	ldrb r3, [r4, r1]
	mov r1, #6
	ldrb r0, [r4, r2]
	mul r1, r3
	add r1, r0, r1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r0, #6
	bhs _021EA4AE
	sub r0, r2, #4
	ldrb r0, [r4, r0]
	cmp r1, r0
	blo _021EA4BA
_021EA4AE:
	ldr r0, _021EA500 ; =0x000004A4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
_021EA4BA:
	mov r3, #0xc3
	lsl r3, r3, #2
	add r2, r3, #0
	add r2, #0x28
	ldr r5, [r4, r2]
	lsl r2, r1, #2
	add r1, r1, r2
	ldrb r1, [r5, r1]
	ldr r0, [r4, r3]
	add r3, #0xc
	ldr r2, [r4, r3]
	add r1, #0x26
	bl ReadMsgDataIntoString
	mov r1, #0
	mov r2, #0xc6
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EA508 ; =0x00010200
	lsl r2, r2, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _021EA500 ; =0x000004A4
	ldr r2, [r4, r2]
	add r0, r4, r0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	ldr r0, _021EA500 ; =0x000004A4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EA500: .word 0x000004A4
_021EA504: .word 0x00000431
_021EA508: .word 0x00010200
	thumb_func_end ov108_021EA47C

	thumb_func_start ov108_021EA50C
ov108_021EA50C: ; 0x021EA50C
	push {r4, lr}
	mov r1, #0
	add r4, r0, #0
	bl ov108_021E940C
	ldr r1, _021EA528 ; =0x00000431
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov108_021EA2EC
	add r0, r4, #0
	bl ov108_021EA47C
	pop {r4, pc}
	.balign 4, 0
_021EA528: .word 0x00000431
	thumb_func_end ov108_021EA50C

	thumb_func_start ov108_021EA52C
ov108_021EA52C: ; 0x021EA52C
	push {r3, r4}
	ldr r2, _021EA580 ; =0x00000435
	ldrb r2, [r0, r2]
	cmp r2, #0
	bne _021EA53C
	mov r0, #4
	pop {r3, r4}
	bx lr
_021EA53C:
	lsl r2, r1, #2
	add r4, r1, r2
	mov r1, #0xcd
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	ldr r3, [r0, #0x1c]
	add r1, r1, r4
	ldrb r0, [r1, #3]
	ldrb r2, [r3, #0x18]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r2, r0
	beq _021EA566
	cmp r2, #0
	bne _021EA560
	mov r0, #2
	pop {r3, r4}
	bx lr
_021EA560:
	mov r0, #3
	pop {r3, r4}
	bx lr
_021EA566:
	ldrb r0, [r1, #1]
	lsl r0, r0, #2
	add r0, r3, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _021EA578
	mov r0, #1
	pop {r3, r4}
	bx lr
_021EA578:
	mov r0, #0
	pop {r3, r4}
	bx lr
	nop
_021EA580: .word 0x00000435
	thumb_func_end ov108_021EA52C

	thumb_func_start ov108_021EA584
ov108_021EA584: ; 0x021EA584
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r3, [sp]
	add r6, r1, #0
	ldr r0, [r5]
	mov r1, #0x14
	add r7, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x14
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r6, #2
	str r5, [r4, #4]
	lsl r0, r0, #2
	str r7, [r4]
	add r1, r5, r0
	ldr r0, _021EA5D8 ; =0x00000444
	strb r6, [r4, #8]
	ldr r0, [r1, r0]
	lsl r1, r6, #1
	add r1, r6, r1
	add r1, r1, #6
	bl Sprite_SetAnimCtrlSeq
	ldr r0, _021EA5DC ; =0x000005E1
	bl PlaySE
	ldr r1, [r4]
	cmp r1, #0
	beq _021EA5CC
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_021EA5CC:
	ldr r0, _021EA5E0 ; =ov108_021EA5E4
	ldr r2, [sp]
	add r1, r4, #0
	bl SysTask_CreateOnMainQueue
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA5D8: .word 0x00000444
_021EA5DC: .word 0x000005E1
_021EA5E0: .word ov108_021EA5E4
	thumb_func_end ov108_021EA584

	thumb_func_start ov108_021EA5E4
ov108_021EA5E4: ; 0x021EA5E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #9]
	add r5, r0, #0
	add r0, r1, #1
	strb r0, [r4, #9]
	cmp r1, #2
	blo _021EA61E
	ldr r0, [r4, #4]
	bl ov108_021EA040
	ldr r0, [r4, #4]
	bl ov108_021EA47C
	ldr r0, [r4, #4]
	ldr r1, _021EA620 ; =0x00000431
	ldrb r1, [r0, r1]
	bl ov108_021EA2EC
	ldr r1, [r4]
	ldr r0, [r1]
	sub r0, r0, #1
	str r0, [r1]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl SysTask_Destroy
_021EA61E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EA620: .word 0x00000431
	thumb_func_end ov108_021EA5E4

	thumb_func_start ov108_021EA624
ov108_021EA624: ; 0x021EA624
	ldr r1, _021EA634 ; =0x00000434
	mov r2, #1
	strb r2, [r0, r1]
	sub r1, #0xfc
	add r0, r0, r1
	ldr r3, _021EA638 ; =ov108_021E8ED8
	mov r1, #0
	bx r3
	.balign 4, 0
_021EA634: .word 0x00000434
_021EA638: .word ov108_021E8ED8
	thumb_func_end ov108_021EA624

	thumb_func_start ov108_021EA63C
ov108_021EA63C: ; 0x021EA63C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	mov r6, #0
	mov r1, #0xa
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r4, r6, #0
	bl _u32_div_f
	ldr r2, _021EA6F8 ; =ov108_021EAD28
	lsl r0, r1, #2
	add r0, r2, r0
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov ip, r0
	ldr r0, [sp]
	cmp r0, #0
	ble _021EA69C
	mov r7, #1
_021EA664:
	ldr r1, [sp, #0xc]
	mov r0, ip
	ldrb r0, [r1, r0]
	mov r2, #0
	lsl r1, r0, #3
	ldr r0, _021EA6FC ; =ov108_021EAD08
	ldrb r5, [r0, r1]
	add r3, r0, r1
	cmp r5, #0
	ble _021EA690
	ldr r3, [r3, #4]
_021EA67A:
	ldrb r0, [r3]
	add r1, r7, #0
	add r2, r2, #1
	lsl r1, r0
	add r0, r6, #1
	lsl r0, r0, #0x18
	orr r4, r1
	lsr r6, r0, #0x18
	add r3, r3, #1
	cmp r2, r5
	blt _021EA67A
_021EA690:
	mov r0, ip
	add r1, r0, #1
	ldr r0, [sp]
	mov ip, r1
	cmp r1, r0
	blt _021EA664
_021EA69C:
	lsl r5, r6, #2
	ldr r0, [sp, #0x28]
	add r1, r6, r5
	bl AllocFromHeap
	mov r1, #0
	add r2, r6, r5
	str r0, [sp, #0x10]
	bl MI_CpuFill8
	mov r7, #0
	add r6, r7, #0
_021EA6B4:
	mov r0, #1
	tst r0, r4
	beq _021EA6E4
	lsl r0, r7, #2
	add r1, r7, r0
	ldr r0, [sp, #0x10]
	strb r6, [r0, r1]
	add r5, r0, r1
	ldr r2, [sp, #4]
	add r0, r5, #2
	add r1, r6, #0
	bl sub_02097268
	ldrb r1, [r5, #3]
	lsl r0, r1, #0x1c
	lsl r1, r1, #0x19
	lsr r0, r0, #0x1d
	lsr r1, r1, #0x1d
	bl ov108_021EA700
	strb r0, [r5, #1]
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_021EA6E4:
	add r6, r6, #1
	lsr r4, r4, #1
	cmp r6, #0x18
	blt _021EA6B4
	ldr r0, [sp, #8]
	strb r7, [r0]
	ldr r0, [sp, #0x10]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EA6F8: .word ov108_021EAD28
_021EA6FC: .word ov108_021EAD08
	thumb_func_end ov108_021EA63C

	thumb_func_start ov108_021EA700
ov108_021EA700: ; 0x021EA700
	cmp r0, #1
	bne _021EA714
	cmp r1, #1
	beq _021EA70C
	mov r0, #1
	b _021EA70E
_021EA70C:
	mov r0, #0
_021EA70E:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_021EA714:
	cmp r1, #1
	bne _021EA71C
	mov r0, #2
	bx lr
_021EA71C:
	mov r0, #3
	bx lr
	thumb_func_end ov108_021EA700

    .rodata

ov108_021EA9C4: ; 0x021EA9C4
	.byte 0x62, 0xDD, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05
	.byte 0x00, 0x40, 0x06, 0x00, 0x00, 0x00, 0x4B, 0x00

ov108_021EA9D8: ; 0x021EA9D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov108_021EA9E4: ; 0x021EA9E4
	.byte 0x15, 0x01, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x47, 0x01, 0x00, 0x00
	.byte 0x14, 0x00, 0x14, 0x00, 0x47, 0x01, 0x00, 0x00, 0x14, 0x00, 0x14, 0x00, 0x90, 0x01, 0x00, 0x00
	.byte 0xFB, 0xFF, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1D, 0x01, 0x00, 0x00
	.byte 0xFB, 0xFF, 0x00, 0x00, 0x5B, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x79, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5B, 0x01, 0x00, 0x00
	.byte 0xF9, 0xFF, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0xFD, 0xFF, 0x0A, 0x00, 0x5C, 0x01, 0x00, 0x00
	.byte 0xFD, 0xFF, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0xFA, 0xFF, 0x00, 0x00, 0xED, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xED, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF7, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x01, 0x00, 0x00, 0xF3, 0xFF, 0x00, 0x00, 0x56, 0x01, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x89, 0x01, 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0xA4, 0x01, 0x07, 0x00
	.byte 0x05, 0x00, 0xFF, 0xFF, 0x3B, 0x01, 0x01, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x7A, 0x01, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x7A, 0x01, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x5B, 0x01, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

ov108_021EAAA4: ; 0x021EAAA4
	.byte 0x00, 0x0F, 0x07, 0x00, 0x00, 0x0F, 0x07, 0x00, 0x00, 0x02, 0x01, 0x00

ov108_021EAAB0: ; 0x021EAAB0
	.byte 0x3E, 0x00, 0x3F, 0x00, 0x3D, 0x00, 0x3C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x57, 0x00, 0x00, 0x00

ov108_021EAAC0: ; 0x021EAAC0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov108_021EAAD0: ; 0x021EAAD0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov108_021EAAE4: ; 0x021EAAE4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EAB00: ; 0x021EAB00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EAB1C: ; 0x021EAB1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EAB38: ; 0x021EAB38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov108_021EAB54: ; 0x021EAB54
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EAB70: ; 0x021EAB70
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EAB8C: ; 0x021EAB8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov108_021EABA8: ; 0x021EABA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov108_021EABC8: ; 0x021EABC8
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov108_021EABF0: ; 0x021EABF0
	.byte 0x28, 0x48, 0x00, 0x80, 0x28, 0x48, 0x80, 0x00, 0x50, 0x70, 0x00, 0x80, 0x50, 0x70, 0x80, 0x00
	.byte 0x78, 0x98, 0x00, 0x80, 0x78, 0x98, 0x80, 0x00, 0xA8, 0xC0, 0xC0, 0x00, 0xA4, 0xBC, 0x09, 0x37
	.byte 0xA4, 0xBC, 0x31, 0x5F, 0xFF, 0x00, 0x00, 0x00

ov108_021EAC18: ; 0x021EAC18
	.byte 0x04, 0x02, 0x01, 0x1C, 0x02, 0x04, 0x6E, 0x03
	.byte 0x04, 0x02, 0x15, 0x1B, 0x02, 0x0D, 0x38, 0x03, 0x05, 0x19, 0x15, 0x06, 0x03, 0x0D, 0x26, 0x03
	.byte 0x05, 0x0D, 0x15, 0x06, 0x02, 0x04, 0x1A, 0x03, 0x05, 0x09, 0x08, 0x0E, 0x02, 0x04, 0xFE, 0x02
	.byte 0x01, 0x02, 0x12, 0x1C, 0x06, 0x01, 0x58, 0x03

ov108_021EAC48: ; 0x021EAC48
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB4, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x08, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.balign 4, 0
ov108_021EACE8:
	.byte 0x00, 0x01, 0x02, 0x13, 0x14, 0x0C

	.balign 4, 0
ov108_021EACF0:
	.byte 0x09, 0x0A, 0x0B, 0x0F, 0x10, 0x12

	.balign 4, 0
ov108_021EACF8:
	.byte 0x06, 0x07, 0x08, 0x15, 0x16, 0x17

	.balign 4, 0
ov108_021EAD00:
	.byte 0x03, 0x04, 0x05, 0x0D, 0x0E, 0x11

	.balign 4, 0
ov108_021EAD08: ; 0x021EAD08
	.word 6, ov108_021EACE8
	.word 6, ov108_021EAD00
	.word 6, ov108_021EACF8
	.word 6, ov108_021EACF0

ov108_021EAD28: ; 0x021EAD28
	.byte 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03
	.byte 0x00, 0x01, 0x02, 0x03, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00
	.byte 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02
	; 0x021EAD50
