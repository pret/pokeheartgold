#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000814_00000012 ; 000
	scrdef scr_seq_00000814_00000025 ; 001
	scrdef scr_seq_00000814_00000040 ; 002
	scrdef scr_seq_00000814_0000005B ; 003
	scrdef_end

scr_seq_00000814_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000814_00000025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 190, 0
	msgbox 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000814_00000040:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 190, 0
	msgbox 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000814_0000005B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 190, 0
	msgbox 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
