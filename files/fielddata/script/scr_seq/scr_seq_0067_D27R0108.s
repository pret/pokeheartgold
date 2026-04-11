#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0108.h"
#include "msgdata/msg/msg_0095_D27R0108.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D27R0108_000
	ScrDefEnd

scr_seq_D27R0108_000:
	ScrCmd_609
	LockAll
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0058
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _002A
	End

_002A:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00F4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_partner_poke, _0100
	WaitMovement
	GoTo _0062

_0058:
	ApplyMovement obj_player, _00F4
	WaitMovement
_0062:
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	Switch VAR_ELEVATOR_LAST_FLOOR
	Case 0, _0088
	Case 1, _00A5
	End

_0088:
	NPCMsg msg_0095_D27R0108_00000
	CloseMsg
	SetDynamicWarp MAP_OLIVINE_LIGHTHOUSE_LIGHT_ROOM, 1, 5, 3, 1
	SetVar VAR_SPECIAL_x8004, 0
	GoTo _00C2

_00A5:
	NPCMsg msg_0095_D27R0108_00001
	CloseMsg
	SetDynamicWarp MAP_OLIVINE_LIGHTHOUSE_1F, 1, 5, 3, 1
	SetVar VAR_SPECIAL_x8004, 1
	GoTo _00C2

_00C2:
	WaitSE SEQ_SE_DP_SELECT
	ElevatorAnim VAR_SPECIAL_x8004, 5
	Compare VAR_ELEVATOR_LAST_FLOOR, 0
	GoToIfNe _00E2
	NPCMsg msg_0095_D27R0108_00002
	GoTo _00E5

_00E2:
	NPCMsg msg_0095_D27R0108_00003
_00E5:
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4125, 1
	ReleaseAll
	End

	.balign 4, 0
_00F4:
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0100:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
