#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29R0101.h"
#include "msgdata/msg/msg_0627_T29R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T29R0101_000
	ScrDefEnd

scr_seq_T29R0101_000:
	GoToIfSet FLAG_GOT_TM10_FROM_LAKE_OF_RAGE_MAN, _005A
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0627_T29R0101_00000
	GoToIfNoItemSpace ITEM_TM10, 1, _006B
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM10_FROM_LAKE_OF_RAGE_MAN
	NPCMsg msg_0627_T29R0101_00002
	WaitButton
	CloseMsg
	ApplyMovement obj_T29R0101_gsbigman, _0078
	WaitMovement
	ReleaseAll
	End

_005A:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0627_T29R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006B:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0078:
	FaceEast
	EndMovement
	.balign 4, 0
