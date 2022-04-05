	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov69_021E5900
ov69_021E5900: ; 0x021E5900
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5A08 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5A0C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #3
	mov r1, #0x31
	lsl r2, r2, #7
	bl CreateHeap
	ldr r1, _021E5A10 ; =0x0000C33C
	add r0, r4, #0
	mov r2, #0x31
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5A10 ; =0x0000C33C
	mov r1, #0
	add r5, r0, #0
	bl memset
	mov r0, #0x31
	str r0, [r5]
	ldr r0, _021E5A14 ; =gGameLanguage
	ldrb r0, [r0]
	cmp r0, #1
	bne _021E595E
	mov r1, #1
	b _021E5960
_021E595E:
	mov r1, #0
_021E5960:
	mov r0, #0xc3
	lsl r0, r0, #8
	str r1, [r5, r0]
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	bl sub_0202CA44
	str r0, [r5, #4]
	bl sub_0202CA8C
	ldr r1, _021E5A18 ; =0x0000C324
	str r0, [r5, r1]
	ldr r0, [r5, #4]
	bl sub_0202CA90
	ldr r1, _021E5A1C ; =0x0000C328
	str r0, [r5, r1]
	ldr r0, [r5, #4]
	bl sub_0202CB5C
	ldr r1, _021E5A20 ; =0x0000C334
	str r0, [r5, r1]
	add r0, r4, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r5, #8]
	bl ov69_021E60F8
	bl ov69_021E6118
	ldr r0, [r5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0201F590
	ldr r0, [r5]
	bl BgConfig_Alloc
	ldr r1, _021E5A24 ; =0x0000C010
	str r0, [r5, r1]
	bl GX_BothDispOn
	bl ResetAllTextPrinters
	ldr r2, [r5]
	mov r0, #8
	mov r1, #0x40
	bl ScrStrBufs_new_custom
	ldr r1, _021E5A28 ; =0x0000C080
	str r0, [r5, r1]
	ldr r0, [r5]
	bl GF_Camera_Create
	ldr r1, _021E5A2C ; =0x0000C2DC
	str r0, [r5, r1]
	mov r0, #0
	add r1, #0x1c
	str r0, [r5, r1]
	ldr r0, _021E5A30 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	add r0, r5, #0
	bl ov69_021E6138
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5A08: .word 0xFFFFE0FF
_021E5A0C: .word 0x04001000
_021E5A10: .word 0x0000C33C
_021E5A14: .word gGameLanguage
_021E5A18: .word 0x0000C324
_021E5A1C: .word 0x0000C328
_021E5A20: .word 0x0000C334
_021E5A24: .word 0x0000C010
_021E5A28: .word 0x0000C080
_021E5A2C: .word 0x0000C2DC
_021E5A30: .word gSystem + 0x60
	thumb_func_end ov69_021E5900

	thumb_func_start ov69_021E5A34
ov69_021E5A34: ; 0x021E5A34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5]
	cmp r0, #0xe
	beq _021E5A60
	cmp r0, #0xf
	beq _021E5A60
	cmp r0, #0x10
	beq _021E5A60
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E5A60
	ldr r0, _021E5D7C ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
_021E5A60:
	ldr r0, [r5]
	cmp r0, #0x12
	bls _021E5A68
	b _021E6028
_021E5A68:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5A74: ; jump table
	.short _021E5A9A - _021E5A74 - 2 ; case 0
	.short _021E5B0A - _021E5A74 - 2 ; case 1
	.short _021E5B18 - _021E5A74 - 2 ; case 2
	.short _021E5B3A - _021E5A74 - 2 ; case 3
	.short _021E5B60 - _021E5A74 - 2 ; case 4
	.short _021E5BAC - _021E5A74 - 2 ; case 5
	.short _021E5BD6 - _021E5A74 - 2 ; case 6
	.short _021E5C10 - _021E5A74 - 2 ; case 7
	.short _021E5C4C - _021E5A74 - 2 ; case 8
	.short _021E5CA8 - _021E5A74 - 2 ; case 9
	.short _021E5CF8 - _021E5A74 - 2 ; case 10
	.short _021E5D54 - _021E5A74 - 2 ; case 11
	.short _021E5D68 - _021E5A74 - 2 ; case 12
	.short _021E5DE0 - _021E5A74 - 2 ; case 13
	.short _021E5E30 - _021E5A74 - 2 ; case 14
	.short _021E5EB4 - _021E5A74 - 2 ; case 15
	.short _021E5FCC - _021E5A74 - 2 ; case 16
	.short _021E5FDC - _021E5A74 - 2 ; case 17
	.short _021E5FFE - _021E5A74 - 2 ; case 18
_021E5A9A:
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xba
	bl NewMsgDataFromNarc
	ldr r1, _021E5D80 ; =0x0000C070
	str r0, [r4, r1]
	ldr r1, [r4]
	mov r0, #0x7b
	bl NARC_ctor
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov69_021E6E88
	add r0, r4, #0
	add r1, r6, #0
	bl ov69_021E64CC
	add r0, r6, #0
	bl NARC_dtor
	mov r0, #0
	ldr r1, _021E5D84 ; =0x0000C2FC
	add r3, r0, #0
	str r0, [r4, r1]
	mov r1, #6
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r2, [r4]
	str r2, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #1
	str r0, [r5]
	b _021E6028
_021E5B0A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5BEC
	mov r0, #2
	str r0, [r5]
	b _021E6028
_021E5B18:
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5BEC
	ldr r0, _021E5D88 ; =0x0000C324
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E5B34
	mov r0, #3
	str r0, [r5]
	b _021E6028
_021E5B34:
	mov r0, #0xe
	str r0, [r5]
	b _021E6028
_021E5B3A:
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5BEC
	ldr r0, _021E5D8C ; =ov69_021E7698
	ldr r1, _021E5D90 ; =0x0000C024
	str r0, [sp]
	ldr r2, _021E5D94 ; =_021E7644
	ldr r3, _021E5D98 ; =ov69_021E76E8
	add r0, r4, #0
	add r1, r4, r1
	bl ov69_021E68EC
	mov r0, #4
	str r0, [r5]
	b _021E6028
_021E5B60:
	ldr r0, _021E5D9C ; =0x0000C064
	ldr r0, [r4, r0]
	bl ListMenu_ProcessInput
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021E5BEC
	add r0, r4, #0
	bl ov69_021E6A54
	ldr r0, _021E5DA0 ; =0x000005DC
	bl PlaySE
	add r0, r6, #2
	cmp r0, #4
	bhi _021E5B9A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5B90: ; jump table
	.short _021E5BA6 - _021E5B90 - 2 ; case 0
	.short _021E5B9A - _021E5B90 - 2 ; case 1
	.short _021E5B9A - _021E5B90 - 2 ; case 2
	.short _021E5BA0 - _021E5B90 - 2 ; case 3
	.short _021E5BA6 - _021E5B90 - 2 ; case 4
_021E5B9A:
	mov r0, #0xe
	str r0, [r5]
	b _021E6028
_021E5BA0:
	mov r0, #5
	str r0, [r5]
	b _021E6028
_021E5BA6:
	mov r0, #0x11
	str r0, [r5]
	b _021E6028
_021E5BAC:
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5BEC
	ldr r0, [r4]
	ldr r1, _021E5DA4 ; =ov69_021E7664
	str r0, [sp]
	ldr r0, _021E5DA8 ; =0x0000C010
	ldr r2, _021E5DAC ; =0x000001D9
	ldr r0, [r4, r0]
	mov r3, #7
	bl Std_CreateYesNoMenu
	ldr r1, _021E5DB0 ; =0x0000C06C
	str r0, [r4, r1]
	mov r0, #6
	str r0, [r5]
	b _021E6028
_021E5BD6:
	ldr r0, _021E5DB0 ; =0x0000C06C
	ldr r1, [r4]
	ldr r0, [r4, r0]
	bl Handle2dMenuInput_DeleteOnFinish
	cmp r0, #0
	beq _021E5BEE
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _021E5C0A
_021E5BEC:
	b _021E6028
_021E5BEE:
	mov r0, #0xc3
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _021E5C04
	mov r1, #0x67
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #9
	str r0, [r5]
	b _021E6028
_021E5C04:
	mov r0, #7
	str r0, [r5]
	b _021E6028
_021E5C0A:
	mov r0, #3
	str r0, [r5]
	b _021E6028
_021E5C10:
	add r0, r4, #0
	mov r1, #3
	mov r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5CB6
	ldr r1, _021E5DB4 ; =0x0000C32C
	mov r0, #0
	str r0, [r4, r1]
	bl LocationGmmDatGetDistrictNameMsgIdsPtr
	add r6, r0, #0
	mov r0, #0
	bl LocationGmmDatGetDistrictCount
	ldr r1, _021E5DB8 ; =0x0000031E
	ldr r2, _021E5DBC ; =ov69_021E7674
	str r1, [sp]
	ldr r1, _021E5D90 ; =0x0000C024
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r3, _021E5DC0 ; =ov69_021E7708
	add r0, r4, #0
	add r1, r4, r1
	bl ov69_021E6994
	mov r0, #8
	str r0, [r5]
	b _021E6028
_021E5C4C:
	ldr r0, _021E5D9C ; =0x0000C064
	ldr r0, [r4, r0]
	bl ListMenu_ProcessInput
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021E5CB6
	add r0, r4, #0
	bl ov69_021E6A54
	ldr r0, _021E5DA0 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	cmp r6, r0
	beq _021E5C7A
	mov r0, #0
	bl LocationGmmDatGetDistrictNameMsgIdsPtr
	ldrb r6, [r0, r6]
_021E5C7A:
	mov r0, #1
	mvn r0, r0
	cmp r6, r0
	beq _021E5CA2
	ldr r0, _021E5DB4 ; =0x0000C32C
	str r6, [r4, r0]
	ldr r0, [r4, r0]
	bl ov69_021E758C
	cmp r0, #1
	bne _021E5C96
	mov r0, #9
	str r0, [r5]
	b _021E6028
_021E5C96:
	ldr r0, _021E5DC4 ; =0x0000C330
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #0xb
	str r0, [r5]
	b _021E6028
_021E5CA2:
	mov r0, #3
	str r0, [r5]
	b _021E6028
_021E5CA8:
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	bl ov69_021E6810
	cmp r0, #1
	beq _021E5CB8
_021E5CB6:
	b _021E6028
_021E5CB8:
	ldr r0, _021E5DC4 ; =0x0000C330
	mov r1, #0
	str r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl LocationGmmDatIndexGetByCountryMsgNo
	add r6, r0, #0
	bl LocationGmmDatGetGmmNo
	add r7, r0, #0
	add r0, r6, #0
	bl LocationGmmDatGetDistrictNameMsgIdsPtr
	str r0, [sp, #0x10]
	add r0, r6, #0
	bl LocationGmmDatGetDistrictCount
	ldr r1, [sp, #0x10]
	str r7, [sp]
	str r1, [sp, #4]
	ldr r1, _021E5D90 ; =0x0000C024
	str r0, [sp, #8]
	ldr r2, _021E5DBC ; =ov69_021E7674
	ldr r3, _021E5DC0 ; =ov69_021E7708
	add r0, r4, #0
	add r1, r4, r1
	bl ov69_021E6994
	mov r0, #0xa
	str r0, [r5]
	b _021E6028
_021E5CF8:
	ldr r0, _021E5D9C ; =0x0000C064
	ldr r0, [r4, r0]
	bl ListMenu_ProcessInput
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021E5DF6
	add r0, r4, #0
	bl ov69_021E6A54
	ldr r0, _021E5DA0 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	cmp r6, r0
	beq _021E5D2C
	ldr r0, _021E5DB4 ; =0x0000C32C
	ldr r0, [r4, r0]
	bl LocationGmmDatIndexGetByCountryMsgNo
	bl LocationGmmDatGetDistrictNameMsgIdsPtr
	ldrb r6, [r0, r6]
_021E5D2C:
	mov r0, #1
	mvn r0, r0
	cmp r6, r0
	beq _021E5D3E
	ldr r0, _021E5DC4 ; =0x0000C330
	str r6, [r4, r0]
	mov r0, #0xb
	str r0, [r5]
	b _021E6028
_021E5D3E:
	mov r0, #0xc3
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E5D4E
	mov r0, #3
	str r0, [r5]
	b _021E6028
_021E5D4E:
	mov r0, #7
	str r0, [r5]
	b _021E6028
_021E5D54:
	ldr r2, _021E5DB4 ; =0x0000C32C
	add r0, r4, #0
	ldr r1, [r4, r2]
	add r2, r2, #4
	ldr r2, [r4, r2]
	bl ov69_021E6B5C
	mov r0, #0xc
	str r0, [r5]
	b _021E6028
_021E5D68:
	add r0, r4, #0
	mov r1, #5
	mov r2, #1
	bl ov69_021E6810
	cmp r0, #1
	bne _021E5DF6
	ldr r0, [r4]
	ldr r1, _021E5DA4 ; =ov69_021E7664
	b _021E5DC8
	.balign 4, 0
_021E5D7C: .word gSystem
_021E5D80: .word 0x0000C070
_021E5D84: .word 0x0000C2FC
_021E5D88: .word 0x0000C324
_021E5D8C: .word ov69_021E7698
_021E5D90: .word 0x0000C024
_021E5D94: .word _021E7644
_021E5D98: .word ov69_021E76E8
_021E5D9C: .word 0x0000C064
_021E5DA0: .word 0x000005DC
_021E5DA4: .word ov69_021E7664
_021E5DA8: .word 0x0000C010
_021E5DAC: .word 0x000001D9
_021E5DB0: .word 0x0000C06C
_021E5DB4: .word 0x0000C32C
_021E5DB8: .word 0x0000031E
_021E5DBC: .word ov69_021E7674
_021E5DC0: .word ov69_021E7708
_021E5DC4: .word 0x0000C330
_021E5DC8:
	str r0, [sp]
	ldr r0, _021E6034 ; =0x0000C010
	ldr r2, _021E6038 ; =0x000001D9
	ldr r0, [r4, r0]
	mov r3, #7
	bl Std_CreateYesNoMenu
	ldr r1, _021E603C ; =0x0000C06C
	str r0, [r4, r1]
	mov r0, #0xd
	str r0, [r5]
	b _021E6028
_021E5DE0:
	ldr r0, _021E603C ; =0x0000C06C
	ldr r1, [r4]
	ldr r0, [r4, r0]
	bl Handle2dMenuInput_DeleteOnFinish
	cmp r0, #0
	beq _021E5DF8
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _021E5E24
_021E5DF6:
	b _021E6028
_021E5DF8:
	add r0, r4, #0
	bl ov69_021E6C14
	ldr r2, _021E6040 ; =0x0000C32C
	ldr r0, [r4, #4]
	ldr r1, [r4, r2]
	add r2, r2, #4
	ldr r2, [r4, r2]
	bl sub_0202CA58
	ldr r0, _021E6040 ; =0x0000C32C
	add r1, r0, #0
	ldr r2, [r4, r0]
	sub r1, #8
	str r2, [r4, r1]
	add r1, r0, #4
	ldr r1, [r4, r1]
	sub r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0xe
	str r0, [r5]
	b _021E6028
_021E5E24:
	add r0, r4, #0
	bl ov69_021E6C14
	mov r0, #3
	str r0, [r5]
	b _021E6028
_021E5E30:
	mov r1, #0xc3
	lsl r1, r1, #8
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _021E5E4C
	add r0, r1, #0
	add r0, #0x34
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E5E4C
	mov r2, #0
	add r0, r1, #4
	strh r2, [r4, r0]
	b _021E5E52
_021E5E4C:
	ldr r0, _021E6044 ; =0x0000C304
	mov r1, #1
	strh r1, [r4, r0]
_021E5E52:
	add r0, r4, #0
	bl ov69_021E6F8C
	add r0, r4, #0
	bl ov69_021E62B0
	add r0, r4, #0
	bl ov69_021E6FE8
	add r0, r4, #0
	bl ov69_021E706C
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E6048 ; =0x0000C014
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E604C ; =0x0000C034
	ldr r2, _021E6038 ; =0x000001D9
	add r0, r4, r0
	mov r1, #0
	mov r3, #7
	bl DrawFrameAndWindow1
	ldr r0, _021E6050 ; =0x0000C324
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5E9C
	add r0, r4, #0
	bl ov69_021E6A8C
_021E5E9C:
	add r0, r4, #0
	bl ov69_021E6D5C
	ldr r0, _021E6054 ; =0x0000C338
	mov r1, #0
	str r1, [r4, r0]
	mov r1, #1
	sub r0, #0x40
	str r1, [r4, r0]
	mov r0, #0xf
	str r0, [r5]
	b _021E6028
_021E5EB4:
	ldr r0, _021E6058 ; =0x0000C2E8
	ldrh r6, [r4, r0]
	add r0, r4, #0
	bl ov69_021E6308
	add r0, r4, #0
	add r1, sp, #0x14
	bl ov69_021E6C30
	cmp r0, #0
	ldr r0, _021E605C ; =0x0000C044
	beq _021E5EDA
	ldr r2, _021E6038 ; =0x000001D9
	add r0, r4, r0
	mov r1, #0
	mov r3, #7
	bl DrawFrameAndWindow1
	b _021E5EE2
_021E5EDA:
	add r0, r4, r0
	mov r1, #0
	bl sub_0200E5D4
_021E5EE2:
	ldr r0, _021E6060 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	add r2, r1, #0
	tst r2, r0
	bne _021E5EF8
	ldr r2, _021E6064 ; =0x0000C308
	ldr r2, [r4, r2]
	add r3, r2, #0
	tst r3, r0
	beq _021E5F48
_021E5EF8:
	ldr r0, _021E604C ; =0x0000C034
	mov r1, #0
	add r0, r4, r0
	bl sub_0200E5D4
	ldr r0, _021E605C ; =0x0000C044
	mov r1, #0
	add r0, r4, r0
	bl sub_0200E5D4
	ldr r0, _021E6068 ; =0x000005DD
	bl PlaySE
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E6048 ; =0x0000C014
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E6050 ; =0x0000C324
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _021E5F3C
	mov r1, #2
	sub r0, #0x2c
	str r1, [r4, r0]
	mov r0, #3
	str r0, [r5]
	b _021E6028
_021E5F3C:
	add r0, r4, #0
	bl ov69_021E6C14
	mov r0, #0x11
	str r0, [r5]
	b _021E6028
_021E5F48:
	lsl r3, r0, #9
	tst r3, r1
	bne _021E5F54
	lsl r0, r0, #9
	tst r0, r2
	beq _021E5F76
_021E5F54:
	ldr r0, _021E6054 ; =0x0000C338
	ldr r3, [r4, r0]
	cmp r3, #0
	bne _021E5F76
	mov r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov69_021E6D5C
	ldr r0, _021E6054 ; =0x0000C338
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E6028
	ldr r0, _021E6068 ; =0x000005DD
	bl PlaySE
	b _021E6028
_021E5F76:
	ldr r0, _021E606C ; =0x00000403
	add r3, r1, #0
	tst r3, r0
	bne _021E5F84
	sub r0, r0, #3
	tst r0, r2
	beq _021E5F98
_021E5F84:
	ldr r0, _021E6054 ; =0x0000C338
	ldr r2, [r4, r0]
	cmp r2, #1
	bne _021E5F98
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov69_021E6D5C
	b _021E6028
_021E5F98:
	ldr r2, _021E6060 ; =gSystem
	add r0, r4, #0
	ldr r2, [r2, #0x44]
	bl ov69_021E7198
	cmp r0, #1
	bne _021E5FB8
	ldr r0, _021E6054 ; =0x0000C338
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _021E5FB8
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov69_021E6D5C
_021E5FB8:
	ldr r0, _021E6058 ; =0x0000C2E8
	ldrh r0, [r4, r0]
	cmp r6, r0
	beq _021E6028
	mov r0, #0x10
	str r0, [r5]
	ldr r0, _021E6070 ; =0x000005D9
	bl PlaySE
	b _021E6028
_021E5FCC:
	add r0, r4, #0
	bl ov69_021E737C
	cmp r0, #1
	bne _021E6028
	mov r0, #0xf
	str r0, [r5]
	b _021E6028
_021E5FDC:
	ldr r1, _021E6074 ; =0x0000C2FC
	mov r0, #0
	str r0, [r4, r1]
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
	mov r0, #0x12
	str r0, [r5]
	b _021E6028
_021E5FFE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E6028
	ldr r0, _021E6078 ; =0x0000C2F8
	mov r1, #1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov69_021E67B8
	add r0, r4, #0
	bl ov69_021E6F48
	ldr r0, _021E607C ; =0x0000C070
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	str r0, [sp, #0xc]
_021E6028:
	add r0, r4, #0
	bl ov69_021E7408
	ldr r0, [sp, #0xc]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6034: .word 0x0000C010
_021E6038: .word 0x000001D9
_021E603C: .word 0x0000C06C
_021E6040: .word 0x0000C32C
_021E6044: .word 0x0000C304
_021E6048: .word 0x0000C014
_021E604C: .word 0x0000C034
_021E6050: .word 0x0000C324
_021E6054: .word 0x0000C338
_021E6058: .word 0x0000C2E8
_021E605C: .word 0x0000C044
_021E6060: .word gSystem
_021E6064: .word 0x0000C308
_021E6068: .word 0x000005DD
_021E606C: .word 0x00000403
_021E6070: .word 0x000005D9
_021E6074: .word 0x0000C2FC
_021E6078: .word 0x0000C2F8
_021E607C: .word 0x0000C070
	thumb_func_end ov69_021E5A34

	thumb_func_start ov69_021E6080
ov69_021E6080: ; 0x021E6080
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #4
	mov r1, #0
	ldr r5, [r4]
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, _021E60E8 ; =0x0000C2DC
	ldr r0, [r4, r0]
	bl sub_02023120
	ldr r0, _021E60EC ; =0x0000C080
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	bl sub_0201F63C
	ldr r0, _021E60F0 ; =0x0000C010
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl OverlayManager_FreeData
	add r0, r5, #0
	bl DestroyHeap
	ldr r0, _021E60F4 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E60E8: .word 0x0000C2DC
_021E60EC: .word 0x0000C080
_021E60F0: .word 0x0000C010
_021E60F4: .word gSystem + 0x60
	thumb_func_end ov69_021E6080

	thumb_func_start ov69_021E60F8
ov69_021E60F8: ; 0x021E60F8
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6114 ; =ov69_021E77B8
	add r3, sp, #0
	mov r2, #5
_021E6102:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6102
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E6114: .word ov69_021E77B8
	thumb_func_end ov69_021E60F8

	thumb_func_start ov69_021E6118
ov69_021E6118: ; 0x021E6118
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E6134 ; =ov69_021E7688
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E6134: .word ov69_021E7688
	thumb_func_end ov69_021E6118

	thumb_func_start ov69_021E6138
ov69_021E6138: ; 0x021E6138
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	mov r0, #0x62
	ldr r1, [r1]
	bl NARC_ctor
	ldr r1, [sp, #8]
	mov r2, #0
	str r2, [r1, #0xc]
	str r2, [sp]
	add r1, sp, #0x24
	str r1, [sp, #4]
	ldr r3, [sp, #8]
	mov r1, #0x12
	ldr r3, [r3]
	str r0, [sp, #0x1c]
	bl GfGfxLoader_LoadFromOpenNarc_GetSizeOut
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	mov r1, #6
	bl _u32_div_f
	add r7, r0, #0
	ldr r0, [sp, #0x18]
	mov r5, #1
	add r4, r0, #6
	cmp r7, #1
	ble _021E61AA
	ldr r6, [sp, #8]
	add r6, #0xc
_021E617A:
	ldrh r0, [r4]
	cmp r0, #2
	beq _021E61A2
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r2, #2
	mov r3, #4
	add r1, r0, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov69_021E623C
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_021E61A2:
	add r5, r5, #1
	add r4, r4, #6
	cmp r5, r7
	blt _021E617A
_021E61AA:
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	mov r7, #1
	bl LocationGmmDatCountGet
	str r0, [sp, #0x10]
	cmp r0, #1
	ble _021E6232
	ldr r6, [sp, #8]
	add r6, #0xc
_021E61C0:
	add r0, r7, #0
	bl LocationGmmDatGetEarthPlaceDatId
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, sp, #0x20
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	ldr r0, [sp, #0x1c]
	ldr r3, [r3]
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc_GetSizeOut
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r5, #1
	lsr r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	add r4, r0, #4
	ldr r0, [sp, #0xc]
	cmp r0, #1
	ble _021E6224
_021E61F0:
	add r0, r7, #0
	bl LocationGmmDatGetCountryMsgNo
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r2, #0
	mov r3, #2
	add r1, r0, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r1, #0xc]
	bl ov69_021E623C
	ldr r0, [r6]
	add r5, r5, #1
	add r0, r0, #1
	str r0, [r6]
	ldr r0, [sp, #0xc]
	add r4, r4, #4
	cmp r5, r0
	blt _021E61F0
_021E6224:
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	cmp r7, r0
	blt _021E61C0
_021E6232:
	ldr r0, [sp, #0x1c]
	bl NARC_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov69_021E6138

	thumb_func_start ov69_021E623C
ov69_021E623C: ; 0x021E623C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r5, _021E62AC ; =ov69_021E7770
	add r7, r2, #0
	add r6, r3, #0
	add r4, r0, #0
	mov ip, r1
	add r3, sp, #0xc
	mov r2, #4
_021E624E:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E624E
	ldr r0, [r5]
	mov r1, #0x30
	str r0, [r3]
	mov r0, ip
	add r5, r0, #0
	mul r5, r1
	add r0, r4, r5
	strh r7, [r0, #0x10]
	strh r6, [r0, #0x12]
	mov r0, #0
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r1, sp, #0
	str r7, [sp]
	str r6, [sp, #4]
	bl ov69_021E7120
	add r3, r4, r5
	add r6, sp, #0xc
	add r3, #0x14
	mov r2, #4
_021E6280:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6280
	ldr r0, [r6]
	add r2, sp, #0x38
	str r0, [r3]
	ldrh r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	ldr r0, [r4, #4]
	bl sub_0202CA94
	add r2, r4, r5
	strh r0, [r2, #0x38]
	add r0, sp, #0x38
	ldrh r1, [r0, #0x10]
	strh r1, [r2, #0x3a]
	ldrh r0, [r0, #0x14]
	strh r0, [r2, #0x3c]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E62AC: .word ov69_021E7770
	thumb_func_end ov69_021E623C

	thumb_func_start ov69_021E62B0
ov69_021E62B0: ; 0x021E62B0
	push {r4, r5, r6, r7}
	ldr r1, [r0, #0xc]
	mov r4, #0
	cmp r1, #0
	bls _021E62EE
	ldr r1, _021E62F4 ; =0x0000C328
	add r5, r0, #0
	mov r3, #3
	sub r2, r1, #4
_021E62C2:
	ldrh r6, [r5, #0x3a]
	ldr r7, [r0, r2]
	cmp r7, r6
	bne _021E62E4
	ldrh r6, [r5, #0x3c]
	ldr r7, [r0, r1]
	cmp r7, r6
	bne _021E62E4
	strh r3, [r5, #0x38]
	mov r6, #0x10
	ldrsh r7, [r5, r6]
	ldr r6, _021E62F8 ; =0x0000C2C4
	str r7, [r0, r6]
	mov r6, #0x12
	ldrsh r7, [r5, r6]
	ldr r6, _021E62FC ; =0x0000C2C8
	str r7, [r0, r6]
_021E62E4:
	ldr r6, [r0, #0xc]
	add r4, r4, #1
	add r5, #0x30
	cmp r4, r6
	blo _021E62C2
_021E62EE:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_021E62F4: .word 0x0000C328
_021E62F8: .word 0x0000C2C4
_021E62FC: .word 0x0000C2C8
	thumb_func_end ov69_021E62B0

	thumb_func_start ov69_021E6300
ov69_021E6300: ; 0x021E6300
	ldr r3, _021E6304 ; =LocationGmmDatIndexGetByCountryMsgNo
	bx r3
	.balign 4, 0
_021E6304: .word LocationGmmDatIndexGetByCountryMsgNo
	thumb_func_end ov69_021E6300

	thumb_func_start ov69_021E6308
ov69_021E6308: ; 0x021E6308
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, _021E6448 ; =0x0000C308
	mov r3, #0
	ldr r1, _021E644C ; =gSystem + 0x40
	str r3, [r4, r0]
	ldrh r2, [r1, #0x20]
	cmp r2, #0xc0
	blo _021E6332
	mov r0, #1
	lsl r0, r0, #8
	cmp r2, r0
	bhi _021E6332
	ldrh r0, [r1, #0x22]
	cmp r0, #0xa0
	blo _021E6332
	cmp r0, #0xb8
	bhi _021E6332
	mov r3, #2
	b _021E6346
_021E6332:
	cmp r2, #0x40
	bhi _021E6346
	ldr r0, _021E644C ; =gSystem + 0x40
	ldrh r0, [r0, #0x22]
	cmp r0, #0xa0
	blo _021E6346
	cmp r0, #0xb8
	bhi _021E6346
	mov r3, #1
	lsl r3, r3, #0xa
_021E6346:
	ldr r1, _021E644C ; =gSystem + 0x40
	ldrh r0, [r1, #0x24]
	cmp r0, #0
	beq _021E638A
	cmp r3, #0
	beq _021E635A
	ldr r0, _021E6448 ; =0x0000C308
	add sp, #0x18
	str r3, [r4, r0]
	pop {r3, r4, r5, pc}
_021E635A:
	ldr r0, _021E6450 ; =0x0000C30C
	mov r2, #0
	add r5, r0, #0
	str r2, [r4, r0]
	add r5, #0xc
	str r2, [r4, r5]
	add r5, r0, #0
	add r5, #0x10
	str r2, [r4, r5]
	add r5, r0, #0
	add r5, #0x14
	str r2, [r4, r5]
	sub r5, r0, #4
	str r2, [r4, r5]
	ldrh r5, [r1, #0x20]
	add r2, r0, #4
	str r5, [r4, r2]
	ldrh r2, [r1, #0x22]
	add r1, r0, #0
	add r1, #8
	str r2, [r4, r1]
	mov r1, #4
	add r0, #0x14
	str r1, [r4, r0]
_021E638A:
	ldr r0, _021E644C ; =gSystem + 0x40
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _021E6408
	ldr r1, _021E6450 ; =0x0000C30C
	ldr r2, [r4, r1]
	cmp r2, #0
	beq _021E63A2
	cmp r2, #1
	beq _021E63BE
	add sp, #0x18
	pop {r3, r4, r5, pc}
_021E63A2:
	add r0, r1, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E63B2
	add r0, r2, #1
	str r0, [r4, r1]
	b _021E63BE
_021E63B2:
	add r0, r1, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	add r1, #0x14
	sub r0, r0, #1
	str r0, [r4, r1]
_021E63BE:
	cmp r3, #0
	bne _021E6442
	add r0, sp, #0xc
	str r0, [sp]
	add r0, sp, #8
	ldr r1, _021E6454 ; =0x0000C310
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl ov69_021E645C
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	orr r0, r1
	ldr r1, _021E6448 ; =0x0000C308
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [sp, #0x10]
	add r0, #0x10
	str r2, [r4, r0]
	ldr r2, [sp, #8]
	add r0, r1, #0
	add r0, #0x14
	str r2, [r4, r0]
	add r0, r1, #0
	ldr r2, _021E644C ; =gSystem + 0x40
	add r0, #8
	ldrh r3, [r2, #0x20]
	add r1, #0xc
	add sp, #0x18
	str r3, [r4, r0]
	ldrh r0, [r2, #0x22]
	str r0, [r4, r1]
	pop {r3, r4, r5, pc}
_021E6408:
	cmp r3, #0
	bne _021E642C
	ldr r1, _021E6458 ; =0x0000C320
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _021E642C
	add r0, r1, #0
	sub r0, #8
	ldr r0, [r4, r0]
	cmp r0, #4
	bge _021E642C
	sub r0, r1, #4
	ldr r0, [r4, r0]
	cmp r0, #4
	bge _021E642C
	mov r0, #1
	sub r1, #0x18
	str r0, [r4, r1]
_021E642C:
	ldr r1, _021E6450 ; =0x0000C30C
	mov r2, #0
	add r0, r1, #0
	str r2, [r4, r1]
	add r0, #0xc
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x10
	str r2, [r4, r0]
	add r1, #0x14
	str r2, [r4, r1]
_021E6442:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_021E6448: .word 0x0000C308
_021E644C: .word gSystem + 0x40
_021E6450: .word 0x0000C30C
_021E6454: .word 0x0000C310
_021E6458: .word 0x0000C320
	thumb_func_end ov69_021E6308

	thumb_func_start ov69_021E645C
ov69_021E645C: ; 0x021E645C
	push {r3, r4, r5, r6, r7, lr}
	mov lr, r0
	ldr r0, _021E64C4 ; =gSystem + 0x40
	mov ip, r1
	ldrh r5, [r0, #0x20]
	mov r1, #0
	add r7, r2, #0
	add r6, r3, #0
	ldr r0, _021E64C8 ; =0x0000FFFF
	add r2, r1, #0
	add r3, r1, #0
	add r4, r1, #0
	cmp r5, r0
	beq _021E648C
	mov r0, lr
	sub r3, r5, r0
	bpl _021E6486
	sub r0, r1, #1
	eor r3, r0
	mov r1, #0x10
	b _021E648C
_021E6486:
	cmp r3, #0
	ble _021E648C
	mov r1, #0x20
_021E648C:
	str r1, [r7]
	mov r1, #0x3f
	add r0, r3, #0
	and r0, r1
	str r0, [r6]
	ldr r0, _021E64C4 ; =gSystem + 0x40
	ldrh r3, [r0, #0x22]
	ldr r0, _021E64C8 ; =0x0000FFFF
	cmp r3, r0
	beq _021E64B4
	mov r0, ip
	sub r4, r3, r0
	bpl _021E64AE
	sub r1, #0x40
	eor r4, r1
	mov r2, #0x80
	b _021E64B4
_021E64AE:
	cmp r4, #0
	ble _021E64B4
	mov r2, #0x40
_021E64B4:
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r2, [r0]
	mov r0, #0x3f
	and r1, r0
	ldr r0, [sp, #0x1c]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E64C4: .word gSystem + 0x40
_021E64C8: .word 0x0000FFFF
	thumb_func_end ov69_021E645C

	thumb_func_start ov69_021E64CC
ov69_021E64CC: ; 0x021E64CC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, _021E676C ; =0x0000C010
	ldr r2, _021E6770 ; =ov69_021E76B0
	add r5, r1, #0
	ldr r0, [r4, r0]
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, _021E676C ; =0x0000C010
	mov r1, #6
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r0, _021E676C ; =0x0000C010
	ldr r2, _021E6774 ; =ov69_021E76CC
	ldr r0, [r4, r0]
	mov r1, #7
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E676C ; =0x0000C010
	str r0, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r5, #0
	mov r1, #5
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x80
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #6
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #7
	str r0, [sp, #0xc]
	ldr r2, _021E676C ; =0x0000C010
	add r0, r5, #0
	ldr r2, [r4, r2]
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r4, #8]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #6
	str r0, [sp, #4]
	ldr r0, _021E676C ; =0x0000C010
	ldr r2, _021E6778 ; =0x000001E2
	ldr r0, [r4, r0]
	add r3, r1, #0
	bl LoadUserFrameGfx2
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, _021E677C ; =0x000001D9
	str r0, [sp, #4]
	ldr r0, _021E676C ; =0x0000C010
	mov r1, #6
	ldr r0, [r4, r0]
	mov r3, #7
	bl LoadUserFrameGfx1
	ldr r2, [r4]
	mov r0, #4
	mov r1, #0x80
	bl LoadFontPal0
	ldr r3, [r4]
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r1, _021E6780 ; =0x00004753
	mov r0, #6
	bl BG_SetMaskColor
	ldr r1, _021E676C ; =0x0000C010
	ldr r2, _021E6784 ; =ov69_021E766C
	ldr r0, [r4, r1]
	add r1, r1, #4
	add r1, r4, r1
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E6788 ; =0x0000C014
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E6788 ; =0x0000C014
	ldr r2, _021E6778 ; =0x000001E2
	add r0, r4, r0
	mov r1, #0
	mov r3, #6
	bl DrawFrameAndWindow2
	ldr r0, _021E678C ; =0x0000C074
	mov r3, #0
	str r3, [r4, r0]
	sub r0, #0x64
	ldr r0, [r4, r0]
	ldr r2, _021E6770 ; =ov69_021E76B0
	mov r1, #2
	bl InitBgFromTemplate
	ldr r0, _021E676C ; =0x0000C010
	mov r1, #2
	ldr r0, [r4, r0]
	bl BgClearTilemapBufferAndCommit
	ldr r0, _021E676C ; =0x0000C010
	ldr r2, _021E6774 ; =ov69_021E76CC
	ldr r0, [r4, r0]
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E676C ; =0x0000C010
	str r0, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r5, #0
	mov r1, #5
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x80
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #6
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E676C ; =0x0000C010
	str r0, [sp, #0xc]
	ldr r2, [r4, r2]
	add r0, r5, #0
	mov r1, #7
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, _021E677C ; =0x000001D9
	str r0, [sp, #4]
	ldr r0, _021E676C ; =0x0000C010
	mov r1, #2
	ldr r0, [r4, r0]
	mov r3, #7
	bl LoadUserFrameGfx1
	ldr r2, [r4]
	mov r0, #0
	mov r1, #0x80
	bl LoadFontPal0
	mov r1, #0x1e
	ldr r2, [r4]
	mov r0, #0
	lsl r1, r1, #4
	bl LoadFontPal0
	ldr r3, [r4]
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	mov r0, #2
	mov r1, #0
	bl BG_SetMaskColor
	ldr r1, [r4]
	mov r0, #0x10
	bl String_ctor
	add r5, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl FontID_Alloc
	ldr r2, _021E6790 ; =0x00007FFF
	add r0, sp, #0x10
	ldr r1, _021E6794 ; =0x00001CE7
	strh r2, [r0, #6]
	strh r1, [r0, #4]
	ldr r1, _021E6798 ; =0x00004E72
	ldr r3, _021E6778 ; =0x000001E2
	strh r1, [r0, #2]
	strh r2, [r0]
	mov r0, #2
	add r1, sp, #0x14
	add r1, #2
	add r2, r0, #0
	bl BG_LoadPlttData
	mov r0, #2
	mov r3, #0x79
	add r1, sp, #0x14
	add r2, r0, #0
	lsl r3, r3, #2
	bl BG_LoadPlttData
	mov r0, #2
	add r1, sp, #0x10
	ldr r3, _021E679C ; =0x000001E6
	add r1, #2
	add r2, r0, #0
	bl BG_LoadPlttData
	mov r0, #2
	ldr r3, _021E67A0 ; =0x000001FE
	add r1, sp, #0x10
	add r2, r0, #0
	bl BG_LoadPlttData
	ldr r1, _021E676C ; =0x0000C010
	ldr r2, _021E67A4 ; =ov69_021E765C
	ldr r0, [r4, r1]
	add r1, #0x24
	add r1, r4, r1
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E67A8 ; =0x0000C034
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E67AC ; =0x0000C070
	mov r1, #0x10
	ldr r0, [r4, r0]
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E67A8 ; =0x0000C034
	mov r1, #4
	add r0, r4, r0
	add r2, r5, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	ldr r1, _021E676C ; =0x0000C010
	ldr r2, _021E67B0 ; =ov69_021E7654
	ldr r0, [r4, r1]
	add r1, #0x34
	add r1, r4, r1
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _021E67B4 ; =0x0000C044
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E67AC ; =0x0000C070
	mov r1, #0xd
	ldr r0, [r4, r0]
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E67B4 ; =0x0000C044
	mov r1, #4
	add r0, r4, r0
	add r2, r5, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r5, #0
	bl String_dtor
	mov r0, #4
	bl FontID_Release
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E676C: .word 0x0000C010
_021E6770: .word ov69_021E76B0
_021E6774: .word ov69_021E76CC
_021E6778: .word 0x000001E2
_021E677C: .word 0x000001D9
_021E6780: .word 0x00004753
_021E6784: .word ov69_021E766C
_021E6788: .word 0x0000C014
_021E678C: .word 0x0000C074
_021E6790: .word 0x00007FFF
_021E6794: .word 0x00001CE7
_021E6798: .word 0x00004E72
_021E679C: .word 0x000001E6
_021E67A0: .word 0x000001FE
_021E67A4: .word ov69_021E765C
_021E67A8: .word 0x0000C034
_021E67AC: .word 0x0000C070
_021E67B0: .word ov69_021E7654
_021E67B4: .word 0x0000C044
	thumb_func_end ov69_021E64CC

	thumb_func_start ov69_021E67B8
ov69_021E67B8: ; 0x021E67B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6800 ; =0x0000C034
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E6804 ; =0x0000C044
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E6808 ; =0x0000C014
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E680C ; =0x0000C010
	mov r1, #2
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E680C ; =0x0000C010
	mov r1, #6
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E680C ; =0x0000C010
	mov r1, #3
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	ldr r0, _021E680C ; =0x0000C010
	mov r1, #7
	ldr r0, [r4, r0]
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	nop
_021E6800: .word 0x0000C034
_021E6804: .word 0x0000C044
_021E6808: .word 0x0000C014
_021E680C: .word 0x0000C010
	thumb_func_end ov69_021E67B8

	thumb_func_start ov69_021E6810
ov69_021E6810: ; 0x021E6810
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _021E68C4 ; =0x0000C074
	add r6, r1, #0
	ldr r1, [r5, r0]
	mov r4, #0
	cmp r1, #0
	beq _021E682C
	cmp r1, #1
	beq _021E6886
	cmp r1, #2
	beq _021E68A6
	b _021E68BC
_021E682C:
	mov r1, #0xd8
	str r1, [sp]
	mov r1, #0x20
	sub r0, #0x60
	str r1, [sp, #4]
	add r0, r5, r0
	mov r1, #0xf
	add r2, r4, #0
	add r3, r4, #0
	bl FillWindowPixelRect
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	ldr r2, _021E68C8 ; =0x0000C07C
	add r1, r6, #0
	str r0, [r5, r2]
	add r0, r2, #0
	sub r0, #0xc
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	ldr r0, [r5, #8]
	bl Options_GetTextFrameDelay
	add r3, r4, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, _021E68CC ; =0x0000C014
	str r3, [sp, #8]
	add r0, r5, r2
	add r2, #0x68
	ldr r2, [r5, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _021E68D0 ; =0x0000C078
	mov r2, #1
	str r0, [r5, r1]
	sub r0, r1, #4
	str r2, [r5, r0]
	b _021E68BC
_021E6886:
	add r0, r0, #4
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E68BC
	ldr r0, _021E68C8 ; =0x0000C07C
	ldr r0, [r5, r0]
	bl String_dtor
	ldr r0, _021E68C4 ; =0x0000C074
	mov r1, #2
	str r1, [r5, r0]
	b _021E68BC
_021E68A6:
	cmp r2, #0
	bne _021E68B4
	ldr r0, _021E68D4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021E68BC
_021E68B4:
	ldr r0, _021E68C4 ; =0x0000C074
	mov r1, #0
	str r1, [r5, r0]
	mov r4, #1
_021E68BC:
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E68C4: .word 0x0000C074
_021E68C8: .word 0x0000C07C
_021E68CC: .word 0x0000C014
_021E68D0: .word 0x0000C078
_021E68D4: .word gSystem
	thumb_func_end ov69_021E6810

	thumb_func_start ov69_021E68D8
ov69_021E68D8: ; 0x021E68D8
	push {r3, lr}
	cmp r2, #0
	bne _021E68E4
	ldr r0, _021E68E8 ; =0x000005DC
	bl PlaySE
_021E68E4:
	pop {r3, pc}
	nop
_021E68E8: .word 0x000005DC
	thumb_func_end ov69_021E68D8

	thumb_func_start ov69_021E68EC
ov69_021E68EC: ; 0x021E68EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, _021E697C ; =0x0000C010
	add r6, r3, #0
	ldr r0, [r5, r0]
	str r1, [sp]
	bl AddWindow
	ldrh r0, [r6, #0x10]
	ldr r1, [r5]
	bl ListMenuItems_ctor
	ldr r1, _021E6980 ; =0x0000C068
	mov r7, #0
	str r0, [r5, r1]
	ldrh r0, [r6, #0x10]
	cmp r0, #0
	ble _021E692E
	ldr r4, [sp, #0x38]
_021E6914:
	ldr r0, _021E6980 ; =0x0000C068
	ldr r1, _021E6984 ; =0x0000C070
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl ListMenuItems_AppendFromMsgData
	ldrh r0, [r6, #0x10]
	add r7, r7, #1
	add r4, #8
	cmp r7, r0
	blt _021E6914
_021E692E:
	add r3, sp, #4
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, _021E6980 ; =0x0000C068
	mov r1, #0
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [sp]
	str r0, [sp, #0x10]
	ldr r0, _021E6988 ; =ov69_021E68D8
	str r0, [sp, #8]
	ldr r3, [r5]
	add r0, r2, #0
	lsl r3, r3, #0x18
	add r2, r1, #0
	lsr r3, r3, #0x18
	bl ListMenuInit
	ldr r1, _021E698C ; =0x0000C064
	ldr r2, _021E6990 ; =0x000001D9
	str r0, [r5, r1]
	ldr r0, [sp, #0x10]
	mov r1, #1
	mov r3, #7
	bl DrawFrameAndWindow1
	ldr r0, [sp]
	bl CopyWindowToVram
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_021E697C: .word 0x0000C010
_021E6980: .word 0x0000C068
_021E6984: .word 0x0000C070
_021E6988: .word ov69_021E68D8
_021E698C: .word 0x0000C064
_021E6990: .word 0x000001D9
	thumb_func_end ov69_021E68EC

	thumb_func_start ov69_021E6994
ov69_021E6994: ; 0x021E6994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, _021E6A40 ; =0x0000C010
	str r1, [sp]
	ldr r0, [r5, r0]
	str r3, [sp, #4]
	ldr r7, [sp, #0x44]
	ldr r6, [sp, #0x48]
	bl AddWindow
	ldr r2, [sp, #0x40]
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [sp, #8]
	ldr r1, [r5]
	add r0, r6, #0
	bl ListMenuItems_ctor
	ldr r1, _021E6A44 ; =0x0000C068
	mov r4, #0
	str r0, [r5, r1]
	cmp r6, #0
	bls _021E69DE
_021E69CA:
	ldr r0, _021E6A44 ; =0x0000C068
	ldrb r2, [r7, r4]
	ldr r0, [r5, r0]
	ldr r1, [sp, #8]
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	cmp r4, r6
	blo _021E69CA
_021E69DE:
	ldr r0, [sp, #8]
	bl DestroyMsgData
	ldr r4, [sp, #4]
	add r3, sp, #0xc
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	str r4, [sp, #4]
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	str r4, [sp, #4]
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	str r4, [sp, #4]
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, _021E6A44 ; =0x0000C068
	mov r1, #0
	ldr r0, [r5, r0]
	str r4, [sp, #4]
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	strh r6, [r0, #0x10]
	ldr r0, [sp]
	str r0, [sp, #0x18]
	ldr r0, _021E6A48 ; =ov69_021E68D8
	str r0, [sp, #0x10]
	ldr r3, [r5]
	add r0, r2, #0
	lsl r3, r3, #0x18
	add r2, r1, #0
	lsr r3, r3, #0x18
	bl ListMenuInit
	ldr r1, _021E6A4C ; =0x0000C064
	ldr r2, _021E6A50 ; =0x000001D9
	str r0, [r5, r1]
	ldr r0, [sp, #0x18]
	mov r1, #1
	mov r3, #7
	bl DrawFrameAndWindow1
	ldr r0, [sp]
	bl CopyWindowToVram
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6A40: .word 0x0000C010
_021E6A44: .word 0x0000C068
_021E6A48: .word ov69_021E68D8
_021E6A4C: .word 0x0000C064
_021E6A50: .word 0x000001D9
	thumb_func_end ov69_021E6994

	thumb_func_start ov69_021E6A54
ov69_021E6A54: ; 0x021E6A54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6A80 ; =0x0000C024
	mov r1, #0
	add r0, r4, r0
	bl sub_0200E5D4
	ldr r0, _021E6A80 ; =0x0000C024
	add r0, r4, r0
	bl RemoveWindow
	ldr r0, _021E6A84 ; =0x0000C064
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl DestroyListMenu
	ldr r0, _021E6A88 ; =0x0000C068
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	pop {r4, pc}
	.balign 4, 0
_021E6A80: .word 0x0000C024
_021E6A84: .word 0x0000C064
_021E6A88: .word 0x0000C068
	thumb_func_end ov69_021E6A54

	thumb_func_start ov69_021E6A8C
ov69_021E6A8C: ; 0x021E6A8C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	add r4, r0, #0
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	ldr r1, _021E6B40 ; =0x0000C010
	add r6, r0, #0
	ldr r0, [r5, r1]
	add r1, #0x44
	ldr r2, _021E6B44 ; =ov69_021E764C
	add r1, r5, r1
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6B48 ; =0x0000C054
	mov r2, #0
	add r0, r5, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E6B48 ; =0x0000C054
	ldr r2, _021E6B4C ; =0x000001D9
	add r0, r5, r0
	mov r1, #0
	mov r3, #7
	bl DrawFrameAndWindow1
	ldr r0, _021E6B50 ; =0x0000C080
	ldr r2, _021E6B54 ; =0x0000C324
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #0
	bl BufferCountryName
	ldr r3, _021E6B54 ; =0x0000C324
	ldr r0, _021E6B50 ; =0x0000C080
	ldr r2, [r5, r3]
	add r3, r3, #4
	ldr r0, [r5, r0]
	ldr r3, [r5, r3]
	mov r1, #1
	bl BufferCityName
	ldr r0, _021E6B58 ; =0x0000C070
	mov r1, #0xe
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, _021E6B50 ; =0x0000C080
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl StringExpandPlaceholders
	mov r1, #0
	ldr r0, _021E6B48 ; =0x0000C054
	str r1, [sp]
	str r1, [sp, #4]
	add r0, r5, r0
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	ldr r0, _021E6B48 ; =0x0000C054
	add r0, r5, r0
	bl CopyWindowToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E6B40: .word 0x0000C010
_021E6B44: .word ov69_021E764C
_021E6B48: .word 0x0000C054
_021E6B4C: .word 0x000001D9
_021E6B50: .word 0x0000C080
_021E6B54: .word 0x0000C324
_021E6B58: .word 0x0000C070
	thumb_func_end ov69_021E6A8C

	thumb_func_start ov69_021E6B5C
ov69_021E6B5C: ; 0x021E6B5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	str r1, [sp, #0xc]
	ldr r1, [r5]
	mov r0, #0x40
	add r4, r2, #0
	bl String_ctor
	add r7, r0, #0
	ldr r1, [r5]
	mov r0, #0x40
	bl String_ctor
	ldr r1, _021E6C04 ; =0x0000C010
	add r6, r0, #0
	ldr r0, [r5, r1]
	add r1, #0x44
	ldr r2, _021E6C08 ; =ov69_021E764C
	add r1, r5, r1
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6C0C ; =0x0000C054
	mov r2, #0
	add r0, r5, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E6C0C ; =0x0000C054
	ldr r2, _021E6C10 ; =0x000001D9
	add r0, r5, r0
	mov r1, #0
	mov r3, #7
	bl DrawFrameAndWindow1
	ldr r0, [r5]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r2, r7, #0
	add r3, r6, #0
	bl ov69_021E7520
	cmp r4, #0
	beq _021E6BD8
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, _021E6C0C ; =0x0000C054
	add r2, r6, #0
	add r0, r5, r0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
_021E6BD8:
	mov r1, #0
	ldr r0, _021E6C0C ; =0x0000C054
	str r1, [sp]
	str r1, [sp, #4]
	add r0, r5, r0
	add r2, r7, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, _021E6C0C ; =0x0000C054
	add r0, r5, r0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6C04: .word 0x0000C010
_021E6C08: .word ov69_021E764C
_021E6C0C: .word 0x0000C054
_021E6C10: .word 0x000001D9
	thumb_func_end ov69_021E6B5C

	thumb_func_start ov69_021E6C14
ov69_021E6C14: ; 0x021E6C14
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6C2C ; =0x0000C054
	mov r1, #0
	add r0, r4, r0
	bl sub_0200E5D4
	ldr r0, _021E6C2C ; =0x0000C054
	add r0, r4, r0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
_021E6C2C: .word 0x0000C054
	thumb_func_end ov69_021E6C14

	thumb_func_start ov69_021E6C30
ov69_021E6C30: ; 0x021E6C30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, _021E6D54 ; =0x0000C2C4
	str r1, [sp]
	ldr r1, [r6, r0]
	mov r7, #1
	add r2, r1, #0
	sub r2, #0x80
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	str r2, [sp, #0x1c]
	add r2, r1, #0
	add r2, #0x80
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	str r2, [sp, #0x18]
	add r2, r0, #4
	ldr r3, [r6, r2]
	add r0, r0, #4
	add r2, r3, #0
	sub r2, #0x80
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add r3, #0x80
	str r2, [sp, #0x14]
	lsl r2, r3, #0x10
	asr r2, r2, #0x10
	str r2, [sp, #0x10]
	ldr r2, [r6, #0xc]
	lsl r7, r7, #8
	str r1, [sp, #0x2c]
	ldr r0, [r6, r0]
	str r2, [sp, #4]
	str r0, [sp, #0x30]
	add r0, sp, #0x2c
	bl ov69_021E75A0
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	bpl _021E6C8A
	neg r0, r0
_021E6C8A:
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	ble _021E6CCE
	ldr r0, _021E6D58 ; =0x0000C2C8
	ldr r0, [r6, r0]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	cmp r0, #0
	ble _021E6CAC
	lsl r1, r1, #8
	sub r0, r0, r1
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	b _021E6CB4
_021E6CAC:
	lsl r1, r1, #8
	add r0, r0, r1
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
_021E6CB4:
	ldr r0, [sp, #0xc]
	sub r0, #0x80
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, #0x80
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	sub r0, #0x80
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x80
	str r0, [sp, #0x10]
	b _021E6CD6
_021E6CCE:
	ldr r0, [sp, #0x14]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	str r0, [sp, #8]
_021E6CD6:
	ldr r0, [r6, #0xc]
	mov r4, #0
	cmp r0, #0
	bls _021E6D3A
	add r5, r6, #0
_021E6CE0:
	mov r0, #0x10
	ldrsh r0, [r5, r0]
	ldr r1, [sp, #0x1c]
	cmp r0, r1
	ble _021E6D30
	ldr r1, [sp, #0x18]
	cmp r0, r1
	bge _021E6D30
	mov r1, #0x12
	ldrsh r1, [r5, r1]
	ldr r2, [sp, #0x14]
	cmp r1, r2
	ble _021E6D00
	ldr r2, [sp, #0x10]
	cmp r1, r2
	blt _021E6D0C
_021E6D00:
	ldr r2, [sp, #0xc]
	cmp r1, r2
	ble _021E6D30
	ldr r2, [sp, #8]
	cmp r1, r2
	bge _021E6D30
_021E6D0C:
	ldrh r1, [r5, #0x38]
	cmp r1, #0
	beq _021E6D30
	str r0, [sp, #0x24]
	mov r0, #0x12
	ldrsh r0, [r5, r0]
	str r0, [sp, #0x28]
	add r0, sp, #0x24
	bl ov69_021E75A0
	add r0, sp, #0x2c
	add r1, sp, #0x24
	bl ov69_021E75F8
	cmp r0, r7
	bhs _021E6D30
	add r7, r0, #0
	str r4, [sp, #4]
_021E6D30:
	ldr r0, [r6, #0xc]
	add r4, r4, #1
	add r5, #0x30
	cmp r4, r0
	blo _021E6CE0
_021E6D3A:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	str r1, [r0]
	ldr r1, [r6, #0xc]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _021E6D4C
	mov r0, #1
	str r0, [sp, #0x20]
_021E6D4C:
	ldr r0, [sp, #0x20]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E6D54: .word 0x0000C2C4
_021E6D58: .word 0x0000C2C8
	thumb_func_end ov69_021E6C30

	thumb_func_start ov69_021E6D5C
ov69_021E6D5C: ; 0x021E6D5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021E6E78 ; =0x0000C338
	add r5, r0, #0
	ldr r1, [r5, r1]
	cmp r1, #0
	bne _021E6DB6
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	add r4, r0, #0
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6E7C ; =0x0000C014
	mov r2, #0
	add r0, r5, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _021E6E80 ; =0x0000C070
	mov r1, #0xf
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	ldr r0, _021E6E7C ; =0x0000C014
	str r3, [sp]
	str r3, [sp, #4]
	add r0, r5, r0
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E6DB6:
	add r1, sp, #0xc
	bl ov69_021E6C30
	cmp r0, #0
	beq _021E6E6E
	ldr r1, [r5]
	mov r0, #0x40
	bl String_ctor
	add r6, r0, #0
	ldr r1, [r5]
	mov r0, #0x40
	bl String_ctor
	add r4, r0, #0
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	ldr r0, _021E6E7C ; =0x0000C014
	mov r2, #0
	add r0, r5, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r1, [sp, #0xc]
	mov r0, #0x30
	add r2, r1, #0
	mul r2, r0
	ldr r0, [r5]
	add r1, r5, r2
	str r0, [sp]
	ldrh r0, [r1, #0x3a]
	ldrh r1, [r1, #0x3c]
	add r2, r6, #0
	add r3, r4, #0
	bl ov69_021E7520
	ldr r1, [sp, #0xc]
	mov r0, #0x30
	mul r0, r1
	add r0, r5, r0
	ldrh r0, [r0, #0x3c]
	cmp r0, #0
	beq _021E6E2A
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E7C ; =0x0000C014
	mov r3, #0
	add r0, r5, r0
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
_021E6E2A:
	mov r3, #0
	ldr r0, _021E6E7C ; =0x0000C014
	str r3, [sp]
	str r3, [sp, #4]
	add r0, r5, r0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0xc]
	mov r1, #0x30
	add r2, r0, #0
	mul r2, r1
	add r2, r5, r2
	mov r0, #0x10
	ldrsh r2, [r2, r0]
	ldr r0, _021E6E84 ; =0x0000C2C4
	str r2, [r5, r0]
	ldr r2, [sp, #0xc]
	add r0, r0, #4
	mul r1, r2
	add r2, r5, r1
	mov r1, #0x12
	ldrsh r1, [r2, r1]
	add sp, #0x10
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
_021E6E6E:
	ldr r0, _021E6E78 ; =0x0000C338
	mov r1, #0
	str r1, [r5, r0]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6E78: .word 0x0000C338
_021E6E7C: .word 0x0000C014
_021E6E80: .word 0x0000C070
_021E6E84: .word 0x0000C2C4
	thumb_func_end ov69_021E6D5C

	thumb_func_start ov69_021E6E88
ov69_021E6E88: ; 0x021E6E88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0
	bl NARC_AllocAndReadWholeMember
	ldr r2, _021E6F2C ; =0x0000C0DC
	str r0, [r5, r2]
	add r0, r2, #0
	sub r1, r2, #4
	sub r0, #0x58
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, r2
	bl sub_0201F51C
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #1
	bl NARC_AllocAndReadWholeMember
	ldr r2, _021E6F30 ; =0x0000C2A4
	str r0, [r5, r2]
	add r0, r2, #0
	add r1, r2, #0
	sub r0, #0xc8
	sub r1, #0x14
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, r2
	bl sub_0201F51C
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #2
	bl NARC_AllocAndReadWholeMember
	ldr r2, _021E6F34 ; =0x0000C2A8
	str r0, [r5, r2]
	add r0, r2, #0
	add r1, r2, #0
	sub r0, #0x78
	sub r1, #0x14
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, r2
	bl sub_0201F51C
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #3
	bl NARC_AllocAndReadWholeMember
	ldr r2, _021E6F38 ; =0x0000C29C
	str r0, [r5, r2]
	add r1, r2, #0
	ldr r0, _021E6F3C ; =0x0000C134
	sub r1, #0x14
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, r2
	bl sub_0201F51C
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #4
	bl NARC_AllocAndReadWholeMember
	ldr r2, _021E6F40 ; =0x0000C2A0
	str r0, [r5, r2]
	add r1, r2, #0
	ldr r0, _021E6F44 ; =0x0000C188
	sub r1, #0x14
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, r2
	bl sub_0201F51C
	pop {r3, r4, r5, pc}
	nop
_021E6F2C: .word 0x0000C0DC
_021E6F30: .word 0x0000C2A4
_021E6F34: .word 0x0000C2A8
_021E6F38: .word 0x0000C29C
_021E6F3C: .word 0x0000C134
_021E6F40: .word 0x0000C2A0
_021E6F44: .word 0x0000C188
	thumb_func_end ov69_021E6E88

	thumb_func_start ov69_021E6F48
ov69_021E6F48: ; 0x021E6F48
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6F78 ; =0x0000C2A0
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E6F7C ; =0x0000C29C
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E6F80 ; =0x0000C2A8
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E6F84 ; =0x0000C2A4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _021E6F88 ; =0x0000C0DC
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	nop
_021E6F78: .word 0x0000C2A0
_021E6F7C: .word 0x0000C29C
_021E6F80: .word 0x0000C2A8
_021E6F84: .word 0x0000C2A4
_021E6F88: .word 0x0000C0DC
	thumb_func_end ov69_021E6F48

	thumb_func_start ov69_021E6F8C
ov69_021E6F8C: ; 0x021E6F8C
	push {r4, r5}
	ldr r1, _021E6FE4 ; =0x0000C2AC
	mov r3, #0
	str r3, [r0, r1]
	add r2, r1, #4
	str r3, [r0, r2]
	add r2, r1, #0
	add r2, #8
	str r3, [r0, r2]
	mov r2, #1
	add r4, r1, #0
	lsl r2, r2, #0xc
	add r4, #0xc
	str r2, [r0, r4]
	add r4, r1, #0
	add r4, #0x10
	str r2, [r0, r4]
	add r4, r1, #0
	add r4, #0x14
	str r2, [r0, r4]
	mov r5, #0x69
	add r4, r1, #0
	lsl r5, r5, #6
	add r4, #0x18
	str r5, [r0, r4]
	mov r5, #0x1f
	add r4, r1, #0
	lsl r5, r5, #0xa
	add r4, #0x1c
	str r5, [r0, r4]
	add r4, r1, #0
	add r4, #0x20
	str r3, [r0, r4]
	add r3, r1, #0
	add r3, #0x24
	str r2, [r0, r3]
	add r3, r1, #0
	add r3, #0x28
	str r2, [r0, r3]
	add r1, #0x2c
	str r2, [r0, r1]
	pop {r4, r5}
	bx lr
	nop
_021E6FE4: .word 0x0000C2AC
	thumb_func_end ov69_021E6F8C

	thumb_func_start ov69_021E6FE8
ov69_021E6FE8: ; 0x021E6FE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r6, _021E705C ; =ov69_021E767C
	add r4, r0, #0
	ldmia r6!, {r0, r1}
	add r5, sp, #8
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r5]
	add r7, sp, #0x14
	mov r3, #0
	str r3, [r7]
	str r3, [r7, #4]
	str r3, [r7, #8]
	ldr r0, _021E7060 ; =0x0000C2DC
	str r3, [sp]
	ldr r0, [r4, r0]
	ldr r2, _021E7064 ; =0x000005C1
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_02023308
	ldr r2, _021E7060 ; =0x0000C2DC
	mov r1, #0x19
	ldr r2, [r4, r2]
	mov r0, #0
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	ldr r1, _021E7060 ; =0x0000C2DC
	mov r0, #0
	ldr r1, [r4, r1]
	bl sub_020233D8
	ldr r0, _021E7060 ; =0x0000C2DC
	ldr r0, [r4, r0]
	bl GF_Camera_RegisterToStaticPtr
	ldr r0, _021E7068 ; =0x0000C304
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7048
	mov r1, #1
	sub r0, #0x1c
	strh r1, [r4, r0]
	b _021E704E
_021E7048:
	mov r1, #0
	sub r0, #0x1c
	strh r1, [r4, r0]
_021E704E:
	add r0, r4, #0
	bl ov69_021E737C
	cmp r0, #1
	bne _021E704E
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E705C: .word ov69_021E767C
_021E7060: .word 0x0000C2DC
_021E7064: .word 0x000005C1
_021E7068: .word 0x0000C304
	thumb_func_end ov69_021E6FE8

	thumb_func_start ov69_021E706C
ov69_021E706C: ; 0x021E706C
	push {r4, lr}
	ldr r3, _021E70A0 ; =0x0000C2EC
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, r3]
	add r1, r3, #4
	str r0, [r4, r1]
	add r1, r3, #0
	ldr r2, _021E70A4 ; =0xFFFFF001
	add r1, #8
	str r2, [r4, r1]
	ldr r1, [r4, r3]
	add r2, r3, #4
	add r3, #8
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl NNS_G3dGlbLightVector
	pop {r4, pc}
	nop
_021E70A0: .word 0x0000C2EC
_021E70A4: .word 0xFFFFF001
	thumb_func_end ov69_021E706C

	thumb_func_start ov69_021E70A8
ov69_021E70A8: ; 0x021E70A8
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, [r4, #4]
	ldr r3, _021E711C ; =FX_SinCosTable_
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	asr r1, r1, #4
	lsl r2, r1, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r5, r0, #0
	bl MTX_RotY33_
	ldr r0, [r4]
	ldr r3, _021E711C ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotX33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	ldr r3, _021E711C ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021E711C: .word FX_SinCosTable_
	thumb_func_end ov69_021E70A8

	thumb_func_start ov69_021E7120
ov69_021E7120: ; 0x021E7120
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r1, [r4]
	ldr r3, _021E7194 ; =FX_SinCosTable_
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	asr r1, r1, #4
	lsl r2, r1, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r5, r0, #0
	bl MTX_RotY33_
	ldr r0, [r4, #4]
	ldr r3, _021E7194 ; =FX_SinCosTable_
	neg r0, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r1, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotX33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	ldr r0, [r4, #8]
	ldr r3, _021E7194 ; =FX_SinCosTable_
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	add r1, r2, #1
	lsl r1, r1, #1
	lsl r2, r2, #1
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, sp, #0
	bl MTX_RotZ33_
	add r0, r5, #0
	add r1, sp, #0
	add r2, r5, #0
	bl MTX_Concat33
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_021E7194: .word FX_SinCosTable_
	thumb_func_end ov69_021E7120

	thumb_func_start ov69_021E7198
ov69_021E7198: ; 0x021E7198
	push {r3, r4, r5, r6, r7, lr}
	add r3, r0, #0
	ldr r0, _021E735C ; =0x0000C2C4
	add r7, r2, #0
	add r4, r0, #4
	ldr r4, [r3, r4]
	ldr r2, [r3, r0]
	lsl r4, r4, #0x10
	asr r4, r4, #0x10
	lsl r2, r2, #0x10
	mov lr, r4
	mov r4, #1
	mov r6, #0
	asr r2, r2, #0x10
	tst r1, r4
	bne _021E71C4
	add r1, r0, #0
	add r1, #0x44
	ldr r1, [r3, r1]
	mov ip, r1
	tst r1, r4
	beq _021E71E8
_021E71C4:
	ldr r1, _021E7360 ; =0x0000C304
	ldrh r0, [r3, r1]
	cmp r0, #1
	bne _021E71E4
	add r0, r1, #0
	sub r0, #0x1c
	ldrh r0, [r3, r0]
	cmp r0, #0
	bne _021E71DE
	mov r0, #1
	sub r1, #0x1c
	strh r0, [r3, r1]
	b _021E71E4
_021E71DE:
	mov r0, #0
	sub r1, #0x1c
	strh r0, [r3, r1]
_021E71E4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E71E8:
	add r1, r0, #0
	add r1, #0x24
	ldrh r1, [r3, r1]
	cmp r1, #0
	bne _021E7220
	add r1, r0, #0
	add r1, #0x54
	ldr r1, [r3, r1]
	cmp r1, #0
	bne _021E7204
	add r0, #0x58
	ldr r0, [r3, r0]
	cmp r0, #0
	beq _021E721A
_021E7204:
	add r0, r1, #0
	ldr r1, _021E7364 ; =0x0000C31C
	mov r4, #0x55
	ldr r1, [r3, r1]
	mul r0, r4
	mul r4, r1
	lsl r0, r0, #0x10
	lsl r1, r4, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	b _021E724C
_021E721A:
	lsl r0, r4, #9
	add r1, r0, #0
	b _021E724C
_021E7220:
	add r1, r0, #0
	add r1, #0x54
	ldr r1, [r3, r1]
	cmp r1, #0
	bne _021E7232
	add r0, #0x58
	ldr r0, [r3, r0]
	cmp r0, #0
	beq _021E7248
_021E7232:
	add r0, r1, #0
	ldr r1, _021E7364 ; =0x0000C31C
	mov r4, #0xa
	ldr r1, [r3, r1]
	mul r0, r4
	mul r4, r1
	lsl r0, r0, #0x10
	lsl r1, r4, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	b _021E724C
_021E7248:
	mov r0, #0x20
	add r1, r0, #0
_021E724C:
	mov r4, #0x20
	tst r4, r7
	bne _021E725A
	mov r5, ip
	mov r4, #0x20
	tst r4, r5
	beq _021E7286
_021E725A:
	ldr r6, _021E7360 ; =0x0000C304
	ldrh r4, [r3, r6]
	cmp r4, #1
	bne _021E7270
	add r4, r6, #0
	sub r4, #0x3c
	ldr r4, [r3, r4]
	sub r6, #0x3c
	add r4, r4, r0
	str r4, [r3, r6]
	b _021E7284
_021E7270:
	ldr r5, _021E7368 ; =0xFFFFD820
	mov r4, lr
	cmp r4, r5
	bge _021E7284
	add r4, r6, #0
	sub r4, #0x3c
	ldr r4, [r3, r4]
	sub r6, #0x3c
	add r4, r4, r0
	str r4, [r3, r6]
_021E7284:
	mov r6, #1
_021E7286:
	mov r4, #0x10
	tst r4, r7
	bne _021E7296
	ldr r4, _021E736C ; =0x0000C308
	ldr r5, [r3, r4]
	mov r4, #0x10
	tst r4, r5
	beq _021E72C2
_021E7296:
	ldr r5, _021E7360 ; =0x0000C304
	ldrh r4, [r3, r5]
	cmp r4, #1
	bne _021E72AC
	add r4, r5, #0
	sub r4, #0x3c
	ldr r4, [r3, r4]
	sub r5, #0x3c
	sub r0, r4, r0
	str r0, [r3, r5]
	b _021E72C0
_021E72AC:
	ldr r4, _021E7370 ; =0xFFFFCC80
	mov r6, lr
	cmp r6, r4
	ble _021E72C0
	add r4, r5, #0
	sub r4, #0x3c
	ldr r4, [r3, r4]
	sub r5, #0x3c
	sub r0, r4, r0
	str r0, [r3, r5]
_021E72C0:
	mov r6, #1
_021E72C2:
	mov r4, #0x40
	add r0, r7, #0
	tst r0, r4
	bne _021E72D2
	ldr r0, _021E736C ; =0x0000C308
	ldr r0, [r3, r0]
	tst r0, r4
	beq _021E730C
_021E72D2:
	ldr r4, _021E7360 ; =0x0000C304
	ldrh r0, [r3, r4]
	cmp r0, #1
	bne _021E72F8
	mov r0, #0x3e
	add r5, r2, r1
	lsl r0, r0, #8
	cmp r5, r0
	bge _021E72F2
	add r0, r4, #0
	sub r0, #0x40
	ldr r0, [r3, r0]
	sub r4, #0x40
	add r0, r0, r1
	str r0, [r3, r4]
	b _021E730A
_021E72F2:
	sub r4, #0x40
	str r0, [r3, r4]
	b _021E730A
_021E72F8:
	ldr r0, _021E7374 ; =0x00002020
	cmp r2, r0
	bge _021E730A
	add r0, r4, #0
	sub r0, #0x40
	ldr r0, [r3, r0]
	sub r4, #0x40
	add r0, r0, r1
	str r0, [r3, r4]
_021E730A:
	mov r6, #1
_021E730C:
	mov r4, #0x80
	add r0, r7, #0
	tst r0, r4
	bne _021E731C
	ldr r0, _021E736C ; =0x0000C308
	ldr r0, [r3, r0]
	tst r0, r4
	beq _021E7356
_021E731C:
	ldr r4, _021E7360 ; =0x0000C304
	ldrh r0, [r3, r4]
	cmp r0, #1
	bne _021E7340
	ldr r0, _021E7378 ; =0xFFFFC200
	sub r2, r2, r1
	cmp r2, r0
	ble _021E733A
	add r0, r4, #0
	sub r0, #0x40
	ldr r0, [r3, r0]
	sub r4, #0x40
	sub r0, r0, r1
	str r0, [r3, r4]
	b _021E7354
_021E733A:
	sub r4, #0x40
	str r0, [r3, r4]
	b _021E7354
_021E7340:
	mov r0, #0x13
	lsl r0, r0, #8
	cmp r2, r0
	ble _021E7354
	add r0, r4, #0
	sub r0, #0x40
	ldr r0, [r3, r0]
	sub r4, #0x40
	sub r0, r0, r1
	str r0, [r3, r4]
_021E7354:
	mov r6, #1
_021E7356:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E735C: .word 0x0000C2C4
_021E7360: .word 0x0000C304
_021E7364: .word 0x0000C31C
_021E7368: .word 0xFFFFD820
_021E736C: .word 0x0000C308
_021E7370: .word 0xFFFFCC80
_021E7374: .word 0x00002020
_021E7378: .word 0xFFFFC200
	thumb_func_end ov69_021E7198

	thumb_func_start ov69_021E737C
ov69_021E737C: ; 0x021E737C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E7400 ; =0x0000C2DC
	ldr r0, [r5, r0]
	bl GF_Camera_GetDistance
	ldr r1, _021E7404 ; =0x0000C2E8
	mov r4, #0
	ldrh r2, [r5, r1]
	cmp r2, #0
	beq _021E73C6
	cmp r2, #1
	bne _021E73F4
	mov r2, #0x16
	lsl r2, r2, #0xe
	cmp r0, r2
	ble _021E73BE
	mov r2, #2
	lsl r2, r2, #0xe
	sub r0, r0, r2
	add r2, r1, #0
	sub r2, #0x18
	ldr r3, [r5, r2]
	add r2, r1, #0
	sub r3, #0x80
	sub r2, #0x18
	str r3, [r5, r2]
	add r2, r1, #0
	sub r2, #0x18
	ldr r2, [r5, r2]
	sub r1, #0x14
	str r2, [r5, r1]
	b _021E73F4
_021E73BE:
	mov r0, #5
	lsl r0, r0, #0x10
	mov r4, #1
	b _021E73F4
_021E73C6:
	mov r2, #0x12
	lsl r2, r2, #0x10
	cmp r0, r2
	bge _021E73EE
	mov r2, #2
	lsl r2, r2, #0xe
	add r0, r0, r2
	add r2, r1, #0
	sub r2, #0x18
	ldr r3, [r5, r2]
	add r2, r1, #0
	add r3, #0x80
	sub r2, #0x18
	str r3, [r5, r2]
	add r2, r1, #0
	sub r2, #0x18
	ldr r2, [r5, r2]
	sub r1, #0x14
	str r2, [r5, r1]
	b _021E73F4
_021E73EE:
	mov r0, #0x4a
	lsl r0, r0, #0xe
	mov r4, #1
_021E73F4:
	ldr r1, _021E7400 ; =0x0000C2DC
	ldr r1, [r5, r1]
	bl GF_Camera_SetDistance
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7400: .word 0x0000C2DC
_021E7404: .word 0x0000C2E8
	thumb_func_end ov69_021E737C

	thumb_func_start ov69_021E7408
ov69_021E7408: ; 0x021E7408
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	ldr r4, _021E74F8 ; =ov69_021E7728
	add r5, r0, #0
	add r3, sp, #0x4c
	mov r2, #4
_021E7414:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7414
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, _021E74FC ; =0x0000C2F8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E74F2
	cmp r0, #1
	beq _021E7446
	cmp r0, #2
	bne _021E74F2
	bl sub_02026E48
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
	ldr r0, _021E74FC ; =0x0000C2F8
	mov r1, #0
	add sp, #0x70
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021E7446:
	bl sub_02026E48
	bl sub_02023154
	ldr r1, _021E7500 ; =0x0000C2C4
	add r0, sp, #0x4c
	add r1, r5, r1
	bl ov69_021E70A8
	ldr r3, _021E7504 ; =0x0000C2AC
	ldr r0, _021E7508 ; =0x0000C084
	add r1, r5, r3
	add r3, #0xc
	add r0, r5, r0
	add r2, sp, #0x4c
	add r3, r5, r3
	bl Draw3dModel
	ldr r4, _021E750C ; =ov69_021E7794
	add r3, sp, #0x28
	mov r2, #4
_021E7470:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7470
	ldr r0, [r4]
	add r2, sp, #0x28
	str r0, [r3]
	ldr r3, _021E7510 ; =0x0000C230
	add r1, r3, #0
	add r0, r5, r3
	add r1, #0x7c
	add r3, #0xa0
	add r1, r5, r1
	add r3, r5, r3
	bl Draw3dModel
	ldr r4, _021E7514 ; =ov69_021E774C
	add r3, sp, #4
	mov r2, #4
_021E7496:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7496
	ldr r0, [r4]
	mov r7, #0
	str r0, [r3]
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bls _021E74EA
	ldr r0, _021E7518 ; =0x0000C0E0
	add r6, r5, #0
	add r0, r5, r0
	add r6, #0x14
	add r4, r5, #0
	str r0, [sp]
_021E74B6:
	add r0, r6, #0
	add r1, sp, #0x4c
	add r2, sp, #4
	bl MTX_Concat33
	ldrh r2, [r4, #0x38]
	cmp r2, #0
	beq _021E74DE
	add r1, r2, #0
	mov r0, #0x54
	mul r1, r0
	ldr r0, [sp]
	ldr r3, _021E751C ; =0x0000C2D0
	add r0, r0, r1
	ldr r1, _021E7504 ; =0x0000C2AC
	add r2, sp, #4
	add r1, r5, r1
	add r3, r5, r3
	bl Draw3dModel
_021E74DE:
	ldr r0, [r5, #0xc]
	add r7, r7, #1
	add r6, #0x30
	add r4, #0x30
	cmp r7, r0
	blo _021E74B6
_021E74EA:
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
_021E74F2:
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E74F8: .word ov69_021E7728
_021E74FC: .word 0x0000C2F8
_021E7500: .word 0x0000C2C4
_021E7504: .word 0x0000C2AC
_021E7508: .word 0x0000C084
_021E750C: .word ov69_021E7794
_021E7510: .word 0x0000C230
_021E7514: .word ov69_021E774C
_021E7518: .word 0x0000C0E0
_021E751C: .word 0x0000C2D0
	thumb_func_end ov69_021E7408

	thumb_func_start ov69_021E7520
ov69_021E7520: ; 0x021E7520
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp]
	add r6, r2, #0
	str r3, [sp, #4]
	bl ov69_021E6300
	ldr r7, [sp, #0x20]
	add r4, r0, #0
	ldr r2, _021E7588 ; =0x0000031E
	mov r0, #0
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #8]
	add r1, r5, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [sp, #8]
	bl DestroyMsgData
	cmp r4, #0
	bne _021E755C
	mov r5, #0
	mov r4, #1
	str r5, [sp]
	b _021E755E
_021E755C:
	mov r5, #1
_021E755E:
	add r0, r4, #0
	bl LocationGmmDatGetGmmNo
	add r2, r0, #0
	mov r0, #0
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r4, r0, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E7588: .word 0x0000031E
	thumb_func_end ov69_021E7520

	thumb_func_start ov69_021E758C
ov69_021E758C: ; 0x021E758C
	push {r3, lr}
	bl ov69_021E6300
	cmp r0, #0
	beq _021E759A
	mov r0, #1
	pop {r3, pc}
_021E759A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov69_021E758C

	thumb_func_start ov69_021E75A0
ov69_021E75A0: ; 0x021E75A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	blt _021E75B4
	ldr r1, _021E75F4 ; =0x0000FFFF
	bl _s32_div_f
	str r1, [r4]
	b _021E75CA
_021E75B4:
	bge _021E75B8
	neg r0, r0
_021E75B8:
	ldr r1, _021E75F4 ; =0x0000FFFF
	bl _s32_div_f
	add r1, r0, #1
	ldr r0, _021E75F4 ; =0x0000FFFF
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	str r0, [r4]
_021E75CA:
	ldr r0, [r4, #4]
	cmp r0, #0
	blt _021E75DA
	ldr r1, _021E75F4 ; =0x0000FFFF
	bl _s32_div_f
	str r1, [r4, #4]
	pop {r4, pc}
_021E75DA:
	bge _021E75DE
	neg r0, r0
_021E75DE:
	ldr r1, _021E75F4 ; =0x0000FFFF
	bl _s32_div_f
	add r1, r0, #1
	ldr r0, _021E75F4 ; =0x0000FFFF
	ldr r2, [r4, #4]
	mul r0, r1
	add r0, r2, r0
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_021E75F4: .word 0x0000FFFF
	thumb_func_end ov69_021E75A0

	thumb_func_start ov69_021E75F8
ov69_021E75F8: ; 0x021E75F8
	push {r3, r4, r5, lr}
	ldr r3, [r0]
	ldr r2, [r1]
	sub r4, r3, r2
	bpl _021E7604
	neg r4, r4
_021E7604:
	ldr r2, [r0, #4]
	ldr r0, [r1, #4]
	sub r5, r2, r0
	bpl _021E760E
	neg r5, r5
_021E760E:
	mov r0, #0xb4
	bl GF_DegreeToSinCosIdxNoWrap
	cmp r4, r0
	ble _021E761C
	ldr r0, _021E7640 ; =0x0000FFFF
	sub r4, r0, r4
_021E761C:
	mov r0, #0xb4
	bl GF_DegreeToSinCosIdxNoWrap
	cmp r5, r0
	ble _021E762A
	ldr r0, _021E7640 ; =0x0000FFFF
	sub r5, r0, r5
_021E762A:
	add r1, r4, #0
	add r0, r5, #0
	mul r1, r4
	mul r0, r5
	add r0, r1, r0
	lsl r0, r0, #0xc
	bl FX_Sqrt
	asr r0, r0, #0xc
	pop {r3, r4, r5, pc}
	nop
_021E7640: .word 0x0000FFFF
	thumb_func_end ov69_021E75F8

	.rodata

_021E7644:
	.byte 0x06, 0x13, 0x0B, 0x0C, 0x06, 0x04, 0x25, 0x01

ov69_021E764C: ; 0x021E764C
	.byte 0x06, 0x02, 0x01, 0x1B
	.byte 0x06, 0x04, 0xB3, 0x00

ov69_021E7654: ; 0x021E7654
	.byte 0x02, 0x01, 0x15, 0x06, 0x02, 0x0F, 0xC1, 0x01

ov69_021E765C: ; 0x021E765C
	.byte 0x02, 0x19, 0x15, 0x06
	.byte 0x02, 0x0F, 0xCD, 0x01

ov69_021E7664: ; 0x021E7664
	.byte 0x06, 0x19, 0x0D, 0x06, 0x04, 0x04, 0x55, 0x01

ov69_021E766C: ; 0x021E766C
	.byte 0x06, 0x02, 0x13, 0x1B
	.byte 0x04, 0x04, 0x6D, 0x01

ov69_021E7674: ; 0x021E7674
	.byte 0x06, 0x03, 0x02, 0x1A, 0x0E, 0x04, 0x01, 0x00

ov69_021E767C: ; 0x021E767C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x12, 0x00

ov69_021E7688: ; 0x021E7688
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov69_021E7698: ; 0x021E7698
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov69_021E76B0: ; 0x021E76B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov69_021E76CC: ; 0x021E76CC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov69_021E76E8: ; 0x021E76E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x0C, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov69_021E7708: ; 0x021E7708
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x0C, 0x00, 0x10
	.byte 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00

ov69_021E7728: ; 0x021E7728
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov69_021E774C: ; 0x021E774C
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov69_021E7770: ; 0x021E7770
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00

ov69_021E7794: ; 0x021E7794
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov69_021E77B8: ; 0x021E77B8
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	; 0x021E77E0
