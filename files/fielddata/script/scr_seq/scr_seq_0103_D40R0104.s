#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D40R0104.h"
#include "msgdata/msg/msg_0124_D40R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D40R0104_000
	ScrDef scr_seq_D40R0104_001
	ScrDef scr_seq_D40R0104_002
	ScrDef scr_seq_D40R0104_003
	ScrDefEnd

scr_seq_D40R0104_003:
	SetVar VAR_TEMP_x4003, 111
	End

scr_seq_D40R0104_001:
	Compare VAR_TEMP_x4003, 111
	GoToIfNe _0032
	GoToIfSet FLAG_UNK_106, _003A
_0032:
	SetVar VAR_TEMP_x4003, 0
	End

_003A:
	MovePersonFacing obj_D40R0104_bozu, 34, 1, 29, DIR_EAST
	SetVar VAR_TEMP_x4003, 0
	End

scr_seq_D40R0104_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_CAUGHT_LUGIA, _010D
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 8
	GoToIfEq _0093
	GoToIfSet FLAG_UNK_106, _00C5
	GoToIfSet FLAG_UNK_094, _00B4
	NPCMsg msg_0124_D40R0104_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0093:
	GoToIfSet FLAG_UNK_106, _00C5
	GoToIfSet FLAG_UNK_094, _00B4
	NPCMsg msg_0124_D40R0104_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B4:
	NPCMsg msg_0124_D40R0104_00002
	CloseMsg
	ShowLegendaryWing 1
	ReleaseAll
	SetFlag FLAG_UNK_106
	End

_00C5:
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 8
	GoToIfNe _00EC
	GoToIfSet FLAG_UNK_109, _00F7
	GoToIfSet FLAG_UNK_105, _0102
_00EC:
	NPCMsg msg_0124_D40R0104_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F7:
	NPCMsg msg_0124_D40R0104_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0102:
	NPCMsg msg_0124_D40R0104_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010D:
	NPCMsg msg_0124_D40R0104_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D40R0104_002:
	Wait 60, VAR_SPECIAL_RESULT
	NPCMsg msg_0124_D40R0104_00003
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0142
	ApplyMovement obj_D40R0104_bozu, _0168
	GoTo _014A

_0142:
	ApplyMovement obj_D40R0104_bozu, _0154
_014A:
	WaitMovement
	Wait 30, VAR_SPECIAL_RESULT
	End

	.balign 4, 0
_0154:
	FaceSouth
	LockDir
	WalkNormalNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_0168:
	FaceEast
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement
	.balign 4, 0
