#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0201.h"
#include "msgdata/msg/msg_0456_T02R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T02R0201_000
	ScrDef scr_seq_T02R0201_001
	ScrDef scr_seq_T02R0201_002
	ScrDef scr_seq_T02R0201_003
	ScrDefEnd

scr_seq_T02R0201_000:
	SimpleNPCMsg msg_0456_T02R0201_00000
	End

scr_seq_T02R0201_001:
	SimpleNPCMsg msg_0456_T02R0201_00001
	End

scr_seq_T02R0201_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_SPEAROW, 0
	NPCMsg msg_0456_T02R0201_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0201_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_RATTATA, 0
	NPCMsg msg_0456_T02R0201_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
