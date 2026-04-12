#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0101.h"
#include "msgdata/msg/msg_0543_T20R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T20R0101_000
	ScrDef scr_seq_T20R0101_001
	ScrDef scr_seq_T20R0101_002
	ScrDef scr_seq_T20R0101_003
	ScrDef scr_seq_T20R0101_004
	ScrDef scr_seq_T20R0101_005
	ScrDef scr_seq_T20R0101_006
	ScrDef scr_seq_T20R0101_007
	ScrDef scr_seq_T20R0101_008
	ScrDef scr_seq_T20R0101_009
	ScrDef scr_seq_T20R0101_010
	ScrDef scr_seq_T20R0101_011
	ScrDef scr_seq_T20R0101_012
	ScrDef scr_seq_T20R0101_013
	ScrDef scr_seq_T20R0101_014
	ScrDef scr_seq_T20R0101_015
	ScrDefEnd

scr_seq_T20R0101_010:
	GetFriendSprite VAR_OBJ_0
	GoToIfSet FLAG_ELMS_LAB_PREVENT_PLAYER_ESCAPE, _00B8
	Compare VAR_SCENE_ELMS_LAB, 0
	GoToIfNe _0070
	MovePersonFacing obj_T20R0101_doctor, 4, 0, 5, DIR_SOUTH
	GoTo _00B4

_0070:
	Compare VAR_SCENE_ELMS_LAB, 3
	GoToIfNe _008F
	MovePersonFacing obj_T20R0101_doctor, 4, 0, 5, DIR_SOUTH
	GoTo _00B4

_008F:
	Compare VAR_SCENE_ELMS_LAB, 8
	GoToIfNe _00B4
	MovePersonFacing obj_T20R0101_doctor, 4, 0, 5, DIR_SOUTH
	MovePersonFacing obj_T20R0101_var_1, 7, 0, 12, DIR_EAST
_00B4:
	PlaceStarterBallsInElmsLab
	End

_00B8:
	MovePersonFacing obj_T20R0101_doctor, 4, 0, 5, DIR_EAST
	GoTo _00B4

scr_seq_T20R0101_011:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_ELMS_LAB_PREVENT_PLAYER_ESCAPE, _0197
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _00FA
	ApplyMovement obj_player, _01BC
	GoTo _0145

_00FA:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0115
	ApplyMovement obj_player, _01CC
	GoTo _0145

_0115:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0130
	ApplyMovement obj_player, _01D4
	GoTo _0145

_0130:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0145
	ApplyMovement obj_player, _01E4
_0145:
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00000, msg_0543_T20R0101_00001
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0368
	WaitMovement
	Wait 15, VAR_SPECIAL_x8004
	PlaySE SEQ_SE_GS_PHONE0
	ApplyMovement obj_T20R0101_doctor, _01F4
	WaitMovement
	NPCMsg msg_0543_T20R0101_00002
	NPCMsg msg_0543_T20R0101_00003
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0204
	WaitMovement
	NPCMsg msg_0543_T20R0101_00004
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0368
	WaitMovement
	SetFlag FLAG_ELMS_LAB_PREVENT_PLAYER_ESCAPE
	ReleaseAll
	End

_0197:
	ApplyMovement obj_T20R0101_doctor, _020C
	WaitMovement
	NPCMsg msg_0543_T20R0101_00006
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0368
	ApplyMovement obj_player, _021C
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_01BC:
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_01CC:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_01E4:
	WalkNormalNorth 2
	WalkNormalWest 2
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_01F4:
	EmoteExclamationMark
	WalkNormalNorth
	Delay16
	EndMovement

	.balign 4, 0
_0204:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_020C:
	FaceSouth
	EmoteExclamationMark
	WalkOnSpotNormalSouth 2
	EndMovement

	.balign 4, 0
_021C:
	WalkNormalNorth
	EndMovement

scr_seq_T20R0101_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_STARTER, _0331
	ChooseStarter
	SetFlag FLAG_GOT_STARTER
	ScrCmd_605 3, 2
	ToggleFollowingPokemonMovement 0
	ScrCmd_608
	Wait 10, VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 1
	GetPartyMonSpecies 0, VAR_TEMP_x4001
	SetStarterChoice VAR_TEMP_x4001
	BufferPlayersName 0
	BufferMonSpeciesName 1, 0
	NPCMsg msg_0543_T20R0101_00007
	PlayFanfare SEQ_ME_POKEGET
	WaitFanfare
	TouchscreenMenuHide
	BufferMonSpeciesName 1, 0
	NPCMsg msg_0543_T20R0101_00008
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	CallIfEq _02EE
	TouchscreenMenuShow
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0370
	ApplyMovement obj_T20R0101_doctor, _0388
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0543_T20R0101_00010
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0380
	WaitMovement
	NPCMsg msg_0543_T20R0101_00011
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0390
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00012, msg_0543_T20R0101_00013
	WaitButton
	CloseMsg
	SetVar VAR_SCENE_ELMS_LAB, 1
	SetVar VAR_SCENE_NEW_BARK_TOWN_OW, 1
	ClearFlag FLAG_ELMS_LAB_PREVENT_PLAYER_ESCAPE
	ReleaseAll
	End

_02EE:
	SetVar VAR_TEMP_x4000, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput 0, VAR_TEMP_x4000
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	TouchscreenMenuHide
	BufferPartyMonNick 1, 0
	NPCMsg msg_0543_T20R0101_00009
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02EE
	Return

_0331:
	GoToIfSet FLAG_GOT_TM51_FROM_FALKNER, _035D
	GoToIfSet FLAG_MET_PASSERBY_BOY, _0352
	NPCMsg msg_0543_T20R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0352:
	NPCMsg msg_0543_T20R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_035D:
	NPCMsg msg_0543_T20R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0368:
	FaceEast
	EndMovement

	.balign 4, 0
_0370:
	WalkNormalSouth 2
	WalkNormalWest 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0380:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0388:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0390:
	Delay16
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_T20R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_SS_TICKET_FROM_ELM, _03BA
	GoToIfSet FLAG_GAME_CLEAR, _0526
_03BA:
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03F5
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, SPECIES_PICHU
	GoToIfNe _03F5
	GetPartyMonForm2 VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0CDC
_03F5:
	GoToIfSet FLAG_UNK_072, _04A1
	GoToIfSet FLAG_SYS_HATCHED_TOGEPI_EGG, _055F
	Compare VAR_SCENE_ELMS_LAB, 9
	GoToIfGe _04A1
	Compare VAR_SCENE_ELMS_LAB, 0
	GoToIfNe _043C
	NPCMsg msg_0543_T20R0101_00005
	WaitButton
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0368
	WaitMovement
	GoTo _049D

_043C:
	Compare VAR_SCENE_ELMS_LAB, 2
	GoToIfGt _045A
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00012, msg_0543_T20R0101_00013
	WaitButton
	CloseMsg
	GoTo _049D

_045A:
	Compare VAR_SCENE_ELMS_LAB, 5
	GoToIfGt _0474
	NPCMsg msg_0543_T20R0101_00040
	WaitButton
	CloseMsg
	GoTo _049D

_0474:
	Compare VAR_SCENE_ELMS_LAB, 6
	GoToIfNe _0492
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00042, msg_0543_T20R0101_00043
	WaitButton
	CloseMsg
	GoTo _049D

_0492:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00044, msg_0543_T20R0101_00045
	WaitButton
	CloseMsg
_049D:
	ReleaseAll
	End

_04A1:
	CheckBadge BADGE_EARTH, VAR_TEMP_x4003
	Compare VAR_TEMP_x4003, 1
	GoToIfEq _0550
	GoToIfSet FLAG_GOT_SS_TICKET_FROM_ELM, _0541
	GoToIfSet FLAG_UNK_108, _051B
	GoToIfSet FLAG_UNK_109, _051B
	CheckBadge BADGE_RISING, VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 1
	GoToIfEq _0510
	Compare VAR_TEMP_x400F, 1
	GoToIfEq _0504
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00098, msg_0543_T20R0101_00099
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0504:
	GenderMsgBox msg_0543_T20R0101_00100, msg_0543_T20R0101_00101
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0510:
	NPCMsg msg_0543_T20R0101_00069
	WaitButton
	CloseMsg
	ReleaseAll
	End

_051B:
	NPCMsg msg_0543_T20R0101_00070
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0526:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00071, msg_0543_T20R0101_00072
	SetVar VAR_SPECIAL_x8004, ITEM_S_S__TICKET
	SetVar VAR_SPECIAL_x8005, 1
	SetFlag FLAG_GOT_SS_TICKET_FROM_ELM
	CallStd std_give_item_verbose
_0541:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00073, msg_0543_T20R0101_00074
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0550:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00102, msg_0543_T20R0101_00103
	WaitButton
	CloseMsg
	ReleaseAll
	End

_055F:
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	ScrCmd_149 0
	Compare VAR_TEMP_x4001, 175
	GoToIfEq _0599
	Compare VAR_TEMP_x4001, 176
	GoToIfEq _0599
	Compare VAR_TEMP_x4001, 468
	GoToIfEq _0599
	GoTo _0637

_0599:
	ApplyMovement obj_T20R0101_doctor, _0658
	WaitMovement
	NPCMsg msg_0543_T20R0101_00046
	BufferPlayersName 0
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _05D9
	GoToIfUnset FLAG_UNK_108, _05CF
	GenderMsgBox msg_0543_T20R0101_00104, msg_0543_T20R0101_00105
	GoTo _05D3

_05CF:
	GenderMsgBox msg_0543_T20R0101_00047, msg_0543_T20R0101_00048
_05D3:
	GoTo _05F2

_05D9:
	GoToIfUnset FLAG_UNK_109, _05EE
	GenderMsgBox msg_0543_T20R0101_00104, msg_0543_T20R0101_00105
	GoTo _05F2

// This script contains a programming mistake where if the player has
// no space in their bag, the Everstone from Elm is permanently lost.
// This is unlike every other script for obtaining an item from someone,
// which all attempt to give the item until the player can accept it.
// FLAG_GOT_EVERSTONE_FROM_ELM is set here but no code in the game ever
// checks what it is, meaning that flag is useless.
_05EE:
	GenderMsgBox msg_0543_T20R0101_00047, msg_0543_T20R0101_00048
_05F2:
	GoToIfNoItemSpace ITEM_EVERSTONE, 1, _064E
	CallStd std_give_item_verbose
	SetFlag FLAG_UNK_072
	SetFlag FLAG_GOT_EVERSTONE_FROM_ELM
	SetVar VAR_TEMP_x400F, 0
	NPCMsg msg_0543_T20R0101_00049
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00050, msg_0543_T20R0101_00051
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0637:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00053, msg_0543_T20R0101_00054
	SetVar VAR_TEMP_x400F, 1
	GoTo _04A1

_064A:
	ReleaseAll
	End

_064E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0658:
	EmoteExclamationMark
	Delay4
	EndMovement

scr_seq_T20R0101_003:
	ScrCmd_609
	LockAll
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0689
	ApplyMovement obj_T20R0101_assistantm, _081C
	GoTo _06D4

_0689:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _06A4
	ApplyMovement obj_T20R0101_assistantm, _082C
	GoTo _06D4

_06A4:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _06BF
	ApplyMovement obj_T20R0101_assistantm, _083C
	GoTo _06D4

_06BF:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _06D4
	ApplyMovement obj_T20R0101_assistantm, _084C
_06D4:
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00019, msg_0543_T20R0101_00020
	GoToIfNoItemSpace ITEM_POTION, 5, _0805
	SetVar VAR_SPECIAL_x8004, ITEM_POTION
	SetVar VAR_SPECIAL_x8005, 5
	CallStd std_obtain_item_verbose
	CloseMsg
	SetVar VAR_SCENE_ELMS_LAB, 2
	NPCMsg msg_0543_T20R0101_00021
	CloseMsg
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0736
	ApplyMovement obj_T20R0101_assistantm, _0864
	GoTo _0781

_0736:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0751
	ApplyMovement obj_T20R0101_assistantm, _0870
	GoTo _0781

_0751:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _076C
	ApplyMovement obj_T20R0101_assistantm, _087C
	GoTo _0781

_076C:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0781
	ApplyMovement obj_T20R0101_assistantm, _0888
_0781:
	WaitMovement
	ReleaseAll
	End

scr_seq_T20R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40FC, 3
	GoToIfEq _080F
	Compare VAR_SCENE_ELMS_LAB, 0
	GoToIfNe _07B2
	NPCMsg msg_0543_T20R0101_00018
	GoTo _07FD

_07B2:
	Compare VAR_SCENE_ELMS_LAB, 2
	GoToIfNe _07C8
	NPCMsg msg_0543_T20R0101_00022
	GoTo _07FD

_07C8:
	Compare VAR_SCENE_ELMS_LAB, 4
	GoToIfNe _07E4
	NPCMsg msg_0543_T20R0101_00041
	SetVar VAR_SCENE_ELMS_LAB, 5
	GoTo _07FD

_07E4:
	Compare VAR_SCENE_ELMS_LAB, 6
	GoToIfNe _07FA
	NPCMsg msg_0543_T20R0101_00055
	GoTo _07FD

_07FA:
	NPCMsg msg_0543_T20R0101_00055
_07FD:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0805:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_080F:
	NPCMsg msg_0543_T20R0101_00057
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_081C:
	EmoteExclamationMark
	WalkSlightlyFastWest 6
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_082C:
	EmoteExclamationMark
	WalkSlightlyFastWest 5
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_083C:
	EmoteExclamationMark
	WalkSlightlyFastWest 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_084C:
	EmoteExclamationMark
	WalkSlightlyFastWest 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_085C:
	FaceEast
	EndMovement

	.balign 4, 0
_0864:
	WalkSlightlyFastEast 6
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0870:
	WalkSlightlyFastEast 5
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_087C:
	WalkSlightlyFastEast 4
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0888:
	WalkSlightlyFastEast 3
	WalkOnSpotNormalWest
	EndMovement

scr_seq_T20R0101_002:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0A68
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_T20R0101_policeman, _0A7C
	WaitMovement
	NPCMsg msg_0543_T20R0101_00023
	CloseMsg
	ClearFlag FLAG_HIDE_ELMS_LAB_FRIEND
	PlaySE SEQ_SE_DP_KAIDAN2
	ShowPerson obj_T20R0101_var_1
	WaitSE SEQ_SE_DP_KAIDAN2
	CallStd std_play_friend_music
	ApplyMovement obj_T20R0101_var_1, _0ADC
	ApplyMovement obj_T20R0101_policeman, _0A84
	WaitMovement
	GenderMsgBox msg_0543_T20R0101_00024, msg_0543_T20R0101_00025
	CloseMsg
	ApplyMovement obj_T20R0101_policeman, _0A90
	WaitMovement
	NPCMsg msg_0543_T20R0101_00026
	CloseMsg
	CallStd std_fade_end_friend_music
_0904:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NameRival VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0904
	ApplyMovement obj_T20R0101_policeman, _0A7C
	WaitMovement
	BufferRivalsName 1
	NPCMsg msg_0543_T20R0101_00027
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A59
	CloseMsg
	NPCMsg msg_0543_T20R0101_00028
	CloseMsg
	ApplyMovement obj_T20R0101_var_1, _0AEC
	ApplyMovement obj_T20R0101_policeman, _0ABC
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_T20R0101_policeman
	WaitSE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_T20R0101_var_1, _0B08
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00030, msg_0543_T20R0101_00031
	CloseMsg
	ApplyMovement obj_T20R0101_var_1, _0B18
	WaitMovement
	SetFlag FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_T20R0101_var_1
	WaitSE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_HIDE_ELMS_LAB_OFFICER
	SetFlag FLAG_HIDE_ELMS_LAB_FRIEND
	SetFlag FLAG_GAVE_RIVAL_NAME_TO_OFFICER
	ApplyMovement obj_player, _0A74
	WaitMovement
	ApplyMovement obj_T20R0101_doctor, _0B2C
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00032, msg_0543_T20R0101_00033
	CloseMsg
	NPCMsg msg_0543_T20R0101_00034
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	TakeItemNoCheck ITEM_MYSTERY_EGG, 1
	ApplyMovement obj_T20R0101_doctor, _0B34
	WaitMovement
	NPCMsg msg_0543_T20R0101_00035
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0B48
	WaitMovement
	GenderMsgBox msg_0543_T20R0101_00036, msg_0543_T20R0101_00037
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0B50
	WaitMovement
	GenderMsgBox msg_0543_T20R0101_00038, msg_0543_T20R0101_00039
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0B64
	WaitMovement
	SetFlag FLAG_HIDE_ROUTE_30_BATTLERS
	ClearFlag FLAG_HIDE_ROUTE_30_YOUNGSTER_JOEY
	SetVar VAR_SCENE_ELMS_LAB, 4
	SetVar VAR_UNK_408B, 1
	ClearFlag FLAG_HIDE_ROUTE_29_FRIEND
	ClearFlag FLAG_HIDE_ROUTE_29_MARILL
	SetVar VAR_SCENE_MR_POKEMONS_HOUSE, 2
	SetVar VAR_SCENE_NEW_BARK_TOWN_OW, 3
	ClearFlag FLAG_HIDE_CHERRYGROVE_MART_SPECIAL_CLERK
	SetVar VAR_SCENE_ROUTE_30_PHONE_CALL, 1
	ReleaseAll
	End

_0A59:
	NPCMsg msg_0543_T20R0101_00029
	CloseMsg
	GoTo _0904
	End

	.balign 4, 0
_0A68:
	WalkSlightlyFastNorth 8
	FaceWest
	EndMovement

	.balign 4, 0
_0A74:
	FaceNorth
	EndMovement

	.balign 4, 0
_0A7C:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0A84:
	Delay8 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0A90:
	EmoteExclamationMark
	Delay1
	FaceSouth
	Delay8 2
	FaceEast
	Delay8 2
	FaceSouth
	Delay8 2
	FaceEast
	Delay8 2
	EndMovement

	.balign 4, 0
_0ABC:
	FaceSouth
	Delay4
	WalkNormalSouth 6
	FaceEast
	WalkNormalEast
	FaceSouth
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0ADC:
	WalkFastNorth 6
	WalkFastWest
	JumpOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_0AEC:
	FaceWest
	LockDir
	WalkNormalEast
	UnlockDir
	Delay32
	FaceSouth
	EndMovement

	.balign 4, 0
_0B08:
	WalkNormalWest
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0B18:
	FaceSouth
	WalkNormalSouth 6
	WalkNormalEast
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0B2C:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0B34:
	JumpOnSpotFastSouth
	LockDir
	WalkSlightlyFasterNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_0B48:
	WalkSlightlyFastSouth
	EndMovement

	.balign 4, 0
_0B50:
	FaceNorth
	WalkSlowNorth
	Delay15
	FaceSouth
	EndMovement

	.balign 4, 0
_0B64:
	WalkSlightlyFastSouth
	EndMovement

scr_seq_T20R0101_014:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T20R0101_var_1, _0C78
	WaitMovement
	ApplyMovement obj_T20R0101_var_1, _0C84
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00058, msg_0543_T20R0101_00059
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0CA4
	ApplyMovement obj_T20R0101_var_1, _0C90
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_T20R0101_doctor, _0B2C
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00060, msg_0543_T20R0101_00061
	SetVar VAR_SPECIAL_x8004, 1
	SetVar VAR_SPECIAL_x8005, 1
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0BEF
	CallStd std_bag_is_full
	GoTo _0BF3

_0BEF:
	CallStd std_give_item_verbose
_0BF3:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00062, msg_0543_T20R0101_00063
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00064, msg_0543_T20R0101_00065
	CloseMsg
	ApplyMovement obj_T20R0101_var_1, _0CAC
	ApplyMovement obj_player, _0CB8
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00067, msg_0543_T20R0101_00068
	CloseMsg
	ApplyMovement obj_T20R0101_var_1, _0CC4
	WaitMovement
	HidePerson obj_T20R0101_var_1
	SetFlag FLAG_HIDE_ELMS_LAB_FRIEND
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_T20R0101_doctor, _0B2C
	ApplyMovement obj_player, _0CD4
	WaitMovement
	NPCMsg msg_0543_T20R0101_00069
	WaitButton
	CloseMsg
	ReleaseAll
	SetVar VAR_SCENE_ELMS_LAB, 9
	SetVar VAR_UNK_4079, 3
	SetFlag FLAG_UNK_23B
	ClearFlag FLAG_HIDE_NEW_BARK_FRIEND_2
	SetVar VAR_SCENE_NEW_BARK_EAST_EXIT, 2
	SetVar VAR_UNK_407B, 2
	End

	.balign 4, 0
_0C78:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0C84:
	WalkSlightlyFastWest 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C90:
	WalkNormalNorth 5
	WalkNormalEast
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0CA4:
	WalkNormalNorth 7
	EndMovement

	.balign 4, 0
_0CAC:
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0CB8:
	Delay8
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0CC4:
	WalkSlightlyFastSouth 3
	WalkSlightlyFastWest
	WalkSlightlyFastSouth 4
	EndMovement

	.balign 4, 0
_0CD4:
	WalkOnSpotNormalNorth
	EndMovement

_0CDC:
	Compare VAR_TEMP_x4006, 1
	GoToIfEq _0DD2
	Compare VAR_UNK_412F, 2
	GoToIfGe _1044
	Compare VAR_UNK_412F, 1
	GoToIfEq _0FE4
	Call _0DE3
	ApplyMovement obj_T20R0101_doctor, _0F48
	WaitMovement
	NPCMsg msg_0543_T20R0101_00075
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0F50
	WaitMovement
	ApplyMovement obj_partner_poke, _0F38
	WaitMovement
	NPCMsg msg_0543_T20R0101_00076
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0F48
	WaitMovement
	NPCMsg msg_0543_T20R0101_00077
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0F60
	WaitMovement
	NPCMsg msg_0543_T20R0101_00078
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0FBC
	WaitMovement
	NPCMsg msg_0543_T20R0101_00079
	CloseMsg
	GetPersonCoords 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	Compare VAR_SPECIAL_x8006, 4
	GoToIfNe _0D81
	ApplyMovement obj_T20R0101_doctor, _0F98
	GoTo _0D89

_0D81:
	ApplyMovement obj_T20R0101_doctor, _0F6C
_0D89:
	WaitMovement
	NPCMsg msg_0543_T20R0101_00080
	CloseMsg
	Compare VAR_SPECIAL_x8006, 4
	GoToIfNe _0DAD
	ApplyMovement obj_T20R0101_doctor, _0FDC
	WaitMovement
	GoTo _0DB7

_0DAD:
	ApplyMovement obj_T20R0101_doctor, _0FCC
	WaitMovement
_0DB7:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00081, msg_0543_T20R0101_00082
	WaitButton
	CloseMsg
	SetVar VAR_UNK_412F, 1
	AddVar VAR_TEMP_x4006, 1
	ReleaseAll
	End

_0DD2:
	NPCMsg msg_0543_T20R0101_00083
	WaitButton
	CloseMsg
	AddVar VAR_TEMP_x4006, 1
	ReleaseAll
	End

_0DE3:
	BufferPlayersName 0
	GenderMsgBox msg_0543_T20R0101_00084, msg_0543_T20R0101_00085
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4005
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPersonCoords 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	Compare VAR_TEMP_x4005, 0
	GoToIfNe _0E27
	ApplyMovement obj_player, _0EB8
	WaitMovement
	ApplyMovement obj_partner_poke, _0F0C
	GoTo _0EA8

_0E27:
	Compare VAR_TEMP_x4005, 3
	GoToIfNe _0E4C
	ApplyMovement obj_player, _0EC4
	WaitMovement
	ApplyMovement obj_partner_poke, _0F1C
	GoTo _0EA8

_0E4C:
	Compare VAR_TEMP_x4005, 2
	GoToIfNe _0E71
	ApplyMovement obj_player, _0ED4
	WaitMovement
	ApplyMovement obj_partner_poke, _0F30
	GoTo _0EA8

_0E71:
	Compare VAR_SPECIAL_x8006, 4
	GoToIfNe _0E96
	ApplyMovement obj_player, _0EF8
	WaitMovement
	ApplyMovement obj_partner_poke, _0F30
	GoTo _0EA8

_0E96:
	ApplyMovement obj_player, _0EE4
	WaitMovement
	ApplyMovement obj_partner_poke, _0F1C
_0EA8:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Return

	.balign 4, 0
_0EB8:
	WalkNormalSouth
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0EC4:
	WalkNormalSouth 2
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0ED4:
	WalkNormalSouth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0EE4:
	WalkNormalWest
	WalkNormalSouth 3
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0EF8:
	WalkNormalEast
	WalkNormalSouth 3
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0F0C:
	WalkNormalEast
	WalkNormalSouth
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0F1C:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalNorth
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0F30:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0F38:
	JumpOnSpotFastSouth
	Delay16
	JumpOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0F48:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0F50:
	WalkNormalSouth
	WalkNormalEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0F60:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0F6C:
	WalkNormalNorth
	WalkNormalWest 2
	WalkOnSpotNormalNorth
	Delay8 2
	LockDir
	WalkSlowEast
	WalkOnSpotNormalNorth
	WalkSlowWest
	UnlockDir
	Delay8 2
	EndMovement

	.balign 4, 0
_0F98:
	WalkNormalNorth
	Delay8 2
	LockDir
	WalkSlowEast
	WalkOnSpotNormalNorth
	WalkSlowWest
	UnlockDir
	Delay8 2
	EndMovement

	.balign 4, 0
_0FBC:
	WalkNormalNorth
	WalkNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0FCC:
	WalkNormalSouth
	WalkNormalEast 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0FDC:
	WalkNormalSouth
	EndMovement

_0FE4:
	MonGetFriendship VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 220
	GoToIfGe _0FFF
	GoTo _03F5
	End

_0FFF:
	Call _0DE3
	GenderMsgBox msg_0543_T20R0101_00086, msg_0543_T20R0101_00087
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0F60
	WaitMovement
	NPCMsg msg_0543_T20R0101_00088
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0F50
	WaitMovement
	NPCMsg msg_0543_T20R0101_00089
	CloseMsg
	ApplyMovement obj_T20R0101_doctor, _0FBC
	WaitMovement
	NPCMsg msg_0543_T20R0101_00090
	WaitButton
	CloseMsg
	SetVar VAR_UNK_412F, 2
	ReleaseAll
	End

_1044:
	NPCMsg msg_0543_T20R0101_00091
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0101_004:
	End

scr_seq_T20R0101_005:
	BufferPlayersName 0
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0543_T20R0101_00093
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0101_006:
	BufferPlayersName 0
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0543_T20R0101_00094
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0101_007:
	BufferPlayersName 0
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0543_T20R0101_00095
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0101_008:
	BufferPlayersName 0
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0543_T20R0101_00096
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0101_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0543_T20R0101_00097
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0101_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_GOT_STARTER, _1107
	NPCMsg msg_0543_T20R0101_00092
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _1103
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PlayFanfare SEQ_ME_ASA
	HealParty
	ScrCmd_436
	RestoreOverworld
	WaitFanfare
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_1103:
	ReleaseAll
	End

_1107:
	NPCMsg msg_0543_T20R0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0101_015:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T20R0101_assistantm, _113C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0543_T20R0101_00056
	CloseMsg
	ApplyMovement obj_T20R0101_assistantm, _1148
	WaitMovement
	SetVar VAR_UNK_40FC, 3
	ReleaseAll
	End

	.balign 4, 0
_113C:
	WalkNormalWest 5
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_1148:
	WalkNormalNorth
	WalkNormalEast 5
	WalkOnSpotNormalSouth
	EndMovement
	.balign 4, 0
