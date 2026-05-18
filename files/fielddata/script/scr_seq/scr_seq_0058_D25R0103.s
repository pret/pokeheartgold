#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D25R0103.h"
#include "msgdata/msg/msg_0089_D25R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D25R0103_000
	ScrDef scr_seq_D25R0103_001
	ScrDef scr_seq_D25R0103_002
	ScrDefEnd

scr_seq_D25R0103_002:
	GoToIfSet FLAG_DAILY_CAUGHT_LAPRAS, _003A
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0034
	ClearFlag FLAG_HIDE_UNION_CAVE_LAPRAS
	GoTo _0038

_0034:
	SetFlag FLAG_HIDE_UNION_CAVE_LAPRAS
_0038:
	End

_003A:
	SetFlag FLAG_HIDE_UNION_CAVE_LAPRAS
	End

scr_seq_D25R0103_001:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _004D
	End

_004D:
	SetFlag FLAG_HIDE_UNION_CAVE_LAPRAS
	HidePerson obj_D25R0103_rapurasu
	End

scr_seq_D25R0103_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_LAPRAS, 0
	WaitCry
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_LAPRAS, 20, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _008F
	SetFlag FLAG_DAILY_CAUGHT_LAPRAS
	ReleaseAll
	End

_008F:
	WhiteOut
	ReleaseAll
	End
	.balign 4, 0
