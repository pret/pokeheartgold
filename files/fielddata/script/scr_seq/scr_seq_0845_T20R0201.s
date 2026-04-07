#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0201.h"
#include "msgdata/msg/msg_0545_T20R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T20R0201_000
	ScrDef scr_seq_T20R0201_001
	ScrDef scr_seq_T20R0201_002
	ScrDef scr_seq_T20R0201_003
	ScrDef scr_seq_T20R0201_004
	ScrDef scr_seq_T20R0201_005
	ScrDef scr_seq_T20R0201_006
	ScrDefEnd

scr_seq_T20R0201_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _00A4
	ApplyMovement obj_T20R0201_gsmama, _00B0
	WaitMovement
	CallStd std_play_mom_music
	Wait 30, VAR_SPECIAL_RESULT
	ApplyMovement obj_T20R0201_gsmama, _00B8
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0545_T20R0201_00000, msg_0545_T20R0201_00001
	SetFlag FLAG_GOT_BAG
	PlayFanfare SEQ_SE_PL_KIRAKIRA
	WaitFanfare
	NPCMsg msg_0545_T20R0201_00002
	SetFlag FLAG_GOT_TRAINER_CARD
	PlayFanfare SEQ_SE_PL_KIRAKIRA
	WaitFanfare
	NPCMsg msg_0545_T20R0201_00003
	SetFlag FLAG_GOT_SAVE_BUTTON
	PlayFanfare SEQ_SE_PL_KIRAKIRA
	WaitFanfare
	NPCMsg msg_0545_T20R0201_00004
	SetFlag FLAG_GOT_OPTIONS_BUTTON
	PlayFanfare SEQ_SE_PL_KIRAKIRA
	WaitFanfare
	NPCMsg msg_0545_T20R0201_00005
	CloseMsg
	Wait 15, VAR_SPECIAL_RESULT
	ApplyMovement obj_T20R0201_gsmama, _00C8
	WaitMovement
	CallStd std_fade_end_mom_music
	SetVar VAR_SCENE_PLAYERS_HOUSE_1F, 1
	ReleaseAll
	End

	.balign 4, 0
_00A4:
	Delay4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_00B0:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_00B8:
	WalkNormalNorth 2
	WalkNormalWest 3
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_00C8:
	WalkOnSpotNormalSouth
	WalkNormalSouth 3
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T20R0201_006:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _00A4
	ApplyMovement obj_T20R0201_gsmama, _00B0
	WaitMovement
	CallStd std_play_mom_music
	Wait 30, VAR_SPECIAL_RESULT
	ApplyMovement obj_T20R0201_gsmama, _00B8
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0545_T20R0201_00033
	CloseMsg
	ApplyMovement obj_T20R0201_gsmama, _00C8
	WaitMovement
	CallStd std_fade_end_mom_music
	SetVar VAR_SCENE_PLAYERS_HOUSE_1F, 4
	ReleaseAll
	End

scr_seq_T20R0201_001:
	GoToIfSet FLAG_GAME_CLEAR, _015C
	Compare VAR_SCENE_ELMS_LAB, 4
	GoToIfGe _0205
	GoToIfSet FLAG_GOT_STARTER, _0179
	SimpleNPCMsg msg_0545_T20R0201_00006
	End

_015C:
	HasItem ITEM_S_S__TICKET, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01F2
	GoTo _0205
	End

_0179:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_POKEGEAR, _01D4
	BufferPlayersName 0
	NPCMsg msg_0545_T20R0201_00007
	BufferPlayersName 0
	NPCMsg msg_0545_T20R0201_00008
	SetFlag FLAG_GOT_POKEGEAR
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	NPCMsg msg_0545_T20R0201_00009
	NPCMsg msg_0545_T20R0201_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01C6
	NPCMsg msg_0545_T20R0201_00011
	GoTo _01C9

_01C6:
	NPCMsg msg_0545_T20R0201_00012
_01C9:
	NPCMsg msg_0545_T20R0201_00013
	WaitButtonOrDpad
	CloseMsg
	ReleaseAll
	End

_01D4:
	NPCMsg msg_0545_T20R0201_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01DF:
	SimpleNPCMsg msg_0545_T20R0201_00007
	End

_01F2:
	SimpleNPCMsg msg_0545_T20R0201_00034
	End

_0205:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL, _0275
	CheckBadge BADGE_ZEPHYR, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0234
	NPCMsg msg_0545_T20R0201_00015
	GoTo _023A

_0234:
	BufferPlayersName 0
	NPCMsg msg_0545_T20R0201_00016
_023A:
	SetFlag FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL
	SetVar VAR_SCENE_ROUTE_30_PHONE_CALL, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0266
	NPCMsg msg_0545_T20R0201_00017
	SetFlag FLAG_SYS_MOMS_SAVINGS
	GoTo _026D

_0266:
	NPCMsg msg_0545_T20R0201_00018
	ClearFlag FLAG_SYS_MOMS_SAVINGS
_026D:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0275:
	NPCMsg msg_0545_T20R0201_00020
	ScrCmd_795 1, 1
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 29, 255, 0
	MenuItemAdd 30, 255, 1
	MenuItemAdd 31, 255, 2
	MenuItemAdd 32, 255, 3
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _02DF
	Case 1, _0335
	Case 2, _0398
	GoTo _03D1
	End

_02DF:
	BankOrWalletIsFull 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _043A
	CheckBankBalance VAR_SPECIAL_RESULT, 1
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _041C
	BankTransaction 1, VAR_SPECIAL_RESULT
	ScrCmd_796
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _03E0
	Case 1, _0411
	ReleaseAll
	End

_0335:
	BankOrWalletIsFull 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _042B
	HasEnoughMoneyVar VAR_SPECIAL_RESULT, 1
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0389
	BankTransaction 0, VAR_SPECIAL_RESULT
	ScrCmd_796
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _03FA
	Case 1, _0411
	ReleaseAll
	End

_0389:
	TouchscreenMenuShow
	ScrCmd_796
	NPCMsg msg_0545_T20R0201_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0398:
	NPCMsg msg_0545_T20R0201_00025
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	ScrCmd_796
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _03C2
	BufferPlayersName 0
	NPCMsg msg_0545_T20R0201_00017
	SetFlag FLAG_SYS_MOMS_SAVINGS
	GoTo _03C9

_03C2:
	NPCMsg msg_0545_T20R0201_00018
	ClearFlag FLAG_SYS_MOMS_SAVINGS
_03C9:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03D1:
	ScrCmd_796
	TouchscreenMenuShow
	NPCMsg msg_0545_T20R0201_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03E0:
	CloseMsg
	Wait 8, VAR_SPECIAL_RESULT
	PlaySE SEQ_SE_GS_OKOZUKAI
	BufferPlayersName 0
	NPCMsg msg_0545_T20R0201_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03FA:
	CloseMsg
	Wait 8, VAR_SPECIAL_RESULT
	PlaySE SEQ_SE_GS_OKOZUKAI
	NPCMsg msg_0545_T20R0201_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0411:
	NPCMsg msg_0545_T20R0201_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_041C:
	TouchscreenMenuShow
	ScrCmd_796
	NPCMsg msg_0545_T20R0201_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

_042B:
	TouchscreenMenuShow
	ScrCmd_796
	NPCMsg msg_0545_T20R0201_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

_043A:
	TouchscreenMenuShow
	ScrCmd_796
	NPCMsg msg_0545_T20R0201_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0201_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0545_T20R0201_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0201_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0545_T20R0201_00036
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0201_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0545_T20R0201_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0201_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0545_T20R0201_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
