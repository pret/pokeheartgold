#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0301.h"
#include "msgdata/msg/msg_0323_R02R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R02R0301_000
	ScrDef scr_seq_R02R0301_001
	ScrDefEnd

scr_seq_R02R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_SACRED_ASH_FROM_ROUTE_2_LAB_AIDE, _004D
	BufferPlayersName 0
	GenderMsgBox msg_0323_R02R0301_00000, msg_0323_R02R0301_00001
	GoToIfNoItemSpace ITEM_SACRED_ASH, 1, _0058
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_SACRED_ASH_FROM_ROUTE_2_LAB_AIDE
_004D:
	NPCMsg msg_0323_R02R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0058:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_R02R0301_001:
	SimpleNPCMsg msg_0323_R02R0301_00003
	End
	.balign 4, 0
