#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08R0601.h"
#include "msgdata/msg/msg_0518_T08R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T08R0601_000
	ScrDef scr_seq_T08R0601_001
	ScrDef scr_seq_T08R0601_002
	ScrDef scr_seq_T08R0601_003
	ScrDefEnd

scr_seq_T08R0601_000:
	SimpleNPCMsg msg_0518_T08R0601_00000
	End

scr_seq_T08R0601_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_AIPOM, 0
	NPCMsg msg_0518_T08R0601_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T08R0601_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_AIPOM, 0
	NPCMsg msg_0518_T08R0601_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T08R0601_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_AIPOM, 0
	NPCMsg msg_0518_T08R0601_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
