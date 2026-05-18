#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0301.h"
#include "msgdata/msg/msg_0259_P01R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0301_000
	ScrDef scr_seq_P01R0301_001
	ScrDef scr_seq_P01R0301_002
	ScrDef scr_seq_P01R0301_003
	ScrDef scr_seq_P01R0301_004
	ScrDef scr_seq_P01R0301_005
	ScrDef scr_seq_P01R0301_006
	ScrDef scr_seq_P01R0301_007
	ScrDef scr_seq_P01R0301_008
	ScrDefEnd

scr_seq_P01R0301_007:
	GoToIfUnset FLAG_BOAT_ARRIVED, _0031
_0031:
	End

scr_seq_P01R0301_006:
	Compare VAR_BOAT_DIRECTION, 1
	GoToIfLe _004F
	Compare VAR_BOAT_DIRECTION, 2
	GoToIfGe _0059
	End

_004F:
	MoveWarp 0, 27, 20
	End

_0059:
	MoveWarp 12, 27, 20
	End

scr_seq_P01R0301_008:
	End

scr_seq_P01R0301_005:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _009C
	ApplyMovement obj_P01R0301_seaman_2_2, _00A4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_UNK_40DC, 1
	ReleaseAll
	End

	.balign 4, 0
_009C:
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_00A4:
	LockDir
	WalkSlowWest
	UnlockDir
	FaceEast 2
	Delay16
	WalkSlowEast
	FaceNorth 2
	EndMovement

scr_seq_P01R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_BOAT_DIRECTION, 1
	GoToIfGt _00E5
	GoTo _00EB

_00DF:
	GoTo _00EB

_00E5:
	GoTo _0138

_00EB:
	GoToIfSet FLAG_BOAT_ARRIVED, _0101
	NPCMsg msg_0259_P01R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0101:
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _012D
	NPCMsg msg_0259_P01R0301_00002
	CloseMsg
	ApplyMovement obj_P01R0301_seaman_2_2, _0180
	WaitMovement
	SetVar VAR_UNK_40CB, 7
	SetVar VAR_TEMP_x4000, 1
	ReleaseAll
	End

_012D:
	NPCMsg msg_0259_P01R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0138:
	GoToIfSet FLAG_BOAT_ARRIVED, _014E
	NPCMsg msg_0259_P01R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014E:
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0174
	NPCMsg msg_0259_P01R0301_00005
	CloseMsg
	ApplyMovement obj_P01R0301_seaman_2_2, _0180
	WaitMovement
	SetVar VAR_TEMP_x4000, 1
	ReleaseAll
	End

_0174:
	NPCMsg msg_0259_P01R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0180:
	LockDir
	WalkNormalSouth
	UnlockDir
	FaceWest 2
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

scr_seq_P01R0301_004:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0280
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 22
	GoToIfNe _01D3
	MovePersonFacing obj_P01R0301_gsgentleman, 31, 0, VAR_TEMP_x4001, DIR_WEST
	GoTo _023C

_01D3:
	Compare VAR_TEMP_x4000, 23
	GoToIfNe _01F2
	MovePersonFacing obj_P01R0301_gsgentleman, 32, 0, VAR_TEMP_x4001, DIR_WEST
	GoTo _023C

_01F2:
	Compare VAR_TEMP_x4000, 24
	GoToIfNe _0211
	MovePersonFacing obj_P01R0301_gsgentleman, 33, 0, VAR_TEMP_x4001, DIR_WEST
	GoTo _023C

_0211:
	Compare VAR_TEMP_x4000, 25
	GoToIfNe _0230
	MovePersonFacing obj_P01R0301_gsgentleman, 34, 0, VAR_TEMP_x4001, DIR_WEST
	GoTo _023C

_0230:
	MovePersonFacing obj_P01R0301_gsgentleman, 35, 0, VAR_TEMP_x4001, DIR_WEST
_023C:
	ApplyMovement obj_P01R0301_gsgentleman, _0288
	ApplyMovement obj_player, _02A0
	WaitMovement
	ApplyMovement obj_P01R0301_gsgentleman, _02B8
	WaitMovement
	NPCMsg msg_0259_P01R0301_00007
	CloseMsg
	ApplyMovement obj_P01R0301_gsgentleman, _02C0
	WaitMovement
	HidePerson obj_P01R0301_gsgentleman
	SetFlag FLAG_UNK_215
	SetVar VAR_UNK_40CB, 2
	StopSE SEQ_SE_GS_N_UMIBE
	ReleaseAll
	End

	.balign 4, 0
_0280:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0288:
	WalkFastWest 9
	LockDir
	JumpNearFastEast
	UnlockDir
	Delay16
	EndMovement

	.balign 4, 0
_02A0:
	Delay2 5
	FaceEast 2
	Delay2 5
	JumpOnSpotFastEast
	Delay16
	EndMovement

	.balign 4, 0
_02B8:
	JumpOnSpotFastWest 4
	EndMovement

	.balign 4, 0
_02C0:
	WalkOnSpotFastWest 2
	FaceNorth 2
	WalkFastNorth
	FaceWest 2
	WalkFastWest 10
	EndMovement

scr_seq_P01R0301_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NopVar490 VAR_UNK_40CB
	Compare VAR_UNK_40CB, 7
	GoToIfLt _02FA
	NPCMsg msg_0259_P01R0301_00009
	GoTo _02FD

_02FA:
	NPCMsg msg_0259_P01R0301_00008
_02FD:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_P01R0301_002:
	SimpleNPCMsg msg_0259_P01R0301_00010
	End

scr_seq_P01R0301_003:
	End
	.balign 4, 0
