#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start App_DeleteSave_Init
App_DeleteSave_Init: ; 0x02091CDC
	push {r3, r4, r5, lr}
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x56
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x38
	mov r2, #0x56
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x38
	add r4, r0, #0
	bl memset
	mov r0, #0x56
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [r4, #0x30]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end App_DeleteSave_Init

	thumb_func_start App_DeleteSave_Exec
App_DeleteSave_Exec: ; 0x02091D18
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	mov r6, #0
	cmp r1, #3
	bhi _02091E20
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02091D38: ; jump table
	.short _02091D40 - _02091D38 - 2 ; case 0
	.short _02091DCE - _02091D38 - 2 ; case 1
	.short _02091DDC - _02091D38 - 2 ; case 2
	.short _02091E02 - _02091D38 - 2 ; case 3
_02091D40:
	mov r0, #0x3f
	lsl r0, r0, #4
	add r1, r6, #0
	bl StopBGM
	add r0, r6, #0
	bl sub_02005AF8
	add r0, r6, #0
	bl sub_02004AD8
	add r0, r6, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	add r1, r6, #0
	bl sub_0200FBF4
	add r0, r6, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02091E28 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02091E2C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	bl sub_02091E60
	add r0, r4, #0
	bl sub_02091F78
	ldr r0, _02091E30 ; =sub_02091E54
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl GX_BothDispOn
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r5]
	b _02091E20
_02091DCE:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02091E20
	mov r0, #2
	str r0, [r5]
	b _02091E20
_02091DDC:
	bl sub_02091FD4
	cmp r0, #1
	bne _02091E20
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #3
	str r0, [r5]
	b _02091E20
_02091E02:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02091E20
	add r0, r4, #0
	bl sub_02091FC0
	add r0, r4, #0
	bl sub_02091F24
	add r0, r6, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r6, #1
_02091E20:
	add r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02091E28: .word 0xFFFFE0FF
_02091E2C: .word 0x04001000
_02091E30: .word sub_02091E54
	thumb_func_end App_DeleteSave_Exec

	thumb_func_start App_DeleteSave_Exit
App_DeleteSave_Exit: ; 0x02091E34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	ldr r4, [r0]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #0
	bl OS_ResetSystem
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end App_DeleteSave_Exit

	thumb_func_start sub_02091E54
sub_02091E54: ; 0x02091E54
	ldr r3, _02091E5C ; =BgConfig_HandleScheduledScrollAndTransferOps
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02091E5C: .word BgConfig_HandleScheduledScrollAndTransferOps
	thumb_func_end sub_02091E54

	thumb_func_start sub_02091E60
sub_02091E60: ; 0x02091E60
	push {r4, r5, lr}
	sub sp, #0x5c
	ldr r5, _02091F0C ; =_021081E4
	add r4, r0, #0
	add r3, sp, #0x34
	mov r2, #5
_02091E6C:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02091E6C
	add r0, sp, #0x34
	bl GX_SetBanks
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0x24
	ldr r5, _02091F10 ; =_021081B8
	str r0, [r4, #0x14]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _02091F14 ; =_021081C8
	add r3, sp, #8
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
	ldr r0, [r4, #0x14]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _02091F18 ; =0x000001E2
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _02091F1C ; =0x000001D9
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	mov r3, #3
	bl LoadUserFrameGfx1
	ldr r2, [r4]
	mov r0, #0
	mov r1, #0x20
	bl LoadFontPal0
	mov r0, #0
	ldr r3, [r4]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r1, _02091F20 ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _02091F20 ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	add sp, #0x5c
	pop {r4, r5, pc}
	.balign 4, 0
_02091F0C: .word _021081E4
_02091F10: .word _021081B8
_02091F14: .word _021081C8
_02091F18: .word 0x000001E2
_02091F1C: .word 0x000001D9
_02091F20: .word 0x00006C21
	thumb_func_end sub_02091E60

	thumb_func_start sub_02091F24
sub_02091F24: ; 0x02091F24
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #1
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #5
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #6
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02091F24

	thumb_func_start sub_02091F78
sub_02091F78: ; 0x02091F78
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #7
	bl NewMsgDataFromNarc
	str r0, [r4, #0x18]
	bl ResetAllTextPrinters
	mov r0, #0
	str r0, [r4, #8]
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	ldr r2, _02091FBC ; =_021081A8
	add r1, #0x1c
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	mov r2, #0
	add r4, #0x1c
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	add sp, #8
	pop {r4, pc}
	nop
_02091FBC: .word _021081A8
	thumb_func_end sub_02091F78

	thumb_func_start sub_02091FC0
sub_02091FC0: ; 0x02091FC0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x1c
	bl RemoveWindow
	ldr r0, [r4, #0x18]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02091FC0

	thumb_func_start sub_02091FD4
sub_02091FD4: ; 0x02091FD4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #4]
	mov r5, #0
	cmp r1, #6
	bhi _020920CC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02091FEE: ; jump table
	.short _02091FFC - _02091FEE - 2 ; case 0
	.short _02092026 - _02091FEE - 2 ; case 1
	.short _02092046 - _02091FEE - 2 ; case 2
	.short _02092070 - _02091FEE - 2 ; case 3
	.short _02092090 - _02091FEE - 2 ; case 4
	.short _020920B0 - _02091FEE - 2 ; case 5
	.short _020920C2 - _02091FEE - 2 ; case 6
_02091FFC:
	add r1, r5, #0
	mov r2, #1
	mov r3, #4
	bl sub_020920E0
	cmp r0, #1
	bne _020920CC
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, _020920D4 ; =_021081B0
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r2, _020920D8 ; =0x000001D9
	mov r3, #3
	bl CreateYesNoMenu
	str r0, [r4, #0x2c]
	mov r0, #1
	str r0, [r4, #4]
	b _020920CC
_02092026:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4]
	bl Handle2dMenuInput_DeleteOnFinish
	cmp r0, #0
	beq _0209203A
	sub r1, r5, #2
	cmp r0, r1
	beq _02092040
	b _020920CC
_0209203A:
	mov r0, #2
	str r0, [r4, #4]
	b _020920CC
_02092040:
	mov r0, #6
	str r0, [r4, #4]
	b _020920CC
_02092046:
	mov r1, #1
	add r2, r1, #0
	mov r3, #4
	bl sub_020920E0
	cmp r0, #1
	bne _020920CC
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, _020920D4 ; =_021081B0
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r2, _020920D8 ; =0x000001D9
	mov r3, #3
	bl CreateYesNoMenu
	str r0, [r4, #0x2c]
	mov r0, #3
	str r0, [r4, #4]
	b _020920CC
_02092070:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4]
	bl Handle2dMenuInput_DeleteOnFinish
	cmp r0, #0
	beq _02092084
	sub r1, r5, #2
	cmp r0, r1
	beq _0209208A
	b _020920CC
_02092084:
	mov r0, #4
	str r0, [r4, #4]
	b _020920CC
_0209208A:
	mov r0, #6
	str r0, [r4, #4]
	b _020920CC
_02092090:
	mov r1, #2
	mov r2, #1
	add r3, r5, #0
	bl sub_020920E0
	cmp r0, #1
	bne _020920CC
	add r0, r4, #0
	ldr r1, _020920DC ; =0x000001E2
	add r0, #0x1c
	bl sub_0200F0AC
	str r0, [r4, #0x34]
	mov r0, #5
	str r0, [r4, #4]
	b _020920CC
_020920B0:
	ldr r0, [r4, #0x30]
	bl Save_DeleteAllData
	ldr r0, [r4, #0x34]
	bl sub_0200F450
	mov r0, #6
	str r0, [r4, #4]
	b _020920CC
_020920C2:
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl BgClearTilemapBufferAndCommit
	mov r5, #1
_020920CC:
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_020920D4: .word _021081B0
_020920D8: .word 0x000001D9
_020920DC: .word 0x000001E2
	thumb_func_end sub_02091FD4

	thumb_func_start sub_020920E0
sub_020920E0: ; 0x020920E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r7, r1, #0
	add r4, r3, #0
	mov r6, #0
	cmp r0, #0
	beq _020920FC
	cmp r0, #1
	beq _02092164
	cmp r0, #2
	beq _02092180
	b _02092194
_020920FC:
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x1c
	mov r1, #0xf
	add r2, r6, #0
	add r3, r6, #0
	bl FillWindowPixelRect
	add r0, r5, #0
	ldr r2, _0209219C ; =0x000001E2
	add r0, #0x1c
	add r1, r6, #0
	mov r3, #2
	bl DrawFrameAndWindow2
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	str r0, [r5, #0x10]
	ldr r0, [r5, #0x18]
	ldr r2, [r5, #0x10]
	add r1, r7, #0
	bl ReadMsgDataIntoString
	add r3, r6, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x10]
	add r0, #0x1c
	mov r1, #1
	bl AddTextPrinterParameterized
	str r0, [r5, #0xc]
	cmp r4, #0
	bne _0209215C
	ldr r0, [r5, #0x10]
	bl String_dtor
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0209215C:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02092194
_02092164:
	ldr r0, [r5, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02092194
	ldr r0, [r5, #0x10]
	bl String_dtor
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _02092194
_02092180:
	cmp r2, #0
	bne _0209218E
	ldr r0, _020921A0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02092194
_0209218E:
	mov r0, #0
	str r0, [r5, #8]
	mov r6, #1
_02092194:
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0209219C: .word 0x000001E2
_020921A0: .word gSystem
	thumb_func_end sub_020920E0

	.rodata

	.balign 4, 0
_021081A8:
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x01
	.short 0x016D
_021081B0:
	.byte 0x00, 0x19, 0x0D, 0x06, 0x04, 0x01
	.short 0x0155
_021081B8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021081C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021081E4:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.public _0210820C
_0210820C:
	.word App_DeleteSave_Init, App_DeleteSave_Exec, App_DeleteSave_Exit, 0xFFFFFFFF
