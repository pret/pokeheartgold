#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0104.h"
#include "msgdata/msg/msg_0258_P01R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0104_000
	ScrDef scr_seq_P01R0104_001
	ScrDef scr_seq_P01R0104_002
	ScrDef scr_seq_P01R0104_003
	ScrDefEnd

scr_seq_P01R0104_003:
	GoToIfSet FLAG_UNK_168, _0021
	SetFlag FLAG_UNK_998
_0021:
	ScrCmd_804 2
	SetFlag FLAG_UNK_168
	SetFlag FLAG_SYS_FLYPOINT_VERMILION
	ScrCmd_582 MAP_VERMILION, 1309, 340
	End

scr_seq_P01R0104_002:
	Compare VAR_BOAT_DIRECTION, 1
	GoToIfEq _0045
	End

_0045:
	MovePersonFacing obj_P01R0104_seaman_2, 24, 0, 19, DIR_WEST
	End

scr_seq_P01R0104_001:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0090
	WaitMovement
	ApplyMovement obj_P01R0104_seaman_2, _0098
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_BOAT_DIRECTION, 0
	ClearFlag FLAG_UNK_092
	ReleaseAll
	End

	.balign 4, 0
_0090:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0098:
	WalkNormalWest
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_P01R0104_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_BOAT_ARRIVED, _0144
	NPCMsg msg_0258_P01R0104_00000
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00EF
	ApplyMovement obj_P01R0104_seaman_2, _0150
	WaitMovement
	ApplyMovement obj_player, _0180
	GoTo _0126

_00EF:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0114
	ApplyMovement obj_P01R0104_seaman_2, _0160
	WaitMovement
	ApplyMovement obj_player, _0190
	GoTo _0126

_0114:
	ApplyMovement obj_P01R0104_seaman_2, _0170
	WaitMovement
	ApplyMovement obj_player, _01A0
_0126:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_KAIDAN2
	ScrCmd_723 1, 0, 307, 24, 19
	ReleaseAll
	End

_0144:
	NPCMsg msg_0258_P01R0104_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0150:
	FaceWest
	WalkNormalWest
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0160:
	FaceEast
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0170:
	FaceEast
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0180:
	WalkNormalWest
	FaceNorth
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0190:
	WalkNormalEast
	FaceNorth
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_01A0:
	WalkNormalNorth 2
	EndMovement
	.balign 4, 0
