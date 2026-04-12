#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04R0301.h"
#include "msgdata/msg/msg_0473_T04R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T04R0301_000
	ScrDef scr_seq_T04R0301_001
	ScrDef scr_seq_T04R0301_002
	ScrDef scr_seq_T04R0301_003
	ScrDefEnd

scr_seq_T04R0301_000:
	SimpleNPCMsg msg_0473_T04R0301_00000
	End

scr_seq_T04R0301_001:
	SimpleNPCMsg msg_0473_T04R0301_00001
	End

scr_seq_T04R0301_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_KANGASKHAN, 0
	NPCMsg msg_0473_T04R0301_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04R0301_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_ZUBAT, 0
	NPCMsg msg_0473_T04R0301_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
