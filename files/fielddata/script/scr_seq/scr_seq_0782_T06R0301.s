#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06R0301.h"
#include "msgdata/msg/msg_0488_T06R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T06R0301_000
	ScrDef scr_seq_T06R0301_001
	ScrDef scr_seq_T06R0301_002
	ScrDef scr_seq_T06R0301_003
	ScrDef scr_seq_T06R0301_004
	ScrDef scr_seq_T06R0301_005
	ScrDef scr_seq_T06R0301_006
	ScrDef scr_seq_T06R0301_007
	ScrDefEnd

scr_seq_T06R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_GOT_RARE_CANDY_FROM_FAN_CLUB_CHAIRMAN, _0044
	BufferPlayersName 0
	GenderMsgBox msg_0488_T06R0301_00004, msg_0488_T06R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0044:
	NPCMsg msg_0488_T06R0301_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _009E
	NPCMsg msg_0488_T06R0301_00001
	GoToIfNoItemSpace ITEM_RARE_CANDY, 1, _0093
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_RARE_CANDY_FROM_FAN_CLUB_CHAIRMAN
	NPCMsg msg_0488_T06R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0093:
	NPCMsg msg_0488_T06R0301_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009E:
	NPCMsg msg_0488_T06R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T06R0301_001:
	SimpleNPCMsg msg_0488_T06R0301_00008
	End

scr_seq_T06R0301_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetItemQuantity ITEM_LOST_ITEM, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0141
	GetItemQuantity ITEM_PASS, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0141
	GoToIfSet FLAG_UNK_119, _0116
	GoToIfSet FLAG_RESTORED_POWER, _010B
	NPCMsg msg_0488_T06R0301_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010B:
	NPCMsg msg_0488_T06R0301_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0116:
	NPCMsg msg_0488_T06R0301_00011
	HidePerson obj_T06R0301_mono_pip
	SetFlag FLAG_HIDE_VERMILION_FAN_CLUB_LOST_ITEM
	GiveItemNoCheck ITEM_LOST_ITEM, 1
	SetVar VAR_UNK_4130, 1
	ClearFlag FLAG_HIDE_VERMILION_CITY_STEVEN
	CloseMsg
	ReleaseAll
	End

_0141:
	NPCMsg msg_0488_T06R0301_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T06R0301_003:
	SimpleNPCMsg msg_0488_T06R0301_00014
	End

scr_seq_T06R0301_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_BAYLEEF, 0
	NPCMsg msg_0488_T06R0301_00016
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T06R0301_007:
	GoToIfSet FLAG_HIDE_VERMILION_FAN_CLUB_LOST_ITEM, _0198
	SimpleNPCMsg msg_0488_T06R0301_00015
	End

_0198:
	End

scr_seq_T06R0301_005:
	SimpleNPCMsg msg_0488_T06R0301_00017
	End

scr_seq_T06R0301_006:
	SimpleNPCMsg msg_0488_T06R0301_00018
	End
	.balign 4, 0
