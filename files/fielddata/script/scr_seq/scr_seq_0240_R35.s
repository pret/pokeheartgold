#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R35.h"
#include "msgdata/msg/msg_0387_R35.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R35_000
	ScrDef scr_seq_R35_001
	ScrDef scr_seq_R35_002
	ScrDef scr_seq_R35_003
	ScrDef scr_seq_R35_004
	ScrDefEnd

scr_seq_R35_001:
	GoToIfUnset FLAG_UNK_189, _0027
	ClearFlag FLAG_UNK_189
	End

_0027:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _005C
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _005C
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _005C
	SetFlag FLAG_HIDE_CAMERON
	GoTo _0060

_005C:
	ClearFlag FLAG_HIDE_CAMERON
_0060:
	ScrCmd_379 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _0088
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _0088
	ClearFlag FLAG_UNK_1CD
	SetFlag FLAG_UNK_1CE
	End

_0088:
	ClearFlag FLAG_UNK_1CE
	SetFlag FLAG_UNK_1CD
	End

scr_seq_R35_003:
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
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _010B
	ApplyMovement obj_player, _01C0
	ApplyMovement obj_R35_gsmiddleman1, _01F4
	GoTo _0136

_010B:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0126
	ApplyMovement obj_player, _01D4
	GoTo _0136

_0126:
	ApplyMovement obj_player, _01E0
	ApplyMovement obj_R35_gsmiddleman1, _01F4
_0136:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _015D
	ApplyMovement obj_partner_poke, _0200
	WaitMovement
_015D:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 11
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
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01E0:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F4:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0200:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R35_000:
	DirectionSignpost msg_0387_R35_00028, 1, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R35_004:
	DirectionSignpost msg_0387_R35_00029, 1, 19, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R35_002:
	SimpleNPCMsg msg_0387_R35_00021
	End
	.balign 4, 0
