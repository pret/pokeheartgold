#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1202.h"
#include "msgdata/msg/msg_0601_T25R1202.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1202_000
	ScrDef scr_seq_T25R1202_001
	ScrDef scr_seq_T25R1202_002
	ScrDef scr_seq_T25R1202_003
	ScrDef scr_seq_T25R1202_004
	ScrDef scr_seq_T25R1202_005
	ScrDef scr_seq_T25R1202_006
	ScrDef scr_seq_T25R1202_007
	ScrDef scr_seq_T25R1202_008
	ScrDef scr_seq_T25R1202_009
	ScrDef scr_seq_T25R1202_010
	ScrDef scr_seq_T25R1202_011
	ScrDef scr_seq_T25R1202_012
	ScrDefEnd

scr_seq_T25R1202_000:
	SimpleNPCMsg msg_0601_T25R1202_00000
	End

scr_seq_T25R1202_001:
	SimpleNPCMsg msg_0601_T25R1202_00001
	End

scr_seq_T25R1202_002:
	SimpleNPCMsg msg_0601_T25R1202_00002
	End

scr_seq_T25R1202_003:
	SimpleNPCMsg msg_0601_T25R1202_00003
	End

scr_seq_T25R1202_004:
	SimpleNPCMsg msg_0601_T25R1202_00004
	End

scr_seq_T25R1202_005:
	SimpleNPCMsg msg_0601_T25R1202_00005
	End

scr_seq_T25R1202_006:
	SimpleNPCMsg msg_0601_T25R1202_00006
	End

scr_seq_T25R1202_007:
	SimpleNPCMsg msg_0601_T25R1202_00007
	End

scr_seq_T25R1202_008:
	SimpleNPCMsg msg_0601_T25R1202_00008
	End

scr_seq_T25R1202_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0601_T25R1202_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1202_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0601_T25R1202_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1202_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8005, 6
	GoTo _0117
	End

_0117:
	NPCMsg msg_0601_T25R1202_00013
	TouchscreenMenuHide
	MenuInit 21, 11, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 15, 255, 0
	MenuItemAdd 16, 255, 1
	MenuItemAdd 17, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _016E
	Case 1, _0193
	GoTo _0166
	End

_0166:
	TouchscreenMenuShow
_0168:
	CloseMsg
	ReleaseAll
	End

_016E:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0168
	CloseMsg
	ScrCmd_815 0
	CallStd std_enter_global_terminal
	ReleaseAll
	End

_0193:
	NPCMsg msg_0601_T25R1202_00014
	GoTo _0117
	End

scr_seq_T25R1202_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8005, 5
	GoTo _01B2
	End

_01B2:
	NPCMsg msg_0601_T25R1202_00011
	TouchscreenMenuHide
	MenuInit 21, 11, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 15, 255, 0
	MenuItemAdd 16, 255, 1
	MenuItemAdd 17, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0209
	Case 1, _022E
	GoTo _0201
	End

_0201:
	TouchscreenMenuShow
_0203:
	CloseMsg
	ReleaseAll
	End

_0209:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0203
	CloseMsg
	ScrCmd_815 0
	CallStd std_enter_global_terminal
	ReleaseAll
	End

_022E:
	NPCMsg msg_0601_T25R1202_00012
	GoTo _01B2
	End

	.balign 4, 0
