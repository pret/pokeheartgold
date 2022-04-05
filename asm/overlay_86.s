	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov86_021E5900
ov86_021E5900: ; 0x021E5900
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0
	add r6, r1, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5A2C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5A30 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r2, _021E5A34 ; =0x04000304
	ldr r0, _021E5A38 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	mov r0, #3
	mov r1, #0x79
	lsl r2, r0, #0x10
	bl CreateHeap
	mov r1, #0xe5
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x79
	bl OverlayManager_CreateAndGetData
	mov r2, #0xe5
	add r5, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	str r4, [r5]
	mov r0, #0x79
	bl BgConfig_Alloc
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	mov r0, #0x89
	ldr r1, [r4]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	bl sub_0203107C
	mov r1, #0x8a
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldrb r0, [r4, #4]
	strb r0, [r5, #6]
	ldrb r0, [r4, #5]
	strb r0, [r5, #7]
	ldrh r0, [r4, #6]
	strh r0, [r5, #8]
	sub r0, r1, #4
	ldr r0, [r5, r0]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #4
	mov r1, #0x79
	bl FontID_Alloc
	add r0, r5, #0
	bl ov86_021E5E0C
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x13
	mov r3, #0x79
	bl NewMsgDataFromNarc
	mov r1, #0x21
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0x79
	bl ScrStrBufs_new
	mov r1, #0x85
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x32
	lsl r0, r0, #4
	mov r1, #0x79
	bl String_ctor
	mov r1, #0x86
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	sub r1, #0x78
	mov r2, #0x79
	bl LoadFontPal0
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x79
	bl LoadFontPal1
	ldrb r0, [r5, #7]
	bl ov86_021E5E98
	add r2, r0, #0
	add r1, r5, #0
	ldr r0, [r5, #0xc]
	add r1, #0x10
	bl ov86_021E7DF8
	mov r1, #0x8f
	lsl r1, r1, #2
	ldr r0, [r5, #0xc]
	add r1, r5, r1
	bl ov86_021E7E68
	add r0, r5, #0
	bl ov86_021E6E30
	add r0, r5, #0
	bl ov86_021E6E98
	ldr r0, _021E5A3C ; =ov86_021E5CDC
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	str r0, [r6]
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E5A2C: .word 0xFFFFE0FF
_021E5A30: .word 0x04001000
_021E5A34: .word 0x04000304
_021E5A38: .word 0xFFFF7FFF
_021E5A3C: .word ov86_021E5CDC
	thumb_func_end ov86_021E5900

	thumb_func_start ov86_021E5A40
ov86_021E5A40: ; 0x021E5A40
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0
	beq _021E5A5A
	cmp r1, #1
	beq _021E5A6E
	cmp r1, #2
	beq _021E5A82
	b _021E5A8E
_021E5A5A:
	bl ov86_021E5B38
	cmp r0, #1
	bne _021E5A8E
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov86_021E5E90
	b _021E5A8E
_021E5A6E:
	bl ov86_021E5BA0
	cmp r0, #1
	bne _021E5A8E
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov86_021E5E90
	b _021E5A8E
_021E5A82:
	bl ov86_021E5C94
	cmp r0, #1
	bne _021E5A8E
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5A8E:
	add r0, r4, #0
	bl ov86_021E703C
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov86_021E5A40

	thumb_func_start ov86_021E5AA4
ov86_021E5AA4: ; 0x021E5AA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov86_021E6FF4
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02003104
	mov r0, #0x87
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0xc
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x8f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov86_021E7E90
	ldrb r0, [r4, #7]
	bl ov86_021E5E98
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x10
	bl ov86_021E7E40
	ldr r0, [r4, #0xc]
	bl ov86_021E5E54
	mov r0, #4
	bl FontID_Release
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x79
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov86_021E5AA4

	thumb_func_start ov86_021E5B38
ov86_021E5B38: ; 0x021E5B38
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021E5B4E
	cmp r1, #1
	beq _021E5B6C
	cmp r1, #2
	beq _021E5B8C
	b _021E5B9A
_021E5B4E:
	bl ov86_021E71FC
	cmp r0, #1
	bne _021E5B5E
	add r0, r4, #0
	bl ov86_021E720C
	b _021E5B64
_021E5B5E:
	add r0, r4, #0
	bl ov86_021E60B8
_021E5B64:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021E5B9A
_021E5B6C:
	mov r0, #6
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x79
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021E5B9A
_021E5B8C:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5B9A
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E5B9A:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov86_021E5B38

	thumb_func_start ov86_021E5BA0
ov86_021E5BA0: ; 0x021E5BA0
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #4]
	cmp r1, #0xa
	bhi _021E5C82
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5BB6: ; jump table
	.short _021E5BCC - _021E5BB6 - 2 ; case 0
	.short _021E5BE0 - _021E5BB6 - 2 ; case 1
	.short _021E5C0A - _021E5BB6 - 2 ; case 2
	.short _021E5C16 - _021E5BB6 - 2 ; case 3
	.short _021E5C1E - _021E5BB6 - 2 ; case 4
	.short _021E5C2A - _021E5BB6 - 2 ; case 5
	.short _021E5C32 - _021E5BB6 - 2 ; case 6
	.short _021E5C3A - _021E5BB6 - 2 ; case 7
	.short _021E5C46 - _021E5BB6 - 2 ; case 8
	.short _021E5C70 - _021E5BB6 - 2 ; case 9
	.short _021E5C7E - _021E5BB6 - 2 ; case 10
_021E5BCC:
	bl ov86_021E71FC
	cmp r0, #1
	bne _021E5BDA
	mov r0, #3
	strb r0, [r4, #4]
	b _021E5C82
_021E5BDA:
	mov r0, #1
	strb r0, [r4, #4]
	b _021E5C82
_021E5BE0:
	ldr r0, _021E5C88 ; =_021E7E98
	bl sub_02025320
	cmp r0, #1
	beq _021E5BF4
	ldr r0, _021E5C8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021E5C82
_021E5BF4:
	ldr r0, _021E5C90 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	bl ov86_021E71C0
	mov r0, #0xa
	strb r0, [r4, #5]
	mov r0, #9
	strb r0, [r4, #4]
	b _021E5C82
_021E5C0A:
	mov r1, #1
	bl ov86_021E7258
	mov r0, #3
	strb r0, [r4, #4]
	b _021E5C82
_021E5C16:
	bl ov86_021E7710
	strb r0, [r4, #4]
	b _021E5C82
_021E5C1E:
	mov r1, #2
	bl ov86_021E7258
	mov r0, #5
	strb r0, [r4, #4]
	b _021E5C82
_021E5C2A:
	bl ov86_021E7984
	strb r0, [r4, #4]
	b _021E5C82
_021E5C32:
	bl ov86_021E7B54
	strb r0, [r4, #4]
	b _021E5C82
_021E5C3A:
	mov r1, #0
	bl ov86_021E7258
	mov r0, #8
	strb r0, [r4, #4]
	b _021E5C82
_021E5C46:
	ldr r0, _021E5C88 ; =_021E7E98
	bl sub_02025320
	cmp r0, #1
	beq _021E5C5A
	ldr r0, _021E5C8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021E5C82
_021E5C5A:
	ldr r0, _021E5C90 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	bl ov86_021E71C0
	mov r0, #4
	strb r0, [r4, #5]
	mov r0, #9
	strb r0, [r4, #4]
	b _021E5C82
_021E5C70:
	bl ov86_021E7094
	cmp r0, #0
	bne _021E5C82
	ldrb r0, [r4, #5]
	strb r0, [r4, #4]
	b _021E5C82
_021E5C7E:
	mov r0, #1
	pop {r4, pc}
_021E5C82:
	mov r0, #0
	pop {r4, pc}
	nop
_021E5C88: .word _021E7E98
_021E5C8C: .word gSystem
_021E5C90: .word 0x000005DD
	thumb_func_end ov86_021E5BA0

	thumb_func_start ov86_021E5C94
ov86_021E5C94: ; 0x021E5C94
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _021E5CA6
	cmp r0, #1
	beq _021E5CC6
	b _021E5CD4
_021E5CA6:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x79
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021E5CD4
_021E5CC6:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5CD4
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E5CD4:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov86_021E5C94

	thumb_func_start ov86_021E5CDC
ov86_021E5CDC: ; 0x021E5CDC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5CEE
	bl sub_0200398C
_021E5CEE:
	ldr r0, [r4, #0xc]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl sub_0200D034
	ldr r3, _021E5D08 ; =0x027E0000
	ldr r1, _021E5D0C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E5D08: .word 0x027E0000
_021E5D0C: .word 0x00003FF8
	thumb_func_end ov86_021E5CDC

	thumb_func_start ov86_021E5D10
ov86_021E5D10: ; 0x021E5D10
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5D2C ; =ov86_021E7FBC
	add r3, sp, #0
	mov r2, #5
_021E5D1A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5D1A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5D2C: .word ov86_021E7FBC
	thumb_func_end ov86_021E5D10

	thumb_func_start ov86_021E5D30
ov86_021E5D30: ; 0x021E5D30
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _021E5DF8 ; =ov86_021E7EC8
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E5DFC ; =ov86_021E7F04
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
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x79
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5E00 ; =ov86_021E7F20
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
	ldr r5, _021E5E04 ; =ov86_021E7F3C
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
	mov r3, #0x79
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E5E08 ; =ov86_021E7F58
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E5DF8: .word ov86_021E7EC8
_021E5DFC: .word ov86_021E7F04
_021E5E00: .word ov86_021E7F20
_021E5E04: .word ov86_021E7F3C
_021E5E08: .word ov86_021E7F58
	thumb_func_end ov86_021E5D30

	thumb_func_start ov86_021E5E0C
ov86_021E5E0C: ; 0x021E5E0C
	push {r4, lr}
	add r4, r0, #0
	bl ov86_021E5D10
	ldr r0, [r4, #0xc]
	bl ov86_021E5D30
	mov r0, #0x79
	bl sub_020030E8
	mov r1, #0x87
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	lsl r2, r1, #8
	mov r3, #0x79
	bl PaletteData_AllocBuffers
	mov r2, #0x87
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	mov r1, #0
	sub r2, #0x1c
	mov r3, #0x79
	bl PaletteData_AllocBuffers
	add r0, r4, #0
	mov r1, #2
	bl ov86_021E5ECC
	add r0, r4, #0
	mov r1, #6
	bl ov86_021E5F58
	pop {r4, pc}
	thumb_func_end ov86_021E5E0C

	thumb_func_start ov86_021E5E54
ov86_021E5E54: ; 0x021E5E54
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov86_021E5E54

	thumb_func_start ov86_021E5E90
ov86_021E5E90: ; 0x021E5E90
	mov r3, #0
	strb r3, [r0, #4]
	str r2, [r1]
	bx lr
	thumb_func_end ov86_021E5E90

	thumb_func_start ov86_021E5E98
ov86_021E5E98: ; 0x021E5E98
	mov r1, #0
	cmp r0, #6
	bhi _021E5EC8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5EAA: ; jump table
	.short _021E5EC8 - _021E5EAA - 2 ; case 0
	.short _021E5EC6 - _021E5EAA - 2 ; case 1
	.short _021E5EB8 - _021E5EAA - 2 ; case 2
	.short _021E5EB8 - _021E5EAA - 2 ; case 3
	.short _021E5EBE - _021E5EAA - 2 ; case 4
	.short _021E5EBA - _021E5EAA - 2 ; case 5
	.short _021E5EC2 - _021E5EAA - 2 ; case 6
_021E5EB8:
	b _021E5EC8
_021E5EBA:
	mov r1, #1
	b _021E5EC8
_021E5EBE:
	mov r1, #2
	b _021E5EC8
_021E5EC2:
	mov r1, #3
	b _021E5EC8
_021E5EC6:
	mov r1, #4
_021E5EC8:
	add r0, r1, #0
	bx lr
	thumb_func_end ov86_021E5E98

	thumb_func_start ov86_021E5ECC
ov86_021E5ECC: ; 0x021E5ECC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb7
	mov r1, #0x79
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #0x79
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	mov r1, #0x8c
	add r3, r6, #0
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x60
	str r0, [sp]
	mov r0, #0x79
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xc3
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x79
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #0x8b
	add r3, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x79
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x8f
	mov r2, #1
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #0xcd
	lsl r1, r1, #2
	add r0, #0xc
	add r1, r5, r1
	mov r2, #0x60
	bl MIi_CpuCopy16
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov86_021E5ECC

	thumb_func_start ov86_021E5F58
ov86_021E5F58: ; 0x021E5F58
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb7
	mov r1, #0x79
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #0x79
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	mov r1, #0x8e
	add r3, r6, #0
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x79
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #0x8d
	add r3, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x79
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xc4
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov86_021E5F58

	thumb_func_start ov86_021E5FBC
ov86_021E5FBC: ; 0x021E5FBC
	push {r3, lr}
	sub sp, #8
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	mov r3, #0x85
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	mov r3, #4
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov86_021E5FBC

	thumb_func_start ov86_021E5FD8
ov86_021E5FD8: ; 0x021E5FD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #1
	bne _021E5FF6
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	sub r5, r5, r0
	b _021E6006
_021E5FF6:
	cmp r0, #2
	bne _021E6006
	ldr r0, [sp, #0x28]
	mov r2, #0
	bl FontID_String_GetWidth
	lsr r0, r0, #1
	sub r5, r5, r0
_021E6006:
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
	thumb_func_end ov86_021E5FD8

	thumb_func_start ov86_021E6024
ov86_021E6024: ; 0x021E6024
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x21
	lsl r0, r0, #4
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r2, #0
	add r7, r3, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [sp, #0x24]
	add r5, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r6, #0
	str r0, [sp, #8]
	lsl r0, r4, #4
	add r0, r5, r0
	add r2, r7, #0
	bl ov86_021E5FD8
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov86_021E6024

	thumb_func_start ov86_021E6064
ov86_021E6064: ; 0x021E6064
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x21
	lsl r0, r0, #4
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r2, #0
	add r7, r3, #0
	bl NewString_ReadMsgData
	mov r1, #0x85
	add r6, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x24]
	add r1, r5, #0
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r1, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #8]
	lsl r0, r4, #4
	add r0, r1, r0
	mov r1, #0x86
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl ov86_021E5FD8
	add r0, r6, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov86_021E6064

	thumb_func_start ov86_021E60B8
ov86_021E60B8: ; 0x021E60B8
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #7]
	cmp r1, #6
	bhi _021E610C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E60CE: ; jump table
	.short _021E610C - _021E60CE - 2 ; case 0
	.short _021E60FA - _021E60CE - 2 ; case 1
	.short _021E60DC - _021E60CE - 2 ; case 2
	.short _021E60DC - _021E60CE - 2 ; case 3
	.short _021E60EE - _021E60CE - 2 ; case 4
	.short _021E60E8 - _021E60CE - 2 ; case 5
	.short _021E60F4 - _021E60CE - 2 ; case 6
_021E60DC:
	bl ov86_021E6114
	add r0, r4, #0
	bl ov86_021E62F4
	pop {r4, pc}
_021E60E8:
	bl ov86_021E64E0
	pop {r4, pc}
_021E60EE:
	bl ov86_021E66D0
	pop {r4, pc}
_021E60F4:
	bl ov86_021E690C
	pop {r4, pc}
_021E60FA:
	ldrb r1, [r4, #6]
	cmp r1, #1
	bhi _021E6106
	bl ov86_021E6A88
	pop {r4, pc}
_021E6106:
	bl ov86_021E6BA8
	pop {r4, pc}
_021E610C:
	add r0, r4, #0
	bl ov86_021E690C
	pop {r4, pc}
	thumb_func_end ov86_021E60B8

	thumb_func_start ov86_021E6114
ov86_021E6114: ; 0x021E6114
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x30
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x40
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E62EC ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x16
	add r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _021E6160
	mov r2, #0x1a
	b _021E616A
_021E6160:
	cmp r0, #1
	bne _021E6168
	mov r2, #0x1b
	b _021E616A
_021E6168:
	mov r2, #0x1c
_021E616A:
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E62EC ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r3, #0xe0
	bl ov86_021E6024
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E62F0 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x2e
	str r3, [sp, #0xc]
	bl ov86_021E6024
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x30
	mov r3, #0xe0
	str r1, [sp, #0xc]
	bl ov86_021E6024
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E6484
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	ldr r0, _021E62F0 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	mov r0, #0
	bl sub_0205BFF0
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 ; =0x00010200
	mov r1, #2
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	mov r0, #0
	bl sub_0205C048
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 ; =0x00010200
	mov r1, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x34
	mov r3, #0xe0
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E62F0 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x2b
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	mov r0, #0
	bl sub_0205C01C
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 ; =0x00010200
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	mov r0, #0
	bl sub_0205C074
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E62F0 ; =0x00010200
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x34
	mov r3, #0xe0
	bl ov86_021E6064
	add r0, r4, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	add r4, #0x40
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E62EC: .word 0x000F0200
_021E62F0: .word 0x00010200
	thumb_func_end ov86_021E6114

	thumb_func_start ov86_021E62F4
ov86_021E62F4: ; 0x021E62F4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x50
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x60
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x70
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6480 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #4
	mov r2, #0x2f
	str r3, [sp, #0xc]
	bl ov86_021E6024
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 ; =0x00010200
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x30
	mov r3, #0xe0
	bl ov86_021E6024
	add r0, r4, #0
	mov r1, #1
	bl ov86_021E6484
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6480 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #5
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	mov r0, #1
	bl sub_0205BFF0
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 ; =0x00010200
	mov r1, #5
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	mov r0, #1
	bl sub_0205C048
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 ; =0x00010200
	mov r1, #5
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x34
	mov r3, #0xe0
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6480 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0x2b
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	mov r0, #1
	bl sub_0205C01C
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 ; =0x00010200
	mov r1, #6
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	ldrb r1, [r4, #6]
	mov r0, #1
	bl sub_0205C074
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6480 ; =0x00010200
	mov r1, #6
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x34
	mov r3, #0xe0
	bl ov86_021E6064
	add r0, r4, #0
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x60
	bl ScheduleWindowCopyToVram
	add r4, #0x70
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021E6480: .word 0x00010200
	thumb_func_end ov86_021E62F4

	thumb_func_start ov86_021E6484
ov86_021E6484: ; 0x021E6484
	push {r4, r5, r6, lr}
	add r6, r1, #0
	bne _021E648E
	mov r5, #0x66
	b _021E6490
_021E648E:
	mov r5, #0x68
_021E6490:
	ldrb r4, [r0, #6]
	cmp r4, #3
	bne _021E64B4
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_0203107C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020310BC
	b _021E64CE
_021E64B4:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_02030AE8
	lsl r2, r6, #2
	add r2, r4, r2
	lsl r2, r2, #0x18
	mov r1, #0xa
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030AD4
_021E64CE:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _021E64DA
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_021E64DA:
	mov r0, #0x1d
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov86_021E6484

	thumb_func_start ov86_021E64E0
ov86_021E64E0: ; 0x021E64E0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x40
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6684 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x18
	add r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _021E652C
	mov r2, #0x1a
	b _021E6536
_021E652C:
	cmp r0, #1
	bne _021E6534
	mov r2, #0x1b
	b _021E6536
_021E6534:
	mov r2, #0x1c
_021E6536:
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6684 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r3, #0xe0
	bl ov86_021E6024
	ldrh r1, [r5, #8]
	add r0, r5, #0
	bl ov86_021E668C
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6688 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x33
	str r3, [sp, #0xc]
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6688 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #2
	mov r2, #0x1d
	str r3, [sp, #0xc]
	bl ov86_021E6024
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #6]
	bl sub_0205C11C
	add r6, r0, #0
	ldrb r0, [r5, #6]
	bl sub_0205C11C
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	ldrh r1, [r5, #8]
	cmp r1, r0
	beq _021E65B2
	mov r2, #0
	b _021E65C8
_021E65B2:
	ldrb r0, [r5, #6]
	bl sub_0205C0CC
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
_021E65C8:
	add r0, r5, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6688 ; =0x00010200
	mov r1, #2
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #0x32
	mov r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6688 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	mov r2, #0x2b
	str r3, [sp, #0xc]
	bl ov86_021E6024
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xb
	add r2, sp, #0x10
	bl sub_020312C4
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	beq _021E6618
	mov r6, #0
	b _021E6630
_021E6618:
	ldrb r0, [r5, #6]
	bl sub_0205C144
	add r2, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	ldrh r3, [r5, #8]
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_020312E0
	add r6, r0, #0
_021E6630:
	cmp r4, #0
	beq _021E663A
	add r0, r4, #0
	bl FreeToHeap
_021E663A:
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6688 ; =0x00010200
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	add r0, r5, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	add r5, #0x40
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_021E6684: .word 0x000F0200
_021E6688: .word 0x00010200
	thumb_func_end ov86_021E64E0

	thumb_func_start ov86_021E668C
ov86_021E668C: ; 0x021E668C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #0x79
	bl NewMsgDataFromNarc
	add r6, r0, #0
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r6, #0
	bl DestroyMsgData
	mov r1, #0
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r5, #0
	add r3, r1, #0
	bl BufferString
	add r0, r5, #0
	bl String_dtor
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov86_021E668C

	thumb_func_start ov86_021E66D0
ov86_021E66D0: ; 0x021E66D0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x40
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E68B0 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x17
	add r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _021E671C
	mov r2, #0x1a
	b _021E6726
_021E671C:
	cmp r0, #1
	bne _021E6724
	mov r2, #0x1b
	b _021E6726
_021E6724:
	mov r2, #0x1c
_021E6726:
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E68B0 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r3, #0xe0
	bl ov86_021E6024
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #0x31
	mov r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6024
	add r0, r5, #0
	bl ov86_021E68B8
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	ldr r0, _021E68B4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	bl sub_0205C1A0
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 ; =0x00010200
	mov r1, #2
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #0x36
	mov r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #6]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #6]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 ; =0x00010200
	mov r1, #2
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x35
	mov r3, #0xe0
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E68B4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r5, #0
	mov r1, #3
	mov r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r5, #6]
	bl sub_0205C1C8
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 ; =0x00010200
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x36
	mov r3, #0x70
	bl ov86_021E6064
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #6]
	bl sub_0205C240
	add r6, r0, #0
	ldrb r0, [r5, #6]
	bl sub_0205C240
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E68B4 ; =0x00010200
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x35
	mov r3, #0xe0
	bl ov86_021E6064
	add r0, r5, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	add r5, #0x40
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E68B0: .word 0x000F0200
_021E68B4: .word 0x00010200
	thumb_func_end ov86_021E66D0

	thumb_func_start ov86_021E68B8
ov86_021E68B8: ; 0x021E68B8
	push {r3, r4, lr}
	sub sp, #4
	ldrb r4, [r0, #6]
	cmp r4, #3
	bne _021E68E0
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6c
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x6c
	bl sub_020310BC
	b _021E68F6
_021E68E0:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_02030E08
	mov r3, #0
	mov r1, #9
	add r2, r4, #0
	str r3, [sp]
	bl sub_02030E58
_021E68F6:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _021E6904
	add sp, #4
	mov r0, #0x1e
	pop {r3, r4, pc}
_021E6904:
	mov r0, #0x1d
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov86_021E68B8

	thumb_func_start ov86_021E690C
ov86_021E690C: ; 0x021E690C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x30
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6A2C ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x19
	add r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _021E694E
	mov r2, #0x1a
	b _021E6958
_021E694E:
	cmp r0, #1
	bne _021E6956
	mov r2, #0x1b
	b _021E6958
_021E6956:
	mov r2, #0x1c
_021E6958:
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6A2C ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r3, #0xe0
	bl ov86_021E6024
	add r0, r4, #0
	bl ov86_021E6A34
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6A30 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #1
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl sub_0205C2C0
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6A30 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x37
	mov r3, #0x70
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6A30 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	mov r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl sub_0205C2E8
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6A30 ; =0x00010200
	mov r1, #2
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x37
	mov r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	add r0, r4, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	add r4, #0x30
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021E6A2C: .word 0x000F0200
_021E6A30: .word 0x00010200
	thumb_func_end ov86_021E690C

	thumb_func_start ov86_021E6A34
ov86_021E6A34: ; 0x021E6A34
	push {r3, r4, lr}
	sub sp, #4
	ldrb r4, [r0, #6]
	cmp r4, #3
	bne _021E6A5C
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6e
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x6e
	bl sub_020310BC
	b _021E6A72
_021E6A5C:
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_02030FA0
	mov r3, #0
	mov r1, #8
	add r2, r4, #0
	str r3, [sp]
	bl sub_02030FE4
_021E6A72:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _021E6A80
	add sp, #4
	mov r0, #0x1e
	pop {r3, r4, pc}
_021E6A80:
	mov r0, #0x1d
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov86_021E6A34

	thumb_func_start ov86_021E6A88
ov86_021E6A88: ; 0x021E6A88
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x30
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x40
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6BA0 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x15
	add r3, r1, #0
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	cmp r0, #0
	bne _021E6ACA
	mov r2, #0x1a
	b _021E6ACC
_021E6ACA:
	mov r2, #0x1b
_021E6ACC:
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6BA0 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r3, #0xe0
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	add r0, r4, #0
	bl ov86_021E6DD8
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6BA4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl sub_0205C310
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6BA4 ; =0x00010200
	mov r1, #2
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	str r1, [sp, #0xc]
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6BA4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl sub_0205C350
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6BA4 ; =0x00010200
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	add r0, r4, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	add r4, #0x40
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E6BA0: .word 0x000F0200
_021E6BA4: .word 0x00010200
	thumb_func_end ov86_021E6A88

	thumb_func_start ov86_021E6BA8
ov86_021E6BA8: ; 0x021E6BA8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x50
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x60
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x70
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x80
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x90
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6DD0 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x15
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl ov86_021E6024
	mov r1, #0
	str r1, [sp]
	ldr r0, _021E6DD0 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x1c
	mov r3, #0xe0
	bl ov86_021E6024
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x2c
	bl ov86_021E6024
	ldrb r1, [r4, #6]
	add r0, r4, #0
	bl ov86_021E6DD8
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6DD4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #4
	str r3, [sp, #0xc]
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl sub_0205C310
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 ; =0x00010200
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0x2b
	bl ov86_021E6024
	ldrb r0, [r4, #6]
	bl sub_0205C350
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 ; =0x00010200
	mov r1, #5
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0x2d
	str r3, [sp, #0xc]
	bl ov86_021E6024
	add r0, r4, #0
	mov r1, #3
	bl ov86_021E6DD8
	mov r3, #0
	add r2, r0, #0
	str r3, [sp]
	ldr r0, _021E6DD4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #7
	str r3, [sp, #0xc]
	bl ov86_021E6024
	mov r0, #3
	bl sub_0205C310
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 ; =0x00010200
	mov r1, #7
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6DD4 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #8
	mov r2, #0x2b
	str r3, [sp, #0xc]
	bl ov86_021E6024
	mov r0, #3
	bl sub_0205C350
	add r1, r0, #0
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #0xff
	bl sub_020310BC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6DD4 ; =0x00010200
	mov r1, #8
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x32
	mov r3, #0x70
	bl ov86_021E6064
	add r0, r4, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x60
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x70
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x80
	bl ScheduleWindowCopyToVram
	add r4, #0x90
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E6DD0: .word 0x000F0200
_021E6DD4: .word 0x00010200
	thumb_func_end ov86_021E6BA8

	thumb_func_start ov86_021E6DD8
ov86_021E6DD8: ; 0x021E6DD8
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl Save_FrontierData_get
	cmp r4, #6
	bhi _021E6E1C
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6DF6: ; jump table
	.short _021E6E04 - _021E6DF6 - 2 ; case 0
	.short _021E6E08 - _021E6DF6 - 2 ; case 1
	.short _021E6E0C - _021E6DF6 - 2 ; case 2
	.short _021E6E10 - _021E6DF6 - 2 ; case 3
	.short _021E6E14 - _021E6DF6 - 2 ; case 4
	.short _021E6E1C - _021E6DF6 - 2 ; case 5
	.short _021E6E18 - _021E6DF6 - 2 ; case 6
_021E6E04:
	mov r1, #8
	b _021E6E1E
_021E6E08:
	mov r1, #9
	b _021E6E1E
_021E6E0C:
	mov r1, #0xa
	b _021E6E1E
_021E6E10:
	mov r1, #0xb
	b _021E6E1E
_021E6E14:
	mov r1, #0xc
	b _021E6E1E
_021E6E18:
	mov r1, #0xf
	b _021E6E1E
_021E6E1C:
	mov r1, #8
_021E6E1E:
	mov r2, #0
	bl sub_0202D5DC
	cmp r0, #1
	bne _021E6E2C
	mov r0, #0x1e
	pop {r4, pc}
_021E6E2C:
	mov r0, #0x1d
	pop {r4, pc}
	thumb_func_end ov86_021E6DD8

	thumb_func_start ov86_021E6E30
ov86_021E6E30: ; 0x021E6E30
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x27
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #0x8f
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x8f
	lsl r0, r0, #2
	add r0, r5, r0
	bl GetWindowWidth
	add r2, r0, #0
	mov r0, #4
	str r0, [sp]
	ldr r0, _021E6E94 ; =0x000F0100
	lsl r3, r2, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x8f
	lsr r2, r3, #0x1f
	add r2, r3, r2
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	asr r2, r2, #1
	mov r3, #0
	bl ov86_021E5FD8
	mov r0, #0x8f
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E6E94: .word 0x000F0100
	thumb_func_end ov86_021E6E30

	thumb_func_start ov86_021E6E98
ov86_021E6E98: ; 0x021E6E98
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	add r5, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x79
	bl sub_0200CF18
	mov r1, #0x8b
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl sub_0200CF38
	mov r7, #0x23
	lsl r7, r7, #4
	add r2, sp, #0x3c
	ldr r3, _021E6FE0 ; =ov86_021E7F74
	str r0, [r5, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r4, _021E6FE4 ; =ov86_021E7ED8
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
	ldr r3, _021E6FE8 ; =ov86_021E7EEC
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
	mov r2, #2
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
	mov r0, #0xb8
	mov r1, #0x79
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E6FEC ; =0x0000D8CC
	sub r1, r7, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x33
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021E6FEC ; =0x0000D8CC
	sub r1, r7, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x40
	bl sub_0200D5D4
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E6FEC ; =0x0000D8CC
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x31
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _021E6FEC ; =0x0000D8CC
	sub r1, r7, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x32
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	ldr r6, _021E6FF0 ; =ov86_021E802C
	mov r7, #0
	add r4, r5, #0
_021E6FB8:
	mov r0, #0x8b
	mov r1, #0x23
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200D734
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r7, r7, #1
	add r6, #0x34
	add r4, r4, #4
	cmp r7, #2
	blo _021E6FB8
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_021E6FE0: .word ov86_021E7F74
_021E6FE4: .word ov86_021E7ED8
_021E6FE8: .word ov86_021E7EEC
_021E6FEC: .word 0x0000D8CC
_021E6FF0: .word ov86_021E802C
	thumb_func_end ov86_021E6E98

	thumb_func_start ov86_021E6FF4
ov86_021E6FF4: ; 0x021E6FF4
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, #0x8d
	str r0, [sp]
	add r5, r0, #0
	add r6, r4, #0
	lsl r7, r7, #2
_021E7002:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _021E7012
	bl sub_0200D9DC
	mov r0, #0x8d
	lsl r0, r0, #2
	str r6, [r5, r0]
_021E7012:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blo _021E7002
	mov r1, #0x8b
	lsl r1, r1, #2
	ldr r0, [sp]
	add r2, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [sp]
	ldr r1, [r1, r2]
	bl sub_0200D998
	mov r1, #0x8b
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov86_021E6FF4

	thumb_func_start ov86_021E703C
ov86_021E703C: ; 0x021E703C
	push {r4, r5, r6, lr}
	mov r6, #0x8d
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_021E7046:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021E7050
	bl sub_0200DC18
_021E7050:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blo _021E7046
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov86_021E703C

	thumb_func_start ov86_021E705C
ov86_021E705C: ; 0x021E705C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0x8d
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
	thumb_func_end ov86_021E705C

	thumb_func_start ov86_021E707C
ov86_021E707C: ; 0x021E707C
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _021E7090 ; =sub_0200DDB8
	bx r3
	nop
_021E7090: .word sub_0200DDB8
	thumb_func_end ov86_021E707C

	thumb_func_start ov86_021E7094
ov86_021E7094: ; 0x021E7094
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r3, _021E71B8 ; =0x0000024E
	add r4, r0, #0
	ldrb r0, [r4, r3]
	cmp r0, #0
	beq _021E70AC
	cmp r0, #1
	beq _021E7118
	cmp r0, #2
	beq _021E719C
	b _021E71B2
_021E70AC:
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021E70D2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	lsl r0, r0, #2
	add r1, r4, r0
	add r0, r3, #0
	sub r0, #0x1a
	ldr r0, [r1, r0]
	sub r1, r3, #1
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	b _021E710E
_021E70D2:
	add r0, r3, #4
	ldrb r0, [r4, r0]
	sub r1, r3, #2
	add r2, r3, #2
	str r0, [sp]
	add r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	sub r0, r3, #1
	ldrb r0, [r4, r0]
	add r3, r3, #3
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0xc]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	mov r1, #0x93
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
_021E710E:
	ldr r0, _021E71B8 ; =0x0000024E
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021E71B2
_021E7118:
	add r0, r3, #1
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #4
	bne _021E71B2
	sub r0, r3, #2
	ldrb r0, [r4, r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021E714E
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	lsl r0, r0, #2
	add r1, r4, r0
	add r0, r3, #0
	sub r0, #0x1a
	ldr r0, [r1, r0]
	sub r1, r3, #1
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	b _021E718A
_021E714E:
	add r0, r3, #4
	ldrb r0, [r4, r0]
	sub r1, r3, #2
	add r2, r3, #2
	str r0, [sp]
	add r0, r3, #5
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	sub r0, r3, #1
	ldrb r0, [r4, r0]
	add r3, r3, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	str r0, [sp, #8]
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0xc]
	lsr r1, r1, #0x19
	bl BgTilemapRectChangePalette
	mov r1, #0x93
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x19
	bl ScheduleBgTilemapBufferTransfer
_021E718A:
	ldr r0, _021E71BC ; =0x0000024F
	mov r1, #0
	strb r1, [r4, r0]
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021E71B2
_021E719C:
	add r0, r3, #1
	ldrb r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #2
	bne _021E71B2
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021E71B2:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021E71B8: .word 0x0000024E
_021E71BC: .word 0x0000024F
	thumb_func_end ov86_021E7094

	thumb_func_start ov86_021E71C0
ov86_021E71C0: ; 0x021E71C0
	mov r2, #0x93
	lsl r2, r2, #2
	ldrb r3, [r0, r2]
	mov r1, #1
	bic r3, r1
	strb r3, [r0, r2]
	ldrb r3, [r0, r2]
	mov r1, #0xfe
	bic r3, r1
	add r1, r2, #1
	strb r3, [r0, r2]
	ldrb r3, [r0, r1]
	mov r1, #0xf
	bic r3, r1
	mov r1, #1
	orr r3, r1
	add r1, r2, #1
	strb r3, [r0, r1]
	ldrb r3, [r0, r1]
	mov r1, #0xf0
	bic r3, r1
	add r1, r2, #1
	strb r3, [r0, r1]
	mov r3, #0
	add r1, r2, #2
	strb r3, [r0, r1]
	add r1, r2, #3
	strb r3, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov86_021E71C0

	thumb_func_start ov86_021E71FC
ov86_021E71FC: ; 0x021E71FC
	ldrb r0, [r0, #7]
	cmp r0, #5
	bne _021E7206
	mov r0, #1
	bx lr
_021E7206:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov86_021E71FC

	thumb_func_start ov86_021E720C
ov86_021E720C: ; 0x021E720C
	push {r4, lr}
	add r4, r0, #0
	bl ov86_021E74F0
	add r0, r4, #0
	bl ov86_021E7418
	add r0, r4, #0
	bl ov86_021E7598
	add r0, r4, #0
	mov r1, #1
	bl ov86_021E7258
	mov r0, #0
	mov r1, #1
	mov r2, #0xd
	mov r3, #0x79
	bl sub_020163E0
	mov r1, #0x33
	lsl r1, r1, #4
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov86_021E720C

	thumb_func_start ov86_021E723C
ov86_021E723C: ; 0x021E723C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x33
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020164C4
	add r0, r4, #0
	bl ov86_021E74D0
	add r0, r4, #0
	bl ov86_021E73CC
	pop {r4, pc}
	thumb_func_end ov86_021E723C

	thumb_func_start ov86_021E7258
ov86_021E7258: ; 0x021E7258
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _021E726A
	cmp r1, #1
	beq _021E72A2
	cmp r1, #2
	beq _021E72E4
	b _021E7338
_021E726A:
	mov r2, #0
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	add r0, r4, #0
	bl ov86_021E7C70
	add r0, r4, #0
	bl ov86_021E73CC
	add r0, r4, #0
	bl ov86_021E7D8C
	add r0, r4, #0
	bl ov86_021E7DA8
	add r0, r4, #0
	bl ov86_021E757C
	b _021E7338
_021E72A2:
	mov r2, #0
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r3, r2, #0
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r3, #0xfd
	bl ScheduleSetBgPosText
	add r0, r4, #0
	bl ov86_021E7C70
	add r0, r4, #0
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl ov86_021E73CC
	add r0, r4, #0
	bl ov86_021E7630
	add r0, r4, #0
	bl ov86_021E77BC
	add r0, r4, #0
	bl ov86_021E752C
	b _021E7338
_021E72E4:
	mov r1, #2
	add r3, r1, #0
	ldr r0, [r4, #0xc]
	mov r2, #0
	add r3, #0xfe
	bl ScheduleSetBgPosText
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r3, #0xfd
	bl ScheduleSetBgPosText
	add r0, r4, #0
	add r0, #0x50
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl ov86_021E7DD4
	add r0, r4, #0
	bl ov86_021E7B68
	add r0, r4, #0
	bl ov86_021E7CF8
	add r0, r4, #0
	bl ov86_021E7344
	add r0, r4, #0
	bl ov86_021E7CA0
	add r0, r4, #0
	bl ov86_021E73CC
	add r0, r4, #0
	bl ov86_021E7860
	add r0, r4, #0
	bl ov86_021E752C
_021E7338:
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov86_021E7258

	thumb_func_start ov86_021E7344
ov86_021E7344: ; 0x021E7344
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r2, _021E73C8 ; =0x0000025D
	add r4, r0, #0
	ldrsb r0, [r4, r2]
	cmp r0, #0
	bne _021E7388
	mov r0, #0x34
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r2, #0xdd
	str r0, [sp, #8]
	lsl r2, r2, #2
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r2, r4, r2
	mov r3, #0x22
	bl LoadRectToBgTilemapRect
	mov r0, #0x34
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r2, #0xdd
	str r0, [sp, #8]
	lsl r2, r2, #2
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r2, r4, r2
	mov r3, #0x26
	bl LoadRectToBgTilemapRect
	b _021E73BA
_021E7388:
	mov r0, #0x34
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r2, #0xd7
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r2, r4, r2
	mov r3, #0x22
	bl LoadRectToBgTilemapRect
	mov r0, #0x34
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r2, #0xd5
	str r0, [sp, #8]
	lsl r2, r2, #2
	ldr r0, [r4, #0xc]
	mov r1, #2
	add r2, r4, r2
	mov r3, #0x26
	bl LoadRectToBgTilemapRect
_021E73BA:
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E73C8: .word 0x0000025D
	thumb_func_end ov86_021E7344

	thumb_func_start ov86_021E73CC
ov86_021E73CC: ; 0x021E73CC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E73E6
	bl sub_02019BDC
	mov r0, #0x95
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_021E73E6:
	pop {r4, pc}
	thumb_func_end ov86_021E73CC

	thumb_func_start ov86_021E73E8
ov86_021E73E8: ; 0x021E73E8
	bx lr
	.balign 4, 0
	thumb_func_end ov86_021E73E8

	thumb_func_start ov86_021E73EC
ov86_021E73EC: ; 0x021E73EC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl GetDexZknDataNarcID
	mov r1, #1
	str r1, [sp]
	add r1, sp, #8
	add r5, #0x12
	str r1, [sp, #4]
	add r1, r5, #0
	mov r2, #0
	mov r3, #0x79
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	ldr r1, [sp, #8]
	lsr r1, r1, #1
	str r1, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov86_021E73EC

	thumb_func_start ov86_021E7418
ov86_021E7418: ; 0x021E7418
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0x89
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	mov r1, #0xb
	add r2, sp, #0x10
	bl sub_020312C4
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _021E74C2
	mov r0, #0
	str r0, [sp, #4]
_021E7438:
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	bl ov86_021E73EC
	add r7, r0, #0
	ldr r0, [sp, #4]
	lsl r1, r0, #3
	ldr r0, [sp]
	add r5, r0, r1
	ldr r1, [sp, #0xc]
	mov r0, #0x79
	lsl r1, r1, #1
	bl AllocFromHeap
	mov r1, #0x26
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [sp, #0xc]
	mov r4, #0
	cmp r0, #0
	bls _021E74AE
_021E7462:
	ldr r0, [sp]
	lsl r6, r4, #1
	ldrb r0, [r0, #6]
	bl sub_0205C144
	add r2, r0, #0
	mov r0, #0x89
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldrh r3, [r7, r6]
	ldr r1, [sp, #8]
	bl sub_020312E0
	cmp r0, #0
	beq _021E74A2
	mov r2, #0x99
	mov r0, #0x26
	lsl r2, r2, #2
	lsl r0, r0, #4
	ldr r2, [r5, r2]
	ldrh r1, [r7, r6]
	ldr r0, [r5, r0]
	lsl r2, r2, #1
	strh r1, [r0, r2]
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r0, #1
	mov r0, #0x99
	lsl r0, r0, #2
	str r1, [r5, r0]
_021E74A2:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blo _021E7462
_021E74AE:
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	cmp r0, #0x1a
	blo _021E7438
_021E74C2:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021E74CC
	bl FreeToHeap
_021E74CC:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov86_021E7418

	thumb_func_start ov86_021E74D0
ov86_021E74D0: ; 0x021E74D0
	push {r4, r5, r6, lr}
	mov r6, #0x26
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_021E74DA:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _021E74E4
	bl FreeToHeap
_021E74E4:
	add r4, r4, #1
	add r5, #8
	cmp r4, #0x1a
	blo _021E74DA
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov86_021E74D0

	thumb_func_start ov86_021E74F0
ov86_021E74F0: ; 0x021E74F0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x79
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	ldr r2, _021E7528 ; =0x000003E2
	mov r1, #4
	mov r3, #0xe
	bl LoadUserFrameGfx2
	mov r1, #0x1a
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #0x79
	bl LoadFontPal1
	add sp, #8
	pop {r4, pc}
	nop
_021E7528: .word 0x000003E2
	thumb_func_end ov86_021E74F0

	thumb_func_start ov86_021E752C
ov86_021E752C: ; 0x021E752C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r2, _021E7574 ; =0x000003E2
	add r0, r4, r0
	mov r1, #1
	mov r3, #0xe
	bl DrawFrameAndWindow2
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021E7578 ; =0x0001020F
	mov r1, #0x17
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x2a
	str r3, [sp, #0xc]
	bl ov86_021E6024
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E7574: .word 0x000003E2
_021E7578: .word 0x0001020F
	thumb_func_end ov86_021E752C

	thumb_func_start ov86_021E757C
ov86_021E757C: ; 0x021E757C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, [r4, #0xc]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov86_021E757C

	thumb_func_start ov86_021E7598
ov86_021E7598: ; 0x021E7598
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	mov r4, #0
_021E75A0:
	ldr r0, _021E75E4 ; =ov86_021E81DC
	mov r1, #7
	ldrb r6, [r0, r4]
	add r0, r6, #0
	bl _s32_div_f
	add r5, r1, #0
	add r0, r6, #0
	mov r1, #7
	bl _s32_div_f
	lsl r0, r0, #5
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021E75E8 ; =0x000F0100
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #2
	lsl r3, r5, #5
	str r0, [sp, #0xc]
	add r0, r7, #0
	mov r1, #4
	add r2, #0x38
	add r3, #0x18
	bl ov86_021E6024
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x1a
	blo _021E75A0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E75E4: .word ov86_021E81DC
_021E75E8: .word 0x000F0100
	thumb_func_end ov86_021E7598

	thumb_func_start ov86_021E75EC
ov86_021E75EC: ; 0x021E75EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	add r0, r5, #0
	mov r1, #1
	bl ov86_021E707C
	cmp r4, #0x1a
	bne _021E7624
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
_021E7624:
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
	thumb_func_end ov86_021E75EC

	thumb_func_start ov86_021E7630
ov86_021E7630: ; 0x021E7630
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x96
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	ldr r1, _021E766C ; =ov86_021E8104
	ldr r2, _021E7670 ; =ov86_021E7EB8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x79
	str r0, [sp, #8]
	ldr r0, _021E7674 ; =ov86_021E8094
	add r3, r4, #0
	bl sub_02019BA4
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r1, r1, #4
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov86_021E75EC
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E766C: .word ov86_021E8104
_021E7670: .word ov86_021E7EB8
_021E7674: .word ov86_021E8094
	thumb_func_end ov86_021E7630

	thumb_func_start ov86_021E7678
ov86_021E7678: ; 0x021E7678
	ldr r3, _021E767C ; =ov86_021E75EC
	bx r3
	.balign 4, 0
_021E767C: .word ov86_021E75EC
	thumb_func_end ov86_021E7678

	thumb_func_start ov86_021E7680
ov86_021E7680: ; 0x021E7680
	ldr r3, _021E7684 ; =ov86_021E75EC
	bx r3
	.balign 4, 0
_021E7684: .word ov86_021E75EC
	thumb_func_end ov86_021E7680

	thumb_func_start ov86_021E7688
ov86_021E7688: ; 0x021E7688
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x93
	add r5, r0, #0
	lsl r1, r1, #2
	ldrb r2, [r5, r1]
	mov r0, #1
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r5, r1]
	ldrb r2, [r5, r1]
	mov r0, #0xfe
	bic r2, r0
	mov r0, #4
	orr r0, r2
	strb r0, [r5, r1]
	add r0, r1, #1
	ldrb r2, [r5, r0]
	mov r0, #0xf
	bic r2, r0
	mov r0, #2
	orr r2, r0
	add r0, r1, #1
	strb r2, [r5, r0]
	ldrb r2, [r5, r0]
	mov r0, #0xf0
	bic r2, r0
	add r0, r1, #1
	strb r2, [r5, r0]
	ldr r0, _021E7708 ; =ov86_021E81DC
	mov r1, #7
	ldrb r4, [r0, r4]
	add r0, r4, #0
	bl _u32_div_f
	lsl r0, r1, #5
	add r0, #0x18
	lsr r1, r0, #3
	mov r0, #0x25
	lsl r0, r0, #4
	strb r1, [r5, r0]
	add r0, r4, #0
	mov r1, #7
	bl _u32_div_f
	lsl r0, r0, #5
	add r0, #0x28
	lsr r1, r0, #3
	ldr r0, _021E770C ; =0x00000251
	add r1, #0x20
	strb r1, [r5, r0]
	mov r2, #2
	add r1, r0, #1
	strb r2, [r5, r1]
	add r1, r0, #2
	strb r2, [r5, r1]
	sub r1, r0, #3
	mov r2, #0
	strb r2, [r5, r1]
	sub r0, r0, #2
	strb r2, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021E7708: .word ov86_021E81DC
_021E770C: .word 0x00000251
	thumb_func_end ov86_021E7688

	thumb_func_start ov86_021E7710
ov86_021E7710: ; 0x021E7710
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02019BE4
	add r5, r0, #0
	cmp r5, #0x1a
	bhi _021E7728
	beq _021E7742
	b _021E7764
_021E7728:
	add r0, r5, #4
	cmp r0, #3
	bhi _021E7764
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E773A: ; jump table
	.short _021E77AA - _021E773A - 2 ; case 0
	.short _021E775C - _021E773A - 2 ; case 1
	.short _021E7742 - _021E773A - 2 ; case 2
	.short _021E77AA - _021E773A - 2 ; case 3
_021E7742:
	ldr r0, _021E77B0 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	bl ov86_021E71C0
	add r0, r4, #0
	bl ov86_021E723C
	mov r0, #0xa
	strb r0, [r4, #5]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021E775C:
	ldr r0, _021E77B4 ; =0x000005DC
	bl PlaySE
	b _021E77AA
_021E7764:
	mov r0, #0x99
	lsl r0, r0, #2
	add r6, r4, r0
	lsl r7, r5, #3
	ldr r0, [r6, r7]
	cmp r0, #0
	bne _021E777A
	ldr r0, _021E77B8 ; =0x000005F2
	bl PlaySE
	b _021E77AA
_021E777A:
	ldr r0, _021E77B0 ; =0x000005DD
	bl PlaySE
	mov r1, #0x96
	lsl r1, r1, #2
	strh r5, [r4, r1]
	mov r2, #0
	add r0, r1, #2
	strh r2, [r4, r0]
	add r0, r1, #4
	strb r2, [r4, r0]
	ldr r0, [r6, r7]
	sub r0, r0, #1
	lsr r2, r0, #3
	add r0, r1, #5
	strb r2, [r4, r0]
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov86_021E7688
	mov r0, #4
	strb r0, [r4, #5]
	mov r0, #9
	pop {r3, r4, r5, r6, r7, pc}
_021E77AA:
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E77B0: .word 0x000005DD
_021E77B4: .word 0x000005DC
_021E77B8: .word 0x000005F2
	thumb_func_end ov86_021E7710

	thumb_func_start ov86_021E77BC
ov86_021E77BC: ; 0x021E77BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
	mov r7, #1
_021E77C8:
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E77FA
	add r0, r5, #0
	add r1, r6, #0
	bl ov86_021E7688
	ldr r0, _021E7810 ; =0x00000252
	mov r2, #0x25
	ldrb r0, [r5, r0]
	ldr r3, _021E7814 ; =0x00000251
	lsl r2, r2, #4
	str r0, [sp]
	ldr r0, _021E7818 ; =0x00000253
	mov r1, #2
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldrb r2, [r5, r2]
	ldrb r3, [r5, r3]
	ldr r0, [r5, #0xc]
	bl BgTilemapRectChangePalette
_021E77FA:
	add r6, r6, #1
	add r4, #8
	cmp r6, #0x1a
	blo _021E77C8
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E7810: .word 0x00000252
_021E7814: .word 0x00000251
_021E7818: .word 0x00000253
	thumb_func_end ov86_021E77BC

	thumb_func_start ov86_021E781C
ov86_021E781C: ; 0x021E781C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	add r0, r5, #0
	mov r1, #1
	bl ov86_021E707C
	cmp r4, #8
	bne _021E7854
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
_021E7854:
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	bl ov86_021E705C
	pop {r3, r4, r5, pc}
	thumb_func_end ov86_021E781C

	thumb_func_start ov86_021E7860
ov86_021E7860: ; 0x021E7860
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _021E7898 ; =0x0000025A
	ldr r1, _021E789C ; =ov86_021E7FE4
	ldrh r4, [r5, r0]
	mov r0, #1
	ldr r2, _021E78A0 ; =ov86_021E7EA8
	str r0, [sp]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x79
	str r0, [sp, #8]
	ldr r0, _021E78A4 ; =ov86_021E7F94
	add r3, r5, #0
	bl sub_02019BA4
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	add r1, r4, #0
	bl ov86_021E781C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E7898: .word 0x0000025A
_021E789C: .word ov86_021E7FE4
_021E78A0: .word ov86_021E7EA8
_021E78A4: .word ov86_021E7F94
	thumb_func_end ov86_021E7860

	thumb_func_start ov86_021E78A8
ov86_021E78A8: ; 0x021E78A8
	ldr r3, _021E78AC ; =ov86_021E781C
	bx r3
	.balign 4, 0
_021E78AC: .word ov86_021E781C
	thumb_func_end ov86_021E78A8

	thumb_func_start ov86_021E78B0
ov86_021E78B0: ; 0x021E78B0
	ldr r3, _021E78B4 ; =ov86_021E781C
	bx r3
	.balign 4, 0
_021E78B4: .word ov86_021E781C
	thumb_func_end ov86_021E78B0

	thumb_func_start ov86_021E78B8
ov86_021E78B8: ; 0x021E78B8
	push {r3, r4, r5, r6}
	mov r2, #0x93
	lsl r2, r2, #2
	ldrb r4, [r0, r2]
	mov r3, #1
	bic r4, r3
	mov r3, #1
	orr r4, r3
	strb r4, [r0, r2]
	ldrb r5, [r0, r2]
	mov r4, #0xfe
	bic r5, r4
	mov r4, #4
	orr r4, r5
	strb r4, [r0, r2]
	add r4, r2, #1
	ldrb r5, [r0, r4]
	mov r4, #0xf
	bic r5, r4
	add r6, r5, #0
	mov r4, #2
	orr r6, r4
	add r5, r2, #1
	strb r6, [r0, r5]
	ldrb r6, [r0, r5]
	mov r5, #0xf0
	bic r6, r5
	add r5, r2, #1
	strb r6, [r0, r5]
	ldr r5, _021E7928 ; =ov86_021E81DC
	ldrb r1, [r5, r1]
	add r5, r1, #0
	and r5, r3
	mov r3, #0xd
	add r6, r5, #0
	mul r6, r3
	add r6, #0x26
	add r3, r2, #4
	lsr r1, r1, #1
	strb r6, [r0, r3]
	lsl r3, r1, #2
	add r3, #0x25
	add r1, r2, #5
	strb r3, [r0, r1]
	mov r3, #9
	add r1, r2, #6
	strb r3, [r0, r1]
	add r1, r2, #7
	strb r4, [r0, r1]
	mov r3, #0
	add r1, r2, #2
	strb r3, [r0, r1]
	add r1, r2, #3
	strb r3, [r0, r1]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_021E7928: .word ov86_021E81DC
	thumb_func_end ov86_021E78B8

	thumb_func_start ov86_021E792C
ov86_021E792C: ; 0x021E792C
	push {r3, r4, r5, r6}
	mov r4, #0x93
	lsl r4, r4, #2
	ldrb r5, [r0, r4]
	mov r3, #1
	bic r5, r3
	mov r3, #1
	orr r3, r5
	strb r3, [r0, r4]
	ldrb r5, [r0, r4]
	mov r3, #0xfe
	bic r5, r3
	mov r3, #4
	orr r5, r3
	strb r5, [r0, r4]
	add r5, r4, #1
	ldrb r6, [r0, r5]
	mov r5, #0xf
	bic r6, r5
	mov r5, #2
	orr r6, r5
	add r5, r4, #1
	strb r6, [r0, r5]
	ldrb r6, [r0, r5]
	mov r5, #0xf0
	bic r6, r5
	add r5, r4, #1
	strb r6, [r0, r5]
	add r5, r4, #4
	strb r1, [r0, r5]
	add r1, r4, #5
	strb r2, [r0, r1]
	add r1, r4, #6
	strb r3, [r0, r1]
	add r1, r4, #7
	strb r3, [r0, r1]
	mov r2, #0
	add r1, r4, #2
	strb r2, [r0, r1]
	add r1, r4, #3
	strb r2, [r0, r1]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov86_021E792C

	thumb_func_start ov86_021E7984
ov86_021E7984: ; 0x021E7984
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02019BE4
	add r5, r0, #0
	cmp r5, #8
	bhi _021E799C
	beq _021E79B6
	b _021E7A76
_021E799C:
	add r0, r5, #4
	cmp r0, #3
	bhi _021E7A76
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E79AE: ; jump table
	.short _021E7AB4 - _021E79AE - 2 ; case 0
	.short _021E79CA - _021E79AE - 2 ; case 1
	.short _021E79B6 - _021E79AE - 2 ; case 2
	.short _021E79D2 - _021E79AE - 2 ; case 3
_021E79B6:
	ldr r0, _021E7B3C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	bl ov86_021E71C0
	mov r0, #2
	strb r0, [r4, #5]
	mov r0, #9
	pop {r3, r4, r5, pc}
_021E79CA:
	ldr r0, _021E7B40 ; =0x000005DC
	bl PlaySE
	b _021E7AB4
_021E79D2:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02019F74
	cmp r0, #7
	bhi _021E7AB4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E79EC: ; jump table
	.short _021E79FC - _021E79EC - 2 ; case 0
	.short _021E7A38 - _021E79EC - 2 ; case 1
	.short _021E79FC - _021E79EC - 2 ; case 2
	.short _021E7A38 - _021E79EC - 2 ; case 3
	.short _021E79FC - _021E79EC - 2 ; case 4
	.short _021E7A38 - _021E79EC - 2 ; case 5
	.short _021E79FC - _021E79EC - 2 ; case 6
	.short _021E7A38 - _021E79EC - 2 ; case 7
_021E79FC:
	ldr r0, _021E7B44 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x20
	tst r0, r1
	beq _021E7AB4
	ldr r1, _021E7B48 ; =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7AB4
	sub r0, r1, #1
	ldrsb r0, [r4, r0]
	sub r2, r0, #1
	sub r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _021E7A24
	ldrsb r2, [r4, r1]
	sub r0, r1, #1
	strb r2, [r4, r0]
_021E7A24:
	ldr r0, _021E7B40 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov86_021E7B68
	add r0, r4, #0
	bl ov86_021E7CF8
	b _021E7AB4
_021E7A38:
	ldr r0, _021E7B44 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x10
	tst r0, r1
	beq _021E7AB4
	ldr r1, _021E7B48 ; =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7AB4
	sub r0, r1, #1
	ldrsb r0, [r4, r0]
	add r2, r0, #1
	sub r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r2, [r4, r0]
	ldrsb r0, [r4, r1]
	cmp r2, r0
	ble _021E7A62
	mov r2, #0
	sub r0, r1, #1
	strb r2, [r4, r0]
_021E7A62:
	ldr r0, _021E7B40 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov86_021E7B68
	add r0, r4, #0
	bl ov86_021E7CF8
	b _021E7AB4
_021E7A76:
	mov r1, #0x97
	lsl r1, r1, #2
	sub r2, r1, #4
	ldrh r2, [r4, r2]
	ldrsb r0, [r4, r1]
	lsl r2, r2, #3
	add r3, r4, r2
	add r2, r1, #0
	add r2, #8
	lsl r0, r0, #3
	ldr r2, [r3, r2]
	add r0, r5, r0
	cmp r0, r2
	blo _021E7A9A
	ldr r0, _021E7B4C ; =0x000005F2
	bl PlaySE
	b _021E7AB4
_021E7A9A:
	sub r0, r1, #2
	strh r5, [r4, r0]
	ldr r0, _021E7B3C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	add r1, r5, #0
	bl ov86_021E78B8
	mov r0, #7
	strb r0, [r4, #5]
	mov r0, #9
	pop {r3, r4, r5, pc}
_021E7AB4:
	ldr r0, _021E7B50 ; =ov86_021E7E9C
	bl sub_02025224
	cmp r0, #0
	beq _021E7AC4
	cmp r0, #1
	beq _021E7AFC
	b _021E7B36
_021E7AC4:
	ldr r1, _021E7B48 ; =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7B36
	sub r0, r1, #1
	ldrsb r0, [r4, r0]
	sub r2, r0, #1
	sub r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _021E7AE2
	ldrsb r2, [r4, r1]
	sub r0, r1, #1
	strb r2, [r4, r0]
_021E7AE2:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x22
	mov r2, #0x34
	bl ov86_021E792C
	mov r0, #6
	strb r0, [r4, #5]
	mov r0, #9
	pop {r3, r4, r5, pc}
_021E7AFC:
	ldr r1, _021E7B48 ; =0x0000025D
	ldrsb r0, [r4, r1]
	cmp r0, #0
	beq _021E7B36
	sub r0, r1, #1
	ldrsb r0, [r4, r0]
	add r2, r0, #1
	sub r0, r1, #1
	strb r2, [r4, r0]
	ldrsb r2, [r4, r0]
	ldrsb r0, [r4, r1]
	cmp r2, r0
	ble _021E7B1C
	mov r2, #0
	sub r0, r1, #1
	strb r2, [r4, r0]
_021E7B1C:
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x26
	mov r2, #0x34
	bl ov86_021E792C
	mov r0, #6
	strb r0, [r4, #5]
	mov r0, #9
	pop {r3, r4, r5, pc}
_021E7B36:
	mov r0, #5
	pop {r3, r4, r5, pc}
	nop
_021E7B3C: .word 0x000005DD
_021E7B40: .word 0x000005DC
_021E7B44: .word gSystem
_021E7B48: .word 0x0000025D
_021E7B4C: .word 0x000005F2
_021E7B50: .word ov86_021E7E9C
	thumb_func_end ov86_021E7984

	thumb_func_start ov86_021E7B54
ov86_021E7B54: ; 0x021E7B54
	push {r4, lr}
	add r4, r0, #0
	bl ov86_021E7B68
	add r0, r4, #0
	bl ov86_021E7CF8
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov86_021E7B54

	thumb_func_start ov86_021E7B68
ov86_021E7B68: ; 0x021E7B68
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	ldr r0, _021E7C5C ; =0x0000025E
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _021E7B7C
	mov r0, #5
	str r0, [sp, #0x10]
	b _021E7B80
_021E7B7C:
	mov r0, #0xd
	str r0, [sp, #0x10]
_021E7B80:
	mov r0, #0x97
	lsl r0, r0, #2
	ldrsb r0, [r4, r0]
	add r7, r4, #0
	mov r6, #0
	lsl r0, r0, #0x13
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	lsl r0, r0, #1
	str r0, [sp, #0x14]
	add r7, #0x10
_021E7B96:
	ldr r0, [sp, #0x10]
	mov r1, #0
	add r0, r0, r6
	lsl r0, r0, #4
	str r0, [sp, #0x20]
	add r0, r7, r0
	bl FillWindowPixelBuffer
	mov r0, #0x96
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	lsl r0, r0, #3
	add r1, r4, r0
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	ldr r0, [sp, #0x18]
	add r0, r0, r6
	cmp r2, r0
	bls _021E7C06
	mov r2, #0x26
	lsl r2, r2, #4
	ldr r3, [r1, r2]
	ldr r1, [sp, #0x14]
	lsl r2, r6, #1
	add r1, r1, r3
	ldrh r1, [r2, r1]
	add r0, r4, #0
	bl ov86_021E668C
	ldr r0, [sp, #0x20]
	add r0, r7, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7C60 ; =0x000F0100
	lsl r5, r3, #3
	ldr r1, [sp, #0x10]
	lsr r3, r5, #0x1f
	str r0, [sp, #8]
	mov r0, #2
	add r3, r5, r3
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r1, r6
	mov r2, #0x13
	asr r3, r3, #1
	bl ov86_021E6064
	mov r0, #0
	str r0, [sp, #0x1c]
	b _021E7C0A
_021E7C06:
	mov r0, #1
	str r0, [sp, #0x1c]
_021E7C0A:
	ldr r0, [sp, #0x20]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r1, r6, #0
	bl ov86_021E78B8
	ldr r0, _021E7C64 ; =0x00000252
	mov r2, #0x25
	ldrb r0, [r4, r0]
	ldr r3, _021E7C68 ; =0x00000251
	lsl r2, r2, #4
	str r0, [sp]
	ldr r0, _021E7C6C ; =0x00000253
	mov r1, #2
	ldrb r0, [r4, r0]
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #8]
	ldrb r2, [r4, r2]
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0xc]
	bl BgTilemapRectChangePalette
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #8
	blo _021E7B96
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, _021E7C5C ; =0x0000025E
	mov r0, #1
	ldrh r2, [r4, r1]
	eor r0, r2
	strh r0, [r4, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7C5C: .word 0x0000025E
_021E7C60: .word 0x000F0100
_021E7C64: .word 0x00000252
_021E7C68: .word 0x00000251
_021E7C6C: .word 0x00000253
	thumb_func_end ov86_021E7B68

	thumb_func_start ov86_021E7C70
ov86_021E7C70: ; 0x021E7C70
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #5
	add r5, #0x60
_021E7C7A:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xd
	bls _021E7C7A
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r6, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r6, r0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov86_021E7C70

	thumb_func_start ov86_021E7CA0
ov86_021E7CA0: ; 0x021E7CA0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	bl GetWindowWidth
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7CF4 ; =0x000F0100
	mov r2, #0x96
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	lsl r2, r2, #2
	ldrh r2, [r4, r2]
	lsl r5, r3, #3
	lsr r3, r5, #0x1f
	add r3, r5, r3
	add r0, r4, #0
	mov r1, #0x15
	add r2, #0x38
	asr r3, r3, #1
	bl ov86_021E6024
	mov r0, #0x16
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7CF4: .word 0x000F0100
	thumb_func_end ov86_021E7CA0

	thumb_func_start ov86_021E7CF8
ov86_021E7CF8: ; 0x021E7CF8
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x97
	lsl r2, r2, #2
	ldrsb r2, [r4, r2]
	add r0, r4, #0
	mov r1, #0
	add r2, r2, #1
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E7D84 ; =0x00010200
	mov r1, #0x16
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x28
	mov r3, #8
	bl ov86_021E6064
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E7D84 ; =0x00010200
	mov r1, #0x16
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x29
	mov r3, #0x10
	bl ov86_021E6024
	ldr r2, _021E7D88 ; =0x0000025D
	add r0, r4, #0
	ldrsb r2, [r4, r2]
	mov r1, #0
	add r2, r2, #1
	bl ov86_021E5FBC
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021E7D84 ; =0x00010200
	mov r1, #0x16
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r2, #0x28
	mov r3, #0x20
	bl ov86_021E6064
	mov r0, #0x17
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E7D84: .word 0x00010200
_021E7D88: .word 0x0000025D
	thumb_func_end ov86_021E7CF8

	thumb_func_start ov86_021E7D8C
ov86_021E7D8C: ; 0x021E7D8C
	push {r4, lr}
	mov r1, #1
	mov r2, #0xe0
	mov r3, #0xb0
	add r4, r0, #0
	bl ov86_021E707C
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov86_021E705C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov86_021E7D8C

	thumb_func_start ov86_021E7DA8
ov86_021E7DA8: ; 0x021E7DA8
	mov r2, #0x96
	lsl r2, r2, #2
	ldrh r1, [r0, r2]
	lsl r1, r1, #3
	add r3, r0, r1
	add r1, r2, #0
	add r1, #8
	ldr r1, [r3, r1]
	add r3, r2, #2
	add r2, r2, #4
	ldrsb r2, [r0, r2]
	ldrh r3, [r0, r3]
	lsl r2, r2, #3
	add r2, r3, r2
	lsl r2, r2, #1
	ldrh r1, [r1, r2]
	ldr r3, _021E7DD0 ; =ov86_021E64E0
	strh r1, [r0, #8]
	bx r3
	nop
_021E7DD0: .word ov86_021E64E0
	thumb_func_end ov86_021E7DA8

	thumb_func_start ov86_021E7DD4
ov86_021E7DD4: ; 0x021E7DD4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x10
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x20
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	add r0, #0x30
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, #0x40
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	thumb_func_end ov86_021E7DD4

	thumb_func_start ov86_021E7DF8
ov86_021E7DF8: ; 0x021E7DF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r5, r1, #0
	ldr r0, _021E7E38 ; =ov86_021E8230
	lsl r1, r2, #3
	ldr r0, [r0, r1]
	mov r4, #0
	str r0, [sp, #4]
	ldr r0, _021E7E3C ; =ov86_021E8230 + 4
	ldr r7, [r0, r1]
	cmp r7, #0
	bls _021E7E34
_021E7E12:
	ldr r2, [sp, #4]
	lsl r6, r4, #4
	lsl r3, r4, #3
	ldr r0, [sp]
	add r1, r5, r6
	add r2, r2, r3
	bl AddWindow
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r7
	blo _021E7E12
_021E7E34:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7E38: .word ov86_021E8230
_021E7E3C: .word ov86_021E8230 + 4
	thumb_func_end ov86_021E7DF8

	thumb_func_start ov86_021E7E40
ov86_021E7E40: ; 0x021E7E40
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _021E7E64 ; =ov86_021E8230 + 4
	lsl r1, r1, #3
	ldr r5, [r0, r1]
	mov r4, #0
	cmp r5, #0
	bls _021E7E62
_021E7E50:
	lsl r0, r4, #4
	add r0, r6, r0
	bl RemoveWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r5
	blo _021E7E50
_021E7E62:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E7E64: .word ov86_021E8230 + 4
	thumb_func_end ov86_021E7E40

	thumb_func_start ov86_021E7E68
ov86_021E7E68: ; 0x021E7E68
	push {lr}
	sub sp, #0x14
	mov r2, #0x15
	str r2, [sp]
	mov r2, #6
	str r2, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r2, #0xd
	str r2, [sp, #0xc]
	mov r2, #0xfd
	lsl r2, r2, #2
	str r2, [sp, #0x10]
	mov r2, #0
	mov r3, #0x19
	bl AddWindowParameterized
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end ov86_021E7E68

	thumb_func_start ov86_021E7E90
ov86_021E7E90: ; 0x021E7E90
	ldr r3, _021E7E94 ; =RemoveWindow
	bx r3
	.balign 4, 0
_021E7E94: .word RemoveWindow
	thumb_func_end ov86_021E7E90

	.rodata

_021E7E98:
	.byte 0xA4, 0xBB, 0xC1, 0xFE

ov86_021E7E9C: ; 0x021E7E9C
	.byte 0xA2, 0xBD, 0x12, 0x2D
	.byte 0xA2, 0xBD, 0x32, 0x4D, 0xFF, 0x00, 0x00, 0x00

ov86_021E7EA8: ; 0x021E7EA8
	.word ov86_021E73E8
	.word ov86_021E73E8
	.word ov86_021E78A8
	.word ov86_021E78B0

ov86_021E7EB8: ; 0x021E7EB8
	.word ov86_021E73E8
	.word ov86_021E73E8
	.word ov86_021E7678
	.word ov86_021E7680

ov86_021E7EC8: ; 0x021E7EC8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov86_021E7ED8: ; 0x021E7ED8
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov86_021E7EEC: ; 0x021E7EEC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov86_021E7F04: ; 0x021E7F04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov86_021E7F20: ; 0x021E7F20
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x1B, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov86_021E7F3C: ; 0x021E7F3C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov86_021E7F58: ; 0x021E7F58
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov86_021E7F74: ; 0x021E7F74
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00

ov86_021E7F94: ; 0x021E7F94
	.byte 0x20, 0x3F, 0x28, 0x7F, 0x20, 0x3F, 0x90, 0xE7, 0x40, 0x5F, 0x28, 0x7F
	.byte 0x40, 0x5F, 0x90, 0xE7, 0x60, 0x7F, 0x28, 0x7F, 0x60, 0x7F, 0x90, 0xE7, 0x80, 0x9F, 0x28, 0x7F
	.byte 0x80, 0x9F, 0x90, 0xE7, 0xA4, 0xBB, 0xC1, 0xFE, 0xFF, 0x00, 0x00, 0x00

ov86_021E7FBC: ; 0x021E7FBC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov86_021E7FE4: ; 0x021E7FE4
	.byte 0x54, 0x30, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0xBC, 0x30, 0x00, 0x00
	.byte 0x01, 0x03, 0x00, 0x01, 0x54, 0x50, 0x00, 0x00, 0x00, 0x04, 0x02, 0x03, 0xBC, 0x50, 0x00, 0x00
	.byte 0x01, 0x05, 0x02, 0x03, 0x54, 0x70, 0x00, 0x00, 0x02, 0x06, 0x04, 0x05, 0xBC, 0x70, 0x00, 0x00
	.byte 0x03, 0x07, 0x04, 0x05, 0x54, 0x90, 0x00, 0x00, 0x04, 0x08, 0x06, 0x07, 0xBC, 0x90, 0x00, 0x00
	.byte 0x05, 0x08, 0x06, 0x07, 0xE0, 0xB0, 0x00, 0x00, 0x87, 0x08, 0x08, 0x08

ov86_021E802C: ; 0x021E802C
	.byte 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00, 0xCC, 0xD8, 0x00, 0x00
	.byte 0xCC, 0xD8, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov86_021E8094: ; 0x021E8094
	.byte 0x28, 0x37, 0x18, 0x27, 0x28, 0x37, 0x38, 0x47, 0x28, 0x37, 0x58, 0x67
	.byte 0x28, 0x37, 0x78, 0x87, 0x28, 0x37, 0x98, 0xA7, 0x28, 0x37, 0xB8, 0xC7, 0x28, 0x37, 0xD8, 0xE7
	.byte 0x48, 0x57, 0x18, 0x27, 0x48, 0x57, 0x38, 0x47, 0x48, 0x57, 0x58, 0x67, 0x48, 0x57, 0x78, 0x87
	.byte 0x48, 0x57, 0x98, 0xA7, 0x48, 0x57, 0xB8, 0xC7, 0x48, 0x57, 0xD8, 0xE7, 0x68, 0x77, 0x18, 0x27
	.byte 0x68, 0x77, 0x38, 0x47, 0x68, 0x77, 0x58, 0x67, 0x68, 0x77, 0x78, 0x87, 0x68, 0x77, 0x98, 0xA7
	.byte 0x68, 0x77, 0xB8, 0xC7, 0x68, 0x77, 0xD8, 0xE7, 0x88, 0x97, 0x18, 0x27, 0x88, 0x97, 0x38, 0x47
	.byte 0x88, 0x97, 0x58, 0x67, 0x88, 0x97, 0x78, 0x87, 0x88, 0x97, 0x98, 0xA7, 0xA4, 0xBB, 0xC1, 0xFE
	.byte 0xFF, 0x00, 0x00, 0x00

ov86_021E8104: ; 0x021E8104
	.byte 0x20, 0x30, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x40, 0x30, 0x00, 0x00
	.byte 0x01, 0x08, 0x00, 0x02, 0x60, 0x30, 0x00, 0x00, 0x02, 0x09, 0x01, 0x03, 0x80, 0x30, 0x00, 0x00
	.byte 0x03, 0x0A, 0x02, 0x04, 0xA0, 0x30, 0x00, 0x00, 0x04, 0x0B, 0x03, 0x05, 0xC0, 0x30, 0x00, 0x00
	.byte 0x05, 0x0C, 0x04, 0x06, 0xE0, 0x30, 0x00, 0x00, 0x06, 0x0D, 0x05, 0x06, 0x20, 0x50, 0x00, 0x00
	.byte 0x00, 0x0E, 0x07, 0x08, 0x40, 0x50, 0x00, 0x00, 0x01, 0x0F, 0x07, 0x09, 0x60, 0x50, 0x00, 0x00
	.byte 0x02, 0x10, 0x08, 0x0A, 0x80, 0x50, 0x00, 0x00, 0x03, 0x11, 0x09, 0x0B, 0xA0, 0x50, 0x00, 0x00
	.byte 0x04, 0x12, 0x0A, 0x0C, 0xC0, 0x50, 0x00, 0x00, 0x05, 0x13, 0x0B, 0x0D, 0xE0, 0x50, 0x00, 0x00
	.byte 0x06, 0x14, 0x0C, 0x0D, 0x20, 0x70, 0x00, 0x00, 0x07, 0x15, 0x0E, 0x0F, 0x40, 0x70, 0x00, 0x00
	.byte 0x08, 0x16, 0x0E, 0x10, 0x60, 0x70, 0x00, 0x00, 0x09, 0x17, 0x0F, 0x11, 0x80, 0x70, 0x00, 0x00
	.byte 0x0A, 0x18, 0x10, 0x12, 0xA0, 0x70, 0x00, 0x00, 0x0B, 0x19, 0x11, 0x13, 0xC0, 0x70, 0x00, 0x00
	.byte 0x0C, 0x1A, 0x12, 0x14, 0xE0, 0x70, 0x00, 0x00, 0x0D, 0x1A, 0x13, 0x14, 0x20, 0x90, 0x00, 0x00
	.byte 0x0E, 0x1A, 0x15, 0x16, 0x40, 0x90, 0x00, 0x00, 0x0F, 0x1A, 0x15, 0x17, 0x60, 0x90, 0x00, 0x00
	.byte 0x10, 0x1A, 0x16, 0x18, 0x80, 0x90, 0x00, 0x00, 0x11, 0x1A, 0x17, 0x19, 0xA0, 0x90, 0x00, 0x00
	.byte 0x12, 0x1A, 0x18, 0x19, 0xE0, 0xB0, 0x00, 0x00, 0x84, 0x1A, 0x1A, 0x1A

ov86_021E81DC: ; 0x021E81DC
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13
	.byte 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x00, 0x00
ov86_021E81F8:
	.byte 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00
	.byte 0x00, 0x02, 0x07, 0x17, 0x02, 0x0D, 0x39, 0x00, 0x00, 0x02, 0x0A, 0x17, 0x02, 0x0D, 0x67, 0x00

ov86_021E8210:
	.byte 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00, 0x00, 0x10, 0x07, 0x0E, 0x02, 0x0D, 0x39, 0x00
	.byte 0x00, 0x02, 0x0B, 0x1C, 0x02, 0x0D, 0x55, 0x00, 0x00, 0x02, 0x0E, 0x1C, 0x02, 0x0D, 0x8D, 0x00

ov86_021E8230: ; 0x021E8230
	.word ov86_021E8258, 0x00000007
	.word ov86_021E82D8, 0x18
	.word ov86_021E8210, 0x04
	.word ov86_021E81F8, 0x03
	.word ov86_021E8290, 0x09
ov86_021E8258:
	.byte 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00
	.byte 0x00, 0x02, 0x04, 0x1C, 0x02, 0x0D, 0x39, 0x00, 0x00, 0x02, 0x07, 0x1C, 0x02, 0x0D, 0x71, 0x00
	.byte 0x00, 0x02, 0x09, 0x1C, 0x02, 0x0D, 0xA9, 0x00, 0x00, 0x02, 0x0C, 0x1C, 0x02, 0x0D, 0xE1, 0x00
	.byte 0x00, 0x02, 0x0F, 0x1C, 0x02, 0x0D, 0x19, 0x01, 0x00, 0x02, 0x11, 0x1C, 0x02, 0x0D, 0x51, 0x01
ov86_021E8290:
	.byte 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00, 0x00, 0x02, 0x04, 0x10, 0x02, 0x0D, 0x39, 0x00
	.byte 0x00, 0x02, 0x07, 0x17, 0x02, 0x0D, 0x59, 0x00, 0x00, 0x02, 0x0A, 0x17, 0x02, 0x0D, 0x87, 0x00
	.byte 0x00, 0x02, 0x07, 0x17, 0x02, 0x0D, 0x59, 0x00, 0x00, 0x02, 0x09, 0x17, 0x02, 0x0D, 0x87, 0x00
	.byte 0x00, 0x02, 0x0C, 0x10, 0x02, 0x0D, 0xB5, 0x00, 0x00, 0x02, 0x0F, 0x17, 0x02, 0x0D, 0xD5, 0x00
	.byte 0x00, 0x02, 0x11, 0x17, 0x02, 0x0D, 0x03, 0x01
ov86_021E82D8:
	.byte 0x00, 0x02, 0x01, 0x1C, 0x02, 0x0D, 0x01, 0x00
	.byte 0x00, 0x02, 0x07, 0x12, 0x02, 0x0D, 0x39, 0x00, 0x00, 0x02, 0x0A, 0x17, 0x02, 0x0D, 0x5D, 0x00
	.byte 0x00, 0x02, 0x0D, 0x17, 0x02, 0x0D, 0x8B, 0x00, 0x00, 0x01, 0x05, 0x1D, 0x0E, 0x0D, 0xB9, 0x00
	.byte 0x00, 0x06, 0x05, 0x09, 0x02, 0x0D, 0x4F, 0x02, 0x00, 0x13, 0x05, 0x09, 0x02, 0x0D, 0x61, 0x02
	.byte 0x00, 0x06, 0x09, 0x09, 0x02, 0x0D, 0x73, 0x02, 0x00, 0x13, 0x09, 0x09, 0x02, 0x0D, 0x85, 0x02
	.byte 0x00, 0x06, 0x0D, 0x09, 0x02, 0x0D, 0x97, 0x02, 0x00, 0x13, 0x0D, 0x09, 0x02, 0x0D, 0xA9, 0x02
	.byte 0x00, 0x06, 0x11, 0x09, 0x02, 0x0D, 0xBB, 0x02, 0x00, 0x13, 0x11, 0x09, 0x02, 0x0D, 0xCD, 0x02
	.byte 0x00, 0x06, 0x05, 0x09, 0x02, 0x0D, 0xDF, 0x02, 0x00, 0x13, 0x05, 0x09, 0x02, 0x0D, 0xF1, 0x02
	.byte 0x00, 0x06, 0x09, 0x09, 0x02, 0x0D, 0x03, 0x03, 0x00, 0x13, 0x09, 0x09, 0x02, 0x0D, 0x15, 0x03
	.byte 0x00, 0x06, 0x0D, 0x09, 0x02, 0x0D, 0x27, 0x03, 0x00, 0x13, 0x0D, 0x09, 0x02, 0x0D, 0x39, 0x03
	.byte 0x00, 0x06, 0x11, 0x09, 0x02, 0x0D, 0x4B, 0x03, 0x00, 0x13, 0x11, 0x09, 0x02, 0x0D, 0x5D, 0x03
	.byte 0x00, 0x02, 0x02, 0x02, 0x02, 0x0D, 0x6F, 0x03, 0x00, 0x0F, 0x15, 0x04, 0x02, 0x0D, 0x73, 0x03
	.byte 0x04, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0x01, 0x00

	; 0x021E8398
