#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000188_0000000A ; 000
	scrdef scr_seq_00000188_0000001B ; 001
	scrdef_end

scr_seq_00000188_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000188_0000001B:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, 32780
	callstd 2000
	end
	.balign 4, 0
