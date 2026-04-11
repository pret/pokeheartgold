#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0164.h"
#include "msgdata/msg/msg_0267.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0164_000
	ScrDef scr_seq_0164_001
	ScrDef scr_seq_0164_002
	ScrDef scr_seq_0164_003
	ScrDef scr_seq_0164_004
	ScrDef scr_seq_0164_005
	ScrDefEnd

scr_seq_0164_000:
	ScrCmd_609
	LockAll
	NPCMsg msg_0267_00000
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0100
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0267_00001
	GiveItemNoCheck ITEM_PAL_PAD, 1
	GoTo _005C
	End

_005C:
	NPCMsg msg_0267_00002
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 156, 255, 0
	MenuItemAdd 157, 255, 1
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _00A5
	Case 1, _00EE
	GoTo _00EE
	End

_00A5:
	NPCMsg msg_0267_00003
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 158, 255, 0
	MenuItemAdd 157, 255, 1
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _00A5
	Case 1, _00EE
	GoTo _00EE
	End

_00EE:
	SetVar VAR_SCENE_POKECENTER_WIFI_BASEMENT, 1
	NPCMsg msg_0267_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0100:
	WalkOnSpotNormalNorth
	Delay8 2
	WalkNormalNorth 4
	WalkNormalWest
	FaceNorth
	Delay8 2
	EndMovement

scr_seq_0164_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0267_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _014F
	GoTo _0144
	End

_0144:
	NPCMsg msg_0267_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014F:
	NPCMsg msg_0267_00006
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 156, 255, 0
	MenuItemAdd 157, 255, 1
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _0198
	Case 1, _0144
	GoTo _0144
	End

_0198:
	NPCMsg msg_0267_00003
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 158, 255, 0
	MenuItemAdd 157, 255, 1
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _0198
	Case 1, _0144
	GoTo _0144
	End

scr_seq_0164_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PartyLegalCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04EC
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _031B
	GetPartyCount VAR_TEMP_x4009
	SetVar VAR_TEMP_x400A, 0
_0215:
	GetPartyMonSpecies VAR_TEMP_x400A, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 172
	GoToIfNe _0241
	GetPartyMonForm2 VAR_TEMP_x400A, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0241
	GoTo _04F8

_0241:
	AddVar VAR_TEMP_x400A, 1
	Compare VAR_TEMP_x400A, VAR_TEMP_x4009
	GoToIfGe _025A
	GoTo _0215

_025A:
	GoTo _0262
	End

_0262:
	NPCMsg msg_0267_00007
_0265:
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 14, 255, 0
	MenuItemAdd 15, 255, 1
	MenuItemAdd 16, 255, 2
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _02BE
	Case 1, _02B3
	GoTo _0326
	End

_02B3:
	NPCMsg msg_0267_00013
	GoTo _0265
	End

_02BE:
	ScrCmd_565 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02D7
	GoTo _0331
	End

_02D7:
	ScrCmd_564 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0310
	GoTo _02F0
	End

_02F0:
	NPCMsg msg_0267_00011
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0331
	GoTo _0326
	End

_0310:
	NPCMsg msg_0267_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_031B:
	NPCMsg msg_0267_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0326:
	NPCMsg msg_0267_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0331:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0356
	GoTo _0326
	End

_0350:
	CallStd std_bag_is_full_griseous_orb
	End

_0356:
	CommSanitizeParty VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0350
	NPCMsg msg_0267_00010
	CloseMsg
	ScrCmd_600
	HealParty
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_815 0
	ApplyMovement obj_player, _0474
	WaitMovement
	GoTo _038C
	End

_038C:
	ScrCmd_307 0, 0, 9, 5, 77
	Call _03E0
	ApplyMovement obj_player, _0480
	WaitMovement
	Call _03E8
	ApplyMovement obj_player, _0488
	WaitMovement
	ScrCmd_307 0, 0, 9, 2, 77
	Call _03E0
	ApplyMovement obj_player, _0490
	WaitMovement
	Call _03E8
	GoTo _03F3
	End

_03E0:
	ScrCmd_310 77
	ScrCmd_308 77
	Return

_03E8:
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	Return

_03F3:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_436
	ScrCmd_565 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _041A
	ScrCmd_152
	GoTo _041C

_041A:
	ScrCmd_152
_041C:
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_307 0, 0, 8, 2, 77
	Call _03E0
	ApplyMovement obj_player, _04A8
	WaitMovement
	Call _03E8
	ScrCmd_307 0, 0, 8, 5, 77
	Call _03E0
	ApplyMovement obj_player, _04C0
	WaitMovement
	Call _03E8
	ScrCmd_606
	ReleaseAll
	End

	.balign 4, 0
_0474:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0480:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0488:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0490:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_049C:
	WalkNormalNorth 2
	SetInvisible
	EndMovement

	.balign 4, 0
_04A8:
	FaceSouth
	SetVisible
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_04B8:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04C0:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_04C8:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_04D0:
	WalkNormalNorth
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_04E0:
	WalkNormalNorth
	SetInvisible
	EndMovement

_04EC:
	CallStd std_party_illegal
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04F8:
	NopVar490 VAR_TEMP_x4001
	NopVar490 VAR_TEMP_x4002
	Compare VAR_UNK_412F, 0
	GoToIfNe _0516
	NPCMsg msg_0267_00029
	GoTo _0519

_0516:
	NPCMsg msg_0267_00028
_0519:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0164_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerState VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _0709
	ScrCmd_691 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0560
	ScrCmd_446 VAR_UNK_4056
	CopyVar VAR_UNK_4055, VAR_SPECIAL_LAST_TALKED
	NPCMsg msg_0267_00018
	GoTo _056B
	End

_0560:
	NPCMsg msg_0267_00026
	GoTo _05C4
	End

_056B:
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 23, 255, 0
	MenuItemAdd 24, 255, 1
	MenuItemAdd 25, 255, 2
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _05D7
	Case 1, _05CC
	GoTo _05B9
	End

_05B9:
	NPCMsg msg_0267_00021
	GoTo _05C4
	End

_05C4:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05CC:
	NPCMsg msg_0267_00022
	GoTo _056B
	End

_05D7:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05B9
	NPCMsg msg_0267_00020
	CloseMsg
	ScrCmd_600
	HealParty
	ScrCmd_815 0
	ApplyMovement obj_player, _0474
	WaitMovement
	ScrCmd_307 0, 0, 5, 5, 77
	Call _03E0
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _04C8
	ApplyMovement obj_player, _0480
	WaitMovement
	Call _03E8
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _04D0
	WaitMovement
	ScrCmd_307 0, 0, 5, 2, 77
	Call _03E0
	ApplyMovement obj_player, _049C
	ApplyMovement VAR_SPECIAL_LAST_TALKED, _04E0
	WaitMovement
	Call _03E8
	SetVar VAR_TEMP_x4003, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_WIFI_PLAZA_WARP_ROOM, 0, 20, 11, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_06AD:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_436
	ScrCmd_166 VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	ScrCmd_663 VAR_SPECIAL_x8004
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_307 0, 0, 5, 2, 77
	Call _03E0
	ApplyMovement obj_player, _04A8
	WaitMovement
	Call _03E8
	ApplyMovement obj_player, _04B8
	WaitMovement
	ScrCmd_307 0, 0, 5, 5, 77
	Call _03E0
	ApplyMovement obj_player, _04C0
	WaitMovement
	Call _03E8
	ReleaseAll
	End

_0709:
	NPCMsg msg_0267_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_0164_004:
	ScrCmd_609
	LockAll
	ScrCmd_307 0, 0, 5, 2, 77
	Call _03E0
	ApplyMovement obj_player, _04A8
	WaitMovement
	Call _03E8
	ScrCmd_307 0, 0, 5, 5, 77
	Call _03E0
	ApplyMovement obj_player, _04C0
	WaitMovement
	Call _03E8
	ScrCmd_606
	SetVar VAR_UNK_4137, 0
	ReleaseAll
	End

scr_seq_0164_005:
	DebugWatch VAR_UNK_4143
	SetVar VAR_UNK_414F, 0
	SetVar VAR_UNK_4150, 0
	SetVar VAR_UNK_4143, 0
	SetVar VAR_UNK_4144, 0
	SetVar VAR_UNK_4148, 0
	SetVar VAR_UNK_4146, 0
	SetVar VAR_UNK_4149, 0
	SetVar VAR_UNK_414B, 0
	SetVar VAR_UNK_4142, 0
	SetVar VAR_UNK_4147, 0
	SetVar VAR_UNK_4145, 0
	SetVar VAR_UNK_414A, 0
	DebugWatch VAR_UNK_4143
	End
	.balign 4, 0
