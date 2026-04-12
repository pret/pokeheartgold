#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R15.h"
#include "msgdata/msg/msg_0352_R15.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R15_000
	ScrDefEnd

scr_seq_R15_000:
	DirectionSignpost msg_0352_R15_00000, 1, 10, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
