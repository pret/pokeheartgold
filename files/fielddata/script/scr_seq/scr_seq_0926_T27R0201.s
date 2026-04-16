#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0201.h"
#include "msgdata/msg/msg_0616_T27R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T27R0201_000
	ScrDef scr_seq_T27R0201_001
	ScrDef scr_seq_T27R0201_002
	ScrDef scr_seq_T27R0201_003
	ScrDefEnd

scr_seq_T27R0201_003:
	GoToIfSet FLAG_UNK_108, _001F
	End

_001F:
	MovePersonFacing obj_T27R0201_bozu, 16, 0, 8, DIR_WEST
	End

scr_seq_T27R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _00E8
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _00C9
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00D4
	CheckBadge BADGE_FOG, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0096
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _008B
	NPCMsg msg_0616_T27R0201_00000
	GoTo _008E

_008B:
	NPCMsg msg_0616_T27R0201_00001
_008E:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0096:
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _00B0
	NPCMsg msg_0616_T27R0201_00002
	GoTo _00B3

_00B0:
	NPCMsg msg_0616_T27R0201_00003
_00B3:
	CloseMsg
	ApplyMovement obj_T27R0201_bozu, _00F4
	WaitMovement
	SetVar VAR_TEMP_x4002, 1
	ReleaseAll
	End

_00C9:
	NPCMsg msg_0616_T27R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D4:
	ApplyMovement obj_T27R0201_bozu, _0104
	WaitMovement
	SetVar VAR_TEMP_x4002, 1
	ReleaseAll
	End

_00E8:
	NPCMsg msg_0616_T27R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_00F4:
	WalkNormalNorth
	WalkNormalEast
	FaceWest
	EndMovement

	.balign 4, 0
_0104:
	WalkNormalSouth
	WalkNormalEast
	FaceWest
	EndMovement

scr_seq_T27R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _0162
	GoToIfSet FLAG_UNK_103, _0157
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _014C
	NPCMsg msg_0616_T27R0201_00006
	GoTo _014F

_014C:
	NPCMsg msg_0616_T27R0201_00007
_014F:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0157:
	NPCMsg msg_0616_T27R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0162:
	NPCMsg msg_0616_T27R0201_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0201_002:
	SimpleNPCMsg msg_0616_T27R0201_00010
	End
	.balign 4, 0
