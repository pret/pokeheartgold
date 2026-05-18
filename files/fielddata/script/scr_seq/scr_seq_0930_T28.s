#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28.h"
#include "msgdata/msg/msg_0620_T28.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T28_000
	ScrDef scr_seq_T28_001
	ScrDef scr_seq_T28_002
	ScrDef scr_seq_T28_003
	ScrDef scr_seq_T28_004
	ScrDef scr_seq_T28_005
	ScrDef scr_seq_T28_006
	ScrDef scr_seq_T28_007
	ScrDef scr_seq_T28_008
	ScrDefEnd

scr_seq_T28_005:
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 2
	SetFlag FLAG_UNK_0C5
	SetFlag FLAG_ROCKET_TAKEOVER_ACTIVE
	Compare VAR_UNK_40F8, 0
	GoToIfNe _0047
	SetVar VAR_UNK_40F8, 2
_0047:
	PhoneCall PHONE_CONTACT_PROF__ELM, 2, 2
	SetVar VAR_MIDGAME_BADGES, 5
	End

scr_seq_T28_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 5
	GoToIfEq _0117
	GoToIfSet FLAG_GOT_RAGECANDYBAR, _010C
	NPCMsg msg_0620_T28_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0101
_009D:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00EC
	GoToIfNoItemSpace ITEM_RAGECANDYBAR, 1, _00F7
	CallStd std_give_item_verbose
	SubMoneyImmediate 200
	NPCMsg msg_0620_T28_00005
	WaitButton
	SetFlag FLAG_GOT_RAGECANDYBAR
	GoTo _014C

_00EC:
	NPCMsg msg_0620_T28_00007
	WaitButton
	GoTo _014C

_00F7:
	CallStd std_bag_is_full
	GoTo _014C

_0101:
	NPCMsg msg_0620_T28_00009
	WaitButton
	GoTo _014C

_010C:
	NPCMsg msg_0620_T28_00001
	WaitButton
	GoTo _014C

_0117:
	GoToIfSet FLAG_GOT_RAGECANDYBAR, _0147
	NPCMsg msg_0620_T28_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _009D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0101
_0147:
	NPCMsg msg_0620_T28_00004
	WaitButton
_014C:
	CloseMsg
	ReleaseAll
	End

scr_seq_T28_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T28_gsmiddleman1, _0278
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 176
	GoToIfNe _0193
	ApplyMovement obj_T28_gsmiddleman1, _0284
	ApplyMovement obj_player, _0294
	GoTo _01A3

_0193:
	ApplyMovement obj_T28_gsmiddleman1, _02A4
	ApplyMovement obj_player, _02B4
_01A3:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoToIfSet FLAG_GOT_RAGECANDYBAR, _026D
	NPCMsg msg_0620_T28_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01DF
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0257
_01DF:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 300
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0262
	GoToIfNoItemSpace ITEM_RAGECANDYBAR, 1, _00F7
	CallStd std_give_item_verbose
	SubMoneyImmediate 300
	NPCMsg msg_0620_T28_00006
	CloseMsg
	SetFlag FLAG_GOT_RAGECANDYBAR
_0228:
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 176
	GoToIfNe _0249
	ApplyMovement obj_T28_gsmiddleman1, _02C4
	GoTo _0251

_0249:
	ApplyMovement obj_T28_gsmiddleman1, _02D0
_0251:
	WaitMovement
	ReleaseAll
	End

_0257:
	NPCMsg msg_0620_T28_00010
	CloseMsg
	GoTo _0228

_0262:
	NPCMsg msg_0620_T28_00008
	CloseMsg
	GoTo _0228

_026D:
	NPCMsg msg_0620_T28_00002
	CloseMsg
	GoTo _0228

	.balign 4, 0
_0278:
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0284:
	WalkFastEast
	WalkFastSouth
	WalkFastWest
	EndMovement

	.balign 4, 0
_0294:
	Delay4 2
	WalkFastWest
	FaceEast
	EndMovement

	.balign 4, 0
_02A4:
	WalkFastEast
	WalkFastSouth 2
	WalkFastWest
	EndMovement

	.balign 4, 0
_02B4:
	Delay4 3
	WalkFastWest
	FaceEast
	EndMovement

	.balign 4, 0
_02C4:
	WalkNormalNorth
	FaceSouth
	EndMovement

	.balign 4, 0
_02D0:
	WalkNormalNorth 2
	FaceSouth
	EndMovement

scr_seq_T28_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_RED_SCALE, _02FA
	NPCMsg msg_0620_T28_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02FA:
	NPCMsg msg_0620_T28_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T28_003:
	SimpleNPCMsg msg_0620_T28_00016
	End

scr_seq_T28_004:
	SimpleNPCMsg msg_0620_T28_00013
	End

scr_seq_T28_006:
	DirectionSignpost msg_0620_T28_00017, 0, 19, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T28_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0620_T28_00018, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T28_008:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0620_T28_00019, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
