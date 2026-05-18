#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0106.h"
#include "msgdata/msg/msg_0499_T07R0106.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0106_000
	ScrDef scr_seq_T07R0106_001
	ScrDef scr_seq_T07R0106_002
	ScrDef scr_seq_T07R0106_003
	ScrDefEnd

scr_seq_T07R0106_000:
	SimpleNPCMsg msg_0499_T07R0106_00000
	End

scr_seq_T07R0106_001:
	SimpleNPCMsg msg_0499_T07R0106_00001
	End

scr_seq_T07R0106_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0499_T07R0106_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0106_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0499_T07R0106_00003
	ShowMoneyBox 20, 2
	GoTo _005E

_005E:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	MenuItemAdd 209, 255, 0
	MenuItemAdd 210, 255, 1
	MenuItemAdd 211, 255, 2
	MenuItemAdd 212, 255, 3
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_x8000
	Case 0, _00C2
	Case 1, _00CE
	Case 2, _00DA
	NPCMsg msg_0499_T07R0106_00007
	GoTo _0205

_00C2:
	SetVar VAR_SPECIAL_x8001, 30
	GoTo _011C

_00CE:
	SetVar VAR_SPECIAL_x8001, 31
	GoTo _011C

_00DA:
	SetVar VAR_SPECIAL_x8001, 32
	GoTo _011C

_00E6:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 200
	Return

_00F0:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 300
	Return

_00FA:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 350
	Return

_0104:
	SubMoneyImmediate 200
	Return

_010C:
	SubMoneyImmediate 300
	Return

_0114:
	SubMoneyImmediate 350
	Return

_011C:
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _00E6
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _00F0
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _00FA
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01F0
	HasSpaceForItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01F9
	Compare VAR_SPECIAL_x8000, 0
	CallIfEq _0104
	Compare VAR_SPECIAL_x8000, 1
	CallIfEq _010C
	Compare VAR_SPECIAL_x8000, 2
	CallIfEq _0114
	UpdateMoneyBox
	BufferItemName 0, VAR_SPECIAL_x8001
	PlaySE SEQ_SE_DP_JIHANKI
	BufferItemName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0499_T07R0106_00004
	GiveItemNoCheck VAR_SPECIAL_x8001, 1
	Random VAR_SPECIAL_RESULT, 64
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01E7
	PlaySE SEQ_SE_DP_JIHANKI
	BufferItemName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0499_T07R0106_00005
	HasSpaceForItem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01F9
	CallStd std_give_item_verbose
_01E7:
	NPCMsg msg_0499_T07R0106_00003
	GoTo _005E

_01F0:
	NPCMsg msg_0499_T07R0106_00006
	GoTo _0205

_01F9:
	CallStd std_bag_is_full
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0205:
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End
	.balign 4, 0
