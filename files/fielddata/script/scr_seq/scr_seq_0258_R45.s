#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R45.h"
#include "msgdata/msg/msg_0405_R45.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R45_000
	ScrDef scr_seq_R45_001
	ScrDef scr_seq_R45_002
	ScrDef scr_seq_R45_003
	ScrDef scr_seq_R45_004
	ScrDefEnd

scr_seq_R45_002:
	GoToIfUnset FLAG_UNK_189, _0027
	ClearFlag FLAG_UNK_189
	End

_0027:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _004B
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _004B
	SetFlag FLAG_HIDE_CAMERON
	End

_004B:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_R45_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0133
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0147
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00C2
	ApplyMovement obj_player, _015C
	GoTo _00D2

_00C2:
	ApplyMovement obj_player, _0168
	ApplyMovement obj_R45_gsmiddleman1, _017C
_00D2:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00F9
	ApplyMovement obj_partner_poke, _0188
	WaitMovement
_00F9:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 47
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

_0133:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0147:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_015C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0168:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_017C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0188:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R45_003:
	SimpleNPCMsg msg_0405_R45_00000
	End

scr_seq_R45_000:
	DirectionSignpost msg_0405_R45_00001, 1, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R45_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0405_R45_00002, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
