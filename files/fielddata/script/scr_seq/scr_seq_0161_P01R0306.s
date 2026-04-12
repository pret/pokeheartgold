#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0306.h"
#include "msgdata/msg/msg_0262_P01R0306.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0306_000
	ScrDef scr_seq_P01R0306_001
	ScrDef scr_seq_P01R0306_002
	ScrDef scr_seq_P01R0306_003
	ScrDefEnd

scr_seq_P01R0306_001:
	Compare VAR_UNK_40CB, 7
	GoToIfGe _003C
	Compare VAR_UNK_40CB, 4
	GoToIfGt _0036
	SetFlag FLAG_UNK_218
	GoTo _003A

_0036:
	ClearFlag FLAG_UNK_218
_003A:
	End

_003C:
	SetFlag FLAG_UNK_216
	SetFlag FLAG_UNK_218
	End

scr_seq_P01R0306_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40CB, 3
	GoToIfGt _006E
	ApplyMovement obj_P01R0306_gsgentleman, _0090
	WaitMovement
	NPCMsg msg_0262_P01R0306_00001
	GoTo _0087

_006E:
	Compare VAR_UNK_40CB, 4
	GoToIfNe _0084
	NPCMsg msg_0262_P01R0306_00000
	GoTo _0087

_0084:
	NPCMsg msg_0262_P01R0306_00007
_0087:
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0090:
	JumpOnSpotFastSouth 2
	EndMovement

scr_seq_P01R0306_003:
	ScrCmd_609
	LockAll
	ApplyMovement obj_P01R0306_gsbabygirl1_3, _0110
	WaitMovement
	GenderMsgBox msg_0262_P01R0306_00002, msg_0262_P01R0306_00003
	CloseMsg
	ApplyMovement obj_P01R0306_gsgentleman, _0118
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0262_P01R0306_00004, msg_0262_P01R0306_00005
	GoToIfNoItemSpace ITEM_METAL_COAT, 1, _0103
	CallStd std_give_item_verbose
_00E2:
	SetVar VAR_UNK_40CB, 6
	SetFlag FLAG_UNK_22A
	PlaySE SEQ_SE_DP_PINPON
	WaitSE SEQ_SE_DP_PINPON
	SetFlag FLAG_BOAT_ARRIVED
	NPCMsg msg_0262_P01R0306_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0103:
	CallStd std_bag_is_full
	CloseMsg
	GoTo _00E2

	.balign 4, 0
_0110:
	JumpOnSpotFastEast 3
	EndMovement

	.balign 4, 0
_0118:
	WalkSlowSouth
	EndMovement

scr_seq_P01R0306_002:
	SimpleNPCMsg msg_0262_P01R0306_00008
	End
	.balign 4, 0
