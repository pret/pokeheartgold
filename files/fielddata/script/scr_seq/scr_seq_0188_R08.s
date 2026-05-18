#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R08.h"
#include "msgdata/msg/msg_0338_R08.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R08_000
	ScrDef scr_seq_R08_001
	ScrDefEnd

scr_seq_R08_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0338_R08_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R08_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0338_R08_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
