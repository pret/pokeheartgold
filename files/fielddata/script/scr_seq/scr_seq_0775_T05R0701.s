#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0701.h"
#include "msgdata/msg/msg_0482_T05R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T05R0701_000
	ScrDef scr_seq_T05R0701_001
	ScrDef scr_seq_T05R0701_002
	ScrDef scr_seq_T05R0701_003
	ScrDef scr_seq_T05R0701_004
	ScrDef scr_seq_T05R0701_005
	ScrDef scr_seq_T05R0701_006
	ScrDefEnd

scr_seq_T05R0701_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_EXPN_CARD, _0069
	GoToIfSet FLAG_RESTORED_POWER, _0047
	NPCMsg msg_0482_T05R0701_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0047:
	BufferPlayersName 0
	GenderMsgBox msg_0482_T05R0701_00004, msg_0482_T05R0701_00005
	NPCMsg msg_0482_T05R0701_00006
	PlayFanfare SEQ_ME_KEYITEM
	WaitFanfare
	SetFlag FLAG_GOT_EXPN_CARD
	GoToIfSet FLAG_GOT_RADIO_CARD, _0069
	RegisterPokegearCard 2
_0069:
	NPCMsg msg_0482_T05R0701_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05R0701_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_EXPN_CARD, _0092
	NPCMsg msg_0482_T05R0701_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0092:
	NPCMsg msg_0482_T05R0701_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05R0701_000:
	SimpleNPCMsg msg_0482_T05R0701_00000
	End

scr_seq_T05R0701_001:
	SimpleNPCMsg msg_0482_T05R0701_00001
	End

scr_seq_T05R0701_002:
	SimpleNPCMsg msg_0482_T05R0701_00002
	End

scr_seq_T05R0701_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0482_T05R0701_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05R0701_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0482_T05R0701_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
