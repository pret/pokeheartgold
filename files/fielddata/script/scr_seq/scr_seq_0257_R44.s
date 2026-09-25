#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R44.h"
#include "msgdata/msg/msg_0404_R44.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R44_000
	ScrDef scr_seq_R44_001
	ScrDef scr_seq_R44_002
	ScrDefEnd

scr_seq_R44_000:
	End

scr_seq_R44_001:
	TrainerTipsEx 2, msg_0404_R44_00000
	End

scr_seq_R44_002:
	DirectionSignpostEx 1, 1, msg_0404_R44_00001
	End
	.balign 4, 0
