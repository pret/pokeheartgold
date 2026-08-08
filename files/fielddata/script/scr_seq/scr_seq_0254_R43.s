#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R43.h"
#include "msgdata/msg/msg_0401_R43.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R43_000
	ScrDef scr_seq_R43_001
	ScrDef scr_seq_R43_002
	ScrDef scr_seq_R43_003
	ScrDefEnd

scr_seq_R43_000:
	End

scr_seq_R43_001:
	DirectionSignpostEx 1, 3, msg_0401_R43_00018
	End

scr_seq_R43_002:
	TrainerTipsEx 3, msg_0401_R43_00019
	End

scr_seq_R43_003:
	DirectionSignpostEx 1, 6, msg_0401_R43_00020
	End
	.balign 4, 0
