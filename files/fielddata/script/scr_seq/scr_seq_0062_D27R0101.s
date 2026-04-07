#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0101.h"
#include "msgdata/msg/msg_0093_D27R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D27R0101_000
	ScrDef scr_seq_D27R0101_001
	ScrDef scr_seq_D27R0101_002
	ScrDefEnd

scr_seq_D27R0101_002:
	SetVar VAR_UNK_4125, 0
	End

scr_seq_D27R0101_000:
	SimpleNPCMsg msg_0093_D27R0101_00000
	End

scr_seq_D27R0101_001:
	SimpleNPCMsg msg_0093_D27R0101_00001
	End
	.balign 4, 0
