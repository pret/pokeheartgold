#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R04.h"
#include "msgdata/msg/msg_0328_R04.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R04_000
	ScrDefEnd

scr_seq_R04_000:
	TrainerTipsEx 2, msg_0328_R04_00000
	End
	.balign 4, 0
