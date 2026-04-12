#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0103.h"
#include "msgdata/msg/msg_0123_D39R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D39R0103_000
	ScrDef scr_seq_D39R0103_001
	ScrDef scr_seq_D39R0103_002
	ScrDefEnd

scr_seq_D39R0103_000:
	PlaySE SEQ_SE_GS_RAKKA01
	ApplyMovement obj_player, _0050
	Wait 1, VAR_SPECIAL_RESULT
	ScrCmd_374 obj_player
	WaitMovement
	ScreenShake 0, 1, 1, 8
	PlaySE SEQ_SE_DP_SUTYA2
	SetVar VAR_UNK_40AB, 0
	End

scr_seq_D39R0103_001:
	Compare VAR_UNK_40AB, 1
	GoToIfNe _004D
	MakeObjectVisible obj_player
_004D:
	End

	.balign 4, 0
_0050:
	WarpIn
	EndMovement

scr_seq_D39R0103_002:
	SimpleNPCMsg msg_0123_D39R0103_00000
	End
	.balign 4, 0
