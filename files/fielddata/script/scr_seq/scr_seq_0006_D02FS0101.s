#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02FS0101.h"
#include "msgdata/msg/msg_0048_D02FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D02FS0101_000
	ScrDef scr_seq_D02FS0101_001
	ScrDefEnd

scr_seq_D02FS0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetFlag FLAG_SPECIAL_MART_MT_MOON
	NPCMsg msg_0048_D02FS0101_00001
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 27
	CallStd std_special_mart
	ClearFlag FLAG_SPECIAL_MART_MT_MOON
	ReleaseAll
	End

scr_seq_D02FS0101_000:
	SimpleNPCMsg msg_0048_D02FS0101_00000
	End
	.balign 4, 0
