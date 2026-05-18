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
	DirectionSignpost msg_0358_R18_00000, 1, 1, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
