#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02067A60
sub_02067A60: ; 0x02067A60
	push {r4, lr}
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x24
	bl MIi_CpuClearFast
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02067A60

	thumb_func_start sub_02067A78
sub_02067A78: ; 0x02067A78
	ldr r3, _02067A7C ; =FreeToHeap
	bx r3
	.balign 4, 0
_02067A7C: .word FreeToHeap
	thumb_func_end sub_02067A78

	thumb_func_start sub_02067A80
sub_02067A80: ; 0x02067A80
	add r0, #0xac
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02067A80

	thumb_func_start sub_02067A88
sub_02067A88: ; 0x02067A88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	mov r1, #0
	bl StrengthFlagAction
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	ldr r1, [r1]
	bl FlypointFlagAction
	ldr r0, [r5, #0xc]
	bl Save_Roamers_get
	mov r1, #0
	bl RoamerSave_SetFlute
	add r0, r5, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x7c
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #0
	bne _02067AE0
	ldr r0, [r5, #0xc]
	bl Save_Roamers_get
	ldr r1, [r5, #0x20]
	add r4, r0, #0
	ldr r1, [r1]
	bl UpdatePlayerLocationHistoryIfAnyRoamersActive
	add r0, r4, #0
	bl Save_UpdateRoamersLocation
_02067AE0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02067A88

	thumb_func_start sub_02067AE4
sub_02067AE4: ; 0x02067AE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #1
	beq _02067B84
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ClearFlag972
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	mov r1, #0
	bl StrengthFlagAction
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	ldr r1, [r1]
	bl FlypointFlagAction
	ldr r0, [r5, #0xc]
	bl Save_Roamers_get
	mov r1, #0
	bl RoamerSave_SetFlute
	add r0, r5, #0
	mov r1, #0
	add r0, #0x7e
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x7c
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	bl Save_Roamers_get
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	bl UpdatePlayerLocationHistoryIfAnyRoamersActive
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_IsCave
	cmp r0, #0
	bne _02067B56
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	bl SysFlagFlashClear
	add r0, r4, #0
	bl SysFlagDefogClear
_02067B56:
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl SaveFlyPoints_GetPlayerSub
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _02067B7A
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_IsBikeAllowed
	cmp r0, #0
	bne _02067B7A
	mov r0, #0
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02067B7A:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _02067B84
	mov r0, #0
	str r0, [r4, #4]
_02067B84:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02067AE4

	thumb_func_start sub_02067B88
sub_02067B88: ; 0x02067B88
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_ClearSafariSysFlag
	ldr r0, [r4, #0xc]
	bl Save_Roamers_get
	bl Save_RandomizeRoamersLocation
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02067B88

	thumb_func_start sub_02067BA4
sub_02067BA4: ; 0x02067BA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_ClearSafariSysFlag
	ldr r0, [r4, #0xc]
	bl Save_Roamers_get
	bl Save_RandomizeRoamersLocation
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02067BA4

	thumb_func_start sub_02067BC0
sub_02067BC0: ; 0x02067BC0
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_ClearSafariSysFlag
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02067BC0

	thumb_func_start Fsys_ClearFollowingTrainer
Fsys_ClearFollowingTrainer: ; 0x02067BD0
	push {r4, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	bl ScriptState_ClearHaveFollowerFlag
	add r0, r4, #0
	mov r1, #0
	bl ScriptState_SetFollowerTrainerNum
	pop {r4, pc}
	thumb_func_end Fsys_ClearFollowingTrainer

	thumb_func_start sub_02067BE8
sub_02067BE8: ; 0x02067BE8
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Save_Roamers_get
	bl Save_RandomizeRoamersLocation
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02067BE8

	thumb_func_start sub_02067BF8
sub_02067BF8: ; 0x02067BF8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x1c
	add r4, r2, #0
	add r6, r3, #0
	bl AllocFromHeapAtEnd
	add r3, r0, #0
	mov r2, #0x1c
	mov r1, #0
_02067C0C:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _02067C0C
	str r5, [r0]
	str r4, [r0, #0x10]
	add r2, sp, #0
	ldrh r1, [r2, #0x10]
	strh r1, [r0, #8]
	mov r1, #0x14
	ldrsh r1, [r2, r1]
	strh r1, [r0, #0xa]
	mov r1, #0x18
	ldrsh r1, [r2, r1]
	strh r1, [r0, #0xc]
	strh r6, [r0, #0xe]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02067BF8

	thumb_func_start sub_02067C30
sub_02067C30: ; 0x02067C30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4, #4]
	cmp r0, #6
	bls _02067C4C
	b _02067DE4
_02067C4C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02067C58: ; jump table
	.short _02067C66 - _02067C58 - 2 ; case 0
	.short _02067C78 - _02067C58 - 2 ; case 1
	.short _02067CF2 - _02067C58 - 2 ; case 2
	.short _02067D1E - _02067C58 - 2 ; case 3
	.short _02067D2E - _02067C58 - 2 ; case 4
	.short _02067D44 - _02067C58 - 2 ; case 5
	.short _02067D8C - _02067C58 - 2 ; case 6
_02067C66:
	ldr r1, _02067DEC ; =ov01_02205A60
	add r0, r6, #0
	mov r2, #0
	bl TaskManager_Call
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067C78:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	sub r0, r0, #1
	cmp r0, #1
	bhi _02067C8E
	mov r0, #4
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	b _02067DE4
_02067C8E:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetIdxOfFirstAliveMonInParty_CrashIfNone
	ldrh r1, [r4, #0xe]
	cmp r1, r0
	beq _02067CAE
	ldr r0, [r4]
	bl ov01_02205D68
	mov r0, #4
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	b _02067DE4
_02067CAE:
	add r0, r5, #0
	bl sub_02069FB0
	cmp r0, #0
	beq _02067CE8
	add r0, r5, #0
	mov r1, #2
	bl ov02_02250780
	cmp r0, #0
	beq _02067CD4
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	mov r6, #2
	bl FsysUnkSub108_AddMonMood
	b _02067CD6
_02067CD4:
	mov r6, #1
_02067CD6:
	add r0, r5, #0
	add r1, r6, #0
	bl ov02_022507B4
	mov r0, #1
	strh r0, [r4, #6]
	mov r0, #2
	strh r0, [r4, #4]
	b _02067DE4
_02067CE8:
	mov r0, #4
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	b _02067DE4
_02067CF2:
	ldr r0, [r4, #0x10]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r0, r5, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl PlayCry
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D1E:
	bl IsCryFinished
	cmp r0, #0
	bne _02067DE4
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D2E:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r1, _02067DF0 ; =_020FE7AC
	bl EventObjectMovementMan_Create
	str r0, [r4, #0x18]
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D44:
	ldr r0, [r4, #0x18]
	bl EventObjectMovementMan_IsFinish
	cmp r0, #0
	beq _02067DE4
	ldr r0, [r4, #0x18]
	bl EventObjectMovementMan_Delete
	ldrh r0, [r4, #6]
	cmp r0, #0
	ldr r0, [r4]
	bne _02067D70
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetGender
	add r3, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #0x10]
	mov r1, #1
	bl ov02_02249458
	b _02067D82
_02067D70:
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetGender
	add r3, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #0x10]
	mov r1, #2
	bl ov02_02249458
_02067D82:
	str r0, [r4, #0x14]
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _02067DE4
_02067D8C:
	ldr r0, [r4, #0x14]
	bl ov02_0224953C
	cmp r0, #0
	beq _02067DE4
	ldr r0, [r4, #0x14]
	bl ov02_02249548
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	add r7, r0, #0
	ldrh r0, [r4, #8]
	bl sub_0203BB50
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	bne _02067DB4
	bl GF_AssertFail
_02067DB4:
	add r0, r5, #0
	add r1, sp, #8
	bl GetFlyWarpData
	add r0, r7, #0
	bl FlyPoints_GetSpecialSpawnWarpPtr
	add r1, r0, #0
	add r0, r5, #0
	bl GetSpecialSpawnWarpData
	ldr r0, [sp, #0x14]
	mov r2, #1
	str r0, [sp]
	str r2, [sp, #4]
	ldr r1, [sp, #8]
	ldr r3, [sp, #0x10]
	add r0, r6, #0
	sub r2, r2, #2
	bl sub_02053908
	add r0, r4, #0
	bl FreeToHeap
_02067DE4:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02067DEC: .word ov01_02205A60
_02067DF0: .word _020FE7AC
	thumb_func_end sub_02067C30

	.rodata

	; Movement data
_020FE7AC:
	.short 73, 1
	.short 33, 1
	.short 74, 1
	.short 254, 0
