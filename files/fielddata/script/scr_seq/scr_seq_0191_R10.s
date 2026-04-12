#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10.h"
#include "msgdata/msg/msg_0341_R10.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R10_000
	ScrDef scr_seq_R10_001
	ScrDef scr_seq_R10_002
	ScrDef scr_seq_R10_003
	ScrDef scr_seq_R10_004
	ScrDef scr_seq_R10_005
	ScrDef scr_seq_R10_006
	ScrDefEnd

scr_seq_R10_004:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _002B
	End

_002B:
	SetFlag FLAG_HIDE_ROUTE_10_ZAPDOS
	HidePerson obj_R10_tsure_poke_static_zapdos
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_R10_001:
	CheckBadge BADGE_EARTH, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfEq _0052
	GoTo _00BF

_0052:
	GoToIfUnset FLAG_CAUGHT_ZAPDOS, _00BF
	CheckRegisteredPhoneNumber PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00BF
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _008B
	ClearFlag FLAG_HIDE_ROUTE_10_LT_SURGE
	GoTo _00BD

_008B:
	Compare VAR_TEMP_x4000, 10
	GoToIfNe _00A2
	ClearFlag FLAG_HIDE_ROUTE_10_LT_SURGE
	GoTo _00BD

_00A2:
	Compare VAR_TEMP_x4000, 11
	GoToIfNe _00B9
	ClearFlag FLAG_HIDE_ROUTE_10_LT_SURGE
	GoTo _00BD

_00B9:
	SetFlag FLAG_HIDE_ROUTE_10_LT_SURGE
_00BD:
	End

_00BF:
	End

scr_seq_R10_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0148
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0197
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 25
	GoToIfNe _0197
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _018C
	NPCMsg msg_0341_R10_00000
_0114:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0138
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _017B
	End

_0138:
	BufferPlayersName 0
	NPCMsg msg_0341_R10_00001
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_LT__SURGE
_0148:
	NPCMsg msg_0341_R10_00002
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_HIDE_ROUTE_10_LT_SURGE
	HidePerson obj_R10_gsleader9
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_017B:
	SetVar VAR_TEMP_x4002, 1
	NPCMsg msg_0341_R10_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018C:
	NPCMsg msg_0341_R10_00004
	GoTo _0114
	End

_0197:
	NPCMsg msg_0341_R10_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R10_000:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_RESTORED_POWER, _0209
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01D5
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01D5
	ScrCmd_600
_01D5:
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ROUTE_10_POWER_PLANT_BROKEN, 0, 7, 20, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_582 MAP_ROUTE_10, 1423, 185
	ReleaseAll
	End

_0209:
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _022D
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _022D
	ScrCmd_600
_022D:
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_ROUTE_10_POWER_PLANT_REPAIRED, 0, 7, 20, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_582 MAP_ROUTE_10, 1423, 185
	ReleaseAll
	End

scr_seq_R10_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_ZAPDOS, 0
	WaitCry
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_ZAPDOS, 50, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02B3
	GetStaticEncounterOutcome VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 3
	GoToIfEq _02AF
	Compare VAR_TEMP_x4002, 4
	CallIfEq _02B9
_02AF:
	ReleaseAll
	End

_02B3:
	WhiteOut
	ReleaseAll
	End

_02B9:
	SetFlag FLAG_CAUGHT_ZAPDOS
	Return

scr_seq_R10_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0341_R10_00008, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R10_006:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0341_R10_00009, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
