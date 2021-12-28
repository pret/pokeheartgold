#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0950_T31PC0101_000A ; 000
	scrdef scr_seq_0950_T31PC0101_0016 ; 001
	scrdef_end

scr_seq_0950_T31PC0101_000A:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_0950_T31PC0101_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
