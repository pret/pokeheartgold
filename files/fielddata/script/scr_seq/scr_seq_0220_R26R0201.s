#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0220_0006 ; 000
	scrdef_end

scr_seq_0220_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0220_0049
	npc_msg 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0220_0049
	npc_msg 2
	waitbutton
	closemsg
scr_seq_0220_0049:
	releaseall
	end
	.balign 4, 0
