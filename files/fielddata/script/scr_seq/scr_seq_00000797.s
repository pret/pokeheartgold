#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000797_00000016 ; 000
	scrdef scr_seq_00000797_0000000E ; 001
	scrdef scr_seq_00000797_00000027 ; 002
	scrdef_end

scr_seq_00000797_0000000E:
	setvar VAR_UNK_4125, 0
	end

scr_seq_00000797_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000797_00000027:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
