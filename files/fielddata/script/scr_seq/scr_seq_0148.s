#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0148.h"
#include "msgdata/msg/msg_0666.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0148_000
	ScrDef scr_seq_0148_001
	ScrDefEnd

scr_seq_0148_000:
	NPCMsg msg_0666_00015
	GoTo _0019

scr_seq_0148_001:
	BufferPlayersName 0
	NPCMsg msg_0666_00057
_0019:
	ScrCmd_247
	NatDexFlagAction 2, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _005E
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 17, 255, 0
	MenuItemAdd 16, 255, 1
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00EB
	GoTo _00DA

_005E:
	GoToIfSet FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION, _00AF
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 18, 255, 0
	MenuItemAdd 19, 255, 1
	MenuItemAdd 16, 255, 2
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00EB
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0142
	GoTo _00DA

_00AF:
	TouchscreenMenuHide
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 19, 255, 0
	MenuItemAdd 16, 255, 1
	MenuExec
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0142
_00DA:
	NPCMsg msg_0666_00021
	WaitButton
	CloseMsg
	SetVar VAR_SPECIAL_RESULT, 0
	RestartCurrentScript
	End

_00EB:
	CountJohtoDexSeen VAR_SPECIAL_x8004
	CountJohtoDexOwned VAR_SPECIAL_x8005
	BufferInt 5, VAR_SPECIAL_x8004
	BufferInt 6, VAR_SPECIAL_x8005
	NPCMsg msg_0666_00020
	GetDexEvalResult 0, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	PlayFanfare VAR_SPECIAL_x8000
	BufferPlayersName 0
	NonNPCMsgVar VAR_SPECIAL_RESULT
	WaitFanfare
	CheckJohtoDexComplete VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _012F
	SetFlag FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	GoTo _0132

_012F:
	NPCMsg msg_0666_00021
_0132:
	WaitButton
	CloseMsg
	SetVar VAR_SPECIAL_RESULT, 1
	GoTo _0189

_0142:
	CountNationalDexSeen VAR_SPECIAL_x8004
	CountNationalDexOwned VAR_SPECIAL_x8005
	BufferInt 5, VAR_SPECIAL_x8004
	BufferInt 6, VAR_SPECIAL_x8005
	NPCMsg msg_0666_00020
	GetDexEvalResult 1, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8000
	PlayFanfare VAR_SPECIAL_x8000
	BufferPlayersName 0
	NonNPCMsgVar VAR_SPECIAL_RESULT
	WaitFanfare
	CheckNationalDexComplete VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0183
	NPCMsg msg_0666_00021
	WaitButton
	CloseMsg
_0183:
	SetVar VAR_SPECIAL_RESULT, 2
_0189:
	RestartCurrentScript
	End
	.balign 4, 0
