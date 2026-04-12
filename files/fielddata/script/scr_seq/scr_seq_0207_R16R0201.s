#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16R0201.h"
#include "msgdata/msg/msg_0356_R16R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R16R0201_000
	ScrDef scr_seq_R16R0201_001
	ScrDef scr_seq_R16R0201_002
	ScrDef scr_seq_R16R0201_003
	ScrDefEnd

scr_seq_R16R0201_003:
	GoToIfSet FLAG_UNK_149, _001F
	End

_001F:
	SetBikeStateLock 1
	End

scr_seq_R16R0201_001:
	ScrCmd_609
	LockAll
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _006A
	ApplyMovement obj_player, _0084
	WaitMovement
	NPCMsg msg_0356_R16R0201_00001
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _008C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ReleaseAll
	End

_006A:
	SetBikeStateLock 1
	SetVar VAR_UNK_4129, 1
	SetVar VAR_UNK_412A, 1
	SetFlag FLAG_UNK_149
	ReleaseAll
	End

	.balign 4, 0
_0084:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_008C:
	WalkNormalEast
	EndMovement

scr_seq_R16R0201_002:
	SetBikeStateLock 0
	SetVar VAR_UNK_4129, 0
	SetVar VAR_UNK_412A, 0
	ClearFlag FLAG_UNK_149
	End

scr_seq_R16R0201_000:
	SimpleNPCMsg msg_0356_R16R0201_00000
	End
	.balign 4, 0
