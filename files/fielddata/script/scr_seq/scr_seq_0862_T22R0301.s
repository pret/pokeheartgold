#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0301.h"
#include "msgdata/msg/msg_0560_T22R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22R0301_000
	ScrDef scr_seq_T22R0301_001
	ScrDef scr_seq_T22R0301_002
	ScrDef scr_seq_T22R0301_003
	ScrDef scr_seq_T22R0301_004
	ScrDef scr_seq_T22R0301_005
	ScrDef scr_seq_T22R0301_006
	ScrDef scr_seq_T22R0301_007
	ScrDefEnd

scr_seq_T22R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0049
	ApplyMovement obj_T22R0301_gsbigman, _0164
	GoTo _0087

_0049:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0064
	ApplyMovement obj_T22R0301_gsbigman, _0188
	GoTo _0087

_0064:
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _007F
	ApplyMovement obj_T22R0301_gsbigman, _01AC
	GoTo _0087

_007F:
	ApplyMovement obj_T22R0301_gsbigman, _01D0
_0087:
	WaitMovement
	NPCMsg msg_0560_T22R0301_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00B0
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00D7
	End

_00B0:
	NPCMsg msg_0560_T22R0301_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00D7
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0157
	End

_00D7:
	NPCMsg msg_0560_T22R0301_00002
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00FE
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0125
	End

_00FE:
	NPCMsg msg_0560_T22R0301_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0125
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0157
	End

_0125:
	NPCMsg msg_0560_T22R0301_00004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _014C
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0157
	End

_014C:
	NPCMsg msg_0560_T22R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0157:
	NPCMsg msg_0560_T22R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0164:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_0188:
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	EndMovement

	.balign 4, 0
_01AC:
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	EndMovement

	.balign 4, 0
_01D0:
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	EndMovement

scr_seq_T22R0301_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0560_T22R0301_00012
	GoTo _0207
	End

_0207:
	NPCMsg msg_0560_T22R0301_00013
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 24, 255, 1
	MenuItemAdd 25, 255, 2
	MenuItemAdd 26, 255, 3
	MenuItemAdd 27, 255, 4
	MenuItemAdd 28, 255, 5
	MenuItemAdd 29, 255, 0
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0264
	NPCMsg msg_0560_T22R0301_00014
	GoTo _0207

_025E:
	GoTo _02D8

_0264:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0280
	NPCMsg msg_0560_T22R0301_00015
	GoTo _0207

_027A:
	GoTo _02D8

_0280:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _029C
	NPCMsg msg_0560_T22R0301_00016
	GoTo _0207

_0296:
	GoTo _02D8

_029C:
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfNe _02B8
	NPCMsg msg_0560_T22R0301_00017
	GoTo _0207

_02B2:
	GoTo _02D8

_02B8:
	Compare VAR_SPECIAL_RESULT, 5
	GoToIfNe _02D4
	NPCMsg msg_0560_T22R0301_00018
	GoTo _0207

_02CE:
	GoTo _02D8

_02D4:
	CloseMsg
	ReleaseAll

_02D8:
	End

scr_seq_T22R0301_003:
	SimpleNPCMsg msg_0560_T22R0301_00011
	End

scr_seq_T22R0301_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0560_T22R0301_00019
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0353
	NPCMsg msg_0560_T22R0301_00020
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0353
	NPCMsg msg_0560_T22R0301_00021
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0353
	NPCMsg msg_0560_T22R0301_00022
	CloseMsg
	TouchscreenMenuShow
	ApplyMovement obj_T22R0301_gsboy1, _035C
	WaitMovement
	NPCMsg msg_0560_T22R0301_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0353:
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

	.balign 4, 0
_035C:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_T22R0301_004:
	SimpleNPCMsg msg_0560_T22R0301_00007
	End

scr_seq_T22R0301_005:
	SimpleNPCMsg msg_0560_T22R0301_00010
	End

scr_seq_T22R0301_006:
	SimpleNPCMsg msg_0560_T22R0301_00009
	End

scr_seq_T22R0301_007:
	SimpleNPCMsg msg_0560_T22R0301_00008
	End
	.balign 4, 0
