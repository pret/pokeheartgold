#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05.h"
#include "msgdata/msg/msg_0329_R05.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R05_000
	ScrDef scr_seq_R05_001
	ScrDefEnd

scr_seq_R05_000:
	SimpleNPCMsg msg_0329_R05_00000
	End

scr_seq_R05_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0329_R05_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
