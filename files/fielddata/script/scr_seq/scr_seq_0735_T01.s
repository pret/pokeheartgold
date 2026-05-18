#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01.h"
#include "msgdata/msg/msg_0446_T01.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T01_000
	ScrDef scr_seq_T01_001
	ScrDef scr_seq_T01_002
	ScrDef scr_seq_T01_003
	ScrDef scr_seq_T01_004
	ScrDef scr_seq_T01_005
	ScrDef scr_seq_T01_006
	ScrDef scr_seq_T01_007
	ScrDefEnd

scr_seq_T01_007:
	GoToIfUnset FLAG_UNK_189, _0033
	ClearFlag FLAG_UNK_189
	End

_0033:
	GoToIfSet FLAG_GOT_HM08, _0044
	GoTo _004A

_0044:
	SetVar VAR_UNK_4096, 0
_004A:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _007B
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _007B
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _007B
	SetFlag FLAG_HIDE_CAMERON
	End

_007B:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T01_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01A9
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01BD
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00FA
	ApplyMovement obj_player, _01D4
	ApplyMovement obj_T01_gsmiddleman1, _0220
	GoTo _0148

_00FA:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0115
	ApplyMovement obj_player, _01EC
	GoTo _0148

_0115:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0138
	ApplyMovement obj_player, _020C
	ApplyMovement obj_T01_gsmiddleman1, _0220
	GoTo _0148

_0138:
	ApplyMovement obj_player, _01F8
	ApplyMovement obj_T01_gsmiddleman1, _0220
_0148:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _016F
	ApplyMovement obj_partner_poke, _022C
	WaitMovement
_016F:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 73
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

_01A9:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01BD:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_01D4:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01EC:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F8:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_020C:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0220:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_022C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T01_000:
	SimpleNPCMsg msg_0446_T01_00000
	End

scr_seq_T01_001:
	SimpleNPCMsg msg_0446_T01_00001
	End

scr_seq_T01_002:
	DirectionSignpost msg_0446_T01_00002, 0, 1, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T01_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0446_T01_00003, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T01_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0446_T01_00004, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T01_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0446_T01_00005, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
