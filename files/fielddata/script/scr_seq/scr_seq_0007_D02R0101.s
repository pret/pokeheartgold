#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0101.h"
#include "msgdata/msg/msg_0049_D02R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D02R0101_000
	ScrDefEnd

scr_seq_D02R0101_000:
	CallStd std_play_rival_intro_music
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D02R0101_gsrivel, _00D0
	ApplyMovement obj_player, _00DC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0049_D02R0101_00000
	CloseMsg
	GetStarterChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 152
	GoToIfNe _005A
	TrainerBattle TRAINER_RIVAL_SILVER_15, 0, 0, 0
	GoTo _007D

_005A:
	Compare VAR_SPECIAL_RESULT, 155
	GoToIfNe _0075
	TrainerBattle TRAINER_RIVAL_SILVER_16, 0, 0, 0
	GoTo _007D

_0075:
	TrainerBattle TRAINER_RIVAL_SILVER_14, 0, 0, 0
_007D:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00C9
	CallStd std_play_rival_outro_music
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0049_D02R0101_00001
	CloseMsg
	ApplyMovement obj_D02R0101_gsrivel, _00E8
	WaitMovement
	HidePerson obj_D02R0101_gsrivel
	CallStd std_fade_end_rival_outro_music
	SetFlag FLAG_UNK_25C
	ClearFlag FLAG_HIDE_DRAGONS_DEN_RIVAL
	SetVar VAR_UNK_40FC, 1
	SetVar VAR_UNK_40F5, 1
	SetFlag FLAG_UNK_0E3
	End

_00C9:
	WhiteOut
	End

	.balign 4, 0
_00D0:
	EmoteExclamationMark
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_00DC:
	Delay8 4
	WalkNormalEast
	EndMovement

	.balign 4, 0
_00E8:
	WalkFastEast 5
	WalkFastSouth 9
	EndMovement

_00F4:
	End

	.balign 4, 0
