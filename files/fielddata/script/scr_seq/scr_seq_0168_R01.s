#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R01.h"
#include "msgdata/msg/msg_0319_R01.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R01_000
	ScrDef scr_seq_R01_001
	ScrDef scr_seq_R01_002
	ScrDefEnd

scr_seq_R01_001:
	GoToIfUnset FLAG_UNK_189, _001F
	ClearFlag FLAG_UNK_189
	End

_001F:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0050
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0050
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _0050
	SetFlag FLAG_HIDE_CAMERON
	End

_0050:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_R01_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _015B
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _016F
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _00CF
	ApplyMovement obj_player, _01BC
	ApplyMovement obj_R01_gsmiddleman1, _01D0
	GoTo _00FA

_00CF:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00EA
	ApplyMovement obj_player, _019C
	GoTo _00FA

_00EA:
	ApplyMovement obj_player, _01A8
	ApplyMovement obj_R01_gsmiddleman1, _01D0
_00FA:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0121
	ApplyMovement obj_partner_poke, _01DC
	WaitMovement
_0121:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 72
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

_015B:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_016F:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0184:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_019C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01A8:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01BC:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01D0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01DC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R01_002:
	DirectionSignpost msg_0319_R01_00000, 1, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
