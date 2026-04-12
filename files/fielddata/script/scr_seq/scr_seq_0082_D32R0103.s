#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0103.h"
#include "msgdata/msg/msg_0105_D32R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32R0103_000
	ScrDef scr_seq_D32R0103_001
	ScrDef scr_seq_D32R0103_002
	ScrDef scr_seq_D32R0103_003
	ScrDefEnd

scr_seq_D32R0103_003:
	SetVar VAR_UNK_40E5, 2
	End

scr_seq_D32R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_frontier_move_tutor_1
	ReleaseAll
	End

scr_seq_D32R0103_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_frontier_move_tutor_2
	ReleaseAll
	End

scr_seq_D32R0103_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_frontier_move_tutor_3
	ReleaseAll
	End
	.balign 4, 0
