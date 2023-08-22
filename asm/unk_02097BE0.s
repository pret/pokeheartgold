#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02097BE0.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02097BE0
sub_02097BE0: ; 0x02097BE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0xb
	mov r1, #0x54
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r3, [r5, #0x48]
	add r6, r4, #0
	mov r2, #9
_02097BF6:
	ldmia r3!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r2, r2, #1
	bne _02097BF6
	str r7, [r4, #0x48]
	mov r0, #0
	str r0, [r4, #0x50]
	add r0, r5, #0
	bl Field_GetTimeOfDay
	cmp r0, #4
	bhi _02097C36
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097C1A: ; jump table
	.short _02097C24 - _02097C1A - 2 ; case 0
	.short _02097C24 - _02097C1A - 2 ; case 1
	.short _02097C2A - _02097C1A - 2 ; case 2
	.short _02097C30 - _02097C1A - 2 ; case 3
	.short _02097C30 - _02097C1A - 2 ; case 4
_02097C24:
	mov r0, #0
	str r0, [r4, #0x4c]
	b _02097C3E
_02097C2A:
	mov r0, #1
	str r0, [r4, #0x4c]
	b _02097C3E
_02097C30:
	mov r0, #2
	str r0, [r4, #0x4c]
	b _02097C3E
_02097C36:
	bl GF_AssertFail
	mov r0, #1
	str r0, [r4, #0x4c]
_02097C3E:
	ldr r0, [r5, #0x10]
	ldr r1, _02097C4C ; =sub_02097C50
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097C4C: .word sub_02097C50
	thumb_func_end sub_02097BE0

	thumb_func_start sub_02097C50
sub_02097C50: ; 0x02097C50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0x50]
	cmp r1, #3
	bhi _02097CB0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02097C74: ; jump table
	.short _02097C7C - _02097C74 - 2 ; case 0
	.short _02097C8A - _02097C74 - 2 ; case 1
	.short _02097C9A - _02097C74 - 2 ; case 2
	.short _02097CA8 - _02097C74 - 2 ; case 3
_02097C7C:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4, #0x50]
	add r0, r0, #1
	str r0, [r4, #0x50]
	b _02097CB0
_02097C8A:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02097CB4
	ldr r0, [r4, #0x50]
	add r0, r0, #1
	str r0, [r4, #0x50]
	b _02097CB0
_02097C9A:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4, #0x50]
	add r0, r0, #1
	str r0, [r4, #0x50]
	b _02097CB0
_02097CA8:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02097CB0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02097C50

	thumb_func_start sub_02097CB4
sub_02097CB4: ; 0x02097CB4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	str r5, [r2]
	mov r0, #0
	str r0, [r2, #8]
	ldr r0, [r4, #0x10]
	ldr r1, _02097CD4 ; =sub_02097CD8
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02097CD4: .word sub_02097CD8
	thumb_func_end sub_02097CB4

	thumb_func_start sub_02097CD8
sub_02097CD8: ; 0x02097CD8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4]
	cmp r0, #0
	beq _02097CFC
	cmp r0, #1
	beq _02097D14
	cmp r0, #2
	beq _02097D26
	b _02097D36
_02097CFC:
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [r1, #0x48]
	ldr r3, [r1, #0x4c]
	add r0, r5, #0
	bl sub_0203FCB8
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02097D36
_02097D14:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02097D36
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02097D36
_02097D26:
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02097D36:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02097CD8
