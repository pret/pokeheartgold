#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000751_00000012 ; 000
	scrdef scr_seq_00000751_0000002E ; 001
	scrdef scr_seq_00000751_0000004A ; 002
	scrdef scr_seq_00000751_0000005D ; 003
	scrdef_end

scr_seq_00000751_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 25
	callstd 2052
	releaseall
	end

scr_seq_00000751_0000002E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2048
	releaseall
	end

scr_seq_00000751_0000004A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000751_0000005D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
