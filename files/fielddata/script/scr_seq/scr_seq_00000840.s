#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000840_0000000E ; 000
	scrdef scr_seq_00000840_00000021 ; 001
	scrdef scr_seq_00000840_0000004A ; 002
	scrdef_end

scr_seq_00000840_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000840_00000021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_00000840_0000003F
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000840_0000003F:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000840_0000004A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 242, 0
	msgbox 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
