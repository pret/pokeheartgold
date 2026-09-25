#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R33.h"
#include "msgdata/msg/msg_0383_R33.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R33_000
	ScrDef scr_seq_R33_001
	ScrDefEnd

scr_seq_R33_000:
	SimpleNPCMsg msg_0383_R33_00000
	End

scr_seq_R33_001:
	DirectionSignpostEx 1, 2, msg_0383_R33_00001
	End
	.balign 4, 0
