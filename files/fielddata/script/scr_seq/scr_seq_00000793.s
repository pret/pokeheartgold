#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000793_00000036 ; 000
	scrdef scr_seq_00000793_0000001A ; 001
	scrdef scr_seq_00000793_00000052 ; 002
	scrdef scr_seq_00000793_00000065 ; 003
	scrdef scr_seq_00000793_00000078 ; 004
	scrdef scr_seq_00000793_0000008B ; 005
	scrdef_end

scr_seq_00000793_0000001A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 22
	callstd 2052
	releaseall
	end

scr_seq_00000793_00000036:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 23
	callstd 2052
	releaseall
	end

scr_seq_00000793_00000052:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000793_00000065:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000793_00000078:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000793_0000008B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
