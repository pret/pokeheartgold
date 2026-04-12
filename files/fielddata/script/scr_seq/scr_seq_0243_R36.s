#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R36.h"
#include "msgdata/msg/msg_0390_R36.h"
#include "constants/battle.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R36_000
	ScrDef scr_seq_R36_001
	ScrDef scr_seq_R36_002
	ScrDef scr_seq_R36_003
	ScrDef scr_seq_R36_004
	ScrDef scr_seq_R36_005
	ScrDef scr_seq_R36_006
	ScrDef scr_seq_R36_007
	ScrDef scr_seq_R36_008
	ScrDef scr_seq_R36_009
	ScrDef scr_seq_R36_010
	ScrDefEnd

scr_seq_R36_002:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0049
	ClearFlag FLAG_UNK_1C4
	GoTo _004D

_0049:
	SetFlag FLAG_UNK_1C4
_004D:
	End

scr_seq_R36_010:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _005C
	End

_005C:
	SetFlag FLAG_HIDE_ROUTE_36_SUDOWOODO
	HidePerson obj_R36_usokky
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_R36_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	GoToIfUnset FLAG_HIDE_GOLDENROD_FLOWERSHOP_GIRL, _0261
	HasItem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _009A
	ApplyMovement obj_R36_gsgirl1_2, _053C
	WaitMovement
_009A:
	PlaySE SEQ_SE_GS_KI_UGOKU
	ApplyMovement obj_R36_usokky, _038C
	WaitMovement
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00B9
	ReleaseAll
	End

_00B9:
	NPCMsg msg_0390_R36_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00E0
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _025B
	End

_00E0:
	BufferPlayersName 0
	NPCMsg msg_0390_R36_00001
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_WEST
	GoToIfNe _0109
	ApplyMovement obj_player, _039C
	GoTo _012C

_0109:
	Compare VAR_SPECIAL_RESULT, DIR_SOUTH
	GoToIfNe _0124
	ApplyMovement obj_player, _03AC
	GoTo _012C

_0124:
	ApplyMovement obj_player, _03A4
_012C:
	WaitMovement
	SetFlag FLAG_UNK_0B4
	NPCMsg msg_0390_R36_00002
	CloseMsg
	PlaySE SEQ_SE_GS_KI_UGOKU
	ApplyMovement obj_R36_usokky, _0394
	WaitMovement
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_SUDOWOODO, 20, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0255
	GetStaticEncounterOutcome VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, BATTLE_OUTCOME_DRAW
	GoToIfEq _0251
	Compare VAR_TEMP_x4001, BATTLE_OUTCOME_MON_CAUGHT
	CallIfEq _023F
	SetFlag FLAG_UNK_0B5
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfNe _01BC
	ToggleFollowingPokemonMovement FALSE
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _03B4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement TRUE
	FollowingPokemonMovement 48
	GoTo _01C6

_01BC:
	ApplyMovement obj_R36_gsgirl1_2, _0360
	WaitMovement
_01C6:
	NPCMsg msg_0390_R36_00015
	GiveItemNoCheck ITEM_BERRY_POTS, 1
	NPCMsg msg_0390_R36_00016
	NPCMsg msg_0390_R36_00017
	GiveItemNoCheck ITEM_ORAN_BERRY, 3
	GiveItemNoCheck ITEM_PECHA_BERRY, 3
	NPCMsg msg_0390_R36_00018
	CloseMsg
_0200:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0225
	ApplyMovement obj_R36_gsgirl1_2, _0378
	WaitMovement
	GoTo _022F

_0225:
	ApplyMovement obj_R36_gsgirl1_2, _0380
	WaitMovement
_022F:
	HidePerson obj_R36_gsgirl1_2
	SetFlag FLAG_HIDE_ROUTE_36_FLOWERSHOP_GIRL
	ClearFlag FLAG_HIDE_GOLDENROD_FLOWERSHOP_GIRL
	ReleaseAll
	End

_023F:
	SetFlag FLAG_CAUGHT_SUDOWOODO
	Return

	; unreferenced
	CallStd std_bag_is_full
	CloseMsg
	GoTo _0200

_0251:
	ReleaseAll
	End

_0255:
	WhiteOut
	ReleaseAll
	End

_025B:
	CloseMsg
	ReleaseAll
	End

_0261:
	PlaySE SEQ_SE_GS_KI_UGOKU
	ApplyMovement obj_R36_usokky, _038C
	WaitMovement
	NPCMsg msg_0390_R36_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0296
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _025B
	End

_0296:
	BufferPlayersName 0
	NPCMsg msg_0390_R36_00001
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _02BF
	ApplyMovement obj_player, _039C
	GoTo _02E2

_02BF:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02DA
	ApplyMovement obj_player, _03AC
	GoTo _02E2

_02DA:
	ApplyMovement obj_player, _03A4
_02E2:
	WaitMovement
	NPCMsg msg_0390_R36_00002
	CloseMsg
	PlaySE SEQ_SE_GS_KI_UGOKU
	ApplyMovement obj_R36_usokky, _0394
	WaitMovement
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_SUDOWOODO, 20, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0255
	GetStaticEncounterOutcome VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, BATTLE_OUTCOME_MON_CAUGHT
	CallIfEq _023F
	StaticWildWonOrCaughtCheck VAR_TEMP_x4000, 0
	Compare VAR_TEMP_x4000, TRUE
	GoToIfEq _0251
	ReleaseAll
	End

	.balign 4, 0
_0340: ; unreferenced
	WalkNormalNorth 2
	FaceSouth
	EndMovement

	.balign 4, 0
_034C: ; unreferenced
	Delay4 5
	WalkOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_0358: ; unreferenced
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0360:
	WalkNormalNorth 3
	FaceEast
	EndMovement

	.balign 4, 0
_036C: ; unreferenced
	Delay8
	FaceSouth
	EndMovement

	.balign 4, 0
_0378:
	WalkNormalWest 10
	EndMovement

	.balign 4, 0
_0380:
	WalkNormalSouth 2
	WalkNormalWest 10
	EndMovement

	.balign 4, 0
_038C:
	WalkOnSpotNormalNorth 3
	EndMovement

	.balign 4, 0
_0394:
	WalkOnSpotFastNorth 6
	EndMovement

	.balign 4, 0
_039C:
	WalkOnSpotSlowWest 4
	EndMovement

	.balign 4, 0
_03A4:
	WalkOnSpotSlowNorth 4
	EndMovement

	.balign 4, 0
_03AC:
	WalkOnSpotSlowSouth 4
	EndMovement

	.balign 4, 0
_03B4:
	WalkNormalSouth
	EndMovement

scr_seq_R36_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8002
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_CARELESS
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04E2
	GoToIfSet FLAG_DAILY_GOT_SHOCK_RIBBON, _04F6
	Compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	GoToIfEq _0490
	GoToIfSet FLAG_GOT_HARD_STONE_FROM_ARTHUR, _0472
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0423
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 15
	GoTo _046A

_0423:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 12
	GoToIfNoItemSpace ITEM_HARD_STONE, 1, _0486
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_HARD_STONE_FROM_ARTHUR
	AddVar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 13
_046A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0472:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 14
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0486:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0490:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _04B3
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 15
	GoTo _046A

_04B3:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 40
	BufferMonSpeciesName 0, VAR_SPECIAL_x8002
	MsgBoxExtern VAR_SPECIAL_RESULT, 42
	GiveRibbon VAR_SPECIAL_x8002, RIBBON_CARELESS
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_DAILY_GOT_SHOCK_RIBBON
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04E2:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 41
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04F6:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 43
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R36_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	HasItem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0530
	NPCMsg msg_0390_R36_00013
	GoTo _0533

_0530:
	NPCMsg msg_0390_R36_00014
_0533:
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_053C:
	FaceNorth
	EndMovement

scr_seq_R36_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetItemQuantity ITEM_HM06, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0572
	NPCMsg msg_0390_R36_00003
	GiveItemNoCheck ITEM_HM06, 1
_0572:
	NPCMsg msg_0390_R36_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End
	; unreferenced
	NPCMsg msg_0390_R36_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

	; unreferenced
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_R36_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_HIDE_ROUTE_36_SUDOWOODO, _05AE
	NPCMsg msg_0390_R36_00007
	GoTo _05B1

_05AE:
	NPCMsg msg_0390_R36_00008
_05B1:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R36_003:
	DirectionSignpost msg_0390_R36_00009, 1, 15, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R36_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0390_R36_00010, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R36_005:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0390_R36_00011, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R36_006:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0390_R36_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
