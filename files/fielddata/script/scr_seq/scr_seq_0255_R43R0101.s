#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0255_0006 ; 000
	scrdef_end

scr_seq_0255_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, scr_seq_0255_0024
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0255_0024:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
