#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1004.h"
#include "msgdata/msg/msg_0595_T25R1004.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1004_000
	ScrDef scr_seq_T25R1004_001
	ScrDef scr_seq_T25R1004_002
	ScrDef scr_seq_T25R1004_003
	ScrDef scr_seq_T25R1004_004
	ScrDefEnd

scr_seq_T25R1004_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 6
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T25R1004_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0050
	NPCMsg msg_0595_T25R1004_00001
	GoTo _0053

_0050:
	NPCMsg msg_0595_T25R1004_00000
_0053:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1004_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0079
	NPCMsg msg_0595_T25R1004_00003
	GoTo _007C

_0079:
	NPCMsg msg_0595_T25R1004_00002
_007C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1004_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _00A2
	NPCMsg msg_0595_T25R1004_00005
	GoTo _00A5

_00A2:
	NPCMsg msg_0595_T25R1004_00004
_00A5:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1004_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0595_T25R1004_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
