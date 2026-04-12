#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R28.h"
#include "msgdata/msg/msg_0371_R28.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R28_000
	ScrDef scr_seq_R28_001
	ScrDefEnd

scr_seq_R28_000:
	SetVar VAR_UNK_4126, 0
	End

scr_seq_R28_001:
	DirectionSignpost msg_0371_R28_00000, 1, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
