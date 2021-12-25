#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000253_0000000A ; 000
	scrdef scr_seq_00000253_0000000C ; 001
	scrdef_end

scr_seq_00000253_0000000A:
	end

scr_seq_00000253_0000000C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
