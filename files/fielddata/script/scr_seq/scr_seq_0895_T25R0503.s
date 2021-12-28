#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0895_T25R0503_0006 ; 000
	scrdef_end

scr_seq_0895_T25R0503_0006:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0895_T25R0503_0038
	wait_movement
	play_se SEQ_SE_GS_N_LINEAR
	wait 40, VAR_SPECIAL_x8004
	scrcmd_074 2142
	scrcmd_722 0, 1, 401, 14, 11
	setvar VAR_UNK_411F, 0
	releaseall
	end

scr_seq_0895_T25R0503_0036:
	.byte 0x00, 0x00

scr_seq_0895_T25R0503_0038:
	.short 15, 7
	.short 12, 2
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
