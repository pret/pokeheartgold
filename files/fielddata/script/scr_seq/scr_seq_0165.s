#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0165.h"
#include "msgdata/msg/msg_0268.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0165_000
	ScrDefEnd

scr_seq_0165_000:
	ScrCmd_609
	LockAll
	SysSetSleepFlag 1
	Wait 1, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	ScrCmd_547 VAR_SPECIAL_x8000
	ChatotHasCry VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0037
	GoTo _005E
	End

_0037:
	NPCMsg msg_0268_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _005E
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00C9
	End

_005E:
	FadeOutBGM 42, 10
	NPCMsg msg_0268_00008
	AddWaitingIcon
	Wait 80, VAR_SPECIAL_RESULT
	RemoveWaitingIcon
	NPCMsg msg_0268_00001
	ChatotStartRecording VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Wait 30, VAR_SPECIAL_RESULT
	FadeInBGM 10
	Wait 10, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8004, 0
	GoToIfEq _00D5
	ChatotStopRecording
	Wait 1, VAR_SPECIAL_RESULT
	ChatotSaveRecording
	Wait 1, VAR_SPECIAL_RESULT
	ScrCmd_548
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0268_00002
	ScrCmd_549 VAR_SPECIAL_RESULT
	PlayCry SPECIES_CHATOT, 0
	WaitCry
	GoTo _00C9
	End

_00C9:
	ScrCmd_453
	CloseMsg
	SysSetSleepFlag 0
	ReleaseAll
	End

_00D5:
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0268_00003
	NPCMsg msg_0268_00004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _005E
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00C9
	End
	.balign 4, 0
