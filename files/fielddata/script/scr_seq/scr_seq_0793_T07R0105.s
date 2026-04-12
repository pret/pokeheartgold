#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0105.h"
#include "msgdata/msg/msg_0498_T07R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0105_000
	ScrDef scr_seq_T07R0105_001
	ScrDef scr_seq_T07R0105_002
	ScrDef scr_seq_T07R0105_003
	ScrDef scr_seq_T07R0105_004
	ScrDef scr_seq_T07R0105_005
	ScrDefEnd

scr_seq_T07R0105_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 22
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T07R0105_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 23
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T07R0105_002:
	SimpleNPCMsg msg_0498_T07R0105_00000
	End

scr_seq_T07R0105_003:
	SimpleNPCMsg msg_0498_T07R0105_00001
	End

scr_seq_T07R0105_004:
	SimpleNPCMsg msg_0498_T07R0105_00002
	End

scr_seq_T07R0105_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0498_T07R0105_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
