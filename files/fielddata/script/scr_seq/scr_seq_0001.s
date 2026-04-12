#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0001.h"
#include "msgdata/msg/msg_0020.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0001_000
	ScrDef scr_seq_0001_001
	ScrDef scr_seq_0001_002
	ScrDef scr_seq_0001_003
	ScrDef scr_seq_0001_004
	ScrDef scr_seq_0001_005
	ScrDef scr_seq_0001_006
	ScrDef scr_seq_0001_007
	ScrDef scr_seq_0001_008
	ScrDefEnd

scr_seq_0001_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0020_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0001_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	TownMap
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End
	.balign 4, 0
