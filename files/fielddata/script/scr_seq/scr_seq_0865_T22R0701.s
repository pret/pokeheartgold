#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0701.h"
#include "msgdata/msg/msg_0563_T22R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T22R0701_000
	ScrDef scr_seq_T22R0701_001
	ScrDefEnd

scr_seq_T22R0701_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_HIDE_ROUTE_36_SUDOWOODO, _0026
	NPCMsg msg_0563_T22R0701_00000
	GoTo _0029

_0026:
	NPCMsg msg_0563_T22R0701_00001
_0029:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T22R0701_001:
	SimpleNPCMsg msg_0563_T22R0701_00002
	End
	.balign 4, 0
