#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1203.h"
#include "msgdata/msg/msg_0602_T25R1203.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1203_000
	ScrDef scr_seq_T25R1203_001
	ScrDef scr_seq_T25R1203_002
	ScrDef scr_seq_T25R1203_003
	ScrDef scr_seq_T25R1203_004
	ScrDef scr_seq_T25R1203_005
	ScrDef scr_seq_T25R1203_006
	ScrDef scr_seq_T25R1203_007
	ScrDef scr_seq_T25R1203_008
	ScrDef scr_seq_T25R1203_009
	ScrDef scr_seq_T25R1203_010
	ScrDef scr_seq_T25R1203_011
	ScrDefEnd

scr_seq_T25R1203_000:
	SimpleNPCMsg msg_0602_T25R1203_00000
	End

scr_seq_T25R1203_001:
	SimpleNPCMsg msg_0602_T25R1203_00001
	End

scr_seq_T25R1203_002:
	SimpleNPCMsg msg_0602_T25R1203_00002
	End

scr_seq_T25R1203_003:
	SimpleNPCMsg msg_0602_T25R1203_00003
	End

scr_seq_T25R1203_004:
	SimpleNPCMsg msg_0602_T25R1203_00004
	End

scr_seq_T25R1203_005:
	SimpleNPCMsg msg_0602_T25R1203_00005
	End

scr_seq_T25R1203_006:
	SimpleNPCMsg msg_0602_T25R1203_00006
	End

scr_seq_T25R1203_007:
	SimpleNPCMsg msg_0602_T25R1203_00007
	End

scr_seq_T25R1203_008:
	SimpleNPCMsg msg_0602_T25R1203_00008
	End

scr_seq_T25R1203_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0602_T25R1203_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1203_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0602_T25R1203_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1203_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8005, 2
	GoTo _0113
	End

_0113:
	NPCMsg msg_0602_T25R1203_00011
	TouchscreenMenuHide
	MenuInit 21, 11, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 13, 255, 0
	MenuItemAdd 14, 255, 1
	MenuItemAdd 15, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _016A
	Case 1, _018F
	GoTo _0162
	End

_0162:
	TouchscreenMenuShow
_0164:
	CloseMsg
	ReleaseAll
	End

_016A:
	CallStd std_prompt_save
	CopyVar VAR_SPECIAL_RESULT, VAR_TEMP_x4000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0164
	CloseMsg
	ScrCmd_815 0
	CallStd std_enter_global_terminal
	ReleaseAll
	End

_018F:
	NPCMsg msg_0602_T25R1203_00012
	GoTo _0113
	End

	.balign 4, 0
