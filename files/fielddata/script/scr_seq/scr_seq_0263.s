#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0263.h"
#include "msgdata/msg/msg_0433.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0263_000
	ScrDefEnd

scr_seq_0263_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScriptOverlayCmd 3, 0
	ScrCmd_116 1, 21, 1
	GoToIfSet FLAG_GOT_SCRATCH_CARD_INFO, _0038
	SetFlag FLAG_GOT_SCRATCH_CARD_INFO
	BufferInt 0, 1
	NPCMsg msg_0433_00015
	GoTo _0048
	End

_0038:
	BufferInt 0, 1
	NPCMsg msg_0433_00000
	GoTo _0048
	End

_0048:
	NPCMsg msg_0433_00001
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 2, 255, 0
	MenuItemAdd 3, 255, 1
	MenuItemAdd 4, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0097
	Case 1, _0178
	GoTo _016B
	End

_0097:
	BufferInt 2, 1
	NPCMsg msg_0433_00007
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _016B
	CheckBattlePoints 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _015E
	ScrCmd_556 1
	ScrCmd_118 1
	NPCMsg msg_0433_00010
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_815 0
	ScrCmd_117
	CloseMsg
	ScratchOffCard
	GetScratchOffPrize 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	GetScratchOffPrize 1, VAR_TEMP_x4002, VAR_TEMP_x4003
	GetScratchOffPrize 2, VAR_TEMP_x4004, VAR_TEMP_x4005
	ScratchOffCardEnd
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_SPECIAL_x8000, 0
	Call _019D
	Compare VAR_SPECIAL_x8000, 0
	GoToIfEq _01CE
	BufferInt 0, VAR_SPECIAL_x8000
	NPCMsg msg_0433_00011
	Compare VAR_TEMP_x4001, 0
	CallIfNe _01D9
	Compare VAR_TEMP_x4003, 0
	CallIfNe _0225
	Compare VAR_TEMP_x4005, 0
	CallIfNe _0271
	NPCMsg msg_0433_00005
	GoTo _0191
	End

_015E:
	TouchscreenMenuShow
	NPCMsg msg_0433_00014
	GoTo _0183
	End

_016B:
	TouchscreenMenuShow
	NPCMsg msg_0433_00005
	GoTo _0183
	End

_0178:
	NPCMsg msg_0433_00006
	GoTo _0048
	End

_0183:
	WaitButton
	CloseMsg
	ScrCmd_117
	ScriptOverlayCmd 3, 1
	ReleaseAll
	End

_0191:
	WaitButton
	CloseMsg
	ScriptOverlayCmd 3, 1
	ReleaseAll
	End

_019D:
	Compare VAR_TEMP_x4001, 0
	CallIfNe _01C6
	Compare VAR_TEMP_x4003, 0
	CallIfNe _01C6
	Compare VAR_TEMP_x4005, 0
	CallIfNe _01C6
	Return

_01C6:
	AddVar VAR_SPECIAL_x8000, 1
	Return

_01CE:
	NPCMsg msg_0433_00005
	GoTo _0191
	End

_01D9:
	Compare VAR_TEMP_x4001, 1
	GoToIfGt _01F1
	BufferItemName 0, VAR_TEMP_x4000
	GoTo _01F6

_01F1:
	BufferItemNamePlural 0, VAR_TEMP_x4000
_01F6:
	BufferInt 1, VAR_TEMP_x4001
	HasSpaceForItem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02BD
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0433_00013
	GiveItem VAR_TEMP_x4000, VAR_TEMP_x4001, VAR_SPECIAL_RESULT
	WaitFanfare
	WaitABPress
	Return

_0225:
	Compare VAR_TEMP_x4003, 1
	GoToIfGt _023D
	BufferItemName 0, VAR_TEMP_x4002
	GoTo _0242

_023D:
	BufferItemNamePlural 0, VAR_TEMP_x4002
_0242:
	BufferInt 1, VAR_TEMP_x4003
	HasSpaceForItem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02BD
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0433_00013
	GiveItem VAR_TEMP_x4002, VAR_TEMP_x4003, VAR_SPECIAL_RESULT
	WaitFanfare
	WaitABPress
	Return

_0271:
	Compare VAR_TEMP_x4005, 1
	GoToIfGt _0289
	BufferItemName 0, VAR_TEMP_x4004
	GoTo _028E

_0289:
	BufferItemNamePlural 0, VAR_TEMP_x4004
_028E:
	BufferInt 1, VAR_TEMP_x4005
	HasSpaceForItem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02BD
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0433_00013
	GiveItem VAR_TEMP_x4004, VAR_TEMP_x4005, VAR_SPECIAL_RESULT
	WaitFanfare
	WaitABPress
	Return

_02BD:
	NPCMsg msg_0433_00012
	Return
	.balign 4, 0
