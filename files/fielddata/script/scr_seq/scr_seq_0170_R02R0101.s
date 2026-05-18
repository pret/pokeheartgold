#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0101.h"
#include "msgdata/msg/msg_0321_R02R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R02R0101_000
	ScrDefEnd

scr_seq_R02R0101_000:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0321_R02R0101_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
