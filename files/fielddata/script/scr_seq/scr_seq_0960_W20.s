#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W20.h"
#include "msgdata/msg/msg_0742_W20.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_W20_000
	ScrDef scr_seq_W20_001
	ScrDefEnd

scr_seq_W20_000:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0742_W20_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_W20_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0742_W20_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
