#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0301.h"
#include "msgdata/msg/msg_0608_T26R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26R0301_000
	ScrDefEnd

scr_seq_T26R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_TRADE_OLIVINE_CITY_KRABBY_VOLTORB, _00B3
	NPCMsg msg_0608_T26R0301_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0037
	GoTo _00A8

_0037:
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _00A8
	LoadNPCTrade 2
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _009B
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_OLIVINE_CITY_KRABBY_VOLTORB
	NPCMsg msg_0608_T26R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009B:
	NPCTradeEnd
	NPCMsg msg_0608_T26R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A8:
	NPCMsg msg_0608_T26R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B3:
	NPCMsg msg_0608_T26R0301_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
