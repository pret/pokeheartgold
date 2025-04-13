	.include "asm/macros.inc"
	.include "overlay_100.inc"
	.include "global.inc"

	.extern ov100_021E69F8
	.extern ov100_021E6A3C
	.extern ov100_021E6AC0
	.extern ov100_021E6C44
	.extern ov100_021E6F88
	.extern ov100_021E6FBC
	.extern ov100_021E5A88

	.text

	thumb_func_start ov100_021E5B4C
ov100_021E5B4C: ; 0x021E5B4C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov100_021E5A88
	cmp r4, #4
	bne _021E5B62
	mov r2, #0x1a
	b _021E5B6C
_021E5B62:
	mov r0, #6
	mul r0, r4
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
_021E5B6C:
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	mov r1, #6
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	lsl r1, r6, #0x1a
	str r2, [sp, #0xc]
	lsr r1, r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r3, #0x14
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x74]
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0x74]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov100_021E5B4C

	thumb_func_start ov100_021E5BB0
ov100_021E5BB0: ; 0x021E5BB0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0x10
	add r1, sp, #4
	bl GF_RTC_CopyDateTime
	cmp r4, #0
	bne _021E5BD6
	add r0, r5, #0
	add r0, #0x88
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _021E5BD6
	add sp, #0x20
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E5BD6:
	ldr r4, [sp, #4]
	mov r1, #0xa
	add r0, r4, #0
	bl _u32_div_f
	add r1, sp, #0
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r0, sp, #0
	strb r1, [r0, #1]
	ldr r4, [sp, #8]
	mov r1, #0xa
	add r0, r4, #0
	bl _u32_div_f
	add r1, sp, #0
	strb r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r0, sp, #0
	strb r1, [r0, #3]
	mov r4, #0
	add r6, sp, #0
_021E5C0E:
	lsl r0, r4, #2
	add r0, r5, r0
	add r0, #0xac
	ldrb r1, [r6, r4]
	ldr r0, [r0]
	bl UnkImageStruct_SetSpriteAnimCtrlCurrentFrame
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E5C0E
	add r0, r5, #0
	ldr r1, [sp, #0x1c]
	add r0, #0xa8
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl UnkImageStruct_SetSpriteAnimCtrlCurrentFrame
	add r3, sp, #4
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	add r2, #0x80
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0
	strb r0, [r5, #7]
	mov r0, #1
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E5BB0

	thumb_func_start ov100_021E5C50
ov100_021E5C50: ; 0x021E5C50
	cmp r0, #0x15
	bls _021E5C7C
	cmp r0, #0x19
	bne _021E5C60
	cmp r1, #8
	bne _021E5C60
	mov r0, #2
	bx lr
_021E5C60:
	cmp r0, #0x1c
	bne _021E5C68
	cmp r1, #6
	beq _021E5C74
_021E5C68:
	cmp r0, #0x1c
	bne _021E5C78
	cmp r1, #8
	bls _021E5C78
	cmp r1, #0xd
	bhs _021E5C78
_021E5C74:
	mov r0, #1
	bx lr
_021E5C78:
	mov r0, #0
	bx lr
_021E5C7C:
	mov r0, #2
	bx lr
	thumb_func_end ov100_021E5C50

	thumb_func_start ov100_021E5C80
ov100_021E5C80: ; 0x021E5C80
	ldr r2, [r0, #0x20]
	ldr r3, _021E5CA0 ; =ov100_021E5C50
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	asr r0, r1, #4
	lsr r0, r0, #0x1b
	add r0, r1, r0
	asr r1, r2, #4
	lsr r1, r1, #0x1b
	add r1, r2, r1
	lsl r0, r0, #0xb
	lsl r1, r1, #0xb
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bx r3
	nop
_021E5CA0: .word ov100_021E5C50
	thumb_func_end ov100_021E5C80

	thumb_func_start ov100_021E5CA4
ov100_021E5CA4: ; 0x021E5CA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r1, #7
	ldr r3, [r5]
	mov r0, #3
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	mov r1, #6
	ldr r3, [r5]
	mov r0, #7
	lsl r1, r1, #6
	mov r2, #0
	bl BG_LoadBlankPltt
	mov r4, #0
	mov r6, #0x40
	add r7, r4, #0
_021E5CCA:
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #1
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r7, #0
	bl BG_ClearCharDataRange
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #5
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgCommitTilemapBufferToVram
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	cmp r4, #3
	blt _021E5CCA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E5CA4

	thumb_func_start ov100_021E5D3C
ov100_021E5D3C: ; 0x021E5D3C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldrb r2, [r4, #9]
	cmp r2, #0x10
	bls _021E5D4E
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E5D4E:
	cmp r1, #0
	bne _021E5D88
	mov r0, #0x10
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x78]
	add r2, r1, #0
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	ldrb r1, [r4, #9]
	mov r0, #0x10
	mov r2, #0x40
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x78]
	mov r1, #2
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	b _021E5DAC
_021E5D88:
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x78]
	add r2, r1, #0
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	ldrb r0, [r4, #9]
	mov r1, #2
	mov r2, #0x40
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x78]
	mov r3, #0xc0
	bl PaletteData_BlendPalette
_021E5DAC:
	ldrb r0, [r4, #9]
	cmp r0, #0x10
	blo _021E5DBC
	add r0, r0, #2
	strb r0, [r4, #9]
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_021E5DBC:
	add r0, r0, #2
	strb r0, [r4, #9]
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E5D3C

	thumb_func_start ov100_021E5DC8
ov100_021E5DC8: ; 0x021E5DC8
	ldrb r1, [r0, #5]
	ldr r2, _021E5DD8 ; =ov100_021E74B4
	lsl r1, r1, #0x19
	lsr r3, r1, #0x17
	ldrb r1, [r0, #4]
	add r0, r2, r3
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_021E5DD8: .word ov100_021E74B4
	thumb_func_end ov100_021E5DC8

	thumb_func_start ov100_021E5DDC
ov100_021E5DDC: ; 0x021E5DDC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	cmp r1, #3
	bhi _021E5E72
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5DF2: ; jump table
	.short _021E5DFA - _021E5DF2 - 2 ; case 0
	.short _021E5E4A - _021E5DF2 - 2 ; case 1
	.short _021E5E56 - _021E5DF2 - 2 ; case 2
	.short _021E5E62 - _021E5DF2 - 2 ; case 3
_021E5DFA:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GfGfx_DisableEngineAPlanes
	bl GfGfx_DisableEngineBPlanes
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5E7C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5E80 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	bl sub_020210BC
	mov r0, #2
	bl sub_02021148
	b _021E5E72
_021E5E4A:
	bl ov100_021E5FFC
	add r0, r4, #0
	bl ov100_021E60C4
	b _021E5E72
_021E5E56:
	bl ov100_021E616C
	add r0, r4, #0
	bl ov100_021E6374
	b _021E5E72
_021E5E62:
	ldr r0, _021E5E84 ; =ov100_021E65F4
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	str r0, [r4, #0x18]
	mov r0, #1
	pop {r4, pc}
_021E5E72:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021E5E7C: .word 0xFFFFE0FF
_021E5E80: .word 0x04001000
_021E5E84: .word ov100_021E65F4
	thumb_func_end ov100_021E5DDC

	thumb_func_start ov100_021E5E88
ov100_021E5E88: ; 0x021E5E88
	push {r4, lr}
	add r4, r0, #0
	bl sub_02021238
	mov r0, #0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov100_021E63F4
	add r0, r4, #0
	bl ov100_021E6338
	add r0, r4, #0
	bl ov100_021E6134
	add r0, r4, #0
	bl ov100_021E6094
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E5E88

	thumb_func_start ov100_021E5EB4
ov100_021E5EB4: ; 0x021E5EB4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	mov r0, #0x8f
	bl NARC_New
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x30
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	add r2, r6, #0
	mov r3, #0x8f
	bl sub_0208820C
	add r0, r4, #0
	add r0, #0x24
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	add r2, r6, #0
	mov r3, #0x8f
	bl sub_0208820C
	mov r0, #0
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r2, r4, #0
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, #0x1e
	bl PaletteData_LoadFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r2, r4, #0
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, #0x18
	bl PaletteData_LoadFromOpenNarc
	mov r0, #2
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, r4, #0
	bl PaletteData_LoadFromOpenNarc
	mov r0, #3
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	add r1, r6, #0
	add r2, r4, #0
	bl PaletteData_LoadFromOpenNarc
	add r2, r5, #0
	add r2, #0xc4
	add r1, r4, #0
	ldr r2, [r2]
	add r0, r6, #0
	add r1, #0x36
	bl NARC_ReadWholeMember
	add r0, r5, #0
	add r0, #0xc4
	add r1, r5, #0
	ldr r0, [r0]
	add r1, #0xc8
	bl NNS_G2dGetUnpackedScreenData
	ldrb r1, [r5, #4]
	cmp r1, #4
	bne _021E5F9C
	add r0, r5, #0
	mov r1, #2
	mov r2, #1
	bl ov100_021E5B4C
	b _021E5FA4
_021E5F9C:
	add r0, r5, #0
	mov r2, #1
	bl ov100_021E5B4C
_021E5FA4:
	add r4, #0x2a
	str r4, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x74]
	ldr r1, [r5]
	add r2, r6, #0
	mov r3, #0x8f
	bl sub_0208820C
	add r0, r6, #0
	bl NARC_Delete
	ldr r0, [r5, #0x74]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x74]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov100_021E5EB4

	thumb_func_start ov100_021E5FDC
ov100_021E5FDC: ; 0x021E5FDC
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5FF8 ; =ov100_021E7500
	add r3, sp, #0
	mov r2, #5
_021E5FE6:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5FE6
	add r0, sp, #0
	bl GfGfx_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5FF8: .word ov100_021E7500
	thumb_func_end ov100_021E5FDC

	thumb_func_start ov100_021E5FFC
ov100_021E5FFC: ; 0x021E5FFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	bl ov100_021E5FDC
	ldr r0, [r5]
	bl BgConfig_Alloc
	str r0, [r5, #0x74]
	ldr r2, _021E6084 ; =0x04000304
	ldr r0, _021E6088 ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r4, _021E608C ; =ov100_021E74A4
	add r3, sp, #0x38
	and r0, r1
	strh r0, [r2]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021E6090 ; =ov100_021E7588
	add r3, sp, #0
	mov r2, #7
_021E6032:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6032
	mov r7, #0
	add r6, sp, #0
	add r4, r7, #0
_021E6040:
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	lsl r0, r4, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add r7, r7, #1
	add r6, #0x1c
	add r4, r4, #4
	cmp r7, #2
	blt _021E6040
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6084: .word 0x04000304
_021E6088: .word 0xFFFF7FFF
_021E608C: .word ov100_021E74A4
_021E6090: .word ov100_021E7588
	thumb_func_end ov100_021E5FFC

	thumb_func_start ov100_021E6094
ov100_021E6094: ; 0x021E6094
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x74]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x74]
	bl FreeToHeap
	ldr r2, _021E60BC ; =0x04000304
	ldr r0, _021E60C0 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E60BC: .word 0x04000304
_021E60C0: .word 0xFFFF7FFF
	thumb_func_end ov100_021E6094

	thumb_func_start ov100_021E60C4
ov100_021E60C4: ; 0x021E60C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x8f
	bl NARC_New
	add r4, r0, #0
	ldr r0, [r5]
	bl PaletteData_Init
	str r0, [r5, #0x78]
	mov r2, #2
	ldr r3, [r5]
	mov r1, #0
	lsl r2, r2, #8
	bl PaletteData_AllocBuffers
	mov r1, #2
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	lsl r2, r1, #8
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	lsl r2, r1, #9
	bl PaletteData_AllocBuffers
	mov r2, #2
	ldr r0, [r5, #0x78]
	ldr r3, [r5]
	mov r1, #3
	lsl r2, r2, #8
	bl PaletteData_AllocBuffers
	mov r0, #0x8f
	mov r1, #0x36
	bl GetNarcMemberSizeByIdPair
	add r1, r0, #0
	ldr r0, [r5]
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0xc4
	str r0, [r1]
	ldrb r1, [r5, #8]
	add r0, r5, #0
	bl ov100_021E5EB4
	add r0, r4, #0
	bl NARC_Delete
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov100_021E60C4

	thumb_func_start ov100_021E6134
ov100_021E6134: ; 0x021E6134
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [r4, #0x78]
	mov r1, #3
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x78]
	bl PaletteData_Free
	mov r0, #0
	str r0, [r4, #0x78]
	pop {r4, pc}
	thumb_func_end ov100_021E6134

	thumb_func_start ov100_021E616C
ov100_021E616C: ; 0x021E616C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ov100_021E6914
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldrb r3, [r5, #8]
	ldr r0, [r5]
	mov r1, #0xb
	mov r2, #1
	bl ov100_021E69F8
	add r1, r5, #0
	add r1, #0x94
	mov r4, #0
	str r0, [r1]
	add r6, r5, #0
	add r7, r4, #0
_021E6196:
	str r7, [sp]
	lsl r0, r4, #0x18
	str r7, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r4, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0x40
	str r7, [sp, #0x10]
	add r0, #0x94
	ldr r0, [r0]
	add r2, r1, #0
	add r3, r7, #0
	bl ov100_021E6AC0
	add r1, r6, #0
	add r1, #0x98
	add r4, r4, #1
	add r6, r6, #4
	str r0, [r1]
	cmp r4, #4
	blt _021E6196
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0xad
	mov r2, #0x30
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x46
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xac
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x56
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb0
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x6e
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb4
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x7e
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0x62
	mov r2, #0x2e
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xbc
	str r0, [r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r1, #0xc5
	mov r2, #0x30
	bl ov100_021E6AC0
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r5, #0
	mov r1, #1
	bl ov100_021E5BB0
	add r0, r5, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #1
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	ldr r0, [r5, #0x20]
	ldrh r0, [r0, #0x10]
	bl MapHeader_GetField14_1D
	cmp r0, #0
	bne _021E62F4
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #1
	bl UnkImageStruct_SetSpriteAnimCtrlCurrentFrame
_021E62F4:
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_021E62FA:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r7, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r1, #1
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	ble _021E62FA
	mov r4, #4
	add r5, #0x10
	mov r6, #1
_021E6320:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r6, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _021E6320
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E616C

	thumb_func_start ov100_021E6338
ov100_021E6338: ; 0x021E6338
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	add r5, r7, #0
	add r6, r4, #0
_021E6342:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r6, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	bl ov100_021E6C44
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _021E6342
	add r0, r7, #0
	add r0, #0x94
	ldr r0, [r0]
	bl ov100_021E6A3C
	add r0, r7, #0
	bl ov100_021E6950
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6338

	thumb_func_start ov100_021E6374
ov100_021E6374: ; 0x021E6374
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl ov100_021E6F88
	str r0, [r4, #0x7c]
	ldrb r0, [r4, #5]
	ldr r1, _021E63EC ; =_021E7720
	lsl r0, r0, #0x19
	lsr r2, r0, #0x19
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	lsl r3, r2, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	ldr r1, [r1, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	ldr r3, _021E63F0 ; =_021E74A0
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldrb r2, [r3, r2]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x7c]
	bl ov100_021E7014
	ldrb r0, [r4, #4]
	cmp r0, #4
	bne _021E63D8
	ldr r0, [r4, #0x7c]
	mov r1, #0
	mov r2, #2
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
_021E63D8:
	add r0, r4, #0
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl ov100_021E72F8
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_021E63EC: .word _021E7720
_021E63F0: .word _021E74A0
	thumb_func_end ov100_021E6374

	thumb_func_start ov100_021E63F4
ov100_021E63F4: ; 0x021E63F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	bl ov100_021E70A4
	ldr r0, [r4, #0x7c]
	bl ov100_021E6FBC
	pop {r4, pc}
	thumb_func_end ov100_021E63F4

	thumb_func_start ov100_021E6408
ov100_021E6408: ; 0x021E6408
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E6428
	bl OverlayManager_Run
	cmp r0, #0
	beq _021E6428
	ldr r0, [r4]
	bl OverlayManager_Delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E6428:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov100_021E6408

	.rodata

_021E74A0:
	.byte 0x03, 0x04, 0x04, 0x05

ov100_021E74A4: ; 0x021E74A4
	.word 0x00000001
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000

ov100_021E74B4: ; 0x021E74B4
	.byte 0x00, 0xFF, 0xFF, 0x01
	.byte 0x00, 0xFF, 0x01, 0x02
	.byte 0x00, 0x01, 0xFF, 0x02
	.byte 0x00, 0x01, 0x02, 0x03

	.global ov100_021E74C4
ov100_021E74C4: ; 0x021E74C4
	.byte 0xA0, 0xC0, 0x08, 0x38
	.byte 0xA0, 0xC0, 0x38, 0x68
	.byte 0xA0, 0xC0, 0x68, 0x98
	.byte 0xA0, 0xC0, 0x98, 0xC8
	.byte 0xA0, 0xC0, 0xCE, 0xFE
	.byte 0xFF, 0x00, 0x00, 0x00

ov100_021E74DC:
	.byte 0x00, 0x00, 0x02, 0x01
	.byte 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0xB0, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E7500: ; 0x021E7500
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov100_021E7528:
	.byte 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x80, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E7558:
	.byte 0x00, 0x00, 0x03, 0x01, 0xFF, 0xFF, 0x20, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02, 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x03, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x04, 0x00, 0x02, 0x00
	.byte 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

ov100_021E7588: ; 0x021E7588
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov100_021E75C0:
	.byte 0x00, 0x00, 0x04, 0x01, 0xFF, 0xFF, 0x20, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x01, 0x00, 0x00, 0x02
	.byte 0xFF, 0xFF, 0x50, 0xB0, 0xF0, 0x10, 0xF6, 0x0A, 0x02, 0x00, 0x01, 0x03, 0xFF, 0xFF, 0x80, 0xB0
	.byte 0xF0, 0x10, 0xF6, 0x0A, 0x03, 0x00, 0x02, 0x04, 0xFF, 0xFF, 0xB0, 0xB0, 0xF0, 0x10, 0xF6, 0x0A
	.byte 0x04, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0xE6, 0xB0, 0xF0, 0x10, 0xF6, 0x0A

	.data

_021E7720:
	.word ov100_021E74DC
	.word ov100_021E7528
	.word ov100_021E7558
	.word ov100_021E75C0
	; 0x021E7730
