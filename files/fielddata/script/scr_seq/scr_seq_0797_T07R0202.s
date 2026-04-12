#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0202.h"
#include "msgdata/msg/msg_0502_T07R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0202_000
	ScrDef scr_seq_T07R0202_001
	ScrDef scr_seq_T07R0202_002
	ScrDefEnd

scr_seq_T07R0202_001:
	SetVar VAR_UNK_4125, 0
	End

scr_seq_T07R0202_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0502_T07R0202_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0202_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0502_T07R0202_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
