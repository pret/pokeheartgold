#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0501.h"
#include "msgdata/msg/msg_0587_T25R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R0501_000
	ScrDef scr_seq_T25R0501_001
	ScrDef scr_seq_T25R0501_002
	ScrDef scr_seq_T25R0501_003
	ScrDef scr_seq_T25R0501_004
	ScrDef scr_seq_T25R0501_005
	ScrDef scr_seq_T25R0501_006
	ScrDef scr_seq_T25R0501_007
	ScrDefEnd

scr_seq_T25R0501_006:
	ScrCmd_582 MAP_GOLDENROD, 348, 350
	GoToIfSet FLAG_RESTORED_POWER, _0037
	End

_0037:
	SetVar VAR_UNK_410B, 0
	End

scr_seq_T25R0501_005:
	GoToIfSet FLAG_RESTORED_POWER, _004C
	End

_004C:
	MovePersonFacing obj_T25R0501_policeman, 4, 0, 6, DIR_EAST
	End

scr_seq_T25R0501_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RESTORED_POWER, _0078
	NPCMsg msg_0587_T25R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0078:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0096
	NPCMsg msg_0587_T25R0501_00005
	WaitButton
	CloseMsg
	GoTo _00A5

_0096:
	NPCMsg msg_0587_T25R0501_00007
	CloseMsg
	ApplyMovement obj_T25R0501_policeman, _00AC
	WaitMovement
_00A5:
	ReleaseAll
	End

	.balign 4, 0
_00AC:
	FaceEast
	EndMovement

scr_seq_T25R0501_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _013C
	WaitMovement
	GoToIfSet FLAG_UNK_123, _0118
	NPCMsg msg_0587_T25R0501_00001
	CloseMsg
	SetFlag FLAG_UNK_123
_00D6:
	Wait 50, VAR_SPECIAL_x8004
	HasItem ITEM_PASS, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0123
	NPCMsg msg_0587_T25R0501_00002
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0144
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

_0118:
	NPCMsg msg_0587_T25R0501_00003
	CloseMsg
	GoTo _00D6

_0123:
	NPCMsg msg_0587_T25R0501_00004
	WaitButton
	CloseMsg
	SetVar VAR_UNK_410B, 1
	SetVar VAR_UNK_411E, 1
	ReleaseAll
	End

	.balign 4, 0
_013C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0144:
	WalkNormalSouth 2
	EndMovement

scr_seq_T25R0501_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0587_T25R0501_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R0501_002:
	End

scr_seq_T25R0501_003:
	End

scr_seq_T25R0501_004:
	End
	.balign 4, 0
