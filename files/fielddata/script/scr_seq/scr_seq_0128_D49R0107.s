#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0107.h"
#include "msgdata/msg/msg_0143_D49R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D49R0107_000
	ScrDef scr_seq_D49R0107_001
	ScrDef scr_seq_D49R0107_002
	ScrDef scr_seq_D49R0107_003
	ScrDef scr_seq_D49R0107_004
	ScrDef scr_seq_D49R0107_005
	ScrDef scr_seq_D49R0107_006
	ScrDef scr_seq_D49R0107_007
	ScrDefEnd

scr_seq_D49R0107_007:
	Compare VAR_UNK_40D3, 1
	GoToIfNe _003B
	SetVar VAR_TEMP_x400E, 1
	GoTo _0041

_003B:
	SetVar VAR_TEMP_x400E, 0
_0041:
	End

scr_seq_D49R0107_006:
	Compare VAR_TEMP_x400F, 0
	GoToIfNe _0058
	CreatePokeathlonFriendshipRoomStatues
	SetVar VAR_TEMP_x400F, 1
_0058:
	GetPlayerGender VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _007B
	MovePersonFacing obj_D49R0107_statueheroine, 28, 0, 28, DIR_NORTH
	GoTo _0087

_007B:
	MovePersonFacing obj_D49R0107_statuehero, 28, 0, 28, DIR_NORTH
_0087:
	Compare VAR_TEMP_x400E, 1
	GoToIfNe _00A6
	MovePersonFacing obj_D49R0107_thlonowner, 9, 0, 9, DIR_SOUTH
	SetVar VAR_TEMP_x400E, 0
_00A6:
	End

scr_seq_D49R0107_005:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D49R0107_thlonowner, _015C
	WaitMovement
	NPCMsg msg_0143_D49R0107_00000
	CloseMsg
	ApplyMovement obj_D49R0107_thlonowner, _0164
	WaitMovement
	Wait 15, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	NPCMsg msg_0143_D49R0107_00001
	CloseMsg
	ApplyMovement obj_D49R0107_thlonowner, _016C
	WaitMovement
	NPCMsg msg_0143_D49R0107_00002
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D49R0107_thlonowner, _0174
	ApplyMovement obj_player, _0180
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	NPCMsg msg_0143_D49R0107_00003
	CloseMsg
	ApplyMovement obj_D49R0107_thlonowner, _0188
	WaitMovement
	NPCMsg msg_0143_D49R0107_00004
	CloseMsg
	ApplyMovement obj_D49R0107_thlonowner, _0164
	WaitMovement
	NPCMsg msg_0143_D49R0107_00005
	CloseMsg
	ApplyMovement obj_D49R0107_thlonowner, _0190
	WaitMovement
	ReleaseAll
	SetVar VAR_UNK_40D3, 1
	NatDexFlagAction 2, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	CallIfEq _0154
	End

_0154:
	ClearFlag FLAG_HIDE_POKEATHLON_SUPREME_CUP_RECEPTIONIST
	Return

	.balign 4, 0
_015C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0164:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_016C:
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0174:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0180:
	WalkNormalNorth 3
	EndMovement

	.balign 4, 0
_0188:
	WalkSlowNorth
	EndMovement

	.balign 4, 0
_0190:
	WalkOnSpotNormalWest
	LockDir
	WalkSlowEast 2
	UnlockDir
	EndMovement

scr_seq_D49R0107_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0143_D49R0107_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D49R0107_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0143_D49R0107_00007
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_712 3
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

scr_seq_D49R0107_002:
	SimpleNPCMsg msg_0143_D49R0107_00008
	End

scr_seq_D49R0107_003:
	SimpleNPCMsg msg_0143_D49R0107_00008
	End

scr_seq_D49R0107_004:
	SimpleNPCMsg msg_0143_D49R0107_00008
	End
	.balign 4, 0
