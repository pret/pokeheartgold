#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0801.h"
#include "msgdata/msg/msg_0619_T27R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T27R0801_000
	ScrDef scr_seq_T27R0801_001
	ScrDefEnd

scr_seq_T27R0801_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_DOWSING_MACHINE, _0078
	NPCMsg msg_0619_T27R0801_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0044
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _008D
	End

_0044:
	NPCMsg msg_0619_T27R0801_00001
	WaitABPress
	GoToIfNoItemSpace ITEM_DOWSING_MCHN, 1, _0083
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_DOWSING_MACHINE
	GoTo _0078

_0078:
	NPCMsg msg_0619_T27R0801_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0083:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_008D:
	NPCMsg msg_0619_T27R0801_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0801_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0619_T27R0801_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00C7
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00F9
	End

_00C7:
	NPCMsg msg_0619_T27R0801_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00EE
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00F9
	End

_00EE:
	NPCMsg msg_0619_T27R0801_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F9:
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
