#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000016_00000016 ; 000
	scrdef scr_seq_00000016_00000018 ; 001
	scrdef scr_seq_00000016_0000002B ; 002
	scrdef scr_seq_00000016_0000003E ; 003
	scrdef scr_seq_00000016_00000051 ; 004
	scrdef_end

scr_seq_00000016_00000016:
	end

scr_seq_00000016_00000018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000016_0000002B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000016_0000003E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000016_00000051:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
