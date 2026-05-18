#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R07R0101.h"
#include "msgdata/msg/msg_0337_R07R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R07R0101_000
	ScrDefEnd

scr_seq_R07R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RESTORED_POWER, _0024
	NPCMsg msg_0337_R07R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0024:
	NPCMsg msg_0337_R07R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
