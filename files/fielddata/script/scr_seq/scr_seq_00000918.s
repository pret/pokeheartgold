#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000918_00000006 ; 000
	scrdef_end

scr_seq_00000918_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0BD
	gotoif TRUE, scr_seq_00000918_0000008E
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000918_00000040
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000918_00000079
	end

scr_seq_00000918_00000040:
	setvar VAR_SPECIAL_x8004, 446
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000918_00000084
	msgbox 1
	waitbutton
	callstd 2033
	setflag FLAG_UNK_0BD
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000918_00000079:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000918_00000084:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000918_0000008E:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
