#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000222_00000006 ; 000
	scrdef_end

scr_seq_00000222_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E9
	gotoif eq, scr_seq_00000222_0000006A
	msgbox 0
	scrcmd_529 16384
	scrcmd_382 32780, 16384
	comparevartovalue VAR_SPECIAL_x800C, 150
	gotoif ge, scr_seq_00000222_0000003E
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000222_0000003E:
	msgbox 1
	setvar VAR_SPECIAL_x8004, 364
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000222_00000075
	callstd 2033
	setflag FLAG_UNK_0E9
scr_seq_00000222_0000006A:
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000222_00000075:
	callstd 2009
	closemsg
	releaseall
	end
	.balign 4, 0
