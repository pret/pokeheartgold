#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000848_00000006 ; 000
	scrdef_end

scr_seq_00000848_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2E5
	gotoif eq, scr_seq_00000848_00000035
	comparevartovalue VAR_UNK_4108, 1
	gotoif ge, scr_seq_00000848_00000044
	scrcmd_190 0
	scrcmd_132 0, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000848_00000035:
	scrcmd_190 0
	scrcmd_132 2, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000848_00000044:
	scrcmd_190 0
	scrcmd_132 4, 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
