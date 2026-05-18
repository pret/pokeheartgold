#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0204.h"
#include "msgdata/msg/msg_0504_T07R0204.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0204_000
	ScrDef scr_seq_T07R0204_001
	ScrDefEnd

scr_seq_T07R0204_001:
	SetVar VAR_UNK_4125, 0
	End

scr_seq_T07R0204_000:
	SimpleNPCMsg msg_0504_T07R0204_00000
	End
	.balign 4, 0
