#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000062_00000016 ; 000
	scrdef scr_seq_00000062_00000029 ; 001
	scrdef scr_seq_00000062_0000000E ; 002
	scrdef_end

scr_seq_00000062_0000000E:
	setvar VAR_UNK_4125, 0
	end

scr_seq_00000062_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000062_00000029:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
