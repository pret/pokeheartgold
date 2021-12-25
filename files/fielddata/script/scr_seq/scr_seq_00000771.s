#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000771_00000016 ; 000
	scrdef scr_seq_00000771_00000029 ; 001
	scrdef scr_seq_00000771_0000003C ; 002
	scrdef scr_seq_00000771_00000057 ; 003
	scrdef scr_seq_00000771_00000072 ; 004
	scrdef_end

scr_seq_00000771_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000771_00000029:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000771_0000003C:
	scrcmd_076 54, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end

scr_seq_00000771_00000057:
	scrcmd_076 33, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end

scr_seq_00000771_00000072:
	scrcmd_076 16, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
