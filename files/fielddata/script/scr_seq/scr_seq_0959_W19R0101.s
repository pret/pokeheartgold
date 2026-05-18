#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W19R0101.h"
#include "msgdata/msg/msg_0741_W19R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_W19R0101_000
	ScrDefEnd

scr_seq_W19R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_VOLCANO, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _002C
	NPCMsg msg_0741_W19R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002C:
	NPCMsg msg_0741_W19R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
