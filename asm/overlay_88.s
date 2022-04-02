	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov88_02258800
ov88_02258800: ; 0x02258800
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	mov r2, #5
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x72
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0x27
	add r0, r4, #0
	lsl r1, r1, #4
	mov r2, #0x72
	bl OverlayManager_CreateAndGetData
	mov r2, #0x27
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl memset
	ldr r0, [r5]
	mov r1, #0x72
	str r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	add r0, r4, #0
	add r0, #8
	bl ov88_02258ABC
	mov r0, #0x53
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #8
	mov r2, #0x72
	bl ov88_02258D64
	ldr r0, [r4, #4]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r2, #0x72
	str r0, [sp, #4]
	str r2, [sp, #8]
	add r0, r2, #0
	add r0, #0xe2
	add r2, #0xda
	ldr r3, [r4]
	add r0, r4, r0
	add r1, #8
	add r2, r4, r2
	bl ov88_02258EA8
	ldr r0, [r5, #8]
	add r1, r4, #0
	str r0, [sp]
	mov r2, #0x72
	str r2, [sp, #4]
	add r0, r2, #0
	add r0, #0xee
	add r2, #0xda
	ldr r3, [r4]
	add r0, r4, r0
	add r1, #8
	add r2, r4, r2
	bl ov88_022590C0
	mov r0, #0x59
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #8
	mov r2, #0x72
	bl ov88_022592EC
	mov r0, #2
	lsl r0, r0, #8
	add r1, r4, #0
	add r0, r4, r0
	add r1, #8
	mov r2, #0x72
	bl ov88_0225967C
	ldr r0, _022588C0 ; =ov88_02258A64
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_022588C0: .word ov88_02258A64
	thumb_func_end ov88_02258800

	thumb_func_start ov88_022588C4
ov88_022588C4: ; 0x022588C4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bls _022588E2
	b _022589EA
_022588E2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022588EE: ; jump table
	.short _022588F8 - _022588EE - 2 ; case 0
	.short _0225891E - _022588EE - 2 ; case 1
	.short _0225892E - _022588EE - 2 ; case 2
	.short _022589BC - _022588EE - 2 ; case 3
	.short _022589DC - _022588EE - 2 ; case 4
_022588F8:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x72
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r6, #8]
	mov r1, #1
	bl ov45_0222A520
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022589EA
_0225891E:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022589EA
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022589EA
_0225892E:
	ldr r0, _022589F8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	bne _0225894A
	ldr r0, [r6, #8]
	bl ov45_0222A330
	cmp r0, #1
	beq _0225894A
	bl ov45_0222D844
	cmp r0, #1
	bne _02258960
_0225894A:
	ldr r0, [r6, #8]
	bl ov45_0222A330
	cmp r0, #1
	bne _0225895A
	ldr r0, [r6, #8]
	bl ov45_0222A4A8
_0225895A:
	mov r0, #3
	str r0, [r5]
	b _022589EA
_02258960:
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r4, r0
	bl ov88_02258EFC
	cmp r0, #1
	bne _0225897E
	mov r0, #2
	lsl r0, r0, #8
	add r0, r4, r0
	mov r1, #1
	bl ov88_02259818
_0225897E:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r1, [r4]
	add r0, r4, r0
	bl ov88_022590D8
	cmp r0, #1
	bne _0225899A
	mov r0, #2
	lsl r0, r0, #8
	add r0, r4, r0
	mov r1, #2
	bl ov88_02259818
_0225899A:
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r1, [r4]
	ldr r2, [r6, #8]
	add r0, r4, r0
	mov r3, #0x72
	bl ov88_02259404
	cmp r0, #1
	bne _022589EA
	mov r0, #2
	lsl r0, r0, #8
	add r0, r4, r0
	mov r1, #3
	bl ov88_02259818
	b _022589EA
_022589BC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x72
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _022589EA
_022589DC:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022589EA
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_022589EA:
	ldr r1, [r6, #8]
	add r0, r4, #0
	bl ov88_02258A70
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022589F8: .word gSystem
	thumb_func_end ov88_022588C4

	thumb_func_start ov88_022589FC
ov88_022589FC: ; 0x022589FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	mov r0, #2
	lsl r0, r0, #8
	add r0, r4, r0
	bl ov88_022597DC
	mov r0, #0x55
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov88_02258EF8
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov88_022590D4
	mov r0, #0x59
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov88_022593D0
	mov r0, #0x53
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov88_02258D84
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r4, #8
	add r0, r4, #0
	bl ov88_02258AF4
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x72
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov88_022589FC

	thumb_func_start ov88_02258A64
ov88_02258A64: ; 0x02258A64
	ldr r3, _02258A6C ; =ov88_02258B20
	add r0, #8
	bx r3
	nop
_02258A6C: .word ov88_02258B20
	thumb_func_end ov88_02258A64

	thumb_func_start ov88_02258A70
ov88_02258A70: ; 0x02258A70
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x55
	add r5, r0, #0
	lsl r1, r1, #2
	add r0, r5, r1
	sub r1, #8
	add r2, r5, #0
	add r1, r5, r1
	add r2, #8
	bl ov88_02258F60
	mov r1, #0x16
	str r4, [sp]
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x14
	add r2, r5, #0
	ldr r3, [r5]
	add r1, r5, r1
	add r2, #8
	bl ov88_02259104
	mov r0, #0x59
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov88_022594E0
	mov r0, #2
	lsl r0, r0, #8
	add r0, r5, r0
	bl ov88_02259800
	add r5, #8
	add r0, r5, #0
	bl ov88_02258B14
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02258A70

	thumb_func_start ov88_02258ABC
ov88_02258ABC: ; 0x02258ABC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xc6
	add r4, r1, #0
	bl NARC_ctor
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0x30
	add r1, r4, #0
	bl GF_CreateVramTransferManager
	ldr r0, _02258AF0 ; =ov88_02259958
	bl GX_SetBanks
	add r0, r5, #0
	add r1, r4, #0
	bl ov88_02258B34
	add r0, r5, #0
	add r1, r4, #0
	bl ov88_02258C98
	pop {r3, r4, r5, pc}
	nop
_02258AF0: .word ov88_02259958
	thumb_func_end ov88_02258ABC

	thumb_func_start ov88_02258AF4
ov88_02258AF4: ; 0x02258AF4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl NARC_dtor
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov88_02258C60
	add r0, r4, #0
	bl ov88_02258D38
	pop {r4, pc}
	thumb_func_end ov88_02258AF4

	thumb_func_start ov88_02258B14
ov88_02258B14: ; 0x02258B14
	ldr r3, _02258B1C ; =sub_0202457C
	ldr r0, [r0, #4]
	bx r3
	nop
_02258B1C: .word sub_0202457C
	thumb_func_end ov88_02258B14

	thumb_func_start ov88_02258B20
ov88_02258B20: ; 0x02258B20
	push {r3, lr}
	ldr r0, [r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	bl GF_RunVramTransferTasks
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov88_02258B20

	thumb_func_start ov88_02258B34
ov88_02258B34: ; 0x02258B34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, _02258C50 ; =ov88_02259934
	add r7, r1, #0
	bl SetBothScreensModesAndDisable
	add r0, r7, #0
	bl BgConfig_Alloc
	str r0, [r5]
	ldr r0, _02258C54 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0
	ldr r6, _02258C58 ; =ov88_022599C0
	ldr r4, _02258C5C ; =ov88_02259944
	str r0, [sp, #0x10]
_02258B5C:
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
	ldr r0, [sp, #0x10]
	add r6, #0x1c
	add r0, r0, #1
	add r4, r4, #4
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _02258B5C
	mov r1, #0
	str r1, [sp]
	mov r0, #5
	str r7, [sp, #4]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #5
	mov r0, #0
	lsl r1, r1, #6
	add r2, r7, #0
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #5
	str r7, [sp, #0xc]
	lsl r0, r0, #6
	mov r1, #1
	ldr r0, [r5, r0]
	ldr r2, [r5]
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #5
	str r7, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #3
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #5
	str r7, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #4
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	mov r0, #5
	str r7, [sp, #4]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r2, #4
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #5
	str r7, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #2
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #5
	str r7, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r2, [r5]
	mov r1, #6
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02258C50: .word ov88_02259934
_02258C54: .word gSystem + 0x60
_02258C58: .word ov88_022599C0
_02258C5C: .word ov88_02259944
	thumb_func_end ov88_02258B34

	thumb_func_start ov88_02258C60
ov88_02258C60: ; 0x02258C60
	push {r4, r5, r6, lr}
	ldr r5, _02258C90 ; =ov88_02259944
	add r6, r0, #0
	mov r4, #0
_02258C68:
	ldr r1, [r5]
	ldr r0, [r6]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _02258C68
	ldr r0, [r6]
	bl FreeToHeap
	ldr r0, _02258C94 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	pop {r4, r5, r6, pc}
	nop
_02258C90: .word ov88_02259944
_02258C94: .word gSystem + 0x60
	thumb_func_end ov88_02258C60

	thumb_func_start ov88_02258C98
ov88_02258C98: ; 0x02258C98
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
	ldr r0, _02258D30 ; =ov88_02259914
	ldr r1, _02258D34 ; =0x00200010
	mov r2, #0x10
	bl sub_020215C0
	mov r0, #0x20
	add r1, r6, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	ldr r1, _02258D34 ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	add r1, r5, #0
	mov r0, #0x20
	add r1, #8
	add r2, r6, #0
	bl G2dRenderer_Init
	str r0, [r5, #4]
	add r0, r5, #0
	mov r2, #1
	add r0, #8
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0x13
	mov r4, #0
	lsl r7, r7, #4
_02258D04:
	mov r0, #0x20
	add r1, r4, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02258D04
	bl sub_0203A880
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02258D30: .word ov88_02259914
_02258D34: .word 0x00200010
	thumb_func_end ov88_02258C98

	thumb_func_start ov88_02258D38
ov88_02258D38: ; 0x02258D38
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl sub_02024504
	mov r6, #0x13
	mov r4, #0
	lsl r6, r6, #4
_02258D48:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02258D48
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	pop {r4, r5, r6, pc}
	thumb_func_end ov88_02258D38

	thumb_func_start ov88_02258D64
ov88_02258D64: ; 0x02258D64
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #5
	str r2, [sp]
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	mov r1, #5
	mov r2, #0
	add r3, r4, #4
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r4]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov88_02258D64

	thumb_func_start ov88_02258D84
ov88_02258D84: ; 0x02258D84
	ldr r3, _02258D8C ; =FreeToHeap
	ldr r0, [r0]
	bx r3
	nop
_02258D8C: .word FreeToHeap
	thumb_func_end ov88_02258D84

	thumb_func_start ov88_02258D90
ov88_02258D90: ; 0x02258D90
	push {r3, r4, lr}
	sub sp, #0x1c
	ldr r0, [r0, #4]
	add r4, r1, #0
	mov r1, #1
	str r1, [sp]
	mov r1, #2
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	add r1, r2, #6
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	add r2, r3, #5
	lsl r2, r2, #0x18
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	add r3, sp, #0x18
	mov r1, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldrb r3, [r3, #0x10]
	ldr r0, [r4]
	lsr r2, r2, #0x18
	lsl r3, r3, #1
	add r3, r3, #4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	ldr r0, [r4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, pc}
	thumb_func_end ov88_02258D90

	thumb_func_start ov88_02258DE8
ov88_02258DE8: ; 0x02258DE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x38]
	mov r1, #3
	add r7, r2, #0
	add r6, r3, #0
	bl _u32_div_f
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x38]
	mov r1, #3
	bl _u32_div_f
	ldr r1, [sp, #0x44]
	cmp r1, #0
	beq _02258E0E
	add r0, r0, #2
_02258E0E:
	ldr r1, [sp, #0x3c]
	cmp r1, #1
	bne _02258E16
	add r0, r0, #1
_02258E16:
	ldr r1, [r4, #4]
	lsl r2, r6, #1
	add r6, r2, #4
	mov r2, #2
	str r2, [sp]
	str r2, [sp, #4]
	add r2, r1, #0
	add r2, #0xc
	str r2, [sp, #8]
	ldr r2, [sp, #0x1c]
	lsl r0, r0, #0x19
	lsl r2, r2, #0x19
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	ldrh r0, [r1]
	lsl r4, r7, #1
	add r4, #0x15
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r1, #2]
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	mov r1, #3
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	ldr r0, [sp, #0x48]
	cmp r0, #0
	beq _02258E7C
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r5]
	mov r1, #3
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	b _02258E9A
_02258E7C:
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _02258E9A
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #3
	str r1, [sp, #8]
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r5]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
_02258E9A:
	ldr r0, [r5]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov88_02258DE8

	thumb_func_start ov88_02258EA8
ov88_02258EA8: ; 0x02258EA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x1c]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov45_0222AD4C
	mov r1, #0
	strb r1, [r5]
	mov r1, #0x3c
	str r0, [sp]
	bl _u32_div_f
	add r0, r0, #1
	strb r0, [r5, #1]
	mov r0, #0
	strb r0, [r5, #2]
	ldr r0, [sp]
	mov r1, #0x28
	bl _u32_div_f
	str r0, [r5, #8]
	mov r0, #1
	strb r0, [r5, #4]
	mov r0, #0
	strh r0, [r5, #6]
	strb r0, [r5, #5]
	ldr r2, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, #0
	bl ov88_02258EFC
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov88_02258F60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov88_02258EA8

	thumb_func_start ov88_02258EF8
ov88_02258EF8: ; 0x02258EF8
	bx lr
	.balign 4, 0
	thumb_func_end ov88_02258EF8

	thumb_func_start ov88_02258EFC
ov88_02258EFC: ; 0x02258EFC
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, sp, #8
	add r6, r2, #0
	mov r4, #0
	bl ov45_0222DCF4
	cmp r0, #0
	bne _02258F18
	add sp, #0xc
	add r0, r4, #0
	pop {r3, r4, r5, r6, pc}
_02258F18:
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _02258F26
	add r0, r4, #0
	strb r0, [r5, #4]
	mov r4, #1
	strb r4, [r5, #5]
_02258F26:
	add r0, r6, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov45_0222D594
	add r0, sp, #4
	add r1, r5, #0
	add r2, sp, #0
	bl ov45_0222D594
	add r0, sp, #0
	ldrb r2, [r0, #2]
	ldr r1, [r5, #8]
	cmp r2, r1
	bhs _02258F50
	ldrb r1, [r0, #1]
	cmp r1, #0
	bne _02258F50
	ldrb r0, [r0]
	cmp r0, #0
	beq _02258F58
_02258F50:
	mov r4, #1
	strb r4, [r5, #5]
	ldr r0, [sp, #4]
	str r0, [r5]
_02258F58:
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov88_02258EFC

	thumb_func_start ov88_02258F60
ov88_02258F60: ; 0x02258F60
	push {r3, lr}
	ldrb r3, [r0, #4]
	cmp r3, #1
	bne _02258F6E
	bl ov88_02258F74
	pop {r3, pc}
_02258F6E:
	bl ov88_02258F88
	pop {r3, pc}
	thumb_func_end ov88_02258F60

	thumb_func_start ov88_02258F74
ov88_02258F74: ; 0x02258F74
	ldrh r1, [r0, #6]
	add r1, r1, #1
	strh r1, [r0, #6]
	ldrh r1, [r0, #6]
	cmp r1, #0x10
	bls _02258F84
	mov r1, #0
	strh r1, [r0, #6]
_02258F84:
	bx lr
	.balign 4, 0
	thumb_func_end ov88_02258F74

	thumb_func_start ov88_02258F88
ov88_02258F88: ; 0x02258F88
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	ldrb r1, [r4, #1]
	mov r0, #0x3c
	ldrb r2, [r4, #2]
	mul r0, r1
	ldrb r1, [r4]
	add r2, r2, r0
	mov r0, #0xe1
	lsl r0, r0, #4
	mul r0, r1
	ldr r1, [r4, #8]
	add r0, r2, r0
	bl _u32_div_f
	ldrb r1, [r4, #5]
	add r5, r0, #0
	cmp r1, #0
	beq _02259036
	mov r2, #0
	strh r2, [r4, #6]
	strb r2, [r4, #5]
	mov r0, #4
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	str r2, [sp, #0xc]
	ldr r0, [r0]
	mov r1, #3
	mov r3, #5
	bl FillBgTilemapRect
	ldr r0, [sp, #0x14]
	mov r1, #3
	ldr r0, [r0]
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0
	str r0, [sp, #0x1c]
_02258FE2:
	ldr r0, [sp, #0x1c]
	mov r1, #3
	sub r6, r1, r0
	mov r0, #0xa
	add r7, r6, #0
	mul r7, r0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	mov r4, #0
	str r0, [sp, #0x20]
_02258FF6:
	mov r0, #9
	sub r3, r0, r4
	add r0, r3, r7
	cmp r0, r5
	blo _02259022
	cmp r0, r5
	bne _02259008
	mov r2, #1
	b _02259012
_02259008:
	cmp r6, #3
	bne _02259010
	mov r2, #2
	b _02259012
_02259010:
	mov r2, #0
_02259012:
	ldr r0, [sp, #0x20]
	lsl r3, r3, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r3, r3, #0x18
	bl ov88_02258D90
_02259022:
	add r4, r4, #1
	cmp r4, #0xa
	blt _02258FF6
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #4
	blt _02258FE2
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02259036:
	cmp r5, #0x28
	bhs _022590B8
	ldrh r1, [r4, #6]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrh r6, [r4, #6]
	mov r1, #0x1b
	lsr r3, r6, #0x1f
	lsl r2, r6, #0x1b
	sub r2, r2, r3
	ror r2, r1
	mov r1, #0xa
	add r7, r3, r2
	bl _u32_div_f
	str r1, [sp, #0x18]
	add r0, r5, #0
	mov r1, #0xa
	bl _u32_div_f
	cmp r7, #0
	bne _0225909E
	ldr r2, [r4, #8]
	mov r1, #0x1e
	mul r1, r2
	lsr r4, r1, #2
	mov r2, #6
	mov r5, #0
_0225906E:
	add r1, r5, #1
	add r3, r4, #0
	mul r3, r1
	cmp r3, r6
	bls _02259080
	ldr r1, _022590BC ; =ov88_02259924
	lsl r2, r5, #2
	ldr r2, [r1, r2]
	b _02259086
_02259080:
	add r5, r1, #0
	cmp r1, #4
	blt _0225906E
_02259086:
	lsl r0, r0, #0x18
	ldr r3, [sp, #0x18]
	lsr r0, r0, #0x18
	str r0, [sp]
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	lsr r3, r3, #0x18
	bl ov88_02258D90
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0225909E:
	cmp r7, #0x10
	bne _022590B8
	lsl r0, r0, #0x18
	ldr r3, [sp, #0x18]
	lsr r0, r0, #0x18
	str r0, [sp]
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, #3
	lsr r3, r3, #0x18
	bl ov88_02258D90
_022590B8:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022590BC: .word ov88_02259924
	thumb_func_end ov88_02258F88

	thumb_func_start ov88_022590C0
ov88_022590C0: ; 0x022590C0
	push {r3, lr}
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #8]
	bl ov88_0225918C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov88_022590C0

	thumb_func_start ov88_022590D4
ov88_022590D4: ; 0x022590D4
	bx lr
	.balign 4, 0
	thumb_func_end ov88_022590D4

	thumb_func_start ov88_022590D8
ov88_022590D8: ; 0x022590D8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r5, #0
	bl ov45_0222DD38
	cmp r0, #0
	beq _022590FE
	cmp r0, #1
	beq _022590F2
	cmp r0, #2
	beq _022590F8
	b _022590FE
_022590F2:
	mov r5, #1
	strh r5, [r4, #2]
	b _022590FE
_022590F8:
	mov r0, #3
	strh r0, [r4, #2]
	mov r5, #1
_022590FE:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov88_022590D8

	thumb_func_start ov88_02259104
ov88_02259104: ; 0x02259104
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #4
	bhi _02259186
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225911C: ; jump table
	.short _02259186 - _0225911C - 2 ; case 0
	.short _02259126 - _0225911C - 2 ; case 1
	.short _02259132 - _0225911C - 2 ; case 2
	.short _02259158 - _0225911C - 2 ; case 3
	.short _02259164 - _0225911C - 2 ; case 4
_02259126:
	mov r0, #2
	strh r0, [r4, #2]
	mov r0, #0
	add sp, #4
	strh r0, [r4]
	pop {r3, r4, pc}
_02259132:
	mov r0, #0
	ldrsh r0, [r4, r0]
	str r0, [sp]
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #0x10]
	bl ov88_02259244
	mov r0, #0
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4]
	ldrsh r1, [r4, r0]
	cmp r1, #0x20
	blt _02259186
	add sp, #4
	strh r0, [r4, #2]
	pop {r3, r4, pc}
_02259158:
	mov r0, #4
	strh r0, [r4, #2]
	mov r0, #0
	add sp, #4
	strh r0, [r4]
	pop {r3, r4, pc}
_02259164:
	mov r0, #0
	ldrsh r0, [r4, r0]
	str r0, [sp]
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #0x10]
	bl ov88_02259264
	mov r0, #0
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4]
	ldrsh r1, [r4, r0]
	cmp r1, #0x20
	blt _02259186
	strh r0, [r4, #2]
_02259186:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov88_02259104

	thumb_func_start ov88_0225918C
ov88_0225918C: ; 0x0225918C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x14]
	mov r0, #4
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #8
	add r6, r2, #0
	str r0, [sp, #8]
	mov r2, #0
	str r3, [sp, #0x1c]
	str r2, [sp, #0xc]
	add r0, r1, #0
	str r1, [sp, #0x18]
	ldr r0, [r0]
	mov r1, #3
	mov r3, #0x15
	ldr r7, [sp, #0x50]
	bl FillBgTilemapRect
	mov r5, #0
	str r5, [sp, #0x2c]
_022591BA:
	ldr r0, [sp, #0x2c]
	mov r4, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x34]
_022591C4:
	add r0, r6, #0
	add r1, r4, r5
	bl ov45_0222DCFC
	cmp r0, #0
	beq _0225922E
	add r0, r6, #0
	add r1, r4, r5
	bl ov45_0222DD08
	str r0, [sp, #0x28]
	add r0, r6, #0
	add r1, r4, r5
	bl ov45_0222DD14
	str r0, [sp, #0x24]
	add r0, r6, #0
	add r1, r4, r5
	bl ov45_0222DD20
	str r0, [sp, #0x20]
	add r0, r6, #0
	add r1, r4, r5
	bl ov45_0222DD2C
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x1c]
	add r1, r4, r5
	bl ov45_0222AB28
	cmp r7, #2
	bne _0225920E
	ldr r1, [sp, #0x30]
	cmp r1, #1
	bne _0225920E
	mov r1, #0
	b _02259210
_0225920E:
	add r1, r7, #0
_02259210:
	str r1, [sp]
	ldr r1, [sp, #0x28]
	lsl r2, r4, #0x18
	str r1, [sp, #4]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x34]
	str r1, [sp, #8]
	ldr r1, [sp, #0x20]
	lsr r2, r2, #0x18
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	bl ov88_02258DE8
_0225922E:
	add r4, r4, #1
	cmp r4, #5
	blt _022591C4
	ldr r0, [sp, #0x2c]
	add r5, r5, #5
	add r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #4
	blt _022591BA
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_0225918C

	thumb_func_start ov88_02259244
ov88_02259244: ; 0x02259244
	push {r3, r4, r5, lr}
	ldr r5, [sp, #0x10]
	mov r4, #7
	tst r4, r5
	bne _02259262
	lsr r5, r5, #3
	mov r4, #1
	tst r4, r5
	bne _0225925A
	mov r4, #2
	b _0225925C
_0225925A:
	mov r4, #0
_0225925C:
	str r4, [sp]
	bl ov88_0225918C
_02259262:
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259244

	thumb_func_start ov88_02259264
ov88_02259264: ; 0x02259264
	push {r3, r4, r5, lr}
	ldr r5, [sp, #0x10]
	mov r4, #7
	tst r4, r5
	bne _0225927E
	lsr r4, r5, #3
	mov r5, #1
	tst r4, r5
	beq _02259278
	mov r5, #0
_02259278:
	str r5, [sp]
	bl ov88_0225918C
_0225927E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259264

	thumb_func_start ov88_02259280
ov88_02259280: ; 0x02259280
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	mov r4, #0
_0225928C:
	add r0, r6, #0
	add r1, r7, #0
	add r2, r4, #0
	bl ov45_0222DDE4
	add r1, r0, #0
	cmp r1, #0x14
	beq _022592B0
	ldr r0, [sp]
	bl ov45_0222AB28
	cmp r0, #1
	bne _022592AC
	mov r0, #9
	strb r0, [r5, r4]
	b _022592B0
_022592AC:
	mov r0, #5
	strb r0, [r5, r4]
_022592B0:
	add r4, r4, #1
	cmp r4, #4
	blt _0225928C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_02259280

	thumb_func_start ov88_022592B8
ov88_022592B8: ; 0x022592B8
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	lsl r6, r2, #5
	ldr r7, [r1, #0xc]
	str r0, [sp]
	add r5, r4, #0
	add r6, #0xa
_022592C6:
	ldr r2, [sp]
	mov r0, #0xf
	ldrb r2, [r2, r4]
	add r1, r6, r5
	mov r3, #4
	lsl r2, r2, #1
	add r2, #0xe0
	add r2, r7, r2
	bl GF_CreateNewVramTransferTask
	cmp r0, #0
	bne _022592E2
	bl GF_AssertFail
_022592E2:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022592C6
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_022592B8

	thumb_func_start ov88_022592EC
ov88_022592EC: ; 0x022592EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov r7, #3
	add r5, r0, #0
	ldr r6, _022593C4 ; =_02259904
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	mov r4, #0
	str r0, [sp, #0x20]
	lsl r7, r7, #8
	add r5, #0x60
_02259304:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r2, r4, #0
	bl ov88_02259508
	ldrb r0, [r6]
	add r1, r5, #0
	mov r2, #3
	str r0, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r0, r4, #7
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	mov r3, #1
	ldr r0, [r0]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x20]
	add r4, r4, #1
	add r0, #0x20
	str r0, [sp, #0x20]
	add r7, #0x3c
	add r6, r6, #1
	add r5, #0x10
	cmp r4, #3
	blt _02259304
	mov r0, #1
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #8
	bl String_ctor
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x14]
	add r1, #0x90
	str r0, [r1]
	mov r1, #5
	ldr r0, [sp, #0x18]
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	ldr r3, [sp, #0x1c]
	mov r1, #0
	add r2, #0x98
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, [sp, #0x14]
	mov r2, #4
	add r1, #0x94
	str r0, [r1]
	ldr r1, [sp, #0x14]
	mov r0, #0
	add r1, #0x98
	ldr r1, [r1]
	mov r3, #0xfa
	ldr r1, [r1, #0xc]
	add r1, #0xee
	bl BG_LoadPlttData
	ldr r1, [sp, #0x14]
	ldr r3, _022593C8 ; =0x0000011A
	add r1, #0x98
	ldr r1, [r1]
	mov r0, #0
	ldr r1, [r1, #0xc]
	mov r2, #4
	add r1, #0xee
	bl BG_LoadPlttData
	ldr r1, [sp, #0x14]
	ldr r3, _022593CC ; =0x0000013A
	add r1, #0x98
	str r1, [sp, #0x14]
	ldr r1, [r1]
	mov r0, #0
	ldr r1, [r1, #0xc]
	mov r2, #4
	add r1, #0xee
	bl BG_LoadPlttData
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022593C4: .word _02259904
_022593C8: .word 0x0000011A
_022593CC: .word 0x0000013A
	thumb_func_end ov88_022592EC

	thumb_func_start ov88_022593D0
ov88_022593D0: ; 0x022593D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	bl String_dtor
	add r4, r5, #0
	mov r6, #0
	add r4, #0x60
_022593EC:
	add r0, r4, #0
	bl RemoveWindow
	add r0, r5, #0
	bl ov88_0225954C
	add r6, r6, #1
	add r4, #0x10
	add r5, #0x20
	cmp r6, #3
	blt _022593EC
	pop {r4, r5, r6, pc}
	thumb_func_end ov88_022593D0

	thumb_func_start ov88_02259404
ov88_02259404: ; 0x02259404
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	add r1, sp, #0x14
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl ov45_0222AB38
	mov r0, #2
	add r4, r6, #0
	ldr r7, _022594DC ; =ov88_02259910
	str r0, [sp, #0xc]
	add r4, #0x40
_02259422:
	ldrb r0, [r4]
	cmp r0, #0
	beq _02259458
	add r0, r4, #0
	bl ov88_022595E4
	cmp r0, #1
	bne _02259458
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	cmp r1, #3
	bge _02259452
	add r0, r6, #0
	add r0, #0x98
	ldr r0, [r0]
	add r3, r4, #0
	str r0, [sp]
	lsl r0, r1, #5
	ldr r1, [r4, #8]
	ldr r2, [r7, #4]
	add r0, r6, r0
	add r3, #0x1c
	bl ov88_02259560
_02259452:
	add r0, r4, #0
	bl ov88_022595DC
_02259458:
	ldr r0, [sp, #0xc]
	sub r4, #0x20
	sub r7, r7, #4
	sub r0, r0, #1
	str r0, [sp, #0xc]
	bpl _02259422
	ldrb r0, [r6]
	cmp r0, #0
	bne _022594D6
	add r0, r5, #0
	bl ov45_0222DD44
	cmp r0, #1
	bne _022594D6
	add r7, sp, #0x14
_02259476:
	add r0, r5, #0
	bl ov45_0222DD5C
	add r4, r0, #0
	ldr r0, [sp, #8]
	add r3, r6, #0
	str r0, [sp]
	add r3, #0x90
	ldr r3, [r3]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl ov45_0222DD78
	cmp r0, #1
	bne _022594C6
	ldr r3, [sp, #4]
	add r0, sp, #0x10
	add r1, r5, #0
	add r2, r4, #0
	bl ov88_02259280
	add r0, r6, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r2, #0x15
	str r0, [sp]
	add r0, r6, #0
	add r6, #0x90
	ldr r1, [r6]
	lsl r2, r2, #4
	add r3, sp, #0x10
	bl ov88_02259560
	add r0, r5, #0
	bl ov45_0222DCE8
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022594C6:
	add r0, r5, #0
	bl ov45_0222DCE8
	add r0, r5, #0
	bl ov45_0222DD44
	cmp r0, #1
	beq _02259476
_022594D6:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022594DC: .word ov88_02259910
	thumb_func_end ov88_02259404

	thumb_func_start ov88_022594E0
ov88_022594E0: ; 0x022594E0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r4, r6, #0
	mov r7, #0
	add r4, #0x60
	add r5, r6, #0
_022594EC:
	ldrb r0, [r6]
	cmp r0, #1
	bne _022594FA
	add r0, r5, #0
	add r1, r4, #0
	bl ov88_022595F8
_022594FA:
	add r7, r7, #1
	add r6, #0x20
	add r4, #0x10
	add r5, #0x20
	cmp r7, #3
	blt _022594EC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov88_022594E0

	thumb_func_start ov88_02259508
ov88_02259508: ; 0x02259508
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	strb r0, [r5]
	strh r0, [r5, #2]
	mov r0, #1
	add r4, r1, #0
	add r6, r2, #0
	lsl r0, r0, #8
	add r1, r3, #0
	bl String_ctor
	str r0, [r5, #8]
	add r0, r6, #7
	strb r0, [r5, #1]
	mov r3, #0
	add r5, #0xc
	str r3, [sp]
	mov r0, #0xb4
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #7
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	add r1, r5, #0
	mov r2, #3
	bl AddWindowParameterized
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov88_02259508

	thumb_func_start ov88_0225954C
ov88_0225954C: ; 0x0225954C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl String_dtor
	add r4, #0xc
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	thumb_func_end ov88_0225954C

	thumb_func_start ov88_02259560
ov88_02259560: ; 0x02259560
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r7, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	bl StringCopy
	mov r0, #1
	strb r0, [r5]
	mov r2, #0
	strh r2, [r5, #2]
	strh r6, [r5, #4]
	add r1, r7, #0
	bl FontID_String_GetWidth
	strh r0, [r5, #6]
	mov r0, #1
	ldrh r1, [r5, #6]
	lsl r0, r0, #8
	add r0, r1, r0
	strh r0, [r5, #6]
	mov r0, #0x5a
	ldrh r1, [r5, #6]
	lsl r0, r0, #4
	cmp r1, r0
	bls _0225959C
	bl GF_AssertFail
_0225959C:
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #8]
	add r0, #0xc
	mov r1, #1
	bl AddTextPrinterParameterized
	ldrb r0, [r4]
	ldr r1, [sp, #0x20]
	strb r0, [r5, #0x1c]
	ldrb r0, [r4, #1]
	strb r0, [r5, #0x1d]
	ldrb r0, [r4, #2]
	strb r0, [r5, #0x1e]
	ldrb r0, [r4, #3]
	strb r0, [r5, #0x1f]
	add r0, r5, #0
	ldrb r2, [r5, #1]
	add r0, #0x1c
	bl ov88_022592B8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov88_02259560

	thumb_func_start ov88_022595DC
ov88_022595DC: ; 0x022595DC
	mov r1, #0
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov88_022595DC

	thumb_func_start ov88_022595E4
ov88_022595E4: ; 0x022595E4
	ldrh r1, [r0, #2]
	mov r3, #1
	add r2, r1, #1
	ldrh r1, [r0, #4]
	cmp r2, r1
	bgt _022595F4
	strh r2, [r0, #2]
	mov r3, #0
_022595F4:
	add r0, r3, #0
	bx lr
	thumb_func_end ov88_022595E4

	thumb_func_start ov88_022595F8
ov88_022595F8: ; 0x022595F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldrh r0, [r5, #6]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	ldrh r1, [r5, #2]
	ldr r0, [sp, #0x20]
	mul r0, r1
	ldrh r1, [r5, #4]
	bl _s32_div_f
	add r4, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	cmp r4, r0
	bge _02259622
	mov r0, #0xff
	sub r7, r0, r4
	mov r6, #0
	b _02259630
_02259622:
	sub r6, r4, r0
	ldr r0, [sp, #0x20]
	mov r7, #0
	sub r4, r0, r4
	cmp r4, #0xff
	ble _02259630
	mov r4, #0xff
_02259630:
	mov r0, #0xff
	str r0, [sp]
	mov r1, #0
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	mov r0, #0x5a
	lsl r0, r0, #4
	str r0, [sp]
	mov r0, #0x10
	lsl r1, r7, #0x10
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	lsr r1, r1, #0x10
	str r1, [sp, #8]
	mov r3, #0
	lsl r1, r4, #0x10
	str r3, [sp, #0xc]
	lsr r1, r1, #0x10
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #0xf
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldr r1, [r5, #0x18]
	lsr r2, r2, #0x10
	bl BlitBitmapRect
	ldr r0, [sp, #0x1c]
	bl ScheduleWindowCopyToVram
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov88_022595F8

	thumb_func_start ov88_0225967C
ov88_0225967C: ; 0x0225967C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	mov r1, #0
	mov r2, #0x70
	str r0, [sp, #0x14]
	bl memset
	ldr r2, _022597CC ; =0x000002F5
	ldr r3, [sp, #0x1c]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [sp, #0x38]
	ldr r1, [sp, #0x1c]
	mov r0, #0x80
	bl String_ctor
	str r0, [sp, #0x34]
	mov r0, #0
	str r0, [sp, #0x3c]
	ldr r0, _022597D0 ; =ov88_02259A68
	ldr r5, _022597D4 ; =ov88_02259980
	str r0, [sp, #0x28]
	ldr r0, _022597D8 ; =_02259A60
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x20]
	add r0, #0x40
	str r0, [sp, #0x20]
_022596BC:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldrh r1, [r1]
	ldr r0, [sp, #0x20]
	ldr r2, [r2]
	bl ov88_0225983C
	ldrb r0, [r5, #1]
	ldr r1, [sp, #0x14]
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	ldrb r0, [r5, #6]
	str r0, [sp, #0xc]
	ldrh r0, [r5, #4]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	ldrb r3, [r5]
	ldr r0, [r0]
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x34]
	bl StringCountLines
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	ldrb r6, [r5, #8]
	bl StringGetLength
	ldr r1, [sp, #0x1c]
	add r0, r0, #1
	bl String_ctor
	add r4, r0, #0
	ldr r0, [sp, #0x30]
	mov r7, #0
	cmp r0, #0
	bls _0225978A
_02259720:
	ldr r1, [sp, #0x34]
	add r0, r4, #0
	add r2, r7, #0
	bl StringGetLineN
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _0225973A
	cmp r0, #1
	beq _02259740
	cmp r0, #2
	beq _02259756
	b _02259766
_0225973A:
	ldrb r0, [r5, #7]
	str r0, [sp, #0x2c]
	b _02259766
_02259740:
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	add r0, r0, #1
	ldrb r1, [r5, #7]
	lsr r0, r0, #1
	sub r0, r1, r0
	str r0, [sp, #0x2c]
	b _02259766
_02259756:
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidthMultiline
	ldrb r1, [r5, #7]
	sub r0, r1, r0
	str r0, [sp, #0x2c]
_02259766:
	str r6, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	ldr r3, [sp, #0x2c]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, #0
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x30]
	add r7, r7, #1
	add r6, #0x10
	cmp r7, r0
	blo _02259720
_0225978A:
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x28]
	add r5, #0x10
	add r0, r0, #4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	add r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r0, #0xc
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	add r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x3c]
	add r0, r0, #1
	str r0, [sp, #0x3c]
	cmp r0, #4
	blt _022596BC
	ldr r0, [sp, #0x34]
	bl String_dtor
	ldr r0, [sp, #0x38]
	bl DestroyMsgData
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022597CC: .word 0x000002F5
_022597D0: .word ov88_02259A68
_022597D4: .word ov88_02259980
_022597D8: .word _02259A60
	thumb_func_end ov88_0225967C

	thumb_func_start ov88_022597DC
ov88_022597DC: ; 0x022597DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	mov r6, #0
	add r4, #0x40
_022597E6:
	add r0, r5, #0
	bl RemoveWindow
	add r0, r4, #0
	bl ov88_0225985C
	add r6, r6, #1
	add r5, #0x10
	add r4, #0xc
	cmp r6, #4
	blt _022597E6
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov88_022597DC

	thumb_func_start ov88_02259800
ov88_02259800: ; 0x02259800
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x40
_02259808:
	add r0, r5, #0
	bl ov88_02259884
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #4
	blt _02259808
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259800

	thumb_func_start ov88_02259818
ov88_02259818: ; 0x02259818
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _02259826
	bl GF_AssertFail
_02259826:
	cmp r4, #0
	bne _0225982E
	bl GF_AssertFail
_0225982E:
	mov r0, #0xc
	add r5, #0x40
	mul r0, r4
	add r0, r5, r0
	bl ov88_02259878
	pop {r3, r4, r5, pc}
	thumb_func_end ov88_02259818

	thumb_func_start ov88_0225983C
ov88_0225983C: ; 0x0225983C
	mov r3, #0
	strb r3, [r0]
	strb r3, [r0, #1]
	strb r3, [r0, #2]
	strb r3, [r0, #3]
	strb r3, [r0, #4]
	strb r3, [r0, #5]
	strb r3, [r0, #6]
	strb r3, [r0, #7]
	strb r3, [r0, #8]
	strb r3, [r0, #9]
	strb r3, [r0, #0xa]
	strb r3, [r0, #0xb]
	strh r1, [r0, #6]
	str r2, [r0, #8]
	bx lr
	thumb_func_end ov88_0225983C

	thumb_func_start ov88_0225985C
ov88_0225985C: ; 0x0225985C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	bx lr
	thumb_func_end ov88_0225985C

	thumb_func_start ov88_02259878
ov88_02259878: ; 0x02259878
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end ov88_02259878

	thumb_func_start ov88_02259884
ov88_02259884: ; 0x02259884
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0x1c
	bls _02259894
	mov r0, #0
	strh r0, [r4]
_02259894:
	ldrh r0, [r4]
	cmp r0, #0
	beq _02259900
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _022598AA
	ldr r0, [r4, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_022598AA:
	ldrh r0, [r4, #2]
	cmp r0, #2
	bhs _022598BA
	lsl r1, r0, #4
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r3, r0, #1
	b _022598D0
_022598BA:
	cmp r0, #0xe
	bhs _022598C2
	mov r3, #0x10
	b _022598D0
_022598C2:
	sub r0, #0xe
	lsl r0, r0, #4
	mov r1, #0xe
	bl _s32_div_f
	mov r1, #0x10
	sub r3, r1, r0
_022598D0:
	mov r1, #0xe
	add r0, sp, #4
	strh r1, [r0]
	mov r0, #0x19
	lsl r3, r3, #0x18
	str r0, [sp]
	add r0, sp, #4
	add r1, r4, #4
	mov r2, #1
	lsr r3, r3, #0x18
	bl sub_02003DE8
	add r0, r4, #4
	mov r1, #2
	bl DC_FlushRange
	ldrh r1, [r4, #6]
	add r0, r4, #4
	mov r2, #2
	bl GX_LoadBGPltt
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
_02259900:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov88_02259884

	.rodata

_02259904:
	.byte 0x0F, 0x12, 0x15, 0x00, 0x50, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00

ov88_02259910: ; 0x02259910
	.byte 0xF0, 0x00, 0x00, 0x00

ov88_02259914: ; 0x02259914
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x80, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x72, 0x00, 0x00, 0x00

ov88_02259924: ; 0x02259924
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00

ov88_02259934: ; 0x02259934
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov88_02259944: ; 0x02259944
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov88_02259958: ; 0x02259958
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov88_02259980: ; 0x02259980
	.byte 0x06, 0x00, 0x14, 0x08, 0x01, 0x00, 0x0A, 0x50, 0x06, 0x01, 0x00, 0x00, 0x00, 0x04, 0x03, 0x00
	.byte 0x00, 0x06, 0x06, 0x03, 0xA1, 0x00, 0x07, 0x10, 0x04, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x0D, 0x00
	.byte 0x0F, 0x06, 0x06, 0x05, 0xB3, 0x00, 0x07, 0x18, 0x04, 0x01, 0x00, 0x00, 0x00, 0x0E, 0x0D, 0x00
	.byte 0x04, 0x0C, 0x12, 0x03, 0xD1, 0x00, 0x07, 0x04, 0x04, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x0D, 0x00

ov88_022599C0: ; 0x022599C0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_02259A60:
	.byte 0x00, 0x00, 0x18, 0x00, 0x1A, 0x00, 0x1E, 0x00

ov88_02259A68: ; 0x02259A68
	.byte 0x00, 0x00, 0x00, 0x00, 0xDD, 0x05, 0x00, 0x00
	.byte 0xE4, 0x05, 0x00, 0x00, 0xE3, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x02259A80
