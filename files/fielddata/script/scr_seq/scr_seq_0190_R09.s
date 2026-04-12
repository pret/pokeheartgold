#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R09.h"
#include "msgdata/msg/msg_0340_R09.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R09_000
	ScrDefEnd

scr_seq_R09_000:
	DirectionSignpost msg_0340_R09_00000, 1, 1, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
