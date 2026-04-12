#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0501.h"
#include "msgdata/msg/msg_0609_T26R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26R0501_000
	ScrDef scr_seq_T26R0501_001
	ScrDef scr_seq_T26R0501_002
	ScrDefEnd

scr_seq_T26R0501_000:
	SimpleNPCMsg msg_0609_T26R0501_00000
	End

scr_seq_T26R0501_001:
	SimpleNPCMsg msg_0609_T26R0501_00001
	End

scr_seq_T26R0501_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_UNK_AB9, _0050
	NPCMsg msg_0609_T26R0501_00004
	GoTo _00E3

_0050:
	NPCMsg msg_0609_T26R0501_00002
	HasItem ITEM_SEAL_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0071
	NPCMsg msg_0609_T26R0501_00005
	GoTo _00E3

_0071:
	GiveRandomSeal VAR_SPECIAL_x8000, VAR_SPECIAL_x8001, VAR_SPECIAL_x8002
	Compare VAR_SPECIAL_x8000, 0
	GoToIfNe _008F
	NPCMsg msg_0609_T26R0501_00003
	GoTo _00E3

_008F:
	SetFlag FLAG_UNK_AB9
	BufferSealName 0, VAR_SPECIAL_x8000
	NPCMsg msg_0609_T26R0501_00006
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0609_T26R0501_00011
	WaitFanfare
	Compare VAR_SPECIAL_x8001, 0
	GoToIfEq _00EB
	BufferSealName 0, VAR_SPECIAL_x8001
	NPCMsg msg_0609_T26R0501_00007
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0609_T26R0501_00011
	WaitFanfare
	Compare VAR_SPECIAL_x8002, 0
	GoToIfEq _00EB
	BufferSealName 0, VAR_SPECIAL_x8002
	NPCMsg msg_0609_T26R0501_00008
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0609_T26R0501_00011
	WaitFanfare
	NPCMsg msg_0609_T26R0501_00009
_00E3:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EB:
	NPCMsg msg_0609_T26R0501_00010
	GoTo _00E3
	End

	.balign 4, 0
