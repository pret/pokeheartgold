#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0601.h"
#include "msgdata/msg/msg_0481_T05R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T05R0601_000
	ScrDef scr_seq_T05R0601_001
	ScrDef scr_seq_T05R0601_002
	ScrDef scr_seq_T05R0601_003
	ScrDefEnd

scr_seq_T05R0601_000:
	SimpleNPCMsg msg_0481_T05R0601_00000
	End

scr_seq_T05R0601_001:
	SimpleNPCMsg msg_0481_T05R0601_00001
	End

scr_seq_T05R0601_002:
	SimpleNPCMsg msg_0481_T05R0601_00002
	End

scr_seq_T05R0601_003:
	SimpleNPCMsg msg_0481_T05R0601_00003
	End
	.balign 4, 0
