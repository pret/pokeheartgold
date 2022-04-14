	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov103_021EC940
ov103_021EC940: ; 0x021EC940
	push {r3, r4, r5, lr}
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x9c
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x2c
	mov r2, #0x9c
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x2c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #8]
	ldr r0, [r0]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4]
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl Sav2_Mailbox_get
	str r0, [r4, #4]
	mov r0, #8
	str r0, [r4, #0x28]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EC940

	thumb_func_start ov103_021EC988
ov103_021EC988: ; 0x021EC988
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	add r1, r4, #0
	bl ov103_021ED2D4
	cmp r0, #0
	bne _021EC99E
	mov r0, #1
	pop {r4, pc}
_021EC99E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EC988

	thumb_func_start ov103_021EC9A4
ov103_021EC9A4: ; 0x021EC9A4
	push {r3, lr}
	bl OverlayManager_FreeData
	mov r0, #0x9c
	bl DestroyHeap
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov103_021EC9A4

	thumb_func_start ov103_021EC9B4
ov103_021EC9B4: ; 0x021EC9B4
	push {r3, lr}
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl sub_0200D034
	ldr r3, _021EC9D0 ; =0x027E0000
	ldr r1, _021EC9D4 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	.balign 4, 0
_021EC9D0: .word 0x027E0000
_021EC9D4: .word 0x00003FF8
	thumb_func_end ov103_021EC9B4

	thumb_func_start ov103_021EC9D8
ov103_021EC9D8: ; 0x021EC9D8
	ldr r3, _021EC9E0 ; =GX_SetBanks
	ldr r0, _021EC9E4 ; =ov103_021EEC30
	bx r3
	nop
_021EC9E0: .word GX_SetBanks
_021EC9E4: .word ov103_021EEC30
	thumb_func_end ov103_021EC9D8

	thumb_func_start ov103_021EC9E8
ov103_021EC9E8: ; 0x021EC9E8
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	add r4, r0, #0
	mov r0, #0x9d
	bl BgConfig_Alloc
	ldr r1, [r4, #0xc]
	add r3, sp, #0xe0
	ldr r5, _021ECB98 ; =ov103_021EEB40
	str r0, [r1]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021ECB9C ; =ov103_021EEBC0
	add r3, sp, #0xc4
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
	ldr r0, [r4, #0xc]
	mov r3, #0
	ldr r0, [r0]
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #4
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x9d
	bl BG_ClearCharDataRange
	ldr r5, _021ECBA0 ; =ov103_021EEBA4
	add r3, sp, #0xa8
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	ldr r0, [r4, #0xc]
	mov r3, #0
	ldr r0, [r0]
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #5
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x9d
	bl BG_ClearCharDataRange
	ldr r5, _021ECBA4 ; =ov103_021EEB88
	add r3, sp, #0x8c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0xc]
	mov r1, #6
	ldr r0, [r0]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #6
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x9d
	bl BG_ClearCharDataRange
	ldr r5, _021ECBA8 ; =ov103_021EEC14
	add r3, sp, #0x70
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
	ldr r0, [r4, #0xc]
	mov r3, #0
	ldr r0, [r0]
	bl InitBgFromTemplate
	ldr r5, _021ECBAC ; =ov103_021EEBDC
	add r3, sp, #0x54
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
	ldr r0, [r4, #0xc]
	add r3, r1, #0
	ldr r0, [r0]
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x9d
	bl BG_ClearCharDataRange
	ldr r5, _021ECBB0 ; =ov103_021EEB50
	add r3, sp, #0x38
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
	ldr r0, [r4, #0xc]
	mov r3, #0
	ldr r0, [r0]
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x9d
	bl BG_ClearCharDataRange
	ldr r5, _021ECBB4 ; =ov103_021EEB6C
	add r3, sp, #0x1c
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
	ldr r0, [r4, #0xc]
	mov r3, #0
	ldr r0, [r0]
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #2
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021ECBB8 ; =ov103_021EEBF8
	add r3, sp, #0
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
	ldr r0, [r4, #0xc]
	mov r3, #0
	ldr r0, [r0]
	bl InitBgFromTemplate
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021ECB98: .word ov103_021EEB40
_021ECB9C: .word ov103_021EEBC0
_021ECBA0: .word ov103_021EEBA4
_021ECBA4: .word ov103_021EEB88
_021ECBA8: .word ov103_021EEC14
_021ECBAC: .word ov103_021EEBDC
_021ECBB0: .word ov103_021EEB50
_021ECBB4: .word ov103_021EEB6C
_021ECBB8: .word ov103_021EEBF8
	thumb_func_end ov103_021EC9E8

	thumb_func_start ov103_021ECBBC
ov103_021ECBBC: ; 0x021ECBBC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #3
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #2
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #7
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #6
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #5
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #4
	ldr r0, [r0]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ECBBC

	thumb_func_start ov103_021ECC1C
ov103_021ECC1C: ; 0x021ECC1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0xfc
	mov r1, #0x9d
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #0x9d
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	mov r1, #5
	ldr r2, [r2]
	mov r3, #7
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	ldr r2, [r2]
	mov r1, #4
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x9d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #6
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	ldr r2, [r2]
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	ldr r2, [r2]
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	ldr r2, [r2]
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r2, #0
	str r2, [sp]
	mov r0, #0x9d
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #2
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x9d
	mov r1, #1
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r3, sp, #0x10
	bl GfGfxLoader_GetCharDataFromOpenNarc
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	ldr r1, [r5, #0xc]
	ldr r6, [r0, #0x14]
	add r1, #8
	add r0, r6, #0
	add r0, #0xe0
	mov r2, #0x20
	bl MIi_CpuCopy32
	mov r0, #0x16
	ldr r1, [r5, #0xc]
	lsl r0, r0, #4
	add r0, r6, r0
	add r1, #0x28
	mov r2, #0x20
	bl MIi_CpuCopy32
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov103_021ECC1C

	thumb_func_start ov103_021ECD18
ov103_021ECD18: ; 0x021ECD18
	push {r4, lr}
	sub sp, #8
	ldr r4, [r0, #0xc]
	ldr r0, [r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x9d
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021ECD64 ; =0x000003E2
	mov r1, #0
	mov r3, #0xd
	bl LoadUserFrameGfx2
	mov r1, #7
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x9d
	bl LoadFontPal1
	mov r1, #0x1e
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x9d
	bl LoadFontPal0
	mov r1, #0x1e
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x9d
	bl LoadFontPal0
	add sp, #8
	pop {r4, pc}
	nop
_021ECD64: .word 0x000003E2
	thumb_func_end ov103_021ECD18

	thumb_func_start ov103_021ECD68
ov103_021ECD68: ; 0x021ECD68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0]
	mov r2, #0xb
	mov r3, #0x9d
	bl sub_0201956C
	ldr r1, [r5, #0xc]
	mov r4, #0
	str r0, [r1, #4]
	mov r6, #4
	mov r7, #2
_021ECD84:
	str r6, [sp]
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #4]
	add r2, r7, #0
	mov r3, #0xe
	bl sub_020195F4
	add r4, r4, #1
	cmp r4, #0xa
	blo _021ECD84
	mov r0, #4
	str r0, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #0xa
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xe
	bl sub_020195F4
	mov r0, #1
	str r0, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #4]
	mov r2, #0xfc
	mov r3, #3
	bl sub_02019688
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #4]
	bl sub_02019B08
	add r6, r0, #0
	mov r4, #1
	mov r7, #0x70
_021ECDCE:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #4]
	bl sub_02019B08
	add r1, r0, #0
	add r0, r6, #0
	add r2, r7, #0
	bl MI_CpuCopy8
	add r4, r4, #1
	cmp r4, #0xa
	bls _021ECDCE
	mov r4, #0
_021ECDEA:
	lsl r2, r4, #0x1f
	ldr r0, [r5, #0xc]
	lsr r2, r2, #0x1b
	add r2, r2, #1
	lsr r3, r4, #1
	lsl r2, r2, #0x18
	lsl r3, r3, #0x1a
	ldr r0, [r0, #4]
	add r1, r4, #0
	asr r2, r2, #0x18
	asr r3, r3, #0x18
	bl sub_020196E8
	add r4, r4, #1
	cmp r4, #0xa
	blo _021ECDEA
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021ECD68

	thumb_func_start ov103_021ECE0C
ov103_021ECE0C: ; 0x021ECE0C
	ldr r0, [r0, #0xc]
	ldr r3, _021ECE14 ; =sub_020195C0
	ldr r0, [r0, #4]
	bx r3
	.balign 4, 0
_021ECE14: .word sub_020195C0
	thumb_func_end ov103_021ECE0C

	thumb_func_start ov103_021ECE18
ov103_021ECE18: ; 0x021ECE18
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xe8
	mov r3, #0x9d
	bl NewMsgDataFromNarc
	mov r1, #0x8a
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x9d
	bl ScrStrBufs_new
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0x9d
	bl String_ctor
	mov r1, #0x23
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #1
	bl sub_02002B8C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ECE18

	thumb_func_start ov103_021ECE54
ov103_021ECE54: ; 0x021ECE54
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ECE54

	thumb_func_start ov103_021ECE80
ov103_021ECE80: ; 0x021ECE80
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x9d
	bl sub_0201660C
	mov r1, #0x8e
	ldr r2, [r4, #0xc]
	lsl r1, r1, #2
	str r0, [r2, r1]
	pop {r4, pc}
	thumb_func_end ov103_021ECE80

	thumb_func_start ov103_021ECE94
ov103_021ECE94: ; 0x021ECE94
	ldr r1, [r0, #0xc]
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r3, _021ECEA0 ; =sub_02016624
	ldr r0, [r1, r0]
	bx r3
	.balign 4, 0
_021ECEA0: .word sub_02016624
	thumb_func_end ov103_021ECE94

	thumb_func_start ov103_021ECEA4
ov103_021ECEA4: ; 0x021ECEA4
	push {r3, r4, lr}
	sub sp, #0x14
	ldr r1, [r0, #0xc]
	ldr r2, _021ECEE8 ; =0x000003A6
	ldr r1, [r1]
	mov r4, #0xa
	str r1, [sp]
	mov r1, #0
	str r2, [sp, #8]
	str r1, [sp, #4]
	str r4, [sp, #0xc]
	mov r2, #0x19
	add r3, sp, #0
	strb r2, [r3, #0x10]
	strb r4, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	mov r2, #0xf
	bic r4, r2
	strb r4, [r3, #0x12]
	ldrb r4, [r3, #0x12]
	mov r2, #0xf0
	bic r4, r2
	strb r4, [r3, #0x12]
	strb r1, [r3, #0x13]
	ldr r1, [r0, #0xc]
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	bl sub_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021ECEE8: .word 0x000003A6
	thumb_func_end ov103_021ECEA4

	thumb_func_start ov103_021ECEEC
ov103_021ECEEC: ; 0x021ECEEC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x9d
	mov r1, #0
	bl sub_02018424
	mov r1, #9
	ldr r2, [r5, #0xc]
	lsl r1, r1, #6
	str r0, [r2, r1]
	add r0, r5, #0
	bl ov103_021ED2B8
	mov r1, #0x9d
	add r6, r0, #0
	bl ListMenuItems_ctor
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r2, [r5, #0xc]
	add r7, r1, #0
	str r0, [r2, r1]
	mov r4, #0
	sub r7, #0x20
_021ECF1C:
	cmp r6, #2
	bne _021ECF28
	cmp r4, #2
	beq _021ECF3A
	cmp r4, #1
	beq _021ECF3A
_021ECF28:
	mov r0, #0x92
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [r1, r7]
	add r2, r4, #5
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
_021ECF3A:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _021ECF1C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov103_021ECEEC

	thumb_func_start ov103_021ECF48
ov103_021ECF48: ; 0x021ECF48
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x92
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl ListMenuItems_dtor
	mov r0, #9
	ldr r1, [r4, #0xc]
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	bl sub_02018474
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ECF48

	thumb_func_start ov103_021ECF68
ov103_021ECF68: ; 0x021ECF68
	push {r3, r4, lr}
	sub sp, #0x24
	ldr r2, _021ECFF8 ; =_021EEB34
	add r1, sp, #0xc
	ldrh r3, [r2]
	add r4, r0, #0
	strh r3, [r1]
	ldrh r3, [r2, #2]
	strh r3, [r1, #2]
	ldrh r3, [r2, #4]
	strh r3, [r1, #4]
	ldrh r3, [r2, #6]
	strh r3, [r1, #6]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r1, #8]
	strh r2, [r1, #0xa]
	mov r1, #0x92
	ldr r2, [r4, #0xc]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	str r1, [sp, #0x18]
	ldr r1, [r4, #0xc]
	ldr r1, [r1]
	str r1, [sp, #0x1c]
	bl ov103_021ED2B8
	add r1, sp, #0xc
	strb r0, [r1, #0x14]
	ldrb r0, [r1, #0x14]
	cmp r0, #4
	bne _021ECFD0
	mov r0, #5
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #9
	ldr r1, [r4, #0xc]
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	mov r3, #0x12
	bl sub_020185FC
	mov r1, #0x91
	ldr r2, [r4, #0xc]
	lsl r1, r1, #2
	str r0, [r2, r1]
	add sp, #0x24
	pop {r3, r4, pc}
_021ECFD0:
	mov r0, #0xb
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r0, #9
	ldr r1, [r4, #0xc]
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	mov r3, #0x12
	bl sub_020185FC
	ldr r2, [r4, #0xc]
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r2, r1]
	add sp, #0x24
	pop {r3, r4, pc}
	nop
_021ECFF8: .word _021EEB34
	thumb_func_end ov103_021ECF68

	thumb_func_start ov103_021ECFFC
ov103_021ECFFC: ; 0x021ECFFC
	ldr r1, [r0, #0xc]
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r3, _021ED008 ; =sub_02018680
	ldr r0, [r1, r0]
	bx r3
	.balign 4, 0
_021ED008: .word sub_02018680
	thumb_func_end ov103_021ECFFC

	thumb_func_start ov103_021ED00C
ov103_021ED00C: ; 0x021ED00C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x2e
	mov r4, #0
	ldr r1, [r5, #0xc]
	lsl r0, r0, #4
	strh r4, [r1, r0]
	add r6, r4, #0
	mov r7, #0xff
_021ED01E:
	ldr r0, [r5, #0xc]
	add r2, r4, #0
	add r1, r0, r4
	mov r0, #0xb3
	lsl r0, r0, #2
	strb r7, [r1, r0]
	ldr r0, [r5, #4]
	mov r1, #0
	mov r3, #0x9d
	bl Mailbox_AllocAndFetchMailI
	ldr r1, [r5, #0xc]
	add r2, r1, r6
	mov r1, #0x9f
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r5, #0xc]
	add r1, r0, r6
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl Mail_TypeIsValid
	cmp r0, #1
	bne _021ED070
	mov r0, #0x2e
	ldr r1, [r5, #0xc]
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	add r1, r1, r0
	mov r0, #0xb3
	lsl r0, r0, #2
	strb r4, [r1, r0]
	mov r1, #0x2e
	ldr r0, [r5, #0xc]
	lsl r1, r1, #4
	ldrh r1, [r0, r1]
	add r2, r1, #1
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r2, [r0, r1]
_021ED070:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #0x14
	blo _021ED01E
	mov r0, #0x2e
	ldr r4, [r5, #0xc]
	lsl r0, r0, #4
	ldrh r1, [r4, r0]
	cmp r1, #0
	bne _021ED08C
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021ED08C:
	sub r0, r1, #1
	mov r1, #0xa
	bl _s32_div_f
	ldr r1, _021ED09C ; =0x000002E2
	strh r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021ED09C: .word 0x000002E2
	thumb_func_end ov103_021ED00C

	thumb_func_start ov103_021ED0A0
ov103_021ED0A0: ; 0x021ED0A0
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, #0x9f
	add r6, r0, #0
	add r5, r4, #0
	lsl r7, r7, #2
_021ED0AC:
	ldr r0, [r6, #0xc]
	add r0, r0, r5
	ldr r0, [r0, r7]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x14
	blo _021ED0AC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021ED0A0

	thumb_func_start ov103_021ED0C0
ov103_021ED0C0: ; 0x021ED0C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r1, [r5, #0x1c]
	mov r0, #0xa
	mov r4, #0
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #0xb3
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	add r0, r0, r2
	str r0, [sp]
	lsl r0, r2, #0x10
	lsr r7, r0, #0x10
	add r6, r4, #0
_021ED0E2:
	ldr r0, [sp]
	ldrb r3, [r0, r6]
	cmp r3, #0xff
	bne _021ED0F6
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #4]
	bl sub_0201980C
	b _021ED10A
_021ED0F6:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov103_021EE468
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #4]
	bl sub_020197F4
_021ED10A:
	add r0, r7, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #0xa
	blo _021ED0E2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED0C0

	thumb_func_start ov103_021ED124
ov103_021ED124: ; 0x021ED124
	push {r4, lr}
	add r4, r0, #0
	ldrb r3, [r4, #0x1f]
	mov r1, #0xa
	mov r2, #0x14
	bl ov103_021EE468
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	ldr r0, [r0, #4]
	mov r2, #4
	mov r3, #7
	bl sub_020196E8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED124

	thumb_func_start ov103_021ED144
ov103_021ED144: ; 0x021ED144
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r1, #0xb9
	ldr r0, [r5, #0xc]
	lsl r1, r1, #2
	add r4, r0, r1
	ldrb r2, [r4, #2]
	cmp r2, #0
	beq _021ED162
	cmp r2, #1
	beq _021ED1B8
	cmp r2, #2
	beq _021ED222
	b _021ED234
_021ED162:
	ldrb r2, [r4]
	lsl r3, r2, #0x1f
	lsr r3, r3, #0x1f
	bne _021ED182
	lsl r2, r2, #0x18
	lsr r2, r2, #0x19
	lsl r2, r2, #2
	add r0, r0, r2
	sub r1, #0x8c
	ldr r0, [r0, r1]
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	b _021ED1B0
_021ED182:
	ldrb r1, [r4, #6]
	str r1, [sp]
	ldrb r1, [r4, #7]
	str r1, [sp, #4]
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	str r1, [sp, #8]
	ldrb r1, [r4]
	ldrb r2, [r4, #4]
	ldrb r3, [r4, #5]
	lsl r1, r1, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	ldrb r1, [r4]
	ldr r0, [r5, #0xc]
	lsl r1, r1, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
_021ED1B0:
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _021ED234
_021ED1B8:
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #4
	bne _021ED234
	ldrb r0, [r4]
	lsl r2, r0, #0x1f
	lsr r2, r2, #0x1f
	bne _021ED1E6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	ldr r2, [r5, #0xc]
	lsl r0, r0, #2
	add r0, r2, r0
	sub r1, #0x8c
	ldr r0, [r0, r1]
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	b _021ED216
_021ED1E6:
	ldrb r0, [r4, #6]
	str r0, [sp]
	ldrb r0, [r4, #7]
	str r0, [sp, #4]
	ldrb r0, [r4, #1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4]
	ldr r0, [r5, #0xc]
	ldrb r2, [r4, #4]
	lsl r1, r1, #0x18
	ldrb r3, [r4, #5]
	ldr r0, [r0]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	ldrb r1, [r4]
	ldr r0, [r5, #0xc]
	lsl r1, r1, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
_021ED216:
	mov r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _021ED234
_021ED222:
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _021ED234
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_021ED234:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED144

	thumb_func_start ov103_021ED23C
ov103_021ED23C: ; 0x021ED23C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x4f
	mov r1, #0x9d
	bl NARC_ctor
	add r4, r0, #0
	ldrb r0, [r5, #0x1f]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl Mail_GetType
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r1, r6, #0
	ldr r2, [r2]
	add r0, r4, #0
	add r1, #0xc
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0x9d
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x9d
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r6, #0x18
	ldr r2, [r2]
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED23C

	thumb_func_start ov103_021ED2B8
ov103_021ED2B8: ; 0x021ED2B8
	push {r3, lr}
	ldr r0, [r0, #8]
	ldr r0, [r0]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	cmp r0, #0
	ble _021ED2CE
	mov r0, #4
	pop {r3, pc}
_021ED2CE:
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED2B8

	thumb_func_start ov103_021ED2D4
ov103_021ED2D4: ; 0x021ED2D4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	lsl r2, r1, #2
	ldr r1, _021ED310 ; =ov103_021EECA8
	ldr r1, [r1, r2]
	blx r1
	str r0, [r4]
	cmp r0, #0x19
	bne _021ED2EE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021ED2EE:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021ED30C
	ldr r0, [r0, #4]
	bl sub_02019934
	ldr r0, [r5, #0xc]
	bl ov103_021EDF68
	mov r0, #0x95
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_0200D020
_021ED30C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021ED310: .word ov103_021EECA8
	thumb_func_end ov103_021ED2D4

	thumb_func_start ov103_021ED314
ov103_021ED314: ; 0x021ED314
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0
	bl GX_EngineASetLayers
	mov r0, #0
	bl GX_EngineBSetLayers
	ldr r0, _021ED3D4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _021ED3D8 ; =0x04001050
	strh r1, [r0]
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	ldr r2, _021ED3DC ; =0x04000304
	ldr r0, _021ED3E0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #3
	mov r1, #0x9d
	lsl r2, r0, #0x11
	bl CreateHeap
	mov r1, #0x2f
	mov r0, #0x9d
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x2f
	mov r1, #0
	lsl r2, r2, #4
	str r0, [r4, #0xc]
	bl MI_CpuFill8
	add r0, r4, #0
	bl ov103_021ED00C
	bl ov103_021EC9D8
	add r0, r4, #0
	bl ov103_021EC9E8
	add r0, r4, #0
	bl ov103_021ECC1C
	add r0, r4, #0
	bl ov103_021ECD18
	add r0, r4, #0
	bl ov103_021EE390
	add r0, r4, #0
	bl ov103_021ECD68
	add r0, r4, #0
	bl ov103_021EDEA8
	add r0, r4, #0
	bl ov103_021ECE80
	add r0, r4, #0
	bl ov103_021EEA48
	ldr r0, [r4, #0xc]
	bl ov103_021ECE18
	add r0, r4, #0
	bl ov103_021EE550
	add r0, r4, #0
	bl ov103_021EE644
	add r0, r4, #0
	bl ov103_021ED0C0
	add r0, r4, #0
	bl ov103_021ECEEC
	ldr r0, _021ED3E4 ; =ov103_021EC9B4
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r0, [r4, #0x28]
	pop {r4, pc}
	nop
_021ED3D4: .word 0x04000050
_021ED3D8: .word 0x04001050
_021ED3DC: .word 0x04000304
_021ED3E0: .word 0xFFFF7FFF
_021ED3E4: .word ov103_021EC9B4
	thumb_func_end ov103_021ED314

	thumb_func_start ov103_021ED3E8
ov103_021ED3E8: ; 0x021ED3E8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov103_021ECF48
	ldr r0, [r4, #0xc]
	bl ov103_021ECE54
	add r0, r4, #0
	bl ov103_021EEAA0
	add r0, r4, #0
	bl ov103_021ECE94
	add r0, r4, #0
	bl ov103_021EDF50
	add r0, r4, #0
	bl ov103_021ECE0C
	add r0, r4, #0
	bl ov103_021EE3C0
	add r0, r4, #0
	bl ov103_021ECBBC
	add r0, r4, #0
	bl ov103_021ED0A0
	bl sub_02021238
	ldr r1, _021ED458 ; =0x04000050
	mov r0, #0
	strh r0, [r1]
	ldr r1, _021ED45C ; =0x04001050
	strh r0, [r1]
	bl GX_EngineASetLayers
	mov r0, #0
	bl GX_EngineBSetLayers
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #0x9d
	bl DestroyHeap
	ldr r0, [r4, #0x28]
	pop {r4, pc}
	nop
_021ED458: .word 0x04000050
_021ED45C: .word 0x04001050
	thumb_func_end ov103_021ED3E8

	thumb_func_start ov103_021ED460
ov103_021ED460: ; 0x021ED460
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021ED476
	mov r0, #0xbb
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, pc}
_021ED476:
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED460

	thumb_func_start ov103_021ED47C
ov103_021ED47C: ; 0x021ED47C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8d
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021ED4C4
	ldr r1, [r4, #0xc]
	ldr r0, _021ED4C8 ; =0x00000235
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _021ED49E
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED49E:
	bl System_GetTouchNew
	cmp r0, #1
	bne _021ED4B0
	ldr r0, _021ED4CC ; =0x000005DC
	bl PlaySE
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED4B0:
	ldr r0, _021ED4D0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021ED4C4
	ldr r0, _021ED4CC ; =0x000005DC
	bl PlaySE
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED4C4:
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021ED4C8: .word 0x00000235
_021ED4CC: .word 0x000005DC
_021ED4D0: .word gSystem
	thumb_func_end ov103_021ED47C

	thumb_func_start ov103_021ED4D4
ov103_021ED4D4: ; 0x021ED4D4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8e
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021ED4EE
	cmp r0, #2
	beq _021ED50E
	b _021ED52E
_021ED4EE:
	mov r0, #0x8e
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_020169CC
	mov r1, #0x8f
	ldr r2, [r4, #0xc]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r4, #0
	lsl r2, r1, #3
	ldr r1, _021ED534 ; =ov103_021EEC68
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
_021ED50E:
	mov r0, #0x8e
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_020169CC
	mov r1, #0x8f
	ldr r2, [r4, #0xc]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r4, #0
	lsl r2, r1, #3
	ldr r1, _021ED538 ; =ov103_021EEC68 + 4
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
_021ED52E:
	mov r0, #4
	pop {r4, pc}
	nop
_021ED534: .word ov103_021EEC68
_021ED538: .word ov103_021EEC68 + 4
	thumb_func_end ov103_021ED4D4

	thumb_func_start ov103_021ED53C
ov103_021ED53C: ; 0x021ED53C
	push {r4, lr}
	add r4, r0, #0
	bl ov103_021ED144
	cmp r0, #0
	bne _021ED54C
	ldr r0, [r4, #0x28]
	pop {r4, pc}
_021ED54C:
	mov r0, #5
	pop {r4, pc}
	thumb_func_end ov103_021ED53C

	thumb_func_start ov103_021ED550
ov103_021ED550: ; 0x021ED550
	push {r3, lr}
	ldr r2, [r0, #0x18]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021ED564 ; =ov103_021EEC78
	ldr r1, [r1, r3]
	blx r1
	mov r0, #7
	pop {r3, pc}
	.balign 4, 0
_021ED564: .word ov103_021EEC78
	thumb_func_end ov103_021ED550

	thumb_func_start ov103_021ED568
ov103_021ED568: ; 0x021ED568
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl OverlayManager_run
	cmp r0, #0
	bne _021ED57A
	mov r0, #7
	pop {r4, pc}
_021ED57A:
	ldr r0, [r4, #0x10]
	bl OverlayManager_delete
	ldr r2, [r4, #0x18]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021ED5A0 ; =ov103_021EEC78 + 4
	add r0, r4, #0
	ldr r1, [r1, r3]
	blx r1
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x18]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _021ED5A4 ; =ov103_021EEC78 + 8
	ldr r0, [r0, r2]
	pop {r4, pc}
	.balign 4, 0
_021ED5A0: .word ov103_021EEC78 + 4
_021ED5A4: .word ov103_021EEC78 + 8
	thumb_func_end ov103_021ED568

	thumb_func_start ov103_021ED5A8
ov103_021ED5A8: ; 0x021ED5A8
	ldr r3, _021ED5B0 ; =ov103_021EDA14
	mov r1, #9
	bx r3
	nop
_021ED5B0: .word ov103_021EDA14
	thumb_func_end ov103_021ED5A8

	thumb_func_start ov103_021ED5B4
ov103_021ED5B4: ; 0x021ED5B4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov103_021EEA24
	cmp r0, #0
	beq _021ED5C6
	cmp r0, #1
	beq _021ED5E6
	b _021ED60C
_021ED5C6:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0
	beq _021ED5E2
	sub r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED5E2:
	mov r0, #9
	pop {r3, r4, r5, pc}
_021ED5E6:
	ldr r1, [r4, #0xc]
	ldr r0, _021ED744 ; =0x000002E2
	ldrh r2, [r4, #0x1c]
	ldrh r0, [r1, r0]
	cmp r2, r0
	beq _021ED608
	add r0, r2, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED608:
	mov r0, #9
	pop {r3, r4, r5, pc}
_021ED60C:
	mov r0, #0x9e
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02019BE4
	mov r1, #2
	add r5, r0, #0
	mvn r1, r1
	cmp r5, r1
	bhi _021ED654
	blo _021ED626
	b _021ED734
_021ED626:
	cmp r5, #0xa
	bhi _021ED64C
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021ED636: ; jump table
	.short _021ED666 - _021ED636 - 2 ; case 0
	.short _021ED666 - _021ED636 - 2 ; case 1
	.short _021ED666 - _021ED636 - 2 ; case 2
	.short _021ED666 - _021ED636 - 2 ; case 3
	.short _021ED666 - _021ED636 - 2 ; case 4
	.short _021ED666 - _021ED636 - 2 ; case 5
	.short _021ED666 - _021ED636 - 2 ; case 6
	.short _021ED666 - _021ED636 - 2 ; case 7
	.short _021ED666 - _021ED636 - 2 ; case 8
	.short _021ED666 - _021ED636 - 2 ; case 9
	.short _021ED6A0 - _021ED636 - 2 ; case 10
_021ED64C:
	mov r0, #3
	mvn r0, r0
	cmp r5, r0
	b _021ED73A
_021ED654:
	add r0, r1, #1
	cmp r5, r0
	bhi _021ED65E
	beq _021ED6A0
	b _021ED73A
_021ED65E:
	add r0, r1, #2
	cmp r5, r0
	beq _021ED6B2
	b _021ED73A
_021ED666:
	ldrh r1, [r4, #0x1c]
	ldr r0, [r4, #0xc]
	add r3, r0, r5
	add r2, r1, #0
	mov r0, #0xa
	mul r2, r0
	mov r1, #0xb3
	add r2, r3, r2
	lsl r1, r1, #2
	ldrb r2, [r2, r1]
	cmp r2, #0xff
	beq _021ED73A
	strb r5, [r4, #0x1e]
	ldr r2, [r4, #0xc]
	add r3, r2, r5
	ldrh r2, [r4, #0x1c]
	mul r0, r2
	add r0, r3, r0
	ldrb r0, [r0, r1]
	strb r0, [r4, #0x1f]
	ldr r0, _021ED748 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0xc
	bl ov103_021EDA98
	pop {r3, r4, r5, pc}
_021ED6A0:
	ldr r0, _021ED748 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #3
	mov r2, #0xa
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED6B2:
	mov r0, #0x9e
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02019F74
	ldr r1, _021ED74C ; =gSystem
	mov r2, #0x10
	ldr r1, [r1, #0x4c]
	tst r2, r1
	beq _021ED6FE
	cmp r0, #1
	beq _021ED6DC
	cmp r0, #3
	beq _021ED6DC
	cmp r0, #5
	beq _021ED6DC
	cmp r0, #7
	beq _021ED6DC
	cmp r0, #9
	bne _021ED6FE
_021ED6DC:
	ldr r3, [r4, #0xc]
	ldr r2, _021ED744 ; =0x000002E2
	ldrh r5, [r4, #0x1c]
	ldrh r2, [r3, r2]
	cmp r5, r2
	beq _021ED6FE
	add r0, r5, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED6FE:
	mov r2, #0x20
	tst r1, r2
	beq _021ED73A
	cmp r0, #0
	beq _021ED718
	cmp r0, #2
	beq _021ED718
	cmp r0, #4
	beq _021ED718
	cmp r0, #6
	beq _021ED718
	cmp r0, #8
	bne _021ED73A
_021ED718:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0
	beq _021ED73A
	sub r0, r0, #1
	strh r0, [r4, #0x1c]
	ldr r0, _021ED740 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xb
	bl ov103_021EDB18
	pop {r3, r4, r5, pc}
_021ED734:
	ldr r0, _021ED740 ; =0x000005DC
	bl PlaySE
_021ED73A:
	mov r0, #9
	pop {r3, r4, r5, pc}
	nop
_021ED740: .word 0x000005DC
_021ED744: .word 0x000002E2
_021ED748: .word 0x000005DD
_021ED74C: .word gSystem
	thumb_func_end ov103_021ED5B4

	thumb_func_start ov103_021ED750
ov103_021ED750: ; 0x021ED750
	ldr r3, _021ED75C ; =ov103_021EDA40
	mov r1, #0x19
	str r1, [r0, #0x28]
	mov r1, #1
	bx r3
	nop
_021ED75C: .word ov103_021EDA40
	thumb_func_end ov103_021ED750

	thumb_func_start ov103_021ED760
ov103_021ED760: ; 0x021ED760
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0x1c]
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _021ED780
	mov r1, #0
	add r2, r1, #0
	bl ov103_021EE0CC
	mov r1, #1
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl ov103_021EE0CC
	b _021ED792
_021ED780:
	mov r1, #0
	mov r2, #1
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #1
	mov r2, #0
	bl ov103_021EE0CC
_021ED792:
	add r0, r4, #0
	bl ov103_021EE644
	add r0, r4, #0
	bl ov103_021ED0C0
	mov r0, #9
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED760

	thumb_func_start ov103_021ED7A4
ov103_021ED7A4: ; 0x021ED7A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ov103_021EDB60
	add r0, r4, #0
	bl ov103_021ED124
	add r0, r4, #0
	bl ov103_021EE860
	add r0, r4, #0
	bl ov103_021EE824
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xd
	bl ov103_021EDA70
	pop {r4, pc}
	thumb_func_end ov103_021ED7A4

	thumb_func_start ov103_021ED7D8
ov103_021ED7D8: ; 0x021ED7D8
	push {r3, lr}
	bl ov103_021ECF68
	mov r0, #0xe
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED7D8

	thumb_func_start ov103_021ED7E4
ov103_021ED7E4: ; 0x021ED7E4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x91
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_020186A4
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bhi _021ED816
	bhs _021ED89E
	cmp r0, #3
	bhi _021ED8CA
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021ED80E: ; jump table
	.short _021ED81E - _021ED80E - 2 ; case 0
	.short _021ED84A - _021ED80E - 2 ; case 1
	.short _021ED864 - _021ED80E - 2 ; case 2
	.short _021ED89E - _021ED80E - 2 ; case 3
_021ED816:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	b _021ED8CA
_021ED81E:
	add r0, r4, #0
	bl ov103_021ECFFC
	add r0, r4, #0
	bl ov103_021EE888
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #1
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	bl ov103_021EE60C
	ldr r0, [r4, #0xc]
	bl ov103_021EE374
	add r0, r4, #0
	bl ov103_021EDBB0
	mov r0, #0xf
	pop {r4, pc}
_021ED84A:
	add r0, r4, #0
	bl ov103_021ECFFC
	add r0, r4, #0
	mov r1, #0
	bl ov103_021EE8A8
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x11
	bl ov103_021EDA70
	pop {r4, pc}
_021ED864:
	add r0, r4, #0
	bl ov103_021ECFFC
	ldrb r0, [r4, #0x1f]
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl Mail_GetType
	bl MailToItemId
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0xe
	mov r3, #0
	bl ov103_021EDC68
	mov r0, #0
	str r0, [r4, #0x18]
	mov r0, #6
	str r0, [r4, #0x28]
	add r0, r4, #0
	mov r1, #1
	bl ov103_021EDA40
	pop {r4, pc}
_021ED89E:
	add r0, r4, #0
	bl ov103_021ECFFC
	add r0, r4, #0
	bl ov103_021EE888
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	ldr r0, [r0, #4]
	bl sub_0201980C
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov103_021EDB60
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #1
	bl ov103_021EE0CC
	mov r0, #9
	pop {r4, pc}
_021ED8CA:
	mov r0, #0xe
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED7E4

	thumb_func_start ov103_021ED8D0
ov103_021ED8D0: ; 0x021ED8D0
	push {r4, lr}
	add r4, r0, #0
	bl ov103_021EEB04
	cmp r0, #1
	bne _021ED8EE
	ldr r0, _021ED8F4 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x10
	bl ov103_021EDB18
	pop {r4, pc}
_021ED8EE:
	mov r0, #0xf
	pop {r4, pc}
	nop
_021ED8F4: .word 0x000005DD
	thumb_func_end ov103_021ED8D0

	thumb_func_start ov103_021ED8F8
ov103_021ED8F8: ; 0x021ED8F8
	push {r4, lr}
	add r4, r0, #0
	bl ov103_021EDBC8
	mov r0, #0x9e
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r4, #0
	bl ov103_021EEAC8
	ldr r0, [r4, #0xc]
	bl ov103_021EE628
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	ldr r0, [r0, #4]
	bl sub_0201980C
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov103_021EDB60
	mov r0, #9
	pop {r4, pc}
	thumb_func_end ov103_021ED8F8

	thumb_func_start ov103_021ED930
ov103_021ED930: ; 0x021ED930
	ldr r3, _021ED938 ; =ov103_021EDA84
	mov r1, #0
	bx r3
	nop
_021ED938: .word ov103_021EDA84
	thumb_func_end ov103_021ED930

	thumb_func_start ov103_021ED93C
ov103_021ED93C: ; 0x021ED93C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #2
	bl ov103_021EE8A8
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x13
	bl ov103_021EDA70
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021ED93C

	thumb_func_start ov103_021ED954
ov103_021ED954: ; 0x021ED954
	ldr r3, _021ED95C ; =ov103_021EDA84
	mov r1, #1
	bx r3
	nop
_021ED95C: .word ov103_021EDA84
	thumb_func_end ov103_021ED954

	thumb_func_start ov103_021ED960
ov103_021ED960: ; 0x021ED960
	add r1, r0, #0
	add r1, #0x20
	ldrb r1, [r1]
	cmp r1, #6
	beq _021ED972
	mov r1, #0x15
	str r1, [r0, #0x28]
	mov r0, #0
	bx lr
_021ED972:
	mov r1, #2
	str r1, [r0, #0x18]
	mov r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end ov103_021ED960

	thumb_func_start ov103_021ED97C
ov103_021ED97C: ; 0x021ED97C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ov103_021EDB60
	add r0, r4, #0
	mov r1, #0x16
	bl ov103_021EDA14
	pop {r4, pc}
	thumb_func_end ov103_021ED97C

	thumb_func_start ov103_021ED99C
ov103_021ED99C: ; 0x021ED99C
	push {r4, lr}
	add r4, r0, #0
	bl ov103_021EE860
	add r0, r4, #0
	bl ov103_021EDE7C
	pop {r4, pc}
	thumb_func_end ov103_021ED99C

	thumb_func_start ov103_021ED9AC
ov103_021ED9AC: ; 0x021ED9AC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x24]
	cmp r1, #0
	bne _021ED9BE
	mov r0, #0x15
	str r0, [r4, #0x28]
	mov r0, #0
	pop {r4, pc}
_021ED9BE:
	add r3, r4, #0
	add r3, #0x21
	ldrb r3, [r3]
	ldrh r2, [r4, #0x22]
	mov r1, #0xb
	lsl r3, r3, #0x19
	lsr r3, r3, #0x19
	bl ov103_021EDC68
	mov r0, #3
	str r0, [r4, #0x18]
	mov r0, #6
	pop {r4, pc}
	thumb_func_end ov103_021ED9AC

	thumb_func_start ov103_021ED9D8
ov103_021ED9D8: ; 0x021ED9D8
	push {r4, lr}
	add r4, r0, #0
	bl ov103_021EE888
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	ldr r0, [r0, #4]
	bl sub_0201980C
	mov r0, #0x9e
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_02019F74
	add r1, r0, #0
	add r0, r4, #0
	bl ov103_021EEAC8
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #1
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov103_021EDB60
	mov r0, #9
	pop {r4, pc}
	thumb_func_end ov103_021ED9D8

	thumb_func_start ov103_021EDA14
ov103_021EDA14: ; 0x021EDA14
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	add r4, r1, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x9d
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xbb
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	str r4, [r1, r0]
	mov r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov103_021EDA14

	thumb_func_start ov103_021EDA40
ov103_021EDA40: ; 0x021EDA40
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x9d
	str r0, [sp, #8]
	mov r0, #0
	add r4, r1, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xbb
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	str r4, [r1, r0]
	mov r0, #2
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDA40

	thumb_func_start ov103_021EDA70
ov103_021EDA70: ; 0x021EDA70
	push {r3, r4}
	ldr r4, [r0, #0xc]
	ldr r3, _021EDA80 ; =0x00000235
	strb r1, [r4, r3]
	str r2, [r0, #0x28]
	mov r0, #3
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021EDA80: .word 0x00000235
	thumb_func_end ov103_021EDA70

	thumb_func_start ov103_021EDA84
ov103_021EDA84: ; 0x021EDA84
	push {r3, lr}
	mov r2, #0x8f
	ldr r3, [r0, #0xc]
	lsl r2, r2, #2
	str r1, [r3, r2]
	bl ov103_021ECEA4
	mov r0, #4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDA84

	thumb_func_start ov103_021EDA98
ov103_021EDA98: ; 0x021EDA98
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r2, #0
	add r2, sp, #0
	ldr r0, [r0, #4]
	add r2, #1
	add r3, sp, #0
	add r6, r1, #0
	bl sub_02019B1C
	ldr r0, [r5, #0xc]
	add r3, sp, #0
	ldr r0, [r0, #4]
	add r1, r6, #0
	add r2, sp, #4
	add r3, #2
	bl sub_02019B44
	mov r0, #0xb9
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	ldrb r2, [r1]
	mov r0, #1
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1]
	ldrb r3, [r1]
	mov r2, #0xfe
	bic r3, r2
	mov r2, #4
	orr r2, r3
	strb r2, [r1]
	ldrb r3, [r1, #1]
	mov r2, #0xf
	bic r3, r2
	mov r2, #2
	orr r2, r3
	strb r2, [r1, #1]
	ldrb r3, [r1, #1]
	mov r2, #0xf0
	bic r3, r2
	mov r2, #0x10
	orr r2, r3
	strb r2, [r1, #1]
	mov r3, #0
	strb r3, [r1, #2]
	strb r3, [r1, #3]
	add r2, sp, #0
	ldrsb r0, [r2, r0]
	strb r0, [r1, #4]
	ldrsb r0, [r2, r3]
	strb r0, [r1, #5]
	ldrh r0, [r2, #4]
	strb r0, [r1, #6]
	ldrh r0, [r2, #2]
	strb r0, [r1, #7]
	str r4, [r5, #0x28]
	mov r0, #5
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov103_021EDA98

	thumb_func_start ov103_021EDB18
ov103_021EDB18: ; 0x021EDB18
	push {r4, r5}
	mov r3, #0xb9
	ldr r4, [r0, #0xc]
	lsl r3, r3, #2
	add r4, r4, r3
	ldrb r5, [r4]
	mov r3, #1
	lsl r1, r1, #0x18
	bic r5, r3
	strb r5, [r4]
	lsr r1, r1, #0x18
	lsl r1, r1, #0x19
	ldrb r3, [r4]
	mov r5, #0xfe
	lsr r1, r1, #0x18
	bic r3, r5
	orr r1, r3
	strb r1, [r4]
	ldrb r3, [r4, #1]
	mov r1, #0xf
	bic r3, r1
	mov r1, #1
	orr r1, r3
	strb r1, [r4, #1]
	ldrb r3, [r4, #1]
	mov r1, #0xf0
	bic r3, r1
	strb r3, [r4, #1]
	mov r1, #0
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	str r2, [r0, #0x28]
	mov r0, #5
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov103_021EDB18

	thumb_func_start ov103_021EDB60
ov103_021EDB60: ; 0x021EDB60
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	cmp r1, #1
	bne _021EDB90
	mov r1, #0
	mov r2, #1
	bl ov103_021EE110
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov103_021EE110
	mov r0, #0xc
	str r0, [sp]
	mov r1, #4
	ldr r0, _021EDBAC ; =0x04000050
	mov r2, #8
	add r3, r1, #0
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
_021EDB90:
	mov r1, #0
	add r2, r1, #0
	bl ov103_021EE110
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov103_021EE110
	ldr r0, _021EDBAC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021EDBAC: .word 0x04000050
	thumb_func_end ov103_021EDB60

	thumb_func_start ov103_021EDBB0
ov103_021EDBB0: ; 0x021EDBB0
	push {r4, lr}
	add r4, r0, #0
	bl ov103_021ED23C
	add r0, r4, #0
	bl ov103_021EE930
	add r0, r4, #0
	bl ov103_021EE210
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDBB0

	thumb_func_start ov103_021EDBC8
ov103_021EDBC8: ; 0x021EDBC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #4
	mov r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #5
	mov r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #6
	mov r2, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #4
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0xc]
	mov r1, #5
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	pop {r4, pc}
	thumb_func_end ov103_021EDBC8

	thumb_func_start ov103_021EDC00
ov103_021EDC00: ; 0x021EDC00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl Sav2_Bag_get
	add r4, r0, #0
	ldrb r0, [r5, #0x1f]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl Mail_GetType
	bl MailToItemId
	strh r0, [r5, #0x22]
	ldrh r1, [r5, #0x22]
	add r0, r4, #0
	mov r2, #1
	mov r3, #0x9d
	bl Bag_AddItem
	cmp r0, #1
	bne _021EDC46
	add r0, r5, #0
	add r0, #0x21
	ldrb r1, [r0]
	mov r0, #0x80
	add r5, #0x21
	bic r1, r0
	strb r1, [r5]
	pop {r3, r4, r5, pc}
_021EDC46:
	add r0, r5, #0
	add r0, #0x21
	ldrb r1, [r0]
	mov r0, #0x80
	add r5, #0x21
	orr r0, r1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDC00

	thumb_func_start ov103_021EDC58
ov103_021EDC58: ; 0x021EDC58
	ldr r3, _021EDC64 ; =Mailbox_DeleteSlotI
	add r2, r0, #0
	ldr r0, [r2, #4]
	mov r1, #0
	ldrb r2, [r2, #0x1f]
	bx r3
	.balign 4, 0
_021EDC64: .word Mailbox_DeleteSlotI
	thumb_func_end ov103_021EDC58

	thumb_func_start ov103_021EDC68
ov103_021EDC68: ; 0x021EDC68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x9c
	mov r1, #0x44
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5]
	mov r1, #0
	str r0, [r4, #0xc]
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	add r0, r4, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x24
	strb r6, [r0]
	strh r7, [r4, #0x28]
	ldr r0, [r5, #8]
	add r1, r4, #0
	ldr r0, [r0, #4]
	add r1, #0x26
	str r0, [r4, #0x1c]
	ldr r0, [r5, #8]
	ldr r0, [r0, #8]
	str r0, [r4, #0x20]
	ldr r0, [sp]
	strb r0, [r1]
	str r4, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021EDC68

	thumb_func_start ov103_021EDCC8
ov103_021EDCC8: ; 0x021EDCC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021EDCDC ; =_0210159C
	ldr r1, [r4, #0x14]
	mov r2, #0x9c
	bl OverlayManager_new
	str r0, [r4, #0x10]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021EDCDC: .word _0210159C
	thumb_func_end ov103_021EDCC8

	thumb_func_start ov103_021EDCE0
ov103_021EDCE0: ; 0x021EDCE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r0, #0x26
	ldrb r4, [r0]
	cmp r4, #5
	bhi _021EDD08
	ldr r0, [r5, #8]
	ldr r0, [r0]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldrb r1, [r5, #0x1f]
	ldr r0, [r5, #4]
	mov r3, #0x9c
	bl sub_02091004
_021EDD08:
	ldr r0, [r5, #0x14]
	bl FreeToHeap
	mov r0, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDCE0

	thumb_func_start ov103_021EDD14
ov103_021EDD14: ; 0x021EDD14
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x21
	ldrb r1, [r1]
	ldr r2, [r0, #0x14]
	mov r3, #0x7f
	bic r1, r3
	add r3, r2, #0
	add r3, #0x26
	ldrb r4, [r3]
	mov r3, #0x7f
	add r2, #0x27
	and r3, r4
	orr r3, r1
	add r1, r0, #0
	add r1, #0x21
	strb r3, [r1]
	add r1, r0, #0
	ldrb r2, [r2]
	add r1, #0x20
	strb r2, [r1]
	ldr r0, [r0, #0x14]
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov103_021EDD14

	thumb_func_start ov103_021EDD48
ov103_021EDD48: ; 0x021EDD48
	push {r3, lr}
	ldr r0, [r0, #0x14]
	bl FreeToHeap
	mov r0, #8
	pop {r3, pc}
	thumb_func_end ov103_021EDD48

	thumb_func_start ov103_021EDD54
ov103_021EDD54: ; 0x021EDD54
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrh r0, [r4, #0x22]
	bl ItemToMailId
	add r3, r0, #0
	mov r0, #0x9c
	add r2, r4, #0
	str r0, [sp]
	add r2, #0x21
	ldrb r2, [r2]
	ldr r0, [r4, #8]
	mov r1, #2
	lsl r2, r2, #0x19
	ldr r0, [r0]
	lsr r2, r2, #0x19
	bl sub_02090E68
	ldr r1, [r4, #8]
	mov r2, #0x9c
	ldr r1, [r1, #8]
	str r1, [r0, #0x1c]
	str r0, [r4, #0x14]
	ldr r0, _021EDD94 ; =ov103_021EEC58
	ldr r1, [r4, #0x14]
	bl OverlayManager_new
	str r0, [r4, #0x10]
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021EDD94: .word ov103_021EEC58
	thumb_func_end ov103_021EDD54

	thumb_func_start ov103_021EDD98
ov103_021EDD98: ; 0x021EDD98
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl sub_02090F6C
	str r0, [r4, #0x24]
	cmp r0, #1
	bne _021EDDD8
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	add r1, #0x21
	ldrb r1, [r1]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [r4, #0x14]
	bl sub_02090F70
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl Sav2_Bag_get
	ldrh r1, [r4, #0x22]
	mov r2, #1
	mov r3, #0x9c
	bl Bag_TakeItem
_021EDDD8:
	ldr r0, [r4, #0x14]
	bl sub_02090F90
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDD98

	thumb_func_start ov103_021EDDE4
ov103_021EDDE4: ; 0x021EDDE4
	push {r4, lr}
	add r4, r0, #0
	bl ov103_021EDC00
	add r0, r4, #0
	bl ov103_021EDC58
	add r0, r4, #0
	bl ov103_021ED0A0
	add r0, r4, #0
	bl ov103_021ED00C
	mov r1, #0x2e
	ldr r0, [r4, #0xc]
	lsl r1, r1, #4
	ldrh r1, [r0, r1]
	cmp r1, #0xa
	bhi _021EDE1C
	mov r1, #0
	add r2, r1, #0
	bl ov103_021EE0CC
	ldr r0, [r4, #0xc]
	mov r1, #1
	mov r2, #0
	bl ov103_021EE0CC
_021EDE1C:
	ldr r1, [r4, #0xc]
	ldr r0, _021EDE58 ; =0x000002E2
	ldrh r1, [r1, r0]
	ldrh r0, [r4, #0x1c]
	cmp r0, r1
	bls _021EDE2E
	strh r1, [r4, #0x1c]
	mov r0, #0
	strb r0, [r4, #0x1e]
_021EDE2E:
	add r0, r4, #0
	bl ov103_021EE644
	add r0, r4, #0
	bl ov103_021ED0C0
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	ldr r0, [r0, #4]
	bl sub_0201980C
	add r0, r4, #0
	mov r1, #1
	bl ov103_021EE8A8
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x12
	bl ov103_021EDA70
	pop {r4, pc}
	.balign 4, 0
_021EDE58: .word 0x000002E2
	thumb_func_end ov103_021EDDE4

	thumb_func_start ov103_021EDE5C
ov103_021EDE5C: ; 0x021EDE5C
	push {r4, lr}
	add r4, r0, #0
	ldrh r2, [r4, #0x22]
	mov r1, #9
	mov r3, #0
	bl ov103_021EDC68
	mov r1, #1
	str r1, [r4, #0x18]
	mov r0, #6
	str r0, [r4, #0x28]
	add r0, r4, #0
	bl ov103_021EDA40
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDE5C

	thumb_func_start ov103_021EDE7C
ov103_021EDE7C: ; 0x021EDE7C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x21
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	bne _021EDE94
	mov r1, #3
	bl ov103_021EE8A8
	b _021EDE9A
_021EDE94:
	mov r1, #4
	bl ov103_021EE8A8
_021EDE9A:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x18
	bl ov103_021EDA70
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDE7C

	thumb_func_start ov103_021EDEA8
ov103_021EDEA8: ; 0x021EDEA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r5, #0xc]
	bl ov103_021EE13C
	ldr r0, [r5, #0xc]
	bl ov103_021EDF88
	ldr r0, [r5, #0xc]
	bl ov103_021EE2E0
	ldr r0, [r5, #0xc]
	bl ov103_021EE160
	mov r7, #0
	ldr r6, _021EDF4C ; =ov103_021EED58
	add r4, r7, #0
_021EDEDA:
	ldr r0, [r5, #0xc]
	add r1, r6, #0
	bl ov103_021EE048
	ldr r1, [r5, #0xc]
	add r7, r7, #1
	add r2, r1, r4
	mov r1, #0x96
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r6, #0x34
	add r4, r4, #4
	cmp r7, #7
	blo _021EDEDA
	ldr r0, [r5, #0xc]
	add r1, #0x88
	ldrh r1, [r0, r1]
	cmp r1, #0xa
	bhi _021EDF14
	mov r1, #0
	add r2, r1, #0
	bl ov103_021EE0CC
	ldr r0, [r5, #0xc]
	mov r1, #1
	mov r2, #0
	bl ov103_021EE0CC
	b _021EDF2C
_021EDF14:
	ldrh r1, [r5, #0x1c]
	cmp r1, #0
	bne _021EDF24
	mov r1, #0
	add r2, r1, #0
	bl ov103_021EE0CC
	b _021EDF2C
_021EDF24:
	mov r1, #1
	mov r2, #0
	bl ov103_021EE0CC
_021EDF2C:
	ldr r0, [r5, #0xc]
	mov r1, #4
	mov r2, #0
	bl ov103_021EE0CC
	ldr r0, [r5, #0xc]
	mov r1, #5
	mov r2, #0
	bl ov103_021EE0CC
	ldr r0, [r5, #0xc]
	mov r1, #6
	mov r2, #0
	bl ov103_021EE0CC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EDF4C: .word ov103_021EED58
	thumb_func_end ov103_021EDEA8

	thumb_func_start ov103_021EDF50
ov103_021EDF50: ; 0x021EDF50
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl ov103_021EE094
	ldr r0, [r4, #0xc]
	bl ov103_021EE028
	ldr r0, [r4, #0xc]
	bl ov103_021EE150
	pop {r4, pc}
	thumb_func_end ov103_021EDF50

	thumb_func_start ov103_021EDF68
ov103_021EDF68: ; 0x021EDF68
	push {r4, r5, r6, lr}
	mov r6, #0x96
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_021EDF72:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021EDF7C
	bl sub_0200DC18
_021EDF7C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blo _021EDF72
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov103_021EDF68

	thumb_func_start ov103_021EDF88
ov103_021EDF88: ; 0x021EDF88
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r4, r0, #0
	mov r0, #0x9d
	bl sub_0200CF18
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	mov r7, #0x95
	lsl r7, r7, #2
	add r2, sp, #0x2c
	ldr r3, _021EE01C ; =ov103_021EED38
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _021EE020 ; =ov103_021EED0C
	stmia r2!, {r0, r1}
	add r3, sp, #0x18
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
	ldr r3, _021EE024 ; =ov103_021EED20
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #7
	bl sub_0200CFF4
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl sub_0200D3F8
	sub r0, r7, #4
	ldr r0, [r4, r0]
	bl sub_0200CF6C
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE01C: .word ov103_021EED38
_021EE020: .word ov103_021EED0C
_021EE024: .word ov103_021EED20
	thumb_func_end ov103_021EDF88

	thumb_func_start ov103_021EE028
ov103_021EE028: ; 0x021EE028
	push {r4, lr}
	mov r1, #0x25
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D998
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE028

	thumb_func_start ov103_021EE048
ov103_021EE048: ; 0x021EE048
	push {r3, lr}
	add r2, r1, #0
	add r3, r0, #0
	ldr r0, [r2, #0x10]
	cmp r0, #1
	bne _021EE064
	mov r1, #0x25
	lsl r1, r1, #4
	ldr r0, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	bl sub_0200D734
	pop {r3, pc}
_021EE064:
	mov r1, #0x25
	lsl r1, r1, #4
	ldr r0, [r3, r1]
	add r1, r1, #4
	ldr r1, [r3, r1]
	mov r3, #2
	lsl r3, r3, #0x14
	bl sub_0200D740
	pop {r3, pc}
	thumb_func_end ov103_021EE048

	thumb_func_start ov103_021EE078
ov103_021EE078: ; 0x021EE078
	push {r3, r4, r5, lr}
	lsl r5, r1, #2
	mov r1, #0x96
	lsl r1, r1, #2
	add r4, r0, r1
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _021EE090
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4, r5]
_021EE090:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE078

	thumb_func_start ov103_021EE094
ov103_021EE094: ; 0x021EE094
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021EE09A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov103_021EE078
	add r4, r4, #1
	cmp r4, #7
	blo _021EE09A
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE094

	thumb_func_start ov103_021EE0AC
ov103_021EE0AC: ; 0x021EE0AC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0x96
	lsl r2, r2, #2
	lsl r4, r1, #2
	add r5, r0, r2
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r5, r4]
	add r1, r6, #0
	bl sub_0200DC4C
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE0AC

	thumb_func_start ov103_021EE0CC
ov103_021EE0CC: ; 0x021EE0CC
	push {r3, lr}
	cmp r2, #1
	bne _021EE0E4
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, pc}
_021EE0E4:
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE0CC

	thumb_func_start ov103_021EE0F8
ov103_021EE0F8: ; 0x021EE0F8
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _021EE10C ; =sub_0200DDB8
	bx r3
	nop
_021EE10C: .word sub_0200DDB8
	thumb_func_end ov103_021EE0F8

	thumb_func_start ov103_021EE110
ov103_021EE110: ; 0x021EE110
	push {r3, lr}
	cmp r2, #1
	bne _021EE128
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200E0FC
	pop {r3, pc}
_021EE128:
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200E0FC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE110

	thumb_func_start ov103_021EE13C
ov103_021EE13C: ; 0x021EE13C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x14
	mov r1, #0x9d
	bl NARC_ctor
	mov r1, #0x9d
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov103_021EE13C

	thumb_func_start ov103_021EE150
ov103_021EE150: ; 0x021EE150
	mov r1, #0x9d
	lsl r1, r1, #2
	ldr r3, _021EE15C ; =NARC_dtor
	ldr r0, [r0, r1]
	bx r3
	nop
_021EE15C: .word NARC_dtor
	thumb_func_end ov103_021EE150

	thumb_func_start ov103_021EE160
ov103_021EE160: ; 0x021EE160
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, _021EE208 ; =0x000037F0
	add r5, r0, #0
	mov r6, #0
	mov r7, #2
_021EE16C:
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl GetMonIconNaixEx
	str r6, [sp]
	add r3, r0, #0
	str r7, [sp, #4]
	mov r0, #0x25
	mov r1, #0x95
	mov r2, #0x9d
	str r4, [sp, #8]
	lsl r0, r0, #4
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200D504
	ldr r0, _021EE20C ; =0x000037F2
	add r4, r4, #1
	cmp r4, r0
	bls _021EE16C
	bl sub_02074490
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021EE208 ; =0x000037F0
	mov r2, #0x25
	lsl r2, r2, #4
	str r0, [sp, #0xc]
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x24
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200D5D4
	bl sub_02074494
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021EE208 ; =0x000037F0
	mov r2, #0x25
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x24
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200D6EC
	bl sub_02074498
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021EE208 ; =0x000037F0
	mov r2, #0x25
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x24
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200D71C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE208: .word 0x000037F0
_021EE20C: .word 0x000037F2
	thumb_func_end ov103_021EE160

	thumb_func_start ov103_021EE210
ov103_021EE210: ; 0x021EE210
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldrb r0, [r5, #0x1f]
	mov r4, #0
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r7, [r1, r0]
	add r6, r4, #0
_021EE228:
	add r0, r7, #0
	bl sub_0202B4E4
	lsl r1, r4, #0x18
	add r3, r0, #0
	add r0, r7, #0
	lsr r1, r1, #0x18
	mov r2, #2
	bl sub_0202B404
	add r1, sp, #0x10
	strh r0, [r1]
	add r0, r1, #0
	ldrh r1, [r0]
	ldr r0, _021EE2DC ; =0x0000FFFF
	cmp r1, r0
	beq _021EE254
	lsl r0, r1, #0x14
	lsr r0, r0, #0x14
	str r0, [sp, #4]
	cmp r0, #7
	bne _021EE260
_021EE254:
	ldr r0, [r5, #0xc]
	add r1, r4, #4
	mov r2, #0
	bl ov103_021EE0CC
	b _021EE2CE
_021EE260:
	ldr r0, [r5, #0xc]
	add r1, r0, r6
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	mov r1, #2
	bl NNS_G2dGetImageLocation
	str r0, [sp, #8]
	mov r0, #0x9d
	str r0, [sp]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [sp, #4]
	mov r2, #0
	add r3, sp, #0x14
	bl GfGfxLoader_GetCharDataFromOpenNarc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	mov r1, #2
	ldr r0, [r0, #0x14]
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r0, [sp, #0x14]
	mov r2, #2
	ldr r0, [r0, #0x14]
	ldr r1, [sp, #8]
	lsl r2, r2, #8
	bl GXS_LoadOBJ
	ldr r0, [sp, #0xc]
	bl FreeToHeap
	ldr r0, [r5, #0xc]
	add r1, r0, r6
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0x10
	ldrh r1, [r1]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	ldr r0, [r5, #0xc]
	add r1, r4, #4
	mov r2, #1
	bl ov103_021EE0CC
_021EE2CE:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #3
	blo _021EE228
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EE2DC: .word 0x0000FFFF
	thumb_func_end ov103_021EE210

	thumb_func_start ov103_021EE2E0
ov103_021EE2E0: ; 0x021EE2E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0xfc
	mov r1, #0x9d
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EE36C ; =0x000037F3
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #7
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021EE370 ; =0x000037F1
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0xa
	bl sub_0200D5D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _021EE370 ; =0x000037F1
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #8
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021EE370 ; =0x000037F1
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #9
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EE36C: .word 0x000037F3
_021EE370: .word 0x000037F1
	thumb_func_end ov103_021EE2E0

	thumb_func_start ov103_021EE374
ov103_021EE374: ; 0x021EE374
	push {r4, lr}
	add r4, r0, #0
	mov r1, #2
	mov r2, #0xe0
	mov r3, #0xb0
	bl ov103_021EE0F8
	add r0, r4, #0
	mov r1, #2
	mov r2, #4
	bl ov103_021EE0AC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE374

	thumb_func_start ov103_021EE390
ov103_021EE390: ; 0x021EE390
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #4
	mov r1, #0x9d
	bl FontID_Alloc
	mov r6, #0
	ldr r4, _021EE3BC ; =ov103_021EEEC4
	add r5, r6, #0
_021EE3A2:
	ldr r1, [r7, #0xc]
	add r2, r4, #0
	ldr r0, [r1]
	add r1, #0x48
	add r1, r1, r5
	bl AddWindow
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #0x1e
	blo _021EE3A2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EE3BC: .word ov103_021EEEC4
	thumb_func_end ov103_021EE390

	thumb_func_start ov103_021EE3C0
ov103_021EE3C0: ; 0x021EE3C0
	push {r4, r5, r6, lr}
	mov r4, #0
	add r6, r0, #0
	add r5, r4, #0
_021EE3C8:
	ldr r0, [r6, #0xc]
	add r0, #0x48
	add r0, r0, r5
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x1e
	blo _021EE3C8
	mov r0, #4
	bl FontID_Release
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE3C0

	thumb_func_start ov103_021EE3E4
ov103_021EE3E4: ; 0x021EE3E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #1
	bne _021EE402
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	sub r5, r5, r0
	b _021EE412
_021EE402:
	cmp r0, #2
	bne _021EE412
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r0, r0, #1
	sub r5, r5, r0
_021EE412:
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r2, r7, #0
	add r3, r5, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov103_021EE3E4

	thumb_func_start ov103_021EE430
ov103_021EE430: ; 0x021EE430
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	add r4, r2, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [sp, #0x28]
	add r5, #0x48
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r3, [sp, #0x24]
	str r0, [sp, #8]
	lsl r0, r4, #4
	add r0, r5, r0
	add r1, r6, #0
	bl ov103_021EE3E4
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov103_021EE430

	thumb_func_start ov103_021EE468
ov103_021EE468: ; 0x021EE468
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	str r1, [sp, #0x18]
	ldr r1, [r5, #0xc]
	lsl r0, r3, #2
	add r6, r1, #0
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r6, #0x48
	lsl r7, r2, #4
	str r0, [sp, #0x20]
	bl Mail_GetAuthorNamePtr
	add r1, r0, #0
	mov r0, #0x23
	ldr r2, [r5, #0xc]
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	bl CopyU16ArrayToString
	mov r4, #0
	str r4, [sp, #0x1c]
_021EE49A:
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r5, #0xc]
	mov r2, #0
	add r0, r6, r7
	add r1, #8
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r5, #0xc]
	mov r2, #0
	add r0, r6, r7
	add r1, #0x28
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	ldr r0, [sp, #0x1c]
	add r4, #8
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blo _021EE49A
	ldr r0, [sp, #0x20]
	bl Mail_GetAuthorGender
	cmp r0, #0
	bne _021EE514
	mov r0, #4
	str r0, [sp]
	ldr r0, _021EE548 ; =0x00030200
	mov r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r1, #0x23
	ldr r3, [r5, #0xc]
	lsl r1, r1, #4
	ldr r1, [r3, r1]
	add r0, r6, r7
	add r3, r2, #0
	bl ov103_021EE3E4
	b _021EE530
_021EE514:
	mov r0, #4
	str r0, [sp]
	ldr r0, _021EE54C ; =0x00050400
	mov r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r1, #0x23
	ldr r3, [r5, #0xc]
	lsl r1, r1, #4
	ldr r1, [r3, r1]
	add r0, r6, r7
	add r3, r2, #0
	bl ov103_021EE3E4
_021EE530:
	add r0, r6, r7
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [r5, #0xc]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #4]
	add r2, r6, r7
	bl sub_02019A60
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_021EE548: .word 0x00030200
_021EE54C: .word 0x00050400
	thumb_func_end ov103_021EE468

	thumb_func_start ov103_021EE550
ov103_021EE550: ; 0x021EE550
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x76
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0xc]
	mov r1, #0x2c
	str r1, [sp]
	mov r3, #0
	str r3, [sp, #4]
	ldr r1, _021EE604 ; =0x00010200
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	mov r1, #0x8a
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	mov r2, #0x19
	bl ov103_021EE430
	mov r0, #0x76
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x66
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0xc]
	mov r1, #0x18
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldr r1, _021EE608 ; =0x000F0100
	mov r2, #0x15
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	mov r1, #0x8a
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	mov r3, #3
	bl ov103_021EE430
	mov r0, #0x66
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x6a
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0xc]
	mov r1, #0x18
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r3, #4
	ldr r1, _021EE608 ; =0x000F0100
	str r3, [sp, #8]
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	mov r1, #0x8a
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	mov r2, #0x16
	bl ov103_021EE430
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021EE604: .word 0x00010200
_021EE608: .word 0x000F0100
	thumb_func_end ov103_021EE550

	thumb_func_start ov103_021EE60C
ov103_021EE60C: ; 0x021EE60C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE60C

	thumb_func_start ov103_021EE628
ov103_021EE628: ; 0x021EE628
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE628

	thumb_func_start ov103_021EE644
ov103_021EE644: ; 0x021EE644
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x6e
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x8a
	ldr r3, [r5, #0xc]
	lsl r2, r2, #2
	ldr r0, [r3, r2]
	add r2, #8
	ldr r2, [r3, r2]
	mov r1, #2
	bl ReadMsgDataIntoString
	mov r1, #0x6e
	ldr r2, [r5, #0xc]
	mov r3, #0
	ldr r0, _021EE780 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	mov r0, #2
	lsl r1, r1, #2
	str r0, [sp, #8]
	add r0, r2, r1
	add r1, #0x78
	ldr r1, [r2, r1]
	mov r2, #0x14
	bl ov103_021EE3E4
	mov r1, #0x23
	ldr r2, [r5, #0xc]
	lsl r1, r1, #4
	mov r0, #0
	ldr r1, [r2, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0
	lsl r4, r0, #0x10
	mov r0, #0x8b
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r2, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	ldrh r2, [r5, #0x1c]
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r0, #0x8a
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl NewString_ReadMsgData
	mov r1, #0x8b
	ldr r2, [r5, #0xc]
	lsl r1, r1, #2
	add r6, r0, #0
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r1, #0x23
	ldr r2, [r5, #0xc]
	lsl r1, r1, #4
	mov r0, #0
	ldr r1, [r2, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r6, #0x6e
	ldr r1, [r5, #0xc]
	mov r3, #0
	ldr r0, _021EE780 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	lsl r6, r6, #2
	add r0, r1, r6
	str r3, [sp, #8]
	add r6, #0x78
	ldr r1, [r1, r6]
	lsr r4, r4, #0x11
	mov r6, #0x14
	sub r6, r6, r4
	sub r2, r6, r2
	bl ov103_021EE3E4
	ldr r6, [r5, #0xc]
	mov r1, #0
	mov r2, #0x8b
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	lsl r2, r2, #2
	ldr r0, [r6, r2]
	add r2, #0xb6
	ldrh r2, [r6, r2]
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r0, #0x8a
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl NewString_ReadMsgData
	mov r1, #0x8b
	ldr r2, [r5, #0xc]
	lsl r1, r1, #2
	add r6, r0, #0
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r1, #0x6e
	ldr r2, [r5, #0xc]
	mov r3, #0
	ldr r0, _021EE780 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	lsl r1, r1, #2
	add r0, r2, r1
	str r3, [sp, #8]
	add r1, #0x78
	ldr r1, [r2, r1]
	add r4, #0x14
	add r2, r4, #0
	bl ov103_021EE3E4
	mov r0, #0x6e
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021EE780: .word 0x00010200
	thumb_func_end ov103_021EE644

	thumb_func_start ov103_021EE784
ov103_021EE784: ; 0x021EE784
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	ldrb r0, [r6, #0x1f]
	ldr r1, [r6, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r5, [r1, r0]
	mov r0, #8
	mov r1, #0x9d
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	bl Mail_GetAuthorNamePtr
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16ArrayToString
	add r0, r5, #0
	bl Mail_GetAuthorGender
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x8b
	ldr r1, [r6, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	add r2, r4, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE784

	thumb_func_start ov103_021EE7DC
ov103_021EE7DC: ; 0x021EE7DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r6, #0x72
	ldr r4, [r5, #0xc]
	lsl r6, r6, #2
	add r0, r4, r6
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _021EE820 ; =0x0001020F
	add r2, r6, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, r6
	ldr r4, [r5, #0xc]
	add r2, #0x68
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r1, r6, #0
	ldr r2, [r5, #0xc]
	add r1, #0x6c
	strb r0, [r2, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EE820: .word 0x0001020F
	thumb_func_end ov103_021EE7DC

	thumb_func_start ov103_021EE824
ov103_021EE824: ; 0x021EE824
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0
	bl ov103_021EE784
	mov r0, #0x8a
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #9
	bl NewString_ReadMsgData
	mov r1, #0x8b
	ldr r2, [r5, #0xc]
	lsl r1, r1, #2
	add r4, r0, #0
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl ov103_021EE7DC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE824

	thumb_func_start ov103_021EE860
ov103_021EE860: ; 0x021EE860
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r2, _021EE884 ; =0x000003E2
	mov r1, #1
	mov r3, #0xd
	bl DrawFrameAndWindow2
	mov r0, #0x72
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	.balign 4, 0
_021EE884: .word 0x000003E2
	thumb_func_end ov103_021EE860

	thumb_func_start ov103_021EE888
ov103_021EE888: ; 0x021EE888
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	ldr r1, [r4, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0]
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov103_021EE888

	thumb_func_start ov103_021EE8A8
ov103_021EE8A8: ; 0x021EE8A8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #4
	bhi _021EE928
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EE8BC: ; jump table
	.short _021EE8C6 - _021EE8BC - 2 ; case 0
	.short _021EE8DA - _021EE8BC - 2 ; case 1
	.short _021EE8EE - _021EE8BC - 2 ; case 2
	.short _021EE902 - _021EE8BC - 2 ; case 3
	.short _021EE916 - _021EE8BC - 2 ; case 4
_021EE8C6:
	mov r2, #0x8a
	ldr r3, [r4, #0xc]
	lsl r2, r2, #2
	ldr r0, [r3, r2]
	add r2, #8
	ldr r2, [r3, r2]
	mov r1, #0xa
	bl ReadMsgDataIntoString
	b _021EE928
_021EE8DA:
	mov r2, #0x8a
	ldr r3, [r4, #0xc]
	lsl r2, r2, #2
	ldr r0, [r3, r2]
	add r2, #8
	ldr r2, [r3, r2]
	mov r1, #0xb
	bl ReadMsgDataIntoString
	b _021EE928
_021EE8EE:
	mov r2, #0x8a
	ldr r3, [r4, #0xc]
	lsl r2, r2, #2
	ldr r0, [r3, r2]
	add r2, #8
	ldr r2, [r3, r2]
	mov r1, #0xc
	bl ReadMsgDataIntoString
	b _021EE928
_021EE902:
	mov r2, #0x8a
	ldr r3, [r4, #0xc]
	lsl r2, r2, #2
	ldr r0, [r3, r2]
	add r2, #8
	ldr r2, [r3, r2]
	mov r1, #0xd
	bl ReadMsgDataIntoString
	b _021EE928
_021EE916:
	mov r2, #0x8a
	ldr r3, [r4, #0xc]
	lsl r2, r2, #2
	ldr r0, [r3, r2]
	add r2, #8
	ldr r2, [r3, r2]
	mov r1, #0xe
	bl ReadMsgDataIntoString
_021EE928:
	add r0, r4, #0
	bl ov103_021EE7DC
	pop {r4, pc}
	thumb_func_end ov103_021EE8A8

	thumb_func_start ov103_021EE930
ov103_021EE930: ; 0x021EE930
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r4, #0
	add r5, r0, #0
	add r7, r4, #0
_021EE93A:
	add r0, r4, #0
	add r0, #0x1a
	lsl r6, r0, #4
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	add r0, #0x48
	add r0, r0, r6
	bl FillWindowPixelBuffer
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x1a
	add r2, r4, #0
	bl ov103_021EE9C8
	ldr r0, [r5, #0xc]
	add r0, #0x48
	add r0, r0, r6
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	cmp r4, #3
	blo _021EE93A
	mov r0, #0x86
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0x1f]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl Mail_GetAuthorNamePtr
	add r1, r0, #0
	mov r0, #0x23
	ldr r2, [r5, #0xc]
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	bl CopyU16ArrayToString
	mov r1, #0x86
	ldr r4, [r5, #0xc]
	mov r3, #1
	ldr r0, _021EE9C4 ; =0x00010200
	str r3, [sp]
	str r0, [sp, #4]
	mov r2, #0
	lsl r1, r1, #2
	add r0, r4, r1
	str r2, [sp, #8]
	add r1, #0x18
	ldr r1, [r4, r1]
	bl ov103_021EE3E4
	mov r0, #0x86
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021EE9C4: .word 0x00010200
	thumb_func_end ov103_021EE930

	thumb_func_start ov103_021EE9C8
ov103_021EE9C8: ; 0x021EE9C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #0x1f]
	add r4, r1, #0
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	add r1, r1, r0
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl Mail_GetUnk20Array
	add r6, r0, #0
	bl MailMsg_IsInit
	cmp r0, #0
	beq _021EEA1C
	add r0, r6, #0
	mov r1, #0x9d
	bl MailMsg_GetExpandedString
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021EEA20 ; =0x00010200
	mov r2, #0
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldr r1, [r5, #0xc]
	lsl r0, r4, #4
	add r1, #0x48
	add r0, r1, r0
	add r1, r6, #0
	add r3, r2, #0
	bl ov103_021EE3E4
	add r0, r6, #0
	bl String_dtor
_021EEA1C:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021EEA20: .word 0x00010200
	thumb_func_end ov103_021EE9C8

	thumb_func_start ov103_021EEA24
ov103_021EEA24: ; 0x021EEA24
	push {r3, lr}
	ldr r1, [r0, #0xc]
	ldr r0, _021EEA40 ; =0x000002E2
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _021EEA36
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
_021EEA36:
	ldr r0, _021EEA44 ; =ov103_021EEFBC
	bl sub_02025224
	pop {r3, pc}
	nop
_021EEA40: .word 0x000002E2
_021EEA44: .word ov103_021EEFBC
	thumb_func_end ov103_021EEA24

	thumb_func_start ov103_021EEA48
ov103_021EEA48: ; 0x021EEA48
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5, #0xc]
	ldr r0, _021EEA90 ; =0x000002E2
	ldrh r1, [r1, r0]
	ldrh r0, [r5, #0x1c]
	cmp r0, r1
	bls _021EEA60
	strh r1, [r5, #0x1c]
	mov r4, #0
	b _021EEA62
_021EEA60:
	ldrb r4, [r5, #0x1e]
_021EEA62:
	mov r0, #1
	str r0, [sp]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x9d
	str r0, [sp, #8]
	ldr r0, _021EEA94 ; =ov103_021EEFD8
	ldr r1, _021EEA98 ; =ov103_021EF008
	ldr r2, _021EEA9C ; =ov103_021EEFC8
	add r3, r5, #0
	bl sub_02019BA4
	mov r1, #0x9e
	ldr r2, [r5, #0xc]
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r0, r5, #0
	add r1, r4, #0
	bl ov103_021EEAC8
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021EEA90: .word 0x000002E2
_021EEA94: .word ov103_021EEFD8
_021EEA98: .word ov103_021EF008
_021EEA9C: .word ov103_021EEFC8
	thumb_func_end ov103_021EEA48

	thumb_func_start ov103_021EEAA0
ov103_021EEAA0: ; 0x021EEAA0
	ldr r1, [r0, #0xc]
	mov r0, #0x9e
	lsl r0, r0, #2
	ldr r3, _021EEAAC ; =sub_02019BDC
	ldr r0, [r1, r0]
	bx r3
	.balign 4, 0
_021EEAAC: .word sub_02019BDC
	thumb_func_end ov103_021EEAA0

	thumb_func_start ov103_021EEAB0
ov103_021EEAB0: ; 0x021EEAB0
	bx lr
	.balign 4, 0
	thumb_func_end ov103_021EEAB0

	thumb_func_start ov103_021EEAB4
ov103_021EEAB4: ; 0x021EEAB4
	bx lr
	.balign 4, 0
	thumb_func_end ov103_021EEAB4

	thumb_func_start ov103_021EEAB8
ov103_021EEAB8: ; 0x021EEAB8
	ldr r3, _021EEABC ; =ov103_021EEAC8
	bx r3
	.balign 4, 0
_021EEABC: .word ov103_021EEAC8
	thumb_func_end ov103_021EEAB8

	thumb_func_start ov103_021EEAC0
ov103_021EEAC0: ; 0x021EEAC0
	ldr r3, _021EEAC4 ; =ov103_021EEAC8
	bx r3
	.balign 4, 0
_021EEAC4: .word ov103_021EEAC8
	thumb_func_end ov103_021EEAC0

	thumb_func_start ov103_021EEAC8
ov103_021EEAC8: ; 0x021EEAC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x9e
	ldr r2, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	add r4, r1, #0
	bl sub_0201A018
	add r3, r0, #0
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl ov103_021EE0F8
	cmp r4, #0xa
	ldr r0, [r5, #0xc]
	bne _021EEAF8
	mov r1, #2
	mov r2, #4
	bl ov103_021EE0AC
	pop {r3, r4, r5, pc}
_021EEAF8:
	mov r1, #2
	mov r2, #5
	bl ov103_021EE0AC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov103_021EEAC8

	thumb_func_start ov103_021EEB04
ov103_021EEB04: ; 0x021EEB04
	push {r3, lr}
	ldr r0, _021EEB2C ; =ov103_021EEFB4
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EEB18
	mov r0, #1
	pop {r3, pc}
_021EEB18:
	ldr r0, _021EEB30 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021EEB26
	mov r0, #1
	pop {r3, pc}
_021EEB26:
	mov r0, #0
	pop {r3, pc}
	nop
_021EEB2C: .word ov103_021EEFB4
_021EEB30: .word gSystem
	thumb_func_end ov103_021EEB04

	.rodata

_021EEB34:
	.byte 0x03, 0x00, 0x00, 0x0C, 0x00, 0x00, 0xFD, 0x02, 0xE2, 0x02, 0xA9, 0x00

ov103_021EEB40: ; 0x021EEB40
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EEB50: ; 0x021EEB50
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EEB6C: ; 0x021EEB6C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EEB88: ; 0x021EEB88
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov103_021EEBA4: ; 0x021EEBA4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EEBC0: ; 0x021EEBC0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EEBDC: ; 0x021EEBDC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EEBF8: ; 0x021EEBF8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov103_021EEC14: ; 0x021EEC14
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EEC30: ; 0x021EEC30
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov103_021EEC58: ; 0x021EEC58
	.word ov55_021E5924, ov55_021E598C, ov55_021E5AE8, FS_OVERLAY_ID(OVY_55)

ov103_021EEC68: ; 0x021EEC68
	.word ov103_021EDDE4, ov103_021ED9D8
	.word ov103_021EDE5C, ov103_021EDE7C

ov103_021EEC78: ; 0x021EEC78
	.word ov103_021EDCC8, ov103_021EDCE0, 0
	.word ov103_021EDCC8, ov103_021EDD14, 20
	.word ov103_021EDD54, ov103_021EDD98, 23
	.word ov103_021EDCC8, ov103_021EDD48, 0

ov103_021EECA8: ; 0x021EECA8
	.word ov103_021ED314
	.word ov103_021ED3E8
	.word ov103_021ED460
	.word ov103_021ED47C
	.word ov103_021ED4D4
	.word ov103_021ED53C
	.word ov103_021ED550
	.word ov103_021ED568
	.word ov103_021ED5A8
	.word ov103_021ED5B4
	.word ov103_021ED750
	.word ov103_021ED760
	.word ov103_021ED7A4
	.word ov103_021ED7D8
	.word ov103_021ED7E4
	.word ov103_021ED8D0
	.word ov103_021ED8F8
	.word ov103_021ED930
	.word ov103_021ED93C
	.word ov103_021ED954
	.word ov103_021ED960
	.word ov103_021ED97C
	.word ov103_021ED99C
	.word ov103_021ED9AC
	.word ov103_021ED9D8

ov103_021EED0C: ; 0x021EED0C
	.byte 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov103_021EED20: ; 0x021EED20
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov103_021EED38: ; 0x021EED38
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov103_021EED58: ; 0x021EED58
	.byte 0x18, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xF3, 0x37, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xF3, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x10, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xF3, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xF3, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xF1, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00
	.byte 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x00, 0xA0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xF1, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xF2, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00, 0xF0, 0x37, 0x00, 0x00
	.byte 0xF0, 0x37, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov103_021EEEC4: ; 0x021EEEC4
	.byte 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xF0, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xE0, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xD0, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xC0, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xB0, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xA0, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x90, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x80, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x70, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x60, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x50, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x40, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x30, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x20, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0x10, 0x03, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0x00, 0x03, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xF0, 0x02, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xE0, 0x02, 0x02, 0x04, 0x01, 0x08, 0x02, 0x01, 0xD0, 0x02, 0x02, 0x04, 0x01, 0x08
	.byte 0x02, 0x01, 0xC0, 0x02, 0x01, 0x04, 0x01, 0x08, 0x02, 0x01, 0xF0, 0x03, 0x01, 0x19, 0x15, 0x06
	.byte 0x02, 0x0F, 0xE4, 0x03, 0x01, 0x19, 0x15, 0x06, 0x02, 0x0F, 0xD8, 0x03, 0x01, 0x0A, 0x15, 0x05
	.byte 0x02, 0x0F, 0xCE, 0x03, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0E, 0x01, 0x00, 0x06, 0x01, 0x01, 0x0B
	.byte 0x02, 0x0F, 0x01, 0x00, 0x04, 0x03, 0x03, 0x1A, 0x04, 0x01, 0x01, 0x00, 0x04, 0x03, 0x08, 0x1A
	.byte 0x04, 0x01, 0x69, 0x00, 0x04, 0x03, 0x0D, 0x1A, 0x04, 0x01, 0xD1, 0x00, 0x04, 0x15, 0x14, 0x08
	.byte 0x02, 0x01, 0x39, 0x01

ov103_021EEFB4: ; 0x021EEFB4
	.byte 0xA0, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov103_021EEFBC: ; 0x021EEFBC
	.byte 0xA0, 0xBF, 0x08, 0x27
	.byte 0xA0, 0xBF, 0x28, 0x47, 0xFF, 0x00, 0x00, 0x00

ov103_021EEFC8: ; 0x021EEFC8
	.word ov103_021EEAB0
	.word ov103_021EEAB4
	.word ov103_021EEAB8
	.word ov103_021EEAC0

ov103_021EEFD8: ; 0x021EEFD8
	.byte 0x00, 0x1F, 0x08, 0x77, 0x00, 0x1F, 0x88, 0xF4
	.byte 0x20, 0x3F, 0x08, 0x77, 0x20, 0x3F, 0x88, 0xF4, 0x40, 0x5F, 0x08, 0x77, 0x40, 0x5F, 0x88, 0xF4
	.byte 0x60, 0x7F, 0x08, 0x77, 0x60, 0x7F, 0x88, 0xF4, 0x80, 0x9F, 0x08, 0x77, 0x80, 0x9F, 0x88, 0xF4
	.byte 0xA0, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov103_021EF008: ; 0x021EF008
	.byte 0x40, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01
	.byte 0xC0, 0x10, 0x00, 0x00, 0x01, 0x03, 0x00, 0x01, 0x40, 0x30, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03
	.byte 0xC0, 0x30, 0x00, 0x00, 0x01, 0x05, 0x02, 0x03, 0x40, 0x50, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05
	.byte 0xC0, 0x50, 0x00, 0x00, 0x03, 0x07, 0x04, 0x05, 0x40, 0x70, 0x00, 0x00, 0x04, 0x08, 0x06, 0x07
	.byte 0xC0, 0x70, 0x00, 0x00, 0x05, 0x09, 0x06, 0x07, 0x40, 0x90, 0x00, 0x00, 0x06, 0x0A, 0x08, 0x09
	.byte 0xC0, 0x90, 0x00, 0x00, 0x07, 0x0A, 0x08, 0x09, 0xE0, 0xB0, 0x00, 0x00, 0x89, 0x0A, 0x0A, 0x0A
	; 0x021EF060
