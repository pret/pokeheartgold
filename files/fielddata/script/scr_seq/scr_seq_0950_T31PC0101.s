#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T31PC0101.h"
#include "msgdata/msg/msg_0637_T31PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T31PC0101_000
	ScrDef scr_seq_T31PC0101_001
	ScrDefEnd

scr_seq_T31PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T31PC0101_001:
	SimpleNPCMsg msg_0637_T31PC0101_00000
	End
	.balign 4, 0
