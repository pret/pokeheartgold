#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0201.h"
#include "msgdata/msg/msg_0523_T10R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T10R0201_000
	ScrDef scr_seq_T10R0201_001
	ScrDef scr_seq_T10R0201_002
	ScrDefEnd

scr_seq_T10R0201_002:
	GoToIfSet FLAG_DEFEATED_WILL, _0023
	MakeObjectVisible obj_T10R0201_stop
	MakeObjectVisible obj_T10R0201_stop_2
	End

_0023:
	End

scr_seq_T10R0201_000:
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
	ClearFlag FLAG_HIDE_WILLS_ROOM_RETREAT
	ShowPerson obj_T10R0201_babyboy1_11
	SetVar VAR_TEMP_x4001, 1
	ReleaseAll
	End

	.balign 4, 0
_0060:
	WalkNormalNorth 6
	EndMovement

scr_seq_T10R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_DEFEATED_WILL, _00D1
	NPCMsg msg_0523_T10R0201_00000
	CloseMsg
	Compare VAR_UNK_4135, 8
	GoToIfLt _009B
	TrainerBattle TRAINER_ELITE_FOUR_WILL_WILL_2, 0, 0, 0
	GoTo _00A3

_009B:
	TrainerBattle TRAINER_ELITE_FOUR_WILL_WILL, 0, 0, 0
_00A3:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00DC
	SetFlag FLAG_DEFEATED_WILL
	NPCMsg msg_0523_T10R0201_00001
	CloseMsg
	PlaySE SEQ_SE_DP_KI_GASYAN
	HidePerson obj_T10R0201_leag_door2
	HidePerson obj_T10R0201_stop
	HidePerson obj_T10R0201_stop_2
	ReleaseAll
	End

_00D1:
	NPCMsg msg_0523_T10R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DC:
	WhiteOut
	ReleaseAll
	End
	.balign 4, 0
