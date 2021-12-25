#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000954_00000006 ; 000
	scrdef_end

scr_seq_00000954_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
