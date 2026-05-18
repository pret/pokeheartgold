#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0502.h"
#include "msgdata/msg/msg_0588_T25R0502.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R0502_000
	ScrDefEnd

scr_seq_T25R0502_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _008C
	WaitMovement
	WaitSE SEQ_SE_DP_KAIDAN2
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_GOLDENROD_MAGNET_TRAIN_STATION_1F, 0, 3, 3, DIR_EAST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	WaitSE SEQ_SE_DP_KAIDAN2
	ScrCmd_606
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0098
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0588_T25R0502_00000
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00A4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

	.balign 4, 0
_008C:
	WalkNormalSouth 3
	WalkNormalWest 8
	EndMovement

	.balign 4, 0
_0098:
	WalkNormalEast 3
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_00A4:
	WalkNormalSouth 2
	EndMovement

_00AC:
	End

	.balign 4, 0
