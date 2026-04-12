#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1101.h"
#include "msgdata/msg/msg_0599_T25R1101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T25R1101_000
	ScrDef scr_seq_T25R1101_001
	ScrDef scr_seq_T25R1101_002
	ScrDef scr_seq_T25R1101_003
	ScrDef scr_seq_T25R1101_004
	ScrDef scr_seq_T25R1101_005
	ScrDef scr_seq_T25R1101_006
	ScrDef scr_seq_T25R1101_007
	ScrDef scr_seq_T25R1101_008
	ScrDef scr_seq_T25R1101_009
	ScrDef scr_seq_T25R1101_010
	ScrDef scr_seq_T25R1101_011
	ScrDef scr_seq_T25R1101_012
	ScrDef scr_seq_T25R1101_013
	ScrDef scr_seq_T25R1101_014
	ScrDef scr_seq_T25R1101_015
	ScrDef scr_seq_T25R1101_016
	ScrDef scr_seq_T25R1101_017
	ScrDef scr_seq_T25R1101_018
	ScrDef scr_seq_T25R1101_019
	ScrDef scr_seq_T25R1101_020
	ScrDef scr_seq_T25R1101_021
	ScrDef scr_seq_T25R1101_022
	ScrDef scr_seq_T25R1101_023
	ScrDef scr_seq_T25R1101_024
	ScrDef scr_seq_T25R1101_025
	ScrDef scr_seq_T25R1101_026
	ScrDef scr_seq_T25R1101_027
	ScrDef scr_seq_T25R1101_028
	ScrDef scr_seq_T25R1101_029
	ScrDef scr_seq_T25R1101_030
	ScrDef scr_seq_T25R1101_031
	ScrDef scr_seq_T25R1101_032
	ScrDefEnd

scr_seq_T25R1101_032:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00A3
	GoTo _00AB

_009D:
	GoTo _00A9

_00A3:
	GoTo _00FC

_00A9:
	End

_00AB:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _00C6
	SetFlag FLAG_UNK_2DA
	GoTo _00FA

_00C6:
	Compare VAR_TEMP_x4000, 8
	GoToIfNe _00DD
	SetFlag FLAG_UNK_2DA
	GoTo _00FA

_00DD:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _00F4
	SetFlag FLAG_UNK_2DA
	GoTo _00FA

_00F4:
	GoTo _00FC

_00FA:
	End

_00FC:
	ClearFlag FLAG_UNK_2DA
	End

scr_seq_T25R1101_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0139
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 0, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0139:
	ReleaseAll
	End

_013D:
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0177
	ScriptOverlayCmd 3, 0
	CheckCoinsImmediate VAR_SPECIAL_RESULT, 3
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0186
	ScriptOverlayCmd 3, 1
	SetVar VAR_TEMP_x4001, 0
	Return

_0177:
	NPCMsg msg_0599_T25R1101_00025
	WaitButton
	CloseMsg
	SetVar VAR_TEMP_x4001, 1
	Return

_0186:
	NPCMsg msg_0599_T25R1101_00026
	WaitButton
	CloseMsg
	ScriptOverlayCmd 3, 1
	SetVar VAR_TEMP_x4001, 1
	Return

scr_seq_T25R1101_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _01D0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 1, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01D0:
	ReleaseAll
	End

scr_seq_T25R1101_012:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _020B
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 2, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_020B:
	ReleaseAll
	End

scr_seq_T25R1101_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0246
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 3, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0246:
	ReleaseAll
	End

scr_seq_T25R1101_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0281
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 4, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0281:
	ReleaseAll
	End

scr_seq_T25R1101_015:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _02BC
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 5, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_02BC:
	ReleaseAll
	End

scr_seq_T25R1101_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _02F7
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 6, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_02F7:
	ReleaseAll
	End

scr_seq_T25R1101_017:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0332
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 7, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0332:
	ReleaseAll
	End

scr_seq_T25R1101_018:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _036D
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 8, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_036D:
	ReleaseAll
	End

scr_seq_T25R1101_019:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _03A8
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 9, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_03A8:
	ReleaseAll
	End

scr_seq_T25R1101_020:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _03E3
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 10, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_03E3:
	ReleaseAll
	End

scr_seq_T25R1101_021:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _041E
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 11, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_041E:
	ReleaseAll
	End

scr_seq_T25R1101_022:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0459
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 21, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0459:
	ReleaseAll
	End

scr_seq_T25R1101_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0494
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 12, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0494:
	ReleaseAll
	End

scr_seq_T25R1101_024:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _04CF
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 13, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_04CF:
	ReleaseAll
	End

scr_seq_T25R1101_025:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _050A
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 14, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_050A:
	ReleaseAll
	End

scr_seq_T25R1101_026:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0545
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 15, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0545:
	ReleaseAll
	End

scr_seq_T25R1101_027:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0580
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 16, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0580:
	ReleaseAll
	End

scr_seq_T25R1101_028:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _05BB
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 17, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_05BB:
	ReleaseAll
	End

scr_seq_T25R1101_029:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _05F6
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 18, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_05F6:
	ReleaseAll
	End

scr_seq_T25R1101_030:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _0631
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 19, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0631:
	ReleaseAll
	End

scr_seq_T25R1101_031:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	Call _013D
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _066C
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CasinoGame 20, 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_066C:
	ReleaseAll
	End

scr_seq_T25R1101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0599_T25R1101_00000
	HasItem ITEM_COIN_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _069B
	NPCMsg msg_0599_T25R1101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_069B:
	ScriptOverlayCmd 3, 0
	NPCMsg msg_0599_T25R1101_00002
	TouchscreenMenuHide
	ScrCmd_116 0, 20, 2
	ShowMoneyBox 20, 7
_06B1:
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 127, 255, 0
	MenuItemAdd 128, 255, 1
	MenuItemAdd 129, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _06FE
	Case 1, _074A
	NPCMsg msg_0599_T25R1101_00006
	GoTo _07A4
	End

_06FE:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 1000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _07A1
	CheckGiveCoins VAR_SPECIAL_RESULT, 50
	.short 0 ; Nop
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0796
	SubMoneyImmediate 1000
	GiveCoins 50
	ScrCmd_118 0
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	WaitSE SEQ_SE_DP_REGI
	NPCMsg msg_0599_T25R1101_00003
	GoTo _06B1
	End

_074A:
	HasEnoughMoneyImmediate VAR_SPECIAL_RESULT, 10000
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _07A1
	CheckGiveCoins VAR_SPECIAL_RESULT, 500
	.short 0 ; Nop
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0796
	SubMoneyImmediate 10000
	GiveCoins 500
	ScrCmd_118 0
	UpdateMoneyBox
	PlaySE SEQ_SE_DP_REGI
	WaitSE SEQ_SE_DP_REGI
	NPCMsg msg_0599_T25R1101_00003
	GoTo _06B1
	End

_0796:
	NPCMsg msg_0599_T25R1101_00005
	GoTo _07A4
	End

_07A1:
	NPCMsg msg_0599_T25R1101_00004
_07A4:
	WaitButton
	CloseMsg
	TouchscreenMenuShow
	ScrCmd_117
	HideMoneyBox
	ScriptOverlayCmd 3, 1
	ReleaseAll
	End

scr_seq_T25R1101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScriptOverlayCmd 3, 0
	NPCMsg msg_0599_T25R1101_00007
	TouchscreenMenuHide
	ScrCmd_116 0, 20, 2
_07CE:
	MenuInit 1, 1, 0, 1, VAR_TEMP_x4000
	MenuItemAdd 37, 255, 0
	MenuItemAdd 38, 255, 1
	MenuItemAdd 36, 255, 2
	MenuExec
	Switch VAR_TEMP_x4000
	Case 0, _0816
	Case 1, _08B2
	GoTo _11F9

_0816:
	MenuInit 1, 1, 0, 1, VAR_TEMP_x4000
	MenuItemAdd 39, 255, 0
	MenuItemAdd 40, 255, 1
	MenuItemAdd 41, 255, 2
	MenuItemAdd 42, 255, 3
	MenuItemAdd 43, 255, 4
	MenuItemAdd 44, 255, 5
	MenuItemAdd 36, 255, 6
	MenuExec
	Switch VAR_TEMP_x4000
	Case 0, _0924
	Case 1, _09AF
	Case 2, _0A3A
	Case 3, _0AC5
	Case 4, _0B50
	Case 5, _0BDB
	GoTo _07CE

_08B2:
	MenuInit 1, 1, 0, 1, VAR_TEMP_x4000
	MenuItemAdd 45, 255, 0
	MenuItemAdd 46, 255, 1
	MenuItemAdd 47, 255, 2
	MenuItemAdd 48, 255, 3
	MenuItemAdd 36, 255, 4
	MenuExec
	Switch VAR_TEMP_x4000
	Case 0, _0C66
	Case 1, _0CF1
	Case 2, _0D7C
	Case 3, _0E07
	GoTo _07CE

_0924:
	GoToIfNoItemSpace ITEM_TM90, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _096D
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0816
_096D:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 2000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 2000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _0816
	End

_09AF:
	GoToIfNoItemSpace ITEM_TM75, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _09F8
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0816
_09F8:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 4000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 4000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _0816
	End

_0A3A:
	GoToIfNoItemSpace ITEM_TM44, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0A83
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0816
_0A83:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 6000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 6000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _0816
	End

_0AC5:
	GoToIfNoItemSpace ITEM_TM35, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0B0E
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0816
_0B0E:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 10000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 10000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _0816
	End

_0B50:
	GoToIfNoItemSpace ITEM_TM13, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0B99
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0816
_0B99:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 10000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 10000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _0816
	End

_0BDB:
	GoToIfNoItemSpace ITEM_TM24, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0C24
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0816
_0C24:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 10000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 10000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _0816
	End

_0C66:
	GoToIfNoItemSpace ITEM_SILK_SCARF, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0CAF
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _08B2
_0CAF:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 1000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 1000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _08B2
	End

_0CF1:
	GoToIfNoItemSpace ITEM_WIDE_LENS, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0D3A
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _08B2
_0D3A:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 1000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 1000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _08B2
	End

_0D7C:
	GoToIfNoItemSpace ITEM_ZOOM_LENS, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0DC5
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _08B2
_0DC5:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 1000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 1000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _08B2
	End

_0E07:
	GoToIfNoItemSpace ITEM_METRONOME, 1, _1127
	BufferItemName 0, VAR_SPECIAL_x8004
	NPCMsg msg_0599_T25R1101_00010
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0E50
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _08B2
_0E50:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 1000
	GoToIfLt _11C8
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	TakeCoins 1000
	ScrCmd_118 0
	BufferItemName 0, VAR_SPECIAL_x8004
	GetItemPocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	BufferPocketName 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0599_T25R1101_00017
	GiveItem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	GoTo _08B2
	End

scr_seq_T25R1101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScriptOverlayCmd 3, 0
	NPCMsg msg_0599_T25R1101_00016
	TouchscreenMenuHide
	ScrCmd_116 0, 20, 2
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _0EC7
	GoTo _0ECD

_0EC1:
	GoTo _0ECD

_0EC7:
	GoTo _0F2A

_0ECD:
	MenuInit 1, 1, 0, 1, VAR_TEMP_x4000
	MenuItemAdd 49, 255, 0
	MenuItemAdd 50, 255, 1
	MenuItemAdd 51, 255, 2
	MenuItemAdd 36, 255, 3
	MenuExec
	Switch VAR_TEMP_x4000
	Case 0, _0F87
	Case 1, _0F93
	Case 2, _0F9F
	GoTo _11F9

_0F2A:
	MenuInit 1, 1, 0, 1, VAR_TEMP_x4000
	MenuItemAdd 49, 255, 0
	MenuItemAdd 52, 255, 1
	MenuItemAdd 51, 255, 2
	MenuItemAdd 36, 255, 3
	MenuExec
	Switch VAR_TEMP_x4000
	Case 0, _0F87
	Case 1, _0FAB
	Case 2, _0F9F
	GoTo _11F9

_0F87:
	SetOrCopyVar VAR_TEMP_x4002, 63
	GoTo _0FB7

_0F93:
	SetOrCopyVar VAR_TEMP_x4002, 23
	GoTo _0FB7

_0F9F:
	SetOrCopyVar VAR_TEMP_x4002, 147
	GoTo _0FB7

_0FAB:
	SetOrCopyVar VAR_TEMP_x4002, 27
	GoTo _0FB7

_0FB7:
	GetPartyCount VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 6
	GoToIfNe _0FD5
	NPCMsg msg_0599_T25R1101_00013
	WaitButton
	CloseMsg
	GoTo _1208

_0FD5:
	BufferSpeciesName 1, VAR_TEMP_x4002, 0, 0
	NPCMsg msg_0599_T25R1101_00014
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _1016
	CloseMsg
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _1010
	GoTo _0ECD

_100A:
	GoTo _1016

_1010:
	GoTo _0F2A

_1016:
	Compare VAR_TEMP_x4002, 63
	GoToIfNe _103A
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 200
	GoToIfLt _11D3
	GoTo _1093

_103A:
	Compare VAR_TEMP_x4002, 23
	GoToIfNe _105E
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 700
	GoToIfLt _11D3
	GoTo _1093

_105E:
	Compare VAR_TEMP_x4002, 27
	GoToIfNe _1082
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 700
	GoToIfLt _11D3
	GoTo _1093

_1082:
	GetCoinAmount VAR_SPECIAL_x8006
	Compare VAR_SPECIAL_x8006, 2100
	GoToIfLt _11D3
_1093:
	NPCMsg msg_0599_T25R1101_00011
	PlaySE SEQ_SE_DP_REGI
	GiveMon VAR_TEMP_x4002, 15, 0, 0, 0, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	BufferSpeciesName 1, VAR_TEMP_x4002, 0, 0
	NPCMsg msg_0599_T25R1101_00015
	Compare VAR_TEMP_x4002, 63
	GoToIfNe _10CD
	TakeCoins 200
	GoTo _10FF

_10CD:
	Compare VAR_TEMP_x4002, 23
	GoToIfNe _10E4
	TakeCoins 700
	GoTo _10FF

_10E4:
	Compare VAR_TEMP_x4002, 27
	GoToIfNe _10FB
	TakeCoins 700
	GoTo _10FF

_10FB:
	TakeCoins 2100
_10FF:
	ScrCmd_118 0
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _111F
	GoTo _0ECD

_1119:
	GoTo _1125

_111F:
	GoTo _0F2A
_1125:
	End

_1127:
	NPCMsg msg_0599_T25R1101_00012
	CloseMsg
_112C:
	Compare VAR_SPECIAL_x8004, 417
	GoToIfNe _1145
	GoTo _0816

_113F:
	GoTo _11C8

_1145:
	Compare VAR_SPECIAL_x8004, 402
	GoToIfNe _115E
	GoTo _0816

_1158:
	GoTo _11C8

_115E:
	Compare VAR_SPECIAL_x8004, 371
	GoToIfNe _1177
	GoTo _0816

_1171:
	GoTo _11C8

_1177:
	Compare VAR_SPECIAL_x8004, 362
	GoToIfNe _1190
	GoTo _0816

_118A:
	GoTo _11C8

_1190:
	Compare VAR_SPECIAL_x8004, 340
	GoToIfNe _11A9
	GoTo _0816

_11A3:
	GoTo _11C8

_11A9:
	Compare VAR_SPECIAL_x8004, 351
	GoToIfNe _11C2
	GoTo _0816

_11BC:
	GoTo _11C8

_11C2:
	GoTo _08B2

_11C8:
	NPCMsg msg_0599_T25R1101_00009
	GoTo _112C
	End

_11D3:
	NPCMsg msg_0599_T25R1101_00009
	GetGameVersion VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _11F3
	GoTo _0ECD

_11ED:
	GoTo _11F9

_11F3:
	GoTo _0F2A

_11F9:
	NPCMsg msg_0599_T25R1101_00008
	WaitButton
	CloseMsg
	GoTo _1208
	End

_1208:
	ScrCmd_117
	TouchscreenMenuShow
	ScriptOverlayCmd 3, 1
	ReleaseAll
	End

scr_seq_T25R1101_003:
	SimpleNPCMsg msg_0599_T25R1101_00018
	End

scr_seq_T25R1101_004:
	SimpleNPCMsg msg_0599_T25R1101_00019
	End

scr_seq_T25R1101_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0599_T25R1101_00027
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _12DE
	NPCMsg msg_0599_T25R1101_00031
	WaitButton
	NPCMsg msg_0599_T25R1101_00028
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _12DE
	NPCMsg msg_0599_T25R1101_00032
	WaitButton
	NPCMsg msg_0599_T25R1101_00028
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _12DE
	NPCMsg msg_0599_T25R1101_00033
	WaitButton
	NPCMsg msg_0599_T25R1101_00028
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _12DE
	NPCMsg msg_0599_T25R1101_00034
	WaitButton
	NPCMsg msg_0599_T25R1101_00028
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _12DE
	NPCMsg msg_0599_T25R1101_00035
	WaitButton
	NPCMsg msg_0599_T25R1101_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_12DE:
	NPCMsg msg_0599_T25R1101_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T25R1101_006:
	SimpleNPCMsg msg_0599_T25R1101_00021
	End

scr_seq_T25R1101_007:
	SimpleNPCMsg msg_0599_T25R1101_00022
	End

scr_seq_T25R1101_008:
	SimpleNPCMsg msg_0599_T25R1101_00023
	End

scr_seq_T25R1101_009:
	SimpleNPCMsg msg_0599_T25R1101_00024
	End
	.balign 4, 0
