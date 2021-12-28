#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0220_R26R0201_0006 ; 000
	scrdef_end

scr_seq_0220_R26R0201_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0220_R26R0201_0049
	npc_msg 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0220_R26R0201_0049
	npc_msg 2
	waitbutton
	closemsg
scr_seq_0220_R26R0201_0049:
	releaseall
	end
	.balign 4, 0
