#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000844_0000000A ; 000
	scrdef scr_seq_00000844_00000021 ; 001
	scrdef_end

scr_seq_00000844_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_190 0
	scrcmd_132 0, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000844_00000021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
