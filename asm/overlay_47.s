	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov47_02258800
ov47_02258800: ; 0x02258800
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #5
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x81
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0xa3
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x81
	bl OverlayManager_CreateAndGetData
	mov r2, #0xa3
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #0x81
	bl ov47_02258A1C
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r1, [r5, #4]
	add r0, r4, r0
	mov r2, #0x81
	bl ov47_02258C70
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r2, [r5]
	add r0, r4, r0
	add r1, r4, #0
	mov r3, #0x81
	bl ov47_02259228
	ldr r0, [r5, #8]
	cmp r0, #2
	blt _02258862
	bl GF_AssertFail
_02258862:
	mov r1, #0x81
	str r1, [sp]
	add r3, r5, #0
	ldr r5, [r5, #8]
	add r0, r1, #0
	lsl r6, r5, #2
	ldr r5, _02258890 ; =ov47_02259FB0
	add r0, #0xf7
	add r1, #0xc3
	ldr r5, [r5, r6]
	add r0, r4, r0
	add r1, r4, r1
	add r2, r4, #0
	blx r5
	ldr r0, _02258894 ; =ov47_02258A14
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02258890: .word ov47_02259FB0
_02258894: .word ov47_02258A14
	thumb_func_end ov47_02258800

	thumb_func_start ov47_02258898
ov47_02258898: ; 0x02258898
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl OverlayManager_GetData
	add r7, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _02258996
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022588C0: ; jump table
	.short _022588CA - _022588C0 - 2 ; case 0
	.short _022588F0 - _022588C0 - 2 ; case 1
	.short _02258900 - _022588C0 - 2 ; case 2
	.short _0225895E - _022588C0 - 2 ; case 3
	.short _0225897E - _022588C0 - 2 ; case 4
_022588CA:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x81
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #4]
	mov r1, #1
	bl ov45_0222A520
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258996
_022588F0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02258996
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258996
_02258900:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02258930
	ldr r0, [r5, #4]
	bl ov45_0222A330
	cmp r0, #1
	bne _02258920
	ldr r0, [r5, #4]
	bl ov45_0222A4A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258996
_02258920:
	bl ov45_0222D844
	cmp r0, #1
	bne _02258930
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258996
_02258930:
	mov r1, #0x81
	str r5, [sp]
	str r1, [sp, #4]
	ldr r5, [r5, #8]
	add r0, r1, #0
	lsl r6, r5, #2
	ldr r5, _022589A4 ; =ov47_02259FA8
	mov r3, #0x9a
	add r0, #0xf7
	add r1, #0xc3
	lsl r3, r3, #2
	ldr r5, [r5, r6]
	add r0, r7, r0
	add r1, r7, r1
	add r2, r7, #0
	add r3, r7, r3
	blx r5
	cmp r0, #1
	bne _02258996
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258996
_0225895E:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x81
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258996
_0225897E:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02258996
	mov r0, #0x9a
	lsl r0, r0, #2
	add r0, r7, r0
	bl ov47_022593A0
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02258996:
	add r0, r7, #0
	bl ov47_02258A80
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022589A4: .word ov47_02259FA8
	thumb_func_end ov47_02258898

	thumb_func_start ov47_022589A8
ov47_022589A8: ; 0x022589A8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	ldr r3, [r6, #8]
	mov r1, #0x5e
	lsl r6, r3, #2
	ldr r3, _02258A10 ; =_02259FA0
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x34
	ldr r3, [r3, r6]
	add r1, r4, r1
	add r2, r4, #0
	blx r3
	mov r0, #0x9a
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x81
	bl ov47_02259278
	mov r0, #0x51
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov47_02258CC0
	add r0, r4, #0
	bl ov47_02258A60
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x81
	bl DestroyHeap
	mov r0, #0
	bl sub_0200616C
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_02258A10: .word _02259FA0
	thumb_func_end ov47_022589A8

	thumb_func_start ov47_02258A14
ov47_02258A14: ; 0x02258A14
	ldr r3, _02258A18 ; =ov47_02258A8C
	bx r3
	.balign 4, 0
_02258A18: .word ov47_02258A8C
	thumb_func_end ov47_02258A14

	thumb_func_start ov47_02258A1C
ov47_02258A1C: ; 0x02258A1C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r0, r1, #0
	bl Sav2_PlayerData_GetOptionsAddr
	add r6, r0, #0
	mov r0, #0xd1
	add r1, r4, #0
	bl NARC_ctor
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0x20
	add r1, r4, #0
	bl GF_CreateVramTransferManager
	ldr r0, _02258A5C ; =ov47_02259EC0
	bl GX_SetBanks
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov47_02258AA0
	add r0, r5, #0
	add r1, r4, #0
	bl ov47_02258BB4
	pop {r4, r5, r6, pc}
	nop
_02258A5C: .word ov47_02259EC0
	thumb_func_end ov47_02258A1C

	thumb_func_start ov47_02258A60
ov47_02258A60: ; 0x02258A60
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl NARC_dtor
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov47_02258B8C
	add r0, r4, #0
	bl ov47_02258C44
	pop {r4, pc}
	thumb_func_end ov47_02258A60

	thumb_func_start ov47_02258A80
ov47_02258A80: ; 0x02258A80
	ldr r3, _02258A88 ; =sub_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_02258A88: .word sub_0202457C
	thumb_func_end ov47_02258A80

	thumb_func_start ov47_02258A8C
ov47_02258A8C: ; 0x02258A8C
	push {r3, lr}
	ldr r0, [r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	bl GF_RunVramTransferTasks
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov47_02258A8C

	thumb_func_start ov47_02258AA0
ov47_02258AA0: ; 0x02258AA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _02258B7C ; =ov47_02259E48
	add r7, r2, #0
	str r1, [sp, #0x10]
	bl SetBothScreensModesAndDisable
	add r0, r7, #0
	bl BgConfig_Alloc
	str r0, [r5]
	ldr r0, _02258B80 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0
	ldr r6, _02258B84 ; =ov47_02259F18
	ldr r4, _02258B88 ; =ov47_02259E68
	str r0, [sp, #0x14]
_02258ACA:
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4]
	mov r1, #0x20
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, #0
	add r3, r7, #0
	bl BG_ClearCharDataRange
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [sp, #0x14]
	add r6, #0x1c
	add r0, r0, #1
	add r4, r4, #4
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02258ACA
	mov r0, #0
	mov r1, #0x80
	add r2, r7, #0
	bl LoadFontPal1
	ldr r0, [sp, #0x10]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	mov r1, #1
	ldr r0, [r5]
	add r2, r1, #0
	mov r3, #5
	bl LoadUserFrameGfx2
	mov r0, #0
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0x1f
	mov r3, #6
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r2, [r5]
	mov r0, #0xc6
	mov r1, #2
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	ldr r2, [r5]
	mov r0, #0xc6
	mov r1, #6
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r1, #0
	str r1, [sp]
	mov r0, #0xc6
	mov r2, #4
	add r3, r1, #0
	str r7, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02258B7C: .word ov47_02259E48
_02258B80: .word gSystem + 0x60
_02258B84: .word ov47_02259F18
_02258B88: .word ov47_02259E68
	thumb_func_end ov47_02258AA0

	thumb_func_start ov47_02258B8C
ov47_02258B8C: ; 0x02258B8C
	push {r4, r5, r6, lr}
	ldr r5, _02258BB0 ; =ov47_02259E68
	add r6, r0, #0
	mov r4, #0
_02258B94:
	ldr r1, [r5]
	ldr r0, [r6]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02258B94
	ldr r0, [r6]
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02258BB0: .word ov47_02259E68
	thumb_func_end ov47_02258B8C

	thumb_func_start ov47_02258BB4
ov47_02258BB4: ; 0x02258BB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x1f
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r6, [sp, #0x10]
	bl OamManager_Create
	mov r1, #0x10
	ldr r0, _02258C40 ; =ov47_02259E58
	add r2, r1, #0
	bl sub_020215C0
	mov r0, #0x20
	add r1, r6, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	add r1, r5, #0
	mov r0, #0x20
	add r1, #8
	add r2, r6, #0
	bl G2dRenderer_Init
	mov r7, #0x13
	str r0, [r5, #4]
	mov r4, #0
	lsl r7, r7, #4
_02258C12:
	mov r0, #0x20
	add r1, r4, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02258C12
	bl sub_0203A880
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02258C40: .word ov47_02259E58
	thumb_func_end ov47_02258BB4

	thumb_func_start ov47_02258C44
ov47_02258C44: ; 0x02258C44
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl sub_02024504
	mov r6, #0x13
	mov r4, #0
	lsl r6, r6, #4
_02258C54:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02258C54
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	pop {r4, r5, r6, pc}
	thumb_func_end ov47_02258C44

	thumb_func_start ov47_02258C70
ov47_02258C70: ; 0x02258C70
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _02258CBC ; =ov47_02259E9C
	str r0, [sp]
	add r7, r2, #0
	str r1, [r0, #0x30]
	mov r6, #0
	add r5, r0, #0
_02258C7E:
	ldr r2, [r4]
	mov r0, #0
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	add r6, r6, #1
	add r4, r4, #4
	stmia r5!, {r0}
	cmp r6, #9
	blt _02258C7E
	add r0, r7, #0
	bl ScrStrBufs_new
	ldr r1, [sp]
	str r0, [r1, #0x24]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r7, #0
	bl String_ctor
	ldr r1, [sp]
	str r0, [r1, #0x28]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r7, #0
	bl String_ctor
	ldr r1, [sp]
	str r0, [r1, #0x2c]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02258CBC: .word ov47_02259E9C
	thumb_func_end ov47_02258C70

	thumb_func_start ov47_02258CC0
ov47_02258CC0: ; 0x02258CC0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02258CC8:
	ldr r0, [r5]
	bl DestroyMsgData
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blt _02258CC8
	ldr r0, [r6, #0x24]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x28]
	bl String_dtor
	ldr r0, [r6, #0x2c]
	bl String_dtor
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov47_02258CC0

	thumb_func_start ov47_02258CEC
ov47_02258CEC: ; 0x02258CEC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #9
	blo _02258CFC
	bl GF_AssertFail
_02258CFC:
	lsl r0, r4, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x2c]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r1, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	bl StringExpandPlaceholders
	ldr r0, [r5, #0x28]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov47_02258CEC

	thumb_func_start ov47_02258D18
ov47_02258D18: ; 0x02258D18
	push {r4, lr}
	add r2, r1, #0
	add r4, r0, #0
	cmp r2, #0x3c
	blo _02258D2A
	bhs _02258D28
	bl GF_AssertFail
_02258D28:
	mov r2, #0
_02258D2A:
	cmp r2, #0x32
	bhs _02258D38
	add r0, r4, #0
	mov r1, #1
	bl ov47_02258CEC
	pop {r4, pc}
_02258D38:
	add r0, r4, #0
	mov r1, #2
	sub r2, #0x32
	bl ov47_02258CEC
	pop {r4, pc}
	thumb_func_end ov47_02258D18

	thumb_func_start ov47_02258D44
ov47_02258D44: ; 0x02258D44
	push {r3, r4, r5, lr}
	add r3, r1, #0
	add r4, r0, #0
	add r5, r2, #0
	cmp r3, #0x3c
	blo _02258D58
	bhs _02258D56
	bl GF_AssertFail
_02258D56:
	mov r3, #0
_02258D58:
	cmp r3, #0x32
	bhs _02258D68
	add r0, r4, #0
	add r1, r5, #3
	add r2, r3, #0
	bl ov47_02258CEC
	pop {r3, r4, r5, pc}
_02258D68:
	sub r3, #0x32
	add r0, r4, #0
	add r1, r5, #6
	add r2, r3, #0
	bl ov47_02258CEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov47_02258D44

	thumb_func_start ov47_02258D78
ov47_02258D78: ; 0x02258D78
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r0, r7, #0
	add r4, r1, #0
	bl PlayerProfile_new
	add r6, r0, #0
	ldr r0, [r5, #0x30]
	bl ov45_0222A5C0
	add r1, r6, #0
	add r2, r7, #0
	bl ov45_0222A844
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	add r2, r6, #0
	bl BufferPlayersName
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov47_02258D78

	thumb_func_start ov47_02258DA8
ov47_02258DA8: ; 0x02258DA8
	push {r3, lr}
	ldr r3, [sp, #8]
	bl ov47_02258DD0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov47_02258DA8

	thumb_func_start ov47_02258DB4
ov47_02258DB4: ; 0x02258DB4
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl ov47_02258F48
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov47_02258DB4

	thumb_func_start ov47_02258DC8
ov47_02258DC8: ; 0x02258DC8
	ldr r3, _02258DCC ; =ov47_0225912C
	bx r3
	.balign 4, 0
_02258DCC: .word ov47_0225912C
	thumb_func_end ov47_02258DC8

	thumb_func_start ov47_02258DD0
ov47_02258DD0: ; 0x02258DD0
	push {r4, r5, r6, lr}
	sub sp, #0x70
	add r5, r0, #0
	mov r0, #0x80
	str r0, [sp]
	add r6, r3, #0
	add r4, r2, #0
	mov r2, #0
	str r6, [sp, #4]
	add r0, #0xc0
	ldr r0, [r4, r0]
	mov r1, #0xc7
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #5
	str r6, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	ldr r2, [r4]
	mov r1, #0xc8
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #5
	str r6, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	ldr r2, [r4]
	mov r1, #0xc9
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x14
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #0x13
	str r6, [sp, #8]
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #0x10
	ldr r1, [r4, r1]
	mov r2, #0xcd
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r5, #0x18]
	mov r0, #0x14
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r1, #0x4d
	str r6, [sp, #0xc]
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0xc
	ldr r1, [r4, r1]
	mov r2, #0xcc
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	bl sub_0200ADA4
	cmp r0, #0
	bne _02258E6C
	bl GF_AssertFail
_02258E6C:
	ldr r0, [r5, #0x1c]
	bl sub_0200B00C
	cmp r0, #0
	bne _02258E7A
	bl GF_AssertFail
_02258E7A:
	ldr r0, [r5, #0x18]
	bl sub_0200A740
	ldr r0, [r5, #0x1c]
	bl sub_0200A740
	mov r0, #0x14
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4e
	str r6, [sp, #8]
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #8
	ldr r1, [r4, r1]
	mov r2, #0xce
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0x20]
	mov r0, #0x14
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4f
	str r6, [sp, #8]
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0xcf
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0x24]
	mov r0, #0
	add r2, sp, #0x2c
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x14
	add r2, r1, #0
	str r1, [sp]
	sub r2, #0x15
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	mov r2, #0x13
	str r0, [sp, #0x10]
	lsl r2, r2, #4
	ldr r3, [r4, r2]
	str r3, [sp, #0x14]
	add r3, r2, #4
	ldr r3, [r4, r3]
	str r3, [sp, #0x18]
	add r3, r2, #0
	add r3, #8
	ldr r3, [r4, r3]
	add r2, #0xc
	str r3, [sp, #0x1c]
	ldr r2, [r4, r2]
	add r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x4c
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4, #4]
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x44]
	add r0, sp, #0x2c
	str r6, [sp, #0x48]
	bl sub_02024714
	mov r1, #0
	str r0, [r5, #0x14]
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4]
	ldr r2, _02258F44 ; =ov47_02259E40
	add r1, r5, #0
	bl AddWindow
	add r5, #0x2c
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	bl ov47_02259C8C
	add sp, #0x70
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02258F44: .word ov47_02259E40
	thumb_func_end ov47_02258DD0

	thumb_func_start ov47_02258F48
ov47_02258F48: ; 0x02258F48
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r5, r3, #0
	ldrh r3, [r4, #0x28]
	add r6, r1, #0
	cmp r3, #0xa
	bls _02258F58
	b _02259114
_02258F58:
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02258F64: ; jump table
	.short _02258F7A - _02258F64 - 2 ; case 0
	.short _02258F96 - _02258F64 - 2 ; case 1
	.short _02258FA6 - _02258F64 - 2 ; case 2
	.short _02258FC8 - _02258F64 - 2 ; case 3
	.short _02258FEE - _02258F64 - 2 ; case 4
	.short _02259016 - _02258F64 - 2 ; case 5
	.short _0225906E - _02258F64 - 2 ; case 6
	.short _022590A4 - _02258F64 - 2 ; case 7
	.short _022590D4 - _02258F64 - 2 ; case 8
	.short _022590FA - _02258F64 - 2 ; case 9
	.short _02259104 - _02258F64 - 2 ; case 10
_02258F7A:
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x5e
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	mov r0, #1
	strh r0, [r4, #0x2a]
	mov r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_02258F96:
	add r1, r2, #0
	ldr r2, [sp, #0x14]
	add r0, r5, #0
	bl ov47_02259404
	mov r0, #2
	strh r0, [r4, #0x28]
	b _02259118
_02258FA6:
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov47_02259430
	cmp r0, #0
	beq _02258FBC
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _02258FC2
	b _02259118
_02258FBC:
	mov r0, #3
	strh r0, [r4, #0x28]
	b _02259118
_02258FC2:
	mov r0, #9
	strh r0, [r4, #0x28]
	b _02259118
_02258FC8:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _02258FD2
	mov r2, #0x5c
	b _02258FD4
_02258FD2:
	mov r2, #0x5d
_02258FD4:
	add r0, r6, #0
	mov r1, #0
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	mov r0, #4
	strh r0, [r4, #0x2a]
	mov r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_02258FEE:
	bl ov47_0225916C
	add r0, r4, #0
	add r0, #0x2c
	add r1, r6, #0
	bl ov47_02259D40
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_02259318
	add r0, r4, #0
	bl ov47_022591F8
	add r0, r4, #0
	bl ov47_0225921C
	mov r0, #5
	strh r0, [r4, #0x28]
	b _02259118
_02259016:
	ldr r0, _0225911C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0225902E
	ldr r0, _02259120 ; =0x000005DC
	bl PlaySE
	ldrh r0, [r4, #0x28]
	add r0, r0, #1
	strh r0, [r4, #0x28]
	b _02259118
_0225902E:
	mov r0, #0x40
	tst r0, r1
	beq _0225904A
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	bmi _02259066
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
	b _02259066
_0225904A:
	mov r0, #0x80
	tst r0, r1
	beq _02259066
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	cmp r0, #3
	bge _02259066
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
_02259066:
	add r0, r4, #0
	bl ov47_022591F8
	b _02259118
_0225906E:
	ldr r0, [sp, #0x10]
	ldr r1, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, [r4, #0x10]
	bl ov45_0222A7DC
	ldr r0, [r4, #0x10]
	bl ov45_0222F4D4
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x60
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_02259318
	add r0, r5, #0
	bl ov47_02259384
	ldr r0, _02259124 ; =0x0000057D
	bl PlaySE
	mov r0, #7
	strh r0, [r4, #0x28]
	b _02259118
_022590A4:
	bl ov45_0222F524
	cmp r0, #1
	beq _02259118
	ldr r0, _02259128 ; =0x000005E4
	bl PlaySE
	add r0, r5, #0
	bl ov47_022593A0
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x61
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	mov r0, #8
	strh r0, [r4, #0x2a]
	mov r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_022590D4:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bne _022590DE
	mov r2, #0x62
	b _022590E0
_022590DE:
	mov r2, #0x63
_022590E0:
	add r0, r6, #0
	mov r1, #0
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	mov r0, #9
	strh r0, [r4, #0x2a]
	mov r0, #0xa
	strh r0, [r4, #0x28]
	b _02259118
_022590FA:
	add r0, r5, #0
	bl ov47_022593CC
	mov r0, #1
	pop {r4, r5, r6, pc}
_02259104:
	add r0, r5, #0
	bl ov47_022593B4
	cmp r0, #1
	bne _02259118
	ldrh r0, [r4, #0x2a]
	strh r0, [r4, #0x28]
	b _02259118
_02259114:
	bl GF_AssertFail
_02259118:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225911C: .word gSystem
_02259120: .word 0x000005DC
_02259124: .word 0x0000057D
_02259128: .word 0x000005E4
	thumb_func_end ov47_02258F48

	thumb_func_start ov47_0225912C
ov47_0225912C: ; 0x0225912C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x2c
	add r4, r2, #0
	bl ov47_02259D24
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r5, #0x14]
	bl sub_02024758
	ldr r0, [r5, #0x18]
	bl sub_0200AEB0
	ldr r0, [r5, #0x1c]
	bl sub_0200B0A8
	mov r7, #0x13
	mov r6, #0
	lsl r7, r7, #4
_02259156:
	ldr r0, [r4, r7]
	ldr r1, [r5, #0x18]
	bl DestroySingle2DGfxResObj
	add r6, r6, #1
	add r5, r5, #4
	add r4, r4, #4
	cmp r6, #4
	blt _02259156
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov47_0225912C

	thumb_func_start ov47_0225916C
ov47_0225916C: ; 0x0225916C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x2c
	add r1, r4, #0
	mov r2, #0
	bl ov47_02259D58
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022591F4 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	add r0, r5, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	add r0, #0x2c
	add r1, r4, #0
	mov r2, #1
	bl ov47_02259D58
	add r2, r0, #0
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022591F4 ; =0x00010200
	mov r3, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #1
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	add r0, #0x2c
	add r1, r4, #0
	mov r2, #2
	bl ov47_02259D58
	add r2, r0, #0
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022591F4 ; =0x00010200
	mov r3, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #1
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022591F4: .word 0x00010200
	thumb_func_end ov47_0225916C

	thumb_func_start ov47_022591F8
ov47_022591F8: ; 0x022591F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r2, [r4, #0x10]
	mov r1, #0xc
	ldr r3, _02259218 ; =ov47_02259E78
	mul r1, r2
	ldr r0, [r4, #0x14]
	add r1, r3, r1
	bl sub_020247D4
	pop {r4, pc}
	nop
_02259218: .word ov47_02259E78
	thumb_func_end ov47_022591F8

	thumb_func_start ov47_0225921C
ov47_0225921C: ; 0x0225921C
	ldr r3, _02259224 ; =sub_0202484C
	ldr r0, [r0, #0x14]
	mov r1, #1
	bx r3
	.balign 4, 0
_02259224: .word Set2dSpriteAnimActiveFlag
	thumb_func_end ov47_0225921C

	thumb_func_start ov47_02259228
ov47_02259228: ; 0x02259228
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r1]
	add r1, r5, #0
	add r4, r2, #0
	add r6, r3, #0
	add r1, #8
	mov r2, #1
	mov r3, #2
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #8
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r0, r0, #8
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0x18]
	add r0, r4, #0
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	str r0, [r5, #4]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov47_02259228

	thumb_func_start ov47_02259278
ov47_02259278: ; 0x02259278
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02259296
	ldr r0, [r5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_02259296:
	add r0, r5, #0
	bl ov47_022593A0
	ldr r0, [r5, #0x18]
	bl String_dtor
	add r0, r5, #0
	add r0, #8
	bl RemoveWindow
	add r0, r5, #0
	add r1, r4, #0
	bl ov47_02259448
	pop {r3, r4, r5, pc}
	thumb_func_end ov47_02259278

	thumb_func_start ov47_022592B4
ov47_022592B4: ; 0x022592B4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _022592D4
	ldr r0, [r5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_022592D4:
	add r0, r5, #0
	add r0, #8
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl StringCopy
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #4]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, _02259314 ; =0x0001020F
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x18]
	add r0, #8
	bl AddTextPrinterParameterized2
	str r0, [r5]
	add r5, #8
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #5
	bl DrawFrameAndWindow2
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02259314: .word 0x0001020F
	thumb_func_end ov47_022592B4

	thumb_func_start ov47_02259318
ov47_02259318: ; 0x02259318
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02259338
	ldr r0, [r5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_02259338:
	add r0, r5, #0
	add r0, #8
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl StringCopy
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259380 ; =0x0001020F
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x18]
	add r0, #8
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	mov r1, #1
	add r0, #8
	add r2, r1, #0
	mov r3, #5
	bl DrawFrameAndWindow2
	add r5, #8
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02259380: .word 0x0001020F
	thumb_func_end ov47_02259318

	thumb_func_start ov47_02259384
ov47_02259384: ; 0x02259384
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02259392
	bl GF_AssertFail
_02259392:
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl sub_0200F0AC
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov47_02259384

	thumb_func_start ov47_022593A0
ov47_022593A0: ; 0x022593A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _022593B2
	bl sub_0200F450
	mov r0, #0
	str r0, [r4, #0x1c]
_022593B2:
	pop {r4, pc}
	thumb_func_end ov47_022593A0

	thumb_func_start ov47_022593B4
ov47_022593B4: ; 0x022593B4
	push {r3, lr}
	ldr r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _022593C8
	mov r0, #1
	pop {r3, pc}
_022593C8:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov47_022593B4

	thumb_func_start ov47_022593CC
ov47_022593CC: ; 0x022593CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _022593E8
	ldr r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_022593E8:
	add r0, r4, #0
	bl ov47_022593A0
	add r0, r4, #0
	add r0, #8
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #8
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov47_022593CC

	thumb_func_start ov47_02259404
ov47_02259404: ; 0x02259404
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _02259418
	bl GF_AssertFail
_02259418:
	str r6, [sp]
	ldr r0, [r4]
	ldr r1, _0225942C ; =_02259E38
	mov r2, #0x1f
	mov r3, #6
	bl Std_CreateYesNoMenu
	str r0, [r5, #0x20]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225942C: .word _02259E38
	thumb_func_end ov47_02259404

	thumb_func_start ov47_02259430
ov47_02259430: ; 0x02259430
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02259446
	mov r1, #0
	str r1, [r4, #0x20]
_02259446:
	pop {r4, pc}
	thumb_func_end ov47_02259430

	thumb_func_start ov47_02259448
ov47_02259448: ; 0x02259448
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0225945A
	bl Clear2dMenuWindowAndDelete
	mov r0, #0
	str r0, [r4, #0x20]
_0225945A:
	pop {r4, pc}
	thumb_func_end ov47_02259448

	thumb_func_start ov47_0225945C
ov47_0225945C: ; 0x0225945C
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl ov47_02259488
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov47_0225945C

	thumb_func_start ov47_0225946C
ov47_0225946C: ; 0x0225946C
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl ov47_02259578
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov47_0225946C

	thumb_func_start ov47_02259480
ov47_02259480: ; 0x02259480
	ldr r3, _02259484 ; =ov47_02259968
	bx r3
	.balign 4, 0
_02259484: .word ov47_02259968
	thumb_func_end ov47_02259480

	thumb_func_start ov47_02259488
ov47_02259488: ; 0x02259488
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x30]
	mov r1, #0x80
	str r1, [sp]
	add r6, r2, #0
	add r1, #0xc0
	str r0, [sp, #0x30]
	str r0, [sp, #4]
	ldr r0, [r6, r1]
	mov r2, #0
	str r3, [sp, #0x18]
	mov r1, #0xc7
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	ldr r2, [r6]
	mov r1, #0xc8
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	ldr r2, [r6]
	mov r1, #0xca
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r4, _02259574 ; =ov47_02259EE8
	ldr r5, [sp, #0x10]
	mov r7, #0
_022594E6:
	ldr r0, [r6]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r7, r7, #1
	add r4, #8
	add r5, #0x10
	cmp r7, #6
	blt _022594E6
	mov r3, #0xc1
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, #0x6d
	lsl r3, r3, #0xa
	bl ov47_0225999C
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	mov r1, #0xc8
	mov r2, #0
	add r3, #0x84
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x30]
	add r1, #0x80
	str r0, [r1]
	ldr r0, [sp, #0x10]
	mov r1, #1
	add r0, #0x88
	bl ov47_02259C8C
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x30]
	add r0, #0xa8
	mov r1, #0
	bl ov47_02259C8C
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #4]
	add r1, #0xc8
	bl ov45_0222B21C
	cmp r0, #0
	bne _02259564
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r1, [r1, #4]
	add r0, #0xc8
	bl ov47_02259DCC
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #4]
	add r1, #0xc8
	bl ov45_0222B1FC
_02259564:
	ldr r0, [sp, #0x10]
	add r0, #0xdc
	str r0, [sp, #0x10]
	bl ov47_02259D74
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02259574: .word ov47_02259EE8
	thumb_func_end ov47_02259488

	thumb_func_start ov47_02259578
ov47_02259578: ; 0x02259578
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r2, [sp, #0x14]
	ldr r2, [sp, #0x44]
	add r4, r0, #0
	str r2, [sp, #0x44]
	add r2, r4, #0
	add r2, #0x60
	ldrh r2, [r2]
	add r7, r1, #0
	add r5, r3, #0
	ldr r6, [sp, #0x40]
	cmp r2, #0x16
	bls _02259596
	b _02259944
_02259596:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022595A2: ; jump table
	.short _022595D0 - _022595A2 - 2 ; case 0
	.short _022595FE - _022595A2 - 2 ; case 1
	.short _0225961C - _022595A2 - 2 ; case 2
	.short _0225964A - _022595A2 - 2 ; case 3
	.short _02259678 - _022595A2 - 2 ; case 4
	.short _022596CE - _022595A2 - 2 ; case 5
	.short _022596E0 - _022595A2 - 2 ; case 6
	.short _02259720 - _022595A2 - 2 ; case 7
	.short _02259744 - _022595A2 - 2 ; case 8
	.short _0225976A - _022595A2 - 2 ; case 9
	.short _0225978A - _022595A2 - 2 ; case 10
	.short _022597A6 - _022595A2 - 2 ; case 11
	.short _022597C4 - _022595A2 - 2 ; case 12
	.short _022597D4 - _022595A2 - 2 ; case 13
	.short _02259802 - _022595A2 - 2 ; case 14
	.short _02259820 - _022595A2 - 2 ; case 15
	.short _0225984E - _022595A2 - 2 ; case 16
	.short _0225987C - _022595A2 - 2 ; case 17
	.short _022598DC - _022595A2 - 2 ; case 18
	.short _022598EE - _022595A2 - 2 ; case 19
	.short _02259900 - _022595A2 - 2 ; case 20
	.short _02259922 - _022595A2 - 2 ; case 21
	.short _0225992E - _022595A2 - 2 ; case 22
_022595D0:
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	bne _022595DC
	mov r2, #0x67
	b _022595DE
_022595DC:
	mov r2, #0x69
_022595DE:
	add r0, r7, #0
	mov r1, #0
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #1
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022595FE:
	add r0, #0x88
	bl ov47_02259D40
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #2
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_0225961C:
	ldr r0, _02259950 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _02259628
	b _02259948
_02259628:
	add r0, r7, #0
	mov r1, #0
	mov r2, #0x68
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #3
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_0225964A:
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	bne _02259656
	mov r2, #0x6b
	b _02259658
_02259656:
	mov r2, #0x6c
_02259658:
	add r0, r7, #0
	mov r1, #0
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #4
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259678:
	ldr r0, [r6, #4]
	bl ov45_0222A5C0
	add r1, sp, #0x20
	bl ov45_0222AB0C
	ldr r0, [r6, #4]
	bl ov45_0222A53C
	add r1, r0, #0
	ldr r0, [r6, #4]
	bl ov45_0222AB28
	add r1, sp, #0x20
	str r1, [sp]
	ldr r1, [sp, #0x44]
	ldr r3, [sp, #0x14]
	str r1, [sp, #4]
	ldr r1, _02259954 ; =0x00090A00
	add r2, r7, #0
	str r1, [sp, #8]
	ldr r1, _02259958 ; =0x000D0E00
	str r1, [sp, #0xc]
	add r1, r4, #0
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, #0x88
	bl ov47_022599F0
	add r1, r4, #0
	ldr r2, [sp, #0x14]
	add r0, r4, #0
	add r1, #0xc8
	mov r3, #1
	bl ov47_02259B30
	ldr r0, _0225995C ; =0x000005D7
	bl PlaySE
	mov r0, #5
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022596CE:
	ldr r1, [sp, #0x14]
	bl ov47_02259B74
	cmp r0, #1
	bne _02259758
	mov r0, #6
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022596E0:
	ldr r0, _02259950 ; =gSystem
	mov r1, #1
	ldr r0, [r0, #0x48]
	tst r0, r1
	beq _02259758
	add r0, r4, #0
	add r0, #0xa8
	ldr r2, [r0]
	sub r0, r1, #2
	cmp r2, r0
	beq _022596FE
	mov r0, #7
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022596FE:
	add r0, r7, #0
	mov r1, #0
	mov r2, #0x70
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #0x14
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259720:
	add r0, r7, #0
	mov r1, #0
	mov r2, #0x6f
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_02259318
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x44]
	add r0, r5, #0
	bl ov47_02259404
	mov r0, #8
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259744:
	ldr r1, [sp, #0x44]
	add r0, r5, #0
	bl ov47_02259430
	cmp r0, #0
	beq _0225975A
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _02259762
_02259758:
	b _02259948
_0225975A:
	mov r0, #9
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259762:
	mov r0, #0x14
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_0225976A:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x44]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xa
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_0225978A:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225982A
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x44]
	add r0, r4, #0
	add r1, r7, #0
	bl ov47_02259C3C
	mov r0, #0xb
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022597A6:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	ldr r0, [sp, #0x44]
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xc
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022597C4:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225982A
	mov r0, #0xd
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022597D4:
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _022597E0
	mov r2, #0x71
	b _022597E2
_022597E0:
	mov r2, #0x73
_022597E2:
	add r0, r7, #0
	mov r1, #0
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #0xe
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259802:
	add r0, #0xa8
	bl ov47_02259D40
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #0xf
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259820:
	ldr r0, _02259950 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _0225982C
_0225982A:
	b _02259948
_0225982C:
	add r0, r7, #0
	mov r1, #0
	mov r2, #0x72
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_0225984E:
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _0225985A
	mov r2, #0x75
	b _0225985C
_0225985A:
	mov r2, #0x76
_0225985C:
	add r0, r7, #0
	mov r1, #0
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #0x11
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_0225987C:
	ldr r0, [r6]
	bl sub_020318E8
	add r5, r0, #0
	bl sub_020318F4
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl sub_020318F8
	str r0, [sp, #0x1c]
	ldr r0, [r6, #4]
	bl ov45_0222A53C
	add r1, r0, #0
	ldr r0, [r6, #4]
	bl ov45_0222AB28
	add r1, sp, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x44]
	ldr r3, [sp, #0x14]
	str r1, [sp, #4]
	ldr r1, _02259960 ; =0x000B0C00
	add r2, r7, #0
	str r1, [sp, #8]
	ldr r1, _02259964 ; =0x000F0E00
	str r1, [sp, #0xc]
	add r1, r4, #0
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r1, #0xa8
	bl ov47_022599F0
	add r1, r4, #0
	ldr r2, [sp, #0x14]
	add r0, r4, #0
	add r1, #0xdc
	mov r3, #2
	bl ov47_02259B30
	ldr r0, _0225995C ; =0x000005D7
	bl PlaySE
	mov r0, #0x12
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022598DC:
	ldr r1, [sp, #0x14]
	bl ov47_02259B74
	cmp r0, #1
	bne _02259948
	mov r0, #0x13
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_022598EE:
	ldr r0, _02259950 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02259948
	mov r0, #0x14
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259900:
	add r0, r7, #0
	mov r1, #0
	mov r2, #0x78
	bl ov47_02258CEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov47_022592B4
	add r0, r4, #0
	mov r1, #0x15
	add r0, #0x62
	strh r1, [r0]
	mov r0, #0x16
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259922:
	add r0, r5, #0
	bl ov47_022593CC
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225992E:
	add r0, r5, #0
	bl ov47_022593B4
	cmp r0, #1
	bne _02259948
	add r0, r4, #0
	add r0, #0x62
	ldrh r0, [r0]
	add r4, #0x60
	strh r0, [r4]
	b _02259948
_02259944:
	bl GF_AssertFail
_02259948:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259950: .word gSystem
_02259954: .word 0x00090A00
_02259958: .word 0x000D0E00
_0225995C: .word 0x000005D7
_02259960: .word 0x000B0C00
_02259964: .word 0x000F0E00
	thumb_func_end ov47_02259578

	thumb_func_start ov47_02259968
ov47_02259968: ; 0x02259968
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x88
	bl ov47_02259D24
	add r0, r5, #0
	add r0, #0xa8
	bl ov47_02259D24
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r5, #0
	mov r4, #0
	add r0, #0x80
	str r4, [r0]
_0225998C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _0225998C
	pop {r3, r4, r5, pc}
	thumb_func_end ov47_02259968

	thumb_func_start ov47_0225999C
ov47_0225999C: ; 0x0225999C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r7, r2, #0
	mov r1, #0
	add r5, r0, #0
	add r4, r3, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	mov r1, #0
	add r2, r7, #0
	bl ov47_02258CEC
	add r6, r0, #0
	mov r0, #1
	add r1, r6, #0
	mov r2, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r4, #0x90
	mov r0, #0
	sub r3, r4, r3
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov47_0225999C

	thumb_func_start ov47_022599F0
ov47_022599F0: ; 0x022599F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r0, #0
	str r1, [sp, #0x20]
	add r0, #0x10
	mov r1, #0
	str r2, [sp, #0x10]
	ldr r7, [sp, #0x38]
	ldr r4, [sp, #0x40]
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r0, #0x50
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	mov r2, #0
	bl ov47_02259D58
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r6, #0
	str r4, [sp, #8]
	add r0, #0x10
	mov r1, #1
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	mov r2, #1
	bl ov47_02259D58
	add r2, r0, #0
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r6, #0
	str r4, [sp, #8]
	mov r3, #0
	add r0, #0x10
	mov r1, #1
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	mov r2, #2
	bl ov47_02259D58
	add r2, r0, #0
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r6, #0
	str r4, [sp, #8]
	mov r3, #0
	add r0, #0x10
	mov r1, #1
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	ldr r1, [r7]
	ldr r0, [r0, #4]
	cmp r1, r0
	bne _02259B1C
	ldr r0, [r7, #4]
	cmp r0, #3
	bhs _02259B1C
	ldr r0, [sp, #0x48]
	cmp r0, #1
	bne _02259A96
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x14]
	b _02259A98
_02259A96:
	str r4, [sp, #0x14]
_02259A98:
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x3c]
	mov r1, #0
	bl ov47_02258D78
	ldr r0, [sp, #0x10]
	mov r1, #0
	mov r2, #0x6e
	bl ov47_02258CEC
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	mov r0, #1
	mov r2, #0
	bl FontID_String_GetWidth
	str r0, [sp, #0x1c]
	mov r1, #0
	ldr r3, [sp, #0x1c]
	mov r5, #0x60
	sub r5, r5, r3
	lsr r3, r5, #0x1f
	add r3, r5, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	add r0, #0x50
	mov r1, #1
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	ldr r2, [r7, #4]
	bl ov47_02259D58
	add r5, r0, #0
	mov r0, #1
	add r1, r5, #0
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r4, #0x68
	sub r4, r4, r3
	lsr r3, r4, #0x1f
	add r3, r4, r3
	add r0, r6, #0
	asr r3, r3, #1
	str r1, [sp, #0xc]
	add r0, #0x50
	mov r1, #1
	add r2, r5, #0
	add r3, #0x60
	bl AddTextPrinterParameterized2
_02259B1C:
	add r0, r6, #0
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add r6, #0x10
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov47_022599F0

	thumb_func_start ov47_02259B30
ov47_02259B30: ; 0x02259B30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	lsl r0, r3, #0x18
	mov r4, #0
	lsr r0, r0, #0x18
	str r1, [sp]
	str r4, [r6, #0x64]
	add r5, r6, #0
	str r0, [sp, #4]
_02259B44:
	mov r0, #0
	str r0, [r5, #0x68]
	ldr r0, [sp]
	add r1, r4, #0
	mov r2, #0x50
	bl ov47_02259DA4
	str r0, [r5, #0x74]
	add r0, r4, #2
	lsl r7, r0, #4
	ldr r1, [sp, #4]
	add r0, r6, r7
	bl SetWindowPaletteNum
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _02259B44
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov47_02259B30

	thumb_func_start ov47_02259B74
ov47_02259B74: ; 0x02259B74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r0, #0
	ldr r0, [r6, #0x64]
	cmp r0, #0x14
	blt _02259B86
	add sp, #0x2c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02259B86:
	add r1, r0, #1
	mov r0, #0x50
	str r1, [r6, #0x64]
	mul r0, r1
	mov r1, #0x14
	bl _s32_div_f
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r6, [sp, #0x18]
_02259B9E:
	ldr r0, [sp, #0x18]
	ldr r2, [r0, #0x74]
	ldr r0, [r0, #0x68]
	cmp r0, r2
	bne _02259BB0
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	b _02259C18
_02259BB0:
	ldr r1, [sp, #0x24]
	cmp r2, r1
	blt _02259BBE
	sub r4, r1, r0
	add r2, r1, #0
	ldr r1, [sp, #0x18]
	b _02259BC2
_02259BBE:
	ldr r1, [sp, #0x18]
	sub r4, r2, r0
_02259BC2:
	mov r5, #0
	str r2, [r1, #0x68]
	cmp r4, #0
	ble _02259C0C
	ldr r1, [sp, #0x20]
	add r0, r0, #4
	add r1, r1, #2
	lsl r7, r1, #4
	str r0, [sp, #0x28]
_02259BD4:
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r6, #0
	add r0, r0, r5
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0x10
	str r0, [sp, #0x14]
	add r1, #0x84
	ldr r1, [r1]
	add r0, r6, r7
	ldr r1, [r1, #0x14]
	mov r2, #0xf7
	mov r3, #0x10
	bl BlitBitmapRectToWindow
	add r5, r5, #1
	cmp r5, r4
	blt _02259BD4
_02259C0C:
	ldr r0, [sp, #0x20]
	add r0, r0, #2
	lsl r0, r0, #4
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
_02259C18:
	ldr r0, [sp, #0x18]
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #3
	blt _02259B9E
	ldr r0, [sp, #0x1c]
	cmp r0, #3
	bne _02259C34
	add sp, #0x2c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02259C34:
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov47_02259B74

	thumb_func_start ov47_02259C3C
ov47_02259C3C: ; 0x02259C3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	add r7, r0, #0
	str r4, [sp, #8]
	mov r0, #5
	str r3, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r2, r0]
	str r1, [sp, #0x10]
	ldr r2, [r2]
	mov r1, #0xcb
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r5, r7, #0
	add r6, r4, #0
_02259C62:
	add r0, r5, #0
	add r1, r6, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl CopyWindowToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _02259C62
	ldr r1, [sp, #0x10]
	ldr r3, _02259C88 ; =0x00050600
	add r0, r7, #0
	mov r2, #0x77
	bl ov47_0225999C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02259C88: .word 0x00050600
	thumb_func_end ov47_02259C3C

	thumb_func_start ov47_02259C8C
ov47_02259C8C: ; 0x02259C8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	add r7, r2, #0
	str r1, [sp]
	lsl r0, r0, #8
	add r1, r7, #0
	bl String_ctor
	str r0, [r5, #0x10]
	mov r6, #0
	add r4, r5, #0
_02259CA4:
	mov r0, #1
	lsl r0, r0, #8
	add r1, r7, #0
	bl String_ctor
	str r0, [r4, #0x14]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	blt _02259CA4
	ldr r0, [sp]
	cmp r0, #1
	bne _02259CC2
	mov r6, #0
	b _02259CC4
_02259CC2:
	mov r6, #4
_02259CC4:
	add r0, r6, #2
	bl ov45_0222F544
	str r0, [r5, #8]
	add r0, r6, #1
	bl ov45_0222F544
	str r0, [r5]
	add r0, r6, #0
	bl ov45_0222F544
	str r0, [r5, #4]
	add r0, r6, #3
	bl ov45_0222F544
	str r0, [r5, #0xc]
	cmp r0, #1
	bne _02259D20
	add r0, r6, #0
	bl ov45_0222F628
	add r4, r0, #0
	bne _02259CF6
	bl GF_AssertFail
_02259CF6:
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl CopyU16ArrayToString
	mov r4, #0
	add r7, r6, #1
_02259D02:
	add r0, r7, r4
	bl ov45_0222F628
	add r6, r0, #0
	bne _02259D10
	bl GF_AssertFail
_02259D10:
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	bl CopyU16ArrayToString
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _02259D02
_02259D20:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov47_02259C8C

	thumb_func_start ov47_02259D24
ov47_02259D24: ; 0x02259D24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl String_dtor
	mov r4, #0
_02259D30:
	ldr r0, [r5, #0x14]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _02259D30
	pop {r3, r4, r5, pc}
	thumb_func_end ov47_02259D24

	thumb_func_start ov47_02259D40
ov47_02259D40: ; 0x02259D40
	push {r3, lr}
	add r2, r0, #0
	ldr r0, [r2, #0xc]
	cmp r0, #0
	bne _02259D54
	add r0, r1, #0
	ldr r1, [r2]
	bl ov47_02258D18
	pop {r3, pc}
_02259D54:
	ldr r0, [r2, #0x10]
	pop {r3, pc}
	thumb_func_end ov47_02259D40

	thumb_func_start ov47_02259D58
ov47_02259D58: ; 0x02259D58
	push {r3, lr}
	add r3, r0, #0
	ldr r0, [r3, #0xc]
	cmp r0, #0
	bne _02259D6C
	add r0, r1, #0
	ldr r1, [r3]
	bl ov47_02258D44
	pop {r3, pc}
_02259D6C:
	lsl r0, r2, #2
	add r0, r3, r0
	ldr r0, [r0, #0x14]
	pop {r3, pc}
	thumb_func_end ov47_02259D58

	thumb_func_start ov47_02259D74
ov47_02259D74: ; 0x02259D74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	str r6, [r5, #0xc]
	add r4, r5, #0
	str r6, [r5, #0x10]
	add r4, #0xc
	add r7, r6, #0
_02259D84:
	add r0, r6, #0
	add r0, #8
	bl ov45_0222F544
	str r0, [r5]
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r1, r0
	adc r2, r7
	str r0, [r4]
	add r6, r6, #1
	add r5, r5, #4
	str r2, [r4, #4]
	cmp r6, #3
	blt _02259D84
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov47_02259D74

	thumb_func_start ov47_02259DA4
ov47_02259DA4: ; 0x02259DA4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #3
	blo _02259DB4
	bl GF_AssertFail
_02259DB4:
	lsl r2, r4, #2
	mov r1, #0
	ldr r2, [r5, r2]
	add r0, r6, #0
	add r3, r1, #0
	bl _ll_mul
	ldr r2, [r5, #0xc]
	ldr r3, [r5, #0x10]
	bl _ll_udiv
	pop {r4, r5, r6, pc}
	thumb_func_end ov47_02259DA4

	thumb_func_start ov47_02259DCC
ov47_02259DCC: ; 0x02259DCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	str r1, [sp]
	add r2, r6, #0
	mov r1, #0x14
	mov r0, #0
_02259DDA:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02259DDA
	add r4, r6, #0
	mov r5, #0
	add r4, #0xc
_02259DE8:
	ldr r0, [sp]
	add r1, r5, #0
	bl ov45_0222A578
	add r7, r0, #0
	beq _02259E2A
	bl ov45_0222AA54
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, sp, #8
	bl ov45_0222AB0C
	ldr r1, [sp, #4]
	mov r0, #0
	bl ov45_0222F6B0
	cmp r0, #1
	bne _02259E2A
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bhs _02259E2A
	lsl r1, r0, #2
	ldr r0, [r6, r1]
	add r0, r0, #1
	str r0, [r6, r1]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r0, #1
	ldr r0, _02259E34 ; =0x00000000
	str r2, [r4]
	adc r1, r0
	str r1, [r4, #4]
_02259E2A:
	add r5, r5, #1
	cmp r5, #0x14
	blt _02259DE8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259E34: .word 0x00000000
	thumb_func_end ov47_02259DCC

	.rodata

_02259E38:
	.byte 0x01, 0x19, 0x0D, 0x06, 0x04, 0x04, 0x94, 0x00

ov47_02259E40: ; 0x02259E40
	.byte 0x02, 0x0B, 0x07, 0x0F, 0x08, 0x03, 0x01, 0x00

ov47_02259E48: ; 0x02259E48
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov47_02259E58: ; 0x02259E58
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00

ov47_02259E68: ; 0x02259E68
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov47_02259E78: ; 0x02259E78
	.byte 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x04, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00

ov47_02259E9C: ; 0x02259E9C
	.byte 0x09, 0x03, 0x00, 0x00
	.byte 0xF9, 0x02, 0x00, 0x00, 0xFD, 0x02, 0x00, 0x00, 0xF6, 0x02, 0x00, 0x00, 0xF7, 0x02, 0x00, 0x00
	.byte 0xF8, 0x02, 0x00, 0x00, 0xFA, 0x02, 0x00, 0x00, 0xFB, 0x02, 0x00, 0x00, 0xFC, 0x02, 0x00, 0x00

ov47_02259EC0: ; 0x02259EC0
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov47_02259EE8: ; 0x02259EE8
	.byte 0x02, 0x07, 0x01, 0x12, 0x03, 0x03, 0x01, 0x00
	.byte 0x02, 0x05, 0x05, 0x0C, 0x09, 0x03, 0x37, 0x00, 0x02, 0x11, 0x05, 0x0B, 0x02, 0x04, 0xA3, 0x00
	.byte 0x02, 0x11, 0x08, 0x0B, 0x02, 0x04, 0xB9, 0x00, 0x02, 0x11, 0x0B, 0x0B, 0x02, 0x04, 0xCF, 0x00
	.byte 0x02, 0x03, 0x0F, 0x19, 0x02, 0x03, 0xE5, 0x00

ov47_02259F18: ; 0x02259F18
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_02259FA0:
	.word ov47_02258DC8
	.word ov47_02259480

ov47_02259FA8: ; 0x02259FA8
	.word ov47_02258DB4
	.word ov47_0225946C

ov47_02259FB0: ; 0x02259FB0
	.word ov47_02258DA8
	.word ov47_0225945C
	; 0x02259FC0
