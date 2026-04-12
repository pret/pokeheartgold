#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0301.h"
#include "msgdata/msg/msg_0457_T02R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T02R0301_000
	ScrDef scr_seq_T02R0301_001
	ScrDef scr_seq_T02R0301_002
	ScrDef scr_seq_T02R0301_003
	ScrDef scr_seq_T02R0301_004
	ScrDef scr_seq_T02R0301_005
	ScrDef scr_seq_T02R0301_006
	ScrDef scr_seq_T02R0301_007
	ScrDefEnd

scr_seq_T02R0301_000:
	SimpleNPCMsg msg_0457_T02R0301_00000
	End

scr_seq_T02R0301_001:
	SimpleNPCMsg msg_0457_T02R0301_00001
	End

scr_seq_T02R0301_002:
	SimpleNPCMsg msg_0457_T02R0301_00002
	End

scr_seq_T02R0301_003:
	SimpleNPCMsg msg_0457_T02R0301_00003
	End

scr_seq_T02R0301_004:
	SimpleNPCMsg msg_0457_T02R0301_00004
	End

scr_seq_T02R0301_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0457_T02R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0301_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0457_T02R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0301_007:
	SimpleNPCMsg msg_0457_T02R0301_00007
	End
	.balign 4, 0
