#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30R0301.h"
#include "msgdata/msg/msg_0634_T30R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T30R0301_000
	ScrDef scr_seq_T30R0301_001
	ScrDefEnd

scr_seq_T30R0301_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_TRADE_BLACKTHORN_CITY_DRAGONAIR_DODRIO, _00CA
	NPCMsg msg_0634_T30R0301_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _003B
	GoTo _00BF

_003B:
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_566
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _00BF
	LoadNPCTrade 3
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	MonGetGender VAR_SPECIAL_x8004, VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 0
	GoToIfEq _00B2
	NPCTradeGetReqSpecies VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GoToIfNe _00B2
	NPCTradeExec VAR_SPECIAL_x8004
	NPCTradeEnd
	SetFlag FLAG_TRADE_BLACKTHORN_CITY_DRAGONAIR_DODRIO
	NPCMsg msg_0634_T30R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B2:
	NPCTradeEnd
	NPCMsg msg_0634_T30R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BF:
	NPCMsg msg_0634_T30R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CA:
	NPCMsg msg_0634_T30R0301_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30R0301_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8000
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000, RIBBON_HOENN_EFFORT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0199
	BufferMonSpeciesName 0, VAR_SPECIAL_x8000
	NPCMsg msg_0634_T30R0301_00005
	GetEVTotal VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_RESULT, 510
	GoToIfLt _0136
	NPCMsg msg_0634_T30R0301_00006
	GiveRibbon VAR_SPECIAL_x8000, RIBBON_HOENN_EFFORT
	PlayFanfare SEQ_ME_ITEM
	BufferPlayersName 1
	NPCMsg msg_0634_T30R0301_00007
	WaitFanfare
	BufferMonSpeciesName 0, VAR_SPECIAL_x8000
	NPCMsg msg_0634_T30R0301_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0136:
	Compare VAR_SPECIAL_RESULT, 506
	GoToIfNe _014C
	NPCMsg msg_0634_T30R0301_00010
	GoTo _0191

_014C:
	Compare VAR_SPECIAL_RESULT, 507
	GoToIfNe _0162
	NPCMsg msg_0634_T30R0301_00011
	GoTo _0191

_0162:
	Compare VAR_SPECIAL_RESULT, 508
	GoToIfNe _0178
	NPCMsg msg_0634_T30R0301_00012
	GoTo _0191

_0178:
	Compare VAR_SPECIAL_RESULT, 509
	GoToIfNe _018E
	NPCMsg msg_0634_T30R0301_00013
	GoTo _0191

_018E:
	NPCMsg msg_0634_T30R0301_00009
_0191:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0199:
	BufferMonSpeciesName 0, VAR_SPECIAL_x8000
	NPCMsg msg_0634_T30R0301_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
