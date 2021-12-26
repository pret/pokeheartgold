#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000233_00000012 ; 000
	scrdef scr_seq_00000233_0000001E ; 001
	scrdef scr_seq_00000233_000000AC ; 002
	scrdef scr_seq_00000233_0000012C ; 003
	scrdef_end

scr_seq_00000233_00000012:
	setvar VAR_SPECIAL_x8007, 3
	callstd 2002
	end

scr_seq_00000233_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_075
	gotoif TRUE, scr_seq_00000233_0000008C
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000233_00000058
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000233_000000A1
	end

scr_seq_00000233_00000058:
	setvar VAR_SPECIAL_x8004, 445
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000233_00000097
	callstd 2033
	setflag FLAG_UNK_075
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000233_0000008C:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000233_00000097:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000233_000000A1:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000233_000000AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_174
	gotoif TRUE, scr_seq_00000233_00000121
	msgbox 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000233_000000E0
	msgbox 8
	goto scr_seq_00000233_000000E3

scr_seq_00000233_000000E0:
	msgbox 9
scr_seq_00000233_000000E3:
	setvar VAR_SPECIAL_x8004, 494
	setvar VAR_SPECIAL_x8005, 2
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000233_00000117
	callstd 2033
	msgbox 10
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_174
	end

scr_seq_00000233_00000117:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000233_00000121:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000233_0000012C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
