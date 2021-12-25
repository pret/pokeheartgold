#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000011_00000025 ; 000
	scrdef scr_seq_00000011_0000000A ; 001
	scrdef_end

scr_seq_00000011_0000000A:
	checkflag FLAG_UNK_0A4
	gotoif eq, scr_seq_00000011_00000017
	end

scr_seq_00000011_00000017:
	setflag FLAG_UNK_305
	hide_person 14
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000011_00000025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 150, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 150, 70, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000011_00000077
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000011_00000073
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_00000011_0000007D
scr_seq_00000011_00000073:
	releaseall
	end

scr_seq_00000011_00000077:
	scrcmd_219
	releaseall
	end

scr_seq_00000011_0000007D:
	setflag FLAG_UNK_16B
	return
	.balign 4, 0
