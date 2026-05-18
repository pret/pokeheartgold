#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R24.h"
#include "msgdata/msg/msg_0362_R24.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R24_000
	ScrDef scr_seq_R24_001
	ScrDef scr_seq_R24_002
	ScrDef scr_seq_R24_003
	ScrDef scr_seq_R24_004
	ScrDefEnd

scr_seq_R24_004:
	Compare VAR_SCENE_ROUTE_24_ROCKET, 2
	GoToIfEq _0025
	End

_0025:
	SetVar VAR_SCENE_ROUTE_24_ROCKET, 1
	End

scr_seq_R24_003:
	ScrCmd_609
	LockAll
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0060
	ApplyMovement obj_R24_rocketm, _0084
	ApplyMovement obj_R24_gsman1, _00A0
	ApplyMovement obj_R24_gswoman2, _00AC
	GoTo _0078

_0060:
	ApplyMovement obj_R24_rocketm, _0090
	ApplyMovement obj_R24_gsman1, _00A0
	ApplyMovement obj_R24_gswoman2, _00AC
_0078:
	WaitMovement
	SetVar VAR_SCENE_ROUTE_24_ROCKET, 2
	ReleaseAll
	End

	.balign 4, 0
_0084:
	EmoteExclamationMark
	WalkFastWest 3
	EndMovement

	.balign 4, 0
_0090:
	FaceNorth
	EmoteExclamationMark
	WalkFastWest 3
	EndMovement

	.balign 4, 0
_00A0:
	Delay16 3
	FaceSouth
	EndMovement

	.balign 4, 0
_00AC:
	Delay16 3
	WalkFastSouth
	FaceNorth
	EndMovement

scr_seq_R24_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	StopBGM SEQ_GS_R_12_24
	PlayBGM SEQ_GS_EYE_ROCKET
	NPCMsg msg_0362_R24_00000
	CloseMsg
	TrainerBattle TRAINER_TEAM_ROCKET_GRUNT_24, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _014A
	NPCMsg msg_0362_R24_00002
	CloseMsg
	FadeOutBGM 0, 30
	NPCMsg msg_0362_R24_00003
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_R24_rocketm, _0150
	ApplyMovement obj_player, _015C
	ApplyMovement obj_R24_gsman1, _0170
	ApplyMovement obj_R24_gswoman2, _017C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	HidePerson obj_R24_rocketm
	SetFlag FLAG_HIDE_ROUTE_24_ROCKET
	ClearFlag FLAG_HIDE_CERULEAN_GYM_MACHINE_PART
	PlayBGM SEQ_GS_R_12_24
	SetVar VAR_SCENE_ROUTE_24_ROCKET, 3
	ReleaseAll
	End

_014A:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_0150:
	WalkFastEast
	WalkFastSouth 10
	EndMovement

	.balign 4, 0
_015C:
	LockDir
	WalkFastEast
	UnlockDir
	FaceSouth
	EndMovement

	.balign 4, 0
_0170:
	Delay4 12
	FaceWest
	EndMovement

	.balign 4, 0
_017C:
	Delay4
	FaceSouth
	Delay4 10
	WalkNormalNorth
	FaceWest
	EndMovement

scr_seq_R24_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Compare VAR_SCENE_ROUTE_24_ROCKET, 2
	GoToIfNe _01B3
	GoTo _01DC

_01AD:
	GoTo _01DC

_01B3:
	Compare VAR_SCENE_ROUTE_24_ROCKET, 3
	GoToIfNe _01D1
	FacePlayer
	NPCMsg msg_0362_R24_00005
	GoTo _01DF

_01CB:
	GoTo _01DC

_01D1:
	FacePlayer
	NPCMsg msg_0362_R24_00006
	GoTo _01DF

_01DC:
	NPCMsg msg_0362_R24_00004
_01DF:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R24_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Compare VAR_SCENE_ROUTE_24_ROCKET, 2
	GoToIfNe _0206
	GoTo _022F

_0200:
	GoTo _022F

_0206:
	Compare VAR_SCENE_ROUTE_24_ROCKET, 3
	GoToIfNe _0224
	FacePlayer
	NPCMsg msg_0362_R24_00008
	GoTo _0232

_021E:
	GoTo _022F

_0224:
	FacePlayer
	NPCMsg msg_0362_R24_00009
	GoTo _0232

_022F:
	NPCMsg msg_0362_R24_00007
_0232:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
