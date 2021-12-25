#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000854_0000000E ; 000
	scrdef scr_seq_00000854_00000010 ; 001
	scrdef scr_seq_00000854_00000023 ; 002
	scrdef_end

scr_seq_00000854_0000000E:
	end

scr_seq_00000854_00000010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000854_00000023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
