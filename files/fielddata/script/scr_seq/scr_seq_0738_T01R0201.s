#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01R0201.h"
#include "msgdata/msg/msg_0449_T01R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T01R0201_000
	ScrDefEnd

scr_seq_T01R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NopVar490 VAR_UNK_4122
	Compare VAR_UNK_4122, 7
	GoToIfEq _003B
_001F:
	ScrCmd_522 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 15
	GoToIfEq _0056
	NPCMsg msg_0449_T01R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003B:
	CheckRegisteredPhoneNumber PHONE_CONTACT_BLUE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _001F
	GoTo _015D
	End

_0056:
	GoToIfSet FLAG_UNK_AA8, _0152
	NPCMsg msg_0449_T01R0201_00001
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0147
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0099
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00A7
	End

_0099:
	SetVar VAR_SPECIAL_x8004, 0
	GoTo _00F0
	End

_00A7:
	NPCMsg msg_0449_T01R0201_00002
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PartySelectUI
	GetPartySelection VAR_SPECIAL_x8004
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NopVar490 VAR_SPECIAL_x8004
	Compare VAR_SPECIAL_x8004, 255
	GoToIfEq _0147
	GetPartyMonSpecies VAR_SPECIAL_x8004, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _013C
_00F0:
	BufferPartyMonNick 0, VAR_SPECIAL_x8004
	PlaySE SEQ_SE_DP_FW367
	NPCMsg msg_0449_T01R0201_00003
	WaitSE SEQ_SE_DP_FW367
	Wait 15, VAR_SPECIAL_RESULT
	MonAddFriendship 10, VAR_SPECIAL_x8004
	MonAddContestValue VAR_SPECIAL_x8004, 1, 32
	MonAddContestValue VAR_SPECIAL_x8004, 5, 22
	Compare VAR_UNK_4122, 7
	GoToIfEq _012D
	AddVar VAR_UNK_4122, 1
_012D:
	SetFlag FLAG_UNK_AA8
	NPCMsg msg_0449_T01R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013C:
	NPCMsg msg_0449_T01R0201_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0147:
	NPCMsg msg_0449_T01R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0152:
	NPCMsg msg_0449_T01R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015D:
	Compare VAR_TEMP_x4004, 1
	GoToIfGe _01AE
	NPCMsg msg_0449_T01R0201_00008
_016D:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _019D
	RegisterGearNumber PHONE_CONTACT_BLUE
	BufferPlayersName 0
	NPCMsg msg_0449_T01R0201_00009
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	NPCMsg msg_0449_T01R0201_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019D:
	NPCMsg msg_0449_T01R0201_00011
	WaitButton
	CloseMsg
	SetVar VAR_TEMP_x4004, 1
	ReleaseAll
	End

_01AE:
	NPCMsg msg_0449_T01R0201_00012
	GoTo _016D
	End

	.balign 4, 0
