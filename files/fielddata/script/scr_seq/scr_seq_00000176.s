#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000176_0000000E ; 000
	scrdef scr_seq_00000176_0000001A ; 001
	scrdef scr_seq_00000176_0000002D ; 002
	scrdef_end

scr_seq_00000176_0000000E:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000176_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000176_0000002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
