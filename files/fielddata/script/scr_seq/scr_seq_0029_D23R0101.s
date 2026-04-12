#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0101.h"
#include "msgdata/msg/msg_0065_D23R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D23R0101_000
	ScrDef scr_seq_D23R0101_001
	ScrDef scr_seq_D23R0101_002
	ScrDef scr_seq_D23R0101_003
	ScrDef scr_seq_D23R0101_004
	ScrDef scr_seq_D23R0101_005
	ScrDef scr_seq_D23R0101_006
	ScrDef scr_seq_D23R0101_007
	ScrDef scr_seq_D23R0101_008
	ScrDef scr_seq_D23R0101_009
	ScrDef scr_seq_D23R0101_010
	ScrDefEnd

scr_seq_D23R0101_008:
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_6
	SetFlag FLAG_HIDE_ROCKET_TAKEOVER_2
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfNe _004D
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_6
	GoTo _0085

_004D:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _0066
	GoTo _008B

_0060:
	GoTo _0085

_0066:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _0081
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_6
	ClearFlag FLAG_HIDE_RADIO_TOWER_RIVAL
	GoTo _0085

_0081:
	ClearFlag FLAG_HIDE_ROCKET_TAKEOVER_2
_0085:
	SetVar VAR_TEMP_x400A, 0
_008B:
	End

scr_seq_D23R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfNe _00AB
	NPCMsg msg_0065_D23R0101_00001
	GoTo _00DA

_00AB:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _00C1
	NPCMsg msg_0065_D23R0101_00001
	GoTo _00DA

_00C1:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _00D7
	NPCMsg msg_0065_D23R0101_00002
	GoTo _00DA

_00D7:
	NPCMsg msg_0065_D23R0101_00000
_00DA:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0101_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0065_D23R0101_00014
	ApplyMovement obj_D23R0101_gsleader3, _036C
	WaitMovement
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_RADIO_CARD, _0243
	NPCMsg msg_0065_D23R0101_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0221
	NPCMsg msg_0065_D23R0101_00004
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _022E
	PlaySE SEQ_SE_DP_PINPON
	WaitSE SEQ_SE_DP_PINPON
	NPCMsg msg_0065_D23R0101_00005
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _022E
	PlaySE SEQ_SE_DP_PINPON
	WaitSE SEQ_SE_DP_PINPON
	NPCMsg msg_0065_D23R0101_00006
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _022E
	PlaySE SEQ_SE_DP_PINPON
	WaitSE SEQ_SE_DP_PINPON
	NPCMsg msg_0065_D23R0101_00007
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _022E
	PlaySE SEQ_SE_DP_PINPON
	WaitSE SEQ_SE_DP_PINPON
	NPCMsg msg_0065_D23R0101_00008
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _022E
	Wait 30, VAR_SPECIAL_RESULT
	PlaySE SEQ_SE_DP_PINPON
	WaitSE SEQ_SE_DP_PINPON
	TouchscreenMenuShow
	NPCMsg msg_0065_D23R0101_00009
	BufferPlayersName 0
	NPCMsg msg_0065_D23R0101_00010
	PlayFanfare SEQ_ME_KEYITEM
	WaitFanfare
	CloseMsg
	RegisterPokegearCard 2
	SetFlag FLAG_GOT_RADIO_CARD
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D23R0101_gsleader3, _0250
	ApplyMovement obj_player, _0270
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0065_D23R0101_00015
	CloseMsg
	ApplyMovement obj_D23R0101_gsleader3, _0264
	Wait 24, VAR_SPECIAL_RESULT
	ApplyMovement obj_player, _036C
	WaitMovement
	HidePerson obj_D23R0101_gsleader3
	SetFlag FLAG_UNK_318
	ReleaseAll
	End

_0221:
	NPCMsg msg_0065_D23R0101_00013
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_022E:
	PlaySE SEQ_SE_DP_BOX03
	WaitSE SEQ_SE_DP_BOX03
	NPCMsg msg_0065_D23R0101_00012
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0243:
	NPCMsg msg_0065_D23R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0250:
	EmoteExclamationMark
	JumpOnSpotFastWest 2
	WalkSlightlyFastNorth 3
	WalkSlightlyFastWest
	EndMovement

	.balign 4, 0
_0264:
	WalkSlightlyFastNorth
	WalkSlightlyFastWest 10
	EndMovement

	.balign 4, 0
_0270:
	Delay8 6
	WalkSlightlyFastNorth
	FaceEast
	EndMovement

scr_seq_D23R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0065_D23R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0065_D23R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D23R0101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfEq _02C2
	NPCMsg msg_0065_D23R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02C2:
	Compare VAR_TEMP_x400A, 1
	GoToIfEq _0316
	NPCMsg msg_0065_D23R0101_00019
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _02F5
	ApplyMovement obj_D23R0101_rocketm, _0354
	GoTo _030A

_02F5:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _030A
	ApplyMovement obj_D23R0101_rocketm, _0360
_030A:
	WaitMovement
	ReleaseAll
	SetVar VAR_TEMP_x400A, 1
	End

_0316:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0333
	SetVar VAR_TEMP_x400B, 33
	GoTo _0346

_0333:
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0346
	SetVar VAR_TEMP_x400B, 11
_0346:
	NPCMsg msg_0065_D23R0101_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0354:
	WalkNormalSouth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0360:
	WalkNormalWest
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_036C:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0374:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_037C:
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D23R0101_009:
	ScrCmd_609
	LockAll
	MovePersonFacing obj_D23R0101_gsrivel, 13, 1, 6, DIR_EAST
	CallStd std_play_rival_intro_music
	GetPersonCoords 6, VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _03D0
	ApplyMovement obj_D23R0101_gsrivel, _0670
	Compare VAR_TEMP_x400B, 33
	GoToIfNe _03CA
	ApplyMovement obj_D23R0101_rocketm, _069C
_03CA:
	GoTo _03FA

_03D0:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _03FA
	ApplyMovement obj_D23R0101_gsrivel, _067C
	Compare VAR_TEMP_x400B, 11
	GoToIfNe _03FA
	ApplyMovement obj_D23R0101_rocketm, _06A8
_03FA:
	WaitMovement
	BufferRivalsName 1
	NPCMsg msg_0065_D23R0101_00021
	CloseMsg
	ApplyMovement obj_D23R0101_gsrivel, _0664
	WaitMovement
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _0431
	ApplyMovement obj_D23R0101_gsrivel, _0684
	ApplyMovement obj_D23R0101_rocketm, _06B4
	GoTo _044E

_0431:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _044E
	ApplyMovement obj_D23R0101_gsrivel, _0690
	ApplyMovement obj_D23R0101_rocketm, _06C8
_044E:
	WaitMovement
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _046B
	ApplyMovement obj_player, _06E4
	GoTo _0480

_046B:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _0480
	ApplyMovement obj_player, _06EC
_0480:
	WaitMovement
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0065_D23R0101_00022
	CloseMsg
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _04A8
	ApplyMovement obj_player, _06FC
	GoTo _04BD

_04A8:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _04BD
	ApplyMovement obj_player, _07BC
_04BD:
	Wait 50, VAR_SPECIAL_RESULT
	SetAvatarBits PLAYER_TRANSITION_WALKING
	UpdateAvatarState
	RocketCostumeFlagAction 0
	WaitMovement
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _04E9
	ApplyMovement obj_D23R0101_rocketm, _0874
	GoTo _04FE

_04E9:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _04FE
	ApplyMovement obj_D23R0101_rocketm, _0890
_04FE:
	WaitMovement
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _0523
	ApplyMovement obj_D23R0101_rocketm, _08AC
	ApplyMovement obj_D23R0101_gsrivel, _08BC
	GoTo _0540

_0523:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _0540
	ApplyMovement obj_D23R0101_rocketm, _08B4
	ApplyMovement obj_D23R0101_gsrivel, _08D4
_0540:
	WaitMovement
	NPCMsg msg_0065_D23R0101_00023
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_3, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0655
	NPCMsg msg_0065_D23R0101_00024
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _0592
	ApplyMovement obj_D23R0101_rocketm, _08EC
	ApplyMovement obj_player, _0900
	GoTo _05AF

_0592:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _05AF
	ApplyMovement obj_D23R0101_rocketm, _08F4
	ApplyMovement obj_player, _0914
_05AF:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	HidePerson obj_D23R0101_rocketm
	CallStd std_play_rival_outro_music
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _05DE
	ApplyMovement obj_D23R0101_gsrivel, _0928
	GoTo _05F3

_05DE:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _05F3
	ApplyMovement obj_D23R0101_gsrivel, _0930
_05F3:
	WaitMovement
	Compare VAR_TEMP_x4001, 5
	GoToIfNe _0610
	ApplyMovement obj_player, _06DC
	GoTo _0625

_0610:
	Compare VAR_TEMP_x4001, 6
	GoToIfNe _0625
	ApplyMovement obj_player, _06F4
_0625:
	WaitMovement
	BufferRivalsName 1
	NPCMsg msg_0065_D23R0101_00025
	CloseMsg
	ApplyMovement obj_D23R0101_gsrivel, _0938
	WaitMovement
	HidePerson obj_D23R0101_gsrivel
	CallStd std_fade_end_rival_outro_music
	ReleaseAll
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 4
	SetFlag FLAG_HIDE_RADIO_TOWER_RIVAL
	SetVar VAR_UNK_409F, 1
	End

_0655:
	SetVar VAR_SCENE_ROCKET_TAKEOVER, 2
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0664:
	Delay16
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0670:
	WalkFastEast 9
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_067C:
	WalkFastEast 9
	EndMovement

	.balign 4, 0
_0684:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0690:
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_069C:
	Delay4 9
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06A8:
	Delay4 9
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_06B4:
	FaceEast
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_06C8:
	FaceNorth
	LockDir
	WalkNormalSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_06DC:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_06E4:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_06EC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_06F4:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06FC:
	Delay4
	FaceEast
	Delay4
	FaceSouth
	Delay4
	FaceWest
	Delay4
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	Delay2
	FaceEast
	Delay4
	FaceSouth
	Delay4
	FaceWest
	EndMovement

	.balign 4, 0
_07BC:
	Delay4
	FaceWest
	Delay4
	FaceNorth
	Delay4
	FaceEast
	Delay4
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay2
	FaceNorth
	Delay4
	FaceEast
	Delay4
	FaceSouth
	EndMovement

	.balign 4, 0
_0874:
	Delay16
	FaceEast
	LockDir
	WalkFastWest 2
	UnlockDir
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0890:
	Delay16
	FaceNorth
	LockDir
	WalkFastSouth 2
	UnlockDir
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_08AC:
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_08B4:
	WalkFastNorth 3
	EndMovement

	.balign 4, 0
_08BC:
	Delay4
	FaceNorth
	LockDir
	WalkFastSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_08D4:
	Delay4
	FaceEast
	LockDir
	WalkFastWest
	UnlockDir
	EndMovement

	.balign 4, 0
_08EC:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_08F4:
	WalkNormalNorth
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0900:
	FaceNorth
	LockDir
	WalkNormalSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_0914:
	FaceEast
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0928:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0930:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0938:
	WalkNormalWest 9
	EndMovement

scr_seq_D23R0101_006:
	SimpleNPCMsg msg_0065_D23R0101_00026
	End

scr_seq_D23R0101_007:
	SimpleNPCMsg msg_0065_D23R0101_00027
	End

scr_seq_D23R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_4136, 0
	GoToIfNe _0B86
	GoToIfSet FLAG_UNK_AA6, _09CF
	GoToIfSet FLAG_UNK_AA5, _09AF
	NPCMsg msg_0065_D23R0101_00028
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _09E5
	GoTo _09DA

_09AF:
	NPCMsg msg_0065_D23R0101_00045
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _09E5
	GoTo _09DA
	End

_09CF:
	NPCMsg msg_0065_D23R0101_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_09DA:
	NPCMsg msg_0065_D23R0101_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_09E5:
	SetFlag FLAG_UNK_AA5
	NPCMsg msg_0065_D23R0101_00031
	LotoIDGet VAR_SPECIAL_x8000
	BufferIntEx 0, VAR_SPECIAL_x8000, 2, 5
	NPCMsg msg_0065_D23R0101_00032
	LotoIDSearch VAR_SPECIAL_x8001, VAR_SPECIAL_x8002, VAR_SPECIAL_x8003, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_x8002, 0
	GoToIfEq _0A24
	Compare VAR_SPECIAL_x8003, 0
	GoToIfEq _0A2F
	GoTo _0A3D

_0A24:
	NPCMsg msg_0065_D23R0101_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0A2F:
	BufferPartyMonNick 0, VAR_SPECIAL_x8001
	NPCMsg msg_0065_D23R0101_00033
	GoTo _0A4B

_0A3D:
	BufferBoxMonNick 0, VAR_SPECIAL_x8001
	NPCMsg msg_0065_D23R0101_00034
	GoTo _0A4B

_0A4B:
	Switch VAR_SPECIAL_x8002
	Case 1, _0A94
	Case 2, _0A9F
	Case 3, _0AA8
	Case 4, _0AB1
	Case 5, _0ABA
	End

_0A94:
	NPCMsg msg_0065_D23R0101_00036
	GoTo _0AC3
	End

_0A9F:
	NPCMsg msg_0065_D23R0101_00038
	GoTo _0AC3

_0AA8:
	NPCMsg msg_0065_D23R0101_00039
	GoTo _0AC3

_0AB1:
	NPCMsg msg_0065_D23R0101_00040
	GoTo _0AC3

_0ABA:
	NPCMsg msg_0065_D23R0101_00041
	GoTo _0AC3

_0AC3:
	Switch VAR_SPECIAL_x8002
	Case 1, _0B0C
	Case 2, _0B1A
	Case 3, _0B26
	Case 4, _0B32
	Case 5, _0B3E
	End

_0B0C:
	SetVar VAR_SPECIAL_x8003, 2
	GoTo _0B4A
	End

_0B1A:
	SetVar VAR_SPECIAL_x8003, 51
	GoTo _0B4A

_0B26:
	SetVar VAR_SPECIAL_x8003, 216
	GoTo _0B4A

_0B32:
	SetVar VAR_SPECIAL_x8003, 29
	GoTo _0B4A

_0B3E:
	SetVar VAR_SPECIAL_x8003, 1
	GoTo _0B4A

_0B4A:
	GoToIfNoItemSpace VAR_SPECIAL_x8003, 1, _0B75
	CallStd std_give_item_verbose
	GoTo _0B98

_0B75:
	CopyVar VAR_UNK_4136, VAR_SPECIAL_x8002
	NPCMsg msg_0065_D23R0101_00042
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B86:
	BufferPlayersName 0
	NPCMsg msg_0065_D23R0101_00043
	CopyVar VAR_SPECIAL_x8002, VAR_UNK_4136
	GoTo _0AC3

_0B98:
	SetVar VAR_UNK_4136, 0
	SetFlag FLAG_UNK_AA6
	NPCMsg msg_0065_D23R0101_00044
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
