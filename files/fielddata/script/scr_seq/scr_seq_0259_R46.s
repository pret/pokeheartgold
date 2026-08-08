#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R46.h"
#include "msgdata/msg/msg_0406_R46.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R46_000
	ScrDef scr_seq_R46_001
	ScrDef scr_seq_R46_002
	ScrDefEnd

scr_seq_R46_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GAVE_RIVAL_NAME_TO_OFFICER, _002C
	NPCMsg msg_0406_R46_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002C:
	NPCMsg msg_0406_R46_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R46_001:
	DirectionSignpostEx 1, 3, msg_0406_R46_00000
	End

scr_seq_R46_002:
	TrainerTipsEx 2, msg_0406_R46_00001
	End
	.balign 4, 0
