#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34R0201.h"
#include "msgdata/msg/msg_0386_R34R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R34R0201_000
	ScrDef scr_seq_R34R0201_001
	ScrDef scr_seq_R34R0201_002
	ScrDefEnd

scr_seq_R34R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TM12_FROM_ILEX_FOREST_GATE_WOMAN, _0055
	NPCMsg msg_0386_R34R0201_00000
	WaitABPress
	GoToIfNoItemSpace ITEM_TM12, 1, _0060
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM12_FROM_ILEX_FOREST_GATE_WOMAN
	GoTo _0055

_0055:
	NPCMsg msg_0386_R34R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0060:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_R34R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_BUTTERFREE, 0
	NPCMsg msg_0386_R34R0201_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R34R0201_002:
	SimpleNPCMsg msg_0386_R34R0201_00004
	End
	.balign 4, 0
