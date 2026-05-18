#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D42R0101.h"
#include "msgdata/msg/msg_0127_D42R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D42R0101_000
	ScrDefEnd

scr_seq_D42R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_BLACKGLASSES_FROM_DARK_CAVE_MAN, _0045
	NPCMsg msg_0127_D42R0101_00000
	GoToIfNoItemSpace ITEM_BLACKGLASSES, 1, _0050
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_BLACKGLASSES_FROM_DARK_CAVE_MAN
_0045:
	NPCMsg msg_0127_D42R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0050:
	NPCMsg msg_0127_D42R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
