#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R38.h"
#include "msgdata/msg/msg_0394_R38.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R38_000
	ScrDef scr_seq_R38_001
	ScrDef scr_seq_R38_002
	ScrDefEnd

scr_seq_R38_000:
	End

scr_seq_R38_001:
	DirectionSignpost msg_0394_R38_00015, 1, 8, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R38_002:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0394_R38_00016, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
