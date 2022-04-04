	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov29_0225D520
ov29_0225D520: ; 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r6, r1, #0
	mov r0, #3
	add r7, r2, #0
	mov r1, #8
	lsl r2, r0, #0xf
	add r5, r3, #0
	bl CreateHeap
	ldr r0, _0225D5E0 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	mov r1, #0x81
	ldr r0, _0225D5E4 ; =ov29_0225DCD0
	lsl r1, r1, #2
	mov r2, #0xa
	mov r3, #8
	bl sub_02007200
	str r0, [sp, #4]
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #0x7f
	str r0, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [sp, #4]
	str r5, [r4, #0xc]
	str r0, [r4, #0x14]
	mov r0, #0
	str r5, [r4, #0x10]
	mvn r0, r0
	str r0, [r5, #4]
	mov r5, #0
	lsl r1, r1, #2
	str r5, [r4, r1]
	ldr r1, [r4, #0x10]
	ldr r0, _0225D5E8 ; =0x000186A0
	ldr r6, [r1]
	mov r7, #0xa
_0225D578:
	cmp r6, r0
	blo _0225D588
	mov r0, #6
	sub r1, r0, r5
	mov r0, #0x7f
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225D594
_0225D588:
	add r1, r7, #0
	bl _u32_div_f
	add r5, r5, #1
	cmp r5, #6
	blo _0225D578
_0225D594:
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0225D5A2
	mov r1, #1
	str r1, [r4, r0]
_0225D5A2:
	mov r0, #0xee
	mov r1, #8
	bl NARC_ctor
	add r5, r0, #0
	bl ov29_0225D620
	ldr r0, [sp]
	bl ov29_0225D648
	add r0, r4, #0
	add r1, r5, #0
	bl ov29_0225D6C8
	add r0, r4, #0
	bl ov29_0225D714
	add r0, r4, #0
	add r1, r5, #0
	bl ov29_0225D7F0
	add r0, r4, #0
	bl ov29_0225DBF0
	add r0, r5, #0
	bl NARC_dtor
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D5E0: .word 0x04001050
_0225D5E4: .word ov29_0225DCD0
_0225D5E8: .word 0x000186A0
	thumb_func_end ov29_0225D520

	thumb_func_start ov29_0225D5EC
ov29_0225D5EC: ; 0x0225D5EC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	bl sub_0201F988
	add r4, r0, #0
	bl ov29_0225DC34
	add r0, r4, #0
	bl ov29_0225D828
	add r0, r4, #0
	bl ov29_0225D7D4
	ldr r0, [r4]
	bl ov29_0225D6B4
	add r0, r5, #0
	bl sub_02007234
	mov r0, #8
	bl DestroyHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov29_0225D5EC

	thumb_func_start ov29_0225D61C
ov29_0225D61C: ; 0x0225D61C
	mov r0, #1
	bx lr
	thumb_func_end ov29_0225D61C

	thumb_func_start ov29_0225D620
ov29_0225D620: ; 0x0225D620
	push {r3, lr}
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #1
	lsl r0, r0, #8
	bl GX_SetBankForSubOBJ
	ldr r2, _0225D640 ; =0x04001000
	ldr r0, _0225D644 ; =0xFFCFFFEF
	ldr r1, [r2]
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0225D640: .word 0x04001000
_0225D644: .word 0xFFCFFFEF
	thumb_func_end ov29_0225D620

	thumb_func_start ov29_0225D648
ov29_0225D648: ; 0x0225D648
	push {r3, r4, r5, lr}
	sub sp, #0x38
	add r4, r0, #0
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r5, _0225D6AC ; =ov29_0225E1C8
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
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #8
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0225D6B0 ; =ov29_0225E200
	add r3, sp, #0
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
	add sp, #0x38
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225D6AC: .word ov29_0225E1C8
_0225D6B0: .word ov29_0225E200
	thumb_func_end ov29_0225D648

	thumb_func_start ov29_0225D6B4
ov29_0225D6B4: ; 0x0225D6B4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov29_0225D6B4

	thumb_func_start ov29_0225D6C8
ov29_0225D6C8: ; 0x0225D6C8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r4, r1, #0
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #9
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0xa
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r1, #8
	add r0, r4, #0
	mov r2, #4
	str r1, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov29_0225D6C8

	thumb_func_start ov29_0225D714
ov29_0225D714: ; 0x0225D714
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x10]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc4
	mov r3, #8
	bl NewMsgDataFromNarc
	str r0, [sp, #0x18]
	mov r0, #4
	mov r1, #8
	bl FontID_Alloc
	mov r1, #0x1a
	ldr r0, [sp, #0x10]
	lsl r1, r1, #4
	mov r6, #0
	add r5, r0, r1
_0225D73A:
	ldr r0, [sp, #0x10]
	ldr r2, _0225D7CC ; =ov29_0225E178
	lsl r4, r6, #4
	lsl r3, r6, #3
	ldr r0, [r0]
	add r1, r5, r4
	add r2, r2, r3
	bl AddWindow
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	add r1, r6, #0
	ldr r0, [sp, #0x18]
	add r1, #0x18
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r5, r4
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r0, #4
	add r1, r7, #0
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r1, r0, #1
	ldr r0, [sp, #0x14]
	add r2, r7, #0
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D7D0 ; =0x000F0E00
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, r4
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r5, r4
	bl CopyWindowPixelsToVram_TextMode
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #3
	blo _0225D73A
	mov r0, #4
	bl FontID_Release
	ldr r0, [sp, #0x18]
	bl DestroyMsgData
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D7CC: .word ov29_0225E178
_0225D7D0: .word 0x000F0E00
	thumb_func_end ov29_0225D714

	thumb_func_start ov29_0225D7D4
ov29_0225D7D4: ; 0x0225D7D4
	push {r3, r4, r5, lr}
	mov r1, #0x1a
	lsl r1, r1, #4
	mov r4, #0
	add r5, r0, r1
_0225D7DE:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blo _0225D7DE
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov29_0225D7D4

	thumb_func_start ov29_0225D7F0
ov29_0225D7F0: ; 0x0225D7F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	mov r0, #0xb
	add r1, #0x1c
	mov r2, #8
	bl G2dRenderer_Init
	str r0, [r5, #0x18]
	add r0, r5, #0
	mov r2, #1
	add r0, #0x1c
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r5, #0
	bl ov29_0225D840
	add r0, r5, #0
	add r1, r4, #0
	bl ov29_0225D9C8
	add r0, r5, #0
	bl ov29_0225DC84
	pop {r3, r4, r5, pc}
	thumb_func_end ov29_0225D7F0

	thumb_func_start ov29_0225D828
ov29_0225D828: ; 0x0225D828
	push {r4, lr}
	add r4, r0, #0
	bl ov29_0225DB38
	add r0, r4, #0
	bl ov29_0225D864
	ldr r0, [r4, #0x18]
	bl sub_02024504
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov29_0225D828

	thumb_func_start ov29_0225D840
ov29_0225D840: ; 0x0225D840
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0x51
	add r5, r0, #0
	mov r4, #0
	mov r7, #2
	lsl r6, r6, #2
_0225D84C:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #8
	bl Create2DGfxResObjMan
	str r0, [r5, r6]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225D84C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov29_0225D840

	thumb_func_start ov29_0225D864
ov29_0225D864: ; 0x0225D864
	push {r4, r5, r6, lr}
	mov r6, #0x51
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_0225D86E:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225D86E
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov29_0225D864

	thumb_func_start ov29_0225D880
ov29_0225D880: ; 0x0225D880
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
	mov r3, #0
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
	mov r3, #0
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
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0xc]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov29_0225D880

	thumb_func_start ov29_0225D910
ov29_0225D910: ; 0x0225D910
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
	thumb_func_end ov29_0225D910

	thumb_func_start ov29_0225D970
ov29_0225D970: ; 0x0225D970
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r3, #0
	ldr r3, [r0, #0x18]
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
	mov r2, #0x5d
	lsl r2, r2, #2
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
	thumb_func_end ov29_0225D970

	thumb_func_start ov29_0225D9C8
ov29_0225D9C8: ; 0x0225D9C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r6, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	add r4, r1, #0
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, _0225DB04 ; =0x00000399
	mov r1, #0x55
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	lsl r1, r1, #2
	str r0, [sp, #0x1c]
	add r0, r6, r1
	sub r1, #0x10
	add r1, r6, r1
	add r2, r4, #0
	mov r3, #5
	bl ov29_0225D880
	mov r1, #0x55
	lsl r1, r1, #2
	add r0, r6, r1
	sub r1, #0x10
	add r1, r6, r1
	add r2, sp, #0x20
	mov r3, #1
	bl ov29_0225D910
	ldr r3, _0225DB08 ; =ov29_0225E21C
	add r0, r6, #0
	mov r1, #0
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB0C ; =ov29_0225E220
	add r0, r6, #0
	mov r1, #1
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB10 ; =ov29_0225E224
	add r0, r6, #0
	mov r1, #2
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB14 ; =ov29_0225E228
	add r0, r6, #0
	mov r1, #3
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB18 ; =ov29_0225E22C
	add r0, r6, #0
	mov r1, #4
	add r2, sp, #0x20
	bl ov29_0225D970
	mov r0, #0
	str r0, [sp]
	mov r1, #2
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _0225DB1C ; =0x0000039A
	mov r1, #0x59
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	lsl r1, r1, #2
	str r0, [sp, #0x1c]
	add r0, r6, r1
	sub r1, #0x20
	add r1, r6, r1
	add r2, r4, #0
	mov r3, #1
	bl ov29_0225D880
	mov r1, #0x59
	lsl r1, r1, #2
	add r0, r6, r1
	sub r1, #0x20
	add r1, r6, r1
	add r2, sp, #0x20
	mov r3, #1
	bl ov29_0225D910
	ldr r3, _0225DB20 ; =ov29_0225E230
	add r0, r6, #0
	mov r1, #5
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB24 ; =ov29_0225E234
	add r0, r6, #0
	mov r1, #6
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB28 ; =ov29_0225E238
	add r0, r6, #0
	mov r1, #7
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB2C ; =ov29_0225E23C
	add r0, r6, #0
	mov r1, #8
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB30 ; =ov29_0225E240
	add r0, r6, #0
	mov r1, #9
	add r2, sp, #0x20
	bl ov29_0225D970
	ldr r3, _0225DB34 ; =ov29_0225E244
	add r0, r6, #0
	mov r1, #0xa
	add r2, sp, #0x20
	bl ov29_0225D970
	mov r7, #0x7f
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0225DAD6:
	ldr r0, [r6, r7]
	cmp r4, r0
	bhs _0225DAEA
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _0225DAF6
_0225DAEA:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0225DAF6:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blo _0225DAD6
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0225DB04: .word 0x00000399
_0225DB08: .word ov29_0225E21C
_0225DB0C: .word ov29_0225E220
_0225DB10: .word ov29_0225E224
_0225DB14: .word ov29_0225E228
_0225DB18: .word ov29_0225E22C
_0225DB1C: .word 0x0000039A
_0225DB20: .word ov29_0225E230
_0225DB24: .word ov29_0225E234
_0225DB28: .word ov29_0225E238
_0225DB2C: .word ov29_0225E23C
_0225DB30: .word ov29_0225E240
_0225DB34: .word ov29_0225E244
	thumb_func_end ov29_0225D9C8

	thumb_func_start ov29_0225DB38
ov29_0225DB38: ; 0x0225DB38
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0x5d
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0225DB44:
	ldr r0, [r5, r7]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blo _0225DB44
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov29_0225DB38

	thumb_func_start ov29_0225DB7C
ov29_0225DB7C: ; 0x0225DB7C
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #1
	mov r6, #0x5d
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #0xc
	lsl r6, r6, #2
_0225DB8A:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_020249B0
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blo _0225DB8A
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov29_0225DB7C

	thumb_func_start ov29_0225DB9C
ov29_0225DB9C: ; 0x0225DB9C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_0201A018
	ldrb r1, [r0]
	lsl r1, r1, #0xc
	str r1, [sp]
	ldrb r0, [r0, #1]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [sp, #4]
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	cmp r4, #9
	bhi _0225DBE0
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
_0225DBE0:
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov29_0225DB9C

	thumb_func_start ov29_0225DBF0
ov29_0225DBF0: ; 0x0225DBF0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r0, _0225DC28 ; =ov29_0225E248
	ldr r1, _0225DC2C ; =ov29_0225E280
	ldr r2, _0225DC30 ; =ov29_0225E13C
	add r3, r4, #0
	bl sub_02019BA4
	mov r1, #0x1d
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r4, #0
	mov r1, #0
	bl ov29_0225DB9C
	add r0, r4, #0
	bl ov29_0225DC50
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0225DC28: .word ov29_0225E248
_0225DC2C: .word ov29_0225E280
_0225DC30: .word ov29_0225E13C
	thumb_func_end ov29_0225DBF0

	thumb_func_start ov29_0225DC34
ov29_0225DC34: ; 0x0225DC34
	mov r1, #0x1d
	lsl r1, r1, #4
	ldr r3, _0225DC40 ; =sub_02019BDC
	ldr r0, [r0, r1]
	bx r3
	nop
_0225DC40: .word sub_02019BDC
	thumb_func_end ov29_0225DC34

	thumb_func_start ov29_0225DC44
ov29_0225DC44: ; 0x0225DC44
	bx lr
	.balign 4, 0
	thumb_func_end ov29_0225DC44

	thumb_func_start ov29_0225DC48
ov29_0225DC48: ; 0x0225DC48
	ldr r3, _0225DC4C ; =ov29_0225DB9C
	bx r3
	.balign 4, 0
_0225DC4C: .word ov29_0225DB9C
	thumb_func_end ov29_0225DC48

	thumb_func_start ov29_0225DC50
ov29_0225DC50: ; 0x0225DC50
	push {lr}
	sub sp, #0xc
	mov r2, #0x7f
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	lsl r3, r1, #2
	ldr r1, _0225DC80 ; =ov29_0225E1E4
	ldr r3, [r1, r3]
	add r1, r2, #0
	sub r1, #8
	ldr r1, [r0, r1]
	sub r2, #0x84
	ldrb r1, [r3, r1]
	lsl r1, r1, #0xc
	str r1, [sp]
	mov r1, #0x49
	lsl r1, r1, #0xe
	str r1, [sp, #4]
	ldr r0, [r0, r2]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {pc}
	.balign 4, 0
_0225DC80: .word ov29_0225E1E4
	thumb_func_end ov29_0225DC50

	thumb_func_start ov29_0225DC84
ov29_0225DC84: ; 0x0225DC84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	mov r4, #0
	lsl r2, r1, #2
	ldr r1, _0225DCCC ; =ov29_0225E1E4
	ldr r7, [r1, r2]
	mov r1, #0x46
	lsl r1, r1, #0xe
	str r1, [sp, #4]
	ldr r0, [r6, r0]
	cmp r0, #0
	bls _0225DCC6
	add r5, r6, #0
_0225DCA6:
	ldrb r0, [r7, r4]
	add r1, sp, #0
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020247D4
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blo _0225DCA6
_0225DCC6:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225DCCC: .word ov29_0225E1E4
	thumb_func_end ov29_0225DC84

	thumb_func_start ov29_0225DCD0
ov29_0225DCD0: ; 0x0225DCD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r0, #0x7e
	add r4, r1, #0
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0
	beq _0225DCEA
	cmp r1, #1
	bne _0225DCE6
	b _0225DE86
_0225DCE6:
	cmp r1, #2
	b _0225DE98
_0225DCEA:
	add r0, r0, #4
	ldr r0, [r4, r0]
	lsl r1, r0, #2
	ldr r0, _0225DEA8 ; =ov29_0225E1AC
	ldr r0, [r0, r1]
	bl sub_02025224
	mov r1, #0
	add r5, r0, #0
	mvn r1, r1
	cmp r5, r1
	beq _0225DD42
	mov r0, #0x7d
	lsl r0, r0, #2
	str r5, [r4, r0]
	add r0, r4, #0
	bl ov29_0225DC50
	mov r0, #0x7d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0x18
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r3, [r1, r0]
	add r1, r5, #5
	add r2, r3, #0
	add r2, #0xc
	add r3, r3, #1
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov29_0225E028
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DD42:
	ldr r0, _0225DEB0 ; =gSystem
	ldr r2, [r0, #0x48]
	mov r0, #8
	tst r0, r2
	beq _0225DD68
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0xb
	bl sub_02019F7C
	add r0, r4, #0
	mov r1, #0xb
	bl ov29_0225DB9C
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DD68:
	mov r0, #2
	tst r0, r2
	beq _0225DD80
	add r0, r4, #0
	bl ov29_0225DEB8
	cmp r0, #1
	bne _0225DD90
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DD80:
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02019D18
	add r5, r0, #0
	cmp r5, #0xc
	bls _0225DD92
_0225DD90:
	b _0225DE98
_0225DD92:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DD9E: ; jump table
	.short _0225DDB8 - _0225DD9E - 2 ; case 0
	.short _0225DDB8 - _0225DD9E - 2 ; case 1
	.short _0225DDB8 - _0225DD9E - 2 ; case 2
	.short _0225DDB8 - _0225DD9E - 2 ; case 3
	.short _0225DDB8 - _0225DD9E - 2 ; case 4
	.short _0225DDB8 - _0225DD9E - 2 ; case 5
	.short _0225DDB8 - _0225DD9E - 2 ; case 6
	.short _0225DDB8 - _0225DD9E - 2 ; case 7
	.short _0225DDB8 - _0225DD9E - 2 ; case 8
	.short _0225DDB8 - _0225DD9E - 2 ; case 9
	.short _0225DE00 - _0225DD9E - 2 ; case 10
	.short _0225DE22 - _0225DD9E - 2 ; case 11
	.short _0225DE68 - _0225DD9E - 2 ; case 12
_0225DDB8:
	add r0, r4, #0
	add r1, r5, #0
	bl ov29_0225DEF4
	add r0, r4, #0
	mov r1, #1
	bl ov29_0225DEB8
	add r0, r5, #0
	mov r1, #5
	bl _u32_div_f
	add r6, r1, #0
	add r0, r5, #0
	mov r1, #5
	bl _u32_div_f
	add r2, r0, #0
	mov r3, #6
	add r1, r6, #0
	mul r1, r3
	mul r3, r2
	add r2, r3, #7
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #0
	bl ov29_0225E078
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DE00:
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #2
	mov r2, #4
	mov r3, #3
	bl ov29_0225E028
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl ov29_0225DEB8
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DE22:
	add r0, r4, #0
	bl ov29_0225E0E0
	mov r0, #2
	lsl r0, r0, #8
	ldr r2, [r4, #0x10]
	ldr r1, [r4, r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _0225DE4E
	mov r0, #0
	mov r1, #3
	str r0, [sp]
	add r0, r4, #0
	mov r2, #4
	add r3, r1, #0
	bl ov29_0225E028
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DE4E:
	str r1, [r2, #4]
	mov r0, #2
	mov r1, #3
	str r0, [sp]
	add r0, r4, #0
	mov r2, #4
	add r3, r1, #0
	bl ov29_0225E028
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DE68:
	ldr r0, [r4, #0x10]
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #2
	mov r1, #4
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #3
	bl ov29_0225E028
	ldr r0, _0225DEAC ; =0x000005DD
	bl PlaySE
	b _0225DE98
_0225DE86:
	add r0, r4, #0
	bl ov29_0225DF74
	cmp r0, #0
	bne _0225DE98
	ldr r0, _0225DEB4 ; =0x000001FA
	ldrh r1, [r4, r0]
	sub r0, r0, #2
	strh r1, [r4, r0]
_0225DE98:
	add r0, r4, #0
	bl ov29_0225DB7C
	ldr r0, [r4, #0x18]
	bl sub_0202457C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225DEA8: .word ov29_0225E1AC
_0225DEAC: .word 0x000005DD
_0225DEB0: .word gSystem
_0225DEB4: .word 0x000001FA
	thumb_func_end ov29_0225DCD0

	thumb_func_start ov29_0225DEB8
ov29_0225DEB8: ; 0x0225DEB8
	push {r4, lr}
	mov r3, #0x7d
	lsl r3, r3, #2
	ldr r2, [r0, r3]
	add r1, r2, r1
	str r1, [r0, r3]
	ldr r4, [r0, r3]
	cmp r4, #0
	bge _0225DED0
	mov r1, #0
	str r1, [r0, r3]
	b _0225DEDE
_0225DED0:
	add r1, r3, #0
	add r1, #8
	ldr r1, [r0, r1]
	cmp r4, r1
	blo _0225DEDE
	sub r1, r1, #1
	str r1, [r0, r3]
_0225DEDE:
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	cmp r1, r2
	bne _0225DEEC
	mov r0, #0
	pop {r4, pc}
_0225DEEC:
	bl ov29_0225DC50
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov29_0225DEB8

	thumb_func_start ov29_0225DEF4
ov29_0225DEF4: ; 0x0225DEF4
	push {r4, lr}
	mov r3, #0x7d
	lsl r3, r3, #2
	ldr r2, [r0, r3]
	lsl r2, r2, #2
	add r4, r0, r2
	add r2, r3, #0
	sub r2, #0x18
	str r1, [r4, r2]
	ldr r2, [r0, r3]
	sub r3, #0x6c
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r0, [r0, r3]
	add r1, r1, #1
	bl Set2dSpriteAnimSeqNo
	pop {r4, pc}
	thumb_func_end ov29_0225DEF4

	thumb_func_start ov29_0225DF18
ov29_0225DF18: ; 0x0225DF18
	push {r3, r4, lr}
	sub sp, #0xc
	mov r3, #0x75
	add r4, r0, #0
	lsl r3, r3, #2
	ldrb r0, [r4, r3]
	lsl r2, r0, #0x1f
	lsr r2, r2, #0x1f
	bne _0225DF3E
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	lsl r0, r0, #2
	add r0, r4, r0
	sub r3, #0x60
	ldr r0, [r0, r3]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r3, r4, pc}
_0225DF3E:
	add r0, r3, #6
	ldrb r0, [r4, r0]
	add r2, r3, #4
	str r0, [sp]
	add r0, r3, #7
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4, r3]
	add r3, r3, #5
	ldrb r2, [r4, r2]
	lsl r1, r1, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r4]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	mov r1, #0x75
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov29_0225DF18

	thumb_func_start ov29_0225DF74
ov29_0225DF74: ; 0x0225DF74
	push {r4, lr}
	mov r1, #0x75
	lsl r1, r1, #2
	add r4, r0, r1
	ldrb r3, [r4, #3]
	lsl r1, r3, #0x1d
	lsr r1, r1, #0x1d
	beq _0225DF8E
	cmp r1, #1
	beq _0225DFB0
	cmp r1, #2
	beq _0225DFFC
	b _0225E022
_0225DF8E:
	ldrb r1, [r4, #1]
	bl ov29_0225DF18
	ldrb r2, [r4, #3]
	mov r1, #7
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1d
	lsr r1, r1, #0x1d
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #7
	and r1, r2
	orr r0, r1
	strb r0, [r4, #3]
	b _0225E022
_0225DFB0:
	mov r2, #0xf8
	add r1, r3, #0
	bic r1, r2
	lsl r2, r3, #0x18
	lsr r2, r2, #0x1b
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1b
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1b
	cmp r1, #4
	bne _0225E022
	ldrb r1, [r4, #2]
	bl ov29_0225DF18
	ldrb r1, [r4, #3]
	mov r0, #0xf8
	bic r1, r0
	strb r1, [r4, #3]
	ldrb r2, [r4, #3]
	mov r1, #7
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1d
	lsr r1, r1, #0x1d
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #7
	and r1, r2
	orr r0, r1
	strb r0, [r4, #3]
	b _0225E022
_0225DFFC:
	mov r1, #0xf8
	add r0, r3, #0
	bic r0, r1
	lsl r1, r3, #0x18
	lsr r1, r1, #0x1b
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	cmp r0, #2
	bne _0225E022
	mov r0, #0
	pop {r4, pc}
_0225E022:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov29_0225DF74

	thumb_func_start ov29_0225E028
ov29_0225E028: ; 0x0225E028
	push {r3, r4, r5, r6}
	mov r4, #0x75
	lsl r4, r4, #2
	ldrb r6, [r0, r4]
	mov r5, #1
	lsl r1, r1, #0x19
	bic r6, r5
	add r5, r4, #3
	strb r6, [r0, r4]
	ldrb r6, [r0, r5]
	mov r5, #0xf8
	lsr r1, r1, #0x18
	bic r6, r5
	add r5, r4, #3
	strb r6, [r0, r5]
	ldrb r6, [r0, r5]
	mov r5, #7
	bic r6, r5
	add r5, r4, #3
	strb r6, [r0, r5]
	ldrb r5, [r0, r4]
	mov r6, #0xfe
	bic r5, r6
	orr r1, r5
	strb r1, [r0, r4]
	add r1, r4, #1
	strb r2, [r0, r1]
	add r1, r4, #2
	strb r3, [r0, r1]
	add r1, sp, #0
	ldrh r2, [r1, #0x10]
	add r1, r4, #0
	add r1, #0x26
	strh r2, [r0, r1]
	mov r1, #1
	add r4, #0x24
	strh r1, [r0, r4]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov29_0225E028

	thumb_func_start ov29_0225E078
ov29_0225E078: ; 0x0225E078
	push {r4, r5, r6, r7}
	add r4, r1, #0
	add r1, r2, #0
	mov r2, #0x75
	add r5, r0, #0
	lsl r2, r2, #2
	add r0, r3, #0
	ldrb r6, [r5, r2]
	mov r3, #1
	mov r7, #0xf8
	bic r6, r3
	mov r3, #1
	orr r6, r3
	strb r6, [r5, r2]
	add r6, r2, #3
	ldrb r6, [r5, r6]
	bic r6, r7
	add r7, r2, #3
	strb r6, [r5, r7]
	add r6, r7, #0
	ldrb r6, [r5, r6]
	mov r7, #7
	bic r6, r7
	add r7, r2, #3
	strb r6, [r5, r7]
	ldrb r6, [r5, r2]
	mov r7, #0xfe
	bic r6, r7
	mov r7, #0xa
	orr r6, r7
	strb r6, [r5, r2]
	add r6, r2, #1
	strb r3, [r5, r6]
	mov r7, #0
	add r6, r2, #2
	strb r7, [r5, r6]
	add r6, r2, #4
	strb r4, [r5, r6]
	add r4, r2, #5
	strb r1, [r5, r4]
	mov r4, #6
	add r1, r2, #6
	strb r4, [r5, r1]
	add r1, r2, #7
	strb r4, [r5, r1]
	add r1, r2, #0
	add r1, #0x26
	strh r0, [r5, r1]
	add r2, #0x24
	strh r3, [r5, r2]
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov29_0225E078

	thumb_func_start ov29_0225E0E0
ov29_0225E0E0: ; 0x0225E0E0
	push {r4, r5, r6, r7}
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r5, [r0, r1]
	mov r2, #0
	add r3, r2, #0
	cmp r5, #0
	bls _0225E108
	add r7, r1, #0
	add r4, r0, #0
	mov r6, #0xa
	sub r7, #0x20
_0225E0F8:
	add r1, r2, #0
	ldr r2, [r4, r7]
	mul r1, r6
	add r3, r3, #1
	add r2, r1, r2
	add r4, r4, #4
	cmp r3, r5
	blo _0225E0F8
_0225E108:
	mov r1, #2
	lsl r1, r1, #8
	str r2, [r0, r1]
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov29_0225E0E0

	.rodata

ov29_0225E114:
	.byte 0x80

ov29_0225E115:
	.byte 0x08, 0x27, 0x70, 0x8F, 0xFF, 0x00, 0x00, 0x00

ov29_0225E11D:
	.byte 0x08, 0x27, 0x60
	.byte 0x7F, 0x08, 0x27, 0x80, 0x9F, 0xFF, 0x00, 0x00, 0x00

ov29_0225E129:
	.byte 0x08, 0x27, 0x50, 0x6F, 0x08, 0x27, 0x70
	.byte 0x8F, 0x08, 0x27, 0x90, 0xAF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov29_0225E13C: ; 0x0225E13C
	.word ov29_0225DC44
	.word ov29_0225DC44
	.word ov29_0225DC48
	.word ov29_0225DC48

ov29_0225E14C:
	.byte 0x08, 0x27, 0x40, 0x5F
	.byte 0x08, 0x27, 0x60, 0x7F, 0x08, 0x27, 0x80, 0x9F, 0x08, 0x27, 0xA0, 0xBF, 0xFF, 0x00, 0x00, 0x00

ov29_0225E160:
	.byte 0x08, 0x27, 0x30, 0x4F, 0x08, 0x27, 0x50, 0x6F, 0x08, 0x27, 0x70, 0x8F, 0x08, 0x27, 0x90, 0xAF
	.byte 0x08, 0x27, 0xB0, 0xCF, 0xFF, 0x00, 0x00, 0x00

ov29_0225E178: ; 0x0225E178
	.byte 0x04, 0x01, 0x15, 0x08, 0x02, 0x00, 0x01, 0x00
	.byte 0x04, 0x0C, 0x15, 0x08, 0x02, 0x00, 0x11, 0x00, 0x04, 0x17, 0x15, 0x08, 0x02, 0x00, 0x21, 0x00

ov29_0225E190:
	.byte 0x08, 0x27, 0x20, 0x3F, 0x08, 0x27, 0x40, 0x5F, 0x08, 0x27, 0x60, 0x7F, 0x08, 0x27, 0x80, 0x9F
	.byte 0x08, 0x27, 0xA0, 0xBF, 0x08, 0x27, 0xC0, 0xE0, 0xFF, 0x00, 0x00, 0x00

ov29_0225E1AC: ; 0x0225E1AC
	.word 0
	.word ov29_0225E115
	.word ov29_0225E11D
	.word ov29_0225E129
	.word ov29_0225E14C
	.word ov29_0225E160
	.word ov29_0225E190

ov29_0225E1C8: ; 0x0225E1C8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov29_0225E1E4: ; 0x0225E1E4
	.word 0
	.word ov29_0225E114
	.word ov29_0225E2E8
	.word ov29_0225E2EC
	.word ov29_0225E2F0
	.word ov29_0225E2F4
	.word ov29_0225E2FC

ov29_0225E200: ; 0x0225E200
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov29_0225E21C: ; 0x0225E21C
	.byte 0x20, 0x20, 0x00, 0x01

ov29_0225E220: ; 0x0225E220
	.byte 0x30, 0x24, 0x00, 0x00

ov29_0225E224: ; 0x0225E224
	.byte 0x28, 0xB0, 0x01, 0x03

ov29_0225E228: ; 0x0225E228
	.byte 0x80, 0xB0, 0x01, 0x03

ov29_0225E22C: ; 0x0225E22C
	.byte 0xD8, 0xB0, 0x01, 0x03

ov29_0225E230: ; 0x0225E230
	.byte 0x30, 0x18, 0x01, 0x01

ov29_0225E234: ; 0x0225E234
	.byte 0x50, 0x18, 0x01, 0x01

ov29_0225E238: ; 0x0225E238
	.byte 0x70, 0x18, 0x01, 0x01

ov29_0225E23C: ; 0x0225E23C
	.byte 0x90, 0x18, 0x01, 0x01

ov29_0225E240: ; 0x0225E240
	.byte 0xB0, 0x18, 0x01, 0x01

ov29_0225E244: ; 0x0225E244
	.byte 0xD0, 0x18, 0x01, 0x01

ov29_0225E248: ; 0x0225E248
	.byte 0x38, 0x67, 0x08, 0x37, 0x38, 0x67, 0x38, 0x67
	.byte 0x38, 0x67, 0x68, 0x97, 0x38, 0x67, 0x98, 0xC7, 0x38, 0x67, 0xC8, 0xF7, 0x68, 0x97, 0x08, 0x37
	.byte 0x68, 0x97, 0x38, 0x67, 0x68, 0x97, 0x68, 0x97, 0x68, 0x97, 0x98, 0xC7, 0x68, 0x97, 0xC8, 0xF7
	.byte 0xA0, 0xBF, 0x00, 0x4F, 0xA0, 0xBF, 0x58, 0xA7, 0xA0, 0xBF, 0xB0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov29_0225E280: ; 0x0225E280
	.byte 0x20, 0x50, 0x00, 0x00, 0x00, 0x05, 0x04, 0x01, 0x50, 0x50, 0x00, 0x00, 0x01, 0x06, 0x00, 0x02
	.byte 0x80, 0x50, 0x00, 0x00, 0x02, 0x07, 0x01, 0x03, 0xB0, 0x50, 0x00, 0x00, 0x03, 0x08, 0x02, 0x04
	.byte 0xE0, 0x50, 0x00, 0x00, 0x04, 0x09, 0x03, 0x00, 0x20, 0x80, 0x00, 0x00, 0x00, 0x8A, 0x09, 0x06
	.byte 0x50, 0x80, 0x00, 0x00, 0x01, 0x8A, 0x05, 0x07, 0x80, 0x80, 0x00, 0x00, 0x02, 0x8B, 0x06, 0x08
	.byte 0xB0, 0x80, 0x00, 0x00, 0x03, 0x8C, 0x07, 0x09, 0xE0, 0x80, 0x00, 0x00, 0x04, 0x8C, 0x08, 0x05
	.byte 0x28, 0xB0, 0x00, 0x00, 0x85, 0x0A, 0x0C, 0x0B, 0x80, 0xB0, 0x00, 0x00, 0x87, 0x0B, 0x0A, 0x0C
	.byte 0xD8, 0xB0, 0x00, 0x00, 0x89, 0x0C, 0x0B, 0x0A

ov29_0225E2E8:
	.byte 0x70, 0x90, 0x00, 0x00

ov29_0225E2EC:
	.byte 0x60, 0x80, 0xA0, 0x00

ov29_0225E2F0:
	.byte 0x50, 0x70, 0x90, 0xB0

ov29_0225E2F4:
	.byte 0x40, 0x60, 0x80, 0xA0, 0xC0, 0x00, 0x00, 0x00

ov29_0225E2FC:
	.byte 0x30, 0x50, 0x70, 0x90, 0xB0, 0xD0, 0x00, 0x00
