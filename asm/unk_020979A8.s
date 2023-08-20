#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020979A8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020979A8
sub_020979A8: ; 0x020979A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x58
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	strb r6, [r4, #1]
	add r1, r4, #0
	ldr r0, [sp]
	strb r7, [r4, #2]
	str r0, [r4, #4]
	ldr r0, [sp, #0x18]
	add r1, #0x10
	str r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0xc]
	mov r0, #0
	bl LoadAreaOrDungeonLightTxt
	mov r0, #0
	strb r0, [r4]
	ldr r0, [r5, #0x10]
	ldr r1, _020979E8 ; =sub_02097AA0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020979E8: .word sub_02097AA0
	thumb_func_end sub_020979A8

	thumb_func_start sub_020979EC
sub_020979EC: ; 0x020979EC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #8
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	str r7, [r4, #4]
	add r0, r5, #0
	strb r6, [r4]
	bl Field_GetTimeOfDay
	cmp r0, #4
	bhi _02097A2E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097A18: ; jump table
	.short _02097A22 - _02097A18 - 2 ; case 0
	.short _02097A22 - _02097A18 - 2 ; case 1
	.short _02097A28 - _02097A18 - 2 ; case 2
	.short _02097A28 - _02097A18 - 2 ; case 3
	.short _02097A28 - _02097A18 - 2 ; case 4
_02097A22:
	mov r0, #0
	strb r0, [r4, #1]
	b _02097A36
_02097A28:
	mov r0, #1
	strb r0, [r4, #1]
	b _02097A36
_02097A2E:
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #1]
_02097A36:
	ldr r0, [r5, #0x10]
	ldr r1, _02097A44 ; =sub_02097A48
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097A44: .word sub_02097A48
	thumb_func_end sub_020979EC

	thumb_func_start sub_02097A48
sub_02097A48: ; 0x02097A48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02097A72
	cmp r0, #1
	beq _02097A7C
	cmp r0, #2
	beq _02097A8A
	b _02097A94
_02097A72:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0203FC90
	b _02097A94
_02097A7C:
	add r0, r4, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	beq _02097A94
	mov r0, #0
	pop {r4, r5, r6, pc}
_02097A8A:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02097A94:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02097A48

	thumb_func_start sub_02097AA0
sub_02097AA0: ; 0x02097AA0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #5
	bhi _02097B72
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02097AC6: ; jump table
	.short _02097AD2 - _02097AC6 - 2 ; case 0
	.short _02097AF8 - _02097AC6 - 2 ; case 1
	.short _02097B24 - _02097AC6 - 2 ; case 2
	.short _02097B36 - _02097AC6 - 2 ; case 3
	.short _02097B52 - _02097AC6 - 2 ; case 4
	.short _02097B68 - _02097AC6 - 2 ; case 5
_02097AD2:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	mov r1, #6
	bl GF_SndStartFadeOutBGM
	mov r0, #1
	strb r0, [r4]
	b _02097B72
_02097AF8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02097B08
	bl GF_SndGetFadeTimer
	cmp r0, #0
	beq _02097B0E
_02097B08:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02097B0E:
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	add r0, r5, #0
	bl sub_0205525C
	mov r0, #2
	strb r0, [r4]
	b _02097B72
_02097B24:
	ldrb r1, [r4, #1]
	add r2, r4, #0
	add r0, r6, #0
	add r2, #0x10
	bl sub_020979EC
	mov r0, #3
	strb r0, [r4]
	b _02097B72
_02097B36:
	ldr r0, [r4, #0xc]
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r4, #2]
	mvn r2, r2
	str r0, [sp, #4]
	ldr r1, [r4, #4]
	ldr r3, [r4, #8]
	add r0, r5, #0
	bl sub_020537F0
	mov r0, #4
	strb r0, [r4]
	b _02097B72
_02097B52:
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_02055408
	mov r0, #5
	strb r0, [r4]
	b _02097B72
_02097B68:
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02097B72:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02097AA0
