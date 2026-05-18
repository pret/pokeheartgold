#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0101.h"
#include "msgdata/msg/msg_0494_T07R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0101_000
	ScrDef scr_seq_T07R0101_001
	ScrDef scr_seq_T07R0101_002
	ScrDef scr_seq_T07R0101_003
	ScrDefEnd

scr_seq_T07R0101_000:
	SimpleNPCMsg msg_0494_T07R0101_00000
	End

scr_seq_T07R0101_001:
	SimpleNPCMsg msg_0494_T07R0101_00001
	End

scr_seq_T07R0101_002:
	SimpleNPCMsg msg_0494_T07R0101_00002
	End

scr_seq_T07R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0494_T07R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
