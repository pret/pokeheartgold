#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0307.h"
#include "msgdata/msg/msg_0263_P01R0307.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0307_000
	ScrDef scr_seq_P01R0307_001
	ScrDef scr_seq_P01R0307_002
	ScrDef scr_seq_P01R0307_003
	ScrDefEnd

scr_seq_P01R0307_002:
	Compare VAR_UNK_40CB, 4
	GoToIfNe _0029
	ClearFlag FLAG_UNK_219
	GoTo _002D

_0029:
	SetFlag FLAG_UNK_219
_002D:
	End

scr_seq_P01R0307_001:
	ScrCmd_609
	LockAll
	SetFlag FLAG_UNK_0ED
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 19
	GoToIfEq _0088
	ApplyMovement obj_P01R0307_seaman_2, _00C4
	ScrCmd_729 VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _006B
	ApplyMovement obj_partner_poke, _0114
_006B:
	ApplyMovement obj_player, _0104
	WaitMovement
	NPCMsg msg_0263_P01R0307_00000
	CloseMsg
	ApplyMovement obj_P01R0307_seaman_2, _00D4
	WaitMovement
	ReleaseAll
	End

_0088:
	ApplyMovement obj_P01R0307_seaman_2, _00E4
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _00A5
	ApplyMovement obj_partner_poke, _0114
_00A5:
	ApplyMovement obj_player, _0104
	WaitMovement
	NPCMsg msg_0263_P01R0307_00000
	CloseMsg
	ApplyMovement obj_P01R0307_seaman_2, _00F4
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_00C4:
	FaceNorth 2
	WalkNormalNorth
	FaceWest 2
	EndMovement

	.balign 4, 0
_00D4:
	FaceSouth 2
	WalkNormalSouth
	FaceWest 2
	EndMovement

	.balign 4, 0
_00E4:
	FaceSouth 2
	WalkNormalSouth
	FaceWest 2
	EndMovement

	.balign 4, 0
_00F4:
	FaceNorth 2
	WalkNormalNorth
	FaceWest 2
	EndMovement

	.balign 4, 0
_0104:
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0114:
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

scr_seq_P01R0307_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40CB, 3
	GoToIfGe _0148
	NPCMsg msg_0263_P01R0307_00001
	WaitButton
	CloseMsg
	SetFlag FLAG_UNK_0ED
	ReleaseAll
	End

_0148:
	NPCMsg msg_0263_P01R0307_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_P01R0307_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ApplyMovement obj_P01R0307_gsbabygirl1, _020C
	WaitMovement
	ScrCmd_729 VAR_TEMP_x4002
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _0180
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
_0180:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01A7
	ApplyMovement obj_player, _0218
	ApplyMovement obj_P01R0307_gsbabygirl1, _0238
	GoTo _01B7

_01A7:
	ApplyMovement obj_player, _0228
	ApplyMovement obj_P01R0307_gsbabygirl1, _0244
_01B7:
	WaitMovement
	Compare VAR_TEMP_x4002, 0
	GoToIfEq _01D0
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
_01D0:
	NPCMsg msg_0263_P01R0307_00006
	CloseMsg
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	SetVar VAR_UNK_40CB, 5
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SS_AQUA_1F_NORTHWEST_ROOMS, 0, 9, 10, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_020C:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0218:
	LockDir
	WalkSlowNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_0228:
	LockDir
	WalkSlowEast 2
	UnlockDir
	EndMovement

	.balign 4, 0
_0238:
	FaceNorth 2
	WalkSlowNorth
	EndMovement

	.balign 4, 0
_0244:
	FaceEast 2
	WalkSlowEast 2
	EndMovement
	.balign 4, 0
