#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000228_00000006 ; 000
	scrdef_end

scr_seq_00000228_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_06D
	gotoif TRUE, scr_seq_00000228_00000041
	msgbox 0
	setvar VAR_SPECIAL_x8004, 468
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setflag FLAG_UNK_06D
	setvar VAR_UNK_408C, 1
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000228_00000041:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
