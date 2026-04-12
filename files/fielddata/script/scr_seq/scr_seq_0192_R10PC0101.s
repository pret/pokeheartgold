#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10PC0101.h"
#include "msgdata/msg/msg_0342_R10PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R10PC0101_000
	ScrDef scr_seq_R10PC0101_001
	ScrDef scr_seq_R10PC0101_002
	ScrDef scr_seq_R10PC0101_003
	ScrDefEnd

scr_seq_R10PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_R10PC0101_001:
	SimpleNPCMsg msg_0342_R10PC0101_00000
	End

scr_seq_R10PC0101_002:
	GoToIfSet FLAG_RESTORED_POWER, _004F
	SimpleNPCMsg msg_0342_R10PC0101_00001
	End

_004F:
	SimpleNPCMsg msg_0342_R10PC0101_00002
	End

scr_seq_R10PC0101_003:
	SimpleNPCMsg msg_0342_R10PC0101_00003
	End
	.balign 4, 0
