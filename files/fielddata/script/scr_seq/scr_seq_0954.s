#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0954_0006 ; 000
	scrdef_end

scr_seq_0954_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
