#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R26.h"
#include "msgdata/msg/msg_0365_R26.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R26_000
	ScrDef scr_seq_R26_001
	ScrDef scr_seq_R26_002
	ScrDef scr_seq_R26_003
	ScrDefEnd

scr_seq_R26_001:
	GoToIfUnset FLAG_UNK_189, _0023
	ClearFlag FLAG_UNK_189
	End

_0023:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0047
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _0047
	SetFlag FLAG_HIDE_CAMERON
	End

_0047:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_R26_000:
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
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00C6
	ApplyMovement obj_player, _017C
	ApplyMovement obj_R26_gsmiddleman1, _01B4
	GoTo _00F1

_00C6:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00E1
	ApplyMovement obj_player, _0194
	GoTo _00F1

_00E1:
	ApplyMovement obj_player, _01A0
	ApplyMovement obj_R26_gsmiddleman1, _01B4
_00F1:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0118
	ApplyMovement obj_partner_poke, _01C0
	WaitMovement
_0118:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 48
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
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0194:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01A0:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01B4:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R26_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0365_R26_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R26_003:
	DirectionSignpost msg_0365_R26_00001, 1, 6, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
