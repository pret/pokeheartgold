#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020961D8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020961D8
sub_020961D8: ; 0x020961D8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0x20
	bl MessageFormat_New
	str r0, [r4, #4]
	mov r3, #0x20
	str r3, [sp]
	ldr r2, [r4]
	add r3, #0xec
	ldr r2, [r2, #0xc]
	mov r0, #2
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl Save_Misc_Get
	str r0, [r4, #0x14]
	add r0, r4, #0
	str r6, [r4, #0x20]
	add r0, #8
	mov r1, #4
	bl MailMsg_Init_WithBank
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #8
	bl SaveMisc_GetBattleGreeting
	ldr r0, [r4, #0x10]
	bl sub_02090D40
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r1, _02096244 ; =sub_02096260
	add r0, r7, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02096244: .word sub_02096260
	thumb_func_end sub_020961D8

	thumb_func_start sub_02096248
sub_02096248: ; 0x02096248
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02090D0C
	ldr r0, [r4, #4]
	bl MessageFormat_Delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02096248

	thumb_func_start sub_02096260
sub_02096260: ; 0x02096260
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	cmp r1, #4
	bhi _02096314
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0209627A: ; jump table
	.short _02096284 - _0209627A - 2 ; case 0
	.short _020962A2 - _0209627A - 2 ; case 1
	.short _020962B8 - _0209627A - 2 ; case 2
	.short _020962CE - _0209627A - 2 ; case 3
	.short _0209630C - _0209627A - 2 ; case 4
_02096284:
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #8
	bl sub_02090D20
	ldr r0, [r4, #0x10]
	bl sub_02090D34
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	bl sub_0203EA24
	mov r0, #1
	str r0, [r4, #0x18]
	b _02096314
_020962A2:
	ldr r0, [r4]
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02096314
	ldr r0, [r4]
	bl sub_020505C0
	mov r0, #2
	str r0, [r4, #0x18]
	b _02096314
_020962B8:
	ldr r0, [r4]
	bl sub_020505C8
	cmp r0, #0
	beq _02096314
	mov r0, #1
	bl ov01_021E636C
	mov r0, #3
	str r0, [r4, #0x18]
	b _02096314
_020962CE:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02096314
	ldr r0, [r4, #0x10]
	bl sub_02090D48
	cmp r0, #0
	beq _020962EC
	ldr r0, [r4, #0x20]
	mov r1, #0
	strh r1, [r0]
	mov r0, #4
	str r0, [r4, #0x18]
	b _02096314
_020962EC:
	ldr r0, [r4, #0x20]
	mov r1, #1
	strh r1, [r0]
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #8
	bl sub_02090D60
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #8
	bl SaveMisc_SetBattleGreeting
	mov r0, #4
	str r0, [r4, #0x18]
	b _02096314
_0209630C:
	bl sub_02096248
	mov r0, #1
	pop {r4, pc}
_02096314:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02096260
