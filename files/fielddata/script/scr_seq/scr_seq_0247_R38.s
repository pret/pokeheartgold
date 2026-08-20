#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R38.h"
#include "msgdata/msg/msg_0394_R38.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R38_000
	ScrDef scr_seq_R38_001
	ScrDef scr_seq_R38_002
	ScrDefEnd

scr_seq_R38_000:
	End

scr_seq_R38_001:
	DirectionSignpostEx 1, 8, msg_0394_R38_00015
	End

scr_seq_R38_002:
	TrainerTipsEx 3, msg_0394_R38_00016
	End
	.balign 4, 0
