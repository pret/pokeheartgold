#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1001.h"
#include "msgdata/msg/msg_0592_T25R1001.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1001_000
	ScrDef scr_seq_T25R1001_001
	ScrDef scr_seq_T25R1001_002
	ScrDef scr_seq_T25R1001_003
	ScrDef scr_seq_T25R1001_004
	ScrDefEnd

scr_seq_T25R1001_000:
	SimpleNPCMsg msg_0592_T25R1001_00000
	End

scr_seq_T25R1001_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0047
	NPCMsg msg_0592_T25R1001_00002
	GoTo _004A

_0047:
	NPCMsg msg_0592_T25R1001_00001
_004A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1001_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0070
	NPCMsg msg_0592_T25R1001_00004
	GoTo _0073

_0070:
	NPCMsg msg_0592_T25R1001_00003
_0073:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1001_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0099
	NPCMsg msg_0592_T25R1001_00006
	GoTo _009C

_0099:
	NPCMsg msg_0592_T25R1001_00005
_009C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1001_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0592_T25R1001_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
