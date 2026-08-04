#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W20.h"
#include "msgdata/msg/msg_0742_W20.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_W20_000
	ScrDef scr_seq_W20_001
	ScrDefEnd

scr_seq_W20_000:
	TrainerTipsEx 2, msg_0742_W20_00000
	End

scr_seq_W20_001:
	TrainerTipsEx 2, msg_0742_W20_00001
	End
	.balign 4, 0
