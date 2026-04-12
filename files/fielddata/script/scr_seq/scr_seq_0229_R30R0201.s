#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30R0201.h"
#include "msgdata/msg/msg_0377_R30R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R30R0201_000
	ScrDef scr_seq_R30R0201_001
	ScrDef scr_seq_R30R0201_002
	ScrDef scr_seq_R30R0201_003
	ScrDefEnd

scr_seq_R30R0201_003:
	Compare VAR_SCENE_EMBEDDED_TOWER, 1
	GoToIfEq _0021
	End

_0021:
	MovePersonFacing obj_R30R0201_gsgentleman, 5, 0, 6, DIR_EAST
	End

scr_seq_R30R0201_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_R30R0201_gsgentleman, _03AC
	WaitMovement
	ApplyMovement obj_R30R0201_ookido, _041C
	ApplyMovement obj_R30R0201_gsgentleman, _03B4
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0377_R30R0201_00000, msg_0377_R30R0201_00001
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_R30R0201_gsgentleman, _03C4
	ApplyMovement obj_player, _0404
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_R30R0201_gsgentleman, _03E4
	WaitMovement
	NPCMsg msg_0377_R30R0201_00002
	GiveItemNoCheck ITEM_MYSTERY_EGG, 1
	NPCMsg msg_0377_R30R0201_00003
	NPCMsg msg_0377_R30R0201_00004
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	StopBGM 0
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HealParty
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _02E8
	End

scr_seq_R30R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_EMBEDDED_TOWER, 4
	GoToIfGe _00F1
	Compare VAR_SCENE_EMBEDDED_TOWER, 2
	GoToIfGe _02CD
_00F1:
	GoToIfSet FLAG_EXCHANGED_RED_SCALE, _019F
	GoToIfSet FLAG_GOT_RED_SCALE, _012A
	Compare VAR_SCENE_MR_POKEMONS_HOUSE, 2
	GoToIfGe _011F
	NPCMsg msg_0377_R30R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011F:
	NPCMsg msg_0377_R30R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_012A:
	BufferPlayersName 0
	GenderMsgBox msg_0377_R30R0201_00016, msg_0377_R30R0201_00017
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0189
	GoToIfNoItemSpace ITEM_EXP__SHARE, 1, _0194
	CallStd std_give_item_verbose
	CloseMsg
	SetFlag FLAG_EXCHANGED_RED_SCALE
	TakeItemNoCheck ITEM_RED_SCALE, 1
	ReleaseAll
	End

_0189:
	NPCMsg msg_0377_R30R0201_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0194:
	NPCMsg msg_0377_R30R0201_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019F:
	GoToIfUnset FLAG_UNK_107, _011F
	NPCMsg msg_0377_R30R0201_00007
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _01CE
	ApplyMovement obj_R30R0201_gsgentleman, _01F8
	GoTo _01F1

_01CE:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _01E9
	ApplyMovement obj_R30R0201_gsgentleman, _020C
	GoTo _01F1

_01E9:
	ApplyMovement obj_R30R0201_gsgentleman, _0220
_01F1:
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_01F8:
	FaceSouth 3
	FaceWest 3
	FaceNorth 3
	FaceEast 3
	EndMovement

	.balign 4, 0
_020C:
	FaceSouth 3
	FaceEast 3
	FaceNorth 3
	FaceWest 3
	EndMovement

	.balign 4, 0
_0220:
	FaceEast 3
	FaceNorth 3
	FaceWest 3
	FaceSouth 3
	EndMovement

scr_seq_R30R0201_002:
	ScrCmd_609
	LockAll
	SetVar VAR_SCENE_EMBEDDED_TOWER, 2
	ApplyMovement obj_R30R0201_gsgentleman, _03AC
	WaitMovement
	ApplyMovement obj_R30R0201_gsgentleman, _02D8
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0377_R30R0201_00021, msg_0377_R30R0201_00022
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_R30R0201_gsgentleman, _03C4
	ApplyMovement obj_player, _0404
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0377_R30R0201_00023
	CloseMsg
	ApplyMovement obj_R30R0201_gsgentleman, _03E4
	WaitMovement
	BufferPlayersName 0
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _02B0
	SetVar VAR_SPECIAL_x8004, 535
	GoTo _02B6

_02B0:
	SetVar VAR_SPECIAL_x8004, 534
_02B6:
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_give_item_verbose
	CloseMsg
	NPCMsg msg_0377_R30R0201_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02CD:
	NPCMsg msg_0377_R30R0201_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_02D8:
	WalkNormalSouth
	WalkNormalWest
	WalkNormalSouth
	EndMovement

_02E8:
	PlayBGM SEQ_GS_OHKIDO
	ApplyMovement obj_R30R0201_ookido, _0424
	WaitMovement
	ApplyMovement obj_player, _0414
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0377_R30R0201_00008, msg_0377_R30R0201_00009
	CloseMsg
	ApplyMovement obj_R30R0201_ookido, _0438
	WaitMovement
	NPCMsg msg_0377_R30R0201_00010
	CloseMsg
	ApplyMovement obj_R30R0201_ookido, _0444
	WaitMovement
	NPCMsg msg_0377_R30R0201_00011
	BufferPlayersName 0
	NPCMsg msg_0377_R30R0201_00012
	GivePokedex
	SetFlag FLAG_GOT_POKEDEX
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	ScrCmd_573
	GenderMsgBox msg_0377_R30R0201_00013, msg_0377_R30R0201_00014
	CloseMsg
	BufferPlayersName 0
	NPCMsg msg_0377_R30R0201_00015
	RegisterGearNumber PHONE_CONTACT_PROF__OAK
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	CloseMsg
	ApplyMovement obj_R30R0201_ookido, _0450
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_R30R0201_ookido
	WaitSE SEQ_SE_DP_DOOR
	FadeOutBGM 0, 30
	StopBGM 0
	ResetBGM
	ReleaseAll
	SetVar VAR_SCENE_MR_POKEMONS_HOUSE, 1
	SetSpawn SPAWN_CHERRYGROVE
	SetFlag FLAG_HIDE_MR_POKEMONS_HOUSE_OAK
	SetFlag FLAG_HIDE_COMM_CLUB_CLOSED_LADIES
	ClearFlag FLAG_HIDE_COMM_CLUB_RECEPTIONISTS
	SetFlag FLAG_HIDE_NEW_BARK_RIVAL
	SetVar VAR_SCENE_CHERRYGROVE_CITY_OW, 3
	ClearFlag FLAG_HIDE_CHERRYGROVE_RIVAL
	SetVar VAR_SCENE_ELMS_LAB, 3
	ClearFlag FLAG_HIDE_ELMS_LAB_OFFICER
	SetVar VAR_SCENE_ROUTE_30_OW, 2
	End

	.balign 4, 0
_03AC:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_03B4:
	WalkFastSouth
	WalkFastWest 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03C4:
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03D4:
	WalkOnSpotNormalNorth
	WalkOnSpotNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_03E4:
	WalkFastWest 3
	WalkFastNorth
	Delay8
	WalkOnSpotSlowerNorth
	WalkSlowSouth
	WalkSlowEast 3
	WalkOnSpotSlowSouth
	EndMovement

	.balign 4, 0
_0404:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0414:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_041C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0424:
	WalkSlowSouth
	WalkSlowWest 4
	WalkSlowNorth 2
	WalkOnSpotSlowEast
	EndMovement

	.balign 4, 0
_0438:
	WalkSlowSouth
	WalkOnSpotSlowEast
	EndMovement

	.balign 4, 0
_0444:
	WalkSlowNorth
	WalkOnSpotSlowEast
	EndMovement

	.balign 4, 0
_0450:
	WalkSlowSouth 3
	Delay8
	EndMovement
	.balign 4, 0
