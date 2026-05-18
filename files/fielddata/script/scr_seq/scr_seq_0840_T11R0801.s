#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0801.h"
#include "msgdata/msg/msg_0540_T11R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0801_000
	ScrDef scr_seq_T11R0801_001
	ScrDef scr_seq_T11R0801_002
	ScrDefEnd

scr_seq_T11R0801_000:
	SimpleNPCMsg msg_0540_T11R0801_00000
	End

scr_seq_T11R0801_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RESTORED_POWER, _003F
	NPCMsg msg_0540_T11R0801_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003F:
	NPCMsg msg_0540_T11R0801_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T11R0801_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_BLISSEY, 0
	NPCMsg msg_0540_T11R0801_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
