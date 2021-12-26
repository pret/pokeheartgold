#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000800_00000006 ; 000
	scrdef_end

scr_seq_00000800_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_158
	gotoif TRUE, scr_seq_00000800_00000071
	msgbox 0
	scrcmd_379 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif eq, scr_seq_00000800_00000045
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif eq, scr_seq_00000800_00000045
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000800_00000045:
	msgbox 2
	setvar VAR_SPECIAL_x8004, 247
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000800_0000007C
	callstd 2033
	setflag FLAG_UNK_158
scr_seq_00000800_00000071:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000800_0000007C:
	callstd 2009
	closemsg
	releaseall
	end
	.balign 4, 0
