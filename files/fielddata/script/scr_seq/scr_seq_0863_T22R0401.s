#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0401.h"
#include "msgdata/msg/msg_0561_T22R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22R0401_000
	ScrDef scr_seq_T22R0401_001
	ScrDef scr_seq_T22R0401_002
	ScrDef scr_seq_T22R0401_003
	ScrDefEnd

scr_seq_T22R0401_000:
	End

scr_seq_T22R0401_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_PIDGEY, 0
	NPCMsg msg_0561_T22R0401_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T22R0401_001:
	SimpleNPCMsg msg_0561_T22R0401_00000
	End

scr_seq_T22R0401_002:
	SimpleNPCMsg msg_0561_T22R0401_00001
	End
	.balign 4, 0
