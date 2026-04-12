#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0211.h"
#include "msgdata/msg/msg_0079_D24R0211.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0211_000
	ScrDef scr_seq_D24R0211_001
	ScrDef scr_seq_D24R0211_002
	ScrDef scr_seq_D24R0211_003
	ScrDef scr_seq_D24R0211_004
	ScrDefEnd

scr_seq_D24R0211_003:
	GoToIfUnset FLAG_UNK_189, _0027
	ClearFlag FLAG_UNK_189
	End

_0027:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0065
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _006B
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _006B
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _006B
_0065:
	SetFlag FLAG_HIDE_CAMERON
	End

_006B:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D24R0211_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0079_D24R0211_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D24R0211_001:
	ScrCmd_609
	LockAll
	MovePersonFacing obj_D24R0211_gsassistantm, 25, 0, 30, DIR_NORTH
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0120
	ApplyMovement obj_D24R0211_gsassistantm, _0144
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Wait 15, VAR_SPECIAL_x8005
	NPCMsg msg_0079_D24R0211_00001
	ApplyMovement obj_D24R0211_gsassistantm, _0160
	WaitMovement
	NPCMsg msg_0079_D24R0211_00002
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_RESEARCH_CENTER, 0, 7, 4, DIR_EAST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_344 2, 2
	NPCMsg msg_0079_D24R0211_00003
	ScrCmd_527 4
	NPCMsg msg_0079_D24R0211_00005
	BufferPlayersName 0
	NPCMsg msg_0079_D24R0211_00006
	PlayFanfare SEQ_ME_LVUP
	WaitFanfare
	AddVar VAR_UNOWN_REPORT_LEVEL, 1
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0120:
	Delay4
	WalkNormalEast
	FaceSouth
	EmoteExclamationMark
	WalkNormalEast
	WalkNormalSouth 2
	WalkNormalWest 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0144:
	Delay8 4
	WalkFastNorth 4
	WalkFastEast
	WalkFastNorth 6
	WalkFastWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0160:
	FaceSouth
	EndMovement

scr_seq_D24R0211_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0290
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02A4
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01E1
	ApplyMovement obj_player, _02B8
	ApplyMovement obj_D24R0211_gsmiddleman1, _0304
	GoTo _022F

_01E1:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01FC
	ApplyMovement obj_player, _02D0
	GoTo _022F

_01FC:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _021F
	ApplyMovement obj_player, _02F0
	ApplyMovement obj_D24R0211_gsmiddleman1, _0304
	GoTo _022F

_021F:
	ApplyMovement obj_player, _02DC
	ApplyMovement obj_D24R0211_gsmiddleman1, _0304
_022F:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0256
	ApplyMovement obj_partner_poke, _0310
	WaitMovement
_0256:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 4
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

_0290:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02A4:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_02B8:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02D0:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02DC:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02F0:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0304:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0310:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D24R0211_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0290
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02A4
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0399
	ApplyMovement obj_player, _02B8
	ApplyMovement obj_D24R0211_gsmiddleman1_2, _0304
	GoTo _03E7

_0399:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _03B4
	ApplyMovement obj_player, _02D0
	GoTo _03E7

_03B4:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _03D7
	ApplyMovement obj_player, _02F0
	ApplyMovement obj_D24R0211_gsmiddleman1_2, _0304
	GoTo _03E7

_03D7:
	ApplyMovement obj_player, _02DC
	ApplyMovement obj_D24R0211_gsmiddleman1_2, _0304
_03E7:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _040E
	ApplyMovement obj_partner_poke, _0310
	WaitMovement
_040E:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 4
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
	.balign 4, 0
