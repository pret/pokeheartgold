#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R28.h"
#include "msgdata/msg/msg_0371_R28.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R28_000
	ScrDef scr_seq_R28_001
	ScrDefEnd

scr_seq_R28_000:
	SetVar VAR_UNK_4126, 0
	End

scr_seq_R28_001:
	DirectionSignpostEx 1, 2, msg_0371_R28_00000
	End
	.balign 4, 0
