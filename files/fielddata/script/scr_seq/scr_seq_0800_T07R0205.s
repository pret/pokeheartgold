#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0205.h"
#include "msgdata/msg/msg_0505_T07R0205.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0205_000
	ScrDefEnd

scr_seq_T07R0205_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_SPELL_TAG_FROM_CELADON_CITY_MAN, _0071
	NPCMsg msg_0505_T07R0205_00000
	ScrCmd_379 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _0045
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _0045
	NPCMsg msg_0505_T07R0205_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0045:
	NPCMsg msg_0505_T07R0205_00002
	GoToIfNoItemSpace ITEM_SPELL_TAG, 1, _007C
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_SPELL_TAG_FROM_CELADON_CITY_MAN
_0071:
	NPCMsg msg_0505_T07R0205_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_007C:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
