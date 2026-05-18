#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1003.h"
#include "msgdata/msg/msg_0594_T25R1003.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1003_000
	ScrDef scr_seq_T25R1003_001
	ScrDef scr_seq_T25R1003_002
	ScrDef scr_seq_T25R1003_003
	ScrDefEnd

scr_seq_T25R1003_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 5
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T25R1003_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _004C
	NPCMsg msg_0594_T25R1003_00001
	GoTo _004F

_004C:
	NPCMsg msg_0594_T25R1003_00000
_004F:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1003_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0075
	NPCMsg msg_0594_T25R1003_00003
	GoTo _0078

_0075:
	NPCMsg msg_0594_T25R1003_00002
_0078:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1003_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0594_T25R1003_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
