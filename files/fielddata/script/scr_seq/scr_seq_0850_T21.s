#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T21.h"
#include "msgdata/msg/msg_0550_T21.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T21_000
	ScrDef scr_seq_T21_001
	ScrDef scr_seq_T21_002
	ScrDef scr_seq_T21_003
	ScrDef scr_seq_T21_004
	ScrDef scr_seq_T21_005
	ScrDef scr_seq_T21_006
	ScrDef scr_seq_T21_007
	ScrDef scr_seq_T21_008
	ScrDef scr_seq_T21_009
	ScrDef scr_seq_T21_010
	ScrDefEnd

scr_seq_T21_010:
	GoToIfUnset FLAG_UNK_189, _003F
	ClearFlag FLAG_UNK_189
	End

_003F:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _007D
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0083
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _0083
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _0083
_007D:
	SetFlag FLAG_HIDE_CAMERON
	End

_0083:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T21_000:
	End

scr_seq_T21_001:
	Lock obj_T21_gsoldman1
	ApplyMovement obj_T21_gsoldman1, _0350
	WaitMovement
	CallStd std_play_follow_music
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _00BE
	ApplyMovement obj_T21_gsoldman1, _0358
	GoTo _0109

_00BE:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _00D9
	ApplyMovement obj_T21_gsoldman1, _0360
	GoTo _0109

_00D9:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _00F4
	ApplyMovement obj_T21_gsoldman1, _0368
	GoTo _0109

_00F4:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0109
	ApplyMovement obj_T21_gsoldman1, _0370
_0109:
	ApplyMovement obj_player, _0378
	WaitMovement
	NPCMsg msg_0550_T21_00000
	CloseMsg
	BufferPlayersName 0
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _013C
	ApplyMovement obj_T21_gsoldman1, _0390
	GoTo _0187

_013C:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _0157
	ApplyMovement obj_T21_gsoldman1, _03AC
	GoTo _0187

_0157:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _0172
	ApplyMovement obj_T21_gsoldman1, _03D0
	GoTo _0187

_0172:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0187
	ApplyMovement obj_T21_gsoldman1, _03F4
_0187:
	WaitMovement
	ApplyMovement obj_player, _0380
	WaitMovement
	NPCMsg msg_0550_T21_00001
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_TEMP_x4001, 397
	GoToIfNe _01C5
	ApplyMovement obj_T21_gsoldman1, _0418
	ApplyMovement obj_player, _0478
	GoTo _0228

_01C5:
	Compare VAR_TEMP_x4001, 398
	GoToIfNe _01E8
	ApplyMovement obj_T21_gsoldman1, _0430
	ApplyMovement obj_player, _0488
	GoTo _0228

_01E8:
	Compare VAR_TEMP_x4001, 399
	GoToIfNe _020B
	ApplyMovement obj_T21_gsoldman1, _0448
	ApplyMovement obj_player, _0498
	GoTo _0228

_020B:
	Compare VAR_TEMP_x4001, 400
	GoToIfNe _0228
	ApplyMovement obj_T21_gsoldman1, _0460
	ApplyMovement obj_player, _04A8
_0228:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0550_T21_00002
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T21_gsoldman1, _04B8
	ApplyMovement obj_player, _04CC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0550_T21_00003
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T21_gsoldman1, _04E0
	ApplyMovement obj_player, _04FC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0550_T21_00004
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T21_gsoldman1, _050C
	ApplyMovement obj_player, _052C
	WaitMovement
	PlaySE SEQ_SE_GS_N_UMIBE
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0550_T21_00005
	CloseMsg
	StopSE SEQ_SE_GS_N_UMIBE
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T21_gsoldman1, _054C
	ApplyMovement obj_player, _0568
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0550_T21_00006
	GiveRunningShoes
	BufferPlayersName 0
	NPCMsg msg_0550_T21_00007
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	NPCMsg msg_0550_T21_00008
	CloseMsg
	ApplyMovement obj_T21_gsoldman1, _0580
	WaitMovement
	ScrCmd_307 17, 12, 14, 17, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_T21_gsoldman1, _0580
	WaitMovement
	Release obj_T21_gsoldman1
	Release obj_partner_poke
	PlaySE SEQ_SE_DP_KAIDAN2
	HidePerson obj_T21_gsoldman1
	WaitSE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	CallStd std_fade_end_mom_music
	SetVar VAR_SCENE_CHERRYGROVE_CITY_OW, 1
	End

	.balign 4, 0
_0350:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0358:
	Delay4
	EndMovement

	.balign 4, 0
_0360:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0368:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0370:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0378:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0380:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0388:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0390:
	WalkFastWest 2
	WalkFastNorth 2
	EmoteExclamationMark
	WalkOnSpotFastSouth
	WalkFastSouth 3
	WalkFastEast
	EndMovement

	.balign 4, 0
_03AC:
	WalkFastWest 2
	WalkFastNorth 3
	Delay8
	WalkOnSpotFastSouth
	Delay32
	EmoteExclamationMark
	WalkFastSouth 4
	WalkFastEast
	EndMovement

	.balign 4, 0
_03D0:
	WalkFastWest 2
	WalkFastNorth 4
	Delay8
	WalkOnSpotFastSouth
	Delay32
	EmoteExclamationMark
	WalkFastSouth 5
	WalkFastEast
	EndMovement

	.balign 4, 0
_03F4:
	WalkFastWest 2
	WalkFastNorth 4
	Delay8
	WalkOnSpotFastSouth
	Delay32
	EmoteExclamationMark
	WalkFastSouth 5
	WalkFastEast
	EndMovement

	.balign 4, 0
_0418:
	WalkFastWest
	WalkFastNorth 3
	WalkOnSpotFastSouth
	Delay4 4
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0430:
	WalkFastWest
	WalkFastNorth 4
	WalkOnSpotFastSouth
	Delay4 5
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0448:
	WalkFastWest
	WalkFastNorth 5
	WalkOnSpotFastSouth
	Delay4 6
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0460:
	WalkFastWest
	WalkFastNorth 6
	WalkOnSpotFastSouth
	Delay4 9
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_0478:
	WalkNormalWest 2
	WalkNormalNorth 2
	Delay8
	EndMovement

	.balign 4, 0
_0488:
	WalkNormalWest 2
	WalkNormalNorth 3
	Delay8
	EndMovement

	.balign 4, 0
_0498:
	WalkNormalWest 2
	WalkNormalNorth 4
	Delay8
	EndMovement

	.balign 4, 0
_04A8:
	WalkNormalWest 2
	WalkNormalNorth 5
	Delay8
	EndMovement

	.balign 4, 0
_04B8:
	WalkFastWest 9
	WalkOnSpotFastEast
	Delay4 7
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_04CC:
	WalkNormalNorth
	WalkNormalWest 8
	Delay8 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_04E0:
	WalkFastWest 6
	WalkFastNorth 2
	WalkFastWest
	WalkOnSpotFastEast
	Delay4 7
	WalkOnSpotFastNorth
	EndMovement

	.balign 4, 0
_04FC:
	WalkNormalWest 7
	WalkNormalNorth 2
	Delay8
	EndMovement

	.balign 4, 0
_050C:
	WalkFastSouth 2
	WalkFastWest 6
	WalkFastSouth 8
	WalkNormalWest 6
	WalkOnSpotFastNorth
	Delay4 17
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_052C:
	WalkNormalWest
	WalkNormalSouth 2
	WalkNormalWest 6
	WalkNormalSouth 7
	WalkNormalWest 6
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_054C:
	WalkFastEast 16
	WalkOnSpotFastWest
	Delay4 6
	WalkFastSouth 2
	WalkFastEast 6
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_0568:
	Delay4
	WalkNormalSouth
	WalkNormalEast 16
	WalkNormalSouth 2
	WalkNormalEast 5
	EndMovement

	.balign 4, 0
_0580:
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0588:
	WalkNormalNorth
	EndMovement

scr_seq_T21_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0680
	WaitMovement
	CallStd std_play_follow_music
	ClearFlag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	ShowPerson obj_T21_gsoldman1
	Lock obj_T21_gsoldman1
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	MovePersonFacing obj_T21_gsoldman1, VAR_TEMP_x4000, 1, 394, DIR_NORTH
	Compare VAR_TEMP_x4000, 549
	GoToIfNe _05DB
	ApplyMovement obj_T21_gsoldman1, _068C
	GoTo _05FE

_05DB:
	Compare VAR_TEMP_x4000, 550
	GoToIfNe _05F6
	ApplyMovement obj_T21_gsoldman1, _068C
	GoTo _05FE

_05F6:
	ApplyMovement obj_T21_gsoldman1, _069C
_05FE:
	WaitMovement
	Compare VAR_TEMP_x4000, 549
	GoToIfNe _061B
	ApplyMovement obj_player, _0380
	GoTo _063E

_061B:
	Compare VAR_TEMP_x4000, 550
	GoToIfNe _0636
	ApplyMovement obj_player, _0380
	GoTo _063E

_0636:
	ApplyMovement obj_player, _0388
_063E:
	WaitMovement
	NPCMsg msg_0550_T21_00009
	BufferPlayersName 0
	NPCMsg msg_0550_T21_00010
	PlayFanfare SEQ_ME_KEYITEM
	WaitFanfare
	NPCMsg msg_0550_T21_00011
	NPCMsg msg_0550_T21_00012
	CloseMsg
	ApplyMovement obj_T21_gsoldman1, _06AC
	WaitMovement
	CallStd std_fade_end_mom_music
	Release obj_T21_gsoldman1
	HidePerson obj_T21_gsoldman1
	SetFlag FLAG_HIDE_CHERRYGROVE_GUIDE_GENT
	RegisterPokegearCard 1
	ReleaseAll
	SetVar VAR_SCENE_CHERRYGROVE_CITY_OW, 2
	End

	.balign 4, 0
_0680:
	EmoteExclamationMark
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_068C:
	WalkFastWest
	WalkFastNorth 9
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_069C:
	WalkFastEast
	WalkFastNorth 9
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_06AC:
	WalkFastSouth 9
	EndMovement

scr_seq_T21_003:
	ScrCmd_609
	LockAll
	FadeOutBGM 0, 3
	ApplyMovement obj_player, _0350
	WaitMovement
	CallStd std_play_rival_intro_music
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	MovePersonFacing obj_T21_gsrivel, 583, 0, VAR_TEMP_x4001, DIR_WEST
	ApplyMovement obj_T21_gsrivel, _0808
	WaitMovement
	NPCMsg msg_0550_T21_00013
	CloseMsg
	GetStarterChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 152
	GoToIfNe _070C
	TrainerBattle TRAINER_PASSERBY_BOY_2, 0, 1, 0
	GoTo _072F

_070C:
	Compare VAR_SPECIAL_RESULT, 155
	GoToIfNe _0727
	TrainerBattle TRAINER_PASSERBY_BOY_3, 0, 1, 0
	GoTo _072F

_0727:
	TrainerBattle TRAINER_PASSERBY_BOY, 0, 1, 0
_072F:
	CheckBattleWon VAR_SPECIAL_RESULT
	CallStd std_play_rival_outro_music
	NPCMsg msg_0550_T21_00014
	CloseMsg
	PlaySE SEQ_SE_DP_WALL_HIT2
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 398
	GoToIfNe _076B
	ApplyMovement obj_player, _0890
	GoTo _0773

_076B:
	ApplyMovement obj_player, _08A4
_0773:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Compare VAR_SPECIAL_x8005, 398
	GoToIfNe _079A
	ApplyMovement obj_T21_gsrivel, _0810
	GoTo _07A2

_079A:
	ApplyMovement obj_T21_gsrivel, _0844
_07A2:
	WaitMovement
	NPCMsg msg_0550_T21_00015
	CloseMsg
	GetPersonCoords 4, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 401
	GoToIfNe _07D4
	ApplyMovement obj_T21_gsrivel, _0880
	ApplyMovement obj_player, _08B8
	GoTo _07E4

_07D4:
	ApplyMovement obj_T21_gsrivel, _0878
	ApplyMovement obj_player, _08B8
_07E4:
	WaitMovement
	HidePerson obj_T21_gsrivel
	SetFlag FLAG_HIDE_CHERRYGROVE_RIVAL
	CallStd std_fade_end_rival_outro_music
	ReleaseAll
	SetVar VAR_SCENE_CHERRYGROVE_CITY_OW, 4
	SetFlag FLAG_MET_PASSERBY_BOY
	End

_0800:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0808:
	WalkNormalWest 7
	EndMovement

	.balign 4, 0
_0810:
	WalkNormalWest 6
	EmoteExclamationMark
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotFastNorth
	Delay8
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotNormalEast
	Delay8
	WalkNormalEast 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0844:
	WalkNormalWest 6
	EmoteExclamationMark
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotFastNorth
	Delay8
	WalkOnSpotFastSouth
	Delay8
	WalkOnSpotNormalEast
	Delay8
	WalkNormalEast 5
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0878:
	WalkNormalWest 11
	EndMovement

	.balign 4, 0
_0880:
	WalkNormalWest 5
	WalkNormalNorth
	WalkNormalWest 6
	EndMovement

	.balign 4, 0
_0890:
	FaceNorth
	LockDir
	WalkFastSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_08A4:
	FaceSouth
	LockDir
	WalkFastNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_08B8:
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

scr_seq_T21_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_MYSTIC_WATER_FROM_CHERRYGROVE_CITY_MAN, _0903
	NPCMsg msg_0550_T21_00020
	GoToIfNoItemSpace ITEM_MYSTIC_WATER, 1, _090E
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_MYSTIC_WATER_FROM_CHERRYGROVE_CITY_MAN
_0903:
	NPCMsg msg_0550_T21_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_090E:
	NPCMsg msg_0550_T21_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T21_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A41
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0A55
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0992
	ApplyMovement obj_player, _0A6C
	ApplyMovement obj_T21_gsmiddleman1, _0AC0
	GoTo _09E0

_0992:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _09AD
	ApplyMovement obj_player, _0A84
	GoTo _09E0

_09AD:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _09D0
	ApplyMovement obj_player, _0AA4
	ApplyMovement obj_T21_gsmiddleman1, _0AC0
	GoTo _09E0

_09D0:
	ApplyMovement obj_player, _0A90
	ApplyMovement obj_T21_gsmiddleman1, _0AC0
_09E0:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0A07
	ApplyMovement obj_partner_poke, _0ACC
	WaitMovement
_0A07:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 1
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

_0A41:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0A55:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0A6C:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0A84:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0A90:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0AA4:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0AC0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0ACC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T21_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0550_T21_00024, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T21_006:
	DirectionSignpost msg_0550_T21_00023, 0, 12, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T21_007:
	SimpleNPCMsg msg_0550_T21_00019
	End

scr_seq_T21_008:
	SimpleNPCMsg msg_0550_T21_00017
	End
	.balign 4, 0
