#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0401.h"
#include "msgdata/msg/msg_0617_T27R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T27R0401_000
	ScrDef scr_seq_T27R0401_001
	ScrDefEnd

_000A:
	End

scr_seq_T27R0401_000:
	SimpleNPCMsg msg_0617_T27R0401_00000
	End

scr_seq_T27R0401_001:
	SimpleNPCMsg msg_0617_T27R0401_00001
	End
	.balign 4, 0
