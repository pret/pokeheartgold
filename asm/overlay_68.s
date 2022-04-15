	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov68_021E5900
ov68_021E5900: ; 0x021E5900
	push {r3, r4, r5, lr}
	mov r2, #9
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x42
	lsl r2, r2, #0xe
	bl CreateHeap
	mov r1, #0x77
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #0x42
	bl OverlayManager_CreateAndGetData
	mov r2, #0x77
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4]
	add r0, r4, #0
	bl ov68_021E5A58
	ldr r1, [r4]
	add r0, r4, #0
	ldrh r1, [r1, #0x14]
	mov r2, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov68_021E73A4
	mov r0, #0x1b
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov68_021E7424
	ldr r0, _021E5964 ; =ov68_021E5B6C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5964: .word ov68_021E5B6C
	thumb_func_end ov68_021E5900

	thumb_func_start ov68_021E5968
ov68_021E5968: ; 0x021E5968
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0xf
	bhi _021E5A22
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5984: ; jump table
	.short _021E59A4 - _021E5984 - 2 ; case 0
	.short _021E59AC - _021E5984 - 2 ; case 1
	.short _021E59B4 - _021E5984 - 2 ; case 2
	.short _021E59BC - _021E5984 - 2 ; case 3
	.short _021E59C4 - _021E5984 - 2 ; case 4
	.short _021E59CC - _021E5984 - 2 ; case 5
	.short _021E59D4 - _021E5984 - 2 ; case 6
	.short _021E59DC - _021E5984 - 2 ; case 7
	.short _021E59E4 - _021E5984 - 2 ; case 8
	.short _021E59EC - _021E5984 - 2 ; case 9
	.short _021E59F0 - _021E5984 - 2 ; case 10
	.short _021E59F8 - _021E5984 - 2 ; case 11
	.short _021E5A02 - _021E5984 - 2 ; case 12
	.short _021E5A0C - _021E5984 - 2 ; case 13
	.short _021E5A14 - _021E5984 - 2 ; case 14
	.short _021E5A1C - _021E5984 - 2 ; case 15
_021E59A4:
	bl ov68_021E5F50
	str r0, [r4]
	b _021E5A22
_021E59AC:
	bl ov68_021E5F68
	str r0, [r4]
	b _021E5A22
_021E59B4:
	bl ov68_021E6058
	str r0, [r4]
	b _021E5A22
_021E59BC:
	bl ov68_021E6078
	str r0, [r4]
	b _021E5A22
_021E59C4:
	bl ov68_021E60D8
	str r0, [r4]
	b _021E5A22
_021E59CC:
	bl ov68_021E614C
	str r0, [r4]
	b _021E5A22
_021E59D4:
	bl ov68_021E61A0
	str r0, [r4]
	b _021E5A22
_021E59DC:
	bl ov68_021E61B8
	str r0, [r4]
	b _021E5A22
_021E59E4:
	bl ov68_021E61EC
	str r0, [r4]
	b _021E5A22
_021E59EC:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E59F0:
	bl ov68_021E74C0
	str r0, [r4]
	b _021E5A22
_021E59F8:
	bl ov68_021E74D8
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5A02:
	bl ov68_021E7568
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5A0C:
	bl ov68_021E7AD8
	str r0, [r4]
	b _021E5A22
_021E5A14:
	bl ov68_021E7B6C
	str r0, [r4]
	b _021E5A22
_021E5A1C:
	bl ov68_021E7B8C
	str r0, [r4]
_021E5A22:
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov68_021E734C
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov68_021E5968

	thumb_func_start ov68_021E5A3C
ov68_021E5A3C: ; 0x021E5A3C
	push {r4, lr}
	add r4, r0, #0
	bl OverlayManager_GetData
	bl ov68_021E5B14
	add r0, r4, #0
	bl OverlayManager_FreeData
	mov r0, #0x42
	bl DestroyHeap
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov68_021E5A3C

	thumb_func_start ov68_021E5A58
ov68_021E5A58: ; 0x021E5A58
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5B08 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5B0C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #1
	bl sub_02002B8C
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_020183F0
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x42
	bl BgConfig_Alloc
	str r0, [r4, #4]
	mov r0, #0x6e
	mov r1, #0x42
	bl NARC_ctor
	add r5, r0, #0
	bl ov68_021E5BA0
	ldr r0, [r4, #4]
	bl ov68_021E5BC0
	add r0, r4, #0
	add r1, r5, #0
	bl ov68_021E5D24
	add r0, r4, #0
	add r1, r5, #0
	bl ov68_021E7178
	add r0, r4, #0
	bl ov68_021E7288
	add r0, r4, #0
	bl ov68_021E5EBC
	add r0, r4, #0
	bl ov68_021E5E48
	add r0, r4, #0
	bl ov68_021E6820
	add r0, r4, #0
	bl ov68_021E6204
	add r0, r4, #0
	bl ov68_021E6320
	add r0, r4, #0
	bl ov68_021E75C0
	mov r0, #0
	mov r1, #0x42
	bl sub_020880CC
	ldr r0, _021E5B10 ; =ov68_021E5B6C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	add r0, r5, #0
	bl NARC_dtor
	pop {r3, r4, r5, pc}
	nop
_021E5B08: .word 0xFFFFE0FF
_021E5B0C: .word 0x04001000
_021E5B10: .word ov68_021E5B6C
	thumb_func_end ov68_021E5A58

	thumb_func_start ov68_021E5B14
ov68_021E5B14: ; 0x021E5B14
	push {r4, lr}
	add r4, r0, #0
	bl ov68_021E7604
	add r0, r4, #0
	bl ov68_021E68C4
	add r0, r4, #0
	bl ov68_021E5E94
	add r0, r4, #0
	bl ov68_021E5E38
	ldr r0, [r4, #4]
	bl ov68_021E5CD8
	add r0, r4, #0
	bl ov68_021E5F18
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov68_021E7388
	add r0, r4, #0
	bl ov68_021E6E84
	ldr r0, [r4]
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r0, #0xc]
	ldr r1, [r4, r1]
	bl sub_02018410
	mov r0, #0
	bl sub_02002B8C
	bl GF_DestroyVramTransferManager
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	thumb_func_end ov68_021E5B14

	thumb_func_start ov68_021E5B6C
ov68_021E5B6C: ; 0x021E5B6C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02009418
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r3, _021E5B98 ; =0x027E0000
	ldr r1, _021E5B9C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E5B98: .word 0x027E0000
_021E5B9C: .word 0x00003FF8
	thumb_func_end ov68_021E5B6C

	thumb_func_start ov68_021E5BA0
ov68_021E5BA0: ; 0x021E5BA0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5BBC ; =ov68_021E7D14
	add r3, sp, #0
	mov r2, #5
_021E5BAA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5BAA
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5BBC: .word ov68_021E7D14
	thumb_func_end ov68_021E5BA0

	thumb_func_start ov68_021E5BC0
ov68_021E5BC0: ; 0x021E5BC0
	push {r4, r5, lr}
	sub sp, #0x9c
	ldr r5, _021E5CC0 ; =ov68_021E7BF8
	add r3, sp, #0x8c
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5CC4 ; =ov68_021E7C60
	add r3, sp, #0x70
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
	ldr r5, _021E5CC8 ; =ov68_021E7C44
	add r3, sp, #0x54
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
	ldr r5, _021E5CCC ; =ov68_021E7C7C
	add r3, sp, #0x38
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
	ldr r5, _021E5CD0 ; =ov68_021E7C98
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5CD4 ; =ov68_021E7CB4
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x42
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x42
	bl BG_ClearCharDataRange
	add sp, #0x9c
	pop {r4, r5, pc}
	nop
_021E5CC0: .word ov68_021E7BF8
_021E5CC4: .word ov68_021E7C60
_021E5CC8: .word ov68_021E7C44
_021E5CCC: .word ov68_021E7C7C
_021E5CD0: .word ov68_021E7C98
_021E5CD4: .word ov68_021E7CB4
	thumb_func_end ov68_021E5BC0

	thumb_func_start ov68_021E5CD8
ov68_021E5CD8: ; 0x021E5CD8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1d
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
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
	mov r0, #0x42
	add r1, r4, #0
	bl FreeToHeapExplicit
	ldr r2, _021E5D20 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	.balign 4, 0
_021E5D20: .word 0x04000304
	thumb_func_end ov68_021E5CD8

	thumb_func_start ov68_021E5D24
ov68_021E5D24: ; 0x021E5D24
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	add r4, r1, #0
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0x42
	add r2, r4, #0
	mov r3, #0x6e
	bl sub_0208820C
	mov r0, #4
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0x42
	add r2, r4, #0
	mov r3, #0x6e
	bl sub_0208820C
	mov r1, #0
	str r1, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0x42
	add r2, r4, #0
	mov r3, #0x6e
	bl sub_0208820C
	mov r0, #1
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0x42
	add r2, r4, #0
	mov r3, #0x6e
	bl sub_0208820C
	mov r0, #2
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0x42
	add r2, r4, #0
	mov r3, #0x6e
	bl sub_0208820C
	mov r1, #0
	str r1, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0x42
	add r2, r4, #0
	mov r3, #0x6e
	bl sub_0208820C
	mov r3, #0x71
	mov r0, #0x42
	lsl r3, r3, #2
	str r0, [sp]
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #7
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #4
	mov r2, #0x42
	bl LoadFontPal1
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x42
	bl LoadFontPal0
	mov r1, #0x1e
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x42
	bl LoadFontPal0
	ldr r0, [r5]
	ldr r0, [r0, #8]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x42
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	mov r1, #4
	mov r2, #0x3d
	mov r3, #0xd
	bl LoadUserFrameGfx2
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov68_021E5D24

	thumb_func_start ov68_021E5E38
ov68_021E5E38: ; 0x021E5E38
	mov r1, #7
	lsl r1, r1, #6
	ldr r3, _021E5E44 ; =FreeToHeap
	ldr r0, [r0, r1]
	bx r3
	nop
_021E5E44: .word FreeToHeap
	thumb_func_end ov68_021E5E38

	thumb_func_start ov68_021E5E48
ov68_021E5E48: ; 0x021E5E48
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #4
	mov r1, #0x42
	bl FontID_Alloc
	add r5, r7, #0
	ldr r4, _021E5E90 ; =ov68_021E7DFC
	mov r6, #0
	add r5, #8
_021E5E5C:
	ldr r0, [r7, #4]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #0xf
	blo _021E5E5C
	add r0, r7, #0
	add r0, #0x88
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x42
	bl sub_0201660C
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r7, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5E90: .word ov68_021E7DFC
	thumb_func_end ov68_021E5E48

	thumb_func_start ov68_021E5E94
ov68_021E5E94: ; 0x021E5E94
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	mov r5, #0
	add r4, #8
_021E5EA6:
	add r0, r4, #0
	bl RemoveWindow
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #0xf
	blo _021E5EA6
	mov r0, #4
	bl FontID_Release
	pop {r3, r4, r5, pc}
	thumb_func_end ov68_021E5E94

	thumb_func_start ov68_021E5EBC
ov68_021E5EBC: ; 0x021E5EBC
	push {r4, lr}
	ldr r2, _021E5F14 ; =0x000002EB
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x42
	bl NewMsgDataFromNarc
	add r1, r4, #0
	add r1, #0xf8
	str r0, [r1]
	mov r0, #0x42
	bl ScrStrBufs_new
	add r1, r4, #0
	add r1, #0xfc
	str r0, [r1]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x42
	bl String_ctor
	mov r1, #1
	lsl r1, r1, #8
	str r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r1, #0x19
	bl NewString_ReadMsgData
	mov r1, #0x41
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r1, #0x1f
	bl NewString_ReadMsgData
	mov r1, #0x42
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_021E5F14: .word 0x000002EB
	thumb_func_end ov68_021E5EBC

	thumb_func_start ov68_021E5F18
ov68_021E5F18: ; 0x021E5F18
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl DestroyMsgData
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	bl ScrStrBufs_delete
	mov r0, #1
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov68_021E5F18

	thumb_func_start ov68_021E5F50
ov68_021E5F50: ; 0x021E5F50
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5F64
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	pop {r4, pc}
_021E5F64:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov68_021E5F50

	thumb_func_start ov68_021E5F68
ov68_021E5F68: ; 0x021E5F68
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02019F74
	mov r1, #0x73
	lsl r1, r1, #2
	strh r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	bl sub_02019D18
	mov r1, #2
	add r5, r0, #0
	mvn r1, r1
	cmp r5, r1
	bhi _021E5FB8
	bhs _021E604E
	cmp r5, #7
	bhi _021E5FB0
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5FA0: ; jump table
	.short _021E5FC8 - _021E5FA0 - 2 ; case 0
	.short _021E5FC8 - _021E5FA0 - 2 ; case 1
	.short _021E5FC8 - _021E5FA0 - 2 ; case 2
	.short _021E5FC8 - _021E5FA0 - 2 ; case 3
	.short _021E604E - _021E5FA0 - 2 ; case 4
	.short _021E604E - _021E5FA0 - 2 ; case 5
	.short _021E601E - _021E5FA0 - 2 ; case 6
	.short _021E603E - _021E5FA0 - 2 ; case 7
_021E5FB0:
	mov r0, #3
	mvn r0, r0
	cmp r5, r0
	b _021E604E
_021E5FB8:
	add r0, r1, #1
	cmp r5, r0
	bhi _021E5FC2
	beq _021E601E
	b _021E604E
_021E5FC2:
	add r0, r1, #2
	cmp r5, r0
	b _021E604E
_021E5FC8:
	bl System_GetTouchNew
	cmp r0, #0
	ldr r0, [r4]
	bne _021E5FF6
	ldrh r0, [r0, #0x16]
	add r1, r0, r5
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _021E604E
	ldr r0, _021E6054 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	add r1, r5, #0
	bl ov68_021E7A18
	add r0, r4, #0
	bl ov68_021E7B94
	pop {r3, r4, r5, pc}
_021E5FF6:
	ldrh r0, [r0, #0x16]
	add r1, r0, r5
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r1, r0
	bhs _021E6014
	ldr r0, _021E6054 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	add r1, r5, #0
	bl ov68_021E7A18
	b _021E604E
_021E6014:
	add r0, r4, #0
	mov r1, #5
	bl ov68_021E7A18
	b _021E604E
_021E601E:
	ldr r0, _021E6054 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #5
	bl ov68_021E7A18
	add r0, r4, #0
	mov r1, #0
	bl ov68_021E7898
	add r0, r4, #0
	mov r1, #0xe
	bl ov68_021E7A90
	pop {r3, r4, r5, pc}
_021E603E:
	ldr r0, _021E6054 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xf
	bl ov68_021E7AB4
	pop {r3, r4, r5, pc}
_021E604E:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E6054: .word 0x000005DD
	thumb_func_end ov68_021E5F68

	thumb_func_start ov68_021E6058
ov68_021E6058: ; 0x021E6058
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6074 ; =0x000001B9
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E6070
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	pop {r4, pc}
_021E6070:
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_021E6074: .word 0x000001B9
	thumb_func_end ov68_021E6058

	thumb_func_start ov68_021E6078
ov68_021E6078: ; 0x021E6078
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #4]
	mov r3, #0x6d
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r1, #0x1a
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #0xa
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	mov r2, #0xf
	lsl r3, r3, #2
	bic r1, r2
	ldr r2, [r4, r3]
	sub r3, #0x9c
	lsl r2, r2, #0x18
	lsr r5, r2, #0x18
	mov r2, #0xf
	and r2, r5
	orr r1, r2
	strb r1, [r0, #0x12]
	ldrb r2, [r0, #0x12]
	mov r1, #0xf0
	bic r2, r1
	strb r2, [r0, #0x12]
	ldr r0, [r4, r3]
	add r1, sp, #0
	bl sub_020166FC
	mov r0, #1
	bl ov68_021E7BC8
	mov r0, #4
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov68_021E6078

	thumb_func_start ov68_021E60D8
ov68_021E60D8: ; 0x021E60D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021E60F0
	cmp r0, #2
	beq _021E6108
	b _021E6120
_021E60F0:
	ldr r1, _021E6140 ; =0x000001BA
	add r0, r5, #0
	ldrb r1, [r5, r1]
	lsl r2, r1, #3
	ldr r1, _021E6144 ; =ov68_021E7D3C
	ldr r1, [r1, r2]
	blx r1
	add r4, r0, #0
	mov r0, #0
	bl ov68_021E7BC8
	b _021E6124
_021E6108:
	ldr r1, _021E6140 ; =0x000001BA
	add r0, r5, #0
	ldrb r1, [r5, r1]
	lsl r2, r1, #3
	ldr r1, _021E6148 ; =ov68_021E7D40
	ldr r1, [r1, r2]
	blx r1
	add r4, r0, #0
	mov r0, #0
	bl ov68_021E7BC8
	b _021E6124
_021E6120:
	mov r0, #4
	pop {r3, r4, r5, pc}
_021E6124:
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020169C0
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x9c
	ldr r0, [r5, r1]
	bl sub_020169CC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6140: .word 0x000001BA
_021E6144: .word ov68_021E7D3C
_021E6148: .word ov68_021E7D40
	thumb_func_end ov68_021E60D8

	thumb_func_start ov68_021E614C
ov68_021E614C: ; 0x021E614C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov68_021E6BEC
	str r0, [sp]
	ldr r1, [r4]
	add r2, sp, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	add r1, #0x36
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	ldr r1, [r4]
	add r2, sp, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	add r1, #0x3e
	bl SetMonData
	add r0, r4, #0
	bl ov68_021E6BEC
	mov r1, #0
	bl WazaGetMaxPp
	str r0, [sp]
	ldr r1, [r4]
	add r2, sp, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	add r1, #0x3a
	bl SetMonData
	ldr r0, [r4]
	mov r1, #0
	strb r1, [r0, #0x1a]
	mov r0, #8
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov68_021E614C

	thumb_func_start ov68_021E61A0
ov68_021E61A0: ; 0x021E61A0
	push {r4, lr}
	mov r1, #6
	add r4, r0, #0
	bl ov68_021E6C14
	mov r0, #0x1b
	mov r1, #5
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov68_021E61A0

	thumb_func_start ov68_021E61B8
ov68_021E61B8: ; 0x021E61B8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldrb r1, [r1, #0x1b]
	cmp r1, #4
	bhs _021E61CE
	mov r1, #0xa
	bl ov68_021E6C14
	mov r1, #4
	b _021E61D6
_021E61CE:
	mov r1, #7
	bl ov68_021E6C14
	mov r1, #3
_021E61D6:
	ldr r0, _021E61E8 ; =0x000001BA
	strb r1, [r4, r0]
	mov r0, #0x1b
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	nop
_021E61E8: .word 0x000001BA
	thumb_func_end ov68_021E61B8

	thumb_func_start ov68_021E61EC
ov68_021E61EC: ; 0x021E61EC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0x42
	bl sub_020880CC
	mov r0, #0x1b
	mov r1, #9
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov68_021E61EC

	thumb_func_start ov68_021E6204
ov68_021E6204: ; 0x021E6204
	push {r4, lr}
	add r4, r0, #0
	bl ov68_021E6BEC
	add r1, r0, #0
	ldr r0, _021E6230 ; =0x0000FFFF
	cmp r1, r0
	beq _021E621C
	add r0, r4, #0
	bl ov68_021E68D4
	b _021E6226
_021E621C:
	mov r1, #1
	add r0, r4, #0
	mvn r1, r1
	bl ov68_021E68D4
_021E6226:
	add r0, r4, #0
	bl ov68_021E70BC
	pop {r4, pc}
	nop
_021E6230: .word 0x0000FFFF
	thumb_func_end ov68_021E6204

	thumb_func_start ov68_021E6234
ov68_021E6234: ; 0x021E6234
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [sp, #0x28]
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #0x10]
	cmp r0, #0
	beq _021E6250
	cmp r0, #1
	beq _021E6254
	cmp r0, #2
	beq _021E627E
	b _021E62AA
_021E6250:
	mov r3, #0
	b _021E62AA
_021E6254:
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r5, r1]
	add r0, r7, #0
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	add r1, r5, #0
	lsr r6, r0, #0x18
	add r1, #8
	lsl r0, r4, #4
	add r0, r1, r0
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	sub r0, r0, r6
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	b _021E62AA
_021E627E:
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r5, r1]
	add r0, r7, #0
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	add r1, r5, #0
	lsr r6, r0, #0x18
	add r1, #8
	lsl r0, r4, #4
	add r0, r1, r0
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	sub r1, r0, r6
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0x17
	lsr r3, r0, #0x18
_021E62AA:
	add r0, sp, #0x18
	ldrb r0, [r0, #0x14]
	add r1, r5, #0
	mov r2, #0xff
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0x10]
	add r2, r2, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r1, #8
	lsl r0, r4, #4
	add r0, r1, r0
	ldr r2, [r5, r2]
	add r1, r7, #0
	bl AddTextPrinterParameterized2
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov68_021E6234

	thumb_func_start ov68_021E62D4
ov68_021E62D4: ; 0x021E62D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r6, r2, #0
	add r7, r3, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	mov r1, #0
	add r2, r6, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	add r3, r7, #0
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #1
	add r0, #0xfc
	lsl r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov68_021E62D4

	thumb_func_start ov68_021E6320
ov68_021E6320: ; 0x021E6320
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	mov r1, #0x24
	add r2, r1, #0
	add r5, r0, #0
	add r0, #0xf8
	add r2, #0xdc
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r2, #0
	str r2, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r3, _021E666C ; =0x00010200
	add r0, r5, #0
	mov r1, #7
	bl ov68_021E6234
	add r0, r5, #0
	add r0, #0x78
	bl ScheduleWindowCopyToVram
	mov r1, #0x23
	add r0, r5, #0
	add r2, r1, #0
	add r0, #0xf8
	add r2, #0xdd
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #2
	str r0, [sp]
	mov r2, #4
	ldr r3, _021E6670 ; =0x000F0E00
	add r0, r5, #0
	mov r1, #8
	str r2, [sp, #4]
	bl ov68_021E6234
	mov r1, #0x22
	add r0, r5, #0
	add r2, r1, #0
	add r0, #0xf8
	add r2, #0xde
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #2
	str r0, [sp]
	mov r2, #4
	ldr r3, _021E6670 ; =0x000F0E00
	add r0, r5, #0
	mov r1, #9
	str r2, [sp, #4]
	bl ov68_021E6234
	add r0, r5, #0
	add r0, #0x98
	bl ScheduleWindowCopyToVram
	mov r1, #0x16
	add r0, r5, #0
	add r2, r1, #0
	add r0, #0xf8
	add r2, #0xea
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	ldr r3, _021E6670 ; =0x000F0E00
	add r0, r5, #0
	add r2, r1, #0
	str r1, [sp, #4]
	bl ov68_021E6234
	add r0, r5, #0
	add r0, #8
	bl ScheduleWindowCopyToVram
	mov r1, #0x17
	add r0, r5, #0
	add r2, r1, #0
	add r0, #0xf8
	add r2, #0xe9
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r2, #0
	str r2, [sp]
	ldr r3, _021E6670 ; =0x000F0E00
	add r0, r5, #0
	mov r1, #1
	str r2, [sp, #4]
	bl ov68_021E6234
	add r0, r5, #0
	add r0, #0x18
	bl ScheduleWindowCopyToVram
	mov r1, #0x18
	add r0, r5, #0
	add r2, r1, #0
	add r0, #0xf8
	add r2, #0xe8
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r2, #0
	str r2, [sp]
	ldr r3, _021E6670 ; =0x000F0E00
	add r0, r5, #0
	mov r1, #2
	str r2, [sp, #4]
	bl ov68_021E6234
	add r0, r5, #0
	add r0, #0x28
	bl ScheduleWindowCopyToVram
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0x42
	bl String_ctor
	str r0, [sp, #0x20]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	ldr r2, [sp, #0x20]
	mov r1, #0x27
	bl ReadMsgDataIntoString
	ldr r0, [r5]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r5, #0
	mov r1, #1
	add r0, #0xfc
	lsl r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	mov r2, #0
	str r2, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r3, _021E666C ; =0x00010200
	add r0, r5, #0
	mov r1, #0xc
	bl ov68_021E6234
	add r0, r5, #0
	add r0, #0xc8
	bl ScheduleWindowCopyToVram
	ldr r2, _021E6674 ; =0x000002EE
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x42
	bl NewMsgDataFromNarc
	str r0, [sp, #0x1c]
	ldr r0, [r5]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	str r0, [sp, #0x18]
	add r0, r5, #0
	mov r4, #0
	str r0, [sp, #0x24]
	add r0, #0xd8
	add r7, r5, #0
	str r4, [sp, #0x10]
	mov r6, #0x10
	str r0, [sp, #0x24]
_021E64A2:
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	add r1, #0x36
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	bne _021E64C4
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl sub_0200DCE8
	b _021E659C
_021E64C4:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #1
	bl sub_0200DCE8
	add r2, r4, #4
	lsl r2, r2, #0x10
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl ov68_021E7028
	mov r2, #1
	lsl r2, r2, #8
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x14]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, _021E6670 ; =0x000F0E00
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	bl ov68_021E6234
	mov r2, #0x41
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E666C ; =0x00010200
	lsl r2, r2, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r2, [r5, r2]
	mov r1, #0
	mov r3, #0x10
	bl AddTextPrinterParameterized2
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	add r1, #0x3a
	mov r2, #0
	bl GetBoxMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	add r1, #0x42
	mov r2, #0
	bl GetBoxMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	mov r3, #2
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x42
	add r0, #0xfc
	lsl r1, r1, #8
	lsl r2, r2, #2
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r2, #1
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E666C ; =0x00010200
	lsl r2, r2, #8
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r2, [r5, r2]
	mov r1, #0
	mov r3, #0x2d
	bl AddTextPrinterParameterized2
_021E659C:
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	add r0, #0x20
	add r7, r7, #4
	add r6, #0x20
	str r0, [sp, #0x10]
	cmp r4, #4
	bhs _021E65AE
	b _021E64A2
_021E65AE:
	add r0, r5, #0
	add r0, #0xd8
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	ldr r2, [sp, #0x20]
	mov r1, #0x25
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	ldr r2, [sp, #0x18]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	add r0, r5, #0
	mov r1, #1
	add r0, #0xfc
	lsl r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E666C ; =0x00010200
	add r2, r2, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, r2]
	add r0, #0xe8
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	ldr r2, [sp, #0x20]
	mov r1, #0x26
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x18]
	mov r1, #0xa1
	mov r2, #0
	bl GetBoxMonData
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #1
	add r0, #0xfc
	lsl r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [sp, #0x20]
	bl StringExpandPlaceholders
	mov r0, #1
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r3, _021E666C ; =0x00010200
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	bl ov68_021E6234
	add r5, #0xe8
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x1c]
	bl DestroyMsgData
	ldr r0, [sp, #0x20]
	bl String_dtor
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E666C: .word 0x00010200
_021E6670: .word 0x000F0E00
_021E6674: .word 0x000002EE
	thumb_func_end ov68_021E6320

	thumb_func_start ov68_021E6678
ov68_021E6678: ; 0x021E6678
	push {r3, r4}
	ldr r0, [r0]
	ldr r1, _021E669C ; =0x0000FFFF
	ldr r4, [r0, #0x10]
	mov r0, #1
	mov r3, #0
	lsl r0, r0, #8
_021E6686:
	ldrh r2, [r4]
	cmp r2, r1
	beq _021E6694
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, r0
	blo _021E6686
_021E6694:
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	nop
_021E669C: .word 0x0000FFFF
	thumb_func_end ov68_021E6678

	thumb_func_start ov68_021E66A0
ov68_021E66A0: ; 0x021E66A0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r6, r1, #0
	str r3, [sp]
	add r5, r2, #0
	add r1, sp, #0x20
	ldrb r2, [r1, #0x10]
	add r3, r5, #0
	str r2, [sp, #4]
	add r2, r0, #0
	add r2, #0xc
	str r2, [sp, #8]
	ldrb r2, [r1, #0x14]
	str r2, [sp, #0xc]
	ldrb r1, [r1, #0x18]
	add r2, r6, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #7
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	bl CopyToBgTilemapRect
	ldr r0, [r4, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov68_021E66A0

	thumb_func_start ov68_021E66F0
ov68_021E66F0: ; 0x021E66F0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r3, r1, r2
	mov r1, #0x6e
	add r5, r0, #0
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	lsl r4, r2, #5
	cmp r3, r1
	blt _021E6720
	mov r3, #4
	lsl r2, r2, #2
	add r2, r2, #4
	lsl r2, r2, #0x18
	str r3, [sp]
	mov r1, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl ov68_021E66A0
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E6720:
	str r4, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E67D8 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	lsl r6, r3, #3
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r2, #0x11
	ldr r2, [r5, r2]
	add r0, #0xa8
	ldr r2, [r2, r6]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x10
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E67DC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r2, r2, #5
	ldr r2, [r5, r2]
	add r0, #0xa8
	mov r3, #0x10
	bl AddTextPrinterParameterized2
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	add r0, r0, r6
	ldr r0, [r0, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl WazaGetMaxPp
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	add r2, r6, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	add r0, r5, #0
	str r1, [sp, #4]
	add r0, #0xfc
	ldr r0, [r0]
	add r2, r6, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r2, #1
	add r0, r5, #0
	lsl r2, r2, #8
	add r0, #0xfc
	ldr r1, [r5, r2]
	add r2, #8
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	add r4, #0x10
	str r4, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E67DC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r2, r2, #1
	ldr r2, [r5, r2]
	add r0, #0xa8
	mov r3, #0x2d
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E67D8: .word 0x000F0E00
_021E67DC: .word 0x00010200
	thumb_func_end ov68_021E66F0

	thumb_func_start ov68_021E67E0
ov68_021E67E0: ; 0x021E67E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xa8
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r4, #0
_021E67EE:
	ldr r1, [r5]
	lsl r2, r4, #0x18
	ldrh r1, [r1, #0x16]
	add r0, r5, #0
	lsr r2, r2, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov68_021E66F0
	add r4, r4, #1
	cmp r4, #4
	blo _021E67EE
	add r0, r5, #0
	add r0, #0xa8
	bl ScheduleWindowCopyToVram
	ldr r0, [r5, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl ov68_021E70BC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov68_021E67E0

	thumb_func_start ov68_021E6820
ov68_021E6820: ; 0x021E6820
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov68_021E6678
	mov r1, #0x6e
	lsl r1, r1, #2
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	mov r1, #0x42
	bl ListMenuItems_ctor
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r2, _021E68B8 ; =0x000002EE
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x42
	bl NewMsgDataFromNarc
	add r7, r0, #0
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	bls _021E689A
	add r6, r4, #0
_021E6858:
	ldr r0, [r5]
	ldr r0, [r0, #0x10]
	ldrh r2, [r0, r6]
	ldr r0, _021E68BC ; =0x0000FFFF
	cmp r2, r0
	beq _021E6874
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r7, #0
	add r3, r2, #0
	bl ListMenuItems_AppendFromMsgData
	b _021E688C
_021E6874:
	mov r0, #0x11
	add r1, r5, #0
	lsl r0, r0, #4
	add r1, #0xf8
	mov r2, #0x20
	add r3, r2, #0
	ldr r0, [r5, r0]
	ldr r1, [r1]
	sub r3, #0x22
	bl ListMenuItems_AppendFromMsgData
	b _021E689A
_021E688C:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, r0
	blo _021E6858
_021E689A:
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, _021E68C0 ; =0x000001BB
	mov r1, #0
	strb r1, [r5, r0]
	ldr r1, [r5]
	add r0, r0, #1
	ldrh r1, [r1, #0x14]
	strb r1, [r5, r0]
	add r0, r5, #0
	bl ov68_021E67E0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E68B8: .word 0x000002EE
_021E68BC: .word 0x0000FFFF
_021E68C0: .word 0x000001BB
	thumb_func_end ov68_021E6820

	thumb_func_start ov68_021E68C4
ov68_021E68C4: ; 0x021E68C4
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r3, _021E68D0 ; =ListMenuItems_dtor
	ldr r0, [r0, r1]
	bx r3
	nop
_021E68D0: .word ListMenuItems_dtor
	thumb_func_end ov68_021E68C4

	thumb_func_start ov68_021E68D4
ov68_021E68D4: ; 0x021E68D4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x58
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x38
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x48
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _021E69EE
	add r0, r4, #0
	mov r1, #2
	bl GetWazaAttr
	add r2, r0, #0
	cmp r2, #1
	bhi _021E692E
	mov r1, #0x21
	add r0, r5, #0
	add r2, r1, #0
	add r0, #0xf8
	add r2, #0xdf
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	b _021E693C
_021E692E:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x1d
	mov r3, #3
	bl ov68_021E62D4
_021E693C:
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	ldr r3, _021E6A24 ; =0x00010200
	add r0, r5, #0
	mov r1, #3
	str r2, [sp, #4]
	bl ov68_021E6234
	add r0, r4, #0
	mov r1, #4
	bl GetWazaAttr
	add r2, r0, #0
	bne _021E696E
	mov r1, #0x21
	add r0, r5, #0
	add r2, r1, #0
	add r0, #0xf8
	add r2, #0xdf
	ldr r0, [r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	b _021E697C
_021E696E:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x1e
	mov r3, #3
	bl ov68_021E62D4
_021E697C:
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	ldr r3, _021E6A24 ; =0x00010200
	add r0, r5, #0
	mov r1, #4
	str r2, [sp, #4]
	bl ov68_021E6234
	ldr r2, _021E6A28 ; =0x000002ED
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x42
	bl NewMsgDataFromNarc
	mov r2, #1
	lsl r2, r2, #8
	ldr r2, [r5, r2]
	add r1, r4, #0
	add r6, r0, #0
	bl ReadMsgDataIntoString
	mov r2, #0
	str r2, [sp]
	ldr r3, _021E6A24 ; =0x00010200
	add r0, r5, #0
	mov r1, #5
	str r2, [sp, #4]
	bl ov68_021E6234
	add r0, r6, #0
	bl DestroyMsgData
	lsl r1, r4, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl ov68_021E7124
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #8
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x18
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x28
	bl ScheduleWindowCopyToVram
	b _021E6A06
_021E69EE:
	add r0, r5, #0
	add r0, #8
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0x18
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	add r0, #0x28
	bl ClearWindowTilemapAndScheduleTransfer
_021E6A06:
	add r0, r5, #0
	add r0, #0x58
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x38
	bl ScheduleWindowCopyToVram
	add r5, #0x48
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E6A24: .word 0x00010200
_021E6A28: .word 0x000002ED
	thumb_func_end ov68_021E68D4

	thumb_func_start ov68_021E6A2C
ov68_021E6A2C: ; 0x021E6A2C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0xa
	bls _021E6A38
	b _021E6BB0
_021E6A38:
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6A44: ; jump table
	.short _021E6A5A - _021E6A44 - 2 ; case 0
	.short _021E6A72 - _021E6A44 - 2 ; case 1
	.short _021E6A86 - _021E6A44 - 2 ; case 2
	.short _021E6A9E - _021E6A44 - 2 ; case 3
	.short _021E6ACA - _021E6A44 - 2 ; case 4
	.short _021E6AF6 - _021E6A44 - 2 ; case 5
	.short _021E6B22 - _021E6A44 - 2 ; case 6
	.short _021E6B4E - _021E6A44 - 2 ; case 7
	.short _021E6B62 - _021E6A44 - 2 ; case 8
	.short _021E6B8E - _021E6A44 - 2 ; case 9
	.short _021E6B9E - _021E6A44 - 2 ; case 10
_021E6A5A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	b _021E6BB0
_021E6A72:
	bl ov68_021E6BEC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	bl BufferMoveName
	b _021E6BB0
_021E6A86:
	ldr r0, [r4]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	b _021E6BB0
_021E6A9E:
	ldr r0, [r4]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	bl ov68_021E6BEC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	bl BufferMoveName
	b _021E6BB0
_021E6ACA:
	ldr r0, [r4]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	bl ov68_021E6BEC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	bl BufferMoveName
	b _021E6BB0
_021E6AF6:
	ldr r0, [r4]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	bl ov68_021E6BFC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	bl BufferMoveName
	b _021E6BB0
_021E6B22:
	ldr r0, [r4]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	bl ov68_021E6BEC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	bl BufferMoveName
	b _021E6BB0
_021E6B4E:
	bl ov68_021E6BEC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	bl BufferMoveName
	b _021E6BB0
_021E6B62:
	ldr r0, [r4]
	ldr r0, [r0]
	bl Mon_GetBoxMon
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	bl ov68_021E6BEC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #1
	bl BufferMoveName
	b _021E6BB0
_021E6B8E:
	ldr r2, [r4]
	add r0, #0xfc
	ldr r0, [r0]
	ldr r2, [r2, #4]
	mov r1, #2
	bl BufferPlayersName
	b _021E6BB0
_021E6B9E:
	bl ov68_021E6BFC
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0
	bl BufferMoveName
_021E6BB0:
	ldr r1, [r4]
	add r0, r4, #0
	ldrb r2, [r1, #0x19]
	add r0, #0xf8
	mov r1, #0x2c
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021E6BE8 ; =ov68_021E7DA4
	lsl r2, r5, #2
	add r1, r1, r3
	ldr r0, [r0]
	ldr r1, [r2, r1]
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	add r0, #0xfc
	lsl r1, r1, #8
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6BE8: .word ov68_021E7DA4
	thumb_func_end ov68_021E6A2C

	thumb_func_start ov68_021E6BEC
ov68_021E6BEC: ; 0x021E6BEC
	ldr r0, [r0]
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x16]
	ldrh r0, [r0, #0x14]
	add r0, r1, r0
	lsl r0, r0, #1
	ldrh r0, [r2, r0]
	bx lr
	thumb_func_end ov68_021E6BEC

	thumb_func_start ov68_021E6BFC
ov68_021E6BFC: ; 0x021E6BFC
	push {r3, lr}
	ldr r1, [r0]
	mov r2, #0
	ldr r0, [r1]
	ldrb r1, [r1, #0x1b]
	add r1, #0x36
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov68_021E6BFC

	thumb_func_start ov68_021E6C14
ov68_021E6C14: ; 0x021E6C14
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r5, r1, #0
	add r0, #0x68
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	mov r2, #0x3d
	mov r3, #0xd
	bl DrawFrameAndWindow2
	add r0, r4, #0
	add r1, r5, #0
	bl ov68_021E6A2C
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [r4]
	ldr r0, [r0, #8]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6C6C ; =ov68_021E6C8C
	mov r1, #1
	add r2, r1, #0
	str r0, [sp, #8]
	add r2, #0xff
	add r0, r4, #0
	ldr r2, [r4, r2]
	add r0, #0x68
	bl AddTextPrinterParameterized
	ldr r1, _021E6C70 ; =0x000001B9
	strb r0, [r4, r1]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E6C6C: .word ov68_021E6C8C
_021E6C70: .word 0x000001B9
	thumb_func_end ov68_021E6C14

	thumb_func_start ov68_021E6C74
ov68_021E6C74: ; 0x021E6C74
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x68
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #0x68
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov68_021E6C74

	thumb_func_start ov68_021E6C8C
ov68_021E6C8C: ; 0x021E6C8C
	push {r3, lr}
	cmp r1, #5
	bhi _021E6CD0
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6C9E: ; jump table
	.short _021E6CD0 - _021E6C9E - 2 ; case 0
	.short _021E6CAA - _021E6C9E - 2 ; case 1
	.short _021E6CB0 - _021E6C9E - 2 ; case 2
	.short _021E6CB6 - _021E6C9E - 2 ; case 3
	.short _021E6CBE - _021E6C9E - 2 ; case 4
	.short _021E6CC8 - _021E6C9E - 2 ; case 5
_021E6CAA:
	bl GF_IsAnySEPlaying
	pop {r3, pc}
_021E6CB0:
	bl IsFanfarePlaying
	pop {r3, pc}
_021E6CB6:
	ldr r0, _021E6CD4 ; =0x000005E6
	bl PlaySE
	b _021E6CD0
_021E6CBE:
	mov r0, #0x4a
	lsl r0, r0, #4
	bl PlayFanfare
	b _021E6CD0
_021E6CC8:
	ldr r0, _021E6CD4 ; =0x000005E6
	bl IsSEPlaying
	pop {r3, pc}
_021E6CD0:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E6CD4: .word 0x000005E6
	thumb_func_end ov68_021E6C8C

	thumb_func_start ov68_021E6CD8
ov68_021E6CD8: ; 0x021E6CD8
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
_021E6CE0:
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	add r1, #0x36
	add r2, r6, #0
	bl GetMonData
	cmp r0, #0
	beq _021E6CFC
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E6CE0
_021E6CFC:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov68_021E6CD8

	thumb_func_start ov68_021E6D00
ov68_021E6D00: ; 0x021E6D00
	push {r4, lr}
	add r4, r0, #0
	mov r1, #3
	bl ov68_021E6C14
	add r0, r4, #0
	bl ov68_021E6CD8
	ldr r1, [r4]
	strb r0, [r1, #0x1b]
	mov r0, #0x1b
	mov r1, #5
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov68_021E6D00

	thumb_func_start ov68_021E6D20
ov68_021E6D20: ; 0x021E6D20
	push {r4, lr}
	add r4, r0, #0
	bl ov68_021E6C74
	ldr r0, _021E6D3C ; =0x000001CE
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _021E6D38
	add r0, r4, #0
	mov r1, #5
	bl ov68_021E7A18
_021E6D38:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021E6D3C: .word 0x000001CE
	thumb_func_end ov68_021E6D20

	thumb_func_start ov68_021E6D40
ov68_021E6D40: ; 0x021E6D40
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x1a]
	mov r0, #8
	bx lr
	.balign 4, 0
	thumb_func_end ov68_021E6D40

	thumb_func_start ov68_021E6D4C
ov68_021E6D4C: ; 0x021E6D4C
	push {r3, lr}
	bl ov68_021E6C74
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov68_021E6D4C

	thumb_func_start ov68_021E6D58
ov68_021E6D58: ; 0x021E6D58
	mov r1, #0x1b
	mov r2, #0xa
	lsl r1, r1, #4
	str r2, [r0, r1]
	mov r0, #0
	bx lr
	thumb_func_end ov68_021E6D58

	thumb_func_start ov68_021E6D64
ov68_021E6D64: ; 0x021E6D64
	push {r4, lr}
	mov r1, #7
	add r4, r0, #0
	bl ov68_021E6C14
	ldr r0, _021E6D7C ; =0x000001BA
	mov r1, #3
	strb r1, [r4, r0]
	sub r0, #0xa
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_021E6D7C: .word 0x000001BA
	thumb_func_end ov68_021E6D64

	thumb_func_start ov68_021E6D80
ov68_021E6D80: ; 0x021E6D80
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl ov68_021E6C14
	mov r0, #0x1b
	mov r1, #8
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4]
	mov r1, #1
	strb r1, [r0, #0x1a]
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov68_021E6D80

	thumb_func_start ov68_021E6D9C
ov68_021E6D9C: ; 0x021E6D9C
	push {r4, lr}
	mov r1, #4
	add r4, r0, #0
	bl ov68_021E6C14
	ldr r1, _021E6DB4 ; =0x000001BA
	mov r0, #2
	strb r0, [r4, r1]
	mov r2, #3
	sub r1, #0xa
	str r2, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_021E6DB4: .word 0x000001BA
	thumb_func_end ov68_021E6D9C

	thumb_func_start ov68_021E6DB8
ov68_021E6DB8: ; 0x021E6DB8
	push {r4, lr}
	mov r1, #5
	add r4, r0, #0
	bl ov68_021E6C14
	mov r0, #0x1b
	mov r1, #6
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov68_021E6DB8

	thumb_func_start ov68_021E6DD0
ov68_021E6DD0: ; 0x021E6DD0
	mov r1, #0x1b
	mov r2, #0xa
	lsl r1, r1, #4
	str r2, [r0, r1]
	mov r0, #0
	bx lr
	thumb_func_end ov68_021E6DD0

	thumb_func_start ov68_021E6DDC
ov68_021E6DDC: ; 0x021E6DDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021E6E78 ; =ov68_021E7C2C
	add r2, sp, #0x34
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0x40
	mov r1, #0x42
	bl GF_CreateVramTransferManager
	mov r0, #0x42
	bl sub_0200CF18
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	mov r7, #0x12
	lsl r7, r7, #4
	add r2, sp, #0x14
	ldr r3, _021E6E7C ; =ov68_021E7CD0
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _021E6E80 ; =ov68_021E7C18
	stmia r2!, {r0, r1}
	add r3, sp, #0
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
	mov r2, #0xc
	bl sub_0200CFF4
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl sub_0200D3F8
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6E78: .word ov68_021E7C2C
_021E6E7C: .word ov68_021E7CD0
_021E6E80: .word ov68_021E7C18
	thumb_func_end ov68_021E6DDC

	thumb_func_start ov68_021E6E84
ov68_021E6E84: ; 0x021E6E84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #0x49
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #2
_021E6E90:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xc
	blo _021E6E90
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r0, [r7, r1]
	add r1, r1, #4
	ldr r1, [r7, r1]
	bl sub_0200D998
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov68_021E6E84

	thumb_func_start ov68_021E6EB8
ov68_021E6EB8: ; 0x021E6EB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021E7014 ; =0x0000B8A8
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #6
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021E7018 ; =0x0000B8A9
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #0xb
	bl sub_0200D504
	ldr r4, _021E701C ; =0x0000B8AB
	add r7, r4, #4
_021E6F00:
	cmp r4, r7
	str r4, [sp]
	bhs _021E6F1C
	mov r0, #0x47
	mov r1, #0x12
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #2
	mov r3, #0
	bl sub_020776B8
	b _021E6F30
_021E6F1C:
	mov r0, #0x47
	mov r1, #0x12
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #1
	mov r3, #0
	bl sub_020776B8
_021E6F30:
	ldr r0, _021E7020 ; =0x0000B8B2
	add r4, r4, #1
	cmp r4, r0
	bls _021E6F00
	mov r1, #0x47
	sub r0, #8
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #2
	mov r3, #0
	bl sub_02077834
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021E7014 ; =0x0000B8A8
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #5
	bl sub_0200D5D4
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, _021E7018 ; =0x0000B8A9
	mov r2, #2
	bl sub_020776EC
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, _021E7024 ; =0x0000B8AA
	mov r2, #1
	bl sub_020776EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E7014 ; =0x0000B8A8
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #7
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E7018 ; =0x0000B8A9
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #0xa
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E7014 ; =0x0000B8A8
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #8
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E7018 ; =0x0000B8A9
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #9
	bl sub_0200D71C
	mov r1, #0x47
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r2, _021E7024 ; =0x0000B8AA
	ldr r1, [r5, r1]
	add r3, r2, #0
	bl sub_0207775C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7014: .word 0x0000B8A8
_021E7018: .word 0x0000B8A9
_021E701C: .word 0x0000B8AB
_021E7020: .word 0x0000B8B2
_021E7024: .word 0x0000B8AA
	thumb_func_end ov68_021E6EB8

	thumb_func_start ov68_021E7028
ov68_021E7028: ; 0x021E7028
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r2, #0
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	bne _021E7044
	add r0, r1, #0
	mov r1, #3
	bl GetWazaAttr
	add r6, r0, #0
	b _021E7050
_021E7044:
	add r0, r1, #0
	mov r1, #0xb
	bl GetWazaAttr
	add r6, r0, #0
	add r6, #0x12
_021E7050:
	bl sub_020776B4
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02077678
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E70B8 ; =0x0000B8AB
	mov r1, #0x47
	add r0, r4, r0
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl sub_0200E248
	cmp r4, #4
	bhs _021E709A
	add r0, r6, #0
	bl sub_0207769C
	add r1, r0, #0
	add r0, r4, #4
	lsl r0, r0, #2
	add r2, r5, r0
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	add r1, r1, #4
	bl sub_0200DD10
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E709A:
	add r0, r6, #0
	bl sub_0207769C
	add r1, r0, #0
	add r0, r4, #4
	lsl r0, r0, #2
	add r2, r5, r0
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl sub_0200DD10
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E70B8: .word 0x0000B8AB
	thumb_func_end ov68_021E7028

	thumb_func_start ov68_021E70BC
ov68_021E70BC: ; 0x021E70BC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	mov r7, #0x28
	add r5, r6, #0
_021E70C6:
	mov r0, #0x4d
	lsl r0, r0, #2
	lsl r2, r7, #0x10
	ldr r0, [r5, r0]
	mov r1, #0x16
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [r6]
	ldrh r0, [r0, #0x16]
	add r1, r0, r4
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	cmp r1, r0
	blo _021E70F4
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	b _021E7116
_021E70F4:
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
	ldr r2, [r6]
	add r0, r6, #0
	ldr r1, [r2, #0x10]
	ldrh r2, [r2, #0x16]
	add r2, r2, r4
	lsl r2, r2, #1
	ldrh r1, [r1, r2]
	lsl r2, r4, #0x10
	lsr r2, r2, #0x10
	bl ov68_021E7028
_021E7116:
	add r4, r4, #1
	add r7, #0x20
	add r5, r5, #4
	cmp r4, #4
	blo _021E70C6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov68_021E70BC

	thumb_func_start ov68_021E7124
ov68_021E7124: ; 0x021E7124
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #1
	bl GetWazaAttr
	add r4, r0, #0
	bl sub_02077830
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02077800
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E7174 ; =0x0000B8AA
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200E248
	add r0, r4, #0
	bl sub_02077818
	add r1, r0, #0
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r1, #4
	bl sub_0200DD10
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E7174: .word 0x0000B8AA
	thumb_func_end ov68_021E7124

	thumb_func_start ov68_021E7178
ov68_021E7178: ; 0x021E7178
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r4, r1, #0
	bl ov68_021E6DDC
	add r0, r6, #0
	add r1, r4, #0
	bl ov68_021E6EB8
	ldr r4, _021E71C0 ; =ov68_021E7E74
	mov r7, #0
	add r5, r6, #0
_021E7190:
	mov r0, #0x47
	mov r1, #0x12
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	add r2, r4, #0
	bl sub_0200D734
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC78
	add r7, r7, #1
	add r4, #0x34
	add r5, r5, #4
	cmp r7, #0xc
	blo _021E7190
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E71C0: .word ov68_021E7E74
	thumb_func_end ov68_021E7178

	thumb_func_start ov68_021E71C4
ov68_021E71C4: ; 0x021E71C4
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _021E721C ; =ov68_021E7BEC
	add r4, r0, #0
	add r2, r1, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x10
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, sp, #8
	str r0, [r3]
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	add r0, r2, #0
	bl GF_Camera_Create
	str r0, [r4]
	mov r1, #1
	str r1, [sp]
	ldr r0, [r4]
	ldr r3, _021E7220 ; =0x000005C1
	str r0, [sp, #4]
	add r0, sp, #0x10
	lsl r1, r1, #0x10
	add r2, sp, #8
	bl sub_020232BC
	mov r1, #0x19
	ldr r2, [r4]
	mov r0, #0
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	ldr r0, [r4]
	bl sub_02023234
	ldr r0, [r4]
	bl GF_Camera_RegisterToStaticPtr
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
_021E721C: .word ov68_021E7BEC
_021E7220: .word 0x000005C1
	thumb_func_end ov68_021E71C4

	thumb_func_start ov68_021E7224
ov68_021E7224: ; 0x021E7224
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	bl sub_02007FD4
	str r0, [r5, #4]
	add r0, sp, #0x10
	add r1, r4, #0
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	add r1, sp, #0x10
	mov r2, #0x34
	mov r3, #0x80
	bl sub_020085EC
	str r0, [r5, #0x18]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	add r0, r6, #0
	mov r2, #0x1c
	bl GetMonBaseStat_HandleAlternateForme
	add r3, r0, #0
	mov r2, #1
	ldr r0, [r5, #0x18]
	mov r1, #0x23
	eor r2, r3
	bl sub_020087A4
	add sp, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end ov68_021E7224

	thumb_func_start ov68_021E7288
ov68_021E7288: ; 0x021E7288
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl NNS_G3dInit
	bl G3X_Init
	bl G3X_InitMtxStack
	ldr r1, _021E7330 ; =0x04000060
	ldr r2, _021E7334 ; =0xFFFFCFFD
	ldrh r0, [r1]
	and r0, r2
	strh r0, [r1]
	ldrh r3, [r1]
	ldr r0, _021E7338 ; =0x0000CFFB
	and r3, r0
	strh r3, [r1]
	add r3, r2, #2
	ldrh r5, [r1]
	add r2, r2, #2
	sub r0, #0x1c
	and r5, r3
	mov r3, #8
	orr r3, r5
	strh r3, [r1]
	ldrh r3, [r1]
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r1]
	ldrh r2, [r1]
	and r0, r2
	strh r0, [r1]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _021E733C ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _021E7340 ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _021E7344 ; =0xBFFF0000
	mov r2, #0x1c
	str r0, [r1, #0x40]
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl MI_CpuFill8
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x42
	bl ov68_021E71C4
	ldr r1, [r4]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r1, [r1]
	add r0, r4, r0
	mov r2, #0x42
	bl ov68_021E7224
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _021E7348 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7330: .word 0x04000060
_021E7334: .word 0xFFFFCFFD
_021E7338: .word 0x0000CFFB
_021E733C: .word 0x00007FFF
_021E7340: .word 0x04000540
_021E7344: .word 0xBFFF0000
_021E7348: .word 0x04000008
	thumb_func_end ov68_021E7288

	thumb_func_start ov68_021E734C
ov68_021E734C: ; 0x021E734C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02026E48
	bl sub_02023154
	ldr r2, _021E7380 ; =0x04000440
	mov r3, #0
	add r1, r2, #0
	str r3, [r2]
	add r1, #0x14
	str r3, [r1]
	mov r0, #2
	str r0, [r2]
	str r3, [r1]
	bl NNS_G3dGlbFlushP
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r0, [r4, #4]
	bl sub_02008120
	ldr r0, _021E7384 ; =0x04000540
	mov r1, #1
	str r1, [r0]
	pop {r4, pc}
	.balign 4, 0
_021E7380: .word 0x04000440
_021E7384: .word 0x04000540
	thumb_func_end ov68_021E734C

	thumb_func_start ov68_021E7388
ov68_021E7388: ; 0x021E7388
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02023120
	ldr r0, [r4, #4]
	bl sub_02008524
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	pop {r4, pc}
	thumb_func_end ov68_021E7388

	thumb_func_start ov68_021E73A4
ov68_021E73A4: ; 0x021E73A4
	push {r3, r4, r5, lr}
	add r3, r1, #0
	add r4, r0, #0
	add r5, r2, #0
	cmp r3, #4
	bhs _021E73D2
	mov r0, #0x4b
	lsl r2, r3, #5
	lsl r0, r0, #2
	add r2, #0x20
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	mov r1, #0
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	b _021E7414
_021E73D2:
	cmp r3, #6
	bhs _021E73FA
	mov r0, #0x4b
	lsl r0, r0, #2
	sub r2, r3, #4
	mov r1, #0x28
	mul r1, r2
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	mov r2, #0xa8
	bl sub_0200DDB8
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCC0
	b _021E7414
_021E73FA:
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xc0
	mov r2, #0xa0
	bl sub_0200DDB8
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_0200DCC0
_021E7414:
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl sub_0200DD10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov68_021E73A4

	thumb_func_start ov68_021E7424
ov68_021E7424: ; 0x021E7424
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r7, r2, #0
	cmp r6, #0
	bne _021E7442
	cmp r7, #0
	beq _021E7442
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r4, #1
	bl sub_0200DCAC
	b _021E7444
_021E7442:
	mov r4, #0
_021E7444:
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	add r2, r0, #4
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	cmp r2, r1
	bge _021E7460
	sub r0, #0x94
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DC4C
	b _021E746A
_021E7460:
	sub r0, #0x94
	ldr r0, [r5, r0]
	add r1, r4, #2
	bl sub_0200DC4C
_021E746A:
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DC78
	cmp r6, #1
	bne _021E748C
	cmp r7, #0
	beq _021E748C
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r4, #1
	bl sub_0200DCAC
	b _021E748E
_021E748C:
	mov r4, #0
_021E748E:
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	beq _021E74A4
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #4
	bl sub_0200DC4C
	b _021E74B0
_021E74A4:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #6
	bl sub_0200DC4C
_021E74B0:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DC78
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov68_021E7424

	thumb_func_start ov68_021E74C0
ov68_021E74C0: ; 0x021E74C0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0x42
	bl sub_020880CC
	mov r0, #0x1b
	mov r1, #0xb
	lsl r0, r0, #4
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov68_021E74C0

	thumb_func_start ov68_021E74D8
ov68_021E74D8: ; 0x021E74D8
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _021E7560 ; =_021E7BE8
	add r1, sp, #0
	ldrb r3, [r2]
	ldrb r2, [r2, #1]
	add r4, r0, #0
	strb r3, [r1]
	strb r2, [r1, #1]
	bl ov68_021E5B14
	ldr r0, [r4]
	mov r1, #0x17
	ldr r0, [r0]
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4]
	ldr r2, [r0, #8]
	add r0, r1, #4
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #0
	add r0, #0x11
	strb r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x14
	strb r2, [r4, r0]
	mov r0, #1
	add r1, #0x13
	strb r0, [r4, r1]
	add r0, r4, #0
	bl ov68_021E6BEC
	mov r1, #0x62
	lsl r1, r1, #2
	strh r0, [r4, r1]
	mov r2, #2
	sub r0, r1, #6
	strb r2, [r4, r0]
	add r0, r1, #0
	mov r2, #1
	add r0, #0x14
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #0
	add r0, #0x10
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x18
	sub r1, #0x18
	str r2, [r4, r0]
	add r0, r4, r1
	add r1, sp, #0
	bl sub_02089D40
	mov r1, #0x17
	lsl r1, r1, #4
	ldr r0, _021E7564 ; =_02103A1C
	add r1, r4, r1
	mov r2, #0x42
	bl OverlayManager_new
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xc
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021E7560: .word _021E7BE8
_021E7564: .word _02103A1C
	thumb_func_end ov68_021E74D8

	thumb_func_start ov68_021E7568
ov68_021E7568: ; 0x021E7568
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl OverlayManager_run
	cmp r0, #0
	beq _021E75B6
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl OverlayManager_delete
	add r0, r4, #0
	bl ov68_021E5A58
	ldr r1, [r4]
	add r0, r4, #0
	ldrh r1, [r1, #0x14]
	bl ov68_021E7A18
	ldr r1, [r4]
	add r0, r4, #0
	ldrh r1, [r1, #0x14]
	mov r2, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov68_021E73A4
	ldr r0, _021E75BC ; =0x00000186
	ldr r1, [r4]
	ldrb r2, [r4, r0]
	add r0, #0x2a
	strb r2, [r1, #0x1b]
	mov r1, #7
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
_021E75B6:
	mov r0, #0xc
	pop {r4, pc}
	nop
_021E75BC: .word 0x00000186
	thumb_func_end ov68_021E7568

	thumb_func_start ov68_021E75C0
ov68_021E75C0: ; 0x021E75C0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x42
	str r0, [sp, #8]
	ldr r0, _021E75F8 ; =ov68_021E7CF0
	ldr r1, _021E75FC ; =ov68_021E7D64
	ldr r2, _021E7600 ; =ov68_021E7C08
	add r3, r4, #0
	bl sub_02019BA4
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov68_021E7898
	add r0, r4, #0
	bl ov68_021E7910
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E75F8: .word ov68_021E7CF0
_021E75FC: .word ov68_021E7D64
_021E7600: .word ov68_021E7C08
	thumb_func_end ov68_021E75C0

	thumb_func_start ov68_021E7604
ov68_021E7604: ; 0x021E7604
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r3, _021E7610 ; =sub_02019BDC
	ldr r0, [r0, r1]
	bx r3
	nop
_021E7610: .word sub_02019BDC
	thumb_func_end ov68_021E7604

	thumb_func_start ov68_021E7614
ov68_021E7614: ; 0x021E7614
	bx lr
	.balign 4, 0
	thumb_func_end ov68_021E7614

	thumb_func_start ov68_021E7618
ov68_021E7618: ; 0x021E7618
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	add r6, r2, #0
	bl ov68_021E7898
	add r0, r5, #0
	mov r1, #5
	bl ov68_021E7A18
	cmp r4, #3
	bgt _021E766A
	ldr r0, _021E7738 ; =0x000005DD
	bl PlaySE
	ldr r0, [r5]
	strh r4, [r0, #0x14]
	ldr r0, [r5]
	ldrh r1, [r0, #0x16]
	ldrh r0, [r0, #0x14]
	add r1, r1, r0
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	bge _021E765E
	add r0, r5, #0
	bl ov68_021E6BEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov68_021E68D4
	b _021E7728
_021E765E:
	mov r1, #1
	add r0, r5, #0
	mvn r1, r1
	bl ov68_021E68D4
	b _021E7728
_021E766A:
	cmp r4, #6
	bne _021E7722
	cmp r6, #3
	bne _021E76C2
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	add r1, r0, #4
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	bge _021E76C2
	ldr r0, _021E7738 ; =0x000005DD
	bl PlaySE
	mov r0, #0x72
	lsl r0, r0, #2
	mov r4, #3
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_02019F7C
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	add r0, r0, #1
	strh r0, [r1, #0x16]
	add r0, r5, #0
	bl ov68_021E67E0
	add r0, r5, #0
	bl ov68_021E6BEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov68_021E68D4
	add r0, r5, #0
	bl ov68_021E7910
	add r0, r5, #0
	mov r1, #1
	bl ov68_021E797C
	b _021E7728
_021E76C2:
	cmp r6, #0
	bne _021E7710
	ldr r0, [r5]
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	beq _021E7700
	ldr r0, _021E7738 ; =0x000005DD
	bl PlaySE
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	sub r0, r0, #1
	strh r0, [r1, #0x16]
	add r0, r5, #0
	bl ov68_021E67E0
	add r0, r5, #0
	bl ov68_021E6BEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov68_021E68D4
	add r0, r5, #0
	bl ov68_021E7910
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov68_021E797C
_021E7700:
	mov r0, #0x72
	lsl r0, r0, #2
	mov r4, #0
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_02019F7C
	b _021E7728
_021E7710:
	ldr r0, _021E7738 ; =0x000005DD
	bl PlaySE
	mov r1, #1
	add r0, r5, #0
	mvn r1, r1
	bl ov68_021E68D4
	b _021E7728
_021E7722:
	ldr r0, _021E7738 ; =0x000005DD
	bl PlaySE
_021E7728:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #3
	bl ov68_021E73A4
	pop {r4, r5, r6, pc}
	nop
_021E7738: .word 0x000005DD
	thumb_func_end ov68_021E7618

	thumb_func_start ov68_021E773C
ov68_021E773C: ; 0x021E773C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #3
	bgt _021E7792
	ldr r1, [r5]
	strh r4, [r1, #0x14]
	ldr r2, [r5]
	ldrh r1, [r2, #0x16]
	ldrh r2, [r2, #0x14]
	add r3, r1, r2
	mov r2, #0x6e
	lsl r2, r2, #2
	ldrb r2, [r5, r2]
	cmp r3, r2
	bge _021E7778
	bl ov68_021E7A18
	add r0, r5, #0
	mov r1, #1
	bl ov68_021E7898
	add r0, r5, #0
	bl ov68_021E6BEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov68_021E68D4
	b _021E7884
_021E7778:
	mov r1, #5
	bl ov68_021E7A18
	add r0, r5, #0
	mov r1, #0
	bl ov68_021E7898
	mov r1, #1
	add r0, r5, #0
	mvn r1, r1
	bl ov68_021E68D4
	b _021E7884
_021E7792:
	cmp r4, #4
	bne _021E77E8
	ldr r0, _021E7894 ; =0x000005DD
	bl PlaySE
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	ldrh r4, [r1, #0x14]
	add r0, r0, #1
	strh r0, [r1, #0x16]
	add r0, r5, #0
	bl ov68_021E6BEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov68_021E68D4
	add r0, r5, #0
	bl ov68_021E67E0
	add r0, r5, #0
	mov r1, #5
	bl ov68_021E7A18
	add r0, r5, #0
	mov r1, #0
	bl ov68_021E7898
	add r0, r5, #0
	bl ov68_021E7910
	add r0, r5, #0
	mov r1, #1
	bl ov68_021E797C
	mov r0, #0x72
	lsl r0, r0, #2
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl sub_02019F7C
	b _021E7884
_021E77E8:
	cmp r4, #5
	bne _021E7840
	ldr r0, _021E7894 ; =0x000005DD
	bl PlaySE
	ldr r1, [r5]
	ldrh r0, [r1, #0x16]
	ldrh r4, [r1, #0x14]
	sub r0, r0, #1
	strh r0, [r1, #0x16]
	add r0, r5, #0
	bl ov68_021E6BEC
	add r1, r0, #0
	add r0, r5, #0
	bl ov68_021E68D4
	add r0, r5, #0
	bl ov68_021E67E0
	add r0, r5, #0
	mov r1, #5
	bl ov68_021E7A18
	add r0, r5, #0
	mov r1, #0
	bl ov68_021E7898
	add r0, r5, #0
	bl ov68_021E7910
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov68_021E797C
	mov r0, #0x72
	lsl r0, r0, #2
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl sub_02019F7C
	b _021E7884
_021E7840:
	cmp r4, #6
	bne _021E786E
	mov r1, #5
	bl ov68_021E7A18
	add r0, r5, #0
	mov r1, #0
	bl ov68_021E7898
	mov r0, #0x73
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	cmp r1, #6
	beq _021E7884
	ldr r1, [r5]
	sub r0, r0, #4
	ldrh r4, [r1, #0x14]
	ldr r0, [r5, r0]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	bl sub_02019F7C
	b _021E7884
_021E786E:
	cmp r4, #7
	bne _021E7884
	ldr r0, [r5]
	ldrh r4, [r0, #0x14]
	mov r0, #0x72
	lsl r0, r0, #2
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl sub_02019F7C
_021E7884:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #3
	bl ov68_021E73A4
	pop {r3, r4, r5, pc}
	nop
_021E7894: .word 0x000005DD
	thumb_func_end ov68_021E773C

	thumb_func_start ov68_021E7898
ov68_021E7898: ; 0x021E7898
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	cmp r1, #1
	bne _021E78D6
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl sub_02019FF8
	add r0, r4, #0
	add r0, #0x88
	bl ScheduleWindowCopyToVram
	mov r0, #4
	str r0, [sp]
	mov r3, #8
	str r3, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0x14
	bl ov68_021E66A0
	ldr r0, _021E790C ; =0x000001CE
	mov r1, #1
	add sp, #0xc
	strh r1, [r4, r0]
	pop {r3, r4, pc}
_021E78D6:
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl sub_02019FD0
	add r0, r4, #0
	add r0, #0x88
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0x14
	mov r3, #8
	bl ov68_021E66A0
	mov r1, #0
	ldr r0, _021E790C ; =0x000001CE
	strh r1, [r4, r0]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021E790C: .word 0x000001CE
	thumb_func_end ov68_021E7898

	thumb_func_start ov68_021E7910
ov68_021E7910: ; 0x021E7910
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #4
	bhs _021E7936
	add r0, #0x10
	ldr r0, [r4, r0]
	mov r1, #4
	bl sub_02019FD0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl sub_02019FD0
	pop {r4, pc}
_021E7936:
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	cmp r1, #0
	bne _021E794A
	add r0, #0x10
	ldr r0, [r4, r0]
	mov r1, #5
	bl sub_02019FD0
	b _021E7954
_021E794A:
	add r0, #0x10
	ldr r0, [r4, r0]
	mov r1, #5
	bl sub_02019FF8
_021E7954:
	ldr r0, [r4]
	ldrh r0, [r0, #0x16]
	add r2, r0, #4
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r2, r1
	blt _021E7970
	add r0, #0x10
	ldr r0, [r4, r0]
	mov r1, #4
	bl sub_02019FD0
	pop {r4, pc}
_021E7970:
	add r0, #0x10
	ldr r0, [r4, r0]
	mov r1, #4
	bl sub_02019FF8
	pop {r4, pc}
	thumb_func_end ov68_021E7910

	thumb_func_start ov68_021E797C
ov68_021E797C: ; 0x021E797C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DC78
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DC78
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCC0
	cmp r4, #0
	ldr r0, [r5]
	ble _021E79EA
	ldrh r0, [r0, #0x16]
	add r2, r0, #4
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	cmp r2, r1
	bge _021E79D2
	sub r0, #0x94
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DC4C
	b _021E79DC
_021E79D2:
	sub r0, #0x94
	ldr r0, [r5, r0]
	mov r1, #3
	bl sub_0200DC4C
_021E79DC:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	bl sub_0200DC4C
	pop {r3, r4, r5, pc}
_021E79EA:
	ldrh r0, [r0, #0x16]
	cmp r0, #0
	bne _021E79FE
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #7
	bl sub_0200DC4C
	b _021E7A0A
_021E79FE:
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	bl sub_0200DC4C
_021E7A0A:
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DC4C
	pop {r3, r4, r5, pc}
	thumb_func_end ov68_021E797C

	thumb_func_start ov68_021E7A18
ov68_021E7A18: ; 0x021E7A18
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	mov r6, #0
	mov r4, #4
_021E7A24:
	cmp r6, r7
	bne _021E7A44
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #8
	lsl r2, r4, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl ov68_021E66A0
	b _021E7A82
_021E7A44:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r6, r0
	blo _021E7A6A
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #4
	lsl r2, r4, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl ov68_021E66A0
	b _021E7A82
_021E7A6A:
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	lsl r2, r4, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x18
	mov r3, #0x10
	bl ov68_021E66A0
_021E7A82:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blo _021E7A24
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov68_021E7A18

	thumb_func_start ov68_021E7A90
ov68_021E7A90: ; 0x021E7A90
	mov r2, #0x1d
	lsl r2, r2, #4
	add r2, r0, r2
	mov r0, #0x18
	strb r0, [r2]
	mov r0, #0x14
	strb r0, [r2, #1]
	mov r0, #8
	strb r0, [r2, #2]
	mov r0, #4
	strb r0, [r2, #3]
	mov r0, #0
	strh r0, [r2, #4]
	strh r0, [r2, #6]
	str r1, [r2, #8]
	mov r0, #0xd
	bx lr
	.balign 4, 0
	thumb_func_end ov68_021E7A90

	thumb_func_start ov68_021E7AB4
ov68_021E7AB4: ; 0x021E7AB4
	mov r2, #0x1d
	lsl r2, r2, #4
	add r2, r0, r2
	mov r0, #0xf
	strb r0, [r2]
	mov r0, #0x14
	strb r0, [r2, #1]
	mov r0, #8
	strb r0, [r2, #2]
	mov r0, #4
	strb r0, [r2, #3]
	mov r0, #0
	strh r0, [r2, #4]
	strh r0, [r2, #6]
	str r1, [r2, #8]
	mov r0, #0xd
	bx lr
	.balign 4, 0
	thumb_func_end ov68_021E7AB4

	thumb_func_start ov68_021E7AD8
ov68_021E7AD8: ; 0x021E7AD8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x1d
	lsl r0, r0, #4
	add r4, r5, r0
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _021E7AF4
	cmp r0, #1
	beq _021E7B1A
	cmp r0, #2
	beq _021E7B52
	b _021E7B64
_021E7AF4:
	ldrb r0, [r4, #2]
	mov r1, #7
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r5, #4]
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	ldrh r0, [r4, #6]
	add r0, r0, #1
	strh r0, [r4, #6]
	b _021E7B64
_021E7B1A:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #4
	bne _021E7B64
	ldrb r0, [r4, #2]
	mov r1, #7
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r5, #4]
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #4]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0
	strh r0, [r4, #4]
	ldrh r0, [r4, #6]
	add r0, r0, #1
	strh r0, [r4, #6]
	b _021E7B64
_021E7B52:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #2
	bne _021E7B64
	add sp, #0xc
	ldr r0, [r4, #8]
	pop {r4, r5, pc}
_021E7B64:
	mov r0, #0xd
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov68_021E7AD8

	thumb_func_start ov68_021E7B6C
ov68_021E7B6C: ; 0x021E7B6C
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	bl ov68_021E6C14
	ldr r0, _021E7B88 ; =0x000001BA
	mov r1, #1
	strb r1, [r4, r0]
	mov r1, #3
	sub r0, #0xa
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	nop
_021E7B88: .word 0x000001BA
	thumb_func_end ov68_021E7B6C

	thumb_func_start ov68_021E7B8C
ov68_021E7B8C: ; 0x021E7B8C
	ldr r3, _021E7B90 ; =ov68_021E7B94
	bx r3
	.balign 4, 0
_021E7B90: .word ov68_021E7B94
	thumb_func_end ov68_021E7B8C

	thumb_func_start ov68_021E7B94
ov68_021E7B94: ; 0x021E7B94
	push {r4, lr}
	add r4, r0, #0
	bl ov68_021E6CD8
	cmp r0, #4
	bhs _021E7BAC
	add r0, r4, #0
	mov r1, #1
	bl ov68_021E6C14
	mov r1, #0
	b _021E7BB6
_021E7BAC:
	add r0, r4, #0
	mov r1, #4
	bl ov68_021E6C14
	mov r1, #2
_021E7BB6:
	ldr r0, _021E7BC4 ; =0x000001BA
	strb r1, [r4, r0]
	mov r1, #3
	sub r0, #0xa
	str r1, [r4, r0]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_021E7BC4: .word 0x000001BA
	thumb_func_end ov68_021E7B94

	thumb_func_start ov68_021E7BC8
ov68_021E7BC8: ; 0x021E7BC8
	push {r3, lr}
	cmp r0, #1
	ldr r0, _021E7BE4 ; =0x04001050
	bne _021E7BDC
	mov r1, #0x1e
	add r2, r1, #0
	sub r2, #0x26
	bl G2x_SetBlendBrightness_
	pop {r3, pc}
_021E7BDC:
	mov r1, #0
	strh r1, [r0]
	pop {r3, pc}
	nop
_021E7BE4: .word 0x04001050
	thumb_func_end ov68_021E7BC8

	.rodata

_021E7BE8:
	.byte 0x01, 0x04, 0x00, 0x00

ov68_021E7BEC: ; 0x021E7BEC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00

ov68_021E7BF8: ; 0x021E7BF8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov68_021E7C08: ; 0x021E7C08
	.word ov68_021E7614
	.word ov68_021E7614
	.word ov68_021E7618
	.word ov68_021E773C

ov68_021E7C18: ; 0x021E7C18
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov68_021E7C2C: ; 0x021E7C2C
	.byte 0x0B, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov68_021E7C44: ; 0x021E7C44
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov68_021E7C60: ; 0x021E7C60
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov68_021E7C7C: ; 0x021E7C7C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov68_021E7C98: ; 0x021E7C98
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov68_021E7CB4: ; 0x021E7CB4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov68_021E7CD0: ; 0x021E7CD0
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov68_021E7CF0: ; 0x021E7CF0
	.byte 0x20, 0x3F, 0x00, 0x7F, 0x40, 0x5F, 0x00, 0x7F, 0x60, 0x7F, 0x00, 0x7F, 0x80, 0x9F, 0x00, 0x7F
	.byte 0xA8, 0xBF, 0x00, 0x27, 0xA8, 0xBF, 0x28, 0x4F, 0xA6, 0xBF, 0xC0, 0xFF, 0xA6, 0xBF, 0x78, 0xB7
	.byte 0xFF, 0x00, 0x00, 0x00

ov68_021E7D14: ; 0x021E7D14
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov68_021E7D3C: ; 0x021E7D3C
	.word ov68_021E6D00

ov68_021E7D40: ; 0x021E7D40
	.word ov68_021E6D20
	.word ov68_021E6D40
	.word ov68_021E6D4C
	.word ov68_021E6D58
	.word ov68_021E6D64
	.word ov68_021E6D80
	.word ov68_021E6D9C
	.word ov68_021E6DB8
	.word ov68_021E6DD0

ov68_021E7D64: ; 0x021E7D64
	.byte 0x28, 0x34, 0x00, 0x00, 0x06, 0x01, 0x00, 0x00, 0x50, 0x3C, 0x00, 0x00
	.byte 0x00, 0x02, 0x01, 0x01, 0x28, 0x54, 0x00, 0x00, 0x01, 0x03, 0x02, 0x02, 0x50, 0x5C, 0x00, 0x00
	.byte 0x02, 0x06, 0x03, 0x03, 0x28, 0x74, 0x00, 0x00, 0x04, 0x04, 0x04, 0x04, 0x50, 0x7C, 0x00, 0x00
	.byte 0x05, 0x05, 0x05, 0x05, 0xE0, 0xA8, 0x00, 0x00, 0x03, 0x06, 0x06, 0x06, 0xE0, 0xA8, 0x00, 0x00
	.byte 0x07, 0x07, 0x07, 0x07

ov68_021E7DA4: ; 0x021E7DA4
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00

ov68_021E7DFC: ; 0x021E7DFC
	.byte 0x06, 0x11, 0x04, 0x06
	.byte 0x02, 0x0F, 0x5B, 0x00, 0x06, 0x11, 0x06, 0x06, 0x02, 0x0F, 0x67, 0x00, 0x06, 0x11, 0x08, 0x08
	.byte 0x02, 0x0F, 0x73, 0x00, 0x06, 0x1C, 0x06, 0x03, 0x02, 0x0F, 0x83, 0x00, 0x06, 0x1C, 0x08, 0x03
	.byte 0x02, 0x0F, 0x89, 0x00, 0x06, 0x11, 0x0A, 0x0F, 0x0A, 0x0F, 0x8F, 0x00, 0x04, 0x02, 0x13, 0x1B
	.byte 0x04, 0x0E, 0x25, 0x01, 0x06, 0x01, 0x00, 0x1E, 0x03, 0x0F, 0x91, 0x01, 0x06, 0x0F, 0x15, 0x08
	.byte 0x03, 0x0F, 0xEB, 0x01, 0x06, 0x18, 0x15, 0x08, 0x03, 0x0F, 0x03, 0x02, 0x06, 0x05, 0x04, 0x0A
	.byte 0x10, 0x0F, 0x1B, 0x02, 0x04, 0x17, 0x0D, 0x07, 0x04, 0x0E, 0xBB, 0x02, 0x02, 0x01, 0x00, 0x14
	.byte 0x03, 0x0F, 0x01, 0x00, 0x02, 0x13, 0x05, 0x0A, 0x10, 0x0F, 0x3D, 0x00, 0x02, 0x02, 0x05, 0x09
	.byte 0x08, 0x0F, 0xDD, 0x00

ov68_021E7E74: ; 0x021E7E74
	.byte 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00
	.byte 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00
	.byte 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xEC, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xA8, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xAB, 0xB8, 0x00, 0x00, 0xA9, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x48, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xAC, 0xB8, 0x00, 0x00
	.byte 0xA9, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xAD, 0xB8, 0x00, 0x00, 0xA9, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xAE, 0xB8, 0x00, 0x00, 0xA9, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x86, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xAF, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x86, 0x00, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB0, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x86, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xB1, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x86, 0x00, 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xB2, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00, 0xAA, 0xB8, 0x00, 0x00
	.byte 0xAA, 0xB8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	; 0x021E80E4
