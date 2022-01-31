#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ShowSaveDataWriteError
ShowSaveDataWriteError: ; 0x02092964
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	cmp r1, #0
	bne _02092972
	mov r6, #1
	b _02092974
_02092972:
	mov r6, #0
_02092974:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	bl sub_0201A0E0
	mov r0, #0
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
	ldr r0, _02092AD4 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02092AD8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, _02092ADC ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r3, _02092AE0 ; =0x04000050
	mov r1, #0
	strh r1, [r3]
	ldr r0, _02092AE4 ; =0x04001050
	sub r3, #0x50
	strh r1, [r0]
	ldr r2, [r3]
	ldr r1, _02092AE8 ; =0xFFFF1FFF
	sub r0, #0x50
	and r2, r1
	str r2, [r3]
	ldr r2, [r0]
	and r1, r2
	str r1, [r0]
	ldr r0, _02092AEC ; =_02108318
	bl GX_SetBanks
	add r0, r4, #0
	bl BgConfig_Alloc
	add r5, r0, #0
	ldr r0, _02092AF0 ; =_021082EC
	bl SetBothScreensModesAndDisable
	mov r1, #0
	ldr r2, _02092AF4 ; =_021082FC
	add r0, r5, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r2, _02092AF8 ; =0x000001F7
	add r0, r5, #0
	mov r3, #2
	str r4, [sp, #4]
	bl sub_0200E3DC
	mov r0, #0
	mov r1, #0x20
	add r2, r4, #0
	bl sub_02003030
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r1, _02092AFC ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _02092AFC ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0x1b
	mov r2, #9
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	add r4, r0, #0
	bl sub_02020080
	ldr r2, _02092B00 ; =_021082E4
	add r0, r5, #0
	add r1, sp, #0xc
	bl AddWindow
	mov r0, #0xd0
	str r0, [sp]
	mov r0, #0x90
	mov r2, #0
	str r0, [sp, #4]
	add r0, sp, #0xc
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r2, _02092AF8 ; =0x000001F7
	add r0, sp, #0xc
	mov r1, #0
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, sp, #0xc
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	bl GX_BothDispOn
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl SetBlendBrightness
	mov r4, #1
_02092AC6:
	bl HandleDSLidAction
	add r0, r4, #0
	add r1, r4, #0
	bl OS_WaitIrq
	b _02092AC6
	.balign 4, 0
_02092AD4: .word 0xFFFFE0FF
_02092AD8: .word 0x04001000
_02092ADC: .word gMain + 0x60
_02092AE0: .word 0x04000050
_02092AE4: .word 0x04001050
_02092AE8: .word 0xFFFF1FFF
_02092AEC: .word _02108318
_02092AF0: .word _021082EC
_02092AF4: .word _021082FC
_02092AF8: .word 0x000001F7
_02092AFC: .word 0x00006C21
_02092B00: .word _021082E4
	thumb_func_end ShowSaveDataWriteError

	.rodata

	; File boundary
_021082E4:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01,
	.short 0x0023
_021082EC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021082FC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02108318:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
