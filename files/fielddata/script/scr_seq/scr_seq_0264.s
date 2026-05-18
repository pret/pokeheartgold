#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0264.h"
#include "msgdata/msg/msg_0019.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0264_000
	ScrDef scr_seq_0264_001
	ScrDef scr_seq_0264_002
	ScrDef scr_seq_0264_003
	ScrDef scr_seq_0264_004
	ScrDef scr_seq_0264_005
	ScrDefEnd

scr_seq_0264_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 1
	GoTo _002E
	End

_002E:
	Call _01EE
	Call _01F5
	Switch VAR_SPECIAL_x8001
	Case 3, _0221
	Case -2, _0221
	Call _0229
	GoTo _002E
	End

scr_seq_0264_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 1
	GoTo _007C
	End

_007C:
	Call _01EE
	Call _01F5
	Switch VAR_SPECIAL_x8001
	Case 3, _0221
	Case -2, _0221
	Call _0229
	GoTo _007C
	End

scr_seq_0264_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 2
	GoTo _00CA
	End

_00CA:
	Call _01EE
	Call _01F5
	Switch VAR_SPECIAL_x8001
	Case 3, _0221
	Case -2, _0221
	Call _0229
	GoTo _00CA
	End

scr_seq_0264_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 5
	GoTo _0118
	End

_0118:
	Call _01EE
	Call _01F5
	Switch VAR_SPECIAL_x8001
	Case 3, _0221
	Case -2, _0221
	Call _0229
	GoTo _0118
	End

scr_seq_0264_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 4
	GoTo _0166
	End

_0166:
	Call _01EE
	Call _01F5
	Switch VAR_SPECIAL_x8001
	Case 3, _0221
	Case -2, _0221
	Call _0229
	GoTo _0166
	End

scr_seq_0264_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	SetVar VAR_SPECIAL_x8000, 6
	GoTo _01B4
	End

_01B4:
	Call _01EE
	Call _01F5
	Switch VAR_SPECIAL_x8001
	Case 3, _0221
	Case -2, _0221
	Call _0229
	GoTo _01B4
	End

_01EE:
	NPCMsg msg_0019_00000
	TouchscreenMenuHide
	Return

_01F5:
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_x8001
	MenuItemAdd 1, 255, 0
	MenuItemAdd 2, 255, 1
	MenuItemAdd 3, 255, 2
	MenuItemAdd 4, 255, 3
	MenuExec
	Return

_0221:
	CloseMsg
	TouchscreenMenuShow
	ReleaseAll
	End

_0229:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	Call _023F
	Return

_023F:
	ScrCmd_631 VAR_SPECIAL_x8001, VAR_SPECIAL_x8000, VAR_SPECIAL_x8003
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return
	.balign 4, 0
