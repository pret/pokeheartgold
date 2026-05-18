#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0105.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D27R0105_000
	ScrDefEnd

scr_seq_D27R0105_000:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40A7, 1
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0039
	ApplyMovement obj_player, _0070
	ApplyMovement obj_partner_poke, _007C
	WaitMovement
	GoTo _0043

_0039:
	ApplyMovement obj_player, _0070
	WaitMovement
_0043:
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_OLIVINE_LIGHTHOUSE_EXTERIOR, 0, 15, 3, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_0070:
	WalkFastEast
	SetInvisible
	EndMovement

	.balign 4, 0
_007C:
	WalkFastEast
	SetInvisible
	EndMovement
	.balign 4, 0
