#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0207.h"
#include "msgdata/msg/msg_0507_T07R0207.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0207_000
	ScrDefEnd

scr_seq_T07R0207_000:
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
	ApplyMovement obj_player, _0170
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_partner_poke, _017C
	WaitMovement
	GoTo _0062

_0058:
	ApplyMovement obj_player, _0170
	WaitMovement
_0062:
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	Switch VAR_ELEVATOR_LAST_FLOOR
	Case 1, _0088
	Case 3, _0098
	End

_0088:
	BufferDeptStoreFloorNo 0, 2
	Call _00A9
	GoTo _00B3

_0098:
	BufferInt 0, 0
	Call _00A9
	GoTo _00EE

_00A9:
	ElevatorCurFloorBox 20, 1, VAR_ELEVATOR_LAST_FLOOR, VAR_ELEVATOR_LAST_FLOOR
	Return

_00B3:
	NPCMsg msg_0507_T07R0207_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0150
	NPCMsg msg_0507_T07R0207_00003
	CloseMsg
	SetVar VAR_ELEVATOR_LAST_FLOOR, 65535
	SetDynamicWarp MAP_CELADON_CONDOMINIUMS_ROOF, 2, 5, 3, 1
	SetVar VAR_SPECIAL_x8004, 0
	GoTo _0129

_00EE:
	NPCMsg msg_0507_T07R0207_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0150
	NPCMsg msg_0507_T07R0207_00004
	CloseMsg
	SetVar VAR_ELEVATOR_LAST_FLOOR, 65535
	SetDynamicWarp MAP_CELADON_CONDOMINIUMS_2F, 1, 5, 3, 1
	SetVar VAR_SPECIAL_x8004, 1
	GoTo _0129

_0129:
	WaitSE SEQ_SE_DP_SELECT
	ElevatorAnim VAR_SPECIAL_x8004, 2
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	Compare VAR_ELEVATOR_LAST_FLOOR, 1
	GoToIfNe _014D
	NPCMsg msg_0507_T07R0207_00006
	GoTo _0150

_014D:
	NPCMsg msg_0507_T07R0207_00005
_0150:
	SetVar VAR_ELEVATOR_LAST_FLOOR, 65535
	Wait 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0507_T07R0207_00002
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4125, 1
	ReleaseAll
	End

	.balign 4, 0
_0170:
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_017C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
