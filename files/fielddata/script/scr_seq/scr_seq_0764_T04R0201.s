#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04R0201.h"
#include "msgdata/msg/msg_0472_T04R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T04R0201_000
	ScrDef scr_seq_T04R0201_001
	ScrDef scr_seq_T04R0201_002
	ScrDefEnd

scr_seq_T04R0201_000:
	SimpleNPCMsg msg_0472_T04R0201_00000
	End

scr_seq_T04R0201_001:
	SimpleNPCMsg msg_0472_T04R0201_00001
	End

scr_seq_T04R0201_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_DIGLETT, 0
	NPCMsg msg_0472_T04R0201_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
