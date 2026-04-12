#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0402.h"
#include "msgdata/msg/msg_0549_T20R0402.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T20R0402_000
	ScrDef scr_seq_T20R0402_001
	ScrDef scr_seq_T20R0402_002
	ScrDef scr_seq_T20R0402_003
	ScrDef scr_seq_T20R0402_004
	ScrDefEnd

scr_seq_T20R0402_002:
	GoToIfSet FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND, _0025
	GetFriendSprite VAR_OBJ_0
_0025:
	End

scr_seq_T20R0402_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _006D
	BufferPlayersName 0
	GoToIfSet FLAG_GOT_STARTER, _005C
	GenderMsgBox msg_0549_T20R0402_00000, msg_0549_T20R0402_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005C:
	BufferMonSpeciesName 1, VAR_SPECIAL_RESULT
	GenderMsgBox msg_0549_T20R0402_00002, msg_0549_T20R0402_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006D:
	GetPartyLeadAlive VAR_SPECIAL_x8006
	GetShinyLeafCount VAR_SPECIAL_x8006, VAR_SPECIAL_RESULT
	GoToIfSet FLAG_SHOWED_FRIEND_A_SHINY_LEAF, _00B1
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _009E
_008F:
	BufferPlayersName 0
	GenderMsgBox msg_0549_T20R0402_00005, msg_0549_T20R0402_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009E:
	SetFlag FLAG_SHOWED_FRIEND_A_SHINY_LEAF
	BufferPlayersName 0
	GenderMsgBox msg_0549_T20R0402_00007, msg_0549_T20R0402_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B1:
	CopyVar VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8004, 6
	GoToIfEq _00E4
	Compare VAR_SPECIAL_x8004, 5
	GoToIfEq _00FC
	Compare VAR_SPECIAL_x8004, 1
	GoToIfGe _0137
	GoTo _008F

_00E4:
	BufferPlayersName 0
	GetFollowPokePartyIndex VAR_SPECIAL_RESULT
	BufferPartyMonNick 1, VAR_SPECIAL_RESULT
	GenderMsgBox msg_0549_T20R0402_00015, msg_0549_T20R0402_00016
	CloseMsg
	GoTo _010D

_00FC:
	TryGiveShinyLeafCrown VAR_SPECIAL_x8006
	SetFlag FLAG_UNK_184
	BufferPlayersName 0
	GenderMsgBox msg_0549_T20R0402_00011, msg_0549_T20R0402_00012
	CloseMsg
_010D:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ShowCertificate 2
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GenderMsgBox msg_0549_T20R0402_00013, msg_0549_T20R0402_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0137:
	Compare VAR_SPECIAL_x8004, 1
	GoToIfNe _0150
	SetVar VAR_SPECIAL_x8005, 4
	GoTo _0188

_0150:
	Compare VAR_SPECIAL_x8004, 2
	GoToIfNe _0169
	SetVar VAR_SPECIAL_x8005, 3
	GoTo _0188

_0169:
	Compare VAR_SPECIAL_x8004, 3
	GoToIfNe _0182
	SetVar VAR_SPECIAL_x8005, 2
	GoTo _0188

_0182:
	SetVar VAR_SPECIAL_x8005, 1
_0188:
	BufferPlayersName 0
	BufferInt 1, VAR_SPECIAL_x8004
	BufferInt 2, VAR_SPECIAL_x8005
	GenderMsgBox msg_0549_T20R0402_00009, msg_0549_T20R0402_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0402_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0549_T20R0402_00004
	PlayCry SPECIES_MARILL, 0
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0402_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0549_T20R0402_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T20R0402_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0549_T20R0402_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
