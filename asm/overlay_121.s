	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov121_021E5900
ov121_021E5900: ; 0x021E5900
	push {r3, lr}
	bl ov121_021E5AEC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov121_021E5900

	thumb_func_start ov121_021E590C
ov121_021E590C: ; 0x021E590C
	push {r3, r4, lr}
	sub sp, #0xc
	bl OverlayManager_GetData
	mov r1, #0x23
	add r4, r0, #0
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	cmp r1, #4
	bhi _021E59B0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E592C: ; jump table
	.short _021E5936 - _021E592C - 2 ; case 0
	.short _021E5956 - _021E592C - 2 ; case 1
	.short _021E5968 - _021E592C - 2 ; case 2
	.short _021E597A - _021E592C - 2 ; case 3
	.short _021E599C - _021E592C - 2 ; case 4
_021E5936:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x9e
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x23
	mov r1, #1
	lsl r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E5956:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E59B0
	mov r0, #0x23
	mov r1, #2
	lsl r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E5968:
	bl ov121_021E5C50
	cmp r0, #0
	beq _021E59B0
	mov r0, #0x23
	mov r1, #3
	lsl r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E597A:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x9e
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0x23
	mov r1, #4
	lsl r0, r0, #4
	strb r1, [r4, r0]
	b _021E59B0
_021E599C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E59B0
	add r0, r4, #0
	bl ov121_021E6F78
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E59B0:
	add r0, r4, #0
	bl ov121_021E5CB4
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov121_021E590C

	thumb_func_start ov121_021E59BC
ov121_021E59BC: ; 0x021E59BC
	push {r3, r4, r5, r6, r7, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _021E5AE0 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldr r0, _021E5AE4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	add r0, r4, #0
	bl ov121_021E6A4C
	add r0, r4, #4
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x14
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x24
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x34
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x44
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x54
	bl RemoveWindow
	ldr r0, [r4]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl ov121_021E611C
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	mov r7, #0x71
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_021E5A5A:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #6
	blt _021E5A5A
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	bl sub_02024504
	mov r0, #4
	bl FontID_Release
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_02016624
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, [r4]
	bl FreeToHeap
	ldr r0, _021E5AE8 ; =0x0000025E
	mov r5, #0
	ldrb r0, [r4, r0]
	add r0, r0, #1
	cmp r0, #0
	ble _021E5AC4
	ldr r7, _021E5AE8 ; =0x0000025E
	add r6, r4, #0
_021E5AAE:
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0202EAFC
	ldrb r0, [r4, r7]
	add r5, r5, #1
	add r6, r6, #4
	add r0, r0, #1
	cmp r5, r0
	blt _021E5AAE
_021E5AC4:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x9e
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5AE0: .word gSystem + 0x60
_021E5AE4: .word 0x04000050
_021E5AE8: .word 0x0000025E
	thumb_func_end ov121_021E59BC

	thumb_func_start ov121_021E5AEC
ov121_021E5AEC: ; 0x021E5AEC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #1
	add r4, r0, #0
	mov r0, #3
	mov r1, #0x9e
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0x9b
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0x9e
	bl OverlayManager_CreateAndGetData
	mov r2, #0x9b
	mov r1, #0
	lsl r2, r2, #2
	add r5, r0, #0
	bl memset
	mov r0, #0x9e
	bl BgConfig_Alloc
	str r0, [r5]
	bl ov121_021E5D84
	ldr r0, [r5]
	bl ov121_021E5DA4
	bl ov121_021E5EDC
	bl ov121_021E5F0C
	add r0, r5, #0
	mov r1, #0x9e
	bl ov121_021E600C
	add r0, r5, #0
	bl ov121_021E60D4
	mov r0, #0x9e
	bl sub_0201660C
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	ldr r0, [r4, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	mov r1, #0x9a
	lsl r1, r1, #2
	strb r0, [r5, r1]
	ldr r0, _021E5C3C ; =ov121_021E5F30
	ldr r1, [r5]
	bl Main_SetVBlankIntrCB
	mov r0, #0x23
	mov r1, #0
	lsl r0, r0, #4
	strb r1, [r5, r0]
	bl ResetAllTextPrinters
	mov r0, #4
	mov r1, #0x9e
	bl FontID_Alloc
	ldr r0, [r5]
	mov r1, #0x9e
	bl ov121_021E5F58
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x9e
	bl LoadFontPal0
	add r0, r5, #0
	bl ov121_021E66EC
	add r0, r5, #0
	bl ov121_021E6194
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	mov r1, #0x9e
	bl ov121_021E62A0
	ldr r0, _021E5C40 ; =0x00000233
	mov r1, #1
	strb r1, [r5, r0]
	ldr r0, [r4, #4]
	bl sub_0202E530
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldrh r0, [r4]
	mov r1, #3
	bl _s32_div_f
	mov r0, #0x97
	lsl r0, r0, #2
	strb r1, [r5, r0]
	ldrh r0, [r4]
	mov r1, #3
	bl _s32_div_f
	ldr r1, _021E5C44 ; =0x0000025D
	strb r0, [r5, r1]
	sub r0, r1, #1
	ldrb r0, [r5, r0]
	bl sub_0202E4B0
	ldr r1, _021E5C48 ; =0x0000025E
	strb r0, [r5, r1]
	sub r0, r1, #2
	ldrb r0, [r5, r0]
	bl sub_0202E4BC
	ldr r1, _021E5C4C ; =0x0000025F
	strb r0, [r5, r1]
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl ov121_021E67FC
	mov r0, #0x26
	ldrh r1, [r4, #2]
	lsl r0, r0, #4
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	sub r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	blo _021E5C14
	bl GF_AssertFail
	mov r0, #0x26
	mov r1, #0
	lsl r0, r0, #4
	strb r1, [r5, r0]
_021E5C14:
	add r0, r5, #0
	bl ov121_021E69F0
	add r0, r5, #0
	mov r1, #0
	bl ov121_021E6690
	add r0, r5, #0
	bl ov121_021E6A84
	add r0, r5, #0
	bl ov121_021E6C5C
	add r0, r5, #0
	bl ov121_021E6CA4
	add r0, r5, #0
	bl ov121_021E6DD8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5C3C: .word ov121_021E5F30
_021E5C40: .word 0x00000233
_021E5C44: .word 0x0000025D
_021E5C48: .word 0x0000025E
_021E5C4C: .word 0x0000025F
	thumb_func_end ov121_021E5AEC

	thumb_func_start ov121_021E5C50
ov121_021E5C50: ; 0x021E5C50
	push {r4, lr}
	ldr r1, _021E5CB0 ; =0x00000233
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #4
	bhi _021E5CAC
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E5C68: ; jump table
	.short _021E5C72 - _021E5C68 - 2 ; case 0
	.short _021E5C7E - _021E5C68 - 2 ; case 1
	.short _021E5C8A - _021E5C68 - 2 ; case 2
	.short _021E5C90 - _021E5C68 - 2 ; case 3
	.short _021E5CA0 - _021E5C68 - 2 ; case 4
_021E5C72:
	bl ov121_021E6A84
	ldr r0, _021E5CB0 ; =0x00000233
	mov r1, #1
	strb r1, [r4, r0]
	b _021E5CAC
_021E5C7E:
	bl ov121_021E5CC4
	cmp r0, #0
	beq _021E5CAC
	mov r0, #1
	pop {r4, pc}
_021E5C8A:
	bl ov121_021E5D08
	b _021E5CAC
_021E5C90:
	bl ov121_021E5D5C
	cmp r0, #0
	beq _021E5CAC
	ldr r0, _021E5CB0 ; =0x00000233
	mov r1, #1
	strb r1, [r4, r0]
	b _021E5CAC
_021E5CA0:
	add r0, r1, #0
	add r0, #0x25
	ldr r0, [r4, r0]
	mov r2, #0
	strh r2, [r0, #4]
	strb r2, [r4, r1]
_021E5CAC:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E5CB0: .word 0x00000233
	thumb_func_end ov121_021E5C50

	thumb_func_start ov121_021E5CB4
ov121_021E5CB4: ; 0x021E5CB4
	push {r3, lr}
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	beq _021E5CC2
	bl sub_0202457C
_021E5CC2:
	pop {r3, pc}
	thumb_func_end ov121_021E5CB4

	thumb_func_start ov121_021E5CC4
ov121_021E5CC4: ; 0x021E5CC4
	push {r3, r4, lr}
	sub sp, #4
	add r1, sp, #0
	add r4, r0, #0
	bl ov121_021E633C
	add r1, r0, #0
	bne _021E5CDA
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_021E5CDA:
	ldr r0, _021E5D04 ; =0x00000231
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E5CF4
	ldr r2, [sp]
	add r0, r4, #0
	bl ov121_021E6404
	cmp r0, #0
	beq _021E5CFC
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_021E5CF4:
	ldr r2, [sp]
	add r0, r4, #0
	bl ov121_021E6478
_021E5CFC:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E5D04: .word 0x00000231
	thumb_func_end ov121_021E5CC4

	thumb_func_start ov121_021E5D08
ov121_021E5D08: ; 0x021E5D08
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021E5D1E
	cmp r0, #2
	beq _021E5D3A
	pop {r4, pc}
_021E5D1E:
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020169CC
	bl ov121_021E6F6C
	ldr r0, _021E5D58 ; =0x00000233
	mov r1, #4
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov121_021E6E68
	pop {r4, pc}
_021E5D3A:
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020169CC
	bl ov121_021E6F6C
	ldr r0, _021E5D58 ; =0x00000233
	mov r1, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov121_021E6E68
	pop {r4, pc}
	nop
_021E5D58: .word 0x00000233
	thumb_func_end ov121_021E5D08

	thumb_func_start ov121_021E5D5C
ov121_021E5D5C: ; 0x021E5D5C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E5D80 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _021E5D70
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E5D7A
_021E5D70:
	add r0, r4, #0
	bl ov121_021E6E68
	mov r0, #1
	pop {r4, pc}
_021E5D7A:
	mov r0, #0
	pop {r4, pc}
	nop
_021E5D80: .word gSystem
	thumb_func_end ov121_021E5D5C

	thumb_func_start ov121_021E5D84
ov121_021E5D84: ; 0x021E5D84
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5DA0 ; =ov121_021E70E8
	add r3, sp, #0
	mov r2, #5
_021E5D8E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5D8E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5DA0: .word ov121_021E70E8
	thumb_func_end ov121_021E5D84

	thumb_func_start ov121_021E5DA4
ov121_021E5DA4: ; 0x021E5DA4
	push {r3, r4, r5, lr}
	sub sp, #0xa0
	add r4, r0, #0
	ldr r0, _021E5EC0 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r5, _021E5EC4 ; =ov121_021E701C
	add r3, sp, #0x90
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5EC8 ; =ov121_021E7058
	add r3, sp, #0x74
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
	ldr r5, _021E5ECC ; =ov121_021E7074
	add r3, sp, #0x58
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
	ldr r5, _021E5ED0 ; =ov121_021E7090
	add r3, sp, #0x3c
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
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5ED4 ; =ov121_021E703C
	add r3, sp, #0x20
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5ED8 ; =ov121_021E70AC
	add r3, sp, #4
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
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	str r1, [sp]
	bl BG_FillCharDataRange
	mov r1, #1
	mov r2, #0
	add r0, r4, #0
	add r3, r1, #0
	str r2, [sp]
	bl BG_FillCharDataRange
	mov r2, #0
	add r0, r4, #0
	mov r1, #2
	mov r3, #1
	str r2, [sp]
	bl BG_FillCharDataRange
	add sp, #0xa0
	pop {r3, r4, r5, pc}
	nop
_021E5EC0: .word gSystem + 0x60
_021E5EC4: .word ov121_021E701C
_021E5EC8: .word ov121_021E7058
_021E5ECC: .word ov121_021E7074
_021E5ED0: .word ov121_021E7090
_021E5ED4: .word ov121_021E703C
_021E5ED8: .word ov121_021E70AC
	thumb_func_end ov121_021E5DA4

	thumb_func_start ov121_021E5EDC
ov121_021E5EDC: ; 0x021E5EDC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E5F08 ; =ov121_021E702C
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #1
	mov r1, #0x9e
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E5F08: .word ov121_021E702C
	thumb_func_end ov121_021E5EDC

	thumb_func_start ov121_021E5F0C
ov121_021E5F0C: ; 0x021E5F0C
	push {lr}
	sub sp, #0x14
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x9e
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	add sp, #0x14
	pop {pc}
	thumb_func_end ov121_021E5F0C

	thumb_func_start ov121_021E5F30
ov121_021E5F30: ; 0x021E5F30
	push {r4, lr}
	add r4, r0, #0
	bl OamManager_ApplyAndResetBuffers
	add r0, r4, #0
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	ldr r3, _021E5F50 ; =0x027E0000
	ldr r1, _021E5F54 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5F50: .word 0x027E0000
_021E5F54: .word 0x00003FF8
	thumb_func_end ov121_021E5F30

	thumb_func_start ov121_021E5F58
ov121_021E5F58: ; 0x021E5F58
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x40
	mov r2, #0
	add r4, r1, #0
	str r0, [sp]
	add r0, #0xc6
	mov r1, #1
	add r3, r2, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #3
	ldr r0, _021E6008 ; =0x00000106
	add r2, r5, #0
	add r3, r1, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6008 ; =0x00000106
	mov r1, #5
	add r2, r5, #0
	mov r3, #3
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	mov r0, #0x20
	str r0, [sp]
	mov r1, #0
	add r0, #0xe6
	mov r2, #4
	add r3, r1, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6008 ; =0x00000106
	mov r1, #2
	add r2, r5, #0
	mov r3, #4
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #4
	ldr r0, _021E6008 ; =0x00000106
	add r2, r5, #0
	add r3, r1, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6008: .word 0x00000106
	thumb_func_end ov121_021E5F58

	thumb_func_start ov121_021E600C
ov121_021E600C: ; 0x021E600C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r7, r1, #0
	add r1, r6, #0
	mov r0, #5
	add r1, #0x9c
	add r2, r7, #0
	bl G2dRenderer_Init
	add r1, r6, #0
	add r1, #0x98
	str r0, [r1]
	mov r4, #0
	add r5, r6, #0
_021E602A:
	mov r0, #1
	add r1, r4, #0
	add r2, r7, #0
	bl Create2DGfxResObjMan
	mov r1, #0x71
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _021E602A
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r6, r1]
	sub r1, #0xbe
	mov r2, #9
	bl AddCharResObjFromNarc
	mov r1, #0x77
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	add r0, r1, #0
	str r7, [sp, #0xc]
	sub r0, #0x14
	ldr r0, [r6, r0]
	sub r1, #0xd6
	mov r2, #6
	bl AddPlttResObjFromNarc
	mov r1, #0x1e
	lsl r1, r1, #4
	str r0, [r6, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r1, #0
	str r7, [sp, #8]
	sub r0, #0x14
	ldr r0, [r6, r0]
	sub r1, #0xda
	mov r2, #8
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	add r0, r1, #0
	str r7, [sp, #8]
	sub r0, #0x14
	ldr r0, [r6, r0]
	sub r1, #0xde
	mov r2, #7
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x7a
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r1, #0xc
	ldr r0, [r6, r1]
	bl sub_0200ADA4
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200AF94
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov121_021E600C

	thumb_func_start ov121_021E60D4
ov121_021E60D4: ; 0x021E60D4
	push {lr}
	sub sp, #0x2c
	mov r1, #0
	str r1, [sp]
	sub r2, r1, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	mov r3, #0x71
	str r1, [sp, #0xc]
	mov r2, #3
	lsl r3, r3, #2
	str r2, [sp, #0x10]
	ldr r2, [r0, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r0, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r0, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r0, r2]
	add r3, #0x30
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r0, r3
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	add sp, #0x2c
	pop {pc}
	.balign 4, 0
	thumb_func_end ov121_021E60D4

	thumb_func_start ov121_021E611C
ov121_021E611C: ; 0x021E611C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E612E
	bl sub_02024758
_021E612E:
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E613C
	bl sub_02024758
_021E613C:
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E614A
	bl sub_02024758
_021E614A:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6158
	bl sub_02024758
_021E6158:
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6166
	bl sub_02024758
_021E6166:
	pop {r4, pc}
	thumb_func_end ov121_021E611C

	thumb_func_start ov121_021E6168
ov121_021E6168: ; 0x021E6168
	add r2, r1, #0
	add r2, #0x98
	ldr r2, [r2]
	str r2, [r0]
	mov r2, #0x7d
	lsl r2, r2, #2
	add r1, r1, r2
	str r1, [r0, #4]
	mov r2, #0
	mov r1, #1
	str r2, [r0, #0x10]
	lsl r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	str r2, [r0, #0x24]
	mov r1, #1
	str r1, [r0, #0x28]
	mov r1, #0x9e
	str r1, [r0, #0x2c]
	bx lr
	thumb_func_end ov121_021E6168

	thumb_func_start ov121_021E6194
ov121_021E6194: ; 0x021E6194
	push {r3, r4, r5, lr}
	sub sp, #0x30
	add r4, r0, #0
	add r0, sp, #0
	add r1, r4, #0
	bl ov121_021E6168
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	add r5, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	mov r1, #1
	bl sub_02024A04
	add r0, r5, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x86
	lsl r0, r0, #2
	str r5, [r4, r0]
	mov r0, #1
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	add r5, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x22
	lsl r0, r0, #4
	str r5, [r4, r0]
	mov r0, #0xf
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	add r5, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x87
	lsl r0, r0, #2
	str r5, [r4, r0]
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	add r5, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x89
	lsl r0, r0, #2
	str r5, [r4, r0]
	mov r0, #1
	lsl r0, r0, #0x12
	str r0, [sp, #8]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, sp, #0
	bl CreateSprite
	add r5, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	mov r1, #8
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8a
	lsl r0, r0, #2
	str r5, [r4, r0]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov121_021E6194

	thumb_func_start ov121_021E62A0
ov121_021E62A0: ; 0x021E62A0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0x28
	bl AllocFromHeap
	mov r1, #0x8b
	lsl r1, r1, #2
	mov r2, #0
	str r0, [r4, r1]
	add r3, r2, #0
	mov r5, #0x38
	mov r0, #0x28
	add r6, r1, #0
_021E62BC:
	ldr r7, [r4, r6]
	add r2, r2, #1
	strb r5, [r7, r3]
	add r1, r7, r3
	strb r0, [r1, #2]
	ldrb r7, [r7, r3]
	add r3, r3, #4
	add r5, #0x10
	add r7, #0x10
	strb r7, [r1, #1]
	ldrb r7, [r1, #2]
	add r7, #0xb0
	strb r7, [r1, #3]
	cmp r2, #6
	blt _021E62BC
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	mov r5, #0xa8
	add r3, r2, #0
	add r3, #0x18
	strb r5, [r2, #0x18]
	mov r1, #8
	strb r1, [r3, #2]
	ldrb r1, [r2, #0x18]
	add r1, #0x10
	strb r1, [r3, #1]
	ldrb r1, [r3, #2]
	add r1, #0x80
	strb r1, [r3, #3]
	ldr r2, [r4, r0]
	mov r1, #0xc0
	add r3, r2, #0
	strb r5, [r2, #0x1c]
	add r3, #0x1c
	strb r1, [r3, #2]
	ldrb r1, [r2, #0x1c]
	mov r5, #0xfe
	mov r2, #0x60
	add r1, #0x10
	strb r1, [r3, #1]
	ldrb r1, [r3, #2]
	add r1, #0x40
	strb r1, [r3, #3]
	ldr r1, [r4, r0]
	mov r3, #0x10
	add r6, r1, #0
	add r1, #0x20
	add r6, #0x20
	strb r5, [r1]
	strb r3, [r6, #1]
	strb r2, [r6, #2]
	strb r3, [r6, #3]
	ldr r0, [r4, r0]
	add r1, r0, #0
	add r0, #0x24
	strb r5, [r0]
	add r1, #0x24
	mov r0, #0xf0
	strb r0, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov121_021E62A0

	thumb_func_start ov121_021E633C
ov121_021E633C: ; 0x021E633C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021E63A2
	ldr r0, _021E6400 ; =gSystem
	ldr r4, [r0, #0x48]
	cmp r4, #0
	beq _021E63A2
	cmp r4, #0x20
	bgt _021E6370
	bge _021E6386
	cmp r4, #2
	bgt _021E636A
	cmp r4, #1
	blt _021E63A2
	beq _021E639A
	cmp r4, #2
	beq _021E639E
	b _021E63A2
_021E636A:
	cmp r4, #0x10
	beq _021E638A
	b _021E63A2
_021E6370:
	cmp r4, #0x80
	bgt _021E637C
	bge _021E6392
	cmp r4, #0x40
	beq _021E638E
	b _021E63A2
_021E637C:
	mov r0, #1
	lsl r0, r0, #0xa
	cmp r4, r0
	beq _021E6396
	b _021E63A2
_021E6386:
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E638A:
	mov r0, #7
	pop {r4, r5, r6, pc}
_021E638E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6392:
	mov r0, #2
	pop {r4, r5, r6, pc}
_021E6396:
	mov r0, #5
	pop {r4, r5, r6, pc}
_021E639A:
	mov r0, #8
	pop {r4, r5, r6, pc}
_021E639E:
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E63A2:
	cmp r4, #0
	bne _021E63FC
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E63FC
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0202529C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E63FC
	cmp r0, #9
	bhi _021E63FC
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E63D0: ; jump table
	.short _021E63E4 - _021E63D0 - 2 ; case 0
	.short _021E63E4 - _021E63D0 - 2 ; case 1
	.short _021E63E4 - _021E63D0 - 2 ; case 2
	.short _021E63E4 - _021E63D0 - 2 ; case 3
	.short _021E63E4 - _021E63D0 - 2 ; case 4
	.short _021E63E4 - _021E63D0 - 2 ; case 5
	.short _021E63EA - _021E63D0 - 2 ; case 6
	.short _021E63EE - _021E63D0 - 2 ; case 7
	.short _021E63F4 - _021E63D0 - 2 ; case 8
	.short _021E63F8 - _021E63D0 - 2 ; case 9
_021E63E4:
	str r0, [r5]
	mov r0, #3
	pop {r4, r5, r6, pc}
_021E63EA:
	mov r0, #5
	pop {r4, r5, r6, pc}
_021E63EE:
	str r0, [r5]
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E63F4:
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E63F8:
	mov r0, #7
	pop {r4, r5, r6, pc}
_021E63FC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6400: .word gSystem
	thumb_func_end ov121_021E633C

	thumb_func_start ov121_021E6404
ov121_021E6404: ; 0x021E6404
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #8
	bhi _021E646E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6418: ; jump table
	.short _021E646E - _021E6418 - 2 ; case 0
	.short _021E646E - _021E6418 - 2 ; case 1
	.short _021E646E - _021E6418 - 2 ; case 2
	.short _021E646E - _021E6418 - 2 ; case 3
	.short _021E6458 - _021E6418 - 2 ; case 4
	.short _021E643C - _021E6418 - 2 ; case 5
	.short _021E642A - _021E6418 - 2 ; case 6
	.short _021E6434 - _021E6418 - 2 ; case 7
	.short _021E6458 - _021E6418 - 2 ; case 8
_021E642A:
	mov r1, #0
	mvn r1, r1
	bl ov121_021E662C
	b _021E646E
_021E6434:
	mov r1, #1
	bl ov121_021E662C
	b _021E646E
_021E643C:
	ldr r0, _021E6474 ; =0x000005DD
	bl PlaySE
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #9
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #1
	bl ov121_021E6690
	b _021E646E
_021E6458:
	ldr r0, _021E6474 ; =0x000005DD
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #1
	pop {r4, pc}
_021E646E:
	mov r0, #0
	pop {r4, pc}
	nop
_021E6474: .word 0x000005DD
	thumb_func_end ov121_021E6404

	thumb_func_start ov121_021E6478
ov121_021E6478: ; 0x021E6478
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #8
	bhi _021E653A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E648C: ; jump table
	.short _021E653A - _021E648C - 2 ; case 0
	.short _021E649E - _021E648C - 2 ; case 1
	.short _021E64A8 - _021E648C - 2 ; case 2
	.short _021E64B0 - _021E648C - 2 ; case 3
	.short _021E64EC - _021E648C - 2 ; case 4
	.short _021E64B8 - _021E648C - 2 ; case 5
	.short _021E653A - _021E648C - 2 ; case 6
	.short _021E653A - _021E648C - 2 ; case 7
	.short _021E6508 - _021E648C - 2 ; case 8
_021E649E:
	mov r1, #0
	mvn r1, r1
	bl ov121_021E6544
	pop {r4, pc}
_021E64A8:
	mov r1, #1
	bl ov121_021E6544
	pop {r4, pc}
_021E64B0:
	add r1, r2, #0
	bl ov121_021E65A8
	pop {r4, pc}
_021E64B8:
	ldr r0, _021E653C ; =0x00000232
	ldrsb r1, [r4, r0]
	add r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	ldr r0, _021E6540 ; =0x000005DD
	bge _021E64D2
	bl PlaySE
	add r0, r4, #0
	bl ov121_021E6EC0
	pop {r4, pc}
_021E64D2:
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	bl ov121_021E6690
	pop {r4, pc}
_021E64EC:
	ldr r0, _021E6540 ; =0x000005DD
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	bl ov121_021E6690
	pop {r4, pc}
_021E6508:
	ldr r0, _021E653C ; =0x00000232
	ldrsb r1, [r4, r0]
	add r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	ldr r0, _021E6540 ; =0x000005DD
	bge _021E6522
	bl PlaySE
	add r0, r4, #0
	bl ov121_021E6EC0
	pop {r4, pc}
_021E6522:
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	bl ov121_021E6690
_021E653A:
	pop {r4, pc}
	.balign 4, 0
_021E653C: .word 0x00000232
_021E6540: .word 0x000005DD
	thumb_func_end ov121_021E6478

	thumb_func_start ov121_021E6544
ov121_021E6544: ; 0x021E6544
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	ble _021E6570
	ldr r2, _021E65A0 ; =0x00000232
	ldrsb r0, [r4, r2]
	cmp r0, #6
	bne _021E655A
	mov r0, #0
	strb r0, [r4, r2]
	b _021E6592
_021E655A:
	add r1, r0, r1
	add r0, r2, #0
	add r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	blt _021E656C
	mov r0, #6
	strb r0, [r4, r2]
	b _021E6592
_021E656C:
	strb r1, [r4, r2]
	b _021E6592
_021E6570:
	bge _021E6592
	ldr r2, _021E65A0 ; =0x00000232
	ldrsb r0, [r4, r2]
	cmp r0, #6
	bne _021E6586
	add r0, r2, #0
	add r0, #0x2f
	ldrb r0, [r4, r0]
	sub r0, r0, #1
	strb r0, [r4, r2]
	b _021E6592
_021E6586:
	add r0, r0, r1
	bpl _021E6590
	mov r0, #6
	strb r0, [r4, r2]
	b _021E6592
_021E6590:
	strb r0, [r4, r2]
_021E6592:
	ldr r0, _021E65A4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov121_021E65D8
	pop {r4, pc}
	.balign 4, 0
_021E65A0: .word 0x00000232
_021E65A4: .word 0x000005DC
	thumb_func_end ov121_021E6544

	thumb_func_start ov121_021E65A8
ov121_021E65A8: ; 0x021E65A8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	beq _021E65BA
	ldr r0, _021E65CC ; =0x00000261
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _021E65CA
_021E65BA:
	ldr r0, _021E65D0 ; =0x000005DC
	bl PlaySE
	ldr r0, _021E65D4 ; =0x00000232
	strb r4, [r5, r0]
	add r0, r5, #0
	bl ov121_021E65D8
_021E65CA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E65CC: .word 0x00000261
_021E65D0: .word 0x000005DC
_021E65D4: .word 0x00000232
	thumb_func_end ov121_021E65A8

	thumb_func_start ov121_021E65D8
ov121_021E65D8: ; 0x021E65D8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r2, _021E661C ; =0x00000232
	mov r0, #0xc
	ldrb r3, [r5, r2]
	sub r2, #0x1a
	add r4, r3, #0
	mul r4, r0
	ldr r0, _021E6620 ; =ov121_021E7140
	ldr r0, [r0, r4]
	lsl r0, r0, #0xc
	str r0, [sp]
	ldr r0, _021E6624 ; =ov121_021E7144
	ldr r0, [r0, r4]
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	bl sub_020247D4
	mov r0, #0x86
	ldr r1, _021E6628 ; =ov121_021E7148
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r1, r4]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E661C: .word 0x00000232
_021E6620: .word ov121_021E7140
_021E6624: .word ov121_021E7144
_021E6628: .word ov121_021E7148
	thumb_func_end ov121_021E65D8

	thumb_func_start ov121_021E662C
ov121_021E662C: ; 0x021E662C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x26
	lsl r0, r0, #4
	add r4, r1, #0
	ldrb r1, [r5, r0]
	add r1, r1, r4
	bpl _021E6644
	sub r0, r0, #2
	ldrb r0, [r5, r0]
	sub r1, r0, #1
	b _021E664E
_021E6644:
	sub r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	blt _021E664E
	mov r1, #0
_021E664E:
	mov r0, #0x26
	lsl r0, r0, #4
	strb r1, [r5, r0]
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	cmp r4, #0
	ble _021E666E
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	b _021E667C
_021E666E:
	bge _021E667C
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
_021E667C:
	add r0, r5, #0
	bl ov121_021E6DD8
	ldr r0, _021E668C ; =0x00000233
	mov r1, #0
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021E668C: .word 0x00000233
	thumb_func_end ov121_021E662C

	thumb_func_start ov121_021E6690
ov121_021E6690: ; 0x021E6690
	push {r4, lr}
	ldr r2, _021E66E8 ; =0x00000231
	add r4, r0, #0
	strb r1, [r4, r2]
	cmp r1, #0
	bne _021E66C0
	add r0, r2, #1
	mov r1, #6
	strb r1, [r4, r0]
	sub r2, #0x15
	ldr r0, [r4, r2]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov121_021E67E4
	b _021E66E0
_021E66C0:
	add r0, r2, #1
	mov r1, #0
	sub r2, #0x15
	strb r1, [r4, r0]
	ldr r0, [r4, r2]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov121_021E6E68
_021E66E0:
	add r0, r4, #0
	bl ov121_021E65D8
	pop {r4, pc}
	.balign 4, 0
_021E66E8: .word 0x00000231
	thumb_func_end ov121_021E6690

	thumb_func_start ov121_021E66EC
ov121_021E66EC: ; 0x021E66EC
	push {r3, r4, lr}
	sub sp, #0x14
	mov r1, #0x1e
	add r4, r0, #0
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x9e
	bl LoadFontPal0
	mov r0, #7
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r2, #1
	str r2, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, #4
	mov r3, #5
	bl AddWindowParameterized
	mov r3, #7
	add r1, r4, #0
	str r3, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x19
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x14
	mov r2, #1
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	add r0, #0xfa
	str r0, [sp, #0x10]
	add r1, r4, #0
	mov r2, #2
	ldr r0, [r4]
	add r1, #0x24
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _021E67DC ; =0x00000179
	add r1, #0x34
	str r0, [sp, #0x10]
	ldr r0, [r4]
	mov r3, #0x19
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _021E67E0 ; =0x00000185
	add r1, #0x44
	str r0, [sp, #0x10]
	ldr r0, [r4]
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x54
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0x9a
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	mov r1, #0
	mov r2, #1
	str r0, [sp]
	mov r0, #0x9e
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r3, #0xc
	bl LoadUserFrameGfx2
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021E67DC: .word 0x00000179
_021E67E0: .word 0x00000185
	thumb_func_end ov121_021E66EC

	thumb_func_start ov121_021E67E4
ov121_021E67E4: ; 0x021E67E4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x54
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #0x54
	add r0, r4, #0
	bl ClearWindowTilemapAndCopyToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov121_021E67E4

	thumb_func_start ov121_021E67FC
ov121_021E67FC: ; 0x021E67FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r4, r0, #0
	ldr r1, _021E69EC ; =0x0000025E
	mov r0, #0x9e
	ldrb r2, [r4, r1]
	mov r1, #0x3c
	mul r1, r2
	bl AllocFromHeap
	mov r2, #0x95
	lsl r2, r2, #2
	str r0, [r4, r2]
	ldr r0, [r4, r2]
	add r2, #0xa
	ldrb r3, [r4, r2]
	mov r2, #0x3c
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	mov r1, #0x97
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x9e
	bl sub_0202E9FC
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	add r1, #0x26
	str r0, [sp, #0x10]
	ldrb r0, [r4, r1]
	cmp r0, #0
	bgt _021E684A
	b _021E69E8
_021E684A:
	ldr r0, [sp, #0x10]
	str r4, [sp, #8]
	str r0, [sp, #4]
	add r5, r0, #0
_021E6852:
	mov r2, #0x8d
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r0, [r4, r2]
	add r2, #0x29
	add r1, #0x2b
	ldrb r3, [r4, r2]
	mov r2, #0xd
	ldrb r1, [r4, r1]
	mul r2, r3
	add r2, r1, r2
	ldr r1, [sp, #0x10]
	add r1, r1, r2
	mov r2, #0x9e
	bl sub_0202EA80
	mov r1, #0x8f
	mov r3, #0
	ldr r2, [sp, #8]
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r0, r2, #0
	ldr r0, [r0, r1]
	mov ip, r3
	str r0, [sp, #0xc]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E68BE
	sub r0, r1, #4
	ldr r0, [r4, r0]
	add r3, r1, #0
	add r2, r0, #4
	ldr r0, [sp, #4]
	add r3, #0x18
	add r2, r2, r0
	add r0, r1, #0
	add r0, #0x18
	ldr r0, [r4, r0]
	add r0, r0, r5
	str r2, [r0, #4]
	add r0, r1, #0
	add r0, #0x18
	ldr r0, [r4, r0]
	mov r2, #1
	add r0, r0, r5
	strh r2, [r0, #8]
	ldr r3, [r4, r3]
	mov r0, #0xff
	add r3, r3, r5
	add r1, #0x18
	strb r0, [r3, #0xa]
	ldr r0, [r4, r1]
	str r2, [r0, r5]
	b _021E69C8
_021E68BE:
	add r2, r3, #0
	cmp r0, #0
	ble _021E6980
	ldr r0, [sp, #0xc]
	str r0, [sp]
	add r7, r0, #4
_021E68CA:
	mov r0, ip
	cmp r0, #0
	bne _021E6944
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	add r1, r1, r0
	ldr r6, [r1, #8]
	ldr r1, [sp]
	ldr r1, [r1, #8]
	cmp r6, r1
	blo _021E6944
	add r6, r0, #4
	ldr r0, [sp, #4]
	lsl r1, r3, #3
	add r0, r6, r0
	mov r6, #0x95
	lsl r6, r6, #2
	ldr r6, [r4, r6]
	add r3, r3, #1
	add r6, r5, r6
	add r6, r1, r6
	str r0, [r6, #4]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r6, r1, r0
	mov r0, #1
	strh r0, [r6, #8]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r6, r3, #3
	add r0, r5, r0
	add r1, r1, r0
	mov r0, #0xff
	strb r0, [r1, #0xa]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r0, r6, r0
	str r7, [r0, #4]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r1, r6, r0
	mov r0, #1
	strh r0, [r1, #8]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r0, r6, r0
	strb r2, [r0, #0xa]
	mov r0, #1
	mov ip, r0
	b _021E696C
_021E6944:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r6, r3, #3
	add r0, r5, r0
	add r0, r6, r0
	str r7, [r0, #4]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r1, r6, r0
	mov r0, #1
	strh r0, [r1, #8]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r0, r6, r0
	strb r2, [r0, #0xa]
_021E696C:
	ldr r0, [sp]
	add r2, r2, #1
	add r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r3, r3, #1
	ldr r0, [r0]
	add r7, #0xc
	cmp r2, r0
	blt _021E68CA
_021E6980:
	mov r0, ip
	cmp r0, #0
	bne _021E69BA
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	lsl r2, r3, #3
	add r3, r1, #4
	ldr r1, [sp, #4]
	add r1, r3, r1
	add r3, r0, #0
	add r3, #0x1c
	ldr r3, [r4, r3]
	add r3, r3, r5
	add r3, r2, r3
	str r1, [r3, #4]
	add r3, r0, #0
	add r3, #0x1c
	ldr r3, [r4, r3]
	mov r1, #1
	add r3, r3, r5
	add r3, r2, r3
	strh r1, [r3, #8]
	add r0, #0x1c
	ldr r0, [r4, r0]
	mov r1, #0xff
	add r0, r0, r5
	add r0, r2, r0
	strb r1, [r0, #0xa]
_021E69BA:
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	add r1, r0, #1
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r1, [r0, r5]
_021E69C8:
	ldr r0, [sp, #8]
	add r5, #0x3c
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, _021E69EC ; =0x0000025E
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bge _021E69E8
	b _021E6852
_021E69E8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E69EC: .word 0x0000025E
	thumb_func_end ov121_021E67FC

	thumb_func_start ov121_021E69F0
ov121_021E69F0: ; 0x021E69F0
	push {r4, r5, r6, lr}
	ldr r2, _021E6A48 ; =0x000001A5
	add r6, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x9e
	bl NewMsgDataFromNarc
	str r0, [r6, #0x64]
	mov r0, #2
	mov r1, #0x4c
	mov r2, #0x9e
	bl ScrStrBufs_new_custom
	str r0, [r6, #0x68]
	mov r0, #0x4c
	mov r1, #0x9e
	bl String_ctor
	str r0, [r6, #0x6c]
	ldr r0, [r6, #0x64]
	mov r1, #0x2b
	bl NewString_ReadMsgData
	str r0, [r6, #0x70]
	ldr r0, [r6, #0x64]
	mov r1, #0x2a
	bl NewString_ReadMsgData
	str r0, [r6, #0x74]
	mov r4, #0
	add r5, r6, #0
_021E6A30:
	add r1, r4, #0
	ldr r0, [r6, #0x64]
	add r1, #0x2c
	bl NewString_ReadMsgData
	str r0, [r5, #0x78]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _021E6A30
	pop {r4, r5, r6, pc}
	nop
_021E6A48: .word 0x000001A5
	thumb_func_end ov121_021E69F0

	thumb_func_start ov121_021E6A4C
ov121_021E6A4C: ; 0x021E6A4C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021E6A54:
	ldr r0, [r5, #0x78]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _021E6A54
	ldr r0, [r6, #0x70]
	bl String_dtor
	ldr r0, [r6, #0x74]
	bl String_dtor
	ldr r0, [r6, #0x6c]
	bl String_dtor
	ldr r0, [r6, #0x68]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x64]
	bl DestroyMsgData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov121_021E6A4C

	thumb_func_start ov121_021E6A84
ov121_021E6A84: ; 0x021E6A84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r2, #0x26
	lsl r2, r2, #4
	add r1, r2, #0
	add r4, r0, #0
	sub r1, #0xc
	ldr r1, [r4, r1]
	ldrb r0, [r4, r2]
	str r1, [sp, #0x20]
	mov r1, #0x3c
	mul r1, r0
	str r1, [sp, #0x24]
	sub r1, r2, #4
	ldrb r1, [r4, r1]
	lsl r0, r0, #3
	lsl r2, r1, #2
	ldr r1, _021E6C4C ; =ov121_021E7014
	ldr r1, [r1, r2]
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp, #0x18]
	mov r0, #0
	add r1, r0, #0
	ldr r2, _021E6C50 ; =0x00000261
	str r1, [sp, #0x1c]
	strb r1, [r4, r2]
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x14]
	ldr r1, [r2, r1]
	cmp r1, #0
	bgt _021E6ADC
	b _021E6C04
_021E6ADC:
	ldr r1, [sp, #0x24]
	add r7, r0, #0
	add r1, r2, r1
	str r1, [sp, #0x2c]
	add r1, r4, #0
	str r1, [sp, #0x28]
	add r1, #0x14
	str r1, [sp, #0x28]
_021E6AEC:
	ldr r1, [sp, #0x2c]
	ldrh r1, [r1, #8]
	cmp r1, #0
	beq _021E6BEA
	ldr r1, [sp, #0x2c]
	ldr r1, [r1, #4]
	ldr r5, [r1, #4]
	ldr r1, [sp, #0x10]
	ldr r1, [r1]
	cmp r5, r1
	bls _021E6B04
	add r5, r1, #0
_021E6B04:
	cmp r5, r0
	bge _021E6B0E
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_021E6B0E:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x68]
	ldr r2, [sp, #0x18]
	mov r1, #0
	mov r3, #1
	bl BufferIntegerAsString
	ldr r0, [r4, #0x68]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x74]
	bl StringExpandPlaceholders
	mov r1, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x6c]
	add r0, r4, #4
	bl AddTextPrinterParameterized2
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x2c]
	ldr r0, [r4, #0x68]
	ldr r2, [r2, #4]
	mov r1, #1
	ldr r2, [r2, #8]
	mov r3, #2
	bl BufferString
	ldr r0, [r4, #0x68]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	bl StringExpandPlaceholders
	mov r1, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [r4, #0x6c]
	bl AddTextPrinterParameterized2
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #0x10]
	ldr r0, [r4, #0x68]
	ldrh r3, [r3, #4]
	mov r1, #0
	add r2, r5, #0
	bl BufferIntegerAsString
	ldr r2, [sp, #0x10]
	ldr r0, [r4, #0x68]
	ldrh r2, [r2, #6]
	ldr r1, [r4, #0x6c]
	lsl r2, r2, #2
	add r2, r4, r2
	sub r2, #0x38
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r4, #0x6c]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov ip, r0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 ; =0x00010200
	mov r3, #0xa0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r6, ip
	ldr r0, [sp, #0x28]
	ldr r2, [r4, #0x6c]
	mov r1, #0
	sub r3, r3, r6
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	add r2, r4, r0
	ldr r0, _021E6C58 ; =0x00000262
	add r7, #0x10
	strb r1, [r2, r0]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	add r1, r1, #1
	str r1, [sp, #0x14]
	cmp r1, #6
	bge _021E6C04
_021E6BEA:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	add r1, #8
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	ldr r2, [r2, r1]
	ldr r1, [sp, #0x1c]
	cmp r1, r2
	bge _021E6C04
	b _021E6AEC
_021E6C04:
	add r0, r4, #0
	add r0, #0x14
	bl CopyWindowToVram
	add r0, r4, #4
	bl CopyWindowToVram
	ldr r1, _021E6C50 ; =0x00000261
	ldr r0, [sp, #0x14]
	strb r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x30
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _021E6C46
	add r0, r1, #0
	sub r0, #0x2f
	ldrsb r2, [r4, r0]
	ldrb r0, [r4, r1]
	cmp r2, r0
	blt _021E6C46
	cmp r2, #7
	bne _021E6C36
	bl GF_AssertFail
_021E6C36:
	ldr r0, _021E6C50 ; =0x00000261
	ldrb r1, [r4, r0]
	sub r0, #0x2f
	sub r1, r1, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov121_021E65D8
_021E6C46:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6C4C: .word ov121_021E7014
_021E6C50: .word 0x00000261
_021E6C54: .word 0x00010200
_021E6C58: .word 0x00000262
	thumb_func_end ov121_021E6A84

	thumb_func_start ov121_021E6C5C
ov121_021E6C5C: ; 0x021E6C5C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x44
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x28
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CA0 ; =0x00030100
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x44
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r5, #0x44
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6CA0: .word 0x00030100
	thumb_func_end ov121_021E6C5C

	thumb_func_start ov121_021E6CA4
ov121_021E6CA4: ; 0x021E6CA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x34
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x29
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CE8 ; =0x00030100
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x34
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r5, #0x34
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6CE8: .word 0x00030100
	thumb_func_end ov121_021E6CA4

	thumb_func_start ov121_021E6CEC
ov121_021E6CEC: ; 0x021E6CEC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021E6D78 ; =0x00000232
	add r5, r0, #0
	ldrsb r0, [r5, r1]
	mov r3, #0xc
	add r2, r5, r0
	add r0, r1, #0
	add r0, #0x30
	ldrb r4, [r2, r0]
	add r0, r1, #0
	add r1, #0x2e
	add r0, #0x22
	ldr r2, [r5, r0]
	ldrb r1, [r5, r1]
	mov r0, #0x3c
	mul r0, r1
	add r6, r2, r0
	add r0, r5, #0
	mov r1, #1
	add r0, #0x54
	add r2, r1, #0
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r2, r4, #3
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	add r2, r6, r2
	ldr r2, [r2, #4]
	ldr r0, [r5, #0x68]
	ldr r2, [r2, #8]
	mov r1, #0
	bl BufferString
	ldr r0, [r5, #0x68]
	ldr r1, [r5, #0x64]
	mov r2, #0x31
	mov r3, #0x9e
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6D7C ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6D78: .word 0x00000232
_021E6D7C: .word 0x00010200
	thumb_func_end ov121_021E6CEC

	thumb_func_start ov121_021E6D80
ov121_021E6D80: ; 0x021E6D80
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #1
	add r5, r0, #0
	add r0, #0x54
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x34
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6DD4 ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6DD4: .word 0x00010200
	thumb_func_end ov121_021E6D80

	thumb_func_start ov121_021E6DD8
ov121_021E6DD8: ; 0x021E6DD8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x24
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x97
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E6DF4
	mov r1, #0x35
	b _021E6DF6
_021E6DF4:
	mov r1, #0x41
_021E6DF6:
	mov r0, #0x26
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	lsl r0, r0, #1
	add r5, r1, r0
	ldr r0, [r4, #0x64]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r4, #0x64]
	add r1, r5, #1
	bl NewString_ReadMsgData
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x24
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x24
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	bl String_dtor
	add r4, #0x24
	add r0, r4, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6E64: .word 0x00010200
	thumb_func_end ov121_021E6DD8

	thumb_func_start ov121_021E6E68
ov121_021E6E68: ; 0x021E6E68
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #1
	add r5, r0, #0
	add r0, #0x54
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x30
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6EBC ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6EBC: .word 0x00010200
	thumb_func_end ov121_021E6E68

	thumb_func_start ov121_021E6EC0
ov121_021E6EC0: ; 0x021E6EC0
	push {r4, r5, lr}
	sub sp, #0x14
	mov r2, #0x95
	lsl r2, r2, #2
	add r3, r2, #0
	add r4, r0, #0
	add r3, #0xc
	ldrb r5, [r4, r3]
	mov r3, #0x3c
	ldr r1, [r4, r2]
	mul r3, r5
	add r1, r1, r3
	add r3, r2, #0
	sub r3, #0x22
	ldrsb r3, [r4, r3]
	add r1, r1, #4
	add r5, r4, r3
	add r3, r2, #0
	add r3, #0xe
	ldrb r3, [r5, r3]
	lsl r3, r3, #3
	add r3, r1, r3
	add r1, r2, #4
	str r3, [r4, r1]
	ldr r1, [r4, r1]
	ldrb r1, [r1, #6]
	cmp r1, #0xff
	bne _021E6F0C
	mov r1, #3
	sub r2, #0x21
	strb r1, [r4, r2]
	bl ov121_021E6D80
	ldr r0, _021E6F50 ; =0x000005F2
	bl PlaySE
	add sp, #0x14
	pop {r4, r5, pc}
_021E6F0C:
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x8f
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #6
	strb r1, [r0, #0x11]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r4, #0
	bl ov121_021E6CEC
	bl ov121_021E6F58
	ldr r0, _021E6F54 ; =0x00000233
	mov r1, #2
	strb r1, [r4, r0]
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021E6F50: .word 0x000005F2
_021E6F54: .word 0x00000233
	thumb_func_end ov121_021E6EC0

	thumb_func_start ov121_021E6F58
ov121_021E6F58: ; 0x021E6F58
	mov r1, #0x1e
	add r2, r1, #0
	ldr r3, _021E6F64 ; =G2x_SetBlendBrightness_
	ldr r0, _021E6F68 ; =0x04000050
	sub r2, #0x25
	bx r3
	.balign 4, 0
_021E6F64: .word G2x_SetBlendBrightness_
_021E6F68: .word 0x04000050
	thumb_func_end ov121_021E6F58

	thumb_func_start ov121_021E6F6C
ov121_021E6F6C: ; 0x021E6F6C
	ldr r0, _021E6F74 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
_021E6F74: .word 0x04000050
	thumb_func_end ov121_021E6F6C

	thumb_func_start ov121_021E6F78
ov121_021E6F78: ; 0x021E6F78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021E700C ; =0x0000025E
	ldrb r0, [r4, r0]
	cmp r0, #0
	ble _021E7008
	ldr r0, [sp, #4]
	str r0, [sp]
_021E6F8E:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	ldr r0, [sp]
	mov r6, #0
	add r1, r2, r0
	ldr r0, [r2, r0]
	add r7, r6, #0
	cmp r0, #0
	ble _021E6FF2
	add r5, r6, #0
_021E6FA4:
	add r0, r1, #4
	add r1, r0, r5
	ldrb r0, [r1, #6]
	mov ip, r0
	cmp r0, #0xff
	beq _021E6FDC
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _021E6FDC
	ldr r1, _021E7010 ; =0x0000025F
	mov r0, #0x8d
	ldrb r3, [r4, r1]
	sub r1, r1, #2
	ldrb r2, [r4, r1]
	mov r1, #0xd
	lsl r0, r0, #2
	mul r1, r2
	add r2, r3, r1
	ldr r1, [sp, #4]
	ldr r0, [r4, r0]
	add r1, r1, r2
	mov r2, ip
	sub r2, r2, r6
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0202E544
	add r6, r6, #1
_021E6FDC:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp]
	ldr r2, [sp]
	add r1, r1, r0
	ldr r0, [r2, r0]
	add r7, r7, #1
	add r5, #8
	cmp r7, r0
	blt _021E6FA4
_021E6FF2:
	ldr r0, [sp]
	add r0, #0x3c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, _021E700C ; =0x0000025E
	ldrb r1, [r4, r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _021E6F8E
_021E7008:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E700C: .word 0x0000025E
_021E7010: .word 0x0000025F
	thumb_func_end ov121_021E6F78

	.rodata

ov121_021E7014:
	.word ov121_021E7110
	.word ov121_021E70C8

ov121_021E701C: ; 0x021E701C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov121_021E702C: ; 0x021E702C
	.byte 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00

ov121_021E703C: ; 0x021E703C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov121_021E7058: ; 0x021E7058
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov121_021E7074: ; 0x021E7074
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov121_021E7090: ; 0x021E7090
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov121_021E70AC: ; 0x021E70AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov121_021E70C8:
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00, 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2E, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00

ov121_021E70E8: ; 0x021E70E8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov121_021E7110:
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x2D, 0x00

ov121_021E7140: ; 0x021E7140
	.byte 0x80, 0x00, 0x00, 0x00

ov121_021E7144: ; 0x021E7144
	.byte 0x40, 0x00, 0x00, 0x00

ov121_021E7148: ; 0x021E7148
	.byte 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
	; 0x021E7194
