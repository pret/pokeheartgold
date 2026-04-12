#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03PC0101.h"
#include "msgdata/msg/msg_0463_T03PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T03PC0101_000
	ScrDef scr_seq_T03PC0101_001
	ScrDef scr_seq_T03PC0101_002
	ScrDef scr_seq_T03PC0101_003
	ScrDef scr_seq_T03PC0101_004
	ScrDefEnd

scr_seq_T03PC0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T03PC0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_TRADE_PEWTER_CITY_HAUNTER_XATU, _00C9
	NPCMsg msg_0463_T03PC0101_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00BE
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _00BE
	LoadNPCTrade 9
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _00B1
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_PEWTER_CITY_HAUNTER_XATU
	NPCMsg msg_0463_T03PC0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B1:
	NPCTradeEnd
	NPCMsg msg_0463_T03PC0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BE:
	NPCMsg msg_0463_T03PC0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C9:
	NPCMsg msg_0463_T03PC0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03PC0101_002:
	SimpleNPCMsg msg_0463_T03PC0101_00000
	End

scr_seq_T03PC0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_JIGGLYPUFF, 0
	NPCMsg msg_0463_T03PC0101_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03PC0101_004:
	SimpleNPCMsg msg_0463_T03PC0101_00002
	End
	.balign 4, 0
