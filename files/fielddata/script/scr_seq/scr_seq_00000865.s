#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000865_0000000A ; 000
	scrdef scr_seq_00000865_00000031 ; 001
	scrdef_end

scr_seq_00000865_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_1C2
	gotoif TRUE, scr_seq_00000865_00000026
	msgbox 0
	goto scr_seq_00000865_00000029

scr_seq_00000865_00000026:
	msgbox 1
scr_seq_00000865_00000029:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000865_00000031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
