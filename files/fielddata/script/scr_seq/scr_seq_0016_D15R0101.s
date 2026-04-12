#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0101.h"
#include "msgdata/msg/msg_0054_D15R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D15R0101_000
	ScrDef scr_seq_D15R0101_001
	ScrDef scr_seq_D15R0101_002
	ScrDef scr_seq_D15R0101_003
	ScrDef scr_seq_D15R0101_004
	ScrDefEnd

scr_seq_D15R0101_000:
	End

scr_seq_D15R0101_001:
	SimpleNPCMsg msg_0054_D15R0101_00002
	End

scr_seq_D15R0101_002:
	SimpleNPCMsg msg_0054_D15R0101_00003
	End

scr_seq_D15R0101_003:
	SimpleNPCMsg msg_0054_D15R0101_00001
	End

scr_seq_D15R0101_004:
	SimpleNPCMsg msg_0054_D15R0101_00000
	End
	.balign 4, 0
