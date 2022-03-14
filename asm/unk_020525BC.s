#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

	.text

	.public sub_020525BC
	.public _020FC51C
	.public _draw_scurry_message_screen

	thumb_func_start Task_BlackOut
Task_BlackOut: ; 0x02052858
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _0205296E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205287E: ; jump table
	.short _0205288C - _0205287E - 2 ; case 0
	.short _020528CE - _0205287E - 2 ; case 1
	.short _020528DE - _0205287E - 2 ; case 2
	.short _020528F2 - _0205287E - 2 ; case 3
	.short _0205291A - _0205287E - 2 ; case 4
	.short _02052928 - _0205287E - 2 ; case 5
	.short _02052968 - _0205287E - 2 ; case 6
_0205288C:
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	add r7, r0, #0
	bl FlyPoints_GetDeathSpawn
	add r1, sp, #4
	str r0, [sp]
	bl GetDeathWarpData
	add r0, r7, #0
	bl FlyPoints_GetSpecialSpawnWarpPtr
	add r1, r0, #0
	ldr r0, [sp]
	bl GetSpecialSpawnWarpData
	add r0, r6, #0
	add r1, sp, #4
	bl sub_020537A8
	add r0, r5, #0
	bl Fsys_ClearFollowingTrainer
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_020528CE:
	mov r0, #0
	mov r1, #0x14
	bl GF_SndStartFadeOutBGM
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_020528DE:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _0205296E
	bl sub_02054F14
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_020528F2:
	mov r0, #0xf
	mvn r0, r0
	mov r1, #0x37
	mov r2, #1
	bl SetBlendBrightness
	mov r0, #0xf
	mvn r0, r0
	mov r1, #0x3f
	mov r2, #2
	bl SetBlendBrightness
	add r0, r5, #0
	add r1, r6, #0
	bl _draw_scurry_message_screen
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_0205291A:
	add r0, r6, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_02052928:
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl SetBlendBrightness
	bl GetMomSpawnId
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetDeathSpawn
	cmp r7, r0
	bne _02052954
	mov r2, #0
	ldr r1, _02052974 ; =std_whited_out_to_mom
	add r0, r6, #0
	add r3, r2, #0
	bl QueueScript
	b _02052960
_02052954:
	mov r2, #0
	ldr r1, _02052978 ; =std_whited_out_to_pokecenter
	add r0, r6, #0
	add r3, r2, #0
	bl QueueScript
_02052960:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_02052968:
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205296E:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02052974: .word std_whited_out_to_mom
_02052978: .word std_whited_out_to_pokecenter
	thumb_func_end Task_BlackOut

	thumb_func_start FieldTask_CallBlackOut
FieldTask_CallBlackOut: ; 0x0205297C
	ldr r3, _02052984 ; =TaskManager_Call
	ldr r1, _02052988 ; =Task_BlackOut
	mov r2, #0
	bx r3
	.balign 4, 0
_02052984: .word TaskManager_Call
_02052988: .word Task_BlackOut
	thumb_func_end FieldTask_CallBlackOut
