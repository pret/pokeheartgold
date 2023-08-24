#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02097D3C.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02097D3C
sub_02097D3C: ; 0x02097D3C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #8
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	str r0, [r4, #4]
	add r0, r5, #0
	bl FieldSystem_GetSaveData
	ldr r1, [r4, #4]
	add r2, r4, #0
	str r0, [r1, #4]
	ldr r0, [r4, #4]
	ldr r1, _02097D7C ; =sub_02097D80
	strh r6, [r0]
	ldr r0, [r4, #4]
	strh r7, [r0, #2]
	ldr r0, [r5, #0x10]
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097D7C: .word sub_02097D80
	thumb_func_end sub_02097D3C

	thumb_func_start sub_02097D80
sub_02097D80: ; 0x02097D80
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _02097E46
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097DA6: ; jump table
	.short _02097DB0 - _02097DA6 - 2 ; case 0
	.short _02097DD0 - _02097DA6 - 2 ; case 1
	.short _02097DEC - _02097DA6 - 2 ; case 2
	.short _02097E04 - _02097DA6 - 2 ; case 3
	.short _02097E2C - _02097DA6 - 2 ; case 4
_02097DB0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02097E46
_02097DD0:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02097E46
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_0203FD08
	bl sub_0203E30C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02097E46
_02097DEC:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02097E46
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add r0, r5, #0
	bl sub_020505C0
	b _02097E46
_02097E04:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _02097E46
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02097E46
_02097E2C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02097E46
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_02097E46:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02097D80
