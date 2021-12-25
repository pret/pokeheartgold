#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000220_00000006 ; 000
	scrdef_end

scr_seq_00000220_00000006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000220_00000049
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000220_00000049
	msgbox 2
	waitbutton
	closemsg
scr_seq_00000220_00000049:
	releaseall
	end
	.balign 4, 0
