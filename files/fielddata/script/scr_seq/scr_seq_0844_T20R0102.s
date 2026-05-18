#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0102.h"
#include "msgdata/msg/msg_0544_T20R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T20R0102_000
	ScrDef scr_seq_T20R0102_001
	ScrDefEnd

scr_seq_T20R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	GenderMsgBox msg_0544_T20R0102_00000, msg_0544_T20R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0102_001:
	SimpleNPCMsg msg_0544_T20R0102_00002
	End
	.balign 4, 0
