#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02.h"
#include "msgdata/msg/msg_0320_R02.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R02_000
	ScrDefEnd

scr_seq_R02_000:
	DirectionSignpostEx 1, 3, msg_0320_R02_00000
	End
	.balign 4, 0
