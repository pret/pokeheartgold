#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0064_D27R0105_0006 ; 000
	scrdef_end

scr_seq_0064_D27R0105_0006:
	scrcmd_609
	lockall
	setvar VAR_UNK_40A7, 1
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0064_D27R0105_0039
	apply_movement 255, scr_seq_0064_D27R0105_0070
	apply_movement 253, scr_seq_0064_D27R0105_007C
	wait_movement
	goto scr_seq_0064_D27R0105_0043

scr_seq_0064_D27R0105_0039:
	apply_movement 255, scr_seq_0064_D27R0105_0070
	wait_movement
scr_seq_0064_D27R0105_0043:
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 221, 0, 15, 3, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0064_D27R0105_006F:
	.byte 0x00

scr_seq_0064_D27R0105_0070:
	.short 19, 1
	.short 69, 1
	.short 254, 0

scr_seq_0064_D27R0105_007C:
	.short 19, 1
	.short 69, 1
	.short 254, 0
	.balign 4, 0
