#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0103.h"
#include "msgdata/msg/msg_0496_T07R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0103_000
	ScrDef scr_seq_T07R0103_001
	ScrDef scr_seq_T07R0103_002
	ScrDef scr_seq_T07R0103_003
	ScrDef scr_seq_T07R0103_004
	ScrDef scr_seq_T07R0103_005
	ScrDefEnd

scr_seq_T07R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 20
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T07R0103_001:
	SimpleNPCMsg msg_0496_T07R0103_00000
	End

scr_seq_T07R0103_002:
	SimpleNPCMsg msg_0496_T07R0103_00001
	End

scr_seq_T07R0103_003:
	SimpleNPCMsg msg_0496_T07R0103_00002
	End

scr_seq_T07R0103_004:
	SimpleNPCMsg msg_0496_T07R0103_00003
	End

scr_seq_T07R0103_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0496_T07R0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
