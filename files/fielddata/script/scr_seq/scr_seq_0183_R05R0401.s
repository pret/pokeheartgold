#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R05R0401.h"
#include "msgdata/msg/msg_0333_R05R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R05R0401_000
	ScrDef scr_seq_R05R0401_001
	ScrDefEnd

scr_seq_R05R0401_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_CLEANSE_TAG_FROM_ROUTE_5_GRANDMA, _0049
	NPCMsg msg_0333_R05R0401_00000
	GoToIfNoItemSpace ITEM_CLEANSE_TAG, 1, _0054
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_CLEANSE_TAG_FROM_ROUTE_5_GRANDMA
_0049:
	NPCMsg msg_0333_R05R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0054:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_R05R0401_001:
	SimpleNPCMsg msg_0333_R05R0401_00002
	End
	.balign 4, 0
