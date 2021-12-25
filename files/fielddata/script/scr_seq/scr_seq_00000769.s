#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000769_00000012 ; 000
	scrdef scr_seq_00000769_0000001E ; 001
	scrdef scr_seq_00000769_00000031 ; 002
	scrdef scr_seq_00000769_00000044 ; 003
	scrdef_end

scr_seq_00000769_00000012:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000769_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000769_00000031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000769_00000044:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
