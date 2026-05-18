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
	DirectionSignpost msg_0406_R46_00000, 1, 3, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R46_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0406_R46_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
