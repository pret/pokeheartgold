#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R17.h"
#include "msgdata/msg/msg_0357_R17.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R17_000
	ScrDef scr_seq_R17_001
	ScrDefEnd

scr_seq_R17_000:
	SetBikeStateLock 1
	End

scr_seq_R17_001:
	SetBikeStateLock 1
	End
	.balign 4, 0
