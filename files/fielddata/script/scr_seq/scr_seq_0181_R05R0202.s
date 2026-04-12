#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0202.h"
#include "msgdata/msg/msg_0331_R05R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R05R0202_000
	ScrDef scr_seq_R05R0202_001
	ScrDefEnd

scr_seq_R05R0202_001:
	SetVar VAR_TEMP_x4000, 0
	End

scr_seq_R05R0202_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00BE
	GoToIfSet FLAG_UNK_164, _00D8
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _006E
	HasItem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _005F
	NPCMsg msg_0331_R05R0202_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005F:
	NPCMsg msg_0331_R05R0202_00001
	CloseMsg
	ApplyMovement obj_R05R0202_gsmiddleman1, _0100
	WaitMovement
_006E:
	NPCMsg msg_0331_R05R0202_00002
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00E3
	HasSpaceForItem ITEM_TM64, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00F4
	BufferPlayersName 0
	NPCMsg msg_0331_R05R0202_00003
	TakeItem ITEM_RAGECANDYBAR, 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0331_R05R0202_00004
	CloseMsg
	SetVar VAR_SPECIAL_x8004, TM_EXPLOSION
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
_00BE:
	NPCMsg msg_0331_R05R0202_00005
	CloseMsg
	NPCMsg msg_0331_R05R0202_00006
	WaitButton
	CloseMsg
	SetVar VAR_TEMP_x4001, 1
	SetFlag FLAG_UNK_164
	ReleaseAll
	End

_00D8:
	NPCMsg msg_0331_R05R0202_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E3:
	NPCMsg msg_0331_R05R0202_00008
	WaitButton
	CloseMsg
	ReleaseAll
	SetVar VAR_TEMP_x4000, 1
	End

_00F4:
	NPCMsg msg_0331_R05R0202_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0100:
	EmoteExclamationMark
	EndMovement
	.balign 4, 0
