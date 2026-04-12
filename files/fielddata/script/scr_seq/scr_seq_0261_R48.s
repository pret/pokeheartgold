#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R48.h"
#include "msgdata/msg/msg_0408_R48.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R48_000
	ScrDef scr_seq_R48_001
	ScrDef scr_seq_R48_002
	ScrDefEnd

scr_seq_R48_001:
	GoToIfUnset FLAG_UNK_189, _001F
	ClearFlag FLAG_UNK_189
	End

_001F:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _0043
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0043
	SetFlag FLAG_HIDE_CAMERON
	End

_0043:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_R48_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _014E
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0162
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00C2
	ApplyMovement obj_player, _0178
	ApplyMovement obj_R48_gsmiddleman1, _01B0
	GoTo _00ED

_00C2:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00DD
	ApplyMovement obj_player, _0190
	GoTo _00ED

_00DD:
	ApplyMovement obj_player, _019C
	ApplyMovement obj_R48_gsmiddleman1, _01B0
_00ED:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0114
	ApplyMovement obj_partner_poke, _01BC
	WaitMovement
_0114:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 37
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

_014E:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0162:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0178:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0190:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_019C:
	WalkNormalNorth
	WalkNormalWest
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

scr_seq_R48_002:
	DirectionSignpost msg_0408_R48_00000, 1, 13, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
