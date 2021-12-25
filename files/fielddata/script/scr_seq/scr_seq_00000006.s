#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000006_0000002D ; 000
	scrdef scr_seq_00000006_0000000A ; 001
	scrdef_end

scr_seq_00000006_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_18A
	msgbox 1
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 27
	callstd 2052
	clearflag FLAG_UNK_18A
	releaseall
	end

scr_seq_00000006_0000002D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
