#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0301.h"
#include "msgdata/msg/msg_0332_R05R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R05R0301_000
	ScrDefEnd

scr_seq_R05R0301_000:
	SimpleNPCMsg msg_0332_R05R0301_00000
	End
	.balign 4, 0
