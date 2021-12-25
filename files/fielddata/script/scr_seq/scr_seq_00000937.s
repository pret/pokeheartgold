#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000937_0000000A ; 000
	scrdef scr_seq_00000937_0000001D ; 001
	scrdef_end

scr_seq_00000937_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000937_0000001D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0C6
	gotoif eq, scr_seq_00000937_0000003B
	checkflag FLAG_UNK_0C5
	gotoif eq, scr_seq_00000937_00000046
scr_seq_00000937_0000003B:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000937_00000046:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
