	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov28_0225D520
ov28_0225D520: ; 0x0225D520
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #3
	str r2, [sp]
	mov r1, #8
	lsl r2, r0, #0xf
	str r3, [sp, #4]
	bl CreateHeap
	ldr r0, _0225D5E4 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	mov r1, #0xd
	ldr r0, _0225D5E8 ; =ov28_0225DC2C
	lsl r1, r1, #6
	mov r2, #0xa
	mov r3, #8
	bl sub_02007200
	add r6, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	str r5, [r4, #0x10]
	ldr r0, [sp]
	str r7, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [sp, #4]
	mov r1, #0
	str r0, [r4, #0x1c]
	mov r0, #0xcf
	str r6, [r4, #0x20]
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, #0x18]
	bl ov01_021E7F54
	mov r1, #0xcd
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0225D5A6
	ldr r0, [r4, #0x18]
	add r1, sp, #8
	bl Fsys_GetFacingObject
	ldr r0, [sp, #8]
	bl MapObject_GetScript
	bl ov01_021F6BD0
	cmp r0, #1
	beq _0225D59E
	ldr r0, [sp, #8]
	bl MapObject_GetGfxID
	bl ov01_021F6BB0
	cmp r0, #1
	bne _0225D5A6
_0225D59E:
	mov r0, #0xcd
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225D5A6:
	mov r0, #0xfd
	mov r1, #8
	bl NARC_ctor
	add r7, r0, #0
	bl ov28_0225D628
	add r0, r5, #0
	bl ov28_0225D650
	add r0, r4, #0
	add r1, r7, #0
	bl ov28_0225D6FC
	add r0, r4, #0
	bl ov28_0225D764
	add r0, r4, #0
	bl ov28_0225D7E0
	add r0, r4, #0
	add r1, r7, #0
	bl ov28_0225D898
	add r0, r7, #0
	bl NARC_dtor
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225D5E4: .word 0x04001050
_0225D5E8: .word ov28_0225DC2C
	thumb_func_end ov28_0225D520

	thumb_func_start ov28_0225D5EC
ov28_0225D5EC: ; 0x0225D5EC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	bl sub_0201F988
	add r4, r0, #0
	bl DowsingMchn_FreeHiddenItemLocs
	add r0, r4, #0
	bl ov28_0225D8D0
	add r0, r4, #0
	bl ov28_0225D878
	add r0, r4, #0
	bl ov28_0225D7C4
	ldr r0, [r4, #0x10]
	bl ov28_0225D6E0
	add r0, r5, #0
	bl sub_02007234
	mov r0, #8
	bl DestroyHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov28_0225D5EC

	thumb_func_start ov28_0225D624
ov28_0225D624: ; 0x0225D624
	mov r0, #1
	bx lr
	thumb_func_end ov28_0225D624

	thumb_func_start ov28_0225D628
ov28_0225D628: ; 0x0225D628
	push {r3, lr}
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #1
	lsl r0, r0, #8
	bl GX_SetBankForSubOBJ
	ldr r2, _0225D648 ; =0x04001000
	ldr r0, _0225D64C ; =0xFFCFFFEF
	ldr r1, [r2]
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0225D648: .word 0x04001000
_0225D64C: .word 0xFFCFFFEF
	thumb_func_end ov28_0225D628

	thumb_func_start ov28_0225D650
ov28_0225D650: ; 0x0225D650
	push {r4, r5, lr}
	sub sp, #0x54
	add r4, r0, #0
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r5, _0225D6D4 ; =ov28_0225EAC0
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
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #8
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0225D6D8 ; =ov28_0225EADC
	add r3, sp, #0x1c
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _0225D6DC ; =ov28_0225EAF8
	add r3, sp, #0
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
	add sp, #0x54
	pop {r4, r5, pc}
	.balign 4, 0
_0225D6D4: .word ov28_0225EAC0
_0225D6D8: .word ov28_0225EADC
_0225D6DC: .word ov28_0225EAF8
	thumb_func_end ov28_0225D650

	thumb_func_start ov28_0225D6E0
ov28_0225D6E0: ; 0x0225D6E0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov28_0225D6E0

	thumb_func_start ov28_0225D6FC
ov28_0225D6FC: ; 0x0225D6FC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r4, r1, #0
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	mov r1, #2
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #3
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov28_0225D6FC

	thumb_func_start ov28_0225D764
ov28_0225D764: ; 0x0225D764
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc4
	mov r3, #8
	bl NewMsgDataFromNarc
	mov r1, #0x11
	add r4, r0, #0
	bl NewString_ReadMsgData
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x12
	bl NewString_ReadMsgData
	mov r1, #0x1a
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x16
	bl NewString_ReadMsgData
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x17
	bl NewString_ReadMsgData
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x15
	bl NewString_ReadMsgData
	mov r1, #0x1b
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl DestroyMsgData
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov28_0225D764

	thumb_func_start ov28_0225D7C4
ov28_0225D7C4: ; 0x0225D7C4
	push {r4, r5, r6, lr}
	mov r6, #0x1a
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_0225D7CE:
	ldr r0, [r5, r6]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blo _0225D7CE
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov28_0225D7C4

	thumb_func_start ov28_0225D7E0
ov28_0225D7E0: ; 0x0225D7E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #4
	mov r1, #8
	bl FontID_Alloc
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r6, _0225D86C ; =ov28_0225EB52
	add r4, r7, r0
	add r5, r7, #0
_0225D7FC:
	ldr r0, [r7, #0x10]
	add r1, r4, #0
	add r2, r6, #0
	bl AddWindow
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D870 ; =0x000F0100
	mov r2, #0x1a
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #4
	mov r3, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [sp, #0x10]
	add r6, #8
	add r0, r0, #1
	add r4, #0x10
	add r5, r5, #4
	str r0, [sp, #0x10]
	cmp r0, #5
	blo _0225D7FC
	mov r0, #0x6d
	lsl r0, r0, #2
	add r2, r7, r0
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	ldr r0, _0225D874 ; =ov28_0225EB7C
	ldrb r0, [r0, r1]
	lsl r0, r0, #4
	add r0, r2, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225D86C: .word ov28_0225EB52
_0225D870: .word 0x000F0100
_0225D874: .word ov28_0225EB7C
	thumb_func_end ov28_0225D7E0

	thumb_func_start ov28_0225D878
ov28_0225D878: ; 0x0225D878
	push {r3, r4, r5, lr}
	mov r1, #0x6d
	lsl r1, r1, #2
	mov r4, #0
	add r5, r0, r1
_0225D882:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #5
	blo _0225D882
	mov r0, #4
	bl FontID_Release
	pop {r3, r4, r5, pc}
	thumb_func_end ov28_0225D878

	thumb_func_start ov28_0225D898
ov28_0225D898: ; 0x0225D898
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #8
	add r1, r5, #0
	add r1, #0x28
	add r2, r0, #0
	bl G2dRenderer_Init
	str r0, [r5, #0x24]
	add r0, r5, #0
	mov r2, #1
	add r0, #0x28
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r5, #0
	bl ov28_0225D8EC
	add r0, r5, #0
	bl ov28_0225DA74
	add r0, r5, #0
	add r1, r4, #0
	bl ov28_0225DB8C
	pop {r3, r4, r5, pc}
	thumb_func_end ov28_0225D898

	thumb_func_start ov28_0225D8D0
ov28_0225D8D0: ; 0x0225D8D0
	push {r4, lr}
	add r4, r0, #0
	bl ov28_0225DBFC
	add r0, r4, #0
	bl ov28_0225DB54
	add r0, r4, #0
	bl ov28_0225D910
	ldr r0, [r4, #0x24]
	bl sub_02024504
	pop {r4, pc}
	thumb_func_end ov28_0225D8D0

	thumb_func_start ov28_0225D8EC
ov28_0225D8EC: ; 0x0225D8EC
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0x15
	add r5, r0, #0
	mov r4, #0
	mov r7, #2
	lsl r6, r6, #4
_0225D8F8:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #8
	bl Create2DGfxResObjMan
	str r0, [r5, r6]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225D8F8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov28_0225D8EC

	thumb_func_start ov28_0225D910
ov28_0225D910: ; 0x0225D910
	push {r4, r5, r6, lr}
	mov r6, #0x15
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_0225D91A:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225D91A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov28_0225D910

	thumb_func_start ov28_0225D92C
ov28_0225D92C: ; 0x0225D92C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [sp, #0x30]
	add r6, r2, #0
	str r0, [sp]
	mov r0, #2
	add r4, r1, #0
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	add r2, r3, #0
	ldr r0, [r4]
	add r1, r6, #0
	mov r3, #1
	bl AddCharResObjFromOpenNarc
	str r0, [r5]
	bl sub_0200ADA4
	ldr r0, [r5]
	bl sub_0200A740
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r6, #0
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r5, #4]
	bl sub_0200B00C
	ldr r0, [r5, #4]
	bl sub_0200A740
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x24]
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	add r1, r6, #0
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #8]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, r6, #0
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov28_0225D92C

	thumb_func_start ov28_0225D9BC
ov28_0225D9BC: ; 0x0225D9BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_0200A7FC
	str r0, [sp, #0x2c]
	ldr r0, [r5, #4]
	bl sub_0200A7FC
	str r0, [sp, #0x30]
	ldr r0, [r5, #8]
	bl sub_0200A7FC
	str r0, [sp, #0x34]
	ldr r0, [r5, #0xc]
	bl sub_0200A7FC
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldr r1, [r4]
	ldr r2, [sp, #0x30]
	str r1, [sp, #0x14]
	ldr r1, [r4, #4]
	ldr r3, [sp, #0x34]
	str r1, [sp, #0x18]
	ldr r1, [r4, #8]
	str r1, [sp, #0x1c]
	ldr r1, [r4, #0xc]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov28_0225D9BC

	thumb_func_start ov28_0225DA1C
ov28_0225DA1C: ; 0x0225DA1C
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r3, #0
	ldr r3, [r0, #0x24]
	lsl r6, r1, #2
	str r3, [sp]
	str r2, [sp, #4]
	ldrb r2, [r5]
	lsl r2, r2, #0xc
	str r2, [sp, #8]
	ldrb r2, [r5, #1]
	lsl r3, r2, #0xc
	mov r2, #1
	lsl r2, r2, #0x14
	add r3, r3, r2
	lsr r2, r2, #8
	str r3, [sp, #0xc]
	mov r3, #0
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r2, sp, #0
	strh r3, [r2, #0x20]
	ldrb r2, [r5, #2]
	str r2, [sp, #0x24]
	mov r2, #2
	str r2, [sp, #0x28]
	mov r2, #8
	str r2, [sp, #0x2c]
	mov r2, #6
	lsl r2, r2, #6
	add r4, r0, r2
	add r0, sp, #0
	bl CreateSprite
	str r0, [r4, r6]
	ldrb r1, [r5, #3]
	ldr r0, [r4, r6]
	bl Set2dSpriteAnimSeqNo
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov28_0225DA1C

	thumb_func_start ov28_0225DA74
ov28_0225DA74: ; 0x0225DA74
	push {r4, r5, lr}
	sub sp, #0x44
	add r5, r0, #0
	mov r0, #0xe
	mov r1, #8
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #7
	str r0, [sp]
	mov r0, #0x44
	str r0, [sp, #4]
	mov r0, #0x45
	str r0, [sp, #8]
	mov r0, #4
	ldr r1, _0225DB40 ; =0x000001F2
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, r1, #0
	str r1, [sp, #0x1c]
	sub r0, #0x92
	sub r1, #0xa2
	add r0, r5, r0
	add r1, r5, r1
	add r2, r4, #0
	mov r3, #0x46
	bl ov28_0225D92C
	add r0, r4, #0
	bl NARC_dtor
	mov r1, #0x16
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x10
	add r1, r5, r1
	add r2, sp, #0x20
	mov r3, #1
	bl ov28_0225D9BC
	ldr r3, _0225DB44 ; =ov28_0225EA9A
	add r0, r5, #0
	mov r1, #0
	add r2, sp, #0x20
	bl ov28_0225DA1C
	ldr r3, _0225DB48 ; =ov28_0225EA9E
	add r0, r5, #0
	mov r1, #1
	add r2, sp, #0x20
	bl ov28_0225DA1C
	ldr r3, _0225DB4C ; =ov28_0225EAA2
	add r0, r5, #0
	mov r1, #2
	add r2, sp, #0x20
	bl ov28_0225DA1C
	ldr r3, _0225DB50 ; =ov28_0225EAA6
	add r0, r5, #0
	mov r1, #3
	add r2, sp, #0x20
	bl ov28_0225DA1C
	ldr r0, [r5, #0x18]
	bl FieldSys_GetPlayerAvatar
	bl sub_0205CB38
	cmp r0, #0
	bne _0225DB22
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xb
	bl Set2dSpriteAnimSeqNo
	add sp, #0x44
	pop {r4, r5, pc}
_0225DB22:
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	add sp, #0x44
	pop {r4, r5, pc}
	nop
_0225DB40: .word 0x000001F2
_0225DB44: .word ov28_0225EA9A
_0225DB48: .word ov28_0225EA9E
_0225DB4C: .word ov28_0225EAA2
_0225DB50: .word ov28_0225EAA6
	thumb_func_end ov28_0225DA74

	thumb_func_start ov28_0225DB54
ov28_0225DB54: ; 0x0225DB54
	push {r4, lr}
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	pop {r4, pc}
	thumb_func_end ov28_0225DB54

	thumb_func_start ov28_0225DB8C
ov28_0225DB8C: ; 0x0225DB8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r2, r1, #0
	add r1, sp, #0x20
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	mov r0, #7
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #9
	ldr r1, _0225DBF8 ; =0x000001F3
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, r1, #0
	str r1, [sp, #0x1c]
	sub r0, #0x83
	sub r1, #0xa3
	add r0, r5, r0
	add r1, r5, r1
	mov r3, #4
	bl ov28_0225D92C
	mov r1, #0x17
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x20
	add r1, r5, r1
	add r2, sp, #0x24
	mov r3, #2
	bl ov28_0225D9BC
	mov r4, #0
	add r6, sp, #0x24
	add r7, sp, #0x20
_0225DBE2:
	add r0, r5, #0
	add r1, r4, #4
	add r2, r6, #0
	add r3, r7, #0
	bl ov28_0225DA1C
	add r4, r4, #1
	cmp r4, #4
	blo _0225DBE2
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DBF8: .word 0x000001F3
	thumb_func_end ov28_0225DB8C

	thumb_func_start ov28_0225DBFC
ov28_0225DBFC: ; 0x0225DBFC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #0x19
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #4
_0225DC08:
	ldr r0, [r5, r6]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225DC08
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	bl sub_0200AEB0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200B0A8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov28_0225DBFC

	thumb_func_start ov28_0225DC2C
ov28_0225DC2C: ; 0x0225DC2C
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x18]
	add r1, r0, #0
	add r1, #0xd2
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	beq _0225DC56
	bl sub_0203E13C
	cmp r0, #0
	beq _0225DC56
	ldr r2, [r4, #0x18]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r2, #0xd2
	bic r1, r0
	strb r1, [r2]
_0225DC56:
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225DC76
	ldr r0, _0225DD1C ; =ov28_0225EA88
	bl sub_0202529C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0225DC76
	mov r0, #0xcf
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225DC76:
	ldr r0, [r4, #0x18]
	bl Fsys_TaskIsRunning
	cmp r0, #1
	beq _0225DC98
	ldr r0, _0225DD1C ; =ov28_0225EA88
	bl sub_02025244
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0225DC98
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225DCD0
_0225DC98:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov28_0225E31C
	add r0, r4, #0
	mov r1, #0
	bl ov28_0225E578
	mov r2, #0x93
	lsl r2, r2, #2
	ldrh r1, [r4, r2]
	ldr r0, _0225DD20 ; =0xFFFF7FFF
	and r0, r1
	strh r0, [r4, r2]
	add r0, r2, #0
	mov r1, #0
	add r0, #0xec
	strh r1, [r4, r0]
	add r0, r2, #0
	add r0, #0xee
	strh r1, [r4, r0]
	add r2, #0xf0
	ldr r0, _0225DD24 ; =0x0000093D
	str r1, [r4, r2]
	bl StopSE
	b _0225DCF6
_0225DCD0:
	cmp r0, #1
	bne _0225DCF6
	add r0, r4, #0
	bl ov28_0225E7D4
	add r0, r4, #0
	bl ov28_0225E1A4
	add r0, r4, #0
	mov r1, #1
	bl ov28_0225E31C
	add r0, r4, #0
	mov r1, #1
	bl ov28_0225E578
	add r0, r4, #0
	bl ov28_0225E730
_0225DCF6:
	add r0, r4, #0
	bl ov28_0225E3BC
	add r0, r4, #0
	bl ov28_0225E43C
	add r0, r4, #0
	bl ov28_0225E900
	add r0, r4, #0
	bl ov28_0225E938
	add r0, r4, #0
	bl ov28_0225E9E0
	ldr r0, [r4, #0x24]
	bl sub_0202457C
	pop {r4, pc}
	.balign 4, 0
_0225DD1C: .word ov28_0225EA88
_0225DD20: .word 0xFFFF7FFF
_0225DD24: .word 0x0000093D
	thumb_func_end ov28_0225DC2C

	thumb_func_start DowsingMchn_GetHiddenItemLocs
DowsingMchn_GetHiddenItemLocs: ; 0x0225DD28
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #8
	bl AllocAndFetchNearbyHiddenItems
	mov r1, #0x81
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end DowsingMchn_GetHiddenItemLocs

	thumb_func_start DowsingMchn_FreeHiddenItemLocs
DowsingMchn_FreeHiddenItemLocs: ; 0x0225DD3C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225DD56
	bl FreeToHeap
	mov r0, #0x81
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225DD56:
	pop {r4, pc}
	thumb_func_end DowsingMchn_FreeHiddenItemLocs

	thumb_func_start ov28_0225DD58
ov28_0225DD58: ; 0x0225DD58
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl DowsingMchn_GetHiddenItemLocs
	mov r0, #0x83
	mov r4, #0
	lsl r0, r0, #2
	str r4, [r5, r0]
_0225DD6A:
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r0, r4
	ldrb r0, [r6, #4]
	cmp r0, #0xff
	beq _0225DDF6
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0225DDBA
	mov r0, #0
	ldrsh r0, [r6, r0]
	str r0, [sp, #4]
	bl abs
	add r7, r0, #0
	mov r0, #2
	ldrsh r0, [r6, r0]
	bl abs
	add r0, r7, r0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	mov r0, #0x82
	ldr r1, [sp, #4]
	lsl r0, r0, #2
	strh r1, [r5, r0]
	sub r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r0, r4
	mov r0, #2
	ldrsh r1, [r1, r0]
	ldr r0, _0225DE00 ; =0x0000020A
	strh r1, [r5, r0]
	mov r1, #1
	add r0, r0, #2
	str r1, [r5, r0]
	b _0225DDF2
_0225DDBA:
	mov r0, #0
	ldrsh r0, [r6, r0]
	str r0, [sp]
	bl abs
	str r0, [sp, #8]
	mov r0, #2
	ldrsh r0, [r6, r0]
	bl abs
	ldr r1, [sp, #8]
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r7, r0
	bls _0225DDF2
	add r7, r0, #0
	mov r0, #0x82
	ldr r1, [sp]
	lsl r0, r0, #2
	strh r1, [r5, r0]
	sub r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r0, r4
	mov r0, #2
	ldrsh r1, [r1, r0]
	ldr r0, _0225DE00 ; =0x0000020A
	strh r1, [r5, r0]
_0225DDF2:
	add r4, r4, #6
	b _0225DD6A
_0225DDF6:
	add r0, r5, #0
	bl DowsingMchn_FreeHiddenItemLocs
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DE00: .word 0x0000020A
	thumb_func_end ov28_0225DD58

	thumb_func_start ov28_0225DE04
ov28_0225DE04: ; 0x0225DE04
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	mov r2, #0x11
	asr r1, r0, #0x1f
	lsl r2, r2, #0xe
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	mov r0, #0x15
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [r5]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	mov r2, #0x11
	asr r1, r0, #0x1f
	lsl r2, r2, #0xe
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	mov r0, #0x59
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [r5, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov28_0225DE04

	thumb_func_start ov28_0225DE64
ov28_0225DE64: ; 0x0225DE64
	add r2, r0, #0
	sub r1, #0x64
	ldr r3, _0225DE74 ; =FX_Atan2Idx
	sub r2, #0x54
	lsl r0, r1, #0xc
	lsl r1, r2, #0xc
	bx r3
	nop
_0225DE74: .word FX_Atan2Idx
	thumb_func_end ov28_0225DE64

	thumb_func_start ov28_0225DE78
ov28_0225DE78: ; 0x0225DE78
	ldr r3, _0225DE84 ; =FX_Atan2Idx
	add r2, r0, #0
	lsl r0, r1, #0xc
	lsl r1, r2, #0xc
	bx r3
	nop
_0225DE84: .word FX_Atan2Idx
	thumb_func_end ov28_0225DE78

	thumb_func_start ov28_0225DE88
ov28_0225DE88: ; 0x0225DE88
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x5a
	lsl r0, r0, #2
	mul r0, r1
	lsr r0, r0, #0x10
	bx lr
	.balign 4, 0
	thumb_func_end ov28_0225DE88

	thumb_func_start ov28_0225DE98
ov28_0225DE98: ; 0x0225DE98
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r2, [r4, #4]
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, r2, r0
	mov r1, #6
	bl _u32_div_f
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov28_0225DE98

	thumb_func_start ov28_0225DEB0
ov28_0225DEB0: ; 0x0225DEB0
	push {r4, lr}
	mov r1, #0x85
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	mov r1, #0x22
	lsl r1, r1, #4
	add r2, r1, #0
	sub r2, #0xf4
	add r3, r0, r2
	add r2, r1, #0
	str r0, [r4, r1]
	add r2, #0xc
	str r3, [r4, r2]
	add r3, r0, #0
	add r2, r1, #0
	add r3, #0x78
	add r2, #0x18
	str r3, [r4, r2]
	add r2, r1, #0
	add r0, #0xd8
	add r2, #0x24
	str r0, [r4, r2]
	add r0, r1, #0
	add r0, #0x2c
	ldrh r2, [r4, r0]
	ldr r0, _0225DF00 ; =0xFFFF8000
	add r1, #0x2c
	and r2, r0
	mov r0, #6
	orr r0, r2
	strh r0, [r4, r1]
	pop {r4, pc}
	nop
_0225DF00: .word 0xFFFF8000
	thumb_func_end ov28_0225DEB0

	thumb_func_start ov28_0225DF04
ov28_0225DF04: ; 0x0225DF04
	ldr r2, [r0]
	ldr r3, [r0, #4]
	lsl r1, r2, #1
	add r1, r2, r1
	add r1, r3, r1
	lsr r1, r1, #2
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov28_0225DF04

	thumb_func_start ov28_0225DF14
ov28_0225DF14: ; 0x0225DF14
	push {r4, r5, r6, lr}
	mov r1, #0x85
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	mov r1, #0x82
	lsl r1, r1, #2
	add r4, r0, #0
	ldrsh r0, [r5, r1]
	add r1, r1, #2
	ldrsh r1, [r5, r1]
	bl ov28_0225DE78
	bl ov28_0225DE88
	lsl r1, r4, #1
	add r1, r4, r1
	add r1, r0, r1
	lsr r2, r1, #2
	mov r1, #0x22
	add r3, r4, #0
	lsl r1, r1, #4
	add r6, r0, #0
	add r3, #0x1e
	str r2, [r5, r1]
	lsl r2, r3, #1
	add r6, #0x78
	add r2, r3, r2
	add r2, r6, r2
	add r6, r0, #0
	lsr r3, r2, #2
	add r2, r1, #0
	add r2, #0xc
	str r3, [r5, r2]
	add r3, r4, #0
	sub r3, #0x24
	lsl r2, r3, #1
	sub r6, #0x87
	add r2, r3, r2
	add r2, r6, r2
	lsr r3, r2, #2
	add r2, r1, #0
	add r2, #0x18
	add r4, #0x5a
	str r3, [r5, r2]
	lsl r2, r4, #1
	add r0, #0x5a
	add r2, r4, r2
	add r0, r0, r2
	lsr r2, r0, #2
	add r0, r1, #0
	add r0, #0x24
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #0x2c
	ldrh r2, [r5, r0]
	ldr r0, _0225DFA0 ; =0xFFFF8000
	add r1, #0x2c
	and r2, r0
	mov r0, #4
	orr r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	nop
_0225DFA0: .word 0xFFFF8000
	thumb_func_end ov28_0225DF14

	thumb_func_start ov28_0225DFA4
ov28_0225DFA4: ; 0x0225DFA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	lsl r0, r0, #1
	add r0, r1, r0
	mov r1, #3
	bl _u32_div_f
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov28_0225DFA4

	thumb_func_start ov28_0225DFBC
ov28_0225DFBC: ; 0x0225DFBC
	push {r4, r5, r6, lr}
	mov r1, #0x85
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	mov r1, #0x82
	lsl r1, r1, #2
	add r4, r0, #0
	ldrsh r0, [r5, r1]
	add r1, r1, #2
	ldrsh r1, [r5, r1]
	bl ov28_0225DE78
	bl ov28_0225DE88
	add r6, r0, #0
	lsl r0, r4, #1
	add r0, r6, r0
	mov r1, #3
	bl _u32_div_f
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	add r1, r6, #0
	add r0, #0x1e
	add r1, #0x87
	lsl r0, r0, #1
	add r0, r1, r0
	mov r1, #3
	bl _u32_div_f
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	add r1, r6, #0
	sub r0, #0x24
	sub r1, #0x78
	lsl r0, r0, #1
	add r0, r1, r0
	mov r1, #3
	bl _u32_div_f
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, #0x5a
	add r6, #0x3c
	lsl r0, r4, #1
	add r0, r6, r0
	mov r1, #3
	bl _u32_div_f
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #8
	ldrh r2, [r5, r0]
	ldr r0, _0225E050 ; =0xFFFF8000
	add r1, #8
	and r2, r0
	mov r0, #3
	orr r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225E050: .word 0xFFFF8000
	thumb_func_end ov28_0225DFBC

	thumb_func_start ov28_0225E054
ov28_0225E054: ; 0x0225E054
	ldr r2, [r0, #4]
	ldr r1, [r0]
	add r1, r2, r1
	lsr r1, r1, #1
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov28_0225E054

	thumb_func_start ov28_0225E060
ov28_0225E060: ; 0x0225E060
	push {r4, r5, r6, lr}
	mov r1, #0x85
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl ov28_0225DE64
	bl ov28_0225DE88
	mov r1, #0x82
	lsl r1, r1, #2
	add r4, r0, #0
	ldrsh r0, [r5, r1]
	add r1, r1, #2
	ldrsh r1, [r5, r1]
	bl ov28_0225DE78
	bl ov28_0225DE88
	add r6, r0, #0
	add r0, r4, r6
	mov r1, #3
	bl _u32_div_f
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r6, #0
	add r0, #0x3c
	add r0, r0, r4
	lsr r2, r0, #1
	add r0, r1, #0
	add r0, #0xc
	str r2, [r5, r0]
	add r0, r6, #0
	sub r0, #0x48
	add r0, r0, r4
	lsr r2, r0, #1
	add r0, r1, #0
	add r0, #0x18
	add r4, #0x5a
	add r6, #0x2d
	str r2, [r5, r0]
	add r0, r4, r6
	lsr r2, r0, #1
	add r0, r1, #0
	add r0, #0x24
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #0x2c
	ldrh r2, [r5, r0]
	ldr r0, _0225E0D8 ; =0xFFFF8000
	add r1, #0x2c
	and r2, r0
	mov r0, #2
	orr r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225E0D8: .word 0xFFFF8000
	thumb_func_end ov28_0225E060

	thumb_func_start ov28_0225E0DC
ov28_0225E0DC: ; 0x0225E0DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r4]
	lsl r0, r0, #1
	add r0, r1, r0
	mov r1, #3
	bl _u32_div_f
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov28_0225E0DC

	thumb_func_start ov28_0225E0F4
ov28_0225E0F4: ; 0x0225E0F4
	push {r4, r5, r6, lr}
	mov r1, #0x82
	add r5, r0, #0
	lsl r1, r1, #2
	ldrsh r0, [r5, r1]
	lsl r6, r0, #3
	add r0, r1, #2
	ldrsh r0, [r5, r0]
	add r6, #0x54
	lsl r4, r0, #3
	add r0, r1, #0
	add r0, #0xc
	add r1, #0x10
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r4, #0x64
	sub r0, r6, r0
	sub r1, r4, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0xc
	add r2, r6, #0
	sub r1, #8
	ldr r0, [r5, r0]
	add r2, #0xa
	sub r0, r2, r0
	add r2, r4, #0
	ldr r1, [r5, r1]
	add r2, #0xc
	sub r1, r2, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x18
	add r2, r6, #0
	sub r1, #0x14
	ldr r0, [r5, r0]
	sub r2, #0xc
	sub r0, r2, r0
	ldr r1, [r5, r1]
	sub r2, r4, #4
	sub r1, r2, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #0x24
	sub r1, #0x20
	ldr r0, [r5, r0]
	sub r6, #8
	ldr r1, [r5, r1]
	sub r4, #8
	sub r0, r6, r0
	sub r1, r4, r1
	bl ov28_0225DE78
	bl ov28_0225DE88
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	add r0, #8
	ldrh r2, [r5, r0]
	ldr r0, _0225E1A0 ; =0xFFFF8000
	add r1, #8
	and r2, r0
	mov r0, #3
	orr r0, r2
	strh r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225E1A0: .word 0xFFFF8000
	thumb_func_end ov28_0225E0F4

	thumb_func_start ov28_0225E1A4
ov28_0225E1A4: ; 0x0225E1A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	bl ov28_0225DD58
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	cmp r1, #0
	bne _0225E1C8
	add r0, r6, #0
	bl ov28_0225DEB0
	mov r0, #0x21
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E1C8:
	sub r0, r0, #4
	ldrsh r0, [r6, r0]
	bl abs
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, _0225E310 ; =0x0000020A
	ldrsh r0, [r6, r0]
	bl abs
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	cmp r4, #8
	bgt _0225E1F8
	cmp r0, #8
	bgt _0225E1F8
	add r0, r6, #0
	bl ov28_0225E0F4
	mov r0, #0x21
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E1F8:
	cmp r4, #0xc
	bgt _0225E210
	cmp r0, #0xc
	bgt _0225E210
	add r0, r6, #0
	bl ov28_0225E060
	mov r0, #0x21
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E210:
	cmp r4, #0x11
	bgt _0225E228
	cmp r0, #0x11
	bgt _0225E228
	add r0, r6, #0
	bl ov28_0225DFBC
	mov r0, #0x21
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r6, r0]
	b _0225E236
_0225E228:
	add r0, r6, #0
	bl ov28_0225DF14
	mov r0, #0x21
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r6, r0]
_0225E236:
	mov r1, #0x93
	lsl r1, r1, #2
	ldrh r0, [r6, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	bne _0225E27E
	mov r2, #0x22
	lsl r2, r2, #4
	mov r0, #0
	add r1, r6, #0
	sub r3, r2, #4
	add r4, r2, #0
	add r5, r2, #4
_0225E250:
	ldr r7, [r1, r2]
	add r0, r0, #1
	str r7, [r1, r3]
	ldr r7, [r1, r4]
	str r7, [r1, r5]
	add r1, #0xc
	cmp r0, #4
	blo _0225E250
	mov r1, #0x93
	lsl r1, r1, #2
	ldrh r2, [r6, r1]
	mov r0, #2
	lsl r0, r0, #0xe
	orr r0, r2
	strh r0, [r6, r1]
	ldrh r2, [r6, r1]
	ldr r0, _0225E314 ; =0xFFFF8000
	add sp, #8
	and r2, r0
	mov r0, #1
	orr r0, r2
	strh r0, [r6, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0225E27E:
	mov r0, #0
	sub r1, #0x30
	str r0, [sp]
	add r0, r6, r1
	add r4, r6, #0
	str r0, [sp, #4]
_0225E28A:
	mov r0, #0x22
	lsl r0, r0, #4
	mov r1, #0x5a
	ldr r0, [r4, r0]
	lsl r1, r1, #2
	bl _u32_div_f
	mov r0, #0x22
	lsl r0, r0, #4
	str r1, [r4, r0]
	sub r0, r0, #4
	mov r1, #0x5a
	ldr r0, [r4, r0]
	lsl r1, r1, #2
	bl _u32_div_f
	mov r0, #0x87
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r5, [r4, r0]
	add r0, r0, #4
	ldr r7, [r4, r0]
	sub r0, r7, r5
	bl abs
	cmp r0, #0xb4
	blt _0225E2EA
	cmp r7, r5
	bls _0225E2D6
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0xb4
	add r1, r1, r0
	mov r0, #0x87
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225E2EA
_0225E2D6:
	cmp r7, r5
	bhs _0225E2EA
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	sub r0, #0xb8
	add r1, r1, r0
	mov r0, #0x22
	lsl r0, r0, #4
	str r1, [r4, r0]
_0225E2EA:
	mov r1, #0x21
	lsl r1, r1, #4
	ldr r1, [r6, r1]
	ldr r0, [sp, #4]
	lsl r2, r1, #2
	ldr r1, _0225E318 ; =ov28_0225EAAC
	ldr r1, [r1, r2]
	blx r1
	ldr r0, [sp, #4]
	add r4, #0xc
	add r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #4
	blo _0225E28A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E310: .word 0x0000020A
_0225E314: .word 0xFFFF8000
_0225E318: .word ov28_0225EAAC
	thumb_func_end ov28_0225E1A4

	thumb_func_start ov28_0225E31C
ov28_0225E31C: ; 0x0225E31C
	push {r3, r4}
	cmp r1, #0
	blt _0225E356
	mov r2, #0x21
	lsl r2, r2, #4
	ldr r4, [r0, r2]
	ldr r3, _0225E368 ; =ov28_0225EB84
	ldrb r3, [r3, r4]
	mul r3, r1
	add r1, r2, #0
	add r1, #0x3e
	ldrsh r1, [r0, r1]
	add r3, r1, r3
	add r1, r2, #0
	add r1, #0x3e
	strh r3, [r0, r1]
	ldr r1, [r0, r2]
	lsl r3, r1, #1
	ldr r1, _0225E36C ; =ov28_0225EA90
	ldrb r3, [r1, r3]
	add r1, r2, #0
	add r1, #0x3e
	ldrsh r1, [r0, r1]
	cmp r1, r3
	ble _0225E362
	add r2, #0x3e
	strh r3, [r0, r2]
	pop {r3, r4}
	bx lr
_0225E356:
	ldr r1, _0225E370 ; =0x0000024E
	ldrsh r2, [r0, r1]
	cmp r2, #0
	ble _0225E362
	sub r2, r2, #1
	strh r2, [r0, r1]
_0225E362:
	pop {r3, r4}
	bx lr
	nop
_0225E368: .word ov28_0225EB84
_0225E36C: .word ov28_0225EA90
_0225E370: .word 0x0000024E
	thumb_func_end ov28_0225E31C

	thumb_func_start ov28_0225E374
ov28_0225E374: ; 0x0225E374
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x21
	lsl r0, r0, #4
	add r4, r1, #0
	ldr r1, [r5, r0]
	add r6, r2, #0
	lsl r2, r1, #1
	ldr r1, _0225E3B4 ; =ov28_0225EA90
	ldrb r2, [r1, r2]
	add r1, r0, #0
	add r1, #0x3e
	ldrsh r1, [r5, r1]
	cmp r1, r2
	ble _0225E396
	add r0, #0x3e
	strh r2, [r5, r0]
_0225E396:
	ldr r0, _0225E3B8 ; =0x0000024E
	mov r1, #0xa
	ldrsh r0, [r5, r0]
	bl _s32_div_f
	mov r1, #1
	and r0, r1
	strh r0, [r4]
	ldr r0, _0225E3B8 ; =0x0000024E
	mov r1, #0x14
	ldrsh r0, [r5, r0]
	bl _s32_div_f
	strh r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225E3B4: .word ov28_0225EA90
_0225E3B8: .word 0x0000024E
	thumb_func_end ov28_0225E374

	thumb_func_start ov28_0225E3BC
ov28_0225E3BC: ; 0x0225E3BC
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0225E420 ; =0x0000024E
	add r5, r0, #0
	ldrsh r1, [r5, r1]
	cmp r1, #0
	bne _0225E3E2
	mov r4, #0
	mov r6, #0x19
	add r7, r4, #0
	lsl r6, r6, #4
_0225E3D0:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225E3D0
	pop {r3, r4, r5, r6, r7, pc}
_0225E3E2:
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl ov28_0225E374
	mov r7, #0x19
	mov r4, #0
	add r6, sp, #0
	lsl r7, r7, #4
_0225E3F4:
	mov r0, #0x19
	ldrh r1, [r6]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r1, #1
	bl sub_02024A48
	mov r0, #0x19
	lsl r0, r0, #4
	ldrh r1, [r6, #2]
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r7]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225E3F4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E420: .word 0x0000024E
	thumb_func_end ov28_0225E3BC

	thumb_func_start ov28_0225E424
ov28_0225E424: ; 0x0225E424
	push {r4, lr}
	add r4, r0, #0
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #2
	bl sub_0202481C
	pop {r4, pc}
	thumb_func_end ov28_0225E424

	thumb_func_start ov28_0225E43C
ov28_0225E43C: ; 0x0225E43C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x93
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	lsl r2, r1, #0x11
	lsr r4, r2, #0x11
	beq _0225E50E
	ldr r2, _0225E514 ; =0xFFFF8000
	lsr r3, r2, #0x10
	add r3, r4, r3
	lsl r3, r3, #0x10
	and r1, r2
	lsr r3, r3, #0x10
	lsr r2, r2, #0x11
	and r2, r3
	orr r1, r2
	strh r1, [r5, r0]
	ldrh r1, [r5, r0]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x11
	bne _0225E4B0
	mov r6, #0
	add r4, r5, #0
	add r7, sp, #4
_0225E470:
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	sub r0, r0, #4
	str r1, [r5, r0]
	mov r1, #0x87
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r7, #0
	bl ov28_0225DE04
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, r7, #0
	bl sub_020247D4
	mov r0, #0x19
	mov r1, #0x87
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r5, r1]
	bl ov28_0225E424
	add r6, r6, #1
	add r5, #0xc
	add r4, r4, #4
	cmp r6, #4
	blo _0225E470
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0225E4B0:
	mov r1, #0
	sub r0, #0x30
	str r1, [sp]
	add r4, r5, #0
	add r6, r5, #0
	add r7, r5, r0
_0225E4BC:
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #8
	str r1, [r4, r0]
	mov r1, #0x87
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, sp, #4
	bl ov28_0225DE04
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	add r1, sp, #4
	bl sub_020247D4
	mov r0, #0x19
	mov r1, #0x87
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r6, r0]
	ldr r1, [r4, r1]
	bl ov28_0225E424
	mov r1, #0x21
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r7, #0
	lsl r2, r1, #2
	ldr r1, _0225E518 ; =ov28_0225EAAC
	ldr r1, [r1, r2]
	blx r1
	ldr r0, [sp]
	add r4, #0xc
	add r0, r0, #1
	add r6, r6, #4
	add r7, #0xc
	str r0, [sp]
	cmp r0, #4
	blo _0225E4BC
_0225E50E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E514: .word 0xFFFF8000
_0225E518: .word ov28_0225EAAC
	thumb_func_end ov28_0225E43C

	thumb_func_start ov28_0225E51C
ov28_0225E51C: ; 0x0225E51C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x21
	lsl r0, r0, #4
	add r4, r2, #0
	ldr r2, [r5, r0]
	cmp r2, #4
	bne _0225E566
	sub r0, #8
	ldrsh r0, [r5, r0]
	add r0, r0, #7
	sub r0, r0, r1
	bl abs
	add r6, r0, #0
	ldr r0, _0225E570 ; =0x0000020A
	ldrsh r0, [r5, r0]
	add r0, r0, #7
	sub r0, r0, r4
	bl abs
	add r1, r6, r0
	mov r0, #0x10
	sub r1, r0, r1
	cmp r1, #5
	bge _0225E554
	mov r1, #5
	b _0225E55A
_0225E554:
	cmp r1, #0x10
	ble _0225E55A
	add r1, r0, #0
_0225E55A:
	mov r0, #0xa
	mul r0, r1
	sub r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0225E566:
	ldr r0, _0225E574 ; =ov28_0225EA91
	lsl r1, r2, #1
	ldrb r0, [r0, r1]
	pop {r4, r5, r6, pc}
	nop
_0225E570: .word 0x0000020A
_0225E574: .word ov28_0225EA91
	thumb_func_end ov28_0225E51C

	thumb_func_start ov28_0225E578
ov28_0225E578: ; 0x0225E578
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r6, r0, #0
	str r1, [sp, #0x10]
	cmp r1, #1
	bne _0225E5A2
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r0, [r6, r1]
	lsr r0, r0, #3
	sub r0, r0, #3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, r1, #4
	ldr r0, [r6, r0]
	lsr r0, r0, #3
	sub r0, r0, #5
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x24]
_0225E5A2:
	ldr r0, _0225E724 ; =ov28_0225EB14
	mov r7, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x30]
	add r4, r6, #0
	sub r0, r0, #3
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	add r0, r0, #3
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r0, r0, #3
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	add r0, r0, #3
	str r0, [sp, #0x1c]
_0225E5C2:
	ldr r0, [sp, #0x24]
	mov r5, #0
	sub r0, r0, r7
	str r0, [sp, #0x18]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	add r0, r7, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x3c]
_0225E5D8:
	mov r0, #1
	add r1, r0, #0
	ldr r0, [sp, #0x34]
	lsl r1, r5
	ldrh r0, [r0]
	tst r0, r1
	beq _0225E5E8
	b _0225E6F6
_0225E5E8:
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _0225E67E
	ldr r0, [sp, #0x2c]
	cmp r5, r0
	blt _0225E658
	ldr r0, [sp, #0x28]
	cmp r5, r0
	bgt _0225E658
	ldr r0, [sp, #0x20]
	cmp r7, r0
	blt _0225E658
	ldr r0, [sp, #0x1c]
	cmp r7, r0
	bgt _0225E658
	ldr r0, [sp, #0x30]
	sub r0, r0, r5
	bl abs
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x18]
	bl abs
	ldr r1, [sp, #0x38]
	add r0, r1, r0
	cmp r0, #4
	bgt _0225E658
	lsl r1, r5, #0x10
	ldr r2, [sp, #0x14]
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl ov28_0225E51C
	add r2, r0, #0
	mov r0, #0x25
	add r3, r4, r5
	lsl r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, r2
	bhs _0225E650
	mov r0, #0x25
	lsl r0, r0, #4
	ldrb r1, [r3, r0]
	add r1, #0xa
	strb r1, [r3, r0]
	ldrb r0, [r3, r0]
	cmp r0, r2
	bls _0225E6A2
	mov r0, #0x25
	lsl r0, r0, #4
	strb r2, [r3, r0]
	b _0225E6A2
_0225E650:
	mov r0, #0x25
	lsl r0, r0, #4
	strb r2, [r3, r0]
	b _0225E6A2
_0225E658:
	mov r0, #0x25
	add r3, r4, r5
	lsl r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, #2
	blo _0225E674
	mov r0, #0x25
	lsl r0, r0, #4
	ldrb r0, [r3, r0]
	sub r1, r0, #2
	mov r0, #0x25
	lsl r0, r0, #4
	strb r1, [r3, r0]
	b _0225E6A2
_0225E674:
	mov r0, #0x25
	mov r1, #0
	lsl r0, r0, #4
	strb r1, [r3, r0]
	b _0225E6A2
_0225E67E:
	mov r0, #0x25
	add r3, r4, r5
	lsl r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, #2
	blo _0225E69A
	mov r0, #0x25
	lsl r0, r0, #4
	ldrb r0, [r3, r0]
	sub r1, r0, #2
	mov r0, #0x25
	lsl r0, r0, #4
	strb r1, [r3, r0]
	b _0225E6A2
_0225E69A:
	mov r0, #0x25
	mov r1, #0
	lsl r0, r0, #4
	strb r1, [r3, r0]
_0225E6A2:
	mov r0, #0x25
	lsl r0, r0, #4
	ldrb r0, [r3, r0]
	cmp r0, #0
	bne _0225E6CC
	ldr r0, [sp, #0x3c]
	add r3, r5, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r6, #0x10]
	ldr r2, _0225E728 ; =0x00001001
	mov r1, #6
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	b _0225E6F6
_0225E6CC:
	mov r1, #0xa
	bl _s32_div_f
	add r2, r0, #0
	ldr r0, [sp, #0x3c]
	lsl r3, r2, #1
	str r0, [sp]
	mov r0, #1
	ldr r2, _0225E72C ; =ov28_0225EB32
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x11
	ldrh r2, [r2, r3]
	add r3, r5, #3
	str r0, [sp, #0xc]
	lsl r3, r3, #0x18
	ldr r0, [r6, #0x10]
	mov r1, #6
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
_0225E6F6:
	add r0, r5, #1
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	cmp r5, #0xf
	bge _0225E702
	b _0225E5D8
_0225E702:
	ldr r0, [sp, #0x34]
	add r4, #0xf
	add r0, r0, #2
	str r0, [sp, #0x34]
	add r0, r7, #1
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	cmp r7, #0xf
	bge _0225E716
	b _0225E5C2
_0225E716:
	ldr r0, [r6, #0x10]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E724: .word ov28_0225EB14
_0225E728: .word 0x00001001
_0225E72C: .word ov28_0225EB32
	thumb_func_end ov28_0225E578

	thumb_func_start ov28_0225E730
ov28_0225E730: ; 0x0225E730
	push {r3, r4, r5, r6, r7, lr}
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	add r5, r0, #0
	bl ov28_0225E374
	add r0, sp, #0
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	mov r2, #0x21
	lsl r2, r2, #4
	lsl r0, r0, #1
	add r0, r1, r0
	lsl r1, r0, #6
	mov r0, #0xf
	lsl r0, r0, #6
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, [r5, r2]
	cmp r0, #4
	bne _0225E798
	add r1, r2, #0
	add r1, #8
	ldr r1, [r5, r1]
	add r0, r2, #4
	lsr r1, r1, #3
	ldr r0, [r5, r0]
	sub r2, #8
	sub r6, r1, #5
	ldrsh r1, [r5, r2]
	lsr r0, r0, #3
	sub r0, r0, #3
	add r1, r1, #7
	sub r0, r1, r0
	bl abs
	add r7, r0, #0
	ldr r0, _0225E7C8 ; =0x0000020A
	ldrsh r0, [r5, r0]
	add r0, r0, #7
	sub r0, r0, r6
	bl abs
	add r1, r7, r0
	mov r0, #0x10
	sub r0, r0, r1
	lsl r0, r0, #6
	add r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_0225E798:
	mov r0, #0xce
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _0225E7AA
	ldr r0, _0225E7CC ; =0x0000093D
	add r1, r4, #0
	bl PlaySE_SetPitch
_0225E7AA:
	mov r0, #0xce
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	cmp r1, #0xa
	bne _0225E7B8
	mov r1, #0
	b _0225E7BA
_0225E7B8:
	add r1, r1, #1
_0225E7BA:
	strh r1, [r5, r0]
	ldr r0, _0225E7D0 ; =0x0000033A
	ldrsh r1, [r5, r0]
	cmp r1, r4
	beq _0225E7C6
	strh r4, [r5, r0]
_0225E7C6:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E7C8: .word 0x0000020A
_0225E7CC: .word 0x0000093D
_0225E7D0: .word 0x0000033A
	thumb_func_end ov28_0225E730

	thumb_func_start ov28_0225E7D4
ov28_0225E7D4: ; 0x0225E7D4
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	mov r1, #0x85
	lsl r1, r1, #2
	ldr r0, [sp, #4]
	ldr r2, [r4, r1]
	cmp r2, r0
	bne _0225E7F8
	add r1, r1, #4
	ldr r2, [r4, r1]
	ldr r1, [sp]
	cmp r2, r1
	beq _0225E80A
_0225E7F8:
	mov r1, #0x85
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r2, [sp]
	add r0, r1, #4
	str r2, [r4, r0]
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_0225E80A:
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov28_0225E7D4

	thumb_func_start ov28_0225E810
ov28_0225E810: ; 0x0225E810
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r1, r0, #0
	add r1, #0xd2
	ldrb r1, [r1]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0225E828
	mov r4, #4
	b _0225E890
_0225E828:
	bl sub_0203E13C
	cmp r0, #0
	ldr r0, [r5, #0x18]
	bne _0225E860
	bl FieldSys_GetPlayerAvatar
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl MapObject_GetGfxID
	sub r0, #0xbc
	cmp r0, #1
	bhi _0225E858
	add r0, r4, #0
	bl sub_0205F330
	cmp r0, #1
	bne _0225E854
	mov r4, #3
	b _0225E890
_0225E854:
	mov r4, #4
	b _0225E890
_0225E858:
	mov r0, #0xcd
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	b _0225E890
_0225E860:
	bl ov01_021E7F54
	add r4, r0, #0
	cmp r4, #1
	bne _0225E890
	ldr r0, [r5, #0x18]
	add r1, sp, #0
	bl Fsys_GetFacingObject
	ldr r0, [sp]
	bl MapObject_GetScript
	bl ov01_021F6BD0
	cmp r0, #1
	beq _0225E88E
	ldr r0, [sp]
	bl MapObject_GetGfxID
	bl ov01_021F6BB0
	cmp r0, #1
	bne _0225E890
_0225E88E:
	mov r4, #0
_0225E890:
	mov r1, #0xcd
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r4, r0
	beq _0225E8B0
	mov r0, #0x6d
	lsl r0, r0, #2
	str r4, [r5, r1]
	add r2, r5, r0
	ldr r1, [r5, r1]
	ldr r0, _0225E8B4 ; =ov28_0225EB7C
	ldrb r0, [r0, r1]
	lsl r0, r0, #4
	add r0, r2, r0
	bl ScheduleWindowCopyToVram
_0225E8B0:
	pop {r3, r4, r5, pc}
	nop
_0225E8B4: .word ov28_0225EB7C
	thumb_func_end ov28_0225E810

	thumb_func_start ov28_0225E8B8
ov28_0225E8B8: ; 0x0225E8B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r2, [sp]
	add r6, r3, #0
	bl sub_020252F4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020249A8
	add r7, r0, #0
	cmp r4, #1
	bne _0225E8E6
	bl System_GetTouchNew
	cmp r0, #0
	beq _0225E8E6
	add r0, r5, #0
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225E8E6:
	cmp r4, #1
	bne _0225E8F2
	cmp r7, r6
	bne _0225E8F2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225E8F2:
	ldr r1, [sp]
	add r0, r5, #0
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov28_0225E8B8

	thumb_func_start ov28_0225E900
ov28_0225E900: ; 0x0225E900
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl sub_0203DF8C
	cmp r0, #1
	bne _0225E914
	add r0, r4, #0
	bl ov28_0225E810
_0225E914:
	mov r1, #6
	lsl r1, r1, #6
	ldr r0, _0225E930 ; =_0225EA7C
	ldr r1, [r4, r1]
	mov r2, #5
	mov r3, #6
	bl ov28_0225E8B8
	cmp r0, #0
	beq _0225E92E
	ldr r0, _0225E934 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
_0225E92E:
	pop {r4, pc}
	.balign 4, 0
_0225E930: .word _0225EA7C
_0225E934: .word gSystem
	thumb_func_end ov28_0225E900

	thumb_func_start ov28_0225E938
ov28_0225E938: ; 0x0225E938
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #1
	beq _0225E952
	add r0, r5, #0
	bl ov28_0225EA58
	cmp r0, #1
	bne _0225E96C
_0225E952:
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
_0225E96C:
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _0225E9DC ; =ov28_0225EA84
	bl sub_02025320
	cmp r0, #1
	bne _0225E9DA
	ldr r0, [r5, #0x18]
	bl FieldSys_GetPlayerAvatar
	add r6, r0, #0
	bl sub_0205CB38
	add r4, r0, #0
	bne _0225E9B8
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	b _0225E9D0
_0225E9B8:
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xb
	bl Set2dSpriteAnimSeqNo
_0225E9D0:
	mov r1, #1
	add r0, r6, #0
	eor r1, r4
	bl sub_0205CB40
_0225E9DA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225E9DC: .word ov28_0225EA84
	thumb_func_end ov28_0225E938

	thumb_func_start ov28_0225E9E0
ov28_0225E9E0: ; 0x0225E9E0
	push {r4, lr}
	add r4, r0, #0
	bl ov28_0225EA58
	cmp r0, #1
	bne _0225EA10
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #8
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	pop {r4, pc}
_0225EA10:
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #0x63
	lsl r1, r1, #2
	ldr r0, _0225EA54 ; =ov28_0225EA80
	ldr r1, [r4, r1]
	mov r2, #8
	mov r3, #9
	bl ov28_0225E8B8
	cmp r0, #0
	beq _0225EA50
	ldr r0, [r4, #0x18]
	mov r1, #0xb
	add r0, #0xd0
	strh r1, [r0]
	mov r0, #0x43
	ldr r1, [r4, #0x18]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #1
	bl sub_02018410
_0225EA50:
	pop {r4, pc}
	nop
_0225EA54: .word ov28_0225EA80
	thumb_func_end ov28_0225E9E0

	thumb_func_start ov28_0225EA58
ov28_0225EA58: ; 0x0225EA58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl Fsys_TaskIsRunning
	cmp r0, #1
	bne _0225EA76
	ldr r0, [r4, #0x18]
	add r0, #0xd2
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0225EA76
	mov r0, #1
	pop {r4, pc}
_0225EA76:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov28_0225EA58

	.rodata

_0225EA7C:
	.byte 0x90, 0xBC, 0x9D, 0xFF

ov28_0225EA80: ; 0x0225EA80
	.byte 0x08, 0x27, 0xC0, 0xFF

ov28_0225EA84: ; 0x0225EA84
	.byte 0x56, 0x86, 0xB2, 0xFC

ov28_0225EA88: ; 0x0225EA88
	.byte 0xFE, 0x54, 0x64, 0x48, 0xFF, 0x00, 0x00, 0x00

ov28_0225EA90: ; 0x0225EA90
	.byte 0x31

ov28_0225EA91: ; 0x0225EA91
	.byte 0x1D, 0x4F, 0x27, 0x6D, 0x31, 0x81, 0x31, 0x9F, 0x9F

ov28_0225EA9A: ; 0x0225EA9A
	.byte 0xA8, 0x90, 0x00, 0x05

ov28_0225EA9E: ; 0x0225EA9E
	.byte 0xB8, 0x56
	.byte 0x01, 0x03

ov28_0225EAA2: ; 0x0225EAA2
	.byte 0xD2, 0x5E, 0x00, 0x07

ov28_0225EAA6: ; 0x0225EAA6
	.byte 0xC8, 0x08, 0x00, 0x08, 0x00, 0x00

ov28_0225EAAC: ; 0x0225EAAC
	.word ov28_0225DE98
	.word ov28_0225DF04
	.word ov28_0225DFA4
	.word ov28_0225E054
	.word ov28_0225E0DC

ov28_0225EAC0: ; 0x0225EAC0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov28_0225EADC: ; 0x0225EADC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov28_0225EAF8: ; 0x0225EAF8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov28_0225EB14: ; 0x0225EB14
	.byte 0x1F, 0x7C, 0x07, 0x70, 0x03, 0x60, 0x01, 0x40, 0x01, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x40, 0x01, 0x40, 0x03, 0x60, 0x07, 0x70
	.byte 0x1F, 0x7C

ov28_0225EB32: ; 0x0225EB32
	.byte 0x6D, 0x30, 0x6E, 0x20, 0x6F, 0x20, 0x70, 0x20, 0x71, 0x20, 0x72, 0x20, 0x73, 0x20
	.byte 0x74, 0x20, 0x75, 0x20, 0x76, 0x20, 0x77, 0x20, 0x78, 0x20, 0x79, 0x20, 0x7A, 0x20, 0x7B, 0x20
	.byte 0x7C, 0x20

ov28_0225EB52: ; 0x0225EB52
	.byte 0x04, 0x18, 0x14, 0x08, 0x02, 0x04, 0x11, 0x00, 0x04, 0x18, 0x14, 0x08, 0x02, 0x04
	.byte 0x01, 0x00, 0x04, 0x18, 0x14, 0x08, 0x02, 0x04, 0x21, 0x00, 0x04, 0x18, 0x14, 0x08, 0x02, 0x04
	.byte 0x31, 0x00, 0x04, 0x1A, 0x02, 0x06, 0x02, 0x04, 0x41, 0x00, 0x00, 0x00

ov28_0225EB7C: ; 0x0225EB7C
	.byte 0x00, 0x01, 0x00, 0x02
	.byte 0x03, 0x00, 0x00, 0x00

ov28_0225EB84: ; 0x0225EB84
	.byte 0x01, 0x02, 0x02, 0x02, 0x04, 0x00, 0x00, 0x00
	; 0x0225EBA0
