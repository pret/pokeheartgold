#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05.h"
#include "msgdata/msg/msg_0329_R05.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R05_000
	ScrDef scr_seq_R05_001
	ScrDefEnd

scr_seq_R05_000:
	SimpleNPCMsg msg_0329_R05_00000
	End

scr_seq_R05_001:
	TrainerTipsEx 2, msg_0329_R05_00001
	End
	.balign 4, 0
