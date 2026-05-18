#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03R0201.h"
#include "msgdata/msg/msg_0465_T03R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T03R0201_000
	ScrDef scr_seq_T03R0201_001
	ScrDefEnd

scr_seq_T03R0201_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0465_T03R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	PlayCry SPECIES_NIDORAN_M, 0
	NPCMsg msg_0465_T03R0201_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
