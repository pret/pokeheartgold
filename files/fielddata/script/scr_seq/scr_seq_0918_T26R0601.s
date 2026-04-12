#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0601.h"
#include "msgdata/msg/msg_0610_T26R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26R0601_000
	ScrDefEnd

scr_seq_T26R0601_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_GOOD_ROD, _008E
	NPCMsg msg_0610_T26R0601_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0040
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0079
	End

_0040:
	GoToIfNoItemSpace ITEM_GOOD_ROD, 1, _0084
	NPCMsg msg_0610_T26R0601_00001
	WaitButton
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_GOOD_ROD
	NPCMsg msg_0610_T26R0601_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0079:
	NPCMsg msg_0610_T26R0601_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0084:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_008E:
	NPCMsg msg_0610_T26R0601_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
