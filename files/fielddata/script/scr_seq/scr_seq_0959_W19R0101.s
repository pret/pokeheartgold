#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0959_0006 ; 000
	scrdef_end

scr_seq_0959_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0959_002C
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0959_002C:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
