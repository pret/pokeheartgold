#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26FS0101.h"
#include "msgdata/msg/msg_0605_T26FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26FS0101_000
	ScrDef scr_seq_T26FS0101_001
	ScrDef scr_seq_T26FS0101_002
	ScrDef scr_seq_T26FS0101_003
	ScrDefEnd

scr_seq_T26FS0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 1
	CallStd std_pokemart
	ReleaseAll
	End

scr_seq_T26FS0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 10
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T26FS0101_001:
	SimpleNPCMsg msg_0605_T26FS0101_00000
	End

scr_seq_T26FS0101_002:
	SimpleNPCMsg msg_0605_T26FS0101_00001
	End
	.balign 4, 0
