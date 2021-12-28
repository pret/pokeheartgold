#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0739_T01R0202_000A ; 000
	scrdef scr_seq_0739_T01R0202_001B ; 001
	scrdef_end

scr_seq_0739_T01R0202_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0739_T01R0202_001B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
