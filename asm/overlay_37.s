	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov37_021E5900
ov37_021E5900: ; 0x021E5900
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _021E5916
	cmp r1, #1
	bne _021E5914
	b _021E5A56
_021E5914:
	b _021E5A64
_021E5916:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5A6C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5A70 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #3
	mov r1, #0x27
	lsl r2, r2, #6
	bl CreateHeap
	ldr r1, _021E5A74 ; =0x0000940C
	add r0, r6, #0
	mov r2, #0x27
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E5A74 ; =0x0000940C
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x27
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0x27
	bl ScrStrBufs_new
	str r0, [r4, #0xc]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xfc
	mov r3, #0x27
	bl NewMsgDataFromNarc
	str r0, [r4, #0x10]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	bl ov37_021E5CF0
	ldr r0, [r4]
	bl ov37_021E5D10
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x27
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x11
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #8]
	mov r0, #0x4e
	mov r1, #0x27
	bl NARC_ctor
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov37_021E5F98
	bl sub_020210BC
	mov r0, #2
	bl sub_02021148
	ldr r0, _021E5A78 ; =ov37_021E5CC8
	ldr r1, [r4]
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov37_021E5E30
	bl ov37_021E6090
	add r0, r4, #0
	add r1, r7, #0
	bl ov37_021E60C0
	add r0, r4, #0
	bl ov37_021E6244
	add r0, r4, #0
	add r1, r6, #0
	bl ov37_021E6418
	mov r1, #0
	mov r0, #0x34
	add r2, r1, #0
	bl sub_02004EC4
	ldr r2, _021E5A7C ; =0x04000304
	ldr r0, _021E5A80 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	add r0, r4, #0
	bl sub_0208F814
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	bl sub_0203769C
	cmp r0, #0
	bne _021E5A30
	mov r0, #3
	bl sub_02038C1C
_021E5A30:
	bl sub_0203A880
	bl sub_0203769C
	cmp r0, #0
	bne _021E5A48
	mov r0, #1
	bl sub_0205A904
	mov r0, #1
	bl sub_020356EC
_021E5A48:
	add r0, r7, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E5A64
_021E5A56:
	bl OverlayManager_GetData
	mov r0, #0
	str r0, [r5]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E5A64:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E5A6C: .word 0xFFFFE0FF
_021E5A70: .word 0x04001000
_021E5A74: .word 0x0000940C
_021E5A78: .word ov37_021E5CC8
_021E5A7C: .word 0x04000304
_021E5A80: .word 0xFFFF7FFF
	thumb_func_end ov37_021E5900

	thumb_func_start ov37_021E5A84
ov37_021E5A84: ; 0x021E5A84
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E5AAA
	ldr r0, _021E5B80 ; =0x000093B4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5AAA
	bl sub_02033250
	ldr r1, _021E5B80 ; =0x000093B4
	ldr r2, [r4, r1]
	and r0, r2
	str r0, [r4, r1]
_021E5AAA:
	mov r0, #3
	ldr r1, [r5]
	lsl r0, r0, #8
	str r1, [r4, r0]
	ldr r1, [r5]
	add r0, r4, #0
	bl ov37_021E784C
	ldr r1, [r5]
	cmp r1, #3
	bhi _021E5B74
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5ACC: ; jump table
	.short _021E5AD4 - _021E5ACC - 2 ; case 0
	.short _021E5B02 - _021E5ACC - 2 ; case 1
	.short _021E5B48 - _021E5ACC - 2 ; case 2
	.short _021E5B68 - _021E5ACC - 2 ; case 3
_021E5AD4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B74
	bl sub_0203769C
	cmp r0, #0
	beq _021E5AFC
	bl ov37_021E75C4
	cmp r0, #2
	blt _021E5B74
	mov r1, #0
	mov r0, #0x80
	add r2, r1, #0
	bl sub_02037030
	mov r0, #1
	str r0, [r5]
	b _021E5B74
_021E5AFC:
	mov r0, #1
	str r0, [r5]
	b _021E5B74
_021E5B02:
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r2, r0, #3
	ldr r0, _021E5B84 ; =ov37_021E7D20
	ldr r2, [r0, r2]
	cmp r2, #0
	beq _021E5B18
	add r0, r4, #0
	blx r2
	str r0, [r5]
_021E5B18:
	mov r0, #0x9e
	lsl r0, r0, #2
	ldr r2, _021E5B88 ; =0x000E0D0F
	add r0, r4, r0
	mov r1, #0
	add r3, r4, #0
	bl ov37_021E7478
	bl sub_0203769C
	cmp r0, #0
	bne _021E5B3E
	add r0, r4, #0
	bl ov37_021E76F0
	ldr r1, [r5]
	cmp r1, #1
	bne _021E5B3E
	str r0, [r5]
_021E5B3E:
	ldr r0, _021E5B8C ; =0x00004374
	add r0, r4, r0
	bl ov37_021E741C
	b _021E5B74
_021E5B48:
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r3, r0, #3
	ldr r0, _021E5B84 ; =ov37_021E7D20
	ldr r2, [r0, r3]
	cmp r2, #0
	beq _021E5B74
	ldr r0, _021E5B90 ; =ov37_021E7D20 + 4
	ldr r0, [r0, r3]
	cmp r0, #0
	beq _021E5B74
	add r0, r4, #0
	blx r2
	str r0, [r5]
	b _021E5B74
_021E5B68:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B74
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5B74:
	ldr r0, [r4, #0x34]
	bl sub_0202457C
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E5B80: .word 0x000093B4
_021E5B84: .word ov37_021E7D20
_021E5B88: .word 0x000E0D0F
_021E5B8C: .word 0x00004374
_021E5B90: .word ov37_021E7D20 + 4
	thumb_func_end ov37_021E5A84

	thumb_func_start ov37_021E5B94
ov37_021E5B94: ; 0x021E5B94
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r1, #0
	bl OverlayManager_GetData
	add r6, r0, #0
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	ldr r0, [r7]
	cmp r0, #3
	bls _021E5BB0
	b _021E5CBE
_021E5BB0:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5BBC: ; jump table
	.short _021E5BC4 - _021E5BBC - 2 ; case 0
	.short _021E5C40 - _021E5BBC - 2 ; case 1
	.short _021E5C6E - _021E5BBC - 2 ; case 2
	.short _021E5C8E - _021E5BBC - 2 ; case 3
_021E5BC4:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r4, #0
	add r5, r6, #0
_021E5BF8:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E5BF8
	ldr r0, [r6, #0x34]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	add r0, r6, #0
	bl ov37_021E6540
	ldr r0, [r6]
	bl ov37_021E5F5C
	bl sub_02021238
	ldr r0, [r6, #0x10]
	bl DestroyMsgData
	ldr r0, [r6, #0xc]
	bl ScrStrBufs_delete
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C40:
	mov r0, #1
	bl sub_02038C1C
	bl sub_02037FF0
	ldr r0, [r5]
	bl sub_0205AD24
	ldr r2, _021E5CC4 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r0, #0
	bl sub_0205A904
	mov r0, #0
	bl sub_020356EC
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C6E:
	mov r1, #0x25
	lsl r1, r1, #0xa
	ldr r1, [r6, r1]
	cmp r1, #0
	beq _021E5C88
	bl sub_02033250
	cmp r0, #1
	bne _021E5CBE
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C88:
	add r0, r0, #1
	str r0, [r7]
	b _021E5CBE
_021E5C8E:
	mov r0, #2
	bl sub_02038C1C
	add r0, r6, #0
	bl ov37_021E5F20
	ldr r0, [r6, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x27
	bl DestroyHeap
	mov r0, #2
	bl sub_02038C1C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5CBE:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5CC4: .word 0x04000304
	thumb_func_end ov37_021E5B94

	thumb_func_start ov37_021E5CC8
ov37_021E5CC8: ; 0x021E5CC8
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	add r0, r4, #0
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E5CE8 ; =0x027E0000
	ldr r1, _021E5CEC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5CE8: .word 0x027E0000
_021E5CEC: .word 0x00003FF8
	thumb_func_end ov37_021E5CC8

	thumb_func_start ov37_021E5CF0
ov37_021E5CF0: ; 0x021E5CF0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5D0C ; =ov37_021E7A24
	add r3, sp, #0
	mov r2, #5
_021E5CFA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5CFA
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5D0C: .word ov37_021E7A24
	thumb_func_end ov37_021E5CF0

	thumb_func_start ov37_021E5D10
ov37_021E5D10: ; 0x021E5D10
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E5E18 ; =ov37_021E7978
	add r3, sp, #0x8c
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5E1C ; =ov37_021E7998
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
	ldr r5, _021E5E20 ; =ov37_021E79D0
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
	ldr r5, _021E5E24 ; =ov37_021E79EC
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
	ldr r5, _021E5E28 ; =ov37_021E7A08
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
	ldr r5, _021E5E2C ; =ov37_021E79B4
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
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x27
	bl BG_ClearCharDataRange
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x27
	bl BG_ClearCharDataRange
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E5E18: .word ov37_021E7978
_021E5E1C: .word ov37_021E7998
_021E5E20: .word ov37_021E79D0
_021E5E24: .word ov37_021E79EC
_021E5E28: .word ov37_021E7A08
_021E5E2C: .word ov37_021E79B4
	thumb_func_end ov37_021E5D10

	thumb_func_start ov37_021E5E30
ov37_021E5E30: ; 0x021E5E30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5F04 ; =0x0000438A
	add r6, r7, #0
	add r4, r7, r0
	mov r0, #0x38
	add r5, r7, #0
	str r0, [sp, #4]
_021E5E46:
	mov r0, #8
	mov r1, #0x27
	bl String_ctor
	str r0, [r6, #0x14]
	ldrb r1, [r4]
	ldr r0, [sp, #4]
	bic r1, r0
	strb r1, [r4]
	ldr r0, _021E5F08 ; =0x000043B6
	mov r1, #0
	strh r1, [r6, r0]
	mov r0, #0xcd
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [sp]
	add r6, r6, #4
	add r0, r0, #1
	add r4, #0xa
	add r5, #8
	str r0, [sp]
	cmp r0, #5
	blt _021E5E46
	mov r0, #0xa
	mov r1, #0x27
	bl String_ctor
	str r0, [r7, #0x28]
	mov r0, #0x50
	mov r1, #0x27
	bl String_ctor
	str r0, [r7, #0x2c]
	ldr r0, _021E5F0C ; =0x00004376
	mov r2, #0
	strb r2, [r7, r0]
	mov r1, #1
	add r0, r0, #1
	strb r1, [r7, r0]
	ldr r0, _021E5F10 ; =0x000093F4
	str r1, [r7, r0]
	add r0, r0, #4
	str r2, [r7, r0]
	mov r0, #0xc6
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r7, r0]
	bl sub_02033250
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r7, r1]
	ldr r2, _021E5F14 ; =0x000093FC
	mov r3, #0
	str r3, [r7, r2]
	add r0, r2, #4
	str r3, [r7, r0]
	add r0, r2, #0
	sub r1, #0x18
	str r3, [r7, r1]
	add r0, #8
	str r3, [r7, r0]
	add r2, #0xc
	str r3, [r7, r2]
	bl sub_0203769C
	add r0, r7, #0
	mov r1, #4
	bl ov37_021E7844
	ldr r0, [r7, #0x10]
	ldr r2, [r7, #0x28]
	mov r1, #7
	bl ReadMsgDataIntoString
	mov r1, #0xf
	mov r0, #0x27
	lsl r1, r1, #0xa
	bl AllocFromHeap
	ldr r1, _021E5F18 ; =0x000043C8
	str r0, [r7, r1]
	mov r0, #0x27
	bl sub_0201660C
	ldr r1, _021E5F1C ; =0x000093F0
	str r0, [r7, r1]
	mov r0, #0xc5
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r7, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5F04: .word 0x0000438A
_021E5F08: .word 0x000043B6
_021E5F0C: .word 0x00004376
_021E5F10: .word 0x000093F4
_021E5F14: .word 0x000093FC
_021E5F18: .word 0x000043C8
_021E5F1C: .word 0x000093F0
	thumb_func_end ov37_021E5E30

	thumb_func_start ov37_021E5F20
ov37_021E5F20: ; 0x021E5F20
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _021E5F54 ; =0x000043C8
	ldr r0, [r6, r0]
	bl FreeToHeap
	ldr r0, _021E5F58 ; =0x000093F0
	ldr r0, [r6, r0]
	bl sub_02016624
	mov r4, #0
	add r5, r6, #0
_021E5F38:
	ldr r0, [r5, #0x14]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021E5F38
	ldr r0, [r6, #0x2c]
	bl String_dtor
	ldr r0, [r6, #0x28]
	bl String_dtor
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E5F54: .word 0x000043C8
_021E5F58: .word 0x000093F0
	thumb_func_end ov37_021E5F20

	thumb_func_start ov37_021E5F5C
ov37_021E5F5C: ; 0x021E5F5C
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
	thumb_func_end ov37_021E5F5C

	thumb_func_start ov37_021E5F98
ov37_021E5F98: ; 0x021E5F98
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r4, [r6]
	mov r0, #0x40
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
	mov r1, #1
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
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x27
	mov r1, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r1, #0
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
	mov r1, #4
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
	mov r1, #3
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
	mov r1, #5
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r6, #8]
	ldr r0, [r0, #4]
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
	.balign 4, 0
	thumb_func_end ov37_021E5F98

	thumb_func_start ov37_021E6090
ov37_021E6090: ; 0x021E6090
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E60BC ; =ov37_021E7988
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
_021E60BC: .word ov37_021E7988
	thumb_func_end ov37_021E6090

	thumb_func_start ov37_021E60C0
ov37_021E60C0: ; 0x021E60C0
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
	mov r0, #0x35
	add r1, #0x38
	mov r2, #0x27
	bl G2dRenderer_Init
	str r0, [r5, #0x34]
	add r0, r5, #0
	mov r2, #1
	add r0, #0x38
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r6, #0
	add r4, r5, #0
_021E6104:
	mov r0, #2
	add r1, r6, #0
	mov r2, #0x27
	bl Create2DGfxResObjMan
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E6104
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x27
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #6
	bl AddCharResObjFromOpenNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r2, #0
	str r2, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	mov r0, #0x27
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	add r3, r2, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x5d
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
	mov r2, #7
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5e
	lsl r1, r1, #2
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
	mov r2, #8
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5f
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
	mov r2, #6
	bl AddCharResObjFromOpenNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x27
	mov r2, #0
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	add r3, r2, #0
	bl AddPlttResObjFromOpenNarc
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
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x62
	lsl r1, r1, #2
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
	mov r2, #8
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x1c
	ldr r0, [r5, r1]
	bl sub_0200ACF0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov37_021E60C0

	thumb_func_start ov37_021E6244
ov37_021E6244: ; 0x021E6244
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r2, #0x16
	str r1, [sp, #0x10]
	lsl r2, r2, #4
	ldr r0, [r5, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r5, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r5, r0]
	add r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r5, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r1, #1
	mov r3, #0x16
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #4
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r5, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r5, r2]
	add r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x34]
	mov r6, #0
	str r0, [sp, #0x34]
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r5, r0
	str r0, [sp, #0x38]
	mov r0, #1
	lsl r0, r0, #0xc
	str r6, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	add r0, sp, #0x34
	strh r6, [r0, #0x20]
	mov r0, #1
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	mov r0, #0x27
	str r0, [sp, #0x60]
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r7, #0x18
	add r4, r5, #0
	str r0, [sp, #0x2c]
_021E62F8:
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x38]
	lsl r0, r7, #0xc
	str r0, [sp, #0x3c]
	mov r0, #1
	lsl r0, r0, #0x12
	str r0, [sp, #0x40]
	mov r0, #2
	str r0, [sp, #0x5c]
	add r0, sp, #0x34
	bl CreateSprite
	mov r1, #0x76
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r7, #0x28
	add r4, r4, #4
	cmp r6, #5
	blt _021E62F8
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r6, _021E6414 ; =ov37_021E7A80
	mov r7, #0
	add r4, r5, #0
	str r0, [sp, #0x30]
_021E6350:
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x38]
	ldrh r0, [r6]
	lsl r0, r0, #0xc
	str r0, [sp, #0x3c]
	ldrh r0, [r6, #2]
	lsl r0, r0, #0xc
	str r0, [sp, #0x40]
	add r0, sp, #0x34
	bl CreateSprite
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x92
	lsl r0, r0, #2
	ldrh r1, [r6, #4]
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	cmp r7, #8
	blt _021E6392
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_02024A04
_021E6392:
	add r7, r7, #1
	add r6, r6, #6
	add r4, r4, #4
	cmp r7, #0xc
	blt _021E6350
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	mov r7, #6
	mov r6, #0
	mov r4, #0x20
	lsl r7, r7, #0xe
_021E63B0:
	mov r0, #1
	lsl r1, r4, #0xc
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [sp, #0x40]
	add r0, sp, #0x34
	str r7, [sp, #0x3c]
	bl CreateSprite
	mov r1, #0x21
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024ADC
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r4, #0x20
	add r5, r5, #4
	cmp r6, #5
	blt _021E63B0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6414: .word ov37_021E7A80
	thumb_func_end ov37_021E6244

	thumb_func_start ov37_021E6418
ov37_021E6418: ; 0x021E6418
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	mov r1, #0xb6
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r7]
	add r1, r7, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #2
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #0xf
	str r0, [sp, #8]
	mov r0, #0
	mov r2, #1
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r1, #0xb2
	lsl r1, r1, #2
	ldr r0, [r7]
	add r1, r7, r1
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #2
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021E6534 ; =0x000001C3
	mov r1, #0xba
	str r0, [sp, #0x10]
	lsl r1, r1, #2
	ldr r0, [r7]
	add r1, r7, r1
	mov r2, #1
	mov r3, #0x19
	bl AddWindowParameterized
	mov r0, #0xba
	lsl r0, r0, #2
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [r7, #0x28]
	mov r0, #1
	mov r2, #0
	mov r3, #0x30
	bl FontID_String_GetCenterAlignmentX
	add r3, r0, #0
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6538 ; =0x00070100
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r2, [r7, #0x28]
	add r0, r7, r0
	mov r1, #1
	add r3, r3, #2
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #0x9e
	lsl r0, r0, #2
	mov r6, #1
	mov r4, #3
	add r5, r7, r0
_021E64E4:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [r7]
	add r1, r5, #0
	mov r2, #4
	mov r3, #5
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r6, #0x14
	add r0, r0, #1
	add r4, r4, #4
	add r5, #0x10
	str r0, [sp, #0x14]
	cmp r0, #5
	blt _021E64E4
	mov r0, #0x9e
	lsl r0, r0, #2
	ldr r2, _021E653C ; =0x000E0D0F
	add r0, r7, r0
	mov r1, #0
	add r3, r7, #0
	bl ov37_021E7478
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6534: .word 0x000001C3
_021E6538: .word 0x00070100
_021E653C: .word 0x000E0D0F
	thumb_func_end ov37_021E6418

	thumb_func_start ov37_021E6540
ov37_021E6540: ; 0x021E6540
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x9e
	lsl r0, r0, #2
	mov r4, #0
	add r5, r6, r0
_021E654C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #5
	blt _021E654C
	mov r0, #0xba
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r6, r0
	bl RemoveWindow
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov37_021E6540

	thumb_func_start ov37_021E657C
ov37_021E657C: ; 0x021E657C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r2, #0
	cmp r1, #0
	ble _021E659A
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E65A8
_021E659A:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E65A8:
	bl _ffix
	sub r5, #8
	str r0, [sp]
	cmp r5, #0
	ble _021E65C6
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E65D4
_021E65C6:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E65D4:
	bl _ffix
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov37_021E657C

	thumb_func_start ov37_021E65EC
ov37_021E65EC: ; 0x021E65EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021E67E8 ; =ov37_021E7A4C
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #8]
	cmp r0, r1
	beq _021E663A
	cmp r0, #0xb
	bhi _021E663A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6616: ; jump table
	.short _021E662E - _021E6616 - 2 ; case 0
	.short _021E662E - _021E6616 - 2 ; case 1
	.short _021E662E - _021E6616 - 2 ; case 2
	.short _021E662E - _021E6616 - 2 ; case 3
	.short _021E662E - _021E6616 - 2 ; case 4
	.short _021E662E - _021E6616 - 2 ; case 5
	.short _021E662E - _021E6616 - 2 ; case 6
	.short _021E662E - _021E6616 - 2 ; case 7
	.short _021E6656 - _021E6616 - 2 ; case 8
	.short _021E66FA - _021E6616 - 2 ; case 9
	.short _021E66FA - _021E6616 - 2 ; case 10
	.short _021E66FA - _021E6616 - 2 ; case 11
_021E662E:
	ldr r2, _021E67EC ; =0x00004376
	ldr r0, [sp]
	ldrb r1, [r0, r2]
	ldr r0, [sp, #8]
	cmp r1, r0
	bne _021E663C
_021E663A:
	b _021E6752
_021E663C:
	add r1, r0, #0
	ldr r0, [sp]
	strb r1, [r0, r2]
	mov r1, #0x92
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r1, [sp, #8]
	bl ov37_021E6818
	ldr r0, _021E67F0 ; =0x000005DC
	bl PlaySE
	b _021E6752
_021E6656:
	mov r1, #0xc1
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	cmp r0, #4
	bne _021E6752
	bl sub_0203769C
	cmp r0, #0
	bne _021E66BC
	bl sub_02033250
	mov r2, #0xc7
	ldr r1, [sp]
	lsl r2, r2, #2
	ldr r1, [r1, r2]
	cmp r1, r0
	beq _021E6682
	ldr r0, _021E67F4 ; =0x000005F2
	bl PlaySE
	b _021E6752
_021E6682:
	bl sub_02037454
	bl sub_02038C1C
	ldr r1, _021E67F8 ; =0x000093F4
	ldr r0, [sp]
	mov r2, #2
	str r2, [r0, r1]
	mov r1, #1
	add r2, r1, #0
	bl ov37_021E762C
	ldr r0, [sp]
	mov r1, #5
	bl ov37_021E7844
	mov r1, #0x92
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #1
	bl ov37_021E6848
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021E67F0 ; =0x000005DC
	bl PlaySE
	b _021E6752
_021E66BC:
	ldr r1, _021E67FC ; =0x0000438B
	ldr r0, [sp]
	ldrb r0, [r0, r1]
	cmp r0, #2
	bne _021E66CE
	ldr r0, _021E67F4 ; =0x000005F2
	bl PlaySE
	b _021E6752
_021E66CE:
	mov r1, #1
	ldr r0, [sp]
	add r2, r1, #0
	bl ov37_021E762C
	ldr r0, [sp]
	mov r1, #5
	bl ov37_021E7844
	mov r1, #0x92
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #1
	bl ov37_021E6848
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021E67F0 ; =0x000005DC
	bl PlaySE
	b _021E6752
_021E66FA:
	ldr r0, [sp, #8]
	ldr r5, [sp]
	str r0, [sp, #0xc]
	sub r0, #9
	mov r4, #0
	mov r7, #0x1e
	mov r6, #0x1d
	str r0, [sp, #0xc]
_021E670A:
	ldr r0, [sp, #0xc]
	cmp r0, r4
	bne _021E671E
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
	b _021E672A
_021E671E:
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
_021E672A:
	add r4, r4, #1
	add r7, r7, #2
	add r5, r5, #4
	add r6, r6, #2
	cmp r4, #3
	blt _021E670A
	ldr r2, _021E6800 ; =0x00004377
	ldr r0, [sp]
	ldrb r1, [r0, r2]
	ldr r0, [sp, #8]
	sub r0, #9
	str r0, [sp, #8]
	cmp r1, r0
	beq _021E6752
	add r1, r0, #0
	ldr r0, [sp]
	strb r1, [r0, r2]
	ldr r0, _021E6804 ; =0x000005E5
	bl PlaySE
_021E6752:
	ldr r0, _021E6808 ; =ov37_021E7970
	bl sub_02025204
	add r4, r0, #0
	bl sub_0203769C
	lsl r1, r0, #2
	ldr r0, [sp]
	add r1, r0, r1
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021E67A8
	bl sub_0203769C
	lsl r1, r0, #2
	ldr r0, [sp]
	ldr r2, _021E680C ; =gSystem + 0x40
	add r1, r0, r1
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl ov37_021E657C
	bl sub_0203769C
	lsl r1, r0, #2
	ldr r0, [sp]
	add r1, r0, r1
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_021E67A8:
	add r0, sp, #0x10
	mov r1, #4
	mov r2, #0x40
	bl sub_02021280
	cmp r0, #1
	bne _021E67E2
	ldr r3, _021E6810 ; =0x00004378
	ldr r0, [sp]
	ldr r2, [sp]
	sub r4, r3, #2
	ldrb r2, [r2, r4]
	add r0, r0, r3
	sub r4, r3, #1
	ldr r3, [sp]
	add r1, sp, #0x10
	ldrb r3, [r3, r4]
	bl ov37_021E78E0
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _021E67E2
	ldr r1, _021E6814 ; =0x00004380
	ldr r0, [sp]
	ldrb r2, [r0, r1]
	mov r0, #0x38
	bic r2, r0
	ldr r0, [sp]
	strb r2, [r0, r1]
_021E67E2:
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	nop
_021E67E8: .word ov37_021E7A4C
_021E67EC: .word 0x00004376
_021E67F0: .word 0x000005DC
_021E67F4: .word 0x000005F2
_021E67F8: .word 0x000093F4
_021E67FC: .word 0x0000438B
_021E6800: .word 0x00004377
_021E6804: .word 0x000005E5
_021E6808: .word ov37_021E7970
_021E680C: .word gSystem + 0x40
_021E6810: .word 0x00004378
_021E6814: .word 0x00004380
	thumb_func_end ov37_021E65EC

	thumb_func_start ov37_021E6818
ov37_021E6818: ; 0x021E6818
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, _021E6844 ; =ov37_021E7A80
	add r5, r0, #0
	add r7, r1, #0
	mov r6, #0
_021E6822:
	cmp r6, r7
	ldr r0, [r5]
	bne _021E6832
	ldrh r1, [r4, #4]
	add r1, r1, #1
	bl Set2dSpriteAnimSeqNo
	b _021E6838
_021E6832:
	ldrh r1, [r4, #4]
	bl Set2dSpriteAnimSeqNo
_021E6838:
	add r6, r6, #1
	add r4, r4, #6
	add r5, r5, #4
	cmp r6, #8
	blt _021E6822
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6844: .word ov37_021E7A80
	thumb_func_end ov37_021E6818

	thumb_func_start ov37_021E6848
ov37_021E6848: ; 0x021E6848
	push {r3, lr}
	cmp r1, #1
	ldr r0, [r0, #0x20]
	bne _021E6858
	mov r1, #0x16
	bl Set2dSpriteAnimSeqNo
	pop {r3, pc}
_021E6858:
	mov r1, #0x15
	bl Set2dSpriteAnimSeqNo
	pop {r3, pc}
	thumb_func_end ov37_021E6848

	thumb_func_start ov37_021E6860
ov37_021E6860: ; 0x021E6860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov37_021E65EC
	bl sub_0203769C
	cmp r0, #0
	bne _021E6882
	bl ov37_021E745C
	cmp r0, #1
	beq _021E6888
	add r0, r5, #0
	bl ov37_021E755C
	b _021E6888
_021E6882:
	add r0, r5, #0
	bl ov37_021E755C
_021E6888:
	add r0, r5, #0
	bl ov37_021E73B4
	ldr r2, _021E68A8 ; =0x00004382
	mov r0, #0xb2
	lsl r0, r0, #2
	add r1, r5, r2
	add r2, #0x32
	add r0, r5, r0
	add r2, r5, r2
	mov r3, #1
	bl ov37_021E72E8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E68A8: .word 0x00004382
	thumb_func_end ov37_021E6860

	thumb_func_start ov37_021E68AC
ov37_021E68AC: ; 0x021E68AC
	push {r4, lr}
	add r4, r0, #0
	bl ov37_021E73B4
	ldr r2, _021E68CC ; =0x00004382
	mov r0, #0xb2
	lsl r0, r0, #2
	add r1, r4, r2
	add r2, #0x32
	add r0, r4, r0
	add r2, r4, r2
	mov r3, #0
	bl ov37_021E72E8
	pop {r4, pc}
	nop
_021E68CC: .word 0x00004382
	thumb_func_end ov37_021E68AC

	thumb_func_start ov37_021E68D0
ov37_021E68D0: ; 0x021E68D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	mov r1, #0x32
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	cmp r1, r0
	bne _021E68F0
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	bl ov37_021E762C
	b _021E68FA
_021E68F0:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov37_021E762C
_021E68FA:
	add r0, r5, #0
	mov r1, #2
	bl ov37_021E7844
	ldr r0, _021E6920 ; =0x000005E4
	bl PlaySE
	mov r1, #0xe
	add r2, r1, #0
	ldr r0, _021E6924 ; =0x04000050
	sub r2, #0x14
	bl G2x_SetBlendBrightness_
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6920: .word 0x000005E4
_021E6924: .word 0x04000050
	thumb_func_end ov37_021E68D0

	thumb_func_start ov37_021E6928
ov37_021E6928: ; 0x021E6928
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0x76
	add r5, r0, #0
	str r1, [sp]
	add r7, r4, #0
	lsl r6, r6, #2
_021E6936:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021E6936
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov37_021E6928

	thumb_func_start ov37_021E694C
ov37_021E694C: ; 0x021E694C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _021E6978 ; =0x04000050
	mov r2, #0
	strh r2, [r1]
	add r5, r0, #0
	mov r1, #1
	bl ov37_021E76D0
	add r0, r5, #0
	mov r1, #4
	bl ov37_021E7844
	add r0, r5, #0
	bl ov37_021E68AC
	ldr r0, _021E697C ; =0x00009404
	mov r1, #0
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6978: .word 0x04000050
_021E697C: .word 0x00009404
	thumb_func_end ov37_021E694C

	thumb_func_start ov37_021E6980
ov37_021E6980: ; 0x021E6980
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E69D0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r5]
	mov r1, #0xb4
	str r0, [sp]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #8
	str r1, [sp, #0xc]
	str r0, [sp, #4]
	mov r2, #0x19
	add r1, sp, #0
	strb r2, [r1, #0x10]
	mov r2, #6
	strb r2, [r1, #0x11]
	strb r0, [r1, #0x13]
	add r0, r5, #0
	add r1, sp, #0
	bl ov37_021E7880
	cmp r0, #0
	bne _021E69C8
	bl GF_AssertFail
_021E69C8:
	add r0, r5, #0
	mov r1, #6
	bl ov37_021E7844
_021E69D0:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov37_021E6980

	thumb_func_start ov37_021E69DC
ov37_021E69DC: ; 0x021E69DC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	add r5, r0, #0
	ldr r1, _021E6B28 ; =0x00004380
	mov r0, #0x38
	ldrb r2, [r5, r1]
	bic r2, r0
	strb r2, [r5, r1]
	add r1, #0xb
	ldrb r0, [r5, r1]
	cmp r0, #2
	bne _021E6A1A
	bl sub_0203769C
	cmp r0, #0
	beq _021E6A1A
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r5, #0
	bl ov37_021E78C4
	cmp r0, #0
	beq _021E6A14
	ldr r0, _021E6B2C ; =0x000005F2
	bl PlaySE
_021E6A14:
	add sp, #4
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E6A1A:
	bl sub_0203769C
	cmp r0, #0
	bne _021E6A36
	ldr r0, _021E6B30 ; =0x000093B4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6A36
	add r0, r5, #0
	bl ov37_021E68AC
	add sp, #4
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E6A36:
	bl ov37_021E75C4
	add r4, r0, #0
	bl sub_02037454
	cmp r4, r0
	beq _021E6A50
	add r0, r5, #0
	bl ov37_021E68AC
	add sp, #4
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_021E6A50:
	ldr r0, _021E6B34 ; =0x000093F0
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021E6A62
	cmp r0, #2
	beq _021E6AD2
	b _021E6B1A
_021E6A62:
	bl sub_0203769C
	cmp r0, #0
	bne _021E6A7E
	add r0, r5, #0
	mov r1, #0xd
	bl ov37_021E7844
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov37_021E762C
	b _021E6AC0
_021E6A7E:
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0, #2]
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _021E6B38 ; =0x000093BC
	mov r1, #1
	strb r1, [r5, r0]
	mov r1, #0
	sub r0, r0, #2
	strh r1, [r5, r0]
	add r0, r5, #0
	mov r1, #7
	bl ov37_021E7844
	mov r0, #0x7e
	add r1, sp, #0
	mov r2, #4
	bl sub_02037030
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
_021E6AC0:
	add r0, r5, #0
	bl ov37_021E78A4
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r5, r0
	bl CopyWindowToVram
	b _021E6B1A
_021E6AD2:
	add r0, r5, #0
	mov r1, #4
	bl ov37_021E7844
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov37_021E6848
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl ov37_021E78A4
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r5, r0
	bl CopyWindowToVram
	bl sub_0203769C
	cmp r0, #0
	bne _021E6B1A
	bl sub_02037454
	add r0, r0, #1
	bl sub_02038C1C
	ldr r0, _021E6B3C ; =0x000093F4
	mov r1, #1
	str r1, [r5, r0]
_021E6B1A:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r6, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E6B28: .word 0x00004380
_021E6B2C: .word 0x000005F2
_021E6B30: .word 0x000093B4
_021E6B34: .word 0x000093F0
_021E6B38: .word 0x000093BC
_021E6B3C: .word 0x000093F4
	thumb_func_end ov37_021E69DC

	thumb_func_start ov37_021E6B40
ov37_021E6B40: ; 0x021E6B40
	push {r4, lr}
	ldr r2, _021E6B5C ; =0x00004380
	add r4, r1, #0
	ldrb r3, [r0, r2]
	mov r1, #0x38
	bic r3, r1
	strb r3, [r0, r2]
	ldr r1, _021E6B60 ; =0x000093BA
	mov r2, #0
	strh r2, [r0, r1]
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_021E6B5C: .word 0x00004380
_021E6B60: .word 0x000093BA
	thumb_func_end ov37_021E6B40

	thumb_func_start ov37_021E6B64
ov37_021E6B64: ; 0x021E6B64
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _021E6BF0 ; =0x00004380
	mov r0, #0x38
	ldrb r2, [r5, r1]
	bic r2, r0
	strb r2, [r5, r1]
	bl sub_02037454
	ldr r1, _021E6BF4 ; =0x000093B8
	ldrh r1, [r5, r1]
	cmp r1, r0
	bne _021E6B8C
	bl ov37_021E75C4
	ldr r1, _021E6BF4 ; =0x000093B8
	ldrh r2, [r5, r1]
	cmp r2, r0
	beq _021E6BA4
_021E6B8C:
	ldr r0, _021E6BF8 ; =0x000093BA
	mov r1, #0
	strh r1, [r5, r0]
	add r0, r5, #0
	mov r1, #9
	bl ov37_021E7844
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_021E6BA4:
	add r0, r1, #2
	ldrsh r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r5, r0]
	ldrsh r0, [r5, r0]
	cmp r0, #0x1e
	ble _021E6BE4
	add r0, sp, #0
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
	bl sub_0203769C
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0x7e
	add r1, sp, #0
	mov r2, #4
	bl sub_02037030
	ldr r0, _021E6BF8 ; =0x000093BA
	mov r1, #0
	strh r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0xa
	bl ov37_021E7844
_021E6BE4:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6BF0: .word 0x00004380
_021E6BF4: .word 0x000093B8
_021E6BF8: .word 0x000093BA
	thumb_func_end ov37_021E6B64

	thumb_func_start ov37_021E6BFC
ov37_021E6BFC: ; 0x021E6BFC
	push {r3, r4, r5, lr}
	ldr r2, _021E6C30 ; =0x00004380
	add r5, r0, #0
	ldrb r3, [r5, r2]
	add r4, r1, #0
	mov r1, #0x38
	bic r3, r1
	strb r3, [r5, r2]
	ldr r1, _021E6C34 ; =0x000093BC
	mov r2, #0
	strb r2, [r5, r1]
	mov r1, #4
	bl ov37_021E7844
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov37_021E6848
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6C30: .word 0x00004380
_021E6C34: .word 0x000093BC
	thumb_func_end ov37_021E6BFC

	thumb_func_start ov37_021E6C38
ov37_021E6C38: ; 0x021E6C38
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #6
	mov r2, #1
	bl ov37_021E762C
	add r0, r5, #0
	mov r1, #0xb
	bl ov37_021E7844
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E6C38

	thumb_func_start ov37_021E6C58
ov37_021E6C58: ; 0x021E6C58
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6C78
	mov r0, #0x31
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0xc
	bl ov37_021E7844
_021E6C78:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov37_021E6C58

	thumb_func_start ov37_021E6C84
ov37_021E6C84: ; 0x021E6C84
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x31
	lsl r0, r0, #4
	add r4, r1, #0
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0x3c
	ble _021E6CB4
	mov r1, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x27
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r4, #3
_021E6CB4:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov37_021E6C84

	thumb_func_start ov37_021E6CC0
ov37_021E6CC0: ; 0x021E6CC0
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6D06
	ldr r0, [r5]
	mov r1, #0xb4
	str r0, [sp]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #8
	str r1, [sp, #0xc]
	str r0, [sp, #4]
	mov r2, #0x19
	add r1, sp, #0
	strb r2, [r1, #0x10]
	mov r2, #6
	strb r2, [r1, #0x11]
	strb r0, [r1, #0x13]
	add r0, r5, #0
	add r1, sp, #0
	bl ov37_021E7880
	cmp r0, #0
	bne _021E6CFE
	bl GF_AssertFail
_021E6CFE:
	add r0, r5, #0
	mov r1, #0xe
	bl ov37_021E7844
_021E6D06:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov37_021E6CC0

	thumb_func_start ov37_021E6D14
ov37_021E6D14: ; 0x021E6D14
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021E6DC4 ; =0x000093F0
	add r6, r1, #0
	ldr r0, [r5, r0]
	bl sub_020168F4
	add r4, r0, #0
	bl ov37_021E75C4
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	cmp r1, r0
	bne _021E6D3A
	ldr r0, _021E6DC8 ; =0x000093B4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6D44
_021E6D3A:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021E6D44:
	cmp r4, #1
	beq _021E6D4E
	cmp r4, #2
	beq _021E6D7A
	b _021E6DB8
_021E6D4E:
	add r0, r5, #0
	mov r1, #0xf
	bl ov37_021E7844
	mov r1, #0
	mov r0, #0x7f
	add r2, r1, #0
	bl sub_02037108
	mov r0, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r6, #2
	bl ov37_021E78A4
	b _021E6DB8
_021E6D7A:
	add r0, r5, #0
	mov r1, #4
	bl ov37_021E7844
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ov37_021E6848
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl ov37_021E78A4
	bl sub_0203769C
	cmp r0, #0
	bne _021E6DB8
	bl sub_02037454
	add r0, r0, #1
	bl sub_02038C1C
	ldr r0, _021E6DCC ; =0x000093F4
	mov r1, #1
	str r1, [r5, r0]
_021E6DB8:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_021E6DC4: .word 0x000093F0
_021E6DC8: .word 0x000093B4
_021E6DCC: .word 0x000093F4
	thumb_func_end ov37_021E6D14

	thumb_func_start ov37_021E6DD0
ov37_021E6DD0: ; 0x021E6DD0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl BufferPlayersName
	add r0, r5, #0
	mov r1, #3
	mov r2, #1
	bl ov37_021E762C
	add r0, r5, #0
	mov r1, #0x10
	bl ov37_021E7844
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov37_021E6DD0

	thumb_func_start ov37_021E6E04
ov37_021E6E04: ; 0x021E6E04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6E22
	add r0, r5, #0
	mov r1, #0x11
	bl ov37_021E7844
	mov r0, #0xc8
	bl sub_02037AC0
_021E6E22:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E6E04

	thumb_func_start ov37_021E6E2C
ov37_021E6E2C: ; 0x021E6E2C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0xc8
	add r5, r1, #0
	bl sub_02037B38
	cmp r0, #0
	bne _021E6E46
	bl sub_02037454
	cmp r0, #1
	bne _021E6E5E
_021E6E46:
	mov r1, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x27
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r5, #3
_021E6E5E:
	add r0, r4, #0
	bl ov37_021E68AC
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov37_021E6E2C

	thumb_func_start ov37_021E6E6C
ov37_021E6E6C: ; 0x021E6E6C
	add r0, r1, #0
	bx lr
	thumb_func_end ov37_021E6E6C

	thumb_func_start ov37_021E6E70
ov37_021E6E70: ; 0x021E6E70
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #5
	mov r2, #1
	bl ov37_021E762C
	add r0, r5, #0
	mov r1, #0x14
	bl ov37_021E7844
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E6E70

	thumb_func_start ov37_021E6E90
ov37_021E6E90: ; 0x021E6E90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r4, r1, #0
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6EA8
	add r0, r5, #0
	mov r1, #0xc
	bl ov37_021E7844
_021E6EA8:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov37_021E6E90

	thumb_func_start ov37_021E6EB4
ov37_021E6EB4: ; 0x021E6EB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r4, r1, #0
	cmp r0, #0xff
	beq _021E6ED2
	bl ov37_021E76A0
	cmp r0, #0
	bne _021E6ED2
	ldr r0, [r5, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_021E6ED2:
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov37_021E762C
	add r0, r5, #0
	mov r1, #0x16
	bl ov37_021E7844
	ldr r0, _021E6F0C ; =0x000005E4
	bl PlaySE
	bl sub_0203769C
	cmp r0, #0
	bne _021E6EFA
	add r0, r5, #0
	mov r1, #0
	bl ov37_021E76D0
_021E6EFA:
	bl sub_02037454
	ldr r1, _021E6F10 ; =0x000093B0
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6F0C: .word 0x000005E4
_021E6F10: .word 0x000093B0
	thumb_func_end ov37_021E6EB4

	thumb_func_start ov37_021E6F14
ov37_021E6F14: ; 0x021E6F14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E6F58 ; =0x000093B0
	add r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6F32
	bl sub_02037454
	ldr r1, _021E6F58 ; =0x000093B0
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E6F32
	mov r0, #0
	str r0, [r5, r1]
_021E6F32:
	ldr r0, [r5, #0x30]
	bl ov37_021E76A0
	cmp r0, #0
	beq _021E6F4C
	add r0, r5, #0
	mov r1, #0x17
	bl ov37_021E7844
	mov r0, #0x31
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
_021E6F4C:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6F58: .word 0x000093B0
	thumb_func_end ov37_021E6F14

	thumb_func_start ov37_021E6F5C
ov37_021E6F5C: ; 0x021E6F5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E6FC0 ; =0x000093B0
	add r4, r1, #0
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6F7A
	bl sub_02037454
	ldr r1, _021E6FC0 ; =0x000093B0
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021E6F7A
	mov r0, #0
	str r0, [r5, r1]
_021E6F7A:
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0x3c
	ble _021E6FB4
	ldr r0, _021E6FC0 ; =0x000093B0
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E6FB4
	add r0, r5, #0
	bl ov37_021E76C0
	add r0, r5, #0
	mov r1, #4
	bl ov37_021E7844
	bl sub_0203769C
	cmp r0, #0
	bne _021E6FB4
	ldr r0, _021E6FC4 ; =0x000093F4
	mov r1, #1
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov37_021E76D0
_021E6FB4:
	add r0, r5, #0
	bl ov37_021E68AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E6FC0: .word 0x000093B0
_021E6FC4: .word 0x000093F4
	thumb_func_end ov37_021E6F5C

	thumb_func_start ov37_021E6FC8
ov37_021E6FC8: ; 0x021E6FC8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	cmp r5, #0xf
	bgt _021E6FFA
	bge _021E70A6
	cmp r5, #9
	bhi _021E70AE
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6FE6: ; jump table
	.short _021E70A4 - _021E6FE6 - 2 ; case 0
	.short _021E7000 - _021E6FE6 - 2 ; case 1
	.short _021E70A4 - _021E6FE6 - 2 ; case 2
	.short _021E703E - _021E6FE6 - 2 ; case 3
	.short _021E70A4 - _021E6FE6 - 2 ; case 4
	.short _021E70A4 - _021E6FE6 - 2 ; case 5
	.short _021E70A4 - _021E6FE6 - 2 ; case 6
	.short _021E70A4 - _021E6FE6 - 2 ; case 7
	.short _021E70A6 - _021E6FE6 - 2 ; case 8
	.short _021E70A6 - _021E6FE6 - 2 ; case 9
_021E6FFA:
	cmp r5, #0x15
	beq _021E7044
	pop {r4, r5, r6, pc}
_021E7000:
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #6
	beq _021E700E
	cmp r0, #0xe
	bne _021E7014
_021E700E:
	add r0, r4, #0
	bl ov37_021E78A4
_021E7014:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov37_021E6848
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferPlayersName
	mov r0, #0x32
	lsl r0, r0, #4
	str r6, [r4, r0]
	ldr r0, _021E70B0 ; =0x000093B4
	mov r1, #0
	str r1, [r4, r0]
	b _021E70A6
_021E703E:
	bl ov37_021E76C0
	b _021E70A6
_021E7044:
	ldr r0, _021E70B4 ; =0x000093BC
	ldrb r0, [r4, r0]
	cmp r0, #1
	beq _021E70AE
	add r0, r6, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl BufferPlayersName
	bl sub_0203769C
	cmp r6, r0
	beq _021E70AE
	bl sub_0203769C
	cmp r0, #0
	bne _021E7078
	ldr r1, _021E70B0 ; =0x000093B4
	ldr r0, _021E70B8 ; =0x0000FFFF
	ldr r2, [r4, r1]
	eor r0, r6
	and r0, r2
	str r0, [r4, r1]
_021E7078:
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #6
	beq _021E7086
	cmp r0, #0xe
	bne _021E7096
_021E7086:
	add r0, r4, #0
	bl ov37_021E78A4
	mov r0, #0xb2
	lsl r0, r0, #2
	add r0, r4, r0
	bl CopyWindowToVram
_021E7096:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov37_021E6848
	b _021E70A6
_021E70A4:
	pop {r4, r5, r6, pc}
_021E70A6:
	add r0, r4, #0
	add r1, r5, #0
	bl ov37_021E7844
_021E70AE:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E70B0: .word 0x000093B4
_021E70B4: .word 0x000093BC
_021E70B8: .word 0x0000FFFF
	thumb_func_end ov37_021E6FC8

	thumb_func_start ov37_021E70BC
ov37_021E70BC: ; 0x021E70BC
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
	bge _021E70E8
	neg r0, r4
	cmp r0, r2
	ble _021E70DC
	add r0, r2, #0
_021E70DC:
	ldr r5, [sp, #0x30]
	mov r4, #0
	sub r5, r5, r0
	add r6, r6, r0
	str r5, [sp, #0x30]
	sub r2, r2, r0
_021E70E8:
	cmp r3, #0
	bge _021E7100
	neg r0, r3
	cmp r0, r1
	ble _021E70F4
	add r0, r1, #0
_021E70F4:
	ldr r5, [sp, #0x34]
	mov r3, #0
	sub r5, r5, r0
	add r7, r7, r0
	str r5, [sp, #0x34]
	sub r1, r1, r0
_021E7100:
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
	thumb_func_end ov37_021E70BC

	thumb_func_start ov37_021E713C
ov37_021E713C: ; 0x021E713C
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
	bne _021E717C
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _021E717C
	ldr r0, [sp, #0x50]
	add r1, r2, #0
	str r1, [r0]
	ldr r0, [sp, #0x54]
	add r1, r3, #0
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_021E717C:
	ldr r0, [sp, #0x20]
	sub r0, r0, r4
	str r0, [sp, #0x34]
	bpl _021E7188
	neg r0, r0
	str r0, [sp, #0x34]
_021E7188:
	ldr r0, [sp, #0x24]
	sub r7, r0, r5
	bpl _021E7190
	neg r7, r7
_021E7190:
	ldr r0, [sp, #0x34]
	cmp r0, r7
	ble _021E721E
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E71B6
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E71A8
	mov r0, #1
	str r0, [sp, #0x2c]
	b _021E71AE
_021E71A8:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x2c]
_021E71AE:
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x20]
	ldr r5, [sp, #0x24]
	b _021E71C8
_021E71B6:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	bge _021E71C2
	mov r0, #1
	str r0, [sp, #0x2c]
	b _021E71C8
_021E71C2:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x2c]
_021E71C8:
	mov r0, #6
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
	bl ov37_021E70BC
	ldr r0, [sp, #0x34]
	add r4, r4, #1
	asr r6, r0, #1
	ldr r0, [sp, #0x38]
	cmp r4, r0
	bgt _021E72A2
_021E71EE:
	sub r6, r6, r7
	bpl _021E71FA
	ldr r0, [sp, #0x34]
	add r6, r6, r0
	ldr r0, [sp, #0x2c]
	add r5, r5, r0
_021E71FA:
	mov r0, #6
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
	bl ov37_021E70BC
	ldr r0, [sp, #0x38]
	add r4, r4, #1
	cmp r4, r0
	ble _021E71EE
	b _021E72A2
_021E721E:
	ldr r0, [sp, #0x24]
	cmp r5, r0
	ble _021E723E
	ldr r0, [sp, #0x20]
	cmp r4, r0
	ble _021E7230
	mov r0, #1
	str r0, [sp, #0x28]
	b _021E7236
_021E7230:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x28]
_021E7236:
	str r5, [sp, #0x30]
	ldr r5, [sp, #0x24]
	ldr r4, [sp, #0x20]
	b _021E7250
_021E723E:
	ldr r0, [sp, #0x20]
	cmp r4, r0
	bge _021E724A
	mov r0, #1
	str r0, [sp, #0x28]
	b _021E7250
_021E724A:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x28]
_021E7250:
	mov r0, #6
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
	bl ov37_021E70BC
	ldr r0, [sp, #0x30]
	add r5, r5, #1
	asr r6, r7, #1
	cmp r5, r0
	bgt _021E72A2
_021E7274:
	ldr r0, [sp, #0x34]
	sub r6, r6, r0
	bpl _021E7280
	ldr r0, [sp, #0x28]
	add r6, r6, r7
	add r4, r4, r0
_021E7280:
	mov r0, #6
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
	bl ov37_021E70BC
	ldr r0, [sp, #0x30]
	add r5, r5, #1
	cmp r5, r0
	ble _021E7274
_021E72A2:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x50]
	str r1, [r0]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x54]
	str r1, [r0]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov37_021E713C

	thumb_func_start ov37_021E72B4
ov37_021E72B4: ; 0x021E72B4
	mov r2, #0
_021E72B6:
	ldrb r3, [r0, #8]
	lsl r3, r3, #0x1a
	lsr r3, r3, #0x1d
	strh r3, [r1, #2]
	ldrb r3, [r0, #8]
	lsl r3, r3, #0x1a
	lsr r3, r3, #0x1d
	beq _021E72DA
	add r3, r0, r3
	sub r3, r3, #1
	ldrb r3, [r3]
	strb r3, [r1]
	ldrb r3, [r0, #8]
	lsl r3, r3, #0x1a
	lsr r3, r3, #0x1d
	add r3, r0, r3
	ldrb r3, [r3, #3]
	strb r3, [r1, #1]
_021E72DA:
	add r2, r2, #1
	add r0, #0xa
	add r1, r1, #4
	cmp r2, #5
	blt _021E72B6
	bx lr
	.balign 4, 0
	thumb_func_end ov37_021E72B4

	thumb_func_start ov37_021E72E8
ov37_021E72E8: ; 0x021E72E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #0x10]
	mov r0, #0
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	add r5, r1, #0
	add r7, r2, #0
_021E72FE:
	ldrb r0, [r5, #8]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1d
	beq _021E736E
	ldrh r0, [r7, #2]
	cmp r0, #0
	beq _021E7318
	ldrb r0, [r7]
	sub r0, #9
	str r0, [sp, #0x2c]
	ldrb r0, [r7, #1]
	sub r0, #0x11
	str r0, [sp, #0x28]
_021E7318:
	ldrb r0, [r5, #8]
	mov r4, #0
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x1d
	cmp r1, #0
	ble _021E736E
	mov r0, #1
	str r0, [sp, #0x20]
	cmp r1, #0
	ble _021E736E
_021E732C:
	add r0, sp, #0x2c
	str r0, [sp]
	add r0, sp, #0x28
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldrh r0, [r7, #2]
	mov r6, #0xc0
	add r3, r5, r4
	str r0, [sp, #0xc]
	ldrb r1, [r5, #8]
	ldrb r3, [r3, #4]
	ldr r0, [sp, #0x10]
	lsl r2, r1, #0x18
	lsr r2, r2, #0x1e
	mul r6, r2
	ldr r2, _021E73B0 ; =ov37_021E7AC8
	lsl r1, r1, #0x1d
	add r2, r2, r6
	lsr r6, r1, #0x1d
	mov r1, #0x18
	mul r1, r6
	add r1, r2, r1
	ldrb r2, [r5, r4]
	sub r3, #0x11
	sub r2, #9
	bl ov37_021E713C
	ldrb r0, [r5, #8]
	add r4, r4, #1
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1d
	cmp r4, r0
	blt _021E732C
_021E736E:
	ldr r0, [sp, #0x24]
	add r5, #0xa
	add r0, r0, #1
	add r7, r7, #4
	str r0, [sp, #0x24]
	cmp r0, #5
	blt _021E72FE
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _021E738E
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _021E738E
	ldr r0, [sp, #0x10]
	bl CopyWindowToVram
_021E738E:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl ov37_021E72B4
	mov r3, #0
	mov r1, #0x38
_021E739A:
	ldr r0, [sp, #0x14]
	add r3, r3, #1
	ldrb r2, [r0, #8]
	bic r2, r1
	strb r2, [r0, #8]
	add r0, #0xa
	str r0, [sp, #0x14]
	cmp r3, #5
	blt _021E739A
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E73B0: .word ov37_021E7AC8
	thumb_func_end ov37_021E72E8

	thumb_func_start ov37_021E73B4
ov37_021E73B4: ; 0x021E73B4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _021E7418 ; =0x00004382
	mov r7, #0x76
	mov r6, #0
	add r4, r5, r0
	lsl r7, r7, #2
_021E73C2:
	bl sub_0203769C
	cmp r6, r0
	beq _021E740A
	ldrb r0, [r4, #8]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1d
	beq _021E73FE
	add r0, r6, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E73FE
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldrb r0, [r4, #8]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1d
	add r2, r4, r0
	sub r1, r2, #1
	ldrb r1, [r1]
	ldrb r2, [r2, #3]
	ldr r0, [r5, r7]
	bl ov37_021E657C
	b _021E740A
_021E73FE:
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_021E740A:
	add r6, r6, #1
	add r4, #0xa
	add r5, r5, #4
	cmp r6, #5
	blt _021E73C2
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7418: .word 0x00004382
	thumb_func_end ov37_021E73B4

	thumb_func_start ov37_021E741C
ov37_021E741C: ; 0x021E741C
	push {r3, lr}
	ldrh r1, [r0]
	add r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r2, r1
	bls _021E7432
	mov r1, #0
	strh r1, [r0]
_021E7432:
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
	thumb_func_end ov37_021E741C

	thumb_func_start ov37_021E745C
ov37_021E745C: ; 0x021E745C
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_021E7462:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E746E
	add r5, r5, #1
_021E746E:
	add r4, r4, #1
	cmp r4, #5
	blt _021E7462
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E745C

	thumb_func_start ov37_021E7478
ov37_021E7478: ; 0x021E7478
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r3, #0
	add r5, r0, #0
	str r2, [sp, #0x10]
	bl sub_0203769C
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl ov37_021E75E8
	cmp r0, #0
	beq _021E7552
	mov r0, #0
	str r0, [sp, #0x18]
	add r6, r7, #0
	add r4, r7, #0
_021E749A:
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _021E74B2
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _021E74BE
_021E74B2:
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_021E74BE:
	ldr r0, [sp, #0x18]
	add r6, #8
	add r0, r0, #1
	add r4, r4, #4
	str r0, [sp, #0x18]
	cmp r0, #5
	blt _021E749A
	mov r6, #0
	add r4, r5, #0
_021E74D0:
	mov r0, #0x50
	mov r1, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #5
	blt _021E74D0
	mov r6, #0
	add r4, r7, #0
_021E74F0:
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _021E7540
	ldr r1, [r4, #0x14]
	bl PlayerName_FlatToString
	ldr r0, [sp, #0x14]
	cmp r0, r6
	bne _021E7524
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E7558 ; =0x0003040F
	mov r1, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r3, #0
	bl AddTextPrinterParameterized2
	b _021E7540
_021E7524:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	mov r1, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r3, #0
	bl AddTextPrinterParameterized2
_021E7540:
	add r0, r5, #0
	bl CopyWindowToVram
	add r6, r6, #1
	add r7, #8
	add r4, r4, #4
	add r5, #0x10
	cmp r6, #5
	blt _021E74F0
_021E7552:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E7558: .word 0x0003040F
	thumb_func_end ov37_021E7478

	thumb_func_start ov37_021E755C
ov37_021E755C: ; 0x021E755C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E759C
	bl sub_0203783C
	cmp r0, #0
	beq _021E75B0
	ldr r1, _021E75B4 ; =0x000093F4
	ldr r0, _021E75B8 ; =0x00004381
	ldr r2, [r4, r1]
	sub r1, #0x37
	strb r2, [r4, r0]
	sub r0, #9
	add r2, r4, r1
	add r3, r4, r0
	mov r1, #0xa
_021E7582:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E7582
	ldr r1, _021E75BC ; =0x000093BD
	mov r0, #0x78
	add r1, r4, r1
	mov r2, #0x32
	bl sub_02037108
	pop {r4, pc}
_021E759C:
	bl sub_02037854
	cmp r0, #0
	beq _021E75B0
	ldr r1, _021E75C0 ; =0x00004378
	mov r0, #0x77
	add r1, r4, r1
	mov r2, #0xa
	bl sub_02037030
_021E75B0:
	pop {r4, pc}
	nop
_021E75B4: .word 0x000093F4
_021E75B8: .word 0x00004381
_021E75BC: .word 0x000093BD
_021E75C0: .word 0x00004378
	thumb_func_end ov37_021E755C

	thumb_func_start ov37_021E75C4
ov37_021E75C4: ; 0x021E75C4
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_021E75CA:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _021E75D6
	add r5, r5, #1
_021E75D6:
	add r4, r4, #1
	cmp r4, #5
	blt _021E75CA
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov37_021E75C4

	thumb_func_start ov37_021E75E0
ov37_021E75E0: ; 0x021E75E0
	ldr r3, _021E75E4 ; =ov37_021E75C4
	bx r3
	.balign 4, 0
_021E75E4: .word ov37_021E75C4
	thumb_func_end ov37_021E75E0

	thumb_func_start ov37_021E75E8
ov37_021E75E8: ; 0x021E75E8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #0
	add r6, r7, #0
	add r4, r5, #0
_021E75F2:
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	add r0, r6, #0
	bl sub_02034818
	mov r1, #0xcd
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r6, r6, #1
	add r4, #8
	cmp r6, #5
	blt _021E75F2
	mov r6, #0
	mov r2, #1
	add r0, r1, #4
_021E7616:
	ldr r4, [r5, r0]
	ldr r3, [r5, r1]
	cmp r4, r3
	beq _021E7620
	add r7, r2, #0
_021E7620:
	add r6, r6, #1
	add r5, #8
	cmp r6, #5
	blt _021E7616
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov37_021E75E8

	thumb_func_start ov37_021E762C
ov37_021E762C: ; 0x021E762C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0x50
	mov r1, #0x27
	add r4, r2, #0
	bl String_ctor
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x2c]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0xb6
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	cmp r4, #0
	bne _021E767C
	mov r4, #0
_021E767C:
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r2, [r5, #0x2c]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	str r0, [r5, #0x30]
	cmp r4, #0
	bne _021E769C
	mov r0, #0xff
	str r0, [r5, #0x30]
_021E769C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov37_021E762C

	thumb_func_start ov37_021E76A0
ov37_021E76A0: ; 0x021E76A0
	push {r3, lr}
	cmp r0, #0xff
	bne _021E76AA
	mov r0, #1
	pop {r3, pc}
_021E76AA:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E76BA
	mov r0, #1
	pop {r3, pc}
_021E76BA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov37_021E76A0

	thumb_func_start ov37_021E76C0
ov37_021E76C0: ; 0x021E76C0
	mov r1, #0xb6
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r3, _021E76CC ; =ClearFrameAndWindow2
	mov r1, #0
	bx r3
	.balign 4, 0
_021E76CC: .word ClearFrameAndWindow2
	thumb_func_end ov37_021E76C0

	thumb_func_start ov37_021E76D0
ov37_021E76D0: ; 0x021E76D0
	push {r4, lr}
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _021E76EC
	bl sub_02037454
	add r0, r4, r0
	cmp r0, #5
	ble _021E76E8
	mov r0, #5
_021E76E8:
	bl sub_02038C1C
_021E76EC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov37_021E76D0

	thumb_func_start ov37_021E76F0
ov37_021E76F0: ; 0x021E76F0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov37_021E75C4
	add r5, r0, #0
	cmp r5, #5
	bhi _021E778E
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E770A: ; jump table
	.short _021E778E - _021E770A - 2 ; case 0
	.short _021E7716 - _021E770A - 2 ; case 1
	.short _021E775C - _021E770A - 2 ; case 2
	.short _021E775C - _021E770A - 2 ; case 3
	.short _021E775C - _021E770A - 2 ; case 4
	.short _021E7788 - _021E770A - 2 ; case 5
_021E7716:
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0xe
	bgt _021E778E
	bl sub_02033250
	cmp r0, #1
	beq _021E7730
	mov r0, #0x25
	mov r1, #1
	lsl r0, r0, #0xa
	str r1, [r4, r0]
_021E7730:
	mov r0, #0xc2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	bl sub_02038C1C
	ldr r0, _021E7830 ; =0x000093F8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7758
	add r0, r4, #0
	bl ov37_021E78A4
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x15
	bl Set2dSpriteAnimSeqNo
_021E7758:
	mov r0, #2
	pop {r3, r4, r5, pc}
_021E775C:
	mov r0, #1
	bl sub_0205A904
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r5, r0
	bge _021E778E
	ldr r0, _021E7834 ; =0x000093F4
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _021E777E
	add r0, r4, #0
	mov r1, #0
	bl ov37_021E76D0
	b _021E778E
_021E777E:
	add r0, r4, #0
	mov r1, #1
	bl ov37_021E76D0
	b _021E778E
_021E7788:
	mov r0, #8
	bl sub_0205A904
_021E778E:
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r5, r0
	bge _021E77D8
	bl sub_02037454
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r4, r1]
	bl sub_02033250
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _021E7838 ; =0x00009404
	ldr r2, [r4, r0]
	cmp r2, #0
	beq _021E77D8
	add r0, r0, #4
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	tst r0, r1
	bne _021E77D8
	add r0, r4, #0
	mov r1, #1
	bl ov37_021E76D0
	ldr r1, _021E7834 ; =0x000093F4
	mov r0, #1
	str r0, [r4, r1]
	add r0, r1, #0
	mov r2, #0
	add r0, #0x10
	str r2, [r4, r0]
	add r1, #0x14
	str r2, [r4, r1]
_021E77D8:
	bl ov37_021E75C4
	mov r1, #0xc5
	lsl r1, r1, #2
	str r0, [r4, r1]
	bl sub_02037454
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, r0
	bge _021E782C
	ldr r0, _021E7834 ; =0x000093F4
	mov r1, #2
	str r1, [r4, r0]
	mov r1, #1
	add r0, #0x10
	str r1, [r4, r0]
	bl sub_02033250
	mov r1, #0xc7
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	eor r0, r1
	ldr r1, _021E783C ; =0x00009408
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	mov r0, #0
	sub r1, r1, #2
	cmp r1, #0xe
	bhi _021E7824
	mov r2, #1
	add r3, r2, #0
	lsl r3, r1
	ldr r1, _021E7840 ; =0x00004045
	tst r1, r3
	beq _021E7824
	add r0, r2, #0
_021E7824:
	cmp r0, #0
	bne _021E782C
	bl GF_AssertFail
_021E782C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7830: .word 0x000093F8
_021E7834: .word 0x000093F4
_021E7838: .word 0x00009404
_021E783C: .word 0x00009408
_021E7840: .word 0x00004045
	thumb_func_end ov37_021E76F0

	thumb_func_start ov37_021E7844
ov37_021E7844: ; 0x021E7844
	mov r2, #0xc2
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov37_021E7844

	thumb_func_start ov37_021E784C
ov37_021E784C: ; 0x021E784C
	push {r3, r4}
	mov r3, #0xc2
	lsl r3, r3, #2
	sub r4, r3, #4
	ldr r2, [r0, r3]
	ldr r4, [r0, r4]
	cmp r4, r2
	beq _021E7876
	cmp r1, #2
	beq _021E7868
	sub r1, r3, #4
	str r2, [r0, r1]
	pop {r3, r4}
	bx lr
_021E7868:
	ldr r1, _021E787C ; =ov37_021E7D20 + 4
	lsl r4, r2, #3
	ldr r1, [r1, r4]
	cmp r1, #0
	beq _021E7876
	sub r1, r3, #4
	str r2, [r0, r1]
_021E7876:
	pop {r3, r4}
	bx lr
	nop
_021E787C: .word ov37_021E7D20 + 4
	thumb_func_end ov37_021E784C

	thumb_func_start ov37_021E7880
ov37_021E7880: ; 0x021E7880
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E78A0 ; =0x000093F8
	ldr r2, [r4, r0]
	cmp r2, #0
	bne _021E789C
	sub r0, #8
	ldr r0, [r4, r0]
	bl sub_020166FC
	ldr r1, _021E78A0 ; =0x000093F8
	mov r0, #1
	str r0, [r4, r1]
	pop {r4, pc}
_021E789C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E78A0: .word 0x000093F8
	thumb_func_end ov37_021E7880

	thumb_func_start ov37_021E78A4
ov37_021E78A4: ; 0x021E78A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E78C0 ; =0x000093F8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E78BE
	sub r0, #8
	ldr r0, [r4, r0]
	bl sub_020169CC
	ldr r0, _021E78C0 ; =0x000093F8
	mov r1, #0
	str r1, [r4, r0]
_021E78BE:
	pop {r4, pc}
	.balign 4, 0
_021E78C0: .word 0x000093F8
	thumb_func_end ov37_021E78A4

	thumb_func_start ov37_021E78C4
ov37_021E78C4: ; 0x021E78C4
	push {r3, lr}
	ldr r0, _021E78DC ; =_021E7968
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E78D8
	mov r0, #1
	pop {r3, pc}
_021E78D8:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E78DC: .word _021E7968
	thumb_func_end ov37_021E78C4

	thumb_func_start ov37_021E78E0
ov37_021E78E0: ; 0x021E78E0
	push {r4, r5, r6, r7}
	add r5, r1, #0
	ldrh r1, [r5]
	add r4, r2, #0
	add r2, r3, #0
	cmp r1, #0
	beq _021E791C
	ldrh r1, [r5, #2]
	strb r1, [r0]
	ldrh r1, [r5, #4]
	strb r1, [r0, #4]
	ldrh r1, [r5]
	sub r1, r1, #1
	lsl r1, r1, #3
	add r3, r5, r1
	ldrh r1, [r3, #2]
	strb r1, [r0, #1]
	ldrh r1, [r3, #4]
	strb r1, [r0, #5]
	mov r1, #0
	add r3, r1, #0
_021E790A:
	add r6, r0, r1
	ldrb r7, [r0, r1]
	ldrb r6, [r6, #4]
	add r6, r7, r6
	bne _021E7916
	strh r3, [r5]
_021E7916:
	add r1, r1, #1
	cmp r1, #2
	blt _021E790A
_021E791C:
	ldrh r5, [r5]
	cmp r5, #2
	blo _021E792C
	ldrb r3, [r0, #8]
	mov r1, #0x38
	bic r3, r1
	mov r1, #0x10
	b _021E793A
_021E792C:
	ldrb r1, [r0, #8]
	mov r3, #0x38
	bic r1, r3
	lsl r3, r5, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1d
	lsr r3, r3, #0x1a
_021E793A:
	orr r1, r3
	strb r1, [r0, #8]
	ldrb r1, [r0, #8]
	mov r3, #7
	bic r1, r3
	lsl r3, r4, #0x18
	lsr r4, r3, #0x18
	mov r3, #7
	and r3, r4
	orr r1, r3
	strb r1, [r0, #8]
	ldrb r3, [r0, #8]
	mov r1, #0xc0
	bic r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x18
	orr r1, r3
	strb r1, [r0, #8]
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov37_021E78E0

	.rodata

_021E7968:
	.byte 0x30, 0x70, 0xC8, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov37_021E7970: ; 0x021E7970
	.byte 0x10, 0x88, 0x08, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov37_021E7978: ; 0x021E7978
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov37_021E7988: ; 0x021E7988
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00

ov37_021E7998: ; 0x021E7998
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov37_021E79B4: ; 0x021E79B4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov37_021E79D0: ; 0x021E79D0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov37_021E79EC: ; 0x021E79EC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov37_021E7A08: ; 0x021E7A08
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov37_021E7A24: ; 0x021E7A24
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov37_021E7A4C: ; 0x021E7A4C
	.byte 0x96, 0xBD, 0x00, 0x17
	.byte 0x96, 0xBD, 0x18, 0x2F, 0x96, 0xBD, 0x30, 0x47, 0x96, 0xBD, 0x48, 0x5F, 0x96, 0xBD, 0x60, 0x77
	.byte 0x96, 0xBD, 0x78, 0x8F, 0x96, 0xBD, 0x90, 0xA7, 0x96, 0xBD, 0xA8, 0xBF, 0x96, 0xBD, 0xC0, 0xFF
	.byte 0x01, 0x0D, 0x0E, 0x1A, 0x01, 0x0D, 0x1E, 0x2A, 0x01, 0x0D, 0x2E, 0x3A, 0xFF, 0x00, 0x00, 0x00

ov37_021E7A80: ; 0x021E7A80
	.byte 0x0D, 0x00, 0xAB, 0x00, 0x05, 0x00, 0x25, 0x00, 0xAB, 0x00, 0x07, 0x00, 0x3D, 0x00, 0xAB, 0x00
	.byte 0x09, 0x00, 0x55, 0x00, 0xAB, 0x00, 0x0B, 0x00, 0x6D, 0x00, 0xAB, 0x00, 0x0D, 0x00, 0x85, 0x00
	.byte 0xAB, 0x00, 0x0F, 0x00, 0x9D, 0x00, 0xAB, 0x00, 0x11, 0x00, 0xB5, 0x00, 0xAB, 0x00, 0x13, 0x00
	.byte 0xE1, 0x00, 0xAB, 0x00, 0x15, 0x00, 0x14, 0x00, 0x09, 0x00, 0x1D, 0x00, 0x24, 0x00, 0x09, 0x00
	.byte 0x20, 0x00, 0x34, 0x00, 0x09, 0x00, 0x21, 0x00

ov37_021E7AC8: ; 0x021E7AC8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x11, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x55, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x77, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00
	.byte 0x10, 0x11, 0x01, 0x00, 0x10, 0x11, 0x01, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x20, 0x22, 0x02, 0x00, 0x20, 0x22, 0x02, 0x00
	.byte 0x00, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00
	.byte 0x30, 0x33, 0x03, 0x00, 0x30, 0x33, 0x03, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x40, 0x44, 0x04, 0x00, 0x40, 0x44, 0x04, 0x00
	.byte 0x00, 0x44, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00
	.byte 0x50, 0x55, 0x05, 0x00, 0x50, 0x55, 0x05, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x60, 0x66, 0x06, 0x00, 0x60, 0x66, 0x06, 0x00
	.byte 0x00, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00
	.byte 0x70, 0x77, 0x07, 0x00, 0x70, 0x77, 0x07, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x80, 0x88, 0x08, 0x00, 0x80, 0x88, 0x08, 0x00
	.byte 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x11, 0x01, 0x00, 0x11, 0x11, 0x11, 0x00
	.byte 0x11, 0x11, 0x11, 0x00, 0x11, 0x11, 0x11, 0x00, 0x11, 0x11, 0x11, 0x00, 0x10, 0x11, 0x01, 0x00
	.byte 0x20, 0x22, 0x02, 0x00, 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00, 0x22, 0x22, 0x22, 0x00
	.byte 0x22, 0x22, 0x22, 0x00, 0x20, 0x22, 0x02, 0x00, 0x30, 0x33, 0x03, 0x00, 0x33, 0x33, 0x33, 0x00
	.byte 0x33, 0x33, 0x33, 0x00, 0x33, 0x33, 0x33, 0x00, 0x33, 0x33, 0x33, 0x00, 0x30, 0x33, 0x03, 0x00
	.byte 0x40, 0x44, 0x04, 0x00, 0x44, 0x44, 0x44, 0x00, 0x44, 0x44, 0x44, 0x00, 0x44, 0x44, 0x44, 0x00
	.byte 0x44, 0x44, 0x44, 0x00, 0x40, 0x44, 0x04, 0x00, 0x50, 0x55, 0x05, 0x00, 0x55, 0x55, 0x55, 0x00
	.byte 0x55, 0x55, 0x55, 0x00, 0x55, 0x55, 0x55, 0x00, 0x55, 0x55, 0x55, 0x00, 0x50, 0x55, 0x05, 0x00
	.byte 0x60, 0x66, 0x06, 0x00, 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00, 0x66, 0x66, 0x66, 0x00
	.byte 0x66, 0x66, 0x66, 0x00, 0x60, 0x66, 0x06, 0x00, 0x70, 0x77, 0x07, 0x00, 0x77, 0x77, 0x77, 0x00
	.byte 0x77, 0x77, 0x77, 0x00, 0x77, 0x77, 0x77, 0x00, 0x77, 0x77, 0x77, 0x00, 0x70, 0x77, 0x07, 0x00
	.byte 0x80, 0x88, 0x08, 0x00, 0x88, 0x88, 0x88, 0x00, 0x88, 0x88, 0x88, 0x00, 0x88, 0x88, 0x88, 0x00
	.byte 0x88, 0x88, 0x88, 0x00, 0x80, 0x88, 0x08, 0x00

	.data

ov37_021E7D20:
	.word 0, 1
	.word ov37_021E68D0, 0
	.word ov37_021E6928, 0
	.word ov37_021E694C, 0
	.word ov37_021E6860, 0
	.word ov37_021E6980, 1
	.word ov37_021E69DC, 1
	.word ov37_021E6B40, 1
	.word ov37_021E6B64, 1
	.word ov37_021E6BFC, 1
	.word ov37_021E6C38, 1
	.word ov37_021E6C58, 1
	.word ov37_021E6C84, 1
	.word ov37_021E6CC0, 1
	.word ov37_021E6D14, 1
	.word ov37_021E6DD0, 1
	.word ov37_021E6E04, 1
	.word ov37_021E6E2C, 1
	.word ov37_021E6E6C, 1
	.word ov37_021E6E70, 1
	.word ov37_021E6E90, 1
	.word ov37_021E6EB4, 1
	.word ov37_021E6F14, 1
	.word ov37_021E6F5C, 1
	; 0x021E7DE0
