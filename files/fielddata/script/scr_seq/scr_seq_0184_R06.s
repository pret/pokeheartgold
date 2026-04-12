#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R06.h"
#include "msgdata/msg/msg_0334_R06.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R06_000
	ScrDef scr_seq_R06_001
	ScrDefEnd

scr_seq_R06_000:
	SimpleNPCMsg msg_0334_R06_00000
	End

scr_seq_R06_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0334_R06_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
