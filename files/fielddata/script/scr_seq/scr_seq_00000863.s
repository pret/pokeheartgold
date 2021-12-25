#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000863_00000012 ; 000
	scrdef scr_seq_00000863_0000002F ; 001
	scrdef scr_seq_00000863_00000042 ; 002
	scrdef scr_seq_00000863_00000014 ; 003
	scrdef_end

scr_seq_00000863_00000012:
	end

scr_seq_00000863_00000014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 16, 0
	msgbox 2
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000863_0000002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000863_00000042:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
