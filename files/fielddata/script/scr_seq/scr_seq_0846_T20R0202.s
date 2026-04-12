#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0202.h"
#include "msgdata/msg/msg_0546_T20R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T20R0202_000
	ScrDef scr_seq_T20R0202_001
	ScrDefEnd

scr_seq_T20R0202_000:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_PC_ON
	BufferPlayersName 0
	NPCMsg msg_0546_T20R0202_00000
	CloseMsg
	ScrCmd_377 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _004B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_376
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_004B:
	NPCMsg msg_0546_T20R0202_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0202_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0546_T20R0202_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
