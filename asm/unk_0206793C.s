#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0206793C
sub_0206793C: ; 0x0206793C
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r2, r0, #0
	ldr r1, _02067958 ; =_020FE79C
	add r0, r4, #0
	add r2, #0xc
	bl CallApplicationAsTask
	pop {r4, pc}
	.balign 4, 0
_02067958: .word _020FE79C
	thumb_func_end sub_0206793C

	thumb_func_start Task_FieldTradeAnim
Task_FieldTradeAnim: ; 0x0206795C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #6
	bhi _02067A16
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02067982: ; jump table
	.short _02067990 - _02067982 - 2 ; case 0
	.short _020679B8 - _02067982 - 2 ; case 1
	.short _020679C6 - _02067982 - 2 ; case 2
	.short _020679D4 - _02067982 - 2 ; case 3
	.short _020679E2 - _02067982 - 2 ; case 4
	.short _020679F0 - _02067982 - 2 ; case 5
	.short _020679FE - _02067982 - 2 ; case 6
_02067990:
	ldr r0, [r4, #0x24]
	add r3, r4, #0
	str r0, [sp]
	ldr r0, [r4, #0x28]
	add r3, #0xc
	str r0, [sp, #4]
	ldr r1, [r4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl NPCTrade_CreateTradeAnim
	ldr r1, [r4]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl NPCTrade_ReceiveMonToSlot
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679B8:
	add r0, r5, #0
	bl sub_020552E8
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679C6:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679D4:
	add r0, r5, #0
	bl sub_0206793C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679E2:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679F0:
	add r0, r5, #0
	bl sub_0205532C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02067A16
_020679FE:
	ldr r0, [r4, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #0x28]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02067A16:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end Task_FieldTradeAnim

	thumb_func_start Field_CreateTask_TradeAnim
Field_CreateTask_TradeAnim: ; 0x02067A1C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x2c
	add r6, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x2c
	add r4, r0, #0
	bl memset
	mov r0, #0
	str r0, [r4, #4]
	str r5, [r4]
	ldr r0, [sp]
	str r6, [r4, #8]
	bl AllocMonZeroed
	str r0, [r4, #0x24]
	ldr r0, [sp]
	bl AllocMonZeroed
	str r0, [r4, #0x28]
	ldr r1, _02067A5C ; =Task_FieldTradeAnim
	add r0, r7, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02067A5C: .word Task_FieldTradeAnim
	thumb_func_end Field_CreateTask_TradeAnim

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
	bl ClearFlag973
	add r0, r4, #0
	bl ClearFlag974
_02067B56:
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl sub_0203B9B4
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
	bl sub_0205C700
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
	bl sub_0206226C
	ldrh r0, [r4, #6]
	cmp r0, #0
	ldr r0, [r4]
	bne _02067D70
	ldr r0, [r0, #0x40]
	bl sub_0205C724
	add r3, r0, #0
	ldr r0, [r4]
	ldr r2, [r4, #0x10]
	mov r1, #1
	bl ov02_02249458
	b _02067D82
_02067D70:
	ldr r0, [r0, #0x40]
	bl sub_0205C724
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

	; a0: 0 = use, 1 = check
	; a1: menu idx
	thumb_func_start PartyMenu_GetFieldMoveFunc
PartyMenu_GetFieldMoveFunc: ; 0x02067DF4
	cmp r0, #0
	bne _02067E00
	ldr r0, _02067E08 ; =_020FE7BC
	lsl r1, r1, #3
	ldr r0, [r0, r1]
	bx lr
_02067E00:
	ldr r0, _02067E0C ; =_020FE7BC + 4
	lsl r1, r1, #3
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02067E08: .word _020FE7BC
_02067E0C: .word _020FE7BC + 4
	thumb_func_end PartyMenu_GetFieldMoveFunc

	thumb_func_start sub_02067E10
sub_02067E10: ; 0x02067E10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	str r5, [r4, #4]
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	str r1, [r4]
	mov r1, #0
	strh r1, [r4, #0xc]
	add r1, sp, #8
	bl sub_0203DBF8
	ldr r0, [sp, #8]
	str r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02067E62
	bl MapObject_GetGfxID
	cmp r0, #0x54
	beq _02067E46
	cmp r0, #0x55
	beq _02067E50
	cmp r0, #0x56
	beq _02067E5A
	b _02067E62
_02067E46:
	ldrh r1, [r4, #0xc]
	mov r0, #8
	orr r0, r1
	strh r0, [r4, #0xc]
	b _02067E62
_02067E50:
	ldrh r1, [r4, #0xc]
	mov r0, #0x10
	orr r0, r1
	strh r0, [r4, #0xc]
	b _02067E62
_02067E5A:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	orr r0, r1
	strh r0, [r4, #0xc]
_02067E62:
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	ldr r1, [sp, #4]
	str r2, [sp]
	add r0, r5, #0
	bl sub_02054918
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0205E02C
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl sub_02054918
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	add r1, r7, #0
	add r2, r6, #0
	bl ov01_021F20C0
	cmp r0, #0
	beq _02067EAA
	ldrh r1, [r4, #0xc]
	mov r0, #4
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EAA:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	add r0, r6, #0
	bl ov01_021F25E8
	cmp r0, #0
	beq _02067EC4
	ldrh r1, [r4, #0xc]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EC4:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8DC
	cmp r0, #0
	beq _02067ED8
	ldrh r1, [r4, #0xc]
	mov r0, #0x20
	orr r0, r1
	strh r0, [r4, #0xc]
_02067ED8:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8E8
	cmp r0, #0
	beq _02067EEE
	ldrh r1, [r4, #0xc]
	mov r0, #1
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EEE:
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetWeatherType
	cmp r0, #0xb
	bne _02067F04
	ldrh r1, [r4, #0xc]
	mov r0, #0x80
	orr r0, r1
	strh r0, [r4, #0xc]
_02067F04:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BAF8
	cmp r0, #0
	bne _02067F1A
	add r0, r5, #0
	bl ov01_021E7FA8
	cmp r0, #0
	beq _02067F24
_02067F1A:
	ldrh r1, [r4, #0xc]
	mov r0, #2
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #0xc]
_02067F24:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02067E10

	thumb_func_start PartyMenuEnv_create
PartyMenuEnv_create: ; 0x02067F28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0x10
	bl AllocFromHeap
	ldr r1, _02067F48 ; =0x19740205
	str r1, [r0]
	ldr r1, [r4, #8]
	str r1, [r0, #4]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02067F48: .word 0x19740205
	thumb_func_end PartyMenuEnv_create

	thumb_func_start PartyMenuEnv_delete
PartyMenuEnv_delete: ; 0x02067F4C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _02067F64 ; =0x19740205
	cmp r1, r0
	beq _02067F5C
	bl GF_AssertFail
_02067F5C:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_02067F64: .word 0x19740205
	thumb_func_end PartyMenuEnv_delete

	thumb_func_start FieldMoveMenuCheck_Cut
FieldMoveMenuCheck_Cut: ; 0x02067F68
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02067F7A
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02067F7A:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #1
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02067F8E
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02067F8E:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	tst r1, r0
	beq _02067F98
	mov r0, #PARTY_MENU_RESPONSE_OK
	; else: PARTY_MENU_RESPONSE_NOT_HERE
_02067F98:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Cut

	thumb_func_start FieldMoveMenuUse_Cut
FieldMoveMenuUse_Cut: ; 0x02067F9C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02067FCC ; =sub_02067FD0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02067FCC: .word sub_02067FD0
	thumb_func_end FieldMoveMenuUse_Cut

	thumb_func_start sub_02067FD0
sub_02067FD0: ; 0x02067FD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068008 ; =std_menu_cut
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068008: .word std_menu_cut
	thumb_func_end sub_02067FD0

	thumb_func_start FieldMoveMenuCheck_Fly
FieldMoveMenuCheck_Fly: ; 0x0206800C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206801E
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206801E:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #4
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068032
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068032:
	ldr r0, [r4]
	bl MapHeader_IsFlyAllowed
	cmp r0, #0
	bne _02068040
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068040:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068054
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068054:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag969
	cmp r0, #1
	bne _02068068
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_02068068:
	; static inline
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #1
	beq _02068088
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _0206808C
_02068088:
	mov r0, #1
	b _0206808E
_0206808C:
	mov r0, #0
_0206808E:
	cmp r0, #1
	bne _02068096
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068096:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Fly

	thumb_func_start FieldMoveMenuUse_Fly
FieldMoveMenuUse_Fly: ; 0x0206809C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r6, #0
	mov r1, #0
	bl TownMap_new
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020680DC ; =sub_0203D758
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r4, r5, r6, pc}
	nop
_020680DC: .word sub_0203D758
	thumb_func_end FieldMoveMenuUse_Fly

	thumb_func_start FieldMoveMenuCheck_Surf
FieldMoveMenuCheck_Surf: ; 0x020680E0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020680F2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020680F2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068106
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068106:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x40]
	bl sub_0205C700
	cmp r0, #2
	bne _02068116
	mov r0, #PARTY_MENU_RESPONSE_ALREADY_SURFING
	pop {r4, pc}
_02068116:
	ldrh r1, [r4, #0xc]
	mov r0, #4
	tst r0, r1
	bne _02068122
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068122:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068136
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068136:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag969
	cmp r0, #1
	bne _0206814A
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_0206814A:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Surf

	thumb_func_start FieldMoveMenuUse_Surf
FieldMoveMenuUse_Surf: ; 0x02068150
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068180 ; =sub_02068184
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068180: .word sub_02068184
	thumb_func_end FieldMoveMenuUse_Surf

	thumb_func_start sub_02068184
sub_02068184: ; 0x02068184
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _020681BC ; =std_menu_surf
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020681BC: .word std_menu_surf
	thumb_func_end sub_02068184

	thumb_func_start FieldMoveMenuCheck_Strength
FieldMoveMenuCheck_Strength: ; 0x020681C0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020681D2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020681D2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _020681E6
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_020681E6:
	ldr r0, [r4]
	cmp r0, #0xee
	bne _020681F0
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020681F0:
	ldrh r1, [r4, #0xc]
	mov r0, #8
	tst r0, r1
	beq _020681FC
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020681FC:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	thumb_func_end FieldMoveMenuCheck_Strength

	thumb_func_start FieldMoveMenuUse_Strength
FieldMoveMenuUse_Strength: ; 0x02068200
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068230 ; =sub_02068234
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068230: .word sub_02068234
	thumb_func_end FieldMoveMenuUse_Strength

	thumb_func_start sub_02068234
sub_02068234: ; 0x02068234
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _0206826C ; =std_menu_strength
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0206826C: .word std_menu_strength
	thumb_func_end sub_02068234

	thumb_func_start FieldMoveMenuCheck_RockSmash
FieldMoveMenuCheck_RockSmash: ; 0x02068270
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068282
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068282:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068296
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068296:
	ldrh r1, [r4, #0xc]
	mov r0, #0x10
	tst r0, r1
	beq _020682A2
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020682A2:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_RockSmash

	thumb_func_start FieldMoveMenuUse_RockSmash
FieldMoveMenuUse_RockSmash: ; 0x020682A8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020682D8 ; =sub_020682DC
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020682D8: .word sub_020682DC
	thumb_func_end FieldMoveMenuUse_RockSmash

	thumb_func_start sub_020682DC
sub_020682DC: ; 0x020682DC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068314 ; =std_menu_rock_smash
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068314: .word std_menu_rock_smash
	thumb_func_end sub_020682DC

	thumb_func_start FieldMoveMenuCheck_Waterfall
FieldMoveMenuCheck_Waterfall: ; 0x02068318
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206832A
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206832A:
	ldr r0, [r1, #0x40]
	bl sub_0205C700
	cmp r0, #2
	beq _02068338
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068338:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #7
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _0206834E
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_0206834E:
	ldrh r1, [r4, #0xc]
	mov r0, #0x20
	tst r0, r1
	beq _0206835A
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_0206835A:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Waterfall

	thumb_func_start FieldMoveMenuUse_Waterfall
FieldMoveMenuUse_Waterfall: ; 0x02068360
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068390 ; =sub_02068394
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068390: .word sub_02068394
	thumb_func_end FieldMoveMenuUse_Waterfall

	thumb_func_start sub_02068394
sub_02068394: ; 0x02068394
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _020683CC ; =std_menu_waterfall
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020683CC: .word std_menu_waterfall
	thumb_func_end sub_02068394

	thumb_func_start FieldMoveMenuCheck_RockClimb
FieldMoveMenuCheck_RockClimb: ; 0x020683D0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020683E2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020683E2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xf
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _020683F6
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_020683F6:
	ldrh r1, [r4, #0xc]
	mov r0, #0x40
	tst r0, r1
	bne _02068402
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068402:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068416
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068416:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag969
	cmp r0, #1
	bne _0206842A
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_0206842A:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_RockClimb

	thumb_func_start FieldMoveMenuUse_RockClimb
FieldMoveMenuUse_RockClimb: ; 0x02068430
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068460 ; =sub_02068464
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068460: .word sub_02068464
	thumb_func_end FieldMoveMenuUse_RockClimb

	thumb_func_start sub_02068464
sub_02068464: ; 0x02068464
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _0206849C ; =std_menu_rock_climb
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0206849C: .word std_menu_rock_climb
	thumb_func_end sub_02068464

	thumb_func_start FieldMoveMenuCheck_Flash
FieldMoveMenuCheck_Flash: ; 0x020684A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #0x70]
	sub r1, r1, #2
	cmp r1, #1
	bhi _020684B2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020684B2:
	bl CheckUseFlashInAlphChamber
	cmp r0, #0
	beq _020684BE
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020684BE:
	ldrh r1, [r4, #0xc]
	mov r0, #0x80
	tst r0, r1
	beq _020684CA
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020684CA:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Flash

	thumb_func_start FieldMoveMenuUse_Flash
FieldMoveMenuUse_Flash: ; 0x020684D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068500 ; =sub_02068504
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068500: .word sub_02068504
	thumb_func_end FieldMoveMenuUse_Flash

	thumb_func_start sub_02068504
sub_02068504: ; 0x02068504
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	bl CheckUseFlashInAlphChamber
	cmp r0, #0
	beq _0206852C
	add r0, r5, #0
	mov r1, #_EV_scr_seq_D24R0204_003
	mov r2, #0
	bl StartScriptFromMenu
	b _02068536
_0206852C:
	ldr r1, _02068550 ; =std_menu_flash
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
_02068536:
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068550: .word std_menu_flash
	thumb_func_end sub_02068504

	thumb_func_start FieldMoveMenuCheck_Teleport
FieldMoveMenuCheck_Teleport: ; 0x02068554
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068566
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068566:
	ldr r0, [r4]
	bl MapHeader_IsOutdoors
	cmp r0, #0
	bne _02068574
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068574:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068588
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068588:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag969
	cmp r0, #1
	bne _0206859C
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_0206859C:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #1
	beq _020685BC
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _020685C0
_020685BC:
	mov r0, #1
	b _020685C2
_020685C0:
	mov r0, #0
_020685C2:
	cmp r0, #1
	bne _020685CA
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020685CA:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Teleport

	thumb_func_start FieldMoveMenuUse_Teleport
FieldMoveMenuUse_Teleport: ; 0x020685D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	ldrh r1, [r5, #4]
	ldr r2, [r6, #0xc]
	mov r0, #0xb
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r0, #0xd5
	ldr r1, _0206861C ; =sub_02068620
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_0206861C: .word sub_02068620
	thumb_func_end FieldMoveMenuUse_Teleport

	thumb_func_start sub_02068620
sub_02068620: ; 0x02068620
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r2, [r4, #4]
	ldr r1, [r4]
	ldr r2, [r2]
	add r0, r6, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #4
	bl ov02_0224C500
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r1, _02068660 ; =ov02_0224C558
	add r0, r5, #0
	add r2, r6, #0
	bl TaskManager_Jump
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068660: .word ov02_0224C558
	thumb_func_end sub_02068620

	thumb_func_start FieldMoveMenuCheck_Dig
FieldMoveMenuCheck_Dig: ; 0x02068664
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068676
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068676:
	ldr r0, [r4]
	bl MapHeader_IsCave
	cmp r0, #1
	bne _0206868A
	ldr r0, [r4]
	bl MapHeader_IsEscapeRopeAllowed
	cmp r0, #1
	beq _0206868E
_0206868A:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206868E:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _020686A2
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_020686A2:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag969
	cmp r0, #1
	bne _020686B6
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_020686B6:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Dig

	thumb_func_start FieldMoveMenuUse_Dig
FieldMoveMenuUse_Dig: ; 0x020686BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	ldrh r1, [r5, #4]
	ldr r2, [r6, #0xc]
	mov r0, #0xb
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r0, #0xd5
	ldr r1, _02068708 ; =sub_0206870C
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_02068708: .word sub_0206870C
	thumb_func_end FieldMoveMenuUse_Dig

	thumb_func_start sub_0206870C
sub_0206870C: ; 0x0206870C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r2, [r4, #4]
	ldr r1, [r4]
	ldr r2, [r2]
	add r0, r6, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xb
	bl ov02_0224C368
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r1, _0206874C ; =ov02_0224C3AC
	add r0, r5, #0
	add r2, r6, #0
	bl TaskManager_Jump
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0206874C: .word ov02_0224C3AC
	thumb_func_end sub_0206870C

	thumb_func_start FieldMoveMenuCheck_SweetScent
FieldMoveMenuCheck_SweetScent: ; 0x02068750
	push {r3, lr}
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068760
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r3, pc}
_02068760:
	ldr r0, [r1, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _02068772
	mov r0, #1
	b _02068774
_02068772:
	mov r0, #0
_02068774:
	cmp r0, #1
	bne _0206877C
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r3, pc}
_0206877C:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r3, pc}
	thumb_func_end FieldMoveMenuCheck_SweetScent

	thumb_func_start FieldMoveMenuUse_SweetScent
FieldMoveMenuUse_SweetScent: ; 0x02068780
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r7, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	ldrh r1, [r5, #4]
	add r4, r0, #0
	ldr r2, [r7, #0xc]
	lsl r1, r1, #0x18
	mov r0, #0xb
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020687CC ; =ov01_021FCE98
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020687CC: .word ov01_021FCE98
	thumb_func_end FieldMoveMenuUse_SweetScent

	thumb_func_start FieldMoveMenuCheck_Chatter
FieldMoveMenuCheck_Chatter: ; 0x020687D0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020687DE
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	bx lr
_020687DE:
	mov r0, #PARTY_MENU_RESPONSE_OK
	bx lr
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Chatter

	thumb_func_start FieldMoveMenuUse_Chatter
FieldMoveMenuUse_Chatter: ; 0x020687E4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _0206881C ; =sub_02068820
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206881C: .word sub_02068820
	thumb_func_end FieldMoveMenuUse_Chatter

	thumb_func_start sub_02068820
sub_02068820: ; 0x02068820
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068858 ; =std_menu_chatter
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068858: .word std_menu_chatter
	thumb_func_end sub_02068820

	thumb_func_start FieldMoveMenuCheck_Whirlpool
FieldMoveMenuCheck_Whirlpool: ; 0x0206885C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206886E
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206886E:
	ldr r0, [r1, #0x40]
	bl sub_0205C700
	cmp r0, #2
	beq _0206887C
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206887C:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #6
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068892
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068892:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r1
	beq _020688A0
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020688A0:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	thumb_func_end FieldMoveMenuCheck_Whirlpool

	thumb_func_start FieldMoveMenuUse_Whirlpool
FieldMoveMenuUse_Whirlpool: ; 0x020688A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020688D4 ; =sub_020688D8
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020688D4: .word sub_020688D8
	thumb_func_end FieldMoveMenuUse_Whirlpool

	thumb_func_start sub_020688D8
sub_020688D8: ; 0x020688D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068910 ; =std_menu_whirlpool
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068910: .word std_menu_whirlpool
	thumb_func_end sub_020688D8

	thumb_func_start FieldMoveMenuCheck_Headbutt
FieldMoveMenuCheck_Headbutt: ; 0x02068914
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x70]
	sub r1, r1, #2
	cmp r1, #1
	bhi _02068922
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	bx lr
_02068922:
	ldrh r1, [r0, #0xc]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02068930
	mov r0, #PARTY_MENU_RESPONSE_OK
	bx lr
_02068930:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	bx lr
	thumb_func_end FieldMoveMenuCheck_Headbutt

	thumb_func_start FieldMoveMenuUse_Headbutt
FieldMoveMenuUse_Headbutt: ; 0x02068934
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068964 ; =sub_02068968
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068964: .word sub_02068968
	thumb_func_end FieldMoveMenuUse_Headbutt

	thumb_func_start sub_02068968
sub_02068968: ; 0x02068968
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _020689A0 ; =std_menu_headbutt
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020689A0: .word std_menu_headbutt
	thumb_func_end sub_02068968

	thumb_func_start sub_020689A4
sub_020689A4: ; 0x020689A4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r2, #0
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020689A4

	thumb_func_start sub_020689C8
sub_020689C8: ; 0x020689C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_02068C08
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02068C38
	str r0, [r4, #0xc]
	str r6, [r4]
	str r5, [r4, #8]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020689C8

	thumb_func_start sub_020689E8
sub_020689E8: ; 0x020689E8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068C5C
	add r0, r4, #0
	bl sub_02068C2C
	pop {r4, pc}
	thumb_func_end sub_020689E8

	thumb_func_start sub_020689F8
sub_020689F8: ; 0x020689F8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068B80
	add r0, r4, #0
	bl sub_020689E8
	pop {r4, pc}
	thumb_func_end sub_020689F8

	thumb_func_start sub_02068A08
sub_02068A08: ; 0x02068A08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	add r7, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r4, #0
	bl sub_02068CC4
	add r6, r0, #0
	ldr r0, [sp]
	bl sub_02068CC8
	add r5, r0, #0
_02068A24:
	add r0, r5, #0
	bl sub_02068CCC
	cmp r0, #0
	beq _02068A36
	add r4, r4, #1
	add r5, #0xc8
	cmp r4, r6
	blt _02068A24
_02068A36:
	cmp r4, r6
	blt _02068A40
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068A40:
	add r0, r5, #0
	bl sub_02068CD8
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl sub_02068D8C
	ldr r1, [sp, #0x30]
	add r0, r5, #0
	bl sub_02068D94
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_02068DA4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02068A6E
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl sub_02068DA8
	b _02068A7E
_02068A6E:
	add r1, sp, #0xc
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	bl sub_02068DA8
_02068A7E:
	ldr r1, [r7]
	add r0, r5, #0
	bl sub_02068D78
	ldr r1, [r7, #4]
	add r0, r5, #0
	bl sub_02068CF4
	ldr r1, [r7, #8]
	add r0, r5, #0
	bl sub_02068D48
	ldr r1, [r7, #0xc]
	add r0, r5, #0
	bl sub_02068D10
	ldr r1, [r7, #0x10]
	add r0, r5, #0
	bl sub_02068D2C
	ldr r1, [r7, #0x14]
	add r0, r5, #0
	bl sub_02068D64
	ldr r1, [r7, #0x18]
	add r0, r5, #0
	bl sub_02068D6C
	ldr r1, [sp, #0x34]
	add r0, r5, #0
	bl sub_02068BDC
	add r4, r0, #0
	bne _02068ACE
	add r0, r5, #0
	bl sub_02068C6C
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068ACE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02068D9C
	add r0, r5, #0
	bl sub_02068CFC
	cmp r0, #0
	bne _02068AF2
	add r0, r4, #0
	bl sub_0200E390
	add r0, r5, #0
	bl sub_02068C6C
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068AF2:
	add r0, r5, #0
	mov r1, #2
	bl sub_02068CE4
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02068A08

	thumb_func_start sub_02068B0C
sub_02068B0C: ; 0x02068B0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r6, r0, #0
	add r4, sp, #8
	ldmia r5!, {r0, r1}
	add r7, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	add r1, r7, #0
	str r0, [r4]
	ldr r0, _02068B40 ; =sub_02068DD8
	str r0, [sp, #0x1c]
	ldr r0, _02068B44 ; =sub_02068DDC
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_02068A08
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02068B40: .word sub_02068DD8
_02068B44: .word sub_02068DDC
	thumb_func_end sub_02068B0C

	thumb_func_start sub_02068B48
sub_02068B48: ; 0x02068B48
	push {r4, lr}
	add r4, r0, #0
	bne _02068B52
	bl GF_AssertFail
_02068B52:
	add r0, r4, #0
	bl sub_02068CCC
	cmp r0, #0
	beq _02068B7E
	add r0, r4, #0
	bl sub_02068D50
	ldr r1, [r4, #0x14]
	ldr r0, [r1, #4]
	sub r0, r0, #1
	str r0, [r1, #4]
	add r0, r4, #0
	bl sub_02068DA0
	cmp r0, #0
	beq _02068B78
	bl sub_0200E390
_02068B78:
	add r0, r4, #0
	bl sub_02068C6C
_02068B7E:
	pop {r4, pc}
	thumb_func_end sub_02068B48

	thumb_func_start sub_02068B80
sub_02068B80: ; 0x02068B80
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02068CC4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02068CC8
	add r5, r0, #0
_02068B92:
	add r0, r5, #0
	bl sub_02068CCC
	cmp r0, #1
	bne _02068BA2
	add r0, r5, #0
	bl sub_02068B48
_02068BA2:
	add r5, #0xc8
	sub r4, r4, #1
	bne _02068B92
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02068B80

	thumb_func_start sub_02068BAC
sub_02068BAC: ; 0x02068BAC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02068CC4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02068CC8
	add r5, r0, #0
	mov r6, #3
_02068BC0:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02068CEC
	cmp r0, #3
	bne _02068BD2
	add r0, r5, #0
	bl sub_02068D34
_02068BD2:
	add r5, #0xc8
	sub r4, r4, #1
	bne _02068BC0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02068BAC

	thumb_func_start sub_02068BDC
sub_02068BDC: ; 0x02068BDC
	push {r4, lr}
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, _02068BF8 ; =sub_02068BFC
	add r1, r3, #0
	bl sub_0200E320
	add r4, r0, #0
	bne _02068BF2
	bl GF_AssertFail
_02068BF2:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02068BF8: .word sub_02068BFC
	thumb_func_end sub_02068BDC

	thumb_func_start sub_02068BFC
sub_02068BFC: ; 0x02068BFC
	ldr r3, _02068C04 ; =sub_02068D18
	add r0, r1, #0
	bx r3
	nop
_02068C04: .word sub_02068D18
	thumb_func_end sub_02068BFC

	thumb_func_start sub_02068C08
sub_02068C08: ; 0x02068C08
	push {r4, lr}
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	bne _02068C18
	bl GF_AssertFail
_02068C18:
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02068C1E:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02068C1E
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068C08

	thumb_func_start sub_02068C2C
sub_02068C2C: ; 0x02068C2C
	ldr r3, _02068C34 ; =FreeToHeapExplicit
	add r1, r0, #0
	ldr r0, [r1, #8]
	bx r3
	.balign 4, 0
_02068C34: .word FreeToHeapExplicit
	thumb_func_end sub_02068C2C

	thumb_func_start sub_02068C38
sub_02068C38: ; 0x02068C38
	push {r3, r4, r5, lr}
	mov r2, #0xc8
	add r5, r1, #0
	mul r5, r2
	add r1, r5, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02068C4E
	bl GF_AssertFail
_02068C4E:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02068C38

	thumb_func_start sub_02068C5C
sub_02068C5C: ; 0x02068C5C
	ldr r3, _02068C68 ; =FreeToHeapExplicit
	add r1, r0, #0
	ldr r0, [r1, #8]
	ldr r1, [r1, #0xc]
	bx r3
	nop
_02068C68: .word FreeToHeapExplicit
	thumb_func_end sub_02068C5C

	thumb_func_start sub_02068C6C
sub_02068C6C: ; 0x02068C6C
	push {r4, lr}
	mov r1, #0
	mov r2, #0xc8
	add r4, r0, #0
	bl memset
	ldr r1, _02068CAC ; =sub_02068DC8
	add r0, r4, #0
	bl sub_02068CF4
	ldr r1, _02068CB0 ; =sub_02068DD4
	add r0, r4, #0
	bl sub_02068D48
	ldr r1, _02068CB4 ; =sub_02068DCC
	add r0, r4, #0
	bl sub_02068D10
	ldr r1, _02068CB8 ; =sub_02068DD0
	add r0, r4, #0
	bl sub_02068D2C
	ldr r1, _02068CBC ; =sub_02068DD8
	add r0, r4, #0
	bl sub_02068D64
	ldr r1, _02068CC0 ; =sub_02068DDC
	add r0, r4, #0
	bl sub_02068D6C
	pop {r4, pc}
	nop
_02068CAC: .word sub_02068DC8
_02068CB0: .word sub_02068DD4
_02068CB4: .word sub_02068DCC
_02068CB8: .word sub_02068DD0
_02068CBC: .word sub_02068DD8
_02068CC0: .word sub_02068DDC
	thumb_func_end sub_02068C6C

	thumb_func_start sub_02068CC4
sub_02068CC4: ; 0x02068CC4
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_02068CC4

	thumb_func_start sub_02068CC8
sub_02068CC8: ; 0x02068CC8
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068CC8

	thumb_func_start sub_02068CCC
sub_02068CCC: ; 0x02068CCC
	ldr r1, [r0]
	mov r0, #1
	tst r1, r0
	bne _02068CD6
	mov r0, #0
_02068CD6:
	bx lr
	thumb_func_end sub_02068CCC

	thumb_func_start sub_02068CD8
sub_02068CD8: ; 0x02068CD8
	ldr r2, [r0]
	mov r1, #1
	orr r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CD8

	thumb_func_start sub_02068CE4
sub_02068CE4: ; 0x02068CE4
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end sub_02068CE4

	thumb_func_start sub_02068CEC
sub_02068CEC: ; 0x02068CEC
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CEC

	thumb_func_start sub_02068CF4
sub_02068CF4: ; 0x02068CF4
	add r0, #0xb0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CF4

	thumb_func_start sub_02068CFC
sub_02068CFC: ; 0x02068CFC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb0
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068CFC

	thumb_func_start sub_02068D10
sub_02068D10: ; 0x02068D10
	add r0, #0xb4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D10

	thumb_func_start sub_02068D18
sub_02068D18: ; 0x02068D18
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb4
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D18

	thumb_func_start sub_02068D2C
sub_02068D2C: ; 0x02068D2C
	add r0, #0xb8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D2C

	thumb_func_start sub_02068D34
sub_02068D34: ; 0x02068D34
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb8
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D34

	thumb_func_start sub_02068D48
sub_02068D48: ; 0x02068D48
	add r0, #0xbc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D48

	thumb_func_start sub_02068D50
sub_02068D50: ; 0x02068D50
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xbc
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D50

	thumb_func_start sub_02068D64
sub_02068D64: ; 0x02068D64
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D64

	thumb_func_start sub_02068D6C
sub_02068D6C: ; 0x02068D6C
	add r0, #0xc4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D6C

	thumb_func_start sub_02068D74
sub_02068D74: ; 0x02068D74
	add r0, #0x30
	bx lr
	thumb_func_end sub_02068D74

	thumb_func_start sub_02068D78
sub_02068D78: ; 0x02068D78
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D74
	mov r1, #0
	add r2, r4, #0
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068D78

	thumb_func_start sub_02068D8C
sub_02068D8C: ; 0x02068D8C
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_02068D8C

	thumb_func_start sub_02068D90
sub_02068D90: ; 0x02068D90
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_02068D90

	thumb_func_start sub_02068D94
sub_02068D94: ; 0x02068D94
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068D94

	thumb_func_start sub_02068D98
sub_02068D98: ; 0x02068D98
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068D98

	thumb_func_start sub_02068D9C
sub_02068D9C: ; 0x02068D9C
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end sub_02068D9C

	thumb_func_start sub_02068DA0
sub_02068DA0: ; 0x02068DA0
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02068DA0

	thumb_func_start sub_02068DA4
sub_02068DA4: ; 0x02068DA4
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_02068DA4

	thumb_func_start sub_02068DA8
sub_02068DA8: ; 0x02068DA8
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_02068DA8

	thumb_func_start sub_02068DB8
sub_02068DB8: ; 0x02068DB8
	add r2, r0, #0
	add r2, #0x24
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_02068DB8

	thumb_func_start sub_02068DC8
sub_02068DC8: ; 0x02068DC8
	mov r0, #1
	bx lr
	thumb_func_end sub_02068DC8

	thumb_func_start sub_02068DCC
sub_02068DCC: ; 0x02068DCC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DCC

	thumb_func_start sub_02068DD0
sub_02068DD0: ; 0x02068DD0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD0

	thumb_func_start sub_02068DD4
sub_02068DD4: ; 0x02068DD4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD4

	thumb_func_start sub_02068DD8
sub_02068DD8: ; 0x02068DD8
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD8

	thumb_func_start sub_02068DDC
sub_02068DDC: ; 0x02068DDC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DDC

	.rodata

	.balign 4, 0
_020FE79C:
	.word ov71_02246960, ov71_02246BB8, ov71_02246B58, FS_OVERLAY_ID(OVY_71)
	; Movement data
_020FE7AC:
	.short 73, 1
	.short 33, 1
	.short 74, 1
	.short 254, 0
_020FE7BC:
	.word FieldMoveMenuUse_Cut, FieldMoveMenuCheck_Cut
	.word FieldMoveMenuUse_Fly, FieldMoveMenuCheck_Fly
	.word FieldMoveMenuUse_Surf, FieldMoveMenuCheck_Surf
	.word FieldMoveMenuUse_Strength, FieldMoveMenuCheck_Strength
	.word FieldMoveMenuUse_RockSmash, FieldMoveMenuCheck_RockSmash
	.word FieldMoveMenuUse_Waterfall, FieldMoveMenuCheck_Waterfall
	.word FieldMoveMenuUse_RockClimb, FieldMoveMenuCheck_RockClimb
	.word FieldMoveMenuUse_Flash, FieldMoveMenuCheck_Flash
	.word FieldMoveMenuUse_Teleport, FieldMoveMenuCheck_Teleport
	.word FieldMoveMenuUse_Dig, FieldMoveMenuCheck_Dig
	.word FieldMoveMenuUse_SweetScent, FieldMoveMenuCheck_SweetScent
	.word FieldMoveMenuUse_Chatter, FieldMoveMenuCheck_Chatter
	.word FieldMoveMenuUse_Whirlpool, FieldMoveMenuCheck_Whirlpool
	.word FieldMoveMenuUse_Headbutt, FieldMoveMenuCheck_Headbutt
