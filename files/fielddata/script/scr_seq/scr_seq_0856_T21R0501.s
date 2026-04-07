#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21R0501.h"
#include "msgdata/msg/msg_0555_T21R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T21R0501_000
	ScrDef scr_seq_T21R0501_001
	ScrDef scr_seq_T21R0501_002
	ScrDefEnd

scr_seq_T21R0501_000:
	End

scr_seq_T21R0501_001:
	SimpleNPCMsg msg_0555_T21R0501_00000
	End

scr_seq_T21R0501_002:
	SimpleNPCMsg msg_0555_T21R0501_00001
	End
	.balign 4, 0
