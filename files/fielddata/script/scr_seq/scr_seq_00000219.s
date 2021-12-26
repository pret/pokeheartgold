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
	fade_screen 6, 1, 0, 0
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
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
