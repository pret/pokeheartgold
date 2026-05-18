#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21R0301.h"
#include "msgdata/msg/msg_0553_T21R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T21R0301_000
	ScrDef scr_seq_T21R0301_001
	ScrDef scr_seq_T21R0301_002
	ScrDefEnd

scr_seq_T21R0301_000:
	End

scr_seq_T21R0301_001:
	SimpleNPCMsg msg_0553_T21R0301_00000
	End

scr_seq_T21R0301_002:
	SimpleNPCMsg msg_0553_T21R0301_00001
	End
	.balign 4, 0
