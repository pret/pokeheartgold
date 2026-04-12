#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0401.h"
#include "msgdata/msg/msg_0548_T20R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T20R0401_000
	ScrDefEnd

scr_seq_T20R0401_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND, _0035
	Compare VAR_SCENE_ELMS_LAB, 1
	GoToIfGe _0044
	BufferPlayersName 0
	GenderMsgBox msg_0548_T20R0401_00000, msg_0548_T20R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0035:
	BufferPlayersName 0
	GenderMsgBox msg_0548_T20R0401_00002, msg_0548_T20R0401_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0044:
	BufferPlayersName 0
	GenderMsgBox msg_0548_T20R0401_00004, msg_0548_T20R0401_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
