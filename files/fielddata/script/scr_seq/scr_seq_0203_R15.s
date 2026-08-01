#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R15.h"
#include "msgdata/msg/msg_0352_R15.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R15_000
	ScrDefEnd

scr_seq_R15_000:
	DirectionSignpostEx 1, 10, msg_0352_R15_00000
	End
	.balign 4, 0
