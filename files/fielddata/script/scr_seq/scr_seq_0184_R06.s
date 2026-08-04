#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R06.h"
#include "msgdata/msg/msg_0334_R06.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R06_000
	ScrDef scr_seq_R06_001
	ScrDefEnd

scr_seq_R06_000:
	SimpleNPCMsg msg_0334_R06_00000
	End

scr_seq_R06_001:
	TrainerTipsEx 2, msg_0334_R06_00001
	End
	.balign 4, 0
