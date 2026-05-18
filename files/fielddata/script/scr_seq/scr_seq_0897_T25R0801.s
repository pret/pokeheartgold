#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0801.h"
#include "msgdata/msg/msg_0590_T25R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R0801_000
	ScrDef scr_seq_T25R0801_001
	ScrDefEnd

scr_seq_T25R0801_000:
	SimpleNPCMsg msg_0590_T25R0801_00000
	End

scr_seq_T25R0801_001:
	SimpleNPCMsg msg_0590_T25R0801_00001
	End
	.balign 4, 0
