#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0198_000A ; 000
	scrdef scr_seq_0198_0012 ; 001
	scrdef_end

scr_seq_0198_000A:
	setvar VAR_UNK_4085, 0
	end

scr_seq_0198_0012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F9
	gotoif TRUE, scr_seq_0198_0030
	npc_msg 0
scr_seq_0198_0028:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0198_0030:
	npc_msg 1
	goto scr_seq_0198_0028
	.balign 4, 0
