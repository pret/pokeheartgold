#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000756_0000000A ; 000
	scrdef scr_seq_00000756_0000001B ; 001
	scrdef_end

scr_seq_00000756_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000756_0000001B:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 32, 0
	msgbox 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
