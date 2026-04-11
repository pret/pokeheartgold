#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R06R0201.h"
#include "msgdata/msg/msg_0335_R06R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R06R0201_000
	ScrDefEnd

scr_seq_R06R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RESTORED_POWER, _0024
	NPCMsg msg_0335_R06R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0024:
	NPCMsg msg_0335_R06R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
