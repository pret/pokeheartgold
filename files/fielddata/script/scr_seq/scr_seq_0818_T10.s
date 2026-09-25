#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10.h"
#include "msgdata/msg/msg_0521_T10.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T10_000
	ScrDefEnd

scr_seq_T10_000:
	TrainerTipsEx 2, msg_0521_T10_00000
	End
	.balign 4, 0
