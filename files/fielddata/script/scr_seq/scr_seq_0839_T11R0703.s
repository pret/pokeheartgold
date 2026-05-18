#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0703.h"
#include "msgdata/msg/msg_0539_T11R0703.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0703_000
	ScrDefEnd

scr_seq_T11R0703_000:
	ScrCmd_609
	LockAll
	GetPartyLeadAlive VAR_TEMP_x4000
	GetPartyMonSpecies VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 479
	GoToIfNe _018C
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0154
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_partner_poke, _0170
	WaitMovement
	PlayCry SPECIES_ROTOM, 0
	WaitCry
	NPCMsg msg_0539_T11R0703_00000
	CloseMsg
	GoTo _0066

_005C:
	ApplyMovement obj_player, _0154
	WaitMovement
_0066:
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	Switch VAR_ELEVATOR_LAST_FLOOR
	Case 1, _008C
	Case 0, _00C0
	End

_008C:
	SetVar VAR_SPECIAL_x8004, 0
	Call _00F4
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFFRON_SILPH_CO_HQ, 0, 3, 3, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_00C0:
	SetVar VAR_SPECIAL_x8004, 1
	Call _00F4
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFFRON_SILPH_CO_ROTOM_ROOM, 0, 7, 3, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_00F4:
	WaitSE SEQ_SE_DP_SELECT
	ElevatorAnim VAR_SPECIAL_x8004, 1
_00FE:
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0142
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _011E
	End

_011E:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0180
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _014C

_0142:
	ApplyMovement obj_player, _0180
	WaitMovement
_014C:
	PlaySE SEQ_SE_DP_KAIDAN2
	Return

	.balign 4, 0
_0154:
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0160:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

	.balign 4, 0
_0170:
	FaceSouth
	WalkNormalSouth
	JumpOnSpotSlowSouth 3
	EndMovement

	.balign 4, 0
_0180:
	WalkNormalSouth 2
	WalkOnSpotNormalSouth
	EndMovement

_018C:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0154
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01C5
	ApplyMovement obj_partner_poke, _0160
	WaitMovement
_01C5:
	NPCMsg msg_0539_T11R0703_00001
	CloseMsg
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	Switch VAR_ELEVATOR_LAST_FLOOR
	Case 1, _01F0
	Case 0, _0224
	End

_01F0:
	SetVar VAR_SPECIAL_x8004, 0
	Call _00FE
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFFRON_SILPH_CO_ROTOM_ROOM, 0, 7, 3, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_0224:
	SetVar VAR_SPECIAL_x8004, 1
	Call _00FE
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFFRON_SILPH_CO_HQ, 0, 3, 3, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End
	.balign 4, 0
