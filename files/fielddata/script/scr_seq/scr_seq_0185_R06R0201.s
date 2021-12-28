#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0185_R06R0201_0006 ; 000
	scrdef_end

scr_seq_0185_R06R0201_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0185_R06R0201_0024
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0185_R06R0201_0024:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
