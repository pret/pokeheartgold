#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R13.h"
#include "msgdata/msg/msg_0350_R13.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R13_000
	ScrDef scr_seq_R13_001
	ScrDef scr_seq_R13_002
	ScrDefEnd

scr_seq_R13_000:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0350_R13_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R13_001:
	DirectionSignpost msg_0350_R13_00001, 1, 10, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R13_002:
	DirectionSignpost msg_0350_R13_00002, 1, 14, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
