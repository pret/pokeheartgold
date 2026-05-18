#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D18R0102.h"
#include "msgdata/msg/msg_0061_D18R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D18R0102_000
	ScrDef scr_seq_D18R0102_001
	ScrDef scr_seq_D18R0102_002
	ScrDefEnd

scr_seq_D18R0102_002:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _001B
	End

_001B:
	SetFlag FLAG_HIDE_BURNED_TOWER_STATIC_SUICUNE
	HidePerson obj_D18R0102_tsure_poke_static_suicune_2
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_D18R0102_000:
	ScrCmd_609
	LockAll
	PlayCry SPECIES_RAIKOU, 0
	Release obj_D18R0102_tsure_poke_static_raikou
	ScrCmd_523 obj_D18R0102_tsure_poke_static_raikou, 2, 90, 2, 0
	Lock obj_D18R0102_tsure_poke_static_raikou
	WaitCry
	PlayCry SPECIES_ENTEI, 0
	Release obj_D18R0102_tsure_poke_static_entei
	ScrCmd_523 obj_D18R0102_tsure_poke_static_entei, 2, 90, 2, 0
	Lock obj_D18R0102_tsure_poke_static_entei
	WaitCry
	PlayCry SPECIES_SUICUNE, 0
	Release obj_D18R0102_tsure_poke_static_suicune
	ScrCmd_523 obj_D18R0102_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_D18R0102_tsure_poke_static_suicune
	WaitCry
	ApplyMovement obj_D18R0102_tsure_poke_static_raikou, _0224
	WaitMovement
	ApplyMovement obj_D18R0102_tsure_poke_static_entei, _0234
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 16
	GoToIfNe _00C8
	ApplyMovement obj_D18R0102_tsure_poke_static_suicune, _0244
	WaitMovement
	PlayCry SPECIES_SUICUNE, 0
	ApplyMovement obj_D18R0102_tsure_poke_static_suicune, _0254
	WaitCry
	GoTo _00E2

_00C8:
	ApplyMovement obj_D18R0102_tsure_poke_static_suicune, _0268
	WaitMovement
	PlayCry SPECIES_SUICUNE, 0
	ApplyMovement obj_D18R0102_tsure_poke_static_suicune, _0278
	WaitCry
_00E2:
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _028C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetFlag FLAG_HIDE_BURNED_TOWER_B1F_RAIKOU
	SetFlag FLAG_HIDE_BURNED_TOWER_B1F_ENTEI
	SetFlag FLAG_HIDE_BURNED_TOWER_B1F_SUICUNE
	HidePerson obj_D18R0102_tsure_poke_static_raikou
	HidePerson obj_D18R0102_tsure_poke_static_entei
	HidePerson obj_D18R0102_tsure_poke_static_suicune
	CreateRoamer 0
	CreateRoamer 1
	Wait 15, VAR_SPECIAL_RESULT
	ClearFlag FLAG_HIDE_BURNED_TOWER_B1F_EUSINE
	PlaySE SEQ_SE_DP_KAIDAN2
	ShowPerson obj_D18R0102_minaki
	Lock obj_D18R0102_minaki
	WaitSE SEQ_SE_DP_KAIDAN2
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 16
	GoToIfNe _015B
	ApplyMovement obj_D18R0102_minaki, _029C
	GoTo _016B

_015B:
	ApplyMovement obj_D18R0102_minaki, _02B0
	ApplyMovement obj_player, _02D8
_016B:
	WaitMovement
	NPCMsg msg_0061_D18R0102_00000
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 16
	GoToIfNe _0191
	ApplyMovement obj_D18R0102_minaki, _02C4
	GoTo _01A1

_0191:
	ApplyMovement obj_D18R0102_minaki, _02D0
	ApplyMovement obj_player, _02D8
_01A1:
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0061_D18R0102_00001
	CloseMsg
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 16
	GoToIfNe _01CC
	ApplyMovement obj_D18R0102_minaki, _02E8
	GoTo _01D4

_01CC:
	ApplyMovement obj_D18R0102_minaki, _02F8
_01D4:
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	Wait 2, VAR_SPECIAL_RESULT
	HidePerson obj_D18R0102_minaki
	WaitSE SEQ_SE_DP_KAIDAN2
	SetFlag FLAG_HIDE_BURNED_TOWER_B1F_EUSINE
	SetFlag FLAG_HIDE_BURNED_TOWER_1F_EUSINE
	SetFlag FLAG_HIDE_BURNED_TOWER_1F_MORTY
	SetFlag FLAG_HIDE_BURNED_TOWER_1F_RAIKOU
	SetFlag FLAG_HIDE_BURNED_TOWER_1F_ENTEI
	SetFlag FLAG_HIDE_BURNED_TOWER_1F_SUICUNE
	ClearFlag FLAG_HIDE_CIANWOOD_SUICUNE
	SetVar VAR_UNK_40A1, 1
	SetVar VAR_UNK_4076, 1
	SetVar VAR_UNK_4079, 2
	SetFlag FLAG_UNK_247
	ClearFlag FLAG_HIDE_ECRUTEAK_OLD_MAN
	ReleaseAll
	End

	.balign 4, 0
_0224:
	MoveAction_105 1
	SetInvisible
	EndMovement
	End

	.balign 4, 0
_0234:
	MoveAction_106 1
	SetInvisible
	EndMovement
	End

	.balign 4, 0
_0244:
	MoveAction_107 1
	FaceEast
	EndMovement
	End

	.balign 4, 0
_0254:
	Delay4 6
	MoveAction_108 1
	SetInvisible
	EndMovement
	End

	.balign 4, 0
_0268:
	MoveAction_109 1
	FaceEast
	EndMovement
	End

	.balign 4, 0
_0278:
	Delay4 6
	MoveAction_110 1
	SetInvisible
	EndMovement
	End

	.balign 4, 0
_028C:
	WalkNormalWest
	FaceSouth
	EndMovement
	End

	.balign 4, 0
_029C:
	WalkFastSouth
	WalkFastWest 3
	FaceSouth
	EndMovement
	End

	.balign 4, 0
_02B0:
	WalkFastWest 5
	WalkFastSouth
	FaceSouth
	EndMovement
	End

	.balign 4, 0
_02C4:
	WalkFastWest
	FaceNorth
	EndMovement

	.balign 4, 0
_02D0:
	FaceEast
	EndMovement

	.balign 4, 0
_02D8:
	Delay4 6
	FaceWest
	EndMovement
	End

	.balign 4, 0
_02E8:
	WalkFastEast 4
	WalkFastNorth
	EndMovement
	End

	.balign 4, 0
_02F8:
	WalkFastNorth
	WalkFastEast 5
	FaceNorth
	EndMovement
	End

scr_seq_D18R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_SUICUNE, 0
	WaitCry
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle SPECIES_SUICUNE, 40, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _035C
	GetStaticEncounterOutcome VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 3
	GoToIfEq _0358
	Compare VAR_TEMP_x4002, 4
	CallIfEq _0362
_0358:
	ReleaseAll
	End

_035C:
	WhiteOut
	ReleaseAll
	End

_0362:
	SetFlag FLAG_CAUGHT_SUICUNE
	Return
	.balign 4, 0
