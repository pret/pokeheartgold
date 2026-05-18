#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28R0201.h"
#include "msgdata/msg/msg_0625_T28R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T28R0201_000
	ScrDef scr_seq_T28R0201_001
	ScrDefEnd

scr_seq_T28R0201_000:
	SimpleNPCMsg msg_0625_T28R0201_00000
	End

scr_seq_T28R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_BEAT_RADIO_TOWER_ROCKETS, _003B
	GoToIfSet FLAG_UNK_0C5, _0046
_003B:
	NPCMsg msg_0625_T28R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0046:
	NPCMsg msg_0625_T28R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
