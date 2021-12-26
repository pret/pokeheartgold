#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000198_0000000A ; 000
	scrdef scr_seq_00000198_00000012 ; 001
	scrdef_end

scr_seq_00000198_0000000A:
	setvar VAR_UNK_4085, 0
	end

scr_seq_00000198_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F9
	gotoif TRUE, scr_seq_00000198_00000030
	msgbox 0
scr_seq_00000198_00000028:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000198_00000030:
	msgbox 1
	goto scr_seq_00000198_00000028
	.balign 4, 0
