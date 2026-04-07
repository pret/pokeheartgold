#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D11R0102_000
	ScrDef scr_seq_D11R0102_001
	ScrDefEnd

scr_seq_D11R0102_001:
	GoToIfUnset FLAG_UNK_189, _001B
	ClearFlag FLAG_UNK_189
	End

_001B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _003F
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _003F
	SetFlag FLAG_HIDE_CAMERON
	End

_003F:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D11R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _014A
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _015E
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00BE
	ApplyMovement obj_player, _0174
	ApplyMovement obj_D11R0102_gsmiddleman1, _01AC
	GoTo _00E9

_00BE:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00D9
	ApplyMovement obj_player, _018C
	GoTo _00E9

_00D9:
	ApplyMovement obj_player, _0198
	ApplyMovement obj_D11R0102_gsmiddleman1, _01AC
_00E9:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0110
	ApplyMovement obj_partner_poke, _01B8
	WaitMovement
_0110:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 75
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

_014A:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015E:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0174:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_018C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0198:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01AC:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01B8:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
