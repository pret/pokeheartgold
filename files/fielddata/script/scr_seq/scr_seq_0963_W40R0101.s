#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W40R0101.h"
#include "msgdata/msg/msg_0745_W40R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_W40R0101_000
	ScrDef scr_seq_W40R0101_001
	ScrDef scr_seq_W40R0101_002
	ScrDefEnd

scr_seq_W40R0101_001:
	Compare VAR_UNK_40E5, 1
	GoToIfGe _0036
	GoToIfSet FLAG_GAME_CLEAR, _0028
	End

_0028:
	MovePersonFacing obj_W40R0101_gsmiddleman1, 3, 0, 3, DIR_NORTH
	End

_0036:
	SetVar VAR_UNK_40E5, 2
	End

scr_seq_W40R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	GoToIfSet FLAG_UNK_0FB, _00BE
	GoToIfSet FLAG_GAME_CLEAR, _00B1
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0079
	ApplyMovement obj_W40R0101_gsmiddleman1, _00E4
	GoTo _009C

_0079:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0094
	ApplyMovement obj_W40R0101_gsmiddleman1, _00DC
	GoTo _009C

_0094:
	ApplyMovement obj_W40R0101_gsmiddleman1, _00D4
_009C:
	WaitMovement
	NPCMsg msg_0745_W40R0101_00000
	CloseMsg
	ApplyMovement obj_W40R0101_gsmiddleman1, _00CC
	WaitMovement
	ReleaseAll
	End

_00B1:
	NPCMsg msg_0745_W40R0101_00001
	CloseMsg
	ReleaseAll
	SetFlag FLAG_UNK_0FB
	End

_00BE:
	NPCMsg msg_0745_W40R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_00CC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_00D4:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_00DC:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_00E4:
	WalkOnSpotNormalWest
	EndMovement

scr_seq_W40R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GAME_CLEAR, _0108
	NPCMsg msg_0745_W40R0101_00003
	GoTo _010B

_0108:
	NPCMsg msg_0745_W40R0101_00004
_010B:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
