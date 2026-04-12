#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16R0101.h"
#include "msgdata/msg/msg_0355_R16R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R16R0101_000
	ScrDef scr_seq_R16R0101_001
	ScrDefEnd

scr_seq_R16R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_ABA, _0068
	ScrCmd_540 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _007E
	NPCMsg msg_0355_R16R0101_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0073
	ScrCmd_538 VAR_SPECIAL_RESULT, 0
	Compare VAR_SPECIAL_RESULT, 65535
	GoToIfEq _007E
	SetFlag FLAG_UNK_ABA
	NPCMsg msg_0355_R16R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0068:
	NPCMsg msg_0355_R16R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0073:
	NPCMsg msg_0355_R16R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_007E:
	NPCMsg msg_0355_R16R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R16R0101_000:
	SimpleNPCMsg msg_0355_R16R0101_00000
	End
	.balign 4, 0
