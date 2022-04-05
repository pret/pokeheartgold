#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.bss

_021D43B0:
	.space 0x4

	.text

	thumb_func_start sub_02082908
sub_02082908: ; 0x02082908
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _0208291E
	cmp r1, #1
	bne _0208291C
	b _02082A88
_0208291C:
	b _02082AC2
_0208291E:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02082AC8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02082ACC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r2, #0xa
	mov r0, #3
	mov r1, #0x12
	lsl r2, r2, #0xe
	bl CreateHeap
	ldr r1, _02082AD0 ; =0x000005D4
	add r0, r6, #0
	mov r2, #0x12
	bl OverlayManager_CreateAndGetData
	ldr r2, _02082AD0 ; =0x000005D4
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x12
	bl BgConfig_Alloc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0x1f
	mov r1, #0x12
	bl NARC_ctor
	add r7, r0, #0
	mov r0, #0x12
	bl ScrStrBufs_new
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xf9
	mov r3, #0x12
	bl NewMsgDataFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xfe
	mov r3, #0x12
	bl NewMsgDataFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xc5
	mov r3, #0x12
	bl NewMsgDataFromNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	bl sub_02083184
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020831A4
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02083160
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02083654
	mov r0, #2
	mov r1, #0x12
	bl FontID_Alloc
	ldr r0, _02082AD4 ; =sub_02083140
	mov r1, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02083334
	mov r0, #0
	mov r1, #0x12
	bl FontID_SetAccessDirect
	bl sub_0208377C
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020837AC
	add r0, r4, #0
	bl sub_020839EC
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02083F9C
	ldr r0, _02082AD8 ; =0x000004C4
	mov r3, #0x5f
	add r1, r4, r0
	lsl r3, r3, #2
	str r1, [sp]
	ldr r1, [r4, r3]
	add r2, r3, #0
	str r1, [sp, #4]
	sub r2, #0x24
	sub r0, #0xcc
	add r1, r4, #0
	sub r3, #0x22
	ldrh r2, [r4, r2]
	add r0, r4, r0
	add r1, #0xd8
	add r3, r4, r3
	bl sub_02084740
	mov r1, #0
	mov r0, #0x34
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #0x10
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	bl sub_020832E4
	ldr r0, _02082ADC ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	add r0, r7, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02082AC2
_02082A88:
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	bne _02082AA4
	ldr r1, _02082AE0 ; =0x000004B8
	ldr r2, [r4, #4]
	ldr r0, [r4, r1]
	add r1, #8
	ldr r1, [r4, r1]
	ldr r3, [r4, #8]
	bl sub_02082AEC
_02082AA4:
	ldr r0, _02082AE4 ; =_021D43B0
	mov r1, #1
	str r4, [r0]
	mov r0, #0
	mov r2, #0xc
	mov r3, #0x12
	bl sub_020163E0
	ldr r1, _02082AE8 ; =0x000005C4
	add sp, #0xc
	str r0, [r4, r1]
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02082AC2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02082AC8: .word 0xFFFFE0FF
_02082ACC: .word 0x04001000
_02082AD0: .word 0x000005D4
_02082AD4: .word sub_02083140
_02082AD8: .word 0x000004C4
_02082ADC: .word gSystem + 0x60
_02082AE0: .word 0x000004B8
_02082AE4: .word _021D43B0
_02082AE8: .word 0x000005C4
	thumb_func_end sub_02082908

	thumb_func_start sub_02082AEC
sub_02082AEC: ; 0x02082AEC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r2, #0
	mov r2, #2
	ldr r0, [r0, #0x14]
	ldr r1, _02082B1C ; =0x000057E0
	add r6, r3, #0
	lsl r2, r2, #8
	bl GX_LoadOBJ
	ldr r4, [r4, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl GetMonIconPaletteEx
	lsl r0, r0, #5
	add r0, r4, r0
	mov r1, #0xc0
	mov r2, #0x20
	bl GX_LoadOBJPltt
	pop {r4, r5, r6, pc}
	nop
_02082B1C: .word 0x000057E0
	thumb_func_end sub_02082AEC

	thumb_func_start sub_02082B20
sub_02082B20: ; 0x02082B20
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r6, r0, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #3
	bhi _02082B84
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02082B40: ; jump table
	.short _02082B48 - _02082B40 - 2 ; case 0
	.short _02082B5C - _02082B40 - 2 ; case 1
	.short _02082B90 - _02082B40 - 2 ; case 2
	.short _02082CBE - _02082B40 - 2 ; case 3
_02082B48:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02082B84
	mov r0, #1
	str r0, [r5]
	ldr r0, _02082CDC ; =0x000005CC
	mov r1, #0
	str r1, [r4, r0]
	b _02082CCC
_02082B5C:
	ldr r1, _02082CDC ; =0x000005CC
	ldr r2, [r4, r1]
	add r2, r2, #1
	str r2, [r4, r1]
	bl sub_02084FCC
	mov r2, #0x49
	lsl r2, r2, #4
	add r0, r4, r2
	mov r1, #0xcb
	sub r2, #0x30
	lsl r1, r1, #2
	ldr r2, [r4, r2]
	add r1, r4, r1
	bl sub_02084F3C
	ldr r0, _02082CDC ; =0x000005CC
	ldr r1, [r4, r0]
	cmp r1, #5
	bgt _02082B86
_02082B84:
	b _02082CCC
_02082B86:
	mov r1, #2
	str r1, [r5]
	mov r1, #0
	str r1, [r4, r0]
	b _02082CCC
_02082B90:
	ldr r3, _02082CE0 ; =0x0000045C
	ldr r2, [r4, r3]
	cmp r2, #7
	bhi _02082C6A
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02082BA4: ; jump table
	.short _02082C6A - _02082BA4 - 2 ; case 0
	.short _02082C6A - _02082BA4 - 2 ; case 1
	.short _02082C6A - _02082BA4 - 2 ; case 2
	.short _02082C6A - _02082BA4 - 2 ; case 3
	.short _02082BB4 - _02082BA4 - 2 ; case 4
	.short _02082BC8 - _02082BA4 - 2 ; case 5
	.short _02082C14 - _02082BA4 - 2 ; case 6
	.short _02082C40 - _02082BA4 - 2 ; case 7
_02082BB4:
	ldr r2, [r4, #0x34]
	cmp r2, #0
	bne _02082BC0
	bl sub_02082CF8
	str r0, [r5]
_02082BC0:
	add r0, r4, #0
	bl sub_02084FCC
	b _02082C6A
_02082BC8:
	add r1, r6, #0
	bl sub_020834FC
	ldr r0, _02082CE4 ; =0x00000448
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	ldr r0, _02082CE4 ; =0x00000448
	mov r2, #1
	add r0, r4, r0
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0xa
	bl DrawFrameAndWindow2
	mov r3, #0
	mov r2, #6
	ldr r0, _02082CE4 ; =0x00000448
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	str r3, [sp, #8]
	lsl r2, r2, #6
	ldr r2, [r4, r2]
	add r0, r4, r0
	bl AddTextPrinterParameterized
	ldr r1, _02082CE8 ; =0x00000458
	str r0, [r4, r1]
	sub r1, #0x10
	add r0, r4, r1
	bl CopyWindowToVram
	ldr r0, _02082CE0 ; =0x0000045C
	mov r1, #6
	str r1, [r4, r0]
	b _02082C6A
_02082C14:
	sub r0, r3, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02082C6A
	ldr r0, _02082CEC ; =0x000005E2
	bl PlaySE
	ldr r1, _02082CF0 ; =0x000004A8
	mov r2, #0
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	ldr r0, _02082CDC ; =0x000005CC
	sub r1, #0x4c
	str r2, [r4, r0]
	mov r0, #7
	str r0, [r4, r1]
	b _02082C6A
_02082C40:
	ldr r0, _02082CDC ; =0x000005CC
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	ble _02082C6A
	mov r0, #0x10
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #3
	str r0, [r5]
_02082C6A:
	ldr r3, _02082CF4 ; =0x00000464
	mov r1, #0xcb
	add r0, r4, r3
	str r0, [sp]
	add r0, r3, #4
	add r0, r4, r0
	lsl r1, r1, #2
	str r0, [sp, #4]
	add r0, r4, r1
	str r0, [sp, #8]
	add r0, r3, #0
	add r0, #0x4c
	ldr r0, [r4, r0]
	add r2, r3, #0
	ldr r0, [r0, #0x14]
	add r1, #0x8c
	str r0, [sp, #0xc]
	mov r0, #0x16
	lsl r0, r0, #4
	sub r3, r3, #4
	sub r2, #8
	ldr r0, [r4, r0]
	ldr r3, [r4, r3]
	add r1, r4, r1
	add r2, r4, r2
	bl sub_02083D34
	mov r2, #0x49
	lsl r2, r2, #4
	add r0, r4, r2
	mov r1, #0xcb
	sub r2, #0x30
	lsl r1, r1, #2
	ldr r2, [r4, r2]
	add r1, r4, r1
	bl sub_02084F3C
	add r0, r4, #0
	add r0, #0x38
	bl sub_02084500
	b _02082CCC
_02082CBE:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02082CCC
	add sp, #0x10
	mov r0, #1
	pop {r4, r5, r6, pc}
_02082CCC:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202457C
	mov r0, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02082CDC: .word 0x000005CC
_02082CE0: .word 0x0000045C
_02082CE4: .word 0x00000448
_02082CE8: .word 0x00000458
_02082CEC: .word 0x000005E2
_02082CF0: .word 0x000004A8
_02082CF4: .word 0x00000464
	thumb_func_end sub_02082B20

	thumb_func_start sub_02082CF8
sub_02082CF8: ; 0x02082CF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0208432C
	ldr r0, _02082E10 ; =gSystem
	mov r1, #4
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02082D9C
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020248B8
	cmp r0, #0
	bne _02082D2A
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02082D2A:
	ldr r0, [r5]
	cmp r0, #4
	beq _02082D74
	ldr r1, _02082E14 ; =0x0000045C
	mov r0, #0
	str r0, [r5, r1]
	add r2, r1, #4
	ldr r2, [r5, r2]
	add r3, r2, #1
	add r2, r1, #4
	str r3, [r5, r2]
	ldr r2, [r5, r2]
	cmp r2, #3
	blt _02082D4A
	add r1, r1, #4
	str r0, [r5, r1]
_02082D4A:
	mov r2, #0x49
	lsl r2, r2, #4
	add r1, r2, #0
	sub r1, #0x30
	ldr r1, [r5, r1]
	add r0, r5, r2
	lsl r3, r1, #2
	ldr r1, [r0, r3]
	sub r2, #0x30
	add r1, r1, #1
	str r1, [r0, r3]
	add r0, r5, #0
	ldr r1, [r5, r2]
	add r0, #0x3a
	bl sub_02084830
	ldr r0, _02082E18 ; =0x0000069D
	bl PlaySE
	mov r0, #1
	str r0, [r5, #0x30]
_02082D74:
	mov r2, #0x49
	lsl r2, r2, #4
	add r1, r2, #0
	sub r1, #0x30
	ldr r1, [r5, r1]
	add r0, r5, r2
	lsl r3, r1, #2
	ldr r1, [r0, r3]
	sub r2, #0x30
	add r1, r1, #1
	str r1, [r0, r3]
	add r0, r5, #0
	ldr r1, [r5, r2]
	add r0, #0x3a
	bl sub_02084830
	ldr r0, _02082E18 ; =0x0000069D
	bl PlaySE
	b _02082E0A
_02082D9C:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _02082DC2
	ldr r3, [r5, #0x20]
	mov r1, #0x1a
	mul r1, r3
	add r3, r5, r1
	ldr r1, [r5, #0x1c]
	add r0, r5, #0
	lsl r1, r1, #1
	add r1, r3, r1
	ldrh r1, [r1, #0x3a]
	bl sub_02084884
	add r4, r0, #0
	mov r0, #1
	str r0, [r5, #0x30]
	b _02082E0A
_02082DC2:
	ldr r1, _02082E1C ; =0x000005C8
	ldr r1, [r5, r1]
	cmp r1, #1
	bne _02082DE6
	ldr r2, [r5, #0x20]
	mov r1, #0x1a
	mul r1, r2
	add r2, r5, r1
	ldr r1, [r5, #0x1c]
	add r0, r5, #0
	lsl r1, r1, #1
	add r1, r2, r1
	ldrh r1, [r1, #0x3a]
	mov r2, #0
	bl sub_02084884
	add r4, r0, #0
	b _02082E0A
_02082DE6:
	mov r1, #2
	add r3, r0, #0
	tst r3, r1
	beq _02082DFA
	ldr r1, _02082E20 ; =0x0000E007
	add r0, r5, #0
	bl sub_02084884
	add r4, r0, #0
	b _02082E0A
_02082DFA:
	add r1, #0xfe
	tst r0, r1
	beq _02082E0A
	ldr r1, _02082E24 ; =0x0000E006
	add r0, r5, #0
	bl sub_02084884
	add r4, r0, #0
_02082E0A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02082E10: .word gSystem
_02082E14: .word 0x0000045C
_02082E18: .word 0x0000069D
_02082E1C: .word 0x000005C8
_02082E20: .word 0x0000E007
_02082E24: .word 0x0000E006
	thumb_func_end sub_02082CF8

	thumb_func_start sub_02082E28
sub_02082E28: ; 0x02082E28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	cmp r0, #0
	bne _02082E8A
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02082E52
	bl LCRandom
	mov r1, #0x12
	bl _s32_div_f
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
#ifndef HEARTGOLD
	add r1, #0x2A
#endif
	bl NewString_ReadMsgData
	add r6, r0, #0
	b _02082E6E
_02082E52:
	cmp r0, #1
	bne _02082E6E
	bl LCRandom
	mov r1, #0x12
	bl _s32_div_f
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
#ifdef HEARTGOLD
	add r1, #0x12
#else
	add r1, #0x3C
#endif
	bl NewString_ReadMsgData
	add r6, r0, #0
_02082E6E:
	ldr r0, [r4, #0x18]
	add r1, r6, #0
	bl StringCopy
	add r0, r6, #0
	bl String_dtor
	ldr r0, [r4, #0x18]
	add r4, #0x1c
	add r1, r4, #0
	mov r2, #0xa
	bl CopyStringToU16Array
	pop {r4, r5, r6, pc}
_02082E8A:
	cmp r0, #3
	bne _02082EB8
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
#ifdef HEARTGOLD
	mov r1, #0x54
#else
	mov r1, #0x55
#endif
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl StringCopy
	add r0, r5, #0
	bl String_dtor
	ldr r0, [r4, #0x18]
	add r4, #0x1c
	add r1, r4, #0
	mov r2, #0xa
	bl CopyStringToU16Array
	pop {r4, r5, r6, pc}
_02082EB8:
	mov r0, #1
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02082E28

	thumb_func_start sub_02082EC0
sub_02082EC0: ; 0x02082EC0
	push {r4, r5}
	ldr r1, _02082EE0 ; =0x000001DE
	ldr r2, _02082EE4 ; =0x0000FFFF
	mov r5, #1
	mov r3, #0
_02082ECA:
	ldrh r4, [r0]
	cmp r4, r2
	beq _02082EDA
	cmp r4, r1
	beq _02082ED6
	add r5, r3, #0
_02082ED6:
	add r0, r0, #2
	b _02082ECA
_02082EDA:
	add r0, r5, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02082EE0: .word 0x000001DE
_02082EE4: .word 0x0000FFFF
	thumb_func_end sub_02082EC0

	thumb_func_start sub_02082EE8
sub_02082EE8: ; 0x02082EE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	ldr r1, _020830C0 ; =0x0000FFFF
	lsl r0, r0, #1
	add r0, r4, r0
	add r0, #0xd8
	strh r1, [r0]
	ldr r0, [r4]
	cmp r0, #1
	bne _02082F32
	mov r0, #0x12
	bl AllocMonZeroed
	mov r3, #0xa
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #4]
	add r6, r0, #0
	mov r2, #5
	bl CreateMon
	add r0, r6, #0
	bl FreeToHeap
_02082F32:
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	cmp r0, #0
	beq _02082F58
	add r0, r4, #0
	sub r1, #0x40
	add r0, #0xd8
	add r1, r4, r1
	bl StringNotEqual
	cmp r0, #0
	beq _02082F58
	add r0, r4, #0
	add r0, #0xd8
	bl sub_02082EC0
	cmp r0, #0
	beq _02082F62
_02082F58:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02082E28
	b _02082F86
_02082F62:
	mov r0, #0x46
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0xd8
	bl CopyU16StringArray
	add r0, r5, #0
	add r1, r4, #0
	add r0, #0x1c
	add r1, #0xd8
	bl CopyU16StringArray
	add r1, r4, #0
	ldr r0, [r5, #0x18]
	add r1, #0xd8
	bl CopyU16ArrayToString
_02082F86:
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r7, #0xe7
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_02082F98:
	ldr r0, [r5, r7]
	bl sub_02007234
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #7
	blt _02082F98
	mov r0, #0xb1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200AEB0
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	mov r7, #0xad
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_02082FD6:
	ldr r0, [r5, r7]
	bl Destroy2DGfxResObjMan
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _02082FD6
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024504
	bl OamManager_Free
	ldr r1, _020830C4 ; =0x000004AC
	mov r0, #0x12
	ldr r1, [r4, r1]
	bl FreeToHeapExplicit
	ldr r0, [r4]
	cmp r0, #1
	bne _02083016
	ldr r1, _020830C8 ; =0x000004B4
	mov r0, #0x12
	ldr r1, [r4, r1]
	bl FreeToHeapExplicit
	ldr r1, _020830CC ; =0x000004BC
	mov r0, #0x12
	ldr r1, [r4, r1]
	bl FreeToHeapExplicit
_02083016:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #7
	bl FreeBgTilemapBuffer
	bl sub_0202168C
	bl sub_02022608
	mov r0, #0x16
	lsl r0, r0, #4
	mov r1, #0xee
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	add r1, r4, r1
	bl sub_02083614
	mov r0, #0
	bl FontID_SetAccessLazy
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _020830D0 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	mov r0, #2
	bl FontID_Release
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02083060
	bl String_dtor
_02083060:
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	ldr r0, [sp, #0x10]
	bl OverlayManager_FreeData
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x12
	bl DestroyHeap
	ldr r0, _020830D4 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020830C0: .word 0x0000FFFF
_020830C4: .word 0x000004AC
_020830C8: .word 0x000004B4
_020830CC: .word 0x000004BC
_020830D0: .word 0xFFFF1FFF
_020830D4: .word gSystem + 0x60
	thumb_func_end sub_02082EE8

	thumb_func_start sub_020830D8
sub_020830D8: ; 0x020830D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x54
	str r0, [sp]
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r0, _02083118 ; =0x0000FFFF
	ldr r1, [sp]
	strh r0, [r4, #0x1c]
	mov r0, #0x20
	bl String_ctor
	str r0, [r4, #0x18]
	mov r1, #0
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	ldr r0, [sp, #0x18]
	str r1, [r4, #0x10]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #0x1c]
	str r1, [r4, #8]
	str r0, [r4, #0x50]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02083118: .word 0x0000FFFF
	thumb_func_end sub_020830D8

	thumb_func_start sub_0208311C
sub_0208311C: ; 0x0208311C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _0208312A
	bl GF_AssertFail
_0208312A:
	cmp r4, #0
	bne _02083132
	bl GF_AssertFail
_02083132:
	ldr r0, [r4, #0x18]
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_0208311C

	thumb_func_start sub_02083140
sub_02083140: ; 0x02083140
	push {r3, lr}
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r3, _02083158 ; =OS_IRQTable
	ldr r1, _0208315C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	.balign 4, 0
_02083158: .word OS_IRQTable
_0208315C: .word 0x00003FF8
	thumb_func_end sub_02083140

	thumb_func_start sub_02083160
sub_02083160: ; 0x02083160
	ldr r2, [r1]
	str r2, [r0]
	ldr r2, [r1, #4]
	str r2, [r0, #4]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	ldr r2, [r1, #0xc]
	str r2, [r0, #0xc]
	ldr r2, [r1, #0x10]
	str r2, [r0, #0x10]
	ldr r2, [r1, #0x4c]
	str r2, [r0, #0x18]
	ldr r2, [r1, #0x50]
	mov r1, #0x5d
	lsl r1, r1, #4
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02083160

	thumb_func_start sub_02083184
sub_02083184: ; 0x02083184
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _020831A0 ; =_02102140
	add r3, sp, #0
	mov r2, #5
_0208318E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0208318E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_020831A0: .word _02102140
	thumb_func_end sub_02083184

	thumb_func_start sub_020831A4
sub_020831A4: ; 0x020831A4
	push {r3, r4, r5, lr}
	sub sp, #0x80
	ldr r5, _020832C8 ; =_02101D60
	add r3, sp, #0x70
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _020832CC ; =_02101ED4
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
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020832D0 ; =_02101FB4
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020832D4 ; =_02102078
	add r3, sp, #0x1c
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
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _020832D8 ; =_02101E10
	add r3, sp, #0
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
	mov r0, #0
	bl sub_020832E4
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x12
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x12
	bl BG_ClearCharDataRange
	mov r0, #1
	lsl r0, r0, #0x1a
	add r4, r0, #0
	ldr r2, [r0]
	ldr r1, _020832DC ; =0xFFFF1FFF
	add r4, #0x48
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	ldrh r3, [r4]
	mov r2, #0x3f
	mov r1, #0x14
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r4]
	add r4, r0, #0
	add r4, #0x4a
	ldrh r5, [r4]
	mov r1, #0x1f
	bic r5, r2
	orr r1, r5
	orr r1, r3
	strh r1, [r4]
	add r1, r0, #0
	mov r2, #0xff
	add r1, #0x40
	strh r2, [r1]
	mov r1, #0x40
	add r0, #0x44
	strh r1, [r0]
	ldr r0, _020832E0 ; =0x04001050
	mov r1, #0
	strh r1, [r0]
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020832C8: .word _02101D60
_020832CC: .word _02101ED4
_020832D0: .word _02101FB4
_020832D4: .word _02102078
_020832D8: .word _02101E10
_020832DC: .word 0xFFFF1FFF
_020832E0: .word 0x04001050
	thumb_func_end sub_020831A4

	thumb_func_start sub_020832E4
sub_020832E4: ; 0x020832E4
	push {r4, lr}
	add r4, r0, #0
	lsl r1, r4, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #2
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #4
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #0x10
	lsr r1, r1, #0x18
	bl GX_EngineAToggleLayers
	lsl r1, r4, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	thumb_func_end sub_020832E4

	thumb_func_start sub_02083334
sub_02083334: ; 0x02083334
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetParentWork
	add r7, r0, #0
	ldr r0, _020834E4 ; =0x0000045C
	mov r1, #4
	str r1, [r4, r0]
	add r0, #0xc
	add r0, r4, r0
	mov r1, #0
	bl sub_0208423C
	ldr r6, _020834E8 ; =0x00000464
	mov r0, #0x16
	ldr r3, [r4, r6]
	mov r5, #0xc
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r5, r6, #4
	ldr r0, [r4, r0]
	ldr r3, [r3, r5]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
	ldr r3, [r4, r6]
	mov r5, #0xc
	mov r0, #0x16
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r6, #8
	ldr r0, [r4, r0]
	ldr r3, [r3, r6]
	lsr r1, r1, #0x18
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r6, _020834E8 ; =0x00000464
	mov r0, #1
	ldr r1, [r4, r6]
	mov r5, #0xc
	add r3, r1, #0
	eor r3, r0
	mov r0, #0x16
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r5, r6, #4
	ldr r0, [r4, r0]
	ldr r3, [r3, r5]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
	ldr r1, [r4, r6]
	mov r0, #1
	add r3, r1, #0
	eor r3, r0
	mov r5, #0xc
	mov r0, #0x16
	lsl r0, r0, #4
	lsl r1, r3, #0x18
	mul r5, r3
	add r3, r4, r5
	add r6, #8
	ldr r0, [r4, r0]
	ldr r3, [r3, r6]
	lsr r1, r1, #0x18
	mov r2, #3
	bl BgSetPosTextAndCommit
	mov r1, #0x46
	ldr r0, _020834EC ; =0x0000FFFF
	lsl r1, r1, #2
	strh r0, [r4, r1]
	ldr r0, [r7, #0x18]
	cmp r0, #0
	beq _020833E8
	add r1, r4, r1
	mov r2, #0x20
	bl CopyStringToU16Array
_020833E8:
	add r1, r4, #0
	mov r0, #1
	add r1, #0xd8
	mov r2, #0x40
	bl MIi_CpuClear16
	ldr r0, [r4]
	cmp r0, #1
	bne _0208342E
	mov r0, #0x12
	bl AllocMonZeroed
	mov r3, #0xa
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r4, #4]
	add r5, r0, #0
	mov r2, #5
	bl CreateMon
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	add r0, r5, #0
	bl FreeToHeap
_0208342E:
	ldr r0, [r7, #0x44]
	cmp r0, #0
	beq _02083438
	mov r0, #1
	str r0, [r4, #0x14]
_02083438:
	ldr r2, [r4]
	mov r1, #0x5a
	lsl r1, r1, #2
	lsl r3, r2, #2
	ldr r2, _020834F0 ; =_021020B4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r2, [r2, r3]
	ldr r1, [r4, r1]
	mov r3, #0x12
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x10
	sub r1, #0xc
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #9
	mov r3, #0x12
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x10
	ldr r0, [r4, r1]
	mov r1, #7
	bl NewString_ReadMsgData
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x6c
	add r0, r4, r1
	bl StringLength
	mov r1, #0x56
	lsl r1, r1, #2
	strh r0, [r4, r1]
	mov r0, #0
	mov r2, #1
	str r0, [r4, #0x1c]
	str r2, [r4, #0x20]
	sub r1, r2, #2
	str r1, [r4, #0x24]
	str r1, [r4, #0x28]
	str r2, [r4, #0x30]
	ldr r2, _020834F4 ; =0x00000484
	str r0, [r4, #0x34]
	str r1, [r4, r2]
	add r1, r2, #4
	str r0, [r4, r1]
	add r2, #8
	str r0, [r4, r2]
	ldr r1, [r4, #0xc]
	ldr r2, _020834EC ; =0x0000FFFF
	lsl r1, r1, #1
	add r1, r4, r1
	add r1, #0xd8
	strh r2, [r1]
	mov r1, #0x49
	add r3, r4, #0
	add r2, r0, #0
	lsl r1, r1, #4
_020834BE:
	add r0, r0, #1
	str r2, [r3, r1]
	add r3, r3, #4
	cmp r0, #7
	blt _020834BE
	ldr r0, [r4]
	cmp r0, #4
	bne _020834D8
	ldr r0, _020834F8 ; =0x0000049C
	mov r1, #1
	add sp, #0x10
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020834D8:
	mov r0, #0x49
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020834E4: .word 0x0000045C
_020834E8: .word 0x00000464
_020834EC: .word 0x0000FFFF
_020834F0: .word _021020B4
_020834F4: .word 0x00000484
_020834F8: .word 0x0000049C
	thumb_func_end sub_02083334

	thumb_func_start sub_020834FC
sub_020834FC: ; 0x020834FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, r1, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0208360C
	mov r0, #0xc8
	mov r1, #0x12
	bl String_ctor
	add r7, r0, #0
	mov r0, #6
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r5, r0]
	ldr r0, [r4, #0x48]
	bl PCStorage_GetActiveBox
	add r6, r0, #0
	ldr r0, [r4, #0x48]
	bl PCStorage_FindFirstBoxWithEmptySlot
	str r0, [sp, #0x10]
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x48]
	mov r1, #1
	add r3, r6, #0
	bl BufferPCBoxName
	ldr r0, [sp, #0x10]
	cmp r6, r0
	beq _02083560
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x48]
	ldr r3, [sp, #0x10]
	mov r1, #2
	bl BufferPCBoxName
	ldr r0, [r4, #0x44]
	add r0, r0, #2
	str r0, [r4, #0x44]
	b _02083570
_02083560:
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x48]
	mov r1, #2
	add r3, r6, #0
	bl BufferPCBoxName
_02083570:
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _02083586
	add r0, r5, #0
	add r0, #0xd8
	bl sub_02082EC0
	cmp r0, #0
	beq _020835BC
_02083586:
	mov r0, #0x12
	bl AllocMonZeroed
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldr r1, [r5, #4]
	add r6, r0, #0
	mov r2, #1
	bl CreateMon
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl BufferBoxMonSpeciesName
	add r0, r6, #0
	bl FreeToHeap
	b _020835EA
_020835BC:
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r1, [r5, r1]
	ldr r0, _02083610 ; =0x0000FFFF
	lsl r1, r1, #1
	add r1, r5, r1
	add r1, #0xd8
	strh r0, [r1]
	add r1, r5, #0
	add r0, r7, #0
	add r1, #0xd8
	bl CopyU16ArrayToString
	mov r1, #0
	str r1, [sp]
	mov r0, #0x5a
	str r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r7, #0
	add r3, r1, #0
	bl BufferString
_020835EA:
	mov r1, #0x5a
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r4, #0x44]
	mov r3, #0x12
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #1
	str r0, [r5, #0x14]
	add r0, r7, #0
	bl String_dtor
_0208360C:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02083610: .word 0x0000FFFF
	thumb_func_end sub_020834FC

	thumb_func_start sub_02083614
sub_02083614: ; 0x02083614
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
_0208361C:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xa
	blt _0208361C
	add r0, r6, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r6, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r6, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r6, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	mov r0, #0x12
	add r1, r6, #0
	bl FreeToHeapExplicit
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02083614

	thumb_func_start sub_02083654
sub_02083654: ; 0x02083654
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r6, [r5, r0]
	mov r0, #0x60
	add r4, r1, #0
	mov r1, #0
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0xe
	mov r1, #0x47
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x12
	mov r1, #2
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #4
	add r2, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	add r2, r6, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0xe
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #6
	add r2, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	mov r0, #0xe
	str r3, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #7
	add r2, r6, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x12
	bl LoadFontPal1
	ldr r0, [r5, #0x18]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r0, #0x16
	lsl r0, r0, #4
	mov r1, #4
	add r2, r1, #0
	ldr r0, [r5, r0]
	add r2, #0xfc
	mov r3, #0xa
	bl LoadUserFrameGfx2
	mov r1, #6
	mov r0, #4
	lsl r1, r1, #6
	mov r2, #0x12
	bl LoadFontPal1
	mov r3, #0x4b
	mov r0, #0x12
	lsl r3, r3, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #1
	add r3, r5, r3
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r1, _02083778 ; =0x000004AC
	str r0, [r5, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02083778: .word 0x000004AC
	thumb_func_end sub_02083654

	thumb_func_start sub_0208377C
sub_0208377C: ; 0x0208377C
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _020837A8 ; =_02101D70
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0x14
	mov r1, #0x12
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_020837A8: .word _02101D70
	thumb_func_end sub_0208377C

	thumb_func_start sub_020837AC
sub_020837AC: ; 0x020837AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _020839A4 ; =0xFFCFFFEF
	add r3, r1, #0
	and r3, r0
	mov r1, #0x10
	orr r3, r1
	str r3, [r2]
	ldr r3, _020839A8 ; =0x04001000
	ldr r2, [r3]
	and r0, r2
	orr r0, r1
	str r0, [r3]
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x12
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	mov r1, #0x63
	lsl r1, r1, #2
	mov r0, #0x2c
	add r1, r5, r1
	mov r2, #0x12
	bl G2dRenderer_Init
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #4
	mov r2, #1
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r6, #0
	add r4, r5, #0
_02083812:
	mov r0, #2
	add r1, r6, #0
	mov r2, #0x12
	bl Create2DGfxResObjMan
	mov r1, #0xad
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02083812
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #0xa
	bl AddCharResObjFromOpenNarc
	mov r1, #0xb1
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #0x12
	sub r1, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0xb2
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xc
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xb3
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xe
	mov r3, #1
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x2d
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5]
	cmp r0, #1
	bne _020838FC
	ldr r0, [r5, #4]
	ldr r2, [r5, #8]
	mov r1, #0
	bl GetMonIconNaixEx
	ldr r3, _020839AC ; =0x000004B8
	add r1, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x14
	mov r2, #0
	add r3, r5, r3
	bl GfGfxLoader_GetCharData
	ldr r1, _020839B0 ; =0x000004B4
	str r0, [r5, r1]
	add r0, r1, #4
	mov r1, #2
	ldr r0, [r5, r0]
	lsl r1, r1, #8
	bl DC_FlushRange
	bl sub_02074490
	mov r2, #0x13
	lsl r2, r2, #6
	add r1, r0, #0
	mov r0, #0x14
	add r2, r5, r2
	mov r3, #0x12
	bl GfGfxLoader_GetPlttData
	ldr r1, _020839B4 ; =0x000004BC
	str r0, [r5, r1]
	add r0, r1, #4
	ldr r0, [r5, r0]
	mov r1, #0x80
	bl DC_FlushRange
_020838FC:
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #0xad
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	mov r2, #0xb
	bl AddCharResObjFromOpenNarc
	mov r1, #0xb5
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r2, #1
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0x12
	sub r1, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0xb6
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xd
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xb7
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x12
	sub r1, #0x1c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r7, #0
	mov r2, #0xf
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x2e
	lsl r1, r1, #4
	str r0, [r5, r1]
	sub r1, #0x1c
	ldr r0, [r5, r1]
	bl sub_0200ACF0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200ACF0
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020839A4: .word 0xFFCFFFEF
_020839A8: .word 0x04001000
_020839AC: .word 0x000004B8
_020839B0: .word 0x000004B4
_020839B4: .word 0x000004BC
	thumb_func_end sub_020837AC

	thumb_func_start sub_020839B8
sub_020839B8: ; 0x020839B8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r0, [r4]
	bl sub_020248AC
	ldr r1, [r0]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4, #0xc]
	lsl r1, r0, #4
	ldr r0, _020839E8 ; =_021021E8 + 4
	ldr r0, [r0, r1]
	add r1, sp, #0
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_020839E8: .word _021021E8 + 4
	thumb_func_end sub_020839B8

	thumb_func_start sub_020839EC
sub_020839EC: ; 0x020839EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	sub r0, r1, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0xad
	str r1, [sp, #0xc]
	mov r0, #1
	lsl r2, r2, #2
	str r0, [sp, #0x10]
	ldr r0, [r6, r2]
	add r3, r1, #0
	str r0, [sp, #0x14]
	add r0, r2, #4
	ldr r0, [r6, r0]
	str r0, [sp, #0x18]
	add r0, r2, #0
	add r0, #8
	ldr r0, [r6, r0]
	str r0, [sp, #0x1c]
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r6, r0]
	add r2, #0x30
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r6, r2
	add r2, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	mov r1, #1
	mov r3, #0xad
	str r1, [sp]
	sub r0, r1, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r6, r2]
	add r3, #0x54
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #2
	str r0, [sp, #0x2c]
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [sp, #0x30]
	mov r0, #6
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	str r0, [sp, #0x38]
	lsr r0, r1, #5
	mov r7, #0
	str r1, [sp, #0x34]
	str r7, [sp, #0x3c]
	str r0, [sp, #0x40]
	str r0, [sp, #0x44]
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	strh r7, [r0, #0x20]
	mov r0, #1
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	mov r0, #0x12
	ldr r4, _02083BAC ; =_021021E8
	str r0, [sp, #0x58]
	add r5, r6, #0
_02083AA8:
	ldr r0, [r4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [r4, #4]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r4, #8]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r4, #0xc]
	bl sub_02024ADC
	add r7, r7, #1
	add r4, #0x10
	add r5, r5, #4
	cmp r7, #9
	blt _02083AA8
	mov r0, #0xcf
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r7, _02083BAC ; =_021021E8
	mov r5, #0
	add r4, r6, #0
_02083AFE:
	ldr r0, _02083BB0 ; =sub_020839B8
	mov r1, #0x10
	mov r2, #5
	mov r3, #0x12
	bl sub_02007200
	mov r1, #0xe7
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	bl sub_0201F988
	mov r1, #0xd2
	lsl r1, r1, #2
	ldr r1, [r6, r1]
	str r1, [r0]
	mov r1, #0xcb
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r4, r4, #4
	str r1, [r0, #4]
	ldr r1, [r7]
	add r7, #0x10
	lsl r1, r1, #0xc
	str r1, [r0, #8]
	str r5, [r0, #0xc]
	add r5, r5, #1
	cmp r5, #7
	blt _02083AFE
	ldr r2, [r6, #0xc]
	mov r7, #0
	cmp r2, #0
	ble _02083B7E
	mov r5, #0x50
	add r4, r6, #0
_02083B46:
	lsl r0, r5, #0xc
	str r0, [sp, #0x34]
	mov r0, #0x27
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	add r0, sp, #0x2c
	bl CreateSprite
	mov r1, #0xd9
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x2b
	bl Set2dSpriteAnimSeqNo
	ldr r2, [r6, #0xc]
	add r7, r7, #1
	add r5, #0xc
	add r4, r4, #4
	cmp r7, r2
	blt _02083B46
_02083B7E:
	mov r1, #0x56
	lsl r1, r1, #2
	mov r0, #0xd9
	lsl r0, r0, #2
	ldrh r1, [r6, r1]
	add r0, r6, r0
	bl sub_02084E18
	add r0, r6, #0
	add r1, sp, #0x2c
	bl sub_02083BB4
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	nop
_02083BAC: .word _021021E8
_02083BB0: .word sub_020839B8
	thumb_func_end sub_020839EC

	thumb_func_start sub_02083BB4
sub_02083BB4: ; 0x02083BB4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #6
	add r5, r1, #0
	lsl r0, r0, #0xe
	str r0, [r5, #8]
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [r5, #0xc]
	add r0, r5, #0
	bl CreateSprite
	mov r1, #0xe5
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4]
	cmp r0, #7
	bhi _02083CAA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02083BEC: ; jump table
	.short _02083BFC - _02083BEC - 2 ; case 0
	.short _02083C64 - _02083BEC - 2 ; case 1
	.short _02083C56 - _02083BEC - 2 ; case 2
	.short _02083C1E - _02083BEC - 2 ; case 3
	.short _02083C48 - _02083BEC - 2 ; case 4
	.short _02083C3A - _02083BEC - 2 ; case 5
	.short _02083C2C - _02083BEC - 2 ; case 6
	.short _02083C48 - _02083BEC - 2 ; case 7
_02083BFC:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02083C10
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083C10:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x31
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083C1E:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x33
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083C2C:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x37
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083C3A:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x36
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083C48:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083C56:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x2f
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083C64:
	mov r0, #0xe5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x32
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x10]
	cmp r0, #2
	beq _02083CAA
	ldr r1, [r4, #0xc]
	mov r0, #0xd
	mul r0, r1
	add r0, #0x50
	lsl r0, r0, #0xc
	str r0, [r5, #8]
	mov r0, #0x1b
	lsl r0, r0, #0xc
	str r0, [r5, #0xc]
	add r0, r5, #0
	bl CreateSprite
	mov r1, #0xe6
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	ldr r0, [r4, r1]
	bne _02083CA4
	mov r1, #0x2d
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_02083CA4:
	mov r1, #0x2e
	bl Set2dSpriteAnimSeqNo
_02083CAA:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02083BB4

	thumb_func_start sub_02083CAC
sub_02083CAC: ; 0x02083CAC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	cmp r0, #6
	bhi _02083D2A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02083CCE: ; jump table
	.short _02083CDC - _02083CCE - 2 ; case 0
	.short _02083D2A - _02083CCE - 2 ; case 1
	.short _02083CF0 - _02083CCE - 2 ; case 2
	.short _02083D2A - _02083CCE - 2 ; case 3
	.short _02083D04 - _02083CCE - 2 ; case 4
	.short _02083D2A - _02083CCE - 2 ; case 5
	.short _02083D18 - _02083CCE - 2 ; case 6
_02083CDC:
	mov r0, #1
	ldr r1, [r4, #8]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_020247D4
	b _02083D2A
_02083CF0:
	mov r0, #3
	ldr r1, [r4, #8]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_020247D4
	b _02083D2A
_02083D04:
	mov r0, #2
	ldr r1, [r4, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4]
	add r1, sp, #0
	bl sub_020247D4
	b _02083D2A
_02083D18:
	ldr r0, [r4, #8]
	add r1, sp, #0
	str r0, [sp]
	ldr r0, [r4]
	bl sub_020247D4
	add r0, r5, #0
	bl sub_02007234
_02083D2A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02083CAC

	thumb_func_start sub_02083D34
sub_02083D34: ; 0x02083D34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x40]
	add r5, r2, #0
	str r1, [sp, #0x40]
	ldr r1, [sp, #0x48]
	mov r2, #1
	str r1, [sp, #0x48]
	ldr r1, [sp, #0x40]
	str r0, [sp, #0x10]
	ldr r6, [r1]
	add r7, r3, #0
	add r1, r6, #0
	eor r1, r2
	str r1, [sp, #0x18]
	ldr r1, [r5]
	ldr r4, [sp, #0x44]
	cmp r1, #4
	bls _02083D5E
	b _02083F02
_02083D5E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02083D6A: ; jump table
	.short _02083D74 - _02083D6A - 2 ; case 0
	.short _02083DC0 - _02083D6A - 2 ; case 1
	.short _02083DE6 - _02083D6A - 2 ; case 2
	.short _02083E80 - _02083D6A - 2 ; case 3
	.short _02083F02 - _02083D6A - 2 ; case 4
_02083D74:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xe
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	mov r0, #0x1f
	add r1, r7, #6
	add r3, r6, #0
	bl GfGfxLoader_LoadScrnData
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0208423C
	ldr r0, _02083F08 ; =_02101D40
	lsl r2, r6, #4
	ldrb r1, [r0, r7]
	ldr r0, [sp, #0x4c]
	ldr r3, _02083F0C ; =0x000E0F00
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r0, r0, r2
	lsl r2, r1, #4
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl sub_02084E54
	ldr r0, [r5]
	add sp, #0x28
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02083DC0:
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	mov r3, #0xee
	bl BgSetPosTextAndCommit
	mov r2, #3
	lsl r1, r6, #0x18
	add r3, r2, #0
	ldr r0, [sp, #0x10]
	lsr r1, r1, #0x18
	sub r3, #0x53
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	add sp, #0x28
	add r0, r0, #1
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02083DE6:
	mov r1, #0xc
	add r0, r6, #0
	mul r0, r1
	ldr r2, [r4, r0]
	str r0, [sp, #0x1c]
	sub r2, #0x18
	str r2, [r4, r0]
	ldr r0, [r4, r0]
	sub r1, #0xd
	cmp r0, r1
	bge _02083E3E
	ldr r0, _02083F10 ; =sub_02083CAC
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x12
	bl sub_02007200
	bl sub_0201F988
	add r7, r0, #0
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x1c]
	str r0, [r7]
	mov r0, #0
	str r0, [r7, #4]
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x1c]
	bl sub_020248AC
	ldr r0, [r0]
	str r0, [r7, #8]
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x1c]
	bl sub_020248AC
	ldr r0, [r0, #4]
	mov r1, #0xa
	str r0, [r7, #0xc]
	ldr r0, [sp, #0x1c]
	mvn r1, r1
	str r1, [r4, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_02083E3E:
	ldr r0, [sp, #0x18]
	mov r1, #0xc
	add r7, r0, #0
	add r5, r4, #4
	mul r7, r1
	ldr r0, [r5, r7]
	sub r0, #0xa
	str r0, [r5, r7]
	add r0, r1, #0
	ldr r2, [r5, r7]
	sub r0, #0xd0
	cmp r2, r0
	bge _02083E5C
	sub r1, #0xd0
	str r1, [r5, r7]
_02083E5C:
	ldr r3, [sp, #0x1c]
	lsl r1, r6, #0x18
	ldr r0, [sp, #0x10]
	ldr r3, [r4, r3]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	lsl r1, r1, #0x18
	ldr r3, [r5, r7]
	lsr r1, r1, #0x18
	mov r2, #3
	bl BgSetPosTextAndCommit
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_02083E80:
	ldr r1, [sp, #0x18]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	str r2, [sp, #0x20]
	add r7, r4, #4
	ldr r2, [r7, r2]
	ldr r1, [sp, #0x20]
	sub r2, #0xa
	str r2, [r7, r1]
	ldr r2, [r7, r1]
	add r1, r0, #0
	sub r1, #0xd0
	cmp r2, r1
	bge _02083EA4
	ldr r1, [sp, #0x20]
	sub r0, #0xd0
	str r0, [r7, r1]
_02083EA4:
	mov r0, #0xc
	mul r0, r6
	str r0, [sp, #0x24]
	ldr r3, [sp, #0x24]
	lsl r1, r6, #0x18
	ldr r0, [sp, #0x10]
	ldr r3, [r4, r3]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x20]
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x10]
	ldr r3, [r7, r3]
	lsr r1, r1, #0x18
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r0, [sp, #0x24]
	mov r1, #0xa
	ldr r0, [r4, r0]
	mvn r1, r1
	cmp r0, r1
	bne _02083F02
	ldr r0, [sp, #0x20]
	sub r1, #0xb9
	ldr r0, [r7, r0]
	cmp r0, r1
	bne _02083F02
	ldr r0, [r5]
	add r2, r4, #0
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [sp, #0x40]
	ldr r1, [r0]
	mov r0, #1
	eor r1, r0
	ldr r0, [sp, #0x40]
	str r1, [r0]
	ldr r0, [sp, #0x10]
	bl sub_0208421C
	ldr r0, _02083F14 ; =0x0000069A
	bl PlaySE
_02083F02:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02083F08: .word _02101D40
_02083F0C: .word 0x000E0F00
_02083F10: .word sub_02083CAC
_02083F14: .word 0x0000069A
	thumb_func_end sub_02083D34

	thumb_func_start sub_02083F18
sub_02083F18: ; 0x02083F18
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0xa
	add r5, r0, #0
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02083F18

	thumb_func_start sub_02083F48
sub_02083F48: ; 0x02083F48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r2, #0
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	mov r4, #0x10
	bl FontID_String_GetWidth
	add r6, r0, #0
	add r0, r5, #0
	bl GetWindowWidth
	lsl r1, r0, #3
	add r0, r6, #0
	add r0, #0x10
	cmp r0, r1
	ble _02083F70
	sub r4, r1, r6
_02083F70:
	add r0, r5, #0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	ldr r0, _02083F98 ; =0x000E0F01
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r7, #0
	add r3, r4, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02083F98: .word 0x000E0F01
	thumb_func_end sub_02083F48

	thumb_func_start sub_02083F9C
sub_02083F9C: ; 0x02083F9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	mov r1, #1
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, #0xf4
	str r0, [sp, #0x10]
	mov r0, #0x16
	lsl r0, r0, #4
	mov r1, #0xee
	lsl r1, r1, #2
	add r4, r2, #0
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r2, #1
	mov r1, #0xf2
	lsl r1, r1, #2
	str r2, [sp]
	mov r0, #0x1a
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x8e
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	str r0, [sp, #0x10]
	sub r0, #0xd8
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, [r5]
	cmp r0, #4
	bne _02084040
	mov r0, #0
	str r0, [sp]
	mov r0, #0xe
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r3, #1
	mov r2, #0x16
	str r3, [sp, #8]
	mov r0, #0x12
	str r0, [sp, #0xc]
	lsl r2, r2, #4
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #9
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x46
	mov r1, #4
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x3a
	bl sub_02084830
	mov r0, #0x4b
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	sub r0, #0xe8
	ldr r1, [r1, #0x14]
	ldr r3, _02084200 ; =0x000E0F00
	str r1, [sp]
	ldr r1, _02084204 ; =0x00000A0A
	add r0, r5, r0
	mov r2, #4
	bl sub_02084E54
	b _0208406A
_02084040:
	mov r0, #0x46
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x3a
	bl sub_02084830
	mov r1, #0x4b
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	ldr r3, _02084200 ; =0x000E0F00
	ldr r0, [r0, #0x14]
	mov r2, #0
	str r0, [sp]
	add r0, r1, #0
	sub r0, #0xe8
	add r0, r5, r0
	sub r1, #0xac
	bl sub_02084E54
_0208406A:
	mov r2, #2
	str r2, [sp]
	mov r3, #0x16
	str r3, [sp, #4]
	mov r1, #0x37
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r1, r1, #4
	str r1, [sp, #0x10]
	lsl r0, r3, #4
	add r1, #0x68
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #7
	bl AddWindowParameterized
	ldr r1, [r5, #0xc]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	asr r0, r0, #3
	add r4, r0, #1
	mov r0, #3
	str r0, [sp]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r2, #2
	mov r1, #0xe7
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r1, r1, #2
	mov r0, #0x16
	str r1, [sp, #0x10]
	lsl r0, r0, #4
	add r1, #0x4c
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #0xa
	bl AddWindowParameterized
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #3
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r2, #2
	mov r1, #0xf
	add r4, #9
	lsl r3, r4, #0x18
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r1, r1, #6
	mov r0, #0x16
	str r1, [sp, #0x10]
	lsl r0, r0, #4
	add r1, #0x78
	ldr r0, [r5, r0]
	add r1, r5, r1
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, _02084208 ; =0x00000438
	mov r1, #1
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldr r1, [r5]
	cmp r1, #5
	bne _02084122
	mov r2, #0x61
	ldr r0, _02084208 ; =0x00000438
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl sub_02083F48
	ldr r0, _02084208 ; =0x00000438
	add r0, r5, r0
	bl CopyWindowToVram
_02084122:
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	ldr r1, _0208420C ; =0x00000448
	str r2, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0x84
	str r0, [sp, #0x10]
	add r0, #0xdc
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, _0208420C ; =0x00000448
	mov r1, #0xf
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r2, #0x5e
	ldr r0, _0208420C ; =0x00000448
	lsl r2, r2, #2
	ldr r1, [r5]
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl sub_02083F18
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	mov r1, #0x46
	lsl r1, r1, #2
	ldrh r2, [r5, r1]
	ldr r0, _02084210 ; =0x0000FFFF
	cmp r2, r0
	beq _02084198
	add r0, r5, #0
	add r0, #0xd8
	add r1, r5, r1
	bl CopyU16StringArray
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	add r1, r5, #0
	ldr r0, _02084214 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
_02084198:
	mov r0, #0xee
	lsl r0, r0, #2
	mov r4, #0
	add r7, r5, r0
_020841A0:
	add r0, r4, #4
	lsl r6, r0, #4
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x78
	str r0, [sp, #0x10]
	add r0, #0xe8
	ldr r0, [r5, r0]
	add r1, r7, r6
	mov r2, #2
	mov r3, #0
	bl AddWindowParameterized
	add r0, r7, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	cmp r4, #3
	blt _020841A0
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	ldr r1, _02084218 ; =0x00000428
	str r3, [sp, #0xc]
	mov r0, #0x84
	str r0, [sp, #0x10]
	add r0, #0xdc
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl AddWindowParameterized
	ldr r0, _02084218 ; =0x00000428
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02084200: .word 0x000E0F00
_02084204: .word 0x00000A0A
_02084208: .word 0x00000438
_0208420C: .word 0x00000448
_02084210: .word 0x0000FFFF
_02084214: .word 0x000E0F01
_02084218: .word 0x00000428
	thumb_func_end sub_02083F9C

	thumb_func_start sub_0208421C
sub_0208421C: ; 0x0208421C
	push {r4, lr}
	add r4, r1, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #2
	bl SetBgPriority
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208421C

	thumb_func_start sub_0208423C
sub_0208423C: ; 0x0208423C
	push {r3, r4}
	mov r3, #0xc
	add r4, r1, #0
	mul r4, r3
	mov r2, #0xee
	str r2, [r0, r4]
	add r2, r3, #0
	sub r2, #0x5c
	add r4, r0, r4
	str r2, [r4, #4]
	mov r4, #1
	eor r1, r4
	mul r3, r1
	sub r4, #0xc
	str r4, [r0, r3]
	add r0, r0, r3
	str r2, [r0, #4]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0208423C

	thumb_func_start sub_02084264
sub_02084264: ; 0x02084264
	cmp r0, r2
	blt _0208426A
	add r0, r1, #0
_0208426A:
	cmp r0, r1
	bge _02084270
	sub r0, r2, #1
_02084270:
	bx lr
	.balign 4, 0
	thumb_func_end sub_02084264

	thumb_func_start sub_02084274
sub_02084274: ; 0x02084274
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	cmp r1, #0
	beq _02084318
	ldr r3, [r5, #0x20]
	mov r2, #0x1a
	mul r2, r3
	ldr r0, [r5, #0x1c]
	add r3, r5, r2
	lsl r2, r0, #1
	add r2, r3, r2
	ldrh r2, [r2, #0x3a]
	lsl r6, r1, #3
	ldr r1, _0208431C ; =_02102168
	str r2, [sp]
	ldr r1, [r1, r6]
	mov r2, #0xd
	add r0, r0, r1
	mov r1, #0
	bl sub_02084264
	add r4, r0, #0
	ldr r0, _02084320 ; =_02102168 + 4
	ldr r1, [r5, #0x20]
	ldr r0, [r0, r6]
	mov r2, #6
	add r0, r1, r0
	mov r1, #0
	bl sub_02084264
	add r7, r0, #0
	ldr r0, _0208431C ; =_02102168
	add r6, r0, r6
	b _020842F6
_020842B8:
	ldr r1, [r5, #0x28]
	cmp r1, #0
	bne _020842DA
	ldr r1, _02084324 ; =0x0000D004
	cmp r0, r1
	bne _020842DA
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _020842DA
	ldr r0, [r5, #0x2c]
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xd
	bl sub_02084264
	add r4, r0, #0
	b _020842F6
_020842DA:
	ldr r0, [r6]
	mov r1, #0
	add r0, r4, r0
	mov r2, #0xd
	bl sub_02084264
	add r4, r0, #0
	ldr r0, [r6, #4]
	mov r1, #0
	add r0, r7, r0
	mov r2, #6
	bl sub_02084264
	add r7, r0, #0
_020842F6:
	mov r0, #0x1a
	mul r0, r7
	lsl r1, r4, #1
	add r0, r5, r0
	add r0, r1, r0
	ldrh r0, [r0, #0x3a]
	ldr r1, _02084324 ; =0x0000D004
	cmp r0, r1
	beq _020842B8
	ldr r1, [sp]
	cmp r1, r0
	bne _02084314
	ldr r1, _02084328 ; =0x0000E001
	cmp r0, r1
	bhi _020842B8
_02084314:
	str r4, [r5, #0x1c]
	str r7, [r5, #0x20]
_02084318:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0208431C: .word _02102168
_02084320: .word _02102168 + 4
_02084324: .word 0x0000D004
_02084328: .word 0x0000E001
	thumb_func_end sub_02084274

	thumb_func_start sub_0208432C
sub_0208432C: ; 0x0208432C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xd3
	lsl r0, r0, #2
	mov r4, #0
	ldr r0, [r5, r0]
	add r6, r4, #0
	add r7, r4, #0
	bl sub_020248B8
	cmp r0, #0
	bne _02084346
	mov r7, #1
_02084346:
	ldr r0, _02084424 ; =gSystem
	ldr r1, [r0, #0x4c]
	mov r0, #0x40
	tst r0, r1
	beq _02084366
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r6, #1
	add r4, r4, #1
_02084366:
	ldr r0, _02084424 ; =gSystem
	ldr r1, [r0, #0x4c]
	mov r0, #0x80
	tst r0, r1
	beq _02084386
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r6, #2
	add r4, r4, #1
_02084386:
	ldr r0, _02084424 ; =gSystem
	ldr r1, [r0, #0x4c]
	mov r0, #0x20
	tst r0, r1
	beq _020843A6
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r6, #3
	add r4, r4, #1
_020843A6:
	ldr r0, _02084424 ; =gSystem
	ldr r1, [r0, #0x4c]
	mov r0, #0x10
	tst r0, r1
	beq _020843C6
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r6, #4
	add r4, r4, #1
_020843C6:
	ldr r0, _02084424 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #8
	tst r0, r1
	beq _020843EC
	ldr r0, _02084428 ; =0x000005DC
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xc
	str r0, [r5, #0x1c]
	mov r0, #0
	str r0, [r5, #0x20]
	add r4, r4, #1
_020843EC:
	add r0, r5, #0
	bl sub_0208503C
	ldr r1, _0208442C ; =0x000005C8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _02084400
	mov r6, #0
	add r4, r4, #1
_02084400:
	cmp r7, #1
	bne _0208440E
	add r0, r5, #0
	add r1, r6, #0
	mov r4, #0
	bl sub_02084430
_0208440E:
	cmp r4, #0
	beq _02084422
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02084274
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02084430
_02084422:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084424: .word gSystem
_02084428: .word 0x000005DC
_0208442C: .word 0x000005C8
	thumb_func_end sub_0208432C

	thumb_func_start sub_02084430
sub_02084430: ; 0x02084430
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x20]
	cmp r1, #0
	beq _0208448A
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _02084454
	cmp r0, r1
	beq _02084454
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
_02084454:
	cmp r4, #0
	beq _02084464
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
_02084464:
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #4
	add r0, #0x1a
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	sub r1, r0, #1
	mov r0, #0x13
	mul r0, r1
	add r0, #0x5b
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0xc
	bl sub_020247D4
	b _020844C6
_0208448A:
	mov r0, #0x1a
	mul r0, r1
	add r1, r5, r0
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #1
	add r0, r1, r0
	ldrh r1, [r0, #0x3a]
	ldr r0, _020844F0 ; =0x0000E002
	sub r1, r1, r0
	ldr r0, _020844F4 ; =_02101D80
	lsl r2, r1, #1
	ldrh r0, [r0, r2]
	ldr r2, _020844F8 ; =_02101D4C
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldrb r1, [r2, r1]
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
_020844C6:
	mov r0, #0xb4
	strh r0, [r5, #0x38]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020249D4
	ldr r0, [r5, #0x1c]
	lsl r1, r4, #3
	str r0, [r5, #0x24]
	ldr r0, [r5, #0x20]
	str r0, [r5, #0x28]
	ldr r0, _020844FC ; =_02102168
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _020844EA
	str r0, [r5, #0x2c]
_020844EA:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_020844F0: .word 0x0000E002
_020844F4: .word _02101D80
_020844F8: .word _02101D4C
_020844FC: .word _02102168
	thumb_func_end sub_02084430

	thumb_func_start sub_02084500
sub_02084500: ; 0x02084500
	push {r3, lr}
	ldrh r1, [r0]
	add r1, #0x14
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r2, r1
	bls _02084516
	mov r1, #0
	strh r1, [r0]
_02084516:
	ldrh r0, [r0]
	bl GF_SinDeg
	mov r1, #0xa
	mul r1, r0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	add r0, #0xf
	lsl r1, r0, #5
	mov r0, #0x1d
	orr r1, r0
	add r0, sp, #0
	strh r1, [r0]
	add r0, sp, #0
	mov r1, #0x3a
	mov r2, #2
	bl GX_LoadOBJPltt
	pop {r3, pc}
	thumb_func_end sub_02084500

	thumb_func_start sub_02084540
sub_02084540: ; 0x02084540
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp, #0x18]
	add r7, r1, #0
	mov r0, #2
	mov r1, #0x12
	str r2, [sp, #0x1c]
	str r3, [sp, #0x20]
	mov r4, #0
	bl String_ctor
	str r0, [sp, #0x28]
	ldrh r1, [r7]
	ldr r0, _02084630 ; =0x0000FFFF
	cmp r1, r0
	beq _02084626
	ldr r0, [sp, #0x54]
	ldr r6, [sp, #0x50]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x58]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x20]
	add r0, r0, #2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x30]
_02084578:
	lsl r0, r4, #1
	ldrh r1, [r7, r0]
	ldr r0, _02084634 ; =0x00002FFF
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #2
	bhi _020845C4
	mov r0, #0xc
	str r0, [sp]
	str r0, [sp, #4]
	add r2, r4, #0
	ldr r0, [sp, #0x1c]
	mul r2, r6
	add r0, r0, r2
	ldr r2, _02084638 ; =0x0000D001
	lsl r0, r0, #0x10
	sub r1, r1, r2
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r2, r1, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	lsr r1, r2, #0x1f
	add r1, r2, r1
	str r0, [sp, #0xc]
	mov r0, #0xc
	asr r2, r1, #1
	ldr r1, [sp, #0x30]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r1, r1, r2
	mov r2, #0
	ldr r0, [sp, #0x18]
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	b _0208461A
_020845C4:
	ldr r0, _0208463C ; =0x0000D004
	cmp r1, r0
	bne _020845CE
	add r4, r4, #1
	b _0208461C
_020845CE:
	add r0, sp, #0x38
	strh r1, [r0]
	ldr r1, _02084630 ; =0x0000FFFF
	strh r1, [r0, #2]
	mov r0, #0
	add r1, sp, #0x38
	add r2, r0, #0
	bl FontID_FlatArray_GetWidth
	add r5, r0, #0
	ldr r0, [sp, #0x28]
	add r1, sp, #0x38
	bl CopyU16ArrayToString
	ldr r0, [sp, #0x20]
	sub r3, r6, r5
	str r0, [sp]
	ldr r0, [sp, #0x24]
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r3, r5, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	mov ip, r3
	add r5, r4, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	mul r5, r6
	add r3, r3, r5
	mov r5, ip
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x28]
	mov r1, #0
	add r3, r5, r3
	bl AddTextPrinterParameterized2
_0208461A:
	add r4, r4, #1
_0208461C:
	lsl r0, r4, #1
	ldrh r1, [r7, r0]
	ldr r0, _02084630 ; =0x0000FFFF
	cmp r1, r0
	bne _02084578
_02084626:
	ldr r0, [sp, #0x28]
	bl String_dtor
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02084630: .word 0x0000FFFF
_02084634: .word 0x00002FFF
_02084638: .word 0x0000D001
_0208463C: .word 0x0000D004
	thumb_func_end sub_02084540

	thumb_func_start sub_02084640
sub_02084640: ; 0x02084640
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r5, #0
	add r6, r1, #0
	str r5, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	str r3, [sp, #8]
	add r1, r2, #0
	add r2, r6, #0
	add r3, r5, #0
	add r4, r0, #0
	str r5, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [r4, #0xc]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02084640

	thumb_func_start sub_02084664
sub_02084664: ; 0x02084664
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r6, r0, #0
	str r1, [sp, #8]
	add r0, #0x30
	mov r1, #0
	add r5, r2, #0
	add r4, r3, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	ldr r3, _02084730 ; =0x000D0E0F
	add r0, #0x30
	add r1, r4, #0
	mov r2, #2
	bl sub_02084640
	mov r1, #2
	lsl r1, r1, #0xa
	bl DC_FlushRange
	add r7, r6, #0
	mov r4, #0
	add r7, #0x30
_02084694:
	mov r0, #0
	str r0, [sp]
	add r0, r7, #0
	mov r1, #4
	mov r2, #2
	lsl r3, r4, #2
	str r5, [sp, #4]
	bl sub_02013A50
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	ldr r1, _02084734 ; =_02101D3C
	mov r2, #1
	ldrb r1, [r1, r4]
	add r0, r5, #0
	lsl r2, r2, #8
	lsl r1, r1, #5
	bl GXS_LoadOBJ
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #4
	blo _02084694
	mov r0, #0x15
	mov r1, #0x12
	bl String_ctor
	add r4, r0, #0
	mov r5, #0
_020846D6:
	ldr r0, [sp, #8]
	lsl r1, r5, #1
	ldrh r1, [r0, r1]
	add r0, sp, #0xc
	lsl r7, r5, #4
	strh r1, [r0]
	ldr r1, _02084738 ; =0x0000FFFF
	strh r1, [r0, #2]
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r1, sp, #0xc
	bl CopyU16ArrayToString
	ldr r3, _02084730 ; =0x000D0E0F
	add r0, r6, r7
	add r1, r4, #0
	mov r2, #2
	bl sub_02084640
	mov r1, #0x80
	add r7, r0, #0
	bl DC_FlushRange
	ldr r1, _0208473C ; =_02101D54
	lsl r2, r5, #2
	ldr r1, [r1, r2]
	add r0, r7, #0
	lsl r1, r1, #5
	mov r2, #0x80
	bl GXS_LoadOBJ
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _020846D6
	add r0, r4, #0
	bl String_dtor
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02084730: .word 0x000D0E0F
_02084734: .word _02101D3C
_02084738: .word 0x0000FFFF
_0208473C: .word _02101D54
	thumb_func_end sub_02084664

	thumb_func_start sub_02084740
sub_02084740: ; 0x02084740
	push {r3, r4, r5, lr}
	cmp r2, #0
	bne _0208474A
	ldr r1, _0208481C ; =0x0000D003
	b _02084750
_0208474A:
	sub r2, r2, #1
	lsl r2, r2, #1
	ldrh r1, [r1, r2]
_02084750:
	ldr r4, _02084820 ; =0x0000E003
	cmp r1, r4
	bgt _02084780
	bge _020847A6
	ldr r2, _02084824 ; =0x0000D004
	cmp r1, r2
	bgt _02084778
	sub r2, r2, #3
	sub r2, r1, r2
	bmi _020847A8
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02084770: ; jump table
	.short _020847A6 - _02084770 - 2 ; case 0
	.short _020847A6 - _02084770 - 2 ; case 1
	.short _020847A6 - _02084770 - 2 ; case 2
	.short _020847A6 - _02084770 - 2 ; case 3
_02084778:
	ldr r2, _02084828 ; =0x0000E002
	cmp r1, r2
	beq _020847A6
	b _020847A8
_02084780:
	add r2, r4, #1
	cmp r1, r2
	bgt _0208478A
	beq _020847A6
	b _020847A8
_0208478A:
	add r2, r4, #2
	sub r2, r1, r2
	cmp r2, #3
	bhi _020847A8
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0208479E: ; jump table
	.short _020847A6 - _0208479E - 2 ; case 0
	.short _020847A6 - _0208479E - 2 ; case 1
	.short _020847A6 - _0208479E - 2 ; case 2
	.short _020847A6 - _0208479E - 2 ; case 3
_020847A6:
	mov r1, #1
_020847A8:
	mov r4, #0
	add r5, r3, #0
	mov r2, #1
_020847AE:
	add r4, r4, #1
	strh r2, [r5]
	add r5, r5, #2
	cmp r4, #3
	blt _020847AE
	strh r1, [r3]
	cmp r1, #1
	beq _0208480E
	ldr r5, _0208482C ; =_02102422
	mov r2, #0
_020847C2:
	ldrh r4, [r5]
	cmp r1, r4
	bne _020847E4
	mov r4, #6
	ldr r5, _0208482C ; =_02102422
	mul r4, r2
	add r4, r5, r4
	mov r1, #0
	add r5, r3, #0
_020847D4:
	ldrh r2, [r4]
	add r1, r1, #1
	add r4, r4, #2
	strh r2, [r5]
	add r5, r5, #2
	cmp r1, #3
	blt _020847D4
	b _0208480E
_020847E4:
	ldrh r4, [r5, #4]
	cmp r1, r4
	bne _02084806
	mov r4, #6
	ldr r5, _0208482C ; =_02102422
	mul r4, r2
	add r4, r5, r4
	mov r1, #0
	add r5, r3, #0
_020847F6:
	ldrh r2, [r4]
	add r1, r1, #1
	add r4, r4, #2
	strh r2, [r5]
	add r5, r5, #2
	cmp r1, #3
	blt _020847F6
	b _0208480E
_02084806:
	add r2, r2, #1
	add r5, r5, #6
	cmp r2, #0x52
	blo _020847C2
_0208480E:
	add r1, r3, #0
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl sub_02084664
	pop {r3, r4, r5, pc}
	nop
_0208481C: .word 0x0000D003
_02084820: .word 0x0000E003
_02084824: .word 0x0000D004
_02084828: .word 0x0000E002
_0208482C: .word _02102422
	thumb_func_end sub_02084740

	thumb_func_start sub_02084830
sub_02084830: ; 0x02084830
	push {r4, r5, r6, r7}
	mov r4, #0
	ldr r3, _0208487C ; =_021104E4
	add r5, r4, #0
	add r6, r0, #0
	lsl r2, r1, #2
_0208483C:
	ldr r7, [r3, r2]
	add r4, r4, #1
	ldrh r7, [r7, r5]
	add r5, r5, #2
	strh r7, [r6]
	add r6, r6, #2
	cmp r4, #0xd
	blt _0208483C
	mov r3, #0x14
	ldr r4, _02084880 ; =_021104F8
	mul r3, r1
	mov r2, #0
	add r3, r4, r3
	add r1, r2, #0
_02084858:
	add r6, r1, #0
	add r4, r1, #0
	add r5, r0, #0
_0208485E:
	ldr r7, [r3]
	add r6, r6, #1
	ldrh r7, [r7, r4]
	add r4, r4, #2
	strh r7, [r5, #0x1a]
	add r5, r5, #2
	cmp r6, #0xd
	blt _0208485E
	add r2, r2, #1
	add r3, r3, #4
	add r0, #0x1a
	cmp r2, #5
	blt _02084858
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0208487C: .word _021104E4
_02084880: .word _021104F8
	thumb_func_end sub_02084830

	thumb_func_start sub_02084884
sub_02084884: ; 0x02084884
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, _02084BBC ; =0x00002FFD
	add r5, r1, #0
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r6, r2, #0
	cmp r0, #1
	bhi _0208489C
	mov r5, #1
_0208489C:
	ldr r0, [r4]
	cmp r0, #4
	bne _020848B0
	ldr r0, _02084BC0 ; =0x00001FFE
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #3
	bhi _020848B0
	mov r5, #1
_020848B0:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020248B8
	cmp r0, #0
	bne _020848D8
	ldr r0, _02084BC4 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _020848D8
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #0x10
	mov r0, #2
	pop {r4, r5, r6, pc}
_020848D8:
	ldr r0, _02084BC8 ; =0x0000E002
	cmp r5, r0
	bgt _020848F6
	blt _020848E2
	b _02084A0A
_020848E2:
	ldr r3, _02084BCC ; =0x0000D002
	cmp r5, r3
	bgt _020848F4
	sub r0, r3, #1
	cmp r5, r0
	blt _020848F4
	beq _02084918
	cmp r5, r3
	beq _0208496A
_020848F4:
	b _02084B2E
_020848F6:
	add r0, r0, #1
	sub r0, r5, r0
	cmp r0, #5
	bls _02084900
	b _02084B2E
_02084900:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208490C: ; jump table
	.short _02084A0A - _0208490C - 2 ; case 0
	.short _02084A0A - _0208490C - 2 ; case 1
	.short _02084A0A - _0208490C - 2 ; case 2
	.short _020849B8 - _0208490C - 2 ; case 3
	.short _02084A40 - _0208490C - 2 ; case 4
	.short _02084AE4 - _0208490C - 2 ; case 5
_02084918:
	add r0, r4, #0
	add r0, #0xd8
	str r0, [sp]
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	ldr r3, _02084BD0 ; =0x0000D001
	mov r1, #0x52
	str r0, [sp, #4]
	mov r0, #0x2a
	mov r2, #1
	bl sub_02084D04
	cmp r0, #0
	bne _02084938
	b _02084C4E
_02084938:
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r4, #0xd8
	add r1, r4, #0
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	b _02084C4E
_0208496A:
	add r0, r4, #0
	add r0, #0xd8
	str r0, [sp]
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	mov r1, #0x52
	mov r2, #2
	str r0, [sp, #4]
	mov r0, #0x48
	bl sub_02084D04
	cmp r0, #0
	beq _02084A4A
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r4, #0xd8
	add r1, r4, #0
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	b _02084C4E
_020849B8:
	mov r3, #0x56
	lsl r3, r3, #2
	ldrh r3, [r4, r3]
	add r2, r4, #0
	mov r0, #0
	mov r1, #0x52
	add r2, #0xd8
	bl sub_02084C98
	cmp r0, #0
	beq _02084A4A
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	add r1, r4, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	mov r0, #0x4a
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	b _02084C4E
_02084A0A:
	mov r1, #0x46
	lsl r1, r1, #4
	ldr r0, _02084BC8 ; =0x0000E002
	ldr r2, [r4, r1]
	sub r5, r5, r0
	cmp r2, r5
	beq _02084A4A
	mov r2, #0
	sub r0, r1, #4
	str r2, [r4, r0]
	str r5, [r4, r1]
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x3a
	bl sub_02084830
	mov r0, #0x49
	lsl r0, r0, #4
	add r2, r4, r0
	lsl r1, r5, #2
	ldr r0, [r2, r1]
	add r0, r0, #1
	str r0, [r2, r1]
	ldr r0, _02084BDC ; =0x0000069D
	bl PlaySE
	b _02084C4E
_02084A40:
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	cmp r0, #0
	bne _02084A4C
_02084A4A:
	b _02084C4E
_02084A4C:
	sub r0, r0, #1
	lsl r0, r0, #1
	add r0, r4, r0
	ldr r2, _02084BE0 ; =0x0000FFFF
	add r0, #0xd8
	strh r2, [r0]
	ldrh r0, [r4, r1]
	sub r0, r0, #1
	strh r0, [r4, r1]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _02084A80
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	bl CopyWindowToVram
	b _02084A9E
_02084A80:
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
_02084A9E:
	ldr r0, _02084BE4 ; =0x000004C4
	mov r3, #0x5f
	add r1, r4, r0
	lsl r3, r3, #2
	str r1, [sp]
	ldr r1, [r4, r3]
	add r2, r3, #0
	str r1, [sp, #4]
	sub r2, #0x24
	sub r0, #0xcc
	add r1, r4, #0
	sub r3, #0x22
	ldrh r2, [r4, r2]
	add r0, r4, r0
	add r1, #0xd8
	add r3, r4, r3
	bl sub_02084740
	mov r1, #0x56
	lsl r1, r1, #2
	mov r0, #0xd9
	lsl r0, r0, #2
	ldrh r1, [r4, r1]
	ldr r2, [r4, #0xc]
	add r0, r4, r0
	bl sub_02084E18
	ldr r0, _02084BE8 ; =0x000004A4
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r0, _02084BEC ; =0x000005DC
	bl PlaySE
	b _02084C4E
_02084AE4:
	ldr r0, _02084BF0 ; =0x000005C4
	ldr r0, [r4, r0]
	bl sub_020164C4
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02084B26
	ldr r0, _02084BF4 ; =0x000005E2
	bl PlaySE
	ldr r0, _02084BF8 ; =0x000004A8
	ldr r1, [r4, r0]
	add r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02084C58
	add sp, #0x10
	mov r0, #3
	pop {r4, r5, r6, pc}
_02084B26:
	ldr r0, _02084BFC ; =0x0000045C
	mov r1, #5
	str r1, [r4, r0]
	b _02084C4E
_02084B2E:
	mov r0, #0x46
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #4
	bne _02084B42
	cmp r5, #1
	bne _02084B42
	add sp, #0x10
	mov r0, #2
	pop {r4, r5, r6, pc}
_02084B42:
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	beq _02084C4E
	lsl r0, r1, #1
	add r0, r4, r0
	add r0, #0xd8
	strh r5, [r0]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl FillWindowPixelBuffer
	mov r0, #0xc
	str r0, [sp]
	mov r2, #0
	add r1, r4, #0
	ldr r0, _02084BD4 ; =0x000E0F01
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, #0xd8
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl sub_02084540
	mov r1, #0x56
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	add r0, r0, #1
	strh r0, [r4, r1]
	mov r0, #0xd9
	lsl r0, r0, #2
	ldrh r1, [r4, r1]
	ldr r2, [r4, #0xc]
	add r0, r4, r0
	bl sub_02084E18
	ldr r0, _02084BD8 ; =0x000005EB
	bl PlaySE
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	mov r3, #8
	ldr r0, _02084C00 ; =0x04000050
	b _02084C04
	.balign 4, 0
_02084BBC: .word 0x00002FFD
_02084BC0: .word 0x00001FFE
_02084BC4: .word gSystem + 0x40
_02084BC8: .word 0x0000E002
_02084BCC: .word 0x0000D002
_02084BD0: .word 0x0000D001
_02084BD4: .word 0x000E0F01
_02084BD8: .word 0x000005EB
_02084BDC: .word 0x0000069D
_02084BE0: .word 0x0000FFFF
_02084BE4: .word 0x000004C4
_02084BE8: .word 0x000004A4
_02084BEC: .word 0x000005DC
_02084BF0: .word 0x000005C4
_02084BF4: .word 0x000005E2
_02084BF8: .word 0x000004A8
_02084BFC: .word 0x0000045C
_02084C00: .word 0x04000050
_02084C04:
	mov r1, #0
	mov r2, #7
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x3c
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02084C2A
	mov r0, #1
	str r0, [r4, #0x34]
_02084C2A:
	ldr r0, _02084C54 ; =0x000004C4
	mov r3, #0x5f
	add r1, r4, r0
	lsl r3, r3, #2
	str r1, [sp]
	ldr r1, [r4, r3]
	add r2, r3, #0
	str r1, [sp, #4]
	sub r2, #0x24
	sub r0, #0xcc
	add r1, r4, #0
	sub r3, #0x22
	ldrh r2, [r4, r2]
	add r0, r4, r0
	add r1, #0xd8
	add r3, r4, r3
	bl sub_02084740
_02084C4E:
	mov r0, #2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02084C54: .word 0x000004C4
	thumb_func_end sub_02084884

	thumb_func_start sub_02084C58
sub_02084C58: ; 0x02084C58
	push {r3, lr}
	mov r2, #0x5d
	lsl r2, r2, #4
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _02084C76
	cmp r1, #1
	bne _02084C70
	mov r1, #0
	bl sub_02018410
	pop {r3, pc}
_02084C70:
	mov r1, #1
	bl sub_02018410
_02084C76:
	pop {r3, pc}
	thumb_func_end sub_02084C58

	thumb_func_start sub_02084C78
sub_02084C78: ; 0x02084C78
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #3
_02084C80:
	add r0, r1, #1
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02084264
	add r1, r0, #0
	lsl r0, r1, #1
	ldrh r0, [r5, r0]
	cmp r0, #1
	beq _02084C80
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02084C78

	thumb_func_start sub_02084C98
sub_02084C98: ; 0x02084C98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r1, #0
	str r2, [sp]
	cmp r3, #0
	bne _02084CAC
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02084CAC:
	sub r1, r3, #1
	lsl r1, r1, #1
	str r1, [sp, #4]
	ldrh r3, [r2, r1]
	cmp r4, r0
	bge _02084CFA
	mov r1, #6
	ldr r2, _02084D00 ; =_02102422
	mul r1, r4
	add r5, r2, r1
	mov r7, #0
_02084CC2:
	add r2, r7, #0
	add r6, r5, #0
_02084CC6:
	ldrh r1, [r6]
	cmp r3, r1
	bne _02084CEA
	cmp r3, #1
	beq _02084CEA
	mov r0, #6
	ldr r1, _02084D00 ; =_02102422
	mul r0, r4
	add r0, r1, r0
	add r1, r2, #0
	bl sub_02084C78
	ldr r2, [sp]
	ldr r1, [sp, #4]
	add sp, #8
	strh r0, [r2, r1]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084CEA:
	add r2, r2, #1
	add r6, r6, #2
	cmp r2, #3
	blt _02084CC6
	add r4, r4, #1
	add r5, r5, #6
	cmp r4, r0
	blt _02084CC2
_02084CFA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084D00: .word _02102422
	thumb_func_end sub_02084C98

	thumb_func_start sub_02084D04
sub_02084D04: ; 0x02084D04
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, r1, #0
	ldr r1, [sp, #0x1c]
	mov lr, r2
	mov ip, r3
	cmp r1, #0
	beq _02084D20
	sub r1, r1, #1
	ldr r6, [sp, #0x18]
	lsl r7, r1, #1
	ldrh r5, [r6, r7]
	cmp r5, #1
	bne _02084D24
_02084D20:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02084D24:
	add r2, r4, #0
	cmp r4, r0
	bge _02084D56
	mov r1, #6
	ldr r3, _02084DFC ; =_02102422
	mul r1, r4
	add r3, r3, r1
_02084D32:
	ldrh r1, [r3]
	cmp r5, r1
	bne _02084D4E
	add r3, r2, #0
	mov r0, #6
	mul r3, r0
	mov r0, lr
	ldr r2, _02084DFC ; =_02102422
	lsl r1, r0, #1
	add r0, r2, r3
	ldrh r0, [r1, r0]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084D4E:
	add r2, r2, #1
	add r3, r3, #6
	cmp r2, r0
	blt _02084D32
_02084D56:
	cmp r4, r0
	bge _02084D86
	mov r2, lr
	ldr r1, _02084DFC ; =_02102422
	lsl r2, r2, #1
	add r1, r1, r2
	mov r2, #6
	mul r2, r4
	add r2, r1, r2
_02084D68:
	ldrh r1, [r2]
	cmp r5, r1
	bne _02084D7E
	mov r0, #6
	add r1, r4, #0
	mul r1, r0
	ldr r0, _02084DFC ; =_02102422
	ldrh r0, [r0, r1]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084D7E:
	add r4, r4, #1
	add r2, r2, #6
	cmp r4, r0
	blt _02084D68
_02084D86:
	ldr r1, _02084E00 ; =0x0000D001
	mov r0, ip
	cmp r0, r1
	beq _02084DA0
	add r1, r1, #1
	mov r0, ip
	cmp r0, r1
	beq _02084DC0
	ldr r1, _02084E04 ; =0x0000E006
	mov r0, ip
	cmp r0, r1
	beq _02084DE0
	b _02084DF8
_02084DA0:
	ldr r1, _02084E08 ; =_021021B8
	mov r2, #0
_02084DA4:
	ldrh r0, [r1]
	cmp r5, r0
	bne _02084DB6
	ldr r0, _02084E0C ; =_021021B8 + 2
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DB6:
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, #0xc
	blo _02084DA4
	b _02084DF8
_02084DC0:
	ldr r1, _02084E10 ; =_02102190
	mov r2, #0
_02084DC4:
	ldrh r0, [r1]
	cmp r5, r0
	bne _02084DD6
	ldr r0, _02084E14 ; =_02102190 + 2
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DD6:
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, #0xa
	blo _02084DC4
	b _02084DF8
_02084DE0:
	cmp r5, #0x26
	bne _02084DEC
	mov r0, #0x24
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DEC:
	cmp r5, #0x76
	bne _02084DF8
	mov r0, #0x74
	strh r0, [r6, r7]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02084DF8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084DFC: .word _02102422
_02084E00: .word 0x0000D001
_02084E04: .word 0x0000E006
_02084E08: .word _021021B8
_02084E0C: .word _021021B8 + 2
_02084E10: .word _02102190
_02084E14: .word _02102190 + 2
	thumb_func_end sub_02084D04

	thumb_func_start sub_02084E18
sub_02084E18: ; 0x02084E18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	mov r4, #0
	str r0, [sp]
	str r1, [sp, #4]
	cmp r6, #0
	ble _02084E3C
	add r5, r0, #0
	mov r7, #0x2b
_02084E2C:
	ldr r0, [r5]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02084E2C
_02084E3C:
	ldr r0, [sp, #4]
	cmp r0, r6
	beq _02084E4E
	lsl r1, r0, #2
	ldr r0, [sp]
	ldr r0, [r0, r1]
	mov r1, #0x2c
	bl Set2dSpriteAnimSeqNo
_02084E4E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02084E18

	thumb_func_start sub_02084E54
sub_02084E54: ; 0x02084E54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r2, [sp, #0x10]
	ldr r2, [sp, #0x30]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r5, r0, #0
	str r3, [sp, #0x14]
	str r2, [sp, #0x30]
	bl FillWindowPixelBuffer
	ldr r1, _02084F34 ; =_02101D44
	ldr r0, [sp, #0x10]
	mov r7, #0
	ldrb r4, [r1, r0]
	mov r6, #0x10
_02084E74:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0
	bl FillWindowPixelRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x26
	bl FillWindowPixelRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x4c
	bl FillWindowPixelRect
	add r7, r7, #1
	add r6, #0x20
	cmp r7, #6
	blt _02084E74
	mov r7, #0
	add r6, r7, #0
_02084EC2:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x13
	bl FillWindowPixelRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x13
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x10
	mov r3, #0x39
	bl FillWindowPixelRect
	add r7, r7, #1
	add r6, #0x20
	cmp r7, #7
	blt _02084EC2
	ldr r0, [sp, #0x10]
	mov r1, #0x14
	ldr r2, _02084F38 ; =_021104F8
	mul r1, r0
	mov r7, #0
	mov r6, #4
	add r4, r2, r1
_02084F04:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r2, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	add r3, r6, #0
	str r0, [sp, #0xc]
	ldr r1, [r4]
	add r0, r5, #0
	bl sub_02084540
	add r7, r7, #1
	add r6, #0x13
	add r4, r4, #4
	cmp r7, #5
	blt _02084F04
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084F34: .word _02101D44
_02084F38: .word _021104F8
	thumb_func_end sub_02084E54

	thumb_func_start sub_02084F3C
sub_02084F3C: ; 0x02084F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	str r0, [sp]
	mov r7, #0
	add r1, r0, #0
_02084F48:
	ldr r0, [r1]
	cmp r0, #0
	beq _02084F7E
	mov r0, #0
	ldr r4, _02084FC0 ; =_021021E8
	str r0, [sp, #4]
	add r5, r6, #0
_02084F56:
	ldr r0, [r5]
	ldr r1, [r4, #8]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [sp, #4]
	add r4, #0x10
	add r0, r0, #1
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r0, #3
	blt _02084F56
	ldr r1, _02084FC4 ; =_021021E8 + 8
	lsl r2, r7, #4
	lsl r0, r7, #2
	ldr r1, [r1, r2]
	ldr r0, [r6, r0]
	sub r1, r1, #3
	bl Set2dSpriteAnimSeqNo
	b _02084F86
_02084F7E:
	add r7, r7, #1
	add r1, r1, #4
	cmp r7, #3
	blt _02084F48
_02084F86:
	ldr r4, [sp]
	ldr r5, _02084FC8 ; =_02102238
	mov r7, #5
	add r4, #0x14
	add r6, #0x14
_02084F90:
	ldr r0, [r4]
	cmp r0, #0
	beq _02084FA0
	ldr r1, [r5, #8]
	ldr r0, [r6]
	add r1, r1, #1
	bl Set2dSpriteAnimSeqNo
_02084FA0:
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x10
	add r6, r6, #4
	cmp r7, #7
	blt _02084F90
	mov r2, #0
	add r1, r2, #0
_02084FB0:
	ldr r0, [sp]
	add r2, r2, #1
	stmia r0!, {r1}
	str r0, [sp]
	cmp r2, #7
	blt _02084FB0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02084FC0: .word _021021E8
_02084FC4: .word _021021E8 + 8
_02084FC8: .word _02102238
	thumb_func_end sub_02084F3C

	thumb_func_start sub_02084FCC
sub_02084FCC: ; 0x02084FCC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _02085038
	mov r0, #0x56
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02085004
	mov r0, #0xc
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x20]
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
	mov r0, #0
	str r0, [r4, #0x34]
	b _02085010
_02085004:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x27
	bl Set2dSpriteAnimSeqNo
_02085010:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _02085024
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0208502C
_02085024:
	add r0, r4, #0
	mov r1, #0
	bl sub_02084430
_0208502C:
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024B78
_02085038:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02084FCC

	thumb_func_start sub_0208503C
sub_0208503C: ; 0x0208503C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r0, #0
	mov ip, r0
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #4
	bne _02085050
	mov r0, #4
	mov ip, r0
_02085050:
	ldr r2, _020850EC ; =gSystem + 0x40
	ldrh r0, [r2, #0x24]
	cmp r0, #0
	beq _020850E6
	ldrh r0, [r2, #0x20]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov lr, r0
	ldrh r0, [r2, #0x22]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	mov r0, ip
	cmp r0, #0x47
	bhs _020850E6
	mov r0, #6
	mov r2, ip
	mul r0, r2
	ldr r2, _020850F0 ; =_02102278
	add r2, r2, r0
	add r3, r2, #0
_02085078:
	ldrh r4, [r3, #2]
	ldrb r0, [r2]
	ldrb r6, [r2, #1]
	lsl r4, r4, #0x1e
	lsr r4, r4, #0x1e
	beq _0208508E
	cmp r4, #1
	beq _02085094
	cmp r4, #2
	beq _0208509A
	b _0208509E
_0208508E:
	mov r5, #0x1f
	mov r1, #0x16
	b _0208509E
_02085094:
	mov r5, #0x20
	mov r1, #0x16
	b _0208509E
_0208509A:
	mov r5, #0x10
	mov r1, #0x13
_0208509E:
	mov r4, lr
	cmp r4, r0
	blo _020850D8
	cmp r7, r6
	blo _020850D8
	add r4, r0, r5
	mov r0, lr
	cmp r0, r4
	bgt _020850D8
	add r0, r6, r1
	cmp r7, r0
	bgt _020850D8
	ldr r2, _020850F0 ; =_02102278
	mov r1, #6
	mov r0, ip
	mul r1, r0
	add r2, r2, r1
	ldrb r0, [r2, #4]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	ldr r0, [sp]
	str r1, [r0, #0x1c]
	ldrb r0, [r2, #5]
	lsl r0, r0, #0x1b
	lsr r1, r0, #0x1b
	ldr r0, [sp]
	str r1, [r0, #0x20]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020850D8:
	mov r0, ip
	add r0, r0, #1
	add r2, r2, #6
	add r3, r3, #6
	mov ip, r0
	cmp r0, #0x47
	blo _02085078
_020850E6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020850EC: .word gSystem + 0x40
_020850F0: .word _02102278
	thumb_func_end sub_0208503C

	.rodata

_02101D3C:
	.byte 0x60, 0x68, 0x50, 0x58
_02101D40:
	.byte 0x04, 0x07, 0x0D, 0x0A
_02101D44:
	.byte 0x03, 0x06, 0x0C, 0x09, 0x09, 0x00, 0x00, 0x00
_02101D4C:
	.byte 0x28, 0x28, 0x28, 0x28
	.byte 0x29, 0x29, 0x29, 0x00
_02101D54:
	.byte 0x70, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00
_02101D60:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02101D70:
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
_02101D80:
	.byte 0x19, 0x00, 0x39, 0x00, 0x59, 0x00, 0x61, 0x00, 0x7A, 0x00, 0x9E, 0x00, 0xC6, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x2B, 0x00, 0x20, 0x00, 0x2F, 0x00, 0x01, 0x00, 0x2B, 0x00, 0x3F, 0x00, 0x09, 0x00
	.byte 0x30, 0x00, 0xE2, 0x00, 0xFF, 0xFF, 0x8D, 0x00, 0x74, 0x00, 0x60, 0x00, 0x6A, 0x00, 0x2F, 0x00
	.byte 0x01, 0x00, 0x2B, 0x00, 0x3F, 0x00, 0x09, 0x00, 0x30, 0x00, 0xE2, 0x00, 0xFF, 0xFF

	; File boundary

_02101DBE:
	.byte 0x02, 0xE0
	.byte 0x02, 0xE0, 0x03, 0xE0, 0x03, 0xE0, 0x04, 0xE0, 0x04, 0xE0, 0x04, 0xD0, 0x04, 0xD0, 0x07, 0xE0
	.byte 0x07, 0xE0, 0x07, 0xE0, 0x08, 0xE0, 0x08, 0xE0
_02101DD8:
	.byte 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0
	.byte 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0, 0x04, 0xD0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x08, 0xE0
	.byte 0x08, 0xE0
_02101DF2:
	.short 0x00E3, 0x00E4, 0x00F9, 0x00F8, 0x00E5, 0x00E6, 0x00F5
	.short 0x00F6, 0x00F7, 0x00E7, 0x0001, 0x00EE, 0x00EF, 0xFFFF, 0x0000
_02101E10:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x0800, 0x0000, 0x0000, 0x0000
	.short 0x0001, 0x041F, 0x0000, 0x0000, 0x0000, 0x0000
_02101E2C:
	.short 0x01DE, 0x01DE
	.short 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE
	.short 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101E48:
	.short 0x0107, 0x0108, 0x0109, 0x010A
	.short 0x010B, 0x010C, 0x010D, 0x010E, 0x0111, 0x010F, 0x0110, 0x0001
	.short 0x0001, 0xFFFF
_02101E64:
	.short 0x0121, 0x0122, 0x0123, 0x0124, 0x0125, 0x0126
	.short 0x0127, 0x0128, 0x0129, 0x012A, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101E80:
	.short 0x012B, 0x012C, 0x012D, 0x012E, 0x012F, 0x0130, 0x0131, 0x0132
	.short 0x0133, 0x0134, 0x01DE, 0x01AD, 0x01AE, 0xFFFF
_02101E9C:
	.short 0x0135, 0x0136, 0x0137, 0x0138, 0x0139, 0x013A, 0x013B, 0x013C, 0x013D, 0x013E, 0x01DE, 0x01B3, 0x01BE, 0xFFFF
_02101EB8:
	.short 0x013F, 0x0140, 0x0141, 0x0142, 0x0143, 0x0144, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01BB, 0x01BC, 0xFFFF
_02101ED4:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000, 0x0000, 0x0003, 0x041E, 0x0100, 0x0000, 0x0000, 0x0000
_02101EF0:
	.short 0x0145, 0x0146, 0x0147, 0x0148, 0x0149, 0x014A, 0x014B, 0x014C, 0x014D, 0x014E, 0x01DE, 0x01AD, 0x01AE, 0xFFFF
_02101F0C:
	.short 0x014F, 0x0150, 0x0151, 0x0152, 0x0153, 0x0154, 0x0155, 0x0156, 0x0157, 0x0158, 0x01DE, 0x01B3, 0x01BE, 0xFFFF
_02101F28:
	.short 0x00FF, 0x0100, 0x0101, 0x0102, 0x0103, 0x00FC, 0x00FA, 0x00FD, 0x00FB, 0x00FE, 0x0105, 0x0001, 0x0001, 0xFFFF
_02101F44:
	.short 0x00E8, 0x00E9, 0x00EA, 0x00EB, 0x00EC, 0x00ED, 0x00F0, 0x00F1, 0x00F2, 0x00F3, 0x00F4, 0x0106, 0x0104, 0xFFFF
_02101F60:
	.short 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101F7C:
	.short 0x00A2, 0x00A3, 0x00A4, 0x00A5, 0x00A6, 0x00A7, 0x00A8, 0x00A9, 0x00AA, 0x00AB, 0x0001, 0x00E1, 0x00E2, 0xFFFF
_02101F98:
	.short 0x01AD, 0x01AE, 0x01C4, 0x01C5, 0x01AB, 0x01AC, 0x01DE, 0x01DE, 0x01DE, 0x01BB, 0x01BC, 0x01DE, 0x01DE, 0xFFFF
_02101FB4:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x1000, 0x0000, 0x0000, 0x0000, 0x0003, 0x041C, 0x0200, 0x0000, 0x0000, 0x0000
_02101FD0:
	.short 0x01B4, 0x01B5, 0x01B2, 0x01B3, 0x01B9, 0x01BA, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02101FEC:
	.short 0x01AF, 0x01B0, 0x01C3, 0x01D0, 0x01C0, 0x01D2, 0x01BD, 0x01BE, 0x01BF, 0x01B1, 0x01C1, 0x01DE, 0x01DE, 0xFFFF
_02102008:
	.short 0x01CB, 0x01CC, 0x01CD, 0x01CE, 0x01CF, 0x01C6, 0x01C8, 0x01C9, 0x01C7, 0x01CA, 0x01D1, 0x01DE, 0x01DE, 0xFFFF
_02102024:
	.short 0x0121, 0x0122, 0x0123, 0x0124, 0x0125, 0x0126, 0x0127, 0x0128, 0x0129, 0x012A, 0x01DE, 0x01DE, 0x01DE, 0xFFFF
_02102040:
	.short 0x01D3, 0x01D4, 0x01D5, 0x01D6, 0x01D7, 0x01D8, 0x01D9, 0x01DA, 0x01DD, 0x01DB, 0x01DC, 0x01DE, 0x01DE, 0xFFFF
_0210205C:
	.short 0x0159, 0x015A, 0x015B, 0x015C, 0x015D, 0x015E, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01DE, 0x01BB, 0x01BC, 0xFFFF
_02102078:
	.short 0x0000, 0x0000, 0x0000, 0x0000, 0x0800, 0x0000, 0x0000, 0x0000, 0x0001, 0x001A, 0x0300, 0x0000, 0x0000, 0x0000, 0x008E, 0x0062, 0x0093, 0x00A1, 0x002F, 0x0001, 0x007C, 0x0074, 0x0060, 0x007E, 0x00F1, 0x0091, 0x0030, 0x00E2, 0xFFFF

	; File boundary

	.balign 4, 0
_021020B4:
	.short 0x0000, 0x0000, 0x0001, 0x0000, 0x0002, 0x0000, 0x0003, 0x0000, 0x0004, 0x0000, 0x0005, 0x0000, 0x0006, 0x0000, 0x0008, 0x0000
_021020D4:
	.short 0x0121, 0x0122, 0x0123, 0x0124, 0x0125, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0xFFFF
_021020F8:
	.short 0x0126, 0x0127, 0x0128, 0x0129, 0x012A, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0xFFFF
_0210211C:
	.short 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0xFFFF
_02102140:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102168:
	.word  0,  0
	.word  0, -1
	.word  0,  1
	.word -1,  0
	.word  1,  0
_02102190:
	.short 0x0031, 0x0032
	.short 0x0034, 0x0035
	.short 0x0037, 0x0038
	.short 0x003A, 0x003B
	.short 0x003D, 0x003E
	.short 0x0081, 0x0082
	.short 0x0084, 0x0085
	.short 0x0087, 0x0088
	.short 0x008A, 0x008B
	.short 0x008D, 0x008E
_021021B8:
	.short 0x0024, 0x0026
	.short 0x0074, 0x0076
	.short 0x0032, 0x0031
	.short 0x0035, 0x0034
	.short 0x0038, 0x0037
	.short 0x003B, 0x003A
	.short 0x003E, 0x003D
	.short 0x0082, 0x0081
	.short 0x0085, 0x0084
	.short 0x0088, 0x0087
	.short 0x008B, 0x008A
	.short 0x008E, 0x008D
_021021E8:
	.byte 0x04, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x44, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_02102218:
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x65, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_02102238:
	.byte 0x88, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xB0, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02102278:
	.byte 0x19, 0x3C
	.short 0x00
	.byte 0x00, 0x00
	.byte 0x39, 0x3C
	.short 0x00
	.byte 0x02, 0x00
	.byte 0x59, 0x3C
	.short 0x00
	.byte 0x04, 0x00
	.byte 0x00, 0xC0
	.short 0x00
	.byte 0x04, 0x00
	.byte 0x9D, 0x3C
	.short 0x01
	.byte 0x08, 0x00
	.byte 0xC5, 0x3C
	.short 0x01
	.byte 0x0B, 0x00
	.byte 0x1C, 0x58
	.short 0x02
	.byte 0x00, 0x01
	.byte 0x2C, 0x58
	.short 0x02
	.byte 0x01, 0x01
	.byte 0x3C, 0x58
	.short 0x0002
	.byte 0x02, 0x01
	.byte 0x4C, 0x58
	.short 0x0002
	.byte 0x03, 0x01
	.byte 0x5C, 0x58
	.short 0x0002
	.byte 0x04, 0x01
	.byte 0x6C, 0x58
	.short 0x0002
	.byte 0x05, 0x01
	.byte 0x7C, 0x58
	.short 0x0002
	.byte 0x06, 0x01
	.byte 0x8C, 0x58
	.short 0x0002
	.byte 0x07, 0x01
	.byte 0x9C, 0x58
	.short 0x0002
	.byte 0x08, 0x01
	.byte 0xAC, 0x58
	.short 0x0002
	.byte 0x09, 0x01
	.byte 0xBC, 0x58
	.short 0x0002
	.byte 0x0A, 0x01
	.byte 0xCC, 0x58
	.short 0x0002
	.byte 0x0B, 0x01
	.byte 0xDC, 0x58
	.short 0x0002
	.byte 0x0C, 0x01
	.byte 0x1C, 0x6B
	.short 0x0002
	.byte 0x00, 0x02
	.byte 0x2C, 0x6B
	.short 0x0002
	.byte 0x01, 0x02
	.byte 0x3C, 0x6B
	.short 0x0002
	.byte 0x02, 0x02
	.byte 0x4C, 0x6B
	.short 0x0002
	.byte 0x03, 0x02
	.byte 0x5C, 0x6B
	.short 0x0002
	.byte 0x04, 0x02
	.byte 0x6C, 0x6B
	.short 0x0002
	.byte 0x05, 0x02
	.byte 0x7C, 0x6B
	.short 0x0002
	.byte 0x06, 0x02
	.byte 0x8C, 0x6B
	.short 0x0002
	.byte 0x07, 0x02
	.byte 0x9C, 0x6B
	.short 0x0002
	.byte 0x08, 0x02
	.byte 0xAC, 0x6B
	.short 0x0002
	.byte 0x09, 0x02
	.byte 0xBC, 0x6B
	.short 0x0002
	.byte 0x0A, 0x02
	.byte 0xCC, 0x6B
	.short 0x0002
	.byte 0x0B, 0x02
	.byte 0xDC, 0x6B
	.short 0x0002
	.byte 0x0C, 0x02
	.byte 0x1C, 0x7E
	.short 0x0002
	.byte 0x00, 0x03
	.byte 0x2C, 0x7E
	.short 0x0002
	.byte 0x01, 0x03
	.byte 0x3C, 0x7E
	.short 0x0002
	.byte 0x02, 0x03
	.byte 0x4C, 0x7E
	.short 0x0002
	.byte 0x03, 0x03
	.byte 0x5C, 0x7E
	.short 0x0002
	.byte 0x04, 0x03
	.byte 0x6C, 0x7E
	.short 0x0002
	.byte 0x05, 0x03
	.byte 0x7C, 0x7E
	.short 0x0002
	.byte 0x06, 0x03
	.byte 0x8C, 0x7E
	.short 0x0002
	.byte 0x07, 0x03
	.byte 0x9C, 0x7E
	.short 0x0002
	.byte 0x08, 0x03
	.byte 0xAC, 0x7E
	.short 0x0002
	.byte 0x09, 0x03
	.byte 0xBC, 0x7E
	.short 0x0002
	.byte 0x0A, 0x03
	.byte 0xCC, 0x7E
	.short 0x0002
	.byte 0x0B, 0x03
	.byte 0xDC, 0x7E
	.short 0x0002
	.byte 0x0C, 0x03
	.byte 0x1C, 0x91
	.short 0x0002
	.byte 0x00, 0x04
	.byte 0x2C, 0x91
	.short 0x0002
	.byte 0x01, 0x04
	.byte 0x3C, 0x91
	.short 0x0002
	.byte 0x02, 0x04
	.byte 0x4C, 0x91
	.short 0x0002
	.byte 0x03, 0x04
	.byte 0x5C, 0x91
	.short 0x0002
	.byte 0x04, 0x04
	.byte 0x6C, 0x91
	.short 0x0002
	.byte 0x05, 0x04
	.byte 0x7C, 0x91
	.short 0x0002
	.byte 0x06, 0x04
	.byte 0x8C, 0x91
	.short 0x0002
	.byte 0x07, 0x04
	.byte 0x9C, 0x91
	.short 0x0002
	.byte 0x08, 0x04
	.byte 0xAC, 0x91
	.short 0x0002
	.byte 0x09, 0x04
	.byte 0xBC, 0x91
	.short 0x0002
	.byte 0x0A, 0x04
	.byte 0xCC, 0x91
	.short 0x0002
	.byte 0x0B, 0x04
	.byte 0xDC, 0x91
	.short 0x0002
	.byte 0x0C, 0x04
	.byte 0x1C, 0xA4
	.short 0x0002
	.byte 0x00, 0x05
	.byte 0x2C, 0xA4
	.short 0x0002
	.byte 0x01, 0x05
	.byte 0x3C, 0xA4
	.short 0x0002
	.byte 0x02, 0x05
	.byte 0x4C, 0xA4
	.short 0x0002
	.byte 0x03, 0x05
	.byte 0x5C, 0xA4
	.short 0x0002
	.byte 0x04, 0x05
	.byte 0x6C, 0xA4
	.short 0x0002
	.byte 0x05, 0x05
	.byte 0x7C, 0xA4
	.short 0x0002
	.byte 0x06, 0x05
	.byte 0x8C, 0xA4
	.short 0x0002
	.byte 0x07, 0x05
	.byte 0x9C, 0xA4
	.short 0x0002
	.byte 0x08, 0x05
	.byte 0xAC, 0xA4
	.short 0x0002
	.byte 0x09, 0x05
	.byte 0xBC, 0xA4
	.short 0x0002
	.byte 0x0A, 0x05
	.byte 0xCC, 0xA4
	.short 0x0002
	.byte 0x0B, 0x05
	.byte 0xDC, 0xA4
	.short 0x0002
	.byte 0x0C, 0x05
_02102422:
	.short 0x0003, 0x0001, 0x0002
	.short 0x0005, 0x0001, 0x0004
	.short 0x0007, 0x0001, 0x0006
	.short 0x0009, 0x0001, 0x0008
	.short 0x000B, 0x0001, 0x000A
	.short 0x0053, 0x0001, 0x0052
	.short 0x0055, 0x0001, 0x0054
	.short 0x0057, 0x0001, 0x0056
	.short 0x0059, 0x0001, 0x0058
	.short 0x005B, 0x0001, 0x005A
	.short 0x0045, 0x0001, 0x0044
	.short 0x0047, 0x0001, 0x0046
	.short 0x0049, 0x0001, 0x0048
	.short 0x0095, 0x0001, 0x0094
	.short 0x0097, 0x0001, 0x0096
	.short 0x0099, 0x0001, 0x0098
	.short 0x00AC, 0x0001, 0x00C6
	.short 0x00AD, 0x0001, 0x00C7
	.short 0x00AE, 0x0001, 0x00C8
	.short 0x00AF, 0x0001, 0x00C9
	.short 0x00B0, 0x0001, 0x00CA
	.short 0x00B1, 0x0001, 0x00CB
	.short 0x00B2, 0x0001, 0x00CC
	.short 0x00B3, 0x0001, 0x00CD
	.short 0x00B4, 0x0001, 0x00CE
	.short 0x00B5, 0x0001, 0x00CF
	.short 0x00B6, 0x0001, 0x00D0
	.short 0x00B7, 0x0001, 0x00D1
	.short 0x00B8, 0x0001, 0x00D2
	.short 0x00B9, 0x0001, 0x00D3
	.short 0x00BA, 0x0001, 0x00D4
	.short 0x00BB, 0x0001, 0x00D5
	.short 0x00BC, 0x0001, 0x00D6
	.short 0x00BD, 0x0001, 0x00D7
	.short 0x00BE, 0x0001, 0x00D8
	.short 0x00BF, 0x0001, 0x00D9
	.short 0x00C0, 0x0001, 0x00DA
	.short 0x00C1, 0x0001, 0x00DB
	.short 0x00C2, 0x0001, 0x00DC
	.short 0x00C3, 0x0001, 0x00DD
	.short 0x00C4, 0x0001, 0x00DE
	.short 0x00C5, 0x0001, 0x00DF
	.short 0x0025, 0x0026, 0x0024
	.short 0x0075, 0x0076, 0x0074
	.short 0x000C, 0x000D, 0x0001
	.short 0x000E, 0x000F, 0x0001
	.short 0x0010, 0x0011, 0x0001
	.short 0x0012, 0x0013, 0x0001
	.short 0x0014, 0x0015, 0x0001
	.short 0x0016, 0x0017, 0x0001
	.short 0x0018, 0x0019, 0x0001
	.short 0x001A, 0x001B, 0x0001
	.short 0x001C, 0x001D, 0x0001
	.short 0x001E, 0x001F, 0x0001
	.short 0x0020, 0x0021, 0x0001
	.short 0x0022, 0x0023, 0x0001
	.short 0x0027, 0x0028, 0x0001
	.short 0x0029, 0x002A, 0x0001
	.short 0x005C, 0x005D, 0x0001
	.short 0x005E, 0x005F, 0x0001
	.short 0x0060, 0x0061, 0x0001
	.short 0x0062, 0x0063, 0x0001
	.short 0x0064, 0x0065, 0x0001
	.short 0x0066, 0x0067, 0x0001
	.short 0x0068, 0x0069, 0x0001
	.short 0x006A, 0x006B, 0x0001
	.short 0x006C, 0x006D, 0x0001
	.short 0x006E, 0x006F, 0x0001
	.short 0x0070, 0x0071, 0x0001
	.short 0x0072, 0x0073, 0x0001
	.short 0x0077, 0x0078, 0x0001
	.short 0x0079, 0x007A, 0x0001
	.short 0x0030, 0x0031, 0x0032
	.short 0x0033, 0x0034, 0x0035
	.short 0x0036, 0x0037, 0x0038
	.short 0x0039, 0x003A, 0x003B
	.short 0x003C, 0x003D, 0x003E
	.short 0x0080, 0x0081, 0x0082
	.short 0x0083, 0x0084, 0x0085
	.short 0x0086, 0x0087, 0x0088
	.short 0x0089, 0x008A, 0x008B
	.short 0x008C, 0x008D, 0x008E

	; File boundary

	.balign 4, 0
	.public _02102610
_02102610:
	.word sub_02082908, sub_02082B20, sub_02082EE8, 0xFFFFFFFF

	.data

_021104E4:
	.word _02101DBE
	.word _02101DBE
	.word _02101DBE
	.word _02101DBE
	.word _02101DD8
_021104F8:
	.word _02101E80
	.word _02101E9C
	.word _02101EB8
	.word _02101E2C
	.word _02101E64
	.word _02101EF0
	.word _02101F0C
	.word _0210205C
	.word _02101F60
	.word _02102024
	.word _02101F98
	.word _02101FD0
	.word _02101FEC
	.word _02102008
	.word _02102040
	.word _02101F7C
	.word _02101DF2
	.word _02101F44
	.word _02101F28
	.word _02101E48
	.word _021020D4
	.word _021020F8
	.word _0210211C
	.word _0210211C
	.word _0210211C

	; File boundary
