#include "constants/sndseq.h"
#include "constants/species.h"
#include "msgdata/msg/msg_0219.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov53_OakSpeech_OvyInit
ov53_OakSpeech_OvyInit: ; 0x021E5900
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x50
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #6
	add r0, r5, #0
	lsl r1, r1, #6
	mov r2, #0x50
	bl OverlayManager_CreateAndGetData
	mov r2, #6
	mov r1, #0
	lsl r2, r2, #6
	add r4, r0, #0
	bl memset
	mov r0, #0x50
	str r0, [r4]
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [r4, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	str r1, [r4, #0x10]
	str r1, [r4, #0x14]
	ldr r0, [r4, #8]
	add r2, r1, #0
	str r0, [sp]
	mov r0, #0x50
	mov r3, #7
	str r1, [sp, #4]
	bl sub_020830D8
	mov r1, #0x12
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, #8]
	mov r2, #0
	str r0, [sp]
	mov r0, #0x50
	mov r1, #3
	mov r3, #7
	str r2, [sp, #4]
	bl sub_020830D8
	mov r2, #0x49
	lsl r2, r2, #2
	add r1, r2, #0
	str r0, [r4, r2]
	mov r0, #0
	add r1, #0x58
	str r0, [r4, r1]
	add r2, #0x18
	str r0, [r4, r2]
	bl sub_02002B8C
	ldr r1, [r4]
	mov r0, #4
	bl FontID_Alloc
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov53_OakSpeech_OvyInit

	thumb_func_start ov53_OakSpeech_OvyExec
ov53_OakSpeech_OvyExec: ; 0x021E5994
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	mov r6, #0
	cmp r1, #5
	bls _021E59AA
	b _021E5B22
_021E59AA:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E59B6: ; jump table
	.short _021E59C2 - _021E59B6 - 2 ; case 0
	.short _021E5A56 - _021E59B6 - 2 ; case 1
	.short _021E5AA4 - _021E59B6 - 2 ; case 2
	.short _021E5AD4 - _021E59B6 - 2 ; case 3
	.short _021E5B06 - _021E59B6 - 2 ; case 4
	.short _021E5B20 - _021E59B6 - 2 ; case 5
_021E59C2:
	add r0, r6, #0
	add r1, r6, #0
	bl sub_0200FBF4
	mov r0, #1
	add r1, r6, #0
	bl sub_0200FBF4
	add r0, r6, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5B3C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5B40 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	bl ov53_021E5BDC
	add r0, r4, #0
	bl ov53_021E5E6C
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl ov53_021E7F24
	add r0, r4, #0
	bl ov53_021E8014
	mov r0, #0xe
	str r0, [sp]
	ldr r0, [r4]
	add r1, r4, #0
	str r0, [sp, #4]
	add r1, #0xe8
	ldr r0, [r4, #0x18]
	ldr r1, [r1]
	mov r2, #6
	mov r3, #4
	bl ov53_021E80F4
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _021E5B44 ; =ov53_021E5BCC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl GX_BothDispOn
	mov r0, #1
	str r0, [r5]
	b _021E5B22
_021E5A56:
	bl ov53_021E7ECC
	add r0, r4, #0
	bl ov53_021E6F9C
	cmp r0, #1
	bne _021E5A80
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #2
	str r0, [r5]
_021E5A80:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021E5B22
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
	mov r0, #3
	str r0, [r5]
	b _021E5B22
_021E5AA4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5B22
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov53_021E814C
	add r0, r4, #0
	bl ov53_021E7FEC
	add r0, r4, #0
	bl ov53_021E5EB8
	add r0, r4, #0
	bl ov53_021E5DE0
	add r0, r6, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r6, #1
	b _021E5B22
_021E5AD4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5B22
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov53_021E814C
	add r0, r4, #0
	bl ov53_021E7FEC
	add r0, r4, #0
	bl ov53_021E5EB8
	add r0, r4, #0
	bl ov53_021E5DE0
	add r0, r6, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #4
	str r0, [r5]
	b _021E5B22
_021E5B06:
	ldr r0, [r4, #0x14]
	bl OverlayManager_run
	cmp r0, #1
	bne _021E5B22
	ldr r0, [r4, #0x14]
	bl OverlayManager_delete
	add r0, r6, #0
	str r0, [r4, #0x14]
	mov r0, #5
	str r0, [r5]
	b _021E5B22
_021E5B20:
	str r6, [r5]
_021E5B22:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E5B34
	add r4, #0xd4
	ldr r0, [r4]
	cmp r0, #0
	beq _021E5B34
	bl sub_0200D020
_021E5B34:
	add r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E5B3C: .word 0xFFFFE0FF
_021E5B40: .word 0x04001000
_021E5B44: .word ov53_021E5BCC
	thumb_func_end ov53_OakSpeech_OvyExec

	thumb_func_start ov53_OakSpeech_OvyExit
ov53_OakSpeech_OvyExit: ; 0x021E5B48
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #4
	ldr r5, [r4]
	bl FontID_Release
	ldr r0, [r4, #4]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	ldr r1, [r1, #0x18]
	bl PlayerName_StringToFlat
	ldr r0, [r4, #4]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x12
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	ldr r1, [r1, #4]
	bl PlayerProfile_SetTrainerGender
	ldr r0, [r4, #4]
	bl Sav2_Misc_get
	mov r1, #0x49
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r1, [r1, #0x18]
	bl Sav2_Misc_RivalName_set
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0208311C
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0208311C
	add r0, r6, #0
	bl OverlayManager_FreeData
	add r0, r5, #0
	bl DestroyHeap
	ldr r0, _021E5BC4 ; =FS_OVERLAY_ID(OVY_36)
	ldr r1, _021E5BC8 ; =ov36_App_InitGameState_AfterOakSpeech
	bl RegisterMainOverlay
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E5BC4: .word FS_OVERLAY_ID(OVY_36)
_021E5BC8: .word ov36_App_InitGameState_AfterOakSpeech
	thumb_func_end ov53_OakSpeech_OvyExit

	thumb_func_start ov53_021E5BCC
ov53_021E5BCC: ; 0x021E5BCC
	push {r3, lr}
	ldr r0, [r0, #0x18]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl sub_0200D034
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov53_021E5BCC

	thumb_func_start ov53_021E5BDC
ov53_021E5BDC: ; 0x021E5BDC
	push {r3, r4, r5, lr}
	sub sp, #0x78
	ldr r5, _021E5DC8 ; =ov53_021E8628
	add r4, r0, #0
	add r3, sp, #0x50
	mov r2, #5
_021E5BE8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5BE8
	add r0, sp, #0x50
	bl GX_SetBanks
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0x40
	ldr r5, _021E5DCC ; =ov53_021E8548
	str r0, [r4, #0x18]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5DD0 ; =ov53_021E85CC
	add r3, sp, #0x24
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
	mov r0, #0xf
	strb r0, [r2, #0x12]
	mov r0, #6
	strb r0, [r2, #0x13]
	ldr r0, [r4, #0x18]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r0, #0xe
	add r2, sp, #0x24
	strb r0, [r2, #0x12]
	mov r0, #5
	strb r0, [r2, #0x13]
	ldr r0, [r4, #0x18]
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r0, #0xd
	add r2, sp, #0x24
	strb r0, [r2, #0x12]
	mov r0, #4
	strb r0, [r2, #0x13]
	ldr r0, [r4, #0x18]
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r0, #0xc
	add r2, sp, #0x24
	strb r0, [r2, #0x12]
	mov r1, #3
	strb r1, [r2, #0x13]
	ldr r0, [r4, #0x18]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _021E5DD4 ; =0x000003E2
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	mov r3, #4
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _021E5DD8 ; =0x000003D9
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	mov r3, #3
	bl LoadUserFrameGfx1
	ldr r2, [r4]
	mov r0, #0
	mov r1, #0xa0
	bl LoadFontPal0
	ldr r2, [r4]
	mov r0, #0
	mov r1, #0xc0
	bl LoadFontPal1
	ldr r5, _021E5DDC ; =ov53_021E85E8
	add r3, sp, #8
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0xf
	str r0, [r3]
	add r0, sp, #8
	strb r1, [r0, #0x12]
	mov r1, #6
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	mov r1, #4
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r1, #0xe
	add r0, sp, #8
	strb r1, [r0, #0x12]
	mov r1, #5
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	add r2, sp, #8
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r1, #0xd
	add r0, sp, #8
	strb r1, [r0, #0x12]
	mov r1, #4
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	mov r1, #6
	add r2, sp, #8
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r1, #0xc
	add r0, sp, #8
	strb r1, [r0, #0x12]
	mov r1, #3
	strb r1, [r0, #0x13]
	ldr r0, [r4, #0x18]
	mov r1, #7
	add r2, sp, #8
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #7
	mov r1, #3
	bl SetBgPriority
	mov r1, #7
	ldr r2, [r4]
	mov r0, #4
	lsl r1, r1, #6
	bl LoadFontPal0
	ldr r3, [r4]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
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
	add r0, r4, #0
	bl ov53_021E65E0
	mov r0, #0x4a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add sp, #0x78
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5DC8: .word ov53_021E8628
_021E5DCC: .word ov53_021E8548
_021E5DD0: .word ov53_021E85CC
_021E5DD4: .word 0x000003E2
_021E5DD8: .word 0x000003D9
_021E5DDC: .word ov53_021E85E8
	thumb_func_end ov53_021E5BDC

	thumb_func_start ov53_021E5DE0
ov53_021E5DE0: ; 0x021E5DE0
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
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov53_021E5DE0

	thumb_func_start ov53_021E5E6C
ov53_021E5E6C: ; 0x021E5E6C
	push {r4, lr}
	add r4, r0, #0
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #219
	bl NewMsgDataFromNarc
	mov r1, #1
	lsl r1, r1, #8
	str r0, [r4, r1]
	bl ResetAllTextPrinters
	mov r0, #0
	ldr r3, [r4]
	add r1, r0, #0
	mov r2, #6
	bl sub_020163E0
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl ScrStrBufs_new
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	mov r2, #0
	sub r0, #0x14
	str r2, [r4, r0]
	sub r1, #0x10
	str r2, [r4, r1]
	add r4, #0x80
	str r2, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E5E6C

	thumb_func_start ov53_021E5EB8
ov53_021E5EB8: ; 0x021E5EB8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x45
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020164C4
	mov r0, #1
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl DestroyMsgData
	pop {r4, pc}
	thumb_func_end ov53_021E5EB8

	thumb_func_start ov53_021E5EDC
ov53_021E5EDC: ; 0x021E5EDC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r3, r0, #0
	add r6, r2, #0
	mov r7, #0
	cmp r4, #0x65
	bgt _021E5F0A
	bge _021E5F32
	cmp r4, #6
	bhi _021E5F0E
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5EFC: ; jump table
	.short _021E5F0E - _021E5EFC - 2 ; case 0
	.short _021E5F14 - _021E5EFC - 2 ; case 1
	.short _021E5F1A - _021E5EFC - 2 ; case 2
	.short _021E5F0E - _021E5EFC - 2 ; case 3
	.short _021E5F20 - _021E5EFC - 2 ; case 4
	.short _021E5F26 - _021E5EFC - 2 ; case 5
	.short _021E5F2C - _021E5EFC - 2 ; case 6
_021E5F0A:
	cmp r4, #0x66
	beq _021E5F38
_021E5F0E:
	mov r1, #1
	mov r0, #0
	b _021E5F3C
_021E5F14:
	mov r1, #2
	add r0, r7, #0
	b _021E5F3C
_021E5F1A:
	mov r1, #4
	add r0, r7, #0
	b _021E5F3C
_021E5F20:
	mov r1, #1
	add r0, r1, #0
	b _021E5F3C
_021E5F26:
	mov r1, #2
	mov r0, #1
	b _021E5F3C
_021E5F2C:
	mov r1, #4
	mov r0, #1
	b _021E5F3C
_021E5F32:
	mov r1, #0x10
	add r0, r7, #0
	b _021E5F3C
_021E5F38:
	mov r1, #0x10
	mov r0, #1
_021E5F3C:
	mov r5, #0x4a
	lsl r5, r5, #2
	ldr r2, [r3, r5]
	cmp r2, #3
	bls _021E5F48
	b _021E60BE
_021E5F48:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E5F54: ; jump table
	.short _021E5F5C - _021E5F54 - 2 ; case 0
	.short _021E5FDC - _021E5F54 - 2 ; case 1
	.short _021E6034 - _021E5F54 - 2 ; case 2
	.short _021E60B0 - _021E5F54 - 2 ; case 3
_021E5F5C:
	cmp r6, #0
	bne _021E5FC8
	mov r6, #0
	add r2, r5, #4
	str r6, [r3, r2]
	add r2, r5, #0
	mov r6, #0x10
	add r2, #8
	str r6, [r3, r2]
	mov r2, #1
	str r2, [r3, r5]
	cmp r0, #0
	bne _021E5F8C
	add r0, r5, #0
	add r0, #8
	ldr r0, [r3, r0]
	add r5, r5, #4
	str r0, [sp]
	ldr r0, _021E60C4 ; =0x04000050
	ldr r3, [r3, r5]
	mov r2, #0xe
	bl G2x_SetBlendAlpha_
	b _021E5FA0
_021E5F8C:
	add r0, r5, #0
	add r0, #8
	ldr r0, [r3, r0]
	add r5, r5, #4
	str r0, [sp]
	ldr r0, _021E60C8 ; =0x04001050
	ldr r3, [r3, r5]
	mov r2, #0xe
	bl G2x_SetBlendAlpha_
_021E5FA0:
	cmp r4, #0x65
	bne _021E5FAE
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _021E60BE
_021E5FAE:
	cmp r4, #0x66
	bne _021E5FBC
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	b _021E60BE
_021E5FBC:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl ToggleBgLayer
	b _021E60BE
_021E5FC8:
	mov r1, #0x10
	add r0, r5, #4
	str r1, [r3, r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #8
	str r1, [r3, r0]
	mov r0, #2
	str r0, [r3, r5]
	b _021E60BE
_021E5FDC:
	add r2, r5, #0
	add r2, #8
	ldr r2, [r3, r2]
	cmp r2, #0
	beq _021E602E
	add r2, r5, #4
	ldr r2, [r3, r2]
	add r4, r2, #1
	add r2, r5, #4
	str r4, [r3, r2]
	add r2, r5, #0
	add r2, #8
	ldr r2, [r3, r2]
	sub r4, r2, #1
	add r2, r5, #0
	add r2, #8
	str r4, [r3, r2]
	cmp r0, #0
	bne _021E6018
	add r0, r5, #0
	add r0, #8
	ldr r0, [r3, r0]
	add r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C4 ; =0x04000050
	ldr r3, [r3, r4]
	mov r2, #0xe
	bl G2x_SetBlendAlpha_
	b _021E60BE
_021E6018:
	add r0, r5, #0
	add r0, #8
	ldr r0, [r3, r0]
	add r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C8 ; =0x04001050
	ldr r3, [r3, r4]
	mov r2, #0xe
	bl G2x_SetBlendAlpha_
	b _021E60BE
_021E602E:
	mov r0, #3
	str r0, [r3, r5]
	b _021E60BE
_021E6034:
	add r2, r5, #4
	ldr r2, [r3, r2]
	cmp r2, #0
	beq _021E6084
	add r2, r5, #4
	ldr r2, [r3, r2]
	sub r4, r2, #1
	add r2, r5, #4
	str r4, [r3, r2]
	add r2, r5, #0
	add r2, #8
	ldr r2, [r3, r2]
	add r4, r2, #1
	add r2, r5, #0
	add r2, #8
	str r4, [r3, r2]
	cmp r0, #0
	bne _021E606E
	add r0, r5, #0
	add r0, #8
	ldr r0, [r3, r0]
	add r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C4 ; =0x04000050
	ldr r3, [r3, r4]
	mov r2, #0xe
	bl G2x_SetBlendAlpha_
	b _021E60BE
_021E606E:
	add r0, r5, #0
	add r0, #8
	ldr r0, [r3, r0]
	add r4, r5, #4
	str r0, [sp]
	ldr r0, _021E60C8 ; =0x04001050
	ldr r3, [r3, r4]
	mov r2, #0xe
	bl G2x_SetBlendAlpha_
	b _021E60BE
_021E6084:
	mov r0, #3
	str r0, [r3, r5]
	cmp r4, #0x65
	bne _021E6096
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	b _021E60BE
_021E6096:
	cmp r4, #0x66
	bne _021E60A4
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	b _021E60BE
_021E60A4:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl ToggleBgLayer
	b _021E60BE
_021E60B0:
	ldr r0, _021E60C4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _021E60C8 ; =0x04001050
	mov r7, #1
	strh r1, [r0]
	str r1, [r3, r5]
_021E60BE:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E60C4: .word 0x04000050
_021E60C8: .word 0x04001050
	thumb_func_end ov53_021E5EDC

	thumb_func_start ov53_021E60CC
ov53_021E60CC: ; 0x021E60CC
	mov r2, #0x4f
	lsl r2, r2, #2
	ldr r3, [r0, r2]
	cmp r3, r1
	bge _021E60DE
	add r1, r3, #1
	str r1, [r0, r2]
	mov r0, #0
	bx lr
_021E60DE:
	mov r1, #0
	str r1, [r0, r2]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov53_021E60CC

	thumb_func_start ov53_021E60E8
ov53_021E60E8: ; 0x021E60E8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	lsl r0, r2, #0x18
	add r4, r1, #0
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsl r1, r4, #0x18
	mov r2, #0
	ldr r0, [r5, #0x18]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x18]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov53_021E60E8

	thumb_func_start ov53_021E611C
ov53_021E611C: ; 0x021E611C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	mov r1, #0x41
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	mov r4, #0
	cmp r0, #0
	beq _021E613C
	cmp r0, #1
	beq _021E621C
	cmp r0, #2
	bne _021E613A
	b _021E6240
_021E613A:
	b _021E6274
_021E613C:
	add r1, r5, #0
	ldr r0, [r5, #0x18]
	ldr r2, _021E627C ; =ov53_021E8500
	add r1, #0x2c
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r4, #0
	add r0, #0x2c
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	add r0, r5, #0
	ldr r2, _021E6280 ; =0x000003E2
	add r0, #0x2c
	add r1, r4, #0
	mov r3, #4
	bl DrawFrameAndWindow2
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	add r0, r4, #0
	bl sub_02002B50
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r5, r1]
	sub r1, #0x10
	ldr r0, [r5, r1]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r3, #0x46
	mov r0, #1
	lsl r3, r3, #2
	str r0, [sp]
	mov r0, #2
	add r2, r3, #0
	str r0, [sp, #4]
	add r2, #8
	ldr r0, [r5, r3]
	ldr r2, [r5, r2]
	add r3, #0x1c
	ldrh r3, [r5, r3]
	ldr r2, [r2, #0x18]
	add r1, r4, #0
	bl BufferString
	mov r1, #1
	mov r2, #0x46
	str r1, [sp]
	mov r0, #2
	lsl r2, r2, #2
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	add r3, r4, #0
	ldr r2, [r2, #0x18]
	bl BufferString
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, #8
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	ldr r0, [r5, #8]
	bl Options_GetTextFrameDelay
	add r3, r4, #0
	str r3, [sp]
	str r0, [sp, #4]
	mov r2, #0x11
	add r0, r5, #0
	str r3, [sp, #8]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, #0x2c
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #0x43
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	sub r1, #8
	str r0, [r5, r1]
	b _021E6274
_021E621C:
	add r1, #8
	ldr r0, [r5, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E6274
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl String_dtor
	mov r0, #0x41
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _021E6274
_021E6240:
	cmp r2, #0
	bne _021E625E
	ldr r0, _021E6284 ; =gSystem
	ldr r2, [r0, #0x48]
	mov r0, #1
	and r0, r2
	cmp r0, #1
	bne _021E6260
	ldr r0, _021E6288 ; =SEQ_SE_DP_SELECT
	add r1, #0x68
	str r4, [r5, r1]
	bl PlaySE
	mov r4, #1
	b _021E6260
_021E625E:
	mov r4, #1
_021E6260:
	cmp r4, #0
	beq _021E6274
	add r0, r5, #0
	add r0, #0x2c
	bl RemoveWindow
	mov r0, #0x41
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E6274:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E627C: .word ov53_021E8500
_021E6280: .word 0x000003E2
_021E6284: .word gSystem
_021E6288: .word SEQ_SE_DP_SELECT
	thumb_func_end ov53_021E611C

	thumb_func_start ov53_021E628C
ov53_021E628C: ; 0x021E628C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp, #0x10]
	mov r1, #0
	str r1, [sp, #0x14]
	mov r1, #0x42
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r5, r2, #0
	add r7, r3, #0
	ldr r6, [sp, #0x38]
	cmp r1, #5
	bls _021E62AA
	b _021E6490
_021E62AA:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E62B6: ; jump table
	.short _021E62C2 - _021E62B6 - 2 ; case 0
	.short _021E63F6 - _021E62B6 - 2 ; case 1
	.short _021E6406 - _021E62B6 - 2 ; case 2
	.short _021E6428 - _021E62B6 - 2 ; case 3
	.short _021E6460 - _021E62B6 - 2 ; case 4
	.short _021E6476 - _021E62B6 - 2 ; case 5
_021E62C2:
	ldr r0, [sp, #0x14]
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #1
	ldr r1, [r4]
	lsl r0, r0, #0xa
	bl String_ctor
	mov r2, #0x11
	lsl r2, r2, #4
	str r0, [r4, r2]
	add r0, r2, #0
	sub r0, #0x10
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x10]
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	ldr r0, _021E6498 ; =0x0000FFFF
	cmp r7, r0
	bne _021E6304
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl StringCountLines
	lsl r1, r0, #1
	mov r0, #0x18
	sub r1, r0, r1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r7, r0, #1
_021E6304:
	ldr r0, _021E6498 ; =0x0000FFFF
	cmp r6, r0
	bne _021E6316
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl StringCountLines
	lsl r6, r0, #1
_021E6316:
	cmp r5, #3
	bhi _021E63E2
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6326: ; jump table
	.short _021E6384 - _021E6326 - 2 ; case 0
	.short _021E632E - _021E6326 - 2 ; case 1
	.short _021E6384 - _021E6326 - 2 ; case 2
	.short _021E6384 - _021E6326 - 2 ; case 3
_021E632E:
	ldr r1, _021E649C ; =ov53_021E84F8
	add r0, sp, #0x18
	ldrh r3, [r1, #0x28]
	add r2, sp, #0x18
	strh r3, [r0]
	ldrh r3, [r1, #0x2a]
	strh r3, [r0, #2]
	ldrh r3, [r1, #0x2c]
	ldrh r1, [r1, #0x2e]
	strh r3, [r0, #4]
	strh r1, [r0, #6]
	strb r7, [r0, #2]
	strb r6, [r0, #4]
	add r1, r4, #0
	ldr r0, [r4, #0x18]
	add r1, #0x1c
	bl AddWindow
	mov r1, #0
	mov r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x1c
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	mov r1, #0
	str r1, [sp]
	mov r2, #0x11
	ldr r0, _021E64A0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	add r0, #0x1c
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	b _021E63E2
_021E6384:
	ldr r1, _021E649C ; =ov53_021E84F8
	add r0, sp, #0x18
	ldrh r2, [r1, #0x30]
	cmp r5, #3
	strh r2, [r0]
	ldrh r2, [r1, #0x32]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	strb r7, [r0, #2]
	strb r6, [r0, #4]
	bne _021E63A6
	ldrb r1, [r0, #1]
	add r1, r1, #4
	strb r1, [r0, #1]
_021E63A6:
	add r1, r4, #0
	ldr r0, [r4, #0x18]
	add r1, #0x1c
	add r2, sp, #0x18
	bl AddWindow
	mov r1, #0
	mov r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x1c
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	mov r1, #0
	str r1, [sp]
	mov r2, #0x11
	ldr r0, _021E64A4 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #0xc]
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	add r0, #0x1c
	add r3, r1, #0
	bl AddTextPrinterParameterized2
_021E63E2:
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x42
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E63F6:
	add r0, #0x1c
	bl CopyWindowToVram
	mov r0, #0x42
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E6406:
	ldr r1, [sp, #0x14]
	add r2, r1, #0
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E6490
	mov r0, #0x42
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r4, r0]
	cmp r5, #2
	bne _021E6490
	mov r1, #4
	str r1, [r4, r0]
	mov r0, #1
	str r0, [sp, #0x14]
	b _021E6490
_021E6428:
	ldr r0, _021E64A8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	and r0, r1
	cmp r0, #1
	beq _021E643C
	mov r0, #2
	and r0, r1
	cmp r0, #2
	bne _021E6490
_021E643C:
	ldr r0, _021E64AC ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6448
	mov r1, #1
	b _021E644A
_021E6448:
	mov r1, #0
_021E644A:
	mov r0, #0x5b
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E64B0 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x42
	mov r1, #4
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E6460:
	ldr r1, [sp, #0x14]
	mov r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E6490
	mov r0, #0x42
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _021E6490
_021E6476:
	add r0, #0x1c
	bl RemoveWindow
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x42
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	str r0, [sp, #0x14]
_021E6490:
	ldr r0, [sp, #0x14]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6498: .word 0x0000FFFF
_021E649C: .word ov53_021E84F8
_021E64A0: .word 0x00010200
_021E64A4: .word 0x000F0200
_021E64A8: .word gSystem
_021E64AC: .word gSystem + 0x40
_021E64B0: .word SEQ_SE_DP_SELECT
	thumb_func_end ov53_021E628C

	thumb_func_start ov53_021E64B4
ov53_021E64B4: ; 0x021E64B4
	push {r3, lr}
	ldr r3, _021E64C0 ; =0x0000FFFF
	str r3, [sp]
	bl ov53_021E628C
	pop {r3, pc}
	.balign 4, 0
_021E64C0: .word 0x0000FFFF
	thumb_func_end ov53_021E64B4

	thumb_func_start ov53_021E64C4
ov53_021E64C4: ; 0x021E64C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r7, r0, #0
	ldr r0, [sp, #0x48]
	str r1, [sp, #0x28]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	str r0, [sp, #0x48]
	str r0, [r7, #0x7c]
	cmp r0, #2
	bne _021E64DE
	mov r0, #4
	str r0, [sp, #0x10]
_021E64DE:
	ldr r0, [sp, #0x48]
	cmp r0, #3
	bne _021E64E8
	mov r0, #8
	str r0, [sp, #0x10]
_021E64E8:
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	cmp r0, #0
	ble _021E65A6
	add r0, sp, #0x28
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x48]
	add r4, r7, #0
	sub r1, r0, #2
	mov r0, #0x18
	add r2, r1, #0
	mul r2, r0
	ldr r0, _021E65AC ; =ov53_021E8680
	add r4, #0x3c
	add r0, r0, r2
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
_021E650C:
	mov r0, #1
	ldr r1, [r7]
	lsl r0, r0, #0xa
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	ldr r1, [sp, #0x24]
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	ldr r1, [r1]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	str r0, [sp, #0x20]
	ldr r0, [r7, #0x18]
	ldr r2, [sp, #0x18]
	add r1, r4, #0
	bl AddWindow
	mov r1, #0
	mov r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021E65B0 ; =0x000F0100
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #3]
	add r0, r4, #0
	add r2, r6, #0
	lsl r5, r3, #3
	ldr r3, [sp, #0x20]
	sub r5, r5, r3
	lsr r3, r5, #0x1f
	add r3, r5, r3
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x24]
	add r4, #0x10
	add r0, r0, #4
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	add r0, #8
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r0, #8
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	add r1, r0, #1
	ldr r0, [sp, #0x48]
	str r1, [sp, #0x1c]
	cmp r1, r0
	blt _021E650C
_021E65A6:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_021E65AC: .word ov53_021E8680
_021E65B0: .word 0x000F0100
	thumb_func_end ov53_021E64C4

	thumb_func_start ov53_021E65B4
ov53_021E65B4: ; 0x021E65B4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x7c]
	mov r4, #0
	cmp r0, #0
	ble _021E65D4
	add r5, r6, #0
	add r5, #0x3c
_021E65C4:
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r6, #0x7c]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _021E65C4
_021E65D4:
	ldr r0, [r6, #0x18]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov53_021E65B4

	thumb_func_start ov53_021E65E0
ov53_021E65E0: ; 0x021E65E0
	push {r4, r5, lr}
	sub sp, #0x14
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r5, r0, #0
	str r1, [sp, #8]
	ldr r0, [r5]
	mov r3, #3
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	ldr r3, [r5]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x20
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	ldr r0, _021E66A0 ; =gGameVersion
	ldrb r0, [r0]
	cmp r0, #7
	bne _021E662E
	mov r1, #1
	mov r4, #0x1e
	b _021E6632
_021E662E:
	mov r1, #2
	mov r4, #0x1f
_021E6632:
	mov r0, #0x60
	str r0, [sp]
	ldr r0, [r5]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x78
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0xa0
	str r0, [sp]
	ldr r0, [r5]
	add r1, r4, #0
	str r0, [sp, #4]
	mov r0, #0x78
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	ldr r3, [r5]
	mov r0, #0x78
	add r1, r4, #0
	add r2, sp, #0x10
	bl GfGfxLoader_GetPlttData
	ldr r1, [sp, #0x10]
	ldr r1, [r1, #0xc]
	ldrh r2, [r1, #0x18]
	ldr r1, _021E66A4 ; =0x00000136
	strh r2, [r5, r1]
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #1
	bl ov53_021E66A8
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov53_021E66E8
	add r0, r5, #0
	mov r1, #0
	bl ov53_021E67C4
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021E66A0: .word gGameVersion
_021E66A4: .word 0x00000136
	thumb_func_end ov53_021E65E0

	thumb_func_start ov53_021E66A8
ov53_021E66A8: ; 0x021E66A8
	push {r4, r5, r6, lr}
	sub sp, #0x28
	ldr r6, _021E66E4 ; =ov53_021E856C
	add r5, sp, #0x10
	add r4, r0, #0
	add r3, r1, #0
	add r2, r5, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	cmp r3, #6
	bge _021E66E0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	lsl r1, r3, #2
	str r0, [sp, #0xc]
	ldr r1, [r2, r1]
	ldr r2, [r4, #0x18]
	mov r0, #0x78
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
_021E66E0:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E66E4: .word ov53_021E856C
	thumb_func_end ov53_021E66A8

	thumb_func_start ov53_021E66E8
ov53_021E66E8: ; 0x021E66E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	ldr r6, _021E67C0 ; =ov53_021E86F0
	add r4, r2, #0
	add r5, r0, #0
	add r7, r1, #0
	add r3, sp, #0x10
	mov r2, #0xa
_021E66F8:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E66F8
	cmp r7, #0
	beq _021E675C
	cmp r4, #0xc
	bge _021E675C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsl r6, r7, #3
	str r0, [sp, #0xc]
	add r1, sp, #0x10
	ldr r1, [r1, r6]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #1
	bl GfGfxLoader_LoadCharData
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	add r1, sp, #0x14
	str r0, [sp, #4]
	ldr r1, [r1, r6]
	mov r0, #0x78
	mov r2, #0
	mov r3, #0xe0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #1
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #1
	mov r2, #7
	bl ov53_021E60E8
_021E675C:
	cmp r4, #0
	beq _021E67BA
	cmp r4, #0xc
	bge _021E67BA
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsl r4, r4, #3
	str r0, [sp, #0xc]
	add r1, sp, #0x10
	ldr r1, [r1, r4]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r5]
	add r1, sp, #0x14
	str r0, [sp, #4]
	mov r0, #0x78
	add r3, r0, #0
	ldr r1, [r1, r4]
	mov r2, #0
	add r3, #0x88
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #2
	mov r2, #8
	bl ov53_021E60E8
_021E67BA:
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E67C0: .word ov53_021E86F0
	thumb_func_end ov53_021E66E8

	thumb_func_start ov53_021E67C4
ov53_021E67C4: ; 0x021E67C4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	ldr r6, _021E6820 ; =ov53_021E8558
	add r3, sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	cmp r4, #5
	str r0, [r3]
	bge _021E681C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsl r1, r4, #2
	str r0, [sp, #0xc]
	ldr r1, [r2, r1]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	cmp r4, #1
	bne _021E680E
	add r0, r5, #0
	mov r1, #7
	mov r2, #3
	bl ov53_021E60E8
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
_021E680E:
	cmp r4, #2
	bne _021E681C
	add r0, r5, #0
	mov r1, #7
	mov r2, #2
	bl ov53_021E60E8
_021E681C:
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E6820: .word ov53_021E8558
	thumb_func_end ov53_021E67C4

	thumb_func_start ov53_021E6824
ov53_021E6824: ; 0x021E6824
	push {r4, r5, r6, lr}
	sub sp, #0x28
	ldr r4, _021E6904 ; =ov53_021E8584
	add r3, sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	lsl r4, r6, #3
	str r0, [sp, #0xc]
	ldr r1, [r2, r4]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #6
	mov r2, #7
	bl ov53_021E60E8
	mov r0, #0x60
	str r0, [sp]
	ldr r0, [r5]
	mov r1, #0x21
	str r0, [sp, #4]
	mov r0, #0x78
	mov r2, #4
	mov r3, #0xe0
	bl GfGfxLoader_GXLoadPal
	ldr r3, [r5]
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r1, sp, #0x14
	str r0, [sp, #0xc]
	ldr r1, [r1, r4]
	ldr r2, [r5, #0x18]
	mov r0, #0x78
	mov r3, #6
	bl GfGfxLoader_LoadCharData
	ldr r0, [r5, #0x18]
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	cmp r6, #1
	bne _021E6900
	mov r0, #0x4d
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	ldr r0, [r5, #0x18]
	bne _021E68DE
	mov r1, #4
	mov r2, #0
	mov r3, #0x88
	bl ScheduleSetBgPosText
	ldr r0, [r5, #0x18]
	mov r1, #6
	mov r2, #0
	mov r3, #0x88
	bl ScheduleSetBgPosText
	ldr r0, [r5, #0x18]
	mov r1, #5
	mov r2, #0
	mov r3, #0x88
	bl ScheduleSetBgPosText
	add sp, #0x28
	pop {r4, r5, r6, pc}
_021E68DE:
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #0x18]
	mov r1, #6
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #0
	ldr r0, [r5, #0x18]
	mov r1, #5
	add r3, r2, #0
	bl ScheduleSetBgPosText
_021E6900:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6904: .word ov53_021E8584
	thumb_func_end ov53_021E6824

	thumb_func_start ov53_021E6908
ov53_021E6908: ; 0x021E6908
	lsl r2, r1, #4
	ldr r1, _021E6924 ; =ov53_021E86B0 + 4
	mov r3, #0
	strb r3, [r0, #3]
	ldr r1, [r1, r2]
	strb r3, [r0]
	strb r1, [r0, #1]
	strb r3, [r0, #6]
	strb r3, [r0, #4]
	mov r1, #0x10
	strb r1, [r0, #5]
	strb r3, [r0, #2]
	bx lr
	nop
_021E6924: .word ov53_021E86B0 + 4
	thumb_func_end ov53_021E6908

	thumb_func_start ov53_021E6928
ov53_021E6928: ; 0x021E6928
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, _021E6980 ; =ov53_021E86B0 + 4
	mov r2, #0x16
	lsl r1, r1, #4
	add r4, r0, #0
	mov r0, #0
	lsl r2, r2, #4
	ldr r5, [r3, r1]
	strb r0, [r4, r2]
	add r3, r2, #1
	strb r5, [r4, r3]
	add r3, r2, #4
	strb r0, [r4, r3]
	mov r3, #0x10
	add r2, r2, #5
	strb r3, [r4, r2]
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, _021E6984 ; =ov53_021E86B0
	str r0, [sp, #0xc]
	ldr r1, [r2, r1]
	ldr r2, [r4, #0x18]
	mov r0, #0x78
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #0x2a
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x18]
	mov r0, #0x78
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6980: .word ov53_021E86B0 + 4
_021E6984: .word ov53_021E86B0
	thumb_func_end ov53_021E6928

	thumb_func_start ov53_021E6988
ov53_021E6988: ; 0x021E6988
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r7, #0
	add r4, r1, #0
	ldr r3, _021E6B80 ; =ov53_021E8650
	add r5, r0, #0
	mvn r7, r7
	add r2, sp, #0
	mov r1, #0x30
_021E699A:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E699A
	ldr r6, _021E6B84 ; =0x00000166
	ldrb r0, [r5, r6]
	cmp r0, #0
	beq _021E69C2
	add r0, r0, #1
	strb r0, [r5, r6]
	ldrb r0, [r5, r6]
	cmp r0, #0x14
	bls _021E69DE
	mov r0, #0
	strb r0, [r5, r6]
	sub r0, r6, #3
	ldrb r7, [r5, r0]
	b _021E6B30
_021E69C2:
	ldr r0, _021E6B88 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6A22
	add r1, sp, #0
	lsl r0, r4, #4
	add r0, r1, r0
	bl sub_02025224
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021E69E0
_021E69DE:
	b _021E6B30
_021E69E0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov53_021E6928
	mov r0, #5
	mov r1, #1
	bl ToggleBgLayer
	ldr r0, _021E6B8C ; =0x00000163
	mov r3, #0xc
	strb r6, [r5, r0]
	mul r3, r4
	ldr r4, _021E6B8C ; =0x00000163
	ldr r6, _021E6B90 ; =ov53_021E8604
	ldrb r4, [r5, r4]
	add r3, r6, r3
	ldr r0, [r5, #0x18]
	lsl r4, r4, #2
	ldr r3, [r4, r3]
	mov r1, #5
	mov r2, #3
	bl ScheduleSetBgPosText
	ldr r0, _021E6B84 ; =0x00000166
	mov r1, #1
	strb r1, [r5, r0]
	mov r1, #2
	sub r0, r0, #1
	strb r1, [r5, r0]
	ldr r0, _021E6B94 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E6B30
_021E6A22:
	sub r0, r6, #4
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6A52
	ldr r0, _021E6B98 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xc3
	tst r0, r1
	beq _021E6B30
	ldr r0, _021E6B94 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov53_021E6928
	mov r0, #5
	mov r1, #1
	bl ToggleBgLayer
	mov r1, #1
	sub r0, r6, #4
	strb r1, [r5, r0]
	b _021E6B30
_021E6A52:
	ldr r0, _021E6B98 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6A90
	sub r0, r6, #3
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E6B30
	sub r0, r6, #3
	ldrb r0, [r5, r0]
	mov r3, #0xc
	mul r3, r4
	sub r1, r0, #1
	sub r0, r6, #3
	strb r1, [r5, r0]
	sub r4, r6, #3
	ldrb r4, [r5, r4]
	ldr r0, [r5, #0x18]
	mov r1, #5
	lsl r6, r4, #2
	ldr r4, _021E6B90 ; =ov53_021E8604
	mov r2, #3
	add r3, r4, r3
	ldr r3, [r6, r3]
	bl ScheduleSetBgPosText
	ldr r0, _021E6B94 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E6B30
_021E6A90:
	mov r3, #0x80
	add r1, r0, #0
	tst r1, r3
	beq _021E6ADA
	add r1, r3, #0
	add r0, r3, #0
	add r1, #0xe1
	add r0, #0xe3
	ldrb r1, [r5, r1]
	ldrb r0, [r5, r0]
	sub r1, r1, #1
	cmp r0, r1
	beq _021E6B30
	add r0, r3, #0
	add r0, #0xe3
	ldrb r0, [r5, r0]
	mov r6, #0xc
	mul r6, r4
	add r1, r0, #1
	add r0, r3, #0
	add r0, #0xe3
	strb r1, [r5, r0]
	add r3, #0xe3
	ldrb r3, [r5, r3]
	ldr r4, _021E6B90 ; =ov53_021E8604
	ldr r0, [r5, #0x18]
	lsl r3, r3, #2
	add r4, r4, r6
	ldr r3, [r3, r4]
	mov r1, #5
	mov r2, #3
	bl ScheduleSetBgPosText
	ldr r0, _021E6B94 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E6B30
_021E6ADA:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _021E6AF2
	strb r2, [r5, r6]
	mov r0, #2
	add r3, #0xe5
	strb r0, [r5, r3]
	ldr r0, _021E6B94 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E6B30
_021E6AF2:
	mov r1, #2
	tst r0, r1
	beq _021E6B30
	add r0, r3, #0
	add r0, #0xe1
	ldrb r0, [r5, r0]
	sub r1, r0, #1
	add r0, r3, #0
	add r0, #0xe3
	strb r1, [r5, r0]
	add r1, r3, #0
	strb r2, [r5, r6]
	mov r6, #0xc
	mul r6, r4
	ldr r4, _021E6B90 ; =ov53_021E8604
	add r1, #0xe5
	mov r0, #2
	strb r0, [r5, r1]
	add r3, #0xe3
	ldrb r3, [r5, r3]
	add r4, r4, r6
	ldr r0, [r5, #0x18]
	lsl r3, r3, #2
	ldr r3, [r3, r4]
	mov r1, #5
	mov r2, #3
	bl ScheduleSetBgPosText
	ldr r0, _021E6B94 ; =SEQ_SE_DP_SELECT
	bl PlaySE
_021E6B30:
	ldr r0, _021E6B84 ; =0x00000166
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _021E6B78
	sub r1, r0, #2
	ldrb r1, [r5, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strb r2, [r5, r1]
	ldrb r2, [r5, r1]
	sub r1, r0, #1
	ldrb r1, [r5, r1]
	cmp r2, r1
	bls _021E6B78
	add r1, r0, #1
	ldrb r2, [r5, r1]
	mov r1, #1
	add r3, r2, #0
	eor r3, r1
	add r2, r0, #1
	strb r3, [r5, r2]
	sub r3, r0, #2
	mov r2, #0
	strb r2, [r5, r3]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021E6B70
	mov r0, #5
	bl ToggleBgLayer
	b _021E6B78
_021E6B70:
	mov r0, #5
	add r1, r2, #0
	bl ToggleBgLayer
_021E6B78:
	add r0, r7, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6B80: .word ov53_021E8650
_021E6B84: .word 0x00000166
_021E6B88: .word gSystem + 0x40
_021E6B8C: .word 0x00000163
_021E6B90: .word ov53_021E8604
_021E6B94: .word SEQ_SE_DP_SELECT
_021E6B98: .word gSystem
	thumb_func_end ov53_021E6988

	thumb_func_start ov53_021E6B9C
ov53_021E6B9C: ; 0x021E6B9C
	push {r3, r4}
	mov r2, #0x1f
	add r4, r0, #0
	asr r3, r0, #5
	and r4, r2
	and r3, r2
	asr r0, r0, #0xa
	add r4, r4, r1
	add r3, r3, r1
	add r0, r0, r1
	cmp r4, #0x1f
	ble _021E6BB8
	add r4, r2, #0
	b _021E6BBE
_021E6BB8:
	cmp r4, #0
	bge _021E6BBE
	mov r4, #0
_021E6BBE:
	cmp r3, #0x1f
	ble _021E6BC6
	mov r3, #0x1f
	b _021E6BCC
_021E6BC6:
	cmp r3, #0
	bge _021E6BCC
	mov r3, #0
_021E6BCC:
	cmp r0, #0x1f
	ble _021E6BD4
	mov r0, #0x1f
	b _021E6BDA
_021E6BD4:
	cmp r0, #0
	bge _021E6BDA
	mov r0, #0
_021E6BDA:
	lsl r1, r0, #0xa
	lsl r0, r3, #5
	orr r0, r1
	orr r0, r4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov53_021E6B9C

	thumb_func_start ov53_021E6BEC
ov53_021E6BEC: ; 0x021E6BEC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _021E6C9C ; =0x00000163
	add r6, r1, #0
	ldrb r0, [r5, r0]
	mov r4, #0
	mov r1, #1
	cmp r0, #0
	beq _021E6C06
	cmp r0, #1
	beq _021E6C06
	add r1, r4, #0
_021E6C06:
	cmp r1, #0
	bne _021E6C0E
	bl GF_AssertFail
_021E6C0E:
	cmp r6, #0
	bne _021E6C2E
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	add r1, r2, #1
	str r1, [r5, r0]
	mov r0, #0xa
	mul r0, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	lsl r0, r0, #3
	asr r4, r0, #0xc
	b _021E6C36
_021E6C2E:
	mov r0, #0x5a
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E6C36:
	ldr r0, _021E6CA0 ; =0x00000136
	lsl r1, r4, #0x18
	ldrh r0, [r5, r0]
	asr r1, r1, #0x18
	bl ov53_021E6B9C
	add r1, sp, #0
	strh r0, [r1]
	ldr r0, _021E6CA4 ; =0x00001CFF
	mov r1, #0
	bl ov53_021E6B9C
	add r1, sp, #0
	strh r0, [r1, #2]
	ldr r3, _021E6C9C ; =0x00000163
	mov r0, #6
	ldrb r3, [r5, r3]
	add r1, sp, #0
	mov r2, #4
	lsl r4, r3, #2
	ldr r3, _021E6CA8 ; =ov53_021E8508
	ldr r3, [r3, r4]
	lsl r3, r3, #0x11
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	ldr r0, _021E6CA0 ; =0x00000136
	add r1, sp, #0
	ldrh r2, [r5, r0]
	add r0, #0x2d
	strh r2, [r1]
	ldr r2, _021E6CAC ; =0x0000739B
	strh r2, [r1, #2]
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6C82
	mov r3, #1
	b _021E6C84
_021E6C82:
	mov r3, #0
_021E6C84:
	lsl r4, r3, #2
	ldr r3, _021E6CA8 ; =ov53_021E8508
	mov r0, #6
	ldr r3, [r3, r4]
	add r1, sp, #0
	lsl r3, r3, #0x11
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E6C9C: .word 0x00000163
_021E6CA0: .word 0x00000136
_021E6CA4: .word 0x00001CFF
_021E6CA8: .word ov53_021E8508
_021E6CAC: .word 0x0000739B
	thumb_func_end ov53_021E6BEC

	thumb_func_start ov53_021E6CB0
ov53_021E6CB0: ; 0x021E6CB0
	push {r3, lr}
	ldr r1, _021E6CD8 ; =0x00000136
	mov r2, #4
	ldrh r1, [r0, r1]
	add r0, sp, #0
	mov r3, #0x18
	strh r1, [r0]
	ldr r1, _021E6CDC ; =0x0000739B
	strh r1, [r0, #2]
	mov r0, #6
	add r1, sp, #0
	bl BG_LoadPlttData
	mov r0, #6
	add r1, sp, #0
	mov r2, #4
	mov r3, #0x1c
	bl BG_LoadPlttData
	pop {r3, pc}
	.balign 4, 0
_021E6CD8: .word 0x00000136
_021E6CDC: .word 0x0000739B
	thumb_func_end ov53_021E6CB0

	thumb_func_start ov53_021E6CE0
ov53_021E6CE0: ; 0x021E6CE0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r3, _021E6DD8 ; =ov53_021E8530
	add r5, r0, #0
	mov r4, #0
	add r2, sp, #0
	mov r1, #0xc
_021E6CEE:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E6CEE
	ldr r0, _021E6DDC ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6D38
	add r0, sp, #0
	bl sub_02025224
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021E6DD0
	ldr r0, _021E6DE0 ; =0x00000163
	mov r1, #1
	strb r6, [r5, r0]
	add r2, r0, #3
	strb r1, [r5, r2]
	mov r2, #2
	add r0, r0, #2
	strb r2, [r5, r0]
	add r0, r5, #0
	bl ov53_021E6BEC
	ldr r0, _021E6DE4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #0x5f
	lsl r0, r0, #2
	str r6, [r5, r0]
	mov r4, #1
	b _021E6DD0
_021E6D38:
	ldr r0, _021E6DE8 ; =0x00000162
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021E6D5E
	ldr r0, _021E6DEC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x31
	tst r0, r1
	beq _021E6DD0
	ldr r0, _021E6DE4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	ldr r0, _021E6DE8 ; =0x00000162
	mov r1, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	bl ov53_021E6BEC
	b _021E6DD0
_021E6D5E:
	add r0, r5, #0
	mov r1, #0
	bl ov53_021E6BEC
	ldr r0, _021E6DEC ; =gSystem
	mov r1, #0x20
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E6D84
	ldr r0, _021E6DE0 ; =0x00000163
	ldrb r1, [r5, r0]
	cmp r1, #0
	beq _021E6DD0
	sub r1, r1, #1
	strb r1, [r5, r0]
	ldr r0, _021E6DE4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E6DD0
_021E6D84:
	mov r1, #0x10
	tst r1, r0
	beq _021E6DA4
	ldr r0, _021E6DE0 ; =0x00000163
	sub r1, r0, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r5, r0]
	sub r1, r1, #1
	cmp r2, r1
	beq _021E6DD0
	add r1, r2, #1
	strb r1, [r5, r0]
	ldr r0, _021E6DE4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E6DD0
_021E6DA4:
	mov r1, #1
	tst r0, r1
	beq _021E6DD0
	ldr r0, _021E6DE8 ; =0x00000162
	mov r2, #0
	strb r2, [r5, r0]
	add r2, r0, #4
	strb r1, [r5, r2]
	mov r2, #2
	add r0, r0, #3
	strb r2, [r5, r0]
	add r0, r5, #0
	bl ov53_021E6BEC
	ldr r0, _021E6DE4 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	ldr r0, _021E6DE0 ; =0x00000163
	mov r4, #1
	ldrb r1, [r5, r0]
	add r0, #0x19
	str r1, [r5, r0]
_021E6DD0:
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E6DD8: .word ov53_021E8530
_021E6DDC: .word gSystem + 0x40
_021E6DE0: .word 0x00000163
_021E6DE4: .word SEQ_SE_DP_SELECT
_021E6DE8: .word 0x00000162
_021E6DEC: .word gSystem
	thumb_func_end ov53_021E6CE0

	thumb_func_start ov53_021E6DF0
ov53_021E6DF0: ; 0x021E6DF0
	mov r1, #5
	mov r2, #0
	lsl r1, r1, #6
	str r2, [r0, r1]
	add r1, r1, #4
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov53_021E6DF0

	thumb_func_start ov53_021E6E00
ov53_021E6E00: ; 0x021E6E00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	mov r1, #0x51
	add r2, r0, #0
	lsl r1, r1, #2
	ldr r0, [r2, r1]
	mov r7, #0
	cmp r0, #0
	beq _021E6E16
	sub r0, r0, #1
	b _021E6E22
_021E6E16:
	sub r0, r1, #4
	ldr r0, [r2, r0]
	add r3, r0, #1
	sub r0, r1, #4
	str r3, [r2, r0]
	mov r0, #8
_021E6E22:
	mov r3, #0x4d
	lsl r3, r3, #2
	str r0, [r2, r1]
	ldrh r0, [r2, r3]
	cmp r0, #0
	bne _021E6E34
	ldr r6, _021E6E74 ; =ov53_021E859C
	add r5, sp, #0x28
	b _021E6E38
_021E6E34:
	ldr r6, _021E6E78 ; =ov53_021E85B4
	add r5, sp, #0x10
_021E6E38:
	add r4, r5, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	add r3, #0xc
	stmia r5!, {r0, r1}
	ldr r0, [r2, r3]
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0xff
	bne _021E6E56
	mov r7, #1
	b _021E6E6C
_021E6E56:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r2]
	mov r3, #1
	str r0, [sp, #0xc]
	ldr r2, [r2, #0x18]
	mov r0, #0x78
	bl GfGfxLoader_LoadCharData
_021E6E6C:
	add r0, r7, #0
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6E74: .word ov53_021E859C
_021E6E78: .word ov53_021E85B4
	thumb_func_end ov53_021E6E00

	thumb_func_start ov53_021E6E7C
ov53_021E6E7C: ; 0x021E6E7C
	push {r3, r4, lr}
	sub sp, #0x1c
	add r0, sp, #0xc
	add r1, sp, #0
	mov r4, #msg_0219_00001
	bl GF_RTC_CopyDateTime
	ldr r0, [sp]
	ldr r3, [sp, #4]
	mov r1, #0x64
	add r2, r0, #0
	mul r2, r1
	add r0, r3, r2
	lsl r1, r1, #2
	cmp r0, r1
	blo _021E6EA2
	ldr r1, _021E6EE4 ; =0x00000423
	cmp r0, r1
	bls _021E6EDC
_021E6EA2:
	ldr r1, _021E6EE8 ; =0x0000044C
	cmp r0, r1
	blo _021E6EB2
	ldr r1, _021E6EEC ; =0x00000617
	cmp r0, r1
	bhi _021E6EB2
	mov r4, #msg_0219_00002
	b _021E6EDC
_021E6EB2:
	mov r1, #0x19
	lsl r1, r1, #6
	cmp r0, r1
	blo _021E6EC4
	ldr r1, _021E6EF0 ; =0x00000743
	cmp r0, r1
	bhi _021E6EC4
	mov r4, #msg_0219_00003
	b _021E6EDC
_021E6EC4:
	ldr r1, _021E6EF4 ; =0x0000076C
	cmp r0, r1
	blo _021E6ED4
	ldr r1, _021E6EF8 ; =0x00000937
	cmp r0, r1
	bhi _021E6ED4
	mov r4, #msg_0219_00004
	b _021E6EDC
_021E6ED4:
	ldr r1, _021E6EFC ; =0x00000167
	cmp r0, r1
	bhi _021E6EDC
	mov r4, #msg_0219_00005
_021E6EDC:
	add r0, r4, #0
	add sp, #0x1c
	pop {r3, r4, pc}
	nop
_021E6EE4: .word 0x00000423
_021E6EE8: .word 0x0000044C
_021E6EEC: .word 0x00000617
_021E6EF0: .word 0x00000743
_021E6EF4: .word 0x0000076C
_021E6EF8: .word 0x00000937
_021E6EFC: .word 0x00000167
	thumb_func_end ov53_021E6E7C

	thumb_func_start ov53_021E6F00
ov53_021E6F00: ; 0x021E6F00
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldrh r3, [r4, r0]
	cmp r3, #0
	beq _021E6F18
	cmp r3, #1
	beq _021E6F2C
	cmp r3, #2
	beq _021E6F7E
	b _021E6F86
_021E6F18:
	mov r1, #1
	strh r1, [r4, r0]
	mov r1, #6
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021E6F8C ; =ov53_021E853C
	add r0, r0, #2
	ldrsh r1, [r1, r3]
	strh r1, [r4, r0]
	b _021E6F86
_021E6F2C:
	mov r3, #6
	mul r3, r2
	ldr r2, _021E6F90 ; =ov53_021E853C + 4
	add r5, r0, #2
	ldrsh r2, [r2, r3]
	ldrsh r5, [r4, r5]
	add r6, r5, r2
	add r5, r0, #2
	strh r6, [r4, r5]
	cmp r2, #0
	ble _021E6F58
	ldr r2, _021E6F94 ; =ov53_021E853C + 2
	ldrsh r3, [r2, r3]
	add r2, r5, #0
	ldrsh r2, [r4, r2]
	cmp r2, r3
	blt _021E6F6C
	add r2, r5, #0
	strh r3, [r4, r2]
	mov r2, #2
	strh r2, [r4, r0]
	b _021E6F6C
_021E6F58:
	ldr r2, _021E6F94 ; =ov53_021E853C + 2
	ldrsh r3, [r2, r3]
	add r2, r5, #0
	ldrsh r2, [r4, r2]
	cmp r2, r3
	bgt _021E6F6C
	add r2, r5, #0
	strh r3, [r4, r2]
	mov r2, #2
	strh r2, [r4, r0]
_021E6F6C:
	ldr r3, _021E6F98 ; =0x00000176
	lsl r1, r1, #0x18
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x18]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
	b _021E6F86
_021E6F7E:
	mov r1, #0
	strh r1, [r4, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6F86:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E6F8C: .word ov53_021E853C
_021E6F90: .word ov53_021E853C + 4
_021E6F94: .word ov53_021E853C + 2
_021E6F98: .word 0x00000176
	thumb_func_end ov53_021E6F00

	thumb_func_start ov53_021E6F9C
ov53_021E6F9C: ; 0x021E6F9C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	mov r5, #0
	cmp r1, #0x7e
	bls _021E6FAE
	bl _021E7CF8
_021E6FAE:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6FBA: ; jump table
	.short _021E70B8 - _021E6FBA - 2 ; case 0
	.short _021E7138 - _021E6FBA - 2 ; case 1
	.short _021E7154 - _021E6FBA - 2 ; case 2
	.short _021E7188 - _021E6FBA - 2 ; case 3
	.short _021E719C - _021E6FBA - 2 ; case 4
	.short _021E71CE - _021E6FBA - 2 ; case 5
	.short _021E71EE - _021E6FBA - 2 ; case 6
	.short _021E70E4 - _021E6FBA - 2 ; case 7
	.short _021E7226 - _021E6FBA - 2 ; case 8
	.short _021E7274 - _021E6FBA - 2 ; case 9
	.short _021E7CF8 - _021E6FBA - 2 ; case 10
	.short _021E7284 - _021E6FBA - 2 ; case 11
	.short _021E7298 - _021E6FBA - 2 ; case 12
	.short _021E72AC - _021E6FBA - 2 ; case 13
	.short _021E72C0 - _021E6FBA - 2 ; case 14
	.short _021E72D4 - _021E6FBA - 2 ; case 15
	.short _021E72F0 - _021E6FBA - 2 ; case 16
	.short _021E7304 - _021E6FBA - 2 ; case 17
	.short _021E7320 - _021E6FBA - 2 ; case 18
	.short _021E733C - _021E6FBA - 2 ; case 19
	.short _021E735C - _021E6FBA - 2 ; case 20
	.short _021E7378 - _021E6FBA - 2 ; case 21
	.short _021E739C - _021E6FBA - 2 ; case 22
	.short _021E73B0 - _021E6FBA - 2 ; case 23
	.short _021E73E2 - _021E6FBA - 2 ; case 24
	.short _021E7CF8 - _021E6FBA - 2 ; case 25
	.short _021E7CF8 - _021E6FBA - 2 ; case 26
	.short _021E7414 - _021E6FBA - 2 ; case 27
	.short _021E7440 - _021E6FBA - 2 ; case 28
	.short _021E7456 - _021E6FBA - 2 ; case 29
	.short _021E7CF8 - _021E6FBA - 2 ; case 30
	.short _021E7CF8 - _021E6FBA - 2 ; case 31
	.short _021E7CF8 - _021E6FBA - 2 ; case 32
	.short _021E7CF8 - _021E6FBA - 2 ; case 33
	.short _021E7484 - _021E6FBA - 2 ; case 34
	.short _021E74CE - _021E6FBA - 2 ; case 35
	.short _021E74DE - _021E6FBA - 2 ; case 36
	.short _021E74F2 - _021E6FBA - 2 ; case 37
	.short _021E7504 - _021E6FBA - 2 ; case 38
	.short _021E7516 - _021E6FBA - 2 ; case 39
	.short _021E7528 - _021E6FBA - 2 ; case 40
	.short _021E753A - _021E6FBA - 2 ; case 41
	.short _021E754C - _021E6FBA - 2 ; case 42
	.short _021E756A - _021E6FBA - 2 ; case 43
	.short _021E7590 - _021E6FBA - 2 ; case 44
	.short _021E75E8 - _021E6FBA - 2 ; case 45
	.short _021E760C - _021E6FBA - 2 ; case 46
	.short _021E762A - _021E6FBA - 2 ; case 47
	.short _021E7672 - _021E6FBA - 2 ; case 48
	.short _021E7682 - _021E6FBA - 2 ; case 49
	.short _021E7694 - _021E6FBA - 2 ; case 50
	.short _021E76A8 - _021E6FBA - 2 ; case 51
	.short _021E76DE - _021E6FBA - 2 ; case 52
	.short _021E771C - _021E6FBA - 2 ; case 53
	.short _021E775E - _021E6FBA - 2 ; case 54
	.short _021E77A2 - _021E6FBA - 2 ; case 55
	.short _021E77B4 - _021E6FBA - 2 ; case 56
	.short _021E77C6 - _021E6FBA - 2 ; case 57
	.short _021E77D8 - _021E6FBA - 2 ; case 58
	.short _021E77E8 - _021E6FBA - 2 ; case 59
	.short _021E77FA - _021E6FBA - 2 ; case 60
	.short _021E7818 - _021E6FBA - 2 ; case 61
	.short _021E7842 - _021E6FBA - 2 ; case 62
	.short _021E7850 - _021E6FBA - 2 ; case 63
	.short _021E7892 - _021E6FBA - 2 ; case 64
	.short _021E78AA - _021E6FBA - 2 ; case 65
	.short _021E78C2 - _021E6FBA - 2 ; case 66
	.short _021E7920 - _021E6FBA - 2 ; case 67
	.short _021E794C - _021E6FBA - 2 ; case 68
	.short _021E797C - _021E6FBA - 2 ; case 69
	.short _021E79AC - _021E6FBA - 2 ; case 70
	.short _021E79DE - _021E6FBA - 2 ; case 71
	.short _021E7A3C - _021E6FBA - 2 ; case 72
	.short _021E7CF8 - _021E6FBA - 2 ; case 73
	.short _021E7CF8 - _021E6FBA - 2 ; case 74
	.short _021E7CF8 - _021E6FBA - 2 ; case 75
	.short _021E7CF8 - _021E6FBA - 2 ; case 76
	.short _021E7CF8 - _021E6FBA - 2 ; case 77
	.short _021E7CF8 - _021E6FBA - 2 ; case 78
	.short _021E7CF8 - _021E6FBA - 2 ; case 79
	.short _021E7CF8 - _021E6FBA - 2 ; case 80
	.short _021E7CF8 - _021E6FBA - 2 ; case 81
	.short _021E7CF8 - _021E6FBA - 2 ; case 82
	.short _021E7CF8 - _021E6FBA - 2 ; case 83
	.short _021E7CF8 - _021E6FBA - 2 ; case 84
	.short _021E7CF8 - _021E6FBA - 2 ; case 85
	.short _021E7CF8 - _021E6FBA - 2 ; case 86
	.short _021E7CF8 - _021E6FBA - 2 ; case 87
	.short _021E7CF8 - _021E6FBA - 2 ; case 88
	.short _021E7CF8 - _021E6FBA - 2 ; case 89
	.short _021E7CF8 - _021E6FBA - 2 ; case 90
	.short _021E7CF8 - _021E6FBA - 2 ; case 91
	.short _021E7CF8 - _021E6FBA - 2 ; case 92
	.short _021E7A52 - _021E6FBA - 2 ; case 93
	.short _021E7A64 - _021E6FBA - 2 ; case 94
	.short _021E7A76 - _021E6FBA - 2 ; case 95
	.short _021E7AA4 - _021E6FBA - 2 ; case 96
	.short _021E7B30 - _021E6FBA - 2 ; case 97
	.short _021E7B50 - _021E6FBA - 2 ; case 98
	.short _021E7B6E - _021E6FBA - 2 ; case 99
	.short _021E7BA0 - _021E6FBA - 2 ; case 100
	.short _021E7BBE - _021E6FBA - 2 ; case 101
	.short _021E7C20 - _021E6FBA - 2 ; case 102
	.short _021E7C2E - _021E6FBA - 2 ; case 103
	.short _021E7CF8 - _021E6FBA - 2 ; case 104
	.short _021E7CF8 - _021E6FBA - 2 ; case 105
	.short _021E7CF8 - _021E6FBA - 2 ; case 106
	.short _021E7CF8 - _021E6FBA - 2 ; case 107
	.short _021E7CF8 - _021E6FBA - 2 ; case 108
	.short _021E7CF8 - _021E6FBA - 2 ; case 109
	.short _021E7C40 - _021E6FBA - 2 ; case 110
	.short _021E7C5E - _021E6FBA - 2 ; case 111
	.short _021E7CF8 - _021E6FBA - 2 ; case 112
	.short _021E7CF8 - _021E6FBA - 2 ; case 113
	.short _021E7CF8 - _021E6FBA - 2 ; case 114
	.short _021E7CF8 - _021E6FBA - 2 ; case 115
	.short _021E7CF8 - _021E6FBA - 2 ; case 116
	.short _021E7CF8 - _021E6FBA - 2 ; case 117
	.short _021E7CF8 - _021E6FBA - 2 ; case 118
	.short _021E7CF8 - _021E6FBA - 2 ; case 119
	.short _021E7C6C - _021E6FBA - 2 ; case 120
	.short _021E7CB4 - _021E6FBA - 2 ; case 121
	.short _021E7CF8 - _021E6FBA - 2 ; case 122
	.short _021E7CC0 - _021E6FBA - 2 ; case 123
	.short _021E7CC6 - _021E6FBA - 2 ; case 124
	.short _021E7CD8 - _021E6FBA - 2 ; case 125
	.short _021E7CEE - _021E6FBA - 2 ; case 126
_021E70B8:
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	mov r1, #SEQ_GS_POKEMON_THEME>>4
	mov r0, #2
	lsl r1, r1, #4
	mov r2, #1
	bl sub_02004EC4
	mov r0, #SEQ_GS_POKEMON_THEME>>4
	lsl r0, r0, #4
	add r1, r5, #0
	bl StopBGM
	ldr r0, _021E7408 ; =SEQ_GS_STARTING
	bl PlayBGM
	mov r0, #7
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E70E4:
	add r1, r5, #0
	bl ov53_021E6824
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	add r0, r4, #0
	add r1, r5, #0
	bl ov53_021E67C4
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #4
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
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7138:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E71F6
	add r0, r4, #0
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E71F6
	mov r0, #2
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7154:
	mov r1, #7
	mov r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E71F6
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #3
	str r0, [r4, #0xc]
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2c
	mov r2, #0x2d
	mov r3, #0x2e
	bl ov53_021E64C4
	ldr r0, _021E740C ; =0x00000162
	add r1, r5, #0
	strb r1, [r4, r0]
	add r0, r0, #1
	strb r1, [r4, r0]
	bl _021E7CF8
_021E7188:
	add r1, r5, #0
	bl ov53_021E6988
	sub r1, r5, #1
	cmp r0, r1
	beq _021E71F6
	mov r0, #4
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E719C:
	mov r1, #7
	mov r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E71F6
	add r0, r4, #0
	bl ov53_021E65B4
	mov r0, #4
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #5
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #5
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E71CE:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #6
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E71EE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _021E71FA
_021E71F6:
	bl _021E7CF8
_021E71FA:
	ldr r0, _021E7410 ; =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E720E
	cmp r0, #1
	beq _021E7216
	cmp r0, #2
	beq _021E721E
	bl _021E7CF8
_021E720E:
	mov r0, #8
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7216:
	mov r0, #0x22
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E721E:
	mov r0, #0x2c
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7226:
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E67C4
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #4
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
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #9
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7274:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7348
	mov r0, #0xb
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7284:
	mov r1, #9
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xc
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7298:
	mov r1, #0xa
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xd
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72AC:
	mov r1, #0xb
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xe
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72C0:
	mov r1, #0xc
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	mov r0, #0xf
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72D4:
	mov r1, #0x17
	mov r2, #2
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x10
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E72F0:
	mov r1, #msg_0219_00025
	add r2, r5, #0
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7348
	mov r0, #0x11
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7304:
	mov r1, #0xd
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E66A8
	mov r0, #0x12
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7320:
	mov r1, #0xe
	mov r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7348
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	mov r0, #0x13
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E733C:
	mov r1, #0xf
	add r2, r5, #0
	bl ov53_021E64B4
	cmp r0, #1
	beq _021E734C
_021E7348:
	bl _021E7CF8
_021E734C:
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E66A8
	mov r0, #0x14
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E735C:
	mov r1, #0x10
	mov r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7462
	add r0, r4, #0
	mov r1, #4
	bl ov53_021E66A8
	mov r0, #0x15
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7378:
	mov r1, #0x11
	mov r2, #3
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7462
	mov r0, #0x16
	str r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E66A8
	bl _021E7CF8
_021E739C:
	mov r1, #msg_0219_00026
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7462
	mov r0, #0x17
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E73B0:
	add r1, r5, #0
	bl ov53_021E7E08
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl ov53_021E816C
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #219
	mov r2, #msg_0219_00061
	mov r3, #msg_0219_00062
	bl ov53_021E81F4
	mov r0, #0x18
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E73E2:
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov53_021E8248
	cmp r0, #1
	beq _021E73F8
	cmp r0, #2
	beq _021E7400
	bl _021E7CF8
_021E73F8:
	mov r0, #0x1b
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7400:
	mov r0, #0x1d
	str r0, [r4, #0xc]
	bl _021E7CF8
	.balign 4, 0
_021E7408: .word SEQ_GS_STARTING
_021E740C: .word 0x00000162
_021E7410: .word 0x00000163
_021E7414:
	mov r1, #6
	mov r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E7462
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x1c
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7440:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7462
	add r0, r4, #0
	bl ov53_021E7D58
	mov r0, #7
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7456:
	mov r1, #6
	mov r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	beq _021E7466
_021E7462:
	bl _021E7CF8
_021E7466:
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E7E08
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	bl ov53_021E7D58
	mov r0, #8
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E7484:
	mov r1, #5
	bl ov53_021E66A8
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E67C4
	add r0, r4, #0
	bl ov53_021E7D58
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #4
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
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x23
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74CE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7572
	mov r0, #0x24
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74DE:
	mov r1, #0x1c
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x25
	str r0, [r4, #0xc]
	bl _021E7CF8
_021E74F2:
	mov r1, #0x1d
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x26
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7504:
	mov r1, #0x1e
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x27
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7516:
	mov r1, #0x1f
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x28
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7528:
	mov r1, #0x20
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x29
	str r0, [r4, #0xc]
	b _021E7CF8
_021E753A:
	mov r1, #0x21
	mov r2, #1
	bl ov53_021E64B4
	cmp r0, #1
	bne _021E7572
	mov r0, #0x2a
	str r0, [r4, #0xc]
	b _021E7CF8
_021E754C:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x2b
	str r0, [r4, #0xc]
	b _021E7CF8
_021E756A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _021E7574
_021E7572:
	b _021E7CF8
_021E7574:
	add r0, r4, #0
	bl ov53_021E7D58
	add r0, r4, #0
	add r1, r5, #0
	bl ov53_021E7E08
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7590:
	bl ov53_021E7D58
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	add r0, r4, #0
	add r1, r5, #0
	bl ov53_021E66A8
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #3
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x2d
	str r0, [r4, #0xc]
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	b _021E7CF8
_021E75E8:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E76A0
	add r0, r4, #0
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E76A0
	mov r0, #0x2e
	str r0, [r4, #0xc]
	bl ov53_021E6E7C
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	b _021E7CF8
_021E760C:
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E76A0
	add r0, r5, #0
	mov r1, #6
	bl GF_SndStartFadeOutBGM
	mov r0, #0x2f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E762A:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _021E76A0
	ldr r0, _021E7938 ; =SEQ_GS_STARTING
	add r1, r5, #0
	bl StopBGM
	ldr r0, _021E793C ; =SEQ_GS_STARTING2
	bl PlayBGM
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	bl ov53_021E66E8
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #1
	add r1, r0, #0
	bl ToggleBgLayer
	add r1, r5, #0
	mov r0, #1
	add r2, r1, #0
	str r0, [sp]
	mov r0, #0x10
	sub r2, #0x10
	mov r3, #0x1a
	bl sub_0200B484
	mov r0, #0x30
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7672:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _021E76A0
	mov r0, #0x31
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7682:
	mov r1, #msg_0219_00006
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E76A0
	mov r0, #0x32
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7694:
	mov r1, #1
	add r2, r5, #0
	bl ov53_021E6F00
	cmp r0, #1
	beq _021E76A2
_021E76A0:
	b _021E7CF8
_021E76A2:
	mov r0, #0x33
	str r0, [r4, #0xc]
	b _021E7CF8
_021E76A8:
	mov r1, #msg_0219_00034
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E77AC
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #5
	bl sub_02024A14
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x34
	str r0, [r4, #0xc]
	b _021E7CF8
_021E76DE:
	mov r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E77AC
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	add r1, r5, #0
	mov r2, #0x10
	mov r3, #0x1b
	bl sub_0200B484
	mov r0, #2
	str r0, [sp]
	mov r0, #4
	add r1, r5, #0
	mov r2, #0x10
	mov r3, #0x1d
	bl sub_0200B484
	ldr r0, _021E7940 ; =SEQ_SE_DP_BOWA2
	bl PlaySE
	mov r0, #5
	add r1, r5, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	mov r0, #0x35
	str r0, [r4, #0xc]
	b _021E7CF8
_021E771C:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #1
	bne _021E77AC
	mov r0, #2
	bl sub_0200B5C0
	cmp r0, #1
	bne _021E77AC
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #4
	bl sub_02024A14
	mov r2, #5
	mov r1, #0x10
	lsl r2, r2, #6
	str r1, [r4, r2]
	ldr r0, _021E7944 ; =0x04000050
	ldr r2, [r4, r2]
	bl G2x_SetBlendBrightness_
	mov r0, #0x36
	str r0, [r4, #0xc]
	b _021E7CF8
_021E775E:
	add r0, #0xec
	ldr r0, [r0]
	bl sub_02024B68
	cmp r0, #0
	bne _021E77AC
	mov r2, #5
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	mov r1, #0x10
	sub r0, r0, #1
	str r0, [r4, r2]
	ldr r0, _021E7944 ; =0x04000050
	ldr r2, [r4, r2]
	bl G2x_SetBlendBrightness_
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E77AC
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	mov r0, #SPECIES_MARILL
	add r1, r5, #0
	bl PlayCry
	mov r0, #0x37
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77A2:
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #1
	beq _021E77AE
_021E77AC:
	b _021E7CF8
_021E77AE:
	mov r0, #0x38
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77B4:
	mov r1, #msg_0219_00035
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x39
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77C6:
	mov r1, #0x65
	mov r2, #1
	bl ov53_021E5EDC
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3a
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77D8:
	mov r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3b
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77E8:
	mov r1, #1
	add r2, r1, #0
	bl ov53_021E6F00
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3c
	str r0, [r4, #0xc]
	b _021E7CF8
_021E77FA:
	mov r1, #msg_0219_00036
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3d
	str r0, [r4, #0xc]
	ldr r0, _021E7948 ; =0x00000163
	add r1, r5, #0
	strb r1, [r4, r0]
	mov r1, #2
	sub r0, r0, #2
	strb r1, [r4, r0]
	b _021E7CF8
_021E7818:
	mov r1, #msg_0219_00037
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3e
	str r0, [r4, #0xc]
	mov r0, #6
	str r0, [sp]
	add r1, r5, #0
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r1, #0
	bl BeginNormalPaletteFade
	b _021E7CF8
_021E7842:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x3f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7850:
	add r1, r5, #0
	bl ov53_021E7E08
	mov r0, #4
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #4
	bl ov53_021E67C4
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E80B8
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x40
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7892:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E78B2
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0x19
	strb r1, [r4, r0]
	mov r0, #0x41
	str r0, [r4, #0xc]
	b _021E7CF8
_021E78AA:
	bl ov53_021E6CE0
	cmp r0, #0
	bne _021E78B4
_021E78B2:
	b _021E7CF8
_021E78B4:
	mov r0, #0x42
	str r0, [r4, #0xc]
	ldr r0, _021E7948 ; =0x00000163
	ldrb r1, [r4, r0]
	sub r0, #0x2f
	strh r1, [r4, r0]
	b _021E7CF8
_021E78C2:
	str r5, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r3, _021E7948 ; =0x00000163
	mov r2, #1
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0x18]
	mov r1, #7
	eor r3, r2
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl BgCommitTilemapBufferToVram
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl BgCommitTilemapBufferToVram
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov53_021E80B8
	mov r0, #0x4d
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7914
	mov r1, #msg_0219_00038
	b _021E7916
_021E7914:
	mov r1, #msg_0219_00039
_021E7916:
	add r0, #0x3c
	str r1, [r4, r0]
	mov r0, #0x43
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7920:
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E79B8
	mov r0, #0x44
	str r0, [r4, #0xc]
	b _021E7CF8
	nop
_021E7938: .word SEQ_GS_STARTING
_021E793C: .word SEQ_GS_STARTING2
_021E7940: .word SEQ_SE_DP_BOWA2
_021E7944: .word 0x04000050
_021E7948: .word 0x00000163
_021E794C:
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #1
	bl ov53_021E6908
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E6824
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x30
	add r3, r5, #0
	bl ov53_021E64C4
	mov r0, #0x45
	str r0, [r4, #0xc]
	ldr r0, _021E7C80 ; =0x00000163
	add r1, r5, #0
	strb r1, [r4, r0]
	b _021E7CF8
_021E797C:
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r0, r4, #0
	add r1, r1, #1
	bl ov53_021E6988
	sub r1, r5, #1
	cmp r0, r1
	beq _021E79B8
	add r0, r4, #0
	bl ov53_021E65B4
	mov r0, #0x46
	str r0, [r4, #0xc]
	b _021E7CF8
_021E79AC:
	ldr r0, _021E7C80 ; =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E79BA
	cmp r0, #1
	beq _021E79C0
_021E79B8:
	b _021E7CF8
_021E79BA:
	mov r0, #0x5d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E79C0:
	mov r0, #0x47
	str r0, [r4, #0xc]
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	b _021E7CF8
_021E79DE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7A6E
	mov r0, #5
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E80B8
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E67C4
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r2, r5, #0
	ldr r0, [r4, #0x18]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	bl ov53_021E6CB0
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x48
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A3C:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7A6E
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #0x3d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A52:
	mov r1, #msg_0219_00040
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7A6E
	mov r0, #0x5e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A64:
	mov r1, #0x28
	bl ov53_021E60CC
	cmp r0, #0
	bne _021E7A70
_021E7A6E:
	b _021E7CF8
_021E7A70:
	mov r0, #0x5f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7A76:
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	bl StringSetEmpty
	mov r1, #0x4d
	lsl r1, r1, #2
	add r0, r1, #0
	ldrh r2, [r4, r1]
	sub r0, #0x14
	ldr r0, [r4, r0]
	sub r1, #0x14
	str r2, [r0, #4]
	ldr r0, _021E7C84 ; =_02102610
	ldr r1, [r4, r1]
	ldr r2, [r4]
	bl OverlayManager_new
	str r0, [r4, #0x14]
	mov r0, #0x60
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7AA4:
	add r0, r5, #0
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
	mov r0, #7
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #1
	bl ToggleBgLayer
	add r2, r5, #0
	ldr r0, [r4, #0x18]
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	bl ov53_021E7D04
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x61
	str r0, [r4, #0xc]
	add r0, r4, #0
	mov r1, #1
	add r2, r5, #0
	bl ov53_021E66E8
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov53_021E80B8
	mov r0, #0x4d
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021E7B28
	mov r1, #msg_0219_00041
	add r0, #0x3c
	str r1, [r4, r0]
	b _021E7CF8
_021E7B28:
	mov r1, #msg_0219_00042
	add r0, #0x3c
	str r1, [r4, r0]
	b _021E7CF8
_021E7B30:
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7B7A
	mov r0, #0x62
	str r0, [r4, #0xc]
	add r0, #0xfe
	add r0, r4, r0
	mov r1, #1
	bl ov53_021E6908
	b _021E7CF8
_021E7B50:
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	add r1, r1, #1
	bl ov53_021E6988
	sub r1, r5, #1
	cmp r0, r1
	beq _021E7B7A
	add r0, r4, #0
	bl ov53_021E65B4
	mov r0, #0x63
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7B6E:
	ldr r0, _021E7C80 ; =0x00000163
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E7B7C
	cmp r0, #1
	beq _021E7B82
_021E7B7A:
	b _021E7CF8
_021E7B7C:
	mov r0, #0x64
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7B82:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x47
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7BA0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x65
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7BBE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	beq _021E7BC8
	b _021E7CF8
_021E7BC8:
	mov r0, #6
	add r1, r5, #0
	bl ToggleBgLayer
	mov r0, #5
	add r1, r5, #0
	bl ToggleBgLayer
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E67C4
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E80B8
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r2, r5, #0
	ldr r0, [r4, #0x18]
	mov r1, #4
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	mov r1, #1
	bl ov53_021E7E08
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x66
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C20:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7CF8
	mov r0, #0x67
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C2E:
	mov r1, #msg_0219_00043
	mov r2, #1
	bl ov53_021E611C
	cmp r0, #1
	bne _021E7CF8
	mov r0, #0x6e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C40:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, r5, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r5, #0
	add r3, r5, #0
	bl BeginNormalPaletteFade
	mov r0, #0x6f
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C5E:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7CF8
	mov r0, #0x78
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7C6C:
	mov r1, #0x4d
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	cmp r1, #0
	bne _021E7C88
	mov r1, #2
	add r2, r5, #0
	bl ov53_021E66E8
	b _021E7C90
	.balign 4, 0
_021E7C80: .word 0x00000163
_021E7C84: .word _02102610
_021E7C88:
	mov r1, #6
	add r2, r5, #0
	bl ov53_021E66E8
_021E7C90:
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
	mov r0, #0x79
	str r0, [r4, #0xc]
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	b _021E7CF8
_021E7CB4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E7CC0
	mov r0, #0x7b
	str r0, [r4, #0xc]
_021E7CC0:
	mov r0, #0x7c
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CC6:
	add r1, r5, #0
	bl ov53_021E7E08
	add r0, r4, #0
	bl ov53_021E6DF0
	mov r0, #0x7d
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CD8:
	mov r1, #0x1e
	bl ov53_021E60CC
	cmp r0, #1
	bne _021E7CF8
	ldr r0, _021E7D00 ; =SEQ_SE_GS_HERO_SHUKUSHOU
	bl PlaySE
	mov r0, #0x7e
	str r0, [r4, #0xc]
	b _021E7CF8
_021E7CEE:
	bl ov53_021E6E00
	cmp r0, #1
	bne _021E7CF8
	mov r5, #1
_021E7CF8:
	add r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E7D00: .word SEQ_SE_GS_HERO_SHUKUSHOU
	thumb_func_end ov53_021E6F9C

	thumb_func_start ov53_021E7D04
ov53_021E7D04: ; 0x021E7D04
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #1
	bl ov53_021E6824
	add r0, r4, #0
	mov r1, #4
	bl ov53_021E67C4
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0x30
	mov r3, #0
	bl ov53_021E64C4
	mov r1, #0
	mov r3, #0x4d
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	lsl r3, r3, #2
	ldrh r3, [r4, r3]
	mov r2, #1
	ldr r0, [r4, #0x18]
	eor r3, r2
	lsl r3, r3, #0x1c
	mov r1, #7
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov53_021E7D04

	thumb_func_start ov53_021E7D58
ov53_021E7D58: ; 0x021E7D58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E7D58

	thumb_func_start ov53_021E7D70
ov53_021E7D70: ; 0x021E7D70
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r4, r5, #0
	ldr r0, [r5, r0]
	mov r1, #0x3c
	add r2, r6, #0
	add r4, #0x6c
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x18]
	ldr r2, _021E7DD4 ; =ov53_021E8518
	add r1, r4, #0
	bl AddWindow
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E7DD8 ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #4
	add r2, r6, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r4, #0
	bl RemoveWindow
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E7DD4: .word ov53_021E8518
_021E7DD8: .word 0x000F0100
	thumb_func_end ov53_021E7D70

	thumb_func_start ov53_021E7DDC
ov53_021E7DDC: ; 0x021E7DDC
	push {r4, lr}
	add r4, r0, #0
	add r4, #0x6c
	ldr r0, [r0, #0x18]
	ldr r2, _021E7E04 ; =ov53_021E8518
	add r1, r4, #0
	bl AddWindow
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	nop
_021E7E04: .word ov53_021E8518
	thumb_func_end ov53_021E7DDC

	thumb_func_start ov53_021E7E08
ov53_021E7E08: ; 0x021E7E08
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _021E7E16
	bl GF_AssertFail
_021E7E16:
	cmp r5, #3
	bhi _021E7E8E
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7E26: ; jump table
	.short _021E7E2E - _021E7E26 - 2 ; case 0
	.short _021E7E52 - _021E7E26 - 2 ; case 1
	.short _021E7E76 - _021E7E26 - 2 ; case 2
	.short _021E7E82 - _021E7E26 - 2 ; case 3
_021E7E2E:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_020248B8
	cmp r0, #1
	beq _021E7E40
	bl GF_AssertFail
_021E7E40:
	add r0, r4, #0
	bl ov53_021E7DDC
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_021E7E52:
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_020248B8
	cmp r0, #0
	beq _021E7E64
	bl GF_AssertFail
_021E7E64:
	add r0, r4, #0
	bl ov53_021E7D70
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
_021E7E76:
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E7E82:
	add r4, #0xe4
	ldr r0, [r4]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_021E7E8E:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov53_021E7E08

	thumb_func_start ov53_021E7E94
ov53_021E7E94: ; 0x021E7E94
	push {r3, lr}
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_020249A8
	cmp r0, #1
	bne _021E7EA6
	mov r0, #1
	pop {r3, pc}
_021E7EA6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov53_021E7E94

	thumb_func_start ov53_021E7EAC
ov53_021E7EAC: ; 0x021E7EAC
	push {r4, lr}
	add r4, r0, #0
	bne _021E7EB6
	bl GF_AssertFail
_021E7EB6:
	add r4, #0xe4
	ldr r0, [r4]
	bl sub_020248B8
	cmp r0, #1
	bne _021E7EC6
	mov r0, #1
	pop {r4, pc}
_021E7EC6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E7EAC

	thumb_func_start ov53_021E7ECC
ov53_021E7ECC: ; 0x021E7ECC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov53_021E7EAC
	cmp r0, #0
	beq _021E7F18
	ldr r0, _021E7F1C ; =ov53_021E8510
	bl sub_02025204
	add r5, r0, #0
	bne _021E7EFA
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E7EFA
	ldr r0, _021E7F20 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
	add r0, r4, #0
	mov r1, #2
	bl ov53_021E7E08
	pop {r3, r4, r5, pc}
_021E7EFA:
	cmp r5, #0
	bne _021E7F10
	add r0, r4, #0
	bl ov53_021E7E94
	cmp r0, #0
	beq _021E7F10
	ldr r0, _021E7F20 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
	pop {r3, r4, r5, pc}
_021E7F10:
	add r0, r4, #0
	mov r1, #3
	bl ov53_021E7E08
_021E7F18:
	pop {r3, r4, r5, pc}
	nop
_021E7F1C: .word ov53_021E8510
_021E7F20: .word gSystem
	thumb_func_end ov53_021E7ECC

	thumb_func_start ov53_021E7F24
ov53_021E7F24: ; 0x021E7F24
	push {r3, r4, r5, r6, lr}
	sub sp, #0x44
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x20
	mov r1, #0x50
	bl GF_CreateVramTransferManager
	mov r0, #0x50
	bl sub_0200CF18
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r4, #0
	add r1, #0xd4
	add r2, sp, #0x24
	ldr r5, _021E7FE0 ; =ov53_021E8764
	str r0, [r1]
	ldmia r5!, {r0, r1}
	add r3, r2, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	ldr r6, _021E7FE4 ; =ov53_021E8750
	stmia r2!, {r0, r1}
	add r5, sp, #0x10
	ldmia r6!, {r0, r1}
	add r2, r5, #0
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r1, r3, #0
	str r0, [r5]
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r3, #0x20
	bl sub_0200CF70
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xd0
	add r1, #0xd4
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0xa
	bl sub_0200CFF4
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_0200CF6C
	mov r2, #3
	mov r1, #0
	lsl r2, r2, #0x12
	bl G2dRenderer_SetSubSurfaceCoords
	ldr r3, _021E7FE8 ; =ov53_021E8740
	add r2, sp, #0
	mov r1, #7
_021E7FC0:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _021E7FC0
	add r0, r4, #0
	add r0, #0xd0
	add r4, #0xd4
	ldr r0, [r0]
	ldr r1, [r4]
	add r2, sp, #0
	bl sub_0200D294
	add sp, #0x44
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E7FE0: .word ov53_021E8764
_021E7FE4: .word ov53_021E8750
_021E7FE8: .word ov53_021E8740
	thumb_func_end ov53_021E7F24

	thumb_func_start ov53_021E7FEC
ov53_021E7FEC: ; 0x021E7FEC
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0xd0
	add r1, #0xd4
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D0E4
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl sub_0200D108
	bl GF_DestroyVramTransferManager
	mov r0, #0
	add r4, #0xd4
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov53_021E7FEC

	thumb_func_start ov53_021E8014
ov53_021E8014: ; 0x021E8014
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _021E80B4 ; =ov53_021E8784
	add r5, r0, #0
	mov r4, #0
	mov r7, #0x28
_021E801E:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xd0
	add r1, #0xd4
	add r2, r4, #0
	mul r2, r7
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r6, r2
	bl sub_0200D2B4
	lsl r1, r4, #2
	add r1, r5, r1
	add r1, #0xd8
	str r0, [r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _021E801E
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe0
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe8
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	bl sub_02024A04
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	add r0, #0xec
	ldr r0, [r0]
	mov r1, #1
	bl sub_0202487C
	add r5, #0xec
	ldr r0, [r5]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E80B4: .word ov53_021E8784
	thumb_func_end ov53_021E8014

	thumb_func_start ov53_021E80B8
ov53_021E80B8: ; 0x021E80B8
	push {r3, r4, r5, lr}
	mov r2, #0
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	bne _021E80C8
	mov r2, #1
	b _021E80DC
_021E80C8:
	cmp r1, #1
	bne _021E80D0
	mov r4, #1
	b _021E80DC
_021E80D0:
	cmp r1, #2
	bne _021E80DA
	mov r2, #1
	add r4, r2, #0
	b _021E80DC
_021E80DA:
	cmp r1, #3
_021E80DC:
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r1, r2, #0
	bl Set2dSpriteVisibleFlag
	add r5, #0xe0
	ldr r0, [r5]
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
	thumb_func_end ov53_021E80B8

	thumb_func_start ov53_021E80F4
ov53_021E80F4: ; 0x021E80F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _021E8108
	bl GF_AssertFail
_021E8108:
	ldr r0, [sp, #0x24]
	mov r1, #0x3c
	str r0, [sp, #4]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x24]
	str r0, [r4]
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	ldr r0, [sp]
	strb r7, [r4, #0x19]
	strb r0, [r4, #0x1a]
	ldr r0, [sp, #0x20]
	strb r0, [r4, #0x18]
	ldr r0, [sp, #4]
	bl ScrStrBufs_new
	str r0, [r4, #0x14]
	add r0, r6, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	bl ov53_021E82BC
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov53_021E80F4

	thumb_func_start ov53_021E814C
ov53_021E814C: ; 0x021E814C
	push {r4, lr}
	add r4, r0, #0
	bne _021E8156
	bl GF_AssertFail
_021E8156:
	add r0, r4, #0
	bl ov53_021E8310
	ldr r0, [r4, #0x14]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E814C

	thumb_func_start ov53_021E816C
ov53_021E816C: ; 0x021E816C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r4, [r5]
	ldrb r6, [r5, #0x19]
	add r7, r1, #0
	mov r0, #0xef
	add r1, r4, #0
	bl NARC_ctor
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0
	mov r2, #4
	lsl r3, r7, #5
	str r0, [sp, #0x10]
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0xc]
	mov r1, #1
	add r3, r6, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0xc]
	mov r1, #0xa
	add r3, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0xc]
	add r1, r6, #0
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #0xc]
	add r1, r6, #0
	bl BgCommitTilemapBufferToVram
	add r0, r6, #0
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [sp, #0x10]
	bl NARC_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov53_021E816C

	thumb_func_start ov53_021E81F4
ov53_021E81F4: ; 0x021E81F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r6, r3, #0
	add r1, #0x1c
	add r3, r4, #0
	bl ov53_021E8330
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x2c
	add r2, r6, #0
	add r3, r4, #0
	bl ov53_021E8330
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf
	bic r1, r0
	strb r1, [r5, #0x1b]
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x1b]
	add r0, r5, #0
	bl ov53_021E8390
	ldrb r0, [r5, #0x19]
	mov r1, #1
	bl ToggleBgLayer
	ldrb r0, [r5, #0x1a]
	mov r1, #1
	bl ToggleBgLayer
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
	thumb_func_end ov53_021E81F4

	thumb_func_start ov53_021E8248
ov53_021E8248: ; 0x021E8248
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x1b]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	beq _021E825A
	cmp r1, #1
	beq _021E827E
	b _021E82B2
_021E825A:
	bl ov53_021E83D4
	cmp r0, #0
	beq _021E82B6
	ldrb r2, [r4, #0x1b]
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #0x1b]
	b _021E82B6
_021E827E:
	bl ov53_021E84D4
	cmp r0, #0
	beq _021E82B6
	ldrb r0, [r4, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _021E8292
	bl GF_AssertFail
_021E8292:
	ldrb r0, [r4, #0x19]
	mov r1, #0
	bl ToggleBgLayer
	ldrb r0, [r4, #0x1a]
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldrb r0, [r4, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	pop {r4, pc}
_021E82B2:
	bl GF_AssertFail
_021E82B6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov53_021E8248

	thumb_func_start ov53_021E82BC
ov53_021E82BC: ; 0x021E82BC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	bne _021E82C8
	bl GF_AssertFail
_021E82C8:
	mov r0, #8
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	add r1, r4, #0
	add r1, #0x1c
	str r0, [sp, #0xc]
	mov r0, #0x50
	str r0, [sp, #0x10]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0xc]
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r4, #0x18]
	add r1, r4, #0
	add r1, #0x2c
	str r0, [sp, #0xc]
	mov r0, #0x80
	str r0, [sp, #0x10]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0xc]
	mov r3, #4
	bl AddWindowParameterized
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov53_021E82BC

	thumb_func_start ov53_021E8310
ov53_021E8310: ; 0x021E8310
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bne _021E831A
	bl GF_AssertFail
_021E831A:
	mov r4, #0
	add r5, #0x1c
_021E831E:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _021E831E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov53_021E8310

	thumb_func_start ov53_021E8330
ov53_021E8330: ; 0x021E8330
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	add r2, r3, #0
	add r4, r1, #0
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r7, r0, #0
	ldr r0, [r5, #0x14]
	ldr r3, [r5]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgData_ExpandPlaceholders
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E838C ; =0x000F0100
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #4
	add r2, r5, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl CopyWindowToVram
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r5, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E838C: .word 0x000F0100
	thumb_func_end ov53_021E8330

	thumb_func_start ov53_021E8390
ov53_021E8390: ; 0x021E8390
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _021E839E
	bl GF_AssertFail
_021E839E:
	ldrb r0, [r5, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _021E83AE
	cmp r0, #2
	beq _021E83B2
	b _021E83B6
_021E83AE:
	mov r4, #0
	b _021E83BA
_021E83B2:
	mov r4, #1
	b _021E83BA
_021E83B6:
	bl GF_AssertFail
_021E83BA:
	ldr r1, _021E83CC ; =ov53_021E8874
	lsl r3, r4, #2
	ldr r2, _021E83D0 ; =ov53_021E8874 + 2
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	ldr r0, [r5, #0x10]
	bl sub_0200DD88
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E83CC: .word ov53_021E8874
_021E83D0: .word ov53_021E8874 + 2
	thumb_func_end ov53_021E8390

	thumb_func_start ov53_021E83D4
ov53_021E83D4: ; 0x021E83D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E84C8 ; =ov53_021E887C
	mov r4, #0
	bl sub_02025224
	add r6, r0, #0
	sub r0, r4, #1
	cmp r6, r0
	beq _021E841E
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	cmp r6, #0
	beq _021E83F8
	cmp r6, #1
	beq _021E8408
	b _021E8418
_021E83F8:
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	mov r4, #1
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x1b]
	b _021E84AA
_021E8408:
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	mov r4, #1
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
	b _021E84AA
_021E8418:
	bl GF_AssertFail
	b _021E84AA
_021E841E:
	ldr r0, _021E84D0 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _021E844A
	ldrb r1, [r5, #0x1b]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #1
	beq _021E84AA
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x1b]
	add r0, r5, #0
	bl ov53_021E8390
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E84AA
_021E844A:
	mov r1, #0x80
	tst r1, r0
	beq _021E8472
	ldrb r1, [r5, #0x1b]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #2
	beq _021E84AA
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
	add r0, r5, #0
	bl ov53_021E8390
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
	b _021E84AA
_021E8472:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _021E8496
	ldrb r0, [r5, #0x1b]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	bne _021E8492
	bl GF_AssertFail
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
_021E8492:
	mov r4, #1
	b _021E84AA
_021E8496:
	mov r1, #2
	tst r0, r1
	beq _021E84AA
	ldrb r1, [r5, #0x1b]
	mov r0, #0xf0
	add r4, r2, #0
	bic r1, r0
	mov r0, #0x20
	orr r0, r1
	strb r0, [r5, #0x1b]
_021E84AA:
	cmp r4, #0
	beq _021E84C2
	add r0, r5, #0
	bl ov53_021E8390
	ldr r0, [r5, #0x10]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, _021E84CC ; =SEQ_SE_DP_SELECT
	bl PlaySE
_021E84C2:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_021E84C8: .word ov53_021E887C
_021E84CC: .word SEQ_SE_DP_SELECT
_021E84D0: .word gSystem
	thumb_func_end ov53_021E83D4

	thumb_func_start ov53_021E84D4
ov53_021E84D4: ; 0x021E84D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_020249A8
	cmp r0, #3
	beq _021E84E6
	bl GF_AssertFail
_021E84E6:
	ldr r0, [r4, #0x10]
	bl sub_02024B68
	cmp r0, #0
	bne _021E84F4
	mov r0, #1
	pop {r4, pc}
_021E84F4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov53_021E84D4

	.rodata

ov53_021E84F8:
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov53_021E8500: ; 0x021E8500
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x06
	.short 0x036D

ov53_021E8508: ; 0x021E8508
	.word 0x0000000C
	.word 0x0000000E

ov53_021E8510: ; 0x021E8510
	.byte 0x90, 0xBF, 0xA8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov53_021E8518: ; 0x021E8518
	.byte 0x04, 0x18, 0x14, 0x07, 0x02, 0x0E, 0xA3, 0x00

ov53_021E8520:
	.byte 0x00, 0x04, 0x00, 0x18, 0x18, 0x05
	.short 0x012D

ov53_021E8528:
	.byte 0x00, 0x04, 0x00, 0x18, 0x18, 0x05
	.short 0x012D

ov53_021E8530: ; 0x021E8530
	.byte 0x19, 0xAD, 0x12, 0x6F, 0x19, 0xAD, 0x90, 0xEF, 0xFF, 0x00, 0x00, 0x00

ov53_021E853C: ; 0x021E853C
	.short 0x0000, 0xFFCC, 0xFFFE
	.short 0xFFCC, 0x0000, 0x0002

ov53_021E8548: ; 0x021E8548
	.word 1
	.word 0
	.word 0
	.word 0

ov53_021E8558: ; 0x021E8558
	.word 0x2C
	.word 0x2B
	.word 0x2B
	.word 0x2D
	.word 0x33

ov53_021E856C: ; 0x021E856C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00

ov53_021E8584: ; 0x021E8584
	.word 0x2F, 0x25
	.word 0x30, 0x25
	.word 0x2E, 0x25

ov53_021E859C: ; 0x021E859C
	.word 0x0C
	.word 0x16
	.word 0x17
	.word 0x18
	.word 0x19
	.word 0xFF

ov53_021E85B4: ; 0x021E85B4
	.word 0x11
	.word 0x1A
	.word 0x1B
	.word 0x1C
	.word 0x1D
	.word 0xFF

ov53_021E85CC: ; 0x021E85CC
	.word 0, 0, 0x800, 0
	.byte 1, 0, 0, 0, 0, 1, 0, 0
	.word 0

ov53_021E85E8: ; 0x021E85E8
	.word 0, 0, 0x800, 0
	.byte 1, 0, 0, 0, 0, 0, 0, 0
	.word 0

ov53_021E8604: ; 0x021E8604
	.word 0, 0x1C7, 0x018F
	.word 0, 0x1AF, 0x0000
	.word 0, 0x1AF, 0x0000

ov53_021E8628: ; 0x021E8628
	.word 0x00000001, 0x00000000
	.word 0x00000004, 0x00000000, 0x00000002, 0x00000000
	.word 0x00000100, 0x00000000, 0x00000000, 0x00000000

ov53_021E8650: ; 0x021E8650
	.byte 0x14, 0x32, 0x32, 0xD5, 0x4C, 0x6A, 0x32, 0xD5, 0x84, 0xA2, 0x32, 0xD5, 0xFF, 0x00, 0x00, 0x00
	.byte 0x1A, 0x53, 0x8A, 0xFD, 0x6C, 0xA4, 0x8A, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x53, 0x0A, 0x7D, 0x6C, 0xA4, 0x0A, 0x7D, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov53_021E8680: ; 0x021E8680
	.byte 0x04, 0x02, 0x06, 0x0D, 0x03, 0x0E, 0x01, 0x00, 0x04, 0x02, 0x10, 0x0D, 0x03, 0x0E, 0x36, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x07, 0x03, 0x12, 0x03, 0x0E, 0x01, 0x00, 0x04, 0x07, 0x0A, 0x12, 0x03, 0x0E, 0x37, 0x00, 0x04, 0x07, 0x11, 0x12, 0x03, 0x0E, 0x6D, 0x00

ov53_021E86B0: ; 0x021E86B0
	.byte 0x31, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov53_021E86F0: ; 0x021E86F0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00

	; file boundary

ov53_021E8740: ; 0x021E8740
	.byte 0x1A, 0x00, 0x1B, 0x00, 0x19, 0x00, 0x18, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x4E, 0x00, 0x00, 0x00

ov53_021E8750: ; 0x021E8750
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov53_021E8764: ; 0x021E8764
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00

ov53_021E8784: ; 0x021E8784
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x32, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x01, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	; file boundary

ov53_021E8874: ; 0x021E8874
	.short 0x0080, 0x0048
	.short 0x0080, 0x0078

ov53_021E887C: ; 0x021E887C
	.byte 0x32, 0x5C, 0x03, 0xFB
	.byte 0x63, 0x8C, 0x03, 0xFB, 0xFF, 0x00, 0x00, 0x00
	; 0x021E8888
