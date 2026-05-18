#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R28R0101.h"
#include "msgdata/msg/msg_0372_R28R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R28R0101_000
	ScrDef scr_seq_R28R0101_001
	ScrDef scr_seq_R28R0101_002
	ScrDefEnd

scr_seq_R28R0101_002:
	ApplyMovement obj_R28R0101_gsgirl1, _0020
	WaitMovement
	SetVar VAR_UNK_4126, 1
	End

	.balign 4, 0
_0020:
	FaceSouth
	EmoteExclamationMark
	EndMovement

scr_seq_R28R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TM47_FROM_ROUTE_28_CELEBRITY, _012A
	FacePlayer
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0060
	ApplyMovement obj_R28R0101_gsgirl1, _0140
	GoTo _009E

_0060:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _007B
	ApplyMovement obj_R28R0101_gsgirl1, _014C
	GoTo _009E

_007B:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0096
	ApplyMovement obj_R28R0101_gsgirl1, _0158
	GoTo _009E

_0096:
	ApplyMovement obj_R28R0101_gsgirl1, _0164
_009E:
	WaitMovement
	NPCMsg msg_0372_R28R0101_00000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00BE
	ApplyMovement obj_R28R0101_gsgirl1, _0164
	GoTo _00FC

_00BE:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _00D9
	ApplyMovement obj_R28R0101_gsgirl1, _0158
	GoTo _00FC

_00D9:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _00F4
	ApplyMovement obj_R28R0101_gsgirl1, _014C
	GoTo _00FC

_00F4:
	ApplyMovement obj_R28R0101_gsgirl1, _0140
_00FC:
	WaitMovement
	NPCMsg msg_0372_R28R0101_00001
	GoToIfNoItemSpace ITEM_TM47, 1, _0135
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM47_FROM_ROUTE_28_CELEBRITY
_012A:
	NPCMsg msg_0372_R28R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0135:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0140:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_014C:
	Delay8
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0158:
	Delay8
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0164:
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_R28R0101_001:
	PlayCry SPECIES_FEAROW, 0
	SimpleNPCMsg msg_0372_R28R0101_00003
	WaitCry
	End
	.balign 4, 0
