#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0890_T25R0201_000A ; 000
	scrdef scr_seq_0890_T25R0201_0099 ; 001
	scrdef_end

scr_seq_0890_T25R0201_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_089
	gotoif TRUE, scr_seq_0890_T25R0201_0081
	npc_msg 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0890_T25R0201_0042
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0890_T25R0201_008C
	end

scr_seq_0890_T25R0201_0042:
	npc_msg 1
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0890_T25R0201_0065
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0890_T25R0201_008C
	end

scr_seq_0890_T25R0201_0065:
	setvar VAR_SPECIAL_x8004, 450
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_089
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0890_T25R0201_0081:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0890_T25R0201_008C:
	npc_msg 4
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0890_T25R0201_0099:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
