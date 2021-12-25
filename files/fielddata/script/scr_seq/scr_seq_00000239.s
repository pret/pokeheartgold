#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000239_0000000E ; 000
	scrdef scr_seq_00000239_0000006A ; 001
	scrdef scr_seq_00000239_00000085 ; 002
	scrdef_end

scr_seq_00000239_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_083
	gotoif eq, scr_seq_00000239_00000055
	msgbox 0
	scrcmd_049
	setvar VAR_SPECIAL_x8004, 339
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000239_00000060
	callstd 2033
	setflag FLAG_UNK_083
	goto scr_seq_00000239_00000055

scr_seq_00000239_00000055:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000239_00000060:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000239_0000006A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 12, 0
	msgbox 3
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000239_00000085:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
