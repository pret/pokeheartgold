#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R12.h"
#include "msgdata/msg/msg_0348_R12.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R12_000
	ScrDef scr_seq_R12_001
	ScrDef scr_seq_R12_002
	ScrDef scr_seq_R12_003
	ScrDef scr_seq_R12_004
	ScrDef scr_seq_R12_005
	ScrDefEnd

scr_seq_R12_001:
	GoToIfUnset FLAG_UNK_189, _002B
	ClearFlag FLAG_UNK_189
	End

_002B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _004F
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _004F
	SetFlag FLAG_HIDE_CAMERON
	End

_004F:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_R12_004:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _006D
	GoToIfSet FLAG_SNORLAX_MEET, _0087
	End

_006D:
	SetFlag FLAG_HIDE_ROUTE_12_SNORLAX
	HidePerson obj_R12_kabigon
	HidePerson obj_R12_gsbabyboy1
	HidePerson obj_R12_gsbabyboy1_2
	HidePerson obj_R12_gsbabyboy1_3
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

_0087:
	End

scr_seq_R12_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01B1
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01C5
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0102
	ApplyMovement obj_player, _01DC
	ApplyMovement obj_R12_gsmiddleman1, _0228
	GoTo _0150

_0102:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _011D
	ApplyMovement obj_player, _01F4
	GoTo _0150

_011D:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0140
	ApplyMovement obj_player, _0214
	ApplyMovement obj_R12_gsmiddleman1, _0228
	GoTo _0150

_0140:
	ApplyMovement obj_player, _0200
	ApplyMovement obj_R12_gsmiddleman1, _0228
_0150:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0177
	ApplyMovement obj_partner_poke, _0234
	WaitMovement
_0177:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 59
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

_01B1:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01C5:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_01DC:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0200:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0214:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0228:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0234:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R12_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	RadioMusicIsPlaying 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0268
	NPCMsg msg_0348_R12_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0268:
	PlayCry SPECIES_SNORLAX, 0
	NPCMsg msg_0348_R12_00003
	WaitCry
	CloseMsg
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_SNORLAX, 50, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02AE
	GetStaticEncounterOutcome VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 4
	CallIfEq _02B4
	SetFlag FLAG_SNORLAX_MEET
	ReleaseAll
	End

_02AE:
	WhiteOut
	ReleaseAll
	End

_02B4:
	SetFlag FLAG_CAUGHT_SNORLAX
	Return

_02BA:
	ReleaseAll
	End

scr_seq_R12_002:
	DirectionSignpost msg_0348_R12_00000, 1, 3, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R12_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0348_R12_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
