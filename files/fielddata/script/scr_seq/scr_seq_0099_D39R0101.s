#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0101.h"
#include "msgdata/msg/msg_0122_D39R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D39R0101_000
	ScrDef scr_seq_D39R0101_001
	ScrDef scr_seq_D39R0101_002
	ScrDef scr_seq_D39R0101_003
	ScrDef scr_seq_D39R0101_004
	ScrDefEnd

scr_seq_D39R0101_001:
	GoToIfUnset FLAG_UNK_189, _0027
	ClearFlag FLAG_UNK_189
	End

_0027:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _004B
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _004B
	SetFlag FLAG_HIDE_CAMERON
	End

_004B:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D39R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4100, 1
	GoToIfEq _008A
	GoToIfSet FLAG_HIDE_ITEMBALL_D39R0101_HM07, _0084
	NPCMsg msg_0122_D39R0101_00001
	CloseMsg
	ApplyMovement obj_D39R0101_gsmiddleman1, _0114
	WaitMovement
	ReleaseAll
	End

_0084:
	SetVar VAR_UNK_4100, 1
_008A:
	NPCMsg msg_0122_D39R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D39R0101_004:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_HIDE_ITEMBALL_D39R0101_HM07, _00E5
	ApplyMovement obj_D39R0101_gsmiddleman1, _0108
	ApplyMovement obj_player, _011C
	WaitMovement
	NPCMsg msg_0122_D39R0101_00001
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D39R0101_gsmiddleman1, _0114
	ApplyMovement obj_player, _0128
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

_00E5:
	ApplyMovement obj_D39R0101_gsmiddleman1, _0108
	ApplyMovement obj_player, _011C
	WaitMovement
	NPCMsg msg_0122_D39R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_4100, 1
	End

	.balign 4, 0
_0108:
	FaceNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0114:
	FaceSouth
	EndMovement

	.balign 4, 0
_011C:
	Delay8 2
	FaceSouth
	EndMovement

	.balign 4, 0
_0128:
	WalkNormalWest
	EndMovement

scr_seq_D39R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	CallStd std_play_kimono_girl_music
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0157
	GoTo _0169

_0151:
	GoTo _0157

_0157:
	BufferPlayersName 0
	NPCMsg msg_0122_D39R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	CallStd std_fade_end_kimono_girl_music
	End

_0169:
	BufferPlayersName 0
	NPCMsg msg_0122_D39R0101_00004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0193
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01F3
	End

_0193:
	PlaySE SEQ_SE_DP_WALL_HIT
	NPCMsg msg_0122_D39R0101_00005
	CloseMsg
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ApplyMovement obj_D39R0101_dancer, _021C
	ApplyMovement 241, _0244
	WaitMovement
	NPCMsg msg_0122_D39R0101_00007
	CloseMsg
	ApplyMovement obj_D39R0101_dancer, _023C
	WaitMovement
	HidePerson obj_D39R0101_dancer
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	CallStd std_fade_end_kimono_girl_music
	SetFlag FLAG_UNK_239
	SetVar VAR_UNK_40E8, 1
	ApplyMovement 241, _024C
	WaitMovement
	ScrCmd_103
	ReleaseAll
	End

_01F3:
	NPCMsg msg_0122_D39R0101_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0193
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01F3
	End

	.balign 4, 0
_021C:
	PauseAnimation 0
	WalkFastSouth 5
	ResumeAnimation 0
	WalkNormalSouth 2
	WalkOnSpotNormalSouth
	Delay8
	WalkOnSpotNormalNorth 2
	EndMovement

	.balign 4, 0
_023C:
	WalkNormalSouth 4
	EndMovement

	.balign 4, 0
_0244:
	WalkFastSouth 4
	EndMovement

	.balign 4, 0
_024C:
	WalkFastNorth 4
	EndMovement

	.balign 4, 0
_0254:
	FaceSouth
	EndMovement

scr_seq_D39R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0384
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0398
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02D5
	ApplyMovement obj_player, _03AC
	ApplyMovement obj_D39R0101_gsmiddleman1_2, _03F8
	GoTo _0323

_02D5:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02F0
	ApplyMovement obj_player, _03C4
	GoTo _0323

_02F0:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0313
	ApplyMovement obj_player, _03E4
	ApplyMovement obj_D39R0101_gsmiddleman1_2, _03F8
	GoTo _0323

_0313:
	ApplyMovement obj_player, _03D0
	ApplyMovement obj_D39R0101_gsmiddleman1_2, _03F8
_0323:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _034A
	ApplyMovement obj_partner_poke, _0404
	WaitMovement
_034A:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 43
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

_0384:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0398:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_03AC:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03C4:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03D0:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03E4:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03F8:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0404:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
