#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0150.h"
#include "msgdata/msg/msg_0023.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0150_000
	ScrDefEnd

scr_seq_0150_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0023_00000
	CloseMsg
	HasItem ITEM_APRICORN_BOX, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0099
	AnimApricornTree VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0088
	ApricornTreeGetApricorn VAR_SPECIAL_x8000
	SetVar VAR_SPECIAL_x8005, 1
	BufferPlayersName 0
	BufferApricornName 1, VAR_SPECIAL_x8000
	NPCMsg msg_0023_00001
	CloseMsg
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0023_00003
	WaitFanfare
	GiveApricornFromTree VAR_SPECIAL_x8000, 1, VAR_SPECIAL_RESULT
	AddSpecialGameStat SCORE_EVENT_1
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _007D
	NPCMsg msg_0023_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_007D:
	NPCMsg msg_0023_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0088:
	Wait 15, VAR_SPECIAL_RESULT
	NPCMsg msg_0023_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0099:
	NPCMsg msg_0023_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
