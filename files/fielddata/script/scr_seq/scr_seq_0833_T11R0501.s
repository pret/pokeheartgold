#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0501.h"
#include "msgdata/msg/msg_0534_T11R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0501_000
	ScrDefEnd

scr_seq_T11R0501_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TM29_FROM_MR_PSYCHIC, _0045
	NPCMsg msg_0534_T11R0501_00000
	GoToIfNoItemSpace ITEM_TM29, 1, _0050
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM29_FROM_MR_PSYCHIC
_0045:
	NPCMsg msg_0534_T11R0501_00001
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
