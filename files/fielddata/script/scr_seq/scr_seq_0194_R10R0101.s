#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10R0101.h"
#include "msgdata/msg/msg_0343_R10R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R10R0101_000
	ScrDefEnd

scr_seq_R10R0101_000:
	DirectionSignpostEx 1, 3, msg_0343_R10R0101_00000
	End
	.balign 4, 0
