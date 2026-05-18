#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D15R0102.h"
#include "msgdata/msg/msg_0055_D15R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D15R0102_000
	ScrDef scr_seq_D15R0102_001
	ScrDef scr_seq_D15R0102_002
	ScrDefEnd

scr_seq_D15R0102_000:
	End

scr_seq_D15R0102_001:
	SimpleNPCMsg msg_0055_D15R0102_00000
	End

scr_seq_D15R0102_002:
	SimpleNPCMsg msg_0055_D15R0102_00001
	End
	.balign 4, 0
