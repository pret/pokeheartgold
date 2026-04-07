#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0601.h"
#include "msgdata/msg/msg_0589_T25R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R0601_000
	ScrDef scr_seq_T25R0601_001
	ScrDef scr_seq_T25R0601_002
	ScrDef scr_seq_T25R0601_003
	ScrDefEnd

scr_seq_T25R0601_002:
	GoToIfSet FLAG_UNK_15D, _0058
	GoToIfUnset FLAG_UNK_0B5, _0058
	GetPartySlotWithFatefulEncounter VAR_TEMP_x4000, 492
	Compare VAR_TEMP_x4000, 255
	GoToIfEq _0058
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 492
	GoToIfNe _0058
	SetVar VAR_UNK_4082, 1
_0058:
	End

scr_seq_T25R0601_003:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00FC
	ApplyMovement obj_T25R0601_gsgirl1, _0110
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_T25R0601_gsgirl1, _0120
	ApplyMovement obj_player, _0108
	ApplyMovement obj_partner_poke, _014C
	WaitMovement
	NPCMsg msg_0589_T25R0601_00005
	CloseMsg
	ApplyMovement obj_T25R0601_gsgirl1, _012C
	WaitMovement
	NPCMsg msg_0589_T25R0601_00006
	SetVar VAR_SPECIAL_x8004, 466
	SetVar VAR_SPECIAL_x8005, 1
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _00EA
	CallStd std_give_item_verbose
	NPCMsg msg_0589_T25R0601_00007
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_15D
	SetVar VAR_UNK_4082, 0
	ReleaseAll
	End

_00EA:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_4082, 0
	ReleaseAll
	End

	.balign 4, 0
_00FC:
	WalkNormalNorth
	Delay8
	EndMovement

	.balign 4, 0
_0108:
	FaceEast
	EndMovement

	.balign 4, 0
_0110:
	Delay8
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0120:
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_012C:
	WalkOnSpotFastWest 4
	EndMovement

	.balign 4, 0
_0134:
	WalkOnSpotFastSouth 4
	EndMovement

	.balign 4, 0
_013C:
	WalkOnSpotFastNorth 4
	EndMovement

	.balign 4, 0
_0144:
	WalkOnSpotFastEast 4
	EndMovement

	.balign 4, 0
_014C:
	FaceEast
	EndMovement

scr_seq_T25R0601_000:
	GoToIfSet FLAG_UNK_0B5, _01E5
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0185
	SimpleNPCMsg msg_0589_T25R0601_00000
	End

_0185:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	HasItem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01D0
	NPCMsg msg_0589_T25R0601_00001
	GoToIfNoItemSpace ITEM_SQUIRTBOTTLE, 1, _01DB
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_01D0:
	NPCMsg msg_0589_T25R0601_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01DB:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_01E5:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0589_T25R0601_00003
	NPCMsg msg_0589_T25R0601_00008
	TouchscreenMenuHide
	ShowMoneyBox 20, 2
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 213, 470, 0
	MenuItemAdd 214, 472, 1
	MenuItemAdd 215, 471, 2
	MenuItemAdd 216, 473, 3
	MenuItemAdd 217, 474, 4
	MenuExec
	CopyVar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	Switch VAR_SPECIAL_x8000
	Case 0, _033D
	Case 1, _0349
	Case 2, _0355
	Case 3, _0361
	NPCMsg msg_0589_T25R0601_00010
	GoTo _031F

_0276:
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _036D
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _0377
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _0381
	Compare VAR_SPECIAL_x8000, 3
	CallIfEq _038B
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0334
	HasSpaceForItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _032B
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _0395
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _039D
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _03A5
	Compare VAR_SPECIAL_x8000, 3
	CallIfEq _03AD
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	GiveItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	BufferItemName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0589_T25R0601_00011
	NPCMsg msg_0589_T25R0601_00009
	GoTo _031F

_031F:
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	HideMoneyBox
	ReleaseAll
	End

_032B:
	NPCMsg msg_0589_T25R0601_00012
	GoTo _031F

_0334:
	NPCMsg msg_0589_T25R0601_00013
	GoTo _031F

_033D:
	SetVar VAR_SPECIAL_x8001, 95
	GoTo _0276

_0349:
	SetVar VAR_SPECIAL_x8001, 96
	GoTo _0276

_0355:
	SetVar VAR_SPECIAL_x8001, 97
	GoTo _0276

_0361:
	SetVar VAR_SPECIAL_x8001, 98
	GoTo _0276

_036D:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	Return

_0377:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	Return

_0381:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	Return

_038B:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	Return

_0395:
	SubMoneyImmediate 200
	Return

_039D:
	SubMoneyImmediate 200
	Return

_03A5:
	SubMoneyImmediate 200
	Return

_03AD:
	SubMoneyImmediate 200
	Return

scr_seq_T25R0601_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_15D, _03FD
	GetPartySlotWithFatefulEncounter VAR_SPECIAL_RESULT, 492
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _03F2
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 492
	GoToIfEq _0432
_03F2:
	NPCMsg msg_0589_T25R0601_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03FD:
	GetPartySlotWithFatefulEncounter VAR_SPECIAL_RESULT, 492
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _03F2
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 492
	GoToIfNe _03F2
	NPCMsg msg_0589_T25R0601_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0432:
	ApplyMovement obj_T25R0601_gsgirl1, _04F0
	WaitMovement
	NPCMsg msg_0589_T25R0601_00005
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0460
	ApplyMovement obj_T25R0601_gsgirl1, _0134
	GoTo _049E

_0460:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _047B
	ApplyMovement obj_T25R0601_gsgirl1, _013C
	GoTo _049E

_047B:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0496
	ApplyMovement obj_T25R0601_gsgirl1, _0144
	GoTo _049E

_0496:
	ApplyMovement obj_T25R0601_gsgirl1, _012C
_049E:
	WaitMovement
	NPCMsg msg_0589_T25R0601_00006
	SetVar VAR_SPECIAL_x8004, 466
	SetVar VAR_SPECIAL_x8005, 1
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _04DD
	CallStd std_give_item_verbose
	NPCMsg msg_0589_T25R0601_00007
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_15D
	SetVar VAR_UNK_4082, 0
	ReleaseAll
	End

_04DD:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_4082, 0
	ReleaseAll
	End

	.balign 4, 0
_04F0:
	EmoteExclamationMark
	EndMovement
	.balign 4, 0
