#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000183_0000000A ; 000
	scrdef scr_seq_00000183_0000005E ; 001
	scrdef_end

scr_seq_00000183_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_131
	gotoif eq, scr_seq_00000183_00000049
	msgbox 0
	setvar VAR_SPECIAL_x8004, 224
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000183_00000054
	callstd 2033
	setflag FLAG_UNK_131
scr_seq_00000183_00000049:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000183_00000054:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000183_0000005E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
