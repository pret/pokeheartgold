#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000255_00000006 ; 000
	scrdef_end

scr_seq_00000255_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif eq, scr_seq_00000255_00000024
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000255_00000024:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
