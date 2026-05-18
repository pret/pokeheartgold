#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0103.h"
#include "msgdata/msg/msg_0092_D26R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D26R0103_000
	ScrDefEnd

scr_seq_D26R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_KINGS_ROCK_FROM_SLOWPOKE_WELL_MAN, _004F
	NPCMsg msg_0092_D26R0103_00000
	WaitABPress
	CloseMsg
	GoToIfNoItemSpace ITEM_KINGS_ROCK, 1, _005A
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_KINGS_ROCK_FROM_SLOWPOKE_WELL_MAN
	GoTo _004F

_004F:
	NPCMsg msg_0092_D26R0103_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005A:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0064:
	End

	.balign 4, 0
