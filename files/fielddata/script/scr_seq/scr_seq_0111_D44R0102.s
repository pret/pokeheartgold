#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D44R0102.h"
#include "msgdata/msg/msg_0129_D44R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D44R0102_000
	ScrDef scr_seq_D44R0102_001
	ScrDef scr_seq_D44R0102_002
	ScrDef scr_seq_D44R0102_003
	ScrDef scr_seq_D44R0102_004
	ScrDef scr_seq_D44R0102_005
	ScrDefEnd

scr_seq_D44R0102_002:
	GoToIfUnset FLAG_UNK_189, _002B
	ClearFlag FLAG_UNK_189
	End

_002B:
	Compare VAR_UNK_40FC, 2
	GoToIfGe _0047
	Compare VAR_UNK_40FC, 1
	CallIfEq _015E
	End

_0047:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0062
	ClearFlag FLAG_HIDE_CHAMPIONS_ROOM_RETREAT
	GoTo _007D

_0062:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0079
	ClearFlag FLAG_HIDE_CHAMPIONS_ROOM_RETREAT
	GoTo _007D

_0079:
	SetFlag FLAG_HIDE_CHAMPIONS_ROOM_RETREAT
_007D:
	CheckRegisteredPhoneNumber PHONE_CONTACT_CLAIR, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00F6
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _00AB
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	GoTo _00F4

_00AB:
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _00C2
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	GoTo _00F4

_00C2:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _00D9
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	GoTo _00F4

_00D9:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _00F0
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	GoTo _00F4

_00F0:
	SetFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
_00F4:
	End

_00F6:
	GetPhoneBookRematch PHONE_CONTACT_CLAIR, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0158
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _0124
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	GoTo _0156

_0124:
	Compare VAR_TEMP_x4000, 17
	GoToIfNe _013B
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	GoTo _0156

_013B:
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _0152
	ClearFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	GoTo _0156

_0152:
	SetFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
_0156:
	End

_0158:
	SetFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	End

_015E:
	GetStarterChoice VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 152
	GoToIfNe _017B
	SetVar VAR_OBJ_0, 1048
	GoTo _019A

_017B:
	Compare VAR_TEMP_x4000, 155
	GoToIfNe _0194
	SetVar VAR_OBJ_0, 1049
	GoTo _019A

_0194:
	SetVar VAR_OBJ_0, 1047
_019A:
	Return

scr_seq_D44R0102_000:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _02C0
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 26
	GoToIfNe _01D5
	ApplyMovement obj_D44R0102_gsleader8, _02C8
	GoTo _01F8

_01D5:
	Compare VAR_TEMP_x4000, 27
	GoToIfNe _01F0
	ApplyMovement obj_D44R0102_gsleader8, _02D0
	GoTo _01F8

_01F0:
	ApplyMovement obj_D44R0102_gsleader8, _02D8
_01F8:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0129_D44R0102_00000
	NPCMsg msg_0129_D44R0102_00001
	GoToIfNoItemSpace ITEM_TM59, 1, _02A7
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM59_FROM_CLAIR
	NPCMsg msg_0129_D44R0102_00003
_0236:
	NPCMsg msg_0129_D44R0102_00005
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 26
	GoToIfNe _0264
	ApplyMovement obj_D44R0102_gsleader8, _02E0
	ApplyMovement obj_player, _0310
	GoTo _0297

_0264:
	Compare VAR_TEMP_x4000, 27
	GoToIfNe _0287
	ApplyMovement obj_D44R0102_gsleader8, _02F0
	ApplyMovement obj_player, _0310
	GoTo _0297

_0287:
	ApplyMovement obj_D44R0102_gsleader8, _0300
	ApplyMovement obj_player, _0310
_0297:
	WaitMovement
	HidePerson obj_D44R0102_gsleader8
	SetVar VAR_UNK_40C4, 2
	ReleaseAll
	End

_02A7:
	NPCMsg msg_0129_D44R0102_00004
	CloseMsg
	GoTo _0236
	End

	.balign 4, 0
_02B4:
	EmoteExclamationMark
	FaceWest
	EndMovement

	.balign 4, 0
_02C0:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_02C8:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_02D0:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_02D8:
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_02E0:
	WalkNormalNorth
	WalkNormalEast 3
	WalkNormalNorth 7
	EndMovement

	.balign 4, 0
_02F0:
	WalkNormalNorth
	WalkNormalEast 2
	WalkNormalNorth 7
	EndMovement

	.balign 4, 0
_0300:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 7
	EndMovement

	.balign 4, 0
_0310:
	FaceNorth
	EndMovement

scr_seq_D44R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0E2, _0340
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0129_D44R0102_00007
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_0E2
	ReleaseAll
	End

_0340:
	BufferRivalsName 1
	NPCMsg msg_0129_D44R0102_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D44R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_CLAIR, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _03FC
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _03F1
	NPCMsg msg_0129_D44R0102_00009
_0379:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _039D
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _03E0
	End

_039D:
	BufferPlayersName 0
	NPCMsg msg_0129_D44R0102_00010
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_CLAIR
	NPCMsg msg_0129_D44R0102_00011
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	HidePerson obj_D44R0102_gsleader8
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_03E0:
	SetVar VAR_TEMP_x4002, 1
	NPCMsg msg_0129_D44R0102_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03F1:
	NPCMsg msg_0129_D44R0102_00013
	GoTo _0379
	End

_03FC:
	NPCMsg msg_0129_D44R0102_00029
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _045D
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0468
	NPCMsg msg_0129_D44R0102_00030
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 83
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0129_D44R0102_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

_045D:
	NPCMsg msg_0129_D44R0102_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0468:
	NPCMsg msg_0129_D44R0102_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D44R0102_004:
	ScrCmd_609
	LockAll
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D44R0102_gsrivel_2, _0674
	Compare VAR_TEMP_x4000, 24
	GoToIfNe _04AA
	ApplyMovement obj_player, _0688
	GoTo _04B2

_04AA:
	ApplyMovement obj_player, _0694
_04B2:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	CallStd std_play_rival_intro_music
	BufferRivalsName 1
	NPCMsg msg_0129_D44R0102_00014
	CloseMsg
	MovePersonFacing obj_D44R0102_wataru, 28, 0, 34, DIR_SOUTH
	MovePersonFacing obj_D44R0102_gsleader8_2, 28, 0, 33, DIR_SOUTH
	CallStd std_fade_end_rival_intro_music
	ApplyMovement obj_D44R0102_gsrivel_2, _0674
	ApplyMovement obj_player, _06A8
	ApplyMovement obj_D44R0102_wataru, _06E4
	ApplyMovement obj_D44R0102_gsleader8_2, _0704
	ApplyMovement obj_partner_poke, _06C8
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0129_D44R0102_00015, msg_0129_D44R0102_00016
	ApplyMovement obj_D44R0102_gsrivel_2, _0680
	WaitMovement
	BufferRivalsName 1
	NPCMsg msg_0129_D44R0102_00017
	NPCMsg msg_0129_D44R0102_00018
	ApplyMovement obj_D44R0102_gsrivel_2, _073C
	WaitMovement
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0129_D44R0102_00019
	GenderMsgBox msg_0129_D44R0102_00020, msg_0129_D44R0102_00021
	ApplyMovement obj_D44R0102_gsleader8_2, _0718
	WaitMovement
	NPCMsg msg_0129_D44R0102_00022
	BufferRivalsName 1
	NPCMsg msg_0129_D44R0102_00023
	ApplyMovement obj_D44R0102_gsrivel_2, _0744
	ApplyMovement obj_D44R0102_gsleader8_2, _0758
	ApplyMovement obj_player, _0764
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0129_D44R0102_00024
	CloseMsg
	ApplyMovement obj_D44R0102_gsrivel_2, _0770
	ApplyMovement obj_player, _0770
	ApplyMovement obj_D44R0102_gsleader8_2, _0718
	WaitMovement
	Compare VAR_OBJ_0, 1048
	GoToIfNe _05AC
	MultiBattle TRAINER_PARTNER_RIVAL_2, TRAINER_CHAMPION_LANCE_3, TRAINER_LEADER_CLAIR_CLAIR_3, 1
	GoTo _05D1

_05AC:
	Compare VAR_OBJ_0, 1049
	GoToIfNe _05C8
	MultiBattle TRAINER_PARTNER_RIVAL_3, TRAINER_CHAMPION_LANCE_3, TRAINER_LEADER_CLAIR_CLAIR_3, 1
	GoTo _05D1

_05C8:
	MultiBattle TRAINER_PARTNER_RIVAL_1, TRAINER_CHAMPION_LANCE_3, TRAINER_LEADER_CLAIR_CLAIR_3, 1
_05D1:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _066C
	BufferPlayersName 0
	GenderMsgBox msg_0129_D44R0102_00025, msg_0129_D44R0102_00026
	CloseMsg
	ApplyMovement obj_D44R0102_wataru, _06F4
	WaitMovement
	HidePerson obj_D44R0102_wataru
	BufferPlayersName 0
	NPCMsg msg_0129_D44R0102_00027
	CloseMsg
	ApplyMovement obj_D44R0102_gsleader8_2, _0720
	WaitMovement
	HidePerson obj_D44R0102_gsleader8_2
	ApplyMovement obj_D44R0102_gsrivel_2, _0778
	ApplyMovement obj_player, _0780
	WaitMovement
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0129_D44R0102_00028
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	HidePerson obj_D44R0102_gsrivel_2
	HidePerson obj_D44R0102_var_1
	Wait 20, VAR_SPECIAL_x8004
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ApplyMovement obj_partner_poke, _06DC
	WaitMovement
	SetVar VAR_UNK_40FC, 2
	SetVar VAR_UNK_4119, 1
	ReleaseAll
	End

_066C:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0674:
	FaceNorth
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0680:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0688:
	Delay16 2
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0694:
	Delay16
	WalkNormalSouth
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_06A8:
	Delay16
	FaceNorth
	EmoteExclamationMark
	Delay16 2
	WalkNormalEast
	WalkNormalSouth 2
	FaceNorth
	EndMovement

	.balign 4, 0
_06C8:
	Delay16 4
	WalkFastEast
	WalkFastSouth 5
	FaceNorth
	EndMovement

	.balign 4, 0
_06DC:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_06E4:
	WalkNormalSouth 7
	WalkNormalWest 3
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_06F4:
	WalkNormalNorth 4
	WalkNormalEast 3
	WalkNormalNorth 7
	EndMovement

	.balign 4, 0
_0704:
	Delay8
	WalkNormalSouth 7
	WalkNormalWest 4
	WalkNormalSouth 4
	EndMovement

	.balign 4, 0
_0718:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0720:
	LockDir
	WalkSlowNorth
	UnlockDir
	WalkFastNorth 2
	WalkFastEast 4
	WalkFastNorth 7
	EndMovement

	.balign 4, 0
_073C:
	WalkOnSpotFastNorth 2
	EndMovement

	.balign 4, 0
_0744:
	WalkFasterNorth
	Delay8
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0758:
	LockDir
	WalkFasterNorth 2
	EndMovement

	.balign 4, 0
_0764:
	Delay16 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0770:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0778:
	FaceEast
	EndMovement

	.balign 4, 0
_0780:
	FaceWest
	EndMovement

scr_seq_D44R0102_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0129_D44R0102_00006, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
