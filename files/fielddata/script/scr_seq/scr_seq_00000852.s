#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000852_0000001A ; 000
	scrdef scr_seq_00000852_00000075 ; 001
	scrdef scr_seq_00000852_00000088 ; 002
	scrdef scr_seq_00000852_0000004C ; 003
	scrdef scr_seq_00000852_00000026 ; 004
	scrdef scr_seq_00000852_00000039 ; 005
	scrdef_end

scr_seq_00000852_0000001A:
	setvar VAR_SPECIAL_x8007, 0
	callstd 2002
	end

scr_seq_00000852_00000026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000852_00000039:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000852_0000004C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4108, 3
	gotoif lt, scr_seq_00000852_0000006A
	msgbox 3
	goto scr_seq_00000852_0000006D

scr_seq_00000852_0000006A:
	msgbox 2
scr_seq_00000852_0000006D:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000852_00000075:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000852_00000088:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
