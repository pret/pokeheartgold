#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R25.h"
#include "msgdata/msg/msg_0363_R25.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R25_000
	ScrDef scr_seq_R25_001
	ScrDef scr_seq_R25_002
	ScrDef scr_seq_R25_003
	ScrDef scr_seq_R25_004
	ScrDef scr_seq_R25_005
	ScrDef scr_seq_R25_006
	ScrDef scr_seq_R25_007
	ScrDef scr_seq_R25_008
	ScrDef scr_seq_R25_009
	ScrDefEnd

scr_seq_R25_003:
	GoToIfUnset FLAG_UNK_189, _003B
	ClearFlag FLAG_UNK_189
	End

_003B:
	Compare VAR_SCENE_ROUTE_25, 2
	GoToIfNe _0050
	ClearFlag FLAG_HIDE_ROUTE_25_EUSINE_2
	SetFlag FLAG_HIDE_ROUTE_25_EUSINE
_0050:
	CheckBadge BADGE_EARTH, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _011B
	Compare VAR_SCENE_ROUTE_25, 1
	GoToIfEq _011B
	Compare VAR_SCENE_ROUTE_25, 2
	GoToIfEq _011B
	GetPhoneBookRematch PHONE_CONTACT_MISTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0115
	CheckRegisteredPhoneNumber PHONE_CONTACT_MISTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00DD
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _00BE
	ClearFlag FLAG_UNK_2CD
	GoTo _00DB

_00BE:
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _00D5
	ClearFlag FLAG_UNK_2CD
	GoTo _00DB

_00D5:
	GoTo _0115

_00DB:
	End

_00DD:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 14
	GoToIfNe _00F8
	ClearFlag FLAG_UNK_2CD
	GoTo _0113

_00F8:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _010F
	ClearFlag FLAG_UNK_2CD
	GoTo _0113

_010F:
	SetFlag FLAG_UNK_2CD
_0113:
	End

_0115:
	SetFlag FLAG_UNK_2CD
	End

_011B:
	SetFlag FLAG_UNK_2CD
	End

scr_seq_R25_008:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _012E
	End

_012E:
	SetFlag FLAG_HIDE_ROUTE_25_SUICUNE
	HidePerson obj_R25_tsure_poke_static_suicune
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_R25_000:
	ScrCmd_609
	LockAll
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 40
	GoToIfNe _0171
	ApplyMovement obj_R25_gsleader11, _029C
	ApplyMovement obj_R25_gsman1, _02B0
	ApplyMovement obj_player, _0304
	GoTo _01B4

_0171:
	Compare VAR_TEMP_x4001, 41
	GoToIfNe _019C
	ApplyMovement obj_R25_gsleader11, _029C
	ApplyMovement obj_R25_gsman1, _02CC
	ApplyMovement obj_player, _0304
	GoTo _01B4

_019C:
	ApplyMovement obj_R25_gsleader11, _029C
	ApplyMovement obj_R25_gsman1, _02E8
	ApplyMovement obj_player, _0310
_01B4:
	WaitMovement
	StopBGM SEQ_GS_R_12_24
	PlayBGM SEQ_GS_EYE_K_SHOUJO
	Compare VAR_TEMP_x4001, 40
	GoToIfNe _01E1
	ApplyMovement obj_R25_gsleader11, _032C
	ApplyMovement obj_player, _0350
	GoTo _0214

_01E1:
	Compare VAR_TEMP_x4001, 41
	GoToIfNe _0204
	ApplyMovement obj_R25_gsleader11, _0338
	ApplyMovement obj_player, _0350
	GoTo _0214

_0204:
	ApplyMovement obj_R25_gsleader11, _0344
	ApplyMovement obj_player, _0350
_0214:
	WaitMovement
	NPCMsg msg_0363_R25_00000
	CloseMsg
	Compare VAR_TEMP_x4001, 40
	GoToIfNe _023E
	ApplyMovement obj_R25_gsleader11, _035C
	ApplyMovement obj_player, _0380
	GoTo _0271

_023E:
	Compare VAR_TEMP_x4001, 41
	GoToIfNe _0261
	ApplyMovement obj_R25_gsleader11, _0368
	ApplyMovement obj_player, _0380
	GoTo _0271

_0261:
	ApplyMovement obj_R25_gsleader11, _0374
	ApplyMovement obj_player, _0394
_0271:
	WaitMovement
	HidePerson obj_R25_gsman1
	HidePerson obj_R25_gsleader11
	StopBGM SEQ_GS_EYE_K_SHOUJO
	PlayBGM SEQ_GS_R_12_24
	SetFlag FLAG_HIDE_ROUTE_25_MISTYS_BOYFRIEND
	SetFlag FLAG_HIDE_ROUTE_25_MISTY
	ClearFlag FLAG_HIDE_CERULEAN_GYM_POPULATION
	SetVar VAR_UNK_4088, 2
	ReleaseAll
	End

	.balign 4, 0
_029C:
	Delay8
	FaceWest
	Delay32 2
	FaceNorth
	EndMovement

	.balign 4, 0
_02B0:
	Delay32
	FaceNorth
	EmoteExclamationMark
	WalkFastNorth 5
	WalkFastWest 5
	WalkFastSouth 8
	EndMovement

	.balign 4, 0
_02CC:
	Delay32
	FaceNorth
	EmoteExclamationMark
	WalkFastNorth 5
	WalkFastWest 5
	WalkFastSouth 8
	EndMovement

	.balign 4, 0
_02E8:
	Delay32
	FaceNorth
	EmoteExclamationMark
	WalkFastNorth 6
	WalkFastWest 5
	WalkFastSouth 9
	EndMovement

	.balign 4, 0
_0304:
	Delay16 6
	FaceSouth
	EndMovement

	.balign 4, 0
_0310:
	Delay16 6
	FaceNorth
	Delay8
	FaceWest
	Delay8
	FaceSouth
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalNorth 7
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0338:
	WalkNormalNorth 6
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0344:
	WalkNormalNorth 5
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0350:
	Delay16 3
	FaceEast
	EndMovement

	.balign 4, 0
_035C:
	WalkNormalSouth
	WalkNormalWest 11
	EndMovement

	.balign 4, 0
_0368:
	WalkNormalSouth
	WalkNormalWest 11
	EndMovement

	.balign 4, 0
_0374:
	WalkNormalNorth
	WalkNormalWest 11
	EndMovement

	.balign 4, 0
_0380:
	Delay8
	FaceSouth
	Delay8
	FaceWest
	EndMovement

	.balign 4, 0
_0394:
	Delay8
	FaceNorth
	Delay4
	FaceWest
	EndMovement

scr_seq_R25_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_MISTY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0456
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _044B
	NPCMsg msg_0363_R25_00001
_03D3:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03F7
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _043A
	End

_03F7:
	BufferPlayersName 0
	NPCMsg msg_0363_R25_00002
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_MISTY
	NPCMsg msg_0363_R25_00003
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_2CD
	HidePerson obj_R25_gsleader11_2
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_043A:
	SetVar VAR_TEMP_x4002, 1
	NPCMsg msg_0363_R25_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_044B:
	NPCMsg msg_0363_R25_00005
	GoTo _03D3
	End

_0456:
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04DA
	ScrCmd_733 11, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04DA
	NPCMsg msg_0363_R25_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04E5
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04F0
	NPCMsg msg_0363_R25_00007
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 84
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0363_R25_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04DA:
	NPCMsg msg_0363_R25_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04E5:
	NPCMsg msg_0363_R25_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04F0:
	NPCMsg msg_0363_R25_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R25_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_NUGGET_FROM_ACE_TRAINER_M_KEVIN, _0558
	NPCMsg msg_0363_R25_00011
	GoToIfNoItemSpace ITEM_NUGGET, 1, _0563
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_NUGGET_FROM_ACE_TRAINER_M_KEVIN
	NPCMsg msg_0363_R25_00013
	CloseMsg
	TrainerBattle TRAINER_ACE_TRAINER_M_KEVIN, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _056D
_0558:
	NPCMsg msg_0363_R25_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0563:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_056D:
	WhiteOut
	ReleaseAll
	End

scr_seq_R25_004:
	ScrCmd_609
	LockAll
	SetFlag FLAG_HIDE_ROUTE_14_EUSINE_2
	ClearFlag FLAG_HIDE_ROUTE_25_EUSINE
	ShowPerson obj_R25_minaki
	ApplyMovement obj_player, _0648
	WaitMovement
	PlayCry SPECIES_SUICUNE, 0
	Release obj_R25_tsure_poke_static_suicune
	ScrCmd_523 obj_R25_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_R25_tsure_poke_static_suicune
	WaitCry
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 40
	GoToIfNe _05D4
	ApplyMovement obj_player, _0650
	GoTo _05F7

_05D4:
	Compare VAR_TEMP_x4001, 41
	GoToIfNe _05EF
	ApplyMovement obj_player, _065C
	GoTo _05F7

_05EF:
	ApplyMovement obj_player, _0670
_05F7:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	CallStd std_play_eusine_music
	ApplyMovement obj_R25_minaki, _069C
	ApplyMovement obj_player, _0690
	WaitMovement
	NPCMsg msg_0363_R25_00016
	CloseMsg
	ApplyMovement obj_R25_minaki, _06B0
	ApplyMovement obj_player, _0684
	WaitMovement
	NPCMsg msg_0363_R25_00017
	WaitButton
	CloseMsg
	CallStd std_fade_end_eusine_music
	SetVar VAR_SCENE_ROUTE_25, 2
	ReleaseAll
	End

	.balign 4, 0
_0648:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0650:
	WalkNormalEast 3
	FaceNorth
	EndMovement

	.balign 4, 0
_065C:
	WalkNormalEast
	WalkNormalNorth
	WalkNormalEast 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0670:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalEast 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0684:
	Delay16
	FaceNorth
	EndMovement

	.balign 4, 0
_0690:
	Delay8 2
	FaceSouth
	EndMovement

	.balign 4, 0
_069C:
	WalkFastEast 8
	WalkNormalEast 3
	WalkSlowerEast
	FaceNorth
	EndMovement

	.balign 4, 0
_06B0:
	WalkNormalEast
	WalkNormalNorth 2
	EndMovement

scr_seq_R25_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0363_R25_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R25_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0363_R25_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R25_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_SUICUNE, 0
	Release obj_R25_tsure_poke_static_suicune
	ScrCmd_523 obj_R25_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_R25_tsure_poke_static_suicune
	WaitCry
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_SUICUNE, 40, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _07AA
	GetStaticEncounterOutcome VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 3
	GoToIfEq _07A6
	Compare VAR_TEMP_x4002, 4
	CallIfEq _07B0
	Compare VAR_TEMP_x4002, 5
	GoToIfEq _07B6
	BufferPlayersName 0
	NPCMsg msg_0363_R25_00018
	CloseMsg
	GoToIfSet FLAG_HIDE_ROUTE_25_EUSINE_2, _0766
	GoTo _0786

_0766:
	ApplyMovement obj_player, _07F4
	ApplyMovement obj_R25_minaki, _0800
	WaitMovement
	HidePerson obj_R25_minaki
	SetFlag FLAG_HIDE_ROUTE_25_EUSINE
	GoTo _07A0

_0786:
	ApplyMovement obj_player, _07F4
	ApplyMovement obj_R25_minaki_2, _0800
	WaitMovement
	HidePerson obj_R25_minaki_2
	SetFlag FLAG_HIDE_ROUTE_25_EUSINE_2
_07A0:
	SetVar VAR_SCENE_ROUTE_25, 3
_07A6:
	ReleaseAll
	End

_07AA:
	WhiteOut
	ReleaseAll
	End

_07B0:
	SetFlag FLAG_CAUGHT_SUICUNE
	Return

_07B6:
	Wait 20, VAR_SPECIAL_x8004
	ApplyMovement obj_player, _07EC
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0363_R25_00019
	CloseMsg
	GoToIfSet FLAG_HIDE_ROUTE_25_EUSINE_2, _0766
	GoTo _0786

	.balign 4, 0
_07E0:
	FaceSouth
	Delay8 2
	EndMovement

	.balign 4, 0
_07EC:
	FaceSouth
	EndMovement

	.balign 4, 0
_07F4:
	Delay8 2
	FaceWest
	EndMovement

	.balign 4, 0
_0800:
	WalkNormalWest 11
	EndMovement

scr_seq_R25_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0363_R25_00015, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
