#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0501.h"
#include "msgdata/msg/msg_0618_T27R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T27R0501_000
	ScrDef scr_seq_T27R0501_001
	ScrDef scr_seq_T27R0501_002
	ScrDef scr_seq_T27R0501_003
	ScrDef scr_seq_T27R0501_004
	ScrDef scr_seq_T27R0501_005
	ScrDef scr_seq_T27R0501_006
	ScrDef scr_seq_T27R0501_007
	ScrDef scr_seq_T27R0501_008
	ScrDef scr_seq_T27R0501_009
	ScrDef scr_seq_T27R0501_010
	ScrDef scr_seq_T27R0501_011
	ScrDef scr_seq_T27R0501_012
	ScrDef scr_seq_T27R0501_013
	ScrDef scr_seq_T27R0501_014
	ScrDef scr_seq_T27R0501_015
	ScrDef scr_seq_T27R0501_016
	ScrDefEnd

scr_seq_T27R0501_013:
	Compare VAR_UNK_410C, 1
	GoToIfGt _0057
	MakeObjectVisible obj_T27R0501_rocketm_2
_0057:
	Compare VAR_UNK_410C, 0
	GoToIfNe _007C
	MovePersonFacing obj_T27R0501_rocketm, 6, 0, 6, DIR_EAST
	MovePersonFacing obj_T27R0501_dancer_3, 8, 0, 6, DIR_WEST
_007C:
	Compare VAR_TEMP_x4009, 222
	GoToIfNe _0110
	MovePersonFacing obj_T27R0501_rocketm, 29, 0, 29, DIR_SOUTH
	MakeObjectVisible obj_T27R0501_rocketm
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00BC
	MovePersonFacing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_SOUTH
	GoTo _0106

_00BC:
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _00DB
	MovePersonFacing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_NORTH
	GoTo _0106

_00DB:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00FA
	MovePersonFacing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_EAST
	GoTo _0106

_00FA:
	MovePersonFacing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_WEST
_0106:
	ScrCmd_374 obj_T27R0501_rocketm_2
	SetVar VAR_TEMP_x4009, 0
_0110:
	Compare VAR_TEMP_x400A, 10
	GoToIfEq _0136
	Compare VAR_UNK_410C, 3
	GoToIfNe _0136
	MovePersonFacing obj_T27R0501_dancer_3, 7, 0, 6, DIR_SOUTH
_0136:
	End

scr_seq_T27R0501_015:
	ScrCmd_609
	LockAll
	NPCMsg msg_0618_T27R0501_00000
	CloseMsg
	ApplyMovement obj_T27R0501_rocketm, _01CC
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ScrCmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	ApplyMovement 241, _01D4
	WaitMovement
	Wait 10, VAR_SPECIAL_RESULT
	ApplyMovement obj_T27R0501_rocketm, _01F0
	WaitMovement
	NPCMsg msg_0618_T27R0501_00001
	CloseMsg
	ApplyMovement obj_T27R0501_dancer_3, _01F8
	WaitMovement
	NPCMsg msg_0618_T27R0501_00002
	CloseMsg
	ApplyMovement obj_T27R0501_rocketm, _0200
	WaitMovement
	NPCMsg msg_0618_T27R0501_00003
	CloseMsg
	ApplyMovement obj_T27R0501_dancer_3, _0208
	WaitMovement
	NPCMsg msg_0618_T27R0501_00004
	CloseMsg
	ApplyMovement obj_T27R0501_rocketm, _0218
	WaitMovement
	ApplyMovement obj_T27R0501_rocketm, _0220
	ApplyMovement 241, _01DC
	WaitMovement
	ScrCmd_103
	ReleaseAll
	SetVar VAR_UNK_410C, 1
	End

	.balign 4, 0
_01CC:
	FaceEast
	EndMovement

	.balign 4, 0
_01D4:
	WalkSlightlyFastNorth 9
	EndMovement

	.balign 4, 0
_01DC:
	Delay32
	WalkSlightlyFastSouth 9
	EndMovement

	.balign 4, 0
_01E8:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_01F0:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_01F8:
	WalkOnSpotFastWest
	EndMovement

	.balign 4, 0
_0200:
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_0208:
	LockDir
	WalkNormalEast 2
	UnlockDir
	EndMovement

	.balign 4, 0
_0218:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0220:
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
	Delay1
	FaceEast
	Delay1
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
	Delay1
	FaceEast
	Delay1
	FaceSouth
	Delay1
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	FaceWest
	Delay1
	FaceNorth
	Delay1
	FaceEast
	Delay1
	FaceSouth
	EndMovement

scr_seq_T27R0501_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	StopBGM 0
	PlayBGM SEQ_GS_EYE_ROCKET
	NPCMsg msg_0618_T27R0501_00005
	CloseMsg
	SetVar VAR_TEMP_x4009, 222
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_26, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _040C
	NPCMsg msg_0618_T27R0501_00006
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 0
	GoToIfNe _0354
	ApplyMovement obj_T27R0501_rocketm_2, _0414
	GoTo _0392

_0354:
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _036F
	ApplyMovement obj_T27R0501_rocketm_2, _0424
	GoTo _0392

_036F:
	Compare VAR_SPECIAL_x8004, 2
	GoToIfNe _038A
	ApplyMovement obj_T27R0501_rocketm_2, _0434
	GoTo _0392

_038A:
	ApplyMovement obj_T27R0501_rocketm_2, _0444
_0392:
	WaitMovement
	NPCMsg msg_0618_T27R0501_00007
	CloseMsg
	Compare VAR_SPECIAL_x8004, 0
	GoToIfNe _03B4
	ApplyMovement obj_T27R0501_rocketm_2, _0454
	GoTo _03F2

_03B4:
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _03CF
	ApplyMovement obj_T27R0501_rocketm_2, _0460
	GoTo _03F2

_03CF:
	Compare VAR_SPECIAL_x8004, 2
	GoToIfNe _03EA
	ApplyMovement obj_T27R0501_rocketm_2, _046C
	GoTo _03F2

_03EA:
	ApplyMovement obj_T27R0501_rocketm_2, _0478
_03F2:
	WaitMovement
	HidePerson obj_T27R0501_rocketm_2
	SetFlag FLAG_UNK_23A
	ReleaseAll
	SetVar VAR_UNK_410C, 2
	SetVar VAR_TEMP_x400A, 10
	End

_040C:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0414:
	LockDir
	WalkNormalNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_0424:
	LockDir
	WalkNormalSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_0434:
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0444:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0454:
	WalkFastWest 4
	WalkFastSouth 12
	EndMovement

	.balign 4, 0
_0460:
	WalkFastWest 4
	WalkFastSouth 10
	EndMovement

	.balign 4, 0
_046C:
	WalkFastWest 3
	WalkFastSouth 10
	EndMovement

	.balign 4, 0
_0478:
	WalkFastSouth
	WalkFastEast 3
	WalkFastSouth 9
	EndMovement

scr_seq_T27R0501_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_410C, 1
	GoToIfEq _04B5
	Compare VAR_TEMP_x400A, 10
	GoToIfEq _04C0
	NPCMsg msg_0618_T27R0501_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04B5:
	NPCMsg msg_0618_T27R0501_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04C0:
	BufferPlayersName 0
	NPCMsg msg_0618_T27R0501_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0501_011:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T27R0501_gsgentleman, _05B4
	WaitMovement
	NPCMsg msg_0618_T27R0501_00026
	GoToIfNoItemSpace ITEM_HM03, 1, _05A9
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_HM03
	SetVar VAR_UNK_410C, 3
	SetVar VAR_UNK_4090, 1
	NPCMsg msg_0618_T27R0501_00028
	CloseMsg
	ApplyMovement obj_T27R0501_gsgentleman, _05C4
	WaitMovement
	ReleaseAll
	End

scr_seq_T27R0501_012:
	ScrCmd_609
	LockAll
	ApplyMovement obj_T27R0501_gsgentleman, _05D8
	WaitMovement
	NPCMsg msg_0618_T27R0501_00026
	GoToIfNoItemSpace ITEM_HM03, 1, _05A9
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_HM03
	SetVar VAR_UNK_4090, 1
	SetVar VAR_UNK_410C, 3
	NPCMsg msg_0618_T27R0501_00028
	CloseMsg
	ApplyMovement obj_T27R0501_gsgentleman, _05E8
	WaitMovement
	ReleaseAll
	End

scr_seq_T27R0501_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_HM03, _059E
	NPCMsg msg_0618_T27R0501_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

_059E:
	NPCMsg msg_0618_T27R0501_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05A9:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_05B4:
	WalkNormalNorth
	WalkNormalWest 5
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_05C4:
	WalkNormalSouth 2
	WalkNormalEast 5
	WalkNormalSouth
	FaceNorth
	EndMovement

	.balign 4, 0
_05D8:
	WalkNormalNorth
	WalkNormalEast 3
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_05E8:
	WalkNormalSouth 2
	WalkNormalWest 3
	WalkNormalSouth
	FaceNorth
	EndMovement

scr_seq_T27R0501_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_PSYDUCK, 0
	NPCMsg msg_0618_T27R0501_00030
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0501_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x400A, 10
	GoToIfEq _0644
	Compare VAR_UNK_410C, 1
	GoToIfEq _064F
	NPCMsg msg_0618_T27R0501_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0644:
	NPCMsg msg_0618_T27R0501_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_064F:
	Compare VAR_TEMP_x400B, 0
	GoToIfNe _0665
	NPCMsg msg_0618_T27R0501_00032
	GoTo _067E

_0665:
	Compare VAR_TEMP_x400B, 1
	GoToIfNe _067B
	NPCMsg msg_0618_T27R0501_00034
	GoTo _067E

_067B:
	NPCMsg msg_0618_T27R0501_00035
_067E:
	WaitButton
	CloseMsg
	ReleaseAll
	Compare VAR_TEMP_x400B, 2
	GoToIfGe _069D
	AddVar VAR_TEMP_x400B, 1
	GoTo _06A3

_069D:
	SetVar VAR_TEMP_x400B, 0
_06A3:
	End

scr_seq_T27R0501_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x400A, 10
	GoToIfEq _06D2
	Compare VAR_UNK_410C, 1
	GoToIfEq _06DD
	NPCMsg msg_0618_T27R0501_00036
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06D2:
	NPCMsg msg_0618_T27R0501_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06DD:
	NPCMsg msg_0618_T27R0501_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0501_010:
	SimpleNPCMsg msg_0618_T27R0501_00039
	End

scr_seq_T27R0501_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _0724
	GoToIfSet FLAG_UNK_109, _0724
	NPCMsg msg_0618_T27R0501_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0724:
	NPCMsg msg_0618_T27R0501_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0501_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _0758
	GoToIfSet FLAG_UNK_109, _0758
	NPCMsg msg_0618_T27R0501_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0758:
	NPCMsg msg_0618_T27R0501_00041
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0501_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_SPECIAL_x8000, 77
	GoToIfSet FLAG_UNK_108, _0868
	GoToIfSet FLAG_UNK_109, _0868
	NPCMsg msg_0618_T27R0501_00013
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_x8004
	TouchscreenMenuShow
	Compare VAR_SPECIAL_x8004, 1
	GoToIfEq _0BD3
	CloseMsg
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	CallIfNe _07BA
	GoTo _0944
	End

_07BA:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _07DF
	ApplyMovement obj_player, _0828
	GoTo _080F

_07DF:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _07FA
	ApplyMovement obj_player, _083C
	GoTo _080F

_07FA:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _080F
	ApplyMovement obj_player, _084C
_080F:
	ApplyMovement obj_T27R0501_dancer_6, _085C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Return

	.balign 4, 0
_0828:
	WalkNormalEast
	WalkNormalSouth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_083C:
	WalkNormalSouth
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_084C:
	WalkNormalSouth
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_085C:
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

_0868:
	BufferPlayersName 0
	NPCMsg msg_0618_T27R0501_00042
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_107
	ReleaseAll
	End

scr_seq_T27R0501_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _08A3
	GoToIfSet FLAG_UNK_109, _08A3
	NPCMsg msg_0618_T27R0501_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_08A3:
	NPCMsg msg_0618_T27R0501_00043
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0501_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _08D7
	GoToIfSet FLAG_UNK_109, _08D7
	NPCMsg msg_0618_T27R0501_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_08D7:
	NPCMsg msg_0618_T27R0501_00044
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27R0501_016:
	ScrCmd_609
	LockAll
	SetVar VAR_SPECIAL_x8000, 11
	SetVar VAR_UNK_410C, 5
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0BF4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _092A
	NPCMsg msg_0618_T27R0501_00011
	GoTo _092D

_092A:
	NPCMsg msg_0618_T27R0501_00012
_092D:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_x8004
	TouchscreenMenuShow
	Compare VAR_SPECIAL_x8004, 1
	GoToIfEq _0BD3
	CloseMsg
_0944:
	StopBGM 30
	PlayBGM SEQ_GS_EYE_MAIKO
	ApplyMovement obj_T27R0501_dancer_6, _0D74
	WaitMovement
	NPCMsg msg_0618_T27R0501_00045
	CloseMsg
	Wait 10, VAR_SPECIAL_RESULT
	TrainerBattle TRAINER_KIMONO_GIRL_ZUKI, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0BC9
	ApplyMovement obj_T27R0501_dancer_6, _0C0C
	WaitMovement
	StopBGM 30
	PlayBGM SEQ_GS_EYE_MAIKO
	ApplyMovement obj_T27R0501_dancer, _0C18
	WaitMovement
	NPCMsg msg_0618_T27R0501_00015
	CloseMsg
	TrainerBattle TRAINER_KIMONO_GIRL_NAOKO, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0BC9
	ApplyMovement obj_T27R0501_dancer, _0C48
	WaitMovement
	StopBGM 30
	PlayBGM SEQ_GS_EYE_MAIKO
	ApplyMovement obj_T27R0501_dancer_5, _0C54
	WaitMovement
	NPCMsg msg_0618_T27R0501_00016
	CloseMsg
	TrainerBattle TRAINER_KIMONO_GIRL_MIKI, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0BC9
	ApplyMovement obj_T27R0501_dancer_5, _0C84
	WaitMovement
	StopBGM 30
	PlayBGM SEQ_GS_EYE_MAIKO
	ApplyMovement obj_T27R0501_dancer_2, _0C90
	WaitMovement
	NPCMsg msg_0618_T27R0501_00017
	CloseMsg
	TrainerBattle TRAINER_KIMONO_GIRL_SAYO, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0BC9
	ApplyMovement obj_T27R0501_dancer_2, _0CBC
	WaitMovement
	StopBGM 30
	PlayBGM SEQ_GS_EYE_MAIKO
	ApplyMovement obj_T27R0501_dancer_4, _0CCC
	WaitMovement
	NPCMsg msg_0618_T27R0501_00018
	CloseMsg
	TrainerBattle TRAINER_KIMONO_GIRL_KUNI, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0BC9
	ApplyMovement obj_T27R0501_dancer_4, _0CF8
	WaitMovement
	ApplyMovement obj_T27R0501_dancer_6, _0D08
	WaitMovement
	NPCMsg msg_0618_T27R0501_00020
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _0AA4
	GiveItemNoCheck ITEM_CLEAR_BELL, 1
	SetFlag FLAG_UNK_103
	GoTo _0AB8

_0AA4:
	GiveItemNoCheck ITEM_TIDAL_BELL, 1
	SetFlag FLAG_UNK_104
_0AB8:
	CloseMsg
	PlaySE SEQ_SE_DP_KI_GASYAN
	ScreenShake 0, 2, 10, 6
	WaitSE SEQ_SE_DP_KI_GASYAN
	ClearFlag FLAG_HIDE_DANCE_STUDIO_LITTLE_GIRL
	ShowPerson obj_T27R0501_gsbabygirl1
	ApplyMovement obj_T27R0501_gsbabygirl1, _0D10
	WaitMovement
	ApplyMovement obj_T27R0501_dancer_6, _0BEC
	WaitMovement
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _0B02
	NPCMsg msg_0618_T27R0501_00021
	GoTo _0B05

_0B02:
	NPCMsg msg_0618_T27R0501_00022
_0B05:
	CloseMsg
	ApplyMovement obj_T27R0501_dancer_6, _0BE4
	WaitMovement
	BufferPlayersName 0
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _0B2A
	NPCMsg msg_0618_T27R0501_00023
	GoTo _0B2D

_0B2A:
	NPCMsg msg_0618_T27R0501_00024
_0B2D:
	CloseMsg
	ApplyMovement obj_T27R0501_dancer, _0D1C
	ApplyMovement obj_T27R0501_dancer_2, _0D28
	ApplyMovement obj_T27R0501_dancer_6, _0D38
	ApplyMovement obj_T27R0501_dancer_4, _0D48
	ApplyMovement obj_T27R0501_dancer_5, _0D58
	ApplyMovement obj_T27R0501_gsbabygirl1, _0D64
	WaitMovement
	HidePerson obj_T27R0501_dancer
	HidePerson obj_T27R0501_dancer_2
	HidePerson obj_T27R0501_dancer_6
	HidePerson obj_T27R0501_dancer_4
	HidePerson obj_T27R0501_dancer_5
	HidePerson obj_T27R0501_gsbabygirl1
	SetFlag FLAG_HIDE_DANCE_STUDIO_KIMONO_GIRLS
	SetFlag FLAG_HIDE_DANCE_STUDIO_LITTLE_GIRL
	Call _0BB0
	SetVar VAR_UNK_410C, 6
	SetVar VAR_UNK_40FA, 1
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _0BAA
	ClearFlag FLAG_HIDE_BELL_TOWER_SUMMIT_KIMONO_GIRLS
	GoTo _0BAE

_0BAA:
	ClearFlag FLAG_HIDE_WHIRL_ISLANDS_BOTTOM_KIMONO_GIRLS
_0BAE:
	End

_0BB0:
	Compare VAR_SPECIAL_x8000, 77
	GoToIfNe _0BC5
	ReleaseAll
	GoTo _0BC7

_0BC5:
	ReleaseAll
_0BC7:
	Return

_0BC9:
	WhiteOut
	Call _0BB0
	End

_0BD3:
	NPCMsg msg_0618_T27R0501_00014
	WaitButton
	CloseMsg
	Call _0BB0
	End

	.balign 4, 0
_0BE4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0BEC:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0BF4:
	WalkNormalNorth 5
	WalkNormalWest 4
	WalkNormalNorth 5
	WalkNormalEast 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0C0C:
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C18:
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	WalkOnSpotNormalEast
	WalkNormalEast 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C48:
	WalkNormalWest 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C54:
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	WalkOnSpotNormalWest
	WalkNormalWest 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C84:
	WalkNormalEast 5
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0C90:
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	WalkOnSpotNormalSouth
	WalkNormalSouth
	WalkNormalEast 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0CBC:
	WalkNormalWest 3
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0CCC:
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	WalkOnSpotNormalSouth
	WalkNormalSouth
	WalkNormalWest 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0CF8:
	WalkNormalEast 3
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0D08:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0D10:
	WalkFastNorth 10
	WalkFastEast 3
	EndMovement

	.balign 4, 0
_0D1C:
	WalkNormalEast
	WalkNormalSouth 11
	EndMovement

	.balign 4, 0
_0D28:
	Delay8
	WalkNormalWest
	WalkNormalSouth 12
	EndMovement

	.balign 4, 0
_0D38:
	Delay8
	WalkNormalEast 4
	WalkNormalSouth 11
	EndMovement

	.balign 4, 0
_0D48:
	Delay8
	WalkNormalEast
	WalkNormalSouth 12
	EndMovement

	.balign 4, 0
_0D58:
	WalkNormalWest
	WalkNormalSouth 11
	EndMovement

	.balign 4, 0
_0D64:
	Delay8 2
	WalkNormalEast 5
	WalkNormalSouth 11
	EndMovement

	.balign 4, 0
_0D74:
	FaceWest
	Delay4
	FaceNorth
	Delay4
	FaceEast
	Delay4
	FaceSouth
	Delay4
	FaceWest
	Delay4
	FaceNorth
	Delay4
	FaceEast
	Delay4
	WalkOnSpotNormalSouth
	EndMovement
	.balign 4, 0
