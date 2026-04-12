#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0301.h"
#include "msgdata/msg/msg_0585_T25R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R0301_000
	ScrDef scr_seq_T25R0301_001
	ScrDef scr_seq_T25R0301_002
	ScrDefEnd

scr_seq_T25R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8000
	NPCMsg msg_0585_T25R0301_00000
	MonGetFriendship VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 250
	GoToIfGe _006C
	Compare VAR_SPECIAL_RESULT, 200
	GoToIfGe _0077
	Compare VAR_SPECIAL_RESULT, 150
	GoToIfGe _0082
	Compare VAR_SPECIAL_RESULT, 100
	GoToIfGe _008D
	Compare VAR_SPECIAL_RESULT, 50
	GoToIfGe _0098
	GoTo _00A3
	End

_006C:
	NPCMsg msg_0585_T25R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0077:
	NPCMsg msg_0585_T25R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0082:
	NPCMsg msg_0585_T25R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008D:
	NPCMsg msg_0585_T25R0301_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0098:
	NPCMsg msg_0585_T25R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A3:
	NPCMsg msg_0585_T25R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R0301_001:
	SimpleNPCMsg msg_0585_T25R0301_00007
	End

scr_seq_T25R0301_002:
	SimpleNPCMsg msg_0585_T25R0301_00008
	End
	.balign 4, 0
