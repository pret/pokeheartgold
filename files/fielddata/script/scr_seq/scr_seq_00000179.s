#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000179_0000000A ; 000
	scrdef scr_seq_00000179_0000001D ; 001
	scrdef_end

scr_seq_00000179_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000179_0000001D:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
