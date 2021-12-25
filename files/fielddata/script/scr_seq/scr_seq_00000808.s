#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000808_00000012 ; 000
	scrdef scr_seq_00000808_0000002E ; 001
	scrdef scr_seq_00000808_0000004A ; 002
	scrdef scr_seq_00000808_0000005D ; 003
	scrdef_end

scr_seq_00000808_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 24
	callstd 2052
	releaseall
	end

scr_seq_00000808_0000002E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2048
	releaseall
	end

scr_seq_00000808_0000004A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000808_0000005D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
