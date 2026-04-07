#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0952.h"
#include "msgdata/msg/msg_0726.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0952_000
	ScrDef scr_seq_0952_001
	ScrDef scr_seq_0952_002
	ScrDef scr_seq_0952_003
	ScrDef scr_seq_0952_004
	ScrDef scr_seq_0952_005
	ScrDef scr_seq_0952_006
	ScrDef scr_seq_0952_007
	ScrDef scr_seq_0952_008
	ScrDef scr_seq_0952_009
	ScrDef scr_seq_0952_010
	ScrDef scr_seq_0952_011
	ScrDefEnd

scr_seq_0952_000:
	SetFlag FLAG_SYS_FLYPOINT_UNION_CAVE
	SetVar VAR_TEMP_x4000, 0
	SetVar VAR_TEMP_x4001, 653
_0042:
	SetTrainerHouseSprite VAR_TEMP_x4000, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _005F
	SetFlagVar VAR_TEMP_x4001
	GoTo _0063

_005F:
	ClearFlagVar VAR_TEMP_x4001
_0063:
	AddVar VAR_TEMP_x4000, 1
	AddVar VAR_TEMP_x4001, 1
	Compare VAR_TEMP_x4000, 10
	GoToIfLt _0042
	End

scr_seq_0952_001:
	SetVar VAR_TEMP_x4000, 10
	GoTo _0118
	End

scr_seq_0952_002:
	SetVar VAR_TEMP_x4000, 0
	GoTo _0118
	End

scr_seq_0952_003:
	SetVar VAR_TEMP_x4000, 1
	GoTo _0118
	End

scr_seq_0952_004:
	SetVar VAR_TEMP_x4000, 2
	GoTo _0118
	End

scr_seq_0952_005:
	SetVar VAR_TEMP_x4000, 3
	GoTo _0118
	End

scr_seq_0952_006:
	SetVar VAR_TEMP_x4000, 4
	GoTo _0118
	End

scr_seq_0952_007:
	SetVar VAR_TEMP_x4000, 5
	GoTo _0118
	End

scr_seq_0952_008:
	SetVar VAR_TEMP_x4000, 6
	GoTo _0118
	End

scr_seq_0952_009:
	SetVar VAR_TEMP_x4000, 7
	GoTo _0118
	End

scr_seq_0952_010:
	SetVar VAR_TEMP_x4000, 8
	GoTo _0118
	End

scr_seq_0952_011:
	SetVar VAR_TEMP_x4000, 9
	GoTo _0118
	End

_0118:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4001, 2730
	AddVar VAR_TEMP_x4001, VAR_TEMP_x4000
	CheckFlagVar VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0186
	NPCMsg msg_0726_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0186
	ScriptOverlayCmd 4, 0
	ShowTrainerHouseIntroMessage VAR_TEMP_x4000
	WaitABPress
	CloseMsg
	ScriptOverlayCmd 4, 1
	ScrCmd_808 VAR_TEMP_x4000
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _0191
	SetFlagVar VAR_TEMP_x4001
	ReleaseAll
	End

_0186:
	NPCMsg msg_0726_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0191:
	NPCMsg msg_0726_00002
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	CloseMsg
	ScrCmd_555 1
	Return
	.balign 4, 0
