#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0144.h"
#include "msgdata/msg/msg_0209.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0144_000
	ScrDef scr_seq_0144_001
	ScrDef scr_seq_0144_002
	ScrDef scr_seq_0144_003
	ScrDefEnd

scr_seq_0144_000:
	MysteryGift SCR_MG_BEGIN
	MomGiftCheck VAR_TEMP_x4000
	NopVar490 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0035
	SetFlag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
	GoTo _0039

_0035:
	ClearFlag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
_0039:
	MysteryGift SCR_MG_HAS_GIFT, VAR_MYSTERY_GIFT_CHECK
	Compare VAR_MYSTERY_GIFT_CHECK, FALSE
	GoToIfNe _0056
	SetFlag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
	GoTo _005A

_0056:
	ClearFlag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
_005A:
	MysteryGift SCR_MG_END
	End

scr_seq_0144_003:
	MysteryGift SCR_MG_BEGIN
	MomGiftCheck VAR_TEMP_x4000
	NopVar490 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0083
	SetFlag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
	GoTo _0087

_0083:
	ClearFlag FLAG_HIDE_MOM_GIFT_DELIVERYMAN
_0087:
	MysteryGift SCR_MG_HAS_GIFT, VAR_MYSTERY_GIFT_CHECK
	Compare VAR_MYSTERY_GIFT_CHECK, FALSE
	GoToIfNe _00A4
	SetFlag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
	GoTo _00A8

_00A4:
	ClearFlag FLAG_HIDE_MYSTERY_GIFT_DELIVERYMAN
_00A8:
	SetVar VAR_UNK_40E5, 2
	MysteryGift SCR_MG_END
	End

scr_seq_0144_001:
	MysteryGift SCR_MG_BEGIN
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	MysteryGift SCR_MG_HAS_GIFT, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, FALSE
	GoToIfEq _016D
	ScrCmd_379 VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 0, _00FD
	Case 1, _0109
	GoTo _0115

_00FD:
	BufferPlayersName 0
	NPCMsg msg_0209_00000
	GoTo _0121

_0109:
	BufferPlayersName 0
	NPCMsg msg_0209_00001
	GoTo _0121

_0115:
	BufferPlayersName 0
	NPCMsg msg_0209_00002
	GoTo _0121

_0121:
	MysteryGift SCR_MG_CAN_RECEIVE, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, FALSE
	GoToIfEq _0157
	PlayFanfare SEQ_ME_ITEM
	MysteryGift SCR_MG_MESSAGE_RECEIVED, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	MsgBoxExtern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	WaitFanfare
	NPCMsg msg_0209_00020
	WaitButton
	MysteryGift SCR_MG_RECEIVE
	GoTo _0182

_0157:
	MysteryGift SCR_MG_MESSAGE_FAILED, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	MsgBoxExtern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	WaitButton
	GoTo _0178

_016D:
	NPCMsg msg_0209_00003
	WaitButton
	GoTo _0178

_0178:
	CloseMsg
	ReleaseAll
	MysteryGift SCR_MG_END
	End

_0182:
	CloseMsg
	ReleaseAll
	MysteryGift SCR_MG_END2
	End

scr_seq_0144_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	MomGiftCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0232
	ScrCmd_379 VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_RESULT
	Case 0, _01CF
	Case 1, _01DB
	GoTo _01E7

_01CF:
	BufferPlayersName 0
	NPCMsg msg_0209_00027
	GoTo _01F3

_01DB:
	BufferPlayersName 0
	NPCMsg msg_0209_00028
	GoTo _01F3

_01E7:
	BufferPlayersName 0
	NPCMsg msg_0209_00029
	GoTo _01F3

_01F3:
	ScrCmd_811 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0222
	CallStd std_give_item_verbose
	ScrCmd_812
	ScrCmd_149 12
	NPCMsg msg_0209_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0222:
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0209_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0232:
	NPCMsg msg_0209_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
