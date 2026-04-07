#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R26R0201.h"
#include "msgdata/msg/msg_0367_R26R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R26R0201_000
	ScrDefEnd

scr_seq_R26R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0367_R26R0201_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0049
	NPCMsg msg_0367_R26R0201_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0049
	NPCMsg msg_0367_R26R0201_00002
	WaitButton
	CloseMsg
_0049:
	ReleaseAll
	End
	.balign 4, 0
