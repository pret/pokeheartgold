#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0501.h"
#include "msgdata/msg/msg_0325_R02R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R02R0501_000
	ScrDefEnd

scr_seq_R02R0501_000:
	SimpleNPCMsg msg_0325_R02R0501_00000
	End
	.balign 4, 0
