	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov34_0225D520
ov34_0225D520: ; 0x0225D520
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	mov r1, #0xdb
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	ldr r0, _0225D554 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x9d
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225D554: .word 0x000F0200
	thumb_func_end ov34_0225D520

	thumb_func_start ov34_0225D558
ov34_0225D558: ; 0x0225D558
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0225D59C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r1
	beq _0225D576
	ldr r0, [r4, #0xc]
	bl ov01_021F6B10
	cmp r0, #1
	bne _0225D576
	mov r0, #3
	str r0, [r4]
_0225D576:
	add r0, r4, #0
	bl ov34_0225E58C
	add r0, r4, #0
	bl ov34_0225E4F8
	add r0, r4, #0
	bl ov34_0225DE04
	add r0, r4, #0
	bl ov34_0225E164
	add r0, r4, #0
	bl ov34_0225DD04
	add r0, r4, #0
	bl ov34_0225E630
	pop {r4, pc}
	.balign 4, 0
_0225D59C: .word gSystem
	thumb_func_end ov34_0225D558

	thumb_func_start ov34_0225D5A0
ov34_0225D5A0: ; 0x0225D5A0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r0, [r4, #0xc]
	ldr r5, [r4, #0x14]
	add r1, r0, #0
	add r1, #0x84
	ldr r1, [r1]
	cmp r1, #0
	beq _0225D5F4
	ldr r1, [r4]
	cmp r1, #5
	bhi _0225D5F4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225D5C4: ; jump table
	.short _0225D5F4 - _0225D5C4 - 2 ; case 0
	.short _0225D5F4 - _0225D5C4 - 2 ; case 1
	.short _0225D5D0 - _0225D5C4 - 2 ; case 2
	.short _0225D5E8 - _0225D5C4 - 2 ; case 3
	.short _0225D5F4 - _0225D5C4 - 2 ; case 4
	.short _0225D5F4 - _0225D5C4 - 2 ; case 5
_0225D5D0:
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0225D5E0
	add r0, r4, #0
	add r1, r5, #0
	bl ov34_0225D558
_0225D5E0:
	ldr r0, [r4, #0x28]
	bl sub_0202457C
	pop {r3, r4, r5, pc}
_0225D5E8:
	mov r1, #0
	add r2, r1, #0
	bl ov01_021F6A9C
	mov r0, #4
	str r0, [r4]
_0225D5F4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov34_0225D5A0

	thumb_func_start ov34_0225D5F8
ov34_0225D5F8: ; 0x0225D5F8
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0xa5
	lsl r1, r1, #2
	add r4, r0, #0
	mov r2, #0
	add r0, r1, #0
	str r2, [r4, r1]
	sub r0, #0x10
	strh r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0xe
	strh r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0xc
	strh r2, [r4, r0]
	sub r1, #0xa
	mov r0, #4
	strh r2, [r4, r1]
	bl ScrStrBufs_new
	str r0, [r4, #0x18]
	ldr r2, _0225D64C ; =0x000002E2
	mov r0, #0
	mov r1, #0x1b
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x1c]
	mov r0, #4
	add r3, r4, #0
	str r0, [sp]
	mov r0, #0x49
	mov r1, #3
	mov r2, #1
	add r3, #0x24
	bl GfGfxLoader_GetScrnData
	str r0, [r4, #0x20]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0225D64C: .word 0x000002E2
	thumb_func_end ov34_0225D5F8

	thumb_func_start ov34_0225D650
ov34_0225D650: ; 0x0225D650
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r0, #0
	mov r0, #0xa0
	str r0, [sp, #0x24]
	mov r0, #0xd0
	str r0, [sp, #0x20]
	mov r0, #5
	str r0, [sp, #0x1c]
	ldr r0, _0225D774 ; =0x00000265
	add r5, r1, #0
	str r2, [sp, #0x14]
	mov r4, #0
	mov r6, #3
	str r0, [sp, #0x18]
_0225D66E:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	add r2, r4, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r2, r2, #0x18
	str r0, [sp, #0x10]
	add r0, r7, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	mov r3, #1
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl CopyWindowToVram
	ldr r0, [sp, #0x1c]
	add r2, r4, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r2, r2, #0x18
	str r0, [sp, #0x10]
	add r0, r7, #0
	add r1, #0x10
	lsr r2, r2, #0x18
	mov r3, #2
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x10
	bl CopyWindowToVram
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r2, r4, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r1, r5, #0
	lsl r2, r2, #0x18
	str r0, [sp, #0x10]
	add r0, r7, #0
	add r1, #0x20
	lsr r2, r2, #0x18
	mov r3, #0xc
	bl AddWindowParameterized
	add r0, r5, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x20
	bl CopyWindowToVram
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	add r0, #0x10
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r6, r6, #7
	add r0, #0x87
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r5, #0x38
	add r0, r0, #7
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r0, #0x1e
	str r0, [sp, #0x18]
	cmp r4, #3
	blt _0225D66E
	mov r0, #0
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, _0225D778 ; =0x000002BF
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	add r0, r7, #0
	mov r2, #4
	mov r3, #8
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D774: .word 0x00000265
_0225D778: .word 0x000002BF
	thumb_func_end ov34_0225D650

	thumb_func_start ov34_0225D77C
ov34_0225D77C: ; 0x0225D77C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl RemoveWindow
	mov r4, #0
_0225D788:
	add r0, r5, #0
	add r0, #0x10
	bl RemoveWindow
	add r0, r5, #0
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0x20
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #3
	blt _0225D788
	pop {r3, r4, r5, pc}
	thumb_func_end ov34_0225D77C

	thumb_func_start ov34_0225D7A8
ov34_0225D7A8: ; 0x0225D7A8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r1, #0xaa
	mov r2, #4
	ldr r0, _0225D874 ; =ov34_0225D5A0
	lsl r1, r1, #2
	add r3, r2, #0
	bl sub_02007200
	add r6, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	str r5, [r4, #0xc]
	ldr r0, [r5, #8]
	str r0, [r4, #0x14]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0x10]
	mov r0, #2
	mov r1, #0xa9
	str r0, [r4]
	lsl r1, r1, #2
	str r6, [r4, r1]
	add r5, #0x84
	ldr r2, [r5]
	ldr r0, _0225D878 ; =0x000004DC
	sub r1, #0x34
	ldr r0, [r2, r0]
	str r0, [r4, r1]
	ldr r0, [r4, #0x14]
	bl ov34_0225D924
	add r0, r4, #0
	bl ov34_0225D5F8
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	bl ov34_0225E56C
	add r0, r4, #0
	mov r1, #1
	bl ov34_0225E5DC
	add r0, r4, #0
	bl ov34_0225DA50
	add r0, r4, #0
	bl ov34_0225DB20
	mov r0, #1
	mov r1, #4
	bl FontID_SetAccessDirect
	mov r2, #0x72
	lsl r2, r2, #2
	add r1, r4, r2
	add r2, #0xac
	ldr r0, [r4, #0x14]
	add r2, r4, r2
	bl ov34_0225D650
	add r0, r4, #0
	bl ov34_0225D520
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	bl ov34_0225E560
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225D874: .word ov34_0225D5A0
_0225D878: .word 0x000004DC
	thumb_func_end ov34_0225D7A8

	thumb_func_start ov34_0225D87C
ov34_0225D87C: ; 0x0225D87C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	sub r0, r0, #2
	cmp r0, #2
	bhi _0225D8F8
	ldr r0, [r6, #0x14]
	str r0, [sp]
	mov r0, #5
	str r0, [r6]
	mov r0, #1
	bl FontID_SetAccessLazy
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AEB0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0A8
	mov r7, #0x55
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0225D8B2:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225D8B2
	ldr r0, [r6, #0x28]
	bl sub_02024504
	ldr r0, [r6, #0x1c]
	bl DestroyMsgData
	ldr r0, [r6, #0x18]
	bl ScrStrBufs_delete
	mov r1, #0x72
	lsl r1, r1, #2
	add r0, r6, r1
	add r1, #0xac
	add r1, r6, r1
	bl ov34_0225D77C
	ldr r0, [sp]
	bl ov34_0225D900
	ldr r0, [r6, #0x20]
	bl FreeToHeap
	mov r0, #0xa9
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_02007234
	pop {r3, r4, r5, r6, r7, pc}
_0225D8F8:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov34_0225D87C

	thumb_func_start ov34_0225D900
ov34_0225D900: ; 0x0225D900
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	thumb_func_end ov34_0225D900

	thumb_func_start ov34_0225D924
ov34_0225D924: ; 0x0225D924
	push {r3, r4, r5, lr}
	sub sp, #0x80
	add r4, r0, #0
	bl ov34_0225D900
	ldr r5, _0225DA40 ; =ov34_0225E714
	add r3, sp, #0x64
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
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r5, _0225DA44 ; =ov34_0225E6F8
	add r3, sp, #0x48
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
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r5, _0225DA48 ; =ov34_0225E6C0
	add r3, sp, #0x2c
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
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r5, _0225DA4C ; =ov34_0225E6DC
	add r3, sp, #0x10
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
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x60
	mov r1, #0
	str r0, [sp]
	mov r2, #4
	mov r0, #0x49
	add r3, r1, #0
	str r2, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r0, #0x49
	mov r1, #2
	add r2, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #4
	mov r0, #0x49
	add r2, r4, #0
	mov r3, #7
	str r1, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #4
	mov r1, #0
	bl sub_0205B4EC
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_0225DA40: .word ov34_0225E714
_0225DA44: .word ov34_0225E6F8
_0225DA48: .word ov34_0225E6C0
_0225DA4C: .word ov34_0225E6DC
	thumb_func_end ov34_0225D924

	thumb_func_start ov34_0225DA50
ov34_0225DA50: ; 0x0225DA50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r1, r6, #0
	mov r0, #0xa
	add r1, #0x2c
	mov r2, #4
	bl G2dRenderer_Init
	mov r7, #0x55
	str r0, [r6, #0x28]
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0225DA6C:
	mov r0, #1
	add r1, r4, #0
	mov r2, #4
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225DA6C
	ldr r0, _0225DB1C ; =0x000003E7
	mov r1, #0x49
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r2, #5
	mov r3, #1
	bl AddCharResObjFromNarc
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _0225DB1C ; =0x000003E7
	mov r2, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r0, #4
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r6, r1]
	mov r1, #0x49
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _0225DB1C ; =0x000003E7
	sub r1, #0xc
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	mov r1, #0x49
	mov r2, #6
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _0225DB1C ; =0x000003E7
	sub r1, #0xc
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [r6, r1]
	mov r1, #0x49
	mov r2, #7
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r6, r1]
	sub r1, #0xc
	ldr r0, [r6, r1]
	bl sub_0200ADA4
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B00C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DB1C: .word 0x000003E7
	thumb_func_end ov34_0225DA50

	thumb_func_start ov34_0225DB20
ov34_0225DB20: ; 0x0225DB20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	ldr r1, _0225DBF8 ; =0x000003E7
	add r5, r0, #0
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r3, #0x55
	str r0, [sp, #0x10]
	lsl r3, r3, #2
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
	add r3, #0x20
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x28]
	mov r4, #0
	str r0, [sp, #0x2c]
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x30]
	mov r0, #1
	lsl r0, r0, #0xc
	mov r7, #0x3f
	str r4, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r4, [r0, #0x20]
	mov r0, #2
	str r0, [sp, #0x54]
	mov r0, #4
	ldr r6, _0225DBFC ; =ov34_0225E6A0
	str r4, [sp, #0x50]
	str r0, [sp, #0x58]
	lsl r7, r7, #0x18
_0225DB94:
	mov r0, #0x3a
	lsl r0, r0, #0xe
	str r0, [sp, #0x34]
	ldr r0, [r6]
	cmp r0, #0
	ble _0225DBB0
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _0225DBBC
_0225DBB0:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
_0225DBBC:
	bl _ffix
	mov r1, #3
	lsl r1, r1, #0x12
	add r0, r0, r1
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
	add r4, r4, #1
	add r6, r6, #4
	add r5, r5, #4
	cmp r4, #3
	blt _0225DB94
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225DBF8: .word 0x000003E7
_0225DBFC: .word ov34_0225E6A0
	thumb_func_end ov34_0225DB20

	thumb_func_start ov34_0225DC00
ov34_0225DC00: ; 0x0225DC00
	add r1, r1, #1
	cmp r1, #0x1e
	bne _0225DC08
	mov r1, #0
_0225DC08:
	add r0, r1, #0
	bx lr
	thumb_func_end ov34_0225DC00

	thumb_func_start ov34_0225DC0C
ov34_0225DC0C: ; 0x0225DC0C
	add r0, r0, r1
	cmp r0, #0x1e
	blt _0225DC14
	sub r0, #0x1e
_0225DC14:
	bx lr
	.balign 4, 0
	thumb_func_end ov34_0225DC0C

	thumb_func_start ov34_0225DC18
ov34_0225DC18: ; 0x0225DC18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r1, #0
	add r5, r0, #0
	mov r0, #0x38
	add r4, r7, #0
	mul r4, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	add r6, r2, #0
	add r1, r5, r0
	ldr r0, [r6, #0x10]
	mov r3, #7
	str r0, [r1, r4]
	mov r0, #0x20
	str r0, [sp]
	str r3, [sp, #4]
	ldr r2, [r5, #0x24]
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r2, [r1, r4]
	mov r1, #0x18
	mul r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x10]
	add r1, r3, #0
	mul r3, r7
	str r0, [sp, #0x14]
	mov r0, #0x30
	add r3, r3, #2
	str r0, [sp, #0x18]
	lsl r3, r3, #0x18
	ldr r0, [r5, #0x14]
	mov r2, #0
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	mov r0, #0x72
	lsl r0, r0, #2
	add r7, r5, r0
	add r0, r7, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x76
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x1c]
	add r0, r0, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x7a
	lsl r0, r0, #2
	add r5, r5, r0
	add r0, r5, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DCFC ; =0x000F0200
	mov r3, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r2, [r6]
	add r0, r7, r4
	bl AddTextPrinterParameterized2
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DD00 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [r6, #4]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	add r0, r7, r4
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x1c]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	ldr r2, [r6, #8]
	cmp r2, #0
	beq _0225DCF0
	mov r1, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225DCFC ; =0x000F0200
	mov r3, #0
	str r0, [sp, #8]
	add r0, r5, r4
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0225DCF0:
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225DCFC: .word 0x000F0200
_0225DD00: .word 0x00010200
	thumb_func_end ov34_0225DC18

	thumb_func_start ov34_0225DD04
ov34_0225DD04: ; 0x0225DD04
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x27
	add r5, r0, #0
	lsl r1, r1, #4
	add r0, r1, #0
	ldr r2, [r5, r1]
	add r1, #0x18
	add r0, #0xdc
	ldrh r1, [r5, r1]
	ldr r0, [r2, r0]
	bl ov34_0225DC0C
	add r6, r0, #0
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	add r0, #0xd8
	ldr r7, [r1, r0]
	cmp r7, #3
	ble _0225DD2E
	mov r7, #3
_0225DD2E:
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r1, r0
	beq _0225DD4C
	add r0, r5, #0
	bl ov34_0225E560
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
_0225DD4C:
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225DDB6
	mov r4, #0
	cmp r7, #0
	ble _0225DD84
_0225DD5C:
	mov r2, #0x27
	lsl r2, r2, #4
	mov r3, #0x1c
	ldr r2, [r5, r2]
	mul r3, r6
	add r0, r5, #0
	add r1, r4, #0
	add r2, r2, r3
	bl ov34_0225DC18
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl ov34_0225DC00
	add r4, r4, #1
	add r6, r0, #0
	cmp r4, r7
	blt _0225DD5C
_0225DD84:
	ldr r0, [r5, #0x14]
	mov r1, #7
	bl GetBgTilemapBuffer
	mov r1, #6
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r0, [r5, #0x14]
	mov r1, #7
	bl GetBgTilemapBuffer
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r3, #6
	ldr r0, [r5, #0x14]
	mov r1, #7
	lsl r3, r3, #8
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	mov r0, #0xa5
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_0225DDB6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov34_0225DD04

	thumb_func_start ov34_0225DDB8
ov34_0225DDB8: ; 0x0225DDB8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x3a
	lsl r0, r0, #0xe
	str r0, [sp]
	cmp r1, #0
	ble _0225DDDA
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225DDE8
_0225DDDA:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225DDE8:
	bl _ffix
	mov r1, #3
	lsl r1, r1, #0x12
	add r0, r0, r1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov34_0225DDB8

	thumb_func_start ov34_0225DE04
ov34_0225DE04: ; 0x0225DE04
	push {r4, lr}
	mov r1, #0x27
	add r4, r0, #0
	lsl r1, r1, #4
	add r0, r1, #0
	ldr r2, [r4, r1]
	add r0, #0xd8
	ldr r2, [r2, r0]
	add r0, r1, #0
	add r0, #0x14
	strh r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x14
	ldrh r0, [r4, r0]
	cmp r0, #3
	bls _0225DE42
	add r0, r1, #0
	add r0, #0x16
	ldrh r0, [r4, r0]
	cmp r0, #3
	bhi _0225DE42
	add r0, r1, #0
	mov r2, #1
	add r0, #0x1a
	strh r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x14
	ldrh r0, [r4, r0]
	add r1, #0x18
	sub r0, r0, #3
	strh r0, [r4, r1]
_0225DE42:
	mov r1, #0x1a
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #0xea
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0225DE90 ; =0x0000028A
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0225DE84
	add r0, r4, #0
	bl ov34_0225E5E4
	cmp r0, #1
	bne _0225DE84
	mov r1, #0xa2
	lsl r1, r1, #2
	ldrh r2, [r4, r1]
	sub r1, r1, #4
	ldrh r1, [r4, r1]
	mov r0, #0x60
	mul r0, r2
	sub r1, r1, #3
	bl _s32_div_f
	add r1, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, #0x30
	bl ov34_0225DDB8
_0225DE84:
	mov r0, #0xa1
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	add r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0225DE90: .word 0x0000028A
	thumb_func_end ov34_0225DE04

	thumb_func_start ov34_0225DE94
ov34_0225DE94: ; 0x0225DE94
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _0225E00C ; =ov34_0225E730
	bl sub_02025204
	add r7, r0, #0
	add r0, r4, #0
	bl ov34_0225E5D4
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r7, r0
	beq _0225DEDA
	cmp r7, #6
	bhi _0225DF5E
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225DEC0: ; jump table
	.short _0225DECE - _0225DEC0 - 2 ; case 0
	.short _0225DF00 - _0225DEC0 - 2 ; case 1
	.short _0225DF5E - _0225DEC0 - 2 ; case 2
	.short _0225DF5E - _0225DEC0 - 2 ; case 3
	.short _0225DF5E - _0225DEC0 - 2 ; case 4
	.short _0225DF36 - _0225DEC0 - 2 ; case 5
	.short _0225DF40 - _0225DEC0 - 2 ; case 6
_0225DECE:
	add r0, r4, #0
	add r1, r7, #0
	bl ov34_0225E5EC
	cmp r5, #1
	beq _0225DEDC
_0225DEDA:
	b _0225E006
_0225DEDC:
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0225DEF6
	ldr r0, _0225E010 ; =0x000005E5
	bl PlaySE
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, r0]
_0225DEF6:
	mov r0, #0x71
	sub r1, r7, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225E006
_0225DF00:
	add r0, r4, #0
	add r1, r7, #0
	bl ov34_0225E5EC
	cmp r5, #1
	bne _0225E006
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	sub r0, r0, #4
	ldrh r0, [r4, r0]
	sub r0, r0, #3
	cmp r1, r0
	bge _0225DF2C
	ldr r0, _0225E010 ; =0x000005E5
	bl PlaySE
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
_0225DF2C:
	mov r0, #0x71
	sub r1, r7, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225E006
_0225DF36:
	mov r0, #0x71
	sub r1, r7, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225E006
_0225DF40:
	ldr r0, _0225E014 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0225E006
	ldr r0, [r4, #0xc]
	bl ov01_021F6B10
	cmp r0, #1
	bne _0225E006
	ldr r0, _0225E018 ; =0x000005FC
	bl PlaySE
	mov r0, #3
	str r0, [r4]
	b _0225E006
_0225DF5E:
	ldr r0, _0225E014 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0225E006
	mov r2, #0x27
	lsl r2, r2, #4
	add r1, r2, #0
	ldr r0, [r4, r2]
	add r1, #0xd8
	ldr r3, [r0, r1]
	sub r1, r7, #1
	cmp r3, r1
	blt _0225DFFE
	add r1, r2, #0
	add r1, #0xdc
	add r2, #0x18
	ldr r0, [r0, r1]
	ldrh r1, [r4, r2]
	add r1, r1, r7
	sub r1, r1, #2
	bl ov34_0225DC0C
	mov r1, #0x1c
	mov r5, #0
	mul r1, r0
	add r6, r5, #0
	str r1, [sp]
_0225DF94:
	add r0, r5, #0
	bl sub_02035754
	cmp r0, #0
	beq _0225DFD0
	ldr r1, [r4, #4]
	add r0, #0x50
	add r1, r1, r6
	ldrb r1, [r1, #0xd]
	cmp r1, #2
	bne _0225DFD0
	mov r1, #0x27
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	ldr r1, [sp]
	ldr r0, [r0]
	add r1, r1, r2
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bne _0225DFD0
	ldr r0, _0225E010 ; =0x000005E5
	bl PlaySE
	mov r1, #0x18
	ldr r2, [r4, #4]
	mul r1, r5
	mov r0, #1
	add r1, r2, r1
	strb r0, [r1, #0xf]
	b _0225DFD8
_0225DFD0:
	add r5, r5, #1
	add r6, #0x18
	cmp r5, #0xa
	blt _0225DF94
_0225DFD8:
	bl sub_02035784
	bl PlayerProfile_GetTrainerID
	mov r1, #0x27
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	ldr r1, [sp]
	add r1, r2, r1
	ldr r1, [r1, #0xc]
	cmp r1, r0
	bne _0225DFFE
	ldr r0, _0225E010 ; =0x000005E5
	bl PlaySE
	ldr r1, [r4, #4]
	ldr r0, _0225E01C ; =0x000004BF
	mov r2, #1
	strb r2, [r1, r0]
_0225DFFE:
	mov r0, #0x71
	sub r1, r7, #2
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225E006:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225E00C: .word ov34_0225E730
_0225E010: .word 0x000005E5
_0225E014: .word gSystem + 0x40
_0225E018: .word 0x000005FC
_0225E01C: .word 0x000004BF
	thumb_func_end ov34_0225DE94

	thumb_func_start ov34_0225E020
ov34_0225E020: ; 0x0225E020
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, _0225E0E0 ; =ov34_0225E6AC
	bl sub_02025204
	mov r1, #0
	mvn r1, r1
	str r0, [sp]
	cmp r0, r1
	beq _0225E0D0
	cmp r0, #0
	bne _0225E09A
	add r0, r7, #0
	mov r1, #0
	bl ov34_0225E5DC
	add r0, sp, #8
	add r1, sp, #4
	bl sub_02025364
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	ldr r1, [sp, #4]
	bl ov34_0225DDB8
	mov r0, #0xa1
	lsl r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #3
	bls _0225E0D8
	sub r4, r0, #2
	mov r0, #0x60
	add r1, r4, #0
	bl _s32_div_f
	mov r1, #0
	cmp r4, #0
	ble _0225E0D8
	ldr r5, [sp, #4]
	add r2, r1, #0
	add r3, r1, #0
_0225E076:
	add r6, r2, #0
	add r6, #0x30
	cmp r5, r6
	blo _0225E08E
	add r6, r3, r0
	add r6, #0x30
	cmp r5, r6
	bhs _0225E08E
	mov r0, #0xa2
	lsl r0, r0, #2
	strh r1, [r7, r0]
	b _0225E0D8
_0225E08E:
	add r1, r1, #1
	add r2, r2, r0
	add r3, r3, r0
	cmp r1, r4
	blt _0225E076
	b _0225E0D8
_0225E09A:
	mov r1, #0x27
	lsl r1, r1, #4
	add r0, r1, #0
	ldr r2, [r7, r1]
	add r0, #0xd8
	ldr r2, [r2, r0]
	ldr r0, [sp]
	cmp r2, r0
	blt _0225E0D8
	add r0, r1, #0
	sub r0, #0xac
	ldr r2, [r7, r0]
	ldr r0, [sp]
	sub r3, r0, #1
	cmp r2, r3
	bne _0225E0D8
	sub r1, #0x74
	add r2, r7, r1
	mov r0, #0x38
	add r1, r3, #0
	mul r1, r0
	ldr r0, [r2, r1]
	cmp r0, #5
	bge _0225E0D8
	add r0, r0, #1
	str r0, [r2, r1]
	b _0225E0D8
_0225E0D0:
	add r0, r7, #0
	mov r1, #1
	bl ov34_0225E5DC
_0225E0D8:
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225E0E0: .word ov34_0225E6AC
	thumb_func_end ov34_0225E020

	thumb_func_start ov34_0225E0E4
ov34_0225E0E4: ; 0x0225E0E4
	push {r4, lr}
	ldr r1, _0225E15C ; =gSystem
	add r4, r0, #0
	ldr r3, [r1, #0x44]
	mov r1, #2
	lsl r1, r1, #8
	add r2, r3, #0
	tst r2, r1
	beq _0225E126
	mov r1, #0
	bl ov34_0225E5EC
	ldr r0, _0225E15C ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x4c]
	lsl r1, r1, #8
	tst r0, r1
	beq _0225E158
	add r0, r1, #0
	add r0, #0x88
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _0225E158
	add r0, r1, #0
	add r0, #0x88
	ldrh r0, [r4, r0]
	add r1, #0x88
	sub r0, r0, #1
	strh r0, [r4, r1]
	ldr r0, _0225E160 ; =0x000005E5
	bl PlaySE
	pop {r4, pc}
_0225E126:
	lsr r1, r1, #1
	tst r1, r3
	beq _0225E158
	mov r1, #1
	bl ov34_0225E5EC
	ldr r0, _0225E15C ; =gSystem
	ldr r1, [r0, #0x4c]
	mov r0, #1
	lsl r0, r0, #8
	tst r0, r1
	beq _0225E158
	mov r0, #0xa2
	lsl r0, r0, #2
	sub r1, r0, #4
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r0]
	sub r1, r1, #3
	cmp r2, r1
	bge _0225E158
	add r1, r2, #1
	strh r1, [r4, r0]
	ldr r0, _0225E160 ; =0x000005E5
	bl PlaySE
_0225E158:
	pop {r4, pc}
	nop
_0225E15C: .word gSystem
_0225E160: .word 0x000005E5
	thumb_func_end ov34_0225E0E4

	thumb_func_start ov34_0225E164
ov34_0225E164: ; 0x0225E164
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r4, #0
	mvn r4, r4
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0225E19A
	add r0, r5, #0
	bl ov34_0225DE94
	add r6, r0, #0
	add r0, r5, #0
	bl ov34_0225E020
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _0225E19A
	cmp r4, r0
	bne _0225E19A
	add r0, r5, #0
	bl ov34_0225E0E4
_0225E19A:
	mov r2, #0x27
	lsl r2, r2, #4
	add r0, r2, #0
	ldr r1, [r5, r2]
	add r0, #0xd8
	ldr r0, [r1, r0]
	sub r3, r4, #1
	str r0, [sp]
	add r0, r2, #0
	add r0, #0x20
	add r0, r5, r0
	str r0, [sp, #4]
	sub r2, #0xa8
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x24]
	add r2, r5, r2
	bl ov34_0225E1C4
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov34_0225E164

	thumb_func_start ov34_0225E1C4
ov34_0225E1C4: ; 0x0225E1C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x20]
	add r5, r2, #0
	mov r1, #0
	str r0, [sp, #0x40]
	ldr r4, [sp, #0x44]
	cmp r0, #3
	ble _0225E1DE
	mov r0, #3
	str r0, [sp, #0x40]
_0225E1DE:
	ldr r2, [sp, #0x40]
	mov r0, #0
	cmp r2, #0
	ble _0225E204
	add r2, r5, #0
_0225E1E8:
	cmp r3, r0
	beq _0225E1F6
	ldr r6, [r2, #0x34]
	cmp r6, #0
	beq _0225E1F6
	sub r6, r6, #1
	str r6, [r2, #0x34]
_0225E1F6:
	ldr r6, [r2, #0x34]
	add r0, r0, #1
	add r1, r1, r6
	ldr r6, [sp, #0x40]
	add r2, #0x38
	cmp r0, r6
	blt _0225E1E8
_0225E204:
	cmp r1, #0
	bne _0225E214
	ldr r0, [r4]
	cmp r0, #0
	bne _0225E214
	add sp, #0x28
	str r1, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0225E214:
	ldr r0, [sp, #0x40]
	str r1, [r4]
	mov r4, #0
	cmp r0, #0
	ble _0225E28A
	ldr r0, [sp, #0x20]
	mov r7, #2
	add r0, #0xc
	str r0, [sp, #0x20]
_0225E226:
	ldr r1, [r5, #0x34]
	lsl r3, r7, #0x18
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp, #0x24]
	mov r0, #0x20
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	lsr r3, r3, #0x18
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r1, [r5, #0x30]
	lsl r2, r0, #3
	mov r0, #0x18
	mul r0, r1
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	mov r0, #0x20
	str r0, [sp, #0x14]
	mov r0, #0x30
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	mov r1, #7
	mov r2, #0
	bl CopyToBgTilemapRect
	ldr r3, [sp, #0x24]
	add r1, r4, #4
	lsl r6, r3, #2
	ldr r3, _0225E2B8 ; =_0225E694
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x1c]
	ldr r3, [r3, r6]
	lsr r1, r1, #0x18
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r0, [sp, #0x40]
	add r4, r4, #1
	add r5, #0x38
	add r7, r7, #7
	cmp r4, r0
	blt _0225E226
_0225E28A:
	ldr r0, [sp, #0x1c]
	mov r1, #7
	bl GetBgTilemapBuffer
	mov r1, #6
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r0, [sp, #0x1c]
	mov r1, #7
	bl GetBgTilemapBuffer
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r3, #6
	ldr r0, [sp, #0x1c]
	mov r1, #7
	lsl r3, r3, #8
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E2B8: .word _0225E694
	thumb_func_end ov34_0225E1C4

	thumb_func_start ov34_0225E2BC
ov34_0225E2BC: ; 0x0225E2BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	mov r4, #0
	ldr r0, [sp, #0x28]
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	bl PlayerProfile_GetTrainerID
	cmp r5, r0
	beq _0225E2E0
	add r0, r6, #0
	add r1, r5, #0
	bl PalPad_PlayerIdIsFriendOrMutual
	add r4, r0, #0
_0225E2E0:
	cmp r4, #0
	ble _0225E340
	cmp r4, #1
	bne _0225E2F4
	ldr r2, [sp, #0x28]
	add r0, r7, #0
	mov r1, #0
	bl BufferPlayersName
	b _0225E332
_0225E2F4:
	cmp r4, #2
	blt _0225E332
	sub r5, r4, #2
	mov r0, #0xa
	mov r1, #0x57
	bl String_ctor
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl PalPad_GetNthEntry
	add r1, r0, #0
	add r0, r4, #0
	bl CopyU16ArrayToString
	add r0, r6, #0
	add r1, r5, #0
	bl PalPadEntry_GetFromUnk68Array
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r4, #0
	add r3, r1, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
_0225E332:
	ldr r1, [sp, #8]
	add r0, r7, #0
	mov r2, #0xd0
	mov r3, #0x57
	bl ReadMsgData_ExpandPlaceholders
	str r0, [sp, #0xc]
_0225E340:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov34_0225E2BC

	thumb_func_start ov34_0225E348
ov34_0225E348: ; 0x0225E348
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r6, r2, #0
	ldr r2, [r7, #4]
	ldr r0, _0225E424 ; =0x000004D8
	str r1, [sp, #4]
	mov r1, #0x27
	ldr r0, [r2, r0]
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	add r0, r1, #0
	ldr r4, [r7, r1]
	add r0, #0xd8
	ldr r0, [r4, r0]
	str r3, [sp, #8]
	cmp r0, #0x1e
	bne _0225E370
	add r1, #0xdc
	b _0225E372
_0225E370:
	add r1, #0xd8
_0225E372:
	add r5, r4, r1
	ldr r1, [r5]
	mov r0, #0x1c
	mul r0, r1
	add r0, r4, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0225E386
	bl String_dtor
_0225E386:
	ldr r1, [r5]
	mov r0, #0x1c
	mul r0, r1
	add r0, r4, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0225E398
	bl String_dtor
_0225E398:
	ldr r0, [sp, #8]
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	ldr r2, [r5]
	mov r0, #0x1c
	mul r0, r2
	ldr r0, [r4, r0]
	bl CopyU16ArrayToString
	ldr r0, [r5]
	mov r1, #0x1c
	add r2, r0, #0
	mul r2, r1
	add r0, r4, r2
	ldrh r2, [r6]
	strh r2, [r0, #0x14]
	ldrh r2, [r6, #2]
	strh r2, [r0, #0x16]
	ldrh r2, [r6, #4]
	strh r2, [r0, #0x18]
	ldrh r2, [r6, #6]
	strh r2, [r0, #0x1a]
	ldr r0, [r5]
	mul r1, r0
	ldr r0, [sp, #4]
	add r1, r4, r1
	str r0, [r1, #0xc]
	ldr r0, [sp, #8]
	bl PlayerProfile_GetTrainerGender
	ldr r2, [r5]
	mov r1, #0x1c
	mul r1, r2
	add r1, r4, r1
	str r0, [r1, #0x10]
	add r0, r6, #0
	mov r1, #0x57
	bl MailMsg_GetExpandedString
	ldr r2, [r5]
	mov r1, #0x1c
	mul r1, r2
	add r1, r4, r1
	str r0, [r1, #4]
	ldr r0, [r7, #0x10]
	ldr r1, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r2, [r7, #0x18]
	ldr r3, [r7, #0x1c]
	bl ov34_0225E2BC
	ldr r2, [r5]
	mov r1, #0x1c
	mul r1, r2
	add r1, r4, r1
	str r0, [r1, #8]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0x1e
	bne _0225E420
	mov r1, #0
	str r1, [r4, r0]
_0225E420:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225E424: .word 0x000004D8
	thumb_func_end ov34_0225E348

	thumb_func_start ov34_0225E428
ov34_0225E428: ; 0x0225E428
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, r1, #0
	str r1, [sp]
	add r7, r2, #0
	bl MailMsg_IsInit
	cmp r0, #0
	bne _0225E43E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225E43E:
	mov r1, #0x27
	lsl r1, r1, #4
	ldr r0, [r6, r1]
	add r1, #0xd8
	ldr r1, [r0, r1]
	mov r4, #0
	cmp r1, #0
	ble _0225E478
	add r5, r4, #0
_0225E450:
	add r1, r0, r5
	ldr r0, [r1, #0xc]
	cmp r7, r0
	bne _0225E464
	ldr r0, [sp]
	add r1, #0x14
	bl MailMsg_compare
	cmp r0, #0
	bne _0225E478
_0225E464:
	mov r0, #0x27
	lsl r0, r0, #4
	mov r1, #0xd2
	ldr r0, [r6, r0]
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, r1
	blt _0225E450
_0225E478:
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r1, [r6, r0]
	add r0, #0xd8
	ldr r0, [r1, r0]
	cmp r4, r0
	beq _0225E48E
	cmp r0, #0
	beq _0225E48E
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0225E48E:
	mov r0, #0x1c
	mul r0, r4
	add r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r7, r0
	beq _0225E4A2
	ldr r0, [sp]
	add r1, #0x14
	bl MailMsg_compare
_0225E4A2:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov34_0225E428

	thumb_func_start ov34_0225E4A8
ov34_0225E4A8: ; 0x0225E4A8
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0xa2
	add r4, r0, #0
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	sub r1, r1, #4
	ldrh r1, [r4, r1]
	mov r5, #0
	sub r1, r1, #3
	cmp r0, r1
	bne _0225E4C2
	mov r5, #1
_0225E4C2:
	add r1, r3, #0
	add r0, r4, #0
	add r3, r6, #0
	bl ov34_0225E348
	ldr r1, _0225E4F4 ; =0x0000028A
	ldrh r0, [r4, r1]
	cmp r0, #0
	beq _0225E4EA
	cmp r5, #0
	beq _0225E4EA
	add r0, r1, #0
	sub r0, #0x1a
	ldr r2, [r4, r0]
	add r0, r1, #0
	add r0, #0xbe
	ldr r0, [r2, r0]
	sub r2, r0, #3
	sub r0, r1, #2
	strh r2, [r4, r0]
_0225E4EA:
	add r0, r4, #0
	bl ov34_0225E560
	pop {r4, r5, r6, pc}
	nop
_0225E4F4: .word 0x0000028A
	thumb_func_end ov34_0225E4A8

	thumb_func_start ov34_0225E4F8
ov34_0225E4F8: ; 0x0225E4F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0225E55C
	mov r4, #0
_0225E508:
	add r0, r4, #0
	bl sub_02035754
	add r2, r0, #0
	beq _0225E53A
	add r6, r2, #0
	add r6, #0x50
	add r7, r6, #0
	add r7, #8
	ldr r2, [r2, #0x50]
	add r0, r5, #0
	add r1, r7, #0
	bl ov34_0225E428
	cmp r0, #0
	beq _0225E53A
	add r0, r4, #0
	bl sub_02035798
	add r1, r0, #0
	ldr r3, [r6]
	add r0, r5, #0
	add r2, r7, #0
	bl ov34_0225E4A8
_0225E53A:
	add r4, r4, #1
	cmp r4, #0x10
	blt _0225E508
	ldr r0, [r5, #8]
	bl sub_0205AA84
	add r4, r0, #0
	beq _0225E55C
	ldr r0, [r5, #0x10]
	bl PlayerProfile_GetTrainerID
	add r3, r0, #0
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	bl ov34_0225E4A8
_0225E55C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov34_0225E4F8

	thumb_func_start ov34_0225E560
ov34_0225E560: ; 0x0225E560
	mov r1, #0xa5
	mov r2, #1
	lsl r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov34_0225E560

	thumb_func_start ov34_0225E56C
ov34_0225E56C: ; 0x0225E56C
	mov r1, #0xa6
	mov r2, #0
	lsl r1, r1, #2
	strb r2, [r0, r1]
	mov r3, #8
	add r2, r1, #2
	strb r3, [r0, r2]
	mov r3, #4
	add r2, r1, #3
	strb r3, [r0, r2]
	add r2, r1, #2
	ldrb r2, [r0, r2]
	add r1, r1, #1
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov34_0225E56C

	thumb_func_start ov34_0225E58C
ov34_0225E58C: ; 0x0225E58C
	mov r2, #0xa6
	mov r1, #0
	lsl r2, r2, #2
	strb r1, [r0, r2]
	ldr r1, _0225E5D0 ; =gSystem + 0x40
	ldrh r3, [r1, #0x24]
	cmp r3, #0
	beq _0225E5A2
	mov r1, #1
	strb r1, [r0, r2]
	bx lr
_0225E5A2:
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	beq _0225E5C6
	add r1, r2, #1
	ldrsb r1, [r0, r1]
	sub r3, r1, #1
	add r1, r2, #1
	strb r3, [r0, r1]
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bge _0225E5CE
	mov r1, #1
	strb r1, [r0, r2]
	add r1, r2, #3
	ldrb r3, [r0, r1]
	add r1, r2, #1
	strb r3, [r0, r1]
	bx lr
_0225E5C6:
	add r1, r2, #2
	ldrb r3, [r0, r1]
	add r1, r2, #1
	strb r3, [r0, r1]
_0225E5CE:
	bx lr
	.balign 4, 0
_0225E5D0: .word gSystem + 0x40
	thumb_func_end ov34_0225E58C

	thumb_func_start ov34_0225E5D4
ov34_0225E5D4: ; 0x0225E5D4
	mov r1, #0xa6
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end ov34_0225E5D4

	thumb_func_start ov34_0225E5DC
ov34_0225E5DC: ; 0x0225E5DC
	mov r2, #0xa7
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov34_0225E5DC

	thumb_func_start ov34_0225E5E4
ov34_0225E5E4: ; 0x0225E5E4
	mov r1, #0xa7
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov34_0225E5E4

	thumb_func_start ov34_0225E5EC
ov34_0225E5EC: ; 0x0225E5EC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x66
	add r5, r1, #0
	lsl r0, r0, #2
	add r4, r7, r0
	lsl r6, r5, #2
	ldr r0, [r4, r6]
	bl sub_020249F8
	str r0, [sp]
	ldr r0, [r4, r6]
	bl sub_020249A8
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [sp]
	cmp r0, #0
	bne _0225E618
	add r0, r5, #4
	cmp r1, r0
	beq _0225E620
_0225E618:
	ldr r0, [r4, r6]
	add r1, r5, #4
	bl Set2dSpriteAnimSeqNo
_0225E620:
	lsl r0, r5, #1
	add r1, r7, r0
	mov r0, #0x2a
	mov r2, #1
	lsl r0, r0, #4
	strh r2, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov34_0225E5EC

	thumb_func_start ov34_0225E630
ov34_0225E630: ; 0x0225E630
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_0225E63A:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020249F8
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	cmp r0, #1
	bne _0225E662
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x2a
	lsl r0, r0, #4
	strh r7, [r4, r0]
	b _0225E688
_0225E662:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020248C0
	cmp r0, #0
	bne _0225E688
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_020249D4
_0225E688:
	add r6, r6, #1
	add r5, r5, #4
	add r4, r4, #2
	cmp r6, #2
	blt _0225E63A
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov34_0225E630

	.rodata

_0225E694:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov34_0225E6A0: ; 0x0225E6A0
	.byte 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov34_0225E6AC: ; 0x0225E6AC
	.byte 0x30, 0x90, 0xE8, 0x00
	.byte 0x10, 0x48, 0x00, 0xE8, 0x48, 0x80, 0x00, 0xE8, 0x80, 0xB8, 0x00, 0xE8, 0xFF, 0x00, 0x00, 0x00

ov34_0225E6C0: ; 0x0225E6C0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov34_0225E6DC: ; 0x0225E6DC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov34_0225E6F8: ; 0x0225E6F8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov34_0225E714: ; 0x0225E714
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov34_0225E730: ; 0x0225E730
	.byte 0x00, 0x20, 0xE8, 0xF8, 0xA0, 0x20, 0xE8, 0xF8, 0x10, 0x48, 0x00, 0xE8, 0x48, 0x80, 0x00, 0xE8
	.byte 0x80, 0xB8, 0x00, 0xE8, 0x30, 0x90, 0xE8, 0x00, 0x00, 0x0F, 0x00, 0xE8, 0xFF, 0x00, 0x00, 0x00
