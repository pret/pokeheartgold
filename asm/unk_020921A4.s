#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020921A4
sub_020921A4: ; 0x020921A4
	push {r3, r4, r5, lr}
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x56
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r5, #0
	mov r1, #0x40
	mov r2, #0x56
	bl OverlayManager_CreateAndGetData
	mov r1, #0
	mov r2, #0x40
	add r4, r0, #0
	bl memset
	mov r0, #0x56
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	ldr r0, [r0, #8]
	str r0, [r4, #0x34]
	mov r0, #1
	bl sub_02002B8C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020921A4

	thumb_func_start sub_020921E4
sub_020921E4: ; 0x020921E4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r6, r0, #0
	mov r4, #0
	cmp r1, #0
	beq _02092200
	cmp r1, #1
	beq _0209225A
	cmp r1, #2
	beq _02092268
	b _0209227C
_02092200:
	add r0, r4, #0
	add r1, r4, #0
	bl sub_0200FBF4
	mov r0, #1
	add r1, r4, #0
	bl sub_0200FBF4
	add r0, r4, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02092280 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02092284 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r6, #0
	bl sub_020922B8
	add r0, r6, #0
	bl sub_020923CC
	bl GX_BothDispOn
	mov r0, #1
	str r0, [r5]
	b _0209227C
_0209225A:
	bl sub_02092428
	cmp r0, #1
	bne _0209227C
	mov r0, #2
	str r0, [r5]
	b _0209227C
_02092268:
	bl sub_02092414
	add r0, r6, #0
	bl sub_02092378
	add r0, r4, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r4, #1
_0209227C:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02092280: .word 0xFFFFE0FF
_02092284: .word 0x04001000
	thumb_func_end sub_020921E4

	.public gApp_MainMenu

	thumb_func_start sub_02092288
sub_02092288: ; 0x02092288
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	ldr r4, [r0]
	mov r0, #0
	bl sub_02002B8C
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	ldr r0, _020922B0 ; =FS_OVERLAY_ID(OVY_74)
	ldr r1, _020922B4 ; =gApp_MainMenu
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020922B0: .word FS_OVERLAY_ID(OVY_74)
_020922B4: .word gApp_MainMenu
	thumb_func_end sub_02092288

	thumb_func_start sub_020922B8
sub_020922B8: ; 0x020922B8
	push {r4, r5, lr}
	sub sp, #0x5c
	ldr r5, _02092364 ; =_02108250
	add r4, r0, #0
	add r3, sp, #0x34
	mov r2, #5
_020922C4:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020922C4
	add r0, sp, #0x34
	bl GX_SetBanks
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0x24
	ldr r5, _02092368 ; =_02108224
	str r0, [r4, #0x18]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0209236C ; =_02108234
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
	ldr r0, [r4, #0x18]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _02092370 ; =0x000001E2
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	ldr r2, _02092374 ; =0x000001D9
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
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
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	add sp, #0x5c
	pop {r4, r5, pc}
	.balign 4, 0
_02092364: .word _02108250
_02092368: .word _02108224
_0209236C: .word _02108234
_02092370: .word 0x000001E2
_02092374: .word 0x000001D9
	thumb_func_end sub_020922B8

	thumb_func_start sub_02092378
sub_02092378: ; 0x02092378
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
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02092378

	thumb_func_start sub_020923CC
sub_020923CC: ; 0x020923CC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xe5
	bl NewMsgDataFromNarc
	str r0, [r4, #0x1c]
	bl ResetAllTextPrinters
	mov r0, #0
	str r0, [r4, #0xc]
	add r1, r4, #0
	ldr r0, [r4, #0x18]
	ldr r2, _02092410 ; =_0210821C
	add r1, #0x20
	bl AddWindow
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	mov r2, #0
	add r4, #0x20
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	add sp, #8
	pop {r4, pc}
	nop
_02092410: .word _0210821C
	thumb_func_end sub_020923CC

	thumb_func_start sub_02092414
sub_02092414: ; 0x02092414
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x20
	bl RemoveWindow
	ldr r0, [r4, #0x1c]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02092414

	thumb_func_start sub_02092428
sub_02092428: ; 0x02092428
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #4]
	mov r5, #0
	cmp r1, #6
	bls _02092438
	b _02092562
_02092438:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02092444: ; jump table
	.short _02092452 - _02092444 - 2 ; case 0
	.short _0209246A - _02092444 - 2 ; case 1
	.short _020924DC - _02092444 - 2 ; case 2
	.short _02092508 - _02092444 - 2 ; case 3
	.short _02092516 - _02092444 - 2 ; case 4
	.short _02092542 - _02092444 - 2 ; case 5
	.short _02092560 - _02092444 - 2 ; case 6
_02092452:
	ldr r0, [r4, #0x34]
	bl Save_GetStatusFlags
	str r0, [r4, #0x3c]
	cmp r0, #0
	bne _02092464
	mov r0, #6
	str r0, [r4, #4]
	b _02092562
_02092464:
	mov r0, #1
	str r0, [r4, #4]
	b _02092562
_0209246A:
	mov r1, #2
	str r1, [r4, #4]
	ldr r0, [r4, #0x3c]
	add r2, r0, #0
	tst r2, r1
	beq _02092482
	mov r1, #3
	bic r0, r1
	str r0, [r4, #0x3c]
	mov r0, #1
	str r0, [r4, #8]
	b _02092562
_02092482:
	mov r2, #1
	add r3, r0, #0
	tst r3, r2
	beq _02092492
	eor r0, r2
	str r0, [r4, #0x3c]
	str r5, [r4, #8]
	b _02092562
_02092492:
	mov r2, #8
	tst r2, r0
	beq _020924A4
	mov r1, #0xc
	bic r0, r1
	str r0, [r4, #0x3c]
	mov r0, #5
	str r0, [r4, #8]
	b _02092562
_020924A4:
	mov r2, #4
	add r3, r0, #0
	tst r3, r2
	beq _020924B4
	eor r0, r2
	str r0, [r4, #0x3c]
	str r2, [r4, #8]
	b _02092562
_020924B4:
	mov r2, #0x20
	tst r2, r0
	beq _020924C6
	mov r1, #0x30
	bic r0, r1
	str r0, [r4, #0x3c]
	mov r0, #3
	str r0, [r4, #8]
	b _02092562
_020924C6:
	mov r2, #0x10
	add r3, r0, #0
	tst r3, r2
	beq _020924D6
	eor r0, r2
	str r0, [r4, #0x3c]
	str r1, [r4, #8]
	b _02092562
_020924D6:
	mov r0, #6
	str r0, [r4, #4]
	b _02092562
_020924DC:
	ldr r1, _02092568 ; =0x00006C21
	add r0, r5, #0
	bl BG_SetMaskColor
	ldr r1, _02092568 ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #3
	str r0, [r4, #4]
	b _02092562
_02092508:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02092562
	mov r0, #4
	str r0, [r4, #4]
	b _02092562
_02092516:
	ldr r1, [r4, #8]
	add r2, r5, #0
	mov r3, #4
	bl sub_0209256C
	cmp r0, #1
	bne _02092562
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #5
	str r0, [r4, #4]
	b _02092562
_02092542:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02092562
	add r0, r5, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	add r1, r5, #0
	bl BG_SetMaskColor
	mov r0, #1
	str r0, [r4, #4]
	b _02092562
_02092560:
	mov r5, #1
_02092562:
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02092568: .word 0x00006C21
	thumb_func_end sub_02092428

	thumb_func_start sub_0209256C
sub_0209256C: ; 0x0209256C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r7, r1, #0
	add r4, r3, #0
	mov r6, #0
	cmp r0, #0
	beq _02092588
	cmp r0, #1
	beq _020925F0
	cmp r0, #2
	beq _0209260C
	b _02092628
_02092588:
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x20
	mov r1, #0xf
	add r2, r6, #0
	add r3, r6, #0
	bl FillWindowPixelRect
	add r0, r5, #0
	ldr r2, _02092630 ; =0x000001E2
	add r0, #0x20
	add r1, r6, #0
	mov r3, #2
	bl DrawFrameAndWindow2
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #0xa
	bl String_ctor
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x1c]
	ldr r2, [r5, #0x14]
	add r1, r7, #0
	bl ReadMsgDataIntoString
	add r3, r6, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x14]
	add r0, #0x20
	mov r1, #1
	bl AddTextPrinterParameterized
	str r0, [r5, #0x10]
	cmp r4, #0
	bne _020925E8
	ldr r0, [r5, #0x14]
	bl String_dtor
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
_020925E8:
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02092628
_020925F0:
	ldr r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02092628
	ldr r0, [r5, #0x14]
	bl String_dtor
	ldr r0, [r5, #0xc]
	add r0, r0, #1
	str r0, [r5, #0xc]
	b _02092628
_0209260C:
	cmp r2, #0
	bne _02092622
	ldr r0, _02092634 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _02092622
	ldr r0, _02092638 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _02092628
_02092622:
	mov r0, #0
	str r0, [r5, #0xc]
	mov r6, #1
_02092628:
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02092630: .word 0x000001E2
_02092634: .word gSystem
_02092638: .word gSystem + 0x40
	thumb_func_end sub_0209256C

	.rodata

_0210821C:
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x01
	.short 0x016D
_02108224:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02108234:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02108250:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.public _02108278
_02108278:
	.word sub_020921A4, sub_020921E4, sub_02092288, 0xFFFFFFFF
