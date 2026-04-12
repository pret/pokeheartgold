#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R11.h"
#include "msgdata/msg/msg_0346_R11.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R11_000
	ScrDef scr_seq_R11_001
	ScrDef scr_seq_R11_002
	ScrDef scr_seq_R11_003
	ScrDefEnd

scr_seq_R11_001:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _002A
	GoToIfSet FLAG_SNORLAX_MEET, _0044
	End

_002A:
	SetFlag FLAG_HIDE_ROUTE_11_SNORLAX
	HidePerson obj_R11_kabigon
	HidePerson obj_R11_gsbabyboy1_2
	HidePerson obj_R11_gsbabyboy1
	HidePerson obj_R11_gsbabyboy1_3
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

_0044:
	End

scr_seq_R11_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	RadioMusicIsPlaying 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _006A
	NPCMsg msg_0346_R11_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006A:
	PlayCry SPECIES_SNORLAX, 0
	NPCMsg msg_0346_R11_00003
	WaitCry
	CloseMsg
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_SNORLAX, 50, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00B4
	GetStaticEncounterOutcome VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 4
	CallIfEq _00BA
	SetFlag FLAG_UNK_998
	SetFlag FLAG_SNORLAX_MEET
	ReleaseAll
	End

_00B4:
	WhiteOut
	ReleaseAll
	End

_00BA:
	SetFlag FLAG_CAUGHT_SNORLAX
	Return

scr_seq_R11_002:
	DirectionSignpost msg_0346_R11_00000, 1, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R11_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0346_R11_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
