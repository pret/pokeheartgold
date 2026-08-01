#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0102.h"
#include "msgdata/msg/msg_0063_D22R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D22R0102_000
	ScrDef scr_seq_D22R0102_001
	ScrDef scr_seq_D22R0102_002
	ScrDef scr_seq_D22R0102_003
	ScrDef scr_seq_D22R0102_004
	ScrDef scr_seq_D22R0102_005
	ScrDef scr_seq_D22R0102_006
	ScrDef scr_seq_D22R0102_007
	ScrDef scr_seq_D22R0102_008
	ScrDef scr_seq_D22R0102_009
	ScrDef scr_seq_D22R0102_010
	ScrDef scr_seq_D22R0102_011
	ScrDef scr_seq_D22R0102_012
	ScrDefEnd

scr_seq_D22R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0063_D22R0102_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0102_000:
	TrainerTipsEx 2, msg_0063_D22R0102_00000
	End

scr_seq_D22R0102_001:
	TrainerTipsEx 3, msg_0063_D22R0102_00001
	End

scr_seq_D22R0102_002:
	TrainerTipsEx 3, msg_0063_D22R0102_00002
	End
	.balign 4, 0
