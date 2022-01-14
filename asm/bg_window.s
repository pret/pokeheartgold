	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

sTilemapWidthByBufferSize:
	.byte 0x10, 0x20, 0x20, 0x20, 0x20, 0x20
	.balign 4, 0
sPutWindowTilemapFuncs:
	.word PutWindowTilemap_TextMode
	.word PutWindowTilemap_AffineMode
	.word PutWindowTilemap_TextMode
sClearWindowTilemapAndScheduleTransferFuncs:
	.word ClearWindowTilemapAndScheduleTransfer_TextMode
	.word ClearWindowTilemapAndScheduleTransfer_AffineMode
	.word ClearWindowTilemapAndScheduleTransfer_TextMode
sClearWindowTilemapAndCopyToVramFuncs:
	.word ClearWindowTilemapAndCopyToVram_TextMode
	.word ClearWindowTilemapAndCopyToVram_AffineMode
	.word ClearWindowTilemapAndCopyToVram_TextMode
sScheduleWindowCopyToVramFuncs:
	.word ScheduleWindowCopyToVram_TextMode
	.word ScheduleWindowCopyToVram_AffineMode
	.word ScheduleWindowCopyToVram_TextMode
sCopyWindowToVramFuncs:
	.word CopyWindowToVram_TextMode
	.word CopyWindowToVram_AffineMode
	.word CopyWindowToVram_TextMode
sClearWindowTilemapFuncs:
	.word ClearWindowTilemapText
	.word ClearWindowTilemapAffine
	.word ClearWindowTilemapText

	.text

	thumb_func_start BgConfig_Alloc
BgConfig_Alloc: ; 0x0201AC88
	push {r3, r4, r5, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	add r5, r0, #0
	bl AllocFromHeap
	mov r2, #0x5a
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	str r5, [r4]
	mov r0, #0
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end BgConfig_Alloc

	thumb_func_start BgConfig_GetHeapId
BgConfig_GetHeapId: ; 0x0201ACAC
	ldr r0, [r0]
	bx lr
	thumb_func_end BgConfig_GetHeapId

	thumb_func_start SetBothScreensModesAndDisable
SetBothScreensModesAndDisable: ; 0x0201ACB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	bl GX_SetGraphicsMode
	ldr r0, [r4, #8]
	bl GXS_SetGraphicsMode
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0201ACE4 ; =0xC7FFFFFF
	and r1, r0
	str r1, [r2]
	ldr r1, [r2]
	asr r0, r0, #3
	and r0, r1
	str r0, [r2]
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	pop {r4, pc}
	nop
_0201ACE4: .word 0xC7FFFFFF
	thumb_func_end SetBothScreensModesAndDisable

	thumb_func_start SetScreenModeAndDisable
SetScreenModeAndDisable: ; 0x0201ACE8
	push {r3, lr}
	add r2, r0, #0
	cmp r1, #0
	bne _0201AD00
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r2, [r2, #0xc]
	bl GX_SetGraphicsMode
	bl GX_DisableEngineALayers
	pop {r3, pc}
_0201AD00:
	ldr r0, [r2, #8]
	bl GXS_SetGraphicsMode
	bl GX_DisableEngineBLayers
	pop {r3, pc}
	thumb_func_end SetScreenModeAndDisable

	thumb_func_start InitBgFromTemplateEx
InitBgFromTemplateEx: ; 0x0201AD0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #4]
	str r3, [sp, #8]
	add r4, r2, #0
	str r0, [sp]
	ldrb r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r6, [sp, #0x30]
	bl TranslateGFBgModePairToGXScreenSize
	add r5, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #7
	bls _0201AD2C
	b _0201B14C
_0201AD2C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201AD38: ; jump table
	.short _0201AD48 - _0201AD38 - 2 ; case 0
	.short _0201ADA0 - _0201AD38 - 2 ; case 1
	.short _0201ADF8 - _0201AD38 - 2 ; case 2
	.short _0201AE9A - _0201AD38 - 2 ; case 3
	.short _0201AF3C - _0201AD38 - 2 ; case 4
	.short _0201AF94 - _0201AD38 - 2 ; case 5
	.short _0201AFEC - _0201AD38 - 2 ; case 6
	.short _0201B0AC - _0201AD38 - 2 ; case 7
_0201AD48:
	mov r0, #1
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	ldrb r3, [r4, #0x14]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x11]
	ldrb r2, [r4, #0x13]
	lsl r6, r3, #0xd
	lsl r0, r0, #7
	lsl r3, r2, #2
	str r0, [sp, #0xc]
	ldr r2, _0201B090 ; =0x04000008
	lsl r7, r1, #8
	ldrh r1, [r2]
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r1, r0
	ldr r0, [sp, #0xc]
	orr r0, r1
	orr r0, r7
	orr r0, r3
	orr r0, r6
	strh r0, [r2]
	ldrh r1, [r2]
	mov r0, #3
	bic r1, r0
	ldrb r0, [r4, #0x15]
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0201AD96
	ldrh r1, [r2]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r2]
	b _0201B14C
_0201AD96:
	ldrh r1, [r2]
	mov r0, #0x40
	bic r1, r0
	strh r1, [r2]
	b _0201B14C
_0201ADA0:
	mov r0, #2
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	ldrb r3, [r4, #0x14]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x11]
	ldrb r2, [r4, #0x13]
	lsl r6, r3, #0xd
	lsl r0, r0, #7
	lsl r3, r2, #2
	str r0, [sp, #0x10]
	ldr r2, _0201B094 ; =0x0400000A
	lsl r7, r1, #8
	ldrh r1, [r2]
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r1, r0
	ldr r0, [sp, #0x10]
	orr r0, r1
	orr r0, r7
	orr r0, r3
	orr r0, r6
	strh r0, [r2]
	ldrh r1, [r2]
	mov r0, #3
	bic r1, r0
	ldrb r0, [r4, #0x15]
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0201ADEE
	ldrh r1, [r2]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r2]
	b _0201B14C
_0201ADEE:
	ldrh r1, [r2]
	mov r0, #0x40
	bic r1, r0
	strh r1, [r2]
	b _0201B14C
_0201ADF8:
	mov r0, #4
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0201AE0E
	cmp r0, #1
	beq _0201AE30
	cmp r0, #2
	beq _0201AE52
_0201AE0E:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B098 ; =0x0400000C
	ldrb r2, [r4, #0x13]
	lsl r3, r1, #8
	ldrb r0, [r4, #0x11]
	lsl r6, r2, #2
	ldrh r1, [r7]
	lsl r2, r0, #7
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201AE72
_0201AE30:
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x16]
	lsl r3, r2, #2
	ldr r7, _0201B098 ; =0x0400000C
	lsl r2, r1, #8
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201AE72
_0201AE52:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B098 ; =0x0400000C
	ldrb r0, [r4, #0x16]
	lsl r3, r1, #8
	ldrb r2, [r4, #0x13]
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	lsl r2, r2, #2
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
_0201AE72:
	ldr r0, _0201B098 ; =0x0400000C
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	ldrb r1, [r4, #0x15]
	orr r1, r2
	strh r1, [r0]
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0201AE90
	ldrh r2, [r0]
	mov r1, #0x40
	orr r1, r2
	strh r1, [r0]
	b _0201B14C
_0201AE90:
	ldrh r2, [r0]
	mov r1, #0x40
	bic r2, r1
	strh r2, [r0]
	b _0201B14C
_0201AE9A:
	mov r0, #8
	add r1, r6, #0
	bl GX_EngineAToggleLayers
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0201AEB0
	cmp r0, #1
	beq _0201AED2
	cmp r0, #2
	beq _0201AEF4
_0201AEB0:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B09C ; =0x0400000E
	ldrb r2, [r4, #0x13]
	lsl r3, r1, #8
	ldrb r0, [r4, #0x11]
	lsl r6, r2, #2
	ldrh r1, [r7]
	lsl r2, r0, #7
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201AF14
_0201AED2:
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x16]
	lsl r3, r2, #2
	ldr r7, _0201B09C ; =0x0400000E
	lsl r2, r1, #8
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201AF14
_0201AEF4:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B09C ; =0x0400000E
	ldrb r0, [r4, #0x16]
	lsl r3, r1, #8
	ldrb r2, [r4, #0x13]
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	lsl r2, r2, #2
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
_0201AF14:
	ldr r0, _0201B09C ; =0x0400000E
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	ldrb r1, [r4, #0x15]
	orr r1, r2
	strh r1, [r0]
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0201AF32
	ldrh r2, [r0]
	mov r1, #0x40
	orr r1, r2
	strh r1, [r0]
	b _0201B14C
_0201AF32:
	ldrh r2, [r0]
	mov r1, #0x40
	bic r2, r1
	strh r2, [r0]
	b _0201B14C
_0201AF3C:
	mov r0, #1
	add r1, r6, #0
	bl GX_EngineBToggleLayers
	ldrb r3, [r4, #0x14]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x11]
	ldrb r2, [r4, #0x13]
	lsl r6, r3, #0xd
	lsl r0, r0, #7
	lsl r3, r2, #2
	str r0, [sp, #0x14]
	ldr r2, _0201B0A0 ; =0x04001008
	lsl r7, r1, #8
	ldrh r1, [r2]
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r1, r0
	ldr r0, [sp, #0x14]
	orr r0, r1
	orr r0, r7
	orr r0, r3
	orr r0, r6
	strh r0, [r2]
	ldrh r1, [r2]
	mov r0, #3
	bic r1, r0
	ldrb r0, [r4, #0x15]
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0201AF8A
	ldrh r1, [r2]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r2]
	b _0201B14C
_0201AF8A:
	ldrh r1, [r2]
	mov r0, #0x40
	bic r1, r0
	strh r1, [r2]
	b _0201B14C
_0201AF94:
	mov r0, #2
	add r1, r6, #0
	bl GX_EngineBToggleLayers
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x11]
	lsl r6, r2, #2
	ldrb r3, [r4, #0x14]
	lsl r0, r0, #7
	mov ip, r0
	ldr r2, _0201B0A4 ; =0x0400100A
	lsl r7, r1, #8
	ldrh r1, [r2]
	mov r0, #0x43
	lsl r3, r3, #0xd
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	mov r1, ip
	orr r0, r1
	orr r0, r7
	orr r0, r6
	orr r0, r3
	strh r0, [r2]
	ldrh r1, [r2]
	mov r0, #3
	bic r1, r0
	ldrb r0, [r4, #0x15]
	orr r0, r1
	strh r0, [r2]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0201AFE2
	ldrh r1, [r2]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r2]
	b _0201B14C
_0201AFE2:
	ldrh r1, [r2]
	mov r0, #0x40
	bic r1, r0
	strh r1, [r2]
	b _0201B14C
_0201AFEC:
	mov r0, #4
	add r1, r6, #0
	bl GX_EngineBToggleLayers
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0201B002
	cmp r0, #1
	beq _0201B024
	cmp r0, #2
	beq _0201B046
_0201B002:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B0A8 ; =0x0400100C
	ldrb r2, [r4, #0x13]
	lsl r3, r1, #8
	ldrb r0, [r4, #0x11]
	lsl r6, r2, #2
	ldrh r1, [r7]
	lsl r2, r0, #7
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201B066
_0201B024:
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x16]
	lsl r3, r2, #2
	ldr r7, _0201B0A8 ; =0x0400100C
	lsl r2, r1, #8
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201B066
_0201B046:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B0A8 ; =0x0400100C
	ldrb r0, [r4, #0x16]
	lsl r3, r1, #8
	ldrb r2, [r4, #0x13]
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	lsl r2, r2, #2
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
_0201B066:
	ldr r0, _0201B0A8 ; =0x0400100C
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	ldrb r1, [r4, #0x15]
	orr r1, r2
	strh r1, [r0]
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0201B084
	ldrh r2, [r0]
	mov r1, #0x40
	orr r1, r2
	strh r1, [r0]
	b _0201B14C
_0201B084:
	ldrh r2, [r0]
	mov r1, #0x40
	bic r2, r1
	strh r2, [r0]
	b _0201B14C
	nop
_0201B090: .word 0x04000008
_0201B094: .word 0x0400000A
_0201B098: .word 0x0400000C
_0201B09C: .word 0x0400000E
_0201B0A0: .word 0x04001008
_0201B0A4: .word 0x0400100A
_0201B0A8: .word 0x0400100C
_0201B0AC:
	mov r0, #8
	add r1, r6, #0
	bl GX_EngineBToggleLayers
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0201B0C2
	cmp r0, #1
	beq _0201B0E4
	cmp r0, #2
	beq _0201B106
_0201B0C2:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B1E0 ; =0x0400100E
	ldrb r2, [r4, #0x13]
	lsl r3, r1, #8
	ldrb r0, [r4, #0x11]
	lsl r6, r2, #2
	ldrh r1, [r7]
	lsl r2, r0, #7
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201B126
_0201B0E4:
	ldrb r2, [r4, #0x13]
	ldrb r1, [r4, #0x12]
	ldrb r0, [r4, #0x16]
	lsl r3, r2, #2
	ldr r7, _0201B1E0 ; =0x0400100E
	lsl r2, r1, #8
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
	b _0201B126
_0201B106:
	ldrb r1, [r4, #0x12]
	ldr r7, _0201B1E0 ; =0x0400100E
	ldrb r0, [r4, #0x16]
	lsl r3, r1, #8
	ldrb r2, [r4, #0x13]
	lsl r6, r0, #0xd
	ldrh r1, [r7]
	mov r0, #0x43
	lsl r2, r2, #2
	and r0, r1
	lsl r1, r5, #0xe
	orr r0, r1
	orr r0, r2
	orr r0, r3
	orr r0, r6
	strh r0, [r7]
_0201B126:
	ldr r0, _0201B1E0 ; =0x0400100E
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	ldrb r1, [r4, #0x15]
	orr r1, r2
	strh r1, [r0]
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _0201B144
	ldrh r2, [r0]
	mov r1, #0x40
	orr r1, r2
	strh r1, [r0]
	b _0201B14C
_0201B144:
	ldrh r2, [r0]
	mov r1, #0x40
	bic r2, r1
	strh r2, [r0]
_0201B14C:
	ldr r0, [sp, #4]
	mov r1, #0x2c
	add r5, r0, #0
	ldr r0, [sp]
	mul r5, r1
	add r2, r0, r5
	mov r3, #0
	mov r0, #1
	strh r3, [r2, #0x20]
	lsl r0, r0, #0xc
	str r0, [r2, #0x24]
	str r0, [r2, #0x28]
	str r3, [r2, #0x2c]
	str r3, [r2, #0x30]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0201B194
	ldr r0, [sp]
	ldr r6, [sp]
	ldr r0, [r0]
	add r6, #8
	bl AllocFromHeap
	str r0, [r6, r5]
	ldr r1, [r6, r5]
	ldr r2, [r4, #8]
	mov r0, #0
	bl MIi_CpuClear16
	ldr r0, [sp]
	ldr r2, [r4, #8]
	add r1, r0, r5
	str r2, [r1, #0xc]
	ldr r0, [r4, #0xc]
	str r0, [r1, #0x10]
	b _0201B19A
_0201B194:
	str r3, [r2, #8]
	str r3, [r2, #0xc]
	str r3, [r2, #0x10]
_0201B19A:
	ldr r0, [sp]
	ldrb r1, [r4, #0x10]
	add r0, r0, r5
	strb r1, [r0, #0x1d]
	ldr r1, [sp, #8]
	strb r1, [r0, #0x1c]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #0x1e]
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _0201B1BC
	ldrb r1, [r4, #0x11]
	cmp r1, #0
	bne _0201B1BC
	mov r1, #0x20
	strb r1, [r0, #0x1f]
	b _0201B1C4
_0201B1BC:
	ldr r0, [sp]
	mov r1, #0x40
	add r0, r0, r5
	strb r1, [r0, #0x1f]
_0201B1C4:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r3, [r4]
	mov r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r3, [r4, #4]
	mov r2, #3
	bl BgSetPosTextAndCommit
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201B1E0: .word 0x0400100E
	thumb_func_end InitBgFromTemplateEx

	thumb_func_start InitBgFromTemplate
InitBgFromTemplate: ; 0x0201B1E4
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #1
	str r4, [sp]
	bl InitBgFromTemplateEx
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end InitBgFromTemplate

	thumb_func_start SetBgControlParam
SetBgControlParam: ; 0x0201B1F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r2, #0
	add r6, r0, #0
	add r7, r1, #0
	add r5, r3, #0
	cmp r4, #0
	bne _0201B230
	add r3, r6, #0
	mov r1, #0x2c
	add r2, r7, #0
	mul r2, r1
	add r3, #0x1e
	add r1, r6, r2
	strb r5, [r3, r2]
	mov ip, r1
	ldrb r1, [r1, #0x1c]
	cmp r1, #0
	bne _0201B228
	ldrb r1, [r3, r2]
	cmp r1, #0
	bne _0201B228
	mov r1, #0x20
	mov r2, ip
	strb r1, [r2, #0x1f]
	b _0201B262
_0201B228:
	mov r1, #0x40
	add r2, r6, r2
	strb r1, [r2, #0x1f]
	b _0201B262
_0201B230:
	cmp r4, #3
	bne _0201B262
	mov r0, #0x2c
	mul r0, r7
	str r0, [sp]
	add r0, r6, r0
	strb r5, [r0, #0x1c]
	ldrb r0, [r0, #0x1d]
	add r1, r5, #0
	bl TranslateGFBgModePairToGXScreenSize
	cmp r5, #0
	bne _0201B25A
	ldr r1, [sp]
	add r2, r6, r1
	ldrb r1, [r2, #0x1e]
	cmp r1, #0
	bne _0201B25A
	mov r1, #0x20
	strb r1, [r2, #0x1f]
	b _0201B262
_0201B25A:
	ldr r2, [sp]
	mov r1, #0x40
	add r2, r6, r2
	strb r1, [r2, #0x1f]
_0201B262:
	cmp r7, #7
	bls _0201B26A
	bl _0201BA78
_0201B26A:
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201B276: ; jump table
	.short _0201B286 - _0201B276 - 2 ; case 0
	.short _0201B306 - _0201B276 - 2 ; case 1
	.short _0201B386 - _0201B276 - 2 ; case 2
	.short _0201B4F6 - _0201B276 - 2 ; case 3
	.short _0201B680 - _0201B276 - 2 ; case 4
	.short _0201B700 - _0201B276 - 2 ; case 5
	.short _0201B780 - _0201B276 - 2 ; case 6
	.short _0201B90C - _0201B276 - 2 ; case 7
_0201B286:
	ldr r1, _0201B59C ; =0x04000008
	cmp r4, #1
	ldrh r2, [r1]
	add r1, sp, #4
	strh r2, [r1, #0x1e]
	bne _0201B2A2
	ldrh r2, [r1, #0x1e]
	ldr r0, _0201B5A0 ; =0xFFFFE0FF
	and r2, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r2
	strh r0, [r1, #0x1e]
	b _0201B2C8
_0201B2A2:
	cmp r4, #2
	bne _0201B2B6
	ldrh r2, [r1, #0x1e]
	mov r0, #0x3c
	bic r2, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r2
	strh r0, [r1, #0x1e]
	b _0201B2C8
_0201B2B6:
	cmp r4, #3
	bne _0201B2C8
	ldrh r3, [r1, #0x1e]
	ldr r2, _0201B5A4 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r2, r3
	lsr r0, r0, #0x10
	orr r0, r2
	strh r0, [r1, #0x1e]
_0201B2C8:
	add r0, sp, #4
	ldrh r3, [r0, #0x1e]
	add sp, #0x24
	lsl r0, r3, #0x12
	lsr r4, r0, #0x1f
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	lsl r0, r3, #0x13
	lsr r1, r0, #0x1b
	mov r0, #0x2c
	mul r0, r7
	add r0, r6, r0
	lsl r3, r3, #0x10
	lsr r5, r3, #0x1e
	lsl r3, r2, #2
	ldrb r0, [r0, #0x1e]
	lsl r2, r1, #8
	mov r6, #0x43
	lsl r1, r0, #7
	ldr r0, _0201B59C ; =0x04000008
	lsl r5, r5, #0xe
	ldrh r7, [r0]
	lsl r4, r4, #0xd
	and r6, r7
	orr r5, r6
	orr r1, r5
	orr r1, r2
	orr r1, r3
	orr r1, r4
	strh r1, [r0]
	pop {r4, r5, r6, r7, pc}
_0201B306:
	ldr r1, _0201B5A8 ; =0x0400000A
	cmp r4, #1
	ldrh r2, [r1]
	add r1, sp, #4
	strh r2, [r1, #0x1c]
	bne _0201B322
	ldrh r2, [r1, #0x1c]
	ldr r0, _0201B5A0 ; =0xFFFFE0FF
	and r2, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r2
	strh r0, [r1, #0x1c]
	b _0201B348
_0201B322:
	cmp r4, #2
	bne _0201B336
	ldrh r2, [r1, #0x1c]
	mov r0, #0x3c
	bic r2, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r2
	strh r0, [r1, #0x1c]
	b _0201B348
_0201B336:
	cmp r4, #3
	bne _0201B348
	ldrh r3, [r1, #0x1c]
	ldr r2, _0201B5A4 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r2, r3
	lsr r0, r0, #0x10
	orr r0, r2
	strh r0, [r1, #0x1c]
_0201B348:
	add r0, sp, #4
	ldrh r3, [r0, #0x1c]
	add sp, #0x24
	lsl r0, r3, #0x12
	lsr r4, r0, #0x1f
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	lsl r0, r3, #0x13
	lsr r1, r0, #0x1b
	mov r0, #0x2c
	mul r0, r7
	add r0, r6, r0
	lsl r3, r3, #0x10
	lsr r5, r3, #0x1e
	lsl r3, r2, #2
	ldrb r0, [r0, #0x1e]
	lsl r2, r1, #8
	mov r6, #0x43
	lsl r1, r0, #7
	ldr r0, _0201B5A8 ; =0x0400000A
	lsl r5, r5, #0xe
	ldrh r7, [r0]
	lsl r4, r4, #0xd
	and r6, r7
	orr r5, r6
	orr r1, r5
	orr r1, r2
	orr r1, r3
	orr r1, r4
	strh r1, [r0]
	pop {r4, r5, r6, r7, pc}
_0201B386:
	mov r1, #0x2c
	mul r1, r7
	add r2, r6, r1
	ldrb r2, [r2, #0x1c]
	cmp r2, #0
	beq _0201B39A
	cmp r2, #1
	beq _0201B40E
	cmp r2, #2
	beq _0201B482
_0201B39A:
	ldr r2, _0201B5AC ; =0x0400000C
	cmp r4, #1
	ldrh r3, [r2]
	add r2, sp, #4
	strh r3, [r2, #0x1a]
	bne _0201B3B6
	ldrh r3, [r2, #0x1a]
	ldr r0, _0201B5A0 ; =0xFFFFE0FF
	and r3, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r3
	strh r0, [r2, #0x1a]
	b _0201B3DC
_0201B3B6:
	cmp r4, #2
	bne _0201B3CA
	ldrh r3, [r2, #0x1a]
	mov r0, #0x3c
	bic r3, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r3
	strh r0, [r2, #0x1a]
	b _0201B3DC
_0201B3CA:
	cmp r4, #3
	bne _0201B3DC
	ldrh r4, [r2, #0x1a]
	ldr r3, _0201B5A4 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r3, r4
	lsr r0, r0, #0x10
	orr r0, r3
	strh r0, [r2, #0x1a]
_0201B3DC:
	add r0, sp, #4
	ldrh r3, [r0, #0x1a]
	add r1, r6, r1
	ldr r6, _0201B5AC ; =0x0400000C
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	ldrb r4, [r1, #0x1e]
	lsl r0, r3, #0x13
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1b
	lsl r1, r0, #8
	lsl r0, r4, #7
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #2
	orr r0, r1
	orr r0, r2
	add sp, #0x24
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B40E:
	ldr r1, _0201B5AC ; =0x0400000C
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2, #0x18]
	bne _0201B42A
	ldrh r1, [r2, #0x18]
	ldr r0, _0201B5A0 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2, #0x18]
	b _0201B450
_0201B42A:
	cmp r4, #2
	bne _0201B43E
	ldrh r1, [r2, #0x18]
	mov r0, #0x3c
	bic r1, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2, #0x18]
	b _0201B450
_0201B43E:
	cmp r4, #3
	bne _0201B450
	ldrh r3, [r2, #0x18]
	ldr r1, _0201B5A4 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2, #0x18]
_0201B450:
	add r0, sp, #4
	ldrh r3, [r0, #0x18]
	ldr r6, _0201B5AC ; =0x0400000C
	add sp, #0x24
	lsl r1, r3, #0x13
	lsl r0, r3, #0x1a
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1c
	lsl r1, r0, #2
	lsl r0, r4, #8
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B482:
	ldr r1, _0201B5AC ; =0x0400000C
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2, #0x16]
	bne _0201B49E
	ldrh r1, [r2, #0x16]
	ldr r0, _0201B5A0 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2, #0x16]
	b _0201B4C4
_0201B49E:
	cmp r4, #2
	bne _0201B4B2
	ldrh r1, [r2, #0x16]
	mov r0, #0x38
	bic r1, r0
	lsl r0, r5, #0x1d
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2, #0x16]
	b _0201B4C4
_0201B4B2:
	cmp r4, #3
	bne _0201B4C4
	ldrh r3, [r2, #0x16]
	ldr r1, _0201B5A4 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2, #0x16]
_0201B4C4:
	add r0, sp, #4
	ldrh r3, [r0, #0x16]
	ldr r6, _0201B5AC ; =0x0400000C
	add sp, #0x24
	lsl r1, r3, #0x13
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r0, r3, #0x1a
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsl r1, r4, #8
	lsr r0, r0, #0x1d
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	lsl r0, r0, #2
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B4F6:
	mov r1, #0x2c
	mul r1, r7
	add r2, r6, r1
	ldrb r2, [r2, #0x1c]
	cmp r2, #0
	beq _0201B50C
	cmp r2, #1
	beq _0201B580
	cmp r2, #2
	bne _0201B50C
	b _0201B60C
_0201B50C:
	ldr r2, _0201B5B0 ; =0x0400000E
	cmp r4, #1
	ldrh r3, [r2]
	add r2, sp, #4
	strh r3, [r2, #0x14]
	bne _0201B528
	ldrh r3, [r2, #0x14]
	ldr r0, _0201B5A0 ; =0xFFFFE0FF
	and r3, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r3
	strh r0, [r2, #0x14]
	b _0201B54E
_0201B528:
	cmp r4, #2
	bne _0201B53C
	ldrh r3, [r2, #0x14]
	mov r0, #0x3c
	bic r3, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r3
	strh r0, [r2, #0x14]
	b _0201B54E
_0201B53C:
	cmp r4, #3
	bne _0201B54E
	ldrh r4, [r2, #0x14]
	ldr r3, _0201B5A4 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r3, r4
	lsr r0, r0, #0x10
	orr r0, r3
	strh r0, [r2, #0x14]
_0201B54E:
	add r0, sp, #4
	ldrh r3, [r0, #0x14]
	add r1, r6, r1
	ldr r6, _0201B5B0 ; =0x0400000E
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	ldrb r4, [r1, #0x1e]
	lsl r0, r3, #0x13
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1b
	lsl r1, r0, #8
	lsl r0, r4, #7
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #2
	orr r0, r1
	orr r0, r2
	add sp, #0x24
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B580:
	ldr r1, _0201B5B0 ; =0x0400000E
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2, #0x12]
	bne _0201B5B4
	ldrh r1, [r2, #0x12]
	ldr r0, _0201B5A0 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2, #0x12]
	b _0201B5DA
	.balign 4, 0
_0201B59C: .word 0x04000008
_0201B5A0: .word 0xFFFFE0FF
_0201B5A4: .word 0xFFFF3FFF
_0201B5A8: .word 0x0400000A
_0201B5AC: .word 0x0400000C
_0201B5B0: .word 0x0400000E
_0201B5B4:
	cmp r4, #2
	bne _0201B5C8
	ldrh r1, [r2, #0x12]
	mov r0, #0x3c
	bic r1, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2, #0x12]
	b _0201B5DA
_0201B5C8:
	cmp r4, #3
	bne _0201B5DA
	ldrh r3, [r2, #0x12]
	ldr r1, _0201B8C8 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2, #0x12]
_0201B5DA:
	add r0, sp, #4
	ldrh r3, [r0, #0x12]
	ldr r6, _0201B8CC ; =0x0400000E
	add sp, #0x24
	lsl r1, r3, #0x13
	lsl r0, r3, #0x1a
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1c
	lsl r1, r0, #2
	lsl r0, r4, #8
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B60C:
	ldr r1, _0201B8CC ; =0x0400000E
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2, #0x10]
	bne _0201B628
	ldrh r1, [r2, #0x10]
	ldr r0, _0201B8D0 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2, #0x10]
	b _0201B64E
_0201B628:
	cmp r4, #2
	bne _0201B63C
	ldrh r1, [r2, #0x10]
	mov r0, #0x38
	bic r1, r0
	lsl r0, r5, #0x1d
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2, #0x10]
	b _0201B64E
_0201B63C:
	cmp r4, #3
	bne _0201B64E
	ldrh r3, [r2, #0x10]
	ldr r1, _0201B8C8 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2, #0x10]
_0201B64E:
	add r0, sp, #4
	ldrh r3, [r0, #0x10]
	ldr r6, _0201B8CC ; =0x0400000E
	add sp, #0x24
	lsl r1, r3, #0x13
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r0, r3, #0x1a
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsl r1, r4, #8
	lsr r0, r0, #0x1d
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	lsl r0, r0, #2
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B680:
	ldr r1, _0201B8D4 ; =0x04001008
	cmp r4, #1
	ldrh r2, [r1]
	add r1, sp, #4
	strh r2, [r1, #0xe]
	bne _0201B69C
	ldrh r2, [r1, #0xe]
	ldr r0, _0201B8D0 ; =0xFFFFE0FF
	and r2, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r2
	strh r0, [r1, #0xe]
	b _0201B6C2
_0201B69C:
	cmp r4, #2
	bne _0201B6B0
	ldrh r2, [r1, #0xe]
	mov r0, #0x3c
	bic r2, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r2
	strh r0, [r1, #0xe]
	b _0201B6C2
_0201B6B0:
	cmp r4, #3
	bne _0201B6C2
	ldrh r3, [r1, #0xe]
	ldr r2, _0201B8C8 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r2, r3
	lsr r0, r0, #0x10
	orr r0, r2
	strh r0, [r1, #0xe]
_0201B6C2:
	add r0, sp, #4
	ldrh r3, [r0, #0xe]
	add sp, #0x24
	lsl r0, r3, #0x12
	lsr r4, r0, #0x1f
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	lsl r0, r3, #0x13
	lsr r1, r0, #0x1b
	mov r0, #0x2c
	mul r0, r7
	add r0, r6, r0
	lsl r3, r3, #0x10
	lsr r5, r3, #0x1e
	lsl r3, r2, #2
	ldrb r0, [r0, #0x1e]
	lsl r2, r1, #8
	mov r6, #0x43
	lsl r1, r0, #7
	ldr r0, _0201B8D4 ; =0x04001008
	lsl r5, r5, #0xe
	ldrh r7, [r0]
	lsl r4, r4, #0xd
	and r6, r7
	orr r5, r6
	orr r1, r5
	orr r1, r2
	orr r1, r3
	orr r1, r4
	strh r1, [r0]
	pop {r4, r5, r6, r7, pc}
_0201B700:
	ldr r1, _0201B8D8 ; =0x0400100A
	cmp r4, #1
	ldrh r2, [r1]
	add r1, sp, #4
	strh r2, [r1, #0xc]
	bne _0201B71C
	ldrh r2, [r1, #0xc]
	ldr r0, _0201B8D0 ; =0xFFFFE0FF
	and r2, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r2
	strh r0, [r1, #0xc]
	b _0201B742
_0201B71C:
	cmp r4, #2
	bne _0201B730
	ldrh r2, [r1, #0xc]
	mov r0, #0x3c
	bic r2, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r2
	strh r0, [r1, #0xc]
	b _0201B742
_0201B730:
	cmp r4, #3
	bne _0201B742
	ldrh r3, [r1, #0xc]
	ldr r2, _0201B8C8 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r2, r3
	lsr r0, r0, #0x10
	orr r0, r2
	strh r0, [r1, #0xc]
_0201B742:
	add r0, sp, #4
	ldrh r3, [r0, #0xc]
	add sp, #0x24
	lsl r0, r3, #0x12
	lsr r4, r0, #0x1f
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	lsl r0, r3, #0x13
	lsr r1, r0, #0x1b
	mov r0, #0x2c
	mul r0, r7
	add r0, r6, r0
	lsl r3, r3, #0x10
	lsr r5, r3, #0x1e
	lsl r3, r2, #2
	ldrb r0, [r0, #0x1e]
	lsl r2, r1, #8
	mov r6, #0x43
	lsl r1, r0, #7
	ldr r0, _0201B8D8 ; =0x0400100A
	lsl r5, r5, #0xe
	ldrh r7, [r0]
	lsl r4, r4, #0xd
	and r6, r7
	orr r5, r6
	orr r1, r5
	orr r1, r2
	orr r1, r3
	orr r1, r4
	strh r1, [r0]
	pop {r4, r5, r6, r7, pc}
_0201B780:
	mov r1, #0x2c
	mul r1, r7
	add r2, r6, r1
	ldrb r2, [r2, #0x1c]
	cmp r2, #0
	beq _0201B794
	cmp r2, #1
	beq _0201B808
	cmp r2, #2
	beq _0201B87C
_0201B794:
	ldr r2, _0201B8DC ; =0x0400100C
	cmp r4, #1
	ldrh r3, [r2]
	add r2, sp, #4
	strh r3, [r2, #0xa]
	bne _0201B7B0
	ldrh r3, [r2, #0xa]
	ldr r0, _0201B8D0 ; =0xFFFFE0FF
	and r3, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r3
	strh r0, [r2, #0xa]
	b _0201B7D6
_0201B7B0:
	cmp r4, #2
	bne _0201B7C4
	ldrh r3, [r2, #0xa]
	mov r0, #0x3c
	bic r3, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r3
	strh r0, [r2, #0xa]
	b _0201B7D6
_0201B7C4:
	cmp r4, #3
	bne _0201B7D6
	ldrh r4, [r2, #0xa]
	ldr r3, _0201B8C8 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r3, r4
	lsr r0, r0, #0x10
	orr r0, r3
	strh r0, [r2, #0xa]
_0201B7D6:
	add r0, sp, #4
	ldrh r3, [r0, #0xa]
	add r1, r6, r1
	ldr r6, _0201B8DC ; =0x0400100C
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	ldrb r4, [r1, #0x1e]
	lsl r0, r3, #0x13
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1b
	lsl r1, r0, #8
	lsl r0, r4, #7
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #2
	orr r0, r1
	orr r0, r2
	add sp, #0x24
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B808:
	ldr r1, _0201B8DC ; =0x0400100C
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2, #8]
	bne _0201B824
	ldrh r1, [r2, #8]
	ldr r0, _0201B8D0 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2, #8]
	b _0201B84A
_0201B824:
	cmp r4, #2
	bne _0201B838
	ldrh r1, [r2, #8]
	mov r0, #0x3c
	bic r1, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2, #8]
	b _0201B84A
_0201B838:
	cmp r4, #3
	bne _0201B84A
	ldrh r3, [r2, #8]
	ldr r1, _0201B8C8 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2, #8]
_0201B84A:
	add r0, sp, #4
	ldrh r3, [r0, #8]
	ldr r6, _0201B8DC ; =0x0400100C
	add sp, #0x24
	lsl r1, r3, #0x13
	lsl r0, r3, #0x1a
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1c
	lsl r1, r0, #2
	lsl r0, r4, #8
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B87C:
	ldr r1, _0201B8DC ; =0x0400100C
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2, #6]
	bne _0201B898
	ldrh r1, [r2, #6]
	ldr r0, _0201B8D0 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2, #6]
	b _0201B8BE
_0201B898:
	cmp r4, #2
	bne _0201B8AC
	ldrh r1, [r2, #6]
	mov r0, #0x38
	bic r1, r0
	lsl r0, r5, #0x1d
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2, #6]
	b _0201B8BE
_0201B8AC:
	cmp r4, #3
	bne _0201B8BE
	ldrh r3, [r2, #6]
	ldr r1, _0201B8C8 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2, #6]
_0201B8BE:
	add r0, sp, #4
	ldrh r3, [r0, #6]
	ldr r6, _0201B8DC ; =0x0400100C
	b _0201B8E0
	nop
_0201B8C8: .word 0xFFFF3FFF
_0201B8CC: .word 0x0400000E
_0201B8D0: .word 0xFFFFE0FF
_0201B8D4: .word 0x04001008
_0201B8D8: .word 0x0400100A
_0201B8DC: .word 0x0400100C
_0201B8E0:
	add sp, #0x24
	lsl r1, r3, #0x13
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r0, r3, #0x1a
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsl r1, r4, #8
	lsr r0, r0, #0x1d
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	lsl r0, r0, #2
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B90C:
	mov r1, #0x2c
	mul r1, r7
	add r2, r6, r1
	ldrb r2, [r2, #0x1c]
	cmp r2, #0
	beq _0201B920
	cmp r2, #1
	beq _0201B994
	cmp r2, #2
	beq _0201BA08
_0201B920:
	ldr r2, _0201BA7C ; =0x0400100E
	cmp r4, #1
	ldrh r3, [r2]
	add r2, sp, #4
	strh r3, [r2, #4]
	bne _0201B93C
	ldrh r3, [r2, #4]
	ldr r0, _0201BA80 ; =0xFFFFE0FF
	and r3, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r3
	strh r0, [r2, #4]
	b _0201B962
_0201B93C:
	cmp r4, #2
	bne _0201B950
	ldrh r3, [r2, #4]
	mov r0, #0x3c
	bic r3, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r3
	strh r0, [r2, #4]
	b _0201B962
_0201B950:
	cmp r4, #3
	bne _0201B962
	ldrh r4, [r2, #4]
	ldr r3, _0201BA84 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r3, r4
	lsr r0, r0, #0x10
	orr r0, r3
	strh r0, [r2, #4]
_0201B962:
	add r0, sp, #4
	ldrh r3, [r0, #4]
	add r1, r6, r1
	ldr r6, _0201BA7C ; =0x0400100E
	lsl r0, r3, #0x1a
	lsr r2, r0, #0x1c
	ldrb r4, [r1, #0x1e]
	lsl r0, r3, #0x13
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1b
	lsl r1, r0, #8
	lsl r0, r4, #7
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #2
	orr r0, r1
	orr r0, r2
	add sp, #0x24
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201B994:
	ldr r1, _0201BA7C ; =0x0400100E
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2, #2]
	bne _0201B9B0
	ldrh r1, [r2, #2]
	ldr r0, _0201BA80 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2, #2]
	b _0201B9D6
_0201B9B0:
	cmp r4, #2
	bne _0201B9C4
	ldrh r1, [r2, #2]
	mov r0, #0x3c
	bic r1, r0
	lsl r0, r5, #0x1c
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2, #2]
	b _0201B9D6
_0201B9C4:
	cmp r4, #3
	bne _0201B9D6
	ldrh r3, [r2, #2]
	ldr r1, _0201BA84 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2, #2]
_0201B9D6:
	add r0, sp, #4
	ldrh r3, [r0, #2]
	ldr r6, _0201BA7C ; =0x0400100E
	add sp, #0x24
	lsl r1, r3, #0x13
	lsl r0, r3, #0x1a
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsr r0, r0, #0x1c
	lsl r1, r0, #2
	lsl r0, r4, #8
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
	pop {r4, r5, r6, r7, pc}
_0201BA08:
	ldr r1, _0201BA7C ; =0x0400100E
	add r2, sp, #4
	ldrh r1, [r1]
	cmp r4, #1
	strh r1, [r2]
	bne _0201BA24
	ldrh r1, [r2]
	ldr r0, _0201BA80 ; =0xFFFFE0FF
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x13
	orr r0, r1
	strh r0, [r2]
	b _0201BA4A
_0201BA24:
	cmp r4, #2
	bne _0201BA38
	ldrh r1, [r2]
	mov r0, #0x38
	bic r1, r0
	lsl r0, r5, #0x1d
	lsr r0, r0, #0x1a
	orr r0, r1
	strh r0, [r2]
	b _0201BA4A
_0201BA38:
	cmp r4, #3
	bne _0201BA4A
	ldrh r3, [r2]
	ldr r1, _0201BA84 ; =0xFFFF3FFF
	lsl r0, r0, #0x1e
	and r1, r3
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r2]
_0201BA4A:
	add r0, sp, #4
	ldrh r3, [r0]
	ldr r6, _0201BA7C ; =0x0400100E
	lsl r1, r3, #0x13
	lsr r4, r1, #0x1b
	lsl r1, r3, #0x12
	lsr r2, r1, #0x1f
	lsl r0, r3, #0x1a
	lsl r1, r3, #0x10
	lsr r3, r1, #0x1e
	lsl r1, r4, #8
	lsr r0, r0, #0x1d
	ldrh r5, [r6]
	mov r4, #0x43
	lsl r3, r3, #0xe
	and r4, r5
	lsl r0, r0, #2
	orr r3, r4
	orr r0, r3
	lsl r2, r2, #0xd
	orr r0, r1
	orr r0, r2
	strh r0, [r6]
_0201BA78: ; 0x0201BA78
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0201BA7C: .word 0x0400100E
_0201BA80: .word 0xFFFFE0FF
_0201BA84: .word 0xFFFF3FFF
	thumb_func_end SetBgControlParam

	thumb_func_start TranslateGFBgModePairToGXScreenSize
TranslateGFBgModePairToGXScreenSize: ; 0x0201BA88
	cmp r1, #0
	beq _0201BA96
	cmp r1, #1
	beq _0201BAB6
	cmp r1, #2
	beq _0201BAD6
	b _0201BAF6
_0201BA96:
	cmp r0, #1
	bne _0201BA9E
	mov r0, #0
	bx lr
_0201BA9E:
	cmp r0, #2
	bne _0201BAA6
	mov r0, #2
	bx lr
_0201BAA6:
	cmp r0, #3
	bne _0201BAAE
	mov r0, #1
	bx lr
_0201BAAE:
	cmp r0, #4
	bne _0201BAF6
	mov r0, #3
	bx lr
_0201BAB6:
	cmp r0, #0
	bne _0201BABE
	mov r0, #0
	bx lr
_0201BABE:
	cmp r0, #1
	bne _0201BAC6
	mov r0, #1
	bx lr
_0201BAC6:
	cmp r0, #4
	bne _0201BACE
	mov r0, #2
	bx lr
_0201BACE:
	cmp r0, #5
	bne _0201BAF6
	mov r0, #3
	bx lr
_0201BAD6:
	cmp r0, #0
	bne _0201BADE
	mov r0, #0
	bx lr
_0201BADE:
	cmp r0, #1
	bne _0201BAE6
	mov r0, #1
	bx lr
_0201BAE6:
	cmp r0, #4
	bne _0201BAEE
	mov r0, #2
	bx lr
_0201BAEE:
	cmp r0, #5
	bne _0201BAF6
	mov r0, #3
	bx lr
_0201BAF6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end TranslateGFBgModePairToGXScreenSize

	thumb_func_start GetBgScreenDimensions
GetBgScreenDimensions: ; 0x0201BAFC
	cmp r0, #5
	bhi _0201BB4A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201BB0C: ; jump table
	.short _0201BB18 - _0201BB0C - 2 ; case 0
	.short _0201BB20 - _0201BB0C - 2 ; case 1
	.short _0201BB28 - _0201BB0C - 2 ; case 2
	.short _0201BB32 - _0201BB0C - 2 ; case 3
	.short _0201BB3C - _0201BB0C - 2 ; case 4
	.short _0201BB44 - _0201BB0C - 2 ; case 5
_0201BB18:
	mov r0, #0x10
	strb r0, [r1]
	strb r0, [r2]
	bx lr
_0201BB20:
	mov r0, #0x20
	strb r0, [r1]
	strb r0, [r2]
	bx lr
_0201BB28:
	mov r0, #0x20
	strb r0, [r1]
	mov r0, #0x40
	strb r0, [r2]
	bx lr
_0201BB32:
	mov r0, #0x40
	strb r0, [r1]
	mov r0, #0x20
	strb r0, [r2]
	bx lr
_0201BB3C:
	mov r0, #0x40
	strb r0, [r1]
	strb r0, [r2]
	bx lr
_0201BB44:
	mov r0, #0x80
	strb r0, [r1]
	strb r0, [r2]
_0201BB4A:
	bx lr
	thumb_func_end GetBgScreenDimensions

	thumb_func_start FreeBgTilemapBuffer
FreeBgTilemapBuffer: ; 0x0201BB4C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r2, #0x2c
	add r5, r1, #0
	mul r5, r2
	add r4, #8
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _0201BB66
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, r5]
_0201BB66:
	pop {r3, r4, r5, pc}
	thumb_func_end FreeBgTilemapBuffer

	thumb_func_start SetBgPriority
SetBgPriority: ; 0x0201BB68
	cmp r0, #7
	bhi _0201BC06
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201BB78: ; jump table
	.short _0201BB88 - _0201BB78 - 2 ; case 0
	.short _0201BB98 - _0201BB78 - 2 ; case 1
	.short _0201BBA8 - _0201BB78 - 2 ; case 2
	.short _0201BBB8 - _0201BB78 - 2 ; case 3
	.short _0201BBC8 - _0201BB78 - 2 ; case 4
	.short _0201BBD8 - _0201BB78 - 2 ; case 5
	.short _0201BBE8 - _0201BB78 - 2 ; case 6
	.short _0201BBF8 - _0201BB78 - 2 ; case 7
_0201BB88:
	ldr r2, _0201BC08 ; =0x04000008
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	bx lr
_0201BB98:
	ldr r2, _0201BC0C ; =0x0400000A
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	bx lr
_0201BBA8:
	ldr r2, _0201BC10 ; =0x0400000C
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	bx lr
_0201BBB8:
	ldr r2, _0201BC14 ; =0x0400000E
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	bx lr
_0201BBC8:
	ldr r2, _0201BC18 ; =0x04001008
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	bx lr
_0201BBD8:
	ldr r2, _0201BC1C ; =0x0400100A
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	bx lr
_0201BBE8:
	ldr r2, _0201BC20 ; =0x0400100C
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
	bx lr
_0201BBF8:
	ldr r2, _0201BC24 ; =0x0400100E
	mov r0, #3
	ldrh r3, [r2]
	bic r3, r0
	add r0, r3, #0
	orr r0, r1
	strh r0, [r2]
_0201BC06:
	bx lr
	.balign 4, 0
_0201BC08: .word 0x04000008
_0201BC0C: .word 0x0400000A
_0201BC10: .word 0x0400000C
_0201BC14: .word 0x0400000E
_0201BC18: .word 0x04001008
_0201BC1C: .word 0x0400100A
_0201BC20: .word 0x0400100C
_0201BC24: .word 0x0400100E
	thumb_func_end SetBgPriority

	thumb_func_start ToggleBgLayer
ToggleBgLayer: ; 0x0201BC28
	push {r3, lr}
	cmp r0, #7
	bhi _0201BC88
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201BC3A: ; jump table
	.short _0201BC4A - _0201BC3A - 2 ; case 0
	.short _0201BC52 - _0201BC3A - 2 ; case 1
	.short _0201BC5A - _0201BC3A - 2 ; case 2
	.short _0201BC62 - _0201BC3A - 2 ; case 3
	.short _0201BC6A - _0201BC3A - 2 ; case 4
	.short _0201BC72 - _0201BC3A - 2 ; case 5
	.short _0201BC7A - _0201BC3A - 2 ; case 6
	.short _0201BC82 - _0201BC3A - 2 ; case 7
_0201BC4A:
	mov r0, #1
	bl GX_EngineAToggleLayers
	pop {r3, pc}
_0201BC52:
	mov r0, #2
	bl GX_EngineAToggleLayers
	pop {r3, pc}
_0201BC5A:
	mov r0, #4
	bl GX_EngineAToggleLayers
	pop {r3, pc}
_0201BC62:
	mov r0, #8
	bl GX_EngineAToggleLayers
	pop {r3, pc}
_0201BC6A:
	mov r0, #1
	bl GX_EngineBToggleLayers
	pop {r3, pc}
_0201BC72:
	mov r0, #2
	bl GX_EngineBToggleLayers
	pop {r3, pc}
_0201BC7A:
	mov r0, #4
	bl GX_EngineBToggleLayers
	pop {r3, pc}
_0201BC82:
	mov r0, #8
	bl GX_EngineBToggleLayers
_0201BC88:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ToggleBgLayer

	thumb_func_start BgSetPosTextAndCommit
BgSetPosTextAndCommit: ; 0x0201BC8C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	mov r0, #0x2c
	add r6, r5, #0
	mul r6, r0
	add r0, r4, #0
	add r0, #8
	add r1, r2, #0
	add r2, r3, #0
	add r0, r0, r6
	bl Bg_SetPosText
	add r0, r4, r6
	ldr r1, [r0, #0x14]
	ldr r0, [r0, #0x18]
	cmp r5, #7
	bls _0201BCB2
	b _0201BDC8
_0201BCB2:
	add r2, r5, r5
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0201BCBE: ; jump table
	.short _0201BCCE - _0201BCBE - 2 ; case 0
	.short _0201BCE4 - _0201BCBE - 2 ; case 1
	.short _0201BCFA - _0201BCBE - 2 ; case 2
	.short _0201BD24 - _0201BCBE - 2 ; case 3
	.short _0201BD4E - _0201BCBE - 2 ; case 4
	.short _0201BD64 - _0201BCBE - 2 ; case 5
	.short _0201BD7A - _0201BCBE - 2 ; case 6
	.short _0201BDA2 - _0201BCBE - 2 ; case 7
_0201BCCE:
	ldr r2, _0201BDCC ; =0x000001FF
	add r3, r1, #0
	lsl r1, r0, #0x10
	lsl r0, r2, #0x10
	and r3, r2
	and r0, r1
	add r1, r3, #0
	orr r1, r0
	ldr r0, _0201BDD0 ; =0x04000010
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BCE4:
	ldr r2, _0201BDCC ; =0x000001FF
	add r3, r1, #0
	lsl r1, r0, #0x10
	lsl r0, r2, #0x10
	and r3, r2
	and r0, r1
	add r1, r3, #0
	orr r1, r0
	ldr r0, _0201BDD4 ; =0x04000014
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BCFA:
	add r2, r4, #0
	add r2, #0x74
	ldrb r2, [r2]
	cmp r2, #0
	bne _0201BD1A
	ldr r2, _0201BDCC ; =0x000001FF
	add r3, r1, #0
	lsl r1, r0, #0x10
	lsl r0, r2, #0x10
	and r3, r2
	and r0, r1
	add r1, r3, #0
	orr r1, r0
	ldr r0, _0201BDD8 ; =0x04000018
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BD1A:
	add r0, r4, #0
	mov r1, #2
	bl BgAffineReset
	pop {r4, r5, r6, pc}
_0201BD24:
	add r2, r4, #0
	add r2, #0xa0
	ldrb r2, [r2]
	cmp r2, #0
	bne _0201BD44
	ldr r2, _0201BDCC ; =0x000001FF
	add r3, r1, #0
	lsl r1, r0, #0x10
	lsl r0, r2, #0x10
	and r3, r2
	and r0, r1
	add r1, r3, #0
	orr r1, r0
	ldr r0, _0201BDDC ; =0x0400001C
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BD44:
	add r0, r4, #0
	mov r1, #3
	bl BgAffineReset
	pop {r4, r5, r6, pc}
_0201BD4E:
	ldr r2, _0201BDCC ; =0x000001FF
	add r3, r1, #0
	lsl r1, r0, #0x10
	lsl r0, r2, #0x10
	and r3, r2
	and r0, r1
	add r1, r3, #0
	orr r1, r0
	ldr r0, _0201BDE0 ; =0x04001010
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BD64:
	ldr r2, _0201BDCC ; =0x000001FF
	add r3, r1, #0
	lsl r1, r0, #0x10
	lsl r0, r2, #0x10
	and r3, r2
	and r0, r1
	add r1, r3, #0
	orr r1, r0
	ldr r0, _0201BDE4 ; =0x04001014
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BD7A:
	mov r2, #0x49
	lsl r2, r2, #2
	ldrb r3, [r4, r2]
	cmp r3, #0
	bne _0201BD98
	add r2, #0xdb
	and r2, r1
	lsl r1, r0, #0x10
	ldr r0, _0201BDE8 ; =0x01FF0000
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201BDEC ; =0x04001018
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BD98:
	add r0, r4, #0
	mov r1, #6
	bl BgAffineReset
	pop {r4, r5, r6, pc}
_0201BDA2:
	mov r2, #0x15
	lsl r2, r2, #4
	ldrb r3, [r4, r2]
	cmp r3, #0
	bne _0201BDC0
	add r2, #0xaf
	and r2, r1
	lsl r1, r0, #0x10
	ldr r0, _0201BDE8 ; =0x01FF0000
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201BDF0 ; =0x0400101C
	str r1, [r0]
	pop {r4, r5, r6, pc}
_0201BDC0:
	add r0, r4, #0
	mov r1, #7
	bl BgAffineReset
_0201BDC8:
	pop {r4, r5, r6, pc}
	nop
_0201BDCC: .word 0x000001FF
_0201BDD0: .word 0x04000010
_0201BDD4: .word 0x04000014
_0201BDD8: .word 0x04000018
_0201BDDC: .word 0x0400001C
_0201BDE0: .word 0x04001010
_0201BDE4: .word 0x04001014
_0201BDE8: .word 0x01FF0000
_0201BDEC: .word 0x04001018
_0201BDF0: .word 0x0400101C
	thumb_func_end BgSetPosTextAndCommit

	thumb_func_start Bg_GetXpos
Bg_GetXpos: ; 0x0201BDF4
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end Bg_GetXpos

	thumb_func_start Bg_GetYpos
Bg_GetYpos: ; 0x0201BE00
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end Bg_GetYpos

	thumb_func_start Bg_SetTextDimAndAffineParams
Bg_SetTextDimAndAffineParams: ; 0x0201BE0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	mov r0, #0x2c
	add r1, #8
	mul r0, r4
	add r0, r1, r0
	add r1, r2, #0
	add r2, r3, #0
	bl Bg_SetPosText
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl SetBgAffine
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Bg_SetTextDimAndAffineParams

	thumb_func_start Bg_SetPosText
Bg_SetPosText: ; 0x0201BE38
	cmp r1, #5
	bhi _0201BE7A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201BE48: ; jump table
	.short _0201BE54 - _0201BE48 - 2 ; case 0
	.short _0201BE58 - _0201BE48 - 2 ; case 1
	.short _0201BE60 - _0201BE48 - 2 ; case 2
	.short _0201BE68 - _0201BE48 - 2 ; case 3
	.short _0201BE6C - _0201BE48 - 2 ; case 4
	.short _0201BE74 - _0201BE48 - 2 ; case 5
_0201BE54:
	str r2, [r0, #0xc]
	bx lr
_0201BE58:
	ldr r1, [r0, #0xc]
	add r1, r1, r2
	str r1, [r0, #0xc]
	bx lr
_0201BE60:
	ldr r1, [r0, #0xc]
	sub r1, r1, r2
	str r1, [r0, #0xc]
	bx lr
_0201BE68:
	str r2, [r0, #0x10]
	bx lr
_0201BE6C:
	ldr r1, [r0, #0x10]
	add r1, r1, r2
	str r1, [r0, #0x10]
	bx lr
_0201BE74:
	ldr r1, [r0, #0x10]
	sub r1, r1, r2
	str r1, [r0, #0x10]
_0201BE7A:
	bx lr
	thumb_func_end Bg_SetPosText

	thumb_func_start SetBgAffine
SetBgAffine: ; 0x0201BE7C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, [sp, #0x18]
	cmp r4, #7
	bhi _0201BF04
	add r5, r4, r4
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_0201BE98: ; jump table
	.short _0201BF04 - _0201BE98 - 2 ; case 0
	.short _0201BF04 - _0201BE98 - 2 ; case 1
	.short _0201BEA8 - _0201BE98 - 2 ; case 2
	.short _0201BEC0 - _0201BE98 - 2 ; case 3
	.short _0201BF04 - _0201BE98 - 2 ; case 4
	.short _0201BF04 - _0201BE98 - 2 ; case 5
	.short _0201BED8 - _0201BE98 - 2 ; case 6
	.short _0201BEF0 - _0201BE98 - 2 ; case 7
_0201BEA8:
	mov r5, #0x2c
	mul r5, r4
	add r4, r0, r5
	ldr r0, [r4, #0x14]
	str r0, [sp]
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	ldr r0, _0201BF08 ; =0x04000020
	bl G2x_SetBGyAffine_
	add sp, #8
	pop {r3, r4, r5, pc}
_0201BEC0:
	mov r5, #0x2c
	mul r5, r4
	add r4, r0, r5
	ldr r0, [r4, #0x14]
	str r0, [sp]
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	ldr r0, _0201BF0C ; =0x04000030
	bl G2x_SetBGyAffine_
	add sp, #8
	pop {r3, r4, r5, pc}
_0201BED8:
	mov r5, #0x2c
	mul r5, r4
	add r4, r0, r5
	ldr r0, [r4, #0x14]
	str r0, [sp]
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	ldr r0, _0201BF10 ; =0x04001020
	bl G2x_SetBGyAffine_
	add sp, #8
	pop {r3, r4, r5, pc}
_0201BEF0:
	mov r5, #0x2c
	mul r5, r4
	add r4, r0, r5
	ldr r0, [r4, #0x14]
	str r0, [sp]
	ldr r0, [r4, #0x18]
	str r0, [sp, #4]
	ldr r0, _0201BF14 ; =0x04001030
	bl G2x_SetBGyAffine_
_0201BF04:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0201BF08: .word 0x04000020
_0201BF0C: .word 0x04000030
_0201BF10: .word 0x04001020
_0201BF14: .word 0x04001030
	thumb_func_end SetBgAffine

	thumb_func_start BgAffineReset
BgAffineReset: ; 0x0201BF18
	push {r4, r5, lr}
	sub sp, #0x14
	mov r2, #1
	lsl r2, r2, #0xc
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	add r0, sp, #4
	add r3, r2, #0
	str r1, [sp]
	bl MTX22_2DAffine
	mov r3, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #4
	str r3, [sp]
	bl SetBgAffine
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end BgAffineReset

	thumb_func_start CopyOrUncompressTilemapData
CopyOrUncompressTilemapData: ; 0x0201BF44
	push {r3, r4, r5, lr}
	cmp r2, #0
	bne _0201BF50
	bl MI_UncompressLZ8
	pop {r3, r4, r5, pc}
_0201BF50:
	mov r4, #3
	add r3, r0, #0
	tst r3, r4
	bne _0201BF76
	add r3, r1, #0
	tst r3, r4
	bne _0201BF76
	lsl r3, r2, #0x10
	lsr r3, r3, #0x10
	lsr r4, r3, #0x1f
	lsl r5, r3, #0x1e
	sub r5, r5, r4
	mov r3, #0x1e
	ror r5, r3
	add r3, r4, r5
	bne _0201BF76
	bl MIi_CpuCopy32
	pop {r3, r4, r5, pc}
_0201BF76:
	bl MIi_CpuCopy16
	pop {r3, r4, r5, pc}
	thumb_func_end CopyOrUncompressTilemapData

	thumb_func_start BgCommitTilemapBufferToVram
BgCommitTilemapBufferToVram: ; 0x0201BF7C
	push {r3, lr}
	mov r2, #0x2c
	mul r2, r1
	add r3, r0, r2
	ldr r2, [r3, #0x10]
	str r2, [sp]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BgCommitTilemapBufferToVram

	thumb_func_start BgCopyOrUncompressTilemapBufferRangeToVram
BgCopyOrUncompressTilemapBufferRangeToVram: ; 0x0201BF94
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	str r3, [sp]
	cmp r3, #0
	bne _0201C002
	mov r0, #0x2c
	add r7, r4, #0
	mul r7, r0
	add r0, r5, r7
	ldr r0, [r0, #8]
	str r0, [sp, #4]
	cmp r0, #0
	beq _0201BFD2
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r2, r3, #0
	bl CopyOrUncompressTilemapData
	add r3, r5, r7
	ldr r2, [r3, #0x10]
	ldr r1, [sp, #4]
	ldr r3, [r3, #0xc]
	add r0, r4, #0
	lsl r2, r2, #1
	bl CopyTilesToVram
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0201BFD2:
	ldr r0, [r6]
	lsr r7, r0, #8
	ldr r0, [r5]
	add r1, r7, #0
	bl AllocFromHeapAtEnd
	add r5, r0, #0
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r5, #0
	bl CopyOrUncompressTilemapData
	ldr r2, [sp, #0x20]
	add r0, r4, #0
	add r1, r5, #0
	lsl r2, r2, #1
	add r3, r7, #0
	bl CopyTilesToVram
	add r0, r5, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0201C002:
	ldr r2, [sp, #0x20]
	add r0, r4, #0
	add r1, r6, #0
	lsl r2, r2, #1
	bl CopyTilesToVram
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BgCopyOrUncompressTilemapBufferRangeToVram

	thumb_func_start CopyTilesToVram
CopyTilesToVram: ; 0x0201C014
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r3, #0
	add r7, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	add r5, r2, #0
	bl DC_FlushRange
	cmp r7, #7
	bhi _0201C0A4
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201C036: ; jump table
	.short _0201C046 - _0201C036 - 2 ; case 0
	.short _0201C052 - _0201C036 - 2 ; case 1
	.short _0201C05E - _0201C036 - 2 ; case 2
	.short _0201C06A - _0201C036 - 2 ; case 3
	.short _0201C076 - _0201C036 - 2 ; case 4
	.short _0201C082 - _0201C036 - 2 ; case 5
	.short _0201C08E - _0201C036 - 2 ; case 6
	.short _0201C09A - _0201C036 - 2 ; case 7
_0201C046:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG0Scr
	pop {r3, r4, r5, r6, r7, pc}
_0201C052:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG1Scr
	pop {r3, r4, r5, r6, r7, pc}
_0201C05E:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG2Scr
	pop {r3, r4, r5, r6, r7, pc}
_0201C06A:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG3Scr
	pop {r3, r4, r5, r6, r7, pc}
_0201C076:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG0Scr
	pop {r3, r4, r5, r6, r7, pc}
_0201C082:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG1Scr
	pop {r3, r4, r5, r6, r7, pc}
_0201C08E:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG2Scr
	pop {r3, r4, r5, r6, r7, pc}
_0201C09A:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG3Scr
_0201C0A4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end CopyTilesToVram

	thumb_func_start BG_LoadScreenTilemapData
BG_LoadScreenTilemapData: ; 0x0201C0A8
	push {r4, lr}
	add r4, r0, #0
	add r0, r2, #0
	mov r2, #0x2c
	mul r2, r1
	add r1, r4, r2
	ldr r1, [r1, #8]
	add r2, r3, #0
	bl CopyOrUncompressTilemapData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BG_LoadScreenTilemapData

	thumb_func_start BG_LoadCharTilesData
BG_LoadCharTilesData: ; 0x0201C0C0
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #0x2c
	mul r4, r1
	add r4, r0, r4
	ldrb r4, [r4, #0x1e]
	cmp r4, #0
	bne _0201C0DE
	ldr r4, [sp, #0x10]
	lsl r4, r4, #5
	str r4, [sp]
	bl BG_LoadCharPixelData
	add sp, #4
	pop {r3, r4, pc}
_0201C0DE:
	ldr r4, [sp, #0x10]
	lsl r4, r4, #6
	str r4, [sp]
	bl BG_LoadCharPixelData
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end BG_LoadCharTilesData

	thumb_func_start BG_LoadCharPixelData
BG_LoadCharPixelData: ; 0x0201C0EC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r2, #0
	str r3, [sp]
	cmp r3, #0
	bne _0201C124
	ldr r1, [r5]
	ldr r0, [r0]
	lsr r4, r1, #8
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r6, #0
	bl CopyOrUncompressTilemapData
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	add r1, r6, #0
	add r3, r4, #0
	bl LoadBgVramChar
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_0201C124:
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	add r1, r5, #0
	bl LoadBgVramChar
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BG_LoadCharPixelData

	thumb_func_start LoadBgVramChar
LoadBgVramChar: ; 0x0201C130
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r3, #0
	add r7, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	add r5, r2, #0
	bl DC_FlushRange
	cmp r7, #7
	bhi _0201C1C0
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201C152: ; jump table
	.short _0201C162 - _0201C152 - 2 ; case 0
	.short _0201C16E - _0201C152 - 2 ; case 1
	.short _0201C17A - _0201C152 - 2 ; case 2
	.short _0201C186 - _0201C152 - 2 ; case 3
	.short _0201C192 - _0201C152 - 2 ; case 4
	.short _0201C19E - _0201C152 - 2 ; case 5
	.short _0201C1AA - _0201C152 - 2 ; case 6
	.short _0201C1B6 - _0201C152 - 2 ; case 7
_0201C162:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG0Char
	pop {r3, r4, r5, r6, r7, pc}
_0201C16E:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG1Char
	pop {r3, r4, r5, r6, r7, pc}
_0201C17A:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG2Char
	pop {r3, r4, r5, r6, r7, pc}
_0201C186:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GX_LoadBG3Char
	pop {r3, r4, r5, r6, r7, pc}
_0201C192:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG0Char
	pop {r3, r4, r5, r6, r7, pc}
_0201C19E:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG1Char
	pop {r3, r4, r5, r6, r7, pc}
_0201C1AA:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG2Char
	pop {r3, r4, r5, r6, r7, pc}
_0201C1B6:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl GXS_LoadBG3Char
_0201C1C0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end LoadBgVramChar

	thumb_func_start BG_ClearCharDataRange
BG_ClearCharDataRange: ; 0x0201C1C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	add r3, r5, #0
	bl LoadBgVramChar
	ldr r0, [sp]
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BG_ClearCharDataRange

	thumb_func_start BG_FillCharDataRange
BG_FillCharDataRange: ; 0x0201C1F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r4, r0, #0
	mov r1, #0x2c
	add r6, r7, #0
	add r4, #0x1f
	mul r6, r1
	ldrb r1, [r4, r6]
	ldr r0, [r0]
	add r5, r2, #0
	mul r1, r3
	str r1, [sp]
	bl AllocFromHeapAtEnd
	str r0, [sp, #4]
	ldrb r0, [r4, r6]
	cmp r0, #0x20
	bne _0201C22E
	lsl r2, r5, #0xc
	lsl r1, r5, #8
	lsl r0, r5, #4
	orr r1, r2
	orr r0, r1
	add r1, r5, #0
	orr r1, r0
	lsl r0, r1, #0x10
	add r5, r1, #0
	b _0201C238
_0201C22E:
	lsl r2, r5, #0x18
	lsl r1, r5, #0x10
	lsl r0, r5, #8
	orr r1, r2
	orr r0, r1
_0201C238:
	orr r5, r0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl MIi_CpuClearFast
	lsl r0, r7, #0x18
	ldrb r2, [r4, r6]
	ldr r3, [sp, #0x20]
	ldr r1, [sp, #4]
	mul r2, r3
	ldr r3, [sp]
	lsr r0, r0, #0x18
	bl LoadBgVramChar
	ldr r0, [sp, #4]
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BG_FillCharDataRange

	thumb_func_start BG_LoadPlttData
BG_LoadPlttData: ; 0x0201C260
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r7, r3, #0
	bl DC_FlushRange
	cmp r6, #4
	bhs _0201C282
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl GX_LoadBGPltt
	pop {r3, r4, r5, r6, r7, pc}
_0201C282:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl GXS_LoadBGPltt
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BG_LoadPlttData

	thumb_func_start BG_LoadBlankPltt
BG_LoadBlankPltt: ; 0x0201C290
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	add r1, r5, #0
	bl DC_FlushRange
	cmp r6, #4
	bhs _0201C2C2
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl GX_LoadBGPltt
	b _0201C2CC
_0201C2C2:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl GXS_LoadBGPltt
_0201C2CC:
	ldr r0, [sp]
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BG_LoadBlankPltt

	thumb_func_start BG_SetMaskColor
BG_SetMaskColor: ; 0x0201C2D8
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r1, sp, #0xc
	mov r2, #2
	mov r3, #0
	bl BG_LoadPlttData
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end BG_SetMaskColor

	thumb_func_start GetTileMapIndexFromCoords
GetTileMapIndexFromCoords: ; 0x0201C2F0
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r3, #0
	cmp r2, #5
	bhi _0201C3E2
	add r1, r2, r2
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201C308: ; jump table
	.short _0201C314 - _0201C308 - 2 ; case 0
	.short _0201C32E - _0201C308 - 2 ; case 1
	.short _0201C348 - _0201C308 - 2 ; case 2
	.short _0201C362 - _0201C308 - 2 ; case 3
	.short _0201C388 - _0201C308 - 2 ; case 4
	.short _0201C3CA - _0201C308 - 2 ; case 5
_0201C314:
	cmp r4, #0x10
	blo _0201C31C
	bl GF_AssertFail
_0201C31C:
	cmp r5, #0x10
	blo _0201C324
	bl GF_AssertFail
_0201C324:
	lsl r0, r5, #4
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0201C32E:
	cmp r4, #0x20
	blo _0201C336
	bl GF_AssertFail
_0201C336:
	cmp r5, #0x20
	blo _0201C33E
	bl GF_AssertFail
_0201C33E:
	lsl r0, r5, #5
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0201C348:
	cmp r4, #0x20
	blo _0201C350
	bl GF_AssertFail
_0201C350:
	cmp r5, #0x40
	blo _0201C358
	bl GF_AssertFail
_0201C358:
	lsl r0, r5, #5
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0201C362:
	cmp r4, #0x40
	blo _0201C36A
	bl GF_AssertFail
_0201C36A:
	cmp r5, #0x20
	blo _0201C372
	bl GF_AssertFail
_0201C372:
	mov r0, #0x1f
	add r1, r4, #0
	and r1, r0
	mov r0, #0x1f
	bic r4, r0
	add r0, r5, r4
	lsl r0, r0, #5
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0201C388:
	cmp r4, #0x40
	blo _0201C390
	bl GF_AssertFail
_0201C390:
	cmp r5, #0x40
	blo _0201C398
	bl GF_AssertFail
_0201C398:
	cmp r6, #0
	bne _0201C3C0
	asr r0, r5, #5
	asr r1, r4, #5
	lsl r0, r0, #1
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1a
	lsr r2, r0, #0x10
	mov r0, #0x1f
	add r1, r4, #0
	and r1, r0
	lsl r0, r5, #0x1b
	lsr r0, r0, #0x16
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0201C3C0:
	lsl r0, r5, #6
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_0201C3CA:
	cmp r4, #0x80
	blo _0201C3D2
	bl GF_AssertFail
_0201C3D2:
	cmp r5, #0x80
	blo _0201C3DA
	bl GF_AssertFail
_0201C3DA:
	lsl r0, r5, #7
	add r0, r4, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
_0201C3E2:
	pop {r4, r5, r6, pc}
	thumb_func_end GetTileMapIndexFromCoords

	thumb_func_start GetSrcTileMapIndexFromCoords
GetSrcTileMapIndexFromCoords: ; 0x0201C3E4
	push {r3, r4, r5, r6, r7}
	sub sp, #4
	str r3, [sp]
	add r6, r2, #0
	ldr r5, [sp]
	add r4, r6, #0
	sub r4, #0x20
	sub r5, #0x20
	mov r2, #0
	lsl r4, r4, #0x10
	lsl r5, r5, #0x10
	add r3, r2, #0
	asr r4, r4, #0x10
	asr r7, r5, #0x10
	lsr r5, r0, #5
	beq _0201C40A
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
_0201C40A:
	lsr r5, r1, #5
	beq _0201C414
	add r2, r2, #2
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
_0201C414:
	cmp r2, #3
	bhi _0201C4BC
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0201C424: ; jump table
	.short _0201C42C - _0201C424 - 2 ; case 0
	.short _0201C44A - _0201C424 - 2 ; case 1
	.short _0201C470 - _0201C424 - 2 ; case 2
	.short _0201C49C - _0201C424 - 2 ; case 3
_0201C42C:
	cmp r4, #0
	blt _0201C43C
	lsl r1, r1, #5
	add r0, r0, r1
	add r0, r3, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	b _0201C4BC
_0201C43C:
	add r2, r1, #0
	mul r2, r6
	add r0, r0, r2
	add r0, r3, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	b _0201C4BC
_0201C44A:
	cmp r7, #0
	blt _0201C454
	mov r2, #1
	lsl r2, r2, #0xa
	b _0201C458
_0201C454:
	ldr r2, [sp]
	lsl r2, r2, #5
_0201C458:
	add r2, r3, r2
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	mov r2, #0x1f
	and r2, r0
	add r0, r1, #0
	mul r0, r4
	add r0, r2, r0
	add r0, r3, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	b _0201C4BC
_0201C470:
	lsl r2, r6, #5
	add r2, r3, r2
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r4, #0
	blt _0201C48A
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x16
	add r0, r0, r1
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	b _0201C4BC
_0201C48A:
	mov r3, #0x1f
	and r1, r3
	add r3, r1, #0
	mul r3, r6
	add r0, r0, r3
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	b _0201C4BC
_0201C49C:
	add r2, r6, r7
	lsl r2, r2, #5
	add r2, r3, r2
	add r5, r0, #0
	mov r3, #0x1f
	add r0, r1, #0
	and r0, r3
	add r1, r0, #0
	lsl r2, r2, #0x10
	and r5, r3
	mul r1, r4
	lsr r2, r2, #0x10
	add r0, r5, r1
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
_0201C4BC:
	add r0, r3, #0
	add sp, #4
	pop {r3, r4, r5, r6, r7}
	bx lr
	thumb_func_end GetSrcTileMapIndexFromCoords

	thumb_func_start LoadRectToBgTilemapRect
LoadRectToBgTilemapRect: ; 0x0201C4C4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r6, sp, #0x20
	ldrb r5, [r6, #0x14]
	str r5, [sp]
	ldrb r4, [r6, #0x18]
	str r4, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r5, [sp, #0x14]
	str r4, [sp, #0x18]
	add r2, r3, #0
	ldrb r3, [r6, #0x10]
	bl CopyToBgTilemapRect
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end LoadRectToBgTilemapRect

	thumb_func_start CopyToBgTilemapRect
CopyToBgTilemapRect: ; 0x0201C4EC
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, r2, #0
	add r2, r3, #0
	mov r3, #0x2c
	add r5, r1, #0
	mul r5, r3
	add r1, r0, r5
	ldrb r1, [r1, #0x1c]
	add r3, sp, #0x18
	cmp r1, #1
	beq _0201C536
	ldrb r1, [r3, #0x14]
	add r0, #8
	add r0, r0, r5
	str r1, [sp]
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	ldrb r1, [r3, #0x1c]
	str r1, [sp, #8]
	add r1, sp, #0x38
	ldrb r1, [r1]
	str r1, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	str r1, [sp, #0x10]
	add r1, sp, #0x40
	ldrb r1, [r1]
	str r1, [sp, #0x14]
	mov r1, #0
	str r1, [sp, #0x18]
	ldrb r3, [r3, #0x10]
	add r1, r4, #0
	bl CopyToBgTilemapRectText
	add sp, #0x1c
	pop {r4, r5, pc}
_0201C536:
	ldrb r1, [r3, #0x14]
	add r0, #8
	add r0, r0, r5
	str r1, [sp]
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	ldrb r1, [r3, #0x1c]
	str r1, [sp, #8]
	add r1, sp, #0x38
	ldrb r1, [r1]
	str r1, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	str r1, [sp, #0x10]
	add r1, sp, #0x40
	ldrb r1, [r1]
	str r1, [sp, #0x14]
	mov r1, #0
	str r1, [sp, #0x18]
	ldrb r3, [r3, #0x10]
	add r1, r4, #0
	bl CopyBgTilemapRectAffine
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end CopyToBgTilemapRect

	thumb_func_start CopyRectToBgTilemapRect
CopyRectToBgTilemapRect: ; 0x0201C568
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, r2, #0
	add r2, r3, #0
	mov r3, #0x2c
	add r5, r1, #0
	mul r5, r3
	add r1, r0, r5
	ldrb r1, [r1, #0x1c]
	add r3, sp, #0x18
	cmp r1, #1
	beq _0201C5B2
	ldrb r1, [r3, #0x14]
	add r0, #8
	add r0, r0, r5
	str r1, [sp]
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	ldrb r1, [r3, #0x1c]
	str r1, [sp, #8]
	add r1, sp, #0x38
	ldrb r1, [r1]
	str r1, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	str r1, [sp, #0x10]
	add r1, sp, #0x40
	ldrb r1, [r1]
	str r1, [sp, #0x14]
	mov r1, #1
	str r1, [sp, #0x18]
	ldrb r3, [r3, #0x10]
	add r1, r4, #0
	bl CopyToBgTilemapRectText
	add sp, #0x1c
	pop {r4, r5, pc}
_0201C5B2:
	ldrb r1, [r3, #0x14]
	add r0, #8
	add r0, r0, r5
	str r1, [sp]
	ldr r1, [sp, #0x30]
	str r1, [sp, #4]
	ldrb r1, [r3, #0x1c]
	str r1, [sp, #8]
	add r1, sp, #0x38
	ldrb r1, [r1]
	str r1, [sp, #0xc]
	add r1, sp, #0x3c
	ldrb r1, [r1]
	str r1, [sp, #0x10]
	add r1, sp, #0x40
	ldrb r1, [r1]
	str r1, [sp, #0x14]
	mov r1, #1
	str r1, [sp, #0x18]
	ldrb r3, [r3, #0x10]
	add r1, r4, #0
	bl CopyBgTilemapRectAffine
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end CopyRectToBgTilemapRect

	thumb_func_start CopyToBgTilemapRectText
CopyToBgTilemapRectText: ; 0x0201C5E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r1, [sp]
	str r2, [sp, #4]
	add r7, r0, #0
	ldr r0, [sp, #0x58]
	add r6, r3, #0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	ldr r4, [sp, #0x68]
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x6c]
	str r0, [sp, #0x6c]
	ldr r0, [r7]
	str r0, [sp, #0x2c]
	cmp r0, #0
	bne _0201C608
	b _0201C756
_0201C608:
	ldrb r0, [r7, #0x15]
	add r1, sp, #0x40
	add r1, #1
	add r2, sp, #0x40
	bl GetBgScreenDimensions
	add r0, sp, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201C6B8
	mov r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bls _0201C652
	add r1, sp, #0x48
	ldrb r0, [r1, #0x1c]
	str r0, [sp, #0x1c]
	ldrb r0, [r1, #0x18]
	str r0, [sp, #0x18]
	lsl r1, r0, #1
	ldr r0, [sp, #0x5c]
	add r0, r0, r1
	str r0, [sp, #0x14]
_0201C638:
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x28]
	add r0, r1, r0
	add r1, sp, #0x40
	ldrb r1, [r1]
	cmp r0, r1
	bge _0201C652
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x28]
	add r2, r2, r1
	ldr r1, [sp, #0x6c]
	cmp r2, r1
	blt _0201C654
_0201C652:
	b _0201C756
_0201C654:
	mov r5, #0
	cmp r6, #0
	bls _0201C6A4
	add r1, r4, #0
	mul r1, r2
	lsl r2, r1, #1
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x18
	add r1, r1, r2
	lsr r0, r0, #0x18
	str r1, [sp, #0x10]
	str r0, [sp, #0x30]
_0201C66C:
	add r1, sp, #0x40
	ldr r0, [sp]
	ldrb r1, [r1, #1]
	add r0, r0, r5
	cmp r0, r1
	bge _0201C6A4
	ldr r1, [sp, #0x18]
	add r1, r1, r5
	cmp r1, r4
	bge _0201C6A4
	ldrb r2, [r7, #0x15]
	lsl r0, r0, #0x18
	ldrb r3, [r7, #0x14]
	ldr r1, [sp, #0x30]
	lsr r0, r0, #0x18
	bl GetTileMapIndexFromCoords
	ldr r1, [sp, #0x10]
	lsl r2, r5, #1
	ldrh r1, [r1, r2]
	lsl r2, r0, #1
	ldr r0, [sp, #0x2c]
	strh r1, [r0, r2]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r6
	blo _0201C66C
_0201C6A4:
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x58]
	cmp r1, r0
	blo _0201C638
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0201C6B8:
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bls _0201C756
	add r1, sp, #0x48
	ldrb r0, [r1, #0x1c]
	str r0, [sp, #0x24]
	ldrb r0, [r1, #0x18]
	str r0, [sp, #0x20]
_0201C6CC:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	add r1, r1, r0
	add r0, sp, #0x40
	ldrb r0, [r0]
	cmp r1, r0
	bge _0201C756
	ldr r2, [sp, #0x24]
	ldr r0, [sp, #8]
	add r0, r2, r0
	ldr r2, [sp, #0x6c]
	cmp r0, r2
	bge _0201C756
	mov r5, #0
	cmp r6, #0
	bls _0201C746
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	str r1, [sp, #0x34]
	str r0, [sp, #0x3c]
_0201C6F8:
	add r1, sp, #0x40
	ldr r0, [sp]
	ldrb r1, [r1, #1]
	add r0, r0, r5
	cmp r0, r1
	bge _0201C746
	ldr r1, [sp, #0x20]
	add r1, r1, r5
	str r1, [sp, #0xc]
	cmp r1, r4
	bge _0201C746
	ldrb r2, [r7, #0x15]
	lsl r0, r0, #0x18
	ldrb r3, [r7, #0x14]
	ldr r1, [sp, #0x34]
	lsr r0, r0, #0x18
	bl GetTileMapIndexFromCoords
	str r0, [sp, #0x38]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0x18
	ldr r3, [sp, #0x6c]
	lsr r0, r0, #0x18
	add r2, r4, #0
	bl GetSrcTileMapIndexFromCoords
	lsl r1, r0, #1
	ldr r0, [sp, #0x5c]
	ldrh r0, [r0, r1]
	ldr r1, [sp, #0x38]
	lsl r2, r1, #1
	ldr r1, [sp, #0x2c]
	strh r0, [r1, r2]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r6
	blo _0201C6F8
_0201C746:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	str r1, [sp, #8]
	ldr r0, [sp, #0x58]
	cmp r1, r0
	blo _0201C6CC
_0201C756:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end CopyToBgTilemapRectText

	thumb_func_start CopyBgTilemapRectAffine
CopyBgTilemapRectAffine: ; 0x0201C75C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r1, [sp]
	str r2, [sp, #4]
	add r7, r0, #0
	ldr r0, [sp, #0x58]
	add r6, r3, #0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	ldr r4, [sp, #0x68]
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x6c]
	str r0, [sp, #0x6c]
	ldr r0, [r7]
	str r0, [sp, #0x2c]
	cmp r0, #0
	bne _0201C780
	b _0201C8C0
_0201C780:
	ldrb r0, [r7, #0x15]
	add r1, sp, #0x40
	add r1, #1
	add r2, sp, #0x40
	bl GetBgScreenDimensions
	add r0, sp, #0x70
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201C826
	mov r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bls _0201C7BC
	add r1, sp, #0x48
	ldrb r0, [r1, #0x1c]
	str r0, [sp, #0x1c]
	ldrb r0, [r1, #0x18]
	ldr r1, [sp, #0x5c]
	str r0, [sp, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x14]
_0201C7AE:
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x28]
	add r0, r1, r0
	add r1, sp, #0x40
	ldrb r1, [r1]
	cmp r0, r1
	blt _0201C7BE
_0201C7BC:
	b _0201C8C0
_0201C7BE:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x28]
	add r2, r2, r1
	ldr r1, [sp, #0x6c]
	cmp r2, r1
	bge _0201C8C0
	mov r5, #0
	cmp r6, #0
	bls _0201C812
	ldr r1, [sp, #0x14]
	mul r2, r4
	lsl r0, r0, #0x18
	add r1, r1, r2
	lsr r0, r0, #0x18
	str r1, [sp, #0x10]
	str r0, [sp, #0x30]
_0201C7DE:
	add r1, sp, #0x40
	ldr r0, [sp]
	ldrb r1, [r1, #1]
	add r0, r0, r5
	cmp r0, r1
	bge _0201C812
	ldr r1, [sp, #0x18]
	add r1, r1, r5
	cmp r1, r4
	bge _0201C812
	ldrb r2, [r7, #0x15]
	lsl r0, r0, #0x18
	ldrb r3, [r7, #0x14]
	ldr r1, [sp, #0x30]
	lsr r0, r0, #0x18
	bl GetTileMapIndexFromCoords
	ldr r1, [sp, #0x10]
	ldrb r2, [r1, r5]
	ldr r1, [sp, #0x2c]
	strb r2, [r1, r0]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r6
	blo _0201C7DE
_0201C812:
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x58]
	cmp r1, r0
	blo _0201C7AE
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0201C826:
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x58]
	cmp r0, #0
	bls _0201C8C0
	add r1, sp, #0x48
	ldrb r0, [r1, #0x1c]
	str r0, [sp, #0x24]
	ldrb r0, [r1, #0x18]
	str r0, [sp, #0x20]
_0201C83A:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	add r1, r1, r0
	add r0, sp, #0x40
	ldrb r0, [r0]
	cmp r1, r0
	bge _0201C8C0
	ldr r2, [sp, #0x24]
	ldr r0, [sp, #8]
	add r0, r2, r0
	ldr r2, [sp, #0x6c]
	cmp r0, r2
	bge _0201C8C0
	mov r5, #0
	cmp r6, #0
	bls _0201C8B0
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	str r1, [sp, #0x34]
	str r0, [sp, #0x3c]
_0201C866:
	add r1, sp, #0x40
	ldr r0, [sp]
	ldrb r1, [r1, #1]
	add r0, r0, r5
	cmp r0, r1
	bge _0201C8B0
	ldr r1, [sp, #0x20]
	add r1, r1, r5
	str r1, [sp, #0xc]
	cmp r1, r4
	bge _0201C8B0
	ldrb r2, [r7, #0x15]
	lsl r0, r0, #0x18
	ldrb r3, [r7, #0x14]
	ldr r1, [sp, #0x34]
	lsr r0, r0, #0x18
	bl GetTileMapIndexFromCoords
	str r0, [sp, #0x38]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0x18
	ldr r3, [sp, #0x6c]
	lsr r0, r0, #0x18
	add r2, r4, #0
	bl GetSrcTileMapIndexFromCoords
	ldr r1, [sp, #0x5c]
	ldrb r2, [r1, r0]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x38]
	strb r2, [r1, r0]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r6
	blo _0201C866
_0201C8B0:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	str r1, [sp, #8]
	ldr r0, [sp, #0x58]
	cmp r1, r0
	blo _0201C83A
_0201C8C0:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end CopyBgTilemapRectAffine

	thumb_func_start FillBgTilemapRect
FillBgTilemapRect: ; 0x0201C8C4
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	add r2, r3, #0
	mov r3, #0x2c
	add r5, r1, #0
	mul r5, r3
	add r1, r0, r5
	ldrb r1, [r1, #0x1c]
	add r3, sp, #8
	cmp r1, #1
	beq _0201C8F8
	ldrb r1, [r3, #0x14]
	add r0, #8
	add r0, r0, r5
	str r1, [sp]
	ldrb r1, [r3, #0x18]
	str r1, [sp, #4]
	ldrb r1, [r3, #0x1c]
	str r1, [sp, #8]
	ldrb r3, [r3, #0x10]
	add r1, r4, #0
	bl FillBgTilemapRectText
	add sp, #0xc
	pop {r4, r5, pc}
_0201C8F8:
	ldrb r1, [r3, #0x14]
	add r0, #8
	add r0, r0, r5
	str r1, [sp]
	ldrb r1, [r3, #0x18]
	str r1, [sp, #4]
	lsl r1, r4, #0x18
	ldrb r3, [r3, #0x10]
	lsr r1, r1, #0x18
	bl FillBgTilemapRectAffine
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end FillBgTilemapRect

	thumb_func_start FillBgTilemapRectText
FillBgTilemapRectText: ; 0x0201C914
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r7, r0, #0
	ldr r4, [r7]
	ldr r6, [sp, #0x40]
	cmp r4, #0
	beq _0201C9CA
	ldrb r0, [r7, #0x15]
	add r1, sp, #0x1c
	add r1, #1
	add r2, sp, #0x1c
	bl GetBgScreenDimensions
	add r0, sp, #0x28
	ldrb r2, [r0, #0x14]
	ldr r1, [sp, #8]
	add r1, r1, r2
	ldr r2, [sp, #8]
	str r1, [sp, #0xc]
	cmp r2, r1
	bge _0201C9CA
	ldr r2, _0201C9D0 ; =0x00000FFF
	ldr r1, [sp]
	and r1, r2
	lsl r2, r6, #0xc
	str r1, [sp, #0x14]
	add r1, r2, r1
	ldrb r2, [r0, #0x10]
	ldr r0, [sp, #4]
	add r0, r0, r2
	str r0, [sp, #0x10]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
_0201C95E:
	add r0, sp, #0x1c
	ldrb r1, [r0]
	ldr r0, [sp, #8]
	cmp r0, r1
	bhs _0201C9CA
	ldr r5, [sp, #4]
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	cmp r1, r0
	bge _0201C9BA
_0201C972:
	add r0, sp, #0x1c
	ldrb r0, [r0, #1]
	cmp r5, r0
	bhs _0201C9BA
	ldrb r2, [r7, #0x15]
	ldrb r3, [r7, #0x14]
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl GetTileMapIndexFromCoords
	cmp r6, #0x11
	bne _0201C992
	lsl r1, r0, #1
	ldr r0, [sp]
	strh r0, [r4, r1]
	b _0201C9AE
_0201C992:
	cmp r6, #0x10
	bne _0201C9A8
	lsl r0, r0, #1
	ldrh r2, [r4, r0]
	mov r1, #0xf
	lsl r1, r1, #0xc
	and r2, r1
	ldr r1, [sp, #0x14]
	add r1, r1, r2
	strh r1, [r4, r0]
	b _0201C9AE
_0201C9A8:
	lsl r1, r0, #1
	ldr r0, [sp, #0x18]
	strh r0, [r4, r1]
_0201C9AE:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp, #0x10]
	cmp r5, r0
	blt _0201C972
_0201C9BA:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0201C95E
_0201C9CA:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0201C9D0: .word 0x00000FFF
	thumb_func_end FillBgTilemapRectText

	thumb_func_start FillBgTilemapRectAffine
FillBgTilemapRectAffine: ; 0x0201C9D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	add r7, r0, #0
	str r2, [sp, #4]
	ldr r0, [r7]
	add r5, r3, #0
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _0201CA46
	ldrb r0, [r7, #0x15]
	add r1, sp, #0x10
	add r1, #1
	add r2, sp, #0x10
	bl GetBgScreenDimensions
	add r1, sp, #0x18
	ldrb r0, [r1, #0x14]
	add r0, r5, r0
	str r0, [sp, #8]
	cmp r5, r0
	bge _0201CA46
	ldrb r1, [r1, #0x10]
	ldr r0, [sp, #4]
	add r6, r0, r1
_0201CA06:
	add r0, sp, #0x10
	ldrb r0, [r0]
	cmp r5, r0
	bhs _0201CA46
	ldr r4, [sp, #4]
	add r0, r4, #0
	cmp r0, r6
	bge _0201CA3A
_0201CA16:
	add r0, sp, #0x10
	ldrb r0, [r0, #1]
	cmp r4, r0
	bhs _0201CA3A
	ldrb r2, [r7, #0x15]
	ldrb r3, [r7, #0x14]
	add r0, r4, #0
	add r1, r5, #0
	bl GetTileMapIndexFromCoords
	ldr r2, [sp]
	ldr r1, [sp, #0xc]
	strb r2, [r1, r0]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blt _0201CA16
_0201CA3A:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp, #8]
	cmp r5, r0
	blt _0201CA06
_0201CA46:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end FillBgTilemapRectAffine

	thumb_func_start BgTilemapRectChangePalette
BgTilemapRectChangePalette: ; 0x0201CA4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x2c
	add r7, r1, #0
	mul r7, r0
	str r2, [sp]
	add r0, r5, r7
	ldr r4, [r0, #8]
	add r6, r3, #0
	cmp r4, #0
	beq _0201CAD8
	ldrb r0, [r0, #0x1d]
	add r1, sp, #0x10
	add r1, #1
	add r2, sp, #0x10
	bl GetBgScreenDimensions
	add r0, sp, #0x18
	ldrb r1, [r0, #0x14]
	add r1, r6, r1
	str r1, [sp, #4]
	cmp r6, r1
	bge _0201CAD8
	ldrb r1, [r0, #0x18]
	add r7, r5, r7
	lsl r1, r1, #0xc
	str r1, [sp, #0xc]
	ldrb r1, [r0, #0x10]
	ldr r0, [sp]
	add r0, r0, r1
	str r0, [sp, #8]
_0201CA8C:
	add r0, sp, #0x10
	ldrb r0, [r0]
	cmp r6, r0
	bhs _0201CAD8
	ldr r5, [sp]
	ldr r0, [sp, #8]
	add r1, r5, #0
	cmp r1, r0
	bge _0201CACC
_0201CA9E:
	add r0, sp, #0x10
	ldrb r0, [r0, #1]
	cmp r5, r0
	bhs _0201CACC
	ldrb r2, [r7, #0x1d]
	ldrb r3, [r7, #0x1c]
	add r0, r5, #0
	add r1, r6, #0
	bl GetTileMapIndexFromCoords
	lsl r0, r0, #1
	ldrh r2, [r4, r0]
	ldr r1, _0201CADC ; =0x00000FFF
	and r2, r1
	ldr r1, [sp, #0xc]
	orr r1, r2
	strh r1, [r4, r0]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp, #8]
	cmp r5, r0
	blt _0201CA9E
_0201CACC:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [sp, #4]
	cmp r6, r0
	blt _0201CA8C
_0201CAD8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0201CADC: .word 0x00000FFF
	thumb_func_end BgTilemapRectChangePalette

	thumb_func_start BgClearTilemapBufferAndCommit
BgClearTilemapBufferAndCommit: ; 0x0201CAE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x2c
	mul r0, r4
	add r2, r5, r0
	ldr r1, [r2, #8]
	cmp r1, #0
	beq _0201CB02
	ldr r2, [r2, #0xc]
	mov r0, #0
	bl MIi_CpuClear16
	add r0, r5, #0
	add r1, r4, #0
	bl BgCommitTilemapBufferToVram
_0201CB02:
	pop {r3, r4, r5, pc}
	thumb_func_end BgClearTilemapBufferAndCommit

	thumb_func_start BgFillTilemapBufferAndCommit
BgFillTilemapBufferAndCommit: ; 0x0201CB04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x2c
	mul r0, r4
	add r3, r5, r0
	ldr r1, [r3, #8]
	cmp r1, #0
	beq _0201CB26
	add r0, r2, #0
	ldr r2, [r3, #0xc]
	bl MIi_CpuClear16
	add r0, r5, #0
	add r1, r4, #0
	bl BgCommitTilemapBufferToVram
_0201CB26:
	pop {r3, r4, r5, pc}
	thumb_func_end BgFillTilemapBufferAndCommit

	thumb_func_start BgFillTilemapBufferAndSchedule
BgFillTilemapBufferAndSchedule: ; 0x0201CB28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x2c
	mul r0, r4
	add r3, r5, r0
	ldr r1, [r3, #8]
	cmp r1, #0
	beq _0201CB4A
	add r0, r2, #0
	ldr r2, [r3, #0xc]
	bl MIi_CpuClear16
	add r0, r5, #0
	add r1, r4, #0
	bl ScheduleBgTilemapBufferTransfer
_0201CB4A:
	pop {r3, r4, r5, pc}
	thumb_func_end BgFillTilemapBufferAndSchedule

	thumb_func_start BgGetCharPtr
BgGetCharPtr: ; 0x0201CB4C
	push {r3, lr}
	cmp r0, #7
	bhi _0201CB9E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201CB5E: ; jump table
	.short _0201CB6E - _0201CB5E - 2 ; case 0
	.short _0201CB74 - _0201CB5E - 2 ; case 1
	.short _0201CB7A - _0201CB5E - 2 ; case 2
	.short _0201CB80 - _0201CB5E - 2 ; case 3
	.short _0201CB86 - _0201CB5E - 2 ; case 4
	.short _0201CB8C - _0201CB5E - 2 ; case 5
	.short _0201CB92 - _0201CB5E - 2 ; case 6
	.short _0201CB98 - _0201CB5E - 2 ; case 7
_0201CB6E:
	bl G2_GetBG0CharPtr
	pop {r3, pc}
_0201CB74:
	bl G2_GetBG1CharPtr
	pop {r3, pc}
_0201CB7A:
	bl G2_GetBG2CharPtr
	pop {r3, pc}
_0201CB80:
	bl G2_GetBG3CharPtr
	pop {r3, pc}
_0201CB86:
	bl G2S_GetBG0CharPtr
	pop {r3, pc}
_0201CB8C:
	bl G2S_GetBG1CharPtr
	pop {r3, pc}
_0201CB92:
	bl G2S_GetBG2CharPtr
	pop {r3, pc}
_0201CB98:
	bl G2S_GetBG3CharPtr
	pop {r3, pc}
_0201CB9E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end BgGetCharPtr

	thumb_func_start Convert4bppTo8bppInternal
Convert4bppTo8bppInternal: ; 0x0201CBA4
	push {r4, r5, r6, r7}
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	mov r4, #0
	cmp r1, #0
	bls _0201CBDE
	mov r5, #0xf
	add r6, r5, #0
_0201CBB4:
	ldrb r7, [r0, r4]
	and r7, r6
	strb r7, [r2]
	ldrb r7, [r2]
	cmp r7, #0
	beq _0201CBC4
	add r7, r7, r3
	strb r7, [r2]
_0201CBC4:
	ldrb r7, [r0, r4]
	asr r7, r7, #4
	and r7, r5
	strb r7, [r2, #1]
	ldrb r7, [r2, #1]
	cmp r7, #0
	beq _0201CBD6
	add r7, r7, r3
	strb r7, [r2, #1]
_0201CBD6:
	add r4, r4, #1
	add r2, r2, #2
	cmp r4, r1
	blo _0201CBB4
_0201CBDE:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end Convert4bppTo8bppInternal

	thumb_func_start Convert4bppTo8bpp
Convert4bppTo8bpp: ; 0x0201CBE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r3, #0
	lsl r1, r5, #1
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl Convert4bppTo8bppInternal
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Convert4bppTo8bpp

	thumb_func_start GetBgTilemapBuffer
GetBgTilemapBuffer: ; 0x0201CC08
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #8]
	bx lr
	.balign 4, 0
	thumb_func_end GetBgTilemapBuffer

	thumb_func_start GetBgHOffset
GetBgHOffset: ; 0x0201CC14
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end GetBgHOffset

	thumb_func_start GetBgRotation
GetBgRotation: ; 0x0201CC20
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #0x1e]
	bx lr
	.balign 4, 0
	thumb_func_end GetBgRotation

	thumb_func_start GetBgPriority
GetBgPriority: ; 0x0201CC2C
	sub sp, #0x20
	cmp r1, #7
	bls _0201CC34
	b _0201CDE0
_0201CC34:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0201CC40: ; jump table
	.short _0201CC50 - _0201CC40 - 2 ; case 0
	.short _0201CC64 - _0201CC40 - 2 ; case 1
	.short _0201CC78 - _0201CC40 - 2 ; case 2
	.short _0201CCC8 - _0201CC40 - 2 ; case 3
	.short _0201CD18 - _0201CC40 - 2 ; case 4
	.short _0201CD2C - _0201CC40 - 2 ; case 5
	.short _0201CD40 - _0201CC40 - 2 ; case 6
	.short _0201CD90 - _0201CC40 - 2 ; case 7
_0201CC50:
	ldr r0, _0201CDE8 ; =0x04000008
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x1e]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CC64:
	ldr r0, _0201CDEC ; =0x0400000A
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x1c]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CC78:
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	beq _0201CC8C
	cmp r0, #1
	beq _0201CCA0
	cmp r0, #2
	beq _0201CCB4
_0201CC8C:
	ldr r0, _0201CDF0 ; =0x0400000C
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x1a]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CCA0:
	ldr r0, _0201CDF0 ; =0x0400000C
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x18]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CCB4:
	ldr r0, _0201CDF0 ; =0x0400000C
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x16]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CCC8:
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	beq _0201CCDC
	cmp r0, #1
	beq _0201CCF0
	cmp r0, #2
	beq _0201CD04
_0201CCDC:
	ldr r0, _0201CDF4 ; =0x0400000E
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x14]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CCF0:
	ldr r0, _0201CDF4 ; =0x0400000E
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x12]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CD04:
	ldr r0, _0201CDF4 ; =0x0400000E
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0x10]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CD18:
	ldr r0, _0201CDF8 ; =0x04001008
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0xe]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CD2C:
	ldr r0, _0201CDFC ; =0x0400100A
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0xc]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CD40:
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	beq _0201CD54
	cmp r0, #1
	beq _0201CD68
	cmp r0, #2
	beq _0201CD7C
_0201CD54:
	ldr r0, _0201CE00 ; =0x0400100C
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #0xa]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CD68:
	ldr r0, _0201CE00 ; =0x0400100C
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #8]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CD7C:
	ldr r0, _0201CE00 ; =0x0400100C
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #6]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CD90:
	mov r2, #0x2c
	mul r2, r1
	add r0, r0, r2
	ldrb r0, [r0, #0x1c]
	cmp r0, #0
	beq _0201CDA4
	cmp r0, #1
	beq _0201CDB8
	cmp r0, #2
	beq _0201CDCC
_0201CDA4:
	ldr r0, _0201CE04 ; =0x0400100E
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #4]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CDB8:
	ldr r0, _0201CE04 ; =0x0400100E
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0, #2]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CDCC:
	ldr r0, _0201CE04 ; =0x0400100E
	ldrh r1, [r0]
	add r0, sp, #0
	add sp, #0x20
	strh r1, [r0]
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_0201CDE0:
	mov r0, #0
	add sp, #0x20
	bx lr
	nop
_0201CDE8: .word 0x04000008
_0201CDEC: .word 0x0400000A
_0201CDF0: .word 0x0400000C
_0201CDF4: .word 0x0400000E
_0201CDF8: .word 0x04001008
_0201CDFC: .word 0x0400100A
_0201CE00: .word 0x0400100C
_0201CE04: .word 0x0400100E
	thumb_func_end GetBgPriority

	thumb_func_start BlitBitmapRect4Bit
BlitBitmapRect4Bit: ; 0x0201CE08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	add r2, sp, #0x70
	str r0, [sp]
	ldrh r0, [r2, #0x10]
	str r1, [sp, #4]
	ldrh r2, [r2, #0x18]
	str r0, [sp, #0x10]
	add r0, r1, #0
	ldrh r1, [r0, #4]
	ldr r0, [sp, #0x10]
	sub r3, r1, r0
	cmp r3, r2
	bge _0201CE30
	ldr r0, [sp, #8]
	add r0, r0, r3
	str r0, [sp, #0x50]
	b _0201CE36
_0201CE30:
	ldr r0, [sp, #8]
	add r0, r2, r0
	str r0, [sp, #0x50]
_0201CE36:
	ldr r2, [sp, #4]
	add r3, sp, #0x70
	ldrh r0, [r3, #0x14]
	ldrh r2, [r2, #6]
	ldrh r3, [r3, #0x1c]
	sub r4, r2, r0
	cmp r4, r3
	bge _0201CE4E
	ldr r2, [sp, #0xc]
	add r2, r2, r4
	str r2, [sp, #0x4c]
	b _0201CE54
_0201CE4E:
	ldr r2, [sp, #0xc]
	add r2, r3, r2
	str r2, [sp, #0x4c]
_0201CE54:
	ldr r2, [sp]
	mov r3, #7
	ldrh r4, [r2, #4]
	add r2, r4, #0
	and r2, r3
	add r2, r4, r2
	asr r2, r2, #3
	str r2, [sp, #0x48]
	add r2, r1, #0
	and r2, r3
	add r1, r1, r2
	asr r1, r1, #3
	str r1, [sp, #0x44]
	add r1, sp, #0x70
	ldrh r1, [r1, #0x20]
	ldr r2, _0201D040 ; =0x0000FFFF
	str r1, [sp, #0x38]
	cmp r1, r2
	bne _0201CF5C
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x4c]
	cmp r2, r1
	bge _0201CE86
	cmp r2, r1
	blt _0201CE88
_0201CE86:
	b _0201D03A
_0201CE88:
	add r1, r2, #0
	lsl r1, r1, #2
	lsl r0, r0, #2
	str r1, [sp, #0x28]
	str r0, [sp, #0x24]
_0201CE92:
	ldr r3, [sp, #8]
	ldr r0, [sp, #0x50]
	add r1, r3, #0
	ldr r4, [sp, #0x10]
	cmp r1, r0
	bge _0201CF3E
	cmp r1, r0
	bge _0201CF3E
	add r0, r3, #0
	lsl r5, r0, #2
	add r0, r4, #0
	lsl r6, r0, #2
	ldr r0, _0201D044 ; =0x00003FE0
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x48]
	and r1, r0
	mul r2, r1
	str r2, [sp, #0x20]
	ldr r2, [sp, #0x28]
	mov r1, #0x1c
	and r2, r1
	str r2, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	and r0, r2
	ldr r2, [sp, #0x44]
	mul r2, r0
	ldr r0, [sp, #0x24]
	str r2, [sp, #0x18]
	and r0, r1
	str r0, [sp, #0x14]
_0201CECE:
	ldr r0, [sp, #4]
	asr r2, r4, #1
	mov r1, #3
	ldr r0, [r0]
	and r1, r2
	add r1, r0, r1
	ldr r0, _0201D044 ; =0x00003FE0
	and r0, r6
	add r1, r1, r0
	ldr r0, [sp, #0x18]
	add r6, r6, #4
	add r0, r1, r0
	str r0, [sp, #0x64]
	lsl r0, r4, #0x1f
	lsr r2, r0, #0x1d
	ldr r0, [sp]
	asr r1, r3, #1
	ldr r7, [r0]
	mov r0, #3
	and r0, r1
	ldr r1, _0201D044 ; =0x00003FE0
	add r4, r4, #1
	and r1, r5
	str r1, [sp, #0x54]
	add r1, r7, r0
	ldr r0, [sp, #0x54]
	add r5, r5, #4
	add r1, r0, r1
	ldr r0, [sp, #0x20]
	add r1, r0, r1
	ldr r0, [sp, #0x1c]
	ldrb r1, [r0, r1]
	lsl r0, r3, #0x1f
	lsr r0, r0, #0x1d
	asr r1, r0
	mov r0, #0xf
	and r0, r1
	add r7, r0, #0
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x64]
	lsl r7, r2
	ldrb r0, [r0, r1]
	add r3, r3, #1
	str r0, [sp, #0x58]
	mov r0, #0xf0
	asr r0, r2
	ldr r1, [sp, #0x58]
	add r2, r7, #0
	and r0, r1
	orr r2, r0
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x64]
	strb r2, [r0, r1]
	ldr r0, [sp, #0x50]
	cmp r3, r0
	blt _0201CECE
_0201CF3E:
	ldr r0, [sp, #0x28]
	add r0, r0, #4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0xc]
	add r0, r0, #4
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x4c]
	cmp r1, r0
	blt _0201CE92
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
_0201CF5C:
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x4c]
	cmp r2, r1
	bge _0201D03A
	cmp r2, r1
	bge _0201D03A
	add r1, r2, #0
	lsl r1, r1, #2
	lsl r0, r0, #2
	str r1, [sp, #0x40]
	str r0, [sp, #0x3c]
_0201CF72:
	ldr r3, [sp, #8]
	ldr r0, [sp, #0x50]
	add r1, r3, #0
	ldr r4, [sp, #0x10]
	cmp r1, r0
	bge _0201D020
	cmp r1, r0
	bge _0201D020
	add r0, r3, #0
	lsl r1, r0, #2
	add r0, r4, #0
	lsl r2, r0, #2
	ldr r0, _0201D044 ; =0x00003FE0
	ldr r5, [sp, #0x40]
	ldr r6, [sp, #0x48]
	and r5, r0
	mul r6, r5
	str r6, [sp, #0x34]
	ldr r6, [sp, #0x40]
	mov r5, #0x1c
	and r6, r5
	str r6, [sp, #0x30]
	ldr r6, [sp, #0x3c]
	and r0, r6
	ldr r6, [sp, #0x44]
	mul r6, r0
	ldr r0, [sp, #0x3c]
	str r6, [sp, #0x2c]
	and r0, r5
	str r0, [sp, #0x60]
_0201CFAE:
	ldr r0, [sp, #4]
	asr r6, r4, #1
	mov r5, #3
	and r5, r6
	ldr r0, [r0]
	asr r6, r3, #1
	add r5, r0, r5
	ldr r0, _0201D044 ; =0x00003FE0
	and r0, r2
	add r5, r5, r0
	ldr r0, [sp, #0x2c]
	add r5, r5, r0
	ldr r0, [sp]
	ldr r7, [r0]
	mov r0, #3
	and r0, r6
	ldr r6, _0201D044 ; =0x00003FE0
	and r6, r1
	str r6, [sp, #0x5c]
	add r6, r7, r0
	ldr r0, [sp, #0x5c]
	add r6, r0, r6
	ldr r0, [sp, #0x34]
	add r6, r0, r6
	ldr r0, [sp, #0x30]
	ldrb r6, [r0, r6]
	lsl r0, r3, #0x1f
	lsr r0, r0, #0x1d
	asr r6, r0
	mov r0, #0xf
	and r0, r6
	ldr r6, [sp, #0x38]
	cmp r0, r6
	beq _0201D012
	lsl r6, r4, #0x1f
	lsr r7, r6, #0x1d
	lsl r0, r7
	mov lr, r0
	ldr r0, [sp, #0x60]
	ldrb r0, [r5, r0]
	mov ip, r0
	mov r0, #0xf0
	add r6, r0, #0
	asr r6, r7
	mov r0, ip
	and r0, r6
	mov r6, lr
	orr r6, r0
	ldr r0, [sp, #0x60]
	strb r6, [r5, r0]
_0201D012:
	ldr r0, [sp, #0x50]
	add r3, r3, #1
	add r1, r1, #4
	add r2, r2, #4
	add r4, r4, #1
	cmp r3, r0
	blt _0201CFAE
_0201D020:
	ldr r0, [sp, #0x40]
	add r0, r0, #4
	str r0, [sp, #0x40]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0xc]
	add r0, r0, #4
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x4c]
	cmp r1, r0
	blt _0201CF72
_0201D03A:
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0201D040: .word 0x0000FFFF
_0201D044: .word 0x00003FE0
	thumb_func_end BlitBitmapRect4Bit

	thumb_func_start BlitBitmapRect8bit
BlitBitmapRect8bit: ; 0x0201D048
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	add r2, sp, #0x58
	str r0, [sp]
	ldrh r0, [r2, #0x10]
	str r1, [sp, #4]
	ldrh r2, [r2, #0x18]
	str r0, [sp, #0x10]
	add r0, r1, #0
	ldrh r1, [r0, #4]
	ldr r0, [sp, #0x10]
	sub r3, r1, r0
	cmp r3, r2
	bge _0201D06E
	ldr r0, [sp, #8]
	add r0, r0, r3
	b _0201D072
_0201D06E:
	ldr r0, [sp, #8]
	add r0, r2, r0
_0201D072:
	ldr r2, [sp, #4]
	add r3, sp, #0x58
	mov ip, r0
	ldrh r0, [r3, #0x14]
	ldrh r2, [r2, #6]
	ldrh r3, [r3, #0x1c]
	sub r4, r2, r0
	cmp r4, r3
	bge _0201D08A
	ldr r2, [sp, #0xc]
	add r2, r2, r4
	b _0201D08E
_0201D08A:
	ldr r2, [sp, #0xc]
	add r2, r3, r2
_0201D08E:
	mov lr, r2
	ldr r2, [sp]
	mov r3, #7
	ldrh r4, [r2, #4]
	add r2, r4, #0
	and r2, r3
	add r2, r4, r2
	asr r2, r2, #3
	str r2, [sp, #0x4c]
	add r2, r1, #0
	and r2, r3
	add r1, r1, r2
	asr r1, r1, #3
	str r1, [sp, #0x48]
	add r1, sp, #0x58
	ldrh r1, [r1, #0x20]
	ldr r2, _0201D228 ; =0x0000FFFF
	str r1, [sp, #0x3c]
	cmp r1, r2
	bne _0201D16E
	ldr r2, [sp, #0xc]
	mov r1, lr
	cmp r2, r1
	bge _0201D0C4
	mov r1, lr
	cmp r2, r1
	blt _0201D0C6
_0201D0C4:
	b _0201D224
_0201D0C6:
	add r1, r2, #0
	lsl r1, r1, #3
	lsl r0, r0, #3
	str r1, [sp, #0x28]
	str r0, [sp, #0x24]
_0201D0D0:
	ldr r1, [sp, #8]
	mov r0, ip
	add r2, r1, #0
	ldr r7, [sp, #0x10]
	cmp r2, r0
	bge _0201D150
	mov r0, ip
	cmp r2, r0
	bge _0201D150
	add r0, r1, #0
	lsl r2, r0, #3
	add r0, r7, #0
	lsl r3, r0, #3
	ldr r6, _0201D22C ; =0x00007FC0
	ldr r0, [sp, #0x28]
	ldr r4, [sp, #0x4c]
	and r0, r6
	mul r4, r0
	str r4, [sp, #0x20]
	ldr r0, [sp, #0x28]
	mov r5, #0x38
	and r0, r5
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	ldr r4, [sp, #0x48]
	and r0, r6
	mul r4, r0
	ldr r0, [sp, #0x24]
	str r4, [sp, #0x18]
	and r0, r5
	str r0, [sp, #0x14]
_0201D10E:
	ldr r0, [sp]
	add r5, r1, #0
	mov r4, #7
	and r5, r4
	ldr r0, [r0]
	ldr r4, _0201D22C ; =0x00007FC0
	add r0, r0, r5
	and r4, r2
	add r4, r4, r0
	ldr r0, [sp, #0x20]
	add r5, r7, #0
	add r4, r0, r4
	ldr r0, [sp, #0x1c]
	add r1, r1, #1
	ldrb r6, [r0, r4]
	ldr r0, [sp, #4]
	mov r4, #7
	and r5, r4
	ldr r0, [r0]
	ldr r4, _0201D22C ; =0x00007FC0
	add r0, r0, r5
	and r4, r3
	add r4, r4, r0
	ldr r0, [sp, #0x18]
	add r2, #8
	add r4, r0, r4
	ldr r0, [sp, #0x14]
	add r3, #8
	strb r6, [r0, r4]
	mov r0, ip
	add r7, r7, #1
	cmp r1, r0
	blt _0201D10E
_0201D150:
	ldr r0, [sp, #0x28]
	add r0, #8
	str r0, [sp, #0x28]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0xc]
	add r0, #8
	str r0, [sp, #0x24]
	mov r0, lr
	cmp r1, r0
	blt _0201D0D0
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
_0201D16E:
	ldr r2, [sp, #0xc]
	mov r1, lr
	cmp r2, r1
	bge _0201D224
	mov r1, lr
	cmp r2, r1
	bge _0201D224
	add r1, r2, #0
	lsl r1, r1, #3
	lsl r0, r0, #3
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
_0201D186:
	ldr r2, [sp, #8]
	mov r0, ip
	add r1, r2, #0
	ldr r3, [sp, #0x10]
	cmp r1, r0
	bge _0201D20A
	mov r0, ip
	cmp r1, r0
	bge _0201D20A
	add r0, r2, #0
	lsl r6, r0, #3
	add r0, r3, #0
	lsl r1, r0, #3
	ldr r7, _0201D22C ; =0x00007FC0
	ldr r0, [sp, #0x44]
	ldr r4, [sp, #0x4c]
	and r0, r7
	mul r4, r0
	str r4, [sp, #0x38]
	ldr r0, [sp, #0x44]
	mov r5, #0x38
	and r0, r5
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x40]
	ldr r4, [sp, #0x48]
	and r0, r7
	mul r4, r0
	ldr r0, [sp, #0x40]
	str r4, [sp, #0x30]
	and r0, r5
	str r0, [sp, #0x2c]
_0201D1C4:
	ldr r0, [sp, #4]
	mov r4, #7
	ldr r0, [r0]
	and r4, r3
	add r0, r0, r4
	ldr r4, _0201D22C ; =0x00007FC0
	add r5, r2, #0
	and r4, r1
	add r4, r0, r4
	ldr r0, [sp, #0x30]
	add r7, r4, r0
	ldr r0, [sp]
	mov r4, #7
	and r5, r4
	ldr r0, [r0]
	ldr r4, _0201D22C ; =0x00007FC0
	add r0, r0, r5
	and r4, r6
	add r4, r4, r0
	ldr r0, [sp, #0x38]
	add r4, r0, r4
	ldr r0, [sp, #0x34]
	ldrb r0, [r0, r4]
	ldr r4, [sp, #0x3c]
	cmp r0, r4
	beq _0201D1FC
	ldr r4, [sp, #0x2c]
	strb r0, [r7, r4]
_0201D1FC:
	add r2, r2, #1
	mov r0, ip
	add r6, #8
	add r1, #8
	add r3, r3, #1
	cmp r2, r0
	blt _0201D1C4
_0201D20A:
	ldr r0, [sp, #0x44]
	add r0, #8
	str r0, [sp, #0x44]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0xc]
	add r0, #8
	str r0, [sp, #0x40]
	mov r0, lr
	cmp r1, r0
	blt _0201D186
_0201D224:
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201D228: .word 0x0000FFFF
_0201D22C: .word 0x00007FC0
	thumb_func_end BlitBitmapRect8bit

	thumb_func_start FillBitmapRect4bit
FillBitmapRect4bit: ; 0x0201D230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #4]
	add r6, r0, r3
	ldr r0, [sp]
	ldrh r0, [r0, #4]
	cmp r6, r0
	ble _0201D24C
	add r6, r0, #0
_0201D24C:
	add r1, sp, #0x18
	ldrh r2, [r1, #0x10]
	ldr r1, [sp, #8]
	add r1, r1, r2
	mov ip, r1
	ldr r1, [sp]
	ldrh r2, [r1, #6]
	mov r1, ip
	cmp r1, r2
	ble _0201D262
	mov ip, r2
_0201D262:
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	mov lr, r0
	ldr r1, [sp, #8]
	mov r0, ip
	cmp r1, r0
	bge _0201D2EC
	add r0, r1, #0
	lsl r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	lsl r0, r0, #4
	str r0, [sp, #0x10]
_0201D280:
	ldr r1, [sp, #4]
	add r0, r1, #0
	cmp r0, r6
	bge _0201D2DA
	lsl r5, r0, #2
	ldr r2, _0201D2F0 ; =0x00003FE0
	ldr r0, [sp, #0xc]
	and r0, r2
	add r7, r0, #0
	mov r2, lr
	mul r7, r2
	ldr r0, [sp, #0xc]
	mov r2, #0x1c
	and r2, r0
_0201D29C:
	ldr r0, [sp]
	asr r3, r1, #1
	ldr r4, [r0]
	mov r0, #3
	and r0, r3
	ldr r3, _0201D2F0 ; =0x00003FE0
	add r0, r4, r0
	and r3, r5
	add r0, r0, r3
	add r0, r0, r7
	mov r3, #1
	tst r3, r1
	ldrb r4, [r0, r2]
	beq _0201D2C4
	mov r3, #0xf
	and r3, r4
	strb r3, [r0, r2]
	ldrb r4, [r0, r2]
	ldr r3, [sp, #0x10]
	b _0201D2CE
_0201D2C4:
	mov r3, #0xf0
	and r3, r4
	strb r3, [r0, r2]
	ldrb r4, [r0, r2]
	ldr r3, [sp, #0x2c]
_0201D2CE:
	orr r3, r4
	add r1, r1, #1
	strb r3, [r0, r2]
	add r5, r5, #4
	cmp r1, r6
	blt _0201D29C
_0201D2DA:
	ldr r0, [sp, #0xc]
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r1, r0, #1
	mov r0, ip
	str r1, [sp, #8]
	cmp r1, r0
	blt _0201D280
_0201D2EC:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0201D2F0: .word 0x00003FE0
	thumb_func_end FillBitmapRect4bit

	thumb_func_start FillBitmapRect8bit
FillBitmapRect8bit: ; 0x0201D2F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #4]
	add r5, r0, r3
	ldr r0, [sp]
	ldrh r0, [r0, #4]
	cmp r5, r0
	ble _0201D310
	add r5, r0, #0
_0201D310:
	add r1, sp, #0x18
	ldrh r2, [r1, #0x10]
	ldr r1, [sp, #8]
	add r1, r1, r2
	mov lr, r1
	ldr r1, [sp]
	ldrh r2, [r1, #6]
	mov r1, lr
	cmp r1, r2
	ble _0201D326
	mov lr, r2
_0201D326:
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x10]
	ldr r1, [sp, #8]
	mov r0, lr
	cmp r1, r0
	bge _0201D392
	add r0, r1, #0
	lsl r0, r0, #3
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	lsl r0, r0, #3
	mov ip, r0
_0201D344:
	ldr r2, [sp, #4]
	add r0, r2, #0
	cmp r0, r5
	bge _0201D380
	ldr r1, [sp, #0xc]
	ldr r0, _0201D398 ; =0x00007FC0
	mov r3, ip
	and r0, r1
	add r7, r0, #0
	ldr r1, [sp, #0x10]
	mov r0, #0x38
	mul r7, r1
	ldr r1, [sp, #0xc]
	add r6, r1, #0
	and r6, r0
_0201D362:
	ldr r0, [sp]
	ldr r4, _0201D398 ; =0x00007FC0
	ldr r1, [r0]
	mov r0, #7
	and r0, r2
	and r4, r3
	add r0, r1, r0
	add r0, r4, r0
	add r1, r7, r0
	ldr r0, [sp, #0x2c]
	add r2, r2, #1
	strb r0, [r6, r1]
	add r3, #8
	cmp r2, r5
	blt _0201D362
_0201D380:
	ldr r0, [sp, #0xc]
	add r0, #8
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r1, r0, #1
	mov r0, lr
	str r1, [sp, #8]
	cmp r1, r0
	blt _0201D344
_0201D392:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0201D398: .word 0x00007FC0
	thumb_func_end FillBitmapRect8bit

	thumb_func_start AllocWindows
AllocWindows: ; 0x0201D39C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	lsl r1, r5, #4
	bl AllocFromHeap
	add r6, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _0201D3C0
_0201D3AE:
	lsl r0, r4, #4
	add r0, r6, r0
	bl InitWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r5
	blt _0201D3AE
_0201D3C0:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end AllocWindows

	thumb_func_start InitWindow
InitWindow: ; 0x0201D3C4
	mov r3, #0
	str r3, [r0]
	mov r1, #0xff
	strb r1, [r0, #4]
	strb r3, [r0, #5]
	strb r3, [r0, #6]
	strb r3, [r0, #7]
	strb r3, [r0, #8]
	strb r3, [r0, #9]
	ldrh r2, [r0, #0xa]
	ldr r1, _0201D3EC ; =0xFFFF8000
	and r2, r1
	strh r2, [r0, #0xa]
	str r3, [r0, #0xc]
	ldrh r2, [r0, #0xa]
	sub r1, r1, #1
	and r1, r2
	strh r1, [r0, #0xa]
	bx lr
	nop
_0201D3EC: .word 0xFFFF8000
	thumb_func_end InitWindow

	thumb_func_start WindowIsInUse
WindowIsInUse: ; 0x0201D3F0
	ldr r1, [r0]
	cmp r1, #0
	beq _0201D402
	ldrb r1, [r0, #4]
	cmp r1, #0xff
	beq _0201D402
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _0201D406
_0201D402:
	mov r0, #0
	bx lr
_0201D406:
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end WindowIsInUse

	thumb_func_start AddWindowParameterized
AddWindowParameterized: ; 0x0201D40C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r5, r0, #0
	mov r0, #0x2c
	add r7, r6, #0
	mul r7, r0
	add r4, r1, #0
	str r3, [sp]
	add r1, r5, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0201D488
	add r3, sp, #8
	ldrb r2, [r1, #0x1f]
	ldrb r1, [r3, #0x14]
	ldrb r3, [r3, #0x18]
	ldr r0, [r5]
	mul r3, r1
	add r1, r2, #0
	mul r1, r3
	bl AllocFromHeap
	add r1, r0, #0
	beq _0201D488
	str r5, [r4]
	strb r6, [r4, #4]
	ldr r0, [sp]
	add r3, sp, #8
	strb r0, [r4, #5]
	ldrb r0, [r3, #0x10]
	ldr r2, _0201D48C ; =0xFFFF8000
	strb r0, [r4, #6]
	ldrb r0, [r3, #0x14]
	strb r0, [r4, #7]
	ldrb r0, [r3, #0x18]
	strb r0, [r4, #8]
	ldrb r0, [r3, #0x1c]
	strb r0, [r4, #9]
	ldrh r0, [r4, #0xa]
	ldrh r3, [r3, #0x20]
	and r0, r2
	lsr r2, r2, #0x11
	and r2, r3
	orr r0, r2
	strh r0, [r4, #0xa]
	str r1, [r4, #0xc]
	add r0, r5, r7
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	bne _0201D474
	mov r2, #0
	b _0201D476
_0201D474:
	mov r2, #1
_0201D476:
	ldrh r1, [r4, #0xa]
	ldr r0, _0201D490 ; =0xFFFF7FFF
	and r1, r0
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r4, #0xa]
_0201D488:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0201D48C: .word 0xFFFF8000
_0201D490: .word 0xFFFF7FFF
	thumb_func_end AddWindowParameterized

	thumb_func_start AddTextWindowTopLeftCorner
AddTextWindowTopLeftCorner: ; 0x0201D494
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r3, [sp]
	add r5, r0, #0
	ldr r0, [sp, #0x24]
	add r6, r2, #0
	str r0, [sp, #0x24]
	ldr r0, [sp]
	add r4, r1, #0
	mul r0, r6
	lsl r0, r0, #5
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r1, [sp, #4]
	bl AllocFromHeap
	ldr r1, [sp, #0x24]
	add r7, r0, #0
	lsl r2, r1, #4
	orr r1, r2
	lsl r1, r1, #0x18
	ldr r2, [sp, #4]
	lsr r1, r1, #0x18
	bl memset
	cmp r7, #0
	beq _0201D4F0
	str r5, [r4]
	strb r6, [r4, #7]
	ldr r0, [sp]
	strb r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	ldr r0, _0201D4F4 ; =0xFFFF8000
	add r3, r1, #0
	add r1, sp, #0x10
	ldrh r2, [r1, #0x10]
	lsr r1, r0, #0x11
	and r3, r0
	and r1, r2
	orr r1, r3
	strh r1, [r4, #0xa]
	str r7, [r4, #0xc]
	ldrh r1, [r4, #0xa]
	sub r0, r0, #1
	and r0, r1
	strh r0, [r4, #0xa]
_0201D4F0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201D4F4: .word 0xFFFF8000
	thumb_func_end AddTextWindowTopLeftCorner

	thumb_func_start AddWindow
AddWindow: ; 0x0201D4F8
	push {lr}
	sub sp, #0x14
	add r3, r2, #0
	ldrb r2, [r3, #2]
	str r2, [sp]
	ldrb r2, [r3, #3]
	str r2, [sp, #4]
	ldrb r2, [r3, #4]
	str r2, [sp, #8]
	ldrb r2, [r3, #5]
	str r2, [sp, #0xc]
	ldrh r2, [r3, #6]
	str r2, [sp, #0x10]
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	bl AddWindowParameterized
	add sp, #0x14
	pop {pc}
	.balign 4, 0
	thumb_func_end AddWindow

	thumb_func_start RemoveWindow
RemoveWindow: ; 0x0201D520
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	mov r2, #0
	str r2, [r4]
	mov r0, #0xff
	strb r0, [r4, #4]
	strb r2, [r4, #5]
	strb r2, [r4, #6]
	strb r2, [r4, #7]
	strb r2, [r4, #8]
	strb r2, [r4, #9]
	ldrh r1, [r4, #0xa]
	ldr r0, _0201D548 ; =0xFFFF8000
	and r0, r1
	strh r0, [r4, #0xa]
	str r2, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
_0201D548: .word 0xFFFF8000
	thumb_func_end RemoveWindow

	thumb_func_start WindowArray_dtor
WindowArray_dtor: ; 0x0201D54C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _0201D570
_0201D558:
	lsl r0, r4, #4
	add r0, r5, r0
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0201D566
	bl FreeToHeap
_0201D566:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r6
	blt _0201D558
_0201D570:
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end WindowArray_dtor

	thumb_func_start CopyWindowToVram
CopyWindowToVram: ; 0x0201D578
	push {r4, lr}
	add r4, r0, #0
	bne _0201D582
	bl GF_AssertFail
_0201D582:
	ldr r0, [r4]
	cmp r0, #0
	bne _0201D58C
	bl GF_AssertFail
_0201D58C:
	ldrb r0, [r4, #4]
	cmp r0, #8
	blo _0201D596
	bl GF_AssertFail
_0201D596:
	ldrb r1, [r4, #4]
	mov r0, #0x2c
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	ldrb r0, [r0, #0x1c]
	cmp r0, #3
	blo _0201D5AA
	bl GF_AssertFail
_0201D5AA:
	ldrb r2, [r4, #4]
	mov r1, #0x2c
	ldr r3, [r4]
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0x1c]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _0201D5C4 ; =sCopyWindowToVramFuncs
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0201D5C4: .word sCopyWindowToVramFuncs
	thumb_func_end CopyWindowToVram

	thumb_func_start ScheduleWindowCopyToVram
ScheduleWindowCopyToVram: ; 0x0201D5C8
	push {r4, lr}
	add r4, r0, #0
	bne _0201D5D2
	bl GF_AssertFail
_0201D5D2:
	ldr r0, [r4]
	cmp r0, #0
	bne _0201D5DC
	bl GF_AssertFail
_0201D5DC:
	ldrb r0, [r4, #4]
	cmp r0, #8
	blo _0201D5E6
	bl GF_AssertFail
_0201D5E6:
	ldrb r1, [r4, #4]
	mov r0, #0x2c
	ldr r2, [r4]
	mul r0, r1
	add r0, r2, r0
	ldrb r0, [r0, #0x1c]
	cmp r0, #3
	blo _0201D5FA
	bl GF_AssertFail
_0201D5FA:
	ldrb r2, [r4, #4]
	mov r1, #0x2c
	ldr r3, [r4]
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0x1c]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _0201D614 ; =sScheduleWindowCopyToVramFuncs
	ldr r1, [r1, r2]
	blx r1
	pop {r4, pc}
	nop
_0201D614: .word sScheduleWindowCopyToVramFuncs
	thumb_func_end ScheduleWindowCopyToVram

	thumb_func_start PutWindowTilemap
PutWindowTilemap: ; 0x0201D618
	push {r3, lr}
	ldrb r2, [r0, #4]
	mov r1, #0x2c
	ldr r3, [r0]
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0x1c]
	lsl r2, r1, #2
	ldr r1, _0201D630 ; =sPutWindowTilemapFuncs
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_0201D630: .word sPutWindowTilemapFuncs
	thumb_func_end PutWindowTilemap

	thumb_func_start ClearWindowTilemap
ClearWindowTilemap: ; 0x0201D634
	push {r3, lr}
	ldrb r2, [r0, #4]
	mov r1, #0x2c
	ldr r3, [r0]
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0x1c]
	lsl r2, r1, #2
	ldr r1, _0201D64C ; =sClearWindowTilemapFuncs
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_0201D64C: .word sClearWindowTilemapFuncs
	thumb_func_end ClearWindowTilemap

	thumb_func_start PutWindowTilemap_TextMode
PutWindowTilemap_TextMode: ; 0x0201D650
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldrb r1, [r6, #4]
	mov r0, #0x2c
	ldr r2, [r6]
	mul r0, r1
	add r0, r2, r0
	ldr r0, [r0, #8]
	str r0, [sp]
	cmp r0, #0
	beq _0201D6CA
	ldrh r0, [r6, #0xa]
	ldrb r1, [r6, #5]
	lsl r0, r0, #0x11
	lsr r5, r0, #0x11
	ldrb r0, [r6, #7]
	add r7, r1, r0
	ldrb r0, [r6, #6]
	ldrb r1, [r6, #8]
	str r0, [sp, #8]
	add r0, r0, r1
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	cmp r1, r0
	bhs _0201D6CA
_0201D684:
	ldrb r4, [r6, #5]
	cmp r4, r7
	bhs _0201D6BE
	ldr r0, [sp, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
_0201D692:
	ldrb r2, [r6, #4]
	mov r1, #0x2c
	ldr r0, [r6]
	mul r1, r2
	add r3, r0, r1
	ldrb r2, [r3, #0x1d]
	lsl r0, r4, #0x18
	ldrb r3, [r3, #0x1c]
	ldr r1, [sp, #0xc]
	lsr r0, r0, #0x18
	bl GetTileMapIndexFromCoords
	ldrb r1, [r6, #9]
	lsl r2, r0, #1
	ldr r0, [sp]
	lsl r1, r1, #0xc
	orr r1, r5
	add r4, r4, #1
	strh r1, [r0, r2]
	add r5, r5, #1
	cmp r4, r7
	blo _0201D692
_0201D6BE:
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blo _0201D684
_0201D6CA:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PutWindowTilemap_TextMode

	thumb_func_start PutWindowTilemap_AffineMode
PutWindowTilemap_AffineMode: ; 0x0201D6D0
	push {r4, r5, r6, r7}
	ldrb r3, [r0, #4]
	mov r1, #0x2c
	add r2, r3, #0
	mul r2, r1
	ldr r1, [r0]
	add r1, r1, r2
	ldr r3, [r1, #8]
	cmp r3, #0
	beq _0201D724
	ldrb r2, [r1, #0x1d]
	ldr r1, _0201D728 ; =sTilemapWidthByBufferSize
	ldrb r6, [r1, r2]
	ldrb r1, [r0, #6]
	add r2, r1, #0
	mul r2, r6
	add r2, r3, r2
	ldrb r1, [r0, #5]
	mov r3, #0
	add r4, r2, r1
	ldrh r1, [r0, #0xa]
	lsl r1, r1, #0x11
	lsr r5, r1, #0x11
	ldrb r1, [r0, #8]
	cmp r1, #0
	ble _0201D724
	add r1, r3, #0
_0201D706:
	ldrb r7, [r0, #7]
	add r2, r1, #0
	cmp r7, #0
	ble _0201D71A
_0201D70E:
	strb r5, [r4, r2]
	ldrb r7, [r0, #7]
	add r2, r2, #1
	add r5, r5, #1
	cmp r2, r7
	blt _0201D70E
_0201D71A:
	ldrb r2, [r0, #8]
	add r3, r3, #1
	add r4, r4, r6
	cmp r3, r2
	blt _0201D706
_0201D724:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0201D728: .word sTilemapWidthByBufferSize
	thumb_func_end PutWindowTilemap_AffineMode

	thumb_func_start ClearWindowTilemapText
ClearWindowTilemapText: ; 0x0201D72C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r1, [r5, #4]
	mov r0, #0x2c
	ldr r2, [r5]
	mul r0, r1
	add r0, r2, r0
	ldr r0, [r0, #8]
	str r0, [sp]
	cmp r0, #0
	beq _0201D798
	ldrb r1, [r5, #5]
	ldrb r0, [r5, #7]
	add r6, r1, r0
	ldrb r0, [r5, #6]
	ldrb r1, [r5, #8]
	str r0, [sp, #8]
	add r0, r0, r1
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	cmp r1, r0
	bhs _0201D798
_0201D75A:
	ldrb r4, [r5, #5]
	cmp r4, r6
	bhs _0201D78C
	ldr r0, [sp, #8]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_0201D766:
	ldrb r2, [r5, #4]
	mov r1, #0x2c
	ldr r0, [r5]
	mul r1, r2
	add r3, r0, r1
	ldrb r2, [r3, #0x1d]
	lsl r0, r4, #0x18
	ldrb r3, [r3, #0x1c]
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl GetTileMapIndexFromCoords
	lsl r2, r0, #1
	ldr r0, [sp]
	mov r1, #0
	add r4, r4, #1
	strh r1, [r0, r2]
	cmp r4, r6
	blo _0201D766
_0201D78C:
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blo _0201D75A
_0201D798:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ClearWindowTilemapText

	thumb_func_start ClearWindowTilemapAffine
ClearWindowTilemapAffine: ; 0x0201D79C
	push {r4, r5, r6, r7}
	ldrb r3, [r0, #4]
	mov r1, #0x2c
	add r2, r3, #0
	mul r2, r1
	ldr r1, [r0]
	add r1, r1, r2
	ldr r3, [r1, #8]
	cmp r3, #0
	beq _0201D7EA
	ldrb r2, [r1, #0x1d]
	ldr r1, _0201D7F0 ; =sTilemapWidthByBufferSize
	mov r4, #0
	ldrb r6, [r1, r2]
	ldrb r1, [r0, #6]
	add r2, r1, #0
	mul r2, r6
	ldrb r1, [r0, #5]
	add r2, r3, r2
	add r5, r2, r1
	ldrb r1, [r0, #8]
	cmp r1, #0
	ble _0201D7EA
	add r1, r4, #0
	add r2, r4, #0
_0201D7CE:
	ldrb r7, [r0, #7]
	add r3, r2, #0
	cmp r7, #0
	ble _0201D7E0
_0201D7D6:
	strb r1, [r5, r3]
	ldrb r7, [r0, #7]
	add r3, r3, #1
	cmp r3, r7
	blt _0201D7D6
_0201D7E0:
	ldrb r3, [r0, #8]
	add r4, r4, #1
	add r5, r5, r6
	cmp r4, r3
	blt _0201D7CE
_0201D7EA:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0201D7F0: .word sTilemapWidthByBufferSize
	thumb_func_end ClearWindowTilemapAffine

	thumb_func_start CopyWindowToVram_TextMode
CopyWindowToVram_TextMode: ; 0x0201D7F4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl PutWindowTilemap_TextMode
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	ldrb r1, [r4, #4]
	mov r0, #0x2c
	add r2, r1, #0
	mul r2, r0
	ldr r0, [r4]
	add r3, r0, r2
	ldr r2, [r3, #0x10]
	str r2, [sp]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end CopyWindowToVram_TextMode

	thumb_func_start ScheduleWindowCopyToVram_TextMode
ScheduleWindowCopyToVram_TextMode: ; 0x0201D820
	push {r4, lr}
	add r4, r0, #0
	bl PutWindowTilemap_TextMode
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	bl CopyWindowPixelsToVram_TextMode
	pop {r4, pc}
	thumb_func_end ScheduleWindowCopyToVram_TextMode

	thumb_func_start CopyWindowToVram_AffineMode
CopyWindowToVram_AffineMode: ; 0x0201D838
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl PutWindowTilemap_AffineMode
	ldrb r1, [r4, #4]
	mov r0, #0x2c
	add r2, r1, #0
	mul r2, r0
	ldr r0, [r4]
	add r3, r0, r2
	ldr r2, [r3, #0x10]
	str r2, [sp]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	ldrh r0, [r4, #0xa]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x11
	str r0, [sp]
	ldrb r5, [r4, #7]
	ldrb r3, [r4, #8]
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	mul r3, r5
	ldr r2, [r4, #0xc]
	lsl r3, r3, #6
	bl BG_LoadCharTilesData
	pop {r3, r4, r5, pc}
	thumb_func_end CopyWindowToVram_AffineMode

	thumb_func_start ScheduleWindowCopyToVram_AffineMode
ScheduleWindowCopyToVram_AffineMode: ; 0x0201D874
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl PutWindowTilemap_AffineMode
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	bl ScheduleBgTilemapBufferTransfer
	ldrh r0, [r4, #0xa]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x11
	str r0, [sp]
	ldrb r5, [r4, #7]
	ldrb r3, [r4, #8]
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	mul r3, r5
	ldr r2, [r4, #0xc]
	lsl r3, r3, #6
	bl BG_LoadCharTilesData
	pop {r3, r4, r5, pc}
	thumb_func_end ScheduleWindowCopyToVram_AffineMode

	thumb_func_start CopyWindowPixelsToVram_TextMode
CopyWindowPixelsToVram_TextMode: ; 0x0201D8A0
	push {r3, r4, r5, lr}
	add r3, r0, #0
	ldrh r2, [r3, #0xa]
	ldrb r1, [r3, #4]
	mov r4, #0x2c
	lsl r2, r2, #0x11
	ldr r0, [r3]
	lsr r2, r2, #0x11
	str r2, [sp]
	mul r4, r1
	add r4, r0, r4
	ldr r2, [r3, #0xc]
	ldrb r5, [r3, #7]
	ldrb r3, [r3, #8]
	ldrb r4, [r4, #0x1f]
	mul r3, r5
	mul r3, r4
	bl BG_LoadCharTilesData
	pop {r3, r4, r5, pc}
	thumb_func_end CopyWindowPixelsToVram_TextMode

	thumb_func_start ClearWindowTilemapAndCopyToVram
ClearWindowTilemapAndCopyToVram: ; 0x0201D8C8
	push {r3, lr}
	ldrb r2, [r0, #4]
	mov r1, #0x2c
	ldr r3, [r0]
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0x1c]
	lsl r2, r1, #2
	ldr r1, _0201D8E0 ; =sClearWindowTilemapAndCopyToVramFuncs
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_0201D8E0: .word sClearWindowTilemapAndCopyToVramFuncs
	thumb_func_end ClearWindowTilemapAndCopyToVram

	thumb_func_start ClearWindowTilemapAndScheduleTransfer
ClearWindowTilemapAndScheduleTransfer: ; 0x0201D8E4
	push {r3, lr}
	ldrb r2, [r0, #4]
	mov r1, #0x2c
	ldr r3, [r0]
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0x1c]
	lsl r2, r1, #2
	ldr r1, _0201D8FC ; =sClearWindowTilemapAndScheduleTransferFuncs
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_0201D8FC: .word sClearWindowTilemapAndScheduleTransferFuncs
	thumb_func_end ClearWindowTilemapAndScheduleTransfer

	thumb_func_start ClearWindowTilemapAndCopyToVram_TextMode
ClearWindowTilemapAndCopyToVram_TextMode: ; 0x0201D900
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ClearWindowTilemapText
	ldrb r1, [r4, #4]
	mov r0, #0x2c
	add r2, r1, #0
	mul r2, r0
	ldr r0, [r4]
	add r3, r0, r2
	ldr r2, [r3, #0x10]
	str r2, [sp]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ClearWindowTilemapAndCopyToVram_TextMode

	thumb_func_start ClearWindowTilemapAndScheduleTransfer_TextMode
ClearWindowTilemapAndScheduleTransfer_TextMode: ; 0x0201D928
	push {r4, lr}
	add r4, r0, #0
	bl ClearWindowTilemapText
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ClearWindowTilemapAndScheduleTransfer_TextMode

	thumb_func_start ClearWindowTilemapAndCopyToVram_AffineMode
ClearWindowTilemapAndCopyToVram_AffineMode: ; 0x0201D93C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ClearWindowTilemapAffine
	ldrb r1, [r4, #4]
	mov r0, #0x2c
	add r2, r1, #0
	mul r2, r0
	ldr r0, [r4]
	add r3, r0, r2
	ldr r2, [r3, #0x10]
	str r2, [sp]
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ClearWindowTilemapAndCopyToVram_AffineMode

	thumb_func_start ClearWindowTilemapAndScheduleTransfer_AffineMode
ClearWindowTilemapAndScheduleTransfer_AffineMode: ; 0x0201D964
	push {r4, lr}
	add r4, r0, #0
	bl ClearWindowTilemapAffine
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ClearWindowTilemapAndScheduleTransfer_AffineMode

	thumb_func_start FillWindowPixelBuffer
FillWindowPixelBuffer: ; 0x0201D978
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r2, [r4, #4]
	mov r0, #0x2c
	ldr r3, [r4]
	mul r0, r2
	add r0, r3, r0
	ldrb r2, [r0, #0x1f]
	cmp r2, #0x20
	bne _0201D994
	lsl r0, r1, #4
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
_0201D994:
	lsl r3, r1, #0x18
	lsl r0, r1, #0x10
	orr r0, r3
	lsl r5, r1, #8
	orr r0, r5
	orr r0, r1
	ldr r1, [r4, #0xc]
	ldrb r3, [r4, #8]
	ldrb r4, [r4, #7]
	mul r2, r4
	mul r2, r3
	bl MIi_CpuClearFast
	pop {r3, r4, r5, pc}
	thumb_func_end FillWindowPixelBuffer

	thumb_func_start FillWindowPixelBufferFast
FillWindowPixelBufferFast: ; 0x0201D9B0
	push {r4, lr}
	add r2, r0, #0
	lsl r0, r1, #4
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	lsl r1, r4, #0x18
	lsl r0, r4, #0x10
	orr r0, r1
	lsl r3, r4, #8
	orr r0, r3
	ldr r1, [r2, #0xc]
	ldrb r3, [r2, #8]
	ldrb r2, [r2, #7]
	orr r0, r4
	lsl r2, r2, #5
	mul r2, r3
	bl MIi_CpuClearFast
	pop {r4, pc}
	thumb_func_end FillWindowPixelBufferFast

	thumb_func_start BlitBitmapRectToWindow
BlitBitmapRectToWindow: ; 0x0201D9D8
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, sp, #0x18
	ldrh r5, [r4, #0x10]
	str r5, [sp]
	ldrh r5, [r4, #0x14]
	str r5, [sp, #4]
	ldrh r5, [r4, #0x18]
	str r5, [sp, #8]
	ldrh r5, [r4, #0x1c]
	str r5, [sp, #0xc]
	ldrh r5, [r4, #0x20]
	str r5, [sp, #0x10]
	ldrh r4, [r4, #0x24]
	str r4, [sp, #0x14]
	mov r4, #0
	str r4, [sp, #0x18]
	bl BlitBitmapRect
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end BlitBitmapRectToWindow

	thumb_func_start BlitBitmapRect
BlitBitmapRect: ; 0x0201DA04
	push {r4, r5, lr}
	sub sp, #0x24
	str r1, [sp, #0x1c]
	add r4, sp, #0x20
	ldrh r5, [r4, #0x10]
	add r1, sp, #0x14
	strh r5, [r1, #0xc]
	ldrh r5, [r4, #0x14]
	strh r5, [r1, #0xe]
	ldr r5, [r0, #0xc]
	str r5, [sp, #0x14]
	ldrb r5, [r0, #7]
	lsl r5, r5, #3
	strh r5, [r1, #4]
	ldrb r5, [r0, #8]
	lsl r5, r5, #3
	strh r5, [r1, #6]
	ldrb r5, [r0, #4]
	ldr r1, [r0]
	mov r0, #0x2c
	mul r0, r5
	add r0, r1, r0
	ldrb r0, [r0, #0x1e]
	add r1, sp, #0x14
	cmp r0, #0
	ldrh r0, [r4, #0x18]
	bne _0201DA56
	str r0, [sp]
	ldrh r0, [r4, #0x1c]
	str r0, [sp, #4]
	ldrh r0, [r4, #0x20]
	str r0, [sp, #8]
	ldrh r0, [r4, #0x24]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #0x28]
	str r0, [sp, #0x10]
	add r0, sp, #0x1c
	bl BlitBitmapRect4Bit
	add sp, #0x24
	pop {r4, r5, pc}
_0201DA56:
	str r0, [sp]
	ldrh r0, [r4, #0x1c]
	str r0, [sp, #4]
	ldrh r0, [r4, #0x20]
	str r0, [sp, #8]
	ldrh r0, [r4, #0x24]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #0x28]
	str r0, [sp, #0x10]
	add r0, sp, #0x1c
	bl BlitBitmapRect8bit
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end BlitBitmapRect

	thumb_func_start FillWindowPixelRect
FillWindowPixelRect: ; 0x0201DA74
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, [r0, #0xc]
	add r4, r2, #0
	str r1, [sp, #8]
	ldrb r1, [r0, #7]
	add r2, r3, #0
	lsl r3, r1, #3
	add r1, sp, #8
	strh r3, [r1, #4]
	ldrb r3, [r0, #8]
	lsl r3, r3, #3
	strh r3, [r1, #6]
	ldrb r3, [r0, #4]
	ldr r1, [r0]
	mov r0, #0x2c
	mul r0, r3
	add r0, r1, r0
	ldrb r0, [r0, #0x1e]
	add r3, sp, #0x10
	cmp r0, #0
	bne _0201DAB6
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	str r0, [sp]
	str r5, [sp, #4]
	ldrh r3, [r3, #0x10]
	add r0, sp, #8
	bl FillBitmapRect4bit
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0201DAB6:
	ldrh r0, [r3, #0x14]
	add r1, r4, #0
	str r0, [sp]
	str r5, [sp, #4]
	ldrh r3, [r3, #0x10]
	add r0, sp, #8
	bl FillBitmapRect8bit
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end FillWindowPixelRect

	thumb_func_start CopyGlyphToWindow
CopyGlyphToWindow: ; 0x0201DACC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0x118
	add r5, r0, #0
	ldr r0, [sp, #0x330]
	str r1, [sp]
	str r0, [sp, #0x330]
	add r1, sp, #0x318
	ldrh r1, [r1, #0x10]
	ldr r0, [r5, #0xc]
	str r1, [sp, #0x5c]
	ldrb r1, [r5, #7]
	str r0, [sp, #0x278]
	ldrb r0, [r5, #8]
	lsl r1, r1, #0x13
	lsr r4, r1, #0x10
	ldr r1, [sp, #0x5c]
	lsl r0, r0, #0x13
	sub r1, r4, r1
	lsr r0, r0, #0x10
	str r4, [sp, #0x58]
	str r1, [sp, #8]
	cmp r1, r2
	blt _0201DAFE
	str r2, [sp, #8]
_0201DAFE:
	add r1, sp, #0x318
	ldrh r1, [r1, #0x14]
	sub r0, r0, r1
	str r1, [sp, #0x48]
	str r0, [sp, #4]
	cmp r0, r3
	blt _0201DB0E
	str r3, [sp, #4]
_0201DB0E:
	ldr r0, [sp, #8]
	mov r4, #0
	cmp r0, #8
	ble _0201DB1E
	mov r0, #1
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0201DB1E:
	ldr r0, [sp, #4]
	cmp r0, #8
	ble _0201DB2C
	mov r0, #2
	orr r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0201DB2C:
	ldrh r0, [r5, #0xa]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	beq _0201DB38
	bl _0201E4AC ; long jump
_0201DB38:
	cmp r4, #3
	bls _0201DB40
	bl _0201EC3C ; long jump
_0201DB40:
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201DB4C: ; jump table
	.short _0201DB54 - _0201DB4C - 2 ; case 0
	.short _0201DC56 - _0201DB4C - 2 ; case 1
	.short _0201DE66 - _0201DB4C - 2 ; case 2
	.short _0201E086 - _0201DB4C - 2 ; case 3
_0201DB54:
	ldr r0, [sp, #0x330]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x70]
	mov r0, #0
	str r0, [sp, #0x274]
	ldr r0, [sp, #4]
	cmp r0, #0
	bgt _0201DB6A
	bl _0201EC3C ; long jump
_0201DB6A:
	ldr r0, [sp, #0x58]
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x6c]
_0201DB76:
	ldr r0, [sp]
	ldr r1, [sp, #0x70]
	ldr r0, [r0]
	ldr r2, [sp, #0x5c]
	str r0, [sp, #0x26c]
	ldr r0, [sp, #0x274]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x270]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #0
	ble _0201DC2A
	ble _0201DC2A
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x6c]
	lsl r5, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x48]
	str r6, [sp, #0x68]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	ldr r5, [sp, #0x6c]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	add r4, r1, #0
	str r5, [sp, #0x64]
	str r0, [sp, #0x60]
_0201DBC8:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201DEE8 ; =0x00003FE0
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0x68]
	str r5, [sp, #0x27c]
	add r0, r5, r0
	ldr r5, [sp, #0x26c]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201DC1C
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x280]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x284]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x284]
	and r6, r5
	ldr r5, [sp, #0x280]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x270]
	cmp r0, #0
	beq _0201DC1C
	ldr r6, [sp, #0x27c]
	ldr r0, [sp, #0x64]
	add r6, r6, r0
	ldr r0, [sp, #0x60]
	strb r5, [r0, r6]
_0201DC1C:
	ldr r0, [sp, #8]
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, r0
	blt _0201DBC8
_0201DC2A:
	ldr r0, [sp, #0x270]
	cmp r0, #0
	beq _0201DC38
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201DC3E
_0201DC38:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201DC3E:
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x274]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x274]
	cmp r1, r0
	blt _0201DB76
	add sp, #0x1fc
	add sp, #0x118
	pop {r4, r5, r6, r7, pc}
_0201DC56:
	ldr r0, [sp]
	str r0, [sp, #0x25c]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x264]
	ldr r0, [sp, #0x330]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x54]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x84]
	mov r0, #0
	str r0, [sp, #0x268]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0201DD52
	ldr r0, [sp, #0x58]
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x80]
_0201DC82:
	ldr r0, [sp, #0x25c]
	ldr r1, [sp, #0x84]
	ldr r0, [r0]
	ldr r2, [sp, #0x5c]
	str r0, [sp, #0x258]
	ldr r0, [sp, #0x268]
	ldr r6, [sp, #0x80]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x260]
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x264]
	mov r1, #0
	lsl r5, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x264]
	str r6, [sp, #0x7c]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	ldr r5, [sp, #0x80]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	add r4, r1, #0
	str r5, [sp, #0x78]
	str r0, [sp, #0x74]
_0201DCCC:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201DEE8 ; =0x00003FE0
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0x7c]
	str r5, [sp, #0x288]
	add r0, r5, r0
	ldr r5, [sp, #0x258]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201DD20
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x28c]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x290]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x290]
	and r6, r5
	ldr r5, [sp, #0x28c]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x260]
	cmp r0, #0
	beq _0201DD20
	ldr r6, [sp, #0x288]
	ldr r0, [sp, #0x78]
	add r6, r6, r0
	ldr r0, [sp, #0x74]
	strb r5, [r0, r6]
_0201DD20:
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, #8
	blt _0201DCCC
	ldr r0, [sp, #0x260]
	cmp r0, #0
	beq _0201DD3A
	ldr r0, [sp, #0x264]
	add r0, r0, #2
	str r0, [sp, #0x264]
	b _0201DD40
_0201DD3A:
	ldr r0, [sp, #0x264]
	add r0, r0, #1
	str r0, [sp, #0x264]
_0201DD40:
	ldr r0, [sp, #0x25c]
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r0, [sp, #0x268]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x268]
	cmp r1, r0
	blt _0201DC82
_0201DD52:
	ldr r0, [sp]
	add r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x54]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x98]
	mov r0, #0
	str r0, [sp, #0x254]
	ldr r0, [sp, #4]
	cmp r0, #0
	bgt _0201DD6E
	bl _0201EC3C ; long jump
_0201DD6E:
	ldr r0, [sp, #0x5c]
	mov r1, #7
	add r0, #8
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x58]
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x94]
_0201DD80:
	ldr r0, [sp]
	ldr r1, [sp, #0x98]
	ldr r0, [r0]
	ldr r2, [sp, #0x5c]
	str r0, [sp, #0x24c]
	ldr r0, [sp, #0x254]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x250]
	ldr r0, [sp, #8]
	mov r1, #0
	str r0, [sp, #0x294]
	sub r0, #8
	str r0, [sp, #0x294]
	cmp r0, #0
	ble _0201DE3A
	ble _0201DE3A
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x94]
	lsl r5, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x48]
	str r6, [sp, #0x90]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	ldr r5, [sp, #0x94]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	add r4, r1, #0
	str r5, [sp, #0x8c]
	str r0, [sp, #0x88]
_0201DDD8:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201DEE8 ; =0x00003FE0
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0x90]
	str r5, [sp, #0x298]
	add r0, r5, r0
	ldr r5, [sp, #0x24c]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201DE2C
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x29c]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x2a0]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x2a0]
	and r6, r5
	ldr r5, [sp, #0x29c]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x250]
	cmp r0, #0
	beq _0201DE2C
	ldr r6, [sp, #0x298]
	ldr r0, [sp, #0x8c]
	add r6, r6, r0
	ldr r0, [sp, #0x88]
	strb r5, [r0, r6]
_0201DE2C:
	ldr r0, [sp, #0x294]
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, r0
	blt _0201DDD8
_0201DE3A:
	ldr r0, [sp, #0x250]
	cmp r0, #0
	beq _0201DE48
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201DE4E
_0201DE48:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201DE4E:
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x254]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x254]
	cmp r1, r0
	blt _0201DD80
	add sp, #0x1fc
	add sp, #0x118
	pop {r4, r5, r6, r7, pc}
_0201DE66:
	ldr r0, [sp]
	mov r1, #7
	str r0, [sp, #0x23c]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x244]
	mov r0, #0
	str r0, [sp, #0x248]
	ldr r0, [sp, #0x330]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xa8]
	ldr r0, [sp, #0x58]
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x40]
_0201DE86:
	ldr r0, [sp, #0x23c]
	ldr r1, [sp, #0xa8]
	ldr r0, [r0]
	ldr r2, [sp, #0x5c]
	str r0, [sp, #0x238]
	ldr r0, [sp, #0x248]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x240]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #0
	ble _0201DF42
	ble _0201DF42
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x244]
	ldr r6, [sp, #0x40]
	lsl r5, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x244]
	str r6, [sp, #0xa4]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201DEE8 ; =0x00003FE0
	ldr r5, [sp, #0x40]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	add r4, r1, #0
	str r5, [sp, #0xa0]
	str r0, [sp, #0x9c]
_0201DED8:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201DEE8 ; =0x00003FE0
	b _0201DEEC
	nop
_0201DEE8: .word 0x00003FE0
_0201DEEC:
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0xa4]
	str r5, [sp, #0x2a4]
	add r0, r5, r0
	ldr r5, [sp, #0x238]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201DF34
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x2a8]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x2ac]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x2ac]
	and r6, r5
	ldr r5, [sp, #0x2a8]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x240]
	cmp r0, #0
	beq _0201DF34
	ldr r6, [sp, #0x2a4]
	ldr r0, [sp, #0xa0]
	add r6, r6, r0
	ldr r0, [sp, #0x9c]
	strb r5, [r0, r6]
_0201DF34:
	ldr r0, [sp, #8]
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, r0
	blt _0201DED8
_0201DF42:
	ldr r0, [sp, #0x240]
	cmp r0, #0
	beq _0201DF50
	ldr r0, [sp, #0x244]
	add r0, r0, #2
	str r0, [sp, #0x244]
	b _0201DF56
_0201DF50:
	ldr r0, [sp, #0x244]
	add r0, r0, #1
	str r0, [sp, #0x244]
_0201DF56:
	ldr r0, [sp, #0x23c]
	add r0, r0, #4
	str r0, [sp, #0x23c]
	ldr r0, [sp, #0x248]
	add r0, r0, #1
	str r0, [sp, #0x248]
	cmp r0, #8
	blt _0201DE86
	ldr r0, [sp]
	mov r2, #0
	add r0, #0x40
	str r0, [sp]
	ldr r0, [sp, #0x48]
	mov r1, #1
	add r0, #8
	str r0, [sp, #0x48]
_0201DF76:
	ldr r0, [sp, #0x330]
	asr r0, r2
	tst r0, r1
	beq _0201DF84
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201DF84:
	add r2, r2, #1
	cmp r2, #8
	blt _0201DF76
	ldr r0, [sp, #0x330]
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xb8]
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r0, #8
	cmp r0, #0
	bgt _0201DFA4
	bl _0201EC3C ; long jump
_0201DFA4:
	ldr r0, [sp]
	ldr r1, [sp, #0xb8]
	ldr r0, [r0]
	ldr r2, [sp, #0x5c]
	str r0, [sp, #0x230]
	ldr r0, [sp, #0x20]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x234]
	ldr r0, [sp, #8]
	mov r1, #0
	cmp r0, #0
	ble _0201E058
	ble _0201E058
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x40]
	lsl r5, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x48]
	str r6, [sp, #0xb4]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	ldr r5, [sp, #0x40]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	add r4, r1, #0
	str r5, [sp, #0xb0]
	str r0, [sp, #0xac]
_0201DFF6:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201E308 ; =0x00003FE0
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0xb4]
	str r5, [sp, #0x2b0]
	add r0, r5, r0
	ldr r5, [sp, #0x230]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201E04A
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x2b4]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x2b8]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x2b8]
	and r6, r5
	ldr r5, [sp, #0x2b4]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x234]
	cmp r0, #0
	beq _0201E04A
	ldr r6, [sp, #0x2b0]
	ldr r0, [sp, #0xb0]
	add r6, r6, r0
	ldr r0, [sp, #0xac]
	strb r5, [r0, r6]
_0201E04A:
	ldr r0, [sp, #8]
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, r0
	blt _0201DFF6
_0201E058:
	ldr r0, [sp, #0x234]
	cmp r0, #0
	beq _0201E066
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201E06C
_0201E066:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201E06C:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x20]
	sub r1, #8
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, r1
	blt _0201DFA4
	add sp, #0x1fc
	add sp, #0x118
	pop {r4, r5, r6, r7, pc}
_0201E086:
	ldr r0, [sp]
	str r0, [sp, #0x220]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x228]
	ldr r0, [sp, #0x330]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0
	str r0, [sp, #0x22c]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x58]
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x38]
_0201E0AA:
	ldr r0, [sp, #0x220]
	ldr r1, [sp, #0x3c]
	ldr r0, [r0]
	ldr r2, [sp, #0x5c]
	str r0, [sp, #0x21c]
	ldr r0, [sp, #0x22c]
	ldr r6, [sp, #0x38]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x224]
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x228]
	mov r1, #0
	lsl r5, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x228]
	str r6, [sp, #0xc4]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	ldr r5, [sp, #0x38]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	str r3, [sp, #0x34]
	add r4, r1, #0
	str r5, [sp, #0xc0]
	str r0, [sp, #0xbc]
_0201E0F6:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201E308 ; =0x00003FE0
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0xc4]
	str r5, [sp, #0x2bc]
	add r0, r5, r0
	ldr r5, [sp, #0x21c]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201E14A
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x2c0]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x2c4]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x2c4]
	and r6, r5
	ldr r5, [sp, #0x2c0]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x224]
	cmp r0, #0
	beq _0201E14A
	ldr r6, [sp, #0x2bc]
	ldr r0, [sp, #0xc0]
	add r6, r6, r0
	ldr r0, [sp, #0xbc]
	strb r5, [r0, r6]
_0201E14A:
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, #8
	blt _0201E0F6
	ldr r0, [sp, #0x224]
	cmp r0, #0
	beq _0201E164
	ldr r0, [sp, #0x228]
	add r0, r0, #2
	str r0, [sp, #0x228]
	b _0201E16A
_0201E164:
	ldr r0, [sp, #0x228]
	add r0, r0, #1
	str r0, [sp, #0x228]
_0201E16A:
	ldr r0, [sp, #0x220]
	add r0, r0, #4
	str r0, [sp, #0x220]
	ldr r0, [sp, #0x22c]
	add r0, r0, #1
	str r0, [sp, #0x22c]
	cmp r0, #8
	blt _0201E0AA
	ldr r0, [sp]
	str r0, [sp, #0x20c]
	add r0, #0x20
	str r0, [sp, #0x20c]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x214]
	mov r0, #0
	str r0, [sp, #0x218]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0xd4]
	add r0, #8
	str r0, [sp, #0xd4]
_0201E192:
	ldr r0, [sp, #0x20c]
	ldr r1, [sp, #0x3c]
	ldr r0, [r0]
	ldr r2, [sp, #0xd4]
	str r0, [sp, #0x208]
	ldr r0, [sp, #0x218]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x210]
	ldr r0, [sp, #8]
	mov r1, #0
	str r0, [sp, #0x2c8]
	sub r0, #8
	str r0, [sp, #0x2c8]
	cmp r0, #0
	ble _0201E24C
	ble _0201E24C
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x214]
	ldr r6, [sp, #0x38]
	lsl r5, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x214]
	str r6, [sp, #0xd0]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	ldr r5, [sp, #0x38]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	add r4, r1, #0
	str r5, [sp, #0xcc]
	str r0, [sp, #0xc8]
_0201E1EA:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201E308 ; =0x00003FE0
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0xd0]
	str r5, [sp, #0x2cc]
	add r0, r5, r0
	ldr r5, [sp, #0x208]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201E23E
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x2d0]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x2d4]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x2d4]
	and r6, r5
	ldr r5, [sp, #0x2d0]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x210]
	cmp r0, #0
	beq _0201E23E
	ldr r6, [sp, #0x2cc]
	ldr r0, [sp, #0xcc]
	add r6, r6, r0
	ldr r0, [sp, #0xc8]
	strb r5, [r0, r6]
_0201E23E:
	ldr r0, [sp, #0x2c8]
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, r0
	blt _0201E1EA
_0201E24C:
	ldr r0, [sp, #0x210]
	cmp r0, #0
	beq _0201E25A
	ldr r0, [sp, #0x214]
	add r0, r0, #2
	str r0, [sp, #0x214]
	b _0201E260
_0201E25A:
	ldr r0, [sp, #0x214]
	add r0, r0, #1
	str r0, [sp, #0x214]
_0201E260:
	ldr r0, [sp, #0x20c]
	add r0, r0, #4
	str r0, [sp, #0x20c]
	ldr r0, [sp, #0x218]
	add r0, r0, #1
	str r0, [sp, #0x218]
	cmp r0, #8
	blt _0201E192
	ldr r0, [sp]
	mov r2, #0
	str r0, [sp, #0x1fc]
	add r0, #0x40
	str r0, [sp, #0x1fc]
	ldr r0, [sp, #0x48]
	mov r1, #1
	add r0, #8
	str r0, [sp, #0x48]
	str r0, [sp, #0x204]
_0201E284:
	ldr r0, [sp, #0x330]
	asr r0, r2
	tst r0, r1
	beq _0201E292
	ldr r0, [sp, #0x204]
	add r0, r0, #1
	str r0, [sp, #0x204]
_0201E292:
	add r2, r2, #1
	cmp r2, #8
	blt _0201E284
	ldr r0, [sp, #0x330]
	asr r0, r0, #8
	str r0, [sp, #0x50]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xe4]
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	sub r0, #8
	cmp r0, #0
	ble _0201E388
_0201E2B0:
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #0xe4]
	ldr r0, [r0]
	ldr r6, [sp, #0x38]
	str r0, [sp, #0x1f8]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x5c]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x200]
	ldr r0, [sp, #0x204]
	mov r1, #0
	lsl r5, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x204]
	str r6, [sp, #0xe0]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201E308 ; =0x00003FE0
	ldr r5, [sp, #0x38]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	ldr r3, [sp, #0x34]
	add r4, r1, #0
	str r5, [sp, #0xdc]
	str r0, [sp, #0xd8]
_0201E2F8:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201E308 ; =0x00003FE0
	b _0201E30C
	nop
_0201E308: .word 0x00003FE0
_0201E30C:
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0xe0]
	str r5, [sp, #0x2d8]
	add r0, r5, r0
	ldr r5, [sp, #0x1f8]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201E354
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x2dc]
	ldrb r5, [r0, r7]
	str r5, [sp, #0x2e0]
	mov r5, #0xf0
	asr r5, r6
	ldr r6, [sp, #0x2e0]
	and r6, r5
	ldr r5, [sp, #0x2dc]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x200]
	cmp r0, #0
	beq _0201E354
	ldr r6, [sp, #0x2d8]
	ldr r0, [sp, #0xdc]
	add r6, r6, r0
	ldr r0, [sp, #0xd8]
	strb r5, [r0, r6]
_0201E354:
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, #8
	blt _0201E2F8
	ldr r0, [sp, #0x200]
	cmp r0, #0
	beq _0201E36E
	ldr r0, [sp, #0x204]
	add r0, r0, #2
	str r0, [sp, #0x204]
	b _0201E374
_0201E36E:
	ldr r0, [sp, #0x204]
	add r0, r0, #1
	str r0, [sp, #0x204]
_0201E374:
	ldr r0, [sp, #0x1fc]
	ldr r1, [sp, #4]
	add r0, r0, #4
	str r0, [sp, #0x1fc]
	ldr r0, [sp, #0x1c]
	sub r1, #8
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, r1
	blt _0201E2B0
_0201E388:
	ldr r0, [sp]
	mov r2, #0
	add r0, #0x60
	str r0, [sp]
	mov r1, #1
_0201E392:
	ldr r0, [sp, #0x330]
	asr r0, r2
	tst r0, r1
	beq _0201E3A0
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201E3A0:
	add r2, r2, #1
	cmp r2, #8
	blt _0201E392
	ldr r0, [sp, #0x50]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xf4]
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	sub r0, #8
	cmp r0, #0
	bgt _0201E3BE
	bl _0201EC3C ; long jump
_0201E3BE:
	ldr r0, [sp, #0x5c]
	add r0, #8
	str r0, [sp, #0x5c]
_0201E3C4:
	ldr r0, [sp]
	ldr r1, [sp, #0xf4]
	ldr r0, [r0]
	ldr r2, [sp, #0x5c]
	str r0, [sp, #0x1f0]
	ldr r0, [sp, #0x18]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1f4]
	ldr r0, [sp, #8]
	mov r1, #0
	str r0, [sp, #0x2e4]
	sub r0, #8
	str r0, [sp, #0x2e4]
	cmp r0, #0
	ble _0201E47E
	ble _0201E47E
	add r0, r2, #0
	lsl r3, r0, #2
	ldr r0, [sp, #0x48]
	ldr r6, [sp, #0x38]
	lsl r5, r0, #2
	ldr r0, _0201E6F0 ; =0x00003FE0
	add r7, r5, #0
	and r0, r5
	mul r6, r0
	mov r0, #0x1c
	and r7, r0
	ldr r0, [sp, #0x48]
	str r6, [sp, #0xf0]
	add r0, r0, #1
	lsl r6, r0, #2
	ldr r0, _0201E6F0 ; =0x00003FE0
	ldr r5, [sp, #0x38]
	and r0, r6
	mul r5, r0
	mov r0, #0x1c
	and r0, r6
	add r4, r1, #0
	str r5, [sp, #0xec]
	str r0, [sp, #0xe8]
_0201E41C:
	asr r5, r2, #1
	mov r0, #3
	and r5, r0
	ldr r0, [sp, #0x278]
	add r0, r0, r5
	ldr r5, _0201E6F0 ; =0x00003FE0
	and r5, r3
	add r5, r0, r5
	ldr r0, [sp, #0xf0]
	str r5, [sp, #0x2e8]
	add r0, r5, r0
	ldr r5, [sp, #0x1f0]
	add r6, r5, #0
	lsr r6, r4
	mov r5, #0xf
	and r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	beq _0201E470
	lsl r6, r2, #0x1f
	lsr r6, r6, #0x1d
	lsl r5, r6
	str r5, [sp, #0x2ec]
	ldrb r5, [r0, r7]
	mov ip, r5
	mov r5, #0xf0
	asr r5, r6
	mov r6, ip
	and r6, r5
	ldr r5, [sp, #0x2ec]
	orr r5, r6
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	strb r5, [r0, r7]
	ldr r0, [sp, #0x1f4]
	cmp r0, #0
	beq _0201E470
	ldr r6, [sp, #0x2e8]
	ldr r0, [sp, #0xec]
	add r6, r6, r0
	ldr r0, [sp, #0xe8]
	strb r5, [r0, r6]
_0201E470:
	ldr r0, [sp, #0x2e4]
	add r1, r1, #1
	add r4, r4, #4
	add r3, r3, #4
	add r2, r2, #1
	cmp r1, r0
	blt _0201E41C
_0201E47E:
	ldr r0, [sp, #0x1f4]
	cmp r0, #0
	beq _0201E48C
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201E492
_0201E48C:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201E492:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x18]
	sub r1, #8
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r1
	blt _0201E3C4
	add sp, #0x1fc
	add sp, #0x118
	pop {r4, r5, r6, r7, pc}
_0201E4AC: ; 0x0201E4AC
	lsl r1, r2, #2
	mul r1, r3
	ldr r3, [r5]
	ldrb r2, [r5, #9]
	ldr r0, [sp]
	ldr r3, [r3]
	lsl r1, r1, #3
	bl Convert4bppTo8bpp
	str r0, [sp, #0x1ec]
	cmp r4, #3
	bhi _0201E59E
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201E4D0: ; jump table
	.short _0201E4D8 - _0201E4D0 - 2 ; case 0
	.short _0201E5A0 - _0201E4D0 - 2 ; case 1
	.short _0201E74C - _0201E4D0 - 2 ; case 2
	.short _0201E8F0 - _0201E4D0 - 2 ; case 3
_0201E4D8:
	ldr r0, [sp, #0x330]
	ldr r7, [sp, #0x1ec]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10c]
	mov r0, #0
	str r0, [sp, #0x1e8]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0201E59E
	ldr r0, [sp, #0x58]
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x108]
_0201E4F8:
	ldr r1, [sp, #0x10c]
	ldr r0, [sp, #0x1e8]
	mov r4, #0
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x310]
	ldr r0, [sp, #8]
	ldr r5, [sp, #0x5c]
	cmp r0, #0
	ble _0201E57C
	ble _0201E57C
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x108]
	lsl r1, r0, #3
	ldr r0, _0201E6F4 ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x100]
	ldr r0, [sp, #0x48]
	str r2, [sp, #0x104]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201E6F4 ; =0x00007FC0
	ldr r2, [sp, #0x108]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r2, [sp, #0xfc]
	str r0, [sp, #0xf8]
_0201E544:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201E6F4 ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x104]
	ldrb r1, [r7, r4]
	add r2, r3, r0
	cmp r1, #0
	beq _0201E570
	ldr r0, [sp, #0x100]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x310]
	cmp r0, #0
	beq _0201E570
	ldr r0, [sp, #0xfc]
	add r2, r3, r0
	ldr r0, [sp, #0xf8]
	strb r1, [r0, r2]
_0201E570:
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, r0
	blt _0201E544
_0201E57C:
	ldr r0, [sp, #0x310]
	cmp r0, #0
	beq _0201E58A
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201E590
_0201E58A:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201E590:
	ldr r0, [sp, #0x1e8]
	add r7, #8
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x1e8]
	cmp r1, r0
	blt _0201E4F8
_0201E59E:
	b _0201EC36
_0201E5A0:
	ldr r0, [sp, #0x48]
	ldr r7, [sp, #0x1ec]
	str r0, [sp, #0x1e0]
	ldr r0, [sp, #0x330]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x4c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x124]
	mov r0, #0
	str r0, [sp, #0x1e4]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0201E666
	ldr r0, [sp, #0x58]
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x120]
_0201E5CA:
	ldr r1, [sp, #0x124]
	ldr r0, [sp, #0x1e4]
	ldr r5, [sp, #0x5c]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x30c]
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x1e0]
	ldr r2, [sp, #0x120]
	lsl r1, r0, #3
	ldr r0, _0201E6F4 ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x118]
	ldr r0, [sp, #0x1e0]
	str r2, [sp, #0x11c]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201E6F4 ; =0x00007FC0
	ldr r2, [sp, #0x120]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	mov r4, #0
	str r2, [sp, #0x114]
	str r0, [sp, #0x110]
_0201E60E:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201E6F4 ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x11c]
	ldrb r1, [r7, r4]
	add r2, r3, r0
	cmp r1, #0
	beq _0201E63A
	ldr r0, [sp, #0x118]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x30c]
	cmp r0, #0
	beq _0201E63A
	ldr r0, [sp, #0x114]
	add r2, r3, r0
	ldr r0, [sp, #0x110]
	strb r1, [r0, r2]
_0201E63A:
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, #8
	blt _0201E60E
	ldr r0, [sp, #0x30c]
	cmp r0, #0
	beq _0201E652
	ldr r0, [sp, #0x1e0]
	add r0, r0, #2
	str r0, [sp, #0x1e0]
	b _0201E658
_0201E652:
	ldr r0, [sp, #0x1e0]
	add r0, r0, #1
	str r0, [sp, #0x1e0]
_0201E658:
	ldr r0, [sp, #0x1e4]
	add r7, #8
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x1e4]
	cmp r1, r0
	blt _0201E5CA
_0201E666:
	ldr r0, [sp, #0x1ec]
	str r0, [sp, #0x308]
	add r0, #0x40
	str r0, [sp, #0x308]
	ldr r0, [sp, #0x4c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x13c]
	mov r0, #0
	str r0, [sp, #0x1dc]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0201E74A
	ldr r0, [sp, #0x5c]
	mov r1, #7
	add r0, #8
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x58]
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x138]
_0201E692:
	ldr r1, [sp, #0x13c]
	ldr r0, [sp, #0x1dc]
	ldr r7, [sp, #8]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	sub r7, #8
	mov r4, #0
	str r0, [sp, #0x1d8]
	ldr r5, [sp, #0x5c]
	cmp r7, #0
	ble _0201E724
	ble _0201E724
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x138]
	lsl r1, r0, #3
	ldr r0, _0201E6F4 ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x130]
	ldr r0, [sp, #0x48]
	str r2, [sp, #0x134]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201E6F4 ; =0x00007FC0
	ldr r2, [sp, #0x138]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r2, [sp, #0x12c]
	str r0, [sp, #0x128]
_0201E6E0:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201E6F4 ; =0x00007FC0
	b _0201E6F8
	nop
_0201E6F0: .word 0x00003FE0
_0201E6F4: .word 0x00007FC0
_0201E6F8:
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x134]
	add r2, r3, r0
	ldr r0, [sp, #0x308]
	ldrb r1, [r0, r4]
	cmp r1, #0
	beq _0201E71A
	ldr r0, [sp, #0x130]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x1d8]
	cmp r0, #0
	beq _0201E71A
	ldr r0, [sp, #0x12c]
	add r2, r3, r0
	ldr r0, [sp, #0x128]
	strb r1, [r0, r2]
_0201E71A:
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, r7
	blt _0201E6E0
_0201E724:
	ldr r0, [sp, #0x1d8]
	cmp r0, #0
	beq _0201E732
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201E738
_0201E732:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201E738:
	ldr r0, [sp, #0x308]
	add r0, #8
	str r0, [sp, #0x308]
	ldr r0, [sp, #0x1dc]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x1dc]
	cmp r1, r0
	blt _0201E692
_0201E74A:
	b _0201EC36
_0201E74C:
	ldr r0, [sp, #0x48]
	mov r1, #7
	str r0, [sp, #0x1d0]
	mov r0, #0
	str r0, [sp, #0x1d4]
	ldr r0, [sp, #0x330]
	ldr r7, [sp, #0x1ec]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x150]
	ldr r0, [sp, #0x58]
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x30]
_0201E76A:
	ldr r1, [sp, #0x150]
	ldr r0, [sp, #0x1d4]
	mov r4, #0
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x304]
	ldr r0, [sp, #8]
	ldr r5, [sp, #0x5c]
	cmp r0, #0
	ble _0201E7EE
	ble _0201E7EE
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x1d0]
	ldr r2, [sp, #0x30]
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x148]
	ldr r0, [sp, #0x1d0]
	str r2, [sp, #0x14c]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	ldr r2, [sp, #0x30]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r2, [sp, #0x144]
	str r0, [sp, #0x140]
_0201E7B6:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201EA5C ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x14c]
	ldrb r1, [r7, r4]
	add r2, r3, r0
	cmp r1, #0
	beq _0201E7E2
	ldr r0, [sp, #0x148]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x304]
	cmp r0, #0
	beq _0201E7E2
	ldr r0, [sp, #0x144]
	add r2, r3, r0
	ldr r0, [sp, #0x140]
	strb r1, [r0, r2]
_0201E7E2:
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, r0
	blt _0201E7B6
_0201E7EE:
	ldr r0, [sp, #0x304]
	cmp r0, #0
	beq _0201E7FC
	ldr r0, [sp, #0x1d0]
	add r0, r0, #2
	str r0, [sp, #0x1d0]
	b _0201E802
_0201E7FC:
	ldr r0, [sp, #0x1d0]
	add r0, r0, #1
	str r0, [sp, #0x1d0]
_0201E802:
	ldr r0, [sp, #0x1d4]
	add r7, #8
	add r0, r0, #1
	str r0, [sp, #0x1d4]
	cmp r0, #8
	blt _0201E76A
	ldr r0, [sp, #0x48]
	ldr r7, [sp, #0x1ec]
	add r0, #8
	str r0, [sp, #0x48]
	add r7, #0x80
	mov r0, #0
	mov r2, #1
_0201E81C:
	ldr r1, [sp, #0x330]
	asr r1, r0
	tst r1, r2
	beq _0201E82A
	ldr r1, [sp, #0x48]
	add r1, r1, #1
	str r1, [sp, #0x48]
_0201E82A:
	add r0, r0, #1
	cmp r0, #8
	blt _0201E81C
	ldr r0, [sp, #0x330]
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x164]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	sub r0, #8
	cmp r0, #0
	ble _0201E8EE
_0201E846:
	ldr r1, [sp, #0x164]
	ldr r0, [sp, #0x14]
	mov r4, #0
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x300]
	ldr r0, [sp, #8]
	ldr r5, [sp, #0x5c]
	cmp r0, #0
	ble _0201E8CA
	ble _0201E8CA
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x30]
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x15c]
	ldr r0, [sp, #0x48]
	str r2, [sp, #0x160]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	ldr r2, [sp, #0x30]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r2, [sp, #0x158]
	str r0, [sp, #0x154]
_0201E892:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201EA5C ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x160]
	ldrb r1, [r7, r4]
	add r2, r3, r0
	cmp r1, #0
	beq _0201E8BE
	ldr r0, [sp, #0x15c]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x300]
	cmp r0, #0
	beq _0201E8BE
	ldr r0, [sp, #0x158]
	add r2, r3, r0
	ldr r0, [sp, #0x154]
	strb r1, [r0, r2]
_0201E8BE:
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, r0
	blt _0201E892
_0201E8CA:
	ldr r0, [sp, #0x300]
	cmp r0, #0
	beq _0201E8D8
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201E8DE
_0201E8D8:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201E8DE:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #4]
	add r0, r0, #1
	sub r1, #8
	add r7, #8
	str r0, [sp, #0x14]
	cmp r0, r1
	blt _0201E846
_0201E8EE:
	b _0201EC36
_0201E8F0:
	ldr r0, [sp, #0x48]
	ldr r7, [sp, #0x1ec]
	str r0, [sp, #0x1c8]
	ldr r0, [sp, #0x330]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0
	str r0, [sp, #0x1cc]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x58]
	mov r1, #7
	and r1, r0
	add r0, r0, r1
	asr r0, r0, #3
	str r0, [sp, #0x28]
_0201E912:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x1cc]
	ldr r5, [sp, #0x5c]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x2fc]
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x1c8]
	ldr r2, [sp, #0x28]
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x170]
	ldr r0, [sp, #0x1c8]
	str r2, [sp, #0x174]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	ldr r2, [sp, #0x28]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	mov r4, #0
	str r6, [sp, #0x24]
	str r2, [sp, #0x16c]
	str r0, [sp, #0x168]
_0201E958:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201EA5C ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x174]
	ldrb r1, [r7, r4]
	add r2, r3, r0
	cmp r1, #0
	beq _0201E984
	ldr r0, [sp, #0x170]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x2fc]
	cmp r0, #0
	beq _0201E984
	ldr r0, [sp, #0x16c]
	add r2, r3, r0
	ldr r0, [sp, #0x168]
	strb r1, [r0, r2]
_0201E984:
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, #8
	blt _0201E958
	ldr r0, [sp, #0x2fc]
	cmp r0, #0
	beq _0201E99C
	ldr r0, [sp, #0x1c8]
	add r0, r0, #2
	str r0, [sp, #0x1c8]
	b _0201E9A2
_0201E99C:
	ldr r0, [sp, #0x1c8]
	add r0, r0, #1
	str r0, [sp, #0x1c8]
_0201E9A2:
	ldr r0, [sp, #0x1cc]
	add r7, #8
	add r0, r0, #1
	str r0, [sp, #0x1cc]
	cmp r0, #8
	blt _0201E912
	ldr r0, [sp, #0x1ec]
	str r0, [sp, #0x2f8]
	add r0, #0x40
	str r0, [sp, #0x2f8]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x1c0]
	mov r0, #0
	str r0, [sp, #0x1c4]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x188]
	add r0, #8
	str r0, [sp, #0x188]
_0201E9C6:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x1c4]
	ldr r7, [sp, #8]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	sub r7, #8
	mov r4, #0
	str r0, [sp, #0x1bc]
	ldr r5, [sp, #0x188]
	cmp r7, #0
	ble _0201EA4C
	ble _0201EA4C
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x1c0]
	ldr r2, [sp, #0x28]
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x180]
	ldr r0, [sp, #0x1c0]
	str r2, [sp, #0x184]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201EA5C ; =0x00007FC0
	ldr r2, [sp, #0x28]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r2, [sp, #0x17c]
	str r0, [sp, #0x178]
_0201EA14:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201EA5C ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x184]
	add r2, r3, r0
	ldr r0, [sp, #0x2f8]
	ldrb r1, [r0, r4]
	cmp r1, #0
	beq _0201EA42
	ldr r0, [sp, #0x180]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x1bc]
	cmp r0, #0
	beq _0201EA42
	ldr r0, [sp, #0x17c]
	add r2, r3, r0
	ldr r0, [sp, #0x178]
	strb r1, [r0, r2]
_0201EA42:
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, r7
	blt _0201EA14
_0201EA4C:
	ldr r0, [sp, #0x1bc]
	cmp r0, #0
	beq _0201EA60
	ldr r0, [sp, #0x1c0]
	add r0, r0, #2
	str r0, [sp, #0x1c0]
	b _0201EA66
	nop
_0201EA5C: .word 0x00007FC0
_0201EA60:
	ldr r0, [sp, #0x1c0]
	add r0, r0, #1
	str r0, [sp, #0x1c0]
_0201EA66:
	ldr r0, [sp, #0x2f8]
	add r0, #8
	str r0, [sp, #0x2f8]
	ldr r0, [sp, #0x1c4]
	add r0, r0, #1
	str r0, [sp, #0x1c4]
	cmp r0, #8
	blt _0201E9C6
	ldr r0, [sp, #0x48]
	ldr r7, [sp, #0x1ec]
	add r0, #8
	add r7, #0x80
	str r0, [sp, #0x48]
	str r0, [sp, #0x1b8]
	mov r0, #0
	mov r2, #1
_0201EA86:
	ldr r1, [sp, #0x330]
	asr r1, r0
	tst r1, r2
	beq _0201EA94
	ldr r1, [sp, #0x1b8]
	add r1, r1, #1
	str r1, [sp, #0x1b8]
_0201EA94:
	add r0, r0, #1
	cmp r0, #8
	blt _0201EA86
	ldr r0, [sp, #0x330]
	asr r0, r0, #8
	str r0, [sp, #0x44]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x19c]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	sub r0, #8
	cmp r0, #0
	ble _0201EB4E
_0201EAB2:
	ldr r1, [sp, #0x19c]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x28]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x2f4]
	ldr r0, [sp, #0x1b8]
	mov r3, #0x38
	lsl r1, r0, #3
	ldr r0, _0201EC44 ; =0x00007FC0
	ldr r5, [sp, #0x5c]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x194]
	ldr r0, [sp, #0x1b8]
	str r2, [sp, #0x198]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201EC44 ; =0x00007FC0
	ldr r2, [sp, #0x28]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	ldr r6, [sp, #0x24]
	mov r4, #0
	str r2, [sp, #0x190]
	str r0, [sp, #0x18c]
_0201EAF4:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201EC44 ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x198]
	ldrb r1, [r7, r4]
	add r2, r3, r0
	cmp r1, #0
	beq _0201EB20
	ldr r0, [sp, #0x194]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x2f4]
	cmp r0, #0
	beq _0201EB20
	ldr r0, [sp, #0x190]
	add r2, r3, r0
	ldr r0, [sp, #0x18c]
	strb r1, [r0, r2]
_0201EB20:
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, #8
	blt _0201EAF4
	ldr r0, [sp, #0x2f4]
	cmp r0, #0
	beq _0201EB38
	ldr r0, [sp, #0x1b8]
	add r0, r0, #2
	str r0, [sp, #0x1b8]
	b _0201EB3E
_0201EB38:
	ldr r0, [sp, #0x1b8]
	add r0, r0, #1
	str r0, [sp, #0x1b8]
_0201EB3E:
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #4]
	add r0, r0, #1
	sub r1, #8
	add r7, #8
	str r0, [sp, #0x10]
	cmp r0, r1
	blt _0201EAB2
_0201EB4E:
	ldr r0, [sp, #0x1ec]
	mov r2, #0
	str r0, [sp, #0x2f0]
	add r0, #0xc0
	str r0, [sp, #0x2f0]
	mov r1, #1
_0201EB5A:
	ldr r0, [sp, #0x330]
	asr r0, r2
	tst r0, r1
	beq _0201EB68
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201EB68:
	add r2, r2, #1
	cmp r2, #8
	blt _0201EB5A
	ldr r0, [sp, #0x44]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1b0]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	sub r0, #8
	cmp r0, #0
	ble _0201EC36
	ldr r0, [sp, #0x5c]
	add r0, #8
	str r0, [sp, #0x5c]
_0201EB88:
	ldr r1, [sp, #0x1b0]
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #8]
	asr r1, r0
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	sub r7, #8
	mov r4, #0
	str r0, [sp, #0x1b4]
	ldr r5, [sp, #0x5c]
	cmp r7, #0
	ble _0201EC0E
	ble _0201EC0E
	add r0, r5, #0
	lsl r6, r0, #3
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x28]
	lsl r1, r0, #3
	ldr r0, _0201EC44 ; =0x00007FC0
	mov r3, #0x38
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r0, [sp, #0x1a8]
	ldr r0, [sp, #0x48]
	str r2, [sp, #0x1ac]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, _0201EC44 ; =0x00007FC0
	ldr r2, [sp, #0x28]
	and r0, r1
	mul r2, r0
	add r0, r1, #0
	and r0, r3
	str r2, [sp, #0x1a4]
	str r0, [sp, #0x1a0]
_0201EBD6:
	mov r0, #7
	add r1, r5, #0
	and r1, r0
	ldr r0, [sp, #0x278]
	add r1, r0, r1
	ldr r0, _0201EC44 ; =0x00007FC0
	and r0, r6
	add r3, r1, r0
	ldr r0, [sp, #0x1ac]
	add r2, r3, r0
	ldr r0, [sp, #0x2f0]
	ldrb r1, [r0, r4]
	cmp r1, #0
	beq _0201EC04
	ldr r0, [sp, #0x1a8]
	strb r1, [r2, r0]
	ldr r0, [sp, #0x1b4]
	cmp r0, #0
	beq _0201EC04
	ldr r0, [sp, #0x1a4]
	add r2, r3, r0
	ldr r0, [sp, #0x1a0]
	strb r1, [r0, r2]
_0201EC04:
	add r4, r4, #1
	add r6, #8
	add r5, r5, #1
	cmp r4, r7
	blt _0201EBD6
_0201EC0E:
	ldr r0, [sp, #0x1b4]
	cmp r0, #0
	beq _0201EC1C
	ldr r0, [sp, #0x48]
	add r0, r0, #2
	str r0, [sp, #0x48]
	b _0201EC22
_0201EC1C:
	ldr r0, [sp, #0x48]
	add r0, r0, #1
	str r0, [sp, #0x48]
_0201EC22:
	ldr r0, [sp, #0x2f0]
	ldr r1, [sp, #4]
	add r0, #8
	str r0, [sp, #0x2f0]
	ldr r0, [sp, #0xc]
	sub r1, #8
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, r1
	blt _0201EB88
_0201EC36:
	ldr r0, [sp, #0x1ec]
	bl FreeToHeap
_0201EC3C:
	add sp, #0x1fc
	add sp, #0x118
	pop {r4, r5, r6, r7, pc}
	nop
_0201EC44: .word 0x00007FC0
	thumb_func_end CopyGlyphToWindow

	thumb_func_start ScrollWindow
ScrollWindow: ; 0x0201EC48
	push {r4, r5, r6, lr}
	ldrb r6, [r0, #4]
	mov r5, #0x2c
	ldr r4, [r0]
	mul r5, r6
	add r4, r4, r5
	ldrb r4, [r4, #0x1e]
	cmp r4, #0
	bne _0201EC60
	bl ScrollWindow_Text
	pop {r4, r5, r6, pc}
_0201EC60:
	bl ScrollWindow_Affine
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrollWindow

	thumb_func_start ScrollWindow_Text
ScrollWindow_Text: ; 0x0201EC68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r3, #0
	add r4, r0, #0
	add r0, r1, #0
	lsl r3, r6, #0x18
	lsl r1, r6, #0x10
	str r2, [sp]
	orr r1, r3
	lsl r5, r6, #8
	orr r1, r5
	orr r1, r6
	str r1, [sp, #4]
	ldrb r1, [r4, #7]
	ldrb r3, [r4, #8]
	ldr r2, [r4, #0xc]
	str r1, [sp, #8]
	mul r1, r3
	lsl r1, r1, #5
	str r1, [sp, #0xc]
	cmp r0, #3
	bhi _0201ED4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201ECA0: ; jump table
	.short _0201ECA8 - _0201ECA0 - 2 ; case 0
	.short _0201ECF6 - _0201ECA0 - 2 ; case 1
	.short _0201ED4E - _0201ECA0 - 2 ; case 2
	.short _0201ED4E - _0201ECA0 - 2 ; case 3
_0201ECA8:
	add r0, r1, #0
	mov r7, #0
	cmp r0, #0
	ble _0201ED4E
	mov r0, #7
	mov lr, r0
_0201ECB4:
	ldr r3, [sp]
	mov r4, #0
	add r5, r7, #0
_0201ECBA:
	mov r0, #7
	add r6, r3, #0
	and r6, r0
	add r1, r3, #0
	mov r0, lr
	bic r1, r0
	ldr r0, [sp, #8]
	mul r1, r0
	add r0, r6, #0
	orr r0, r1
	lsl r0, r0, #2
	add r1, r7, r0
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bge _0201ECDC
	ldr r0, [r2, r1]
	b _0201ECDE
_0201ECDC:
	ldr r0, [sp, #4]
_0201ECDE:
	add r4, r4, #1
	str r0, [r2, r5]
	add r3, r3, #1
	add r5, r5, #4
	cmp r4, #8
	blt _0201ECBA
	ldr r0, [sp, #0xc]
	add r7, #0x20
	cmp r7, r0
	blt _0201ECB4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0201ECF6:
	add r0, r1, #0
	sub r0, r0, #4
	add r2, r2, r0
	add r0, r1, #0
	mov r7, #0
	cmp r0, #0
	ble _0201ED4E
	mov r0, #7
	mov ip, r0
_0201ED08:
	ldr r4, [sp]
	mov r5, #0
	add r3, r7, #0
_0201ED0E:
	mov r0, #7
	add r6, r4, #0
	and r6, r0
	add r1, r4, #0
	mov r0, ip
	bic r1, r0
	ldr r0, [sp, #8]
	mul r1, r0
	add r0, r6, #0
	orr r0, r1
	lsl r0, r0, #2
	add r1, r7, r0
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bge _0201ED36
	sub r0, r2, r1
	ldr r1, [r0]
	sub r0, r2, r3
	str r1, [r0]
	b _0201ED3C
_0201ED36:
	ldr r0, [sp, #4]
	sub r1, r2, r3
	str r0, [r1]
_0201ED3C:
	add r5, r5, #1
	add r4, r4, #1
	add r3, r3, #4
	cmp r5, #8
	blt _0201ED0E
	ldr r0, [sp, #0xc]
	add r7, #0x20
	cmp r7, r0
	blt _0201ED08
_0201ED4E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrollWindow_Text

	thumb_func_start ScrollWindow_Affine
ScrollWindow_Affine: ; 0x0201ED54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r3, #0
	add r4, r0, #0
	str r2, [sp]
	lsl r2, r6, #0x18
	lsl r0, r6, #0x10
	orr r0, r2
	ldrb r2, [r4, #7]
	ldr r3, [r4, #0xc]
	lsl r5, r6, #8
	orr r0, r5
	ldrb r4, [r4, #8]
	str r2, [sp, #0x10]
	orr r0, r6
	mul r2, r4
	lsl r2, r2, #6
	str r2, [sp, #0x1c]
	cmp r1, #3
	bls _0201ED7E
	b _0201EE84
_0201ED7E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201ED8A: ; jump table
	.short _0201ED92 - _0201ED8A - 2 ; case 0
	.short _0201EE00 - _0201ED8A - 2 ; case 1
	.short _0201EE84 - _0201ED8A - 2 ; case 2
	.short _0201EE84 - _0201ED8A - 2 ; case 3
_0201ED92:
	mov r1, #0
	str r1, [sp, #0xc]
	add r1, r2, #0
	cmp r1, #0
	ble _0201EE84
	add r1, r1, #4
	str r1, [sp, #0x14]
	mov r1, #7
	mov lr, r1
_0201EDA4:
	ldr r4, [sp]
	ldr r5, [sp, #0xc]
	mov r7, #0
_0201EDAA:
	mov r1, #7
	add r6, r4, #0
	and r6, r1
	add r2, r4, #0
	mov r1, lr
	bic r2, r1
	ldr r1, [sp, #0x10]
	mul r2, r1
	add r1, r6, #0
	orr r1, r2
	lsl r2, r1, #3
	ldr r1, [sp, #0xc]
	add r1, r1, r2
	ldr r2, [sp, #0x1c]
	cmp r1, r2
	bge _0201EDD0
	ldr r2, [r3, r1]
	str r2, [r3, r5]
	b _0201EDD2
_0201EDD0:
	str r0, [r3, r5]
_0201EDD2:
	add r2, r1, #4
	ldr r1, [sp, #0x14]
	cmp r2, r1
	bge _0201EDE2
	ldr r2, [r3, r2]
	add r1, r5, #4
	str r2, [r3, r1]
	b _0201EDE6
_0201EDE2:
	add r1, r5, #4
	str r0, [r3, r1]
_0201EDE6:
	add r7, r7, #1
	add r4, r4, #1
	add r5, #8
	cmp r7, #8
	blt _0201EDAA
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	add r2, #0x40
	str r2, [sp, #0xc]
	cmp r2, r1
	blt _0201EDA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0201EE00:
	add r1, r2, #0
	sub r1, #8
	add r3, r3, r1
	mov r1, #0
	str r1, [sp, #8]
	add r1, r2, #0
	cmp r1, #0
	ble _0201EE84
_0201EE10:
	mov r1, #0
	str r1, [sp, #4]
	ldr r1, [sp, #0x1c]
	ldr r5, [sp]
	sub r1, r1, #4
	str r1, [sp, #0x18]
	mov r1, #7
	ldr r4, [sp, #8]
	mov ip, r1
_0201EE22:
	mov r1, #7
	add r6, r5, #0
	and r6, r1
	add r2, r5, #0
	mov r1, ip
	bic r2, r1
	ldr r1, [sp, #0x10]
	mul r2, r1
	add r1, r6, #0
	orr r1, r2
	lsl r2, r1, #3
	ldr r1, [sp, #8]
	add r6, r1, r2
	ldr r1, [sp, #0x1c]
	cmp r6, r1
	bge _0201EE4C
	sub r1, r3, r6
	ldr r2, [r1]
	sub r1, r3, r4
	str r2, [r1]
	b _0201EE50
_0201EE4C:
	sub r1, r3, r4
	str r0, [r1]
_0201EE50:
	ldr r1, [sp, #0x18]
	sub r2, r6, #4
	cmp r2, r1
	bge _0201EE64
	sub r1, r3, r2
	sub r2, r4, #4
	ldr r1, [r1]
	sub r2, r3, r2
	str r1, [r2]
	b _0201EE6A
_0201EE64:
	sub r1, r4, #4
	sub r1, r3, r1
	str r0, [r1]
_0201EE6A:
	ldr r1, [sp, #4]
	add r5, r5, #1
	add r1, r1, #1
	add r4, #8
	str r1, [sp, #4]
	cmp r1, #8
	blt _0201EE22
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x1c]
	add r2, #0x40
	str r2, [sp, #8]
	cmp r2, r1
	blt _0201EE10
_0201EE84:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrollWindow_Affine

	thumb_func_start GetWindowBgConfig
GetWindowBgConfig: ; 0x0201EE88
	ldr r0, [r0]
	bx lr
	thumb_func_end GetWindowBgConfig

	thumb_func_start GetWindowBgId
GetWindowBgId: ; 0x0201EE8C
	ldrb r0, [r0, #4]
	bx lr
	thumb_func_end GetWindowBgId

	thumb_func_start GetWindowWidth
GetWindowWidth: ; 0x0201EE90
	ldrb r0, [r0, #7]
	bx lr
	thumb_func_end GetWindowWidth

	thumb_func_start GetWindowHeight
GetWindowHeight: ; 0x0201EE94
	ldrb r0, [r0, #8]
	bx lr
	thumb_func_end GetWindowHeight

	thumb_func_start GetWindowX
GetWindowX: ; 0x0201EE98
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end GetWindowX

	thumb_func_start GetWindowY
GetWindowY: ; 0x0201EE9C
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end GetWindowY

	thumb_func_start GetWindowBaseTile
GetWindowBaseTile: ; 0x0201EEA0
	ldrh r0, [r0, #0xa]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x11
	bx lr
	thumb_func_end GetWindowBaseTile

	thumb_func_start GetWindowLeft
GetWindowLeft: ; 0x0201EEA8
	strb r1, [r0, #5]
	bx lr
	thumb_func_end GetWindowLeft

	thumb_func_start GetWindowTop
GetWindowTop: ; 0x0201EEAC
	strb r1, [r0, #6]
	bx lr
	thumb_func_end GetWindowTop

	thumb_func_start GetWindowPaletteNum
GetWindowPaletteNum: ; 0x0201EEB0
	strb r1, [r0, #9]
	bx lr
	thumb_func_end GetWindowPaletteNum

	thumb_func_start BgConfig_HandleScheduledScrollAndTransferOps
BgConfig_HandleScheduledScrollAndTransferOps: ; 0x0201EEB4
	push {r4, lr}
	add r4, r0, #0
	bl BgConfig_HandleScheduledScrolls
	add r0, r4, #0
	bl BgConfig_HandleScheduledBufferTransfers
	mov r0, #0
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BgConfig_HandleScheduledScrollAndTransferOps

	thumb_func_start BgConfig_HandleScheduledBufferTransfers
BgConfig_HandleScheduledBufferTransfers: ; 0x0201EECC
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #6]
	mov r0, #1
	tst r0, r1
	beq _0201EEE6
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #8]
	ldr r3, [r4, #0xc]
	mov r0, #0
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EEE6:
	ldrh r1, [r4, #6]
	mov r0, #2
	tst r0, r1
	beq _0201EEFC
	ldr r2, [r4, #0x3c]
	ldr r1, [r4, #0x34]
	ldr r3, [r4, #0x38]
	mov r0, #1
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EEFC:
	ldrh r1, [r4, #6]
	mov r0, #4
	tst r0, r1
	beq _0201EF12
	ldr r2, [r4, #0x68]
	ldr r1, [r4, #0x60]
	ldr r3, [r4, #0x64]
	mov r0, #2
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF12:
	ldrh r1, [r4, #6]
	mov r0, #8
	tst r0, r1
	beq _0201EF34
	add r2, r4, #0
	add r1, r4, #0
	add r2, #0x94
	add r3, r4, #0
	add r1, #0x8c
	ldr r2, [r2]
	add r3, #0x90
	ldr r1, [r1]
	ldr r3, [r3]
	mov r0, #3
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF34:
	ldrh r1, [r4, #6]
	mov r0, #0x10
	tst r0, r1
	beq _0201EF56
	add r2, r4, #0
	add r1, r4, #0
	add r2, #0xc0
	add r3, r4, #0
	add r1, #0xb8
	ldr r2, [r2]
	add r3, #0xbc
	ldr r1, [r1]
	ldr r3, [r3]
	mov r0, #4
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF56:
	ldrh r1, [r4, #6]
	mov r0, #0x20
	tst r0, r1
	beq _0201EF78
	add r2, r4, #0
	add r1, r4, #0
	add r2, #0xec
	add r3, r4, #0
	add r1, #0xe4
	ldr r2, [r2]
	add r3, #0xe8
	ldr r1, [r1]
	ldr r3, [r3]
	mov r0, #5
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF78:
	ldrh r0, [r4, #6]
	mov r3, #0x40
	tst r0, r3
	beq _0201EF98
	add r2, r3, #0
	add r1, r3, #0
	add r2, #0xd8
	add r1, #0xd0
	ldr r2, [r4, r2]
	add r3, #0xd4
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	mov r0, #6
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF98:
	ldrh r0, [r4, #6]
	mov r3, #0x80
	tst r0, r3
	beq _0201EFB8
	add r2, r3, #0
	add r1, r3, #0
	add r2, #0xc4
	add r1, #0xbc
	ldr r2, [r4, r2]
	add r3, #0xc0
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	mov r0, #7
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EFB8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BgConfig_HandleScheduledBufferTransfers

	thumb_func_start ScheduleBgTilemapBufferTransfer
ScheduleBgTilemapBufferTransfer: ; 0x0201EFBC
	ldrh r3, [r0, #6]
	mov r2, #1
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strh r1, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ScheduleBgTilemapBufferTransfer

	thumb_func_start BgConfig_HandleScheduledScrolls
BgConfig_HandleScheduledScrolls: ; 0x0201EFCC
	push {r4, lr}
	sub sp, #0x48
	add r4, r0, #0
	ldrh r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _0201EFF2
	ldr r1, [r4, #0x14]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	ldr r1, [r4, #0x18]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F208 ; =0x04000010
	str r1, [r0]
_0201EFF2:
	ldrh r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _0201F012
	ldr r1, [r4, #0x40]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	ldr r1, [r4, #0x44]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F20C ; =0x04000014
	str r1, [r0]
_0201F012:
	ldrh r1, [r4, #4]
	mov r0, #4
	tst r0, r1
	beq _0201F072
	add r0, r4, #0
	add r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201F03E
	ldr r1, [r4, #0x6c]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	ldr r1, [r4, #0x70]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F210 ; =0x04000018
	str r1, [r0]
	b _0201F072
_0201F03E:
	mov r0, #2
	str r0, [sp]
	add r1, r4, #0
	add r1, #0x78
	add r3, r4, #0
	add r3, #0x80
	ldrh r1, [r1]
	ldr r2, [r4, #0x7c]
	ldr r3, [r3]
	add r0, sp, #0x38
	bl MTX22_2DAffine
	ldr r0, [r4, #0x6c]
	add r2, r4, #0
	str r0, [sp]
	ldr r0, [r4, #0x70]
	add r3, r4, #0
	str r0, [sp, #4]
	add r2, #0x84
	add r3, #0x88
	ldr r0, _0201F214 ; =0x04000020
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, sp, #0x38
	bl G2x_SetBGyAffine_
_0201F072:
	ldrh r1, [r4, #4]
	mov r0, #8
	tst r0, r1
	beq _0201F0E2
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201F0A2
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x98
	add r2, #0x9c
	ldr r2, [r2]
	ldr r0, [r0]
	ldr r1, _0201F204 ; =0x000001FF
	lsl r2, r2, #0x10
	and r0, r1
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F218 ; =0x0400001C
	str r1, [r0]
	b _0201F0E2
_0201F0A2:
	mov r0, #2
	add r1, r4, #0
	str r0, [sp]
	add r1, #0xa4
	add r2, r4, #0
	add r3, r4, #0
	add r2, #0xa8
	add r3, #0xac
	ldrh r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	add r0, sp, #0x28
	bl MTX22_2DAffine
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r2, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r3, r4, #0
	str r0, [sp, #4]
	add r2, #0xb0
	add r3, #0xb4
	ldr r0, _0201F21C ; =0x04000030
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, sp, #0x28
	bl G2x_SetBGyAffine_
_0201F0E2:
	ldrh r1, [r4, #4]
	mov r0, #0x10
	tst r0, r1
	beq _0201F106
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0xc4
	add r2, #0xc8
	ldr r2, [r2]
	ldr r0, [r0]
	ldr r1, _0201F204 ; =0x000001FF
	lsl r2, r2, #0x10
	and r0, r1
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F220 ; =0x04001010
	str r1, [r0]
_0201F106:
	ldrh r1, [r4, #4]
	mov r0, #0x20
	tst r0, r1
	beq _0201F12A
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0xf0
	add r2, #0xf4
	ldr r2, [r2]
	ldr r0, [r0]
	ldr r1, _0201F204 ; =0x000001FF
	lsl r2, r2, #0x10
	and r0, r1
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F224 ; =0x04001014
	str r1, [r0]
_0201F12A:
	ldrh r0, [r4, #4]
	mov r3, #0x40
	tst r0, r3
	beq _0201F192
	add r0, r3, #0
	add r0, #0xe4
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0201F158
	ldr r1, _0201F204 ; =0x000001FF
	add r3, #0xdc
	add r2, r1, #0
	sub r2, #0xdf
	ldr r0, [r4, r3]
	ldr r2, [r4, r2]
	and r0, r1
	lsl r2, r2, #0x10
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F228 ; =0x04001018
	str r1, [r0]
	b _0201F192
_0201F158:
	mov r0, #2
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r1, #0xe8
	add r2, #0xec
	add r3, #0xf0
	ldrh r1, [r4, r1]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r0, sp, #0x18
	bl MTX22_2DAffine
	mov r3, #0x47
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #4
	ldr r0, [r4, r0]
	add r2, #0x18
	str r0, [sp, #4]
	add r3, #0x1c
	ldr r0, _0201F22C ; =0x04001020
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r1, sp, #0x18
	bl G2x_SetBGyAffine_
_0201F192:
	ldrh r0, [r4, #4]
	mov r3, #0x80
	tst r0, r3
	beq _0201F200
	add r0, r3, #0
	add r0, #0xd0
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0201F1C6
	add r3, #0xc8
	ldr r1, [r4, r3]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	add r1, r0, #0
	sub r1, #0xb3
	ldr r1, [r4, r1]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F230 ; =0x0400101C
	add sp, #0x48
	str r1, [r0]
	pop {r4, pc}
_0201F1C6:
	mov r0, #2
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r1, #0xd4
	add r2, #0xd8
	add r3, #0xdc
	ldrh r1, [r4, r1]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r0, sp, #8
	bl MTX22_2DAffine
	mov r3, #0x52
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #4
	ldr r0, [r4, r0]
	add r2, #0x18
	str r0, [sp, #4]
	add r3, #0x1c
	ldr r0, _0201F234 ; =0x04001030
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r1, sp, #8
	bl G2x_SetBGyAffine_
_0201F200:
	add sp, #0x48
	pop {r4, pc}
	.balign 4, 0
_0201F204: .word 0x000001FF
_0201F208: .word 0x04000010
_0201F20C: .word 0x04000014
_0201F210: .word 0x04000018
_0201F214: .word 0x04000020
_0201F218: .word 0x0400001C
_0201F21C: .word 0x04000030
_0201F220: .word 0x04001010
_0201F224: .word 0x04001014
_0201F228: .word 0x04001018
_0201F22C: .word 0x04001020
_0201F230: .word 0x0400101C
_0201F234: .word 0x04001030
	thumb_func_end BgConfig_HandleScheduledScrolls

	thumb_func_start ScheduleSetBgPosText
ScheduleSetBgPosText: ; 0x0201F238
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	mov r0, #0x2c
	add r1, #8
	mul r0, r4
	add r0, r1, r0
	add r1, r2, #0
	add r2, r3, #0
	bl Bg_SetPosText
	mov r0, #1
	ldrh r1, [r5, #4]
	lsl r0, r4
	orr r0, r1
	strh r0, [r5, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ScheduleSetBgPosText

	thumb_func_start ScheduleSetBgAffineRotation
ScheduleSetBgAffineRotation: ; 0x0201F25C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	mov r0, #0x2c
	add r1, #8
	mul r0, r4
	add r0, r1, r0
	add r1, r2, #0
	add r2, r3, #0
	bl Bg_SetAffineRotation
	mov r0, #1
	ldrh r1, [r5, #4]
	lsl r0, r4
	orr r0, r1
	strh r0, [r5, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ScheduleSetBgAffineRotation

	thumb_func_start Bg_SetAffineRotation
Bg_SetAffineRotation: ; 0x0201F280
	cmp r1, #8
	bhi _0201F2C8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201F290: ; jump table
	.short _0201F2C8 - _0201F290 - 2 ; case 0
	.short _0201F2C8 - _0201F290 - 2 ; case 1
	.short _0201F2C8 - _0201F290 - 2 ; case 2
	.short _0201F2A2 - _0201F290 - 2 ; case 3
	.short _0201F2A6 - _0201F290 - 2 ; case 4
	.short _0201F2AE - _0201F290 - 2 ; case 5
	.short _0201F2B6 - _0201F290 - 2 ; case 6
	.short _0201F2BA - _0201F290 - 2 ; case 7
	.short _0201F2C2 - _0201F290 - 2 ; case 8
_0201F2A2:
	str r2, [r0, #0x1c]
	bx lr
_0201F2A6:
	ldr r1, [r0, #0x1c]
	add r1, r1, r2
	str r1, [r0, #0x1c]
	bx lr
_0201F2AE:
	ldr r1, [r0, #0x1c]
	sub r1, r1, r2
	str r1, [r0, #0x1c]
	bx lr
_0201F2B6:
	str r2, [r0, #0x20]
	bx lr
_0201F2BA:
	ldr r1, [r0, #0x20]
	add r1, r1, r2
	str r1, [r0, #0x20]
	bx lr
_0201F2C2:
	ldr r1, [r0, #0x20]
	sub r1, r1, r2
	str r1, [r0, #0x20]
_0201F2C8:
	bx lr
	.balign 4, 0
	thumb_func_end Bg_SetAffineRotation

	thumb_func_start DoesPixelAtScreenXYMatchPtrVal
DoesPixelAtScreenXYMatchPtrVal: ; 0x0201F2CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp]
	add r6, r0, #0
	str r2, [sp, #4]
	ldr r0, [sp, #0x38]
	str r3, [sp, #8]
	str r0, [sp, #0x38]
	ldr r0, [sp]
	add r4, r6, #0
	mov r1, #0x2c
	add r5, r0, #0
	mul r5, r1
	add r4, #8
	ldr r0, [r4, r5]
	cmp r0, #0
	bne _0201F2F4
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F2F4:
	add r0, r6, #0
	str r0, [sp, #0x18]
	add r0, #0x1c
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r2, r6, r5
	lsl r0, r0, #0x15
	lsl r1, r1, #0x15
	ldrb r2, [r2, #0x1d]
	ldrb r3, [r3, r5]
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl GetTileMapIndexFromCoords
	add r7, r0, #0
	ldr r0, [sp]
	bl BgGetCharPtr
	str r0, [sp, #0x1c]
	ldr r1, [sp, #4]
	mov r0, #7
	and r1, r0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	add r0, r6, r5
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	bne _0201F3B2
	ldr r0, [r4, r5]
	mov r1, #0x40
	str r0, [sp, #0xc]
	ldr r0, [r6]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	lsl r0, r7, #1
	ldr r1, [sp, #0xc]
	mov ip, r0
	ldrh r0, [r1, r0]
	mov r3, #0
	mov r7, #0xf
	lsl r0, r0, #0x16
	lsr r1, r0, #0x11
	ldr r0, [sp, #0x1c]
	add r2, r0, r1
_0201F35E:
	ldrb r5, [r2, r3]
	lsl r0, r3, #1
	add r1, r4, r0
	and r5, r7
	strb r5, [r4, r0]
	ldrb r0, [r2, r3]
	asr r0, r0, #4
	strb r0, [r1, #1]
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #0x20
	blo _0201F35E
	ldr r2, [sp, #0xc]
	mov r1, ip
	ldrh r1, [r2, r1]
	add r0, r6, #0
	asr r2, r1, #0xa
	mov r1, #3
	and r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl ApplyFlipFlagsToTile
	ldr r0, [sp, #0x10]
	lsl r1, r0, #3
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	ldrb r5, [r4, r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x38]
	ldrh r2, [r0]
	mov r0, #1
	add r1, r0, #0
	lsl r1, r5
	tst r1, r2
	beq _0201F42A
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0201F3B2:
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, r5]
	cmp r0, #1
	beq _0201F3FE
	ldr r0, [r6]
	ldr r4, [r4, r5]
	mov r1, #0x40
	bl AllocFromHeapAtEnd
	lsl r7, r7, #1
	ldrh r1, [r4, r7]
	add r5, r0, #0
	lsl r1, r1, #0x16
	lsr r2, r1, #0x10
	ldr r1, [sp, #0x1c]
	add r1, r1, r2
	mov r2, #0x40
	bl memcpy
	ldrh r1, [r4, r7]
	add r0, r6, #0
	asr r2, r1, #0xa
	mov r1, #3
	and r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r5, #0
	bl ApplyFlipFlagsToTile
	ldr r0, [sp, #0x10]
	lsl r1, r0, #3
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	ldrb r4, [r5, r0]
	add r0, r5, #0
	bl FreeToHeap
	b _0201F412
_0201F3FE:
	ldr r1, [r4, r5]
	ldr r0, [sp, #0x10]
	ldrb r1, [r1, r7]
	lsl r0, r0, #3
	lsl r2, r1, #6
	ldr r1, [sp, #0x14]
	add r1, r1, r2
	add r1, r0, r1
	ldr r0, [sp, #0x1c]
	ldrb r4, [r0, r1]
_0201F412:
	ldr r0, [sp, #0x38]
	ldrh r2, [r0]
	lsl r0, r2, #0x18
	lsr r1, r0, #0x18
	ldr r0, _0201F430 ; =0x0000FFFF
_0201F41C:
	cmp r2, r0
	beq _0201F42A
	cmp r4, r1
	bne _0201F41C
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0201F42A:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201F430: .word 0x0000FFFF
	thumb_func_end DoesPixelAtScreenXYMatchPtrVal

	thumb_func_start ApplyFlipFlagsToTile
ApplyFlipFlagsToTile: ; 0x0201F434
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	ldr r1, [sp]
	add r7, r2, #0
	cmp r1, #0
	beq _0201F4C0
	ldr r0, [r0]
	mov r1, #0x40
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #1
	tst r0, r1
	beq _0201F482
	mov r0, #0
	mov r5, #7
_0201F456:
	lsl r3, r0, #3
	add r2, r7, r3
	mov r1, #0
	add r3, r4, r3
_0201F45E:
	sub r6, r5, r1
	ldrb r6, [r2, r6]
	strb r6, [r3, r1]
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #8
	blo _0201F45E
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #8
	blo _0201F456
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0x40
	bl memcpy
_0201F482:
	ldr r0, [sp]
	mov r1, #2
	tst r0, r1
	beq _0201F4BA
	mov r5, #0
	mov r6, #7
_0201F48E:
	lsl r0, r5, #3
	add r3, r4, r0
	sub r0, r6, r5
	lsl r0, r0, #3
	add r2, r7, r0
	mov r1, #8
_0201F49A:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _0201F49A
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #8
	blo _0201F48E
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0x40
	bl memcpy
_0201F4BA:
	add r0, r4, #0
	bl FreeToHeap
_0201F4C0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ApplyFlipFlagsToTile
