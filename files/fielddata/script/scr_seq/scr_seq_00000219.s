#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000219_0000000A ; 000
	scrdef scr_seq_00000219_00000046 ; 001
	scrdef_end

scr_seq_00000219_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_282
	scrcmd_436
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000219_00000046:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
