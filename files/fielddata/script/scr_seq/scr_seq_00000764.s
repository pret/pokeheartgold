#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000764_0000000E ; 000
	scrdef scr_seq_00000764_00000021 ; 001
	scrdef scr_seq_00000764_00000034 ; 002
	scrdef_end

scr_seq_00000764_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000764_00000021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000764_00000034:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 50, 0
	msgbox 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
