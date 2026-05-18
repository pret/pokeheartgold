#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R44.h"
#include "msgdata/msg/msg_0404_R44.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R44_000
	ScrDef scr_seq_R44_001
	ScrDef scr_seq_R44_002
	ScrDefEnd

scr_seq_R44_000:
	End

scr_seq_R44_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0404_R44_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R44_002:
	DirectionSignpost msg_0404_R44_00001, 1, 1, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
