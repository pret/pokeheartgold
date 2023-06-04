	.include "asm/macros.inc"
	.include "overlay_33.inc"
	.include "global.inc"

	.text

	thumb_func_start ov33_0225D520
ov33_0225D520: ; 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r1, [sp]
	mov r0, #3
	str r2, [sp, #4]
	mov r1, #8
	lsl r2, r0, #0xf
	add r5, r3, #0
	bl CreateHeap
	ldr r0, _0225D598 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	mov r1, #7
	ldr r0, _0225D59C ; =ov33_0225D5D0
	lsl r1, r1, #6
	mov r2, #0xa
	mov r3, #8
	bl sub_02007200
	add r7, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [sp]
	str r6, [r4]
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	str r7, [r4, #0x14]
	str r5, [r4, #0x10]
	ldrb r1, [r5, #4]
	ldr r0, _0225D5A0 ; =0x000001BA
	strh r1, [r4, r0]
	ldr r1, _0225D5A4 ; =0x0000FFFF
	ldr r0, [r4, #0x10]
	strh r1, [r0, #6]
	ldr r0, [r4, #0x10]
	mov r1, #0
	strb r1, [r0, #5]
	bl ov33_0225D6F8
	add r0, r6, #0
	bl ov33_0225D720
	add r0, r4, #0
	bl ov33_0225D7D4
	add r0, r4, #0
	bl ov33_0225D84C
	add r0, r4, #0
	bl ov33_0225D8D4
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D598: .word 0x04001050
_0225D59C: .word ov33_0225D5D0
_0225D5A0: .word 0x000001BA
_0225D5A4: .word 0x0000FFFF
	thumb_func_end ov33_0225D520

	thumb_func_start ov33_0225D5A8
ov33_0225D5A8: ; 0x0225D5A8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	bl sub_0201F988
	add r4, r0, #0
	bl ov33_0225D820
	ldr r0, [r4]
	bl ov33_0225D7B8
	add r0, r5, #0
	bl sub_02007234
	mov r0, #8
	bl DestroyHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov33_0225D5A8

	thumb_func_start ov33_0225D5CC
ov33_0225D5CC: ; 0x0225D5CC
	mov r0, #1
	bx lr
	thumb_func_end ov33_0225D5CC

	thumb_func_start ov33_0225D5D0
ov33_0225D5D0: ; 0x0225D5D0
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _0225D6E4 ; =0x000001BA
	ldr r0, _0225D6E8 ; =ov33_0225DA50
	ldrh r2, [r4, r1]
	sub r3, r2, #1
	mov r2, #0xc
	mul r2, r3
	add r0, r0, r2
	sub r2, r1, #2
	ldrh r2, [r4, r2]
	cmp r2, #2
	bhs _0225D604
	ldr r2, [r4, #0x10]
	ldrb r2, [r2, #5]
	cmp r2, #1
	bne _0225D5FA
	mov r2, #2
	sub r1, r1, #2
	strh r2, [r4, r1]
	b _0225D604
_0225D5FA:
	cmp r2, #2
	bne _0225D604
	mov r2, #4
	sub r1, r1, #2
	strh r2, [r4, r1]
_0225D604:
	mov r1, #0x6e
	lsl r1, r1, #2
	ldrh r1, [r4, r1]
	cmp r1, #5
	bhi _0225D6E0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225D61A: ; jump table
	.short _0225D626 - _0225D61A - 2 ; case 0
	.short _0225D656 - _0225D61A - 2 ; case 1
	.short _0225D67E - _0225D61A - 2 ; case 2
	.short _0225D6E0 - _0225D61A - 2 ; case 3
	.short _0225D6A8 - _0225D61A - 2 ; case 4
	.short _0225D6D2 - _0225D61A - 2 ; case 5
_0225D626:
	ldr r0, [r0, #4]
	bl sub_02025224
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	ldr r1, [r4, r1]
	mvn r0, r0
	cmp r1, r0
	beq _0225D6E0
	add r0, r4, #0
	mov r1, #1
	bl ov33_0225D9D4
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	ldr r1, [r4, #0x10]
	sub r0, r0, #4
	strh r2, [r1, #6]
	mov r1, #1
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D656:
	ldr r0, [r0, #4]
	bl sub_02025204
	ldr r2, _0225D6EC ; =0x0000FFFF
	ldr r1, [r4, #0x10]
	strh r2, [r1, #6]
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r0, r1
	beq _0225D6E0
	add r0, r4, #0
	mov r1, #0
	bl ov33_0225D9D4
	mov r0, #0x6e
	mov r1, #0
	lsl r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D67E:
	ldr r0, [r4]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x6e
	mov r1, #3
	lsl r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D6A8:
	ldr r0, [r4]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x6e
	mov r1, #5
	lsl r0, r0, #2
	strh r1, [r4, r0]
	pop {r4, pc}
_0225D6D2:
	ldr r0, _0225D6F0 ; =gSystem + 0x40
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _0225D6E0
	ldr r0, _0225D6F4 ; =gSystem
	mov r1, #1
	str r1, [r0, #0x5c]
_0225D6E0:
	pop {r4, pc}
	nop
_0225D6E4: .word 0x000001BA
_0225D6E8: .word ov33_0225DA50
_0225D6EC: .word 0x0000FFFF
_0225D6F0: .word gSystem + 0x40
_0225D6F4: .word gSystem
	thumb_func_end ov33_0225D5D0

	thumb_func_start ov33_0225D6F8
ov33_0225D6F8: ; 0x0225D6F8
	push {r3, lr}
	mov r0, #0x80
	bl GX_SetBankForSubBG
	mov r0, #1
	lsl r0, r0, #8
	bl GX_SetBankForSubOBJ
	ldr r2, _0225D718 ; =0x04001000
	ldr r0, _0225D71C ; =0xFFCFFFEF
	ldr r1, [r2]
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0225D718: .word 0x04001000
_0225D71C: .word 0xFFCFFFEF
	thumb_func_end ov33_0225D6F8

	thumb_func_start ov33_0225D720
ov33_0225D720: ; 0x0225D720
	push {r4, r5, lr}
	sub sp, #0x54
	add r4, r0, #0
	mov r0, #0
	bl GXS_SetGraphicsMode
	ldr r5, _0225D7AC ; =ov33_0225DA68
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
	ldr r5, _0225D7B0 ; =ov33_0225DA84
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
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0225D7B4 ; =ov33_0225DAA0
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
_0225D7AC: .word ov33_0225DA68
_0225D7B0: .word ov33_0225DA84
_0225D7B4: .word ov33_0225DAA0
	thumb_func_end ov33_0225D720

	thumb_func_start ov33_0225D7B8
ov33_0225D7B8: ; 0x0225D7B8
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
	thumb_func_end ov33_0225D7B8

	thumb_func_start ov33_0225D7D4
ov33_0225D7D4: ; 0x0225D7D4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _0225D818 ; =0x000001BA
	mov r4, #0
	ldrh r2, [r7, r0]
	mov r0, #0xc
	sub r1, r2, #1
	mul r0, r1
	str r0, [sp]
	cmp r2, #0
	bls _0225D816
	add r5, r7, #0
	add r6, r4, #0
	add r5, #0x18
_0225D7F0:
	ldr r3, _0225D81C ; =ov33_0225DA50
	ldr r2, [sp]
	ldr r0, [r7]
	ldr r2, [r3, r2]
	add r1, r5, #0
	add r2, r2, r6
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, _0225D818 ; =0x000001BA
	add r4, r4, #1
	ldrh r0, [r7, r0]
	add r6, #8
	add r5, #0x10
	cmp r4, r0
	blo _0225D7F0
_0225D816:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D818: .word 0x000001BA
_0225D81C: .word ov33_0225DA50
	thumb_func_end ov33_0225D7D4

	thumb_func_start ov33_0225D820
ov33_0225D820: ; 0x0225D820
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0225D848 ; =0x000001BA
	mov r4, #0
	ldrh r0, [r6, r0]
	cmp r0, #0
	bls _0225D844
	add r5, r6, #0
	ldr r7, _0225D848 ; =0x000001BA
	add r5, #0x18
_0225D834:
	add r0, r5, #0
	bl RemoveWindow
	ldrh r0, [r6, r7]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blo _0225D834
_0225D844:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225D848: .word 0x000001BA
	thumb_func_end ov33_0225D820

	thumb_func_start ov33_0225D84C
ov33_0225D84C: ; 0x0225D84C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0xef
	mov r1, #8
	bl NARC_New
	mov r1, #0xa0
	str r1, [sp]
	mov r1, #8
	str r1, [sp, #4]
	mov r1, #0
	mov r2, #4
	add r3, r1, #0
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #1
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
	mov r1, #9
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	mov r2, #6
	add r5, #0x38
	add r0, #0xc
	lsl r2, r2, #6
	add r0, r0, r2
	add r1, r5, #0
	bl MIi_CpuCopy16
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov33_0225D84C

	thumb_func_start ov33_0225D8D4
ov33_0225D8D4: ; 0x0225D8D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r0, #0
	mov r0, #4
	mov r1, #8
	bl FontID_Alloc
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xbf
	mov r3, #8
	bl NewMsgDataFromNarc
	str r0, [sp, #0x14]
	ldr r0, _0225D9C8 ; =0x000001BA
	ldr r3, _0225D9CC ; =ov33_0225DA50
	ldrh r0, [r7, r0]
	mov r1, #0xc
	mov r5, #0
	sub r2, r0, #1
	mul r1, r2
	add r1, r3, r1
	str r1, [sp, #0x18]
	cmp r0, #0
	bls _0225D9B0
	add r0, r7, #0
	str r0, [sp, #0x1c]
	add r0, #0x38
	add r4, r7, #0
	str r0, [sp, #0x1c]
	add r4, #0x18
_0225D912:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x18]
	ldrh r1, [r1, #0xa]
	ldrb r0, [r0, #9]
	ldr r3, [sp, #0x18]
	add r1, r1, #6
	add r2, r1, #0
	mul r2, r5
	add r0, r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	ldrb r3, [r3, #8]
	ldr r0, [r7]
	ldr r2, [sp, #0x1c]
	mov r1, #5
	bl LoadRectToBgTilemapRect
	ldr r1, [r7, #0x10]
	ldr r0, [sp, #0x14]
	ldr r2, [r1]
	lsl r1, r5, #2
	ldr r1, [r2, r1]
	bl NewString_ReadMsgData
	lsl r6, r5, #4
	str r0, [sp, #0x20]
	add r0, r4, r6
	bl GetWindowWidth
	lsl r1, r0, #3
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x20]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r1, r0, #1
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x20]
	sub r0, r0, r1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225D9D0 ; =0x00020100
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r4, r6
	bl AddTextPrinterParameterized2
	add r0, r4, r6
	bl CopyWindowPixelsToVram_TextMode
	add r0, r4, r6
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x20]
	bl String_Delete
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, _0225D9C8 ; =0x000001BA
	ldrh r0, [r7, r0]
	cmp r5, r0
	blo _0225D912
_0225D9B0:
	ldr r0, [sp, #0x14]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	ldr r0, [r7]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225D9C8: .word 0x000001BA
_0225D9CC: .word ov33_0225DA50
_0225D9D0: .word 0x00020100
	thumb_func_end ov33_0225D8D4

	thumb_func_start ov33_0225D9D4
ov33_0225D9D4: ; 0x0225D9D4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r3, _0225DA1C ; =0x000001BA
	add r4, r0, #0
	ldrh r2, [r4, r3]
	ldr r0, _0225DA20 ; =ov33_0225DA50
	add r3, r3, #2
	sub r5, r2, #1
	mov r2, #0xc
	mul r2, r5
	add r5, r0, r2
	mov r0, #0x20
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrb r2, [r5, #8]
	ldrb r6, [r5, #9]
	ldrh r5, [r5, #0xa]
	ldr r3, [r4, r3]
	ldr r0, [r4]
	add r5, r5, #6
	mul r3, r5
	add r3, r6, r3
	lsl r3, r3, #0x18
	mov r1, #5
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0225DA1C: .word 0x000001BA
_0225DA20: .word ov33_0225DA50
	thumb_func_end ov33_0225D9D4

	.rodata

ov33_0225DA24:
	.byte 0x04, 0x01, 0x0C, 0x1E, 0x02, 0x04, 0x01, 0x00

ov33_0225DA2C:
	.byte 0x50, 0x7F, 0x00, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov33_0225DA34:
	.byte 0x28, 0x57, 0x00, 0xFF, 0x60, 0x8F, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov33_0225DA40:
	.byte 0x04, 0x01, 0x07, 0x1E, 0x02, 0x04, 0x01, 0x00, 0x04, 0x01, 0x0E, 0x1E, 0x02, 0x04, 0x3D, 0x00

ov33_0225DA50: ; 0x0225DA50
	.word ov33_0225DA24
	.word ov33_0225DA2C
	.byte 0x00, 0x0A, 0x00, 0x00
	.word ov33_0225DA40
	.word ov33_0225DA34
	.byte 0x00, 0x05, 0x01, 0x00

ov33_0225DA68: ; 0x0225DA68
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov33_0225DA84: ; 0x0225DA84
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov33_0225DAA0: ; 0x0225DAA0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0D, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
