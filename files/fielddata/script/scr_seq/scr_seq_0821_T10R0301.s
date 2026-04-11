#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0301.h"
#include "msgdata/msg/msg_0524_T10R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T10R0301_000
	ScrDef scr_seq_T10R0301_001
	ScrDef scr_seq_T10R0301_002
	ScrDefEnd

scr_seq_T10R0301_002:
	GoToIfSet FLAG_DEFEATED_KOGA, _0023
	MakeObjectVisible obj_T10R0301_stop
	MakeObjectVisible obj_T10R0301_stop_2
	End

_0023:
	End

scr_seq_T10R0301_000:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0060
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_KI_GASYAN
	ClearFlag FLAG_HIDE_KOGAS_ROOM_RETREAT
	ShowPerson obj_T10R0301_babyboy1_11
	SetVar VAR_TEMP_x4001, 1
	ReleaseAll
	End

	.balign 4, 0
_0060:
	WalkNormalNorth 6
	EndMovement

scr_seq_T10R0301_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_DEFEATED_KOGA, _00D1
	NPCMsg msg_0524_T10R0301_00000
	CloseMsg
	Compare VAR_UNK_4135, 8
	GoToIfLt _009B
	TrainerBattle TRAINER_ELITE_FOUR_KOGA_KOGA_2, 0, 0, 0
	GoTo _00A3

_009B:
	TrainerBattle TRAINER_ELITE_FOUR_KOGA_KOGA, 0, 0, 0
_00A3:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00DC
	SetFlag FLAG_DEFEATED_KOGA
	NPCMsg msg_0524_T10R0301_00001
	CloseMsg
	PlaySE SEQ_SE_DP_KI_GASYAN
	HidePerson obj_T10R0301_leag_door2
	HidePerson obj_T10R0301_stop
	HidePerson obj_T10R0301_stop_2
	ReleaseAll
	End

_00D1:
	NPCMsg msg_0524_T10R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DC:
	WhiteOut
	ReleaseAll
	End
	.balign 4, 0
