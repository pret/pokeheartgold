#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0601.h"
#include "msgdata/msg/msg_0535_T11R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0601_000
	ScrDef scr_seq_T11R0601_001
	ScrDef scr_seq_T11R0601_002
	ScrDef scr_seq_T11R0601_003
	ScrDef scr_seq_T11R0601_004
	ScrDef scr_seq_T11R0601_005
	ScrDef scr_seq_T11R0601_006
	ScrDef scr_seq_T11R0601_007
	ScrDef scr_seq_T11R0601_008
	ScrDefEnd

scr_seq_T11R0601_006:
	ScrCmd_582 MAP_GOLDENROD, 1290, 209
	GoToIfSet FLAG_RESTORED_POWER, _003F
	GoTo _0045

_003F:
	SetVar VAR_UNK_411D, 0
_0045:
	SetFlag FLAG_HIDE_SAFFRON_TRAIN_STATION_LT_SURGE
	CheckRegisteredPhoneNumber PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfEq _007E
	GetPhoneBookRematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _007E
	GoToIfSet FLAG_TRADE_LT_SURGE_PIKACHU, _007E
	ClearFlag FLAG_HIDE_SAFFRON_TRAIN_STATION_LT_SURGE
_007E:
	End

scr_seq_T11R0601_005:
	GoToIfSet FLAG_RESTORED_POWER, _008D
	End

_008D:
	MovePersonFacing obj_T11R0601_policeman, 12, 0, 7, DIR_EAST
	End

scr_seq_T11R0601_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RESTORED_POWER, _00B9
	NPCMsg msg_0535_T11R0601_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B9:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _00D7
	NPCMsg msg_0535_T11R0601_00005
	WaitButton
	CloseMsg
	GoTo _00E6

_00D7:
	NPCMsg msg_0535_T11R0601_00007
	CloseMsg
	ApplyMovement obj_T11R0601_policeman, _00EC
	WaitMovement
_00E6:
	ReleaseAll
	End

	.balign 4, 0
_00EC:
	FaceEast
	EndMovement

scr_seq_T11R0601_004:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _017C
	WaitMovement
	GoToIfSet FLAG_UNK_123, _0158
	NPCMsg msg_0535_T11R0601_00001
	CloseMsg
	SetFlag FLAG_UNK_123
_0116:
	Wait 50, VAR_SPECIAL_x8004
	HasItem ITEM_PASS, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0163
	NPCMsg msg_0535_T11R0601_00002
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0184
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

_0158:
	NPCMsg msg_0535_T11R0601_00003
	CloseMsg
	GoTo _0116

_0163:
	NPCMsg msg_0535_T11R0601_00004
	WaitButton
	CloseMsg
	SetVar VAR_UNK_411D, 1
	SetVar VAR_UNK_411F, 1
	ReleaseAll
	End

	.balign 4, 0
_017C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0184:
	WalkNormalSouth 2
	EndMovement

scr_seq_T11R0601_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0535_T11R0601_00012
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _024F
	NPCMsg msg_0535_T11R0601_00014
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _024F
	LoadNPCTrade 10
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _0242
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_LT_SURGE_PIKACHU
	NPCMsg msg_0535_T11R0601_00016
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _022C
	ApplyMovement obj_T11R0601_gsleader9, _025C
	GoTo _0234

_022C:
	ApplyMovement obj_T11R0601_gsleader9, _0268
_0234:
	WaitMovement
	HidePerson obj_T11R0601_gsleader9
	SetFlag FLAG_HIDE_SAFFRON_TRAIN_STATION_LT_SURGE
	ReleaseAll
	End

_0242:
	NPCTradeEnd
	NPCMsg msg_0535_T11R0601_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_024F:
	NPCMsg msg_0535_T11R0601_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_025C:
	WalkSlightlyFastWest 5
	WalkSlightlyFastSouth 10
	EndMovement

	.balign 4, 0
_0268:
	WalkSlightlyFastSouth 10
	EndMovement

scr_seq_T11R0601_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_RESTORED_POWER, _028E
	NPCMsg msg_0535_T11R0601_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_028E:
	NPCMsg msg_0535_T11R0601_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T11R0601_002:
	SimpleNPCMsg msg_0535_T11R0601_00010
	End

scr_seq_T11R0601_003:
	SimpleNPCMsg msg_0535_T11R0601_00011
	End

scr_seq_T11R0601_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0535_T11R0601_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
