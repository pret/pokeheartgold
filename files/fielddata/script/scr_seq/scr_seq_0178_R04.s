#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R04.h"
#include "msgdata/msg/msg_0328_R04.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R04_000
	ScrDefEnd

scr_seq_R04_000:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0328_R04_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
