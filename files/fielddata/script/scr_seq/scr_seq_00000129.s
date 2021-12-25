#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000129_00000066 ; 000
	scrdef scr_seq_00000129_0000000A ; 001
	scrdef_end

scr_seq_00000129_0000000A:
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_00000129_00000064
	scrcmd_339 1, 30, 1, 30, 0
	scrcmd_339 2, 30, 1, 30, 0
	scrcmd_339 3, 30, 1, 30, 0
	scrcmd_339 4, 30, 1, 30, 0
	scrcmd_339 5, 30, 1, 30, 0
	scrcmd_339 6, 30, 1, 30, 0
scr_seq_00000129_00000064:
	end

scr_seq_00000129_00000066:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
