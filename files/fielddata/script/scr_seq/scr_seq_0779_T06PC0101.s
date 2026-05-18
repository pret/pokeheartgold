#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06PC0101.h"
#include "msgdata/msg/msg_0486_T06PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T06PC0101_000
	ScrDef scr_seq_T06PC0101_001
	ScrDef scr_seq_T06PC0101_002
	ScrDef scr_seq_T06PC0101_003
	ScrDefEnd

scr_seq_T06PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T06PC0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_CAUGHT_SNORLAX, _003C
	NPCMsg msg_0486_T06PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003C:
	NPCMsg msg_0486_T06PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T06PC0101_002:
	SimpleNPCMsg msg_0486_T06PC0101_00002
	End

scr_seq_T06PC0101_003:
	SimpleNPCMsg msg_0486_T06PC0101_00003
	End
	.balign 4, 0
