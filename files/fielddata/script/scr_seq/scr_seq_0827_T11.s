#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11.h"
#include "msgdata/msg/msg_0529_T11.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11_000
	ScrDef scr_seq_T11_001
	ScrDef scr_seq_T11_002
	ScrDef scr_seq_T11_003
	ScrDef scr_seq_T11_004
	ScrDef scr_seq_T11_005
	ScrDef scr_seq_T11_006
	ScrDef scr_seq_T11_007
	ScrDef scr_seq_T11_008
	ScrDef scr_seq_T11_009
	ScrDef scr_seq_T11_010
	ScrDef scr_seq_T11_011
	ScrDef scr_seq_T11_012
	ScrDef scr_seq_T11_013
	ScrDef scr_seq_T11_014
	ScrDef scr_seq_T11_015
	ScrDef scr_seq_T11_016
	ScrDefEnd

scr_seq_T11_016:
	GoToIfUnset FLAG_UNK_0A0, _0055
	ClearFlag FLAG_UNK_0A0
_0055:
	GoToIfUnset FLAG_UNK_189, _0066
	ClearFlag FLAG_UNK_189
	End

_0066:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _00B5
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _00B5
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _00B5
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _00BF
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _00BF
	SetFlag FLAG_HIDE_CAMERON
	SetFlag FLAG_UNK_27F
	End

_00B5:
	ClearFlag FLAG_HIDE_CAMERON
	SetFlag FLAG_UNK_27F
	End

_00BF:
	SetFlag FLAG_HIDE_CAMERON
	ClearFlag FLAG_UNK_27F
	End

scr_seq_T11_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _034C
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0360
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0142
	ApplyMovement obj_player, _01D0
	ApplyMovement obj_T11_gsmiddleman1_2, _0208
	GoTo _016D

_0142:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _015D
	ApplyMovement obj_player, _01E8
	GoTo _016D

_015D:
	ApplyMovement obj_player, _01F4
	ApplyMovement obj_T11_gsmiddleman1_2, _0208
_016D:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0194
	ApplyMovement obj_partner_poke, _0214
	WaitMovement
_0194:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 52
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

	.balign 4, 0
_01D0:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01E8:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0208:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0214:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T11_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _034C
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0360
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _029D
	ApplyMovement obj_player, _0374
	ApplyMovement obj_T11_gsmiddleman1_3, _0208
	GoTo _02EB

_029D:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02B8
	ApplyMovement obj_player, _01E8
	GoTo _02EB

_02B8:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _02DB
	ApplyMovement obj_player, _01F4
	ApplyMovement obj_T11_gsmiddleman1_3, _0208
	GoTo _02EB

_02DB:
	ApplyMovement obj_player, _038C
	ApplyMovement obj_T11_gsmiddleman1_3, _0208
_02EB:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0312
	ApplyMovement obj_partner_poke, _0214
	WaitMovement
_0312:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 53
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

_034C:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0360:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0374:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_038C:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_T11_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_HIDE_SAFFRON_CITY_COPYCAT_HOUSE_CLEFAIRY_DOLL, _03BE
	NPCMsg msg_0529_T11_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03BE:
	NPCMsg msg_0529_T11_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T11_000:
	SimpleNPCMsg msg_0529_T11_00000
	End

scr_seq_T11_001:
	SimpleNPCMsg msg_0529_T11_00001
	End

scr_seq_T11_003:
	SimpleNPCMsg msg_0529_T11_00004
	End

scr_seq_T11_004:
	SimpleNPCMsg msg_0529_T11_00005
	End

scr_seq_T11_005:
	SimpleNPCMsg msg_0529_T11_00006
	End

scr_seq_T11_006:
	SimpleNPCMsg msg_0529_T11_00007
	End

scr_seq_T11_007:
	SimpleNPCMsg msg_0529_T11_00008
	End

scr_seq_T11_008:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0529_T11_00009, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T11_009:
	DirectionSignpost msg_0529_T11_00010, 0, 10, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T11_010:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0529_T11_00011, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T11_011:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0529_T11_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T11_012:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0529_T11_00013, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T11_013:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0529_T11_00014, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
