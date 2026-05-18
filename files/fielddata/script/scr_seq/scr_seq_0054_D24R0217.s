#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0217.h"
#include "msgdata/msg/msg_0085_D24R0217.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0217_000
	ScrDef scr_seq_D24R0217_001
	ScrDef scr_seq_D24R0217_002
	ScrDef scr_seq_D24R0217_003
	ScrDefEnd

scr_seq_D24R0217_002:
	GoToIfUnset FLAG_UNK_189, _0023
	ClearFlag FLAG_UNK_189
	End

_0023:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0061
	GetWeekday VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0067
	Compare VAR_TEMP_x4001, 2
	GoToIfEq _0067
	Compare VAR_TEMP_x4001, 4
	GoToIfEq _0067
_0061:
	SetFlag FLAG_HIDE_CAMERON
	End

_0067:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D24R0217_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0085_D24R0217_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D24R0217_001:
	End

scr_seq_D24R0217_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0197
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01AB
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00F9
	ApplyMovement obj_player, _01C0
	ApplyMovement obj_D24R0217_gsmiddleman1, _020C
	GoTo _0147

_00F9:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0114
	ApplyMovement obj_player, _01D8
	GoTo _0147

_0114:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0137
	ApplyMovement obj_player, _01F8
	ApplyMovement obj_D24R0217_gsmiddleman1, _020C
	GoTo _0147

_0137:
	ApplyMovement obj_player, _01E4
	ApplyMovement obj_D24R0217_gsmiddleman1, _020C
_0147:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_partner_poke, _0218
	WaitMovement
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

_0197:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01AB:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_01C0:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01D8:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01E4:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F8:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_020C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0218:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
