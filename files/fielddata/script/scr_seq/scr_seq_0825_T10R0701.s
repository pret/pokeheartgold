#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0701.h"
#include "msgdata/msg/msg_0528_T10R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T10R0701_000
	ScrDef scr_seq_T10R0701_001
	ScrDefEnd

scr_seq_T10R0701_001:
	StopBGM 0
	End

scr_seq_T10R0701_000:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0188
	ApplyMovement obj_T10R0701_wataru, _0194
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	GenderMsgBox msg_0528_T10R0701_00000, msg_0528_T10R0701_00001
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _01A8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PartyCountNotEgg VAR_SPECIAL_RESULT
	HallOfFameAnim VAR_SPECIAL_RESULT
	AddSpecialGameStat SCORE_EVENT_23
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Call _01B4
	HasItem ITEM_S_S__TICKET, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _009A
	SetVar VAR_SCENE_PLAYERS_HOUSE_1F, 3
_009A:
	SetFlag FLAG_UNK_97E
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	CallIfUnset FLAG_CAUGHT_HO_OH, _01C9
	CallIfUnset FLAG_CAUGHT_LUGIA, _01CF
	CallIfUnset FLAG_CAUGHT_SUDOWOODO, _01D5
	CallIfUnset FLAG_CAUGHT_RED_GYARADOS, _01DB
	CallIfUnset FLAG_CAUGHT_MEWTWO, _01E1
	CallIfUnset FLAG_CAUGHT_ARTICUNO, _01E7
	CallIfUnset FLAG_CAUGHT_ZAPDOS, _01ED
	CallIfUnset FLAG_CAUGHT_MOLTRES, _0206
	GoToIfUnset FLAG_CAUGHT_SNORLAX, _020C
_0105:
	CallIfUnset FLAG_CAUGHT_SUICUNE, _0227
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _012D
	GoTo _023A

_0127:
	GoTo _0133

_012D:
	GoTo _024F

_0133:
	CallIfUnset FLAG_CAUGHT_RAYQUAZA, _0264
	Compare VAR_ROAMER_ENTEI_STATUS, 2
	CallIfEq _026A
	Compare VAR_ROAMER_RAIKOU_STATUS, 2
	CallIfEq _0275
	Compare VAR_ROAMER_LATIAS_STATUS, 2
	CallIfEq _0280
	Compare VAR_ROAMER_LATIOS_STATUS, 2
	CallIfEq _028B
	HOFCredits 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0188:
	WalkNormalNorth 14
	FaceEast 2
	EndMovement

	.balign 4, 0
_0194:
	WalkNormalNorth 12
	FaceEast 2
	WalkNormalEast
	FaceWest 2
	EndMovement

	.balign 4, 0
_01A8:
	FaceNorth 2
	WalkNormalNorth 4
	EndMovement

_01B4:
	GoToIfSet FLAG_GAME_CLEAR, _01C3
	SetFlag FLAG_UNK_998
_01C3:
	ClearFlag FLAG_UNK_25F
	Return

_01C9:
	ClearFlag FLAG_HIDE_BELL_TOWER_HO_OH
	Return

_01CF:
	ClearFlag FLAG_HIDE_WHIRL_ISLAND_LUGIA
	Return

_01D5:
	ClearFlag FLAG_HIDE_ROUTE_36_SUDOWOODO
	Return

_01DB:
	ClearFlag FLAG_HIDE_LAKE_OF_RAGE_RED_GYARADOS
	Return

_01E1:
	ClearFlag FLAG_HIDE_CERULEAN_CAVE_MEWTWO
	Return

_01E7:
	ClearFlag FLAG_HIDE_SEAFOAM_ISLAND_ARTICUNO
	Return

_01ED:
	CheckBadge BADGE_EARTH, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0204
	ClearFlag FLAG_HIDE_ROUTE_10_ZAPDOS
_0204:
	Return

_0206:
	ClearFlag FLAG_HIDE_MT_SILVER_CAVE_MOLTRES
	Return

_020C:
	GoToIfSet FLAG_SNORLAX_MEET, _021D
	GoTo _0105

_021D:
	ClearFlag FLAG_HIDE_ROUTE_12_SNORLAX
	GoTo _0105

_0227:
	Compare VAR_SCENE_ROUTE_25, 3
	GoToIfNe _0238
	ClearFlag FLAG_HIDE_BURNED_TOWER_STATIC_SUICUNE
_0238:
	Return

_023A:
	GoToIfSet FLAG_CAUGHT_KYOGRE, _0133
	ClearFlag FLAG_BEAT_OR_ESCAPED_FROM_GROUDON_OR_KYOGRE
	GoTo _0133

// This branch is for SoulSilver, so this should be checking
// FLAG_CAUGHT_GROUDON instead of FLAG_CAUGHT_KYOGRE. This problem
// has existed since this file was disassembled and is probably a
// mistake in SoulSilver. Because capturing Groudon sets
// VAR_SCENE_EMBEDDED_TOWER to 4 and the tower does not regenerate
// Groudon if the variable is 4 or more, the mistake has no effect.
_024F:
	GoToIfSet FLAG_CAUGHT_KYOGRE, _0133
	ClearFlag FLAG_BEAT_OR_ESCAPED_FROM_GROUDON_OR_KYOGRE
	GoTo _0133

_0264:
	ClearFlag FLAG_HIDE_EMBEDDED_TOWER_RAYQUAZA
	Return

_026A:
	SetVar VAR_ROAMER_ENTEI_STATUS, 0
	CreateRoamer 1
	Return

_0275:
	SetVar VAR_ROAMER_RAIKOU_STATUS, 0
	CreateRoamer 0
	Return

_0280:
	SetVar VAR_ROAMER_LATIAS_STATUS, 0
	CreateRoamer 2
	Return

_028B:
	SetVar VAR_ROAMER_LATIOS_STATUS, 0
	CreateRoamer 3
	Return
	.balign 4, 0
