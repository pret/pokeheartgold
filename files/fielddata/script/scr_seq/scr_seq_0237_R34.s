#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34.h"
#include "msgdata/msg/msg_0384_R34.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R34_000
	ScrDef scr_seq_R34_001
	ScrDef scr_seq_R34_002
	ScrDef scr_seq_R34_003
	ScrDef scr_seq_R34_004
	ScrDef scr_seq_R34_005
	ScrDef scr_seq_R34_006
	ScrDef scr_seq_R34_007
	ScrDef scr_seq_R34_008
	ScrDef scr_seq_R34_009
	ScrDef scr_seq_R34_010
	ScrDef scr_seq_R34_011
	ScrDef scr_seq_R34_012
	ScrDefEnd

scr_seq_R34_000:
	GetFriendSprite VAR_OBJ_0
	CheckDaycareEgg VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0057
	SetObjectMovementType obj_R34_gsoldman1, 16
	GoTo _005D

_0057:
	SetObjectMovementType obj_R34_gsoldman1, 15
_005D:
	GoToIfUnset FLAG_UNK_189, _006E
	ClearFlag FLAG_UNK_189
	End

_006E:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _009F
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _00A9
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _00A9
_009F:
	SetFlag FLAG_HIDE_CAMERON
	GoTo _00AD

_00A9:
	ClearFlag FLAG_HIDE_CAMERON
_00AD:
	ScrCmd_379 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _00D5
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _00D5
	ClearFlag FLAG_UNK_1D1
	SetFlag FLAG_UNK_1D2
	End

_00D5:
	ClearFlag FLAG_UNK_1D2
	SetFlag FLAG_UNK_1D1
	End

scr_seq_R34_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_R34_gsoldman1, _0130
	ApplyMovement obj_player, _0140
	WaitMovement
	NPCMsg msg_0384_R34_00046
	BufferPlayersName 0
	RegisterGearNumber PHONE_CONTACT_DAY_C_MAN
	NPCMsg msg_0384_R34_00047
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_DAY_C_LADY
	NPCMsg msg_0384_R34_00048
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	NPCMsg msg_0384_R34_00049
	CloseMsg
	ApplyMovement obj_R34_gsoldman1, _014C
	WaitMovement
	SetVar VAR_UNK_408E, 3
	ReleaseAll
	End

	.balign 4, 0
_0130:
	EmoteExclamationMark
	WalkNormalSouth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0140:
	Delay8 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_014C:
	WalkNormalWest 2
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_R34_003:
	ScrCmd_609
	LockAll
	GenderMsgBox msg_0384_R34_00036, msg_0384_R34_00041
	CloseMsg
	ApplyMovement obj_R34_gsoldman1, _0510
	WaitMovement
	CallStd std_play_friend_music
	ApplyMovement obj_R34_var_1, _049C
	ApplyMovement obj_R34_tsure_poke_static_marill, _04B0
	WaitMovement
	ApplyMovement obj_R34_gsoldman1, _0500
	WaitMovement
	GenderMsgBox msg_0384_R34_00037, msg_0384_R34_00042
	CloseMsg
	ApplyMovement obj_R34_var_1, _04F8
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	BufferPlayersName 0
	Compare VAR_SPECIAL_x8004, 368
	GoToIfNe _01D4
	ApplyMovement obj_R34_var_1, _04C0
	ApplyMovement obj_R34_tsure_poke_static_marill, _04CC
	ApplyMovement obj_R34_gsoldman1, _0494
	GoTo _0207

_01D4:
	Compare VAR_SPECIAL_x8004, 369
	GoToIfNe _01FF
	ApplyMovement obj_R34_var_1, _04C0
	ApplyMovement obj_R34_tsure_poke_static_marill, _04CC
	ApplyMovement obj_R34_gsoldman1, _0494
	GoTo _0207

_01FF:
	ApplyMovement obj_R34_var_1, _0518
_0207:
	WaitMovement
	GenderMsgBox msg_0384_R34_00038, msg_0384_R34_00043
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_x8004, 363
	GoToIfNe _0234
	ApplyMovement obj_player, _0528
	GoTo _02C3

_0234:
	Compare VAR_SPECIAL_x8004, 364
	GoToIfNe _024F
	ApplyMovement obj_player, _0534
	GoTo _02C3

_024F:
	Compare VAR_SPECIAL_x8004, 365
	GoToIfNe _026A
	ApplyMovement obj_player, _053C
	GoTo _02C3

_026A:
	Compare VAR_SPECIAL_x8004, 366
	GoToIfNe _0285
	ApplyMovement obj_player, _0548
	GoTo _02C3

_0285:
	Compare VAR_SPECIAL_x8004, 367
	GoToIfNe _02A0
	ApplyMovement obj_player, _0554
	GoTo _02C3

_02A0:
	Compare VAR_SPECIAL_x8004, 368
	GoToIfNe _02BB
	ApplyMovement obj_player, _0560
	GoTo _02C3

_02BB:
	ApplyMovement obj_player, _056C
_02C3:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Compare VAR_SPECIAL_x8004, 368
	GoToIfNe _02EA
	ApplyMovement obj_R34_var_1, _0510
	GoTo _030D

_02EA:
	Compare VAR_SPECIAL_x8004, 369
	GoToIfNe _0305
	ApplyMovement obj_R34_var_1, _0510
	GoTo _030D

_0305:
	ApplyMovement obj_R34_var_1, _0508
_030D:
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0384_R34_00039, msg_0384_R34_00044
	CloseMsg
	Compare VAR_SPECIAL_x8004, 368
	GoToIfNe _033B
	ApplyMovement obj_R34_var_1, _04D4
	ApplyMovement obj_R34_tsure_poke_static_marill, _04E8
	GoTo _036E

_033B:
	Compare VAR_SPECIAL_x8004, 369
	GoToIfNe _035E
	ApplyMovement obj_R34_var_1, _04D4
	ApplyMovement obj_R34_tsure_poke_static_marill, _04E8
	GoTo _036E

_035E:
	ApplyMovement obj_R34_var_1, _04E0
	ApplyMovement obj_R34_tsure_poke_static_marill, _04F0
_036E:
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0384_R34_00040, msg_0384_R34_00045
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_x8004, 368
	GoToIfNe _03AE
	ApplyMovement obj_R34_var_1, _0578
	ApplyMovement obj_R34_tsure_poke_static_marill, _0590
	ApplyMovement obj_player, _05A4
	GoTo _03F1

_03AE:
	Compare VAR_SPECIAL_x8004, 369
	GoToIfNe _03D9
	ApplyMovement obj_R34_var_1, _0578
	ApplyMovement obj_R34_tsure_poke_static_marill, _0590
	ApplyMovement obj_player, _05A4
	GoTo _03F1

_03D9:
	ApplyMovement obj_R34_var_1, _0584
	ApplyMovement obj_R34_tsure_poke_static_marill, _0598
	ApplyMovement obj_player, _05B4
_03F1:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_307 11, 12, 16, 26, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_R34_var_1, _05C4
	ApplyMovement obj_R34_tsure_poke_static_marill, _05D0
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _05E0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_KAIDAN2
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0455
	ScrCmd_600
_0455:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitSE SEQ_SE_DP_KAIDAN2
	WaitFade
	ScrCmd_309 77
	SetVar VAR_UNK_408E, 1
	Warp MAP_ROUTE_34_DAYCARE, 0, 3, 12, DIR_NORTH
	ScrCmd_582 MAP_ROUTE_34, 368, 411
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0494:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_049C:
	WalkNormalSouth 6
	WalkNormalEast 3
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_04B0:
	WalkNormalSouth 7
	WalkNormalEast 3
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04C0:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_04CC:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04D4:
	WalkNormalEast
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04E0:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04E8:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04F0:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_04F8:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0500:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0508:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0510:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0518:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0520:
	SetInvisible
	EndMovement

	.balign 4, 0
_0528:
	WalkNormalEast
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0534:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_053C:
	WalkNormalWest
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0548:
	WalkNormalWest 2
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0554:
	WalkNormalWest 3
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0560:
	WalkNormalWest 3
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_056C:
	WalkNormalWest 4
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0578:
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0584:
	WalkNormalEast 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0590:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_0598:
	WalkNormalSouth
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_05A4:
	Delay8
	WalkNormalEast 3
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05B4:
	Delay8
	WalkNormalEast 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05C4:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_05D0:
	WalkNormalEast
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_05E0:
	WalkNormalNorth 2
	SetInvisible
	EndMovement

scr_seq_R34_002:
	SimpleNPCMsg msg_0384_R34_00018
	End

scr_seq_R34_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0727
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _073B
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0678
	ApplyMovement obj_player, _0750
	ApplyMovement obj_R34_gsmiddleman1_2, _079C
	GoTo _06C6

_0678:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0693
	ApplyMovement obj_player, _0768
	GoTo _06C6

_0693:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _06B6
	ApplyMovement obj_player, _0788
	ApplyMovement obj_R34_gsmiddleman1_2, _079C
	GoTo _06C6

_06B6:
	ApplyMovement obj_player, _0774
	ApplyMovement obj_R34_gsmiddleman1_2, _079C
_06C6:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _06ED
	ApplyMovement obj_partner_poke, _07A8
	WaitMovement
_06ED:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 9
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

_0727:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_073B:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0750:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0768:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0774:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0788:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_079C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07A8:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R34_004:
	ScrCmd_609
	LockAll
	CountAliveMons VAR_TEMP_x4003, 6
	Compare VAR_TEMP_x4003, 1
	GoToIfNe _07DB
	GoTo _07E1

_07D5:
	GoTo _07E1

_07DB:
	GoTo _087D

_07E1:
	ApplyMovement obj_R34_gswoman3, _0918
	StopBGM 0
	PlayBGM SEQ_GS_EYE_J_SHOUJO
	WaitMovement
	ApplyMovement obj_player, _0944
	WaitMovement
	NPCMsg msg_0384_R34_00019
	CloseMsg
	TrainerBattle TRAINER_ACE_TRAINER_F_IRENE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0912
	ApplyMovement obj_R34_gswoman3, _094C
	WaitMovement
	NPCMsg msg_0384_R34_00021
	CloseMsg
	ApplyMovement obj_R34_gswoman3_2, _0924
	StopBGM 0
	PlayBGM SEQ_GS_EYE_J_SHOUJO
	WaitMovement
	ApplyMovement obj_player, _093C
	WaitMovement
	NPCMsg msg_0384_R34_00024
	CloseMsg
	TrainerBattle TRAINER_ACE_TRAINER_F_JENN, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0912
	ApplyMovement obj_R34_gswoman3_2, _0954
	WaitMovement
	NPCMsg msg_0384_R34_00026
	WaitButton
	CloseMsg
	GoTo _0908
	End

_087D:
	ApplyMovement obj_R34_gswoman3, _0918
	StopBGM 0
	PlayBGM SEQ_GS_EYE_J_SHOUJO
	WaitMovement
	ApplyMovement obj_player, _0944
	WaitMovement
	NPCMsg msg_0384_R34_00019
	CloseMsg
	ApplyMovement obj_R34_gswoman3_2, _0924
	PlayBGM SEQ_GS_EYE_J_SHOUJO
	WaitMovement
	ApplyMovement obj_player, _093C
	WaitMovement
	NPCMsg msg_0384_R34_00024
	CloseMsg
	TrainerBattle TRAINER_ACE_TRAINER_F_JENN, 120, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0912
	ApplyMovement obj_R34_gswoman3, _094C
	WaitMovement
	ApplyMovement obj_player, _0944
	WaitMovement
	NPCMsg msg_0384_R34_00021
	CloseMsg
	ApplyMovement obj_R34_gswoman3_2, _0954
	WaitMovement
	ApplyMovement obj_player, _093C
	WaitMovement
	NPCMsg msg_0384_R34_00026
	WaitButton
	CloseMsg
_0908:
	SetVar VAR_UNK_4097, 1
	ReleaseAll
	End

_0912:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0918:
	EmoteExclamationMark
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0924:
	EmoteExclamationMark
	WalkNormalEast 4
	EndMovement

	.balign 4, 0
_0930:
	EmoteExclamationMark
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_093C:
	FaceWest
	EndMovement

	.balign 4, 0
_0944:
	FaceEast
	EndMovement

	.balign 4, 0
_094C:
	JumpOnSpotFastWest 2
	EndMovement

	.balign 4, 0
_0954:
	JumpOnSpotFastEast 2
	EndMovement

scr_seq_R34_005:
	ScrCmd_609
	LockAll
	SetVar VAR_TEMP_x4004, 777
	ApplyMovement obj_R34_gswoman3_3, _0930
	StopBGM 0
	PlayBGM SEQ_GS_EYE_J_SHOUJO
	WaitMovement
	NPCMsg msg_0384_R34_00028
	CloseMsg
	StopBGM 0
	TrainerBattle TRAINER_ACE_TRAINER_F_KATE, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0912
	SetVar VAR_UNK_4097, 2
_09A0:
	NPCMsg msg_0384_R34_00030
	GoToIfNoItemSpace ITEM_POWER_HERB, 1, _09EE
	CallStd std_give_item_verbose
	SetVar VAR_UNK_4097, 3
	NPCMsg msg_0384_R34_00032
	WaitButton
	CloseMsg
_09D5:
	Compare VAR_TEMP_x4004, 777
	GoToIfNe _09EA
	ReleaseAll
	GoTo _09EC

_09EA:
	ReleaseAll
_09EC:
	End

_09EE:
	CallStd std_bag_is_full
	CloseMsg
	GoTo _09D5
	End

scr_seq_R34_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4097, 1
	GoToIfNe _0A1A
	NPCMsg msg_0384_R34_00022
	GoTo _0A1D

_0A1A:
	NPCMsg msg_0384_R34_00023
_0A1D:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R34_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4097, 1
	GoToIfNe _0A43
	NPCMsg msg_0384_R34_00026
	GoTo _0A46

_0A43:
	NPCMsg msg_0384_R34_00027
_0A46:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R34_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x4004, 555
	Compare VAR_UNK_4097, 2
	GoToIfEq _09A0
	NPCMsg msg_0384_R34_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R34_009:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0384_R34_00034, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R34_010:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0384_R34_00035, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R34_011:
	DirectionSignpost msg_0384_R34_00033, 1, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
