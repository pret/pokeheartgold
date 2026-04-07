#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16.h"
#include "msgdata/msg/msg_0354_R16.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R16_000
	ScrDef scr_seq_R16_001
	ScrDefEnd

scr_seq_R16_000:
	SetBikeStateLock 1
	SetFlag FLAG_UNK_149
	End

scr_seq_R16_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0354_R16_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
