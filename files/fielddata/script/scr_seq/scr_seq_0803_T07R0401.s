#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0401.h"
#include "msgdata/msg/msg_0508_T07R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0401_000
	ScrDef scr_seq_T07R0401_001
	ScrDef scr_seq_T07R0401_002
	ScrDef scr_seq_T07R0401_003
	ScrDef scr_seq_T07R0401_004
	ScrDef scr_seq_T07R0401_005
	ScrDef scr_seq_T07R0401_006
	ScrDef scr_seq_T07R0401_007
	ScrDef scr_seq_T07R0401_008
	ScrDef scr_seq_T07R0401_009
	ScrDef scr_seq_T07R0401_010
	ScrDef scr_seq_T07R0401_011
	ScrDef scr_seq_T07R0401_012
	ScrDef scr_seq_T07R0401_013
	ScrDef scr_seq_T07R0401_014
	ScrDef scr_seq_T07R0401_015
	ScrDef scr_seq_T07R0401_016
	ScrDef scr_seq_T07R0401_017
	ScrDef scr_seq_T07R0401_018
	ScrDef scr_seq_T07R0401_019
	ScrDef scr_seq_T07R0401_020
	ScrDef scr_seq_T07R0401_021
	ScrDef scr_seq_T07R0401_022
	ScrDef scr_seq_T07R0401_023
	ScrDefEnd

_0062:
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _009C
	ScriptOverlayCmd 3, 0
	CheckCoinsImmediate VAR_SPECIAL_RESULT, 3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00AB
	ScriptOverlayCmd 3, 1
	SetVar VAR_TEMP_x4001, 0
	Return

_009C:
	NPCMsg msg_0508_T07R0401_00021
	WaitButton
	CloseMsg
	SetVar VAR_TEMP_x4001, 1
	Return

_00AB:
	NPCMsg msg_0508_T07R0401_00022
	WaitButton
	CloseMsg
	ScriptOverlayCmd 3, 1
	SetVar VAR_TEMP_x4001, 1
	Return

scr_seq_T07R0401_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _00F5
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 0, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_00F5:
	ReleaseAll
	End

scr_seq_T07R0401_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0130
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 1, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0130:
	ReleaseAll
	End

scr_seq_T07R0401_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _016B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 2, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_016B:
	ReleaseAll
	End

scr_seq_T07R0401_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _01A6
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 3, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01A6:
	ReleaseAll
	End

scr_seq_T07R0401_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _01E1
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 4, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01E1:
	ReleaseAll
	End

scr_seq_T07R0401_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _021C
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 5, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_021C:
	ReleaseAll
	End

scr_seq_T07R0401_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0257
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 6, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0257:
	ReleaseAll
	End

scr_seq_T07R0401_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0292
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 7, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0292:
	ReleaseAll
	End

scr_seq_T07R0401_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _02CD
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 8, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_02CD:
	ReleaseAll
	End

scr_seq_T07R0401_019:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0308
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 9, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0308:
	ReleaseAll
	End

scr_seq_T07R0401_020:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0343
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 10, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0343:
	ReleaseAll
	End

scr_seq_T07R0401_021:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _037E
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 11, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_037E:
	ReleaseAll
	End

scr_seq_T07R0401_022:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _03BE
	NPCMsg msg_0508_T07R0401_00020
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 12, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_03BE:
	ReleaseAll
	End

scr_seq_T07R0401_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _0062
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _03F9
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 13, 1
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_03F9:
	ReleaseAll
	End

scr_seq_T07R0401_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0508_T07R0401_00000
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0428
	NPCMsg msg_0508_T07R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0428:
	ScriptOverlayCmd 3, 0
	NPCMsg msg_0508_T07R0401_00002
	TouchscreenMenuHide
	ScrCmd_116 0, 20, 2
	ShowMoneyBox 20, 7
_043E:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 127, 255, 0
	MenuItemAdd 128, 255, 1
	MenuItemAdd 129, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _048B
	Case 1, _04D7
	NPCMsg msg_0508_T07R0401_00006
	GoTo _0531
	End

_048B:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 1000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _052E
	CheckGiveCoins VAR_SPECIAL_RESULT, 50
	.short 0 ; Nop
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0523
	SubMoneyImmediate 1000
	GiveCoins 50
	ScrCmd_118 0
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	WaitSE SEQ_SE_DP_REGI
	NPCMsg msg_0508_T07R0401_00003
	GoTo _043E
	End

_04D7:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 10000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _052E
	CheckGiveCoins VAR_SPECIAL_RESULT, 500
	.short 0 ; Nop
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0523
	SubMoneyImmediate 10000
	GiveCoins 500
	ScrCmd_118 0
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	WaitSE SEQ_SE_DP_REGI
	NPCMsg msg_0508_T07R0401_00003
	GoTo _043E
	End

_0523:
	NPCMsg msg_0508_T07R0401_00005
	GoTo _0531
	End

_052E:
	NPCMsg msg_0508_T07R0401_00004
_0531:
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ScrCmd_117
	HideMoneyBox
	ScriptOverlayCmd 3, 1
	ReleaseAll
	End

scr_seq_T07R0401_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScriptOverlayCmd 3, 0
	GoToIfSet FLAG_UNK_17C, _059B
	NPCMsg msg_0508_T07R0401_00011
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05AA
	CheckGiveCoins VAR_SPECIAL_RESULT, 18
	.short 0 ; Nop
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _05B9
	GiveCoins 18
	BufferPlayersName 0
	NPCMsg msg_0508_T07R0401_00012
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_UNK_17C
_059B:
	NPCMsg msg_0508_T07R0401_00013
	WaitButton
	CloseMsg
	ReleaseAll
	ScriptOverlayCmd 3, 1
	End

_05AA:
	NPCMsg msg_0508_T07R0401_00014
	WaitButton
	CloseMsg
	ReleaseAll
	ScriptOverlayCmd 3, 1
	End

_05B9:
	NPCMsg msg_0508_T07R0401_00015
	WaitButton
	CloseMsg
	ReleaseAll
	ScriptOverlayCmd 3, 1
	End

scr_seq_T07R0401_001:
	SimpleNPCMsg msg_0508_T07R0401_00007
	End

scr_seq_T07R0401_002:
	SimpleNPCMsg msg_0508_T07R0401_00008
	End

scr_seq_T07R0401_003:
	SimpleNPCMsg msg_0508_T07R0401_00009
	End

scr_seq_T07R0401_004:
	SimpleNPCMsg msg_0508_T07R0401_00010
	End

scr_seq_T07R0401_006:
	SimpleNPCMsg msg_0508_T07R0401_00016
	End

scr_seq_T07R0401_007:
	SimpleNPCMsg msg_0508_T07R0401_00017
	End

scr_seq_T07R0401_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0508_T07R0401_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0401_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0508_T07R0401_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
