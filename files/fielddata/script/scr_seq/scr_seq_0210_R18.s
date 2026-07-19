#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R18.h"
#include "msgdata/msg/msg_0358_R18.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R18_000
	ScrDef scr_seq_R18_001
	ScrDefEnd

scr_seq_R18_000:
	GoToIfSet FLAG_UNK_149, _0017
	End

_0017:
	SetBikeStateLock 1
	End

scr_seq_R18_001:
	DirectionSignpostEx 1, 1, msg_0358_R18_00000
	End
	.balign 4, 0
