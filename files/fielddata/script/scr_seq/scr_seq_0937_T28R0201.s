#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0937_000A ; 000
	scrdef scr_seq_0937_001D ; 001
	scrdef_end

scr_seq_0937_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0937_001D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0C6
	gotoif TRUE, scr_seq_0937_003B
	checkflag FLAG_UNK_0C5
	gotoif TRUE, scr_seq_0937_0046
scr_seq_0937_003B:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0937_0046:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
