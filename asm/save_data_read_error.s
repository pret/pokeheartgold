#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ShowSaveDataReadError
ShowSaveDataReadError: ; 0x0209263C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A120
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _020927A0 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _020927A4 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, _020927A8 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r3, _020927AC ; =0x04000050
	mov r0, #0
	strh r0, [r3]
	ldr r2, _020927B0 ; =0x04001050
	sub r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _020927B4 ; =0xFFFF1FFF
	sub r2, #0x50
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, _020927B8 ; =_021082BC
	bl GX_SetBanks
	add r0, r4, #0
	bl BgConfig_Alloc
	add r5, r0, #0
	ldr r0, _020927BC ; =_02108290
	bl SetBothScreensModesAndDisable
	mov r1, #0
	ldr r2, _020927C0 ; =_021082A0
	add r0, r5, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r2, _020927C4 ; =0x000001F7
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
	ldr r1, _020927C8 ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _020927C8 ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0x1b
	mov r2, #8
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	add r4, r0, #0
	bl sub_02020080
	ldr r2, _020927CC ; =_02108288
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
	ldr r2, _020927C4 ; =0x000001F7
	add r0, sp, #0xc
	mov r1, #0
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r6, #0
	mov r1, #0
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
_02092790:
	bl HandleDSLidAction
	add r0, r4, #0
	add r1, r4, #0
	bl OS_WaitIrq
	b _02092790
	nop
_020927A0: .word 0xFFFFE0FF
_020927A4: .word 0x04001000
_020927A8: .word gMain + 0x60
_020927AC: .word 0x04000050
_020927B0: .word 0x04001050
_020927B4: .word 0xFFFF1FFF
_020927B8: .word _021082BC
_020927BC: .word _02108290
_020927C0: .word _021082A0
_020927C4: .word 0x000001F7
_020927C8: .word 0x00006C21
_020927CC: .word _02108288
	thumb_func_end ShowSaveDataReadError

	thumb_func_start ShowGBACartRemovedError
ShowGBACartRemovedError: ; 0x020927D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A120
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02092934 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02092938 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, _0209293C ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r3, _02092940 ; =0x04000050
	mov r0, #0
	strh r0, [r3]
	ldr r2, _02092944 ; =0x04001050
	sub r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _02092948 ; =0xFFFF1FFF
	sub r2, #0x50
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, _0209294C ; =_021082BC
	bl GX_SetBanks
	add r0, r4, #0
	bl BgConfig_Alloc
	add r5, r0, #0
	ldr r0, _02092950 ; =_02108290
	bl SetBothScreensModesAndDisable
	mov r1, #0
	ldr r2, _02092954 ; =_021082A0
	add r0, r5, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r2, _02092958 ; =0x000001F7
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
	ldr r1, _0209295C ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _0209295C ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0x1b
	mov r2, #8
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	add r4, r0, #0
	bl sub_02020080
	ldr r2, _02092960 ; =_02108288
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
	ldr r2, _02092958 ; =0x000001F7
	add r0, sp, #0xc
	mov r1, #0
	mov r3, #2
	bl DrawFrameAndWindow1
	add r0, r6, #0
	mov r1, #1
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
_02092924:
	bl HandleDSLidAction
	add r0, r4, #0
	add r1, r4, #0
	bl OS_WaitIrq
	b _02092924
	nop
_02092934: .word 0xFFFFE0FF
_02092938: .word 0x04001000
_0209293C: .word gMain + 0x60
_02092940: .word 0x04000050
_02092944: .word 0x04001050
_02092948: .word 0xFFFF1FFF
_0209294C: .word _021082BC
_02092950: .word _02108290
_02092954: .word _021082A0
_02092958: .word 0x000001F7
_0209295C: .word 0x00006C21
_02092960: .word _02108288
	thumb_func_end ShowGBACartRemovedError

	.rodata

	; File boundary
_02108288:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01
	.short 0x0023
_02108290:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021082A0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021082BC:
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
