#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01R0202.h"
#include "msgdata/msg/msg_0450_T01R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T01R0202_000
	ScrDef scr_seq_T01R0202_001
	ScrDefEnd

scr_seq_T01R0202_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0450_T01R0202_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01R0202_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0450_T01R0202_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
