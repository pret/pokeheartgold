#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000846_0000000A ; 000
	scrdef scr_seq_00000846_00000056 ; 001
	scrdef_end

scr_seq_00000846_0000000A:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PC_ON
	scrcmd_190 0
	msgbox 0
	closemsg
	scrcmd_377 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000846_0000004B
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_376
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000846_0000004B:
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000846_00000056:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
