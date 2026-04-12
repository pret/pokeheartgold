#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0103.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D27R0103_000
	ScrDef scr_seq_D27R0103_001
	ScrDefEnd

scr_seq_D27R0103_000:
	PlaySE SEQ_SE_GS_RAKKA01
	ApplyMovement obj_player, _0038
	Wait 1, VAR_SPECIAL_RESULT
	ScrCmd_374 obj_player
	WaitMovement
	ScreenShake 0, 1, 1, 8
	PlaySE SEQ_SE_DP_SUTYA2
	SetVar VAR_UNK_40A7, 0
	End

	.balign 4, 0
_0038:
	WarpIn
	EndMovement

scr_seq_D27R0103_001:
	Compare VAR_UNK_40A7, 1
	GoToIfNe _0051
	MakeObjectVisible obj_player
_0051:
	End
	.balign 4, 0
