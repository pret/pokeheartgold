#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R32PC0101.h"
#include "msgdata/msg/msg_0381_R32PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R32PC0101_000
	ScrDef scr_seq_R32PC0101_001
	ScrDef scr_seq_R32PC0101_002
	ScrDef scr_seq_R32PC0101_003
	ScrDefEnd

scr_seq_R32PC0101_000:
	SetVar VAR_SPECIAL_x8007, 3
	CallStd std_nurse_joy
	End

scr_seq_R32PC0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_OLD_ROD, _008C
	NPCMsg msg_0381_R32PC0101_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0058
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00A1
	End

_0058:
	GoToIfNoItemSpace ITEM_OLD_ROD, 1, _0097
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_OLD_ROD
	NPCMsg msg_0381_R32PC0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008C:
	NPCMsg msg_0381_R32PC0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0097:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_00A1:
	NPCMsg msg_0381_R32PC0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R32PC0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_LURE_BALL_FROM_ROUTE_32_KURT_FAN, _0121
	NPCMsg msg_0381_R32PC0101_00007
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00E0
	NPCMsg msg_0381_R32PC0101_00008
	GoTo _00E3

_00E0:
	NPCMsg msg_0381_R32PC0101_00009
_00E3:
	GoToIfNoItemSpace ITEM_LURE_BALL, 2, _0117
	CallStd std_give_item_verbose
	NPCMsg msg_0381_R32PC0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_GOT_LURE_BALL_FROM_ROUTE_32_KURT_FAN
	End

_0117:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0121:
	NPCMsg msg_0381_R32PC0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R32PC0101_003:
	SimpleNPCMsg msg_0381_R32PC0101_00006
	End
	.balign 4, 0
