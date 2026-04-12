#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0501.h"
#include "msgdata/msg/msg_0577_T24R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T24R0501_000
	ScrDefEnd

scr_seq_T24R0501_000:
	GoToIfSet FLAG_GOT_SECRETPOTION, _0024
	Compare VAR_SCENE_LIGHTHOUSE_JASMINE, 1
	GoToIfEq _0051
	GoTo _0024

_0024:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetFlag FLAG_SPECIAL_MART_PHARMACY
	NPCMsg msg_0577_T24R0501_00003
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 11
	CallStd std_special_mart
	ApplyMovement obj_T24R0501_sunglasses, _00A8
	WaitMovement
	ClearFlag FLAG_SPECIAL_MART_PHARMACY
	ReleaseAll
	End

_0051:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0577_T24R0501_00000
	WaitABPress
	GoToIfNoItemSpace ITEM_SECRETPOTION, 1, _009C
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_SECRETPOTION
	NPCMsg msg_0577_T24R0501_00002
	WaitABPress
	CloseMsg
	ApplyMovement obj_T24R0501_sunglasses, _00A8
	WaitMovement
	ReleaseAll
	End

_009C:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_00A8:
	FaceNorth
	EndMovement
	.balign 4, 0
