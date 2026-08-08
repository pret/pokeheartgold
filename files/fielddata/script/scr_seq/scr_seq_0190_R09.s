#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R09.h"
#include "msgdata/msg/msg_0340_R09.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R09_000
	ScrDefEnd

scr_seq_R09_000:
	DirectionSignpostEx 1, 1, msg_0340_R09_00000
	End
	.balign 4, 0
