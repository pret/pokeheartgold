#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000746_00000012 ; 000
	scrdef scr_seq_00000746_00000025 ; 001
	scrdef scr_seq_00000746_00000038 ; 002
	scrdef scr_seq_00000746_00000053 ; 003
	scrdef_end

scr_seq_00000746_00000012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000746_00000025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000746_00000038:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 21, 0
	msgbox 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000746_00000053:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 19, 0
	msgbox 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
