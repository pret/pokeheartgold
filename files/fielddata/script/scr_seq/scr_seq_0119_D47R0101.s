#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D47R0101.h"
#include "msgdata/msg/msg_0135_D47R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D47R0101_000
	ScrDef scr_seq_D47R0101_001
	ScrDef scr_seq_D47R0101_002
	ScrDef scr_seq_D47R0101_003
	ScrDef scr_seq_D47R0101_004
	ScrDef scr_seq_D47R0101_005
	ScrDef scr_seq_D47R0101_006
	ScrDef scr_seq_D47R0101_007
	ScrDef scr_seq_D47R0101_008
	ScrDef scr_seq_D47R0101_009
	ScrDef scr_seq_D47R0101_010
	ScrDef scr_seq_D47R0101_011
	ScrDefEnd

scr_seq_D47R0101_006:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D47R0101_counterm_3, _01EC
	ApplyMovement obj_D47R0101_counterm_5, _01EC
	WaitMovement
	NPCMsg msg_0135_D47R0101_00007
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0062
	SafariZoneAction 1, 0
_0062:
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00BD
	ApplyMovement obj_player, _01B4
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR, 0, 79, 100, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_606
	ApplyMovement obj_partner_poke, _0200
	WaitMovement
	Release obj_partner_poke
	ReleaseAll
	End

_00BD:
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _00E2
	SetVar VAR_TEMP_x4002, 5
	SetVar VAR_TEMP_x4003, 5
	GoTo _00EE

_00E2:
	SetVar VAR_TEMP_x4002, 19
	SetVar VAR_TEMP_x4003, 5
_00EE:
	ApplyMovement obj_player, _01DC
	WaitMovement
	ScrCmd_307 0, 0, VAR_TEMP_x4002, VAR_TEMP_x4003, 77
	Call _08AF
	ApplyMovement obj_player, _01BC
	ApplyMovement obj_D47R0101_counterm_3, _01F4
	ApplyMovement obj_D47R0101_counterm_5, _01F4
	WaitMovement
	Call _08B7
	SetVar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 0
	NPCMsg msg_0135_D47R0101_00008
	NPCMsg msg_0135_D47R0101_00009
	WaitButton
	CloseMsg
	ScrCmd_606
	ReleaseAll
	End

scr_seq_D47R0101_007:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _01E4
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0172
	SetVar VAR_TEMP_x4002, 5
	SetVar VAR_TEMP_x4003, 5
	GoTo _017E

_0172:
	SetVar VAR_TEMP_x4002, 19
	SetVar VAR_TEMP_x4003, 5
_017E:
	ScrCmd_307 0, 0, VAR_TEMP_x4002, VAR_TEMP_x4003, 77
	Call _08AF
	ApplyMovement obj_player, _01BC
	WaitMovement
	Call _08B7
	SetVar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 0
	NPCMsg msg_0135_D47R0101_00009
	WaitButton
	CloseMsg
	ScrCmd_606
	ReleaseAll
	End

	.balign 4, 0
_01B4:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_01BC:
	WalkNormalSouth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01CC:
	WalkNormalSouth 4
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01DC:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01E4:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_01EC:
	FaceEast
	EndMovement

	.balign 4, 0
_01F4:
	Delay8
	FaceSouth
	EndMovement

	.balign 4, 0
_0200:
	FaceNorth
	EndMovement

scr_seq_D47R0101_008:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D47R0101_gsgentleman, _0310
	ApplyMovement obj_player, _03B8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0135_D47R0101_00029
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _025B
_024A:
	NPCMsg msg_0135_D47R0101_00030
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4057, 2
	ReleaseAll
	End

_025B:
	NPCMsg msg_0135_D47R0101_00031
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _025B
	GoTo _024A

scr_seq_D47R0101_009:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D47R0101_gsgentleman, _0310
	ApplyMovement obj_player, _03B8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0135_D47R0101_00034
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D47R0101_gsgentleman, _0324
	ApplyMovement obj_player, _03C8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0135_D47R0101_00035
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D47R0101_gsgentleman, _0334
	ApplyMovement obj_player, _03D8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0135_D47R0101_00036
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4057, 5
	ClearFlag FLAG_HIDE_SAFARI_ZONE_WORKERS
	ReleaseAll
	End

	.balign 4, 0
_0310:
	FaceSouth
	EmoteExclamationMark
	Delay16
	WalkNormalWest
	EndMovement

	.balign 4, 0
_0324:
	WalkNormalNorth 2
	WalkNormalEast 3
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0334:
	WalkNormalSouth 2
	WalkNormalWest 2
	WalkNormalSouth
	EmoteExclamationMark
	FaceNorth
	EndMovement

	.balign 4, 0
_034C:
	WalkNormalWest 2
	WalkNormalNorth 4
	WalkNormalEast 4
	FaceSouth
	EndMovement

	.balign 4, 0
_0360:
	WalkNormalNorth 4
	WalkNormalEast 2
	FaceSouth
	EndMovement

	.balign 4, 0
_0370:
	WalkNormalSouth 2
	WalkNormalEast
	WalkNormalSouth 2
	FaceWest
	EndMovement

	.balign 4, 0
_0384:
	WalkNormalEast
	Delay16
	FaceWest
	EndMovement

	.balign 4, 0
_0394:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_039C:
	FaceSouth
	Delay16
	FaceWest
	EndMovement

	.balign 4, 0
_03AC:
	FaceSouth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03B8:
	Delay16
	WalkNormalNorth 3
	FaceEast
	EndMovement

	.balign 4, 0
_03C8:
	WalkNormalNorth 2
	WalkNormalEast 4
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_03D8:
	FaceSouth
	EndMovement

	.balign 4, 0
_03E0:
	Delay16
	FaceNorth
	Delay16
	WalkNormalSouth
	FaceNorth
	EndMovement

	.balign 4, 0
_03F8:
	WalkNormalEast
	FaceNorth
	EndMovement

	.balign 4, 0
_0404:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_040C:
	Delay16 3
	FaceEast
	EndMovement

	.balign 4, 0
_0418:
	FaceNorth
	EndMovement

	.balign 4, 0
_0420:
	WalkNormalNorth 3
	FaceEast
	EndMovement

scr_seq_D47R0101_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_183, _0599
	Compare VAR_UNK_4057, 2
	GoToIfEq _049D
	Compare VAR_UNK_4057, 3
	GoToIfEq _048B
	Compare VAR_UNK_4057, 5
	GoToIfEq _04CB
	Compare VAR_UNK_4057, 6
	GoToIfEq _0494
	Compare VAR_UNK_4057, 7
	GoToIfEq _058F
	NPCMsg msg_0135_D47R0101_00042
	GoTo _0587
	End

_048B:
	NPCMsg msg_0135_D47R0101_00042
	GoTo _0587

_0494:
	NPCMsg msg_0135_D47R0101_00040
	GoTo _0587

_049D:
	ScrCmd_791 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _04B8
	NPCMsg msg_0135_D47R0101_00033
	GoTo _04C3

_04B8:
	NPCMsg msg_0135_D47R0101_00032
	SetVar VAR_UNK_4057, 3
	ScrCmd_792
_04C3:
	GoTo _0587
	End

_04CB:
	ScrCmd_791 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _057E
	NPCMsg msg_0135_D47R0101_00037
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0515
	ApplyMovement obj_D47R0101_gsgentleman, _034C
	ApplyMovement obj_player, _03E0
	WaitMovement
	GoTo _054C

_0515:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _053A
	ApplyMovement obj_D47R0101_gsgentleman, _0360
	ApplyMovement obj_player, _03F8
	WaitMovement
	GoTo _054C

_053A:
	ApplyMovement obj_D47R0101_gsgentleman, _0360
	ApplyMovement obj_player, _0404
	WaitMovement
_054C:
	NPCMsg msg_0135_D47R0101_00038
	CloseMsg
	ApplyMovement obj_D47R0101_gsgentleman, _0370
	ApplyMovement obj_player, _040C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0135_D47R0101_00039
	SetVar VAR_UNK_4057, 6
	ScrCmd_792
	GoTo _0587

_057E:
	NPCMsg msg_0135_D47R0101_00041
	GoTo _0587

_0587:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_058F:
	SetFlag FLAG_UNK_183
	NPCMsg msg_0135_D47R0101_00043
	NPCMsg msg_0135_D47R0101_00044
_0599:
	NPCMsg msg_0135_D47R0101_00045
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0683
_05AF:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 463, 255, 0
	MenuItemAdd 464, 255, 1
	MenuItemAdd 465, 255, 2
	MenuItemAdd 466, 255, 3
	MenuItemAdd 467, 255, 4
	MenuItemAdd 468, 255, 5
	MenuItemAdd 469, 255, 6
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _064D
	Case 1, _0656
	Case 2, _065F
	Case 3, _0668
	Case 4, _0671
	Case 5, _067A
	GoTo _0683
	End

_064D:
	NPCMsg msg_0135_D47R0101_00047
	GoTo _05AF

_0656:
	NPCMsg msg_0135_D47R0101_00048
	GoTo _05AF

_065F:
	NPCMsg msg_0135_D47R0101_00049
	GoTo _05AF

_0668:
	NPCMsg msg_0135_D47R0101_00050
	GoTo _05AF

_0671:
	NPCMsg msg_0135_D47R0101_00051
	GoTo _05AF

_067A:
	NPCMsg msg_0135_D47R0101_00052
	GoTo _05AF

_0683:
	TouchscreenMenuShow
	NPCMsg msg_0135_D47R0101_00053
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4057, 6
	GoToIfLt _06AE
	NPCMsg msg_0135_D47R0101_00015
	GoTo _06B1

_06AE:
	NPCMsg msg_0135_D47R0101_00014
_06B1:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _06E7
	SetVar VAR_SPECIAL_x8004, 30
	BufferInt 1, VAR_SPECIAL_x8004
	SetVar VAR_SPECIAL_x8005, 1000
	BufferInt 2, VAR_SPECIAL_x8005
	NPCMsg msg_0135_D47R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06E7:
	NPCMsg msg_0135_D47R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4057, 7
	GoToIfEq _0899
_0707:
	Compare VAR_UNK_4057, 6
	GoToIfLt _0728
	SetVar VAR_SPECIAL_RESULT, 500
	BufferInt 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0135_D47R0101_00001
	GoTo _0736

_0728:
	SetVar VAR_SPECIAL_RESULT, 500
	BufferInt 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0135_D47R0101_00000
_0736:
	ShowMoneyBox 20, 2
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0846
	CountPCEmptySpace VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0773
	GetPartyCount VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 6
	GoToIfEq _0853
_0773:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 500
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0876
	SetVar VAR_SPECIAL_RESULT, 500
	BufferInt 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0135_D47R0101_00002
	PlaySE SEQ_SE_DP_REGI
	SubMoneyImmediate 500
	UpdateMoneyBox
	NPCMsg msg_0135_D47R0101_00004
	BufferPlayersName 0
	SetVar VAR_SPECIAL_RESULT, 30
	BufferInt 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0135_D47R0101_00005
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	NPCMsg msg_0135_D47R0101_00006
	CloseMsg
	HideMoneyBox
	ScrCmd_600
	ApplyMovement obj_player, _08C4
	WaitMovement
	ScrCmd_307 0, 0, 5, 5, 77
	Call _08AF
	ApplyMovement obj_player, _08D0
	WaitMovement
	Call _08B7
	SetVar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 1
	SafariZoneAction 0, 0
	SetDynamicWarp MAP_SAFARI_ZONE_ENTRANCE_INTERIOR, 1, 5, 2, 1
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR, 0, 79, 100, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_606
	ApplyMovement obj_partner_poke, _0200
	WaitMovement
	Release obj_partner_poke
	ReleaseAll
	End

_0846:
	HideMoneyBox
	NPCMsg msg_0135_D47R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0853:
	HideMoneyBox
	Compare VAR_UNK_4057, 6
	GoToIfLt _086B
	NPCMsg msg_0135_D47R0101_00013
	GoTo _086E

_086B:
	NPCMsg msg_0135_D47R0101_00012
_086E:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0876:
	HideMoneyBox
	Compare VAR_UNK_4057, 6
	GoToIfLt _088E
	NPCMsg msg_0135_D47R0101_00011
	GoTo _0891

_088E:
	NPCMsg msg_0135_D47R0101_00010
_0891:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0899:
	GoToIfSet FLAG_UNK_183, _0707
	NPCMsg msg_0135_D47R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_08AF:
	ScrCmd_310 77
	ScrCmd_308 77
	Return

_08B7:
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

	.balign 4, 0
_08C4:
	WalkNormalEast
	FaceNorth
	EndMovement

	.balign 4, 0
_08D0:
	WalkNormalNorth 4
	EndMovement

scr_seq_D47R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4057, 0
	GoToIfEq _09DC
	Compare VAR_UNK_4057, 1
	GoToIfEq _09DC
	Compare VAR_UNK_4057, 2
	GoToIfEq _09DC
	Compare VAR_UNK_4057, 3
	GoToIfEq _09DC
	NPCMsg msg_0135_D47R0101_00019
	TouchscreenMenuHide
_0919:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 457, 255, 0
	MenuItemAdd 458, 255, 1
	MenuItemAdd 459, 255, 2
	MenuItemAdd 460, 255, 3
	MenuItemAdd 461, 255, 4
	MenuItemAdd 462, 255, 5
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _09A2
	Case 1, _09AB
	Case 2, _09B4
	Case 3, _09BD
	Case 4, _09C6
	GoTo _09CF
	End

_09A2:
	NPCMsg msg_0135_D47R0101_00020
	GoTo _0919

_09AB:
	NPCMsg msg_0135_D47R0101_00021
	GoTo _0919

_09B4:
	NPCMsg msg_0135_D47R0101_00022
	GoTo _0919

_09BD:
	NPCMsg msg_0135_D47R0101_00023
	GoTo _0919

_09C6:
	NPCMsg msg_0135_D47R0101_00024
	GoTo _0919

_09CF:
	TouchscreenMenuShow
	NPCMsg msg_0135_D47R0101_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_09DC:
	NPCMsg msg_0135_D47R0101_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4057, 7
	GoToIfEq _0C21
_09FC:
	ScrCmd_247
	NatDexFlagAction 2, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0DF2
	Compare VAR_UNK_4057, 6
	GoToIfLt _0A26
	NPCMsg msg_0135_D47R0101_00065
	GoTo _0A29

_0A26:
	NPCMsg msg_0135_D47R0101_00066
_0A29:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0BFC
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A5D
	GoTo _0C16
	End

_0A5D:
	TouchscreenMenuHide
	NPCMsg msg_0135_D47R0101_00071
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 5, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0AAC
	Case 1, _0B2F
	GoTo _0BFC
	End

_0AAC:
	NPCMsg msg_0135_D47R0101_00086
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A5D
	SetVar VAR_SPECIAL_x8004, 39
	SetVar VAR_SPECIAL_x8005, 0
	ScrCmd_226 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0B05
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0B11
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0B20
	GoTo _0BB2
	End

_0B05:
	ScrCmd_283
	TouchscreenMenuHide
	GoTo _0A5D
	End

_0B11:
	ScrCmd_283
	TouchscreenMenuShow
	NPCMsg msg_0135_D47R0101_00087
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B20:
	ScrCmd_283
	NPCMsg msg_0135_D47R0101_00085
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0B2F:
	NPCMsg msg_0135_D47R0101_00086
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A5D
	SetVar VAR_SPECIAL_x8004, 39
	SetVar VAR_SPECIAL_x8005, 0
	ScrCmd_227 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0B88
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0B94
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0BA3
	GoTo _0BB2
	End

_0B88:
	ScrCmd_283
	TouchscreenMenuHide
	GoTo _0A5D
	End

_0B94:
	ScrCmd_283
	NPCMsg msg_0135_D47R0101_00087
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0BA3:
	ScrCmd_283
	NPCMsg msg_0135_D47R0101_00085
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0BB2:
	SetVar VAR_UNK_4133, 1
	NPCMsg msg_0135_D47R0101_00081
	ScrCmd_257 96
	ScrCmd_822
	ScrCmd_283
	SetVar VAR_TEMP_x4000, 0
	ScrCmd_823 VAR_TEMP_x4000
	TouchscreenMenuHide
	NPCMsg msg_0135_D47R0101_00082
	NPCMsg msg_0135_D47R0101_00088
	AddWaitingIcon
	SaveGameNormal VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	BufferPlayersName 0
	NPCMsg msg_0135_D47R0101_00089
	PlaySE SEQ_SE_DP_SAVE
	WaitSE SEQ_SE_DP_SAVE
	NPCMsg msg_0135_D47R0101_00083
	SetVar VAR_UNK_4133, 0
	TouchscreenMenuShow
	CloseMsg
	ReleaseAll
	End

_0BFC:
	NPCMsg msg_0135_D47R0101_00085
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0C09:
	NPCMsg msg_0135_D47R0101_00085
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0C16:
	NPCMsg msg_0135_D47R0101_00085
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0C21:
	GoToIfSet FLAG_UNK_183, _09FC
	NPCMsg msg_0135_D47R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4057, 7
	GoToIfEq _0DFD
_0C4C:
	ScrCmd_247
	NatDexFlagAction 2, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0DF2
	ScrCmd_824 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0C84
	SetVar VAR_TEMP_x4000, 0
	ScrCmd_823 VAR_TEMP_x4000
	NPCMsg msg_0135_D47R0101_00054
	GoTo _0C8F

_0C84:
	NPCMsg msg_0135_D47R0101_00060
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0C8F:
	ShowMoneyBox 20, 2
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0D9F
	CountPCEmptySpace VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0CCC
	GetPartyCount VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 6
	GoToIfEq _0DAC
_0CCC:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 500
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0DCF
	SetVar VAR_SPECIAL_RESULT, 500
	BufferInt 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0135_D47R0101_00055
	PlaySE SEQ_SE_DP_REGI
	SubMoneyImmediate 500
	UpdateMoneyBox
	NPCMsg msg_0135_D47R0101_00057
	BufferPlayersName 0
	SetVar VAR_SPECIAL_RESULT, 30
	BufferInt 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0135_D47R0101_00058
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	NPCMsg msg_0135_D47R0101_00059
	CloseMsg
	HideMoneyBox
	ScrCmd_600
	ApplyMovement obj_player, _08C4
	WaitMovement
	ScrCmd_307 0, 0, 19, 5, 77
	Call _08AF
	ApplyMovement obj_player, _08D0
	WaitMovement
	Call _08B7
	SetVar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 3
	SafariZoneAction 0, 1
	SetDynamicWarp MAP_SAFARI_ZONE_ENTRANCE_INTERIOR, 2, 19, 2, 1
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR, 0, 79, 100, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_606
	ApplyMovement obj_partner_poke, _0200
	WaitMovement
	Release obj_partner_poke
	ReleaseAll
	End

_0D9F:
	HideMoneyBox
	NPCMsg msg_0135_D47R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0DAC:
	HideMoneyBox
	Compare VAR_UNK_4057, 6
	GoToIfLt _0DC4
	NPCMsg msg_0135_D47R0101_00013
	GoTo _0DC7

_0DC4:
	NPCMsg msg_0135_D47R0101_00012
_0DC7:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0DCF:
	HideMoneyBox
	Compare VAR_UNK_4057, 6
	GoToIfLt _0DE7
	NPCMsg msg_0135_D47R0101_00011
	GoTo _0DEA

_0DE7:
	NPCMsg msg_0135_D47R0101_00010
_0DEA:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0DF2:
	NPCMsg msg_0135_D47R0101_00084
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0DFD:
	GoToIfSet FLAG_UNK_183, _0C4C
	NPCMsg msg_0135_D47R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47R0101_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_247
	NatDexFlagAction 2, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0E73
	Compare VAR_UNK_4057, 6
	GoToIfLt _0E45
	NPCMsg msg_0135_D47R0101_00093
	GoTo _0E48

_0E45:
	NPCMsg msg_0135_D47R0101_00094
_0E48:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0E68
	NPCMsg msg_0135_D47R0101_00095
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E68:
	NPCMsg msg_0135_D47R0101_00096
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E73:
	NPCMsg msg_0135_D47R0101_00092
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47R0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4057, 0
	GoToIfEq _0EF1
	Compare VAR_UNK_4057, 1
	GoToIfEq _0EF1
	Compare VAR_UNK_4057, 2
	GoToIfEq _0EF1
	Compare VAR_UNK_4057, 3
	GoToIfEq _0EF1
	BufferPlayersName 0
	NPCMsg msg_0135_D47R0101_00027
	CloseMsg
	ClearFlag FLAG_UNK_99D
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_716
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoToIfSet FLAG_UNK_99D, _0EFC
	ReleaseAll
	End

_0EF1:
	NPCMsg msg_0135_D47R0101_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0EFC:
	ScreenShake 0, 2, 10, 6
	PlaySE SEQ_SE_DP_KI_GASYAN
	NPCMsg msg_0135_D47R0101_00091
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
