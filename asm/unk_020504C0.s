	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Task_new
Task_new: ; 0x020504C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x20
	add r6, r1, #0
	add r1, r0, #0
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	str r6, [r4, #4]
	str r0, [r4, #8]
	str r7, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	mov r0, #0x20
	mov r1, #4
	str r5, [r4, #0x18]
	bl AllocFromHeapAtEnd
	str r0, [r4, #0x1c]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end Task_new

	thumb_func_start FieldSys_CreateTask
FieldSys_CreateTask: ; 0x020504F0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _02050502
	bl GF_AssertFail
_02050502:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl Task_new
	str r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
	thumb_func_end FieldSys_CreateTask

	thumb_func_start NowRunTask
NowRunTask: ; 0x02050510
	push {r4, lr}
	add r4, r0, #0
	str r1, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	str r2, [r4, #0xc]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02050524
	beq _0205052E
_02050524:
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
_0205052E:
	pop {r4, pc}
	thumb_func_end NowRunTask

	thumb_func_start QueueTask
QueueTask: ; 0x02050530
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl Task_new
	str r4, [r0]
	ldr r1, [r4, #0x18]
	str r0, [r1, #0x10]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end QueueTask

	thumb_func_start sub_02050544
sub_02050544: ; 0x02050544
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _02050552
	mov r0, #0
	pop {r3, r4, r5, pc}
_02050552:
	ldr r1, [r0, #4]
	blx r1
	cmp r0, #1
	bne _0205058A
_0205055A:
	ldr r0, [r5, #0x10]
	ldr r4, [r0]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _02050568
	bl FreeToHeap
_02050568:
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0x1c]
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	bl FreeToHeap
	str r4, [r5, #0x10]
	cmp r4, #0
	bne _02050580
	mov r0, #1
	pop {r3, r4, r5, pc}
_02050580:
	ldr r0, [r5, #0x10]
	ldr r1, [r0, #4]
	blx r1
	cmp r0, #1
	beq _0205055A
_0205058A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02050544

	thumb_func_start sub_02050590
sub_02050590: ; 0x02050590
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0205059A
	mov r0, #1
	bx lr
_0205059A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02050590

	thumb_func_start FieldSys_ApplicationIsRunning
FieldSys_ApplicationIsRunning: ; 0x020505A0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203DF7C
	cmp r0, #0
	bne _020505B6
	add r0, r4, #0
	bl sub_0203DFA4
	cmp r0, #0
	beq _020505BA
_020505B6:
	mov r0, #1
	pop {r4, pc}
_020505BA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldSys_ApplicationIsRunning

	thumb_func_start sub_020505C0
sub_020505C0: ; 0x020505C0
	ldr r3, _020505C4 ; =sub_0203DEF0
	bx r3
	.balign 4, 0
_020505C4: .word sub_0203DEF0
	thumb_func_end sub_020505C0

	thumb_func_start sub_020505C8
sub_020505C8: ; 0x020505C8
	push {r3, lr}
	bl sub_0203DF8C
	cmp r0, #0
	beq _020505D6
	mov r0, #1
	pop {r3, pc}
_020505D6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020505C8

	thumb_func_start sub_020505DC
sub_020505DC: ; 0x020505DC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _020505FA
	cmp r0, #1
	beq _0205060C
	b _02050620
_020505FA:
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r0, r5, #0
	bl ScrUnk80_AddOvyMan
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02050620
_0205060C:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02050620
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02050620:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020505DC

	thumb_func_start sub_02050624
sub_02050624: ; 0x02050624
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0x20
	mov r1, #0xc
	add r4, r2, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	str r5, [r2, #4]
	ldr r1, _02050648 ; =sub_020505DC
	add r0, r6, #0
	str r4, [r2, #8]
	bl QueueTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02050648: .word sub_020505DC
	thumb_func_end sub_02050624

	thumb_func_start TaskManager_GetSys
TaskManager_GetSys: ; 0x0205064C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end TaskManager_GetSys

	thumb_func_start TaskManager_GetEnv
TaskManager_GetEnv: ; 0x02050650
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end TaskManager_GetEnv

	thumb_func_start TaskManager_GetData
TaskManager_GetData: ; 0x02050654
	add r0, #8
	bx lr
	thumb_func_end TaskManager_GetData

	thumb_func_start sub_02050658
sub_02050658: ; 0x02050658
	ldr r0, [r0, #0x1c]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02050658
