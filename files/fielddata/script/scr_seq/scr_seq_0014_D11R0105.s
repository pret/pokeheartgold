#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0105.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D11R0105_000
	ScrDef scr_seq_D11R0105_001
	ScrDefEnd

scr_seq_D11R0105_001:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _0017
	End

_0017:
	SetFlag FLAG_HIDE_SEAFOAM_ISLAND_ARTICUNO
	HidePerson obj_D11R0105_tsure_poke_static_articuno
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_D11R0105_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_ARTICUNO, 0
	WaitCry
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_ARTICUNO, 50, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0077
	GetStaticEncounterOutcome VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 3
	GoToIfEq _0073
	Compare VAR_TEMP_x4002, 4
	CallIfEq _007D
_0073:
	ReleaseAll
	End

_0077:
	WhiteOut
	ReleaseAll
	End

_007D:
	SetFlag FLAG_CAUGHT_ARTICUNO
	Return
	.balign 4, 0
