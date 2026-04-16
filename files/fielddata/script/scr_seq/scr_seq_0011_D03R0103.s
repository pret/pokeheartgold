#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D03R0103.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D03R0103_000
	ScrDef scr_seq_D03R0103_001
	ScrDefEnd

scr_seq_D03R0103_001:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _0017
	End

_0017:
	SetFlag FLAG_HIDE_CERULEAN_CAVE_MEWTWO
	HidePerson obj_D03R0103_tsure_poke_static_mewtwo
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_D03R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MEWTWO, 0
	WaitCry
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_MEWTWO, 70, 0
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
	SetFlag FLAG_CAUGHT_MEWTWO
	Return
	.balign 4, 0
