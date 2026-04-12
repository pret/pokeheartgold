#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0401.h"
#include "msgdata/msg/msg_0480_T05R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T05R0401_000
	ScrDefEnd

scr_seq_T05R0401_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0480_T05R0401_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _002E
	GoTo _00B3
	End

_002E:
	NPCMsg msg_0480_T05R0401_00001
	WaitABPress
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_RESULT
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _00B3
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	GetPartyMonSpecies VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00BE
	PartyMonIsMine VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00C9
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0480_T05R0401_00002
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00D9
	GoTo _00B3
	End

_00B3:
	NPCMsg msg_0480_T05R0401_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BE:
	NPCMsg msg_0480_T05R0401_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C9:
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0480_T05R0401_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D9:
	NPCMsg msg_0480_T05R0401_00003
	CloseMsg
	SetVar VAR_SPECIAL_RESULT, 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _011F
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0480_T05R0401_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011F:
	BufferPartyMonNick 0, VAR_SPECIAL_x8005
	NPCMsg msg_0480_T05R0401_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
