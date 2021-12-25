#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000959_00000006 ; 000
	scrdef_end

scr_seq_00000959_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 14, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000959_0000002C
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000959_0000002C:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
