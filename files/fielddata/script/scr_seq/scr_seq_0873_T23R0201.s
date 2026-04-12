#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23R0201.h"
#include "msgdata/msg/msg_0570_T23R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T23R0201_000
	ScrDef scr_seq_T23R0201_001
	ScrDef scr_seq_T23R0201_002
	ScrDefEnd

scr_seq_T23R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_BEAT_AZALEA_ROCKETS, _002C
	NPCMsg msg_0570_T23R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002C:
	GoToIfSet FLAG_GOT_HM01, _0042
	NPCMsg msg_0570_T23R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0042:
	NPCMsg msg_0570_T23R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T23R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_HM01, _006B
	NPCMsg msg_0570_T23R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006B:
	GoToIfSet FLAG_GOT_CHARCOAL_FROM_AZALEA_TOWN_MAN, _00AA
	NPCMsg msg_0570_T23R0201_00004
	WaitABPress
	GoToIfNoItemSpace ITEM_CHARCOAL, 1, _00B5
	CallStd std_obtain_item_verbose
	SetFlag FLAG_GOT_CHARCOAL_FROM_AZALEA_TOWN_MAN
	CloseMsg
	ReleaseAll
	End

_00AA:
	NPCMsg msg_0570_T23R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B5:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_T23R0201_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_FARFETCHD, 0
	NPCMsg msg_0570_T23R0201_00008
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
