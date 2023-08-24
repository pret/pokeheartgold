#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020977CC.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020977CC
sub_020977CC: ; 0x020977CC
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
	ldr r1, _0209780C ; =sub_020978D0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0209780C: .word sub_020978D0
	thumb_func_end sub_020977CC

	thumb_func_start sub_02097810
sub_02097810: ; 0x02097810
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
	bhi _02097852
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0209783C: ; jump table
	.short _02097846 - _0209783C - 2 ; case 0
	.short _02097846 - _0209783C - 2 ; case 1
	.short _0209784C - _0209783C - 2 ; case 2
	.short _0209784C - _0209783C - 2 ; case 3
	.short _0209784C - _0209783C - 2 ; case 4
_02097846:
	mov r0, #0
	strb r0, [r4, #2]
	b _0209785A
_0209784C:
	mov r0, #1
	strb r0, [r4, #2]
	b _0209785A
_02097852:
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #2]
_0209785A:
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #1]
	ldr r0, [r5, #0x10]
	ldr r1, _02097874 ; =sub_02097878
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02097874: .word sub_02097878
	thumb_func_end sub_02097810

	thumb_func_start sub_02097878
sub_02097878: ; 0x02097878
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
	beq _020978A2
	cmp r0, #1
	beq _020978AC
	cmp r0, #2
	beq _020978BA
	b _020978C4
_020978A2:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0203FC68
	b _020978C4
_020978AC:
	add r0, r4, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	beq _020978C4
	mov r0, #0
	pop {r4, r5, r6, pc}
_020978BA:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_020978C4:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02097878

	thumb_func_start sub_020978D0
sub_020978D0: ; 0x020978D0
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
	bhi _020979A2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020978F6: ; jump table
	.short _02097902 - _020978F6 - 2 ; case 0
	.short _02097928 - _020978F6 - 2 ; case 1
	.short _02097954 - _020978F6 - 2 ; case 2
	.short _02097966 - _020978F6 - 2 ; case 3
	.short _02097982 - _020978F6 - 2 ; case 4
	.short _02097998 - _020978F6 - 2 ; case 5
_02097902:
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
	b _020979A2
_02097928:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02097938
	bl GF_SndGetFadeTimer
	cmp r0, #0
	beq _0209793E
_02097938:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0209793E:
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	add r0, r5, #0
	bl sub_0205525C
	mov r0, #2
	strb r0, [r4]
	b _020979A2
_02097954:
	ldrb r1, [r4, #1]
	add r2, r4, #0
	add r0, r6, #0
	add r2, #0x10
	bl sub_02097810
	mov r0, #3
	strb r0, [r4]
	b _020979A2
_02097966:
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
	b _020979A2
_02097982:
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_02055408
	mov r0, #5
	strb r0, [r4]
	b _020979A2
_02097998:
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_020979A2:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020978D0
