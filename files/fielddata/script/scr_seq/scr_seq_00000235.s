#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000235_00000012 ; 000
	scrdef scr_seq_00000235_00000014 ; 001
	scrdef scr_seq_00000235_00000027 ; 002
	scrdef scr_seq_00000235_0000003A ; 003
	scrdef_end

scr_seq_00000235_00000012:
	end

scr_seq_00000235_00000014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000235_00000027:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000235_0000003A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
