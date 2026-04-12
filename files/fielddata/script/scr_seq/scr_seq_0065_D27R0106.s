#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0106.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D27R0106_000
	ScrDef scr_seq_D27R0106_001
	ScrDefEnd

scr_seq_D27R0106_001:
	GoToIfUnset FLAG_UNK_189, _001B
	ClearFlag FLAG_UNK_189
	End

_001B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _003F
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _003F
	SetFlag FLAG_HIDE_CAMERON
	End

_003F:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D27R0106_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0127
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _013B
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00B6
	ApplyMovement obj_player, _0150
	GoTo _00C6

_00B6:
	ApplyMovement obj_player, _015C
	ApplyMovement obj_D27R0106_gsmiddleman1, _0170
_00C6:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00ED
	ApplyMovement obj_partner_poke, _017C
	WaitMovement
_00ED:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 27
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

_0127:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013B:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0150:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_015C:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0170:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_017C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
