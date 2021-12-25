#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000851_00000012 ; 000
	scrdef scr_seq_00000851_00000073 ; 001
	scrdef scr_seq_00000851_0000004A ; 002
	scrdef scr_seq_00000851_0000002E ; 003
	scrdef_end

scr_seq_00000851_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 0
	callstd 2048
	releaseall
	end

scr_seq_00000851_0000002E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 0
	callstd 2052
	releaseall
	end

scr_seq_00000851_0000004A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4108, 4
	gotoif lt, scr_seq_00000851_00000068
	msgbox 1
	goto scr_seq_00000851_0000006B

scr_seq_00000851_00000068:
	msgbox 0
scr_seq_00000851_0000006B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000851_00000073:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
