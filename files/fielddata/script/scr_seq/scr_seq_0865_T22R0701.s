#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0865_000A ; 000
	scrdef scr_seq_0865_0031 ; 001
	scrdef_end

scr_seq_0865_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_1C2
	gotoif TRUE, scr_seq_0865_0026
	npc_msg 0
	goto scr_seq_0865_0029

scr_seq_0865_0026:
	npc_msg 1
scr_seq_0865_0029:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0865_0031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
