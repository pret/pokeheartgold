#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R10R0201.h"
#include "msgdata/msg/msg_0344_R10R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R10R0201_000
	ScrDef scr_seq_R10R0201_001
	ScrDef scr_seq_R10R0201_002
	ScrDef scr_seq_R10R0201_003
	ScrDef scr_seq_R10R0201_004
	ScrDef scr_seq_R10R0201_005
	ScrDef scr_seq_R10R0201_006
	ScrDef scr_seq_R10R0201_007
	ScrDef scr_seq_R10R0201_008
	ScrDefEnd

scr_seq_R10R0201_000:
	SimpleNPCMsg msg_0344_R10R0201_00003
	End

scr_seq_R10R0201_001:
	SimpleNPCMsg msg_0344_R10R0201_00004
	End

scr_seq_R10R0201_002:
	SimpleNPCMsg msg_0344_R10R0201_00005
	End

scr_seq_R10R0201_003:
	SimpleNPCMsg msg_0344_R10R0201_00006
	End

scr_seq_R10R0201_004:
	SimpleNPCMsg msg_0344_R10R0201_00007
	End

scr_seq_R10R0201_005:
	SimpleNPCMsg msg_0344_R10R0201_00008
	End

scr_seq_R10R0201_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_TRADE_POWER_PLANT_DUGTRIO_MAGNETON, _013F
	NPCMsg msg_0344_R10R0201_00009
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0134
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _0134
	LoadNPCTrade 8
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _0127
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_POWER_PLANT_DUGTRIO_MAGNETON
	NPCMsg msg_0344_R10R0201_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0127:
	NPCTradeEnd
	NPCMsg msg_0344_R10R0201_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0134:
	NPCMsg msg_0344_R10R0201_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013F:
	NPCMsg msg_0344_R10R0201_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R10R0201_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0344_R10R0201_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R10R0201_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0344_R10R0201_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
