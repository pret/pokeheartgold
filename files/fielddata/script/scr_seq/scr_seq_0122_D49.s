#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49.h"
#include "msgdata/msg/msg_0137_D49.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D49_000
	ScrDef scr_seq_D49_001
	ScrDef scr_seq_D49_002
	ScrDef scr_seq_D49_003
	ScrDef scr_seq_D49_004
	ScrDef scr_seq_D49_005
	ScrDef scr_seq_D49_006
	ScrDef scr_seq_D49_007
	ScrDef scr_seq_D49_008
	ScrDef scr_seq_D49_009
	ScrDef scr_seq_D49_010
	ScrDef scr_seq_D49_011
	ScrDef scr_seq_D49_012
	ScrDef scr_seq_D49_013
	ScrDef scr_seq_D49_014
	ScrDef scr_seq_D49_015
	ScrDef scr_seq_D49_016
	ScrDef scr_seq_D49_017
	ScrDef scr_seq_D49_018
	ScrDef scr_seq_D49_019
	ScrDef scr_seq_D49_020
	ScrDef scr_seq_D49_021
	ScrDef scr_seq_D49_022
	ScrDef scr_seq_D49_023
	ScrDefEnd

scr_seq_D49_018:
	GoToIfUnset FLAG_UNK_189, _0073
	ClearFlag FLAG_UNK_189
	End

_0073:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _00C2
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _00C2
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _00C2
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _00CC
	Compare VAR_UNK_40DB, 0
	GoToIfEq _00CC
	SetFlag FLAG_HIDE_CAMERON
	ClearFlag FLAG_UNK_27F
	End

_00C2:
	ClearFlag FLAG_HIDE_CAMERON
	SetFlag FLAG_UNK_27F
	End

_00CC:
	SetFlag FLAG_HIDE_CAMERON
	SetFlag FLAG_UNK_27F
	End

scr_seq_D49_000:
	ScrCmd_609
	LockAll
	Release obj_D49_tsure_poke_static_oddish
	Release obj_D49_gsboy2
	ApplyMovement obj_D49_thlonowner, _0414
	WaitMovement
	NPCMsg msg_0137_D49_00000
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 40
	GoToIfNe _011A
	ApplyMovement obj_D49_thlonowner, _043C
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _04A8
	GoTo _01D9

_011A:
	Compare VAR_TEMP_x4000, 41
	GoToIfNe _013D
	ApplyMovement obj_D49_thlonowner, _044C
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _04BC
	GoTo _01D9

_013D:
	Compare VAR_TEMP_x4000, 42
	GoToIfNe _0160
	ApplyMovement obj_D49_thlonowner, _045C
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _04D0
	GoTo _01D9

_0160:
	Compare VAR_TEMP_x4000, 43
	GoToIfNe _0183
	ApplyMovement obj_D49_thlonowner, _0464
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _04DC
	GoTo _01D9

_0183:
	Compare VAR_TEMP_x4000, 44
	GoToIfNe _01A6
	ApplyMovement obj_D49_thlonowner, _0474
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _04F0
	GoTo _01D9

_01A6:
	Compare VAR_TEMP_x4000, 39
	GoToIfNe _01C9
	ApplyMovement obj_D49_thlonowner, _042C
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _0494
	GoTo _01D9

_01C9:
	ApplyMovement obj_D49_thlonowner, _0484
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _0504
_01D9:
	WaitMovement
	NPCMsg msg_0137_D49_00006
	CloseMsg
	ApplyMovement obj_D49_thlonowner, _0424
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _0424
	WaitMovement
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _020C
	NPCMsg msg_0137_D49_00005
	GoTo _0218

_020C:
	GetPartyLeadAlive VAR_SPECIAL_x8000
	BufferMonSpeciesName 1, VAR_SPECIAL_x8000
	NPCMsg msg_0137_D49_00001
_0218:
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4000, 40
	GoToIfNe _024F
	ApplyMovement obj_D49_thlonowner, _0528
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _05A0
	ApplyMovement obj_player, _0658
	GoTo _033E

_024F:
	Compare VAR_TEMP_x4000, 41
	GoToIfNe _027A
	ApplyMovement obj_D49_thlonowner, _0538
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _05BC
	ApplyMovement obj_player, _066C
	GoTo _033E

_027A:
	Compare VAR_TEMP_x4000, 42
	GoToIfNe _02A5
	ApplyMovement obj_D49_thlonowner, _0548
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _05D8
	ApplyMovement obj_player, _0680
	GoTo _033E

_02A5:
	Compare VAR_TEMP_x4000, 43
	GoToIfNe _02D0
	ApplyMovement obj_D49_thlonowner, _0554
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _05F0
	ApplyMovement obj_player, _068C
	GoTo _033E

_02D0:
	Compare VAR_TEMP_x4000, 44
	GoToIfNe _02FB
	ApplyMovement obj_D49_thlonowner, _0564
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _060C
	ApplyMovement obj_player, _06A0
	GoTo _033E

_02FB:
	Compare VAR_TEMP_x4000, 39
	GoToIfNe _0326
	ApplyMovement obj_D49_thlonowner, _0518
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _0584
	ApplyMovement obj_player, _0644
	GoTo _033E

_0326:
	ApplyMovement obj_D49_thlonowner, _0574
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _0628
	ApplyMovement obj_player, _06B4
_033E:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0137_D49_00002
	CloseMsg
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ApplyMovement 241, _0400
	WaitMovement
	NPCMsg msg_0137_D49_00003
	CloseMsg
	ApplyMovement 241, _0408
	WaitMovement
	ScrCmd_103
	NPCMsg msg_0137_D49_00004
	CloseMsg
	ApplyMovement obj_D49_thlonowner, _06C8
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _06D0
	WaitMovement
	ScrCmd_307 1, 0, 10, 22, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_D49_thlonowner, _06DC
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _06E4
	WaitMovement
	HidePerson obj_D49_thlonowner
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _041C
	WaitMovement
	PlayCry SPECIES_POLIWRATH, 0
	WaitCry
	ApplyMovement obj_D49_tsure_poke_static_poliwrath, _06E4
	WaitMovement
	HidePerson obj_D49_tsure_poke_static_poliwrath
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	ReleaseAll
	SetVar VAR_UNK_40DB, 1
	SetFlag FLAG_UNK_225
	SetFlag FLAG_UNK_982
	End

	.balign 4, 0
_0400:
	WalkNormalNorth 10
	EndMovement

	.balign 4, 0
_0408:
	Delay32
	WalkSlightlyFastSouth 10
	EndMovement

	.balign 4, 0
_0414:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_041C:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0424:
	WalkFastSouth
	EndMovement

	.balign 4, 0
_042C:
	WalkSlightlyFastSouth 2
	WalkSlightlyFastWest 3
	WalkSlightlyFastSouth
	EndMovement

	.balign 4, 0
_043C:
	WalkSlightlyFastSouth 2
	WalkSlightlyFastWest 2
	WalkSlightlyFastSouth
	EndMovement

	.balign 4, 0
_044C:
	WalkSlightlyFastSouth 2
	WalkSlightlyFastWest
	WalkSlightlyFastSouth
	EndMovement

	.balign 4, 0
_045C:
	WalkSlightlyFastSouth 3
	EndMovement

	.balign 4, 0
_0464:
	WalkSlightlyFastSouth 2
	WalkSlightlyFastEast
	WalkSlightlyFastSouth
	EndMovement

	.balign 4, 0
_0474:
	WalkSlightlyFastSouth 2
	WalkSlightlyFastEast 2
	WalkSlightlyFastSouth
	EndMovement

	.balign 4, 0
_0484:
	WalkSlightlyFastSouth 2
	WalkSlightlyFastEast 3
	WalkSlightlyFastSouth
	EndMovement

	.balign 4, 0
_0494:
	WalkSlightlyFastEast
	WalkSlightlyFastSouth 2
	WalkSlightlyFastWest 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04A8:
	WalkSlightlyFastEast
	WalkSlightlyFastSouth 2
	WalkSlightlyFastWest 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04BC:
	WalkSlightlyFastEast
	WalkSlightlyFastSouth 2
	WalkSlightlyFastWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04D0:
	WalkSlightlyFastEast
	WalkSlightlyFastSouth 2
	EndMovement

	.balign 4, 0
_04DC:
	WalkSlightlyFastEast
	WalkSlightlyFastSouth 2
	WalkSlightlyFastEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04F0:
	WalkSlightlyFastEast
	WalkSlightlyFastSouth 2
	WalkSlightlyFastEast 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0504:
	WalkSlightlyFastEast
	WalkSlightlyFastSouth 2
	WalkSlightlyFastEast 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0518:
	WalkNormalEast 3
	WalkNormalNorth 21
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0528:
	WalkNormalEast 2
	WalkNormalNorth 21
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0538:
	WalkNormalEast
	WalkNormalNorth 21
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0548:
	WalkNormalNorth 21
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0554:
	WalkNormalWest
	WalkNormalNorth 21
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0564:
	WalkNormalWest 2
	WalkNormalNorth 21
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0574:
	WalkNormalWest 3
	WalkNormalNorth 21
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0584:
	WalkNormalSouth
	WalkNormalEast 3
	WalkNormalNorth 20
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05A0:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalNorth 20
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05BC:
	WalkNormalSouth
	WalkNormalEast
	WalkNormalNorth 20
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05D8:
	WalkNormalSouth
	WalkNormalNorth 20
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05F0:
	WalkNormalSouth
	WalkNormalWest
	WalkNormalNorth 20
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_060C:
	WalkNormalSouth
	WalkNormalWest 2
	WalkNormalNorth 20
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0628:
	WalkNormalSouth
	WalkNormalWest 3
	WalkNormalNorth 20
	WalkNormalWest
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0644:
	Delay8 2
	WalkNormalNorth
	WalkNormalEast 3
	WalkNormalNorth 19
	EndMovement

	.balign 4, 0
_0658:
	Delay8 2
	WalkNormalNorth
	WalkNormalEast 2
	WalkNormalNorth 19
	EndMovement

	.balign 4, 0
_066C:
	Delay8 2
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 19
	EndMovement

	.balign 4, 0
_0680:
	Delay8 2
	WalkNormalNorth 20
	EndMovement

	.balign 4, 0
_068C:
	Delay8 2
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 19
	EndMovement

	.balign 4, 0
_06A0:
	Delay8 2
	WalkNormalNorth
	WalkNormalWest 2
	WalkNormalNorth 19
	EndMovement

	.balign 4, 0
_06B4:
	Delay8 2
	WalkNormalNorth
	WalkNormalWest 3
	WalkNormalNorth 19
	EndMovement

	.balign 4, 0
_06C8:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_06D0:
	WalkNormalEast
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_06DC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_06E4:
	WalkNormalNorth
	EndMovement

scr_seq_D49_001:
	SimpleNPCMsg msg_0137_D49_00007
	End

scr_seq_D49_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_ODDISH, 0
	NPCMsg msg_0137_D49_00008
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_002:
	SimpleNPCMsg msg_0137_D49_00009
	End

scr_seq_D49_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MEOWTH, 0
	NPCMsg msg_0137_D49_00010
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_724 12, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfGe _076E
	NPCMsg msg_0137_D49_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_076E:
	GoToIfSet FLAG_UNK_154, _07CB
	NPCMsg msg_0137_D49_00012
	ScrCmd_724 16, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1000
	GoToIfGe _079A
	NPCMsg msg_0137_D49_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_079A:
	NPCMsg msg_0137_D49_00014
	GoToIfNoItemSpace ITEM_RARE_CANDY, 1, _07D6
	CallStd std_give_item_verbose
	ScrCmd_725 0, 100
	SetFlag FLAG_UNK_154
_07CB:
	NPCMsg msg_0137_D49_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_07D6:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_PIDGEY, 0
	NPCMsg msg_0137_D49_00016
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_004:
	SimpleNPCMsg msg_0137_D49_00017
	End

scr_seq_D49_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_SLOWBRO, 0
	NPCMsg msg_0137_D49_00018
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_005:
	SimpleNPCMsg msg_0137_D49_00019
	End

scr_seq_D49_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MACHOP, 0
	NPCMsg msg_0137_D49_00020
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_006:
	SimpleNPCMsg msg_0137_D49_00021
	End

scr_seq_D49_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_SLOWPOKE, 0
	NPCMsg msg_0137_D49_00022
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_FARFETCHD, 0
	NPCMsg msg_0137_D49_00023
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_PSYDUCK, 0
	NPCMsg msg_0137_D49_00024
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_UNK_997, _093E
	NPCMsg msg_0137_D49_00025
_08D1:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 326, 255, 0
	MenuItemAdd 327, 255, 1
	MenuItemAdd 157, 255, 2
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _091D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0928
	GoTo _0933

_0917:
	CloseMsg
	ReleaseAll
	End

_091D:
	NPCMsg msg_0137_D49_00030
	GoTo _08D1
	End

_0928:
	NPCMsg msg_0137_D49_00031
	GoTo _08D1
	End

_0933:
	NPCMsg msg_0137_D49_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

_093E:
	NPCMsg msg_0137_D49_00026
	BufferPlayersName 0
	NPCMsg msg_0137_D49_00027
	PlayFanfare SEQ_ME_KEYITEM
	WaitFanfare
	NPCMsg msg_0137_D49_00028
	SetFlag FLAG_UNK_997
	NPCMsg msg_0137_D49_00029
	GoTo _08D1
	End

_095F:
	ApplyMovement obj_D49_shopm1_2, _09D4
	WaitMovement
	NPCMsg msg_0137_D49_00039
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4007, 0
	GoToIfNe _0993
	ApplyMovement obj_player, _09E0
	GoTo _09B6

_0993:
	Compare VAR_TEMP_x4007, 1
	GoToIfNe _09AE
	ApplyMovement obj_player, _09EC
	GoTo _09B6

_09AE:
	ApplyMovement obj_player, _09F8
_09B6:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D49_shopm1_2, _0BF4
	WaitMovement
	GoTo _093E
	End

	.balign 4, 0
_09D4:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_09E0:
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_09EC:
	WalkNormalEast 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_09F8:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_D49_019:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4007, 0
	GoToIfUnset FLAG_UNK_997, _095F
_0A1D:
	ShowMoneyBox 21, 1
	ScrCmd_741 VAR_TEMP_x4007, VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	ApplyMovement obj_D49_shopm1_2, _0BEC
	WaitMovement
	NPCMsg msg_0137_D49_00033
_0A3A:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 328, 255, 0
	MenuItemAdd 329, 255, 1
	MenuItemAdd 44, 255, 2
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _0AD6
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0AF6
	HasEnoughMoneyVar VAR_SPECIAL_RESULT, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0AEB
	NPCMsg msg_0137_D49_00034
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	HideMoneyBox
	ScrCmd_740 VAR_SPECIAL_x8000, VAR_SPECIAL_x8003
	RestoreOverworld
	ShowMoneyBox 21, 1
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_x8003, 0
	GoToIfNe _0AD0
	NPCMsg msg_0137_D49_00036
	GoTo _0AD9

_0AD0:
	SubMoneyVar VAR_SPECIAL_x8001
	UpdateMoneyBox
_0AD6:
	NPCMsg msg_0137_D49_00035
_0AD9:
	CloseMsg
	HideMoneyBox
	ApplyMovement obj_D49_shopm1_2, _0BF4
	WaitMovement
	ReleaseAll
	End

_0AEB:
	NPCMsg msg_0137_D49_00037
	GoTo _0AD9
	End

_0AF6:
	Compare VAR_SPECIAL_x8002, 2000
	GoToIfGe _0B80
	Compare VAR_SPECIAL_x8002, 1000
	GoToIfGe _0B77
	Compare VAR_SPECIAL_x8002, 500
	GoToIfGe _0B6E
	Compare VAR_SPECIAL_x8002, 300
	GoToIfGe _0B65
	Compare VAR_SPECIAL_x8002, 200
	GoToIfGe _0B5C
	Compare VAR_SPECIAL_x8002, 100
	GoToIfGe _0B53
	GoTo _0B4A

_0B4A:
	NPCMsg msg_0137_D49_00041
	GoTo _0B89

_0B53:
	NPCMsg msg_0137_D49_00042
	GoTo _0B89

_0B5C:
	NPCMsg msg_0137_D49_00043
	GoTo _0B89

_0B65:
	NPCMsg msg_0137_D49_00044
	GoTo _0B89

_0B6E:
	NPCMsg msg_0137_D49_00045
	GoTo _0B89

_0B77:
	NPCMsg msg_0137_D49_00046
	GoTo _0B89

_0B80:
	NPCMsg msg_0137_D49_00047
	GoTo _0B89

_0B89:
	NPCMsg msg_0137_D49_00040
	NPCMsg msg_0137_D49_00038
	GoTo _0A3A
	End

scr_seq_D49_020:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4007, 1
	GoToIfUnset FLAG_UNK_997, _095F
	GoTo _0A1D
	End

scr_seq_D49_021:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4007, 2
	GoToIfUnset FLAG_UNK_997, _095F
	GoTo _0A1D
	End

scr_seq_D49_022:
	SimpleNPCMsg msg_0137_D49_00048
	End

	.balign 4, 0
_0BEC:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0BF4:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D49_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0E44
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0E58
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0C75
	ApplyMovement obj_player, _0E6C
	ApplyMovement obj_D49_gsmiddleman1, _0EB8
	GoTo _0CC3

_0C75:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0C90
	ApplyMovement obj_player, _0E84
	GoTo _0CC3

_0C90:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0CB3
	ApplyMovement obj_player, _0EA4
	ApplyMovement obj_D49_gsmiddleman1, _0EB8
	GoTo _0CC3

_0CB3:
	ApplyMovement obj_player, _0E90
	ApplyMovement obj_D49_gsmiddleman1, _0EB8
_0CC3:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0CEA
	ApplyMovement obj_partner_poke, _0EC4
	WaitMovement
_0CEA:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 13
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

scr_seq_D49_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0E44
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0E58
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0D9D
	ApplyMovement obj_player, _0E6C
	ApplyMovement obj_D49_gsmiddleman1_2, _0EB8
	GoTo _0DEB

_0D9D:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0DB8
	ApplyMovement obj_player, _0E84
	GoTo _0DEB

_0DB8:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0DDB
	ApplyMovement obj_player, _0EA4
	ApplyMovement obj_D49_gsmiddleman1_2, _0EB8
	GoTo _0DEB

_0DDB:
	ApplyMovement obj_player, _0E90
	ApplyMovement obj_D49_gsmiddleman1_2, _0EB8
_0DEB:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0E12
	ApplyMovement obj_partner_poke, _0EC4
	WaitMovement
_0E12:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 14
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E44:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E58:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0E6C:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0E84:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0E90:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0EA4:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0EB8:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0EC4:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D49_023:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0137_D49_00049, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
