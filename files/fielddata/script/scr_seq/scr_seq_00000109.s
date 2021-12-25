#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000109_0000000A ; 000
	scrdef scr_seq_00000109_00000032 ; 001
	scrdef_end

scr_seq_00000109_0000000A:
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_00000109_00000048
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CA, 0
	end

scr_seq_00000109_00000032:
	comparevartovalue VAR_UNK_40CA, 1
	gotoif ne, scr_seq_00000109_00000043
	scrcmd_375 255
scr_seq_00000109_00000043:
	end

scr_seq_00000109_00000045:
	.byte 0x00, 0x00, 0x00

scr_seq_00000109_00000048:
	.short 68, 1
	.short 254, 0
	.balign 4, 0
