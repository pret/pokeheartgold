#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0954.h"
#include "msgdata/msg/msg_0733.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0954_000
	ScrDefEnd

scr_seq_0954_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0733_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
