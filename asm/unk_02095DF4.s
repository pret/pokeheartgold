#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02095DF4.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02095DF4
sub_02095DF4: ; 0x02095DF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x20
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	str r4, [r2, #8]
	strh r6, [r2, #0xe]
	ldr r0, [sp, #0x18]
	strh r7, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [sp, #0x1c]
	ldr r1, _02095E2C ; =sub_02095E30
	str r0, [r2, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r2, #0x18]
	ldr r0, [sp, #0x24]
	str r0, [r2, #0x1c]
	ldr r0, [r5, #0x10]
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02095E2C: .word sub_02095E30
	thumb_func_end sub_02095DF4

	thumb_func_start sub_02095E30
sub_02095E30: ; 0x02095E30
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _02095EF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095E54: ; jump table
	.short _02095E5C - _02095E54 - 2 ; case 0
	.short _02095E9E - _02095E54 - 2 ; case 1
	.short _02095EB4 - _02095E54 - 2 ; case 2
	.short _02095EC4 - _02095E54 - 2 ; case 3
_02095E5C:
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02095E70
	mov r1, #1
	b _02095E72
_02095E70:
	mov r1, #0
_02095E72:
	ldr r0, [r4, #4]
	str r1, [r0, #4]
	add r0, r5, #0
	bl FieldSystem_GetSaveData
	ldr r1, [r4, #4]
	str r0, [r1]
	ldrh r1, [r4, #0xc]
	ldr r0, [r4, #4]
	strb r1, [r0, #0xc]
	ldrh r1, [r4, #0xe]
	ldr r0, [r4, #4]
	strb r1, [r0, #0xf]
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl FieldSystem_LaunchPokeathlonCourseApplication
	bl sub_0203E30C
	mov r0, #1
	str r0, [r4]
	b _02095EF4
_02095E9E:
	add r0, r5, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _02095EF4
	mov r0, #2
	str r0, [r4]
	add r0, r5, #0
	bl sub_020505C0
	b _02095EF4
_02095EB4:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _02095EF4
	mov r0, #3
	str r0, [r4]
	b _02095EF4
_02095EC4:
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0xe]
	ldr r0, [r4, #0x10]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrh r1, [r0, #0xa]
	ldr r0, [r4, #0x14]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrh r1, [r0, #8]
	ldr r0, [r4, #0x18]
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0xd]
	ldr r0, [r4, #0x1c]
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02095EF4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02095E30
