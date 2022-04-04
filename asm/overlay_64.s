	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov64_021E5900
ov64_021E5900: ; 0x021E5900
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0
	bl GX_EngineASetLayers
	mov r0, #0
	bl GX_EngineBSetLayers
	ldr r0, _021E59B4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _021E59B8 ; =0x04001050
	strh r1, [r0]
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	ldr r2, _021E59BC ; =0x04000304
	ldr r0, _021E59C0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r2, #1
	mov r0, #3
	mov r1, #0x3b
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #0x1d
	add r0, r5, #0
	lsl r1, r1, #4
	mov r2, #0x3b
	bl OverlayManager_CreateAndGetData
	mov r2, #0x1d
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4]
	bl Sav2_HOF_GetNumRecords
	mov r1, #0x6e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xb4
	mov r1, #0x3b
	bl NARC_ctor
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r4, r1]
	bl ov64_021E5B00
	add r0, r4, #0
	bl ov64_021E5B10
	add r0, r4, #0
	bl ov64_021E5CD0
	add r0, r4, #0
	bl ov64_021E607C
	add r0, r4, #0
	bl ov64_021E6170
	add r0, r4, #0
	bl ov64_021E622C
	add r0, r4, #0
	mov r1, #0
	bl ov64_021E652C
	ldr r0, _021E59C4 ; =ov64_021E5A88
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E59B4: .word 0x04000050
_021E59B8: .word 0x04001050
_021E59BC: .word 0x04000304
_021E59C0: .word 0xFFFF7FFF
_021E59C4: .word ov64_021E5A88
	thumb_func_end ov64_021E5900

	thumb_func_start ov64_021E59C8
ov64_021E59C8: ; 0x021E59C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov64_021E6260
	add r0, r4, #0
	bl ov64_021E620C
	add r0, r4, #0
	bl ov64_021E6118
	add r0, r4, #0
	bl ov64_021E602C
	add r0, r4, #0
	bl ov64_021E5CA4
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl NARC_dtor
	bl sub_02021238
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x3b
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov64_021E59C8

	thumb_func_start ov64_021E5A18
ov64_021E5A18: ; 0x021E5A18
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #3
	bhi _021E5A74
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5A34: ; jump table
	.short _021E5A3C - _021E5A34 - 2 ; case 0
	.short _021E5A48 - _021E5A34 - 2 ; case 1
	.short _021E5A58 - _021E5A34 - 2 ; case 2
	.short _021E5A68 - _021E5A34 - 2 ; case 3
_021E5A3C:
	bl ov64_021E6288
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5A74
_021E5A48:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5A74
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5A74
_021E5A58:
	bl ov64_021E62C8
	cmp r0, #0
	bne _021E5A74
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E5A74
_021E5A68:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5A74
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5A74:
	add r0, r5, #0
	bl ov64_021E605C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov64_021E5A18

	thumb_func_start ov64_021E5A88
ov64_021E5A88: ; 0x021E5A88
	push {r3, lr}
	ldr r0, [r0, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl sub_0200D034
	ldr r3, _021E5AA4 ; =0x027E0000
	ldr r1, _021E5AA8 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	nop
_021E5AA4: .word 0x027E0000
_021E5AA8: .word 0x00003FF8
	thumb_func_end ov64_021E5A88

	thumb_func_start ov64_021E5AAC
ov64_021E5AAC: ; 0x021E5AAC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GX_LoadOBJ
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov64_021E5AAC

	thumb_func_start ov64_021E5AC8
ov64_021E5AC8: ; 0x021E5AC8
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GXS_LoadOBJ
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov64_021E5AC8

	thumb_func_start ov64_021E5AE4
ov64_021E5AE4: ; 0x021E5AE4
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl GX_LoadOBJPltt
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov64_021E5AE4

	thumb_func_start ov64_021E5B00
ov64_021E5B00: ; 0x021E5B00
	ldr r3, _021E5B08 ; =GX_SetBanks
	ldr r0, _021E5B0C ; =ov64_021E6FAC
	bx r3
	nop
_021E5B08: .word GX_SetBanks
_021E5B0C: .word ov64_021E6FAC
	thumb_func_end ov64_021E5B00

	thumb_func_start ov64_021E5B10
ov64_021E5B10: ; 0x021E5B10
	push {r3, r4, r5, lr}
	sub sp, #0x90
	add r5, r0, #0
	mov r0, #0x3b
	bl BgConfig_Alloc
	add r3, sp, #0x80
	ldr r4, _021E5C90 ; =ov64_021E6E88
	str r0, [r5, #4]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021E5C94 ; =ov64_021E6F50
	add r3, sp, #0x64
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0
	str r0, [r3]
	ldr r0, [r5, #4]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #4]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x3b
	bl BG_ClearCharDataRange
	ldr r4, _021E5C98 ; =ov64_021E6EFC
	add r3, sp, #0x48
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r5, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r4, _021E5C9C ; =ov64_021E6F18
	add r3, sp, #0x2c
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #4
	str r0, [r3]
	ldr r0, [r5, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #4]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x3b
	bl BG_ClearCharDataRange
	ldr r4, _021E5CA0 ; =ov64_021E6F34
	add r3, sp, #0x10
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #5
	str r0, [r3]
	ldr r0, [r5, #4]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0x61
	mov r1, #0x3b
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r2, #0x3b
	str r2, [sp, #0xc]
	ldr r2, [r5, #4]
	add r4, r0, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x3b
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3b
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #2
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3b
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	mov r1, #3
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x3b
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	add r0, r4, #0
	mov r1, #4
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3b
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #5
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add r0, r4, #0
	bl NARC_dtor
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x3b
	bl LoadFontPal0
	mov r1, #0x1e
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x3b
	bl LoadFontPal0
	add sp, #0x90
	pop {r3, r4, r5, pc}
	nop
_021E5C90: .word ov64_021E6E88
_021E5C94: .word ov64_021E6F50
_021E5C98: .word ov64_021E6EFC
_021E5C9C: .word ov64_021E6F18
_021E5CA0: .word ov64_021E6F34
	thumb_func_end ov64_021E5B10

	thumb_func_start ov64_021E5CA4
ov64_021E5CA4: ; 0x021E5CA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov64_021E5CA4

	thumb_func_start ov64_021E5CD0
ov64_021E5CD0: ; 0x021E5CD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	mov r0, #0x3b
	bl sub_0200CF18
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl sub_0200CF38
	mov r7, #0x4d
	lsl r7, r7, #2
	add r2, sp, #0x3c
	ldr r3, _021E5FD4 ; =ov64_021E6F8C
	str r0, [r5, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r4, _021E5FD8 ; =ov64_021E6EB8
	stmia r2!, {r0, r1}
	add r3, sp, #0x28
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r5, r0]
	mov r3, #0x20
	bl sub_0200CF70
	ldr r3, _021E5FDC ; =ov64_021E6EE4
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r1, r7, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl sub_0200CFF4
	sub r1, r7, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0x10
	bl sub_0200D3F8
	sub r0, r7, #4
	ldr r0, [r5, r0]
	bl sub_0200CF6C
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r0, #8
	mov r1, #0x3b
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021E5FE0 ; =0x0000DCC0
	sub r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x4c
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021E5FE4 ; =0x0000DCC1
	sub r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x4c
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021E5FE0 ; =0x0000DCC0
	sub r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021E5FE4 ; =0x0000DCC1
	sub r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x4b
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5FE0 ; =0x0000DCC0
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x4d
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E5FE0 ; =0x0000DCC0
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x4e
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #0x61
	mov r1, #0x3b
	bl NARC_ctor
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E5FE8 ; =0x0000DCCE
	sub r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #6
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FEC ; =0x0000DCC3
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #7
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FEC ; =0x0000DCC3
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #8
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021E5FE8 ; =0x0000DCCE
	sub r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #9
	bl sub_0200D5D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FE4 ; =0x0000DCC1
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #0xb
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FE4 ; =0x0000DCC1
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #0xc
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FF0 ; =0x0000DCC2
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #0xe
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E5FF0 ; =0x0000DCC2
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #0xf
	bl sub_0200D71C
	ldr r4, _021E5FF0 ; =0x0000DCC2
	mov r7, #0
_021E5EF0:
	str r7, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x13
	mov r1, #0x4d
	str r4, [sp, #0xc]
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	mov r3, #0x10
	bl sub_0200D5D4
	ldr r0, _021E5FF4 ; =0x0000DCCD
	add r4, r4, #1
	cmp r4, r0
	bls _021E5EF0
	add r0, r6, #0
	bl NARC_dtor
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	mov r3, #2
	ldr r1, [r5, r1]
	ldr r2, _021E5FF8 ; =ov64_021E70C8
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r1, #0x4e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #8
	sub r1, r1, #4
	mov r3, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E5FFC ; =ov64_021E70FC
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r0, r1, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _021E6000 ; =ov64_021E73A0
	bl sub_0200D734
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x40
	sub r1, #0x3c
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E6004 ; =ov64_021E73D4
	bl sub_0200D734
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x44
	sub r1, #0x40
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E6008 ; =ov64_021E7408
	bl sub_0200D734
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x48
	sub r1, #0x44
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _021E600C ; =ov64_021E743C
	bl sub_0200D734
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_021E5FD4: .word ov64_021E6F8C
_021E5FD8: .word ov64_021E6EB8
_021E5FDC: .word ov64_021E6EE4
_021E5FE0: .word 0x0000DCC0
_021E5FE4: .word 0x0000DCC1
_021E5FE8: .word 0x0000DCCE
_021E5FEC: .word 0x0000DCC3
_021E5FF0: .word 0x0000DCC2
_021E5FF4: .word 0x0000DCCD
_021E5FF8: .word ov64_021E70C8
_021E5FFC: .word ov64_021E70FC
_021E6000: .word ov64_021E73A0
_021E6004: .word ov64_021E73D4
_021E6008: .word ov64_021E7408
_021E600C: .word ov64_021E743C
	thumb_func_end ov64_021E5CD0

	thumb_func_start ov64_021E6010
ov64_021E6010: ; 0x021E6010
	push {r3, r4, r5, lr}
	lsl r5, r1, #2
	mov r1, #0x4e
	lsl r1, r1, #2
	add r4, r0, r1
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _021E6028
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4, r5]
_021E6028:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov64_021E6010

	thumb_func_start ov64_021E602C
ov64_021E602C: ; 0x021E602C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #0
_021E6032:
	add r0, r4, #0
	add r1, r5, #0
	bl ov64_021E6010
	add r5, r5, #1
	cmp r5, #0x12
	blo _021E6032
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D998
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov64_021E602C

	thumb_func_start ov64_021E605C
ov64_021E605C: ; 0x021E605C
	push {r4, r5, r6, lr}
	mov r6, #0x4e
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_021E6066:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021E6070
	bl sub_0200DC18
_021E6070:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x12
	blo _021E6066
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov64_021E605C

	thumb_func_start ov64_021E607C
ov64_021E607C: ; 0x021E607C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb5
	mov r3, #0x3b
	bl NewMsgDataFromNarc
	mov r1, #0x46
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #0x3b
	bl NewMsgDataFromNarc
	mov r1, #0x47
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r2, _021E6114 ; =0x000002EE
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x3b
	bl NewMsgDataFromNarc
	mov r1, #0x12
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0x3b
	bl ScrStrBufs_new
	mov r1, #0x49
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x24
	add r0, r1, #0
	mov r1, #0x3b
	bl String_ctor
	mov r1, #0x4a
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x28
	add r0, r1, #0
	mov r1, #0x3b
	bl String_ctor
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x2c
	add r0, r1, #0
	mov r1, #0x3b
	bl String_ctor
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0xa4
	add r0, r1, #0
	mov r1, #0x3b
	bl String_ctor
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x20
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	sub r1, #0x1c
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_021E6114: .word 0x000002EE
	thumb_func_end ov64_021E607C

	thumb_func_start ov64_021E6118
ov64_021E6118: ; 0x021E6118
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x47
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov64_021E6118

	thumb_func_start ov64_021E6170
ov64_021E6170: ; 0x021E6170
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	mov r0, #4
	mov r1, #0x3b
	bl FontID_Alloc
	add r5, r6, #0
	ldr r4, _021E6204 ; =ov64_021E7040
	mov r7, #0
	add r5, #8
_021E6186:
	ldr r0, [r6, #4]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r7, r7, #1
	add r4, #8
	add r5, #0x10
	cmp r7, #0x11
	blo _021E6186
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r6, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x46
	lsl r2, r2, #2
	ldr r0, [r6, r2]
	add r2, #0x10
	ldr r2, [r6, r2]
	mov r1, #6
	bl ReadMsgDataIntoString
	mov r1, #0x4a
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	lsr r4, r3, #1
	mov r3, #0x18
	str r1, [sp]
	mov r2, #0xff
	ldr r0, _021E6208 ; =0x000F0100
	str r2, [sp, #4]
	str r0, [sp, #8]
	add r0, r2, #0
	str r1, [sp, #0xc]
	add r2, #0x29
	add r0, #9
	ldr r2, [r6, r2]
	add r0, r6, r0
	mov r1, #4
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r6, r0
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6204: .word ov64_021E7040
_021E6208: .word 0x000F0100
	thumb_func_end ov64_021E6170

	thumb_func_start ov64_021E620C
ov64_021E620C: ; 0x021E620C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #8
_021E6214:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x11
	blo _021E6214
	mov r0, #4
	bl FontID_Release
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov64_021E620C

	thumb_func_start ov64_021E622C
ov64_021E622C: ; 0x021E622C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x3b
	str r0, [sp, #8]
	ldr r0, _021E6254 ; =ov64_021E6F6C
	ldr r1, _021E6258 ; =ov64_021E7008
	ldr r2, _021E625C ; =ov64_021E6EA8
	add r3, r4, #0
	bl sub_02019BA4
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r4, r1]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021E6254: .word ov64_021E6F6C
_021E6258: .word ov64_021E7008
_021E625C: .word ov64_021E6EA8
	thumb_func_end ov64_021E622C

	thumb_func_start ov64_021E6260
ov64_021E6260: ; 0x021E6260
	mov r1, #6
	lsl r1, r1, #6
	ldr r3, _021E626C ; =sub_02019BDC
	ldr r0, [r0, r1]
	bx r3
	nop
_021E626C: .word sub_02019BDC
	thumb_func_end ov64_021E6260

	thumb_func_start ov64_021E6270
ov64_021E6270: ; 0x021E6270
	bx lr
	.balign 4, 0
	thumb_func_end ov64_021E6270

	thumb_func_start ov64_021E6274
ov64_021E6274: ; 0x021E6274
	bx lr
	.balign 4, 0
	thumb_func_end ov64_021E6274

	thumb_func_start ov64_021E6278
ov64_021E6278: ; 0x021E6278
	ldr r3, _021E627C ; =ov64_021E6BD8
	bx r3
	.balign 4, 0
_021E627C: .word ov64_021E6BD8
	thumb_func_end ov64_021E6278

	thumb_func_start ov64_021E6280
ov64_021E6280: ; 0x021E6280
	ldr r3, _021E6284 ; =ov64_021E6BD8
	bx r3
	.balign 4, 0
_021E6284: .word ov64_021E6BD8
	thumb_func_end ov64_021E6280

	thumb_func_start ov64_021E6288
ov64_021E6288: ; 0x021E6288
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x3b
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov64_021E6288

	thumb_func_start ov64_021E62A8
ov64_021E62A8: ; 0x021E62A8
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x3b
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add sp, #0xc
	pop {pc}
	thumb_func_end ov64_021E62A8

	thumb_func_start ov64_021E62C8
ov64_021E62C8: ; 0x021E62C8
	push {r3, r4, r5, lr}
	mov r1, #0x72
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #4
	bhi _021E63A2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E62E2: ; jump table
	.short _021E62EC - _021E62E2 - 2 ; case 0
	.short _021E649E - _021E62E2 - 2 ; case 1
	.short _021E64B2 - _021E62E2 - 2 ; case 2
	.short _021E64C4 - _021E62E2 - 2 ; case 3
	.short _021E64D4 - _021E62E2 - 2 ; case 4
_021E62EC:
	ldr r0, _021E64E8 ; =_021E6E7C
	bl sub_02025224
	cmp r0, #0
	bne _021E6324
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	ble _021E63A2
	add r0, r1, #0
	mov r2, #0xf
	add r0, #8
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #2
	add r0, #0x18
	str r2, [r4, r0]
	mov r0, #1
	add r1, #0x14
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov64_021E64F8
	ldr r0, _021E64EC ; =0x000005DC
	bl PlaySE
	b _021E64E2
_021E6324:
	cmp r0, #1
	bne _021E635E
	mov r1, #0x6e
	lsl r1, r1, #2
	ldr r3, [r4, r1]
	cmp r3, #1
	blt _021E63A2
	sub r0, r1, #4
	ldr r2, [r4, r0]
	sub r0, r3, #1
	cmp r2, r0
	beq _021E63A2
	mov r2, #0x10
	add r0, r1, #4
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #3
	add r0, #0x14
	str r2, [r4, r0]
	mov r0, #1
	add r1, #0x10
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov64_021E64F8
	ldr r0, _021E64EC ; =0x000005DC
	bl PlaySE
	b _021E64E2
_021E635E:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02019D18
	mov r1, #2
	add r5, r0, #0
	mvn r1, r1
	cmp r5, r1
	bhi _021E639A
	bhs _021E63F6
	cmp r5, #6
	bhi _021E6392
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6384: ; jump table
	.short _021E63AC - _021E6384 - 2 ; case 0
	.short _021E63AC - _021E6384 - 2 ; case 1
	.short _021E63AC - _021E6384 - 2 ; case 2
	.short _021E63AC - _021E6384 - 2 ; case 3
	.short _021E63AC - _021E6384 - 2 ; case 4
	.short _021E63AC - _021E6384 - 2 ; case 5
	.short _021E63D2 - _021E6384 - 2 ; case 6
_021E6392:
	mov r0, #3
	mvn r0, r0
	cmp r5, r0
	b _021E64E2
_021E639A:
	add r0, r1, #1
	cmp r5, r0
	bhi _021E63A4
	beq _021E63D2
_021E63A2:
	b _021E64E2
_021E63A4:
	add r0, r1, #2
	cmp r5, r0
	beq _021E6410
	b _021E64E2
_021E63AC:
	add r0, r4, #0
	add r1, r5, #0
	bl ov64_021E677C
	ldr r0, _021E64F0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _021E63C8
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r5, r0
	blo _021E63CA
_021E63C8:
	b _021E64E2
_021E63CA:
	ldr r0, _021E64EC ; =0x000005DC
	bl PlaySE
	b _021E64E2
_021E63D2:
	ldr r0, _021E64EC ; =0x000005DC
	bl PlaySE
	mov r1, #0x6f
	mov r0, #0x11
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	mov r2, #4
	add r0, #0x10
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	add r1, #0xc
	add r0, r0, #1
	str r0, [r4, r1]
	b _021E64E2
_021E63F6:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r4, #0
	bl ov64_021E677C
	ldr r0, _021E64EC ; =0x000005DC
	bl PlaySE
	b _021E64E2
_021E6410:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02019F74
	ldr r1, _021E64F0 ; =gSystem
	ldr r2, [r1, #0x4c]
	mov r1, #0x10
	tst r1, r2
	beq _021E6462
	cmp r0, #2
	beq _021E642C
	cmp r0, #5
	bne _021E64E2
_021E642C:
	mov r1, #0x6e
	lsl r1, r1, #2
	ldr r3, [r4, r1]
	cmp r3, #1
	blt _021E64E2
	sub r0, r1, #4
	ldr r2, [r4, r0]
	sub r0, r3, #1
	cmp r2, r0
	beq _021E64E2
	mov r2, #0x10
	add r0, r1, #4
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #3
	add r0, #0x14
	str r2, [r4, r0]
	mov r0, #1
	add r1, #0x10
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov64_021E64F8
	ldr r0, _021E64EC ; =0x000005DC
	bl PlaySE
	b _021E64E2
_021E6462:
	mov r1, #0x20
	tst r1, r2
	beq _021E64E2
	cmp r0, #0
	beq _021E6470
	cmp r0, #3
	bne _021E64E2
_021E6470:
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	ble _021E64E2
	add r0, r1, #0
	mov r2, #0xf
	add r0, #8
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #2
	add r0, #0x18
	str r2, [r4, r0]
	mov r0, #1
	add r1, #0x14
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov64_021E64F8
	ldr r0, _021E64EC ; =0x000005DC
	bl PlaySE
	b _021E64E2
_021E649E:
	bl ov64_021E6B84
	cmp r0, #0
	bne _021E64E2
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, r0, #4
	str r1, [r4, r0]
	b _021E64E2
_021E64B2:
	mov r1, #0
	mvn r1, r1
	bl ov64_021E652C
	mov r0, #0x72
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _021E64E2
_021E64C4:
	mov r1, #1
	bl ov64_021E652C
	mov r0, #0x72
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _021E64E2
_021E64D4:
	bl ov64_021E62A8
	ldr r0, _021E64F4 ; =0x0000060D
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E64E2:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E64E8: .word _021E6E7C
_021E64EC: .word 0x000005DC
_021E64F0: .word gSystem
_021E64F4: .word 0x0000060D
	thumb_func_end ov64_021E62C8

	thumb_func_start ov64_021E64F8
ov64_021E64F8: ; 0x021E64F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #2
_021E64FE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov64_021E6010
	add r4, r4, #1
	cmp r4, #0xd
	bls _021E64FE
	ldr r4, _021E6528 ; =0x0000DCC2
	mov r7, #0x4d
	add r6, r4, #0
	lsl r7, r7, #2
	add r6, #0xb
_021E6516:
	ldr r0, [r5, r7]
	add r1, r4, #0
	bl sub_0200D958
	add r4, r4, #1
	cmp r4, r6
	bls _021E6516
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6528: .word 0x0000DCC2
	thumb_func_end ov64_021E64F8

	thumb_func_start ov64_021E652C
ov64_021E652C: ; 0x021E652C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	mov r2, #0x6d
	add r5, r0, #0
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r0, r0, r1
	str r0, [r5, r2]
	ldr r1, [r5, r2]
	cmp r1, #0
	bge _021E6548
	mov r0, #0
	str r0, [r5, r2]
	b _021E6554
_021E6548:
	add r0, r2, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	blt _021E6554
	sub r0, r0, #1
	str r0, [r5, r2]
_021E6554:
	mov r1, #0x6e
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _021E6576
	sub r1, #0x44
	ldr r0, [r5, r1]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	b _021E65BA
_021E6576:
	sub r0, r1, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021E658A
	sub r1, #0x44
	ldr r0, [r5, r1]
	mov r1, #0
	bl sub_0200DCE8
	b _021E6594
_021E658A:
	sub r1, #0x44
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_0200DCE8
_021E6594:
	mov r0, #0x6d
	lsl r0, r0, #2
	add r1, r0, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r0]
	sub r1, r1, #1
	cmp r2, r1
	bne _021E65B0
	sub r0, #0x3c
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	b _021E65BA
_021E65B0:
	sub r0, #0x3c
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
_021E65BA:
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl Sav2_HOF_TranslateRecordIdx
	mov r1, #0x1b
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r1, r1, #4
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl Sav2_HOF_RecordCountMons
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, #0x1a
	ldrh r0, [r5, r1]
	cmp r0, #0
	bne _021E65F0
	ldr r0, _021E6744 ; =0x0000DCC2
	mov r7, #2
	str r0, [sp, #0x14]
	mov r0, #7
	str r0, [sp, #0x10]
	b _021E65FA
_021E65F0:
	ldr r0, _021E6748 ; =0x0000DCC8
	mov r7, #8
	str r0, [sp, #0x14]
	mov r0, #0xf
	str r0, [sp, #0x10]
_021E65FA:
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	bls _021E6656
	lsl r0, r7, #2
	add r6, r5, r0
_021E660A:
	mov r1, #0x6d
	lsl r1, r1, #2
	mov r3, #0x62
	lsl r3, r3, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	add r2, r4, #0
	add r3, r5, r3
	bl Sav2_HOF_GetMonStatsByIndexPair
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	add r3, r0, r4
	add r0, r5, #0
	add r2, r4, #0
	str r3, [sp]
	bl ov64_021E6C1C
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r4, #1
	add r7, r7, #1
	add r6, r6, #4
	cmp r4, r0
	blo _021E660A
_021E6656:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r5, #0
	bl ov64_021E677C
	ldr r0, [sp, #0x10]
	add r4, r5, #0
	add r4, #8
	lsl r6, r0, #4
	add r0, r4, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x46
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0
	bl ReadMsgDataIntoString
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	bl Sav2_HOF_TranslateRecordIdx
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #4
	bl BufferIntegerAsString
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r5]
	ldr r1, [r5, r1]
	add r2, sp, #0x18
	bl Sav2_HOF_GetClearDate
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x49
	lsl r0, r0, #2
	mov r2, #0x7d
	ldr r3, [sp, #0x18]
	lsl r2, r2, #4
	add r2, r3, r2
	ldr r0, [r5, r0]
	mov r3, #4
	bl BufferIntegerAsString
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x1c]
	mov r1, #2
	bl BufferMonthNameAbbr
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x49
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x20]
	mov r1, #3
	mov r3, #2
	bl BufferIntegerAsString
	mov r2, #0x49
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r0, [r5, r2]
	add r1, #8
	add r2, r2, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E674C ; =0x000F0200
	add r2, #0x2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, r6
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r4, r6
	bl CopyWindowPixelsToVram_TextMode
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	ldr r1, _021E6750 ; =0x000001C6
	mov r0, #1
	ldrh r2, [r5, r1]
	eor r0, r2
	strh r0, [r5, r1]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6744: .word 0x0000DCC2
_021E6748: .word 0x0000DCC8
_021E674C: .word 0x000F0200
_021E6750: .word 0x000001C6
	thumb_func_end ov64_021E652C

	thumb_func_start ov64_021E6754
ov64_021E6754: ; 0x021E6754
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #4]
	mov r1, #4
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	pop {r4, pc}
	thumb_func_end ov64_021E6754

	thumb_func_start ov64_021E677C
ov64_021E677C: ; 0x021E677C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	ldr r3, _021E6AC0 ; =ov64_021E6E98
	add r2, sp, #0x40
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0x6b
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r6, r1
	blo _021E67A4
	add r0, r5, #0
	bl ov64_021E6754
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
_021E67A4:
	sub r0, #0x74
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x71
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _021E67CA
	mov r4, #0
	str r4, [sp, #0x1c]
	b _021E67D0
_021E67CA:
	mov r0, #1
	str r0, [sp, #0x1c]
	mov r4, #8
_021E67D0:
	mov r3, #0x6d
	lsl r3, r3, #2
	ldr r1, [r5, r3]
	sub r3, #0x2c
	ldr r0, [r5]
	add r2, r6, #0
	add r3, r5, r3
	bl Sav2_HOF_GetMonStatsByIndexPair
	mov r1, #0x66
	lsl r1, r1, #2
	ldrh r0, [r5, r1]
	sub r1, #8
	ldr r1, [r5, r1]
	bl GetGenderBySpeciesAndPersonality
	mov r2, #0x61
	lsl r2, r2, #2
	str r0, [sp, #0x20]
	ldr r0, [r5, r2]
	add r2, #0x14
	ldrh r2, [r5, r2]
	add r1, sp, #0x3c
	bl sub_020729D8
	mov r3, #0x19
	lsl r3, r3, #4
	ldr r0, [r5, r3]
	ldr r1, [sp, #0x20]
	str r0, [sp]
	add r0, r3, #0
	add r0, #8
	add r3, #0xb
	lsl r1, r1, #0x18
	ldrh r0, [r5, r0]
	ldrb r3, [r5, r3]
	lsr r1, r1, #0x18
	mov r2, #2
	bl sub_020708D8
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	add r3, sp, #0x3c
	mov r2, #0
	lsl r6, r0, #2
	mov r0, #0x4e
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x24]
	ldrsb r2, [r3, r2]
	add r7, #0x40
	mov r1, #0x40
	sub r2, r7, r2
	lsl r2, r2, #0x10
	ldr r0, [r0, r6]
	asr r2, r2, #0x10
	lsl r3, r1, #0xf
	bl sub_0200DDF4
	mov r1, #0x65
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	beq _021E685C
	mov r7, #1
	b _021E685E
_021E685C:
	mov r7, #0
_021E685E:
	mov r1, #0x32
	mov r0, #0x3b
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0x28]
	ldr r0, [r5, r1]
	add r1, #8
	str r0, [sp, #0x18]
	ldrh r0, [r5, r1]
	ldr r1, [sp, #0x18]
	bl GetGenderBySpeciesAndPersonality
	add r2, r0, #0
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	ldr r1, _021E6AC4 ; =0x0000019B
	str r0, [sp]
	ldrb r0, [r5, r1]
	sub r1, r1, #3
	mov r3, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	ldrh r1, [r5, r1]
	add r0, sp, #0x50
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [sp, #0x28]
	mov r2, #0x3b
	str r0, [sp]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r0, #8
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #2
	str r1, [sp, #0xc]
	ldrh r0, [r5, r0]
	add r1, sp, #0x3c
	add r3, sp, #0x40
	str r0, [sp, #0x10]
	ldrh r0, [r1, #0x14]
	ldrh r1, [r1, #0x16]
	bl sub_02014510
	ldr r0, [sp, #0x24]
	ldr r0, [r0, r6]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	add r1, r0, #0
	mov r2, #0x32
	ldr r0, [sp, #0x28]
	lsl r2, r2, #6
	bl ov64_021E5AC8
	ldr r0, [sp, #0x28]
	bl FreeToHeap
	ldr r0, [sp, #0x24]
	ldr r0, [r0, r6]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #2
	bl NNS_G2dGetImagePaletteLocation
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x3b
	str r0, [sp, #4]
	add r1, sp, #0x3c
	ldrh r0, [r1, #0x14]
	ldrh r1, [r1, #0x18]
	mov r2, #5
	bl GfGfxLoader_GXLoadPal
	ldr r0, [sp, #0x24]
	mov r1, #1
	ldr r0, [r0, r6]
	bl sub_0200DCE8
	add r0, r5, #0
	str r0, [sp, #0x2c]
	add r0, #8
	mov r7, #0
	add r6, r4, #0
	str r0, [sp, #0x2c]
_021E6920:
	ldr r0, [sp, #0x2c]
	lsl r1, r6, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r7, #1
	add r6, r6, #1
	cmp r7, #7
	blo _021E6920
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 ; =0x000F0200
	add r3, r5, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r2, #0x89
	add r3, #8
	lsl r0, r4, #4
	add r0, r3, r0
	ldr r2, [r5, r2]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r2, #0x47
	lsl r2, r2, #2
	add r1, r2, #0
	add r1, #0x7c
	ldr r0, [r5, r2]
	add r2, #0xc
	ldrh r1, [r5, r1]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	add r0, r4, #1
	lsl r7, r0, #4
	add r6, r5, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 ; =0x000F0200
	add r2, #0x29
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r6, #8
	ldr r2, [r5, r2]
	add r0, r6, r7
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r2, #0x66
	lsl r2, r2, #2
	ldrh r0, [r5, r2]
	cmp r0, #0x1d
	beq _021E6A18
	cmp r0, #0x20
	beq _021E6A18
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _021E69DA
	add r0, r2, #0
	sub r0, #0x80
	sub r2, #0x6c
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #3
	bl ReadMsgDataIntoString
	mov r1, #0x4a
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 ; =0x000F0200
	add r2, #0x2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	add r3, #8
	bl AddTextPrinterParameterized2
	b _021E6A18
_021E69DA:
	cmp r0, #1
	bne _021E6A18
	add r0, r2, #0
	sub r0, #0x80
	sub r2, #0x6c
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	mov r1, #4
	bl ReadMsgDataIntoString
	mov r1, #0x4a
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 ; =0x000F0200
	add r2, #0x2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	add r3, #8
	bl AddTextPrinterParameterized2
_021E6A18:
	mov r2, #0x46
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #1
	bl ReadMsgDataIntoString
	mov r1, #0
	mov r2, #0x49
	str r1, [sp]
	mov r0, #1
	lsl r2, r2, #2
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r2, #0x76
	ldrb r2, [r5, r2]
	mov r3, #3
	bl BufferIntegerAsString
	mov r2, #0x49
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r0, [r5, r2]
	add r1, #8
	add r2, r2, #4
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 ; =0x000F0200
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r2, #0x2d
	ldr r2, [r5, r2]
	add r0, r6, r7
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r2, #0x46
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #2
	bl ReadMsgDataIntoString
	mov r1, #0
	add r0, r4, #2
	lsl r7, r0, #4
	add r6, r5, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 ; =0x000F0200
	add r2, #0x29
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r6, #8
	ldr r2, [r5, r2]
	add r0, r6, r7
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r1, #0x4a
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021E6AC8 ; =0x000F0200
	b _021E6ACC
	nop
_021E6AC0: .word ov64_021E6E98
_021E6AC4: .word 0x0000019B
_021E6AC8: .word 0x000F0200
_021E6ACC:
	add r2, #0x8d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r6, r7
	bl AddTextPrinterParameterized2
	mov r0, #0
	str r0, [sp, #0x14]
	add r0, r5, #0
	str r0, [sp, #0x30]
	add r0, #8
	str r5, [sp, #0x38]
	add r7, r4, #3
	str r0, [sp, #0x30]
_021E6AEA:
	mov r1, #0x67
	ldr r0, [sp, #0x38]
	lsl r1, r1, #2
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _021E6B3E
	mov r0, #0x12
	mov r2, #0x4a
	lsl r0, r0, #4
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0x4a
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6B80 ; =0x000F0200
	mov r2, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r2, r2, #2
	lsr r6, r3, #1
	mov r3, #0x38
	ldr r0, [sp, #0x30]
	lsl r1, r7, #4
	add r0, r0, r1
	ldr r2, [r5, r2]
	mov r1, #0
	sub r3, r3, r6
	bl AddTextPrinterParameterized2
_021E6B3E:
	ldr r0, [sp, #0x38]
	add r7, r7, #1
	add r0, r0, #2
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blo _021E6AEA
	add r6, r5, #0
	mov r7, #0
	add r6, #8
_021E6B56:
	lsl r0, r4, #4
	str r0, [sp, #0x34]
	add r0, r6, r0
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [sp, #0x34]
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	add r7, r7, #1
	add r4, r4, #1
	cmp r7, #7
	blo _021E6B56
	mov r1, #0x71
	lsl r1, r1, #2
	ldrh r2, [r5, r1]
	mov r0, #1
	eor r0, r2
	strh r0, [r5, r1]
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6B80: .word 0x000F0200
	thumb_func_end ov64_021E677C

	thumb_func_start ov64_021E6B84
ov64_021E6B84: ; 0x021E6B84
	push {r4, lr}
	mov r1, #7
	add r4, r0, #0
	lsl r1, r1, #6
	ldr r0, [r4, r1]
	cmp r0, #0
	bne _021E6BA6
	sub r0, r1, #4
	ldr r0, [r4, r0]
	sub r1, #0x88
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_0200DD10
	b _021E6BC8
_021E6BA6:
	cmp r0, #4
	bne _021E6BBE
	sub r0, r1, #4
	ldr r0, [r4, r0]
	sub r1, #0x88
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, r1]
	mov r1, #0
	bl sub_0200DD10
	b _021E6BC8
_021E6BBE:
	cmp r0, #6
	bne _021E6BC8
	mov r0, #0
	str r0, [r4, r1]
	pop {r4, pc}
_021E6BC8:
	mov r0, #7
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov64_021E6B84

	thumb_func_start ov64_021E6BD8
ov64_021E6BD8: ; 0x021E6BD8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r5, r1, #0
	bl sub_0201A018
	add r2, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	ldr r0, [r4, r0]
	bl sub_0200DDB8
	cmp r5, #6
	bne _021E6C00
	mov r5, #4
	b _021E6C02
_021E6C00:
	mov r5, #3
_021E6C02:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl sub_0200DC4C
	pop {r3, r4, r5, pc}
	thumb_func_end ov64_021E6BD8

	thumb_func_start ov64_021E6C1C
ov64_021E6C1C: ; 0x021E6C1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	add r5, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	add r7, r3, #0
	bl SpeciesToOverworldModelIndexOffset
	add r2, r0, #0
	add r0, sp, #0x30
	mov r1, #0x8d
	bl ReadWholeNarcMemberByIdPair
	mov r0, #0x61
	mov r1, #0x3b
	bl NARC_ctor
	add r4, r0, #0
	add r0, sp, #0x30
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _021E6C58
	ldr r0, _021E6E18 ; =0x0000DCC2
	mov r3, #0xd
	str r0, [sp, #0x20]
	mov r6, #8
	b _021E6C60
_021E6C58:
	ldr r0, _021E6E1C ; =0x0000DCC1
	mov r3, #0xa
	str r0, [sp, #0x20]
	mov r6, #4
_021E6C60:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #0x13
	str r7, [sp, #8]
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl sub_0200D504
	add r0, r4, #0
	bl NARC_dtor
	ldr r4, _021E6E20 ; =ov64_021E6FD4
	add r3, sp, #0x34
	mov r2, #6
_021E6C84:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6C84
	ldr r0, [r4]
	str r0, [r3]
	ldr r0, [sp, #0x80]
	str r7, [sp, #0x48]
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x10]
	lsl r2, r0, #2
	ldr r0, _021E6E24 ; =ov64_021E6ECC
	ldrsh r1, [r0, r2]
	add r0, sp, #0x30
	strh r1, [r0, #4]
	ldr r1, _021E6E28 ; =ov64_021E6ECE
	ldrsh r1, [r1, r2]
	add r2, sp, #0x34
	strh r1, [r0, #6]
	mov r1, #0x4e
	lsl r1, r1, #2
	add r0, r5, r1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x28]
	add r0, r1, #0
	sub r0, #8
	sub r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D734
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [r2, r1]
	ldr r0, [sp, #0x28]
	add r1, r2, #0
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #1
	bl NNS_G2dGetImageLocation
	mov r1, #0x66
	str r0, [sp, #0x2c]
	lsl r0, r6, #5
	add r4, r6, #0
	lsl r1, r1, #2
	mul r4, r0
	ldrh r0, [r5, r1]
	sub r1, #8
	ldr r1, [r5, r1]
	bl GetGenderBySpeciesAndPersonality
	mov r1, #0x66
	lsl r1, r1, #2
	add r2, r0, #0
	ldrh r0, [r5, r1]
	add r1, r1, #3
	ldrb r1, [r5, r1]
	bl ov64_021E6E30
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x51
	mov r2, #0x3b
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [sp, #0x1c]
	bl NNS_G3dGetTex
	ldr r1, [r0, #0x14]
	str r0, [sp, #0x18]
	add r0, r0, r1
	str r0, [sp, #0x14]
	mov r0, #0x3b
	add r1, r4, #0
	bl AllocFromHeap
	add r7, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	ldr r0, _021E6E2C ; =0x0000FF9E
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	str r6, [sp]
	bhi _021E6D8C
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #0x14]
	mov r2, #0
	str r6, [sp, #4]
	add r0, r0, r1
	add r1, r6, #0
	add r3, r2, #0
	str r7, [sp, #8]
	bl sub_020145B4
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	add r2, r4, #0
	bl ov64_021E5AAC
	str r6, [sp]
	mov r2, #0
	str r6, [sp, #4]
	mov r0, #7
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #0x14]
	add r3, r2, #0
	add r0, r0, r1
	add r1, r6, #0
	str r7, [sp, #8]
	bl sub_020145B4
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	add r1, r1, r4
	add r2, r4, #0
	bl ov64_021E5AAC
	b _021E6DCE
_021E6D8C:
	ldr r0, [sp, #0x14]
	lsl r1, r4, #1
	mov r2, #0
	str r6, [sp, #4]
	add r0, r0, r1
	add r1, r6, #0
	add r3, r2, #0
	str r7, [sp, #8]
	bl sub_020145B4
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	add r2, r4, #0
	bl ov64_021E5AAC
	lsl r0, r4, #1
	add r1, r4, r0
	ldr r0, [sp, #0x14]
	str r6, [sp]
	mov r2, #0
	str r6, [sp, #4]
	add r0, r0, r1
	add r1, r6, #0
	add r3, r2, #0
	str r7, [sp, #8]
	bl sub_020145B4
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	add r1, r1, r4
	add r2, r4, #0
	bl ov64_021E5AAC
_021E6DCE:
	add r0, r7, #0
	bl FreeToHeap
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #0x38]
	add r4, r0, r1
	mov r1, #0x65
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	beq _021E6E02
	add r4, #0x20
_021E6E02:
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0x20
	bl ov64_021E5AE4
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6E18: .word 0x0000DCC2
_021E6E1C: .word 0x0000DCC1
_021E6E20: .word ov64_021E6FD4
_021E6E24: .word ov64_021E6ECC
_021E6E28: .word ov64_021E6ECE
_021E6E2C: .word 0x0000FF9E
	thumb_func_end ov64_021E6C1C

	thumb_func_start ov64_021E6E30
ov64_021E6E30: ; 0x021E6E30
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	cmp r5, #0
	ble _021E6E42
	ldr r1, _021E6E74 ; =0x000001ED
	cmp r5, r1
	ble _021E6E46
_021E6E42:
	mov r4, #1
	b _021E6E6E
_021E6E46:
	bl SpeciesToOverworldModelIndexOffset
	ldr r1, _021E6E78 ; =0x00000129
	add r4, r0, r1
	add r0, r5, #0
	bl OverworldModelLookupHasFemaleForme
	cmp r0, #0
	beq _021E6E60
	cmp r7, #1
	bne _021E6E6E
	add r4, r4, #1
	b _021E6E6E
_021E6E60:
	add r0, r5, #0
	bl OverworldModelLookupFormeCount
	cmp r6, r0
	ble _021E6E6C
	mov r6, #0
_021E6E6C:
	add r4, r4, r6
_021E6E6E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6E74: .word 0x000001ED
_021E6E78: .word 0x00000129
	thumb_func_end ov64_021E6E30

	.rodata

_021E6E7C:
	.byte 0x58, 0x77, 0x00, 0x17
	.byte 0x58, 0x77, 0xE8, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov64_021E6E88: ; 0x021E6E88
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E6E98: ; 0x021E6E98
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov64_021E6EA8: ; 0x021E6EA8
	.word ov64_021E6270
	.word ov64_021E6274
	.word ov64_021E6280
	.word ov64_021E6278

ov64_021E6EB8: ; 0x021E6EB8
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00

ov64_021E6ECC: ; 0x021E6ECC
	.byte 0x38, 0x00

ov64_021E6ECE: ; 0x021E6ECE
	.byte 0x48, 0x00
	.byte 0x80, 0x00, 0x48, 0x00, 0xC8, 0x00, 0x48, 0x00, 0x38, 0x00, 0x88, 0x00, 0x80, 0x00, 0x88, 0x00
	.byte 0xC8, 0x00, 0x88, 0x00

ov64_021E6EE4: ; 0x021E6EE4
	.byte 0x0F, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E6EFC: ; 0x021E6EFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E6F18: ; 0x021E6F18
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov64_021E6F34: ; 0x021E6F34
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E6F50: ; 0x021E6F50
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E6F6C: ; 0x021E6F6C
	.byte 0xFE, 0x38, 0x40, 0x20
	.byte 0xFE, 0x80, 0x40, 0x20, 0xFE, 0xC8, 0x40, 0x20, 0xFE, 0x38, 0x80, 0x20, 0xFE, 0x80, 0x80, 0x20
	.byte 0xFE, 0xC8, 0x80, 0x20, 0xA0, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov64_021E6F8C: ; 0x021E6F8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov64_021E6FAC: ; 0x021E6FAC
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov64_021E6FD4: ; 0x021E6FD4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E7008: ; 0x021E7008
	.byte 0x38, 0x48, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01
	.byte 0x80, 0x48, 0x00, 0x00, 0x01, 0x04, 0x00, 0x02, 0xC8, 0x48, 0x00, 0x00, 0x02, 0x05, 0x01, 0x02
	.byte 0x38, 0x88, 0x00, 0x00, 0x00, 0x06, 0x03, 0x04, 0x80, 0x88, 0x00, 0x00, 0x01, 0x06, 0x03, 0x05
	.byte 0xC8, 0x88, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xE0, 0xB0, 0x00, 0x00, 0x85, 0x06, 0x06, 0x06

ov64_021E7040: ; 0x021E7040
	.byte 0x04, 0x12, 0x02, 0x0E, 0x02, 0x0F, 0x01, 0x00, 0x04, 0x12, 0x07, 0x0E, 0x04, 0x0F, 0x39, 0x00
	.byte 0x04, 0x12, 0x0E, 0x0E, 0x02, 0x0F, 0xA9, 0x00, 0x04, 0x01, 0x12, 0x0E, 0x02, 0x0F, 0xE1, 0x00
	.byte 0x04, 0x11, 0x12, 0x0E, 0x02, 0x0F, 0x19, 0x01, 0x04, 0x01, 0x15, 0x0E, 0x02, 0x0F, 0x51, 0x01
	.byte 0x04, 0x11, 0x15, 0x0E, 0x02, 0x0F, 0x89, 0x01, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x0F, 0x01, 0x00
	.byte 0x04, 0x12, 0x02, 0x0E, 0x02, 0x0F, 0x1D, 0x00, 0x04, 0x12, 0x07, 0x0E, 0x04, 0x0F, 0x71, 0x00
	.byte 0x04, 0x12, 0x0E, 0x0E, 0x02, 0x0F, 0xC5, 0x00, 0x04, 0x01, 0x12, 0x0E, 0x02, 0x0F, 0xFD, 0x00
	.byte 0x04, 0x11, 0x12, 0x0E, 0x02, 0x0F, 0x35, 0x01, 0x04, 0x01, 0x15, 0x0E, 0x02, 0x0F, 0x6D, 0x01
	.byte 0x04, 0x11, 0x15, 0x0E, 0x02, 0x0F, 0xA5, 0x01, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x0F, 0x3D, 0x00
	.byte 0x00, 0x19, 0x15, 0x06, 0x02, 0x0F, 0x79, 0x00

ov64_021E70C8: ; 0x021E70C8
	.byte 0x40, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xC0, 0xDC, 0x00, 0x00
	.byte 0xC0, 0xDC, 0x00, 0x00, 0xC0, 0xDC, 0x00, 0x00, 0xC0, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E70FC: ; 0x021E70FC
	.byte 0x40, 0x00, 0x40, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xC0, 0xDC, 0x00, 0x00, 0xC0, 0xDC, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xC2, 0xDC, 0x00, 0x00, 0xC2, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00
	.byte 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00
	.byte 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC4, 0xDC, 0x00, 0x00
	.byte 0xC4, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xC5, 0xDC, 0x00, 0x00, 0xC5, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xC6, 0xDC, 0x00, 0x00, 0xC6, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00
	.byte 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC7, 0xDC, 0x00, 0x00, 0xC7, 0xDC, 0x00, 0x00
	.byte 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC8, 0xDC, 0x00, 0x00
	.byte 0xC8, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xC9, 0xDC, 0x00, 0x00, 0xC9, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xCA, 0xDC, 0x00, 0x00, 0xCA, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00
	.byte 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCB, 0xDC, 0x00, 0x00, 0xCB, 0xDC, 0x00, 0x00
	.byte 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCC, 0xDC, 0x00, 0x00
	.byte 0xCC, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xE0, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xCD, 0xDC, 0x00, 0x00, 0xCD, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00, 0xC1, 0xDC, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E73A0: ; 0x021E73A0
	.byte 0x38, 0x00, 0x48, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xCE, 0xDC, 0x00, 0x00, 0xCE, 0xDC, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00
	.byte 0xC3, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov64_021E73D4: ; 0x021E73D4
	.byte 0x0C, 0x00, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCE, 0xDC, 0x00, 0x00, 0xCE, 0xDC, 0x00, 0x00
	.byte 0xC3, 0xDC, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E7408: ; 0x021E7408
	.byte 0xF4, 0x00, 0x68, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xCE, 0xDC, 0x00, 0x00
	.byte 0xCE, 0xDC, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov64_021E743C: ; 0x021E743C
	.byte 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xCE, 0xDC, 0x00, 0x00, 0xCE, 0xDC, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00, 0xC3, 0xDC, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x021E7470
