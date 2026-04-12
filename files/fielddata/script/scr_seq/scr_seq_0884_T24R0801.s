#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24R0801.h"
#include "msgdata/msg/msg_0580_T24R0801.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T24R0801_000
	ScrDefEnd

scr_seq_T24R0801_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _002B
	GoTo _0031

_0025:
	GoTo _0031

_002B:
	GoTo _0073

_0031:
	HasItem ITEM_CLEAR_BELL, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0061
	HasItem ITEM_RAINBOW_WING, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _006A
	GoTo _00B5

_0061:
	NPCMsg msg_0580_T24R0801_00003
	GoTo _00B8

_006A:
	NPCMsg msg_0580_T24R0801_00001
	GoTo _00B8

_0073:
	HasItem ITEM_TIDAL_BELL, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _00A3
	HasItem ITEM_SILVER_WING, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _00AC
	GoTo _00B5

_00A3:
	NPCMsg msg_0580_T24R0801_00004
	GoTo _00B8

_00AC:
	NPCMsg msg_0580_T24R0801_00002
	GoTo _00B8

_00B5:
	NPCMsg msg_0580_T24R0801_00000
_00B8:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
