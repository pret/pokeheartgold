#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24.h"
#include "msgdata/msg/msg_0572_T24.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T24_000
	ScrDef scr_seq_T24_001
	ScrDef scr_seq_T24_002
	ScrDef scr_seq_T24_003
	ScrDef scr_seq_T24_004
	ScrDef scr_seq_T24_005
	ScrDef scr_seq_T24_006
	ScrDef scr_seq_T24_007
	ScrDef scr_seq_T24_008
	ScrDef scr_seq_T24_009
	ScrDef scr_seq_T24_010
	ScrDef scr_seq_T24_011
	ScrDef scr_seq_T24_012
	ScrDef scr_seq_T24_013
	ScrDef scr_seq_T24_014
	ScrDef scr_seq_T24_015
	ScrDefEnd

scr_seq_T24_005:
	ClearFlag FLAG_SYS_CIANWOOD_WATERFALL_DISABLE
	SetVar VAR_UNK_40EB, 0
	End

scr_seq_T24_006:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T24_middlewoman1_2, _00C4
	ApplyMovement obj_player, _00E4
	WaitMovement
	NPCMsg msg_0572_T24_00002
	GoToIfNoItemSpace ITEM_HM02, 1, _00B8
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_HM02
	SetVar VAR_UNK_4116, 2
	NPCMsg msg_0572_T24_00004
	WaitButton
	CloseMsg
	ApplyMovement obj_T24_middlewoman1_2, _00D8
	WaitMovement
	Compare VAR_MIDGAME_BADGES, 4
	GoToIfEq _00F0
	ReleaseAll
	End

_00B8:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_00C4:
	WalkOnSpotFastNorth
	EmoteExclamationMark
	WalkNormalNorth 2
	FaceWest
	EndMovement

	.balign 4, 0
_00D8:
	WalkNormalSouth 2
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_00E4:
	Delay16 3
	FaceEast
	EndMovement

_00F0:
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 2
	SetFlag FLAG_UNK_0C5
	SetFlag FLAG_ROCKET_TAKEOVER_ACTIVE
	Compare VAR_UNK_40F8, 0
	GoToIfNe _0111
	SetVar VAR_UNK_40F8, 2
_0111:
	PhoneCall PHONE_CONTACT_PROF__ELM, 2, 2
	SetVar VAR_MIDGAME_BADGES, 5
	ReleaseAll
	End

	.balign 4, 0
_0134:
	EmoteExclamationMark
	EndMovement

scr_seq_T24_001:
	End

scr_seq_T24_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0310
	WaitMovement
	PlayCry SPECIES_SUICUNE, 0
	Release obj_T24_tsure_poke_static_suicune
	ScrCmd_523 obj_T24_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_T24_tsure_poke_static_suicune
	WaitCry
	ApplyMovement obj_T24_tsure_poke_static_suicune, _02F4
	WaitMovement
	ApplyMovement obj_T24_tsure_poke_static_suicune, _0338
	ApplyMovement obj_player, _0320
	WaitMovement
	Wait 30, VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T24_tsure_poke_static_suicune, _0300
	ApplyMovement obj_player, _0344
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	HidePerson obj_T24_tsure_poke_static_suicune
	SetFlag FLAG_HIDE_CIANWOOD_SUICUNE
	AddVar VAR_UNK_4076, 1
	ClearFlag FLAG_HIDE_CIANWOOD_EUSINE
	ShowPerson obj_T24_minaki
	CallStd std_play_eusine_music
	ApplyMovement obj_T24_minaki, _0358
	ApplyMovement obj_player, _036C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0572_T24_00015
	WaitABPress
	CloseMsg
	TrainerBattle TRAINER_MYSTERY_MAN_EUSINE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0227
	BufferPlayersName 0
	NPCMsg msg_0572_T24_00016
	CloseMsg
	ApplyMovement obj_T24_minaki, _037C
	WaitMovement
	HidePerson obj_T24_minaki
	SetFlag FLAG_HIDE_CIANWOOD_EUSINE
	ClearFlag FLAG_HIDE_ROUTE_42_SUICUNE
	SetVar VAR_UNK_4092, 1
	ReleaseAll
	End

_0227:
	HidePerson obj_T24_minaki
	SetFlag FLAG_HIDE_CIANWOOD_EUSINE
	ClearFlag FLAG_HIDE_ROUTE_42_SUICUNE
	SetVar VAR_UNK_4092, 1
	WhiteOut
	ReleaseAll
scr_seq_T24_003:
	End

scr_seq_T24_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GAME_CLEAR, _0276
	GoToIfSet FLAG_GOT_HM02, _026B
	NPCMsg msg_0572_T24_00000
	NPCMsg msg_0572_T24_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026B:
	NPCMsg msg_0572_T24_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0276:
	CheckRegisteredPhoneNumber PHONE_CONTACT_CHUCK, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _02CD
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _02E9
	NPCMsg msg_0572_T24_00007
_0299:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02BD
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _02D8
	End

_02BD:
	BufferPlayersName 0
	NPCMsg msg_0572_T24_00008
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_CHUCK
_02CD:
	NPCMsg msg_0572_T24_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02D8:
	SetVar VAR_TEMP_x4002, 1
	NPCMsg msg_0572_T24_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02E9:
	NPCMsg msg_0572_T24_00011
	GoTo _0299
	End

	.balign 4, 0
_02F4:
	MoveAction_111 1
	EndMovement
	End

	.balign 4, 0
_0300:
	MoveAction_112 1
	SetInvisible
	EndMovement
	End

	.balign 4, 0
_0310:
	FaceNorth
	EmoteExclamationMark
	EndMovement
	End

	.balign 4, 0
_0320:
	FaceNorth
	EndMovement
	End

	.balign 4, 0
_032C:
	FaceEast
	EndMovement
	End

	.balign 4, 0
_0338:
	FaceSouth
	EndMovement
	End

	.balign 4, 0
_0344:
	FaceEast
	Delay8
	WalkNormalEast 2
	EndMovement
	End

	.balign 4, 0
_0358:
	WalkNormalNorth 5
	WalkNormalEast 2
	WalkNormalNorth 2
	EndMovement
	End

	.balign 4, 0
_036C:
	Delay8 6
	FaceSouth
	EndMovement
	End

	.balign 4, 0
_037C:
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth 5
	EndMovement
	End

scr_seq_T24_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 6
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _047B
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0481
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 7
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _03FF
	ApplyMovement obj_player, _0498
	GoTo _0422

_03FF:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _041A
	ApplyMovement obj_player, _04B0
	GoTo _0422

_041A:
	ApplyMovement obj_player, _04BC
_0422:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0449
	ApplyMovement obj_partner_poke, _04D0
	WaitMovement
_0449:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 35
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 8
	WaitButton
	CloseMsg
	ReleaseAll
	End

_047B:
	CloseMsg
	ReleaseAll
	End

_0481:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 9
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0498:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04B0:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04BC:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04D0:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T24_008:
	DirectionSignpost msg_0572_T24_00018, 0, 15, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T24_009:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0572_T24_00019, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T24_010:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0572_T24_00020, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T24_011:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0572_T24_00021, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T24_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0572_T24_00022, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T24_012:
	SimpleNPCMsg msg_0572_T24_00012
	End

scr_seq_T24_013:
	SimpleNPCMsg msg_0572_T24_00013
	End

scr_seq_T24_014:
	SimpleNPCMsg msg_0572_T24_00014
	End

scr_seq_T24_015:
	SimpleNPCMsg msg_0572_T24_00017
	End
	.balign 4, 0
