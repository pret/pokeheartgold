#include "msgdata/msg/msg_0252.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start SignBackOfTrainerCardApp_OvyInit
SignBackOfTrainerCardApp_OvyInit: ; 0x021E80C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _021E80D6
	cmp r1, #1
	bne _021E80D4
	b _021E8216
_021E80D4:
	b _021E8224
_021E80D6:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E822C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E8230 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #3
	mov r1, #0x27
	lsl r2, r2, #6
	bl CreateHeap
	ldr r1, _021E8234 ; =0x00005CB0
	add r0, r6, #0
	mov r2, #0x27
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E8234 ; =0x00005CB0
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x27
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0x5b
	mov r1, #0x27
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #0x27
	bl ScrStrBufs_new
	str r0, [r4, #0x10]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xfc
	mov r3, #0x27
	bl NewMsgDataFromNarc
	str r0, [r4, #0x14]
	mov r0, #1
	bl sub_02002B8C
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	bl ov52_021E83A4
	ldr r0, [r4]
	bl ov52_021E83C4
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x27
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	bl Save_TrainerCard_get
	bl TrainerCard_GetSignature
	ldr r1, _021E8238 ; =0x00005B98
	str r0, [r4, r1]
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	bl Sav2_GameStats_get
	str r0, [r4, #8]
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl ov52_021E85DC
	bl sub_020210BC
	mov r0, #1
	bl sub_02021148
	ldr r0, _021E823C ; =ov52_021E837C
	ldr r1, [r4]
	bl Main_SetVBlankIntrCB
	mov r0, #2
	mov r1, #0x27
	bl FontID_Alloc
	add r0, r4, #0
	bl ov52_021E84CC
	bl ov52_021E86DC
	add r0, r4, #0
	add r1, r7, #0
	bl ov52_021E870C
	add r0, r4, #0
	bl ov52_021E888C
	add r0, r4, #0
	add r1, r6, #0
	bl ov52_021E89D4
	mov r1, #0
	mov r0, #0x38
	add r2, r1, #0
	bl sub_02004EC4
	ldr r2, _021E8240 ; =0x04000304
	ldr r0, _021E8244 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	add r0, r7, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E8224
_021E8216:
	bl OverlayManager_GetData
	mov r0, #0
	str r0, [r5]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E8224:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E822C: .word 0xFFFFE0FF
_021E8230: .word 0x04001000
_021E8234: .word 0x00005CB0
_021E8238: .word 0x00005B98
_021E823C: .word ov52_021E837C
_021E8240: .word 0x04000304
_021E8244: .word 0xFFFF7FFF
	thumb_func_end SignBackOfTrainerCardApp_OvyInit

	thumb_func_start SignBackOfTrainerCardApp_OvyExec
SignBackOfTrainerCardApp_OvyExec: ; 0x021E8248
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0
	beq _021E8262
	cmp r1, #1
	beq _021E8270
	cmp r1, #2
	beq _021E828E
	b _021E829A
_021E8262:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E829A
	mov r0, #1
	str r0, [r5]
	b _021E829A
_021E8270:
	mov r2, #0xc3
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	lsl r3, r2, #2
	ldr r2, _021E82A4 ; =ov52_021E96C0
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _021E8284
	blx r2
	str r0, [r5]
_021E8284:
	ldr r0, _021E82A8 ; =0x00004318
	add r0, r4, r0
	bl ov52_021E921C
	b _021E829A
_021E828E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E829A
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E829A:
	ldr r0, [r4, #0x3c]
	bl sub_0202457C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E82A4: .word ov52_021E96C0
_021E82A8: .word 0x00004318
	thumb_func_end SignBackOfTrainerCardApp_OvyExec

	thumb_func_start SignBackOfTrainerCardApp_OvyExit
SignBackOfTrainerCardApp_OvyExit: ; 0x021E82AC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r6, r0, #0
	ldr r0, _021E8374 ; =0x00005B98
	mov r1, #0x2d
	lsl r1, r1, #4
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	bl ov52_021E9300
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r7, #0x5a
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021E82FC:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E82FC
	ldr r0, [r6, #0x3c]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	add r0, r6, #0
	bl ov52_021E8B94
	mov r0, #2
	bl FontID_Release
	ldr r0, [r6]
	bl ov52_021E85A0
	bl sub_02021238
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [r6, #0x14]
	bl DestroyMsgData
	ldr r0, [r6, #0x10]
	bl ScrStrBufs_delete
	add r0, r6, #0
	bl ov52_021E8568
	ldr r0, [sp]
	bl OverlayManager_FreeData
	ldr r2, _021E8378 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x27
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8374: .word 0x00005B98
_021E8378: .word 0x04000304
	thumb_func_end SignBackOfTrainerCardApp_OvyExit

	thumb_func_start ov52_021E837C
ov52_021E837C: ; 0x021E837C
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	add r0, r4, #0
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E839C ; =0x027E0000
	ldr r1, _021E83A0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E839C: .word 0x027E0000
_021E83A0: .word 0x00003FF8
	thumb_func_end ov52_021E837C

	thumb_func_start ov52_021E83A4
ov52_021E83A4: ; 0x021E83A4
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E83C0 ; =ov52_021E9578
	add r3, sp, #0
	mov r2, #5
_021E83AE:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E83AE
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E83C0: .word ov52_021E9578
	thumb_func_end ov52_021E83A4

	thumb_func_start ov52_021E83C4
ov52_021E83C4: ; 0x021E83C4
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E84B4 ; =ov52_021E94CC
	add r3, sp, #0x8c
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E84B8 ; =ov52_021E9524
	add r3, sp, #0x70
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
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E84BC ; =ov52_021E9540
	add r3, sp, #0x54
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E84C0 ; =ov52_021E955C
	add r3, sp, #0x38
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E84C4 ; =ov52_021E94EC
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E84C8 ; =ov52_021E9508
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #5
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x27
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x27
	bl BG_ClearCharDataRange
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E84B4: .word ov52_021E94CC
_021E84B8: .word ov52_021E9524
_021E84BC: .word ov52_021E9540
_021E84C0: .word ov52_021E955C
_021E84C4: .word ov52_021E94EC
_021E84C8: .word ov52_021E9508
	thumb_func_end ov52_021E83C4

	thumb_func_start ov52_021E84CC
ov52_021E84CC: ; 0x021E84CC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _021E8558 ; =0x0000433D
	mov r6, #0
	add r5, r7, r0
	mov r0, #0xf0
	add r4, r7, #0
	str r0, [sp]
_021E84DC:
	mov r0, #8
	mov r1, #0x27
	bl String_ctor
	str r0, [r4, #0x18]
	ldrb r1, [r5]
	ldr r0, [sp]
	add r6, r6, #1
	bic r1, r0
	strb r1, [r5]
	ldr r0, _021E855C ; =0x00004384
	mov r1, #0
	strh r1, [r4, r0]
	add r4, r4, #4
	add r5, #0x11
	cmp r6, #5
	blt _021E84DC
	mov r0, #0x14
	mov r1, #0x27
	bl String_ctor
	str r0, [r7, #0x2c]
	mov r0, #0x28
	mov r1, #0x27
	bl String_ctor
	str r0, [r7, #0x30]
	mov r0, #0x50
	mov r1, #0x27
	bl String_ctor
	str r0, [r7, #0x34]
	ldr r0, _021E8560 ; =0x0000431A
	mov r1, #0
	strb r1, [r7, r0]
	mov r0, #0xc3
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r7, r0]
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x2c]
	mov r1, #msg_0252_00012 ; DONE
	bl ReadMsgDataIntoString
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x30]
	mov r1, #msg_0252_00009 ; Sign your autograph!
	bl ReadMsgDataIntoString
	mov r0, #0x27
	bl sub_0201660C
	ldr r1, _021E8564 ; =0x00005C9C
	mov r2, #5
	str r0, [r7, r1]
	add r1, r1, #4
	mov r0, #0
	add r1, r7, r1
	bl MIi_CpuClearFast
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8558: .word 0x0000433D
_021E855C: .word 0x00004384
_021E8560: .word 0x0000431A
_021E8564: .word 0x00005C9C
	thumb_func_end ov52_021E84CC

	thumb_func_start ov52_021E8568
ov52_021E8568: ; 0x021E8568
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _021E859C ; =0x00005C9C
	ldr r0, [r6, r0]
	bl sub_02016624
	mov r4, #0
	add r5, r6, #0
_021E8578:
	ldr r0, [r5, #0x18]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021E8578
	ldr r0, [r6, #0x34]
	bl String_dtor
	ldr r0, [r6, #0x30]
	bl String_dtor
	ldr r0, [r6, #0x2c]
	bl String_dtor
	pop {r4, r5, r6, pc}
	nop
_021E859C: .word 0x00005C9C
	thumb_func_end ov52_021E8568

	thumb_func_start ov52_021E85A0
ov52_021E85A0: ; 0x021E85A0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov52_021E85A0

	thumb_func_start ov52_021E85DC
ov52_021E85DC: ; 0x021E85DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r4, [r6]
	mov r0, #0x60
	add r5, r1, #0
	mov r1, #0
	str r0, [sp]
	mov r0, #0x27
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0x27
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #2
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x27
	bl LoadFontPal1
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x27
	bl LoadFontPal1
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x27
	bl BG_ClearCharDataRange
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x27
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #3
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x27
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #5
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x27
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #4
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x27
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r6, #0xc]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x27
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	mov r0, #0x27
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov52_021E85DC

	thumb_func_start ov52_021E86DC
ov52_021E86DC: ; 0x021E86DC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E8708 ; =ov52_021E94DC
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x27
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E8708: .word ov52_021E94DC
	thumb_func_end ov52_021E86DC

	thumb_func_start ov52_021E870C
ov52_021E870C: ; 0x021E870C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x27
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	add r1, r5, #0
	mov r0, #0x32
	add r1, #0x40
	mov r2, #0x27
	bl G2dRenderer_Init
	str r0, [r5, #0x3c]
	add r0, r5, #0
	mov r2, #1
	add r0, #0x40
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r6, #0
	add r4, r5, #0
_021E8750:
	mov r0, #2
	add r1, r6, #0
	mov r2, #0x27
	bl Create2DGfxResObjMan
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E8750
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x27
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #7
	bl AddCharResObjFromOpenNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x27
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x27
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #8
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x27
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #9
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x27
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #7
	bl AddCharResObjFromOpenNarc
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #1
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x27
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x27
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #8
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x27
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #9
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x65
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x1c
	ldr r0, [r5, r1]
	bl sub_0200ACF0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov52_021E870C

	thumb_func_start ov52_021E888C
ov52_021E888C: ; 0x021E888C
	push {r3, r4, lr}
	sub sp, #0x5c
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r2, #0x5a
	str r1, [sp, #0x10]
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r4, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	add r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r4, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r1, #1
	mov r3, #0x5a
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r4, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r4, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r4, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r4, r2]
	add r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r4, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4, #0x3c]
	mov r2, #0
	str r0, [sp, #0x2c]
	mov r0, #0x66
	lsl r0, r0, #2
	add r1, r4, r0
	str r1, [sp, #0x30]
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, #0x24
	str r2, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r1, [sp, #0x44]
	str r1, [sp, #0x48]
	add r1, sp, #0x2c
	strh r2, [r1, #0x20]
	mov r1, #1
	add r0, r4, r0
	str r0, [sp, #0x30]
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp, #0x34]
	mov r0, #0xaf
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	str r1, [sp, #0x50]
	str r1, [sp, #0x54]
	mov r1, #0x27
	add r0, sp, #0x2c
	str r1, [sp, #0x58]
	bl CreateSprite
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024A14
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_02024A04
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x5c
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov52_021E888C

	thumb_func_start ov52_021E8994
ov52_021E8994: ; 0x021E8994
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r2, #0
	mov r0, #2
	mov r2, #0
	add r6, r1, #0
	add r7, r3, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r7, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r4, [r5, #7]
	add r0, r5, #0
	add r2, r6, #0
	lsl r4, r4, #3
	sub r4, r4, r3
	lsr r3, r4, #0x1f
	add r3, r4, r3
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov52_021E8994

	thumb_func_start ov52_021E89D4
ov52_021E89D4: ; 0x021E89D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	mov r1, #0xb5
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r5]
	add r1, r5, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xb5
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #9
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #8
	mov r1, #0xb1
	lsl r1, r1, #2
	str r0, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #0xb1
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0xc1
	mov r1, #0xb9
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r5]
	add r1, r5, r1
	mov r2, #1
	mov r3, #0x1a
	bl AddWindowParameterized
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _021E8B84 ; =0x000E0702
	mov r2, #1
	str r0, [sp]
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r1, [r5, #0x2c]
	add r0, r5, r0
	mov r3, #2
	bl ov52_021E8994
	mov r1, #2
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r4, #0
	ldr r0, _021E8B88 ; =0x00005B9C
	str r4, [sp, #0x18]
	add r7, r4, #0
	add r6, r5, r0
_021E8A8A:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #4
	mov r2, #2
	add r3, r4, #0
	str r6, [sp, #4]
	bl sub_02013A50
	mov r1, #1
	add r0, r6, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r2, #1
	add r0, r6, #0
	add r1, r7, #0
	lsl r2, r2, #8
	bl GX_LoadOBJ
	mov r0, #1
	lsl r0, r0, #8
	add r7, r7, r0
	ldr r0, [sp, #0x18]
	add r4, r4, #4
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #2
	blt _021E8A8A
	mov r3, #2
	str r3, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r1, #0xbd
	lsl r1, r1, #2
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xd1
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	mov r2, #1
	bl AddWindowParameterized
	ldr r1, [r5, #0x30]
	mov r0, #1
	mov r2, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r3, #0xe0
	sub r4, r3, r4
	lsr r3, r4, #0x1f
	add r3, r4, r3
	ldr r0, _021E8B8C ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r2, [r5, #0x30]
	add r0, r5, r0
	mov r1, #1
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #0x9d
	lsl r0, r0, #2
	mov r7, #1
	mov r6, #3
	add r4, r5, r0
_021E8B32:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #4
	mov r3, #5
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r7, #0x14
	add r0, r0, #1
	add r6, r6, #4
	add r4, #0x10
	str r0, [sp, #0x14]
	cmp r0, #5
	blt _021E8B32
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r2, _021E8B90 ; =0x000E0D0F
	add r0, r5, r0
	mov r1, #0
	add r3, r5, #0
	bl ov52_021E925C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E8B84: .word 0x000E0702
_021E8B88: .word 0x00005B9C
_021E8B8C: .word 0x00010200
_021E8B90: .word 0x000E0D0F
	thumb_func_end ov52_021E89D4

	thumb_func_start ov52_021E8B94
ov52_021E8B94: ; 0x021E8B94
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x9d
	lsl r0, r0, #2
	mov r4, #0
	add r5, r6, r0
_021E8BA0:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #5
	blt _021E8BA0
	mov r0, #0xbd
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	mov r0, #0xb1
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	mov r0, #0xb5
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	pop {r4, r5, r6, pc}
	thumb_func_end ov52_021E8B94

	thumb_func_start ov52_021E8BD8
ov52_021E8BD8: ; 0x021E8BD8
	bx lr
	.balign 4, 0
	thumb_func_end ov52_021E8BD8

	thumb_func_start ov52_021E8BDC
ov52_021E8BDC: ; 0x021E8BDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r0, #0
	ldr r0, _021E8CA4 ; =ov52_021E94BA
	bl sub_02025224
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _021E8C30
	cmp r1, #0
	bne _021E8C22
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _021E8C30
	add r0, r4, #0
	mov r1, #msg_0252_00010 ; Is this OK?
	bl ov52_021E927C
	mov r0, #0xc3
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0xbc
	add r0, r4, r0
	mov r1, #1
	bl ov52_021E8CDC
	ldr r0, _021E8CA8 ; =0x000005DD
	bl PlaySE
	b _021E8C30
_021E8C22:
	ldr r0, _021E8CAC ; =0x0000431A
	strb r1, [r4, r0]
	mov r0, #0x25
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov52_021E8CBC
_021E8C30:
	ldr r0, _021E8CB0 ; =ov52_021E94B2
	bl sub_02025204
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E8C44
	add r0, r4, #0
	bl ov52_021E9364
_021E8C44:
	add r0, sp, #0
	mov r1, #4
	mov r2, #1
	bl sub_02021280
	cmp r0, #1
	bne _021E8CA0
	add r7, sp, #0
	ldrh r3, [r7]
	mov r1, #0
	cmp r3, #0
	ble _021E8C78
	ldr r5, _021E8CB4 ; =0x0000431C
	add r2, sp, #0
	add r6, r5, #0
	add r6, #8
_021E8C64:
	ldrh r3, [r2, #2]
	add r0, r4, r1
	add r1, r1, #1
	strb r3, [r0, r5]
	ldrh r3, [r2, #4]
	add r2, #8
	strb r3, [r0, r6]
	ldrh r3, [r7]
	cmp r1, r3
	blt _021E8C64
_021E8C78:
	ldr r0, _021E8CB8 ; =0x0000432C
	mov r2, #0xf0
	ldrb r1, [r4, r0]
	bic r1, r2
	lsl r2, r3, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r4, r0]
	ldrb r3, [r4, r0]
	mov r1, #0xf
	bic r3, r1
	add r1, r0, #0
	sub r1, #0x12
	ldrb r2, [r4, r1]
	mov r1, #0xf
	and r1, r2
	orr r1, r3
	strb r1, [r4, r0]
_021E8CA0:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8CA4: .word ov52_021E94BA
_021E8CA8: .word 0x000005DD
_021E8CAC: .word 0x0000431A
_021E8CB0: .word ov52_021E94B2
_021E8CB4: .word 0x0000431C
_021E8CB8: .word 0x0000432C
	thumb_func_end ov52_021E8BDC

	thumb_func_start ov52_021E8CBC
ov52_021E8CBC: ; 0x021E8CBC
	push {r3, lr}
	ldr r2, _021E8CD8 ; =_021E94AC
	cmp r1, #0
	ldr r0, [r0]
	bne _021E8CD0
	ldrh r1, [r2, #4]
	add r1, r1, #1
	bl Set2dSpriteAnimSeqNo
	pop {r3, pc}
_021E8CD0:
	ldrh r1, [r2, #4]
	bl Set2dSpriteAnimSeqNo
	pop {r3, pc}
	.balign 4, 0
_021E8CD8: .word _021E94AC
	thumb_func_end ov52_021E8CBC

	thumb_func_start ov52_021E8CDC
ov52_021E8CDC: ; 0x021E8CDC
	push {r3, lr}
	cmp r1, #1
	ldr r0, [r0]
	bne _021E8CEC
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	pop {r3, pc}
_021E8CEC:
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	pop {r3, pc}
	thumb_func_end ov52_021E8CDC

	thumb_func_start ov52_021E8CF4
ov52_021E8CF4: ; 0x021E8CF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov52_021E8BDC
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r2, _021E8D34 ; =0x000E0C0F
	add r0, r5, r0
	mov r1, #0
	add r3, r5, #0
	bl ov52_021E925C
	add r0, r5, #0
	bl ov52_021E9260
	add r0, r5, #0
	bl ov52_021E9218
	ldr r2, _021E8D38 ; =0x0000432D
	mov r0, #0xb1
	lsl r0, r0, #2
	add r1, r5, r2
	add r2, #0x55
	add r0, r5, r0
	add r2, r5, r2
	mov r3, #1
	bl ov52_021E9158
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E8D34: .word 0x000E0C0F
_021E8D38: .word 0x0000432D
	thumb_func_end ov52_021E8CF4

	thumb_func_start ov52_021E8D3C
ov52_021E8D3C: ; 0x021E8D3C
	push {r4, lr}
	add r4, r0, #0
	bl ov52_021E8BD8
	add r0, r4, #0
	bl ov52_021E9218
	ldr r2, _021E8D60 ; =0x0000432D
	mov r0, #0xb1
	lsl r0, r0, #2
	add r1, r4, r2
	add r2, #0x55
	add r0, r4, r0
	add r2, r4, r2
	mov r3, #0
	bl ov52_021E9158
	pop {r4, pc}
	.balign 4, 0
_021E8D60: .word 0x0000432D
	thumb_func_end ov52_021E8D3C

	thumb_func_start ov52_021E8D64
ov52_021E8D64: ; 0x021E8D64
	push {lr}
	sub sp, #0x14
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0xb4
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	mov r2, #0x19
	add r0, sp, #0
	strb r2, [r0, #0x10]
	mov r2, #6
	strb r2, [r0, #0x11]
	add r0, r1, #0
	add r1, sp, #0
	bl sub_020166FC
	add sp, #0x14
	pop {pc}
	thumb_func_end ov52_021E8D64

	thumb_func_start ov52_021E8D8C
ov52_021E8D8C: ; 0x021E8D8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x38]
	add r4, r1, #0
	bl ov52_021E92E8
	cmp r0, #0
	beq _021E8DB6
	ldr r1, _021E8DC0 ; =0x00005C9C
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl ov52_021E8D64
	add r0, r5, #0
	mov r1, #1
	bl ov52_021E9488
	mov r0, #0xc3
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E8DB6:
	add r0, r5, #0
	bl ov52_021E8D3C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8DC0: .word 0x00005C9C
	thumb_func_end ov52_021E8D8C

	thumb_func_start ov52_021E8DC4
ov52_021E8DC4: ; 0x021E8DC4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _021E8E5C ; =0x00005C9C
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021E8DDE
	cmp r0, #2
	beq _021E8E20
	b _021E8E46
_021E8DDE:
	ldr r0, [r5, #8]
	mov r1, #4
	bl GameStats_AddSpecial
	ldr r0, [r5, #8]
	mov r1, #0x73
	bl GameStats_Inc
	mov r0, #0xb5
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _021E8E5C ; =0x00005C9C
	ldr r0, [r5, r0]
	bl sub_020169CC
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x27
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	mov r0, #2
	pop {r4, r5, pc}
_021E8E20:
	mov r0, #0xc3
	mov r1, #4
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, #0xbc
	add r0, r5, r0
	mov r1, #0
	bl ov52_021E8CDC
	mov r0, #0xb5
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _021E8E5C ; =0x00005C9C
	ldr r0, [r5, r0]
	bl sub_020169CC
_021E8E46:
	ldr r1, _021E8E60 ; =0x0000432C
	mov r0, #0xf0
	ldrb r2, [r5, r1]
	bic r2, r0
	add r0, r5, #0
	strb r2, [r5, r1]
	bl ov52_021E8D3C
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E8E5C: .word 0x00005C9C
_021E8E60: .word 0x0000432C
	thumb_func_end ov52_021E8DC4

	thumb_func_start ov52_021E8E64
ov52_021E8E64: ; 0x021E8E64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E8ED8 ; =0x00005C9C
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021E8E7C
	cmp r0, #2
	beq _021E8EB4
	b _021E8ED4
_021E8E7C:
	mov r0, #0xc3
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, #0x38
	add r0, r5, r0
	bl ClearFrameAndWindow2
	ldr r0, _021E8ED8 ; =0x00005C9C
	ldr r0, [r5, r0]
	bl sub_020169CC
	add r0, r5, #0
	mov r1, #0
	bl ov52_021E9488
	mov r0, #0xb1
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0xb1
	lsl r0, r0, #2
	add r0, r5, r0
	bl CopyWindowToVram
	b _021E8ED4
_021E8EB4:
	mov r0, #0xc3
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, #0x38
	add r0, r5, r0
	bl ClearFrameAndWindow2
	ldr r0, _021E8ED8 ; =0x00005C9C
	ldr r0, [r5, r0]
	bl sub_020169CC
	add r0, r5, #0
	mov r1, #0
	bl ov52_021E9488
_021E8ED4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8ED8: .word 0x00005C9C
	thumb_func_end ov52_021E8E64

	thumb_func_start ov52_021E8EDC
ov52_021E8EDC: ; 0x021E8EDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #msg_0252_00011 ; Would you like to erase your autograph?
	add r5, r0, #0
	bl ov52_021E927C
	mov r0, #0xc3
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov52_021E8D3C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov52_021E8EDC

	thumb_func_start ov52_021E8EFC
ov52_021E8EFC: ; 0x021E8EFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x38]
	add r4, r1, #0
	bl ov52_021E92E8
	cmp r0, #0
	beq _021E8F1E
	mov r0, #0xc3
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r1, _021E8F28 ; =0x00005C9C
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl ov52_021E8D64
_021E8F1E:
	add r0, r5, #0
	bl ov52_021E8D3C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8F28: .word 0x00005C9C
	thumb_func_end ov52_021E8EFC

	thumb_func_start ov52_021E8F2C
ov52_021E8F2C: ; 0x021E8F2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r4, [sp, #0x38]
	mov ip, r1
	add r6, r2, #0
	add r7, r3, #0
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x3c]
	ldr r2, [sp, #0x40]
	ldr r1, [sp, #0x44]
	cmp r4, #0
	bge _021E8F58
	neg r0, r4
	cmp r0, r2
	ble _021E8F4C
	add r0, r2, #0
_021E8F4C:
	ldr r5, [sp, #0x30]
	mov r4, #0
	sub r5, r5, r0
	add r6, r6, r0
	str r5, [sp, #0x30]
	sub r2, r2, r0
_021E8F58:
	cmp r3, #0
	bge _021E8F70
	neg r0, r3
	cmp r0, r1
	ble _021E8F64
	add r0, r1, #0
_021E8F64:
	ldr r5, [sp, #0x34]
	mov r3, #0
	sub r5, r5, r0
	add r7, r7, r0
	str r5, [sp, #0x34]
	sub r1, r1, r0
_021E8F70:
	ldr r0, [sp, #0x30]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x34]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	lsl r2, r6, #0x10
	lsl r3, r7, #0x10
	ldr r0, [sp, #0x18]
	mov r1, ip
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl BlitBitmapRectToWindow
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov52_021E8F2C

	thumb_func_start ov52_021E8FAC
ov52_021E8FAC: ; 0x021E8FAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x50]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x54]
	str r2, [sp, #0x20]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x50]
	str r3, [sp, #0x24]
	ldr r4, [r0]
	ldr r0, [sp, #0x54]
	ldr r5, [r0]
	add r0, r2, #0
	str r0, [sp, #0x38]
	add r0, r3, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bne _021E8FEC
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _021E8FEC
	ldr r0, [sp, #0x50]
	add r1, r2, #0
	str r1, [r0]
	ldr r0, [sp, #0x54]
	add r1, r3, #0
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_021E8FEC:
	ldr r0, [sp, #0x20]
	sub r0, r0, r4
	str r0, [sp, #0x34]
	bpl _021E8FF8
	neg r0, r0
	str r0, [sp, #0x34]
_021E8FF8:
	ldr r0, [sp, #0x24]
	sub r7, r0, r5
	bpl _021E9000
	neg r7, r7
_021E9000:
	ldr r0, [sp, #0x34]
	cmp r0, r7
	ble _021E908E
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E9026
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E9018
	mov r0, #1
	str r0, [sp, #0x2c]
	b _021E901E
_021E9018:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x2c]
_021E901E:
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	b _021E9038
_021E9026:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	bge _021E9032
	mov r0, #1
	str r0, [sp, #0x2c]
	b _021E9038
_021E9032:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x2c]
_021E9038:
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r3, r2, #0
	bl ov52_021E8F2C
	ldr r0, [sp, #0x34]
	add r4, r4, #1
	asr r6, r0, #1
	ldr r0, [sp, #0x38]
	cmp r4, r0
	bgt _021E9112
_021E905E:
	sub r6, r6, r7
	bpl _021E906A
	ldr r0, [sp, #0x34]
	add r6, r6, r0
	ldr r0, [sp, #0x2c]
	add r5, r5, r0
_021E906A:
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r3, r2, #0
	bl ov52_021E8F2C
	ldr r0, [sp, #0x38]
	add r4, r4, #1
	cmp r4, r0
	ble _021E905E
	b _021E9112
_021E908E:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E90AE
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E90A0
	mov r0, #1
	str r0, [sp, #0x28]
	b _021E90A6
_021E90A0:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x28]
_021E90A6:
	str r5, [sp, #0x30]
	ldr r5, [sp, #0x24]
	ldr r4, [sp, #0x20]
	b _021E90C0
_021E90AE:
	ldr r0, [sp, #0x20]
	cmp r4, r0
	bge _021E90BA
	mov r0, #1
	str r0, [sp, #0x28]
	b _021E90C0
_021E90BA:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x28]
_021E90C0:
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r3, r2, #0
	bl ov52_021E8F2C
	ldr r0, [sp, #0x30]
	add r5, r5, #1
	asr r6, r7, #1
	cmp r5, r0
	bgt _021E9112
_021E90E4:
	ldr r0, [sp, #0x34]
	sub r6, r6, r0
	bpl _021E90F0
	ldr r0, [sp, #0x28]
	add r6, r6, r7
	add r4, r4, r0
_021E90F0:
	mov r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r2, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r3, r2, #0
	bl ov52_021E8F2C
	ldr r0, [sp, #0x30]
	add r5, r5, #1
	cmp r5, r0
	ble _021E90E4
_021E9112:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x50]
	str r1, [r0]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x54]
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov52_021E8FAC

	thumb_func_start ov52_021E9124
ov52_021E9124: ; 0x021E9124
	mov r2, #0
_021E9126:
	ldrb r3, [r0, #0x10]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	strh r3, [r1, #2]
	ldrb r3, [r0, #0x10]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	beq _021E914A
	add r3, r0, r3
	sub r3, r3, #1
	ldrb r3, [r3]
	strb r3, [r1]
	ldrb r3, [r0, #0x10]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	add r3, r0, r3
	ldrb r3, [r3, #7]
	strb r3, [r1, #1]
_021E914A:
	add r2, r2, #1
	add r0, #0x11
	add r1, r1, #4
	cmp r2, #5
	blt _021E9126
	bx lr
	.balign 4, 0
	thumb_func_end ov52_021E9124

	thumb_func_start ov52_021E9158
ov52_021E9158: ; 0x021E9158
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r7, r0, #0
	mov r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	add r5, r1, #0
	add r6, r2, #0
_021E916E:
	ldrb r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	beq _021E91D2
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _021E9188
	ldrb r0, [r6]
	sub r0, #0x20
	str r0, [sp, #0x28]
	ldrb r0, [r6, #1]
	sub r0, #0x48
	str r0, [sp, #0x24]
_021E9188:
	ldrb r0, [r5, #0x10]
	mov r4, #0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1c
	cmp r1, #0
	ble _021E91D2
	mov r0, #1
	str r0, [sp, #0x1c]
	cmp r1, #0
	ble _021E91D2
_021E919C:
	add r0, sp, #0x28
	str r0, [sp]
	add r0, sp, #0x24
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldrh r0, [r6, #2]
	add r3, r5, r4
	str r0, [sp, #0xc]
	ldrb r1, [r5, #0x10]
	ldrb r3, [r3, #8]
	add r0, r7, #0
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	lsl r2, r1, #4
	ldr r1, _021E9214 ; =ov52_021E95A0
	sub r3, #0x48
	add r1, r1, r2
	ldrb r2, [r5, r4]
	sub r2, #0x20
	bl ov52_021E8FAC
	ldrb r0, [r5, #0x10]
	add r4, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r4, r0
	blt _021E919C
_021E91D2:
	ldr r0, [sp, #0x20]
	add r5, #0x11
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp, #0x20]
	cmp r0, #5
	blt _021E916E
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _021E91F2
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _021E91F2
	add r0, r7, #0
	bl CopyWindowToVram
_021E91F2:
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	bl ov52_021E9124
	mov r3, #0
	mov r1, #0xf0
_021E91FE:
	ldr r0, [sp, #0x10]
	add r3, r3, #1
	ldrb r2, [r0, #0x10]
	bic r2, r1
	strb r2, [r0, #0x10]
	add r0, #0x11
	str r0, [sp, #0x10]
	cmp r3, #5
	blt _021E91FE
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9214: .word ov52_021E95A0
	thumb_func_end ov52_021E9158

	thumb_func_start ov52_021E9218
ov52_021E9218: ; 0x021E9218
	bx lr
	.balign 4, 0
	thumb_func_end ov52_021E9218

	thumb_func_start ov52_021E921C
ov52_021E921C: ; 0x021E921C
	push {r3, lr}
	ldrh r1, [r0]
	add r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r2, r1
	bls _021E9232
	mov r1, #0
	strh r1, [r0]
_021E9232:
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xa
	mul r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	add r0, #0xf
	lsl r1, r0, #5
	mov r0, #0x1d
	orr r1, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, sp, #0
	mov r1, #0x18
	mov r2, #2
	bl GX_LoadOBJPltt
	pop {r3, pc}
	thumb_func_end ov52_021E921C

	thumb_func_start ov52_021E925C
ov52_021E925C: ; 0x021E925C
	bx lr
	.balign 4, 0
	thumb_func_end ov52_021E925C

	thumb_func_start ov52_021E9260
ov52_021E9260: ; 0x021E9260
	ldr r1, _021E9278 ; =0x0000431C
	add r3, r0, r1
	add r1, #0x11
	add r2, r0, r1
	mov r1, #0x11
_021E926A:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E926A
	bx lr
	.balign 4, 0
_021E9278: .word 0x0000431C
	thumb_func_end ov52_021E9260

	thumb_func_start ov52_021E927C
ov52_021E927C: ; 0x021E927C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x50
	mov r1, #0x27
	bl String_ctor
	add r4, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x34]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r0, #0xb5
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0xb5
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	ldr r0, [r5, #0xc]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r2, [r5, #0x34]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	str r0, [r5, #0x38]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov52_021E927C

	thumb_func_start ov52_021E92E8
ov52_021E92E8: ; 0x021E92E8
	push {r3, lr}
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E92FA
	mov r0, #1
	pop {r3, pc}
_021E92FA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov52_021E92E8

	thumb_func_start ov52_021E9300
ov52_021E9300: ; 0x021E9300
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	add r5, r0, #0
	str r1, [sp]
	add r4, r7, #0
	strb r7, [r5]
	add r6, r7, #0
_021E930E:
	ldr r0, [sp]
	ldrb r1, [r0, r6]
	mov r0, #0xf
	and r0, r1
	cmp r0, #1
	bne _021E9324
	mov r0, #1
	ldrb r1, [r5]
	lsl r0, r4
	orr r0, r1
	strb r0, [r5]
_021E9324:
	ldr r0, [sp]
	ldrb r0, [r0, r6]
	asr r0, r0, #4
	cmp r0, #1
	bne _021E933A
	ldrb r0, [r5]
	add r2, r4, #1
	mov r1, #1
	lsl r1, r2
	orr r0, r1
	strb r0, [r5]
_021E933A:
	add r4, r4, #2
	cmp r4, #8
	bne _021E934A
	mov r0, #0
	add r5, r5, #1
	add r7, r7, #1
	strb r0, [r5]
	add r4, r0, #0
_021E934A:
	mov r0, #6
	lsl r0, r0, #0xa
	cmp r7, r0
	blt _021E9356
	bl GF_AssertFail
_021E9356:
	mov r0, #6
	add r6, r6, #1
	lsl r0, r0, #0xa
	cmp r6, r0
	blt _021E930E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov52_021E9300

	thumb_func_start ov52_021E9364
ov52_021E9364: ; 0x021E9364
	push {r3, r4, r5, lr}
	ldr r1, _021E9410 ; =gSystem + 0x40
	add r4, r0, #0
	ldrh r0, [r1, #0x20]
	ldr r3, _021E9414 ; =0x0000FFFF
	cmp r0, r3
	beq _021E93FE
	ldrh r1, [r1, #0x22]
	cmp r1, r3
	beq _021E93FE
	ldr r2, _021E9418 ; =0x00005CA8
	ldr r5, [r4, r2]
	cmp r5, r3
	beq _021E93FE
	add r1, r2, #4
	ldr r1, [r4, r1]
	cmp r1, r3
	beq _021E93FE
	cmp r5, r0
	ble _021E9394
	mov r1, #0
	sub r3, r5, r0
	mvn r1, r1
	b _021E9398
_021E9394:
	sub r3, r0, r5
	mov r1, #1
_021E9398:
	sub r0, r2, #6
	strb r1, [r4, r0]
	cmp r3, #3
	blt _021E93CE
	cmp r3, #0x28
	bgt _021E93CE
	ldr r0, _021E9410 ; =gSystem + 0x40
	ldrh r2, [r0, #0x22]
	ldr r0, _021E941C ; =0x00005CAC
	ldr r1, [r4, r0]
	cmp r1, r2
	ble _021E93B8
	sub r2, r1, r2
	mov r1, #0
	mvn r1, r1
	b _021E93BC
_021E93B8:
	sub r2, r2, r1
	mov r1, #1
_021E93BC:
	sub r0, #9
	strb r1, [r4, r0]
	cmp r2, #0x28
	bgt _021E93FE
	ldr r0, _021E9420 ; =0x00005CA0
	add r0, r4, r0
	bl ov52_021E9424
	b _021E93FE
_021E93CE:
	cmp r3, #0x28
	bgt _021E93FE
	ldr r0, _021E9410 ; =gSystem + 0x40
	ldrh r2, [r0, #0x22]
	ldr r0, _021E941C ; =0x00005CAC
	ldr r1, [r4, r0]
	cmp r1, r2
	ble _021E93E6
	sub r2, r1, r2
	mov r1, #0
	mvn r1, r1
	b _021E93EA
_021E93E6:
	sub r2, r2, r1
	mov r1, #1
_021E93EA:
	sub r0, #9
	strb r1, [r4, r0]
	cmp r2, #3
	blt _021E93FE
	cmp r2, #0x28
	bgt _021E93FE
	ldr r0, _021E9420 ; =0x00005CA0
	add r0, r4, r0
	bl ov52_021E9424
_021E93FE:
	ldr r1, _021E9410 ; =gSystem + 0x40
	ldr r0, _021E9418 ; =0x00005CA8
	ldrh r2, [r1, #0x20]
	str r2, [r4, r0]
	ldrh r1, [r1, #0x22]
	add r0, r0, #4
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
	nop
_021E9410: .word gSystem + 0x40
_021E9414: .word 0x0000FFFF
_021E9418: .word 0x00005CA8
_021E941C: .word 0x00005CAC
_021E9420: .word 0x00005CA0
	thumb_func_end ov52_021E9364

	thumb_func_start ov52_021E9424
ov52_021E9424: ; 0x021E9424
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _021E9448
	mov r0, #1
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _021E9448
	ldr r0, _021E9484 ; =0x00000699
	bl IsSEPlaying
	cmp r0, #0
	bne _021E9448
	ldr r0, _021E9484 ; =0x00000699
	bl PlaySE
_021E9448:
	mov r0, #0
	ldrsb r1, [r4, r0]
	mov r0, #2
	ldrsb r0, [r4, r0]
	mul r0, r1
	bmi _021E9460
	mov r0, #1
	ldrsb r1, [r4, r0]
	mov r0, #3
	ldrsb r0, [r4, r0]
	mul r0, r1
	bpl _021E9470
_021E9460:
	ldr r0, _021E9484 ; =0x00000699
	bl IsSEPlaying
	cmp r0, #0
	bne _021E9470
	ldr r0, _021E9484 ; =0x00000699
	bl PlaySE
_021E9470:
	mov r0, #2
	ldrsb r0, [r4, r0]
	strb r0, [r4]
	mov r0, #3
	ldrsb r0, [r4, r0]
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	pop {r4, pc}
	.balign 4, 0
_021E9484: .word 0x00000699
	thumb_func_end ov52_021E9424

	thumb_func_start ov52_021E9488
ov52_021E9488: ; 0x021E9488
	push {r3, lr}
	cmp r1, #1
	bne _021E949C
	mov r1, #0x25
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, pc}
_021E949C:
	mov r1, #0x25
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov52_021E9488

	.rodata

_021E94AC:
	.byte 0xE0, 0x00, 0xAF, 0x00
	.byte 0x00, 0x00

ov52_021E94B2: ; 0x021E94B2
	.byte 0x48, 0x88, 0x20, 0xE0, 0xFF, 0x00, 0x00, 0x00

ov52_021E94BA: ; 0x021E94BA
	.byte 0xA6, 0xC0, 0xCB, 0xFF, 0xFF, 0x00
	.byte 0x00, 0x00, 0xA6, 0xC0, 0x00, 0x5F, 0xA6, 0xC0, 0x60, 0xBF, 0x00, 0x00

ov52_021E94CC: ; 0x021E94CC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov52_021E94DC: ; 0x021E94DC
	.byte 0x14, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00

ov52_021E94EC: ; 0x021E94EC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov52_021E9508: ; 0x021E9508
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov52_021E9524: ; 0x021E9524
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov52_021E9540: ; 0x021E9540
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov52_021E955C: ; 0x021E955C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov52_021E9578: ; 0x021E9578
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov52_021E95A0: ; 0x021E95A0
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x11, 0x10, 0x01, 0x10, 0x11, 0x10, 0x01, 0x11, 0x11, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x22, 0x22, 0x20, 0x02, 0x22, 0x22, 0x20, 0x02, 0x22, 0x22, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

ov52_021E96C0:
	.word 0
	.word ov52_021E8CF4
	.word ov52_021E8D8C
	.word ov52_021E8DC4
	.word ov52_021E8EDC
	.word ov52_021E8EFC
	.word ov52_021E8E64
	; 0x021E96E0
