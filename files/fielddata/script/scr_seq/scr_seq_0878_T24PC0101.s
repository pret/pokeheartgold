#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T24PC0101.h"
#include "msgdata/msg/msg_0575_T24PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T24PC0101_000
	ScrDef scr_seq_T24PC0101_001
	ScrDef scr_seq_T24PC0101_002
	ScrDef scr_seq_T24PC0101_003
	ScrDefEnd

scr_seq_T24PC0101_000:
	SetVar VAR_SPECIAL_x8007, 3
	CallStd std_nurse_joy
	End

scr_seq_T24PC0101_001:
	SimpleNPCMsg msg_0575_T24PC0101_00000
	End

scr_seq_T24PC0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CountPCEmptySpace VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 540
	GoToIfNe _0056
	GoTo _005C

_0050:
	GoTo _005C

_0056:
	GoTo _00E4

_005C:
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0079
	GoTo _007F

_0073:
	GoTo _007F

_0079:
	GoTo _00E4

_007F:
	NPCMsg msg_0575_T24PC0101_00004
	BufferPlayersName 0
	NPCMsg msg_0575_T24PC0101_00005
	PlayFanfare SEQ_ME_POKEGET
	WaitFanfare
	GiveMon SPECIES_TENTACOOL, 15, 0, 0, 0, VAR_SPECIAL_RESULT
	NPCMsg msg_0575_T24PC0101_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00BC
	TouchscreenMenuShow
	CloseMsg
	GoTo _00E0

_00BC:
	CloseMsg
	ScrCmd_815 0
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	NicknameInput 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_00E0:
	ReleaseAll
	End

_00E4:
	NPCMsg msg_0575_T24PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T24PC0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_STORM, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0115
	NPCMsg msg_0575_T24PC0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0115:
	BufferPlayersName 0
	NPCMsg msg_0575_T24PC0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
