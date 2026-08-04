#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R07.h"
#include "msgdata/msg/msg_0336_R07.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R07_000
	ScrDef scr_seq_R07_001
	ScrDefEnd

scr_seq_R07_000:
	TrainerTipsEx 2, msg_0336_R07_00000
	End

scr_seq_R07_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0336_R07_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
