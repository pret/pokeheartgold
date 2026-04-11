#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0303.h"
#include "msgdata/msg/msg_0261_P01R0303.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0303_000
	ScrDef scr_seq_P01R0303_001
	ScrDefEnd

scr_seq_P01R0303_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_UNK_0ED, _0112
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfEq _009D
	ApplyMovement obj_P01R0303_seaman_2, _0120
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_P01R0303_seaman_2, _0144
	ApplyMovement obj_player, _01C8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0261_P01R0303_00005
	CloseMsg
	TrainerBattle TRAINER_SAILOR_STANLY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _010C
	NPCMsg msg_0261_P01R0303_00006
	CloseMsg
	ApplyMovement obj_P01R0303_seaman_2, _0160
	WaitMovement
	SetVar VAR_UNK_40CB, 3
	HidePerson obj_P01R0303_seaman_2
	SetFlag FLAG_UNK_21A
	ReleaseAll
	End

_009D:
	ApplyMovement obj_P01R0303_seaman_2, _016C
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_P01R0303_seaman_2, _0190
	ApplyMovement obj_player, _01DC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0261_P01R0303_00005
	CloseMsg
	TrainerBattle TRAINER_SAILOR_STANLY, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _010C
	NPCMsg msg_0261_P01R0303_00006
	CloseMsg
	ApplyMovement obj_P01R0303_seaman_2, _01AC
	WaitMovement
	SetVar VAR_UNK_40CB, 3
	HidePerson obj_P01R0303_seaman_2
	SetFlag FLAG_UNK_21A
	ReleaseAll
	End

_010C:
	WhiteOut
	ReleaseAll
	End

_0112:
	NPCMsg msg_0261_P01R0303_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0120:
	EmoteExclamationMark
	Delay8
	FaceEast 2
	FaceWest 2
	FaceEast 2
	LockDir
	JumpFarWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0144:
	FaceNorth 2
	WalkFastNorth 2
	FaceEast 2
	WalkFastEast 4
	FaceSouth 2
	WalkFastSouth
	EndMovement

	.balign 4, 0
_0160:
	FaceNorth 2
	WalkFastNorth 7
	EndMovement

	.balign 4, 0
_016C:
	EmoteExclamationMark
	Delay8
	FaceWest 2
	FaceEast 2
	FaceWest 2
	LockDir
	JumpFarEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0190:
	FaceNorth 2
	WalkFastNorth 2
	FaceWest 2
	WalkFastWest 4
	FaceSouth 2
	WalkFastSouth
	EndMovement

	.balign 4, 0
_01AC:
	FaceNorth 2
	WalkFastNorth 3
	FaceEast 2
	WalkFastEast 4
	FaceNorth 2
	WalkFastNorth 4
	EndMovement

	.balign 4, 0
_01C8:
	Delay16
	FaceEast 2
	WalkNormalEast
	FaceNorth 2
	EndMovement

	.balign 4, 0
_01DC:
	Delay16
	FaceWest 2
	WalkNormalWest
	FaceNorth 2
	EndMovement

scr_seq_P01R0303_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _02B4
	WaitMovement
	NPCMsg msg_0261_P01R0303_00000
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HealParty
	ScrCmd_436
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0261_P01R0303_00001
	CloseMsg
	ScrCmd_729 VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _0247
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
_0247:
	ApplyMovement obj_player, _02C4
	WaitMovement
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _0268
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
_0268:
	Compare VAR_UNK_40CB, 7
	GoToIfGe _0279
	ReleaseAll
	End

_0279:
	GoToIfSet FLAG_BOAT_ARRIVED, _02AD
	PlaySE SEQ_SE_DP_PINPON
	WaitSE SEQ_SE_DP_PINPON
	SetFlag FLAG_BOAT_ARRIVED
	Compare VAR_BOAT_DIRECTION, 1
	GoToIfNe _02A6
	NPCMsg msg_0261_P01R0303_00003
	GoTo _02A9

_02A6:
	NPCMsg msg_0261_P01R0303_00002
_02A9:
	WaitButton
	CloseMsg
_02AD:
	ReleaseAll
	End

	.balign 4, 0
_02B4:
	FaceSouth 2
	Delay16
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_02C4:
	FaceEast 2
	JumpNearFastEast
	EndMovement
	.balign 4, 0
