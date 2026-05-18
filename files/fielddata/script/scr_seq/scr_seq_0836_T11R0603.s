#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0603.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T11R0603_000
	ScrDefEnd

scr_seq_T11R0603_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0038
	WaitMovement
	PlaySE SEQ_SE_GS_N_LINEAR
	Wait 40, VAR_SPECIAL_x8004
	StopSE SEQ_SE_GS_N_LINEAR
	ScrCmd_722 1, 1, 198, 17, 11
	SetVar VAR_UNK_411E, 0
	ReleaseAll
	End

	.balign 4, 0
_0038:
	WalkNormalWest 7
	WalkNormalNorth 2
	EndMovement

_0044:
	End

	.balign 4, 0
