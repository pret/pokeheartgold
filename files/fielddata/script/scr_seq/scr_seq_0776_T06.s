#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T06.h"
#include "msgdata/msg/msg_0483_T06.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T06_000
	ScrDef scr_seq_T06_001
	ScrDef scr_seq_T06_002
	ScrDef scr_seq_T06_003
	ScrDef scr_seq_T06_004
	ScrDef scr_seq_T06_005
	ScrDef scr_seq_T06_006
	ScrDef scr_seq_T06_007
	ScrDef scr_seq_T06_008
	ScrDef scr_seq_T06_009
	ScrDef scr_seq_T06_010
	ScrDef scr_seq_T06_011
	ScrDef scr_seq_T06_012
	ScrDef scr_seq_T06_013
	ScrDefEnd

scr_seq_T06_009:
	GoToIfUnset FLAG_UNK_189, _004B
	ClearFlag FLAG_UNK_189
	End

_004B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0066
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0081

_0066:
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _007D
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0081

_007D:
	SetFlag FLAG_HIDE_CAMERON
_0081:
	SetVar VAR_UNK_4085, 0
	End

scr_seq_T06_013:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T06_daigo, _016C
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0190
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0483_T06_00016
	CloseMsg
	ApplyMovement obj_T06_daigo, _0180
	WaitMovement
	GetGameVersion VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 8
	GoToIfEq _0109
	ScrCmd_452 SPECIES_LATIAS, 1
	NPCMsg msg_0483_T06_00017
	CloseMsg
	CreateRoamer 2
	ScrCmd_453
	ApplyMovement obj_T06_daigo, _0180
	WaitMovement
	NPCMsg msg_0483_T06_00019
	CloseMsg
	ApplyMovement obj_T06_daigo, _0180
	WaitMovement
	NPCMsg msg_0483_T06_00021
	CloseMsg
	GoTo _013F
	End

_0109:
	ScrCmd_452 SPECIES_LATIOS, 0
	NPCMsg msg_0483_T06_00018
	CloseMsg
	CreateRoamer 3
	ScrCmd_453
	ApplyMovement obj_T06_daigo, _0180
	WaitMovement
	NPCMsg msg_0483_T06_00020
	CloseMsg
	ApplyMovement obj_T06_daigo, _0180
	WaitMovement
	NPCMsg msg_0483_T06_00022
	CloseMsg
	GoTo _013F
	End

_013F:
	ApplyMovement obj_T06_daigo, _0180
	WaitMovement
	NPCMsg msg_0483_T06_00023
	CloseMsg
	ApplyMovement obj_T06_daigo, _0188
	WaitMovement
	SetVar VAR_UNK_4130, 2
	HidePerson obj_T06_daigo
	SetFlag FLAG_HIDE_VERMILION_CITY_STEVEN
	ReleaseAll
	End

	.balign 4, 0
_016C:
	EmoteExclamationMark
	Delay8
	WalkNormalWest 4
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0180:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalEast 10
	EndMovement

	.balign 4, 0
_0190:
	Delay16 4
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

scr_seq_T06_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_491 247
	GoToIfSet FLAG_GOT_PP_MAX_FROM_VERMILLION_CITY_MAN, _01FF
	Compare VAR_UNK_4135, 8
	GoToIfGe _020A
	Compare VAR_UNK_4135, 5
	GoToIfGe _01F4
	Compare VAR_UNK_4135, 1
	GoToIfGe _01E9
	NPCMsg msg_0483_T06_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E9:
	NPCMsg msg_0483_T06_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01F4:
	NPCMsg msg_0483_T06_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01FF:
	NPCMsg msg_0483_T06_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_020A:
	NPCMsg msg_0483_T06_00007
	GoToIfNoItemSpace ITEM_PP_MAX, 1, _0241
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_PP_MAX_FROM_VERMILLION_CITY_MAN
	NPCMsg msg_0483_T06_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0241:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_T06_011:
	ScrCmd_609
	LockAll
	ClearFlag FLAG_HIDE_VERMILION_EUSINE
	ShowPerson obj_T06_minaki
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 1334
	GoToIfNe _0270
	GoTo _037F

_0270:
	ApplyMovement obj_player, _040C
	WaitMovement
	PlayCry SPECIES_SUICUNE, 0
	Release obj_T06_tsure_poke_static_suicune
	ScrCmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_T06_tsure_poke_static_suicune
	WaitCry
	CallStd std_play_eusine_music
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 331
	GoToIfNe _02D5
	ApplyMovement obj_player, _0460
	ApplyMovement obj_T06_minaki, _0490
	ApplyMovement obj_T06_tsure_poke_static_suicune, _0414
	GoTo _0318

_02D5:
	Compare VAR_TEMP_x4001, 332
	GoToIfNe _0300
	ApplyMovement obj_player, _0470
	ApplyMovement obj_T06_minaki, _04A0
	ApplyMovement obj_T06_tsure_poke_static_suicune, _0420
	GoTo _0318

_0300:
	ApplyMovement obj_player, _0480
	ApplyMovement obj_T06_minaki, _04B0
	ApplyMovement obj_T06_tsure_poke_static_suicune, _042C
_0318:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0483_T06_00014
	CloseMsg
	ApplyMovement obj_T06_minaki, _04D0
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0483_T06_00015
	CloseMsg
	ApplyMovement obj_T06_minaki, _04E8
	ApplyMovement obj_player, _04F0
	WaitMovement
_034D:
	CallStd std_fade_end_eusine_music
	HidePerson obj_T06_minaki
	HidePerson obj_T06_tsure_poke_static_suicune
	SetFlag FLAG_HIDE_VERMILION_EUSINE
	SetFlag FLAG_HIDE_VERMILION_EUSINE_2
	SetFlag FLAG_HIDE_VERMILION_SUICUNE
	SetVar VAR_UNK_4070, 0
	SetVar VAR_UNK_4071, 0
	ClearFlag FLAG_HIDE_ROUTE_14_SUICUNE
	SetVar VAR_UNK_4086, 1
	ReleaseAll
	End

_037F:
	ApplyMovement obj_player, _040C
	ApplyMovement obj_T06_tsure_poke_static_suicune, _0458
	WaitMovement
	PlayCry SPECIES_SUICUNE, 0
	Release obj_T06_tsure_poke_static_suicune
	ScrCmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_T06_tsure_poke_static_suicune
	WaitCry
	CallStd std_play_eusine_music
	ApplyMovement obj_T06_tsure_poke_static_suicune, _0438
	ApplyMovement obj_T06_minaki, _04C0
	ApplyMovement obj_player, _04F8
	WaitMovement
	ApplyMovement obj_T06_minaki, _04E0
	ApplyMovement obj_player, _0504
	WaitMovement
	NPCMsg msg_0483_T06_00014
	CloseMsg
	ApplyMovement obj_T06_minaki, _04D8
	WaitMovement
	NPCMsg msg_0483_T06_00015
	CloseMsg
	ApplyMovement obj_T06_minaki, _04E8
	ApplyMovement obj_player, _04F0
	WaitMovement
	GoTo _034D

	.balign 4, 0
_040C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0414:
	Delay4 9
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_0420:
	Delay4 11
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_042C:
	Delay4 13
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_0438:
	Delay4 4
	WalkFasterSouth 2
	JumpNearFastSouth
	JumpFarSouth
	WalkFasterSouth 2
	JumpNearFastSouth
	JumpFarSouth 2
	EndMovement

	.balign 4, 0
_0458:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0460:
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0470:
	WalkNormalEast 2
	WalkNormalNorth 3
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0480:
	WalkNormalEast 2
	WalkNormalNorth 4
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0490:
	Delay8
	WalkFastSouth 6
	WalkFastEast
	EndMovement

	.balign 4, 0
_04A0:
	Delay4 3
	WalkFastSouth 6
	WalkFastEast
	EndMovement

	.balign 4, 0
_04B0:
	Delay4 5
	WalkFastSouth 6
	WalkFastEast
	EndMovement

	.balign 4, 0
_04C0:
	Delay4 2
	WalkFastEast
	WalkFastSouth 2
	EndMovement

	.balign 4, 0
_04D0:
	FaceSouth
	EndMovement

	.balign 4, 0
_04D8:
	FaceEast
	EndMovement

	.balign 4, 0
_04E0:
	JumpOnSpotFastSouth 3
	EndMovement

	.balign 4, 0
_04E8:
	WalkNormalNorth 8
	EndMovement

	.balign 4, 0
_04F0:
	FaceNorth
	EndMovement

	.balign 4, 0
_04F8:
	Delay4 4
	FaceSouth
	EndMovement

	.balign 4, 0
_0504:
	FaceWest
	EndMovement

scr_seq_T06_012:
	ScrCmd_609
	LockAll
	ClearFlag FLAG_HIDE_VERMILION_EUSINE_2
	ShowPerson obj_T06_minaki_2
	ApplyMovement obj_player, _040C
	WaitMovement
	PlayCry SPECIES_SUICUNE, 0
	Release obj_T06_tsure_poke_static_suicune
	ScrCmd_523 obj_T06_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_T06_tsure_poke_static_suicune
	WaitCry
	CallStd std_play_eusine_music
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 1324
	GoToIfNe _057D
	ApplyMovement obj_T06_minaki_2, _0654
	ApplyMovement obj_player, _0630
	ApplyMovement obj_T06_tsure_poke_static_suicune, _0414
	GoTo _05C0

_057D:
	Compare VAR_TEMP_x4000, 1325
	GoToIfNe _05A8
	ApplyMovement obj_T06_minaki_2, _0668
	ApplyMovement obj_player, _063C
	ApplyMovement obj_T06_tsure_poke_static_suicune, _0420
	GoTo _05C0

_05A8:
	ApplyMovement obj_T06_minaki_2, _067C
	ApplyMovement obj_player, _0648
	ApplyMovement obj_T06_tsure_poke_static_suicune, _042C
_05C0:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0483_T06_00014
	CloseMsg
	ApplyMovement obj_T06_minaki_2, _0690
	ApplyMovement obj_player, _06A4
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0483_T06_00015
	CloseMsg
	ApplyMovement obj_T06_minaki_2, _0698
	ApplyMovement obj_player, _06AC
	WaitMovement
	CallStd std_fade_end_eusine_music
	HidePerson obj_T06_minaki_2
	HidePerson obj_T06_tsure_poke_static_suicune
	SetFlag FLAG_HIDE_VERMILION_EUSINE
	SetFlag FLAG_HIDE_VERMILION_EUSINE_2
	SetFlag FLAG_HIDE_VERMILION_SUICUNE
	SetVar VAR_UNK_4070, 0
	SetVar VAR_UNK_4071, 0
	ClearFlag FLAG_HIDE_ROUTE_14_SUICUNE
	SetVar VAR_UNK_4086, 1
	ReleaseAll
	End

	.balign 4, 0
_0630:
	WalkNormalSouth 4
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_063C:
	WalkNormalSouth 4
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0648:
	WalkNormalSouth 4
	FaceEast
	EndMovement

	.balign 4, 0
_0654:
	Delay8
	WalkFastEast 7
	WalkFastNorth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_0668:
	Delay8 2
	WalkFastEast 7
	WalkFastNorth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_067C:
	Delay8 3
	WalkFastEast 7
	WalkFastNorth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_0690:
	FaceNorth
	EndMovement

	.balign 4, 0
_0698:
	WalkNormalWest 2
	WalkNormalNorth 13
	EndMovement

	.balign 4, 0
_06A4:
	FaceSouth
	EndMovement

	.balign 4, 0
_06AC:
	Delay8 2
	FaceWest
	Delay8
	FaceNorth
	EndMovement

scr_seq_T06_001:
	SimpleNPCMsg msg_0483_T06_00000
	End

scr_seq_T06_002:
	SimpleNPCMsg msg_0483_T06_00003
	End

scr_seq_T06_003:
	SimpleNPCMsg msg_0483_T06_00001
	End

scr_seq_T06_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MACHOP, 0
	NPCMsg msg_0483_T06_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T06_005:
	DirectionSignpost msg_0483_T06_00010, 0, 6, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T06_006:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0483_T06_00011, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T06_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0483_T06_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T06_008:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0483_T06_00013, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T06_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _086F
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0883
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _07DB
	ApplyMovement obj_player, _0898
	GoTo _080E

_07DB:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _07FE
	ApplyMovement obj_player, _08B8
	ApplyMovement obj_T06_gsmiddleman1_2, _08CC
	GoTo _080E

_07FE:
	ApplyMovement obj_player, _08A4
	ApplyMovement obj_T06_gsmiddleman1_2, _08CC
_080E:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0835
	ApplyMovement obj_partner_poke, _08D8
	WaitMovement
_0835:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 50
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	WaitButton
	CloseMsg
	ReleaseAll
	End

_086F:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0883:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0898:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_08A4:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_08B8:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_08CC:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_08D8:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
