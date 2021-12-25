#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000929_0000000A ; 000
	scrdef scr_seq_00000929_00000098 ; 001
	scrdef_end

scr_seq_00000929_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A3
	gotoif eq, scr_seq_00000929_00000078
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000929_00000044
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000929_0000008D
	end

scr_seq_00000929_00000044:
	msgbox 1
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 471
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000929_00000083
	callstd 2033
	setflag FLAG_UNK_0A3
	goto scr_seq_00000929_00000078

scr_seq_00000929_00000078:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000929_00000083:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000929_0000008D:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000929_00000098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000929_000000C7
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000929_000000F9
	end

scr_seq_00000929_000000C7:
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000929_000000EE
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000929_000000F9
	end

scr_seq_00000929_000000EE:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000929_000000F9:
	closemsg
	releaseall
	end
	.balign 4, 0
