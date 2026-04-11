#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22FS0101.h"
#include "msgdata/msg/msg_0557_T22FS0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22FS0101_000
	ScrDef scr_seq_T22FS0101_001
	ScrDef scr_seq_T22FS0101_002
	ScrDef scr_seq_T22FS0101_003
	ScrDef scr_seq_T22FS0101_004
	ScrDefEnd

scr_seq_T22FS0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 1
	CallStd std_pokemart
	ReleaseAll
	End

scr_seq_T22FS0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 1
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T22FS0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_06F, _0115
	BufferPlayersName 0
	GenderMsgBox msg_0557_T22FS0101_00002, msg_0557_T22FS0101_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00F7
_007D:
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _0106
	GiveTogepiEgg
	SetFlag FLAG_GOT_EGG_FROM_ELMS_ASSISTANT
	BufferPlayersName 0
	NPCMsg msg_0557_T22FS0101_00004
	PlayFanfare SEQ_ME_TAMAGO_GET
	WaitFanfare
	GenderMsgBox msg_0557_T22FS0101_00005, msg_0557_T22FS0101_00006
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _00C5
	ApplyMovement obj_T22FS0101_assistantm, _014C
	GoTo _00CD

_00C5:
	ApplyMovement obj_T22FS0101_assistantm, _0140
_00CD:
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_T22FS0101_assistantm
	WaitSE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_HIDE_VIOLET_SHOP_LAB_AIDE
	ReleaseAll
	SetVar VAR_SCENE_VIOLET_CITY_OW, 3
	ClearFlag FLAG_HIDE_VIOLET_KIMONO_GIRL
	ClearFlag FLAG_HIDE_ELMS_LAB_AIDE
	SetVar VAR_SCENE_ELMS_LAB, 7
	End

_00F7:
	NPCMsg msg_0557_T22FS0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_UNK_06F
	End

_0106:
	NPCMsg msg_0557_T22FS0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_UNK_06F
	End

_0115:
	BufferPlayersName 0
	GenderMsgBox msg_0557_T22FS0101_00009, msg_0557_T22FS0101_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _007D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00F7
	End

	.balign 4, 0
_0140:
	WalkNormalWest 2
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_014C:
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth
	EndMovement

scr_seq_T22FS0101_003:
	SimpleNPCMsg msg_0557_T22FS0101_00000
	End

scr_seq_T22FS0101_004:
	SimpleNPCMsg msg_0557_T22FS0101_00001
	End
	.balign 4, 0
