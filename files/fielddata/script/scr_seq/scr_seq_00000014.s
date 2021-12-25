#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000014_00000025 ; 000
	scrdef scr_seq_00000014_0000000A ; 001
	scrdef_end

scr_seq_00000014_0000000A:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000014_00000017
	end

scr_seq_00000014_00000017:
	setflag FLAG_UNK_306
	scrcmd_101 2
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000014_00000025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 144, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 144, 50, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000014_00000077
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000014_00000073
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_00000014_0000007D
scr_seq_00000014_00000073:
	releaseall
	end

scr_seq_00000014_00000077:
	scrcmd_219
	releaseall
	end

scr_seq_00000014_0000007D:
	setflag FLAG_UNK_16C
	return
	.balign 4, 0
