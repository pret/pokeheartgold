#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04.h"
#include "msgdata/msg/msg_0467_T04.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T04_000
	ScrDef scr_seq_T04_001
	ScrDef scr_seq_T04_002
	ScrDef scr_seq_T04_003
	ScrDef scr_seq_T04_004
	ScrDef scr_seq_T04_005
	ScrDef scr_seq_T04_006
	ScrDef scr_seq_T04_007
	ScrDef scr_seq_T04_008
	ScrDef scr_seq_T04_009
	ScrDef scr_seq_T04_010
	ScrDef scr_seq_T04_011
	ScrDef scr_seq_T04_012
	ScrDef scr_seq_T04_013
	ScrDefEnd

scr_seq_T04_012:
	GoToIfUnset FLAG_UNK_189, _004B
	ClearFlag FLAG_UNK_189
	End

_004B:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _006F
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _006F
	SetFlag FLAG_HIDE_CAMERON
	End

_006F:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T04_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RESTORED_POWER, _0093
	NPCMsg msg_0467_T04_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0093:
	NPCMsg msg_0467_T04_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04_001:
	SimpleNPCMsg msg_0467_T04_00002
	End

scr_seq_T04_002:
	SimpleNPCMsg msg_0467_T04_00005
	End

scr_seq_T04_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0467_T04_00003
	PlayCry SPECIES_SLOWBRO, 0
	WaitCry
	NPCMsg msg_0467_T04_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROUTE_24_ROCKET, 3
	GoToIfGe _012C
	Compare VAR_UNK_411C, 2
	GoToIfEq _0123
	Compare VAR_UNK_411C, 1
	GoToIfEq _011A
	NPCMsg msg_0467_T04_00006
	GoTo _012F

_011A:
	NPCMsg msg_0467_T04_00007
	GoTo _012F

_0123:
	NPCMsg msg_0467_T04_00008
	GoTo _012F

_012C:
	NPCMsg msg_0467_T04_00009
_012F:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0467_T04_00010
	NPCMsg msg_0467_T04_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04_013:
	SimpleNPCMsg msg_0467_T04_00012
	End

scr_seq_T04_006:
	DirectionSignpost msg_0467_T04_00013, 0, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T04_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0467_T04_00014, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T04_008:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0467_T04_00015, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T04_009:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0467_T04_00016, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T04_010:
	DirectionSignpost msg_0467_T04_00017, 1, 14, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T04_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02F5
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0309
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0246
	ApplyMovement obj_player, _0320
	ApplyMovement obj_T04_gsmiddleman1, _036C
	GoTo _0294

_0246:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0261
	ApplyMovement obj_player, _0338
	GoTo _0294

_0261:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0284
	ApplyMovement obj_player, _0358
	ApplyMovement obj_T04_gsmiddleman1, _036C
	GoTo _0294

_0284:
	ApplyMovement obj_player, _0344
	ApplyMovement obj_T04_gsmiddleman1, _036C
_0294:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02BB
	ApplyMovement obj_partner_poke, _0378
	WaitMovement
_02BB:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 55
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

_02F5:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0309:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0320:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0338:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0344:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0358:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_036C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0378:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

	.balign 4, 0
