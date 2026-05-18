#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1002.h"
#include "msgdata/msg/msg_0593_T25R1002.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1002_000
	ScrDef scr_seq_T25R1002_001
	ScrDef scr_seq_T25R1002_002
	ScrDef scr_seq_T25R1002_003
	ScrDef scr_seq_T25R1002_004
	ScrDef scr_seq_T25R1002_005
	ScrDefEnd

scr_seq_T25R1002_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 3
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T25R1002_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 4
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T25R1002_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0070
	NPCMsg msg_0593_T25R1002_00001
	GoTo _0073

_0070:
	NPCMsg msg_0593_T25R1002_00000
_0073:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1002_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0099
	NPCMsg msg_0593_T25R1002_00005
	GoTo _009C

_0099:
	NPCMsg msg_0593_T25R1002_00004
_009C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1002_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _00C2
	NPCMsg msg_0593_T25R1002_00003
	GoTo _00C5

_00C2:
	NPCMsg msg_0593_T25R1002_00002
_00C5:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1002_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0593_T25R1002_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
