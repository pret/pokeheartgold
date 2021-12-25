#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000873_0000000E ; 000
	scrdef scr_seq_00000873_0000004D ; 001
	scrdef scr_seq_00000873_000000BF ; 002
	scrdef_end

scr_seq_00000873_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07B
	gotoif eq, scr_seq_00000873_0000002C
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000873_0000002C:
	checkflag FLAG_UNK_080
	gotoif eq, scr_seq_00000873_00000042
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000873_00000042:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000873_0000004D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_080
	gotoif eq, scr_seq_00000873_0000006B
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000873_0000006B:
	checkflag FLAG_UNK_081
	gotoif eq, scr_seq_00000873_000000AA
	msgbox 4
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 249
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000873_000000B5
	callstd 2008
	setflag FLAG_UNK_081
	closemsg
	releaseall
	end

scr_seq_00000873_000000AA:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000873_000000B5:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000873_000000BF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 83, 0
	msgbox 8
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
