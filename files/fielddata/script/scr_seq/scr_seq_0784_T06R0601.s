#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06R0601.h"
#include "msgdata/msg/msg_0490_T06R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T06R0601_000
	ScrDefEnd

scr_seq_T06R0601_000:
	SimpleNPCMsg msg_0490_T06R0601_00000
	End
	.balign 4, 0
