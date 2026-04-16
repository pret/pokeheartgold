#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0401.h"
#include "msgdata/msg/msg_0525_T10R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T10R0401_000
	ScrDef scr_seq_T10R0401_001
	ScrDef scr_seq_T10R0401_002
	ScrDefEnd

scr_seq_T10R0401_002:
	GoToIfSet FLAG_DEFEATED_BRUNO, _0023
	MakeObjectVisible obj_T10R0401_leag_door2_2
	MakeObjectVisible obj_T10R0401_leag_door2_3
	End

_0023:
	End

scr_seq_T10R0401_000:
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
	ClearFlag FLAG_HIDE_BRUNOS_ROOM_RETREAT
	ShowPerson obj_T10R0401_babyboy1_11
	SetVar VAR_TEMP_x4001, 1
	ReleaseAll
	End

	.balign 4, 0
_0060:
	WalkNormalNorth 6
	EndMovement

scr_seq_T10R0401_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_DEFEATED_BRUNO, _00D4
	BufferPlayersName 0
	NPCMsg msg_0525_T10R0401_00000
	CloseMsg
	Compare VAR_UNK_4135, 8
	GoToIfLt _009E
	TrainerBattle TRAINER_ELITE_FOUR_BRUNO_BRUNO_2, 0, 0, 0
	GoTo _00A6

_009E:
	TrainerBattle TRAINER_ELITE_FOUR_BRUNO_BRUNO, 0, 0, 0
_00A6:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00DF
	SetFlag FLAG_DEFEATED_BRUNO
	NPCMsg msg_0525_T10R0401_00001
	CloseMsg
	PlaySE SEQ_SE_DP_KI_GASYAN
	HidePerson obj_T10R0401_leag_door2
	HidePerson obj_T10R0401_leag_door2_2
	HidePerson obj_T10R0401_leag_door2_3
	ReleaseAll
	End

_00D4:
	NPCMsg msg_0525_T10R0401_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DF:
	WhiteOut
	ReleaseAll
	End
	.balign 4, 0
