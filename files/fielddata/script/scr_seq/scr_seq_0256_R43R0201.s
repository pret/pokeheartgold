#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R43R0201.h"
#include "msgdata/msg/msg_0403_R43R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R43R0201_000
	ScrDef scr_seq_R43R0201_001
	ScrDef scr_seq_R43R0201_002
	ScrDef scr_seq_R43R0201_003
	ScrDefEnd

scr_seq_R43R0201_001:
	StopBGM SEQ_GS_R_7_42
	PlayBGM SEQ_GS_EYE_ROCKET
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0037
	GoTo _0095

_0031:
	GoTo _0066

_0037:
	ApplyMovement obj_R43R0201_rocketm, _0114
	ApplyMovement obj_R43R0201_rocketm_2, _0128
	WaitMovement
	NPCMsg msg_0403_R43R0201_00000
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 1000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _006C
	NPCMsg msg_0403_R43R0201_00001
	CloseMsg

_0066:
	GoTo _0077

_006C:
	NPCMsg msg_0403_R43R0201_00002
	CloseMsg
	GoTo _0077

_0077:
	SubMoneyImmediate 1000
	ApplyMovement obj_R43R0201_rocketm, _0144
	ApplyMovement obj_R43R0201_rocketm_2, _0158
	WaitMovement
	GoTo _00ED

_0095:
	ApplyMovement obj_R43R0201_rocketm, _0164
	ApplyMovement obj_R43R0201_rocketm_2, _0180
	WaitMovement
	NPCMsg msg_0403_R43R0201_00000
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 1000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00CA
	NPCMsg msg_0403_R43R0201_00001
	CloseMsg
	GoTo _00D5

_00CA:
	NPCMsg msg_0403_R43R0201_00002
	CloseMsg
	GoTo _00D5

_00D5:
	SubMoneyImmediate 1000
	ApplyMovement obj_R43R0201_rocketm, _0194
	ApplyMovement obj_R43R0201_rocketm_2, _01A4
	WaitMovement
_00ED:
	StopBGM SEQ_GS_EYE_ROCKET
	PlayBGM SEQ_GS_R_7_42
	SetVar VAR_UNK_410F, 1
	End

scr_seq_R43R0201_002:
	GoToIfSet FLAG_RED_GYARADOS_MEET, _0110
	SetVar VAR_UNK_410F, 0
	End

_0110:
	End

	.balign 4, 0
_0114:
	EmoteExclamationMark
	WalkFasterSouth 3
	WalkFasterEast 2
	FaceSouth
	EndMovement

	.balign 4, 0
_0128:
	Delay8 6
	FaceSouth
	EmoteExclamationMark
	WalkFasterSouth 3
	WalkFasterWest
	FaceSouth
	EndMovement

	.balign 4, 0
_0144:
	Delay4 3
	WalkFasterWest 2
	WalkFasterNorth 3
	FaceSouth
	EndMovement

	.balign 4, 0
_0158:
	WalkFasterEast
	WalkFasterNorth 3
	EndMovement

	.balign 4, 0
_0164:
	Delay8 6
	FaceNorth
	EmoteExclamationMark
	WalkFasterNorth 4
	WalkFasterEast
	FaceNorth
	EndMovement

	.balign 4, 0
_0180:
	EmoteExclamationMark
	WalkFasterNorth 4
	WalkFasterWest 2
	FaceNorth
	EndMovement

	.balign 4, 0
_0194:
	Delay4 3
	WalkFasterWest
	WalkFasterSouth 4
	EndMovement

	.balign 4, 0
_01A4:
	WalkFasterEast 2
	WalkFasterSouth 4
	FaceNorth
	EndMovement

scr_seq_R43R0201_000:
	SimpleNPCMsg msg_0403_R43R0201_00003
	End

scr_seq_R43R0201_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TM36_FROM_ROUTE_43_GUARD, _0208
	NPCMsg msg_0403_R43R0201_00004
	GoToIfNoItemSpace ITEM_TM36, 1, _0213
	CallStd std_obtain_item_verbose
	WaitButton
	SetFlag FLAG_GOT_TM36_FROM_ROUTE_43_GUARD
_0208:
	NPCMsg msg_0403_R43R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0213:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
