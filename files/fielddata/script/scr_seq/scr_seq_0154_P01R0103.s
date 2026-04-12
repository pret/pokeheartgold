#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0103.h"
#include "msgdata/msg/msg_0257_P01R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0103_000
	ScrDef scr_seq_P01R0103_001
	ScrDef scr_seq_P01R0103_002
	ScrDefEnd

scr_seq_P01R0103_001:
	ScrCmd_445 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 387
	GoToIfEq _0021
	End

_0021:
	SetObjectFacing obj_P01R0103_seaman_2, DIR_SOUTH
	End

scr_seq_P01R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _014D
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfEq _0158
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _006C
	GoTo _00EF

_0066:
	GoTo _00EF

_006C:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0085
	GoTo _0142

_007F:
	GoTo _00EF

_0085:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _009E
	GoTo _0142

_0098:
	GoTo _00EF

_009E:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _00B7
	GoTo _00EF

_00B1:
	GoTo _00EF

_00B7:
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfNe _00D0
	GoTo _0142

_00CA:
	GoTo _00EF

_00D0:
	Compare VAR_SPECIAL_RESULT, 5
	GoToIfNe _00E9
	GoTo _0142

_00E3:
	GoTo _00EF

_00E9:
	GoTo _0142

_00EF:
	NPCMsg msg_0257_P01R0103_00000
	CloseMsg
	ApplyMovement obj_P01R0103_seaman_2, _0190
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _01B0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_TEMP_x4002, 1
	SetVar VAR_BOAT_DIRECTION, 2
	SetVar VAR_UNK_40DC, 0
	ClearFlag FLAG_BOAT_ARRIVED
	SetFlag FLAG_UNK_22A
	ClearFlag FLAG_UNK_22C
	SetFlag FLAG_UNK_22B
	ReleaseAll
	End

_0142:
	NPCMsg msg_0257_P01R0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014D:
	NPCMsg msg_0257_P01R0103_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0158:
	ApplyMovement obj_P01R0103_seaman_2, _01B8
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _01D8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_P01R0103_seaman_2, _01E4
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_0190:
	LockDir
	WalkNormalSouth
	UnlockDir
	FaceWest 2
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_01B0:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_01B8:
	LockDir
	WalkNormalNorth
	UnlockDir
	FaceWest 2
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_01D8:
	Delay8
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_01E4:
	WalkNormalWest
	FaceSouth 2
	WalkNormalSouth
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_P01R0103_002:
	SimpleNPCMsg msg_0257_P01R0103_00003
	End
	.balign 4, 0
