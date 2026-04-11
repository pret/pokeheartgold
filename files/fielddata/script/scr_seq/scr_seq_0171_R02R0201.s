#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0201.h"
#include "msgdata/msg/msg_0322_R02R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R02R0201_000
	ScrDefEnd

scr_seq_R02R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_NUGGET_FROM_ROUTE_2_MAN, _0045
	NPCMsg msg_0322_R02R0201_00000
	GoToIfNoItemSpace ITEM_NUGGET, 1, _0050
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_NUGGET_FROM_ROUTE_2_MAN
_0045:
	NPCMsg msg_0322_R02R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0050:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
