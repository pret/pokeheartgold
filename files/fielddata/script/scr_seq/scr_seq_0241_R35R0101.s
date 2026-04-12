#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R35R0101.h"
#include "msgdata/msg/msg_0388_R35R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R35R0101_000
	ScrDef scr_seq_R35R0101_001
	ScrDefEnd

scr_seq_R35R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_RADIO_CARD, _0028
	NPCMsg msg_0388_R35R0101_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0028:
	NPCMsg msg_0388_R35R0101_00014
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _004B
	NPCMsg msg_0388_R35R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_004B:
	NPCMsg msg_0388_R35R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R35R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_LOAN_SPEAROW, 1
	GoToIfEq _00BC
	Compare VAR_LOAN_SPEAROW, 2
	GoToIfGe _0104
	NPCMsg msg_0388_R35R0101_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00EE
	GetPartyCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _00F9
	NPCMsg msg_0388_R35R0101_00003
	GiveLoanMon 7, 20, 101
	SetVar VAR_LOAN_SPEAROW, 1
	BufferPlayersName 0
	NPCMsg msg_0388_R35R0101_00004
	PlayFanfare SEQ_ME_PT_SPECIAL
	WaitFanfare
_00BC:
	KenyaCheckPartyOrMailbox VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0178
	GoToIfSet FLAG_UNK_0B5, _00E3
	NPCMsg msg_0388_R35R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E3:
	NPCMsg msg_0388_R35R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EE:
	NPCMsg msg_0388_R35R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F9:
	NPCMsg msg_0388_R35R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0104:
	Compare VAR_LOAN_SPEAROW, 4
	GoToIfGe _016D
	NPCMsg msg_0388_R35R0101_00007
	GoToIfNoItemSpace ITEM_HP_UP, 1, _0163
	CallStd std_give_item_verbose
	Compare VAR_LOAN_SPEAROW, 3
	GoToIfNe _0152
	SetVar VAR_LOAN_SPEAROW, 5
	GoTo _0158

_0152:
	SetVar VAR_LOAN_SPEAROW, 4
_0158:
	NPCMsg msg_0388_R35R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0163:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_016D:
	NPCMsg msg_0388_R35R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0178:
	SetVar VAR_LOAN_SPEAROW, 6
	NPCMsg msg_0388_R35R0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
