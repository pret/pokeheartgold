	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov78_021E5900
ov78_021E5900: ; 0x021E5900
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x52
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x5c
	mov r2, #0x52
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x5c
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	ldr r0, [r5]
	bl Save_GetPartyLeadAlive
	add r6, r0, #0
	cmp r5, #0
	bne _021E593C
	bl GF_AssertFail
_021E593C:
	ldr r0, [r5]
	cmp r0, #0
	bne _021E5946
	bl GF_AssertFail
_021E5946:
	ldr r0, [r5]
	bl SavArray_PlayerParty_get
	add r7, r0, #0
	mov r0, #0x52
	str r0, [r4]
	ldr r0, [r5]
	str r0, [r4, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0xc]
	add r0, r7, #0
	add r1, r6, #0
	bl GetPartyMonByIndex
	str r0, [r4, #0x10]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
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
	ldr r0, _021E59E0 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E59E4 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	bl ov78_021E5BAC
	add r0, r4, #0
	bl ov78_021E5D94
	ldr r0, _021E59E8 ; =ov78_021E5B60
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E59D6
	add r0, r4, #0
	bl ov78_021E628C
	add r0, r4, #0
	bl ov78_021E636C
_021E59D6:
	bl GX_BothDispOn
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E59E0: .word 0xFFFFE0FF
_021E59E4: .word 0x04001000
_021E59E8: .word ov78_021E5B60
	thumb_func_end ov78_021E5900

	thumb_func_start ov78_021E59EC
ov78_021E59EC: ; 0x021E59EC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	mov r6, #0
	cmp r1, #5
	bls _021E5A02
	b _021E5B14
_021E5A02:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5A0E: ; jump table
	.short _021E5A1A - _021E5A0E - 2 ; case 0
	.short _021E5A76 - _021E5A0E - 2 ; case 1
	.short _021E5A8A - _021E5A0E - 2 ; case 2
	.short _021E5AA6 - _021E5A0E - 2 ; case 3
	.short _021E5AD0 - _021E5A0E - 2 ; case 4
	.short _021E5B0A - _021E5A0E - 2 ; case 5
_021E5A1A:
	bl ov78_021E5E44
	add r0, r4, #0
	bl ov78_021E5EA4
	add r0, r4, #0
	bl ov78_021E6068
	add r0, r6, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #1
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r5]
	b _021E5B14
_021E5A76:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5B14
	add r0, r6, #0
	add r4, #0x42
	strh r0, [r4]
	mov r0, #2
	str r0, [r5]
	b _021E5B14
_021E5A8A:
	add r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x3c
	bhs _021E5AA0
	add r0, r4, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r4, #0x42
	add r0, r0, #1
	strh r0, [r4]
	b _021E5B14
_021E5AA0:
	mov r0, #3
	str r0, [r5]
	b _021E5B14
_021E5AA6:
	mov r1, #0x40
	ldrsh r2, [r4, r1]
	add r1, r6, #0
	sub r1, #0xc0
	cmp r2, r1
	ble _021E5ABE
	sub r1, r2, #4
	add r4, #0x40
	strh r1, [r4]
	bl ov78_021E5E54
	b _021E5B14
_021E5ABE:
	add r1, r6, #0
	sub r1, #0xc0
	add r4, #0x40
	strh r1, [r4]
	bl ov78_021E5E54
	mov r0, #4
	str r0, [r5]
	b _021E5B14
_021E5AD0:
	ldr r0, _021E5B1C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	and r0, r1
	cmp r0, #1
	beq _021E5AEC
	mov r0, #2
	and r0, r1
	cmp r0, #2
	beq _021E5AEC
	ldr r0, _021E5B20 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E5B14
_021E5AEC:
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
	mov r0, #5
	str r0, [r5]
	b _021E5B14
_021E5B0A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5B14
	mov r6, #1
_021E5B14:
	add r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E5B1C: .word gSystem
_021E5B20: .word gSystem + 0x40
	thumb_func_end ov78_021E59EC

	thumb_func_start ov78_021E5B24
ov78_021E5B24: ; 0x021E5B24
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r5, [r4]
	cmp r1, #2
	bne _021E5B3A
	bl ov78_021E6338
_021E5B3A:
	add r0, r4, #0
	bl ov78_021E5E24
	add r0, r4, #0
	bl ov78_021E5D18
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl OverlayManager_FreeData
	add r0, r5, #0
	bl DestroyHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov78_021E5B24

	thumb_func_start ov78_021E5B60
ov78_021E5B60: ; 0x021E5B60
	push {r4, lr}
	add r4, r0, #0
	bne _021E5B6A
	bl GF_AssertFail
_021E5B6A:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E5B74
	bl GF_AssertFail
_021E5B74:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E5B8E
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _021E5B84
	bl GF_AssertFail
_021E5B84:
	ldr r0, [r4, #0x48]
	bl sub_0200D020
	bl sub_0200D034
_021E5B8E:
	ldr r0, [r4, #0x14]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E5BA4 ; =0x027E0000
	ldr r1, _021E5BA8 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E5BA4: .word 0x027E0000
_021E5BA8: .word 0x00003FF8
	thumb_func_end ov78_021E5B60

	thumb_func_start ov78_021E5BAC
ov78_021E5BAC: ; 0x021E5BAC
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r5, _021E5D0C ; =ov78_021E6858
	add r4, r0, #0
	add r3, sp, #0x2c
	mov r2, #5
_021E5BB8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5BB8
	add r0, sp, #0x2c
	bl GX_SetBanks
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0x1c
	ldr r5, _021E5D10 ; =ov78_021E67E0
	str r0, [r4, #0x14]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5D14 ; =ov78_021E681C
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, sp, #0
	strb r1, [r0, #0x12]
	mov r3, #4
	strb r3, [r0, #0x13]
	lsl r3, r3, #0xa
	str r3, [sp, #8]
	mov r3, #2
	strb r3, [r0, #0x10]
	ldr r0, [r4, #0x14]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r2, #2
	add r0, sp, #0
	strb r2, [r0, #0x12]
	strb r2, [r0, #0x13]
	lsl r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	mov r1, #1
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r1, #4
	add r0, sp, #0
	strb r1, [r0, #0x12]
	mov r2, #1
	strb r2, [r0, #0x13]
	lsl r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	mov r1, #3
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r1, #4
	mov r3, #0
	add r0, sp, #0
	strb r3, [r0, #0x12]
	strb r1, [r0, #0x13]
	lsl r2, r1, #0xa
	str r2, [sp, #8]
	mov r2, #2
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	add r2, sp, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r2, #2
	add r0, sp, #0
	strb r2, [r0, #0x12]
	strb r2, [r0, #0x13]
	lsl r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	mov r1, #5
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r1, #4
	add r0, sp, #0
	strb r1, [r0, #0x12]
	mov r2, #1
	strb r2, [r0, #0x13]
	lsl r1, r2, #0xb
	str r1, [sp, #8]
	strb r2, [r0, #0x10]
	ldr r0, [r4, #0x14]
	mov r1, #7
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #1
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	add sp, #0x54
	pop {r4, r5, pc}
	.balign 4, 0
_021E5D0C: .word ov78_021E6858
_021E5D10: .word ov78_021E67E0
_021E5D14: .word ov78_021E681C
	thumb_func_end ov78_021E5BAC

	thumb_func_start ov78_021E5D18
ov78_021E5D18: ; 0x021E5D18
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #1
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov78_021E5D18

	thumb_func_start ov78_021E5D94
ov78_021E5D94: ; 0x021E5D94
	push {r4, lr}
	sub sp, #0x10
	ldr r1, _021E5E20 ; =_021E67D8
	add r4, r0, #0
	ldrh r2, [r1]
	add r0, sp, #8
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	bl ResetAllTextPrinters
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x38]
	ldr r0, [r4]
	bl ScrStrBufs_new
	str r0, [r4, #0x3c]
	mov r1, #0
	add r0, sp, #8
	strb r1, [r0]
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x18
	add r2, sp, #8
	bl AddWindow
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0xc0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x18
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	mov r1, #4
	add r0, sp, #8
	strb r1, [r0]
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x28
	add r2, sp, #8
	bl AddWindow
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0xc0
	add r4, #0x28
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E5E20: .word _021E67D8
	thumb_func_end ov78_021E5D94

	thumb_func_start ov78_021E5E24
ov78_021E5E24: ; 0x021E5E24
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x28
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x18
	bl RemoveWindow
	ldr r0, [r4, #0x3c]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x38]
	bl DestroyMsgData
	pop {r4, pc}
	thumb_func_end ov78_021E5E24

	thumb_func_start ov78_021E5E44
ov78_021E5E44: ; 0x021E5E44
	add r1, r0, #0
	ldr r3, _021E5E50 ; =ov78_021E5E54
	mov r2, #0
	add r1, #0x40
	strh r2, [r1]
	bx r3
	.balign 4, 0
_021E5E50: .word ov78_021E5E54
	thumb_func_end ov78_021E5E44

	thumb_func_start ov78_021E5E54
ov78_021E5E54: ; 0x021E5E54
	push {r4, lr}
	add r4, r0, #0
	mov r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	mov r1, #1
	mov r2, #3
	bl ScheduleSetBgPosText
	mov r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	mov r1, #5
	mov r2, #3
	add r3, #0xc0
	bl ScheduleSetBgPosText
	mov r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	mov r1, #0
	mov r2, #3
	bl ScheduleSetBgPosText
	mov r3, #0x40
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x14]
	mov r1, #4
	mov r2, #3
	add r3, #0xc0
	bl ScheduleSetBgPosText
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E5EA0
	add r0, r4, #0
	bl ov78_021E652C
_021E5EA0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov78_021E5E54

	thumb_func_start ov78_021E5EA4
ov78_021E5EA4: ; 0x021E5EA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _021E5EC4
	mov r0, #3
	str r0, [sp, #0x18]
	mov r0, #9
	str r0, [sp, #0x14]
	mov r0, #0xc
	mov r7, #0xf
	str r0, [sp, #0x10]
	mov r6, #0
	mov r4, #6
	b _021E5EEE
_021E5EC4:
	cmp r0, #1
	bne _021E5EDC
	mov r0, #4
	str r0, [sp, #0x18]
	mov r0, #0xa
	str r0, [sp, #0x14]
	mov r0, #0xd
	mov r7, #0x10
	str r0, [sp, #0x10]
	mov r6, #1
	mov r4, #7
	b _021E5EEE
_021E5EDC:
	mov r0, #5
	str r0, [sp, #0x18]
	mov r0, #0xb
	str r0, [sp, #0x14]
	mov r0, #0xe
	mov r7, #0x11
	str r0, [sp, #0x10]
	mov r6, #2
	mov r4, #8
_021E5EEE:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r1, r7, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #0
	str r0, [sp, #4]
	ldr r1, [sp, #0x14]
	mov r0, #0x7e
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r1, r7, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	mov r0, #0x7e
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #1
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0x14]
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #1
	bl GfGfxLoader_LoadCharData
	mov r3, #0x20
	str r3, [sp]
	ldr r0, [r5]
	add r1, r4, #0
	str r0, [sp, #4]
	mov r0, #0x7e
	mov r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x10]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0x14]
	mov r1, #5
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #0x14]
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	mov r0, #0x7e
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r3, #0x20
	str r3, [sp]
	ldr r0, [r5]
	add r1, r4, #0
	str r0, [sp, #4]
	mov r0, #0x7e
	mov r2, #4
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	ldr r3, [r5]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r3, [r5]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r2, [r5]
	mov r0, #0
	mov r1, #0x40
	bl LoadFontPal0
	ldr r2, [r5]
	mov r0, #4
	mov r1, #0x40
	bl LoadFontPal0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov78_021E5EA4

	thumb_func_start ov78_021E6068
ov78_021E6068: ; 0x021E6068
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #2
	ldr r1, [r5]
	lsl r0, r0, #8
	bl String_ctor
	add r6, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _021E608C
	mov r0, #0
	str r0, [sp, #0x18]
	mov r7, #0x24
	str r0, [sp, #0x14]
	mov r4, #0x38
	b _021E6096
_021E608C:
	mov r0, #0x30
	mov r4, #0x40
	str r0, [sp, #0x18]
	mov r7, #0x20
	str r4, [sp, #0x14]
_021E6096:
	mov r0, #2
	ldr r1, [r5]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _021E60D0
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _021E60B2
	bl GF_AssertFail
_021E60B2:
	ldr r0, [r5, #0x10]
	bl Mon_GetBoxMon
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x38]
	ldr r2, [sp, #0x10]
	mov r1, #4
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x3c]
	ldr r2, [sp, #0x1c]
	mov r1, #1
	bl BufferBoxMonNickname
	b _021E60DA
_021E60D0:
	ldr r0, [r5, #0x38]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl ReadMsgDataIntoString
_021E60DA:
	ldr r0, [r5, #0x3c]
	ldr r2, [r5, #0xc]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r5, #0x3c]
	ldr r2, [sp, #0x10]
	add r1, r6, #0
	bl StringExpandPlaceholders
	str r7, [sp]
	mov r1, #0
	ldr r0, _021E61C0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	ldr r3, [sp, #0x18]
	str r1, [sp, #0xc]
	add r0, #0x18
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	str r7, [sp]
	mov r1, #0
	ldr r0, _021E61C0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	ldr r3, [sp, #0x18]
	add r0, #0x28
	add r2, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _021E612E
	mov r1, #1
	b _021E6138
_021E612E:
	cmp r0, #1
	bne _021E6136
	mov r1, #2
	b _021E6138
_021E6136:
	mov r1, #5
_021E6138:
	ldr r0, [r5, #0x38]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	str r4, [sp]
	mov r1, #0
	ldr r0, _021E61C0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	ldr r3, [sp, #0x14]
	str r1, [sp, #0xc]
	add r0, #0x18
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	str r4, [sp]
	mov r1, #0
	ldr r0, _021E61C0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	ldr r3, [sp, #0x14]
	str r1, [sp, #0xc]
	add r0, #0x28
	add r2, r6, #0
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #4]
	cmp r0, #2
	beq _021E61B4
	ldr r0, [r5, #0x38]
	mov r1, #3
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r0, #0x90
	str r0, [sp]
	mov r1, #0
	ldr r0, _021E61C0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x18
	add r2, r6, #0
	mov r3, #0x8a
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #0x90
	str r0, [sp]
	mov r1, #0
	ldr r0, _021E61C0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r5, #0x28
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0x8a
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_021E61B4:
	add r0, r6, #0
	bl String_dtor
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E61C0: .word 0x00010200
	thumb_func_end ov78_021E6068

	thumb_func_start ov78_021E61C4
ov78_021E61C4: ; 0x021E61C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021E6210 ; =ov78_021E6880
	add r6, r2, #0
	add r5, r3, #0
	add r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	mov r2, #6
_021E61D6:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E61D6
	ldr r0, [r4]
	add r1, sp, #0
	str r0, [r3]
	strh r6, [r1]
	strh r5, [r1, #2]
	add r0, sp, #0x38
	ldrb r2, [r0, #0x14]
	mov r3, #3
	lsl r3, r3, #0x12
	str r2, [sp, #8]
	ldrb r0, [r0, #0x10]
	add r2, sp, #0
	strh r0, [r1, #6]
	add r0, r7, #0
	mov r1, ip
	bl sub_0200D740
	mov r1, #0
	add r4, r0, #0
	bl sub_0200DC78
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E6210: .word ov78_021E6880
	thumb_func_end ov78_021E61C4

	thumb_func_start ov78_021E6214
ov78_021E6214: ; 0x021E6214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021E624C ; =ov78_021E68B4
	add r6, r2, #0
	add r5, r3, #0
	add r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	mov r2, #6
_021E6226:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6226
	ldr r0, [r4]
	mov r1, ip
	str r0, [r3]
	add r0, sp, #0
	strh r6, [r0]
	mov r3, #3
	strh r5, [r0, #2]
	add r0, r7, #0
	add r2, sp, #0
	lsl r3, r3, #0x12
	bl sub_0200D740
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E624C: .word ov78_021E68B4
	thumb_func_end ov78_021E6214

	thumb_func_start ov78_021E6250
ov78_021E6250: ; 0x021E6250
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r4, _021E6288 ; =ov78_021E68E8
	add r6, r2, #0
	add r5, r3, #0
	add r7, r0, #0
	mov ip, r1
	add r3, sp, #0
	mov r2, #6
_021E6262:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6262
	ldr r0, [r4]
	mov r1, ip
	str r0, [r3]
	add r0, sp, #0
	strh r6, [r0]
	mov r3, #3
	strh r5, [r0, #2]
	add r0, r7, #0
	add r2, sp, #0
	lsl r3, r3, #0x12
	bl sub_0200D740
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E6288: .word ov78_021E68E8
	thumb_func_end ov78_021E6250

	thumb_func_start ov78_021E628C
ov78_021E628C: ; 0x021E628C
	push {r4, r5, r6, lr}
	sub sp, #0x50
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_0200CF18
	str r0, [r5, #0x44]
	bl sub_0200CF38
	add r2, sp, #0x30
	ldr r3, _021E632C ; =ov78_021E6838
	str r0, [r5, #0x48]
	ldmia r3!, {r0, r1}
	add r4, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r6, _021E6330 ; =ov78_021E67F0
	stmia r2!, {r0, r1}
	add r3, sp, #0x1c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r4, #0
	str r0, [r3]
	mov r3, #0x20
	str r3, [sp, #0x1c]
	ldr r0, [r5, #0x44]
	bl sub_0200CF70
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	mov r2, #0x20
	bl sub_0200CFF4
	ldr r4, _021E6334 ; =ov78_021E6804
	add r3, sp, #4
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl sub_0200D3F8
	ldr r0, [r5, #0x44]
	bl sub_0200CF6C
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r0, [r5, #0x10]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	bl SpeciesToOverworldModelIndexOffset
	add r2, r0, #0
	add r0, sp, #0
	mov r1, #0x8d
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrb r0, [r0, #1]
	str r0, [r5, #0x58]
	add sp, #0x50
	pop {r4, r5, r6, pc}
	nop
_021E632C: .word ov78_021E6838
_021E6330: .word ov78_021E67F0
_021E6334: .word ov78_021E6804
	thumb_func_end ov78_021E628C

	thumb_func_start ov78_021E6338
ov78_021E6338: ; 0x021E6338
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x44]
	ldr r7, [r5, #0x48]
	mov r4, #0
_021E6342:
	ldr r0, [r5, #0x4c]
	cmp r0, #0
	bne _021E634C
	bl GF_AssertFail
_021E634C:
	ldr r0, [r5, #0x4c]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021E6342
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0200D998
	add r0, r6, #0
	bl sub_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov78_021E6338

	thumb_func_start ov78_021E636C
ov78_021E636C: ; 0x021E636C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	ldr r7, [r5, #0x44]
	ldr r4, [r5, #0x48]
	mov r0, #0xa2
	bl NARC_ctor
	add r6, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r7, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x41
	bl sub_0200D5D4
	mov r1, #0
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r7, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x42
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x43
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0x44
	bl sub_0200D71C
	add r0, r6, #0
	bl NARC_dtor
	ldr r1, [r5]
	mov r0, #0x7e
	bl NARC_ctor
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	add r1, r4, #0
	mov r3, #0x12
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	add r1, r4, #0
	mov r3, #0x13
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	add r1, r4, #0
	mov r3, #0x14
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	add r1, r4, #0
	mov r3, #0x15
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r7, #0
	add r1, r4, #0
	mov r3, #0x12
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r6, [r5, #0x58]
	ldr r2, [sp, #0x10]
	lsl r3, r6, #1
	add r3, r6, r3
	add r0, r7, #0
	add r1, r4, #0
	add r3, #0x13
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r6, [r5, #0x58]
	ldr r2, [sp, #0x10]
	lsl r3, r6, #1
	add r3, r6, r3
	add r0, r7, #0
	add r1, r4, #0
	add r3, #0x14
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r1, r4, #0
	ldr r4, [r5, #0x58]
	ldr r2, [sp, #0x10]
	lsl r3, r4, #1
	add r3, r4, r3
	add r0, r7, #0
	add r3, #0x15
	bl sub_0200D71C
	ldr r0, [sp, #0x10]
	bl NARC_dtor
	mov r0, #7
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	ldr r4, _021E6528 ; =_021E6920
	mov r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl ov78_021E61C4
	str r0, [r5, #0x4c]
	mov r2, #4
	mov r3, #6
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl ov78_021E6250
	str r0, [r5, #0x50]
	mov r2, #8
	mov r3, #0xa
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	bl ov78_021E6214
	str r0, [r5, #0x54]
	ldr r0, [r5, #0x4c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x50]
	ldr r1, [r5, #0xc]
	ldr r0, [r0]
	ldr r2, [r5]
	bl ov78_021E6664
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x10]
	ldr r0, [r0]
	ldr r2, [r5]
	ldr r3, [r5, #0x58]
	bl ov78_021E66D4
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021E6528: .word _021E6920
	thumb_func_end ov78_021E636C

	thumb_func_start ov78_021E652C
ov78_021E652C: ; 0x021E652C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r5, _021E6568 ; =_021E6920
	mov r6, #0
	add r4, r7, #0
_021E6536:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _021E6540
	bl GF_AssertFail
_021E6540:
	mov r2, #2
	mov r3, #0x40
	ldrsh r2, [r5, r2]
	ldrsh r3, [r7, r3]
	mov r1, #0
	ldrsh r1, [r5, r1]
	sub r2, r2, r3
	lsl r2, r2, #0x10
	mov r3, #3
	ldr r0, [r4, #0x4c]
	asr r2, r2, #0x10
	lsl r3, r3, #0x12
	bl sub_0200DDF4
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #3
	blt _021E6536
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6568: .word _021E6920
	thumb_func_end ov78_021E652C

	thumb_func_start ov78_021E656C
ov78_021E656C: ; 0x021E656C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl sub_02024B60
	cmp r0, #3
	beq _021E6582
	bl GF_AssertFail
_021E6582:
	add r0, r5, #0
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r7, #0
	bl sub_02024B1C
	mov r1, #1
	add r7, r0, #0
	bl NNS_G2dGetImageLocation
	add r1, r0, #0
	add r0, r5, #0
	add r1, r1, r4
	add r2, r6, #0
	bl GX_LoadOBJ
	add r0, r7, #0
	mov r1, #2
	bl NNS_G2dGetImageLocation
	add r1, r0, #0
	add r0, r5, #0
	add r1, r1, r4
	add r2, r6, #0
	bl GXS_LoadOBJ
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov78_021E656C

	thumb_func_start ov78_021E65BC
ov78_021E65BC: ; 0x021E65BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r4, r3, #0
	mov r1, #0
	add r6, r0, #0
	str r2, [sp, #0xc]
	bl sub_0200DCE0
	mov r0, #0x51
	add r1, r4, #0
	bl NARC_ctor
	add r1, r5, #0
	add r2, r4, #0
	str r0, [sp, #0x10]
	bl NARC_AllocAndReadWholeMember
	str r0, [sp, #0x14]
	bl NNS_G3dGetTex
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	mov r1, #2
	add r7, r5, r0
	add r0, r4, #0
	lsl r1, r1, #8
	bl AllocFromHeapAtEnd
	mov r1, #4
	str r1, [sp]
	mov r2, #0
	add r4, r0, #0
	str r1, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0xc]
	add r3, r2, #0
	lsl r0, r0, #9
	add r0, r7, r0
	bl sub_020145B4
	mov r2, #2
	add r0, r6, #0
	add r1, r4, #0
	lsl r2, r2, #8
	mov r3, #0
	bl ov78_021E656C
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl sub_02024B60
	ldr r4, [r5, #0x38]
	mov r1, #0x20
	add r0, r5, r4
	bl DC_FlushRange
	add r0, r6, #0
	bl sub_02024B34
	add r0, r5, r4
	mov r1, #0x40
	mov r2, #0x20
	bl GX_LoadOBJPltt
	add r0, r5, r4
	mov r1, #0x40
	mov r2, #0x20
	bl GXS_LoadOBJPltt
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	ldr r0, [sp, #0x10]
	bl NARC_dtor
	add r0, r6, #0
	mov r1, #1
	bl sub_0200DCE0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov78_021E65BC

	thumb_func_start ov78_021E6664
ov78_021E6664: ; 0x021E6664
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _021E6678
	mov r1, #0x45
	b _021E667A
_021E6678:
	mov r1, #0x46
_021E667A:
	add r0, r5, #0
	mov r2, #0x15
	add r3, r4, #0
	bl ov78_021E65BC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov78_021E6664

	thumb_func_start ov78_021E6688
ov78_021E6688: ; 0x021E6688
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	cmp r5, #0
	ble _021E669A
	ldr r1, _021E66CC ; =0x000001ED
	cmp r5, r1
	ble _021E669E
_021E669A:
	mov r4, #1
	b _021E66C6
_021E669E:
	bl SpeciesToOverworldModelIndexOffset
	ldr r1, _021E66D0 ; =0x00000129
	add r4, r0, r1
	add r0, r5, #0
	bl OverworldModelLookupHasFemaleForme
	cmp r0, #0
	beq _021E66B8
	cmp r7, #1
	bne _021E66C6
	add r4, r4, #1
	b _021E66C6
_021E66B8:
	add r0, r5, #0
	bl OverworldModelLookupFormeCount
	cmp r6, r0
	ble _021E66C4
	mov r6, #0
_021E66C4:
	add r4, r4, r6
_021E66C6:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E66CC: .word 0x000001ED
_021E66D0: .word 0x00000129
	thumb_func_end ov78_021E6688

	thumb_func_start ov78_021E66D4
ov78_021E66D4: ; 0x021E66D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r1, #0
	add r7, r0, #0
	str r2, [sp, #0xc]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	add r5, r3, #0
	bl GetMonData
	str r0, [sp, #0x20]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	bl GetMonGender
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl MonIsShiny
	str r0, [sp, #0x18]
	cmp r5, #0
	beq _021E6714
	mov r4, #2
	lsl r4, r4, #0xa
	mov r5, #8
	b _021E671A
_021E6714:
	mov r4, #2
	lsl r4, r4, #8
	mov r5, #4
_021E671A:
	ldr r1, [sp, #0xc]
	mov r0, #0x51
	bl NARC_ctor
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	lsl r1, r6, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl sub_02070438
	cmp r0, #0
	bne _021E6738
	mov r6, #0
_021E6738:
	lsl r1, r6, #0x10
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x1c]
	lsr r1, r1, #0x10
	bl ov78_021E6688
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0xc]
	bl NARC_AllocAndReadWholeMember
	str r0, [sp, #0x10]
	bl NNS_G3dGetTex
	ldr r1, [r0, #0x14]
	str r0, [sp, #0x24]
	add r6, r0, r1
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	str r5, [sp]
	str r5, [sp, #4]
	mov r2, #0
	str r0, [sp, #0x28]
	str r0, [sp, #8]
	lsl r0, r4, #1
	add r0, r6, r0
	add r1, r5, #0
	add r3, r2, #0
	bl sub_020145B4
	ldr r1, [sp, #0x28]
	add r0, r7, #0
	add r2, r4, #0
	mov r3, #0
	bl ov78_021E656C
	ldr r0, [sp, #0x28]
	bl FreeToHeap
	add r0, r7, #0
	bl sub_02024B60
	ldr r0, [sp, #0x24]
	ldr r1, [r0, #0x38]
	add r4, r0, r1
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _021E679E
	add r4, #0x20
_021E679E:
	add r0, r4, #0
	mov r1, #0x20
	bl DC_FlushRange
	add r0, r7, #0
	bl sub_02024B34
	add r0, r4, #0
	mov r1, #0x60
	mov r2, #0x20
	bl GX_LoadOBJPltt
	add r0, r4, #0
	mov r1, #0x60
	mov r2, #0x20
	bl GXS_LoadOBJPltt
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl NARC_dtor
	add r0, r7, #0
	mov r1, #1
	bl sub_0200DCE0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov78_021E66D4

	.rodata

_021E67D8:
	.byte 0x00, 0x00, 0x00, 0x20, 0x18, 0x02, 0x01, 0x00

ov78_021E67E0: ; 0x021E67E0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov78_021E67F0: ; 0x021E67F0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov78_021E6804: ; 0x021E6804
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov78_021E681C: ; 0x021E681C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov78_021E6838: ; 0x021E6838
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov78_021E6858: ; 0x021E6858
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov78_021E6880: ; 0x021E6880
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov78_021E68B4: ; 0x021E68B4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov78_021E68E8: ; 0x021E68E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_021E6920:
	.byte 0x80, 0x00, 0x10, 0x00, 0x74, 0x00, 0xB4, 0x00, 0x8C, 0x00, 0xB4, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x021E6940
