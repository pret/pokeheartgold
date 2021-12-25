#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000789_00000012 ; 000
	scrdef scr_seq_00000789_00000025 ; 001
	scrdef scr_seq_00000789_00000038 ; 002
	scrdef scr_seq_00000789_0000004B ; 003
	scrdef_end

scr_seq_00000789_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000789_00000025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000789_00000038:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000789_0000004B:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
