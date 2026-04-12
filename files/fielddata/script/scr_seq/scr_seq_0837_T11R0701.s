#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0701.h"
#include "msgdata/msg/msg_0537_T11R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0701_000
	ScrDef scr_seq_T11R0701_001
	ScrDef scr_seq_T11R0701_002
	ScrDef scr_seq_T11R0701_003
	ScrDef scr_seq_T11R0701_004
	ScrDef scr_seq_T11R0701_005
	ScrDefEnd

scr_seq_T11R0701_002:
	SetVar VAR_TEMP_x4008, 0
	SetVar VAR_TEMP_x4009, 0
	Compare VAR_UNK_4130, 3
	GoToIfEq _0046
	PlayerHasSpecies VAR_TEMP_x4000, SPECIES_ROTOM
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _00AB
_0046:
	SetVar VAR_TEMP_x4009, 1
	ClearFlag FLAG_UNK_281
	ClearFlag FLAG_UNK_282
	GoToIfSet FLAG_TRADE_STEVEN_FORRETRESS_BELDUM, _0099
	Compare VAR_UNK_4130, 4
	GoToIfEq _0099
	Compare VAR_UNK_4130, 1
	GoToIfLe _0099
	Compare VAR_UNK_40FD, 0
	GoToIfEq _0099
	ClearFlag FLAG_HIDE_SAFFRON_CITY_STEVEN
	Compare VAR_UNK_4130, 5
	CallIfEq _00A5
	End

_0099:
	SetFlag FLAG_HIDE_SAFFRON_CITY_STEVEN
	Call _00C3
	End

_00A5:
	SetFlag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	Return

_00AB:
	SetFlag FLAG_UNK_0A0
	SetFlag FLAG_UNK_281
	SetFlag FLAG_UNK_282
	SetFlag FLAG_HIDE_SAFFRON_CITY_STEVEN
	Call _00C3
	End

_00C3:
	SetVar VAR_TEMP_x4008, 1
	Return

scr_seq_T11R0701_005:
	Compare VAR_TEMP_x4009, 1
	GoToIfNe _00E0
	MoveWarp 1, 23, 2
_00E0:
	Compare VAR_TEMP_x4008, 0
	GoToIfNe _0106
	Compare VAR_UNK_4130, 3
	GoToIfGt _0106
	MovePersonFacing obj_T11R0701_daigo, 22, 0, 8, DIR_NORTH
_0106:
	End

scr_seq_T11R0701_000:
	SimpleNPCMsg msg_0537_T11R0701_00000
	End

scr_seq_T11R0701_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_UPGRADE_FROM_SAFFRON_CITY_GUARD, _015A
	NPCMsg msg_0537_T11R0701_00001
	GoToIfNoItemSpace ITEM_UPGRADE, 1, _0165
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_UPGRADE_FROM_SAFFRON_CITY_GUARD
_015A:
	NPCMsg msg_0537_T11R0701_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0165:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_T11R0701_004:
	GoToIfSet FLAG_GOT_HOENN_STARTER_FROM_STEVEN, _03E8
	Compare VAR_UNK_4130, 3
	GoToIfEq _039B
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_UNK_4130, 3
	NPCMsg msg_0537_T11R0701_00014
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _01B7
	ApplyMovement obj_T11R0701_daigo, _03AC
	GoTo _01DA

_01B7:
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _01D2
	ApplyMovement obj_T11R0701_daigo, _03BC
	GoTo _01DA

_01D2:
	ApplyMovement obj_T11R0701_daigo, _03B4
_01DA:
	WaitMovement
	ApplyMovement obj_T11R0701_daigo, _03C4
	WaitMovement
	NPCMsg msg_0537_T11R0701_00015
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0204
	ApplyMovement obj_T11R0701_daigo, _03AC
	GoTo _0227

_0204:
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _021F
	ApplyMovement obj_T11R0701_daigo, _03BC
	GoTo _0227

_021F:
	ApplyMovement obj_T11R0701_daigo, _03B4
_0227:
	WaitMovement
	NPCMsg msg_0537_T11R0701_00016
_022C:
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_x8004
	MenuItemAdd 17, 255, 0
	MenuItemAdd 18, 255, 1
	MenuItemAdd 19, 255, 2
	MenuItemAdd 27, 255, 3
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_x8004
	Case 3, _0346
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _033B
	Compare VAR_SPECIAL_x8004, 0
	GoToIfNe _0297
	SetVar VAR_SPECIAL_x8004, 252
	GoTo _02B6

_0297:
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _02B0
	SetVar VAR_SPECIAL_x8004, 255
	GoTo _02B6

_02B0:
	SetVar VAR_SPECIAL_x8004, 258
_02B6:
	BufferSpeciesName 1, VAR_SPECIAL_x8004, 0, 0
	BufferPlayersName 0
	NPCMsg msg_0537_T11R0701_00020
	PlayFanfare SEQ_ME_POKEGET
	NPCMsg msg_0537_T11R0701_00021
	WaitFanfare
	GiveMon VAR_SPECIAL_x8004, 5, 0, 0, 0, VAR_SPECIAL_RESULT
	TouchscreenMenuHide
	NPCMsg msg_0537_T11R0701_00025
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0351
	TouchscreenMenuShow
_02F3:
	NPCMsg msg_0537_T11R0701_00022
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0317
	ApplyMovement obj_T11R0701_daigo, _03DC
	GoTo _031F

_0317:
	ApplyMovement obj_T11R0701_daigo, _03CC
_031F:
	WaitMovement
	HidePerson obj_T11R0701_daigo
	SetFlag FLAG_HIDE_SAFFRON_CITY_STEVEN
	SetFlag FLAG_GOT_HOENN_STARTER_FROM_STEVEN
	SetVar VAR_UNK_4130, 4
	ClearFlag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	ReleaseAll
	End

_033B:
	NPCMsg msg_0537_T11R0701_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0346:
	NPCMsg msg_0537_T11R0701_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0351:
	CloseMsg
	GetPartyCount VAR_SPECIAL_RESULT
	SubVar VAR_SPECIAL_RESULT, 1
	SetVar VAR_TEMP_x4000, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_815 0
	NicknameInput VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _02F3
	NPCMsg msg_0537_T11R0701_00026
	GoTo _02F3

_039B:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0537_T11R0701_00024
	GoTo _022C

	.balign 4, 0
_03AC:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03B4:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_03BC:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_03C4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03CC:
	WalkNormalWest 2
	WalkNormalSouth 3
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_03DC:
	WalkNormalSouth 3
	WalkNormalWest 10
	EndMovement

_03E8:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_UNK_4130, 6
	Compare VAR_TEMP_x400A, 77
	GoToIfNe _040C
	NPCMsg msg_0537_T11R0701_00008
	GoTo _0415

_040C:
	NPCMsg msg_0537_T11R0701_00007
	SetVar VAR_TEMP_x400A, 77
_0415:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04EA
	NPCMsg msg_0537_T11R0701_00009
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _04EA
	LoadNPCTrade 12
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	MonGetFriendship VAR_TEMP_x4002, VAR_SPECIAL_x8004
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _04F5
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_STEVEN_FORRETRESS_BELDUM
	Compare VAR_TEMP_x4002, 200
	GoToIfLt _04A2
	NPCMsg msg_0537_T11R0701_00013
	GoTo _04A5

_04A2:
	NPCMsg msg_0537_T11R0701_00012
_04A5:
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _04C6
	ApplyMovement obj_T11R0701_daigo, _0504
	GoTo _04CE

_04C6:
	ApplyMovement obj_T11R0701_daigo, _051C
_04CE:
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	HidePerson obj_T11R0701_daigo
	SetFlag FLAG_HIDE_SAFFRON_CITY_STEVEN
	SetVar VAR_UNK_4130, 7
	ReleaseAll
	End

_04EA:
	NPCMsg msg_0537_T11R0701_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04F5:
	NPCTradeEnd
	NPCMsg msg_0537_T11R0701_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0504:
	WalkNormalWest 2
	WalkNormalSouth 5
	WalkNormalWest
	WalkNormalSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_051C:
	WalkNormalSouth 5
	WalkNormalWest 3
	WalkNormalSouth
	SetInvisible
	EndMovement

scr_seq_T11R0701_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0537_T11R0701_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
