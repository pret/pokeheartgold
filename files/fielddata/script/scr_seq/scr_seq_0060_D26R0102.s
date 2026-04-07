#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0102.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "msgdata/msg/msg_0091_D26R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D26R0102_000
	ScrDef scr_seq_D26R0102_001
	ScrDef scr_seq_D26R0102_002
	ScrDefEnd

scr_seq_D26R0102_000:
	SimpleNPCMsg msg_0091_D26R0102_00005
	End

scr_seq_D26R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0091_D26R0102_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0047
	CloseMsg
	ReleaseAll
	End

_0047:
	BufferPlayersName 0
	NPCMsg msg_0091_D26R0102_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0102_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0091_D26R0102_00001
	CloseMsg
	TrainerBattle TRAINER_EXECUTIVE_PROTON_PROTON, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0193
	NPCMsg msg_0091_D26R0102_00002
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	HidePerson obj_D26R0102_rocketm
	HidePerson obj_D26R0102_rocketm_2
	HidePerson obj_D26R0102_rocketw
	HidePerson obj_D26R0102_rkanbum3
	SetFlag FLAG_UNK_1A9
	Wait 20, VAR_SPECIAL_x8004
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	MovePersonFacing obj_D26R0102_gantetsu, 36, 0, 7, DIR_WEST
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00F7
	ApplyMovement obj_D26R0102_gantetsu, _019C
	ApplyMovement obj_player, _01C0
	GoTo _0107

_00F7:
	ApplyMovement obj_D26R0102_gantetsu, _019C
	ApplyMovement obj_player, _01DC
_0107:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	NPCMsg msg_0091_D26R0102_00000
	CloseMsg
	ClearFlag FLAG_UNK_19E
	ClearFlag FLAG_HIDE_AZALEA_SLOWPOKES
	SetFlag FLAG_BEAT_AZALEA_ROCKETS
	SetVar VAR_UNK_4075, 1
	SetVar VAR_UNK_4080, 2
	SetVar VAR_FARFETCHD1_STICKS1, STICKS_ACTIVE
	SetVar VAR_FARFETCHD1_STICKS2, STICKS_ACTIVE
	SetVar VAR_FARFETCHD2_STICKS4, STICKS_ACTIVE
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_AZALEA_KURT_HOUSE, 0, 4, 5, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_1AA
	SetFlag FLAG_UNK_1D5
	SetFlag FLAG_UNK_1AC
	ClearFlag FLAG_HIDE_ILEX_APPRENTICE
	ClearFlag FLAG_HIDE_FARFETCHD_1_LOST
	ClearFlag FLAG_HIDE_FARFETCHD_2_LOST
	SetVar VAR_UNK_40F4, 1
	ReleaseAll
	End

_0193:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_019C:
	WalkNormalWest 2
	WalkNormalSouth 2
	WalkNormalWest 3
	WalkNormalNorth 2
	Delay4 4
	WalkNormalWest
	WalkNormalNorth 3
	FaceWest
	EndMovement

	.balign 4, 0
_01C0:
	WalkNormalEast 2
	FaceNorth
	Delay8 6
	FaceSouth
	Delay8 5
	FaceEast
	EndMovement

	.balign 4, 0
_01DC:
	WalkNormalSouth
	WalkNormalEast
	FaceNorth
	Delay8 6
	FaceSouth
	Delay8 5
	FaceEast
	EndMovement
	.balign 4, 0
