#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000744_00000012 ; 000
	scrdef scr_seq_00000744_0000001E ; 001
	scrdef scr_seq_00000744_00000047 ; 002
	scrdef scr_seq_00000744_0000005A ; 003
	scrdef_end

scr_seq_00000744_00000012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000744_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_129
	gotoif lt, scr_seq_00000744_0000003C
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000744_0000003C:
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000744_00000047:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000744_0000005A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
