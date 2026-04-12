#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W40.h"
#include "msgdata/msg/msg_0744_W40.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_W40_000
	ScrDef scr_seq_W40_001
	ScrDef scr_seq_W40_002
	ScrDef scr_seq_W40_003
	ScrDef scr_seq_W40_004
	ScrDef scr_seq_W40_005
	ScrDef scr_seq_W40_006
	ScrDef scr_seq_W40_007
	ScrDef scr_seq_W40_008
	ScrDef scr_seq_W40_009
	ScrDefEnd

scr_seq_W40_000:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _0045
	ClearFlag FLAG_UNK_206
	GoTo _0049

_0045:
	SetFlag FLAG_UNK_206
_0049:
	End

scr_seq_W40_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8002
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_ALERT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0171
	GoToIfSet FLAG_DAILY_GOT_SHOCK_RIBBON, _0185
	Compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	GoToIfEq _011F
	GoToIfSet FLAG_GOT_SHARP_BEAK_FROM_MONICA, _0101
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00B2
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	GoTo _00F9

_00B2:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	GoToIfNoItemSpace ITEM_SHARP_BEAK, 1, _0115
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_SHARP_BEAK_FROM_MONICA
	AddVar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
_00F9:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0101:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0115:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_011F:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0142
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	GoTo _00F9

_0142:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 28
	BufferMonSpeciesName 0, VAR_SPECIAL_x8002
	MsgBoxExtern VAR_SPECIAL_RESULT, 30
	GiveRibbon VAR_SPECIAL_x8002, RIBBON_ALERT
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_DAILY_GOT_SHOCK_RIBBON
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0171:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 29
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0185:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 31
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_W40_008:
	ScrCmd_609
	LockAll
	ApplyMovement obj_W40_gsmiddleman1, _02C8
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8000, 252
	GoToIfNe _01C8
	ApplyMovement obj_W40_gsmiddleman1, _02D4
	GoTo _0206

_01C8:
	Compare VAR_SPECIAL_x8000, 253
	GoToIfNe _01E3
	ApplyMovement obj_W40_gsmiddleman1, _02E0
	GoTo _0206

_01E3:
	Compare VAR_SPECIAL_x8000, 254
	GoToIfNe _01FE
	ApplyMovement obj_W40_gsmiddleman1, _02F4
	GoTo _0206

_01FE:
	ApplyMovement obj_W40_gsmiddleman1, _0308
_0206:
	WaitMovement
	ScrCmd_729 VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _0223
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
_0223:
	ApplyMovement obj_W40_gsmiddleman1, _031C
	ApplyMovement obj_player, _02B8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0744_W40_00015
	CloseMsg
	ApplyMovement obj_W40_gsmiddleman1, _02C8
	WaitMovement
	NPCMsg msg_0744_W40_00016
	CloseMsg
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8000, 252
	GoToIfNe _0274
	ApplyMovement obj_W40_gsmiddleman1, _0324
	GoTo _02B2

_0274:
	Compare VAR_SPECIAL_x8000, 253
	GoToIfNe _028F
	ApplyMovement obj_W40_gsmiddleman1, _0330
	GoTo _02B2

_028F:
	Compare VAR_SPECIAL_x8000, 254
	GoToIfNe _02AA
	ApplyMovement obj_W40_gsmiddleman1, _0344
	GoTo _02B2

_02AA:
	ApplyMovement obj_W40_gsmiddleman1, _0358
_02B2:
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_02B8:
	LockDir
	WalkNormalNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_02C8:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_02D4:
	WalkFastNorth 5
	WalkOnSpotNormalNorth 2
	EndMovement

	.balign 4, 0
_02E0:
	WalkFastNorth 2
	WalkFastEast
	WalkFastNorth 3
	WalkOnSpotNormalNorth 2
	EndMovement

	.balign 4, 0
_02F4:
	WalkFastNorth 2
	WalkFastEast 2
	WalkFastNorth 3
	WalkOnSpotNormalNorth 2
	EndMovement

	.balign 4, 0
_0308:
	WalkFastNorth 2
	WalkFastEast 3
	WalkFastNorth 3
	WalkOnSpotNormalNorth 2
	EndMovement

	.balign 4, 0
_031C:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0324:
	WalkFastSouth 6
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0330:
	WalkFastSouth 3
	WalkFastWest
	WalkFastSouth 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0344:
	WalkFastSouth 3
	WalkFastWest 2
	WalkFastSouth 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0358:
	WalkFastSouth 3
	WalkFastWest 3
	WalkFastSouth 3
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_W40_007:
	SimpleNPCMsg msg_0744_W40_00018
	End

scr_seq_W40_002:
	DirectionSignpost msg_0744_W40_00019, 1, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_W40_009:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0744_W40_00020, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_W40_003:
	SimpleNPCMsg msg_0744_W40_00000
	End

scr_seq_W40_004:
	SimpleNPCMsg msg_0744_W40_00006
	End

scr_seq_W40_005:
	SimpleNPCMsg msg_0744_W40_00003
	End

scr_seq_W40_006:
	SimpleNPCMsg msg_0744_W40_00009
	End
	.balign 4, 0
