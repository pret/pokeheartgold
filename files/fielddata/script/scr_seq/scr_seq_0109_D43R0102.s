#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D43R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D43R0102_000
	ScrDef scr_seq_D43R0102_001
	ScrDefEnd

scr_seq_D43R0102_000:
	PlaySE SEQ_SE_GS_RAKKA01
	ApplyMovement obj_player, _0048
	ScrCmd_374 obj_player
	WaitMovement
	ScreenShake 0, 1, 1, 8
	PlaySE SEQ_SE_DP_SUTYA2
	SetVar VAR_UNK_40CA, 0
	End

scr_seq_D43R0102_001:
	Compare VAR_UNK_40CA, 1
	GoToIfNe _0043
	MakeObjectVisible obj_player
_0043:
	End

	.balign 4, 0
_0048:
	WarpIn
	EndMovement
	.balign 4, 0
