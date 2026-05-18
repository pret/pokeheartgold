#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R36R0201.h"
#include "msgdata/msg/msg_0392_R36R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R36R0201_000
	ScrDef scr_seq_R36R0201_001
	ScrDef scr_seq_R36R0201_002
	ScrDefEnd

scr_seq_R36R0201_000:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_UNK_4118, 1
	GoToIfNe _002D
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0086

_002D:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0048
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0086

_0048:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0063
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0086

_0063:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _007E
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0086

_007E:
	ClearFlag FLAG_UNK_1C3
	SetFlag FLAG_UNK_1C4
_0086:
	End

scr_seq_R36R0201_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0120
	WaitMovement
	CallStd std_bug_contest_guard_ask_end
	Compare VAR_UNK_4118, 1
	GoToIfNe _011A
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0128
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST, 0, 75, 39, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _010A
	ScrCmd_606
	GoTo _010C

_010A:
	ScrCmd_607
_010C:
	ApplyMovement obj_partner_poke, _0130
	WaitMovement
	Release obj_partner_poke
_011A:
	ReleaseAll
	End

	.balign 4, 0
_0120:
	FaceNorth
	EndMovement

	.balign 4, 0
_0128:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0130:
	FaceWest
	EndMovement

scr_seq_R36R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_bug_contest_guard_start
	Compare VAR_UNK_4118, 1
	GoToIfNe _0231
	GoToIfSet FLAG_UNK_1C4, _01BA
	GetPlayerFacing VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0185
	ApplyMovement obj_player, _0238
	GoTo _01A8

_0185:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _01A0
	ApplyMovement obj_player, _0240
	GoTo _01A8

_01A0:
	ApplyMovement obj_player, _024C
_01A8:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _01DC

_01BA:
	GetPlayerFacing VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _025C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
_01DC:
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST, 0, 75, 39, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0221
	ScrCmd_606
	GoTo _0223

_0221:
	ScrCmd_607
_0223:
	ApplyMovement obj_partner_poke, _0130
	WaitMovement
	Release obj_partner_poke
_0231:
	ReleaseAll
	End

	.balign 4, 0
_0238:
	FaceWest
	EndMovement

	.balign 4, 0
_0240:
	WalkNormalSouth
	WalkNormalWest
	EndMovement

	.balign 4, 0
_024C:
	WalkNormalEast
	WalkNormalSouth 2
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_025C:
	WalkNormalSouth
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
