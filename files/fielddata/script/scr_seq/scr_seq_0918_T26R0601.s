#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0918_T26R0601_0006 ; 000
	scrdef_end

scr_seq_0918_T26R0601_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0BD
	gotoif TRUE, scr_seq_0918_T26R0601_008E
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0918_T26R0601_0040
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0918_T26R0601_0079
	end

scr_seq_0918_T26R0601_0040:
	setvar VAR_SPECIAL_x8004, 446
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0918_T26R0601_0084
	npc_msg 1
	waitbutton
	callstd std_give_item_verbose
	setflag FLAG_UNK_0BD
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0918_T26R0601_0079:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0918_T26R0601_0084:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0918_T26R0601_008E:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
