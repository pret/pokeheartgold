#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W21.h"
#include "msgdata/msg/msg_0743_W21.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_W21_000
	ScrDef scr_seq_W21_001
	ScrDefEnd

scr_seq_W21_001:
	GoToIfUnset FLAG_UNK_189, _001B
	ClearFlag FLAG_UNK_189
	End

_001B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _003F
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _003F
	SetFlag FLAG_HIDE_CAMERON
	End

_003F:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_W21_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0152
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0166
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00BE
	ApplyMovement obj_player, _017C
	ApplyMovement obj_W21_gsmiddleman1, _01B0
	GoTo _00F1

_00BE:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _00E1
	ApplyMovement obj_player, _019C
	ApplyMovement obj_W21_gsmiddleman1, _01B0
	GoTo _00F1

_00E1:
	ApplyMovement obj_player, _0188
	ApplyMovement obj_W21_gsmiddleman1, _01B0
_00F1:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0118
	ApplyMovement obj_partner_poke, _01BC
	WaitMovement
_0118:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 74
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

_0152:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0166:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_017C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_019C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01B0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01BC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
