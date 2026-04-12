#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25PC0101.h"
#include "msgdata/msg/msg_0583_T25PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25PC0101_000
	ScrDef scr_seq_T25PC0101_001
	ScrDef scr_seq_T25PC0101_002
	ScrDef scr_seq_T25PC0101_003
	ScrDefEnd

scr_seq_T25PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T25PC0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _003C
	NPCMsg msg_0583_T25PC0101_00003
	GoTo _003F

_003C:
	NPCMsg msg_0583_T25PC0101_00002
_003F:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25PC0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0065
	NPCMsg msg_0583_T25PC0101_00005
	GoTo _0068

_0065:
	NPCMsg msg_0583_T25PC0101_00004
_0068:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25PC0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _008E
	NPCMsg msg_0583_T25PC0101_00001
	GoTo _0091

_008E:
	NPCMsg msg_0583_T25PC0101_00000
_0091:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
