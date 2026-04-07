#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04R0101.h"
#include "msgdata/msg/msg_0471_T04R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T04R0101_000
	ScrDefEnd

scr_seq_T04R0101_000:
	SimpleNPCMsg msg_0471_T04R0101_00000
	End
	.balign 4, 0
