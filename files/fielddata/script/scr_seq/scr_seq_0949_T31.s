#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T31.h"
#include "msgdata/msg/msg_0636_T31.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T31_000
	ScrDef scr_seq_T31_001
	ScrDef scr_seq_T31_002
	ScrDefEnd

scr_seq_T31_001:
	GoToIfUnset FLAG_UNK_189, _001F
	ClearFlag FLAG_UNK_189
	End

_001F:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _0043
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _0043
	SetFlag FLAG_HIDE_CAMERON
	End

_0043:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T31_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0171
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0185
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00C2
	ApplyMovement obj_player, _019C
	ApplyMovement obj_T31_gsmiddleman1, _01E8
	GoTo _0110

_00C2:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00DD
	ApplyMovement obj_player, _01B4
	GoTo _0110

_00DD:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0100
	ApplyMovement obj_player, _01D4
	ApplyMovement obj_T31_gsmiddleman1, _01E8
	GoTo _0110

_0100:
	ApplyMovement obj_player, _01C0
	ApplyMovement obj_T31_gsmiddleman1, _01E8
_0110:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0137
	ApplyMovement obj_partner_poke, _01F4
	WaitMovement
_0137:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 77
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

_0171:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0185:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_019C:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01B4:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01E8:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T31_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0636_T31_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
