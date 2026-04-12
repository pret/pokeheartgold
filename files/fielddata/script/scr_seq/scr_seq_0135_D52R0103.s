#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D52R0103.h"
#include "msgdata/msg/msg_0150_D52R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D52R0103_000
	ScrDef scr_seq_D52R0103_001
	ScrDef scr_seq_D52R0103_002
	ScrDef scr_seq_D52R0103_003
	ScrDefEnd

scr_seq_D52R0103_002:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _001F
	End

_001F:
	SetFlag FLAG_HIDE_EMBEDDED_TOWER_RAYQUAZA
	HidePerson obj_D52R0103_tsure_poke_static_rayquaza
	End

scr_seq_D52R0103_003:
	Compare VAR_SCENE_EMBEDDED_TOWER, 7
	GoToIfGe _003C
	ClearFlag FLAG_HIDE_EMBEDDED_TOWER_RAYQUAZA
	End

_003C:
	End

scr_seq_D52R0103_001:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00B4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlayCry SPECIES_RAYQUAZA, 0
	WaitCry
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00B4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Release obj_D52R0103_tsure_poke_static_rayquaza
	ScrCmd_523 obj_D52R0103_tsure_poke_static_rayquaza, 8, 90, 3, 0
	PlayCry SPECIES_RAYQUAZA, 0
	NPCMsg msg_0150_D52R0103_00000
	WaitCry
	Lock obj_D52R0103_tsure_poke_static_rayquaza
	CloseMsg
	SetVar VAR_SCENE_EMBEDDED_TOWER, 6
	ReleaseAll
	End

	.balign 4, 0
_00B4:
	WalkNormalNorth 8
	Delay8 2
	EndMovement

scr_seq_D52R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Release obj_D52R0103_tsure_poke_static_rayquaza
	ScrCmd_523 obj_D52R0103_tsure_poke_static_rayquaza, 8, 90, 3, 0
	PlayCry SPECIES_RAYQUAZA, 0
	NPCMsg msg_0150_D52R0103_00000
	WaitCry
	CloseMsg
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_RAYQUAZA, 50, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0142
	GetStaticEncounterOutcome VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 3
	GoToIfEq _0123
	Compare VAR_TEMP_x4002, 4
	GoToIfEq _0134
_0123:
	NPCMsg msg_0150_D52R0103_00001
	WaitButton
	CloseMsg
	SetVar VAR_SCENE_EMBEDDED_TOWER, 9
	ReleaseAll
	End

_0134:
	SetVar VAR_SCENE_EMBEDDED_TOWER, 7
	SetFlag FLAG_CAUGHT_RAYQUAZA
	ReleaseAll
	End

_0142:
	WhiteOut
	ReleaseAll
	End
	.balign 4, 0
