#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21PC0101.h"
#include "msgdata/msg/msg_0552_T21PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T21PC0101_000
	ScrDef scr_seq_T21PC0101_001
	ScrDef scr_seq_T21PC0101_002
	ScrDef scr_seq_T21PC0101_003
	ScrDef scr_seq_T21PC0101_004
	ScrDef scr_seq_T21PC0101_005
	ScrDefEnd

scr_seq_T21PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T21PC0101_004:
	SimpleNPCMsg msg_0552_T21PC0101_00004
	End

scr_seq_T21PC0101_005:
	SimpleNPCMsg msg_0552_T21PC0101_00005
	End

scr_seq_T21PC0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ELMS_LAB, 3
	GoToIfLt _006A
	NPCMsg msg_0552_T21PC0101_00003
	GoTo _006D

_006A:
	NPCMsg msg_0552_T21PC0101_00002
_006D:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T21PC0101_001:
	SimpleNPCMsg msg_0552_T21PC0101_00000
	End

scr_seq_T21PC0101_002:
	SimpleNPCMsg msg_0552_T21PC0101_00001
	End
	.balign 4, 0
