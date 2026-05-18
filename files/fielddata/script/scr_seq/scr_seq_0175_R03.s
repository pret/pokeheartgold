#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R03.h"
#include "msgdata/msg/msg_0326_R03.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R03_000
	ScrDef scr_seq_R03_001
	ScrDef scr_seq_R03_002
	ScrDef scr_seq_R03_003
	ScrDef scr_seq_R03_004
	ScrDefEnd

scr_seq_R03_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_517 SPECIES_DEOXYS, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02DF
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 386
	GoToIfEq _0050
	ScrCmd_518 3
	GoTo _00BE

_0050:
	ScrCmd_518 3
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	GetPlayerCoords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	GetPlayerFacing VAR_SPECIAL_RESULT
	Warp MAP_ROUTE_3, 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00B2
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _009E
	ScrCmd_605 0, 1
	GoTo _00A2

_009E:
	ScrCmd_605 3, 2
_00A2:
	ToggleFollowingPokemonMovement 0
	ScrCmd_608
	Wait 10, VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 1
_00B2:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_00BE:
	PlayCry SPECIES_DEOXYS, 0
	NPCMsg msg_0326_R03_00002
	GoTo _02D5

scr_seq_R03_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_517 SPECIES_DEOXYS, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02DF
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 386
	GoToIfEq _0107
	ScrCmd_518 2
	GoTo _018C

_0107:
	ScrCmd_518 2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	GetPlayerCoords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	GetPlayerFacing VAR_SPECIAL_RESULT
	Warp MAP_ROUTE_3, 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0180
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0155
	ScrCmd_605 0, 1
	GoTo _0170

_0155:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _016C
	ScrCmd_605 0, 1
	GoTo _0170

_016C:
	ScrCmd_605 3, 2
_0170:
	ToggleFollowingPokemonMovement 0
	ScrCmd_608
	Wait 10, VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 1
_0180:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_018C:
	PlayCry SPECIES_DEOXYS, 0
	NPCMsg msg_0326_R03_00003
	GoTo _02D5

scr_seq_R03_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_517 SPECIES_DEOXYS, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02DF
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 386
	GoToIfEq _01D5
	ScrCmd_518 1
	GoTo _022C

_01D5:
	ScrCmd_518 1
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	GetPlayerCoords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	GetPlayerFacing VAR_SPECIAL_RESULT
	Warp MAP_ROUTE_3, 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0220
	ScrCmd_605 2, 3
	ToggleFollowingPokemonMovement 0
	ScrCmd_608
	Wait 10, VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 1
_0220:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_022C:
	PlayCry SPECIES_DEOXYS, 0
	NPCMsg msg_0326_R03_00004
	GoTo _02D5

scr_seq_R03_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	ScrCmd_517 SPECIES_DEOXYS, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02DF
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 386
	GoToIfEq _0275
	ScrCmd_518 0
	GoTo _02CC

_0275:
	ScrCmd_518 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	GetPlayerCoords VAR_SPECIAL_x8006, VAR_SPECIAL_x8007
	GetPlayerFacing VAR_SPECIAL_RESULT
	Warp MAP_ROUTE_3, 0, VAR_SPECIAL_x8006, VAR_SPECIAL_x8007, VAR_SPECIAL_RESULT
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02C0
	ScrCmd_605 3, 2
	ToggleFollowingPokemonMovement 0
	ScrCmd_608
	Wait 10, VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 1
_02C0:
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_02CC:
	PlayCry SPECIES_DEOXYS, 0
	NPCMsg msg_0326_R03_00005
_02D5:
	WaitButton
	WaitCry
	CloseMsg
	ReleaseAll
	End

_02DF:
	NPCMsg msg_0326_R03_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R03_000:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0326_R03_00000, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
