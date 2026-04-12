#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0201.h"
#include "msgdata/msg/msg_0501_T07R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0201_000
	ScrDef scr_seq_T07R0201_001
	ScrDef scr_seq_T07R0201_002
	ScrDef scr_seq_T07R0201_003
	ScrDef scr_seq_T07R0201_004
	ScrDef scr_seq_T07R0201_005
	ScrDefEnd

scr_seq_T07R0201_005:
	SetVar VAR_UNK_4125, 0
	End

scr_seq_T07R0201_000:
	SimpleNPCMsg msg_0501_T07R0201_00000
	End

scr_seq_T07R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MEOWTH, 0
	NPCMsg msg_0501_T07R0201_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0201_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_CLEFAIRY, 0
	NPCMsg msg_0501_T07R0201_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0201_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_NIDORAN_F, 0
	NPCMsg msg_0501_T07R0201_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0201_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0501_T07R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
