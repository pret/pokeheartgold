#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39R0101.h"
#include "msgdata/msg/msg_0397_R39R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R39R0101_000
	ScrDef scr_seq_R39R0101_001
	ScrDefEnd

scr_seq_R39R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0AA, _002C
	SetFlag FLAG_UNK_0A8
	NPCMsg msg_0397_R39R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002C:
	SetVar VAR_SPECIAL_x8004, 33
	SetVar VAR_SPECIAL_x8005, 0
	HasItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 999
	GoToIfNe _0058
	NPCMsg msg_0397_R39R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0058:
	ShowMoneyBox 20, 2
	NPCMsg msg_0397_R39R0101_00001
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 12, 255, 1
	MenuItemAdd 13, 255, 2
	MenuItemAdd 14, 255, 3
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0111
	Compare VAR_SPECIAL_RESULT, 1
	CallIfEq _011E
	Compare VAR_SPECIAL_RESULT, 2
	CallIfEq _012C
	HasEnoughMoneyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4001
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00F7
	GoToIfNoItemSpace ITEM_MOOMOO_MILK, VAR_TEMP_x4000, _0104
	SubMoneyVar VAR_TEMP_x4001
	UpdateMoneyBox
	NPCMsg msg_0397_R39R0101_00002
	CallStd std_give_item_verbose
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_00F7:
	NPCMsg msg_0397_R39R0101_00003
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0104:
	NPCMsg msg_0397_R39R0101_00004
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0111:
	NPCMsg msg_0397_R39R0101_00005
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_011E:
	SetVar VAR_TEMP_x4000, 1
	SetVar VAR_TEMP_x4001, 500
	Return

_012C:
	SetVar VAR_TEMP_x4000, 12
	SetVar VAR_TEMP_x4001, 6000
	Return

scr_seq_R39R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0AA, _0158
	NPCMsg msg_0397_R39R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0158:
	GoToIfSet FLAG_GOT_TM83_FROM_MOOMOO_FARM_WOMAN, _0197
	NPCMsg msg_0397_R39R0101_00008
	WaitABPress
	GoToIfNoItemSpace ITEM_TM83, 1, _01A2
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM83_FROM_MOOMOO_FARM_WOMAN
	GoTo _0197

_0197:
	NPCMsg msg_0397_R39R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01A2:
	NPCMsg msg_0397_R39R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
