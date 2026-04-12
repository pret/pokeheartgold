#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0101.h"
#include "msgdata/msg/msg_0145_D51R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D51R0101_000
	ScrDef scr_seq_D51R0101_001
	ScrDef scr_seq_D51R0101_002
	ScrDef scr_seq_D51R0101_003
	ScrDefEnd

scr_seq_D51R0101_002:
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 5
	GoToIfEq _0021
	End

_0021:
	MovePersonFacing obj_D51R0101_mount_2, 13, 1, 28, DIR_NORTH
	End

scr_seq_D51R0101_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D51R0101_mount_2, _007C
	WaitMovement
	ApplyMovement obj_player, _0094
	WaitMovement
	NPCMsg msg_0145_D51R0101_00000
	CloseMsg
	ApplyMovement obj_D51R0101_mount_2, _009C
	WaitMovement
	NPCMsg msg_0145_D51R0101_00001
	CloseMsg
	ApplyMovement obj_D51R0101_mount_2, _00A8
	WaitMovement
	MovePersonFacing obj_D51R0101_mount_2, 13, 1, 28, DIR_NORTH
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 5
	ReleaseAll
	End

	.balign 4, 0
_007C:
	WalkOnSpotNormalNorth
	EmoteExclamationMark
	Delay8
	WalkNormalNorth 3
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0094:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_009C:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_00A8:
	WalkNormalSouth 4
	WalkNormalWest
	WalkNormalSouth 4
	EndMovement

scr_seq_D51R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0145_D51R0101_00002
	CloseMsg
	ApplyMovement obj_D51R0101_mount_2, _0108
	WaitMovement
	ScrCmd_307 0, 0, 20, 25, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_D51R0101_mount_2, _0114
	WaitMovement
	HidePerson obj_D51R0101_mount_2
	SetFlag FLAG_UNK_2DB
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 6
	ReleaseAll
	End

	.balign 4, 0
_0108:
	WalkNormalEast 7
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0114:
	WalkNormalNorth
	EndMovement

scr_seq_D51R0101_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0145_D51R0101_00007, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
