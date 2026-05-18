#include "constants/events.h"
#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0201.h"
#include "msgdata/msg/msg_0146_D51R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D51R0201_000
	ScrDef scr_seq_D51R0201_001
	ScrDef scr_seq_D51R0201_002
	ScrDef scr_seq_D51R0201_003
	ScrDef scr_seq_D51R0201_004
	ScrDef scr_seq_D51R0201_005
	ScrDef scr_seq_D51R0201_006
	ScrDef scr_seq_D51R0201_007
	ScrDefEnd

scr_seq_D51R0201_002:
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 7
	GoToIfEq _0065
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 8
	GoToIfEq _0065
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 9
	GoToIfEq _0065
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 12
	GoToIfEq _0065
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	GoToIfEq _0065
	End

_0065:
	MystriStageGymmickInit
	End

scr_seq_D51R0201_007:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00C4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	ReleaseAll
	End

scr_seq_D51R0201_006:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00C4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 4
	ReleaseAll
	End

	.balign 4, 0
_00C4:
	WalkNormalSouth 2
	EndMovement

scr_seq_D51R0201_000:
	End

scr_seq_D51R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 8
	GoToIfEq _0165
	GetPartyLeadAlive VAR_TEMP_x4005
	FollowerPokeIsEventTrigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4005, VAR_TEMP_x4006
	Compare VAR_TEMP_x4006, 1
	GoToIfEq _011A
	FollowerPokeIsEventTrigger EVENT_ARCEUS_HALL_OF_ORIGIN, VAR_TEMP_x4005, VAR_TEMP_x4007
	Compare VAR_TEMP_x4007, 1
	GoToIfEq _011A
	NPCMsg msg_0146_D51R0201_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011A:
	Compare VAR_TEMP_x4004, 1
	GoToIfEq _0154
	NPCMsg msg_0146_D51R0201_00000
	CloseMsg
	GetPartyCount VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 2
	GoToIfGe _0154
	ApplyMovement obj_D51R0201_champion, _02CC
	WaitMovement
	NPCMsg msg_0146_D51R0201_00006
	CloseMsg
	GoTo _0170
	End

_0154:
	NPCMsg msg_0146_D51R0201_00002
	WaitButton
	CloseMsg
	SetVar VAR_TEMP_x4004, 1
	ReleaseAll
	End

_0165:
	NPCMsg msg_0146_D51R0201_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0170:
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 8
	SetVar VAR_UNK_4104, 1
	GetPlayerFacing VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _019B
	ApplyMovement obj_D51R0201_champion, _02B4
	GoTo _01BE

_019B:
	Compare VAR_TEMP_x4002, 3
	GoToIfNe _01B6
	ApplyMovement obj_D51R0201_champion, _02BC
	GoTo _01BE

_01B6:
	ApplyMovement obj_D51R0201_champion, _02C4
_01BE:
	WaitMovement
	NPCMsg msg_0146_D51R0201_00004
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _01EA
	ApplyMovement obj_D51R0201_champion, _02D4
	GoTo _01F2

_01EA:
	ApplyMovement obj_D51R0201_champion, _02E0
_01F2:
	WaitMovement
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0217
	ApplyMovement obj_player, _0390
	ApplyMovement obj_D51R0201_champion, _0308
	GoTo _024A

_0217:
	Compare VAR_TEMP_x4002, 3
	GoToIfNe _023A
	ApplyMovement obj_player, _03A0
	ApplyMovement obj_D51R0201_champion, _0308
	GoTo _024A

_023A:
	ApplyMovement obj_player, _03B4
	ApplyMovement obj_D51R0201_champion, _02EC
_024A:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0146_D51R0201_00005
	CloseMsg
	ApplyMovement obj_D51R0201_champion, _0324
	WaitMovement
	NPCMsg msg_0146_D51R0201_00007
	CloseMsg
	ApplyMovement obj_D51R0201_champion, _0334
	WaitMovement
	NPCMsg msg_0146_D51R0201_00008
	CloseMsg
	ApplyMovement obj_D51R0201_champion, _0348
	WaitMovement
	NPCMsg msg_0146_D51R0201_00009
	CloseMsg
	ApplyMovement obj_D51R0201_champion, _0364
	WaitMovement
	NPCMsg msg_0146_D51R0201_00010
	CloseMsg
	ApplyMovement obj_D51R0201_champion, _0370
	ApplyMovement obj_player, _03C8
	WaitMovement
	NPCMsg msg_0146_D51R0201_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_02B4:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02BC:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02C4:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_02CC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02D4:
	WalkNormalWest
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_02E0:
	WalkNormalEast
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_02EC:
	Delay16
	WalkNormalEast
	WalkNormalNorth 3
	WalkNormalEast
	WalkNormalNorth 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0308:
	Delay16
	WalkNormalWest
	WalkNormalNorth 3
	WalkNormalEast
	WalkNormalNorth 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0324:
	WalkNormalEast 3
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0334:
	WalkNormalSouth
	WalkNormalWest 8
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0348:
	WalkNormalNorth 3
	WalkNormalEast 2
	WalkNormalNorth 3
	WalkNormalEast 2
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0364:
	WalkNormalSouth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0370:
	WalkNormalEast
	WalkNormalSouth 6
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0384:
	WalkOnSpotNormalSouth
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0390:
	WalkNormalNorth 6
	Delay16
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_03A0:
	WalkNormalEast
	WalkNormalNorth 5
	Delay16
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_03B4:
	WalkNormalWest
	WalkNormalNorth 5
	Delay16
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_03C8:
	Delay8 2
	WalkOnSpotNormalEast
	Delay8 3
	WalkOnSpotNormalEast
	EndMovement

scr_seq_D51R0201_004:
	ScrCmd_609
	LockAll
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	GoToIfLt _0430
	Compare VAR_UNK_4103, 1
	GoToIfEq _0545
	Call _0550
	Compare VAR_TEMP_x400A, 0
	GoToIfEq _0633
	Compare VAR_TEMP_x400A, 2
	GoToIfEq _061D
	Compare VAR_TEMP_x400A, 3
	GoToIfEq _0628
	NPCMsg msg_0146_D51R0201_00027
	GoTo _0433

_0430:
	NPCMsg msg_0146_D51R0201_00013
_0433:
	ScrCmd_820 1
	SetVar VAR_TEMP_x4009, 483
	GoTo _0514
	End

scr_seq_D51R0201_003:
	ScrCmd_609
	LockAll
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	GoToIfLt _0498
	Compare VAR_UNK_4103, 2
	GoToIfEq _0545
	Call _0550
	Compare VAR_TEMP_x400A, 0
	GoToIfEq _0633
	Compare VAR_TEMP_x400A, 2
	GoToIfEq _061D
	Compare VAR_TEMP_x400A, 3
	GoToIfEq _0628
	NPCMsg msg_0146_D51R0201_00028
	GoTo _049B

_0498:
	NPCMsg msg_0146_D51R0201_00014
_049B:
	ScrCmd_820 2
	SetVar VAR_TEMP_x4009, 484
	GoTo _0514
	End

scr_seq_D51R0201_005:
	ScrCmd_609
	LockAll
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	GoToIfLt _0500
	Compare VAR_UNK_4103, 3
	GoToIfEq _0545
	Call _0550
	Compare VAR_TEMP_x400A, 0
	GoToIfEq _0633
	Compare VAR_TEMP_x400A, 2
	GoToIfEq _061D
	Compare VAR_TEMP_x400A, 3
	GoToIfEq _0628
	NPCMsg msg_0146_D51R0201_00029
	GoTo _0503

_0500:
	NPCMsg msg_0146_D51R0201_00015
_0503:
	ScrCmd_820 3
	SetVar VAR_TEMP_x4009, 487
	GoTo _0514
	End

_0514:
	NopVar490 VAR_TEMP_x4009
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _063E
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _053C
	End

_053C:
	CloseMsg
	ScrCmd_820 0
	ReleaseAll
	End

_0545:
	NPCMsg msg_0146_D51R0201_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0550:
	GetPartyCount VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 1
	GoToIfEq _056D
	NopVar490 VAR_TEMP_x4008
	SetVar VAR_TEMP_x400A, 2
	Return

_056D:
	GetPartyLeadAlive VAR_TEMP_x4000
	Compare VAR_UNK_4102, 1
	GoToIfNe _05B2
	FollowerPokeIsEventTrigger EVENT_ARCEUS_HALL_OF_ORIGIN, VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0605
	FollowerPokeIsEventTrigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _060D
	GoTo _0615

_05A6:
	GoTo _05F9

_05B2:
	Compare VAR_UNK_4102, 2
	GoToIfNe _05F3
	FollowerPokeIsEventTrigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0605
	FollowerPokeIsEventTrigger EVENT_ARCEUS_HALL_OF_ORIGIN, VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _060D
	GoTo _0615

_05ED:
	GoTo _05F9

_05F3:
	GoTo _0615

_05F9:
	NopVar490 VAR_TEMP_x4007
	SetVar VAR_TEMP_x400A, 2
	Return

_0605:
	SetVar VAR_TEMP_x400A, 1
	Return

_060D:
	SetVar VAR_TEMP_x400A, 3
	Return

_0615:
	SetVar VAR_TEMP_x400A, 0
	Return

_061D:
	NPCMsg msg_0146_D51R0201_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0628:
	NPCMsg msg_0146_D51R0201_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0633:
	NPCMsg msg_0146_D51R0201_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_063E:
	CloseMsg
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	GoToIfNe _0659
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	GoTo _065F

_0659:
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 9
_065F:
	ScrCmd_820 0
	SetVar VAR_UNK_4104, 0
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	GetPlayerFacing VAR_TEMP_x4002
	Compare VAR_TEMP_x4009, 483
	GoToIfNe _0691
	GoTo _06B0

_068B:
	GoTo _06B0

_0691:
	Compare VAR_TEMP_x4009, 484
	GoToIfNe _06AA
	GoTo _0731

_06A4:
	GoTo _06B0

_06AA:
	GoTo _07B2

_06B0:
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _06D3
	ApplyMovement obj_partner_poke, _0BE4
	ApplyMovement 241, _0C28
	GoTo _0729

_06D3:
	Compare VAR_TEMP_x4002, 3
	GoToIfNe _06F6
	ApplyMovement obj_partner_poke, _0BF4
	ApplyMovement 241, _0C28
	GoTo _0729

_06F6:
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _0719
	ApplyMovement obj_partner_poke, _0C08
	ApplyMovement 241, _0C28
	GoTo _0729

_0719:
	ApplyMovement obj_partner_poke, _0C18
	ApplyMovement 241, _0C28
_0729:
	WaitMovement
	GoTo _0833

_0731:
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0754
	ApplyMovement obj_partner_poke, _0C34
	ApplyMovement 241, _0C78
	GoTo _07AA

_0754:
	Compare VAR_TEMP_x4002, 3
	GoToIfNe _0777
	ApplyMovement obj_partner_poke, _0C44
	ApplyMovement 241, _0C78
	GoTo _07AA

_0777:
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _079A
	ApplyMovement obj_partner_poke, _0C54
	ApplyMovement 241, _0C78
	GoTo _07AA

_079A:
	ApplyMovement obj_partner_poke, _0C68
	ApplyMovement 241, _0C78
_07AA:
	WaitMovement
	GoTo _0833

_07B2:
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _07D5
	ApplyMovement obj_partner_poke, _0C84
	ApplyMovement 241, _0CC4
	GoTo _082B

_07D5:
	Compare VAR_TEMP_x4002, 3
	GoToIfNe _07F8
	ApplyMovement obj_partner_poke, _0C90
	ApplyMovement 241, _0CC4
	GoTo _082B

_07F8:
	Compare VAR_TEMP_x4002, 2
	GoToIfNe _081B
	ApplyMovement obj_partner_poke, _0CA0
	ApplyMovement 241, _0CC4
	GoTo _082B

_081B:
	ApplyMovement obj_partner_poke, _0CB0
	ApplyMovement 241, _0CC4
_082B:
	WaitMovement
	GoTo _0833

_0833:
	FadeOutBGM 0, 30
	PlaySE SEQ_SE_GS_TAMASYUTUGEN
	UnownCircle
	StopSE SEQ_SE_GS_DOWSING_LOOP
	Cinematic 2
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	GoToIfEq _086E
	Release obj_D51R0201_champion
	MovePersonFacing obj_D51R0201_champion, 16, 1, 28, DIR_NORTH
	Wait 5, VAR_SPECIAL_RESULT
	Lock obj_D51R0201_champion
_086E:
	Compare VAR_TEMP_x4009, 483
	GoToIfNe _0889
	ApplyMovement obj_player, _0CCC
	GoTo _08AC

_0889:
	Compare VAR_TEMP_x4009, 484
	GoToIfNe _08A4
	ApplyMovement obj_player, _0CD8
	GoTo _08AC

_08A4:
	ApplyMovement obj_player, _0CE4
_08AC:
	Wait 150, VAR_SPECIAL_RESULT
	FadeScreen 6, 30, 1, RGB_BLACK
	WaitFade
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NopVar490 VAR_SPECIAL_x8004
	NopVar490 VAR_SPECIAL_x8005
	ApplyMovement 241, _0CF0
	WaitMovement
	PlaySE SEQ_SE_GS_TAMASYUTUGEN
	Compare VAR_TEMP_x4009, 483
	GoToIfNe _08F6
	ScrCmd_817 0
	GoTo _090F

_08F6:
	Compare VAR_TEMP_x4009, 484
	GoToIfNe _090C
	ScrCmd_817 1
	GoTo _090F

_090C:
	ScrCmd_817 2
_090F:
	StopSE SEQ_SE_GS_TAMASYUTUGEN
	ApplyMovement obj_player, _0D0C
	WaitMovement
	ScrCmd_819
	Wait 2, VAR_SPECIAL_RESULT
	NPCMsg msg_0146_D51R0201_00025
	NopVar490 VAR_TEMP_x4009
	BufferPlayersName 0
	BufferSpeciesName 1, VAR_TEMP_x4009, 0, 0
	PlayFanfare SEQ_ME_SHINKAOME
	NPCMsg msg_0146_D51R0201_00026
	WaitFanfare
	CloseMsg
	ApplyMovement 241, _0CF8
	WaitMovement
	ScrCmd_103
	ResetBGM
	NopVar490 VAR_TEMP_x4009
	Compare VAR_TEMP_x4009, 483
	GoToIfNe _097B
	GiveMon SPECIES_DIALGA, 1, 135, 0, 0, VAR_SPECIAL_RESULT
	SetVar VAR_UNK_4103, 1
	GoTo _09B6

_097B:
	Compare VAR_TEMP_x4009, 484
	GoToIfNe _09A2
	GiveMon SPECIES_PALKIA, 1, 136, 0, 0, VAR_SPECIAL_RESULT
	SetVar VAR_UNK_4103, 2
	GoTo _09B6

_09A2:
	GiveMon SPECIES_GIRATINA, 1, 112, 1, 26, VAR_SPECIAL_RESULT
	SetVar VAR_UNK_4103, 3
_09B6:
	TouchscreenMenuHide
	NPCMsg msg_0146_D51R0201_00032
	GetMenuChoice VAR_SPECIAL_RESULT
	CloseMsg
	ScrCmd_815 0
	Compare VAR_SPECIAL_RESULT, 0
	CallIfEq _0BB2
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	GoToIfEq _0A4D
	ApplyMovement obj_D51R0201_champion, _0D28
	ApplyMovement obj_player, _0D00
	ApplyMovement obj_partner_poke, _0D1C
	WaitMovement
	NPCMsg msg_0146_D51R0201_00016
	CloseMsg
	ApplyMovement obj_D51R0201_champion, _0D4C
	WaitMovement
	NPCMsg msg_0146_D51R0201_00017
	CloseMsg
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	FadeScreen 6, 6, 0, RGB_BLACK
	WaitFade
	Wait 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_BLACK
	WaitFade
	ApplyMovement obj_D51R0201_champion, _0D30
	WaitMovement
	NPCMsg msg_0146_D51R0201_00018
	CloseMsg
	ApplyMovement obj_D51R0201_champion, _0D44
	WaitMovement
	NPCMsg msg_0146_D51R0201_00019
	CloseMsg
_0A4D:
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	FadeScreen 6, 6, 0, RGB_BLACK
	WaitFade
	Wait 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_BLACK
	WaitFade
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	GoToIfEq _0AAA
	GetPartyLeadAlive VAR_TEMP_x4005
	FollowerPokeIsEventTrigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4005, VAR_TEMP_x4006
	Compare VAR_TEMP_x4006, 1
	GoToIfNe _0AA0
	SetVar VAR_UNK_4102, 1
	GoTo _0AA6

_0AA0:
	SetVar VAR_UNK_4102, 2
_0AA6:
	ClearFlag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
_0AAA:
	PlaySE SEQ_SE_DP_KAIDAN2
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfNe _0AE5
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 9, 24, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0BAE

_0AE5:
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfNe _0B1C
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 9, 24, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0BAE

_0B1C:
	Compare VAR_UNOWN_REPORT_LEVEL, 8
	GoToIfNe _0B53
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 9, 24, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0BAE

_0B53:
	Compare VAR_UNOWN_REPORT_LEVEL, 9
	GoToIfNe _0B8A
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 9, 24, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0BAE

_0B8A:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 9, 24, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0BAE:
	ReleaseAll
	End

_0BB2:
	GetPartyCount VAR_SPECIAL_RESULT
	SubVar VAR_SPECIAL_RESULT, 1
	SetVar VAR_TEMP_x4008, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_SPECIAL_RESULT, VAR_TEMP_x4008
	ScrCmd_819
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

	.balign 4, 0
_0BE4:
	WalkSlowEast 4
	WalkSlowNorth 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0BF4:
	WalkSlowNorth 2
	WalkSlowEast 5
	WalkSlowNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C08:
	WalkSlowEast 3
	WalkSlowNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C18:
	WalkSlowEast 4
	WalkSlowNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C28:
	WalkSlowEast 4
	WalkSlowNorth 3
	EndMovement

	.balign 4, 0
_0C34:
	WalkSlowWest 4
	WalkSlowNorth 4
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C44:
	WalkSlowWest 3
	WalkSlowNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C54:
	WalkSlowNorth 2
	WalkSlowWest 5
	WalkSlowNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C68:
	WalkSlowWest 4
	WalkSlowNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C78:
	WalkSlowWest 4
	WalkSlowNorth 3
	EndMovement

	.balign 4, 0
_0C84:
	WalkSlowSouth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C90:
	WalkSlowSouth 4
	WalkSlowEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0CA0:
	WalkSlowSouth 4
	WalkSlowWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0CB0:
	WalkSlowEast
	WalkSlowSouth 5
	WalkSlowWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0CC4:
	WalkSlowSouth 4
	EndMovement

	.balign 4, 0
_0CCC:
	WalkFasterEast 4
	FaceNorth
	EndMovement

	.balign 4, 0
_0CD8:
	WalkFasterWest 4
	FaceNorth
	EndMovement

	.balign 4, 0
_0CE4:
	WalkNormalSouth 7
	FaceNorth
	EndMovement

	.balign 4, 0
_0CF0:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_0CF8:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0D00:
	Delay16 2
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0D0C:
	Delay8
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0D1C:
	Delay16 2
	WalkNormalSouth 4
	EndMovement

	.balign 4, 0
_0D28:
	WalkNormalNorth 9
	EndMovement

	.balign 4, 0
_0D30:
	FaceEast
	Delay8 3
	FaceWest
	Delay8 3
	EndMovement

	.balign 4, 0
_0D44:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0D4C:
	Delay8
	WalkOnSpotNormalSouth
	EndMovement
	.balign 4, 0
