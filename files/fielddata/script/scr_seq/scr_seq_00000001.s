#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000001_00000026 ; 000
	scrdef scr_seq_00000001_00000037 ; 001
	scrdef scr_seq_00000001_00000048 ; 002
	scrdef scr_seq_00000001_00000059 ; 003
	scrdef scr_seq_00000001_0000006A ; 004
	scrdef scr_seq_00000001_0000007B ; 005
	scrdef scr_seq_00000001_0000008C ; 006
	scrdef scr_seq_00000001_0000009D ; 007
	scrdef scr_seq_00000001_000000AE ; 008
	scrdef_end

scr_seq_00000001_00000026:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_00000037:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_00000048:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_00000059:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_0000006A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_0000007B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_0000008C:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_0000009D:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000001_000000AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_157
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end
	.balign 4, 0
