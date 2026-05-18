#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D52R0102.h"
#include "msgdata/msg/msg_0149_D52R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D52R0102_000
	ScrDef scr_seq_D52R0102_001
	ScrDef scr_seq_D52R0102_002
	ScrDefEnd

scr_seq_D52R0102_001:
	Compare VAR_SCENE_EMBEDDED_TOWER, 4
	GoToIfGe _007C
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _0038
	GoTo _004A

_0032:
	GoTo _003E

_0038:
	GoTo _0040

_003E:
	End

_0040:
	SetFlag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE
	SetFlag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	End

_004A:
	GoToIfSet FLAG_BEAT_OR_ESCAPED_FROM_GROUDON_OR_KYOGRE, _007C
	HasItem ITEM_BLUE_ORB, 1, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfGe _0072
	GoTo _0040
	End

_0072:
	SetFlag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	ClearFlag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE
	End

_007C:
	End

scr_seq_D52R0102_002:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _008B
	End

_008B:
	SetFlag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE
	HidePerson obj_D52R0102_tsure_poke_static_kyogre
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_D52R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_KYOGRE, 0
	NPCMsg msg_0149_D52R0102_00000
	WaitCry
	CloseMsg
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_KYOGRE, 50, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _019D
	GetStaticEncounterOutcome VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 3
	GoToIfEq _00EC
	Compare VAR_TEMP_x4002, 4
	GoToIfEq _00FB
_00EC:
	NPCMsg msg_0149_D52R0102_00001
	WaitButton
	CloseMsg
	SetFlag FLAG_BEAT_OR_ESCAPED_FROM_GROUDON_OR_KYOGRE
	ReleaseAll
	End

_00FB:
	SetVar VAR_SCENE_EMBEDDED_TOWER, 4
	SetFlag FLAG_CAUGHT_KYOGRE
	ClearFlag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	ShowPerson obj_D52R0102_mount_2
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _0142
	ApplyMovement obj_D52R0102_mount_2, _01A4
	WaitMovement
	ApplyMovement obj_player, _01B0
	WaitMovement
	GoTo _0156

_0142:
	ApplyMovement obj_D52R0102_mount_2, _01BC
	WaitMovement
	ApplyMovement obj_player, _01C8
	WaitMovement
_0156:
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0149_D52R0102_00002
	CloseMsg
	ApplyMovement obj_D52R0102_mount_2, _01D0
	WaitMovement
	NPCMsg msg_0149_D52R0102_00003
	CloseMsg
	ApplyMovement obj_D52R0102_mount_2, _01E0
	WaitMovement
	NPCMsg msg_0149_D52R0102_00004
	CloseMsg
	ApplyMovement obj_D52R0102_mount_2, _01EC
	WaitMovement
	HidePerson obj_D52R0102_mount_2
	SetFlag FLAG_HIDE_EMBEDDED_TOWER_KYOGRE_HIKER
	SetFlag FLAG_HIDE_ROUTE_47_EMBEDDED_TOWER_HIKER
	ReleaseAll
	End

_019D:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_01A4:
	WalkNormalNorth 8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01B0:
	WalkOnSpotNormalSouth
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01BC:
	WalkNormalNorth 10
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01C8:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01D0:
	WalkOnSpotNormalSouth
	WalkSlowSouth 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01E0:
	WalkNormalNorth 2
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01EC:
	WalkNormalSouth 8
	EndMovement
	.balign 4, 0
