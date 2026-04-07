#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D18R0101.h"
#include "msgdata/msg/msg_0060_D18R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D18R0101_000
	ScrDef scr_seq_D18R0101_001
	ScrDef scr_seq_D18R0101_002
	ScrDef scr_seq_D18R0101_003
	ScrDefEnd

scr_seq_D18R0101_003:
	ScrCmd_609
	LockAll
	CallStd std_play_rival_intro_music
	ApplyMovement obj_D18R0101_gsrivel, _00D0
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0060_D18R0101_00000
	CloseMsg
	GetStarterChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 152
	GoToIfNe _004B
	TrainerBattle TRAINER_RIVAL_SILVER_8, 0, 0, 0
	GoTo _006E

_004B:
	Compare VAR_SPECIAL_RESULT, 155
	GoToIfNe _0066
	TrainerBattle TRAINER_RIVAL_SILVER_11, 0, 0, 0
	GoTo _006E

_0066:
	TrainerBattle TRAINER_RIVAL_SILVER_4, 0, 0, 0
_006E:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00C7
	CallStd std_play_rival_outro_music
	BufferRivalsName 0
	NPCMsg msg_0060_D18R0101_00001
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_player, _00E8
	ApplyMovement obj_D18R0101_gsrivel, _00F8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	HidePerson obj_D18R0101_gsrivel
	CallStd std_fade_end_rival_outro_music
	SetFlag FLAG_HIDE_BURNED_TOWER_1F_RIVAL
	SetVar VAR_UNK_40A6, 1
	ReleaseAll
	End

_00C7:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_00D0:
	FaceSouth
	EmoteExclamationMark
	WalkNormalSouth 4
	WalkNormalWest
	FaceSouth
	EndMovement

	.balign 4, 0
_00E8:
	WalkNormalSouth 2
	WalkNormalEast
	FaceWest
	EndMovement

	.balign 4, 0
_00F8:
	WalkNormalSouth 3
	WalkNormalWest
	WalkNormalSouth
	WalkNormalWest 3
	WalkNormalSouth
	WalkNormalWest 4
	WalkNormalSouth 3
	EndMovement

scr_seq_D18R0101_000:
	ScrCmd_609
	LockAll
	CallStd std_play_eusine_music
	ApplyMovement obj_D18R0101_minaki, _0158
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0060_D18R0101_00002
	WaitButton
	CloseMsg
	CallStd std_fade_end_eusine_music
	SetVar VAR_UNK_40A2, 1
	ReleaseAll
	End

scr_seq_D18R0101_001:
	SimpleNPCMsg msg_0060_D18R0101_00003
	End

	.balign 4, 0
_0158:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 3
	EndMovement

scr_seq_D18R0101_002:
	SimpleNPCMsg msg_0060_D18R0101_00004
	End
	.balign 4, 0
