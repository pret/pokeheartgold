#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000950_0000000A ; 000
	scrdef scr_seq_00000950_00000016 ; 001
	scrdef_end

scr_seq_00000950_0000000A:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000950_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
