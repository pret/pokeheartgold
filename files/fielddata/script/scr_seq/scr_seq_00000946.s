#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000946_0000000A ; 000
	scrdef scr_seq_00000946_0000001D ; 001
	scrdef_end

scr_seq_00000946_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000946_0000001D:
	scrcmd_076 147, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
