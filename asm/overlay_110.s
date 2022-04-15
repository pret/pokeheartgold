#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov110_AlphPuzzle_OvyInit
ov110_AlphPuzzle_OvyInit: ; 0x021E5900
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _021E5912
	cmp r1, #1
	beq _021E595E
	b _021E596E
_021E5912:
	bl ov110_021E5A24
	mov r2, #2
	mov r0, #3
	mov r1, #0x61
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0x16
	add r0, r6, #0
	lsl r1, r1, #4
	mov r2, #0x61
	bl OverlayManager_CreateAndGetData
	mov r2, #0x16
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x61
	str r0, [r4]
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	mov r1, #0
	str r0, [r4, #0x10]
	mov r0, #0x4a
	add r2, r1, #0
	bl sub_02004EC4
	add r0, r4, #0
	bl ov110_021E5A74
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E596E
_021E595E:
	bl OverlayManager_GetData
	bl ov110_021E5AD4
	cmp r0, #0
	beq _021E596E
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E596E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov110_AlphPuzzle_OvyInit

	thumb_func_start ov110_AlphPuzzle_OvyExec
ov110_AlphPuzzle_OvyExec: ; 0x021E5974
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #8
	bhi _021E59E6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5990: ; jump table
	.short _021E59A2 - _021E5990 - 2 ; case 0
	.short _021E59AA - _021E5990 - 2 ; case 1
	.short _021E59B2 - _021E5990 - 2 ; case 2
	.short _021E59BA - _021E5990 - 2 ; case 3
	.short _021E59C2 - _021E5990 - 2 ; case 4
	.short _021E59CA - _021E5990 - 2 ; case 5
	.short _021E59D2 - _021E5990 - 2 ; case 6
	.short _021E59DA - _021E5990 - 2 ; case 7
	.short _021E59E2 - _021E5990 - 2 ; case 8
_021E59A2:
	bl AlphPuzzleMainSeq_0
	str r0, [r4]
	b _021E59E6
_021E59AA:
	bl AlphPuzzleMainSeq_1
	str r0, [r4]
	b _021E59E6
_021E59B2:
	bl AlphPuzzleMainSeq_2
	str r0, [r4]
	b _021E59E6
_021E59BA:
	bl AlphPuzzleMainSeq_3
	str r0, [r4]
	b _021E59E6
_021E59C2:
	bl AlphPuzzleMainSeq_4
	str r0, [r4]
	b _021E59E6
_021E59CA:
	bl AlphPuzzleMainSeq_5
	str r0, [r4]
	b _021E59E6
_021E59D2:
	bl AlphPuzzleMainSeq_6
	str r0, [r4]
	b _021E59E6
_021E59DA:
	bl AlphPuzzleMainSeq_7
	str r0, [r4]
	b _021E59E6
_021E59E2:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E59E6:
	add r5, #0x88
	ldr r0, [r5]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_AlphPuzzle_OvyExec

	thumb_func_start ov110_AlphPuzzle_OvyExit
ov110_AlphPuzzle_OvyExit: ; 0x021E59F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov110_021E5B0C
	cmp r0, #0
	bne _021E5A0A
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E5A0A:
	bl ov110_021E5A24
	add r0, r4, #0
	bl ov110_021E5AAC
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x61
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov110_AlphPuzzle_OvyExit

	thumb_func_start ov110_021E5A24
ov110_021E5A24: ; 0x021E5A24
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5A6C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5A70 ; =0x04001000
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
	pop {r3, pc}
	.balign 4, 0
_021E5A6C: .word 0xFFFFE0FF
_021E5A70: .word 0x04001000
	thumb_func_end ov110_021E5A24

	thumb_func_start ov110_021E5A74
ov110_021E5A74: ; 0x021E5A74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #8]
	bl sub_020183F0
	str r0, [r5, #4]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	bl Options_GetTextFrameDelay
	add r1, r5, #0
	add r1, #0x25
	strb r0, [r1]
	add r0, r4, #0
	bl Options_GetFrame
	add r1, r5, #0
	add r1, #0x26
	strb r0, [r1]
	ldr r0, [r5, #0x10]
	ldrb r0, [r0, #5]
	strb r0, [r5, #0x19]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E5A74

	thumb_func_start ov110_021E5AAC
ov110_021E5AAC: ; 0x021E5AAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #4]
	ldr r0, [r0, #8]
	bl sub_02018410
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E5AD2
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	ldrb r1, [r4, #0x19]
	bl ScriptState_SetAlphPuzzleFlag
_021E5AD2:
	pop {r4, pc}
	thumb_func_end ov110_021E5AAC

	thumb_func_start ov110_021E5AD4
ov110_021E5AD4: ; 0x021E5AD4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021E5AE4
	cmp r1, #1
	beq _021E5AF0
	b _021E5B06
_021E5AE4:
	bl ov110_021E5BE4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021E5B06
_021E5AF0:
	bl ov110_021E5C3C
	bl sub_020210BC
	mov r0, #1
	bl sub_02021148
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021E5B06:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E5AD4

	thumb_func_start ov110_021E5B0C
ov110_021E5B0C: ; 0x021E5B0C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02021238
	add r0, r4, #0
	bl ov110_021E5C18
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E5B0C

	thumb_func_start AlphPuzzleMainSeq_0
AlphPuzzleMainSeq_0: ; 0x021E5B20
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E5B32
	cmp r0, #1
	beq _021E5B50
	b _021E5B62
_021E5B32:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021E5B62
_021E5B50:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B62
	mov r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E5B62:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end AlphPuzzleMainSeq_0

	thumb_func_start AlphPuzzleMainSeq_7
AlphPuzzleMainSeq_7: ; 0x021E5B68
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E5B7A
	cmp r0, #1
	beq _021E5B9A
	b _021E5BAC
_021E5B7A:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021E5BAC
_021E5B9A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5BAC
	mov r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	mov r0, #8
	pop {r3, r4, pc}
_021E5BAC:
	mov r0, #7
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end AlphPuzzleMainSeq_7

	thumb_func_start AlphPuzzleMainSeq_1
AlphPuzzleMainSeq_1: ; 0x021E5BB4
	ldr r3, _021E5BB8 ; =ov110_021E5C60
	bx r3
	.balign 4, 0
_021E5BB8: .word ov110_021E5C60
	thumb_func_end AlphPuzzleMainSeq_1

	thumb_func_start AlphPuzzleMainSeq_2
AlphPuzzleMainSeq_2: ; 0x021E5BBC
	ldr r3, _021E5BC0 ; =ov110_021E5CCC
	bx r3
	.balign 4, 0
_021E5BC0: .word ov110_021E5CCC
	thumb_func_end AlphPuzzleMainSeq_2

	thumb_func_start AlphPuzzleMainSeq_3
AlphPuzzleMainSeq_3: ; 0x021E5BC4
	ldr r3, _021E5BC8 ; =ov110_021E5E1C
	bx r3
	.balign 4, 0
_021E5BC8: .word ov110_021E5E1C
	thumb_func_end AlphPuzzleMainSeq_3

	thumb_func_start AlphPuzzleMainSeq_4
AlphPuzzleMainSeq_4: ; 0x021E5BCC
	ldr r3, _021E5BD0 ; =ov110_021E5F84
	bx r3
	.balign 4, 0
_021E5BD0: .word ov110_021E5F84
	thumb_func_end AlphPuzzleMainSeq_4

	thumb_func_start AlphPuzzleMainSeq_5
AlphPuzzleMainSeq_5: ; 0x021E5BD4
	ldr r3, _021E5BD8 ; =ov110_021E6014
	bx r3
	.balign 4, 0
_021E5BD8: .word ov110_021E6014
	thumb_func_end AlphPuzzleMainSeq_5

	thumb_func_start AlphPuzzleMainSeq_6
AlphPuzzleMainSeq_6: ; 0x021E5BDC
	ldr r3, _021E5BE0 ; =ov110_021E6070
	bx r3
	.balign 4, 0
_021E5BE0: .word ov110_021E6070
	thumb_func_end AlphPuzzleMainSeq_6

	thumb_func_start ov110_021E5BE4
ov110_021E5BE4: ; 0x021E5BE4
	push {r4, lr}
	add r4, r0, #0
	bl ov110_021E6150
	add r0, r4, #0
	bl ov110_021E61D0
	add r0, r4, #0
	bl ov110_021E6394
	add r0, r4, #0
	bl ov110_021E6580
	add r0, r4, #0
	bl ov110_021E6618
	add r0, r4, #0
	bl ov110_021E6730
	ldr r0, _021E5C14 ; =ov110_021E6110
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	.balign 4, 0
_021E5C14: .word ov110_021E6110
	thumb_func_end ov110_021E5BE4

	thumb_func_start ov110_021E5C18
ov110_021E5C18: ; 0x021E5C18
	push {r4, lr}
	add r4, r0, #0
	bl ov110_021E6748
	add r0, r4, #0
	bl ov110_021E6650
	add r0, r4, #0
	bl ov110_021E65DC
	add r0, r4, #0
	bl ov110_021E6544
	add r0, r4, #0
	bl ov110_021E6348
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E5C18

	thumb_func_start ov110_021E5C3C
ov110_021E5C3C: ; 0x021E5C3C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl ov110_021E6904
	add r0, r4, #0
	bl ov110_021E6A04
	ldr r0, [r4, #0x14]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #0x14]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E5C3C

	thumb_func_start ov110_021E5C60
ov110_021E5C60: ; 0x021E5C60
	push {r4, lr}
	add r4, r0, #0
	bl System_GetTouchNew
	cmp r0, #0
	bne _021E5C70
	mov r0, #1
	pop {r4, pc}
_021E5C70:
	ldr r0, _021E5CBC ; =_021E6D8C
	bl sub_02025224
	cmp r0, #0
	bne _021E5C8E
	mov r0, #1
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov110_021E6D20
	ldr r0, _021E5CC0 ; =SEQ_SE_DP_SELECT
	bl PlaySE
	mov r0, #5
	pop {r4, pc}
_021E5C8E:
	ldr r2, _021E5CC4 ; =gSystem + 0x40
	add r0, r4, #0
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl ov110_021E5D30
	add r1, r0, #0
	bpl _021E5CA2
	mov r0, #1
	pop {r4, pc}
_021E5CA2:
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov110_021E6C58
	ldr r0, _021E5CC8 ; =SEQ_SE_GS_SEKIBAN_SENTAKU
	bl PlaySE
	mov r0, #1
	str r0, [r4, #4]
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_021E5CBC: .word _021E6D8C
_021E5CC0: .word SEQ_SE_DP_SELECT
_021E5CC4: .word gSystem + 0x40
_021E5CC8: .word SEQ_SE_GS_SEKIBAN_SENTAKU
	thumb_func_end ov110_021E5C60

	thumb_func_start ov110_021E5CCC
ov110_021E5CCC: ; 0x021E5CCC
	push {r4, lr}
	add r4, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021E5CE0
	mov r0, #0
	strh r0, [r4, #0xe]
	mov r0, #4
	pop {r4, pc}
_021E5CE0:
	ldrh r1, [r4, #0xe]
	add r0, r1, #1
	strh r0, [r4, #0xe]
	cmp r1, #2
	blo _021E5D2C
	mov r1, #0x57
	mov r0, #0
	lsl r1, r1, #2
	strh r0, [r4, #0xe]
	ldr r0, [r4, r1]
	mov r3, #3
	ldrb r0, [r0]
	lsl r0, r0, #5
	add r0, #0x40
	strh r0, [r4, #0x1c]
	ldr r0, [r4, r1]
	ldrb r0, [r0, #1]
	lsl r0, r0, #5
	add r0, #0x20
	strh r0, [r4, #0x1e]
	ldr r0, [r4, r1]
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x22
	strb r2, [r0]
	ldr r0, [r4, r1]
	ldrb r2, [r0, #1]
	add r0, r4, #0
	add r0, #0x23
	strb r2, [r0]
	ldr r2, [r4, r1]
	add r0, r4, #0
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	bl ov110_021E6A44
	mov r0, #3
	pop {r4, pc}
_021E5D2C:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov110_021E5CCC

	thumb_func_start ov110_021E5D30
ov110_021E5D30: ; 0x021E5D30
	push {r4, r5}
	cmp r1, #0x20
	blo _021E5D3A
	cmp r1, #0xe0
	blo _021E5D42
_021E5D3A:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5}
	bx lr
_021E5D42:
	sub r1, #0x20
	asr r5, r1, #4
	lsr r5, r5, #0x1b
	add r5, r1, r5
	lsl r1, r5, #0xb
	lsl r2, r2, #0xb
	mov r4, #0
	add r3, r0, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
_021E5D56:
	add r5, r3, #0
	add r5, #0xdc
	ldrb r5, [r5]
	cmp r1, r5
	bne _021E5D80
	add r5, r3, #0
	add r5, #0xdd
	ldrb r5, [r5]
	cmp r2, r5
	bne _021E5D80
	lsl r1, r4, #3
	add r0, r0, r1
	add r0, #0xdf
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E5D7A
	mov r4, #0
	mvn r4, r4
_021E5D7A:
	add r0, r4, #0
	pop {r4, r5}
	bx lr
_021E5D80:
	add r4, r4, #1
	add r3, #8
	cmp r4, #0x10
	blt _021E5D56
	mov r0, #0
	mvn r0, r0
	pop {r4, r5}
	bx lr
	thumb_func_end ov110_021E5D30

	thumb_func_start ov110_021E5D90
ov110_021E5D90: ; 0x021E5D90
	push {r4, r5, r6, r7}
	add r3, r0, #0
	add r0, r2, #0
	mov r2, #0
	strb r2, [r1]
	strb r2, [r0]
	mov r4, #0x1c
	ldrsh r5, [r3, r4]
	cmp r5, #0x20
	blt _021E5DA8
	cmp r5, #0xe0
	blt _021E5DAE
_021E5DA8:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_021E5DAE:
	sub r5, #0x20
	asr r4, r5, #4
	lsr r4, r4, #0x1b
	add r4, r5, r4
	lsl r4, r4, #0xb
	lsr r5, r4, #0x10
	mov r4, #0x1e
	ldrsh r6, [r3, r4]
	asr r4, r6, #4
	lsr r4, r4, #0x1b
	add r4, r6, r4
	lsl r4, r4, #0xb
	lsr r6, r4, #0x10
	ldr r4, _021E5E18 ; =ov110_021E6D9C
_021E5DCA:
	ldrb r7, [r4]
	cmp r5, r7
	bne _021E5DDC
	ldrb r7, [r4, #1]
	cmp r6, r7
	bne _021E5DDC
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_021E5DDC:
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, #4
	blt _021E5DCA
	ldrb r2, [r3, #0x1b]
	mov r4, #0
_021E5DE8:
	cmp r2, r4
	beq _021E5E06
	add r7, r3, #0
	add r7, #0xdc
	ldrb r7, [r7]
	cmp r5, r7
	bne _021E5E06
	add r7, r3, #0
	add r7, #0xdd
	ldrb r7, [r7]
	cmp r6, r7
	bne _021E5E06
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_021E5E06:
	add r4, r4, #1
	add r3, #8
	cmp r4, #0x10
	blt _021E5DE8
	strb r5, [r1]
	strb r6, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_021E5E18: .word ov110_021E6D9C
	thumb_func_end ov110_021E5D90

	thumb_func_start ov110_021E5E1C
ov110_021E5E1C: ; 0x021E5E1C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021E5ECE
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	add r0, r5, #0
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	mov r3, #0
	bl ov110_021E6A44
	add r1, r5, #0
	add r2, r5, #0
	add r1, #0x22
	add r2, #0x23
	ldrb r1, [r1]
	ldrb r2, [r2]
	add r0, r5, #0
	mov r3, #0
	bl ov110_021E6A44
	ldr r0, [r5, #0x14]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	add r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5E8A
	add r0, r5, #0
	add r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E5E8A
	ldr r0, _021E5F78 ; =SEQ_SE_DP_BOX01
	bl PlaySE
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	ldrb r0, [r3, #2]
	str r0, [sp]
	ldrb r2, [r3]
	ldrb r1, [r5, #0x1b]
	ldrb r3, [r3, #1]
	add r0, r5, #0
	bl ov110_021E6C18
	b _021E5EAE
_021E5E8A:
	ldr r0, _021E5F7C ; =SEQ_SE_GS_SEKIBAN_SENTAKU
	bl PlaySE
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r5, #0
	ldrb r0, [r0, #2]
	add r3, r5, #0
	add r2, #0x22
	str r0, [sp]
	add r3, #0x23
	ldrb r1, [r5, #0x1b]
	ldrb r2, [r2]
	ldrb r3, [r3]
	add r0, r5, #0
	bl ov110_021E6C18
_021E5EAE:
	add r0, r5, #0
	mov r1, #0xff
	mov r2, #0
	bl ov110_021E6C58
	add r0, r5, #0
	bl ov110_021E68B4
	cmp r0, #0
	beq _021E5EC8
	add sp, #8
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E5EC8:
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E5ECE:
	ldr r1, _021E5F80 ; =gSystem + 0x40
	mov r0, #0x20
	ldrsh r6, [r1, r0]
	mov r0, #0x22
	ldrsh r4, [r1, r0]
	mov r0, #0x1c
	ldrsh r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x20
	strb r1, [r0]
	mov r0, #0x1e
	ldrsh r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x21
	strb r1, [r0]
	cmp r4, #0x10
	bge _021E5EF4
	mov r4, #0x10
	b _021E5EFA
_021E5EF4:
	cmp r4, #0xb0
	ble _021E5EFA
	mov r4, #0xb0
_021E5EFA:
	cmp r6, #0x30
	bge _021E5F02
	mov r6, #0x30
	b _021E5F08
_021E5F02:
	cmp r6, #0xd0
	ble _021E5F08
	mov r6, #0xd0
_021E5F08:
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	add r1, r6, #0
	add r2, r4, #0
	bl sub_0200DD88
	mov r0, #0x57
	lsl r0, r0, #2
	sub r1, r6, #2
	sub r2, r4, #2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov110_021E6BEC
	add r1, sp, #4
	strh r6, [r5, #0x1c]
	add r0, r5, #0
	add r1, #1
	add r2, sp, #4
	strh r4, [r5, #0x1e]
	bl ov110_021E5D90
	add r0, r5, #0
	add r2, sp, #4
	add r0, #0x22
	ldrb r1, [r2, #1]
	ldrb r0, [r0]
	cmp r0, r1
	bne _021E5F56
	add r0, r5, #0
	add r0, #0x23
	ldrb r3, [r0]
	ldrb r0, [r2]
	cmp r3, r0
	beq _021E5F70
_021E5F56:
	add r2, sp, #4
	ldrb r2, [r2]
	add r0, r5, #0
	bl ov110_021E6ABC
	add r0, r5, #0
	add r1, sp, #4
	ldrb r2, [r1, #1]
	add r0, #0x22
	add r5, #0x23
	strb r2, [r0]
	ldrb r0, [r1]
	strb r0, [r5]
_021E5F70:
	mov r0, #3
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E5F78: .word SEQ_SE_DP_BOX01
_021E5F7C: .word SEQ_SE_GS_SEKIBAN_SENTAKU
_021E5F80: .word gSystem + 0x40
	thumb_func_end ov110_021E5E1C

	thumb_func_start ov110_021E5F84
ov110_021E5F84: ; 0x021E5F84
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0xc]
	cmp r1, #0
	beq _021E5F98
	cmp r1, #1
	beq _021E5FA6
	cmp r1, #2
	beq _021E5FD4
	b _021E600C
_021E5F98:
	ldr r0, _021E6010 ; =SEQ_SE_GS_SEKIBAN_KAITEN
	bl PlaySE
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E600C
_021E5FA6:
	ldrh r1, [r4, #0xe]
	add r0, r1, #1
	strh r0, [r4, #0xe]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	lsl r1, r1, #0x1b
	lsr r2, r1, #0x10
	ldrb r1, [r3, #2]
	ldr r0, [r3, #4]
	lsl r1, r1, #0xe
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_02024818
	ldrh r0, [r4, #0xe]
	cmp r0, #8
	blo _021E600C
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E600C
_021E5FD4:
	mov r1, #0x57
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldrb r2, [r1, #2]
	add r2, r2, #1
	lsr r5, r2, #0x1f
	lsl r3, r2, #0x1e
	sub r3, r3, r5
	mov r2, #0x1e
	ror r3, r2
	add r2, r5, r3
	strb r2, [r1, #2]
	mov r1, #0xff
	mov r2, #0
	bl ov110_021E6C58
	mov r0, #0
	strh r0, [r4, #0xe]
	strh r0, [r4, #0xc]
	add r0, r4, #0
	bl ov110_021E68B4
	cmp r0, #0
	beq _021E6008
	mov r0, #6
	pop {r3, r4, r5, pc}
_021E6008:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E600C:
	mov r0, #4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6010: .word SEQ_SE_GS_SEKIBAN_KAITEN
	thumb_func_end ov110_021E5F84

	thumb_func_start ov110_021E6014
ov110_021E6014: ; 0x021E6014
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0xc]
	cmp r1, #0
	beq _021E6028
	cmp r1, #1
	beq _021E6044
	cmp r1, #2
	beq _021E605E
	b _021E606C
_021E6028:
	ldrb r1, [r4, #0x1a]
	cmp r1, #0
	bne _021E606C
	add r3, r4, #0
	add r3, #0x25
	ldrb r3, [r3]
	mov r1, #0
	mov r2, #1
	bl ov110_021E6988
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E606C
_021E6044:
	add r0, #0x24
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E606C
	add r0, r4, #0
	bl ov110_021E6B38
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E606C
_021E605E:
	bl ov110_021E6B94
	cmp r0, #5
	beq _021E606C
	mov r1, #0
	strh r1, [r4, #0xc]
	pop {r4, pc}
_021E606C:
	mov r0, #5
	pop {r4, pc}
	thumb_func_end ov110_021E6014

	thumb_func_start ov110_021E6070
ov110_021E6070: ; 0x021E6070
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	beq _021E6086
	cmp r0, #1
	beq _021E6094
	cmp r0, #2
	beq _021E60C2
	b _021E60F0
_021E6086:
	ldr r0, _021E6108 ; =SEQ_SE_GS_PUZZLETOKU
	bl PlaySE
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E6102
_021E6094:
	ldrh r0, [r4, #0xe]
	mov r1, #2
	mov r2, #0x2b
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, _021E610C ; =0x00007FFF
	mov r3, #5
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02003E5C
	ldrh r1, [r4, #0xe]
	add r0, r1, #1
	strh r0, [r4, #0xe]
	cmp r1, #0xf
	blo _021E6102
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E6102
_021E60C2:
	ldrh r0, [r4, #0xe]
	mov r1, #2
	mov r2, #0x2b
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, _021E610C ; =0x00007FFF
	mov r3, #5
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02003E5C
	ldrh r1, [r4, #0xe]
	sub r0, r1, #1
	strh r0, [r4, #0xe]
	cmp r1, #0
	bne _021E6102
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	b _021E6102
_021E60F0:
	mov r0, #0
	strh r0, [r4, #0xc]
	strh r0, [r4, #0xe]
	mov r0, #1
	add r4, #0x27
	strb r0, [r4]
	add sp, #8
	mov r0, #7
	pop {r4, pc}
_021E6102:
	mov r0, #6
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E6108: .word SEQ_SE_GS_PUZZLETOKU
_021E610C: .word 0x00007FFF
	thumb_func_end ov110_021E6070

	thumb_func_start ov110_021E6110
ov110_021E6110: ; 0x021E6110
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6120
	bl sub_0200398C
_021E6120:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	beq _021E612E
	bl sub_0200D034
_021E612E:
	bl NNS_GfdDoVramTransfer
	ldr r0, [r4, #0x14]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E6148 ; =0x027E0000
	ldr r1, _021E614C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E6148: .word 0x027E0000
_021E614C: .word 0x00003FF8
	thumb_func_end ov110_021E6110

	thumb_func_start ov110_021E6150
ov110_021E6150: ; 0x021E6150
	push {r4, r5, r6, r7}
	ldrb r1, [r0, #0x19]
	mov r5, #0
	add r7, r0, #0
	lsl r2, r1, #2
	ldr r1, _021E61AC ; =ov110_021E7000
	mov ip, r5
	ldr r4, [r1, r2]
	add r7, #0xdc
_021E6162:
	mov r0, ip
	lsl r0, r0, #0x18
	mov r3, #0
	lsr r0, r0, #0x18
_021E616A:
	add r2, r3, r5
	ldrb r1, [r4, r2]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1b
	beq _021E6196
	cmp r1, #0x10
	bhi _021E6196
	sub r1, r1, #1
	lsl r6, r1, #3
	add r1, r7, r6
	strb r3, [r7, r6]
	strb r0, [r1, #1]
	ldrb r6, [r4, r2]
	lsl r6, r6, #0x19
	lsr r6, r6, #0x1e
	strb r6, [r1, #2]
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	strb r2, [r1, #3]
	mov r2, #0
	str r2, [r1, #4]
_021E6196:
	add r3, r3, #1
	cmp r3, #6
	blt _021E616A
	mov r0, ip
	add r0, r0, #1
	add r5, r5, #6
	mov ip, r0
	cmp r0, #6
	blt _021E6162
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_021E61AC: .word ov110_021E7000
	thumb_func_end ov110_021E6150

	thumb_func_start ov110_021E61B0
ov110_021E61B0: ; 0x021E61B0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E61CC ; =ov110_021E6F54
	add r3, sp, #0
	mov r2, #5
_021E61BA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E61BA
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E61CC: .word ov110_021E6F54
	thumb_func_end ov110_021E61B0

	thumb_func_start ov110_021E61D0
ov110_021E61D0: ; 0x021E61D0
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	add r4, r0, #0
	bl ov110_021E61B0
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0xa8
	ldr r5, _021E6324 ; =ov110_021E6DC0
	str r0, [r4, #0x14]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r2, _021E6328 ; =0x04000304
	ldr r0, _021E632C ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _021E6330 ; =ov110_021E6E34
	add r3, sp, #0x8c
	and r0, r1
	strh r0, [r2]
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
	ldr r0, [r4, #0x14]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6334 ; =ov110_021E6E6C
	add r3, sp, #0x70
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
	ldr r0, [r4, #0x14]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6338 ; =ov110_021E6E88
	add r3, sp, #0x54
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
	ldr r0, [r4, #0x14]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E633C ; =ov110_021E6DFC
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	mov r1, #0
	ldr r0, [r4, #0x14]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6340 ; =ov110_021E6E18
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
	ldr r0, [r4, #0x14]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6344 ; =ov110_021E6E50
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4, #0x14]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x14]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	mov r0, #0
	ldr r3, [r4]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #3
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6324: .word ov110_021E6DC0
_021E6328: .word 0x04000304
_021E632C: .word 0xFFFF7FFF
_021E6330: .word ov110_021E6E34
_021E6334: .word ov110_021E6E6C
_021E6338: .word ov110_021E6E88
_021E633C: .word ov110_021E6DFC
_021E6340: .word ov110_021E6E18
_021E6344: .word ov110_021E6E50
	thumb_func_end ov110_021E61D0

	thumb_func_start ov110_021E6348
ov110_021E6348: ; 0x021E6348
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	ldr r2, _021E6390 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E6390: .word 0x04000304
	thumb_func_end ov110_021E6348

	thumb_func_start ov110_021E6394
ov110_021E6394: ; 0x021E6394
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xac
	bl NARC_ctor
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_020030E8
	add r1, r5, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x80
	mov r2, #1
	ldr r0, [r0]
	ldr r3, [r5]
	mov r1, #0
	lsl r2, r2, #8
	bl PaletteData_AllocBuffers
	add r0, r5, #0
	add r0, #0x80
	mov r1, #1
	add r2, r1, #0
	ldr r0, [r0]
	ldr r3, [r5]
	add r2, #0xff
	bl PaletteData_AllocBuffers
	add r0, r5, #0
	add r0, #0x80
	mov r1, #2
	add r2, r1, #0
	ldr r0, [r0]
	ldr r3, [r5]
	add r2, #0xfe
	bl PaletteData_AllocBuffers
	mov r1, #0
	mov r0, #1
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	add r1, r4, #0
	mov r2, #0xa
	bl sub_02003220
	mov r0, #1
	str r0, [sp]
	add r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	add r1, r4, #0
	mov r2, #0xa
	bl sub_02003220
	mov r0, #2
	str r0, [sp]
	add r0, #0xfe
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	add r0, r5, #0
	str r2, [sp, #0xc]
	add r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	add r1, r4, #0
	bl sub_02003220
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xf
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5]
	add r3, r5, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	add r3, #0xd4
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	add r1, r5, #0
	add r1, #0xd8
	str r0, [r1]
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x50
	str r0, [sp, #8]
	add r2, r5, #0
	add r2, #0x26
	add r0, r5, #0
	ldrb r2, [r2]
	add r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	mov r1, #0x26
	add r2, #0x1a
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r3, [r5]
	mov r1, #0x10
	mov r2, #8
	bl PaletteData_LoadNarc
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	mov r1, #0
	mov r2, #1
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #5
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	bl LoadUserFrameGfx2
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl sub_02003B50
	add r5, #0x80
	ldr r0, [r5]
	bl sub_0200398C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6394

	thumb_func_start ov110_021E6544
ov110_021E6544: ; 0x021E6544
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #2
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #1
	bl PaletteData_FreeBuffers
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0
	bl PaletteData_FreeBuffers
	add r4, #0x80
	ldr r0, [r4]
	bl sub_02003104
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6544

	thumb_func_start ov110_021E6580
ov110_021E6580: ; 0x021E6580
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r1, [r6]
	mov r0, #4
	bl FontID_Alloc
	ldr r3, [r6]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #2
	bl NewMsgDataFromNarc
	str r0, [r6, #0x28]
	ldr r2, [r6]
	mov r0, #6
	mov r1, #0x10
	bl ScrStrBufs_new_custom
	str r0, [r6, #0x2c]
	ldr r1, [r6]
	mov r0, #0x80
	bl String_ctor
	str r0, [r6, #0x30]
	ldr r0, [r6, #0x28]
	mov r1, #0
	bl NewString_ReadMsgData
	str r0, [r6, #0x34]
	mov r4, #0
	add r5, r6, #0
_021E65BE:
	ldr r0, [r6, #0x28]
	add r1, r4, #1
	bl NewString_ReadMsgData
	str r0, [r5, #0x38]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E65BE
	ldr r0, [r6, #0x28]
	mov r1, #5
	bl NewString_ReadMsgData
	str r0, [r6, #0x48]
	pop {r4, r5, r6, pc}
	thumb_func_end ov110_021E6580

	thumb_func_start ov110_021E65DC
ov110_021E65DC: ; 0x021E65DC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x48]
	bl String_dtor
	mov r4, #0
	add r5, r6, #0
_021E65EA:
	ldr r0, [r5, #0x38]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E65EA
	ldr r0, [r6, #0x34]
	bl String_dtor
	ldr r0, [r6, #0x30]
	bl String_dtor
	ldr r0, [r6, #0x2c]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x28]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	pop {r4, r5, r6, pc}
	thumb_func_end ov110_021E65DC

	thumb_func_start ov110_021E6618
ov110_021E6618: ; 0x021E6618
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _021E664C ; =ov110_021E6DE4
	mov r6, #0
	add r5, #0x4c
_021E6624:
	ldr r0, [r7, #0x14]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #3
	blt _021E6624
	ldr r0, [r7]
	bl sub_0201660C
	str r0, [r7, #0x7c]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E664C: .word ov110_021E6DE4
	thumb_func_end ov110_021E6618

	thumb_func_start ov110_021E6650
ov110_021E6650: ; 0x021E6650
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0x4c
_021E665A:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _021E665A
	ldr r0, [r6, #0x7c]
	bl sub_02016624
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6650

	thumb_func_start ov110_021E6678
ov110_021E6678: ; 0x021E6678
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r4]
	bl sub_0200CF18
	add r1, r4, #0
	add r1, #0x84
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, _021E66EC ; =ov110_021E6EA4
	ldr r2, _021E66F0 ; =ov110_021E6DD0
	mov r3, #3
	bl sub_0200CF70
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x12
	bl sub_0200CFF4
	mov r0, #1
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x84
	add r4, #0x88
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, _021E66F4 ; =ov110_021E6DB0
	mov r3, #2
	bl sub_0200D2A4
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E66EC: .word ov110_021E6EA4
_021E66F0: .word ov110_021E6DD0
_021E66F4: .word ov110_021E6DB0
	thumb_func_end ov110_021E6678

	thumb_func_start ov110_021E66F8
ov110_021E66F8: ; 0x021E66F8
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D0E4
	add r0, r4, #0
	mov r1, #0
	add r0, #0x88
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	bl sub_0200D108
	add r0, r4, #0
	mov r1, #0
	add r0, #0x84
	str r1, [r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	pop {r4, pc}
	thumb_func_end ov110_021E66F8

	thumb_func_start ov110_021E6730
ov110_021E6730: ; 0x021E6730
	push {r4, lr}
	add r4, r0, #0
	bl ov110_021E6678
	add r0, r4, #0
	bl ov110_021E6764
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	thumb_func_end ov110_021E6730

	thumb_func_start ov110_021E6748
ov110_021E6748: ; 0x021E6748
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov110_021E6898
	add r0, r4, #0
	bl ov110_021E66F8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6748

	thumb_func_start ov110_021E6764
ov110_021E6764: ; 0x021E6764
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r6, _021E6890 ; =ov110_021E6F7C
	mov r7, #0
	add r4, r5, #0
_021E6770:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r6, #0
	bl sub_0200D2B4
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x8c
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0xc
	bl sub_02024868
	add r7, r7, #1
	add r6, #0x28
	add r4, r4, #4
	cmp r7, #1
	ble _021E6770
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl sub_02024B78
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #2
	bl sub_02024A04
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	ldrb r3, [r5, #0x19]
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0xac
	add r3, r3, #4
	bl sub_0200E248
	mov r7, #0
	add r6, r5, #0
_021E680A:
	add r0, r7, #2
	lsl r0, r0, #0x18
	lsr r4, r0, #0x16
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x84
	add r1, #0x88
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _021E6894 ; =ov110_021E6FCC
	bl sub_0200D2B4
	add r1, r5, r4
	add r1, #0x8c
	str r0, [r1]
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0
	bl sub_02024B78
	add r0, r5, r4
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #2
	bl sub_0202487C
	add r0, r5, r4
	add r0, #0x8c
	ldr r1, [r0]
	add r0, r6, #0
	add r0, #0xe0
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xde
	ldrb r0, [r0]
	add r2, r6, #0
	add r3, r6, #0
	str r0, [sp]
	add r2, #0xdc
	add r3, #0xdd
	lsl r1, r7, #0x18
	ldrb r2, [r2]
	ldrb r3, [r3]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov110_021E6C18
	add r7, r7, #1
	add r6, #8
	cmp r7, #0x10
	blt _021E680A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6890: .word ov110_021E6F7C
_021E6894: .word ov110_021E6FCC
	thumb_func_end ov110_021E6764

	thumb_func_start ov110_021E6898
ov110_021E6898: ; 0x021E6898
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021E689E:
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x12
	blt _021E689E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6898

	thumb_func_start ov110_021E68B4
ov110_021E68B4: ; 0x021E68B4
	push {r3, r4}
	mov r1, #0
	mov r3, #0x1e
_021E68BA:
	add r2, r0, #0
	add r2, #0xde
	ldrb r2, [r2]
	cmp r2, #0
	bne _021E68EE
	lsr r4, r1, #0x1f
	lsl r2, r1, #0x1e
	sub r2, r2, r4
	ror r2, r3
	add r2, r4, r2
	add r4, r2, #1
	add r2, r0, #0
	add r2, #0xdc
	ldrb r2, [r2]
	cmp r4, r2
	bne _021E68EE
	asr r2, r1, #1
	lsr r2, r2, #0x1e
	add r2, r1, r2
	asr r2, r2, #2
	add r4, r2, #1
	add r2, r0, #0
	add r2, #0xdd
	ldrb r2, [r2]
	cmp r4, r2
	beq _021E68F4
_021E68EE:
	mov r0, #0
	pop {r3, r4}
	bx lr
_021E68F4:
	add r1, r1, #1
	add r0, #8
	cmp r1, #0x10
	blt _021E68BA
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov110_021E68B4

	thumb_func_start ov110_021E6904
ov110_021E6904: ; 0x021E6904
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x4c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
	cmp r4, #1
	bne _021E693C
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_02024964
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	b _021E6948
_021E693C:
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
_021E6948:
	ldr r1, [r5, #0x34]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #4
	add r3, r0, #0
	lsl r2, r4, #2
	mov r4, #0x30
	sub r3, r4, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6984 ; =ov110_021E6DA4
	lsr r3, r3, #1
	ldr r0, [r0, r2]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x34]
	add r0, #0x4c
	bl AddTextPrinterParameterized2
	add r5, #0x4c
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6984: .word ov110_021E6DA4
	thumb_func_end ov110_021E6904

	thumb_func_start ov110_021E6988
ov110_021E6988: ; 0x021E6988
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	cmp r2, #0
	beq _021E69A2
	mov r1, #1
	add r0, #0x5c
	add r2, r1, #0
	mov r3, #5
	bl DrawFrameAndWindow2
_021E69A2:
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #0xf
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _021E69D0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6A00 ; =0x0001020F
	lsl r2, r4, #2
	str r0, [sp, #8]
	add r0, r5, #0
	str r3, [sp, #0xc]
	add r2, r5, r2
	ldr r2, [r2, #0x48]
	add r0, #0x5c
	mov r1, #1
	bl AddTextPrinterParameterized2
	b _021E69F2
_021E69D0:
	mov r3, #0
	str r3, [sp]
	ldr r0, _021E6A00 ; =0x0001020F
	str r6, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r4, #2
	add r0, r5, #0
	str r3, [sp, #0xc]
	add r2, r5, r2
	ldr r2, [r2, #0x48]
	add r0, #0x5c
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r1, r5, #0
	add r1, #0x24
	strb r0, [r1]
_021E69F2:
	add r5, #0x5c
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6A00: .word 0x0001020F
	thumb_func_end ov110_021E6988

	thumb_func_start ov110_021E6A04
ov110_021E6A04: ; 0x021E6A04
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x6c
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6A40 ; =0x00020100
	mov r1, #4
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldrb r2, [r4, #0x19]
	add r0, r4, #0
	add r0, #0x6c
	lsl r2, r2, #2
	add r2, r4, r2
	ldr r2, [r2, #0x38]
	bl AddTextPrinterParameterized2
	add r4, #0x6c
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021E6A40: .word 0x00020100
	thumb_func_end ov110_021E6A04

	thumb_func_start ov110_021E6A44
ov110_021E6A44: ; 0x021E6A44
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r4, r2, #0
	cmp r3, #0
	bne _021E6A74
	lsl r1, r4, #0x1a
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r2, #0
	lsl r3, r5, #2
	str r2, [sp, #0xc]
	add r3, r3, #4
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x14]
	mov r1, #2
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add sp, #0x1c
	pop {r4, r5, pc}
_021E6A74:
	add r1, r0, #0
	add r1, #0xd4
	ldr r1, [r1]
	mov r2, #4
	str r2, [sp]
	str r2, [sp, #4]
	add r2, r1, #0
	add r2, #0xc
	str r2, [sp, #8]
	sub r2, r3, #1
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	ldrh r2, [r1]
	lsl r3, r4, #0x1a
	lsr r3, r3, #0x18
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r1, [r1, #2]
	lsl r2, r5, #2
	add r2, r2, #4
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x18]
	lsl r2, r2, #0x18
	ldr r0, [r0, #0x14]
	mov r1, #2
	lsr r2, r2, #0x18
	bl CopyToBgTilemapRect
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6A44

	thumb_func_start ov110_021E6ABC
ov110_021E6ABC: ; 0x021E6ABC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0x57
	add r5, r0, #0
	lsl r2, r2, #2
	add r4, r1, #0
	add r1, r5, #0
	ldr r3, [r5, r2]
	add r1, #0x22
	ldrb r1, [r1]
	ldrb r2, [r3]
	cmp r2, r1
	bne _021E6AEA
	add r2, r5, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldrb r3, [r3, #1]
	cmp r3, r2
	bne _021E6AEA
	mov r3, #2
	bl ov110_021E6A44
	b _021E6AF8
_021E6AEA:
	add r2, r5, #0
	add r2, #0x23
	ldrb r2, [r2]
	add r0, r5, #0
	mov r3, #0
	bl ov110_021E6A44
_021E6AF8:
	ldr r0, [r5, #0x14]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	cmp r4, #0
	bne _021E6B08
	cmp r6, #0
	beq _021E6B34
_021E6B08:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	ldrb r0, [r1]
	cmp r0, r4
	bne _021E6B28
	ldrb r0, [r1, #1]
	cmp r0, r6
	bne _021E6B28
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #3
	bl ov110_021E6A44
	pop {r4, r5, r6, pc}
_021E6B28:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #1
	bl ov110_021E6A44
_021E6B34:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6ABC

	thumb_func_start ov110_021E6B38
ov110_021E6B38: ; 0x021E6B38
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #0x14]
	mov r2, #0
	str r0, [sp]
	mov r0, #0x1f
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	str r2, [sp, #4]
	mov r1, #0x19
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #0xa
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	mov r3, #0xf
	bic r1, r3
	ldr r3, [r4, #4]
	lsl r3, r3, #0x18
	lsr r5, r3, #0x18
	mov r3, #0xf
	and r3, r5
	orr r1, r3
	strb r1, [r0, #0x12]
	ldrb r3, [r0, #0x12]
	mov r1, #0xf0
	bic r3, r1
	mov r1, #0x10
	orr r1, r3
	strb r1, [r0, #0x12]
	strb r2, [r0, #0x13]
	ldr r0, [r4, #0x7c]
	add r4, #0x80
	ldr r2, [r4]
	add r1, sp, #0
	bl sub_02016704
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov110_021E6B38

	thumb_func_start ov110_021E6B94
ov110_021E6B94: ; 0x021E6B94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x7c]
	bl sub_020168F4
	cmp r0, #1
	beq _021E6BA8
	cmp r0, #2
	beq _021E6BAC
	b _021E6BB0
_021E6BA8:
	mov r4, #7
	b _021E6BB4
_021E6BAC:
	mov r4, #1
	b _021E6BB4
_021E6BB0:
	mov r0, #5
	pop {r3, r4, r5, pc}
_021E6BB4:
	ldr r0, [r5, #0x7c]
	bl sub_020169C0
	str r0, [r5, #4]
	ldr r0, [r5, #0x7c]
	bl sub_020169CC
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x5c
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x5c
	bl ScheduleWindowCopyToVram
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6B94

	thumb_func_start ov110_021E6BEC
ov110_021E6BEC: ; 0x021E6BEC
	push {r4, lr}
	ldrb r3, [r0, #2]
	ldr r4, _021E6C10 ; =ov110_021E6D94
	ldr r0, [r0, #4]
	lsl r3, r3, #1
	ldrsb r4, [r4, r3]
	add r1, r1, r4
	ldr r4, _021E6C14 ; =ov110_021E6D94 + 1
	lsl r1, r1, #0x10
	ldrsb r3, [r4, r3]
	asr r1, r1, #0x10
	add r2, r2, r3
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	pop {r4, pc}
	nop
_021E6C10: .word ov110_021E6D94
_021E6C14: .word ov110_021E6D94 + 1
	thumb_func_end ov110_021E6BEC

	thumb_func_start ov110_021E6C18
ov110_021E6C18: ; 0x021E6C18
	push {r4, lr}
	add r0, #0xdc
	lsl r1, r1, #3
	add r4, r0, r1
	strb r2, [r0, r1]
	lsl r1, r2, #5
	ldr r0, _021E6C54 ; =0xFFFFFFF8
	lsl r2, r3, #5
	add r1, #0x30
	add r2, #0x10
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	strb r3, [r4, #1]
	add r0, sp
	ldrb r0, [r0, #0x10]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	strb r0, [r4, #2]
	add r0, r4, #0
	bl ov110_021E6BEC
	ldr r1, _021E6C54 ; =0xFFFFFFF8
	ldr r0, [r4, #4]
	add r1, sp
	ldrb r1, [r1, #0x10]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x10
	bl sub_02024818
	pop {r4, pc}
	.balign 4, 0
_021E6C54: .word 0xFFFFFFF8
	thumb_func_end ov110_021E6C18

	thumb_func_start ov110_021E6C58
ov110_021E6C58: ; 0x021E6C58
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	cmp r2, #0
	beq _021E6CCC
	strb r1, [r4, #0x1b]
	ldrb r0, [r4, #0x1b]
	add r1, r4, #0
	add r1, #0xdc
	lsl r0, r0, #3
	add r1, r1, r0
	mov r0, #0x57
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	mov r1, #0
	ldr r0, [r0, #4]
	bl sub_02024ADC
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	mvn r1, r1
	ldr r0, [r0, #4]
	add r2, r1, #0
	bl sub_0200DEA0
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r4, #0
	ldrb r1, [r2]
	ldrb r2, [r2, #1]
	add r0, #0x90
	lsl r1, r1, #5
	lsl r2, r2, #5
	add r1, #0x30
	add r2, #0x10
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	add r0, r4, #0
	mov r1, #2
	bl ov110_021E6904
	add sp, #4
	pop {r3, r4, pc}
_021E6CCC:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	ldr r0, [r0, #4]
	bl sub_02024ADC
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	ldrb r0, [r3, #2]
	str r0, [sp]
	ldrb r2, [r3]
	ldrb r1, [r4, #0x1b]
	ldrb r3, [r3, #1]
	add r0, r4, #0
	bl ov110_021E6C18
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov110_021E6904
	add r0, r4, #0
	mov r1, #0
	add r0, #0x22
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x23
	strb r1, [r0]
	mov r0, #0x57
	lsl r0, r0, #2
	str r1, [r4, r0]
	strb r1, [r4, #0x1b]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov110_021E6C58

	thumb_func_start ov110_021E6D20
ov110_021E6D20: ; 0x021E6D20
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #8
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #8
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r0, _021E6D50 ; =ov110_021E6D54
	add r1, r5, #0
	mov r2, #0
	str r4, [r5]
	bl CreateSysTask
	add r0, r4, #0
	mov r1, #1
	bl ov110_021E6904
	mov r0, #1
	strb r0, [r4, #0x1a]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6D50: .word ov110_021E6D54
	thumb_func_end ov110_021E6D20

	thumb_func_start ov110_021E6D54
ov110_021E6D54: ; 0x021E6D54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_02024B68
	cmp r0, #0
	bne _021E6D8A
	ldr r0, [r4]
	mov r1, #0
	bl ov110_021E6904
	ldr r0, [r4]
	mov r1, #0
	strb r1, [r0, #0x1a]
	add r0, r4, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_021E6D8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov110_021E6D54

	.rodata

_021E6D8C:
	.byte 0xA9, 0xBF, 0xD1, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov110_021E6D94: ; 0x021E6D94
	.byte 0x00, 0x00
	.byte 0xFF, 0x00
	.byte 0xFF, 0xFF
	.byte 0x00, 0xFF

ov110_021E6D9C: ; 0x021E6D9C
	.byte 0x00, 0x00
	.byte 0x05, 0x00
	.byte 0x00, 0x05
	.byte 0x05, 0x05

ov110_021E6DA4: ; 0x021E6DA4
	.word 0x00010200
	.word 0x00030400
	.word 0x00050600

ov110_021E6DB0: ; 0x021E6DB0
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x09, 0x00, 0x08, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x4A, 0x00, 0x00, 0x00

ov110_021E6DC0: ; 0x021E6DC0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6DD0: ; 0x021E6DD0
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov110_021E6DE4: ; 0x021E6DE4
	.byte 0x02, 0x1A, 0x15, 0x06, 0x03, 0x03
	.short 0x03EE
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x04
	.short 0x005B
	.byte 0x04, 0x04, 0x0F, 0x18, 0x06, 0x03
	.short 0x0001

ov110_021E6DFC: ; 0x021E6DFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E18: ; 0x021E6E18
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov110_021E6E34: ; 0x021E6E34
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E50: ; 0x021E6E50
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E6C: ; 0x021E6E6C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6E88: ; 0x021E6E88
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov110_021E6EA4: ; 0x021E6EA4
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00

ov110_021E6EC4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x81, 0x00, 0x83, 0x84, 0x00
	.byte 0x00, 0x85, 0x00, 0x87, 0x88, 0x4B, 0x00, 0x00, 0x8A, 0x00, 0x8C, 0x00, 0x62, 0x8D, 0x8E, 0x8F
	.byte 0x90, 0x00, 0x00, 0x00, 0x00, 0x00, 0x29, 0x00

ov110_021E6EE8:
	.byte 0x00, 0x6A, 0x00, 0x4E, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x83, 0x84, 0x00, 0x00, 0x00, 0x00, 0x87, 0x88, 0x70, 0x62, 0x89, 0x00, 0x8B, 0x8C, 0x00
	.byte 0x00, 0x8D, 0x00, 0x8F, 0x00, 0x46, 0x00, 0x00, 0x41, 0x00, 0x25, 0x00

ov110_021E6F0C:
	.byte 0x00, 0x00, 0x2B, 0x00
	.byte 0x0A, 0x00, 0x09, 0x00, 0x82, 0x83, 0x84, 0x00, 0x00, 0x85, 0x86, 0x00, 0x00, 0x4E, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x6D, 0x61, 0x00, 0x00, 0x8F, 0x90, 0x00, 0x00, 0x47, 0x2C, 0x00, 0x00, 0x00

ov110_021E6F30:
	.byte 0x00, 0x00, 0x09, 0x6E, 0x61, 0x00, 0x4F, 0x00, 0x00, 0x83, 0x84, 0x00, 0x4D, 0x85, 0x86, 0x87
	.byte 0x00, 0x6A, 0x62, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x6B, 0x00, 0x45
	.byte 0x28, 0x00, 0x00, 0x00

ov110_021E6F54: ; 0x021E6F54
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6F7C: ; 0x021E6F7C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov110_021E6FCC: ; 0x021E6FCC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.data

ov110_021E7000:
	.word ov110_021E6EC4
	.word ov110_021E6EE8
	.word ov110_021E6F0C
	.word ov110_021E6F30
	; 0x021E7020
