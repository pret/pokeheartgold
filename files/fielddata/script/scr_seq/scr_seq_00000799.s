#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000799_00000012 ; 000
	scrdef scr_seq_00000799_0000000A ; 001
	scrdef_end

scr_seq_00000799_0000000A:
	setvar VAR_UNK_4125, 0
	end

scr_seq_00000799_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
