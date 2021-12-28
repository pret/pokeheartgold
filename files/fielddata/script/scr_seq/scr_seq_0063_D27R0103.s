#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0063_D27R0103_000A ; 000
	scrdef scr_seq_0063_D27R0103_0040 ; 001
	scrdef_end

scr_seq_0063_D27R0103_000A:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_0063_D27R0103_0038
	wait 1, VAR_SPECIAL_x800C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40A7, 0
	end


scr_seq_0063_D27R0103_0038:
	.short 68, 1
	.short 254, 0
scr_seq_0063_D27R0103_0040:
	comparevartovalue VAR_UNK_40A7, 1
	gotoif ne, scr_seq_0063_D27R0103_0051
	scrcmd_375 255
scr_seq_0063_D27R0103_0051:
	end
	.balign 4, 0
