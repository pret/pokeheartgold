#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000791_0000001A ; 000
	scrdef scr_seq_00000791_00000036 ; 001
	scrdef scr_seq_00000791_00000049 ; 002
	scrdef scr_seq_00000791_0000005C ; 003
	scrdef scr_seq_00000791_0000006F ; 004
	scrdef scr_seq_00000791_00000082 ; 005
	scrdef_end

scr_seq_00000791_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 20
	callstd 2052
	releaseall
	end

scr_seq_00000791_00000036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000791_00000049:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000791_0000005C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000791_0000006F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000791_00000082:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
