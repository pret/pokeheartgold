#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08PC0101.h"
#include "msgdata/msg/msg_0515_T08PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T08PC0101_000
	ScrDef scr_seq_T08PC0101_001
	ScrDef scr_seq_T08PC0101_002
	ScrDef scr_seq_T08PC0101_003
	ScrDefEnd

scr_seq_T08PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T08PC0101_001:
	SimpleNPCMsg msg_0515_T08PC0101_00000
	End

scr_seq_T08PC0101_002:
	SimpleNPCMsg msg_0515_T08PC0101_00001
	End

scr_seq_T08PC0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0515_T08PC0101_00002
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _006E
	ApplyMovement obj_T08PC0101_gsgirl1, _009C
	GoTo _0091

_006E:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0089
	ApplyMovement obj_T08PC0101_gsgirl1, _00C0
	GoTo _0091

_0089:
	ApplyMovement obj_T08PC0101_gsgirl1, _00E4
_0091:
	NPCMsg msg_0515_T08PC0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_009C:
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	EndMovement

	.balign 4, 0
_00C0:
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	EndMovement

	.balign 4, 0
_00E4:
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	EndMovement
	.balign 4, 0
