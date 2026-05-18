#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21FS0101.h"
#include "msgdata/msg/msg_0551_T21FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T21FS0101_000
	ScrDef scr_seq_T21FS0101_001
	ScrDef scr_seq_T21FS0101_002
	ScrDef scr_seq_T21FS0101_003
	ScrDefEnd

scr_seq_T21FS0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 0
	CallStd std_pokemart
	ReleaseAll
	End

scr_seq_T21FS0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 0
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T21FS0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ELMS_LAB, 4
	GoToIfLt _0068
	NPCMsg msg_0551_T21FS0101_00001
	GoTo _006B

_0068:
	NPCMsg msg_0551_T21FS0101_00000
_006B:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T21FS0101_001:
	SimpleNPCMsg msg_0551_T21FS0101_00002
	End
	.balign 4, 0
