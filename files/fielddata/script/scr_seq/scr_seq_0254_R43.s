#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R43.h"
#include "msgdata/msg/msg_0401_R43.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R43_000
	ScrDef scr_seq_R43_001
	ScrDef scr_seq_R43_002
	ScrDef scr_seq_R43_003
	ScrDefEnd

scr_seq_R43_000:
	End

scr_seq_R43_001:
	DirectionSignpost msg_0401_R43_00018, 1, 3, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R43_002:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0401_R43_00019, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R43_003:
	DirectionSignpost msg_0401_R43_00020, 1, 6, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
