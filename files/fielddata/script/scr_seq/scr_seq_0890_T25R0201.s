#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0201.h"
#include "msgdata/msg/msg_0584_T25R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R0201_000
	ScrDef scr_seq_T25R0201_001
	ScrDefEnd

scr_seq_T25R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_089, _0081
	NPCMsg msg_0584_T25R0201_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0042
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _008C
	End

_0042:
	NPCMsg msg_0584_T25R0201_00001
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0065
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _008C
	End

_0065:
	GiveItemNoCheck ITEM_BICYCLE, 1
	SetFlag FLAG_UNK_089
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0081:
	NPCMsg msg_0584_T25R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008C:
	NPCMsg msg_0584_T25R0201_00004
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

scr_seq_T25R0201_001:
	SimpleNPCMsg msg_0584_T25R0201_00005
	End
	.balign 4, 0
