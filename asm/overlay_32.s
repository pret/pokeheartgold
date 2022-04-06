	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov32_0225D520
ov32_0225D520: ; 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r1, [sp]
	mov r0, #3
	str r2, [sp, #4]
	mov r1, #8
	lsl r2, r0, #0xf
	add r4, r3, #0
	bl CreateHeap
	ldr r0, _0225D5C0 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	mov r1, #0xad
	ldr r0, _0225D5C4 ; =ov32_0225DDC4
	lsl r1, r1, #2
	mov r2, #0xa
	mov r3, #8
	bl sub_02007200
	add r7, r0, #0
	bl sub_0201F988
	add r5, r0, #0
	ldr r0, [sp]
	str r6, [r5]
	str r0, [r5, #4]
	ldr r0, [sp, #4]
	str r0, [r5, #8]
	str r4, [r5, #0xc]
	str r7, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl sub_0202C6F4
	str r0, [r5, #0x14]
	mov r0, #0x2b
	lsl r0, r0, #4
	str r4, [r5, r0]
	mov r1, #0
	ldr r0, [r5, r0]
	mvn r1, r1
	str r1, [r0]
	mov r0, #4
	mov r1, #8
	bl FontID_Alloc
	ldr r0, _0225D5C8 ; =0x00000105
	mov r1, #8
	bl NARC_ctor
	add r4, r0, #0
	bl ov32_0225D60C
	add r0, r6, #0
	bl ov32_0225D634
	add r0, r5, #0
	add r1, r4, #0
	bl ov32_0225D6E0
	add r0, r5, #0
	bl ov32_0225D748
	add r0, r5, #0
	bl ov32_0225D788
	add r0, r5, #0
	add r1, r4, #0
	bl ov32_0225DA88
	add r0, r5, #0
	bl ov32_0225DD74
	add r0, r4, #0
	bl NARC_dtor
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D5C0: .word 0x04001050
_0225D5C4: .word ov32_0225DDC4
_0225D5C8: .word 0x00000105
	thumb_func_end ov32_0225D520

	thumb_func_start ov32_0225D5CC
ov32_0225D5CC: ; 0x0225D5CC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	bl sub_0201F988
	add r4, r0, #0
	bl ov32_0225DDAC
	add r0, r4, #0
	bl ov32_0225DAC0
	add r0, r4, #0
	bl ov32_0225D834
	add r0, r4, #0
	bl ov32_0225D76C
	ldr r0, [r4]
	bl ov32_0225D6C4
	mov r0, #4
	bl FontID_Release
	add r0, r5, #0
	bl sub_02007234
	mov r0, #8
	bl DestroyHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov32_0225D5CC

	thumb_func_start ov32_0225D608
ov32_0225D608: ; 0x0225D608
	mov r0, #1
	bx lr
	thumb_func_end ov32_0225D608

	thumb_func_start ov32_0225D60C
ov32_0225D60C: ; 0x0225D60C
	push {r3, lr}
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #1
	lsl r0, r0, #8
	bl GX_SetBankForSubOBJ
	ldr r2, _0225D62C ; =0x04001000
	ldr r0, _0225D630 ; =0xFFCFFFEF
	ldr r1, [r2]
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0225D62C: .word 0x04001000
_0225D630: .word 0xFFCFFFEF
	thumb_func_end ov32_0225D60C

	thumb_func_start ov32_0225D634
ov32_0225D634: ; 0x0225D634
	push {r4, r5, lr}
	sub sp, #0x54
	add r4, r0, #0
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r5, _0225D6B8 ; =ov32_0225E1A4
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
	ldr r5, _0225D6BC ; =ov32_0225E1C0
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
	ldr r5, _0225D6C0 ; =ov32_0225E188
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
_0225D6B8: .word ov32_0225E1A4
_0225D6BC: .word ov32_0225E1C0
_0225D6C0: .word ov32_0225E188
	thumb_func_end ov32_0225D634

	thumb_func_start ov32_0225D6C4
ov32_0225D6C4: ; 0x0225D6C4
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
	thumb_func_end ov32_0225D6C4

	thumb_func_start ov32_0225D6E0
ov32_0225D6E0: ; 0x0225D6E0
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
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #2
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
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
	thumb_func_end ov32_0225D6E0

	thumb_func_start ov32_0225D748
ov32_0225D748: ; 0x0225D748
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc4
	mov r3, #8
	bl NewMsgDataFromNarc
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #8
	bl ScrStrBufs_new
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov32_0225D748

	thumb_func_start ov32_0225D76C
ov32_0225D76C: ; 0x0225D76C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov32_0225D76C

	thumb_func_start ov32_0225D788
ov32_0225D788: ; 0x0225D788
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r5, #0
	ldr r7, _0225D82C ; =ov32_0225E24C
	mov r4, #0
	add r6, #0x24
_0225D796:
	lsl r1, r4, #4
	lsl r2, r4, #3
	ldr r0, [r5]
	add r1, r6, r1
	add r2, r7, r2
	bl AddWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _0225D796
	add r0, r5, #0
	add r0, #0x24
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1d
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x24
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	lsr r4, r0, #0x10
	mov r0, #4
	add r1, r6, #0
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r0, r0, #1
	sub r0, r4, r0
	lsl r0, r0, #0x10
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D830 ; =0x00050600
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r0, #0x24
	mov r1, #4
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x24
	bl CopyWindowPixelsToVram_TextMode
	add r0, r5, #0
	add r0, #0x24
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl ov32_0225D84C
	add r0, r5, #0
	bl ov32_0225D988
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D82C: .word ov32_0225E24C
_0225D830: .word 0x00050600
	thumb_func_end ov32_0225D788

	thumb_func_start ov32_0225D834
ov32_0225D834: ; 0x0225D834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x24
_0225D83C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x12
	blo _0225D83C
	pop {r3, r4, r5, pc}
	thumb_func_end ov32_0225D834

	thumb_func_start ov32_0225D84C
ov32_0225D84C: ; 0x0225D84C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x34
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1c
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r5, #0
	add r0, #0x34
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r1, r0, r7
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	lsr r4, r0, #0x10
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D980 ; =0x00050600
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x34
	add r3, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #4
	mov r1, #8
	bl String_ctor
	add r6, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1b
	bl NewString_ReadMsgData
	mov r1, #0
	str r0, [sp, #0x10]
	mov r0, #0x52
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #4
	bl BufferIntegerAsString
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	add r1, r6, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D980 ; =0x00050600
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x34
	add r3, r4, r7
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	bl String_dtor
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1b
	bl NewString_ReadMsgData
	mov r1, #0
	add r7, r0, #0
	mov r0, #0x52
	str r1, [sp]
	mov r3, #1
	ldr r2, _0225D984 ; =0x000002AA
	str r3, [sp, #4]
	ldrsb r2, [r5, r2]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	sub r0, r4, r0
	lsl r0, r0, #0x10
	mov r1, #0
	lsr r3, r0, #0x10
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D980 ; =0x00050600
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x34
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x34
	bl CopyWindowPixelsToVram_TextMode
	add r5, #0x34
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D980: .word 0x00050600
_0225D984: .word 0x000002AA
	thumb_func_end ov32_0225D84C

	thumb_func_start ov32_0225D988
ov32_0225D988: ; 0x0225D988
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r0, #0
	ldr r0, _0225DA7C ; =0x000002AB
	ldrb r0, [r7, r0]
	cmp r0, #0
	bne _0225D99C
	add r5, r7, #0
	add r5, #0x44
	b _0225D9A0
_0225D99C:
	add r5, r7, #0
	add r5, #0xc4
_0225D9A0:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0x1e
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	mov r0, #0x40
	mov r1, #8
	bl String_ctor
	str r0, [sp, #0x14]
	mov r0, #8
	bl PlayerProfile_new
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r4, #0
_0225D9D4:
	ldr r1, _0225DA80 ; =0x000002AA
	ldr r0, [r7, #0x14]
	ldrsb r1, [r7, r1]
	lsl r1, r1, #3
	add r1, r4, r1
	bl sub_0202C254
	add r1, r0, #0
	ldr r0, [sp, #0x1c]
	bl Sav2_Profile_PlayerName_set
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldr r2, [sp, #0x1c]
	mov r1, #0
	bl BufferPlayersName
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	bl StringExpandPlaceholders
	lsl r0, r4, #4
	str r0, [sp, #0x20]
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	ldr r1, [sp, #0x14]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DA84 ; =0x00050600
	lsr r6, r3, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #0x14]
	add r0, r5, r0
	mov r1, #4
	sub r3, r3, r6
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x20]
	add r0, r5, r0
	bl CopyWindowPixelsToVram_TextMode
	ldr r0, [sp, #0x20]
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #8
	blo _0225D9D4
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl String_dtor
	ldr r0, [sp, #0x18]
	bl String_dtor
	ldr r1, _0225DA7C ; =0x000002AB
	mov r0, #1
	ldrb r2, [r7, r1]
	eor r0, r2
	strb r0, [r7, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0225DA7C: .word 0x000002AB
_0225DA80: .word 0x000002AA
_0225DA84: .word 0x00050600
	thumb_func_end ov32_0225D988

	thumb_func_start ov32_0225DA88
ov32_0225DA88: ; 0x0225DA88
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x15
	add r5, r0, #0
	lsl r1, r1, #4
	mov r0, #4
	add r1, r5, r1
	mov r2, #8
	bl G2dRenderer_Init
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #4
	mov r2, #1
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r5, #0
	bl ov32_0225DADC
	add r0, r5, #0
	add r1, r4, #0
	bl ov32_0225DC68
	pop {r3, r4, r5, pc}
	thumb_func_end ov32_0225DA88

	thumb_func_start ov32_0225DAC0
ov32_0225DAC0: ; 0x0225DAC0
	push {r4, lr}
	add r4, r0, #0
	bl ov32_0225DCD4
	add r0, r4, #0
	bl ov32_0225DB00
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024504
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov32_0225DAC0

	thumb_func_start ov32_0225DADC
ov32_0225DADC: ; 0x0225DADC
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0x9e
	add r5, r0, #0
	mov r4, #0
	mov r7, #1
	lsl r6, r6, #2
_0225DAE8:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #8
	bl Create2DGfxResObjMan
	str r0, [r5, r6]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225DAE8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov32_0225DADC

	thumb_func_start ov32_0225DB00
ov32_0225DB00: ; 0x0225DB00
	push {r4, r5, r6, lr}
	mov r6, #0x9e
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_0225DB0A:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225DB0A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov32_0225DB00

	thumb_func_start ov32_0225DB1C
ov32_0225DB1C: ; 0x0225DB1C
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
	thumb_func_end ov32_0225DB1C

	thumb_func_start ov32_0225DBAC
ov32_0225DBAC: ; 0x0225DBAC
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
	thumb_func_end ov32_0225DBAC

	thumb_func_start ov32_0225DC0C
ov32_0225DC0C: ; 0x0225DC0C
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r3, #0
	mov r3, #0x53
	add r4, r0, #0
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	lsl r6, r1, #2
	str r2, [sp, #4]
	str r0, [sp]
	ldrb r0, [r5]
	mov r2, #1
	lsl r2, r2, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldrb r0, [r5, #1]
	lsl r0, r0, #0xc
	add r0, r0, r2
	lsr r2, r2, #8
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r2, sp, #0
	strh r0, [r2, #0x20]
	ldrb r0, [r5, #2]
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp, #0x28]
	mov r0, #8
	str r0, [sp, #0x2c]
	lsl r0, r3, #1
	add r4, r4, r0
	add r0, sp, #0
	bl CreateSprite
	str r0, [r4, r6]
	ldrb r1, [r5, #3]
	ldr r0, [r4, r6]
	bl Set2dSpriteAnimSeqNo
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov32_0225DC0C

	thumb_func_start ov32_0225DC68
ov32_0225DC68: ; 0x0225DC68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r6, r0, #0
	mov r0, #7
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _0225DCCC ; =0x00000781
	add r2, r1, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r1, #0xa2
	str r0, [sp, #0x18]
	lsl r1, r1, #2
	str r0, [sp, #0x1c]
	add r0, r6, r1
	sub r1, #0x10
	add r1, r6, r1
	mov r3, #4
	bl ov32_0225DB1C
	mov r1, #0xa2
	lsl r1, r1, #2
	add r0, r6, r1
	sub r1, #0x10
	add r1, r6, r1
	add r2, sp, #0x20
	mov r3, #1
	bl ov32_0225DBAC
	ldr r5, _0225DCD0 ; =ov32_0225E178
	mov r4, #0
	add r7, sp, #0x20
_0225DCB2:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	add r3, r5, #0
	bl ov32_0225DC0C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225DCB2
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0225DCCC: .word 0x00000781
_0225DCD0: .word ov32_0225E178
	thumb_func_end ov32_0225DC68

	thumb_func_start ov32_0225DCD4
ov32_0225DCD4: ; 0x0225DCD4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #0xa6
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #2
_0225DCE0:
	ldr r0, [r5, r6]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225DCE0
	mov r0, #0xa2
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200AEB0
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl sub_0200B0A8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov32_0225DCD4

	thumb_func_start ov32_0225DD04
ov32_0225DD04: ; 0x0225DD04
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #1
	mov r6, #0xa6
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #0xc
	lsl r6, r6, #2
_0225DD12:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_020249B0
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0225DD12
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov32_0225DD04

	thumb_func_start ov32_0225DD24
ov32_0225DD24: ; 0x0225DD24
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x18]
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
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	cmp r4, #8
	bne _0225DD64
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
_0225DD64:
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov32_0225DD24

	thumb_func_start ov32_0225DD74
ov32_0225DD74: ; 0x0225DD74
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r0, _0225DDA0 ; =ov32_0225E1DC
	ldr r1, _0225DDA4 ; =ov32_0225E204
	ldr r2, _0225DDA8 ; =ov32_0225E168
	add r3, r4, #0
	bl sub_02019BA4
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	bl ov32_0225DD24
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0225DDA0: .word ov32_0225E1DC
_0225DDA4: .word ov32_0225E204
_0225DDA8: .word ov32_0225E168
	thumb_func_end ov32_0225DD74

	thumb_func_start ov32_0225DDAC
ov32_0225DDAC: ; 0x0225DDAC
	ldr r3, _0225DDB4 ; =sub_02019BDC
	ldr r0, [r0, #0x18]
	bx r3
	nop
_0225DDB4: .word sub_02019BDC
	thumb_func_end ov32_0225DDAC

	thumb_func_start ov32_0225DDB8
ov32_0225DDB8: ; 0x0225DDB8
	bx lr
	.balign 4, 0
	thumb_func_end ov32_0225DDB8

	thumb_func_start ov32_0225DDBC
ov32_0225DDBC: ; 0x0225DDBC
	ldr r3, _0225DDC0 ; =ov32_0225DD24
	bx r3
	.balign 4, 0
_0225DDC0: .word ov32_0225DD24
	thumb_func_end ov32_0225DDBC

	thumb_func_start ov32_0225DDC4
ov32_0225DDC4: ; 0x0225DDC4
	push {r4, lr}
	mov r0, #0xaa
	add r4, r1, #0
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #3
	bhi _0225DE22
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225DDDE: ; jump table
	.short _0225DDE6 - _0225DDDE - 2 ; case 0
	.short _0225DDF4 - _0225DDDE - 2 ; case 1
	.short _0225DE02 - _0225DDDE - 2 ; case 2
	.short _0225DE18 - _0225DDDE - 2 ; case 3
_0225DDE6:
	add r0, r4, #0
	bl ov32_0225DE34
	mov r1, #0xaa
	lsl r1, r1, #2
	strb r0, [r4, r1]
	b _0225DE22
_0225DDF4:
	add r0, r4, #0
	bl ov32_0225DF80
	mov r1, #0xaa
	lsl r1, r1, #2
	strb r0, [r4, r1]
	b _0225DE22
_0225DE02:
	add r0, r4, #0
	bl ov32_0225D84C
	add r0, r4, #0
	bl ov32_0225D988
	mov r0, #0xaa
	mov r1, #0
	lsl r0, r0, #2
	strb r1, [r4, r0]
	b _0225DE22
_0225DE18:
	add r1, r0, #4
	add r0, #8
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	str r1, [r0]
_0225DE22:
	add r0, r4, #0
	bl ov32_0225DD04
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202457C
	pop {r4, pc}
	thumb_func_end ov32_0225DDC4

	thumb_func_start ov32_0225DE34
ov32_0225DE34: ; 0x0225DE34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0225DF6C ; =_0225E15C
	bl sub_02025224
	cmp r0, #0
	bne _0225DE56
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DE56:
	cmp r0, #1
	bne _0225DE6C
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DE6C:
	ldr r0, [r5, #0x18]
	bl sub_02019D18
	mov r1, #2
	add r4, r0, #0
	mvn r1, r1
	cmp r4, r1
	bhi _0225DEA8
	bhs _0225DF62
	cmp r4, #8
	bhi _0225DEA0
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DE8E: ; jump table
	.short _0225DEBA - _0225DE8E - 2 ; case 0
	.short _0225DEBA - _0225DE8E - 2 ; case 1
	.short _0225DEBA - _0225DE8E - 2 ; case 2
	.short _0225DEBA - _0225DE8E - 2 ; case 3
	.short _0225DEBA - _0225DE8E - 2 ; case 4
	.short _0225DEBA - _0225DE8E - 2 ; case 5
	.short _0225DEBA - _0225DE8E - 2 ; case 6
	.short _0225DEBA - _0225DE8E - 2 ; case 7
	.short _0225DEEA - _0225DE8E - 2 ; case 8
_0225DEA0:
	mov r0, #3
	mvn r0, r0
	cmp r4, r0
	b _0225DF68
_0225DEA8:
	add r0, r1, #1
	cmp r4, r0
	bhi _0225DEB2
	beq _0225DEEA
	b _0225DF68
_0225DEB2:
	add r0, r1, #2
	cmp r4, r0
	beq _0225DF0A
	b _0225DF68
_0225DEBA:
	ldr r0, _0225DF70 ; =0x000005DD
	bl PlaySE
	ldr r0, _0225DF74 ; =0x000002AA
	lsr r3, r4, #1
	ldrsb r1, [r5, r0]
	add r0, r0, #2
	lsl r2, r3, #2
	add r2, r3, r2
	lsl r1, r1, #3
	add r1, r4, r1
	str r1, [r5, r0]
	lsl r1, r4, #0x1f
	lsr r1, r1, #0x1b
	add r1, r1, #2
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	mov r3, #3
	bl ov32_0225E0FC
	pop {r3, r4, r5, pc}
_0225DEEA:
	ldr r0, _0225DF70 ; =0x000005DD
	bl PlaySE
	mov r1, #1
	mov r0, #0xab
	mvn r1, r1
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r2, #3
	str r2, [sp]
	add r0, r5, #0
	mov r1, #1
	mov r3, #2
	bl ov32_0225E0A8
	pop {r3, r4, r5, pc}
_0225DF0A:
	ldr r0, [r5, #0x18]
	bl sub_02019F74
	ldr r1, _0225DF78 ; =gSystem
	ldr r2, [r1, #0x4c]
	mov r1, #0x10
	tst r1, r2
	beq _0225DF3A
	cmp r0, #1
	beq _0225DF2A
	cmp r0, #3
	beq _0225DF2A
	cmp r0, #5
	beq _0225DF2A
	cmp r0, #7
	bne _0225DF3A
_0225DF2A:
	ldr r0, _0225DF7C ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DF3A:
	mov r1, #0x20
	tst r1, r2
	beq _0225DF68
	cmp r0, #0
	beq _0225DF50
	cmp r0, #2
	beq _0225DF50
	cmp r0, #4
	beq _0225DF50
	cmp r0, #6
	bne _0225DF68
_0225DF50:
	ldr r0, _0225DF7C ; =0x000005DC
	bl PlaySE
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov32_0225DF9C
	pop {r3, r4, r5, pc}
_0225DF62:
	ldr r0, _0225DF7C ; =0x000005DC
	bl PlaySE
_0225DF68:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225DF6C: .word _0225E15C
_0225DF70: .word 0x000005DD
_0225DF74: .word 0x000002AA
_0225DF78: .word gSystem
_0225DF7C: .word 0x000005DC
	thumb_func_end ov32_0225DE34

	thumb_func_start ov32_0225DF80
ov32_0225DF80: ; 0x0225DF80
	push {r4, lr}
	add r4, r0, #0
	bl ov32_0225E048
	cmp r0, #0
	bne _0225DF92
	ldr r0, _0225DF98 ; =0x000002A9
	ldrb r0, [r4, r0]
	pop {r4, pc}
_0225DF92:
	mov r0, #1
	pop {r4, pc}
	nop
_0225DF98: .word 0x000002A9
	thumb_func_end ov32_0225DF80

	thumb_func_start ov32_0225DF9C
ov32_0225DF9C: ; 0x0225DF9C
	push {r3, lr}
	ldr r2, _0225DFE4 ; =0x000002AA
	ldrsb r3, [r0, r2]
	add r3, r3, r1
	strb r3, [r0, r2]
	ldrsb r3, [r0, r2]
	cmp r3, #0
	bge _0225DFB0
	mov r3, #3
	strb r3, [r0, r2]
_0225DFB0:
	ldr r2, _0225DFE4 ; =0x000002AA
	ldrsb r3, [r0, r2]
	cmp r3, #3
	ble _0225DFBC
	mov r3, #0
	strb r3, [r0, r2]
_0225DFBC:
	cmp r1, #0
	ble _0225DFC6
	mov r2, #3
	mov r3, #6
	b _0225DFCA
_0225DFC6:
	mov r2, #2
	mov r3, #4
_0225DFCA:
	mov r1, #2
	str r1, [sp]
	lsl r1, r2, #0x18
	add r2, r3, #1
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov32_0225E0A8
	pop {r3, pc}
	nop
_0225DFE4: .word 0x000002AA
	thumb_func_end ov32_0225DF9C

	thumb_func_start ov32_0225DFE8
ov32_0225DFE8: ; 0x0225DFE8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #0x1c]
	lsl r2, r0, #0x1f
	lsr r2, r2, #0x1f
	bne _0225E00C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	lsl r0, r0, #2
	add r2, r4, r0
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r3, r4, pc}
_0225E00C:
	add r0, r4, #0
	add r0, #0x22
	ldrb r0, [r0]
	add r2, r4, #0
	add r3, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	add r2, #0x20
	add r3, #0x21
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r1, [r4, #0x1c]
	ldrb r2, [r2]
	ldrb r3, [r3]
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	ldrb r1, [r4, #0x1c]
	ldr r0, [r4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov32_0225DFE8

	thumb_func_start ov32_0225E048
ov32_0225E048: ; 0x0225E048
	push {r4, lr}
	add r4, r0, #0
	add r4, #0x1c
	ldrb r1, [r4, #2]
	cmp r1, #0
	beq _0225E05E
	cmp r1, #1
	beq _0225E070
	cmp r1, #2
	beq _0225E092
	b _0225E0A2
_0225E05E:
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl ov32_0225DFE8
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _0225E0A2
_0225E070:
	ldrb r1, [r4, #3]
	add r1, r1, #1
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	cmp r1, #4
	bne _0225E0A2
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl ov32_0225DFE8
	mov r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _0225E0A2
_0225E092:
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _0225E0A2
	mov r0, #0
	pop {r4, pc}
_0225E0A2:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov32_0225E048

	thumb_func_start ov32_0225E0A8
ov32_0225E0A8: ; 0x0225E0A8
	push {r4, r5}
	ldrb r5, [r0, #0x1c]
	mov r4, #1
	lsl r1, r1, #0x19
	bic r5, r4
	strb r5, [r0, #0x1c]
	mov r4, #0
	strb r4, [r0, #0x1f]
	strb r4, [r0, #0x1e]
	ldrb r5, [r0, #0x1c]
	mov r4, #0xfe
	lsr r1, r1, #0x18
	bic r5, r4
	orr r1, r5
	strb r1, [r0, #0x1c]
	ldrb r4, [r0, #0x1d]
	mov r1, #0xf
	bic r4, r1
	mov r1, #0xf
	and r1, r2
	orr r1, r4
	strb r1, [r0, #0x1d]
	ldrb r2, [r0, #0x1d]
	mov r1, #0xf0
	bic r2, r1
	lsl r1, r3, #0x1c
	lsr r1, r1, #0x18
	orr r1, r2
	strb r1, [r0, #0x1d]
	ldr r1, _0225E0F4 ; =0xFFFFFFF8
	add r1, sp
	ldrb r2, [r1, #0x10]
	ldr r1, _0225E0F8 ; =0x000002A9
	strb r2, [r0, r1]
	mov r0, #1
	pop {r4, r5}
	bx lr
	nop
_0225E0F4: .word 0xFFFFFFF8
_0225E0F8: .word 0x000002A9
	thumb_func_end ov32_0225E0A8

	thumb_func_start ov32_0225E0FC
ov32_0225E0FC: ; 0x0225E0FC
	push {r3, r4, r5, r6}
	ldrb r5, [r0, #0x1c]
	mov r4, #1
	bic r5, r4
	mov r4, #1
	orr r5, r4
	strb r5, [r0, #0x1c]
	mov r5, #0
	strb r5, [r0, #0x1f]
	strb r5, [r0, #0x1e]
	ldrb r6, [r0, #0x1c]
	mov r5, #0xfe
	bic r6, r5
	mov r5, #0xa
	orr r5, r6
	strb r5, [r0, #0x1c]
	ldrb r6, [r0, #0x1d]
	mov r5, #0xf
	bic r6, r5
	add r5, r6, #0
	orr r5, r4
	strb r5, [r0, #0x1d]
	ldrb r6, [r0, #0x1d]
	mov r5, #0xf0
	bic r6, r5
	add r5, r0, #0
	strb r6, [r0, #0x1d]
	add r5, #0x20
	strb r1, [r5]
	add r1, r0, #0
	add r1, #0x21
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #0xc
	add r1, #0x22
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #4
	add r1, #0x23
	strb r2, [r1]
	ldr r1, _0225E158 ; =0x000002A9
	strb r3, [r0, r1]
	add r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0225E158: .word 0x000002A9
	thumb_func_end ov32_0225E0FC

	.rodata

_0225E15C:
	.byte 0xA0, 0xBF, 0x08, 0x27
	.byte 0xA0, 0xBF, 0x28, 0x47, 0xFF, 0x00, 0x00, 0x00

ov32_0225E168: ; 0x0225E168
	.word ov32_0225DDB8
	.word ov32_0225DDB8
	.word ov32_0225DDBC
	.word ov32_0225DDBC

ov32_0225E178: ; 0x0225E178
	.byte 0x20, 0x20, 0x00, 0x00, 0xD8, 0xB0, 0x01, 0x02
	.byte 0x18, 0xB0, 0x01, 0x04, 0x38, 0xB0, 0x01, 0x06

ov32_0225E188: ; 0x0225E188
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov32_0225E1A4: ; 0x0225E1A4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov32_0225E1C0: ; 0x0225E1C0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov32_0225E1DC: ; 0x0225E1DC
	.byte 0x08, 0x17, 0x18, 0x67
	.byte 0x08, 0x17, 0x98, 0xE7, 0x30, 0x3F, 0x18, 0x67, 0x30, 0x3F, 0x98, 0xE7, 0x58, 0x67, 0x18, 0x67
	.byte 0x58, 0x67, 0x98, 0xE7, 0x80, 0x8F, 0x18, 0x67, 0x80, 0x8F, 0x98, 0xE7, 0xA0, 0xBF, 0xB0, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov32_0225E204: ; 0x0225E204
	.byte 0x40, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0xC0, 0x10, 0x00, 0x00
	.byte 0x01, 0x03, 0x00, 0x01, 0x40, 0x38, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03, 0xC0, 0x38, 0x00, 0x00
	.byte 0x01, 0x05, 0x02, 0x03, 0x40, 0x60, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xC0, 0x60, 0x00, 0x00
	.byte 0x03, 0x07, 0x04, 0x05, 0x40, 0x88, 0x00, 0x00, 0x04, 0x08, 0x06, 0x07, 0xC0, 0x88, 0x00, 0x00
	.byte 0x05, 0x08, 0x06, 0x07, 0xD8, 0xB0, 0x00, 0x00, 0x87, 0x08, 0x08, 0x08

ov32_0225E24C: ; 0x0225E24C
	.byte 0x04, 0x17, 0x15, 0x08
	.byte 0x02, 0x02, 0x01, 0x00, 0x04, 0x0E, 0x15, 0x04, 0x02, 0x02, 0x11, 0x00, 0x04, 0x03, 0x01, 0x0A
	.byte 0x02, 0x02, 0x19, 0x00, 0x04, 0x13, 0x01, 0x0A, 0x02, 0x02, 0x2D, 0x00, 0x04, 0x03, 0x06, 0x0A
	.byte 0x02, 0x02, 0x41, 0x00, 0x04, 0x13, 0x06, 0x0A, 0x02, 0x02, 0x55, 0x00, 0x04, 0x03, 0x0B, 0x0A
	.byte 0x02, 0x02, 0x69, 0x00, 0x04, 0x13, 0x0B, 0x0A, 0x02, 0x02, 0x7D, 0x00, 0x04, 0x03, 0x10, 0x0A
	.byte 0x02, 0x02, 0x91, 0x00, 0x04, 0x13, 0x10, 0x0A, 0x02, 0x02, 0xA5, 0x00, 0x04, 0x03, 0x01, 0x0A
	.byte 0x02, 0x02, 0xB9, 0x00, 0x04, 0x13, 0x01, 0x0A, 0x02, 0x02, 0xCD, 0x00, 0x04, 0x03, 0x06, 0x0A
	.byte 0x02, 0x02, 0xE1, 0x00, 0x04, 0x13, 0x06, 0x0A, 0x02, 0x02, 0xF5, 0x00, 0x04, 0x03, 0x0B, 0x0A
	.byte 0x02, 0x02, 0x09, 0x01, 0x04, 0x13, 0x0B, 0x0A, 0x02, 0x02, 0x1D, 0x01, 0x04, 0x03, 0x10, 0x0A
	.byte 0x02, 0x02, 0x31, 0x01, 0x04, 0x13, 0x10, 0x0A, 0x02, 0x02, 0x45, 0x01
