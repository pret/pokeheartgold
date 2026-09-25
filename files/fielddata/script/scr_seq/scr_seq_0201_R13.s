#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R13.h"
#include "msgdata/msg/msg_0350_R13.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R13_000
	ScrDef scr_seq_R13_001
	ScrDef scr_seq_R13_002
	ScrDefEnd

scr_seq_R13_000:
	TrainerTipsEx 3, msg_0350_R13_00000
	End

scr_seq_R13_001:
	DirectionSignpostEx 1, 10, msg_0350_R13_00001
	End

scr_seq_R13_002:
	DirectionSignpostEx 1, 14, msg_0350_R13_00002
	End
	.balign 4, 0
