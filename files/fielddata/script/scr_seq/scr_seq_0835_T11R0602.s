#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0602.h"
#include "msgdata/msg/msg_0536_T11R0602.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0602_000
	ScrDefEnd

scr_seq_T11R0602_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0088
	WaitMovement
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFFRON_MAGNET_TRAIN_STATION_1F, 0, 3, 3, DIR_EAST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	WaitSE SEQ_SE_DP_KAIDAN2
	ScrCmd_606
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0094
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0536_T11R0602_00000
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00A0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

	.balign 4, 0
_0088:
	WalkNormalSouth 3
	WalkNormalEast 7
	EndMovement

	.balign 4, 0
_0094:
	WalkNormalEast 11
	WalkNormalSouth 4
	EndMovement

	.balign 4, 0
_00A0:
	WalkNormalSouth 2
	EndMovement

_00A8:
	End

	.balign 4, 0
