#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0701.h"
#include "msgdata/msg/msg_0579_T24R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T24R0701_000
	ScrDef scr_seq_T24R0701_001
	ScrDef scr_seq_T24R0701_002
	ScrDefEnd

scr_seq_T24R0701_000:
	SimpleNPCMsg msg_0579_T24R0701_00000
	End

scr_seq_T24R0701_001:
	SimpleNPCMsg msg_0579_T24R0701_00001
	End

scr_seq_T24R0701_002:
	SimpleNPCMsg msg_0579_T24R0701_00002
	End
	.balign 4, 0
