#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02097720
sub_02097720: ; 0x02097720
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl TaskManager_GetSys
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4]
	ldr r1, _02097750 ; =sub_02097754
	add r0, r6, #0
	add r2, r4, #0
	str r5, [r4, #4]
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_02097750: .word sub_02097754
	thumb_func_end sub_02097720

	thumb_func_start sub_02097754
sub_02097754: ; 0x02097754
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #3
	bhi _020977C6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02097778: ; jump table
	.short _02097780 - _02097778 - 2 ; case 0
	.short _02097790 - _02097778 - 2 ; case 1
	.short _020977B0 - _02097778 - 2 ; case 2
	.short _020977BE - _02097778 - 2 ; case 3
_02097780:
	add r0, r6, #0
	bl sub_0203EB64
	str r0, [r4, #8]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020977C6
_02097790:
	add r0, r6, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _020977C6
	ldr r0, [r4, #8]
	ldrh r1, [r0, #0x1c]
	ldr r0, [r4, #4]
	strh r1, [r0]
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020977C6
_020977B0:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020977C6
_020977BE:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_020977C6:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02097754
