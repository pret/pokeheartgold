#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R12R0101.h"
#include "msgdata/msg/msg_0349_R12R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R12R0101_000
	ScrDefEnd

scr_seq_R12R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetItemQuantity ITEM_SUPER_ROD, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _004C
	NPCMsg msg_0349_R12R0101_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0057
	NPCMsg msg_0349_R12R0101_00001
	GiveItemNoCheck ITEM_SUPER_ROD, 1
_004C:
	NPCMsg msg_0349_R12R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0057:
	NPCMsg msg_0349_R12R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
