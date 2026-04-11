#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R27R0101.h"
#include "msgdata/msg/msg_0370_R27R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R27R0101_000
	ScrDefEnd

scr_seq_R27R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TM37_FROM_ROUTE_27_WOMAN, _006A
	NPCMsg msg_0370_R27R0101_00000
	GetPartyLeadAlive VAR_TEMP_x4000
	MonGetFriendship VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 150
	GoToIfGe _003E
	NPCMsg msg_0370_R27R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003E:
	NPCMsg msg_0370_R27R0101_00001
	GoToIfNoItemSpace ITEM_TM37, 1, _0075
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM37_FROM_ROUTE_27_WOMAN
_006A:
	NPCMsg msg_0370_R27R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0075:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
