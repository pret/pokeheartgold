#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0143.h"
#include "msgdata/msg/msg_0204.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0143_000
	ScrDefEnd

scr_seq_0143_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_465 0, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0070
	Call _0122
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _003C
	GoTo _0055

_003C:
	ScrCmd_465 3, 1, 0
	ScrCmd_465 2, 1, 1
	NPCMsg msg_0204_00000
	GoTo _00B6

_0055:
	ScrCmd_465 3, 1, 0
	ScrCmd_465 2, 1, 1
	NPCMsg msg_0204_00001
	GoTo _008C
	End

_0070:
	NPCMsg msg_0204_00002
_0073:
	Call _0122
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00B6
	GoTo _008C

_008C:
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_x8004
	MenuItemAdd 11, 255, 1
	MenuItemAdd 13, 255, 3
	MenuItemAdd 14, 255, 4
	MenuExec
	GoTo _00E2

_00B6:
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_x8004
	MenuItemAdd 11, 255, 1
	MenuItemAdd 12, 255, 2
	MenuItemAdd 13, 255, 3
	MenuItemAdd 14, 255, 4
	MenuExec
_00E2:
	Switch VAR_SPECIAL_x8004
	Case 1, _01EF
	Case 2, _0287
	Case 3, _056C
	Case 4, _0577
	GoTo _0577

_0122:
	ScrCmd_465 0, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _014C
	ScrCmd_465 1, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01DF
_014C:
	ScrCmd_465 0, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0176
	ScrCmd_465 1, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01DF
_0176:
	ScrCmd_465 0, 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01A0
	ScrCmd_465 1, 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01DF
_01A0:
	ScrCmd_465 0, 4, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CA
	ScrCmd_465 1, 4, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01DF
_01CA:
	ScrCmd_465 0, 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01E7
_01DF:
	SetVar VAR_SPECIAL_RESULT, 1
	Return

_01E7:
	SetVar VAR_SPECIAL_RESULT, 0
	Return

_01EF:
	TouchscreenMenuShow
	ScrCmd_465 0, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _021E
	NPCMsg msg_0204_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0579
_021E:
	NPCMsg msg_0204_00006
	WaitABPress
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_465 4, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0579
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfEq _027C
	ScrCmd_465 6
	ScrCmd_465 2, 0, 0
	ScrCmd_465 3, 0, 1
	NPCMsg msg_0204_00007
	WaitButton
	GoTo _057E

_027C:
	NPCMsg msg_0204_00027
	WaitButton
	GoTo _057E

_0287:
	NPCMsg msg_0204_00003
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_x8004
	ScrCmd_465 7, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0400
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02B2
_02B2:
	ScrCmd_465 0, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02EC
	ScrCmd_465 1, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _02EC
	ScrCmd_465 2, 0, 0
	MenuItemAdd 15, 255, 0
_02EC:
	ScrCmd_465 0, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0326
	ScrCmd_465 1, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0326
	ScrCmd_465 2, 2, 1
	MenuItemAdd 16, 255, 2
_0326:
	ScrCmd_465 0, 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0360
	ScrCmd_465 1, 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0360
	ScrCmd_465 2, 3, 2
	MenuItemAdd 17, 255, 3
_0360:
	ScrCmd_465 0, 4, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _039A
	ScrCmd_465 1, 4, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _039A
	ScrCmd_465 2, 4, 3
	MenuItemAdd 18, 255, 4
_039A:
	ScrCmd_465 0, 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03D4
	ScrCmd_465 1, 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03D4
	ScrCmd_465 2, 5, 4
	MenuItemAdd 19, 255, 5
_03D4:
	MenuItemAdd 25, 255, 6
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_x8004, 6
	GoToIfEq _0579
	Compare VAR_SPECIAL_x8004, 65534
	GoToIfEq _0579
	GoTo _0528

_0400:
	ScrCmd_465 0, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _043A
	ScrCmd_465 1, 0, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _043A
	ScrCmd_465 2, 0, 0
	MenuItemAdd 20, 255, 0
_043A:
	ScrCmd_465 0, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0474
	ScrCmd_465 1, 2, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0474
	ScrCmd_465 2, 2, 1
	MenuItemAdd 21, 255, 2
_0474:
	ScrCmd_465 0, 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04AE
	ScrCmd_465 1, 3, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04AE
	ScrCmd_465 2, 3, 2
	MenuItemAdd 22, 255, 3
_04AE:
	ScrCmd_465 0, 4, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _04E8
	ScrCmd_465 1, 4, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _04E8
	ScrCmd_465 2, 4, 3
	MenuItemAdd 23, 255, 4
_04E8:
	ScrCmd_465 0, 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _03D4
	ScrCmd_465 1, 5, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03D4
	ScrCmd_465 2, 5, 4
	MenuItemAdd 24, 255, 5
	GoTo _03D4

_0528:
	ScrCmd_465 2, VAR_SPECIAL_x8004, 0
	ScrCmd_465 3, VAR_SPECIAL_x8004, 1
	NPCMsg msg_0204_00008
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0287
	TouchscreenMenuShow
	ScrCmd_465 5, VAR_SPECIAL_x8004
	BufferPlayersName 0
	ScrCmd_465 2, VAR_SPECIAL_x8004, 1
	NPCMsg msg_0204_00009
	WaitButton
	GoTo _057E

_056C:
	TouchscreenMenuShow
	NPCMsg msg_0204_00010
	GoTo _0073

_0577:
	TouchscreenMenuShow
_0579:
	NPCMsg msg_0204_00004
	WaitButton
_057E:
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
