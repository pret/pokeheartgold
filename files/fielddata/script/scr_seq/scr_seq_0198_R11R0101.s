#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R11R0101.h"
#include "msgdata/msg/msg_0347_R11R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R11R0101_000
	ScrDef scr_seq_R11R0101_001
	ScrDefEnd

scr_seq_R11R0101_000:
	SetVar VAR_UNK_4085, 0
	End

scr_seq_R11R0101_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_SNORLAX_MEET, _0030
	NPCMsg msg_0347_R11R0101_00000
_0028:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0030:
	NPCMsg msg_0347_R11R0101_00001
	GoTo _0028
	.balign 4, 0
