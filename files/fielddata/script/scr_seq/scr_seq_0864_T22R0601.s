#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0601.h"
#include "msgdata/msg/msg_0562_T22R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22R0601_000
	ScrDef scr_seq_T22R0601_001
	ScrDef scr_seq_T22R0601_002
	ScrDefEnd

scr_seq_T22R0601_000:
	End

scr_seq_T22R0601_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_TRADE_VIOLET_CITY_BELLSPROUT_ONIX, _00BD
	NPCMsg msg_0562_T22R0601_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0041
	GoTo _00B2

_0041:
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _00B2
	LoadNPCTrade 0
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _00A5
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_VIOLET_CITY_BELLSPROUT_ONIX
	NPCMsg msg_0562_T22R0601_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A5:
	NPCTradeEnd
	NPCMsg msg_0562_T22R0601_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B2:
	NPCMsg msg_0562_T22R0601_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BD:
	NPCMsg msg_0562_T22R0601_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T22R0601_002:
	SimpleNPCMsg msg_0562_T22R0601_00000
	End
	.balign 4, 0
