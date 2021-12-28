#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0799_T07R0204_0012 ; 000
	scrdef scr_seq_0799_T07R0204_000A ; 001
	scrdef_end

scr_seq_0799_T07R0204_000A:
	setvar VAR_UNK_4125, 0
	end

scr_seq_0799_T07R0204_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
